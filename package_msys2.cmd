echo "Hello world!"

choco install -y 7zip.commandline
choco install -y axel

set MSYS2_PACKAGE_VERSION=20150808
set MSYS2_INSTALLER=msys2-base-i686-20150512
axel http://sourceforge.net/projects/msys2/files/Base/i686/%MSYS2_INSTALLER%.tar.xz > nul
7z x %MSYS2_INSTALLER%.tar.xz -oC:\ProgramData\msys2-base-i686.tar > nul
7z x c:\ProgramData\msys2-base-i686.tar -oC:\ProgramData\ > nul

set MSYSTEM=MSYS
C:\ProgramData\msys32\usr\bin\bash -l -c "echo Initialize..."

C:\ProgramData\msys32\usr\bin\bash -l -c "curl http://repo.msys2.org/msys/i686/pacman-mirrors-20150619-1-any.pkg.tar.xz > pacman-mirrors-20150619-1-any.pkg.tar.xz"
C:\ProgramData\msys32\usr\bin\bash -l -c "pacman -U --noconfirm pacman-mirrors-*"
echo Server = http://repo.msys2.org/msys/$arch > C:\ProgramData\msys32\etc\pacman.d\mirrorlist.msys
echo Server = http://repo.msys2.org/mingw/i686 > C:\ProgramData\msys32\etc\pacman.d\mirrorlist.mingw32
echo Server = http://repo.msys2.org/mingw/x86_64 > C:\ProgramData\msys32\etc\pacman.d\mirrorlist.mingw64

copy %~dp0\script_clean.pl C:\ProgramData\msys32\usr\bin
C:\ProgramData\msys32\usr\bin\bash -l -c "pacman -Sy"
C:\ProgramData\msys32\usr\bin\bash -l -c "pacman -S --needed --noconfirm msys2-runtime pacman bash"
REM C:\ProgramData\msys32\usr\bin\bash -l -c "pacman -Su --noconfirm"
C:\ProgramData\msys32\usr\bin\bash -l -c "pacman -S --needed --noconfirm msys2-devel base-devel git"
C:\ProgramData\msys32\usr\bin\bash -l -c "pacman -S --needed --noconfirm "
C:\ProgramData\msys32\usr\bin\bash -l -c "git config --global user.name 'Appveyor Bot'"
C:\ProgramData\msys32\usr\bin\bash -l -c "git config --global user.email 'Appveyor@dummy.com'"
C:\ProgramData\msys32\usr\bin\bash -l -c "git config -l"

Remove-Item C:\ProgramData\msys32\var\cache\pacman\pkg\*

Copy-Item C:\scripts C:\ProgramData\msys32\wrapper -recurse

echo "Packaging..."
7z a -t7z  %MSYS2_INSTALLER%-%MSYS2_PACKAGE_VERSION%.7z C:\ProgramData\msys32 -m0=PPMd > nul

Get-FileHash %MSYS2_INSTALLER%-%MSYS2_PACKAGE_VERSION%.7z

Remove-Item C:\ProgramData\msys32
