APPEND C#GreyJ 

IF WEIGHT #-1
~Global("C#Grey_JAPDopple","GLOBAL",1)~ THEN doppel_sniff
SAY @0
++ @1 + doppel_sniff_01
++ @2 + doppel_sniff_02
++ @3 + doppel_sniff_02
++ @4 + doppel_sniff_02
END

IF ~~ THEN doppel_sniff_01
SAY @5
++ @2 + doppel_sniff_02
++ @3 + doppel_sniff_02
++ @4 + doppel_sniff_02
END

IF ~~ THEN doppel_sniff_02
SAY @6
IF ~~ THEN DO ~SetGlobal("C#Grey_JAPDopple","GLOBAL",2)~ EXIT
END

END //APPEND C#GreyJ