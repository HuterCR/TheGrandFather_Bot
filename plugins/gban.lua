local action = function(msg, blocks, ln)
 	
	if not(msg.chat.type == 'private') and not is_owner(msg) then return end
	
if blocks[1] == "gban" then
			local id
			local name
		if not blocks[2] then
			if not msg.reply then
				api.sendReply(msg, 'Este comando necesita una respuesta, o el Id para funcionar')
				return
			else
			id = msg.reply.from.id
			name = msg.from.first_name
    		if msg.from.username then name = name..' (@'..msg.from.username..')' end
			end
		else
		id = blocks[2]
		name = msg.from.first_name
    	if msg.from.username then name = name..' (@'..msg.from.username..')' end
		end
		if msg.reply then
			os.execute('echo "' ..id.. '," >> ./data/gbans')
			bot_init(true)
		end
		if blocks[2] then
		os.execute('echo "' ..blocks[2].. '," >> ./data/gbans')
		bot_init(true)
		end
		local response = db:sadd('bot:blocked', id)
		local text
		if response == 1 then
			text = '\nEl ID ' ..id.. ' ha sido agregado a la lista negra de este bot. Si crees que es un error, contacta a @HuterCR o a @EveryBodyOnHp para recibir asistencia.\n'				
--			text = id..' Has sido agregado a la lista negra de este bot.'
		 else			
			text = '\nEl ID ' ..id.. ' ha sido agregado a la lista negra del bot.\n'
--			text = id..' Ya estás en la lista negra del bot.'
		end
		api.sendReply(msg, text)
	end

	if blocks[1] == 'ungban' then
			local id
			local name
		if not blocks[2] then
			if not msg.reply then
				api.sendReply(msg, 'Este comando necesita una respuesta, o el Id para funcionar')
				return
			else
			id = msg.reply.from.id
			name = msg.from.first_name
    		if msg.from.username then name = name..' (@'..msg.from.username..')' end
			end
		else
		id = blocks[2]
		name = msg.from.first_name
    	if msg.from.username then name = name..' (@'..msg.from.username..')' end
		end
		if msg.reply then
			os.execute('sed -i "/' ..id.. '/d" ./data/gbans')
			bot_init(true)
		end
		if blocks[2] then
			os.execute('sed -i "/' ..blocks[2].. '/d" ./data/gbans')
			bot_init(true)
		end
		local response = db:srem('bot:blocked', id)
		local text
		if response == 1 then
			make_text = '\nEl ID ' ..id.. ' ha sido retirado de la lista negra de este bot.\n'							
--			text = id..' Has sido retirado de la lista negra del bot.'
		else
			make_text = '\nEl ID ' ..id.. ' ya ha sido retirado de la lista negra del bot.\n'
--			text = id..' Ya estás fuera de la lista negra del bot.'
		end
		api.sendReply(msg, make_text)
	end

	if blocks[1] == "isgban" then
	if blocks[2] then
		local grep = io.popen("grep -o "..blocks[2].. " ./data/gbans")
		local list = grep:read("*a")
		if list == "" then
		api.sendMessage(msg.chat.id, "_Esta ID no se encuentra en la lista negra del bot._", true)
		else
			api.sendReply(msg, "La ID "..blocks[2].." se encuentra *globalmente baneada*", true)
--			api.sendMessage(msg.chat.id, "*Demasiado seguro*\nSe encontraron las siguientes coincidencias:\n\n_"..list.."_", true)
			end
	end
	
 	if not blocks[2] then
		if msg.reply then
			local grep = io.popen("grep "..msg.reply.from.id.. " ./data/gbans")
		local list = grep:read("*a")
		if list == "" then
		api.sendReply(msg, "_Esta ID no se encuentra globalmente baneada_", true)
		else
	        api.sendReply(msg, "La ID "..msg.reply.from.id.." se encuentra *globalmente baneada*", true)
		end
		end
		end
end
end

return {
   action = action,
   triggers = {
	'^/(gban) (%d+)$',
	'^/(gban)$',
	'^/(ungban) (%d+)$',
	'^/(ungban)$',
	'^/(isgban)$',
	'^/(isgban) (%d+)$'
	}
}
