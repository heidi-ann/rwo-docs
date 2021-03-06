Caml2013E001¦Ύ  §  f  6  δ°.Invariant_intf5lib/invariant_intf.ml   @@  B  ,  	₯This module defines signatures that are to be included in other signatures to ensure a
    consistent interface to invariant-style functions.  There is a signature ( !S ",  "S1 &,
     "S2 ",  "S3 	,) for each arity of type.  Usage looks like: @ $     	=
      type t
      include Invariant.S with type t := t
     @ &    or @ $     	G
      type 'a t
      include Invariant.S1 with type 'a t := 'a t
    @@@@@@@@@@@  A@   ’!t@@  ’#inv@@  §!S °‘!t@@@ °)invariant@@@@  §"S1 °‘!t@@@ °)invariant@@@@  §"S2 °‘!t@@@ °)invariant@@@@  §"S3 °‘!t@@@ °)invariant@@@@  §)Invariant ° °‘-__pa_nonrec_0@@@ °‘!t@@@@@@ °₯!S@@@ °₯"S1@@@ °₯"S2@@@ °₯"S3@@@ °)invariant  ,  <invariant here t sexp_of_t f & runs  $f () ), and if  !f 	) raises, wraps the exception
      in an  'Error.t 	P that states "invariant failed" and includes both the exception
      raised by  !f -, as well as  +sexp_of_t t >.  Idiomatic usage looks like: @ &       	f
        invariant _here_ t <:sexp_of< t >> (fun () ->
          ... check t's invariants ... )
      @@@@@@@@@@@@ °+check_field  ,  +check_field 	( is used when checking invariants using  +Fields.iter 	u.  It wraps an
      exception raised when checking a field with the field's name.  Idiomatic usage looks
      like: @ &       
  z
        type t =
          { foo : Foo.t;
            bar : Bar.t;
          }
        with fields

        let invariant t : unit =
          invariant "Foo.invariant" t <:sexp_of< t >> (fun () ->
            let check f = Invariant.check_field t f in
            Fields.iter
              ~foo:(check Foo.invariant)
              ~bar:(check Bar.invariant))
        ;;
      @@@@@@@@@@@@@@ ζ  B  ,  	₯This module defines signatures that are to be included in other signatures to ensure a
    consistent interface to invariant-style functions.  There is a signature ( !S ",  "S1 &,
     "S2 ",  "S3 	,) for each arity of type.  Usage looks like: @ $     	=
      type t
      include Invariant.S with type t := t
     @ &    or @ $     	G
      type 'a t
      include Invariant.S1 with type 'a t := 'a t
    @@@@@@@@@@@  B  ,  <invariant here t sexp_of_t f & runs  $f () ), and if  !f 	) raises, wraps the exception
      in an  'Error.t 	P that states "invariant failed" and includes both the exception
      raised by  !f -, as well as  +sexp_of_t t >.  Idiomatic usage looks like: @ &       	f
        invariant _here_ t <:sexp_of< t >> (fun () ->
          ... check t's invariants ... )
      @@@@@@@@@@@  B  ,  +check_field 	( is used when checking invariants using  +Fields.iter 	u.  It wraps an
      exception raised when checking a field with the field's name.  Idiomatic usage looks
      like: @ &       
  z
        type t =
          { foo : Foo.t;
            bar : Bar.t;
          }
        with fields

        let invariant t : unit =
          invariant "Foo.invariant" t <:sexp_of< t >> (fun () ->
            let check f = Invariant.check_field t f in
            Fields.iter
              ~foo:(check Foo.invariant)
              ~bar:(check Bar.invariant))
        ;;
      @@@@@@@@@@@@@