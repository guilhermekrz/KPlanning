; Generated by ProblemGenerator - Problem 36 at Mon Nov 28 15:07:22 BRST 2016
(define (problem pb36)
	(:domain drinkanddrive-generated)
	(:requirements :strips :typing :negative-preconditions)
	(:objects
		loc1 loc2 loc3 loc4 loc5 loc6 loc7 loc8 loc9 loc10 loc11 loc12 loc13 loc14 loc15 loc16 loc17 loc18 loc19 loc20 loc21 loc22 loc23 loc24 loc25 loc26 loc27 loc28 loc29 loc30 loc31 loc32 loc33 loc34 loc35 loc36 loc37 loc38 loc39 loc40 loc41 loc42 loc43 loc44 loc45 loc46 loc47 loc48 loc49 loc50 loc51 loc52 loc53 loc54 loc55 loc56 loc57 loc58 loc59 loc60 loc61 loc62 loc63 loc64 loc65 loc66 loc67 loc68 loc69 loc70 loc71 loc72 loc73 loc74 loc75 loc76 loc77 loc78 loc79 loc80 loc81 loc82 loc83 loc84 loc85 loc86 - location
		bar4 bar6 bar8 bar9 bar11 bar16 bar18 bar23 bar25 bar33 bar34 bar36 bar38 bar39 bar42 bar50 bar52 bar55 bar59 bar63 bar65 bar68 bar71 bar75 bar76 bar78 bar79 bar80 bar84 bar85 - bar
	)
	(:init
		(at loc1)

		(connected loc76 loc20)
		(connected loc20 loc76)
		(connected loc20 loc65)
		(connected loc65 loc20)
		(connected loc65 loc38)
		(connected loc38 loc65)
		(connected loc38 loc71)
		(connected loc71 loc38)
		(connected loc71 loc81)
		(connected loc81 loc71)
		(connected loc81 loc68)
		(connected loc68 loc81)
		(connected loc68 loc9)
		(connected loc9 loc68)
		(connected loc9 loc77)
		(connected loc77 loc9)
		(connected loc77 loc47)
		(connected loc47 loc77)
		(connected loc47 loc72)
		(connected loc72 loc47)
		(connected loc68 loc35)
		(connected loc35 loc68)
		(connected loc35 loc30)
		(connected loc30 loc35)
		(connected loc30 loc2)
		(connected loc2 loc30)
		(connected loc2 loc34)
		(connected loc34 loc2)
		(connected loc34 loc14)
		(connected loc14 loc34)
		(connected loc14 loc10)
		(connected loc10 loc14)
		(connected loc30 loc23)
		(connected loc23 loc30)
		(connected loc23 loc69)
		(connected loc69 loc23)
		(connected loc69 loc84)
		(connected loc84 loc69)
		(connected loc84 loc15)
		(connected loc15 loc84)
		(connected loc15 loc5)
		(connected loc5 loc15)
		(connected loc5 loc57)
		(connected loc57 loc5)
		(connected loc57 loc56)
		(connected loc56 loc57)
		(connected loc76 loc51)
		(connected loc51 loc76)
		(connected loc51 loc22)
		(connected loc22 loc51)
		(connected loc68 loc40)
		(connected loc40 loc68)
		(connected loc40 loc13)
		(connected loc13 loc40)
		(connected loc13 loc37)
		(connected loc37 loc13)
		(connected loc37 loc73)
		(connected loc73 loc37)
		(connected loc69 loc80)
		(connected loc80 loc69)
		(connected loc80 loc44)
		(connected loc44 loc80)
		(connected loc44 loc33)
		(connected loc33 loc44)
		(connected loc33 loc66)
		(connected loc66 loc33)
		(connected loc66 loc6)
		(connected loc6 loc66)
		(connected loc15 loc59)
		(connected loc59 loc15)
		(connected loc57 loc64)
		(connected loc64 loc57)
		(connected loc64 loc75)
		(connected loc75 loc64)
		(connected loc51 loc1)
		(connected loc1 loc51)
		(connected loc1 loc61)
		(connected loc61 loc1)
		(connected loc61 loc78)
		(connected loc78 loc61)
		(connected loc78 loc62)
		(connected loc62 loc78)
		(connected loc62 loc43)
		(connected loc43 loc62)
		(connected loc43 loc29)
		(connected loc29 loc43)
		(connected loc66 loc12)
		(connected loc12 loc66)
		(connected loc47 loc16)
		(connected loc16 loc47)
		(connected loc66 loc25)
		(connected loc25 loc66)
		(connected loc80 loc82)
		(connected loc82 loc80)
		(connected loc43 loc41)
		(connected loc41 loc43)
		(connected loc47 loc3)
		(connected loc3 loc47)
		(connected loc1 loc27)
		(connected loc27 loc1)
		(connected loc27 loc46)
		(connected loc46 loc27)
		(connected loc75 loc54)
		(connected loc54 loc75)
		(connected loc54 loc19)
		(connected loc19 loc54)
		(connected loc19 loc7)
		(connected loc7 loc19)
		(connected loc81 loc58)
		(connected loc58 loc81)
		(connected loc68 loc53)
		(connected loc53 loc68)
		(connected loc53 loc63)
		(connected loc63 loc53)
		(connected loc68 loc36)
		(connected loc36 loc68)
		(connected loc19 loc85)
		(connected loc85 loc19)
		(connected loc25 loc32)
		(connected loc32 loc25)
		(connected loc54 loc79)
		(connected loc79 loc54)
		(connected loc72 loc8)
		(connected loc8 loc72)
		(connected loc85 loc21)
		(connected loc21 loc85)
		(connected loc33 loc28)
		(connected loc28 loc33)
		(connected loc54 loc26)
		(connected loc26 loc54)
		(connected loc41 loc48)
		(connected loc48 loc41)
		(connected loc66 loc67)
		(connected loc67 loc66)
		(connected loc67 loc74)
		(connected loc74 loc67)
		(connected loc25 loc42)
		(connected loc42 loc25)
		(connected loc42 loc17)
		(connected loc17 loc42)
		(connected loc46 loc50)
		(connected loc50 loc46)
		(connected loc15 loc83)
		(connected loc83 loc15)
		(connected loc84 loc70)
		(connected loc70 loc84)
		(connected loc70 loc49)
		(connected loc49 loc70)
		(connected loc1 loc31)
		(connected loc31 loc1)
		(connected loc62 loc24)
		(connected loc24 loc62)
		(connected loc58 loc11)
		(connected loc11 loc58)
		(connected loc8 loc39)
		(connected loc39 loc8)
		(connected loc25 loc52)
		(connected loc52 loc25)
		(connected loc37 loc45)
		(connected loc45 loc37)
		(connected loc65 loc18)
		(connected loc18 loc65)
		(connected loc69 loc55)
		(connected loc55 loc69)
		(connected loc64 loc60)
		(connected loc60 loc64)
		(connected loc8 loc86)
		(connected loc86 loc8)
		(connected loc14 loc4)
		(connected loc4 loc14)
		(connected loc1 loc3)
		(connected loc3 loc1)
		(connected loc1 loc16)
		(connected loc16 loc1)
		(connected loc1 loc19)
		(connected loc19 loc1)
		(connected loc1 loc24)
		(connected loc24 loc1)
		(connected loc1 loc50)
		(connected loc50 loc1)
		(connected loc2 loc1)
		(connected loc1 loc2)
		(connected loc2 loc9)
		(connected loc9 loc2)
		(connected loc2 loc24)
		(connected loc24 loc2)
		(connected loc2 loc66)
		(connected loc66 loc2)
		(connected loc3 loc8)
		(connected loc8 loc3)
		(connected loc4 loc7)
		(connected loc7 loc4)
		(connected loc4 loc19)
		(connected loc19 loc4)
		(connected loc4 loc33)
		(connected loc33 loc4)
		(connected loc4 loc37)
		(connected loc37 loc4)
		(connected loc4 loc41)
		(connected loc41 loc4)
		(connected loc4 loc65)
		(connected loc65 loc4)
		(connected loc4 loc68)
		(connected loc68 loc4)
		(connected loc5 loc30)
		(connected loc30 loc5)
		(connected loc5 loc31)
		(connected loc31 loc5)
		(connected loc5 loc34)
		(connected loc34 loc5)
		(connected loc5 loc51)
		(connected loc51 loc5)
		(connected loc6 loc3)
		(connected loc3 loc6)
		(connected loc6 loc7)
		(connected loc7 loc6)
		(connected loc6 loc43)
		(connected loc43 loc6)
		(connected loc6 loc47)
		(connected loc47 loc6)
		(connected loc7 loc46)
		(connected loc46 loc7)
		(connected loc7 loc61)
		(connected loc61 loc7)
		(connected loc7 loc65)
		(connected loc65 loc7)
		(connected loc8 loc13)
		(connected loc13 loc8)
		(connected loc8 loc30)
		(connected loc30 loc8)
		(connected loc8 loc40)
		(connected loc40 loc8)
		(connected loc8 loc42)
		(connected loc42 loc8)
		(connected loc9 loc4)
		(connected loc4 loc9)
		(connected loc9 loc29)
		(connected loc29 loc9)
		(connected loc9 loc35)
		(connected loc35 loc9)
		(connected loc9 loc64)
		(connected loc64 loc9)
		(connected loc10 loc17)
		(connected loc17 loc10)
		(connected loc10 loc53)
		(connected loc53 loc10)
		(connected loc10 loc57)
		(connected loc57 loc10)
		(connected loc10 loc86)
		(connected loc86 loc10)
		(connected loc11 loc2)
		(connected loc2 loc11)
		(connected loc11 loc4)
		(connected loc4 loc11)
		(connected loc11 loc22)
		(connected loc22 loc11)
		(connected loc11 loc50)
		(connected loc50 loc11)
		(connected loc11 loc70)
		(connected loc70 loc11)
		(connected loc11 loc77)
		(connected loc77 loc11)
		(connected loc12 loc41)
		(connected loc41 loc12)
		(connected loc13 loc11)
		(connected loc11 loc13)
		(connected loc13 loc23)
		(connected loc23 loc13)
		(connected loc13 loc27)
		(connected loc27 loc13)
		(connected loc13 loc33)
		(connected loc33 loc13)
		(connected loc13 loc75)
		(connected loc75 loc13)
		(connected loc13 loc82)
		(connected loc82 loc13)
		(connected loc14 loc32)
		(connected loc32 loc14)
		(connected loc14 loc39)
		(connected loc39 loc14)
		(connected loc15 loc3)
		(connected loc3 loc15)
		(connected loc15 loc17)
		(connected loc17 loc15)
		(connected loc15 loc37)
		(connected loc37 loc15)
		(connected loc15 loc52)
		(connected loc52 loc15)
		(connected loc16 loc49)
		(connected loc49 loc16)
		(connected loc16 loc50)
		(connected loc50 loc16)
		(connected loc16 loc72)
		(connected loc72 loc16)
		(connected loc16 loc75)
		(connected loc75 loc16)
		(connected loc17 loc9)
		(connected loc9 loc17)
		(connected loc17 loc11)
		(connected loc11 loc17)
		(connected loc17 loc33)
		(connected loc33 loc17)
		(connected loc17 loc46)
		(connected loc46 loc17)
		(connected loc17 loc69)
		(connected loc69 loc17)
		(connected loc17 loc73)
		(connected loc73 loc17)
		(connected loc18 loc4)
		(connected loc4 loc18)
		(connected loc18 loc5)
		(connected loc5 loc18)
		(connected loc18 loc7)
		(connected loc7 loc18)
		(connected loc18 loc8)
		(connected loc8 loc18)
		(connected loc18 loc19)
		(connected loc19 loc18)
		(connected loc18 loc24)
		(connected loc24 loc18)
		(connected loc18 loc42)
		(connected loc42 loc18)
		(connected loc18 loc70)
		(connected loc70 loc18)
		(connected loc19 loc8)
		(connected loc8 loc19)
		(connected loc19 loc38)
		(connected loc38 loc19)
		(connected loc19 loc43)
		(connected loc43 loc19)
		(connected loc19 loc59)
		(connected loc59 loc19)
		(connected loc19 loc66)
		(connected loc66 loc19)
		(connected loc19 loc79)
		(connected loc79 loc19)
		(connected loc20 loc5)
		(connected loc5 loc20)
		(connected loc20 loc15)
		(connected loc15 loc20)
		(connected loc20 loc32)
		(connected loc32 loc20)
		(connected loc21 loc14)
		(connected loc14 loc21)
		(connected loc21 loc25)
		(connected loc25 loc21)
		(connected loc21 loc26)
		(connected loc26 loc21)
		(connected loc21 loc34)
		(connected loc34 loc21)
		(connected loc21 loc42)
		(connected loc42 loc21)
		(connected loc21 loc52)
		(connected loc52 loc21)
		(connected loc21 loc70)
		(connected loc70 loc21)
		(connected loc22 loc1)
		(connected loc1 loc22)
		(connected loc22 loc3)
		(connected loc3 loc22)
		(connected loc22 loc11)
		(connected loc11 loc22)
		(connected loc22 loc18)
		(connected loc18 loc22)
		(connected loc22 loc39)
		(connected loc39 loc22)
		(connected loc23 loc2)
		(connected loc2 loc23)
		(connected loc23 loc3)
		(connected loc3 loc23)
		(connected loc23 loc19)
		(connected loc19 loc23)
		(connected loc23 loc22)
		(connected loc22 loc23)
		(connected loc23 loc24)
		(connected loc24 loc23)
		(connected loc23 loc35)
		(connected loc35 loc23)
		(connected loc23 loc36)
		(connected loc36 loc23)
		(connected loc23 loc57)
		(connected loc57 loc23)
		(connected loc23 loc72)
		(connected loc72 loc23)
		(connected loc23 loc77)
		(connected loc77 loc23)
		(connected loc24 loc25)
		(connected loc25 loc24)
		(connected loc24 loc30)
		(connected loc30 loc24)
		(connected loc24 loc77)
		(connected loc77 loc24)
		(connected loc25 loc7)
		(connected loc7 loc25)
		(connected loc25 loc45)
		(connected loc45 loc25)
		(connected loc25 loc47)
		(connected loc47 loc25)
		(connected loc25 loc70)
		(connected loc70 loc25)
		(connected loc25 loc79)
		(connected loc79 loc25)
		(connected loc26 loc11)
		(connected loc11 loc26)
		(connected loc26 loc47)
		(connected loc47 loc26)
		(connected loc26 loc50)
		(connected loc50 loc26)
		(connected loc26 loc55)
		(connected loc55 loc26)
		(connected loc26 loc65)
		(connected loc65 loc26)
		(connected loc27 loc18)
		(connected loc18 loc27)
		(connected loc27 loc50)
		(connected loc50 loc27)
		(connected loc27 loc55)
		(connected loc55 loc27)
		(connected loc27 loc65)
		(connected loc65 loc27)
		(connected loc28 loc22)
		(connected loc22 loc28)
		(connected loc28 loc35)
		(connected loc35 loc28)
		(connected loc28 loc36)
		(connected loc36 loc28)
		(connected loc28 loc44)
		(connected loc44 loc28)
		(connected loc28 loc54)
		(connected loc54 loc28)
		(connected loc28 loc62)
		(connected loc62 loc28)
		(connected loc28 loc64)
		(connected loc64 loc28)
		(connected loc29 loc55)
		(connected loc55 loc29)
		(connected loc30 loc31)
		(connected loc31 loc30)
		(connected loc30 loc47)
		(connected loc47 loc30)
		(connected loc30 loc68)
		(connected loc68 loc30)
		(connected loc31 loc4)
		(connected loc4 loc31)
		(connected loc31 loc14)
		(connected loc14 loc31)
		(connected loc31 loc20)
		(connected loc20 loc31)
		(connected loc31 loc26)
		(connected loc26 loc31)
		(connected loc31 loc37)
		(connected loc37 loc31)
		(connected loc31 loc41)
		(connected loc41 loc31)
		(connected loc32 loc8)
		(connected loc8 loc32)
		(connected loc32 loc18)
		(connected loc18 loc32)
		(connected loc32 loc28)
		(connected loc28 loc32)
		(connected loc32 loc31)
		(connected loc31 loc32)
		(connected loc32 loc36)
		(connected loc36 loc32)
		(connected loc32 loc41)
		(connected loc41 loc32)
		(connected loc32 loc44)
		(connected loc44 loc32)
		(connected loc32 loc47)
		(connected loc47 loc32)
		(connected loc32 loc50)
		(connected loc50 loc32)
		(connected loc32 loc52)
		(connected loc52 loc32)
		(connected loc32 loc56)
		(connected loc56 loc32)
		(connected loc32 loc78)
		(connected loc78 loc32)
		(connected loc33 loc8)
		(connected loc8 loc33)
		(connected loc33 loc14)
		(connected loc14 loc33)
		(connected loc33 loc26)
		(connected loc26 loc33)
		(connected loc33 loc30)
		(connected loc30 loc33)
		(connected loc33 loc31)
		(connected loc31 loc33)
		(connected loc33 loc46)
		(connected loc46 loc33)
		(connected loc33 loc52)
		(connected loc52 loc33)
		(connected loc34 loc22)
		(connected loc22 loc34)
		(connected loc34 loc31)
		(connected loc31 loc34)
		(connected loc34 loc40)
		(connected loc40 loc34)
		(connected loc34 loc45)
		(connected loc45 loc34)
		(connected loc34 loc54)
		(connected loc54 loc34)
		(connected loc34 loc67)
		(connected loc67 loc34)
		(connected loc34 loc79)
		(connected loc79 loc34)
		(connected loc35 loc7)
		(connected loc7 loc35)
		(connected loc35 loc47)
		(connected loc47 loc35)
		(connected loc35 loc73)
		(connected loc73 loc35)
		(connected loc35 loc84)
		(connected loc84 loc35)
		(connected loc36 loc13)
		(connected loc13 loc36)
		(connected loc36 loc16)
		(connected loc16 loc36)
		(connected loc36 loc17)
		(connected loc17 loc36)
		(connected loc36 loc20)
		(connected loc20 loc36)
		(connected loc36 loc23)
		(connected loc23 loc36)
		(connected loc36 loc65)
		(connected loc65 loc36)
		(connected loc37 loc7)
		(connected loc7 loc37)
		(connected loc37 loc8)
		(connected loc8 loc37)
		(connected loc37 loc54)
		(connected loc54 loc37)
		(connected loc37 loc71)
		(connected loc71 loc37)
		(connected loc38 loc6)
		(connected loc6 loc38)
		(connected loc38 loc24)
		(connected loc24 loc38)
		(connected loc39 loc11)
		(connected loc11 loc39)
		(connected loc39 loc58)
		(connected loc58 loc39)
		(connected loc39 loc85)
		(connected loc85 loc39)
		(connected loc40 loc1)
		(connected loc1 loc40)
		(connected loc40 loc9)
		(connected loc9 loc40)
		(connected loc40 loc33)
		(connected loc33 loc40)
		(connected loc40 loc41)
		(connected loc41 loc40)
		(connected loc40 loc69)
		(connected loc69 loc40)
		(connected loc41 loc14)
		(connected loc14 loc41)
		(connected loc41 loc38)
		(connected loc38 loc41)
		(connected loc41 loc44)
		(connected loc44 loc41)
		(connected loc41 loc59)
		(connected loc59 loc41)
		(connected loc41 loc78)
		(connected loc78 loc41)
		(connected loc41 loc85)
		(connected loc85 loc41)
		(connected loc42 loc14)
		(connected loc14 loc42)
		(connected loc42 loc24)
		(connected loc24 loc42)
		(connected loc42 loc30)
		(connected loc30 loc42)
		(connected loc42 loc43)
		(connected loc43 loc42)
		(connected loc42 loc58)
		(connected loc58 loc42)
		(connected loc43 loc7)
		(connected loc7 loc43)
		(connected loc43 loc67)
		(connected loc67 loc43)
		(connected loc43 loc84)
		(connected loc84 loc43)
		(connected loc44 loc13)
		(connected loc13 loc44)
		(connected loc44 loc34)
		(connected loc34 loc44)
		(connected loc44 loc36)
		(connected loc36 loc44)
		(connected loc44 loc47)
		(connected loc47 loc44)
		(connected loc44 loc52)
		(connected loc52 loc44)
		(connected loc44 loc55)
		(connected loc55 loc44)
		(connected loc45 loc34)
		(connected loc34 loc45)
		(connected loc45 loc42)
		(connected loc42 loc45)
		(connected loc45 loc71)
		(connected loc71 loc45)
		(connected loc45 loc82)
		(connected loc82 loc45)
		(connected loc45 loc84)
		(connected loc84 loc45)
		(connected loc46 loc5)
		(connected loc5 loc46)
		(connected loc46 loc23)
		(connected loc23 loc46)
		(connected loc46 loc29)
		(connected loc29 loc46)
		(connected loc46 loc31)
		(connected loc31 loc46)
		(connected loc46 loc35)
		(connected loc35 loc46)
		(connected loc46 loc48)
		(connected loc48 loc46)
		(connected loc46 loc56)
		(connected loc56 loc46)
		(connected loc46 loc59)
		(connected loc59 loc46)
		(connected loc46 loc60)
		(connected loc60 loc46)
		(connected loc47 loc13)
		(connected loc13 loc47)
		(connected loc47 loc20)
		(connected loc20 loc47)
		(connected loc47 loc26)
		(connected loc26 loc47)
		(connected loc47 loc30)
		(connected loc30 loc47)
		(connected loc47 loc44)
		(connected loc44 loc47)
		(connected loc47 loc67)
		(connected loc67 loc47)
		(connected loc47 loc70)
		(connected loc70 loc47)
		(connected loc47 loc79)
		(connected loc79 loc47)
		(connected loc47 loc83)
		(connected loc83 loc47)
		(connected loc47 loc85)
		(connected loc85 loc47)
		(connected loc48 loc33)
		(connected loc33 loc48)
		(connected loc48 loc66)
		(connected loc66 loc48)
		(connected loc49 loc16)
		(connected loc16 loc49)
		(connected loc49 loc47)
		(connected loc47 loc49)
		(connected loc49 loc61)
		(connected loc61 loc49)
		(connected loc49 loc65)
		(connected loc65 loc49)
		(connected loc49 loc68)
		(connected loc68 loc49)
		(connected loc50 loc33)
		(connected loc33 loc50)
		(connected loc50 loc39)
		(connected loc39 loc50)
		(connected loc50 loc43)
		(connected loc43 loc50)
		(connected loc50 loc49)
		(connected loc49 loc50)
		(connected loc50 loc52)
		(connected loc52 loc50)
		(connected loc50 loc57)
		(connected loc57 loc50)
		(connected loc50 loc81)
		(connected loc81 loc50)
		(connected loc51 loc11)
		(connected loc11 loc51)
		(connected loc51 loc31)
		(connected loc31 loc51)
		(connected loc51 loc33)
		(connected loc33 loc51)
		(connected loc51 loc36)
		(connected loc36 loc51)
		(connected loc51 loc45)
		(connected loc45 loc51)
		(connected loc51 loc50)
		(connected loc50 loc51)
		(connected loc51 loc62)
		(connected loc62 loc51)
		(connected loc51 loc68)
		(connected loc68 loc51)
		(connected loc52 loc14)
		(connected loc14 loc52)
		(connected loc52 loc17)
		(connected loc17 loc52)
		(connected loc52 loc24)
		(connected loc24 loc52)
		(connected loc52 loc36)
		(connected loc36 loc52)
		(connected loc52 loc43)
		(connected loc43 loc52)
		(connected loc52 loc44)
		(connected loc44 loc52)
		(connected loc52 loc53)
		(connected loc53 loc52)
		(connected loc52 loc64)
		(connected loc64 loc52)
		(connected loc52 loc72)
		(connected loc72 loc52)
		(connected loc52 loc79)
		(connected loc79 loc52)
		(connected loc52 loc80)
		(connected loc80 loc52)
		(connected loc53 loc10)
		(connected loc10 loc53)
		(connected loc53 loc35)
		(connected loc35 loc53)
		(connected loc53 loc48)
		(connected loc48 loc53)
		(connected loc53 loc59)
		(connected loc59 loc53)
		(connected loc54 loc35)
		(connected loc35 loc54)
		(connected loc54 loc38)
		(connected loc38 loc54)
		(connected loc54 loc42)
		(connected loc42 loc54)
		(connected loc54 loc51)
		(connected loc51 loc54)
		(connected loc54 loc62)
		(connected loc62 loc54)
		(connected loc54 loc67)
		(connected loc67 loc54)
		(connected loc54 loc82)
		(connected loc82 loc54)
		(connected loc55 loc8)
		(connected loc8 loc55)
		(connected loc55 loc19)
		(connected loc19 loc55)
		(connected loc55 loc27)
		(connected loc27 loc55)
		(connected loc55 loc34)
		(connected loc34 loc55)
		(connected loc55 loc52)
		(connected loc52 loc55)
		(connected loc55 loc56)
		(connected loc56 loc55)
		(connected loc55 loc79)
		(connected loc79 loc55)
		(connected loc56 loc19)
		(connected loc19 loc56)
		(connected loc56 loc24)
		(connected loc24 loc56)
		(connected loc56 loc34)
		(connected loc34 loc56)
		(connected loc56 loc43)
		(connected loc43 loc56)
		(connected loc56 loc50)
		(connected loc50 loc56)
		(connected loc56 loc53)
		(connected loc53 loc56)
		(connected loc56 loc77)
		(connected loc77 loc56)
		(connected loc56 loc78)
		(connected loc78 loc56)
		(connected loc56 loc84)
		(connected loc84 loc56)
		(connected loc57 loc2)
		(connected loc2 loc57)
		(connected loc57 loc15)
		(connected loc15 loc57)
		(connected loc57 loc22)
		(connected loc22 loc57)
		(connected loc57 loc24)
		(connected loc24 loc57)
		(connected loc57 loc34)
		(connected loc34 loc57)
		(connected loc57 loc37)
		(connected loc37 loc57)
		(connected loc57 loc43)
		(connected loc43 loc57)
		(connected loc57 loc52)
		(connected loc52 loc57)
		(connected loc57 loc76)
		(connected loc76 loc57)
		(connected loc57 loc79)
		(connected loc79 loc57)
		(connected loc58 loc28)
		(connected loc28 loc58)
		(connected loc58 loc31)
		(connected loc31 loc58)
		(connected loc58 loc54)
		(connected loc54 loc58)
		(connected loc59 loc23)
		(connected loc23 loc59)
		(connected loc59 loc35)
		(connected loc35 loc59)
		(connected loc59 loc54)
		(connected loc54 loc59)
		(connected loc59 loc63)
		(connected loc63 loc59)
		(connected loc59 loc74)
		(connected loc74 loc59)
		(connected loc60 loc27)
		(connected loc27 loc60)
		(connected loc60 loc34)
		(connected loc34 loc60)
		(connected loc60 loc67)
		(connected loc67 loc60)
		(connected loc60 loc76)
		(connected loc76 loc60)
		(connected loc60 loc79)
		(connected loc79 loc60)
		(connected loc60 loc83)
		(connected loc83 loc60)
		(connected loc61 loc5)
		(connected loc5 loc61)
		(connected loc61 loc10)
		(connected loc10 loc61)
		(connected loc61 loc23)
		(connected loc23 loc61)
		(connected loc61 loc35)
		(connected loc35 loc61)
		(connected loc61 loc57)
		(connected loc57 loc61)
		(connected loc61 loc82)
		(connected loc82 loc61)
		(connected loc61 loc84)
		(connected loc84 loc61)
		(connected loc62 loc27)
		(connected loc27 loc62)
		(connected loc62 loc36)
		(connected loc36 loc62)
		(connected loc62 loc37)
		(connected loc37 loc62)
		(connected loc62 loc45)
		(connected loc45 loc62)
		(connected loc62 loc58)
		(connected loc58 loc62)
		(connected loc62 loc65)
		(connected loc65 loc62)
		(connected loc62 loc84)
		(connected loc84 loc62)
		(connected loc63 loc27)
		(connected loc27 loc63)
		(connected loc63 loc45)
		(connected loc45 loc63)
		(connected loc63 loc80)
		(connected loc80 loc63)
		(connected loc64 loc24)
		(connected loc24 loc64)
		(connected loc64 loc28)
		(connected loc28 loc64)
		(connected loc64 loc39)
		(connected loc39 loc64)
		(connected loc64 loc43)
		(connected loc43 loc64)
		(connected loc64 loc62)
		(connected loc62 loc64)
		(connected loc64 loc67)
		(connected loc67 loc64)
		(connected loc64 loc70)
		(connected loc70 loc64)
		(connected loc64 loc72)
		(connected loc72 loc64)
		(connected loc65 loc12)
		(connected loc12 loc65)
		(connected loc65 loc29)
		(connected loc29 loc65)
		(connected loc65 loc60)
		(connected loc60 loc65)
		(connected loc65 loc64)
		(connected loc64 loc65)
		(connected loc65 loc78)
		(connected loc78 loc65)
		(connected loc65 loc79)
		(connected loc79 loc65)
		(connected loc65 loc82)
		(connected loc82 loc65)
		(connected loc66 loc9)
		(connected loc9 loc66)
		(connected loc66 loc32)
		(connected loc32 loc66)
		(connected loc66 loc48)
		(connected loc48 loc66)
		(connected loc66 loc51)
		(connected loc51 loc66)
		(connected loc66 loc58)
		(connected loc58 loc66)
		(connected loc66 loc61)
		(connected loc61 loc66)
		(connected loc66 loc65)
		(connected loc65 loc66)
		(connected loc66 loc71)
		(connected loc71 loc66)
		(connected loc66 loc78)
		(connected loc78 loc66)
		(connected loc67 loc1)
		(connected loc1 loc67)
		(connected loc67 loc25)
		(connected loc25 loc67)
		(connected loc67 loc40)
		(connected loc40 loc67)
		(connected loc67 loc43)
		(connected loc43 loc67)
		(connected loc67 loc55)
		(connected loc55 loc67)
		(connected loc67 loc56)
		(connected loc56 loc67)
		(connected loc67 loc57)
		(connected loc57 loc67)
		(connected loc67 loc65)
		(connected loc65 loc67)
		(connected loc67 loc69)
		(connected loc69 loc67)
		(connected loc67 loc70)
		(connected loc70 loc67)
		(connected loc67 loc73)
		(connected loc73 loc67)
		(connected loc67 loc83)
		(connected loc83 loc67)
		(connected loc68 loc20)
		(connected loc20 loc68)
		(connected loc68 loc41)
		(connected loc41 loc68)
		(connected loc68 loc58)
		(connected loc58 loc68)
		(connected loc68 loc83)
		(connected loc83 loc68)
		(connected loc69 loc45)
		(connected loc45 loc69)
		(connected loc69 loc54)
		(connected loc54 loc69)
		(connected loc69 loc56)
		(connected loc56 loc69)
		(connected loc69 loc70)
		(connected loc70 loc69)
		(connected loc69 loc74)
		(connected loc74 loc69)
		(connected loc69 loc78)
		(connected loc78 loc69)
		(connected loc70 loc23)
		(connected loc23 loc70)
		(connected loc70 loc45)
		(connected loc45 loc70)
		(connected loc70 loc78)
		(connected loc78 loc70)
		(connected loc71 loc18)
		(connected loc18 loc71)
		(connected loc71 loc35)
		(connected loc35 loc71)
		(connected loc71 loc37)
		(connected loc37 loc71)
		(connected loc71 loc39)
		(connected loc39 loc71)
		(connected loc71 loc43)
		(connected loc43 loc71)
		(connected loc71 loc46)
		(connected loc46 loc71)
		(connected loc71 loc82)
		(connected loc82 loc71)
		(connected loc72 loc13)
		(connected loc13 loc72)
		(connected loc72 loc14)
		(connected loc14 loc72)
		(connected loc72 loc36)
		(connected loc36 loc72)
		(connected loc72 loc42)
		(connected loc42 loc72)
		(connected loc72 loc46)
		(connected loc46 loc72)
		(connected loc72 loc49)
		(connected loc49 loc72)
		(connected loc72 loc53)
		(connected loc53 loc72)
		(connected loc72 loc66)
		(connected loc66 loc72)
		(connected loc72 loc67)
		(connected loc67 loc72)
		(connected loc72 loc68)
		(connected loc68 loc72)
		(connected loc72 loc75)
		(connected loc75 loc72)
		(connected loc72 loc76)
		(connected loc76 loc72)
		(connected loc72 loc78)
		(connected loc78 loc72)
		(connected loc72 loc85)
		(connected loc85 loc72)
		(connected loc73 loc27)
		(connected loc27 loc73)
		(connected loc73 loc46)
		(connected loc46 loc73)
		(connected loc73 loc58)
		(connected loc58 loc73)
		(connected loc73 loc59)
		(connected loc59 loc73)
		(connected loc73 loc68)
		(connected loc68 loc73)
		(connected loc73 loc69)
		(connected loc69 loc73)
		(connected loc73 loc81)
		(connected loc81 loc73)
		(connected loc74 loc5)
		(connected loc5 loc74)
		(connected loc74 loc28)
		(connected loc28 loc74)
		(connected loc74 loc86)
		(connected loc86 loc74)
		(connected loc75 loc60)
		(connected loc60 loc75)
		(connected loc75 loc77)
		(connected loc77 loc75)
		(connected loc75 loc81)
		(connected loc81 loc75)
		(connected loc75 loc85)
		(connected loc85 loc75)
		(connected loc76 loc60)
		(connected loc60 loc76)
		(connected loc76 loc68)
		(connected loc68 loc76)
		(connected loc76 loc72)
		(connected loc72 loc76)
		(connected loc76 loc79)
		(connected loc79 loc76)
		(connected loc77 loc12)
		(connected loc12 loc77)
		(connected loc77 loc29)
		(connected loc29 loc77)
		(connected loc77 loc43)
		(connected loc43 loc77)
		(connected loc77 loc63)
		(connected loc63 loc77)
		(connected loc77 loc78)
		(connected loc78 loc77)
		(connected loc77 loc86)
		(connected loc86 loc77)
		(connected loc78 loc51)
		(connected loc51 loc78)
		(connected loc78 loc57)
		(connected loc57 loc78)
		(connected loc79 loc41)
		(connected loc41 loc79)
		(connected loc79 loc45)
		(connected loc45 loc79)
		(connected loc79 loc64)
		(connected loc64 loc79)
		(connected loc79 loc69)
		(connected loc69 loc79)
		(connected loc79 loc81)
		(connected loc81 loc79)
		(connected loc80 loc46)
		(connected loc46 loc80)
		(connected loc80 loc58)
		(connected loc58 loc80)
		(connected loc80 loc65)
		(connected loc65 loc80)
		(connected loc80 loc73)
		(connected loc73 loc80)
		(connected loc80 loc77)
		(connected loc77 loc80)
		(connected loc81 loc24)
		(connected loc24 loc81)
		(connected loc81 loc44)
		(connected loc44 loc81)
		(connected loc81 loc66)
		(connected loc66 loc81)
		(connected loc82 loc30)
		(connected loc30 loc82)
		(connected loc82 loc71)
		(connected loc71 loc82)
		(connected loc82 loc78)
		(connected loc78 loc82)
		(connected loc82 loc85)
		(connected loc85 loc82)
		(connected loc83 loc36)
		(connected loc36 loc83)
		(connected loc83 loc48)
		(connected loc48 loc83)
		(connected loc83 loc54)
		(connected loc54 loc83)
		(connected loc83 loc57)
		(connected loc57 loc83)
		(connected loc83 loc79)
		(connected loc79 loc83)
		(connected loc84 loc25)
		(connected loc25 loc84)
		(connected loc84 loc53)
		(connected loc53 loc84)
		(connected loc84 loc56)
		(connected loc56 loc84)
		(connected loc84 loc65)
		(connected loc65 loc84)
		(connected loc85 loc16)
		(connected loc16 loc85)
		(connected loc85 loc35)
		(connected loc35 loc85)
		(connected loc85 loc38)
		(connected loc38 loc85)
		(connected loc85 loc49)
		(connected loc49 loc85)
		(connected loc85 loc55)
		(connected loc55 loc85)
		(connected loc85 loc69)
		(connected loc69 loc85)
		(connected loc85 loc79)
		(connected loc79 loc85)
		(connected loc86 loc31)
		(connected loc31 loc86)
		(connected loc86 loc68)
		(connected loc68 loc86)
		(connected loc86 loc76)
		(connected loc76 loc86)

		(in bar4 loc4)
		(in bar6 loc6)
		(in bar8 loc8)
		(in bar9 loc9)
		(in bar11 loc11)
		(in bar16 loc16)
		(in bar18 loc18)
		(in bar23 loc23)
		(in bar25 loc25)
		(in bar33 loc33)
		(in bar34 loc34)
		(in bar36 loc36)
		(in bar38 loc38)
		(in bar39 loc39)
		(in bar42 loc42)
		(in bar50 loc50)
		(in bar52 loc52)
		(in bar55 loc55)
		(in bar59 loc59)
		(in bar63 loc63)
		(in bar65 loc65)
		(in bar68 loc68)
		(in bar71 loc71)
		(in bar75 loc75)
		(in bar76 loc76)
		(in bar78 loc78)
		(in bar79 loc79)
		(in bar80 loc80)
		(in bar84 loc84)
		(in bar85 loc85)

	)

	(:goal
		(and
			(at loc86)
		)
	)
)