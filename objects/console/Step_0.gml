/// @description 

if keyboard_check_pressed(192) {
	console_overlay_enabled = !console_overlay_enabled;
}

if console_overlay_enabled
{
	depth = -10000;
	if keyboard_check_pressed(vk_enter) 
	{
		console_write_enabled = !console_write_enabled;
		if !console_write_enabled
		{
			// send a "message" to the console
			if string_length(console_input_field) > 0
			{
				console_write(console_input_field);
				console_command(console_input_field);
				// if console doesn't recognize the message send error
				// allow user to write another message?
				// if console recognizes a part of the message send help
				ds_list_add(command_history, console_input_field);
				command_history_index = ds_list_size(command_history) - 1;
				console_input_field = "";
			}
			else
			{
				return;
			}
		}
		keyboard_lastkey = -1;
		keyboard_string = "";
	}

	if console_write_enabled
	{
		if keyboard_lastkey != -1
		{
			console_input_field = keyboard_string;
			keyboard_lastkey = -1;
		}
	
	}

	// exit console (soft reset)
	if keyboard_check_pressed(vk_escape) 
	{
		command_history_index = -1;
		console_write_enabled = false;
	}
	/*
	if keyboard_check_pressed(vk_up)
	{
		var len = ds_list_size(command_history);
		command_history_index = ++command_history_index mod len;
		console_input_field = ds_list_find_value(command_history, (len-1) - command_history_index);
		keyboard_string = console_input_field;
	}
	
	if keyboard_check_pressed(vk_down)
	{
		// TODO Fix
		var len = ds_list_size(command_history);
		command_history_index = ++command_history_index mod len;
		console_input_field = ds_list_find_value(command_history, command_history_index);
		keyboard_string = console_input_field;
	}*/
	
}