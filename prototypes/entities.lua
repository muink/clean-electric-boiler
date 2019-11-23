
local boiler_base = table.deepcopy(data.raw["boiler"]["boiler"])
local entity_path = "__clean-electric-boiler__/graphics/entity/clean-electric-boiler/"

boiler_base.icon = "__clean-electric-boiler__/graphics/icons/clean-electric-boiler.png"
boiler_base.fast_replaceable_group = "electric-boiler"
boiler_base.energy_source = {
	type = "electric",
	usage_priority = "secondary-input",
	emissions = 0
}
for k, v in pairs ({north="N", east="E", south="S", west="W"}) do
	boiler_base.structure[k].layers[1].filename = entity_path .. v .. "-idle.png"
	boiler_base.structure[k].layers[1].hr_version.filename = entity_path .. "hr-" .. v .. "-idle.png"
	boiler_base.fire_glow[k].filename = entity_path .. v .. "-light.png"
	boiler_base.fire_glow[k].hr_version.filename = entity_path .. "hr-" .. v .. "-light.png"
end
boiler_base.fire = {
	north = {
		filename = entity_path .. "N-fire.png",
		priority = "extra-high",
		frame_count = 12,
		line_length = 3,
		width = 20,
		height = 10,
		animation_speed = 0.125,
		shift = util.by_pixel(-1, 1),
		hr_version = {
			filename = entity_path .. "hr-N-fire.png",
			priority = "extra-high",
			frame_count = 12,
			line_length = 3,
			width = 40,
			height = 20,
			animation_speed = 0.125,
			shift = util.by_pixel(-0.5, 0.5),
			scale = 0.5
		}
	},
	east = {
		filename = entity_path .. "E-fire.png",
		priority = "extra-high",
		frame_count = 12,
		line_length = 4,
		width = 10,
		height = 20,
		animation_speed = 0.125,
		shift = util.by_pixel(-15, -17),
		hr_version = {
			filename = entity_path .. "hr-E-fire.png",
			priority = "extra-high",
			frame_count = 12,
			line_length = 4,
			width = 20,
			height = 40,
			animation_speed = 0.125,
			shift = util.by_pixel(-15, -17.5),
			scale = 0.5
		}
	},
	west = {
		filename = entity_path .. "W-fire.png",
		priority = "extra-high",
		frame_count = 12,
		line_length = 4,
		width = 10,
		height = 20,
		animation_speed = 0.125,
		shift = util.by_pixel(17, -17),
		hr_version = {
			filename = entity_path .. "hr-W-fire.png",
			priority = "extra-high",
			frame_count = 12,
			line_length = 4,
			width = 20,
			height = 40,
			animation_speed = 0.125,
			shift = util.by_pixel(17, -17),
			scale = 0.5
		}
	}
}

--entities
local entities={}
local generator={
	c165 = data.raw["generator"]["steam-engine"].fluid_usage_per_tick,
	c500 = data.raw["generator"]["steam-turbine"].fluid_usage_per_tick
}

for i, v in ipairs ({165, 500}) do
	entities[i] = table.deepcopy(boiler_base)
	entities[i].name = "clean-electric-boiler-" .. v
	entities[i].minable.result = "clean-electric-boiler-" .. v
	entities[i].target_temperature = v
	entities[i].energy_consumption = (generator["c" .. v]*60 * (v-15) * 0.0002)*2 .. "MW"
end
-- boiler.next_upgrade = "clean-electric-boiler" .. v


data:extend(entities)
