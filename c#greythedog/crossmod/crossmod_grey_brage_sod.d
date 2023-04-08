/* rest talk */

CHAIN
IF WEIGHT #-1 
~Global("C#Brage_GreySoD","GLOBAL",1)~ THEN C#BrageJ resttalk_grey_meat
@11 /* ~Yes, Grey. Wait until I finished removing the bone, then you can have it.~ */
== IF_FILE_EXISTS BDAJANTB IF ~InParty("Ajantis") See("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN @12 /* ~[Ajantis]Yes, the way Grey is looking over one's shoulder if one tends to one's things can be a tad... unnerving at times. Even if I don't have to suspect he'll snatch my weapons out of my hands as he might the meat from yours.~ */
== IF_FILE_EXISTS BDIMOENB IF ~InParty("%IMOEN_DV%") See("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
InParty("Ajantis") See("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN @13 /* ~[Imoen]Aw, he'll never do that. He's patiently waiting, aren't you, Grey?~ */
== C#GreyJ @14 /* ~[Grey]Woof!~ */
== IF_FILE_EXISTS BDIMOENB IF ~InParty("%IMOEN_DV%") See("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @15 /* ~[Imoen]How about we give you something now! Catch, Grey!~ */
== IF_FILE_EXISTS BDAJANTB IF ~InParty("Ajantis") See("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)
InParty("%IMOEN_DV%") See("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @16 /* ~[Ajantis]Imoen! That was a piece of the best meat!~ */
== IF_FILE_EXISTS BDIMOENB IF ~InParty("%IMOEN_DV%") See("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
InParty("Ajantis") See("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN @17 /* ~[Imoen]Yeah, so? He's a travel compagnion, so he deserves his share, no?~ */
== IF_FILE_EXISTS BDAJANTB IF ~InParty("Ajantis") See("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)
InParty("%IMOEN_DV%") See("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @18 /* ~[Ajantis]Yes, of course he has a right to his share, but...~ */
== C#BrageB IF ~InParty("%IMOEN_DV%") See("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @19 /* ~[Brage]Imoen, Grey will get a huge share of our kill already. No need to feed him from what should nourish *us*.~ */
== IF_FILE_EXISTS BDIMOENB IF ~InParty("%IMOEN_DV%") See("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @20 /* ~[Imoen]Great share, yes - but only because we are not interested in the bones! I am sure *he* would willingly share his bones with us, now wouldn't you, you little furry gilly gilly goodywoo!~ */
== C#GreyJ @22 /* ~[Grey]Woof!~ [C#Grey01] */
== C#BrageB @21 /* ~[Brage]Just another instant. There will be enough for everyone.~ */
END
IF ~~ THEN DO ~SetGlobal("C#Brage_GreySoD","GLOBAL",2) RestParty()~ EXIT


/* Brage's quest: Grey sniffs for Tilda */

/*
@9 /* [Uncle]I will return to the big allied camp, I hope the healers can help me with that foot. You'll find me somewhere around the healing tents. Thank you *so* much for your help! */
%first_meeting_03%
*/
ADD_TRANS_TRIGGER c#besq02 %first_meeting_03% ~OR(4)
!Global("C#Brage_SoDQuest","GLOBAL",3)
Global("C#GreyJoined","GLOBAL",0)
!See("C#Grey") StateCheck("C#Grey",CD_STATE_NOTVALID)~ 

EXTEND_BOTTOM c#besq02 %first_meeting_03%
+ ~Global("C#Brage_SoDQuest","GLOBAL",3)
OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
See("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ + @23 /* ~One moment. Do you have anything my dog could take up Tilda's scent with? And from where would we start searching?~ */ + grey_sniff
+ ~Global("C#Brage_SoDQuest","GLOBAL",3)
OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
See("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ + @24 /* ~Save return.~ */ + bye
END

/* @241 = [Uncle]Any news about my niece?~ %in_coalition_camp_general% */
EXTEND_BOTTOM c#besq02 %in_coalition_camp_general%
+ ~Global("C#Brage_SoDQuest","GLOBAL",3)
OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
See("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ + @23 /* ~One moment. Do you have anything my dog could take up Tilda's scent with? And from where would we start searching?~ */ + grey_sniff
END

CHAIN
IF ~~ THEN c#besq02 grey_sniff
@25 /* ~[Uncle]Oh, indeed, I have. Here, take the scent from her scarf - she wouldn't wear it today. She usually sleeps in it so it should smell more of her than me.~ */
DO ~SetGlobal("C#Gr_SoDBrageQuestScent","GLOBAL",1)~
== C#GreyJ @27 /* ~(sniff! sniff!) Woof!~ */
== c#besq02 @28 /* ~And we were separated somewhere more up to the north - that much I know. I am sorry that I cannot provide more detailed information. Oh, my poor Tilda...~ */
EXIT

APPEND c#besq02
IF ~~ THEN bye
SAY @26 /* ~[Uncle]Thank you, kind stranger. I'll pray for your success.~ */
IF ~~ THEN EXIT
END
END //APPEND
