Caml2013E001����  �    �  �(Readline/lib/readline.ml�����@@��A@����)completer@@����*registered@����*cleanupFun@����.unwind_protect�  , ���	(Finally is always run, even if we press ��(ctrl + c�@��	   This is used because we HAVE to restore the terminal when we exit otherwise
   we will face the wrath of very angry users!!!�@��	0   This function cannot be used in nested calls.@@@@@@@@@@@����-with_readline@����(mainloop@���'History����!t���$size@��'current@��'pending@@@����&create@����%flush@����'to_list@����'of_list@����(snapshot@����#add@����$null@����'default@@�  , ���5Handling the history.�@��	D   We do this in a very quick and dirty way:
   _We keep two lists: ��'current��% and ��'pending��	6 and append to both;
   when pending's length reaches ��$size��+ we rotate ��'pending��$ to ��'current��< and place
   a new list in ��'pending��!.@@@@@@@@@@@����*input_line@����.input_line_eof@����(password@����'confirm@����&choice@����B�  , ���	(Finally is always run, even if we press ��(ctrl + c�@��	   This is used because we HAVE to restore the terminal when we exit otherwise
   we will face the wrath of very angry users!!!�@��	0   This function cannot be used in nested calls.@@@@@@@@@@@��B�  , ���5Handling the history.�@��	D   We do this in a very quick and dirty way:
   _We keep two lists: ��'current��% and ��'pending��	6 and append to both;
   when pending's length reaches ��$size��+ we rotate ��'pending��$ to ��'current��< and place
   a new list in ��'pending��!.@@@@@@@@@@@��B�  , ���=Failed to assign a short char@@@@@@@@@@@@@