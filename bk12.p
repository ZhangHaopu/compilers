(*does not break from the innermost loop*)
var a : array 10 of array 10 of integer;
var i, j, k, m: integer;

begin
    k := 1;
    for i:=0 to 10 do for j:=0 to 10 do a[i][j]:=i*j end end;
    
    i := 0;
    
    while i< 10 do 
        j:=0;
        repeat
            m := 0;
            while m< 2 do
                k := k+1;
                m := m+1;
            end;
            if a[i][j]=63 then break 2 else j := j+1 end
        until j= 10;
        i := i+1
    end;
    print_num(i); newline(); print_num(j); newline(); print_num(k); newline()
end.

(*<<
 7
 9
 160
>>*)
