SanguineForYou = {}
SanguineForYou.name = "SanguineForYou"

local function updateClock()
    local future = os.time() + (7 * 60 * 60)
    local time = os.date("%H:%M", future)
    SanguineForYouLabel:SetText("Sanguine from " .. time .. " loves you <3.")
    zo_callLater(function() updateClock() end, 1000)
end

function SanguineForYou.OnAddOnLoaded()
    updateClock()
end

local function HideLove()
    SanguineForYouLabel:SetHidden(true)
end

local function ShowLove()
    SanguineForYouLabel:SetHidden(false)
end

SLASH_COMMANDS["/hidelove"] = HideLove
SLASH_COMMANDS["/showlove"] = ShowLove

EVENT_MANAGER:RegisterForEvent(SanguineForYou.name, EVENT_ADD_ON_LOADED, SanguineForYou.OnAddOnLoaded)
