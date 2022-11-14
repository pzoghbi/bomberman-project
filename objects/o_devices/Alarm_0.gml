/// @description Check for connected / disconnected devices

alarm[0] = ONE_SEC;

// get updated list of connected devices
for (var i = 0; i < 12; i++)
{
	var is_listed = ds_list_find_index(device_list, i)+1;
	if gamepad_is_connected(i) 
	{
		if not is_listed
		{
			ds_list_add(device_list, i);
		}
	} 
	else 
	{
		if is_listed
		{
			var index = ds_list_find_index(device_list, i);
			ds_list_delete(device_list, index);
		}
	}
}

// forward updated device list to o_input
if ds_list_size(device_list) > 0 
{
	if not instance_exists(o_input) 
	{
		var inst = instance_create_layer(x, y, "Instances", o_input);
		inst.device_list = device_list;
	}
	else
	{
		o_input.device_list = device_list;
	}
}

return;