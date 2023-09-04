#Persistent
#SingleInstance, Force
SPI_GETMOUSECLICKLOCK = 0x101E
SPI_SETMOUSECLICKLOCK = 0x101F
SetTimer, CheckPoEWindow, 200  ; Check for "Path of Exile" window every 500ms
ClickLockEnabled := 0 ; Initialize ClickLock status

DllCall("SystemParametersInfo", "UInt", SPI_GETMOUSECLICKLOCK, "UInt", 0, "UInt", ClickLockEnabled, UInt, 0)  


CheckPoEWindow:
    IfWinActive, Path of Exile  ; Check if the "Path of Exile" window is active
    {
        If (ClickLockEnabled = 0)
        {
            DllCall("SystemParametersInfo", "UInt", SPI_SETMOUSECLICKLOCK, "UInt", 0, "UInt", 1, UInt, 0)
            ClickLockEnabled := 1
        }
    }
    else
    {
        If (ClickLockEnabled = 1)
        {
            DllCall("SystemParametersInfo", "UInt", SPI_SETMOUSECLICKLOCK, "UInt", 0, "UInt", 0, UInt, 0)
            ClickLockEnabled := 0
        }
    }
return
