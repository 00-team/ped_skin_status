ESX = nil

TriggerEvent("esx:getSharedObject", function(obj)
    ESX = obj
end)



RegisterNetEvent("get_user_skin")
AddEventHandler("get_user_skin", function()
    local source = source
    local player = ESX.GetPlayerFromId(source)

    if not player then
        TriggerClientEvent("set_user_skin", source, nil)
        return
    end

    MySQL.Async.fetchAll("SELECT skin FROM users WHERE identifier = @identifier", {
		["@identifier"] = player.identifier
	}, function(res)
        if #res ~= 0 then
            TriggerClientEvent("set_user_skin", source, res[1].skin)
        else
            TriggerClientEvent("set_user_skin", source, nil)
        end
	end)
end)
