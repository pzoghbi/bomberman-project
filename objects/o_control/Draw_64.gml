/// @description 

//	draw_text(0, 16, string("Unassigned gamepads"));
//for(var i = 0; i < ds_list_size(global.gamepads_unassigned); i++){
//	draw_text(0, 32*i + 32, string(global.gamepads_unassigned[|i]));
//}



//	draw_text(250, 16, string("Unused gamepads"));
//for(var i = 0; i < ds_list_size(global.gamepads_unused); i++){
//	draw_text(250, 32*i + 32, string(global.gamepads_unused[|i]));
//}

//	draw_text(450, 16, string("Used gamepads"));
//for(var i = 0; i < ds_list_size(global.gamepads_using); i++){
//	draw_text(450, 32*i + 32, string(global.gamepads_using[|i]));
//}

draw_set_halign(fa_center);
if (alarm[1]) 
{
	floating_text = string(ceil(alarm[1]/ONE_SEC));
}
draw_set_color(c_lime);
draw_text_transformed(room_width/2, room_height/2, floating_text, 2.0, 2.0, 0.0);
draw_set_color(c_white);

var gamepad_count = 0;
if (instance_exists(Input))
{
	gamepad_count = ds_list_size(Input.gamepads);
}
if (global.game_state == "") 
{
	if (keyboard_enabled) 
	{
		/* draw keyboard gui */
		var draw_x = 32;
		var draw_y = room_height*3/4;
		draw_sprite(s_gui_keyboard, 0, draw_x, draw_y);
		draw_text(draw_x+16, draw_y+15, playerwins[? KEYBOARD]);
		
		/* draw controller gui */
		for(var i = 0; i < clamp(gamepad_count, 0, 3); i++)
		{
			var draw_x =  room_width*(i+1)/5 + 32;
			var draw_y =  room_height*3/4;
			var sprite = s_gui_controller;
			draw_sprite(sprite, i, draw_x, draw_y);
			var key = ds_list_find_value(Input.gamepads, i);
			draw_text(draw_x+sprite_get_width(sprite)/2, draw_y+15, playerwins[? key]);
		} 
	} 
	else 
	{
		/* draw controller gui */
		for(var i = 0; i < gamepad_count; i++)
		{
			var draw_x =  room_width*i/5 + 32;
			var draw_y =  room_height*3/4;
			var sprite = s_gui_controller;
			draw_sprite(sprite, i, draw_x, draw_y);
			var key = ds_list_find_value(Input.gamepads, i);
			draw_text(draw_x+sprite_get_width(sprite)/2, draw_y+15, playerwins[? key]);
		}
	}
	
	
	draw_set_halign(fa_left);
	
	// show joined players text
	if (gamepad_count < 4) {
		var alpha = abs(lengthdir_x(1, X++));
		draw_set_alpha(alpha);
		draw_text(32, room_height * 7/11, "Press Start to join " + string(gamepad_count+keyboard_enabled) + "/4");
		draw_set_alpha(1);
	}
}