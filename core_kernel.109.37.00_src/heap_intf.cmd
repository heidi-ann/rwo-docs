Caml2013E001����  �  z  
)  Z�)Heap_intf0lib/heap_intf.ml�����@@���!S����!t@�  , ���	�of_sexp and bin_io functions aren't supplied for heaps due to the difficulties in
      reconstructing the correct comparison function when de-serializing.@@@@@@@@@@@@����@@@���&create�  , ���5create ?min_size ~cmp��	' returns a new min-heap that can store ��(min_size��	? elements
      without reallocations, using ordering function ��#cmp��!.�@��	~      The top of the heap is the smallest element as determined by the provided comparison
      function.  In particular, if ��+cmp x y < 0��& then ��!x��5 will be "on top of" ��!y��3 in the
      heap.�@��	+      Memory use is surprising in two ways:�@��	�      1. The underlying pool never shrinks, so current memory use will at least be
      proportional to the largest number of elements that the heap has ever held.�@��	*      2. Not all the memory is freed upon ��&remove��	3, but rather after some number of
      subsequent ��#pop��9 operations. Alternating ��#add��% and ��&remove��	5 operations can therefore
      use unbounded memory.@@@@@@@@@@@@���(of_array�  , ���1of_array arr ~cmp��! ��(min_size��& (see ��&create��=) will be set to the size of ��#arr��!.@@@@@@@@@@@@���#top�  , ���	4returns the top (i.e., smallest) element of the heap@@@@@@@@@@@@���'top_exn@@���#add@@���*remove_top�  , ���,remove_top t��1 does nothing if ��!t��) is empty@@@@@@@@@@@@���#pop�  , ���	5This removes and returns the top (i.e. least) element@@@@@@@@@@@@���'pop_exn@@���&pop_if�  , ���-pop_if t cond��) returns ��0Some top_element��$ of ��!t��	! if it satisfies condition
      ��$cond��2, removing it, or ��$None��3 in any other case.@@@@@@@@@@@@���$copy�  , ���&copy t��7 returns a shallow copy@@@@@@@@@@@@���)sexp_of_t@@��A�  , ���5create ?min_size ~cmp��	' returns a new min-heap that can store ��(min_size��	? elements
      without reallocations, using ordering function ��#cmp��!.�@��	~      The top of the heap is the smallest element as determined by the provided comparison
      function.  In particular, if ��+cmp x y < 0��& then ��!x��5 will be "on top of" ��!y��3 in the
      heap.�@��	+      Memory use is surprising in two ways:�@��	�      1. The underlying pool never shrinks, so current memory use will at least be
      proportional to the largest number of elements that the heap has ever held.�@��	*      2. Not all the memory is freed upon ��&remove��	3, but rather after some number of
      subsequent ��#pop��9 operations. Alternating ��#add��% and ��&remove��	5 operations can therefore
      use unbounded memory.@@@@@@@@@@@@��A�  , ���1of_array arr ~cmp��! ��(min_size��& (see ��&create��=) will be set to the size of ��#arr��!.@@@@@@@@@@@@��A�  , ���	4returns the top (i.e., smallest) element of the heap@@@@@@@@@@@@��A�  , ���,remove_top t��1 does nothing if ��!t��) is empty@@@@@@@@@@@@��A�  , ���	5This removes and returns the top (i.e. least) element@@@@@@@@@@@@��A�  , ���-pop_if t cond��) returns ��0Some top_element��$ of ��!t��	! if it satisfies condition
      ��$cond��2, removing it, or ��$None��3 in any other case.@@@@@@@@@@@@��A�  , ���&copy t��7 returns a shallow copy@@@@@@@@@@@@@@������B�  , ���	�of_sexp and bin_io functions aren't supplied for heaps due to the difficulties in
      reconstructing the correct comparison function when de-serializing.@@@@@@@@@@@��B�  , ���5create ?min_size ~cmp��	' returns a new min-heap that can store ��(min_size��	? elements
      without reallocations, using ordering function ��#cmp��!.�@��	~      The top of the heap is the smallest element as determined by the provided comparison
      function.  In particular, if ��+cmp x y < 0��& then ��!x��5 will be "on top of" ��!y��3 in the
      heap.�@��	+      Memory use is surprising in two ways:�@��	�      1. The underlying pool never shrinks, so current memory use will at least be
      proportional to the largest number of elements that the heap has ever held.�@��	*      2. Not all the memory is freed upon ��&remove��	3, but rather after some number of
      subsequent ��#pop��9 operations. Alternating ��#add��% and ��&remove��	5 operations can therefore
      use unbounded memory.@@@@@@@@@@@��B�  , ���1of_array arr ~cmp��! ��(min_size��& (see ��&create��=) will be set to the size of ��#arr��!.@@@@@@@@@@@��B�  , ���	4returns the top (i.e., smallest) element of the heap@@@@@@@@@@@��B�  , ���,remove_top t��1 does nothing if ��!t��) is empty@@@@@@@@@@@��B�  , ���	5This removes and returns the top (i.e. least) element@@@@@@@@@@@��B�  , ���-pop_if t cond��) returns ��0Some top_element��$ of ��!t��	! if it satisfies condition
      ��$cond��2, removing it, or ��$None��3 in any other case.@@@@@@@@@@@��B�  , ���&copy t��7 returns a shallow copy@@@@@@@@@@@@@