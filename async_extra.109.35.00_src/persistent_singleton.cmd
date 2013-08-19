Caml2013E001¦¾  §   V  ±  M°4Persistent_singleton;lib/persistent_singleton.ml   @@  B  ,  
  !Implements a value that is either in a file, or in memory, but not both. Is used by
    live and the friend to store sequence numbers and counters. If the value is moved to
    memory, changed, and then the process crashes, the file will correctly reflect that
    the value has been lost.@@@@@@@@@@@  A@   §#Arg@@  §!S °¡4persistent_singleton@@@ °$load@@ °$save@@@@  ¥$Make¡@£  ¢4persistent_singleton@@  )save_sexp@  	%Can_not_determine_whether_file_exists@ 7  	$Can_not_load_due_to_unclean_shutdown@ <  $load@  $save@@@@ H  B  ,  
  !Implements a value that is either in a file, or in memory, but not both. Is used by
    live and the friend to store sequence numbers and counters. If the value is moved to
    memory, changed, and then the process crashes, the file will correctly reflect that
    the value has been lost.@@@@@@@@@@@@@