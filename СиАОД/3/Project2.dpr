//клиентам необходимо работать с цп с тактами
//такт мы задаем 3
//время на обдумывание мы задаем 5
//первому для выполнения необходимо времени - 4, 5, 3
//второму - 3, 4, 3
//третьему - 2, 3, 2
//коэф полезного действия = время требуемое для всех/ на времы затраченное
//
//моделирование систем
//от 1 до 10 изменяем такт процессора и время на обдумывание
//остальное не меняется: схема приоритетов и время работы всех клиентов
//кпд и суммарное время простоя процессора
//можно таблицей на 100 элементов
program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;
const time = 139;
strdop = '|';
var takt, think, spark, kpd: Integer;
  alltime: integer;

type mas = array[1..13] of Integer;
  AdrList = ^ListRec;
  ListRec = record
    indexofwor: Integer;
    datamas: mas;
    next: AdrList;
  end;

var adrzv, adr1: AdrList;
  whattodo, index: Integer;
  line0, line1, line2, line3, line4, line5: string;

procedure startlist();
begin
  New(adr1);
  adrzv := adr1;
  adrzv^.next := nil;
  adrzv^.indexofwor := 1;
  adrzv^.datamas[1] := 2;
  adrzv^.datamas[2] := 2;
  adrzv^.datamas[3] := 3;
  adrzv^.datamas[4] := 4;
  adrzv^.datamas[5] := 2;
  adrzv^.datamas[6] := 1;
  adrzv^.datamas[7] := 1;
  adrzv^.datamas[8] := 3;
  adrzv^.datamas[9] := 3;
  adrzv^.datamas[10] := 1;
  adrzv^.datamas[11] := 0;
  adrzv^.datamas[12] := 0;
  adrzv^.datamas[13] := 0;

  New(adrzv^.next);
  adrzv := adrzv^.next;
  adrzv^.next := nil;
  adrzv^.indexofwor := 1;
  adrzv^.datamas[1] := 4;
  adrzv^.datamas[2] := 1;
  adrzv^.datamas[3] := 1;
  adrzv^.datamas[4] := 1;
  adrzv^.datamas[5] := 1;
  adrzv^.datamas[6] := 2;
  adrzv^.datamas[7] := 2;
  adrzv^.datamas[8] := 3;
  adrzv^.datamas[9] := 1;
  adrzv^.datamas[10] := 3;
  adrzv^.datamas[11] := 3;
  adrzv^.datamas[12] := 2;
  adrzv^.datamas[13] := 0;

  New(adrzv^.next);
  adrzv := adrzv^.next;
  adrzv^.next := nil;
  adrzv^.indexofwor := 1;
  adrzv^.datamas[1] := 2;
  adrzv^.datamas[2] := 1;
  adrzv^.datamas[3] := 3;
  adrzv^.datamas[4] := 2;
  adrzv^.datamas[5] := 4;
  adrzv^.datamas[6] := 5;
  adrzv^.datamas[7] := 4;
  adrzv^.datamas[8] := 2;
  adrzv^.datamas[9] := 2;
  adrzv^.datamas[10] := 2;
  adrzv^.datamas[11] := 0;
  adrzv^.datamas[12] := 0;
  adrzv^.datamas[13] := 0;

  New(adrzv^.next);
  adrzv := adrzv^.next;
  adrzv^.next := nil;
  adrzv^.indexofwor := 1;
  adrzv^.datamas[1] := 4;
  adrzv^.datamas[2] := 5;
  adrzv^.datamas[3] := 4;
  adrzv^.datamas[4] := 2;
  adrzv^.datamas[5] := 3;
  adrzv^.datamas[6] := 3;
  adrzv^.datamas[7] := 3;
  adrzv^.datamas[8] := 4;
  adrzv^.datamas[9] := 3;
  adrzv^.datamas[10] := 5;
  adrzv^.datamas[11] := 3;
  adrzv^.datamas[12] := 0;
  adrzv^.datamas[13] := 0;

  New(adrzv^.next);
  adrzv := adrzv^.next;
  adrzv^.next := nil;
  adrzv^.indexofwor := 1;
  adrzv^.datamas[1] := 1;
  adrzv^.datamas[2] := 4;
  adrzv^.datamas[3] := 3;
  adrzv^.datamas[4] := 5;
  adrzv^.datamas[5] := 4;
  adrzv^.datamas[6] := 2;
  adrzv^.datamas[7] := 3;
  adrzv^.datamas[8] := 2;
  adrzv^.datamas[9] := 3;
  adrzv^.datamas[10] := 0;
  adrzv^.datamas[11] := 0;
  adrzv^.datamas[12] := 0;
  adrzv^.datamas[13] := 0;
end;

procedure instraction();
begin
  writeln('Enter 1: if you want to Run;');
  writeln('Enter 2: if you want to finish.');
end;

procedure add(var line: string; var line_1: string; var line_2: string; var line_3: string; var line_4: string; adrzv: AdrList);
var i, n, dopindex: integer;
begin
  dopindex := 0;
  if adrzv^.datamas[adrzv^.indexofwor] = takt then
  begin
    for i := 1 to takt do
    begin
      line := line + 'L';
      line0 := line0 + ' ';
    end;
    adrzv^.indexofwor := adrzv^.indexofwor + 1;
    for i := 1 to think do
    begin
      line := line + 'b';
    end;
    while True do
    begin
      if Length(line) <= ((index+dopindex)*takt + takt) then
      begin
        Break;
      end
      else
        dopindex := dopindex + 1;
    end;
    for i := (Length(line)+1) to ((index+dopindex)*takt + takt) do
    begin
      line := line + '0';
    end;
  end
  else
    if adrzv^.datamas[adrzv^.indexofwor] < takt then
    begin
      for i := 1 to adrzv^.datamas[adrzv^.indexofwor] do
      begin
        line := line + 'L';
        line0 := line0 + ' ';
      end;
      for i := (adrzv^.datamas[adrzv^.indexofwor]+1) to takt do
      begin
        line0 := line0 + '*';
        spark := spark + 1;
      end;
      adrzv^.indexofwor := adrzv^.indexofwor + 1;
      for i := 1 to think do
      begin
        line := line + 'b';
      end;
      while True do
      begin
        if Length(line) <= ((index+dopindex)*takt + takt) then
        begin
          Break;
        end
        else
          dopindex := dopindex + 1;
      end;
      for i := (Length(line)+1) to ((index+dopindex)*takt + takt) do
      begin
        line := line + '0';
      end;
    end
    else
      if adrzv^.datamas[adrzv^.indexofwor] > takt then
      begin
        for i := 1 to takt do
        begin
          line := line + 'L';
          line0 := line0 + ' ';
        end;
        adrzv^.datamas[adrzv^.indexofwor] := adrzv^.datamas[adrzv^.indexofwor] - takt;
      end;
  n := index*takt + takt;
  if Length(line_1) < n then
  begin
    for i := (Length(line_1)+1) to n do
    begin
      line_1 := line_1 + '0';
    end;
  end;
  if Length(line_4) < n then
  begin
    for i := (Length(line_4)+1) to n do
    begin
      line_4 := line_4 + '0';
    end;
  end;
  if Length(line_2) < n then
  begin
    for i := (Length(line_2)+1) to n do
    begin
      line_2 := line_2 + '0';
    end;
  end;
  if Length(line_3) < n then
  begin
    for i := (Length(line_3)+1) to n do
    begin
      line_3 := line_3 + '0';
    end;
  end;
end;

function findplace(line: string): Boolean;
var n: Integer;
begin
  n := index*takt + 1;
  if Length(line) < n then
  begin
    Result := True;
  end
  else
  begin
    Result := False;
  end;
end;

procedure makework();
var i: Integer;
var dopbool, Bool, bool1, bool2, bool3, bool4: Boolean;
begin
  bool1 := True;
  bool2 := False;
  bool3 := False;
  bool4 := False;
  adrzv := adr1;
  while True do
  begin
    dopbool := False;
    if bool1 then
    begin
      bool1 := False;
      bool2 := True;
      Bool := findplace(line1);
      if Bool and (adrzv^.datamas[adrzv^.indexofwor] <> 0) then
      begin
        dopbool := True;
        add(line1, line2, line3, line4, line5, adrzv);
        index := index + 1;
      end;
      adrzv := adrzv^.next;
    end;
    if bool2 then
    begin
      bool2 := False;
      bool3 := True;
      Bool := findplace(line2);
      if Bool and (adrzv^.datamas[adrzv^.indexofwor] <> 0) then
      begin
        dopbool := True;
        add(line2, line1, line3, line4, line5, adrzv);
        index := index + 1;
      end;
      adrzv := adrzv^.next;
    end;
    if bool3 then
    begin
      bool3 := False;
      bool4 := True;
      Bool := findplace(line3);
      if Bool and (adrzv^.datamas[adrzv^.indexofwor] <> 0) then
      begin
        dopbool := True;
        add(line3, line1, line2, line4, line5, adrzv);
        index := index + 1;
      end;
      adrzv := adrzv^.next;
    end;
    if bool4 then
    begin
      bool4 := False;
      Bool := findplace(line4);
      if Bool and (adrzv^.datamas[adrzv^.indexofwor] <> 0) then
      begin
        dopbool := True;
        add(line4, line1, line2, line3, line5, adrzv);
        index := index + 1;
      end;
    end;

    if dopbool then
    begin
      bool1 := True;
      adrzv := adr1;
    end
    else
    begin
      bool1 := True;
      Bool := findplace(line5);
      adrzv := adrzv^.next;
      if Bool and (adrzv^.datamas[adrzv^.indexofwor] <> 0) then
      begin
        dopbool := True;
        add(line5, line4, line1, line2, line3, adrzv);
      end;
      if (not bool) and (adrzv^.datamas[adrzv^.indexofwor] <> 0) then
      begin
        dopbool := True;
        for i:= 1 to takt do
        begin
          line0 := line0 + '*';
        end;
      end;
      adrzv := adr1;
      index := index + 1;
    end;

    if not dopbool then
    begin
      break;
    end;
  end;
end;

procedure change1line(var line: string);
begin
  while (line[Length(line)] = '0') or (line[Length(line)] = 'b') do
  begin
    Delete(line, Length(line), 1);
  end;
end;

function maxline(line1: string; line2: string; line3: string; line4: string; line5: string):Integer;
begin
  Result := Length(line1);
  if Length(line2) > Result then Result := Length(line2);
  if Length(line3) > Result then Result := Length(line3);
  if Length(line4) > Result then Result := Length(line4);
  if Length(line5) > Result then Result := Length(line5);
  while Result mod takt <> 0 do
  begin
    Result := Result + 1;
  end;
end;

procedure change2line(c: Char; var line: string);
var n, dopn: Integer;
begin
  n := 0;
  dopn := 0;
  if takt <> 1 then
  begin
    while (n*takt+takt) < Length(line) do
    begin
      Insert(strdop, line, n*takt+1+dopn);
      n := n + 1;
      dopn := dopn + 1;
    end;
  end
  else
  begin

  end;
  Insert(c, line, 1);
end;

procedure change3line(var line: string);
begin
  while True do
  begin
    if (line[Length(line)] = '|') and (line[Length(line)] = '|') then
    begin
      Delete(line, Length(line), 1);
    end
    else
    begin
      Break;
    end;
  end;
end;

begin
  instraction;
  Write('? ');
  Readln(whattodo);
  Writeln('');
  Writeln('-------------------------------------------------');

  while whattodo <> 2 do
  begin
    if whattodo = 1 then
    begin
      startlist;
      adrzv := adr1;
      while adrzv <> nil do
      begin
        adrzv^.indexofwor := 1;
        adrzv := adrzv^.next;
      end;
      Writeln('Enter takt and time after doing work: ');
      Readln(takt);
      Readln(think);
      line0 := '';
      line1 := '';
      line2 := '';
      line3 := '';
      line4 := '';
      line5 := '';
      index := 0;
      spark := 0;
      makework;
      change1line(line1);
      change1line(line2);
      change1line(line3);
      change1line(line4);
      change1line(line5);
      change1line(line1);
      change1line(line2);
      change1line(line3);
      change1line(line4);
      change1line(line5);
      kpd := maxline(line1, line2, line3, line4, line5);
      while Length(line0) > kpd do
      begin
        if (line0[Length(line0)] = '*') then spark := spark - 1;
        Delete(line0, Length(line0), 1);
      end;

      change2line('0', line0);
      change2line('1', line1);
      change2line('2', line2);
      change2line('3', line3);
      change2line('4', line4);
      change2line('5', line5);
      change3line(line0);
      change3line(line1);
      change3line(line2);
      change3line(line3);
      change3line(line4);
      change3line(line5);
      Writeln(line0);
      Writeln(line1);
      Writeln(line2);
      Writeln(line3);
      Writeln(line4);
      Writeln(line5);
      alltime := Trunc((time/kpd)*100);
      Writeln('Number of *: ', inttostr(spark));
      Writeln('Number of kpd: ',alltime);
    end
    else
      instraction;
    Write('? ');
    Readln(whattodo);
    Writeln('');
    Writeln('-------------------------------------------------');
  end;

  Writeln('End of run.');
  Readln;
end.
