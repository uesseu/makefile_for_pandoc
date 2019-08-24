# My Makefile for pandoc
Just a Makefile for pandoc.  
It makes pdf, html and docx.  
You need to edit the Makefile a little before make.  

# Requirement

- pandoc(2.7.2 or newer? Little older version may able to word.)
- texlive
- GNU make

# Usage
At first, edit Makefile.  
There are some arguments.

And then, run

```bash
make
```

then, 'out.pdf' is there.

If you want docx file, run

```bash
make out.docx
```

and if you want html, run

```bash
make out.html
```

If you yielded file named 'out.pdf', you can open it by

```bash
make open
```

# Cannot make PDF?
If pandoc is old, there is a changed argument.
Option '--latex-engine' is changed '--pdf-engine'.
