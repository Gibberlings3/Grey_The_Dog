/* Grey's BGII "interjections" and reactions */

/* Bodhi smells funny, too */
I_C_T BODHI 0 C#Grey2_BODHI_0
== c#greyj IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN ~Grrrrr!~ [c#GREY06]
== BODHI IF ~OR(2) InParty("C#Grey") Global("C#GreyJoined","GLOBAL",2) 
InMyArea("C#Grey") !StateCheck("C#Grey",CD_STATE_NOTVALID)~ THEN ~(smiles) Hello to you, too, little dog.~
END