program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  stackNodePtr = ^stackNode;
  stackNode = record
    data: string;
    nextPtr: stackNodePtr;
  end;

var
  resLine, inputLine, element: string;
  stack1Ptr: stackNodePtr;
  LengthInputLine, index, rang: Integer;
  bool: Boolean;

function getStackPriority(a: string): Integer;
begin
  if(a[1] = '+') or (a[1] = '-') then
    Result := 2
  else
    if(a[1] = '*') or (a[1] = '/') then
      Result := 4
    else
      if(a[1] = '^') then
        Result := 5
      else
        if(a[1] = '(') then
          Result := 0
        else
            Result := 8;
end;

function getDataPriority(a: string): Integer;
begin
  if(a[1] = '+') or (a[1] = '-') then
    Result := 1
  else
    if(a[1] = '*') or (a[1] = '/') then
      Result := 3
    else
      if(a[1] = '^') then
        Result := 6
      else
        if(a[1] = '(') then
          Result := 9
        else
            Result := 7;
end;

function isInStack(a: string; topPtr: stackNodePtr): Boolean;
begin
  if(topPtr^.nextPtr = nil) then
  begin
    Result := True;
  end
  else
  begin
    if(getDataPriority(a) > getStackPriority(topPtr^.nextPtr^.data)) then
      Result := True
    else
      Result := False;  
  end;
end;  

procedure push(var topPtr: stackNodePtr; info: string);
var stackPtr: stackNodePtr;
begin
  New(stackPtr);
  stackPtr^.data := info;
  stackPtr^.nextPtr := topPtr^.nextPtr;
  topPtr^.nextPtr := stackPtr;
end;

function pop(var topPtr: stackNodePtr): string;
var tempPtr: stackNodePtr;
begin
  tempPtr := topPtr^.nextPtr;
  Result := topPtr^.nextPtr^.data;
  topPtr^.nextPtr := topPtr^.nextPtr^.nextPtr;
  Dispose(tempPtr);
end;

begin
  New(stack1Ptr);
  stack1Ptr^.nextPtr := nil;

  write('Enter input line: ');
  readln(inputLine);
  LengthInputLine := Length(inputLine);

  resLine := '';
  index := 1;
  rang := 0;
  while True do
  begin
    bool := True;
    element := '';

    if(index > LengthInputLine) then
    begin
      while(stack1Ptr^.nextPtr <> nil) do
      begin
        resLine := resLine + pop(stack1Ptr);
        resLine := resLine + ' ';
      end;

      Break;
    end;

    if(inputLine[index] in ['0'..'9']) then
    begin
      while(inputLine[index] in ['0'..'9']) do
      begin
        element := element + inputLine[index];
        index := index + 1;
      end;

      if(stack1Ptr^.nextPtr = nil) then
      begin
        bool := False;
        push(stack1Ptr, element);
        rang := rang + 1;
      end
      else
        while(stack1Ptr^.nextPtr <> nil) do
        begin
          if(isInStack(element, stack1Ptr)) then
          begin
            push(stack1Ptr, element);
            rang := rang + 1;
            bool := False;
            Break;
          end
          else
          begin
            resLine := resLine + pop(stack1Ptr);
            resLine := resLine + ' ';
          end;
        end;
      if bool then
      begin
        rang := rang + 1;
        push(stack1Ptr, element);
      end;
    end
    else
      if(inputLine[index] in ['a'..'z']) or (inputLine[index] in ['A'..'Z']) then
      begin
        while(inputLine[index] in ['a'..'z']) or (inputLine[index] in ['A'..'Z']) do
        begin
          element := element + inputLine[index];
          index := index + 1;
        end;

        if(stack1Ptr^.nextPtr = nil) then
        begin
          bool := False;
          push(stack1Ptr, element);
          rang := rang + 1;
        end
        else
          while(stack1Ptr^.nextPtr <> nil) do
          begin
            if(isInStack(element, stack1Ptr)) then
            begin
              push(stack1Ptr, element);
              bool := False;
              rang := rang + 1;
              Break;
            end
            else
            begin
              resLine := resLine + pop(stack1Ptr);
              resLine := resLine + ' ';
            end;
          end;
        if bool then
        begin
          rang := rang + 1;
          push(stack1Ptr, element);
        end;
      end
      else
        if(inputLine[index] = '+') or (inputLine[index] = '-') or (inputLine[index] = '*') or (inputLine[index] = '/') or (inputLine[index] = '^') or (inputLine[index] = '(') then
        begin
          element := inputLine[index];
          if(stack1Ptr^.nextPtr = nil) then
          begin
            bool := False;
            push(stack1Ptr, element);
            if (element <> '(') then
              rang := rang - 1;
          end
          else
            while(stack1Ptr^.nextPtr <> nil) do
            begin
              if(isInStack(element, stack1Ptr)) then
              begin
                push(stack1Ptr, element);
                if (element <> '(') then
                  rang := rang - 1;
                bool := False;
                Break;
              end
              else
              begin
                resLine := resLine + pop(stack1Ptr);
                resLine := resLine + ' ';
              end;
            end;
          if bool then
          begin
            if (element <> '(') then
              rang := rang - 1;
            push(stack1Ptr, element);
          end;
          index := index + 1;
        end
        else
          if (inputLine[index] = ')') then
          begin
            element := inputLine[index];
              while(stack1Ptr^.nextPtr^.data <> '(') do
              begin
                  resLine := resLine + pop(stack1Ptr);
                  resLine := resLine + ' ';
              end;
            element := pop(stack1Ptr);
            index := index + 1;
          end
          else
            index := index + 1;
  end;


  Writeln('Result Line: ', resLine);
  Writeln('Rang: ', rang);
  Readln;
end.
