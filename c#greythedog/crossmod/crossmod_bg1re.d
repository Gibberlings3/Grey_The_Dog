/*   C#Q11005.itm - cow meat from bg1re */

APPEND c#GreyJ



IF WEIGHT #-1
~Global("C#Grey_BertaBeef","GLOBAL",1)~ THEN dog_meat
SAY ~whine!~
= ~Whine! (Grey looks at the beef with begging dog eyes.)~
++ ~What is it, Grey?~ + dog_meat_02
++ ~Is it the beef you want?~ + dog_meat_03
++ ~No, Grey. The meat is mine.~ + dog_meat_01
++ ~Hush! Stupid dog!~ + dog_meat_01
END

IF ~~ THEN dog_meat_01
SAY ~Whine!~ [C#Grey07]
IF ~~ THEN DO ~SetGlobal("C#Grey_BertaBeef","GLOBAL",2)~ EXIT
END

IF ~~ THEN dog_meat_02
SAY ~(Grey tries to lick the meat.)~
++ ~Is it the meat you want?~ + dog_meat_03
++ ~No, Grey. The meat is mine.~ + dog_meat_01
++ ~Hush! Stupid dog!~ + dog_meat_01
END

IF ~~ THEN dog_meat_03
SAY ~Woof! (waggles tail)~
++ ~Aaalright. You'll get a bite soon.~ + dog_meat_04
++ ~No, Grey. The meat is mine.~ + dog_meat_01
++ ~Hush! Stupid dog!~ + dog_meat_01
END

IF ~~ THEN dog_meat_04
SAY ~Woof!~ [C#Grey01]
IF ~~ THEN DO ~SetGlobal("C#Grey_BertaBeef","GLOBAL",2)~ EXIT
END

END