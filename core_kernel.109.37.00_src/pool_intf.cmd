Caml2013E001����  M�  
  )%  !$�)Pool_intf0lib/pool_intf.ml�����@@��B�  , ���	4A manual memory manager for a set of mutable tuples.�@��	�    A pool stores a bounded-size set of tuples, where client code is responsible for
    explicitly controlling when the pool allocates and frees tuples.  One ��&create��	rs a pool
    of a certain capacity, which returns an empty pool that can hold that many tuples.
    One then uses ��#new��	& to allocate a tuple, which returns a ��)Pointer.t��	! to the tuple.
    One then uses ��#get��% and ��#set��	M along with the pointer to get and set slots of the
    tuple.  Finally, one ��$free��	d's a pointer to the pool's memory for a tuple, making the
    memory available for subsequent reuse.�@��1    The point of ��$Pool��	� is to allocate a single long-lived block of memory (the pool) that
    lives in the OCaml major heap, and then to reuse the block, rather than continually
    allocating blocks on the minor heap.�@��	�    In typical usage, one wraps up a pool with an abstract interface, giving nice names to
    the tuple slots, and only exposing mutation where desired.�@��	P    All the usual problems with manual memory allocation are present with pools:�@��	8    - one can mistakenly use a pointer after it is freed�����	0one can mistakenly free a pointer multiple times@���	 one can forget to free a pointer@@��	"    There are debugging functors, ��*Pool.Debug��% and ��0Pool.Error_check��	O, that are useful for
    building pools to help debug incorrect pointer usage.@@@@@@@@@@@���!S����%Slots@@@���$Slot@@@���'Pointer����!t@�  , ���	!A pointer to a tuple in a pool.  ��&'slots��0 will look like ��	 ('a1, ..., 'an)
        Slots.tn��;, and the tuples have type ��/'a1 * ... * 'an��!.@@@@@@@@@@@@���$null�  , ���$The ��$null��	� pointer is a distinct pointer that does not correspond to a tuple in
        the pool.  It is a function to prevent problems due to the value restriction.@@@@@@@@@@@@���'is_null@@���*phys_equal@@���"Id����!t@�  , ���	;Pointer ids are serializable, but have no other operations.@@@@@@@@@@@@���)t_of_sexp@@���)sexp_of_t@@���%bin_t@@���*bin_read_t@@���+bin_read_t_@@���,bin_read_t__@@���,bin_reader_t@@���*bin_size_t@@���+bin_write_t@@���,bin_write_t_@@���,bin_writer_t@@@@@���)sexp_of_t@@��A�  , ���$The ��$null��	� pointer is a distinct pointer that does not correspond to a tuple in
        the pool.  It is a function to prevent problems due to the value restriction.@@@@@@@@@@@@��A�  , ���	;Pointer ids are serializable, but have no other operations.@@@@@@@@@@@@@@@���!t@�  , ���)A pool.  ��&'slots��0 will look like ��8('a1, ..., 'an) Slots.tn��	*, and the pool holds
      tuples of type ��/'a1 * ... * 'an��!.@@@@@@@@@@@@����@@@���0pointer_is_valid�  , ���:pointer_is_valid t pointer��) returns ��$true��% iff ��'pointer��	! points to a live tuple in
      ��!t��', i.e. ��'pointer��	/ is not null, not free, and is in the range of ��!t��!.�@��	�      A pointer might not be in the range of a pool if it comes from another pool for
      example.  In this case unsafe_get/set functions would cause a segfault.@@@@@@@@@@@@���-id_of_pointer�  , ���7id_of_pointer t pointer��	8 returns an id that is unique for the lifetime of
      ��'pointer��	I's tuple.  When the tuple is freed, the id is no longer valid, and
      ��1pointer_of_id_exn��3 will fail on it.  ��/Pointer.null ()��	4 has a distinct id from all
      non-null pointers.@@@@@@@@@@@@���1pointer_of_id_exn�  , ���6pointer_of_id_exn t id��	& returns the pointer corresponding to ��"id��	0.  It fails if the
      tuple corresponding to ��"id��- was already ��$free��"d.�@��&      ��>pointer_of_id_exn_is_supported��	0 says whether the implementation supports
      ��1pointer_of_id_exn��	P; if not, it will always raise.  We can not use the usual idiom
      of making ��1pointer_of_id_exn��' be an ��*Or_error.t��	2 due to problems with the value
      restriction.@@@@@@@@@@@@���>pointer_of_id_exn_is_supported@@���&create�  , ���=create slots ~capacity ~dummy��	+ creates an empty pool that can hold up to ��(capacity��?
      N-tuples.  The slots of ��%dummy��= are stored in free tuples.  ��&create��1 raises if
      ��,capacity < 0��!.@@@@@@@@@@@@���(capacity�  , ���(capacity��	= returns the maximum number of tuples that the pool can hold.@@@@@@@@@@@@���&length�  , ���&length��	4 returns the number of tuples currently in the pool.�@��&      ��	+
        0 <= length t <= capacity t
      @@@@@@@@@@@@���$grow�  , ���0grow t ~capacity��4 returns a new pool ��"t'��	T with the supplied capacity.  The new pool
      is to be used as a replacement for ��!t��6.  All live tuples in ��!t��7 are now live in
      ��"t'��	", and valid pointers to tuples in ��!t��	8 are now valid pointers to the identical
      tuple in ��"t'��9.  It is an error to use ��!t��/ after calling ��&grow t��!.�@��&      ��$grow��	3 raises if the supplied capacity isn't larger than ��*capacity t��!.@@@@@@@@@@@@���'is_full�  , ���)is_full t��) returns ��$true��	' if no more tuples can be allocated in ��!t��!.@@@@@@@@@@@@���$free�  , ���.free t pointer��? frees the tuple pointed to by ��'pointer��& from ��!t��!.@@@@@@@@@@@@���$new1�  , ���6new<N> t a0 ... a<N-1>��	P returns a new tuple from the pool, with the tuple's
      slots initialized to ��"a0��% ... ��&a<N-1>��#.  ��#new��+ raises if ��)is_full t��!.@@@@@@@@@@@@���$new2@@���$new3@@���$new4@@���$new5@@���$new6@@���$new7@@���$new8@@���$new9@@���)get_tuple�  , ���3get_tuple t pointer��	1 allocates an OCaml tuple isomorphic to the pool ��!t��='s tuple
      pointed to by ��'pointer��	.. The tuple gets copied, but its slots do not.@@@@@@@@@@@@���#get�  , ���2get t pointer slot��& gets ��$slot��< of the tuple pointed to by ��'pointer��/ in
      pool ��!t��!.�@��&      ��4set t pointer slot a��) sets to ��!a��% the ��$slot��< of the tuple pointed to by ��'pointer��/
      in pool ��!t��!.�@��)      In ��#get��% and ��#set��	5, it is an error to refer to a pointer that has been ��$free��	fd.  It
      is also an error to use a pointer with any pool other than the one the pointer was
      ��#new��+'d from or ��$grow��	Qn to.  These errors will lead to undefined behavior, but will
      not segfault.�@��&      ��*unsafe_get��; is comparable in speed to ��#get��	< for immediate values, and 5%-10% faster
      for pointers.�@��&      ��*unsafe_get��% and ��*unsafe_set��	- skip bounds checking, and can thus segfault.@@@@@@@@@@@@���*unsafe_get@@���#set@@���*unsafe_set@@���)sexp_of_t@@��A�  , ���:pointer_is_valid t pointer��) returns ��$true��% iff ��'pointer��	! points to a live tuple in
      ��!t��', i.e. ��'pointer��	/ is not null, not free, and is in the range of ��!t��!.�@��	�      A pointer might not be in the range of a pool if it comes from another pool for
      example.  In this case unsafe_get/set functions would cause a segfault.@@@@@@@@@@@@��A�  , ���7id_of_pointer t pointer��	8 returns an id that is unique for the lifetime of
      ��'pointer��	I's tuple.  When the tuple is freed, the id is no longer valid, and
      ��1pointer_of_id_exn��3 will fail on it.  ��/Pointer.null ()��	4 has a distinct id from all
      non-null pointers.@@@@@@@@@@@@��A�  , ���6pointer_of_id_exn t id��	& returns the pointer corresponding to ��"id��	0.  It fails if the
      tuple corresponding to ��"id��- was already ��$free��"d.�@��&      ��>pointer_of_id_exn_is_supported��	0 says whether the implementation supports
      ��1pointer_of_id_exn��	P; if not, it will always raise.  We can not use the usual idiom
      of making ��1pointer_of_id_exn��' be an ��*Or_error.t��	2 due to problems with the value
      restriction.@@@@@@@@@@@@��A�  , ���=create slots ~capacity ~dummy��	+ creates an empty pool that can hold up to ��(capacity��?
      N-tuples.  The slots of ��%dummy��= are stored in free tuples.  ��&create��1 raises if
      ��,capacity < 0��!.@@@@@@@@@@@@��A�  , ���(capacity��	= returns the maximum number of tuples that the pool can hold.@@@@@@@@@@@@��A�  , ���&length��	4 returns the number of tuples currently in the pool.�@��&      ��	+
        0 <= length t <= capacity t
      @@@@@@@@@@@@��A�  , ���0grow t ~capacity��4 returns a new pool ��"t'��	T with the supplied capacity.  The new pool
      is to be used as a replacement for ��!t��6.  All live tuples in ��!t��7 are now live in
      ��"t'��	", and valid pointers to tuples in ��!t��	8 are now valid pointers to the identical
      tuple in ��"t'��9.  It is an error to use ��!t��/ after calling ��&grow t��!.�@��&      ��$grow��	3 raises if the supplied capacity isn't larger than ��*capacity t��!.@@@@@@@@@@@@��A�  , ���+default is ��.2 * capacity t@@@@@@@@@@@@��A�  , ���)is_full t��) returns ��$true��	' if no more tuples can be allocated in ��!t��!.@@@@@@@@@@@@��A�  , ���.free t pointer��? frees the tuple pointed to by ��'pointer��& from ��!t��!.@@@@@@@@@@@@��A�  , ���6new<N> t a0 ... a<N-1>��	P returns a new tuple from the pool, with the tuple's
      slots initialized to ��"a0��% ... ��&a<N-1>��#.  ��#new��+ raises if ��)is_full t��!.@@@@@@@@@@@@��A�  , ���3get_tuple t pointer��	1 allocates an OCaml tuple isomorphic to the pool ��!t��='s tuple
      pointed to by ��'pointer��	.. The tuple gets copied, but its slots do not.@@@@@@@@@@@@��A�  , ���2get t pointer slot��& gets ��$slot��< of the tuple pointed to by ��'pointer��/ in
      pool ��!t��!.�@��&      ��4set t pointer slot a��) sets to ��!a��% the ��$slot��< of the tuple pointed to by ��'pointer��/
      in pool ��!t��!.�@��)      In ��#get��% and ��#set��	5, it is an error to refer to a pointer that has been ��$free��	fd.  It
      is also an error to use a pointer with any pool other than the one the pointer was
      ��#new��+'d from or ��$grow��	Qn to.  These errors will lead to undefined behavior, but will
      not segfault.�@��&      ��*unsafe_get��; is comparable in speed to ��#get��	< for immediate values, and 5%-10% faster
      for pointers.�@��&      ��*unsafe_get��% and ��*unsafe_set��	- skip bounds checking, and can thus segfault.@@@@@@@@@@@@@�  , ���!S��? is the module type for a pool.@@@@@@@@@@@�k���$Pool����!S�@@@����@�  , ���-This uses an ��+Obj_array.t��	( to implement the pool.  We expose that ��)Pointer.t��- is an
      ��#int��	@ so that OCaml can avoid the write barrier, due to knowing that ��)Pointer.t��>
      isn't an OCaml pointer.@@@@@@@@@@@@���&Unsafe�����@@@���&create�  , ���6create slots ~capacity��	+ creates an empty pool that can hold up to ��(capacity��	&
        N-tuples.  The elements of a ��$free��	d tuple may contain stale and/or invalid values
        for their types, and as such any access to a ��$free��	( tuple from this pool is
        unsafe.@@@@@@@@@@@@@�  , ���#An ��&Unsafe��	0 pool is like an ordinary pool, except that the ��&create��	F function does
      not require an initial element.  The pool stores ��,Obj.magic ()��	g as the dummy value
      for each slot.  Such a pool is only safe if one never accesses a slot from a ��$free��.d
      tuple.�@��<      It makes sense to use ��&Unsafe��	b if one has a small constrained chunk of code where
      one can prove that one never accesses a ��$free��	Ud tuple, and one needs a pool where
      it is difficult to construct a dummy value.@@@@@@@@@@@@���%Debug�@����@@@���/check_invariant@@���-show_messages@@@�  , ���%Debug��	/ builds a pool in which every function can run ��)invariant��	^ on its pool
      argument(s) and/or print a debug message to stderr, as determined by
      ��0!check_invariant��% and ��.!show_messages��;, which are initially both ��$true��!.�@��	1      The performance of the pool resulting from ��%Debug��	, is much worse than that of the
      input ��$Pool��	$, even with all the controls set to ��%false��!.@@@@@@@@@@@@���+Error_check�@@�  , ���+Error_check��	f builds a pool that has additional error checking for pointers, in
      particular to detect using a ��$free��6d pointer or multiply ��$free��.ing a pointer.�@��&      ��+Error_check��	; has a significant performance cost, but less than that of ��%Debug��!.�@��6      One can compose ��%Debug��% and ��+Error_check��&, e.g:�@��&      ��	:
        module M = Debug (Error_check (Obj_array))
      @@@@@@@@@@@@@@�w��B�  , ���	4A manual memory manager for a set of mutable tuples.�@��	�    A pool stores a bounded-size set of tuples, where client code is responsible for
    explicitly controlling when the pool allocates and frees tuples.  One ��&create��	rs a pool
    of a certain capacity, which returns an empty pool that can hold that many tuples.
    One then uses ��#new��	& to allocate a tuple, which returns a ��)Pointer.t��	! to the tuple.
    One then uses ��#get��% and ��#set��	M along with the pointer to get and set slots of the
    tuple.  Finally, one ��$free��	d's a pointer to the pool's memory for a tuple, making the
    memory available for subsequent reuse.�@��1    The point of ��$Pool��	� is to allocate a single long-lived block of memory (the pool) that
    lives in the OCaml major heap, and then to reuse the block, rather than continually
    allocating blocks on the minor heap.�@��	�    In typical usage, one wraps up a pool with an abstract interface, giving nice names to
    the tuple slots, and only exposing mutation where desired.�@��	P    All the usual problems with manual memory allocation are present with pools:�@��	8    - one can mistakenly use a pointer after it is freed�����	0one can mistakenly free a pointer multiple times@���	 one can forget to free a pointer@@��	"    There are debugging functors, ��*Pool.Debug��% and ��0Pool.Error_check��	O, that are useful for
    building pools to help debug incorrect pointer usage.@@@@@@@@@@@��B�  , ���!S��? is the module type for a pool.@@@@@@@@@@@��B�  , ���	!A pointer to a tuple in a pool.  ��&'slots��0 will look like ��	 ('a1, ..., 'an)
        Slots.tn��;, and the tuples have type ��/'a1 * ... * 'an��!.@@@@@@@@@@@��B�  , ���$The ��$null��	� pointer is a distinct pointer that does not correspond to a tuple in
        the pool.  It is a function to prevent problems due to the value restriction.@@@@@@@@@@@��B�  , ���	;Pointer ids are serializable, but have no other operations.@@@@@@@@@@@��B�  , ���)A pool.  ��&'slots��0 will look like ��8('a1, ..., 'an) Slots.tn��	*, and the pool holds
      tuples of type ��/'a1 * ... * 'an��!.@@@@@@@@@@@��B�  , ���:pointer_is_valid t pointer��) returns ��$true��% iff ��'pointer��	! points to a live tuple in
      ��!t��', i.e. ��'pointer��	/ is not null, not free, and is in the range of ��!t��!.�@��	�      A pointer might not be in the range of a pool if it comes from another pool for
      example.  In this case unsafe_get/set functions would cause a segfault.@@@@@@@@@@@��B�  , ���7id_of_pointer t pointer��	8 returns an id that is unique for the lifetime of
      ��'pointer��	I's tuple.  When the tuple is freed, the id is no longer valid, and
      ��1pointer_of_id_exn��3 will fail on it.  ��/Pointer.null ()��	4 has a distinct id from all
      non-null pointers.@@@@@@@@@@@��B�  , ���6pointer_of_id_exn t id��	& returns the pointer corresponding to ��"id��	0.  It fails if the
      tuple corresponding to ��"id��- was already ��$free��"d.�@��&      ��>pointer_of_id_exn_is_supported��	0 says whether the implementation supports
      ��1pointer_of_id_exn��	P; if not, it will always raise.  We can not use the usual idiom
      of making ��1pointer_of_id_exn��' be an ��*Or_error.t��	2 due to problems with the value
      restriction.@@@@@@@@@@@��B�  , ���=create slots ~capacity ~dummy��	+ creates an empty pool that can hold up to ��(capacity��?
      N-tuples.  The slots of ��%dummy��= are stored in free tuples.  ��&create��1 raises if
      ��,capacity < 0��!.@@@@@@@@@@@��B�  , ���(capacity��	= returns the maximum number of tuples that the pool can hold.@@@@@@@@@@@��B�  , ���&length��	4 returns the number of tuples currently in the pool.�@��&      ��	+
        0 <= length t <= capacity t
      @@@@@@@@@@@��B�  , ���0grow t ~capacity��4 returns a new pool ��"t'��	T with the supplied capacity.  The new pool
      is to be used as a replacement for ��!t��6.  All live tuples in ��!t��7 are now live in
      ��"t'��	", and valid pointers to tuples in ��!t��	8 are now valid pointers to the identical
      tuple in ��"t'��9.  It is an error to use ��!t��/ after calling ��&grow t��!.�@��&      ��$grow��	3 raises if the supplied capacity isn't larger than ��*capacity t��!.@@@@@@@@@@@��B�  , ���+default is ��.2 * capacity t@@@@@@@@@@@��B�  , ���)is_full t��) returns ��$true��	' if no more tuples can be allocated in ��!t��!.@@@@@@@@@@@��B�  , ���.free t pointer��? frees the tuple pointed to by ��'pointer��& from ��!t��!.@@@@@@@@@@@��B�  , ���6new<N> t a0 ... a<N-1>��	P returns a new tuple from the pool, with the tuple's
      slots initialized to ��"a0��% ... ��&a<N-1>��#.  ��#new��+ raises if ��)is_full t��!.@@@@@@@@@@@��B�  , ���3get_tuple t pointer��	1 allocates an OCaml tuple isomorphic to the pool ��!t��='s tuple
      pointed to by ��'pointer��	.. The tuple gets copied, but its slots do not.@@@@@@@@@@@��B�  , ���2get t pointer slot��& gets ��$slot��< of the tuple pointed to by ��'pointer��/ in
      pool ��!t��!.�@��&      ��4set t pointer slot a��) sets to ��!a��% the ��$slot��< of the tuple pointed to by ��'pointer��/
      in pool ��!t��!.�@��)      In ��#get��% and ��#set��	5, it is an error to refer to a pointer that has been ��$free��	fd.  It
      is also an error to use a pointer with any pool other than the one the pointer was
      ��#new��+'d from or ��$grow��	Qn to.  These errors will lead to undefined behavior, but will
      not segfault.�@��&      ��*unsafe_get��; is comparable in speed to ��#get��	< for immediate values, and 5%-10% faster
      for pointers.�@��&      ��*unsafe_get��% and ��*unsafe_set��	- skip bounds checking, and can thus segfault.@@@@@@@@@@@��B�  , ���-This uses an ��+Obj_array.t��	( to implement the pool.  We expose that ��)Pointer.t��- is an
      ��#int��	@ so that OCaml can avoid the write barrier, due to knowing that ��)Pointer.t��>
      isn't an OCaml pointer.@@@@@@@@@@@��B�  , ���#An ��&Unsafe��	0 pool is like an ordinary pool, except that the ��&create��	F function does
      not require an initial element.  The pool stores ��,Obj.magic ()��	g as the dummy value
      for each slot.  Such a pool is only safe if one never accesses a slot from a ��$free��.d
      tuple.�@��<      It makes sense to use ��&Unsafe��	b if one has a small constrained chunk of code where
      one can prove that one never accesses a ��$free��	Ud tuple, and one needs a pool where
      it is difficult to construct a dummy value.@@@@@@@@@@@��B�  , ���6create slots ~capacity��	+ creates an empty pool that can hold up to ��(capacity��	&
        N-tuples.  The elements of a ��$free��	d tuple may contain stale and/or invalid values
        for their types, and as such any access to a ��$free��	( tuple from this pool is
        unsafe.@@@@@@@@@@@��B�  , ���%Debug��	/ builds a pool in which every function can run ��)invariant��	^ on its pool
      argument(s) and/or print a debug message to stderr, as determined by
      ��0!check_invariant��% and ��.!show_messages��;, which are initially both ��$true��!.�@��	1      The performance of the pool resulting from ��%Debug��	, is much worse than that of the
      input ��$Pool��	$, even with all the controls set to ��%false��!.@@@@@@@@@@@��B�  , ���+Error_check��	f builds a pool that has additional error checking for pointers, in
      particular to detect using a ��$free��6d pointer or multiply ��$free��.ing a pointer.�@��&      ��+Error_check��	; has a significant performance cost, but less than that of ��%Debug��!.�@��6      One can compose ��%Debug��% and ��+Error_check��&, e.g:�@��&      ��	:
        module M = Debug (Error_check (Obj_array))
      @@@@@@@@@@@@@