ESX, AmmunationZone = nil, false

Citizen.CreateThread(function()
    while (ESX == nil) do
        TriggerEvent(eDAmmunation.Ammunation.Utils.GetESX, function(obj) ESX = obj end)
        Citizen.Wait(10)
    end
    InitMarkerAmmunation()
end)

InitMarkerAmmunation = function()
    AmmunationZone = true
    Citizen.CreateThread(function()
        for _, v in pairs(eDAmmunation.Ammunation.Position) do
            local blip = AddBlipForCoord(v.pos)
            SetBlipSprite(blip, eDAmmunation.Ammunation.Blips.Model) 
            SetBlipDisplay(blip, 4)
            SetBlipScale (blip, eDAmmunation.Ammunation.Blips.Taille) 
            SetBlipColour(blip, eDAmmunation.Ammunation.Blips.Couleur) 
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName(eDAmmunation.Ammunation.Blips.Nom) 
            EndTextCommandSetBlipName(blip)
        end
        while AmmunationZone do
            local InZone = false
            local playerPos = GetEntityCoords(PlayerPedId())
            for _, v in pairs(eDAmmunation.Ammunation.Position) do
                local dst1 = GetDistanceBetweenCoords(playerPos, v.pos, true)
                    if (dst1 < 4.0) then
                    InZone = true
                    DrawMarker(20, v.pos, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 0, 180, 0, 255, true, true, p19, true) 
                    if (dst1 < 2.0) then
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder au shop ammunation") 
                        if IsControlJustReleased(1, 38) then
                            eDen:Menu()
                            MenuManager.openMenu(main)
                            eDen:CheckLicense()
                        end
                    else
                        MenuManager.closeMenu()
                    end
                end
            end
            if not InZone then
                Wait(500)
            else
            Wait(1)
        end
    end
    end)
    print(("%s ^5Create^7 by ^1eDen"):format(GetCurrentResourceName()))
end


