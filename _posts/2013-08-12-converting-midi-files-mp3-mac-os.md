---
title: Converting MIDI Files to MP3 on the Mac OS
author: Pedro Kroger
type: post
date: 2013-08-12T15:02:28+00:00
url: /converting-midi-files-mp3-mac-os/
categories:
  - Mac
  - Music
---

I often need to convert a bunch of MIDI files to MP3 for teaching and lecturing. There
are a few commercial graphical apps for the Mac and you can even use Garageband, but I
always wanted to be able to convert MIDI files using the command line since it's easier
and I can automate the whole process. On the Mac we can use Timidity++ or Fluidsynth,
both available using homebrew.

<!--more-->

## Fluidsynth

The easiest way to generate a MP3 from a MIDI on the Mac is by using [fluidsynth][1]. You can install it easily with [homebrew][2]:

```
brew install libsndfile lame
brew install --with-libsndfile fluidsynth
```

If everything is working properly, when you run `fluidsynth -T help` you should see something like the following:

```
kroger@orestes $ fluidsynth -T help
FluidSynth version 1.1.6
Copyright (C) 2000-2012 Peter Hanappe and others.
Distributed under the LGPL license.
SoundFont(R) is a registered trademark of E-mu Systems, Inc.

-T options (audio file type):
'aiff','au','auto','avr','caf','htk','iff','mat','mpc','paf','pvf','raw','rf64','sd2','sds','sf','voc','w64','wav','wve','xi'

auto: Determine type from file name extension, defaults to "wav"
```

With fluidsynth working, the conversion is simple. Just pass a [SoundFont][3] and a MIDI file as parameters and you should be good to go:

```
fluidsynth -F output.wav ~/Soundfonts/my-soundfont.sf2 myfile.midi
lame output.wav
```

If you are lazy, check [this bash script][4]. It accepts multiple MIDI files and removes the intermediate WAV file.

## Timidity++

Timidity++ is my go to program to convert midi files to wav. To install just use homebrew:

```
brew install timidity
```

You may need to create a configuration file at
`/usr/local/Cellar/timidity/2.14.0/share/timidity/timidity.cfg` and list where your
SoundFonts are. For instance, in my `timidity.cfg` file I have:

```
soundfont /Users/kroger/Dropbox/Sfonts/Steinway-Grand-Piano1.2.sf2
```

You can read more about the configuration format by using its man page: `man timidity.cfg`.

There you go. We have two ways to convert MIDI files to MP3 on the Mac using free software.

 [1]: https://sourceforge.net/apps/trac/fluidsynth/
 [2]: http://brew.sh
 [3]: http://en.wikipedia.org/wiki/SoundFont
 [4]: https://gist.github.com/kroger/6211862
 