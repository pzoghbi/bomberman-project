/// @description check a value in list
/// @arg list list/array
/// @arg value value to check
var list = argument0;
var value = argument1;
var result = false;	// result

if is_array(list) {
	for(var i = 0; i < array_length_1d(list); i++) {
		if (string(list[i]) == string(value)) {
			result = true;
			break;
		}
	}
} else if ds_exists(list, ds_type_list) { 
	for(var i = 0; i < ds_list_size(list); i++) {
		if (string(list[|i]) == string(value)){
			result = true;
			break;
		}
	}
}

return result;