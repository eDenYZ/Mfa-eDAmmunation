local ESX = nil

TriggerEvent(eDAmmunation.Ammunation.Utils.GetESX, function(obj) ESX = obj end)
 
RegisterNetEvent("</eDen:BuyAmmunation")
AddEventHandler("</eDen:BuyAmmunation", function(Type, TypeMoney, Value, Label, Price)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if (Type == "item") then
        if (xPlayer.getAccount(TypeMoney).money >= Price) then
            if (not (Value ~= nil)) then
                print("eDAmmunation\nJe ne reçois pas l'event de l'item")
                return
            end
            if (not (Price ~= nil)) then
                print("eDAmmunation\nJe ne reçois pas l'event du prix de l'item")
                return
            end
            xPlayer.removeAccountMoney(TypeMoney, Price)
            xPlayer.addInventoryItem(Value, 1)
            xPlayer.showNotification(("~o~eDAmmunation\n~s~Vous venez d'acheter %s."):format(Label))
        else
            xPlayer.showNotification(("~o~eDAmmunation\n~s~Vous n'avez pas assez d'argent il vous manque ~g~%s$."):format(Price-xPlayer.getAccount(TypeMoney).money)) 
        end
    elseif (Type == "arme") then
        if (xPlayer.getAccount(TypeMoney).money >= Price) then
            if (not xPlayer.hasWeapon(Value)) then
                if (not (Value ~= nil)) then
                    print("eDAmmunation\nJe ne reçois pas l'event de l'item")
                    return
                end
                if (not (Price ~= nil)) then
                    print("eDAmmunation\nJe ne reçois pas l'event du prix de l'item")
                    return
                end
                xPlayer.removeAccountMoney(TypeMoney, Price)
                xPlayer.addWeapon(Value, 1)
                xPlayer.showNotification(("~o~eDAmmunation\n~s~Vous venez d'acheter %s."):format(Label))
            else
                xPlayer.showNotification(("~o~eDAmmunation\n~s~Vous avez déja cette arme.")) 
            end 
        else
            xPlayer.showNotification(("~o~eDAmmunation\n~s~Vous n'avez pas assez d'argent il vous manque ~g~%s$."):format(Price-xPlayer.getAccount(TypeMoney).money)) 
        end
    end
end)

