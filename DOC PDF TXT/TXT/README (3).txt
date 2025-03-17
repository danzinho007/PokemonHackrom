-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Pokemon Prism - version 0.95, build 0254
****************************************

(File hashes have been moved to the bottom of this file.)

This is Pokemon Prism! Thanks for downloading this game; we hope you enjoy it.
Visit https://rainbowdevs.com/prism-setup for a step-by-step guide for setting
up your game, or read below.

If you want to find what's new in this version, check the changelog.txt file.

New game
********

To start a new game, you will need:
* A ROM of Pokemon Crystal (version 1.0 or 1.1), English (USA) version, to use
  for patching.
* Game Boy Color emulator. We recommend one of the following:
  * BGB (https://bgb.bircd.org/): this will run on Windows, or under Wine on
    Linux and Mac.
  * SameBoy (https://sameboy.github.io/): runs on macOS (with additional
    features), Windows and Linux.
  * Emulicious (https://emulicious.net/): multi-system emulator that runs on
    any platform with a Java runtime available.
  Other emulators may also work; try them if you want. DO NOT USE ANY VARIANT
  OF VISUAL BOY ADVANCE (including VBA-M): we know those emulators aren't
  accurate enough for the game to run properly.

1. Load the game files into the patcher provided (patcher_unified.htm).
2. Click "Begin Patching" and then "Release ROM".
3. Click "Get File" and save the game in a safe place.
4. Open your emulator and start the game.

Note that the game will work without issues on an actual Game Boy Color, if you
have one; in that case, you will need a flash cart to save the ROM on. Please
refer to your cart's manual for details on how to save the ROM file onto it.

Update existing game
********************

To update an existing copy of Pokemon Prism, you will need:
* A ROM of Pokemon Crystal (version 1.0 or 1.1), English (USA) version, to use
  for patching.
* Your old save file (.sav, NOT a savestate) to be patched as well.
You will need a clean ROM - you cannot update an existing Pokemon Prism ROM file.

1. Save the game in a Pokemon Center (not the backroom).
2. Back up your files.
   * Make a copy of your game and save files somewhere else!
3. Load the pokeprism.bsp file and your Crystal ROM (.gbc) into the patcher
   included in this folder (patcher_unified.htm).
4. Click "Begin Patching", then "Release ROM", then "Get File". Replace your
   old Prism ROM.
5. Load the pokeprism.bsp file and your save file (.sav) into the patcher.
6. Click "Begin Patching" and follow the instructions. Replace your old Prism
   save with the patched file.
7. Launch the game. Walk out of the Pokemon Center WITHOUT talking to anyone,
   and save your game again.

Additional information
**********************

Note that you can also use the patch to convert a debug ROM to a release ROM
and vice-versa. This does not require updating your savefile at all.

The pokeprism.bsp file contains the patch, and it is also signed (with the
same key that the leakers used to sign their version, which is also included in
this distribution as key.gpg). This file is signed with the same key as well.

You can find future updates and contact us at the following:

Website: https://rainbowdevs.com
Twitter: @rainbowdevs
Mastodon: @rainbowdevs@donphan.social
Reddit: https://reddit.com/r/pokemonprism
Discord: https://discord.gg/pmysaXn

Have fun!

About us
********

    ____        _       __                  ____
   / __ \____ _(_)___  / /_  ____ _      __/ __ \___ _   _______
  / /_/ / __ `/ / __ \/ __ \/ __ \ | /| / / / / / _ \ | / / ___/
 / _, _/ /_/ / / / / / /_/ / /_/ / |/ |/ / /_/ /  __/ |/ (__  )
/_/ |_|\__,_/_/_/ /_/_.___/\____/|__/|__/_____/\___/|___/____/

As you may or may not know, the leakers were looking for people who would be
able to update the game, fix bugs, introduce new features, and so on. We
assembled a team out of a few interested people, various developers who came
from 4chan and were interested, and just people who heard about the project and
wanted to join in, and we contacted the leakers offering to handle the project
from now on; they accepted our offer, and gave us the private key they used to
sign the leaked ROM and the credentials for the email they had created and
posted on the old README (prism-distrib@sigaint.org). (Sadly, we have not been
able to access the email account. UPDATE: sigaint.org is down, so accessing
that email is impossible now.)

So let this be one of the few ROM hacks to be handled by three distinct teams
at different times. We're RainbowDevs, and we're going to keep developing this
game and releasing updates from now on.

File manifest
*************

This section contains SHA-256 hashes for all other files in the package, for
people who want to verify the integrity of the files they received. You can
ignore this list safely unless you need it for some purpose, as well as the
signature data underneath it.
(Source code and generated images not included in the file manifest, as they
can be validated by rebuilding the ROM.)

2a6dee35af9574193a883c655ac007c969ecf6bebc42cff663057b772563d8ea  ./changelog.txt
9250e23b9959de96e61b911fe7bf451c675e3beb7672c8713bf6f660ba8be626  ./key.gpg
750bb8695e45cb58d3c5278704267e0fa47014cb9802d4cee9980557c7824638  ./node_patcher.js
48f92c111a9a04fc92f4e419a23e8a30af0f357735286daa685226b2fe0fe7a9  ./patcher/bsppatch.js
9ba4495e01e8b5318018025a5f9abd9ecdd63982233cd142ab4adf3c99d57577  ./patcher/patcher.htm
4873ca98cbc9f9c58385dde4af1a2165b81855fc0f4ad19f437def93210a3b8e  ./patcher_unified.htm
52b7df261ce9c4e91a37673df802640c7935e1dfe02cfcc930e1dfd3aee9ac63  ./pokeprism.bsp
48f72da58893d5ce099dc2e292fbd4c8788979882edfcd8db006ebc216156599  ./pokeprism.sig

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEfjkGSNmLGMc9ryCW8+U8wrIk6eUFAmTm63QACgkQ8+U8wrIk
6eWUowgAhuLMzGj/lXI4zo2j5l/5j1U+Low3rR9i/6yvfBCt5fC+HNb2GAB0Q0Kc
GYxfj/kU7MPWwr8leZzIjjJMb42cL9tPTnDh463NDGeN7r5guEsk9pNf6FiBFG+O
JveVON2W7JRJ19s7beEVBYYCRlgjhXyr/i8zMvbCQlUlTQ5X9B7eQyBQdPhxpBOf
acdBvlh4x/60JYYorBwSKpwM+2WikMHM6NPvipPlUBvWLJ9JiEpplHFXz6cgKkYV
Nld0mq7Vu4kD4cNK6VklvA+X5T56yi2UYoO0qs3xMA7P2WePCTisw3txvm0t0wDe
UVtHRWhOqDnqUhTgENRY0DzQyuDiqA==
=hzl1
-----END PGP SIGNATURE-----
