Caml2013E001¦Ύ  *  9    ύ°)Blit_intf0lib/blit_intf.ml   @@  B  ,  2Standard type for  $blit 	- functions, and reusable code for validating  $blit /
    arguments.@@@@@@@@@@@  ’$blit@  ,  #If  6blit : (src, dst) blit ', then  	%blit ~src ~src_pos ~len ~dst ~dst_pos ' blits  #len 1
    values from  #src 6 starting at position  'src_pos $ to  #dst - at position  'dst_pos 3.
    Furthermore,  $blit + raises if  'src_pos ",  #len &, and  'dst_pos 	# don't specify valid
    slices of  #src % and  #dst !.@@@@@@@@@@@  ’%blito@@  ’#sub@  ,  #If  4sub : (src, dst) sub ', then  2sub ~src ~pos ~len < returns a sequence of type  #dst 0
    containing  #len / characters of  #src - starting at  #pos !. @ $     $subo ) is like  #sub ), except  #pos % and  #len . are optional.@@@@@@@@@@@  ’$subo@@  §!S °‘!t@@@ °$blit@@ °%blito@@ °+unsafe_blit@@ °#sub@@ °$subo@@@@  §"S1 °‘!t@@@ °$blit@@ °%blito@@ °+unsafe_blit@@ °#sub@@ °$subo@@@@  §*S_distinct °‘#src@@@ °‘#dst@@@ °$blit@@ °%blito@@ °+unsafe_blit@@ °#sub@@ °$subo@@@@  B  ,  	.Users of modules matching the blit signatures  !S ",  "S1 &, and  +S1_distinct 	 only need
    to understand the code above.  The code below is only for those that need to implement
    modules that match those signatures.@@@@@@@@@@@  §#Elt °‘!t@@@ °%equal@  ,  'of_bool 	1 is used to generate two distinct values of type  !t 	0, used in unit tests.
      It is required that  =of_bool false <> of_bool true !.@@@@@@@@@@@ °'of_bool@@@@  §(Sequence °‘#elt@@@ °‘!t@@@ °&create@@ °&length@@ °#get@@ °#set@@ °)sexp_of_t@@@@ }  §$Blit ° °‘-__pa_nonrec_0@@@ °‘$blit@@@@@@ ° °‘-__pa_nonrec_1@@@ °‘%blito@@@@@@ ° °‘-__pa_nonrec_2@@@ °‘#sub@@@@@@ ° °‘-__pa_nonrec_3@@@ °‘$subo@@@@@@ °₯!S@@@ °₯"S1@@@ °₯*S_distinct@@@ °A  ,  2There are various  %Make* 7 functors that turn an  +unsafe_blit 1 function into a  $blit 	§
      function.  The functors differ in whether the sequence type is monomorphic or
      polymorphic, and whether the src and dst types are distinct or are the same. @ 	F      The blit functions make sure the slices are valid and then call  +unsafe_blit 	".  They
      guarantee at a call  	,unsafe_blit ~src ~src_pos ~dst ~dst_pos ~len & that: @ &       	
        len > 0
        && src_pos >= 0
        && src_pos + len <= get_src_len src
        && dst_pos >= 0
        && dst_pos + len <= get_dst_len dst
       @ *      The  %Make* 	/ functors also automatically create unit tests.@@@@@@@@@@@@ °£$Make‘@‘ °@@@ °+unsafe_blit@@@@  ,  $Make 	A is for blitting between two values of the same monomorphic type.@@@@@@@@@@@@ °£-Make_distinct‘@‘@‘ °@@@ °+unsafe_blit@@@@  ,  -Make_distinct 	= is for blitting between values of disinct monomorphic types.@@@@@@@@@@@@ °£%Make1‘ °‘!t@@  ,  %Make1 9 guarantees to only call  2create_like ~len t & with  'len > 0 6 if
                   ,length t > 0 !.@@@@@@@@@@@ °+create_like@@ °&length@@ °+unsafe_blit@@ °‘!z@@@ °+create_bool@@ °#get@@ °#set@@ °)sexp_of_t@  ,  %Make1 9 guarantees to only call  2create_like ~len t & with  'len > 0 6 if
                   ,length t > 0 !.@@@@@@@@@@@@@  ,  %Make1 	A is for blitting between two values of the same polymorphic type.@@@@@@@@@@@@@@    B  ,  2Standard type for  $blit 	- functions, and reusable code for validating  $blit /
    arguments.@@@@@@@@@@@  B  ,  #If  6blit : (src, dst) blit ', then  	%blit ~src ~src_pos ~len ~dst ~dst_pos ' blits  #len 1
    values from  #src 6 starting at position  'src_pos $ to  #dst - at position  'dst_pos 3.
    Furthermore,  $blit + raises if  'src_pos ",  #len &, and  'dst_pos 	# don't specify valid
    slices of  #src % and  #dst !.@@@@@@@@@@@  B  ,  +default is  !0@@@@@@@@@@@  B  ,  +default is  4length src - src_pos@@@@@@@@@@@  B  ,  +default is  !0@@@@@@@@@@@  B  ,  #If  4sub : (src, dst) sub ', then  2sub ~src ~pos ~len < returns a sequence of type  #dst 0
    containing  #len / characters of  #src - starting at  #pos !. @ $     $subo ) is like  #sub ), except  #pos % and  #len . are optional.@@@@@@@@@@@  B  ,  +default is  !0@@@@@@@@@@@  B  ,  +default is  0length src - pos@@@@@@@@@@@  B  ,  	.Users of modules matching the blit signatures  !S ",  "S1 &, and  +S1_distinct 	 only need
    to understand the code above.  The code below is only for those that need to implement
    modules that match those signatures.@@@@@@@@@@@  B  ,  'of_bool 	1 is used to generate two distinct values of type  !t 	0, used in unit tests.
      It is required that  =of_bool false <> of_bool true !.@@@@@@@@@@@  B  ,  2There are various  %Make* 7 functors that turn an  +unsafe_blit 1 function into a  $blit 	§
      function.  The functors differ in whether the sequence type is monomorphic or
      polymorphic, and whether the src and dst types are distinct or are the same. @ 	F      The blit functions make sure the slices are valid and then call  +unsafe_blit 	".  They
      guarantee at a call  	,unsafe_blit ~src ~src_pos ~dst ~dst_pos ~len & that: @ &       	
        len > 0
        && src_pos >= 0
        && src_pos + len <= get_src_len src
        && dst_pos >= 0
        && dst_pos + len <= get_dst_len dst
       @ *      The  %Make* 	/ functors also automatically create unit tests.@@@@@@@@@@@  B  ,  $Make 	A is for blitting between two values of the same monomorphic type.@@@@@@@@@@@  B  ,  -Make_distinct 	= is for blitting between values of disinct monomorphic types.@@@@@@@@@@@  B  ,  %Make1 	A is for blitting between two values of the same polymorphic type.@@@@@@@@@@@  B  ,  %Make1 9 guarantees to only call  2create_like ~len t & with  'len > 0 6 if
                   ,length t > 0 !.@@@@@@@@@@@@@