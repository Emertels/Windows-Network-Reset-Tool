# Ferramenta de Redefinição de Rede do Windows

**Versão:** 1.0.0  
**Idiomas da interface:** PT-BR, inglês, espanhol, francês, alemão, italiano, japonês, coreano, chinês simplificado e russo. O programa detecta a região do Windows automaticamente e usa PT-BR para regiões não listadas.

## O que faz

Fluxo com elevação para renovar DNS, DHCP, Winsock e configurações TCP/IP.

## Arquivos

Network-Reset-Tool.bat (arquivo único; não depende de um script PS1 separado)

## Como usar

1. Baixe ou clone o repositório completo.
2. Execute `Network-Reset-Tool.bat`. Aceite o UAC quando solicitado; a redefinição pode interromper temporariamente a conexão.

## Requisitos

Windows 10 ou Windows 11, PowerShell 5.1 integrado para solicitar a elevação do UAC e privilégios de administrador. Os comandos de rede são executados pelo próprio Batch; winget não é necessário.

## Segurança e limitações

O projeto não deve apagar dados pessoais, credenciais ou conteúdo fora dos caminhos definidos pela ferramenta. A disponibilidade de comandos e recursos depende da edição e versão do Windows. Revise CHANGELOG.md antes de atualizar.

## Desenvolvimento

Consulte AGENTS-PT-BR.md e AGENTS-EN.md. O idioma padrão da interface é detectado pela cultura do Windows; quando ela não for compatível, use PT-BR como fallback.

## Idiomas, finalidade e dicas

A interface está disponível em PT-BR, inglês, espanhol, francês, alemão, italiano, japonês, coreano, chinês simplificado e russo. O idioma é detectado pela região do Windows; PT-BR é o fallback.

O procedimento limpa o cache DNS, libera e renova DHCP e redefine Winsock/TCP/IP. Anote IP fixo, DNS personalizado e configurações de VPN antes de executar. O script não reinicia o computador automaticamente; reinicie para concluir a redefinição.

### Idiomas disponíveis / Available languages

| Idioma | Código | Indicação |
|---|---|---|
| Português (Brasil) | pt-BR | Brasil |
| Inglês | en | Sistemas em inglês |
| Espanhol | es | Sistemas em espanhol |
| Francês | fr | Sistemas em francês |
| Alemão | de | Sistemas em alemão |
| Italiano | it | Sistemas em italiano |
| Japonês | ja | Sistemas em japonês |
| Coreano | ko | Sistemas em coreano |
| Chinês simplificado | zh-CN | Sistemas em chinês simplificado |
| Russo | ru | Sistemas em russo |





## Sobre Emerson Teles

Emerson Teles (Emertels) desenvolve ferramentas para Windows, automação, emulação e localização de software. Veja os projetos e acompanhe os canais oficiais:

- [Site oficial](https://emertels.github.io) · [GitHub](https://github.com/Emertels) · [Discord](https://emertels.github.io/discord)
- [YouTube](https://www.youtube.com/@emersonteles2379) · [X](https://x.com/emertels) · [Telegram](https://t.me/apksmodsandroid) · [Ko-fi](https://ko-fi.com/emertels)

### Outros projetos

- [AI-Chat-Vault](https://github.com/Emertels/AI-Chat-Vault) — backup portátil e recuperação de conversas locais de ferramentas de IA.
- [Suite-Emuladores](https://github.com/Emertels/Suite-Emuladores) — gerenciamento de download e atualização de emuladores e frontends no Windows.
- [Microsoft-Photos-Fix](https://github.com/Emertels/Microsoft-Photos-Fix) — correção de inicialização e papel de parede do app Fotos do Windows.
- [PSBBN-Translator](https://github.com/Emertels/PSBBN-Translator) — localização do PSBBN Definitive Project em 40 idiomas.
- [GPU-Tweak-III-Traducao-PTBR](https://github.com/Emertels/GPU-Tweak-III-Traducao-PTBR), [Cursor-Traducao-PTBR](https://github.com/Emertels/Cursor-Traducao-PTBR), [CodexRouter-Traducao-PTBR](https://github.com/Emertels/CodexRouter-Traducao-PTBR), [Antigravity-Traducao-PTBR](https://github.com/Emertels/Antigravity-Traducao-PTBR) e [ZCode-Traducao-PTBR](https://github.com/Emertels/ZCode-Traducao-PTBR) — projetos de localização para PT-BR.
- [Silent-Hill-Homecoming-Traducao-PTBR](https://github.com/Emertels/Silent-Hill-Homecoming-Traducao-PTBR) — tradução e revisão para PC.

