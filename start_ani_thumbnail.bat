@echo off
echo ===============================
echo OBS → WebM Thumbnail Setup
echo ===============================

:: Output folder
set OUTPUT_FOLDER=C:\webserver
if not exist %OUTPUT_FOLDER% mkdir %OUTPUT_FOLDER%

:: WebM output file
set OUTPUT_FILE=%OUTPUT_FOLDER%\live_thumbnail.webm

echo Make sure OBS is running with your scene and Virtual Camera started.
pause

:: FFmpeg command: short looping WebM (~3 seconds), low res, frequent keyframes
ffmpeg -f dshow -i video="OBS Virtual Camera" ^
-vf "scale=480:-1,fps=15" ^
-c:v libvpx -b:v 500k -g 15 -c:a none -y "%OUTPUT_FILE%"

pause
