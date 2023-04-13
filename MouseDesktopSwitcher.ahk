#Requires AutoHotkey v2.0

; Define the distance in pixels to trigger
moveThresh := 20
; Delay in ms at which the function checks for distance - (higher = less CPU)
delayAfterHotkey := 10

mouseMove() 
{
    MouseGetPos &initialMousePosX, &initialMousePos
    ; Loop while the hotkey is pressed
    while GetKeyState("MButton", "P") {
        Sleep(delayAfterHotkey)
        MouseGetPos &xPos, &yPos
        ; If the mouse moved left, switch desktops to left
        if ((initialMousePosX - xPos) > moveThresh) {
            Send "^#{Left}"
            return
        }
        ; If the mouse moved right, switch desktops to right
        if ((xPos - initialMousePosX) > moveThresh) {
            Send "^#{Right}"
            return
        }
    }
}

; Define the hotkey to activate - if you change the hotkey (Default: `MButton`) change at line `12` as well
MButton::mouseMove()