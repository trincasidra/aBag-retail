local A, L = ...

L.reagents = CreateFrame("Frame")
L.reagents.isInit = false
L.reagents.tabsInit = false

function L.reagents:SetupReagents()
  if L.reagents.isInit then
    return
  end
  L.reagents.isInit = true

  if IsReagentBankUnlocked() then
    L.reagents.rows = ceil(97/L.C.reagents.columns)
    L.reagents.frame = CreateFrame("Frame", "aReagentsContainer", UIParent, BackdropTemplateMixin and "BackdropTemplate")
    L.reagents.frame:SetParent(UIParent)
    L.reagents.frame:SetFrameStrata("MEDIUM")
    L.reagents.frame:SetFrameLevel(1)
    L.reagents.frame:SetWidth(L.C.reagents.columns*L.C.iconSize + L.C.backdrop.insets.left + L.C.backdrop.insets.right + L.C.reagents.padding)
    L.reagents.frame:SetBackdrop(L.C.backdrop)
    L.reagents.frame:SetPoint("BOTTOMRIGHT", L.bank.frame, "BOTTOMRIGHT")
    L.reagents.frame:SetBackdropColor(unpack(L.C.backdrop.bgColor))
    L.reagents.frame:SetBackdropBorderColor(unpack(L.C.backdrop.borderColor))
    L.reagents.frame:SetHeight(L.reagents.rows*L.C.iconSize + L.C.backdrop.insets.top + L.C.backdrop.insets.bottom + L.C.reagents.padding)
    L.reagents.frame:Hide()

    -- Somehow this need to be declared after the reagents' bank is opened
    local reagentItems = {
      ReagentBankFrameItem1,
      ReagentBankFrameItem2,
      ReagentBankFrameItem3,
      ReagentBankFrameItem4,
      ReagentBankFrameItem5,
      ReagentBankFrameItem6,
      ReagentBankFrameItem7,
      ReagentBankFrameItem8,
      ReagentBankFrameItem9,
      ReagentBankFrameItem10,
      ReagentBankFrameItem11,
      ReagentBankFrameItem12,
      ReagentBankFrameItem13,
      ReagentBankFrameItem14,
      ReagentBankFrameItem15,
      ReagentBankFrameItem16,
      ReagentBankFrameItem17,
      ReagentBankFrameItem18,
      ReagentBankFrameItem19,
      ReagentBankFrameItem20,
      ReagentBankFrameItem21,
      ReagentBankFrameItem22,
      ReagentBankFrameItem23,
      ReagentBankFrameItem24,
      ReagentBankFrameItem25,
      ReagentBankFrameItem26,
      ReagentBankFrameItem27,
      ReagentBankFrameItem28,
      ReagentBankFrameItem29,
      ReagentBankFrameItem30,
      ReagentBankFrameItem31,
      ReagentBankFrameItem32,
      ReagentBankFrameItem33,
      ReagentBankFrameItem34,
      ReagentBankFrameItem35,
      ReagentBankFrameItem36,
      ReagentBankFrameItem37,
      ReagentBankFrameItem38,
      ReagentBankFrameItem39,
      ReagentBankFrameItem40,
      ReagentBankFrameItem41,
      ReagentBankFrameItem42,
      ReagentBankFrameItem43,
      ReagentBankFrameItem44,
      ReagentBankFrameItem45,
      ReagentBankFrameItem46,
      ReagentBankFrameItem47,
      ReagentBankFrameItem48,
      ReagentBankFrameItem49,
      ReagentBankFrameItem50,
      ReagentBankFrameItem51,
      ReagentBankFrameItem52,
      ReagentBankFrameItem53,
      ReagentBankFrameItem54,
      ReagentBankFrameItem55,
      ReagentBankFrameItem56,
      ReagentBankFrameItem57,
      ReagentBankFrameItem58,
      ReagentBankFrameItem59,
      ReagentBankFrameItem60,
      ReagentBankFrameItem61,
      ReagentBankFrameItem62,
      ReagentBankFrameItem63,
      ReagentBankFrameItem64,
      ReagentBankFrameItem65,
      ReagentBankFrameItem66,
      ReagentBankFrameItem67,
      ReagentBankFrameItem68,
      ReagentBankFrameItem69,
      ReagentBankFrameItem70,
      ReagentBankFrameItem71,
      ReagentBankFrameItem72,
      ReagentBankFrameItem73,
      ReagentBankFrameItem74,
      ReagentBankFrameItem75,
      ReagentBankFrameItem76,
      ReagentBankFrameItem77,
      ReagentBankFrameItem78,
      ReagentBankFrameItem79,
      ReagentBankFrameItem80,
      ReagentBankFrameItem81,
      ReagentBankFrameItem82,
      ReagentBankFrameItem83,
      ReagentBankFrameItem84,
      ReagentBankFrameItem85,
      ReagentBankFrameItem86,
      ReagentBankFrameItem87,
      ReagentBankFrameItem88,
      ReagentBankFrameItem89,
      ReagentBankFrameItem90,
      ReagentBankFrameItem91,
      ReagentBankFrameItem92,
      ReagentBankFrameItem93,
      ReagentBankFrameItem94,
      ReagentBankFrameItem95,
      ReagentBankFrameItem96,
      ReagentBankFrameItem97,
      ReagentBankFrameItem98,
    }

    local reagentBorders = {
      ReagentBankFrameItem1NormalTexture,
      ReagentBankFrameItem2NormalTexture,
      ReagentBankFrameItem3NormalTexture,
      ReagentBankFrameItem4NormalTexture,
      ReagentBankFrameItem5NormalTexture,
      ReagentBankFrameItem6NormalTexture,
      ReagentBankFrameItem7NormalTexture,
      ReagentBankFrameItem8NormalTexture,
      ReagentBankFrameItem9NormalTexture,
      ReagentBankFrameItem10NormalTexture,
      ReagentBankFrameItem11NormalTexture,
      ReagentBankFrameItem12NormalTexture,
      ReagentBankFrameItem13NormalTexture,
      ReagentBankFrameItem14NormalTexture,
      ReagentBankFrameItem15NormalTexture,
      ReagentBankFrameItem16NormalTexture,
      ReagentBankFrameItem17NormalTexture,
      ReagentBankFrameItem18NormalTexture,
      ReagentBankFrameItem19NormalTexture,
      ReagentBankFrameItem20NormalTexture,
      ReagentBankFrameItem21NormalTexture,
      ReagentBankFrameItem22NormalTexture,
      ReagentBankFrameItem23NormalTexture,
      ReagentBankFrameItem24NormalTexture,
      ReagentBankFrameItem25NormalTexture,
      ReagentBankFrameItem26NormalTexture,
      ReagentBankFrameItem27NormalTexture,
      ReagentBankFrameItem28NormalTexture,
      ReagentBankFrameItem29NormalTexture,
      ReagentBankFrameItem30NormalTexture,
      ReagentBankFrameItem31NormalTexture,
      ReagentBankFrameItem32NormalTexture,
      ReagentBankFrameItem33NormalTexture,
      ReagentBankFrameItem34NormalTexture,
      ReagentBankFrameItem35NormalTexture,
      ReagentBankFrameItem36NormalTexture,
      ReagentBankFrameItem37NormalTexture,
      ReagentBankFrameItem38NormalTexture,
      ReagentBankFrameItem39NormalTexture,
      ReagentBankFrameItem40NormalTexture,
      ReagentBankFrameItem41NormalTexture,
      ReagentBankFrameItem42NormalTexture,
      ReagentBankFrameItem43NormalTexture,
      ReagentBankFrameItem44NormalTexture,
      ReagentBankFrameItem45NormalTexture,
      ReagentBankFrameItem46NormalTexture,
      ReagentBankFrameItem47NormalTexture,
      ReagentBankFrameItem48NormalTexture,
      ReagentBankFrameItem49NormalTexture,
      ReagentBankFrameItem50NormalTexture,
      ReagentBankFrameItem51NormalTexture,
      ReagentBankFrameItem52NormalTexture,
      ReagentBankFrameItem53NormalTexture,
      ReagentBankFrameItem54NormalTexture,
      ReagentBankFrameItem55NormalTexture,
      ReagentBankFrameItem56NormalTexture,
      ReagentBankFrameItem57NormalTexture,
      ReagentBankFrameItem58NormalTexture,
      ReagentBankFrameItem59NormalTexture,
      ReagentBankFrameItem60NormalTexture,
      ReagentBankFrameItem61NormalTexture,
      ReagentBankFrameItem62NormalTexture,
      ReagentBankFrameItem63NormalTexture,
      ReagentBankFrameItem64NormalTexture,
      ReagentBankFrameItem65NormalTexture,
      ReagentBankFrameItem66NormalTexture,
      ReagentBankFrameItem67NormalTexture,
      ReagentBankFrameItem68NormalTexture,
      ReagentBankFrameItem69NormalTexture,
      ReagentBankFrameItem70NormalTexture,
      ReagentBankFrameItem71NormalTexture,
      ReagentBankFrameItem72NormalTexture,
      ReagentBankFrameItem73NormalTexture,
      ReagentBankFrameItem74NormalTexture,
      ReagentBankFrameItem75NormalTexture,
      ReagentBankFrameItem76NormalTexture,
      ReagentBankFrameItem77NormalTexture,
      ReagentBankFrameItem78NormalTexture,
      ReagentBankFrameItem79NormalTexture,
      ReagentBankFrameItem80NormalTexture,
      ReagentBankFrameItem81NormalTexture,
      ReagentBankFrameItem82NormalTexture,
      ReagentBankFrameItem83NormalTexture,
      ReagentBankFrameItem84NormalTexture,
      ReagentBankFrameItem85NormalTexture,
      ReagentBankFrameItem86NormalTexture,
      ReagentBankFrameItem87NormalTexture,
      ReagentBankFrameItem88NormalTexture,
      ReagentBankFrameItem89NormalTexture,
      ReagentBankFrameItem90NormalTexture,
      ReagentBankFrameItem91NormalTexture,
      ReagentBankFrameItem92NormalTexture,
      ReagentBankFrameItem93NormalTexture,
      ReagentBankFrameItem94NormalTexture,
      ReagentBankFrameItem95NormalTexture,
      ReagentBankFrameItem96NormalTexture,
      ReagentBankFrameItem97NormalTexture,
      ReagentBankFrameItem98NormalTexture,
    }

    -- Reposition slots
    for k, v in pairs(reagentItems) do
      local posX, posY = L.U.calcPos(k, L.C.reagents)
      L.U.exileFrame(v, {"TOPLEFT", L.reagents.frame, "TOPLEFT", 1 + L.C.backdrop.insets.left + L.C.reagents.padding + L.C.iconSize*posX, -L.C.backdrop.insets.top - L.C.reagents.padding - L.C.iconSize*posY})

      -- Create a nice and sleek backdrop for empty bagslots
      v.backdrop = CreateFrame("Frame", "aReagentsItemBackdrop"..k, v, BackdropTemplateMixin and "BackdropTemplate")
      v.backdrop:SetFrameStrata("MEDIUM")
      v.backdrop:SetFrameLevel(2)
      v.backdrop:SetWidth(L.C.iconSize)
      v.backdrop:SetHeight(L.C.iconSize)
      v.backdrop:SetPoint("TOPLEFT", -L.C.backdrop.insets.left, L.C.backdrop.insets.top)
      v.backdrop:SetBackdrop(L.C.backdrop)
      v.backdrop:SetBackdropColor(unpack(L.C.backdrop.bgColor))
      v.backdrop:SetBackdropBorderColor(unpack(L.C.backdrop.borderColor))
      v.backdrop:Show()
    end

    -- Remove blizzard's border for empty bagslots
    for k, v in pairs(reagentBorders) do
      L.U.exileFrame(v)
    end
  else
    L.reagents.frame = CreateFrame("Frame", "aReagentsContainer", UIParent, BackdropTemplateMixin and "BackdropTemplate")
    L.reagents.frame:SetParent(UIParent)
    L.reagents.frame:SetFrameStrata("MEDIUM")
    L.reagents.frame:SetFrameLevel(1)
    L.reagents.frame:SetWidth(14*L.C.iconSize + L.C.backdrop.insets.left + L.C.backdrop.insets.right + L.C.reagents.padding)
    L.reagents.frame:SetBackdrop(L.C.backdrop)
    L.reagents.frame:SetPoint("BOTTOMRIGHT", L.bank.frame, "BOTTOMRIGHT")
    L.reagents.frame:SetBackdropColor(unpack(L.C.backdrop.bgColor))
    L.reagents.frame:SetBackdropBorderColor(unpack(L.C.backdrop.borderColor))
    L.reagents.frame:SetHeight(8*L.C.iconSize + L.C.backdrop.insets.top + L.C.backdrop.insets.bottom + L.C.reagents.padding)
    L.reagents.frame:Hide()

    L.U.exileFrame(ReagentBankFrameUnlockInfoPurchaseButton, {"CENTER", L.reagents.frame, "CENTER"})
  end

  -- Get rid of blizzard reagent frames
  L.U.exileFrame(ReagentBankFrame)
end

function L.reagents:SetupTabs()
  if L.reagents.tabsInit then
    return
  end
  L.reagents.tabsInit = true

  -- Reskin and reposition bank tabs
  L.U.exileFrame(BankFrameTab2, {"TOPRIGHT", L.bank.frame, "BOTTOMRIGHT"})
  L.U.exileFrame(BankFrameTab2HighlightTexture)
  L.U.exileFrame(BankFrameTab2Left)
  L.U.exileFrame(BankFrameTab2LeftDisabled)
  L.U.exileFrame(BankFrameTab2Middle)
  L.U.exileFrame(BankFrameTab2MiddleDisabled)
  L.U.exileFrame(BankFrameTab2Right)
  L.U.exileFrame(BankFrameTab2RightDisabled)
  L.reagents.banktab = CreateFrame("Frame", "aBankTab", UIParent, BackdropTemplateMixin and "BackdropTemplate")
  L.reagents.banktab:SetParent(BankFrameTab2)
  L.reagents.banktab:SetFrameStrata("MEDIUM")
  L.reagents.banktab:SetFrameLevel(1)
  L.reagents.banktab:SetBackdrop(L.C.backdrop)
  L.reagents.banktab:SetAllPoints(BankFrameTab2)
  L.reagents.banktab:SetBackdropColor(unpack(L.C.backdrop.bgColor))
  L.reagents.banktab:SetBackdropBorderColor(unpack(L.C.backdrop.borderColor))
  L.reagents.banktab:Show()

  L.U.exileFrame(BankFrameTab1, {"RIGHT", BankFrameTab2, "LEFT"})
  L.U.exileFrame(BankFrameTab1HighlightTexture)
  L.U.exileFrame(BankFrameTab1Left)
  L.U.exileFrame(BankFrameTab1LeftDisabled)
  L.U.exileFrame(BankFrameTab1Middle)
  L.U.exileFrame(BankFrameTab1MiddleDisabled)
  L.U.exileFrame(BankFrameTab1Right)
  L.U.exileFrame(BankFrameTab1RightDisabled)
  L.reagents.banktab = CreateFrame("Frame", "aReagentsTab", UIParent, BackdropTemplateMixin and "BackdropTemplate")
  L.reagents.banktab:SetParent(BankFrameTab1)
  L.reagents.banktab:SetFrameStrata("MEDIUM")
  L.reagents.banktab:SetFrameLevel(1)
  L.reagents.banktab:SetBackdrop(L.C.backdrop)
  L.reagents.banktab:SetAllPoints(BankFrameTab1)
  L.reagents.banktab:SetBackdropColor(unpack(L.C.backdrop.bgColor))
  L.reagents.banktab:SetBackdropBorderColor(unpack(L.C.backdrop.borderColor))
  L.reagents.banktab:Show()

  -- Show/hide aReagents container
  ReagentBankFrame:HookScript("OnShow", function(self)
    L.reagents:SetupReagents()
    L.bank.frame:Hide()
    L.bank.slots.frame:Hide()
    L.reagents.frame:Show()
    CloseBag(5)
    CloseBag(6)
    CloseBag(7)
    CloseBag(8)
    CloseBag(9)
    CloseBag(10)
    CloseBag(11)
  end)
  ReagentBankFrame:HookScript("OnHide", function(self)
    L.reagents.frame:Hide()
    L.bank.frame:Show()
    L.bank.slots.frame:Show()
    OpenBag(5)
    OpenBag(6)
    OpenBag(7)
    OpenBag(8)
    OpenBag(9)
    OpenBag(10)
    OpenBag(11)
  end)
end

function L.reagents.OnEvent(self, e, ...)
	local arg1, arg2 = ...
  if (e == "BANKFRAME_OPENED") then
    self:SetupTabs()
  end
end

function L.reagents:SetupHooks()
  -- Usually we'd use ADDON_LOADED, but it loads before blizzard bags after the first login.
  self:RegisterEvent("BANKFRAME_OPENED")
  self:SetScript("OnEvent", self.OnEvent)
end
