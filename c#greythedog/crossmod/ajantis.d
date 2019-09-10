/* crossmod Ajantis BGII */

APPEND C#AjanB

IF WEIGHT #-1 
~CombatCounter(0) !See([ENEMY]) OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#GREY") See(Player1)
!StateCheck(Player1,CD_STATE_NOTVALID)
!Dead("C#GREY")
!StateCheck(Myself,CD_STATE_NOTVALID)
InParty(Myself)
Global("C#Grey_AjantisBanterSvA","GLOBAL",0)~ THEN ajantisgrey_sva1
SAY ~Grey doesn't seem to have any scars. I understood he was captured together with you, <CHARNAME>. It seems he did not suffer as much insane torture?~
+ ~!PartyHasItem("MISC4N")
Global("SummonDryads","AR1200",0)~ + ~No, he was protected by Dryads.~ + ajantisgrey_sva1_01
+ ~OR(2)
PartyHasItem("MISC4N")
GlobalGT("SummonDryads","AR1200",0)~ + ~No, he was protected by Dryads.~ + ajantisgrey_sva1_02
++ ~I don't think he did.~ + ajantisgrey_sva1_01
++ ~I don't know.~ + ajantisgrey_sva1_01
END

IF ~~ THEN ajantisgrey_sva1_01
SAY ~Still, I would be cautious as to what happened to him there. It could well be he will show unexpected behavior in a future moment of high stress.~
++ ~I'll watch out for it.~ + ajantisgrey_sva1_05
++ ~Are you saying he is no longer reliable?~ + ajantisgrey_sva1_05
++ ~And what makes you the dog training expert, Ajantis?~ + ajantisgrey_sva1_03
END

IF ~~ THEN ajantisgrey_sva1_02
SAY ~Dryads! The one the acorns are from? I understand. This was fortunate indeed.~
IF ~~ THEN + ajantisgrey_sva1_01
END

IF ~~ THEN ajantisgrey_sva1_03
SAY ~Well, my family does breed and train fierce animals and even monsters.~
IF ~~ THEN + ajantisgrey_sva1_05
END

IF ~~ THEN ajantisgrey_sva1_04
SAY ~But I did not notice any unusual behavior on him since we are together, plus the lack of scars tells me he did not suffer greater injuries. Could well be he overcame your capture quite well. Much better than most... as it seems.~
IF ~~ THEN DO ~SetGlobal("C#Grey_AjantisBanterSvA","GLOBAL",1)~ EXIT
END

IF ~~ THEN ajantisgrey_sva1_05
SAY ~Every living being reacts to stress and pain, with the mind as well as the body. Some in a way that they are changed forever afterwards.~
IF ~~ THEN + ajantisgrey_sva1_04
END

END //APPEND

CHAIN
IF 
~CombatCounter(0) !See([ENEMY]) OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#GREY") See(Player1)
!StateCheck(Player1,CD_STATE_NOTVALID)
!Dead("C#GREY")
!StateCheck(Myself,CD_STATE_NOTVALID)
InParty(Myself)
Global("C#Grey_AjantisBanterSvA","GLOBAL",1)~ THEN C#AjanB ajantisgrey_sva2
~My last remark about Grey might not have sounded like it, but I am relieved to see him alive and well. There are... there are enough deaths and so much pain this Irenicus inflicted. It is good to see an intelligent creature as Grey was being sheltered from it.~ DO ~SetGlobal("C#Grey_AjantisBanterSvA","GLOBAL",2)~
== BIMOEN2 IF ~See("imoen2") 
!StateCheck("imoen2",CD_STATE_NOTVALID)
!Dead("imoen2")~ THEN ~Oh, yes, I am happy for him, too. And... jealous, in a way.~
== BJAHEIR IF ~InParty("jaheira")
See("jaheira")
!StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN ~You talk as if you *knew* anything about how much pain the deaths inflicted, Ajantis. You do not.~
== BJAHEIR IF ~InParty("jaheira")
See("jaheira")
!StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN ~But, yes, it is good to see nature take its part in such a place as this dungeon Irenicus built for himself.~
== BMinsc IF ~InParty("minsc")
See("minsc")
!StateCheck("minsc",CD_STATE_NOTVALID)~ THEN ~Hm, Minsc wonders why they didn't take on Boo. Minsc had to fight hard not to let go of Boo in this ugly dungeon! But... What, Boo?~
== BMinsc IF ~InParty("minsc")
See("minsc")
!StateCheck("minsc",CD_STATE_NOTVALID)~ THEN ~Ah! Boo says, they were scared he would eat their precious acorns! You would never do that, Boo, would you?~
== C#AjanB ~The dryads feeling responsible for Grey is not too surprising. Ireniucs probably did not have enough interest in Grey to perform his... experiments on him, and it is only natural the dryads felt the urge to protect an animal from his and his servants' clutches.~
EXIT