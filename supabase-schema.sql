-- =============================================================
-- Brandão & Marmo — Controle de Patrimônio
-- Schema Supabase (rodar UMA VEZ no SQL Editor do projeto)
-- =============================================================

-- 1) Tabela única que guarda todo o estado do app como JSON
create table if not exists public.app_state (
  id smallint primary key default 1,
  data jsonb not null,
  updated_at timestamptz not null default now(),
  constraint app_state_singleton check (id = 1)
);

-- 2) Habilita Row Level Security
alter table public.app_state enable row level security;

-- 3) Políticas: leitura e escrita liberadas para a chave pública (anon).
--    Apropriado para uso interno corporativo onde a URL do app não é divulgada.
--    Para endurecer depois, troque por políticas baseadas em auth.uid().
drop policy if exists "anon select app_state"  on public.app_state;
drop policy if exists "anon insert app_state"  on public.app_state;
drop policy if exists "anon update app_state"  on public.app_state;

create policy "anon select app_state"
  on public.app_state for select
  to anon
  using (true);

create policy "anon insert app_state"
  on public.app_state for insert
  to anon
  with check (true);

create policy "anon update app_state"
  on public.app_state for update
  to anon
  using (true)
  with check (true);

-- 4) Habilita Realtime (notifica todos os clientes conectados)
alter table public.app_state replica identity full;
alter publication supabase_realtime add table public.app_state;

-- 5) Linha inicial vazia (será sobrescrita pelo seed do app na primeira execução)
insert into public.app_state (id, data) values (1, '{}'::jsonb)
  on conflict (id) do nothing;
