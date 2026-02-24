-- =============================================
-- SCHÈME BASE DE DONNÉES SUPABASE - POLAR APP
-- Exécuter ce script dans le SQL Editor de Supabase
-- =============================================

-- Table profiles (extension utilisateurs)
create table if not exists profiles (
  id uuid references auth.users on delete cascade primary key,
  display_name text,
  avatar_url text,
  created_at timestamptz default now()
);

-- Table favoris
create table if not exists favorites (
  id uuid default gen_random_uuid() primary key,
  user_id uuid references auth.users on delete cascade not null,
  movie_id text not null,
  notes text,
  added_at timestamptz default now(),
  unique(user_id, movie_id)
);

-- Table annotations
create table if not exists annotations (
  id uuid default gen_random_uuid() primary key,
  user_id uuid references auth.users on delete cascade not null,
  movie_id text not null,
  scene_id text not null,
  content text,
  hotspots jsonb,
  created_at timestamptz default now()
);

-- Table préférences
create table if not exists preferences (
  id uuid default gen_random_uuid() primary key,
  user_id uuid references auth.users on delete cascade unique not null,
  favorite_genres text[] default '{}',
  favorite_directors text[] default '{}'
);

-- =============================================
-- ROW LEVEL SECURITY (RLS)
-- =============================================

alter table profiles enable row level security;
alter table favorites enable row level security;
alter table annotations enable row level security;
alter table preferences enable row level security;

-- Politiques d'accès pour profiles
drop policy if exists "Users can view own profile" on profiles;
drop policy if exists "Users can update own profile" on profiles;
create policy "Users can view own profile" on profiles for select using (auth.uid() = id);
create policy "Users can update own profile" on profiles for update using (auth.uid() = id);

-- Politiques d'accès pour favorites
drop policy if exists "Users can manage own favorites" on favorites;
create policy "Users can manage own favorites" on favorites for all using (auth.uid() = user_id);

-- Politiques d'accès pour annotations
drop policy if exists "Users can manage own annotations" on annotations;
create policy "Users can manage own annotations" on annotations for all using (auth.uid() = user_id);

-- Politiques d'accès pour preferences
drop policy if exists "Users can manage own preferences" on preferences;
create policy "Users can manage own preferences" on preferences for all using (auth.uid() = user_id);

-- =============================================
-- TRIGGER pour création automatique du profile
-- =============================================

create or replace function public.handle_new_user()
returns trigger as $$
begin
  insert into public.profiles (id, display_name)
  values (new.id, new.raw_user_meta_data->>'displayName');
  insert into public.preferences (user_id)
  values (new.id);
  return new;
end;
$$ language plpgsql security definer;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();

-- =============================================
-- VÉRIFICATION
-- =============================================
select 'Tables created successfully!' as status;
