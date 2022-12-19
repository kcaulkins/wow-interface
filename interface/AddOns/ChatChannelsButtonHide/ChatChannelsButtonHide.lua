local frame = CreateFrame("FRAME", "212");
frame:RegisterEvent("PLAYER_LOGIN");
local function eventHandler(self, event, ...)
	ChatFrameChannelButton:Hide()
	ChatFrameToggleVoiceDeafenButton:Hide()
	ChatFrameToggleVoiceMuteButton:Hide()
end
frame:SetScript("OnEvent", eventHandler);

local frame = CreateFrame("FRAME", "121");
frame:RegisterEvent("VOICE_CHAT_LOGIN");
local function eventHandler(self, event, ...)
	ChatFrameToggleVoiceDeafenButton:Hide()
	ChatFrameToggleVoiceMuteButton:Hide()
end
frame:SetScript("OnEvent", eventHandler);