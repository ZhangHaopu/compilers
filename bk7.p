(*Two blocks of loops do not interfere*)
var x, y: integer;
begin
    x := 0;
    y := 0;
    while x<5 do
        y := y + 1;
        x := x + 1;
    end;
    while y<10 do
        break 2;
    end;
end.

(*error*)
