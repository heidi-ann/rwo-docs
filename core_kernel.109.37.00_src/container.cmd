Caml2013E001¦Ύ  B  ώ  	Β  ­°)Container0lib/container.ml   @@  A@   §!T °‘!t@@@ °$fold@@@@  *fold_count@  ₯$Make‘@   $fold@  %count@  $iter@  &length@  (is_empty@  &exists@  #mem@  'for_all@  (find_map@  $find@  'to_list@  (to_array@@  ,  4The idiom for using  .Container.Make 	c is to bind the resulting module and to explicitly
    import each of the functions that one wants: @ $     	
      module C = Container.Make (struct ... end)
      let count    = C.count
      let exists   = C.exists
      let find     = C.find
      ...
     @ :    This is preferable to: @ $     	3
      include Container.Make (struct ... end)
     @ 0    because the  'include 	T makes it to easy to shadow specialized implementations of
    container functions ( &length 5 being a common one). @ $     .Container.Make , implements  $iter - in terms of  $fold 	., which is often slower than
    implementing  $iter * directly.@@@@@@@@@@@  §"S0 °‘!t@@@ °‘#elt@@@ °#mem@@ °&length@@ °(is_empty@@ °$iter@@ °$fold@@ °&exists@@ °'for_all@@ °%count@@ °$find@@ °(find_map@@ °'to_list@@ °(to_array@@@@  §*S0_phantom °‘#elt@@@ °‘!t@@@ °#mem@@ °&length@@ °(is_empty@@ °$iter@@ °$fold@@ °&exists@@ °'for_all@@ °%count@@ °$find@@ °(find_map@@ °'to_list@@ °(to_array@@@@  §"S1 °‘!t@@@ °#mem@@ °&length@@ °(is_empty@@ °$iter@@ °$fold@@ °&exists@@ °'for_all@@ °%count@@ °$find@@ °(find_map@@ °'to_list@@ °(to_array@@@@  §*S1_phantom °‘!t@@@ °#mem@@ °&length@@ °(is_empty@@ °$iter@@ °$fold@@ °&exists@@ °'for_all@@ °%count@@ °$find@@ °(find_map@@ °'to_list@@ °(to_array@@@@  §4S1_phantom_invariant °‘!t@@@ °#mem@@ °&length@@ °(is_empty@@ °$iter@@ °$fold@@ °&exists@@ °'for_all@@ °%count@@ °$find@@ °(find_map@@ °'to_list@@ °(to_array@@@@  §'Generic °‘!t@@@ °‘#elt@@@ °#mem@@ °&length@@ °(is_empty@@ °$iter@@ °$fold@@ °&exists@@ °'for_all@@ °%count@@ °$find@@ °(find_map@@ °'to_list@@ °(to_array@@@@  §/Generic_phantom °‘!t@@@ °‘#elt@@@ °#mem@@ °&length@@ °(is_empty@@ °$iter@@ °$fold@@ °&exists@@ °'for_all@@ °%count@@ °$find@@ °(find_map@@ °'to_list@@ °(to_array@@@@  ₯%Check‘@‘@‘@@@  ₯(Check_S0‘@’’’@  ’!t@@@  ’!t@@@@@  ₯0Check_S0_phantom‘@’’’@  ’!t@@@  ’!t@@@@@  ₯(Check_S1‘@’’’@  ’!t@@@  ’!t@@@@@  ’'phantom@@  ₯0Check_S1_phantom‘@’’’@  ’!t@@@  ’!t@@@@@  ₯:Check_S1_phantom_invariant‘@’’’@  ’!t@@@  ’!t@@@@@ ¬  B  ,  4The idiom for using  .Container.Make 	c is to bind the resulting module and to explicitly
    import each of the functions that one wants: @ $     	
      module C = Container.Make (struct ... end)
      let count    = C.count
      let exists   = C.exists
      let find     = C.find
      ...
     @ :    This is preferable to: @ $     	3
      include Container.Make (struct ... end)
     @ 0    because the  'include 	T makes it to easy to shadow specialized implementations of
    container functions ( &length 5 being a common one). @ $     .Container.Make , implements  $iter - in terms of  $fold 	., which is often slower than
    implementing  $iter * directly.@@@@@@@@@@@@@