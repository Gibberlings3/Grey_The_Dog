APPEND c#greyJ

/* NOTE: BG2(EE) only reply options should be marked with ~%IT_IS_BG2%~ */

IF ~IsGabber(Player1)~ THEN BEGIN grey_clicktalk
SAY @84 /* (Grey turns his head to you.) Woof! */ /* @84 /* (Grey turns his head to you.) Woof! */ */

/* Find Brage - start in Nashkel Garrison */
+ ~AreaCheck("%Nashkel_Garrison%") 
OR(2)
PartyHasItem("c#grbrbr") 
HasItem("c#grbrbr","C#Grey")
GlobalLT("C#Grey_Brage","GLOBAL",4) Global("C#Grey_MetBrage","GLOBAL",0)~ + @0 /* Grey, find Brage! Find, Grey! */ /* @0 /* Grey, find Brage! Find, Grey! */ */ + find_brage

/* Rufie */
+ ~AreaCheck("%FireLeafForest%")
Global("Rufie","GLOBAL",1)
PartyHasItem("MISC63") //Rufie's chew toy
InMyArea("Rufie")
!Dead("Rufie")
InMyArea("Albert")
!Dead("Albert")
Global("C#Grey_SearchRufieBG1","GLOBAL",0)~ + @85 /* Grey, help me find this Rufie! Here is the chew toy to sniff on it. Find, Grey! */ /* @85 /* Grey, help me find this Rufie! Here is the chew toy to sniff on it. Find, Grey! */ */ + find_rufie

/* SoD quest: find ham! */
+ ~GlobalGT("C#Grey_SoDQuest","GLOBAL",3)
GlobalLT("C#Grey_SoDQuest","GLOBAL",19)
Global("C#Gr_SoDQuestScent","GLOBAL",1)
	CombatCounter(0)
	!See([ENEMY])~ + @192 /* Find the ham that was stolen from Belegarm's storage tent, Grey. Find, Grey! */ + sod_search_ham

/* Brage's SoD quest: find Tilda! */
+ ~AreaCheck("BD7300")
Global("C#Brage_SoDQuest","GLOBAL",3)
Global("C#Gr_SoDBrageQuestScent","GLOBAL",1)
	CombatCounter(0)
	!See([ENEMY])~ + @193 /* Find the girl Tilda, Grey. Find, Grey! */ + sod_search_tilda_bragequest

/* SoD search for Skie (bd4000) */
+ ~GlobalGT("bd_skie_plot","global",0) GlobalLT("bd_skie_plot","global",5)
AreaCheck("bd4000") !See("bdSkie") InMyArea("bdSkie")
Global("C#Gr_SoDSkieScent","GLOBAL",1)
	CombatCounter(0)
	!See([ENEMY])~ + @194 /* Find Skie, Grey. Find! */ + sod_search_skie


/* SoD, BD1000 find missing refugies */

+ ~AreaCheck("BD1000") Range("BDHEROD",15) Global("C#Grey_SoD_statues","GLOBAL",1) 
GlobalLT("BD_PET_MAIN","MYAREA",4)
Global("bd_125_bought_golem","global",0)
Global("BD_PET_SAVED","MYAREA",0)~ + @186 /* Grey, find the missing refugies! Find, Grey! */ /* @186 /* Grey, find the missing refugies! Find, Grey! */ */ + sod_statues

/* SoD, BD3000 Safana's traitor quest */
/* candle -> Mizhena */
+ ~Global("C#Grey_SearchMizhenSoD","MYAREA",0)
AreaCheck("BD3000") 
InMyArea("bdMizhen")
!Dead("bdMizhen")
Global("SDD303","GLOBAL",1)
Global("SDD303_CANDLE","GLOBAL",1)~ + @187 /* Grey, sniff the candle in Safana's bag and find the owner. Find, Grey! */ /* ~Grey, sniff the candle from Safana's bag and find the owner. Find, Grey!~ */ + sod_candle_safana
/* bottle -> Helvdar */
+ ~Global("C#Grey_SearchHelvdarSoD","MYAREA",0)
AreaCheck("BD3000") 
InMyArea("bdHelvda")
!Dead("bdHelvda")
Global("SDD303","GLOBAL",1)
OR(2)
	Global("SDD303_BOTTLE","GLOBAL",1)
	Global("SDD303_BOTTLE","GLOBAL",2)~ + @188 /* Grey, sniff the bottle in Safana's bag and find the owner. Find, Grey! */ /* ~Grey, sniff the bottle from Safana's bag and find the owner. Find, Grey!~ */ + sod_bottle_safana
/* piece of rune paper - no clear scent */
+ ~Global("C#Grey_SearchRuneSoD","MYAREA",0)
AreaCheck("BD3000") 
Global("SDD303","GLOBAL",1)
OR(2)
Global("SDD303_PAPER","GLOBAL",1)
Global("SDD303_PAPER","GLOBAL",2)~ + @189 /* Grey, sniff the paper with runes in Safana's bag and find the owner. Find, Grey! */ /* ~Grey, sniff the paper with runes from Safana's bag and find the owner. Find, Grey!~ */ + sod_runepaper_safana

+ ~AreaType(OUTDOOR)
OR(3)
AreaType(FOREST)
AreaType(CITY)
AreaType(OUTDOOR)~ + @1 /* (You take a stick from the ground.) Want to play? */ /* @1 /* (You take a stick from the ground.) Want to play? */ */ + stick_play
++ @2 /* Come here boy, I want to pet you! */ /* @2 /* Come here boy, I want to pet you! */ */ + ruffle

/* CHARNAME needs some loving, too! */

++ @3 /* I need to talk to someone, Grey... */ /* @3 /* I need to talk to someone, Grey... */ */ + talktohim

/* inventory management - if Grey is not in party but following as companion 
This is what usually is dealt with by the kicked out "P" dialogue for re-joining */

+ ~!InParty(Myself) Global("C#GreyJoined","GLOBAL",2) NumInPartyLT(6)~ + @4 /* Come here, I need access to your inventory. */ /* @4 /* Come here, I need access to your inventory. */ */ DO ~RemoveFamiliar() SetGlobal("C#GreyJoined","GLOBAL",1) JoinParty()~ EXIT

+ ~!InParty(Myself) Global("C#GreyJoined","GLOBAL",2) NumInParty(6)~ + @4 /* Come here, I need access to your inventory. */ /* @4 /* Come here, I need access to your inventory. */ */ DO ~RemoveFamiliar() 
ChangeAIScript("",DEFAULT)
ChangeEnemyAlly(Myself,NEUTRAL)
SetGlobal("C#GreyJoined","GLOBAL",1) JoinParty()~ EXIT


+ ~Global("C#%NPCname%Joined","GLOBAL",2)~ + @200020 /* ~I want to give you orders how to follow me.~ */ + script_chose


++ @7 /* Nothing, good boy. Let's get on! */ /* @7 /* Nothing, good boy. Let's get on! */ */ EXIT

END



//--------

IF ~~ THEN script_chose
SAY @9 /* (Grey tilts his head to one side, looking at you intensely.) */
+ ~Global("c#gotopc","LOCALS",0)~ + @200001 /* ~I want you to stay in sight.~ */ DO ~SetGlobal("c#gotopc","LOCALS",1)~ + i_will
+ ~GlobalGT("c#gotopc","LOCALS",0)~ + @200002 /* ~Stop staying in sight.~ */ DO ~SetGlobal("c#gotopc","LOCALS",0) ChangeAIScript("",DEFAULT)~ + i_will
+ ~Global("c#traps","LOCALS",0)
Class(Myself,THIEF_ALL)~ + @200003 /* ~I want you to look out out for traps.~ */ DO ~SetGlobal("c#traps","LOCALS",1)~ + i_will
+ ~Global("c#traps","LOCALS",1)
Class(Myself,THIEF_ALL)~ + @200004 /* ~Stop looking for traps.~ */ DO ~SetGlobal("c#traps","LOCALS",0)~ + i_will
/* warn about low HP (if following as a familiar) - will pause the game */
+ ~Global("C#HPAlarm","LOCALS",0)~ + @5 /* Grey, warn me if your health gets too low in the next fight, alright? */ /* @5 /* Grey, warn me if your health gets too low in the next fight, alright? */ */ DO ~SetGlobal("C#HPAlarm","LOCALS",1)~ + i_will
+ ~Global("C#HPAlarm","LOCALS",1)~ + @6 /* Grey, I want you to stop warning me about your health conditions in our fights, alright? */ /* @6 /* Grey, I want you to stop warning me about your health conditions in our fights, alright? */ */ DO ~SetGlobal("C#HPAlarm","LOCALS",0)~ + i_will
++ @200005 /* ~If we encounter enemies...~ */ + script_chose_01
++ @200006 /* ~Leave everything as it is.~ */ EXIT
END

IF ~~ THEN script_chose_01
SAY @9 /* (Grey tilts his head to one side, looking at you intensely.) */
/*
+ ~Global("c#mage1","LOCALS",0)
Class(Myself,MAGE_ALL)~ + @200007 /* ~I want you to fight enemies you see with magic.~ */ DO ~SetGlobal("c#mage1","LOCALS",1)
SetGlobal("c#mage2","LOCALS",0)
SetGlobal("c#cautio","LOCALS",0)
SetGlobal("c#melee","LOCALS",0)
SetGlobal("c#ranged","LOCALS",0)
SetGlobal("c#defend","LOCALS",0)
SetGlobal("c#nothin","LOCALS",0)~ + i_will
+ ~Global("c#mage2","LOCALS",0)
Class(Myself,MAGE_ALL)~ + @200008 /* ~I want you to first prepare yourself and fight enemies with magic if you see them.~ */ DO ~SetGlobal("c#mage1","LOCALS",0)
SetGlobal("c#mage2","LOCALS",1)
SetGlobal("c#cautio","LOCALS",0)
SetGlobal("c#melee","LOCALS",0)
SetGlobal("c#ranged","LOCALS",0)
SetGlobal("c#defend","LOCALS",0)
SetGlobal("c#nothin","LOCALS",0)~ + i_will
*/

+ ~Global("c#cautio","LOCALS",0)~ + @200009 /* ~I want you to run away from enemies so you don't have to fight.~ */ DO ~SetGlobal("c#mage1","LOCALS",0)
SetGlobal("c#mage2","LOCALS",0)
SetGlobal("c#cautio","LOCALS",1)
SetGlobal("c#melee","LOCALS",0)
SetGlobal("c#ranged","LOCALS",0)
SetGlobal("c#defend","LOCALS",0)
SetGlobal("c#nothin","LOCALS",0)~ + i_will
+ ~Global("c#melee","LOCALS",0)~ + @200010 /* ~I want you to fight with melee weapons if you see enemies.~ */ DO ~SetGlobal("c#mage1","LOCALS",0)
SetGlobal("c#mage2","LOCALS",0)
SetGlobal("c#cautio","LOCALS",0)
SetGlobal("c#melee","LOCALS",1)
SetGlobal("c#ranged","LOCALS",0)
SetGlobal("c#defend","LOCALS",0)
SetGlobal("c#nothin","LOCALS",0)~ + i_will
+ ~Global("c#ranged","LOCALS",0)~ + @200011 /* ~I want you to fight with ranged weapons if you see enemies.~ */ DO ~SetGlobal("c#mage1","LOCALS",0)
SetGlobal("c#mage2","LOCALS",0)
SetGlobal("c#cautio","LOCALS",0)
SetGlobal("c#melee","LOCALS",0)
SetGlobal("c#ranged","LOCALS",1)
SetGlobal("c#defend","LOCALS",0)
SetGlobal("c#nothin","LOCALS",0)~ + i_will
+ ~Global("c#defend","LOCALS",0)~ + @200012 /* ~I want you to only defend yourself if attacked.~ */ DO ~SetGlobal("c#mage1","LOCALS",1)
SetGlobal("c#mage2","LOCALS",0)
SetGlobal("c#cautio","LOCALS",0)
SetGlobal("c#melee","LOCALS",0)
SetGlobal("c#ranged","LOCALS",0)
SetGlobal("c#defend","LOCALS",1)
SetGlobal("c#nothin","LOCALS",0)~ + i_will
+ ~Global("c#nothin","LOCALS",0)~ + @200013 /* ~I want you to do absolutely nothing in a fight.~ */ DO ~SetGlobal("c#mage1","LOCALS",1)
SetGlobal("c#mage2","LOCALS",0)
SetGlobal("c#cautio","LOCALS",0)
SetGlobal("c#melee","LOCALS",0)
SetGlobal("c#ranged","LOCALS",0)
SetGlobal("c#defend","LOCALS",0)
SetGlobal("c#nothin","LOCALS",1)~ + i_will

++ @200014 /* ~I have no new order for fights.~ */ + script_chose
END

IF ~~ THEN i_will
SAY @8 /* Woof! */ /* ~Woof!~ */
IF ~~ THEN EXIT
END


IF ~~ THEN talktohim
SAY @9 /* (Grey tilts his head to one side, looking at you intensely.) */ /* @9 /* (Grey tilts his head to one side, looking at you intensely.) */ */


/* BG1 */


/* chapter 1 */
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_1%) Global("C#Grey_Capter1PID","LOCALS",0)~ + @10 /* Gorion is dead, Grey... And I cannot return to Candlekeep. And even if I could return, it wouldn't be save any longer. (sigh) */ /* @10 /* Gorion is dead, Grey... And I cannot return to Candlekeep. And even if I could return, it wouldn't be save any longer. (sigh) */ */ DO ~SetGlobal("C#Grey_Capter1PID","LOCALS",1)~ + talkto_whine
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_1%) Global("C#Grey_Capter1PID","LOCALS",0)~ + @11 /* Gorion murdered, our home gone... But we are not giving up, Grey, are we? */ /* @11 /* Gorion murdered, our home gone... But we are not giving up, Grey, are we? */ */ DO ~SetGlobal("C#Grey_Capter1PID","LOCALS",1)~ + talkto_bark
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_1%) Global("C#Grey_Capter1PID","LOCALS",0)~ + @12 /* At last, Gey! I am free to go wherever I want, do whatever I want! */ /* @12 /* At last, Gey! I am free to go wherever I want, do whatever I want! */ */ DO ~SetGlobal("C#Grey_Capter1PID","LOCALS",1)~ + talkto_growl

/* chapter 2 */
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_2%) Global("C#Grey_Capter2PID","LOCALS",0)~ + @13 /* We'll have to go deep into the mines, Grey... (sigh) What a horrible thought. */ /* @13 /* We'll have to go deep into the mines, Grey... (sigh) What a horrible thought. */ */ DO ~SetGlobal("C#Grey_Capter2PID","LOCALS",1)~ + talkto_whine
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_2%) Global("C#Grey_Capter2PID","LOCALS",0)~ + @14 /* All points to that we have to cleanse the Nashkel Mines. Eh, Grey? How about chasing some ghosts? */ /* @14 /* All points to that we have to cleanse the Nashkel Mines. Eh, Grey? How about chasing some ghosts? */ */ DO ~SetGlobal("C#Grey_Capter2PID","LOCALS",1)~ + talkto_bark
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_2%) Global("C#Grey_Capter2PID","LOCALS",0)~ + @15 /* Now forward to cleansing a mine! Whatever is down there, it won't stand a chance against us! */ /* ~Now foreward to cleansing a mine! Whatever is down there, it won't stand a chance against us!~ */ DO ~SetGlobal("C#Grey_Capter2PID","LOCALS",1)~ + talkto_growl

/* chapter 3 */
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_3%) Global("C#Grey_Capter3PID","LOCALS",0)~ + @16 /* By the gods... Chasing the bandits, as if we don't have enough problems already... (sigh) */ /* @16 /* By the gods... Chasing the bandits, as if we don't have enough problems already... (sigh) */ */ DO ~SetGlobal("C#Grey_Capter3PID","LOCALS",1)~ + talkto_whine
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_3%) Global("C#Grey_Capter3PID","LOCALS",0)~ + @17 /* Alright! I guess going for the bandit camp means ending the bandit thread, which is a good thing, isn't it, Grey? */ /* @17 /* Alright! I guess going for the bandit camp means ending the bandit thread, which is a good thing, isn't it, Grey? */ */ DO ~SetGlobal("C#Grey_Capter3PID","LOCALS",1)~ + talkto_bark
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_3%) Global("C#Grey_Capter3PID","LOCALS",0)~ + @18 /* If the bandits won't come to us, we have to go to them. Isn't it? Beware, <CHARNAME> and Grey are coming! */ /* @18 /* If the bandits won't come to us, we have to go to them. Isn't it? Beware, <CHARNAME> and Grey are coming! */ */ DO ~SetGlobal("C#Grey_Capter3PID","LOCALS",1)~ + talkto_growl

/* chapter 4 */
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_4%) Global("C#Grey_Capter4PID","LOCALS",0)~ + @19 /* (sigh) And of course there is another, 'next-step' evil overlord we have to go after. And no end in sight... */ /* @19 /* (sigh) And of course there is another, 'next-step' evil overlord we have to go after. And no end in sight... */ */ DO ~SetGlobal("C#Grey_Capter4PID","LOCALS",1)~ + talkto_whine
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_4%) Global("C#Grey_Capter4PID","LOCALS",0)~ + @20 /* Now we are chasing another villain, and of course he is hiding in some forbidding place. Good I have you and your fine nose! Isn't it, Grey? */ /* @20 /* Now we are chasing another villain, and of course he is hiding in some forbidding place. Good I have you and your fine nose! Isn't it, Grey? */ */ DO ~SetGlobal("C#Grey_Capter4PID","LOCALS",1)~ + talkto_bark
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_4%) Global("C#Grey_Capter4PID","LOCALS",0)~ + @21 /* Whoever this "Davaeorn" might be, however mighty he thinks he is, we will get him! Eh, Grey? */ /* @21 /* Whoever this "Davaeorn" might be, however mighty he thinks he is, we will get him! Eh, Grey? */ */DO ~SetGlobal("C#Grey_Capter4PID","LOCALS",1)~ + talkto_growl

/* chapter 5 */
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_5%) Global("C#Grey_Capter5PID","LOCALS",0)~ + @22 /* And now the one we are looking for is inside the biggest city around... Finding a needle inside a haystack is easier than this! (sigh) */ /* @22 /* And now the one we are looking for is inside the biggest city around... Finding a needle inside a haystack is easier than this! (sigh) */ */ DO ~SetGlobal("C#Grey_Capter5PID","LOCALS",1)~ + talkto_whine
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_5%) Global("C#Grey_Capter5PID","LOCALS",0)~ + @23 /* Now it's up to the big city, Grey. We will go Baldur's Gate and find the bad boy! Won't we? */ /* @23 /* Now it's up to the big city, Grey. We will go Baldur's Gate and find the bad boy! Won't we? */ */ DO ~SetGlobal("C#Grey_Capter5PID","LOCALS",1)~ + talkto_bark
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_5%) Global("C#Grey_Capter5PID","LOCALS",0)~ + @24 /* Baldur's Gate, beware! No-one will be hiding from us. Come on, Grey! Let's go and get 'em! */ /* @24 /* Baldur's Gate, beware! No-one will be hiding from us. Come on, Grey! Let's go and get 'em! */ */ DO ~SetGlobal("C#Grey_Capter5PID","LOCALS",1)~ + talkto_growl

/* chapter 6 */
/* before being arrested */
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_6%)
!Global("Arrested","GLOBAL",1) Global("C#Grey_Capter6PID1","LOCALS",0)~ + @25 /* (sigh) Well, let's see whether they'll open up the doors for us now, back in Candlekeep... */ /* @25 /* (sigh) Well, let's see whether they'll open up the doors for us now, back in Candlekeep... */ */ DO ~SetGlobal("C#Grey_Capter6PID1","LOCALS",1)~ + talkto_whine
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_6%)
!Global("Arrested","GLOBAL",1) Global("C#Grey_Capter6PID1","LOCALS",0)~ + @26 /* Grey, imagine! It goes back home! We are going to Candlekeep! */ /* @26 /* Grey, imagine! It goes back home! We are going to Candlekeep! */ */ DO ~SetGlobal("C#Grey_Capter6PID1","LOCALS",1)~ + talkto_bark 
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_6%)
!Global("Arrested","GLOBAL",1) Global("C#Grey_Capter6PID1","LOCALS",0)~ + @27 /* We will find those culprits anywhere! They won't be able to hide. Not in Candlekeep! We know the place better than anyone! */ /* @27 /* We will find those culprits anywhere! They won't be able to hide. Not in Candlekeep! We know the place better than anyone! */ */ DO ~SetGlobal("C#Grey_Capter6PID1","LOCALS",1)~ + talkto_growl

/* after being arrested */
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_6%)
Global("Arrested","GLOBAL",1) Global("C#Grey_Capter6PID2","LOCALS",0)~ + @28 /* Look at us, Grey - inside the prison. (sigh) */ /* @28 /* Look at us, Grey - inside the prison. (sigh) */ */ DO ~SetGlobal("C#Grey_Capter6PID2","LOCALS",1)~ + talkto_whine
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_6%)
Global("Arrested","GLOBAL",1) Global("C#Grey_Capter6PID2","LOCALS",0)~ + @29 /* Well... It can't go anywhere than up from here, eh, Grey? */ /* @29 /* Well... It can't go anywhere than up from here, eh, Grey? */ */ DO ~SetGlobal("C#Grey_Capter6PID2","LOCALS",1)~ + talkto_bark 
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_6%)
Global("Arrested","GLOBAL",1) Global("C#Grey_Capter6PID2","LOCALS",0)~ + @30 /* Alright, this is enough. We will show them! */ /* @30 /* Alright, this is enough. We will show them! */ */  DO ~SetGlobal("C#Grey_Capter6PID2","LOCALS",1)~ + talkto_growl

/* child of Bhaal */
+ ~Global("C#Grey_KnowBhaal","GLOBAL",1) Global("C#Grey_BhaalheritagePID","LOCALS",0)~ + @31 /* Can you imagine, Grey... *I* would be a child of Bhaal, god of murder! I am doomed... We are all doomed... */ /* @31 /* Can you imagine, Grey... *I* would be a child of Bhaal, god of murder! I am doomed... We are all doomed... */ */ DO ~SetGlobal("C#Grey_BhaalheritagePID","LOCALS",1)~ + talkto_whine 
+ ~Global("C#Grey_KnowBhaal","GLOBAL",1) Global("C#Grey_BhaalheritagePID","LOCALS",0)~ + @32 /* Phew, now, that's a knowledge... To be a child of Bhaal... Well, at least I guess I'll always have enough bones for you, eh, Grey? */ /* @32 /* Phew, now, that's a knowledge... To be a child of Bhaal... Well, at least I guess I'll always have enough bones for you, eh, Grey? */ */ DO ~SetGlobal("C#Grey_BhaalheritagePID","LOCALS",1)~ + talkto_bark 
+ ~Global("C#Grey_KnowBhaal","GLOBAL",1) Global("C#Grey_BhaalheritagePID","LOCALS",0)~ + @33 /* A child of Bhaal! I have the power in me, Grey. I will rule the world, and you will help me conquer it! Are you ready? */ /* @33 /* A child of Bhaal! I have the power in me, Grey. I will rule the world, and you will help me conquer it! Are you ready? */ */ DO ~SetGlobal("C#Grey_BhaalheritagePID","LOCALS",1)~ + talkto_growl

/* Sarevok is dead! */
+ ~%BGT_VAR% Global("C#Grey_SarevokDeadPID","LOCALS",0) Dead("sarevok")~ + @86 /* [PC Reply]Sarevok is finally dead, Grey... but will is really change anything? (sigh) */ /* ~Sarevok is finally dead, Grey... but will is really change anything? (sigh)~ */ DO ~SetGlobal("C#Grey_SarevokDeadPID","LOCALS",1)~ + talkto_whine 
+ ~%BGT_VAR% Global("C#Grey_SarevokDeadPID","LOCALS",0) Dead("sarevok")~ + @87 /* [PC Reply]We did it, Grey! The murderer of Gorion is defeated. We are victorious! */ /* ~We did it, Grey! The murderer of Gorion is defeated. We are victorious!~ */ DO ~SetGlobal("C#Grey_SarevokDeadPID","LOCALS",1)~ + talkto_bark 
+ ~%BGT_VAR% Global("C#Grey_SarevokDeadPID","LOCALS",0) Dead("sarevok")~ + @88 /* [PC Reply]Sarevok, the Iron Throne, the whole conspiracy! All fell by our hand, Grey! Nothing can stop us! */ /* ~Sarevok, the Iron Throne, the whole conspiracy! All fell by our hand, Grey! Nothing can stop us!~ */ DO ~SetGlobal("C#Grey_SarevokDeadPID","LOCALS",1)~ + talkto_growl

/* SoD */

/* Korlasz's Crypt: OR(2) AreaCheck("bd0120") AreaCheck("bd0130") */
+ ~OR(2) AreaCheck("bd0120") AreaCheck("bd0130") Global("C#Grey_KorlaszCryptPID","LOCALS",0)~ + @195 /* Here we are, Grey - still searching for followers of Sarevok. This takes way longer than I'd wish... */ DO ~SetGlobal("C#Grey_KorlaszCryptPID","LOCALS",1)~ + talkto_whine
+ ~OR(2) AreaCheck("bd0120") AreaCheck("bd0130") Global("C#Grey_KorlaszCryptPID","LOCALS",0)~ + @196 /* So, Grey - Sarevok's last follower, eh? We are nearly done! */ DO ~SetGlobal("C#Grey_KorlaszCryptPID","LOCALS",1)~ + talkto_bark
+ ~OR(2) AreaCheck("bd0120") AreaCheck("bd0130") Global("C#Grey_KorlaszCryptPID","LOCALS",0)~ + @197 /* Here we come, Grey - Sarevok's last minion. They better brace themselves - or not, they won't have a chance against us anyway! */ DO ~SetGlobal("C#Grey_KorlaszCryptPID","LOCALS",1)~ + talkto_growl

/* BG city full of refugees: GlobalGT("BD_PLOT","GLOBAL",50) GlobalLT("BD_PLOT","GLOBAL",55) */
+ ~%IT_IS_SOD% Global("Chapter","GLOBAL",7) GlobalGT("BD_PLOT","GLOBAL",50) 
GlobalLT("BD_PLOT","GLOBAL",55) Global("C#Grey_SoDBGCityPID","LOCALS",0)~ + @198 /* All these people, Grey... Look at all the poor souls, having lost their homes, their loved ones... */ DO ~SetGlobal("C#Grey_SoDBGCityPID","LOCALS",1)~ + talkto_whine
+ ~%IT_IS_SOD% Global("Chapter","GLOBAL",7) GlobalGT("BD_PLOT","GLOBAL",50) 
GlobalLT("BD_PLOT","GLOBAL",55) Global("C#Grey_SoDBGCityPID","LOCALS",0)~ + @199 /* So many refugees. We will help these poor people, Grey! We will! */ DO ~SetGlobal("C#Grey_SoDBGCityPID","LOCALS",1)~ + talkto_bark
+ ~%IT_IS_SOD% Global("Chapter","GLOBAL",7) GlobalGT("BD_PLOT","GLOBAL",50) 
GlobalLT("BD_PLOT","GLOBAL",55) Global("C#Grey_SoDBGCityPID","LOCALS",0)~ + @200 /* Out of our way! There is too many people here, Grey, and that gives me bad temper. Very bad temper! */ DO ~SetGlobal("C#Grey_SoDBGCityPID","LOCALS",1)~ + talkto_growl


/* Chapter 8 */
/* general "we are on our way against the crusade" (Chapters 8,9,10) */
+ ~%IT_IS_SOD% OR(3) Global("Chapter","GLOBAL",8) Global("Chapter","GLOBAL",9) Global("Chapter","GLOBAL",10) GlobalLT("bd_plot","global",586)
Global("C#Grey_SoDMarchCrusadePID","LOCALS",0)~ + @201 /* So, here we are, Grey, on our way against the crusade. Why me?... Why me. */ DO ~SetGlobal("C#Grey_SoDMarchCrusadePID","LOCALS",1)~ + talkto_whine
+ ~%IT_IS_SOD% OR(3) Global("Chapter","GLOBAL",8) Global("Chapter","GLOBAL",9) Global("Chapter","GLOBAL",10) GlobalLT("bd_plot","global",586)
Global("C#Grey_SoDMarchCrusadePID","LOCALS",0)~ + @202 /* We'll face the crusade, Grey, eh? We will bring peace to the lands - once more! */ DO ~SetGlobal("C#Grey_SoDMarchCrusadePID","LOCALS",1)~ + talkto_bark
+ ~%IT_IS_SOD% OR(3) Global("Chapter","GLOBAL",8) Global("Chapter","GLOBAL",9) Global("Chapter","GLOBAL",10) GlobalLT("bd_plot","global",586)
Global("C#Grey_SoDMarchCrusadePID","LOCALS",0)~ + @203 /* Those crusaders wished they'd never left their homes. We'll make them pay! We'll make them all pay! */ DO ~SetGlobal("C#Grey_SoDMarchCrusadePID","LOCALS",1)~ + talkto_growl


/* after Coastway Crossing Bridge is down: GlobalGT("bd_plot","global",169) GlobalLT("bd_plot","global",299) */
+ ~%IT_IS_SOD% GlobalGT("bd_plot","global",169) GlobalLT("bd_plot","global",201) Global("C#Grey_SoDBridgeDownPID","LOCALS",0)~ + @204 /* The bridge is down... Everything gets more complicated. As always... (sigh) */ DO ~SetGlobal("C#Grey_SoDBridgeDownPID","LOCALS",1)~ + talkto_whine
+ ~%IT_IS_SOD% GlobalGT("bd_plot","global",169) GlobalLT("bd_plot","global",201) Global("C#Grey_SoDBridgeDownPID","LOCALS",0)~ + @205 /* They destroyed the bridge, but we will not let ourselves be stopped by this obstacle, will we? No! We will find another way! */ DO ~SetGlobal("C#Grey_SoDBridgeDownPID","LOCALS",1)~ + talkto_bark
+ ~%IT_IS_SOD% GlobalGT("bd_plot","global",169) GlobalLT("bd_plot","global",201) Global("C#Grey_SoDBridgeDownPID","LOCALS",0)~ + @206 /* They think they could stop me by taking down the bridge? What do they think we are - scared weaklings? There is no stopping me! They'll learn that soon enough! */ DO ~SetGlobal("C#Grey_SoDBridgeDownPID","LOCALS",1)~ + talkto_growl

/* Caelar - first meeting person to person: GlobalGT("bd_plot","global",169) */
+ ~%IT_IS_SOD% GlobalGT("bd_plot","global",169) 
	GlobalLT("bd_plot","global",485) //before the portal is opened
Global("C#Grey_SoDCaelar1PID","LOCALS",0)~ + @207 /* This Caelar surely is deluded... How am I supposed to stop this madwoman, Grey?... */ DO ~SetGlobal("C#Grey_SoDCaelar1PID","LOCALS",1)~ + talkto_whine
+ ~%IT_IS_SOD% GlobalGT("bd_plot","global",169) 
	GlobalLT("bd_plot","global",485) //before the portal is opened
Global("C#Grey_SoDCaelar1PID","LOCALS",0)~ + @208 /* So, we met with Caelar herself. She's just a woman of flesh and blood, Grey, shining eyes or no. Just a woman of flesh and blood! We took down a lot of those before, no? */ DO ~SetGlobal("C#Grey_SoDCaelar1PID","LOCALS",1)~ + talkto_bark
+ ~%IT_IS_SOD% GlobalGT("bd_plot","global",169) 
	GlobalLT("bd_plot","global",485) //before the portal is opened
Global("C#Grey_SoDCaelar1PID","LOCALS",0)~ + @209 /* "Shining Lady", pah! This woman better watch out, because we are coming to crush her! Crush her I say! */ DO ~SetGlobal("C#Grey_SoDCaelar1PID","LOCALS",1)~ + talkto_growl

/* General reaction to the knowledge that Hephernaan is working for a fiend */
+ ~%IT_IS_SOD% 
Global("C#RtD_HephernaanIdentity","GLOBAL",1)
GlobalGT("C#RtD_HephernaanFiend","GLOBAL",0)
	GlobalLT("bd_plot","global",485) //before the portal is opened
Global("C#Grey_SoDPID_HephFiend","LOCALS",0)~ + @210 /* Hephernaan has a *fiend* master.... this is getting more and more dangerous, Grey... */ DO ~SetGlobal("C#Grey_SoDPID_HephFiend","LOCALS",1)~ + talkto_whine
+ ~%IT_IS_SOD% Global("C#RtD_HephernaanIdentity","GLOBAL",1)
GlobalGT("C#RtD_HephernaanFiend","GLOBAL",0) 
	GlobalLT("bd_plot","global",485) //before the portal is opened
Global("C#Grey_SoDPID_HephFiend","LOCALS",0)~ + @211 /* Well, at least it fits - Hephernaan and his fiend master. We will stop them anyway, eh, Grey? */ DO ~SetGlobal("C#Grey_SoDPID_HephFiend","LOCALS",1)~ + talkto_bark
+ ~%IT_IS_SOD% Global("C#RtD_HephernaanIdentity","GLOBAL",1)
GlobalGT("C#RtD_HephernaanFiend","GLOBAL",0) 
	GlobalLT("bd_plot","global",485) //before the portal is opened
Global("C#Grey_SoDPID_HephFiend","LOCALS",0)~ + @212 /* This fiend master will not help Hephernaan, Grey. We will defeat them both! */ DO ~SetGlobal("C#Grey_SoDPID_HephFiend","LOCALS",1)~ + talkto_growl

/* General reaction to the knowledge that Caelar's only motive was to free her uncle */
+ ~%IT_IS_SOD% GlobalGT("C#RtD_CaelarPlan","GLOBAL",4)
	GlobalLT("bd_plot","global",485) //before the portal is opened
Global("C#Grey_SoDPID_Aun","LOCALS",0)~ + @213 /* *All* of this... Caelar did all of it for only one person. How low can one fall... */ DO ~SetGlobal("C#Grey_SoDPID_Aun","LOCALS",1)~ + talkto_whine
+ ~%IT_IS_SOD% GlobalGT("C#RtD_CaelarPlan","GLOBAL",4)
	GlobalLT("bd_plot","global",485) //before the portal is opened 
Global("C#Grey_SoDPID_Aun","LOCALS",0)~ + @214 /* So, now we know who Caelar is doing this for. She wants to save her uncle! */ DO ~SetGlobal("C#Grey_SoDPID_Aun","LOCALS",1)~ + talkto_bark
+ ~%IT_IS_SOD% GlobalGT("C#RtD_CaelarPlan","GLOBAL",4)
	GlobalLT("bd_plot","global",485) //before the portal is opened 
Global ("C#Grey_SoDPID_Aun","LOCALS",0)~ + @215 /* The whole crusade! All the people killed and driven away, just to save one man! And the crusaders don't even know about it! */ DO ~SetGlobal("C#Grey_SoDPID_Aun","LOCALS",1)~ + talkto_growl

/* General reaction: Caelar wants to open a portal to Avernus. */
+ ~%IT_IS_SOD% OR(3)
		GlobalGT("C#RtD_CaelarPlan","GLOBAL",3) 
  		GlobalGT("bd_plot","global",390) 
		Global("C#RtD_RoadToDiscovery","GLOBAL",1) 
	OR(2)
		GlobalGT("C#RtD_CaelarPlan","GLOBAL",3) 
		Global("C#RtD_RoadToDiscovery","GLOBAL",0) 
	GlobalLT("bd_plot","global",485) //before the portal is opened
Global("C#Grey_SoDPID_Portal","LOCALS",0)~ + @216 /* A portal to Avernus, Grey... If it gets opened it could lead to fiends pouring into this plane, just like the last two fiend wars. How am I supposed to prevent that... */ DO ~SetGlobal("C#Grey_SoDPID_Portal","LOCALS",1)~ + talkto_whine
+ ~%IT_IS_SOD% OR(3)
		GlobalGT("C#RtD_CaelarPlan","GLOBAL",3) 
  		GlobalGT("bd_plot","global",390) 
		Global("C#RtD_RoadToDiscovery","GLOBAL",1) 
	OR(2)
		GlobalGT("C#RtD_CaelarPlan","GLOBAL",3) 
		Global("C#RtD_RoadToDiscovery","GLOBAL",0) 
	GlobalLT("bd_plot","global",485) //before the portal is opened
Global("C#Grey_SoDPID_Portal","LOCALS",0)~ + @217 /* I am sure we will prevent the portal somehow. No way will there be a third fiend war at Dragonspear Castle, Grey, what do you think? */ DO ~SetGlobal("C#Grey_SoDPID_Portal","LOCALS",1)~ + talkto_bark
+ ~%IT_IS_SOD% OR(3)
		GlobalGT("C#RtD_CaelarPlan","GLOBAL",3) 
  		GlobalGT("bd_plot","global",390) 
		Global("C#RtD_RoadToDiscovery","GLOBAL",1) 
	OR(2)
		GlobalGT("C#RtD_CaelarPlan","GLOBAL",3) 
		Global("C#RtD_RoadToDiscovery","GLOBAL",0) 
	GlobalLT("bd_plot","global",485) //before the portal is opened
Global("C#Grey_SoDPID_Portal","LOCALS",0)~ + @218 /* So they think they can handle a portal to Avernus? We will teach them how it's done, Grey. We will teach them! */ DO ~SetGlobal("C#Grey_SoDPID_Portal","LOCALS",1)~ + talkto_growl

/* General reaction to the knowledge that Caelar needs the PC's blood to open the portal */
+ ~%IT_IS_SOD% GlobalGT("C#RtD_KnowsPortalBlood","GLOBAL",2)
GlobalLT("bd_plot","global",485)
Global("C#Grey_SoDPID_Blood","LOCALS",0)~ + @219 /* They want me blood, Grey... My teinted blood who opens a gateway to hell. Ah, why am I the cause for everything... */ DO ~SetGlobal("C#Grey_SoDPID_Blood","LOCALS",1)~ + talkto_whine
+ ~%IT_IS_SOD% GlobalGT("C#RtD_KnowsPortalBlood","GLOBAL",2) 
GlobalLT("bd_plot","global",485)
Global("C#Grey_SoDPID_Blood","LOCALS",0)~ + @220 /* My blood has special powers, so it's up to us to make sure it's not misused, eh, Grey? */ DO ~SetGlobal("C#Grey_SoDPID_Blood","LOCALS",1)~ + talkto_bark
+ ~%IT_IS_SOD% GlobalGT("C#RtD_KnowsPortalBlood","GLOBAL",2) 
GlobalLT("bd_plot","global",485)
Global("C#Grey_SoDPID_Blood","LOCALS",0)~ + @221 /* I am the powerful Bhaalspan! I have special powers and my blood opens portals to Avernus! But it is *my* power, Grey! I will decide how to use them, not some wannabe warlady! */ DO ~SetGlobal("C#Grey_SoDPID_Blood","LOCALS",1)~ + talkto_growl

/* Reaction to betrayal at portal */
+ ~%IT_IS_SOD% GlobalGT("bd_plot","global",494)
GlobalLT("bd_plot","global",586)
Global("C#Grey_SoDPID_Betrayal","LOCALS",0)~ + @222 /* We went right into the trap, Grey - right into it, and now we have to stop a fiend in Avernus! Why me... */ DO ~SetGlobal("C#Grey_SoDPID_Betrayal","LOCALS",1)~ + talkto_whine
+ ~%IT_IS_SOD% GlobalGT("bd_plot","global",494) 
GlobalLT("bd_plot","global",586)
Global("C#Grey_SoDPID_Betrayal","LOCALS",0)~ + @223 /* Oh well, shit happens they say. So we were betrayed, the portal to Avernus is open - but we will make the best of it, Grey, like we always do! */ DO ~SetGlobal("C#Grey_SoDPID_Betrayal","LOCALS",1)~ + talkto_bark
+ ~%IT_IS_SOD% GlobalGT("bd_plot","global",494) 
GlobalLT("bd_plot","global",586)
Global("C#Grey_SoDPID_Betrayal","LOCALS",0)~ + @224 /* He think he's smart? Betraying us? I say, this is not over yet. We will get them. Just wait and see who'll be the last one laughing here! */ DO ~SetGlobal("C#Grey_SoDPID_Betrayal","LOCALS",1)~ + talkto_growl

/* after retruning from Avernus */
+ ~%IT_IS_SOD% GlobalGT("bd_plot","global",585)
Global("C#Grey_SoDPID_Done","LOCALS",0)~ + @225 /* Is it over yet? It was exhausting enough. I wished I'd get some real rest, Grey... but is there even such a thing, for a child of Bhaal? */ DO ~SetGlobal("C#Grey_SoDPID_Done","LOCALS",1)~ + talkto_whine
+ ~%IT_IS_SOD% GlobalGT("bd_plot","global",585) 
Global("C#Grey_SoDPID_Done","LOCALS",0)~ + @226 /* Caelar's crusade is stopped, the fiend is dead, the portal sealed. I think we did good, didn't we? */ DO ~SetGlobal("C#Grey_SoDPID_Done","LOCALS",1)~ + talkto_bark
+ ~%IT_IS_SOD% GlobalGT("bd_plot","global",585) 
Global("C#Grey_SoDPID_Done","LOCALS",0)~ + @227 /* We crushed them all! We are unstoppable, Grey! We will continue to shape the world like we want it, and it will be good at it! */ DO ~SetGlobal("C#Grey_SoDPID_Done","LOCALS",1)~ + talkto_growl

/* being accused of murder */
/* not with another fine Hell */
+ ~%IT_IS_SOD% GlobalGT("bd_plot","global",604)
Global("C#AfHSoD_RevisedEnd","GLOBAL",0)
Global("C#Grey_SoDPID_Murder","LOCALS",0)~ + @228 /* I knew it... murder suspect, *again*... There is just no timeout for a child of Bhaal... */ DO ~SetGlobal("C#Grey_SoDPID_Murder","LOCALS",1)~ + talkto_whine
+ ~%IT_IS_SOD% GlobalGT("bd_plot","global",604)
Global("C#AfHSoD_RevisedEnd","GLOBAL",0) 
Global("C#Grey_SoDPID_Murder","LOCALS",0)~ + @229 /* Well, we handled murder accusations before, didn't we? We will be alright - somehow. Like we always are! */ DO ~SetGlobal("C#Grey_SoDPID_Murder","LOCALS",1)~ + talkto_bark
+ ~%IT_IS_SOD% GlobalGT("bd_plot","global",604) 
Global("C#AfHSoD_RevisedEnd","GLOBAL",0)
Global("C#Grey_SoDPID_Murder","LOCALS",0)~ + @230 /* They want to convict us of murder? Let them try, Grey. Let them try! We are not completely defensless, are we? */ DO ~SetGlobal("C#Grey_SoDPID_Murder","LOCALS",1)~ + talkto_growl

/* Hooded Man */
+ ~%IT_IS_SOD% Global("C#Grey_MetHMSoD","GLOBAL",1)
Global("C#Grey_SoDPID_HM","LOCALS",0)~ + @231 /* The hooded man killed Skie, Grey, but it's *us* they are accusing of it... Why is it always me... */ DO ~SetGlobal("C#Grey_SoDPID_HM","LOCALS",1)~ + talkto_whine
+ ~%IT_IS_SOD% Global("C#Grey_MetHMSoD","GLOBAL",1) 
Global("C#Grey_SoDPID_HM","LOCALS",0)~ + @232 /* So, now we know who is the murderer. It was an unknown man, and although we don't know who he is, it is good to have a first hint! */ DO ~SetGlobal("C#Grey_SoDPID_HM","LOCALS",1)~ + talkto_bark
+ ~%IT_IS_SOD% Global("C#Grey_MetHMSoD","GLOBAL",1) 
Global("C#Grey_SoDPID_HM","LOCALS",0)~ + @233 /* This hooded man killed Skie to feign murder accusations against me? We're not going to let him get away with it, Grey. We will not! */ DO ~SetGlobal("C#Grey_SoDPID_HM","LOCALS",1)~ + talkto_growl

/* we need to leave town and lay low */
+ ~%IT_IS_SOD% GlobalGT("bd_plot","global",619)
Global("C#Grey_SoDPID_leave","LOCALS",0)~ + @234 /* We need to flee the city... Like a criminal... */ DO ~SetGlobal("C#Grey_SoDPID_leave","LOCALS",1)~ + talkto_whine
+ ~%IT_IS_SOD% GlobalGT("bd_plot","global",619) 
Global("C#Grey_SoDPID_leave","LOCALS",0)~ + @235 /* We have to leave unnoticed and lay low for a while, but I am sure we will be able to set it right, won#t we, Grey? */ DO ~SetGlobal("C#Grey_SoDPID_leave","LOCALS",1)~ + talkto_bark
+ ~%IT_IS_SOD% GlobalGT("bd_plot","global",619) 
Global("C#Grey_SoDPID_leave","LOCALS",0)~ + @236 /* They expell us! They drive us away! We *will* return, Grey, and they will regret they turned their backs on us! */ DO ~SetGlobal("C#Grey_SoDPID_leave","LOCALS",1)~ + talkto_growl


/* BGII */

/* in Irenicus' Dungeon */
/*
+ ~%IT_IS_BG2% ##
Global("C#Grey_SoAPID_##","LOCALS",0)~ + ~##, Grey?...~ DO ~SetGlobal("C#Grey_SoAPID_##","LOCALS",1)~ + talkto_whine
+ ~%IT_IS_BG2% ## 
Global("C#Grey_SoAPID_##","LOCALS",0)~ + ~##~ DO ~SetGlobal("C#Grey_SoAPID_##","LOCALS",1)~ + talkto_bark
+ ~%IT_IS_BG2% ## 
Global("C#Grey_SoAPID_##","LOCALS",0)~ + ~##~ DO ~SetGlobal("C#Grey_SoAPID_##","LOCALS",1)~ + talkto_growl
*/


//+ ~%IT_IS_BG2% ##chapter BG2~ + ~Eh, Grey? We'll make our way, here in Amn!~ + talkto_bark

/* template (SoA) 
+ ~%IT_IS_BG2% ##
Global("C#Grey_SoAPID_##","LOCALS",0)~ + ~##, Grey?...~ DO ~SetGlobal("C#Grey_SoAPID_##","LOCALS",1)~ + talkto_whine
+ ~%IT_IS_BG2% ## 
Global("C#Grey_SoAPID_##","LOCALS",0)~ + ~##~ DO ~SetGlobal("C#Grey_SoAPID_##","LOCALS",1)~ + talkto_bark
+ ~%IT_IS_BG2% ## 
Global("C#Grey_SoAPID_##","LOCALS",0)~ + ~##~ DO ~SetGlobal("C#Grey_SoAPID_##","LOCALS",1)~ + talkto_growl
*/


/* general (all games)  */


+ ~RandomNum(3,1)~ + @78 /* It's all so complicated, Grey... */  /* @78 /* It's all so complicated, Grey... */ */ + talkto_pcsad_01
+ ~RandomNum(3,2)~ + @78 /* It's all so complicated, Grey... */  /* @78 /* It's all so complicated, Grey... */ */ + talkto_pcsad_02
+ ~RandomNum(3,3)~ + @78 /* It's all so complicated, Grey... */  /* @78 /* It's all so complicated, Grey... */ */ + talkto_pcsad_03

+ ~RandomNum(3,1)~ + @79 /* Why me, Grey? Why me... */ /* @79 /* Why me, Grey? Why me... */ */ + talkto_pcsad_01
+ ~RandomNum(3,2)~ + @79 /* Why me, Grey? Why me... */ /* @79 /* Why me, Grey? Why me... */ */ + talkto_pcsad_02
+ ~RandomNum(3,3)~ + @79 /* Why me, Grey? Why me... */ /* @79 /* Why me, Grey? Why me... */ */ + talkto_pcsad_03

+ ~RandomNum(3,1)~ + @80 /* It could be worse, Grey, eh, you hairy brute? */ /* @80 /* It could be worse, Grey, eh, you hairy brute? */ */ + talkto_pcok_01
+ ~RandomNum(3,2)~ + @80 /* It could be worse, Grey, eh, you hairy brute? */ /* @80 /* It could be worse, Grey, eh, you hairy brute? */ */ + talkto_pcok_02
+ ~RandomNum(3,3)~ + @80 /* It could be worse, Grey, eh, you hairy brute? */ /* @80 /* It could be worse, Grey, eh, you hairy brute? */ */ + talkto_pcok_03

+ ~RandomNum(3,1)~ + @81 /* I think we are doing quite well, what do you say? */ /* @81 /* I think we are doing quite well, what do you say? */ */ + talkto_pcok_01
+ ~RandomNum(3,2)~ + @81 /* I think we are doing quite well, what do you say? */ /* @81 /* I think we are doing quite well, what do you say? */ */ + talkto_pcok_02
+ ~RandomNum(3,3)~ + @81 /* I think we are doing quite well, what do you say? */ /* @81 /* I think we are doing quite well, what do you say? */ */ + talkto_pcok_03

+ ~RandomNum(3,1)~ + @82 /* We'll show them, Grey. We'll show them all! */ /* @82 /* We'll show them, Grey. We'll show them all! */ */ + talkto_pcenergetic_01
+ ~RandomNum(3,2)~ + @82 /* We'll show them, Grey. We'll show them all! */ /* @82 /* We'll show them, Grey. We'll show them all! */ */ + talkto_pcenergetic_02
+ ~RandomNum(3,3)~ + @82 /* We'll show them, Grey. We'll show them all! */ /* @82 /* We'll show them, Grey. We'll show them all! */ */ + talkto_pcenergetic_03

+ ~RandomNum(3,1)~ + @83 /* Let's go and find those culprits! No one can stop us! No one! */ /* @83 /* Let's go and find those culprits! No one can stop us! No one! */ */ + talkto_pcenergetic_01
+ ~RandomNum(3,2)~ + @83 /* Let's go and find those culprits! No one can stop us! No one! */ /* @83 /* Let's go and find those culprits! No one can stop us! No one! */ */ + talkto_pcenergetic_02
+ ~RandomNum(3,3)~ + @83 /* Let's go and find those culprits! No one can stop us! No one! */ /* @83 /* Let's go and find those culprits! No one can stop us! No one! */ */ + talkto_pcenergetic_03
END


IF ~~ THEN find_brage 
SAY @8 /* Woof! */ /* ~Woof!~ */
IF ~~ THEN DO ~EraseJournalEntry(@100001)
SetGlobal("C#Grey_Brage","GLOBAL",4) 
ClearAllActions()
StartCutSceneMode() 
StartCutScene("C#GrCut2")~ EXIT
END

IF ~~ THEN find_rufie 
SAY @8 /* Woof! */ /* ~Woof!~ */
IF ~~ THEN DO ~SetGlobal("C#Grey_SearchRufieBG1","GLOBAL",1)~ EXIT
END

IF ~~ THEN sod_search_ham
SAY @8 /* Woof! */ /* ~Woof!~ */
IF ~~ THEN DO ~ClearAllActions()
StartCutSceneMode() 
%StartCutSceneEx_c#grcus2%~ EXIT
END

IF ~~ THEN sod_statues
SAY @8 /* Woof! */ /* ~Woof!~ */
IF ~~ THEN DO ~SetGlobal("C#Grey_SoD_statues","GLOBAL",2) 
ClearAllActions()
StartCutSceneMode() 
StartCutScene("c#grcus1")~ EXIT
END

IF ~~ THEN sod_search_tilda_bragequest
SAY @8 /* Woof! */ /* ~Woof!~ */
IF ~~ THEN DO ~SetGlobal("C#Grey_SearchTildaSoD","MYAREA",1)~ EXIT
END

IF ~~ THEN sod_search_skie
SAY @8 /* Woof! */ /* ~Woof!~ */
IF ~~ THEN DO ~SetGlobal("C#Grey_SearchSkieSoD","MYAREA",1)~ EXIT
END

IF ~~ THEN sod_candle_safana
SAY @8 /* Woof! */ /* ~Woof!~ */
IF ~~ THEN DO ~SetGlobal("C#Grey_SearchMizhenSoD","MYAREA",1)~ EXIT
END

IF ~~ THEN sod_bottle_safana
SAY @8 /* Woof! */ /* ~Woof!~ */
IF ~~ THEN DO ~SetGlobal("C#Grey_SearchHelvdarSoD","MYAREA",1)~ EXIT
END

IF ~~ THEN sod_runepaper_safana
SAY @190 /* (sniff! sniff!) */
= @191 /* (Grey gives you an unhappy look. The scent from the paper is not distinct enough.) */
IF ~~ THEN DO ~SetGlobal("C#Grey_SearchRuneSoD","MYAREA",1)~ EXIT
END


/* whine */
IF ~~ THEN talkto_pcsad_01
SAY @34 /* (Grey gives your hand a sympathetic shove with his snout.) */ /* @34 /* (Grey gives your hand a sympathetic shove with his snout.) */ */
IF ~~ THEN + talkto_whine
END

IF ~~ THEN talkto_pcsad_02
SAY @35 /* (Grey gives your hand a quick licking.) */ /* @35 /* (Grey gives your hand a quick licking.) */ */
IF ~~ THEN + talkto_whine
END

IF ~~ THEN talkto_pcsad_03
SAY @36 /* (Grey's eyes are still focussing you, with a long, comprehensive look.) */ /* @36 /* (Grey's eyes are still focussing you, with a long, comprehensive look.) */ */
IF ~~ THEN + talkto_whine
END

IF ~~ THEN talkto_whine
SAY @37 /* (whines sympathetically) */ /* @37 /* (whines sympathetically) */ */
IF ~~ THEN EXIT
END

/* bark */
IF ~~ THEN talkto_pcok_01
SAY @38 /* (Grey waggs his tail enthusiastically.) */ /* ~(Grey waggs his tail enthousiastically.)~ */
IF ~~ THEN + talkto_bark
END

IF ~~ THEN talkto_pcok_02
SAY @39 /* (Grey straightens up on his four legs.) */  /* @39 /* (Grey straightens up on his four legs.) */ */
IF ~~ THEN + talkto_bark
END

IF ~~ THEN talkto_pcok_03
SAY @40 /* (Grey gives you a happy look.) */ /* @40 /* (Grey gives you a happy look.) */ */
IF ~~ THEN + talkto_bark
END

IF ~~ THEN talkto_bark
SAY @8 /* Woof! */ /* ~Woof!~ */ 
IF ~~ THEN EXIT
END

/* growl */
IF ~~ THEN talkto_pcenergetic_01
SAY @41 /* (Grey snapps at an imaginary prey.) */ /* @41 /* (Grey snapps at an imaginary prey.) */ */
IF ~~ THEN + talkto_growl
END

IF ~~ THEN talkto_pcenergetic_02
SAY @42 /* (Grey bares his teeth theatrically.) */ /* @42 /* (Grey bares his teeth theatrically.) */ */
IF ~~ THEN + talkto_growl
END

IF ~~ THEN talkto_pcenergetic_03
SAY @43 /* (Excitedly, Grey growls at imaginary enemies.) */ /* @43 /* (Excitedly, Grey growls at imaginary enemies.) */ */
IF ~~ THEN + talkto_growl
END

IF ~~ THEN talkto_growl
SAY @44 /* (growls affirmatively) */ /* @44 /* (growls affirmatively) */ */
IF ~~ THEN EXIT
END



IF ~~ THEN stick_play
SAY @45 /* (Now that you have the stick you...) */ /* @45 /* (Now that you have the stick you...) */ */
+ ~RandomNum(6,1)~ + @46 /* (...throw it for Grey to catch.) */ /* @46 /* (...throw it for Grey to catch.) */ */ + stick_catch_01
+ ~RandomNum(6,2)~ + @46 /* (...throw it for Grey to catch.) */ /* @46 /* (...throw it for Grey to catch.) */ */ + stick_catch_02
+ ~RandomNum(6,3)~ + @46 /* (...throw it for Grey to catch.) */ /* @46 /* (...throw it for Grey to catch.) */ */ + stick_catch_02
+ ~RandomNum(6,4)~ + @46 /* (...throw it for Grey to catch.) */ /* @46 /* (...throw it for Grey to catch.) */ */ + stick_catch_03
+ ~RandomNum(6,5)~ + @46 /* (...throw it for Grey to catch.) */ /* @46 /* (...throw it for Grey to catch.) */ */ + stick_catch_03
+ ~RandomNum(6,6)~ + @46 /* (...throw it for Grey to catch.) */ /* @46 /* (...throw it for Grey to catch.) */ */ + stick_catch_03
+ ~RandomNum(5,1)~ + @47 /* (...hold it high for Grey to jump.) */ /*  @47 /* (...hold it high for Grey to jump.) */ */ + stick_jump_01
+ ~RandomNum(5,2)~ + @47 /* (...hold it high for Grey to jump.) */ /*  @47 /* (...hold it high for Grey to jump.) */ */ + stick_jump_02
+ ~RandomNum(5,3)~ + @47 /* (...hold it high for Grey to jump.) */ /*  @47 /* (...hold it high for Grey to jump.) */ */ + stick_jump_02
+ ~RandomNum(5,4)~ + @47 /* (...hold it high for Grey to jump.) */ /*  @47 /* (...hold it high for Grey to jump.) */ */ + stick_jump_03
+ ~RandomNum(5,5)~ + @47 /* (...hold it high for Grey to jump.) */ /*  @47 /* (...hold it high for Grey to jump.) */ */ + stick_jump_03
+ ~RandomNum(5,1)~ + @48 /* (...pretend to throw it but keep it in your hands.) */ /* @48 /* (...pretend to throw it but keep it in your hands.) */ */ + stick_pretend_01
+ ~RandomNum(5,2)~ + @48 /* (...pretend to throw it but keep it in your hands.) */ /* @48 /* (...pretend to throw it but keep it in your hands.) */ */ + stick_pretend_02
+ ~RandomNum(5,3)~ + @48 /* (...pretend to throw it but keep it in your hands.) */ /* @48 /* (...pretend to throw it but keep it in your hands.) */ */ + stick_pretend_03
+ ~RandomNum(5,4)~ + @48 /* (...pretend to throw it but keep it in your hands.) */ /* @48 /* (...pretend to throw it but keep it in your hands.) */ */ + stick_pretend_03
+ ~RandomNum(5,5)~ + @48 /* (...pretend to throw it but keep it in your hands.) */ /* @48 /* (...pretend to throw it but keep it in your hands.) */ */ + stick_pretend_04
++ @49 /* (...let it drop back on the ground.) No time to play right now, boy. Sorry! */ /* @49 /* (...let it drop back on the ground.) No time to play right now, boy. Sorry! */ */ EXIT
END

IF ~~ THEN stick_catch_01
SAY @50 /* (Grey looks at you without moving. He doesn't seem to be in the mood for playing right now.) */ /* @50 /* (Grey looks at you without moving. He doesn't seem to be in the mood for playing right now.) */ */
IF ~~ THEN EXIT
END

IF ~~ THEN stick_catch_02
SAY @51 /* (Grey speeds to catch the stick, then he strolls away to chew on it.) */ /* @51 /* (Grey speeds to catch the stick, then he strolls away to chew on it.) */ */
IF ~~ THEN DO ~RunAwayFrom(PLayer1,5)~ EXIT
END

IF ~~ THEN stick_catch_03
SAY @52 /* (Grey gets the stick and brings it back to you.) */ /* @52 /* (Grey gets the stick and brings it back to you.) */ */
IF ~~ THEN + stick_play
END

IF ~~ THEN stick_jump_01
SAY @53 /* (Grey is a Wolfhound, standing about a metre high at the shoulder and being about 7 feet tall standing on hind legs. He easily plucks the stick out of your raised hands while putting his legs on your shoulders, ignoring your yells, leaving a trace of slobber in your face.) */ /* @53 /* (Grey is a Wolfhound, standing about a metre high at the shoulder and being about 7 feet tall standing on hind legs. He easily plucks the stick out of your raised hands while putting his legs on your shoulders, ignoring your yells, leaving a trace of slobber in your face.) */ */
IF ~~ THEN EXIT
END

IF ~~ THEN stick_jump_02
SAY @54 /* (You succeed in moving the stick away in time before Grey can reach it.) */ /* @54 /* (You succeed in moving the stick away in time before Grey can reach it.) */ */
IF ~~ THEN + stick_play
END

IF ~~ THEN stick_jump_03
SAY @55 /* (Grey is a Wolfhound, standing about a metre high at the shoulder and being about 7 feet tall standing on hind legs. He doesn't have to "jump". He gets on his hinded legs lazively and plucks the stick out of your hands.) */ /* @55 /* (Grey is a Wolfhound, standing about a metre high at the shoulder and being about 7 feet tall standing on hind legs. He doesn't have to "jump". He gets on his hinded legs lazively and plucks the stick out of your hands.) */ */
IF ~~ THEN EXIT
END

IF ~~ THEN stick_pretend_01
SAY @56 /* (Grey speeds into the pretended throwing direction but notices his error and returns back to you.) */ /* @56 /* (Grey speeds into the pretended throwing direction but notices his error and returns back to you.) */ */
IF ~~ THEN + stick_play
END

IF ~~ THEN stick_pretend_02
SAY @57 /* (Grey speeds into the pretended throwing direction but notices his error and comes to a halt, turning his head to you.) */ /* @57 /* (Grey speeds into the pretended throwing direction but notices his error and comes to a halt, turning his head to you.) */ */
IF ~~ THEN + stick_play
END

IF ~~ THEN stick_pretend_03
SAY @58 /* (Grey didn't stop watching the stick so he isn't fooled.) Woof! */ /* @58 /* (Grey didn't stop watching the stick so he isn't fooled.) Woof! */ */
IF ~~ THEN + stick_play
END

IF ~~ THEN stick_pretend_04
SAY @59 /* (Grey speeds into the pretended throwing direction, but then he strolls off, pretending to be interested in something else.) */ /* @59 /* (Grey speeds into the pretended throwing direction, but then he strolls off, pretending to be interested in something else.) */ */
IF ~~ THEN DO ~RunAwayFrom(PLayer1,5)~ EXIT
END

//------------

IF ~~ THEN ruffle
SAY @60 /* (Grey stands next to you, wagging his tail.) */ /* @60 /* (Grey stands next to you, wagging his tail.) */ */
+ ~RandomNum(5,1)~ + @61 /* (You pet his head.) Good boy! */ /* @61 /* (You pet his head.) Good boy! */ */ + ruffle_head_01
+ ~RandomNum(5,2)~ + @61 /* (You pet his head.) Good boy! */ /* @61 /* (You pet his head.) Good boy! */ */ + ruffle_head_01
+ ~RandomNum(5,3)~ + @61 /* (You pet his head.) Good boy! */ /* @61 /* (You pet his head.) Good boy! */ */ + ruffle_head_02
+ ~RandomNum(5,4)~ + @61 /* (You pet his head.) Good boy! */ /* @61 /* (You pet his head.) Good boy! */ */ + ruffle_head_02
+ ~RandomNum(5,5)~ + @61 /* (You pet his head.) Good boy! */ /* @61 /* (You pet his head.) Good boy! */ */ + ruffle_head_03
+ ~RandomNum(5,1)~ + @62 /* (You pet his shoulders and back, tapping and ruffling gently his fur.) */ /* ~(You pet his shoulders and back, tapping and ruffling gently his furr.)~ */ + ruffle_shoulders_01
+ ~RandomNum(5,2)~ + @62 /* (You pet his shoulders and back, tapping and ruffling gently his fur.) */ /* ~(You pet his shoulders and back, tapping and ruffling gently his furr.)~ */ + ruffle_shoulders_01
+ ~RandomNum(5,3)~ + @62 /* (You pet his shoulders and back, tapping and ruffling gently his fur.) */ /* ~(You pet his shoulders and back, tapping and ruffling gently his furr.)~ */ + ruffle_shoulders_01
+ ~RandomNum(5,4)~ + @62 /* (You pet his shoulders and back, tapping and ruffling gently his fur.) */ /* ~(You pet his shoulders and back, tapping and ruffling gently his furr.)~ */ + ruffle_shoulders_02
+ ~RandomNum(5,5)~ + @62 /* (You pet his shoulders and back, tapping and ruffling gently his fur.) */ /* ~(You pet his shoulders and back, tapping and ruffling gently his furr.)~ */ + ruffle_shoulders_03
+ ~RandomNum(3,1)~ + @63 /* (You take his jaw into your palm, looking into his eyes.) You're a good boy there, Grey! */ /* ~(You take his jaw into your palm, looking into his eyes.) You'r a good boy there, Grey!~ */ + ruffle_jaw_01
+ ~RandomNum(3,2)~ + @63 /* (You take his jaw into your palm, looking into his eyes.) You're a good boy there, Grey! */ /* ~(You take his jaw into your palm, looking into his eyes.) You'r a good boy there, Grey!~ */ + ruffle_jaw_02
+ ~RandomNum(3,3)~ + @63 /* (You take his jaw into your palm, looking into his eyes.) You're a good boy there, Grey! */ /* ~(You take his jaw into your palm, looking into his eyes.) You'r a good boy there, Grey!~ */ + ruffle_jaw_03
+ ~RandomNum(4,1)~ + @64 /* (You playfully tear his tail.) Got you! */ /* @64 /* (You playfully tear his tail.) Got you! */ */ + ruffle_tail_01
+ ~RandomNum(4,2)~ + @64 /* (You playfully tear his tail.) Got you! */ /* @64 /* (You playfully tear his tail.) Got you! */ */ + ruffle_tail_01
+ ~RandomNum(4,3)~ + @64 /* (You playfully tear his tail.) Got you! */ /* @64 /* (You playfully tear his tail.) Got you! */ */ + ruffle_tail_02
+ ~RandomNum(4,4)~ + @64 /* (You playfully tear his tail.) Got you! */ /* @64 /* (You playfully tear his tail.) Got you! */ */ + ruffle_tail_03
++ @65 /* Sorry, better not now, boy! */ /* @65 /* Sorry, better not now, boy! */ */ EXIT
END

IF ~~ THEN ruffle_head_01
SAY @66 /* (Grey looks at you, wagging his tail.) */ /* @66 /* (Grey looks at you, wagging his tail.) */ */
IF ~~ THEN EXIT
END

IF ~~ THEN ruffle_head_02
SAY @67 /* (Grey turns his head to lick your hand.) */ /* @67 /* (Grey turns his head to lick your hand.) */ */
IF ~~ THEN EXIT
END

IF ~~ THEN ruffle_head_03
SAY @68 /* (Grey doesn't seem to pay much attention.) */ /* @68 /* (Grey doesn't seem to pay much attention.) */ */
IF ~~ THEN EXIT
END

IF ~~ THEN ruffle_shoulders_01
SAY @69 /* (Grey stands still, enjoying the massage.) */ /* @69 /* (Grey stands still, enjoying the massage.) */ */
IF ~~ THEN EXIT
END

IF ~~ THEN ruffle_shoulders_02
SAY @70 /* (Grey holds still, but he doesn't seem to pay much attention, being more interested in something on the floor.) */ /* @70 /* (Grey holds still, but he doesn't seem to pay much attention, being more interested in something on the floor.) */ */
IF ~~ THEN EXIT
END

IF ~~ THEN ruffle_shoulders_03
SAY @71 /* (Grey is too impatient to hold still. He turns to lick your hand and strolls off.) */ /* @71 /* (Grey is too impatient to hold still. He turns to lick your hand and strolls off.) */ */
IF ~~ THEN EXIT
END

IF ~~ THEN ruffle_jaw_01
SAY @72 /* (Grey answers with a friendly growl.) */ /* @72 /* (Grey answers with a friendly growl.) */ */
IF ~~ THEN EXIT
END

IF ~~ THEN ruffle_jaw_02
SAY @73 /* (Grey tries to lick you, blowing his breath into your face.) */ /* @73 /* (Grey tries to lick you, blowing his breath into your face.) */ */
IF ~~ THEN EXIT
END

IF ~~ THEN ruffle_jaw_03
SAY @74 /* (Grey looks straight into your eyes, giving you all his attention.) */ /* @74 /* (Grey looks straight into your eyes, giving you all his attention.) */ */
IF ~~ THEN EXIT
END

IF ~~ THEN ruffle_tail_01
SAY @75 /* (Grey snaps playful at your hand.) Woof! */ /* @75 /* (Grey snaps playful at your hand.) Woof! */ */
IF ~~ THEN EXIT
END

IF ~~ THEN ruffle_tail_02
SAY @76 /* (Grey looks at you, somehow perplexed.) */ /* @76 /* (Grey looks at you, somehow perplexed.) */ */
IF ~~ THEN EXIT
END

IF ~~ THEN ruffle_tail_03
SAY @77 /* (Grey turns and *jumps* at you. You pay for the teasing with a slobbery face.) */ /* @77 /* (Grey turns and *jumps* at you. You pay for the teasing with a slobbery face.) */ */
IF ~~ THEN EXIT
END

//--------------

END //APPEND