
/* BG1, Kerzenburg */

REPLACE_TRANS_ACTION ~%tutu_var%JONDAL~ BEGIN 3 END BEGIN END ~ClearAllActions()~ ~ClearAllActions() ActionOverride("C#Grey",EscapeArea())~
REPLACE_TRANS_ACTION ~%tutu_var%ERIK~ BEGIN 0 END BEGIN END ~ClearAllActions()~ ~ClearAllActions() ActionOverride("C#Grey",EscapeArea())~


I_C_T ~%tutu_var%JONDAL~ 0 C#Grey_JONDAL0 
== C#GREY IF ~Exists("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @0
== ~%tutu_var%JONDAL~ IF ~Exists("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @1
= @2
= @3
END

APPEND C#GREY

IF ~Global("C#Grey_Exists","GLOBAL",1)~ THEN in_kerzenburg
SAY @0
IF ~~ THEN EXIT
END

END //APPEND

/* BG1, Area of Gorion's Death Site, street where Imoen just joined */


CHAIN
IF ~Global("C#Grey_Exists","GLOBAL",2)~ THEN C#GREY bg1_joining
@0 DO ~SetGlobal("C#Grey_Exists","GLOBAL",3)~
== ~%IMOEN_JOINED%~ IF ~InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @4
END
++ @5 EXTERN ~%IMOEN_JOINED%~ bg1_joining_01 
++ @6 EXTERN ~%IMOEN_JOINED%~ bg1_joining_01 
++ @7 EXTERN ~%IMOEN_JOINED%~ bg1_joining_01 

CHAIN
IF ~~ THEN ~%IMOEN_JOINED%~ bg1_joining_01
@8
= @9
== C#GREY @0
== ~%IMOEN_JOINED%~ @10
END
++ @11 + bg1_joining_02
++ @12 + bg1_joining_02
++ @13 + bg1_joining_02
++ @14 EXTERN C#GREY bg1_joining_03
++ @15 + bg1_joining_02

APPEND ~%IMOEN_JOINED%~

IF ~~ THEN bg1_joining_02
SAY @16
IF ~~ THEN EXTERN C#GREY bg1_joining_03
END

END //APPEND

APPEND C#GREY

IF ~~ THEN bg1_joining_03
SAY @0
IF ~~ THEN DO ~SetGlobalTimer("C#Grey_JondalarTimer","GLOBAL",30)
	SetGlobal("C#GreyJoined","GLOBAL",1)
            JoinParty()~ UNSOLVED_JOURNAL @100008 EXIT
END

END //APPEND















