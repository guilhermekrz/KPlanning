; Generated by ProblemGenerator - Problem 49 at Mon Nov 28 15:07:22 BRST 2016
(define (problem pb49)
	(:domain drinkanddrive-generated)
	(:requirements :strips :typing :negative-preconditions)
	(:objects
		loc1 loc2 loc3 loc4 loc5 loc6 loc7 loc8 loc9 loc10 loc11 loc12 loc13 loc14 loc15 loc16 loc17 loc18 loc19 loc20 loc21 loc22 loc23 loc24 loc25 loc26 loc27 loc28 loc29 loc30 loc31 loc32 loc33 loc34 loc35 loc36 loc37 loc38 loc39 loc40 loc41 loc42 loc43 loc44 loc45 loc46 loc47 loc48 loc49 loc50 loc51 loc52 loc53 loc54 loc55 loc56 loc57 loc58 loc59 loc60 loc61 loc62 loc63 loc64 loc65 loc66 loc67 loc68 loc69 loc70 loc71 loc72 loc73 loc74 loc75 loc76 loc77 loc78 loc79 loc80 loc81 loc82 loc83 loc84 loc85 loc86 loc87 loc88 loc89 loc90 loc91 loc92 loc93 loc94 loc95 loc96 loc97 loc98 loc99 - location
		bar1 bar3 bar6 bar8 bar9 bar15 bar18 bar24 bar25 bar26 bar27 bar31 bar33 bar34 bar40 bar44 bar45 bar46 bar47 bar48 bar49 bar51 bar52 bar53 bar54 bar56 bar58 bar61 bar62 bar64 bar65 bar66 bar67 bar71 bar72 bar73 bar75 bar76 bar78 bar79 bar80 bar81 bar82 bar83 bar85 bar86 bar87 bar89 bar90 bar97 bar98 - bar
	)
	(:init
		(at loc1)

		(connected loc71 loc32)
		(connected loc32 loc71)
		(connected loc32 loc97)
		(connected loc97 loc32)
		(connected loc97 loc45)
		(connected loc45 loc97)
		(connected loc45 loc10)
		(connected loc10 loc45)
		(connected loc10 loc30)
		(connected loc30 loc10)
		(connected loc30 loc33)
		(connected loc33 loc30)
		(connected loc33 loc18)
		(connected loc18 loc33)
		(connected loc18 loc68)
		(connected loc68 loc18)
		(connected loc68 loc51)
		(connected loc51 loc68)
		(connected loc51 loc4)
		(connected loc4 loc51)
		(connected loc4 loc44)
		(connected loc44 loc4)
		(connected loc44 loc46)
		(connected loc46 loc44)
		(connected loc46 loc1)
		(connected loc1 loc46)
		(connected loc1 loc66)
		(connected loc66 loc1)
		(connected loc66 loc13)
		(connected loc13 loc66)
		(connected loc13 loc2)
		(connected loc2 loc13)
		(connected loc2 loc25)
		(connected loc25 loc2)
		(connected loc25 loc61)
		(connected loc61 loc25)
		(connected loc30 loc62)
		(connected loc62 loc30)
		(connected loc30 loc88)
		(connected loc88 loc30)
		(connected loc88 loc12)
		(connected loc12 loc88)
		(connected loc25 loc28)
		(connected loc28 loc25)
		(connected loc28 loc75)
		(connected loc75 loc28)
		(connected loc62 loc85)
		(connected loc85 loc62)
		(connected loc85 loc73)
		(connected loc73 loc85)
		(connected loc25 loc47)
		(connected loc47 loc25)
		(connected loc30 loc65)
		(connected loc65 loc30)
		(connected loc65 loc9)
		(connected loc9 loc65)
		(connected loc9 loc90)
		(connected loc90 loc9)
		(connected loc90 loc76)
		(connected loc76 loc90)
		(connected loc76 loc26)
		(connected loc26 loc76)
		(connected loc26 loc14)
		(connected loc14 loc26)
		(connected loc14 loc20)
		(connected loc20 loc14)
		(connected loc20 loc96)
		(connected loc96 loc20)
		(connected loc96 loc35)
		(connected loc35 loc96)
		(connected loc12 loc23)
		(connected loc23 loc12)
		(connected loc35 loc84)
		(connected loc84 loc35)
		(connected loc84 loc5)
		(connected loc5 loc84)
		(connected loc5 loc38)
		(connected loc38 loc5)
		(connected loc38 loc74)
		(connected loc74 loc38)
		(connected loc74 loc81)
		(connected loc81 loc74)
		(connected loc81 loc17)
		(connected loc17 loc81)
		(connected loc17 loc98)
		(connected loc98 loc17)
		(connected loc98 loc63)
		(connected loc63 loc98)
		(connected loc63 loc21)
		(connected loc21 loc63)
		(connected loc21 loc24)
		(connected loc24 loc21)
		(connected loc97 loc42)
		(connected loc42 loc97)
		(connected loc42 loc54)
		(connected loc54 loc42)
		(connected loc54 loc58)
		(connected loc58 loc54)
		(connected loc58 loc95)
		(connected loc95 loc58)
		(connected loc95 loc69)
		(connected loc69 loc95)
		(connected loc24 loc77)
		(connected loc77 loc24)
		(connected loc44 loc37)
		(connected loc37 loc44)
		(connected loc37 loc67)
		(connected loc67 loc37)
		(connected loc76 loc60)
		(connected loc60 loc76)
		(connected loc60 loc6)
		(connected loc6 loc60)
		(connected loc6 loc40)
		(connected loc40 loc6)
		(connected loc13 loc55)
		(connected loc55 loc13)
		(connected loc10 loc31)
		(connected loc31 loc10)
		(connected loc9 loc93)
		(connected loc93 loc9)
		(connected loc97 loc80)
		(connected loc80 loc97)
		(connected loc80 loc43)
		(connected loc43 loc80)
		(connected loc43 loc41)
		(connected loc41 loc43)
		(connected loc41 loc48)
		(connected loc48 loc41)
		(connected loc48 loc19)
		(connected loc19 loc48)
		(connected loc51 loc64)
		(connected loc64 loc51)
		(connected loc64 loc83)
		(connected loc83 loc64)
		(connected loc83 loc92)
		(connected loc92 loc83)
		(connected loc92 loc27)
		(connected loc27 loc92)
		(connected loc41 loc52)
		(connected loc52 loc41)
		(connected loc62 loc11)
		(connected loc11 loc62)
		(connected loc14 loc53)
		(connected loc53 loc14)
		(connected loc75 loc99)
		(connected loc99 loc75)
		(connected loc75 loc87)
		(connected loc87 loc75)
		(connected loc96 loc56)
		(connected loc56 loc96)
		(connected loc84 loc50)
		(connected loc50 loc84)
		(connected loc99 loc91)
		(connected loc91 loc99)
		(connected loc97 loc15)
		(connected loc15 loc97)
		(connected loc43 loc34)
		(connected loc34 loc43)
		(connected loc55 loc70)
		(connected loc70 loc55)
		(connected loc45 loc82)
		(connected loc82 loc45)
		(connected loc38 loc86)
		(connected loc86 loc38)
		(connected loc86 loc8)
		(connected loc8 loc86)
		(connected loc8 loc29)
		(connected loc29 loc8)
		(connected loc13 loc22)
		(connected loc22 loc13)
		(connected loc60 loc59)
		(connected loc59 loc60)
		(connected loc12 loc89)
		(connected loc89 loc12)
		(connected loc89 loc7)
		(connected loc7 loc89)
		(connected loc97 loc49)
		(connected loc49 loc97)
		(connected loc49 loc57)
		(connected loc57 loc49)
		(connected loc74 loc16)
		(connected loc16 loc74)
		(connected loc21 loc79)
		(connected loc79 loc21)
		(connected loc91 loc36)
		(connected loc36 loc91)
		(connected loc89 loc72)
		(connected loc72 loc89)
		(connected loc65 loc94)
		(connected loc94 loc65)
		(connected loc43 loc39)
		(connected loc39 loc43)
		(connected loc80 loc78)
		(connected loc78 loc80)
		(connected loc98 loc3)
		(connected loc3 loc98)
		(connected loc1 loc7)
		(connected loc7 loc1)
		(connected loc1 loc10)
		(connected loc10 loc1)
		(connected loc1 loc15)
		(connected loc15 loc1)
		(connected loc1 loc17)
		(connected loc17 loc1)
		(connected loc1 loc28)
		(connected loc28 loc1)
		(connected loc1 loc63)
		(connected loc63 loc1)
		(connected loc2 loc4)
		(connected loc4 loc2)
		(connected loc2 loc5)
		(connected loc5 loc2)
		(connected loc2 loc48)
		(connected loc48 loc2)
		(connected loc2 loc65)
		(connected loc65 loc2)
		(connected loc2 loc67)
		(connected loc67 loc2)
		(connected loc2 loc77)
		(connected loc77 loc2)
		(connected loc3 loc12)
		(connected loc12 loc3)
		(connected loc3 loc17)
		(connected loc17 loc3)
		(connected loc3 loc33)
		(connected loc33 loc3)
		(connected loc3 loc53)
		(connected loc53 loc3)
		(connected loc3 loc61)
		(connected loc61 loc3)
		(connected loc3 loc75)
		(connected loc75 loc3)
		(connected loc4 loc6)
		(connected loc6 loc4)
		(connected loc4 loc10)
		(connected loc10 loc4)
		(connected loc4 loc11)
		(connected loc11 loc4)
		(connected loc4 loc15)
		(connected loc15 loc4)
		(connected loc5 loc9)
		(connected loc9 loc5)
		(connected loc5 loc17)
		(connected loc17 loc5)
		(connected loc5 loc34)
		(connected loc34 loc5)
		(connected loc5 loc35)
		(connected loc35 loc5)
		(connected loc5 loc42)
		(connected loc42 loc5)
		(connected loc5 loc53)
		(connected loc53 loc5)
		(connected loc6 loc5)
		(connected loc5 loc6)
		(connected loc6 loc19)
		(connected loc19 loc6)
		(connected loc6 loc34)
		(connected loc34 loc6)
		(connected loc6 loc44)
		(connected loc44 loc6)
		(connected loc7 loc34)
		(connected loc34 loc7)
		(connected loc7 loc35)
		(connected loc35 loc7)
		(connected loc7 loc39)
		(connected loc39 loc7)
		(connected loc7 loc67)
		(connected loc67 loc7)
		(connected loc7 loc96)
		(connected loc96 loc7)
		(connected loc8 loc3)
		(connected loc3 loc8)
		(connected loc8 loc9)
		(connected loc9 loc8)
		(connected loc8 loc28)
		(connected loc28 loc8)
		(connected loc8 loc31)
		(connected loc31 loc8)
		(connected loc8 loc40)
		(connected loc40 loc8)
		(connected loc8 loc49)
		(connected loc49 loc8)
		(connected loc9 loc15)
		(connected loc15 loc9)
		(connected loc9 loc46)
		(connected loc46 loc9)
		(connected loc9 loc52)
		(connected loc52 loc9)
		(connected loc9 loc79)
		(connected loc79 loc9)
		(connected loc10 loc1)
		(connected loc1 loc10)
		(connected loc10 loc9)
		(connected loc9 loc10)
		(connected loc10 loc13)
		(connected loc13 loc10)
		(connected loc10 loc25)
		(connected loc25 loc10)
		(connected loc10 loc33)
		(connected loc33 loc10)
		(connected loc10 loc36)
		(connected loc36 loc10)
		(connected loc10 loc42)
		(connected loc42 loc10)
		(connected loc10 loc75)
		(connected loc75 loc10)
		(connected loc10 loc92)
		(connected loc92 loc10)
		(connected loc11 loc1)
		(connected loc1 loc11)
		(connected loc11 loc7)
		(connected loc7 loc11)
		(connected loc11 loc18)
		(connected loc18 loc11)
		(connected loc11 loc36)
		(connected loc36 loc11)
		(connected loc11 loc40)
		(connected loc40 loc11)
		(connected loc11 loc49)
		(connected loc49 loc11)
		(connected loc11 loc57)
		(connected loc57 loc11)
		(connected loc11 loc73)
		(connected loc73 loc11)
		(connected loc12 loc7)
		(connected loc7 loc12)
		(connected loc12 loc35)
		(connected loc35 loc12)
		(connected loc12 loc58)
		(connected loc58 loc12)
		(connected loc12 loc64)
		(connected loc64 loc12)
		(connected loc13 loc6)
		(connected loc6 loc13)
		(connected loc13 loc10)
		(connected loc10 loc13)
		(connected loc13 loc11)
		(connected loc11 loc13)
		(connected loc13 loc15)
		(connected loc15 loc13)
		(connected loc13 loc17)
		(connected loc17 loc13)
		(connected loc13 loc28)
		(connected loc28 loc13)
		(connected loc13 loc32)
		(connected loc32 loc13)
		(connected loc13 loc43)
		(connected loc43 loc13)
		(connected loc13 loc54)
		(connected loc54 loc13)
		(connected loc13 loc82)
		(connected loc82 loc13)
		(connected loc14 loc1)
		(connected loc1 loc14)
		(connected loc14 loc19)
		(connected loc19 loc14)
		(connected loc14 loc33)
		(connected loc33 loc14)
		(connected loc14 loc34)
		(connected loc34 loc14)
		(connected loc14 loc46)
		(connected loc46 loc14)
		(connected loc14 loc56)
		(connected loc56 loc14)
		(connected loc15 loc19)
		(connected loc19 loc15)
		(connected loc15 loc33)
		(connected loc33 loc15)
		(connected loc15 loc34)
		(connected loc34 loc15)
		(connected loc15 loc35)
		(connected loc35 loc15)
		(connected loc15 loc62)
		(connected loc62 loc15)
		(connected loc16 loc31)
		(connected loc31 loc16)
		(connected loc16 loc38)
		(connected loc38 loc16)
		(connected loc16 loc42)
		(connected loc42 loc16)
		(connected loc16 loc45)
		(connected loc45 loc16)
		(connected loc16 loc79)
		(connected loc79 loc16)
		(connected loc17 loc14)
		(connected loc14 loc17)
		(connected loc17 loc18)
		(connected loc18 loc17)
		(connected loc17 loc28)
		(connected loc28 loc17)
		(connected loc17 loc47)
		(connected loc47 loc17)
		(connected loc17 loc64)
		(connected loc64 loc17)
		(connected loc17 loc86)
		(connected loc86 loc17)
		(connected loc17 loc88)
		(connected loc88 loc17)
		(connected loc18 loc5)
		(connected loc5 loc18)
		(connected loc18 loc19)
		(connected loc19 loc18)
		(connected loc18 loc37)
		(connected loc37 loc18)
		(connected loc18 loc39)
		(connected loc39 loc18)
		(connected loc19 loc9)
		(connected loc9 loc19)
		(connected loc19 loc15)
		(connected loc15 loc19)
		(connected loc19 loc26)
		(connected loc26 loc19)
		(connected loc20 loc16)
		(connected loc16 loc20)
		(connected loc20 loc29)
		(connected loc29 loc20)
		(connected loc20 loc33)
		(connected loc33 loc20)
		(connected loc20 loc53)
		(connected loc53 loc20)
		(connected loc20 loc56)
		(connected loc56 loc20)
		(connected loc20 loc85)
		(connected loc85 loc20)
		(connected loc21 loc8)
		(connected loc8 loc21)
		(connected loc21 loc45)
		(connected loc45 loc21)
		(connected loc21 loc71)
		(connected loc71 loc21)
		(connected loc21 loc89)
		(connected loc89 loc21)
		(connected loc22 loc4)
		(connected loc4 loc22)
		(connected loc22 loc33)
		(connected loc33 loc22)
		(connected loc22 loc47)
		(connected loc47 loc22)
		(connected loc22 loc77)
		(connected loc77 loc22)
		(connected loc22 loc81)
		(connected loc81 loc22)
		(connected loc23 loc25)
		(connected loc25 loc23)
		(connected loc23 loc30)
		(connected loc30 loc23)
		(connected loc23 loc36)
		(connected loc36 loc23)
		(connected loc23 loc54)
		(connected loc54 loc23)
		(connected loc23 loc56)
		(connected loc56 loc23)
		(connected loc24 loc32)
		(connected loc32 loc24)
		(connected loc24 loc35)
		(connected loc35 loc24)
		(connected loc24 loc87)
		(connected loc87 loc24)
		(connected loc25 loc13)
		(connected loc13 loc25)
		(connected loc25 loc14)
		(connected loc14 loc25)
		(connected loc25 loc21)
		(connected loc21 loc25)
		(connected loc25 loc23)
		(connected loc23 loc25)
		(connected loc25 loc41)
		(connected loc41 loc25)
		(connected loc25 loc46)
		(connected loc46 loc25)
		(connected loc25 loc73)
		(connected loc73 loc25)
		(connected loc26 loc11)
		(connected loc11 loc26)
		(connected loc26 loc13)
		(connected loc13 loc26)
		(connected loc26 loc19)
		(connected loc19 loc26)
		(connected loc26 loc20)
		(connected loc20 loc26)
		(connected loc26 loc45)
		(connected loc45 loc26)
		(connected loc26 loc50)
		(connected loc50 loc26)
		(connected loc26 loc57)
		(connected loc57 loc26)
		(connected loc26 loc61)
		(connected loc61 loc26)
		(connected loc26 loc66)
		(connected loc66 loc26)
		(connected loc26 loc93)
		(connected loc93 loc26)
		(connected loc27 loc35)
		(connected loc35 loc27)
		(connected loc27 loc47)
		(connected loc47 loc27)
		(connected loc27 loc49)
		(connected loc49 loc27)
		(connected loc27 loc51)
		(connected loc51 loc27)
		(connected loc27 loc65)
		(connected loc65 loc27)
		(connected loc27 loc67)
		(connected loc67 loc27)
		(connected loc28 loc6)
		(connected loc6 loc28)
		(connected loc28 loc15)
		(connected loc15 loc28)
		(connected loc28 loc29)
		(connected loc29 loc28)
		(connected loc28 loc35)
		(connected loc35 loc28)
		(connected loc28 loc40)
		(connected loc40 loc28)
		(connected loc28 loc59)
		(connected loc59 loc28)
		(connected loc28 loc99)
		(connected loc99 loc28)
		(connected loc29 loc18)
		(connected loc18 loc29)
		(connected loc29 loc58)
		(connected loc58 loc29)
		(connected loc30 loc25)
		(connected loc25 loc30)
		(connected loc30 loc51)
		(connected loc51 loc30)
		(connected loc30 loc80)
		(connected loc80 loc30)
		(connected loc31 loc1)
		(connected loc1 loc31)
		(connected loc31 loc11)
		(connected loc11 loc31)
		(connected loc31 loc28)
		(connected loc28 loc31)
		(connected loc31 loc93)
		(connected loc93 loc31)
		(connected loc32 loc43)
		(connected loc43 loc32)
		(connected loc32 loc48)
		(connected loc48 loc32)
		(connected loc32 loc50)
		(connected loc50 loc32)
		(connected loc32 loc52)
		(connected loc52 loc32)
		(connected loc32 loc58)
		(connected loc58 loc32)
		(connected loc32 loc70)
		(connected loc70 loc32)
		(connected loc32 loc72)
		(connected loc72 loc32)
		(connected loc32 loc86)
		(connected loc86 loc32)
		(connected loc32 loc95)
		(connected loc95 loc32)
		(connected loc33 loc44)
		(connected loc44 loc33)
		(connected loc33 loc83)
		(connected loc83 loc33)
		(connected loc33 loc90)
		(connected loc90 loc33)
		(connected loc34 loc6)
		(connected loc6 loc34)
		(connected loc34 loc12)
		(connected loc12 loc34)
		(connected loc34 loc53)
		(connected loc53 loc34)
		(connected loc34 loc85)
		(connected loc85 loc34)
		(connected loc34 loc88)
		(connected loc88 loc34)
		(connected loc35 loc27)
		(connected loc27 loc35)
		(connected loc35 loc43)
		(connected loc43 loc35)
		(connected loc35 loc90)
		(connected loc90 loc35)
		(connected loc36 loc39)
		(connected loc39 loc36)
		(connected loc36 loc41)
		(connected loc41 loc36)
		(connected loc36 loc44)
		(connected loc44 loc36)
		(connected loc36 loc55)
		(connected loc55 loc36)
		(connected loc36 loc56)
		(connected loc56 loc36)
		(connected loc36 loc58)
		(connected loc58 loc36)
		(connected loc36 loc64)
		(connected loc64 loc36)
		(connected loc36 loc73)
		(connected loc73 loc36)
		(connected loc36 loc95)
		(connected loc95 loc36)
		(connected loc37 loc3)
		(connected loc3 loc37)
		(connected loc37 loc31)
		(connected loc31 loc37)
		(connected loc37 loc39)
		(connected loc39 loc37)
		(connected loc37 loc45)
		(connected loc45 loc37)
		(connected loc37 loc46)
		(connected loc46 loc37)
		(connected loc37 loc58)
		(connected loc58 loc37)
		(connected loc37 loc95)
		(connected loc95 loc37)
		(connected loc38 loc14)
		(connected loc14 loc38)
		(connected loc38 loc28)
		(connected loc28 loc38)
		(connected loc38 loc32)
		(connected loc32 loc38)
		(connected loc38 loc43)
		(connected loc43 loc38)
		(connected loc38 loc52)
		(connected loc52 loc38)
		(connected loc38 loc53)
		(connected loc53 loc38)
		(connected loc38 loc87)
		(connected loc87 loc38)
		(connected loc39 loc1)
		(connected loc1 loc39)
		(connected loc39 loc4)
		(connected loc4 loc39)
		(connected loc39 loc11)
		(connected loc11 loc39)
		(connected loc39 loc13)
		(connected loc13 loc39)
		(connected loc39 loc15)
		(connected loc15 loc39)
		(connected loc39 loc31)
		(connected loc31 loc39)
		(connected loc39 loc44)
		(connected loc44 loc39)
		(connected loc39 loc45)
		(connected loc45 loc39)
		(connected loc39 loc49)
		(connected loc49 loc39)
		(connected loc39 loc58)
		(connected loc58 loc39)
		(connected loc39 loc74)
		(connected loc74 loc39)
		(connected loc39 loc75)
		(connected loc75 loc39)
		(connected loc40 loc13)
		(connected loc13 loc40)
		(connected loc40 loc25)
		(connected loc25 loc40)
		(connected loc40 loc27)
		(connected loc27 loc40)
		(connected loc40 loc29)
		(connected loc29 loc40)
		(connected loc40 loc35)
		(connected loc35 loc40)
		(connected loc40 loc59)
		(connected loc59 loc40)
		(connected loc41 loc13)
		(connected loc13 loc41)
		(connected loc41 loc16)
		(connected loc16 loc41)
		(connected loc41 loc22)
		(connected loc22 loc41)
		(connected loc41 loc30)
		(connected loc30 loc41)
		(connected loc41 loc31)
		(connected loc31 loc41)
		(connected loc41 loc38)
		(connected loc38 loc41)
		(connected loc41 loc46)
		(connected loc46 loc41)
		(connected loc41 loc49)
		(connected loc49 loc41)
		(connected loc41 loc76)
		(connected loc76 loc41)
		(connected loc41 loc90)
		(connected loc90 loc41)
		(connected loc42 loc17)
		(connected loc17 loc42)
		(connected loc42 loc18)
		(connected loc18 loc42)
		(connected loc42 loc26)
		(connected loc26 loc42)
		(connected loc42 loc30)
		(connected loc30 loc42)
		(connected loc42 loc35)
		(connected loc35 loc42)
		(connected loc42 loc58)
		(connected loc58 loc42)
		(connected loc42 loc70)
		(connected loc70 loc42)
		(connected loc42 loc72)
		(connected loc72 loc42)
		(connected loc42 loc85)
		(connected loc85 loc42)
		(connected loc43 loc12)
		(connected loc12 loc43)
		(connected loc43 loc18)
		(connected loc18 loc43)
		(connected loc43 loc29)
		(connected loc29 loc43)
		(connected loc43 loc44)
		(connected loc44 loc43)
		(connected loc43 loc56)
		(connected loc56 loc43)
		(connected loc43 loc81)
		(connected loc81 loc43)
		(connected loc44 loc9)
		(connected loc9 loc44)
		(connected loc44 loc17)
		(connected loc17 loc44)
		(connected loc44 loc48)
		(connected loc48 loc44)
		(connected loc44 loc70)
		(connected loc70 loc44)
		(connected loc44 loc85)
		(connected loc85 loc44)
		(connected loc45 loc7)
		(connected loc7 loc45)
		(connected loc45 loc58)
		(connected loc58 loc45)
		(connected loc45 loc62)
		(connected loc62 loc45)
		(connected loc46 loc31)
		(connected loc31 loc46)
		(connected loc46 loc32)
		(connected loc32 loc46)
		(connected loc46 loc34)
		(connected loc34 loc46)
		(connected loc46 loc35)
		(connected loc35 loc46)
		(connected loc46 loc45)
		(connected loc45 loc46)
		(connected loc46 loc51)
		(connected loc51 loc46)
		(connected loc46 loc56)
		(connected loc56 loc46)
		(connected loc46 loc60)
		(connected loc60 loc46)
		(connected loc46 loc62)
		(connected loc62 loc46)
		(connected loc47 loc16)
		(connected loc16 loc47)
		(connected loc47 loc26)
		(connected loc26 loc47)
		(connected loc47 loc38)
		(connected loc38 loc47)
		(connected loc47 loc45)
		(connected loc45 loc47)
		(connected loc47 loc61)
		(connected loc61 loc47)
		(connected loc47 loc68)
		(connected loc68 loc47)
		(connected loc47 loc91)
		(connected loc91 loc47)
		(connected loc48 loc24)
		(connected loc24 loc48)
		(connected loc48 loc54)
		(connected loc54 loc48)
		(connected loc48 loc72)
		(connected loc72 loc48)
		(connected loc49 loc29)
		(connected loc29 loc49)
		(connected loc49 loc48)
		(connected loc48 loc49)
		(connected loc49 loc52)
		(connected loc52 loc49)
		(connected loc49 loc68)
		(connected loc68 loc49)
		(connected loc49 loc74)
		(connected loc74 loc49)
		(connected loc49 loc78)
		(connected loc78 loc49)
		(connected loc49 loc82)
		(connected loc82 loc49)
		(connected loc49 loc84)
		(connected loc84 loc49)
		(connected loc49 loc89)
		(connected loc89 loc49)
		(connected loc49 loc97)
		(connected loc97 loc49)
		(connected loc50 loc28)
		(connected loc28 loc50)
		(connected loc50 loc86)
		(connected loc86 loc50)
		(connected loc51 loc6)
		(connected loc6 loc51)
		(connected loc51 loc42)
		(connected loc42 loc51)
		(connected loc52 loc24)
		(connected loc24 loc52)
		(connected loc52 loc28)
		(connected loc28 loc52)
		(connected loc52 loc48)
		(connected loc48 loc52)
		(connected loc52 loc60)
		(connected loc60 loc52)
		(connected loc52 loc73)
		(connected loc73 loc52)
		(connected loc53 loc30)
		(connected loc30 loc53)
		(connected loc53 loc33)
		(connected loc33 loc53)
		(connected loc53 loc46)
		(connected loc46 loc53)
		(connected loc53 loc61)
		(connected loc61 loc53)
		(connected loc53 loc74)
		(connected loc74 loc53)
		(connected loc53 loc82)
		(connected loc82 loc53)
		(connected loc53 loc85)
		(connected loc85 loc53)
		(connected loc53 loc86)
		(connected loc86 loc53)
		(connected loc54 loc9)
		(connected loc9 loc54)
		(connected loc54 loc11)
		(connected loc11 loc54)
		(connected loc54 loc17)
		(connected loc17 loc54)
		(connected loc54 loc31)
		(connected loc31 loc54)
		(connected loc54 loc32)
		(connected loc32 loc54)
		(connected loc54 loc47)
		(connected loc47 loc54)
		(connected loc54 loc66)
		(connected loc66 loc54)
		(connected loc54 loc68)
		(connected loc68 loc54)
		(connected loc54 loc71)
		(connected loc71 loc54)
		(connected loc54 loc72)
		(connected loc72 loc54)
		(connected loc54 loc79)
		(connected loc79 loc54)
		(connected loc54 loc82)
		(connected loc82 loc54)
		(connected loc55 loc7)
		(connected loc7 loc55)
		(connected loc55 loc72)
		(connected loc72 loc55)
		(connected loc55 loc77)
		(connected loc77 loc55)
		(connected loc55 loc90)
		(connected loc90 loc55)
		(connected loc56 loc25)
		(connected loc25 loc56)
		(connected loc56 loc43)
		(connected loc43 loc56)
		(connected loc56 loc55)
		(connected loc55 loc56)
		(connected loc56 loc65)
		(connected loc65 loc56)
		(connected loc56 loc69)
		(connected loc69 loc56)
		(connected loc56 loc77)
		(connected loc77 loc56)
		(connected loc56 loc83)
		(connected loc83 loc56)
		(connected loc56 loc89)
		(connected loc89 loc56)
		(connected loc57 loc9)
		(connected loc9 loc57)
		(connected loc57 loc18)
		(connected loc18 loc57)
		(connected loc57 loc24)
		(connected loc24 loc57)
		(connected loc57 loc26)
		(connected loc26 loc57)
		(connected loc57 loc37)
		(connected loc37 loc57)
		(connected loc57 loc49)
		(connected loc49 loc57)
		(connected loc57 loc55)
		(connected loc55 loc57)
		(connected loc57 loc68)
		(connected loc68 loc57)
		(connected loc57 loc71)
		(connected loc71 loc57)
		(connected loc58 loc5)
		(connected loc5 loc58)
		(connected loc58 loc7)
		(connected loc7 loc58)
		(connected loc58 loc13)
		(connected loc13 loc58)
		(connected loc58 loc18)
		(connected loc18 loc58)
		(connected loc58 loc20)
		(connected loc20 loc58)
		(connected loc58 loc23)
		(connected loc23 loc58)
		(connected loc58 loc29)
		(connected loc29 loc58)
		(connected loc58 loc51)
		(connected loc51 loc58)
		(connected loc58 loc60)
		(connected loc60 loc58)
		(connected loc58 loc66)
		(connected loc66 loc58)
		(connected loc58 loc88)
		(connected loc88 loc58)
		(connected loc58 loc90)
		(connected loc90 loc58)
		(connected loc59 loc14)
		(connected loc14 loc59)
		(connected loc59 loc16)
		(connected loc16 loc59)
		(connected loc59 loc32)
		(connected loc32 loc59)
		(connected loc59 loc44)
		(connected loc44 loc59)
		(connected loc59 loc45)
		(connected loc45 loc59)
		(connected loc59 loc47)
		(connected loc47 loc59)
		(connected loc59 loc57)
		(connected loc57 loc59)
		(connected loc59 loc61)
		(connected loc61 loc59)
		(connected loc59 loc81)
		(connected loc81 loc59)
		(connected loc60 loc12)
		(connected loc12 loc60)
		(connected loc60 loc16)
		(connected loc16 loc60)
		(connected loc60 loc29)
		(connected loc29 loc60)
		(connected loc60 loc45)
		(connected loc45 loc60)
		(connected loc60 loc71)
		(connected loc71 loc60)
		(connected loc60 loc72)
		(connected loc72 loc60)
		(connected loc60 loc84)
		(connected loc84 loc60)
		(connected loc60 loc85)
		(connected loc85 loc60)
		(connected loc60 loc91)
		(connected loc91 loc60)
		(connected loc60 loc99)
		(connected loc99 loc60)
		(connected loc61 loc13)
		(connected loc13 loc61)
		(connected loc61 loc30)
		(connected loc30 loc61)
		(connected loc61 loc36)
		(connected loc36 loc61)
		(connected loc61 loc42)
		(connected loc42 loc61)
		(connected loc61 loc45)
		(connected loc45 loc61)
		(connected loc61 loc48)
		(connected loc48 loc61)
		(connected loc61 loc55)
		(connected loc55 loc61)
		(connected loc61 loc66)
		(connected loc66 loc61)
		(connected loc61 loc91)
		(connected loc91 loc61)
		(connected loc61 loc99)
		(connected loc99 loc61)
		(connected loc62 loc1)
		(connected loc1 loc62)
		(connected loc62 loc41)
		(connected loc41 loc62)
		(connected loc62 loc46)
		(connected loc46 loc62)
		(connected loc62 loc61)
		(connected loc61 loc62)
		(connected loc62 loc72)
		(connected loc72 loc62)
		(connected loc62 loc76)
		(connected loc76 loc62)
		(connected loc62 loc96)
		(connected loc96 loc62)
		(connected loc63 loc19)
		(connected loc19 loc63)
		(connected loc63 loc52)
		(connected loc52 loc63)
		(connected loc63 loc65)
		(connected loc65 loc63)
		(connected loc63 loc66)
		(connected loc66 loc63)
		(connected loc63 loc71)
		(connected loc71 loc63)
		(connected loc63 loc80)
		(connected loc80 loc63)
		(connected loc63 loc86)
		(connected loc86 loc63)
		(connected loc63 loc96)
		(connected loc96 loc63)
		(connected loc64 loc49)
		(connected loc49 loc64)
		(connected loc64 loc53)
		(connected loc53 loc64)
		(connected loc64 loc58)
		(connected loc58 loc64)
		(connected loc64 loc70)
		(connected loc70 loc64)
		(connected loc64 loc74)
		(connected loc74 loc64)
		(connected loc64 loc79)
		(connected loc79 loc64)
		(connected loc64 loc86)
		(connected loc86 loc64)
		(connected loc64 loc98)
		(connected loc98 loc64)
		(connected loc65 loc12)
		(connected loc12 loc65)
		(connected loc65 loc20)
		(connected loc20 loc65)
		(connected loc65 loc26)
		(connected loc26 loc65)
		(connected loc65 loc40)
		(connected loc40 loc65)
		(connected loc65 loc44)
		(connected loc44 loc65)
		(connected loc65 loc52)
		(connected loc52 loc65)
		(connected loc65 loc53)
		(connected loc53 loc65)
		(connected loc65 loc61)
		(connected loc61 loc65)
		(connected loc65 loc66)
		(connected loc66 loc65)
		(connected loc65 loc83)
		(connected loc83 loc65)
		(connected loc66 loc35)
		(connected loc35 loc66)
		(connected loc66 loc48)
		(connected loc48 loc66)
		(connected loc66 loc51)
		(connected loc51 loc66)
		(connected loc66 loc53)
		(connected loc53 loc66)
		(connected loc66 loc65)
		(connected loc65 loc66)
		(connected loc66 loc76)
		(connected loc76 loc66)
		(connected loc66 loc77)
		(connected loc77 loc66)
		(connected loc66 loc78)
		(connected loc78 loc66)
		(connected loc67 loc8)
		(connected loc8 loc67)
		(connected loc67 loc62)
		(connected loc62 loc67)
		(connected loc67 loc89)
		(connected loc89 loc67)
		(connected loc68 loc11)
		(connected loc11 loc68)
		(connected loc68 loc14)
		(connected loc14 loc68)
		(connected loc68 loc15)
		(connected loc15 loc68)
		(connected loc68 loc26)
		(connected loc26 loc68)
		(connected loc68 loc52)
		(connected loc52 loc68)
		(connected loc68 loc53)
		(connected loc53 loc68)
		(connected loc68 loc60)
		(connected loc60 loc68)
		(connected loc68 loc72)
		(connected loc72 loc68)
		(connected loc68 loc89)
		(connected loc89 loc68)
		(connected loc68 loc95)
		(connected loc95 loc68)
		(connected loc69 loc31)
		(connected loc31 loc69)
		(connected loc69 loc50)
		(connected loc50 loc69)
		(connected loc69 loc55)
		(connected loc55 loc69)
		(connected loc69 loc75)
		(connected loc75 loc69)
		(connected loc69 loc83)
		(connected loc83 loc69)
		(connected loc69 loc84)
		(connected loc84 loc69)
		(connected loc70 loc59)
		(connected loc59 loc70)
		(connected loc70 loc72)
		(connected loc72 loc70)
		(connected loc70 loc78)
		(connected loc78 loc70)
		(connected loc71 loc20)
		(connected loc20 loc71)
		(connected loc71 loc54)
		(connected loc54 loc71)
		(connected loc71 loc66)
		(connected loc66 loc71)
		(connected loc71 loc75)
		(connected loc75 loc71)
		(connected loc72 loc5)
		(connected loc5 loc72)
		(connected loc72 loc19)
		(connected loc19 loc72)
		(connected loc72 loc41)
		(connected loc41 loc72)
		(connected loc72 loc44)
		(connected loc44 loc72)
		(connected loc72 loc51)
		(connected loc51 loc72)
		(connected loc72 loc92)
		(connected loc92 loc72)
		(connected loc73 loc31)
		(connected loc31 loc73)
		(connected loc73 loc32)
		(connected loc32 loc73)
		(connected loc73 loc33)
		(connected loc33 loc73)
		(connected loc73 loc41)
		(connected loc41 loc73)
		(connected loc73 loc46)
		(connected loc46 loc73)
		(connected loc73 loc47)
		(connected loc47 loc73)
		(connected loc73 loc51)
		(connected loc51 loc73)
		(connected loc73 loc54)
		(connected loc54 loc73)
		(connected loc73 loc55)
		(connected loc55 loc73)
		(connected loc73 loc60)
		(connected loc60 loc73)
		(connected loc73 loc61)
		(connected loc61 loc73)
		(connected loc73 loc75)
		(connected loc75 loc73)
		(connected loc74 loc20)
		(connected loc20 loc74)
		(connected loc74 loc47)
		(connected loc47 loc74)
		(connected loc74 loc72)
		(connected loc72 loc74)
		(connected loc74 loc90)
		(connected loc90 loc74)
		(connected loc74 loc97)
		(connected loc97 loc74)
		(connected loc75 loc30)
		(connected loc30 loc75)
		(connected loc75 loc37)
		(connected loc37 loc75)
		(connected loc75 loc38)
		(connected loc38 loc75)
		(connected loc75 loc41)
		(connected loc41 loc75)
		(connected loc75 loc48)
		(connected loc48 loc75)
		(connected loc75 loc58)
		(connected loc58 loc75)
		(connected loc75 loc60)
		(connected loc60 loc75)
		(connected loc75 loc73)
		(connected loc73 loc75)
		(connected loc75 loc97)
		(connected loc97 loc75)
		(connected loc76 loc30)
		(connected loc30 loc76)
		(connected loc76 loc32)
		(connected loc32 loc76)
		(connected loc76 loc73)
		(connected loc73 loc76)
		(connected loc77 loc21)
		(connected loc21 loc77)
		(connected loc77 loc28)
		(connected loc28 loc77)
		(connected loc77 loc38)
		(connected loc38 loc77)
		(connected loc77 loc56)
		(connected loc56 loc77)
		(connected loc77 loc60)
		(connected loc60 loc77)
		(connected loc77 loc73)
		(connected loc73 loc77)
		(connected loc77 loc76)
		(connected loc76 loc77)
		(connected loc77 loc81)
		(connected loc81 loc77)
		(connected loc77 loc98)
		(connected loc98 loc77)
		(connected loc78 loc26)
		(connected loc26 loc78)
		(connected loc78 loc27)
		(connected loc27 loc78)
		(connected loc78 loc31)
		(connected loc31 loc78)
		(connected loc78 loc44)
		(connected loc44 loc78)
		(connected loc78 loc75)
		(connected loc75 loc78)
		(connected loc78 loc87)
		(connected loc87 loc78)
		(connected loc78 loc88)
		(connected loc88 loc78)
		(connected loc78 loc90)
		(connected loc90 loc78)
		(connected loc79 loc24)
		(connected loc24 loc79)
		(connected loc79 loc29)
		(connected loc29 loc79)
		(connected loc79 loc45)
		(connected loc45 loc79)
		(connected loc79 loc62)
		(connected loc62 loc79)
		(connected loc79 loc63)
		(connected loc63 loc79)
		(connected loc79 loc93)
		(connected loc93 loc79)
		(connected loc80 loc50)
		(connected loc50 loc80)
		(connected loc80 loc61)
		(connected loc61 loc80)
		(connected loc80 loc71)
		(connected loc71 loc80)
		(connected loc80 loc75)
		(connected loc75 loc80)
		(connected loc80 loc79)
		(connected loc79 loc80)
		(connected loc80 loc91)
		(connected loc91 loc80)
		(connected loc80 loc92)
		(connected loc92 loc80)
		(connected loc80 loc95)
		(connected loc95 loc80)
		(connected loc81 loc27)
		(connected loc27 loc81)
		(connected loc81 loc42)
		(connected loc42 loc81)
		(connected loc81 loc48)
		(connected loc48 loc81)
		(connected loc81 loc71)
		(connected loc71 loc81)
		(connected loc81 loc80)
		(connected loc80 loc81)
		(connected loc81 loc88)
		(connected loc88 loc81)
		(connected loc82 loc18)
		(connected loc18 loc82)
		(connected loc82 loc35)
		(connected loc35 loc82)
		(connected loc82 loc55)
		(connected loc55 loc82)
		(connected loc82 loc58)
		(connected loc58 loc82)
		(connected loc82 loc61)
		(connected loc61 loc82)
		(connected loc82 loc62)
		(connected loc62 loc82)
		(connected loc82 loc66)
		(connected loc66 loc82)
		(connected loc82 loc72)
		(connected loc72 loc82)
		(connected loc82 loc90)
		(connected loc90 loc82)
		(connected loc83 loc51)
		(connected loc51 loc83)
		(connected loc83 loc66)
		(connected loc66 loc83)
		(connected loc83 loc90)
		(connected loc90 loc83)
		(connected loc83 loc94)
		(connected loc94 loc83)
		(connected loc84 loc19)
		(connected loc19 loc84)
		(connected loc84 loc40)
		(connected loc40 loc84)
		(connected loc84 loc43)
		(connected loc43 loc84)
		(connected loc84 loc47)
		(connected loc47 loc84)
		(connected loc84 loc61)
		(connected loc61 loc84)
		(connected loc84 loc77)
		(connected loc77 loc84)
		(connected loc84 loc82)
		(connected loc82 loc84)
		(connected loc84 loc85)
		(connected loc85 loc84)
		(connected loc85 loc51)
		(connected loc51 loc85)
		(connected loc85 loc69)
		(connected loc69 loc85)
		(connected loc85 loc78)
		(connected loc78 loc85)
		(connected loc85 loc81)
		(connected loc81 loc85)
		(connected loc86 loc67)
		(connected loc67 loc86)
		(connected loc86 loc81)
		(connected loc81 loc86)
		(connected loc86 loc85)
		(connected loc85 loc86)
		(connected loc86 loc89)
		(connected loc89 loc86)
		(connected loc86 loc92)
		(connected loc92 loc86)
		(connected loc87 loc32)
		(connected loc32 loc87)
		(connected loc87 loc38)
		(connected loc38 loc87)
		(connected loc87 loc74)
		(connected loc74 loc87)
		(connected loc87 loc90)
		(connected loc90 loc87)
		(connected loc88 loc15)
		(connected loc15 loc88)
		(connected loc88 loc43)
		(connected loc43 loc88)
		(connected loc88 loc68)
		(connected loc68 loc88)
		(connected loc89 loc24)
		(connected loc24 loc89)
		(connected loc89 loc46)
		(connected loc46 loc89)
		(connected loc89 loc64)
		(connected loc64 loc89)
		(connected loc89 loc65)
		(connected loc65 loc89)
		(connected loc89 loc75)
		(connected loc75 loc89)
		(connected loc89 loc86)
		(connected loc86 loc89)
		(connected loc89 loc98)
		(connected loc98 loc89)
		(connected loc89 loc99)
		(connected loc99 loc89)
		(connected loc90 loc45)
		(connected loc45 loc90)
		(connected loc90 loc64)
		(connected loc64 loc90)
		(connected loc90 loc75)
		(connected loc75 loc90)
		(connected loc90 loc79)
		(connected loc79 loc90)
		(connected loc90 loc80)
		(connected loc80 loc90)
		(connected loc90 loc86)
		(connected loc86 loc90)
		(connected loc91 loc16)
		(connected loc16 loc91)
		(connected loc91 loc23)
		(connected loc23 loc91)
		(connected loc91 loc31)
		(connected loc31 loc91)
		(connected loc91 loc62)
		(connected loc62 loc91)
		(connected loc91 loc71)
		(connected loc71 loc91)
		(connected loc91 loc77)
		(connected loc77 loc91)
		(connected loc91 loc93)
		(connected loc93 loc91)
		(connected loc91 loc94)
		(connected loc94 loc91)
		(connected loc92 loc40)
		(connected loc40 loc92)
		(connected loc92 loc57)
		(connected loc57 loc92)
		(connected loc92 loc72)
		(connected loc72 loc92)
		(connected loc92 loc81)
		(connected loc81 loc92)
		(connected loc93 loc39)
		(connected loc39 loc93)
		(connected loc93 loc50)
		(connected loc50 loc93)
		(connected loc93 loc55)
		(connected loc55 loc93)
		(connected loc93 loc68)
		(connected loc68 loc93)
		(connected loc93 loc71)
		(connected loc71 loc93)
		(connected loc93 loc83)
		(connected loc83 loc93)
		(connected loc94 loc72)
		(connected loc72 loc94)
		(connected loc94 loc79)
		(connected loc79 loc94)
		(connected loc94 loc84)
		(connected loc84 loc94)
		(connected loc94 loc99)
		(connected loc99 loc94)
		(connected loc95 loc39)
		(connected loc39 loc95)
		(connected loc95 loc59)
		(connected loc59 loc95)
		(connected loc95 loc73)
		(connected loc73 loc95)
		(connected loc95 loc83)
		(connected loc83 loc95)
		(connected loc95 loc84)
		(connected loc84 loc95)
		(connected loc95 loc96)
		(connected loc96 loc95)
		(connected loc96 loc38)
		(connected loc38 loc96)
		(connected loc96 loc79)
		(connected loc79 loc96)
		(connected loc96 loc87)
		(connected loc87 loc96)
		(connected loc96 loc98)
		(connected loc98 loc96)
		(connected loc97 loc34)
		(connected loc34 loc97)
		(connected loc97 loc76)
		(connected loc76 loc97)
		(connected loc97 loc81)
		(connected loc81 loc97)
		(connected loc97 loc86)
		(connected loc86 loc97)
		(connected loc98 loc51)
		(connected loc51 loc98)
		(connected loc98 loc77)
		(connected loc77 loc98)
		(connected loc98 loc78)
		(connected loc78 loc98)
		(connected loc98 loc81)
		(connected loc81 loc98)
		(connected loc98 loc88)
		(connected loc88 loc98)
		(connected loc98 loc90)
		(connected loc90 loc98)
		(connected loc99 loc39)
		(connected loc39 loc99)
		(connected loc99 loc59)
		(connected loc59 loc99)
		(connected loc99 loc65)
		(connected loc65 loc99)
		(connected loc99 loc72)
		(connected loc72 loc99)
		(connected loc99 loc92)
		(connected loc92 loc99)

		(in bar1 loc1)
		(in bar3 loc3)
		(in bar6 loc6)
		(in bar8 loc8)
		(in bar9 loc9)
		(in bar15 loc15)
		(in bar18 loc18)
		(in bar24 loc24)
		(in bar25 loc25)
		(in bar26 loc26)
		(in bar27 loc27)
		(in bar31 loc31)
		(in bar33 loc33)
		(in bar34 loc34)
		(in bar40 loc40)
		(in bar44 loc44)
		(in bar45 loc45)
		(in bar46 loc46)
		(in bar47 loc47)
		(in bar48 loc48)
		(in bar49 loc49)
		(in bar51 loc51)
		(in bar52 loc52)
		(in bar53 loc53)
		(in bar54 loc54)
		(in bar56 loc56)
		(in bar58 loc58)
		(in bar61 loc61)
		(in bar62 loc62)
		(in bar64 loc64)
		(in bar65 loc65)
		(in bar66 loc66)
		(in bar67 loc67)
		(in bar71 loc71)
		(in bar72 loc72)
		(in bar73 loc73)
		(in bar75 loc75)
		(in bar76 loc76)
		(in bar78 loc78)
		(in bar79 loc79)
		(in bar80 loc80)
		(in bar81 loc81)
		(in bar82 loc82)
		(in bar83 loc83)
		(in bar85 loc85)
		(in bar86 loc86)
		(in bar87 loc87)
		(in bar89 loc89)
		(in bar90 loc90)
		(in bar97 loc97)
		(in bar98 loc98)

	)

	(:goal
		(and
			(at loc99)
		)
	)
)