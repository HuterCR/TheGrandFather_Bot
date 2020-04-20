
local action = function(msg, blocks)

if msg.chat.type == 'private' then return end

if not is_mod(msg) then return end

if blocks[1] == "scan" then
--api.sendMessage(msg.chat.id,"Lo sentimos.\nEl servicio de escaneo de AntiCP se encuentra *fuera de servicio.*", true)
api.sendMessage(msg.chat.id,"Lo sentimos.\nEl servicio de escaneo de AntiCP se encuentra *fuera de servicio. \n Pero agadecemos a Nuestro Colaboradores que lograron esta meta de porder realizar el Scan que actualmente esta fuera de Servicio*", true)
 

    end
end

return {
     action = action,
     triggers = {
         '^/(scan)$'
}
}
