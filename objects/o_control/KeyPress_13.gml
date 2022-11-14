/// @description 
//room_goto(choose(
//_DefaultStage
//));
if (global.game_state==""){	
	
	/*
	 *	========================
	 *	new code above this line
	 *	========================	
	*/
	
	playercount = ds_list_size(Input.gamepads) + ds_map_exists(playerwins, KEYBOARD);

	if !(playercount > 1){
		floating_text = "Need more players";
		alarm[0] = 60;
		return;
	}
	
	audio_stop_all();
	audio_play_sound(a_battle_start, 1, false);
	alarm[1] = 3 * ONE_SEC;	// floating text
	// keyboard enabled
	if (keyboard_enabled) {
		var p_pos = player_position[0];
		global.players[0] = instance_create_layer(p_pos[0], p_pos[1], "Instances", o_player);
		
		for(var i = 1; i < playercount; i++){
			var p_pos = player_position[i];
			global.players[i] = instance_create_layer(p_pos[0], p_pos[1], "Instances", o_player);
			global.players[i].image_blend = player_colors[i-1];
		}
	// gamepad only
	} else {
		for(var i = 0; i < playercount; i++){
			var p_pos = player_position[i];
			global.players[i] = instance_create_layer(p_pos[0], p_pos[1], "Instances", o_player);
			global.players[i].image_blend = player_colors[i];
		}
	}	
	ds_list_shuffle(global.itemlist);
	global.game_state="ready";
	alarm[9] = ONE_SEC * 30;	// increase players' intensity (powers)
}