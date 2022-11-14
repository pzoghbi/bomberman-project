/// @description Write a message to a console
/// @arg string A message to console
/// @arg timeout if message should disappear
var text = string(argument[0]);
var message = object_get_name(object_index) + ": " + text;
if console_exists() 
{
	if string_length(text) > 0
	{
		if (argument_count > 1) 
		{
			// timed message
			var timeout = argument[1];
			ds_list_add(console.temp_message, [message, timeout]);
		} 
		else 
		{	
			// normal message
			ds_list_add(console.message, message);
		}
	}
}
return;