BEGIN ~C#GRTAX1~

IF ~Global("C#Grey_TaxFee","GLOBAL",1)~ THEN tax
SAY ~Excuse me, my <PRO_LADYLORD>, but this seems to be your war dog?~
++ ~Yes, this dog belongs to me.~ + tax_02
++ ~What of it?~ + tax_02
++ ~No, he's just following me around.~ + tax_01
END

IF ~~ THEN tax_01
SAY ~Just following you around, hm?~
IF ~~ THEN + tax_02
END

IF ~~ THEN tax_02
SAY ~Athkatla is a great city, with many people living at one place - peacefully. To accomplish this, there are rules and city laws which have to be obeyed.~
++ ~I am totally with you here.~ + tax_04
++ ~Now comes a part where you remind me of some rule I need to obey in your opinion?~ + tax_03
++ ~And you are telling me this, because...?~ + tax_04
++ ~Make it quick, man, I don't have all day.~ + tax_04
END

IF ~~ THEN tax_03
SAY ~(smiles) Indeed.~
IF ~~ THEN + tax_04
END

IF ~~ THEN tax_04
SAY ~War dogs are a weapon, my <PRO_LADYLORD>, but one with an own mind. City rules are very strict if it comes to war dogs. I need to inform you that your war dog needs to have a collar, and a right one it needs to be - one where the dog could be put on a leash, if necessary. Your war dog doesn't have a collar. Therefore... (He fumbles inside a bag for a paper note.)~
= ~Therefore you are bound to pay a fee of 50 gold coins, due in three days to be payed in the Councellor Building in the Government District. *And* you need to get your dog a collar as of today, or the fee will be doubled.~
++ ~I will do so as soon as I have the gold and find a vendor who sells dog collars.~ + tax_07
++ ~Good man! I barely made it out alive from a foe that tortured me the last weeks. Where was the city when this happened under its area?!~ + tax_05
++ ~I really have other problems currently.~ + tax_08
++ ~Get lost, before my collarless dog decides to play fetch with you.~ + tax_09
END

IF ~~ THEN tax_05
SAY ~(sigh) You are not the first and surely not the last who tries to avoid the payment of a justified fee by telling an unfortunate tale.~
IF ~~ THEN + tax_08
END

IF ~~ THEN tax_06
SAY ~I am confident you are wise enough to abide by the rules of this city. Good day, my <PRO_LADYLORD>!~
IF ~~ THEN DO ~GiveItemCreate("c#grtax0",Player1,1,0,0) SetGlobal("C#Grey_TaxFee","GLOBAL",2) SetGlobalTimer("C#Grey_TaxTimer","GLOBAL",FOUR_DAYS) EscapeArea()~ UNSOLVED_JOURNAL ~Grey's Collar

Grey needs a collar inside Athkatla... and I need to pay a fee inside the Councellor Building during the next three days because he didn't have one, yet.~ EXIT
END

IF ~~ THEN tax_07
SAY ~Good, good.~
IF ~~ THEN + tax_06
END

IF ~~ THEN tax_08
SAY ~Your dog needs a collar, and you should go home and get the gold and pay the fee, before it is decided he might need a muzzle, as well.~
IF ~~ THEN + tax_06
END

IF ~~ THEN tax_09
SAY ~Do not try this tone with me, you would regret it.~
IF ~~ THEN + tax_08
END


BEGIN ~C#GRTAX2~

IF ~True()~ THEN feecollector
SAY ~What can I do for you, citizen?~
++ ~Who are you?~ + feecollector_05
+ ~GlobalLT("C#Grey_FeeSum","LOCALS",450)
GlobalGT("C#Grey_TaxFee","GLOBAL",1)
!GlobalTimerExpired("C#Grey_TaxTimer","GLOBAL")
Global("C#Grey_FeeHintSaid2","LOCALS",0)~ + ~I am here to pay the fee for my formerly collarless dog.~ DO ~SetGlobal("C#Grey_FeeHintSaid2","LOCALS",1)~ + feecollector_01

+ ~GlobalLT("C#Grey_FeeSum","LOCALS",450)
GlobalGT("C#Grey_TaxFee","GLOBAL",1)
!GlobalTimerExpired("C#Grey_TaxTimer","GLOBAL")
Global("C#Grey_FeeHintSaid2","LOCALS",1)~ + ~I am here to pay the fee for my formerly collarless dog.~ + feecollector_03

+ ~GlobalLT("C#Grey_FeeSum","LOCALS",450)
GlobalGT("C#Grey_TaxFee","GLOBAL",1)
GlobalTimerExpired("C#Grey_TaxTimer","GLOBAL")~ + ~I am here to pay the fee for my formerly collarless dog.~ DO ~IncrementGlobal("C#Grey_FeeSum","LOCALS",50)~ + feecollector_02

+ ~Global("C#Grey_FeeSum","LOCALS",450)~ + ~I am here to pay the fee for my formerly collarless dog.~ + feecollector_500

++ ~Nothing, good bye.~ + feecollector_06
END

IF ~~ THEN feecollector_01
SAY ~Ah, did Gregor find a collarless war dog at last.~ 
IF ~~ THEN + feecollector_03
END

IF ~~ THEN feecollector_02
SAY ~You are late, my <PRO_LADYLORD>. The fee was raised by another 50 gold coins.~
IF ~~ THEN + feecollector_03
END

IF ~~ THEN feecollector_03
SAY ~Please hand me the note.~ 
+ ~GlobalLT("C#Grey_FeeSum","LOCALS",450)
PartyHasItem("c#grtax0")
!HasItemEquiped("c#grcol2","C#Grey")
!HasItemEquiped("c#grcol3","C#Grey")
!HasItemEquiped("c#grcol4","C#Grey")
InMyArea("C#Grey")
Global("C#Grey_FeeHintSaid3","LOCALS",0)~ + ~Here it is.~ DO ~IncrementGlobal("C#Grey_FeeSum","LOCALS",50) SetGlobal("C#Grey_FeeHintSaid3","LOCALS",1)~ + feecollector_04

+ ~GlobalLT("C#Grey_FeeSum","LOCALS",450)
PartyHasItem("c#grtax0")
!HasItemEquiped("c#grcol2","C#Grey")
!HasItemEquiped("c#grcol3","C#Grey")
!HasItemEquiped("c#grcol4","C#Grey")
InMyArea("C#Grey")
Global("C#Grey_FeeHintSaid3","LOCALS",1)~ + ~Here it is.~ DO ~IncrementGlobal("C#Grey_FeeSum","LOCALS",50)~ + feecollector_04_again

+ ~GlobalLT("C#Grey_FeeSum","LOCALS",450)
PartyHasItem("c#grtax0")
OR(4)
	HasItemEquiped("c#grcol2","C#Grey")
	HasItemEquiped("c#grcol3","C#Grey")
	HasItemEquiped("c#grcol4","C#Grey")
	!InMyArea("C#Grey")~ + ~Here it is.~ + feecollector_sum
IF ~GlobalLT("C#Grey_FeeSum","LOCALS",450)
!PartyHasItem("c#grtax0")~ THEN + feecollector_no_note

IF ~Global("C#Grey_FeeSum","LOCALS",450)~ THEN + feecollector_500
END

IF ~~ THEN feecollector_04
SAY ~And I see your dog still has no collar! Do you think we take the law lightly in this city? The fee was increased by another 50 gold coins.~
IF ~~ THEN + feecollector_sum
IF ~Global("C#Grey_FeeHintSaid1","LOCALS",0)~ THEN DO ~SetGlobal("C#Grey_FeeHintSaid1","LOCALS",1)~ + feecollector_04_0
END

IF ~~ THEN feecollector_04_again
SAY ~And I see your dog *still* has no collar! Are you trying to test my patience? The fee was increased by another 50 gold coins!~
IF ~~ THEN + feecollector_sum
END

IF ~~ THEN feecollector_04_0
SAY ~I see you are new to this town. I will refrain from charging you with a fine according to act §45.b 'Bringing Uncommonly Dangerous Weaponry Inside The Councellor's Building'. But make sure this doesn't happen again!~
IF ~~ THEN + feecollector_sum
END

IF ~~ THEN feecollector_05
SAY ~My name is Hector, and I am collecting fees and taxes. In the unfortunate event of you collecting a note about a sum you'll have to pay, I am the one to come to.~
IF ~~ THEN + feecollector
END

IF ~~ THEN feecollector_06
SAY ~Very well. Good day to you.~
IF ~~ THEN EXIT
END

IF ~~ THEN feecollector_sum
SAY ~Let's see what we've got.~
IF ~Global("C#Grey_FeeSum","LOCALS",0)~ THEN + feecollector_50
IF ~Global("C#Grey_FeeSum","LOCALS",50)~ THEN + feecollector_100
IF ~Global("C#Grey_FeeSum","LOCALS",100)~ THEN + feecollector_150
IF ~Global("C#Grey_FeeSum","LOCALS",150)~ THEN + feecollector_200
IF ~Global("C#Grey_FeeSum","LOCALS",200)~ THEN + feecollector_250
IF ~Global("C#Grey_FeeSum","LOCALS",250)~ THEN + feecollector_300
IF ~Global("C#Grey_FeeSum","LOCALS",300)~ THEN + feecollector_350
IF ~Global("C#Grey_FeeSum","LOCALS",350)~ THEN + feecollector_400
IF ~Global("C#Grey_FeeSum","LOCALS",400)~ THEN + feecollector_450
IF ~Global("C#Grey_FeeSum","LOCALS",450)~ THEN + feecollector_500
END

IF ~~ THEN feecollector_50
SAY ~50 gold coins, please.~
IF ~PartyGoldGT(49)~ THEN DO ~TakePartyGold(50)~ + feecollector_paid
IF ~PartyGoldLT(50)~ THEN + feecollector_notpaid
END

IF ~~ THEN feecollector_100
SAY ~100 gold coins, please.~
IF ~PartyGoldGT(99)~ THEN DO ~TakePartyGold(100)~ + feecollector_paid
IF ~PartyGoldLT(100)~ THEN + feecollector_notpaid
END

IF ~~ THEN feecollector_150
SAY ~150 gold coins, please.~
IF ~PartyGoldGT(149)~ THEN DO ~TakePartyGold(150)~ + feecollector_paid
IF ~PartyGoldLT(150)~ THEN + feecollector_notpaid
END

IF ~~ THEN feecollector_200
SAY ~200 gold coins, please.~
IF ~PartyGoldGT(199)~ THEN DO ~TakePartyGold(200)~ + feecollector_paid
IF ~PartyGoldLT(200)~ THEN + feecollector_notpaid
END

IF ~~ THEN feecollector_250
SAY ~250 gold coins, please.~
IF ~PartyGoldGT(249)~ THEN DO ~TakePartyGold(250)~ + feecollector_paid
IF ~PartyGoldLT(250)~ THEN + feecollector_notpaid
END

IF ~~ THEN feecollector_300
SAY ~300 gold coins, please.~
IF ~PartyGoldGT(299)~ THEN DO ~TakePartyGold(300)~ + feecollector_paid
IF ~PartyGoldLT(300)~ THEN + feecollector_notpaid
END

IF ~~ THEN feecollector_350
SAY ~350 gold coins, please.~
IF ~PartyGoldGT(349)~ THEN DO ~TakePartyGold(350)~ + feecollector_paid
IF ~PartyGoldLT(350)~ THEN + feecollector_notpaid
END

IF ~~ THEN feecollector_400
SAY ~400 gold coins, please.~
IF ~PartyGoldGT(399)~ THEN DO ~TakePartyGold(400)~ + feecollector_paid
IF ~PartyGoldLT(400)~ THEN + feecollector_notpaid
END

IF ~~ THEN feecollector_450
SAY ~450 gold coins, please.~
IF ~PartyGoldGT(449)~ THEN DO ~TakePartyGold(450)~ + feecollector_paid
IF ~PartyGoldLT(450)~ THEN + feecollector_notpaid
END

IF ~~ THEN feecollector_500
SAY ~*Luckily* for you, the fee will not rise above 500 gold coins.~
IF ~PartyGoldGT(499)~ THEN DO ~TakePartyGold(500)~ + feecollector_paid
IF ~PartyGoldLT(500)~ THEN + feecollector_notpaid
END

IF ~~ THEN feecollector_paid
SAY ~Very well, this is settled, then. Do not let your dog be seen again without a collar, or a new note will be handed to you. Good day to you, citizen.~
IF ~~ THEN DO ~TakePartyItem("c#grtax0") SetGlobal("C#Grey_FeeSum","LOCALS",1000)
EraseJournalEntry(%Grey's Collar

Grey needs a collar inside Athkatla... and I need to pay a fee inside the Councellor Building during the next three days because he didn't have one, yet.%)~ EXIT
END

IF ~~ THEN feecollector_notpaid
SAY ~But... With what were you planning on paying me? (sigh) Fortunate for you and unfortunate for me, there is no law against stealing my time, as it seems. Remember the sum you need, and be quick about paying it! You have another three days to clear your debts. Good day to you, citizen.~
IF ~~ THEN DO ~SetGlobalTimer("C#Grey_TaxTimer","GLOBAL",FOUR_DAYS)~ EXIT
END

IF ~~ THEN feecollector_no_note
SAY ~So, where is the note? How should I know what you are supposed to pay if you don't show me the note you received? Go and come back with the note that was handed to you.~
++ ~I will get it as soon as possible.~ + feecollector_06
++ ~I don't have it any more. I think I lost it.~ DO ~GiveItemCreate("c#grtax0",Player1,1,0,0) IncrementGlobal("C#Grey_FeeSum","LOCALS",50)~ + feecollector_no_note_01
END

IF ~~ THEN feecollector_no_note_01
SAY ~What do you mean, you *lost* the note?! How do you think am I supposed to close the process if I don't have a note to stamp and file? (deep sigh)~
= ~Here you go - a new note. And because it's newly issued, the fee for the new note is an additional 50 gold coins.~
IF ~~ THEN + feecollector_sum
END


/* Ask Hawker in Promenade about War Dog items */

EXTEND_BOTTOM HAWKER01 0
+ ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) InMyArea("C#Grey") Global("C#Grey_HAWKER01_1","GLOBAL",0)~ + ~Do you have gear for war dogs, as well?~ DO ~SetGlobal("C#Grey_HAWKER01_1","GLOBAL",1)~ + wardog
END

APPEND HAWKER01 

IF ~~ THEN wardog
SAY ~We do have also high quality war dog armor and weapons, good <PRO_SIRMAAM>, as well as collars of all varieties!~
IF ~~ THEN EXIT
END

END //APPEND

I_C_T HAWKER01 1 C#Grey_HAWKER01_1
== HAWKER01 IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) InMyArea("C#Grey")~ THEN ~We do have also high quality war dog armor and weapons, good <PRO_SIRMAAM>, as well as collars of all varieties!~
END

I_C_T RIBALD 0 C#Grey_RIBALD_0
== RIBALD IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) InMyArea("C#Grey")
!HasItemEquiped("c#grcol2","C#Grey")
!HasItemEquiped("c#grcol3","C#Grey")
!HasItemEquiped("c#grcol4","C#Grey")~ THEN ~I see your war dog still needs a collar! Hopefully Gregor the tax collector did not see you yet? I assure you, I am not in league with him in any way, although some people might say it, as often as he is seen outside near my shop! Still, I recommend buying one of my collars - you won't find a better quality in all of Athkatla!~
END



