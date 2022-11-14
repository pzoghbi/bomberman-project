/// @func split(string, delimiter);
/// @desc Splits the string into an array.
/// @arg str {string}
/// @arg delimiter (array of delimiter)

var str = argument0;
var delimiter = argument1;
var str_array = [];

if is_string(str)
{
	// count the words in this string
	var word_count = 1 + string_count(delimiter, str);

	// TODO implement feature for multiple delimiters
	for(var i = 0; i < word_count; i++)
	{
		// find end to current word (ending including delimiter)
		var word_end = string_pos(delimiter, str);
		word_end = !word_end ? string_length(str) : word_end;
		
		// extract the current word and store it
		var substr = string_copy(str, 1, word_end);
		str_array[i] = string_replace(substr, delimiter, "");
		// remove spaces
		str_array[i] = string_replace_all(str_array[i], " ", "");
		
		// delete this word from the query
		str = string_replace(str, substr, "");
	}
}
else
{
	console_write("Warning: Input not a string. Function split, argument0", ONE_SEC*20);
}
return str_array;