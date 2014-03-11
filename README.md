tinyscheme
==========

Experimental fork of [TinyScheme](http://tinyscheme.sourceforge.net/ "D. Souflis, J. Shapiro - TinyScheme Download site")


Build (with MSVC)
-----------------

Install "Visual C++ 2010" or later.

* I compiled using "Visual C++ 2010 Express Edition SP1", but "2008" or earlier maybe OK.

### Setting up environemt

Open the Visual Studio command prompt, or open Normal command prompt then run

    > (Visual Studio installed path)\VC\vcvarsall.bat

and change directory to unpacking source files.

    > cd src

### Build an executable

To build an executable, just run

    > msvcbuild.bat

and you'll get

    > bin\tinyscheme.exe
    > bin\tinyscheme_d.exe

### Build a static library

To build as a static library, run with "static" option

    > msvcbuild.bat static

and you'll get

    > lib\tinyscheme.lib
    > lib\tinyscheme_d.lib


Links
-----

[D. Souflis, J. Shapiro - TinyScheme Home](http://tinyscheme.sourceforge.net/home.html)

[Visual Studio Downloads](http://www.visualstudio.com/downloads/)
