function trim(s)
  return (s:gsub("^%s*(.-)%s*$", "%1"))
end

local action = function(msg, blocks, ln)

	local hash = 'chat:'..msg.chat.id..':tglinks'
	local tglinks = db:get(hash)
	local texto = blocks[2]

if not(msg.chat.type == 'private') and is_mod(msg) then

	if blocks[1] == 'links' then
		text = 'Configura una lista de links *(links de grupos publicos o privados)* para que sean ignorados por el antispam del bot.'
		api.sendReply(msg, text, true)
	end
		if blocks[1] == "setlinks" then
				db:set(hash, texto)
				api.sendMessage(msg.chat.id, "✅ Links añadidos correctamente. Esos links seran ignorados por el antispam en este grupo.")
			end
		if blocks[1] == "showlinks" then
			if not tglinks then
				api.sendReply(msg, "ℹ️ No hay ningun link en la lista blanca")
			else
				api.sendReply(msg, "✅ Listado de links permitidos en este grupo:\n\n"..string.gsub(trim(string.gsub(tglinks, ",", " ")), " ", ", ").."")
			end
		end
		if blocks[1] == "delinks" then
			db:del(hash, texto)
				api.sendMessage(msg.chat.id, "✅ Link borrado correctamente en este grupo.")
			end
	end
		if blocks[1] == "reslinks" then
			if tglinks then
			db:del(hash, key)
		end
		api.sendMessage(msg.chat.id, "🔁 Lista blanca de antispam reseteada para este grupo")
   	    end
end

 return {
	action = action,
	triggers = {
	'^/(links)$',
	'^/(setlinks) (.*)',
	'^/(showlinks)$',
	'^/(delinks) (.*)',
	'^/(reslinks)$',
}
}
