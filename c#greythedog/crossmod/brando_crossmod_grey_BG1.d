/* Brandock - Grey BG1 */



CHAIN
IF WEIGHT #-1 
~%BGT_VAR%
CombatCounter(0) !See([ENEMY]) 
OR(2) InParty("C#Brandock") Global("C#BrandockJoined","GLOBAL",2)
OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#Grey") See(Player1)
!StateCheck("C#Grey",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#Brandock_GreyBG1","GLOBAL",0)~ THEN C#BrandB brandockgrey1
~Grey, you remind me of our neighbors' dog. Well, actually, he was smaller, but he had the same hair like you. Or maybe a bit more brown-ish, and it was a bit shorter, too. That dog also barked a lot more than you, now that I think of it... I have no idea why I started this conversation.~
DO ~SetGlobal("C#Brandock_GreyBG1","GLOBAL",1)~
EXIT


CHAIN
IF WEIGHT #-1 
~%BGT_VAR%
CombatCounter(0) !See([ENEMY]) 
OR(2) InParty("C#Brandock") Global("C#BrandockJoined","GLOBAL",2)
OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#Grey") See(Player1)
!StateCheck("C#Grey",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#Brandock_GreyBG1","GLOBAL",1)~ THEN C#BrandB brandockgrey2
~I know now why Grey reminds me of our neighbors' dog. It's that look, that awful "I-am-much-more-intelligant-than-you-think" look. Or maybe it's the "I-just-*look*-as-if-I'm-much-more-intelligent-than-you-think" look?~
DO ~SetGlobal("C#Brandock_GreyBG1","GLOBAL",2)~
== C#GreyJ ~Woof! (Reacting to Brandock's attention, Grey wags his tail.)~
== C#BrandB ~Oh, it's even worth than I thought. It's the "I-pretend-I'm-dumber-than-I-actually-am" look, going together with the "So-you'll-give-me-a-treat" look dogs are born with, appearently.~
= ~Yes, that's *exactly* the look I was talking about, you hairy brute. "I'm-your-best-friend-and-I..." - ack!~
= ~He *licked* me in the face!~
== C#GreyJ ~Woof!~
== C#BrandB ~Oh yes, I know *that* look, as well! That's the "I-am-so-cute-and-innocent" look, "you-won't-be-able-to-resist..." Ah, blast it, come here, so I can pet you!~
EXIT

/* after book is found */
CHAIN
IF 
~%BGT_VAR%
CombatCounter(0) !See([ENEMY]) 
OR(2) InParty("C#Brandock") Global("C#BrandockJoined","GLOBAL",2)
OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#Grey") See(Player1)
!StateCheck(Player1,CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
GlobalGT("C#Brandock_Possessions","GLOBAL",3)
Global("C#Brandock_GreyBG1","GLOBAL",2)~ THEN C#BrandB brandockgrey3
~So, Grey, where were you, when I needed you, hm? With you on my side, the foxes wouldn't have gotten to that book. But no, you preferred to daudle away time with <CHARNAME>, inst... Gods, <CHARNAME>, I am sorry. I shouldn't have said this, and I didn't mean it. I got carried away, talking to Grey.~
DO ~SetGlobal("C#Brandock_GreyBG1","GLOBAL",3) RealSetGlobalTimer("C#BrandockNPCBanterTimer","GLOBAL",3000)~
END
++ ~No problem, I know you wouldn't call my experiences after leaving Candlekeep "daudling away time".~ + brandockgrey3_02
++ ~It's alright, Brandock, think nothing of it.~ + brandockgrey3_01
++ ~I do feel offended, actually. You seem to live in your own world, where your personal problemas are the most important.~ + brandockgrey3_03
++ ~Clumsy as always, why am I not surprised.~ + brandockgrey3_04

APPEND C#BrandB 
IF ~~ THEN brandockgrey3_01
SAY ~I am so sorry. I did offend you. Because, if people say "It's alright, think nothing of it", they usually did feel offended.~
IF ~~ THEN + brandockgrey3_05
END

IF ~~ THEN brandockgrey3_02
SAY ~I thank you.~
IF ~~ THEN + brandockgrey3_05
END

IF ~~ THEN brandockgrey3_03
SAY ~I am sorry I offended you. Although I have to point out, that *indeed* I am living in my own reality, as everyone else is, as well, and - will probably not elaborate on this any further, because I'm already knee-deep in horse poop as it is.~
IF ~~ THEN + brandockgrey3_05
END

IF ~~ THEN brandockgrey3_04
SAY ~Does that mean I did offend you or I didn't?~
IF ~~ THEN + brandockgrey3_05
END

IF ~~ THEN brandockgrey3_05
SAY ~I will watch my words more careful in the future, even if babbling nosense to a creature who mainly reacts to the tone of my voice.~
IF ~~ THEN EXIT
END
END //APPEND

/* rest banter, triggered by c#brandD.bcs */
 
CHAIN
IF ~Global("C#Brandock_GreyBG1","GLOBAL",4)~ THEN C#BrandJ brandockgrey4
~GODS - the nine h... blast... ACK!~ DO ~SetGlobal("C#Brandock_GreyBG1","GLOBAL",5)~
= ~Grey, I really appreciate the attention, but you do *not* need to poke your nose right in front of mine if I am meditating on my spells!~
= ~Phhhhh... Now I need at least five minutes to calm down again. Did that dog startle me!~
== %IMOEN_BANTER% IF ~InParty("%IMOEN_DV%") See("%IMOEN_DV%") 
!StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN ~Haha! He did the same with me last night.~
== C#BrandB IF ~InParty("%IMOEN_DV%") See("%IMOEN_DV%") 
!StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN ~Really? I don't remember hearing you jump, though.~
== %IMOEN_BANTER% IF ~InParty("%IMOEN_DV%") See("%IMOEN_DV%") 
!StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN ~That's because *I* wasn't startled by him, because *I* observe my surroundings, ya know!~
== %SKIE_BANTER% IF ~InParty("skie") See("skie") 
!StateCheck("skie",CD_STATE_NOTVALID)~ THEN ~I am honestly surprised anyone could be startled by this dog. He stinks upwind even without being wet!~
== %IMOEN_BANTER% IF ~InParty("%IMOEN_DV%") See("%IMOEN_DV%") 
!StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
InParty("skie") See("skie") 
!StateCheck("skie",CD_STATE_NOTVALID)~ THEN ~Oh, don't listen to her, Grey! Aren't you the fluffiest cutiest doggie doo!~
== %AJANTIS_BANTER% IF ~InParty("ajantis") See("ajantis") 
!StateCheck("ajantis",CD_STATE_NOTVALID)~ THEN ~Grey is an exceptionally intelligant dog. He is very interested in what we are doing. He also watched carefully when I tended to my weapons recently.~
= ~A bit... too intensely, though, not to drool on them.~
== C#BrandB ~Wha... he drooled on my spellbook! GREY?!~
EXIT
