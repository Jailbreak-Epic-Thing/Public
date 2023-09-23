game:GetService("GuiService").ErrorMessageChanged:Connect(function() -- this is SO bad
  if not scriptQueued then
      local teleportQueue = syn and syn.queue_on_teleport or queue_on_teleport

      teleportQueue(([[
          getgenv().kickHooked = true

          getgenv().config = {
              autoRobEnabled = %s,
              playerSpeed = %s,
              vehicleSpeed = %s,
              serverHop = %s,
              serverHopDelay = %s,
              lockVehicle = %s,
              robberyCooldown = %s
          }

          loadstring(game:HttpGet("https://raw.githubusercontent.com/Jailbreak-Epic-Thing/Public/main/ServerHopThingy.lua"))()
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3d643b12d250443f9b8245a315b0559b.lua"))()
      ]]):format(tostring(config.autoRobEnabled), config.playerSpeed, config.vehicleSpeed, tostring(config.serverHop), config.serverHopDelay, tostring(config.lockVehicle), config.robberyCooldown))
  end

  game:GetService("TeleportService"):Teleport(game.PlaceId)
end)
