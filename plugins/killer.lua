local triggers = {
	'^[Mm]ata a (.*)$',
        '^[Bb]ot mata a (.*)$'
}

local action = function(msg, matches, blocks, ln)

        api.sendMessage(msg.chat.id, '_Llamando a Terminator..._\n_Matando a ' ..matches[1]..'_...', true)
	api.sendVideo(msg.chat.id, './enviar/Gif/giphy.mp4')
 

    end
    
 return {
	action = action,
	triggers = triggers
}
