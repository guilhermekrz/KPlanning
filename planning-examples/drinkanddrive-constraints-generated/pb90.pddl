; Generated by ProblemGenerator - Problem 90 at Sat Nov 26 18:02:21 BRST 2016
(define (problem pb90)
	(:domain drinkanddrive-constraints-generated)
	(:requirements :strips :typing :negative-preconditions)
	(:objects
		loc1 loc2 loc3 loc4 loc5 loc6 loc7 loc8 loc9 loc10 loc11 loc12 loc13 loc14 loc15 loc16 loc17 loc18 loc19 loc20 loc21 loc22 loc23 loc24 loc25 loc26 loc27 loc28 loc29 loc30 loc31 loc32 loc33 loc34 loc35 loc36 loc37 loc38 loc39 loc40 loc41 loc42 loc43 loc44 loc45 loc46 loc47 loc48 loc49 loc50 loc51 loc52 loc53 loc54 loc55 loc56 loc57 loc58 loc59 loc60 loc61 loc62 loc63 loc64 loc65 loc66 loc67 loc68 loc69 loc70 loc71 loc72 loc73 loc74 loc75 loc76 loc77 loc78 loc79 loc80 loc81 loc82 loc83 loc84 loc85 loc86 loc87 loc88 loc89 loc90 loc91 loc92 loc93 loc94 loc95 - location
		bar1 bar2 bar7 bar8 bar9 bar11 bar12 bar13 bar14 bar17 bar18 bar20 bar24 bar25 bar27 bar28 bar30 bar31 bar32 bar33 bar36 bar39 bar40 bar41 bar44 bar45 bar50 bar52 bar54 bar56 bar59 bar60 bar62 bar63 bar71 bar73 bar74 bar77 bar79 bar80 bar87 bar91 bar93 - bar
	)
	(:init
		(at loc1)

		(connected loc65 loc61)
		(connected loc61 loc65)
		(connected loc61 loc64)
		(connected loc64 loc61)
		(connected loc64 loc30)
		(connected loc30 loc64)
		(connected loc30 loc62)
		(connected loc62 loc30)
		(connected loc62 loc35)
		(connected loc35 loc62)
		(connected loc35 loc93)
		(connected loc93 loc35)
		(connected loc35 loc23)
		(connected loc23 loc35)
		(connected loc23 loc58)
		(connected loc58 loc23)
		(connected loc58 loc92)
		(connected loc92 loc58)
		(connected loc92 loc47)
		(connected loc47 loc92)
		(connected loc47 loc76)
		(connected loc76 loc47)
		(connected loc76 loc12)
		(connected loc12 loc76)
		(connected loc12 loc77)
		(connected loc77 loc12)
		(connected loc35 loc13)
		(connected loc13 loc35)
		(connected loc13 loc7)
		(connected loc7 loc13)
		(connected loc7 loc46)
		(connected loc46 loc7)
		(connected loc58 loc11)
		(connected loc11 loc58)
		(connected loc11 loc34)
		(connected loc34 loc11)
		(connected loc34 loc21)
		(connected loc21 loc34)
		(connected loc21 loc85)
		(connected loc85 loc21)
		(connected loc85 loc84)
		(connected loc84 loc85)
		(connected loc84 loc39)
		(connected loc39 loc84)
		(connected loc39 loc36)
		(connected loc36 loc39)
		(connected loc36 loc44)
		(connected loc44 loc36)
		(connected loc44 loc91)
		(connected loc91 loc44)
		(connected loc91 loc4)
		(connected loc4 loc91)
		(connected loc92 loc55)
		(connected loc55 loc92)
		(connected loc55 loc57)
		(connected loc57 loc55)
		(connected loc7 loc74)
		(connected loc74 loc7)
		(connected loc74 loc82)
		(connected loc82 loc74)
		(connected loc47 loc17)
		(connected loc17 loc47)
		(connected loc17 loc71)
		(connected loc71 loc17)
		(connected loc36 loc69)
		(connected loc69 loc36)
		(connected loc69 loc72)
		(connected loc72 loc69)
		(connected loc72 loc53)
		(connected loc53 loc72)
		(connected loc4 loc27)
		(connected loc27 loc4)
		(connected loc27 loc2)
		(connected loc2 loc27)
		(connected loc71 loc54)
		(connected loc54 loc71)
		(connected loc39 loc70)
		(connected loc70 loc39)
		(connected loc71 loc19)
		(connected loc19 loc71)
		(connected loc74 loc68)
		(connected loc68 loc74)
		(connected loc68 loc67)
		(connected loc67 loc68)
		(connected loc77 loc8)
		(connected loc8 loc77)
		(connected loc19 loc38)
		(connected loc38 loc19)
		(connected loc7 loc18)
		(connected loc18 loc7)
		(connected loc39 loc40)
		(connected loc40 loc39)
		(connected loc40 loc87)
		(connected loc87 loc40)
		(connected loc87 loc75)
		(connected loc75 loc87)
		(connected loc91 loc52)
		(connected loc52 loc91)
		(connected loc82 loc94)
		(connected loc94 loc82)
		(connected loc55 loc80)
		(connected loc80 loc55)
		(connected loc65 loc42)
		(connected loc42 loc65)
		(connected loc42 loc83)
		(connected loc83 loc42)
		(connected loc2 loc10)
		(connected loc10 loc2)
		(connected loc10 loc66)
		(connected loc66 loc10)
		(connected loc66 loc22)
		(connected loc22 loc66)
		(connected loc22 loc88)
		(connected loc88 loc22)
		(connected loc88 loc89)
		(connected loc89 loc88)
		(connected loc21 loc31)
		(connected loc31 loc21)
		(connected loc75 loc1)
		(connected loc1 loc75)
		(connected loc30 loc25)
		(connected loc25 loc30)
		(connected loc87 loc45)
		(connected loc45 loc87)
		(connected loc45 loc86)
		(connected loc86 loc45)
		(connected loc57 loc33)
		(connected loc33 loc57)
		(connected loc76 loc20)
		(connected loc20 loc76)
		(connected loc20 loc78)
		(connected loc78 loc20)
		(connected loc85 loc49)
		(connected loc49 loc85)
		(connected loc49 loc26)
		(connected loc26 loc49)
		(connected loc62 loc32)
		(connected loc32 loc62)
		(connected loc62 loc51)
		(connected loc51 loc62)
		(connected loc57 loc3)
		(connected loc3 loc57)
		(connected loc92 loc28)
		(connected loc28 loc92)
		(connected loc84 loc50)
		(connected loc50 loc84)
		(connected loc49 loc5)
		(connected loc5 loc49)
		(connected loc5 loc60)
		(connected loc60 loc5)
		(connected loc60 loc48)
		(connected loc48 loc60)
		(connected loc17 loc15)
		(connected loc15 loc17)
		(connected loc15 loc63)
		(connected loc63 loc15)
		(connected loc21 loc43)
		(connected loc43 loc21)
		(connected loc20 loc95)
		(connected loc95 loc20)
		(connected loc39 loc24)
		(connected loc24 loc39)
		(connected loc50 loc59)
		(connected loc59 loc50)
		(connected loc21 loc79)
		(connected loc79 loc21)
		(connected loc25 loc41)
		(connected loc41 loc25)
		(connected loc34 loc73)
		(connected loc73 loc34)
		(connected loc30 loc29)
		(connected loc29 loc30)
		(connected loc29 loc81)
		(connected loc81 loc29)
		(connected loc24 loc37)
		(connected loc37 loc24)
		(connected loc37 loc90)
		(connected loc90 loc37)
		(connected loc3 loc16)
		(connected loc16 loc3)
		(connected loc25 loc6)
		(connected loc6 loc25)
		(connected loc87 loc56)
		(connected loc56 loc87)
		(connected loc81 loc14)
		(connected loc14 loc81)
		(connected loc17 loc9)
		(connected loc9 loc17)
		(connected loc1 loc9)
		(connected loc9 loc1)
		(connected loc1 loc11)
		(connected loc11 loc1)
		(connected loc1 loc15)
		(connected loc15 loc1)
		(connected loc1 loc25)
		(connected loc25 loc1)
		(connected loc1 loc27)
		(connected loc27 loc1)
		(connected loc1 loc35)
		(connected loc35 loc1)
		(connected loc2 loc7)
		(connected loc7 loc2)
		(connected loc2 loc47)
		(connected loc47 loc2)
		(connected loc3 loc14)
		(connected loc14 loc3)
		(connected loc3 loc20)
		(connected loc20 loc3)
		(connected loc3 loc26)
		(connected loc26 loc3)
		(connected loc3 loc32)
		(connected loc32 loc3)
		(connected loc3 loc40)
		(connected loc40 loc3)
		(connected loc3 loc61)
		(connected loc61 loc3)
		(connected loc4 loc5)
		(connected loc5 loc4)
		(connected loc4 loc19)
		(connected loc19 loc4)
		(connected loc4 loc26)
		(connected loc26 loc4)
		(connected loc4 loc30)
		(connected loc30 loc4)
		(connected loc4 loc39)
		(connected loc39 loc4)
		(connected loc4 loc47)
		(connected loc47 loc4)
		(connected loc4 loc60)
		(connected loc60 loc4)
		(connected loc5 loc3)
		(connected loc3 loc5)
		(connected loc5 loc10)
		(connected loc10 loc5)
		(connected loc5 loc19)
		(connected loc19 loc5)
		(connected loc5 loc32)
		(connected loc32 loc5)
		(connected loc5 loc41)
		(connected loc41 loc5)
		(connected loc5 loc48)
		(connected loc48 loc5)
		(connected loc5 loc56)
		(connected loc56 loc5)
		(connected loc6 loc14)
		(connected loc14 loc6)
		(connected loc6 loc17)
		(connected loc17 loc6)
		(connected loc6 loc26)
		(connected loc26 loc6)
		(connected loc6 loc43)
		(connected loc43 loc6)
		(connected loc6 loc57)
		(connected loc57 loc6)
		(connected loc6 loc84)
		(connected loc84 loc6)
		(connected loc6 loc92)
		(connected loc92 loc6)
		(connected loc7 loc4)
		(connected loc4 loc7)
		(connected loc7 loc19)
		(connected loc19 loc7)
		(connected loc7 loc23)
		(connected loc23 loc7)
		(connected loc7 loc24)
		(connected loc24 loc7)
		(connected loc8 loc11)
		(connected loc11 loc8)
		(connected loc8 loc13)
		(connected loc13 loc8)
		(connected loc8 loc36)
		(connected loc36 loc8)
		(connected loc8 loc42)
		(connected loc42 loc8)
		(connected loc8 loc51)
		(connected loc51 loc8)
		(connected loc8 loc71)
		(connected loc71 loc8)
		(connected loc8 loc79)
		(connected loc79 loc8)
		(connected loc9 loc2)
		(connected loc2 loc9)
		(connected loc9 loc7)
		(connected loc7 loc9)
		(connected loc10 loc6)
		(connected loc6 loc10)
		(connected loc10 loc12)
		(connected loc12 loc10)
		(connected loc10 loc18)
		(connected loc18 loc10)
		(connected loc10 loc53)
		(connected loc53 loc10)
		(connected loc11 loc20)
		(connected loc20 loc11)
		(connected loc11 loc25)
		(connected loc25 loc11)
		(connected loc11 loc41)
		(connected loc41 loc11)
		(connected loc11 loc44)
		(connected loc44 loc11)
		(connected loc11 loc45)
		(connected loc45 loc11)
		(connected loc11 loc56)
		(connected loc56 loc11)
		(connected loc11 loc59)
		(connected loc59 loc11)
		(connected loc11 loc65)
		(connected loc65 loc11)
		(connected loc12 loc9)
		(connected loc9 loc12)
		(connected loc12 loc18)
		(connected loc18 loc12)
		(connected loc12 loc29)
		(connected loc29 loc12)
		(connected loc12 loc55)
		(connected loc55 loc12)
		(connected loc12 loc78)
		(connected loc78 loc12)
		(connected loc13 loc1)
		(connected loc1 loc13)
		(connected loc13 loc21)
		(connected loc21 loc13)
		(connected loc13 loc58)
		(connected loc58 loc13)
		(connected loc14 loc12)
		(connected loc12 loc14)
		(connected loc14 loc16)
		(connected loc16 loc14)
		(connected loc14 loc51)
		(connected loc51 loc14)
		(connected loc14 loc65)
		(connected loc65 loc14)
		(connected loc14 loc81)
		(connected loc81 loc14)
		(connected loc15 loc4)
		(connected loc4 loc15)
		(connected loc15 loc11)
		(connected loc11 loc15)
		(connected loc15 loc31)
		(connected loc31 loc15)
		(connected loc15 loc54)
		(connected loc54 loc15)
		(connected loc15 loc93)
		(connected loc93 loc15)
		(connected loc16 loc29)
		(connected loc29 loc16)
		(connected loc16 loc39)
		(connected loc39 loc16)
		(connected loc17 loc8)
		(connected loc8 loc17)
		(connected loc17 loc22)
		(connected loc22 loc17)
		(connected loc17 loc38)
		(connected loc38 loc17)
		(connected loc17 loc49)
		(connected loc49 loc17)
		(connected loc17 loc57)
		(connected loc57 loc17)
		(connected loc18 loc14)
		(connected loc14 loc18)
		(connected loc18 loc22)
		(connected loc22 loc18)
		(connected loc18 loc56)
		(connected loc56 loc18)
		(connected loc18 loc68)
		(connected loc68 loc18)
		(connected loc18 loc83)
		(connected loc83 loc18)
		(connected loc18 loc84)
		(connected loc84 loc18)
		(connected loc18 loc89)
		(connected loc89 loc18)
		(connected loc19 loc12)
		(connected loc12 loc19)
		(connected loc19 loc26)
		(connected loc26 loc19)
		(connected loc19 loc27)
		(connected loc27 loc19)
		(connected loc19 loc42)
		(connected loc42 loc19)
		(connected loc19 loc49)
		(connected loc49 loc19)
		(connected loc19 loc60)
		(connected loc60 loc19)
		(connected loc19 loc72)
		(connected loc72 loc19)
		(connected loc20 loc11)
		(connected loc11 loc20)
		(connected loc20 loc16)
		(connected loc16 loc20)
		(connected loc20 loc42)
		(connected loc42 loc20)
		(connected loc20 loc72)
		(connected loc72 loc20)
		(connected loc20 loc77)
		(connected loc77 loc20)
		(connected loc20 loc82)
		(connected loc82 loc20)
		(connected loc21 loc2)
		(connected loc2 loc21)
		(connected loc21 loc10)
		(connected loc10 loc21)
		(connected loc21 loc15)
		(connected loc15 loc21)
		(connected loc21 loc18)
		(connected loc18 loc21)
		(connected loc21 loc25)
		(connected loc25 loc21)
		(connected loc22 loc5)
		(connected loc5 loc22)
		(connected loc22 loc8)
		(connected loc8 loc22)
		(connected loc22 loc37)
		(connected loc37 loc22)
		(connected loc22 loc42)
		(connected loc42 loc22)
		(connected loc22 loc50)
		(connected loc50 loc22)
		(connected loc22 loc55)
		(connected loc55 loc22)
		(connected loc22 loc79)
		(connected loc79 loc22)
		(connected loc22 loc86)
		(connected loc86 loc22)
		(connected loc23 loc24)
		(connected loc24 loc23)
		(connected loc23 loc28)
		(connected loc28 loc23)
		(connected loc23 loc55)
		(connected loc55 loc23)
		(connected loc23 loc75)
		(connected loc75 loc23)
		(connected loc24 loc2)
		(connected loc2 loc24)
		(connected loc24 loc6)
		(connected loc6 loc24)
		(connected loc24 loc10)
		(connected loc10 loc24)
		(connected loc24 loc29)
		(connected loc29 loc24)
		(connected loc24 loc43)
		(connected loc43 loc24)
		(connected loc24 loc48)
		(connected loc48 loc24)
		(connected loc24 loc49)
		(connected loc49 loc24)
		(connected loc24 loc63)
		(connected loc63 loc24)
		(connected loc24 loc76)
		(connected loc76 loc24)
		(connected loc25 loc5)
		(connected loc5 loc25)
		(connected loc25 loc18)
		(connected loc18 loc25)
		(connected loc25 loc33)
		(connected loc33 loc25)
		(connected loc25 loc43)
		(connected loc43 loc25)
		(connected loc25 loc63)
		(connected loc63 loc25)
		(connected loc25 loc78)
		(connected loc78 loc25)
		(connected loc26 loc5)
		(connected loc5 loc26)
		(connected loc26 loc10)
		(connected loc10 loc26)
		(connected loc26 loc41)
		(connected loc41 loc26)
		(connected loc26 loc61)
		(connected loc61 loc26)
		(connected loc26 loc65)
		(connected loc65 loc26)
		(connected loc27 loc5)
		(connected loc5 loc27)
		(connected loc27 loc23)
		(connected loc23 loc27)
		(connected loc27 loc26)
		(connected loc26 loc27)
		(connected loc27 loc30)
		(connected loc30 loc27)
		(connected loc27 loc56)
		(connected loc56 loc27)
		(connected loc27 loc57)
		(connected loc57 loc27)
		(connected loc27 loc75)
		(connected loc75 loc27)
		(connected loc27 loc80)
		(connected loc80 loc27)
		(connected loc28 loc1)
		(connected loc1 loc28)
		(connected loc28 loc64)
		(connected loc64 loc28)
		(connected loc29 loc3)
		(connected loc3 loc29)
		(connected loc29 loc9)
		(connected loc9 loc29)
		(connected loc29 loc24)
		(connected loc24 loc29)
		(connected loc29 loc26)
		(connected loc26 loc29)
		(connected loc29 loc38)
		(connected loc38 loc29)
		(connected loc29 loc44)
		(connected loc44 loc29)
		(connected loc29 loc47)
		(connected loc47 loc29)
		(connected loc29 loc52)
		(connected loc52 loc29)
		(connected loc29 loc59)
		(connected loc59 loc29)
		(connected loc29 loc94)
		(connected loc94 loc29)
		(connected loc30 loc27)
		(connected loc27 loc30)
		(connected loc30 loc76)
		(connected loc76 loc30)
		(connected loc31 loc11)
		(connected loc11 loc31)
		(connected loc31 loc34)
		(connected loc34 loc31)
		(connected loc31 loc36)
		(connected loc36 loc31)
		(connected loc31 loc42)
		(connected loc42 loc31)
		(connected loc31 loc47)
		(connected loc47 loc31)
		(connected loc31 loc52)
		(connected loc52 loc31)
		(connected loc31 loc54)
		(connected loc54 loc31)
		(connected loc31 loc71)
		(connected loc71 loc31)
		(connected loc31 loc76)
		(connected loc76 loc31)
		(connected loc31 loc85)
		(connected loc85 loc31)
		(connected loc31 loc94)
		(connected loc94 loc31)
		(connected loc32 loc4)
		(connected loc4 loc32)
		(connected loc32 loc17)
		(connected loc17 loc32)
		(connected loc32 loc22)
		(connected loc22 loc32)
		(connected loc32 loc27)
		(connected loc27 loc32)
		(connected loc32 loc51)
		(connected loc51 loc32)
		(connected loc32 loc54)
		(connected loc54 loc32)
		(connected loc32 loc81)
		(connected loc81 loc32)
		(connected loc32 loc84)
		(connected loc84 loc32)
		(connected loc33 loc4)
		(connected loc4 loc33)
		(connected loc33 loc17)
		(connected loc17 loc33)
		(connected loc33 loc37)
		(connected loc37 loc33)
		(connected loc33 loc43)
		(connected loc43 loc33)
		(connected loc33 loc46)
		(connected loc46 loc33)
		(connected loc33 loc67)
		(connected loc67 loc33)
		(connected loc34 loc5)
		(connected loc5 loc34)
		(connected loc34 loc18)
		(connected loc18 loc34)
		(connected loc34 loc30)
		(connected loc30 loc34)
		(connected loc34 loc50)
		(connected loc50 loc34)
		(connected loc34 loc54)
		(connected loc54 loc34)
		(connected loc34 loc59)
		(connected loc59 loc34)
		(connected loc34 loc83)
		(connected loc83 loc34)
		(connected loc34 loc84)
		(connected loc84 loc34)
		(connected loc34 loc87)
		(connected loc87 loc34)
		(connected loc35 loc51)
		(connected loc51 loc35)
		(connected loc35 loc56)
		(connected loc56 loc35)
		(connected loc35 loc70)
		(connected loc70 loc35)
		(connected loc35 loc72)
		(connected loc72 loc35)
		(connected loc35 loc73)
		(connected loc73 loc35)
		(connected loc35 loc87)
		(connected loc87 loc35)
		(connected loc35 loc88)
		(connected loc88 loc35)
		(connected loc36 loc8)
		(connected loc8 loc36)
		(connected loc36 loc29)
		(connected loc29 loc36)
		(connected loc36 loc43)
		(connected loc43 loc36)
		(connected loc36 loc45)
		(connected loc45 loc36)
		(connected loc36 loc47)
		(connected loc47 loc36)
		(connected loc36 loc48)
		(connected loc48 loc36)
		(connected loc36 loc52)
		(connected loc52 loc36)
		(connected loc36 loc68)
		(connected loc68 loc36)
		(connected loc36 loc82)
		(connected loc82 loc36)
		(connected loc37 loc19)
		(connected loc19 loc37)
		(connected loc37 loc33)
		(connected loc33 loc37)
		(connected loc37 loc38)
		(connected loc38 loc37)
		(connected loc37 loc42)
		(connected loc42 loc37)
		(connected loc37 loc61)
		(connected loc61 loc37)
		(connected loc37 loc67)
		(connected loc67 loc37)
		(connected loc37 loc94)
		(connected loc94 loc37)
		(connected loc38 loc10)
		(connected loc10 loc38)
		(connected loc38 loc29)
		(connected loc29 loc38)
		(connected loc38 loc30)
		(connected loc30 loc38)
		(connected loc38 loc35)
		(connected loc35 loc38)
		(connected loc38 loc45)
		(connected loc45 loc38)
		(connected loc38 loc48)
		(connected loc48 loc38)
		(connected loc38 loc73)
		(connected loc73 loc38)
		(connected loc39 loc7)
		(connected loc7 loc39)
		(connected loc39 loc32)
		(connected loc32 loc39)
		(connected loc39 loc37)
		(connected loc37 loc39)
		(connected loc39 loc41)
		(connected loc41 loc39)
		(connected loc39 loc63)
		(connected loc63 loc39)
		(connected loc39 loc85)
		(connected loc85 loc39)
		(connected loc39 loc89)
		(connected loc89 loc39)
		(connected loc40 loc7)
		(connected loc7 loc40)
		(connected loc40 loc18)
		(connected loc18 loc40)
		(connected loc40 loc47)
		(connected loc47 loc40)
		(connected loc40 loc56)
		(connected loc56 loc40)
		(connected loc40 loc58)
		(connected loc58 loc40)
		(connected loc40 loc68)
		(connected loc68 loc40)
		(connected loc40 loc76)
		(connected loc76 loc40)
		(connected loc40 loc80)
		(connected loc80 loc40)
		(connected loc41 loc7)
		(connected loc7 loc41)
		(connected loc41 loc13)
		(connected loc13 loc41)
		(connected loc41 loc19)
		(connected loc19 loc41)
		(connected loc41 loc25)
		(connected loc25 loc41)
		(connected loc41 loc28)
		(connected loc28 loc41)
		(connected loc41 loc34)
		(connected loc34 loc41)
		(connected loc41 loc45)
		(connected loc45 loc41)
		(connected loc41 loc46)
		(connected loc46 loc41)
		(connected loc41 loc65)
		(connected loc65 loc41)
		(connected loc41 loc84)
		(connected loc84 loc41)
		(connected loc41 loc87)
		(connected loc87 loc41)
		(connected loc42 loc37)
		(connected loc37 loc42)
		(connected loc42 loc38)
		(connected loc38 loc42)
		(connected loc42 loc39)
		(connected loc39 loc42)
		(connected loc42 loc44)
		(connected loc44 loc42)
		(connected loc42 loc54)
		(connected loc54 loc42)
		(connected loc42 loc66)
		(connected loc66 loc42)
		(connected loc42 loc70)
		(connected loc70 loc42)
		(connected loc43 loc4)
		(connected loc4 loc43)
		(connected loc43 loc20)
		(connected loc20 loc43)
		(connected loc43 loc22)
		(connected loc22 loc43)
		(connected loc43 loc23)
		(connected loc23 loc43)
		(connected loc43 loc24)
		(connected loc24 loc43)
		(connected loc43 loc34)
		(connected loc34 loc43)
		(connected loc43 loc41)
		(connected loc41 loc43)
		(connected loc43 loc44)
		(connected loc44 loc43)
		(connected loc43 loc50)
		(connected loc50 loc43)
		(connected loc43 loc52)
		(connected loc52 loc43)
		(connected loc43 loc57)
		(connected loc57 loc43)
		(connected loc43 loc66)
		(connected loc66 loc43)
		(connected loc44 loc64)
		(connected loc64 loc44)
		(connected loc44 loc73)
		(connected loc73 loc44)
		(connected loc44 loc74)
		(connected loc74 loc44)
		(connected loc44 loc80)
		(connected loc80 loc44)
		(connected loc45 loc29)
		(connected loc29 loc45)
		(connected loc45 loc56)
		(connected loc56 loc45)
		(connected loc45 loc85)
		(connected loc85 loc45)
		(connected loc46 loc11)
		(connected loc11 loc46)
		(connected loc46 loc35)
		(connected loc35 loc46)
		(connected loc46 loc41)
		(connected loc41 loc46)
		(connected loc46 loc59)
		(connected loc59 loc46)
		(connected loc46 loc61)
		(connected loc61 loc46)
		(connected loc46 loc81)
		(connected loc81 loc46)
		(connected loc46 loc83)
		(connected loc83 loc46)
		(connected loc47 loc9)
		(connected loc9 loc47)
		(connected loc47 loc16)
		(connected loc16 loc47)
		(connected loc47 loc75)
		(connected loc75 loc47)
		(connected loc47 loc81)
		(connected loc81 loc47)
		(connected loc47 loc88)
		(connected loc88 loc47)
		(connected loc48 loc7)
		(connected loc7 loc48)
		(connected loc48 loc14)
		(connected loc14 loc48)
		(connected loc48 loc58)
		(connected loc58 loc48)
		(connected loc48 loc74)
		(connected loc74 loc48)
		(connected loc48 loc77)
		(connected loc77 loc48)
		(connected loc48 loc94)
		(connected loc94 loc48)
		(connected loc49 loc35)
		(connected loc35 loc49)
		(connected loc49 loc36)
		(connected loc36 loc49)
		(connected loc49 loc55)
		(connected loc55 loc49)
		(connected loc49 loc59)
		(connected loc59 loc49)
		(connected loc49 loc60)
		(connected loc60 loc49)
		(connected loc49 loc68)
		(connected loc68 loc49)
		(connected loc50 loc4)
		(connected loc4 loc50)
		(connected loc50 loc15)
		(connected loc15 loc50)
		(connected loc50 loc48)
		(connected loc48 loc50)
		(connected loc50 loc72)
		(connected loc72 loc50)
		(connected loc50 loc88)
		(connected loc88 loc50)
		(connected loc50 loc90)
		(connected loc90 loc50)
		(connected loc51 loc19)
		(connected loc19 loc51)
		(connected loc51 loc20)
		(connected loc20 loc51)
		(connected loc51 loc47)
		(connected loc47 loc51)
		(connected loc51 loc66)
		(connected loc66 loc51)
		(connected loc51 loc68)
		(connected loc68 loc51)
		(connected loc51 loc70)
		(connected loc70 loc51)
		(connected loc51 loc73)
		(connected loc73 loc51)
		(connected loc51 loc87)
		(connected loc87 loc51)
		(connected loc52 loc21)
		(connected loc21 loc52)
		(connected loc52 loc40)
		(connected loc40 loc52)
		(connected loc52 loc44)
		(connected loc44 loc52)
		(connected loc52 loc50)
		(connected loc50 loc52)
		(connected loc52 loc73)
		(connected loc73 loc52)
		(connected loc53 loc7)
		(connected loc7 loc53)
		(connected loc53 loc8)
		(connected loc8 loc53)
		(connected loc53 loc34)
		(connected loc34 loc53)
		(connected loc53 loc46)
		(connected loc46 loc53)
		(connected loc53 loc47)
		(connected loc47 loc53)
		(connected loc53 loc64)
		(connected loc64 loc53)
		(connected loc53 loc65)
		(connected loc65 loc53)
		(connected loc53 loc81)
		(connected loc81 loc53)
		(connected loc54 loc36)
		(connected loc36 loc54)
		(connected loc54 loc53)
		(connected loc53 loc54)
		(connected loc54 loc56)
		(connected loc56 loc54)
		(connected loc54 loc67)
		(connected loc67 loc54)
		(connected loc54 loc83)
		(connected loc83 loc54)
		(connected loc54 loc87)
		(connected loc87 loc54)
		(connected loc55 loc1)
		(connected loc1 loc55)
		(connected loc55 loc21)
		(connected loc21 loc55)
		(connected loc55 loc26)
		(connected loc26 loc55)
		(connected loc55 loc50)
		(connected loc50 loc55)
		(connected loc55 loc56)
		(connected loc56 loc55)
		(connected loc55 loc82)
		(connected loc82 loc55)
		(connected loc56 loc13)
		(connected loc13 loc56)
		(connected loc56 loc48)
		(connected loc48 loc56)
		(connected loc56 loc70)
		(connected loc70 loc56)
		(connected loc57 loc19)
		(connected loc19 loc57)
		(connected loc57 loc22)
		(connected loc22 loc57)
		(connected loc57 loc25)
		(connected loc25 loc57)
		(connected loc57 loc31)
		(connected loc31 loc57)
		(connected loc57 loc41)
		(connected loc41 loc57)
		(connected loc57 loc62)
		(connected loc62 loc57)
		(connected loc57 loc76)
		(connected loc76 loc57)
		(connected loc58 loc8)
		(connected loc8 loc58)
		(connected loc58 loc21)
		(connected loc21 loc58)
		(connected loc58 loc45)
		(connected loc45 loc58)
		(connected loc58 loc87)
		(connected loc87 loc58)
		(connected loc58 loc89)
		(connected loc89 loc58)
		(connected loc58 loc94)
		(connected loc94 loc58)
		(connected loc59 loc21)
		(connected loc21 loc59)
		(connected loc59 loc39)
		(connected loc39 loc59)
		(connected loc59 loc54)
		(connected loc54 loc59)
		(connected loc59 loc65)
		(connected loc65 loc59)
		(connected loc59 loc70)
		(connected loc70 loc59)
		(connected loc59 loc79)
		(connected loc79 loc59)
		(connected loc59 loc86)
		(connected loc86 loc59)
		(connected loc60 loc12)
		(connected loc12 loc60)
		(connected loc60 loc21)
		(connected loc21 loc60)
		(connected loc60 loc29)
		(connected loc29 loc60)
		(connected loc60 loc39)
		(connected loc39 loc60)
		(connected loc60 loc44)
		(connected loc44 loc60)
		(connected loc60 loc58)
		(connected loc58 loc60)
		(connected loc60 loc62)
		(connected loc62 loc60)
		(connected loc60 loc64)
		(connected loc64 loc60)
		(connected loc60 loc68)
		(connected loc68 loc60)
		(connected loc60 loc81)
		(connected loc81 loc60)
		(connected loc61 loc17)
		(connected loc17 loc61)
		(connected loc61 loc30)
		(connected loc30 loc61)
		(connected loc61 loc47)
		(connected loc47 loc61)
		(connected loc61 loc65)
		(connected loc65 loc61)
		(connected loc61 loc84)
		(connected loc84 loc61)
		(connected loc61 loc86)
		(connected loc86 loc61)
		(connected loc61 loc90)
		(connected loc90 loc61)
		(connected loc61 loc91)
		(connected loc91 loc61)
		(connected loc62 loc45)
		(connected loc45 loc62)
		(connected loc62 loc49)
		(connected loc49 loc62)
		(connected loc62 loc68)
		(connected loc68 loc62)
		(connected loc63 loc24)
		(connected loc24 loc63)
		(connected loc63 loc41)
		(connected loc41 loc63)
		(connected loc63 loc58)
		(connected loc58 loc63)
		(connected loc63 loc61)
		(connected loc61 loc63)
		(connected loc63 loc72)
		(connected loc72 loc63)
		(connected loc63 loc76)
		(connected loc76 loc63)
		(connected loc63 loc88)
		(connected loc88 loc63)
		(connected loc63 loc93)
		(connected loc93 loc63)
		(connected loc64 loc19)
		(connected loc19 loc64)
		(connected loc64 loc58)
		(connected loc58 loc64)
		(connected loc64 loc83)
		(connected loc83 loc64)
		(connected loc65 loc15)
		(connected loc15 loc65)
		(connected loc65 loc20)
		(connected loc20 loc65)
		(connected loc65 loc24)
		(connected loc24 loc65)
		(connected loc65 loc31)
		(connected loc31 loc65)
		(connected loc65 loc34)
		(connected loc34 loc65)
		(connected loc65 loc56)
		(connected loc56 loc65)
		(connected loc65 loc60)
		(connected loc60 loc65)
		(connected loc65 loc64)
		(connected loc64 loc65)
		(connected loc65 loc68)
		(connected loc68 loc65)
		(connected loc65 loc92)
		(connected loc92 loc65)
		(connected loc66 loc10)
		(connected loc10 loc66)
		(connected loc66 loc47)
		(connected loc47 loc66)
		(connected loc66 loc61)
		(connected loc61 loc66)
		(connected loc66 loc81)
		(connected loc81 loc66)
		(connected loc66 loc92)
		(connected loc92 loc66)
		(connected loc67 loc8)
		(connected loc8 loc67)
		(connected loc67 loc11)
		(connected loc11 loc67)
		(connected loc67 loc17)
		(connected loc17 loc67)
		(connected loc67 loc30)
		(connected loc30 loc67)
		(connected loc67 loc46)
		(connected loc46 loc67)
		(connected loc67 loc54)
		(connected loc54 loc67)
		(connected loc67 loc57)
		(connected loc57 loc67)
		(connected loc67 loc76)
		(connected loc76 loc67)
		(connected loc67 loc82)
		(connected loc82 loc67)
		(connected loc67 loc89)
		(connected loc89 loc67)
		(connected loc68 loc37)
		(connected loc37 loc68)
		(connected loc68 loc77)
		(connected loc77 loc68)
		(connected loc68 loc91)
		(connected loc91 loc68)
		(connected loc69 loc22)
		(connected loc22 loc69)
		(connected loc69 loc27)
		(connected loc27 loc69)
		(connected loc69 loc67)
		(connected loc67 loc69)
		(connected loc69 loc79)
		(connected loc79 loc69)
		(connected loc70 loc14)
		(connected loc14 loc70)
		(connected loc70 loc21)
		(connected loc21 loc70)
		(connected loc70 loc41)
		(connected loc41 loc70)
		(connected loc70 loc55)
		(connected loc55 loc70)
		(connected loc70 loc67)
		(connected loc67 loc70)
		(connected loc70 loc74)
		(connected loc74 loc70)
		(connected loc71 loc13)
		(connected loc13 loc71)
		(connected loc71 loc34)
		(connected loc34 loc71)
		(connected loc71 loc44)
		(connected loc44 loc71)
		(connected loc71 loc56)
		(connected loc56 loc71)
		(connected loc71 loc76)
		(connected loc76 loc71)
		(connected loc72 loc81)
		(connected loc81 loc72)
		(connected loc72 loc88)
		(connected loc88 loc72)
		(connected loc72 loc92)
		(connected loc92 loc72)
		(connected loc72 loc93)
		(connected loc93 loc72)
		(connected loc73 loc41)
		(connected loc41 loc73)
		(connected loc73 loc44)
		(connected loc44 loc73)
		(connected loc73 loc57)
		(connected loc57 loc73)
		(connected loc74 loc49)
		(connected loc49 loc74)
		(connected loc74 loc53)
		(connected loc53 loc74)
		(connected loc74 loc56)
		(connected loc56 loc74)
		(connected loc74 loc57)
		(connected loc57 loc74)
		(connected loc74 loc63)
		(connected loc63 loc74)
		(connected loc74 loc71)
		(connected loc71 loc74)
		(connected loc74 loc76)
		(connected loc76 loc74)
		(connected loc74 loc77)
		(connected loc77 loc74)
		(connected loc74 loc85)
		(connected loc85 loc74)
		(connected loc74 loc90)
		(connected loc90 loc74)
		(connected loc75 loc16)
		(connected loc16 loc75)
		(connected loc75 loc29)
		(connected loc29 loc75)
		(connected loc75 loc34)
		(connected loc34 loc75)
		(connected loc75 loc72)
		(connected loc72 loc75)
		(connected loc75 loc86)
		(connected loc86 loc75)
		(connected loc76 loc34)
		(connected loc34 loc76)
		(connected loc76 loc49)
		(connected loc49 loc76)
		(connected loc76 loc50)
		(connected loc50 loc76)
		(connected loc76 loc75)
		(connected loc75 loc76)
		(connected loc76 loc77)
		(connected loc77 loc76)
		(connected loc76 loc80)
		(connected loc80 loc76)
		(connected loc77 loc21)
		(connected loc21 loc77)
		(connected loc77 loc37)
		(connected loc37 loc77)
		(connected loc77 loc39)
		(connected loc39 loc77)
		(connected loc77 loc50)
		(connected loc50 loc77)
		(connected loc77 loc51)
		(connected loc51 loc77)
		(connected loc77 loc66)
		(connected loc66 loc77)
		(connected loc77 loc75)
		(connected loc75 loc77)
		(connected loc77 loc81)
		(connected loc81 loc77)
		(connected loc77 loc83)
		(connected loc83 loc77)
		(connected loc78 loc39)
		(connected loc39 loc78)
		(connected loc78 loc56)
		(connected loc56 loc78)
		(connected loc78 loc70)
		(connected loc70 loc78)
		(connected loc78 loc76)
		(connected loc76 loc78)
		(connected loc78 loc85)
		(connected loc85 loc78)
		(connected loc78 loc93)
		(connected loc93 loc78)
		(connected loc79 loc11)
		(connected loc11 loc79)
		(connected loc79 loc57)
		(connected loc57 loc79)
		(connected loc79 loc61)
		(connected loc61 loc79)
		(connected loc79 loc62)
		(connected loc62 loc79)
		(connected loc79 loc65)
		(connected loc65 loc79)
		(connected loc79 loc76)
		(connected loc76 loc79)
		(connected loc80 loc14)
		(connected loc14 loc80)
		(connected loc80 loc70)
		(connected loc70 loc80)
		(connected loc80 loc77)
		(connected loc77 loc80)
		(connected loc80 loc79)
		(connected loc79 loc80)
		(connected loc80 loc86)
		(connected loc86 loc80)
		(connected loc81 loc19)
		(connected loc19 loc81)
		(connected loc81 loc35)
		(connected loc35 loc81)
		(connected loc81 loc71)
		(connected loc71 loc81)
		(connected loc81 loc75)
		(connected loc75 loc81)
		(connected loc81 loc89)
		(connected loc89 loc81)
		(connected loc82 loc54)
		(connected loc54 loc82)
		(connected loc82 loc76)
		(connected loc76 loc82)
		(connected loc82 loc86)
		(connected loc86 loc82)
		(connected loc82 loc87)
		(connected loc87 loc82)
		(connected loc83 loc15)
		(connected loc15 loc83)
		(connected loc83 loc56)
		(connected loc56 loc83)
		(connected loc83 loc66)
		(connected loc66 loc83)
		(connected loc83 loc76)
		(connected loc76 loc83)
		(connected loc84 loc8)
		(connected loc8 loc84)
		(connected loc84 loc38)
		(connected loc38 loc84)
		(connected loc84 loc44)
		(connected loc44 loc84)
		(connected loc84 loc52)
		(connected loc52 loc84)
		(connected loc84 loc55)
		(connected loc55 loc84)
		(connected loc84 loc58)
		(connected loc58 loc84)
		(connected loc84 loc65)
		(connected loc65 loc84)
		(connected loc85 loc31)
		(connected loc31 loc85)
		(connected loc85 loc40)
		(connected loc40 loc85)
		(connected loc85 loc79)
		(connected loc79 loc85)
		(connected loc86 loc62)
		(connected loc62 loc86)
		(connected loc86 loc67)
		(connected loc67 loc86)
		(connected loc86 loc77)
		(connected loc77 loc86)
		(connected loc86 loc90)
		(connected loc90 loc86)
		(connected loc87 loc54)
		(connected loc54 loc87)
		(connected loc88 loc45)
		(connected loc45 loc88)
		(connected loc88 loc47)
		(connected loc47 loc88)
		(connected loc88 loc57)
		(connected loc57 loc88)
		(connected loc88 loc75)
		(connected loc75 loc88)
		(connected loc88 loc80)
		(connected loc80 loc88)
		(connected loc89 loc62)
		(connected loc62 loc89)
		(connected loc89 loc77)
		(connected loc77 loc89)
		(connected loc89 loc85)
		(connected loc85 loc89)
		(connected loc89 loc92)
		(connected loc92 loc89)
		(connected loc89 loc94)
		(connected loc94 loc89)
		(connected loc90 loc15)
		(connected loc15 loc90)
		(connected loc90 loc32)
		(connected loc32 loc90)
		(connected loc90 loc63)
		(connected loc63 loc90)
		(connected loc90 loc71)
		(connected loc71 loc90)
		(connected loc90 loc86)
		(connected loc86 loc90)
		(connected loc91 loc34)
		(connected loc34 loc91)
		(connected loc91 loc47)
		(connected loc47 loc91)
		(connected loc91 loc90)
		(connected loc90 loc91)
		(connected loc92 loc12)
		(connected loc12 loc92)
		(connected loc92 loc33)
		(connected loc33 loc92)
		(connected loc92 loc37)
		(connected loc37 loc92)
		(connected loc92 loc60)
		(connected loc60 loc92)
		(connected loc92 loc74)
		(connected loc74 loc92)
		(connected loc92 loc77)
		(connected loc77 loc92)
		(connected loc92 loc95)
		(connected loc95 loc92)
		(connected loc93 loc29)
		(connected loc29 loc93)
		(connected loc93 loc43)
		(connected loc43 loc93)
		(connected loc93 loc44)
		(connected loc44 loc93)
		(connected loc93 loc64)
		(connected loc64 loc93)
		(connected loc93 loc70)
		(connected loc70 loc93)
		(connected loc93 loc71)
		(connected loc71 loc93)
		(connected loc93 loc78)
		(connected loc78 loc93)
		(connected loc94 loc45)
		(connected loc45 loc94)
		(connected loc94 loc59)
		(connected loc59 loc94)
		(connected loc94 loc62)
		(connected loc62 loc94)
		(connected loc94 loc63)
		(connected loc63 loc94)
		(connected loc94 loc64)
		(connected loc64 loc94)
		(connected loc94 loc95)
		(connected loc95 loc94)
		(connected loc95 loc14)
		(connected loc14 loc95)
		(connected loc95 loc27)
		(connected loc27 loc95)

		(in bar1 loc1)
		(in bar2 loc2)
		(in bar7 loc7)
		(in bar8 loc8)
		(in bar9 loc9)
		(in bar11 loc11)
		(in bar12 loc12)
		(in bar13 loc13)
		(in bar14 loc14)
		(in bar17 loc17)
		(in bar18 loc18)
		(in bar20 loc20)
		(in bar24 loc24)
		(in bar25 loc25)
		(in bar27 loc27)
		(in bar28 loc28)
		(in bar30 loc30)
		(in bar31 loc31)
		(in bar32 loc32)
		(in bar33 loc33)
		(in bar36 loc36)
		(in bar39 loc39)
		(in bar40 loc40)
		(in bar41 loc41)
		(in bar44 loc44)
		(in bar45 loc45)
		(in bar50 loc50)
		(in bar52 loc52)
		(in bar54 loc54)
		(in bar56 loc56)
		(in bar59 loc59)
		(in bar60 loc60)
		(in bar62 loc62)
		(in bar63 loc63)
		(in bar71 loc71)
		(in bar73 loc73)
		(in bar74 loc74)
		(in bar77 loc77)
		(in bar79 loc79)
		(in bar80 loc80)
		(in bar87 loc87)
		(in bar91 loc91)
		(in bar93 loc93)

	)

	(:goal
		(and
			(at loc95)
		)
	)
	(:constraints
		(and
			(preference a1 (sometime (drunk)))
		)
	)
)