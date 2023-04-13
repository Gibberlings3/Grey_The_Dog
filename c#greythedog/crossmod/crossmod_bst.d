/* Global("bsDoppelAttacked","MYAREA",1) */

I_C_T3 BSTAIL02 0 C#GR_BSTAIL02_0
== C#GreyJ IF ~Global("C#GR_BSTSmellsTaylor","MYAREA",0)
OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#Grey") See(Player1)
!StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @0 /* (sniff!) */
== C#GreyJ IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @1 /* Grrrrr! */
DO ~SetGlobal("C#GR_BSTAIL02_0","GLOBAL",0)~
== BSTAIL02 IF ~Global("C#GR_BSTSmellsTaylor","MYAREA",0)
OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @2 /* Ah, good dog! You smell the dyes I worked with, yes? Some of them have a rather stenuous... scent when applied. */ 
DO ~IncrementGlobal("C#GR_BSTSmellsTaylor","MYAREA",1)~
== BSTAIL02 IF ~Global("C#GR_BSTSmellsTaylor","MYAREA",1)
OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @3 /* Yes, yes - I'll go wash my hands in a minute. */
DO ~IncrementGlobal("C#GR_BSTSmellsTaylor","MYAREA",1)~
== BSTAIL02 IF ~Global("C#GR_BSTSmellsTaylor","MYAREA",2)
OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @4 /* Ah, that dog. It's a little annoying to be growled at like that, I have to sssay. */
DO ~IncrementGlobal("C#GR_BSTSmellsTaylor","MYAREA",1)~
END

INTERJECT BSTAIL02 0 C#GR_BSTAIL02_0
== c#greyj IF ~Global("C#GR_BSTSmellsTaylor","MYAREA",3)
OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @1 /* Grrrrr! */
DO ~SetGlobal("C#GR_BSTAIL02_0","GLOBAL",0)~
END
++ @5 /* Grey! Stop growling at the lady. */ EXTERN BSTAIL02 grey_int_1
++ @6 /* My dog is growling at you, so there is something amiss! */ EXTERN BSTAIL02 grey_int_1
++ @7 /* Silence! Stupid dog. */ EXTERN BSTAIL02 grey_int_1  


APPEND BSTAIL02 
IF ~~ THEN grey_int_1
SAY @8 /* It's just the dyes. Just the dyessss... */
COPY_TRANS BSTAIL02 0
END
END //APPEND

ADD_TRANS_TRIGGER BSTAILOR 1 ~OR(2) 
	Global("C#GR_BSTSmellsTaylor","MYAREA",0)
	Global("C#Grey_SniffedDoppelG","GLOBAL",0)~

ADD_TRANS_ACTION BSTAILOR BEGIN 2 END BEGIN END ~SetGlobal("C#Grey_SniffedDoppelG","GLOBAL",1) AddJournalEntry(@100025,INFO)~

EXTEND_BOTTOM BSTAILOR 1
+ ~GlobalGT("C#GR_BSTSmellsTaylor","MYAREA",0)
Global("C#Grey_SniffedDoppelG","GLOBAL",1)~ + @9 /* I think there is something wrong with your assistant. Last time my dog sniffed and growled at someone like that, they turned out to be a doppelganger! */ + found_secret
+ ~GlobalGT("C#GR_BSTSmellsTaylor","MYAREA",0)
Global("C#Grey_SniffedDoppelG","GLOBAL",1)~ + @10 /* Good day to you. */ + farewell
END

APPEND BSTAILOR 
IF ~~ THEN farewell
SAY @11 /* Farewell. */
IF ~~ THEN EXIT
END

IF ~~ THEN found_secret
SAY @12 /* A doppelganger? Your dog can smell them, you say? */
IF ~~ THEN DO ~AddJournalEntry(@100026,INFO)
SetGlobal("bsDoppelAttacked","MYAREA",1)~ + 2
END
END //APPEND

/* Prison guard BSPRGRD1 */
/* 
IF ~~ THEN BEGIN 5 // from:
  SAY #83631 /* ~Don't ye listen to his nonsense. He's no idea what he's talkin' about. These dungeons are perfectly safe.~ */
*/
I_C_T BSPRGRD1 5 C#GR_BSPRGRD1_5
== C#GreyJ IF ~Global("C#GR_BSTSmellsTaylor","MYAREA",0)
OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @0 /* (sniff!) */
END

INTERJECT BSPRGRD1 7 C#GR_BSPRGRD1_7
== c#greyj IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @1 /* Grrrrr! */
END
++ @13 /* Grey! Stop growling at the soldier. */ EXTERN BSPRGRD1 grey_int_1
++ @6 /* My dog is growling at you, so there is something amiss! */ EXTERN BSPRGRD1 grey_int_1
++ @7 /* Silence! Stupid dog. */ EXTERN BSPRGRD1 grey_int_1  


APPEND BSPRGRD1 
IF ~~ THEN grey_int_1
SAY @14 /* Of course there is something amissss. You just told us! */
COPY_TRANS BSPRGRD1 7
END
END //APPEND

EXTEND_BOTTOM BSPRGRD2 15
+ ~Global("C#Grey_SniffedDoppelG","GLOBAL",1)
Global("bsDoppelgangerQuest","GLOBAL",1)
Global("C#GR_BSPRGRD1_7","GLOBAL",1)~ + @15 /* From my dog's reaction I fear your comrade wasn't who he seemed to be - maybe even a doppelganger. */ DO ~SetGlobal("C#GR_BSPRGRD1_7","GLOBAL",2)~ + suspicion
END

EXTEND_BOTTOM BSPRGRD2 16
IF ~Global("C#GR_BSPRGRD1_7","GLOBAL",2)~ THEN + really
END

EXTEND_BOTTOM BSPRGRD2 17
IF ~Global("C#GR_BSPRGRD1_7","GLOBAL",2)~ THEN + really
END

APPEND BSPRGRD2
IF ~~ THEN suspicion
SAY @16 /* Well... I admit he seemed to be occupied the last days, but - a doppelganger? Wouldn't they try to kill? I think that's a bit far fetched. */
IF ~~ THEN EXIT
END

IF ~~ THEN really
SAY @17 /* So it was really true and your dog sensed it all along?! */
IF ~~ THEN + 18
END
END //APPEND

EXTEND_BOTTOM BSPRGRD2 17
IF ~~ THEN DO ~SetGlobal("bsInTheLoop","LOCALS",2)~ + 19
END

/* In Commander's office */

ADD_TRANS_ACTION YSSGT3 BEGIN 2 3 END BEGIN END ~SetGlobal("C#Grey_SniffedDoppelG","GLOBAL",1) 
AddJournalEntry(@100025,INFO) AddJournalEntry(@100026,INFO)~

I_C_T BSPRGRD1 0 C#GR_BSPRGRD1_0
== C#GreyJ IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @1 /* Grrrrr! */
END

/* Seatower Mage and his experiment */

EXTEND_BOTTOM BSTRMAGE 21
+ ~!Global("bsBlackPearlQuest","GLOBAL",0)
Global("bsDoppelgangerQuest","GLOBAL",1)
OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ + @18 /* Doppelganger! My dog seem to be able to smell them out - most of the times. */ + grey
END

EXTEND_BOTTOM BSTRMAGE 22
+ ~Global("bsDoppelgangerQuest","GLOBAL",1)
OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ + @18 /* Doppelganger! My dog seem to be able to smell them out - most of the times. */ + grey
END

APPEND BSTRMAGE
IF ~~ THEN grey
SAY @19 /* Indeed? That is an impressive trick. I'd be a bit unsettled by the "most of the times" part, though. My invention will have a 100% accuracy, I believe. And it doesn't lose any hair. */
COPY_TRANS BSTRMAGE 22
END
END //APPEND

/* doppelgangers on the Seatower ground. Grey can't sniff them as well because of the tanner's stink */

ADD_TRANS_ACTION BSDPGRD2 BEGIN 6 END BEGIN END ~SetGlobal("C#Grey_SniffedDoppelG","GLOBAL",1) 
AddJournalEntry(@100025,INFO) AddJournalEntry(@100026,INFO)~

I_C_T BSDPGRD2 0 C#GR_BSDPGRD2
== C#GreyJ IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @20 /* (sniff! sniff!) */
DO ~SetGlobal("C#GR_BSDPGRD2","GLOBAL",0)~END

I_C_T BSDPGRD2 1 C#GR_BSDPGRD2
== C#GreyJ IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @1 /* Grrrrr! */
DO ~SetGlobal("C#GR_BSDPGRD2","GLOBAL",0)~
END

I_C_T BSDPGRD2 2 C#GR_BSDPGRD2
== C#GreyJ IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @0 /* (sniff!) */
DO ~SetGlobal("C#GR_BSDPGRD2","GLOBAL",0)~
END

I_C_T BSDPGRD2 3 C#GR_BSDPGRD2
== C#GreyJ IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @20 /* (sniff! sniff!) */
DO ~SetGlobal("C#GR_BSDPGRD2","GLOBAL",0)~
END

I_C_T BSDPGRD2 4 C#GR_BSDPGRD2
== C#GreyJ IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @0 /* (sniff!) */
DO ~SetGlobal("C#GR_BSDPGRD2","GLOBAL",0)~
END

/* doppelganger smugglers */
I_C_T BSSMGL07 0 C#GR_BSSMGL07_0
== C#GreyJ IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN @1 /* Grrrrr! */
END
