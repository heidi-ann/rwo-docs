Caml2013E001¦Ύ       d  υ°2Shell__line_buffer9lib/shell__line_buffer.ml   @@  A@  *nl_between  ,  	yLook for a newline in a given substring and returns its
    absolute position.
    Returns None if no newlines are found.@@@@@@@@@@@      ’!t  &buffer@  #eol@  %flush@@  ,  :Type for line buffers.
    %flush 	e will be called back on every fully read newline or when the buffer
   itself is flushed by the user.@@@@@@@@@@@  &create@  %flush@  (add_char@  -add_substring@  *add_string@  )test_list  ,  +test_list l :: adds all the strings in  !l 	^ to a new blank buffer and
    returns all the lines that the callback function was called on.@@@@@@@@@@@ [ \ ] ^ _  B  ,  	yLook for a newline in a given substring and returns its
    absolute position.
    Returns None if no newlines are found.@@@@@@@@@@@  B  ,  :Type for line buffers.
    %flush 	e will be called back on every fully read newline or when the buffer
   itself is flushed by the user.@@@@@@@@@@@  B  ,  +test_list l :: adds all the strings in  !l 	^ to a new blank buffer and
    returns all the lines that the callback function was called on.@@@@@@@@@@@@@