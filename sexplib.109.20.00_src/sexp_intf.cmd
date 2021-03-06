Caml2013E001����  T_  
�  .�  &{�)Sexp_intf0lib/sexp_intf.ml����A@����!S����!t���$Atom@��$List@@�  , ���5Type of S-expressions@@@@@@@@@@@�  , ���2Type of bigstrings@@@@@@@@@@@���)bigstring@@@��A�  , ���F@��(Defaults@@@@@@@@@@@@@���.default_indent@�  , ���.default_indent��	g reference to default indentation level for
      human-readable conversions.  Initialisation value: 2.@@@@@@@@@@@��A�  , ���F@��1S-expression size@@@@@@@@@@@@@���$size@�  , ���)size sexp@@@@@@@@@���2(n_atoms, n_chars)��(, where ��'n_atoms��	. is
      the number of atoms in S-expression ��$sexp��&, and ��'n_chars��	D is the
      number of characters in the atoms of the S-expression.@@��A�  , ���F@��.Scan functions@@@@@@@@@@@@@���)scan_sexp@�  , ���5scan_sexp ?buf lexbuf��	- scans an S-expression from lex buffer
      ��&lexbuf��	" using the optional string buffer ��#buf��	( for storing
      intermediate strings.@@@@@@@@@@@���*scan_sexps@�  , ���6scan_sexps ?buf lexbuf��	J reads a list of whitespace separated
      S-expressions from lex buffer ��&lexbuf��	( using the optional string
      buffer ��#buf��	" for storing intermediate strings.@@@@@@@@@@@���.scan_rev_sexps@�  , ���:scan_rev_sexps ?buf lexbuf��) same as ��@*scan_sexps@��	E, but returns the
      reversed list and is slightly more efficient.@@@@@@@@@@@���-scan_sexp_opt@�  , ���9scan_sexp_opt ?buf lexbuf��2 is equivalent to ��5scan_sexp ?buf lexbuf��>
      except that it returns ��$None��9 when the eof is reached.@@@@@@@@@@@���/scan_iter_sexps@�  , ���>scan_iter_sexps ?buf ~f lexbuf��	T iterates over all whitespace
      separated S-expressions scanned from lex buffer ��&lexbuf��6 using
      function ��!f��	!, and the optional string buffer ��#buf��	( for storing
      intermediate strings.@@@@@@@@@@@���/scan_fold_sexps@�  , ���	$scan_fold_sexps ?buf ~f ~init lexbuf��	Q folds over all whitespace
      separated S-expressions scanned from lex buffer ��&lexbuf��6 using
      function ��!f��0, initial state ��$init��	', and the optional string buffer
      ��#buf��	" for storing intermediate strings.@@@@@@@@@@@���/scan_sexps_conv@�  , ���>scan_sexps_conv ?buf ~f lexbuf��	K maps all whitespace separated
      S-expressions scanned from lex buffer ��&lexbuf��	# to some list using
      function ��!f��	!, and the optional string buffer ��#buf��	( for storing
      intermediate strings.@@@@@@@@@@@��A�  , ���F@��	4Type and exception definitions for (partial) parsing@@@@@@@@@@@@@���)Parse_pos����!t���)text_line�  , ���<Line position in parsed text@@@@@@@@@@@��)text_char�  , ���	!Character position in parsed text@@@@@@@@@@@��-global_offset�  , ���5Global/logical offset@@@@@@@@@@@��'buf_pos�  , ���>Read position in string buffer@@@@@@@@@@@@�  , ���	)Position information after complete parse@@@@@@@@@@@@���&create@�  , ���	7create ?text_line ?text_char ?buf_pos ?global_offset ()@@@@@@@��)text_line��*default = ��!1@��)text_char��*default = ��!0@��-global_offset��*default = ��!0@��'buf_pos��*default = ��!0@@@���	+a parse position with the given parameters.@@���,with_buf_pos@�  , ���2with_buf_pos t pos@@@@@@@@@���=a copy of the parse position ��!t��/ where
        ��'buf_pos��+ is set to ��#pos��!.@@@@@���*Cont_state����!t���2Parsing_whitespace@��,Parsing_atom@��,Parsing_list@��4Parsing_sexp_comment@��5Parsing_block_comment@@�  , ���=State of parser continuations@@@@@@@@@@@@���)to_string@�  , ���4to_string cont_state��	/ converts state of parser continuation
        ��*cont_state��- to a string.@@@@@@@@@@@@@@���,parse_result���$Done�  , ���3Done (t, parse_pos)��	� finished parsing
                                    an S-expression.  Current parse position
                                    is ��)parse_pos��!.@@@@@@@@@@@��$Cont�  , ���<Cont (cont_state, parse_fun)��	a met the end of input before completely
          parsing an S-expression.  The user has to call ��)parse_fun��	D to
          continue parsing the S-expression in another buffer.  ��*cont_state��	�
          is the current parsing state of the continuation.
          NOTE: the continuation may only be called once and will raise
          ��'Failure��+ otherwise!@@@@@@@@@@@@�  , ���<Type of result from calling ��@*Sexp.parse@��!.@@@@@@@@@@@@���)parse_fun@�  , ���	9Type of parsing functions with given offsets and lengths.@@@@@@@@@@@@���)Annotated����#pos���$line@��#col@��&offset@@�  , ���	0Position information for annotated S-expressions@@@@@@@@@@@@���%range���)start_pos@��'end_pos@@�  , ���	-Range information for annotated S-expressions@@@@@@@@@@@@���!t���$Atom@��$List@@�  , ���	0S-expression annotated with location information@@@@@@@@@@@�  , ���	6Type of conversion results of annotated S-expressions.@@@@@@@@@@@���$conv@@@���(Conv_exn�  , ���	sException associated with conversion errors.  First argument describes
        the location, the second the reason.@@@@@@@@@@@@���%stack���)positions@��%stack@@�  , ���	 Stack used by annotation parsers@@@@@@@@@@@@���(get_sexp@�  , ���3get_sexp annot_sexp@@@@@@@@@���	<S-expression associated with annotated
        S-expression ��*annot_sexp��!.@@���)get_range@�  , ���4get_range annot_sexp@@@@@@@@@���	9the range associated with annotated
        S-expression ��*annot_sexp��!.@@���)find_sexp@�  , ���9find_sexp annot_sexp sexp@@@@@@@@@���(Some res��' where ��#res��	H is the
        annotated S-expression that is physically equivalent to ��$sexp��, in
        ��*annot_sexp��%, or ��$None��	" if there is no such S-expression.@@��A�  , ���F@��;Annotated (partial) parsing@@@@@@@@@@@@@���%parse@�  , ���9parse ?parse_pos ?len str��) same as ��@%parse@��	J, but returns an
        S-expression annotated with location information.@@@@@@@@@@@���/parse_bigstring@�  , ���	#parse_bigstring ?parse_pos ?len str��) same as ��@/parse_bigstring@��	J,
        but returns an S-expression annotated with location information.@@@@@@@@@@@���*input_sexp@�  , ���8input_sexp ?parse_pos ic��& like ��@*input_sexp@��	8, but returns an
        annotated S-expression instead.@@@@@@@@@@@���+input_sexps@�  , ���>input_sexps ?parse_pos ?buf ic��& like ��@+input_sexps@��	8, but returns
        a list of annotated S-expressions.@@@@@@@@@@@���/input_rev_sexps@�  , ���>input_sexps ?parse_pos ?buf ic��& like ��@/input_rev_sexps@��	8, but
        returns a list of annotated S-expressions.@@@@@@@@@@@��A�  , ���F@��	"Loading of annotated S-expressions@@@@@@@@@@@@@��A�  , ���	[NOTE: these functions should only be used if an annotated S-expression
        is required.@@@@@@@@@@@@���)load_sexp@�  , ���;load_sexp ?strict ?buf file��& like ��@)load_sexp@��	0, but returns an
        annotated S-expression.@@@@@@@@@@@���*load_sexps@�  , ���4load_sexps ?buf file��& like ��@*load_sexps@��	8, but returns a list of
        annotated S-expressions.@@@@@@@@@@@���.load_rev_sexps@�  , ���8load_rev_sexps ?buf file��& like ��@.load_rev_sexps@��	8, but returns a
        list of annotated S-expressions.@@@@@@@@@@@��A�  , ���F@��	 String and bigstring conversions@@@@@@@@@@@@@���)of_string@�  , ���-of_string str��) same as ��@)of_string@��	0, but returns an annotated
        S-expression.@@@@@@@@@@@���,of_bigstring@�  , ���1of_bigstring bstr��) same as ��@)of_string@��=, but operates on bigstrings.@@@@@@@@@@@��A�  , ���	<Converters using annotations for determining error locations@@@@@@@@@@@@���$conv@�  , ���1conv f annot_sexp��	J converts the S-expression associated with
        annotated S-expression ��*annot_sexp��' using ��!f��!.@@@@@@@@@���3`Result
        res��0 on success, or ��<`Error (exn, sub_annot_sexp)��: otherwise, where
        ��#exn��	D is the exception associated with the conversion error, and
        ��.sub_annot_sexp��	B is the annotated S-expression on which conversion
        failed.@@���,get_conv_exn@�  , ���	"get_conv_exn ~file ~exc annot_sexp@@@@@@@@@���	7the exception that
        would be raised for a given ��$file��/ and exception ��#exc��	<
        if conversion had failed on annotated S-expression ��*annot_sexp��	@.
        The format of the exception message is "file:line:col"@@@�  , ���	DModule for parsing S-expressions annotated with location information@@@@@@@@@@@@���+parse_state���)parse_pos�  , ���6Current parse position@@@@@@@@@@@��&pstack�  , ���	!Stack of found S-expression lists@@@@@@@@@@@��$pbuf�  , ���3Current atom buffer@@@@@@@@@@@@�  , ���	'Type of state maintained during parsing@@@@@@@@@@@@���+parse_error���(location�  , ���	"Function in which the parse failed@@@@@@@@@@@��'err_msg�  , ���9Reason why parsing failed@@@@@@@@@@@��+parse_state�  , ���/State of parser@@@@@@@@@@@@�  , ���4Type of parse errors@@@@@@@@@@@@���+Parse_error�  , ���	'Exception raised during partial parsing@@@@@@@@@@@@��A�  , ���F@��=Unannotated (partial) parsing@@@@@@@@@@@@@���%parse@�  , ���9parse ?parse_pos ?len str��	; (partially) parses an S-expression in string buffer
      ��#str��	4 starting out with position information provided in ��)parse_pos��; and reading at
      most ��#len��	� characters.  To parse a single atom that is not delimited by whitespace
      it is necessary to call this function a second time with the returned continuation,
      and a dummy buffer that contains whitespace.�@��&      ��%parse��0 starts parsing ��#str��- at position ��1parse_pos.buf_pos��9.  Each subsequent
      ��)parse_fun��( from a ��$Cont��* uses the ��#buf��% and ��#pos��	* that is supplied to it.  The
      final ��)parse_fun��. that returns ��$Done��- mutates the ��'buf_pos��	" in the originally
      supplied ��)parse_pos��6, and then returns it.@@@@@@@��)parse_pos��*default = ��3Parse_pos.create ()@��#len��*default = ��	/String.length str - parse_pos.Parse_pos.buf_pos@@@@@���/parse_bigstring@�  , ���	#parse_bigstring ?parse_pos ?len str��) same as ��@%parse@��	#, but operates on
      bigstrings.@@@@@@@@@@@���*input_sexp@�  , ���8input_sexp ?parse_pos ic��	1 parses an S-expression from input channel
      ��"ic��	' using initial position information in ��)parse_pos��	8.  NOTE: this
      function is not as fast on files as ��@.Sexp.load_sexp@��	^, and is also
      slightly slower than the scan-functions.  But it is guaranteed that
      ��*input_sexp��	� is only going to read data parseable as an S-expression.
      Thus, subsequent input functions will see the data immediately
      following it.@@@@@@@��)parse_pos��*default = ��3Parse_pos.create ()@@@@@���+input_sexps@�  , ���>input_sexps ?parse_pos ?buf ic��	D parses whitespace separated
      S-expressions from input channel ��"ic��	= until EOF is reached.  Faster than
      the scan-functions.@@@@@@@��)parse_pos��*default = ��3Parse_pos.create ()@@@@@���/input_rev_sexps@�  , ���	"input_rev_sexps ?parse_pos ?buf ic��) same as ��@0Sexp.input_sexps@��	],
      but returns a reversed list of S-expressions, which is slightly more
      efficient.@@@@@@@@@@@��A�  , ���F@��	$Loading of (converted) S-expressions@@@@@@@@@@@@@���)load_sexp@�  , ���;load_sexp ?strict ?buf file��= reads one S-expression from ��$file��4 using
      buffer ��#buf��	F for storing intermediate data.  Faster than the
      scan-functions.@@@@@@@��&strict��*default = ��$true@@��+Parse_error��	#if the S-expression is unparseable.@��'Failure��	Oif parsing reached the end of file before one S-expression
      could be read.@��'Failure��#if ��&strict��	C is true and there is more than one
      S-expression in the file.@@@@���*load_sexps@�  , ���4load_sexps ?buf file��	? reads a list of whitespace separated S-expressions
      from ��$file��. using buffer ��#buf��	E for storing intermediate data.
      Faster than the scan-functions.@@@@@@@@��+Parse_error��	)if there is unparseable data in the file.@��'Failure��	Zif parsing reached the end of file before the last
      S-expression could be fully read.@@@@���.load_rev_sexps@�  , ���8load_rev_sexps ?buf file��) same as ��@/Sexp.load_sexps@��	W, but returns a
      reversed list of S-expressions, which is slightly more efficient.@@@@@@@@@@@���.load_sexp_conv@�  , ���	"load_sexp_conv ?strict ?buf file f��& like ��@.Sexp.load_sexp@��	3, but
      performs a conversion on the fly using ��!f��	0.  Performance is equivalent
      to executing ��@.Sexp.load_sexp@��	� and performing conversion when there
      are no errors.  In contrast to the plain S-expression loader, this
      function not only performs the conversion, it will give exact error
      ranges for conversion errors.@@@@@@@@��+Parse_error��	)if there is unparseable data in the file.@��'Failure��	Zif parsing reached the end of file before the last
      S-expression could be fully read.@@@@���2load_sexp_conv_exn@�  , ���	&load_sexp_conv_exn ?strict ?buf file f��& like ��@.load_sexp_conv@��	2,
      but returns the converted value or raises ��-Of_sexp_error��	I with exact
      location information in the case of a conversion error.@@@@@@@@@@@���/load_sexps_conv@�  , ���;load_sexps_conv ?buf file f��& like ��@/Sexp.load_sexps@��	3, but performs
      a conversion on the fly using ��!f��	0.  Performance is equivalent to
      executing ��@/Sexp.load_sexps@��	� and performing conversion when there
      are no errors.  In contrast to the plain S-expression loader, this
      function not only performs the conversion, it will give exact error
      ranges for conversion errors.@@@@@@@@��+Parse_error��	)if there is unparseable data in the file.@��'Failure��	Zif parsing reached the end of file before the last
      S-expression could be fully read.@@@@���3load_sexps_conv_exn@�  , ���?load_sexps_conv_exn ?buf file f��& like ��@/load_sexps_conv@��	2, but returns
      the converted value or raises ��-Of_sexp_error��	I with exact location
      information in the case of a conversion error.@@@@@@@@@@@��A�  , ���F@��	'Output of S-expressions to I/O-channels@@@@@@@@@@@@@��A�  , ���
  mNOTE: for performance reasons these output functions may need to
      allocate large strings to write out huge S-expressions.  This may
      cause problems on 32-bit platforms.  If you think that you may need to
      write huge S-expressions on such platforms, you might want to use the
      pretty-printers that write to formatters instead (see further below).@@@@@@@@@@@@���*output_hum@�  , ���2output_hum oc sexp��6 outputs S-expression ��$sexp��9 to output channel
      ��"oc��8 in human readable form.@@@@@@@@@@@���1output_hum_indent@�  , ���	 output_hum_indent indent oc sexp��6 outputs S-expression ��$sexp��9
      to output channel ��"oc��	6 in human readable form using indentation level
      ��&indent��!.@@@@@@@@@@@���+output_mach@�  , ���3output_mach oc sexp��6 outputs S-expression ��$sexp��9 to output channel
      ��"oc��	. in machine readable (i.e. most compact) form.@@@@@@@@@@@���&output@�  , ���.output oc sexp��) same as ��+output_mach��!.@@@@@@@@@@@��A�  , ���F@��?Output of S-expressions to file@@@@@@@@@@@@@��A�  , ���	�All save-functions write to a temporary file before moving it into
      place to avoid intermittent garbling of existing files, which may
      cause problems for other processes that try to read.@@@@@@@@@@@@���(save_hum@�  , ���8save_hum ?perm file sexp��6 outputs S-expression ��$sexp��$ to ��$file��> in human
      readable form.@@@@@@@��$perm��/default = umask@@@@@���)save_mach@�  , ���9save_mach ?perm file sexp��6 outputs S-expression ��$sexp��$ to ��$file��	4
      in machine readable (i.e. most compact) form.@@@@@@@��$perm��/default = umask@@@@@���$save@�  , ���4save ?perm file sexp��) same as ��@)save_mach@��!.@@@@@@@@@@@���.save_sexps_hum@�  , ���?save_sexps_hum ?perm file sexps��; outputs S-expression list ��%sexps��* to
      ��$file��	? in human readable form, each sexp being followed by a newline.@@@@@@@��$perm��/default = umask@@@@@���/save_sexps_mach@�  , ���	 save_sexps_mach ?perm file sexps��; outputs S-expression list ��%sexps��* to
      ��$file��	G in machine readable form, each sexp being followed by a
      newline.@@@@@@@��$perm��/default = umask@@@@@���*save_sexps@�  , ���:save_sexps ?perm file sexp��) same as ��@/save_sexps_mach@��!.@@@@@@@@@@@��A�  , ���F@��	%Output of S-expressions to formatters@@@@@@@@@@@@@���&pp_hum@�  , ���/pp_hum ppf sexp��6 outputs S-expression ��$sexp��. to formatter ��#ppf��>
      in human readable form.@@@@@@@@@@@���-pp_hum_indent@�  , ���8pp_hum_indent n ppf sexp��6 outputs S-expression ��$sexp��4 to formatter
      ��#ppf��	. in human readable form and indentation level ��!n��!.@@@@@@@@@@@���'pp_mach@�  , ���0pp_mach ppf sexp��6 outputs S-expression ��$sexp��. to formatter ��#ppf��	4
      in machine readable (i.e. most compact) form.@@@@@@@@@@@���"pp@�  , ���+pp ppf sexp��) same as ��'pp_mach��!.@@@@@@@@@@@��A�  , ���F@��	 String and bigstring conversions@@@@@@@@@@@@@���2Of_string_conv_exn����!t���#exc@��$sexp@��(sub_sexp@@@@���!E@@@�  , ���	`Module encapsulating the exception raised by string converters when
      type conversions fail.@@@@@@@@@@@@���)of_string@�  , ���-of_string str��1 converts string ��#str��	� to an S-expression.  NOTE:
      trailing whitespace is considered an error, which may be overly
      strict for some applications.  Either strip the string of trailing
      whitespace first, or, even cheaper, use ��@%parse@��) instead.@@@@@@@@@@@���.of_string_conv@�  , ���7of_string_conv str conv��& like ��@)of_string@��	*, but performs type conversion
      with ��$conv��!.@@@@@@@@@���2conversion result.@@���2of_string_conv_exn@�  , ���;of_string_conv_exn str conv��& like ��@.of_string_conv@��3, but raises
      ��@4Of_string_conv_exn.E@��: if type conversion fails.@@@@@@@@@���6converted
      value.@@���,of_bigstring@�  , ���1of_bigstring bstr��) same as ��@)of_string@��=, but operates on bigstrings.@@@@@@@@@@@���1of_bigstring_conv@�  , ���;of_bigstring_conv bstr conv��& like ��@,of_bigstring@��	*, but performs
      type conversion with ��$conv��!.@@@@@@@@@���2conversion result.@@���5of_bigstring_conv_exn@�  , ���?of_bigstring_conv_exn bstr conv��& like ��@1of_bigstring_conv@��3, but raises
      ��@4Of_string_conv_exn.E@��: if type conversion fails.@@@@@@@@@���6converted
      value.@@���-to_string_hum@�  , ���:to_string_hum ?indent sexp��7 converts S-expression ��$sexp��	A to a
      string in human readable form with indentation level ��&indent��!.@@@@@@@��&indent��*default = ��/!default_indent@@@@@���.to_string_mach@�  , ���3to_string_mach sexp��7 converts S-expression ��$sexp��	@ to a string in
      machine readable (i.e. most compact) form.@@@@@@@@@@@���)to_string@�  , ���.to_string sexp��) same as ��.to_string_mach��!.@@@@@@@@@@@��A�  , ���F@��2Buffer conversions@@@@@@@@@@@@@���-to_buffer_hum@�  , ���?to_buffer_hum ~buf ?indent sexp��: outputs the S-expression ��$sexp��	>
      converted to a string in human readable form to buffer ��#buf��!.@@@@@@@��&indent��*default = ��/!default_indent@@@@@���.to_buffer_mach@�  , ���8to_buffer_mach ~buf sexp��: outputs the S-expression ��$sexp��	T converted
      to a string in machine readable (i.e. most compact) form to buffer ��#buf��!.@@@@@@@@@@@���)to_buffer@�  , ���3to_buffer ~buf sexp��) same as ��@.to_buffer_mach@��!.@@@@@@@@@@@���-to_buffer_gen@�  , ���	-to_buffer_gen ~buf ~add_char ~add_string sexp��	  outputs the S-expression
      ��$sexp��	! converted to a string to buffer ��#buf��	" using the output functions
      ��(add_char��% and ��*add_string��!.@@@@@@@@@@@��A�  , ���F@��	(Utilities for automated type conversions@@@@@@@@@@@@@���$unit@�  , ���$unit��	0 the unit-value as expressed by an S-expression.@@@@@@@@@@@���)sexp_of_t@�  , ���.sexp_of_t sexp��	h maps S-expressions which are part of a type with
      automated S-expression conversion to themselves.@@@@@@@@@@@���)t_of_sexp@�  , ���.t_of_sexp sexp��	h maps S-expressions which are part of a type with
      automated S-expression conversion to themselves.@@@@@@@@@@@��A�  , ���F@��	'Utilities for conversion error handling@@@@@@@@@@@@@���%found@@�  , ���	$Type of successful search results.  ��&`Found��	K means that an
      S-expression was found at the immediate position, and ��7`Pos (pos,
      found)��	) indicates that it was found at position ��#pos��	6 within a
      structure (= S-expression list) where ��%found��	B describes recursively
      where it was found in that structure.@@@@@@@@@@@���-search_result@@�  , ���9Type of search results.  ��*`Not_found��	L means that an
      S-expression was not found within another S-expression.@@@@@@@@@@@���/search_physical@�  , ���?search_physical sexp ~contained@@@@@@@@@���	Kthe search result
      indicating whether, and if, where the S-expression ��)contained��	%
      was found within S-expression ��$sexp��!.@@���+subst_found@�  , ���=subst_found sexp ~subst found@@@@@@@@@���	6the S-expression that
      results from substituting ��%subst��5 within S-expression ��$sexp��	$
      at the location described by ��%found��!.@@���+With_layout����#pos���#row@��#col@@@@���+sexp_of_pos@@���!t���$Atom@��$List@@�  , ���	CS-expressions annotated with relative source positions and comments@@@@@@@@@@@@���,t_or_comment���$Sexp@��'Comment@@@@���'comment���-Plain_comment@��,Sexp_comment@@@@���)sexp_of_t@@���/sexp_of_comment@@���4sexp_of_t_or_comment@@���&Forget����!t@@���,t_or_comment@@���-t_or_comments@@@@@���&Render�����%asexp@@@���!t@@@���&return@@���$bind@@���$sexp@@���#run@@@@@���&Parser����%token@@@���$sexp@@���(sexp_opt@@���%sexps@@���)rev_sexps@@���)sexps_abs@@@@@���%Lexer����$main@@@@@@�  , ���	CS-expressions annotated with relative source positions and comments@@@@@@@@@@@@@@@�  , ���	ISexp_intf: interface specification for handling S-expressions (I/O, etc.)@@@@@@@@@@@