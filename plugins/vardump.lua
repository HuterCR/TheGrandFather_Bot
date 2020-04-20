local action = function(msg, blocks)

if blocks[1] == 'vardump' then
        local vardump = vtext(msg.reply)
        if msg.reply then
         api.sendMessage(msg.chat.id, '<pre>'..vardump..'</pre>', 87)
        end
        end
end

return {
        action = action,
        triggers = {
                '/(vardump)',
        }
}
