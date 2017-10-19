program Excercise1;
type
  MyListItemPnt = ^integer;
var
  MyListItem: integer;
  MyListOfItems: array of integer;

  MyListOfPointers: array of MyListItemPnt;
  MyListSize: integer;
  i, ii: integer; //iterators
  QtyOfItemsBelowZero: integer; //counter
begin
  randomize;
  MyListSize := random(10)+2;
  SetLength(MyListOfItems, MyListSize);
  SetLength(MyListOfPointers, MyListSize);
  WriteLn('There are a list');
  //init a list
  For i:=0 to MyListSize-1 Do
  begin
    MyListOfItems[i]:=random(50)-25;
    MyListOfPointers[i]:=@MyListOfItems[i];
  end;
  //print a list
  For i:=0 to MyListSize-1 Do
  begin
    Write(MyListOfPointers[i]^+' ');
  end;
  Writeln('');
  //dispose pointers to elements below zero
  For i:=0 to MyListSize-1 Do
  begin
    if MyListOfPointers[i]^<0 then
    begin
      QtyOfItemsBelowZero := QtyOfItemsBelowZero+1;
      MyListOfPointers[i]:=nil;
      //Write(MyListOfPointers[i]^+' is below zero; '); //for debug purposes
    end;
  end;
  //show items which are equal or greater than zero
  WriteLn('List of positive items');
  For i:=0 to MyListSize-1 Do
  begin
    if MyListOfPointers[i]<>nil then
    begin
      Write(MyListOfPointers[i]^+' ');
    end;
  end;
  
  //WriteLn('Quantity of items below zero is '+QtyOfItemsBelowZero);
  Writeln('');
  WriteLn('Finally, reversed list of positive items');
  For i:=MyListSize-1 downto 0 Do
  begin
    if MyListOfPointers[i]<>nil then
    begin
      Write(MyListOfPointers[i]^+' ');
    end;
  end;
end.