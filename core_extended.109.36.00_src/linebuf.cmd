Caml2013E001¦Ύ  [  Ά    ¨°'Linebuf.lib/linebuf.ml   @@  B  ,  ;A module for reading files.@@@@@@@@@@@  A@  ₯'Pos_int@@  0max_null_retries@  ’$lnum  %Known@  'Unknown@@@ !  ,sexp_of_lnum@ '  ’!t  $file  ,  8The channel we maintain.@@@@@@@@@@@  #pos  ,  6Current file position.@@@@@@@@@@@  $lnum  ,  ?Current line position, if known@@@@@@@@@@@  &closed  ,  /Closed or open.@@@@@@@@@@@  %inode  ,  	$The inode number of the current file@@@@@@@@@@@  $name  ,  *File name.@@@@@@@@@@@  #buf@  .follow_deletes  ,  	iclose and reopen the file if it is
                                                deleted and recreated.@@@@@@@@@@@  <signal_on_truncate_or_delete  ,  	Ηraise exception File_truncated_or_deleted if
                                                the inode changed or the size of the file
                                                is less than pos@@@@@@@@@@@  ,close_on_eof  ,  
  whether to close the file on EOF.
                                                Useful for NFS filesystems that
                                                don't promptly notify you when files
                                                change unless you close and reopen@@@@@@@@@@@  )null_hack  ,  	VWhich null_hack_mode to
                                                           use@@@@@@@@@@@  ,null_retries  ,  	΄number of times we've tried to
                                                reread this file in response to a
                                                given null reading.@@@@@@@@@@@  ,eprint_nulls  ,  	hwhether to print a warning message
                                                whenever we hit nulls@@@@@@@@@@@@  ,  6The type of a linebuf.@@@@@@@@@@@  ’*error_type  *Null_retry@  .Too_many_nulls@  )Exception@@@ °  2sexp_of_error_type@ Ά  ’&result  'Success@  1Nothing_available@  %Error@  +Fatal_error@@@ Θ  .sexp_of_result@ Ξ  &create  ,  	+Open a linebuffer from the passed filename.@@@@@@@@@@@  %close  ,  2Close the linebuf.@@@@@@@@@@@  )is_closed@  9File_truncated_or_deleted@ ξ  /possibly_reopen@  1reopen_if_deleted@  *Null_found@ ύ  5Too_many_null_retries@   5try_read_lnum_verbose@  -try_read_lnum@  (try_read@  .read_frequency@  $read@  $tail@  +unsafe_tail@  $name@  %reset@ 0  B  ,  ;A module for reading files.@@@@@@@@@@@  B  ,  6The type of a linebuf.@@@@@@@@@@@  B  ,  8The channel we maintain.@@@@@@@@@@@  B  ,  6Current file position.@@@@@@@@@@@  B  ,  ?Current line position, if known@@@@@@@@@@@  B  ,  /Closed or open.@@@@@@@@@@@  B  ,  	$The inode number of the current file@@@@@@@@@@@  B  ,  *File name.@@@@@@@@@@@  B  ,  	iclose and reopen the file if it is
                                                deleted and recreated.@@@@@@@@@@@  B  ,  	Ηraise exception File_truncated_or_deleted if
                                                the inode changed or the size of the file
                                                is less than pos@@@@@@@@@@@  B  ,  
  whether to close the file on EOF.
                                                Useful for NFS filesystems that
                                                don't promptly notify you when files
                                                change unless you close and reopen@@@@@@@@@@@  B  ,  	VWhich null_hack_mode to
                                                           use@@@@@@@@@@@  B  ,  	΄number of times we've tried to
                                                reread this file in response to a
                                                given null reading.@@@@@@@@@@@  B  ,  	hwhether to print a warning message
                                                whenever we hit nulls@@@@@@@@@@@  B  ,  	+Open a linebuffer from the passed filename.@@@@@@@@@@@  B  ,  2Close the linebuf.@@@@@@@@@@@@@