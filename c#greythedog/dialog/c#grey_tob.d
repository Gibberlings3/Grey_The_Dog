/* ToB */



/*
IF ~GlobalGT("Chapter","GLOBAL",7)~ THEN DO ~EscapeAreaMove("AR4500",450,3090,14)~ EXIT
IF ~GlobalLT("Chapter","GLOBAL",8)~ THEN DO ~EscapeAreaMove("AR0406",450,3090,14)~ EXIT
*/


//Fate spirit

/* conti game : GlobalGT("C#GreySpawn","GLOBAL",9) */

EXTEND_TOP FATESP 6

/* new game */
  IF ~Global("C#Grey_Exists","GLOBAL",0)
Global("C#Grey_SummonedVariable","GLOBAL",0)~ THEN 
   REPLY ~Bring me Grey, my faithful war dog.~  
    DO ~SetGlobal("C#Grey_SummonedVariable","GLOBAL",1)~ GOTO 9

/* conti game: Grey BG2 is dead */
  IF ~GlobalGT("C#Grey_Exists","GLOBAL",9)
Global("C#Grey_SummonedVariable","GLOBAL",0)
Dead("C#Grey")
~ THEN REPLY ~Bring me Grey, my faithful war dog.~ DO ~SetGlobal("C#Grey_SummonedVariable","GLOBAL",4)
~ GOTO 10    /* ~I cannot do as you ask, child of Bhaal. The one you seek is dead and thus forever beyond my reach. His thread no longer connects with yours.~ */

/* conti game: Grey was not in party BG2 */
  IF ~GlobalGT("C#Grey_Exists","GLOBAL",9)
Global("C#Grey_SummonedVariable","GLOBAL",0)
Global("C#Grey_GreyJondalar","GLOBAL",3)
!Dead("C#Grey")
~ THEN REPLY ~Bring me Grey, my faithful war dog.~ DO ~SetGlobal("C#Grey_SummonedVariable","GLOBAL",4)
~ GOTO 7  /* ~I cannot do as you ask, child of Bhaal. The thread of the one you speak is beyond my sight, as it no longer touches yours.~ */  
                                    
/* conti game: Grey BG2 in party */ 
  IF ~GlobalGT("C#Grey_Exists","GLOBAL",9)
Global("C#Grey_SummonedVariable","GLOBAL",0)
!Global("C#Grey_GreyJondalar","GLOBAL",3)
!Dead("C#Grey")
~ THEN REPLY ~Bring me Grey, my faithful war dog.~ DO ~SetGlobal("C#Grey_SummonedVariable","GLOBAL",1)
~ GOTO 9

END









BEGIN C#Grey25


IF ~Global("C#Grey_SummonedVariable","GLOBAL",2)~ THEN BEGIN tob
SAY ~Woof!... Woof, Woof!~
IF ~~ THEN REPLY ~Hi there! Come with me, Grey.~ DO ~SetGlobal("C#Grey_SummonedVariable","GLOBAL",3)~ + joinup
IF ~~ THEN REPLY ~Wait over there, Grey. I'll come back later.~ DO ~SetGlobal("C#Grey_SummonedVariable","GLOBAL",3)~ + shoo
END

IF ~~ THEN BEGIN shoo
SAY ~Whine... woof!~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN joinup
SAY ~Woof!~
IF ~~ THEN DO ~SetGlobal("C#GreyJoined","GLOBAL",1) JoinParty()~ EXIT
END


IF ~Global("C#GreyJoined","GLOBAL",0)~ THEN notyet
SAY ~Woof!~
++ ~Yes, come with me now.~ + joinup
++ ~No, not yet, Grey.~ + shoo
END



/* interjections ToB */

INTERJECT SARPROVF 0 C#GreySARPROVM_0
== c#greyj IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN ~Grrrrr!~ [c#GREY06]
END
+ ~!Global("ToldVampires","GLOBAL",1)~ + ~Grey! Stop growling at the lady.~ EXTERN SARPROVF grey_int 
+ ~Global("ToldVampires","GLOBAL",1)~ + ~Alright, old boy! I know what you are smelling.~ EXTERN SARPROVF grey_int  
+ ~!Global("ToldVampires","GLOBAL",1)~ + ~What is it, Grey?~ EXTERN SARPROVF grey_int 
++ ~Silence! Stupid dog.~ EXTERN SARPROVF grey_int 

APPEND SARPROVF 

IF ~~ THEN grey_int 
SAY ~Ahaha, seems like your little friend wants to play, too! Hmm? Sorry, but paying customers, only. (giggle)~
COPY_TRANS SARPROVF 0
END

END

INTERJECT SARPROVM 0 C#GreySARPROVF_0
== c#greyj IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN ~Grrrrr!~ [c#GREY06]
END
+ ~!Global("ToldVampires","GLOBAL",1)~ + ~Grey! Stop growling at the man.~ EXTERN SARPROVM grey_int 
+ ~Global("ToldVampires","GLOBAL",1)~ + ~Alright, old boy! I know what you are smelling.~ EXTERN SARPROVM grey_int  
+ ~!Global("ToldVampires","GLOBAL",1)~ + ~What is it, Grey?~ EXTERN SARPROVM grey_int 
++ ~Silence! Stupid dog.~ EXTERN SARPROVM grey_int 

APPEND SARPROVM 

IF ~~ THEN grey_int 
SAY ~Seems like your little friend wants to play, too! Hmm?~
= ~Sorry, buddy. But this is for your mistress, only.~
COPY_TRANS SARPROVM 0
END

END

INTERJECT FINSOL01 27 C#GreyFINSOL01_27
== c#greyj IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN ~Woof! Woof!~
END
++ ~Good boy! All excited, but no idea why, hmm?~ EXTERN c#greyj FINSOL01_27
++ ~Yes, I love you too, Grey.~ EXTERN c#greyj FINSOL01_27 
++ ~For the last time, shut up!~ EXTERN c#greyj FINSOL01_27 


APPEND c#greyj

IF ~~ THEN FINSOL01_27 
SAY ~Woof!~
COPY_TRANS FINSOL01 27
END

END