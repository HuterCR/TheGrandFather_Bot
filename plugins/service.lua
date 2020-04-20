local group_log = -1001101240169 --Grupo donde envia la informaciones
local function gsub_custom_welcome(msg, custom)
	local name = msg.added.first_name:mEscape()
	local name = name:gsub('%%', '')
	local id = msg.added.id
	local id2 = msg.chat.id
	local username
	local title = msg.chat.title:mEscape()
	if msg.added.username then
		username = '@'..msg.added.username:mEscape()
	else
		username = '(sin usuario)'
	end
	custom = custom:gsub('$name', name):gsub('$username', username):gsub('$id', id):gsub('$title', title):gsub('$id2', id2)
	return custom
end

local function get_welcome(msg, ln)
	if is_locked(msg, 'Welcome') then
		return false
	end
	local type = db:hget('chat:'..msg.chat.id..':welcome', 'type')
	local content = db:hget('chat:'..msg.chat.id..':welcome', 'content')
	if type == 'media' then
		local file_id = content
		api.sendDocumentId(msg.chat.id, file_id)
		return false
	elseif type == 'custom' then
		return gsub_custom_welcome(msg, content)
	elseif type == 'composed' then
		if not(content == 'no') then
			local abt = cross.getAbout(msg.chat.id, ln)
			local rls = cross.getRules(msg.chat.id, ln)
			local creator, admins = cross.getModlist(msg.chat.id, ln)
			print(admins)
			local mods
			if not creator then
				mods = '\n'
			else
				mods = make_text(lang[ln].service.welcome_modlist, creator:mEscape(), admins:gsub('*', ''):mEscape())
			end
			local text = make_text(lang[ln].service.welcome, msg.added.first_name:mEscape_hard(), msg.chat.title:mEscape_hard())
			if content == 'a' then
				text = text..'\n\n'..abt
			elseif content == 'r' then
				text = text..'\n\n'..rls
			elseif content == 'm' then
				text = text..mods
			elseif content == 'ra' then
				text = text..'\n\n'..abt..'\n\n'..rls
			elseif content == 'am' then
				text = text..'\n\n'..abt..mods
			elseif content == 'rm' then
				text = text..'\n\n'..rls..mods
			elseif content == 'ram' then
				text = text..'\n\n'..abt..'\n\n'..rls..mods
			end
			return text
		else
		--	return make_text(lang[ln].service.welcome, msg.added.first_name:mEscape_hard(), msg.chat.title:mEscape_hard())
		end
	end
end

local action = function(msg, blocks, ln)
	
	--avoid trolls
	if not msg.service then return end
	
	--if the bot join the chat
	if blocks[1] == 'botadded' then
			api.sendMessage(msg.chat.id, '\n�Gracias por agregarme a tu grupo! Ahora  para configurarme correctamente, tienes que darme admin (revisa [aqui](http://telegram.me/Moderador_Channel) para estar actualizado con las �ltimas noticias del bot) y contacta con @HuterCR o @EveryBodyOnHp, ser� un gusto servirte en tu grupo 🔰\n', true)		

		if msg.added.username and is_mod(msg) then
			print('Usuario', msg.from.username, msg.from.id, msg.added.username, msg.added.id, msg.chat.title, msg.chat.id)
			local id = msg.from.id
			local name = msg.from.first_name
    		if msg.from.username then name = name..' (@'..msg.from.username..')' end
			local title = msg.chat.title
			local id2 = msg.chat.id
		api.sendMessage(-1001101240169,'`🔰📋 Infomaci�n del usuario que agrega el BOT:`\n\n*👤 Usuario y Alias:* '..name..'\n*👤 Usuario 🆔* '..id..'\n*🔹 Nombre del grupo:* '..title..'\n*🔸Grupo 🆔* '..id2..'\n', true)
			else
			api.sendMessage(msg.chat.id, '_Tú ('..msg.adder.first_name:mEscape()..', '..msg.adder.id..')´ , no puedes agregarme a este grupo, sólo el creador o los admins del grupo pueden agregarme._', true)
			api.leaveChat(msg.chat.id)
			return
		end

		if is_blocked_global(msg.adder.id) then
			api.sendMessage(msg.chat.id, '_Tú ('..msg.adder.first_name:mEscape()..', '..msg.adder.id..') est�s bloqueado globalmente, no puedes usar este Bot_', true)
			api.leaveChat(msg.chat.id)
			return
		end

		cross.initGroup(msg.chat.id)
	end
	
	--if someone join the chat
	if blocks[1] == 'added' then
		
		if msg.chat.type == 'group' and is_banned(msg.chat.id, msg.added.id) then
			api.kickChatMember(msg.chat.id, msg.added.id)
			return
		end
		
		if msg.chat.type == 'supergroup' and is_prebanned(msg.chat.id, msg.added.id) then
			if msg.adder and is_mod(msg) then --if the user is added by a moderator, remove the added user from the prevbans
				db:srem('chat:'..msg.chat.id..':prevban', msg.added.id)
			else --if added by a not-mod, ban the user
				local res = api.banUser(msg.chat.id, msg.added.id, false, ln)
				if res then
					api.sendMessage(msg.chat.id, make_text(lang[ln].banhammer.was_banned, msg.added.first_name))
				end
			end
		end
		
		cross.remBanList(msg.chat.id, msg.added.id) --remove him from the banlist
	
--[[if not(msg.chat.type == 'private') and not is_mod(msg) then
if db:hget('chat:'..msg.chat.id..':settings', 'bots') == 'disable' then	
    	if (msg.new_chat_member.id) == (bot.id) then
--        api.kickChatMember(msg.chat.id, msg.new_chat_member)
			else --if added by a not-mod, ban the user
				local res = api.banUser(msg.chat.id, msg.new_chat_member.id, false, ln)
				if res then
			api.sendMessage(msg.chat.id, '_T�:  ('..msg.adder.first_name:mEscape()..', '..msg.adder.id..'), no puedes agregar bots._', true)				end
			end
		end
end]]

if msg.adder.id and msg.added then
         local name = getname_link(msg.adder.first_name, msg.adder.username)
         if (msg.added.is_bot == true) and msg.added.id == bot.id then return false end
   	    	  if (db:hget('chat:'..msg.chat.id..'settings', 'bots') == 'disable') and (msg.added.is_bot == true) then
    	    	api.banUser(msg.chat.id, msg.added.id)
        	 	api.sendMessage(msg.chat.id, 'Lo siento '..name..', el ingreso de bots est� prohibido, bot @'..msg.added.username:mEscape()..' expulsado', true)
        	else
         		api.sendMessage(msg.chat.id, name..', el ingreso de bots est� permitido en este grupo', true)
        end
    end
--		if msg.added.username then
--			local username = msg.added.username:lower()
--			if username:find('bot', -3) then return end
--		end

		local text = get_welcome(msg, ln)
		if text then
			api.sendMessage(msg.chat.id, text, true)
		end
		
		--if not text: welcome is locked
	end
	
	--if the bot is removed from the chat
	if blocks[1] == 'botremoved' then
			api.sendMessage(msg.from.id, '\nEs una lástima que me hayas sacado, si cambias de opinión puedes volver a agregarme y contacta con @HuterCR, séra un placer volver a servirte en tu grupo 🔰\n', true)				
	
			if msg.removed.username then
			print('Usuario', msg.from.username, msg.from.id, msg.removed.username, msg.removed.id, msg.chat.title, msg.chat.id)
			local id = msg.from.id
			local name = msg.from.first_name
    		if msg.from.username then name = name..' (@'..msg.from.username..')' end
			local title = msg.chat.title
			local id2 = msg.chat.id
			 api.sendMessage(-1001101240169,'`🔰📋 Infomaci�n del usuario que elimina el BOT:`\n\n*👤 Usuario y Alias:* '..name..'\n*👤 Usuario 🆔* '..id..'\n*🔹 Nombre del grupo:* '..title..'\n*🔸Grupo 🆔* '..id2..'\n', true)
    		return
	    end
	    
		--remove the group settings
		cross.remGroup(msg.chat.id, true)
		
		--save stats
        db:hincrby('bot:general', 'groups', -1)
	end
	
	if blocks[1] == 'removed' then
		if msg.removed.username then
			local name = msg.from.first_name
			local title = msg.chat.title
			api.sendMessage(msg.from.id, '\n' ..name.. ', es una lástima que te hayas ido de ' ..title.. ', si cambias de opinión y quieres volver a ingresar, solo dile a @HuterCR que te ayude, gracias por participar. 🔰\n', true)		
			return
		end	
		if msg.remover and msg.removed then
			if msg.remover.id ~= msg.removed.id and msg.remover.id ~= bot.id then
				local action
				if msg.chat.type == 'supergroup' then
					action = 'ban'
				elseif msg.chat.type == 'group' then
					action = 'kick'
				end
				cross.saveBan(msg.removed.id, action)
			end
		end
	end
end
return {
	action = action,
	triggers = {
		'^###(botadded)',
		'^###(added)',
		'^###(botremoved)',
		'^###(removed)'
	}
}
