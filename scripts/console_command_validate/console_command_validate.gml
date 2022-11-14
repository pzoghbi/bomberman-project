var command = argument0;
var command_found = false;
switch(command)
{
case "create":
case "destroy":
case "sprite":
case "move":
case "restart":
case "reboot":
case "clear":
case "clearall":
case "set":
case "quit":
	command_found = true;
	break;
default:
	command_found = false;
	break;
}
return command_found;