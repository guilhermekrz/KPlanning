; Generated by ProblemGenerator - Problem 70 at Sat Nov 26 18:02:21 BRST 2016
(define (problem pb70)
	(:domain drinkanddrive-constraints-generated)
	(:requirements :strips :typing :negative-preconditions)
	(:objects
		loc1 loc2 loc3 loc4 loc5 loc6 loc7 loc8 loc9 loc10 loc11 loc12 loc13 loc14 loc15 loc16 loc17 loc18 loc19 loc20 loc21 loc22 loc23 loc24 loc25 loc26 loc27 loc28 loc29 loc30 loc31 loc32 loc33 loc34 loc35 loc36 loc37 loc38 loc39 loc40 loc41 loc42 loc43 loc44 loc45 loc46 loc47 loc48 loc49 loc50 loc51 loc52 loc53 loc54 loc55 loc56 loc57 loc58 loc59 loc60 loc61 loc62 loc63 loc64 loc65 loc66 loc67 loc68 loc69 loc70 loc71 loc72 loc73 loc74 loc75 - location
		bar4 bar10 bar11 bar13 bar14 bar15 bar20 bar22 bar23 bar24 bar27 bar30 bar31 bar32 bar33 bar34 bar35 bar37 bar44 bar52 bar57 bar58 bar59 bar61 bar64 bar65 bar66 bar67 bar68 bar70 bar74 - bar
	)
	(:init
		(at loc1)

		(connected loc41 loc7)
		(connected loc7 loc41)
		(connected loc7 loc70)
		(connected loc70 loc7)
		(connected loc70 loc14)
		(connected loc14 loc70)
		(connected loc14 loc71)
		(connected loc71 loc14)
		(connected loc71 loc51)
		(connected loc51 loc71)
		(connected loc51 loc55)
		(connected loc55 loc51)
		(connected loc55 loc31)
		(connected loc31 loc55)
		(connected loc31 loc68)
		(connected loc68 loc31)
		(connected loc68 loc16)
		(connected loc16 loc68)
		(connected loc16 loc3)
		(connected loc3 loc16)
		(connected loc3 loc48)
		(connected loc48 loc3)
		(connected loc51 loc46)
		(connected loc46 loc51)
		(connected loc46 loc24)
		(connected loc24 loc46)
		(connected loc24 loc13)
		(connected loc13 loc24)
		(connected loc13 loc22)
		(connected loc22 loc13)
		(connected loc22 loc11)
		(connected loc11 loc22)
		(connected loc11 loc25)
		(connected loc25 loc11)
		(connected loc14 loc36)
		(connected loc36 loc14)
		(connected loc36 loc72)
		(connected loc72 loc36)
		(connected loc72 loc59)
		(connected loc59 loc72)
		(connected loc3 loc2)
		(connected loc2 loc3)
		(connected loc2 loc63)
		(connected loc63 loc2)
		(connected loc63 loc40)
		(connected loc40 loc63)
		(connected loc40 loc49)
		(connected loc49 loc40)
		(connected loc2 loc26)
		(connected loc26 loc2)
		(connected loc26 loc35)
		(connected loc35 loc26)
		(connected loc26 loc12)
		(connected loc12 loc26)
		(connected loc12 loc6)
		(connected loc6 loc12)
		(connected loc48 loc32)
		(connected loc32 loc48)
		(connected loc32 loc39)
		(connected loc39 loc32)
		(connected loc6 loc23)
		(connected loc23 loc6)
		(connected loc51 loc15)
		(connected loc15 loc51)
		(connected loc15 loc60)
		(connected loc60 loc15)
		(connected loc60 loc54)
		(connected loc54 loc60)
		(connected loc36 loc62)
		(connected loc62 loc36)
		(connected loc62 loc64)
		(connected loc64 loc62)
		(connected loc63 loc69)
		(connected loc69 loc63)
		(connected loc16 loc61)
		(connected loc61 loc16)
		(connected loc61 loc33)
		(connected loc33 loc61)
		(connected loc62 loc29)
		(connected loc29 loc62)
		(connected loc29 loc4)
		(connected loc4 loc29)
		(connected loc6 loc52)
		(connected loc52 loc6)
		(connected loc52 loc30)
		(connected loc30 loc52)
		(connected loc63 loc45)
		(connected loc45 loc63)
		(connected loc46 loc53)
		(connected loc53 loc46)
		(connected loc63 loc75)
		(connected loc75 loc63)
		(connected loc36 loc21)
		(connected loc21 loc36)
		(connected loc23 loc47)
		(connected loc47 loc23)
		(connected loc4 loc37)
		(connected loc37 loc4)
		(connected loc62 loc19)
		(connected loc19 loc62)
		(connected loc46 loc67)
		(connected loc67 loc46)
		(connected loc16 loc28)
		(connected loc28 loc16)
		(connected loc61 loc66)
		(connected loc66 loc61)
		(connected loc36 loc57)
		(connected loc57 loc36)
		(connected loc46 loc73)
		(connected loc73 loc46)
		(connected loc73 loc34)
		(connected loc34 loc73)
		(connected loc47 loc10)
		(connected loc10 loc47)
		(connected loc53 loc42)
		(connected loc42 loc53)
		(connected loc60 loc74)
		(connected loc74 loc60)
		(connected loc74 loc44)
		(connected loc44 loc74)
		(connected loc37 loc9)
		(connected loc9 loc37)
		(connected loc31 loc56)
		(connected loc56 loc31)
		(connected loc33 loc38)
		(connected loc38 loc33)
		(connected loc38 loc5)
		(connected loc5 loc38)
		(connected loc5 loc27)
		(connected loc27 loc5)
		(connected loc62 loc50)
		(connected loc50 loc62)
		(connected loc52 loc17)
		(connected loc17 loc52)
		(connected loc42 loc18)
		(connected loc18 loc42)
		(connected loc75 loc8)
		(connected loc8 loc75)
		(connected loc57 loc65)
		(connected loc65 loc57)
		(connected loc30 loc20)
		(connected loc20 loc30)
		(connected loc33 loc43)
		(connected loc43 loc33)
		(connected loc73 loc58)
		(connected loc58 loc73)
		(connected loc53 loc1)
		(connected loc1 loc53)
		(connected loc1 loc5)
		(connected loc5 loc1)
		(connected loc1 loc16)
		(connected loc16 loc1)
		(connected loc1 loc38)
		(connected loc38 loc1)
		(connected loc2 loc3)
		(connected loc3 loc2)
		(connected loc2 loc11)
		(connected loc11 loc2)
		(connected loc2 loc14)
		(connected loc14 loc2)
		(connected loc2 loc35)
		(connected loc35 loc2)
		(connected loc2 loc36)
		(connected loc36 loc2)
		(connected loc2 loc40)
		(connected loc40 loc2)
		(connected loc3 loc6)
		(connected loc6 loc3)
		(connected loc3 loc8)
		(connected loc8 loc3)
		(connected loc3 loc19)
		(connected loc19 loc3)
		(connected loc3 loc31)
		(connected loc31 loc3)
		(connected loc3 loc47)
		(connected loc47 loc3)
		(connected loc3 loc68)
		(connected loc68 loc3)
		(connected loc4 loc8)
		(connected loc8 loc4)
		(connected loc5 loc9)
		(connected loc9 loc5)
		(connected loc5 loc16)
		(connected loc16 loc5)
		(connected loc6 loc25)
		(connected loc25 loc6)
		(connected loc6 loc27)
		(connected loc27 loc6)
		(connected loc7 loc3)
		(connected loc3 loc7)
		(connected loc7 loc16)
		(connected loc16 loc7)
		(connected loc7 loc57)
		(connected loc57 loc7)
		(connected loc7 loc59)
		(connected loc59 loc7)
		(connected loc8 loc11)
		(connected loc11 loc8)
		(connected loc8 loc24)
		(connected loc24 loc8)
		(connected loc8 loc47)
		(connected loc47 loc8)
		(connected loc8 loc60)
		(connected loc60 loc8)
		(connected loc8 loc65)
		(connected loc65 loc8)
		(connected loc9 loc5)
		(connected loc5 loc9)
		(connected loc9 loc8)
		(connected loc8 loc9)
		(connected loc9 loc14)
		(connected loc14 loc9)
		(connected loc9 loc26)
		(connected loc26 loc9)
		(connected loc9 loc35)
		(connected loc35 loc9)
		(connected loc9 loc50)
		(connected loc50 loc9)
		(connected loc10 loc12)
		(connected loc12 loc10)
		(connected loc10 loc28)
		(connected loc28 loc10)
		(connected loc11 loc2)
		(connected loc2 loc11)
		(connected loc11 loc48)
		(connected loc48 loc11)
		(connected loc11 loc49)
		(connected loc49 loc11)
		(connected loc12 loc4)
		(connected loc4 loc12)
		(connected loc12 loc19)
		(connected loc19 loc12)
		(connected loc13 loc1)
		(connected loc1 loc13)
		(connected loc13 loc8)
		(connected loc8 loc13)
		(connected loc13 loc17)
		(connected loc17 loc13)
		(connected loc13 loc32)
		(connected loc32 loc13)
		(connected loc13 loc59)
		(connected loc59 loc13)
		(connected loc13 loc64)
		(connected loc64 loc13)
		(connected loc14 loc4)
		(connected loc4 loc14)
		(connected loc14 loc5)
		(connected loc5 loc14)
		(connected loc14 loc21)
		(connected loc21 loc14)
		(connected loc14 loc60)
		(connected loc60 loc14)
		(connected loc15 loc8)
		(connected loc8 loc15)
		(connected loc15 loc9)
		(connected loc9 loc15)
		(connected loc15 loc26)
		(connected loc26 loc15)
		(connected loc16 loc6)
		(connected loc6 loc16)
		(connected loc16 loc9)
		(connected loc9 loc16)
		(connected loc16 loc11)
		(connected loc11 loc16)
		(connected loc16 loc14)
		(connected loc14 loc16)
		(connected loc16 loc50)
		(connected loc50 loc16)
		(connected loc16 loc55)
		(connected loc55 loc16)
		(connected loc16 loc62)
		(connected loc62 loc16)
		(connected loc17 loc26)
		(connected loc26 loc17)
		(connected loc17 loc35)
		(connected loc35 loc17)
		(connected loc17 loc37)
		(connected loc37 loc17)
		(connected loc17 loc43)
		(connected loc43 loc17)
		(connected loc17 loc63)
		(connected loc63 loc17)
		(connected loc18 loc10)
		(connected loc10 loc18)
		(connected loc18 loc16)
		(connected loc16 loc18)
		(connected loc18 loc24)
		(connected loc24 loc18)
		(connected loc18 loc26)
		(connected loc26 loc18)
		(connected loc18 loc28)
		(connected loc28 loc18)
		(connected loc19 loc20)
		(connected loc20 loc19)
		(connected loc19 loc39)
		(connected loc39 loc19)
		(connected loc19 loc56)
		(connected loc56 loc19)
		(connected loc20 loc3)
		(connected loc3 loc20)
		(connected loc20 loc35)
		(connected loc35 loc20)
		(connected loc20 loc50)
		(connected loc50 loc20)
		(connected loc21 loc2)
		(connected loc2 loc21)
		(connected loc21 loc4)
		(connected loc4 loc21)
		(connected loc21 loc6)
		(connected loc6 loc21)
		(connected loc21 loc20)
		(connected loc20 loc21)
		(connected loc21 loc27)
		(connected loc27 loc21)
		(connected loc21 loc28)
		(connected loc28 loc21)
		(connected loc21 loc44)
		(connected loc44 loc21)
		(connected loc22 loc31)
		(connected loc31 loc22)
		(connected loc22 loc42)
		(connected loc42 loc22)
		(connected loc23 loc9)
		(connected loc9 loc23)
		(connected loc23 loc15)
		(connected loc15 loc23)
		(connected loc23 loc24)
		(connected loc24 loc23)
		(connected loc23 loc28)
		(connected loc28 loc23)
		(connected loc23 loc30)
		(connected loc30 loc23)
		(connected loc23 loc35)
		(connected loc35 loc23)
		(connected loc23 loc66)
		(connected loc66 loc23)
		(connected loc23 loc74)
		(connected loc74 loc23)
		(connected loc24 loc5)
		(connected loc5 loc24)
		(connected loc24 loc6)
		(connected loc6 loc24)
		(connected loc24 loc41)
		(connected loc41 loc24)
		(connected loc24 loc47)
		(connected loc47 loc24)
		(connected loc24 loc67)
		(connected loc67 loc24)
		(connected loc25 loc14)
		(connected loc14 loc25)
		(connected loc25 loc24)
		(connected loc24 loc25)
		(connected loc26 loc6)
		(connected loc6 loc26)
		(connected loc26 loc11)
		(connected loc11 loc26)
		(connected loc26 loc41)
		(connected loc41 loc26)
		(connected loc26 loc56)
		(connected loc56 loc26)
		(connected loc27 loc8)
		(connected loc8 loc27)
		(connected loc27 loc12)
		(connected loc12 loc27)
		(connected loc27 loc21)
		(connected loc21 loc27)
		(connected loc27 loc50)
		(connected loc50 loc27)
		(connected loc27 loc67)
		(connected loc67 loc27)
		(connected loc28 loc9)
		(connected loc9 loc28)
		(connected loc28 loc29)
		(connected loc29 loc28)
		(connected loc28 loc47)
		(connected loc47 loc28)
		(connected loc28 loc53)
		(connected loc53 loc28)
		(connected loc28 loc75)
		(connected loc75 loc28)
		(connected loc29 loc6)
		(connected loc6 loc29)
		(connected loc29 loc16)
		(connected loc16 loc29)
		(connected loc29 loc23)
		(connected loc23 loc29)
		(connected loc29 loc35)
		(connected loc35 loc29)
		(connected loc29 loc44)
		(connected loc44 loc29)
		(connected loc29 loc67)
		(connected loc67 loc29)
		(connected loc30 loc7)
		(connected loc7 loc30)
		(connected loc30 loc9)
		(connected loc9 loc30)
		(connected loc30 loc12)
		(connected loc12 loc30)
		(connected loc30 loc21)
		(connected loc21 loc30)
		(connected loc30 loc23)
		(connected loc23 loc30)
		(connected loc30 loc26)
		(connected loc26 loc30)
		(connected loc30 loc40)
		(connected loc40 loc30)
		(connected loc30 loc50)
		(connected loc50 loc30)
		(connected loc30 loc51)
		(connected loc51 loc30)
		(connected loc30 loc54)
		(connected loc54 loc30)
		(connected loc30 loc60)
		(connected loc60 loc30)
		(connected loc31 loc9)
		(connected loc9 loc31)
		(connected loc31 loc19)
		(connected loc19 loc31)
		(connected loc31 loc27)
		(connected loc27 loc31)
		(connected loc31 loc28)
		(connected loc28 loc31)
		(connected loc31 loc38)
		(connected loc38 loc31)
		(connected loc31 loc50)
		(connected loc50 loc31)
		(connected loc31 loc51)
		(connected loc51 loc31)
		(connected loc31 loc54)
		(connected loc54 loc31)
		(connected loc32 loc12)
		(connected loc12 loc32)
		(connected loc32 loc16)
		(connected loc16 loc32)
		(connected loc32 loc49)
		(connected loc49 loc32)
		(connected loc32 loc50)
		(connected loc50 loc32)
		(connected loc32 loc58)
		(connected loc58 loc32)
		(connected loc32 loc70)
		(connected loc70 loc32)
		(connected loc32 loc71)
		(connected loc71 loc32)
		(connected loc32 loc72)
		(connected loc72 loc32)
		(connected loc33 loc7)
		(connected loc7 loc33)
		(connected loc33 loc28)
		(connected loc28 loc33)
		(connected loc33 loc34)
		(connected loc34 loc33)
		(connected loc33 loc62)
		(connected loc62 loc33)
		(connected loc34 loc6)
		(connected loc6 loc34)
		(connected loc34 loc26)
		(connected loc26 loc34)
		(connected loc34 loc29)
		(connected loc29 loc34)
		(connected loc34 loc35)
		(connected loc35 loc34)
		(connected loc34 loc38)
		(connected loc38 loc34)
		(connected loc34 loc45)
		(connected loc45 loc34)
		(connected loc34 loc60)
		(connected loc60 loc34)
		(connected loc34 loc61)
		(connected loc61 loc34)
		(connected loc34 loc74)
		(connected loc74 loc34)
		(connected loc35 loc12)
		(connected loc12 loc35)
		(connected loc35 loc30)
		(connected loc30 loc35)
		(connected loc35 loc34)
		(connected loc34 loc35)
		(connected loc35 loc42)
		(connected loc42 loc35)
		(connected loc35 loc51)
		(connected loc51 loc35)
		(connected loc35 loc65)
		(connected loc65 loc35)
		(connected loc36 loc3)
		(connected loc3 loc36)
		(connected loc37 loc5)
		(connected loc5 loc37)
		(connected loc37 loc20)
		(connected loc20 loc37)
		(connected loc37 loc47)
		(connected loc47 loc37)
		(connected loc37 loc50)
		(connected loc50 loc37)
		(connected loc38 loc14)
		(connected loc14 loc38)
		(connected loc38 loc15)
		(connected loc15 loc38)
		(connected loc38 loc17)
		(connected loc17 loc38)
		(connected loc38 loc27)
		(connected loc27 loc38)
		(connected loc38 loc33)
		(connected loc33 loc38)
		(connected loc38 loc44)
		(connected loc44 loc38)
		(connected loc38 loc49)
		(connected loc49 loc38)
		(connected loc38 loc71)
		(connected loc71 loc38)
		(connected loc39 loc37)
		(connected loc37 loc39)
		(connected loc39 loc38)
		(connected loc38 loc39)
		(connected loc39 loc42)
		(connected loc42 loc39)
		(connected loc39 loc49)
		(connected loc49 loc39)
		(connected loc39 loc62)
		(connected loc62 loc39)
		(connected loc39 loc73)
		(connected loc73 loc39)
		(connected loc40 loc27)
		(connected loc27 loc40)
		(connected loc40 loc38)
		(connected loc38 loc40)
		(connected loc40 loc44)
		(connected loc44 loc40)
		(connected loc40 loc51)
		(connected loc51 loc40)
		(connected loc40 loc60)
		(connected loc60 loc40)
		(connected loc40 loc63)
		(connected loc63 loc40)
		(connected loc41 loc4)
		(connected loc4 loc41)
		(connected loc41 loc29)
		(connected loc29 loc41)
		(connected loc41 loc40)
		(connected loc40 loc41)
		(connected loc42 loc30)
		(connected loc30 loc42)
		(connected loc42 loc50)
		(connected loc50 loc42)
		(connected loc42 loc55)
		(connected loc55 loc42)
		(connected loc42 loc74)
		(connected loc74 loc42)
		(connected loc43 loc15)
		(connected loc15 loc43)
		(connected loc43 loc41)
		(connected loc41 loc43)
		(connected loc43 loc53)
		(connected loc53 loc43)
		(connected loc43 loc68)
		(connected loc68 loc43)
		(connected loc43 loc75)
		(connected loc75 loc43)
		(connected loc44 loc5)
		(connected loc5 loc44)
		(connected loc44 loc32)
		(connected loc32 loc44)
		(connected loc44 loc35)
		(connected loc35 loc44)
		(connected loc44 loc41)
		(connected loc41 loc44)
		(connected loc44 loc50)
		(connected loc50 loc44)
		(connected loc44 loc70)
		(connected loc70 loc44)
		(connected loc44 loc74)
		(connected loc74 loc44)
		(connected loc45 loc26)
		(connected loc26 loc45)
		(connected loc45 loc33)
		(connected loc33 loc45)
		(connected loc45 loc39)
		(connected loc39 loc45)
		(connected loc45 loc42)
		(connected loc42 loc45)
		(connected loc45 loc49)
		(connected loc49 loc45)
		(connected loc46 loc28)
		(connected loc28 loc46)
		(connected loc46 loc39)
		(connected loc39 loc46)
		(connected loc46 loc43)
		(connected loc43 loc46)
		(connected loc46 loc47)
		(connected loc47 loc46)
		(connected loc46 loc70)
		(connected loc70 loc46)
		(connected loc47 loc7)
		(connected loc7 loc47)
		(connected loc47 loc39)
		(connected loc39 loc47)
		(connected loc47 loc49)
		(connected loc49 loc47)
		(connected loc48 loc6)
		(connected loc6 loc48)
		(connected loc48 loc37)
		(connected loc37 loc48)
		(connected loc48 loc47)
		(connected loc47 loc48)
		(connected loc49 loc3)
		(connected loc3 loc49)
		(connected loc49 loc29)
		(connected loc29 loc49)
		(connected loc49 loc31)
		(connected loc31 loc49)
		(connected loc49 loc40)
		(connected loc40 loc49)
		(connected loc49 loc42)
		(connected loc42 loc49)
		(connected loc49 loc53)
		(connected loc53 loc49)
		(connected loc49 loc61)
		(connected loc61 loc49)
		(connected loc50 loc45)
		(connected loc45 loc50)
		(connected loc50 loc47)
		(connected loc47 loc50)
		(connected loc50 loc48)
		(connected loc48 loc50)
		(connected loc50 loc52)
		(connected loc52 loc50)
		(connected loc50 loc74)
		(connected loc74 loc50)
		(connected loc51 loc25)
		(connected loc25 loc51)
		(connected loc51 loc39)
		(connected loc39 loc51)
		(connected loc51 loc45)
		(connected loc45 loc51)
		(connected loc51 loc71)
		(connected loc71 loc51)
		(connected loc52 loc37)
		(connected loc37 loc52)
		(connected loc53 loc47)
		(connected loc47 loc53)
		(connected loc53 loc55)
		(connected loc55 loc53)
		(connected loc53 loc59)
		(connected loc59 loc53)
		(connected loc54 loc9)
		(connected loc9 loc54)
		(connected loc54 loc18)
		(connected loc18 loc54)
		(connected loc54 loc31)
		(connected loc31 loc54)
		(connected loc54 loc50)
		(connected loc50 loc54)
		(connected loc54 loc66)
		(connected loc66 loc54)
		(connected loc54 loc73)
		(connected loc73 loc54)
		(connected loc55 loc2)
		(connected loc2 loc55)
		(connected loc55 loc16)
		(connected loc16 loc55)
		(connected loc55 loc20)
		(connected loc20 loc55)
		(connected loc55 loc33)
		(connected loc33 loc55)
		(connected loc55 loc43)
		(connected loc43 loc55)
		(connected loc55 loc73)
		(connected loc73 loc55)
		(connected loc55 loc75)
		(connected loc75 loc55)
		(connected loc56 loc25)
		(connected loc25 loc56)
		(connected loc56 loc43)
		(connected loc43 loc56)
		(connected loc56 loc53)
		(connected loc53 loc56)
		(connected loc56 loc72)
		(connected loc72 loc56)
		(connected loc56 loc74)
		(connected loc74 loc56)
		(connected loc57 loc15)
		(connected loc15 loc57)
		(connected loc57 loc24)
		(connected loc24 loc57)
		(connected loc57 loc68)
		(connected loc68 loc57)
		(connected loc57 loc69)
		(connected loc69 loc57)
		(connected loc58 loc49)
		(connected loc49 loc58)
		(connected loc58 loc61)
		(connected loc61 loc58)
		(connected loc58 loc72)
		(connected loc72 loc58)
		(connected loc59 loc21)
		(connected loc21 loc59)
		(connected loc59 loc22)
		(connected loc22 loc59)
		(connected loc59 loc34)
		(connected loc34 loc59)
		(connected loc59 loc48)
		(connected loc48 loc59)
		(connected loc59 loc50)
		(connected loc50 loc59)
		(connected loc59 loc56)
		(connected loc56 loc59)
		(connected loc59 loc57)
		(connected loc57 loc59)
		(connected loc59 loc70)
		(connected loc70 loc59)
		(connected loc60 loc34)
		(connected loc34 loc60)
		(connected loc60 loc39)
		(connected loc39 loc60)
		(connected loc61 loc15)
		(connected loc15 loc61)
		(connected loc61 loc24)
		(connected loc24 loc61)
		(connected loc61 loc29)
		(connected loc29 loc61)
		(connected loc61 loc38)
		(connected loc38 loc61)
		(connected loc61 loc44)
		(connected loc44 loc61)
		(connected loc62 loc1)
		(connected loc1 loc62)
		(connected loc62 loc40)
		(connected loc40 loc62)
		(connected loc63 loc46)
		(connected loc46 loc63)
		(connected loc63 loc52)
		(connected loc52 loc63)
		(connected loc63 loc56)
		(connected loc56 loc63)
		(connected loc63 loc62)
		(connected loc62 loc63)
		(connected loc63 loc66)
		(connected loc66 loc63)
		(connected loc63 loc68)
		(connected loc68 loc63)
		(connected loc64 loc17)
		(connected loc17 loc64)
		(connected loc64 loc52)
		(connected loc52 loc64)
		(connected loc64 loc69)
		(connected loc69 loc64)
		(connected loc65 loc37)
		(connected loc37 loc65)
		(connected loc65 loc73)
		(connected loc73 loc65)
		(connected loc66 loc24)
		(connected loc24 loc66)
		(connected loc66 loc68)
		(connected loc68 loc66)
		(connected loc67 loc20)
		(connected loc20 loc67)
		(connected loc67 loc34)
		(connected loc34 loc67)
		(connected loc67 loc35)
		(connected loc35 loc67)
		(connected loc67 loc45)
		(connected loc45 loc67)
		(connected loc67 loc47)
		(connected loc47 loc67)
		(connected loc67 loc53)
		(connected loc53 loc67)
		(connected loc68 loc14)
		(connected loc14 loc68)
		(connected loc68 loc38)
		(connected loc38 loc68)
		(connected loc68 loc48)
		(connected loc48 loc68)
		(connected loc68 loc59)
		(connected loc59 loc68)
		(connected loc69 loc5)
		(connected loc5 loc69)
		(connected loc69 loc31)
		(connected loc31 loc69)
		(connected loc69 loc36)
		(connected loc36 loc69)
		(connected loc69 loc72)
		(connected loc72 loc69)
		(connected loc69 loc75)
		(connected loc75 loc69)
		(connected loc70 loc9)
		(connected loc9 loc70)
		(connected loc70 loc32)
		(connected loc32 loc70)
		(connected loc70 loc35)
		(connected loc35 loc70)
		(connected loc70 loc50)
		(connected loc50 loc70)
		(connected loc70 loc55)
		(connected loc55 loc70)
		(connected loc70 loc68)
		(connected loc68 loc70)
		(connected loc70 loc71)
		(connected loc71 loc70)
		(connected loc70 loc73)
		(connected loc73 loc70)
		(connected loc71 loc36)
		(connected loc36 loc71)
		(connected loc71 loc47)
		(connected loc47 loc71)
		(connected loc71 loc54)
		(connected loc54 loc71)
		(connected loc71 loc55)
		(connected loc55 loc71)
		(connected loc71 loc75)
		(connected loc75 loc71)
		(connected loc72 loc52)
		(connected loc52 loc72)
		(connected loc72 loc70)
		(connected loc70 loc72)
		(connected loc72 loc75)
		(connected loc75 loc72)
		(connected loc74 loc14)
		(connected loc14 loc74)
		(connected loc74 loc36)
		(connected loc36 loc74)
		(connected loc74 loc48)
		(connected loc48 loc74)
		(connected loc74 loc73)
		(connected loc73 loc74)
		(connected loc75 loc43)
		(connected loc43 loc75)
		(connected loc75 loc44)
		(connected loc44 loc75)
		(connected loc75 loc61)
		(connected loc61 loc75)
		(connected loc75 loc73)
		(connected loc73 loc75)

		(in bar4 loc4)
		(in bar10 loc10)
		(in bar11 loc11)
		(in bar13 loc13)
		(in bar14 loc14)
		(in bar15 loc15)
		(in bar20 loc20)
		(in bar22 loc22)
		(in bar23 loc23)
		(in bar24 loc24)
		(in bar27 loc27)
		(in bar30 loc30)
		(in bar31 loc31)
		(in bar32 loc32)
		(in bar33 loc33)
		(in bar34 loc34)
		(in bar35 loc35)
		(in bar37 loc37)
		(in bar44 loc44)
		(in bar52 loc52)
		(in bar57 loc57)
		(in bar58 loc58)
		(in bar59 loc59)
		(in bar61 loc61)
		(in bar64 loc64)
		(in bar65 loc65)
		(in bar66 loc66)
		(in bar67 loc67)
		(in bar68 loc68)
		(in bar70 loc70)
		(in bar74 loc74)

	)

	(:goal
		(and
			(at loc75)
		)
	)
	(:constraints
		(and
			(preference a1 (sometime (drunk)))
		)
	)
)