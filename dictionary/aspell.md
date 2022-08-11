Generating a non-English dictionary for Vim spellchecking (with aspell)¶
Vim is a superb text editor, if you’re willing to go down the rabbit’s hole. One of its interesting features is spell checking, the basics of which are covered in many tutorials out there (and, of course, in the built-in help command through :help spell, if you’re feeling geekier). In this post, I’m solely concerned with the topic of generating a custom dictionary for spellchecking using a non-English language, say, Brazilian Portuguese (usually represented by the pt_BR localized language code [1]).

The basic setup for spell checking involves two settings: set spell and set spelllang=en_US (for spell checking in US English, for instance). You may prepend those to your whatever-the-format file using Vim’s modelines. For instance, in a restructuredText file (.rst) like the ones I use for writing most of this website, this can be done with

..
   vim: spell: spelllang=en_us:
And voila! When you open your file, spell checking will work out of the box: bad words will be highlighted (probably in red), as will rare words also be marked, only in a less striking color. However, if you’re writing in anything different from English (like pt_BR, in my example), Vim is going to tell you something like:

Cannot find spell file for "pt" in utf-8
Do you want me to try downloading it?
(Y)es, [N]o:
You may answer “Yes” and hope for the best, but in my case this hasn’t worked — Vim does seem to download something for a while, but afterwards, no spell wordlist is there in the default spell directory, which defaults to ~/.vim/spell. The solution is to generate a Vim-optimized spell wordlist (.spl extension) using Vim’s mkspell command, but that requires a “plain” wordlist file as input. I write “plain” because Vim’s expected wordlist input format consists in a little bit more that just one word per line: there’s a simple syntax you can use to declare regions, write comments, declare the file’s encoding, and inform that some words are particular to one or more regions. Go for :help spell-wordlist-format if you’re interested, but a basic example, taken precisely that help page, is given below:

# This is an example word list      comment
/encoding=latin1                    encoding of the file
/regions=uscagb                     regions "us", "ca" and "gb"
example                             word for all regions
blah/12                             word for regions "us" and "ca"
vim/!                               bad word
Campbell/?3                         rare word in region 3 "gb"
's mornings/=                       keep-case word
I found this Github repository with a pre-compiled wordlist, but it was outdated for 5 years and contained no instructions on how the list was generated. Of course I was not in the mood for sweeping off the dust of my 2000-or-so-pages printed dictionary and spending the rest of the month (hopefully) typing them into a gigantic file. But that is absolutely unneeded, because there many open source dictionaries available from GNU/Linux package managers (like Myspell, Asspell, Ispell, Hunspell, you name it). I found this blogpost explaining how to use Aspell (the GNU successor of Myspell, possibly already installed in Debian/Ubuntu) to dump a system-wide dictionary into a wordlist and using it as input for Vim’s mkspell command. The basic procedure was:

sudo apt install aspell-pt-br
aspell -l pt_BR dump master >/tmp/pt_br.words
vim
# now, inside vim
:mkspell ~/.vim/spell/pt /tmp/pt_br.words
However, this procedure didn’t work, and for a simple reason: the aspell dump command outputs a dictionary in a format that does not coincide with Vim’s wordlist input format that I briefly described. The /tmp/pt_br.words file contained Aspell-specific suffixes that indicate variations, declinations, and conjugations of words, for example:

 1
 2
 3
 4
 5
 6
 7
 8
 9
10
11
12
13
14
15
16
abóbora-carneira
abobarrado/D
abóbora-de-coroa
abóbora-d'água
abóbora-do-mato
abóbora-gila
aboboral/RV
abóbora-menina
aboborinha/B
abobrinha-do-mato
abobrinha-do-norte
abobrinhas-do-mato
abobrinhas-do-norte
aboborense/B
abóbora-porqueira
ababroar/akYMjL
The solution is to pipe Aspell’s output into Aspell itself again, only this time using the expand command, which replaces each line-entry by all possible variations arising from that entry’s flags. For instance, the 7th line is expanded into

aboboral aboboraizinhos aboboralzinho aboboralzões aboboralzão

Since mkspell expects one word per line, we still need to pipe this through a text substitution command (such as tr or sed) to replace spaces by newlines. The full wordlist generation command would then be

aspell -l pt_BR dump master \
   | aspell -l pt_BR \
   | tr ' ' '\n' >/tmp/pt_br.words`
However, surprisingly, not all flags were expanded when I attempted this — some entries here and there were kept flagged — I guess aspell expand only expands a limited number of flags, so the previous command might work for simpler languages. The solution was to run the output twice through aspell expand, so the final procedure I followed was

sudo apt install aspell-pt-br
aspell -l pt_BR dump master \
   | aspell -l pt_BR expand | tr ' ' '\n' \
   | aspell -l pt_BR expand | tr ' ' '\n' \
   >/tmp/pt_br.words
vim
# now, inside vim
:mkspell ~/.vim/spell/pt /tmp/pt_br.words
Finally, the ~/.vim/spell/pt.utf-8.spl file command was there, and my modelines worked without any error messages!

Final words
Vim’s compressed wordlist format (~/.vim/spell/pt.spl) does not contain region codes in its name — it is region agnostic. However, it is perfectly fine to declare spelllang with a region-specific variation for spellchecking your file — Vim will know how to select words for your region — and compressed wordlist may be assembled from multiple wordlists (from different regions). For instance, if I wanted to combine Brazilian and Portuguese variations of the Portuguese language into a single dictionary, this could be accomplished with

sudo apt install \
   aspell-pt-br \
   aspell-pt-pt
aspell -l pt_BR dump master \
   | aspell -l pt_BR expand | tr ' ' '\n' \
   | aspell -l pt_BR expand | tr ' ' '\n' \
   >/tmp/pt_br.words
aspell -l pt_PT dump master \
   | aspell -l pt_PT expand | tr ' ' '\n' \
   | aspell -l pt_PT expand | tr ' ' '\n' \
   >/tmp/pt_pt.words
vim
# now, inside vim
:mkspell ~/.vim/spell/pt /tmp/pt_br.words /tmp/pt_pt.words
Also, an interesting way to keep your dictionaries in sync across multiple machines is to put your spell directory in Dropbox, and link ~/.vim/spell to it. This is specially nice if you also want to use a complementary file for adding words (like acronyms, jargon, rare words, names, foreign terms, etc.) as you go. In my case, it resorts to keeping the wordlist file pt.utf-8.add in my Dropbox-versioned Vim spell checking directory. Vim takes care of occasionally generating a compressed file ~/.vim/spell/pt.utf-8.add.spl out of ~/.vim/spell/pt.utf-8.add automatically.

Notice that the .utf-8 affix is only there because my Vim and system’s default encoding is UTF-8.
