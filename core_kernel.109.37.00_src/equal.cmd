Caml2013E001¦Ύ     ΅    )°%Equal,lib/equal.ml   @@  B  ,  	sThis module defines signatures that are to be included in other signatures to ensure a
    consistent interface to  %equal 	# functions.  There is a signature ( !S ",  "S1 ",  "S2 &,
     "S3 	,) for each arity of type.  Usage looks like: @ $     	9
      type t
      include Equal.S with type t := t
     @ &    or @ $     	C
      type 'a t
      include Equal.S1 with type 'a t := 'a t
    @@@@@@@@@@@  ’!t@@  ’%equal@@  §!S °‘!t@@@ °%equal@@@@  §"S1 °‘!t@@@ °%equal@@@@  §"S2 °‘!t@@@ °%equal@@@@  §"S3 °‘!t@@@ °%equal@@@@ w  B  ,  	sThis module defines signatures that are to be included in other signatures to ensure a
    consistent interface to  %equal 	# functions.  There is a signature ( !S ",  "S1 ",  "S2 &,
     "S3 	,) for each arity of type.  Usage looks like: @ $     	9
      type t
      include Equal.S with type t := t
     @ &    or @ $     	C
      type 'a t
      include Equal.S1 with type 'a t := 'a t
    @@@@@@@@@@@@@