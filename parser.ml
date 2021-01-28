type token =
  | IDENT of (Dict.ident)
  | MULOP of (Optree.op)
  | ADDOP of (Optree.op)
  | RELOP of (Optree.op)
  | NUMBER of (int)
  | CHAR of (char)
  | STRING of (Optree.symbol * int)
  | SEMI
  | DOT
  | COLON
  | LPAR
  | RPAR
  | COMMA
  | SUB
  | BUS
  | EQUAL
  | MINUS
  | ASSIGN
  | VBAR
  | ARROW
  | BADTOK
  | IMPOSSIBLE
  | ARRAY
  | BEGIN
  | CONST
  | DO
  | ELSE
  | END
  | IF
  | OF
  | PROC
  | RECORD
  | RETURN
  | THEN
  | TO
  | TYPE
  | VAR
  | WHILE
  | NOT
  | POINTER
  | NIL
  | REPEAT
  | UNTIL
  | FOR
  | ELSIF
  | CASE
  | BREAK

open Parsing;;
let _ = parse_error;;
# 5 "parser.mly"
open Optree
open Dict
open Tree
# 32 "parser.mly"
let const n t = makeExpr (Constant (n, t))
# 59 "parser.ml"
let yytransl_const = [|
  264 (* SEMI *);
  265 (* DOT *);
  266 (* COLON *);
  267 (* LPAR *);
  268 (* RPAR *);
  269 (* COMMA *);
  270 (* SUB *);
  271 (* BUS *);
  272 (* EQUAL *);
  273 (* MINUS *);
  274 (* ASSIGN *);
  275 (* VBAR *);
  276 (* ARROW *);
  277 (* BADTOK *);
  278 (* IMPOSSIBLE *);
  279 (* ARRAY *);
  280 (* BEGIN *);
  281 (* CONST *);
  282 (* DO *);
  283 (* ELSE *);
  284 (* END *);
  285 (* IF *);
  286 (* OF *);
  287 (* PROC *);
  288 (* RECORD *);
  289 (* RETURN *);
  290 (* THEN *);
  291 (* TO *);
  292 (* TYPE *);
  293 (* VAR *);
  294 (* WHILE *);
  295 (* NOT *);
  296 (* POINTER *);
  297 (* NIL *);
  298 (* REPEAT *);
  299 (* UNTIL *);
  300 (* FOR *);
  301 (* ELSIF *);
  302 (* CASE *);
  303 (* BREAK *);
    0|]

let yytransl_block = [|
  257 (* IDENT *);
  258 (* MULOP *);
  259 (* ADDOP *);
  260 (* RELOP *);
  261 (* NUMBER *);
  262 (* CHAR *);
  263 (* STRING *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\003\000\003\000\005\000\005\000\005\000\005\000\
\006\000\006\000\010\000\009\000\009\000\012\000\007\000\007\000\
\014\000\008\000\016\000\018\000\018\000\020\000\020\000\021\000\
\021\000\021\000\019\000\019\000\004\000\022\000\022\000\023\000\
\023\000\024\000\025\000\025\000\025\000\025\000\025\000\025\000\
\025\000\025\000\025\000\025\000\029\000\029\000\029\000\030\000\
\030\000\032\000\031\000\031\000\015\000\015\000\028\000\028\000\
\011\000\011\000\011\000\033\000\033\000\033\000\034\000\034\000\
\035\000\035\000\035\000\035\000\035\000\035\000\035\000\035\000\
\035\000\027\000\027\000\036\000\036\000\026\000\026\000\026\000\
\026\000\013\000\013\000\013\000\013\000\037\000\037\000\038\000\
\039\000\039\000\017\000\000\000"

let yylen = "\002\000\
\002\000\004\000\000\000\002\000\002\000\002\000\001\000\002\000\
\001\000\002\000\004\000\001\000\002\000\004\000\001\000\002\000\
\004\000\004\000\004\000\002\000\003\000\001\000\003\000\003\000\
\004\000\001\000\000\000\002\000\001\000\001\000\003\000\002\000\
\001\000\000\000\000\000\003\000\002\000\002\000\006\000\005\000\
\004\000\009\000\006\000\002\000\000\000\002\000\006\000\001\000\
\003\000\003\000\000\000\002\000\001\000\003\000\000\000\001\000\
\001\000\003\000\003\000\001\000\003\000\003\000\001\000\003\000\
\001\000\001\000\001\000\001\000\001\000\002\000\002\000\002\000\
\003\000\002\000\003\000\001\000\003\000\001\000\004\000\003\000\
\002\000\001\000\004\000\003\000\003\000\002\000\003\000\003\000\
\001\000\000\000\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\092\000\000\000\
\000\000\000\000\007\000\000\000\000\000\005\000\000\000\091\000\
\000\000\000\000\008\000\000\000\000\000\006\000\000\000\000\000\
\001\000\000\000\004\000\000\000\000\000\010\000\000\000\000\000\
\000\000\013\000\000\000\016\000\000\000\033\000\000\000\029\000\
\000\000\000\000\000\000\066\000\068\000\067\000\000\000\000\000\
\000\000\069\000\000\000\000\000\000\000\000\000\000\000\063\000\
\020\000\000\000\000\000\026\000\000\000\000\000\000\000\019\000\
\000\000\000\000\000\000\000\000\082\000\054\000\000\000\002\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\032\000\000\000\018\000\000\000\072\000\071\000\000\000\
\011\000\000\000\000\000\070\000\000\000\000\000\081\000\000\000\
\000\000\000\000\000\000\000\000\021\000\000\000\028\000\000\000\
\000\000\000\000\000\000\000\000\014\000\017\000\031\000\000\000\
\000\000\038\000\000\000\000\000\000\000\000\000\044\000\037\000\
\000\000\073\000\000\000\000\000\074\000\000\000\000\000\080\000\
\000\000\000\000\000\000\064\000\000\000\024\000\023\000\000\000\
\000\000\084\000\000\000\086\000\085\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\075\000\079\000\025\000\083\000\
\088\000\087\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\077\000\000\000\034\000\000\000\040\000\000\000\000\000\
\000\000\000\000\000\000\046\000\000\000\039\000\000\000\050\000\
\052\000\043\000\049\000\000\000\000\000\000\000\000\000\000\000\
\042\000\047\000"

let yydgoto = "\002\000\
\007\000\008\000\009\000\039\000\010\000\014\000\022\000\011\000\
\019\000\015\000\113\000\020\000\068\000\023\000\024\000\012\000\
\052\000\032\000\064\000\061\000\062\000\040\000\041\000\042\000\
\082\000\053\000\092\000\114\000\165\000\160\000\170\000\161\000\
\054\000\055\000\056\000\127\000\106\000\107\000\140\000"

let yysindex = "\019\000\
\255\000\000\000\030\255\037\255\060\255\069\255\000\000\062\255\
\074\255\255\000\000\000\096\255\095\255\000\000\030\255\000\000\
\103\255\102\255\000\000\060\255\114\255\000\000\069\255\126\255\
\000\000\129\255\000\000\255\000\008\001\000\000\100\255\144\255\
\003\255\000\000\069\255\000\000\003\255\000\000\127\255\000\000\
\149\255\205\255\151\255\000\000\000\000\000\000\008\001\008\001\
\008\001\000\000\189\255\163\255\071\255\016\255\175\255\000\000\
\000\000\069\255\172\255\000\000\179\255\173\255\003\255\000\000\
\008\001\069\255\148\255\188\255\000\000\000\000\194\255\000\000\
\129\255\008\001\008\001\008\001\129\255\037\255\008\001\008\001\
\163\255\000\000\074\000\000\000\212\255\000\000\000\000\008\001\
\000\000\008\001\010\255\000\000\037\255\008\001\000\000\008\001\
\008\001\008\001\200\255\003\255\000\000\022\255\000\000\042\255\
\213\255\197\255\225\255\003\255\000\000\000\000\000\000\008\255\
\152\255\000\000\119\255\203\255\232\255\116\255\000\000\000\000\
\008\001\000\000\016\255\016\255\000\000\228\255\236\255\000\000\
\241\255\175\255\175\255\000\000\003\255\000\000\000\000\003\255\
\003\255\000\000\069\255\000\000\000\000\129\255\129\255\008\001\
\008\001\008\001\152\255\008\001\000\000\000\000\000\000\000\000\
\000\000\000\000\239\254\234\255\152\255\021\255\226\255\242\255\
\239\255\000\000\129\255\000\000\245\255\000\000\008\001\129\255\
\129\255\246\255\008\001\000\000\008\001\000\000\169\255\000\000\
\000\000\000\000\000\000\106\255\129\255\129\255\247\255\239\254\
\000\000\000\000"

let yyrindex = "\000\000\
\252\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\252\255\000\000\000\000\000\000\000\000\183\255\000\000\
\000\000\000\000\000\000\248\000\014\000\000\000\002\001\000\000\
\000\000\193\255\000\000\252\255\000\000\000\000\000\000\117\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\041\000\036\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\251\255\029\000\165\000\063\000\000\000\
\000\000\000\000\000\000\000\000\000\000\016\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\120\255\000\000\081\255\000\000\040\255\000\000\000\000\081\255\
\108\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\254\255\000\000\000\000\000\000\000\000\000\000\
\133\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\199\000\233\000\000\000\022\000\000\000\000\000\
\000\000\097\000\131\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\015\000\000\000\000\000\142\255\193\255\000\000\
\000\000\000\000\184\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\021\000\000\000\008\000\000\000\000\000\024\000\
\242\254\000\000\193\255\000\000\000\000\000\000\000\000\171\255\
\193\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\193\255\142\255\000\000\021\000\
\000\000\000\000"

let yygindex = "\000\000\
\000\000\019\001\040\001\181\255\000\000\039\001\035\001\000\000\
\041\001\000\000\227\255\000\000\222\255\000\000\230\255\231\255\
\253\255\000\000\000\000\216\000\000\000\253\000\000\000\157\000\
\000\000\043\001\252\000\001\001\159\000\180\000\000\000\000\000\
\220\255\255\255\215\255\204\000\219\000\000\000\000\000"

let yytablesize = 561
let yytable = "\051\000\
\017\000\116\000\071\000\016\000\059\000\060\000\086\000\087\000\
\070\000\163\000\016\000\088\000\048\000\048\000\044\000\045\000\
\046\000\085\000\096\000\001\000\047\000\125\000\021\000\090\000\
\088\000\065\000\048\000\164\000\103\000\069\000\013\000\099\000\
\097\000\069\000\066\000\104\000\090\000\016\000\081\000\105\000\
\034\000\142\000\067\000\035\000\112\000\088\000\115\000\034\000\
\049\000\118\000\050\000\123\000\004\000\124\000\035\000\167\000\
\132\000\090\000\058\000\069\000\018\000\126\000\035\000\035\000\
\129\000\134\000\155\000\156\000\034\000\021\000\025\000\136\000\
\034\000\141\000\117\000\059\000\060\000\034\000\035\000\093\000\
\035\000\034\000\034\000\034\000\094\000\034\000\034\000\172\000\
\055\000\128\000\095\000\147\000\176\000\177\000\130\000\131\000\
\069\000\026\000\151\000\055\000\021\000\152\000\153\000\028\000\
\069\000\183\000\184\000\055\000\055\000\088\000\029\000\057\000\
\105\000\031\000\157\000\158\000\159\000\033\000\126\000\088\000\
\034\000\090\000\088\000\055\000\027\000\055\000\035\000\034\000\
\027\000\069\000\004\000\090\000\069\000\069\000\090\000\037\000\
\058\000\175\000\034\000\182\000\056\000\159\000\034\000\180\000\
\143\000\146\000\034\000\034\000\034\000\034\000\038\000\056\000\
\034\000\063\000\072\000\088\000\073\000\034\000\084\000\056\000\
\056\000\034\000\034\000\034\000\034\000\034\000\034\000\090\000\
\034\000\034\000\034\000\034\000\088\000\091\000\034\000\056\000\
\098\000\056\000\034\000\034\000\102\000\100\000\108\000\034\000\
\090\000\034\000\034\000\034\000\034\000\034\000\101\000\036\000\
\088\000\034\000\181\000\109\000\089\000\034\000\034\000\034\000\
\034\000\110\000\036\000\034\000\090\000\016\000\009\000\009\000\
\034\000\133\000\036\000\036\000\034\000\009\000\034\000\088\000\
\034\000\034\000\009\000\009\000\034\000\034\000\137\000\122\000\
\138\000\034\000\036\000\090\000\036\000\088\000\034\000\088\000\
\139\000\074\000\034\000\168\000\034\000\075\000\034\000\034\000\
\148\000\090\000\076\000\090\000\088\000\144\000\077\000\149\000\
\078\000\145\000\079\000\080\000\078\000\078\000\078\000\150\000\
\090\000\171\000\078\000\078\000\078\000\166\000\078\000\078\000\
\078\000\078\000\078\000\078\000\169\000\078\000\078\000\041\000\
\174\000\178\000\185\000\003\000\078\000\078\000\078\000\053\000\
\078\000\090\000\041\000\022\000\078\000\078\000\065\000\065\000\
\065\000\076\000\041\000\041\000\065\000\078\000\065\000\078\000\
\065\000\065\000\089\000\065\000\065\000\065\000\043\000\065\000\
\045\000\027\000\041\000\051\000\041\000\030\000\065\000\065\000\
\065\000\036\000\065\000\030\000\034\000\135\000\065\000\065\000\
\173\000\060\000\060\000\030\000\030\000\111\000\060\000\065\000\
\060\000\065\000\060\000\060\000\120\000\060\000\060\000\060\000\
\119\000\060\000\093\000\030\000\083\000\030\000\186\000\094\000\
\060\000\060\000\060\000\121\000\060\000\095\000\179\000\162\000\
\060\000\060\000\000\000\061\000\061\000\154\000\000\000\000\000\
\061\000\060\000\061\000\060\000\061\000\061\000\000\000\061\000\
\061\000\061\000\000\000\061\000\078\000\000\000\000\000\000\000\
\000\000\078\000\061\000\061\000\061\000\078\000\061\000\078\000\
\000\000\000\000\061\000\061\000\000\000\062\000\062\000\000\000\
\000\000\000\000\062\000\061\000\062\000\061\000\062\000\062\000\
\000\000\062\000\062\000\062\000\000\000\062\000\000\000\000\000\
\000\000\000\000\000\000\000\000\062\000\062\000\062\000\000\000\
\062\000\000\000\000\000\000\000\062\000\062\000\000\000\000\000\
\057\000\000\000\000\000\000\000\057\000\062\000\057\000\062\000\
\057\000\057\000\000\000\057\000\057\000\000\000\000\000\057\000\
\000\000\000\000\000\000\000\000\000\000\000\000\057\000\057\000\
\057\000\000\000\057\000\000\000\000\000\000\000\057\000\057\000\
\000\000\000\000\058\000\000\000\000\000\000\000\058\000\057\000\
\058\000\057\000\058\000\058\000\000\000\058\000\058\000\000\000\
\000\000\058\000\000\000\000\000\000\000\000\000\000\000\000\000\
\058\000\058\000\058\000\000\000\058\000\000\000\000\000\000\000\
\058\000\058\000\000\000\000\000\059\000\000\000\000\000\000\000\
\059\000\058\000\059\000\058\000\059\000\059\000\000\000\059\000\
\059\000\000\000\000\000\059\000\000\000\000\000\000\000\000\000\
\000\000\000\000\059\000\059\000\059\000\000\000\059\000\000\000\
\016\000\000\000\059\000\059\000\044\000\045\000\046\000\012\000\
\012\000\000\000\047\000\059\000\000\000\059\000\012\000\003\000\
\048\000\015\000\015\000\012\000\012\000\004\000\000\000\000\000\
\015\000\000\000\005\000\006\000\000\000\015\000\015\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\049\000\000\000\
\050\000"

let yycheck = "\029\000\
\004\000\077\000\037\000\001\001\031\000\031\000\048\000\049\000\
\035\000\027\001\001\001\004\001\027\001\028\001\005\001\006\001\
\007\001\047\000\003\001\001\000\011\001\012\001\001\001\016\001\
\004\001\023\001\017\001\045\001\063\000\033\000\001\001\058\000\
\017\001\037\000\032\001\065\000\016\001\001\001\042\000\066\000\
\001\001\034\001\040\001\008\001\074\000\004\001\076\000\008\001\
\039\001\079\000\041\001\088\000\031\001\090\000\019\001\035\001\
\098\000\016\001\037\001\063\000\001\001\091\000\027\001\028\001\
\094\000\100\000\142\000\143\000\029\001\001\001\009\001\030\001\
\033\001\108\000\078\000\102\000\102\000\038\001\043\001\009\001\
\045\001\042\001\043\001\044\001\014\001\046\001\047\001\163\000\
\008\001\093\000\020\001\121\000\168\000\169\000\096\000\097\000\
\100\000\024\001\133\000\019\001\001\001\136\000\137\000\008\001\
\108\000\181\000\182\000\027\001\028\001\004\001\016\001\012\001\
\139\000\011\001\144\000\145\000\146\000\016\001\148\000\004\001\
\001\001\016\001\004\001\043\001\008\001\045\001\013\001\008\001\
\012\001\133\000\031\001\016\001\136\000\137\000\016\001\010\001\
\037\001\167\000\019\001\034\001\008\001\171\000\001\001\173\000\
\026\001\030\001\027\001\028\001\029\001\008\001\022\001\019\001\
\033\001\010\001\028\001\004\001\008\001\038\001\008\001\027\001\
\028\001\042\001\043\001\044\001\045\001\046\001\047\001\016\001\
\027\001\028\001\029\001\001\001\004\001\011\001\033\001\043\001\
\002\001\045\001\008\001\038\001\008\001\010\001\035\001\042\001\
\016\001\044\001\045\001\046\001\047\001\019\001\012\001\008\001\
\004\001\001\001\026\001\008\001\008\001\027\001\028\001\029\001\
\008\001\008\001\019\001\033\001\016\001\001\001\024\001\025\001\
\038\001\010\001\027\001\028\001\042\001\031\001\044\001\004\001\
\046\001\047\001\036\001\037\001\028\001\029\001\010\001\012\001\
\028\001\033\001\043\001\016\001\045\001\004\001\038\001\004\001\
\008\001\029\001\042\001\010\001\044\001\033\001\046\001\047\001\
\013\001\016\001\038\001\016\001\004\001\043\001\042\001\012\001\
\044\001\018\001\046\001\047\001\002\001\003\001\004\001\015\001\
\016\001\019\001\008\001\009\001\010\001\028\001\012\001\013\001\
\014\001\015\001\016\001\017\001\027\001\019\001\020\001\008\001\
\028\001\028\001\028\001\024\001\026\001\027\001\028\001\010\001\
\030\001\028\001\019\001\012\001\034\001\035\001\002\001\003\001\
\004\001\012\001\027\001\028\001\008\001\043\001\010\001\045\001\
\012\001\013\001\028\001\015\001\016\001\017\001\028\000\019\001\
\028\001\010\000\043\001\028\001\045\001\015\000\026\001\027\001\
\028\001\023\000\030\001\019\001\020\000\102\000\034\001\035\001\
\164\000\003\001\004\001\027\001\028\001\073\000\008\001\043\001\
\010\001\045\001\012\001\013\001\081\000\015\001\016\001\017\001\
\080\000\019\001\009\001\043\001\042\000\045\001\184\000\014\001\
\026\001\027\001\028\001\018\001\030\001\020\001\171\000\148\000\
\034\001\035\001\255\255\003\001\004\001\139\000\255\255\255\255\
\008\001\043\001\010\001\045\001\012\001\013\001\255\255\015\001\
\016\001\017\001\255\255\019\001\009\001\255\255\255\255\255\255\
\255\255\014\001\026\001\027\001\028\001\018\001\030\001\020\001\
\255\255\255\255\034\001\035\001\255\255\003\001\004\001\255\255\
\255\255\255\255\008\001\043\001\010\001\045\001\012\001\013\001\
\255\255\015\001\016\001\017\001\255\255\019\001\255\255\255\255\
\255\255\255\255\255\255\255\255\026\001\027\001\028\001\255\255\
\030\001\255\255\255\255\255\255\034\001\035\001\255\255\255\255\
\004\001\255\255\255\255\255\255\008\001\043\001\010\001\045\001\
\012\001\013\001\255\255\015\001\016\001\255\255\255\255\019\001\
\255\255\255\255\255\255\255\255\255\255\255\255\026\001\027\001\
\028\001\255\255\030\001\255\255\255\255\255\255\034\001\035\001\
\255\255\255\255\004\001\255\255\255\255\255\255\008\001\043\001\
\010\001\045\001\012\001\013\001\255\255\015\001\016\001\255\255\
\255\255\019\001\255\255\255\255\255\255\255\255\255\255\255\255\
\026\001\027\001\028\001\255\255\030\001\255\255\255\255\255\255\
\034\001\035\001\255\255\255\255\004\001\255\255\255\255\255\255\
\008\001\043\001\010\001\045\001\012\001\013\001\255\255\015\001\
\016\001\255\255\255\255\019\001\255\255\255\255\255\255\255\255\
\255\255\255\255\026\001\027\001\028\001\255\255\030\001\255\255\
\001\001\255\255\034\001\035\001\005\001\006\001\007\001\024\001\
\025\001\255\255\011\001\043\001\255\255\045\001\031\001\025\001\
\017\001\024\001\025\001\036\001\037\001\031\001\255\255\255\255\
\031\001\255\255\036\001\037\001\255\255\036\001\037\001\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\039\001\255\255\
\041\001"

let yynames_const = "\
  SEMI\000\
  DOT\000\
  COLON\000\
  LPAR\000\
  RPAR\000\
  COMMA\000\
  SUB\000\
  BUS\000\
  EQUAL\000\
  MINUS\000\
  ASSIGN\000\
  VBAR\000\
  ARROW\000\
  BADTOK\000\
  IMPOSSIBLE\000\
  ARRAY\000\
  BEGIN\000\
  CONST\000\
  DO\000\
  ELSE\000\
  END\000\
  IF\000\
  OF\000\
  PROC\000\
  RECORD\000\
  RETURN\000\
  THEN\000\
  TO\000\
  TYPE\000\
  VAR\000\
  WHILE\000\
  NOT\000\
  POINTER\000\
  NIL\000\
  REPEAT\000\
  UNTIL\000\
  FOR\000\
  ELSIF\000\
  CASE\000\
  BREAK\000\
  "

let yynames_block = "\
  IDENT\000\
  MULOP\000\
  ADDOP\000\
  RELOP\000\
  NUMBER\000\
  CHAR\000\
  STRING\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'block) in
    Obj.repr(
# 38 "parser.mly"
                                        ( Prog (_1, ref []) )
# 440 "parser.ml"
               : Tree.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'decl_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'stmts) in
    Obj.repr(
# 41 "parser.mly"
                                        ( makeBlock (_1, _3) )
# 448 "parser.ml"
               : 'block))
; (fun __caml_parser_env ->
    Obj.repr(
# 44 "parser.mly"
                                        ( [] )
# 454 "parser.ml"
               : 'decl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decl) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'decl_list) in
    Obj.repr(
# 45 "parser.mly"
                                        ( _1 @ _2 )
# 462 "parser.ml"
               : 'decl_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'const_decls) in
    Obj.repr(
# 48 "parser.mly"
                                        ( _2 )
# 469 "parser.ml"
               : 'decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'var_decls) in
    Obj.repr(
# 49 "parser.mly"
                                        ( _2 )
# 476 "parser.ml"
               : 'decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'proc_decl) in
    Obj.repr(
# 50 "parser.mly"
                                        ( [_1] )
# 483 "parser.ml"
               : 'decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'type_decls) in
    Obj.repr(
# 51 "parser.mly"
                                        ( [TypeDecl _2] )
# 490 "parser.ml"
               : 'decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'const_decl) in
    Obj.repr(
# 54 "parser.mly"
                                        ( [_1] )
# 497 "parser.ml"
               : 'const_decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'const_decl) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'const_decls) in
    Obj.repr(
# 55 "parser.mly"
                                        ( _1 :: _2 )
# 505 "parser.ml"
               : 'const_decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : Dict.ident) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 58 "parser.mly"
                                        ( ConstDecl (_1, _3) )
# 513 "parser.ml"
               : 'const_decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'type_decl) in
    Obj.repr(
# 61 "parser.mly"
                                        ( [_1] )
# 520 "parser.ml"
               : 'type_decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'type_decl) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'type_decls) in
    Obj.repr(
# 62 "parser.mly"
                                        ( _1 :: _2 )
# 528 "parser.ml"
               : 'type_decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : Dict.ident) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'typexpr) in
    Obj.repr(
# 65 "parser.mly"
                                        ( (_1, _3) )
# 536 "parser.ml"
               : 'type_decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'var_decl) in
    Obj.repr(
# 68 "parser.mly"
                                        ( [_1] )
# 543 "parser.ml"
               : 'var_decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'var_decl) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'var_decls) in
    Obj.repr(
# 69 "parser.mly"
                                        ( _1 :: _2 )
# 551 "parser.ml"
               : 'var_decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'ident_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'typexpr) in
    Obj.repr(
# 72 "parser.mly"
                                        ( VarDecl (VarDef, _1, _3) )
# 559 "parser.ml"
               : 'var_decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'proc_heading) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'block) in
    Obj.repr(
# 75 "parser.mly"
                                        ( ProcDecl (_1, _3) )
# 567 "parser.ml"
               : 'proc_decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'name) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'params) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'return_type) in
    Obj.repr(
# 78 "parser.mly"
                                        ( Heading (_2, _3, _4) )
# 576 "parser.ml"
               : 'proc_heading))
; (fun __caml_parser_env ->
    Obj.repr(
# 81 "parser.mly"
                                        ( [] )
# 582 "parser.ml"
               : 'params))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'formal_decls) in
    Obj.repr(
# 82 "parser.mly"
                                        ( _2 )
# 589 "parser.ml"
               : 'params))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formal_decl) in
    Obj.repr(
# 85 "parser.mly"
                                        ( [_1] )
# 596 "parser.ml"
               : 'formal_decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'formal_decl) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'formal_decls) in
    Obj.repr(
# 86 "parser.mly"
                                        ( _1 :: _3 )
# 604 "parser.ml"
               : 'formal_decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'ident_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'typexpr) in
    Obj.repr(
# 89 "parser.mly"
                                        ( VarDecl (CParamDef, _1, _3) )
# 612 "parser.ml"
               : 'formal_decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'ident_list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'typexpr) in
    Obj.repr(
# 90 "parser.mly"
                                        ( VarDecl (VParamDef, _2, _4) )
# 620 "parser.ml"
               : 'formal_decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'proc_heading) in
    Obj.repr(
# 91 "parser.mly"
                                        ( PParamDecl _1 )
# 627 "parser.ml"
               : 'formal_decl))
; (fun __caml_parser_env ->
    Obj.repr(
# 94 "parser.mly"
                                        ( None )
# 633 "parser.ml"
               : 'return_type))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'typexpr) in
    Obj.repr(
# 95 "parser.mly"
                                        ( Some _2 )
# 640 "parser.ml"
               : 'return_type))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_list) in
    Obj.repr(
# 98 "parser.mly"
                                        ( seq _1 )
# 647 "parser.ml"
               : 'stmts))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 101 "parser.mly"
                                        ( [_1] )
# 654 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_list) in
    Obj.repr(
# 102 "parser.mly"
                                        ( _1 :: _3 )
# 662 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'line) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt1) in
    Obj.repr(
# 105 "parser.mly"
                                        ( makeStmt (_2, _1) )
# 670 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 107 "parser.mly"
                                        ( failwith "impossible" )
# 676 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 110 "parser.mly"
                                        ( !Lexer.lineno )
# 682 "parser.ml"
               : 'line))
; (fun __caml_parser_env ->
    Obj.repr(
# 113 "parser.mly"
                                        ( Skip )
# 688 "parser.ml"
               : 'stmt1))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'variable) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 114 "parser.mly"
                                        ( Assign (_1, _3) )
# 696 "parser.ml"
               : 'stmt1))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'name) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'actuals) in
    Obj.repr(
# 115 "parser.mly"
                                        ( ProcCall (_1, _2) )
# 704 "parser.ml"
               : 'stmt1))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr_opt) in
    Obj.repr(
# 116 "parser.mly"
                                        ( Return _2 )
# 711 "parser.ml"
               : 'stmt1))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'stmts) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'elses) in
    Obj.repr(
# 117 "parser.mly"
                                        ( IfStmt (_2, _4, _5) )
# 720 "parser.ml"
               : 'stmt1))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'stmts) in
    Obj.repr(
# 118 "parser.mly"
                                        ( WhileStmt (_2, _4) )
# 728 "parser.ml"
               : 'stmt1))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'stmts) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 119 "parser.mly"
                                        ( RepeatStmt (_2, _4) )
# 736 "parser.ml"
               : 'stmt1))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 7 : 'name) in
    let _4 = (Parsing.peek_val __caml_parser_env 5 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _8 = (Parsing.peek_val __caml_parser_env 1 : 'stmts) in
    Obj.repr(
# 121 "parser.mly"
                                        ( let v = makeExpr (Variable _2) in
                                          ForStmt (v, _4, _6, _8, ref None) )
# 747 "parser.ml"
               : 'stmt1))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'arms) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'else_part) in
    Obj.repr(
# 123 "parser.mly"
                                        ( CaseStmt (_2, _4, _5) )
# 756 "parser.ml"
               : 'stmt1))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr_opt) in
    Obj.repr(
# 124 "parser.mly"
                                        ( BreakStmt _2 )
# 763 "parser.ml"
               : 'stmt1))
; (fun __caml_parser_env ->
    Obj.repr(
# 127 "parser.mly"
                                        ( makeStmt (Skip, 0) )
# 769 "parser.ml"
               : 'elses))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmts) in
    Obj.repr(
# 128 "parser.mly"
                                        ( _2 )
# 776 "parser.ml"
               : 'elses))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'line) in
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'stmts) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'elses) in
    Obj.repr(
# 129 "parser.mly"
                                        ( makeStmt (IfStmt (_3, _5, _6), _2) )
# 786 "parser.ml"
               : 'elses))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'arm) in
    Obj.repr(
# 132 "parser.mly"
                                        ( [_1] )
# 793 "parser.ml"
               : 'arms))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arm) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arms) in
    Obj.repr(
# 133 "parser.mly"
                                        ( _1 :: _3 )
# 801 "parser.ml"
               : 'arms))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'stmts) in
    Obj.repr(
# 136 "parser.mly"
                                        ( (_1, _3) )
# 809 "parser.ml"
               : 'arm))
; (fun __caml_parser_env ->
    Obj.repr(
# 139 "parser.mly"
                                        ( makeStmt (Skip, 0) )
# 815 "parser.ml"
               : 'else_part))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmts) in
    Obj.repr(
# 140 "parser.mly"
                                        ( _2 )
# 822 "parser.ml"
               : 'else_part))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Dict.ident) in
    Obj.repr(
# 143 "parser.mly"
                                        ( [_1] )
# 829 "parser.ml"
               : 'ident_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Dict.ident) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'ident_list) in
    Obj.repr(
# 144 "parser.mly"
                                        ( _1 :: _3 )
# 837 "parser.ml"
               : 'ident_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 147 "parser.mly"
                                        ( None )
# 843 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 148 "parser.mly"
                                        ( Some _1 )
# 850 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'simple) in
    Obj.repr(
# 151 "parser.mly"
                                        ( _1 )
# 857 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Optree.op) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'simple) in
    Obj.repr(
# 152 "parser.mly"
                                        ( makeExpr (Binop (_2, _1, _3)) )
# 866 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'simple) in
    Obj.repr(
# 153 "parser.mly"
                                        ( makeExpr (Binop (Eq, _1, _3)) )
# 874 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'term) in
    Obj.repr(
# 156 "parser.mly"
                                        ( _1 )
# 881 "parser.ml"
               : 'simple))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'simple) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Optree.op) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'term) in
    Obj.repr(
# 157 "parser.mly"
                                        ( makeExpr (Binop (_2, _1, _3)) )
# 890 "parser.ml"
               : 'simple))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'simple) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'term) in
    Obj.repr(
# 158 "parser.mly"
                                        ( makeExpr (Binop (Minus, _1, _3)) )
# 898 "parser.ml"
               : 'simple))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'factor) in
    Obj.repr(
# 161 "parser.mly"
                                        ( _1 )
# 905 "parser.ml"
               : 'term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'term) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Optree.op) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'factor) in
    Obj.repr(
# 162 "parser.mly"
                                        ( makeExpr (Binop (_2, _1, _3)) )
# 914 "parser.ml"
               : 'term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'variable) in
    Obj.repr(
# 165 "parser.mly"
                                        ( _1 )
# 921 "parser.ml"
               : 'factor))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 166 "parser.mly"
                                        ( const _1 integer )
# 928 "parser.ml"
               : 'factor))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Optree.symbol * int) in
    Obj.repr(
# 167 "parser.mly"
                                        ( let (lab, len) = _1 in
                                          makeExpr (String (lab, len)) )
# 936 "parser.ml"
               : 'factor))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : char) in
    Obj.repr(
# 169 "parser.mly"
                                        ( const (int_of_char _1) character )
# 943 "parser.ml"
               : 'factor))
; (fun __caml_parser_env ->
    Obj.repr(
# 170 "parser.mly"
                                        ( makeExpr Nil )
# 949 "parser.ml"
               : 'factor))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'name) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'actuals) in
    Obj.repr(
# 171 "parser.mly"
                                        ( makeExpr (FuncCall (_1, _2)) )
# 957 "parser.ml"
               : 'factor))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'factor) in
    Obj.repr(
# 172 "parser.mly"
                                        ( makeExpr (Monop (Not, _2)) )
# 964 "parser.ml"
               : 'factor))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'factor) in
    Obj.repr(
# 173 "parser.mly"
                                        ( makeExpr (Monop (Uminus, _2)) )
# 971 "parser.ml"
               : 'factor))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 174 "parser.mly"
                                        ( _2 )
# 978 "parser.ml"
               : 'factor))
; (fun __caml_parser_env ->
    Obj.repr(
# 177 "parser.mly"
                                        ( [] )
# 984 "parser.ml"
               : 'actuals))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr_list) in
    Obj.repr(
# 178 "parser.mly"
                                        ( _2 )
# 991 "parser.ml"
               : 'actuals))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 181 "parser.mly"
                                        ( [_1] )
# 998 "parser.ml"
               : 'expr_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_list) in
    Obj.repr(
# 182 "parser.mly"
                                        ( _1 :: _3 )
# 1006 "parser.ml"
               : 'expr_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'name) in
    Obj.repr(
# 185 "parser.mly"
                                        ( makeExpr (Variable _1) )
# 1013 "parser.ml"
               : 'variable))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'variable) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 186 "parser.mly"
                                        ( makeExpr (Sub (_1, _3)) )
# 1021 "parser.ml"
               : 'variable))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'variable) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'name) in
    Obj.repr(
# 187 "parser.mly"
                                        ( makeExpr (Select (_1, _3)) )
# 1029 "parser.ml"
               : 'variable))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'variable) in
    Obj.repr(
# 188 "parser.mly"
                                        ( makeExpr (Deref _1) )
# 1036 "parser.ml"
               : 'variable))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'name) in
    Obj.repr(
# 191 "parser.mly"
                                        ( TypeName _1 )
# 1043 "parser.ml"
               : 'typexpr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'typexpr) in
    Obj.repr(
# 192 "parser.mly"
                                        ( Array (_2, _4) )
# 1051 "parser.ml"
               : 'typexpr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'fields) in
    Obj.repr(
# 193 "parser.mly"
                                        ( Record _2 )
# 1058 "parser.ml"
               : 'typexpr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'typexpr) in
    Obj.repr(
# 194 "parser.mly"
                                        ( Pointer _3 )
# 1065 "parser.ml"
               : 'typexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'field_decl) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'opt_semi) in
    Obj.repr(
# 197 "parser.mly"
                                        ( [_1] )
# 1073 "parser.ml"
               : 'fields))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'field_decl) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'fields) in
    Obj.repr(
# 198 "parser.mly"
                                        ( _1 :: _3 )
# 1081 "parser.ml"
               : 'fields))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'ident_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'typexpr) in
    Obj.repr(
# 201 "parser.mly"
                                        ( VarDecl (FieldDef, _1, _3) )
# 1089 "parser.ml"
               : 'field_decl))
; (fun __caml_parser_env ->
    Obj.repr(
# 204 "parser.mly"
                                        ( () )
# 1095 "parser.ml"
               : 'opt_semi))
; (fun __caml_parser_env ->
    Obj.repr(
# 205 "parser.mly"
                                        ( () )
# 1101 "parser.ml"
               : 'opt_semi))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Dict.ident) in
    Obj.repr(
# 208 "parser.mly"
                                        ( makeName (_1, !Lexer.lineno) )
# 1108 "parser.ml"
               : 'name))
(* Entry program *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let program (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Tree.program)
