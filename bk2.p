(*test that break does not accept an integer variable*)

var a : array 10 of array 10 of integer;
var i, j, x: integer;

begin
    for i:=0 to 10 do for j:=0 to 10 do a[i][j]:=i*j end end;
    
    i := 0;
    while i< 10 do 
        j:=0;
        repeat
            x := 2;
            if a[i][j]=63 then break x else j := j+1 end
        until j= 10;
        i := i+1
    end;
    print_num(i); newline(); print_num(j); newline()
end.

(*<<
error: constant expected
>>*)
