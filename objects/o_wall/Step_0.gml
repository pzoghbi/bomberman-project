/// @description 

// Inherit the parent event
event_inherited();

if destroy {	
	console_write(ds_stack_size(o_control.itemstack));
	if (ds_stack_size(o_control.itemstack) > 0) {
		console_write("stack size");
		if chance(20) {
			console_write("chance");
			var item = instance_create_layer(x, y, "Instances", o_item);
			item.name = ds_stack_pop(o_control.itemstack);
		}
	}
	instance_destroy();
}