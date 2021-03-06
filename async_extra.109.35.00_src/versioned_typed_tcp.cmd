Caml2013E001¦¾  Iù  H  +ä  $ò°3Versioned_typed_tcp:lib/versioned_typed_tcp.ml   @@  A@   	1Bigsubstring_allocator_got_invalid_requested_size@ 
  6bigsubstring_allocator@  §$Name °¡!t@@@ °@@@ °@@@ °@@@ °@@@@@  ¢+marshal_fun@@  ¢-unmarshal_fun@@  0protocol_version@  ¥'Version£  @@  #add@@ °¡!t@@@ °#min@@ °&of_int@@ °&to_int@@ °#add@@ °@@@ °)t_of_sexp@@ °)sexp_of_t@@ °%bin_t@@ °*bin_read_t@@ °+bin_read_t_@@ °,bin_read_t__@@ °,bin_reader_t@@ °*bin_size_t@@ °+bin_write_t@@ °,bin_write_t_@@ °,bin_writer_t@@@@             §(Versions °+low_version@@ °,prod_version@@ °,test_version@@@@  §)Datumable °¡%datum@@@ °@@@ °2lookup_marshal_fun  ,  4lookup_marshal_fun v ? This function takes a version  !v 	Y, and returns a
      function that will downgrade (if necessary) the current version to  !v 
  G and
      then write it to a bigsubstring. It is perfectly fine if one message
      becomes zero or more messages as a result of downgrading, this is why the
      marshal fun returns a list. The contents of these buffers will be copied
      immediatly, so it is safe to reuse the same bigstring for multiple
      marshals.@@@@@@@@@@@@ °4lookup_unmarshal_fun  ,  6lookup_unmarshal_fun v ? This function takes a version  !v 
  %, and returns a
      function that unmarshals a message and upgrades it, returning zero or more
      messages as a result of the upgrade. The bigsubstring is only guaranteed
      to contain valid data until the unmarshal function returns, after which it
      may be overwritten immediatly.@@@@@@@@@@@@@  ,  	This module describes the type of a given direction of message
    flow. For example it might describe the type of messages from the
    client to the server.@@@@@@@@@@@  §%Datum °¡!t@@@ °@@@@@  §$Mode °¡!t@@@ °'current@@ °!=@@ °@@@ °@@@@  ,  
  ¬This module may be used to implement modes for clients/servers. A
    common scheme is to have two modes, Test, and Production, and to
    want to maintain the invariant that clients in mode Test may not
    talk to servers in mode Production, and that clients in mode
    Production may not talk to servers in mode Test. Versioned
    connection will check that the mode of the client is the same as
    the mode of the server. @ 	A    If you don't care about modes, just use Dont_care_about_mode.@@@@@@@@@@@  ¥4Dont_care_about_mode  ¢!t  4Dont_care_about_mode@@@    -__t_of_sexp__@ &  )t_of_sexp@ ,  )sexp_of_t@ 2  *bin_size_t@ 8  ,bin_write_t_@ >  +bin_write_t@ D  ,bin_writer_t@ J  ,bin_read_t__@ P  +bin_read_t_@ V  *bin_read_t@ \  ,bin_reader_t@ b  %bin_t@ h  'current@  !=@@@  ¥+Read_result  ¢!t  $from@  "ip@  -time_received@  )time_sent@  $data@@@   -__t_of_sexp__@   )t_of_sexp@   )sexp_of_t@   *bin_size_t@ ¤  ,bin_write_t_@ ª  +bin_write_t@ °  ,bin_writer_t@ ¶  ,bin_read_t__@ ¼  +bin_read_t_@ Â  *bin_read_t@ È  ,bin_reader_t@ Î  %bin_t@ Ô@@  ¥*Server_msg  ¥'Control  ¢!t  ,Unauthorized@  )Duplicate@  *Wrong_mode@  0Too_many_clients@  +Almost_full@  'Connect@  *Disconnect@  +Parse_error@  .Protocol_error@@@ ÿ  *bin_size_t@   ,bin_write_t_@   +bin_write_t@   ,bin_writer_t@   ,bin_read_t__@   +bin_read_t_@ #  *bin_read_t@ )  ,bin_reader_t@ /  %bin_t@ 5  -__t_of_sexp__@ ;  )t_of_sexp@ A  )sexp_of_t@ G@@  ¢!t  'Control@  $Data@@@@@  ¥*Client_msg  ¥'Control  ¢!t  *Connecting@  'Connect@  *Disconnect@  +Parse_error@  .Protocol_error@@@ q  *bin_size_t@ w  ,bin_write_t_@ }  +bin_write_t@   ,bin_writer_t@   ,bin_read_t__@   +bin_read_t_@   *bin_read_t@   ,bin_reader_t@ ¡  %bin_t@ §  -__t_of_sexp__@ ­  )t_of_sexp@ ³  )sexp_of_t@ ¹@@  ¢!t  'Control@  $Data@@@ Å  -__t_of_sexp__@ Ë  )t_of_sexp@ Ñ  )sexp_of_t@ ×  *bin_size_t@ Ý  ,bin_write_t_@ ã  +bin_write_t@ é  ,bin_writer_t@ ï  ,bin_read_t__@ õ  +bin_read_t_@ û  *bin_read_t@   ,bin_reader_t@   %bin_t@ @@  §#Arg °£$Send@@@ °£$Recv@@@ °£+Remote_name@@@ °£'My_name@@@ °£$Mode@@@@@  §!S °@@@ °¡&logfun@@@ °£&Server °¡!t@@@ °@@@ °&create  ,  	(create a new server, and start listening@@@@@@@@@@@@ °$port  ,  	,get the port that the server is listening on@@@@@@@@@@@@ °%close  ,  .close t client 5 close connection to  &client 	a if it
        exists. This does not prevent the same client from connecting
        again later.@@@@@@@@@@@@ °&listen  ,  (listen t 	@ listen to the stream of messages and errors coming from clients@@@@@@@@@@@@ °4listen_ignore_errors  ,  6listen_ignore_errors t 	Ó like listen, but omit error conditions and
        metadata. When listen_ignore_errors is called it installs a filter on
        the stream that never goes away (unless t is destroyed, or you
        provide a  $stop ").@@@@@@@@@@@@ °$send  ,  1send t client msg & send  #msg $ to  &client !.@@@@@@@@@ 	»a
        deferred that will become determined when the message has been
        sent.  In the case of an error, the message will be dropped,
        and the deferred will be filled with  (`Dropped 	i (meaning the
        message was never handed to the OS), otherwise it will be
        filled with with  (`Sent tm 
   where tm is the time (according to
        Time.now) that the message was handed to the operating
        system.  It is possible that the deferred will never become
        determined, for example in the case that the other side hangs,
        but does not drop the connection.@@@ °2send_ignore_errors  ,  ?send_ignore_errors t client msg 	® Just like send, but does not report
        results. Your message will probably be sent successfully
        sometime after you call this function. If you receive a
         *Disconnect 	~ error on the listen channel in close time
        proximity to making this call then your message was likely
        dropped.@@@@@@@@@@@@ °+send_to_all  ,  1send_to_all t msg 	0 send the same message to all connected clients.@@@@@@@@@@@@ °9send_to_all_ignore_errors  ,  ?send_to_all_ignore_errors t msg + Just like  +send_to_all 	% but with no error
        reporting.@@@@@@@@@@@@ °,send_to_some  ,  8send_to_some t msg names 	5 send the same message to multiple connected clients.@@@@@@@@@@@@ °:send_to_some_ignore_errors  ,  	 send_to_some_ignore_errors t msg + Just like  ,send_to_some 	% but with no error
        reporting.@@@@@@@@@@@@ °3client_send_version@@ °'flushed@@ °(shutdown@@@@@ °£&Client °¡!t@@@ °&create  ,  	,create a new (initially disconnected) client@@@@@@@@@@@@ °'connect  ,  )connect t 	> If the connection is not currently established, initiate one.@@@@@@@@@ 	Fa deferred that becomes determined when the connection is established.@@@ °0close_connection  ,  	gIf a connection is currently established, close it.  Also, if we're trying to
        connect, give up.@@@@@@@@@@@@ °&listen  ,  (listen t@@@@@@@@@ 	/a stream of messages from the server and errors@@@ °4listen_ignore_errors  ,  6listen_ignore_errors t & like  &listen 
  1, but with no errors or meta data.  When
        listen_ignore_errors is called it installs a filter on the stream that never
        goes away (unless t is destroyed or you provide a stop), so you should
        not call it many times throwing away the result.  If you need to do this
        use listen.@@@@@@@@@@@@ °$send  ,  *send t msg 	d send a message to the server. If the connection is
        not currently established, initiate one.@@@@@@@@@ 	_a deferred that is filled in with either the time the
        message was handed to the OS, or  (`Dropped ".  (`Dropped 	I means that
        there was an error, and the message will not be sent.@@@ °2send_ignore_errors  ,  4send_ignore_errors t . exactly like  $send = but with no error reporting.@@@@@@@@@@@@ °%state  ,  'state t@@@@@@@@@ ;the state of the connection@@@ °2last_connect_error  ,  4last_connect_error t 	Q returns the error (if any) that happened on the
        last connection attempt.@@@@@@@@@@@@ °'flushed@@@@@@@  ¥$Make¡@£  @@  ¥)Constants  1negotiate_timeout@  .wait_after_exn@  :wait_after_connect_failure@  /connect_timeout@@@ Í  ¢&logfun@@  ¥%Hello  ¢!t  $name@  $mode@  ,send_version@  ,recv_version@  +credentials@@@ î  *bin_size_t@ ô  ,bin_write_t_@ ú  +bin_write_t@    ,bin_writer_t@   ,bin_read_t__@   +bin_read_t_@   *bin_read_t@   ,bin_reader_t@   %bin_t@ $  -__t_of_sexp__@ *  )t_of_sexp@ 0  )sexp_of_t@ 6  &create@@@  ¥.Message_header  ¢!t  *time_stamp@  +body_length@@@ L  *bin_size_t@ R  ,bin_write_t_@ X  +bin_write_t@ ^  ,bin_writer_t@ d  ,bin_read_t__@ j  +bin_read_t_@ p  *bin_read_t@ v  ,bin_reader_t@ |  %bin_t@   -__t_of_sexp__@   )t_of_sexp@   )sexp_of_t@ @@  ¥*Connection  ¢!t  &writer@  &reader@  +marshal_fun@  -unmarshal_fun@  ,send_version@  $name@  $kill@@@  $kill@@@  (try_with@  -ignore_errors@  0try_with_timeout@  ¥4Write_bin_prot_error  ¢!t  $name@  #arg@  #exn@  )backtrace@@@ Þ  )sexp_of_t@ ä  !E@ é@@  3wrap_write_bin_prot@  (send_raw@  -send_no_flush@  $send@  )negotiate@  #Eof@   /Unconsumed_data@   /handle_incoming@  ¥&Server  ¥+Connections£  ¥!C@@  ¢!t  'by_name@  /by_send_version@@@  &create@  $fold@  #mem@  #add@  &remove@  $find@  )maybe_log@  <schedule_bigstring_threshold@  .send_to_some''@  ,send_to_all'@  +send_to_all@  9send_to_all_ignore_errors@  -send_to_some'@  ,send_to_some@  :send_to_some_ignore_errors@@ °¡!t@@@ °&create@@ °#mem@@ °$find@@ °#add@@ °&remove@@ °$fold@@ °+send_to_all@@ °9send_to_all_ignore_errors@@ °,send_to_some@@ °:send_to_some_ignore_errors@@@@  ¢!t  $tail@  &logfun@  +connections@  ,am_listening@  &socket@  9warn_free_connections_pct@  0free_connections@  )when_free@  +max_clients@  7is_client_ip_authorized@  'my_name@  :enforce_unique_remote_name@  #now@  +num_accepts@@@  )invariant@  'flushed@  (shutdown@  $send@  2send_ignore_errors@  +send_to_all@  9send_to_all_ignore_errors@  ,send_to_some@  :send_to_some_ignore_errors@  4client_is_authorized@  %close@  -handle_client@  &listen@  4listen_ignore_errors@  &create@  $port@  3client_send_version@@@  ¥&Client  ¢!t  )remote_ip@  +remote_port@  4expected_remote_name@  1check_remote_name@  &logfun@  'my_name@  (messages@  %queue@  #con@  1trying_to_connect@  0connect_complete@  -ok_to_connect@  #now@  2last_connect_error@@@  3raise_after_timeout@  	&Hello_name_is_not_expected_remote_name@ e  ,Disconnected@ j  +Write_error@ o  'connect@  'flushed@  &listen@  4listen_ignore_errors@  -internal_send@  &send_q@  ,is_connected@  +purge_queue@  +try_connect@  $send@  0close_connection@  'connect@  2send_ignore_errors@  %state@  &create@  2last_connect_error@@@@@@  ¥4Datumable_of_binable  §!T °¡!t@@@@@  §%T_bin °¡!t@@@ °%bin_t@@ °*bin_read_t@@ °+bin_read_t_@@ °,bin_read_t__@@ °,bin_reader_t@@ °*bin_size_t@@ °+bin_write_t@@ °,bin_write_t_@@ °,bin_writer_t@@@@ ü  ¥!V¡@¡@  §!S °$of_v@@ °$to_v@@@@@@  ¥/Make_datumable5¡@¡@¡@¡@¡@¡@¡@¡@¡@¡@¡@¡@£  ¢!t@@  ¢%datum@@  @@ .  %alloc@  'marshal@  )unmarshal@  ¥!F¡@¡@  !f@@@  ¥"F1¢¢@@@@  ¥"F2¢¢@@@@  ¥"F3¢¢@@@@  ¥"F4¢¢@@@@  ¥"F5¢¢@@@@  $funs@  &lookup@  2lookup_marshal_fun@  4lookup_unmarshal_fun@@@@  §,Pre_versions °+low_version@@ °,prod_version@@@@  ¥-Five_versions¡@¡@¡@¡@¡@¡@¡@¡@¡@¡@¡@¡@£¢¢¢¢¢¢¢¢¢¢¢¢@  @@  ,test_version@@@@@@@@@@@@@@@  ¥-Four_versions¡@¡@¡@¡@¡@¡@¡@¡@¡@¡@£¢¢¢¢¢¢¢¢¢¢¢¢@  @@  ,test_version@@@@@@@@@@@@@@@  ¥.Three_versions¡@¡@¡@¡@¡@¡@¡@¡@£¢¢¢¢¢¢¢¢¢¢¢¢@  @@  ,test_version@@@@@@@@@@@@@@@  ¥,Two_versions¡@¡@¡@¡@¡@¡@£¢¢¢¢¢¢¢¢¢¢¢¢@  @@  ,test_version@@@@@@@@@@@@@@@  ¥+One_version¡@¡@¡@¡@£¢¢¢¢¢¢¢¢¢¢¢¢@  @@  ,test_version@@@@@@@@@@@@@@@@  ,  	uHelpers to make your types Datumable if they are binable. Works with up
    to 5 versions (easily extensible to more)@@@@@@@@@@@ 	?  B  ,  	This module describes the type of a given direction of message
    flow. For example it might describe the type of messages from the
    client to the server.@@@@@@@@@@@  B  ,  4lookup_marshal_fun v ? This function takes a version  !v 	Y, and returns a
      function that will downgrade (if necessary) the current version to  !v 
  G and
      then write it to a bigsubstring. It is perfectly fine if one message
      becomes zero or more messages as a result of downgrading, this is why the
      marshal fun returns a list. The contents of these buffers will be copied
      immediatly, so it is safe to reuse the same bigstring for multiple
      marshals.@@@@@@@@@@@  B  ,  6lookup_unmarshal_fun v ? This function takes a version  !v 
  %, and returns a
      function that unmarshals a message and upgrades it, returning zero or more
      messages as a result of the upgrade. The bigsubstring is only guaranteed
      to contain valid data until the unmarshal function returns, after which it
      may be overwritten immediatly.@@@@@@@@@@@  B  ,  
  ¬This module may be used to implement modes for clients/servers. A
    common scheme is to have two modes, Test, and Production, and to
    want to maintain the invariant that clients in mode Test may not
    talk to servers in mode Production, and that clients in mode
    Production may not talk to servers in mode Test. Versioned
    connection will check that the mode of the client is the same as
    the mode of the server. @ 	A    If you don't care about modes, just use Dont_care_about_mode.@@@@@@@@@@@  B  ,  	(create a new server, and start listening@@@@@@@@@@@  B  ,  >defualt: Scheduler.cycle_start@@@@@@@@@@@  B  ,  ;remote names must be unique@@@@@@@@@@@  B  ,  	"warn_when_free_connections_lte_pct 	ò.  If the number of free connections falls
          below this percentage of max connections an Almost_full event will be generated.
          The default is 5%.  It is required that 0.0 <=
          warn_when_free_connections_lte_pct <= 1.0@@@@@@@@@@@  B  ,  	"max connected clients. default 500@@@@@@@@@@@  B  ,  	,get the port that the server is listening on@@@@@@@@@@@  B  ,  .close t client 5 close connection to  &client 	a if it
        exists. This does not prevent the same client from connecting
        again later.@@@@@@@@@@@  B  ,  (listen t 	@ listen to the stream of messages and errors coming from clients@@@@@@@@@@@  B  ,  6listen_ignore_errors t 	Ó like listen, but omit error conditions and
        metadata. When listen_ignore_errors is called it installs a filter on
        the stream that never goes away (unless t is destroyed, or you
        provide a  $stop ").@@@@@@@@@@@  B  ,  1send t client msg & send  #msg $ to  &client !.@@@@@@@@@ 	»a
        deferred that will become determined when the message has been
        sent.  In the case of an error, the message will be dropped,
        and the deferred will be filled with  (`Dropped 	i (meaning the
        message was never handed to the OS), otherwise it will be
        filled with with  (`Sent tm 
   where tm is the time (according to
        Time.now) that the message was handed to the operating
        system.  It is possible that the deferred will never become
        determined, for example in the case that the other side hangs,
        but does not drop the connection.@@  B  ,  ?send_ignore_errors t client msg 	® Just like send, but does not report
        results. Your message will probably be sent successfully
        sometime after you call this function. If you receive a
         *Disconnect 	~ error on the listen channel in close time
        proximity to making this call then your message was likely
        dropped.@@@@@@@@@@@  B  ,  1send_to_all t msg 	0 send the same message to all connected clients.@@@@@@@@@@@  B  ,  ?sent successfuly to all clients@@@@@@@@@@@  B  ,  	#not sent successfully to any client@@@@@@@@@@@  B  ,  4sent to some clients@@@@@@@@@@@  B  ,  ?send_to_all_ignore_errors t msg + Just like  +send_to_all 	% but with no error
        reporting.@@@@@@@@@@@  B  ,  8send_to_some t msg names 	5 send the same message to multiple connected clients.@@@@@@@@@@@  B  ,  ?sent successfuly to all clients@@@@@@@@@@@  B  ,  	#not sent successfully to any client@@@@@@@@@@@  B  ,  4sent to some clients@@@@@@@@@@@  B  ,  	 send_to_some_ignore_errors t msg + Just like  ,send_to_some 	% but with no error
        reporting.@@@@@@@@@@@  B  ,  	,create a new (initially disconnected) client@@@@@@@@@@@  B  ,  >defualt: Scheduler.cycle_start@@@@@@@@@@@  B  ,  	,remote name must match expected remote name.@@@@@@@@@@@  B  ,  )connect t 	> If the connection is not currently established, initiate one.@@@@@@@@@ 	Fa deferred that becomes determined when the connection is established.@@  B  ,  	gIf a connection is currently established, close it.  Also, if we're trying to
        connect, give up.@@@@@@@@@@@  B  ,  (listen t@@@@@@@@@ 	/a stream of messages from the server and errors@@  B  ,  6listen_ignore_errors t & like  &listen 
  1, but with no errors or meta data.  When
        listen_ignore_errors is called it installs a filter on the stream that never
        goes away (unless t is destroyed or you provide a stop), so you should
        not call it many times throwing away the result.  If you need to do this
        use listen.@@@@@@@@@@@  B  ,  *send t msg 	d send a message to the server. If the connection is
        not currently established, initiate one.@@@@@@@@@ 	_a deferred that is filled in with either the time the
        message was handed to the OS, or  (`Dropped ".  (`Dropped 	I means that
        there was an error, and the message will not be sent.@@  B  ,  4send_ignore_errors t . exactly like  $send = but with no error reporting.@@@@@@@@@@@  B  ,  'state t@@@@@@@@@ ;the state of the connection@@  B  ,  4last_connect_error t 	Q returns the error (if any) that happened on the
        last connection attempt.@@@@@@@@@@@  B  ,  ?sent successfuly to all clients@@@@@@@@@@@  B  ,  	#not sent successfully to any client@@@@@@@@@@@  B  ,  4sent to some clients@@@@@@@@@@@  B  ,  ?sent successfuly to all clients@@@@@@@@@@@  B  ,  	#not sent successfully to any client@@@@@@@@@@@  B  ,  4sent to some clients@@@@@@@@@@@  B  ,  	uHelpers to make your types Datumable if they are binable. Works with up
    to 5 versions (easily extensible to more)@@@@@@@@@@@@@