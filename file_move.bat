@echo off
set dest=E:\JD-Download
set search=*.mp4 *.avi *.wmv

for /f "delims=" %%a in ('dir /b /s *.mp4 *.avi *.wmv *.mkv *.mov *.mkv *.ts *.webm') do (
    move "%%a" %dest%)

for /f "delims=" %%b in ('dir /ad /b') do (
        rd /s /q "%%b"
  )
