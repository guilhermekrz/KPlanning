; Generated by ProblemGenerator - Problem 69 at Sat Nov 26 18:02:21 BRST 2016
(define (problem pb69)
	(:domain drinkanddrive-constraints-generated)
	(:requirements :strips :typing :negative-preconditions)
	(:objects
		loc1 loc2 loc3 loc4 loc5 loc6 loc7 loc8 loc9 loc10 loc11 loc12 loc13 loc14 loc15 loc16 loc17 loc18 loc19 loc20 loc21 loc22 loc23 loc24 loc25 loc26 loc27 loc28 loc29 loc30 loc31 loc32 loc33 loc34 loc35 loc36 loc37 loc38 loc39 loc40 loc41 loc42 loc43 loc44 loc45 loc46 loc47 loc48 loc49 loc50 loc51 loc52 loc53 loc54 loc55 loc56 loc57 loc58 loc59 loc60 loc61 loc62 loc63 loc64 loc65 loc66 loc67 loc68 loc69 loc70 loc71 loc72 loc73 loc74 - location
		bar1 bar2 bar6 bar7 bar9 bar12 bar14 bar16 bar18 bar20 bar23 bar24 bar33 bar38 bar40 bar41 bar42 bar44 bar47 bar48 bar51 bar54 bar55 bar59 bar62 bar63 bar64 bar68 bar69 bar71 bar72 bar73 - bar
	)
	(:init
		(at loc1)

		(connected loc5 loc67)
		(connected loc67 loc5)
		(connected loc67 loc2)
		(connected loc2 loc67)
		(connected loc2 loc34)
		(connected loc34 loc2)
		(connected loc34 loc33)
		(connected loc33 loc34)
		(connected loc33 loc65)
		(connected loc65 loc33)
		(connected loc65 loc48)
		(connected loc48 loc65)
		(connected loc48 loc59)
		(connected loc59 loc48)
		(connected loc59 loc11)
		(connected loc11 loc59)
		(connected loc11 loc64)
		(connected loc64 loc11)
		(connected loc64 loc61)
		(connected loc61 loc64)
		(connected loc59 loc21)
		(connected loc21 loc59)
		(connected loc21 loc29)
		(connected loc29 loc21)
		(connected loc29 loc25)
		(connected loc25 loc29)
		(connected loc25 loc50)
		(connected loc50 loc25)
		(connected loc50 loc60)
		(connected loc60 loc50)
		(connected loc60 loc28)
		(connected loc28 loc60)
		(connected loc28 loc54)
		(connected loc54 loc28)
		(connected loc54 loc44)
		(connected loc44 loc54)
		(connected loc33 loc35)
		(connected loc35 loc33)
		(connected loc35 loc31)
		(connected loc31 loc35)
		(connected loc31 loc3)
		(connected loc3 loc31)
		(connected loc3 loc24)
		(connected loc24 loc3)
		(connected loc24 loc12)
		(connected loc12 loc24)
		(connected loc12 loc20)
		(connected loc20 loc12)
		(connected loc54 loc42)
		(connected loc42 loc54)
		(connected loc42 loc7)
		(connected loc7 loc42)
		(connected loc7 loc56)
		(connected loc56 loc7)
		(connected loc56 loc38)
		(connected loc38 loc56)
		(connected loc50 loc13)
		(connected loc13 loc50)
		(connected loc13 loc70)
		(connected loc70 loc13)
		(connected loc70 loc49)
		(connected loc49 loc70)
		(connected loc49 loc52)
		(connected loc52 loc49)
		(connected loc52 loc51)
		(connected loc51 loc52)
		(connected loc51 loc68)
		(connected loc68 loc51)
		(connected loc28 loc16)
		(connected loc16 loc28)
		(connected loc24 loc32)
		(connected loc32 loc24)
		(connected loc32 loc15)
		(connected loc15 loc32)
		(connected loc15 loc37)
		(connected loc37 loc15)
		(connected loc33 loc71)
		(connected loc71 loc33)
		(connected loc51 loc6)
		(connected loc6 loc51)
		(connected loc54 loc9)
		(connected loc9 loc54)
		(connected loc6 loc72)
		(connected loc72 loc6)
		(connected loc72 loc58)
		(connected loc58 loc72)
		(connected loc31 loc57)
		(connected loc57 loc31)
		(connected loc5 loc53)
		(connected loc53 loc5)
		(connected loc53 loc63)
		(connected loc63 loc53)
		(connected loc48 loc46)
		(connected loc46 loc48)
		(connected loc28 loc14)
		(connected loc14 loc28)
		(connected loc14 loc47)
		(connected loc47 loc14)
		(connected loc61 loc39)
		(connected loc39 loc61)
		(connected loc39 loc55)
		(connected loc55 loc39)
		(connected loc57 loc19)
		(connected loc19 loc57)
		(connected loc50 loc66)
		(connected loc66 loc50)
		(connected loc61 loc10)
		(connected loc10 loc61)
		(connected loc60 loc40)
		(connected loc40 loc60)
		(connected loc20 loc18)
		(connected loc18 loc20)
		(connected loc18 loc4)
		(connected loc4 loc18)
		(connected loc46 loc30)
		(connected loc30 loc46)
		(connected loc12 loc43)
		(connected loc43 loc12)
		(connected loc48 loc45)
		(connected loc45 loc48)
		(connected loc65 loc8)
		(connected loc8 loc65)
		(connected loc60 loc23)
		(connected loc23 loc60)
		(connected loc38 loc62)
		(connected loc62 loc38)
		(connected loc13 loc69)
		(connected loc69 loc13)
		(connected loc64 loc36)
		(connected loc36 loc64)
		(connected loc56 loc73)
		(connected loc73 loc56)
		(connected loc4 loc1)
		(connected loc1 loc4)
		(connected loc4 loc22)
		(connected loc22 loc4)
		(connected loc38 loc26)
		(connected loc26 loc38)
		(connected loc36 loc27)
		(connected loc27 loc36)
		(connected loc65 loc74)
		(connected loc74 loc65)
		(connected loc74 loc17)
		(connected loc17 loc74)
		(connected loc8 loc41)
		(connected loc41 loc8)
		(connected loc1 loc11)
		(connected loc11 loc1)
		(connected loc2 loc9)
		(connected loc9 loc2)
		(connected loc2 loc11)
		(connected loc11 loc2)
		(connected loc2 loc46)
		(connected loc46 loc2)
		(connected loc3 loc4)
		(connected loc4 loc3)
		(connected loc3 loc21)
		(connected loc21 loc3)
		(connected loc3 loc38)
		(connected loc38 loc3)
		(connected loc3 loc46)
		(connected loc46 loc3)
		(connected loc3 loc62)
		(connected loc62 loc3)
		(connected loc3 loc64)
		(connected loc64 loc3)
		(connected loc4 loc10)
		(connected loc10 loc4)
		(connected loc4 loc16)
		(connected loc16 loc4)
		(connected loc4 loc24)
		(connected loc24 loc4)
		(connected loc4 loc29)
		(connected loc29 loc4)
		(connected loc5 loc25)
		(connected loc25 loc5)
		(connected loc5 loc31)
		(connected loc31 loc5)
		(connected loc5 loc36)
		(connected loc36 loc5)
		(connected loc5 loc52)
		(connected loc52 loc5)
		(connected loc6 loc3)
		(connected loc3 loc6)
		(connected loc6 loc10)
		(connected loc10 loc6)
		(connected loc6 loc18)
		(connected loc18 loc6)
		(connected loc6 loc20)
		(connected loc20 loc6)
		(connected loc6 loc35)
		(connected loc35 loc6)
		(connected loc6 loc40)
		(connected loc40 loc6)
		(connected loc6 loc45)
		(connected loc45 loc6)
		(connected loc6 loc52)
		(connected loc52 loc6)
		(connected loc7 loc23)
		(connected loc23 loc7)
		(connected loc7 loc33)
		(connected loc33 loc7)
		(connected loc7 loc39)
		(connected loc39 loc7)
		(connected loc7 loc58)
		(connected loc58 loc7)
		(connected loc8 loc7)
		(connected loc7 loc8)
		(connected loc8 loc27)
		(connected loc27 loc8)
		(connected loc8 loc32)
		(connected loc32 loc8)
		(connected loc8 loc42)
		(connected loc42 loc8)
		(connected loc9 loc3)
		(connected loc3 loc9)
		(connected loc9 loc16)
		(connected loc16 loc9)
		(connected loc9 loc67)
		(connected loc67 loc9)
		(connected loc10 loc18)
		(connected loc18 loc10)
		(connected loc10 loc24)
		(connected loc24 loc10)
		(connected loc10 loc28)
		(connected loc28 loc10)
		(connected loc10 loc30)
		(connected loc30 loc10)
		(connected loc10 loc39)
		(connected loc39 loc10)
		(connected loc11 loc35)
		(connected loc35 loc11)
		(connected loc11 loc45)
		(connected loc45 loc11)
		(connected loc11 loc54)
		(connected loc54 loc11)
		(connected loc12 loc4)
		(connected loc4 loc12)
		(connected loc12 loc13)
		(connected loc13 loc12)
		(connected loc12 loc17)
		(connected loc17 loc12)
		(connected loc12 loc23)
		(connected loc23 loc12)
		(connected loc12 loc45)
		(connected loc45 loc12)
		(connected loc12 loc46)
		(connected loc46 loc12)
		(connected loc12 loc59)
		(connected loc59 loc12)
		(connected loc12 loc70)
		(connected loc70 loc12)
		(connected loc13 loc6)
		(connected loc6 loc13)
		(connected loc13 loc24)
		(connected loc24 loc13)
		(connected loc13 loc30)
		(connected loc30 loc13)
		(connected loc13 loc31)
		(connected loc31 loc13)
		(connected loc13 loc37)
		(connected loc37 loc13)
		(connected loc14 loc7)
		(connected loc7 loc14)
		(connected loc14 loc13)
		(connected loc13 loc14)
		(connected loc14 loc72)
		(connected loc72 loc14)
		(connected loc15 loc21)
		(connected loc21 loc15)
		(connected loc15 loc26)
		(connected loc26 loc15)
		(connected loc16 loc4)
		(connected loc4 loc16)
		(connected loc16 loc5)
		(connected loc5 loc16)
		(connected loc16 loc18)
		(connected loc18 loc16)
		(connected loc16 loc38)
		(connected loc38 loc16)
		(connected loc16 loc39)
		(connected loc39 loc16)
		(connected loc16 loc49)
		(connected loc49 loc16)
		(connected loc16 loc50)
		(connected loc50 loc16)
		(connected loc16 loc54)
		(connected loc54 loc16)
		(connected loc17 loc4)
		(connected loc4 loc17)
		(connected loc17 loc9)
		(connected loc9 loc17)
		(connected loc17 loc12)
		(connected loc12 loc17)
		(connected loc17 loc14)
		(connected loc14 loc17)
		(connected loc17 loc19)
		(connected loc19 loc17)
		(connected loc17 loc21)
		(connected loc21 loc17)
		(connected loc17 loc24)
		(connected loc24 loc17)
		(connected loc17 loc61)
		(connected loc61 loc17)
		(connected loc18 loc37)
		(connected loc37 loc18)
		(connected loc18 loc54)
		(connected loc54 loc18)
		(connected loc19 loc21)
		(connected loc21 loc19)
		(connected loc19 loc22)
		(connected loc22 loc19)
		(connected loc19 loc31)
		(connected loc31 loc19)
		(connected loc19 loc34)
		(connected loc34 loc19)
		(connected loc19 loc63)
		(connected loc63 loc19)
		(connected loc19 loc68)
		(connected loc68 loc19)
		(connected loc20 loc16)
		(connected loc16 loc20)
		(connected loc20 loc34)
		(connected loc34 loc20)
		(connected loc20 loc52)
		(connected loc52 loc20)
		(connected loc21 loc3)
		(connected loc3 loc21)
		(connected loc21 loc7)
		(connected loc7 loc21)
		(connected loc21 loc16)
		(connected loc16 loc21)
		(connected loc21 loc20)
		(connected loc20 loc21)
		(connected loc21 loc43)
		(connected loc43 loc21)
		(connected loc21 loc45)
		(connected loc45 loc21)
		(connected loc21 loc47)
		(connected loc47 loc21)
		(connected loc22 loc3)
		(connected loc3 loc22)
		(connected loc22 loc27)
		(connected loc27 loc22)
		(connected loc22 loc40)
		(connected loc40 loc22)
		(connected loc22 loc43)
		(connected loc43 loc22)
		(connected loc23 loc2)
		(connected loc2 loc23)
		(connected loc23 loc7)
		(connected loc7 loc23)
		(connected loc23 loc15)
		(connected loc15 loc23)
		(connected loc23 loc27)
		(connected loc27 loc23)
		(connected loc23 loc40)
		(connected loc40 loc23)
		(connected loc24 loc26)
		(connected loc26 loc24)
		(connected loc24 loc56)
		(connected loc56 loc24)
		(connected loc24 loc63)
		(connected loc63 loc24)
		(connected loc24 loc72)
		(connected loc72 loc24)
		(connected loc25 loc4)
		(connected loc4 loc25)
		(connected loc25 loc6)
		(connected loc6 loc25)
		(connected loc25 loc18)
		(connected loc18 loc25)
		(connected loc25 loc35)
		(connected loc35 loc25)
		(connected loc25 loc40)
		(connected loc40 loc25)
		(connected loc25 loc62)
		(connected loc62 loc25)
		(connected loc26 loc10)
		(connected loc10 loc26)
		(connected loc26 loc12)
		(connected loc12 loc26)
		(connected loc26 loc56)
		(connected loc56 loc26)
		(connected loc26 loc57)
		(connected loc57 loc26)
		(connected loc26 loc62)
		(connected loc62 loc26)
		(connected loc26 loc72)
		(connected loc72 loc26)
		(connected loc26 loc73)
		(connected loc73 loc26)
		(connected loc27 loc13)
		(connected loc13 loc27)
		(connected loc27 loc14)
		(connected loc14 loc27)
		(connected loc27 loc16)
		(connected loc16 loc27)
		(connected loc27 loc29)
		(connected loc29 loc27)
		(connected loc27 loc45)
		(connected loc45 loc27)
		(connected loc27 loc52)
		(connected loc52 loc27)
		(connected loc27 loc62)
		(connected loc62 loc27)
		(connected loc27 loc67)
		(connected loc67 loc27)
		(connected loc28 loc26)
		(connected loc26 loc28)
		(connected loc28 loc27)
		(connected loc27 loc28)
		(connected loc28 loc51)
		(connected loc51 loc28)
		(connected loc28 loc61)
		(connected loc61 loc28)
		(connected loc29 loc17)
		(connected loc17 loc29)
		(connected loc29 loc56)
		(connected loc56 loc29)
		(connected loc29 loc58)
		(connected loc58 loc29)
		(connected loc30 loc4)
		(connected loc4 loc30)
		(connected loc30 loc29)
		(connected loc29 loc30)
		(connected loc30 loc58)
		(connected loc58 loc30)
		(connected loc30 loc71)
		(connected loc71 loc30)
		(connected loc31 loc10)
		(connected loc10 loc31)
		(connected loc31 loc32)
		(connected loc32 loc31)
		(connected loc31 loc33)
		(connected loc33 loc31)
		(connected loc31 loc38)
		(connected loc38 loc31)
		(connected loc31 loc72)
		(connected loc72 loc31)
		(connected loc32 loc19)
		(connected loc19 loc32)
		(connected loc32 loc25)
		(connected loc25 loc32)
		(connected loc32 loc29)
		(connected loc29 loc32)
		(connected loc32 loc33)
		(connected loc33 loc32)
		(connected loc32 loc42)
		(connected loc42 loc32)
		(connected loc33 loc13)
		(connected loc13 loc33)
		(connected loc33 loc28)
		(connected loc28 loc33)
		(connected loc33 loc31)
		(connected loc31 loc33)
		(connected loc33 loc59)
		(connected loc59 loc33)
		(connected loc34 loc16)
		(connected loc16 loc34)
		(connected loc34 loc47)
		(connected loc47 loc34)
		(connected loc34 loc57)
		(connected loc57 loc34)
		(connected loc34 loc71)
		(connected loc71 loc34)
		(connected loc35 loc23)
		(connected loc23 loc35)
		(connected loc35 loc26)
		(connected loc26 loc35)
		(connected loc35 loc30)
		(connected loc30 loc35)
		(connected loc35 loc33)
		(connected loc33 loc35)
		(connected loc35 loc44)
		(connected loc44 loc35)
		(connected loc35 loc45)
		(connected loc45 loc35)
		(connected loc35 loc65)
		(connected loc65 loc35)
		(connected loc35 loc66)
		(connected loc66 loc35)
		(connected loc36 loc6)
		(connected loc6 loc36)
		(connected loc36 loc33)
		(connected loc33 loc36)
		(connected loc36 loc63)
		(connected loc63 loc36)
		(connected loc37 loc2)
		(connected loc2 loc37)
		(connected loc37 loc4)
		(connected loc4 loc37)
		(connected loc37 loc32)
		(connected loc32 loc37)
		(connected loc37 loc49)
		(connected loc49 loc37)
		(connected loc37 loc52)
		(connected loc52 loc37)
		(connected loc37 loc69)
		(connected loc69 loc37)
		(connected loc38 loc31)
		(connected loc31 loc38)
		(connected loc38 loc32)
		(connected loc32 loc38)
		(connected loc38 loc45)
		(connected loc45 loc38)
		(connected loc38 loc49)
		(connected loc49 loc38)
		(connected loc38 loc68)
		(connected loc68 loc38)
		(connected loc39 loc4)
		(connected loc4 loc39)
		(connected loc39 loc12)
		(connected loc12 loc39)
		(connected loc39 loc13)
		(connected loc13 loc39)
		(connected loc39 loc14)
		(connected loc14 loc39)
		(connected loc39 loc15)
		(connected loc15 loc39)
		(connected loc39 loc47)
		(connected loc47 loc39)
		(connected loc39 loc71)
		(connected loc71 loc39)
		(connected loc40 loc23)
		(connected loc23 loc40)
		(connected loc40 loc31)
		(connected loc31 loc40)
		(connected loc40 loc33)
		(connected loc33 loc40)
		(connected loc40 loc43)
		(connected loc43 loc40)
		(connected loc40 loc60)
		(connected loc60 loc40)
		(connected loc41 loc9)
		(connected loc9 loc41)
		(connected loc41 loc30)
		(connected loc30 loc41)
		(connected loc41 loc46)
		(connected loc46 loc41)
		(connected loc41 loc51)
		(connected loc51 loc41)
		(connected loc41 loc52)
		(connected loc52 loc41)
		(connected loc42 loc22)
		(connected loc22 loc42)
		(connected loc42 loc35)
		(connected loc35 loc42)
		(connected loc42 loc37)
		(connected loc37 loc42)
		(connected loc42 loc45)
		(connected loc45 loc42)
		(connected loc42 loc50)
		(connected loc50 loc42)
		(connected loc42 loc59)
		(connected loc59 loc42)
		(connected loc43 loc11)
		(connected loc11 loc43)
		(connected loc43 loc13)
		(connected loc13 loc43)
		(connected loc43 loc28)
		(connected loc28 loc43)
		(connected loc43 loc37)
		(connected loc37 loc43)
		(connected loc43 loc46)
		(connected loc46 loc43)
		(connected loc43 loc51)
		(connected loc51 loc43)
		(connected loc43 loc57)
		(connected loc57 loc43)
		(connected loc44 loc24)
		(connected loc24 loc44)
		(connected loc44 loc31)
		(connected loc31 loc44)
		(connected loc44 loc32)
		(connected loc32 loc44)
		(connected loc44 loc45)
		(connected loc45 loc44)
		(connected loc44 loc53)
		(connected loc53 loc44)
		(connected loc44 loc65)
		(connected loc65 loc44)
		(connected loc44 loc73)
		(connected loc73 loc44)
		(connected loc45 loc28)
		(connected loc28 loc45)
		(connected loc45 loc31)
		(connected loc31 loc45)
		(connected loc45 loc44)
		(connected loc44 loc45)
		(connected loc45 loc46)
		(connected loc46 loc45)
		(connected loc46 loc22)
		(connected loc22 loc46)
		(connected loc46 loc25)
		(connected loc25 loc46)
		(connected loc46 loc42)
		(connected loc42 loc46)
		(connected loc47 loc3)
		(connected loc3 loc47)
		(connected loc47 loc17)
		(connected loc17 loc47)
		(connected loc47 loc25)
		(connected loc25 loc47)
		(connected loc47 loc29)
		(connected loc29 loc47)
		(connected loc47 loc37)
		(connected loc37 loc47)
		(connected loc47 loc44)
		(connected loc44 loc47)
		(connected loc47 loc52)
		(connected loc52 loc47)
		(connected loc48 loc3)
		(connected loc3 loc48)
		(connected loc48 loc25)
		(connected loc25 loc48)
		(connected loc48 loc61)
		(connected loc61 loc48)
		(connected loc48 loc70)
		(connected loc70 loc48)
		(connected loc49 loc38)
		(connected loc38 loc49)
		(connected loc49 loc50)
		(connected loc50 loc49)
		(connected loc49 loc51)
		(connected loc51 loc49)
		(connected loc49 loc54)
		(connected loc54 loc49)
		(connected loc49 loc69)
		(connected loc69 loc49)
		(connected loc50 loc5)
		(connected loc5 loc50)
		(connected loc50 loc40)
		(connected loc40 loc50)
		(connected loc50 loc45)
		(connected loc45 loc50)
		(connected loc50 loc49)
		(connected loc49 loc50)
		(connected loc50 loc56)
		(connected loc56 loc50)
		(connected loc51 loc26)
		(connected loc26 loc51)
		(connected loc51 loc39)
		(connected loc39 loc51)
		(connected loc51 loc48)
		(connected loc48 loc51)
		(connected loc51 loc58)
		(connected loc58 loc51)
		(connected loc51 loc73)
		(connected loc73 loc51)
		(connected loc52 loc20)
		(connected loc20 loc52)
		(connected loc52 loc25)
		(connected loc25 loc52)
		(connected loc52 loc28)
		(connected loc28 loc52)
		(connected loc52 loc29)
		(connected loc29 loc52)
		(connected loc52 loc31)
		(connected loc31 loc52)
		(connected loc52 loc50)
		(connected loc50 loc52)
		(connected loc52 loc71)
		(connected loc71 loc52)
		(connected loc53 loc1)
		(connected loc1 loc53)
		(connected loc53 loc12)
		(connected loc12 loc53)
		(connected loc53 loc18)
		(connected loc18 loc53)
		(connected loc53 loc22)
		(connected loc22 loc53)
		(connected loc53 loc33)
		(connected loc33 loc53)
		(connected loc53 loc42)
		(connected loc42 loc53)
		(connected loc53 loc65)
		(connected loc65 loc53)
		(connected loc54 loc6)
		(connected loc6 loc54)
		(connected loc54 loc18)
		(connected loc18 loc54)
		(connected loc54 loc19)
		(connected loc19 loc54)
		(connected loc54 loc31)
		(connected loc31 loc54)
		(connected loc54 loc36)
		(connected loc36 loc54)
		(connected loc54 loc56)
		(connected loc56 loc54)
		(connected loc55 loc9)
		(connected loc9 loc55)
		(connected loc55 loc11)
		(connected loc11 loc55)
		(connected loc55 loc19)
		(connected loc19 loc55)
		(connected loc55 loc25)
		(connected loc25 loc55)
		(connected loc55 loc56)
		(connected loc56 loc55)
		(connected loc55 loc63)
		(connected loc63 loc55)
		(connected loc56 loc1)
		(connected loc1 loc56)
		(connected loc56 loc34)
		(connected loc34 loc56)
		(connected loc56 loc51)
		(connected loc51 loc56)
		(connected loc56 loc55)
		(connected loc55 loc56)
		(connected loc56 loc64)
		(connected loc64 loc56)
		(connected loc56 loc72)
		(connected loc72 loc56)
		(connected loc57 loc31)
		(connected loc31 loc57)
		(connected loc57 loc50)
		(connected loc50 loc57)
		(connected loc57 loc52)
		(connected loc52 loc57)
		(connected loc58 loc41)
		(connected loc41 loc58)
		(connected loc58 loc44)
		(connected loc44 loc58)
		(connected loc58 loc59)
		(connected loc59 loc58)
		(connected loc58 loc72)
		(connected loc72 loc58)
		(connected loc58 loc74)
		(connected loc74 loc58)
		(connected loc59 loc29)
		(connected loc29 loc59)
		(connected loc59 loc33)
		(connected loc33 loc59)
		(connected loc59 loc60)
		(connected loc60 loc59)
		(connected loc59 loc64)
		(connected loc64 loc59)
		(connected loc59 loc73)
		(connected loc73 loc59)
		(connected loc60 loc12)
		(connected loc12 loc60)
		(connected loc60 loc54)
		(connected loc54 loc60)
		(connected loc60 loc57)
		(connected loc57 loc60)
		(connected loc60 loc64)
		(connected loc64 loc60)
		(connected loc60 loc68)
		(connected loc68 loc60)
		(connected loc61 loc4)
		(connected loc4 loc61)
		(connected loc61 loc14)
		(connected loc14 loc61)
		(connected loc61 loc23)
		(connected loc23 loc61)
		(connected loc61 loc36)
		(connected loc36 loc61)
		(connected loc61 loc40)
		(connected loc40 loc61)
		(connected loc61 loc50)
		(connected loc50 loc61)
		(connected loc61 loc53)
		(connected loc53 loc61)
		(connected loc61 loc72)
		(connected loc72 loc61)
		(connected loc62 loc11)
		(connected loc11 loc62)
		(connected loc62 loc35)
		(connected loc35 loc62)
		(connected loc62 loc43)
		(connected loc43 loc62)
		(connected loc62 loc71)
		(connected loc71 loc62)
		(connected loc63 loc40)
		(connected loc40 loc63)
		(connected loc63 loc64)
		(connected loc64 loc63)
		(connected loc63 loc65)
		(connected loc65 loc63)
		(connected loc64 loc10)
		(connected loc10 loc64)
		(connected loc64 loc14)
		(connected loc14 loc64)
		(connected loc64 loc22)
		(connected loc22 loc64)
		(connected loc64 loc44)
		(connected loc44 loc64)
		(connected loc64 loc45)
		(connected loc45 loc64)
		(connected loc64 loc66)
		(connected loc66 loc64)
		(connected loc64 loc71)
		(connected loc71 loc64)
		(connected loc64 loc73)
		(connected loc73 loc64)
		(connected loc65 loc34)
		(connected loc34 loc65)
		(connected loc65 loc42)
		(connected loc42 loc65)
		(connected loc65 loc68)
		(connected loc68 loc65)
		(connected loc65 loc70)
		(connected loc70 loc65)
		(connected loc65 loc73)
		(connected loc73 loc65)
		(connected loc66 loc12)
		(connected loc12 loc66)
		(connected loc66 loc54)
		(connected loc54 loc66)
		(connected loc66 loc60)
		(connected loc60 loc66)
		(connected loc66 loc71)
		(connected loc71 loc66)
		(connected loc67 loc39)
		(connected loc39 loc67)
		(connected loc67 loc49)
		(connected loc49 loc67)
		(connected loc67 loc52)
		(connected loc52 loc67)
		(connected loc67 loc58)
		(connected loc58 loc67)
		(connected loc67 loc60)
		(connected loc60 loc67)
		(connected loc67 loc61)
		(connected loc61 loc67)
		(connected loc67 loc68)
		(connected loc68 loc67)
		(connected loc68 loc49)
		(connected loc49 loc68)
		(connected loc68 loc60)
		(connected loc60 loc68)
		(connected loc69 loc41)
		(connected loc41 loc69)
		(connected loc69 loc68)
		(connected loc68 loc69)
		(connected loc69 loc73)
		(connected loc73 loc69)
		(connected loc70 loc21)
		(connected loc21 loc70)
		(connected loc70 loc26)
		(connected loc26 loc70)
		(connected loc70 loc54)
		(connected loc54 loc70)
		(connected loc70 loc71)
		(connected loc71 loc70)
		(connected loc71 loc21)
		(connected loc21 loc71)
		(connected loc71 loc28)
		(connected loc28 loc71)
		(connected loc71 loc33)
		(connected loc33 loc71)
		(connected loc71 loc37)
		(connected loc37 loc71)
		(connected loc72 loc26)
		(connected loc26 loc72)
		(connected loc72 loc39)
		(connected loc39 loc72)
		(connected loc73 loc46)
		(connected loc46 loc73)
		(connected loc73 loc49)
		(connected loc49 loc73)
		(connected loc73 loc67)
		(connected loc67 loc73)
		(connected loc73 loc69)
		(connected loc69 loc73)
		(connected loc74 loc14)
		(connected loc14 loc74)
		(connected loc74 loc57)
		(connected loc57 loc74)
		(connected loc74 loc69)
		(connected loc69 loc74)

		(in bar1 loc1)
		(in bar2 loc2)
		(in bar6 loc6)
		(in bar7 loc7)
		(in bar9 loc9)
		(in bar12 loc12)
		(in bar14 loc14)
		(in bar16 loc16)
		(in bar18 loc18)
		(in bar20 loc20)
		(in bar23 loc23)
		(in bar24 loc24)
		(in bar33 loc33)
		(in bar38 loc38)
		(in bar40 loc40)
		(in bar41 loc41)
		(in bar42 loc42)
		(in bar44 loc44)
		(in bar47 loc47)
		(in bar48 loc48)
		(in bar51 loc51)
		(in bar54 loc54)
		(in bar55 loc55)
		(in bar59 loc59)
		(in bar62 loc62)
		(in bar63 loc63)
		(in bar64 loc64)
		(in bar68 loc68)
		(in bar69 loc69)
		(in bar71 loc71)
		(in bar72 loc72)
		(in bar73 loc73)

	)

	(:goal
		(and
			(at loc74)
		)
	)
	(:constraints
		(and
			(preference a1 (sometime (drunk)))
		)
	)
)