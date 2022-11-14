/// @description 

/* calibration */
var seen_device = false;
for(var gp=0; gp<12; gp++) {
	if gamepad_button_check_pressed(gp, gp_start) {
		if (ds_list_find_value(gamepads, gp) == gp) {
			exit;
		} else {
			if (seen_device){
				// to store that this device (not neccessarily the 'gamepad') has been assigned
				seen_gp[? gp] = true;
			} else {
				if !(seen_gp[? gp]){
					ds_list_add(gamepads, gp);
					o_control.playerwins[? gp] = 0;
					// to store that this 'gamepad' has been assigned
					seen_gp[? gp] = true;
					// to let know that the next input that returns true is of same device
					seen_device = true;
				}
			}
		}
	}
}

/* gamepad inputs */ 
for(var gp = 0; gp < ds_list_size(gamepads); gp++){
	var this_gamepad = ds_list_find_value(gamepads, gp);
	var ke = o_control.keyboard_enabled;
	var this_player;
	if ke {
		this_player = global.players[gp+o_control.keyboard_enabled];
	} else {
		this_player = global.players[gp];
	}
	// if a player dies, skip this part of loop
	if gamepad_is_connected(this_gamepad){	
		/* disconnecting gamepads */
		if (gamepad_button_check(this_gamepad, gp_start) 
		and gamepad_button_check_pressed(this_gamepad, gp_face4)) 
		{
			var index = ds_list_find_index(gamepads, this_gamepad);
			ds_list_delete(gamepads, index);
			seen_gp[? this_gamepad] = false;
			with (this_player){
				is_dead = true;
			}		
			with (o_control) {
				alarm[0] = ONE_SEC*1;
				floating_text = "o_player dropped";
			}
			return;
		}
		
		if !instance_exists(this_player) continue;	
		/* axis */
		/* left analog */
		// left and right
		/// moving left
		if (gamepad_axis_value(this_gamepad, gp_axislh) < -0.5){
			this_player.input_left = true;
		} else {
			this_player.input_left = false;
		}	
		/// moving right
		if (gamepad_axis_value(this_gamepad, gp_axislh) > 0.5){
			this_player.input_right = true;
		} else {
			this_player.input_right = false;
		}
		// up and down
		/// moving up
		if (gamepad_axis_value(this_gamepad, gp_axislv) < -0.5){
			this_player.input_up = true;
		} else {
			this_player.input_up = false;
		}	
		/// moving down
		if (gamepad_axis_value(this_gamepad, gp_axislv) > 0.5){
			this_player.input_down = true;
		} else {
			this_player.input_down = false;
		}
	/* right analog */
	/* buttons */
		/* option buttons */
		if (gamepad_button_check_pressed(this_gamepad, gp_start)){
			this_player.input_pause = true;
		}
		/* face buttons */
		if (gamepad_button_check(this_gamepad, gp_face2)){
			this_player.input_bomb = true;
		} else {
			this_player.input_bomb = false;
		}
		/* triggers and back buttons */
	}
}

/* KEYBOARD INPUT */
// init keyboard
if global.game_state == "" {
	if keyboard_check_pressed(vk_space) {
		if !(o_control.keyboard_enabled)
		{
			o_control.playerwins[? KEYBOARD] = 0;
			o_control.keyboard_enabled = true;
		}
	} 
	// remove keyboard
	if keyboard_check_pressed(vk_escape){
		ds_map_delete(o_control.playerwins, KEYBOARD);
		o_control.keyboard_enabled = false;
	}
} else if (global.game_state == "play") {
	if (o_control.keyboard_enabled){
		var this_player = global.players[0];	
		if !instance_exists(this_player) exit;
		if (keyboard_check(vk_space)) {
			this_player.input_bomb = true;
		} else {
			this_player.input_bomb = false;
		}

		if (keyboard_check(vk_left)) {
			this_player.input_left = true;
		} else {
			this_player.input_left = false;
		}	
		/// moving right
		if (keyboard_check(vk_right)){
			this_player.input_right = true;
		} else {
			this_player.input_right = false;
		}
		// up and down
		/// moving up
		if (keyboard_check(vk_up)){
			this_player.input_up = true;
		} else {
			this_player.input_up = false;
		}	
		/// moving down
		if (keyboard_check(vk_down)){
			this_player.input_down = true;
		} else {
			this_player.input_down = false;
		}
	}
}

//for(var gp = 0; gp < ds_list_size(gamepads); gp++) {
	
//}