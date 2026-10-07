-- Lokafête : schéma en 3 parties. Exécuter les parties DANS L'ORDRE (1, puis 2, puis 3).
-- PARTIE 2 / 3 : cérémonies, devis, paiements, dépenses, équipe, matériel, photos, abonnements, index

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

