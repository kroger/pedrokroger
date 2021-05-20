---
title: Printing Python Code With LaTeX
author: Pedro Kroger
layout: post
date: 2011-04-10T14:13:58+00:00
url: /printing-python-code-latex/
categories:
  - Latex
  - Python
---

Call me old fashioned but I like to review my code by printing it. Yes, on paper.

The advantage of reviewing code on paper instead of the monitor is that I can give my
eyes a break and I can annotate more freely, connect things with arrows, draw boxes, etc.
I don't print my code everyday, after all this is not the 80's, but I like to print the
code when I feel it could benefit from some refactoring and re-structuring and my brain
could benefit from same change in the medium and even location (I can grab the printouts
and go to a park or cafe).

<!--more-->

The best way I found to print code is by using the LaTaX [listings][1] package (it should
be included in any modern LaTeX distribution). This package is intended to include code
snippets in papers and books, but it works to generate code listings as well.

These are the options I have in my LaTeX document header:

```latex
documentclass[10pt]{article}
usepackage[T1]{fontenc}
usepackage[scaled]{beramono}
renewcommand*familydefault{ttdefault}
usepackage{listings}
```


The [beramono][2] package is a version of Bitstream Vera Mono modified to work with TeX. Without it we'll get the default LaTeX mono font:

![](/img/2011-04/code-ugly1.png)

But I like Bitstream Vera better (it looks even better on paper):

![](/img/2011-04/code-pretty1.png)

Listings has support for Python out-of-the-box and has lots of options and features
(check the [manual][3] to see what listings can do). These are the options I like to
customize:

```latex
\lstset{
  language=Python,
  showstringspaces=false,
  formfeed=newpage,
  tabsize=4,
  commentstyle=itshape,
  basicstyle=ttfamily,
  morekeywords={models, lambda, forms}
}
```


Options like tabsize and showstringspace are self-explanatory. The option
`formfeed=newpage` will replace the formfeed character by the LaTeX command `newpage`,
creating a new page at that point. Sometimes I put some line feed characters in my code
so I can do things like [narrowing to a page][4] in Emacs. Emacs shows line feed
characters as `^L`, as you can see here:

![](/img/2011-04/emacs-formfeed1.png)

The option `morekeywords` will add the keywords in the list of keywords recognized by
Listings. In my example I added `lambda`, `models` and `forms` (I've been working a lot
with Django lately), so these keywords will be pretty-printed.

Finally, I use the command `lstinputlisting` to include a source code file in the LaTeX
file (instead of having to type the whole thing in the LaTeX file). I like to separate
each section by a horizontal line and add some space at the end. I define a command to
abstract this:

```latex
\newcommand{code}[2]{
  hrulefill
  subsection*{#1}
  lstinputlisting{#2}
  vspace{2em}
}
```

So in the end this is how I insert a Python file:

```latex
\code{Models}{../testapp/models.py}
```

And this is the result:

![](/img/2011-04/listings-model1.png)

I believe that reviewing my code on paper has save me hours of work and I find listings
to be a very good option to print source code. I added a full LaTeX template [here][5].

Do you print your source code? If so, what tool do you use? Let me know in the comments.

 [1]: http://www.ctan.org/tex-archive/macros/latex/contrib/listings/
 [2]: http://www.tug.dk/FontCatalogue/beramono/
 [3]: http://mirrors.ctan.org/macros/latex/contrib/listings/listings.pdf
 [4]: http://www.gnu.org/software/emacs/manual/html_node/emacs/Narrowing.html
 [5]: https://gist.github.com/kroger/6140188
