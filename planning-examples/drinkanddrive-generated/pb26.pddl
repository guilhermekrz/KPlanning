; Generated by ProblemGenerator - Problem 26 at Mon Nov 28 15:07:21 BRST 2016
(define (problem pb26)
	(:domain drinkanddrive-generated)
	(:requirements :strips :typing :negative-preconditions)
	(:objects
		loc1 loc2 loc3 loc4 loc5 loc6 loc7 loc8 loc9 loc10 loc11 loc12 loc13 loc14 loc15 loc16 loc17 loc18 loc19 loc20 loc21 loc22 loc23 loc24 loc25 loc26 loc27 loc28 loc29 loc30 loc31 loc32 loc33 loc34 loc35 loc36 loc37 loc38 loc39 loc40 loc41 loc42 loc43 loc44 loc45 loc46 loc47 loc48 loc49 loc50 loc51 loc52 loc53 loc54 loc55 loc56 loc57 loc58 loc59 loc60 loc61 loc62 loc63 loc64 loc65 loc66 loc67 loc68 loc69 loc70 loc71 loc72 loc73 loc74 loc75 loc76 - location
		bar1 bar5 bar8 bar11 bar13 bar15 bar16 bar17 bar21 bar22 bar23 bar26 bar27 bar30 bar33 bar37 bar41 bar42 bar45 bar46 bar51 bar52 bar56 bar57 bar61 bar62 bar63 bar67 bar68 bar69 bar71 bar73 bar74 - bar
	)
	(:init
		(at loc1)

		(connected loc15 loc40)
		(connected loc40 loc15)
		(connected loc40 loc64)
		(connected loc64 loc40)
		(connected loc64 loc76)
		(connected loc76 loc64)
		(connected loc76 loc62)
		(connected loc62 loc76)
		(connected loc62 loc21)
		(connected loc21 loc62)
		(connected loc21 loc54)
		(connected loc54 loc21)
		(connected loc54 loc8)
		(connected loc8 loc54)
		(connected loc8 loc73)
		(connected loc73 loc8)
		(connected loc73 loc14)
		(connected loc14 loc73)
		(connected loc14 loc33)
		(connected loc33 loc14)
		(connected loc33 loc34)
		(connected loc34 loc33)
		(connected loc34 loc24)
		(connected loc24 loc34)
		(connected loc76 loc58)
		(connected loc58 loc76)
		(connected loc58 loc56)
		(connected loc56 loc58)
		(connected loc73 loc45)
		(connected loc45 loc73)
		(connected loc45 loc43)
		(connected loc43 loc45)
		(connected loc43 loc31)
		(connected loc31 loc43)
		(connected loc31 loc7)
		(connected loc7 loc31)
		(connected loc7 loc60)
		(connected loc60 loc7)
		(connected loc60 loc4)
		(connected loc4 loc60)
		(connected loc4 loc48)
		(connected loc48 loc4)
		(connected loc48 loc1)
		(connected loc1 loc48)
		(connected loc1 loc27)
		(connected loc27 loc1)
		(connected loc27 loc6)
		(connected loc6 loc27)
		(connected loc60 loc57)
		(connected loc57 loc60)
		(connected loc54 loc69)
		(connected loc69 loc54)
		(connected loc14 loc75)
		(connected loc75 loc14)
		(connected loc40 loc19)
		(connected loc19 loc40)
		(connected loc45 loc22)
		(connected loc22 loc45)
		(connected loc64 loc12)
		(connected loc12 loc64)
		(connected loc12 loc55)
		(connected loc55 loc12)
		(connected loc55 loc25)
		(connected loc25 loc55)
		(connected loc15 loc53)
		(connected loc53 loc15)
		(connected loc53 loc70)
		(connected loc70 loc53)
		(connected loc25 loc3)
		(connected loc3 loc25)
		(connected loc3 loc65)
		(connected loc65 loc3)
		(connected loc65 loc11)
		(connected loc11 loc65)
		(connected loc65 loc66)
		(connected loc66 loc65)
		(connected loc66 loc39)
		(connected loc39 loc66)
		(connected loc39 loc68)
		(connected loc68 loc39)
		(connected loc68 loc35)
		(connected loc35 loc68)
		(connected loc12 loc26)
		(connected loc26 loc12)
		(connected loc64 loc10)
		(connected loc10 loc64)
		(connected loc57 loc44)
		(connected loc44 loc57)
		(connected loc44 loc41)
		(connected loc41 loc44)
		(connected loc41 loc63)
		(connected loc63 loc41)
		(connected loc75 loc61)
		(connected loc61 loc75)
		(connected loc61 loc74)
		(connected loc74 loc61)
		(connected loc3 loc51)
		(connected loc51 loc3)
		(connected loc76 loc37)
		(connected loc37 loc76)
		(connected loc37 loc49)
		(connected loc49 loc37)
		(connected loc49 loc2)
		(connected loc2 loc49)
		(connected loc76 loc42)
		(connected loc42 loc76)
		(connected loc61 loc59)
		(connected loc59 loc61)
		(connected loc59 loc17)
		(connected loc17 loc59)
		(connected loc17 loc5)
		(connected loc5 loc17)
		(connected loc7 loc29)
		(connected loc29 loc7)
		(connected loc42 loc16)
		(connected loc16 loc42)
		(connected loc6 loc23)
		(connected loc23 loc6)
		(connected loc73 loc47)
		(connected loc47 loc73)
		(connected loc68 loc67)
		(connected loc67 loc68)
		(connected loc67 loc71)
		(connected loc71 loc67)
		(connected loc63 loc30)
		(connected loc30 loc63)
		(connected loc69 loc32)
		(connected loc32 loc69)
		(connected loc32 loc13)
		(connected loc13 loc32)
		(connected loc49 loc20)
		(connected loc20 loc49)
		(connected loc53 loc9)
		(connected loc9 loc53)
		(connected loc19 loc38)
		(connected loc38 loc19)
		(connected loc41 loc72)
		(connected loc72 loc41)
		(connected loc64 loc28)
		(connected loc28 loc64)
		(connected loc13 loc18)
		(connected loc18 loc13)
		(connected loc44 loc36)
		(connected loc36 loc44)
		(connected loc13 loc52)
		(connected loc52 loc13)
		(connected loc61 loc50)
		(connected loc50 loc61)
		(connected loc58 loc46)
		(connected loc46 loc58)
		(connected loc1 loc15)
		(connected loc15 loc1)
		(connected loc1 loc18)
		(connected loc18 loc1)
		(connected loc1 loc45)
		(connected loc45 loc1)
		(connected loc1 loc50)
		(connected loc50 loc1)
		(connected loc2 loc21)
		(connected loc21 loc2)
		(connected loc2 loc31)
		(connected loc31 loc2)
		(connected loc2 loc45)
		(connected loc45 loc2)
		(connected loc2 loc73)
		(connected loc73 loc2)
		(connected loc3 loc15)
		(connected loc15 loc3)
		(connected loc3 loc24)
		(connected loc24 loc3)
		(connected loc3 loc56)
		(connected loc56 loc3)
		(connected loc4 loc3)
		(connected loc3 loc4)
		(connected loc4 loc6)
		(connected loc6 loc4)
		(connected loc4 loc10)
		(connected loc10 loc4)
		(connected loc4 loc15)
		(connected loc15 loc4)
		(connected loc4 loc27)
		(connected loc27 loc4)
		(connected loc4 loc30)
		(connected loc30 loc4)
		(connected loc4 loc50)
		(connected loc50 loc4)
		(connected loc5 loc2)
		(connected loc2 loc5)
		(connected loc5 loc8)
		(connected loc8 loc5)
		(connected loc5 loc9)
		(connected loc9 loc5)
		(connected loc5 loc14)
		(connected loc14 loc5)
		(connected loc5 loc22)
		(connected loc22 loc5)
		(connected loc5 loc29)
		(connected loc29 loc5)
		(connected loc5 loc32)
		(connected loc32 loc5)
		(connected loc5 loc36)
		(connected loc36 loc5)
		(connected loc5 loc57)
		(connected loc57 loc5)
		(connected loc6 loc1)
		(connected loc1 loc6)
		(connected loc6 loc2)
		(connected loc2 loc6)
		(connected loc6 loc26)
		(connected loc26 loc6)
		(connected loc6 loc28)
		(connected loc28 loc6)
		(connected loc6 loc31)
		(connected loc31 loc6)
		(connected loc6 loc42)
		(connected loc42 loc6)
		(connected loc6 loc65)
		(connected loc65 loc6)
		(connected loc7 loc4)
		(connected loc4 loc7)
		(connected loc7 loc8)
		(connected loc8 loc7)
		(connected loc7 loc11)
		(connected loc11 loc7)
		(connected loc7 loc20)
		(connected loc20 loc7)
		(connected loc7 loc25)
		(connected loc25 loc7)
		(connected loc7 loc39)
		(connected loc39 loc7)
		(connected loc7 loc51)
		(connected loc51 loc7)
		(connected loc8 loc42)
		(connected loc42 loc8)
		(connected loc8 loc56)
		(connected loc56 loc8)
		(connected loc9 loc7)
		(connected loc7 loc9)
		(connected loc10 loc2)
		(connected loc2 loc10)
		(connected loc10 loc45)
		(connected loc45 loc10)
		(connected loc11 loc32)
		(connected loc32 loc11)
		(connected loc12 loc7)
		(connected loc7 loc12)
		(connected loc12 loc13)
		(connected loc13 loc12)
		(connected loc12 loc21)
		(connected loc21 loc12)
		(connected loc12 loc24)
		(connected loc24 loc12)
		(connected loc12 loc42)
		(connected loc42 loc12)
		(connected loc12 loc43)
		(connected loc43 loc12)
		(connected loc12 loc59)
		(connected loc59 loc12)
		(connected loc13 loc10)
		(connected loc10 loc13)
		(connected loc13 loc14)
		(connected loc14 loc13)
		(connected loc13 loc28)
		(connected loc28 loc13)
		(connected loc13 loc40)
		(connected loc40 loc13)
		(connected loc14 loc12)
		(connected loc12 loc14)
		(connected loc14 loc25)
		(connected loc25 loc14)
		(connected loc14 loc32)
		(connected loc32 loc14)
		(connected loc14 loc68)
		(connected loc68 loc14)
		(connected loc14 loc71)
		(connected loc71 loc14)
		(connected loc15 loc10)
		(connected loc10 loc15)
		(connected loc15 loc47)
		(connected loc47 loc15)
		(connected loc15 loc59)
		(connected loc59 loc15)
		(connected loc15 loc69)
		(connected loc69 loc15)
		(connected loc16 loc6)
		(connected loc6 loc16)
		(connected loc16 loc22)
		(connected loc22 loc16)
		(connected loc16 loc25)
		(connected loc25 loc16)
		(connected loc16 loc47)
		(connected loc47 loc16)
		(connected loc17 loc2)
		(connected loc2 loc17)
		(connected loc17 loc7)
		(connected loc7 loc17)
		(connected loc17 loc12)
		(connected loc12 loc17)
		(connected loc17 loc28)
		(connected loc28 loc17)
		(connected loc17 loc40)
		(connected loc40 loc17)
		(connected loc17 loc55)
		(connected loc55 loc17)
		(connected loc17 loc68)
		(connected loc68 loc17)
		(connected loc18 loc14)
		(connected loc14 loc18)
		(connected loc18 loc17)
		(connected loc17 loc18)
		(connected loc18 loc26)
		(connected loc26 loc18)
		(connected loc18 loc39)
		(connected loc39 loc18)
		(connected loc18 loc45)
		(connected loc45 loc18)
		(connected loc18 loc75)
		(connected loc75 loc18)
		(connected loc19 loc16)
		(connected loc16 loc19)
		(connected loc19 loc62)
		(connected loc62 loc19)
		(connected loc20 loc9)
		(connected loc9 loc20)
		(connected loc20 loc15)
		(connected loc15 loc20)
		(connected loc20 loc18)
		(connected loc18 loc20)
		(connected loc20 loc30)
		(connected loc30 loc20)
		(connected loc20 loc35)
		(connected loc35 loc20)
		(connected loc20 loc73)
		(connected loc73 loc20)
		(connected loc21 loc27)
		(connected loc27 loc21)
		(connected loc21 loc49)
		(connected loc49 loc21)
		(connected loc22 loc2)
		(connected loc2 loc22)
		(connected loc22 loc20)
		(connected loc20 loc22)
		(connected loc22 loc27)
		(connected loc27 loc22)
		(connected loc22 loc40)
		(connected loc40 loc22)
		(connected loc22 loc50)
		(connected loc50 loc22)
		(connected loc23 loc35)
		(connected loc35 loc23)
		(connected loc23 loc47)
		(connected loc47 loc23)
		(connected loc23 loc51)
		(connected loc51 loc23)
		(connected loc23 loc73)
		(connected loc73 loc23)
		(connected loc24 loc8)
		(connected loc8 loc24)
		(connected loc24 loc12)
		(connected loc12 loc24)
		(connected loc24 loc18)
		(connected loc18 loc24)
		(connected loc24 loc27)
		(connected loc27 loc24)
		(connected loc24 loc32)
		(connected loc32 loc24)
		(connected loc24 loc36)
		(connected loc36 loc24)
		(connected loc25 loc5)
		(connected loc5 loc25)
		(connected loc25 loc12)
		(connected loc12 loc25)
		(connected loc25 loc24)
		(connected loc24 loc25)
		(connected loc25 loc26)
		(connected loc26 loc25)
		(connected loc25 loc27)
		(connected loc27 loc25)
		(connected loc25 loc48)
		(connected loc48 loc25)
		(connected loc26 loc10)
		(connected loc10 loc26)
		(connected loc26 loc22)
		(connected loc22 loc26)
		(connected loc26 loc34)
		(connected loc34 loc26)
		(connected loc27 loc1)
		(connected loc1 loc27)
		(connected loc27 loc7)
		(connected loc7 loc27)
		(connected loc27 loc8)
		(connected loc8 loc27)
		(connected loc27 loc13)
		(connected loc13 loc27)
		(connected loc27 loc24)
		(connected loc24 loc27)
		(connected loc27 loc26)
		(connected loc26 loc27)
		(connected loc27 loc30)
		(connected loc30 loc27)
		(connected loc27 loc45)
		(connected loc45 loc27)
		(connected loc28 loc7)
		(connected loc7 loc28)
		(connected loc28 loc22)
		(connected loc22 loc28)
		(connected loc28 loc26)
		(connected loc26 loc28)
		(connected loc28 loc32)
		(connected loc32 loc28)
		(connected loc28 loc42)
		(connected loc42 loc28)
		(connected loc28 loc50)
		(connected loc50 loc28)
		(connected loc28 loc51)
		(connected loc51 loc28)
		(connected loc28 loc58)
		(connected loc58 loc28)
		(connected loc29 loc17)
		(connected loc17 loc29)
		(connected loc29 loc36)
		(connected loc36 loc29)
		(connected loc29 loc39)
		(connected loc39 loc29)
		(connected loc29 loc41)
		(connected loc41 loc29)
		(connected loc29 loc51)
		(connected loc51 loc29)
		(connected loc29 loc74)
		(connected loc74 loc29)
		(connected loc30 loc32)
		(connected loc32 loc30)
		(connected loc30 loc48)
		(connected loc48 loc30)
		(connected loc31 loc24)
		(connected loc24 loc31)
		(connected loc31 loc36)
		(connected loc36 loc31)
		(connected loc31 loc40)
		(connected loc40 loc31)
		(connected loc31 loc41)
		(connected loc41 loc31)
		(connected loc31 loc68)
		(connected loc68 loc31)
		(connected loc32 loc39)
		(connected loc39 loc32)
		(connected loc32 loc63)
		(connected loc63 loc32)
		(connected loc32 loc65)
		(connected loc65 loc32)
		(connected loc33 loc12)
		(connected loc12 loc33)
		(connected loc33 loc24)
		(connected loc24 loc33)
		(connected loc33 loc26)
		(connected loc26 loc33)
		(connected loc33 loc48)
		(connected loc48 loc33)
		(connected loc34 loc26)
		(connected loc26 loc34)
		(connected loc34 loc33)
		(connected loc33 loc34)
		(connected loc34 loc39)
		(connected loc39 loc34)
		(connected loc34 loc43)
		(connected loc43 loc34)
		(connected loc34 loc52)
		(connected loc52 loc34)
		(connected loc34 loc53)
		(connected loc53 loc34)
		(connected loc35 loc22)
		(connected loc22 loc35)
		(connected loc35 loc24)
		(connected loc24 loc35)
		(connected loc35 loc44)
		(connected loc44 loc35)
		(connected loc35 loc46)
		(connected loc46 loc35)
		(connected loc35 loc54)
		(connected loc54 loc35)
		(connected loc35 loc55)
		(connected loc55 loc35)
		(connected loc35 loc56)
		(connected loc56 loc35)
		(connected loc35 loc68)
		(connected loc68 loc35)
		(connected loc35 loc76)
		(connected loc76 loc35)
		(connected loc36 loc6)
		(connected loc6 loc36)
		(connected loc36 loc11)
		(connected loc11 loc36)
		(connected loc36 loc20)
		(connected loc20 loc36)
		(connected loc36 loc55)
		(connected loc55 loc36)
		(connected loc36 loc56)
		(connected loc56 loc36)
		(connected loc37 loc41)
		(connected loc41 loc37)
		(connected loc37 loc72)
		(connected loc72 loc37)
		(connected loc38 loc4)
		(connected loc4 loc38)
		(connected loc38 loc15)
		(connected loc15 loc38)
		(connected loc38 loc28)
		(connected loc28 loc38)
		(connected loc38 loc39)
		(connected loc39 loc38)
		(connected loc38 loc45)
		(connected loc45 loc38)
		(connected loc38 loc51)
		(connected loc51 loc38)
		(connected loc38 loc52)
		(connected loc52 loc38)
		(connected loc38 loc57)
		(connected loc57 loc38)
		(connected loc38 loc66)
		(connected loc66 loc38)
		(connected loc39 loc13)
		(connected loc13 loc39)
		(connected loc39 loc16)
		(connected loc16 loc39)
		(connected loc39 loc21)
		(connected loc21 loc39)
		(connected loc39 loc23)
		(connected loc23 loc39)
		(connected loc39 loc35)
		(connected loc35 loc39)
		(connected loc39 loc46)
		(connected loc46 loc39)
		(connected loc39 loc54)
		(connected loc54 loc39)
		(connected loc39 loc57)
		(connected loc57 loc39)
		(connected loc39 loc61)
		(connected loc61 loc39)
		(connected loc39 loc73)
		(connected loc73 loc39)
		(connected loc39 loc74)
		(connected loc74 loc39)
		(connected loc39 loc76)
		(connected loc76 loc39)
		(connected loc40 loc17)
		(connected loc17 loc40)
		(connected loc40 loc24)
		(connected loc24 loc40)
		(connected loc40 loc48)
		(connected loc48 loc40)
		(connected loc40 loc58)
		(connected loc58 loc40)
		(connected loc41 loc7)
		(connected loc7 loc41)
		(connected loc41 loc33)
		(connected loc33 loc41)
		(connected loc41 loc40)
		(connected loc40 loc41)
		(connected loc41 loc58)
		(connected loc58 loc41)
		(connected loc41 loc65)
		(connected loc65 loc41)
		(connected loc42 loc10)
		(connected loc10 loc42)
		(connected loc42 loc28)
		(connected loc28 loc42)
		(connected loc42 loc40)
		(connected loc40 loc42)
		(connected loc42 loc45)
		(connected loc45 loc42)
		(connected loc42 loc51)
		(connected loc51 loc42)
		(connected loc42 loc61)
		(connected loc61 loc42)
		(connected loc43 loc3)
		(connected loc3 loc43)
		(connected loc43 loc41)
		(connected loc41 loc43)
		(connected loc43 loc47)
		(connected loc47 loc43)
		(connected loc43 loc67)
		(connected loc67 loc43)
		(connected loc43 loc73)
		(connected loc73 loc43)
		(connected loc44 loc25)
		(connected loc25 loc44)
		(connected loc44 loc26)
		(connected loc26 loc44)
		(connected loc44 loc49)
		(connected loc49 loc44)
		(connected loc44 loc63)
		(connected loc63 loc44)
		(connected loc44 loc66)
		(connected loc66 loc44)
		(connected loc45 loc3)
		(connected loc3 loc45)
		(connected loc45 loc28)
		(connected loc28 loc45)
		(connected loc45 loc31)
		(connected loc31 loc45)
		(connected loc45 loc41)
		(connected loc41 loc45)
		(connected loc45 loc72)
		(connected loc72 loc45)
		(connected loc46 loc22)
		(connected loc22 loc46)
		(connected loc46 loc27)
		(connected loc27 loc46)
		(connected loc46 loc39)
		(connected loc39 loc46)
		(connected loc46 loc44)
		(connected loc44 loc46)
		(connected loc46 loc48)
		(connected loc48 loc46)
		(connected loc46 loc59)
		(connected loc59 loc46)
		(connected loc46 loc61)
		(connected loc61 loc46)
		(connected loc47 loc33)
		(connected loc33 loc47)
		(connected loc47 loc50)
		(connected loc50 loc47)
		(connected loc47 loc51)
		(connected loc51 loc47)
		(connected loc47 loc70)
		(connected loc70 loc47)
		(connected loc47 loc73)
		(connected loc73 loc47)
		(connected loc48 loc27)
		(connected loc27 loc48)
		(connected loc48 loc37)
		(connected loc37 loc48)
		(connected loc48 loc46)
		(connected loc46 loc48)
		(connected loc48 loc65)
		(connected loc65 loc48)
		(connected loc49 loc23)
		(connected loc23 loc49)
		(connected loc49 loc38)
		(connected loc38 loc49)
		(connected loc49 loc43)
		(connected loc43 loc49)
		(connected loc50 loc24)
		(connected loc24 loc50)
		(connected loc50 loc33)
		(connected loc33 loc50)
		(connected loc50 loc36)
		(connected loc36 loc50)
		(connected loc50 loc55)
		(connected loc55 loc50)
		(connected loc50 loc59)
		(connected loc59 loc50)
		(connected loc50 loc65)
		(connected loc65 loc50)
		(connected loc51 loc6)
		(connected loc6 loc51)
		(connected loc51 loc12)
		(connected loc12 loc51)
		(connected loc51 loc15)
		(connected loc15 loc51)
		(connected loc51 loc19)
		(connected loc19 loc51)
		(connected loc51 loc20)
		(connected loc20 loc51)
		(connected loc51 loc33)
		(connected loc33 loc51)
		(connected loc51 loc59)
		(connected loc59 loc51)
		(connected loc51 loc67)
		(connected loc67 loc51)
		(connected loc51 loc68)
		(connected loc68 loc51)
		(connected loc52 loc20)
		(connected loc20 loc52)
		(connected loc52 loc26)
		(connected loc26 loc52)
		(connected loc52 loc46)
		(connected loc46 loc52)
		(connected loc52 loc48)
		(connected loc48 loc52)
		(connected loc52 loc53)
		(connected loc53 loc52)
		(connected loc52 loc66)
		(connected loc66 loc52)
		(connected loc53 loc16)
		(connected loc16 loc53)
		(connected loc53 loc29)
		(connected loc29 loc53)
		(connected loc53 loc42)
		(connected loc42 loc53)
		(connected loc53 loc49)
		(connected loc49 loc53)
		(connected loc53 loc60)
		(connected loc60 loc53)
		(connected loc53 loc61)
		(connected loc61 loc53)
		(connected loc54 loc14)
		(connected loc14 loc54)
		(connected loc54 loc56)
		(connected loc56 loc54)
		(connected loc54 loc68)
		(connected loc68 loc54)
		(connected loc54 loc76)
		(connected loc76 loc54)
		(connected loc55 loc47)
		(connected loc47 loc55)
		(connected loc55 loc48)
		(connected loc48 loc55)
		(connected loc55 loc71)
		(connected loc71 loc55)
		(connected loc55 loc73)
		(connected loc73 loc55)
		(connected loc56 loc17)
		(connected loc17 loc56)
		(connected loc56 loc24)
		(connected loc24 loc56)
		(connected loc56 loc32)
		(connected loc32 loc56)
		(connected loc56 loc33)
		(connected loc33 loc56)
		(connected loc56 loc63)
		(connected loc63 loc56)
		(connected loc56 loc66)
		(connected loc66 loc56)
		(connected loc57 loc41)
		(connected loc41 loc57)
		(connected loc57 loc42)
		(connected loc42 loc57)
		(connected loc57 loc49)
		(connected loc49 loc57)
		(connected loc57 loc55)
		(connected loc55 loc57)
		(connected loc57 loc61)
		(connected loc61 loc57)
		(connected loc57 loc62)
		(connected loc62 loc57)
		(connected loc57 loc63)
		(connected loc63 loc57)
		(connected loc57 loc69)
		(connected loc69 loc57)
		(connected loc58 loc15)
		(connected loc15 loc58)
		(connected loc58 loc27)
		(connected loc27 loc58)
		(connected loc58 loc68)
		(connected loc68 loc58)
		(connected loc58 loc70)
		(connected loc70 loc58)
		(connected loc59 loc47)
		(connected loc47 loc59)
		(connected loc59 loc53)
		(connected loc53 loc59)
		(connected loc59 loc62)
		(connected loc62 loc59)
		(connected loc60 loc30)
		(connected loc30 loc60)
		(connected loc60 loc33)
		(connected loc33 loc60)
		(connected loc60 loc41)
		(connected loc41 loc60)
		(connected loc60 loc45)
		(connected loc45 loc60)
		(connected loc60 loc47)
		(connected loc47 loc60)
		(connected loc60 loc49)
		(connected loc49 loc60)
		(connected loc60 loc52)
		(connected loc52 loc60)
		(connected loc60 loc66)
		(connected loc66 loc60)
		(connected loc60 loc75)
		(connected loc75 loc60)
		(connected loc61 loc28)
		(connected loc28 loc61)
		(connected loc61 loc34)
		(connected loc34 loc61)
		(connected loc61 loc46)
		(connected loc46 loc61)
		(connected loc61 loc51)
		(connected loc51 loc61)
		(connected loc61 loc66)
		(connected loc66 loc61)
		(connected loc62 loc19)
		(connected loc19 loc62)
		(connected loc62 loc31)
		(connected loc31 loc62)
		(connected loc62 loc64)
		(connected loc64 loc62)
		(connected loc62 loc66)
		(connected loc66 loc62)
		(connected loc62 loc71)
		(connected loc71 loc62)
		(connected loc62 loc75)
		(connected loc75 loc62)
		(connected loc63 loc23)
		(connected loc23 loc63)
		(connected loc63 loc25)
		(connected loc25 loc63)
		(connected loc63 loc45)
		(connected loc45 loc63)
		(connected loc63 loc57)
		(connected loc57 loc63)
		(connected loc64 loc59)
		(connected loc59 loc64)
		(connected loc64 loc67)
		(connected loc67 loc64)
		(connected loc65 loc16)
		(connected loc16 loc65)
		(connected loc65 loc25)
		(connected loc25 loc65)
		(connected loc65 loc28)
		(connected loc28 loc65)
		(connected loc65 loc31)
		(connected loc31 loc65)
		(connected loc65 loc53)
		(connected loc53 loc65)
		(connected loc65 loc54)
		(connected loc54 loc65)
		(connected loc66 loc8)
		(connected loc8 loc66)
		(connected loc66 loc26)
		(connected loc26 loc66)
		(connected loc67 loc27)
		(connected loc27 loc67)
		(connected loc67 loc37)
		(connected loc37 loc67)
		(connected loc67 loc40)
		(connected loc40 loc67)
		(connected loc67 loc46)
		(connected loc46 loc67)
		(connected loc68 loc32)
		(connected loc32 loc68)
		(connected loc68 loc49)
		(connected loc49 loc68)
		(connected loc68 loc66)
		(connected loc66 loc68)
		(connected loc68 loc69)
		(connected loc69 loc68)
		(connected loc69 loc52)
		(connected loc52 loc69)
		(connected loc69 loc53)
		(connected loc53 loc69)
		(connected loc69 loc55)
		(connected loc55 loc69)
		(connected loc69 loc71)
		(connected loc71 loc69)
		(connected loc69 loc74)
		(connected loc74 loc69)
		(connected loc70 loc44)
		(connected loc44 loc70)
		(connected loc70 loc49)
		(connected loc49 loc70)
		(connected loc71 loc36)
		(connected loc36 loc71)
		(connected loc71 loc47)
		(connected loc47 loc71)
		(connected loc71 loc65)
		(connected loc65 loc71)
		(connected loc72 loc74)
		(connected loc74 loc72)
		(connected loc72 loc76)
		(connected loc76 loc72)
		(connected loc73 loc37)
		(connected loc37 loc73)
		(connected loc73 loc39)
		(connected loc39 loc73)
		(connected loc73 loc56)
		(connected loc56 loc73)
		(connected loc73 loc60)
		(connected loc60 loc73)
		(connected loc73 loc72)
		(connected loc72 loc73)
		(connected loc74 loc33)
		(connected loc33 loc74)
		(connected loc74 loc43)
		(connected loc43 loc74)
		(connected loc74 loc45)
		(connected loc45 loc74)
		(connected loc74 loc75)
		(connected loc75 loc74)
		(connected loc75 loc5)
		(connected loc5 loc75)
		(connected loc75 loc7)
		(connected loc7 loc75)
		(connected loc75 loc19)
		(connected loc19 loc75)
		(connected loc75 loc48)
		(connected loc48 loc75)
		(connected loc75 loc60)
		(connected loc60 loc75)
		(connected loc76 loc61)
		(connected loc61 loc76)

		(in bar1 loc1)
		(in bar5 loc5)
		(in bar8 loc8)
		(in bar11 loc11)
		(in bar13 loc13)
		(in bar15 loc15)
		(in bar16 loc16)
		(in bar17 loc17)
		(in bar21 loc21)
		(in bar22 loc22)
		(in bar23 loc23)
		(in bar26 loc26)
		(in bar27 loc27)
		(in bar30 loc30)
		(in bar33 loc33)
		(in bar37 loc37)
		(in bar41 loc41)
		(in bar42 loc42)
		(in bar45 loc45)
		(in bar46 loc46)
		(in bar51 loc51)
		(in bar52 loc52)
		(in bar56 loc56)
		(in bar57 loc57)
		(in bar61 loc61)
		(in bar62 loc62)
		(in bar63 loc63)
		(in bar67 loc67)
		(in bar68 loc68)
		(in bar69 loc69)
		(in bar71 loc71)
		(in bar73 loc73)
		(in bar74 loc74)

	)

	(:goal
		(and
			(at loc76)
		)
	)
)