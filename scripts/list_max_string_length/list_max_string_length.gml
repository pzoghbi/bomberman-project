/// @description Finds largest string and returns its width
var _list	= argument[0];
if is_array(_list)
{
	var _array = _list;
	_list = ds_list_create();
	for(var i = 0; i < array_length_1d(_array); i++)
	{
		ds_list_add(_list, _array[i]);
	}
}

// biggest string size
var result = 0;
for (var i = 0; i < ds_list_size(_list); i++) 
{
	var my_string = ds_list_find_value(_list, i);
	var length = string_width(my_string);
	if length > result
	{
		result = length;
	}
}
return result;