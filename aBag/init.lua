local A, L = ...

L.bag:SetupHooks()

if L.C.bank and L.C.bank.enabled then
	L.bank:SetupHooks()
end

if L.C.reagents and L.C.reagents.enabled then
	L.reagents:SetupHooks()
end

SlashCmdList["abag"] = function(cmd)
	if (cmd:match"unlock") then
		L.U.UnlockDrag("|cff1a9fc0aBag|r frames unlocked")
	elseif (cmd:match"lock") then
		L.U.LockDrag("|cff1a9fc0aBag|r frames locked")
	elseif (cmd:match"reset") then
		L.U.ResetDrag("|cff1a9fc0aBag|r frames reset")
	else
		print("|cff1a9fc0aBag command list:|r")
		print("|cff1a9fc0\/abag lock|r, to lock all frames")
		print("|cff1a9fc0\/abag unlock|r, to unlock all frames")
		print("|cff1a9fc0\/abag reset|r, to reset all frames")
	end
end

_G["SLASH_abag1"] = "/abag"
print("|cff1a9fc0aBag loaded.|r")
print("|cff1a9fc0abag|r to display the command list")
