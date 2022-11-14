/// @description 
/*
 *	This object will listen to the devices
 *	connected through the o_devices object
 *	and store their input maps accordingly
 *	Then it will forward input maps to the
 *	o_controller as interfaces to players. 
 */

// list of available devices (gamepads)
device_list = ds_list_create();
// "structure" of all devices (individuals)
devices = ds_map_create();


// first individual - keyboard input
var keyboard_input = ds_map_create();
// store it in structure
ds_map_add_map(devices, "keyboard", keyboard_input);
