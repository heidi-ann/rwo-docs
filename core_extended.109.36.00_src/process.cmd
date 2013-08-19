Caml2013E001¦Ύ  »    Γ  =°'Process.lib/process.ml   @@  A@  ₯#Sys@@  2temp_failure_retry@  .close_non_intr@  ,cloexec_pipe@  ₯,Process_info  ’!t  #pid@  %stdin@  &stdout@  &stderr@@@@@  7internal_create_process@  ₯+Tail_buffer  ’!t  &buffer@  &length@  &looped@  (position@@  ,  	remembers the output in a circular buffer.
      looped is used to tell whether we loop around the
      boundary of the buffer.@@@@@@@@@@@  (contents@  &create@  #add@@  ,  	2Remembers the last n-characters appended to it....@@@@@@@@@@@  ₯&Status  ’!t@@ m  )sexp_of_t@ s  )to_string@@@  ₯.Command_result  ’!t  &status@  +stdout_tail@  +stderr_tail@@@@@  -wait_for_exit  ,  	wait for a given pid to exit;
    returns true when the process exits and false if the process is still runing
    after waiting for  $span@@@@@@@@@@@  $kill@  ’!t  (open_fds@  &in_fds@  'out_fds@  )keep_open@  #buf@  &in_cnt@  &in_len@  -out_callbacks@  #pid@  &in_pos@@@  ,close_pooled@  *process_io@  -available_fds@  &create@  .finish_reading@  (run_loop@  #run@  $kill@ κ  B  ,  	2Remembers the last n-characters appended to it....@@@@@@@@@@@  B  ,  	remembers the output in a circular buffer.
      looped is used to tell whether we loop around the
      boundary of the buffer.@@@@@@@@@@@  B  ,  	wait for a given pid to exit;
    returns true when the process exits and false if the process is still runing
    after waiting for  $span@@@@@@@@@@@@@