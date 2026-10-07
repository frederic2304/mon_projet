-- Lokafête : schéma en 3 parties. Exécuter les parties DANS L'ORDRE (1, puis 2, puis 3).
-- PARTIE 1 / 3 : types, organisations, équipe, clients, articles


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

