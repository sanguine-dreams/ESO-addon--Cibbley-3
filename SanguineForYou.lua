SanguineForYou = {}
SanguineForYou.name = "SanguineForYou"

local function updateClock()
    local now = os.time()
    local future = now + (7 * 60 * 60) -- add 7 hours in seconds
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
