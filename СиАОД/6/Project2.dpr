program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  AdrNode = ^NodeRec;
  NodeRec = record
    value: Integer;
    nextvalue: AdrNode
  end;
  mas = array[1..10] of AdrNode;
  maspred = array[1..10] of Integer;

var
  mainmas: mas;
  adrzv, adr1: AdrNode;
  vertex1, vertex2, choice, i, j, q, max: Integer;
  mas1, mas2, maxlen: maspred;

procedure startmainmas();
var i: Integer;
begin
  for i := 1 to 10 do
  begin
    New(adr1);
    adrzv := adr1;
    adrzv^.nextvalue := nil;
    adrzv^.value := 0;
    mainmas[i] := adrzv;
  end;
end;

procedure startdopmas();
var i: Integer;
begin
  for i := 1 to 10 do
    begin
      mas1[i] := 0;
      mas2[i] := 0;
      maxlen[i] := 0;
    end;
end;

procedure addtolist(v1: Integer; v2: integer);
var
  bool: Boolean;
begin
  bool := False;

  adrzv := mainmas[v2];
  adrzv^.value := v2;

  adrzv := mainmas[v1];
  adrzv^.value := v1;
  while(adrzv^.nextvalue <> nil) do
  begin
    adrzv := adrzv^.nextvalue;
    if(adrzv^.value = v2) then
    begin
      bool := True;
      Break;
    end;
  end;

  if(not bool) then
  begin
    New(adrzv^.nextvalue);
    adrzv := adrzv^.nextvalue;
    adrzv^.value := v2;
    adrzv^.nextvalue := nil;
  end;
end;

procedure printlist();
var
  i: Integer;
begin
  for i := 1 to 10 do
  begin
    if(mainmas[i]^.value <> 0) then
    begin
      Writeln;
      adrzv := mainmas[i];
      write('Vertex ', adrzv^.value, ': ');
      while(adrzv^.nextvalue <> nil) do
      begin
        adrzv := adrzv^.nextvalue;
        write(adrzv^.value, ' ');
      end;
    end;
  end;
  Writeln;
end;

procedure printmas();
var
  i, m, l: Integer;
  adrdop: AdrNode;
  bool: Boolean;
begin
  Writeln;
  write('  ');
  m := 0;
  for i := 1 to 10 do
  begin
    if(mainmas[i]^.value <> 0) then
    begin
      write(' ', mainmas[i]^.value);
      m := m + 1;
    end;
  end;
  Writeln;
  write('  ');
  for i := 1 to m do
    write('__');
  for i := 1 to 10 do
  begin
    if(mainmas[i]^.value <> 0) then
    begin
      adrzv := mainmas[i];
      Writeln;
      write(adrzv^.value, '|');
      for l := 1 to m do
      begin
        bool := False;
        adrdop := adrzv;
        while(adrdop^.nextvalue <> nil) do
        begin
          adrdop := adrdop^.nextvalue;
          if(adrdop^.value = l) then
          begin
            bool := True;
            Break;
          end;
        end;
        if(bool) then
          write(' +')
        else
          write(' -');
      end;
    end;
  end;
  Writeln;
end;

function smaller(mas2: maspred): Boolean;
var i: Integer;
var bool1, bool2, bool3: Boolean;
begin
  bool3 := False;
  for i := 1 to 10 do
  begin
    if(mas1[i] <> 0) then
      bool1 := False
    else
      bool1 := true;
    if(mas2[i] <> 0) then
      bool2 := False
    else
      bool2 := true;
    if(bool1 <> true) and (bool2 <> false) then
      bool3 := true;
  end;
  Result := bool3;
end;

function bilo(int: integer; mas2: maspred): Boolean;
var i: Integer;
bool: Boolean;
begin
  for i := 1 to 10 do
  begin
    if(int <> mas2[i]) then
      bool := false
    else
    begin
      bool := True;
      Break;
    end;
  end;
  Result := bool;
end;

procedure biggest(f: Integer; l: integer; var index: integer; mas2: maspred);
var i: integer;
var Bool: Boolean;
var adrzv: AdrNode;
begin
  Bool := false;
  adrzv := mainmas[f];
  for i := 1 to 10 do
  begin
    if(mas2[i] = 0) then
      begin
        index := i;
        break;
      end;
  end;
  mas2[index] := adrzv^.value;
  while(adrzv^.nextvalue <> nil) do
  begin
    adrzv := adrzv^.nextvalue;
    if(adrzv^.value = l) then
    begin
      Bool := True;
      if((mas1[1] = 0) or (not smaller(mas2))) and bool then
      begin
        for i := 1 to 10 do
          mas1[i] := mas2[i];
      end;
      Continue;
    end;
    if(bilo(adrzv^.value, mas2)) then
    begin
      Continue;
    end;
    index := index + 1;
    biggest(adrzv^.value, l, index, mas2);
  end;
  if((mas1[1] = 0) or (not smaller(mas2))) and bool then
  begin
    for i := 1 to 10 do
      mas1[i] := mas2[i];
  end
  else
  begin
    for i := 10 downto index do
      mas2[i] := 0;
  end;
end;

procedure all(f: Integer; l: integer; var index: integer; mas2: maspred);
var i: integer;
var Bool: Boolean;
var adrzv: AdrNode;
begin
  Bool := false;
  adrzv := mainmas[f];
  for i := 1 to 10 do
  begin
    if(mas2[i] = 0) then
      begin
        index := i;
        break;
      end;
  end;
  mas2[index] := adrzv^.value;
  while(adrzv^.nextvalue <> nil) do
  begin
    adrzv := adrzv^.nextvalue;
    if(adrzv^.value = l) then
    begin
      Bool := True;
      if((mas1[1] = 0) or (not smaller(mas2))) and bool then
      begin
        for i := 1 to 10 do
          mas1[i] := mas2[i];
      end;
      write('Next way: ');
      for i := 1 to 10 do
      begin
        if(mas1[i] = 0) then
          Break;
        write(mas1[i], ' -> ');
      end;
      writeln(vertex2);
      Continue;
    end;
    if(bilo(adrzv^.value, mas2)) then
    begin
      Continue;
    end;
    index := index + 1;
    all(adrzv^.value, l, index, mas2);
  end;
  if((mas1[1] = 0) or (not smaller(mas2))) and bool then
  begin
    for i := 1 to 10 do
      mas1[i] := mas2[i];
  end
  else
  begin
    for i := 10 downto index do
      mas2[i] := 0;
  end;
end;

procedure dopall(start: Integer; f: Integer; l: integer; var index: integer; mas2: maspred);
var i: integer;
var Bool: Boolean;
var adrzv: AdrNode;
var dd: Integer;
begin
  Bool := false;
  adrzv := mainmas[f];
  for i := 1 to 10 do
  begin
    if(mas2[i] = 0) then
      begin
        index := i;
        break;
      end;
  end;
  mas2[index] := adrzv^.value;
  while(adrzv^.nextvalue <> nil) do
  begin
    adrzv := adrzv^.nextvalue;
    if(adrzv^.value = l) then
    begin
      Bool := True;
      if((mas1[1] = 0) or (not smaller(mas2))) and bool then
      begin
        for i := 1 to 10 do
          mas1[i] := mas2[i];
      end;
      dd := 0;
      for i := 1 to 10 do
      begin
        if(mas1[i] = 0) then
          Break;
        dd := dd + 1;
      end;
      if(maxlen[start] < dd) then
      begin
        maxlen[start] := dd;
      end;
      Break;
    end;
    if(bilo(adrzv^.value, mas2)) then
    begin
      Continue;
    end;
    index := index + 1;
    dopall(start, adrzv^.value, l, index, mas2);
  end;
  if((mas1[1] = 0) or (not smaller(mas2))) and bool then
  begin
    for i := 1 to 10 do
      mas1[i] := mas2[i];
  end
  else
  begin
    for i := 10 downto index do
      mas2[i] := 0;
  end;
end;

procedure shortest(f: Integer; l: integer; var index: integer; mas2: maspred);
var i: integer;
var Bool: Boolean;
var adrzv: AdrNode;
begin
  Bool := false;
  adrzv := mainmas[f];
  for i := 1 to 10 do
  begin
    if(mas2[i] = 0) then
      begin
        index := i;
        break;
      end;
  end;
  mas2[index] := adrzv^.value;
  while(adrzv^.nextvalue <> nil) do
  begin
    adrzv := adrzv^.nextvalue;
    if(adrzv^.value = l) then
    begin
      Bool := True;
      Break;
    end;
    if(bilo(adrzv^.value, mas2)) then
    begin
      Continue;
    end;
    index := index + 1;
    shortest(adrzv^.value, l, index, mas2);
  end;
  if((mas1[1] = 0) or (smaller(mas2))) and bool then
  begin
    for i := 1 to 10 do
      mas1[i] := mas2[i];
  end
  else
  begin
    for i := 10 downto index do
      mas2[i] := 0;
  end;
end;

procedure instructions();
begin
  Writeln('Enter 1, if you want to see the smallest way;');                     //
  Writeln('Enter 2, if you want to see the largest way;');                      //
  Writeln('Enter 3, if you want to see all ways;');
  Writeln('Enter 4, if you want to see center of graf;');
  Writeln('Enter 5, if you want to end the program;');
end;

begin
  startmainmas;
  Writeln('Enter one by one initial and final vertex. To end write 0.');
  Write('Initial vertex: ');
  readln(vertex1);
  while(vertex1 <> 0) do
  begin
    write('Final vertex: ');
    Readln(vertex2);
    addtolist(vertex1,vertex2);
    write('Initial vertex: ');
    Readln(vertex1);
  end;
  printlist;
  printmas;

  Writeln;
  instructions;
  Readln(choice);
  Writeln('-------------------------------------------------');
  Writeln;
  while(choice <> 5) do
  begin
    if(choice = 1) then
    begin
      startdopmas;
      Write('Initial vertex: ');
      readln(vertex1);
      write('Final vertex: ');
      Readln(vertex2);
      i := 1;
      shortest(vertex1, vertex2, i, mas2);
      write('The shortest way: ');
      for i := 1 to 10 do
      begin
        if(mas1[i] = 0) then
          Break;
        write(mas1[i], ' -> ');
      end;
      write(vertex2);
      Writeln;
      Writeln('-------------------------------------------------');
      Writeln;
    end;
    if(choice = 2) then
    begin
      startdopmas;
      Write('Initial vertex: ');
      readln(vertex1);
      write('Final vertex: ');
      Readln(vertex2);

      i := 1;
      biggest(vertex1, vertex2, i, mas2);
      write('The largest way: ');
      for i := 1 to 10 do
      begin
        if(mas1[i] = 0) then
          Break;
        write(mas1[i], ' -> ');
      end;
      write(vertex2);
      Writeln;
      Writeln('-------------------------------------------------');
      Writeln;
    end;
    if(choice = 3) then
    begin
      startdopmas;
      Write('Initial vertex: ');
      readln(vertex1);
      write('Final vertex: ');
      Readln(vertex2);

      i := 1;
      All(vertex1, vertex2, i, mas2);
      Writeln;
      Writeln('-------------------------------------------------');
      Writeln;
    end;
    if(choice = 4) then
    begin
      startdopmas;
      for i := 1 to 10 do
      begin
        for j := 2 to 10 do
        begin
          q := 0;
          dopall(i, i, j, q, mas2);
        end;
      end;
      max := maxlen[1];
      q := 1;
      for i := 2 to 10 do
      begin
        if(maxlen[i] = 0) then
        begin
          Break;
        end;
        if(max < maxlen[i]) then
        begin
          max := maxlen[i];
          q := i;
        end;
      end;
      write('Center of graf is: ', q);
      Writeln;
      Writeln('-------------------------------------------------');
      Writeln;
    end;
    if((choice > 5) or (choice < 1)) then
    begin
      Writeln('Illegal choice');
      instructions;
    end;
    write('? ');
    read(choice);
    Writeln;
    Writeln('-------------------------------------------------');
    writeln;
  end;

  Writeln('End of run');
  Readln;
end.
 