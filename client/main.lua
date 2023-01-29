-- Local
ESX = nil
local exitmarker = nil
local ready = false
local zones = {}
local jobimpoundzone = {}
local impoundcombo
local combo
local lastzone = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	PlayerJob = ESX.GetPlayerData().job
	InitZones()

	RegisterNetEvent('esx:setJob')
	AddEventHandler('esx:setJob', function(job)
		PlayerJob = job
	end)
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerJob = ESX.GetPlayerData().job
end)


function InitZones()
	for k,v in pairs (Zones.JobImpound) do
		jobimpoundzone[#jobimpoundzone + 1] = PolyZone:Create(
			v.Zone.Shape,
			{
				name = k,
				minZ = v.Zone.minZ,
				maxZ = v.Zone.maxZ,
				debugPoly = false,
				gridDivisions=25,
			}
		)
	end
	for k,v in pairs (Zones.Garages) do
		zones[#zones + 1] = PolyZone:Create(
			v.Zone.Shape,
			{
				name = k,
				minZ = v.Zone.minZ,
				maxZ = v.Zone.maxZ,
				debugPoly = false,
				gridDivisions=25,
				data={
					type = v.type,
					job = v.Job
				}
			}
		)
	end
	combo = ComboZone:Create(zones, {name = "garagezone", debugPoly = false})
		combo:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point, zone)
			if isPointInside then
				if zone.data.type == 'boat' then
					TriggerEvent('unclePezSpecial:canFuelHere', 'boat') 
				elseif zone.data.type == 'aircraft' then
					TriggerEvent('unclePezSpecial:canFuelHere', 'air') 
				end
				if zone.data.job == 'public' or zone.data.job == 'impound' then
					TriggerEvent('orp_garage:InTheZone', true, zone)
				elseif zone.data.job == PlayerJob.name then
					TriggerEvent('orp_garage:InTheZone', true, zone)
				end
			else
					TriggerEvent('unclePezSpecial:canFuelHere', nil)
			end
		end)
	impoundcombo = ComboZone:Create(jobimpoundzone, {name = "impoundcombo", debugPoly = false})
		impoundcombo:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point, zone)
		if isPointInside then
			if PlayerJob.name == 'police' or PlayerJob.name == 'lscustom' then
				TriggerEvent('orp_garage:InImpoundZone', true, zone)
			end
		end
	end)
end

AddEventHandler('orp_garage:InTheZone', function(inzone, zone)
	if zone.data.job == nil then
		return
	end
	lib.showTextUI('[E] - Use ' ..zone.data.job.. ' garage', {
		position = "left-center",
		icon = 'square-parking',
		style = {
			borderRadius = 0,
			backgroundColor = '#29339B',
			color = 'white'
		}
	})
		lastzone = zone
		while inzone do 
			Citizen.Wait(0)
				if IsControlJustPressed(0, 38) then
					if not IsPedInAnyVehicle(PlayerPedId()) then
						lib.hideTextUI()
						if zone.data.job == 'impound' then
							ListImpoundcars()
						else
							ListVehiclesMenu(zone.name)
						end
					elseif zone.data.job ~= 'impound' then
						StoreInGarage(zone.name, false)
					end
					break
				elseif combo:isPointInside(GetEntityCoords(PlayerPedId())) == false then
					lib.hideTextUI()
					break
				end
		end
end)

function ListVehiclesMenu(garage_unique_name, marker)
	local elements, vehiclePropsList = {}, {}
	local canpullout = nil
	exitmarker = marker


		ESX.TriggerServerCallback('orp_garage:getStoredVehicles', function(vehicles)
			for _,v in pairs(vehicles) do

				local vehicleProps = json.decode(v.vehicle)
				local vehiclehealth = json.decode(v.health)
				vehiclePropsList[vehicleProps.plate] = vehicleProps
				local vehicleHash = vehicleProps.model
				local vehicleName, vehicleLabel, Garagename

				if v.pound == true then
					canpullout = 0
				else		
					if v.garage_name == garage_unique_name then
						canpullout = 2			
					else
						canpullout = 1
					end
				end

				if v.vehiclename then
					vehicleName = v.vehiclename					
				else
					vehicleName = GetDisplayNameFromVehicleModel(vehicleHash)
				end

				if Zones.Garages[v.garage_name] == nil then
					Garagename = 'At Property'
				else
					Garagename = Zones.Garages[v.garage_name].label
				end
				
				table.insert(elements, {
					label = vehicleLabel,
					vehicleName = vehicleName,
					stored = v.stored,
					plate = v.plate,
					fuel = vehicleProps.fuelLevel,
					engineh = vehicleProps.engineHealth / 10,
					garagename = Garagename,
					garageid = garage_unique_name,
					canpullout = canpullout
				})
			end
			SetNuiFocus(true, true)
			SendNUIMessage({
				type = "openGarage",
				garagelabel = Zones.Garages[garage_unique_name].label,
				elements = elements,
			})
		end, garage_unique_name)
end

AddEventHandler("orp_garage:StoreInGarage", function( property, garagelabel, car)
	StoreInGarage(garagelabel)
end)

function StoreInGarage(garage_unique_name)
	local playerPed  = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(playerPed,false)
	local plate = GetVehicleNumberPlateText(vehicle)
	lib.hideTextUI()
		if GetPedInVehicleSeat(vehicle, -1) == playerPed then
			local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(vehicle)
			if GotTrailer then
				local trailerProps  = GetVehicleProperties(TrailerHandle)
				if trailerProps ~= nil then
					ESX.TriggerServerCallback('orp_garage:stockv',function(valid)
						if(valid) then
							TriggerEvent('persistent-vehicles/delete-vehicle', TrailerHandle)
							TriggerServerEvent('orp_garage:modifystate', trailerProps.plate, true)
							TriggerServerEvent("orp_garage:MoveGarage", trailerProps.plate, garage_name)
							lib.notify({
								title = 'Notification title',
								description =  _U('trailer_in_garage'),
								position = 'top',
								icon = 'square-parking',
								type = 'success'
							})
						else
							lib.notify({
								title = 'Uh oh!',
								description =  _U('cannot_store_vehicle'),
								position = 'top',
								icon = 'square-parking',
								type = 'error'
							})
						end
					end,trailerProps, garage_unique_name, isproperty)
					
				else
					lib.notify({
						title = 'Uh oh!',
						description =  _U('vehicle_error'),
						position = 'top',
						icon = 'square-parking',
						type = 'error'
					})
				end
			else
				local vehicleProps  = ESX.Game.GetVehicleProperties(vehicle)
				if vehicleProps ~= nil then
					ESX.TriggerServerCallback('orp_garage:stockv',function(valid)
						if(valid) then
							TriggerEvent('persistent-vehicles/delete-vehicle', vehicle)
							TriggerServerEvent('orp_garage:modifystate', vehicleProps.plate, true)
							TriggerServerEvent("orp_garage:MoveGarage", vehicleProps.plate, garage_unique_name)
							lib.notify({
								title = 'Stored!',
								description =  _U('vehicle_in_garage'),
								position = 'top',
								icon = 'square-parking',
								type = 'success'
							})
						else
							lib.notify({
								title = 'Uh oh!',
								description =  _U('cannot_store_vehicle'),
								position = 'top',
								icon = 'square-parking',
								type = 'error'
							})
						end
					end,vehicleProps,  garage_unique_name)
				else
					lib.notify({
						title = 'Uh oh!',
						description =  _U('vehicle_error'),
						position = 'top',
						icon = 'square-parking',
						type = 'error'
					})
				end
			end
		else
			lib.notify({
				title = 'Uh oh!',
				description =  _U('not_driver'),
				position = 'top',
				icon = 'square-parking',
				type = 'error'
			})
		end
	Citizen.Wait(1000)
	TriggerEvent('orp_garage:InTheZone', true, lastzone)
end

function ListImpoundcars()
	local elements, vehiclePropsList = {}, {}
	ESX.TriggerServerCallback('orp_garage:getimpoundVehicles', function(vehicles)
		for _,v in pairs(vehicles) do
			local vehicleProps = json.decode(v.vehicle)
			local vehicleHash = vehicleProps.model
			local vehicleName, vehicleLabel

			if v.vehiclename then
				vehicleName = v.vehiclename					
			else
				vehicleName = GetDisplayNameFromVehicleModel(vehicleHash)
			end

			table.insert(elements, {
				label = vehicleLabel,
				vehicleName = vehicleName,
				plate = vehicleProps.plate,
				fee = v.fee,
				description = v.description,
				releasedate = v.releasedate
			})
		end
		SetNuiFocus(true, true)
		SendNUIMessage({
			type = "impoundopen",
			elements = elements,
		})
	end)
end

AddEventHandler('orp_garage:InImpoundZone', function(inzone, zone)
	lib.showTextUI('[E] - Impound Vehicle', {
		position = "left-center",
		icon = 'square-parking',
		style = {
			borderRadius = 0,
			backgroundColor = '#29339B',
			color = 'white'
		}
	})
		lastzone = zone
		while inzone do 
			Citizen.Wait(0)
			if IsControlJustPressed(0, 38) then
				local player = PlayerPedId()
				local incarvehicle = GetVehiclePedIsIn(player, false)
				if IsPedInAnyVehicle(player, false) and GetPedInVehicleSeat(incarvehicle, -1) == player then
					triggerimpoundmenu()
					break
				end	
			elseif impoundcombo:isPointInside(GetEntityCoords(PlayerPedId())) == false then
				lib.hideTextUI()
				break
			end
		end
end)

function triggerimpoundmenu()
	lib.hideTextUI()
	local player = PlayerPedId()
	local incarvehicle = GetVehiclePedIsIn(player, false)
	local plate = GetVehicleNumberPlateText(incarvehicle)

	ESX.TriggerServerCallback('orp_garage:isVehicleOwned', function(result)
		if result ~= false then
				charname = GetPlayerName(PlayerId())
				menuopened = true
				SetNuiFocus(true, true)
				SendNUIMessage(
				{
					type = "openimpoundform",
					charname = charname,
					plate = plate,
				})
		else
			lib.notify({
				title = 'Uh oh!',
				description =  'This vehicle is not owned by a player!',
				position = 'top',
				icon = 'square-parking',
				type = 'error'
			})
			Citizen.Wait(1000)
			TriggerEvent('orp_garage:InImpoundZone', true, lastzone)
		end
	end, plate)
end

--Spawn car
function SpawnVehicle(vehicleProps, garage)
	local spawn = GetEntityCoords(PlayerPedId())
	local heading = GetEntityHeading(PlayerPedId())  
	local haspointer = '[]'
	
	if Zones.Garages[garage] ~= nil then
		haspointer = json.encode(Zones.Garages[garage].spawnpointers)
	end
	
	if exitmarker ~= nil then
		ESX.Game.SpawnVehicle(vehicleProps.model, exitmarker, exitmarker.w, function(vehicle)
			ESX.Game.SetVehicleProperties(vehicle, vehicleProps)
			SetVehicleFuelLevel(vehicle, vehicleProps.fuelLevel + 0.0)
			DecorSetFloat(vehicle, "_FUEL_LEVEL", GetVehicleFuelLevel(vehicle))
			exports["onyxLocksystem"]:givePlayerKeys(vehicleProps.plate)
			TriggerEvent('persistent-vehicles/register-vehicle', vehicle)
			TriggerServerEvent('orp_garage:modifystate', vehicleProps.plate, false)
		end)
		exitmarker = nil
	elseif haspointer ~= '[]' then 
		local foundSpawn, spawnPoint = GetAvailableVehicleSpawnPoint(garage)
		if foundSpawn then
			ESX.Game.SpawnVehicle(vehicleProps.model, spawnPoint.coords, spawnPoint.heading, function(vehicle)
			ESX.Game.SetVehicleProperties(vehicle, vehicleProps)
			SetVehicleFuelLevel(vehicle, vehicleProps.fuelLevel + 0.0)
			DecorSetFloat(vehicle, "_FUEL_LEVEL", GetVehicleFuelLevel(vehicle))
			exports["onyxLocksystem"]:givePlayerKeys(vehicleProps.plate)
			TriggerEvent('persistent-vehicles/register-vehicle', vehicle)
			TriggerServerEvent('orp_garage:modifystate', vehicleProps.plate, false)
			end)
		end
	else
		--Spawnpos = vector3(found.x,found.y,found.z)
		ESX.Game.SpawnVehicle(vehicleProps.model, {
			x = spawn.x + 5,
			y = spawn.y + 5,
			z = spawn.z	
		},
		heading*1.0, function(callback_vehicle)
				ESX.Game.SetVehicleProperties(callback_vehicle, vehicleProps)
				SetVehicleFuelLevel(vehicle, vehicleProps.fuelLevel + 0.0)
				DecorSetFloat(vehicle, "_FUEL_LEVEL", GetVehicleFuelLevel(vehicle))
				exports["onyxLocksystem"]:givePlayerKeys(vehicleProps.plate)
				TriggerEvent('persistent-vehicles/register-vehicle', callback_vehicle)
			end)
		TriggerServerEvent('orp_garage:modifystate', vehicleProps.plate, false)
	end
end

function GetAvailableVehicleSpawnPoint(garage)
	local found = false
	local distanceToClosestSpawnPoint = 999999999
	local closestSpawnPoint = nil
	local carSpawnCoordsPosCheck = GetEntityCoords(PlayerPedId()) + (GetEntityForwardVector(PlayerPedId()) * 2)
	local spawnPoints = Zones.Garages[garage].spawnpointers
	
	for i=1, #spawnPoints, 1 do

		distanceBetweenCoords = GetDistanceBetweenCoords(carSpawnCoordsPosCheck.x, carSpawnCoordsPosCheck.y, carSpawnCoordsPosCheck.z, spawnPoints[i].coords.x, spawnPoints[i].coords.y, spawnPoints[i].coords.z)
		if (distanceBetweenCoords < distanceToClosestSpawnPoint) and (ESX.Game.IsSpawnPointClear(spawnPoints[i].coords, spawnPoints[i].radius)) then
			distanceToClosestSpawnPoint = distanceBetweenCoords
			closestSpawnPoint = spawnPoints[i]
			found = true
		end
	end

	if found then
		return true, closestSpawnPoint
	else
		lib.notify({
			title = 'Uh oh!',
			description =  _U('vehicle_blocked'),
			position = 'top',
			icon = 'car-burst',
			type = 'error'
		})
		return false
	end
end

AddEventHandler('orp_garage:propertymenu', function(KindOfVehicle, garage_name, vehicle_type, marker)
	local elements, vehiclePropsList = {}, {}
	local canpullout = nil
	lastzone = nil
	exitmarker = marker

		ESX.TriggerServerCallback('orp_garage:getpropertyvehicles', function(vehicles)
			for _,v in pairs(vehicles) do

				local vehicleProps = json.decode(v.vehicle)
				local vehiclehealth = json.decode(v.health)
				vehiclePropsList[vehicleProps.plate] = vehicleProps
				local vehicleHash = vehicleProps.model
				local vehicleName, vehicleLabel, Garagename

				if v.pound == true then
					canpullout = 0
				else		
					if v.garage_name == garage_name then
						canpullout = 2			
					else
						canpullout = 1
					end
				end

				if v.vehiclename then
					vehicleName = v.vehiclename					
				else
					vehicleName = GetDisplayNameFromVehicleModel(vehicleHash)
				end

				if Zones.Garages[v.garage_name] == nil then
					Garagename = 'At Property'
				else
					Garagename = Zones.Garages[v.garage_name].label
				end

				table.insert(elements, {
					label = vehicleLabel,
					vehicleName = vehicleName,
					stored = v.stored,
					plate = v.plate,
					fuel = vehicleProps.fuelLevel,
					engineh = vehicleProps.engineHealth / 10,
					garagename = Garagename,
					garageid = garage_unique_name,
					canpullout = canpullout
				})
			end
			menuopened = true
			SetNuiFocus(true, true)
			SendNUIMessage({
				type = "openGarage",
				garagelabel = garage_name,
				elements = elements,
			})
		end, vehicle_type)
end)   



----------- NUI CALLBACKS

RegisterNUICallback(
    "close",
    function(data)
        SetNuiFocus(false, false)
		if lastzone ~= nil then
			TriggerEvent('orp_garage:InTheZone', true, lastzone)
		end
		exitmarker = nil
    end
)

RegisterNUICallback("pulloutgarage",
    function(data)
        local plate = data["plate"]
		local vehiclePropsList = {}
		SetNuiFocus(false, false)
		ESX.TriggerServerCallback('orp_garage:getout', function(vehicles)
			for _,v in pairs(vehicles) do
				local vehicleProps = json.decode(v.vehicle)
				local garage = v.garage_name
				SpawnVehicle(vehicleProps, garage)
				exitmarker = nil
			end
		end, plate)
		if lastzone ~= nil then
			TriggerEvent('orp_garage:InTheZone', true, lastzone)
		end
		
    end
)

RegisterNUICallback(
    "rename",
    function(data)
        local plate = data["plate"]
		local newname = data["newname"]
		TriggerServerEvent('orp_garage:renamevehicle', plate, newname)
		if lastzone ~= nil then
			TriggerEvent('orp_garage:InTheZone', true, lastzone)
		end
    end
)

RegisterNUICallback(
    "payfee",
    function(data)
        local plate = data["plate"]
		local fee = tonumber(data["fee"])
		local CoH = exports.ox_inventory:Search('count', 'money')
		if CoH >= fee then
			TriggerServerEvent('orp_garage:removeimpound', plate, fee)
			ESX.TriggerServerCallback('orp_garage:getout', function(vehicles)
				for _,v in pairs(vehicles) do
					local vehicleProps = json.decode(v.vehicle)
					local garage = v.garage_name
					--print(garage)
					SpawnVehicle(vehicleProps, 'impoundlot')
				end
			end, plate)
			TriggerEvent('orp_garage:InTheZone', true, lastzone)
		else
			lib.notify({
				title = 'Uh oh!',
				description =  "You do not have enough money.",
				position = 'top',
				icon = 'xmark-to-slot',
				type = 'error'
			})
					if lastzone ~= nil then
			TriggerEvent('orp_garage:InTheZone', true, lastzone)
		end
		end
    end
)

RegisterNUICallback(
    "transfer",
    function(data)
        local plate = data["plate"]
		local garageid = data["garageid"]
		local CoH = exports.ox_inventory:Search('count', 'money')
		if CoH >= Config.SwitchGaragePrice then
			TriggerServerEvent('orp_garage:removemoney')
			ESX.TriggerServerCallback('orp_garage:getout', function(vehicles)
				for _,v in pairs(vehicles) do
					local vehicleProps = json.decode(v.vehicle)
					local garage = v.garage_name
	
					SpawnVehicle(vehicleProps, garageid)
				end
			end, plate)
			if lastzone ~= nil then
				TriggerEvent('orp_garage:InTheZone', true, lastzone)
			end
		else
				lib.notify({
					title = 'Uh oh!',
					description =  "You do not have enough money.",
					position = 'top',
					icon = 'xmark-to-slot',
					type = 'error'
				})
			TriggerEvent('orp_garage:InTheZone', true, lastzone)
		end
    end
)

RegisterNUICallback(
    "impoundvehicle",
    function(data)
		SetNuiFocus(false, false)
		local player = PlayerPedId()
		local impoundvehicle = GetVehiclePedIsIn(player,false)
		TriggerEvent('persistent-vehicles/delete-vehicle', impoundvehicle)
		TriggerServerEvent('orp_garage:modifystate', data.plate, true)
		TriggerServerEvent('orp_garage:impoundvehicle', data)
		TriggerEvent('orp_garage:InImpoundZone', true, lastzone)
    end
)
------------- END NUI CALLBACKS
