(define (problem puzznic-18)
(:domain puzznic)
(:objects block0 - movable-block block1 - movable-block block2 - movable-block block3 - immovable-block block4 - immovable-block block5 - immovable-block block6 - immovable-block block7 - movable-block block8 - movable-block block9 - movable-block block10 - movable-block block11 - movable-block block12 - movable-block block13 - immovable-block block14 - matching-block block15 - movable-block block16 - immovable-block block17 - movable-block block18 - movable-block block19 - movable-block block20 - movable-block block21 - movable-block block22 - movable-block block23 - immovable-block block24 - matching-block block25 - movable-block block26 - immovable-block block27 - movable-block block28 - movable-block block29 - movable-block block30 - immovable-block block31 - immovable-block block32 - immovable-block block33 - immovable-block block34 - matching-block block35 - movable-block block36 - immovable-block block37 - immovable-block block38 - immovable-block block39 - immovable-block block40 - immovable-block block41 - matching-block block42 - matching-block block43 - movable-block block44 - matching-block block45 - movable-block block46 - movable-block block47 - movable-block block48 - movable-block block49 - immovable-block block50 - immovable-block block51 - matching-block block52 - matching-block block53 - matching-block block54 - matching-block block55 - movable-block block56 - movable-block block57 - movable-block block58 - matching-block block59 - immovable-block block60 - immovable-block block61 - immovable-block block62 - immovable-block block63 - immovable-block block64 - matching-block block65 - movable-block block66 - immovable-block block67 - immovable-block block68 - immovable-block block69 - immovable-block block70 - movable-block block71 - movable-block block72 - movable-block block73 - immovable-block block74 - matching-block block75 - movable-block block76 - immovable-block block77 - movable-block block78 - movable-block block79 - movable-block block80 - movable-block block81 - movable-block block82 - movable-block block83 - immovable-block block84 - matching-block block85 - movable-block block86 - immovable-block block87 - movable-block block88 - movable-block block89 - movable-block block90 - movable-block block91 - movable-block block92 - movable-block block93 - immovable-block block94 - matching-block block95 - movable-block block96 - immovable-block block97 - movable-block block98 - movable-block block99 - movable-block block100 - movable-block block101 - movable-block block102 - movable-block block103 - immovable-block block104 - matching-block block105 - movable-block block106 - immovable-block block107 - movable-block block108 - movable-block block109 - movable-block block110 - movable-block block111 - movable-block block112 - movable-block block113 - immovable-block block114 - immovable-block block115 - immovable-block block116 - immovable-block block117 - movable-block block118 - movable-block block119 - movable-block)
(:init
	(is-empty block0)
	(right block0 block1)
	(down block0 block10)
	(is-empty block1)
	(left block1 block0)
	(right block1 block2)
	(down block1 block11)
	(is-empty block2)
	(left block2 block1)
	(right block2 block3)
	(down block2 block12)
	(is-immovable block3)
	(left block3 block2)
	(right block3 block4)
	(down block3 block13)
	(is-immovable block4)
	(left block4 block3)
	(right block4 block5)
	(down block4 block14)
	(is-immovable block5)
	(left block5 block4)
	(right block5 block6)
	(down block5 block15)
	(is-immovable block6)
	(left block6 block5)
	(right block6 block7)
	(down block6 block16)
	(is-empty block7)
	(left block7 block6)
	(right block7 block8)
	(down block7 block17)
	(is-empty block8)
	(left block8 block7)
	(right block8 block9)
	(down block8 block18)
	(is-empty block9)
	(left block9 block8)
	(right block9 block10)
	(down block9 block19)
	(is-empty block10)
	(left block10 block9)
	(up block10 block0)
	(right block10 block11)
	(down block10 block20)
	(is-empty block11)
	(left block11 block10)
	(up block11 block1)
	(right block11 block12)
	(down block11 block21)
	(is-empty block12)
	(left block12 block11)
	(up block12 block2)
	(right block12 block13)
	(down block12 block22)
	(is-immovable block13)
	(left block13 block12)
	(up block13 block3)
	(right block13 block14)
	(down block13 block23)
	(left block14 block13)
	(up block14 block4)
	(right block14 block15)
	(down block14 block24)
	(is-empty block15)
	(left block15 block14)
	(up block15 block5)
	(right block15 block16)
	(down block15 block25)
	(is-immovable block16)
	(left block16 block15)
	(up block16 block6)
	(right block16 block17)
	(down block16 block26)
	(is-empty block17)
	(left block17 block16)
	(up block17 block7)
	(right block17 block18)
	(down block17 block27)
	(is-empty block18)
	(left block18 block17)
	(up block18 block8)
	(right block18 block19)
	(down block18 block28)
	(is-empty block19)
	(left block19 block18)
	(up block19 block9)
	(right block19 block20)
	(down block19 block29)
	(is-empty block20)
	(left block20 block19)
	(up block20 block10)
	(right block20 block21)
	(down block20 block30)
	(is-empty block21)
	(left block21 block20)
	(up block21 block11)
	(right block21 block22)
	(down block21 block31)
	(is-empty block22)
	(left block22 block21)
	(up block22 block12)
	(right block22 block23)
	(down block22 block32)
	(is-immovable block23)
	(left block23 block22)
	(up block23 block13)
	(right block23 block24)
	(down block23 block33)
	(left block24 block23)
	(up block24 block14)
	(right block24 block25)
	(down block24 block34)
	(is-empty block25)
	(left block25 block24)
	(up block25 block15)
	(right block25 block26)
	(down block25 block35)
	(is-immovable block26)
	(left block26 block25)
	(up block26 block16)
	(right block26 block27)
	(down block26 block36)
	(is-empty block27)
	(left block27 block26)
	(up block27 block17)
	(right block27 block28)
	(down block27 block37)
	(is-empty block28)
	(left block28 block27)
	(up block28 block18)
	(right block28 block29)
	(down block28 block38)
	(is-empty block29)
	(left block29 block28)
	(up block29 block19)
	(right block29 block30)
	(down block29 block39)
	(is-immovable block30)
	(left block30 block29)
	(up block30 block20)
	(right block30 block31)
	(down block30 block40)
	(is-immovable block31)
	(left block31 block30)
	(up block31 block21)
	(right block31 block32)
	(down block31 block41)
	(is-immovable block32)
	(left block32 block31)
	(up block32 block22)
	(right block32 block33)
	(down block32 block42)
	(is-immovable block33)
	(left block33 block32)
	(up block33 block23)
	(right block33 block34)
	(down block33 block43)
	(left block34 block33)
	(up block34 block24)
	(right block34 block35)
	(down block34 block44)
	(is-empty block35)
	(left block35 block34)
	(up block35 block25)
	(right block35 block36)
	(down block35 block45)
	(is-immovable block36)
	(left block36 block35)
	(up block36 block26)
	(right block36 block37)
	(down block36 block46)
	(is-immovable block37)
	(left block37 block36)
	(up block37 block27)
	(right block37 block38)
	(down block37 block47)
	(is-immovable block38)
	(left block38 block37)
	(up block38 block28)
	(right block38 block39)
	(down block38 block48)
	(is-immovable block39)
	(left block39 block38)
	(up block39 block29)
	(right block39 block40)
	(down block39 block49)
	(is-immovable block40)
	(left block40 block39)
	(up block40 block30)
	(right block40 block41)
	(down block40 block50)
	(left block41 block40)
	(up block41 block31)
	(right block41 block42)
	(down block41 block51)
	(left block42 block41)
	(up block42 block32)
	(right block42 block43)
	(down block42 block52)
	(is-empty block43)
	(left block43 block42)
	(up block43 block33)
	(right block43 block44)
	(down block43 block53)
	(left block44 block43)
	(up block44 block34)
	(right block44 block45)
	(down block44 block54)
	(is-empty block45)
	(left block45 block44)
	(up block45 block35)
	(right block45 block46)
	(down block45 block55)
	(is-empty block46)
	(left block46 block45)
	(up block46 block36)
	(right block46 block47)
	(down block46 block56)
	(is-empty block47)
	(left block47 block46)
	(up block47 block37)
	(right block47 block48)
	(down block47 block57)
	(is-empty block48)
	(left block48 block47)
	(up block48 block38)
	(right block48 block49)
	(down block48 block58)
	(is-immovable block49)
	(left block49 block48)
	(up block49 block39)
	(right block49 block50)
	(down block49 block59)
	(is-immovable block50)
	(left block50 block49)
	(up block50 block40)
	(right block50 block51)
	(down block50 block60)
	(left block51 block50)
	(up block51 block41)
	(right block51 block52)
	(down block51 block61)
	(left block52 block51)
	(up block52 block42)
	(right block52 block53)
	(down block52 block62)
	(left block53 block52)
	(up block53 block43)
	(right block53 block54)
	(down block53 block63)
	(left block54 block53)
	(up block54 block44)
	(right block54 block55)
	(down block54 block64)
	(is-empty block55)
	(left block55 block54)
	(up block55 block45)
	(right block55 block56)
	(down block55 block65)
	(is-empty block56)
	(left block56 block55)
	(up block56 block46)
	(right block56 block57)
	(down block56 block66)
	(is-empty block57)
	(left block57 block56)
	(up block57 block47)
	(right block57 block58)
	(down block57 block67)
	(left block58 block57)
	(up block58 block48)
	(right block58 block59)
	(down block58 block68)
	(is-immovable block59)
	(left block59 block58)
	(up block59 block49)
	(right block59 block60)
	(down block59 block69)
	(is-immovable block60)
	(left block60 block59)
	(up block60 block50)
	(right block60 block61)
	(down block60 block70)
	(is-immovable block61)
	(left block61 block60)
	(up block61 block51)
	(right block61 block62)
	(down block61 block71)
	(is-immovable block62)
	(left block62 block61)
	(up block62 block52)
	(right block62 block63)
	(down block62 block72)
	(is-immovable block63)
	(left block63 block62)
	(up block63 block53)
	(right block63 block64)
	(down block63 block73)
	(left block64 block63)
	(up block64 block54)
	(right block64 block65)
	(down block64 block74)
	(is-empty block65)
	(left block65 block64)
	(up block65 block55)
	(right block65 block66)
	(down block65 block75)
	(is-immovable block66)
	(left block66 block65)
	(up block66 block56)
	(right block66 block67)
	(down block66 block76)
	(is-immovable block67)
	(left block67 block66)
	(up block67 block57)
	(right block67 block68)
	(down block67 block77)
	(is-immovable block68)
	(left block68 block67)
	(up block68 block58)
	(right block68 block69)
	(down block68 block78)
	(is-immovable block69)
	(left block69 block68)
	(up block69 block59)
	(right block69 block70)
	(down block69 block79)
	(is-empty block70)
	(left block70 block69)
	(up block70 block60)
	(right block70 block71)
	(down block70 block80)
	(is-empty block71)
	(left block71 block70)
	(up block71 block61)
	(right block71 block72)
	(down block71 block81)
	(is-empty block72)
	(left block72 block71)
	(up block72 block62)
	(right block72 block73)
	(down block72 block82)
	(is-immovable block73)
	(left block73 block72)
	(up block73 block63)
	(right block73 block74)
	(down block73 block83)
	(left block74 block73)
	(up block74 block64)
	(right block74 block75)
	(down block74 block84)
	(is-empty block75)
	(left block75 block74)
	(up block75 block65)
	(right block75 block76)
	(down block75 block85)
	(is-immovable block76)
	(left block76 block75)
	(up block76 block66)
	(right block76 block77)
	(down block76 block86)
	(is-empty block77)
	(left block77 block76)
	(up block77 block67)
	(right block77 block78)
	(down block77 block87)
	(is-empty block78)
	(left block78 block77)
	(up block78 block68)
	(right block78 block79)
	(down block78 block88)
	(is-empty block79)
	(left block79 block78)
	(up block79 block69)
	(right block79 block80)
	(down block79 block89)
	(is-empty block80)
	(left block80 block79)
	(up block80 block70)
	(right block80 block81)
	(down block80 block90)
	(is-empty block81)
	(left block81 block80)
	(up block81 block71)
	(right block81 block82)
	(down block81 block91)
	(is-empty block82)
	(left block82 block81)
	(up block82 block72)
	(right block82 block83)
	(down block82 block92)
	(is-immovable block83)
	(left block83 block82)
	(up block83 block73)
	(right block83 block84)
	(down block83 block93)
	(left block84 block83)
	(up block84 block74)
	(right block84 block85)
	(down block84 block94)
	(is-empty block85)
	(left block85 block84)
	(up block85 block75)
	(right block85 block86)
	(down block85 block95)
	(is-immovable block86)
	(left block86 block85)
	(up block86 block76)
	(right block86 block87)
	(down block86 block96)
	(is-empty block87)
	(left block87 block86)
	(up block87 block77)
	(right block87 block88)
	(down block87 block97)
	(is-empty block88)
	(left block88 block87)
	(up block88 block78)
	(right block88 block89)
	(down block88 block98)
	(is-empty block89)
	(left block89 block88)
	(up block89 block79)
	(right block89 block90)
	(down block89 block99)
	(is-empty block90)
	(left block90 block89)
	(up block90 block80)
	(right block90 block91)
	(down block90 block100)
	(is-empty block91)
	(left block91 block90)
	(up block91 block81)
	(right block91 block92)
	(down block91 block101)
	(is-empty block92)
	(left block92 block91)
	(up block92 block82)
	(right block92 block93)
	(down block92 block102)
	(is-immovable block93)
	(left block93 block92)
	(up block93 block83)
	(right block93 block94)
	(down block93 block103)
	(left block94 block93)
	(up block94 block84)
	(right block94 block95)
	(down block94 block104)
	(is-empty block95)
	(left block95 block94)
	(up block95 block85)
	(right block95 block96)
	(down block95 block105)
	(is-immovable block96)
	(left block96 block95)
	(up block96 block86)
	(right block96 block97)
	(down block96 block106)
	(is-empty block97)
	(left block97 block96)
	(up block97 block87)
	(right block97 block98)
	(down block97 block107)
	(is-empty block98)
	(left block98 block97)
	(up block98 block88)
	(right block98 block99)
	(down block98 block108)
	(is-empty block99)
	(left block99 block98)
	(up block99 block89)
	(right block99 block100)
	(down block99 block109)
	(is-empty block100)
	(left block100 block99)
	(up block100 block90)
	(right block100 block101)
	(down block100 block110)
	(is-empty block101)
	(left block101 block100)
	(up block101 block91)
	(right block101 block102)
	(down block101 block111)
	(is-empty block102)
	(left block102 block101)
	(up block102 block92)
	(right block102 block103)
	(down block102 block112)
	(is-immovable block103)
	(left block103 block102)
	(up block103 block93)
	(right block103 block104)
	(down block103 block113)
	(left block104 block103)
	(up block104 block94)
	(right block104 block105)
	(down block104 block114)
	(is-empty block105)
	(left block105 block104)
	(up block105 block95)
	(right block105 block106)
	(down block105 block115)
	(is-immovable block106)
	(left block106 block105)
	(up block106 block96)
	(right block106 block107)
	(down block106 block116)
	(is-empty block107)
	(left block107 block106)
	(up block107 block97)
	(right block107 block108)
	(down block107 block117)
	(is-empty block108)
	(left block108 block107)
	(up block108 block98)
	(right block108 block109)
	(down block108 block118)
	(is-empty block109)
	(left block109 block108)
	(up block109 block99)
	(right block109 block110)
	(down block109 block119)
	(is-empty block110)
	(left block110 block109)
	(up block110 block100)
	(right block110 block111)
	(is-empty block111)
	(left block111 block110)
	(up block111 block101)
	(right block111 block112)
	(is-empty block112)
	(left block112 block111)
	(up block112 block102)
	(right block112 block113)
	(is-immovable block113)
	(left block113 block112)
	(up block113 block103)
	(right block113 block114)
	(is-immovable block114)
	(left block114 block113)
	(up block114 block104)
	(right block114 block115)
	(is-immovable block115)
	(left block115 block114)
	(up block115 block105)
	(right block115 block116)
	(is-immovable block116)
	(left block116 block115)
	(up block116 block106)
	(right block116 block117)
	(is-empty block117)
	(left block117 block116)
	(up block117 block107)
	(right block117 block118)
	(is-empty block118)
	(left block118 block117)
	(up block118 block108)
	(right block118 block119)
	(is-empty block119)
	(left block119 block118)
	(up block119 block109)

	(same-color block53 block74)
	(same-color block53 block94)
	(same-color block74 block53)
	(same-color block74 block94)
	(same-color block94 block53)
	(same-color block94 block74)
	(same-color block14 block104)
	(same-color block104 block14)
	(same-color block42 block84)
	(same-color block84 block42)
	(same-color block24 block44)
	(same-color block24 block64)
	(same-color block44 block24)
	(same-color block44 block64)
	(same-color block64 block24)
	(same-color block64 block44)
	(same-color block51 block58)
	(same-color block58 block51)
	(same-color block34 block54)
	(same-color block54 block34)
	(same-color block41 block52)
	(same-color block52 block41)
	(= (num-steps) 0)
)
(:goal (and
	(is-empty block53)
	(is-empty block74)
	(is-empty block94)
	(is-empty block14)
	(is-empty block104)
	(is-empty block42)
	(is-empty block84)
	(is-empty block24)
	(is-empty block44)
	(is-empty block64)
	(is-empty block51)
	(is-empty block58)
	(is-empty block34)
	(is-empty block54)
	(is-empty block41)
	(is-empty block52)
)
)
(:metric minimize (num-steps))
)