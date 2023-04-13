/* ~[Belegarm]I don't see how. You have more important stuff to do than chase a ham thief.~ */
I_C_T BDBELEGA %BDBELEGA_HU0% C#HU_SoD_GreyQuestInquiries
== C#husamJ IF ~AreaCheck("bd3000") OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) See("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @0 /* [Husam]I agree. <CHARNAME>, you know I have some ressources here as well. Let me know if I should gather information about this. My sources asking questions might be less suspicious than the hero of Baldur's Gate going around  - and we can use the time for more important things. */
END

CHAIN
IF WEIGHT #-1
~Global("C#HU_SoD_GreyQuestInquiries","GLOBAL",4)~ THEN C#HusamJ greys_ham
@1 /* [Husam]<CHARNAME>, I have news about the stolen ham Belegarm is looking for. */
== C#HusamJ IF ~GlobalLT("C#Grey_SoDQuest","GLOBAL",10)~ THEN @2 /* [Husam]It is starting to resurface here in the coalition camp. */
== C#HusamJ IF ~GlobalGT("C#Grey_SoDQuest","GLOBAL",9)~ THEN @3 /* [Husam]You already noticed that it is starting to resurface here in the coalition camp. */
== C#HusamJ @4 /* Ask me if you want to know the details. */
END
IF ~~ THEN DO ~SetGlobal("C#HU_SoD_GreyQuestInquiries","GLOBAL",5)~ EXIT

/* ~[Lester]Greetings, <PRO_SIRMAAM>. What can I do for you?~ */
EXTEND_BOTTOM c#grsq03 %c#grsq03_HU1%
+ ~Global("C#HU_SoD_GreyQuestInquiries","GLOBAL",5)~ + @5 /* Look, I know you have the ham in your bag. I got this information from a source you do not want to mess with, if you know what I mean. Want to come clean with me or do I have to tell your commander? */ + %c#grsq03_HU4%
END

/* ~[Lester]I surely didn't see any soldier handing out ham slices, <PRO_SIRMAAM>. I am sorry.~ */
EXTEND_BOTTOM c#grsq03 %c#grsq03_HU2%
+ ~Global("C#HU_SoD_GreyQuestInquiries","GLOBAL",5)~ + @5 /* Look, I know you have the ham in your bag. I got this information from a source you do not want to mess with, if you know what I mean. Want to come clean with me or do I have to tell your commander? */ + %c#grsq03_HU4%
END

/* ~[Lester]Like I said, I didn't see anyone handing out ham slices.~ */
EXTEND_BOTTOM c#grsq03 %c#grsq03_HU3%
+ ~Global("C#HU_SoD_GreyQuestInquiries","GLOBAL",5)~ + @5 /* Look, I know you have the ham in your bag. I got this information from a source you do not want to mess with, if you know what I mean. Want to come clean with me or do I have to tell your commander? */ + %c#grsq03_HU4%
END

CHAIN
IF WEIGHT #-1
~%IT_IS_SOD%
CombatCounter(0) !See([ENEMY]) 
InParty("C#Husam1")
OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#Grey") See(Player1)
!StateCheck("C#Grey",CD_STATE_NOTVALID)
!StateCheck("C#Husam1",CD_STATE_NOTVALID)
!StateCheck(Player1,CD_STATE_NOTVALID)
Global("C#HuSoD_GreyBanter","GLOBAL",0)~ THEN C#HusamB husam_grey_sod_01
@6 /* [Husam]Your Grey is a very valuable war dog, <CHARNAME> - excellent breed, excellent training. He'd make a lot of gold in several markets, some of them very shady. I have advised my men to keep an eye on him. With all the desparate refugees around, noone knows what absurd ideas might be floating around. */
DO ~SetGlobal("C#HuSoD_GreyBanter","GLOBAL",1)~

== bdimon IF ~InParty("%IMOEN_DV%") See("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @7 /* [Imoen]Man, Husam! For a moment I thought you said you told your men to snatch Grey away from us. But you meant that you are protecting him! That's neat. Noone is to get his hands on our Grey, hmm, you fluffy, giant puppy? */
== C#GreyJ IF ~InParty("%IMOEN_DV%") See("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @8 /* Woof! */

== BDCORWIJ IF ~InParty("Corwin") See("Corwin") !StateCheck("Corwin",CD_STATE_NOTVALID)~ THEN @9 /* [Corwin]It needs a thief's mind to think like a thief, I guess. We are very well capable of watching out for the dog ourselves! */
== C#HusamB IF ~InParty("Corwin") See("Corwin") !StateCheck("Corwin",CD_STATE_NOTVALID)~ THEN @10 /* [Husam]Sometimes it takes a thief's mind to think like a thief indeed, Captain. I doubt you would be ready for tranquilizer darts out of the shadows. And no - this was not a threat directed at you. I am still talking about how to snatch a dangerous dog. */

== bddynahj IF ~InMyArea("Dynaheir") InParty("Dynaheir") !StateCheck("Dynaheir",CD_STATE_NOTVALID)~ THEN @11 /* [Dynaheir]It is indeed a shame how need and hunger turns people into beasts. But thou has a good eye, Husam. This could indeed be something we should watch out for. */
== bdminscj IF ~InMyArea("Minsc") InParty("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @12 /* [Minsc]If anyone wants to come after Grey we will kick his butt, right, Boo? */ 
== bddynahj IF ~InMyArea("Dynaheir") InParty("Dynaheir") !StateCheck("Dynaheir",CD_STATE_NOTVALID)
InMyArea("Minsc") InParty("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @13 /* [Dynaheir]Minsc, those people are desparate. If we want to prevent them to become thieves, we need to put an end to the crusade and the chaos it spreads. */
== bdminscj IF ~InMyArea("Minsc") InParty("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)
InMyArea("Dynaheir") InParty("Dynaheir") !StateCheck("Dynaheir",CD_STATE_NOTVALID)~ THEN @14 /* [Minsc]Right! Boo agrees with my smart witch. Minsc agrees, too - even more evil butts to kick! */

== bdsafanj IF ~InMyArea("Safana") InParty("Safana") !StateCheck("Safana",CD_STATE_NOTVALID)~ THEN @15 /* [Safana]Stealing a *dog*? Why would anyone do that! */
== C#HusamB IF ~InMyArea("Safana") InParty("Safana") !StateCheck("Safana",CD_STATE_NOTVALID)~ THEN @16 /* [husam]It's more common than you might think, Safana. The market is there, and it is quite rewarding, if you know what you are doing. */
== bdsafanj IF ~InMyArea("Safana") InParty("Safana") !StateCheck("Safana",CD_STATE_NOTVALID)~ THEN @17 /* [Safana]Yes, I *know*, but there is so much you'd have to watch out for - you have to feed it, make sure it doesn't run away, it's big, and most of all - it can *bite*! Nah, I'll go for little trinkets, that's way better. */
== bdimon IF ~InParty("%IMOEN_DV%") See("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
InMyArea("Safana") InParty("Safana") !StateCheck("Safana",CD_STATE_NOTVALID)~ THEN @18 /* [Imoen]Heheh! Yes, that's what I wanted to say. */

== bdimon IF ~InParty("%IMOEN_DV%") See("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @19 /* [Imoen]I'll stick to gems any time. At least they don't bite! Nor run away. And also don't need to be fed. And you could even pet them, if you feel like it... No, *I*'m not doing that, I'm just sayin'. But some pockets feel as if they want to bite me, that's for sure... and some *do* feel like being licked by a slimy dog tongue when I reach inside. Yuck! */
END
++ @20 /* I appreciate the thought, Husam. */ EXTERN C#HusamJ grey_banter_1_02
++ @21 /* Are you setting your men onto valuable targets? */ EXTERN C#HusamJ grey_banter_1_03
++ @22 /* I don't want your men to "watch out" for any of us, Husam. */ EXTERN C#HusamJ grey_banter_1_04
++ @23 /* Just make sure they do not get in our way. */ EXTERN C#HusamJ grey_banter_1_02

/*
== bdjaheiJ IF ~InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID) See("Jaheira")~ THEN ~[Jaheira]~
== bdkhalij IF ~InMyArea("Khalid") InParty("Khalid") !StateCheck("Khalid",CD_STATE_NOTVALID)~ THEN 

== BDVICONB IF ~InParty("Viconia") See("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN ~[Viconia]~
== BDGLINTB IF ~InParty("Glint") See("Glint") !StateCheck("Glint",CD_STATE_NOTVALID)~ THEN ~[Glint]~

== bdneeraj IF ~InMyArea("Neera") InParty("Neera") !StateCheck("Neera",CD_STATE_NOTVALID)~ THEN 


== bdvoghij IF ~InMyArea("Voghiln") InParty("Voghiln") !StateCheck("Voghiln",CD_STATE_NOTVALID)~ THEN 
*/

APPEND C#husamJ
IF ~~ THEN grey_banter_1_02
SAY @24 /* [Husam]Grey is very capable of defending himself, but there is lots of ways to catch a dog. I figured we don't need that. */
IF ~~ THEN EXIT
END

IF ~~ THEN grey_banter_1_03
SAY @25 /* [Husam]Absolutely not. Even without our alliance, your dog would be far too small a target for an operation led by me. */
IF ~~ THEN + grey_banter_1_02
END

IF ~~ THEN grey_banter_1_04
SAY @26 /* [Husam]Noted, but you can't blame me for wanting my allies to stay unharmed - saves me a lot of trouble in the long run. I also need my contacts near so I can reach them quickly, so I can't pull all of them. */
IF ~~ THEN EXIT
END
END //APPEND