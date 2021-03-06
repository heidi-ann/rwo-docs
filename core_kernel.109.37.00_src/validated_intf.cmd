Caml2013E001����  �  �  		  Ű.Validated_intf5lib/validated_intf.ml�����@@��B�  , ���	TFor making an abstract version of a type that ensures a validation check has passed.�@��	:    Suppose one wants to have a type of positive integers:�@��$    ��	�
      module Positive_int = Validated.Make (struct
        type t = int
        let here = _here_
        let validate = Int.validate_positive
      end)
    �@��	5    With this, one is certain that any value of type ��.Positive_int.t��0 has passed
    ��5Int.validate_positive��!.�@��1    One can call ��9Positive_int.create_exn n��	& to create a new positive int from an ��!n��	$,
    which will of course raise if ��&n <= 0��0.  One can call ��=Positive_int.raw positive_int��0
    to get the ��#int��( from a ��.Positive_int.t��!.@@@@@@@@@@@���#Raw����!t@@@���$here�  , ���$here��	2 will appear in validation-failure error messages.@@@@@@@@@@@@���(validate@@���)t_of_sexp@@���)sexp_of_t@@��A�  , ���$here��	2 will appear in validation-failure error messages.@@@@@@@@@@@@@@�{���+Raw_binable����!t@@@����@@@���>validate_binio_deserialization�  , ���>validate_binio_deserialization��
  � controls whether when the binio representation of a
      value is deserialized, the resulting value is validated.  Whether one needs to
      validate values upon deserialization depends on how serialization is being used.  If
      one only ever serializes/deserializes so that the validation function is the same on
      both ends, then one need not validate upon deserialization, because only values that
      already pass the validation function can be serialized.�@��
  &      If the validation functions in the serializer and deserializer may be different,
      e.g. because of two different versions of the code compiled at different times, then
      it is possible to serialize a value that may fail validation upon deserialization.
      In that case, having ��	%validate_binio_deserialization = true��	W is necessary to prevent
      creating values that don't pass the validation function.@@@@@@@@@@@@���%bin_t@@���*bin_read_t@@���+bin_read_t_@@���,bin_read_t__@@���,bin_reader_t@@���*bin_size_t@@���+bin_write_t@@���,bin_write_t_@@���,bin_writer_t@@��A�  , ���>validate_binio_deserialization��
  � controls whether when the binio representation of a
      value is deserialized, the resulting value is validated.  Whether one needs to
      validate values upon deserialization depends on how serialization is being used.  If
      one only ever serializes/deserializes so that the validation function is the same on
      both ends, then one need not validate upon deserialization, because only values that
      already pass the validation function can be serialized.�@��
  &      If the validation functions in the serializer and deserializer may be different,
      e.g. because of two different versions of the code compiled at different times, then
      it is possible to serialize a value that may fail validation upon deserialization.
      In that case, having ��	%validate_binio_deserialization = true��	W is necessary to prevent
      creating values that don't pass the validation function.@@@@@@@@@@@@@@�٠��)Validated����#raw@@@���!t@@@���&create@@���*create_exn@@���#raw@@���)t_of_sexp@@���)sexp_of_t@@@@�����1Validated_binable����!t@@@����@@@���%bin_t@@���*bin_read_t@@���+bin_read_t_@@���,bin_read_t__@@���,bin_reader_t@@���*bin_size_t@@���+bin_write_t@@���,bin_write_t_@@���,bin_writer_t@@@@�-���!S����#Raw�@@@���)Validated�@@@���$Make�@�@@@���,Make_binable�@�@@@@@�I��B�  , ���	TFor making an abstract version of a type that ensures a validation check has passed.�@��	:    Suppose one wants to have a type of positive integers:�@��$    ��	�
      module Positive_int = Validated.Make (struct
        type t = int
        let here = _here_
        let validate = Int.validate_positive
      end)
    �@��	5    With this, one is certain that any value of type ��.Positive_int.t��0 has passed
    ��5Int.validate_positive��!.�@��1    One can call ��9Positive_int.create_exn n��	& to create a new positive int from an ��!n��	$,
    which will of course raise if ��&n <= 0��0.  One can call ��=Positive_int.raw positive_int��0
    to get the ��#int��( from a ��.Positive_int.t��!.@@@@@@@@@@@��B�  , ���$here��	2 will appear in validation-failure error messages.@@@@@@@@@@@��B�  , ���>validate_binio_deserialization��
  � controls whether when the binio representation of a
      value is deserialized, the resulting value is validated.  Whether one needs to
      validate values upon deserialization depends on how serialization is being used.  If
      one only ever serializes/deserializes so that the validation function is the same on
      both ends, then one need not validate upon deserialization, because only values that
      already pass the validation function can be serialized.�@��
  &      If the validation functions in the serializer and deserializer may be different,
      e.g. because of two different versions of the code compiled at different times, then
      it is possible to serialize a value that may fail validation upon deserialization.
      In that case, having ��	%validate_binio_deserialization = true��	W is necessary to prevent
      creating values that don't pass the validation function.@@@@@@@@@@@@@