; Generated by ProblemGenerator - Problem 31 at Mon Nov 28 15:07:21 BRST 2016
(define (problem pb31)
	(:domain drinkanddrive-generated)
	(:requirements :strips :typing :negative-preconditions)
	(:objects
		loc1 loc2 loc3 loc4 loc5 loc6 loc7 loc8 loc9 loc10 loc11 loc12 loc13 loc14 loc15 loc16 loc17 loc18 loc19 loc20 loc21 loc22 loc23 loc24 loc25 loc26 loc27 loc28 loc29 loc30 loc31 loc32 loc33 loc34 loc35 loc36 loc37 loc38 loc39 loc40 loc41 loc42 loc43 loc44 loc45 loc46 loc47 loc48 loc49 loc50 loc51 loc52 loc53 loc54 loc55 loc56 loc57 loc58 loc59 loc60 loc61 loc62 loc63 loc64 loc65 loc66 loc67 loc68 loc69 loc70 loc71 loc72 loc73 loc74 loc75 loc76 loc77 loc78 loc79 loc80 loc81 - location
		bar2 bar3 bar5 bar6 bar10 bar11 bar13 bar15 bar16 bar24 bar25 bar26 bar28 bar29 bar31 bar34 bar35 bar36 bar38 bar39 bar43 bar44 bar45 bar46 bar48 bar51 bar52 bar54 bar56 bar57 bar58 bar61 bar63 bar64 bar65 bar67 bar69 bar70 bar72 bar73 bar74 bar78 bar80 - bar
	)
	(:init
		(at loc1)

		(connected loc17 loc81)
		(connected loc81 loc17)
		(connected loc81 loc47)
		(connected loc47 loc81)
		(connected loc47 loc46)
		(connected loc46 loc47)
		(connected loc46 loc61)
		(connected loc61 loc46)
		(connected loc61 loc10)
		(connected loc10 loc61)
		(connected loc10 loc75)
		(connected loc75 loc10)
		(connected loc75 loc68)
		(connected loc68 loc75)
		(connected loc68 loc49)
		(connected loc49 loc68)
		(connected loc49 loc32)
		(connected loc32 loc49)
		(connected loc32 loc43)
		(connected loc43 loc32)
		(connected loc43 loc59)
		(connected loc59 loc43)
		(connected loc59 loc60)
		(connected loc60 loc59)
		(connected loc60 loc53)
		(connected loc53 loc60)
		(connected loc53 loc16)
		(connected loc16 loc53)
		(connected loc16 loc13)
		(connected loc13 loc16)
		(connected loc13 loc70)
		(connected loc70 loc13)
		(connected loc70 loc6)
		(connected loc6 loc70)
		(connected loc46 loc14)
		(connected loc14 loc46)
		(connected loc14 loc45)
		(connected loc45 loc14)
		(connected loc45 loc5)
		(connected loc5 loc45)
		(connected loc5 loc37)
		(connected loc37 loc5)
		(connected loc37 loc12)
		(connected loc12 loc37)
		(connected loc12 loc27)
		(connected loc27 loc12)
		(connected loc27 loc35)
		(connected loc35 loc27)
		(connected loc75 loc33)
		(connected loc33 loc75)
		(connected loc33 loc72)
		(connected loc72 loc33)
		(connected loc72 loc74)
		(connected loc74 loc72)
		(connected loc74 loc9)
		(connected loc9 loc74)
		(connected loc9 loc41)
		(connected loc41 loc9)
		(connected loc41 loc28)
		(connected loc28 loc41)
		(connected loc72 loc39)
		(connected loc39 loc72)
		(connected loc39 loc26)
		(connected loc26 loc39)
		(connected loc27 loc50)
		(connected loc50 loc27)
		(connected loc5 loc52)
		(connected loc52 loc5)
		(connected loc68 loc56)
		(connected loc56 loc68)
		(connected loc56 loc44)
		(connected loc44 loc56)
		(connected loc44 loc38)
		(connected loc38 loc44)
		(connected loc33 loc7)
		(connected loc7 loc33)
		(connected loc41 loc30)
		(connected loc30 loc41)
		(connected loc30 loc40)
		(connected loc40 loc30)
		(connected loc7 loc36)
		(connected loc36 loc7)
		(connected loc70 loc42)
		(connected loc42 loc70)
		(connected loc42 loc29)
		(connected loc29 loc42)
		(connected loc29 loc51)
		(connected loc51 loc29)
		(connected loc51 loc20)
		(connected loc20 loc51)
		(connected loc16 loc48)
		(connected loc48 loc16)
		(connected loc5 loc11)
		(connected loc11 loc5)
		(connected loc17 loc15)
		(connected loc15 loc17)
		(connected loc11 loc19)
		(connected loc19 loc11)
		(connected loc19 loc57)
		(connected loc57 loc19)
		(connected loc9 loc1)
		(connected loc1 loc9)
		(connected loc1 loc77)
		(connected loc77 loc1)
		(connected loc77 loc54)
		(connected loc54 loc77)
		(connected loc54 loc78)
		(connected loc78 loc54)
		(connected loc78 loc62)
		(connected loc62 loc78)
		(connected loc75 loc22)
		(connected loc22 loc75)
		(connected loc9 loc24)
		(connected loc24 loc9)
		(connected loc81 loc65)
		(connected loc65 loc81)
		(connected loc74 loc64)
		(connected loc64 loc74)
		(connected loc57 loc55)
		(connected loc55 loc57)
		(connected loc81 loc21)
		(connected loc21 loc81)
		(connected loc1 loc34)
		(connected loc34 loc1)
		(connected loc34 loc80)
		(connected loc80 loc34)
		(connected loc74 loc58)
		(connected loc58 loc74)
		(connected loc42 loc76)
		(connected loc76 loc42)
		(connected loc76 loc3)
		(connected loc3 loc76)
		(connected loc74 loc66)
		(connected loc66 loc74)
		(connected loc48 loc18)
		(connected loc18 loc48)
		(connected loc35 loc23)
		(connected loc23 loc35)
		(connected loc29 loc8)
		(connected loc8 loc29)
		(connected loc29 loc69)
		(connected loc69 loc29)
		(connected loc21 loc4)
		(connected loc4 loc21)
		(connected loc51 loc2)
		(connected loc2 loc51)
		(connected loc2 loc73)
		(connected loc73 loc2)
		(connected loc49 loc79)
		(connected loc79 loc49)
		(connected loc34 loc25)
		(connected loc25 loc34)
		(connected loc80 loc31)
		(connected loc31 loc80)
		(connected loc81 loc71)
		(connected loc71 loc81)
		(connected loc33 loc63)
		(connected loc63 loc33)
		(connected loc2 loc67)
		(connected loc67 loc2)
		(connected loc1 loc4)
		(connected loc4 loc1)
		(connected loc1 loc6)
		(connected loc6 loc1)
		(connected loc1 loc24)
		(connected loc24 loc1)
		(connected loc1 loc27)
		(connected loc27 loc1)
		(connected loc1 loc35)
		(connected loc35 loc1)
		(connected loc1 loc45)
		(connected loc45 loc1)
		(connected loc2 loc29)
		(connected loc29 loc2)
		(connected loc2 loc60)
		(connected loc60 loc2)
		(connected loc2 loc74)
		(connected loc74 loc2)
		(connected loc2 loc75)
		(connected loc75 loc2)
		(connected loc3 loc21)
		(connected loc21 loc3)
		(connected loc3 loc31)
		(connected loc31 loc3)
		(connected loc3 loc33)
		(connected loc33 loc3)
		(connected loc3 loc47)
		(connected loc47 loc3)
		(connected loc4 loc9)
		(connected loc9 loc4)
		(connected loc4 loc27)
		(connected loc27 loc4)
		(connected loc4 loc52)
		(connected loc52 loc4)
		(connected loc4 loc55)
		(connected loc55 loc4)
		(connected loc5 loc1)
		(connected loc1 loc5)
		(connected loc5 loc10)
		(connected loc10 loc5)
		(connected loc5 loc35)
		(connected loc35 loc5)
		(connected loc6 loc12)
		(connected loc12 loc6)
		(connected loc6 loc20)
		(connected loc20 loc6)
		(connected loc6 loc30)
		(connected loc30 loc6)
		(connected loc6 loc78)
		(connected loc78 loc6)
		(connected loc7 loc27)
		(connected loc27 loc7)
		(connected loc7 loc46)
		(connected loc46 loc7)
		(connected loc7 loc56)
		(connected loc56 loc7)
		(connected loc7 loc69)
		(connected loc69 loc7)
		(connected loc8 loc9)
		(connected loc9 loc8)
		(connected loc8 loc25)
		(connected loc25 loc8)
		(connected loc8 loc31)
		(connected loc31 loc8)
		(connected loc8 loc57)
		(connected loc57 loc8)
		(connected loc8 loc65)
		(connected loc65 loc8)
		(connected loc8 loc71)
		(connected loc71 loc8)
		(connected loc8 loc80)
		(connected loc80 loc8)
		(connected loc9 loc6)
		(connected loc6 loc9)
		(connected loc9 loc10)
		(connected loc10 loc9)
		(connected loc9 loc14)
		(connected loc14 loc9)
		(connected loc9 loc16)
		(connected loc16 loc9)
		(connected loc9 loc20)
		(connected loc20 loc9)
		(connected loc9 loc32)
		(connected loc32 loc9)
		(connected loc9 loc42)
		(connected loc42 loc9)
		(connected loc9 loc46)
		(connected loc46 loc9)
		(connected loc10 loc2)
		(connected loc2 loc10)
		(connected loc10 loc8)
		(connected loc8 loc10)
		(connected loc10 loc12)
		(connected loc12 loc10)
		(connected loc10 loc17)
		(connected loc17 loc10)
		(connected loc10 loc21)
		(connected loc21 loc10)
		(connected loc10 loc23)
		(connected loc23 loc10)
		(connected loc10 loc32)
		(connected loc32 loc10)
		(connected loc10 loc42)
		(connected loc42 loc10)
		(connected loc10 loc50)
		(connected loc50 loc10)
		(connected loc10 loc56)
		(connected loc56 loc10)
		(connected loc11 loc6)
		(connected loc6 loc11)
		(connected loc11 loc10)
		(connected loc10 loc11)
		(connected loc11 loc22)
		(connected loc22 loc11)
		(connected loc11 loc28)
		(connected loc28 loc11)
		(connected loc11 loc30)
		(connected loc30 loc11)
		(connected loc11 loc33)
		(connected loc33 loc11)
		(connected loc11 loc34)
		(connected loc34 loc11)
		(connected loc11 loc42)
		(connected loc42 loc11)
		(connected loc12 loc4)
		(connected loc4 loc12)
		(connected loc12 loc26)
		(connected loc26 loc12)
		(connected loc12 loc29)
		(connected loc29 loc12)
		(connected loc12 loc43)
		(connected loc43 loc12)
		(connected loc13 loc21)
		(connected loc21 loc13)
		(connected loc13 loc23)
		(connected loc23 loc13)
		(connected loc14 loc8)
		(connected loc8 loc14)
		(connected loc14 loc16)
		(connected loc16 loc14)
		(connected loc14 loc24)
		(connected loc24 loc14)
		(connected loc14 loc74)
		(connected loc74 loc14)
		(connected loc14 loc78)
		(connected loc78 loc14)
		(connected loc15 loc8)
		(connected loc8 loc15)
		(connected loc15 loc13)
		(connected loc13 loc15)
		(connected loc15 loc38)
		(connected loc38 loc15)
		(connected loc15 loc43)
		(connected loc43 loc15)
		(connected loc15 loc72)
		(connected loc72 loc15)
		(connected loc15 loc75)
		(connected loc75 loc15)
		(connected loc16 loc22)
		(connected loc22 loc16)
		(connected loc17 loc3)
		(connected loc3 loc17)
		(connected loc17 loc14)
		(connected loc14 loc17)
		(connected loc17 loc18)
		(connected loc18 loc17)
		(connected loc17 loc22)
		(connected loc22 loc17)
		(connected loc17 loc24)
		(connected loc24 loc17)
		(connected loc17 loc26)
		(connected loc26 loc17)
		(connected loc17 loc29)
		(connected loc29 loc17)
		(connected loc18 loc4)
		(connected loc4 loc18)
		(connected loc18 loc16)
		(connected loc16 loc18)
		(connected loc18 loc37)
		(connected loc37 loc18)
		(connected loc18 loc44)
		(connected loc44 loc18)
		(connected loc18 loc48)
		(connected loc48 loc18)
		(connected loc19 loc10)
		(connected loc10 loc19)
		(connected loc19 loc64)
		(connected loc64 loc19)
		(connected loc20 loc24)
		(connected loc24 loc20)
		(connected loc20 loc27)
		(connected loc27 loc20)
		(connected loc20 loc33)
		(connected loc33 loc20)
		(connected loc20 loc42)
		(connected loc42 loc20)
		(connected loc20 loc43)
		(connected loc43 loc20)
		(connected loc21 loc6)
		(connected loc6 loc21)
		(connected loc21 loc10)
		(connected loc10 loc21)
		(connected loc21 loc22)
		(connected loc22 loc21)
		(connected loc21 loc37)
		(connected loc37 loc21)
		(connected loc21 loc44)
		(connected loc44 loc21)
		(connected loc21 loc47)
		(connected loc47 loc21)
		(connected loc21 loc57)
		(connected loc57 loc21)
		(connected loc21 loc69)
		(connected loc69 loc21)
		(connected loc22 loc50)
		(connected loc50 loc22)
		(connected loc22 loc54)
		(connected loc54 loc22)
		(connected loc22 loc57)
		(connected loc57 loc22)
		(connected loc22 loc71)
		(connected loc71 loc22)
		(connected loc23 loc3)
		(connected loc3 loc23)
		(connected loc23 loc11)
		(connected loc11 loc23)
		(connected loc23 loc29)
		(connected loc29 loc23)
		(connected loc23 loc30)
		(connected loc30 loc23)
		(connected loc23 loc31)
		(connected loc31 loc23)
		(connected loc23 loc32)
		(connected loc32 loc23)
		(connected loc23 loc34)
		(connected loc34 loc23)
		(connected loc23 loc37)
		(connected loc37 loc23)
		(connected loc23 loc68)
		(connected loc68 loc23)
		(connected loc23 loc81)
		(connected loc81 loc23)
		(connected loc24 loc55)
		(connected loc55 loc24)
		(connected loc24 loc56)
		(connected loc56 loc24)
		(connected loc24 loc59)
		(connected loc59 loc24)
		(connected loc24 loc61)
		(connected loc61 loc24)
		(connected loc25 loc9)
		(connected loc9 loc25)
		(connected loc25 loc17)
		(connected loc17 loc25)
		(connected loc25 loc28)
		(connected loc28 loc25)
		(connected loc25 loc47)
		(connected loc47 loc25)
		(connected loc25 loc59)
		(connected loc59 loc25)
		(connected loc26 loc16)
		(connected loc16 loc26)
		(connected loc26 loc17)
		(connected loc17 loc26)
		(connected loc26 loc25)
		(connected loc25 loc26)
		(connected loc26 loc28)
		(connected loc28 loc26)
		(connected loc26 loc39)
		(connected loc39 loc26)
		(connected loc26 loc53)
		(connected loc53 loc26)
		(connected loc26 loc55)
		(connected loc55 loc26)
		(connected loc26 loc59)
		(connected loc59 loc26)
		(connected loc26 loc66)
		(connected loc66 loc26)
		(connected loc26 loc73)
		(connected loc73 loc26)
		(connected loc27 loc16)
		(connected loc16 loc27)
		(connected loc27 loc17)
		(connected loc17 loc27)
		(connected loc27 loc24)
		(connected loc24 loc27)
		(connected loc27 loc25)
		(connected loc25 loc27)
		(connected loc28 loc25)
		(connected loc25 loc28)
		(connected loc28 loc32)
		(connected loc32 loc28)
		(connected loc28 loc43)
		(connected loc43 loc28)
		(connected loc28 loc47)
		(connected loc47 loc28)
		(connected loc28 loc81)
		(connected loc81 loc28)
		(connected loc29 loc20)
		(connected loc20 loc29)
		(connected loc29 loc35)
		(connected loc35 loc29)
		(connected loc29 loc41)
		(connected loc41 loc29)
		(connected loc29 loc43)
		(connected loc43 loc29)
		(connected loc29 loc59)
		(connected loc59 loc29)
		(connected loc29 loc64)
		(connected loc64 loc29)
		(connected loc29 loc66)
		(connected loc66 loc29)
		(connected loc30 loc24)
		(connected loc24 loc30)
		(connected loc30 loc28)
		(connected loc28 loc30)
		(connected loc30 loc64)
		(connected loc64 loc30)
		(connected loc31 loc6)
		(connected loc6 loc31)
		(connected loc31 loc41)
		(connected loc41 loc31)
		(connected loc31 loc60)
		(connected loc60 loc31)
		(connected loc32 loc14)
		(connected loc14 loc32)
		(connected loc32 loc21)
		(connected loc21 loc32)
		(connected loc32 loc29)
		(connected loc29 loc32)
		(connected loc32 loc36)
		(connected loc36 loc32)
		(connected loc32 loc58)
		(connected loc58 loc32)
		(connected loc32 loc71)
		(connected loc71 loc32)
		(connected loc33 loc3)
		(connected loc3 loc33)
		(connected loc33 loc21)
		(connected loc21 loc33)
		(connected loc33 loc26)
		(connected loc26 loc33)
		(connected loc33 loc48)
		(connected loc48 loc33)
		(connected loc33 loc54)
		(connected loc54 loc33)
		(connected loc34 loc8)
		(connected loc8 loc34)
		(connected loc34 loc23)
		(connected loc23 loc34)
		(connected loc34 loc24)
		(connected loc24 loc34)
		(connected loc34 loc26)
		(connected loc26 loc34)
		(connected loc34 loc29)
		(connected loc29 loc34)
		(connected loc34 loc53)
		(connected loc53 loc34)
		(connected loc34 loc60)
		(connected loc60 loc34)
		(connected loc35 loc28)
		(connected loc28 loc35)
		(connected loc35 loc73)
		(connected loc73 loc35)
		(connected loc35 loc80)
		(connected loc80 loc35)
		(connected loc36 loc18)
		(connected loc18 loc36)
		(connected loc36 loc29)
		(connected loc29 loc36)
		(connected loc36 loc41)
		(connected loc41 loc36)
		(connected loc36 loc56)
		(connected loc56 loc36)
		(connected loc36 loc62)
		(connected loc62 loc36)
		(connected loc37 loc11)
		(connected loc11 loc37)
		(connected loc37 loc20)
		(connected loc20 loc37)
		(connected loc37 loc34)
		(connected loc34 loc37)
		(connected loc37 loc50)
		(connected loc50 loc37)
		(connected loc37 loc52)
		(connected loc52 loc37)
		(connected loc38 loc3)
		(connected loc3 loc38)
		(connected loc38 loc4)
		(connected loc4 loc38)
		(connected loc38 loc6)
		(connected loc6 loc38)
		(connected loc38 loc42)
		(connected loc42 loc38)
		(connected loc38 loc53)
		(connected loc53 loc38)
		(connected loc38 loc54)
		(connected loc54 loc38)
		(connected loc38 loc56)
		(connected loc56 loc38)
		(connected loc38 loc57)
		(connected loc57 loc38)
		(connected loc38 loc72)
		(connected loc72 loc38)
		(connected loc39 loc4)
		(connected loc4 loc39)
		(connected loc39 loc49)
		(connected loc49 loc39)
		(connected loc39 loc72)
		(connected loc72 loc39)
		(connected loc39 loc74)
		(connected loc74 loc39)
		(connected loc40 loc24)
		(connected loc24 loc40)
		(connected loc40 loc45)
		(connected loc45 loc40)
		(connected loc40 loc56)
		(connected loc56 loc40)
		(connected loc40 loc64)
		(connected loc64 loc40)
		(connected loc41 loc1)
		(connected loc1 loc41)
		(connected loc41 loc14)
		(connected loc14 loc41)
		(connected loc41 loc20)
		(connected loc20 loc41)
		(connected loc41 loc34)
		(connected loc34 loc41)
		(connected loc41 loc38)
		(connected loc38 loc41)
		(connected loc41 loc40)
		(connected loc40 loc41)
		(connected loc41 loc42)
		(connected loc42 loc41)
		(connected loc42 loc13)
		(connected loc13 loc42)
		(connected loc42 loc23)
		(connected loc23 loc42)
		(connected loc42 loc24)
		(connected loc24 loc42)
		(connected loc42 loc40)
		(connected loc40 loc42)
		(connected loc42 loc43)
		(connected loc43 loc42)
		(connected loc42 loc47)
		(connected loc47 loc42)
		(connected loc42 loc60)
		(connected loc60 loc42)
		(connected loc42 loc70)
		(connected loc70 loc42)
		(connected loc43 loc12)
		(connected loc12 loc43)
		(connected loc43 loc13)
		(connected loc13 loc43)
		(connected loc43 loc18)
		(connected loc18 loc43)
		(connected loc43 loc26)
		(connected loc26 loc43)
		(connected loc43 loc28)
		(connected loc28 loc43)
		(connected loc43 loc41)
		(connected loc41 loc43)
		(connected loc43 loc49)
		(connected loc49 loc43)
		(connected loc43 loc61)
		(connected loc61 loc43)
		(connected loc43 loc62)
		(connected loc62 loc43)
		(connected loc43 loc68)
		(connected loc68 loc43)
		(connected loc43 loc75)
		(connected loc75 loc43)
		(connected loc44 loc2)
		(connected loc2 loc44)
		(connected loc44 loc11)
		(connected loc11 loc44)
		(connected loc44 loc33)
		(connected loc33 loc44)
		(connected loc44 loc37)
		(connected loc37 loc44)
		(connected loc44 loc49)
		(connected loc49 loc44)
		(connected loc44 loc65)
		(connected loc65 loc44)
		(connected loc45 loc7)
		(connected loc7 loc45)
		(connected loc45 loc9)
		(connected loc9 loc45)
		(connected loc45 loc28)
		(connected loc28 loc45)
		(connected loc45 loc69)
		(connected loc69 loc45)
		(connected loc45 loc80)
		(connected loc80 loc45)
		(connected loc46 loc3)
		(connected loc3 loc46)
		(connected loc46 loc12)
		(connected loc12 loc46)
		(connected loc46 loc33)
		(connected loc33 loc46)
		(connected loc46 loc36)
		(connected loc36 loc46)
		(connected loc46 loc50)
		(connected loc50 loc46)
		(connected loc46 loc57)
		(connected loc57 loc46)
		(connected loc47 loc2)
		(connected loc2 loc47)
		(connected loc47 loc10)
		(connected loc10 loc47)
		(connected loc47 loc12)
		(connected loc12 loc47)
		(connected loc47 loc21)
		(connected loc21 loc47)
		(connected loc47 loc50)
		(connected loc50 loc47)
		(connected loc47 loc73)
		(connected loc73 loc47)
		(connected loc47 loc75)
		(connected loc75 loc47)
		(connected loc48 loc14)
		(connected loc14 loc48)
		(connected loc48 loc34)
		(connected loc34 loc48)
		(connected loc48 loc39)
		(connected loc39 loc48)
		(connected loc48 loc52)
		(connected loc52 loc48)
		(connected loc48 loc74)
		(connected loc74 loc48)
		(connected loc48 loc81)
		(connected loc81 loc48)
		(connected loc49 loc14)
		(connected loc14 loc49)
		(connected loc49 loc24)
		(connected loc24 loc49)
		(connected loc49 loc51)
		(connected loc51 loc49)
		(connected loc50 loc33)
		(connected loc33 loc50)
		(connected loc50 loc35)
		(connected loc35 loc50)
		(connected loc50 loc42)
		(connected loc42 loc50)
		(connected loc50 loc51)
		(connected loc51 loc50)
		(connected loc50 loc52)
		(connected loc52 loc50)
		(connected loc50 loc62)
		(connected loc62 loc50)
		(connected loc51 loc1)
		(connected loc1 loc51)
		(connected loc51 loc28)
		(connected loc28 loc51)
		(connected loc51 loc44)
		(connected loc44 loc51)
		(connected loc51 loc48)
		(connected loc48 loc51)
		(connected loc51 loc55)
		(connected loc55 loc51)
		(connected loc51 loc76)
		(connected loc76 loc51)
		(connected loc52 loc62)
		(connected loc62 loc52)
		(connected loc53 loc30)
		(connected loc30 loc53)
		(connected loc53 loc35)
		(connected loc35 loc53)
		(connected loc53 loc36)
		(connected loc36 loc53)
		(connected loc53 loc58)
		(connected loc58 loc53)
		(connected loc53 loc64)
		(connected loc64 loc53)
		(connected loc54 loc3)
		(connected loc3 loc54)
		(connected loc54 loc8)
		(connected loc8 loc54)
		(connected loc54 loc22)
		(connected loc22 loc54)
		(connected loc54 loc23)
		(connected loc23 loc54)
		(connected loc54 loc45)
		(connected loc45 loc54)
		(connected loc54 loc49)
		(connected loc49 loc54)
		(connected loc54 loc66)
		(connected loc66 loc54)
		(connected loc54 loc73)
		(connected loc73 loc54)
		(connected loc55 loc2)
		(connected loc2 loc55)
		(connected loc55 loc28)
		(connected loc28 loc55)
		(connected loc55 loc31)
		(connected loc31 loc55)
		(connected loc55 loc32)
		(connected loc32 loc55)
		(connected loc55 loc51)
		(connected loc51 loc55)
		(connected loc55 loc75)
		(connected loc75 loc55)
		(connected loc55 loc78)
		(connected loc78 loc55)
		(connected loc56 loc49)
		(connected loc49 loc56)
		(connected loc57 loc35)
		(connected loc35 loc57)
		(connected loc57 loc42)
		(connected loc42 loc57)
		(connected loc57 loc64)
		(connected loc64 loc57)
		(connected loc57 loc67)
		(connected loc67 loc57)
		(connected loc57 loc73)
		(connected loc73 loc57)
		(connected loc57 loc81)
		(connected loc81 loc57)
		(connected loc58 loc2)
		(connected loc2 loc58)
		(connected loc58 loc23)
		(connected loc23 loc58)
		(connected loc58 loc61)
		(connected loc61 loc58)
		(connected loc58 loc70)
		(connected loc70 loc58)
		(connected loc58 loc78)
		(connected loc78 loc58)
		(connected loc59 loc46)
		(connected loc46 loc59)
		(connected loc59 loc48)
		(connected loc48 loc59)
		(connected loc59 loc54)
		(connected loc54 loc59)
		(connected loc59 loc55)
		(connected loc55 loc59)
		(connected loc59 loc62)
		(connected loc62 loc59)
		(connected loc60 loc25)
		(connected loc25 loc60)
		(connected loc60 loc26)
		(connected loc26 loc60)
		(connected loc60 loc37)
		(connected loc37 loc60)
		(connected loc60 loc41)
		(connected loc41 loc60)
		(connected loc60 loc44)
		(connected loc44 loc60)
		(connected loc60 loc58)
		(connected loc58 loc60)
		(connected loc60 loc59)
		(connected loc59 loc60)
		(connected loc60 loc72)
		(connected loc72 loc60)
		(connected loc61 loc8)
		(connected loc8 loc61)
		(connected loc61 loc11)
		(connected loc11 loc61)
		(connected loc61 loc27)
		(connected loc27 loc61)
		(connected loc61 loc45)
		(connected loc45 loc61)
		(connected loc61 loc54)
		(connected loc54 loc61)
		(connected loc61 loc59)
		(connected loc59 loc61)
		(connected loc61 loc63)
		(connected loc63 loc61)
		(connected loc61 loc74)
		(connected loc74 loc61)
		(connected loc62 loc37)
		(connected loc37 loc62)
		(connected loc62 loc40)
		(connected loc40 loc62)
		(connected loc62 loc50)
		(connected loc50 loc62)
		(connected loc62 loc59)
		(connected loc59 loc62)
		(connected loc62 loc80)
		(connected loc80 loc62)
		(connected loc63 loc8)
		(connected loc8 loc63)
		(connected loc63 loc30)
		(connected loc30 loc63)
		(connected loc63 loc33)
		(connected loc33 loc63)
		(connected loc63 loc64)
		(connected loc64 loc63)
		(connected loc63 loc74)
		(connected loc74 loc63)
		(connected loc64 loc20)
		(connected loc20 loc64)
		(connected loc64 loc29)
		(connected loc29 loc64)
		(connected loc64 loc38)
		(connected loc38 loc64)
		(connected loc64 loc54)
		(connected loc54 loc64)
		(connected loc64 loc56)
		(connected loc56 loc64)
		(connected loc64 loc57)
		(connected loc57 loc64)
		(connected loc64 loc71)
		(connected loc71 loc64)
		(connected loc65 loc5)
		(connected loc5 loc65)
		(connected loc65 loc12)
		(connected loc12 loc65)
		(connected loc65 loc18)
		(connected loc18 loc65)
		(connected loc65 loc20)
		(connected loc20 loc65)
		(connected loc65 loc61)
		(connected loc61 loc65)
		(connected loc65 loc66)
		(connected loc66 loc65)
		(connected loc65 loc69)
		(connected loc69 loc65)
		(connected loc65 loc79)
		(connected loc79 loc65)
		(connected loc66 loc52)
		(connected loc52 loc66)
		(connected loc66 loc61)
		(connected loc61 loc66)
		(connected loc66 loc65)
		(connected loc65 loc66)
		(connected loc66 loc67)
		(connected loc67 loc66)
		(connected loc66 loc69)
		(connected loc69 loc66)
		(connected loc66 loc80)
		(connected loc80 loc66)
		(connected loc67 loc6)
		(connected loc6 loc67)
		(connected loc67 loc16)
		(connected loc16 loc67)
		(connected loc67 loc24)
		(connected loc24 loc67)
		(connected loc67 loc38)
		(connected loc38 loc67)
		(connected loc67 loc41)
		(connected loc41 loc67)
		(connected loc67 loc42)
		(connected loc42 loc67)
		(connected loc67 loc44)
		(connected loc44 loc67)
		(connected loc67 loc46)
		(connected loc46 loc67)
		(connected loc67 loc49)
		(connected loc49 loc67)
		(connected loc67 loc50)
		(connected loc50 loc67)
		(connected loc67 loc54)
		(connected loc54 loc67)
		(connected loc67 loc59)
		(connected loc59 loc67)
		(connected loc67 loc62)
		(connected loc62 loc67)
		(connected loc67 loc72)
		(connected loc72 loc67)
		(connected loc67 loc73)
		(connected loc73 loc67)
		(connected loc67 loc74)
		(connected loc74 loc67)
		(connected loc68 loc14)
		(connected loc14 loc68)
		(connected loc68 loc20)
		(connected loc20 loc68)
		(connected loc68 loc76)
		(connected loc76 loc68)
		(connected loc69 loc5)
		(connected loc5 loc69)
		(connected loc69 loc31)
		(connected loc31 loc69)
		(connected loc69 loc50)
		(connected loc50 loc69)
		(connected loc69 loc64)
		(connected loc64 loc69)
		(connected loc70 loc8)
		(connected loc8 loc70)
		(connected loc70 loc29)
		(connected loc29 loc70)
		(connected loc70 loc30)
		(connected loc30 loc70)
		(connected loc70 loc32)
		(connected loc32 loc70)
		(connected loc70 loc48)
		(connected loc48 loc70)
		(connected loc70 loc49)
		(connected loc49 loc70)
		(connected loc70 loc52)
		(connected loc52 loc70)
		(connected loc70 loc61)
		(connected loc61 loc70)
		(connected loc70 loc79)
		(connected loc79 loc70)
		(connected loc71 loc37)
		(connected loc37 loc71)
		(connected loc71 loc50)
		(connected loc50 loc71)
		(connected loc71 loc74)
		(connected loc74 loc71)
		(connected loc72 loc35)
		(connected loc35 loc72)
		(connected loc72 loc55)
		(connected loc55 loc72)
		(connected loc72 loc56)
		(connected loc56 loc72)
		(connected loc72 loc60)
		(connected loc60 loc72)
		(connected loc72 loc80)
		(connected loc80 loc72)
		(connected loc73 loc35)
		(connected loc35 loc73)
		(connected loc73 loc48)
		(connected loc48 loc73)
		(connected loc73 loc57)
		(connected loc57 loc73)
		(connected loc73 loc59)
		(connected loc59 loc73)
		(connected loc73 loc66)
		(connected loc66 loc73)
		(connected loc73 loc81)
		(connected loc81 loc73)
		(connected loc74 loc17)
		(connected loc17 loc74)
		(connected loc74 loc62)
		(connected loc62 loc74)
		(connected loc75 loc35)
		(connected loc35 loc75)
		(connected loc75 loc43)
		(connected loc43 loc75)
		(connected loc75 loc66)
		(connected loc66 loc75)
		(connected loc76 loc39)
		(connected loc39 loc76)
		(connected loc76 loc47)
		(connected loc47 loc76)
		(connected loc76 loc72)
		(connected loc72 loc76)
		(connected loc77 loc29)
		(connected loc29 loc77)
		(connected loc77 loc32)
		(connected loc32 loc77)
		(connected loc77 loc37)
		(connected loc37 loc77)
		(connected loc77 loc50)
		(connected loc50 loc77)
		(connected loc77 loc80)
		(connected loc80 loc77)
		(connected loc78 loc25)
		(connected loc25 loc78)
		(connected loc78 loc45)
		(connected loc45 loc78)
		(connected loc78 loc48)
		(connected loc48 loc78)
		(connected loc78 loc49)
		(connected loc49 loc78)
		(connected loc78 loc59)
		(connected loc59 loc78)
		(connected loc78 loc63)
		(connected loc63 loc78)
		(connected loc78 loc70)
		(connected loc70 loc78)
		(connected loc78 loc79)
		(connected loc79 loc78)
		(connected loc78 loc80)
		(connected loc80 loc78)
		(connected loc79 loc28)
		(connected loc28 loc79)
		(connected loc79 loc65)
		(connected loc65 loc79)
		(connected loc79 loc71)
		(connected loc71 loc79)
		(connected loc80 loc22)
		(connected loc22 loc80)
		(connected loc80 loc26)
		(connected loc26 loc80)
		(connected loc80 loc38)
		(connected loc38 loc80)
		(connected loc80 loc68)
		(connected loc68 loc80)
		(connected loc80 loc78)
		(connected loc78 loc80)
		(connected loc81 loc48)
		(connected loc48 loc81)
		(connected loc81 loc68)
		(connected loc68 loc81)
		(connected loc81 loc78)
		(connected loc78 loc81)

		(in bar2 loc2)
		(in bar3 loc3)
		(in bar5 loc5)
		(in bar6 loc6)
		(in bar10 loc10)
		(in bar11 loc11)
		(in bar13 loc13)
		(in bar15 loc15)
		(in bar16 loc16)
		(in bar24 loc24)
		(in bar25 loc25)
		(in bar26 loc26)
		(in bar28 loc28)
		(in bar29 loc29)
		(in bar31 loc31)
		(in bar34 loc34)
		(in bar35 loc35)
		(in bar36 loc36)
		(in bar38 loc38)
		(in bar39 loc39)
		(in bar43 loc43)
		(in bar44 loc44)
		(in bar45 loc45)
		(in bar46 loc46)
		(in bar48 loc48)
		(in bar51 loc51)
		(in bar52 loc52)
		(in bar54 loc54)
		(in bar56 loc56)
		(in bar57 loc57)
		(in bar58 loc58)
		(in bar61 loc61)
		(in bar63 loc63)
		(in bar64 loc64)
		(in bar65 loc65)
		(in bar67 loc67)
		(in bar69 loc69)
		(in bar70 loc70)
		(in bar72 loc72)
		(in bar73 loc73)
		(in bar74 loc74)
		(in bar78 loc78)
		(in bar80 loc80)

	)

	(:goal
		(and
			(at loc81)
		)
	)
)