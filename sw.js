// Service worker mínimo — apenas declara o controle para o navegador
// reconhecer o app como PWA (modo standalone no Android).
self.addEventListener('install', (e) => { self.skipWaiting(); });
self.addEventListener('activate', (e) => { e.waitUntil(self.clients.claim()); });
self.addEventListener('fetch', (e) => {
  // Passa direto para a rede; sem cache para sempre pegar versão atualizada.
});
