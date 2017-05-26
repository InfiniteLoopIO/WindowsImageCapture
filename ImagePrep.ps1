$scriptDir = split-path $script:Myinvocation.mycommand.definition -Parent
$xmlDir = "$scriptDir\XML"

$OS = gwmi win32_operatingsystem

$supportedOS = @()
$supportedOS += gci $xmlDir | ? {$_.psiscontainer} | % {$_.name} | sort name
$caption = $os.caption.trim()
if($supportedOS -contains $caption){"$caption is supported, continue"}else{"$caption is not supported, exiting";exit}

$unattendFile = "c:\unattend.xml"
Copy-Item "$xmlDir\$caption\unattend.xml" $unattendFile -Force

$cleanup = @"
del /Q /F "c:\unattend.xml"
rd /Q /S "$scriptDir"

REM Uncomment the command below if enabling built-in administrator account 
REM wmic useraccount where name='administrator' set passwordexpires=false
"@ 
New-Item -ItemType file 'C:\Windows\Setup\Scripts\setupcomplete.cmd' -Value $cleanup -Force | Out-Null

if(Test-Path $unattendFile)
{
  write-host "`r`n$unattendFile found" -f Green
  do{$input = Read-Host "Press y to seal or x to exit script"}while($input -notmatch 'y|x')
  if($input -eq 'y'){Start-Process 'c:\windows\system32\sysprep\sysprep.exe' -ArgumentList '/generalize /oobe /shutdown' -Wait}
}
else
{
  write-host "`r`n$unattendFile not found, cannot seal image" -f red
}

