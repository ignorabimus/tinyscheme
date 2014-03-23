@setlocal
@set SCHEME_H_DIR=..\src
@set TSCOMPILE=cl /nologo /O2 /W3 /c /D_CRT_SECURE_NO_DEPRECATE /DUSE_DL=1 /I%SCHEME_H_DIR%
@set TSLIB=lib /nologo
@set TSLINK=link /nologo
@set REGSRC=re.c regcomp.c regexec.c regerror.c regfree.c
@set OBJPRODN=re.obj regcomp.obj regexec.obj regerror.obj regfree.obj

@if "%1" == "static" goto STATIC
@if not exist dll\ (
  mkdir dll
)

%TSCOMPILE% /MT %REGSRC%
%TSLINK% /DLL /out:dll\re.dll /export:init_re %OBJPRODN%

%TSCOMPILE% /MDd %REGSRC%
%TSLINK% /DLL /out:dll\re_d.dll /export:init_re %OBJPRODN%

@goto END

:STATIC
@if not exist lib\ (
  mkdir lib
)

%TSCOMPILE% /MT %REGSRC%
%TSLIB% /out:lib\re.lib %OBJPRODN%

%TSCOMPILE% /MDd %REGSRC%
%TSLIB% /out:lib\re_d.lib %OBJPRODN%

:END
del %OBJPRODN%
