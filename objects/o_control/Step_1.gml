/// @description Input interface & Player mapping
// device_list 
if size(device_list)
{
	for(var i = 0; i < size(device_list); i++)
	{
		var gp_id = ds_list_find_value(device_list, i);
		var gp_name = "gp_" + string(gp_id);
		var kmap = devices[? gp_name];
		
		// check input
		var start = kmap[? "start"];
		if start
		{
			//console_write(gp_name + " pressed start: " + string(start));
			
			// make the player slots and assign 
			// gamepads to player controllers that will 
			// interit controls for pawns
			for(var i = 0; i < players_max; i++)
			{
				if !ds_map_exists(kmap, "player")
				{
					kmap[? "player"] = i;
				}
			}
		}
	}
}