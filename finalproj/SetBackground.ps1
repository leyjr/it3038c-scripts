Function Set-DesktopBackground ($Value)
 {
    Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper -value $value
    rundll32.exe user32.dll, UpdatePerUserSystemParameters
 }

Set-DesktopBackground -value "C:\it3038c-scripts\project3\TestBackground.jpg"
