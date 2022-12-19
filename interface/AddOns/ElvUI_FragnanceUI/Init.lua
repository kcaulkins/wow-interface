local E, L, V, P, G = unpack(ElvUI)
local EP = LibStub('LibElvUIPlugin-1.0')
local addon, Engine = ...

local _G = _G

local FUI = E:NewModule(addon, 'AceHook-3.0', 'AceEvent-3.0', 'AceTimer-3.0');

Engine[1] = FUI
Engine[2] = E
Engine[3] = L
Engine[4] = V
Engine[5] = P
Engine[6] = G
_G[addon] = Engine;

FUI.Version = GetAddOnMetadata(addon, 'Version')
FUI.Config = {}
FUI.Name = '|cff1c86eeFragnanceUI|r'

function FUI:Initialize()
	if E.private.install_complete and E.private.FUI.install_version == nil then
		E:GetModule('PluginInstaller'):Queue(FUI.InstallerData)
	end

	EP:RegisterPlugin(addon, FUI.Configtable)
end

local function CallbackInitialize()
	FUI:Initialize()
end

E:RegisterModule(addon, CallbackInitialize)
