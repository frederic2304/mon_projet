-- =====================================================================
-- Lokafête : schéma de la base de données (Supabase / PostgreSQL)
-- À exécuter dans Supabase : SQL Editor > New query > coller > Run
-- Montants en FCFA, stockés en entiers (pas de centimes).
-- =====================================================================

-- ---------- Types ----------------------------------------------------
create type role_equipe      as enum ('proprietaire', 'admin', 'membre');
create type type_article     as enum ('prestation', 'materiel');
create type type_ceremonie   as enum ('mariage', 'funerailles', 'bapteme', 'communion', 'anniversaire', 'entreprise', 'autre');
create type statut_ceremonie as enum ('demande', 'devis_envoye', 'confirmee', 'terminee', 'annulee');
create type statut_devis     as enum ('brouillon', 'envoye', 'accepte', 'refuse');
create type type_paiement    as enum ('avance', 'solde', 'caution', 'remboursement');
create type moyen_paiement   as enum ('mtn_momo', 'moov_money', 'especes', 'virement', 'autre');
create type statut_paiement  as enum ('en_attente', 'recu', 'echoue', 'rembourse');
create type type_mouvement   as enum ('sortie', 'retour');
create type etat_materiel    as enum ('bon', 'abime', 'perdu');
create type offre_abonnement as enum ('essai', 'essentiel', 'pro');
create type statut_abonnement as enum ('actif', 'expire', 'annule');

-- ---------- Organisations (un compte prestataire) --------------------
create table organisations (
  id          uuid primary key default gen_random_uuid(),
  nom         text not null,
  metiers     text[] not null default '{}',          -- ex. {decoration, location, traiteur}
  telephone   text,
  whatsapp    text,
  email       text,
  ville       text,
  adresse     text,
  logo_url    text,
  ifu         text,                                    -- pour les factures
  created_at  timestamptz not null default now()
);

-- ---------- Équipe (avec ou sans compte de connexion) ----------------
create table equipe (
  id              uuid primary key default gen_random_uuid(),
  organisation_id uuid not null references organisations(id) on delete cascade,
  user_id         uuid references auth.users(id) on delete set null,  -- null = membre sans accès à l'app (journalier…)
  nom             text not null,
  telephone       text,
  role            role_equipe not null default 'membre',
  actif           boolean not null default true,
  created_at      timestamptz not null default now(),
  unique (organisation_id, user_id)
);

-- ---------- Clients du prestataire -----------------------------------
create table clients (
  id              uuid primary key default gen_random_uuid(),
  organisation_id uuid not null references organisations(id) on delete cascade,
  nom             text not null,
  telephone       text,
  whatsapp        text,
  email           text,
  ville           text,
  notes           text,
  created_at      timestamptz not null default now()
);

-- ---------- Catalogue : prestations et matériel ----------------------
create table articles (
  id              uuid primary key default gen_random_uuid(),
  organisation_id uuid not null references organisations(id) on delete cascade,
  type            type_article not null,
  nom             text not null,                       -- ex. « Chaise housse blanche », « Décoration blanc et or »
  description     text,
  prix_unitaire   integer not null default 0 check (prix_unitaire >= 0),
  unite           text not null default 'unité',       -- unité, jour, invité, forfait…
  quantite_stock  integer check (quantite_stock >= 0), -- matériel uniquement
  caution_unitaire integer not null default 0 check (caution_unitaire >= 0),
  photo_url       text,
  actif           boolean not null default true,
  created_at      timestamptz not null default now()
);

-- ---------- Cérémonies -------------------------------------------------
create table ceremonies (
  id              uuid primary key default gen_random_uuid(),
  organisation_id uuid not null references organisations(id) on delete cascade,
  client_id       uuid references clients(id) on delete set null,
  titre           text not null,                       -- ex. « Mariage famille A. »
  type            type_ceremonie not null default 'autre',
  debut           timestamptz not null,
  fin             timestamptz not null,
  lieu            text,
  ville           text,
  nb_invites      integer check (nb_invites >= 0),
  theme           text,
  couleurs        text,
  notes           text,
  statut          statut_ceremonie not null default 'demande',
  created_by      uuid references auth.users(id) on delete set null,
  created_at      timestamptz not null default now(),
  check (fin >= debut)
);

-- ---------- Devis et factures ----------------------------------------
create table devis (
  id              uuid primary key default gen_random_uuid(),
  organisation_id uuid not null references organisations(id) on delete cascade,
  ceremonie_id    uuid not null references ceremonies(id) on delete cascade,
  numero          text not null,                       -- ex. D-2026-0012
  statut          statut_devis not null default 'brouillon',
  remise          integer not null default 0 check (remise >= 0),
  valable_jusqu_au date,
  pdf_url         text,
  envoye_le       timestamptz,
  created_at      timestamptz not null default now(),
  unique (organisation_id, numero)
);

create table lignes_devis (
  id              uuid primary key default gen_random_uuid(),
  organisation_id uuid not null references organisations(id) on delete cascade,
  devis_id        uuid not null references devis(id) on delete cascade,
  article_id      uuid references articles(id) on delete set null,  -- null = ligne libre
  libelle         text not null,
  quantite        integer not null default 1 check (quantite > 0),
  prix_unitaire   integer not null check (prix_unitaire >= 0),
  position        integer not null default 0
);

-- Total d'un devis = somme des lignes - remise
create view totaux_devis with (security_invoker = true) as
select d.id as devis_id, d.organisation_id, d.ceremonie_id,
       coalesce(sum(l.quantite * l.prix_unitaire), 0) - d.remise as total
from devis d left join lignes_devis l on l.devis_id = d.id
group by d.id;

-- ---------- Paiements --------------------------------------------------
create table paiements (
  id                uuid primary key default gen_random_uuid(),
  organisation_id   uuid not null references organisations(id) on delete cascade,
  ceremonie_id      uuid not null references ceremonies(id) on delete cascade,
  type              type_paiement not null,
  montant           integer not null check (montant > 0),
  moyen             moyen_paiement not null,
  statut            statut_paiement not null default 'en_attente',
  reference_externe text,                              -- identifiant de la transaction FedaPay / KkiaPay
  lien_paiement     text,
  recu_le           timestamptz,
  created_at        timestamptz not null default now()
);

-- ---------- Dépenses (pour le bénéfice par cérémonie) ---------------
create table depenses (
  id              uuid primary key default gen_random_uuid(),
  organisation_id uuid not null references organisations(id) on delete cascade,
  ceremonie_id    uuid references ceremonies(id) on delete set null,
  libelle         text not null,                       -- fleurs, transport, journaliers…
  montant         integer not null check (montant > 0),
  date            date not null default current_date,
  created_at      timestamptz not null default now()
);

-- ---------- Affectations de l'équipe --------------------------------
create table affectations (
  id              uuid primary key default gen_random_uuid(),
  organisation_id uuid not null references organisations(id) on delete cascade,
  ceremonie_id    uuid not null references ceremonies(id) on delete cascade,
  equipe_id       uuid not null references equipe(id) on delete cascade,
  tache           text,                                -- montage, service, démontage…
  heure           timestamptz,
  unique (ceremonie_id, equipe_id)
);

-- ---------- Bons de sortie et de retour du matériel -----------------
create table mouvements_materiel (
  id              uuid primary key default gen_random_uuid(),
  organisation_id uuid not null references organisations(id) on delete cascade,
  ceremonie_id    uuid not null references ceremonies(id) on delete cascade,
  article_id      uuid not null references articles(id) on delete restrict,
  type            type_mouvement not null,
  quantite        integer not null check (quantite > 0),
  etat            etat_materiel not null default 'bon',
  note            text,
  signe_par       text,                                -- nom de la personne qui a signé
  created_at      timestamptz not null default now()
);

-- ---------- Photos (portfolio) ---------------------------------------
create table photos (
  id              uuid primary key default gen_random_uuid(),
  organisation_id uuid not null references organisations(id) on delete cascade,
  ceremonie_id    uuid references ceremonies(id) on delete set null,
  chemin_stockage text not null,                       -- chemin dans Supabase Storage
  legende         text,
  publique        boolean not null default false,      -- visible dans le portfolio partageable
  created_at      timestamptz not null default now()
);

-- ---------- Abonnement Lokafête du prestataire ----------------------
create table abonnements (
  id              uuid primary key default gen_random_uuid(),
  organisation_id uuid not null references organisations(id) on delete cascade,
  offre           offre_abonnement not null default 'essai',
  statut          statut_abonnement not null default 'actif',
  debut           date not null default current_date,
  fin             date not null default (current_date + 30),
  created_at      timestamptz not null default now()
);

-- ---------- Index ---------------------------------------------------
create index on equipe (user_id);
create index on clients (organisation_id);
create index on articles (organisation_id);
create index on ceremonies (organisation_id, debut);
create index on devis (ceremonie_id);
create index on lignes_devis (devis_id);
create index on paiements (ceremonie_id);
create index on depenses (organisation_id, date);
create index on affectations (ceremonie_id);
create index on mouvements_materiel (ceremonie_id);
create index on photos (organisation_id);

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
