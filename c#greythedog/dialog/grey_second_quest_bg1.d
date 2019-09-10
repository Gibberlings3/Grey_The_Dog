/* man: C#GR1Q21, AR0807 [744.271],0  woman: C#GR1Q22, AR0800 [3037.15.25],12  */

BEGIN C#GR1Q22

CHAIN
IF ~Global("C#Grey_SecondBG1Quest","GLOBAL",1)~ THEN C#GR1Q22 woman
@0
== c#greyj IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @1
END
IF ~~ THEN DO ~SetGlobal("C#Grey_SecondBG1Quest","GLOBAL",2)~ UNSOLVED_JOURNAL @100021 EXIT



CHAIN
IF ~GlobalGT("C#Grey_SecondBG1Quest","GLOBAL",1) Global("C#Grey_SecondBG1QuestSniff","MYAREA",0)~ THEN C#GR1Q22 again
@2
== c#greyj IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @1 DO ~SetGlobal("C#Grey_SecondBG1QuestSniff","MYAREA",1)~ 
== C#GR1Q22 IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ @3 
END
IF ~~ THEN + again_02

APPEND C#GR1Q22

IF ~GlobalGT("C#Grey_SecondBG1Quest","GLOBAL",1) GlobalGT("C#Grey_SecondBG1QuestSniff","MYAREA",0)~ THEN again_02
SAY @4
+ ~Global("C#Grey_SecondBG1QuestSniff","MYAREA",1)
OR(6) CheckStatGT(Player1,15,INT)
CheckStatGT(Player2,15,INT)
CheckStatGT(Player3,15,INT)
CheckStatGT(Player4,15,INT)
CheckStatGT(Player5,15,INT)
CheckStatGT(Player6,15,INT)~ + @5 DO ~SetGlobal("C#Grey_SecondBG1QuestSniff","MYAREA",2)~ + again_07
++ @6 + again_03
+ ~Global("C#Grey_SecondBG1Quest","GLOBAL",3)~ + @7 + again_04
++ @8 + again_03
END


IF ~~ THEN again_03
SAY @9
IF ~~ THEN EXIT
END

IF ~~ THEN again_04
SAY @10
+ ~OR(6) CheckStatGT(Player1,15,INT)
CheckStatGT(Player2,15,INT)
CheckStatGT(Player3,15,INT)
CheckStatGT(Player4,15,INT)
CheckStatGT(Player5,15,INT)
CheckStatGT(Player6,15,INT)~ + @11 + again_06
++ @12 + again_06
++ @13 + again_05
++ @14 + again_06
END

IF ~~ THEN again_05
SAY @15
IF ~~ THEN + again_06
END

END //APPEND

CHAIN
IF ~~ THEN C#GR1Q22 again_06
@16
== c#greyj IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @17 DO ~AddJournalEntry(@100025,INFO)~
END
IF ~~ THEN DO ~EraseJournalEntry(@100022) SetGlobal("C#Grey_SecondBG1Quest","GLOBAL",4) ActionOverride("C#GR1Q22",ApplySpell(Myself,DOPPLEGANGER_CHANGE_DEFAULT_LESSER))~ UNSOLVED_JOURNAL @100023 EXIT


APPEND C#GR1Q22

IF ~~ THEN again_07
SAY @18
IF ~~ THEN + again_02
END

END //APPEND


APPEND BART12 //Bartender in AR0807

IF WEIGHT #-1
~AreaCheck("%EBaldursGate_Inn_L1%") Global("C#Grey_SecondBG1QuestBart","MYAREA",0)~ THEN bartender
SAY @19
IF ~~ THEN DO ~SetGlobal("C#Grey_SecondBG1QuestBart","MYAREA",1)~ + 0
END

END //APPEND

BEGIN C#GR1Q21


IF ~Global("C#Grey_SecondBG1QuestM","MYAREA",1)~ THEN leave_me
SAY @20
IF ~~ THEN DO ~SetGlobal("C#Grey_SecondBG1QuestM","MYAREA",2)~ + leave_me_01
END

IF ~Global("C#Grey_SecondBG1QuestM","MYAREA",2)~ THEN leave_me_01
SAY @21
+ ~GlobalLT("C#Grey_SecondBG1Quest","GLOBAL",2)~ + @22 + leave_me_02
+ ~GlobalLT("C#Grey_SecondBG1Quest","GLOBAL",2)~ + @23 + leave_me_04
+ ~Global("C#Grey_SecondBG1Quest","GLOBAL",2)~ + @24 + leave_me_05
+ ~Global("C#Grey_SecondBG1Quest","GLOBAL",4)~ + @25 + leave_me_19
++ @26 + leave_me_03
END


IF ~~ THEN leave_me_02
SAY @27
IF ~~ THEN + leave_me_03
END

IF ~~ THEN leave_me_03
SAY @28
IF ~~ THEN EXIT
END

IF ~~ THEN leave_me_04
SAY @29
IF ~~ THEN EXIT
END

IF ~~ THEN leave_me_05
SAY @30
= @31
++ @32 + leave_me_11
++ @33 + leave_me_06
++ @34 + leave_me_07
++ @35 + leave_me_10
END

IF ~~ THEN leave_me_06
SAY @36
IF ~~ THEN + leave_me_07
END

IF ~~ THEN leave_me_07
SAY @37
++ @38 + leave_me_10
++ @34 + leave_me_10
++ @39 + leave_me_09
++ @40 + leave_me_08
END

IF ~~ THEN leave_me_08
SAY @41
IF ~~ THEN DO ~EraseJournalEntry(@100021) SetGlobal("C#Grey_SecondBG1Quest","GLOBAL",3) SetGlobal("C#Grey_SecondBG1QuestM","MYAREA",3)~ UNSOLVED_JOURNAL @100022 EXIT
END

IF ~~ THEN leave_me_09
SAY @42
IF ~~ THEN + leave_me_10
END

IF ~~ THEN leave_me_10
SAY @43
++ @44 + leave_me_12
++ @45 + leave_me_13
++ @40 + leave_me_08
END

IF ~~ THEN leave_me_11
SAY @46
++ @33 + leave_me_06
++ @34 + leave_me_07
++ @39 + leave_me_09
++ @40 + leave_me_08
END

IF ~~ THEN leave_me_12
SAY @47
++ @48 + leave_me_17
++ @49 + leave_me_15
++ @50 + leave_me_13
++ @51 + leave_me_08
END

IF ~~ THEN leave_me_13
SAY @52
IF ~~ THEN + leave_me_14
END

IF ~~ THEN leave_me_14
SAY @53
IF ~~ THEN DO ~EraseJournalEntry(@100021) SetGlobal("C#Grey_SecondBG1Quest","GLOBAL",3) SetGlobal("C#Grey_SecondBG1QuestM","MYAREA",3)~ UNSOLVED_JOURNAL @100022 EXIT
END

IF ~~ THEN leave_me_15
SAY @54 
IF ~~ THEN + leave_me_16
END

IF ~~ THEN leave_me_16
SAY @55
IF ~~ THEN + leave_me_14
END

IF ~~ THEN leave_me_17
SAY @56
++ @49 + leave_me_15
++ @50 + leave_me_13
++ @51 + leave_me_08
END

IF ~Global("C#Grey_SecondBG1QuestM","MYAREA",3)~ THEN leave_me_18
SAY @57
+ ~Global("C#Grey_SecondBG1Quest","GLOBAL",4)~ + @25 + leave_me_19
+ ~Global("C#Grey_SecondBG1Quest","GLOBAL",4)~ + @58 + leave_me_20 
++ @59 + leave_me_22
END

IF ~~ THEN leave_me_19
SAY @60
IF ~~ THEN + leave_me_21
END

IF ~~ THEN leave_me_20
SAY @61
IF ~~ THEN + leave_me_21
END

IF ~~ THEN leave_me_21
SAY @62
IF ~~ THEN DO ~EraseJournalEntry(@100021) EraseJournalEntry(@100022) EraseJournalEntry(@100023) GiveItemCreate("MISC01",Player1,1,0,0) GiveItemCreate("MISC12",Player1,1,0,0) GiveItemCreate("AROW02",Player1,20,0,0) SetGlobal("C#Grey_SecondBG1QuestM","MYAREA",4) AddexperienceParty(300) EscapeAreaDestroy(5)~ SOLVED_JOURNAL @100024 EXIT
END

IF ~~ THEN leave_me_22
SAY @63
IF ~~ THEN EXIT
END





