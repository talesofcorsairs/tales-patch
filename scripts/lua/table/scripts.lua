
--精炼效果表示
function Item_Stoneeffect ( Stone_Type1 , Stone_Type2 , Stone_Type3 )
	if Stone_Type1 == Stone_Type2 then
		Stone_Type1 = -1
	end

	if Stone_Type1 == Stone_Type3 then
		Stone_Type1 = -1
	end
	
	if Stone_Type2 == Stone_Type3 then
		Stone_Type2 = -1
	end
	
	local jia = Stone_Type1 + Stone_Type2 + Stone_Type3
	local cheng = Stone_Type1 * Stone_Type2 * Stone_Type3
	if cheng > 0 then
		if jia == -1 then
			return 1
		elseif jia == 0 then
			return 2
		elseif jia == 1 then
			return 3
		elseif jia == 2 then
			return 4
		elseif jia == 6 then
			return 11
		elseif jia == 7 then
			return 12
		elseif jia == 8 then
			return 13
		elseif jia == 9 then
			return 14
		end
	elseif cheng < 0 then
		if jia == 2 then
			return 5
		elseif jia == 3 then
			return 6
		elseif jia == 4 then
			if cheng == -4 then
				return 7
			elseif cheng == -6 then
				return 8
			end
		elseif jia == 5 then
			return 9
		elseif jia == 6 then 
			return 10
		end
	end
	return 0
end

---------------------------------------------------------------------------------------------------------------------


--解析精炼内容

function GetNum_Part1 ( Num )
	local a = 0
	a = math.floor ( Num / 1000000000 )
	return a
end

function GetNum_Part2 ( Num )
	local a = 0
	local b = 0
	a = Num - GetNum_Part1 ( Num ) * 1000000000
	b = math.floor ( a / 10000000 )
	return b
end

function GetNum_Part3 ( Num )
	local a = 0
	local b = 0
	a = Num - math.floor ( Num / 10000000 ) * 10000000
	b = math.floor ( a / 1000000 )
	return b
end

function GetNum_Part4 ( Num )
	local a = 0
	local b = 0
	a = Num - math.floor ( Num / 1000000 ) *1000000
	b = math.floor ( a / 10000 )
	return b
end

function GetNum_Part5 ( Num )
	local a = 0
	local b = 0
	a = Num -  math.floor ( Num / 10000 ) * 10000
	b = math.floor ( a / 1000 )
	return b
end

function GetNum_Part6 ( Num )
	local a = 0
	local b = 0
	a = Num - math.floor ( Num / 1000 ) *1000
	b = math.floor ( a / 10 )
	return b
end

function GetNum_Part7 ( Num )
	local a = 0
	local b = 0
	a = Num - math.floor ( Num / 10 ) *10
	b = math.floor ( a / 1 )
	return b
end


--写入部分

function SetNum_Part1 ( Num , Part_Num )
	local a = 0
	local b = 0
	a = GetNum_Part1 ( Num )
	b = Part_Num - a
	Num = Num + b * 1000000000
	return Num
end

function SetNum_Part2 ( Num , Part_Num )
	local a = 0
	local b = 0
	a = GetNum_Part2 ( Num )
	b = Part_Num - a
	Num = Num + b * 10000000
	return Num
end

function SetNum_Part3 ( Num , Part_Num )
	local a = 0
	local b = 0
	a = GetNum_Part3 ( Num )
	b = Part_Num - a
	Num = Num + b * 1000000
	return Num
end

function SetNum_Part4 ( Num , Part_Num )
	local a = 0
	local b = 0
	a = GetNum_Part4 ( Num )
	b = Part_Num - a
	Num = Num + b * 10000
	return Num
end

function SetNum_Part5 ( Num , Part_Num )
	local a = 0
	local b = 0
	a = GetNum_Part5 ( Num )
	b = Part_Num - a
	Num = Num + b * 1000
	return Num
end

function SetNum_Part6 ( Num , Part_Num )
	local a = 0
	local b = 0
	a = GetNum_Part6 ( Num )
	b = Part_Num - a
	Num = Num + b * 10
	return Num
end

function SetNum_Part7 ( Num , Part_Num )
	local a = 0
	local b = 0
	a = GetNum_Part7 ( Num )
	b = Part_Num - a
	Num = Num + b * 1
	return Num
end


-------------------------------------------------------------------------------------------------------------------


--读取洞数

function Get_HoleNum ( Num )
	local a = GetNum_Part1 ( Num )
	return a
end

--读取宝石信息
function Get_Stone_1 ( Num )
	local Stone_1 = 0
	Stone_1 = GetNum_Part2 ( Num )
	return Stone_1
end

function Get_StoneLv_1 ( Num )
	local Stone_1 = 0
	Stone_1 = GetNum_Part3 ( Num )
	return Stone_1
end

function Get_Stone_2 ( Num )
	local Stone_2 = 0
	Stone_2 = GetNum_Part4 ( Num )
	return Stone_2
end

function Get_StoneLv_2 ( Num )
	local Stone_2 = 0
	Stone_2 = GetNum_Part5 ( Num )
	return Stone_2
end

function Get_Stone_3 ( Num )
	local Stone_3 = 0
	Stone_3 = GetNum_Part6 ( Num )
	return Stone_3
end

function Get_StoneLv_3 ( Num )
	local Stone_3 = 0
	Stone_3 = GetNum_Part7 ( Num )
	return Stone_3
end

------------------------------
--Hint对应函数
function ItemHint_LieYanS ( Lv )
	local eff = Lv * 4
	local Hint = "Gem Bonus Attack +"..eff
	return Hint
end

function ItemHint_ZhiYanS ( Lv )
	local eff = Lv * 6
	local Hint = "Gem Bonus Attack +"..eff
	return Hint
end

function ItemHint_HuoYaoS ( Lv )
	local eff = Lv * 10
	local Hint = "Gem Bonus Attack +"..eff
	return Hint
end

function ItemHint_MaNaoS ( Lv )
	local eff = Lv * 5
	local Hint = "Gem Bonus Hit Rate +"..eff
	return Hint
end

function ItemHint_HanYu ( Lv )
	local eff = Lv * 5
	local Hint = "Gem Bonus Defense +"..eff
	return Hint
end

function ItemHint_YueZhiX ( Lv )
	local eff = Lv * 100
	local Hint = "Gem Bonus Max HP +"..eff
	return Hint
end

function ItemHint_ShuiLingS ( Lv )
	local eff = Lv * 2
	local Hint = "Gem Bonus Dodge +"..eff
	return Hint
end

function ItemHint_ShengGuangS ( Lv )
	local eff = Lv * 1
	local Hint = "Gem Bonus Spirit +"..eff
	return Hint
end

---2006-02-23 添加

function ItemHint_FengLingS ( Lv )
	local eff = Lv * 5
	local Hint = "Gem Bonus Agility +"..eff
	return Hint
end

function ItemHint_YingYanS ( Lv )
	local eff = Lv * 5
	local Hint = "Added Accuracy"..eff
	return Hint
end

function ItemHint_YanVitS ( Lv )
	local eff = Lv * 5
	local Hint = "Gem Bonus Constitution +"..eff
	return Hint
end

function ItemHint_YanStrS ( Lv )
	local eff = Lv * 5
	local Hint = "Gem Bonus Strength +"..eff
	return Hint
end

function ItemHint_LongZhiTong ( Lv )
	local eff = Lv * 50
	local Hint = "Gem Bonus Attack +"..eff
	return Hint
end

function ItemHint_LongZhiHun ( Lv )
	local eff = Lv * 3
	local Hint = "Gem Bonus Resist +"..eff
	return Hint
end

function ItemHint_LongZhiXin ( Lv )
	local eff = Lv * 500
	local Hint = "Gem Bonus Max HP +"..eff
	return Hint
end
--2006-09-18添加
function ItemHint_GaNaZhiShen ( Lv )
	local eff =  Lv *5
	local Hint = "Gem Bonus Spirit +"..eff
	return Hint
end
--2008-02-20 dina添加
function ItemHint_HuangYu ( Lv )
	local eff =  Lv *10
	local Hint = "Gem Bonus Defense +"..eff
	return Hint
end

function ItemHint_ChiYu ( Lv )
	local eff =  Lv *200
	local Hint = "Gem Bonus Max HP +"..eff
	return Hint
end

function ItemHint_QingYu ( Lv )
	local eff =  Lv *200
	local Hint = "Gem Bonus Max SP +"..eff
	return Hint
end
--2008-04-24 晓玮添加

function ItemHint_XTLingGuang ( Lv )
	local eff =  Lv *10
	local Hint = "Gem Bonus Critical hit-rate +"..eff
	return Hint
end

function ItemHint_LKBiZhong ( Lv )
	local eff =  Lv *10
	local Hint = "Gem Bonus Hit Rate +"..eff
	return Hint
end

function ItemHint_BBDuoShan ( Lv )
	local eff =  Lv *10
	local Hint = "Gem Bonus Dodge +"..eff
	return Hint
end

function ItemHint_FFDiYu ( Lv )
	local eff =  Lv *15
	local Hint = "Gem Bonus Defense +"..eff
	return Hint
end

function ItemHint_XKQiangHua ( Lv )
	local eff =  Lv *300
	local Hint = "Gem Bonus Max HP +"..eff
	return Hint
end
-------高超加
function ItemHint_SShuiyao ( Lv )
	local eff =  Lv *8
	local Hint = "Gem Bonus Strength +"..eff
	return Hint
end

function ItemHint_SSbusi ( Lv )
	local eff =  Lv *8
	local Hint = "Gem Bonus Constitution +"..eff
	return Hint
end
function ItemHint_SSguangmang ( Lv )
	local eff =  Lv *8
	local Hint = "Gem Bonus Spirit +"..eff
	return Hint
end
function ItemHint_SSningju ( Lv )
	local eff =  Lv *8
	local Hint = "Gem Bonus Accuracy +"..eff
	return Hint
end
function ItemHint_SSxuanwu ( Lv )
	local eff =  Lv *8
	local Hint = "Gem Bonus Agility +"..eff
	return Hint
end
--------------------------罂粟花开“金木水火土”石头------------------------
function ItemHint_JinYanS ( Lv )
	local eff = Lv * 2
	local Hint = "Gem Bonus Strength +"..eff
	return Hint
end
function ItemHint_MuYanS ( Lv )
	local eff = Lv * 2
	local Hint = "Gem Bonus Spirit +"..eff
	return Hint
end
function ItemHint_ShuiYanS ( Lv )
	local eff = Lv * 2
	local Hint = "Added Accuracy +"..eff
	return Hint
end
function ItemHint_HuoYanS ( Lv )
	local eff = Lv * 2
	local Hint = "Gem Bonus Agility +"..eff
	return Hint
end
function ItemHint_TuYanS ( Lv )
	local eff = Lv * 2
	local Hint = "Gem Bonus Constitution +"..eff
	return Hint
end
--------------------------罂粟花开“金木水火土”石头------------------------
------- by Peter
function ItemHint_ABOLUO ( Lv )
	local Hint = "可以解开宙斯的黑匣"
	return Hint
end

function ItemHint_QIUBITE ( Lv )
	local Hint = "可以解开宙斯的黑匣"
	return Hint
end

function ItemHint_YADIANNA ( Lv )
	local Hint = "可以解开宙斯的黑匣"
	return Hint
end

function GetElfSkill ( Num )



end



----------------------------获取精灵特殊能力----------------------------------------------
function GetElfSkill ( Num )
	--local Part1 = GetNum_Part1 ( Num )	--Get Num Part 1 到 Part 7
	local Part2 = GetNum_Part2 ( Num )
	local Part3 = GetNum_Part3 ( Num )
	local Part4 = GetNum_Part4 ( Num )
	local Part5 = GetNum_Part5 ( Num )
	local Part6 = GetNum_Part6 ( Num )
	local Part7 = GetNum_Part7 ( Num )

	return Part3 , Part2 , Part5 , Part4 , Part7 , Part6 

end
function ItemHint_HLS( Lv )	
	local eff = Lv * 2	
	local Hint ="Gem Bonus Agility +"..eff	
	return Hint	
end

function ItemHint_HYS( Lv )	
	local eff = Lv * 3	
	local Hint ="Gem Bonus Agility +"..eff	
	return Hint	
end

function ItemHint_HJS( Lv )	
	local eff = Lv * 4	
	local Hint ="Gem Bonus Agility +"..eff	
	return Hint	
end

function ItemHint_BLS( Lv )	
	local eff = Lv * 2	
	local Hint ="Added Accuracy +"..eff	
	return Hint	
end

function ItemHint_BYS( Lv )	
	local eff = Lv * 3	
	local Hint ="Added Accuracy +"..eff	
	return Hint	
end

function ItemHint_BJS( Lv )	
	local eff = Lv * 4	
	local Hint ="Added Accuracy +"..eff	
	return Hint	
end

function ItemHint_CLS( Lv )	
	local eff = Lv * 2	
	local Hint ="Gem Bonus Constitution +"..eff	
	return Hint	
end

function ItemHint_CYS( Lv )	
	local eff = Lv * 3	
	local Hint ="Gem Bonus Constitution +"..eff	
	return Hint	
end

function ItemHint_CJS( Lv )	
	local eff = Lv * 4	
	local Hint ="Gem Bonus Constitution +"..eff	
	return Hint	
end

function ItemHint_ZLS( Lv )	
	local eff = Lv * 2	
	local Hint ="Gem Bonus Strength +"..eff	
	return Hint	
end

function ItemHint_ZYS( Lv )	
	local eff = Lv * 3	
	local Hint ="Gem Bonus Strength +"..eff	
	return Hint	
end

function ItemHint_ZJS( Lv )	
	local eff = Lv * 4	
	local Hint ="Gem Bonus Strength +"..eff	
	return Hint	
end

function ItemHint_QLS( Lv )	
	local eff = Lv * 2	
	local Hint ="Gem Bonus Spirit +"..eff	
	return Hint	
end

function ItemHint_QYS( Lv )	
	local eff = Lv * 3	
	local Hint ="Gem Bonus Spirit +"..eff	
	return Hint	
end

function ItemHint_QJS( Lv )	
	local eff = Lv * 4	
	local Hint ="Gem Bonus Spirit +"..eff	
	return Hint	
end
function ItemHint_GGR ( Lv )
	local eff = Lv * 6	
	local Hint ="Gem Bonus Strength +"..eff	
	return Hint	
end 
function ItemHint_GGS ( Lv )
	local eff = Lv * 6	
	local Hint ="Gem Bonus Spirit +"..eff	
	return Hint	
end 
function ItemHint_GGOS ( Lv )
	local eff = Lv * 6	
	local Hint ="Added Accuracy +"..eff	
	return Hint	
end 
function ItemHint_GGC ( Lv )
	local eff = Lv * 6	
	local Hint ="Gem Bonus Constitution +"..eff	
	return Hint	
end 
function ItemHint_GGW ( Lv )
	local eff = Lv * 6	
	local Hint ="Gem Bonus Agility +"..eff	
	return Hint	
end 


---------------------------------------------------------------------------------------------------------------------
-- Cor do brilho da forja por gema (Tales of Corsairs). ID = ID da gema no StoneInfo.
-- Cor em decimal: R*65536 + G*256 + B (ex.: vermelho FF1A1A = 16718362).
-- Com varias gemas, o jogo mistura as cores pelo nivel de cada uma.
-- Para voltar ao brilho original de uma gema, tire a linha dela (ou devolva -1).
GemGlowColor = {
	[1]  = 16730650, -- Fiery Gem: fogo
	[2]  = 16747546, -- Furious Gem: laranja
	[3]  = 16761370, -- Explosive Gem: ambar
	[4]  = 16770688, -- Lustrious Gem: dourado claro
	[5]  = 4251903, -- Glowing Gem: ciano
	[6]  = 13166847, -- Shining Gem: branco azulado
	[7]  = 9059583, -- Shadow Gem: violeta
	[8]  = 4259738, -- Spirit Gem: verde agua
	[9]  = 7143276, -- Gem of the Wind: verde
	[10] = 16769562, -- Gem of Striking: amarelo
	[11] = 16752720, -- Gem of Colossus: cobre
	[12] = 16718362, -- Gem of Rage: vermelho
	[13] = 11541247, -- Eye of Black Dragon: roxo
	[14] = 5905151, -- Soul of Black Dragon: anil
	[15] = 16718442, -- Heart of Black Dragon: carmim
	[16] = 16730832, -- Gem of Soul: magenta
	[17] = 16769088, -- Yellow Jade
	[18] = 16724016, -- Red Jade
	[19] = 3211104, -- Green Jade
	[20] = 10119935, -- Chiatan's Aura
	[21] = 16756784, -- Lock's Hit
	[22] = 6344959, -- Bing's Dodging
	[23] = 4223231, -- Feng's Defense
	[24] = 3211232, -- Shark's Strengthening
	[25] = 16773280, -- Azrael's Glare: ouro claro
	[26] = 7405488, -- Undead Azrael: verde fantasma
	[27] = 15792383, -- Azrael's Light: branco
	[28] = 10531071, -- Azrael's Aggregation: prata azulada
	[29] = 16744703, -- Azrael's Dance: rosa
	[30] = 7143276, [31] = 7143276, [32] = 7143276, -- Gem of the Wind (Broken/Cracked/Chipped)
	[33] = 16769562, [34] = 16769562, [35] = 16769562, -- Gem of Striking (Broken/Cracked/Chipped)
	[36] = 16752720, [37] = 16752720, [38] = 16752720, -- Gem of Colossus (Broken/Cracked/Chipped)
	[39] = 16718362, [40] = 16718362, [41] = 16718362, -- Gem of Rage (Broken/Cracked/Chipped)
	[42] = 16730832, [43] = 16730832, [44] = 16730832, -- Gem of Soul (Broken/Cracked/Chipped)
	[45] = 16718362, -- Great Gem of Rage
	[46] = 16730832, -- Great Gem of Soul
	[47] = 16769562, -- Great Gem of Striking
	[48] = 16752720, -- Great Gem of Colossus
	[49] = 7143276, -- Great Gem of Wind
	[50] = 16764992, -- Golden Rock
	[51] = 8446016, -- Lumber Rock
	[52] = 4235519, -- Water Rock
	[53] = 16732192, -- Fire Rock
	[54] = 13144144, -- Earth Rock
}

function Item_GemGlowColor ( StoneID )
	local c = GemGlowColor[StoneID]
	if c == nil then
		return -1
	end
	return c
end
