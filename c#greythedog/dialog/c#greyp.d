

/* Kickout - dialogue */

BEGIN C#GREYP

/* This is the "kickout dialogue". Should only play if Grey is kicked out of party by reforming the group via the "reform party" button or if replaced by taking someone else in. Is ONLY true for Not In Party (=!InParty(Myself)) and Global("C#GreyJoined","GLOBAL",1). 
*/


IF ~!InParty(Myself) Global("C#GreyJoined","GLOBAL",1)~ THEN BEGIN out_of_party
SAY @0 /* ~Woof!~ */
++ @1 /* ~Stay - I need access to your inventory.~ */ DO ~JoinParty()~ EXIT
++ @2 /* ~Stay close, Grey! (Grey strolls off but you know he will still follow you.)~ */ + follow_charname
++ @3 /* ~I have no further use for you, Grey. Go back to Jondalar. Go!~ */ + leave
END

/* the other case - Grey is not in party but following as companion - is dealed with by the PID. */




IF ~~ leave
SAY @4 /* ~Woof! (whines)~ */
IF ~~ THEN DO ~SetGlobal("C#Grey_GreyJondalar","GLOBAL",3)
SetGlobal("C#GreyJoined","GLOBAL",0)
DestroyItem("c#grcol1")
DestroyItem("c#grcol2")
DestroyItem("c#grpaw1")
DestroyItem("c#grpaw3")
DestroyItem("c#grpaw6")
DestroyItem("c#grpaw9")
DestroyItem("c#grpa12")
DestroyItem("c#grpa15")
DestroyItem("c#grpa25")
GivePartyAllEquipment() EscapeArea()~ EXIT
END

IF ~~ follow_charname
SAY @0 /* ~Woof!~ */
IF ~~ THEN DO ~SetGlobal("C#GreyJoined","GLOBAL",2)
%Grey_MakeGlobalOverride%
ChangeEnemyAlly(Myself, FAMILIAR)
AddFamiliar()
SetDialog("C#GreyJ")
//ChangeAIScript("DEFAULT",CLASS)
ChangeAIScript("FIGHTER2",CLASS)
ChangeAIScript("",RACE)
ChangeAIScript("",GENERAL)
ChangeAIScript("",DEFAULT)~ EXIT
END


