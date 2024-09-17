@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

set "OUTPUT_FILE=programs.html"

if exist "%OUTPUT_FILE%" del "%OUTPUT_FILE%"

:: Set text color to yellow (E)
color E
echo Retrieving installed programs on the computer...

:: Create HTML header
(
    echo ^<html^>
    echo ^<head^>
    echo ^<meta charset="UTF-8"^>
    echo ^<title^>List of Installed Programs^</title^>
    echo ^<script src="https://www.kryogenix.org/code/browser/sorttable/sorttable.js"^>^</script^>
    echo ^</head^>
    echo ^<body^>
    echo ^<h1^>List of Installed Programs^</h1^>
    echo ^<table class="sortable" border="1"^>
    echo ^<tr^>^<th^>Program Name^</th^>^<th^>Publisher^</th^>^<th^>Version^</th^>^</tr^>
) > "%OUTPUT_FILE%"

:: Get installed programs and append to HTML file
for /f "skip=2 tokens=2,3,4 delims=," %%A in ('"WMIC product get name,version,vendor /format:csv"') do (
    if not "%%A"=="" (
        set "PROGRAM_NAME=%%A"
        set "PROGRAM_VERSION=%%B"
        set "PROGRAM_VENDOR=%%C"
        if not "!PROGRAM_NAME!"=="" if not "!PROGRAM_VERSION!"=="" if not "!PROGRAM_VENDOR!"=="" (
            set "SEARCH_URL=https://www.google.com/search?q=%%A"
            echo ^<tr^>^<td^>^<a href="!SEARCH_URL!" target="_blank"^>!PROGRAM_NAME!^</a^>^</td^>^<td^>!PROGRAM_VERSION!^</td^>^<td^>!PROGRAM_VENDOR!^</td^>^</tr^> >> "%OUTPUT_FILE%"
        )
    )
)

:: Close HTML tags
(
    echo ^</table^>
    echo ^<style^>
    echo body { font-family: Arial, sans-serif; background-color: #f0f0f0; }
    echo h1 { text-align: center; margin-top: 20px; }
    echo table { width: 100%; border-collapse: collapse; margin-left: auto; margin-right: auto; }
    echo th, td { padding: 8px; text-align: left; }
    echo th { background-color: #f2f2f2; cursor: pointer; }
    echo ^</style^>
    echo ^</body^>
    echo ^</html^>
) >> "%OUTPUT_FILE%"

cls
:: Set text color to green (A)
color A
echo Done. The HTML file has been generated: %OUTPUT_FILE%
pause >nul