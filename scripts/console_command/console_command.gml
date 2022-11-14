/// @description execute a console command
var command_input = argument[0];
// find the name of command
var cmd_space = string_pos(" ", command_input);
var cmd_start = 1;
var cmd_end = cmd_space - 1;
	cmd_end = !(cmd_end+1) ? string_length(command_input) : cmd_end;
var command = string_copy(command_input, cmd_start, cmd_end);
var success = false;

// check if the command is valid
if console_command_validate(command) 
{
	// find arguments
	var args_start = cmd_space + 1;
	var args_length = string_length(command_input) - cmd_space;
	var command_args = string_copy(command_input, args_start, args_length);
	// split arguments by comma
	var args = split(command_args, ",");
	// get the array of arguments
	args = console_command_get_args(args);
	
	var message = "";
	switch(command)
	{
	case "create":
		#region create
		// check correct syntax
		if array_length_1d(args) == 3
		{
			if !object_exists(args[2]) 
			{ 
				message = "Object " + string(args[2]) + " doesn't exists."
				break;
			}
			var inst = instance_create_layer(args[0], args[1], "Instances", args[2]);
			if inst
			{
				message = "Created " + object_get_name(args[2]) + " (" + string(inst)
					+ ")" + " at (" + string(args[0]) + ", " + string(args[1]) + ").";
			}
		} else {
			message = "Invalid syntax. Correct syntax is \"create x, y, object\".";
		}
		break;
		#endregion
		break;
	case "reboot":
		game_restart();
		break;
	case "restart":
		room_restart();
		console_command("clear");
		message = "Restarting room..";
		break;
	case "clear":
		ds_list_clear(console.message);
		break;	
	case "clearall":
		ds_list_clear(console.message);
		ds_list_clear(command_history);
		break;
	case "set":
		#region set
		/// 3 arguments: object, variable, value
		if array_length_1d(args) == 3
		{
			if instance_exists(args[0])
			{
				with(args[0])
				{
					if variable_instance_exists(id, args[1])
					{
						variable_instance_set(id, args[1], args[2]);
					}
					else
					{
						message = "Variable " + string(args[1]) + 
							" doesn't exist in object: " + object_get_name(args[0]);
					}
				}
			}
			else
			{
				message = "Instance of " + object_get_name(args[0]) + 
					" doesn't exist.";
			}
		}
		break;
		#endregion
	case "quit":
		game_end();
		break;
	default: 
		break;
	}
	success = true;
}
else
{
	message = command + " is not a valid command.";
}
console_write(message);

return success;