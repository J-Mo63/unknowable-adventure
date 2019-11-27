-- A module for dialogue related methods and variables
local M = {}

-- A dialogue table
local dialogue_table = {"broke", "still broke", "worked! this motherfucking worked dude!"}

local dialogue = nil
local max_width = 20
local action_cooldown = 0


function M.update(dt)
  if dialogue and love.keyboard.isDown("f") and action_cooldown <= 0 then
    M.progress_dialogue()
    action_cooldown = 30

    if dialogue == "" then
      -- Module.system.control_override = false
    end
  end

  if action_cooldown > 0 then
    action_cooldown = action_cooldown - 1
  end
end

-- A method to display dialogue given a dialogue id value
function M.display_dialogue(dialogue_id)
  -- Display the dialogue on screen
  dialogue = dialogue_table[dialogue_id]
  Module.system.control_override = true
end

function M.progress_dialogue()
  dialogue = string.sub(dialogue, max_width + 1, -1)
end

function M.render()
  local font = love.graphics.getFont()
  local dialogue_chunk = string.sub(dialogue, 1, max_width)
  local font_width = font:getWidth(dialogue_chunk)
  local y_position = Module.player.transform.y - Module.player.transform.h
  local x_position = Module.player.transform.x - (font_width / 2) + (Module.player.transform.w / 2)
  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle("fill", x_position, y_position, font_width, font:getHeight(dialogue_chunk))
  love.graphics.setColor(0, 0, 0)
  love.graphics.print(dialogue_chunk, x_position, y_position)
  love.graphics.reset()
end

return M