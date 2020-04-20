local action = function(msg, blocks, ln)
 	
if not(msg.chat.type == 'private') and not is_owner(msg) then return end
	
if blocks[1] == "gbancp" then
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
			os.execute('echo "' ..id.. '," >> ./data/cp')
			bot_init(true)
		end
		if blocks[2] then
		os.execute('echo "' ..blocks[2].. '," >> ./data/cp')
		bot_init(true)
		end
		local response = db:sadd('bot:blocked', id)
		local text
		if response == 1 then
			text = '\nLa ID ' ..id.. ' ha sido agregada a la lista negra de este bot por CP (Pornografía infantil).\n[Usuario que solicita, comparte o participa en grupos de CP].\n'				
--			text = id..' Has sido agregado a la lista negra de este bot por CP (Pornografía infantil).'
		 else			
			text = '\n' ..name.. ': ¡La ID ' ..id.. ' ya ha sido agregada a la lista negra!\n'
--			text = id..' Ya estás globalmente bloqueado.'
		end
		api.sendReply(msg, text)
	end

	if blocks[1] == 'ungcp' then
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
			os.execute('sed -i "/' ..id.. '/d" ./data/cp')
			bot_init(true)
		end
		if blocks[2] then
			os.execute('sed -i "/' ..blocks[2].. '/d" ./data/cp')
			bot_init(true)
		end
		local response = db:srem('bot:blocked', id)
		local text
		if response == 1 then
			make_text = '\nLa ID ' ..id.. ' ha sido retirada de la lista negra de este bot.\n'							
--			text = id..' Has sido retirado de la lista negra de este bot. Disculpas por cualquier inconveniente causado.'
		else
			make_text = '\n' ..name.. ', el ID ' ..id.. ' ya no está en la lista negra del bot.\n'
--			text = id..' Ya estabas desbloqueado globalmente de este bot.'
		end
		api.sendReply(msg, make_text)
	end

	if blocks[1] == "iscp" then
	if blocks[2] then
		local grep = io.popen("grep -o "..blocks[2].. " ./data/cp")
		local list = grep:read("*a")
		if list == "" then

	name = msg.from.first_name
    username = msg.from.username
    nombregrupo = msg.chat.title
    id = msg.from.id
    id2 = msg.chat.id

			api.sendMessage(msg.chat.id, name.. "_Esta ID ("..blocks[2]..") no se encuentra globalmente baneada_", true)
		else
			api.sendReply(msg, "La ID "..blocks[2].." está *globalmente baneada*", true)
--			api.sendMessage(msg.chat.id, "*Demasiado seguro*\nSe encontraron las siguientes coincidencias:\n\n_"..list.."_", true)
			end
	end
	
 	if not blocks[2] then
		if msg.reply then
			local grep = io.popen("grep "..msg.reply.from.id.. " ./data/cp")
		local list = grep:read("*a")
		if list == "" then
		api.sendReply(msg, "_Esta ID no esta globalmente baneada_", true)
		else
	        api.sendReply(msg, "La ID "..msg.reply.from.id.." estÃ¡ *globalmente baneada*", true)
		end
		end
		end
end
end

return {
	action = action,
	triggers = {
				'^/(gbancp)$',
				'^/(gbancp) (%d+)$',
				'^/(uncp)$',
				'^/(ungcp) (%d+)$',
				'^/(iscp)$',
				'^/(iscp) (%d+)$'
				}
		}
