#!/bin/sh
#
# Copyright (c) 2003-2011 Eric Will <rakaur@malkier.net>
# Rights to this code are documented in doc/LICENSE.
#
# This file generates version.c.
# Stolen from ircd-ratbox.
#

spitshell=cat
package=shrike

echo "Extracting $package/src/version.c..."

if test -r version.c.last
then
   generation=`sed -n 's/^const char \*generation = \"\(.*\)\";/\1/p' < version.c.last`
   if test ! "$generation" ; then generation=0; fi
else
   generation=0
fi

generation=`expr $generation + 1`

uname=`uname`

creation=`date | \
awk '{if (NF == 6) \
         { print $1 " "  $2 " " $3 " "  $6 " at " $4 " " $5 } \
else \
         { print $1 " "  $2 " " $3 " " $7 " at " $4 " " $5 " " $6 }}'`

$spitshell >version.c <<!SUB!THIS!
/*
 * Copyright (c) 2003-2011 Eric Will <rakaur@malkier.net>
 * Rights to this code are documented in doc/LICENSE.
 *
 * This file contains version information.
 * Autogenerated by version.sh.
 *
 */

const char *generation = "$generation";
const char *creation = "$creation";
const char *platform = "$uname";
const char *version = "$1";

const char *infotext[] =
{
  "Shrike IRC Services --",
  "Copyright (c) 2003-2011 Eric Will <rakaur@malkier.net>",
  " ",
  "All rights reserved.",
  " ",
  "Redistribution and use in source and binary forms, with or without modification,",
  "are permitted provided that the following conditions are met:",
  " ",
  "      Redistributions of source code must retain the above copyright notice,",
  "      this list of conditions and the following disclaimer.",
  " ",
  "      Redistributions in binary form must reproduce the above copyright notice,",
  "      this list of conditions and the following disclaimer in the documentation",
  "      and/or other materials provided with the distribution.",
  " ",
  "      Neither the name of the author nor the names of its contributors may be",
  "      used to endorse or promote products derived from this software without",
  "      specific prior written permission.",
  " ",
  "      Redistributions and derivative works may not be licensed under the",
  "      GNU General Public License without specific prior written permission.",
  " ",
  "THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS \"AS IS\" AND",
  "ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED",
  "WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE",
  "DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR",
  "ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES",
  "(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;",
  "LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON",
  "ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT",
  "(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS",
  "SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.",
  " ",
  "Currently Shrike consists of the following developers:",
  "  rakaur, Eric Will <rakaur@malkier.net>",
  " ",
  "Thanks to testers, contributors, etc:",
  "  sycobuny, Stephen Belcher <sycobuny@malkier.net>",
  "  rintaun, Matt Lanigan <rintaun@projectxero.net>",
  "  Hwy, W. Campbell <wcampbel@botbay.net>",
  "  naki, Adam Walls <naki@coreag.net>",
  "  Rob_X, Mikael <mickek15@hotmail.com>",
  "  madragoran, Mike Campbell <madragoran@avendesora.net>",
  "  dKingston, Michael Rodriguez <dkingston02@gmail.com>",
  " ",
  "Special thanks to:",
  "  Hwy, for your continued patience while I badger you endlessly.",
  "  sycobuny, for your continued not-killing-me while I badger your code.",
  "  tanka, for the book I will someday repay you for.",
  "  dbn, for the original Website.",
  " ",
  "<@anfl> that's not a server though",
  "<@anfl> that's a penis",
  0,
};
!SUB!THIS!
