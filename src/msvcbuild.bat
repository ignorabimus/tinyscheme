@setlocal
@set TSCOMPILE=cl /nologo /O2 /W3 /c /D_CRT_SECURE_NO_DEPRECATE /D_CRT_NONSTDC_NO_DEPRECATE /DWIN32 /DUSE_DL=1
@set TSLINK=link /nologo
@set TSLIB=lib /nologo

@if "%1" == "static" goto STATIC
@if not exist bin\ (
  mkdir bin
)

%TSCOMPILE% /MT scheme.c dynload.c
%TSLINK% /out:bin\tinyscheme.exe scheme.obj dynload.obj

%TSCOMPILE% /MDd scheme.c dynload.c
%TSLINK% /out:bin\tinyscheme_d.exe scheme.obj dynload.obj

@goto END

:STATIC
@if not exist lib\ (
  mkdir lib
)

%TSCOMPILE% /DSTANDALONE=0 /MT scheme.c dynload.c
%TSLIB% /out:lib\tinyscheme.lib scheme.obj dynload.obj

%TSCOMPILE% /DSTANDALONE=0 /MDd scheme.c dynload.c
%TSLIB% /out:lib\tinyscheme_d.lib scheme.obj dynload.obj

:END
del scheme.obj dynload.obj
