@echo off
set dest=./

rem 動画拡張子: mp4, avi, wmv, mkv, mov, ts, webm, flv, m4v, 3gp, asf, rm, rmvb, vob, ogv
rem 画像拡張子: jpg, jpeg, png, gif, bmp, tiff, svg, webp, ico, psd, raw, cr2, nef, dng
for /f "delims=" %%a in ('dir /b /s *.mp4 *.avi *.wmv *.mkv *.mov *.ts *.webm *.flv *.m4v *.3gp *.asf *.rm *.rmvb *.vob *.ogv *.jpg *.jpeg *.png *.gif *.bmp *.tiff *.svg *.webp *.ico *.psd *.raw *.cr2 *.nef *.dng') do (
    call :move_with_rename "%%a"
)

for /f "delims=" %%b in ('dir /ad /b') do (
    rd /s /q "%%b"
)

goto :eof

:move_with_rename
set "source_file=%~1"
set "filename=%~n1"
set "extension=%~x1"
set "counter=0"
set "new_name=%filename%%extension%"

:check_duplicate
if not exist "%dest%%new_name%" (
    move "%source_file%" "%dest%%new_name%"
    echo Moved: %source_file% to %dest%%new_name%
    goto :eof
)

set /a counter+=1
set "new_name=%filename%_%counter%%extension%"
goto :check_duplicate

