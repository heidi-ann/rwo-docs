Caml2013E001¦Ύ  l  D  u  n°*Float_intf1lib/float_intf.ml   @@  B  ,  	,Floating-point representation and utilities.@@@@@@@@@@@  ₯'Binable@@  §!S °‘!t@@@ °‘%outer@@@ °@@  ,  #max % and  #min 	+ will return nan if either argument is nan. @ *      The  *validate_* 	# functions always fail if class is  #Nan $ or  (Infinite !.@@@@@@@@@@@ °@@@ °@@  ,  	%The results of robust comparisons on  #nan 	  should be considered undefined.@@@@@@@@@@@ °@@@ °1validate_ordinary  ,  1validate_ordinary 3 fails if class is  #Nan $ or  (Infinite !.@@@@@@@@@@@@ °#nan@@ °(infinity@@ °,neg_infinity@@ °)max_value@@ °)min_value@@ °$zero@@ °'epsilon@@ °-epsilon_float@@ °0max_finite_value@@ °2min_positive_value@@ °&of_int@@ °&to_int@@ °(of_int64@@ °(to_int64@@ °%round@@ °&iround@@ °*iround_exn@@ °2round_towards_zero@@ °*round_down@@ °(round_up@@ °-round_nearest@@ °3iround_towards_zero@@ °+iround_down@@ °)iround_up@@ °.iround_nearest@@ °7iround_towards_zero_exn@@ °/iround_down_exn@@ °-iround_up_exn@@ °2iround_nearest_exn@@ °&is_nan@@ °&is_inf  ,  	-includes positive and negative Float.infinity@@@@@@@@@@@@ °(min_inan  ,  	Bmin and max that return the other value if one of the values is a  #nan 0. Returns
       #nan 7 if both arguments are  #nan !.@@@@@@@@@@@@ °(max_inan@@ °!+@@ °!-@@ °!*@@ °!/@@ °£%Parts °‘!t@@@ °*fractional@@ °(integral@@@  ,  	MReturns the fractional part and the whole (i.e. integer) part.  For example,  2modf
      (-3.14) ) returns  	'{ fractional = -0.14; integral = -3.; } !!@@@@@@@@@@@@ °$modf@@ °)mod_float  ,  -mod_float x y 	( returns a result with the same sign as  !x ..  It returns  #nan $ if  !y *
      is  !0 9.  It is basically
       	3let mod_float x y = x -. float(truncate(x/.y)) *. y 1
      not
       	)let mod_float x y = x -. floor(x/.y) *. y ?
      and therefore resembles  #mod 7 on integers more than  !% !.@@@@@@@@@@@@ °#add@@ °#sub@@ °#neg@@ °%scale@@ °#abs@@ °-to_string_hum  ,  	 Pretty print float, for example  	1to_string_hum ~decimals:3 1234.1999 = "1_234.200" '
       	Ato_string_hum ~decimals:3 ~strip_zero:true 1234.1999 = "1_234.2"  	?. No delimiters
      are inserted to the right of the decimal.@@@@@@@@@@@@ °%ldexp@@ °%frexp@@ °£%Class °‘!t  (Infinite@  #Nan@  &Normal@  )Subnormal@  $Zero@@@@ °@@@ °)t_of_sexp@@ °)sexp_of_t@@ °%bin_t@@ °*bin_read_t@@ °+bin_read_t_@@ °,bin_read_t__@@ °,bin_reader_t@@ °*bin_size_t@@ °+bin_write_t@@ °,bin_write_t_@@ °,bin_writer_t@@@@@ °(classify@@ °)is_finite@@ °£$Sign °‘!t  #Neg@  $Zero@  #Pos@@@@ °)t_of_sexp@@ °)sexp_of_t@@@@@ °$sign@@ °£%Terse °‘!t@@@ °@@@ °)t_of_sexp@@ °)sexp_of_t@@ °%bin_t@@ °*bin_read_t@@ °+bin_read_t_@@ °,bin_read_t__@@ °,bin_reader_t@@ °*bin_size_t@@ °+bin_write_t@@ °,bin_write_t_@@ °,bin_writer_t@@@@@ °-outer_of_sexp@@ °-sexp_of_outer@@ °)bin_outer@@ °.bin_read_outer@@ °/bin_read_outer_@@ °0bin_read_outer__@@ °0bin_reader_outer@@ °.bin_size_outer@@ °/bin_write_outer@@ °0bin_write_outer_@@ °0bin_writer_outer@@ °A  ,  #max % and  #min 	+ will return nan if either argument is nan. @ *      The  *validate_* 	# functions always fail if class is  #Nan $ or  (Infinite !.@@@@@@@@@@@@ °A  ,  	%The results of robust comparisons on  #nan 	  should be considered undefined.@@@@@@@@@@@@ °A  ,  1validate_ordinary 3 fails if class is  #Nan $ or  (Infinite !.@@@@@@@@@@@@ °A  ,  	-includes positive and negative Float.infinity@@@@@@@@@@@@ °A  ,  	Bmin and max that return the other value if one of the values is a  #nan 0. Returns
       #nan 7 if both arguments are  #nan !.@@@@@@@@@@@@ °A  ,  	MReturns the fractional part and the whole (i.e. integer) part.  For example,  2modf
      (-3.14) ) returns  	'{ fractional = -0.14; integral = -3.; } !!@@@@@@@@@@@@ °A  ,  -mod_float x y 	( returns a result with the same sign as  !x ..  It returns  #nan $ if  !y *
      is  !0 9.  It is basically
       	3let mod_float x y = x -. float(truncate(x/.y)) *. y 1
      not
       	)let mod_float x y = x -. floor(x/.y) *. y ?
      and therefore resembles  #mod 7 on integers more than  !% !.@@@@@@@@@@@@ °A  ,  	 Pretty print float, for example  	1to_string_hum ~decimals:3 1234.1999 = "1_234.200" '
       	Ato_string_hum ~decimals:3 ~strip_zero:true 1234.1999 = "1_234.2"  	?. No delimiters
      are inserted to the right of the decimal.@@@@@@@@@@@@@@ d e  B  ,  	,Floating-point representation and utilities.@@@@@@@@@@@  B  ,  #max % and  #min 	+ will return nan if either argument is nan. @ *      The  *validate_* 	# functions always fail if class is  #Nan $ or  (Infinite !.@@@@@@@@@@@  B  ,  	%The results of robust comparisons on  #nan 	  should be considered undefined.@@@@@@@@@@@  B  ,  1validate_ordinary 3 fails if class is  #Nan $ or  (Infinite !.@@@@@@@@@@@  B  ,  	-includes positive and negative Float.infinity@@@@@@@@@@@  B  ,  	Bmin and max that return the other value if one of the values is a  #nan 0. Returns
       #nan 7 if both arguments are  #nan !.@@@@@@@@@@@  B  ,  	MReturns the fractional part and the whole (i.e. integer) part.  For example,  2modf
      (-3.14) ) returns  	'{ fractional = -0.14; integral = -3.; } !!@@@@@@@@@@@  B  ,  -mod_float x y 	( returns a result with the same sign as  !x ..  It returns  #nan $ if  !y *
      is  !0 9.  It is basically
       	3let mod_float x y = x -. float(truncate(x/.y)) *. y 1
      not
       	)let mod_float x y = x -. floor(x/.y) *. y ?
      and therefore resembles  #mod 7 on integers more than  !% !.@@@@@@@@@@@  B  ,  	 Pretty print float, for example  	1to_string_hum ~decimals:3 1234.1999 = "1_234.200" '
       	Ato_string_hum ~decimals:3 ~strip_zero:true 1234.1999 = "1_234.2"  	?. No delimiters
      are inserted to the right of the decimal.@@@@@@@@@@@@@