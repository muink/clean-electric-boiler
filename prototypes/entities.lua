
--entities
local entities={}
entities[1] = table.deepcopy(data.raw["boiler"]["boiler"])
entities[1].name = "clean-electric-boiler-165"
entities[1].icon = "__base__/graphics/icons/boiler.png"
entities[1].minable.result = "clean-electric-boiler-165"
entities[1].target_temperature = 165
entities[1].energy_consumption = "1.8MW"
entities[1].energy_source = {
	type = "electric",
	usage_priority = "secondary-input",
	emissions = 0
}

entities[2] = table.deepcopy(entities[1])
entities[2].name = "clean-electric-boiler-500"
entities[2].icon = "__base__/graphics/icons/boiler.png"
entities[2].minable.result = "clean-electric-boiler-500"
entities[2].target_temperature = 500
entities[2].energy_consumption = 5.82*2 .. "MW"
entities[2].energy_source = {
	type = "electric",
	usage_priority = "secondary-input",
	emissions = 0
}


data:extend(entities)
