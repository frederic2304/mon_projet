-- Lokafête : schéma en 3 parties. Exécuter les parties DANS L'ORDRE (1, puis 2, puis 3).
-- PARTIE 3 / 3 : sécurité (fonctions et règles RLS)

-- =====================================================================
-- Sécurité : chaque prestataire ne voit que les données de son organisation
-- =====================================================================

-- Organisations dont l'utilisateur connecté fait partie
create function mes_organisations() returns setof uuid
language sql stable security definer set search_path = public as $$
  select organisation_id from equipe where user_id = auth.uid() and actif
$$;

-- L'utilisateur est-il propriétaire ou admin de cette organisation ?
create function est_admin(org uuid) returns boolean
language sql stable security definer set search_path = public as $$
  select exists (
    select 1 from equipe
    where organisation_id = org and user_id = auth.uid() and actif
      and role in ('proprietaire', 'admin')
  )
$$;

-- Création d'une organisation : le créateur en devient propriétaire, avec 30 jours d'essai
create function creer_organisation(p_nom text, p_nom_utilisateur text)
returns uuid language plpgsql security definer set search_path = public as $$
declare v_org uuid;
begin
  if auth.uid() is null then raise exception 'Connexion requise'; end if;
  insert into organisations (nom) values (p_nom) returning id into v_org;
  insert into equipe (organisation_id, user_id, nom, role) values (v_org, auth.uid(), p_nom_utilisateur, 'proprietaire');
  insert into abonnements (organisation_id) values (v_org);
  return v_org;
end $$;

-- Quantité d'un article déjà réservée sur une période (cérémonies confirmées dont les dates se chevauchent)
create function quantite_reservee(p_article uuid, p_debut timestamptz, p_fin timestamptz, p_sauf_ceremonie uuid default null)
returns integer language sql stable security invoker set search_path = public as $$
  select coalesce(sum(l.quantite), 0)::integer
  from lignes_devis l
  join devis d on d.id = l.devis_id and d.statut = 'accepte'
  join ceremonies c on c.id = d.ceremonie_id and c.statut <> 'annulee'
  where l.article_id = p_article
    and c.debut < p_fin and c.fin > p_debut
    and (p_sauf_ceremonie is null or c.id <> p_sauf_ceremonie)
$$;

alter table organisations       enable row level security;
alter table equipe              enable row level security;
alter table clients             enable row level security;
alter table articles            enable row level security;
alter table ceremonies          enable row level security;
alter table devis               enable row level security;
alter table lignes_devis        enable row level security;
alter table paiements           enable row level security;
alter table depenses            enable row level security;
alter table affectations        enable row level security;
alter table mouvements_materiel enable row level security;
alter table photos              enable row level security;
alter table abonnements         enable row level security;

-- Organisation : lecture par les membres, modification par les admins
create policy "membres lisent" on organisations for select using (id in (select mes_organisations()));
create policy "admins modifient" on organisations for update using (est_admin(id));

-- Équipe : lecture par les membres, gestion par les admins
create policy "membres lisent" on equipe for select using (organisation_id in (select mes_organisations()));
create policy "admins ajoutent" on equipe for insert with check (est_admin(organisation_id));
create policy "admins modifient" on equipe for update using (est_admin(organisation_id));
create policy "admins suppriment" on equipe for delete using (est_admin(organisation_id) and role <> 'proprietaire');

-- Abonnement : lecture seule pour les membres (modifié côté serveur après paiement)
create policy "membres lisent" on abonnements for select using (organisation_id in (select mes_organisations()));

-- Données métier : accès complet pour les membres de l'organisation
do $$
declare t text;
begin
  foreach t in array array['clients','articles','ceremonies','devis','lignes_devis','paiements','depenses','affectations','mouvements_materiel','photos']
  loop
    execute format('create policy "membres gèrent" on %I for all using (organisation_id in (select mes_organisations())) with check (organisation_id in (select mes_organisations()))', t);
  end loop;
end $$;
