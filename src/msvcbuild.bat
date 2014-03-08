@setlocal
@set TSCOMPILE=cl /nologo /O2 /W3 /c /D_CRT_SECURE_NO_DEPRECATE /D_CRT_NONSTDC_NO_DEPRECATE /DWIN32 /DUSE_DL=1
@set TSLINK=link /nologo
@set TSLIB=lib /nologo

@if "%1" == "static" goto STATIC
@if not exist bin\ (
  mkdir bin
)

@if "%1" == "emb_init" (
  %TSCOMPILE% /MT scheme.c dynload.c
  %TSLINK% /out:tinyscheme.exe scheme.obj dynload.obj

  tinyscheme.exe mk_init_scm.scm

  %TSCOMPILE% /DUSE_EMB_INIT=1 /MT scheme.c dynload.c
  %TSLINK% /out:bin\tinyscheme.exe scheme.obj dynload.obj

  %TSCOMPILE% /DUSE_EMB_INIT=1 /MDd scheme.c dynload.c
  %TSLINK% /out:bin\tinyscheme_d.exe scheme.obj dynload.obj

  del tinyscheme.* init_scm.h
) else (
  %TSCOMPILE% /MT scheme.c dynload.c
  %TSLINK% /out:bin\tinyscheme.exe scheme.obj dynload.obj

  %TSCOMPILE% /MDd scheme.c dynload.c
  %TSLINK% /out:bin\tinyscheme_d.exe scheme.obj dynload.obj
)
@goto END

:STATIC
@if not exist lib\ (
  mkdir lib
)

%TSCOMPILE% /MT scheme.c dynload.c
%TSLINK% /out:tinyscheme.exe scheme.obj dynload.obj

tinyscheme.exe mk_init_scm.scm

%TSCOMPILE% /DSTANDALONE=0 /DUSE_EMB_INIT=1 /MT scheme.c dynload.c
%TSLIB% /out:lib\tinyscheme.lib scheme.obj dynload.obj

%TSCOMPILE% /DSTANDALONE=0 /DUSE_EMB_INIT=1 /MDd scheme.c dynload.c
%TSLIB% /out:lib\tinyscheme_d.lib scheme.obj dynload.obj

del tinyscheme.* init_scm.h

:END
del scheme.obj dynload.obj
