main, subAmmunation, subPayment, eDen = "menu_main", "menu_subammunation", "menu_payment", {}

MenuManager.createMenu(main,"Ammunation","Shop Ammunation")
MenuManager.createMenu(subAmmunation,"Categorie","Shop Ammunation", main)
MenuManager.createMenu(subPayment,"Payment","Shop Ammunation", subAmmunation)

function eDen:Menu()
    MenuManager.clearMenuItem(main, 0)
    for k, v in pairs(eDAmmunation.Ammunation.Categorie) do
        MenuManager.button(main, ("%s"):format(v.Label),"","","","fas fa-arrow-alt-circle-right",function (data)
            if data.action == 'onPressed' then
                categorieselected = v
                eDen:Categorie()
                MenuManager.openMenu(subAmmunation)
                eDen:CheckLicense()
            end
        end)
    end    
end

function eDen:Categorie()
    MenuManager.clearMenuItem(subAmmunation, 0)
    MenuManager.separator(subAmmunation, ("Categorie : ~o~%s"):format(categorieselected.Label), '', false)
    for k, v in pairs(eDAmmunation.Ammunation.Item[categorieselected.Value]) do
        if v.License == true then
            if weaponlicense then
                MenuManager.button(subAmmunation, ("%s"):format(v.Label),"","",("~g~%s$"):format(v.Price),"",function (data)
                    if data.action == 'onPressed' then
                        payment = v
                        eDen:Payment()
                        MenuManager.openMenu(subPayment)
                    end
                end)
            else
                MenuManager.button(subAmmunation, ("%s"):format(v.Label), "","eDAmmunation Vous ne possédez pas de PPA !","","fas fa-exclamation-triangle",function (data)end)
            end
        else
            MenuManager.button(subAmmunation, ("%s"):format(v.Label),"","",("~g~%s$"):format(v.Price),"",function (data)
                if data.action == 'onPressed' then
                    payment = v
                    eDen:Payment()
                    MenuManager.openMenu(subPayment)
                end
            end)
        end
    end
end

function eDen:Payment()
    MenuManager.clearMenuItem(subPayment, 0)
    if (not (payment ~= nil)) then
        MenuManager.openMenu(subAmmunation)
        return
    end
    if payment.Type == "arme" then
        MenuManager.separator(subPayment, ("Arme : ~o~%s"):format(payment.Label), '', false) 
    else
        MenuManager.separator(subPayment, ("Objet : ~o~%s"):format(payment.Label), '', false) 
    end
    MenuManager.separator(subPayment, ("Prix : ~g~%s$"):format(payment.Price), '', false) 
    MenuManager.button(subPayment, "Liquide","","", "","",function (data)
        if data.action == 'onPressed' then
            TriggerServerEvent("</eDen:BuyAmmunation", payment.Type, "money", payment.Value, payment.Label, payment.Price)
        end
    end)
    MenuManager.button(subPayment, "Banque","","", "","",function (data)
        if data.action == 'onPressed' then
            TriggerServerEvent("</eDen:BuyAmmunation", payment.Type, "bank", payment.Value, payment.Label, payment.Price)
        end
    end)
end
