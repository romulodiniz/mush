--class to control Avatar
--author: Xing

-- begin variables

tierChar = ""
gmcpsanctime = ""
gmcpspellstime = ""
gmcpmoblvl = ""
gmcpmobname = ""
gmcpmobhealth = ""
gmcphp = ""
gmcpmaxhp = ""
gmcplag = ""
gmcpmonhp = ""
gmcpmaxmonhp = ""

currentTarget = ""
stabAction = ""
offhandName = ""
nextPlayer = ""

shapeNames = {}
damList = {}
roomList = {}
groupList = {}
sortedGroupList = {}
triggerStatusList = {}
inventoryList = {}
lottoNames = {}
weaponsWithIdOwnerList = {}
actionQueue = {}

brandcurrent = 0
brandlevel = 0
brandmax = 0
totalDamNum = 0
gainedxp = 0
expKills = 0
gainedlevel = 0
timesanc = 0
lastRefresh = 0

mwFontSize = 8
mwLineSize = 12
MIN_SIZE = 50
leftBarBegin = 214
rightBarBegin = leftBarBegin + 147
barWidth = 40
upBarShift = 4
barHeight = 7
text1Begin = 1
text2Begin = leftBarBegin + 44
text3Begin = leftBarBegin + 193
lowVizHealthLimit = 40
highVizHealthLimit = 70

win = "statusAlts"
winTrigger = "statusTriggers"
mwBgColor = "black"
mwFont = "Courier New"
mwFontColor = "cyan"
mwPositiveColorBar = "green"
mwNegativeColorBar = "red"
nameFormat = "%14s"
statsFormat = "%5s/%5s"
levelFormat = "%3s"

dvalues = {"2","4","8","10","14","18","22","26","30","34","38","42","46","49","55","60","65","70","75","80","85","90","95","100","110","120","130","140","150","160","170","180","190","200","225","250","275","300","325","350","375","400","425","450","475","500","540","574","606","675","730","769","810","884","915","1000","1100","1200","1300","1400","1500","1600","1700","1800","1900","2000","2200","2400","2600","2800","3000","3200","3400","3600","3800","4100","4500","5007","5901","5902","6200","6500","7000","7500","7800","8200","8500","9000","9500","10000","11000","12000","13000","14000","15000","16500","18000","19000","20000","21000","22000","23000","24000","25000","26000","27000","28000","29000","30000","31000","32000","33000","34000","35000","36000","37000","38000","39000","40000","41000","42000","43000","44500","47000","48000","50000","51000","53000","55000","57000","59000","61000","65000","70000","75000","80000","100000","0"}
dverbs = {"pathetic","weak","punishing","surprising","amazing","astonishing","mauling","MAULING","MAULING*","MAULING**","MAULING***","decimating","DECIMATING","DECIMATING*","DECIMATING**","DECIMATING***","devastating","DEVASTATING","DEVASTATING*","DEVASTATING**","DEVASTATING***","pulverizing","PULVERIZING","PULVERIZING*","PULVERIZING**","PULVERIZING***","maiming","MAIMING","MAIMING*","MAIMING**","MAIMING***","eviscerating","EVISCERATING","EVISCERATING*","EVISCERATING**","EVISCERATING***","mutilating","MUTILATING","MUTILATING*","MUTILATING**","MUTILATING***","disemboweling","DISEMBOWELING","DISEMBOWELING*","DISEMBOWELING**","DISEMBOWELING***","dismembering","DISMEMBERING","DISMEMBERING*","DISMEMBERING**","DISMEMBERING***","massacring","MASSACRING","MASSACRING*","MASSACRING**","MASSACRING***","mangling","MANGLING","MANGLING*","MANGLING**","MANGLING***","demolishing","DEMOLISHING","DEMOLISHING*","DEMOLISHING**","DEMOLISHING***","obliterating","OBLITERATING","OBLITERATING*","OBLITERATING**","OBLITERATING***","annihilating","ANNIHILATING","ANNIHILATING*","ANNIHILATING**","ANNIHILATING***","ANNIHILATING***<","ANNIHILATING***<<","ANNIHILATING***<<<","ANNIHILATING***<<<<","eradicating","ERADICATING","ERADICATING*","ERADICATING**","ERADICATING***","ERADICATING***<","ERADICATING***<<","ERADICATING***<<<","ERADICATING***<<<<","vaporizing","VAPORIZING","VAPORIZING*","VAPORIZING**","VAPORIZING***","VAPORIZING***<","VAPORIZING***<<","VAPORIZING***<<<","VAPORIZING***<<<<","destructive","DESTRUCTIVE","DESTRUCTIVE*","DESTRUCTIVE**","DESTRUCTIVE***","DESTRUCTIVE****","DESTRUCTIVE****<","DESTRUCTIVE****<<","DESTRUCTIVE****<<<","DESTRUCTIVE****<<<<","DESTRUCTIVE***<<<<=","DESTRUCTIVE**<<<<==","DESTRUCTIVE*<<<<===","DESTRUCTIVE<<<<====","extreme","EXTREME","EXTREME*","EXTREME**","EXTREME***","EXTREME****","EXTREME****<","EXTREME****<<","EXTREME****<<<","EXTREME****<<<<","EXTREME***<<<<=","EXTREME**<<<<==","EXTREME*<<<<===","EXTREME<<<<====","porcine","PORCINE","PORCINE*","PORCINE**","PORCINE***","PORCINE***<","PORCINE***<<","PORCINE***<<<","PORCINE***<<<<","divine","daunting","terminal"}

vizFinalRiteCasted = false
disabledStabName = false
canRescue = true
canStab = false
canSlip = false
killing = false
isKillingWalking = false
isStabingById = false
isBashOn = false
showTriggerWindow = false
showVizPool = false
vizDmgOn = false
vizHealOn = false
vizFrOn = false
vizSsOn = false
lag0Cast = false
awfulCast = false

theme = {
    WINDOW_BACKGROUND = ColourNameToRGB ("#000000"), -- for miniwindow body
    WINDOW_BORDER = ColourNameToRGB("#E8E8E8"), -- for miniwindow body
    
    HIGHLIGHT=ColourNameToRGB("#FFFFFF"), -- for 3D surfaces
    FACE=ColourNameToRGB("#D4D0C8"), -- for 3D surfaces
    INNERSHADOW=ColourNameToRGB("#808080"), -- for 3D surfaces
    OUTERSHADOW = ColourNameToRGB("#404040"), -- for 3D surfaces
   
    BACK_FACE = ColourNameToRGB ("#E8E8E8"), -- for contrasting details
    DETAIL = ColourNameToRGB ("#000000"), -- for contrasting details

    TITLE_HEIGHT = 17, -- for miniwindow title area
    SUBTITLE_HEIGHT = 17, -- for miniwindow title area
    TITLE_FONT_NAME = "Dina", -- for miniwindow title area
    TITLE_FONT_SIZE = 8 -- for miniwindow title area
}

-- end variables

-- Initial setup function

function setup()
	addWeaponsAlt("Bom", "UNHA STICK")
	addWeaponsAlt("Bom", "GARRA STICK")

	addWeaponsAlt("Medo", "SELFIE STICK")
	addWeaponsAlt("Medo", "GRAVETO")

	addWeaponsAlt("Cagao", "DIAMANTE'S POINTY STICK")
	addWeaponsAlt("Cagao", "ORION'S POINTY STICK")
	
	addWeaponsAlt("Opa", "AN ENORMOUS ANT CHAKRAM")
	addWeaponsAlt("Opa", "A BIG ANT CHAKRAM")
	
	addWeaponsAlt("Fido", "CUNNO'S TRICK")
	addWeaponsAlt("Fido", "KENT'S LOVE")
	
	setupWin()
end

function setupWin()
	local mwWidth = 485
	local mwHeight = 500
	local mwFlag = miniwin.create_transparent --use 6 on production, 2 on tests

    if windowinfo == nil then
		windowinfo = movewindow.install (win, miniwin.pos_top_right, miniwin.create_transparent, false, nil, nil,{x=1, y=1})
	end
	
	
	WindowCreate (win, windowinfo.window_left, windowinfo.window_top, mwWidth, mwHeight, miniwin.pos_top_center, bit.bor (windowinfo.window_flags, mwFlag), ColourNameToRGB(mwBgColor))  -- create window
	
	--WindowCreate (win, 10, 10, mwWidth, mwHeight, 20, mwFlag, ColourNameToRGB(mwBgColor))  -- create window
	
	WindowFont (win, "f", mwFont, mwFontSize, true, false, false, false) -- define font
	movewindow.add_drag_handler (win, 0, 0, 0, 0, miniwin.cursor_both_arrow) 
end

--Clear lists functions

function clearDamList()
	damList = {}
end

function clearGroupList()
	groupList = {}
end

function clearRoomList()
	roomList = {}
end

function clearInventoryList()
	inventoryList = {}
end

function clearLottoNames()
	lottoNames = {}
end

function clearShapeNames()
	shapeNames = {}
end

function clearPsiWeapons()
	weaponsWithIdOwnerList = {}
end

function clearActionQueue()
	actionQueue = {}
end

-- Brandish functions

function emoteBrandStatus()
	Send("emote brand status: " .. brandcurrent .. "/" .. brandmax .. " Lvl " .. brandlevel)
end

function updateBrandStatus(p_brandmax, p_brandcurrent)
	brandmax = p_brandmax
	brandcurrent = p_brandcurrent
	UpdateInfoBar()
	--emoteBrandStatus()
end

function updateBrandLevel(p_brandlevel)
	brandlevel = p_brandlevel
end

function executeBrandish()
	Send("get xbrand xmain=g typhus xbrand=wear typhus=brandish=rem typhus=put typhus xbrand=put xbrand xmain=wear all")
    brandcurrent = brandcurrent - 1

	if brandcurrent == 1 and tonumber(brandlevel) and tonumber(brandlevel) < 53 then
		storeTyphus()
	end

	UpdateInfoBar()
end

function storeTyphus()
	Send("get xbrand xmain=g typhus xbrand=put typhus xmain=put xbrand xmain")
	brandcurrent = -1
	UpdateInfoBar()
end

--Run counters functions

function counterCommand(args)
	local arg1, arg2 = ""
	if string.find(args, " ") ~= nil then
		arg1 = string.sub(args, 0, string.find(args, " ") - 1)
		arg2 = string.sub(args, string.find(args, " ") + 1)
	else
		arg1 = args
		arg2 = ""
	end
	
	if arg1 == "add" then
		if string.upper(arg2) == string.upper(world.GetVariable("playername")) then
			addTableCounter("You")
		else
			addTableCounter(arg2)		
		end
	end
	
	if arg1 == "clear" or arg1 == "reset" then
		clearDamList()
		Note("Dmg cleared")
	end
	
	if arg1 == "show" then
		calculateTotalDamNum()
		world.Note("Monitoring:")
		
		for k, v in pairs (damList) do 
			Note(dmgTableToString(k, v))
		end	
	end
	
	if arg1 == "populate" then		
		EnableTrigger("GroupGrabDmg", true)
		Send("group")
		runAfter (5, 'EnableTriggerGroup ("Counters", true)')
		runAfter (5, 'EnableTrigger("GroupGrabDmg", false)')
	end
	
	if arg1 == "report" then
		calculateTotalDamNum()
		world.Note("Monitoring:")
		
		for k, v in pairs (damList) do 
			Send("gt " .. dmgTableToString(k, v))
		end	
	end
end

function dmgTableToString(name, tab)
	local repName = name

	if repName == "You" then
		repName = 	GetVariable("playername")
	end
	
	percentDam = string.format("%.1f",(tab["totalDmg"]/totalDamNum)*100) 

	retorno = repName .. " dmg: (|BC|" .. percentDam .. "|N|%)"
		
	local verb = ""
	local val = 0
	
	verb = "pathetic"          
	val = tab[verb]; if val > 0 then retorno = retorno .. " - |BC|" .. val .. " |N|" .. verb end
	verb = "weak"
	val = tab[verb]; if val > 0 then retorno = retorno .. " - |BC|" .. val .. " |N|" .. verb end
	verb = "punishing"
	val = tab[verb]; if val > 0 then retorno = retorno .. " - |BC|" .. val .. " |N|" .. verb end
	verb = "surprising"
	val = tab[verb]; if val > 0 then retorno = retorno .. " - |BC|" .. val .. " |N|" .. verb end
	verb = "amazing"
	val = tab[verb]; if val > 0 then retorno = retorno .. " - |BC|" .. val .. " |N|" .. verb end
	verb = "astonishing"
	val = tab[verb]; if val > 0 then retorno = retorno .. " - |BC|" .. val .. " |N|" .. verb end
	verb = "mauling"
	val = tab[verb]; if val > 0 then retorno = retorno .. " - |BC|" .. val .. " |N|" .. verb end
	verb = "decimating"
	val = tab[verb]; if val > 0 then retorno = retorno .. " - |BC|" .. val .. " |N|" .. verb end
	verb = "devastating"
	val = tab[verb]; if val > 0 then retorno = retorno .. " - |BC|" .. val .. " |N|" .. verb end
	verb = "pulverizing"
	val = tab[verb]; if val > 0 then retorno = retorno .. " - |BC|" .. val .. " |N|" .. verb end
	verb = "maiming"
	val = tab[verb]; if val > 0 then retorno = retorno .. " - |BC|" .. val .. " |N|" .. verb end
	verb = "eviscerating"
	val = tab[verb]; if val > 0 then retorno = retorno .. " - |BC|" .. val .. " |N|" .. verb end
	verb = "mutilating"
	val = tab[verb]; if val > 0 then retorno = retorno .. " - |BC|" .. val .. " |N|" .. verb end
	verb = "disemboweling"
	val = tab[verb]; if val > 0 then retorno = retorno .. " - |BC|" .. val .. " |N|" .. verb end
	verb = "dismembering"
	val = tab[verb]; if val > 0 then retorno = retorno .. " - |BC|" .. val .. " |N|" .. verb end
	verb = "massacring"
	val = tab[verb]; if val > 0 then retorno = retorno .. " - |BC|" .. val .. " |N|" .. verb end
	verb = "mangling"
	val = tab[verb]; if val > 0 then retorno = retorno .. " - |BC|" .. val .. " |N|" .. verb end
	verb = "demolishing"
	val = tab[verb]; if val > 0 then retorno = retorno .. " - |BC|" .. val .. " |N|" .. verb end
	verb = "obliterating"
	val = tab[verb]; if val > 0 then retorno = retorno .. " - |BC|" .. val .. " |N|" .. verb end
	verb = "annihilating"
	val = tab[verb]; if val > 0 then retorno = retorno .. " - |BC|" .. val .. " |N|" .. verb end
	verb = "eradicating"
	val = tab[verb]; if val > 0 then retorno = retorno .. " - |BC|" .. val .. " |N|" .. verb end
	verb = "vaporizing"
	val = tab[verb]; if val > 0 then retorno = retorno .. " - |BC|" .. val .. " |N|" .. verb end
	verb = "destructive"
	val = tab[verb]; if val > 0 then retorno = retorno .. " - |BC|" .. val .. " |N|" .. verb end
	verb = "extreme"
	val = tab[verb]; if val > 0 then retorno = retorno .. " - |BC|" .. val .. " |N|" .. verb end
	verb = "porcine"
	val = tab[verb]; if val > 0 then retorno = retorno .. " - |BC|" .. val .. " |N|" .. verb end
	verb = "divine"
	val = tab[verb]; if val > 0 then retorno = retorno .. " - |BC|" .. val .. " |N|" .. verb end
	verb = "daunting"
	val = tab[verb]; if val > 0 then retorno = retorno .. " - |BC|" .. val .. " |N|" .. verb end
	verb = "terminal"
	val = tab[verb]; if val > 0 then retorno = retorno .. " - |BC|" .. val .. " |N|" .. verb end

	return retorno

 end	

function addTableCounter(name)
	found = 0

	for k,v in pairs(damList) do
		if string.upper(k) == string.upper(name) then 
			found = 1 
		end
	end
	
	if damList == nil then
		ColourNote("red", "white", " nil list")
	end
	
	if found == 1 then
	  ColourNote("red", "white", name .. " already in the dmg list!")
	else
		dmgGroupieFormat = "/damList.%s = {totalDmg=%d, pathetic=%d, weak=%d, punishing=%d, surprising=%d, amazing=%d, astonishing=%d, mauling=%d, decimating=%d, devastating=%d, pulverizing=%d, maiming=%d, eviscerating=%d, mutilating=%d, disemboweling=%d, dismembering=%d, massacring=%d, mangling=%d, demolishing=%d, obliterating=%d, annihilating=%d, eradicating=%d, vaporizing=%d, destructive=%d, extreme=%d, porcine=%d, divine=%d, daunting=%d, terminal=%d}"
		dmgGroupieText = string.format(dmgGroupieFormat, name, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
		Execute(dmgGroupieText)
		
		SetVariable("monDamList", keys_to_list(damList))
	end
	
	world.ColourNote("red", "white", name .. " has been added!")	
end

function findDamage(line)
	for i = 1, table.getn(dverbs) do
		if string.find(line, dverbs[i]) ~= nil then
			local fWord = string.sub(line, 0, string.find(line, " ") - 1)
			
			for k, v in pairs (damList) do 
				if string.find(string.upper(fWord), string.upper(k)) ~= nil then
					local sFind = string.find(line, dverbs[i])
					local dVerb = string.sub(line, sFind, string.find(line, " ", sFind))	
					addDamage(k, dVerb)
					return
				end
			end
		end
	end
end

function addDamage(person, verb)
	local dam = 0	
	local minVerb = string.lower(string.match(verb, "%a+"))
	local modPerson = ""
	
	if person == "Your" then
		modPerson = "You"
	else
		modPerson = person
	end
	
	modPerson = firstToUpper(string.lower(modPerson))
	
	for i = 1, table.getn(dverbs) do
		if string.find(verb, dverbs[i]) ~= nil then
			dam = tonumber(dvalues[i])
		end
	end
	
	local currTotalDmg = damList[modPerson]["totalDmg"]
	local currVerbDmg = damList[modPerson][minVerb]
	
	dmgFormat = "/damList.%s.%s = %d"

	dmgText = string.format(dmgFormat, modPerson, "totalDmg", currTotalDmg + dam)
	verbText = string.format(dmgFormat, modPerson, minVerb, currVerbDmg + 1)
	
	Execute(dmgText)
	Execute(verbText)
end

function calculateTotalDamNum()
	totalDamNum = 0
	
	for k, v in pairs (damList) do 
		totalDamNum = totalDamNum + v["totalDmg"]
	end	
end

function addExp(value)
	gainedxp = gainedxp + tonumber(value)
	expKills = expKills + 1
	UpdateInfoBar()
end

function afterLevel(hpgain, managain, pracgain)
	Note("")
	Send("emote increases in power!! |by|" .. hpgain .. " |n|hps, |by|" .. managain .. " |n|mana, |by|" .. pracgain .. " |n|practices.")
	Send("save")
	gainedlevel = gainedlevel + 1
end

function runreport()
	Send("gtell |bw|Run stats: |bc|" .. gainedxp .. " |bw|xp, |bc|" .. gainedlevel .. " |bw|level(s).")
end

function runreset()
	gainedxp = 0
	gainedlevel = 0
	UpdateInfoBar()
	Note("Counters reseted")
end

-- Reset functions

function resetLoggedChar()
	resetClasses()
	resetAliases()
	resetTriggers()
	resetTimers()
	resetVars()
	setWindowShow(false)
	setWindowShowTrigger(false)
end

function resetClasses()
	setGroupValue("classsor", false)
	setGroupValue("classdru", false)
	setGroupValue("classran", false)
	setGroupValue("classwar", false)
	setGroupValue("classprs", false)
	setGroupValue("classasn", false)
	setGroupValue("classbld", false)
	setGroupValue("classpal", false)
	setGroupValue("classwzd", false)
	setGroupValue("classbod", false)
	setGroupValue("classarc", false)
	setGroupValue("classpsi", false)
	setGroupValue("classmag", false)
	setGroupValue("classmon", false)
	setGroupValue("classmnd", false)
	setGroupValue("classstm", false)
	setGroupValue("classbci", false)
	setGroupValue("classbzk", false)
	setGroupValue("classrog", false)
	setGroupValue("classfus", false)
	setGroupValue("classshf", false)
	setGroupValue("classcle", false)
	setGroupValue("classviz", false)
	
	setGroupValue("classmonshf", false)
end

function resetAliases()
	EnableAliasGroup ("autorescue", false)
	EnableAlias ("grcommand", false)
	EnableAliasGroup ("RaceMiraar", false)
end

function resetTriggers()
	EnableTriggerGroup ("addme", false)
	EnableTriggerGroup ("areacaster", false)
	EnableTriggerGroup ("singlecaster", false)
	EnableTriggerGroup ("autobow", false)
	EnableTriggerGroup ("autobrand", false)
	EnableTriggerGroup ("autocast", false)
	EnableTriggerGroup ("autodecept", false)
	EnableTriggerGroup ("autopick", false)
	EnableTriggerGroup ("autorc", false)
	EnableTriggerGroup ("autorescue", false)
	EnableTriggerGroup ("autoskin", false)
	EnableTriggerGroup ("autotrack", false)
	EnableTriggerGroup ("autotrackwalk", false)
	EnableTriggerGroup ("autosalv", false)
	EnableTriggerGroup ("autosend", false)
	EnableTriggerGroup ("autostartsalv", false)
	EnableTriggerGroup ("autostab", false)
	EnableTriggerGroup ("autowall", false)
	EnableTriggerGroup ("gurney", false)
	EnableTriggerGroup ("iskilling", false)
	EnableTriggerGroup ("q_frenzy", false)
	EnableTriggerGroup ("q_frenzy_quicken", false)
	EnableTriggerGroup ("q_sanc", false)
	EnableTriggerGroup ("rescuepusher", false)
	EnableTriggerGroup ("autoalert", false)
	EnableTriggerGroup ("autoportal", false)
	EnableTriggerGroup ("autosteel", false)
	EnableTriggerGroup ("autorest", false)
	EnableTriggerGroup ("GroupList", false)
	EnableTriggerGroup ("Counters", false)
	EnableTriggerGroup ("RaceMiraar", false)
	EnableTriggerGroup ("RaceDRC", false)
	EnableTriggerGroup ("detectClass", false)
	EnableTriggerGroup ("autonextlogin", false)
	
	EnableTrigger("flashrescue",false)
	EnableTrigger("folmay",false)
	
end

function resetTimers()
	EnableTimer("autopsyphon", false)
	EnableTimer("autocastarea", false)
	EnableTimer("autoheal", false)
	EnableTimer("groupStatsUpdate", false)
end

function resetVars()
	setStabStatus(false)
	setSlipStatus(false)
	setStabingById(false)
	SetVariable("lastdirmoved", "") 
	SetVariable("currentPlane", "") 
	clearActionQueue()
	clearGroupList()
	clearInventoryList()
	clearLottoNames()
	--clearDamList()
	clearShapeNames()
	totalDamNum = 0
	brandcurrent = 0
	brandlevel = 0
	brandmax = 0
	tierChar = ""
	nextPlayer = "" 
	setStabAction("")
	killing = false
	isKillingWalking = false
	showTriggerWindow = false
	lag0Cast = false
	
	gmcpsanctime = ""
	gmcpspellstime = ""
	gmcpmoblvl = ""
	gmcpmobname = ""
	gmcpmobhealth = ""
	gmcphp = ""
	gmcpmaxhp = ""
	gmcplag = ""
	gmcpmonhp = ""
	gmcpmaxmonhp = ""
	
	setAwfulCast(false)
	setVizFinalRiteCasted(false)
	setShowVizPool(false)
	setVizDmg(false)
	setVizHeal(false)
	setVizSs(false)
end

-- Setup race/class functions
function detectClass(className)
	if className == "Sorcerer" then setupClassSOR()
	elseif className == "Druid" then setupClassDRU()
	elseif className == "Ranger" then setupClassRAN()
	elseif className == "Warrior" then setupClassWAR()
	elseif className == "Priest" then setupClassPRS()
	elseif className == "Assassin" then setupClassASN()
	elseif className == "Bladedancer" then setupClassBLD()
	elseif className == "Paladin" then setupClassPAL()
	elseif className == "Wizard" then setupClassWZD()
	elseif className == "Bodyguard" then setupClassBOD()
	elseif className == "Archer" then setupClassARC()
	elseif className == "Psionicist" then setupClassPSI()
	elseif className == "Mage" then setupClassMAG()
	elseif className == "Monk" then setupClassMON()
	elseif className == "Mindbender" then setupClassMND()
	elseif className == "Stormlord" then setupClassSTM()
	elseif className == "Black Circle Initiate" then setupClassBCI()
	elseif className == "Berserker" then setupClassBZK()
	elseif className == "Rogue" then setupClassROG()
	elseif className == "Fusilier" then setupClassFUS()
	elseif className == "Shadowfist" then setupClassSHF()
	elseif className == "Cleric"  then setupClassCLE()
	elseif className == "Vizier"  then setupClassVIZ()
	end	
	
	updateTriggerStatusList()
end

function detectRace(raceName)
	if raceName == "Draconian" then setupRaceDRC() 
	elseif raceName == "Miraar" then setupRaceMIR()
	
	end	
end

function setupRaceDRC()
	setGroupValue ("RaceDRC", true)
end

function setupRaceMIR()
	setGroupValue ("RaceMiraar", true)
end

function setupClassSOR()
	Note("setupClassSOR")
	SetVariable("playerclass","SOR")
	setGroupValue("classsor", true)
	EnableTriggerGroup ("addme", true)
	EnableTriggerGroup ("autosalv", true)
	EnableTriggerGroup ("autosend", true)
	EnableTriggerGroup ("autorc", true)
	EnableTriggerGroup ("singlecaster", true)
	EnableTriggerGroup ("iskilling", true)
	EnableTriggerGroup ("autocast", true)

	if (GetVariable("playername") == "Hoje" and isMday() == false) then
		setLag0Cast(false)
		EnableTriggerGroup ("iskilling", false)
	else
		setLag0Cast(true)
	end
end

function setupClassDRU()
	Note("setupClassDRU")
	SetVariable("playerclass","DRU")
	setGroupValue ("classdru", true)
	EnableTriggerGroup ("addme", true)
	EnableTriggerGroup ("iskilling", true)
	EnableTriggerGroup ("autobow", true)
	EnableTriggerGroup ("autorc", true)
	EnableTriggerGroup ("autosalv", true)
	EnableTriggerGroup ("autosend", true)
	EnableTriggerGroup ("autowall", true)
end

function setupClassPRS()
	Note("setupClassPRS")
	SetVariable("playerclass","PRS")
	setGroupValue ("classprs", true)
	EnableTriggerGroup ("autosend", true)
	EnableTriggerGroup ("addme", true)
	EnableTriggerGroup ("autostartsalv", true)
end

function setupClassASN()
	Note("setupClassASN")
	SetVariable("playerclass","ASN")
	setGroupValue ("classasn", true)
	EnableTriggerGroup ("addme", true)
	EnableTriggerGroup ("iskilling", true)
	EnableTriggerGroup ("autobow", true)
	
	if getTierChar() == "Hero" then
		EnableTriggerGroup ("q_frenzy", true)
	else
		EnableTriggerGroup ("q_frenzy_quicken", true)
	end
	
	EnableTriggerGroup ("autoalert", true)
	setStabStatus(true)
	EnableTriggerGroup ("autostab", true)
end

function setupClassBLD()
	Note("setupClassBLD")
	SetVariable("playerclass","BLD")
	setGroupValue ("classbld", true)
	EnableTriggerGroup ("addme", true)
	EnableTriggerGroup ("iskilling", true)
	EnableTriggerGroup ("autopick", true)
	EnableTriggerGroup ("autotrack", true)
	EnableTriggerGroup ("autoalert", true)
	EnableTriggerGroup ("autosalv", true)
end

function setupClassWZD()
	Note("setupClassWZD")
	SetVariable("playerclass","WZD")
	setGroupValue ("classwzd", true)
	EnableTriggerGroup ("addme", true)
	EnableTriggerGroup ("iskilling", true)
	EnableTriggerGroup ("autocast", true)
	setLag0Cast(true)
	EnableTriggerGroup ("areacaster", true)
	EnableTriggerGroup ("autosalv", true)
	EnableTriggerGroup ("autosend", true)
	EnableTriggerGroup ("autowall", true)
end

function setupClassARC()
	Note("setupClassARC")
	SetVariable("playerclass","ARC")
	setGroupValue ("classarc", true)
	EnableTriggerGroup ("addme", true)
	EnableTriggerGroup ("iskilling", true)
	EnableTriggerGroup ("autobow", true)
	EnableTriggerGroup ("autoskin", true)
	
	if getTierChar() == "Hero" then
		EnableTriggerGroup ("q_frenzy", true)
	else
		EnableTriggerGroup ("q_frenzy_quicken", true)
	end
end

function setupClassPSI()
	Note("setupClassPSI")
	SetVariable("playerclass","PSI")
	setGroupValue ("classpsi", true)
	EnableTriggerGroup ("addme", true)
	EnableTriggerGroup ("iskilling", true)
	
	if getTierChar() == "Hero" then
		EnableTriggerGroup ("q_frenzy", true)
	else
		EnableTriggerGroup ("q_frenzy_quicken", true)
	end
	
	EnableTriggerGroup ("autocast", true)
	setLag0Cast(true)
	EnableTriggerGroup ("autosalv", true)
	EnableTriggerGroup ("autosend", true)
	EnableTriggerGroup ("autodecept", true)
	
end

function psiSolo(value)
	if value == true then
		EnableTriggerGroup ("q_frenzy", false)
		EnableTriggerGroup ("autocast", false)
		setLag0Cast(false)
		EnableTrigger("psiwield",false)
		EnableTrigger("folmay",true)
	else
		EnableTriggerGroup ("q_frenzy", true)
		EnableTriggerGroup ("autocast", true)
		setLag0Cast(true)
		EnableTrigger("psiwield",true)
		EnableTrigger("folmay",false)
	end
end

function setupClassMAG()
	Note("setupClassMAG")
	SetVariable("playerclass","MAG")
	setGroupValue ("classmag", true)
	EnableTriggerGroup ("addme", true)
	EnableTriggerGroup ("iskilling", true)
	EnableTriggerGroup ("autocast", true)
	setLag0Cast(true)
	EnableTriggerGroup ("areacaster", true)
	EnableTriggerGroup ("autosalv", true)
	EnableTriggerGroup ("autosend", true)
	EnableTriggerGroup ("autoportal", true)	
end

function setupClassMND()
	Note("setupClassMND")
	SetVariable("playerclass","MND")
	setGroupValue ("classmnd", true)
	EnableTriggerGroup ("addme", true)
	EnableTriggerGroup ("iskilling", true)
	EnableTriggerGroup ("autocast", true)
	setLag0Cast(true)
	EnableTriggerGroup ("autosalv", true)
	EnableTriggerGroup ("autosend", true)
	EnableTriggerGroup ("singlecaster", true)
	EnableTriggerGroup ("autodecept", true)
end

function setupClassSTM()
	Note("setupClassSTM")
	SetVariable("playerclass","STM")
	setGroupValue ("classstm", true)
	EnableTriggerGroup ("addme", true)
	EnableTriggerGroup ("autosalv", true)
	EnableTriggerGroup ("autosend", true)
end

function setupClassBCI()
	Note("setupClassBCI")
	SetVariable("playerclass","BCI")
	setGroupValue ("classbci", true)
	EnableTriggerGroup ("addme", true)
	EnableTriggerGroup ("iskilling", true)
	EnableTriggerGroup ("autopick", true)
	
	if getTierChar() == "Hero" then
		EnableTriggerGroup ("q_frenzy", true)
	else
		EnableTriggerGroup ("q_frenzy_quicken", true)
	end
	
	setStabStatus(true)
	EnableTriggerGroup ("autoalert", true)
	EnableTriggerGroup ("autostab", true)
end

function setupClassROG()
	Note("setupClassROG")
	SetVariable("playerclass","ROG")
	setGroupValue ("classrog", true)
	EnableTriggerGroup ("addme", true)
	EnableTriggerGroup ("iskilling", true)
	EnableTriggerGroup ("autopick", true)
	
	if getTierChar() == "Hero" then
		EnableTriggerGroup ("q_frenzy", true)
	else
		EnableTriggerGroup ("q_frenzy_quicken", true)
	end
	
	EnableTriggerGroup ("autoalert", true)
	setStabStatus(true)
	EnableTriggerGroup ("autostab", true)
end

function setupClassFUS()
	Note("setupClassFUS")
	SetVariable("playerclass","FUS")
	setGroupValue ("classfus", true)
	EnableTriggerGroup ("addme", true)
	EnableTriggerGroup ("iskilling", true)
	EnableTriggerGroup ("autoskin", true)
	
	if getTierChar() == "Hero" then
		EnableTriggerGroup ("q_frenzy", true)
	else
		EnableTriggerGroup ("q_frenzy_quicken", true)
	end
	
	EnableTriggerGroup ("autobow", true)
end

function setupClassCLE()	
	Note("setupClassCLE")
	SetVariable("playerclass","CLE")
	setGroupValue ("classcle", true)
	EnableTriggerGroup ("addme", true)
	EnableTriggerGroup ("iskilling", true)
	EnableTriggerGroup ("autorc", true)	
	EnableTriggerGroup ("autostartsalv", true)
	EnableTriggerGroup ("autosend", true)
end

function setupClassVIZ()	
	Note("setupClassVIZ")
	SetVariable("playerclass","VIZ")
	setGroupValue ("classviz", true)
	EnableTriggerGroup ("addme", true)
	EnableTriggerGroup ("iskilling", true)
	EnableTriggerGroup ("autosend", true)
	EnableTriggerGroup ("autorc", true)
	setVizDmg(true)
	setVizHeal(true)
	setVizFr(true)
	setVizSs(true)
end

function setupClassPAL()
	Note("setupClassPAL")
	SetVariable("playerclass","PAL")
	setGroupValue ("classpal", true)
	EnableTriggerGroup ("addme", true)
	EnableTriggerGroup ("autosend", true)
	EnableTriggerGroup ("iskilling", true)
	
	if getTierChar() == "Hero" then
		EnableTriggerGroup ("q_frenzy", true)
	else
		EnableTriggerGroup ("q_frenzy_quicken", true)
	end
end

function setupClassWAR()
	Note("setupClassWAR")
	SetVariable("playerclass","WAR")
	setGroupValue ("classwar", true)
	EnableTriggerGroup ("addme", true)
	EnableTriggerGroup ("iskilling", true)
	
	if getTierChar() == "Hero" then
		EnableTriggerGroup ("q_frenzy", true)
	else
		EnableTriggerGroup ("q_frenzy_quicken", true)
	end
end

function setupClassBOD()
	Note("setupClassBOD")
	SetVariable("playerclass","BOD")
	setGroupValue ("classbod", true)
	EnableTriggerGroup ("iskilling", true)
	EnableTriggerGroup ("autoalert", true)
	EnableTriggerGroup ("autorest", true)
	
	if getTierChar() == "Hero" then
		EnableTriggerGroup ("q_frenzy", true)
	end
	
	--EnableTriggerGroup ("addme", true)
	setGroupValue("autorescue", true)	
	canRescue = true
	--EnableTriggerGroup ("rescuepusher", true)	
end

function setupClassMON()
	Note("setupClassMON")
	SetVariable("playerclass","MON")
	setGroupValue ("classmon", true)
	setGroupValue("autorescue", true)	
	canRescue = true
	EnableTriggerGroup ("autosteel", true)
	setGroupValue("classmonshf", true)
		
	if (GetVariable("playername") == "Ica" and isMday() == true) then
		Execute("onflash")
	end
end

function setupClassBZK()
	Note("setupClassBZK")
	SetVariable("playerclass","BZK")
	setGroupValue ("classbzk", true)
	setGroupValue("autorescue", true)
	EnableTriggerGroup ("addme", true)
	--EnableTriggerGroup ("rescuepusher", true)	
	EnableTriggerGroup ("iskilling", true)
	EnableTriggerGroup ("autorest", true)
end

function setupClassSHF()
	Note("setupClassSHF")
	SetVariable("playerclass","SHF")
	setGroupValue ("classshf", true)
	setGroupValue("autorescue", true)	
	canRescue = true
	setGroupValue("classmonshf", true)
	EnableTriggerGroup ("autopick", true)
	EnableTriggerGroup ("autoalert", true)
	EnableTriggerGroup ("autosteel", true)
end

function setupClassRAN()
	Note("setupClassRAN")
	SetVariable("playerclass","RAN")
	setGroupValue ("classran", true)
	setGroupValue("autorescue", true)
	canRescue = true
	--EnableTriggerGroup ("rescuepusher", true)	
	EnableTriggerGroup ("autosteel", true)
end

--Functions to set values
function setStabStatus(value)
	canStab = value
	updateTriggerStatusList()
end

function setSlipStatus(value)
	canSlip = value
	updateTriggerStatusList()	
end

function setWindowShow(param)
	WindowShow (win,  param)
	EnableTimer("groupStatsUpdate", param)
end

function setWindowShowTrigger(param)
	showTriggerWindow = param
	updateTriggerStatusList()
end

function setStabAction(action)
	stabAction = action
	updateTriggerStatusList()
end

function setStabingById(value)
	isStabingById = value
	updateTriggerStatusList()
end

function setBash(status, offhand)
	isBashOn = status
	
	if offhand and offhand ~= "" and offhand ~= " " then 
		offhandName = offhand
	else
		offhandName = "sword"
	end
end

function setKilling(value)
	killing = value
	updateTriggerStatusList()
end

function setGroupValue(group, value)
	EnableAliasGroup (group, value)
	EnableTriggerGroup (group, value)
end

function setTierChar(tier)
	tierChar = tier
end

function setShowVizPool(value)
	showVizPool = value
end

function setVizFinalRiteCasted(value)
	vizFinalRiteCasted = value
	updateTriggerStatusList()
end

function setRescue(resc)
	canRescue = resc
	updateTriggerStatusList()
end

function setDisabledStabName(value)
	disabledStabName = value
end

function setVizDmg(value)
	vizDmgOn = value
end

function setVizHeal(value)
	vizHealOn = value
end

function setVizFr(value)
	vizFrOn = value
end

function setVizSs(value)
	vizSsOn = value
end

function setVizLimits(lowValue, highValue)
	lowVizHealthLimit = tonumber(lowValue)
	highVizHealthLimit = tonumber(highValue)
	Note("Viz limits set to min " .. lowValue .. ", max " .. highValue)
end

function setAwfulCast(value)
	awfulCast = value
end

function setGmcpSancTime(value)
	gmcpsanctime = value
end

function setGmcpSpellsTime(value)
	gmcpspellstime = value
end

function setGmcpMobLvl(value)
	gmcpmoblvl = value
end

function setGmcpMobName(value)
	gmcpmobname = value
end

function setGmcpHp(value)
	gmcphp = value
end

function setGmcpMaxHp(value)
	gmcpmaxhp = value
end

function setGmcpMonHp(value)
	gmcpmonhp = value
end

function setGmcpMaxMonHp(value)
	gmcpmaxmonhp = value
end

function setLag0Cast(value)
	lag0Cast = value
end

--Functions to get values
function isKilling()
	return killing
end

function isMday()
	if isTriggerOn("mdayorder") == true then
		return true
	else
		return false
	end
end

function getCanStab()
	--Note("entrou get can stab: " .. safeStringValue(canStab))
	return canStab
end

-- Groupies functions

function groupMake()
	clearGroupList()
	EnableTrigger ("GroupCommand", true)
	SendNoEcho("group")
	runAfter (5, 'orderGroupListByMaxHp()')
end

function checkRoom()
	missedList = {}

	for k,v in pairs(groupList) do
		found = 0

		for j = 1, #roomList do
			if string.lower(k) == 
				string.lower(roomList[j]) then       
				found = 1 
			end
		end

		if found == 0 then
			if GetVariable("playername") ~= k then
				table.insert (missedList, k)
			end
		end
	end
	
	if table.getn(missedList) > 0 then
		SendNoEcho("gt Missing list: " .. listToString(missedList))
	end
end

function addRoomList(name)
	table.insert (roomList, name)
end

function addGroupie(name, hp, maxHp, mana, maxMana, leader, align, class, race, level)
	groupieFormat = "/groupList.%s = {hp=%d, maxHp=%d, mana=%d, maxMana=%d, leader=%s, align=%d, class=%q, race=%q, level=%q}"
	groupieText = string.format(groupieFormat, name, hp, maxHp, mana, maxMana, leader, align, class, race, level)
	
	Execute(groupieText)
end

function remGroupie(name)
	Execute("/groupList[\"" .. name   .. "\"] = nil")
end

function showGroupList()
	ColourNote("red", "white", "Group List Size: " .. tableLength(groupList))

	for k,v in pairs(groupList) do
		ColourNote("red", "white", k)
	end
end

function orderGroupList()
	orderGroupListByMaxHp()
	
	for k,v in ipairs(sortedGroupList) do
		Send("grouporder " .. v .. " front")
	end
end

function orderGroupListByMaxHp()
	sortedGroupList = {}
	
	table.foreach (groupList, function (k, v) table.insert (sortedGroupList, k) end )
	table.sort (sortedGroupList, function (k1, k2) return groupList[k1].maxHp < groupList[k2].maxHp end )
end

function updateGroupLeader(leader)
	SetVariable("groupleader", leader)
	Note("Groupleader set to " .. leader)
end

function remCurSelGroup()
	if GetSelection() == nil then
		return
	end
	
	ColourNote("red", "white", GetSelection() .. " removed from Group List!")
	remGroupie(GetSelection(), 1)
end

function checkGroupDeathInfo(name)
	found = 0

	for k,v in pairs(groupList) do
		if string.lower(k) == string.lower(name) then       
			found = 1 
		end
	end
	
	if found == 1  then
		ColourNote ("white", "red", "WARNING: DEAD GROUPIE: " .. name)
	end
end

function sendOrder(msgTo, msgContent)
	found = 0

	for k,v in pairs(groupList) do
		if string.lower(k) == string.lower(msgTo) then       
			found = 1 
		end
	end
	
	if found == 1  then
		Execute("tell " .. msgTo .. " " .. world.GetVariable("strOrder") .. " " .. msgContent)
	end
end

function autoSetRescue()
	if isTriggerOn("autorescue") == true then
		for k, v in pairs(groupList) do
			classText = v.class
			
			if classText == "SOR" or classText == "DRU" or classText == "PRS" or classText == "ASN" or 
			   classText == "BLD" or classText == "WZD" or classText == "ARC" or classText == "PSI" or 
			   classText == "MAG" or classText == "MND" or classText == "STM" or classText == "BCI" or 
			   classText == "ROG" or classText == "FUS" or classText == "CLE" or classText == "VIZ" then
			   
			   addRescue(k)
			end
		end
	end
end

-- Functions to deal with windows

function onWindow()
	EnableTimer ("groupStatsUpdate", true)
	setWindowShow(true)
end

function offWindow()
	EnableTimer ("groupStatsUpdate", false)
	setWindowShow(false)
	EnableTriggerGroup ("GroupList", false)
end

function groupStatsUpdateAction()
	clearGroupList()
	Execute('sendgmcp Char.Group.List')
end

function updateGMCPGroupWindow()
	orderGroupListByMaxHp()
	drawCharStatus()
end

function onWindowTrigger()
	setWindowShowTrigger(true)
end

function offWindowTrigger()
	setWindowShowTrigger(false)
end

function drawCharStatus()
	count = 0
	
	movewindow.save_state (win)
	setupWin()
	
	--WindowRectOp (win, miniwin.rect_fill, 0, 0, 0, 0, ColourNameToRGB(mwBgColor))
	
	for k, v in ipairs (sortedGroupList) do 

		k1 = v
		v1 = groupList[v]
		
		--tprint(v1)
		--Note(k1)
		
		if (v1 ~= nil and v1.hp ~= nil) then
			hpLeftSize = barWidth - barWidth*v1.hp/v1.maxHp
			hpTakenSize = barWidth - hpLeftSize

			if v1.maxMana ~= 0 then
				manaLeftSize = barWidth - barWidth*v1.mana/v1.maxMana
			else
				manaLeftSize = barWidth - barWidth
			end

			manaTakenSize = barWidth - manaLeftSize
			
			leaderText = " "
			if v1.leader == true then
				leaderText = "*"
				
				if string.upper(k1) ~= string.upper(world.GetVariable("groupleader")) then
					updateGroupLeader(k1)
				end
			end
			
			nameText = string.format(nameFormat, leaderText .. " " .. k1)
			hpText = string.format(statsFormat, v1.hp, v1.maxHp)
			manaText = string.format(statsFormat, v1.mana, v1.maxMana)
			
			classText = v1.class
			raceText = v1.race
			
			levelText = string.format(levelFormat, v1.level)

			text1 = nameText .. ': ' .. hpText .. ' Hp'
			text2 = manaText .. ' Ma'
			text3 = raceText .. " " .. classText .. " " .. levelText

			WindowText (win, "f",
                text1,   -- text
                text1Begin,count*mwLineSize, 0, 0,        -- rectangle
                ColourNameToRGB (mwFontColor), -- colour
                false)              -- not Unicode

			WindowText (win, "f",
                text2,   -- text
                text2Begin,count*mwLineSize, 0, 0,        -- rectangle
                ColourNameToRGB (mwFontColor), -- colour
                false)              -- not Unicode

			WindowText (win, "f",
                text3,   -- text
                text3Begin,count*mwLineSize, 0, 0,        -- rectangle
                ColourNameToRGB (mwFontColor), -- colour
                false)              -- not Unicode
				
			WindowRectOp (win, miniwin.rect_fill, leftBarBegin, count*mwLineSize+upBarShift, leftBarBegin+hpTakenSize, count*mwLineSize+upBarShift+barHeight, ColourNameToRGB(mwPositiveColorBar))
			WindowRectOp (win, miniwin.rect_fill, leftBarBegin+hpTakenSize, count*mwLineSize+upBarShift, leftBarBegin+barWidth, count*mwLineSize+upBarShift+barHeight,  ColourNameToRGB(mwNegativeColorBar))

			WindowRectOp (win, miniwin.rect_fill, rightBarBegin, count*mwLineSize+upBarShift, rightBarBegin+manaTakenSize, count*mwLineSize+upBarShift+barHeight, ColourNameToRGB(mwPositiveColorBar))
			WindowRectOp (win, miniwin.rect_fill, rightBarBegin+manaTakenSize, count*mwLineSize+upBarShift, rightBarBegin+barWidth, count*mwLineSize+upBarShift+barHeight,  ColourNameToRGB(mwNegativeColorBar))

		end
		count = count + 1
	end

	setWindowShow(true)

end

function drawTriggerStatus()
	local mwWidth = 200
	local mwHeight = 200

--------------------------------------------------

	WindowCreate (winTrigger, 500, 2, mwWidth, mwHeight, miniwin.pos_top_center, 6, ColourNameToRGB(mwBgColor))  -- create window
	WindowFont (winTrigger, "f", mwFont, mwFontSize, true, false, false, false) -- define font

--------------------------------------------------

		for j = 1, #triggerStatusList do
			
				WindowText (winTrigger, "f",
                triggerStatusList[j],   -- text
                1,(j-1)*mwLineSize, 0, 0,        -- rectangle
                ColourNameToRGB (mwFontColor), -- colour
                false)              -- not Unicode

			end
	
	--setWindowShowTrigger(true)
end

function updateTriggerStatusList()
	if showTriggerWindow == true then

		triggerStatusList = {}
		
		text1 = "PlayerName: " .. GetVariable("playername")
		text2 = "PlayerClass: " .. GetVariable("playerclass")
		text3 = "Rescue: " .. tostring(isTriggerOn("autorescue"))
		text4 = "Cast: " .. tostring(lag0Cast)
		text5 = "Target: " .. tostring(isTriggerOn("iskilling"))
		text6 = "Stab: " .. tostring(getCanStab())
		text7 = "Slip: " .. tostring(canSlip)
		text8 = "Walking: " .. tostring(isKillingWalking)
		text9 = "StabAction: " .. stabAction
		text10 = "vizFinalRiteCasted: " .. tostring(vizFinalRiteCasted)
		text11 = "vizMinLimit: " .. tostring(lowVizHealthLimit)
		text12 = "vizMaxLimit: " .. tostring(highVizHealthLimit)

		
		table.insert (triggerStatusList, text1)
		table.insert (triggerStatusList, text2)
		table.insert (triggerStatusList, text3)
		table.insert (triggerStatusList, text4)
		table.insert (triggerStatusList, text5)
		table.insert (triggerStatusList, text6)
		table.insert (triggerStatusList, text7)
		table.insert (triggerStatusList, text8)
		table.insert (triggerStatusList, text9)
		table.insert (triggerStatusList, text10)
		table.insert (triggerStatusList, text11)
		table.insert (triggerStatusList, text12)
		
		drawTriggerStatus()
	end
	WindowShow (winTrigger,  showTriggerWindow)
end

-- Inventory / lotto functions
function addInventoryItem(item, qtde)
	item = trim(item)
	
	if item ~= nil and string.len(item) > 0 and string.match(item, "xMainBag") == nil and string.match(item, "lockbox") == nil then
		strQtde = ""
		
		if qtde ~= nil and string.len(qtde) > 0 then
			strQtde = qtde .. "x "
		end
		
		table.insert (inventoryList, strQtde .. item)
	end
end

function addLotto(name, showlotto)
	found = 0

	if lottoNames == nil then
	  lottoNames = {}
	end

	for i = 1, #lottoNames do
	  if string.lower(lottoNames[i]) == string.lower(name) then 
		found = 1 
	  end
	end

	if found ~= 1 then
	  table.insert(lottoNames, name)
	end
	
	if showlotto == true then
		showLotto()
	end
	
	
end

function remLotto(name)
	indexToRemove = -1

	for i = 1, #lottoNames do
	  if string.lower(lottoNames[i]) == string.lower(name) then 
		indexToRemove = i 
	  end
	end

	if indexToRemove ~= -1 then
	  table.remove(lottoNames, indexToRemove)
	  ColourNote("red", "white", name .. " removed from actionQueue!")
	end

	showLotto()
end

function showLotto()
	ColourNote("red", "white", "Lotto List Size: " .. tableLength(lottoNames))

	for i = 1, #lottoNames do
		ColourNote("red", "white", lottoNames[i])
	end
end

function passItemGroup(item)
	Note("Passing " .. item .. " to the group")

	for k,v in pairs(groupList) do
		Send("give " .. item .. " " .. k)
	end
end

-- Killing functions
function killCurrentTarget()
	Note("")
	Send("kil " .. currentTarget)
end

function longShotFleer(dir)	
	Note("")
	Send("ls " .. dir .. " " .. currentTarget)
end

function killAfterEmote(leader, target)
	local currentPlayer = world.GetVariable("playername")
	
	if currentPlayer ~= leader then
		Note("")
		Send("kill " .. target)
		currentTarget = target
		
		if isBashOn == true then
			Send("wear shield=bash=st=wear " .. offhandName)
		end
	end
end

function detectWalking(mob)
	if isKillingWalking == true  then
		Simulate(mob .. "\n")
	end
end

function attackById(idMob)
	if isStabingById == true then
		Note("Atacking mob id " .. idMob)
		Send(stabAction .. " " .. idMob)
	end
end

function autoSlip(mob)
	lastdirmoved = 	GetVariable("lastdirmoved")
	usingBow = false
	
	if isTriggerOn("autoreloadbow") == true then
		usingBow = true
	end
	
	setStabStatus(false)
	
	if usingBow == true then
		if lastdirmoved == "north" then
			Execute("south=remove bow=slip north " .. mob .. "=wield bow=assassinate " .. mob)
		elseif lastdirmoved == "south" then
			Execute("north=remove bow=slip south " .. mob .. "=wield bow=assassinate " .. mob)
		elseif lastdirmoved == "east" then
			Execute("west=remove bow=slip east " .. mob .. "=wield bow=assassinate " .. mob)
		elseif lastdirmoved == "west" then
			Execute("east=remove bow=slip west " .. mob .. "=wield bow=assassinate " .. mob)
		elseif lastdirmoved == "up" then
			Execute("down=remove bow=slip up " .. mob .. "=wield bow=assassinate " .. mob)
		elseif lastdirmoved == "down" then
			Execute("up=remove bow=slip down " .. mob .. "=wield bow=assassinate " .. mob)
		end
	else
		if lastdirmoved == "north" then
			Execute("south=slip north " .. mob .. "=assassinate " .. mob)
		elseif lastdirmoved == "south" then
			Execute("north=slip south " .. mob .. "=assassinate " .. mob)
		elseif lastdirmoved == "east" then
			Execute("west=slip east " .. mob .. "=assassinate " .. mob)
		elseif lastdirmoved == "west" then
			Execute("east=slip west " .. mob .. "=assassinate " .. mob)
		elseif lastdirmoved == "up" then
			Execute("down=slip up " .. mob .. "=assassinate " .. mob)
		elseif lastdirmoved == "down" then
			Execute("up=slip down " .. mob .. "=assassinate " .. mob)
		end
	end
	
	setStabStatus(true)	
end	

--On/off functions
function onStab(action)
	setStabStatus(true)

	if action and action ~= "" and action ~= " " then 
		setStabAction(action)
	end
end

function offStab()
	setStabStatus(false)
end

function onStabById(action)
	setStabingById(true)

	if action and action ~= "" and action ~= " " then 
		setStabAction(action)
	end
end

function offStabById()
	setStabingById(false)
end

function onWalking(action)
	isKillingWalking = true

	if action and action ~= "" and action ~= " " then 
		setStabAction(action)
	end
	
	updateTriggerStatusList()
end

function offWalking()
	isKillingWalking = false
	
	updateTriggerStatusList()
end

-- Update functions
function UpdateInfoBar()
	local mobInfo = ""
	
	if gmcpmoblvl ~= nil and string.len(gmcpmoblvl) > 0 and gmcpmoblvl ~= "0" then
		mobInfo = " .:. Mob: L " .. gmcpmoblvl .. " .:. " .. gmcpmobhealth .. "% .:. " .. gmcpmobname  
	end

	local brandinfo = ""
	
	if tonumber(brandlevel) and tonumber(brandlevel) > 0 then
		brandinfo =" .:. L" .. safeStringValue(brandlevel) .. " " .. safeStringValue(brandcurrent) .. "/" .. safeStringValue(brandmax)
	end
	
	SetStatus("XP: " .. safeStringValue(gainedxp) .. brandinfo .. " .:. Sanc: " .. safeStringValue(gmcpsanctime) .. " .:. Spells: " .. safeStringValue(gmcpspellstime) .. mobInfo)
end

function updateTitle(title)
	SetTitle(title)
end

function updateMobHealth(value)
	gmcpmobhealth = value
	
	numvalue = tonumber(value)
	
	if GetVariable("playerclass") == "VIZ" then
		checkVizAction(numvalue)
	elseif awfulCast == true and numvalue < 15 and numvalue > 0 then
		Execute("mm")
	end
end

function updateSancTime(p_sancTime)
	timesanc = p_sancTime
	UpdateInfoBar()
end

--GMCP Functions
function autoPrsAbsolve(alig)
	if tonumber(alig) and tonumber(alig) < 700 then
		Send("preach absolve")	
	end
end

function updateLag(lag)
	gmcplag = tonumber(lag)
	
	--Note("gmcplag " .. tostring(gmcplag) .. " " .. tostring(gmcplag == 0))
	--Note("lag0Cast " .. tostring(lag0Cast) .. " " .. tostring(lag0Cast == true))
	--Note("isKilling() " .. tostring(isKilling()) .. " " .. tostring(isKilling() == true))
	
	if gmcplag == 0 and lag0Cast == true and isKilling() == true then
		setKilling(false)
		SendNoEcho("mm")	
	end
end

function checkShape (leftTime)
	if leftTime == "25" then
		shapeNext()
	end
end

--Vizier Functions
function checkVizAction(numvalue)
	if numvalue == 0 then
		updateTriggerStatusList()
		setVizFinalRiteCasted(false)
	elseif numvalue < lowVizHealthLimit and vizDmgOn == true then
		if getTierChar() == "Hero" and vizFinalRiteCasted == false then
			castPhlebotomize("")
		elseif getTierChar() == "Lord" and numvalue > 20 then
			castEnervate("")
		end
	elseif vizFinalRiteCasted == false and numvalue > highVizHealthLimit and vizFrOn == true then
		if tonumber(gmcphp) > 10000 then
			Send("c 'soul shackle'")
		end
		
		castFinalRites("")
	end
end

function castPhlebotomize(target)
	Send("c phlebotomize " .. target)
	updateTriggerStatusList()
end

function castEnervate(target)
	Send("c enervate " .. target)
	updateTriggerStatusList()
end

function castFinalRites(target)
	Note("casting final rites")
	Send("c 'final rites' " .. target)
	setVizFinalRiteCasted(true)
	updateTriggerStatusList()
end

function castSanguenPax()
	Note("Casting SanguenPax")
	Send("c 'sanguen pax' pool")			
	setVizFinalRiteCasted(false)
	updateTriggerStatusList()
end

function castVitaeFlux()
	Note("Casting VitaeFlux")
	Send("c 'vitae flux' pool")	
	Send("stance soul")	
	setVizFinalRiteCasted(false)
	updateTriggerStatusList()
end

function noticePoolCreated()
	if showVizPool == true then
		ColourNote ("blue", "cyan", "WARNING: VIZ POOL CREATED")
	end
	
	if GetVariable("playerclass") == "VIZ" and vizHealOn == true then
		if getTierChar() == "Hero" then
			castSanguenPax()
		else
			castVitaeFlux()
		end			
	end
end
	
--Shape functions
function addShape(name)
	found = 0

	if shapeNames == nil then
	  shapeNames = {}
	end

	for i = 1, #shapeNames do
	  if string.lower(shapeNames[i]) == string.lower(name) then 
		found = 1 
	  end
	end

	if found == 1 then
	  ColourNote("red", "white", name .. " already in the shape list!")
	else
	  table.insert(shapeNames, name)
	  ColourNote("red", "white", name .. " added to shape list!")
	end
end

function remShape(name)
	indexToRemove = -1

	for i = 1, #shapeNames do
	  if string.lower(shapeNames[i]) == string.lower(name) then 
		indexToRemove = i 
	  end
	end

	if indexToRemove == -1 then
	  ColourNote("red", "white", name .. " wasn't in the shape list!")
	else
	  table.remove(shapeNames, indexToRemove)
	  ColourNote("red", "white", name .. " removed from shape list!")
	end
end

function shapeNext()
	if shapeNames == nil then
	  shapeNames = {}
	end

	--for i = 1, #shapeNames do
	  --if shapeNames[i] ~= nil then
		--addActionQueue("rac shapeshift " .. shapeNames[i])
		--remShape(shapeNames[i])
	  --end
	--end
	
	if shapeNames[1] ~= nil then
		addActionQueue("rac shapeshift " .. shapeNames[1])
		remShape(shapeNames[1])
	end
end

--Orders functions
function castpc()
	if GetVariable("playerclass") == "PRS" then
		Send("preach comf")
	end
end

function castps()
	if GetVariable("playerclass") == "PRS" then
		Send("ps")
	end
end

function castcc(name)
	if GetVariable("playerclass") == "PRS" or GetVariable("playerclass") == "CLE" or GetVariable("playerclass") == "DRU" or GetVariable("playerclass") == "VIZ" then
		Send("c comfort " .. name)
	end
end

function castdd(name)
	if GetVariable("playerclass") == "PRS" or GetVariable("playerclass") == "CLE" or GetVariable("playerclass") == "DRU" or GetVariable("playerclass") == "VIZ" then
		Send("c div " .. name)
	end
end

function castcla()
	if GetVariable("playerclass") == "PRS" then
		Send("preach clarify")
	end
end

function castpan()
	if GetVariable("playerclass") == "PRS" then
		Send("preach panacea")
	end
end

function aug(qtde)
	if GetVariable("playerclass") == "PRS" or GetVariable("playerclass") == "VIZ" then
		Send("aug " .. qtde)
	end
end

function castmm()
	if isTriggerOn("autocast") == true then
		Send("mm")
	end
end

function castms()
	if isTriggerOn("areacaster") == true then
		Send("ms")
	end
end

function castrc(name)
	if isTriggerOn("autorctrigger") == true then
		Execute("tell " .. name .. " " .. world.GetVariable("strOrder") .. " tell " .. GetVariable("playername") .. " rc")
	end
end

function bt()
	if GetVariable("playerclass") == "BLD" then
		Send("bt")
	end
end

function bte()
	if GetVariable("playerclass") == "BLD" then
		Send("bte")
	end
end

function ssv()
	if GetVariable("playerclass") == "BLD" then
		Send("ssv")
	end
end

function setWindowFilter()
	Execute("oo offwindow")
	Execute("oo onfilter")

	if GetVariable("playerclass") == "PRS" then
		Execute("onwindow")
	elseif GetVariable("playerclass") == "PSI" then
		Execute("offfilter")
	end	
end

--PSI Functions
function showPsiWeapons()
	tprint(weaponsWithIdOwnerList)
end

function  addWeaponsAlt(altName, weaponName)
	local weaponData = weaponsWithIdOwnerList[string.upper(weaponName)]
	
	if not weaponData then
		weaponFormat1 = "/weaponsWithIdOwnerList[%q] = {}"
		weaponText1 = string.format(weaponFormat1, string.upper(weaponName))	
		Execute(weaponText1)

		weaponFormat2 = "/weaponsWithIdOwnerList[%q][%q] = %q"
		weaponText2 = string.format(weaponFormat2, string.upper(weaponName), "owner", altName)	
		Execute(weaponText2)
	end
end

function findWeaponOwner(weaponName)
	local weaponData = weaponsWithIdOwnerList[string.upper(weaponName)]

	if weaponData then
		local owner = weaponsWithIdOwnerList[string.upper(weaponName)]["owner"]
		if owner then
			return owner
		end
	end
end

function pickPsiWeaponOnGround(idName)
	local t = splitString(idName,"#")

	local id = t[1]
	local name = t[2]

	local owner = findWeaponOwner(tostring(name))
	
	if owner then
		if string.upper(owner) == string.upper(GetVariable("playername")) then
			Execute("offcast")
		end
		
		Execute("get " .. id)
	end
end

function passPsiWeaponOwner(idName)
	local t = splitString(idName,"#")
	local id = t[1]
	local name = t[2]
	local owner = findWeaponOwner(tostring(name))

	if owner then

		if string.upper(owner) == string.upper(GetVariable("playername")) then
			Execute("wear " .. id)
		else
			Execute("give " .. id .. " " .. owner)
		end
	end
end

--Queue functions
function addActionQueue(value)
	table.insert(actionQueue, value)
	--TODO Romulo - avaliar pq estava comentado o execute
	--Execute(value)
	showActionQueue()
end

function remActionQueue(value)
	indexToRemove = -1

	for i = 1, #actionQueue do
	  if string.lower(actionQueue[i]) == string.lower(value) then 
		indexToRemove = i 
	  end
	end

	if indexToRemove ~= -1 then
	  table.remove(actionQueue, indexToRemove)
	  ColourNote("red", "white", value .. " removed from actionQueue!")
	end
end

function showActionQueue()
	ColourNote("red", "white", "Action Queue:")

	if actionQueue == nil then
	  actionQueue = {}
	end

	for i = 1, #actionQueue do
	  if actionQueue[i] ~= nil then
		ColourNote("red", "white", actionQueue[i])
	  end
	end
end

function execActionQueue()
	if actionQueue == nil then
	  actionQueue = {}
	end

	for i = 1, #actionQueue do
	  if actionQueue[i] ~= nil then
		Execute(actionQueue[i])
	  end
	end
end

--Rescue functions
function addCurSelRescue()
	if GetSelection() == nil then
		return
	end

	addRescue(GetSelection())
end

function remCurSelRescue()
	if GetSelection() == nil then
		return
	end
	
	remRescue(GetSelection())
end

function addRescue(name)
	found = 0

	if rescuelist == nil then
	  rescuelist = {}
	end

	for i = 1, #rescuelist do
	  if string.lower(rescuelist[i]) == string.lower(name) then 
		found = 1 
	  end
	end

	if found == 1 then
	  ColourNote("red", "white", name .. " already in the rescue list!")
	else
	  table.insert(rescuelist, name)
	  ColourNote("red", "white", name .. " added to rescue list!")
	end
end

function remRescue(name)
	indexToRemove = -1

	for i = 1, #rescuelist do
	  if string.lower(rescuelist[i]) == string.lower(name) then 
		indexToRemove = i 
	  end
	end

	if indexToRemove == -1 then
	  ColourNote("red", "white", name .. " wasn't in the rescue list!")
	else
	  table.remove(rescuelist, indexToRemove)
	  ColourNote("red", "white", name .. " removed from rescue list!")
	end
end

function avaliarRescue(rescueCandidate)
	found = 0

	if (rescuelist ~= nil and canRescue == true and getHpPercentage() > 30) then
		for i = 1, #rescuelist do
			if string.lower(rescuelist[i]) == string.lower(rescueCandidate) then       
				found = 1 
			end
		end
	end

	if found == 1 then
		Note("")
		Send("rescue " .. rescueCandidate)
		setRescue(false)
	end
end

--Sub names functions
function SubName(pref, name)
	ColourNote ("dodgerblue", "black", pref .. name)
end

function SubNameAggie(pref, name)
	ColourNote ("red", "black", pref .. name)
	
	if disabledStabName == false then
		if isKillingWalking == true then --quem define é o scan feito nas classes stabbers	
			Execute(stabAction .. " " .. name)	
		elseif getCanStab() == true then --quem define é a classe, pode ser desabilitado pelo offstab
			Execute(stabAction .. " " .. name)
			if isMday() then
				Execute(stabAction .. " 2." .. name)
			end
		end
	end
end

function SubNameLord(pref, name)
	ColourNote ("red", "black", pref .. name)
	
	if disabledStabName == false then
		if canSlip == true then --quem define é o player manualmente, pode ser desabilitado pelo offslip				
			autoSlip(name)
		elseif isKillingWalking == true then --quem define é o scan feito nas classes stabbers	
			Execute(stabAction .. " " .. name)	
		elseif getCanStab() == true then --quem define é a classe, pode ser desabilitado pelo offstab
			Execute(stabAction .. " " .. name)
			if isMday() then
				Execute(stabAction .. " 2." .. name)
			end
		end
	end

end

-- Auxiliary functions

function charLogin(name)
	updateTitle(name)
	SetVariable ("playername", name)
end

function defineNextChar(charName)
	if charName ~= nil and string.len(charName) > 2 then
		nextPlayer = charName
		EnableTriggerGroup ("autonextlogin", true)
		Execute("quit")
	end
end

function logNextChar()
	if nextPlayer ~= nil and string.len(nextPlayer) > 2 then
		Execute(nextPlayer)
		nextPlayer = ""
		EnableTriggerGroup ("autonextlogin", false)
	end
 end

function getTierChar()
	return tierChar
end

function defineStabAction(tier)
	if tier then
		if tier == "Hero" then
			setStabAction("backstab")
		elseif tier == "Lord" or tier == "Lady" then
			setStabAction("assassinate")
		end
	end
end

function planeTo(text)
	local plane = string.upper(text)
	local matchedText = 
	  string.match("AIRSCAPE",plane) or	
	  string.match("ARCADIA",plane) or	
	  string.match("ASTRAL",plane) or
	  string.match("FIREREALM",plane) or
	  string.match("KARNATH",plane) or
	  string.match("KZINTI",plane) or
	  string.match("HOMEWORLD",plane) or
	  string.match("MIDGAARDIA",plane) or
	  string.match("NOCTOPIA",plane) or
	  string.match("OUTLAND",plane) or
	  string.match("TARTERUS",plane) or
	  string.match("THORNGATE",plane) or
	  string.match("WATER",plane) or
	  string.match("STONE",plane) or
	  string.match("EARTH",plane) or
	  string.match("ANCHOR",plane)

	if matchedText ~= nil and string.len(matchedText) > 1 then
		SetVariable("currentPlane", text)
		Execute("cast plane " .. text)
	else
		Note("Invalid plane: " .. text )
	end
end

function getpassleader(item, atCorpse)
	if atCorpse == true then
		Send("get " .. item .. " corpse")
	else
		Send("get " .. item)
	end
	
	passleader(item)
end

function passleader(item)

	local lead = world.GetVariable("groupleader")
	local self = world.GetVariable("playername")
	
	if lead ~= self then
		Send("give " .. item .. " " .. lead)
	end
end

function getHpPercentage()
	local _currHp = tonumber(gmcphp)
	local _maxHp = tonumber(gmcpmaxhp)
	
	return 100*_currHp/_maxHp
end

--Utility functions
function keys_to_list(tab)
  local tmp = {}

  for k,_ in pairs(tab) do
	table.insert(tmp, k)
  end
  
  return table.concat(tmp, "|")
end

function sendToAllWorlds(command)
	for k, v in pairs (GetWorldIdList ()) do 
		GetWorldById (v):Execute (command)
	end
end

function trim(s)
  return (s:gsub("^%s*(.-)%s*$", "%1"))
end

function listToString(t)
	return table.concat(t,', ')
end

function tableLength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function splitString(inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={} ; i=1
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                t[i] = str
                i = i + 1
        end
        return t
end

function GetSafePluginVariable(varname)
	myVar = GetPluginVariable ("e94f6bd8509a2b00d10cb226", varname)

	if myVar == nil then
		return ""
	end
	
	return myVar
end

function GetSelection()
  -- find selection in output window, if any
  local first_line, last_line = GetSelectionStartLine(), 
                                math.min (GetSelectionEndLine(), GetLinesInBufferCount ())

  local first_column, last_column = GetSelectionStartColumn(), GetSelectionEndColumn()
  
  -- nothing selected, do normal copy
  if first_line <= 0 then
   return nil
  end -- if nothing to copy from output window
  
  local copystring = ""
  
  -- iterate to build up copy text
  for line = first_line, last_line do
  
    if line < last_line then
      copystring = copystring .. GetLineInfo(line).text:sub (first_column)  -- copy rest of line
      first_column = 1
      
      -- Is this a new line or merely the continuation of a paragraph?
      if GetLineInfo (line, 3) then
        copystring = copystring .. "\r\n"
      end  -- new line
      
    else
      copystring = copystring .. GetLineInfo(line).text:sub (first_column, last_column - 1)
    end -- if
        
  end  -- for loop
  
  -- Get rid of a spurious extra new line at the start.
  if copystring:sub (1, 2) == "\r\n" then
    copystring = copystring:sub (3)
  end   -- if newline at start
  
  -- finally return the result
  return copystring
  
end -- function GetSelection

function SendToWorld (name, message)
	local otherworld = GetWorld (name)
	if otherworld == nil then
		Note ("World " .. name .. " is not open")
		return
	end

	otherworld:Execute (message)	

end -- of SendToWorld

function safeStringValue(value)
	if value == nil then
		return ""
	else
		return tostring(value)
	end
end

function isTriggerOn(name)
	if GetTriggerInfo (name, 8) == true then
		return true
	else
		return false
	end
end

function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

function doAfter(delayTime, command)
	DoAfterSpecial (delayTime, command, sendto.execute)
end

function runAfter(delayTime, command)
	DoAfterSpecial (delayTime, command, sendto.script)
end

--End functions
setup()
