; Generated by ProblemGenerator - Problem 25 at Mon Nov 28 15:07:21 BRST 2016
(define (problem pb25)
	(:domain drinkanddrive-generated)
	(:requirements :strips :typing :negative-preconditions)
	(:objects
		loc1 loc2 loc3 loc4 loc5 loc6 loc7 loc8 loc9 loc10 loc11 loc12 loc13 loc14 loc15 loc16 loc17 loc18 loc19 loc20 loc21 loc22 loc23 loc24 loc25 loc26 loc27 loc28 loc29 loc30 loc31 loc32 loc33 loc34 loc35 loc36 loc37 loc38 loc39 loc40 loc41 loc42 loc43 loc44 loc45 loc46 loc47 loc48 loc49 loc50 loc51 loc52 loc53 loc54 loc55 loc56 loc57 loc58 loc59 loc60 loc61 loc62 loc63 loc64 loc65 loc66 loc67 loc68 loc69 loc70 loc71 loc72 loc73 loc74 loc75 - location
		bar5 bar11 bar15 bar17 bar18 bar21 bar22 bar24 bar25 bar27 bar28 bar29 bar30 bar32 bar33 bar34 bar36 bar38 bar40 bar41 bar47 bar50 bar51 bar52 bar53 bar54 bar59 bar61 bar63 bar64 bar66 bar69 bar70 bar71 - bar
	)
	(:init
		(at loc1)

		(connected loc49 loc48)
		(connected loc48 loc49)
		(connected loc48 loc20)
		(connected loc20 loc48)
		(connected loc20 loc61)
		(connected loc61 loc20)
		(connected loc61 loc22)
		(connected loc22 loc61)
		(connected loc22 loc47)
		(connected loc47 loc22)
		(connected loc47 loc67)
		(connected loc67 loc47)
		(connected loc22 loc62)
		(connected loc62 loc22)
		(connected loc62 loc18)
		(connected loc18 loc62)
		(connected loc18 loc34)
		(connected loc34 loc18)
		(connected loc34 loc4)
		(connected loc4 loc34)
		(connected loc4 loc59)
		(connected loc59 loc4)
		(connected loc20 loc44)
		(connected loc44 loc20)
		(connected loc44 loc29)
		(connected loc29 loc44)
		(connected loc29 loc6)
		(connected loc6 loc29)
		(connected loc6 loc53)
		(connected loc53 loc6)
		(connected loc53 loc51)
		(connected loc51 loc53)
		(connected loc22 loc54)
		(connected loc54 loc22)
		(connected loc54 loc74)
		(connected loc74 loc54)
		(connected loc74 loc71)
		(connected loc71 loc74)
		(connected loc71 loc56)
		(connected loc56 loc71)
		(connected loc54 loc50)
		(connected loc50 loc54)
		(connected loc50 loc45)
		(connected loc45 loc50)
		(connected loc45 loc37)
		(connected loc37 loc45)
		(connected loc37 loc12)
		(connected loc12 loc37)
		(connected loc12 loc10)
		(connected loc10 loc12)
		(connected loc10 loc27)
		(connected loc27 loc10)
		(connected loc34 loc23)
		(connected loc23 loc34)
		(connected loc22 loc15)
		(connected loc15 loc22)
		(connected loc15 loc30)
		(connected loc30 loc15)
		(connected loc61 loc32)
		(connected loc32 loc61)
		(connected loc44 loc64)
		(connected loc64 loc44)
		(connected loc64 loc11)
		(connected loc11 loc64)
		(connected loc11 loc36)
		(connected loc36 loc11)
		(connected loc36 loc52)
		(connected loc52 loc36)
		(connected loc52 loc21)
		(connected loc21 loc52)
		(connected loc21 loc72)
		(connected loc72 loc21)
		(connected loc72 loc65)
		(connected loc65 loc72)
		(connected loc47 loc31)
		(connected loc31 loc47)
		(connected loc4 loc14)
		(connected loc14 loc4)
		(connected loc36 loc41)
		(connected loc41 loc36)
		(connected loc30 loc42)
		(connected loc42 loc30)
		(connected loc50 loc57)
		(connected loc57 loc50)
		(connected loc57 loc24)
		(connected loc24 loc57)
		(connected loc24 loc39)
		(connected loc39 loc24)
		(connected loc54 loc33)
		(connected loc33 loc54)
		(connected loc32 loc55)
		(connected loc55 loc32)
		(connected loc52 loc9)
		(connected loc9 loc52)
		(connected loc33 loc7)
		(connected loc7 loc33)
		(connected loc37 loc5)
		(connected loc5 loc37)
		(connected loc14 loc2)
		(connected loc2 loc14)
		(connected loc5 loc8)
		(connected loc8 loc5)
		(connected loc22 loc17)
		(connected loc17 loc22)
		(connected loc62 loc70)
		(connected loc70 loc62)
		(connected loc50 loc38)
		(connected loc38 loc50)
		(connected loc23 loc3)
		(connected loc3 loc23)
		(connected loc50 loc60)
		(connected loc60 loc50)
		(connected loc9 loc26)
		(connected loc26 loc9)
		(connected loc26 loc69)
		(connected loc69 loc26)
		(connected loc39 loc13)
		(connected loc13 loc39)
		(connected loc31 loc1)
		(connected loc1 loc31)
		(connected loc47 loc66)
		(connected loc66 loc47)
		(connected loc66 loc28)
		(connected loc28 loc66)
		(connected loc14 loc58)
		(connected loc58 loc14)
		(connected loc4 loc19)
		(connected loc19 loc4)
		(connected loc37 loc43)
		(connected loc43 loc37)
		(connected loc10 loc63)
		(connected loc63 loc10)
		(connected loc27 loc46)
		(connected loc46 loc27)
		(connected loc27 loc68)
		(connected loc68 loc27)
		(connected loc5 loc73)
		(connected loc73 loc5)
		(connected loc51 loc75)
		(connected loc75 loc51)
		(connected loc47 loc16)
		(connected loc16 loc47)
		(connected loc18 loc25)
		(connected loc25 loc18)
		(connected loc21 loc40)
		(connected loc40 loc21)
		(connected loc21 loc35)
		(connected loc35 loc21)
		(connected loc1 loc4)
		(connected loc4 loc1)
		(connected loc1 loc9)
		(connected loc9 loc1)
		(connected loc1 loc12)
		(connected loc12 loc1)
		(connected loc1 loc26)
		(connected loc26 loc1)
		(connected loc1 loc72)
		(connected loc72 loc1)
		(connected loc2 loc3)
		(connected loc3 loc2)
		(connected loc2 loc18)
		(connected loc18 loc2)
		(connected loc2 loc34)
		(connected loc34 loc2)
		(connected loc2 loc40)
		(connected loc40 loc2)
		(connected loc3 loc9)
		(connected loc9 loc3)
		(connected loc3 loc15)
		(connected loc15 loc3)
		(connected loc4 loc16)
		(connected loc16 loc4)
		(connected loc4 loc26)
		(connected loc26 loc4)
		(connected loc5 loc15)
		(connected loc15 loc5)
		(connected loc5 loc21)
		(connected loc21 loc5)
		(connected loc5 loc22)
		(connected loc22 loc5)
		(connected loc5 loc31)
		(connected loc31 loc5)
		(connected loc5 loc49)
		(connected loc49 loc5)
		(connected loc6 loc2)
		(connected loc2 loc6)
		(connected loc6 loc5)
		(connected loc5 loc6)
		(connected loc6 loc9)
		(connected loc9 loc6)
		(connected loc6 loc25)
		(connected loc25 loc6)
		(connected loc6 loc26)
		(connected loc26 loc6)
		(connected loc6 loc37)
		(connected loc37 loc6)
		(connected loc6 loc38)
		(connected loc38 loc6)
		(connected loc7 loc4)
		(connected loc4 loc7)
		(connected loc7 loc38)
		(connected loc38 loc7)
		(connected loc7 loc41)
		(connected loc41 loc7)
		(connected loc7 loc60)
		(connected loc60 loc7)
		(connected loc8 loc13)
		(connected loc13 loc8)
		(connected loc8 loc18)
		(connected loc18 loc8)
		(connected loc8 loc20)
		(connected loc20 loc8)
		(connected loc8 loc29)
		(connected loc29 loc8)
		(connected loc8 loc54)
		(connected loc54 loc8)
		(connected loc8 loc62)
		(connected loc62 loc8)
		(connected loc9 loc17)
		(connected loc17 loc9)
		(connected loc9 loc19)
		(connected loc19 loc9)
		(connected loc9 loc32)
		(connected loc32 loc9)
		(connected loc9 loc50)
		(connected loc50 loc9)
		(connected loc10 loc12)
		(connected loc12 loc10)
		(connected loc10 loc55)
		(connected loc55 loc10)
		(connected loc10 loc57)
		(connected loc57 loc10)
		(connected loc11 loc18)
		(connected loc18 loc11)
		(connected loc11 loc58)
		(connected loc58 loc11)
		(connected loc11 loc60)
		(connected loc60 loc11)
		(connected loc11 loc61)
		(connected loc61 loc11)
		(connected loc12 loc4)
		(connected loc4 loc12)
		(connected loc12 loc15)
		(connected loc15 loc12)
		(connected loc12 loc41)
		(connected loc41 loc12)
		(connected loc12 loc52)
		(connected loc52 loc12)
		(connected loc13 loc20)
		(connected loc20 loc13)
		(connected loc14 loc3)
		(connected loc3 loc14)
		(connected loc14 loc5)
		(connected loc5 loc14)
		(connected loc14 loc18)
		(connected loc18 loc14)
		(connected loc14 loc50)
		(connected loc50 loc14)
		(connected loc15 loc6)
		(connected loc6 loc15)
		(connected loc15 loc8)
		(connected loc8 loc15)
		(connected loc15 loc25)
		(connected loc25 loc15)
		(connected loc15 loc51)
		(connected loc51 loc15)
		(connected loc15 loc57)
		(connected loc57 loc15)
		(connected loc15 loc63)
		(connected loc63 loc15)
		(connected loc15 loc65)
		(connected loc65 loc15)
		(connected loc15 loc69)
		(connected loc69 loc15)
		(connected loc16 loc10)
		(connected loc10 loc16)
		(connected loc16 loc20)
		(connected loc20 loc16)
		(connected loc16 loc50)
		(connected loc50 loc16)
		(connected loc16 loc53)
		(connected loc53 loc16)
		(connected loc17 loc2)
		(connected loc2 loc17)
		(connected loc17 loc7)
		(connected loc7 loc17)
		(connected loc17 loc8)
		(connected loc8 loc17)
		(connected loc17 loc10)
		(connected loc10 loc17)
		(connected loc17 loc19)
		(connected loc19 loc17)
		(connected loc17 loc20)
		(connected loc20 loc17)
		(connected loc17 loc22)
		(connected loc22 loc17)
		(connected loc17 loc27)
		(connected loc27 loc17)
		(connected loc17 loc30)
		(connected loc30 loc17)
		(connected loc17 loc50)
		(connected loc50 loc17)
		(connected loc17 loc51)
		(connected loc51 loc17)
		(connected loc17 loc61)
		(connected loc61 loc17)
		(connected loc18 loc6)
		(connected loc6 loc18)
		(connected loc18 loc14)
		(connected loc14 loc18)
		(connected loc18 loc23)
		(connected loc23 loc18)
		(connected loc18 loc48)
		(connected loc48 loc18)
		(connected loc18 loc59)
		(connected loc59 loc18)
		(connected loc19 loc15)
		(connected loc15 loc19)
		(connected loc19 loc16)
		(connected loc16 loc19)
		(connected loc19 loc29)
		(connected loc29 loc19)
		(connected loc19 loc40)
		(connected loc40 loc19)
		(connected loc19 loc57)
		(connected loc57 loc19)
		(connected loc20 loc4)
		(connected loc4 loc20)
		(connected loc20 loc19)
		(connected loc19 loc20)
		(connected loc20 loc23)
		(connected loc23 loc20)
		(connected loc20 loc24)
		(connected loc24 loc20)
		(connected loc20 loc73)
		(connected loc73 loc20)
		(connected loc20 loc74)
		(connected loc74 loc20)
		(connected loc21 loc1)
		(connected loc1 loc21)
		(connected loc21 loc43)
		(connected loc43 loc21)
		(connected loc21 loc46)
		(connected loc46 loc21)
		(connected loc21 loc47)
		(connected loc47 loc21)
		(connected loc21 loc70)
		(connected loc70 loc21)
		(connected loc22 loc19)
		(connected loc19 loc22)
		(connected loc22 loc25)
		(connected loc25 loc22)
		(connected loc22 loc32)
		(connected loc32 loc22)
		(connected loc22 loc51)
		(connected loc51 loc22)
		(connected loc22 loc60)
		(connected loc60 loc22)
		(connected loc22 loc71)
		(connected loc71 loc22)
		(connected loc23 loc12)
		(connected loc12 loc23)
		(connected loc23 loc17)
		(connected loc17 loc23)
		(connected loc23 loc47)
		(connected loc47 loc23)
		(connected loc23 loc50)
		(connected loc50 loc23)
		(connected loc23 loc60)
		(connected loc60 loc23)
		(connected loc24 loc23)
		(connected loc23 loc24)
		(connected loc24 loc25)
		(connected loc25 loc24)
		(connected loc24 loc29)
		(connected loc29 loc24)
		(connected loc24 loc38)
		(connected loc38 loc24)
		(connected loc25 loc10)
		(connected loc10 loc25)
		(connected loc25 loc15)
		(connected loc15 loc25)
		(connected loc25 loc21)
		(connected loc21 loc25)
		(connected loc25 loc23)
		(connected loc23 loc25)
		(connected loc25 loc33)
		(connected loc33 loc25)
		(connected loc25 loc36)
		(connected loc36 loc25)
		(connected loc26 loc18)
		(connected loc18 loc26)
		(connected loc26 loc23)
		(connected loc23 loc26)
		(connected loc26 loc29)
		(connected loc29 loc26)
		(connected loc26 loc34)
		(connected loc34 loc26)
		(connected loc26 loc53)
		(connected loc53 loc26)
		(connected loc26 loc57)
		(connected loc57 loc26)
		(connected loc26 loc60)
		(connected loc60 loc26)
		(connected loc26 loc66)
		(connected loc66 loc26)
		(connected loc27 loc9)
		(connected loc9 loc27)
		(connected loc27 loc51)
		(connected loc51 loc27)
		(connected loc28 loc6)
		(connected loc6 loc28)
		(connected loc28 loc8)
		(connected loc8 loc28)
		(connected loc28 loc10)
		(connected loc10 loc28)
		(connected loc28 loc29)
		(connected loc29 loc28)
		(connected loc28 loc36)
		(connected loc36 loc28)
		(connected loc28 loc60)
		(connected loc60 loc28)
		(connected loc29 loc4)
		(connected loc4 loc29)
		(connected loc29 loc22)
		(connected loc22 loc29)
		(connected loc29 loc26)
		(connected loc26 loc29)
		(connected loc29 loc37)
		(connected loc37 loc29)
		(connected loc30 loc7)
		(connected loc7 loc30)
		(connected loc30 loc8)
		(connected loc8 loc30)
		(connected loc30 loc33)
		(connected loc33 loc30)
		(connected loc30 loc34)
		(connected loc34 loc30)
		(connected loc30 loc72)
		(connected loc72 loc30)
		(connected loc31 loc18)
		(connected loc18 loc31)
		(connected loc31 loc22)
		(connected loc22 loc31)
		(connected loc31 loc29)
		(connected loc29 loc31)
		(connected loc32 loc8)
		(connected loc8 loc32)
		(connected loc32 loc13)
		(connected loc13 loc32)
		(connected loc32 loc14)
		(connected loc14 loc32)
		(connected loc32 loc16)
		(connected loc16 loc32)
		(connected loc32 loc21)
		(connected loc21 loc32)
		(connected loc32 loc23)
		(connected loc23 loc32)
		(connected loc32 loc34)
		(connected loc34 loc32)
		(connected loc32 loc43)
		(connected loc43 loc32)
		(connected loc32 loc45)
		(connected loc45 loc32)
		(connected loc32 loc47)
		(connected loc47 loc32)
		(connected loc32 loc48)
		(connected loc48 loc32)
		(connected loc32 loc53)
		(connected loc53 loc32)
		(connected loc32 loc56)
		(connected loc56 loc32)
		(connected loc32 loc63)
		(connected loc63 loc32)
		(connected loc32 loc64)
		(connected loc64 loc32)
		(connected loc33 loc12)
		(connected loc12 loc33)
		(connected loc33 loc14)
		(connected loc14 loc33)
		(connected loc33 loc19)
		(connected loc19 loc33)
		(connected loc33 loc21)
		(connected loc21 loc33)
		(connected loc33 loc28)
		(connected loc28 loc33)
		(connected loc33 loc48)
		(connected loc48 loc33)
		(connected loc33 loc57)
		(connected loc57 loc33)
		(connected loc34 loc13)
		(connected loc13 loc34)
		(connected loc34 loc25)
		(connected loc25 loc34)
		(connected loc34 loc45)
		(connected loc45 loc34)
		(connected loc34 loc57)
		(connected loc57 loc34)
		(connected loc34 loc60)
		(connected loc60 loc34)
		(connected loc35 loc12)
		(connected loc12 loc35)
		(connected loc35 loc29)
		(connected loc29 loc35)
		(connected loc35 loc72)
		(connected loc72 loc35)
		(connected loc36 loc18)
		(connected loc18 loc36)
		(connected loc36 loc23)
		(connected loc23 loc36)
		(connected loc36 loc24)
		(connected loc24 loc36)
		(connected loc36 loc32)
		(connected loc32 loc36)
		(connected loc36 loc39)
		(connected loc39 loc36)
		(connected loc36 loc47)
		(connected loc47 loc36)
		(connected loc36 loc61)
		(connected loc61 loc36)
		(connected loc37 loc2)
		(connected loc2 loc37)
		(connected loc37 loc3)
		(connected loc3 loc37)
		(connected loc37 loc24)
		(connected loc24 loc37)
		(connected loc37 loc36)
		(connected loc36 loc37)
		(connected loc37 loc45)
		(connected loc45 loc37)
		(connected loc37 loc51)
		(connected loc51 loc37)
		(connected loc37 loc56)
		(connected loc56 loc37)
		(connected loc37 loc59)
		(connected loc59 loc37)
		(connected loc37 loc67)
		(connected loc67 loc37)
		(connected loc37 loc70)
		(connected loc70 loc37)
		(connected loc38 loc19)
		(connected loc19 loc38)
		(connected loc38 loc29)
		(connected loc29 loc38)
		(connected loc38 loc72)
		(connected loc72 loc38)
		(connected loc38 loc73)
		(connected loc73 loc38)
		(connected loc39 loc31)
		(connected loc31 loc39)
		(connected loc39 loc41)
		(connected loc41 loc39)
		(connected loc39 loc67)
		(connected loc67 loc39)
		(connected loc40 loc22)
		(connected loc22 loc40)
		(connected loc40 loc47)
		(connected loc47 loc40)
		(connected loc40 loc67)
		(connected loc67 loc40)
		(connected loc41 loc5)
		(connected loc5 loc41)
		(connected loc41 loc7)
		(connected loc7 loc41)
		(connected loc41 loc11)
		(connected loc11 loc41)
		(connected loc41 loc15)
		(connected loc15 loc41)
		(connected loc41 loc34)
		(connected loc34 loc41)
		(connected loc41 loc43)
		(connected loc43 loc41)
		(connected loc42 loc12)
		(connected loc12 loc42)
		(connected loc42 loc14)
		(connected loc14 loc42)
		(connected loc42 loc21)
		(connected loc21 loc42)
		(connected loc42 loc31)
		(connected loc31 loc42)
		(connected loc42 loc34)
		(connected loc34 loc42)
		(connected loc42 loc44)
		(connected loc44 loc42)
		(connected loc42 loc66)
		(connected loc66 loc42)
		(connected loc42 loc69)
		(connected loc69 loc42)
		(connected loc43 loc6)
		(connected loc6 loc43)
		(connected loc43 loc10)
		(connected loc10 loc43)
		(connected loc43 loc25)
		(connected loc25 loc43)
		(connected loc43 loc32)
		(connected loc32 loc43)
		(connected loc43 loc34)
		(connected loc34 loc43)
		(connected loc43 loc57)
		(connected loc57 loc43)
		(connected loc43 loc64)
		(connected loc64 loc43)
		(connected loc43 loc73)
		(connected loc73 loc43)
		(connected loc44 loc10)
		(connected loc10 loc44)
		(connected loc44 loc15)
		(connected loc15 loc44)
		(connected loc44 loc21)
		(connected loc21 loc44)
		(connected loc44 loc34)
		(connected loc34 loc44)
		(connected loc44 loc39)
		(connected loc39 loc44)
		(connected loc44 loc41)
		(connected loc41 loc44)
		(connected loc44 loc65)
		(connected loc65 loc44)
		(connected loc45 loc2)
		(connected loc2 loc45)
		(connected loc45 loc13)
		(connected loc13 loc45)
		(connected loc45 loc14)
		(connected loc14 loc45)
		(connected loc45 loc18)
		(connected loc18 loc45)
		(connected loc45 loc36)
		(connected loc36 loc45)
		(connected loc45 loc38)
		(connected loc38 loc45)
		(connected loc45 loc42)
		(connected loc42 loc45)
		(connected loc45 loc64)
		(connected loc64 loc45)
		(connected loc46 loc50)
		(connected loc50 loc46)
		(connected loc46 loc52)
		(connected loc52 loc46)
		(connected loc46 loc74)
		(connected loc74 loc46)
		(connected loc47 loc14)
		(connected loc14 loc47)
		(connected loc47 loc22)
		(connected loc22 loc47)
		(connected loc47 loc37)
		(connected loc37 loc47)
		(connected loc47 loc45)
		(connected loc45 loc47)
		(connected loc47 loc49)
		(connected loc49 loc47)
		(connected loc47 loc60)
		(connected loc60 loc47)
		(connected loc47 loc70)
		(connected loc70 loc47)
		(connected loc48 loc6)
		(connected loc6 loc48)
		(connected loc48 loc13)
		(connected loc13 loc48)
		(connected loc48 loc34)
		(connected loc34 loc48)
		(connected loc48 loc35)
		(connected loc35 loc48)
		(connected loc48 loc40)
		(connected loc40 loc48)
		(connected loc48 loc44)
		(connected loc44 loc48)
		(connected loc48 loc51)
		(connected loc51 loc48)
		(connected loc48 loc67)
		(connected loc67 loc48)
		(connected loc48 loc70)
		(connected loc70 loc48)
		(connected loc49 loc12)
		(connected loc12 loc49)
		(connected loc49 loc13)
		(connected loc13 loc49)
		(connected loc49 loc20)
		(connected loc20 loc49)
		(connected loc49 loc54)
		(connected loc54 loc49)
		(connected loc49 loc60)
		(connected loc60 loc49)
		(connected loc50 loc27)
		(connected loc27 loc50)
		(connected loc50 loc28)
		(connected loc28 loc50)
		(connected loc50 loc31)
		(connected loc31 loc50)
		(connected loc50 loc62)
		(connected loc62 loc50)
		(connected loc51 loc11)
		(connected loc11 loc51)
		(connected loc51 loc21)
		(connected loc21 loc51)
		(connected loc51 loc37)
		(connected loc37 loc51)
		(connected loc51 loc38)
		(connected loc38 loc51)
		(connected loc51 loc40)
		(connected loc40 loc51)
		(connected loc51 loc45)
		(connected loc45 loc51)
		(connected loc51 loc52)
		(connected loc52 loc51)
		(connected loc51 loc56)
		(connected loc56 loc51)
		(connected loc52 loc13)
		(connected loc13 loc52)
		(connected loc52 loc34)
		(connected loc34 loc52)
		(connected loc52 loc48)
		(connected loc48 loc52)
		(connected loc52 loc49)
		(connected loc49 loc52)
		(connected loc52 loc71)
		(connected loc71 loc52)
		(connected loc52 loc75)
		(connected loc75 loc52)
		(connected loc53 loc1)
		(connected loc1 loc53)
		(connected loc53 loc13)
		(connected loc13 loc53)
		(connected loc53 loc26)
		(connected loc26 loc53)
		(connected loc53 loc33)
		(connected loc33 loc53)
		(connected loc53 loc34)
		(connected loc34 loc53)
		(connected loc53 loc49)
		(connected loc49 loc53)
		(connected loc54 loc22)
		(connected loc22 loc54)
		(connected loc54 loc47)
		(connected loc47 loc54)
		(connected loc54 loc51)
		(connected loc51 loc54)
		(connected loc55 loc5)
		(connected loc5 loc55)
		(connected loc55 loc10)
		(connected loc10 loc55)
		(connected loc55 loc25)
		(connected loc25 loc55)
		(connected loc55 loc34)
		(connected loc34 loc55)
		(connected loc55 loc53)
		(connected loc53 loc55)
		(connected loc55 loc71)
		(connected loc71 loc55)
		(connected loc55 loc72)
		(connected loc72 loc55)
		(connected loc56 loc25)
		(connected loc25 loc56)
		(connected loc56 loc38)
		(connected loc38 loc56)
		(connected loc56 loc46)
		(connected loc46 loc56)
		(connected loc56 loc51)
		(connected loc51 loc56)
		(connected loc56 loc64)
		(connected loc64 loc56)
		(connected loc57 loc22)
		(connected loc22 loc57)
		(connected loc57 loc35)
		(connected loc35 loc57)
		(connected loc57 loc46)
		(connected loc46 loc57)
		(connected loc57 loc55)
		(connected loc55 loc57)
		(connected loc57 loc56)
		(connected loc56 loc57)
		(connected loc57 loc62)
		(connected loc62 loc57)
		(connected loc57 loc65)
		(connected loc65 loc57)
		(connected loc58 loc56)
		(connected loc56 loc58)
		(connected loc58 loc63)
		(connected loc63 loc58)
		(connected loc58 loc64)
		(connected loc64 loc58)
		(connected loc58 loc67)
		(connected loc67 loc58)
		(connected loc59 loc31)
		(connected loc31 loc59)
		(connected loc59 loc48)
		(connected loc48 loc59)
		(connected loc59 loc69)
		(connected loc69 loc59)
		(connected loc60 loc27)
		(connected loc27 loc60)
		(connected loc60 loc54)
		(connected loc54 loc60)
		(connected loc60 loc56)
		(connected loc56 loc60)
		(connected loc61 loc1)
		(connected loc1 loc61)
		(connected loc61 loc14)
		(connected loc14 loc61)
		(connected loc61 loc29)
		(connected loc29 loc61)
		(connected loc61 loc36)
		(connected loc36 loc61)
		(connected loc61 loc56)
		(connected loc56 loc61)
		(connected loc61 loc62)
		(connected loc62 loc61)
		(connected loc61 loc63)
		(connected loc63 loc61)
		(connected loc61 loc68)
		(connected loc68 loc61)
		(connected loc62 loc23)
		(connected loc23 loc62)
		(connected loc62 loc26)
		(connected loc26 loc62)
		(connected loc62 loc43)
		(connected loc43 loc62)
		(connected loc62 loc50)
		(connected loc50 loc62)
		(connected loc62 loc66)
		(connected loc66 loc62)
		(connected loc62 loc69)
		(connected loc69 loc62)
		(connected loc63 loc16)
		(connected loc16 loc63)
		(connected loc63 loc18)
		(connected loc18 loc63)
		(connected loc63 loc33)
		(connected loc33 loc63)
		(connected loc63 loc72)
		(connected loc72 loc63)
		(connected loc64 loc20)
		(connected loc20 loc64)
		(connected loc64 loc30)
		(connected loc30 loc64)
		(connected loc64 loc56)
		(connected loc56 loc64)
		(connected loc64 loc59)
		(connected loc59 loc64)
		(connected loc64 loc60)
		(connected loc60 loc64)
		(connected loc64 loc71)
		(connected loc71 loc64)
		(connected loc65 loc2)
		(connected loc2 loc65)
		(connected loc65 loc55)
		(connected loc55 loc65)
		(connected loc65 loc63)
		(connected loc63 loc65)
		(connected loc65 loc67)
		(connected loc67 loc65)
		(connected loc66 loc34)
		(connected loc34 loc66)
		(connected loc66 loc36)
		(connected loc36 loc66)
		(connected loc67 loc50)
		(connected loc50 loc67)
		(connected loc67 loc70)
		(connected loc70 loc67)
		(connected loc68 loc30)
		(connected loc30 loc68)
		(connected loc68 loc42)
		(connected loc42 loc68)
		(connected loc69 loc27)
		(connected loc27 loc69)
		(connected loc69 loc53)
		(connected loc53 loc69)
		(connected loc69 loc55)
		(connected loc55 loc69)
		(connected loc69 loc59)
		(connected loc59 loc69)
		(connected loc70 loc45)
		(connected loc45 loc70)
		(connected loc70 loc74)
		(connected loc74 loc70)
		(connected loc71 loc28)
		(connected loc28 loc71)
		(connected loc71 loc43)
		(connected loc43 loc71)
		(connected loc71 loc52)
		(connected loc52 loc71)
		(connected loc71 loc61)
		(connected loc61 loc71)
		(connected loc71 loc63)
		(connected loc63 loc71)
		(connected loc71 loc66)
		(connected loc66 loc71)
		(connected loc72 loc37)
		(connected loc37 loc72)
		(connected loc72 loc54)
		(connected loc54 loc72)
		(connected loc72 loc71)
		(connected loc71 loc72)
		(connected loc73 loc25)
		(connected loc25 loc73)
		(connected loc73 loc31)
		(connected loc31 loc73)
		(connected loc73 loc35)
		(connected loc35 loc73)
		(connected loc73 loc65)
		(connected loc65 loc73)
		(connected loc74 loc31)
		(connected loc31 loc74)
		(connected loc74 loc47)
		(connected loc47 loc74)
		(connected loc75 loc30)
		(connected loc30 loc75)
		(connected loc75 loc52)
		(connected loc52 loc75)
		(connected loc75 loc54)
		(connected loc54 loc75)
		(connected loc75 loc66)
		(connected loc66 loc75)

		(in bar5 loc5)
		(in bar11 loc11)
		(in bar15 loc15)
		(in bar17 loc17)
		(in bar18 loc18)
		(in bar21 loc21)
		(in bar22 loc22)
		(in bar24 loc24)
		(in bar25 loc25)
		(in bar27 loc27)
		(in bar28 loc28)
		(in bar29 loc29)
		(in bar30 loc30)
		(in bar32 loc32)
		(in bar33 loc33)
		(in bar34 loc34)
		(in bar36 loc36)
		(in bar38 loc38)
		(in bar40 loc40)
		(in bar41 loc41)
		(in bar47 loc47)
		(in bar50 loc50)
		(in bar51 loc51)
		(in bar52 loc52)
		(in bar53 loc53)
		(in bar54 loc54)
		(in bar59 loc59)
		(in bar61 loc61)
		(in bar63 loc63)
		(in bar64 loc64)
		(in bar66 loc66)
		(in bar69 loc69)
		(in bar70 loc70)
		(in bar71 loc71)

	)

	(:goal
		(and
			(at loc75)
		)
	)
)