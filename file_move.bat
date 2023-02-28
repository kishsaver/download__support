@echo off
set dest=E:\JD-Download
set search=*.mp4 *.avi *.wmv

for /f "tokens=*" %%a in ('dir /b /s *.mp4 *.avi *.wmv') do (
    move "%%a" %dest%
    for %%b in ("%%~dpa.") do (
        rd /s /q "%%~fb"
  )
)
