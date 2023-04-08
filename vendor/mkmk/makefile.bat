@echo off
@rem This script creates a makefile based on templates

type %DEVROOT%\Projects\%PROJECT_BASE%\make\makefile.template > makefile
type makefile.module >> makefile
echo all: premake mkmk.exe >> makefile
echo premake: >> makefile
@rem echo 		@echo No premake >> makefile
echo clean: >> makefile
echo 		@del *.obj >> makefile
echo 		@del *.exe >> makefile

mkmk exe_target_mingw mkmk "" *.cpp *.c >> makefile
