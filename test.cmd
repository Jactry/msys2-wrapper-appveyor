set MSYS2_PACKAGE=msys2-base-i686-20150512-20150808.7z

7z x %MSYS2_PACKAGE% -oC:\ProgramData\ > nul

SET PATH=C:\ProgramData\msys32\wrapper\;%PATH%
msys2run.cmd "echo Hello"
