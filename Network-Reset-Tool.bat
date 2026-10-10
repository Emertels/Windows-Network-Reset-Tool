@echo off
setlocal EnableExtensions DisableDelayedExpansion
title Windows Network Reset Tool v1.0.0
rem Configura UTF-8 pela API do console para preservar acentos sem executar CHCP.
powershell.exe -NoLogo -NoProfile -Command "[Console]::OutputEncoding=[Text.Encoding]::UTF8; [Console]::InputEncoding=[Text.Encoding]::UTF8"

set "LANG=pt-BR"
set "UI_CULTURE="
for /f "delims=" %%A in ('powershell.exe -NoProfile -Command "[Globalization.CultureInfo]::CurrentUICulture.Name" 2^>nul') do set "UI_CULTURE=%%A"
if /i "%UI_CULTURE:~0,2%"=="en" set "LANG=en"
if /i "%UI_CULTURE:~0,2%"=="es" set "LANG=es"
if /i "%UI_CULTURE:~0,2%"=="fr" set "LANG=fr"
if /i "%UI_CULTURE:~0,2%"=="de" set "LANG=de"
if /i "%UI_CULTURE:~0,2%"=="it" set "LANG=it"
if /i "%UI_CULTURE:~2,1%"=="-" if /i "%UI_CULTURE:~0,2%"=="ja" set "LANG=ja"
if /i "%UI_CULTURE:~0,2%"=="ko" set "LANG=ko"
if /i "%UI_CULTURE:~0,5%"=="zh-CN" set "LANG=zh-CN"
if /i "%UI_CULTURE:~0,2%"=="ru" set "LANG=ru"
call :SetLanguage
for /f "delims=" %%T in ('powershell.exe -NoProfile -Command "Get-Date -Format 'yyyy-MM-dd HH:mm:ss'" 2^>nul') do set "SESSION_TIME=%%T"
if not defined SESSION_TIME set "SESSION_TIME=%date% %time%"

fltmc >nul 2>&1
if errorlevel 1 (
    echo %ADMIN_REQUIRED%
    powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath '%~f0' -Verb RunAs" >nul 2>&1
    if errorlevel 1 echo %ELEVATION_FAILED%
    exit /b 1
)

cls
echo %TITLE%
echo ======================================================================
echo %VERSION_LABEL%: 1.0.0
echo %SESSION_LABEL%: %SESSION_TIME%
echo %LANGUAGE_LABEL%: %LANG% (%UI_CULTURE%)
echo ======================================================================
echo.
set "HAS_ERROR=0"

echo [1/5] %STEP_DNS%...
ipconfig.exe /flushdns >nul 2>&1
if errorlevel 1 (echo   %STEP_FAILED% & set "HAS_ERROR=1") else echo   %STEP_OK%
echo.

echo [2/5] %STEP_RELEASE%...
ipconfig.exe /release >nul 2>&1
if errorlevel 1 (echo   %STEP_FAILED% & set "HAS_ERROR=1") else echo   %STEP_OK%
echo.

echo [3/5] %STEP_WAIT%...
timeout.exe /t 5 /nobreak >nul 2>&1
echo   %STEP_OK%
echo.

echo [4/5] %STEP_RENEW%...
ipconfig.exe /renew >nul 2>&1
if errorlevel 1 (echo   %STEP_FAILED% & set "HAS_ERROR=1") else echo   %STEP_OK%
echo.

echo [5/5] %STEP_STACK%...
netsh.exe winsock reset >nul 2>&1
if errorlevel 1 (echo   %STEP_FAILED% & set "HAS_ERROR=1") else echo   %STEP_OK%
netsh.exe int ip reset >nul 2>&1
if errorlevel 1 (echo   %STEP_FAILED% & set "HAS_ERROR=1")
echo.

echo ======================================================================
if "%HAS_ERROR%"=="0" (echo %SUCCESS%) else (echo %PARTIAL%)
echo %RESTART_NOTE%
echo ======================================================================
echo %CLOSE_PROMPT%
pause >nul
exit /b %HAS_ERROR%

:SetLanguage
set "TITLE=REDEFINIÇÃO AVANÇADA DE REDE"
set "VERSION_LABEL=Versão"
set "SESSION_LABEL=Sessão iniciada"
set "LANGUAGE_LABEL=Idioma detectado"
set "ADMIN_REQUIRED=Solicitando privilegios de administrador..."
set "ELEVATION_FAILED=Não foi possível solicitar elevação. Execute como administrador."
set "STEP_DNS=Limpando o caché DNS"
set "STEP_RELEASE=Liberando o endereço IP atual"
set "STEP_WAIT=Aguardando o roteador"
set "STEP_RENEW=Solicitando um novo endereço IP"
set "STEP_STACK=Redefinindo Winsock e TCP/IP"
set "STEP_FAILED=Falhou; verifique a conexão e as permissões."
set "STEP_OK=OK"
set "SUCCESS=Concluído. Reinicie o PC para aplicar totalmente as alterações."
set "PARTIAL=Concluído com avisos. Confira as etapas que falharam."
set "RESTART_NOTE=Nenhuma reinicialização automática foi solicitada."
set "CLOSE_PROMPT=Pressione uma tecla para fechar."
if /i "%LANG%"=="en" (
 set "TITLE=ADVANCED NETWORK RESET"
 set "VERSION_LABEL=Versión"
 set "SESSION_LABEL=Session started"
 set "LANGUAGE_LABEL=Detected language"
 set "ADMIN_REQUIRED=Requesting administrator privileges..."
 set "ELEVATION_FAILED=Could not request elevation. Run as administrator."
 set "STEP_DNS=Flushing DNS cache"
 set "STEP_RELEASE=Releasing the current IP address"
 set "STEP_WAIT=Waiting for the router"
 set "STEP_RENEW=Requesting a new IP address"
 set "STEP_STACK=Resetting Winsock and TCP/IP"
 set "STEP_FAILED=Failed; check the connection and permissions."
 set "SUCCESS=Completed. Restart the PC to fully apply the changes."
 set "PARTIAL=Completed with warnings. Check the failed steps."
 set "RESTART_NOTE=No automatic restart was requested."
 set "CLOSE_PROMPT=Press any key to close."
)
if /i "%LANG%"=="es" (
 set "TITLE=RESTABLECIMIENTO AVANZADO DE RED"
 set "VERSION_LABEL=Versión"
 set "SESSION_LABEL=Sesión iniciada"
 set "LANGUAGE_LABEL=Idioma detectado"
 set "ADMIN_REQUIRED=Solicitando privilegios de administrador..."
 set "ELEVATION_FAILED=No se pudo solicitar la elevación. Ejecute como administrador."
 set "STEP_DNS=Vaciando la caché DNS"
 set "STEP_RELEASE=Liberando la dirección IP actual"
 set "STEP_WAIT=Esperando al router"
 set "STEP_RENEW=Solicitando una nueva dirección IP"
 set "STEP_STACK=Restableciendo Winsock y TCP/IP"
 set "STEP_FAILED=Falló; compruebe la conexión y los permisos."
 set "SUCCESS=Finalizado. Reinicie el PC para aplicar todos los cambios."
 set "PARTIAL=Finalizado con avisos. Revise los pasos fallidos."
 set "RESTART_NOTE=No se solicitó el reinicio automático."
 set "CLOSE_PROMPT=Pulse una tecla para cerrar."
)
if /i "%LANG%"=="fr" (
 set "TITLE=RÉINITIALISATION AVANCÉE DU RÉSEAU"
 set "VERSION_LABEL=Versión"
 set "SESSION_LABEL=Session démarrée"
 set "LANGUAGE_LABEL=Langue détectée"
 set "ADMIN_REQUIRED=Demande des droits administrateur..."
 set "ELEVATION_FAILED=Impossible de demander les droits. Executez en tant qu'administrateur."
 set "STEP_DNS=Vidage du caché DNS"
 set "STEP_RELEASE=Libération de l'adresse IP actuelle"
 set "STEP_WAIT=Attente du routeur"
 set "STEP_RENEW=Demande d'une nouvelle adresse IP"
 set "STEP_STACK=Réinitialisation de Winsock et TCP/IP"
 set "STEP_FAILED=Échec; vérifiez la connexion et les autorisations."
 set "SUCCESS=Terminé. Redémarrez le PC pour appliquer tous les changements."
 set "PARTIAL=Terminé avec des avertissements. Vérifiez les étapes en echec."
 set "RESTART_NOTE=Aucun redémarrage automatique n'a ete demande."
 set "CLOSE_PROMPT=Appuyez sur une touche pour fermer."
)
if /i "%LANG%"=="de" (
 set "TITLE=ERWEITERTER NETZWERK-RESET"
 set "VERSION_LABEL=Versión"
 set "SESSION_LABEL=Sitzung gestartet"
 set "LANGUAGE_LABEL=Erkannte Sprache"
 set "ADMIN_REQUIRED=Administratorrechte werden angefordert..."
 set "ELEVATION_FAILED=Rechteerhöhung fehlgeschlagen. Als Administrator ausführen."
 set "STEP_DNS=DNS-Cache wird geleert"
 set "STEP_RELEASE=Aktuelle IP-Adresse wird freigegeben"
 set "STEP_WAIT=Warten auf den Router"
 set "STEP_RENEW=Neue IP-Adresse wird angefordert"
 set "STEP_STACK=Winsock und TCP/IP werden zurückgesetzt"
 set "STEP_FAILED=Fehlgeschlagen; Verbindung und Berechtigungen prüfen."
 set "SUCCESS=Abgeschlossen. PC neu starten, um alle Änderungen anzuwenden."
 set "PARTIAL=Mit Warnungen abgeschlossen. Fehlgeschlagene Schritte prüfen."
 set "RESTART_NOTE=Kein automatischer Neustart wurde angefordert."
 set "CLOSE_PROMPT=Beliebige Taste zum Schließen drücken."
)
if /i "%LANG%"=="it" (
 set "TITLE=RIPRISTINO AVANZATO DELLA RETE"
 set "VERSION_LABEL=Versione"
 set "SESSION_LABEL=Sessione avviata"
 set "LANGUAGE_LABEL=Lingua rilevata"
 set "ADMIN_REQUIRED=Richiesta dei privilegi di amministratore..."
 set "ELEVATION_FAILED=Impossibile richiedere i privilegi. Esegui come amministratore."
 set "STEP_DNS=Svuotamento caché DNS"
 set "STEP_RELEASE=Rilascio dell'indirizzo IP attuale"
 set "STEP_WAIT=Attesa del router"
 set "STEP_RENEW=Richiesta di un nuovo indirizzo IP"
 set "STEP_STACK=Ripristino di Winsock e TCP/IP"
 set "STEP_FAILED=Operazione non riuscita; verifica connessione e permessi."
 set "SUCCESS=Completato. Riavvia il PC per applicare tutte le modifiche."
 set "PARTIAL=Completato con avvisi. Controlla i passaggi non riusciti."
 set "RESTART_NOTE=Non è stato richiesto il riavvio automatico."
 set "CLOSE_PROMPT=Premi un tasto per chiudere."
)
if /i "%LANG%"=="ja" (
 set "TITLE=ネットワークの詳細リセット"
 set "VERSION_LABEL=バージョン"
 set "SESSION_LABEL=セッション開始"
 set "LANGUAGE_LABEL=検出された言語"
 set "ADMIN_REQUIRED=管理者権限を要求しています..."
 set "ELEVATION_FAILED=管理者権限を要求できませんでした。管理者として実行してください。"
 set "STEP_DNS=DNS キャッシュを消去中"
 set "STEP_RELEASE=現在の IP アドレスを解放中"
 set "STEP_WAIT=ルーターを待機中"
 set "STEP_RENEW=新しい IP アドレスを要求中"
 set "STEP_STACK=Winsock と TCP/IP をリセット中"
 set "STEP_FAILED=失敗しました。接続と権限を確認してください。"
 set "SUCCESS=完了しました。変更を適用するには PC を再起動してください。"
 set "PARTIAL=警告付きで完了しました。失敗した手順を確認してください。"
 set "RESTART_NOTE=自動再起動は要求されていません。"
 set "CLOSE_PROMPT=何かキーを押して閉じます。"
)
if /i "%LANG%"=="ko" (
 set "TITLE=고급 네트워크 초기화"
 set "VERSION_LABEL=버전"
 set "SESSION_LABEL=세션 시작"
 set "LANGUAGE_LABEL=감지된 언어"
 set "ADMIN_REQUIRED=관리자 권한을 요청하는 중..."
 set "ELEVATION_FAILED=권한 상승을 요청할 수 없습니다. 관리자 권한으로 실행하세요."
 set "STEP_DNS=DNS 캐시 비우는 중"
 set "STEP_RELEASE=현재 IP 주소 해제 중"
 set "STEP_WAIT=라우터 대기 중"
 set "STEP_RENEW=새 IP 주소 요청 중"
 set "STEP_STACK=Winsock 및 TCP/IP 초기화 중"
 set "STEP_FAILED=실패했습니다. 연결과 권한을 확인하세요."
 set "SUCCESS=완료되었습니다. 변경 사항을 적용하려면 PC를 다시 시작하세요."
 set "PARTIAL=경고와 함께 완료되었습니다. 실패한 단계를 확인하세요."
 set "RESTART_NOTE=자동 재시작은 요청하지 않았습니다."
 set "CLOSE_PROMPT=아무 키나 눌러 닫으세요."
)
if /i "%LANG%"=="zh-CN" (
 set "TITLE=高级网络重置"
 set "VERSION_LABEL=版本"
 set "SESSION_LABEL=会话开始时间"
 set "LANGUAGE_LABEL=检测到的语言"
 set "ADMIN_REQUIRED=正在请求管理员权限..."
 set "ELEVATION_FAILED=无法请求提升权限。请以管理员身份运行。"
 set "STEP_DNS=正在刷新 DNS 缓存"
 set "STEP_RELEASE=正在释放当前 IP 地址"
 set "STEP_WAIT=正在等待路由器"
 set "STEP_RENEW=正在请求新 IP 地址"
 set "STEP_STACK=正在重置 Winsock 和 TCP/IP"
 set "STEP_FAILED=失败，请检查连接和权限。"
 set "SUCCESS=已完成。请重启电脑以应用更改。"
 set "PARTIAL=已完成但有警告。请检查失败的步骤。"
 set "RESTART_NOTE=未请求自动重启。"
 set "CLOSE_PROMPT=按任意键关闭。"
)
if /i "%LANG%"=="ru" (
 set "TITLE=РАСШИРЕННЫЙ СБРОС СЕТИ"
 set "VERSION_LABEL=Версия"
 set "SESSION_LABEL=Сеанс начат"
 set "LANGUAGE_LABEL=Обнаруженный язык"
 set "ADMIN_REQUIRED=Запрос прав администратора..."
 set "ELEVATION_FAILED=Не удалось запросить повышение прав. Запустите от имени администратора."
 set "STEP_DNS=Очистка кэша DNS"
 set "STEP_RELEASE=Освобождение текущего IP-адреса"
 set "STEP_WAIT=Ожидание маршрутизатора"
 set "STEP_RENEW=Запрос нового IP-адреса"
 set "STEP_STACK=Сброс Winsock и TCP/IP"
 set "STEP_FAILED=Ошибка. Проверьте подключение и права."
 set "SUCCESS=Готово. Перезагрузите ПК, чтобы применить изменения."
 set "PARTIAL=Завершено с предупреждениями. Проверьте ошибочные этапы."
 set "RESTART_NOTE=Автоматическая перезагрузка не запрашивалась."
 set "CLOSE_PROMPT=Нажмите любую клавишу, чтобы закрыть окно."
)
exit /b
