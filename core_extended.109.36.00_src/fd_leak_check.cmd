Caml2013E001¦Ύ  0   f  ι  v°-Fd_leak_check4lib/fd_leak_check.ml   @@  A@  0fd_possible_dirs  ,  	ίOriginally in unix as Unix.get_num_open_fds. There's no good system
   independent way to gather this information. *BSD systems should look
   in /dev/fd instead of /proc/self/fd. /dev/fd is part of SVR4 but not
   Posix... @ 	+  For a more stable implementation look at: @ 	Y  https://src.chromium.org/viewvc/chrome/trunk/src/base/process_util_posix.cc?view=markup@@@@@@@@@@@  &fd_dir@  -rlimit_nofile@  0get_num_open_fds@  5report_open_files_num@  1report_open_files@  -report_on_exn@  1run_check_at_exit@  (critical@  'max_fds@  -check_fd_leak@ J  2percent_fds_in_use@ P  B  ,  	ίOriginally in unix as Unix.get_num_open_fds. There's no good system
   independent way to gather this information. *BSD systems should look
   in /dev/fd instead of /proc/self/fd. /dev/fd is part of SVR4 but not
   Posix... @ 	+  For a more stable implementation look at: @ 	Y  https://src.chromium.org/viewvc/chrome/trunk/src/base/process_util_posix.cc?view=markup@@@@@@@@@@@@@