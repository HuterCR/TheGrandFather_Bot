local action = function(msg, blocks)
if blocks[1] == 'a' then
api.sendReply(msg, make_text '*ERROR*\n`Debes formular una pregunta cerrada, luego yo responderé  sí o no`.', true)
end
end

return {
     action = action,
     triggers = {
         '^/[Cc]aracolamagic(a)$',
         '^/[Cc]aracol(a)$',
         '^/ser(a)$'
}
}
