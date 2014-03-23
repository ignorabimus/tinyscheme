@setlocal
@set SCHEME_H_DIR=..\src
@set TSCOMPILE=cl /nologo /O2 /W3 /c /D_CRT_SECURE_NO_DEPRECATE /DWIN32 /DUSE_DL=1 /I%SCHEME_H_DIR%
@set TSLIB=lib /nologo
@set TSLINK=link /nologo

@if "%1" == "static" goto STATIC
@if not exist dll\ (
  mkdir dll
)

%TSCOMPILE% /MT tsx.c
%TSLINK% /DLL /out:dll\tsx.dll /export:init_tsx tsx.obj ws2_32.lib

%TSCOMPILE% /MDd tsx.c
%TSLINK% /DLL /out:dll\tsx_d.dll /export:init_tsx tsx.obj ws2_32.lib

@goto END

:STATIC
@if not exist lib\ (
  mkdir lib
)

%TSCOMPILE% /MT tsx.c
%TSLIB% /out:lib\tsx.lib tsx.obj ws2_32.lib

%TSCOMPILE% /MDd tsx.c
%TSLIB% /out:lib\tsx_d.lib tsx.obj ws2_32.lib

:END
del tsx.obj
