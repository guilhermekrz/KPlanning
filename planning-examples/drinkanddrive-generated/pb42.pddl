; Generated by ProblemGenerator - Problem 42 at Mon Nov 28 15:07:22 BRST 2016
(define (problem pb42)
	(:domain drinkanddrive-generated)
	(:requirements :strips :typing :negative-preconditions)
	(:objects
		loc1 loc2 loc3 loc4 loc5 loc6 loc7 loc8 loc9 loc10 loc11 loc12 loc13 loc14 loc15 loc16 loc17 loc18 loc19 loc20 loc21 loc22 loc23 loc24 loc25 loc26 loc27 loc28 loc29 loc30 loc31 loc32 loc33 loc34 loc35 loc36 loc37 loc38 loc39 loc40 loc41 loc42 loc43 loc44 loc45 loc46 loc47 loc48 loc49 loc50 loc51 loc52 loc53 loc54 loc55 loc56 loc57 loc58 loc59 loc60 loc61 loc62 loc63 loc64 loc65 loc66 loc67 loc68 loc69 loc70 loc71 loc72 loc73 loc74 loc75 loc76 loc77 loc78 loc79 loc80 loc81 loc82 loc83 loc84 loc85 loc86 loc87 loc88 loc89 loc90 loc91 loc92 - location
		bar1 bar5 bar7 bar9 bar13 bar17 bar18 bar19 bar22 bar25 bar26 bar27 bar30 bar34 bar35 bar37 bar39 bar43 bar45 bar47 bar48 bar50 bar60 bar62 bar63 bar64 bar65 bar66 bar67 bar70 bar72 bar74 bar75 bar76 bar77 bar80 bar82 bar83 bar84 bar85 bar87 bar90 - bar
	)
	(:init
		(at loc1)

		(connected loc32 loc90)
		(connected loc90 loc32)
		(connected loc90 loc65)
		(connected loc65 loc90)
		(connected loc65 loc50)
		(connected loc50 loc65)
		(connected loc50 loc52)
		(connected loc52 loc50)
		(connected loc52 loc51)
		(connected loc51 loc52)
		(connected loc32 loc14)
		(connected loc14 loc32)
		(connected loc14 loc55)
		(connected loc55 loc14)
		(connected loc51 loc41)
		(connected loc41 loc51)
		(connected loc41 loc16)
		(connected loc16 loc41)
		(connected loc16 loc18)
		(connected loc18 loc16)
		(connected loc18 loc25)
		(connected loc25 loc18)
		(connected loc90 loc57)
		(connected loc57 loc90)
		(connected loc57 loc75)
		(connected loc75 loc57)
		(connected loc75 loc15)
		(connected loc15 loc75)
		(connected loc15 loc21)
		(connected loc21 loc15)
		(connected loc21 loc49)
		(connected loc49 loc21)
		(connected loc49 loc47)
		(connected loc47 loc49)
		(connected loc47 loc8)
		(connected loc8 loc47)
		(connected loc8 loc89)
		(connected loc89 loc8)
		(connected loc89 loc74)
		(connected loc74 loc89)
		(connected loc74 loc84)
		(connected loc84 loc74)
		(connected loc84 loc11)
		(connected loc11 loc84)
		(connected loc25 loc36)
		(connected loc36 loc25)
		(connected loc36 loc70)
		(connected loc70 loc36)
		(connected loc70 loc5)
		(connected loc5 loc70)
		(connected loc5 loc12)
		(connected loc12 loc5)
		(connected loc32 loc81)
		(connected loc81 loc32)
		(connected loc81 loc22)
		(connected loc22 loc81)
		(connected loc89 loc38)
		(connected loc38 loc89)
		(connected loc38 loc80)
		(connected loc80 loc38)
		(connected loc80 loc39)
		(connected loc39 loc80)
		(connected loc39 loc73)
		(connected loc73 loc39)
		(connected loc73 loc60)
		(connected loc60 loc73)
		(connected loc60 loc64)
		(connected loc64 loc60)
		(connected loc60 loc63)
		(connected loc63 loc60)
		(connected loc63 loc54)
		(connected loc54 loc63)
		(connected loc54 loc85)
		(connected loc85 loc54)
		(connected loc39 loc48)
		(connected loc48 loc39)
		(connected loc48 loc17)
		(connected loc17 loc48)
		(connected loc17 loc9)
		(connected loc9 loc17)
		(connected loc9 loc24)
		(connected loc24 loc9)
		(connected loc24 loc1)
		(connected loc1 loc24)
		(connected loc8 loc29)
		(connected loc29 loc8)
		(connected loc15 loc28)
		(connected loc28 loc15)
		(connected loc73 loc71)
		(connected loc71 loc73)
		(connected loc22 loc91)
		(connected loc91 loc22)
		(connected loc9 loc20)
		(connected loc20 loc9)
		(connected loc55 loc30)
		(connected loc30 loc55)
		(connected loc30 loc13)
		(connected loc13 loc30)
		(connected loc13 loc42)
		(connected loc42 loc13)
		(connected loc42 loc68)
		(connected loc68 loc42)
		(connected loc55 loc43)
		(connected loc43 loc55)
		(connected loc74 loc44)
		(connected loc44 loc74)
		(connected loc44 loc27)
		(connected loc27 loc44)
		(connected loc57 loc87)
		(connected loc87 loc57)
		(connected loc47 loc72)
		(connected loc72 loc47)
		(connected loc63 loc88)
		(connected loc88 loc63)
		(connected loc74 loc33)
		(connected loc33 loc74)
		(connected loc55 loc69)
		(connected loc69 loc55)
		(connected loc65 loc10)
		(connected loc10 loc65)
		(connected loc10 loc86)
		(connected loc86 loc10)
		(connected loc11 loc78)
		(connected loc78 loc11)
		(connected loc87 loc66)
		(connected loc66 loc87)
		(connected loc17 loc2)
		(connected loc2 loc17)
		(connected loc44 loc77)
		(connected loc77 loc44)
		(connected loc77 loc37)
		(connected loc37 loc77)
		(connected loc37 loc4)
		(connected loc4 loc37)
		(connected loc27 loc67)
		(connected loc67 loc27)
		(connected loc80 loc92)
		(connected loc92 loc80)
		(connected loc2 loc26)
		(connected loc26 loc2)
		(connected loc71 loc56)
		(connected loc56 loc71)
		(connected loc56 loc45)
		(connected loc45 loc56)
		(connected loc74 loc6)
		(connected loc6 loc74)
		(connected loc65 loc82)
		(connected loc82 loc65)
		(connected loc84 loc61)
		(connected loc61 loc84)
		(connected loc78 loc35)
		(connected loc35 loc78)
		(connected loc35 loc31)
		(connected loc31 loc35)
		(connected loc37 loc53)
		(connected loc53 loc37)
		(connected loc21 loc79)
		(connected loc79 loc21)
		(connected loc37 loc23)
		(connected loc23 loc37)
		(connected loc23 loc46)
		(connected loc46 loc23)
		(connected loc63 loc40)
		(connected loc40 loc63)
		(connected loc64 loc58)
		(connected loc58 loc64)
		(connected loc58 loc34)
		(connected loc34 loc58)
		(connected loc14 loc19)
		(connected loc19 loc14)
		(connected loc39 loc7)
		(connected loc7 loc39)
		(connected loc60 loc83)
		(connected loc83 loc60)
		(connected loc71 loc59)
		(connected loc59 loc71)
		(connected loc46 loc3)
		(connected loc3 loc46)
		(connected loc86 loc76)
		(connected loc76 loc86)
		(connected loc20 loc62)
		(connected loc62 loc20)
		(connected loc1 loc15)
		(connected loc15 loc1)
		(connected loc1 loc20)
		(connected loc20 loc1)
		(connected loc1 loc23)
		(connected loc23 loc1)
		(connected loc1 loc32)
		(connected loc32 loc1)
		(connected loc1 loc51)
		(connected loc51 loc1)
		(connected loc2 loc5)
		(connected loc5 loc2)
		(connected loc2 loc8)
		(connected loc8 loc2)
		(connected loc2 loc10)
		(connected loc10 loc2)
		(connected loc2 loc18)
		(connected loc18 loc2)
		(connected loc2 loc25)
		(connected loc25 loc2)
		(connected loc3 loc25)
		(connected loc25 loc3)
		(connected loc3 loc29)
		(connected loc29 loc3)
		(connected loc3 loc31)
		(connected loc31 loc3)
		(connected loc3 loc32)
		(connected loc32 loc3)
		(connected loc3 loc38)
		(connected loc38 loc3)
		(connected loc3 loc59)
		(connected loc59 loc3)
		(connected loc4 loc12)
		(connected loc12 loc4)
		(connected loc4 loc35)
		(connected loc35 loc4)
		(connected loc4 loc41)
		(connected loc41 loc4)
		(connected loc4 loc51)
		(connected loc51 loc4)
		(connected loc5 loc2)
		(connected loc2 loc5)
		(connected loc5 loc8)
		(connected loc8 loc5)
		(connected loc5 loc9)
		(connected loc9 loc5)
		(connected loc5 loc16)
		(connected loc16 loc5)
		(connected loc5 loc75)
		(connected loc75 loc5)
		(connected loc5 loc77)
		(connected loc77 loc5)
		(connected loc6 loc1)
		(connected loc1 loc6)
		(connected loc6 loc2)
		(connected loc2 loc6)
		(connected loc6 loc5)
		(connected loc5 loc6)
		(connected loc6 loc44)
		(connected loc44 loc6)
		(connected loc6 loc62)
		(connected loc62 loc6)
		(connected loc7 loc6)
		(connected loc6 loc7)
		(connected loc7 loc13)
		(connected loc13 loc7)
		(connected loc7 loc15)
		(connected loc15 loc7)
		(connected loc7 loc19)
		(connected loc19 loc7)
		(connected loc7 loc23)
		(connected loc23 loc7)
		(connected loc7 loc47)
		(connected loc47 loc7)
		(connected loc8 loc3)
		(connected loc3 loc8)
		(connected loc8 loc5)
		(connected loc5 loc8)
		(connected loc8 loc9)
		(connected loc9 loc8)
		(connected loc8 loc18)
		(connected loc18 loc8)
		(connected loc8 loc41)
		(connected loc41 loc8)
		(connected loc8 loc44)
		(connected loc44 loc8)
		(connected loc8 loc56)
		(connected loc56 loc8)
		(connected loc8 loc75)
		(connected loc75 loc8)
		(connected loc8 loc81)
		(connected loc81 loc8)
		(connected loc9 loc1)
		(connected loc1 loc9)
		(connected loc9 loc13)
		(connected loc13 loc9)
		(connected loc9 loc26)
		(connected loc26 loc9)
		(connected loc9 loc28)
		(connected loc28 loc9)
		(connected loc9 loc29)
		(connected loc29 loc9)
		(connected loc9 loc30)
		(connected loc30 loc9)
		(connected loc9 loc37)
		(connected loc37 loc9)
		(connected loc9 loc39)
		(connected loc39 loc9)
		(connected loc9 loc41)
		(connected loc41 loc9)
		(connected loc9 loc44)
		(connected loc44 loc9)
		(connected loc9 loc54)
		(connected loc54 loc9)
		(connected loc9 loc72)
		(connected loc72 loc9)
		(connected loc9 loc82)
		(connected loc82 loc9)
		(connected loc10 loc18)
		(connected loc18 loc10)
		(connected loc11 loc7)
		(connected loc7 loc11)
		(connected loc11 loc8)
		(connected loc8 loc11)
		(connected loc11 loc12)
		(connected loc12 loc11)
		(connected loc11 loc17)
		(connected loc17 loc11)
		(connected loc11 loc23)
		(connected loc23 loc11)
		(connected loc11 loc29)
		(connected loc29 loc11)
		(connected loc11 loc31)
		(connected loc31 loc11)
		(connected loc11 loc79)
		(connected loc79 loc11)
		(connected loc12 loc7)
		(connected loc7 loc12)
		(connected loc12 loc14)
		(connected loc14 loc12)
		(connected loc12 loc19)
		(connected loc19 loc12)
		(connected loc13 loc10)
		(connected loc10 loc13)
		(connected loc13 loc14)
		(connected loc14 loc13)
		(connected loc13 loc20)
		(connected loc20 loc13)
		(connected loc13 loc25)
		(connected loc25 loc13)
		(connected loc13 loc27)
		(connected loc27 loc13)
		(connected loc13 loc33)
		(connected loc33 loc13)
		(connected loc13 loc56)
		(connected loc56 loc13)
		(connected loc14 loc5)
		(connected loc5 loc14)
		(connected loc14 loc7)
		(connected loc7 loc14)
		(connected loc14 loc27)
		(connected loc27 loc14)
		(connected loc14 loc34)
		(connected loc34 loc14)
		(connected loc14 loc58)
		(connected loc58 loc14)
		(connected loc14 loc67)
		(connected loc67 loc14)
		(connected loc15 loc3)
		(connected loc3 loc15)
		(connected loc15 loc11)
		(connected loc11 loc15)
		(connected loc15 loc43)
		(connected loc43 loc15)
		(connected loc15 loc44)
		(connected loc44 loc15)
		(connected loc15 loc73)
		(connected loc73 loc15)
		(connected loc16 loc8)
		(connected loc8 loc16)
		(connected loc16 loc29)
		(connected loc29 loc16)
		(connected loc16 loc54)
		(connected loc54 loc16)
		(connected loc16 loc63)
		(connected loc63 loc16)
		(connected loc16 loc82)
		(connected loc82 loc16)
		(connected loc17 loc1)
		(connected loc1 loc17)
		(connected loc17 loc3)
		(connected loc3 loc17)
		(connected loc17 loc14)
		(connected loc14 loc17)
		(connected loc17 loc46)
		(connected loc46 loc17)
		(connected loc17 loc53)
		(connected loc53 loc17)
		(connected loc17 loc54)
		(connected loc54 loc17)
		(connected loc17 loc61)
		(connected loc61 loc17)
		(connected loc17 loc64)
		(connected loc64 loc17)
		(connected loc18 loc9)
		(connected loc9 loc18)
		(connected loc18 loc21)
		(connected loc21 loc18)
		(connected loc18 loc39)
		(connected loc39 loc18)
		(connected loc18 loc54)
		(connected loc54 loc18)
		(connected loc18 loc88)
		(connected loc88 loc18)
		(connected loc19 loc7)
		(connected loc7 loc19)
		(connected loc19 loc15)
		(connected loc15 loc19)
		(connected loc19 loc63)
		(connected loc63 loc19)
		(connected loc20 loc5)
		(connected loc5 loc20)
		(connected loc20 loc6)
		(connected loc6 loc20)
		(connected loc20 loc12)
		(connected loc12 loc20)
		(connected loc20 loc15)
		(connected loc15 loc20)
		(connected loc20 loc23)
		(connected loc23 loc20)
		(connected loc20 loc36)
		(connected loc36 loc20)
		(connected loc20 loc39)
		(connected loc39 loc20)
		(connected loc20 loc68)
		(connected loc68 loc20)
		(connected loc20 loc70)
		(connected loc70 loc20)
		(connected loc21 loc45)
		(connected loc45 loc21)
		(connected loc22 loc1)
		(connected loc1 loc22)
		(connected loc22 loc2)
		(connected loc2 loc22)
		(connected loc22 loc7)
		(connected loc7 loc22)
		(connected loc22 loc27)
		(connected loc27 loc22)
		(connected loc22 loc31)
		(connected loc31 loc22)
		(connected loc22 loc46)
		(connected loc46 loc22)
		(connected loc22 loc60)
		(connected loc60 loc22)
		(connected loc22 loc64)
		(connected loc64 loc22)
		(connected loc22 loc75)
		(connected loc75 loc22)
		(connected loc23 loc37)
		(connected loc37 loc23)
		(connected loc24 loc30)
		(connected loc30 loc24)
		(connected loc24 loc50)
		(connected loc50 loc24)
		(connected loc24 loc89)
		(connected loc89 loc24)
		(connected loc25 loc3)
		(connected loc3 loc25)
		(connected loc25 loc23)
		(connected loc23 loc25)
		(connected loc25 loc37)
		(connected loc37 loc25)
		(connected loc25 loc45)
		(connected loc45 loc25)
		(connected loc25 loc60)
		(connected loc60 loc25)
		(connected loc25 loc64)
		(connected loc64 loc25)
		(connected loc25 loc69)
		(connected loc69 loc25)
		(connected loc25 loc71)
		(connected loc71 loc25)
		(connected loc25 loc84)
		(connected loc84 loc25)
		(connected loc26 loc9)
		(connected loc9 loc26)
		(connected loc26 loc10)
		(connected loc10 loc26)
		(connected loc26 loc35)
		(connected loc35 loc26)
		(connected loc26 loc55)
		(connected loc55 loc26)
		(connected loc26 loc56)
		(connected loc56 loc26)
		(connected loc27 loc17)
		(connected loc17 loc27)
		(connected loc27 loc19)
		(connected loc19 loc27)
		(connected loc27 loc32)
		(connected loc32 loc27)
		(connected loc27 loc41)
		(connected loc41 loc27)
		(connected loc27 loc90)
		(connected loc90 loc27)
		(connected loc28 loc20)
		(connected loc20 loc28)
		(connected loc28 loc22)
		(connected loc22 loc28)
		(connected loc28 loc31)
		(connected loc31 loc28)
		(connected loc28 loc48)
		(connected loc48 loc28)
		(connected loc28 loc53)
		(connected loc53 loc28)
		(connected loc28 loc62)
		(connected loc62 loc28)
		(connected loc28 loc72)
		(connected loc72 loc28)
		(connected loc28 loc76)
		(connected loc76 loc28)
		(connected loc29 loc1)
		(connected loc1 loc29)
		(connected loc29 loc2)
		(connected loc2 loc29)
		(connected loc29 loc15)
		(connected loc15 loc29)
		(connected loc29 loc19)
		(connected loc19 loc29)
		(connected loc29 loc24)
		(connected loc24 loc29)
		(connected loc29 loc40)
		(connected loc40 loc29)
		(connected loc29 loc42)
		(connected loc42 loc29)
		(connected loc29 loc46)
		(connected loc46 loc29)
		(connected loc29 loc72)
		(connected loc72 loc29)
		(connected loc29 loc74)
		(connected loc74 loc29)
		(connected loc30 loc2)
		(connected loc2 loc30)
		(connected loc30 loc10)
		(connected loc10 loc30)
		(connected loc30 loc35)
		(connected loc35 loc30)
		(connected loc30 loc41)
		(connected loc41 loc30)
		(connected loc30 loc68)
		(connected loc68 loc30)
		(connected loc30 loc71)
		(connected loc71 loc30)
		(connected loc30 loc72)
		(connected loc72 loc30)
		(connected loc31 loc1)
		(connected loc1 loc31)
		(connected loc31 loc4)
		(connected loc4 loc31)
		(connected loc31 loc21)
		(connected loc21 loc31)
		(connected loc31 loc40)
		(connected loc40 loc31)
		(connected loc31 loc42)
		(connected loc42 loc31)
		(connected loc31 loc61)
		(connected loc61 loc31)
		(connected loc31 loc69)
		(connected loc69 loc31)
		(connected loc32 loc24)
		(connected loc24 loc32)
		(connected loc32 loc28)
		(connected loc28 loc32)
		(connected loc32 loc34)
		(connected loc34 loc32)
		(connected loc32 loc55)
		(connected loc55 loc32)
		(connected loc32 loc56)
		(connected loc56 loc32)
		(connected loc32 loc71)
		(connected loc71 loc32)
		(connected loc32 loc87)
		(connected loc87 loc32)
		(connected loc32 loc91)
		(connected loc91 loc32)
		(connected loc33 loc6)
		(connected loc6 loc33)
		(connected loc33 loc18)
		(connected loc18 loc33)
		(connected loc34 loc4)
		(connected loc4 loc34)
		(connected loc34 loc10)
		(connected loc10 loc34)
		(connected loc34 loc18)
		(connected loc18 loc34)
		(connected loc34 loc31)
		(connected loc31 loc34)
		(connected loc34 loc35)
		(connected loc35 loc34)
		(connected loc34 loc41)
		(connected loc41 loc34)
		(connected loc34 loc52)
		(connected loc52 loc34)
		(connected loc34 loc56)
		(connected loc56 loc34)
		(connected loc34 loc62)
		(connected loc62 loc34)
		(connected loc34 loc91)
		(connected loc91 loc34)
		(connected loc35 loc1)
		(connected loc1 loc35)
		(connected loc35 loc3)
		(connected loc3 loc35)
		(connected loc35 loc20)
		(connected loc20 loc35)
		(connected loc35 loc22)
		(connected loc22 loc35)
		(connected loc35 loc92)
		(connected loc92 loc35)
		(connected loc36 loc7)
		(connected loc7 loc36)
		(connected loc36 loc25)
		(connected loc25 loc36)
		(connected loc36 loc37)
		(connected loc37 loc36)
		(connected loc36 loc38)
		(connected loc38 loc36)
		(connected loc36 loc45)
		(connected loc45 loc36)
		(connected loc36 loc46)
		(connected loc46 loc36)
		(connected loc36 loc61)
		(connected loc61 loc36)
		(connected loc37 loc8)
		(connected loc8 loc37)
		(connected loc37 loc44)
		(connected loc44 loc37)
		(connected loc37 loc51)
		(connected loc51 loc37)
		(connected loc37 loc56)
		(connected loc56 loc37)
		(connected loc37 loc70)
		(connected loc70 loc37)
		(connected loc37 loc89)
		(connected loc89 loc37)
		(connected loc38 loc3)
		(connected loc3 loc38)
		(connected loc38 loc4)
		(connected loc4 loc38)
		(connected loc38 loc10)
		(connected loc10 loc38)
		(connected loc38 loc13)
		(connected loc13 loc38)
		(connected loc38 loc51)
		(connected loc51 loc38)
		(connected loc38 loc54)
		(connected loc54 loc38)
		(connected loc38 loc61)
		(connected loc61 loc38)
		(connected loc38 loc62)
		(connected loc62 loc38)
		(connected loc38 loc76)
		(connected loc76 loc38)
		(connected loc39 loc13)
		(connected loc13 loc39)
		(connected loc39 loc16)
		(connected loc16 loc39)
		(connected loc39 loc21)
		(connected loc21 loc39)
		(connected loc39 loc26)
		(connected loc26 loc39)
		(connected loc39 loc34)
		(connected loc34 loc39)
		(connected loc39 loc51)
		(connected loc51 loc39)
		(connected loc39 loc61)
		(connected loc61 loc39)
		(connected loc39 loc70)
		(connected loc70 loc39)
		(connected loc39 loc78)
		(connected loc78 loc39)
		(connected loc39 loc89)
		(connected loc89 loc39)
		(connected loc40 loc17)
		(connected loc17 loc40)
		(connected loc40 loc24)
		(connected loc24 loc40)
		(connected loc40 loc32)
		(connected loc32 loc40)
		(connected loc40 loc37)
		(connected loc37 loc40)
		(connected loc40 loc41)
		(connected loc41 loc40)
		(connected loc41 loc34)
		(connected loc34 loc41)
		(connected loc41 loc37)
		(connected loc37 loc41)
		(connected loc41 loc63)
		(connected loc63 loc41)
		(connected loc42 loc8)
		(connected loc8 loc42)
		(connected loc42 loc23)
		(connected loc23 loc42)
		(connected loc42 loc27)
		(connected loc27 loc42)
		(connected loc42 loc28)
		(connected loc28 loc42)
		(connected loc42 loc35)
		(connected loc35 loc42)
		(connected loc42 loc61)
		(connected loc61 loc42)
		(connected loc42 loc90)
		(connected loc90 loc42)
		(connected loc43 loc14)
		(connected loc14 loc43)
		(connected loc43 loc37)
		(connected loc37 loc43)
		(connected loc43 loc39)
		(connected loc39 loc43)
		(connected loc43 loc58)
		(connected loc58 loc43)
		(connected loc44 loc7)
		(connected loc7 loc44)
		(connected loc44 loc18)
		(connected loc18 loc44)
		(connected loc44 loc38)
		(connected loc38 loc44)
		(connected loc45 loc23)
		(connected loc23 loc45)
		(connected loc45 loc29)
		(connected loc29 loc45)
		(connected loc45 loc32)
		(connected loc32 loc45)
		(connected loc45 loc49)
		(connected loc49 loc45)
		(connected loc45 loc64)
		(connected loc64 loc45)
		(connected loc45 loc67)
		(connected loc67 loc45)
		(connected loc45 loc84)
		(connected loc84 loc45)
		(connected loc46 loc24)
		(connected loc24 loc46)
		(connected loc46 loc27)
		(connected loc27 loc46)
		(connected loc46 loc37)
		(connected loc37 loc46)
		(connected loc46 loc45)
		(connected loc45 loc46)
		(connected loc46 loc71)
		(connected loc71 loc46)
		(connected loc46 loc79)
		(connected loc79 loc46)
		(connected loc46 loc82)
		(connected loc82 loc46)
		(connected loc46 loc92)
		(connected loc92 loc46)
		(connected loc47 loc33)
		(connected loc33 loc47)
		(connected loc47 loc67)
		(connected loc67 loc47)
		(connected loc47 loc71)
		(connected loc71 loc47)
		(connected loc47 loc79)
		(connected loc79 loc47)
		(connected loc47 loc87)
		(connected loc87 loc47)
		(connected loc48 loc25)
		(connected loc25 loc48)
		(connected loc48 loc33)
		(connected loc33 loc48)
		(connected loc48 loc59)
		(connected loc59 loc48)
		(connected loc49 loc22)
		(connected loc22 loc49)
		(connected loc49 loc30)
		(connected loc30 loc49)
		(connected loc49 loc81)
		(connected loc81 loc49)
		(connected loc50 loc2)
		(connected loc2 loc50)
		(connected loc50 loc30)
		(connected loc30 loc50)
		(connected loc50 loc48)
		(connected loc48 loc50)
		(connected loc50 loc53)
		(connected loc53 loc50)
		(connected loc50 loc58)
		(connected loc58 loc50)
		(connected loc50 loc70)
		(connected loc70 loc50)
		(connected loc51 loc22)
		(connected loc22 loc51)
		(connected loc51 loc35)
		(connected loc35 loc51)
		(connected loc51 loc58)
		(connected loc58 loc51)
		(connected loc51 loc64)
		(connected loc64 loc51)
		(connected loc51 loc69)
		(connected loc69 loc51)
		(connected loc51 loc78)
		(connected loc78 loc51)
		(connected loc51 loc88)
		(connected loc88 loc51)
		(connected loc52 loc2)
		(connected loc2 loc52)
		(connected loc52 loc21)
		(connected loc21 loc52)
		(connected loc52 loc29)
		(connected loc29 loc52)
		(connected loc52 loc35)
		(connected loc35 loc52)
		(connected loc52 loc59)
		(connected loc59 loc52)
		(connected loc52 loc60)
		(connected loc60 loc52)
		(connected loc53 loc10)
		(connected loc10 loc53)
		(connected loc53 loc29)
		(connected loc29 loc53)
		(connected loc53 loc43)
		(connected loc43 loc53)
		(connected loc53 loc45)
		(connected loc45 loc53)
		(connected loc53 loc55)
		(connected loc55 loc53)
		(connected loc53 loc81)
		(connected loc81 loc53)
		(connected loc54 loc8)
		(connected loc8 loc54)
		(connected loc54 loc33)
		(connected loc33 loc54)
		(connected loc54 loc38)
		(connected loc38 loc54)
		(connected loc54 loc60)
		(connected loc60 loc54)
		(connected loc55 loc21)
		(connected loc21 loc55)
		(connected loc55 loc36)
		(connected loc36 loc55)
		(connected loc55 loc48)
		(connected loc48 loc55)
		(connected loc55 loc66)
		(connected loc66 loc55)
		(connected loc55 loc79)
		(connected loc79 loc55)
		(connected loc56 loc19)
		(connected loc19 loc56)
		(connected loc56 loc34)
		(connected loc34 loc56)
		(connected loc56 loc39)
		(connected loc39 loc56)
		(connected loc56 loc58)
		(connected loc58 loc56)
		(connected loc56 loc69)
		(connected loc69 loc56)
		(connected loc56 loc79)
		(connected loc79 loc56)
		(connected loc56 loc87)
		(connected loc87 loc56)
		(connected loc57 loc42)
		(connected loc42 loc57)
		(connected loc57 loc49)
		(connected loc49 loc57)
		(connected loc57 loc61)
		(connected loc61 loc57)
		(connected loc57 loc64)
		(connected loc64 loc57)
		(connected loc57 loc71)
		(connected loc71 loc57)
		(connected loc57 loc73)
		(connected loc73 loc57)
		(connected loc57 loc74)
		(connected loc74 loc57)
		(connected loc57 loc84)
		(connected loc84 loc57)
		(connected loc58 loc24)
		(connected loc24 loc58)
		(connected loc58 loc25)
		(connected loc25 loc58)
		(connected loc58 loc59)
		(connected loc59 loc58)
		(connected loc58 loc69)
		(connected loc69 loc58)
		(connected loc58 loc73)
		(connected loc73 loc58)
		(connected loc58 loc84)
		(connected loc84 loc58)
		(connected loc59 loc49)
		(connected loc49 loc59)
		(connected loc59 loc50)
		(connected loc50 loc59)
		(connected loc59 loc53)
		(connected loc53 loc59)
		(connected loc59 loc56)
		(connected loc56 loc59)
		(connected loc60 loc37)
		(connected loc37 loc60)
		(connected loc60 loc45)
		(connected loc45 loc60)
		(connected loc60 loc53)
		(connected loc53 loc60)
		(connected loc60 loc81)
		(connected loc81 loc60)
		(connected loc60 loc82)
		(connected loc82 loc60)
		(connected loc60 loc89)
		(connected loc89 loc60)
		(connected loc60 loc91)
		(connected loc91 loc60)
		(connected loc61 loc2)
		(connected loc2 loc61)
		(connected loc61 loc39)
		(connected loc39 loc61)
		(connected loc61 loc43)
		(connected loc43 loc61)
		(connected loc61 loc45)
		(connected loc45 loc61)
		(connected loc61 loc58)
		(connected loc58 loc61)
		(connected loc62 loc37)
		(connected loc37 loc62)
		(connected loc62 loc60)
		(connected loc60 loc62)
		(connected loc62 loc67)
		(connected loc67 loc62)
		(connected loc62 loc71)
		(connected loc71 loc62)
		(connected loc62 loc78)
		(connected loc78 loc62)
		(connected loc62 loc85)
		(connected loc85 loc62)
		(connected loc62 loc92)
		(connected loc92 loc62)
		(connected loc63 loc8)
		(connected loc8 loc63)
		(connected loc63 loc41)
		(connected loc41 loc63)
		(connected loc63 loc42)
		(connected loc42 loc63)
		(connected loc63 loc53)
		(connected loc53 loc63)
		(connected loc63 loc58)
		(connected loc58 loc63)
		(connected loc63 loc60)
		(connected loc60 loc63)
		(connected loc63 loc64)
		(connected loc64 loc63)
		(connected loc63 loc69)
		(connected loc69 loc63)
		(connected loc63 loc70)
		(connected loc70 loc63)
		(connected loc63 loc79)
		(connected loc79 loc63)
		(connected loc63 loc91)
		(connected loc91 loc63)
		(connected loc64 loc25)
		(connected loc25 loc64)
		(connected loc64 loc32)
		(connected loc32 loc64)
		(connected loc64 loc37)
		(connected loc37 loc64)
		(connected loc64 loc80)
		(connected loc80 loc64)
		(connected loc65 loc23)
		(connected loc23 loc65)
		(connected loc65 loc40)
		(connected loc40 loc65)
		(connected loc65 loc62)
		(connected loc62 loc65)
		(connected loc66 loc21)
		(connected loc21 loc66)
		(connected loc66 loc35)
		(connected loc35 loc66)
		(connected loc66 loc38)
		(connected loc38 loc66)
		(connected loc66 loc43)
		(connected loc43 loc66)
		(connected loc66 loc47)
		(connected loc47 loc66)
		(connected loc66 loc62)
		(connected loc62 loc66)
		(connected loc66 loc82)
		(connected loc82 loc66)
		(connected loc66 loc92)
		(connected loc92 loc66)
		(connected loc67 loc43)
		(connected loc43 loc67)
		(connected loc67 loc58)
		(connected loc58 loc67)
		(connected loc67 loc64)
		(connected loc64 loc67)
		(connected loc67 loc66)
		(connected loc66 loc67)
		(connected loc67 loc68)
		(connected loc68 loc67)
		(connected loc67 loc81)
		(connected loc81 loc67)
		(connected loc67 loc82)
		(connected loc82 loc67)
		(connected loc68 loc38)
		(connected loc38 loc68)
		(connected loc68 loc42)
		(connected loc42 loc68)
		(connected loc68 loc48)
		(connected loc48 loc68)
		(connected loc68 loc55)
		(connected loc55 loc68)
		(connected loc68 loc57)
		(connected loc57 loc68)
		(connected loc68 loc59)
		(connected loc59 loc68)
		(connected loc69 loc22)
		(connected loc22 loc69)
		(connected loc69 loc59)
		(connected loc59 loc69)
		(connected loc69 loc66)
		(connected loc66 loc69)
		(connected loc70 loc3)
		(connected loc3 loc70)
		(connected loc70 loc13)
		(connected loc13 loc70)
		(connected loc70 loc20)
		(connected loc20 loc70)
		(connected loc70 loc39)
		(connected loc39 loc70)
		(connected loc70 loc58)
		(connected loc58 loc70)
		(connected loc70 loc61)
		(connected loc61 loc70)
		(connected loc70 loc65)
		(connected loc65 loc70)
		(connected loc70 loc67)
		(connected loc67 loc70)
		(connected loc70 loc72)
		(connected loc72 loc70)
		(connected loc70 loc73)
		(connected loc73 loc70)
		(connected loc71 loc45)
		(connected loc45 loc71)
		(connected loc71 loc74)
		(connected loc74 loc71)
		(connected loc71 loc77)
		(connected loc77 loc71)
		(connected loc71 loc90)
		(connected loc90 loc71)
		(connected loc72 loc37)
		(connected loc37 loc72)
		(connected loc72 loc79)
		(connected loc79 loc72)
		(connected loc72 loc87)
		(connected loc87 loc72)
		(connected loc72 loc88)
		(connected loc88 loc72)
		(connected loc73 loc20)
		(connected loc20 loc73)
		(connected loc73 loc28)
		(connected loc28 loc73)
		(connected loc73 loc29)
		(connected loc29 loc73)
		(connected loc73 loc34)
		(connected loc34 loc73)
		(connected loc73 loc62)
		(connected loc62 loc73)
		(connected loc73 loc85)
		(connected loc85 loc73)
		(connected loc73 loc90)
		(connected loc90 loc73)
		(connected loc74 loc2)
		(connected loc2 loc74)
		(connected loc74 loc32)
		(connected loc32 loc74)
		(connected loc74 loc46)
		(connected loc46 loc74)
		(connected loc74 loc58)
		(connected loc58 loc74)
		(connected loc74 loc62)
		(connected loc62 loc74)
		(connected loc74 loc64)
		(connected loc64 loc74)
		(connected loc74 loc72)
		(connected loc72 loc74)
		(connected loc74 loc86)
		(connected loc86 loc74)
		(connected loc75 loc35)
		(connected loc35 loc75)
		(connected loc75 loc36)
		(connected loc36 loc75)
		(connected loc76 loc7)
		(connected loc7 loc76)
		(connected loc76 loc11)
		(connected loc11 loc76)
		(connected loc76 loc35)
		(connected loc35 loc76)
		(connected loc76 loc53)
		(connected loc53 loc76)
		(connected loc76 loc61)
		(connected loc61 loc76)
		(connected loc76 loc62)
		(connected loc62 loc76)
		(connected loc76 loc74)
		(connected loc74 loc76)
		(connected loc77 loc45)
		(connected loc45 loc77)
		(connected loc77 loc80)
		(connected loc80 loc77)
		(connected loc77 loc86)
		(connected loc86 loc77)
		(connected loc78 loc60)
		(connected loc60 loc78)
		(connected loc78 loc85)
		(connected loc85 loc78)
		(connected loc78 loc91)
		(connected loc91 loc78)
		(connected loc79 loc31)
		(connected loc31 loc79)
		(connected loc79 loc62)
		(connected loc62 loc79)
		(connected loc79 loc69)
		(connected loc69 loc79)
		(connected loc80 loc6)
		(connected loc6 loc80)
		(connected loc80 loc33)
		(connected loc33 loc80)
		(connected loc80 loc70)
		(connected loc70 loc80)
		(connected loc81 loc27)
		(connected loc27 loc81)
		(connected loc81 loc54)
		(connected loc54 loc81)
		(connected loc81 loc61)
		(connected loc61 loc81)
		(connected loc81 loc64)
		(connected loc64 loc81)
		(connected loc81 loc67)
		(connected loc67 loc81)
		(connected loc81 loc78)
		(connected loc78 loc81)
		(connected loc81 loc79)
		(connected loc79 loc81)
		(connected loc81 loc83)
		(connected loc83 loc81)
		(connected loc81 loc89)
		(connected loc89 loc81)
		(connected loc82 loc26)
		(connected loc26 loc82)
		(connected loc82 loc71)
		(connected loc71 loc82)
		(connected loc82 loc75)
		(connected loc75 loc82)
		(connected loc82 loc84)
		(connected loc84 loc82)
		(connected loc82 loc87)
		(connected loc87 loc82)
		(connected loc82 loc91)
		(connected loc91 loc82)
		(connected loc83 loc37)
		(connected loc37 loc83)
		(connected loc83 loc60)
		(connected loc60 loc83)
		(connected loc83 loc76)
		(connected loc76 loc83)
		(connected loc84 loc41)
		(connected loc41 loc84)
		(connected loc84 loc45)
		(connected loc45 loc84)
		(connected loc84 loc63)
		(connected loc63 loc84)
		(connected loc84 loc76)
		(connected loc76 loc84)
		(connected loc84 loc79)
		(connected loc79 loc84)
		(connected loc85 loc16)
		(connected loc16 loc85)
		(connected loc85 loc38)
		(connected loc38 loc85)
		(connected loc85 loc44)
		(connected loc44 loc85)
		(connected loc85 loc46)
		(connected loc46 loc85)
		(connected loc85 loc57)
		(connected loc57 loc85)
		(connected loc85 loc81)
		(connected loc81 loc85)
		(connected loc85 loc86)
		(connected loc86 loc85)
		(connected loc86 loc68)
		(connected loc68 loc86)
		(connected loc86 loc78)
		(connected loc78 loc86)
		(connected loc87 loc8)
		(connected loc8 loc87)
		(connected loc87 loc11)
		(connected loc11 loc87)
		(connected loc87 loc63)
		(connected loc63 loc87)
		(connected loc87 loc65)
		(connected loc65 loc87)
		(connected loc87 loc71)
		(connected loc71 loc87)
		(connected loc87 loc72)
		(connected loc72 loc87)
		(connected loc87 loc83)
		(connected loc83 loc87)
		(connected loc87 loc91)
		(connected loc91 loc87)
		(connected loc88 loc23)
		(connected loc23 loc88)
		(connected loc88 loc33)
		(connected loc33 loc88)
		(connected loc88 loc50)
		(connected loc50 loc88)
		(connected loc88 loc89)
		(connected loc89 loc88)
		(connected loc88 loc92)
		(connected loc92 loc88)
		(connected loc89 loc36)
		(connected loc36 loc89)
		(connected loc89 loc61)
		(connected loc61 loc89)
		(connected loc89 loc65)
		(connected loc65 loc89)
		(connected loc89 loc70)
		(connected loc70 loc89)
		(connected loc89 loc75)
		(connected loc75 loc89)
		(connected loc89 loc81)
		(connected loc81 loc89)
		(connected loc90 loc44)
		(connected loc44 loc90)
		(connected loc90 loc66)
		(connected loc66 loc90)
		(connected loc90 loc83)
		(connected loc83 loc90)
		(connected loc91 loc45)
		(connected loc45 loc91)
		(connected loc91 loc54)
		(connected loc54 loc91)
		(connected loc91 loc70)
		(connected loc70 loc91)
		(connected loc92 loc8)
		(connected loc8 loc92)
		(connected loc92 loc29)
		(connected loc29 loc92)
		(connected loc92 loc41)
		(connected loc41 loc92)

		(in bar1 loc1)
		(in bar5 loc5)
		(in bar7 loc7)
		(in bar9 loc9)
		(in bar13 loc13)
		(in bar17 loc17)
		(in bar18 loc18)
		(in bar19 loc19)
		(in bar22 loc22)
		(in bar25 loc25)
		(in bar26 loc26)
		(in bar27 loc27)
		(in bar30 loc30)
		(in bar34 loc34)
		(in bar35 loc35)
		(in bar37 loc37)
		(in bar39 loc39)
		(in bar43 loc43)
		(in bar45 loc45)
		(in bar47 loc47)
		(in bar48 loc48)
		(in bar50 loc50)
		(in bar60 loc60)
		(in bar62 loc62)
		(in bar63 loc63)
		(in bar64 loc64)
		(in bar65 loc65)
		(in bar66 loc66)
		(in bar67 loc67)
		(in bar70 loc70)
		(in bar72 loc72)
		(in bar74 loc74)
		(in bar75 loc75)
		(in bar76 loc76)
		(in bar77 loc77)
		(in bar80 loc80)
		(in bar82 loc82)
		(in bar83 loc83)
		(in bar84 loc84)
		(in bar85 loc85)
		(in bar87 loc87)
		(in bar90 loc90)

	)

	(:goal
		(and
			(at loc92)
		)
	)
)