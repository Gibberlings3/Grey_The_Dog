/* Grey SoD content */

/* doppelganger in Ducal Palace prison */
INTERJECT BDFFDOPP 24 C#Grey_BDFFDOPP_24
== c#greyj IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @0 /* (Sniff!) Grrrrr! */
END
++ @1 /* Grey! Stop growling at the man. */ + grey_int_1
+ ~Global("BD_REVEALED_DOPP","BD0116",0)~ + @2 /* My dog is growling at you, so there is something amiss! */ + 25
+ ~Global("BD_REVEALED_DOPP","BD0116",1)~ + @3 /* Yes, Grey, I know he's a doppelganger. */ + grey_int_1
++ @4 /* Silence! Stupid dog. */ + grey_int_1 


EXTEND_BOTTOM BDFFDOPP 26
+ ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ + @5 /* My dog growled at you, so you are not what you seem! What are you? */ + 29
END

EXTEND_BOTTOM BDFFDOPP 36
+ ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ + @6 /* You still didn't answer my question. Why did my dog growl at you? */ + 41
END


APPEND BDFFDOPP 

IF ~~ THEN grey_int_1
SAY @7 /* Nothing wrong in a little sniffing, eh? */
COPY_TRANS BDFFDOPP 24
END

END //APPEND

I_C_T BDFFDOPP 71 C#Grey_BDFFDOPP_71
== c#greyj IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @8 /* Grrrrr! */
END



/* Iron Throne HQ � Interior, Berta and Lon */

I_C_T BDLON 1 C#Grey_BDLON_1
== c#greyj IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @9 /* (Sniff!) (whines) */
== BDLON IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @10 /* No, I'm not... I'm not threatening you. I'm not threatening anyone! */
END


/* BD1000 missing refugees */

/*
~BDHEROD~
IF ~  True()
~ THEN BEGIN 2 // from: 
  SAY #43235 /* ~I'm afraid I have little to trade. When I fled the crusade, I had to leave much behind.~ */

IF ~~ THEN BEGIN 5 // from: 4.0 4.1 6.0 6.1 7.0 7.1 7.2
  SAY #43252 /* ~I don't know anything, really. But... you see that tall elf woman? Teleria's her name. She arrived right before the disappearances started. No one knows anything about her.~ */
*/

EXTEND_BOTTOM BDHEROD 5
+ ~Global("C#Grey_SoD_statues","GLOBAL",0)
OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ + @11 /* Maybe my dog could track your friends. Do you have any of their belongings to take up the scent? */ DO ~SetGlobal("C#Grey_SoD_statues","GLOBAL",1)~ + grey
END

EXTEND_BOTTOM BDHEROD 2
+ ~Global("C#Grey_SoD_statues","GLOBAL",0)
GlobalGT("BD_PET_MAIN","MYAREA",0)
GlobalLT("BD_PET_MAIN","MYAREA",4)
Global("bd_125_bought_golem","global",0)
OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ + @11 /* Maybe my dog could track your friends. Do you have any of their belongings to take up the scent? */ DO ~SetGlobal("C#Grey_SoD_statues","GLOBAL",1)~ + grey_02
END

APPEND BDHEROD 

IF ~~ THEN grey
SAY @12 /* Oh, that's a wonderful idea. Just let him sniff at the big crate over there. That's where we stashed their possessions after they disappeared. */
COPY_TRANS BDHEROD 5
END

IF ~~ THEN grey_02
SAY @12 /* Oh, that's a wonderful idea. Just let him sniff at the big crate over there. That's where we stashed their possessions after they disappeared. */
IF ~~ THEN EXIT
END

END//APPEND

/* confront Teleria with your findings */

EXTEND_BOTTOM BDTELERI 2
+ ~Global("C#Grey_SoD_statues","GLOBAL",2)~ + @13 /* I'm here indeed. My dog already helped me identify that these statues are the missing refugies. Why are we meeting here after I just asked you about them? */ + 10
END

/* chicken in the well easter egg */
I_C_T BDDOGW01 0 C#Grey_BDDOGW01_0
== c#greyj IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @14 /* Woof! Woof! */
END

/* sniff for Skie in bd3000 / bd4000 */
EXTEND_BOTTOM bdbence 35
+ ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
See("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ + @15 /* Do you have anything my dog could take up Skie's scent with? */ + grey_sniff
END

EXTEND_BOTTOM bdbence 41
+ ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
See("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ + @15 /* Do you have anything my dog could take up Skie's scent with? */ DO ~SetGlobal("C#Gr_bdbence","LOCALS",41)~ FLAGS 512 + grey_sniff
END

APPEND bdbence 
IF ~~ THEN grey_sniff
SAY @16 /* [Bence Duncan]Well, I have this, er, ribbon of her here... */ 
++ @17 /* Take the scent, Grey. Take Skie's scent! */ EXTERN C#GreyJ grey_sniff_04
++ @18 /* Riiight - I'm not ging to ask. Take the scent, Grey. */ EXTERN C#GreyJ grey_sniff_04
++ @19 /* You have a ribbon from Duke Silvershield's daugther in your pocket? */ + grey_sniff_01
+ ~!Global("C#Gr_bdbence","LOCALS",41)~ + @20 /* Don't worry, I'm sure I'll find her anyway. */ + grey_sniff_02
+ ~Global("C#Gr_bdbence","LOCALS",41)~ + @20 /* Don't worry, I'm sure I'll find her anyway. */ + grey_sniff_03
END

IF ~~ THEN grey_sniff_01
SAY @21 /* Do you want your dog to take up the scent or not? */
++ @17 /* Take the scent, Grey. Take Skie's scent! */ EXTERN C#GreyJ grey_sniff_04
+ ~!Global("C#Gr_bdbence","LOCALS",41)~ + @20 /* Don't worry, I'm sure I'll find her anyway. */ + grey_sniff_02
+ ~Global("C#Gr_bdbence","LOCALS",41)~ + @20 /* Don't worry, I'm sure I'll find her anyway. */ + grey_sniff_03
END

IF ~~ THEN grey_sniff_02
SAY @22 /* She's out there alone! */
COPY_TRANS bdbence 35
END

IF ~~ THEN grey_sniff_03
SAY @22 /* She's out there alone! */
COPY_TRANS bdbence 41
END
END //APPEND

APPEND C#GreyJ 
IF ~~ THEN grey_sniff_04
SAY @23 /* (sniff! sniff!) Woof! */ 
IF ~~ THEN DO ~SetGlobal("C#Gr_SoDSkieScent","GLOBAL",1)~ EXTERN bdbence grey_sniff_02
IF ~Global("C#Gr_bdbence","LOCALS",41)~ THEN DO ~SetGlobal("C#Gr_SoDSkieScent","GLOBAL",1)~ EXTERN bdbence grey_sniff_03
END
END //APPEND

/* Safana's traitor quest */
/* disable PID option to sniff Helvdar out in case he won't help */
ADD_TRANS_ACTION bdhelvda BEGIN 29 END BEGIN END ~SetGlobal("C#Grey_SearchHelvdarSoD","MYAREA",4)~

/* 9. Reaction to betrayal at the portal */
I_C_T BDHEPHER 16 C#Grey_SoDPortalScene
== c#greyj IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @24 /* (whines) */
END


/* portal is open, talk to Torsin de Lancie through the closed door */
I_C_T BDDELANC 75 C#Grey_BDDELANC_75
== c#greyj IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @25 /* (growls!) */
END

/* Thrix's game */

ADD_TRANS_TRIGGER BDTHRIX 13 ~OR(3) Global("C#GreyJoined","GLOBAL",0) !InMyArea("C#Grey") StateCheck("C#Grey",CD_STATE_NOTVALID)~ DO 2 IF ~!Is?f?ValidForPartyDialogue("Rasaad")~

/*
EXTEND_BOTTOM BDTHRIX 21 22 23 24 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 
*/

EXTEND_BOTTOM BDTHRIX 21 26 30 34 38 42 46 50 54 58 62 66 70 74 78 82 86 90
IF ~Global("C#Grey_SoDThrix","bd4500",0) InMyArea("C#Grey")
	OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
	!StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN DO ~SetGlobal("C#Grey_SoDThrix","bd4500",1)~ + grey
END

EXTEND_TOP BDTHRIX 22 27 31 35 39 43 47 51 55 59 63 67 71 75 79 83 87 91 #1
IF ~Global("C#Grey_SoDThrix","bd4500",0) InMyArea("C#Grey")
	OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
	!StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN DO ~SetGlobal("C#Grey_SoDThrix","bd4500",1)~ + grey
END

EXTEND_TOP BDTHRIX 23 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 #10
IF ~Global("C#Grey_SoDThrix","bd4500",0) InMyArea("C#Grey")
	OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
	!StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN DO ~SetGlobal("C#Grey_SoDThrix","bd4500",1)~ + grey
END

EXTEND_TOP BDTHRIX 24 29 33 37 41 45 49 53 57 61 65 69 73 77 81 85 89 93 #5
IF ~Global("C#Grey_SoDThrix","bd4500",0) InMyArea("C#Grey")
	OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
	!StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN DO ~SetGlobal("C#Grey_SoDThrix","bd4500",1)~ + grey
END


APPEND BDTHRIX

IF ~~ THEN BEGIN grey
  SAY @26 /* How about I take your loyal war dog. Is there a better amusement than to turn a loyal animal into a blood beast? */
= @27 /* Hm, actually, there is. I will not settle for a dog's soul. No, one of your other companions it will be. */
  IF ~RandomNum(4,1)~ THEN DO ~IncrementGlobal("BD_NumInParty","bd4500",1)~ EXTERN ~BDTHRIX~ 70
  IF ~RandomNum(4,2)~ THEN DO ~IncrementGlobal("BD_NumInParty","bd4500",1)~ EXTERN ~BDTHRIX~ 71
  IF ~RandomNum(4,3)~ THEN DO ~IncrementGlobal("BD_NumInParty","bd4500",1)~ EXTERN ~BDTHRIX~ 72
  IF ~RandomNum(4,4)~ THEN DO ~IncrementGlobal("BD_NumInParty","bd4500",1)~ EXTERN ~BDTHRIX~ 73
  IF ~!Global("BD_NumInParty","bd4500",1)
!Global("BD_NumInParty","bd4500",2)
!Global("BD_NumInParty","bd4500",3)
!Global("BD_NumInParty","bd4500",4)~ THEN EXTERN ~BDTHRIX~ 114
END

END //APPEND


/* SoD: hooded man came into prison (for PID) */
ADD_TRANS_ACTION BDIRENI BEGIN 69 END BEGIN END ~SetGlobal("C#Grey_MetHMSoD","GLOBAL",1)~

