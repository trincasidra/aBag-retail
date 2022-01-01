local A, L = ...

L.bank = CreateFrame("Frame")
L.bank.isInit = false

function L.bank:SetupBank()
  if L.bank.isInit then
    return
  end
  L.bank.isInit = true

  -- Get rid of blizzard bank frames
  L.U.exileFrame(BankFrame)
  L.U.exileFrame(ContainerFrame6)
  L.U.exileFrame(ContainerFrame7)
  L.U.exileFrame(ContainerFrame8)
  L.U.exileFrame(ContainerFrame9)
  L.U.exileFrame(ContainerFrame10)
  L.U.exileFrame(ContainerFrame11)
  L.U.exileFrame(ContainerFrame12)

  local regions = { BankSlotsFrame:GetRegions() }
  for i, region in ipairs(regions) do
    L.U.exileFrame(region)
  end

  L.bank.items = {}
  for k, v in pairs(L.C.bankItems[1]) do
    table.insert(L.bank.items, v)
  end

  -- Filter out non-existing slots
  for i = 5, 11 do
    if (GetContainerNumSlots(i) > 0) then
      for j = 1 + #L.C.bankItems[i-3] - GetContainerNumSlots(i), #L.C.bankItems[i-3] do
        table.insert(L.bank.items, L.C.bankItems[i-3][j])
      end
    end
  end

  L.bank.rows = ceil((#L.bank.items-1)/L.C.bank.columns)
  L.bank.frame = CreateFrame("Frame", "aBankContainer", UIParent, BackdropTemplateMixin and "BackdropTemplate")
  L.bank.frame:SetParent(UIParent)
  L.bank.frame:SetFrameStrata("MEDIUM")
  L.bank.frame:SetFrameLevel(1)
  L.bank.frame:SetWidth(L.C.bank.columns*L.C.iconSize + L.C.backdrop.insets.left + L.C.backdrop.insets.right + L.C.bank.padding)
  L.bank.frame:SetBackdrop(L.C.backdrop)
  L.bank.frame:SetPoint(unpack(L.C.bank.point))
  L.bank.frame:SetBackdropColor(unpack(L.C.backdrop.bgColor))
  L.bank.frame:SetBackdropBorderColor(unpack(L.C.backdrop.borderColor))
  L.bank.frame:SetHeight(L.bank.rows*L.C.iconSize + L.C.backdrop.insets.top + L.C.backdrop.insets.bottom + L.C.bank.padding)
  L.bank.frame:Show()

  -- Reposition slots
  for k, v in pairs(L.bank.items) do
    local posX, posY = L.U.calcPos(k, L.C.bank)
    L.U.exileFrame(v, {"TOPLEFT", L.bank.frame, "TOPLEFT", 1 + L.C.backdrop.insets.left + L.C.bank.padding + L.C.iconSize*posX, -L.C.backdrop.insets.top - L.C.bank.padding - L.C.iconSize*posY})

    -- Create a nice and sleek backdrop for empty bagslots
    v.backdrop = CreateFrame("Frame", "aBankItemBackdrop"..k, v, BackdropTemplateMixin and "BackdropTemplate")
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
  for k, v in pairs(L.C.bankBorders) do
    L.U.exileFrame(v)
  end

  if L.C.bank.showSlots then
    L.bank.slots = {}

    L.bank.slots.bags = {
      BankSlotsFrame.Bag1,
      BankSlotsFrame.Bag2,
      BankSlotsFrame.Bag3,
      BankSlotsFrame.Bag4,
      BankSlotsFrame.Bag5,
      BankSlotsFrame.Bag6,
      BankSlotsFrame.Bag7,
    }

    _, L.bank.slots.full = GetNumBankSlots()

    local extraSlots = 3
    if L.bank.slots.full then
      extraSlots = 0
    end

    L.bank.slots.frame = CreateFrame("Frame", "aBankSlots", UIParent, BackdropTemplateMixin and "BackdropTemplate")
    L.bank.slots.frame:SetParent(UIParent)
    L.bank.slots.frame:SetFrameStrata("MEDIUM")
    L.bank.slots.frame:SetFrameLevel(1)
    L.bank.slots.frame:SetWidth((7+extraSlots)*L.C.iconSize + L.C.backdrop.insets.left + L.C.backdrop.insets.right + L.C.bank.padding)
    L.bank.slots.frame:SetBackdrop(L.C.backdrop)
    L.bank.slots.frame:SetPoint("TOPLEFT", L.bank.frame, "BOTTOMLEFT")
    L.bank.slots.frame:SetBackdropColor(unpack(L.C.backdrop.bgColor))
    L.bank.slots.frame:SetBackdropBorderColor(unpack(L.C.backdrop.borderColor))
    L.bank.slots.frame:SetHeight(L.C.iconSize + L.C.backdrop.insets.top + L.C.backdrop.insets.bottom + L.C.bank.padding)
    L.bank.slots.frame:Show()

    -- Reposition slots
    for k, v in pairs(L.bank.slots.bags) do
      L.U.exileFrame(v, {"TOPLEFT", L.bank.slots.frame, "TOPLEFT", 1 + L.C.backdrop.insets.left + L.C.bank.padding + L.C.iconSize*(k-1), -L.C.backdrop.insets.top - L.C.bank.padding})

      -- Create a nice and sleek backdrop for empty bagslots
      v.backdrop = CreateFrame("Frame", "aBankSlotBackdrop"..k, v, BackdropTemplateMixin and "BackdropTemplate")
      v.backdrop:SetFrameStrata("MEDIUM")
      v.backdrop:SetFrameLevel(2)
      v.backdrop:SetWidth(L.C.iconSize)
      v.backdrop:SetHeight(L.C.iconSize)
      v.backdrop:SetPoint("TOPLEFT", -L.C.backdrop.insets.left, L.C.backdrop.insets.top)
      v.backdrop:SetBackdrop(L.C.backdrop)
      v.backdrop:SetBackdropColor(unpack(L.C.backdrop.bgColor))
      v.backdrop:SetBackdropBorderColor(unpack(L.C.backdrop.borderColor))
      v.backdrop:Show()

      v.SlotHighlightTexture:SetAlpha(0.5)
    end

    if not L.bank.slots.full then
      L.U.exileFrame(BankFramePurchaseButton, {"RIGHT", L.bank.slots.frame, "RIGHT", -L.C.bank.padding, 0})
    end
  else
    L.U.exileFrame(BankSlotsFrame.Bag1)
    L.U.exileFrame(BankSlotsFrame.Bag2)
    L.U.exileFrame(BankSlotsFrame.Bag3)
    L.U.exileFrame(BankSlotsFrame.Bag4)
    L.U.exileFrame(BankSlotsFrame.Bag5)
    L.U.exileFrame(BankSlotsFrame.Bag6)
    L.U.exileFrame(BankSlotsFrame.Bag7)
  end

  -- Show/hide aBag container
  BankFrame:HookScript("OnShow", function(self)
    L.bank.frame:Show()
    if L.bank.slots.frame then
      L.bank.slots.frame:Show()
    end
    OpenBag(5)
    OpenBag(6)
    OpenBag(7)
    OpenBag(8)
    OpenBag(9)
    OpenBag(10)
    OpenBag(11)
  end)
  BankFrame:HookScript("OnHide", function(self)
    L.bank.frame:Hide()
    if L.bank.slots.frame then
      L.bank.slots.frame:Hide()
    end
  end)

  OpenBag(5)
  OpenBag(6)
  OpenBag(7)
  OpenBag(8)
  OpenBag(9)
  OpenBag(10)
  OpenBag(11)
end

function L.bank.OnEvent(self, e, ...)
	local arg1, arg2 = ...
  if (e == "BANKFRAME_OPENED") then
    self:SetupBank()
  end
end

function L.bank:SetupHooks()
  -- Usually we'd use ADDON_LOADED, but it loads before blizzard bags after the first login.
  self:RegisterEvent("BANKFRAME_OPENED")
  self:SetScript("OnEvent", self.OnEvent)
end
