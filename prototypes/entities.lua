
--entities
local entities={}
entities[1] = table.deepcopy(data.raw["boiler"]["boiler"])
entities[1].name = "clean-electric-boiler-165"
entities[1].icon = "__clean-electric-boiler__/graphics/icons/clean-electric-boiler.png"
entities[1].minable.result = "clean-electric-boiler-165"
entities[1].target_temperature = 165
entities[1].energy_consumption = "1.8MW"
entities[1].energy_source = {
	type = "electric",
	usage_priority = "secondary-input",
	emissions = 0
}

entities[1].structure.north.layers[1].filename = "__clean-electric-boiler__/graphics/entity/clean-electric-boiler/N-idle.png"
entities[1].structure.east.layers[1].filename = "__clean-electric-boiler__/graphics/entity/clean-electric-boiler/E-idle.png"
entities[1].structure.south.layers[1].filename = "__clean-electric-boiler__/graphics/entity/clean-electric-boiler/S-idle.png"
entities[1].structure.west.layers[1].filename = "__clean-electric-boiler__/graphics/entity/clean-electric-boiler/W-idle.png"
entities[1].structure.north.layers[1].hr_version.filename = "__clean-electric-boiler__/graphics/entity/clean-electric-boiler/hr-N-idle.png"
entities[1].structure.east.layers[1].hr_version.filename = "__clean-electric-boiler__/graphics/entity/clean-electric-boiler/hr-E-idle.png"
entities[1].structure.south.layers[1].hr_version.filename = "__clean-electric-boiler__/graphics/entity/clean-electric-boiler/hr-S-idle.png"
entities[1].structure.west.layers[1].hr_version.filename = "__clean-electric-boiler__/graphics/entity/clean-electric-boiler/hr-W-idle.png"
entities[1].fire_glow.north.filename = "__clean-electric-boiler__/graphics/entity/clean-electric-boiler/N-light.png"
entities[1].fire_glow.east.filename = "__clean-electric-boiler__/graphics/entity/clean-electric-boiler/E-light.png"
entities[1].fire_glow.south.filename = "__clean-electric-boiler__/graphics/entity/clean-electric-boiler/S-light.png"
entities[1].fire_glow.west.filename = "__clean-electric-boiler__/graphics/entity/clean-electric-boiler/W-light.png"
entities[1].fire_glow.north.hr_version.filename = "__clean-electric-boiler__/graphics/entity/clean-electric-boiler/hr-N-light.png"
entities[1].fire_glow.east.hr_version.filename = "__clean-electric-boiler__/graphics/entity/clean-electric-boiler/hr-E-light.png"
entities[1].fire_glow.south.hr_version.filename = "__clean-electric-boiler__/graphics/entity/clean-electric-boiler/hr-S-light.png"
entities[1].fire_glow.west.hr_version.filename = "__clean-electric-boiler__/graphics/entity/clean-electric-boiler/hr-W-light.png"

entities[2] = table.deepcopy(entities[1])
entities[2].name = "clean-electric-boiler-500"
entities[2].icon = "__clean-electric-boiler__/graphics/icons/clean-electric-boiler.png"
entities[2].minable.result = "clean-electric-boiler-500"
entities[2].target_temperature = 500
entities[2].energy_consumption = 5.82*2 .. "MW" --data.raw["generator"]["steam-turbine"].fluid_usage_per_tick*2*60s*(500-15)℃*0.2MJ


data:extend(entities)
