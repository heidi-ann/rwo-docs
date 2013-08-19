Caml2013E001ฆพ  ข    ฎ  ึฐ*Search_foo1lib/search_foo.ml   @@  A@  ข*comparison@@  (cmp_fasc  ,  <cf Jane.Std.Common.ascending@@@@@@@@@@@  )cmp_fdesc  ,  =cf Jane.Std.Common.descending@@@@@@@@@@@  $maxf  ,  1Given a function  !f 9, returns a maximizer of  !f !.@@@@@@@@@@@  $minf  ,  1Given a function  !f 9, returns a minimizer of  !f !.@@@@@@@@@@@  (in_order@  'max_len@  0bsearch_internal  ,  .Binary search. @ 	\    (f i) returns an integer and should be monotonic.
    f should have values for all i in  (low,high ,, inclusive. @ 0    if \E i \in  (low,high 	๛ such that (f i) = 0,
    then such an i is returned.
    Otherwise, i is returned such that (f i > 0) and (f (i-1) < 0).
    Unless it's all > 0 or all < 0.
    If it's all > 0, then the first i is returned.
    If it's all < 0 , then raise Not_found@@@@@@@@@@@  +bsearch_opt@  +bsearch_exn@  'bsearch@  ข/poly_comparison@@  1bsearch2_internal@  ,bsearch2_opt@  ,bsearch2_exn@  (bsearch2@  4bsearch_val_internal  ,  	ทsimilar to bsearch, but returns (index,value) pair.
    f is expected to return a (test,value) pair,
    where test is like the output of f above, and value is some
    related value.@@@@@@@@@@@  /bsearch_val_opt@  /bsearch_val_exn@  +bsearch_val@ ท  B  ,  <cf Jane.Std.Common.ascending@@@@@@@@@@@  B  ,  =cf Jane.Std.Common.descending@@@@@@@@@@@  B  ,  1Given a function  !f 9, returns a maximizer of  !f !.@@@@@@@@@@@  B  ,  1Given a function  !f 9, returns a minimizer of  !f !.@@@@@@@@@@@  B  ,  .Binary search. @ 	\    (f i) returns an integer and should be monotonic.
    f should have values for all i in  (low,high ,, inclusive. @ 0    if \E i \in  (low,high 	๛ such that (f i) = 0,
    then such an i is returned.
    Otherwise, i is returned such that (f i > 0) and (f (i-1) < 0).
    Unless it's all > 0 or all < 0.
    If it's all > 0, then the first i is returned.
    If it's all < 0 , then raise Not_found@@@@@@@@@@@  B  ,  	ทsimilar to bsearch, but returns (index,value) pair.
    f is expected to return a (test,value) pair,
    where test is like the output of f above, and value is some
    related value.@@@@@@@@@@@@@