/// @description 

console_overlay_enabled = false;
console_overlay_surface = -1;

// list of messages to display on screen
message = ds_list_create();

// list of timeout messages to display
temp_message = ds_list_create();

// enable user writing into console
console_write_enabled = false;
console_input_field = "";


command_history = ds_list_create();
command_history_index = -1;
command_list = ds_list_create();
ds_list_add(command_list, 
			"create",
			"destroy",
			"sprite",
			"move",
			"find",
			"restart"
			);
			
if os_is_network_connected()
{
	console_write("Connected to the internet.", 5*ONE_SEC);
}