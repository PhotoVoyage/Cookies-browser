Set objShell = WScript.CreateObject("WScript.Shell")
objShell.Run "npm i", 0, True

WScript.Sleep 1000

' Eliminar el archivo started-first.bat
Set fso = CreateObject("Scripting.FileSystemObject")
fso.DeleteFile "started-first.bat"
