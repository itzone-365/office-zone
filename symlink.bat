@echo off

rem Check if the correct number of arguments is provided
if "%~2"=="" (
    echo Usage: %0 ^<source_path^> ^<link_path^>
    exit /b 1
)

rem Assign command line arguments to variables
set "source_path=%~1"
set "link_path=%~2"

rem Check if the source path exists
if not exist "%source_path%" (
    echo Error: Source path "%source_path%" does not exist.
    exit /b 1
)

rem Create a symbolic link
mklink /d "%link_path%" "%source_path%"

rem Check if the symbolic link creation was successful
if errorlevel 1 (
    echo Error: Failed to create symbolic link.
) else (
    echo Symbolic link created successfully: %link_path% -> %source_path%
)
