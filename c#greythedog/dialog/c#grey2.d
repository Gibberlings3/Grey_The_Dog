/* SoA - Grey was protected by the dryads. I don't need a dog with trauma */

BEGIN C#Grey2

CHAIN
IF WEIGHT #-1
~Global("C#Grey_Exists","GLOBAL",13)~ THEN C#Grey2 meeting_id
~Woof!~ 
== IDRYAD1 IF ~!Dead("Ulene")
!StateCheck("Ulene",CD_STATE_NOTVALID)
InMyArea("Ulene")~ THEN ~Is it <PRO_HIMHER>?~
== IDRYAD2 IF ~!Dead("Cania")
!StateCheck("Cania",CD_STATE_NOTVALID)
InMyArea("Cania")
Gender(Player1,FEMALE)~ THEN ~Is it your mistress?~
== IDRYAD2 IF ~!Dead("Cania")
!StateCheck("Cania",CD_STATE_NOTVALID)
InMyArea("Cania")
Gender(Player1,MALE)~ THEN ~Is it your master?~
== IDRYAD3 IF ~!Dead("Elyme")
!StateCheck("Elyme",CD_STATE_NOTVALID)
InMyArea("Elyme")~ THEN ~It is time to return, then.~
== IDRYAD1 IF ~!Dead("Ulene")
!StateCheck("Ulene",CD_STATE_NOTVALID)
InMyArea("Ulene")~ THEN ~We hid him. He does not belong in a dungeon.~
== IDRYAD2 IF ~!Dead("Cania")
!StateCheck("Cania",CD_STATE_NOTVALID)
InMyArea("Cania")~ THEN ~Ilyich took our acorns, so we took your dog from them. They claimed him when you were brought in.~
== IDRYAD3 IF ~!Dead("Elyme")
!StateCheck("Elyme",CD_STATE_NOTVALID)
InMyArea("Elyme")~ THEN ~The duergar wanted to turn him into a bloodthirsty beast. We took him and hid him beneath our trees.~
END
+ ~!Dead("Ulene") !StateCheck("Ulene",CD_STATE_NOTVALID)
InMyArea("Ulene")~ + ~You saved my dog. I thank you!~ + meeting_id_01
+ ~Global("C#Grey_Exists","GLOBAL",10)~ + ~Grey! You managed to get out of the dungeon, too?~ + meeting_id_01
++ ~Grey! You look all healthy and happy. It's good to see you!~ + meeting_id_01
++ ~There he is, again.~ + meeting_id_01

APPEND C#Grey2

IF ~~ THEN meeting_id_01
SAY ~Woof!~
IF ~~ THEN DO ~SetGlobal("C#GreyJoined","GLOBAL",1)
SetGlobal("C#Grey_Exists","GLOBAL",14)
JoinParty()~ EXIT
END

END