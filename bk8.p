(*for within for*)
var a : array 10 of array 10 of integer;
var i, j: integer;

begin
    for i:=0 to 10 do for j:=0 to 10 do a[i][j]:=i*j end end;
    
    i := 0;
    for i:=0 to 10 do for j:=0 to 10 do if a[i][j]=63 then break 2 end end end;
    
    print_num(i); newline(); print_num(j); newline()
end.

(*<<
 7
 9
>>*)