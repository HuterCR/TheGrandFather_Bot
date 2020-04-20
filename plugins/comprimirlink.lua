 local action = function(msg, matches, ln)
	api.sendMessage(msg.chat.id, make_text '*Hola Amig@.*\n\n Te invito a ingresar a este [*Link*](' ..matches[1].. ')\n\n Link por el usuario @'..msg.from.username..' (ID User: '..msg.from.id..')', true)
	mystat('/comprimir') --save stats
end

return {
	action = action,
	triggers = {
		'^/[Cc]omprimir (.*)$'
	}
}
