

local action = function(msg, blocks, ln)
 	
	if not(msg.chat.type == 'private') and not is_owner(msg) then return end

if blocks[1] == "iscepero" then
local id
   if msg.reply then
    name = msg.reply.from.first_name
    username = msg.reply.from.username
    nombregrupo = msg.chat.title
    id = msg.reply.from.id
    id2 = msg.chat.id
if msg.chat.title then
  nombregrupo = msg.chat.title
 else
   nombregrupo = '_❌  Este es un chat privado_'
 end
 if msg.reply.from.username then
  username = '@'..msg.reply.from.username:mEscape()
 else
  username = '_❌  Este usuario no dispone de un alias_'
 end
   else
    name = msg.from.first_name
    username = msg.from.username
    nombregrupo = msg.chat.title
    id = msg.from.id
   id2 = msg.chat.id
  if msg.from.username then
  username = '@'..msg.from.username:mEscape()
 else
  username = '_❌  Este usuario no dispone de un alias_'
 end
 if msg.chat.title then
  nombregrupo = msg.chat.title
 else
   nombregrupo = '_❌  Este es un chat privado_'
 end
   end
   api.sendReply(msg, '`🔰📋 Infomacion del grupo y del usuario:`\n\n*👤 Usuario:* '..name..'\n*👤 Usuario 🆔* '..id..'\n*🔸Alias:*' ..username..'\n*🔹 Nombre del grupo:* '..nombregrupo..'\n*🔸Grupo 🆔* '..id2..'\n', true)
  end
  	if blocks[1] == 'id' then
 		if not(msg.chat.type == 'private') and not is_mod(msg) then return end
 		local id
 		if msg.reply then
 			id = msg.reply.from.id
 		else
 			id = msg.chat.id
 		end
 		api.sendReply(msg, '`'..id..'`', true)
 	end

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

return {
   action = action,
   triggers = {
	'^/(iscepero) (%d+)$',
	'^/(iscepero)$',

   
	
