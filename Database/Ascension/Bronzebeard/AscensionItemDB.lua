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
}

AscensionItemDB=AscensionItemDB or {}
AscensionItemDB.itemData=AscensionDB.itemData
