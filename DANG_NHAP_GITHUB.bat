@echo off
chcp 65001 > nul
title KICH HOAT DANG NHAP GITHUB
echo =================================================
echo   BUOC 1: KICH HOAT CHE DO DANG NHAP WEB
echo =================================================
echo.
echo Dang cai dat cau hinh...
git config --global credential.helper manager
echo.
echo =================================================
echo   BUOC 2: MO CUA SO DANG NHAP
echo =================================================
echo.
echo He thong se thu ket noi voi GitHub.
echo > Mot cua so Web hoac O dang nhap se hien ra ngay bay gio.
echo > Hay dang nhap vao tai khoan cua ban nhe!
echo.
git fetch origin

if %errorlevel% equ 0 (
    echo.
    echo =================================================
    echo   THANH CONG! DA DANG NHAP DUOC!
    echo =================================================
    echo   Bay gio ban hay tat cua so nay di.
    echo   Va chay file "PUSH_NHANH.bat" de day code len nhe.
) else (
    echo.
    echo =================================================
    echo   VAN CHUA DUOC?
    echo =================================================
    echo   Neu khong co cua so nao hien ra, ban hay thu cach cuoi:
    echo   1. Mo file PUSH_NHANH.bat
    echo   2. Khi no hoi Username: Nhap ten dang nhap GitHub
    echo   3. Khi no hoi Password: Nhap Mat khau (hoac Token)
)
echo.
pause
