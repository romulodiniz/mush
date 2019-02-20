--class to control name subs in Avatar
--author: Xing

disabledStabName = false;

function SubName(pref, name)
	ColourNote ("dodgerblue", "black", pref .. name)
end

function SubNameAggie(pref, name)
	ColourNote ("red", "black", pref .. name)
	
	if disabledStabName == false then
		if isKillingWalking == true then --quem define é o scan feito nas classes stabbers	
			Execute(stabAction .. " " .. name)	
		elseif canStab == true then --quem define é a classe, pode ser desabilitado pelo offstab
			Execute(stabAction .. " " .. name)
			if isMday() then
				Execute(stabAction .. " 2." .. name)
			end
		end
	end
end

function SubNameLord(pref, name)
	--Note("canStab: " ..  safeStringValue(getCanStab()))
	
	ColourNote ("red", "black", pref .. name)
	
	if disabledStabName == false then
		if canSlip == true then --quem define é o player manualmente, pode ser desabilitado pelo offslip				
			autoSlip(name)
		elseif isKillingWalking == true then --quem define é o scan feito nas classes stabbers	
			Execute(stabAction .. " " .. name)	
		elseif canStab == true then --quem define é a classe, pode ser desabilitado pelo offstab
			Execute(stabAction .. " " .. name)
			if isMday() then
				Execute(stabAction .. " 2." .. name)
			end
		end
	end

end

function SubNameAlleg(name, moreInfo)
	if moreInfo == nil then
		ColourNote ("orange", "black", "Allegaagse says '" .. name .. "'")
	else
		ColourNote ("orange", "black", "Allegaagse says '" .. name .. " (" .. moreInfo .. ")'")
	end

	SetClipboard(name)
end

function setDisabledStabName(value)
	disabledStabName = value
end

