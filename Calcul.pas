unit Calcul;

interface

type

  TTreeRef = ^TTree;

  TTree = record
    Count: Real;
    Sign: Char;
    Opr1: Real;
    Opr2: Real;
    x1: Boolean;
    x2: Boolean;
    Left: TTreeRef;
    Right: TTreeRef;
  end;

  TExtremumRef = ^TExtremum;

  TExtremum = record
    Value: Real;
    Ref: TExtremumRef;
  end;

procedure Encryption(var s: String);
procedure CheckStr(var s: String);
procedure MakeRecord(var s: String; var PTree: TTreeRef);
procedure Count(var x: Real; PTree: TTreeRef; var Interrupt: Boolean);
procedure ClearTree(PTree: TTreeRef);

implementation

uses SysUtils, TaylorRows;

const
  Num = ['0','1','2','3','4','5','6','7','8','9','.',',','x'];
  MakeNum = ['0','1','2','3','4','5','6','7','8','9','.',','];
  e = '2,7182818284590452353602874713527';
  dlina = 256;

type
  MasStack = array [1..dlina] of String;

var
  DivisionTooDegree: Boolean;

procedure ClearTree(PTree: TTreeRef);
begin
  if PTree <> nil then
    begin
      ClearTree(PTree.Left);
      ClearTree(PTree.Right);
      Dispose(PTree);
    end;
end;

procedure SearchNum(s: String; var i, dNum: Integer);
begin
  dNum:= i;
  while ((i > 0) and (i <= Length(s)) and (s[i] in Num)) do Inc(i);
end;

procedure Encryption(var s: String);
var
  StackZn: array [1..dlina] of Char;
  StackPrior: array [1..dlina] of Integer;
  StackP, TempLog: MasStack;
  Temp: String;
  i, dNum, Order, d, Prior, sp, tl: Integer;
  Flag: Boolean;
begin
  for i:= 1 to dlina do
  begin
    StackZn[i]:= #0;
    StackPrior[i]:= 0;
  end;
  i:= 1;
  dNum:= 0;
  sp:= 1;
  d:= 1;
  tl:= 1;
  Order:= 1;
  Prior:= 0;
  repeat
    Flag:= True;
    if s[i] in Num then
    begin
      SearchNum(s, i, dNum);
      StackP[Order]:= Copy(s, dNum, i - dNum) + #32;
      Inc(Order);
    end;

    case s[i] of
      '^':
        begin
          StackZn[d]:= '^';
          Prior:= 3;
          Inc(i);
          Inc(d);
        end;

      '*':
        repeat
          if (Prior < 2) or (d = 1) then
            begin
              StackZn[d]:= '*';
              Inc(i);
              Inc(d);
            end
          else
            begin
              StackP[Order]:= StackZn[d - 1] + #32;
              Inc(Order);
              if Flag then Inc(i);
              Flag:= False;
              StackZn[d - 1]:= '*'
            end;
          Prior:= 2;
          if (d > 2) and (StackZn[d - 2] in ['^','*','/']) then
            begin
              Dec(d);
              Prior:= 4;
            end;
        until (Prior = 2);

      '/':
        repeat
          if (Prior < 2) or (d = 1) then
            begin
              StackZn[d]:= '/';
              Inc(i);
              Inc(d)
            end
          else
            begin
              StackP[Order]:= StackZn[d - 1] + #32;
              Inc(Order);
              if Flag then Inc(i);
              Flag:= False;
              StackZn[d - 1]:= '/';
            end;
          Prior:= 2;
          if (d > 2) and (StackZn[d - 2] in ['^','*','/']) then
            begin
              Dec(d);
              Prior:= 4;
            end;
        until (Prior = 2);

      '+':
        repeat
          if (Prior < 1) or (d = 1) then
            begin
              StackZn[d]:= '+';
              Inc(i);
              Inc(d);
            end
          else
            begin
              StackP[Order]:= StackZn[d - 1] + #32;
              Inc(Order);
              if Flag then Inc(i);
              Flag:= False;
              StackZn[d - 1]:= '+';
            end;
          Prior:= 1;
          if (d > 2) and (StackZn[d - 2] in ['^','*','/','+','-']) then
            begin
              Dec(d);
              Prior:= 4;
            end;
        until (Prior = 1);

      '-':
        repeat
          if (Prior < 1) or (d = 1) then
            begin
              StackZn[d]:= '-';
              Inc(i);
              Inc(d);
            end
          else
            begin
              StackP[Order]:= StackZn[d - 1] + #32;
              Inc(Order);
              if Flag then Inc(i);
              Flag:= False;
              StackZn[d - 1]:= '-';
            end;
          Prior:= 1;
          if (d > 2) and (StackZn[d - 2] in ['^','*','/','+','-']) then
            begin
              Dec(d);
              Prior:= 4;
            end;
        until (Prior = 1);

      '(':
        begin
          StackPrior[sp]:= Prior;
          Inc(sp);
          Prior:= 0;
          StackZn[d]:= '(';
          i:= i + 1;
          Inc(d);
        end;

      ')':
        begin
          Dec(d);
          while (d > 0) and (StackZn[d] <> '(') do
          begin
            StackP[Order]:= StackZn[d] + #32;
            Dec(d);
            Inc(Order)
          end;
          Dec(sp);
          Prior:= StackPrior[sp];
          i:= i + 1;
        end;

      '[':
        begin
          StackPrior[sp]:= Prior;
          Inc(sp);
          Prior:= 0;
          StackZn[d]:= '[';
          i:= i + 1;
          Inc(d);
        end;

      ']':
        begin
          Dec(d);
          while (d > 0) and (StackZn[d] <> '[') do
          begin
            StackP[Order]:= StackZn[d] + #32;
            Dec(d);
            Inc(Order)
          end;
          Dec(sp);

          StackP[Order]:= 'A' + #32;
          Inc(Order);

          Prior:= StackPrior[sp];
          i:= i + 1;
        end;

      '#':
        begin
          StackZn[d]:= '#';
          Inc(d);
          StackPrior[sp]:= Prior;
          Inc(sp);
          Prior:= 0;
          Inc(i);
          if (i > 0) and (s[i] in Num) then
            begin
              SearchNum(s,i,dNum);
              TempLog[tl]:= Copy(s, dNum, i - dNum);
            end;
          Inc(i);
          Inc(tl);
        end;

      'c':
        begin
          StackZn[d]:='c';
          StackPrior[sp]:= Prior;
          Inc(sp);
          Prior:= 0;
          Inc(i);
          Inc(d);
        end;

      's':
        begin
          StackZn[d]:='s';
          StackPrior[sp]:= Prior;
          Inc(sp);
          Prior:= 0;
          Inc(i);
          Inc(d);
        end;

      'I':
        begin
          sp:= sp - 1;
          Prior:= StackPrior[sp];
          d:= d - 1;
          while (d > 0) and (StackZn[d] <> 'c') do
          begin
            StackP[Order]:= StackZn[d] + #32;
            Dec(d);
            Inc(Order)
          end;
          Inc(i);
          StackP[Order]:= 'c' + #32;
          Inc(Order);
        end;

      'i':
        begin
          sp:= sp - 1;
          Prior:= StackPrior[sp];
          d:= d - 1;
          while (d > 0) and (StackZn[d] <> 's') do
          begin
            StackP[Order]:= StackZn[d] + #32;
            Dec(d);
            Inc(Order);
          end;
          Inc(i);
          StackP[Order]:= 's' + #32;
          Inc(Order);
        end;

      '_':
        begin
          sp:= sp - 1;
          Prior:= StackPrior[sp];
          Dec(d);
          while (d > 0) and (StackZn[d] <> '#') do
          begin
            StackP[Order]:= StackZn[d] + #32;
            Dec(d);
            Inc(Order)
          end;
          Inc(i);
          Dec(tl);
          StackP[Order]:= '#';
          StackP[Order + 1]:=TempLog[tl] + #32;
          Inc(Order,2)
        end;
    end;
  until (i > Length(s)); //In work

  Dec(d);

  while (d >= 1) do
  begin
    StackP[Order]:= StackZn[d] + #32;
    Dec(d);
    Inc(Order)
  end;

  s:='';
  for i:=1 to Order do
    s:= s + StackP[i];

  i:= 1;
  while i <= Length(s) do
  begin
    if s[i] = '#' then
      begin
        Inc(i);
        SearchNum(s,i,d);
        temp:= Copy(s,d,i - d);
        Delete(s,d,i - d);
        i:= i + 1;
        Insert(#32 + temp,s,d - 2);
      end;
    inc(i);
  end;
end;

procedure CheckStr(var s: String);
var
  Skob, i, d: Integer;
begin
  Skob:= 0;

  i:= 2;
  if s[1] = '-' then
    s:= '0' + s
  else
    s:= '0+' + s;

  i:= 1;
  while (i <= Length(s)) do
  begin
    if s[i] = 'x' then
      begin
        Insert('(',s,i);
        i:= i + 2;
        Insert(')',s,i);
      end;
    i:= i + 1;
  end;

  i:= 1;
  while (i <= Length(s)) do
  begin
    if s[i] = '(' then Inc(Skob);
    if s[i] = ')' then Dec(Skob);
    if (s[i] in ['+','-','*','/','^']) and (s[i + 1] in ['+','-','*','/','^'])
    then s:= 'Error';

    if s[i] = '|' then
      begin
        case s[i-1] of
          '+','-','*','/','^','(','c','s':
            s[i]:= '[';
          '[':
            s[i]:= '[';
          '0','1','2','3','4','5','6','7','8','9',')','_','I','i','x':
            s[i]:= ']';
          ']':
            s[i]:= ']';
        end;

        if (i + 1 < Length(s)) and ((s[i + 1] in ['+','-','*','/','^']) and not (s[i - 1] in ['+','-','*','/','^'])) then
          s[i]:= ']';

      end;

    Inc(i);
  end;

  i:=2;
  while (i <= Length(s)) do
  begin
    if (s[i] = '-') then
      begin
        if (s[i + 1] in Num) and (s[i-1] <> '(') and (s[i-1] <>  '[') then
          begin
            Insert('+(0',s,i);
            i:= i + 4;
            SearchNum(s, i, d);
            Insert(')',s,i);
          end;

        if ((s[i-1] = '(') or (s[i-1] = '[')) then
          begin
            if (s[i + 1] <> '(') and (s[i + 1] <> '[') then
              begin
                Insert('(0',s,i);
                i:= i + 3;
                SearchNum(s, i, d);
                Insert(')',s,i);
              end
            else
              Insert('0',s,i);
          end;
      end;
    Inc(i);
  end;

  if Skob <> 0 then s:= 'Error';

  i:= 1;
  {«¿Ã≈Õ¿ œ≈–≈Ã≈ÕÕ€’ » Œœ≈–¿÷»… (pi, e, log, lg, ln, cos, sin)}
  while (i <= Length(s)) do
  begin
    if ((s[i] = 'P') and (s[i + 1] = 'i')) then
    begin
      Delete(s,i,2);
      Insert(FloatToStr(Pi),s,i);
      Inc(i,4);
    end;

    if s[i] = 'e' then
    begin
      Delete(s,i,1);
      Insert(e,s,i);
      Inc(i,33);
    end;

    if s[i] = 'l' then
    case s[i + 1] of
      'o':
        begin
          if s[i + 2] <> 'g' then s:= 'Error'
          else
            begin
              Delete(s,i,3);
              Insert('#',s,i);
              Inc(i);
              d:= i;
              while ((d <= Length(s)) and ((s[d] <> ')') or (Skob <> 0))) do
              begin
                Inc(d);
                if s[d] = '(' then Inc(Skob);
                if s[d] = ')' then Dec(Skob);
              end;
              Delete(s,d,1);
              Insert('_',s,d);
            end;
        end;
      'g':
        begin
          if not ((s[i + 2] in Num) or (s[i + 2] in ['+','-','/','*','^','(',')','_'])) then s:= 'Error';
          Delete(s,i,2);
          Insert('#10',s,i);
          i:= i + 2;
          d:= i;
          while ((d <= Length(s)) and ((s[d] <> ')') or (Skob <> 0))) do
          begin
            Inc(d);
            if s[d] = '(' then Inc(Skob);
            if s[d] = ')' then Dec(Skob);
          end;
          Delete(s,d,1);
          Insert('_',s,d);
        end;
      'n':
        begin
          if not ((s[i + 2] in Num) or (s[i + 2] in ['+','-','/','*','^','(',')','_'])) then s:= 'Error';
          Delete(s,i,2);
          Insert('#2,7182818284590452353602874713527',s,i);
          i:= i + 33;
          d:= i;
          while ((d <= Length(s)) and ((s[d] <> ')') or (Skob <> 0))) do
          begin
            Inc(d);
            if s[d] = '(' then Inc(Skob);
            if s[d] = ')' then Dec(Skob);
          end;
          Delete(s,d,1);
          Insert('_',s,d);
        end;
      else
        s:= 'Error';
    end;

    if s[i] = 'c' then
      if s[i + 1] = 'o' then
        if s[i + 2] = 's' then
          begin
            Delete(s,i,4);
            Insert('c',s,i);
            d:= i;
            Skob:= 1;
            while ((d <= Length(s)) and ((s[d] <> ')') or (Skob <> 0))) do
            begin
              Inc(d);
              if s[d] = '(' then Inc(Skob);
              if s[d] = ')' then Dec(Skob);
            end;
            Delete(s,d,1);
            Insert('I',s,d);
          end
        else
          s:= 'Error'
      else
        s:= 'Error';

      if s[i] = 's' then
      if s[i + 1] = 'i' then
        if s[i + 2] = 'n' then
          begin
            Delete(s,i,4);
            Insert('s',s,i);
            d:= i;
            Skob:= 1;
            while ((d <= Length(s)) and ((s[d] <> ')') or (Skob <> 0))) do
            begin
              Inc(d);
              if s[d] = '(' then Inc(Skob);
              if s[d] = ')' then Dec(Skob);
            end;
            Delete(s,d,1);
            Insert('i',s,d);
          end
        else
          s:= 'Error'
      else
        s:= 'Error';
    Inc(i)
  end;

  i:= 1;
  while (i <= Length(s)) do
  begin
    if s[i] = '[' then Inc(Skob);
    if s[i] = ']' then Dec(Skob);
    Inc(i);
  end;

  if Skob <> 0 then s:= 'Error';

end;

function ZnDegree(Opr2: Real): Boolean;
begin
  Opr2:= Trunc(Opr2 * 1000000000000)/1000000000000 - Opr2;

  if DivisionTooDegree then
    if (Abs(Opr2) < 0.0000000000001) then  // ≈ÒÎË ÔÂ‰˚‰Û˘ËÏ ·˚ÎÓ ‰ÂÎÂÌËÂ, ÚÓ ‚ÒÂ ‡·ÓÚ‡ÂÚ
      Result:= True
    else
      Result:= False
  else
    Result:= True;
end;

function Degree(Oper1, Oper2: Real; var Error1: Boolean): Real;
begin
  if Oper2 = 0 then
    Result:= 1
  else
    if Oper1 = 0 then
      Result:= 0
    else
      if Oper1 < 0 then
        begin
          Oper1:= -Oper1;
          if (Abs(Oper2 / 2 - Trunc(Oper2 / 2)) < 0.000000000000001) then
            Result:= Exp(MyLn(Oper1) * Oper2)
          else
            if (Abs(Oper2 - Trunc(Oper2)) < 0.000000000000001) then
              Result:= -Exp(MyLn(Oper1) * Oper2)
            else
              if ZnDegree(Oper2) then
                Error1:= True
              else
                Result:= -Exp(MyLn(Oper1) * Oper2);
        end
      else
        Result:= Exp(MyLn(Oper1) * Oper2);
end;

procedure NumCalculate(s: String; var i, dNum: Integer);
begin
  dNum:= i;
  while (i > 0) and ((s[i] in Num) or (s[i] = '-')) do Dec(i);
  Inc(i);
  Inc(dNum);
end;

procedure MakeRecordCommon2(var Ps, Ptemp: String; var Ppi, Pd: Integer; var PPTree, PredPPTree: TTreeRef);
begin
  {”ƒÀ¿»“‹ »« —“–Œ » «Õ¿  (”◊»“€¬¿ﬂ œ–Œ¡≈À€ Ã≈∆ƒ” ›À≈Ã≈Õ“¿Ã»)}
  Delete(Ps,Ppi,2);
  Dec(Ppi, 2);
  {1-€… Œœ≈–¿Õƒ »À» «Õ¿ }
  if Ps[Ppi] = 'x' then
    begin
      PPTree.x2:= True;
      Delete(Ps,Ppi,2);
      Dec(Ppi, 2);
      PPTree.Right:= Nil;
    end
  else
    if Ps[Ppi] in MakeNum then
      begin
        NumCalculate(Ps,Ppi,Pd);
        Ptemp:= Copy(Ps,Ppi,Pd - Ppi);
        PPTree.Opr2:= StrToFloat(Ptemp);
        Delete(Ps, Ppi, Pd - Ppi + 1);
        Dec(Ppi,2);
        PPTree.Right:=  Nil;
      end
    else
      begin
        New(PPTree.Right);
        PredPPTree:= PPTree;
        PPTree:= PPTree.Right;
        PPTree.x1:= False;
        PPTree.x2:= False;
        MakeRecord(Ps, PPTree);
        PPTree:= PredPPTree;
        Ppi:= Length(Ps) - 1;
      end;

  {2-Œ… Œœ≈–¿Õƒ »À» «Õ¿ }
  if Ps[Ppi] = 'x' then
    begin
      PPTree.x1:= True;
      Delete(Ps,Ppi,2);
      Dec(Ppi, 2);
      PPTree.Left:= Nil;
      Ppi:= 0;
    end
  else
    if Ps[Ppi] in MakeNum then
      begin
        NumCalculate(Ps,Ppi,Pd);
        Ptemp:= Copy(Ps,Ppi,Pd - Ppi);
        PPTree.Opr1:= StrToFloat(Ptemp);
        Delete(Ps, Ppi, Pd - Ppi + 1);
        Dec(Ppi,2);
        PPTree.Left:=  Nil;
        Ppi:= 0;
      end
    else
      begin
        New(PPTree.Left);
        PredPPTree:= PPTree;
        PPTree:= PPTree.Left;
        PPTree.x1:= False;
        PPTree.x2:= False;
        MakeRecord(Ps, PPTree);
        PPTree:= PredPPTree;
      end;

  Inc(Ppi);
end;

{”Õ¿–Õ€≈ Œœ≈–¿÷»»}
procedure MakeRecordCommon1(var Ps, Ptemp: String; var Ppi, Pd: Integer; var PPTree, PredPPTree: TTreeRef);
begin
  {”ƒÀ¿»“‹ »« —“–Œ » «Õ¿  (”◊»“€¬¿ﬂ œ–Œ¡≈À€ Ã≈∆ƒ” ›À≈Ã≈Õ“¿Ã»)}
  Delete(Ps,Ppi,2);
  Dec(Ppi, 2);
  {Œœ≈–¿Õƒ »À» «Õ¿ }
  if Ps[Ppi] = 'x' then
    begin
      PPTree.x2:= True;
      Delete(Ps,Ppi,2);
      Dec(Ppi, 2);
      PPTree.Right:= Nil;
      PPTree.Left:= Nil;
      Ppi:= 0;
    end
  else
    if Ps[Ppi] in MakeNum then
      begin
        NumCalculate(Ps,Ppi,Pd);
        Ptemp:= Copy(Ps,Ppi,Pd - Ppi);
        PPTree.Opr2:= StrToFloat(Ptemp);
        Delete(Ps, Ppi, Pd - Ppi + 1);
        Dec(Ppi,2);
        PPTree.Right:= Nil;
        PPTree.Left:=  Nil;
        Ppi:= 0;
      end
    else
      begin
        PPTree.Left:= Nil;
        New(PPTree.Right);
        PredPPTree:= PPTree;
        PPTree:= PPTree.Right;
        PPTree.x1:= False;
        PPTree.x2:= False;
        MakeRecord(Ps, PPTree);
        PPTree:= PredPPTree;
      end;

  Inc(Ppi);
end;

procedure MakeRecord(var s: String; var PTree: TTreeRef);
var
  PredPTree: TTreeRef;
  i, d: Integer;
  temp: String;
begin
  i:= Length(s);
  d:= 1;
  PredPTree:= PTree;

  while ((i <= Length(s)) and (i >= 1)) do
  begin
    case s[i] of
      '+':
        begin
          {«¿œ»—¿“‹ œŒÀ”◊≈ÕÕ€… «Õ¿ }
          PTree.Sign:= '+';
          {¬€Õ≈— ¬ Œ“ƒ≈À‹Õ”ﬁ œ–Œ÷≈ƒ”–€ ◊“Œ¡€ Õ≈  Œœ»–Œ¬¿“‹ œŒ 100 –¿«)}
          MakeRecordCommon2(s,temp,i,d,PTree,PredPTree);
        end;

      '-':
        begin
          {«¿œ»—¿“‹ œŒÀ”◊≈ÕÕ€… «Õ¿ }
          PTree.Sign:= '-';
          MakeRecordCommon2(s,temp,i,d,PTree,PredPTree);
        end;

      '*':
        begin
          {«¿œ»—¿“‹ œŒÀ”◊≈ÕÕ€… «Õ¿ }
          PTree.Sign:= '*';
          MakeRecordCommon2(s,temp,i,d,PTree,PredPTree);
        end;

      '/':
        begin
          {«¿œ»—¿“‹ œŒÀ”◊≈ÕÕ€… «Õ¿ }
          PTree.Sign:= '/';
          MakeRecordCommon2(s,temp,i,d,PTree,PredPTree);
        end;

      '#':
        begin
          {«¿œ»—¿“‹ œŒÀ”◊≈ÕÕ€… «Õ¿ }
          PTree.Sign:= '#';
          MakeRecordCommon2(s,temp,i,d,PTree,PredPTree);
        end;

      {”Õ¿–Õ€… Œœ≈–¿÷»» “–≈¡”≈“ ƒ–”√Œ√Œ œŒƒŒ’Œƒ¿}
      {»’ œŒ ”ƒ¿ 3: ÃŒƒ”À‹(¿), —»Õ”—(s),  Œ—»Õ”—(c)}
      {ƒÀﬂ ”Õ¿–ÕŒ… Œœ≈–¿÷»» Œœ–≈ƒ≈À≈Õ Œƒ»Õ Œœ≈–¿Õƒ - Opr1}
      'A':
        begin
          {«¿œ»—¿“‹ œŒÀ”◊≈ÕÕ€… «Õ¿ }
          PTree.Sign:= 'A';
          MakeRecordCommon1(s,temp,i,d,PTree,PredPTree);
        end;

      's':
        begin
          {«¿œ»—¿“‹ œŒÀ”◊≈ÕÕ€… «Õ¿ }
          PTree.Sign:= 's';
          MakeRecordCommon1(s,temp,i,d,PTree,PredPTree);
        end;

      'c':
        begin
          {«¿œ»—¿“‹ œŒÀ”◊≈ÕÕ€… «Õ¿ }
          PTree.Sign:= 'c';
          MakeRecordCommon1(s,temp,i,d,PTree,PredPTree);
        end;

      '^':
        begin
          {«¿œ»—¿“‹ œŒÀ”◊≈ÕÕ€… «Õ¿ }
          PTree.Sign:= '^';
          MakeRecordCommon2(s,temp,i,d,PTree,PredPTree);
        end;
    end;

    Dec(i);
  end;
end;

procedure Count(var x: Real; PTree: TTreeRef; var Interrupt: Boolean);
begin
  DivisionTooDegree:= False;
  case PTree.Sign of
    '+':
      begin
        {LEFT}
        if PTree.x1 then
          PTree.Opr1:= x;
        if (PTree.Left <> nil) then
          Count(x,PTree.Left,Interrupt);

        {RIGHT}
        if PTree.x2 then
          PTree.Opr2:= x;
        if (PTree.Right <> nil) then
          begin
            Count(x,PTree.Right,Interrupt);
            if (PTree.Left <> nil) then
              PTree.Count:= PTree.Right.Count + PTree.Left.Count
            else
              PTree.Count:= PTree.Right.Count + PTree.Opr1;
          end
        else
          if (PTree.Left = nil) then
            PTree.Count:= PTree.Opr1 + PTree.Opr2
          else
            PTree.Count:= PTree.Left.Count + PTree.Opr2;
      end;

    '-':
      begin
        {LEFT}
        if PTree.x1 then
          PTree.Opr1:= x;
        if (PTree.Left <> nil) then
          Count(x,PTree.Left,Interrupt);

        {RIGHT}
        if PTree.x2 then
          PTree.Opr2:= x;
        if (PTree.Right <> nil) then
          begin
            Count(x,PTree.Right,Interrupt);
            if (PTree.Left <> nil) then
              PTree.Count:= PTree.Left.Count - PTree.Right.Count
            else
              PTree.Count:= PTree.Opr1 - PTree.Right.Count;
          end
        else
          if (PTree.Left = nil) then
            PTree.Count:= PTree.Opr1 - PTree.Opr2
          else
            PTree.Count:= PTree.Left.Count - PTree.Opr2;
      end;

    '*':
      begin
        {LEFT}
        if PTree.x1 then
          PTree.Opr1:= x;
        if (PTree.Left <> nil) then
          Count(x,PTree.Left,Interrupt);

        {RIGHT}
        if PTree.x2 then
          PTree.Opr2:= x;
        if (PTree.Right <> nil) then
          begin
            Count(x,PTree.Right,Interrupt);
            if (PTree.Left <> nil) then
              PTree.Count:= PTree.Right.Count * PTree.Left.Count
            else
              PTree.Count:= PTree.Right.Count * PTree.Opr1;
          end
        else
          if (PTree.Left = nil) then
            PTree.Count:= PTree.Opr1 * PTree.Opr2
          else
            PTree.Count:= PTree.Left.Count * PTree.Opr2;
      end;

    '/':
      begin
        DivisionTooDegree:= True;
        {LEFT}
        if PTree.x1 then
          PTree.Opr1:= x;
        if (PTree.Left <> nil) then
          Count(x,PTree.Left,Interrupt);

        {RIGHT}
        if PTree.x2 then
          PTree.Opr2:= x;
        if (PTree.Right <> nil) then
          begin
            Count(x,PTree.Right,Interrupt);
            if (PTree.Left <> nil) then
              if Abs(PTree.Right.Count) > 0.0000000000000000000000000000001 then
                PTree.Count:= PTree.Left.Count / PTree.Right.Count
              else
                Interrupt:= True
            else
              if Abs(PTree.Right.Count) > 0.0000000000000000000000000000001 then
                PTree.Count:= PTree.Opr1 / PTree.Right.Count
              else
                Interrupt:= True;
          end
        else
          if (PTree.Left = nil) then
            if Abs(PTree.Opr2) > 0.0000000000000000000000000000001 then
              PTree.Count:= PTree.Opr1 / PTree.Opr2
            else
                Interrupt:= True
          else
            if Abs(PTree.Opr2) > 0.0000000000000000000000000000001 then
              PTree.Count:= PTree.Left.Count / PTree.Opr2
            else
                Interrupt:= True;
      end;

    '#':
      begin
        {LEFT}
        if PTree.x1 then
          PTree.Opr1:= x;
        if (PTree.Left <> nil) then
          Count(x,PTree.Left,Interrupt);

        {RIGHT}
        if PTree.x2 then
          PTree.Opr2:= x;
        if (PTree.Right <> nil) then
          begin
            Count(x,PTree.Right,Interrupt);
            if (PTree.Left <> nil) then
              if (PTree.Right.Count > 0) and (PTree.Right.Count <> 1) and (PTree.Left.Count > 0) then
                PTree.Count:= MyLn(PTree.Left.Count) / MyLn(PTree.Right.Count)
              else
                Interrupt:= True
            else
              if (PTree.Right.Count > 0) and (PTree.Right.Count <> 1) and (PTree.Opr1 > 0) then
                PTree.Count:= MyLn(PTree.Opr1) / MyLn(PTree.Right.Count)
              else
                Interrupt:= True
          end
        else
          if (PTree.Left = nil) then
            if (PTree.Opr2 > 0) and (PTree.Opr2 <> 1) and (PTree.Opr1 > 0) then
              PTree.Count:= MyLn(PTree.Opr1) / MyLn(PTree.Opr2)
            else
              Interrupt:= True
          else
            if (PTree.Opr2 > 0) and (PTree.Opr2 <> 1) and (PTree.Left.Count > 0) then
              PTree.Count:= MyLn(PTree.Left.Count) / MyLn(PTree.Opr2)
            else
              Interrupt:= True;
      end;

    '^':
      begin
        {LEFT}
        if PTree.x1 then
          PTree.Opr1:= x;
        if (PTree.Left <> nil) then
          Count(x,PTree.Left,Interrupt);

        {RIGHT}
        if PTree.x2 then
          PTree.Opr2:= x;
        if (PTree.Right <> nil) then
          begin
            Count(x,PTree.Right,Interrupt);
            if (PTree.Left <> nil) then
              PTree.Count:= Degree(PTree.Left.Count,PTree.Right.Count,Interrupt) // ÀÂ‚˚È ‚ ÒÚÂÔÂÌË Ô‡‚Ó„Ó
            else
              PTree.Count:= Degree(PTree.Opr1,PTree.Right.Count,Interrupt);
          end
        else
          if (PTree.Left = nil) then
            PTree.Count:= Degree(PTree.Opr1,PTree.Opr2,Interrupt)
          else
            PTree.Count:= Degree(PTree.Left.Count,PTree.Opr2,Interrupt);
      end;

    'A':
      begin
        {RIGHT}
        if PTree.x2 then
          PTree.Opr2:= x;
        if (PTree.Right <> nil) then
          begin
            Count(x,PTree.Right,Interrupt);
            if (PTree.Left <> nil) then
              PTree.Count:= Abs(PTree.Opr2)
            else
              PTree.Count:= Abs(PTree.Right.Count);
          end
        else
          if (PTree.Left = nil) then
            PTree.Count:= Abs(PTree.Opr2)
          else
            PTree.Count:= Abs(PTree.Right.Count);
      end;

    's':
      begin
        {RIGHT}
        if PTree.x2 then
          PTree.Opr2:= x;
        if (PTree.Right <> nil) then
          begin
            Count(x,PTree.Right,Interrupt);
            if (PTree.Left <> nil) then
              PTree.Count:= MySin(PTree.Opr2)
            else
              PTree.Count:= MySin(PTree.Right.Count);
          end
        else
          if (PTree.Left = nil) then
            PTree.Count:= MySin(PTree.Opr2)
          else
            PTree.Count:= MySin(PTree.Right.Count);
      end;

    'c':
      begin
        {RIGHT}
        if PTree.x2 then
          PTree.Opr2:= x;
        if (PTree.Right <> nil) then
          begin
            Count(x,PTree.Right,Interrupt);
            if (PTree.Left <> nil) then
              PTree.Count:= MyCos(PTree.Opr2)
            else
              PTree.Count:= MyCos(PTree.Right.Count);
          end
        else
          if (PTree.Left = nil) then
            PTree.Count:= MyCos(PTree.Opr2)
          else
            PTree.Count:= MyCos(PTree.Right.Count);
      end;
  end;
end;

end.

