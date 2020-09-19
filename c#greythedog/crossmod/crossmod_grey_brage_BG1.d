/* Brage - Grey BG1 */

CHAIN
IF WEIGHT #-1 
~%BGT_VAR%
CombatCounter(0) !See([ENEMY]) 
InParty(Myself)
OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#Grey") See(Player1)
!StateCheck("C#Grey",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#Brage_GreyBG1","GLOBAL",0)~ THEN C#BrageB bragegrey1
@4 DO ~SetGlobal("C#Brage_GreyBG1","GLOBAL",1)~
END
++ @7 + bragegrey1_01
++ @5 + bragegrey1_01
++ @6 + bragegrey1_02

APPEND C#BrageB 
IF ~~ THEN bragegrey1_01
SAY @8
IF ~~ THEN + bragegrey1_03
END

IF ~~ THEN bragegrey1_02
SAY @9
IF ~~ THEN + bragegrey1_03
END

IF ~~ THEN bragegrey1_03
SAY @10
IF ~~ THEN EXIT
END

END //APPEND



CHAIN
IF WEIGHT #-1 
~%BGT_VAR%
CombatCounter(0) !See([ENEMY]) 
InParty(Myself)
OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#Grey") See(Player1)
!StateCheck("C#Grey",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#Brage_GreyBG1","GLOBAL",1)~ THEN C#BrageB bragegrey2
@0 DO ~SetGlobal("C#Brage_GreyBG1","GLOBAL",2)~
== C#GreyJ @1
== C#BrageB @3
= @2
EXIT
