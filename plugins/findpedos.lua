
local function padrino_anticp(chat_id, kick)
  if kick then kick = "true" else kick = "false" end
  local url = "https://api.linuxlatbot.tk/pedosFind?auth=QWN73HYMyHtvy3JZKdnUsXVEh58lUmRS&token="..config.bot_api_key.."&kick="..kick.."&chat_id="..chat_id
  local request = performRequest(url)
  if request then
    local raw = JSON.decode(request)
    if raw.ok and raw.count > 0  then
      return raw.result, true
    elseif raw.count > 0 then
      return raw.result, false
    elseif raw.ok then
      return nil, true
    else
      return false
    end
  end
  return nil
end

local action = function(msg, matches)
if msg.chat.type == "private" and not matches[2] then return false end
    if is_mod(msg) or is_gbanners(msg) then
  else
    api.sendReply(msg, "` Sólo para administradores.`", true)
    return false
  end
local pid = sis.fork()
  if pid == 0 then
    local chat_id = msg.chat.id or matches[2]
    local real_chat_id, code = api.getChat(chat_id)
    if not real_chat_id then
      if code == 117 then
        api.sendMessage(msg.chat.id, 'ID Inválida', true)
        return false
      end
      else
    chat_id = matches[2] or msg.chat.id
local chat_name = api.getChat(chat_id).result.title
local usuarios = api.getChatMembersCount(chat_id).result
local id_mensaje = api.sendMessage(msg.chat.id, "`Se paciente , puede tardar de 1 a 2 minutos dependiendo de la conexion.`", true).result.message_id
mensaje = msg.message_id + 1
sleep(2)
api.editMessageText(msg.chat.id, mensaje, '`Buscando .`', false, true)
sleep(1)
api.editMessageText(msg.chat.id, mensaje, '`Buscando ..`', false, true)
sleep(1)
api.editMessageText(msg.chat.id, mensaje, '`Buscando ...`', false, true)
sleep(1)
api.editMessageText(msg.chat.id, mensaje, '`Buscando ....`', false, true)
sleep(1)
api.editMessageText(msg.chat.id, mensaje, '`Buscando .....`', false, true)
sleep(1)
api.editMessageText(msg.chat.id, mensaje, '`Buscando ......`', false, true)
sleep(0.2)
api.editMessageText(msg.chat.id, mensaje, '`Buscando .`', false, true)
sleep(0.2)
api.editMessageText(msg.chat.id, mensaje, '`Buscando ..`', false, true)
sleep(0.2)
api.editMessageText(msg.chat.id, mensaje, '`Buscando ...`', false, true)
sleep(0.2)
api.editMessageText(msg.chat.id, mensaje, '`Buscando ....`', false, true)
sleep(0.2)
api.editMessageText(msg.chat.id, mensaje, '`Buscando .....`', false, true)
sleep(0.2)
api.editMessageText(msg.chat.id, mensaje, '`Buscando ......`', false, true)
sleep(0.2)
api.editMessageText(msg.chat.id, mensaje, '`Finalizando y mostrando resultados; creando tabla.`', false, true)
local lista, bot_es_admin = padrino_anticp(msg.chat.id, true)
local mensaje = '\0'
local txt = ''
resgroup = api.getChat(chat_id)
 if not gbans and not usuarios then
  mensaje = '¡Uh, no! Hubo un error: servicio temporalmente fuera de línea...\n "Servidor no conectado a la base de datos"'
elseif lista and bot_es_admin then
  if #lista == 1 then
    txt = txt..'<b>Escaneo  del Sistema Global de Protección de Grupos (AntiCP) completado.</b>\n\n<b>Grupo :</b> '..resgroup.result.title:escape_html()..'\n<b>ID :</b> '..chat_id..'\n<b>Usuarios:</b>'..usuarios..'\n<b>Reportado :</b> '..#lista..'\n\n<b>Usuario Expulsado : '..#lista..'</b>\n'
    mensaje = "*Escaneo del Sistema Global de Protección de Grupos (AntiCP) completado.*\n\n`Grupo :` "..resgroup.result.title:mEscape().."\n`ID : "..chat_id.."`\n`Usuarios :`"..usuarios.."\n`Reportado :` "..#lista.."\n\n*Usuario Expulsado : "..#lista.."*\n"
  else
    txt = txt..'<b>Escaneo del Sistema Global de Protección de Grupos (AntiCP) completado.</b>\n\n<b>Grupo :</b> '..resgroup.result.title:escape_html()..'\n<b>ID :</b> '..chat_id..'\n<b>Usuarios:</b>'..usuarios..'\n<b>Reportados :</b> '..#lista..'\n\n<b>Usuarios Expulsados : '..#lista..'</b>\n'
    mensaje = "*Escaneo del Sistema Global de Protección de Grupos (AntiCP) completado.*\n\n`Grupo :` "..resgroup.result.title:mEscape().."\n`ID : "..chat_id.."`\n`Usuarios :`"..usuarios.."\n`Reportados :` "..#lista.."\n\n*Usuarios Expulsados : "..#lista.."*\n"
  end
  for i=1, #lista, 1 do
    local user = api.getChatMember(msg.chat.id, lista[i].user_id)
    user = user.result.user
    mensaje = mensaje .. "\n "..no_markdown(user.first_name).." (Id: "..user.id..")"
  end
elseif not lista then
  mensaje = "*Escaneo del Sistema Global de Protección de Grupos (AntiCP) completado.*\n\n`Grupo :` "..resgroup.result.title:mEscape().."\n`ID : "..chat_id.."`\n`Usuarios : "..usuarios.."`\n`Reportados : 0`\n\n`El grupo `"..resgroup.result.title:mEscape().." `esta libre de usuarios reportados .`"
elseif lista then
  mensaje = "*Escaneo del Sistema Global de Protección de Grupos (AntiCP) completado.*\n\n`Grupo :` "..resgroup.result.title:mEscape().."\n*Error*: *"..#lista.."* `usuario/s reportado/s.`\n\n`Pero no soy administrador para expulsarlo/s .`\n\n"
else
  mensaje = "*Error*: `el bot no es administrador.`"
end
api.editMessageText(msg.chat.id, id_mensaje, mensaje, false, true)
api.sendMessage(config.log_chat, txt, 87)
end
sis._exit(0)
end
end
return {
action = action,
triggers = {
  '^[/!](scan)$'
}
}
