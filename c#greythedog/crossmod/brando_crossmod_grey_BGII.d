/* crossmod with Brandock the Mage - BGII */

CHAIN
IF WEIGHT #-1 
~%IT_IS_BG2%
CombatCounter(0) !See([ENEMY]) 
OR(2) InParty("C#Brandock") Global("C#BrandockJoined","GLOBAL",2)
OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2)
See("C#Grey") See(Player1)
!StateCheck("C#Grey",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#Brandock_GreyBG2","GLOBAL",0)
GlobalGT("C#Grey_TaxFee","GLOBAL",0)~ THEN C#BrandB brandockgrey2_1
~They made you pay because Grey had no collar? Sometimes I just love the byrocracy in this city. When going to the Councelor Building, did you notice the poor farmer who's house is taxed like a castle? You'd think something like this should be corrected soon, wouldn't you? But handing out notes because of a missing collar - *that* works.~
DO ~SetGlobal("C#Brandock_GreyBG2","GLOBAL",1)~
EXIT

