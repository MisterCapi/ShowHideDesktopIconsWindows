#SingleInstance Force

; Ikona w zasobniku systemowym (opcjonalne)
I_Icon := "C:\Program Files\Hide Icons\monitor.ico"
if FileExist(I_Icon)
    Menu, Tray, Icon, %I_Icon%

; Funkcja ukrywania ikon
HideIcons() {
    ControlGet, HWND, Hwnd,, SysListView321, ahk_class Progman
    if (HWND = "")
        ControlGet, HWND, Hwnd,, SysListView321, ahk_class WorkerW
    WinHide, ahk_id %HWND%
}

; Ukryj ikony przy starcie
HideIcons()

; Skrót Win + Z do przełączania ikon
#z::
ControlGet, HWND, Hwnd,, SysListView321, ahk_class Progman
if (HWND = "")
    ControlGet, HWND, Hwnd,, SysListView321, ahk_class WorkerW

if (DllCall("IsWindowVisible", "UInt", HWND))
    WinHide, ahk_id %HWND%
else
    WinShow, ahk_id %HWND%
return
