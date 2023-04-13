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
        if ((initialMousePosX - xPos) > moveThresh) {
            ; If the mouse moved left, switch desktops to left
            Send "^#{Left}"
            return
        }
        if ((xPos - initialMousePosX) > moveThresh) {
            ; If the mouse moved right, switch desktops to right
            Send "^#{Right}"
            return
        }
    }
}

; Define the hotkey to activate - if you change the hotkey (Default: `^MButton`) change at line `12` as well
^MButton::mouseMove()