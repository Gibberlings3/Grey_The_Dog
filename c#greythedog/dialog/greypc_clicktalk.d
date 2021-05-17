APPEND c#greyJ

/* NOTE: BG2(EE) only reply options should be marked with ~%IT_IS_BG2%~ */

IF ~IsGabber(Player1)~ THEN BEGIN grey_clicktalk
SAY ~(Grey turns his head to you.) Woof!~

/* Find Brage - start in Nashkel Garrison */

+ ~AreaCheck("%Nashkel_Garrison%") 
OR(2)
PartyHasItem("c#grbrbr") 
HasItem("c#grbrbr","C#Grey")
GlobalLT("C#Grey_Brage","GLOBAL",4) Global("MetBrage","GLOBAL",0)~ + @0 /* ~Grey, find Brage! Find, Grey!~ */ + find_brage

/* SoD, BD1000 find missing refugies */

+ ~AreaCheck("BD1000") Range("BDHEROD",15) Global("C#Grey_SoD_statues","GLOBAL",1) 
GlobalLT("BD_PET_MAIN","MYAREA",4)
Global("bd_125_bought_golem","global",0)
Global("BD_PET_SAVED","MYAREA",0)~ + ~Grey, find the missing refugies! Find, Grey!~ + sod_statues


+ ~AreaType(OUTDOOR)
OR(3)
AreaType(FOREST)
AreaType(CITY)
AreaType(OUTDOOR)~ + @1 /* ~(You take a stick from the ground.) Want to play?~ */ + stick_play
++ @2 /* ~Come here boy, I want to pet you!~ */ + ruffle

/* CHARNAME needs some loving, too! */

++ @3 /* ~I need to talk to someone, Grey...~ */ + talktohim

/* inventory management - if Grey is not in party but following as companion 
This is what usually is dealt with by the kicked out "P" dialogue for re-joining */

+ ~!InParty(Myself) Global("C#GreyJoined","GLOBAL",2) NumInPartyLT(6)~ + @4 /* ~Come here, I need access to your inventory.~ */ DO ~RemoveFamiliar() SetGlobal("C#GreyJoined","GLOBAL",1) JoinParty()~ EXIT

+ ~!InParty(Myself) Global("C#GreyJoined","GLOBAL",2) NumInParty(6)~ + @4 /* ~Come here, I need access to your inventory.~ */ DO ~RemoveFamiliar() 
ChangeAIScript("",DEFAULT)
ChangeEnemyAlly(Myself,NEUTRAL)
SetGlobal("C#GreyJoined","GLOBAL",1) JoinParty()~ EXIT

/* warn about low HP (if following as a familiar) - will pause the game */

+ ~Global("C#Grey_HPAlarm","GLOBAL",0) Global("C#GreyJoined","GLOBAL",2)~ + @5 /* ~Grey, warn me if your health gets too low in the next fight, alright?~ */ DO ~SetGlobal("C#Grey_HPAlarm","GLOBAL",1)~ + hp_alarm
+ ~Global("C#Grey_HPAlarm","GLOBAL",1) Global("C#GreyJoined","GLOBAL",2)~ + @6 /* ~Grey, I want you to stop warning me about your health conditions in our fights, alright?~ */ DO ~SetGlobal("C#Grey_HPAlarm","GLOBAL",0)~ + hp_alarm


++ @7 /* ~Nothing, good boy. Let's get on!~ */ EXIT

END



//--------

IF ~~ THEN hp_alarm
SAY @8 /* ~Woof!~ */
IF ~~ THEN EXIT
END


IF ~~ THEN talktohim
SAY @9 /* ~(Grey tilts his head to one side, looking at you intensely.)~ */


/* BG1 */


/* chapter 1 */
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_1%) Global("C#Grey_Capter1PID","LOCALS",0)~ + @10 /* ~Gorion is dead, Grey... And I cannot return to Candlekeep. And even if I could return, it wouldn't be save any longer. (sigh)~ */ DO ~SetGlobal("C#Grey_Capter1PID","LOCALS",1)~ + talkto_whine
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_1%) Global("C#Grey_Capter1PID","LOCALS",0)~ + @11 /* ~Gorion murdered, our home gone... But we are not giving up, Grey, are we?~ */ DO ~SetGlobal("C#Grey_Capter1PID","LOCALS",1)~ + talkto_bark
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_1%) Global("C#Grey_Capter1PID","LOCALS",0)~ + @12 /* ~At last, Gey! I am free to go wherever I want, do whatever I want!~ */ DO ~SetGlobal("C#Grey_Capter1PID","LOCALS",1)~ + talkto_growl

/* chapter 2 */
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_2%) Global("C#Grey_Capter2PID","LOCALS",0)~ + @13 /* ~We'll have to go deep into the mines, Grey... (sigh) What a horrible thought.~ */ DO ~SetGlobal("C#Grey_Capter2PID","LOCALS",1)~ + talkto_whine
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_2%) Global("C#Grey_Capter2PID","LOCALS",0)~ + @14 /* ~All points to that we have to cleanse the Nashkel Mines. Eh, Grey? How about chasing some ghosts?~ */ DO ~SetGlobal("C#Grey_Capter2PID","LOCALS",1)~ + talkto_bark
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_2%) Global("C#Grey_Capter2PID","LOCALS",0)~ + @15 /* ~Now foreward to cleansing a mine! Whatever is down there, it won't stand a chance against us!~ */ DO ~SetGlobal("C#Grey_Capter2PID","LOCALS",1)~ + talkto_growl

/* chapter 3 */
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_3%) Global("C#Grey_Capter3PID","LOCALS",0)~ + @16 /* ~By the gods... Chasing the bandits, as if we don't have enough problems already... (sigh)~ */ DO ~SetGlobal("C#Grey_Capter3PID","LOCALS",1)~ + talkto_whine
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_3%) Global("C#Grey_Capter3PID","LOCALS",0)~ + @17 /* ~Alright! I guess going for the bandit camp means ending the bandit thread, which is a good thing, isn't it, Grey?~ */ DO ~SetGlobal("C#Grey_Capter3PID","LOCALS",1)~ + talkto_bark
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_3%) Global("C#Grey_Capter3PID","LOCALS",0)~ + @18 /* ~If the bandits won't come to us, we have to go to them. Isn't it? Beware, <CHARNAME> and Grey are coming!~ */ DO ~SetGlobal("C#Grey_Capter3PID","LOCALS",1)~ + talkto_growl

/* chapter 4 */
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_4%) Global("C#Grey_Capter4PID","LOCALS",0)~ + @19 /* ~(sigh) And of course there is another, 'next-step' evil overlord we have to go after. And no end in sight...~ */ DO ~SetGlobal("C#Grey_Capter4PID","LOCALS",1)~ + talkto_whine
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_4%) Global("C#Grey_Capter4PID","LOCALS",0)~ + @20 /* ~Now we are chasing another villain, and of course he is hiding in some forbidding place. Good I have you and your fine nose! Isn't it, Grey?~ */ DO ~SetGlobal("C#Grey_Capter4PID","LOCALS",1)~ + talkto_bark
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_4%) Global("C#Grey_Capter4PID","LOCALS",0)~ + @21 /* ~Whoever this "Davaeorn" might be, however mighty he thinks he is, we will get him! Eh, Grey?~ */DO ~SetGlobal("C#Grey_Capter4PID","LOCALS",1)~ + talkto_growl

/* chapter 5 */
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_5%) Global("C#Grey_Capter5PID","LOCALS",0)~ + @22 /* ~And now the one we are looking for is inside the biggest city around... Finding a needle inside a haystack is easier than this! (sigh)~ */ DO ~SetGlobal("C#Grey_Capter5PID","LOCALS",1)~ + talkto_whine
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_5%) Global("C#Grey_Capter5PID","LOCALS",0)~ + @23 /* ~Now it's up to the big city, Grey. We will go Baldur's Gate and find the bad boy! Won't we?~ */ DO ~SetGlobal("C#Grey_Capter5PID","LOCALS",1)~ + talkto_bark
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_5%) Global("C#Grey_Capter5PID","LOCALS",0)~ + @24 /* ~Baldur's Gate, beware! No-one will be hiding from us. Come on, Grey! Let's go and get 'em!~ */ DO ~SetGlobal("C#Grey_Capter5PID","LOCALS",1)~ + talkto_growl

/* chapter 6 */
/* before being arrested */
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_6%)
!Global("Arrested","GLOBAL",1) Global("C#Grey_Capter6PID1","LOCALS",0)~ + @25 /* ~(sigh) Well, let's see whether they'll open up the doors for us now, back in Candlekeep...~ */ DO ~SetGlobal("C#Grey_Capter6PID1","LOCALS",1)~ + talkto_whine
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_6%)
!Global("Arrested","GLOBAL",1) Global("C#Grey_Capter6PID1","LOCALS",0)~ + @26 /* ~Grey, imagine! It goes back home! We are going to Candlekeep!~ */ DO ~SetGlobal("C#Grey_Capter6PID1","LOCALS",1)~ + talkto_bark 
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_6%)
!Global("Arrested","GLOBAL",1) Global("C#Grey_Capter6PID1","LOCALS",0)~ + @27 /* ~We will find those culprits anywhere! They won't be able to hide. Not in Candlekeep! We know the place better than anyone!~ */ DO ~SetGlobal("C#Grey_Capter6PID1","LOCALS",1)~ + talkto_growl

/* after being arrested */
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_6%)
Global("Arrested","GLOBAL",1) Global("C#Grey_Capter6PID2","LOCALS",0)~ + @28 /* ~Look at us, Grey - inside the prison. (sigh)~ */ DO ~SetGlobal("C#Grey_Capter6PID2","LOCALS",1)~ + talkto_whine
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_6%)
Global("Arrested","GLOBAL",1) Global("C#Grey_Capter6PID2","LOCALS",0)~ + @29 /* ~Well... It can't go anywhere than up from here, eh, Grey?~ */ DO ~SetGlobal("C#Grey_Capter6PID2","LOCALS",1)~ + talkto_bark 
+ ~%BGT_VAR% Global("Chapter","GLOBAL",%tutu_chapter_6%)
Global("Arrested","GLOBAL",1) Global("C#Grey_Capter6PID2","LOCALS",0)~ + @30 /* ~Alright, this is enough. We will show them!~ */  DO ~SetGlobal("C#Grey_Capter6PID2","LOCALS",1)~ + talkto_growl

/* child of Bhaal */
+ ~Global("C#Grey_KnowBhaal","GLOBAL",1) Global("C#Grey_BhaalheritagePID","LOCALS",0)~ + @31 /* ~Can you imagine, Grey... *I* would be a child of Bhaal, god of murder! I am doomed... We are all doomed...~ */ DO ~SetGlobal("C#Grey_BhaalheritagePID","LOCALS",1)~ + talkto_whine 
+ ~Global("C#Grey_KnowBhaal","GLOBAL",1) Global("C#Grey_BhaalheritagePID","LOCALS",0)~ + @32 /* ~Phew, now, that's a knowledge... To be a child of Bhaal... Well, at least I guess I'll always have enough bones for you, eh, Grey?~ */ DO ~SetGlobal("C#Grey_BhaalheritagePID","LOCALS",1)~ + talkto_bark 
+ ~Global("C#Grey_KnowBhaal","GLOBAL",1) Global("C#Grey_BhaalheritagePID","LOCALS",0)~ + @33 /* ~A child of Bhaal! I have the power in me, Grey. I will rule the world, and you will help me conquer it! Are you ready?~ */ DO ~SetGlobal("C#Grey_BhaalheritagePID","LOCALS",1)~ + talkto_growl


/* SoD */

/* Korlasz's Crypt: OR(2) AreaCheck("bd0120") AreaCheck("bd0130") */
+ ~OR(2) AreaCheck("bd0120") AreaCheck("bd0130") Global("C#Grey_KorlaszCryptPID","LOCALS",0)~ + ~Here we are, Grey - still searching for followers of Sarevok. This takes way longer than I'd wish...~ DO ~SetGlobal("C#Grey_KorlaszCryptPID","LOCALS",1)~ + talkto_whine
+ ~OR(2) AreaCheck("bd0120") AreaCheck("bd0130") Global("C#Grey_KorlaszCryptPID","LOCALS",0)~ + ~So, Grey - Sarevok's last follower, eh? We are nearly done!~ DO ~SetGlobal("C#Grey_KorlaszCryptPID","LOCALS",1)~ + talkto_bark
+ ~OR(2) AreaCheck("bd0120") AreaCheck("bd0130") Global("C#Grey_KorlaszCryptPID","LOCALS",0)~ + ~Here we come, Grey - Sarevok's last minion. They better brace themselves - or not, they won't have a chance against us anyway!~ DO ~SetGlobal("C#Grey_KorlaszCryptPID","LOCALS",1)~ + talkto_growl

/* BG city full of refugees: GlobalGT("BD_PLOT","GLOBAL",50) GlobalLT("BD_PLOT","GLOBAL",55) */
+ ~%IT_IS_SOD% Global("Chapter","GLOBAL",7) GlobalGT("BD_PLOT","GLOBAL",50) 
GlobalLT("BD_PLOT","GLOBAL",55) Global("C#Grey_SoDBGCityPID","LOCALS",0)~ + ~All these people, Grey... Look at all the poor souls, having lost their homes, their loved ones...~ DO ~SetGlobal("C#Grey_SoDBGCityPID","LOCALS",1)~ + talkto_whine
+ ~%IT_IS_SOD% Global("Chapter","GLOBAL",7) GlobalGT("BD_PLOT","GLOBAL",50) 
GlobalLT("BD_PLOT","GLOBAL",55) Global("C#Grey_SoDBGCityPID","LOCALS",0)~ + ~So many refugees. We will help these poor people, Grey! We will!~ DO ~SetGlobal("C#Grey_SoDBGCityPID","LOCALS",1)~ + talkto_bark
+ ~%IT_IS_SOD% Global("Chapter","GLOBAL",7) GlobalGT("BD_PLOT","GLOBAL",50) 
GlobalLT("BD_PLOT","GLOBAL",55) Global("C#Grey_SoDBGCityPID","LOCALS",0)~ + ~Out of our way! There is too many people here, Grey, and that gives me bad temper. Very bad temper!~ DO ~SetGlobal("C#Grey_SoDBGCityPID","LOCALS",1)~ + talkto_growl


/* Chapter 8 */
/* general "we are on our way against the crusade" (Chapters 8,9,10) */
+ ~%IT_IS_SOD% OR(3) Global("Chapter","GLOBAL",8) Global("Chapter","GLOBAL",9) Global("Chapter","GLOBAL",10) Global("C#Grey_SoDMarchCrusadePID","LOCALS",0)~ + ~So, here we are, Grey, on our way against the crusade. Why me?... Why me.~ DO ~SetGlobal("C#Grey_SoDMarchCrusadePID","LOCALS",1)~ + talkto_whine
+ ~%IT_IS_SOD% OR(3) Global("Chapter","GLOBAL",8) Global("Chapter","GLOBAL",9) Global("Chapter","GLOBAL",10) Global("C#Grey_SoDMarchCrusadePID","LOCALS",0)~ + ~We'll face the crusade, Grey, eh? We will bring peace to the lands - once more!~ DO ~SetGlobal("C#Grey_SoDMarchCrusadePID","LOCALS",1)~ + talkto_bark
+ ~%IT_IS_SOD% OR(3) Global("Chapter","GLOBAL",8) Global("Chapter","GLOBAL",9) Global("Chapter","GLOBAL",10) Global("C#Grey_SoDMarchCrusadePID","LOCALS",0)~ + ~Those crusaders wished they'd never left their homes. We'll make them pay! We'll make them all pay!~ DO ~SetGlobal("C#Grey_SoDMarchCrusadePID","LOCALS",1)~ + talkto_growl


/* after Coastway Crossing Bridge is down: GlobalGT("bd_plot","global",169) GlobalLT("bd_plot","global",299) */
+ ~%IT_IS_SOD% GlobalGT("bd_plot","global",169) GlobalLT("bd_plot","global",299) Global("C#Grey_SoDBridgeDownPID","LOCALS",0)~ + ~The bridge is down... Everything gets more complicated. As always... (sigh)~ DO ~SetGlobal("C#Grey_SoDBridgeDownPID","LOCALS",1)~ + talkto_whine
+ ~%IT_IS_SOD% GlobalGT("bd_plot","global",169) GlobalLT("bd_plot","global",299) Global("C#Grey_SoDBridgeDownPID","LOCALS",0)~ + ~They destroyed the bridge, but we will not let ourselves be stopped by this obstacle, will we? No! We will find another way!~ DO ~SetGlobal("C#Grey_SoDBridgeDownPID","LOCALS",1)~ + talkto_bark
+ ~%IT_IS_SOD% GlobalGT("bd_plot","global",169) GlobalLT("bd_plot","global",299) Global("C#Grey_SoDBridgeDownPID","LOCALS",0)~ + ~They think they could stop me by taking down the bridge? What do they think we are - scared weaklings? There is no stopping me! They'll learn that soon enough!~ DO ~SetGlobal("C#Grey_SoDBridgeDownPID","LOCALS",1)~ + talkto_growl

/* Caelar - first meeting person to person: GlobalGT("bd_plot","global",169) GlobalLT("bd_plot","global",299) */
+ ~%IT_IS_SOD% GlobalGT("bd_plot","global",169) GlobalLT("bd_plot","global",299) Global("C#Grey_SoDCaelar1PID","LOCALS",0)~ + ~This Caelar surely is deluded... How am I supposed to stop this madwoman, Grey?...~ DO ~SetGlobal("C#Grey_SoDCaelar1PID","LOCALS",1)~ + talkto_whine
+ ~%IT_IS_SOD% GlobalGT("bd_plot","global",169) GlobalLT("bd_plot","global",299) Global("C#Grey_SoDCaelar1PID","LOCALS",0)~ + ~So, we met with Caelar herself. She's just a woman of flesh and blood, Grey, shining eyes or no. Just a woman of flesh and blood! We took down a lot of those before, no?~ DO ~SetGlobal("C#Grey_SoDCaelar1PID","LOCALS",1)~ + talkto_bark
+ ~%IT_IS_SOD% GlobalGT("bd_plot","global",169) GlobalLT("bd_plot","global",299) Global("C#Grey_SoDCaelar1PID","LOCALS",0)~ + ~"Shining Lady", pah! This woman better watch out, because we are coming to crush her! Crush her I say!~ DO ~SetGlobal("C#Grey_SoDCaelar1PID","LOCALS",1)~ + talkto_growl

/*



*/


/* BGII */

//+ ~%IT_IS_BG2% ##chapter BG2~ + ~Eh, Grey? We'll make our way, here in Amn!~ + talkto_bark


/* general (both BG1 and BG2)  */


+ ~RandomNum(3,1)~ + @78  /* ~It's all so complicated, Grey...~ */ + talkto_pcsad_01
+ ~RandomNum(3,2)~ + @78  /* ~It's all so complicated, Grey...~ */ + talkto_pcsad_02
+ ~RandomNum(3,3)~ + @78  /* ~It's all so complicated, Grey...~ */ + talkto_pcsad_03

+ ~RandomNum(3,1)~ + @79 /* ~Why me, Grey? Why me...~ */ + talkto_pcsad_01
+ ~RandomNum(3,2)~ + @79 /* ~Why me, Grey? Why me...~ */ + talkto_pcsad_02
+ ~RandomNum(3,3)~ + @79 /* ~Why me, Grey? Why me...~ */ + talkto_pcsad_03

+ ~RandomNum(3,1)~ + @80 /* ~It could be worse, Grey, eh, you hairy brute?~ */ + talkto_pcok_01
+ ~RandomNum(3,2)~ + @80 /* ~It could be worse, Grey, eh, you hairy brute?~ */ + talkto_pcok_02
+ ~RandomNum(3,3)~ + @80 /* ~It could be worse, Grey, eh, you hairy brute?~ */ + talkto_pcok_03

+ ~RandomNum(3,1)~ + @81 /* ~I think we are doing quite well, what do you say?~ */ + talkto_pcok_01
+ ~RandomNum(3,2)~ + @81 /* ~I think we are doing quite well, what do you say?~ */ + talkto_pcok_02
+ ~RandomNum(3,3)~ + @81 /* ~I think we are doing quite well, what do you say?~ */ + talkto_pcok_03

+ ~RandomNum(3,1)~ + @82 /* ~We'll show them, Grey. We'll show them all!~ */ + talkto_pcenergetic_01
+ ~RandomNum(3,2)~ + @82 /* ~We'll show them, Grey. We'll show them all!~ */ + talkto_pcenergetic_02
+ ~RandomNum(3,3)~ + @82 /* ~We'll show them, Grey. We'll show them all!~ */ + talkto_pcenergetic_03

+ ~RandomNum(3,1)~ + @83 /* ~Let's go and find those culprits! No one can stop us! No one!~ */ + talkto_pcenergetic_01
+ ~RandomNum(3,2)~ + @83 /* ~Let's go and find those culprits! No one can stop us! No one!~ */ + talkto_pcenergetic_02
+ ~RandomNum(3,3)~ + @83 /* ~Let's go and find those culprits! No one can stop us! No one!~ */ + talkto_pcenergetic_03
END


IF ~~ THEN find_brage 
SAY @8 /* ~Woof!~ */
IF ~~ THEN DO ~EraseJournalEntry(@100001)
SetGlobal("C#Grey_Brage","GLOBAL",4) 
ClearAllActions()
StartCutSceneMode() 
StartCutScene("C#GrCut2")~ EXIT
END

IF ~~ THEN sod_statues
SAY @8 /* ~Woof!~ */
IF ~~ THEN DO ~SetGlobal("C#Grey_SoD_statues","GLOBAL",2) 
ClearAllActions()
StartCutSceneMode() 
StartCutScene("c#grcus1")~ EXIT
END

/* whine */
IF ~~ THEN talkto_pcsad_01
SAY @34 /* ~(Grey gives your hand a sympathetic shove with his snout.)~ */
IF ~~ THEN + talkto_whine
END

IF ~~ THEN talkto_pcsad_02
SAY @35 /* ~(Grey gives your hand a quick licking.)~ */
IF ~~ THEN + talkto_whine
END

IF ~~ THEN talkto_pcsad_03
SAY @36 /* ~(Grey's eyes are still focussing you, with a long, comprehensive look.)~ */
IF ~~ THEN + talkto_whine
END

IF ~~ THEN talkto_whine
SAY @37 /* ~(whines sympathetically)~ [C#Grey07] */
IF ~~ THEN EXIT
END

/* bark */
IF ~~ THEN talkto_pcok_01
SAY @38 /* ~(Grey waggs his tail enthousiastically.)~ */
IF ~~ THEN + talkto_bark
END

IF ~~ THEN talkto_pcok_02
SAY @39  /* ~(Grey straightens up on his four legs.)~ */
IF ~~ THEN + talkto_bark
END

IF ~~ THEN talkto_pcok_03
SAY @40 /* ~(Grey gives you a happy look.)~ */
IF ~~ THEN + talkto_bark
END

IF ~~ THEN talkto_bark
SAY @8 /* ~Woof!~ */ 
IF ~~ THEN EXIT
END

/* growl */
IF ~~ THEN talkto_pcenergetic_01
SAY @41 /* ~(Grey snapps at an imaginary prey.)~ */
IF ~~ THEN + talkto_growl
END

IF ~~ THEN talkto_pcenergetic_02
SAY @42 /* ~(Grey bares his teeth theatrically.)~ */
IF ~~ THEN + talkto_growl
END

IF ~~ THEN talkto_pcenergetic_03
SAY @43 /* ~(Excitedly, Grey growls at imaginary enemies.)~ */
IF ~~ THEN + talkto_growl
END

IF ~~ THEN talkto_growl
SAY @44 /* ~(growls affirmatively)~  [C#Grey12] */
IF ~~ THEN EXIT
END



IF ~~ THEN stick_play
SAY @45 /* ~(Now that you have the stick you...)~ */
+ ~RandomNum(6,1)~ + @46 /* ~(...throw it for Grey to catch.)~ */ + stick_catch_01
+ ~RandomNum(6,2)~ + @46 /* ~(...throw it for Grey to catch.)~ */ + stick_catch_02
+ ~RandomNum(6,3)~ + @46 /* ~(...throw it for Grey to catch.)~ */ + stick_catch_02
+ ~RandomNum(6,4)~ + @46 /* ~(...throw it for Grey to catch.)~ */ + stick_catch_03
+ ~RandomNum(6,5)~ + @46 /* ~(...throw it for Grey to catch.)~ */ + stick_catch_03
+ ~RandomNum(6,6)~ + @46 /* ~(...throw it for Grey to catch.)~ */ + stick_catch_03
+ ~RandomNum(5,1)~ + @47 /*  ~(...hold it high for Grey to jump.)~ */ + stick_jump_01
+ ~RandomNum(5,2)~ + @47 /*  ~(...hold it high for Grey to jump.)~ */ + stick_jump_02
+ ~RandomNum(5,3)~ + @47 /*  ~(...hold it high for Grey to jump.)~ */ + stick_jump_02
+ ~RandomNum(5,4)~ + @47 /*  ~(...hold it high for Grey to jump.)~ */ + stick_jump_03
+ ~RandomNum(5,5)~ + @47 /*  ~(...hold it high for Grey to jump.)~ */ + stick_jump_03
+ ~RandomNum(5,1)~ + @48 /* ~(...pretend to throw it but keep it in your hands.)~ */ + stick_pretend_01
+ ~RandomNum(5,2)~ + @48 /* ~(...pretend to throw it but keep it in your hands.)~ */ + stick_pretend_02
+ ~RandomNum(5,3)~ + @48 /* ~(...pretend to throw it but keep it in your hands.)~ */ + stick_pretend_03
+ ~RandomNum(5,4)~ + @48 /* ~(...pretend to throw it but keep it in your hands.)~ */ + stick_pretend_03
+ ~RandomNum(5,5)~ + @48 /* ~(...pretend to throw it but keep it in your hands.)~ */ + stick_pretend_04
++ @49 /* ~(...let it drop back on the ground.) No time to play right now, boy. Sorry!~ */ EXIT
END

IF ~~ THEN stick_catch_01
SAY @50 /* ~(Grey looks at you without moving. He doesn't seem to be in the mood for playing right now.)~ */
IF ~~ THEN EXIT
END

IF ~~ THEN stick_catch_02
SAY @51 /* ~(Grey speeds to catch the stick, then he strolls away to chew on it.)~ */
IF ~~ THEN DO ~RunAwayFrom(PLayer1,5)~ EXIT
END

IF ~~ THEN stick_catch_03
SAY @52 /* ~(Grey gets the stick and brings it back to you.)~ */
IF ~~ THEN + stick_play
END

IF ~~ THEN stick_jump_01
SAY @53 /* ~(Grey is a Wolfhound, standing about a metre high at the shoulder and being about 7 feet tall standing on hind legs. He easily plucks the stick out of your raised hands while putting his legs on your shoulders, ignoring your yells, leaving a trace of slobber in your face.)~ */
IF ~~ THEN EXIT
END

IF ~~ THEN stick_jump_02
SAY @54 /* ~(You succeed in moving the stick away in time before Grey can reach it.)~ */
IF ~~ THEN + stick_play
END

IF ~~ THEN stick_jump_03
SAY @55 /* ~(Grey is a Wolfhound, standing about a metre high at the shoulder and being about 7 feet tall standing on hind legs. He doesn't have to "jump". He gets on his hinded legs lazively and plucks the stick out of your hands.)~ */
IF ~~ THEN EXIT
END

IF ~~ THEN stick_pretend_01
SAY @56 /* ~(Grey speeds into the pretended throwing direction but notices his error and returns back to you.)~ */
IF ~~ THEN + stick_play
END

IF ~~ THEN stick_pretend_02
SAY @57 /* ~(Grey speeds into the pretended throwing direction but notices his error and comes to a halt, turning his head to you.)~ */
IF ~~ THEN + stick_play
END

IF ~~ THEN stick_pretend_03
SAY @58 /* ~(Grey didn't stop watching the stick so he isn't fooled.) Woof!~ */
IF ~~ THEN + stick_play
END

IF ~~ THEN stick_pretend_04
SAY @59 /* ~(Grey speeds into the pretended throwing direction, but then he strolls off, pretending to be interested in something else.)~ */
IF ~~ THEN DO ~RunAwayFrom(PLayer1,5)~ EXIT
END

//------------

IF ~~ THEN ruffle
SAY @60 /* ~(Grey stands next to you, wagging his tail.)~ */
+ ~RandomNum(5,1)~ + @61 /* ~(You pet his head.) Good boy!~ */ + ruffle_head_01
+ ~RandomNum(5,2)~ + @61 /* ~(You pet his head.) Good boy!~ */ + ruffle_head_01
+ ~RandomNum(5,3)~ + @61 /* ~(You pet his head.) Good boy!~ */ + ruffle_head_02
+ ~RandomNum(5,4)~ + @61 /* ~(You pet his head.) Good boy!~ */ + ruffle_head_02
+ ~RandomNum(5,5)~ + @61 /* ~(You pet his head.) Good boy!~ */ + ruffle_head_03
+ ~RandomNum(5,1)~ + @62 /* ~(You pet his shoulders and back, tapping and ruffling gently his furr.)~ */ + ruffle_shoulders_01
+ ~RandomNum(5,2)~ + @62 /* ~(You pet his shoulders and back, tapping and ruffling gently his furr.)~ */ + ruffle_shoulders_01
+ ~RandomNum(5,3)~ + @62 /* ~(You pet his shoulders and back, tapping and ruffling gently his furr.)~ */ + ruffle_shoulders_01
+ ~RandomNum(5,4)~ + @62 /* ~(You pet his shoulders and back, tapping and ruffling gently his furr.)~ */ + ruffle_shoulders_02
+ ~RandomNum(5,5)~ + @62 /* ~(You pet his shoulders and back, tapping and ruffling gently his furr.)~ */ + ruffle_shoulders_03
+ ~RandomNum(3,1)~ + @63 /* ~(You take his jaw into your palm, looking into his eyes.) You'r a good boy there, Grey!~ */ + ruffle_jaw_01
+ ~RandomNum(3,2)~ + @63 /* ~(You take his jaw into your palm, looking into his eyes.) You'r a good boy there, Grey!~ */ + ruffle_jaw_02
+ ~RandomNum(3,3)~ + @63 /* ~(You take his jaw into your palm, looking into his eyes.) You'r a good boy there, Grey!~ */ + ruffle_jaw_03
+ ~RandomNum(4,1)~ + @64 /* ~(You playfully tear his tail.) Got you!~ */ + ruffle_tail_01
+ ~RandomNum(4,2)~ + @64 /* ~(You playfully tear his tail.) Got you!~ */ + ruffle_tail_01
+ ~RandomNum(4,3)~ + @64 /* ~(You playfully tear his tail.) Got you!~ */ + ruffle_tail_02
+ ~RandomNum(4,4)~ + @64 /* ~(You playfully tear his tail.) Got you!~ */ + ruffle_tail_03
++ @65 /* ~Sorry, better not now, boy!~ */ EXIT
END

IF ~~ THEN ruffle_head_01
SAY @66 /* ~(Grey looks at you, wagging his tail.)~ */
IF ~~ THEN EXIT
END

IF ~~ THEN ruffle_head_02
SAY @67 /* ~(Grey turns his head to lick your hand.)~ */
IF ~~ THEN EXIT
END

IF ~~ THEN ruffle_head_03
SAY @68 /* ~(Grey doesn't seem to pay much attention.)~ */
IF ~~ THEN EXIT
END

IF ~~ THEN ruffle_shoulders_01
SAY @69 /* ~(Grey stands still, enjoying the massage.)~ */
IF ~~ THEN EXIT
END

IF ~~ THEN ruffle_shoulders_02
SAY @70 /* ~(Grey holds still, but he doesn't seem to pay much attention, being more interested in something on the floor.)~ */
IF ~~ THEN EXIT
END

IF ~~ THEN ruffle_shoulders_03
SAY @71 /* ~(Grey is too impatient to hold still. He turns to lick your hand and strolls off.)~ */
IF ~~ THEN EXIT
END

IF ~~ THEN ruffle_jaw_01
SAY @72 /* ~(Grey answers with a friendly growl.)~ */
IF ~~ THEN EXIT
END

IF ~~ THEN ruffle_jaw_02
SAY @73 /* ~(Grey tries to lick you, blowing his breath into your face.)~ */
IF ~~ THEN EXIT
END

IF ~~ THEN ruffle_jaw_03
SAY @74 /* ~(Grey looks straight into your eyes, giving you all his attention.)~ */
IF ~~ THEN EXIT
END

IF ~~ THEN ruffle_tail_01
SAY @75 /* ~(Grey snaps playful at your hand.) Woof!~ */
IF ~~ THEN EXIT
END

IF ~~ THEN ruffle_tail_02
SAY @76 /* ~(Grey looks at you, somehow perplexed.)~ */
IF ~~ THEN EXIT
END

IF ~~ THEN ruffle_tail_03
SAY @77 /* ~(Grey turns and *jumps* at you. You pay for the teasing with a slobbery face.)~ */
IF ~~ THEN EXIT
END

//--------------

END //APPEND