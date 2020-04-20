local triggers = {
	'^![Cc](cc)$',
	}
local action = function(msg, blocks)

if db:hget('chat:'..msg.chat.id..':settings', 'codes') == 'enable' then
local d = blocks[1]
api.sendMessage(msg.chat.id, d, true) 
end

local action = function(msg, blocks, ln)
  if blocks[1] == 'cc' then
	nombre = msg.from.first_name
	math.randomseed(os.time());
	end
 	var = math.random(0,4);
	if var == 0 then
   		api.sendMessage(msg.chat.id, ' •.• Tira otra...', true)
	elseif var == 1 then
 	   api.sendMessage(msg.chat.id, ' °.° casi', true)
	elseif var == 2 then
 	   api.sendMessage(msg.chat.id, 'Por poco  0.0', true)
	elseif var == 3 then
  	   api.sendMessage(msg.chat.id, '°-°', true)
  	elseif var == 4 then
  	   api.sendMessage(msg.chat.id, 'Pues *' ..nombre.. '*, *•* Has muerto.', true)  
  end
end
end
return {
	action = action,
	triggers = triggers
}
