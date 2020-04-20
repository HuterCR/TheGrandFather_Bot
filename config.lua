return {
	bot_api_key = io.open("./data/key","r"):read(),
	version = '4.1', -- /aupdate for v3.1
	testing_mode = false,
	cmd = '^[/!#]',
	admin = {
		owner = 324313727,
		admins = {
			[250301329] = true, --EMANUEL
			[27840971]= true, --ERICK
			--[180791241] = true, --WEBROM
		},
	},
	log_chat = -1001101240169, --LOGS de grupos (Informe de El Padrino)

bot_settings = {
    cache_time = {
      adminlist = 18000, --5 hours (18000s)
    },
    testing_mode = true,
    multipurpose_mode = true,
    inline_mode = true,
    plugins_esenciales = true,
    plugins_opcionales = true,
    plugins_test = false,
    debug_connections = false,
    notify_bug = false,
    log_api_errors = true
  },




	channel = 'Moderador_Channel', --channel username with the '@'
	help_group = 'https://t.me/TheGrandFather', --group link, not username!
	languages = 'languages.lua',
	plugins_esenciales = {
		'onmessage.lua',
		'plugins.lua',
       --	'vardump.lua',
       		'res.lua',
		'linktg.lua',
     		'linkshp.lua',
		'configure.lua',
		'all.lua',
		'admin.lua',
		'banhammer.lua',
		'gban.lua',
		'cpgbanner.lua',
		'spamgbanner.lua',
		'users.lua',
		'help.lua',
		'rules.lua',
		'settings.lua',
		'about.lua',
		'flag.lua',
		'service.lua',
		'links.lua',
		'warn.lua',
		'setlang.lua',
		'floodmanager.lua',
		'mediasettings.lua',
		'private.lua',
		'test.lua',
		'codes.lua',
		'comandos.lua',
		'anti-spampro.lua',
		
 
	},
	plugins_opcionales = {
	    --"findpedoss.lua", inactivo conexion al api de Linux Bot (Fuera de Servicio)
       "scanout.lua", --Temporal
       "amor.lua", --Petición de usuario
       "beta.lua", --beta para para antispam
		"res.lua",
       --"antispam.lua", beta para antispam
		"spamgbanner.lua",
		"cpgbanner.lua",
		"calculator.lua",
		"test.lua",
		'chatmodules.lua',
		'faq.lua',
		'caracola.lua',
		'comprimirlink.lua',
		'sendfiles.lua',
		'killer.lua',
		'say.lua',
		'contact.lua',
		'talk.lua',
		'error.lua',
		'saludador.lua',
		'sera.lua',
		'isbanned.lua',
		'antigroserias.lua',
        'vardump.lua',
		'extra.lua'
	},
	plugins_test = {
		'gbanner.lua',
		'inline.lua',
		'plugin2.lua',
	},

	multipurpose_plugins = {},
	available_languages = {
		'es',
		'en'
		--more to come
	},
	media_list = {
		'imagen',
		'audio',
		'video',
		'sticker',
		'gif',
		'voice',
		'contact',
		'file',
		'link',
       'game'
	},
	chat_settings = {
		['settings'] = {
			['Rules'] = 'no',
			['About'] = 'no',
			['Modlist'] = 'no',
			['Report'] = 'no',
			['Welcome'] = 'no',
			['Extra'] = 'no',
			['Flood'] = 'no'
		},
		['flood'] = {
			['MaxFlood'] = 5,
			['ActionFlood'] = 'kick'
		},
		['char'] = {
			['Arab'] = 'allowed',
			['Rtl'] = 'allowed'
		},
		['floodexceptions'] = {
			['image'] = 'no',
			['video'] = 'no',
			['sticker'] = 'no',
			['gif'] = 'no',
          ['game'] = 'no'
		},
		['warnsettings'] = {
			['type'] = 'ban',
			['max'] = 3,
			['mediamax'] = 3
		},
		['welcome'] = {
			['type'] = 'composed',
			['content'] = 'no'
		},
		['media'] = {
			['image'] = 'allowed',
			['audio'] = 'allowed',
			['video'] = 'allowed',
			['sticker'] = 'allowed',
			['gif'] = 'allowed',
			['voice'] = 'allowed',
			['contact'] = 'allowed',
			['file'] = 'allowed',
          ['game'] = 'allowed',
			['link'] = 'allowed',
		},
	},
	chat_custom_texts = {'rules', 'about', 'extra'},
	api_errors = {
		[101] = 'Not enough rights to kick participant', --SUPERGROUP: bot is not admin
		[102] = 'USER_ADMIN_INVALID', --SUPERGROUP: trying to kick an admin
		[103] = 'method is available for supergroup chats only', --NORMAL: trying to unban
		[104] = 'Only creator of the group can kick administrators from the group', --NORMAL: trying to kick an admin
		[105] = 'Bad Request: Need to be inviter of the user to kick it from the group', --NORMAL: bot is not an admin or everyone is an admin
		[106] = 'USER_NOT_PARTICIPANT', --NORMAL: trying to kick an user that is not in the group
		[107] = 'CHAT_ADMIN_REQUIRED', --NORMAL: bot is not an admin or everyone is an admin
		[108] = 'there is no administrators in the private chat', --something asked in a private chat with the api methods 2.1

		[110] = 'PEER_ID_INVALID', --user never started the bot
		[111] = 'message is not modified', --the edit message method hasn't modified the message
		[112] = 'Can\'t parse message text: Can\'t find end of the entity starting at byte offset %d+', --the markdown is wrong and breaks the delivery
		[113] = 'group chat is migrated to a supergroup chat', --group updated to supergroup
		[114] = 'Message can\'t be forwarded', --unknown
		[115] = 'Message text is empty', --empty message
		[116] = 'message not found', --message id invalid, I guess
		[117] = 'chat not found', --I don't know
		[118] = 'Message is too long', --over 4096 char
		[119] = 'User not found', --unknown user_id

		[120] = 'Can\'t parse reply keyboard markup JSON object', --keyboard table invalid
		[121] = 'Field \\\"inline_keyboard\\\" of the InlineKeyboardMarkup should be an Array of Arrays', --inline keyboard is not an array of array
		[122] = 'Can\'t parse inline keyboard button: InlineKeyboardButton should be an Object',
		[123] = 'Bad Request: Object expected as reply markup', --empty inline keyboard table
		[124] = 'QUERY_ID_INVALID', --callback query id invalid
		[125] = 'CHANNEL_PRIVATE', --I don't know
		[126] = 'MESSAGE_TOO_LONG', --text of an inline callback answer is too long
		[127] = 'wrong user_id specified', --invalid user_id
		[128] = 'Too big total timeout [%d%.]+', --something about spam an inline keyboards
		[129] = 'BUTTON_DATA_INVALID', --callback_data string invalid

		[130] = 'Type of file to send mismatch', --trying to send a media with the wrong method
		[131] = 'MESSAGE_ID_INVALID', --I don't know
		[132] = 'Can\'t parse inline keyboard button: Can\'t find field "text"', --the text of a button could be nil
		[133] = 'Can\'t parse inline keyboard button: Field \\\"text\\\" must be of type String',
		[134] = 'USER_ID_INVALID',
		[135] = 'CHAT_INVALID',

		[403] = 'Bot was blocked by the user', --user blocked the bot
		[429] = 'Too many requests: retry later', --the bot is hitting api limits
		[430] = 'Too big total timeout', --too many callback_data requests
	}
}
