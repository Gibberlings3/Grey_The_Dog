CHAIN
IF 
~%IT_IS_SOD%
CombatCounter(0) !See([ENEMY]) 
OR(2) InParty(Myself) Global("C#BrandockJoined","GLOBAL",2)
InParty("C#Grey")  
See("C#Grey") See(Player1)
!StateCheck(Myself,CD_STATE_NOTVALID)
!StateCheck("C#Grey",CD_STATE_NOTVALID)
Global("C#Brandock_GreySoD","GLOBAL",0)~ THEN C#BrandB brandock_grey_sod_1
@0 /* [Brandock]Wait, is that - Grey, is that a hair from you? That's definitely dog hair. How does this get into my pocket? Do you have anything to say to your defence? */
DO ~SetGlobal("C#Brandock_GreySoD","GLOBAL",1)~
== C#GreyJ @1 /* [Grey]Woof! */ 
== C#BrandB @2 /* [Brandock]You mean it's my own fault because I tend to roll out my bedroll next to you because I'm still scared of foxes? Yes, you might have a point there. */
= @3 /* [Brandock]I'll reconsider my tactic as soon as I'll find your hair in my food. */
== C#GreyJ @1 /* [Grey]Woof! */ 
EXIT

CHAIN
IF 
~%IT_IS_SOD%
CombatCounter(0) !See([ENEMY]) 
OR(2) InParty(Myself) Global("C#BrandockJoined","GLOBAL",2)
InParty("C#Grey")  
See("C#Grey") See(Player1)
!StateCheck(Myself,CD_STATE_NOTVALID)
!StateCheck("C#Grey",CD_STATE_NOTVALID)
Global("C#Brandock_GreySoD","GLOBAL",1)~ THEN C#BrandB brandock_grey_sod_2
@4 /* [Brandock]It's funny how I feel safe - saf*er*, at least - with Grey around at night. Not only because of the foxes, towards which, by the way, I've developed a hell of a lot of respect. But in general. - No offence towards whoever took night's watch the last times, and I'll definitely give my best on my turn, but having a guarding dog *is* something different. */
DO ~SetGlobal("C#Brandock_GreySoD","GLOBAL",2)~
== bdsafanB IF ~InMyArea("Safana") InParty("Safana") !StateCheck("Safana",CD_STATE_NOTVALID)~ THEN @5 /* [Safana]Yes, and I guess that half of the dangers keep their distance because he stinks 10 feet upwind. */
== bdjaheiB IF ~InMyArea("Jaheira") InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)
InMyArea("Safana") InParty("Safana") !StateCheck("Safana",CD_STATE_NOTVALID)~ THEN @6 /* [Jaheira]The real stink is what you would call "civilization", Safana, when it overwhelms and surpresses nature. */
== bdjaheiB IF ~InMyArea("Jaheira") InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @7 /* [Jaheira]There are a lot of creatures that are superior in many ways. We can call ourselves lucky from any advantages we gain by living in harmony with nature as much as we can. */
END
++ @8 /* Yes, I am happy to have him with me, too. */ EXTERN C#BrandJ brandock_grey_sod_2_03
++ @9 /* He's doing is job, that's all. */ EXTERN C#BrandJ brandock_grey_sod_2_02
++ @10 /* If you are so grateful for his presence, how about you tend to him next time. */ EXTERN C#BrandJ brandock_grey_sod_2_01

CHAIN
IF ~~ THEN C#BrandJ brandock_grey_sod_2_01
@11 /* [Brandock]Ah, you mean because I didn't find enough of his hair in my pockets already? But sure, I could do that. Grey - next rest it's into the water for you! */
== C#GreyJ @1 /* [Grey]Woof! */ 
END
IF ~~ THEN + brandock_grey_sod_2_03

APPEND C#BrandJ
IF ~~ THEN brandock_grey_sod_2_02
SAY @12 /* [Brandock]He's doing his job indeed. */
IF ~~ THEN + brandock_grey_sod_2_03
END

IF ~~ THEN brandock_grey_sod_2_03
SAY @13 /* [Brandock]Calming my nerves is not an easy task, and yet here we are - Brandock sleeping soundly as long as Grey is around. I'd start to think of arguments to bargain him away from you, wouldn't I know that he's chosen you as his master. */
IF ~~ THEN EXIT
END
END //APPEND