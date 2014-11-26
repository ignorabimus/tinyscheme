tinyscheme
==========

Experimental fork of 
[TinyScheme](http://tinyscheme.sourceforge.net/ "D. Souflis, J. Shapiro - TinyScheme Download site") and extensions [TSX](http://heras-gilsanz.com/manuel/tsx.html "Manuel Heras-Gilsanz - TinyScheme Extensions"), [RE](http://tinyscheme.sourceforge.net/download.html "D. Souflis, J. Shapiro - TinyScheme Download").


Features
--------

* based on [TinyScheme](http://tinyscheme.sourceforge.net/) 1.41
* build with MS Visual C++ on Windows
* continuations support without using 'SCHEME STACK' (#undef USE_SCHEME_STACK)
* embedding 'init.scm' into tinyscheme.exe (or tinyscheme.lib)
* fixed crash in GC after getting read-char 'EOF'
* implement 'call-with-values' and 'values'
* implement 'string->uninterned-symbol' and 'gensym' gets new uninterned-symbol
* include [TinyScheme Extensions (TSX)](http://heras-gilsanz.com/manuel/tsx.html)
* include [TinyScheme RE extension](http://tinyscheme.sourceforge.net/download.html)

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

[Manuel Heras-Gilsanz - TinyScheme Extensions](http://heras-gilsanz.com/manuel/tsx.html)

[TinyScheme RE extension - TinyScheme Download](http://tinyscheme.sourceforge.net/download.html)

[Visual Studio Downloads](http://www.visualstudio.com/downloads/)


License
-------

Copyright (c) 2014 Tatsuya Watanabe. See the LICENSE file for license rights and limitations (MIT).
