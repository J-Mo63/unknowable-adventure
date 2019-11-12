-- Import the required modules
local system = require("scripts.system")
local player = require("scripts.player")
local map = require("scripts.map")
local map_loader = require("scripts.map_loader")
local action = require("scripts.action")

function love.load()
  -- Set the window title
  love.window.setTitle("Unknowable Adventure")
  -- Initialise modules for use
  player.init()
  map.init()
  setup_scene("main")
end

function love.update(dt)
  -- Register game updates
  system.update()
  player.update(dt)

  if love.keyboard.isDown("m") then
      setup_scene("map_2", {x = 0, y = 0})
  end
end

function love.draw()
  -- Render game components on the screen
  map.render()
  player.render()
  system.render()
end

function setup_scene(map_name, player_location)
  map_loader.init(map_name, map)
  player.collidable_objects = map.get_collidable_objects()
  player.tagged_objects = map.get_tagged_objects()
  player.action_module = action
  if player_location then
    player.transform.x = player_location.x
    player.transform.y = player_location.y
  end
end