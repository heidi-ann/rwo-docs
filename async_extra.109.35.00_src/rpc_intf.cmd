Caml2013E001����  &  �  
  -�(Rpc_intf/lib/rpc_intf.ml�����@@��A@����*Connection����/Implementations����!t@@@@@@���!t@@@���&create�  , ���	=Initiate an Rpc connection on the given reader/writer pair.  ��&server��	c should be the
      bag of implementations that the calling side implements; it defaults to
      ��4Implementations.null��? (i.e., "I implement no RPCs").@@@@@@@@@@@@���%close@@���.close_finished@@���)is_closed@@���.bytes_to_write@@���*with_close�  , ���*with_close��3 tries to create a ��!t��	X using the given reader and writer.  If a
      handshake error is the result, it calls ��2on_handshake_error��	W, for which the default
      behavior is to raise an exception.  If no error results, ��0dispatch_queries��4 is
      called on ��!t��!.�@��,      After ��0dispatch_queries��- returns, if ��&server��. is None, the ��!t��	3 will be closed and
      the deferred returned by ��0dispatch_queries��	v wil be determined immediately.
      Otherwise, we'll wait until the other side closes the connection and then close ��!t��	.
      and determine the deferred returned by ��0dispatch_queries��!.�@��	$      When the deferred returned by ��*with_close��: becomes determined, both ��,Reader.close��+
      and ��,Writer.close��/ have finished.@@@@@@@@@@@@���1server_with_close@@���%serve�  , ���	2serve implementations ~port ?on_handshake_error ()��	8 starts a server with the given
      implementation on ��$port��
  p.  The optional auth function will be called on all incoming
      connections with the address info of the client and will disconnect the client
      immediately if it returns false.  This auth mechanism is generic and does nothing
      other than disconnect the client - any logging or record of the reasons is the
      responsibility of the auth function itself.@@@@@@@@@@@@���6Client_implementations����!t���0connection_state@��/implementations@@@@���$null@@@@@���&client�  , ���5client ~host ~port ()��< connects to the server at (��$host��!,��$port��	�) and returns the
      connection or an Error if a connection could not be made.  It is the responsibility
      of the caller to eventually call close.@@@@@@@@@@@@���+with_client�  , ���9with_client ~host ~port f��< connects to the server at (��$host��!,��$port��	\) and runs f
      until an exception is thrown or until the returned Deferred is fulfilled.@@@@@@@@@@@@@@����B�  , ���	=Initiate an Rpc connection on the given reader/writer pair.  ��&server��	c should be the
      bag of implementations that the calling side implements; it defaults to
      ��4Implementations.null��? (i.e., "I implement no RPCs").@@@@@@@@@@@��B�  , ���*with_close��3 tries to create a ��!t��	X using the given reader and writer.  If a
      handshake error is the result, it calls ��2on_handshake_error��	W, for which the default
      behavior is to raise an exception.  If no error results, ��0dispatch_queries��4 is
      called on ��!t��!.�@��,      After ��0dispatch_queries��- returns, if ��&server��. is None, the ��!t��	3 will be closed and
      the deferred returned by ��0dispatch_queries��	v wil be determined immediately.
      Otherwise, we'll wait until the other side closes the connection and then close ��!t��	.
      and determine the deferred returned by ��0dispatch_queries��!.�@��	$      When the deferred returned by ��*with_close��: becomes determined, both ��,Reader.close��+
      and ��,Writer.close��/ have finished.@@@@@@@@@@@��B�  , ���	2serve implementations ~port ?on_handshake_error ()��	8 starts a server with the given
      implementation on ��$port��
  p.  The optional auth function will be called on all incoming
      connections with the address info of the client and will disconnect the client
      immediately if it returns false.  This auth mechanism is generic and does nothing
      other than disconnect the client - any logging or record of the reasons is the
      responsibility of the auth function itself.@@@@@@@@@@@��B�  , ���5client ~host ~port ()��< connects to the server at (��$host��!,��$port��	�) and returns the
      connection or an Error if a connection could not be made.  It is the responsibility
      of the caller to eventually call close.@@@@@@@@@@@��B�  , ���9with_client ~host ~port f��< connects to the server at (��$host��!,��$port��	\) and runs f
      until an exception is thrown or until the returned Deferred is fulfilled.@@@@@@@@@@@@@