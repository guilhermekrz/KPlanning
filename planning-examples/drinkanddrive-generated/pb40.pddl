; Generated by ProblemGenerator - Problem 40 at Mon Nov 28 15:07:22 BRST 2016
(define (problem pb40)
	(:domain drinkanddrive-generated)
	(:requirements :strips :typing :negative-preconditions)
	(:objects
		loc1 loc2 loc3 loc4 loc5 loc6 loc7 loc8 loc9 loc10 loc11 loc12 loc13 loc14 loc15 loc16 loc17 loc18 loc19 loc20 loc21 loc22 loc23 loc24 loc25 loc26 loc27 loc28 loc29 loc30 loc31 loc32 loc33 loc34 loc35 loc36 loc37 loc38 loc39 loc40 loc41 loc42 loc43 loc44 loc45 loc46 loc47 loc48 loc49 loc50 loc51 loc52 loc53 loc54 loc55 loc56 loc57 loc58 loc59 loc60 loc61 loc62 loc63 loc64 loc65 loc66 loc67 loc68 loc69 loc70 loc71 loc72 loc73 loc74 loc75 loc76 loc77 loc78 loc79 loc80 loc81 loc82 loc83 loc84 loc85 loc86 loc87 loc88 loc89 loc90 - location
		bar1 bar3 bar4 bar7 bar16 bar17 bar18 bar19 bar20 bar21 bar23 bar25 bar27 bar28 bar31 bar33 bar34 bar36 bar38 bar39 bar40 bar41 bar43 bar44 bar45 bar46 bar48 bar52 bar54 bar55 bar56 bar59 bar61 bar62 bar65 bar67 bar68 bar70 bar71 bar72 bar81 bar82 bar83 bar85 bar86 bar88 bar89 - bar
	)
	(:init
		(at loc1)

		(connected loc23 loc52)
		(connected loc52 loc23)
		(connected loc52 loc53)
		(connected loc53 loc52)
		(connected loc53 loc72)
		(connected loc72 loc53)
		(connected loc53 loc68)
		(connected loc68 loc53)
		(connected loc68 loc33)
		(connected loc33 loc68)
		(connected loc33 loc81)
		(connected loc81 loc33)
		(connected loc81 loc82)
		(connected loc82 loc81)
		(connected loc82 loc11)
		(connected loc11 loc82)
		(connected loc11 loc38)
		(connected loc38 loc11)
		(connected loc38 loc65)
		(connected loc65 loc38)
		(connected loc65 loc26)
		(connected loc26 loc65)
		(connected loc26 loc58)
		(connected loc58 loc26)
		(connected loc38 loc22)
		(connected loc22 loc38)
		(connected loc22 loc77)
		(connected loc77 loc22)
		(connected loc77 loc79)
		(connected loc79 loc77)
		(connected loc11 loc63)
		(connected loc63 loc11)
		(connected loc63 loc30)
		(connected loc30 loc63)
		(connected loc30 loc19)
		(connected loc19 loc30)
		(connected loc19 loc54)
		(connected loc54 loc19)
		(connected loc54 loc17)
		(connected loc17 loc54)
		(connected loc58 loc15)
		(connected loc15 loc58)
		(connected loc15 loc67)
		(connected loc67 loc15)
		(connected loc67 loc75)
		(connected loc75 loc67)
		(connected loc75 loc12)
		(connected loc12 loc75)
		(connected loc15 loc28)
		(connected loc28 loc15)
		(connected loc28 loc49)
		(connected loc49 loc28)
		(connected loc49 loc61)
		(connected loc61 loc49)
		(connected loc61 loc59)
		(connected loc59 loc61)
		(connected loc59 loc44)
		(connected loc44 loc59)
		(connected loc12 loc13)
		(connected loc13 loc12)
		(connected loc13 loc4)
		(connected loc4 loc13)
		(connected loc67 loc78)
		(connected loc78 loc67)
		(connected loc22 loc66)
		(connected loc66 loc22)
		(connected loc17 loc64)
		(connected loc64 loc17)
		(connected loc59 loc42)
		(connected loc42 loc59)
		(connected loc42 loc3)
		(connected loc3 loc42)
		(connected loc26 loc6)
		(connected loc6 loc26)
		(connected loc61 loc85)
		(connected loc85 loc61)
		(connected loc85 loc73)
		(connected loc73 loc85)
		(connected loc73 loc69)
		(connected loc69 loc73)
		(connected loc69 loc71)
		(connected loc71 loc69)
		(connected loc42 loc21)
		(connected loc21 loc42)
		(connected loc26 loc88)
		(connected loc88 loc26)
		(connected loc59 loc84)
		(connected loc84 loc59)
		(connected loc84 loc37)
		(connected loc37 loc84)
		(connected loc12 loc48)
		(connected loc48 loc12)
		(connected loc33 loc7)
		(connected loc7 loc33)
		(connected loc21 loc89)
		(connected loc89 loc21)
		(connected loc89 loc55)
		(connected loc55 loc89)
		(connected loc55 loc76)
		(connected loc76 loc55)
		(connected loc69 loc62)
		(connected loc62 loc69)
		(connected loc15 loc27)
		(connected loc27 loc15)
		(connected loc27 loc31)
		(connected loc31 loc27)
		(connected loc84 loc60)
		(connected loc60 loc84)
		(connected loc60 loc32)
		(connected loc32 loc60)
		(connected loc67 loc1)
		(connected loc1 loc67)
		(connected loc1 loc87)
		(connected loc87 loc1)
		(connected loc13 loc8)
		(connected loc8 loc13)
		(connected loc66 loc83)
		(connected loc83 loc66)
		(connected loc83 loc29)
		(connected loc29 loc83)
		(connected loc59 loc16)
		(connected loc16 loc59)
		(connected loc85 loc56)
		(connected loc56 loc85)
		(connected loc42 loc24)
		(connected loc24 loc42)
		(connected loc24 loc46)
		(connected loc46 loc24)
		(connected loc69 loc43)
		(connected loc43 loc69)
		(connected loc43 loc39)
		(connected loc39 loc43)
		(connected loc39 loc18)
		(connected loc18 loc39)
		(connected loc58 loc5)
		(connected loc5 loc58)
		(connected loc16 loc57)
		(connected loc57 loc16)
		(connected loc61 loc35)
		(connected loc35 loc61)
		(connected loc52 loc47)
		(connected loc47 loc52)
		(connected loc26 loc25)
		(connected loc25 loc26)
		(connected loc19 loc74)
		(connected loc74 loc19)
		(connected loc77 loc10)
		(connected loc10 loc77)
		(connected loc87 loc45)
		(connected loc45 loc87)
		(connected loc82 loc41)
		(connected loc41 loc82)
		(connected loc11 loc51)
		(connected loc51 loc11)
		(connected loc19 loc86)
		(connected loc86 loc19)
		(connected loc8 loc70)
		(connected loc70 loc8)
		(connected loc5 loc9)
		(connected loc9 loc5)
		(connected loc19 loc50)
		(connected loc50 loc19)
		(connected loc50 loc36)
		(connected loc36 loc50)
		(connected loc75 loc90)
		(connected loc90 loc75)
		(connected loc77 loc14)
		(connected loc14 loc77)
		(connected loc17 loc40)
		(connected loc40 loc17)
		(connected loc42 loc2)
		(connected loc2 loc42)
		(connected loc37 loc34)
		(connected loc34 loc37)
		(connected loc82 loc80)
		(connected loc80 loc82)
		(connected loc5 loc20)
		(connected loc20 loc5)
		(connected loc1 loc18)
		(connected loc18 loc1)
		(connected loc1 loc19)
		(connected loc19 loc1)
		(connected loc1 loc29)
		(connected loc29 loc1)
		(connected loc1 loc39)
		(connected loc39 loc1)
		(connected loc1 loc43)
		(connected loc43 loc1)
		(connected loc2 loc6)
		(connected loc6 loc2)
		(connected loc2 loc20)
		(connected loc20 loc2)
		(connected loc2 loc22)
		(connected loc22 loc2)
		(connected loc2 loc23)
		(connected loc23 loc2)
		(connected loc2 loc65)
		(connected loc65 loc2)
		(connected loc2 loc72)
		(connected loc72 loc2)
		(connected loc3 loc15)
		(connected loc15 loc3)
		(connected loc3 loc31)
		(connected loc31 loc3)
		(connected loc3 loc40)
		(connected loc40 loc3)
		(connected loc3 loc46)
		(connected loc46 loc3)
		(connected loc3 loc65)
		(connected loc65 loc3)
		(connected loc4 loc34)
		(connected loc34 loc4)
		(connected loc4 loc41)
		(connected loc41 loc4)
		(connected loc4 loc61)
		(connected loc61 loc4)
		(connected loc5 loc6)
		(connected loc6 loc5)
		(connected loc5 loc12)
		(connected loc12 loc5)
		(connected loc5 loc16)
		(connected loc16 loc5)
		(connected loc5 loc27)
		(connected loc27 loc5)
		(connected loc5 loc36)
		(connected loc36 loc5)
		(connected loc5 loc46)
		(connected loc46 loc5)
		(connected loc5 loc52)
		(connected loc52 loc5)
		(connected loc6 loc2)
		(connected loc2 loc6)
		(connected loc6 loc8)
		(connected loc8 loc6)
		(connected loc6 loc18)
		(connected loc18 loc6)
		(connected loc6 loc43)
		(connected loc43 loc6)
		(connected loc7 loc8)
		(connected loc8 loc7)
		(connected loc7 loc12)
		(connected loc12 loc7)
		(connected loc7 loc29)
		(connected loc29 loc7)
		(connected loc7 loc37)
		(connected loc37 loc7)
		(connected loc7 loc61)
		(connected loc61 loc7)
		(connected loc8 loc3)
		(connected loc3 loc8)
		(connected loc8 loc6)
		(connected loc6 loc8)
		(connected loc8 loc21)
		(connected loc21 loc8)
		(connected loc8 loc35)
		(connected loc35 loc8)
		(connected loc8 loc37)
		(connected loc37 loc8)
		(connected loc9 loc7)
		(connected loc7 loc9)
		(connected loc9 loc12)
		(connected loc12 loc9)
		(connected loc9 loc14)
		(connected loc14 loc9)
		(connected loc9 loc17)
		(connected loc17 loc9)
		(connected loc9 loc31)
		(connected loc31 loc9)
		(connected loc9 loc41)
		(connected loc41 loc9)
		(connected loc9 loc74)
		(connected loc74 loc9)
		(connected loc10 loc12)
		(connected loc12 loc10)
		(connected loc10 loc16)
		(connected loc16 loc10)
		(connected loc10 loc27)
		(connected loc27 loc10)
		(connected loc10 loc50)
		(connected loc50 loc10)
		(connected loc10 loc66)
		(connected loc66 loc10)
		(connected loc11 loc13)
		(connected loc13 loc11)
		(connected loc11 loc42)
		(connected loc42 loc11)
		(connected loc11 loc76)
		(connected loc76 loc11)
		(connected loc11 loc79)
		(connected loc79 loc11)
		(connected loc12 loc3)
		(connected loc3 loc12)
		(connected loc12 loc4)
		(connected loc4 loc12)
		(connected loc12 loc10)
		(connected loc10 loc12)
		(connected loc12 loc16)
		(connected loc16 loc12)
		(connected loc12 loc20)
		(connected loc20 loc12)
		(connected loc12 loc22)
		(connected loc22 loc12)
		(connected loc12 loc30)
		(connected loc30 loc12)
		(connected loc12 loc33)
		(connected loc33 loc12)
		(connected loc12 loc46)
		(connected loc46 loc12)
		(connected loc12 loc55)
		(connected loc55 loc12)
		(connected loc12 loc56)
		(connected loc56 loc12)
		(connected loc13 loc20)
		(connected loc20 loc13)
		(connected loc13 loc31)
		(connected loc31 loc13)
		(connected loc13 loc39)
		(connected loc39 loc13)
		(connected loc13 loc41)
		(connected loc41 loc13)
		(connected loc13 loc67)
		(connected loc67 loc13)
		(connected loc14 loc1)
		(connected loc1 loc14)
		(connected loc14 loc11)
		(connected loc11 loc14)
		(connected loc14 loc26)
		(connected loc26 loc14)
		(connected loc14 loc32)
		(connected loc32 loc14)
		(connected loc14 loc50)
		(connected loc50 loc14)
		(connected loc15 loc12)
		(connected loc12 loc15)
		(connected loc15 loc14)
		(connected loc14 loc15)
		(connected loc15 loc25)
		(connected loc25 loc15)
		(connected loc15 loc57)
		(connected loc57 loc15)
		(connected loc15 loc78)
		(connected loc78 loc15)
		(connected loc15 loc79)
		(connected loc79 loc15)
		(connected loc16 loc8)
		(connected loc8 loc16)
		(connected loc16 loc20)
		(connected loc20 loc16)
		(connected loc16 loc39)
		(connected loc39 loc16)
		(connected loc16 loc42)
		(connected loc42 loc16)
		(connected loc16 loc47)
		(connected loc47 loc16)
		(connected loc16 loc50)
		(connected loc50 loc16)
		(connected loc16 loc61)
		(connected loc61 loc16)
		(connected loc16 loc64)
		(connected loc64 loc16)
		(connected loc17 loc13)
		(connected loc13 loc17)
		(connected loc17 loc20)
		(connected loc20 loc17)
		(connected loc17 loc24)
		(connected loc24 loc17)
		(connected loc17 loc26)
		(connected loc26 loc17)
		(connected loc17 loc38)
		(connected loc38 loc17)
		(connected loc17 loc70)
		(connected loc70 loc17)
		(connected loc18 loc10)
		(connected loc10 loc18)
		(connected loc18 loc12)
		(connected loc12 loc18)
		(connected loc18 loc13)
		(connected loc13 loc18)
		(connected loc18 loc33)
		(connected loc33 loc18)
		(connected loc18 loc37)
		(connected loc37 loc18)
		(connected loc18 loc74)
		(connected loc74 loc18)
		(connected loc18 loc85)
		(connected loc85 loc18)
		(connected loc19 loc7)
		(connected loc7 loc19)
		(connected loc19 loc11)
		(connected loc11 loc19)
		(connected loc19 loc17)
		(connected loc17 loc19)
		(connected loc19 loc21)
		(connected loc21 loc19)
		(connected loc19 loc49)
		(connected loc49 loc19)
		(connected loc19 loc78)
		(connected loc78 loc19)
		(connected loc20 loc2)
		(connected loc2 loc20)
		(connected loc20 loc26)
		(connected loc26 loc20)
		(connected loc20 loc35)
		(connected loc35 loc20)
		(connected loc20 loc38)
		(connected loc38 loc20)
		(connected loc20 loc46)
		(connected loc46 loc20)
		(connected loc21 loc7)
		(connected loc7 loc21)
		(connected loc21 loc12)
		(connected loc12 loc21)
		(connected loc21 loc28)
		(connected loc28 loc21)
		(connected loc21 loc37)
		(connected loc37 loc21)
		(connected loc21 loc56)
		(connected loc56 loc21)
		(connected loc21 loc69)
		(connected loc69 loc21)
		(connected loc22 loc12)
		(connected loc12 loc22)
		(connected loc22 loc16)
		(connected loc16 loc22)
		(connected loc22 loc26)
		(connected loc26 loc22)
		(connected loc22 loc49)
		(connected loc49 loc22)
		(connected loc22 loc62)
		(connected loc62 loc22)
		(connected loc22 loc69)
		(connected loc69 loc22)
		(connected loc23 loc26)
		(connected loc26 loc23)
		(connected loc23 loc27)
		(connected loc27 loc23)
		(connected loc23 loc28)
		(connected loc28 loc23)
		(connected loc23 loc38)
		(connected loc38 loc23)
		(connected loc23 loc48)
		(connected loc48 loc23)
		(connected loc23 loc50)
		(connected loc50 loc23)
		(connected loc23 loc51)
		(connected loc51 loc23)
		(connected loc24 loc3)
		(connected loc3 loc24)
		(connected loc24 loc23)
		(connected loc23 loc24)
		(connected loc24 loc57)
		(connected loc57 loc24)
		(connected loc24 loc61)
		(connected loc61 loc24)
		(connected loc24 loc65)
		(connected loc65 loc24)
		(connected loc25 loc18)
		(connected loc18 loc25)
		(connected loc25 loc35)
		(connected loc35 loc25)
		(connected loc25 loc50)
		(connected loc50 loc25)
		(connected loc25 loc56)
		(connected loc56 loc25)
		(connected loc25 loc57)
		(connected loc57 loc25)
		(connected loc25 loc72)
		(connected loc72 loc25)
		(connected loc25 loc86)
		(connected loc86 loc25)
		(connected loc26 loc18)
		(connected loc18 loc26)
		(connected loc26 loc38)
		(connected loc38 loc26)
		(connected loc26 loc51)
		(connected loc51 loc26)
		(connected loc26 loc53)
		(connected loc53 loc26)
		(connected loc26 loc72)
		(connected loc72 loc26)
		(connected loc26 loc79)
		(connected loc79 loc26)
		(connected loc26 loc90)
		(connected loc90 loc26)
		(connected loc27 loc20)
		(connected loc20 loc27)
		(connected loc27 loc33)
		(connected loc33 loc27)
		(connected loc28 loc6)
		(connected loc6 loc28)
		(connected loc28 loc17)
		(connected loc17 loc28)
		(connected loc28 loc29)
		(connected loc29 loc28)
		(connected loc28 loc34)
		(connected loc34 loc28)
		(connected loc28 loc37)
		(connected loc37 loc28)
		(connected loc28 loc44)
		(connected loc44 loc28)
		(connected loc28 loc53)
		(connected loc53 loc28)
		(connected loc29 loc5)
		(connected loc5 loc29)
		(connected loc29 loc16)
		(connected loc16 loc29)
		(connected loc29 loc30)
		(connected loc30 loc29)
		(connected loc29 loc33)
		(connected loc33 loc29)
		(connected loc29 loc61)
		(connected loc61 loc29)
		(connected loc29 loc73)
		(connected loc73 loc29)
		(connected loc29 loc81)
		(connected loc81 loc29)
		(connected loc30 loc8)
		(connected loc8 loc30)
		(connected loc30 loc12)
		(connected loc12 loc30)
		(connected loc30 loc13)
		(connected loc13 loc30)
		(connected loc30 loc20)
		(connected loc20 loc30)
		(connected loc30 loc25)
		(connected loc25 loc30)
		(connected loc30 loc31)
		(connected loc31 loc30)
		(connected loc30 loc83)
		(connected loc83 loc30)
		(connected loc30 loc86)
		(connected loc86 loc30)
		(connected loc31 loc12)
		(connected loc12 loc31)
		(connected loc31 loc13)
		(connected loc13 loc31)
		(connected loc31 loc16)
		(connected loc16 loc31)
		(connected loc31 loc20)
		(connected loc20 loc31)
		(connected loc31 loc37)
		(connected loc37 loc31)
		(connected loc31 loc41)
		(connected loc41 loc31)
		(connected loc32 loc17)
		(connected loc17 loc32)
		(connected loc32 loc22)
		(connected loc22 loc32)
		(connected loc32 loc34)
		(connected loc34 loc32)
		(connected loc33 loc8)
		(connected loc8 loc33)
		(connected loc33 loc12)
		(connected loc12 loc33)
		(connected loc33 loc15)
		(connected loc15 loc33)
		(connected loc33 loc16)
		(connected loc16 loc33)
		(connected loc33 loc20)
		(connected loc20 loc33)
		(connected loc33 loc44)
		(connected loc44 loc33)
		(connected loc33 loc52)
		(connected loc52 loc33)
		(connected loc33 loc54)
		(connected loc54 loc33)
		(connected loc33 loc70)
		(connected loc70 loc33)
		(connected loc33 loc79)
		(connected loc79 loc33)
		(connected loc33 loc86)
		(connected loc86 loc33)
		(connected loc33 loc88)
		(connected loc88 loc33)
		(connected loc34 loc4)
		(connected loc4 loc34)
		(connected loc34 loc27)
		(connected loc27 loc34)
		(connected loc34 loc31)
		(connected loc31 loc34)
		(connected loc34 loc39)
		(connected loc39 loc34)
		(connected loc34 loc43)
		(connected loc43 loc34)
		(connected loc34 loc48)
		(connected loc48 loc34)
		(connected loc34 loc77)
		(connected loc77 loc34)
		(connected loc34 loc81)
		(connected loc81 loc34)
		(connected loc35 loc29)
		(connected loc29 loc35)
		(connected loc35 loc33)
		(connected loc33 loc35)
		(connected loc35 loc34)
		(connected loc34 loc35)
		(connected loc35 loc37)
		(connected loc37 loc35)
		(connected loc35 loc38)
		(connected loc38 loc35)
		(connected loc35 loc47)
		(connected loc47 loc35)
		(connected loc36 loc20)
		(connected loc20 loc36)
		(connected loc36 loc33)
		(connected loc33 loc36)
		(connected loc36 loc47)
		(connected loc47 loc36)
		(connected loc36 loc78)
		(connected loc78 loc36)
		(connected loc37 loc29)
		(connected loc29 loc37)
		(connected loc37 loc47)
		(connected loc47 loc37)
		(connected loc37 loc48)
		(connected loc48 loc37)
		(connected loc37 loc70)
		(connected loc70 loc37)
		(connected loc37 loc74)
		(connected loc74 loc37)
		(connected loc38 loc11)
		(connected loc11 loc38)
		(connected loc38 loc14)
		(connected loc14 loc38)
		(connected loc38 loc49)
		(connected loc49 loc38)
		(connected loc38 loc81)
		(connected loc81 loc38)
		(connected loc38 loc86)
		(connected loc86 loc38)
		(connected loc39 loc9)
		(connected loc9 loc39)
		(connected loc39 loc12)
		(connected loc12 loc39)
		(connected loc39 loc13)
		(connected loc13 loc39)
		(connected loc39 loc17)
		(connected loc17 loc39)
		(connected loc39 loc40)
		(connected loc40 loc39)
		(connected loc39 loc53)
		(connected loc53 loc39)
		(connected loc39 loc60)
		(connected loc60 loc39)
		(connected loc39 loc63)
		(connected loc63 loc39)
		(connected loc39 loc74)
		(connected loc74 loc39)
		(connected loc39 loc76)
		(connected loc76 loc39)
		(connected loc40 loc44)
		(connected loc44 loc40)
		(connected loc40 loc57)
		(connected loc57 loc40)
		(connected loc40 loc58)
		(connected loc58 loc40)
		(connected loc40 loc64)
		(connected loc64 loc40)
		(connected loc40 loc72)
		(connected loc72 loc40)
		(connected loc40 loc80)
		(connected loc80 loc40)
		(connected loc40 loc84)
		(connected loc84 loc40)
		(connected loc40 loc88)
		(connected loc88 loc40)
		(connected loc41 loc34)
		(connected loc34 loc41)
		(connected loc41 loc36)
		(connected loc36 loc41)
		(connected loc41 loc38)
		(connected loc38 loc41)
		(connected loc41 loc43)
		(connected loc43 loc41)
		(connected loc42 loc18)
		(connected loc18 loc42)
		(connected loc42 loc20)
		(connected loc20 loc42)
		(connected loc42 loc41)
		(connected loc41 loc42)
		(connected loc42 loc53)
		(connected loc53 loc42)
		(connected loc42 loc88)
		(connected loc88 loc42)
		(connected loc43 loc16)
		(connected loc16 loc43)
		(connected loc43 loc24)
		(connected loc24 loc43)
		(connected loc43 loc49)
		(connected loc49 loc43)
		(connected loc43 loc60)
		(connected loc60 loc43)
		(connected loc43 loc61)
		(connected loc61 loc43)
		(connected loc43 loc67)
		(connected loc67 loc43)
		(connected loc43 loc69)
		(connected loc69 loc43)
		(connected loc44 loc10)
		(connected loc10 loc44)
		(connected loc44 loc17)
		(connected loc17 loc44)
		(connected loc44 loc32)
		(connected loc32 loc44)
		(connected loc44 loc37)
		(connected loc37 loc44)
		(connected loc44 loc50)
		(connected loc50 loc44)
		(connected loc44 loc76)
		(connected loc76 loc44)
		(connected loc45 loc12)
		(connected loc12 loc45)
		(connected loc45 loc42)
		(connected loc42 loc45)
		(connected loc45 loc82)
		(connected loc82 loc45)
		(connected loc45 loc87)
		(connected loc87 loc45)
		(connected loc46 loc10)
		(connected loc10 loc46)
		(connected loc46 loc29)
		(connected loc29 loc46)
		(connected loc46 loc32)
		(connected loc32 loc46)
		(connected loc46 loc39)
		(connected loc39 loc46)
		(connected loc46 loc47)
		(connected loc47 loc46)
		(connected loc46 loc55)
		(connected loc55 loc46)
		(connected loc46 loc80)
		(connected loc80 loc46)
		(connected loc46 loc88)
		(connected loc88 loc46)
		(connected loc47 loc36)
		(connected loc36 loc47)
		(connected loc47 loc37)
		(connected loc37 loc47)
		(connected loc47 loc38)
		(connected loc38 loc47)
		(connected loc47 loc84)
		(connected loc84 loc47)
		(connected loc47 loc88)
		(connected loc88 loc47)
		(connected loc48 loc36)
		(connected loc36 loc48)
		(connected loc48 loc37)
		(connected loc37 loc48)
		(connected loc48 loc52)
		(connected loc52 loc48)
		(connected loc48 loc60)
		(connected loc60 loc48)
		(connected loc48 loc89)
		(connected loc89 loc48)
		(connected loc49 loc2)
		(connected loc2 loc49)
		(connected loc49 loc12)
		(connected loc12 loc49)
		(connected loc49 loc15)
		(connected loc15 loc49)
		(connected loc49 loc41)
		(connected loc41 loc49)
		(connected loc49 loc53)
		(connected loc53 loc49)
		(connected loc49 loc87)
		(connected loc87 loc49)
		(connected loc50 loc20)
		(connected loc20 loc50)
		(connected loc50 loc41)
		(connected loc41 loc50)
		(connected loc50 loc42)
		(connected loc42 loc50)
		(connected loc50 loc56)
		(connected loc56 loc50)
		(connected loc50 loc67)
		(connected loc67 loc50)
		(connected loc50 loc70)
		(connected loc70 loc50)
		(connected loc50 loc74)
		(connected loc74 loc50)
		(connected loc50 loc80)
		(connected loc80 loc50)
		(connected loc50 loc90)
		(connected loc90 loc50)
		(connected loc51 loc3)
		(connected loc3 loc51)
		(connected loc51 loc27)
		(connected loc27 loc51)
		(connected loc51 loc28)
		(connected loc28 loc51)
		(connected loc51 loc40)
		(connected loc40 loc51)
		(connected loc51 loc85)
		(connected loc85 loc51)
		(connected loc52 loc23)
		(connected loc23 loc52)
		(connected loc52 loc34)
		(connected loc34 loc52)
		(connected loc52 loc40)
		(connected loc40 loc52)
		(connected loc52 loc45)
		(connected loc45 loc52)
		(connected loc52 loc84)
		(connected loc84 loc52)
		(connected loc53 loc1)
		(connected loc1 loc53)
		(connected loc53 loc10)
		(connected loc10 loc53)
		(connected loc53 loc24)
		(connected loc24 loc53)
		(connected loc53 loc26)
		(connected loc26 loc53)
		(connected loc53 loc45)
		(connected loc45 loc53)
		(connected loc53 loc63)
		(connected loc63 loc53)
		(connected loc53 loc74)
		(connected loc74 loc53)
		(connected loc53 loc85)
		(connected loc85 loc53)
		(connected loc53 loc90)
		(connected loc90 loc53)
		(connected loc54 loc10)
		(connected loc10 loc54)
		(connected loc54 loc21)
		(connected loc21 loc54)
		(connected loc54 loc48)
		(connected loc48 loc54)
		(connected loc54 loc51)
		(connected loc51 loc54)
		(connected loc54 loc63)
		(connected loc63 loc54)
		(connected loc54 loc65)
		(connected loc65 loc54)
		(connected loc54 loc74)
		(connected loc74 loc54)
		(connected loc54 loc77)
		(connected loc77 loc54)
		(connected loc54 loc80)
		(connected loc80 loc54)
		(connected loc54 loc82)
		(connected loc82 loc54)
		(connected loc55 loc8)
		(connected loc8 loc55)
		(connected loc55 loc18)
		(connected loc18 loc55)
		(connected loc55 loc21)
		(connected loc21 loc55)
		(connected loc55 loc49)
		(connected loc49 loc55)
		(connected loc55 loc62)
		(connected loc62 loc55)
		(connected loc55 loc78)
		(connected loc78 loc55)
		(connected loc55 loc80)
		(connected loc80 loc55)
		(connected loc55 loc87)
		(connected loc87 loc55)
		(connected loc56 loc7)
		(connected loc7 loc56)
		(connected loc56 loc30)
		(connected loc30 loc56)
		(connected loc56 loc35)
		(connected loc35 loc56)
		(connected loc56 loc40)
		(connected loc40 loc56)
		(connected loc56 loc42)
		(connected loc42 loc56)
		(connected loc56 loc65)
		(connected loc65 loc56)
		(connected loc56 loc77)
		(connected loc77 loc56)
		(connected loc56 loc79)
		(connected loc79 loc56)
		(connected loc57 loc6)
		(connected loc6 loc57)
		(connected loc57 loc12)
		(connected loc12 loc57)
		(connected loc57 loc38)
		(connected loc38 loc57)
		(connected loc57 loc50)
		(connected loc50 loc57)
		(connected loc57 loc67)
		(connected loc67 loc57)
		(connected loc57 loc70)
		(connected loc70 loc57)
		(connected loc57 loc71)
		(connected loc71 loc57)
		(connected loc57 loc77)
		(connected loc77 loc57)
		(connected loc58 loc30)
		(connected loc30 loc58)
		(connected loc58 loc32)
		(connected loc32 loc58)
		(connected loc58 loc33)
		(connected loc33 loc58)
		(connected loc58 loc35)
		(connected loc35 loc58)
		(connected loc58 loc43)
		(connected loc43 loc58)
		(connected loc58 loc46)
		(connected loc46 loc58)
		(connected loc58 loc50)
		(connected loc50 loc58)
		(connected loc58 loc77)
		(connected loc77 loc58)
		(connected loc59 loc2)
		(connected loc2 loc59)
		(connected loc59 loc22)
		(connected loc22 loc59)
		(connected loc59 loc23)
		(connected loc23 loc59)
		(connected loc59 loc34)
		(connected loc34 loc59)
		(connected loc59 loc38)
		(connected loc38 loc59)
		(connected loc59 loc49)
		(connected loc49 loc59)
		(connected loc59 loc52)
		(connected loc52 loc59)
		(connected loc59 loc62)
		(connected loc62 loc59)
		(connected loc59 loc65)
		(connected loc65 loc59)
		(connected loc59 loc75)
		(connected loc75 loc59)
		(connected loc59 loc78)
		(connected loc78 loc59)
		(connected loc59 loc88)
		(connected loc88 loc59)
		(connected loc59 loc89)
		(connected loc89 loc59)
		(connected loc60 loc13)
		(connected loc13 loc60)
		(connected loc60 loc24)
		(connected loc24 loc60)
		(connected loc60 loc56)
		(connected loc56 loc60)
		(connected loc60 loc57)
		(connected loc57 loc60)
		(connected loc60 loc67)
		(connected loc67 loc60)
		(connected loc60 loc85)
		(connected loc85 loc60)
		(connected loc61 loc5)
		(connected loc5 loc61)
		(connected loc61 loc19)
		(connected loc19 loc61)
		(connected loc61 loc42)
		(connected loc42 loc61)
		(connected loc61 loc46)
		(connected loc46 loc61)
		(connected loc61 loc64)
		(connected loc64 loc61)
		(connected loc61 loc90)
		(connected loc90 loc61)
		(connected loc62 loc1)
		(connected loc1 loc62)
		(connected loc62 loc4)
		(connected loc4 loc62)
		(connected loc62 loc8)
		(connected loc8 loc62)
		(connected loc62 loc28)
		(connected loc28 loc62)
		(connected loc62 loc42)
		(connected loc42 loc62)
		(connected loc62 loc75)
		(connected loc75 loc62)
		(connected loc62 loc76)
		(connected loc76 loc62)
		(connected loc62 loc87)
		(connected loc87 loc62)
		(connected loc63 loc8)
		(connected loc8 loc63)
		(connected loc63 loc44)
		(connected loc44 loc63)
		(connected loc63 loc51)
		(connected loc51 loc63)
		(connected loc63 loc64)
		(connected loc64 loc63)
		(connected loc63 loc69)
		(connected loc69 loc63)
		(connected loc63 loc75)
		(connected loc75 loc63)
		(connected loc64 loc40)
		(connected loc40 loc64)
		(connected loc64 loc56)
		(connected loc56 loc64)
		(connected loc64 loc62)
		(connected loc62 loc64)
		(connected loc64 loc77)
		(connected loc77 loc64)
		(connected loc64 loc80)
		(connected loc80 loc64)
		(connected loc64 loc81)
		(connected loc81 loc64)
		(connected loc64 loc90)
		(connected loc90 loc64)
		(connected loc65 loc14)
		(connected loc14 loc65)
		(connected loc65 loc34)
		(connected loc34 loc65)
		(connected loc65 loc38)
		(connected loc38 loc65)
		(connected loc65 loc40)
		(connected loc40 loc65)
		(connected loc65 loc49)
		(connected loc49 loc65)
		(connected loc65 loc71)
		(connected loc71 loc65)
		(connected loc65 loc77)
		(connected loc77 loc65)
		(connected loc66 loc29)
		(connected loc29 loc66)
		(connected loc66 loc35)
		(connected loc35 loc66)
		(connected loc66 loc40)
		(connected loc40 loc66)
		(connected loc66 loc43)
		(connected loc43 loc66)
		(connected loc66 loc73)
		(connected loc73 loc66)
		(connected loc67 loc4)
		(connected loc4 loc67)
		(connected loc67 loc26)
		(connected loc26 loc67)
		(connected loc67 loc42)
		(connected loc42 loc67)
		(connected loc67 loc64)
		(connected loc64 loc67)
		(connected loc67 loc74)
		(connected loc74 loc67)
		(connected loc67 loc76)
		(connected loc76 loc67)
		(connected loc68 loc6)
		(connected loc6 loc68)
		(connected loc68 loc30)
		(connected loc30 loc68)
		(connected loc68 loc63)
		(connected loc63 loc68)
		(connected loc68 loc71)
		(connected loc71 loc68)
		(connected loc68 loc77)
		(connected loc77 loc68)
		(connected loc69 loc8)
		(connected loc8 loc69)
		(connected loc69 loc10)
		(connected loc10 loc69)
		(connected loc69 loc30)
		(connected loc30 loc69)
		(connected loc69 loc31)
		(connected loc31 loc69)
		(connected loc69 loc58)
		(connected loc58 loc69)
		(connected loc69 loc61)
		(connected loc61 loc69)
		(connected loc69 loc66)
		(connected loc66 loc69)
		(connected loc69 loc80)
		(connected loc80 loc69)
		(connected loc70 loc32)
		(connected loc32 loc70)
		(connected loc70 loc72)
		(connected loc72 loc70)
		(connected loc71 loc13)
		(connected loc13 loc71)
		(connected loc71 loc56)
		(connected loc56 loc71)
		(connected loc71 loc57)
		(connected loc57 loc71)
		(connected loc71 loc59)
		(connected loc59 loc71)
		(connected loc71 loc74)
		(connected loc74 loc71)
		(connected loc71 loc89)
		(connected loc89 loc71)
		(connected loc72 loc33)
		(connected loc33 loc72)
		(connected loc72 loc46)
		(connected loc46 loc72)
		(connected loc72 loc48)
		(connected loc48 loc72)
		(connected loc72 loc54)
		(connected loc54 loc72)
		(connected loc72 loc62)
		(connected loc62 loc72)
		(connected loc72 loc71)
		(connected loc71 loc72)
		(connected loc72 loc88)
		(connected loc88 loc72)
		(connected loc73 loc39)
		(connected loc39 loc73)
		(connected loc73 loc59)
		(connected loc59 loc73)
		(connected loc73 loc85)
		(connected loc85 loc73)
		(connected loc73 loc86)
		(connected loc86 loc73)
		(connected loc74 loc58)
		(connected loc58 loc74)
		(connected loc74 loc90)
		(connected loc90 loc74)
		(connected loc75 loc39)
		(connected loc39 loc75)
		(connected loc75 loc50)
		(connected loc50 loc75)
		(connected loc75 loc56)
		(connected loc56 loc75)
		(connected loc75 loc64)
		(connected loc64 loc75)
		(connected loc76 loc37)
		(connected loc37 loc76)
		(connected loc76 loc40)
		(connected loc40 loc76)
		(connected loc76 loc59)
		(connected loc59 loc76)
		(connected loc76 loc64)
		(connected loc64 loc76)
		(connected loc76 loc68)
		(connected loc68 loc76)
		(connected loc76 loc83)
		(connected loc83 loc76)
		(connected loc77 loc20)
		(connected loc20 loc77)
		(connected loc77 loc58)
		(connected loc58 loc77)
		(connected loc77 loc62)
		(connected loc62 loc77)
		(connected loc77 loc68)
		(connected loc68 loc77)
		(connected loc77 loc78)
		(connected loc78 loc77)
		(connected loc77 loc89)
		(connected loc89 loc77)
		(connected loc78 loc18)
		(connected loc18 loc78)
		(connected loc78 loc28)
		(connected loc28 loc78)
		(connected loc78 loc41)
		(connected loc41 loc78)
		(connected loc79 loc42)
		(connected loc42 loc79)
		(connected loc79 loc65)
		(connected loc65 loc79)
		(connected loc79 loc76)
		(connected loc76 loc79)
		(connected loc79 loc77)
		(connected loc77 loc79)
		(connected loc79 loc82)
		(connected loc82 loc79)
		(connected loc80 loc17)
		(connected loc17 loc80)
		(connected loc81 loc7)
		(connected loc7 loc81)
		(connected loc81 loc35)
		(connected loc35 loc81)
		(connected loc81 loc38)
		(connected loc38 loc81)
		(connected loc81 loc72)
		(connected loc72 loc81)
		(connected loc81 loc74)
		(connected loc74 loc81)
		(connected loc81 loc75)
		(connected loc75 loc81)
		(connected loc81 loc84)
		(connected loc84 loc81)
		(connected loc82 loc23)
		(connected loc23 loc82)
		(connected loc82 loc26)
		(connected loc26 loc82)
		(connected loc82 loc49)
		(connected loc49 loc82)
		(connected loc82 loc50)
		(connected loc50 loc82)
		(connected loc82 loc62)
		(connected loc62 loc82)
		(connected loc82 loc78)
		(connected loc78 loc82)
		(connected loc83 loc35)
		(connected loc35 loc83)
		(connected loc83 loc58)
		(connected loc58 loc83)
		(connected loc83 loc74)
		(connected loc74 loc83)
		(connected loc83 loc80)
		(connected loc80 loc83)
		(connected loc83 loc89)
		(connected loc89 loc83)
		(connected loc84 loc8)
		(connected loc8 loc84)
		(connected loc84 loc41)
		(connected loc41 loc84)
		(connected loc84 loc47)
		(connected loc47 loc84)
		(connected loc84 loc48)
		(connected loc48 loc84)
		(connected loc84 loc54)
		(connected loc54 loc84)
		(connected loc84 loc58)
		(connected loc58 loc84)
		(connected loc84 loc82)
		(connected loc82 loc84)
		(connected loc84 loc83)
		(connected loc83 loc84)
		(connected loc85 loc28)
		(connected loc28 loc85)
		(connected loc85 loc61)
		(connected loc61 loc85)
		(connected loc85 loc70)
		(connected loc70 loc85)
		(connected loc85 loc76)
		(connected loc76 loc85)
		(connected loc85 loc77)
		(connected loc77 loc85)
		(connected loc86 loc35)
		(connected loc35 loc86)
		(connected loc86 loc39)
		(connected loc39 loc86)
		(connected loc86 loc59)
		(connected loc59 loc86)
		(connected loc86 loc60)
		(connected loc60 loc86)
		(connected loc86 loc73)
		(connected loc73 loc86)
		(connected loc86 loc83)
		(connected loc83 loc86)
		(connected loc86 loc85)
		(connected loc85 loc86)
		(connected loc87 loc59)
		(connected loc59 loc87)
		(connected loc88 loc26)
		(connected loc26 loc88)
		(connected loc88 loc38)
		(connected loc38 loc88)
		(connected loc88 loc61)
		(connected loc61 loc88)
		(connected loc88 loc62)
		(connected loc62 loc88)
		(connected loc88 loc89)
		(connected loc89 loc88)
		(connected loc89 loc81)
		(connected loc81 loc89)
		(connected loc89 loc83)
		(connected loc83 loc89)
		(connected loc89 loc85)
		(connected loc85 loc89)
		(connected loc90 loc47)
		(connected loc47 loc90)
		(connected loc90 loc50)
		(connected loc50 loc90)
		(connected loc90 loc57)
		(connected loc57 loc90)
		(connected loc90 loc67)
		(connected loc67 loc90)
		(connected loc90 loc78)
		(connected loc78 loc90)
		(connected loc90 loc85)
		(connected loc85 loc90)
		(connected loc90 loc88)
		(connected loc88 loc90)

		(in bar1 loc1)
		(in bar3 loc3)
		(in bar4 loc4)
		(in bar7 loc7)
		(in bar16 loc16)
		(in bar17 loc17)
		(in bar18 loc18)
		(in bar19 loc19)
		(in bar20 loc20)
		(in bar21 loc21)
		(in bar23 loc23)
		(in bar25 loc25)
		(in bar27 loc27)
		(in bar28 loc28)
		(in bar31 loc31)
		(in bar33 loc33)
		(in bar34 loc34)
		(in bar36 loc36)
		(in bar38 loc38)
		(in bar39 loc39)
		(in bar40 loc40)
		(in bar41 loc41)
		(in bar43 loc43)
		(in bar44 loc44)
		(in bar45 loc45)
		(in bar46 loc46)
		(in bar48 loc48)
		(in bar52 loc52)
		(in bar54 loc54)
		(in bar55 loc55)
		(in bar56 loc56)
		(in bar59 loc59)
		(in bar61 loc61)
		(in bar62 loc62)
		(in bar65 loc65)
		(in bar67 loc67)
		(in bar68 loc68)
		(in bar70 loc70)
		(in bar71 loc71)
		(in bar72 loc72)
		(in bar81 loc81)
		(in bar82 loc82)
		(in bar83 loc83)
		(in bar85 loc85)
		(in bar86 loc86)
		(in bar88 loc88)
		(in bar89 loc89)

	)

	(:goal
		(and
			(at loc90)
		)
	)
)