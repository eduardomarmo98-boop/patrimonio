# Brandão & Marmo — Controle de Patrimônio

PWA interno com sincronização em tempo real. Frontend no GitHub Pages, banco no Supabase. 100% gratuito.

## Setup (uma vez)

### 1. Banco — Supabase

1. Crie projeto em **supabase.com** (região São Paulo).
2. **SQL Editor → New query** → cole `supabase-schema.sql` → **Run**.
3. **Project Settings → API Keys** → copie `Project URL` e `Publishable key`.
4. No `index.html`, ajuste no topo do `<script>`:
   ```js
   const SUPABASE_URL = 'https://...sua-url...supabase.co';
   const SUPABASE_KEY = 'sb_publishable_...';
   ```
5. Em **Database → Backups**, ative backups diários.

### 2. Hospedagem — GitHub Pages

1. Repositório no GitHub (privado se quiser) → suba o conteúdo desta pasta.
2. **Settings → Pages → Source: Deploy from branch `main` / root** → salvar.
3. Em ~2 min: `https://<usuario>.github.io/<repo>/`

## Acessos iniciais

| Perfil | E-mail | Senha |
|---|---|---|
| Diretoria | diretoria@brandaomarmo.com | TrocarSenha@123 |
| Adm. TI | ti@brandaomarmo.com | TrocarSenha@123 |
| Adm. Obras | obras@brandaomarmo.com | TrocarSenha@123 |

Entre como Diretoria e troque as 3 senhas em **Mais → Usuários** antes de liberar.

## Atualizar o app

Edite o `index.html`, faça push pro GitHub. Os dados no Supabase ficam intactos.

## Instalar como app no celular

- Android (Chrome): menu ⋮ → "Instalar aplicativo"
- iOS (Safari): compartilhar → "Adicionar à Tela de Início"

## Arquivos

- `index.html` — aplicação
- `supabase-schema.sql` — rodar 1x no Supabase
- `manifest.json`, `icon-*.png`, `icon.svg`, `favicon.ico` — PWA
- `.nojekyll` — para GitHub Pages
- `server.js`, `package.json` — só para Railway/Render (ignorar no GitHub Pages)

## Observações

- Estado guardado em uma linha JSON na tabela `app_state`. Se 2 admins editam simultaneamente, vence a última gravação.
- Senhas em texto puro (uso interno). Migrar para Supabase Auth depois se precisar.
