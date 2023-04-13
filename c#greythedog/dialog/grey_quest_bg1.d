/* Grey's Quest: Doppelgangers */

BEGIN c#gr1mad

IF ~Global("C#Grey_BG1Quest","GLOBAL",0)~ THEN help_me
SAY @0 
IF ~~ THEN DO ~SetGlobal("C#Grey_BG1Quest","GLOBAL",1) 
GiveItemCreate("c#grkey1",[PC],1,0,0)~ UNSOLVED_JOURNAL @100011 EXIT
END

IF ~Global("C#Grey_BG1Quest","GLOBAL",1)
RandomNum(2,1)~ THEN help_me_01
SAY @1
IF ~~ THEN EXIT
END

IF ~Global("C#Grey_BG1Quest","GLOBAL",1)
RandomNum(2,2)~ THEN help_me_02
SAY @2
IF ~~ THEN EXIT
END

IF ~Global("C#Grey_BG1Quest","GLOBAL",2)~ help_me_03
SAY @3
IF ~~ THEN DO ~AddExperienceParty(250) 
EraseJournalEntry(@100011)
EraseJournalEntry(@100012)
EraseJournalEntry(@100014)
EraseJournalEntry(@100015) SetGlobal("C#Grey_BG1Quest","GLOBAL",3)~ SOLVED_JOURNAL @100013 EXIT
END

IF ~Global("C#Grey_BG1Quest","GLOBAL",3)~ help_me_04
SAY @4
IF ~~ THEN EXIT
END


BEGIN c#gr1tur

/* Taking advantage that the reply options are being executed bottom to top. Reply option "0" will only show if Grey is not present: */ 

IF ~Global("C#Grey_BG1Quest","GLOBAL",1)
Global("C#Grey_DopplegangerChange","LOCALS",0)~ THEN tur_00
SAY @5 
IF ~~ THEN DO ~IncrementGlobal("C#Grey_DopplegangerChange","LOCALS",1)
EraseJournalEntry(@100011)~ UNSOLVED_JOURNAL @100012 EXIT
IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN DO ~IncrementGlobal("C#Grey_DopplegangerChange","LOCALS",1)
EraseJournalEntry(@100011)~ UNSOLVED_JOURNAL @100012 EXTERN c#greyj see_you
END

CHAIN
IF ~~ THEN c#greyj see_you
@6 
= @7
== c#gr1tur @8
== c#greyj @9
END
IF ~~ THEN EXTERN c#gr1tur tur_01


APPEND c#gr1tur 

IF ~GlobalGT("C#Grey_DopplegangerChange","LOCALS",3)~ THEN tur_01
SAY @10
IF ~~ THEN DO ~SetGlobal("C#Grey_Doppleganger","LOCALS",1)
SetGlobal("C#Grey_BG1Quest","GLOBAL",2)
ForceSpell(Myself,DOPPLEGANGER_CHANGE_DEFAULT_LESSER)
Enemy()~ UNSOLVED_JOURNAL @100014 EXIT
END

IF ~GlobalLT("C#Grey_DopplegangerChange","LOCALS",4)~ THEN tur_02
SAY @11
IF ~~ THEN DO ~IncrementGlobal("C#Grey_DopplegangerChange","LOCALS",1)~ EXIT
IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN EXTERN c#greyj see_you
END

END //APPEND

