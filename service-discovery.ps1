$ip = (Resolve-DNSName (Hostname) | Select IPAddress | select IPAddress -expandproperty IPAddress | select -last 1)

Set-Content -Path C:\octopusinfo\mssqlip -Value $ip