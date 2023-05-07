-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512


Pokemon Prism - version 0.94, build 0237
****************************************

Patch (pokeprism.bsp):
MD5: 83cac62b35918f99cc36ef89e1f9826a
SHA-1: d5e95ed141ce4a28c80ad9dc6aa45f48a436408a

Release ROM:
MD5: 3cd828587eb8d3fe818d57f99b3a3c95
SHA-1: bc5585d22eac662b654956b88c2d9f11e7ee862b

Introducing to you, the newest version of Pokemon Prism! Thanks for downloading
this game, and we hope you enjoy it.
We have packaged the game into a single patch file that serves for all purposes
(that is, it contains both the debug and release versions, as well as the
savefile patch). In order to apply that patch, make sure you have a clean ROM
of Pokemon Crystal (in English, both versions 1.0 and 1.1 are acceptable), and
go to http://pokemonprism.com/patcher.html to apply the patch; alternatively,
you can use the patcher included in the distribution package itself.
Note that you will also have to patch your savefile; this patch does that job
as well. (For Virtual Console users: it is possible to extract the savefile
from your VC, and it is already in the right format for the patcher to use.)
Note that you can also use the patch to convert a debug ROM to a release ROM
and vice-versa. This does not require updating your savefile at all.

The pokeprism.bsp file contains the patch, and it is also signed (with the same
key that the leakers used to sign their version, which is also included in this
distribution as key.gpg). This file is signed with the same key as well.

If you already have a savefile and you intend to patch your game to the newest
version, please make sure that you save inside a Pokemon Center (in the room
where you heal your Pokemon, not in the backroom) before updating, and exit the
Center immediately after the update. That will prevent map data from being
corrupted by the update.

You can follow us on Twitter (@rainbowdevs) for future updates. Also, some of
us will most likely be available in the Prism discord; you can join using the
following invite link: https://discord.gg/pmysaXn.

Changelog
*********

Version 0.94, build 0237 (18 July 2020):
* Magikarp Caverns rapids can now be entered with up to 35 items in the pack
* Evolution items now correctly determine whether a Pokemon can evolve for
  gender-dependent evolutions
* Fixed all QR codes
* Gas type now resists Ground-type and Fairy-type moves, no longer resists
  Bug-type moves, is no longer weak to Ice-type and Sound-type moves, and is
  now weak to Electric-type moves
* Ghost type no longer resists Gas-type moves
* Normal type no longer resists Sound-type moves
* Psychic type is no longer weak to Sound-type moves
* Sound type is no longer weak to Normal-type moves
* Water type is now weak to Sound-type moves
* Mew and Varaneous can now learn all possible TM and HM moves
* Rampardos can now learn Body Slam via TM
* Slowking can now learn Boil via TM
* Crobat can now learn Cosmic Power via TM
* Raiwato can now learn Crystal Bolt via TM
* Mamoswine can now learn Defense Curl via TM
* Onix can now learn Dragonbreath via TM
* Mamoswine can now learn Dust Devil via TM
* Dusknoir and Fambaco can now learn DynamicPunch via TM
* Chingling line, Feebas line, Illumise, Snorunt, Taillow line and Volbeat can
  now learn Endure via TM
* Bellsprout line, Fambaco, Magnemite line, Phancero, Sylveon and Tentacool
  line can now learn Headbutt via TM
* Phancero can now learn Hidden Power via TM
* All Eeveelutions can now learn Mustard Gas via TM
* Luxray can now learn Night Shade via TM
* Slowking can now learn Noise Pulse via TM
* Libabeel can now learn Prism Spray via TM
* Electivire, Glaceon, Leafeon, Slowking and Umbreon can now learn Reflect
  via TM
* Scizor can now learn Sky Attack via TM
* Abra line, Geodude line and Phancero can now learn Swift via TM
* Ariados, Goldeen line, Rapidash and Yanma line can now learn Swords Dance
  via TM
* Raiwato can now learn Thunder Wave via TM
* Steelix can now learn Void Sphere via TM
* Rhyperior and Slowking can now learn Zap Cannon via TM
* Some minor text fixes
* Tool compatibility: source code now works on latest RGBDS, and Polished Map
  collisions work on maps

Version 0.94, build 0235 (1 June 2019):
* Added GBS file generation for music players (and added it to the patch)
* Fixed old patch bug breaking the bag data for builds before 0223
* Fixed tearing in stats screen
* Added new song for trainer battles in Naljo
* Battles in Pokemon-only mode now show the proper coloring for the player's
  Pokemon when it is sent out if it is shiny
* Illumise and Volbeat can now generate each other's eggs when breeding
* Porygon-Z and Swellow can now learn Hyper Voice via TM
* Nickname screen automatically switches to lowercase after entering the first
  letter
* Ensured that trainers in route 66 cannot approach you from off-screen
* Swapped Andre's Full Heal for a Lum Berry
* Attacks that don't affect the opponent now print the correct failure message
  after an ability blocked a previous attack in the same battle
* Fixed flicker in title screen
* Changed the formatting of the version and build number in the main menu
* Title screen now says "2017-2019 RainbowDevs"
* Improved some trainer sprites
* Minor visual improvements in the player customization screens
* Fixed a broken arrow in the Token Tracker screen
* Some text and map fixes

Version 0.94, build 0229 (1 June 2018):
* Fixed bug related to Pickup that would cause the wrong message to be printed,
  as well as occasional crashes
* Happiness no longer overflows to zero when maxed out
* Minor text and map fixes

Version 0.94, build 0228 (20 May 2018):
* Fixed the cries of a few Pokemon that had gotten distorted
* Added an additional textbox border to the options
* Graphical glitches fixed in the initial warp animation into the overworld
  when the player starts a new game
* Fossil Case now displays the number of fossils it contains when used
* Replaced duplicate trainer in route 76 by the one it should have been
* Many text fixes

Version 0.94, build 0227 (25 April 2018):
* Fixed bug that would cause trade evolution Pokemon to spontaneously evolve
  after gaining a level in battle under certain circumstances
* Spurge Bank now correctly handles balances above 1 million
* Fixed NPC sprites in Castro Gym
* Mean Look now works as expected
* Minor accuracy fixes with Pickup's out-of-battle effect
* Trade Stones now properly show whether they can be used or not
* Fixed color glitch in Trainer Card badge screen
* Title screen now says "2017-2018 RainbowDevs"
* Minor text, map and event fixes

Version 0.94, build 0226 (29 December 2017):
* Fixed bug that caused the "battle won" scene to repeat itself under certain
  conditions
* Winning a trainer battle no longer caps your money at 999,999
* Status conditions are now healed between Battle Arcade rounds

Version 0.94, build 0225 (22 December 2017):
* Expanded pack space: items pocket can now hold 40 stacks of items (was 30),
  key items pocket can now hold 50 items (was 23), and PC can now hold 60
  stacks of items (was 50)
* Improved Town Map
* Max money raised to 9,999,999
* Fixed some NPCs looking like the player (Botan City, Route 62)
* Eggs no longer play a cry when deposited or withdrawn
* Pokerus indicator is now a face, as in later generations
* Fixed Azumarill's base stats (speed and special attack were swapped)
* Fixed Pink Bow's description
* Fixed Belly Drum's type and category data
* Attempting to sell a large stack of items (total price above 999,999) no
  longer displays glitched characters
* Slightly improved the RNG
* Minor text and map fixes

Version 0.94, build 0223 (4 October 2017):
* Fixed crash when using a sleep-inducing move against an opponent with Mold
  Breaker
* Fixed broken colors in menus when using Iron Pickaxe
* Naljo Ruins' roof now has the correct encounters
* Minor adjustments in Route 55 (some grass removed)
* Provincial Park minigame now properly handles a full PC box
* Hidden Power now deals damage as intended, instead of reusing the previous
  attack's stat and move power values
* Salamence now learns Storm Front via TM
* Gliscor now learns Fly via HM
* Minor text and map fixes

Version 0.94, build 0222 (12 August 2017):
* Fixed data decompression issues that were causing visual glitches and crashes
  when displaying certain Pokemon pictures
* Rayquaza now learns Storm Front via TM

Version 0.94, build 0221 (12 August 2017):
* Fixed Perish Song crash
* Southerly City's Stamina Challenge now saves your prize if you don't have
  enough room in your pack to pick it up
* Colored switches in Milos Catacombs now say the color they are when pressed
* Laurel Lab scientist now accepts fossil donations (as a way of getting rid of
  unwanted fossils)
* Southerly City gym leader now plays the proper pre-battle animation and
  victory music
* Orphan Card now displays correctly point counts of 10,000 and above
* Articuno, Zapdos and Moltres can now enter the Battle Tower
* Slightly improved Dusknoir's back sprite
* Bagon learns Dragon Dance via breeding

Version 0.94, build 0220 (3 August 2017):
* Fixed crash related to Gold Token marts

Version 0.94, build 0219 (1 August 2017):
* Battles with NPCs no longer cause crashes (introduced in previous build)
* Abilities are now back to normal (bug introduced in previous build)
* Altered how abilities of NPCs' Pokemon are determined

Version 0.94, build 0218 (1 August 2017):
* Avoid potential bugs with Flame Body or Magma Armor coming from last build's
  egg-hatching-related fix
* Improved graphics in Oxalis Gym
* Battle Tower and Battle Arcade shops now sell stacks of items
* Minor visual updates and bug fixes

Version 0.94, build 0217 (30 July 2017):
* Various crash screen-related errors and crashes fixed
* Route 49 cannot be entered without a bike
* Pokemon with Flame Body or Magma Armor now speed up egg hatching even when
  not at the top of the party
* Move info screen now labels power as 'Pow', not 'Atk'
* Iron Pickaxe should no longer create purple-colored screens when used by
  female players
* Burnt Berries are now sellable and tossable, preventing someone from being
  stuck with them
* Volbeat and Illumise can now generate each other via breeding
* Pokemon received via events will now have the correct held items even when
  sent to the PC
* Fixed bug where deducting PP from a move (due to using it in battle) would
  also reset PP Ups
* Void Sphere now has 15 PP
* Ghost Hammer now has 85 power, 100% accuracy and 15 PP
* Naljo Fury now makes STAB moves deal 250% damage (was 300%) while in Naljo
  and in link battles or battle facilities
* Fixed Groudon's Pokedex entry
* Arcanine and Vulpix now learn Body Slam via TM
* Lunatone and Solrock now learn Cosmic Power via TM
* Gliscor now learns Dark Pulse via TM
* Hitmontop and Jigglypuff line now learn Dig via TM
* Buneary line and Torkoal now learn Double Team via TM
* Sylveon now learns Endure via TM
* Cacnea and Chimecho now learn Energy Ball via TM
* Spiritomb now learns Flash via TM
* Onix now learns Flash Cannon via TM
* Sableye now learns Ice Punch via TM
* Graveler, Golem and Togekiss now learn Metronome via TM
* Feebas line now learns Protect via TM
* Magby and Spiritomb now learn Psychic via TM
* Moltres now learns Sandstorm via TM
* Slowbro now learns Seismic Toss via TM
* Gliscor now learns Sky Attack via TM
* Zubat and Golbat now learn Sludge Bomb via TM
* Togekiss now learns Sunny Day via TM
* Feebas line and Sylveon now learn Swagger via TM
* Mewtwo and Snorlax now learn Thunder via TM
* Slowking now learns Thunder Wave via TM
* Spearow line now learns Tri Attack via TM
* Ho-Oh now learns Will-O-Wisp via TM
* Porygon now learns Zap Cannon via TM

Version 0.94, build 0215 (26 July 2017):
* Items PC now shows item quantities for all items (including key items)
* Buneary line and Phanpy line now learn Defense Curl via TM
* Bronzong and Drifloon line now learn Explosion via TM
* Dusclops, Flaaffy and Ampharos now learn Fire Punch via TM
* Altaria, Feebas line, Gyarados, Mewtwo and Sylveon now learn Iron Tail via TM
* Goldeen and Spinarak line now learn Megahorn via TM
* Hitmontop, Torkoal and Wailmer line now learn Rollout via TM
* Buneary line, Lucario, Mewtwo, Togekiss and Zubat line now learn Shadow Ball
  via TM
* Lotad, Mawile and Surskit line now learn Sweet Scent via TM
* Exeggcute line now learns Swords Dance via TM
* Intimidate now triggers after a faint-induced switch
* Pressure no longer decreases the PP of moves that don't target its owner
* Entry and end turn abilities should now process in the right order
* Waterfall now has a 20% flinch chance (was 0%)

Version 0.94, build 0214 (25 July 2017):
* Rampardos, Steelix and Tentacool line now learn Cut via HM
* Altaria and Tangela line now learn Rock Smash via HM
* Bronzong, Jigglypuff line, Lopunny, Pikachu, Raichu, Ponyta line, Shinx line,
  Slowpoke, Slowbro and Tangrowth now learn Strength via HM
* Rayquaza now learns Surf via HM
* Confusion now only triggers 1/3 of the time instead of 1/2
* Paralysis halves speed instead of quartering it
* Non-damaging sound moves now properly handle substitutes
* NPC battles' AI now properly handles X items
* NPCs can now use Full Heals to heal confusion and nightmare statuses
* Redesigned crash screen

Version 0.94, build 0213 (24 July 2017):
* Smelting no longer causes crashes
* Battle Tower attendant's initial menu no longer contains a blank entry
* X items should now behave properly
* Aggron, Charmander line, Mamoswine, Mawile, Numel line and Togekiss now learn
  AncientPower via TM
* Duskull, Espeon, Umbreon, Gligar, Ninetales, Spiritomb and Togekiss now learn
  Dream Eater via TM
* Breloom, Dusclops, Flaaffy, Groudon, Lombre, Mewtwo, Sableye and Whismur line
  now learn DynamicPunch via TM
* Gallade, Magcargo, Magmortar and Phanpy line now learn Earthquake via TM
* Flygon and Numel line now learn Fire Blast via TM
* Flygon, Numel line, Slowpoke and Slowbro now learn Flamethrower via TM
* Duskull line, Gengar, Misdreavus line, Onix, Sableye and Shuppet line now
  learn Headbutt via TM
* Metang, Togetic, Trapinch and Vibrava now learn Hyper Beam via TM
* Mareep line and Togekiss now learn Safeguard via TM
* Arcanine, Houndour, Leafeon, Moltres, Ninetales, Ponyta line and Snorlax now
  learn Solarbeam via TM
* Snorlax now learns Thunderbolt via TM
* Cacnea, Charmander line, Geodude line, Groudon, Lombre and Pichu now learn
  ThunderPunch via TM
* Cranidos line, Crobat, Makuhita line, Skorupi line and Snorlax now learn
  Whirlwind via TM

Version 0.94, build 0212 (23 July 2017):
* Minor fixes related to the switches in the Goldenrod basement
* Multi-hit moves now use gen 5+ chances to determine how many hits to deal
* Larvitar and Pupitar now learn Iron Tail via TM, and Pupitar learns Hyper
  Beam via TM
* Anorith line, Aron line, Articuno, Bagon, Shelgon, Charmander, Charmeleon,
  Cyndaquil line, Flygon, Gible line, Gliscor, Groudon, Hitmontop, Ho-Oh,
  Kangaskhan, Leafeon, Lugia, Masquerain, Metang, Metagross, Moltres, Paras
  line, Pidgey line, Rayquaza, Scizor, Skorupi line, Sneasel line, Spearow
  line, Swablu, Taillow, Tangrowth, Teddiursa line, Togetic, Togekiss, Totodile
  line, Tyranitar, Venomoth, Zapdos and Zubat line learn Aerial Ace via TM
* Duskull line, Glaceon, Goldeen line, Kyogre, Rayquaza, Swinub line and
  Weavile now learn Blizzard via TM
* Lotad, Lombre, Paras line, Pikachu, Raichu, Rhyhorn, Riolu, Slowbro and
  Taillow now learn Counter via TM
* Breloom, Gible line, Goldeen line, Leafeon, Lopunny, Mamoswine, Quilava,
  Typhlosion, Rayquaza, Rhyperior, Riolu line, Shelgon, Salamence, Shinx line,
  Slowking and Trapinch line now learn Fury Cutter via TM
* Duskull line, Goldeen line, Rayquaza, Swablu and Swinub line now learn Ice
  Beam via TM
* Chinchou line, Drifloon line, Duskull line, Gastly line, Jigglypuff line,
  Lotad line, Mawile, Metang, Metagross, Misdreavus line, Rayquaza, Relicanth,
  Rhyperior, Sableye, Shuppet line, Spiritomb, Weavile and Whismur line now
  learn Icy Wind via TM
* Electabuzz line, Jigglypuff line, Lunatone, Machop line, Mamoswine, Marill
  line, Paras line, Ralts line, Scyther line, Slowking and Solrock now learn
  Light Screen via TM
* Articuno, Goldeen line, Growlithe line, Metang, Metagross, Moltres, Numel
  line, Rayquaza, Whismur and Zapdos now learn Mud-Slap via TM
* Cacnea line, Donphan, Goldeen line, Haunter, Gengar, Gligar line, Hitmonlee,
  Machop line, Makuhita line, Rapidash, Rhyhorn line, Riolu line, Spinarak
  line, Tangrowth and Tentacool line now learn Poison Jab via TM
* Butterfree, Hitmontop, Machop line, Mamoswine, Pidgey line, Scyther, Spearow
  line, Spiritomb, Tyrogue, Zubat and Golbat now learn Rain Dance via TM
* Jigglypuff line, Lunatone, Mamoswine, Ralts line, Solrock and Tangela now
  learn Reflect via TM
* Blastoise, Charmander line, Dusclops and Dusknoir now learn Rock Slide via TM
* Porygon line, Slowking, Surskit line and Togekiss now learn Signal Beam
  via TM
* Bellsprout line, Butterfree, Growlithe line, Raichu, Scyther, Shinx line and
  Tentacool line now learn Thief via TM
* Some text fixes

Version 0.94, build 0211 (21 July 2017):
* Ore Case giveaway now properly checks for space in the Key Items pocket
* Smelting no longer crashes the game
* Fixed visual glitches in Iron Pickaxe menu
* Iron Pickaxe no longer complains about not being charged when you don't have
  one at all
* TokenTracker should now report information correctly
* Prz Guard now properly prevents paralysis (instead of confusion)
* Meteor Mash now has the correct effect
* Fixed AI-induced crash after using all possible moves in a battle
* Stat experience is now properly awarded after battles
* Minor text fixes

Version 0.94, build 0210 (18 July 2017):
* Actually added the 100th Gold Token mentioned in a previous update (in Tunod
  Waterway)
* New key items: Time Machine (allows changing the in-game time), TokenTracker
  (tracks collected Gold Tokens and shows their locations), Smelter (allows
  smelting ores in the overworld), Ore Case (holds smelted ores to be sold),
  Iron Pick (reusable mining pick), Hyper Share (similar to late generations'
  Exp. Share)
* Itemfinder (replacing Tokenfinder) now detects all kinds of hidden items
* New held items: Macho Brace, Wise Glasses, Muscle Band, Expert Belt
* New secret shop (details withheld for obvious reasons)
* 24-hour time format is now default; 12-hour still selectable via options menu
* Redesigned time-setting interface
* Gold Token reward redesign, changing some of the prizes, their costs, and
  ensuring that the player can get one (and exactly one) of each item offered
* Refunded Gold Tokens via savefile patch for former Gold Token prizes now
  removed from listing
* Some Bingo prizes changed
* Fixed Feebas's base Special Defense (53 -> 55)
* Fixed egg groups for Aron, Lairon, Aggron, Spearow, Fearow, Feebas, Milotic,
  Trapinch, Vibrava and Relicanth
* Pineco can now learn Signal Beam via TM
* Forretress can now learn Iron Head and Zap Cannon via TM
* Yanma can now learn Aerial Ace via TM
* Conversion2 now works as intended in all cases and doesn't cause crashes
* Fixed bug with detection of charging battlers (i.e., battlers that were in
  the charging turn for some two-turn move)
* Various text fixes

Version 0.94, build 0208 (15 July 2017):
* Healing moves based on time of day no longer crash the game
* Sleep moves can be used against substitutes without crashing the game

Version 0.94, build 0207 (14 July 2017):
* Moraga Town's Pokemart sign no longer crashes the game
* Trainer in Route 69 now has a team appropriate for that stage in the game,
  instead of a late-game team
* Merson and Moraga Gym leaders now wait for a button press before beginning
  the battle
* Torenia City celebrity and Route 53 free sample man now wait for a button
  press before closing the dialogue boxes
* Missing NPC in Botan City is now reachable by the player
* Shroomish line can now learn Sludge Bomb via TM, and Breloom can now learn
  Rock Slide and Iron Tail via TM
* Breloom can now learn Cut via HM
* Bronzor can now learn Iron Head via TM
* Metagross cannot learn Fire Punch via TM any longer
* Accuracy and effect accuracy calculations are now exact, devoid of rounding
  errors and up to late gen standards
* Focus Band now has a 10% chance of triggering (was 11.71875%)
* King's Rock now behaves as expected and has a 10% chance of triggering
* BrightPowder, Hustle and CompoundEyes' accuracy modifiers now apply
  multiplicatively as expected (instead of additively)
* Leftovers now triggers only once per turn (broken in previous build)
* Fixed Power Herb's description

Version 0.94, build 0206 (12 July 2017):
* Trainer in Route 69 now faces the player, not the woods
* Rhyperior now learns Dragon Dance via happiness tutor; Head Smash can now be
  taught via move relearner
* Metronome should no longer crash the game when going first
* Metronome can now select a move the user already has
* Trace should now work properly and not crash the game
* Slight improvements in randomness handling for critical hits

Version 0.94, build 0205 (11 July 2017):
* Route 86 gate's door now takes you to the proper location
* Magnemite can now learn Iron Head via TM
* Blissey can now learn Blizzard, Razor Leaf, Tri Attack, Void Sphere and Zap
  Cannon via TM
* Fixed abilities that trigger when the Pokemon is sent out (broken in
  previous build)
* Moves that increase two stats by one stage each now play their animation only
  once (broken in previous build)
* Battle Tower tycoons now change based on the day of the week

Version 0.94, build 0204 (10 July 2017):
* NPC trainers no longer switch Pokemon unnecessarily often
* Milos Catacombs' side-scrolling area is now marked as a cave, not a route
* Fixed window placement in Battle Tower building
* Celebrity house in Torenia City is now accessible
* Oxalis City's Pokemart now sells Awakenings
* Raiwato battle now doesn't stop the background music upon ending
* Enemy Pokemon are now affected by entry hazards (Spikes, Lava Pool) when
  entering the field due to an AI-triggered switch
* Fixed a glitch with invalid HP values after capturing a Pokemon with a Shiny
  Ball (caused by DV changes)
* NPC trainers no longer attempt to use items they don't have
* Lava Pool cannot override other major status conditions anymore
* Accuracy and evasion now behave cumulatively (as in generation 3+ games)
* Intimidate now triggers Competitive
* Fixed bug where Solarbeam would deal 250 times the damage it should during
  rainy weather
* Hail and Sandstorm now also properly halve Solarbeam's damage
* Exp Share should no longer award double experience points
* Weezing can now learn Steel Eater via TM
* Natu cannot learn AncientPower via TM any longer
* Magnemite line can now learn Sunny Day and Explosion via TM, and Magneton can
  also learn Tri Attack and Iron Head (matching Magnezone)
* Totodile line can now learn Rain Dance via TM
* Baton Pass should no longer cause graphical glitches
* Crobat in Battle Tower now has its original moveset (including Aeroblast)
* Updated some Battle Tower and Battle Arcade sets to hold an Eviolite
* Battle Tower now restores consumed held items after exiting
* Retiring in the Battle Tower no longer resets the win streak
* Added an extra Gold Token in Phacelia City
* Play times of 1000 hours or more now show up correctly in the Continue screen
* Minor text, dialogue and scripting fixes
* Minor map updates
* Savefile patching now checks that the player is in a Pokemon Center

Version 0.94, build 0203 (26 June 2017):
* Fixed Varaneous's roaming location for players for whom it was stuck
* Battle Tower should now keep proper track of win streaks
* In-game trainers now switch more often (and more optimally) in battle
* Conversion2 no longer crashes when used after a move that would leave it
  without any valid types to choose from
* Hi Jump Kick now gets boosted by Reckless
* Fixed bug that would undo Aftermath's damage
* Synchronize now prints the correct message when inflicting a burn due to
  copying Flame Body
* Abilities no longer print a message when attempting to heal their user
  between turns while at maximum HP
* Magmortar can now learn Vaporize and Barrier via move reminder
* HP bars are no longer slanted (put on hold until they are no longer buggy)
* Last text line before battle of some gym leaders (Whitney, Bugsy, Sabrina)
  and the Saffron Dojo leader is now readable (waits for an A/B press)
* Prevented hacked-in invalid items from crashing the game when loaded
* Minor text and scripting fixes

Version 0.94, build 0202 (10 June 2017):
* Dusclops no longer tries to evolve into itself, and learns moves at the
  expected levels
* Swimmer in Route 78 cannot spot the player from land any longer
* Dusknoir sets added to Battle Tower and Battle Arcade
* Repel's description fixed (PokeMON -> Pokemon)
* Patch now detects zipped ROMs and empty savefiles

Version 0.94, build 0201 (7 June 2017):
* Pokemon shininess is now determined correctly (fixes bug introduced in 0200)
* Re-added the missing NPC in Haunted Mansion blocking the basement entrance
* Updated dex order to place Dusknoir after Dusclops
* Scyther can no longer learn Fire Punch via TM

Version 0.94, build 0200 (5 June 2017):
* Added Dusknoir to the game, replacing the unobtainable Carnivine
* Added Reaper Cloth as an obtainable item (item ball in Haunted Mansion)
* Fixed Light Ball event (Laurel Forest Pokemon-only area) so that it only
  gives one Light Ball and only when the player's Pokemon isn't holding an item
  (does not apply retroactively)
* Fixed stacks of 0 items in the Prison
* Updated Sylveon's entry to prevent text overflow on screen

Version 0.93, build 0198 (2 June 2017):
* Fixed crash when using Will-o-Wisp
* Removed guard in Saxifrage Prison that would completely block progress
* Fixed remaining glitch with HP bars when taking recoil damage
* Text fixes

Version 0.93, build 0197 (1 June 2017):
* The egg appraiser in Hayward City no longer gives infinite eggs
* Fixed sequence break that would let the player reach Phlox Town without going
  through the Naljo Ruins and Saxifrage
* Ensured that both items in the Goldenrod Mart basement are always obtainable
* Fixed potential glitch that would prevent some trainers from initiating
  battle with the player from a distance
* Item ball in Provincial Park can now also be picked up during the minigame
* Fixed visual glitch that would keep the text box open while healing in the
  Naljo Ruins oasis
* Fixed glitch that would cause a hole in the Naljo Ruins to remain hidden even
  after falling through it
* NPC text and Pokedex entries are now in metric units by default (imperial
  units can still be selected as an option)
* Fixed visual glitch with HP bars when a battle participant receives recoil
  damage
* Adjusted the heights and weights for Varaneous, Raiwato, Libabeel, Fambaco
  and Phancero to valid (metric) values
* Updated item description for Prz Guard
* Fixed a bug when calculating win streaks in the Battle Tower
* Blackjack now shows the correct winner
* Steel-type Pokemon can no longer be poisoned
* Kyogre now learns Ice Beam and Storm Front via TM
* Metang and Metagross now learn DynamicPunch via TM
* Various text fixes and updates

Version 0.93, build 0196 (26 May 2017):
* Eevee no longer causes a crash when it attempts to evolve
* New in-battle HUDs, and updated stats screen to match
* New GBC-only screen
* Shiny Pokemon now appear shiny when using a field move
* White Apricorns are now obtainable
* Trainers in Acania Gym now properly close their textboxes before making the
  gas disappear
* Gym leader in Owsauri now waits for the player to press A before starting the
  battle
* Coronet Stone as a reward in Battle Arcade replaced with Eviolite
* Battle Arcade reward prices updated
* Updated DV distributions for Battle Tower trainers
* Experimental Battle Tower tycoon crash fix
* Phancero can now learn Aerial Ace
* Some text changes and map fixes

Version 0.93, build 0194 (21 May 2017):
* Fixed crash when attempting to cancel out of some location-based evolutions
* NPCs now disappear when they should after defeating the Phlox Lab CEO
* Critical HP sound updated to gen 3+ version
* Eviolite implemented (not obtainable yet)
* Guts and Marvel Scale now work properly
* Sandstorm weather now raises the Special Defense of Rock-type Pokemon
* Minor fixes to weather conditions
* Charizard and Yanmega can now learn Aerial Ace
* Character customization adds arrows to indicate that more than four colors
  are available
* Text fixes

Version 0.93, build 0192 (18 May 2017):
* Fix crash in Naljo Ruins 2F/3F/4F
* Some text updates and changes

Version 0.93, build 0191 (16 May 2017):
* Fixed game-breaking issue where Prof. Ilk would not allow you to continue
* Steelix can now learn Rock Slide via TM

Version 0.93, build 0190 (14 May 2017):
* Boulders no longer crash and can be moved normally
* Fixed crash related to in-game NPC trades
* Blacking out to Phancero now behaves normally
* Some minor text fixes

Version 0.93, build 0189 (14 May 2017):
* Fixed bug when starting a new game that would completely block progress
* Some minor text fixes

Version 0.93, build 0188 (14 May 2017):
* Fixed some potential crashes in Goldenrod Pokecenter
* Koji now always faces the player when talking
* Pain Split doesn't work against foes in a semi-invulnerable state, such as
  flying or underground
* Early Bird prints a message when it takes effect
* Some text fixes

Version 0.93, build 0185 (11 May 2017):
* Fixed crashes in Castro Valley and Acania Docks
* Minor text fixes

Version 0.93, build 0184 (10 May 2017):
* Fixed crash introduced in the previous builds in the Route 67 PokeCenter
* Laurel Forest companion Pokemon flags are now properly cleared with sanity
  checks to prevent issues with bugged savefiles
* Moves that deal 1/3 of the damage dealt as recoil now deal at least 1 HP of
  recoil damage
* Pokedex entry for Misdreavus rewritten
* Fixed a sign in Route 85
* Dialogue/text fixes

Version 0.93, build 0183 (8 May 2017):
* Fixed crash introduced in the previous build in Phlox/Acqua Mines connection
* Added single-file patcher page (patcher_unified.htm) to package

Version 0.93, build 0182 (8 May 2017):
* Fixed crashes introduced in Hayward and Heath in the previous build
* Castro Valley's gym leader now faces you when talking
* Raised Thief's power to 60
* Corrected Glaceon's base Speed (now: 65)
* Expanded TM learnsets (Mewtwo can learn Thunderbolt, Breloom can learn
  ThunderPunch, Riolu and Lucario can learn Iron Tail)
* Pachisi in Botan now gives you 30 rolls
* Minor text and related fixes

Version 0.93, build 0181 (7 May 2017):
* Fixed Castro Gym crash
* Fixed bug that could cause untaken eggs to be overwritten
* Eggs no longer know Waterfall when hatched
* Yanma line can learn Surf via HM now
* Music is no longer bugged after hatching eggs in Laurel City
* Makuhita line now has the correct gender ratios
* Receiving a TM always shows the correct message and sound now
* Putting a statused Pokemon to sleep displays the correct failure message
* A few abilities (like Steadfast) now show the proper messages in battle

Version 0.93, build 0180 (28 April 2017):
* Battle Tower BP shop no longer crashes
* Salamence now learns Aerial Ace via TM
* Drifloon and Drifblim now learn the TMs for Psychic, Thunderbolt, Thunder and
  Shadow Ball
* Text fixes and minor optimizations in maps

Version 0.93, build 0179 (21 April 2017):
* Orphanage now works as intended
* Fixed box corruption for non-RTC flash carts
* Properly updated options in savefiles
* Text fixes

Version 0.93, build 0177 (18 April 2017):
* Fixed crash when using the Magnet Train
* Improved options menu
* Hold to mash is now optional and configurable
* Fixed Sitrus Berry's description
* Minor text fixes
* Removed an unnecessary reference to TPP

Version 0.93, build 0176 (14 April 2017):
* All Pokemon can learn Curse now via TM
* Pokerus working properly
* Fixed Bingo goal regarding money in bank
* A message appears when Pickup picks up some item
* Minor fixes related to Cute Charm
* Minor text/map fixes

Version 0.93, build 0175 (4 April 2017):
* April Fools keypad inversion undone
* Gold Token exchanges overhauled
* Minor text/map fixes

Version 0.93, build 0173 (1 April 2017):
* APRIL FOOLS: inverted keypad inputs (formerly stated as "Improved input
  system and button processing")
* Silk Tunnel warps fixed; stairs no longer lead to an unescapable black area
* Some text and minor map fixes

Version 0.93, build 0172 (31 March 2017):
* Fixed bug with mons in the Erratic experience group that would fall back to a
  low level when leveling up past 67
* Egg-hatching animations now appear as they should
* Lucario can now learn Counter via TM
* Crobat in stamina challenge now has Brave Bird instead of Aeroblast
* Some minor visual glitches with lava are now fixed
* Fixed some minor bugs with Levitate and Mold Breaker
* Attract now works in every case where it should
* Substitute doesn't affect contact abilities or Synchronize
* Map and text fixes
* Can't dig out of the E4
* Haunted Mansion stairs now take to the right place
* Soundproof's text no longer overflows the textbox

Version 0.93, build 0170 (21 March 2017):
* Fixed bug with savefile patch causing patched experience values to be
  incorrect

Version 0.93, build 0169 (21 March 2017):
* Vitamins no longer crash the game
* Attempting to print a box no longer crashes the game
* Player can now lose against the rival in the first batlte
* Tunod is walled off until the player has an appropriate number of badges
* Digging out of the ruins' roof now works properly
* Sprite fix in the Haunted Mansion dream sequence
* Added a guard to Route 34 gate
* Player cannot enter the Magikarp event with a full pack, thus preventing a
  potential softlock
* Varaneous roaming should now work properly
* Fixed issue when surfing through map borders
* Minor map and text fixes
* Gym leaders will now wait for the player to read all their text before
  beginning the battle
* Title screen menu music no longer glitchy
* Pachisi now plays music properly
* Slot machines now work correctly and don't enter long rock-dropping loops
* Crystal Bolt now hits through Lightningrod
* Levitate and Soundproof now print a message when they prevent damage
* Mold Breaker doesn't behave oddly with contact moves anymore
* Pickup now works as expected
* Fixed base stats for Banette, Dusclops, Koffing, Metang, Milotic and Numel
* Fixed experience groups for Aron, Drifloon, Feebas and Swablu (and their
  evolutions); also added save patching to correct exp points for already owned
  mons in those families
* Rare Candies can now revive fainted mons
* Fixed text issue with Silver ("Leader Silver", not "Silver Leader")
* Box naming screen now shows the proper icon

Version 0.93, build 0167 (18 March 2017):
* Fix crash introduced in previous build when a level 100 Pokemon earns any
  experience points
* Adjusted Rayquaza's base Speed to match its true value

Version 0.93, build 0166 (18 March 2017):
* Fixed base stats for Aggron, Bagon, Glaceon, Gliscor and Lairon
* Solved bug when reaching mining level 100
* Some minor map changes/fixes
* Some learnsets fixed
* RTC bug preventing apricorn pick-up actually fixed now
* Fury Cutter can only double damage twice (before update: 4 times)
* Compound Eyes working as intended
* Can't mine windows any longer
* Moved some NPCs blocking the path to Pokemon Center nurses
* Various battle engine minor fixes
* 100% effect chances are now truly 100%, not 99.6%
* Pain Split no longer causes a visual glitch when used
* Some AI improvements to prevent complete AI stupidity
* Pokemon now receive stat experience even if they are at level 100
* Stats are recalculated after every battle (so stat experience is applied
  immediately)

Version 0.93, build 0164 (7 March 2017):
* Added wild Pokemon to Merson Cave, Tunod Waterway, Route 87 and other areas
* Added Swagger TM, replacing Fire Blast TM item (and added a savefile patch
  to restore the item ball if it was already picked up)
* Some changes to the RNG used for some events
* Attempt to fix the calendar/date system bugs that cause apricorns not to
  appear after a new month rolls over
* Torenia Pachisi board tiles now do what they say they do
* Routes 47 and 48 now should behave properly with regards to the bike
* Fixed a small potential bug with Spite
* Changed movement pattern of an NPC in the Pokemon Center in Goldenrod
* Minor changes to one of the possible player overworld sprites
* SELECT can be used to sort items in the PC

Version 0.93, build 0161 (1 March 2017):
* Fixed savefile patcher (causing issues with invalid savefiles and the option
  to reset the Caterpie event flags)
* Added an option to restore the Iron Head TM item ball if it had already been
  picked up
* Lowered Milos encounter rates
* Undefeated Gym leaders are now blacked out in the trainer card

Version 0.93, build 0160 (28 February 2017):
* Fix game-breaking bug in Phlox Lab
* Holding START to skip text works better

Version 0.93, build 0159 (27 February 2017):
* Fixed the crash on Route 86
* Added Iron Head TM
* Some text fixes
* Added encounters to route 51
* Minor scripting fixes
* Fixed the Hall of Fame
* Bike music fades properly
* TM learnset fixes (Slugma, Eevee and Larvitar lines learn Curse; Onix learns
  Rollout)
* Holding START inside text boxes causes the text to advance rapidly

Version 0.93, build 0158 (26 February 2017):
* Fixed Blissey's overworld sprite
* Pokedex number now shows up correctly in the Hall of Fame
* Oak's Pokedex rating removed (will be replaced later)
* Various map fixes and improvements, including text fixes
* Savefile patching gives a one-time chance to fix the Caterpie event flags
* Castro Gym doesn't prevent battling other trainers again anymore (note that
  this bug is unfixable for players who have already reached that gym in their
  current savefiles)
* Altaria now has correct types
* Ho-Oh's name is now spelled properly
* Stats screen page 4 now works as intended

Version 0.93, build 0156 (20 February 2017):
* Fixed genders (broken in last build)
* Fixed incorrect item in Gold Token shop in Spurge Mart
* Minor map and bug fixes

Version 0.93, build 0155 (18 February 2017):
* Magikarp Caverns warp works properly now; the quest can be finished for real
* Replaced the logo in the opening with the proper colorful version
* Some audio fixes/improvements
* Minor text fixes in a few places

Version 0.93, build 0154 (18 February 2017):
* Magikarp Caverns quest can be completed again
* Raichu can learn Dig
* Ball making now gives experience properly
* Various fixes with prison doors
* Mareep's colors were slightly updated

Version 0.93, build 0153 (17 February 2017):
* Fixed bug in Laurel Lab when having no fossils in hand
* Fixed bug when reviving a fossil without any room in party or box
* Exiting the Haunted Mansion is now possible again
* Added missing Spurge City signpost
* Magikarp Caverns quest no longer crashes the game
* Poison works as it should in the overworld

Version 0.93, build 0152 (16 February 2017):
* Hotfix adding a slower timer speed so the 3DS VC can run the game properly

Version 0.93, build 0151 (16 February 2017):
* Major bug fix release, most known bugs fixed
* Battle Tower supposedly working
* Added shiny apricorns at random in the overworld
* Changed credits to a less serious and more adequate version
* Shiny Balls preserve the caught Pokemon's ability
* Several sprite/picture updates
* Debug features to reset the clock at start (to replace the noRTC patch)
* RTC working properly
* Moveset reviews and changes
* Broken logos at the start replaced by our own logo
* Rewrote Laurel Forest Pokemon-only area

Version 0.92, build 0145 (date unknown):
* Multiple patches; features unknown

Version 0.91, build 0144 (22 December 2016):
* Initial leaked version

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

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBCgAGBQJfEpysAAoJEPPlPMKyJOnlqpEH/iuNo2UWgrMoSNsYIWMapkrU
FHi1JwAauZ5cm/Zljf11t71wtW46FZ0Yb/D80femW4UijXUZQDhdL9PgsLfnTIvK
rp8bkkJ2mSOy2Hk+czP5SO2JXI1zWYK74gAbFzKCjqYyDpPkW6eF9oX2oZIA3QP1
skZaMb/T7db7ZpkkH9iYLzNSswV1Zja0DLW+R1YgogEV4gf5+c0nS2hkWOn3CPK9
vDqyiw9ipomnkiwjz3niV0Y2/evcLWfrXFiRHH9KyFwQX/olNIMT35hkQ7LXMZvJ
37WQINZzsbZ72sjSBW0B8NeInwa4QeKsIt+cqicGv2qawQr+LDKc1q9EiJBwI/I=
=eO4t
-----END PGP SIGNATURE-----
