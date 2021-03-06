Caml2013E001����  ?  F  �  '�/Comparable_intf6lib/comparable_intf.ml�����@@���%Infix@@���3Polymorphic_compare@@���%bound���$Incl@��$Excl@��)Unbounded@@�  , ���	^Used for specifying a bound (either upper or lower) as inclusive, exclusive, or
    unbounded.@@@@@@@@@@@���(Validate����!t@@@���/validate_lbound@@���/validate_ubound@@���.validate_bound@@@@���)With_zero����!t@@@���1validate_positive@@���5validate_non_negative@@���1validate_negative@@���5validate_non_positive@@���+is_positive@@���/is_non_negative@@���+is_negative@@���/is_non_positive@@@@���(S_common����@@�  , ���)ascending��1 is identical to ��'compare��". ��>descending x y = ascending y x��	:.  These are
      intended to be mnemonic when used like ��8List.sort ~cmp:ascending��% and ��?List.sort
      ~cmp:descending��	^, since they cause the list to be sorted in ascending or descending
      order, respectively.@@@@@@@@@@@���)ascending@@���*descending@@���'between@@���;Replace_polymorphic_compare�����@@@���?_squelch_unused_module_warning_@@@@@���*comparator@@@���*comparator@@����@@@@@���!S����@@@���#Map��@@@���#Set��@@@@�  , ���.Usage example:�@��$    ��	i
      module Foo : sig
        type t = ...
        include Comparable.S with type t := t
      end
    �@��-    Then use ��/Comparable.Make��	3 in the struct (see comparable.mli for an example).@@@@@@@@@@@���3Map_and_set_binable����!t@@@����@@@���#Map��@@@���#Set��@@@@@���)S_binable����@@@�����@@@@@����B�  , ���	^Used for specifying a bound (either upper or lower) as inclusive, exclusive, or
    unbounded.@@@@@@@@@@@��B�  , ���)ascending��1 is identical to ��'compare��". ��>descending x y = ascending y x��	:.  These are
      intended to be mnemonic when used like ��8List.sort ~cmp:ascending��% and ��?List.sort
      ~cmp:descending��	^, since they cause the list to be sorted in ascending or descending
      order, respectively.@@@@@@@@@@@��B�  , ���.Usage example:�@��$    ��	i
      module Foo : sig
        type t = ...
        include Comparable.S with type t := t
      end
    �@��-    Then use ��/Comparable.Make��	3 in the struct (see comparable.mli for an example).@@@@@@@@@@@@@