/// @description Game states
global.delta_seconds = delta_time / power(10, 6);

var players = instance_number(o_player);
switch(global.game_state){
case "":
	
	// get registered players
		// check there are available spots
		// if there are, assign the next player
			// assign them an available input source as interface
		
	if alarm[0] <= 0 {
		floating_text = "";
	}	
	break;
case "play":
	// see if game is finished
	if (players < 2) {
		alarm[0] = ONE_SEC;
		global.game_state = "fin";
	}
	break;
case "fin":
	if (alarm[0] <= 0) {		
		// find which player won
		for(var i = 0; i < array_length_1d(global.players); i++){
			if (instance_exists(global.players[i]))
			{
				var key;
				if (keyboard_enabled) {
					if (i == 0) {
						key = KEYBOARD;
					} else {
						key = ds_list_find_value(Input.gamepads, i-1);
					}
				} else {
					 key = ds_list_find_value(Input.gamepads, i);
				}
				if (ds_map_exists(playerwins, key)) {
					playerwins[? key] += 1;
				}			
			
				floating_text = "Player " + string(i+1) + " wins.";
				i = array_length_1d(global.players);
			}
		}
		
		// destroy all player objects
		instance_destroy(o_player);
		
		global.game_state = "";
		audio_stop_all();
		audio_play_sound(a_battle_win, 0, false);
		alarm[0] = 3*ONE_SEC;
		room_restart();
	} else {
		// if last player dies, draw!
		if (players == 0) {
			floating_text = "Draw!";
			
			global.game_state = "";
			audio_stop_all();
			alarm[0] = 3 * ONE_SEC;
			room_restart();
		}
	}
	break;
default:
	break;
}
