-- Import the required system modules
local system = require("system")
local player = require("player")

local tiles = {
  grass = nil
}

local height = nil
local tileWidth = nil

local scaleVal = nil

function love.load()
  tiles.grass = love.graphics.newImage("grass.jpg")
  tileWidth = tiles.grass:getWidth()
  height = love.graphics.getHeight()

  scaleVal = height/tileWidth
  game_map = {
    {tiles.grass, tiles.grass, tiles.grass, tiles.grass},
    {tiles.grass, tiles.grass, tiles.grass, tiles.grass},
    {tiles.grass, tiles.grass, tiles.grass, tiles.grass},
    {tiles.grass, tiles.grass, tiles.grass, tiles.grass},
  }
end

function love.update(dt)
  system.update()
  player.update_movement(dt)
end

function love.draw()
  draw_map()
  love.graphics.print("-_-", player.location.x, player.location.y, 0)
end

function draw_map()
  tileHeight = tileWidth*scaleVal/4

  y_val = 0
  for i, row in ipairs(game_map) do
    x_val = 0
    for i, tile in ipairs(row) do
      love.graphics.draw(tile, x_val, y_val, 0, scaleVal/4)
      x_val = x_val + tileHeight
    end
    y_val = y_val + tileHeight
  end
end



-- function display_table(table_var)
--   for i, v in ipairs(table_var) do
--     if type(v) == type(table) then
--       print("Found Inner Table:")
--       display_table(v)
--     else
--       print(i, v)
--     end
--   end
-- end

-- test_table = {"hi", {{"hi", {"hi", "hello"}}, "hello"}, "hi", {"hi", {"hi", "hello"}}, key = "val"}

-- table.remove(test_table, 1)

-- display_table(test_table)

-- print(test_table["key"])


-- -- Get the last integer key
-- print(#{1, 2, 3,1, 3,1, 2, 3})