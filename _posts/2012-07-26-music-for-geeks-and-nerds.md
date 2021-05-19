---
title: 'My ebook: Music for Geeks and Nerds'
author: Pedro Kroger
type: post
date: 2012-07-26T00:00:07+00:00
url: /music-for-geeks-and-nerds/
categories:
  - Music
  - Python
---

I'm happy to announce that I'm launching my ebook, [Music for Geeks and
Nerds][1]. It uses programming and mathematics to teach same aspects of music
and it answers long-standing questions such as why Eb and D# are different, and
which sequence _sounds_ better, Pascal's triangle or Fibonacci (place your
bets). I wrote it because I have friends who are programmers, computer
scientists, or engineers and they are always asking me for book recommendations
to learn more about music. There are good books out there, but I always feel
they present things in a prescriptive, "magical", or worse, artsy way.

<!--more-->

We can see music in three layers:

  1. **natural:** [acoustics][2] and [psychoacoustics][3].
  2. **logical:** the math for things like transposition and inversion.
  3. **social:** the result of social conventions and usage over hundreds of years such as note and interval names.

I find that hackers and programmers can learn the first two layers very quickly and, as a
result, they can have a better understanding of the social layer. In the book I explain
musical concepts in English with a corresponding implementation in Python, using the
[Pyknon][4] music library. By implementing musical concepts in a programming language we
can have a more precise way to describe and understand them.

For instance, some music students have problems to transpose notes mentally. However, it
becomes easy once you realize that transposition is nothing more than the sum of a note
and a transposition index (in the following example we use an integer notation for notes
where C = 0, C# = 1, &#8230;, B = 11):

![](/img/2012-07/transposition.png)

I wrote the book using the [reStructuredText][6] markup and I used [Sphinx][7] to
generate the following formats: black & white pdf (for the printed version), color pdf,
mobi for kindle, epub, and html (for previewing). My favorite feature in Sphinx is the
`literalinclude` directive with the `pyobject` option to include the source code of
functions and methods.

My second favorite feature is the possibility of creating custom directives. For example,
I created a directive to insert the source code and the result of its execution in a
Python REPL, as we can see in the transposition example above. I also created custom
layouts for epub, mobi, and latex, and did some bending to use [XeLaTeX][8] (to be able
to use nicer fonts). I'll write about the details of using Sphinx to write books in an
upcoming blog post.

Finally, I used the services of [Proofreadingpal][9] to professionally proofread and edit the manuscript.

I'm very pleased with the result. The idea for this book has been in the back of my head for a long time and it's a joy to finally see it materialize. If you have suggestions or questions, I'd love to hear from you.

 [1]: /mfgan/
 [2]: http://en.wikipedia.org/wiki/Acoustics
 [3]: http://en.wikipedia.org/wiki/Psychoacoustics
 [4]: https://github.com/kroger/pyknon
 [6]: http://docutils.sourceforge.net/rst.html
 [7]: http://sphinx.pocoo.org
 [8]: http://en.wikipedia.org/wiki/XeTeX
 [9]: http://proofreadingpal.com
