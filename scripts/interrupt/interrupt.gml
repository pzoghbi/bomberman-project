/// @description Interrupt a program
/// @arg str String to show
/// @arg *abort Force abort
var str = "Interrupted.";
var abort = false;
if argument_count > 0
{
	str = argument[0];
	if is_array(str)
	{
		var new_str = "";
		for (var i = 0; i < array_length_1d(str); i++)
		{
			new_str += string(str[i]);
			if i < array_length_1d(str) - 1 
			{
				new_str +=  ", ";
			}
		}
		str = new_str;
	}
	
	// if argument is number
	if not is_string(str)
	{
		str = string(str);
	}
	// option to abort
	if argument_count > 1
	{
		if is_string(abort)
		{
			abort = true;
		} 
		else {
			abort = bool(argument[1]);
		}
	}
}
show_error(str, abort);
return;