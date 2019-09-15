//создать предметный указатель, осуществить и продемонстрировать
//просмотр
//редактирование : добавление, удаление и изменение терминов, подтерминов и номеров их страниц
//сортировку по алфавиту и по номерам страниц
//поиск термина по подтермину и подтермина по термину
//минимальная вложенность 3: термин > подтермин > подтермин
//минимум слов 6, какие-то из них с подтерминами, какие-то без
//поиск по страницам не нужен
//сортировать можно по страницам
//случайным образом задаются страницы

program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const B = 256;

type
  AdrStr = ^strRec;
  strRec = record
    numberstr: string;
    nextstr: AdrStr;
  end;
  AdrTermin = ^terminRec;
  AdrPodtermin1 = ^podtermin1Rec;
  AdrPodtermin2 = ^podtermin2Rec;
  terminRec = record
    Terminname: string;
    nextTermin: AdrTermin;
    MyPodtermin1: AdrPodtermin1;
    Mystr: AdrStr;
  end;
  podtermin1Rec = record
    Podtermin1name: string;
    mystr: AdrStr;
    nextPodtermin1: AdrPodtermin1;
    MyPodtermin2: AdrPodtermin2;
  end;
  podtermin2Rec = record
    Podtermin2name: string;
    mystr: AdrStr;
    nextPodtermin2: AdrPodtermin2;
  end;
  mas = array[1..(B-1)] of AdrTermin;

var
  mainmas: mas;
  adrzv, adr1: AdrTermin;
  adrpage, adrpagedop: Adrstr;
  adrpod1, adrpod1dop: AdrPodtermin1;
  adrpod2, adrpod2dop: AdrPodtermin2;
  index, whattodo: Integer;

function hash(x: String): Integer;
//var i, sum: Integer;
begin
//  sum := 0;
//  for i := 1 to Length(x) do
//    sum := sum + Ord(x[i]);
//  Result := sum mod B;
Result := ord(x[1]);
end;

procedure startmainmas(mm: mas);
var i: Integer;
begin
  for i := 1 to (B-1) do
  begin
    New(adr1);
    adrzv := adr1;
    adrzv^.nextTermin := nil;
    mainmas[i] := adrzv;
  end;
end;

procedure add();
var
  name, page, pname, ppname: string;
  bool, dopbool, dopdopbool, dopbool1: Boolean;
begin
  write('Enter the name of termin: ');
  Readln(name);
  index := hash(name);

  bool := False;
  adrzv := mainmas[index];
  while adrzv^.nextTermin <> nil do
  begin
    adrzv := adrzv^.nextTermin;
    if adrzv^.Terminname = name then
    begin
      bool := True;
      Break;
    end;
  end;

  if not bool then
  begin
    if mainmas[index]^.nextTermin = nil then
    begin
      New(mainmas[index]^.nextTermin);
      adrzv := mainmas[index]^.nextTermin;
      adrzv^.Terminname := name;
      adrzv^.nextTermin := nil;
      New(adrpage);
      adrpage^.nextstr := nil;
      adrzv^.Mystr := adrpage;
      New(adrpod1);
      adrpod1^.nextPodtermin1 := nil;
      adrzv^.MyPodtermin1 := adrpod1;
    end
    else
    begin
      adrzv := mainmas[index]^.nextTermin;
      while adrzv^.nextTermin <> nil do
      begin
        adrzv := adrzv^.nextTermin;
      end;
      New(adrzv^.nextTermin);
      adrzv := adrzv^.nextTermin;
      adrzv^.Terminname := name;
      adrzv^.nextTermin := nil;
      New(adrpage);
      adrpage^.nextstr := nil;
      adrzv^.Mystr := adrpage;
      New(adrpod1);
      adrpod1^.nextPodtermin1 := nil;
      adrzv^.MyPodtermin1 := adrpod1;
    end;
  end
  else
  begin
//    adrpage := adrzv^.Mystr;
//    while adrpage^.nextstr <> nil do
//    begin
//      adrpage := adrpage^.nextstr;
//    end;
//    adrpod1 := adrzv^.MyPodtermin1;
//    while adrpod1^.nextPodtermin1 <> nil do
//    begin
//      adrpod1 := adrpod1^.nextPodtermin1;
//    end;
  end;

  while true do
  begin
    Write('Enter the number of page: ');
    Readln(page);
    if page <> '' then
    begin
      dopbool := False;
      adrpagedop := adrzv^.Mystr;
      while adrpagedop^.nextstr <> nil do
      begin
        adrpagedop := adrpagedop^.nextstr;
        if adrpagedop^.numberstr = page then
        begin
          dopbool := True;
          Break;
        end;
      end;

      if not dopbool then
      begin
        New(adrpage^.nextstr);
        adrpage := adrpage^.nextstr;
        adrpage^.numberstr := page;
        adrpage^.nextstr := nil;
      end;
    end
    else
      Break;
  end;

  while true do
  begin
    Write('Enter the name of podtermin: ');
    Readln(pname);
    if pname <> '' then
    begin
      dopbool := False;
      adrpod1dop := adrzv^.MyPodtermin1;
      while adrpod1dop^.nextPodtermin1 <> nil do
      begin
        adrpod1dop := adrpod1dop^.nextPodtermin1;
        if adrpod1dop^.Podtermin1name = pname then
        begin
          dopbool := True;
          Break;
        end;
      end;

      if not dopbool then
      begin
        New(adrpod1^.nextPodtermin1);
        adrpod1 := adrpod1^.nextPodtermin1;
        adrpod1^.Podtermin1name := pname;
        adrpod1^.nextPodtermin1 := nil;
        New(adrpage);
        adrpage^.nextstr := nil;
        adrpod1^.mystr := adrpage;
        New(adrpod2);
        adrpod2^.nextPodtermin2 := nil;
        adrpod1^.MyPodtermin2 := adrpod2;
      end
      else
      begin
        adrpage := adrpod1dop^.mystr;
        adrpod2 := adrpod1dop^.MyPodtermin2;
        while adrpage^.nextstr <> nil do
        begin
          adrpage := adrpage^.nextstr;
        end;
        while adrpod2^.nextPodtermin2 <> nil do
        begin
          adrpod2 := adrpod2^.nextPodtermin2;
        end;
      end;

      while True do
      begin
        Write('Enter the number of page: ');
        Readln(page);
        if page <> '' then
        begin
          dopbool1 := False;
          if not dopbool then
          begin
            adrpagedop := adrpod1^.mystr;
          end
          else
          begin
            adrpagedop := adrpod1dop^.mystr;
          end;
          while adrpagedop^.nextstr <> nil do
          begin
            adrpagedop := adrpagedop^.nextstr;
            if adrpagedop^.numberstr = page then
            begin
              dopbool1 := True;
              Break;
            end;
          end;

          if not dopbool1 then
          begin
            New(adrpage^.nextstr);
            adrpage := adrpage^.nextstr;
            adrpage^.numberstr := page;
            adrpage^.nextstr := nil;
          end;
        end
        else
          Break;
      end;

      while True do
      begin
          Write('Enter the name of podpodtermin: ');
          Readln(ppname);
          if ppname <> '' then
          begin
            dopdopbool := False;
            if not dopbool then
            begin
              adrpod2dop := adrpod1^.MyPodtermin2;
            end
            else
            begin
              adrpod2dop := adrpod1dop^.Mypodtermin2;
            end;
            while adrpod2dop^.nextPodtermin2 <> nil do
            begin
              adrpod2dop := adrpod2dop^.nextPodtermin2;
              if adrpod2dop^.Podtermin2name = ppname then
              begin
                dopdopbool := True;
                Break;
              end;
            end;

            if not dopdopbool then
            begin
              New(adrpod2^.nextPodtermin2);
              adrpod2 := adrpod2^.nextPodtermin2;
              adrpod2^.Podtermin2name := ppname;
              adrpod2^.nextPodtermin2 := nil;
              New(adrpage);
              adrpage^.nextstr := nil;
              adrpod2^.mystr := adrpage;
            end
            else
            begin
              adrpage := adrpod2dop^.mystr;
              while adrpage^.nextstr <> nil do
              begin
                adrpage := adrpage^.nextstr;
              end;
            end;

            while True do
            begin
              Write('Enter the number of page: ');
              Readln(page);
              if page <> '' then
              begin
                dopbool1 := False;
                if not dopdopbool then
                begin
                  adrpagedop := adrpod2^.mystr;
                end
                else
                begin
                  adrpagedop := adrpod2dop^.mystr;
                end;
                while adrpagedop^.nextstr <> nil do
                begin
                  adrpagedop := adrpagedop^.nextstr;
                  if adrpagedop^.numberstr = page then
                  begin
                    dopbool1 := True;
                    Break;
                  end;
                end;

                if not dopbool1 then
                begin
                  New(adrpage^.nextstr);
                  adrpage := adrpage^.nextstr;
                  adrpage^.numberstr := page;
                  adrpage^.nextstr := nil;
                end;
              end
              else
                Break;
            end;
          end
          else
            Break;
      end;
    end
    else
      Break;
  end;
end;

procedure instraction();
begin
  Writeln('Please, enter:');
  Writeln('1: if you want to add smth in list;');         //////////////////////
  Writeln('2: if you want to delete smth from list');     //////////////////////
  Writeln('3: if you want to sort the list');
  Writeln('4: if you want to find smth in list');         //////////////////////
  Writeln('5: if you want to print the list');            //////////////////////
  Writeln('6: if you want to end the program');           //////////////////////
end;

procedure printlist();
var i: Integer;
begin
  for i := 1 to (B-1) do
  begin
    if mainmas[i]^.nextTermin <> nil then
    begin
      adrzv := mainmas[i];
      while adrzv^.nextTermin <> nil do
      begin
        Writeln;
        adrzv := adrzv^.nextTermin;
        Write(adrzv^.Terminname);
        write(':  ');
        adrpage := adrzv^.Mystr;
        while adrpage^.nextstr <> nil do
        begin
          adrpage := adrpage^.nextstr;
          write(adrpage^.numberstr);
          write('; ');
        end;
        adrpod1 := adrzv^.MyPodtermin1;
        while adrpod1^.nextPodtermin1 <> nil do
        begin
          adrpod1 := adrpod1^.nextPodtermin1;
          Writeln;
          write('--->');
          write(adrpod1^.podtermin1name);
          write(': ');
          adrpage := adrpod1^.mystr;
          while adrpage^.nextstr <> nil do
          begin
            adrpage := adrpage^.nextstr;
            write(adrpage^.numberstr);
            write('; ');
          end;
          adrpod2 := adrpod1^.MyPodtermin2;
          while adrpod2^.nextPodtermin2 <> nil do
          begin
            adrpod2 := adrpod2^.nextPodtermin2;
            Writeln;
            write('------>');
            write(adrpod2^.podtermin2name);
            write(': ');
            adrpage := adrpod2^.mystr;
            while adrpage^.nextstr <> nil do
            begin
              adrpage := adrpage^.nextstr;
              write(adrpage^.numberstr);
              write('; ');
            end;
          end;
        end;
        Writeln;
      end;
      Writeln;
    end;
  end;
  Writeln;
  writeln;
end;

procedure findsmht();
var name: string;
var i, index: Integer;
begin
  index := 1;
  Writeln('Enter the name that you whant to find: ');
  Readln(name);
  for i := 1 to (B-1) do
  begin
    if mainmas[i]^.nextTermin <> nil then
    begin
      adrzv := mainmas[i];
      while adrzv^.nextTermin <> nil do
      begin
        Writeln;
        adrzv := adrzv^.nextTermin;
        if adrzv^.Terminname = name then
        begin
          Writeln(index, ': ');
          index := index + 1;
          Write(adrzv^.Terminname);
          adrpod1 := adrzv^.MyPodtermin1;
          while adrpod1^.nextPodtermin1 <> nil do
          begin
            adrpod1 := adrpod1^.nextPodtermin1;
            Writeln;
            write('--->');
            write(adrpod1^.podtermin1name);
          end;
          Writeln;
        end;

        adrpod1 := adrzv^.MyPodtermin1;
        while adrpod1^.nextPodtermin1 <> nil do
        begin
          adrpod1 := adrpod1^.nextPodtermin1;
          if adrpod1^.Podtermin1name = name then
          begin
            Writeln(index, ': ');
            index := index + 1;
            write(adrpod1^.podtermin1name);
            Writeln;
            Writeln('<---', adrzv^.terminname);
            adrpod2 := adrpod1^.MyPodtermin2;
            while adrpod2^.nextPodtermin2 <> nil do
            begin
              adrpod2 := adrpod2^.nextPodtermin2;
              write('--->');
              write(adrpod2^.podtermin2name);
              Writeln;
            end;
          end;
          adrpod2 := adrpod1^.MyPodtermin2;
          while adrpod2^.nextPodtermin2 <> nil do
          begin
            adrpod2 := adrpod2^.nextPodtermin2;
            if adrpod2^.Podtermin2name = name then
            begin
              Writeln(index, ': ');
              index := index + 1;
              writeln(adrpod2^.podtermin2name);
              Writeln('<---', adrpod1^.podtermin1name);
              Writeln('<---', adrzv^.terminname);
            end;
          end;
        end;
      end;
      Writeln;
    end;
  end;
  Writeln;
  writeln;
end;

procedure deletesmth();
var
  name, page, pname, ppname: string;
  bool, dopbool, dopdopbool: Boolean;
begin
  write('Enter the name of termin: ');
  Readln(name);
  index := hash(name);
  Bool := False;
  adrzv := mainmas[index];
  while adrzv^.nextTermin <> nil do
  begin
    adrzv := adrzv^.nextTermin;
    if (adrzv^.Terminname = name) then
    begin
      bool := True;
      break;
    end;
  end;

  if bool then
  begin
    Writeln('Enter the number of page, if you want to delete it: ');
    Readln(page);
    if page <> '' then
    begin
      adrpage := adrzv^.Mystr;
      while adrpage^.nextstr <> nil do
      begin
        if adrpage^.nextstr^.numberstr = page then
        begin
          adrpage^.nextstr := adrpage^.nextstr^.nextstr;
          exit;
        end;
        adrpage := adrpage^.nextstr;
      end;
      Exit;
    end;
    Writeln('Enter the podtermin name:');
    Readln(pname);
    adrpod1 := adrzv^.MyPodtermin1;
    dopbool := False;
    while adrpod1^.nextPodtermin1 <> nil do
    begin
      adrpod1 := adrpod1^.nextPodtermin1;
      if adrpod1^.Podtermin1name = pname then
      begin
        dopbool := True;
        Writeln('Enter the number of page, if you want to delete it: ');
        Readln(page);
        if page <> '' then
        begin
          adrpage := adrpod1^.Mystr;
          while adrpage^.nextstr <> nil do
          begin
            if adrpage^.nextstr^.numberstr = page then
            begin
              adrpage^.nextstr := adrpage^.nextstr^.nextstr;
              exit;
            end;
            adrpage := adrpage^.nextstr;
          end;
          Exit;
        end;
        Writeln('Enter the podpodtermin name:');
        Readln(ppname);
        adrpod2 := adrpod1^.MyPodtermin2;
        dopdopbool := False;
        while adrpod2^.nextPodtermin2 <> nil do
        begin
          adrpod2 := adrpod2^.nextPodtermin2;
          if adrpod2^.Podtermin2name = ppname then
          begin
            dopdopbool := True;
            Writeln('Enter the number of page, if you want to delete it: ');
            Readln(page);
            if page <> '' then
            begin
              adrpage := adrpod2^.Mystr;
              while adrpage^.nextstr <> nil do
              begin
                if adrpage^.nextstr^.numberstr = page then
                begin
                  adrpage^.nextstr := adrpage^.nextstr^.nextstr;
                  exit;
                end;
                adrpage := adrpage^.nextstr;
              end;
              Exit;
            end;
          end;
        end;
        if dopdopbool then
        begin
          adrpod2 := adrpod1^.MyPodtermin2;
          while adrpod2^.nextPodtermin2 <> nil do
          begin
            if adrpod2^.nextPodtermin2^.Podtermin2name = ppname then
            begin
              adrpod2^.nextPodtermin2 := adrpod2^.nextPodtermin2^.nextPodtermin2;
              exit;
            end;
            adrpod2 := adrpod2^.nextPodtermin2;
          end;
        end;
      end;
    end;
    if dopbool then
    begin
      adrpod1 := adrzv^.MyPodtermin1;
      while adrpod1^.nextPodtermin1 <> nil do
      begin
        if adrpod1^.nextPodtermin1^.Podtermin1name = pname then
        begin
          adrpod1^.nextPodtermin1 := adrpod1^.nextPodtermin1^.nextPodtermin1;
          exit;
        end;
        adrpod1 := adrpod1^.nextPodtermin1;
      end;
    end;
  end;

  if bool then
  begin
    adrzv := mainmas[index];
    while adrzv^.nextTermin <> nil do
    begin
      if adrzv^.nextTermin^.Terminname = name then
      begin
        adrzv^.nextTermin := adrzv^.nextTermin^.nextTermin;
        exit;
      end;
      adrzv := adrzv^.nextTermin;
    end;
  end;
end;

procedure sortingterminname(var nach: AdrTermin);
var
  tmp,pered,pered1,pocle,rab: AdrTermin;
begin
  rab := nach;
  while rab <> nil do
  begin
    tmp := rab^.nextTermin;
    while tmp <> nil do
    begin
      if tmp^.Terminname < rab^.Terminname then
      begin
        pered := nach;
        pered1 := nach;
        if rab <> nach then
          while pered^.nextTermin <> rab do pered := pered^.nextTermin;
        while pered1^.nextTermin <> tmp do pered1 := pered1^.nextTermin;
        pocle := tmp^.nextTermin;
        if rab^.nextTermin = tmp then
        begin
          tmp^.nextTermin := rab;
          rab^.nextTermin := pocle;
        end
        else
        begin
          tmp^.nextTermin := rab^.nextTermin;
          rab^.nextTermin := pocle;
        end;
        if pered1 <> rab then
          pered1^.nextTermin := rab;
        if rab <> nach then
          pered^.nextTermin := tmp
        else
          nach := tmp;
        pered1 := tmp;
        tmp := rab;
        rab := pered1;
      end;
      tmp := tmp^.nextTermin;
    end;
    rab := rab^.nextTermin;
  end;
end;

procedure sortingpage1(var nach: AdrStr);
var
  tmp,pered,pered1,pocle,rab: AdrStr;
begin
  rab := nach;
  while rab <> nil do
  begin
    tmp := rab^.nextstr;
    while tmp <> nil do
    begin
      if StrToInt(tmp^.numberstr) < StrToInt(rab^.numberstr) then
      begin
        pered := nach;
        pered1 := nach;
        if rab <> nach then
          while pered^.nextstr <> rab do pered := pered^.nextstr;
        while pered1^.nextstr <> tmp do pered1 := pered1^.nextstr;
        pocle := tmp^.nextstr;
        if rab^.nextstr = tmp then
        begin
          tmp^.nextstr := rab;
          rab^.nextstr := pocle;
        end
        else
        begin
          tmp^.nextstr := rab^.nextstr;
          rab^.nextstr := pocle;
        end;
        if pered1 <> rab then
          pered1^.nextstr := rab;
        if rab <> nach then
          pered^.nextstr := tmp
        else
          nach := tmp;
        pered1 := tmp;
        tmp := rab;
        rab := pered1;
      end;
      tmp := tmp^.nextstr;
    end;
    rab := rab^.nextstr;
  end;
end;

procedure sortingpodtermin(var nach: AdrPodtermin1);
var
  tmp,pered,pered1,pocle,rab: AdrPodtermin1;
begin
  rab := nach;
  while rab <> nil do
  begin
    tmp := rab^.nextPodtermin1;
    while tmp <> nil do
    begin
      if tmp^.Podtermin1name < rab^.Podtermin1name then
      begin
        pered := nach;
        pered1 := nach;
        if rab <> nach then
          while pered^.nextPodtermin1 <> rab do pered := pered^.nextPodtermin1;
        while pered1^.nextPodtermin1 <> tmp do pered1 := pered1^.nextPodtermin1;
        pocle := tmp^.nextPodtermin1;
        if rab^.nextPodtermin1 = tmp then
        begin
          tmp^.nextPodtermin1 := rab;
          rab^.nextPodtermin1 := pocle;
        end
        else
        begin
          tmp^.nextPodtermin1 := rab^.nextPodtermin1;
          rab^.nextPodtermin1 := pocle;
        end;
        if pered1 <> rab then
          pered1^.nextPodtermin1 := rab;
        if rab <> nach then
          pered^.nextPodtermin1 := tmp
        else
          nach := tmp;
        pered1 := tmp;
        tmp := rab;
        rab := pered1;
      end;
      tmp := tmp^.nextPodtermin1;
    end;
    rab := rab^.nextPodtermin1;
  end;
end;

procedure sortingpodpodtermin(var nach: AdrPodtermin2);
var
  tmp,pered,pered1,pocle,rab: AdrPodtermin2;
begin
  rab := nach;
  while rab <> nil do
  begin
    tmp := rab^.nextPodtermin2;
    while tmp <> nil do
    begin
      if tmp^.Podtermin2name < rab^.Podtermin2name then
      begin
        pered := nach;
        pered1 := nach;
        if rab <> nach then
          while pered^.nextPodtermin2 <> rab do pered := pered^.nextPodtermin2;
        while pered1^.nextPodtermin2 <> tmp do pered1 := pered1^.nextPodtermin2;
        pocle := tmp^.nextPodtermin2;
        if rab^.nextPodtermin2 = tmp then
        begin
          tmp^.nextPodtermin2 := rab;
          rab^.nextPodtermin2 := pocle;
        end
        else
        begin
          tmp^.nextPodtermin2 := rab^.nextPodtermin2;
          rab^.nextPodtermin2 := pocle;
        end;
        if pered1 <> rab then
          pered1^.nextPodtermin2 := rab;
        if rab <> nach then
          pered^.nextPodtermin2 := tmp
        else
          nach := tmp;
        pered1 := tmp;
        tmp := rab;
        rab := pered1;
      end;
      tmp := tmp^.nextPodtermin2;
    end;
    rab := rab^.nextPodtermin2;
  end;
end;

procedure sortlist();
var i: Integer;
begin
  for i := 1 to (B-1) do
  begin
    if mainmas[i]^.nextTermin <> nil then
    begin
      adrzv := mainmas[i];
      while adrzv^.nextTermin <> nil do
      begin
      sortingterminname(adrzv^.nextTermin);
      sortingpage1(adrzv^.nexttermin^.Mystr^.nextstr);
      sortingpodtermin(adrzv^.nexttermin^.MyPodtermin1^.nextpodtermin1);
      adrpod1 := adrzv^.nexttermin^.MyPodtermin1^.nextPodtermin1;
      while adrpod1 <> nil do
      begin
        sortingpage1(adrpod1^.mystr^.nextstr);
        sortingpodpodtermin(adrpod1^.MyPodtermin2^.nextPodtermin2);
        adrpod2 := adrpod1^.MyPodtermin2^.nextPodtermin2;
        while adrpod2 <> nil do
        begin
          sortingpage1(adrpod2^.mystr^.nextstr);
          adrpod2 := adrpod2^.nextPodtermin2;
        end;
        adrpod1 := adrpod1^.nextPodtermin1;
      end;
      adrzv := adrzv^.nextTermin;
      end;
    end;
  end;
end;

begin
  startmainmas(mainmas);
  instraction;
  Write('? ');
  Readln(whattodo);
  Writeln('');
  Writeln('');

  while whattodo <> 6 do
  begin
    if whattodo = 1 then
    begin
      add;
      printlist;
    end
    else if whattodo = 2 then
    begin
      deletesmth;
      printlist;
    end
    else if whattodo = 3 then
    begin
      sortlist;
      printlist;
    end
    else if whattodo = 4 then
    begin
      findsmht;
    end
    else if whattodo = 5 then
    begin
      printlist;
    end
    else
    begin
      instraction;
    end;
    Write('? ');
    Readln(whattodo);
    Writeln('');
    Writeln('');
  end;

  Writeln('End of run.');
  Readln;
end.
