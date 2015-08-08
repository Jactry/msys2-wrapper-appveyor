set MSYSTEM=MSYS
C:\ProgramData\msys32\usr\bin\bash -l -c "echo Initialize..."

C:\ProgramData\msys32\usr\bin\bash -l -c "curl http://repo.msys2.org/msys/i686/pacman-mirrors-20150619-1-any.pkg.tar.xz > pacman-mirrors-20150619-1-any.pkg.tar.xz"
C:\ProgramData\msys32\usr\bin\bash -l -c "pacman -U --noconfirm pacman-mirrors-*"
echo Server = http://repo.msys2.org/msys/$arch > C:\ProgramData\msys32\etc\pacman.d\mirrorlist.msys
echo Server = http://repo.msys2.org/mingw/i686 > C:\ProgramData\msys32\etc\pacman.d\mirrorlist.mingw32
echo Server = http://repo.msys2.org/mingw/x86_64 > C:\ProgramData\msys32\etc\pacman.d\mirrorlist.mingw64

C:\ProgramData\msys32\usr\bin\bash -l -c "pacman -Sy"
C:\ProgramData\msys32\usr\bin\bash -l -c "pacman -S --needed --noconfirm msys2-runtime pacman bash"
REM C:\ProgramData\msys32\usr\bin\bash -l -c "pacman -Su --noconfirm"
C:\ProgramData\msys32\usr\bin\bash -l -c "pacman -S --needed --noconfirm msys2-devel base-devel git"
C:\ProgramData\msys32\usr\bin\bash -l -c "pacman -S --needed --noconfirm mingw-w64-i686-toolchain"
C:\ProgramData\msys32\usr\bin\bash -l -c "git config --global user.name 'Appveyor Bot'"
C:\ProgramData\msys32\usr\bin\bash -l -c "git config --global user.email 'Appveyor@dummy.com'"
C:\ProgramData\msys32\usr\bin\bash -l -c "git config -l"
