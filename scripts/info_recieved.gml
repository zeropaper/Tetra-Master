if (!obj_game.network_recieved_hand)
    show_debug_message("haven't recieved hand")

if (!obj_game.network_recieved_grid)
    show_debug_message("haven't recieved grid")
    
if (obj_game.network_first_turn == NO_TURN)
    show_debug_message("haven't recieved first turn")

return (obj_game.network_recieved_hand && 
        obj_game.network_recieved_grid && 
       (obj_game.network_first_turn != NO_TURN))
