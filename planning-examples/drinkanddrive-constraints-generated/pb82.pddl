; Generated by ProblemGenerator - Problem 82 at Sat Nov 26 18:02:21 BRST 2016
(define (problem pb82)
	(:domain drinkanddrive-constraints-generated)
	(:requirements :strips :typing :negative-preconditions)
	(:objects
		loc1 loc2 loc3 loc4 loc5 loc6 loc7 loc8 loc9 loc10 loc11 loc12 loc13 loc14 loc15 loc16 loc17 loc18 loc19 loc20 loc21 loc22 loc23 loc24 loc25 loc26 loc27 loc28 loc29 loc30 loc31 loc32 loc33 loc34 loc35 loc36 loc37 loc38 loc39 loc40 loc41 loc42 loc43 loc44 loc45 loc46 loc47 loc48 loc49 loc50 loc51 loc52 loc53 loc54 loc55 loc56 loc57 loc58 loc59 loc60 loc61 loc62 loc63 loc64 loc65 loc66 loc67 loc68 loc69 loc70 loc71 loc72 loc73 loc74 loc75 loc76 loc77 loc78 loc79 loc80 loc81 loc82 loc83 loc84 loc85 loc86 loc87 - location
		bar1 bar5 bar8 bar11 bar12 bar15 bar16 bar17 bar18 bar23 bar28 bar31 bar33 bar34 bar35 bar37 bar39 bar40 bar41 bar45 bar46 bar51 bar53 bar56 bar61 bar62 bar64 bar67 bar71 bar72 bar75 bar76 bar78 bar79 bar83 bar84 - bar
	)
	(:init
		(at loc1)

		(connected loc43 loc5)
		(connected loc5 loc43)
		(connected loc5 loc76)
		(connected loc76 loc5)
		(connected loc76 loc60)
		(connected loc60 loc76)
		(connected loc60 loc59)
		(connected loc59 loc60)
		(connected loc59 loc34)
		(connected loc34 loc59)
		(connected loc34 loc1)
		(connected loc1 loc34)
		(connected loc1 loc79)
		(connected loc79 loc1)
		(connected loc79 loc14)
		(connected loc14 loc79)
		(connected loc14 loc55)
		(connected loc55 loc14)
		(connected loc55 loc75)
		(connected loc75 loc55)
		(connected loc75 loc65)
		(connected loc65 loc75)
		(connected loc65 loc71)
		(connected loc71 loc65)
		(connected loc65 loc12)
		(connected loc12 loc65)
		(connected loc79 loc58)
		(connected loc58 loc79)
		(connected loc58 loc13)
		(connected loc13 loc58)
		(connected loc13 loc46)
		(connected loc46 loc13)
		(connected loc46 loc67)
		(connected loc67 loc46)
		(connected loc67 loc80)
		(connected loc80 loc67)
		(connected loc80 loc54)
		(connected loc54 loc80)
		(connected loc54 loc41)
		(connected loc41 loc54)
		(connected loc41 loc17)
		(connected loc17 loc41)
		(connected loc17 loc51)
		(connected loc51 loc17)
		(connected loc51 loc35)
		(connected loc35 loc51)
		(connected loc35 loc78)
		(connected loc78 loc35)
		(connected loc78 loc73)
		(connected loc73 loc78)
		(connected loc71 loc84)
		(connected loc84 loc71)
		(connected loc84 loc50)
		(connected loc50 loc84)
		(connected loc58 loc24)
		(connected loc24 loc58)
		(connected loc13 loc42)
		(connected loc42 loc13)
		(connected loc42 loc81)
		(connected loc81 loc42)
		(connected loc81 loc15)
		(connected loc15 loc81)
		(connected loc15 loc9)
		(connected loc9 loc15)
		(connected loc9 loc77)
		(connected loc77 loc9)
		(connected loc51 loc69)
		(connected loc69 loc51)
		(connected loc69 loc52)
		(connected loc52 loc69)
		(connected loc1 loc18)
		(connected loc18 loc1)
		(connected loc18 loc2)
		(connected loc2 loc18)
		(connected loc2 loc83)
		(connected loc83 loc2)
		(connected loc46 loc3)
		(connected loc3 loc46)
		(connected loc52 loc36)
		(connected loc36 loc52)
		(connected loc17 loc44)
		(connected loc44 loc17)
		(connected loc77 loc39)
		(connected loc39 loc77)
		(connected loc39 loc66)
		(connected loc66 loc39)
		(connected loc51 loc31)
		(connected loc31 loc51)
		(connected loc31 loc4)
		(connected loc4 loc31)
		(connected loc4 loc38)
		(connected loc38 loc4)
		(connected loc38 loc86)
		(connected loc86 loc38)
		(connected loc41 loc21)
		(connected loc21 loc41)
		(connected loc84 loc68)
		(connected loc68 loc84)
		(connected loc68 loc74)
		(connected loc74 loc68)
		(connected loc74 loc29)
		(connected loc29 loc74)
		(connected loc51 loc82)
		(connected loc82 loc51)
		(connected loc18 loc72)
		(connected loc72 loc18)
		(connected loc72 loc26)
		(connected loc26 loc72)
		(connected loc26 loc16)
		(connected loc16 loc26)
		(connected loc83 loc20)
		(connected loc20 loc83)
		(connected loc20 loc63)
		(connected loc63 loc20)
		(connected loc63 loc48)
		(connected loc48 loc63)
		(connected loc48 loc6)
		(connected loc6 loc48)
		(connected loc6 loc62)
		(connected loc62 loc6)
		(connected loc63 loc64)
		(connected loc64 loc63)
		(connected loc80 loc7)
		(connected loc7 loc80)
		(connected loc43 loc33)
		(connected loc33 loc43)
		(connected loc79 loc40)
		(connected loc40 loc79)
		(connected loc60 loc11)
		(connected loc11 loc60)
		(connected loc51 loc37)
		(connected loc37 loc51)
		(connected loc36 loc8)
		(connected loc8 loc36)
		(connected loc8 loc30)
		(connected loc30 loc8)
		(connected loc58 loc10)
		(connected loc10 loc58)
		(connected loc62 loc85)
		(connected loc85 loc62)
		(connected loc66 loc19)
		(connected loc19 loc66)
		(connected loc50 loc56)
		(connected loc56 loc50)
		(connected loc72 loc47)
		(connected loc47 loc72)
		(connected loc47 loc57)
		(connected loc57 loc47)
		(connected loc33 loc53)
		(connected loc53 loc33)
		(connected loc68 loc70)
		(connected loc70 loc68)
		(connected loc36 loc28)
		(connected loc28 loc36)
		(connected loc81 loc23)
		(connected loc23 loc81)
		(connected loc57 loc45)
		(connected loc45 loc57)
		(connected loc63 loc61)
		(connected loc61 loc63)
		(connected loc14 loc49)
		(connected loc49 loc14)
		(connected loc33 loc32)
		(connected loc32 loc33)
		(connected loc68 loc27)
		(connected loc27 loc68)
		(connected loc64 loc25)
		(connected loc25 loc64)
		(connected loc7 loc87)
		(connected loc87 loc7)
		(connected loc41 loc22)
		(connected loc22 loc41)
		(connected loc1 loc22)
		(connected loc22 loc1)
		(connected loc1 loc34)
		(connected loc34 loc1)
		(connected loc2 loc12)
		(connected loc12 loc2)
		(connected loc2 loc27)
		(connected loc27 loc2)
		(connected loc2 loc30)
		(connected loc30 loc2)
		(connected loc2 loc49)
		(connected loc49 loc2)
		(connected loc3 loc4)
		(connected loc4 loc3)
		(connected loc4 loc1)
		(connected loc1 loc4)
		(connected loc4 loc6)
		(connected loc6 loc4)
		(connected loc4 loc12)
		(connected loc12 loc4)
		(connected loc4 loc13)
		(connected loc13 loc4)
		(connected loc4 loc25)
		(connected loc25 loc4)
		(connected loc4 loc37)
		(connected loc37 loc4)
		(connected loc4 loc47)
		(connected loc47 loc4)
		(connected loc5 loc7)
		(connected loc7 loc5)
		(connected loc5 loc33)
		(connected loc33 loc5)
		(connected loc5 loc51)
		(connected loc51 loc5)
		(connected loc5 loc60)
		(connected loc60 loc5)
		(connected loc5 loc70)
		(connected loc70 loc5)
		(connected loc5 loc72)
		(connected loc72 loc5)
		(connected loc5 loc83)
		(connected loc83 loc5)
		(connected loc6 loc9)
		(connected loc9 loc6)
		(connected loc6 loc29)
		(connected loc29 loc6)
		(connected loc6 loc34)
		(connected loc34 loc6)
		(connected loc6 loc66)
		(connected loc66 loc6)
		(connected loc6 loc81)
		(connected loc81 loc6)
		(connected loc7 loc9)
		(connected loc9 loc7)
		(connected loc7 loc10)
		(connected loc10 loc7)
		(connected loc7 loc13)
		(connected loc13 loc7)
		(connected loc7 loc27)
		(connected loc27 loc7)
		(connected loc7 loc29)
		(connected loc29 loc7)
		(connected loc7 loc43)
		(connected loc43 loc7)
		(connected loc7 loc59)
		(connected loc59 loc7)
		(connected loc8 loc16)
		(connected loc16 loc8)
		(connected loc8 loc18)
		(connected loc18 loc8)
		(connected loc8 loc20)
		(connected loc20 loc8)
		(connected loc8 loc37)
		(connected loc37 loc8)
		(connected loc8 loc40)
		(connected loc40 loc8)
		(connected loc8 loc42)
		(connected loc42 loc8)
		(connected loc8 loc45)
		(connected loc45 loc8)
		(connected loc8 loc64)
		(connected loc64 loc8)
		(connected loc9 loc1)
		(connected loc1 loc9)
		(connected loc9 loc50)
		(connected loc50 loc9)
		(connected loc9 loc53)
		(connected loc53 loc9)
		(connected loc9 loc67)
		(connected loc67 loc9)
		(connected loc10 loc6)
		(connected loc6 loc10)
		(connected loc10 loc17)
		(connected loc17 loc10)
		(connected loc10 loc27)
		(connected loc27 loc10)
		(connected loc11 loc2)
		(connected loc2 loc11)
		(connected loc11 loc5)
		(connected loc5 loc11)
		(connected loc11 loc16)
		(connected loc16 loc11)
		(connected loc11 loc17)
		(connected loc17 loc11)
		(connected loc11 loc21)
		(connected loc21 loc11)
		(connected loc11 loc50)
		(connected loc50 loc11)
		(connected loc11 loc54)
		(connected loc54 loc11)
		(connected loc11 loc62)
		(connected loc62 loc11)
		(connected loc12 loc4)
		(connected loc4 loc12)
		(connected loc12 loc6)
		(connected loc6 loc12)
		(connected loc12 loc7)
		(connected loc7 loc12)
		(connected loc12 loc16)
		(connected loc16 loc12)
		(connected loc12 loc32)
		(connected loc32 loc12)
		(connected loc12 loc33)
		(connected loc33 loc12)
		(connected loc12 loc47)
		(connected loc47 loc12)
		(connected loc12 loc52)
		(connected loc52 loc12)
		(connected loc13 loc11)
		(connected loc11 loc13)
		(connected loc13 loc12)
		(connected loc12 loc13)
		(connected loc13 loc21)
		(connected loc21 loc13)
		(connected loc13 loc80)
		(connected loc80 loc13)
		(connected loc14 loc31)
		(connected loc31 loc14)
		(connected loc14 loc77)
		(connected loc77 loc14)
		(connected loc15 loc8)
		(connected loc8 loc15)
		(connected loc15 loc24)
		(connected loc24 loc15)
		(connected loc15 loc43)
		(connected loc43 loc15)
		(connected loc15 loc48)
		(connected loc48 loc15)
		(connected loc15 loc64)
		(connected loc64 loc15)
		(connected loc15 loc70)
		(connected loc70 loc15)
		(connected loc15 loc71)
		(connected loc71 loc15)
		(connected loc16 loc4)
		(connected loc4 loc16)
		(connected loc16 loc6)
		(connected loc6 loc16)
		(connected loc16 loc9)
		(connected loc9 loc16)
		(connected loc16 loc12)
		(connected loc12 loc16)
		(connected loc16 loc17)
		(connected loc17 loc16)
		(connected loc16 loc18)
		(connected loc18 loc16)
		(connected loc16 loc33)
		(connected loc33 loc16)
		(connected loc16 loc38)
		(connected loc38 loc16)
		(connected loc16 loc39)
		(connected loc39 loc16)
		(connected loc16 loc44)
		(connected loc44 loc16)
		(connected loc16 loc53)
		(connected loc53 loc16)
		(connected loc17 loc2)
		(connected loc2 loc17)
		(connected loc17 loc19)
		(connected loc19 loc17)
		(connected loc17 loc20)
		(connected loc20 loc17)
		(connected loc17 loc21)
		(connected loc21 loc17)
		(connected loc17 loc73)
		(connected loc73 loc17)
		(connected loc17 loc82)
		(connected loc82 loc17)
		(connected loc18 loc11)
		(connected loc11 loc18)
		(connected loc18 loc31)
		(connected loc31 loc18)
		(connected loc18 loc36)
		(connected loc36 loc18)
		(connected loc18 loc44)
		(connected loc44 loc18)
		(connected loc18 loc55)
		(connected loc55 loc18)
		(connected loc18 loc82)
		(connected loc82 loc18)
		(connected loc19 loc22)
		(connected loc22 loc19)
		(connected loc19 loc32)
		(connected loc32 loc19)
		(connected loc19 loc49)
		(connected loc49 loc19)
		(connected loc19 loc60)
		(connected loc60 loc19)
		(connected loc19 loc61)
		(connected loc61 loc19)
		(connected loc20 loc16)
		(connected loc16 loc20)
		(connected loc20 loc19)
		(connected loc19 loc20)
		(connected loc20 loc36)
		(connected loc36 loc20)
		(connected loc20 loc42)
		(connected loc42 loc20)
		(connected loc20 loc50)
		(connected loc50 loc20)
		(connected loc20 loc80)
		(connected loc80 loc20)
		(connected loc21 loc8)
		(connected loc8 loc21)
		(connected loc21 loc9)
		(connected loc9 loc21)
		(connected loc21 loc19)
		(connected loc19 loc21)
		(connected loc21 loc25)
		(connected loc25 loc21)
		(connected loc21 loc30)
		(connected loc30 loc21)
		(connected loc21 loc35)
		(connected loc35 loc21)
		(connected loc21 loc37)
		(connected loc37 loc21)
		(connected loc21 loc43)
		(connected loc43 loc21)
		(connected loc21 loc45)
		(connected loc45 loc21)
		(connected loc21 loc63)
		(connected loc63 loc21)
		(connected loc22 loc20)
		(connected loc20 loc22)
		(connected loc22 loc42)
		(connected loc42 loc22)
		(connected loc22 loc51)
		(connected loc51 loc22)
		(connected loc22 loc66)
		(connected loc66 loc22)
		(connected loc23 loc6)
		(connected loc6 loc23)
		(connected loc23 loc32)
		(connected loc32 loc23)
		(connected loc23 loc40)
		(connected loc40 loc23)
		(connected loc23 loc47)
		(connected loc47 loc23)
		(connected loc23 loc48)
		(connected loc48 loc23)
		(connected loc23 loc58)
		(connected loc58 loc23)
		(connected loc23 loc61)
		(connected loc61 loc23)
		(connected loc23 loc70)
		(connected loc70 loc23)
		(connected loc24 loc14)
		(connected loc14 loc24)
		(connected loc24 loc15)
		(connected loc15 loc24)
		(connected loc24 loc20)
		(connected loc20 loc24)
		(connected loc24 loc35)
		(connected loc35 loc24)
		(connected loc24 loc47)
		(connected loc47 loc24)
		(connected loc25 loc6)
		(connected loc6 loc25)
		(connected loc25 loc33)
		(connected loc33 loc25)
		(connected loc25 loc53)
		(connected loc53 loc25)
		(connected loc25 loc56)
		(connected loc56 loc25)
		(connected loc26 loc21)
		(connected loc21 loc26)
		(connected loc26 loc32)
		(connected loc32 loc26)
		(connected loc26 loc58)
		(connected loc58 loc26)
		(connected loc26 loc61)
		(connected loc61 loc26)
		(connected loc26 loc70)
		(connected loc70 loc26)
		(connected loc27 loc23)
		(connected loc23 loc27)
		(connected loc27 loc33)
		(connected loc33 loc27)
		(connected loc27 loc35)
		(connected loc35 loc27)
		(connected loc27 loc40)
		(connected loc40 loc27)
		(connected loc27 loc60)
		(connected loc60 loc27)
		(connected loc27 loc65)
		(connected loc65 loc27)
		(connected loc27 loc70)
		(connected loc70 loc27)
		(connected loc28 loc14)
		(connected loc14 loc28)
		(connected loc28 loc58)
		(connected loc58 loc28)
		(connected loc29 loc13)
		(connected loc13 loc29)
		(connected loc29 loc25)
		(connected loc25 loc29)
		(connected loc29 loc27)
		(connected loc27 loc29)
		(connected loc29 loc49)
		(connected loc49 loc29)
		(connected loc29 loc50)
		(connected loc50 loc29)
		(connected loc29 loc67)
		(connected loc67 loc29)
		(connected loc29 loc69)
		(connected loc69 loc29)
		(connected loc30 loc28)
		(connected loc28 loc30)
		(connected loc30 loc58)
		(connected loc58 loc30)
		(connected loc30 loc63)
		(connected loc63 loc30)
		(connected loc30 loc66)
		(connected loc66 loc30)
		(connected loc30 loc74)
		(connected loc74 loc30)
		(connected loc31 loc21)
		(connected loc21 loc31)
		(connected loc31 loc25)
		(connected loc25 loc31)
		(connected loc31 loc26)
		(connected loc26 loc31)
		(connected loc31 loc47)
		(connected loc47 loc31)
		(connected loc31 loc51)
		(connected loc51 loc31)
		(connected loc31 loc67)
		(connected loc67 loc31)
		(connected loc31 loc87)
		(connected loc87 loc31)
		(connected loc32 loc22)
		(connected loc22 loc32)
		(connected loc32 loc35)
		(connected loc35 loc32)
		(connected loc32 loc36)
		(connected loc36 loc32)
		(connected loc32 loc43)
		(connected loc43 loc32)
		(connected loc32 loc65)
		(connected loc65 loc32)
		(connected loc33 loc31)
		(connected loc31 loc33)
		(connected loc33 loc34)
		(connected loc34 loc33)
		(connected loc33 loc46)
		(connected loc46 loc33)
		(connected loc33 loc55)
		(connected loc55 loc33)
		(connected loc33 loc62)
		(connected loc62 loc33)
		(connected loc34 loc6)
		(connected loc6 loc34)
		(connected loc34 loc7)
		(connected loc7 loc34)
		(connected loc34 loc31)
		(connected loc31 loc34)
		(connected loc34 loc35)
		(connected loc35 loc34)
		(connected loc34 loc40)
		(connected loc40 loc34)
		(connected loc34 loc41)
		(connected loc41 loc34)
		(connected loc34 loc53)
		(connected loc53 loc34)
		(connected loc34 loc65)
		(connected loc65 loc34)
		(connected loc34 loc66)
		(connected loc66 loc34)
		(connected loc35 loc20)
		(connected loc20 loc35)
		(connected loc35 loc25)
		(connected loc25 loc35)
		(connected loc35 loc33)
		(connected loc33 loc35)
		(connected loc35 loc43)
		(connected loc43 loc35)
		(connected loc35 loc69)
		(connected loc69 loc35)
		(connected loc36 loc10)
		(connected loc10 loc36)
		(connected loc36 loc12)
		(connected loc12 loc36)
		(connected loc36 loc18)
		(connected loc18 loc36)
		(connected loc36 loc32)
		(connected loc32 loc36)
		(connected loc36 loc37)
		(connected loc37 loc36)
		(connected loc36 loc38)
		(connected loc38 loc36)
		(connected loc36 loc66)
		(connected loc66 loc36)
		(connected loc36 loc75)
		(connected loc75 loc36)
		(connected loc37 loc26)
		(connected loc26 loc37)
		(connected loc37 loc35)
		(connected loc35 loc37)
		(connected loc37 loc39)
		(connected loc39 loc37)
		(connected loc37 loc59)
		(connected loc59 loc37)
		(connected loc37 loc78)
		(connected loc78 loc37)
		(connected loc38 loc2)
		(connected loc2 loc38)
		(connected loc38 loc16)
		(connected loc16 loc38)
		(connected loc38 loc17)
		(connected loc17 loc38)
		(connected loc38 loc26)
		(connected loc26 loc38)
		(connected loc38 loc28)
		(connected loc28 loc38)
		(connected loc38 loc37)
		(connected loc37 loc38)
		(connected loc38 loc40)
		(connected loc40 loc38)
		(connected loc38 loc72)
		(connected loc72 loc38)
		(connected loc38 loc76)
		(connected loc76 loc38)
		(connected loc39 loc4)
		(connected loc4 loc39)
		(connected loc39 loc18)
		(connected loc18 loc39)
		(connected loc39 loc21)
		(connected loc21 loc39)
		(connected loc39 loc27)
		(connected loc27 loc39)
		(connected loc39 loc32)
		(connected loc32 loc39)
		(connected loc39 loc70)
		(connected loc70 loc39)
		(connected loc39 loc71)
		(connected loc71 loc39)
		(connected loc40 loc2)
		(connected loc2 loc40)
		(connected loc40 loc13)
		(connected loc13 loc40)
		(connected loc40 loc14)
		(connected loc14 loc40)
		(connected loc40 loc33)
		(connected loc33 loc40)
		(connected loc40 loc34)
		(connected loc34 loc40)
		(connected loc40 loc46)
		(connected loc46 loc40)
		(connected loc40 loc51)
		(connected loc51 loc40)
		(connected loc40 loc54)
		(connected loc54 loc40)
		(connected loc41 loc2)
		(connected loc2 loc41)
		(connected loc41 loc29)
		(connected loc29 loc41)
		(connected loc41 loc61)
		(connected loc61 loc41)
		(connected loc41 loc79)
		(connected loc79 loc41)
		(connected loc42 loc9)
		(connected loc9 loc42)
		(connected loc42 loc33)
		(connected loc33 loc42)
		(connected loc42 loc49)
		(connected loc49 loc42)
		(connected loc42 loc55)
		(connected loc55 loc42)
		(connected loc42 loc56)
		(connected loc56 loc42)
		(connected loc42 loc59)
		(connected loc59 loc42)
		(connected loc42 loc73)
		(connected loc73 loc42)
		(connected loc43 loc8)
		(connected loc8 loc43)
		(connected loc43 loc18)
		(connected loc18 loc43)
		(connected loc43 loc29)
		(connected loc29 loc43)
		(connected loc43 loc31)
		(connected loc31 loc43)
		(connected loc43 loc47)
		(connected loc47 loc43)
		(connected loc43 loc75)
		(connected loc75 loc43)
		(connected loc44 loc18)
		(connected loc18 loc44)
		(connected loc44 loc28)
		(connected loc28 loc44)
		(connected loc44 loc47)
		(connected loc47 loc44)
		(connected loc44 loc53)
		(connected loc53 loc44)
		(connected loc44 loc62)
		(connected loc62 loc44)
		(connected loc45 loc34)
		(connected loc34 loc45)
		(connected loc45 loc47)
		(connected loc47 loc45)
		(connected loc45 loc62)
		(connected loc62 loc45)
		(connected loc45 loc80)
		(connected loc80 loc45)
		(connected loc46 loc28)
		(connected loc28 loc46)
		(connected loc46 loc39)
		(connected loc39 loc46)
		(connected loc46 loc48)
		(connected loc48 loc46)
		(connected loc46 loc73)
		(connected loc73 loc46)
		(connected loc46 loc78)
		(connected loc78 loc46)
		(connected loc46 loc79)
		(connected loc79 loc46)
		(connected loc47 loc14)
		(connected loc14 loc47)
		(connected loc47 loc33)
		(connected loc33 loc47)
		(connected loc47 loc37)
		(connected loc37 loc47)
		(connected loc47 loc42)
		(connected loc42 loc47)
		(connected loc47 loc49)
		(connected loc49 loc47)
		(connected loc47 loc66)
		(connected loc66 loc47)
		(connected loc48 loc14)
		(connected loc14 loc48)
		(connected loc48 loc39)
		(connected loc39 loc48)
		(connected loc48 loc42)
		(connected loc42 loc48)
		(connected loc48 loc49)
		(connected loc49 loc48)
		(connected loc48 loc65)
		(connected loc65 loc48)
		(connected loc48 loc76)
		(connected loc76 loc48)
		(connected loc49 loc15)
		(connected loc15 loc49)
		(connected loc49 loc33)
		(connected loc33 loc49)
		(connected loc49 loc51)
		(connected loc51 loc49)
		(connected loc49 loc54)
		(connected loc54 loc49)
		(connected loc49 loc64)
		(connected loc64 loc49)
		(connected loc49 loc74)
		(connected loc74 loc49)
		(connected loc49 loc79)
		(connected loc79 loc49)
		(connected loc50 loc16)
		(connected loc16 loc50)
		(connected loc50 loc41)
		(connected loc41 loc50)
		(connected loc50 loc47)
		(connected loc47 loc50)
		(connected loc50 loc74)
		(connected loc74 loc50)
		(connected loc50 loc87)
		(connected loc87 loc50)
		(connected loc51 loc21)
		(connected loc21 loc51)
		(connected loc51 loc33)
		(connected loc33 loc51)
		(connected loc51 loc66)
		(connected loc66 loc51)
		(connected loc51 loc67)
		(connected loc67 loc51)
		(connected loc52 loc4)
		(connected loc4 loc52)
		(connected loc52 loc18)
		(connected loc18 loc52)
		(connected loc52 loc23)
		(connected loc23 loc52)
		(connected loc52 loc24)
		(connected loc24 loc52)
		(connected loc52 loc26)
		(connected loc26 loc52)
		(connected loc52 loc38)
		(connected loc38 loc52)
		(connected loc52 loc45)
		(connected loc45 loc52)
		(connected loc52 loc73)
		(connected loc73 loc52)
		(connected loc52 loc77)
		(connected loc77 loc52)
		(connected loc53 loc54)
		(connected loc54 loc53)
		(connected loc53 loc66)
		(connected loc66 loc53)
		(connected loc53 loc69)
		(connected loc69 loc53)
		(connected loc54 loc26)
		(connected loc26 loc54)
		(connected loc54 loc43)
		(connected loc43 loc54)
		(connected loc54 loc51)
		(connected loc51 loc54)
		(connected loc54 loc83)
		(connected loc83 loc54)
		(connected loc55 loc1)
		(connected loc1 loc55)
		(connected loc55 loc21)
		(connected loc21 loc55)
		(connected loc55 loc45)
		(connected loc45 loc55)
		(connected loc55 loc47)
		(connected loc47 loc55)
		(connected loc55 loc52)
		(connected loc52 loc55)
		(connected loc55 loc58)
		(connected loc58 loc55)
		(connected loc55 loc62)
		(connected loc62 loc55)
		(connected loc55 loc80)
		(connected loc80 loc55)
		(connected loc56 loc34)
		(connected loc34 loc56)
		(connected loc56 loc36)
		(connected loc36 loc56)
		(connected loc56 loc44)
		(connected loc44 loc56)
		(connected loc56 loc45)
		(connected loc45 loc56)
		(connected loc57 loc7)
		(connected loc7 loc57)
		(connected loc57 loc53)
		(connected loc53 loc57)
		(connected loc57 loc56)
		(connected loc56 loc57)
		(connected loc57 loc64)
		(connected loc64 loc57)
		(connected loc57 loc69)
		(connected loc69 loc57)
		(connected loc57 loc72)
		(connected loc72 loc57)
		(connected loc57 loc84)
		(connected loc84 loc57)
		(connected loc58 loc3)
		(connected loc3 loc58)
		(connected loc58 loc15)
		(connected loc15 loc58)
		(connected loc58 loc23)
		(connected loc23 loc58)
		(connected loc58 loc31)
		(connected loc31 loc58)
		(connected loc58 loc37)
		(connected loc37 loc58)
		(connected loc58 loc38)
		(connected loc38 loc58)
		(connected loc58 loc50)
		(connected loc50 loc58)
		(connected loc59 loc3)
		(connected loc3 loc59)
		(connected loc59 loc13)
		(connected loc13 loc59)
		(connected loc59 loc56)
		(connected loc56 loc59)
		(connected loc59 loc83)
		(connected loc83 loc59)
		(connected loc59 loc84)
		(connected loc84 loc59)
		(connected loc60 loc53)
		(connected loc53 loc60)
		(connected loc60 loc54)
		(connected loc54 loc60)
		(connected loc60 loc61)
		(connected loc61 loc60)
		(connected loc60 loc64)
		(connected loc64 loc60)
		(connected loc60 loc65)
		(connected loc65 loc60)
		(connected loc61 loc41)
		(connected loc41 loc61)
		(connected loc61 loc45)
		(connected loc45 loc61)
		(connected loc61 loc52)
		(connected loc52 loc61)
		(connected loc61 loc53)
		(connected loc53 loc61)
		(connected loc61 loc60)
		(connected loc60 loc61)
		(connected loc61 loc66)
		(connected loc66 loc61)
		(connected loc61 loc81)
		(connected loc81 loc61)
		(connected loc62 loc7)
		(connected loc7 loc62)
		(connected loc62 loc18)
		(connected loc18 loc62)
		(connected loc62 loc41)
		(connected loc41 loc62)
		(connected loc62 loc79)
		(connected loc79 loc62)
		(connected loc62 loc84)
		(connected loc84 loc62)
		(connected loc62 loc87)
		(connected loc87 loc62)
		(connected loc63 loc37)
		(connected loc37 loc63)
		(connected loc63 loc69)
		(connected loc69 loc63)
		(connected loc63 loc73)
		(connected loc73 loc63)
		(connected loc64 loc9)
		(connected loc9 loc64)
		(connected loc64 loc20)
		(connected loc20 loc64)
		(connected loc64 loc28)
		(connected loc28 loc64)
		(connected loc64 loc32)
		(connected loc32 loc64)
		(connected loc64 loc40)
		(connected loc40 loc64)
		(connected loc64 loc41)
		(connected loc41 loc64)
		(connected loc64 loc59)
		(connected loc59 loc64)
		(connected loc64 loc66)
		(connected loc66 loc64)
		(connected loc64 loc84)
		(connected loc84 loc64)
		(connected loc65 loc1)
		(connected loc1 loc65)
		(connected loc65 loc19)
		(connected loc19 loc65)
		(connected loc65 loc34)
		(connected loc34 loc65)
		(connected loc65 loc46)
		(connected loc46 loc65)
		(connected loc65 loc54)
		(connected loc54 loc65)
		(connected loc65 loc58)
		(connected loc58 loc65)
		(connected loc65 loc59)
		(connected loc59 loc65)
		(connected loc65 loc62)
		(connected loc62 loc65)
		(connected loc65 loc87)
		(connected loc87 loc65)
		(connected loc66 loc14)
		(connected loc14 loc66)
		(connected loc66 loc34)
		(connected loc34 loc66)
		(connected loc66 loc35)
		(connected loc35 loc66)
		(connected loc66 loc36)
		(connected loc36 loc66)
		(connected loc66 loc38)
		(connected loc38 loc66)
		(connected loc66 loc42)
		(connected loc42 loc66)
		(connected loc66 loc73)
		(connected loc73 loc66)
		(connected loc66 loc74)
		(connected loc74 loc66)
		(connected loc66 loc80)
		(connected loc80 loc66)
		(connected loc67 loc24)
		(connected loc24 loc67)
		(connected loc67 loc32)
		(connected loc32 loc67)
		(connected loc67 loc36)
		(connected loc36 loc67)
		(connected loc67 loc43)
		(connected loc43 loc67)
		(connected loc67 loc71)
		(connected loc71 loc67)
		(connected loc67 loc85)
		(connected loc85 loc67)
		(connected loc68 loc17)
		(connected loc17 loc68)
		(connected loc68 loc57)
		(connected loc57 loc68)
		(connected loc68 loc64)
		(connected loc64 loc68)
		(connected loc68 loc78)
		(connected loc78 loc68)
		(connected loc68 loc84)
		(connected loc84 loc68)
		(connected loc69 loc13)
		(connected loc13 loc69)
		(connected loc69 loc58)
		(connected loc58 loc69)
		(connected loc69 loc72)
		(connected loc72 loc69)
		(connected loc69 loc73)
		(connected loc73 loc69)
		(connected loc69 loc77)
		(connected loc77 loc69)
		(connected loc69 loc84)
		(connected loc84 loc69)
		(connected loc70 loc23)
		(connected loc23 loc70)
		(connected loc70 loc46)
		(connected loc46 loc70)
		(connected loc70 loc65)
		(connected loc65 loc70)
		(connected loc70 loc79)
		(connected loc79 loc70)
		(connected loc71 loc67)
		(connected loc67 loc71)
		(connected loc71 loc69)
		(connected loc69 loc71)
		(connected loc72 loc24)
		(connected loc24 loc72)
		(connected loc72 loc30)
		(connected loc30 loc72)
		(connected loc72 loc46)
		(connected loc46 loc72)
		(connected loc72 loc49)
		(connected loc49 loc72)
		(connected loc72 loc57)
		(connected loc57 loc72)
		(connected loc72 loc87)
		(connected loc87 loc72)
		(connected loc73 loc50)
		(connected loc50 loc73)
		(connected loc74 loc24)
		(connected loc24 loc74)
		(connected loc74 loc47)
		(connected loc47 loc74)
		(connected loc74 loc48)
		(connected loc48 loc74)
		(connected loc74 loc81)
		(connected loc81 loc74)
		(connected loc75 loc6)
		(connected loc6 loc75)
		(connected loc75 loc10)
		(connected loc10 loc75)
		(connected loc75 loc16)
		(connected loc16 loc75)
		(connected loc75 loc60)
		(connected loc60 loc75)
		(connected loc75 loc71)
		(connected loc71 loc75)
		(connected loc75 loc81)
		(connected loc81 loc75)
		(connected loc76 loc29)
		(connected loc29 loc76)
		(connected loc76 loc34)
		(connected loc34 loc76)
		(connected loc76 loc40)
		(connected loc40 loc76)
		(connected loc76 loc59)
		(connected loc59 loc76)
		(connected loc76 loc68)
		(connected loc68 loc76)
		(connected loc76 loc77)
		(connected loc77 loc76)
		(connected loc77 loc8)
		(connected loc8 loc77)
		(connected loc77 loc15)
		(connected loc15 loc77)
		(connected loc77 loc69)
		(connected loc69 loc77)
		(connected loc77 loc80)
		(connected loc80 loc77)
		(connected loc78 loc35)
		(connected loc35 loc78)
		(connected loc78 loc64)
		(connected loc64 loc78)
		(connected loc78 loc69)
		(connected loc69 loc78)
		(connected loc79 loc39)
		(connected loc39 loc79)
		(connected loc80 loc45)
		(connected loc45 loc80)
		(connected loc80 loc52)
		(connected loc52 loc80)
		(connected loc80 loc59)
		(connected loc59 loc80)
		(connected loc80 loc73)
		(connected loc73 loc80)
		(connected loc81 loc31)
		(connected loc31 loc81)
		(connected loc81 loc52)
		(connected loc52 loc81)
		(connected loc81 loc57)
		(connected loc57 loc81)
		(connected loc81 loc61)
		(connected loc61 loc81)
		(connected loc81 loc79)
		(connected loc79 loc81)
		(connected loc81 loc86)
		(connected loc86 loc81)
		(connected loc82 loc38)
		(connected loc38 loc82)
		(connected loc82 loc81)
		(connected loc81 loc82)
		(connected loc82 loc87)
		(connected loc87 loc82)
		(connected loc83 loc28)
		(connected loc28 loc83)
		(connected loc83 loc36)
		(connected loc36 loc83)
		(connected loc83 loc58)
		(connected loc58 loc83)
		(connected loc83 loc66)
		(connected loc66 loc83)
		(connected loc83 loc74)
		(connected loc74 loc83)
		(connected loc83 loc79)
		(connected loc79 loc83)
		(connected loc84 loc69)
		(connected loc69 loc84)
		(connected loc84 loc74)
		(connected loc74 loc84)
		(connected loc84 loc75)
		(connected loc75 loc84)
		(connected loc84 loc80)
		(connected loc80 loc84)
		(connected loc85 loc45)
		(connected loc45 loc85)
		(connected loc85 loc51)
		(connected loc51 loc85)
		(connected loc85 loc52)
		(connected loc52 loc85)
		(connected loc86 loc18)
		(connected loc18 loc86)
		(connected loc86 loc47)
		(connected loc47 loc86)
		(connected loc86 loc77)
		(connected loc77 loc86)
		(connected loc86 loc82)
		(connected loc82 loc86)
		(connected loc86 loc83)
		(connected loc83 loc86)
		(connected loc86 loc85)
		(connected loc85 loc86)
		(connected loc87 loc47)
		(connected loc47 loc87)
		(connected loc87 loc62)
		(connected loc62 loc87)
		(connected loc87 loc67)
		(connected loc67 loc87)
		(connected loc87 loc81)
		(connected loc81 loc87)

		(in bar1 loc1)
		(in bar5 loc5)
		(in bar8 loc8)
		(in bar11 loc11)
		(in bar12 loc12)
		(in bar15 loc15)
		(in bar16 loc16)
		(in bar17 loc17)
		(in bar18 loc18)
		(in bar23 loc23)
		(in bar28 loc28)
		(in bar31 loc31)
		(in bar33 loc33)
		(in bar34 loc34)
		(in bar35 loc35)
		(in bar37 loc37)
		(in bar39 loc39)
		(in bar40 loc40)
		(in bar41 loc41)
		(in bar45 loc45)
		(in bar46 loc46)
		(in bar51 loc51)
		(in bar53 loc53)
		(in bar56 loc56)
		(in bar61 loc61)
		(in bar62 loc62)
		(in bar64 loc64)
		(in bar67 loc67)
		(in bar71 loc71)
		(in bar72 loc72)
		(in bar75 loc75)
		(in bar76 loc76)
		(in bar78 loc78)
		(in bar79 loc79)
		(in bar83 loc83)
		(in bar84 loc84)

	)

	(:goal
		(and
			(at loc87)
		)
	)
	(:constraints
		(and
			(preference a1 (sometime (drunk)))
		)
	)
)