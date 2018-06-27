local m_template = nil

function CreateRaidSettingsForm()
	local form=createWidget(nil, "raidSettingsForm", "Form", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 720, 620, 200, 100)
	hide(form)
	priority(form, 5000)

	local panel=createWidget(form, "Panel", "Panel")
	
	local group1 = createWidget(form, "group1", "Panel")
	align(group1, WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW)
	resize(group1, 315, 31)
	move(group1, 15, 47)
	
	local group2 = createWidget(form, "group2", "Panel")
	align(group2, WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW)
	resize(group2, 315, 61)
	move(group2, 15, 77)
	
	local group3 = createWidget(form, "group3", "Panel")
	align(group3, WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW)
	resize(group3, 315, 271)
	move(group3, 15, 137)

	local group4 = createWidget(form, "group4", "Panel")
	align(group4, WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW)
	resize(group4, 365, 181)
	move(group4, 335, 47)
	
	local group5 = createWidget(form, "group5", "Panel")
	align(group5, WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW)
	resize(group5, 365, 333)
	move(group5, 335, 227)
	
	setLocaleText(createWidget(form, "raidSettingsFormHeader", "TextView",  WIDGET_ALIGN_CENTER, nil, 150, 20, nil, 16))
	setText(createWidget(form, "closeSomeSettingsButton", "Button", WIDGET_ALIGN_HIGH, WIDGET_ALIGN_LOW, 20, 20, 20, 20), "x")

	createWidget(form, "showStandartRaidButton", "CheckBox", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 300, 25, 20, 50)
	
	createWidget(form, "gorisontalModeButton", "CheckBox", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 300, 25, 20, 80)
	createWidget(form, "highlightSelectedButton", "CheckBox", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 300, 25, 20, 110)
	
	createWidget(form, "showServerNameButton", "CheckBox", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 300, 25, 20, 140)
	createWidget(form, "classColorModeButton", "CheckBox", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 300, 25, 20, 170)
	createWidget(form, "showClassIconButton", "CheckBox", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 300, 25, 20, 200)
	createWidget(form, "showProcentButton", "CheckBox", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 300, 25, 20, 230)
	createWidget(form, "showShieldButton", "CheckBox", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 300, 25, 20, 260)
	createWidget(form, "woundsShowButton", "CheckBox", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 300, 25, 20, 290)
	createWidget(form, "showManaButton", "CheckBox", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 300, 25, 20, 320)
	createWidget(form, "showDistanceButton", "CheckBox", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 300, 25, 20, 350)
	createWidget(form, "showArrowButton", "CheckBox", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 300, 25, 20, 380)
		
	setLocaleText(createWidget(form, "raidWidthText", "TextView", nil, nil, 200, 25, 20, 440))
	setLocaleText(createWidget(form, "raidHeightText", "TextView", nil, nil, 200, 25, 20, 470))
	setLocaleText(createWidget(form, "distanceText", "TextView", nil, nil, 200, 25, 20, 500))
	setLocaleText(createWidget(form, "buffSizeText", "TextView", nil, nil, 200, 25, 20, 530))
	createWidget(form, "raidWidthEdit", "EditLine", nil, nil, 80, 25, 240, 440, nil, nil)
	createWidget(form, "raidHeightEdit", "EditLine", nil, nil, 80, 25, 240, 470, nil, nil)
	createWidget(form, "distanceEdit", "EditLine", nil, nil, 80, 25, 240, 500, nil, nil)
	createWidget(form, "buffSizeEdit", "EditLine", nil, nil, 80, 25, 240, 530, nil, nil)
	
	setLocaleText(createWidget(form, "raidBuffsButton", "TextView", nil, nil, 200, 25, 410, 50))
	createWidget(form, "autoDebuffModeButton", "CheckBox", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 350, 25, 340, 80)
	createWidget(form, "colorDebuffButton", "CheckBox", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 350, 25, 340, 110)
	createWidget(form, "showImportantButton", "CheckBox", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 350, 25, 340, 140)
	createWidget(form, "checkControlsButton", "CheckBox", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 350, 25, 340, 170)
	createWidget(form, "checkMovementsButton", "CheckBox", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 350, 25, 340, 200)
	setLocaleText(createWidget(form, "raidBuffsList", "TextView", nil, nil, 200, 25, 410, 230))
	createWidget(form, "container", "ScrollableContainer", nil, nil, 360, 280, 340, 250)
	setLocaleText(createWidget(form, "addRaidBuffButton", "Button", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 130, 25, 560, 530))
	createWidget(form, "EditLine1", "EditLine", nil, nil, 210, 25, 340, 530)
	
	
	setLocaleText(createWidget(form, "saveButton", "Button", WIDGET_ALIGN_CENTER, WIDGET_ALIGN_HIGH, 200, 30, nil, 20))
	
	DnD:Init(form, panel, true)
		
	return form
end

function SaveRaidFormSettings(aForm)
	local mySettings = {}
	local profile = GetCurrentProfile()
	mySettings = profile.raidFormSettings
	
	mySettings.classColorModeButton = getCheckBoxState(getChild(aForm, "classColorModeButton"))
	mySettings.showServerNameButton = getCheckBoxState(getChild(aForm, "showServerNameButton"))
	mySettings.showManaButton = getCheckBoxState(getChild(aForm, "showManaButton"))
	mySettings.showShieldButton = getCheckBoxState(getChild(aForm, "showShieldButton"))
	mySettings.showStandartRaidButton = getCheckBoxState(getChild(aForm, "showStandartRaidButton"))
	mySettings.showClassIconButton = getCheckBoxState(getChild(aForm, "showClassIconButton"))
	mySettings.showDistanceButton = getCheckBoxState(getChild(aForm, "showDistanceButton"))
	mySettings.showProcentButton = getCheckBoxState(getChild(aForm, "showProcentButton"))
	mySettings.showArrowButton = getCheckBoxState(getChild(aForm, "showArrowButton"))
	mySettings.gorisontalModeButton = getCheckBoxState(getChild(aForm, "gorisontalModeButton"))
	mySettings.woundsShowButton = getCheckBoxState(getChild(aForm, "woundsShowButton"))
	mySettings.highlightSelectedButton = getCheckBoxState(getChild(aForm, "highlightSelectedButton"))

	
	mySettings.raidWidthText = getTextString(getChild(aForm, "raidWidthEdit"))
	mySettings.raidHeightText = getTextString(getChild(aForm, "raidHeightEdit"))
	mySettings.distanceText = getTextString(getChild(aForm, "distanceEdit"))
	mySettings.buffSize = getTextString(getChild(aForm, "buffSizeEdit"))

	mySettings.raidBuffs.autoDebuffModeButton = getCheckBoxState(getChild(aForm, "autoDebuffModeButton"))
	mySettings.raidBuffs.showImportantButton = getCheckBoxState(getChild(aForm, "showImportantButton"))
	mySettings.raidBuffs.checkControlsButton = getCheckBoxState(getChild(aForm, "checkControlsButton"))
	mySettings.raidBuffs.checkMovementsButton = getCheckBoxState(getChild(aForm, "checkMovementsButton"))
	mySettings.raidBuffs.colorDebuffButton = getCheckBoxState(getChild(aForm, "colorDebuffButton"))

	
	UpdateTableValuesFromContainer(mySettings.raidBuffs.customBuffs, aForm)
	
	return mySettings
end

function LoadRaidFormSettings(aForm)
	local profile = GetCurrentProfile()
	local mySettings = profile.raidFormSettings
	if mySettings.raidBuffs.colorDebuffButton == nil then mySettings.raidBuffs.colorDebuffButton = false end
	
	setLocaleText(getChild(aForm, "classColorModeButton"), mySettings.classColorModeButton, true)
	setLocaleText(getChild(aForm, "showServerNameButton"), mySettings.showServerNameButton, true)
	setLocaleText(getChild(aForm, "showManaButton"), mySettings.showManaButton, true)
	setLocaleText(getChild(aForm, "showShieldButton"), mySettings.showShieldButton, true)
	setLocaleText(getChild(aForm, "showStandartRaidButton"), mySettings.showStandartRaidButton, true)
	setLocaleText(getChild(aForm, "showClassIconButton"), mySettings.showClassIconButton, true)
	setLocaleText(getChild(aForm, "showDistanceButton"), mySettings.showDistanceButton, true)
	setLocaleText(getChild(aForm, "showProcentButton"), mySettings.showProcentButton, true)
	setLocaleText(getChild(aForm, "showArrowButton"), mySettings.showArrowButton, true)
	setLocaleText(getChild(aForm, "gorisontalModeButton"), mySettings.gorisontalModeButton, true)
	setLocaleText(getChild(aForm, "woundsShowButton"), mySettings.woundsShowButton, true)
	setLocaleText(getChild(aForm, "highlightSelectedButton"), mySettings.highlightSelectedButton, true)
	
	setText(getChild(aForm, "raidWidthEdit"), mySettings.raidWidthText)
	setText(getChild(aForm, "raidHeightEdit"), mySettings.raidHeightText)
	setText(getChild(aForm, "distanceEdit"), mySettings.distanceText)
	setText(getChild(aForm, "buffSizeEdit"), mySettings.buffSize)
	
	setLocaleText(getChild(aForm, "autoDebuffModeButton"), mySettings.raidBuffs.autoDebuffModeButton, true)
	setLocaleText(getChild(aForm, "colorDebuffButton"), mySettings.raidBuffs.colorDebuffButton, true)
	setLocaleText(getChild(aForm, "showImportantButton"), mySettings.raidBuffs.showImportantButton, true)
	setLocaleText(getChild(aForm, "checkControlsButton"), mySettings.raidBuffs.checkControlsButton, true)
	setLocaleText(getChild(aForm, "checkMovementsButton"), mySettings.raidBuffs.checkMovementsButton, true)
	
	ShowValuesFromTable(profile.raidFormSettings.raidBuffs.customBuffs, aForm)
end