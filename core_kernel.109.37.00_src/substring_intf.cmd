Caml2013E001¦Ύ     Δ  ³  Q°.Substring_intf5lib/substring_intf.ml   @@  §!S °‘$base@@@ °‘!t@@@ °$base@@ °#pos@@ °&length@@ °&create  ,  5create ?pos ?len base 	5 creates a substring of the base sequence of
 length  #len 6 starting at position  #pos &, i.e. @ (   base. #pos ', base. 'pos + 1 +, ... base. -pos + len - 1 @ 	I It is required that:
   0 <= pos
   0 <= len
   pos + len <= length base @ 	! It does not copy the characters.@@@@@@@@@@@@ °.blit_to_string@@ °1blit_to_bigstring@@ °0blit_from_string@@ °3blit_from_bigstring@@ °&concat@@ °-concat_string@@ °0concat_bigstring@@ °,of_bigstring@@ °)of_string@@ °,to_bigstring@@ °)to_string@@ °+drop_prefix@@ °+drop_suffix@@ °&prefix@@ °&suffix@@@@   B  ,  5create ?pos ?len base 	5 creates a substring of the base sequence of
 length  #len 6 starting at position  #pos &, i.e. @ (   base. #pos ', base. 'pos + 1 +, ... base. -pos + len - 1 @ 	I It is required that:
   0 <= pos
   0 <= len
   pos + len <= length base @ 	! It does not copy the characters.@@@@@@@@@@@@@