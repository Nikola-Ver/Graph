unit TaylorRows;

interface

function MyLn(var x: Real): Real;
function MySin(var x: Real): Real;
function MyCos(var x: Real): Real;

implementation

function MyLn(var x: Real): Real;
var
  Prev, Zn, Sign, Temp: Real;
begin
  Sign:= 1;
  Temp:= x-1;
  Zn:= 1;
  Result:= 0;
  Prev:= 1;

  if x < 1.0000000000001 then
    while (Abs(Result - Prev) > 0.00000001) do // —ильно лагает при большей точности
    begin
      Prev:= Result;
      Result:= Result + Sign * Temp / Zn;
      Sign:= -Sign;
      Temp:= Temp * (x-1);
      Zn:= Zn + 1;
    end
  else
      begin
        Temp:= 1/x-1;
        while (Abs(Result - Prev) > 0.0000000000001) do
        begin
          Prev:= Result;
          Result:= Result + Sign * Temp / Zn;
          Sign:= -Sign;
          Temp:= Temp * (1/x-1);
          Zn:= Zn + 1;
        end;
        Result:= -Result;
      end;
  {√рамоздкость данной формулы обусловлена выйграшем во времени (избавл€ет от сравнени€ в конце итераций)}
end;

function MySin(var x: Real): Real;
var
  Prev, Ch, Zn, Sign: Real;
  dPi, n: Integer;
begin
  dPi:= Trunc(x/pi);
  if Abs(dPi mod 2) = 1 then
    if x > 0 then
      x:= x - (dPi - 1) * pi
    else
      x:= x - (dPi - 1) * pi + 2 * pi
  else
    if x > 0 then
      x:= x - dPi * pi
    else
      x:= x - dPi * pi + 2 * pi;
  Sign:= 1;
  n:= 1;
  Result:= 0;
  Prev:= 1;
  Ch:= x;
  Zn:= 1;
  while (Abs(Result - Prev) > 0.0000000000001) do
  begin
    Prev:= Result;
    Result:= Result + Sign * Ch / Zn;
    Sign:= -Sign;
    Ch:= Ch * x * x;
    Zn:= Zn * (n + 1) * (n + 2);
    n:= n + 2;
  end;
end;

function MyCos(var x: Real): Real;
var
  Prev, Ch, Zn, Sign: Real;
  dPi, n: Integer;
begin
  dPi:= Trunc(x/pi);
  if Abs(dPi mod 2) = 1 then
    if x > 0 then
      x:= x - (dPi - 1) * pi
    else
      x:= x - (dPi - 1) * pi + 2 * pi
  else
    if x > 0 then
      x:= x - dPi * pi
    else
      x:= x - dPi * pi + 2 * pi;
  Sign:= 1;
  n:= 1;
  Result:= 0;
  Prev:= 1;
  Ch:= 1;
  Zn:= 1;
  while (Abs(Result - Prev) > 0.0000000000001) do
  begin
    Prev:= Result;
    Result:= Result + Sign * Ch / Zn;
    Sign:= -Sign;
    Ch:= Ch * x * x;
    Zn:= Zn * (n) * (n + 1);
    n:= n + 2;
  end;
end;

end.
