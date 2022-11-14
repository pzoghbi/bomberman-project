/// @description 

/* listen for button presses */
var left = 0, right = 0, up = 0, down = 0, bomb = 0;

if instance_exists(o_input) 
{
	if ds_exists(o_input.devices, ds_type_map)
	{
		var map = o_input.devices;
		var list = ds_map_find_value(map, "keyboard");
		for(var i = 0; i < ds_list_size(list); i++)
		{
			left += ds_list_find_value(list, i) == vk_left;
			right += ds_list_find_value(list, i) == vk_right;
			up += ds_list_find_value(list, i) == vk_up;
			down += ds_list_find_value(list, i) == vk_down;
			bomb += ds_list_find_value(list, i) == vk_space;
		}
	}
}

buffer_seek(mybuffer, buffer_seek_start, 0);
buffer_write(mybuffer, buffer_u8, CMD_KEY);
buffer_write(mybuffer, buffer_u32, left);
buffer_write(mybuffer, buffer_u32, right);
buffer_write(mybuffer, buffer_u32, up);
buffer_write(mybuffer, buffer_u32, down);
buffer_write(mybuffer, buffer_u32, bomb);
network_send_packet(connect, mybuffer, buffer_tell(mybuffer));
