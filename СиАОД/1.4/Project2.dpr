program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  adr1 = ^ Zveno1;
  zveno1 = record
    next : adr1;
    pred: adr1;
    element: Integer;
    end;
  adr2 = ^zveno2;
  zveno2 = record
    next: adr2;
    element: Integer;
    end;

var head1, curr1, pred1, tail1: adr1;
var head2, curr2: adr2;
var n, number, m: Integer;

procedure makelist1(n: Integer);
var i: integer;
begin
  New(head1);
  curr1 := head1;
  curr1^.next := nil;
  curr1^.pred := nil;
  pred1 := curr1;
  for i := 1 to n do
  begin
    Write('Enter telephone: ');
    read(number);
    New(curr1^.next);
    curr1 := curr1^.next;
    curr1^.element := number;
    pred1^.next := curr1;
    curr1^.pred := pred1;
    curr1^.next := nil;
    pred1 := curr1;
  end;
  tail1 := curr1;
end;

procedure sort(n: integer);
var i, j: Integer;
var dop: adr1;
var max: Integer;
begin
  New(head2);
  curr2 := head2;
  curr2^.next := nil;
  for i := 1 to n do
  begin
    curr1 := tail1;
    max := curr1^.element;
    dop := curr1;
    for j := 2 to n do
    begin
      curr1 := curr1^.pred;
      if (curr1^.element > max) then
      begin
        max := curr1^.element;
        dop := curr1;
      end;
    end;
    if (max > 999) then
    begin
      New(curr2^.next);
      curr2 := curr2^.next;
      curr2^.element := max;
      curr2^.next := nil;
      dop^.element := 0;
    end;
  end;
end;

procedure OutputList2;
begin
  Writeln;
  Writeln('The result of the lab: ');
  curr2 := head2;
  while (curr2^.Next <> nil) do
  begin
    curr2 := curr2^.next;
    Writeln(inttostr(curr2^.element));
  end;
end;

procedure fromrighttoleft(n: integer);
var i: Integer;
begin
  Writeln;
  curr1 := tail1;
  Writeln(inttostr(curr1^.element));
  for i := 2 to n do
  begin
    curr1 := curr1^.pred;
    Writeln(inttostr(curr1^.element));
  end;
end;

begin
  Write('Enter the amout of elements: ');
  Read(N);
  makelist1(n);
  fromrighttoleft(n);
  sort(n);
  OutputList2;
  Readln;
  Readln;
end.
 