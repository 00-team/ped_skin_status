local user_skin

RegisterNetEvent("set_user_skin")
AddEventHandler("set_user_skin", function(uskin)
    if uskin then
        user_skin = json.decode(uskin)
    else
        user_skin = uskin
    end
end)

function getskin()
    TriggerServerEvent("get_user_skin")
    Citizen.Wait(200)
    if not user_skin then
        getskin()
    end
end


AddEventHandler("solution:PlayerSkinLoaded", function(cb)
    local PPed = PlayerPedId()
    getskin()

    if type(user_skin) == "table" then
        if
        user_skin["hair_color_1"] == GetPedHairColor(PPed) and
        user_skin["eye_color"] == GetPedEyeColor(PPed) and
        user_skin["glasses_1"] == GetPedPropIndex(PPed, 1) and
        user_skin["watches_1"] == GetPedPropIndex(PPed, 6) and
        user_skin["helmet_1"] == GetPedPropIndex(PPed, 0) and
        user_skin["bracelets_1"] == GetPedPropIndex(PPed, 7) and
        user_skin["shoes_1"] == GetPedDrawableVariation(PPed, 6) and
        user_skin["tshirt_1"] == GetPedDrawableVariation(PPed, 8)
        then
            cb(true)
            return
        end
    end

    cb(false)
end)