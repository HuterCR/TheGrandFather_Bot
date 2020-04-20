local function action(msg, blocks, ln)
    
    local questions = {
        '¿Qué hace o de qué es este bot?',
        'Exactamente, ¿Qué hace este bot?',
        'He añadido al bot, pero dice que necesita admin para ciertos comandos. ¿Por qué?',
        'Dices que puedo añadir bienvenida y reglas, ¿Cómo?',
        '¿Qué significa que un usuario está globalmente baneado?',
        '¿Por qué a veces el bot demora un par de segundos en contestar?',
        'Me gustaría tener un bot similar propio, ¿Qué debo hacer?',
        'Quisiera hablar con ustedes, ¿Cómo hago?',
        'Why I\'m warned by the bot to reply to someone, even if I\'ve replied to a message?',
        'Can you add <insert the language here> language?',
        'What does this bot store? Why can he access all the messages?',
        'Can you advertise my channel/bot in your channel/bot?',
        'How do I report a bug? Which informations do you need?',
        'How many groups does the bot administrate?',
        'What can the bot owner do?',
        'Some strings of my language are not updated. What can I do?',
        'Why this faq are not translated in the supported languages?',
        'Why this faq are not sent with an inline keyboard?',
        'Why the bot doesn\'t report something flagged with the @admin command to all the group admins?',
        'A bot is spamming, why the antiflood can\'t kick it?',
        'Would you like to collaborate to a project? Like a groups network?',
        'Where are you from?',
        'Can I move my group info to another group?',
        'Will you ever add other plugins not related to the group administration? Like something to search on google, to get a definition from UD..?',
        'Please add an anti-emoji system',
        'Can you make the "anti media" directly kick/ban instead of warn? Or can you make the number of warns configurable?',
        'Can you make something to block only Telegram links?',
    }
    


    local answer = {
        'El Padrino es un *bot moderador de grupos*, puede expulsar a usuarios molestos como los árabes y los flooders. Tiene una lista anti pedófilos que expulsa a un usuario reportado.)',
        'El Padrino puede: expulsar, bloquear y advertir a los usuarios que desees; impide la entrada de pedófilos, puede restringir el envío de cierta multimedia (como stickers o link), puede dar la bienvenida a nuevos miembros y establecer un reglamento para tus grupos individualmente, permite expulsar a bots de tus grupos si son añadidos por usuarios, expulsa o bloquea árabes si así lo configuras, impide el envío masivo de mensajes en poco tiempo y más funciones pronto.',
        'Para que ciertas funcionen puedan ser ejecutadas, El Padrino necesita ser administrador; funciones como ban, kick no pueden ser ejecitadas sin ser admin. Si le quieres dar admin, solo ve a la lista de administradores, añadir administrador y escribe el alias del bot. También puedes ir a la lista de chats, al seleccionar el bot con click sostenido, podrás ver la opción para ascender a admin. [Android].',
        'Para añadir una bienvenida, solo envía /welcome , seguido del mensaje de bienvenida. Más info: /help » Todos los comandos » Ajustes de bienvenida.\n\nPara añadir reglas, envía /setrules seguido de tus reglas. Puedes revisar esto en «Ajustes Generales».',
        'Los usuarios globalmente baneados son usuarios que no siguieron los términos y condiciones y/o son ususrios muy molestos y/o son usuarios reportados por hechos punibles (condenable por la ley). El Padrino expulsará automáicamente a dichos usuarios. Todas las IDs en la lista de gban tienen una razón y evidencia. El pernitir a estos usuarios bajo la administración (o no) de El Padrino significa una violación grave a nuestros TOS (términos y condiciones).',
        'Actualmente El Padrino está en fase BETA pública, por lo que podría presentar alguna falla puntual. No te preocupes, estamos trabajando para llevarte la mejor experiencia.',
        'Actualmente no recomendamos hacer uso de nuestro código para crear tu propio bot, pero si insistes, puedes hablar con @HuterCR, él te dará instruccones. Si quieres el código de este bot, estará bajo tu responsabilidad el mantenimiento del mismo, pero puedes contratar nuestros servicios de manteniniento. (Preguntar en privado por nuestros planes mensuales)',
        'Siempre puedes contactarnos a través de nuestro geupo de soporte, a @HuterCR y @EveryBodyOnHp y a través del comando «!». Con este último solo escribe !, seguido del texto a enviar a los desarrolladores en el privado del bot.',
        'This usually happens if you reply to a message of an user that contains the username of another bot. So the message can\'t be seen by GroupButler.',
        'I can\'t, I know only my native language (_italian_ ) and my English, as you can see, it\'s not good.\nBut you can :) Translations are open to everyone: if you need the bot to talk in your native language, you are free to translate all (or only partially) the strings of the bot.\n To see how, send /help in the private chat with the bot, tap on "all commands", then on "admin", and then on "languages". There you will find all the instructions.',
        'The bot has the acces to all the messages because it needs to see replied messages. And, another thing: when a bot is promoted as admin, it has always access to all the messages, no matter of the settings of BotFather.\nAbout what the bot stores:\n- Description, rules, #extra commands, welcome message if customized\n- It stores the ID associated with its username of every user it find: this is needed for commands by username\n- It stores the number of messages sent by a user in a group and the number of commands used by a user\n\nMedia and messages are not stored by the bot, it\'s something it will never do.',
        '*No*. I don\'t care if you will return the favor or how many subscribers you channel has.\nI\'m saying this because I\'m tired to receive all this kind of requests.',
        'I really appreciate any kind of bug report. It would be great if you provide some extra info to the message, for example: if the bot has replied something, if it happened more than one time, if you are facing the problme in other groups too, if the group is a normal group or a supergroup. I really like screenshots too, you can forward me an image by sending it to the bot and then replying to it with "/c".\nAh, an "hello" to start the message will be really appreciated :)',
        'Wew, I don\'t know the right answer. Probably around 1500 groups. My counter shows 3600, but considering the bot sometimes doesn\'t know when it is removed from a group, I assume that I should take for good 1/2 of the number displayed.\nOther numbers: the bot has been started by almost 10.000 users, and has processed more or less 8 milion messages, and received almost 300.000 queries',
        'Well, not much, all the privileged functions are made for debugging purpose.\nThe most rilevant functions I can use: see the bot stats, query the database, broadcast to groups and users (even if I never do it, i find it annoiyng for users), send a message in a group/to an user, post in the selected channel with the bot, make the bot leave a chat, turn on the admin mode (the bot can\'t be added to new groups), migrate the group info to a new group, global ban an user (even if I won\'t never use this function), block an user (will be ignored by the bot). And some other useless things',
        'If you want to translate them, you can run "/strings [your language code]" to get the most updated file with all the translated and untranslated strings. The steps to follow are the same of a normal translation',
        'Because I\'m lazy :P',
        'Will arrive ;)',
        'Probably, they haven\'t started the bot yet. Bots can\'t write to an user if not started first',
        'Bots can\'t see the messages sent by other bots, so it\'s not possible to detect the spam from other bots',
        'No, sorry but I\'m not interested in ths kind of things. I don\'t want to associate the bot with small/big Telegram Networks or with other bots which do the same thing.',
        'This could sound wierd, but a lot of people start a conversation with this question. I\'m from Italy. And, just to put the record straight, the "/c" command is not intended to start a random conversation with me. It shoud be a fast way to get direct support, nothing else.',
        'Yes, yes you can. But you need to contact me with "/c" command, and provide the ids of both the old and the new groups. And you need to be the creator of both the groups, or at leat creator of the old and admin of the new one.',
        'No, I\'m not going to add recreative things. I want to keep the bot focused on what is doing now, and less invasive as possible in the group chat.',
        'I\'m not going to add this dictatorial things. In my opinion, the bot already allows you to block everything could be source of spam or off-topic in a group, and for me it already feels like an Hitlerian weapon for a paranoid admin.',
        'This "media warns" system will change as soon as I have some time to make some tests. For now it will stay as it is. My idea is to allow Admins to choose how many warns are needed to kick someone for posting a forbidden media. I\'ll see',
        'No, the current system uses a nice field in the messages object given by the api that includes all the links in a message, I\'m not going to add other plugins with arranged triggers only for Telegram links. I\'m sorry :(',
        
    }
    
    local text
    
    if not blocks[2] then
        local i = 1
        text = '*All the available questions*. Type `/faq [question number]`  to get the anwer\n\n'
        for k,v in pairs(questions) do
            text = text..'*'..i..'* - `'..v..'`\n'
            i = i + 1
        end
        api.sendMessage(msg.from.id, text, true)
    end
    if blocks[2] then
        local n = tonumber(blocks[2])
        if n > #answer or n == 0 then
            api.sendMessage(msg.from.id, '_Number not valid_', true)
        else
            text = '*'..questions[n]..'*\n\n'..answer[n]
            api.sendMessage(msg.from.id, text, true)
        end
    end
end
    
return {
    action = action,
    triggers = {
        '^/(faq)$',
        '^/(faq) (%d%d?)',
    }
}
