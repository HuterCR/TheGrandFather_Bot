local action = function(msg, blocks, ln)
 	
	if not(msg.chat.type == 'private') and not is_owner(msg) then return end
	
if blocks[1] == "gbanspam" then
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
			os.execute('echo "' ..id.. '," >> ./data/spamer')
			bot_init(true)
		end
		if blocks[2] then
		os.execute('echo "' ..blocks[2].. '," >> ./data/spamer')
		bot_init(true)
		end
		local response = db:sadd('bot:blocked', id)
		local text
		if response == 1 then
			text = '\nLa ID ' ..id.. ' ha sido agregado a la lista negra de este bot por *SPAM|FLOOD.* Para apelación, contactar a @HuterCR o a @EveryBodyOnHp.\n'				
--			text = id..' Has sido agregado a la lista negra de este bot por *SPAM|FLOOD.* Para apelación, contacta a @HuterCR o a @EveryBodyOnHp.'
		 else			
			text = '\nLa ID ' ..id.. ' ya estaba dentro se la lista negra de este bot por SPAM|FLOOD.\n'
--			text = id..' Tu ID ya se encuentra en la lista negra de este bot.'
		end
		api.sendReply(msg, text)
	end

	if blocks[1] == 'unspam' then
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
			os.execute('sed -i "/' ..id.. '/d" ./data/spamer')
			bot_init(true)
		end
		if blocks[2] then
			os.execute('sed -i "/' ..blocks[2].. '/d" ./data/spamer')
			bot_init(true)
		end
		local response = db:srem('bot:blocked', id)
		local text
		if response == 1 then
			make_text = '\nLa ID ' ..id.. 'ha sido retirada de la lista negra de este bot.\nPara conocer la razón, puedes hacer la consulta en el grupo de soporte del bot. \n'							
--			text = id..' Has sido eliminado de la lista negra de este bot.'
		else
			make_text = '\nLa ID ' ..id.. ' ya se encontraba eliminada de la lista negra de este bot.\n'
--			text = id..' Ya estabas fuera de la lista negra del bot.'
		end
		api.sendReply(msg, make_text)
	end

	if blocks[1] == "isspam" then
	if blocks[2] then
		local grep = io.popen("grep -o "..blocks[2].. " ./data/spamer")
		local list = grep:read("*a")
		if list == "" then
		api.sendMessage(msg.chat.id, "_Esta ID no esta globalmente baneada_", true)
		else
			api.sendReply(msg, "La ID "..blocks[2].." se encuentra *globalmente baneada* por SPAM|FLOOD.", true)
--			api.sendMessage(msg.chat.id, "*Demasiado seguro*\nSe encontraron las siguientes coincidencias:\n\n_"..list.."_", true)
			end
	end
	
 	if not blocks[2] then
		if msg.reply then
			local grep = io.popen("grep "..msg.reply.from.id.. " ./data/spamer")
		local list = grep:read("*a")
		if list == "" then
		api.sendReply(msg, "_Esta ID no está globalmente baneada_", true)
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
				'^/(gbanspam)$',
				'^/(gbanspam) (%d+)$',
				'^/(unspam)$',
				'^/(unspam) (%d+)$',
				'^/(isspam)$',
				'^/(isspam) (%d+)$'
				}
		}
