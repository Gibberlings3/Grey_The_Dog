-------   Grey the Dog NPC for BGT, BG:EE(SoD), BGII:EE, and EET   --------
                            by jastey and Rabain

Original idea for a dog companion, first kit draft with special abilities, first portrait: Rabain
Everything else: jastey


GENERAL

Please note: So far, the mod officially contains BG1 content only. Grey should already be fully functional in SoD (but only in English), but BGII content is not done yet. 

Grey is a full-fledged joinable NPC, but still a real dog. The only magic on him is his magically enchanted items.
He has sensible interjections (Woof!), NPC banters (mostly NPC dialogues about him with the PC), a click dialogue (PID) if the PC feels like playing fetch or just needs someone to talk to. There are dialogue options that reflect the game story and I'll promise: Grey will always listen to your PC's woes. Grey initiates no dialogues so there is no friendship track and - I am really sorry, but no romance. Not even for Shapeshifters.
In BG1 there are two small quests, both available in BG city. The quests are also available and solvable without Grey in party.
Where appropriate, Grey can be told to "search" for missing persons, in BG1 Brage and farmer Brun's son, in SoD the five missing refugees. This is realized so it doesn't spoil the quests too much, though, so do not expect too much help.


ABOUT THIS MOD'S HISTORY

Some ideas take time. For Grey this was from 2005 when Rabain first brainstormed about a dog companion - something mundane and non-magical, a silent and loyal friend (and additional inventory) for a PC that would otherwise go solo-ing. It was the time of the violet-eyed half-demon half-god planar elven mod NPCs that seemed to form themselves everywhere all over the modding communities (most of them just ideas even back then). Firstly meant as a mere BGII companion, I was instantly thrilled by the idea. Rabain made a first portrait which is the current one with a red bandana and worked on a first kit that would allow a dog NPC to level up and not use the common items while I played some fetch with Grey and Minsc. Then we hit a wall with the old engine, partly because we were both not too experienced in what is possible. Then ToBEx happened, although Grey also works without it, and the EE happened, although Grey also works fine on BGT, and BeamDog's Wilson showed me the solution to the most glaring problem (I won't tell because it's not a real problem if you know how to solve it - ok, I mean the Drow transformation in Underdark), then the mod dwelled on my HD, I wanted Grey to be a companion for the whole trilogy, had some ideas and started writing occasionally, and here we are.


GAMEPLAY

Grey cannot be send to wait somewhere. If he is in party, he is in party. He can be sent back to Jondalar but that will be final. If you need the party slot for someone else, Grey can be kicked out of the party and told to "stay close", then he will follow as a "familiar" or, as I call it "7th party member". If in 7th party member mode he needs to join the group from time to time to level up. See below for more info on 7th party member mode. (No, seriously - please read up on playing in 7th party member mode to get the most out of it. The engine was not created for additional party members that carry important items.)
To rejoin the group, talk to him and tell him you need "access to (his) inventory", and he will rejoin as a full party member. If you time this accordingly, the moment he is in group before any other kicked out NPC reaches the PC for his post-kickout dialogue is sufficient to let Grey level up and rearrange his items, without having to finally kick out any other party NPC to achieve this. (Unless those just leave without a follow-up dialogue, of course.)

Grey's claws will update to more powerful versions when he levels up (not every level). To improve his teeth force, items need to be used that can be found and bought throughout the game. Without a tooth enforcer, the engine will treat his attacks with the first hand like fist attacks ("bar handed".)


7th PARTY MEMBER MODE

Grey can be selected and given commands, as well as told to use quick slot items.
He needs to join from time to time so he can level up.
He cannot die while following as a 7th party member, but will remain at 1 HP. If Grey's HP fall to 1 HP during a fight, he will pass out. Healing him then will not change this. His alignment will change to "neutral" so enemies stop attacking him. Once the fight is over, he will regain consciousness, be healed fully, and rejoin the party as an ally/familiar. The full healing might be seen as a cheat, but it's one way to fix the engine behavior (not to call it bug) with Grey dying upon rejoining if his HP are too low.

The 1 HP drop out can be prevented if Grey is healed in time during a fight. If told to he will give a warning before his HP drop too low, but this seems to be buggy in BGT.


QUIRKS OF THE 7TH PARTY MEMBER MODE INGAME

Unfortunately, the "7th party member mode" in the game requires special handling to accommodate all restrictions: (The hints are a mix of the existing engine restrictions and the workarounds I used).
-The NPC has no "Clear Fog of War" around him in the 7th GM. So he can "disappear" in the "black" area of the map. (If you click on the whole group and let them gather at one place, the NPC will also try to do so, if they are not stuck somewhere. In that case only the teleportation cheat "Ctrl+j" helps to gather the group again. This has not happened to me yet, but it is theoretically possible if the NPC is chasing an enemy, for example).
-Items in the NPC's inventory are *not* recognized as items owned by the group. This is an engine problem. It follows that quest items that are needed in the game should not be in the NPC's inventory if they are to be recognized by the quest giver. Examples: Elvenhair's book, Ankheg shell for Taerom, etc.
-Quest items tagged as "critical" will be moved to the PC's inventory when moving to the 7th PMM. This may cause items from the PC's inventory to end up on the floor. This is an engine problem. As a result, you should always check after switching the NPC to the 7th PMM to see if items have landed on the floor!
-When new items are given to one of my NPCs in 7th PMM in a quest specifically for this NPC, they always appear in the inventory of the group or PC, even if the NPC is supposed to receive them. This is an engine problem. Even if I scripted it so that the items would end up in the NPC's inventory after the encounter, they would still be handled via the PC's inventory. And thus, items from the inventory may have ended up on the floor.
-For my NPCs, I have tried to have their own quest items (even if they are original in-game items, as long as they are necessary for my NPC's quest) recognized in the NPC's inventory as well. This works with the following restrictions:
-- All items in question are handled through the PC's inventory before they are either given to or received from a quest giver. This means that other items may have ended up on the floor.
-- If the item was in a bottomless bag (this includes all kind of bags, gem bags, bags for bottles etcpp.), then the item will not be removed in a dialogue with the quest giver. It is still in the bottomless bag afterwards and can cause problems if the scripting of the quest does not consider this (and assumes that the item should be gone).
-- 2. Problem with items in bottomless bags: If the item was in a bottomless bag, then the game crashes for unknown reasons if the NPC is to be taken afterwards into the group as a full member. This "crash bug" can be worked around by saving the game and reloading it.


WHERE TO MEET In GAME

For a first interlude, Grey can be met inside Candlekeep at the side of Jondalar. Jondalar will have an extra line referring to the PC's friendship with Grey. If Jondalar is not present (because a "tutors begone" mod is installed) Grey will just sit at is place.
Grey will join the group after Imoen once the ambush scene is over and the PC finds themself at the Lion's Way area. 
Note: It is assumed that Imoen is in the group, at least for this short moment. Since she joins automatically and Grey follows directly after, this should normally be the case.


COMPATIBILITY

-Remove Tutors in Candlekeep tweak (SCS?): compatible. Although the first scene in Candlekeep is a nice touch to get a feeling about how the PC and Grey are connected (or rather, how Grey connected to them), this scene does not have to play for Grey to turn up later. If Jondalar is not present (i.e. removed by a tweak mod), Grey will just be in Candlekeep during the prologue saying "woof" if talked to.

Jarl's Adventure Pack: Grey needs to be installed after JAP.


INSTALL ORDER 

Install this mod as late as possible after all other mods that add interjections, i.e. NPC mods or mods that add content to NPCs. Nothing game-breaking will happen if the mod is installed sooner, it might just be weird in case Grey's reaction do not show in game where he should have sniffed out a monster because other NPCs interject (and might change the course of the dialogue) before him.

As an NPC mod, this mod should be installed after quest mods and before tweak mods.

There is crossmod content included in the mod which should show if the install order suggestions are being followed.


WALKTHROUGH / SPOILERS

Shortly after Grey joined, Jondalar and Erik will make an appearance to look where Grey went.

Grey needs own items. He will come with basic war dog equipment, better equipment can be found and bought throughout the game: there are items, armor, and weapons to be found for Grey explicitely. The file items.txt lists those and also where they can be found. There are two War Dog Armorers available, each on the two carnivals in the game (Nashkell and BG city, with mapnotes).

Grey will learn to sniff out lesser doppelgangers. This is more for the reason that I think he should be able to, not because I think it's overly useful in the game where some encounters with doppelgangers are supposed to be a surprise. Therefore, I decided that he can't sniff out greater doppelgangers so the most crucial deceptions in the game will not be spoiled.


KNOWN ISSUES

Without ToBEx, Grey will be able to use some maces and boots in BGT. Install ToBEx to restrict these items for Grey.

Especially for BGT but also for the EE games, Grey will be able to use (or at least equip) some items/weapons. Just ignore those (or use them if it doesn't disturb you).

In some game cutscenes, Grey might be visible at places where he shouldn't be as 7th party member. I'm not sure how to solve this.

Paper doll: currently, the wolf paper doll is added to the MDOG animation (renamed to MDOGINV.BAM). In case this leads to any compatibility problems, let me know. Nevertheless, in BGT no paperdoll is being shown. I couldn't solve this.

Grey has no clear fog of war effect, so when following as 7th party member, he might "vanish" behind the line of sight. Rearranging the whole group's position should bring him back at the PC's side. (The reason is that the engines cannot handle more than 8 creatures with CFoW - and that includes the 6 party members and cutscene spies.) 


INSTALLATION

Windows: Unzip the folder "c#greythedog" and the "setup-c#greythedog.exe" into your game folder (BG:EE/SOD/BG2/BGT/BGII:EE/EET) directory. Double click the "setup-c#greythedog.exe" and follow the instructions onscreen. Make sure the game is not running while installing the mod. Do not run more than one mod setup at a time. Close the command window after installation by pressing "Enter" (not clicking on the red cross.)

For BGT, install ToBEx to restrict Grey from using some maces and boots.

If you use BG Enhanced Edition from GOG or Steam, you need to prepare your game before installing any mods with DLC merger (or modmerge), link below.

NOTE: BG(II):EE are actively supported games. Please note that every patch update will wipe your current mod setup! If in the middle of a modded game you might want to delay the patch update as even after reinstalling the mods, you might not be able to continue with your old savegames. 


If you have installation problems or encounter any bugs, please post your bug report in one of the forum


CREDITS

Acifer: Portrait edit with dark bandana (original by Rabain was red), alpha testing
Brokenkatana: Proof reading (English)
scheele: Russian translation


TOOLS USED

IESDP					https://gibberlings3.github.io/iesdp/index.htm
Near Infinity				https://forums.beamdog.com/discussion/30593/new-versions-of-nearinfinity-available/p1
WeiDU					https://github.com/WeiDUorg/weidu/releases/latest
 					(formerly: http://www.weidu.org)
BAM Workshop				http://wwww.teambg.eu/?page=tools&cat=32

grepWin					http://tools.stefankueng.com/grepWin.html
WinMerge				http://winmerge.org/
hex to decimal converter		http://www.binaryhexconverter.com/hex-to-decimal-converter

Modding communities, tutorials and technical assistance:

The Gibberlings Three			https://www.gibberlings3.net/
Pocket Plane Group			http://pocketplane.net
Spellhold Studios			http://www.shsforums.net/
Kerzenburgforum (German)		https://www.baldurs-gate.de/index.php
The Black Wyrm's Lair			http://blackwyrmlair.net

Further Links:
DLC Merger 				https://forums.beamdog.com/discussion/71305/mod-dlc-merger-merge-steam-gog-sod-dlc-or-custom-dlcs-with-the-main-game

(deprecated but still functional tool for mod merging: 
https://forums.beamdog.com/discussion/50441/modmerge-merge-your-steam-gog-zip-based-dlc-into-something-weidu-nearinfinity-dltcep-can-use/p1)



LEGAL INFORMATION

=================================================================================
Grey the Dog NPC Mod is unofficial Fan Content permitted under the Fan Content Policy. Not approved/endorsed by Wizards. Portions of the materials used are property of Wizards of the Coast. ©Wizards of the Coast LLC.
This mod is also not developed, supported, or endorsed by BioWare, Black Isle Studios, Interplay Entertainment Corp., Overhaul Games or Beamdog. All other trademarks and copyrights are property of their respective owners.
=================================================================================


HISTORY

Version 7.1:
-Russian version now has correct text format.

Version 7:
-Russian version added, by scheele.
-Changed Grey's level-up system: He will only level up to the PC's level if: he joins the first time for BG1/SoD/BGII OR he joins after being a 7th party member. No more automatic level-up although he is in party.
-Optimized item handling at the beginning of BGII (Grey should not have paw in inventory).
-Corrected bug in tax collector's dialogue (PC should hand over tax note always).
-Unified Power Levels for effects in c#greyba.spl ("Bark").
-Added paragraph "Quirks of the 7th party member mode ingame" to readme.
-Added globally unique LABELs to uspport Project Infinity.

Version 6:
-traified and translated all lines for PID
-fixed text format error for EE (non-English versions)
-"7th party members" for some item checks considered 
-corrected entry for "Beregost_House08_L2" in cpmvars.tpas
-resttalk crossmod with Brandock should also fire if Brandock is "7th party member"
-more SoD "interjections" (woof!)
-journal entry about Brage's gauntlets should be removed when Brage's quest is finished
-improved transition to BGII
-added check to forbit install of mod after EET_End
-changed internal structure so temporary "autotra" foldr is used for text formatting
-typo corrections

Version 5.1:
-added needed definition for variable "newline" so SoD end cutscene gets patched correctly: Grey should move with the group in SoD end cutscene.
-changed name in the .ini for better Package names when using ALIEN's Infinity Auto Packager.

Version 5:
-German version by Gerri, revised by jastey
-English version partly proofread by Caedwyr
-one crossmod banter added with Brage's Redemption.
-Taerom will not talk about forging a weapon for Grey if the PC meets him for the very first time
-Taerom's comment about the material for the canine enforcement makes it clear it's not to be found anywhere near.
-HLA icons fixed 
-Grey will receive HLAs
-SoD: Added more randomness to how Grey is chosen in Thrix's game.
-7th party member mode: will be removed correctly in case Grey rejoins via PID and kicked out completely directly after.
-Compatibility with Transitions Mod added.

Version 4:
-Angel's item file structure fixes: Verified all the item files with DLTCEP and fixed the ones with inconsistencies, also made sure all magical weapons had an enchantment value set.
-Compatibility with Tweaks Anthology "Allow Taerom to Make Additional Ankheg Armors": Option to forge Grey's Ankheg armor should be available if tweak is installed, too.
-more typo corrections
-7th party member mode: detecion of "party rested via scripted Rest()" should work now
-(EE) journal entries belonging to "The Tale of Captain Brage" should be correctly added to journal.
-7th party member mode: effects of C#5MINHP.spl should not be applied to party.
-all journal entries should be erased from journal as intended
-Scripts when changing into 7th party member mode and back should not be interrupted.

Version 3:
-Angel's fix for c#grtoo4.itm, Lauriel's fix for c#grtoo6.itm -> items should no longer gives install errors for Tweaks Anthology etc.
-changed enchanted level from c#grtoo4.itm to "1"
-proofreadings by Brokenkatana integrated

Version 2:
-fixed install of other mods caused by this mod's item because of "read out of bounds" (offset ca (dice size/minimum level) at opcode #12 to "0", was at "-1" for some of Grey's tooth enforcer) 
-changed item category from "potion" to "food" for Grey's chew toys
-unified Grey only items to exclude all normal NPC races, only (no classes are excluded. Verr'Sha should not be able to use War Dog's studded leather armor.)
-changed Grey to "Other" (sex/gender in cre file) so he will not be picked for SharTeel's fight if he is the strongest "male" in the group.
-added c#greythedog.ini with mod info
-added folder libiconv-1.9.2-1-src.7z with iconv licence info

Version 1:
-Items in ID should not spawn in infinite amounts.

Version Beta_8:
-Fist damage bonus also removed from kit.

Version Beta_7:
-Fixes dialog-Bug in EE (introduced in Beta_6)

Version Beta_6:
-BGII starting cutscene should start

Version Beta_5:
-Exit of Mod area (C#GR11) no longer crashes game
-Grey's toys should be equipable in BGT
-Grey's joining dialogue will not trigger before Imoen's
-if following in 7th party member mode, Grey will no longer become hostile if hit by friendly fire.
-Taerom's offer for Grey's Ankheg armor should also work if "Taerom always buys Ankheg shells" tweak is installed (BGT)
- Madeleines Key is now "key" (so it fits into the key ring)
-fist thaco bonus +1 removed from kit to fix THAC0 mismatch
-kit now grants THAC0 bonus +1 and damage bonus +1 for humans, wolves, bears (Lv 1,5,15,25,35)
-poison tooth enforcer should give poison damage
-Gate Keeper dialogue changed slightly
-changed readme name to unique one

Version Beta_4: 
-c#grto62.itm is not being installed (has a faulty header or something)
-option for Taerom's Ankheg wardog armor should now be available (BG:EE, EET)
-Severin hands over Brage's bracelets if Grey is 7th party member

Version Beta_3:
-really fixed install problem for BGT with JAP
-bg1 crossmod content traified

Version Beta_2:
-fixed install problem for BGT with JAP

Version Beta_1:
-first public release

