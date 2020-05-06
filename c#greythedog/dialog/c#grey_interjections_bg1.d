/* doppelgangers in Durlag's tower?... 

These are higher forms of doppelgangers (Grey cannot smell these):

DOPDUR1.dlg, DOPDUR2.dlg, DOPDUR3.dlg, rashad.dlg

also in Duchal Palace: all greater doppelgangers.

*/


/* shortly after joining: Jondalar and Erik come to look for Grey */

/* Candlekeep: Gatekeeper */

I_C_T ~%tutu_var%KEEPER~ 2 C#Grey_KEEPER_2
== ~%tutu_var%KEEPER~ IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @1 /* ~At least Grey is with you, just as Jondalar suspected. In case they haven't found you yet, Jondalar and Erik are searching for the dog, but they didn't sound too frantic about it. I'll let them know the dog is with you when they'll return from their hunting trip.~ */
END


BEGIN C#GrJond
BEGIN C#GrErik

CHAIN
IF WEIGHT #-1
~Global("C#Grey_GreyJondalar","GLOBAL",1)~ THEN C#GrJond greyatgate_02
@2 DO ~SetGlobal("C#Grey_GreyJondalar","GLOBAL",2)~
== C#GrJond IF ~InParty("%IMOEN_DV%") Detect("%IMOEN_DV%")~ THEN @3
== C#GrErik IF ~InMyArea("C#GrErik") Detect("C#GrErik") !StateCheck("C#GrErik",CD_STATE_NOTVALID)~ THEN @4
== C#GrJond @5
END
++ @6 + jondalar_01
++ @7 + jondalar_02
++ @8 + jondalar_01

APPEND C#GrJond

IF ~~ THEN jondalar_01
SAY @9
IF ~~ THEN + jondalar_03
END

IF ~~ THEN jondalar_02
SAY @10
IF ~~ THEN + jondalar_01
END

IF ~~ THEN jondalar_03
SAY @11
= @12
++ @13 + jondalar_05
++ @14 + jondalar_05
++ @15 + jondalar_06
++ @16 + jondalar_04
END

IF ~~ THEN jondalar_04
SAY @17
IF ~~ THEN + jondalar_06
END

IF ~~ THEN jondalar_05
SAY @18
IF ~~ THEN + jondalar_06
END

END //APPEND

CHAIN
IF ~~ THEN C#GrJond jondalar_06
@19
== C#GrJond IF ~Gender(Player1,MALE)~ THEN @20
== C#GrJond IF ~Gender(Player1,FEMALE)~ THEN @21
== C#GrErik IF ~InMyArea("C#GrErik") Detect("C#GrErik") !StateCheck("C#GrErik",CD_STATE_NOTVALID)~ THEN @22
== C#GrJond @23
== C#GrErik IF ~InMyArea("C#GrErik") Detect("C#GrErik") !StateCheck("C#GrErik",CD_STATE_NOTVALID)~ THEN @24
= @25
== C#GrJond @26
END
++ @27 + jondalar_08
++ @28 + jondalar_07
++ @29 + jondalar_09

APPEND C#GrJond

IF ~~ THEN jondalar_07
SAY @30
IF ~~ THEN + jondalar_08
END

IF ~~ THEN jondalar_08
SAY @31
IF ~~ THEN DO ~EraseJournalEntry(@100008)~ SOLVED_JOURNAL @100009 + jondalar_11
END

IF ~~ THEN jondalar_09
SAY @32
++ @33 + jondalar_10
++ @34 + jondalar_08
END

IF ~~ THEN jondalar_10
SAY @35
IF ~~ THEN DO ~SetGlobal("C#Grey_GreyJondalar","GLOBAL",3)
ActionOverride("C#GREY",ChangeAIScript("",DEFAULT))
ActionOverride("C#GREY",SetGlobal("C#GreyJoined","GLOBAL",0))
ActionOverride("C#Grey",ChangeAIScript("",DEFAULT))
ActionOverride("C#GREY",LeaveParty())
ActionOverride("C#GREY",EscapeArea())
ActionOverride("C#GrErik",EscapeArea())
EraseJournalEntry(@100008)
EscapeArea()~ SOLVED_JOURNAL @100010 EXIT
END

END //APPEND


CHAIN
IF ~~ THEN C#GrJond jondalar_11
@36
== C#GREYJ @37
== C#GrJond @38
END
IF ~~ THEN + jondalar_12

APPEND C#GrJond

IF ~~ THEN jondalar_12
SAY @39
IF ~~ THEN DO ~ActionOverride("C#GrErik",EscapeArea())
EscapeArea()~ EXIT
END

END //APPEND











/* I_C_T and other additions */


/* BG1 */

ADD_TRANS_ACTION ~%tutu_var%TAEROM~ BEGIN 1 END BEGIN END ~IncrementGlobal("C#Grey_TaeromArmorCheck","GLOBAL",1)~

ADD_TRANS_ACTION ~%tutu_var%TAEROM~ BEGIN 5 END BEGIN END ~IncrementGlobal("C#Grey_TaeromArmorCheck","GLOBAL",1)~

ADD_TRANS_ACTION ~%tutu_var%TAEROM~ BEGIN 9 END BEGIN END ~IncrementGlobal("C#Grey_TaeromArmorCheck","GLOBAL",1)~

/* Beregost: Thunderhammer Smithy. Armor for Grey! */
EXTEND_BOTTOM ~%tutu_var%TAEROM~ 0
+ ~Global("C#Grey_TaeromTeeth","GLOBAL",2) PartyHasItem("C#GrTo#1") PartyGoldGT(2999) !Global("C#Grey_TaeromArmor","GLOBAL",2)~ + @40 + weapon_offer_02
+ ~Global("C#Grey_TaeromTeeth","GLOBAL",2) PartyHasItem("C#GrTo#1") PartyGoldGT(2999) Global("C#Grey_TaeromArmor","GLOBAL",2)~ + @40 + wardog_armor_03_d
+ ~GlobalGT("C#Grey_TaeromArmorCheck","GLOBAL",0) Global("C#Grey_TaeromArmor","GLOBAL",0)~ + @41 DO ~SetGlobal("C#Grey_TaeromArmor","GLOBAL",1)~ + wardog_armor
+ ~!Global("C#Grey_TaeromTeeth","GLOBAL",3) PartyHasItem("%tutu_var%MISC12") PartyGoldGT(3999) Global("C#Grey_TaeromArmor","GLOBAL",1)~ + @42 + wardog_armor_01
+ ~Global("C#Grey_TaeromTeeth","GLOBAL",3) PartyHasItem("%tutu_var%MISC12") PartyGoldGT(3999) Global("C#Grey_TaeromArmor","GLOBAL",1)~ + @42 + wardog_armor_03_c
END

EXTEND_BOTTOM ~%tutu_var%TAEROM~ 4
+ ~Global("C#Grey_TaeromTeeth","GLOBAL",2) PartyHasItem("C#GrTo#1") PartyGoldGT(2999) !Global("C#Grey_TaeromArmor","GLOBAL",2)~ + @40 + weapon_offer_02
+ ~Global("C#Grey_TaeromTeeth","GLOBAL",2) PartyHasItem("C#GrTo#1") PartyGoldGT(2999) Global("C#Grey_TaeromArmor","GLOBAL",2)~ + @40 + wardog_armor_03_b
+ ~GlobalGT("C#Grey_TaeromArmorCheck","GLOBAL",1) Global("C#Grey_TaeromArmor","GLOBAL",0)~ + @41 DO ~SetGlobal("C#Grey_TaeromArmor","GLOBAL",1)~ + wardog_armor
+ ~!Global("C#Grey_TaeromTeeth","GLOBAL",3) PartyHasItem("%tutu_var%MISC12") PartyGoldGT(3999) Global("C#Grey_TaeromArmor","GLOBAL",1)~ + @42 + wardog_armor_01
+ ~Global("C#Grey_TaeromTeeth","GLOBAL",3) PartyHasItem("%tutu_var%MISC12") PartyGoldGT(3999) Global("C#Grey_TaeromArmor","GLOBAL",1)~ + @42 + wardog_armor_03
END

EXTEND_BOTTOM ~%tutu_var%TAEROM~ 12
+ ~Global("C#Grey_TaeromTeeth","GLOBAL",2) PartyHasItem("C#GrTo#1") PartyGoldGT(2999) !Global("C#Grey_TaeromArmor","GLOBAL",2)~ + @40 + weapon_offer_02
+ ~Global("C#Grey_TaeromTeeth","GLOBAL",2) PartyHasItem("C#GrTo#1") PartyGoldGT(2999) Global("C#Grey_TaeromArmor","GLOBAL",2)~ + @40 + wardog_armor_03_b
+ ~GlobalGT("C#Grey_TaeromArmorCheck","GLOBAL",1) Global("C#Grey_TaeromArmor","GLOBAL",0)~ + @41 DO ~SetGlobal("C#Grey_TaeromArmor","GLOBAL",1)~ + wardog_armor
+ ~!Global("C#Grey_TaeromTeeth","GLOBAL",3) PartyHasItem("%tutu_var%MISC12") PartyGoldGT(3999) Global("C#Grey_TaeromArmor","GLOBAL",1)~ + @42 + wardog_armor_01
+ ~Global("C#Grey_TaeromTeeth","GLOBAL",3) PartyHasItem("%tutu_var%MISC12") PartyGoldGT(3999) Global("C#Grey_TaeromArmor","GLOBAL",1)~ + @42 + wardog_armor_03
END

EXTEND_BOTTOM ~%tutu_var%TAEROM~ 14
+ ~Global("C#Grey_TaeromTeeth","GLOBAL",2) PartyHasItem("C#GrTo#1") PartyGoldGT(2999) !Global("C#Grey_TaeromArmor","GLOBAL",2)~ + @40 + weapon_offer_02
+ ~Global("C#Grey_TaeromTeeth","GLOBAL",2) PartyHasItem("C#GrTo#1") PartyGoldGT(2999) Global("C#Grey_TaeromArmor","GLOBAL",2)~ + @40 + wardog_armor_03_b
+ ~GlobalGT("C#Grey_TaeromArmorCheck","GLOBAL",0) Global("C#Grey_TaeromArmor","GLOBAL",0)~ + @41 DO ~SetGlobal("C#Grey_TaeromArmor","GLOBAL",1)~ + wardog_armor
+ ~!Global("C#Grey_TaeromTeeth","GLOBAL",3) PartyHasItem("%tutu_var%MISC12") PartyGoldGT(3999) Global("C#Grey_TaeromArmor","GLOBAL",1)~ + @42 + wardog_armor_01
+ ~Global("C#Grey_TaeromTeeth","GLOBAL",3) PartyHasItem("%tutu_var%MISC12") PartyGoldGT(3999) Global("C#Grey_TaeromArmor","GLOBAL",1)~ + @42 + wardog_armor_03
END

APPEND ~%tutu_var%TAEROM~

IF WEIGHT #-1
~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
See("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID) 
Global("C#Grey_TaeromTeeth","GLOBAL",0)~ THEN weapon_offer
SAY @43
IF ~~ THEN DO ~SetGlobal("C#Grey_TaeromTeeth","GLOBAL",1)~ UNSOLVED_JOURNAL @100003 EXIT
END

IF WEIGHT #-1
~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) See("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID) 
Global("C#Grey_TaeromTeeth","GLOBAL",1)
PartyHasItem("C#GrTo#1")
!Global("MakeArmor","GLOBAL",1)~ THEN weapon_offer_01
SAY @44
+ ~PartyGoldGT(2999)~ + @45 + weapon_offer_02
+ ~PartyGoldLT(3000)~ + @46 + weapon_offer_04
++ @47 + weapon_offer_05
++ @48 + weapon_offer_04
END

IF ~~ THEN wardog_armor_02_b
SAY @56
COPY_TRANS ~%tutu_var%TAEROM~ 0
END

IF ~~ THEN wardog_armor_03_c
SAY @57
IF ~~ THEN + wardog_armor_02
END

IF ~~ THEN wardog_armor_03_d
SAY @58
IF ~~ THEN + wardog_armor_02
END


IF ~~ THEN weapon_offer_02
SAY @49
  IF ~~ THEN DO ~TakePartyGold(3000)
TakePartyItem("C#GrTo#1")
DestroyItem("C#GrTo#1")
SetGlobal("C#Grey_TaeromTeeth","GLOBAL",3)
EraseJournalEntry(@100003)
SetGlobalTimer("C#Grey_TaeromTimer","GLOBAL",FIVE_DAYS)~ UNSOLVED_JOURNAL @100004 EXIT
END

IF WEIGHT #-1
~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) See("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID) 
Global("C#Grey_TaeromTeeth","GLOBAL",3)
GlobalTimerExpired("C#Grey_TaeromTimer","GLOBAL")~ THEN weapon_offer_03
SAY @50
 IF ~~ THEN DO ~GiveItemCreate("C#GrToo1",LastTalkedToBy,0,0,0)
SetGlobal("C#Grey_TaeromTeeth","GLOBAL",4)
EraseJournalEntry(@100004)~ SOLVED_JOURNAL @100005 EXIT
END

IF ~~ THEN weapon_offer_04
SAY @51
IF ~~ THEN DO ~SetGlobal("C#Grey_TaeromTeeth","GLOBAL",2)~ EXIT
END

IF ~~ THEN weapon_offer_05
SAY @52
+ ~PartyGoldGT(2999) !Global("C#Grey_TaeromArmor","GLOBAL",2)~ + @45 + weapon_offer_02
+ ~PartyGoldLT(3000)~ + @46 + weapon_offer_04
++ @48 + weapon_offer_04
END

IF ~~ THEN wardog_armor
SAY @53 
+ ~!Global("C#Grey_TaeromTeeth","GLOBAL",3) PartyHasItem("MISC12") PartyGoldGT(3999)~ + @42 + wardog_armor_01
+ ~Global("C#Grey_TaeromTeeth","GLOBAL",3) PartyHasItem("MISC12") PartyGoldGT(3999)~ + @42 + wardog_armor_03
++ @54 + wardog_armor_02
END



IF ~~ THEN wardog_armor_01
SAY @55
IF ~~ THEN DO ~TakePartyGold(4000)
TakePartyItem("MISC12")
DestroyItem("MISC12")
SetGlobal("C#Grey_TaeromArmor","GLOBAL",2)
SetGlobalTimer("C#Grey_TaeromTimer","GLOBAL",TEN_DAYS)~ UNSOLVED_JOURNAL @100006 EXIT
END

IF ~~ THEN wardog_armor_02
SAY @56
COPY_TRANS ~%tutu_var%TAEROM~ 14
END

IF ~~ THEN wardog_armor_03
SAY @57
IF ~~ THEN + wardog_armor_02
END

IF ~~ THEN wardog_armor_03_b
SAY @58
IF ~~ THEN + wardog_armor_02
END

IF WEIGHT #-1
~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
See("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID) 
Global("C#Grey_TaeromArmor","GLOBAL",2)
GlobalTimerExpired("C#Grey_TaeromTimer","GLOBAL")~ THEN wardog_armor_04
SAY @59
 IF ~~ THEN DO ~GiveItemCreate("C#Grarm5",LastTalkedToBy,0,0,0)
SetGlobal("C#Grey_TaeromArmor","GLOBAL",3)
EraseJournalEntry(@100006)~ SOLVED_JOURNAL @100007 EXIT
END

END //APPEND Taerom



/* GREY in BG1, Nashkell, die Verwechslung mit dem Bountyhunter */

INTERJECT ~%tutu_var%OUBLEK~ 0 C#GreyOublek0
== C#GreyJ IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @60
END
++ @61 EXTERN ~%tutu_var%OUBLEK~ grey_ict
++ @62 EXTERN ~%tutu_var%OUBLEK~ grey_ict 
++ @63 EXTERN ~%tutu_var%OUBLEK~ grey_ict

APPEND ~%tutu_var%OUBLEK~

IF ~~ THEN grey_ict
SAY @64
COPY_TRANS ~%tutu_var%OUBLEK~ 0
END

END //APPEND

/* Nashkell: find Brage */


/* Bardolan, falls von JAP oder bg1re wieder eingefügt */


/*
~Fragt Severin in den Baracken. Ich bin sicher, dass er Euch einen perönlichen Gegenstand geben kann. Viel Glück!~
~Bringt sie zurück zu Severin.~
~Verdammt! Nun, es ist vielleicht auch zu viel verlangt, nach all' den Tagen.

*/

APPEND ~%tutu_var%BARDOL~
IF WEIGHT #-1
~NumTimesTalkedToGT(0)
!Global("OublekBounty1","GLOBAL",1) GlobalLT("C#Grey_Brage","GLOBAL",3) 
OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)
Global("C#Grey_SniffOurBrage","LOCALS",0)~ THEN sniffout
SAY @65
IF ~~ THEN DO ~SetGlobal("C#Grey_SniffOurBrage","LOCALS",1)~ EXIT
END

IF WEIGHT #-1
~NumTimesTalkedToGT(0)
!Global("OublekBounty1","GLOBAL",1) !GlobalLT("C#Grey_Brage","GLOBAL",3) 
OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)
GlobalLT("C#Grey_SniffOurBrage","LOCALS",2)~ THEN sniffout
SAY @66
IF ~~ THEN DO ~SetGlobal("C#Grey_SniffOurBrage","LOCALS",2)~ EXIT
END

END //APPEND

/* Severin in Nashkel Garrison ("Find Brage") */

/* Global("BrageRiddle","GLOBAL",2): Brage is in temple

Global("BrageRiddle","GLOBAL",3): Brage is enemy (and probably dead)

crossmod Brage's Redemption (former bgqe quest): 
Global("BrageRiddle","GLOBAL",5) Brage is in prison

~GlobalGT("C#Q13_BragesSwordQuest","GLOBAL",3) !Global("C#q13Brage_NalinVouch","GLOBAL",4)~: Brage was found innocent

~GlobalGT("C#Q13_BragesSwordQuest","GLOBAL",3) Global("C#q13Brage_NalinVouch","GLOBAL",4)~: Brage was found guilty



*/



BEGIN C#GrAmni

IF ~!Global("OublekBounty1","GLOBAL",1) GlobalLT("C#Grey_Brage","GLOBAL",3)~ THEN amnis
SAY @67
+ ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
!StateCheck("C#Grey",CD_STATE_NOTVALID)~ + @68 + amnis_04
+ ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
!StateCheck("C#Grey",CD_STATE_NOTVALID)~ + @69 EXIT
IF ~!Global("C#GreyJoined","GLOBAL",2)
OR(2) !InParty("C#Grey")
StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN EXIT
END

IF ~!Global("OublekBounty1","GLOBAL",1)
OR(2)
Global("C#Grey_Brage","GLOBAL",3)
Global("C#Grey_Brage","GLOBAL",4)~ THEN amnis_01
SAY @70
IF ~~ THEN EXIT
END

CHAIN
IF ~Global("OublekBounty1","GLOBAL",1) GlobalLT("C#Grey_Brage","GLOBAL",5)~ THEN C#GrAmni amnis_02
@71 DO ~SetGlobal("C#Grey_Brage","GLOBAL",5)~
== C#GrAmni IF ~Dead("BRAGE") PartyHasItem("c#grbrbr")~ THEN @72
== C#GrAmni IF ~!Dead("BRAGE")~ THEN @73
==  C#GrAmni IF ~OR(2)
Global("C#q13Brage_NalinVouch","GLOBAL",0) 
Global("C#q13Brage_NalinVouch","GLOBAL",4)~ THEN @74
END
IF ~~ THEN EXIT
IF ~GlobalGT("C#q13Brage_NalinVouch","GLOBAL",1) !Global("C#q13Brage_NalinVouch","GLOBAL",4)~ THEN + amnis_03


CHAIN
IF ~Global("C#Grey_Brage","GLOBAL",5)
GlobalGT("C#q13Brage_NalinVouch","GLOBAL",1) !Global("C#q13Brage_NalinVouch","GLOBAL",4)~ THEN C#GrAmni amnis_03
@75
END
++ @76 + amnis_05_a
+ ~PartyHasItem("SW2H03") 
OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
See("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)
!GlobalGT("C#Q13_BragesSwordQuest","GLOBAL",3)~ + @77 + amnis_05
+ ~!GlobalGT("C#Q13_BragesSwordQuest","GLOBAL",3)~ + @78 + amnis_06
++ @79 EXIT

APPEND C#GrAmni


IF ~~ THEN amnis_04
SAY @80
= @81
IF ~~ THEN DO ~GiveItemCreate("C#Grbrbr",LastTalkedToBy,0,0,0) SetGlobal("C#Grey_Brage","GLOBAL",3)~ UNSOLVED_JOURNAL @100001 EXIT
END

IF ~~ THEN amnis_05
SAY @82
++ @78 + amnis_06
++ @79 EXIT
END

END //APPEND

CHAIN
IF ~~ THEN C#GrAmni amnis_05_a
@83
== C#GrAmni IF ~OR(2)
GlobalGT("Chapter","GLOBAL",%tutu_chapter_3%)
GlobalGT("C#Q13_BragesSwordQuest","GLOBAL",3)~ THEN @84
== C#GrAmni IF ~OR(2)
GlobalGT("Chapter","GLOBAL",%tutu_chapter_3%)
GlobalGT("C#Q13_BragesSwordQuest","GLOBAL",3)~ THEN @85
END 
IF ~OR(2)
GlobalGT("Chapter","GLOBAL",%tutu_chapter_3%)
GlobalGT("C#Q13_BragesSwordQuest","GLOBAL",3)~ THEN DO ~SetGlobal("C#Grey_Brage","GLOBAL",6) EscapeArea()~ EXIT
+ ~GlobalLT("Chapter","GLOBAL",%tutu_chapter_4%)
 !GlobalGT("C#Q13_BragesSwordQuest","GLOBAL",3)~ + @78 + amnis_06
+ ~GlobalLT("Chapter","GLOBAL",%tutu_chapter_4%)
 !GlobalGT("C#Q13_BragesSwordQuest","GLOBAL",3)~ + @79 EXIT




CHAIN
IF ~~ THEN C#GrAmni amnis_06
@86
== C#GrAmni IF ~GlobalGT("C#LC_BardolanMoves","GLOBAL",2)~ THEN @87
== C#GrAmni IF ~Global("RE1_BardolanSex","GLOBAL",1)~ THEN @88
== C#GrAmni @89
= @90
== C#GrAmni IF ~GlobalLT("Chapter","GLOBAL",%tutu_chapter_4%)
 !GlobalGT("C#Q13_BragesSwordQuest","GLOBAL",3)~ THEN @91
== C#GrAmni IF ~OR(2)
GlobalGT("Chapter","GLOBAL",%tutu_chapter_3%)
GlobalGT("C#Q13_BragesSwordQuest","GLOBAL",3)~ THEN @84
== C#GrAmni @85
END
IF ~~ THEN DO ~SetGlobal("C#Grey_Brage","GLOBAL",6) EscapeArea()~ EXIT



I_C_T ~%tutu_var%BRAGE~ 9 C#Grey_BrageGauntlets
== ~%tutu_var%BRAGE~ IF ~PartyHasItem("c#grbrbr")~ THEN @92 
END



/* Fishing Village: Farmer Brun's Son */

EXTEND_BOTTOM ~%tutu_var%FARMBR~ 7
+ ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
See("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID) 
Global("C#Grey_BrunsSon","GLOBAL",0) !PartyHasItem("%tutu_var%MISC67")~ + @93 + nathans_trail
END

APPEND ~%tutu_var%FARMBR~

IF ~~ THEN nathans_trail
SAY @94
++ @95 EXTERN C#GreyJ nathans_trail_01
++ @96 + 8
END

END //APPEND

APPEND C#GreyJ 

IF ~~ THEN nathans_trail_01
SAY @37
IF ~~ THEN DO ~SetGlobal("C#Grey_BrunsSon","GLOBAL",1) 
ClearAllActions()
StartCutSceneMode() 
StartCutScene("C#GrCut1")~ EXIT
END

IF WEIGHT #-1
~Global("C#Grey_BrunsSon","GLOBAL",1)~ THEN nathans_trail_02
SAY @37
= @97
IF ~~ THEN DO ~SetGlobal("C#Grey_BrunsSon","GLOBAL",2)~ UNSOLVED_JOURNAL @100002 EXIT
END

END //APPEND C#GreyJ


/* Chewtoy from Albert. Now he really gives the PC one! */

ADD_TRANS_ACTION ~%tutu_var%ALBERT~ BEGIN 7 END BEGIN END ~GiveItemCreate("C#GrToy3",LastTalkedToBy,2,0,0)~


INTERJECT ~%tutu_var%ALBERT~ 1 C#Grey_Albert
== c#greyj IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @98
END
++ @99 EXTERN ~%tutu_var%ALBERT~ grey_int_1
++ @100 EXTERN ~%tutu_var%ALBERT~ grey_int_1
++ @101 EXTERN ~%tutu_var%ALBERT~ grey_int_1

INTERJECT ~%tutu_var%ALBERT~ 9 C#Grey_Albert
== c#greyj IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @98
END
++ @99 EXTERN ~%tutu_var%ALBERT~ grey_int_9
++ @100 EXTERN ~%tutu_var%ALBERT~ grey_int_9
++ @101 EXTERN ~%tutu_var%ALBERT~ grey_int_9

APPEND ~%tutu_var%ALBERT~

IF ~~ THEN grey_int_1
SAY @102
COPY_TRANS ~%tutu_var%ALBERT~ 1
END

IF ~~ THEN grey_int_9
SAY @102
COPY_TRANS ~%tutu_var%ALBERT~ 9
END

END

/* Doppelgangers at the Seven Suns */

INTERJECT ~%tutu_var%DOPMER~ 0 C#Grey_DOPMER_0
== c#greyj IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @103
= @98
END
++ @104 DO ~SetGlobal("C#Grey_DOPMER_0","GLOBAL",0)~ EXTERN ~%tutu_var%DOPMER~ grey_int_1
++ @105 + 6
++ @101 DO ~SetGlobal("C#Grey_DOPMER_0","GLOBAL",0)~ EXTERN ~%tutu_var%DOPMER~ grey_int_1  


APPEND ~%tutu_var%DOPMER~ 

IF ~~ THEN grey_int_1
SAY @106
COPY_TRANS ~%tutu_var%DOPMER~ 0
END

END //APPEND

/* Jhasso at the Seven Suns */

EXTEND_BOTTOM ~%tutu_var%JHASSO~ 0
+ ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ + @107 DO ~SetGlobal("C#Grey_Jhasso","LOCALS",1)~ + grey_jhasso
END

EXTEND_BOTTOM ~%tutu_var%JHASSO~ 2
+ ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID) Global("C#Grey_Jhasso","LOCALS",0)~ + @107 + grey_jhasso_2
END

APPEND ~%tutu_var%JHASSO~

IF ~~ THEN grey_jhasso
SAY @108
COPY_TRANS ~%tutu_var%JHASSO~ 0
END

IF ~~ THEN grey_jhasso_2
SAY @108
COPY_TRANS ~%tutu_var%JHASSO~ 2
END

END //APPEND

/* Doppelgangers in Candlekeep Chapter 6 */

/* in the priest quarters */

INTERJECT ~%tutu_var%POGHM9~ 0 C#Grey_POGHM9_0
== c#greyj IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @109
END
++ @104 EXTERN ~%tutu_var%POGHM9~ grey_int_1
++ @105 + 3
++ @101 EXTERN ~%tutu_var%POGHM9~ grey_int_1  


APPEND ~%tutu_var%POGHM9~ 

IF ~~ THEN grey_int_1
SAY @110
COPY_TRANS ~%tutu_var%POGHM9~ 0
END

END //APPEND



/* Catacombs  */

I_C_T ~%tutu_var%PHLYDI3~ 0 C#Grey_PHLYDI3_0
== c#greyj IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @109
== ~%tutu_var%PHLYDI3~ IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @111
END

I_C_T ~%tutu_var%DREPPI3~ 0 C#Grey_DREPPI3_0
== c#greyj IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @98
== ~%tutu_var%DREPPI3~ IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @111
END

/* Deder & Arkanis, in Candlekeep Catacombs */

I_C_T ~%tutu_var%ARKANI3~ 0 C#Grey_Arkanis
== ~%tutu_var%ARKANI3~ IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID) Global("C#Grey_DREPPI3_0","GLOBAL",1)~ THEN @112
== ~%tutu_var%ARKANI3~ IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID) Global("C#Grey_DREPPI3_0","GLOBAL",1)~ THEN @113
END





/* Taken out - these change into higher forms of doppelgangers (greater doppelgangers)

/* Shistal */

INTERJECT ~%tutu_var%SHISTA~ 0 C#Grey_SHISTA_0
== c#greyj IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @109
END
++ @104 EXTERN ~%tutu_var%SHISTA~ grey_int_1
++ ~What? Grey, why are you growling? Don't tell me this Shistal is a...~ EXTERN ~%tutu_var%SHISTA~ grey_int_1 
++ @101 EXTERN ~%tutu_var%SHISTA~ grey_int_1  


APPEND ~%tutu_var%SHISTA~

IF ~~ THEN grey_int_1
SAY ~Go your way, stranger.~
++ ~No, my dog thinks *you* are a stranger. So, who or what are you?!~ + 8
COPY_TRANS ~%tutu_var%SHISTA~ 0
END

END //APPEND

INTERJECT ~%tutu_var%ELMINS4~ 0 C#Grey_ELMINS4_0
== c#greyj IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @98
END
++ @104 EXTERN ~%tutu_var%ELMINS4~ grey_int_1
++ ~What? Grey, why are you growling? Don't tell me this is a doppelganger!~ EXTERN ~%tutu_var%ELMINS4~ grey_int_1 
++ @101 EXTERN ~%tutu_var%ELMINS4~ grey_int_1  


APPEND ~%tutu_var%ELMINS4~ 

IF ~~ THEN grey_int_1
SAY ~Please, child, do not you hear the madness in your words?~
++ ~No, my dog thinks *you* are a stranger. So, who or what are you?!~ + grey_int_2
COPY_TRANS ~%tutu_var%ELMINS4~ 0
END

IF ~~ THEN grey_int_2
SAY ~Can you not see? Can you not see the miracle in front of your eyes?~
COPY_TRANS ~%tutu_var%ELMINS4~ 0
END

END //APPEND

*/

INTERJECT ~%tutu_var%GORION3~ 0 C#Grey_GORION3_0
== c#greyj IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @98
END
++ @104 EXTERN ~%tutu_var%GORION3~ grey_int_1
++ @114 EXTERN ~%tutu_var%GORION3~ grey_int_1 
++ @101 EXTERN ~%tutu_var%GORION3~ grey_int_1  


APPEND ~%tutu_var%GORION3~

IF ~~ THEN grey_int_1
SAY @115
COPY_TRANS ~%tutu_var%GORION3~ 0
END

END //APPEND


INTERJECT ~%tutu_var%TETHTO3~ 0 C#Grey_TETHTO3_0
== c#greyj IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @98
END
++ @104 EXTERN ~%tutu_var%TETHTO3~ grey_int_1
++ @116 EXTERN ~%tutu_var%TETHTO3~ grey_int_1 
++ @101 EXTERN ~%tutu_var%TETHTO3~ grey_int_1  


APPEND ~%tutu_var%TETHTO3~

IF ~~ THEN grey_int_1
SAY @117
COPY_TRANS ~%tutu_var%TETHTO3~ 0
END

END //APPEND



I_C_T ~%tutu_var%FULLER3~ 0 C#Grey_FULLER3_0
== c#greyj IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @98
== ~%tutu_var%FULLER3~ IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @111
END

I_C_T ~%tutu_var%HULL3~ 0 C#Grey_HULL3_0
== c#greyj IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @98
== ~%tutu_var%HULL3~ IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @111
END

I_C_T ~%tutu_var%JONDAL3~ 0 C#Grey_JONDAL3_0
== c#greyj IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @98
== ~%tutu_var%JONDAL3~ IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @118
END

I_C_T ~%tutu_var%KARAN3~ 0 C#Grey_KARAN3_0
== c#greyj IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @98
== ~%tutu_var%KARAN3~ IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @111
END

I_C_T ~%tutu_var%PARDA3~ 0 C#Grey_PARDA3_0
== c#greyj IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @98
== ~%tutu_var%PARDA3~ IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @111
END

I_C_T ~%tutu_var%REEVOR3~ 0 C#Grey_REEVOR3_0
== c#greyj IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @98
== ~%tutu_var%PARDA3~ IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @119
END

I_C_T ~%tutu_var%WINTHR3~ 0 C#Grey_WINTHR3_0
== c#greyj IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @98
== ~%tutu_var%WINTHR3~ IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @111
END


/* doppelgangers in Mearchant league */

INTERJECT ~%tutu_var%IRLENT~ 0 C#Grey_IRLENT_0
== c#greyj IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @98
END
++ @120 EXTERN ~%tutu_var%IRLENT~ grey_int_1
++ @121 EXTERN ~%tutu_var%IRLENT~ grey_int_1 
++ @101 EXTERN ~%tutu_var%IRLENT~ grey_int_1  


APPEND ~%tutu_var%IRLENT~ 

IF ~~ THEN grey_int_1
SAY @122
COPY_TRANS ~%tutu_var%IRLENT~ 0
END

END //APPEND ~%tutu_var%IRLENT~



INTERJECT ~%tutu_var%ZORL~ 0 C#Grey_ZORL_0
== c#greyj IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @98
END
++ @123 EXTERN ~%tutu_var%ZORL~ grey_int_1
++ @124 EXTERN ~%tutu_var%ZORL~ grey_int_1 
++ @101 EXTERN ~%tutu_var%ZORL~ grey_int_1  


APPEND ~%tutu_var%ZORL~ 

IF ~~ THEN grey_int_1
SAY @125
COPY_TRANS ~%tutu_var%ZORL~ 0
END

END //APPEND






/* werewolf island - Grey sniffs a lot! */

/* Quest giver Mendas in Ulgoth's Beard. Grey should smell werewolf but not spoil the quest! */

INTERJECT ~%tutu_var%MENDA1~ 0 C#Grey_Mendas_0
== C#GreyJ IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @126
== ~%tutu_var%MENDA1~ IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @127
END
+ ~Global("C#Grey_SniffedDoppelG","GLOBAL",1)~ + @128 EXTERN ~%tutu_var%MENDA1~ grey_ict_01
++ @129 EXTERN ~%tutu_var%MENDA1~ grey_ict_02
++ @130 EXTERN ~%tutu_var%MENDA1~ grey_ict_02

APPEND ~%tutu_var%MENDA1~

IF ~~ THEN grey_ict_01
SAY @131
IF ~~ THEN + grey_ict_02
END

IF ~~ THEN grey_ict_02
SAY @132
COPY_TRANS ~%tutu_var%MENDA1~ 0
END

END //APPEND

/* Little girl at the beach. Smell is a great topic on this island. Grey thinks so, too! */


INTERJECT ~%tutu_var%SOLIA1~ 0 C#Grey_Solia1_0
== c#greyj IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @133
== ~%tutu_var%SOLIA1~ IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @134
END
++ @135 EXTERN ~%tutu_var%SOLIA1~ grey_ict
++ @136 EXTERN ~%tutu_var%SOLIA1~ grey_ict_02
++ @130 EXTERN ~%tutu_var%SOLIA1~ grey_ict_02

APPEND ~%tutu_var%SOLIA1~

IF ~~ THEN grey_ict
SAY @137
IF ~~ THEN + grey_ict_02
END

IF ~~ THEN grey_ict_02
SAY @138
COPY_TRANS ~%tutu_var%SOLIA1~ 0
END

END //APPEND ~%tutu_var%SOLIA1~


/* general sniffing on the werewolf island - and be done with the topic */

APPEND C#GreyJ 

IF ~Global("C#Grey_WerewolfIsland","GLOBAL",1)~ THEN werewolf_sniff
SAY @139
++ @140 + werewolf_sniff_01
++ @141 + werewolf_sniff_02
++ @142 + werewolf_sniff_02
++ @143 + werewolf_sniff_02
END

IF ~~ THEN werewolf_sniff_01
SAY @144
++ @141 + werewolf_sniff_02
++ @142 + werewolf_sniff_02
++ @143 + werewolf_sniff_02
END

IF ~~ THEN werewolf_sniff_02
SAY @145
IF ~~ THEN DO ~SetGlobal("C#Grey_WerewolfIsland","GLOBAL",2)~ EXIT
END

END //APPEND C#GreyJ


/* Wardog Armory Merchant */

BEGIN c#gr1mt1

IF ~True()~ THEN shop
SAY @146
++ @147 DO ~StartStore("c#gr1mt1",LastTalkedToBy(Myself))~ EXIT
++ @148 EXIT
END

BEGIN c#gr1mt2

IF ~True()~ THEN shop
SAY @146
++ @147 DO ~StartStore("c#gr1mt2",LastTalkedToBy(Myself))~ EXIT
++ @148 EXIT
END

