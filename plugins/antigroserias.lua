local action = function(msg, blocks, ln)
	
	if not (msg.chat.type == 'private') and is_mod(msg) then return end

    if db:hget('chat:'..msg.chat.id..':settings', 'groseria') == 'disable' then
	   local iduser = msg.from.id
    local name = msg.from.first_name
    if msg.from.username then name = name..' (@'..msg.from.username..')' end
    math.randomseed( os.time() );
    var = math.random(0,4); math.random(0,4); math.random(0,4);
    if var == 0 then
        api.sendMessage(msg.chat.id, 'Hey *' ..name.. '* ID '..iduser..', Cuida tu lenguaje o serás expulsado', true)
	   elseif var == 1 then
 	   	api.sendMessage(msg.chat.id, 'Recuerda *' ..name.. '* ID '..iduser..', no usar un mal lenguaje aquí, o serás expulsado/a', true)
	   elseif var == 2 then
 	   	api.sendMessage(msg.chat.id, 'Lo siento, *' ..name.. '*, ID '..iduser..', expulsado/a por grosero/a', true)
 	   api.kickUser(msg.chat.id, msg.from.id)
	   elseif var == 3 then
  	   	api.sendMessage(msg.chat.id, '*' ..name.. '* ID '..iduser..', si sigues enviando malas palabras serás baneado/a definitivamente', true)
  	 elseif var == 4 then
  	   	api.sendMessage(msg.chat.id, 'Lo siento *' ..name.. '*, ID '..iduser..', baneado/a por grosero/a.', true)
 	   api.kickChatMember(msg.chat.id, msg.from.id)
  end
end
end
 return {
	action = action,
	triggers = {
            "[Pp][Uu][Tt](.*)",
            "[Mm][Ii][Ee][Rr][Dd][Aa]",
            "[Ii][Dd][Ii][Oo][Tt][Aa]",          
            "[Pp][Aa][Rr][Ii][Dd](.*)",
            "[Ff][Uu][Cc][Kk]",
            "[a][d][e][f][e][s][i][o]",
            "[b][a][l][u][r][d][e] ",
            "[b][o][l][u][d][o]",
            "[C][a][b][r][ó][n]",
            "[c][a][c][h][i][m][b][a]", 
            "[c][a][g][a][r]",
            "[c][e][r][o][t][e]",
            "[c][h][i][n][g][a][t][u][m][a][d][r][e]",
            "[c][h][i][n][g][a][r]",
            "[c][h][u][c][h][a]",
            "[c][o][j][i][d][o]",
            "[c][o][j][o][n][e][s]",
            "[C][o][m][e][m][i][e][r][d][a]", 
            "[c][o][n][c][h][a]",
            "[C][o][n][c][h][u][d][o]",
            "[c][o][ñ][o]",
            "[C][o][r][n][u][d][o]", 
            "[C][u][l}[e}[a][d][o]",
            "[c][u][l][e][r][o]",
            "[g][i][l][i][p][o][l][l][a][s]",
            "[J][i][l][i][p}[o][l][l][a][s]",
            "[j][o][d][e][r]",
            "[M][a][l][e][t][ó][n]", 
            "[m][a][m][a][g][u][e][v][o]",
            "[m][a][m][o][n]",
            "[m][a][r][i][c][o][n]",
            "[M][a][r][r][i][c][o][n]",  
            "[o][r][t][o]",
            "[P][a][j][e][r][o]", 
            "[P][a][n][o][c][h][a]", 
            "[p][a][p][a][l][l][o][n][a]",
            "[P][a][p][a][y][o][n][a]",
            "[P][e][l][o][t][u][d][o]",
            "[p][e][n][d][e][j][o]",
            "[p][i][n][c][h][e]",
            "[p][i][n][g][a]",
            "[S][o][p][l][a][n][u][c][a][s]", 
            "[T][a][r][a][d][o]",
            "[V][e][j][i][g][a]",
            "[v][e][r][g][a]",
            "[z][o][r][r][a]",
            "[Ii][Mm][Bb][Ee][Cc][Ii][Ll]",
            "[Ss][Hh][Ii][Tt]"
}
}
