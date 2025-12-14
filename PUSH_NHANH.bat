@echo off
chcp 65001 > nul
title DAY CODE LEN MANG
echo =================================================
echo   DANG KET NOI VOI GITHUB...
echo =================================================
echo.
echo Neu man hinh dung lai va hoi "Username" hoac hien cua so dang nhap,
echo ban hay nhap tai khoan GitHub cua ban vao nhe.
echo.
echo Dang thuc hien lenh: git push origin main
echo.

git push origin main

if %errorlevel% neq 0 (
    echo.
    echo =================================================
    echo   CO LOI XAY RA! (ERROR)
    echo =================================================
    echo   Vui long chup man hinh loi phia tren gui cho minh nhe.
    echo   (Co the do chua dang nhap hoac loi mang).
) else (
    echo.
    echo =================================================
    echo   DA HOAN TAT! (SUCCESS)
    echo =================================================
    echo   Code da duoc day len GitHub thanh cong.
    echo   Ban co the vao Render de kiem tra.
)
echo.
pause
