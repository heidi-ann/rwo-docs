Caml2013E001¦¾  ¯  Ñ    °/Tuple_type_intf6lib/tuple_type_intf.ml   @@  §%Slots °A  ,  %Slots + has types  "t1 ', ...,  "t9 	` of arities 1 to 9 that are isomorphic to tuple
      types of the corresponding arities.  Type  8('a0, ..., 'a<N-1>) t<N> 6 corresponds to
       3'a0 * ... * 'a<N-1> !. @ 0      Each type  "ti 8 is an instance of type  4('tuple, 'variant) t +, in which  &'tuple 9 is
      the tuple type  3'a0 * ... * 'a<N-1> % and  ('variant 	5 is an encoding of the tuple type
      in the form:  	6[ `S0 of `a0 | `S1 of `a1 | ... | `S<N-1> of `a<N-1> ] !. @ 	Ñ      The encoding of the slots using a polymorphic variant allows one to write functions
      that are polymorphic in the tuple type, and require that a tuple have a certain
      slot, but allow more slots. @ .      We make  !t 	f itself a polymorphic variant type so that one can easily encode cyclic
      types, e.g. lists, like: @ &       	A
        type 'a slots = ('a, 'a slots Pointer.t) Slots.t2
       @ 3      Observe that  %slots 	Z in the above is cyclic, but that OCaml allows it because the
      definition expands to: @ &       
   
        type 'a slots = [ `Slots of ('a * 'a slots Pointer.t,
                                     [ `S0 of 'a
                                     | `S1 of 'a slots Pointer.t
                                     ]
                                    ) u
                        ]
       @ 4      Ultimately, a  'Slots.t 	s is used as a phantom type that ensures consistent usage of
      the tuples in the data structure containing them.@@@@@@@@@@@@ °¡!u@@@ °¡!t@@@ °/slots_per_tuple@@ °¡"t1@@@ °¡"t2@@@ °¡"t3@@@ °¡"t4@@@ °¡"t5@@@ °¡"t6@@@ °¡"t7@@@ °¡"t8@@@ °¡"t9@@@ °"t1@@ °"t2@@ °"t3@@ °"t4@@ °"t5@@ °"t6@@ °"t7@@ °"t8@@ °"t9@@ °)sexp_of_t@@ °*sexp_of_t1@@ °*sexp_of_t2@@ °*sexp_of_t3@@ °*sexp_of_t4@@ °*sexp_of_t5@@ °*sexp_of_t6@@ °*sexp_of_t7@@ °*sexp_of_t8@@ °*sexp_of_t9@@@@ ÿ  §$Slot °¡!t@  ,  "A  &Slot.t 	# represents a slot in a tuple type.@@@@@@@@@@@@ °%equal@@ °"t0@@ °"t1@@ °"t2@@ °"t3@@ °"t4@@ °"t5@@ °"t6@@ °"t7@@ °"t8@@ °)sexp_of_t@@@@ A B  B  ,  %Slots + has types  "t1 ', ...,  "t9 	` of arities 1 to 9 that are isomorphic to tuple
      types of the corresponding arities.  Type  8('a0, ..., 'a<N-1>) t<N> 6 corresponds to
       3'a0 * ... * 'a<N-1> !. @ 0      Each type  "ti 8 is an instance of type  4('tuple, 'variant) t +, in which  &'tuple 9 is
      the tuple type  3'a0 * ... * 'a<N-1> % and  ('variant 	5 is an encoding of the tuple type
      in the form:  	6[ `S0 of `a0 | `S1 of `a1 | ... | `S<N-1> of `a<N-1> ] !. @ 	Ñ      The encoding of the slots using a polymorphic variant allows one to write functions
      that are polymorphic in the tuple type, and require that a tuple have a certain
      slot, but allow more slots. @ .      We make  !t 	f itself a polymorphic variant type so that one can easily encode cyclic
      types, e.g. lists, like: @ &       	A
        type 'a slots = ('a, 'a slots Pointer.t) Slots.t2
       @ 3      Observe that  %slots 	Z in the above is cyclic, but that OCaml allows it because the
      definition expands to: @ &       
   
        type 'a slots = [ `Slots of ('a * 'a slots Pointer.t,
                                     [ `S0 of 'a
                                     | `S1 of 'a slots Pointer.t
                                     ]
                                    ) u
                        ]
       @ 4      Ultimately, a  'Slots.t 	s is used as a phantom type that ensures consistent usage of
      the tuples in the data structure containing them.@@@@@@@@@@@  B  ,  "A  &Slot.t 	# represents a slot in a tuple type.@@@@@@@@@@@@@