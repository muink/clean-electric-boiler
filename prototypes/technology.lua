
data:extend({
  {
    type = "technology",
    name = "clean-electric-boiler",
    icon_size = 128,
    icon = "__clean-electric-boiler__/graphics/technology/clean-electric-boiler.png",
    effects = {
      {
        type = "unlock-recipe",
        recipe = "clean-electric-boiler-165"
      }
    },
    prerequisites = {"advanced-electronics", "advanced-material-processing"},
    unit = {
      count = 30,
      ingredients = {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    order = "c-d-a"
  },
  {
    type = "technology",
    name = "clean-electric-boiler-2",
    icon_size = 128,
    icon = "__clean-electric-boiler__/graphics/technology/clean-electric-boiler.png",
    effects = {
      {
        type = "unlock-recipe",
        recipe = "clean-electric-boiler-500"
      }
    },
    prerequisites = {"clean-electric-boiler", "advanced-material-processing-2"},
    unit = {
      count = 50,
      ingredients = {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    order = "c-d-b"
  }
})
