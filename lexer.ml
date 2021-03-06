# 4 "lexer.mll"
 
open Print
open Optree
open Dict
open Parser
open Lexing
open Source

let lineno = ref 1                      (* Current line in input file *)

let symtable = 
  Util.make_hash 100
    [ ("array", ARRAY); ("begin", BEGIN);
      ("const", CONST); ("do", DO); ("if", IF ); ("else", ELSE); 
      ("end", END); ("of", OF); ("proc", PROC); ("record", RECORD);
      ("return", RETURN); ("then", THEN); ("to", TO);
      ("type", TYPE); ("var", VAR); ("while", WHILE);
      ("pointer", POINTER); ("nil", NIL);
      ("repeat", REPEAT); ("until", UNTIL); ("for", FOR);
      ("elsif", ELSIF); ("case", CASE);
      ("and", MULOP And); ("div", MULOP Div); ("or", ADDOP Or);
      ("not", NOT); ("mod", MULOP Mod);
      ("break", BREAK);]

let lookup s =
  try Hashtbl.find symtable s with
    Not_found ->
      let t = IDENT (intern s) in
      Hashtbl.add symtable s t; t

(* |strtbl| -- table of string constants from source program *)
let strtbl = ref []

(* |get_string| -- convert a string constant *)
let get_string s =
  let lab = gensym () in
  let n = String.length s in
  let s' = Bytes.create n
  and i = ref 0 and j = ref 0 in
  while !i <> n do
    let c = s.[!i] in
    Bytes.set s' !j c;
    if c = '"' then incr i;
    incr i; incr j
  done;
  strtbl := (lab, Bytes.sub_string s' 0 !j)::!strtbl;
  STRING (lab, !j)

(* |string_table| -- return contents of string table *)
let string_table () = List.rev !strtbl

let next_line lexbuf =
  incr lineno; Source.note_line !lineno lexbuf

# 57 "lexer.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base =
   "\000\000\225\255\226\255\227\255\228\255\003\000\002\000\034\000\
    \237\255\238\255\239\255\240\255\241\255\242\255\243\255\244\255\
    \005\000\246\255\003\000\248\255\249\255\250\255\002\000\053\000\
    \077\000\087\000\084\000\106\000\253\255\107\000\252\255\003\000\
    \004\000\231\255\229\255\233\255\234\255\232\255\137\000\252\255\
    \253\255\254\255\107\000\255\255";
  Lexing.lex_backtrk =
   "\255\255\255\255\255\255\255\255\255\255\025\000\020\000\019\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \010\000\255\255\008\000\255\255\255\255\255\255\029\000\029\000\
    \001\000\000\000\255\255\255\255\255\255\255\255\255\255\004\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\002\000\255\255";
  Lexing.lex_default =
   "\002\000\000\000\000\000\000\000\000\000\255\255\255\255\255\255\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \255\255\000\000\255\255\000\000\000\000\000\000\032\000\027\000\
    \255\255\255\255\255\255\255\255\000\000\255\255\000\000\255\255\
    \032\000\000\000\000\000\000\000\000\000\000\000\040\000\000\000\
    \000\000\000\000\255\255\000\000";
  Lexing.lex_trans =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\005\000\003\000\000\000\005\000\004\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \005\000\000\000\022\000\005\000\031\000\032\000\031\000\023\000\
    \016\000\015\000\008\000\010\000\014\000\009\000\020\000\034\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\018\000\021\000\007\000\011\000\006\000\037\000\
    \033\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\013\000\026\000\012\000\017\000\035\000\
    \036\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\029\000\019\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\025\000\
    \025\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\028\000\030\000\041\000\043\000\000\000\000\000\000\000\
    \025\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\000\000\042\000\000\000\000\000\025\000\000\000\
    \025\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \001\000\000\000\255\255\000\000\255\255\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\255\255\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\039\000";
  Lexing.lex_check =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\255\255\005\000\000\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\000\000\005\000\022\000\031\000\032\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\016\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\006\000\
    \018\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\023\000\000\000\000\000\007\000\
    \007\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\026\000\000\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\025\000\
    \025\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\027\000\029\000\038\000\042\000\255\255\255\255\255\255\
    \025\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\255\255\038\000\255\255\255\255\025\000\255\255\
    \025\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\022\000\255\255\032\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\023\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\038\000";
  Lexing.lex_base_code =
   "";
  Lexing.lex_backtrk_code =
   "";
  Lexing.lex_default_code =
   "";
  Lexing.lex_trans_code =
   "";
  Lexing.lex_check_code =
   "";
  Lexing.lex_code =
   "";
}

let rec token lexbuf =
   __ocaml_lex_token_rec lexbuf 0
and __ocaml_lex_token_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
let
# 74 "lexer.mll"
                                        s
# 204 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 75 "lexer.mll"
                        ( lookup s )
# 208 "lexer.ml"

  | 1 ->
let
# 76 "lexer.mll"
                s
# 214 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 76 "lexer.mll"
                        ( NUMBER (int_of_string s) )
# 218 "lexer.ml"

  | 2 ->
let
# 77 "lexer.mll"
                 c
# 224 "lexer.ml"
= Lexing.sub_lexeme_char lexbuf (lexbuf.Lexing.lex_start_pos + 1) in
# 77 "lexer.mll"
                        ( CHAR c )
# 228 "lexer.ml"

  | 3 ->
# 78 "lexer.mll"
                        ( CHAR '\'' )
# 233 "lexer.ml"

  | 4 ->
let
# 79 "lexer.mll"
                              s
# 239 "lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 1) (lexbuf.Lexing.lex_curr_pos + -1) in
# 80 "lexer.mll"
                        ( get_string s )
# 243 "lexer.ml"

  | 5 ->
# 81 "lexer.mll"
                        ( SEMI )
# 248 "lexer.ml"

  | 6 ->
# 82 "lexer.mll"
                        ( DOT )
# 253 "lexer.ml"

  | 7 ->
# 83 "lexer.mll"
                        ( VBAR )
# 258 "lexer.ml"

  | 8 ->
# 84 "lexer.mll"
                        ( COLON )
# 263 "lexer.ml"

  | 9 ->
# 85 "lexer.mll"
                        ( ARROW )
# 268 "lexer.ml"

  | 10 ->
# 86 "lexer.mll"
                        ( LPAR )
# 273 "lexer.ml"

  | 11 ->
# 87 "lexer.mll"
                        ( RPAR )
# 278 "lexer.ml"

  | 12 ->
# 88 "lexer.mll"
                        ( COMMA )
# 283 "lexer.ml"

  | 13 ->
# 89 "lexer.mll"
                        ( SUB )
# 288 "lexer.ml"

  | 14 ->
# 90 "lexer.mll"
                        ( BUS )
# 293 "lexer.ml"

  | 15 ->
# 91 "lexer.mll"
                        ( EQUAL )
# 298 "lexer.ml"

  | 16 ->
# 92 "lexer.mll"
                        ( ADDOP Plus )
# 303 "lexer.ml"

  | 17 ->
# 93 "lexer.mll"
                        ( MINUS )
# 308 "lexer.ml"

  | 18 ->
# 94 "lexer.mll"
                        ( MULOP Times )
# 313 "lexer.ml"

  | 19 ->
# 95 "lexer.mll"
                        ( RELOP Lt )
# 318 "lexer.ml"

  | 20 ->
# 96 "lexer.mll"
                        ( RELOP Gt )
# 323 "lexer.ml"

  | 21 ->
# 97 "lexer.mll"
                        ( RELOP Neq )
# 328 "lexer.ml"

  | 22 ->
# 98 "lexer.mll"
                        ( RELOP Leq )
# 333 "lexer.ml"

  | 23 ->
# 99 "lexer.mll"
                        ( RELOP Geq )
# 338 "lexer.ml"

  | 24 ->
# 100 "lexer.mll"
                        ( ASSIGN )
# 343 "lexer.ml"

  | 25 ->
# 101 "lexer.mll"
                        ( token lexbuf )
# 348 "lexer.ml"

  | 26 ->
# 102 "lexer.mll"
                        ( comment lexbuf; token lexbuf )
# 353 "lexer.ml"

  | 27 ->
# 103 "lexer.mll"
                        ( token lexbuf )
# 358 "lexer.ml"

  | 28 ->
# 104 "lexer.mll"
                        ( next_line lexbuf; token lexbuf )
# 363 "lexer.ml"

  | 29 ->
# 105 "lexer.mll"
                        ( BADTOK )
# 368 "lexer.ml"

  | 30 ->
# 106 "lexer.mll"
                        ( err_message "unexpected end of file" [] !lineno; 
                          exit 1 )
# 374 "lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_token_rec lexbuf __ocaml_lex_state

and comment lexbuf =
   __ocaml_lex_comment_rec lexbuf 38
and __ocaml_lex_comment_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 111 "lexer.mll"
                        ( () )
# 386 "lexer.ml"

  | 1 ->
# 112 "lexer.mll"
                        ( next_line lexbuf; comment lexbuf )
# 391 "lexer.ml"

  | 2 ->
# 113 "lexer.mll"
                        ( comment lexbuf )
# 396 "lexer.ml"

  | 3 ->
# 114 "lexer.mll"
                        ( err_message "end of file in comment" [] !lineno; 
                          exit 1 )
# 402 "lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_comment_rec lexbuf __ocaml_lex_state

;;

