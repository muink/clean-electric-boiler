
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
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
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
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    },
    order = "c-d-b"
  }
})
