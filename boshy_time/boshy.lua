meta.name = "It's Boshy Time"
meta.version = "1.0.0"
meta.description = "Plays \"It's Boshy Time\" on run start"
meta.author = "MiraWaNeko"

boshy_sound = create_sound('boshy.mp3')

function on_start()
  if boshy_sound ~= nil then
    boshy_sound:play()
  end
end