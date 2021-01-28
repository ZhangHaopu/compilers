(*repeat within repeat*)
var a : array 10 of array 10 of integer;
var i, j: integer;

begin
    for i:=0 to 10 do for j:=0 to 10 do a[i][j]:=i*j end end;
    
    i := 0;
    repeat 
        j:=0;
        repeat
            if a[i][j]=63 then break 2 else j := j+1 end
        until j= 10;
        i := i+1;
    until i= 10;
    
    print_num(i); newline(); print_num(j); newline()
end.

(*<<
 7
 9
>>*)