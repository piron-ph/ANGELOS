@echo off & CD "%~dp0"


cls
ping localhost -n 5 >nul
echo Checking for update
ping localhost -n 5 >nul
cls
set currentver=v1
IF %errorlevel% EQU 1 goto begin
call updater.bat

:begin
cls
title ANGELOS
ping localhost -n 5 >nul b

echo Connecting to ANGELOS

ping localhost -n 5 >nul
for /l %%f in (0 1 100) do (
        call :drawProgressBar %%f "I really dont need to load (yet), this is bullshit."
    )
    for /l %%f in (100 -1 0) do (
        call :drawProgressBar %%f "Getting Database"
    )
    for /l %%f in (0 5 100) do (
        call :drawProgressBar !random! "Creating Filebatch"
    )

    rem Clean all after use
    call :finalizeProgressBar 1


    ping localhost -n 8 >nul
    call :initProgressBar "|" "ASH"
    call :drawProgressBar 1 "Loading"
    for /l %%f in (0 1 100) do (
        call :drawProgressBar %%f 
    )

ping localhost -n 4 >nul
echo please enter your name and password after this message.
title Tell me the password.
if exist database.dll goto login
if not exist database.dll goto register

:register
title Register
echo Register
echo.
echo Please fill in the blanks.
echo.
Set usrname=
set /p usrname=Username: 
Set passw=
set /p passw=Password: 
echo %usrname%>> database.dll
echo %passw%>> database.dll
goto login

:login
:begin
set usr=
set /p usr=Enter your username: 
if {%usr%}=={} goto :begin
set authenticated=
for /f "tokens=*" %%a in (database.dll) do (
    if {%%a}=={%usr%} set authenticated=true
)

if not defined authenticated (echo Invalid Username & goto :begin)

:password
set pass=
set /p pass=Enter your password: 
if {%pass%}=={} goto :begin
set authenticated=
for /f "tokens=*" %%a in (database.dll) do (
    if {%%a}=={%pass%} set authenticated=true
)
if not defined authenticated (echo Invalid password & goto :begin)

:loggedin
cls
goto:selector



:drawProgressBar value [text]
    if "%~1"=="" goto :eof
    if not defined pb.barArea call :initProgressBar
    setlocal enableextensions enabledelayedexpansion
    set /a "pb.value=%~1 %% 101", "pb.filled=pb.value*pb.barArea/100", "pb.dotted=pb.barArea-pb.filled", "pb.pct=1000+pb.value"
    set "pb.pct=%pb.pct:~-3%"
    if "%~2"=="" ( set "pb.text=" ) else ( 
        set "pb.text=%~2%pb.back%" 
        set "pb.text=!pb.text:~0,%pb.textArea%!"
    )
    <nul set /p "pb.prompt=[!pb.fill:~0,%pb.filled%!!pb.dots:~0,%pb.dotted%!][ %pb.pct% ] %pb.text%!pb.cr!"
    endlocal
    goto :eof

:initProgressBar [fillChar] [dotChar]
    if defined pb.cr call :finalizeProgressBar
    for /f %%a in ('copy "%~f0" nul /z') do set "pb.cr=%%a"
    if "%~1"=="" ( set "pb.fillChar=#" ) else ( set "pb.fillChar=%~1" )
    if "%~2"=="" ( set "pb.dotChar=." ) else ( set "pb.dotChar=%~2" )
    set "pb.console.columns="
    for /f "tokens=2 skip=4" %%f in ('mode con') do if not defined pb.console.columns set "pb.console.columns=%%f"
    set /a "pb.barArea=pb.console.columns/2-2", "pb.textArea=pb.barArea-9"
    set "pb.fill="
    setlocal enableextensions enabledelayedexpansion
    for /l %%p in (1 1 %pb.barArea%) do set "pb.fill=!pb.fill!%pb.fillChar%"
    set "pb.fill=!pb.fill:~0,%pb.barArea%!"
    set "pb.dots=!pb.fill:%pb.fillChar%=%pb.dotChar%!"
    set "pb.back=!pb.fill:~0,%pb.textArea%!
    set "pb.back=!pb.back:%pb.fillChar%= !"
    endlocal & set "pb.fill=%pb.fill%" & set "pb.dots=%pb.dots%" & set "pb.back=%pb.back%"
    goto :eof

:finalizeProgressBar [erase]
    if defined pb.cr (
        if not "%~1"=="" (
            setlocal enabledelayedexpansion
            set "pb.back="
            for /l %%p in (1 1 %pb.console.columns%) do set "pb.back=!pb.back! "
            <nul set /p "pb.prompt=!pb.cr!!pb.back:~1!!pb.cr!"
            endlocal
        )
    )
    for /f "tokens=1 delims==" %%v in ('set pb.') do set "%%v="
    goto :eof


:selector
echo Please type where you want to go
echo.
echo. 
echo 1) Our Journey
echo 2) Messag
echo.
set /p op=Type option:
if "%op%"=="1" call journey/journey.bat
if "%op%"=="2" call ily/ily.bat
if "%op%"=="3" goto 4
if "%op%"=="4"
if "%op%"=="5"
if "%op%"=="6"
if "%op%"=="7"

echo Please Pick an option:
goto begin


:0
echo you picked option 1
goto begin

:1
echo you picked option 2
goto begin

:loader 
echo 

:4
cls
ping localhost -n 5 >nul
echo i have never really thought on how to start this
ping localhost -n 5 >nul
echo and i'm out of ideas for now.
ping localhost -n 5 >nul
echo I'm writing this while talking to you, 7:42am of January 28,2022
ping localhost -n 5 >nul
echo guess we'll just start about you.
echo.
echo.
ping localhost -n 5 >nul
echo.
echo.
echo I just gotta say that you opened your cam
ping localhost -n 5 >nul
echo And i'm looking at you while writing this
ping localhost -n 5 >nul
echo now i'm distracted, but hey somewhere
ping localhost -n 5 >nul
echo between all of those distracting details is a beautiful you.
ping localhost -n 5 >nul
echo I guess saying this messages is nonsense, deep inside me
ping localhost -n 5 >nul
echo i will never find the words, you are my everything
ping localhost -n 5 >nul
echo and my always, see even that is not enough.
ping localhost -n 5 >nul
echo.
echo.
echo You are, and always have been, My dream.
:choice
set /P c=This message has part 2, continue [Y/N]?
if /I "%c%" EQU "Y" goto :4cont
if /I "%c%" EQU "N" goto :selector
goto :selector
echo selector not working.
goto :choice
:4cont
echo

:5
echo