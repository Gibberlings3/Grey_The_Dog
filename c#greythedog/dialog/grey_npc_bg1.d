/* BG1 Grey - NPC banter */


/* Imoen, after Candlekeep Catacombs */

APPEND ~%IMOEN_BANTER%~

IF WEIGHT #-1 
~CombatCounter(0) !See([ENEMY]) OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#GREY") See(Player1)
!StateCheck(Player1,CD_STATE_NOTVALID)
!Dead("C#GREY")
!StateCheck(Myself,CD_STATE_NOTVALID)
InParty(Myself)
Global("C#Grey_ImoenBG1Doppel","GLOBAL",0)
Global("C#Grey_PHLYDI3_0","GLOBAL",1)
!AreaCheck("%Candlekeep_Catacombs_L2%")
!AreaCheck("%Candlekeep_Catacombs_L1%")~ THEN imoengrey_doppelgangers
SAY @0
++ @1 + imoengrey_doppelgangers_02
++ @2 + imoengrey_doppelgangers_01
++ @3 + imoengrey_doppelgangers_02
++ @4 + imoengrey_doppelgangers_01
END

IF ~~ THEN imoengrey_doppelgangers_01
SAY @5
IF ~~ THEN + imoengrey_doppelgangers_02
END

IF ~~ THEN imoengrey_doppelgangers_02
SAY @6
++ @7 + imoengrey_doppelgangers_03
+ ~Global("C#Grey_Arkanis","GLOBAL",1)~ + @8 + imoengrey_doppelgangers_05
+ ~Global("C#Grey_Arkanis","GLOBAL",0)~ + @9 + imoengrey_doppelgangers_05
++ @10 + imoengrey_doppelgangers_04
++ @11 + imoengrey_doppelgangers_08
++ @12 + imoengrey_doppelgangers_07
END

IF ~~ THEN imoengrey_doppelgangers_03
SAY @13
IF ~~ THEN + imoengrey_doppelgangers_05
END

IF ~~ THEN imoengrey_doppelgangers_04
SAY @14
IF ~~ THEN + imoengrey_doppelgangers_05
END

IF ~~ THEN imoengrey_doppelgangers_05
SAY @15
IF ~~ THEN + imoengrey_doppelgangers_09
END

IF ~~ THEN imoengrey_doppelgangers_06
SAY @16
IF ~~ THEN DO ~SetGlobal("C#Grey_ImoenBG1Doppel","GLOBAL",1)~ EXIT
END

IF ~~ THEN imoengrey_doppelgangers_07
SAY @17
IF ~~ THEN DO ~SetGlobal("C#Grey_ImoenBG1Doppel","GLOBAL",1)~ EXIT
END

IF ~~ THEN imoengrey_doppelgangers_08
SAY @18
IF ~~ THEN + imoengrey_doppelgangers_09
END

IF ~~ THEN imoengrey_doppelgangers_09
SAY @19
IF ~~ THEN + imoengrey_doppelgangers_06
END


/* Imoen Banter  */
//#1
IF WEIGHT #-1 
~CombatCounter(0) !See([ENEMY]) OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#GREY") See(Player1)
!StateCheck(Player1,CD_STATE_NOTVALID)
!Dead("C#GREY")
!StateCheck(Myself,CD_STATE_NOTVALID)
InParty(Myself)
Global("C#Grey_ImoenBanterBG1","GLOBAL",0)~ THEN imoengrey1
SAY @20
++ @21 + imoengrey1_01
++ @22 + imoengrey1_02
++ @23 + imoengrey1_02
++ @24 + imoengrey1_04
END

IF ~~ THEN imoengrey1_01
SAY @25
IF ~~ THEN + imoengrey1_02
END

IF ~~ THEN imoengrey1_02
SAY @26
IF ~~ THEN + imoengrey1_03
END

IF ~~ THEN imoengrey1_03
SAY @27
IF ~~ THEN DO ~SetGlobal("C#Grey_ImoenBanterBG1","GLOBAL",1)~ EXIT
END

IF ~~ THEN imoengrey1_04
SAY @28
IF ~~ THEN + imoengrey1_02
END
END //APPEND ~%IMOEN_BANTER%~


/* Imoen Banter  */
//#2
APPEND ~%IMOEN_BANTER%~
IF WEIGHT #-1 
~CombatCounter(0) !See([ENEMY]) OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#GREY") See(Player1)
!StateCheck(Player1,CD_STATE_NOTVALID)
!Dead("C#GREY")
!StateCheck(Myself,CD_STATE_NOTVALID)
InParty(Myself)
Global("C#Grey_ImoenBanterBG1","GLOBAL",1)~ THEN imoengrey2
SAY @29
++ @30 + imoengrey2_02
++ @31 + imoengrey2_01
++ @32 + imoengrey2_02
++ @33 + imoengrey2_03
END

IF ~~ THEN imoengrey2_01
SAY @34
IF ~~ THEN + imoengrey2_02
END

IF ~~ THEN imoengrey2_02
SAY @35
IF ~~ THEN + imoengrey2_03
END

IF ~~ THEN imoengrey2_03
SAY @36
= @37
= @38
IF ~~ THEN DO ~SetGlobal("C#Grey_ImoenBanterBG1","GLOBAL",2)~ EXIT
END
END //APPEND ~%IMOEN_BANTER%~

APPEND ~%MINSC_BANTER%~

IF WEIGHT #-1 
~CombatCounter(0) !See([ENEMY]) OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#GREY") See(Player1)
!StateCheck(Player1,CD_STATE_NOTVALID)
!Dead("C#GREY")
!StateCheck(Myself,CD_STATE_NOTVALID)
InParty(Myself)
HasItem("%tutu_var%MISC84","MINSC")
Global("C#Grey_MinscBanterBG1","GLOBAL",0)~ THEN minscgrey1
SAY @39
++ @40 DO ~SetGlobal("C#Grey_MinscBanterBG1","GLOBAL",1)~ + minscgrey1_01
++ @41 DO ~SetGlobal("C#Grey_MinscBanterBG1","GLOBAL",1)~ + minscgrey1_02
++ @42 DO ~SetGlobal("C#Grey_MinscBanterBG1","GLOBAL",1)~ + minscgrey1_04
END

IF ~~ THEN minscgrey1_01
SAY @43 
++ @44 + minscgrey1_03
++ @45 + minscgrey1_02
++ @46 + minscgrey1_02
++ @47 EXIT
END

IF ~~ THEN minscgrey1_02
SAY @48
IF ~~ THEN + minscgrey1_04
END

IF ~~ THEN minscgrey1_03
SAY @49
IF ~~ THEN + minscgrey1_04
END

IF ~~ THEN minscgrey1_04
SAY @50
++ @51 + minscgrey1_05
++ @52 + minscgrey1_05
++ @53 + minscgrey1_05
END

IF ~~ THEN minscgrey1_05
SAY @54
IF ~~ THEN EXIT
END

END //APPEND ~%MINSC_BANTER%~

CHAIN
IF WEIGHT #-1 
~CombatCounter(0) !See([ENEMY]) OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#GREY") See(Player1)
!Dead("C#GREY")
!StateCheck(Myself,CD_STATE_NOTVALID)
InParty(Myself)
InParty("Minsc")
See("Minsc") 
!StateCheck("Minsc",CD_STATE_NOTVALID)
Global("C#Grey_ImoenMinscBG1","GLOBAL",0)
Global("C#Grey_MinscBanterBG1","GLOBAL",1)~ THEN ~%IMOEN_BANTER%~ imoenminscgrey1
@55
DO ~SetGlobal("C#Grey_ImoenMinscBG1","GLOBAL",1)~
== ~%MINSC_BANTER%~ @56
== ~%IMOEN_BANTER%~ @57 
== ~%MINSC_BANTER%~ @58
== ~%IMOEN_BANTER%~ @59
== ~%MINSC_BANTER%~ @60
== ~%IMOEN_BANTER%~ @61
EXIT


APPEND ~%MINSC_BANTER%~


IF WEIGHT #-1 
~CombatCounter(0) !See([ENEMY]) 
OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) See("C#GREY") 
See(Player1) !StateCheck(Player1,CD_STATE_NOTVALID)
!Dead("C#GREY")
!StateCheck(Myself,CD_STATE_NOTVALID)
InParty(Myself)
HasItem("%tutu_var%MISC84","MINSC")
OR(5)
 HasItem("C#GrArm1","C#GREY") //Grey's Item
 HasItem("C#GrArm2","C#GREY")
 HasItem("C#GrArm3","C#GREY")
 HasItem("C#GrArm4","C#GREY")
 HasItem("C#GrArm5","C#GREY")
Global("C#Grey_MinscBanterBG1","GLOBAL",1)~ THEN minscgrey2
SAY @62
++ @63 DO ~SetGlobal("C#Grey_MinscBanterBG1","GLOBAL",2)~ + minscgrey2_01
++ @64 DO ~SetGlobal("C#Grey_MinscBanterBG1","GLOBAL",2)~ + minscgrey2_01
++ @65 DO ~SetGlobal("C#Grey_MinscBanterBG1","GLOBAL",2)~ + minscgrey2_09
END

IF ~~ THEN minscgrey2_01
SAY @66
++ @67 + minscgrey2_02
++ @68 + minscgrey2_02
++ @69 + minscgrey2_02
++ @70 + minscgrey2_03
++ @71 + minscgrey2_02
++ @72 + minscgrey2_09
END

IF ~~ THEN minscgrey2_02
SAY @73
++ @74 + minscgrey2_05
++ @75 + minscgrey2_06
++ @76 + minscgrey2_04
++ @77 + minscgrey2_05
++ @78 + minscgrey2_09
END

IF ~~ THEN minscgrey2_03
SAY @79
IF ~~ THEN + minscgrey2_05
END 

IF ~~ THEN minscgrey2_04
SAY @80
= @81
IF ~~ THEN + minscgrey2_08
END

IF ~~ THEN minscgrey2_05
SAY @82
IF ~~ THEN + minscgrey2_07
END 

IF ~~ THEN minscgrey2_06
SAY @83
IF ~~ THEN + minscgrey2_05
END 

IF ~~ THEN minscgrey2_07
SAY @84
IF ~~ THEN + minscgrey2_08
END

IF ~~ THEN minscgrey2_08
SAY @85
IF ~~ THEN EXIT
END

IF ~~ THEN minscgrey2_09
SAY @86
IF ~~ THEN EXIT
END

END //APPEND

CHAIN
IF WEIGHT #-1 ~CombatCounter(0) !See([ENEMY]) OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#GREY") See(Player1)
!StateCheck(Player1,CD_STATE_NOTVALID)
!StateCheck("C#GREY",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
InParty(Myself)
HasItem("%tutu_var%MISC84","MINSC")
Global("C#Grey_MinscBanterBG1","GLOBAL",2)~ THEN ~%MINSC_BANTER%~ minscgrey3
@87 DO ~SetGlobal("C#Grey_MinscBanterBG1","GLOBAL",3)~
== ~C#GreyJ~ @88
== ~%MINSC_BANTER%~ @89
= @90
= @91
EXIT


CHAIN
IF WEIGHT #-1 ~CombatCounter(0) !See([ENEMY]) OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#GREY") See(Player1)
!StateCheck(Player1,CD_STATE_NOTVALID)
!StateCheck("C#GREY",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
InParty(Myself)
HasItem("%tutu_var%MISC84","MINSC")
Global("C#Grey_MinscBanterBG1","GLOBAL",3)~ THEN ~%MINSC_BANTER%~ minscgrey4
@92 
DO ~SetGlobal("C#Grey_MinscBanterBG1","GLOBAL",4)~
== ~C#GreyJ~ @88
== ~%MINSC_BANTER%~ @93
== ~%MINSC_BANTER%~ @94
== ~%MINSC_BANTER%~ @95
== ~%MINSC_BANTER%~ @96
EXIT


/*  Ajantis  */

APPEND ~%AJANTIS_BANTER%~


IF ~~ THEN dont_talk
SAY @97
IF ~~ THEN DO ~IncrementGlobal("C#Grey_AjantisBanterBG1","GLOBAL",1)~ EXIT
END

IF WEIGHT #-1
~!StateCheck(Myself,CD_STATE_NOTVALID)
InParty(Myself)
CombatCounter(0) !See([ENEMY]) 
OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) See("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)
See(Player1)
!StateCheck(Player1,CD_STATE_NOTVALID)
Global("C#Grey_AjantisBanterBG1","GLOBAL",0)~ THEN grey
SAY @98
++ @99 + grey_01
++ @100 + grey_01
++ @101 + dont_talk
END

IF ~~ THEN grey_01
SAY @102
++ @103 + grey_05
++ @104 + grey_02
++ @105 + grey_03
++ @101 + dont_talk
END

IF ~~ THEN grey_02
SAY @106
IF ~~ THEN + grey_04
END

IF ~~ THEN grey_03
SAY @107
IF ~~ THEN DO ~SetGlobal("C#Grey_AjantisBanterBG1","GLOBAL",1)~ EXIT
END

IF ~~ THEN grey_04
SAY @108
IF ~~ THEN DO ~SetGlobal("C#Grey_AjantisBanterBG1","GLOBAL",1)~ EXIT
END

IF ~~ THEN grey_05
SAY @109
IF ~~ THEN DO ~SetGlobal("C#Grey_AjantisBanterBG1","GLOBAL",1)~ EXIT
END


IF WEIGHT #-1
~!StateCheck(Myself,CD_STATE_NOTVALID)
InParty(Myself)
CombatCounter(0) !See([ENEMY]) 
OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) See("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)
See(Player1)
!StateCheck(Player1,CD_STATE_NOTVALID)
Global("C#Grey_AjantisBanterBG1","GLOBAL",1)~ THEN grey2
SAY @110 
++ @111 + grey2_02
++ @112 + grey2_01
++ @113 + grey2_03
++ @101 + dont_talk
END

IF ~~ THEN grey2_01
SAY @114
IF ~~ THEN + grey2_02
END

IF ~~ THEN grey2_02
SAY @115 
IF ~~ THEN DO ~SetGlobal("C#Grey_AjantisBanterBG1","GLOBAL",2)~ EXIT
END

IF ~~ THEN grey2_03
SAY @116
++ @111 + grey2_02
++ @112 + grey2_01
++ @101 + dont_talk
END

END //APPEND AjantisBanter


CHAIN
IF WEIGHT #-1 ~CombatCounter(0) !See([ENEMY]) OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#GREY") See(Player1)
!StateCheck(Player1,CD_STATE_NOTVALID)
!StateCheck("C#GREY",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
InParty(Myself)
//OR(##)
//HasItemEquipped("","C#Grey")
Global("C#Grey_AjantisBanterBG1","GLOBAL",2)~ THEN ~%AJANTIS_BANTER%~ ajantisgrey
@117 
DO ~SetGlobal("C#Grey_AjantisBanterBG1","GLOBAL",3)~
== ~%AJANTIS_BANTER%~ @118 
== ~C#GreyJ~ @88
== ~%AJANTIS_BANTER%~ @119
== ~%AJANTIS_BANTER%~ @120
EXIT



/* Alora */

APPEND ~%ALORA_BANTER%~

IF WEIGHT #-1 
~CombatCounter(0) !See([ENEMY]) OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#GREY") See(Player1)
!StateCheck(Player1,CD_STATE_NOTVALID)
!Dead("C#GREY")
!StateCheck(Myself,CD_STATE_NOTVALID)
InParty(Myself)
Global("C#Grey_AloraBanterBG1","GLOBAL",0)~ THEN aloragrey1
SAY @121
++ @122 + aloragrey1_02
++ @123 + aloragrey1_01
++ @124 + aloragrey1_03
++ @125 + aloragrey1_06
END

IF ~~ THEN aloragrey1_01
SAY @126
IF ~~ THEN + aloragrey1_03
END

IF ~~ THEN aloragrey1_02
SAY @127
IF ~~ THEN + aloragrey1_03
END

IF ~~ THEN aloragrey1_03
SAY @128
IF ~~ THEN + aloragrey1_04
END

IF ~~ THEN aloragrey1_04
SAY @129
IF ~~ THEN + aloragrey1_05
END

IF ~~ THEN aloragrey1_05
SAY @130
IF ~~ THEN DO ~SetGlobal("C#Grey_AloraBanterBG1","GLOBAL",1)~ EXIT
END

IF ~~ THEN aloragrey1_06
SAY @131
IF ~~ THEN + aloragrey1_05
END


END //APPEND ~%ALORA_BANTER%~

/* Faldorn */

APPEND ~%FALDORN_BANTER%~

IF WEIGHT #-1 
~CombatCounter(0) !See([ENEMY]) OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#GREY") See(Player1)
!StateCheck(Player1,CD_STATE_NOTVALID)
!Dead("C#GREY")
!StateCheck(Myself,CD_STATE_NOTVALID)
InParty(Myself)
Global("C#Grey_FaldornBanterBG1","GLOBAL",0)~ THEN faldorngrey1
SAY @132
++ @133 + faldorngrey1_01
++ @134 + faldorngrey1_01
++ @135 + faldorngrey1_01
++ @136 + faldorngrey1_01
END

IF ~~ THEN faldorngrey1_01
SAY @137
IF ~~ THEN DO ~SetGlobal("C#Grey_FaldornBanterBG1","GLOBAL",1)~ EXIT
END


IF WEIGHT #-1 
~CombatCounter(0) !See([ENEMY]) OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#GREY") See(Player1)
!StateCheck(Player1,CD_STATE_NOTVALID)
!Dead("C#GREY")
!StateCheck(Myself,CD_STATE_NOTVALID)
InParty(Myself)
Global("C#Grey_FaldornBanterBG1","GLOBAL",1)~ THEN faldorngrey2
SAY @138
++ @139 + faldorngrey2_01
++ @140 + faldorngrey2_01
++ @141 + faldorngrey2_01
++ @142 + faldorngrey2_01
END

IF ~~ THEN faldorngrey2_01
SAY @143
++ @144 EXTERN c#greyj faldorngrey2_03
++ @145 + faldorngrey2_02
+ ~OR(3)
HasItemEquiped("c#grtoo1","C#Grey")
HasItemEquiped("c#grtoo2","C#Grey")
HasItemEquiped("c#grtoo3","C#Grey")~ + @146 EXTERN c#greyj faldorngrey2_03
++ @147 + faldorngrey2_02
++ @4 + faldorngrey2_02
END 

IF ~~ THEN faldorngrey2_02
SAY @148
IF ~~ THEN EXTERN c#greyj faldorngrey2_03
END

END //APPEND

CHAIN
IF ~~ THEN c#greyj faldorngrey2_03
@149
== ~%FALDORN_BANTER%~ @150
END
IF ~~ THEN DO ~SetGlobal("C#Grey_FaldornBanterBG1","GLOBAL",2)~ EXIT



/* Coran Banter */

CHAIN
IF WEIGHT #-1 
~CombatCounter(0) !See([ENEMY]) OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#GREY") See(Player1)
!StateCheck(Player1,CD_STATE_NOTVALID)
!Dead("C#GREY")
!StateCheck(Myself,CD_STATE_NOTVALID)
InParty(Myself)
Global("C#Grey_CoranBanterBG1","GLOBAL",0)~ THEN ~%CORAN_BANTER%~ corangrey1
@151 DO ~SetGlobal("C#Grey_CoranBanterBG1","GLOBAL",1)~
= @152
== ~%CORAN_BANTER%~ IF ~!PartyHasItem("%tutu_var%MISC52") !HasItem("%tutu_var%MISC52","C#Grey") !PartyHasItem("c#q04003") !HasItem("c#q04003","C#Grey")~ THEN @153
== ~%CORAN_BANTER%~ IF ~Global("CoranReward","GLOBAL",0) 
OR(2)
PartyHasItem("c#q04003")
HasItem("c#q04003","C#Grey")~ THEN @154
== ~%CORAN_BANTER%~ @155
== ~%CORAN_BANTER%~ IF ~Global("CoranReward","GLOBAL",0)~ THEN @156
EXIT

/* Skie Banter */

CHAIN
IF WEIGHT #-1 
~CombatCounter(0) !See([ENEMY]) OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#GREY") See(Player1)
!StateCheck(Player1,CD_STATE_NOTVALID)
!Dead("C#GREY")
!StateCheck(Myself,CD_STATE_NOTVALID)
InParty(Myself)
Global("C#Grey_SkieBanterBG1","GLOBAL",0)~ THEN ~%SKIE_BANTER%~ skiegrey1
@157 DO ~SetGlobal("C#Grey_SkieBanterBG1","GLOBAL",1)~
= @158
EXIT

CHAIN
IF WEIGHT #-1 
~CombatCounter(0) !See([ENEMY]) OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#GREY") See(Player1)
!StateCheck(Player1,CD_STATE_NOTVALID)
!Dead("C#GREY")
!StateCheck(Myself,CD_STATE_NOTVALID)
InParty(Myself)
Global("C#Grey_SkieBanterBG1","GLOBAL",1)
See("Eldoth")
InParty("Eldoth")
!StateCheck("Eldoth",CD_STATE_NOTVALID)~ THEN ~%SKIE_BANTER%~ skiegrey2
@159 DO ~SetGlobal("C#Grey_SkieBanterBG1","GLOBAL",2)~
== ~%ELDOTH_BANTER%~ @160
= @161
== ~%SKIE_BANTER%~ @162
== ~%ELDOTH_BANTER%~ @163
EXIT

/* Montaron / Xzar */


CHAIN
IF WEIGHT #-1 
~CombatCounter(0) !See([ENEMY]) OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#GREY") See(Player1)
!StateCheck(Player1,CD_STATE_NOTVALID)
!Dead("C#GREY")
!StateCheck(Myself,CD_STATE_NOTVALID)
InParty(Myself)
Global("C#Grey_MontaronBanterBG1","GLOBAL",0)~ THEN ~%MONTARON_BANTER%~ montarongrey1
@164 DO ~SetGlobal("C#Grey_MontaronBanterBG1","GLOBAL",1)~
EXIT

CHAIN
IF WEIGHT #-1 
~CombatCounter(0) !See([ENEMY]) OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#GREY") See(Player1)
!StateCheck(Player1,CD_STATE_NOTVALID)
!Dead("C#GREY")
!StateCheck(Myself,CD_STATE_NOTVALID)
InParty(Myself)
See("Xzar")
InParty("Xzar")
!StateCheck("Xzar",CD_STATE_NOTVALID)
Global("C#Grey_MontaronBanterBG1","GLOBAL",1)~ THEN ~%MONTARON_BANTER%~ montarongrey2
@165
== ~%ELDOTH_BANTER%~ IF ~See("Eldoth")
InParty("Eldoth")
!StateCheck("Eldoth",CD_STATE_NOTVALID)~ THEN @166
END
++ @167 + montarongrey2_02
++ @168 + montarongrey2_01
++ @169 + montarongrey2_01


CHAIN
IF ~~ THEN ~%MONTARON_BANTER%~ montarongrey2_01
@170
== ~%MONTARON_BANTER%~ IF ~See("Xzar")
InParty("Xzar")
!StateCheck("Xzar",CD_STATE_NOTVALID)~ THEN @171
== ~%XZAR_BANTER%~ IF ~See("Xzar")
InParty("Xzar")
!StateCheck("Xzar",CD_STATE_NOTVALID)~ THEN @172
== ~%MONTARON_BANTER%~ IF ~See("Xzar")
InParty("Xzar")
!StateCheck("Xzar",CD_STATE_NOTVALID)~ THEN @173
== ~%MONTARON_BANTER%~ @174
EXIT

APPEND ~%MONTARON_BANTER%~ 

IF ~~ THEN montarongrey2_02
SAY @175
IF ~~ THEN + montarongrey2_01
END

END //APPEND


CHAIN
IF WEIGHT #-1 
~CombatCounter(0) !See([ENEMY]) OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#GREY") See(Player1)
!StateCheck(Player1,CD_STATE_NOTVALID)
!Dead("C#GREY")
!StateCheck(Myself,CD_STATE_NOTVALID)
InParty(Myself)
See("Xzar")
InParty("Xzar")
!StateCheck("Xzar",CD_STATE_NOTVALID)
Global("C#Grey_MontaronBanterBG1","GLOBAL",2)~ THEN ~%MONTARON_BANTER%~ montarongrey3
@176 DO ~SetGlobal("C#Grey_MontaronBanterBG1","GLOBAL",3)~
= @177
EXIT

CHAIN
IF WEIGHT #-1 
~CombatCounter(0) !See([ENEMY]) OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#GREY") See(Player1)
!StateCheck(Player1,CD_STATE_NOTVALID)
!Dead("C#GREY")
!StateCheck(Myself,CD_STATE_NOTVALID)
InParty(Myself)
Global("C#Grey_XzarBanterBG1","GLOBAL",0)~ THEN ~%XZAR_BANTER%~ xzargrey1
@178 DO ~SetGlobal("C#Grey_XzarBanterBG1","GLOBAL",1)~
= @179 
== C#GreyJ @180
== ~%XZAR_BANTER%~ @181
== ~%MONTARON_BANTER%~ IF ~See("Montaron")
InParty("Montaron")
!StateCheck("Montaron",CD_STATE_NOTVALID)~ THEN @182
EXIT

/* Viconia */

CHAIN
IF WEIGHT #-1 
~CombatCounter(0) !See([ENEMY]) OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#GREY") See(Player1)
!StateCheck(Player1,CD_STATE_NOTVALID)
!Dead("C#GREY")
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#Grey_ViconiaBanterBG1","GLOBAL",0)~ THEN ~%VICONIA_BANTER%~ viconiagrey1
@183 DO ~SetGlobal("C#Grey_ViconiaBanterBG1","GLOBAL",1)~ 
== C#GreyJ @184
== ~%VICONIA_BANTER%~ @185
== C#GreyJ @180
== ~%VICONIA_BANTER%~ @186
END
++ @187 + viconiagrey1_01
++ @188 + viconiagrey1_02 

CHAIN
IF ~~ THEN ~%VICONIA_BANTER%~ viconiagrey1_01
@189
== C#GreyJ @190
EXIT

APPEND ~%VICONIA_BANTER%~

IF ~~ THEN viconiagrey1_02
SAY @191
IF ~~ THEN EXIT
END

END //APPEND





