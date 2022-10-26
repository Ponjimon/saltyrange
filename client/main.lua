local ShowVoiceRange = false -- Whether or not the range indicator is shown
local ShowTimer = 3 -- seconds
local HideAt = -1 -- POSIX timestamp

AddEventHandler('SaltyChat_VoiceRangeChanged', function()
    ShowVoiceRange = true
    HideAt = GetCloudTimeAsInt() + 3
    CreateThread(function()
        while ShowVoiceRange do
            local PlayerPed = PlayerPedId()
            local PlayerPos = GetEntityCoords(PlayerPed)
            local VoiceRange = exports['saltychat']:GetVoiceRange()
            local CloudTime = GetCloudTimeAsInt();
            
            DrawMarker(25, PlayerPos.x, PlayerPos.y, PlayerPos.z - 0.95, 0, 0, 0, 0, 0, 0, VoiceRange, VoiceRange, VoiceRange,  0, 255, 0, 100, false, false, 2, false, nil, nil, false)
            
            if CloudTime >= HideAt then
                ShowVoiceRange = false
                HideAt = -1
            end
            
            Wait(0)
        end
    end)
end)