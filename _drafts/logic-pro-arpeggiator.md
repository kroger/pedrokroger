---
layout: post2
title: Arpeggiator Patterns in Logic Pro
date: 2021-12-07 14:15 -0300
author: Pedro Kroger
url: /logic-arpeggiator/
categories: [Logic, Music]
---

Logic Pro has a powerful arpeggiator that sometimes is overlooked. Logic's
documentation is great, with thosands of pages of information freely available.
Unfortunately, the documentation on the arpeggiator can be hard to understand
due to lack of examples, cryptic language, and even some mistakes. In this
article we will look into some patters we can generate with the arpeggiator.

In this article I'll only focus on the pre-determined note orders and the four
variations, octave range and octaving mode. However, arpeggiator is capable of
having more complex, user-defined patterns.

As you know, we can select a note order by clicking in one of the six buttons in
the section "Note Order".

{% img ui-note-order.png 70% %}

We can also select one of four variations and one if four

| {% img ui-oct-range.png 286 %} | {% img ui-inversions.png 250 %} |

The label "Inversions" can be misleading. It's actually a variation of the
octave range. In fact, it's labeled "Octaving Mode" when switching the interface
from editor to controls:

{% img ui-controls.png 40% %}

we can select a octave range and a octaving mode: either "Octaves" or
"Inversions". Maybe it's me, but I find confusing in the editor interface but
clear on the controls interface:

| {% img ui-controls-octave1.png 90% %} | {% img ui-controls-octave2.png 90% %} |


## Arpeggios

An arpeggio is a broken chord, where the notes of the chord are played in
sequence rather than at the same time. Paganini's first caprice is basically
composed of arpeggios:

<iframe width="560" height="315" src="https://www.youtube.com/embed/8ftpFfmW2nE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

An arpeggiator generates musical patters given one or more notes. The most
common use of an arpeggiator is to create arpeggios, hence the name
_arpeggiator_. For instance, we can write the chords for Paganini's first
caprice:

{% img paganini1.png 50% %}

And the arpeggiator will generate automatically the required sequence to make it
sound like the original:

{% img paganini2.png 50% %}

The advantage of using an arpeggiator instead of writing the notes manually

## Variations

When the octave range is 1 we have no change of octave and the variations are
straighforward:

| Var | Pattern           | 3 Notes                          | 4 Notes                          |
|-----|-------------------|----------------------------------|----------------------------------|
| 1   | [1,2,3] [1,2,3,4] | {% img pattern3-var1-inv1.png %} | {% img pattern4-var1-inv1.png %} |
| 2   | [2,1,3,4] **(1)** | {% img pattern3-var2-inv1.png %} | {% img pattern4-var2-inv1.png %} |
| 3   | [3,1,2,4] **(1)** | {% img pattern3-var3-inv1.png %} | {% img pattern4-var3-inv1.png %} |
| 4   | [1,3,2] **(2)**   | {% img pattern3-var4-inv1.png %} | {% img pattern4-var4-inv1.png %} |
{: .table .table-sm .table-border }

**(1)** This is a fixed four-note pattern, it'll always have four notes even if
the chord has less than four notes. The [manual] says "If there are fewer than
four notes, the steps without an assigned key are skipped. Once all keys are
played, the arpeggio restarts with the lowest note." But it's hard to understand
what it means to skip a note in this context. The "skipped" notes are in green
in the examples. It seems it will add a note from the chord for each skipped
note in order.

| Variation 2 (2 notes)            | Variation 3 (2 notes)            |
|----------------------------------|----------------------------------|
| {% img pattern2-var2-inv1.png %} | {% img pattern2-var3-inv1.png %} |

[manual]: https://support.apple.com/guide/logicpro/note-order-variations-lgce2a5ad7b7/10.7/mac/11.0

**(2)** This is a fixed three-note pattern. The [manual] says "this variation,
which consists of three steps, plays up and overlaps; all pressed keys are
divided into groups of three with the note order applied to all groups. If there
are fewer than three notes, the steps without an assigned key are skipped. Once
all keys are played, the arpeggio restarts with the lowest note." But what
"overlaps" means in this context? Why does it become a six-note pattern when the
chord has four notes?

pattern5 and pattern6 are the same

| {% img pattern5-var4-inv1.png %} | {% img pattern7-var4-inv1.png %} |


3 - 3
4 - 6
5 - 6
6 - 6
7 - 9

Variation 1, Inversions

| Inv | 3 Notes                          | 4 Notes                          |
|-----|----------------------------------|----------------------------------|
| 1   | {% img pattern3-var1-inv1.png %} | {% img pattern4-var1-inv1.png %} |
| 2   | {% img pattern3-var1-inv2.png %} | {% img pattern4-var1-inv2.png %} |
| 3   | {% img pattern3-var1-inv3.png %} | {% img pattern4-var1-inv3.png %} |
| 4   | {% img pattern3-var1-inv4.png %} | {% img pattern4-var1-inv4.png %} |
{: .table .table-sm .table-border }

| Inv | [a c e g]                        | [a c e a]                         |
|-----|----------------------------------|-----------------------------------|
| 1   | {% img pattern4-var1-inv1.png %} | {% img pattern4-var1-inv1.png %}  |
| 2   | {% img pattern4-var1-inv2.png %} | {% img pattern4-var1-inv2a.png %} |
| 3   | {% img pattern4-var1-inv3.png %} | {% img pattern4-var1-inv3a.png %} |
| 4   | {% img pattern4-var1-inv4.png %} | {% img pattern4-var1-inv4a.png %} |
{: .table .table-sm .table-border }
