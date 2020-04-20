local action = function(msg, blocks, ln)
	
if (msg.chat.type == 'private') then end

if is_mod(msg) or is_admin(msg) then	end

    if db:hget('chat:'..msg.chat.id..':settings', 'spam') == 'disable' then
	local iduser = msg.from.id
    local name = msg.from.first_name
    if msg.from.username then name = name..' (@'..msg.from.username..')' end
    math.randomseed(os.time());
 	var = math.random(0,1);

    elseif var == 0 then
        api.sendMessage(msg.chat.id, 'Hey *' ..name.. '* [ID '..iduser..'], no envíes enlaces de otros grupos o serás baneado.\n\nLos administradores tendrán la potestad de eliminar tu mensaje y reportarlo a Telegram.\nSi continúas, serás baneado automáticamente.', true)
        api.deleteMessage(msg.chat.id, msg.message_id)
  	elseif var == 1 then
  	   	api.sendMessage(msg.chat.id, 'El usuario *' ..name.. '*, [ID '..iduser..'] ha sido baneado por spammer.\n\nLa administración tiene la potestad de eliminar y reportar el mensaje a Telegram.', true)
 	   api.kickChatMember(msg.chat.id, msg.from.id)
       api.deleteMessage(msg.chat.id, msg.message_id)
 end
end

 return {
	action = action,
	triggers = {
            "[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm]%.[Mm][Ee]",
            "[Tt]%.[Mm][Ee]",
            "[Cc][Hh][Aa][Tt]%.[Ww][Hh][Aa][Tt][Ss][Aa][Pp][App]%.[Cc][Oo][Mm]",
            "[Tt][Ee][Ll][Ee][Gg][Rr][Aa]%.[Pp][Hh]",
            
}
}
