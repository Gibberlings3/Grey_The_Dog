CHAIN
IF WEIGHT #-1
~%IT_IS_SOD%
CombatCounter(0) !See([ENEMY]) 
InParty("%IMOEN_DV_SOD%")
InParty("C#Grey")
!StateCheck("C#Grey",CD_STATE_NOTVALID)
!StateCheck("%IMOEN_DV_SOD%",CD_STATE_NOTVALID)
See("C#Grey") See(Player1)
Global("C#ImSoD_GreyBanter","GLOBAL",0)~ THEN BDIMOENB imoen_grey_sod_01
@0 /* ~[Imoen]Guck mal, Grey! Bei meinen ganzen, äh, Errungenschaften habe ich natürlich auch was für dich gefunden! Hier, bitte schön!~ */
DO ~SetGlobal("C#ImSoD_GreyBanter","GLOBAL",1)~
= @1 /* ~[Imoen]Ja, ich weiß, ist ein bisschen zäh. Ich wollte auch niemandem Essen klauen, aber bei einem so schönen Stück getrocknetem Fleisch, da musste ich an dich denken!~ */
== C#GreyJ @10109 /* ~[Grey]Woof!~ [C#Grey01] */
== BDJAHEIB IF ~InMyArea("Jaheira") InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @2 /* ~[Jaheira]Dieses haltbar gemachte Fleisch ist nicht die beste Nahrung für Grey, Imoen. Meist ist es zu salzig.~ */
== BDIMOENB IF ~InMyArea("Jaheira") InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @3 /* ~[Imoen]Ja, ist ja gut. Wird wahrscheinlich auch nicht mehr vorkommen. (Iss es mal schnell, Grey. Sonst nimmt Tante Jaheira es dir noch weg!)~ */
== BDJAHEIB IF ~InMyArea("Jaheira") InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @4 /* ~[Jaheira]Bei der kleinen Menge eher nicht. Wir sollten Grey bei nächster Gelegenheit nur gut trinken lassen!~ */
== BDIMOENB IF ~InMyArea("Jaheira") InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @5 /* ~[Imoen]Aye, ma'am!~ */
EXIT