@echo off
cls
title Clean My PC 
color 0E
echo Start Time is %time%
Echo.
Echo.

Rem ********* Delete Temporary Internet Files: ****
Rem RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8

Rem ********* Delete Cookies: *********************
Rem RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 2

Rem ********* Delete History: *********************
Rem RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 1

Rem ********* Delete Form Data: *******************
Rem RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 16

Rem ********* Delete Passwords: *******************
Rem RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 32

Rem ********* Remove All IE Cached Data ***********
Rem RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255

Echo ********* Removing All Temp Files and Cookies for IE *************
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 4351

Echo.
Echo Removal of Temp Files are Complete!

Echo.
Echo.
Echo.

Echo ********* Removing PC Temporary Files **********
rmdir /S /Q %userprofile%\AppData\Local\Temp 2>Nul
mkdir %userprofile%\AppData\Local\Temp 2>Nul


rmdir /S /Q %windir%\Temp 2>Nul
mkdir %windir%\Temp 2>Nul

c:\windows\system32\cleanmgr.exe /dc /sagerun: 1

Echo.
Echo Removal of PC Temporary Files Complete

Echo.
Echo.

exit