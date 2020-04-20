-- Plugins que avisa cuando sos mencionados

function on_each_msg(msg)
  if msg.from and msg.from.username then
      db:hset("usuarios", msg.from.username, msg.from.id)
      end
    return msg
end



local function do_keyboard_privado(msg)
    local keyboard = {}
    keyboard.inline_keyboard = {
      {
        {text = "Texto boton", callback_data = msg.message_id.."/"..msg.chat.id}
      }
    }
    return keyboard
end


local function do_keyboard_publico(msg)
  function mdmks(msg)
    vardump(msg)
    print()
  end
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{
    		{text = 'Mensaje', url = "http://t.me/"..msg.chat.username.."/"..msg.message_id},
	    }
    }
    return keyboard
end



local function action(msg, blocks)
  local user =db:hget("usuarios", blocks[1])
    if user then
        if (msg.chat.username) then

            api.sendKeyboard(tonumber(user), "ðŸ”° Â¡Te han Mencionado! \n ðŸ‘¥ Grupo: "..msg.chat.title.." \n ðŸ—ƒ Tipo de Grupo: "..msg.chat.type.." \n ðŸ‘¤ Usuario: "..msg.from.username.." \n ðŸ’¬ Mensaje: http://t.me/"..msg.chat.username.."/"..msg.message_id, do_keyboard_publico, true)
--            local keyboard = do_keyboard_publico()
  --          api.sendKeyboard(tonumber(user),"ðŸ”° Â¡Te han Mencionado! \n ðŸ‘¥ Grupo: "..msg.chat.title.." \n ðŸ—ƒ Tipo de Grupo: "..msg.chat.type.." \n ðŸ‘¤ Usuario: "..msg.from.username,keyboard, true)

          else

            api.sendKeyboard(tonumber(user), "ðŸ”° Â¡Te han Mencionado! \n ðŸ‘¥ Grupo: "..msg.chat.title.." \n ðŸ—ƒ Tipo de Grupo: "..msg.chat.type.." \n ðŸ‘¤ Usuario: "..msg.from.username, do_keyboard_privado, true)
  --        local keyboard = do_keyboard_privado()
    --      api.sendKeyboard(tonumber(user),"ðŸ”° Â¡Te han Mencionado! \n ðŸ‘¥ Grupo: "..msg.chat.title.." \n ðŸ—ƒ Tipo de Grupo: "..msg.chat.type.." \n ðŸ‘¤ Usuario: "..msg.from.username,inline, true)

          end
        end
      end
return {
action = action,
on_each_msg = on_each_msg,
triggers = {
  "^@(.+)",
--  "^@(.+) (.*)$",
  --"^(*.) @(.+)",
  --"^(*.) @(.+) (.*)"
  }
}
