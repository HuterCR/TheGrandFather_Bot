local triggers = {
	'^/test'
}

local function on_each_msg(msg, ln)
	return msg
end

local action = function(msg, blocks, ln)
if blocks[1] == 'isbanned' and blocks[2] then
      if is_blocked(blocks[2]) then
        api.sendReply(msg, '✅ Este usuario sí está globalmente baneado.')
      else
        api.sendReply(msg, '❌❗️Este usuario no está globalmente baneado o se ha ingresado el alias en lugar del ID. Si quieres reportarlo, accede a @TheGrandFather. Gracias.')
      end
    end
end

return {
	action = action,
	triggers = triggers,
	test = true
}
