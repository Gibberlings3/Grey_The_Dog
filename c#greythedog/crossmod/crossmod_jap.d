APPEND C#GreyJ 

IF WEIGHT #-1
~Global("C#Grey_JAPDopple","GLOBAL",1)~ THEN doppel_sniff
SAY ~(Grey sniffs extensively at the people in this room. Then he looks at you, and growls.)~ [c#GREY06]
++ ~Are they smelling confusing?~ + doppel_sniff_01
++ ~Grey, you sense something, I get it. We have to see how it turns out.~ + doppel_sniff_02
++ ~If here is something amiss, we will find out soon enough, Grey. Thanks for the heads up.~ + doppel_sniff_02
++ ~Stop sniffing, Grey, whatever the cause!~ + doppel_sniff_02
END

IF ~~ THEN werewolf_sniff_01
SAY ~(whines)~ [C#Grey07]
++ ~Grey, you sense something, I get it. We have to see how it turns out.~ + doppel_sniff_02
++ ~If here is something amiss, we will find out soon enough, Grey. Thanks for the heads up.~ + doppel_sniff_02
++ ~Stop sniffing, Grey, whatever the cause!~ + doppel_sniff_02
END

IF ~~ THEN werewolf_sniff_02
SAY ~Woof!~ [C#Grey01]
IF ~~ THEN DO ~SetGlobal("C#Grey_JAPDopple","GLOBAL",2)~ EXIT
END

END //APPEND C#GreyJ