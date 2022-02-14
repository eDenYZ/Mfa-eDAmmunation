eDAmmunation = {
    Ammunation = {
        Utils = {
            GetESX = "esx:getSharedObject",
        },
        Categorie = {
           {Label = "Armes Blanches", Value = "ArmeBlanche"},
           {Label = "Armes Létales", Value = "ArmeLetales"},
        },
        Item = {
            ["ArmeBlanche"] = {
                {Type = "arme", Label = "Bat de Baseball", Value = "weapon_bat", Price = 1000, License = true},
                {Type = "arme", Label = "Couteau", Value = "weapon_knife", Price = 200, License = false},
                {Type = "arme", Label = "Club de Golf", Value = "weapon_golfclub", Price = 300, License = false},
                {Type = "arme", Label = "Marteau", Value = "weapon_hammer", Price = 2500, License = true},
            },
            ["ArmeLetales"] = {
                {Type = "arme", Label = "Pétoire", Value = "weapon_snspistol", Price = 2000, License = true},
                {Type = "arme", Label = "Pistolet 9mm", Value = "weapon_pistol", Price = 3000, License = true},
                {Type = "arme", Label = "Calibre 50", Value = "weapon_pistol50", Price = 5000, License = true},
            }
        },
        Blips = {
            Model = 110,
            Taille = 0.5,
            Couleur = 3,
            Nom = "Ammunation",
        },
        Position = {
            {pos = vector3(-662.1, -935.3, 21.82)},
            {pos = vector3(-3171.70, 1087.66, 19.83)},
            {pos = vector3(2567.6, 294.3, 108.7)},
            {pos = vector3(22.0, -1107.2, 29.8)},
            {pos = vector3(252.3, -50.0, 69.9)},
            {pos = vector3(-330.2, 6083.8, 31.4)},
            {pos = vector3(1693.4, 3759.5, 34.7)},
        }
    }
}