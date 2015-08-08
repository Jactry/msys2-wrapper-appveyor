set MSYS2_PACKAGE=msys2-base-i686-20150512-20150808.7z
time /t
7z x %MSYS2_PACKAGE% -oC:\ProgramData\ > nul
time /t
SET PATH=C:\ProgramData\msys32\wrapper\;%PATH%
echo "Test MSYS2"
mkdir test
cd test
msys2run ../msys2_script.sh
