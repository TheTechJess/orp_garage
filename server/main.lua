ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.StoreOnServerStart then
	MySQL.ready(function ()
		MySQL.Async.execute("UPDATE owned_vehicles SET `stored`=true WHERE `stored`=false", {})
	end)
end

ESX.RegisterServerCallback('orp_garage:getStoredVehicles', function(source, cb, garage_unique_name)
	local _source = source
	local identifier = ESX.GetPlayerFromId(_source).identifier
	local Job = Zones.Garages[garage_unique_name].Job
	local vehicle_type = Zones.Garages[garage_unique_name].type
	if Job == "public" then
		MySQL.query('SELECT vehicle, plate, vehiclename, pound, `stored`, garage_name FROM owned_vehicles WHERE owner = ? and type = ? and stored = ?', {identifier, vehicle_type, 1},
		function(result)
			cb(result)
		end)
	else
		MySQL.query('SELECT vehicle, plate, vehiclename, pound, `stored`, garage_name FROM owned_vehicles WHERE job = ? and type = ? and stored = ? and garage_name = ?', {Job, vehicle_type, 1, garage_unique_name},
		function(result)
			cb(result)
		end)
	end
end)

ESX.RegisterServerCallback('orp_garage:getpropertyvehicles', function(source, cb, vehicle_type)
	local _source = source
	local identifier = ESX.GetPlayerFromId(_source).identifier

	MySQL.query('SELECT vehicle, plate, vehiclename, pound, `stored`, garage_name FROM owned_vehicles WHERE owner = ? and type = ? and stored = ?', {identifier, vehicle_type, 1},
	function(result)
		cb(result)
	end)
end)

ESX.RegisterServerCallback('orp_garage:isVehicleOwned',function(source, cb, plate)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.query('SELECT * FROM owned_vehicles WHERE plate = @plate', { 
        ['@plate'] = plate,
    }, function(results)
        if results[1] then
            cb(results[1])
        else
            cb(false)
        end
    end)
end)

ESX.RegisterServerCallback('orp_garage:getout', function(source, cb, plate)
	local _source = source
	local identifier = ESX.GetPlayerFromId(_source).identifier
	
	MySQL.query("SELECT vehicle, vehiclename, pound, `stored`, garage_name, type FROM owned_vehicles WHERE plate=@plate", {
		['@plate'] = plate
	}, function(result)
		cb(result)
	end)

	
end)

ESX.RegisterServerCallback('orp_garage:getimpoundVehicles', function(source, cb)
	local _source = source
	local identifier = ESX.GetPlayerFromId(_source).identifier
	MySQL.query("SELECT vehicle, vehiclename, pound, releasedate, fee, description FROM owned_vehicles WHERE owner = @identifier and pound=@pound", {
		['@identifier'] = identifier,
		['@pound'] = 1
	}, function(result)
		cb(result)
	end)
end)

--Stock les véhicules
ESX.RegisterServerCallback('orp_garage:stockv',function(source,cb, vehicleProps, garage_unique_name)
	local _source = source
	local identifier = ESX.GetPlayerFromId(_source).identifier
	local vehplate = vehicleProps.plate
	local vehiclemodel = vehicleProps.model
	local Job = 'property'
	local vehicle_type = 'car'
	if Zones.Garages[garage_unique_name] ~= nil then
		Job = Zones.Garages[garage_unique_name].Job
		vehicle_type = Zones.Garages[garage_unique_name].type
	end
	if Job == "public" then
		MySQL.scalar("SELECT vehicle FROM owned_vehicles where plate=@plate and owner=@identifier and type = @vehicle_type",{['@plate'] = vehplate, ['@identifier'] = identifier, ['@vehicle_type'] = vehicle_type}, function(result)
			if result then
				local vehprop = json.encode(vehicleProps)
				local originalvehprops = json.decode(result)
				if originalvehprops.model == vehiclemodel then
					MySQL.update("UPDATE owned_vehicles SET vehicle =@vehprop WHERE plate=@plate",{
						['@vehprop'] = vehprop,
						['@plate'] = vehplate
					}, function(rowsChanged)
						cb(true)
					end)
				else
					TriggerEvent('nb_menuperso:bancheaterplayer', _source)
					print("[orp_garage] player "..identifier..' tried to spawn a vehicle with hash:'..vehiclemodel..". his original vehicle: "..originalvehprops.model)
					cb(false)
				end
			else
				cb(false)
			end
		end)
	elseif  Job == "property" then
		MySQL.scalar("SELECT vehicle FROM owned_vehicles where plate=@plate and owner=@identifier and type = @vehicle_type",{['@plate'] = vehplate, ['@identifier'] = identifier, ['@vehicle_type'] = vehicle_type}, function(result)
			if result ~= nil then
				local vehprop = json.encode(vehicleProps)
				local originalvehprops = json.decode(result)
				if originalvehprops.model == vehiclemodel then
					MySQL.Async.execute("UPDATE owned_vehicles SET vehicle =@vehprop WHERE plate=@plate",{
						['@vehprop'] = vehprop,
						['@plate'] = vehplate
					}, function(rowsChanged)
						cb(true)
					end)
				else
					TriggerEvent('nb_menuperso:bancheaterplayer', _source)
					print("[orp_garage] player "..identifier..' tried to spawn a vehicle with hash:'..vehiclemodel..". his original vehicle: "..originalvehprops.model)
					cb(false)
				end
			else
				cb(false)
			end
		end)
	else
		MySQL.query("SELECT vehicle FROM owned_vehicles where plate=@plate and job=@job and type = @vehicle_type",{['@plate'] = vehplate, ['@job'] = Job, ['@vehicle_type'] = vehicle_type}, function(result)
			if result[1] ~= nil then
				local vehprop = json.encode(vehicleProps)
				local originalvehprops = json.decode(result[1].vehicle)
				if originalvehprops.model == vehiclemodel then
					MySQL.update("UPDATE owned_vehicles SET vehicle =@vehprop WHERE plate=@plate",{
						['@vehprop'] = vehprop,
						['@plate'] = vehplate
					}, function(rowsChanged)
						cb(true)
					end)
				else
					TriggerEvent('nb_menuperso:bancheaterplayer', _source)
					print("[orp_garage] player "..identifier..' tried to spawn a vehicle with hash:'..vehiclemodel..". his original vehicle: "..originalvehprops.model)
					cb(false)
				end
			else
				cb(false)
			end
		end)
	end
end)


RegisterServerEvent('orp_garage:modifystate')
AddEventHandler('orp_garage:modifystate', function(plate, stored)
	MySQL.update("UPDATE owned_vehicles SET `stored` =@stored WHERE plate=@plate",{
		['@stored'] = stored,
		['@plate'] = plate
	})
end)	

RegisterServerEvent('orp_garage:impoundvehicle')
AddEventHandler('orp_garage:impoundvehicle', function(data)
	MySQL.update("UPDATE owned_vehicles SET pound =@pound, releasedate =@releasedate, fee =@fee, description =@description WHERE plate=@plate",{
		['@pound'] = 1,
		['@releasedate'] = data.releasedate,
		['@fee'] = data.fee,
		['@description'] = data.description,
		['@plate'] = data.plate
	})
end)

RegisterServerEvent('orp_garage:removeimpound')
AddEventHandler('orp_garage:removeimpound', function(plate, fee)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeMoney(fee)
	MySQL.update("UPDATE owned_vehicles SET pound =@pound, releasedate =NULL, fee =NULL, description =NULL WHERE plate=@plate",{
		['@pound'] = 0,
		['@plate'] = plate
	})
end)


RegisterServerEvent('orp_garage:renamevehicle')
AddEventHandler('orp_garage:renamevehicle', function(vehicleplate, name)
	MySQL.update("UPDATE owned_vehicles SET vehiclename =@vehiclename WHERE plate=@plate",{['@vehiclename'] = name , ['@plate'] = vehicleplate})
end)

RegisterServerEvent('orp_garage:MoveGarage')
AddEventHandler('orp_garage:MoveGarage', function(vehicleplate, garage_name)
	MySQL.update("UPDATE owned_vehicles SET garage_name =@garage_name WHERE plate=@plate",{['@garage_name'] = garage_name , ['@plate'] = vehicleplate})
end)


RegisterServerEvent('orp_garage:removemoney')
AddEventHandler('orp_garage:removemoney', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeMoney(Config.SwitchGaragePrice)
end)
