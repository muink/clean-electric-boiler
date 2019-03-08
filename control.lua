--[[Init Block]]--
--------------------------------

--startup
local LIGHTORIO
if settings.startup["assemblerlight-red"] then LIGHTORIO = true end --if mod 'lightorio' is existed?

--events
local e=defines.events
local built_events = {e.on_built_entity, e.on_robot_built_entity}
local remove_events = {e.on_player_mined_entity, e.on_robot_mined_entity, e.on_entity_died}
local surface_del_events = {e.on_pre_surface_deleted}

--
local electric_boilers = {"clean-electric-boiler-165", "clean-electric-boiler-500"}



--[[Sub function Block]]--
--------------------------------

local function delete_boiler(unit_number)
	local light = global.boilers[unit_number].light
	if light.valid and light.name == "assembler-lamp" then light.destroy() end
	global.boilers[unit_number] = nil
end

local function debug_log(...)
	if DEBUG_INFO then game.print(...) end
end



--[[Main Events function Block]]--
--------------------------------

local function remove(event)
	local entity = event.entity
	if string.match(entity.name, "clean%-electric%-boiler%-%d+") then
		debug_log("Remove electric boiler from table")
		local id = entity.unit_number
		delete_boiler(id)
	end
end

local function built(event)
	local entity = event.created_entity
	if string.match(entity.name, "clean%-electric%-boiler%-%d+") then
		debug_log("Add electric boiler to table")
		local id = entity.unit_number
		global.boilers[id] = {boiler = entity, light = entity.surface.create_entity{name = "assembler-lamp", position = entity.position, force = entity.force}}
	end
end

local function surface_del(event)
	local index = event.surface_index
	local surface = game.surfaces[index]
	local boilers = surface.find_entities_filtered{name = electric_boilers}
	for i=1, #boilers do
		local id = boilers[i].unit_number
		delete_boiler(id)
	end
	debug_log("The surface #" .. index .. ": \"" .. surface.name .. "\" is deleted")
	debug_log("Remove " ..  #reactors .. " electric boilers of this surface from table")
end



--[[Main function Block]]--
--------------------------------

local function setup_global()
	global = {boilers = {}}

	--traverse all surface on map to find all electric boiler
	local surfaces = game.surfaces
	for i=1, #surfaces do
		local boilers = surfaces[i].find_entities_filtered{name = electric_boilers}
		for i=1, #boilers do
			local boiler = boilers[i]
			built({created_entity = boiler})
		end
	end
end



--[[Main Block]]--
--------------------------------

if LIGHTORIO then

--setup event handler
script.on_init(setup_global)
script.on_configuration_changed(setup_global)

--all game build/remove events handler
script.on_event(built_events, built)
script.on_event(remove_events, remove)
script.on_event(surface_del_events, surface_del)

end