Caml2013E001¦Ύ  H    G  
Η°*Stack_intf1lib/stack_intf.ml   @@  B  ,  	%An interface for stacks that follows  $Core 	3's conventions, as opposed to OCaml's
    standard  %Stack ( module.@@@@@@@@@@@  §!S °‘!t@@@ °@@@ °@  ,  $fold ",  $iter ",  $find &, and  (find_map 	M visit the elements in order from the top of
      the stack to the bottom.   'to_list % and  (to_array 	L return the elements in order from
      the top of the stack to the bottom.@@@@@@@@@@@@ °'of_list  ,  )of_list l 	3 returns a stack whose top is the first element of  !l 	) and bottom is the
      last element of  !l !.@@@@@@@@@@@@ °&create  ,  )create () 8 returns an empty stack.@@@@@@@@@@@@ °$push  ,  (push t a & adds  !a 5 to the top of stack  !t !.@@@@@@@@@@@@ °#pop  ,  %pop t 	( removes and returns the top element of  !t $ as  &Some a -, or returns  $None * if
       !t * is empty.@@@@@@@@@@@@ °'pop_exn@@ °#top  ,  %top t ) returns  &Some a (, where  !a / is the top of  !t ), unless  *is_empty t 6, in which
      case  #top ) returns  $None !.@@@@@@@@@@@@ °'top_exn@@ °%clear  ,  'clear t < discards all elements from  !t !.@@@@@@@@@@@@ °$copy  ,  &copy t 3 returns a copy of  !t !.@@@@@@@@@@@@ °+until_empty  ,  /until_empty t f < repeatedly pops an element  !a ( off of  !t * and runs  #f a ., until
       !t ? becomes empty.  It is fine if  !f 7 adds more elements to  !t 	M, in which case the
      most-recently-added element will be processed next.@@@@@@@@@@@@ °)t_of_sexp@@ °)sexp_of_t@@ °%bin_t@@ °*bin_read_t@@ °+bin_read_t_@@ °,bin_read_t__@@ °,bin_reader_t@@ °*bin_size_t@@ °+bin_write_t@@ °,bin_write_t_@@ °,bin_writer_t@@ °A  ,  $fold ",  $iter ",  $find &, and  (find_map 	M visit the elements in order from the top of
      the stack to the bottom.   'to_list % and  (to_array 	L return the elements in order from
      the top of the stack to the bottom.@@@@@@@@@@@@ °A  ,  )of_list l 	3 returns a stack whose top is the first element of  !l 	) and bottom is the
      last element of  !l !.@@@@@@@@@@@@ °A  ,  )create () 8 returns an empty stack.@@@@@@@@@@@@ °A  ,  (push t a & adds  !a 5 to the top of stack  !t !.@@@@@@@@@@@@ °A  ,  %pop t 	( removes and returns the top element of  !t $ as  &Some a -, or returns  $None * if
       !t * is empty.@@@@@@@@@@@@ °A  ,  %top t ) returns  &Some a (, where  !a / is the top of  !t ), unless  *is_empty t 6, in which
      case  #top ) returns  $None !.@@@@@@@@@@@@ °A  ,  'clear t < discards all elements from  !t !.@@@@@@@@@@@@ °A  ,  &copy t 3 returns a copy of  !t !.@@@@@@@@@@@@ °A  ,  /until_empty t f < repeatedly pops an element  !a ( off of  !t * and runs  #f a ., until
       !t ? becomes empty.  It is fine if  !f 7 adds more elements to  !t 	M, in which case the
      most-recently-added element will be processed next.@@@@@@@@@@@@@@ t u  B  ,  	%An interface for stacks that follows  $Core 	3's conventions, as opposed to OCaml's
    standard  %Stack ( module.@@@@@@@@@@@  B  ,  $fold ",  $iter ",  $find &, and  (find_map 	M visit the elements in order from the top of
      the stack to the bottom.   'to_list % and  (to_array 	L return the elements in order from
      the top of the stack to the bottom.@@@@@@@@@@@  B  ,  )of_list l 	3 returns a stack whose top is the first element of  !l 	) and bottom is the
      last element of  !l !.@@@@@@@@@@@  B  ,  )create () 8 returns an empty stack.@@@@@@@@@@@  B  ,  (push t a & adds  !a 5 to the top of stack  !t !.@@@@@@@@@@@  B  ,  %pop t 	( removes and returns the top element of  !t $ as  &Some a -, or returns  $None * if
       !t * is empty.@@@@@@@@@@@  B  ,  %top t ) returns  &Some a (, where  !a / is the top of  !t ), unless  *is_empty t 6, in which
      case  #top ) returns  $None !.@@@@@@@@@@@  B  ,  'clear t < discards all elements from  !t !.@@@@@@@@@@@  B  ,  &copy t 3 returns a copy of  !t !.@@@@@@@@@@@  B  ,  /until_empty t f < repeatedly pops an element  !a ( off of  !t * and runs  #f a ., until
       !t ? becomes empty.  It is fine if  !f 7 adds more elements to  !t 	M, in which case the
      most-recently-added element will be processed next.@@@@@@@@@@@@@