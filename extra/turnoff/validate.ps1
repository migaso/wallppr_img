# PowerShell.exe -ExecutionPolicy Bypass -File "C:\directory\file"
# Get-ScheduledTask -TaskName "Apagar" | Select-Object *   

$task_n="Apagar"

Get-ScheduledTask -TaskName $task_n | Select-Object TaskName, State, @{Name="DespertarEquipo";Expression={$_.Settings.WakeToRun}}, @{Name="Usuario";Expression={$_.Principal.UserId}}, @{Name="Nivel";Expression={$_.Principal.RunLevel}}

Get-ScheduledTaskInfo -TaskName $task_n | Select-Object NextRunTime, LastRunTime
Get-ScheduledTask -TaskName $task_n | Select-Object -ExpandProperty Triggers | Select-Object StartBoundary, Enabled
(Get-ScheduledTask -TaskName $task_n).Settings | Select-Object WakeToRun

@("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday") | Where-Object { (Get-ScheduledTask -TaskName $task_n).Triggers.DaysOfWeek -band (1 -shl (@("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday").IndexOf($_))) }