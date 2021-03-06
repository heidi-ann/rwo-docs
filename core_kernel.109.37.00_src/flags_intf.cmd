Caml2013E001����    �  �  	G�*Flags_intf1lib/flags_intf.ml�����@@��B�  , ���,module Flags��	D implements Unix-style sets of flags that are represented as
    an ��#int��	5 with various bits set, one bit for each flag.  E.g. ��4Linux_ext.Epoll.Flag��!.�@��$    ��%Flags��7 defines a module type ��'Flags.S��	/, the interface for a flags, and a functor
    ��*Flags.Make��	% for creating a flags implementation.@@@@@@@@@@@���%Int63@@���!S����!t@@@���&of_int@@���*to_int_exn@@���%equal@@���%empty@@���!+@@���!-@@���)intersect@@���*complement@@���(is_empty@@���,do_intersect@@���,are_disjoint@@���)sexp_of_t@@@�  , ���-module type S��	1 is the interface for a set of flags.  Values of ��&type t��	� are set of
    flags, and the various functions operate on sets of flags.  There is a finite universe
    of flags (in particular 63 flags, one for each bit).�@��$    ��)sexp_of_t��	! uses the flag names supplied to ��*Flags.Make@@@@@@@@@@@�����(Make_arg����%known�  , ���)An entry ��*flag, name��$ in ��%known��: means that the bit(s) in ��$flag��7 is (are) called
      ��$name��*; i.e. if ��9bit_and flags flag = flag��	#, then the bit(s) is (are) set and ��$name��6
      will appear in ��/sexp_of_t flags��#.  ��%known��6 is only used to make ��)sexp_of_t��?'s output
      human readable.�@��	!      The flags in the output of ��)sexp_of_t��	6 will occur in the same order as they appear
      in ��%known��!.�@��	A      It is allowed to have a single flag with multiple bits set.�@��	7      It is an error if different flags intersect, and ��:allow_intersecting = false��!.@@@@@@@@@@@@���1remove_zero_flags@@���2allow_intersecting�  , ���2allow_intersecting��	$ says whether to allow intersecting ��%known��	" flags.  It is
      common to do ��:allow_intersecting = false��	N, however in some situations, e.g.
      Unix open flags, the flags intersect.@@@@@@@@@@@@���2should_print_error�  , ���2should_print_error��	m says whether to print an error message if there is an error in
      the known flags.  It is typical to use ��9should_print_error = true��/ because
      ��*Flags.Make��	Y is applied at the module level, where the exception raised isn't
      displayed nicely.@@@@@@@@@@@@@@���%Flags����(Make_arg�@@@���!S�@@@���&create�  , ���-create ~bit:n��9 creates a flag with the ��!n��-th bit set.  ��!n��	  must be between 0 and
      62.�@��	(      Typically a flag has one bit set; ��&create��	� is useful in exactly those cases.  For
      flags with multiple bits one can either define the Int63.t directly or create it in
      terms of simpler flags, using ��!+��% and ��!-��!.@@@@@@@@@@@@���$Make�@�@�  , ���*Flags.Make��	9 builds a new flags module.  If there is an error in the ��%known��	  flags,
      it behaves as per ��(on_error��!.�@��0      We expose ��,type t = int��2 in the result of ��*Flags.Make��	� so that one can easily use
      flag constants as values of the flag type without having to coerce them.  It is
      typical to hide the ��'t = int��6 in another signature ��!S��!.@@@@@@@@@@@@@@����B�  , ���,module Flags��	D implements Unix-style sets of flags that are represented as
    an ��#int��	5 with various bits set, one bit for each flag.  E.g. ��4Linux_ext.Epoll.Flag��!.�@��$    ��%Flags��7 defines a module type ��'Flags.S��	/, the interface for a flags, and a functor
    ��*Flags.Make��	% for creating a flags implementation.@@@@@@@@@@@��B�  , ���-module type S��	1 is the interface for a set of flags.  Values of ��&type t��	� are set of
    flags, and the various functions operate on sets of flags.  There is a finite universe
    of flags (in particular 63 flags, one for each bit).�@��$    ��)sexp_of_t��	! uses the flag names supplied to ��*Flags.Make@@@@@@@@@@@��B�  , ���)An entry ��*flag, name��$ in ��%known��: means that the bit(s) in ��$flag��7 is (are) called
      ��$name��*; i.e. if ��9bit_and flags flag = flag��	#, then the bit(s) is (are) set and ��$name��6
      will appear in ��/sexp_of_t flags��#.  ��%known��6 is only used to make ��)sexp_of_t��?'s output
      human readable.�@��	!      The flags in the output of ��)sexp_of_t��	6 will occur in the same order as they appear
      in ��%known��!.�@��	A      It is allowed to have a single flag with multiple bits set.�@��	7      It is an error if different flags intersect, and ��:allow_intersecting = false��!.@@@@@@@@@@@��B�  , ���2allow_intersecting��	$ says whether to allow intersecting ��%known��	" flags.  It is
      common to do ��:allow_intersecting = false��	N, however in some situations, e.g.
      Unix open flags, the flags intersect.@@@@@@@@@@@��B�  , ���2should_print_error��	m says whether to print an error message if there is an error in
      the known flags.  It is typical to use ��9should_print_error = true��/ because
      ��*Flags.Make��	Y is applied at the module level, where the exception raised isn't
      displayed nicely.@@@@@@@@@@@��B�  , ���-create ~bit:n��9 creates a flag with the ��!n��-th bit set.  ��!n��	  must be between 0 and
      62.�@��	(      Typically a flag has one bit set; ��&create��	� is useful in exactly those cases.  For
      flags with multiple bits one can either define the Int63.t directly or create it in
      terms of simpler flags, using ��!+��% and ��!-��!.@@@@@@@@@@@��B�  , ���*Flags.Make��	9 builds a new flags module.  If there is an error in the ��%known��	  flags,
      it behaves as per ��(on_error��!.�@��0      We expose ��,type t = int��2 in the result of ��*Flags.Make��	� so that one can easily use
      flag constants as values of the flag type without having to coerce them.  It is
      typical to hide the ��'t = int��6 in another signature ��!S��!.@@@@@@@@@@@@@