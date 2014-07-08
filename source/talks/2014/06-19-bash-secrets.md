---
title: 10 shell secrets that will change your life FOREVER!
layout: talk
author: Malcolm Locke
venue: Christchurch Ruby
intro: Some shell (bash) tricks.
---

Spoiler:  There are only 5

---

    cd -

Change into the directory you were in before this one.  See also pushd and popd
to maintain a directory stack.

---

    CTRL+O

Use this instead of pressing enter to execute the current item in the history
and advance to the subsequent item.  Very useful for edit / compile / test
cycles.

---

    seq

Very useful for generating sequences in the shell.

    $ for i in `seq 1 5` ; do echo $i ; done
    1
    2
    3
    4
    5

---

    ${VAR-DEFAULT}

Specify an overridable default for a shell variable, great in scripts.

    $ cat default-var.sh
    #!/bin/bash
    DIR=${SPECIAL_DIR-$HOME}
    echo "DIR = $DIR"

    $ ./default-var.sh
    DIR=/home/malc

    $ SPECIAL_DIR=/foo ./default-var.sh
    DIR=/foo

---

    ESC .

Insert the last argument of the last command in the history at the cursor.
Great performing a set of command on the same file

    $ touch /really/long/filename.txt
    $ chown malc:malc <ESC> <.>
    $ chmod 644 <ESC> <.>
    $ vi <ESC> <.>

Links
-----

* [Slides](http://wholemeal.co.nz/~malc/10-bash-secrets/)
