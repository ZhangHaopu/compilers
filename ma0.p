
proc test();

    type 
    Products = record
        avail: boolean;
        id: integer;
        symbol: char;
        number: integer;
    end;

    var product1: Products;

begin
    product1.avail := true;
    product1.id := 234;
    product1.symbol := 'c';
    product1.number := 20;

    print_num(product1.id);
end;