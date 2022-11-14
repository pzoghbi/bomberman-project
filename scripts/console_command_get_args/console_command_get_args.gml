/// @desc Takes array of argument names and converts them into real arguments
var args = argument0;

if is_array(args)
{
	for(var i = 0; i < array_length_1d(args); i++)
	{		
		// get numbers in this string
		if string_length(string_digits(args[i])) > 0 
			and	not string_length(string_letters(args[i]))
		{
			args[i] = real(args[i]);
		}
		// get letters in this string
		else if string_length(string_letters(args[i]))
		{
			if asset_get_index(args[i])
			{
				args[i] = asset_get_index(args[i]);
			}
			else
			{
				args[i] = string(args[i]);
			}
			// todo make better
			//args[i] = !args[i] ? string_letters(args[i]) : args[i];
		}
	}
}
else
{
	console_write("Warning: Invalid; input not an array.");
}

return args;