meta.name = "It's Boshy Time"
meta.version = "1.0.1"
meta.description = "Plays \"It's Boshy Time\" on run start"
meta.author = "MiraWaNeko"

boshy_sound = create_sound('boshy.mp3')

register_option_int("volume", "Volume of sound file", 100, 0, 100)

function on_start()
  if boshy_sound ~= nil then
    player = boshy_sound:play(true)
    player:set_volume(options.volume / 100.0)
    player:set_pause(false)
  else
    message('Boshy sound was not found...')
  end
end