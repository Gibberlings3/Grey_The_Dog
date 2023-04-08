CHAIN
IF 
~%IT_IS_SOD%
CombatCounter(0) !See([ENEMY]) 
InParty("Ajantis")
InParty("C#Grey")
!StateCheck("C#Grey",CD_STATE_NOTVALID)
!StateCheck("Ajantis",CD_STATE_NOTVALID)
See("C#Grey") See(Player1)
Global("C#AjSoD_GreyBanter","GLOBAL",0)~ THEN BDAJANTB ajantis_grey_sod_1
@0 /* [Ajantis]Grey, did you smell something intersting back there? - <CHARNAME>, Grey's fur needs a good brushing. His curiosity lets him collect all sorts of things. */
DO ~SetGlobal("C#AjSoD_GreyBanter","GLOBAL",1)~
== BDNEERAB IF ~InMyArea("Neera") InParty("Neera") !StateCheck("Neera",CD_STATE_NOTVALID)~ THEN @1 /* [Neera]Yeah, all sorts of nasty things, too. I don't want to know how many ticks he collected this time. */
END
++ @2 /* Definitely. It's one of the things he can't do himself, I guess. */ + ajantis_grey_sod_1_02
++ @3 /* We'll see. */ + ajantis_grey_sod_1_02
++ @4 /* Great idea! How about you do that, Ajantis. */ + ajantis_grey_sod_1_01

APPEND BDAJANTB
IF ~~ THEN ajantis_grey_sod_1_01
SAY @5 /* [Ajantis]I can do it after I tended to my own weapons and armor, if you wish. */
IF ~~ THEN + ajantis_grey_sod_1_02
END

IF ~~ THEN ajantis_grey_sod_1_02
SAY @6 /* [Ajantis]It is time well spent. Grey does not only feel better, but will also be a more reliable fighting asset if he is well tended to. */
++ @7 /* "Fighting asset"? Do you see him on the same level as your weapon? */ + ajantis_grey_sod_1_03
++ @8 /* If he's a fighting asset than so are you, Ajantis. */ + ajantis_grey_sod_1_03
++ @9 /* He is more than that. */ + ajantis_grey_sod_1_03
++ @10 /* Definitely. Just like sharpening a sword, Grey also needs training to be reliable. */ + ajantis_grey_sod_1_04
END

IF ~~ THEN ajantis_grey_sod_1_03
SAY @11 /* [Ajantis]Of course he is a living, breathing creature - and a loyal one, as that. But yes, I also see him as an asset, a tool of sorts. Would he be a pet, we would not have the time nor ressources to take him with us - do you not agree? */
IF ~~ THEN + ajantis_grey_sod_1_04
END

IF ~~ THEN ajantis_grey_sod_1_04
SAY @12 /* [Ajantis]Fact is, that he is not able to tend to his fur himself. I am well ready to support you - and him - in whatever is needed. */
IF ~~ THEN EXIT
END
END //APPEND