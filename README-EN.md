# Windows Network Reset Tool

**Version:** 1.0.0  
**Interface languages:** Brazilian Portuguese, English, Spanish, French, German, Italian, Japanese, Korean, Simplified Chinese, and Russian. The program detects Windows UI culture and uses Brazilian Portuguese for unsupported locales.

## What it does

One-click elevated workflow to refresh DNS, DHCP, Winsock, and TCP/IP settings.

## Files

Network-Reset-Tool.bat (single-file Batch utility; no separate PS1 script)

## Usage

1. Download or clone the complete repository.
2. Run `Network-Reset-Tool.bat`. Approve the UAC prompt when requested; the reset may temporarily interrupt connectivity.

## Requirements

Windows 10 or Windows 11, built-in Windows PowerShell 5.1 to request UAC elevation, and administrator privileges. Network commands run from Batch; winget is not required.

## Safety and limitations

The project must not remove personal data, credentials, or content outside paths defined by the tool. Command and feature availability depends on Windows edition and version. Review CHANGELOG.md before updating.

## Development

See AGENTS-PT-BR.md and AGENTS-EN.md. The default interface language follows Windows UI culture; Brazilian Portuguese is the fallback.

## Languages, purpose, and tips

The interface supports Brazilian Portuguese, English, Spanish, French, German, Italian, Japanese, Korean, Simplified Chinese, and Russian. It detects Windows UI culture and uses Brazilian Portuguese as the fallback.

The procedure flushes DNS, releases and renews DHCP, and resets Winsock/TCP/IP. Record static IP, custom DNS, and VPN settings first. The tool does not restart the computer automatically; restart to complete the reset.

### Idiomas disponíveis / Available languages

| Language | Locale | Used for |
|---|---|---|
| Brazilian Portuguese | pt-BR | Brazilian Windows; fallback for unsupported locales |
| English | en | English Windows |
| Spanish | es | Spanish Windows |
| French | fr | French Windows |
| German | de | German Windows |
| Italian | it | Italian Windows |
| Japanese | ja | Japanese Windows |
| Korean | ko | Korean Windows |
| Simplified Chinese | zh-CN | Simplified Chinese Windows |
| Russian | ru | Russian Windows |





## About Emerson Teles

Emerson Teles (Emertels) builds Windows tools for automation, emulation, and software localization. Explore his projects and official channels:

- [Official website](https://emertels.github.io) · [GitHub](https://github.com/Emertels) · [Discord](https://emertels.github.io/discord)
- [YouTube](https://www.youtube.com/@emersonteles2379) · [X](https://x.com/emertels) · [Telegram](https://t.me/apksmodsandroid) · [Ko-fi](https://ko-fi.com/emertels)

### Other projects

- [AI-Chat-Vault](https://github.com/Emertels/AI-Chat-Vault) — portable backup and recovery for local AI assistant conversations.
- [Suite-Emuladores](https://github.com/Emertels/Suite-Emuladores) — Windows download and update management for emulators and frontends.
- [Microsoft-Photos-Fix](https://github.com/Emertels/Microsoft-Photos-Fix) — startup and wallpaper fixes for the Windows Photos app.
- [PSBBN-Translator](https://github.com/Emertels/PSBBN-Translator) — localization of the PSBBN Definitive Project into 40 languages.
- [GPU-Tweak-III-Traducao-PTBR](https://github.com/Emertels/GPU-Tweak-III-Traducao-PTBR), [Cursor-Traducao-PTBR](https://github.com/Emertels/Cursor-Traducao-PTBR), [CodexRouter-Traducao-PTBR](https://github.com/Emertels/CodexRouter-Traducao-PTBR), [Antigravity-Traducao-PTBR](https://github.com/Emertels/Antigravity-Traducao-PTBR), and [ZCode-Traducao-PTBR](https://github.com/Emertels/ZCode-Traducao-PTBR) — Brazilian Portuguese localization projects.
- [Silent-Hill-Homecoming-Traducao-PTBR](https://github.com/Emertels/Silent-Hill-Homecoming-Traducao-PTBR) — PC translation and review project.

