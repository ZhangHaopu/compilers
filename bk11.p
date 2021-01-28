(*break with an argument larger than 2*)
var a : array 10 of array 10 of integer;
var i, j, k: integer;

begin
    for i:=0 to 10 do for j:=0 to 10 do a[i][j]:=i*j end end;
    
    i := 0;
    while i< 10 do 
        j:=0;
        while j< 10 do
            k := 0;
            while k <10 do
                if k*a[i][j]=63 then break 3 else k := k+1 end;
            end;
            j:= j+1   
        end;
        i := i+1
    end;
    print_num(i); newline(); print_num(j); newline(); print_num(k); newline()
end.

(*<<
 1
 7
 9
>>*)

