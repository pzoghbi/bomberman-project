/// @description 

draw_set_halign(fa_left);

if !surface_exists(console_overlay_surface)
{
	console_overlay_surface = surface_create(1024, 1024);
}

if console_overlay_enabled 
{
	if surface_exists(console_overlay_surface)
	{
		surface_set_target(console_overlay_surface);
		draw_clear_alpha(c_black, 0.5);
	
		// write permanent messages
		for (var i = 0; i < ds_list_size(message); i++) 
		{
			var _x = 50;
			var _y = 50;
			var str = ds_list_find_value(message, i);
			var col = c_lime;
			var alp = 1.0;
			var height = string_height("A");
			draw_text_color(_x, _y + (height * i), str, col, col, col, col, alp);
		}
	
		// write temporary messages
		for (var i = 0; i < ds_list_size(temp_message); i++) 
		{
			var _x = 100;
			var _y = 50;
			var val = ds_list_find_value(temp_message, i);
			var str = val[0];
			var timeout = val[1];
			var col = c_yellow;
			var alp = 1.0;
			var width = list_max_string_length(message);
			var height = string_height("A");
			if timeout
			{
				draw_text_color(max(_x + width, 250), _y + (height * i), str, col, col, col, col, alp);	
				ds_list_replace(temp_message, i, [str, --timeout]);
			} 
			else 
			{
				ds_list_delete(temp_message, i);
			}
		}
	
		// write console commands
		if console_write_enabled
		{
			var x1, y1, x2, y2, col, alp;
			x1 = 25;
			y1 = room_height - string_height("A") - 25;
			x2 = room_width - 25;
			y2 = room_height -25;
			col = c_ltgray;
			alp = 1.0;
			draw_rectangle_color(x1, y1, x2, y2, col, col, col, col, false);
			col = c_black;
			draw_set_valign(fa_top);
			draw_text_color(x1, y1, console_input_field, col, col, col, col, alp)
		}
	
		surface_reset_target();
		draw_surface_stretched(console_overlay_surface, 0, 0, room_width, room_height);
	}
}
