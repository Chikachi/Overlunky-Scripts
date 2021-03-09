meta.name = "Low Score \"Helper\""
meta.version = "1.0.0"
meta.description = "Pick up money and die."
meta.author = "MiraWaNeko"

money_time = nil
spawning_bombs = false

function on_frame()
  if players[1].health > 0 and players[1].inventory.money > 0 then
    if money_time == nil then
      money_time = state.time_total
      toast("Oopsie Woopsie! I made a fucky wucky! A wittle fucko boingo!")
    else
      if (state.time_total - money_time) > (15 * 60) then
        toast("You have escaped death long enough")
        kill_entity(players[1].uid)
      elseif (state.time_total - money_time) > (4 * 60) then
        if not spawning_bombs then
          toast("UwU")
          spawning_bombs = true
        elseif (state.time_total - money_time) % 10 == 0 then
          x, y, l = get_position(players[1].uid)
          spawn(ENT_TYPE.ITEM_BOMB, x, y, l, math.random(-1, 1), math.random(-1, 1))
        end
      end
    end
  end
end

function on_death()
  money_time = nil
  spawning_bombs = false
end
