---@type table
local AscensionDB = QuestieLoader:CreateModule("AscensionDB")

AscensionDB.itemData = AscensionDB.itemData or {

		--Elwynn Forest
		[559159]={[1]="Oracular Idol",[2]={161717},[3]=nil,[4]=nil,[5]=1660036,[6]=nil,[7]=nil,[8]=nil,[9]=1,[10]=1,[11]=nil,[12]=nil,[13]=0},
		[5055565]={[1]="Tattered Orders",[2]={991516},[3]=nil,[4]=nil,[5]=100074,[6]=nil,[7]=nil,[8]=nil,[9]=1,[10]=1,[11]=nil,[12]=nil,[13]=0},
		[558956]={[1]="Elgris Blossom Petals",[2]=nil,[3]=nil,[4]=nil,[5]=nil,[6]=nil,[7]=nil,[8]=nil,[9]=0,[10]=0,[11]=nil,[12]=12,[13]=0,[14]={162814},[15]={1660056}},
		[558957]={[1]="Dun Kazad Liquor Concentrate",[2]=nil,[3]=nil,[4]=nil,[5]=nil,[6]=nil,[7]=nil,[8]=nil,[9]=0,[10]=0,[11]=nil,[12]=12,[13]=0,[14]={162811},[15]={1660056}},
		[558958]={[1]="Pumpkin Juice",[2]=nil,[3]=nil,[4]=nil,[5]=nil,[6]=nil,[7]=nil,[8]=nil,[9]=0,[10]=0,[11]=nil,[12]=12,[13]=0,[14]={162809},[15]={1660056}},
		[558959]={[1]="Murloc Eyeball",[2]=nil,[3]=nil,[4]=nil,[5]=nil,[6]=nil,[7]=nil,[8]=nil,[9]=0,[10]=0,[11]=nil,[12]=12,[13]=0,[14]={162826},[15]={1660056}},
		[558960]={[1]="Agria's Incomplete Potion",[2]=nil,[3]=nil,[4]=nil,[5]=nil,[6]=nil,[7]=nil,[8]=nil,[9]=1,[10]=1,[11]=nil,[12]=15,[13]=0,[14]=nil,[15]={1660056}},
		[558961]={[1]="Pumpkin",[2]=nil,[3]={999014},[4]=nil,[5]=nil,[6]=nil,[7]=nil,[8]=nil,[9]=0,[10]=0,[11]=nil,[12]=0,[13]=5},
		[558962]={[1]="Melon",[2]=nil,[3]={999013},[4]=nil,[5]=nil,[6]=nil,[7]=nil,[8]=nil,[9]=0,[10]=0,[11]=nil,[12]=0,[13]=5},
		[558963]={[1]="Apple",[2]=nil,[3]={999015},[4]=nil,[5]=nil,[6]=nil,[7]=nil,[8]=nil,[9]=0,[10]=0,[11]=nil,[12]=0,[13]=5},
		[157001]={[1]="Gem Encrusted Spider Silk",[2]={43},[3]=nil,[4]=nil,[5]=nil,[6]=nil,[7]=2048,[8]=nil,[9]=1,[10]=0,[11]=0,[12]=12,[13]=0,[14]=nil,[15]={17001}},
		[157006]={[1]="Simple Crystal Vial",[2]=nil,[3]=nil,[4]=nil,[5]=nil,[6]=nil,[7]=0,[8]=nil,[9]=5,[10]=0,[11]=nil,[12]=12,[13]=0,[14]=nil,[15]={17003},[16]=157006},
		[157002]={[1]="Depleted Mana Gem",[2]={474},[3]=nil,[4]=nil,[5]=nil,[6]=nil,[7]=nil,[8]=nil,[9]=1,[10]=1,[11]=nil,[12]=15,[13]=0,[14]=nil,[15]={17002}},
		[157007]={[1]="Gnoll Sword",[2]={97},[3]=nil,[4]=nil,[5]=nil,[6]=nil,[7]=nil,[8]=nil,[9]=1,[10]=6,[11]=nil,[12]=15,[13]=0,[14]=nil,[15]={17004}},
		[157008]={[1]="Gnoll Axe",[2]={478},[3]=nil,[4]=nil,[5]=nil,[6]=nil,[7]=nil,[8]=nil,[9]=1,[10]=10,[11]=nil,[12]=15,[13]=0,[14]=nil,[15]={17004}},
		[157012]={[1]="Smudged Note",[2]=nil,[3]=nil,[4]=nil,[5]=nil,[6]=nil,[7]=0,[8]=nil,[9]=1,[10]=1,[11]=nil,[12]=15,[13]=0,[14]=nil,[15]={17005}},
		[157014]={[1]="Mirror Lake Apple",[2]=nil,[3]={9017008},[4]=nil,[5]=nil,[6]=nil,[7]=nil,[8]=nil,[9]=1,[10]=8,[11]=nil,[12]=15,[13]=0,[14]=nil,[15]={17008}},


		--Durotar 
		[4859] = {'Burning Blade Medallion',{3183},nil,nil,nil,nil,nil,nil,1,0,0,12,0,nil,nil},
		[4862] = {'Scorpid Worker Tail',{3124},nil,nil,nil,nil,nil,nil,1,0,0,12,0,nil,nil},
		[4905] = {'Sarkoth\'s Mangled Claw',{3281},nil,nil,nil,nil,nil,nil,1,0,0,12,0,nil,nil},
		[11583] = {'Cactus Apple',nil,{5047023},nil,nil,nil,nil,nil,1,0,0,12,0,nil,nil},
		[11584] = {'Cactus Apple Surprise',nil,nil,nil,nil,nil,nil,nil,5,0,0,4,0,nil,{254010}},
		[12635] = {'Simple Parchment',nil,nil,nil,nil,nil,nil,nil,1,0,0,12,0,nil,nil},
		[16114] = {'Foreman\'s Blackjack',nil,nil,nil,nil,nil,nil,nil,1,0,0,12,0,nil,{5441}},
		[16332] = {'Thazz\'ril\'s Pick',nil,{8872834},nil,nil,nil,nil,nil,1,0,0,12,0,nil,nil},
		[254005] = {'Strange Flower',nil,{5183142},nil,nil,nil,nil,nil,1,0,0,12,0,nil,nil},
		[254006] = {'Xaitoth\'s Blood',{254015},nil,nil,nil,nil,nil,nil,1,0,0,12,0,nil,nil},
		[559146] = {'Witch’s Amulet',nil,nil,nil,nil,nil,nil,nil,1,0,0,4,0,nil,{1660037,1660019}},
		[559155] = {'Spiritual Unrest',{30719},nil,nil,nil,nil,nil,nil,0,0,0,4,0,nil,nil},
		[559158] = {'Unremarkable Stone',nil,nil,nil,nil,nil,nil,nil,1,0,0,4,0,nil,{1660018}},
		[559172] = {'Fire Elemental Shackles',nil,{1064805},nil,nil,nil,nil,nil,1,0,0,4,0,nil,nil},
		[559173] = {'Earth Elemental Shackles',nil,{2392807},nil,nil,nil,nil,nil,1,0,0,4,0,nil,nil},
		[559174] = {'Air Elemental Shackles',nil,{3478505},nil,nil,nil,nil,nil,1,0,0,4,0,nil,nil},
		[559175] = {'Water Elemental Shackles',nil,{4541078},nil,nil,nil,nil,nil,1,0,0,4,0,nil,nil},
		[824380] = {'Triad\'s Spear',nil,{4124320},nil,nil,nil,nil,nil,8,3,0,1,6,nil,nil},

}

AscensionItemDB=AscensionItemDB or {}
AscensionItemDB.itemData=AscensionDB.itemData
