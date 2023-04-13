
/* Belegarm is suspicious from the start */
APPEND BDBELEGA 
IF WEIGHT #-1
~Global("C#Grey_SoDQuest","GLOBAL",0)
OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)
See(Player1)
!StateCheck(Player1,CD_STATE_NOTVALID)~ THEN grey_sniffs
SAY @5 /* [Belegarm]Greet... - Is that dog of yours sniffing my storage tent? You better watch out it doesn't steal any food meant to stock the coalition forces. Hero of Baldur's Gate or not, I will not let it slide! */
++ @6 /* Grey is a well trained war dog. He'd never do such a thing. */ DO ~SetGlobal("C#Grey_SoDQuest","GLOBAL",1) RealSetGlobalTimer("C#Grey_SoDQuestTimer","GLOBAL",5500)~ + grey_sniffs_03
++ @7 /* I'll keep it in mind. */ DO ~SetGlobal("C#Grey_SoDQuest","GLOBAL",1) RealSetGlobalTimer("C#Grey_SoDQuestTimer","GLOBAL",5500)~ + grey_sniffs_03
++ @8 /* Do you hear yourself talking? */ DO ~SetGlobal("C#Grey_SoDQuest","GLOBAL",1) RealSetGlobalTimer("C#Grey_SoDQuestTimer","GLOBAL",5500)~ + grey_sniffs_01
END

IF ~~ THEN grey_sniffs_01
SAY @9 /* [Belegarm]No hard feelings, I'm just protecting my stock. */
IF ~~ THEN EXIT
IF ~Global("bd_belegarm_first_time","GLOBAL",0)~ THEN + grey_sniffs_02
END

IF ~~ THEN grey_sniffs_02
SAY @10 /* [Belegarm]Anyway, back to what I wanted to say. */
IF ~~ THEN + 0
END

IF ~~ THEN grey_sniffs_03
SAY @11 /* [Belegarm]You better make sure of it! Noone gets special treatment here. */
+ ~!Global("bd_belegarm_first_time","GLOBAL",0)~ + @12 /* And that's absolutely understandable. Grey won't make any troubles, I asure you. */ + grey_sniffs_01
+ ~Global("bd_belegarm_first_time","GLOBAL",0)~ + @12 /* And that's absolutely understandable. Grey won't make any troubles, I asure you. */ + grey_sniffs_02
++ @13 /* Yes, I got it, thanks! */ + grey_sniffs_01
++ @8 /* Do you hear yourself talking? */ + grey_sniffs_01
END
END //APPEND


/* FF soldier messenger */
BEGIN C#GRSQ02
IF ~True()~ THEN about_ham
SAY @14 /* [female FF Scout]<CHARNAME>! Forgive the bother. I am here to inform you that it would be good if you'd speak to Belegarm - there was a theft from inside the storage tent. */
++ @15 /* I'll go to him as fast as possible. */ + about_ham_03
++ @16 /* Please tell me he doesn't suspect Grey taking something. */ + about_ham_02
++ @17 /* I don't think this is my problem. */ + about_ham_03
END

IF ~~ THEN about_ham_01
SAY @18 /* [female FF Scout]I'll leave it up to you. */
IF ~~ THEN DO ~SetGlobal("C#Grey_SoDQuest","GLOBAL",3) RealSetGlobalTimer("C#Grey_SoDQuestTimer","GLOBAL",1200)~ UNSOLVED_JOURNAL @100501
EXIT
END

IF ~~ THEN about_ham_02
SAY @19 /* [female FF Scout]That... might have been the reason why I am telling you about it. */
IF ~~ THEN + about_ham_03
END

IF ~~ THEN about_ham_03
SAY @20 /* [female FF Scout]He did not send for you explicitely, but considering how suspicious he was of your dog in general, we decided to let you know so you can clear the situation fast, before any misunderstandings occur. */
++ @21 /* "We" being who?... */ + about_ham_05
++ @22 /* That's fair. Thank you. */ + about_ham_04
++ @23 /* Fine, I'll talk to him. */ + about_ham_04
++ @24 /* He'd better hold back on suspicions. I don't have time for this. */ + about_ham_01
END

IF ~~ THEN about_ham_04
SAY @25 /* [female FF Scout]My pleasure, Hero. */
IF ~~ THEN DO ~SetGlobal("C#Grey_SoDQuest","GLOBAL",3) RealSetGlobalTimer("C#Grey_SoDQuestTimer","GLOBAL",1200)~ UNSOLVED_JOURNAL @100501
EXIT
END

IF ~~ THEN about_ham_05
SAY @26 /* [female FF Scout]Us soldiers being involved into the investigation. */
+ ~Global("bd_bridgefort_sabotaged","GLOBAL",0)~ + @22 /* That's fair. Thank you. */ + about_ham_04
+ ~Global("bd_bridgefort_sabotaged","GLOBAL",0)~ + @23 /* Fine, I'll talk to him. */ + about_ham_04
+ ~Global("bd_bridgefort_sabotaged","GLOBAL",1)~ + @22 /* That's fair. Thank you. */ + about_ham_01
+ ~Global("bd_bridgefort_sabotaged","GLOBAL",1)~ + @23 /* Fine, I'll talk to him. */ + about_ham_01
++ @24 /* He'd better hold back on suspicions. I don't have time for this. */ + about_ham_01
END

/* confront Belegarm */

EXTEND_BOTTOM BDBELEGA 1
+ ~Global("C#Grey_SoDQuest","GLOBAL",3)
!AreaCheck("bd4100")~ + @27 /* There was an incident with something being taken from the storage tent, I was told? */ + ham_01
+ ~GlobalGT("C#Grey_SoDQuest","GLOBAL",3)
GlobalLT("C#Grey_SoDQuest","GLOBAL",20)~ + @28 /* About the missing ham... */ + ham_update
END


APPEND BDBELEGA 

IF ~~ THEN ham_update
SAY @29 /* [Belegarm]What of it? Did you find it? */
+ ~Global("C#Grey_SoDQuest","GLOBAL",19)~ + @30 /* No, and I can tell you with sincerity that we won't find it again. I can only advice you to stop looking for it, too. */ DO ~SetGlobal("C#Grey_SoDQuest","GLOBAL",20)~ + ham_update_07
+ ~Global("C#Grey_SoDQuest","GLOBAL",19)~ + @31 /* In a way, yes, but it's in no shape to be handed back and I decided the matter on my own. This is of no further concern to you. */ DO ~SetGlobal("C#Grey_SoDQuest","GLOBAL",20)~ + ham_update_08
+ ~OR(2) Global("C#Gr_SoDQuestSniffRefu","MYAREA",2)
Global("C#Grey_SoDKnowScald","GLOBAL",2)
GlobalLT("C#Grey_SoDQuest","GLOBAL",11)~ + @32 /* Well - seems there is someone running around dressed as a soldier, handing out slices to the refugees, pretending it's from the city's authorities. */ + ham_bd3000_04
+ ~Global("C#Gr_SoDFoundHamLester","MYAREA",1)
GlobalLT("C#Grey_SoDQuest","GLOBAL",11)
Global("C#Grey_StolenSlices","LOCALS",0)~ + @33 /* I retrieved some of it in slices, but didn't pursue this further yet. */ DO ~SetGlobal("C#Grey_StolenSlices","LOCALS",1)~ + ham_update_09
+ ~GlobalLT("C#Grey_SoDQuest","GLOBAL",8)
!Global("C#Gr_SoDQuestSniffRefu","MYAREA",2)
!Global("C#Grey_SoDKnowScald","GLOBAL",2)
!Global("C#Gr_SoDFoundHamLester","MYAREA",1)~ + @34 /* No trace of it so far. */ + ham_update_01
+ ~Global("C#Grey_SoDQuest","GLOBAL",8) Global("C#Grey_TalkAboutBoy","LOCALS",0)~ + @35 /* I might have obtained a slice - from a refugee boy. */ DO ~SetGlobal("C#Grey_TalkAboutBoy","LOCALS",1)~ + ham_update_03
+ ~AreaCheck("bd3000") Global("C#Grey_officersreactions","LOCALS",0)~ + @36 /* How did the officers take it? You still got both your arms, as far as I can see. */ DO ~SetGlobal("C#Grey_officersreactions","LOCALS",1)~ + ham_update_06
+ ~Global("C#Grey_anything stolen","LOCALS",0)~ + @37 /* Anything else being stolen since then? */ + ham_update_02
++ @38 /* I'm still on it. */ + ham_update_01
++ @39 /* I won't search for the ham thief any more. Just so you know. */ + ham_bd3000_01
END

IF ~~ THEN ham_update_01
SAY @40 /* [Belegarm]Like I thought. Very well... back to work for me, I guess. */
IF ~~ THEN EXIT
END

IF ~~ THEN ham_update_02
SAY @41 /* [Belegarm]No, nothing that huge or "important". Seems the increased watch payed off. A pearl to us it will stay this way. */
IF ~~ THEN DO ~SetGlobal("C#Grey_anything stolen","LOCALS",1)~ EXIT
END

IF ~~ THEN ham_update_03
SAY @42 /* [Belegarm]A BOY running around handing out slices - see, I said refugees where the thieves. I never liked civilians near the camps. Any chance you might find him again? */ 
++ @43 /* No, I'm afraid not. */ + ham_update_04
++ @44 /* I didn't see him again, I doubt it. */ + ham_update_04
++ @45 /* Even if, I don't think it will answer much to be honest. He seemed to have it for quite a while. */ + ham_update_05
++ @46 /* Well, he mentioned that he might get more if he wanted to, which would hint at some kind of source here in the camp. */ + ham_update_05
END

IF ~~ THEN ham_update_04
SAY @47 /* [Belegarm]What, precious little dog nose failing for this? - No offense, just kidding around. */
IF ~~ THEN + ham_update_05
END

IF ~~ THEN ham_update_05
SAY @48 /* [Belegarm]Well, maybe it won't be the last piece surfacing. There is hope. Let's see how this plays out. */
IF ~~ THEN EXIT
END

IF ~~ THEN ham_update_06
SAY @49 /* [Belegarm]Hahaha! Indeed, I have. Well, they aren't stupid - they know these things can happen with many desparate civilians around. They are rather pleased there were no grave thefts from the provisions. I'll be fine - fortunately, I won't have anything to do with any *political* implications with regard to the sponsors. Thanks for asking. */
IF ~~ THEN EXIT
END

IF ~~ THEN ham_update_07
SAY @50 /* [Belegarm]You sound like you are very sure of it. Very well, at least that's settled, then. Now we can think about how to deal with the political consequences of such a gift going missing, but that won't concern you. */
IF ~~ THEN EXIT
END

IF ~~ THEN ham_update_08
SAY @51 /* [Belegarm]Is that so? And you think you can decide whether the thief should be punished, and how? Well, aren't you a hero if I ever saw one, pfeh. Very well, at least that's settled, then. Now we can think about how to deal with the political consequences of such a gift going missing, but that I guess that would be of no importance to a hero of the city, eh? */
IF ~~ THEN EXIT
END

IF ~~ THEN ham_update_09
SAY @52 /* [Belegarm]So it did resurface, I'll be damned. Well, I'm sure you didn't find it lying in the dirt. So go and ask the person it belonged to! */
IF ~~ THEN EXIT
END

IF ~~ THEN ham_01
SAY @53 /* [Belegarm]Oh, of course. If something goes wrong, everyone gets the memo right away, I suppose! A hock of the finest ham was stolen and we have not the slightest clue who did it. Why, what is it to you? Did your dog take it? */
++ @54 /* No, but a friendly scout informed me, saying it might be wise to clear up any possible misunderstandings. */ + ham_02_b
++ @55 /* No, he didn't, and neither did I. */ + ham_03
++ @56 /* Don't be rediculous. */ + ham_02
++ @57 /* You have no idea who the thief would be, but are throwing accusations because you don't like me? */ + ham_02_a
END

IF ~~ THEN ham_02
SAY @58 /* [Belegarm]Just sounding things out. */
IF ~~ THEN + ham_03
END

IF ~~ THEN ham_02_a
SAY @59 /* [Belegarm]What, fragile hero soul got shaken just by hearing an accusation like that? */
IF ~~ THEN + ham_03
END

IF ~~ THEN ham_02_b
SAY @60 /* [Belegarm]Did they now. */
IF ~~ THEN + ham_03
END

IF ~~ THEN ham_03
SAY @61 /* [Belegarm]I know it was not your dog - probably. A WHOLE hock of ham was stolen, that's 8 pounds including the bone. I guess someone would've noticed your dog chewing on that. Plus, it hung from the tent's ceiling. */
++ @62 /* I was a bit worried there. It's great to see your common sense did not leave you. */ + ham_04
++ @63 /* Is there anything you expect from me? */ + ham_03_b
++ @64 /* How come the war provisions contain a very fine ham? I wouldn't have expected this to be part of the soldiers' rations. */ + ham_05_b
++ @65 /* So, there is one ham less. What's the big deal? */ + ham_05
++ @66 /* Can I help somehow? */ + ham_07
++ @67 /* If that's all, I'll be on my way. */ + ham_14
END

IF ~~ THEN ham_03_b
SAY @68 /* [Belegarm]Well, not going around and spreading the news would be great, you know. Doesn't exactly improve morale if people fear for their sustainment. */
++ @64 /* How come the war provisions contain a very fine ham? I wouldn't have expected this to be part of the soldiers' rations. */ + ham_05_b
++ @65 /* So, there is one ham less. What's the big deal? */ + ham_05
++ @66 /* Can I help somehow? */ + ham_07
++ @67 /* If that's all, I'll be on my way. */ + ham_14
END

IF ~~ THEN ham_04
SAY @69 /* [Belegarm]Words of praise from the Hero. Ain't I the lucky one. */
++ @63 /* Is there anything you expect from me? */ + ham_03_b
++ @64 /* How come the war provisions contain a very fine ham? I wouldn't have expected this to be part of the soldiers' rations. */ + ham_05_b
++ @65 /* So, there is one ham less. What's the big deal? */ + ham_05
++ @66 /* Can I help somehow? */ + ham_07
++ @67 /* If that's all, I'll be on my way. */ + ham_14
END

IF ~~ THEN ham_05
SAY @70 /* [Belegarm]Big deal? I guess the war against the crusade will not be decided by it, but it was a theft from the Flaming Fist's provisions - plus, this ham was meant for the officers! */
IF ~~ THEN + ham_05_c
END

IF ~~ THEN ham_05_b
SAY @71 /* [Belegarm]It isn't. It was meant for the officers. */
IF ~~ THEN + ham_05_c
END

IF ~~ THEN ham_05_c
SAY @72 /* [Belegarm]It was a very special ham, jerked with an extra mix of rare herbs - don't look at me, it was sponsored by one of the noble families of the Gates, and seeing the hock I got why the Dukes didn't want to say no to it. Stupid thing - I knew it meant trouble the moment the "special officers' ham" entered my stock. I guess it was too attractive, eh. */
++ @73 /* I see. This must be very inconvenient for you as the quartermaster. */ + ham_05_e
++ @66 /* Can I help somehow? */ + ham_07
+ ~!AreaCheck("bd3000")~ + @74 /* What - Captain Corwin and Bence Duncan? Haha! I am sure they can live without some ham for now. */ + ham_06
+ ~AreaCheck("bd3000")~ + @75 /* I am sure they can live without some ham for now. */ + ham_05_d
++ @67 /* If that's all, I'll be on my way. */ + ham_14
END

IF ~~ THEN ham_05_d
SAY @76 /* [Belegarm]I guess everything is simple if you aren't responsible and won't have to deal with the consequences, eh? */
IF ~~ THEN + ham_09
END

IF ~~ THEN ham_05_e
SAY @77 /* [Belegarm]Enjoy rubbing salt into the wound? */
++ @78 /* Not at all. I get the pressure you are under. */ + ham_05_f
++ @66 /* Can I help somehow? */ + ham_07
++ @67 /* If that's all, I'll be on my way. */ + ham_14
END

IF ~~ THEN ham_05_f
SAY @79 /* [Belegarm]Well - thanks. Not your problem, though, so don't worry too much. We got it under control. */
++ @66 /* Can I help somehow? */ + ham_07
++ @67 /* If that's all, I'll be on my way. */ + ham_14
END

IF ~~ THEN ham_06
SAY @80 /* [Belegarm]I said OFFICERS! That's MARSHAL Nederlok and his lieutenants in the big coalition camp to you! */
IF ~~ THEN + ham_05_d
END

IF ~~ THEN ham_07
SAY @81 /* [Belegarm]Do you have any clues about who the thief could be? Or - do you want to offer your dog sniffing them out? What a rediculous thought, a dog inside a storage tent full of food. */
++ @82 /* Is it that rediculous? Grey is well trained, he could take on a scent I am sure. */ + ham_08
++ @83 /* Well, I'll be on my way, then. */ + ham_14
END

IF ~~ THEN ham_08
SAY @84 /* [Belegarm]No way on earth will a dog set foot into my storage room, no matter how well trained. */
IF ~~ THEN + ham_09
END

IF ~~ THEN ham_09
SAY @85 /* [Belegarm]If there is nothing else, please leave me to my work, of which I have PLENTY to do. */
++ @86 /* I really want to help. */ + ham_10
++ @83 /* Well, I'll be on my way, then. */ + ham_14
END

IF ~~ THEN ham_10
SAY @0 /* [Belegarm]I don't see how. You have more important stuff to do than chase a ham thief. */ /* @0 /* [Belegarm]I don't see how. You have more important stuff to do than chase a ham thief. */ */
++ @87 /* We could set up traps? */ + ham_11
++ @88 /* We could watch the tent tonight. */ + ham_12
++ @89 /* I'll definitely look out for any ham. */ + ham_13
++ @90 /* The best bet is having Grey smelling for it, I think. */ + ham_20
++ @91 /* Well, I guess that's it, then. I don't have time for this, anyway. */ + ham_14
END

IF ~~ THEN ham_11
SAY @92 /* [Belegarm]And have them explode into my face next time I need to gather provisions? That's a GREAT idea! */
++ @88 /* We could watch the tent tonight. */ + ham_12
++ @89 /* I'll definitely look out for any ham. */ + ham_13
++ @90 /* The best bet is having Grey smelling for it, I think. */ + ham_20
++ @91 /* Well, I guess that's it, then. I don't have time for this, anyway. */ + ham_14
END

IF ~~ THEN ham_12
SAY @93 /* [Belegarm]Oh, "we" will watch the tent alright, but you won't be part of it. Can you imagine the scolding I'd get if I'd let you take over guard duty? The soldiers on guard will do that, that's what they are here for. */
++ @89 /* I'll definitely look out for any ham. */ + ham_13
++ @90 /* The best bet is having Grey smelling for it, I think. */ + ham_20
++ @91 /* Well, I guess that's it, then. I don't have time for this, anyway. */ + ham_14
END

IF ~~ THEN ham_13
SAY @94 /* [Belegarm]I do appreciate the enthousiasm, but going around and suspecting anyone with a slice of ham in their hand won't get us anywhere, either. The soldiers are on the search as well. Maybe you do have possibilities they don't have - but we won't find a HOCK any more, I am sure of THAT. The ham is probably on many ways where the sun don't shine by now. If we go running around snatching what little food the refugees have off their plates, the mood might thicken to our disadvantage pretty fast. */
++ @95 /* Are you sure it was refugees? */ + ham_15
++ @90 /* The best bet is having Grey smelling for it, I think. */ + ham_20
++ @91 /* Well, I guess that's it, then. I don't have time for this, anyway. */ + ham_14
END

IF ~~ THEN ham_14
SAY @96 /* [Belegarm]I guess so. You go and do your hero stuff, and leave the thieves to us. */
IF ~~ THEN DO ~EraseJournalEntry(@100501) 
EraseJournalEntry(@100503)
EraseJournalEntry(@100504)
EraseJournalEntry(@100505)
EraseJournalEntry(@100506)
EraseJournalEntry(@100507)
EraseJournalEntry(@100508)
EraseJournalEntry(@100509)
EraseJournalEntry(@100510)
EraseJournalEntry(@100515)
SetGlobal("C#Grey_SoDQuest","GLOBAL",25)~ SOLVED_JOURNAL @100502 EXIT
END

IF ~~ THEN ham_15
SAY @97 /* [Belegarm]Well, I'd surely think they are desparate enough. There's only them, or us - or your dog, eh? We already excluded the latter, and I'd think it wasn't a soldier, either - that would be a pretty daft thing to do, wouldn't it? */
++ @90 /* The best bet is having Grey smelling for it, I think. */ + ham_20
++ @91 /* Well, I guess that's it, then. I don't have time for this, anyway. */ + ham_14
END

IF ~~ THEN ham_16
SAY @98 /* [Belegarm]You really want to do this, eh? Fine. I should have the cloth the hock came in somewhere - here it is. - But don't lead your dog anyway near the provisions. I didn't change my mind on that! */
++ @99 /* Take the scent, Grey. Take the scent of the ham! */ EXTERN C#GreyJ ham_17 
++ @100 /* You are right, maybe that's not such a good idea. I guess there is nothing I can do. */ + ham_14
END
END //APPEND

CHAIN
IF ~~ THEN C#GreyJ ham_17 
@101 /* [Grey](sniff! sniff!) Woof! */
== BDBELEGA @102 /* [Belegarm]To be honest, I do not expect you to find it - too many really hungry mouths around these days, that's for sure. I am more concerned with the idea of a thief going about my stock - I surely hope we will be able to catch them before they manage to steal from the provisions again. */
END
++ @103 /* Maybe we can do both - find the ham and stop the thief. I'll keep you updated. */ DO ~SetGlobal("C#Gr_SoDQuestScent","GLOBAL",1)~ UNSOLVED_JOURNAL @100503 EXTERN BDBELEGA ham_18
++ @104 /* We'll see. */ DO ~SetGlobal("C#Gr_SoDQuestScent","GLOBAL",1)~ UNSOLVED_JOURNAL @100503 EXTERN BDBELEGA ham_19

APPEND BDBELEGA
IF ~~ THEN ham_18
SAY @105 /* [Belegarm]You do that, <CHARNAME>. */
IF ~~ THEN + ham_19
END

IF ~~ THEN ham_19
SAY @106 /* [Belegarm]Thank you for trying - I guess. Remember that you volunteered, so it's not my fault if you dawdle away your precious hero time with this. */
IF ~~ THEN DO ~EraseJournalEntry(@100501) SetGlobal("C#Grey_SoDQuest","GLOBAL",4) RealSetGlobalTimer("C#Grey_SoDQuestTimer","GLOBAL",1200)~ EXIT
END

END //APPEND

CHAIN
IF ~~ THEN BDBELEGA ham_20
@107 /* [Belegarm]Didn't we cover this topic? - Hmm, I do admit the ham had a very charasteristic and unique smell - even my hands smelled of it after handling the hock. But if cut down into slices - I'm not so sure. */
== BDBELEGA IF ~Global("C#Gr_SoDQuestThisArea","MYAREA",1)~ THEN @108 /* [Belegarm]Plus, after all the time that passed and all the people going in and out of my tent? */
== BDBELEGA IF ~Global("C#Gr_SoDQuestThisArea","MYAREA",0)~ THEN @109 /* [Belegarm]Plus, that was in another camp altogether! What do you think you will accomplish with it here? */
END
++ @110 /* Special mix of herbs means special odor. I am sure Grey could sniff it out, where the ham to be around somewhere. */ + ham_16
++ @111 /* Do you have something else with the scent of the herb mix I could train my dog with? If it is so unique, he should be able to sniff the ham out by it. */ + ham_16
++ @100 /* You are right, maybe that's not such a good idea. I guess there is nothing I can do. */ + ham_14

/* BDBELEGA
IF ~~ THEN BEGIN 22 // from: 21.2
  SAY #48526 /* ~Don't you take that tone with me. The Council thinks you're important, but I think you're bad luck. I've heard the whispers, I know what they say about you...~ */
*/
EXTEND_BOTTOM BDBELEGA 22
+ ~Global("C#Grey_SoDQuest","GLOBAL",22)~ + @112 /* I found the ham thief - doesn't that account for nothing? */ + bottlehelp_ham
END

APPEND BDBELEGA
IF ~~ THEN BEGIN bottlehelp_ham
  SAY @113 /* [Belegarm]You did indeed. All right, I can spare a minute. Let me see the bottle. */ 
  IF ~~ THEN GOTO 26
END

END //APPEND

/* Grey sniffed out the scent inside the storage tent */
APPEND C#GreyJ 
IF WEIGHT #-1
~Global("C#Gr_SoDQuestSniffTent","MYAREA",1)~ THEN sniffed_tent
SAY @114 /* [Grey]Woof! */
++ @115 /* Do you still smell the ham from where it was in the storage tent, yes? Good boy! */ + sniffed_tent_01
++ @116 /* Yes, I know the ham was in the tent, Grey. Let's search for a more recent trace. */ + sniffed_tent_01
END
END //APPEND

CHAIN
IF ~~ THEN C#GreyJ sniffed_tent_01
@114 /* [Grey]Woof! */
== BDBELEGA IF ~See("BDBELEGA") !StateCheck("BDBELEGA",CD_STATE_NOTVALID)~ THEN @117 /* [Belegarm]I said keep it away from - wait, don't tell me your dog discovered that the ham was inside this tent until not too long ago? A-hahaha, that's HILARIOUS! And mostly the level of help I expected. */
END
IF ~OR(2) !See("BDBELEGA") StateCheck("BDBELEGA",CD_STATE_NOTVALID)~ THEN EXIT
++ @118 /* Well, you doubted that's possible, Belegarm. - It is, as it seems. */ EXTERN BDBELEGA sniffed_tent_belega_01
+ ~See("BDBELEGA") !StateCheck("BDBELEGA",CD_STATE_NOTVALID)~ + @119 /* That's exactly what happened - my dog can smell that the ham was here. That's what we want him to do, no? */ EXTERN BDBELEGA sniffed_tent_belega_01
+ ~See("BDBELEGA") !StateCheck("BDBELEGA",CD_STATE_NOTVALID)~ + @120 /* Well, these things take time and we have to start somewhere. */ EXTERN BDBELEGA sniffed_tent_belega_02
+ ~See("BDBELEGA") !StateCheck("BDBELEGA",CD_STATE_NOTVALID)~ + @121 /* Belegarm, I'm trying to work here. Let my dog do his search, and we won't interfere with whatever important things you have to do. */ EXTERN BDBELEGA sniffed_tent_belega_02

APPEND BDBELEGA 
IF ~~ THEN sniffed_tent_belega_01
SAY @122 /* [Belegarm]Hmph. Probably. It's no longer *here*, though. */
IF ~~ THEN + sniffed_tent_belega_02
END

IF ~~ THEN sniffed_tent_belega_02
SAY @123 /* [Belegarm]Whatever. Just make sure your dog won't be in the way. */
IF ~~ THEN DO ~SetGlobal("C#Gr_SoDQuestSniffTent","MYAREA",2)~ EXIT
END

END //APPEND


/* boy gives Grey ham */
BEGIN C#GRSQ01

IF ~True()~ THEN give_bacon
SAY @124 /* [Boy]A dog! */
++ @125 /* You can pet him if you... oh, you are already doing it. */ + give_bacon_01
++ @126 /* Er, maybe you shouldn't just... */ + give_bacon_01
++ @127 /* Hands off my war dog! */ + give_bacon_01
END

IF ~~ THEN give_bacon_01
SAY @128 /* [Boy]His fur is so fluffy! And he is so *big*!... */
++ @129 /* And just the right size for hugging, apparently. */ + give_bacon_03
++ @130 /* Boy, you can't just hug dogs you don't know! */ + give_bacon_02
++ @131 /* Yeah, just go ahead and hug him, I'm sure he loves it. */ + give_bacon_03
++ @132 /* Will you leave my dog alone! */ + give_bacon_03
END

IF ~~ THEN give_bacon_02
SAY @133 /* [Boy]Oh, I'm not afraid of dogs, I know them. */
IF ~~ THEN + give_bacon_03
END

CHAIN
IF ~~ THEN C#GRSQ01 give_bacon_03
@134 /* [Boy]I know you are a good dog! A friendly dog, loyal and brave! You can tell, eh? */
== C#GreyJ @135 /* [Grey]Woof! */
== C#GRSQ01 @136 /* [Boy]My family used to breed Moorhounds. They.. they were all taken or killed by the crusade... I'm - I'm not crying. I'm not, because mom said tears let the fates enjoy torturing us mortals even more. It's just the fur gotten into my eyes... */
== C#GreyJ @137 /* [Grey](whines) */
== C#GRSQ01 @138 /* [Boy]Oh, good boy - our dogs always licked my face, too. - Here, take this. I wanted to spare it until we have our dogs back, but I am sure I'll get more. Eat it and be strong, so you can defend yourself if the crusade might be coming for you! */
END
IF ~~ THEN DO ~SetGlobal("C#Grey_SoDQuest","GLOBAL",6) GiveItemCreate("c#grsq01","C#Grey",0,0,0)~ EXIT


/* Grey wants to eat ham */
APPEND C#GreyJ
IF ~Global("C#Grey_SoDQuest","GLOBAL",7)~ THEN ham
SAY @139 /* [Grey]Woof? */
++ @140 /* What did he gave you? Now, that's a real tasty piece of ham there, isn't it? */ + ham_01
++ @141 /* Good boy, asking me before just eating the treat he gave you. */ + ham_01
++ @142 /* I'd rather he wouldn't have given this to you. */ + ham_01
++ @143 /* Let me have a look at the ham first, Grey. The boy surely meant well, but we need to make sure it's not rotten. */ + ham_01
++ @142 /* I'd rather he wouldn't have given this to you. */ + ham_01
END

IF ~~ THEN ham_01
SAY @144 /* [Grey](sniff! sniff!) */
++ @145 /* Does it smell good? Yes, I'll give it to you soon, Grey. It's all yours! */ + ham_02
++ @146 /* You'll get it in time, Grey. Let's not waste it. */ + ham_02
++ @147 /* We'll see who gets it, Grey. Let's move on. */ + ham_02
END

IF ~~ THEN ham_02
SAY @114 /* [Grey]Woof! */
IF ~~ THEN DO ~EraseJournalEntry(@100505)
SetGlobal("C#Grey_SoDQuest","GLOBAL",8)
RealSetGlobalTimer("C#Grey_SoDQuestTimer","GLOBAL",1200)~ UNSOLVED_JOURNAL @100504 EXIT
END
END //APPEND


/* in bd3000, after timer runs out - refugee thanks PC for extra ham */
BEGIN c#grsq06

IF ~True()~ THEN refugee_praises_ham
SAY @148 /* [male Refugee]You are the hero of Baldur's Gate, are you not? I have to say, your city is very generous to us refugees. Not only did they leave the bridge open for the ones who sought refuge, I also just enjoyed the delicious ham your nobles sponsored for us. Thank you so much, hero! What you are doing for us is priceless. Well, don't let me delay your important work. I'll be off, to the generous city of Baldur's Gate! */
IF ~~ THEN DO ~SetGlobal("C#Grey_SoDQuest","GLOBAL",10) EscapeAreaDestroy(5)~ UNSOLVED_JOURNAL @100508 EXIT
END

/* talk to Belegarm after meeting boy and first refugee */

APPEND BDBELEGA
IF WEIGHT #-1
~Global("C#Grey_SoDQuest","GLOBAL",10)
AreaCheck("bd3000") 
GlobalLT("bd_plot","global",395)~ THEN ham_bd3000
SAY @149 /* [Belegarm]You! Did you find out anything about the missing ham? I have refugees coming here, asking whether they'll get a piece of *free* ham! Do you know what's going on? */
+ ~Global("C#Gr_SoDQuestSniffRefu","MYAREA",2)
Global("C#Grey_SoDKnowScald","GLOBAL",2)~ + @32 /* Well - seems there is someone running around dressed as a soldier, handing out slices to the refugees, pretending it's from the city's authorities. */ + ham_bd3000_04 
++ @150 /* Yes, and they seem to think it's officially handed out - by the city of Baldur's Gate. */ + ham_bd3000_02
++ @151 /* I noticed, too. You think it's the stolen ham? */ + ham_bd3000_06
++ @152 /* I came here to talk to you about it because I heard it, too. */ + ham_bd3000_05
++ @153 /* I don't care about your stupid ham. Leave me alone with this. */ + ham_bd3000_01 
END

IF ~~ THEN ham_bd3000_01
SAY @154 /* [Belegarm]Hmph, fine with me - fits to what I thought of you, anyway. */
IF ~~ THEN + ham_bd3000_03
END

IF ~~ THEN ham_bd3000_02
SAY @155 /* [Belegarm]I can tell you there is *no* extra ham being handed out, neither from us nor the other coalition forces. I would be the first one to know. */
IF ~~ THEN + ham_bd3000_05
END

IF ~~ THEN ham_bd3000_03
SAY @156 /* [Belegarm]In case you need something from *me* - I'll be here. */
IF ~~ THEN DO ~EraseJournalEntry(@100501) 
EraseJournalEntry(@100503)
EraseJournalEntry(@100504)
EraseJournalEntry(@100505)
EraseJournalEntry(@100506)
EraseJournalEntry(@100507)
EraseJournalEntry(@100508)
EraseJournalEntry(@100509)
EraseJournalEntry(@100510)
EraseJournalEntry(@100515)
SetGlobal("C#Grey_SoDQuest","GLOBAL",25)~ SOLVED_JOURNAL @100502 EXIT
END

IF ~~ THEN ham_bd3000_04
SAY @157 /* [Belegarm]A *soldier*? */
IF ~~ THEN + ham_bd3000_02
END

IF ~~ THEN ham_bd3000_05
SAY @158 /* [Belegarm]This is getting rediculous. Someone going around, playing the gift fairy, saying it's from Baldur's Gate - with high chance from the stolen ham of all things? This sounds like a really bad jest to me - really bad, for whoever is doing this. If you hear anything, let me know! */
IF ~~ THEN DO ~SetGlobal("C#Grey_SoDQuest","GLOBAL",11)~ UNSOLVED_JOURNAL @100507 EXIT
END

IF ~~ THEN ham_bd3000_06
SAY @159 /* [Belegarm]I don't know the chances of this being from the stolen hock - but it's the only ham I cold think of that exists in large enough amounts without being guarded by coalition forces. */
IF ~~ THEN + ham_bd3000_05
END
END //APPEND

/* Grey sniffs out refugee with ham - bd3000 */

//NO BEGIN, we are using a copied ingame dlg

APPEND C#Grsq04

IF ~~ THEN refugee_being_sniffed_01
SAY @160 /* [female Refugee]This piece of ham was handed to me, but I'm - I'm not supposed to tell anyone from whom or the whole camp would come running... Ah, but that wouldn't apply to the Hero of Baldur's Gate, I wager. Plus, I am sure you are aware of these treats, anyway. I got the ham from one of your soldiers. I mean, a Flaming Fist soldier. You know, the special treat aside the normal ratios to ease our plight, with regards from the city's nobles? */
++ @161 /* I'm afraid that's not what the ham was meant for. I need to talk to who gave this to you. */ + refugee_being_sniffed_03
++ @162 /* ...Right - *that* ham. Yes, it's very... noble of the city's nobles to bestow such an extra treat onto the poor refugees in this camp. - Who was the soldier who handed it to you, again? */ + refugee_being_sniffed_04
++ @163 /* Just tell me which solder handed it to you. I need to talk to him. */ + refugee_being_sniffed_04
++ @164 /* A *soldier* would have given this to you? That is your excuse? */ + refugee_being_sniffed_05
END

IF ~~ THEN refugee_being_sniffed_02
SAY @165 /* [female Refugee]What? I didn't steal anything, I swear! And I am sure this ham wasn't stolen, either - no offence meant with regard to your dog's abilities, of course. */
IF ~~ THEN + refugee_being_sniffed_01
END

IF ~~ THEN refugee_being_sniffed_03
SAY @166 /* [female Refugee]Ah, I thought it's too good to be true. Well, it surely smells very fine. */
IF ~~ THEN + refugee_being_sniffed_04
END

IF ~~ THEN refugee_being_sniffed_04
SAY @167 /* [female Refugee]Last time I saw the soldier he was between the storage tents in the west of the camp. I don't know his name, unfortunately, but it seemed he still got quite a few pieces of ham to hand out. */
IF ~~ THEN DO ~EraseJournalEntry(@100505)
SetGlobal("C#Gr_SoDQuestSniffRefu","MYAREA",2)
AddJournalEntry(@100506,QUEST) AddJournalEntry(@100509,QUEST)~ EXIT
END

IF ~~ THEN refugee_being_sniffed_05
SAY @168 /* [female Refugee]I swear! Why would I lie about this? */
IF ~~ THEN + refugee_being_sniffed_04
END
END //APPEND

CHAIN
IF WEIGHT #-1
~Global("C#Gr_SoDQuestSniffRefu","MYAREA",1)~ THEN C#GreyJ sniffed_refugee
@114 /* [Grey]Woof! */
== c#grsq04 @169 /* [female Refugee]Oh, you like my ham? Yes, it's really tasty. I'm afraid I won't share it with you, though... Er, would you please keep your dog away, <PRO_SIRMAAM>?... */
END
++ @170 /* I have reasons to believe that piece you've got there is from a very special ham. How did you get it? */ EXTERN c#grsq04 refugee_being_sniffed_01
++ @171 /* My dog just confirmed that you are eating pieces of a stolen ham. Give me a reason not to call the soldiers on you! */ EXTERN c#grsq04 refugee_being_sniffed_02
++ @172 /* Alright, thief! Spill it! Where is the rest of the ham hock you stole? */ EXTERN c#grsq04 refugee_being_sniffed_02


/* Waizahb */
EXTEND_BOTTOM BDWAIZAH 12
+ ~Global("C#Gr_SoDQuestThisArea","MYAREA",1)
GlobalGT("C#Grey_SoDQuest","GLOBAL",3)
GlobalLT("C#Grey_SoDQuest","GLOBAL",19)
Global("C#Grey_SoDKnowScald","GLOBAL",0)~ + @173 /* I am on the lookout for a very special ham. So special it was taken from the Flaming Fist's storage tent. Do you know anything about it? */ + ask_about_ham
+ ~Global("C#Gr_SoDQuestThisArea","MYAREA",0)
GlobalGT("C#Grey_SoDQuest","GLOBAL",3)
OR(2)
	GlobalGT("C#Grey_SoDQuest","GLOBAL",7)
	Global("C#Gr_SoDQuestSniffRefu","MYAREA",2)
GlobalLT("C#Grey_SoDQuest","GLOBAL",25)
Global("C#Grey_SoDKnowScald","GLOBAL",0)~ + @173 /* I am on the lookout for a very special ham. So special it was taken from the Flaming Fist's storage tent. Do you know anything about it? */ + ask_about_ham
END

EXTEND_BOTTOM BDWAIZAH 13
+ ~Global("C#Gr_SoDQuestThisArea","MYAREA",1)
GlobalGT("C#Grey_SoDQuest","GLOBAL",3)
GlobalLT("C#Grey_SoDQuest","GLOBAL",19)
Global("C#Grey_SoDKnowScald","GLOBAL",0)~ + @173 /* I am on the lookout for a very special ham. So special it was taken from the Flaming Fist's storage tent. Do you know anything about it? */ + ask_about_ham
+ ~Global("C#Gr_SoDQuestThisArea","MYAREA",0)
GlobalGT("C#Grey_SoDQuest","GLOBAL",3)
OR(2)
	GlobalGT("C#Grey_SoDQuest","GLOBAL",7)
	Global("C#Gr_SoDQuestSniffRefu","MYAREA",2)
GlobalLT("C#Grey_SoDQuest","GLOBAL",19)
Global("C#Grey_SoDKnowScald","GLOBAL",0)~ + @173 /* I am on the lookout for a very special ham. So special it was taken from the Flaming Fist's storage tent. Do you know anything about it? */ + ask_about_ham
END

APPEND BDWAIZAH 
IF ~~ THEN ask_about_ham
SAY @174 /* [Waizhab]Well, I surely hope you are asking whether I was offered to fence it, because I sincerely hope you don't think I would steal from inside the coalition forces - and sell it here, too! */
+ ~GlobalLT("C#Grey_SoDQuest","GLOBAL",8)~ + @175 /* More whether you noticed unusual amounts of ham appearing in the camp in general. */ + ask_about_ham_04
+ ~GlobalGT("C#Grey_SoDQuest","GLOBAL",7)~ + @175 /* More whether you noticed unusual amounts of ham appearing in the camp in general. */ + ask_about_ham_05
++ @176 /* Of course. Can you tell me anything? */ + ask_about_ham_01
++ @177 /* I asked a question. You better answer it. */ + ask_about_ham_01
END

IF ~~ THEN ask_about_ham_01
SAY @178 /* [Waizhab]No, I wasn't offered ham. */ 
IF ~~ THEN + ask_about_ham_04
END

IF ~~ THEN ask_about_ham_02
SAY @179 /* [Waizhab]I have the policy not to sell out my ressources, but he isn't one - strictly speaking - so I'll tell you what I know. I also prefer telling you all I know now before the officers decide to send a few soldiers my way to inspect my activities. I don't know his real name, but the man asking me to fence food is being called Scald. Last I saw him he made camp in the aisle between the rows of tents. */
IF ~~ THEN DO ~SetGlobal("C#Grey_SoDKnowScald","GLOBAL",1)~ UNSOLVED_JOURNAL @100514 EXIT
END

IF ~~ THEN ask_about_ham_03
SAY @180 /* [Waizhab]Yes, I *know*, but it's the only thing I can contribute to your interrogation. */
IF ~~ THEN + ask_about_ham_02
END

IF ~~ THEN ask_about_ham_04
SAY @181 /* [Waizhab]The only thing that comes remotely close is a refugee asking me whether I *would* also fence food - which I declined, so I never came to know what he wanted to sell. */
++ @182 /* Please, tell me who it was so I can ask them myself. */ + ask_about_ham_02
++ @183 /* Might be a long shot, but better than nothing. Who was it? */ + ask_about_ham_02
++ @184 /* That's very vague. */ + ask_about_ham_03
END

IF ~~ THEN ask_about_ham_05
SAY @185 /* [Waizhab]Well, I did hear the rumor about ham being handed out by your city. I didn't bother enough to check it out, since these kind of special treats are usually sold out fast. */
++ @186 /* Anything else you could tell me? */ + ask_about_ham_04
++ @187 /* That can't be everything you know. I expect you'd hear more than a mere rumor. */ + ask_about_ham_04
END

END //APPEND

/* Scald */
BEGIN c#grsq05

IF ~True()~ THEN talk_to_scald
SAY @188 /* [Scald]Hi, they call me Scald. Yes, I got the name from a scalding I suffered not too long ago, obviously. */
+ ~Global("C#Grey_SoDKnowScald","GLOBAL",1)
GlobalLT("C#Grey_SoDQuest","GLOBAL",19)~ + @189 /* I know from Waizhab that you were trying to fence food. And I assume it was ham. Am I right? */ + talk_to_scald_04
+ ~Global("C#Grey_SoDKnowScald","GLOBAL",1)
GlobalLT("C#Grey_SoDQuest","GLOBAL",19)~ + @190 /* Did you steal the ham from the Flaming Fist storage tent? */ + talk_to_scald_02
++ @191 /* Well, good day to you. */ + talk_to_scald_01
END

IF ~~ THEN talk_to_scald_01
SAY @192 /* [Scald]As good as it can get in here. But I don't mean to complain. */
IF ~~ THEN EXIT
END

IF ~~ THEN talk_to_scald_02
SAY @193 /* [Scald]Did I what now? Which ham? Why would I steal it? Why do you ask me whether I stole any ham? I did *not* steal it, I swear! */
++ @194 /* So you know about the stolen ham? */ + talk_to_scald_03
++ @195 /* Waizhab told me you asked her to fence food, and the most obvious thing for that is that ham. I'm just doing the math. */ + talk_to_scald_05
++ @196 /* Tell me why you asked Waizhab whether she would fence food. */ + talk_to_scald_05
END

IF ~~ THEN talk_to_scald_03
SAY @197 /* [Scald]I did not steal any ham, the gods be my witness. I saw the full bag from the solder who was handing out the slices, but I swear, whoever stole it from him, it was not me. */
++ @198 /* A soldier handed slices out to you? */ + talk_to_scald_06
++ @199 /* I was talking about a hock - but never mind. You said slices were handed to you? */ + talk_to_scald_06
++ @200 /* You'll have to be more specific than that if you want me to believe you. */ + talk_to_scald_05
END

IF ~~ THEN talk_to_scald_04
SAY @201 /* [Scald]W... Are you a mind reader? Why would you ask that? */
++ @202 /* Ham was stolen from the Flaming Fist. I am searching for it. */ + talk_to_scald_03
++ @203 /* You are calling me a mind reader? So it was you who stole the ham? */ + talk_to_scald_02
END

IF ~~ THEN talk_to_scald_05
SAY @204 /* [Scald]Well, I admit I was... *evaluating* the idea of fencing the ham the soldier had in his bag. Ham is ham, right? Noone would know. But Waizhab rejected. It was a stupid idea, anyway, I'm just desparate for gold. I swear I didn't take it! Search me if you want. Someone else must've stolen it from him. */
++ @198 /* A soldier handed slices out to you? */ + talk_to_scald_06
++ @199 /* I was talking about a hock - but never mind. You said slices were handed to you? */ + talk_to_scald_06
END

IF ~~ THEN talk_to_scald_06
SAY @205 /* [Scald]Why, yes - the special treat from the city's nobles. He came around not too long ago, handing out slices to whoever got in his path. I'm so sorry to hear some other fool stole it from him. I *swear* I did not participate in whatever happened. */
++ @206 /* Don't worry, I am not here to accuse you of stealing that soldier's bag, ahem. I need to confirm the identity of the soldier who gave the ham to you, though. */ + talk_to_scald_07
++ @207 /* Tell me who the soldier was. */ + talk_to_scald_09
++ @208 /* Right - *that* ham - of course... I'd need to talk to the soldier who gave the slice to you. */ + talk_to_scald_09
++ @209 /* That's the stupidest excude I've ever heard. */ + talk_to_scald_08
END

IF ~~ THEN talk_to_scald_07
SAY @210 /* [Scald]Oh - oh, right! Maybe I was talking to the *thief* already? That's an unsettling thought, people running around, pretending to be soldiers. Let's hope it was the soldier you expect it to be, eh? */
IF ~~ THEN + talk_to_scald_09
END

IF ~~ THEN talk_to_scald_08
SAY @211 /* [Scald]It's the truth, I swear! */
IF ~~ THEN + talk_to_scald_09
END

IF ~~ THEN talk_to_scald_09
SAY @212 /* [Scald]Last I saw him he went to the west of the camp, his bag still full of slices. */
IF ~~ THEN DO ~EraseJournalEntry(@100514)
SetGlobal("C#Grey_SoDKnowScald","GLOBAL",2)
AddJournalEntry(@100506,QUEST) AddJournalEntry(@100509,QUEST)~ EXIT
END

/* FF soldier Lester */
BEGIN c#grsq03

CHAIN
IF ~Global("C#Gr_SoDQuestSniffFF","MYAREA",1)~ THEN C#GreyJ sniffed_soldier
@114 /* [Grey]Woof! */
== c#grsq03 @213 /* [Lester]Oh, hello there... big dog. */
END
IF ~~ THEN DO ~SetGlobal("C#Gr_SoDQuestSniffFF","MYAREA",2)~ EXTERN c#grsq03 first_talked_to

APPEND c#grsq03
IF WEIGHT #-1
~GlobalLT("C#Grey_TalkedToBefore","LOCALS",2)~ THEN first_talked_to
SAY @1 /* [Lester]Greetings, <PRO_SIRMAAM>. What can I do for you? */ /* @1 /* [Lester]Greetings, <PRO_SIRMAAM>. What can I do for you? */ */
+ ~Global("C#Grey_TalkedToBefore","LOCALS",0)
OR(2)
	Global("C#Gr_SoDQuestSniffRefu","MYAREA",2)
	Global("C#Grey_SoDKnowScald","GLOBAL",2)~ + @214 /* I am looking for a soldier or a person dressed as one, who is handing out slices of ham. Do you know anything about that? */ + talk_to_soldier_04
+ ~Global("C#Grey_TalkedToBefore","LOCALS",1)
OR(2)
	Global("C#Gr_SoDQuestSniffRefu","MYAREA",2)
	Global("C#Grey_SoDKnowScald","GLOBAL",2)~ + @215 /* Look, it starts to look suspicious. I am looking for a soldier or a person dressed as one, who is handing out slices of ham. My dog smelled the ham on you, and only you, amongst the soldiers. Do you have to tell me something? */ + talk_to_soldier_08
+ ~Global("C#Grey_TalkedToBefore","LOCALS",0)
GlobalGT("C#Gr_SoDQuestSniffFF","MYAREA",0)~ + @216 /* My dog's nose confirmed that you have something to do with the stolen ham. Explain yourself. */ + talk_to_soldier_01
+ ~Global("C#Grey_TalkedToBefore","LOCALS",1)
GlobalGT("C#Gr_SoDQuestSniffFF","MYAREA",1)
OR(2)
	Global("C#Gr_SoDQuestThisArea","MYAREA",0)
	RealGlobalTimerExpired("C#Grey_SoDQuestTimer","GLOBAL")~ + @217 /* My dog's still sniffes out the stolen ham on you, after all the time that passed. Is there something you'd want to tell me? */ + talk_to_soldier_08
+ ~PartyHasItem("c#grsq02")~ + @218 /* Belegarm is mourning a stolen ham and look what I just found in your pockets. How does it come that this very delicious slice of ham could be found on you, hmm? I wasn't aware that's on the normal soldier's provision list. */ DO ~SetGlobal("C#Grey_StolenHamSlices","LOCALS",1)~ + talk_to_soldier_11
++ @219 /* Good day to you. */ + talk_to_soldier_07
END

IF ~~ THEN talk_to_soldier_01
SAY @220 /* [Lester]The stolen ham? Ah - yes, the whole hock, for the officers, taken from the storage tent... */
/* PC didn't tell about searching for soldier yet */
/* theft happened in this area */
IF ~GlobalLT("C#Gr_SoDQuestSniffRefu","MYAREA",2)
	GlobalLT("C#Grey_SoDKnowScald","GLOBAL",2)
	Global("C#Gr_SoDQuestThisArea","MYAREA",1)~ THEN + talk_to_soldier_02
/* PC didn't tell aboput searching for soldier yet */
/* theft did not happen in this area */
IF ~GlobalLT("C#Gr_SoDQuestSniffRefu","MYAREA",2)
	GlobalLT("C#Grey_SoDKnowScald","GLOBAL",2)
	Global("C#Gr_SoDQuestThisArea","MYAREA",0)~ THEN + talk_to_soldier_03
END

/* PC didn't tell about searching for soldier yet */
/* theft happened in this area */
IF ~~ THEN talk_to_soldier_02
SAY @221 /* [Lester]I was surveilling the unloading of the provisions and helped carrying that thing - special treatment for the officers' supplies etcetera. Your dog can still smell that? That's impressing. */
+ ~OR(2)
	Global("C#Gr_SoDQuestSniffRefu","MYAREA",2)
	Global("C#Grey_SoDKnowScald","GLOBAL",2)~ + @214 /* I am looking for a soldier or a person dressed as one, who is handing out slices of ham. Do you know anything about that? */ + talk_to_soldier_04
++ @222 /* If you notice anything, tell me or Belegarm. */ DO ~SetGlobal("C#Grey_TalkedToBefore","LOCALS",1)~ + talk_to_soldier_06
++ @223 /* Well, thanks anyway. */ DO ~SetGlobal("C#Grey_TalkedToBefore","LOCALS",1)~ + talk_to_soldier_07
END

/* PC didn't tell aboput searching for soldier yet */
/* theft did not happen in this area */
IF ~~ THEN talk_to_soldier_03
SAY @224 /* [Lester]I was surveilling the unloading of the provisions and helped carrying that thing - special treatment for the officers' supplies etcetera... It's not working, is it? That was too long ago. (sigh) */
IF ~~ THEN + confession
END

IF ~~ THEN talk_to_soldier_04
SAY @225 /* [Lester]A soldier would hand out ham? Wait - I heard the rumors, too. The refugees are talking about it. */
/* Grey didn't sniff him out yet */
IF ~Global("C#Gr_SoDQuestSniffFF","MYAREA",0)~ THEN + talk_to_soldier_05
/* Grey sniffed him out already or party showed ham */
IF ~OR(2)
	GlobalGT("C#Gr_SoDQuestSniffFF","MYAREA",0)
	Global("C#Grey_StolenHamSlices","LOCALS",1)~ THEN + talk_to_soldier_08
END

/* Grey didn't sniff him out yet */
IF ~~ THEN talk_to_soldier_05
SAY @2 /* [Lester]I surely didn't see any soldier handing out ham slices, <PRO_SIRMAAM>. I am sorry. */ /* @2 /* [Lester]I surely didn't see any soldier handing out ham slices, <PRO_SIRMAAM>. I am sorry. */ */
/* Grey is near */
+ ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
See("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ + @226 /* Are you sure? I was told the soldier would be around here, in the western part of the camp, near the tents. That's here, right? */ + talk_to_soldier_08
/* Grey is not available */
+ ~OR(3)
Global("C#GreyJoined","GLOBAL",0)
!See("C#Grey") StateCheck("C#Grey",CD_STATE_NOTVALID)~ + @226 /* Are you sure? I was told the soldier would be around here, in the western part of the camp, near the tents. That's here, right? */ DO ~SetGlobal("C#Grey_TalkedToBefore","LOCALS",2)~ + talk_to_soldier_10

+ ~Global("C#Grey_TalkedToBefore","LOCALS",0)
GlobalGT("C#Gr_SoDQuestSniffFF","MYAREA",0)~ + @216 /* My dog's nose confirmed that you have something to do with the stolen ham. Explain yourself. */ + talk_to_soldier_01
+ ~Global("C#Grey_TalkedToBefore","LOCALS",1)
GlobalGT("C#Gr_SoDQuestSniffFF","MYAREA",2)
RealGlobalTimerExpired("C#Grey_SoDQuestTimer","GLOBAL")~ + @217 /* My dog's still sniffes out the stolen ham on you, after all the time that passed. Is there something you'd want to tell me? */ + talk_to_soldier_08
+ ~PartyHasItem("c#grsq02")~ + @218 /* Belegarm is mourning a stolen ham and look what I just found in your pockets. How does it come that this very delicious slice of ham could be found on you, hmm? I wasn't aware that's on the normal soldier's provision list. */ DO ~SetGlobal("C#Grey_StolenHamSlices","LOCALS",1)~ + talk_to_soldier_11

++ @222 /* If you notice anything, tell me or Belegarm. */ DO ~SetGlobal("C#Grey_TalkedToBefore","LOCALS",2)~ + talk_to_soldier_06
++ @223 /* Well, thanks anyway. */ DO ~SetGlobal("C#Grey_TalkedToBefore","LOCALS",2)~ + talk_to_soldier_07
END

IF ~~ THEN talk_to_soldier_06
SAY @227 /* [Lester]Of course. I'll inform you if I'll see anything suspicious. */
IF ~~ THEN + talk_to_soldier_07
END

IF ~~ THEN talk_to_soldier_07
SAY @228 /* [Lester]Have a good day. */
IF ~~ THEN EXIT
END

/* Grey sniffed him out already */
IF ~~ THEN talk_to_soldier_08
SAY @229 /* [Lester]I surely didn't see any soldier handing out ham slices... Ah, I can't keep this up any longer. */
IF ~~ THEN + talk_to_soldier_09
IF ~OR(2)
	GlobalGT("C#Gr_SoDQuestSniffFF","MYAREA",0)
	Global("C#Grey_StolenHamSlices","LOCALS",1)~ THEN + confession
END

/* Grey is there and soldier knows he could smell him out */
IF ~~ THEN talk_to_soldier_09
SAY @230 /* [Lester]It's of no use. I know your dog could trace the stolen ham on me, would you order it to. */
IF ~~ THEN + confession
END

/* greeting if already talked about soldier handing out slices */
IF WEIGHT #-1
~Global("C#Grey_TalkedToBefore","LOCALS",2)~ THEN talk_to_soldier_10
SAY @3 /* [Lester]Like I said, I didn't see anyone handing out ham slices. */ /* @3 /* [Lester]Like I said, I didn't see anyone handing out ham slices. */ */
+ ~GlobalGT("C#Gr_SoDQuestSniffFF","MYAREA",0)~ + @216 /* My dog's nose confirmed that you have something to do with the stolen ham. Explain yourself. */ + talk_to_soldier_03
+ ~PartyHasItem("c#grsq02")~ + @218 /* Belegarm is mourning a stolen ham and look what I just found in your pockets. How does it come that this very delicious slice of ham could be found on you, hmm? I wasn't aware that's on the normal soldier's provision list. */ DO ~SetGlobal("C#Grey_StolenHamSlices","LOCALS",1)~ + talk_to_soldier_11
+ ~CheckStatGT(Player1,17,STR)~ + @231 /* Look, I know you have it in your bag. How about I jut take it and have a look, hmm? You know you can't stop me. */ + talk_to_soldier_12
+ ~CheckStatGT(Player1,17,INT)~ + @232 /* Look, I know you have it in your bag. A soldier running around with a bag inside the camp? Do you think I am stupid? */ + talk_to_soldier_12
+ ~OR(2)
CheckStatGT(Player1,17,CON)
CheckStatGT(Player1,17,DEX)~ + @233 /* Look, I know you have it in your bag. How about I just take it and have a look, hmm? You know you couldn't prevent me from snatching it if I wanted to. */ + talk_to_soldier_12
+ ~CheckStatGT(Player1,17,WIS)~ + @234 /* Look, I know you have it in your bag. Would you rather show it to me or should I go directly to Belegarm and Marshal Nederlok? */ + talk_to_soldier_12
+ ~CheckStatGT(Player1,17,CHR)~ + @235 /* Look, I know you have it in your bag. Why don't you just give in and we can settle the whole thing? This whole affair must weigh on you heavily. */ + talk_to_soldier_13
++ @222 /* If you notice anything, tell me or Belegarm. */ + talk_to_soldier_06
++ @223 /* Well, thanks anyway. */ + talk_to_soldier_07
END

IF ~~ THEN talk_to_soldier_11
SAY @236 /* [Lester]Well, no, but - but it doesn't mean I can't have some, can it? */
+ ~GlobalLT("C#Grey_TalkedToBefore","LOCALS",2)
OR(3)
Global("C#GreyJoined","GLOBAL",0)
!See("C#Grey") StateCheck("C#Grey",CD_STATE_NOTVALID)
OR(2)
	Global("C#Gr_SoDQuestSniffRefu","MYAREA",2)
	Global("C#Grey_SoDKnowScald","GLOBAL",2)~ + @237 /* I am looking for a soldier or a person dressed as one, who is handing out slices of ham. This is getting a little bit suspicious, don't you think? */ + talk_to_soldier_04
+ ~GlobalLT("C#Grey_TalkedToBefore","LOCALS",2)
OR(3)
Global("C#GreyJoined","GLOBAL",0)
!See("C#Grey") StateCheck("C#Grey",CD_STATE_NOTVALID)~ + @238 /* Well, I guess so. */ + talk_to_soldier_07

IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
See("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN + talk_to_soldier_09
IF ~OR(2)
	GlobalGT("C#Gr_SoDQuestSniffFF","MYAREA",0)
	Global("C#Grey_TalkedToBefore","LOCALS",2)~ THEN + confession
END

IF ~~ THEN talk_to_soldier_12
SAY @4 /* [Lester]You can't threaten me with this! Well... I guess you can, can't you. (sigh) */ /* @4 /* [Lester]You can't threaten me with this! Well... I guess you can, can't you. (sigh) */ */
IF ~~ THEN + confession
END

IF ~~ THEN talk_to_soldier_13
SAY @239 /* [Lester]You have no idea!... Oh - darn. (sigh) */
IF ~~ THEN + confession
END

/* Confession */
IF ~~ THEN confession
SAY @240 /* [Lester]Alright, I'll confess. You got me. It was me. I took the hock, I cut it into pieces, and I'm spreading it amongst the refugees. But please - hear me out before handing me over to Marshal Nederlok. I beg of you! */
++ @241 /* That's only fair. Speak. */ + confession_03
++ @242 /* You think you can give an explanation that wouldn't make you the thief that you seem to be? Very well, then. */ + confession_03
++ @243 /* You can give your explanation to Marshal Nederlok. I'm done with dealing with a ham thief. */ + confession_01
++ @244 /* I will hand you in now. You committed the theft, no explanation will change that. */ + confession_01
++ @245 /* You know - I don't care. I see you have quite a stash of this ham left - give it to me, and I'll forget the whole thing. */ + confession_02
END

IF ~~ THEN confession_01
SAY @246 /* [Lester]No - no please - I... Oh, this is unfortunate... */
IF ~~ THEN DO ~SetGlobal("C#Grey_SoDQuest","GLOBAL",21) 
ClearAllActions()
StartCutSceneMode() 
StartCutScene("C#GrCus3")~ EXIT
END

IF ~~ THEN confession_02
SAY @247 /* [Lester]You... you would? Oh yes - yes! Getting rid of the evidence is what I was trying to do - without wasting it - I know I did it the most stupid way possible, but - anyway, here is all I've got left. */
IF ~~ THEN + confession_20
IF ~InParty("CORWIN")  See("CORWIN") !StateCheck("CORWIN",CD_STATE_NOTVALID)~ THEN EXTERN bdcorwij unhappy_01
END 

IF ~~ THEN confession_03
SAY @248 /* [Lester]Thank you! Thank you so much for hearing me out. It all started in a night with too much ale. We finished setting up the camp - I really was assigned with surveillance of the provisions, and I really did help with hanging up the ham hock. The ale came afterwards. So far, so good. The tragedy started when I decided to make another round late at night. I went through the storage tent to make sure everything was alright - and then I saw that ham. */
++ @249 /* And the temptation got too great? */ + confession_04
++ @250 /* Yes, but why the whole thing? It was huge, I was told. */ + confession_05
++ @251 /* So, you're not only a thief, but also went patrolling drunk? This gets better and better. */ + confession_06
++ @252 /* Go on. */ + confession_07
++ @243 /* You can give your explanation to Marshal Nederlok. I'm done with dealing with a ham thief. */ + confession_01
++ @244 /* I will hand you in now. You committed the theft, no explanation will change that. */ + confession_01
++ @245 /* You know - I don't care. I see you have quite a stash of this ham left - give it to me, and I'll forget the whole thing. */ + confession_02
END

IF ~~ THEN confession_04
SAY @253 /* [Lester]Oh yes. */
IF ~~ THEN + confession_07
END

IF ~~ THEN confession_05
SAY @254 /* [Lester]I'm not there just yet. I didn't mean to take the whole thing - not at all. */
IF ~~ THEN + confession_07
END

IF ~~ THEN confession_06
SAY @255 /* [Lester]What? No, that's not what - please tell me you didn't mean that. */
++ @256 /* I was jesting. Go on with your explanation. */ + confession_07
++ @257 /* I guess it doesn't matter now. Then what happened? */ + confession_07
++ @243 /* You can give your explanation to Marshal Nederlok. I'm done with dealing with a ham thief. */ + confession_01
++ @244 /* I will hand you in now. You committed the theft, no explanation will change that. */ + confession_01
++ @245 /* You know - I don't care. I see you have quite a stash of this ham left - give it to me, and I'll forget the whole thing. */ + confession_02
END
END //APPEND

CHAIN
IF ~~ THEN c#grsq03 confession_07
@258 /* [Lester]Belegarm told you it was a fine ham, I assume. He didn't exaggerate. I never saw a better piece. We already had talked about it, how it is only for the officers, while we do the "real work", when sitting at the fire before. I had too much ale - I couldn't handle the temptation and cut a piece off and ate it, thinking I deserved it, and that it was too small to notice, anyway, and if, that noone would know it was me. */
== bdcorwij IF ~InParty("CORWIN")  See("CORWIN") !StateCheck("CORWIN",CD_STATE_NOTVALID)~ THEN @259 /* [Corwin]What a foolish thought! You expect us to believe you take your duty seriously? */
== c#grsq03 IF ~InParty("CORWIN")  See("CORWIN") !StateCheck("CORWIN",CD_STATE_NOTVALID)~ THEN @260 /* [Lester]It was foolish, but the reason I was there is because I went on an extra round! I swear! */
== c#grsq03 @261 /* [Lester]Then it became next morning. I stood up early - yes my head hurt - and made another round. Partly out of duty, partly because I remembered. When I saw the ham, I knew I would be in trouble. The missing piece was clearly visible. I spent an hour trying to make it look "whole", but made it only worse! Then I spent half the day in agony over what to do. Then I decided to take the whole thing before Belegarm sees it. */
END
++ @262 /* Sounds like a stupid thing to do. */ + confession_08
+ ~InParty("CORWIN")  See("CORWIN") !StateCheck("CORWIN",CD_STATE_NOTVALID)~ + @263 /* You know what you should have done! Confess to your superiors! */ EXTERN bdcorwij soldier_should_confess
+ ~OR(3) !InParty("CORWIN")  !See("CORWIN") StateCheck("CORWIN",CD_STATE_NOTVALID)~ + @263 /* You know what you should have done! Confess to your superiors! */ + confession_10
++ @252 /* Go on. */ + confession_11
++ @243 /* You can give your explanation to Marshal Nederlok. I'm done with dealing with a ham thief. */ + confession_01
++ @244 /* I will hand you in now. You committed the theft, no explanation will change that. */ + confession_01
++ @245 /* You know - I don't care. I see you have quite a stash of this ham left - give it to me, and I'll forget the whole thing. */ + confession_02

APPEND c#grsq03
IF ~~ THEN confession_08
SAY @264 /* [Lester]I was in panic! There is no way the mutilation wouldn't be tracked back to me, or so I thought. */
++ @265 /* But missing the whole thing wouldn't? I admire your logic. */ + confession_09
+ ~InParty("CORWIN")  See("CORWIN") !StateCheck("CORWIN",CD_STATE_NOTVALID)~ + @263 /* You know what you should have done! Confess to your superiors! */ EXTERN bdcorwij soldier_should_confess
+ ~OR(3) !InParty("CORWIN")  !See("CORWIN") StateCheck("CORWIN",CD_STATE_NOTVALID)~ + @263 /* You know what you should have done! Confess to your superiors! */ + confession_10
++ @252 /* Go on. */ + confession_11
++ @243 /* You can give your explanation to Marshal Nederlok. I'm done with dealing with a ham thief. */ + confession_01
++ @244 /* I will hand you in now. You committed the theft, no explanation will change that. */ + confession_01
++ @245 /* You know - I don't care. I see you have quite a stash of this ham left - give it to me, and I'll forget the whole thing. */ + confession_02
END

IF ~~ THEN confession_09
SAY @266 /* [Lester]Well, I made sure I wasn't seen when going in to take it - and when bringing it out, either. I pretended to carry other provisions and hid it between them. */
IF ~~ THEN + confession_10
END

IF ~~ THEN confession_10
SAY @267 /* [Lester]I know I made it all worse with what I did. Please, hear me out. */
IF ~~ THEN + confession_11
END
END //APPEND

/* happened in that camp */
CHAIN
IF ~~ THEN c#grsq03 confession_11
@268 /* [Lester]Funnily enough, I wasn't suspected when the missing hock was noticed later that day. */
== c#grsq03 IF ~Global("C#Gr_SoDQuestThisArea","MYAREA",0)~ THEN @269 /* [Lester]I heard it when the main squad arrived. You might have noticed that there was no trace of the hock left in the last camp - it was because I was sent as vanguard the same day, lucky me... the hock in my horse's backpack. I still thought I could get out of this, that I would just give the ham hock to Marshal Nederlok - he wouldn't know how it's supposed to look, would he? Everything just a great misunderstanding - "I thought the officers were supposed to get this as soon as possible - sir!" - and by the time the main squad arrived, Belegarm would just think they already ate from it, so it would all work out, right? But I chickened out. I hesitated to hand it over, and missed the time slot where it would have made sense. */
== c#grsq03 @270 /* [Lester]So I sat there, the officers' ham hock hidden in my backpack. All remained quiet - and I started to feel save. I was sure it would all work out as long as noone saw it, and tried to forget about it, myself. It's just a ham, right? If I'd wait long enough, noone would trace it back to *that* hock, that's ridiculous, right? Up until the point where I was told that the hero was helping Belegarm to find the hock - with the help of his war dog's smelling for the "special herbs mixture". */
END
++ @271 /* And you panicked again. */ + confession_12
++ @252 /* Go on. */ + confession_13
++ @243 /* You can give your explanation to Marshal Nederlok. I'm done with dealing with a ham thief. */ + confession_01
++ @244 /* I will hand you in now. You committed the theft, no explanation will change that. */ + confession_01
++ @245 /* You know - I don't care. I see you have quite a stash of this ham left - give it to me, and I'll forget the whole thing. */ + confession_02
++ @243 /* You can give your explanation to Marshal Nederlok. I'm done with dealing with a ham thief. */ + confession_01
++ @244 /* I will hand you in now. You committed the theft, no explanation will change that. */ + confession_01
++ @245 /* You know - I don't care. I see you have quite a stash of this ham left - give it to me, and I'll forget the whole thing. */ + confession_02

APPEND c#grsq03 

IF ~~ THEN confession_12
SAY @272 /* [Lester]You have no idea. */
IF ~~ THEN + confession_13
END

IF ~~ THEN confession_13
SAY @273 /* [Lester]See, all this time, I couldn't get myself to just throw it away or hand the whole thing to some refugees who were leaving. I was caught in the web of fearing of being found out but not daring to waste this extraordinary piece of meat. I really can't imagine what it must have cost. Which, by the way, just increased my self-pity about how I was drawn into the whole mess by the double standards of troop's provisions with regard to the discrepancy between who is doing the dirty work and who is getting the exquisite provisions. */
IF ~~ THEN + confession_15
IF ~GlobalGT("C#Grey_SoDQuest","GLOBAL",7)~ THEN + confession_14
END

IF ~~ THEN confession_14
SAY @274 /* [Lester]As soon as I heard about you going about with your dog sniffing for the ham, I knew I had to rid me of it. But how - I couldn't just leave camp. I didn't dare to hide it, and I couldn't have eaten it all by myself even though I tried. Then I had an idea of which at that time I thought it's a brilliant one: if I couldn't make it vanish - I would spread the ham through the whole camp! */
++ @275 /* I see why you thought that's a good idea. */ + confession_16
++ @276 /* Yes, that worked great, you know. It's the surfacing ham pieces that got me to continue investigating in the first place. */ + confession_18
++ @243 /* You can give your explanation to Marshal Nederlok. I'm done with dealing with a ham thief. */ + confession_01
++ @244 /* I will hand you in now. You committed the theft, no explanation will change that. */ + confession_01
++ @245 /* You know - I don't care. I see you have quite a stash of this ham left - give it to me, and I'll forget the whole thing. */ + confession_02
END

IF ~~ THEN confession_15
SAY @277 /* [Lester]As soon as I heard about you going about with your dog sniffing for the ham, I knew I had to rid me of it. But how - I couldn't just leave camp. I didn't dare to hide it, and I couldn't have eaten it all by myself even though I tried. I would have spread it amongst the refugees, had I more time before you found me. That's why I have a bag full of slices on me... */
IF ~~ THEN + confession_16
END

IF ~~ THEN confession_16
SAY @278 /* [Lester]Please, believe me that I never meant for this to happen. And I couldn't get myself to waste the meat, which is why you found me out. I'm - I'm not a thief! The whole thing started because I went on patrolling outside of my duty time. I meant well! I swear! */
++ @279 /* You meant well but made one stupid mistake after the other. */ + confession_17
++ @280 /* You took the hock! What do you think will happen now? */ + confession_19
++ @243 /* You can give your explanation to Marshal Nederlok. I'm done with dealing with a ham thief. */ + confession_01
++ @244 /* I will hand you in now. You committed the theft, no explanation will change that. */ + confession_01
++ @245 /* You know - I don't care. I see you have quite a stash of this ham left - give it to me, and I'll forget the whole thing. */ + confession_02
END

IF ~~ THEN confession_17
SAY @281 /* [Lester]Exactly! Mistakes! */
IF ~~ THEN + confession_19
END

END //APPEND
CHAIN
IF ~~ THEN c#grsq03 confession_18
@282 /* [Lester]I know. I was too eager and too hesitant at the same time to make it work. (sigh) */
== bdcorwij IF ~InParty("CORWIN")  See("CORWIN") !StateCheck("CORWIN",CD_STATE_NOTVALID)~ THEN @283 /* [Corwin]"Make it work"? Do you even listen to yourself? */
END 
IF ~~ THEN + confession_16

CHAIN
IF ~~ THEN c#grsq03 confession_19
@284 /* [Lester]Surely we could find a different way to handle this than convicting me of thieving? I would be cashiered from services - without payments, probably a fine on top - maybe some time in prison - I need the sold for my family. I beg of you, have mercy. */
== c#grsq03 IF ~InParty("CORWIN")  See("CORWIN") !StateCheck("CORWIN",CD_STATE_NOTVALID)~ THEN @285 /* [Lester]I confessed all this in front of my Captain. You must see I mean well! */
== bdcorwij IF ~InParty("CORWIN")  See("CORWIN") !StateCheck("CORWIN",CD_STATE_NOTVALID)~ THEN @286 /* [Corwin]You are clearly a thief. <CHARNAME>, there is only one way to proceed here. */
== c#grsq03 IF ~GlobalGT("C#Grey_SoDQuest","GLOBAL",7) !Global("bd_bridgefort_sabotaged","GLOBAL",1)~ THEN @287 /* [Lester]I told the refugees I handed pieces out to that it's a treat from Baldur's Gate, and they were all so happy and thankful! After what happened at Boareskyr Bridge with you, hero, I thought it's a nice touch to raise our city's standing - and yours with it! Hmm? */
== c#grsq03 IF ~GlobalGT("C#Grey_SoDQuest","GLOBAL",7)  Global("bd_bridgefort_sabotaged","GLOBAL",1)~ THEN @288 /* [Lester]I told the refugees I handed it out to that it's a treat from Baldur's Gate, and they were all so happy and thankful! After what happened at Boareskyr Bridge with you, hero - and after we, well, lost Bridgefort, I thought it's a nice touch to raise our city's standing - and yours with it! Hmm? */
== c#grsq03 @289 /* [Lester]This was my side of the story. Thank you for listening. I will accept your decision. */
END
++ @290 /* Belegarm doesn't expect the ham to return, he's more worried about thefts from the provisions in general. As long as you swear this will not repeat, the matter is settled as far as I'm concerned. */ + confession_21
++ @291 /* We'll need every hand in the upcoming war. I don't see a reason to waste a capable soldier over such trivial a matter. */ + confession_21 
++ @292 /* I do feel sympathy for you and see where you went wrong. But a theft is a theft. I know Marshal Nederlok will listen to your full story, but that is all I can do. */ + confession_01
++ @244 /* I will hand you in now. You committed the theft, no explanation will change that. */ + confession_01
++ @245 /* You know - I don't care. I see you have quite a stash of this ham left - give it to me, and I'll forget the whole thing. */ + confession_02

APPEND c#grsq03 

IF ~~ THEN confession_20
SAY @293 /* [Lester]I *thank* you. For obvious reasons, I won't talk about this to anyone, but you have my gratitude for freeing me from this nightmare. */
IF ~~ THEN DO ~EraseJournalEntry(@100501) 
EraseJournalEntry(@100503)
EraseJournalEntry(@100504)
EraseJournalEntry(@100505)
EraseJournalEntry(@100506)
EraseJournalEntry(@100507)
EraseJournalEntry(@100508)
EraseJournalEntry(@100509)
EraseJournalEntry(@100510) 
EraseJournalEntry(@100514) 
EraseJournalEntry(@100515)
AddExperienceParty(500) 
SetGlobal("C#Grey_SoDQuest","GLOBAL",19) GiveItemCreate("c#grsbag",Player1,0,0,0)~ SOLVED_JOURNAL @100512 EXIT
END
END //APPEND

CHAIN
IF ~~ THEN c#grsq03 confession_21
@294 /* [Lester]Yes! I can't beieve my luck. I will hand over the rest of the ham to you - do with it what you want. I'm *so* glad this is over... */
== c#grsq03 IF ~Global("bd_bridgefort_sabotaged","GLOBAL",1)~ THEN @295 /* I never thought I'd profit from your ways of bending what is right and appropriate - I guess what works for a fort also works for one soldier, huh. Maybe I shouldn't be so harsh on you for your decision to hand over Bridgefort, after all. */
END
IF ~~ THEN + confession_20
IF ~InParty("CORWIN")  See("CORWIN") !StateCheck("CORWIN",CD_STATE_NOTVALID)~ THEN EXTERN bdcorwij unhappy_01


APPEND bdcorwij 
IF ~~ THEN soldier_should_confess
SAY @296 /* [Corwin]I couldn't have put it better! */
IF ~~ THEN EXTERN c#grsq03 confession_10
END

IF ~~ THEN unhappy_01
SAY @297 /* [Corwin]<CHARNAME>, I can't believe this is what you decided. Good it was "just a ham hock", I guess. I will not stand by if we face more serious violations of Watch laws! */
IF ~~ THEN EXTERN c#grsq03 confession_20
END
END //APPEND


/* Quest end with Belegarm */

CHAIN
IF WEIGHT #-1
~Global("C#Grey_SoDQuest","GLOBAL",21)~ THEN bdbelega soldier_convicted
@298 /* [Belegarm]Well, well. A *soldier*, of all people. */
== bdcorwij IF ~InParty("CORWIN")  See("CORWIN") !StateCheck("CORWIN",CD_STATE_NOTVALID)~ THEN @299 /* [Corwin]Yes, we were as shocked to hear it as you are. */
== bdcorwin IF ~!InParty("CORWIN")  See("CORWIN") !StateCheck("CORWIN",CD_STATE_NOTVALID)~ THEN @299 /* [Corwin]Yes, we were as shocked to hear it as you are. */
== bdbelega @300 /* [Belegarm]Well, a theft is a theft, so he got what was coming for him. <CHARNAME>, Marshal Nederlok left the remaining ham pieces to me, but I wouldn't know what to do with them - I can't offer them to the officers, it's not enough for the soldiers, and I will certainly not hand them out to the refugees. */
= @301 /* [Belegarm]He also left it to me to reward you for your services. So, here is the bag. The ham is still delicious, and the bag is very useful. I think it is a fine reward as any. */
== bdbelega IF ~OR(2)
GlobalGT("C#Gr_SoDQuestSniffFF","MYAREA",0)
Global("C#Gr_SoDQuestSniffRefu","MYAREA",2)~ THEN  @302 /* [Belegarm]Who would have thought that the nose I saw as the greatest threat to my provisions would be of such great use, eh? Make sure you give your dog some of it, I guess it earned it. */
END
IF ~~ THEN DO ~EraseJournalEntry(@100501) 
EraseJournalEntry(@100503)
EraseJournalEntry(@100504)
EraseJournalEntry(@100505)
EraseJournalEntry(@100506)
EraseJournalEntry(@100507)
EraseJournalEntry(@100508)
EraseJournalEntry(@100509)
EraseJournalEntry(@100510)
EraseJournalEntry(@100514)
EraseJournalEntry(@100515)
AddExperienceParty(500) 
SetGlobal("C#Grey_SoDQuest","GLOBAL",22) GiveItemCreate("c#grsbag",Player1,0,0,0) 
ActionOverride("Corwin",MoveToPoint([920.365]))~ SOLVED_JOURNAL @100511 EXIT
