local action = function(msg, blocks)
if msg.chat.type == "private" and not blocks[2] then return false end
if is_mod(msg) or is_gbanners(msg) then
else
  api.sendReply(msg, "`Solo para administradores.`", true)
  return false
end

--local action = function(msg)
	api.sendMessage(msg.chat.id, '*Ayuda lista blanca de links .*\n\n*/spam enable* : _Permite el envio de links_\n*/spam disable* : _Expulsa si son links que no estan en lista blanca_\n*/setlinks link* : _Guarda el/los links en lista blanca_\n*/showlinks* : _Muestra los links guardados_\n*/delinks link* : _Borra el link de la lista blanca_\n*/reslinks* : _Borra todos los links de la lista blanca_', true)
end
--end

local triggers = {
	'^[!#/]linkshp*'
}

return {
	action = action,
	triggers = triggers
}

