program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  treeNodePtr = ^treeNode;
  treeNode = record
    data: Integer;
    leftPtr: treeNodePtr;
    rightPtr: treeNodePtr;
    parentPtr: treeNodePtr;
    newrightPtr: treeNodePtr;
  end;

var
  choice, item, i: Integer;
  rootPtr, treePtr: treeNodePtr;
  bool: Boolean;

procedure instructions();
begin
  Writeln('Enter 1, if you want to create another tree;');                      //
  Writeln('Enter 2, if you want to insert something in the tree;');             //
  Writeln('Enter 3, if you want to delete something from the tree;');           //
  Writeln('Enter 4, if you want to see the tree;');                             //
  Writeln('Enter 5, if you want to see bypassas of the tree;');                 //
  Writeln('Enter 6, if you want to flash the tree;');                           //
  Writeln('Enter 7, if you want to delete something from the flashed tree;');   //
  Writeln('Enter 8, if you want to see the flashed tree;');                     //
  Writeln('Enter 9, if you want to delete the whole tree;');                    //
  Writeln('Enter 10, if you want to end the program;');                         //
end;

procedure insertNode(var treePtr: treeNodePtr; value: Integer);
var tree: treeNodePtr;
begin
  if(treePtr = nil) then
  begin
    New(tree);
    tree^.data := value;
    tree^.leftPtr := nil;
    tree^.rightPtr := nil;
    tree^.parentPtr := nil;
    tree^.newrightPtr := nil;

    treePtr := tree;
  end
  else
  begin
    if (value < treePtr^.data) then
    begin
      if (treePtr^.leftPtr = nil) then
      begin
        New(tree);
        tree^.data := value;
        tree^.leftPtr := nil;
        tree^.rightPtr := nil;
        tree^.newrightPtr := nil;
        tree^.parentPtr := treePtr;

        treePtr^.leftPtr := tree;
      end
      else
      begin
        insertNode(treePtr^.leftPtr, value);
      end;
    end
    else
    begin
      if (value > treePtr^.data) then
      begin
        if (treePtr^.rightPtr = nil) then
        begin
          New(tree);
          tree^.data := value;
          tree^.leftPtr := nil;
          tree^.rightPtr := nil;
          tree^.newrightPtr := nil;
          tree^.parentPtr := treePtr;

          treePtr^.rightPtr := tree;
        end
        else
        begin
          insertNode(treePtr^.rightPtr, value);
        end;
      end;
    end;
  end;
end;

procedure printTree(var treePtr: treeNodePtr; i: integer);
var m: Integer;
begin
  if (treePtr <> nil) then
  begin
    if (treePtr^.rightPtr <> nil) then
    begin
      i := i + 1;
      printTree(treePtr^.rightPtr, i);
    end
    else
    begin
      i := i + 1;
    end;
    for m := 0 to (i - 1) do
    begin
      write('`````');
    end;
    Writeln(treePtr^.data);
    if(treePtr^.leftPtr <> nil) then
    begin
      printTree(treePtr^.leftPtr, i);
    end;
  end
  else
    writeln('The tree is empty');
end;

procedure deleteElement(var treePtr: treeNodePtr; var rootPtr: treeNodePtr; element: Integer);
var doptreePtr, dopdoptreePtr, tree: treeNodePtr;
begin
  if (treePtr = nil) then
    Exit;
  if((treePtr = rootPtr) and (treePtr^.data = element)) then
  begin
    if((rootPtr^.leftPtr = nil) and (rootPtr^.rightPtr <> nil)) then
    begin
      doptreePtr := rootPtr;
      rootPtr := rootPtr^.rightPtr;
      Dispose(doptreePtr);
      Exit;
    end
    else
    begin
      if((rootPtr^.leftPtr <> nil) and (rootPtr^.rightPtr = nil)) then
      begin
        doptreePtr := rootPtr;
        rootPtr := rootPtr^.leftPtr;
        Dispose(doptreePtr);
        Exit;
      end
      else
      begin
        if((rootPtr^.leftPtr <> nil) and (rootPtr^.rightPtr <> nil)) then
        begin
          dopdoptreePtr := rootPtr;
          doptreePtr := rootPtr^.leftPtr;
          rootPtr := rootPtr^.rightPtr;
          treePtr := rootPtr;
          while(treePtr^.leftPtr <> nil) do
          begin
            treePtr := treePtr^.leftPtr;
          end;
          treePtr^.leftPtr := doptreePtr;
          Dispose(dopdoptreePtr);
          Exit;
        end;
      end;
    end;
  end
  else
  begin
    if(treePtr^.leftPtr <> nil) then
    begin
      if(treePtr^.leftPtr^.data = element) then
      begin
        dopdoptreePtr := treePtr^.leftPtr;
        if((treePtr^.leftPtr^.leftPtr = nil) and (treePtr^.leftPtr^.rightPtr = nil)) then
        begin
          doptreePtr := treePtr^.leftPtr;
          treePtr^.leftPtr := nil;
          Dispose(dopdoptreePtr);
          Exit;
        end
        else
        begin
          if((treePtr^.leftPtr^.leftPtr <> nil) and (treePtr^.leftPtr^.rightPtr <> nil)) then
          begin
            doptreePtr := treePtr^.leftPtr^.leftPtr;
            treePtr^.leftPtr := treePtr^.leftPtr^.rightPtr;
            tree := treePtr;
            while (treePtr^.leftPtr <> nil) do
              treePtr := treePtr^.leftPtr;
            treePtr^.leftPtr := doptreePtr;
            treePtr := tree;
            Dispose(dopdoptreePtr);
            exit;
          end
          else
          begin
            if((treePtr^.leftPtr^.leftPtr <> nil) and (treePtr^.leftPtr^.rightPtr = nil)) then
            begin
              doptreePtr := treePtr^.leftPtr;
              treePtr^.leftPtr := treePtr^.leftPtr^.leftPtr;
              Dispose(dopdoptreePtr);
              exit;
            end
            else
            begin
              if((treePtr^.leftPtr^.leftPtr = nil) and (treePtr^.leftPtr^.rightPtr <> nil)) then
              begin
                doptreePtr := treePtr^.leftPtr;
                treePtr^.leftPtr := treePtr^.leftPtr^.rightPtr;
                Dispose(dopdoptreePtr);
                Exit;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
  if(treePtr^.rightPtr <> nil) then
  begin
    if(treePtr^.rightPtr^.data = element) then
    begin
      dopdoptreePtr := treePtr^.rightPtr;
      if((treePtr^.rightPtr^.leftPtr = nil) and (treePtr^.rightPtr^.rightPtr = nil)) then
      begin
        doptreePtr := treePtr^.rightPtr;
        treePtr^.rightPtr := nil;
        Dispose(dopdoptreePtr);
        Exit;
      end
      else
      begin
        if((treePtr^.rightPtr^.leftPtr <> nil) and (treePtr^.rightPtr^.rightPtr <> nil)) then
        begin
          doptreePtr := treePtr^.rightPtr^.leftPtr;
          treePtr^.rightPtr := treePtr^.rightPtr^.rightPtr;
          tree := treePtr;
          while(treePtr^.leftPtr <> nil) do
            treePtr := treePtr^.leftPtr;
          treePtr^.leftPtr := doptreePtr;
          treePtr := tree;
          Dispose(dopdoptreePtr);
          exit;
        end
        else
        begin
          if((treePtr^.rightPtr^.leftPtr <> nil) and (treePtr^.rightPtr^.rightPtr = nil)) then
          begin
            doptreePtr := treePtr^.rightPtr;
            treePtr^.rightPtr := treePtr^.rightPtr^.leftPtr;
            Dispose(dopdoptreePtr);
            exit;
          end
          else
          begin
            if((treePtr^.rightPtr^.leftPtr = nil) and (treePtr^.rightPtr^.rightPtr <> nil)) then
            begin
              doptreePtr := treePtr^.rightPtr;
              treePtr^.rightPtr := treePtr^.rightPtr^.rightPtr;
              Dispose(dopdoptreePtr);
              Exit;
            end;
          end;
        end;
      end;
    end;
  end;
  if(element < treePtr^.data) then
    deleteElement(treePtr^.leftPtr, rootPtr, element)
  else
    if(element > treePtr^.data) then
      deleteElement(treePtr^.rightPtr, rootPtr, element);
end;

procedure deleteTree(var treePtr: treeNodePtr);
begin
  if(treePtr <> nil) then
  begin
    if(treePtr^.rightPtr <> nil) then
    begin
      deleteTree(treePtr^.rightPtr);
    end;
    if(treePtr^.leftPtr <> nil) then
    begin
      deleteTree(treePtr^.leftPtr);
    end;
    Dispose(treePtr);
  end;
  treePtr := nil;
end;

procedure RAB(treePtr: treeNodePtr);
begin
  if(treePtr <> nil) then
  begin
    write(' (', treePtr^.data, ')');
    RAB(treePtr^.leftPtr);
    write(' ', treePtr^.data);
    RAB(treePtr^.rightPtr);
    write(' ', treePtr^.data, '');
  end
  else
    write(' ( )');
end;

procedure ARB(treePtr: treeNodePtr);
begin
  if(treePtr <> nil) then
  begin
    write(' ', treePtr^.data, '');
    ARB(treePtr^.leftPtr);
    write(' (', treePtr^.data, ')');
    ARB(treePtr^.rightPtr);
    write(' ', treePtr^.data, '');
  end
  else
    write(' ( )');
end;

procedure ABR(treePtr: treeNodePtr);
begin
  if(treePtr <> nil) then
  begin
    write(' ', treePtr^.data, '');
    ABR(treePtr^.leftPtr);
    write(' ', treePtr^.data);
    ABR(treePtr^.rightPtr);
    write(' (', treePtr^.data, ')');
  end
  else
    write(' ( )');
end;

procedure flash(var treePtr: treeNodePtr);
begin
  if (treePtr <> nil) then
  begin
    if (treePtr^.rightPtr <> nil) then
    begin
      flash(treePtr^.rightPtr);
    end
    else
    begin
      if(treePtr^.parentPtr <> nil) and (treePtr^.parentPtr^.leftPtr <> nil) and (treePtr^.data = treePtr^.parentPtr^.leftPtr^.data)then
      begin
        treePtr^.newrightPtr := treePtr^.parentPtr;
      end
      else
        if(treePtr^.parentPtr <> nil) and (treePtr^.parentPtr^.rightPtr <> nil) and (treePtr^.parentPtr^.parentPtr <> nil) and (treePtr^.data = treePtr^.parentPtr^.rightPtr^.data) then
        begin
          treePtr^.newrightPtr := treePtr^.parentPtr^.parentPtr;
        end;
    end;
    if(treePtr^.leftPtr <> nil) then
    begin
      flash(treePtr^.leftPtr);
    end;
  end
  else
    writeln('The tree is empty');
end;

procedure nilFlash(var treePtr: treeNodePtr);
begin
  if (treePtr <> nil) then
  begin
    if (treePtr^.rightPtr <> nil) then
    begin
      nilFlash(treePtr^.rightPtr);
    end
    else
    begin
      if(treePtr^.newrightPtr <> nil) then
        treePtr^.newrightPtr := nil;
    end;
    if(treePtr^.leftPtr <> nil) then
    begin
      nilFlash(treePtr^.leftPtr);
    end;
  end;
end;

procedure printFlash(treePtr: treeNodePtr);
begin
  if (treePtr <> nil) then
  begin
    if (treePtr^.rightPtr <> nil) then
    begin
      printFlash(treePtr^.rightPtr);
    end
    else
    begin
      if(treePtr^.newrightPtr <> nil) then
        write(' ', treePtr^.data, '--->', treePtr^.newrightPtr^.data);
    end;
    if(treePtr^.leftPtr <> nil) then
    begin
      printFlash(treePtr^.leftPtr);
    end;
  end
  else
    writeln('The tree is empty');
end;

begin
  Randomize;
  instructions;
  Readln(choice);
  Writeln('-------------------------------------------------');
  Writeln;

  rootPtr := nil;
  bool := false;
  while(choice <> 10) do
  begin
    if(choice = 1) then
    begin
      bool := False;
      deleteTree(rootPtr);
      for i := 1 to 10 do
      begin
        item := 1 + Random(100);
        write(item, ' ');
        insertNode(rootPtr, item);
      end;
      Writeln;
      Writeln('-------------------------------------------------');
      Writeln;
      printTree(rootPtr, 0);
      Writeln;
      Writeln('-------------------------------------------------');
      Writeln;
    end;
    if(choice = 2) then
    begin
      bool := false;
      write('Enter the element: ');
      read(item);
      insertNode(rootPtr, item);
      Writeln;
      Writeln('-------------------------------------------------');
      Writeln;
    end;
    if(choice = 3) then
    begin
      bool := False;
      write('Enter the element: ');
      read(item);
      deleteElement(treePtr, rootPtr, item);
      Writeln;
      Writeln('The element has been deleted');
      Writeln('-------------------------------------------------');
      Writeln;
    end;
    if(choice = 4) then
    begin
      printTree(rootPtr, 0);
      Writeln;
      Writeln('-------------------------------------------------');
      Writeln;
    end;
    if(choice = 5) then
    begin
      write('RAB: ');
      RAB(rootPtr);
      Writeln;
      write('ARB: ');
      ARB(rootPtr);
      Writeln;
      write('ABR: ');
      ABR(rootPtr);
      Writeln;
      Writeln('-------------------------------------------------');
      Writeln;
    end;
    if(choice = 6) then
    begin
      bool := True;
      nilFlash(treePtr);
      treePtr := rootPtr;
      flash(treePtr);
      Writeln('-------------------------------------------------');
      Writeln;
    end;
    if(choice = 7) then
    begin
      bool := False;
      write('Enter the element: ');
      read(item);
      deleteElement(treePtr, rootPtr, item);
      Writeln;
      Writeln('The element has been deleted');
      Writeln('-------------------------------------------------');
      Writeln;
    end;
    if(choice = 8) then
    begin
      if(bool = false) then
      begin
        nilFlash(treePtr);
        treePtr := rootPtr;
        flash(treePtr);
      end;
      printFlash(rootPtr);
      Writeln;
      Writeln('-------------------------------------------------');
      Writeln;
    end;
    if(choice = 9) then
    begin
      bool := false;
      deleteTree(rootPtr);
      Writeln('The tree has been deleted');
      Writeln('-------------------------------------------------');
      Writeln;
    end;
    if((choice > 9) or (choice < 1)) then
    begin
      Writeln('Illegal choice');
      instructions;
    end;
    treePtr := rootPtr;
    write('? ');
    read(choice);
    Writeln;
    Writeln('-------------------------------------------------');
    writeln;
  end;

  deleteTree(rootPtr);
  Writeln('End of run');
  Readln;
end.
