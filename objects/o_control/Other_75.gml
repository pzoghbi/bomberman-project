/// @description 
/*
	"event_type" - the type of system event received, which will be one of the following strings:
		"gamepad discovered" - happens when the system reports a new gamepad has been connected
		"gamepad lost" - happens when the system has lost connection to a gamepad
	"pad_index" - the index of the pad that has been added or removed
*/

var type = async_load[? "event_type"];
var gp_id = async_load[? "pad_index"];

var gp_name = gamepad_get_description(gp_id);
switch(type)
{
case "gamepad discovered":
	console_write(gp_name + " connected");
	break;
case "gamepad lost":
	/*
	for(var i = 0; i < size(device_list); i++)
	{
		continue;
	}
	*/
	console_write(gp_name + " disconnected");
	break;
default:
	break;
}