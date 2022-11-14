/// @description 
// keyboard_input
#region keyboard_input
var kb_map = ds_map_find_value(devices, "keyboard");
var left = keyboard_check(vk_left);
var right = keyboard_check(vk_right);
var up = keyboard_check(vk_up);
var down = keyboard_check(vk_down);
var fire = keyboard_check(vk_space);
var start = keyboard_check_pressed(vk_space);
kb_map[? "left"] = left;
kb_map[? "right"] = right;
kb_map[? "up"] = up;
kb_map[? "down"] = down;
kb_map[? "fire"] = fire;
kb_map[? "start"] = start;

// set new values to keyboard list
#endregion

#region gamepad_input
for (var i = 0; i < ds_list_size(device_list); i++)
{
	var gamepad_id = ds_list_find_value(device_list, i);
	var gamepad_name = "gp_" + string(gamepad_id);
	
	// destroy the disconnected gamepad
	if not gamepad_is_connected(gamepad_id)
	{
		if ds_map_exists(devices, gamepad_name)
		{
			ds_map_delete(devices, gamepad_name);
		}
	}
	// map gamepad inputs
	else
	{
		// create a map of inputs for this gamepad
		if not ds_map_exists(devices, gamepad_name) {
			var gamepad_input = ds_map_create();
			ds_map_add_map(devices, gamepad_name, gamepad_input);
			ds_map_add(gamepad_input, "id", gamepad_id);
		}
		// fill existing map with new values
		else
		{
			var gp_map = ds_map_find_value(devices, gamepad_name);
			/*===============================================
			== now listen to all inputs on this controller ==
			===============================================*/
			var left	= gamepad_axis_value(gamepad_id, gp_axislh) < -0.5;
			var right	= gamepad_axis_value(gamepad_id, gp_axislh) > 0.5;
			var up		= gamepad_axis_value(gamepad_id, gp_axislv) < -0.5;
			var down	= gamepad_axis_value(gamepad_id, gp_axislv) > 0.5;
			var fire	= gamepad_button_check_pressed(gamepad_id, gp_face1);
			var start	= gamepad_button_check_pressed(gamepad_id, gp_start);
			
			gp_map[? "left"] = left;
			gp_map[? "right"] = right;
			gp_map[? "up"] = up;
			gp_map[? "down"] = down;
			gp_map[? "fire"] = fire;
			gp_map[? "start"] = start;
		}
	}
}
#endregion