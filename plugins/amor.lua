local action = function(msg, blocks)

if blocks[1] == "hug" then
if msg.reply then
    local text
local  usera = msg.reply.from.first_name
local userb = msg.from.first_name
    text = '¡Abrazo para ti, '..usera..', de parte de '..userb..'!\n:3'
api.sendReply(msg, text)
else
local userb = msg.from.first_name
local username = msg.from.username
local textb
    textb = '¡Abrazo para para ti, '..userb..'!\n:3'
api.sendReply(msg, textb)

end
end
end


--if msg.reply then
--api.sendReply(msg,'¡Abrazo para tí, ['..msg.reply.from.first_name..'](t.me/'..msg.reply.from.username..') de parte de ['..msg.from.first_name..'](t.me/'..msg.from.username..')!\n:3', true)
--else
--api.sendReply(msg,'¡Abrazo para tí, ['..msg.from.first_name..'](t.me/'..msg.from.first_name..')!\n:3',true)
 
   

  -- end
    
 --end
--end


return {
     action = action,
     triggers = {'^/(hug)$',}
}
