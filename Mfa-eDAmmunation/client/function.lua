function eDen:CheckLicense()
    ESX.TriggerServerCallback("esx_license:checkLicense", function(licenseweapon)
        weaponlicense = licenseweapon
    end, GetPlayerServerId(PlayerId()), "weapon")
end