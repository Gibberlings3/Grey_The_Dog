/*   C#Q11005.itm - cow meat from bg1re */

APPEND c#GreyJ



IF WEIGHT #-1
~Global("C#Grey_BertaBeef","GLOBAL",1)~ THEN dog_meat
SAY @0
= @1
++ @2 + dog_meat_02
++ @3 + dog_meat_03
++ @4 + dog_meat_01
++ @5 + dog_meat_01
END

IF ~~ THEN dog_meat_01
SAY @6
IF ~~ THEN DO ~SetGlobal("C#Grey_BertaBeef","GLOBAL",2)~ EXIT
END

IF ~~ THEN dog_meat_02
SAY @7
++ @8 + dog_meat_03
++ @4 + dog_meat_01
++ @5 + dog_meat_01
END

IF ~~ THEN dog_meat_03
SAY @9
++ @10 + dog_meat_04
++ @4 + dog_meat_01
++ @5 + dog_meat_01
END

IF ~~ THEN dog_meat_04
SAY @11
IF ~~ THEN DO ~SetGlobal("C#Grey_BertaBeef","GLOBAL",2)~ EXIT
END

END