/// keyboard_input_get(device);
var device = argument0;
input_left = keyboard_check(ord("A")) 
or (gamepad_axis_value(device, gp_axislh) < -0.5);
input_right = keyboard_check(ord("D"))  
or (gamepad_axis_value(device, gp_axislh) > 0.5);
input_up = keyboard_check(ord("W")) 
or (gamepad_axis_value(device, gp_axislv) < -0.5);
input_down = keyboard_check(ord("S")) 
or (gamepad_axis_value(device, gp_axislv) > 0.5);
input_bomb = keyboard_check(vk_space) || 
gamepad_button_check(device, gp_face2);
