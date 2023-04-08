/* Brandock - Grey BG1 */



CHAIN
IF WEIGHT #-1 
~%BG1_BEFORE_TRANSITION%
CombatCounter(0) !See([ENEMY]) 
OR(2) InParty("C#Brandock") Global("C#BrandockJoined","GLOBAL",2)
OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#Grey") See(Player1)
!StateCheck("C#Grey",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#Brandock_GreyBG1","GLOBAL",0)~ THEN C#BrandB brandockgrey1
@0
DO ~SetGlobal("C#Brandock_GreyBG1","GLOBAL",1)~
EXIT


CHAIN
IF WEIGHT #-1 
~%BG1_BEFORE_TRANSITION%
CombatCounter(0) !See([ENEMY]) 
OR(2) InParty("C#Brandock") Global("C#BrandockJoined","GLOBAL",2)
OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#Grey") See(Player1)
!StateCheck("C#Grey",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#Brandock_GreyBG1","GLOBAL",1)~ THEN C#BrandB brandockgrey2
@1
DO ~SetGlobal("C#Brandock_GreyBG1","GLOBAL",2)~
== C#GreyJ @2
== C#BrandB @3
= @4
= @5
== C#GreyJ @6
== C#BrandB @7
EXIT

/* after book is found */
CHAIN
IF 
~%BG1_BEFORE_TRANSITION%
CombatCounter(0) !See([ENEMY]) 
OR(2) InParty("C#Brandock") Global("C#BrandockJoined","GLOBAL",2)
OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#Grey") See(Player1)
!StateCheck(Player1,CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
GlobalGT("C#Brandock_Possessions","GLOBAL",3)
Global("C#Brandock_GreyBG1","GLOBAL",2)~ THEN C#BrandB brandockgrey3
@8
DO ~SetGlobal("C#Brandock_GreyBG1","GLOBAL",3) RealSetGlobalTimer("C#BrandockNPCBanterTimer","GLOBAL",3000)~
END
++ @9 + brandockgrey3_02
++ @10 + brandockgrey3_01
++ @11 + brandockgrey3_03
++ @12 + brandockgrey3_04

APPEND C#BrandB 
IF ~~ THEN brandockgrey3_01
SAY @13
IF ~~ THEN + brandockgrey3_05
END

IF ~~ THEN brandockgrey3_02
SAY @14
IF ~~ THEN + brandockgrey3_05
END

IF ~~ THEN brandockgrey3_03
SAY @15
IF ~~ THEN + brandockgrey3_05
END

IF ~~ THEN brandockgrey3_04
SAY @16
IF ~~ THEN + brandockgrey3_05
END

IF ~~ THEN brandockgrey3_05
SAY @17
IF ~~ THEN EXIT
END
END //APPEND

/* rest banter, triggered by c#brandD.bcs */
 
CHAIN
IF WEIGHT #-1
~Global("C#Brandock_GreyBG1","GLOBAL",4)~ THEN C#BrandJ brandockgrey4
@18 
= @19
= @20
== %IMOEN_BANTER% IF ~InParty("%IMOEN_DV%") See("%IMOEN_DV%") 
!StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @21
== C#BrandB IF ~InParty("%IMOEN_DV%") See("%IMOEN_DV%") 
!StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @22
== %IMOEN_BANTER% IF ~InParty("%IMOEN_DV%") See("%IMOEN_DV%") 
!StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @23
== %SKIE_BANTER% IF ~InParty("skie") See("skie") 
!StateCheck("skie",CD_STATE_NOTVALID)~ THEN @24
== %IMOEN_BANTER% IF ~InParty("%IMOEN_DV%") See("%IMOEN_DV%") 
!StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
InParty("skie") See("skie") 
!StateCheck("skie",CD_STATE_NOTVALID)~ THEN @25
== %AJANTIS_BANTER% IF ~InParty("ajantis") See("ajantis") 
!StateCheck("ajantis",CD_STATE_NOTVALID)~ THEN @26
= @27
== C#BrandB @28
END
IF ~~ THEN DO ~SetGlobal("C#Brandock_GreyBG1","GLOBAL",5) RestParty()~ EXIT
