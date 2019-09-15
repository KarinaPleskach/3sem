program Project1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  Adr = ^Zveno;
  Zveno = record
    number: Integer;
    next: Adr;
    end;

var N, k: Integer;

procedure MakeList(n: Integer; var head: adr; var curr: adr);
var i: Integer;
begin
  New(head);
  Curr := Head;
  Curr^.number := 1;
  curr^.next := nil;

  for i := 2 to n do
  begin
    New(curr^.next);
    Curr := curr^.next;
    Curr^.number := i;
    curr^.next := nil;
  end;
  curr^.next := Head;
end;

procedure deletelist(pred: adr; var head: adr);
var dop: Adr;
begin
  dop := pred^.next;
  Write(dop^.number, '; ');
  pred^.next := pred^.next^.next;
  if dop = Head then
    Head := pred^.next;
  Dispose(dop);
end;

procedure deletelist1(pred: adr; var head: adr);
var dop: Adr;
begin
  dop := pred^.next;
  pred^.next := pred^.next^.next;
  if dop = Head then
    Head := pred^.next;
  Dispose(dop);
end;

procedure resline(var result: string; head: Adr);
var curr: Adr;
begin
  result := '';
  Curr := Head;
  while curr^.next <> Head do
  begin
    result := result + IntToStr(curr^.number) + ', ';
    Curr := curr^.next;
  end;
  result := result + IntToStr(curr^.number) + '.   ';
  Writeln(result);
end;

procedure deletek(n, k: integer);
var i, j: integer;
dop: Adr;
result: string;
head, Curr: Adr;
begin

  MakeList(n, Head, curr);
  Curr := Head;
  for j := 1 to (k-2) do
      Curr := Curr^.next;
  deletelist(curr, head);
  for i := 1 to (n-3) do
  begin
    for j := 1 to (k-1) do
      Curr := Curr^.next;
    deletelist(curr, head);
  end;
  for j := 1 to (k-1) do
    Curr := curr^.next;
  dop := curr^.next;
  Write(dop^.number, '; ');
  curr^.next := nil;
  Dispose(dop);
  Write(Curr^.number, '.');
  Dispose(Curr);
  Writeln;
end;

procedure deletek1(n, k: integer);
var i, j: integer;
dop: Adr;
result: string;
head, Curr: Adr;
begin

  MakeList(n, Head, curr);
  result := '';
  Curr := Head;
  for j := 1 to (k-2) do
      Curr := Curr^.next;
  deletelist1(curr, head);
  resline(result, head);
  for i := 1 to (n-3) do
  begin
    for j := 1 to (k-1) do
      Curr := Curr^.next;
    deletelist1(curr, head);
    resline(result, head);
  end;
  for j := 1 to (k-1) do
    Curr := curr^.next;
  dop := curr^.next;
  curr^.next := nil;
  Dispose(dop);
  Writeln(IntToStr(curr^.number));
  Dispose(Curr);
  Writeln;
end;

begin
  Write('Enter N: ');
  readln(N);
  Write('Enter K: ');
  readln(k);
  write('The result of the first part: ');
  deletek(n, k);
  deletek1(64, k);
  readln;
end.
