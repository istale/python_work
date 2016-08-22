:: Copyright (c) 2008-2015 XMind Ltd. All rights reserved.

:: Script to install additional TrueType fonts for Windows.
:: https://gist.github.com/heldr/3494570
:: http://www.msfn.org/board/topic/119612-how-to-install-a-font-via-the-command-line/

@ECHO OFF

:: Tell the command processor to delay resolution of variables until it executes them.
SETLOCAL ENABLEDELAYEDEXPANSION

:: Correcting current directory when running as administrator:
SETLOCAL ENABLEEXTENSIONS
CD /D "%~dp0"

SET SRC_FONTS_DIR=%CD%\..\Commons\fonts
SET DEST_FONTS_DIR=%SystemRoot%\Fonts\

IF NOT EXIST "%SRC_FONTS_DIR%" GOTO Error101

CALL :InstallFont "Arvo-Bold.ttf" "Arvo"
CALL :InstallFont "Arvo-BoldItalic.ttf" "Arvo"
CALL :InstallFont "Arvo-Italic.ttf" "Arvo"
CALL :InstallFont "Arvo-Regular.ttf" "Arvo"
CALL :InstallFont "DroidSerif-Bold.ttf" "Droid Serif"
CALL :InstallFont "DroidSerif-BoldItalic.ttf" "Droid Serif"
CALL :InstallFont "DroidSerif-Italic.ttf" "Droid Serif"
CALL :InstallFont "DroidSerif.ttf" "Droid Serif"
CALL :InstallFont "IndieFlower.ttf" "Indie Flower"
CALL :InstallFont "Lobster-Regular.ttf" "Lobster"
CALL :InstallFont "OpenSans-Bold.ttf" "Open Sans"
CALL :InstallFont "OpenSans-BoldItalic.ttf" "Open Sans"
CALL :InstallFont "OpenSans-Italic.ttf" "Open Sans"
CALL :InstallFont "OpenSans-Regular.ttf" "Open Sans"
CALL :InstallFont "PoiretOne-Regular.ttf" "Poiret One"
CALL :InstallFont "Raleway-Bold.ttf" "Raleway"
CALL :InstallFont "Raleway-Regular.ttf" "Raleway"
CALL :InstallFont "Roboto-Bold.ttf" "Roboto"
CALL :InstallFont "Roboto-BoldItalic.ttf" "Roboto"
CALL :InstallFont "Roboto-Italic.ttf" "Roboto"
CALL :InstallFont "Roboto-Regular.ttf" "Roboto"
CALL :InstallFont "RobotoCondensed-Bold.ttf" "Roboto Condensed"
CALL :InstallFont "RobotoCondensed-BoldItalic.ttf" "Roboto Condensed"
CALL :InstallFont "RobotoCondensed-Italic.ttf" "Roboto Condensed"
CALL :InstallFont "RobotoCondensed-Regular.ttf" "Roboto Condensed"
CALL :InstallFont "RobotoSlab-Bold.ttf" "Roboto Slab"
CALL :InstallFont "RobotoSlab-Regular.ttf" "Roboto Slab"

GOTO End


:: Install a specific font
:: Usage: CALL :InstallFont %FILE_NAME% %FONT_NAME%
:InstallFont
SET FILE_NAME=%1
SET FONT_FILE=%SRC_FONTS_DIR%\%FONT_FILE_NAME%
SET FONT_NAME=%2

:: Copy the font file to system fonts folder:
COPY /Y "%FONT_FILE%" "%DEST_FONTS_DIR%"

:: Add the font with specified name to the Windows registry:
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "%FONT_NAME% (TrueType)" /t REG_SZ /d "%FILE_NAME%" /f

::
GOTO :EOF


:: Handle error of source font directory not found.
:Error101
:: Show error message and exit.
ECHO Error(101): Fonts directory %SRC_FONTS_DIR% is not found.
PAUSE
GOTO End


:: End of batch file
:End
