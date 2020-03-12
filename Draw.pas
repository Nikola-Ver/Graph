unit Draw;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Vcl.ExtCtrls, Calcul, Vcl.ComCtrls, Vcl.ActnMan,
  Vcl.ActnColorMaps, Vcl.Imaging.pngimage, System.ImageList, Vcl.ImgList, AboutProgram, InstructionsForUse;

type
  TMainForm = class(TForm)
    mm1: TMainMenu;
    MenuListFile: TMenuItem;
    MenuSave: TMenuItem;
    MenuSaveAs: TMenuItem;
    MenuListExtremums: TMenuItem;
    MenuLestHelp: TMenuItem;
    MenuHelp: TMenuItem;
    lbl1: TLabel;
    EditFunction: TEdit;
    ButtonDiv: TButton;
    ButtonSub: TButton;
    ButtonMul: TButton;
    ButtonAdd: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    ButtonPower: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    ButtonLog: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ButtonLg: TButton;
    ButtonX: TButton;
    Button0: TButton;
    ButtonDat: TButton;
    ButtonLn: TButton;
    Label2: TLabel;
    EditMinX: TEdit;
    EditMaxX: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    ButtonBild: TButton;
    ButtonOpenBracket: TButton;
    ButtonCloseBracket: TButton;
    ButtonAbs: TButton;
    FuncField: TGroupBox;
    ButtonSqrt: TButton;
    ButtonPi: TButton;
    ButtonSin: TButton;
    ButtonCos: TButton;
    DrawGraph: TImage;
    MenuExit: TMenuItem;
    ButtonBackSpace: TButton;
    ButtonCleanAll: TButton;
    ButtonE: TButton;
    ButtonCube: TButton;
    Label1: TLabel;
    EditMinY: TEdit;
    EditMaxY: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    SetY: TMenuItem;
    ReSetY: TMenuItem;
    Splitter1: TSplitter;
    ButtonSearchEx: TMenuItem;
    MenuChangeColor: TMenuItem;
    OnCoverGraph: TMenuItem;
    ListMax: TListBox;
    ListMin: TListBox;
    ComeBackFuncField: TMenuItem;
    GoAwayFuncField: TMenuItem;
    Settings: TGroupBox;
    SetApply: TButton;
    SetCancel: TButton;
    SetLine: TCheckBox;
    SetMax: TCheckBox;
    SetMin: TCheckBox;
    SetFuncField: TCheckBox;
    SetWinMaxMin: TCheckBox;
    SetWinDraw: TCheckBox;
    SetChange: TButton;
    SetHeadline: TLabel;
    SetClose: TImage;
    SetColor: TColorDialog;
    SetXY: TCheckBox;
    OffCoverGraph: TMenuItem;
    RunGraph: TMenuItem;
    SetLenEx: TMenuItem;
    SettingsEx: TGroupBox;
    HeadLineEx1: TLabel;
    HeadLineEx2: TLabel;
    ChangeLenEx: TTrackBar;
    ExOk: TButton;
    ExCancel: TButton;
    Instruction: TMenuItem;
    BoxHistory: TGroupBox;
    HistoryHead: TLabel;
    History: TListBox;
    ClearHistory: TMenuItem;
    MenuImage: TImageList;
    OffMode: TMenuItem;
    OnMode: TMenuItem;
    CurrentPoint: TGroupBox;
    LX: TLabel;
    CurrentX: TLabel;
    LY: TLabel;
    CurrentY: TLabel;
    procedure MenuExitClick(Sender: TObject);
    procedure ButtonDatClick(Sender: TObject);
    procedure EditFunctionKeyPress(Sender: TObject; var Key: Char);
    procedure SetYClick(Sender: TObject);
    procedure ReSetYClick(Sender: TObject);
    procedure MenuSaveAsClick(Sender: TObject);
    procedure EditMinXKeyPress(Sender: TObject; var Key: Char);
    procedure MenuSaveClick(Sender: TObject);
    procedure ButtonSearchExClick(Sender: TObject);
    procedure ListMinMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ListMinMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ListMinMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ListMaxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ListMaxMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ListMaxMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Splitter1Moved(Sender: TObject);
    procedure ComeBackFuncFieldClick(Sender: TObject);
    procedure GoAwayFuncFieldClick(Sender: TObject);
    procedure ListMinClick(Sender: TObject);
    procedure ListMaxClick(Sender: TObject);
    procedure MenuChangeColorClick(Sender: TObject);
    procedure SettingsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SettingsMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SettingsMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SetChangeClick(Sender: TObject);
    procedure SetCloseClick(Sender: TObject);
    procedure SetApplyClick(Sender: TObject);
    procedure OnCoverGraphClick(Sender: TObject);
    procedure OffCoverGraphClick(Sender: TObject);
    procedure RunGraphClick(Sender: TObject);
    procedure ExCancelClick(Sender: TObject);
    procedure ExOkClick(Sender: TObject);
    procedure SetLenExClick(Sender: TObject);
    procedure SettingsExMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SettingsExMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SettingsExMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ListMinKeyPress(Sender: TObject; var Key: Char);
    procedure ListMaxKeyPress(Sender: TObject; var Key: Char);
    procedure HistoryClick(Sender: TObject);
    procedure ClearHistoryClick(Sender: TObject);
    procedure OffModeClick(Sender: TObject);
    procedure OnModeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuHelpClick(Sender: TObject);
    procedure InstructionClick(Sender: TObject);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure DrawGraphMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FuncFieldMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure EditFunctionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  PointsMas = Array of Real;
var
  MainForm: TMainForm;

implementation

{$R *.dfm}

var
  Arr: Array of Integer; // Массив преобразованных точек
  LenEx: Integer = 20;
  ArrPoints: PointsMas; //  Массив не преобразованных точек
  SavePhoto: String; // Адрес и имя сохранения
  GapPoints: Array of Integer; // Массив разрывов
  SaveFlag: Boolean = True; // Флаг сохранения
  QuantityGap,LenMas: Integer; // Количество разрывов, длина массива точек
  Tree: TTreeRef; // Дерево
  ColorMin: COLORREF = ClRed;
  ColorMax: COLORREF = ClGreen;
  ColorLine: COLORREF = ClBlack;
  NewColorMin: COLORREF = ClRed;
  NewColorMax: COLORREF = ClGreen;
  NewColorLine: COLORREF = ClBlack;
  NewColorFuncField: COLORREF = ClWhite;
  NewColorWinMaxMin: COLORREF = ClCream;
  NewColorWinDraw: COLORREF = ClWhite;
  ColorWinDraw: COLORREF = ClWhite;
  ColorXY: COLORREF = ClBlack;
  NewColorXY: COLORREF = ClBlack;
  cx,cy:integer; // Смещение для окон (ListMin, ListMax)
  DownMin: Boolean = False;
  DownMax: Boolean = False;
  DownSet: Boolean = False;
  mx, my: Real; // масштаб по осям X и Y
  nx, ny: Real; // начально X,Y
  DownSetEx: Boolean = False;
  FlagSplitter: Boolean = True; // Нужен для того чтобы не вызвать функцию отрисовки дважды
  MaxEx,MinEx: Array of Integer; // Массив точекразрывов (нужен для вывода)
  HistoryScroll: Integer = 0;
  Mode: Boolean = True;

{procedure SetLastTime();
var
  f:TextFile;
  name:string;
  myDate:TDateTime;
  temp:string;
begin
  name:='lastEntry.txt';
  myDate:=Now;
  DateTimeToString(temp, 'h:m:s.z', myDate);
  AssignFile(f, name);
  Rewrite(f);
  Writeln(f, temp);
  Close(f);
end;

procedure SetFirstTime();
var
  f:TextFile;
  name:string;
  myDate:TDateTime;
  temp:string;
begin
  name:='firstEntry.txt';
  myDate:=Now;
  DateTimeToString(temp, 'h:m:s.z', myDate);
  AssignFile(f, name);
  Rewrite(f);
  Writeln(f, temp);
  Close(f);
end;                 }

procedure DrawGrpahic(Mas: PointsMas; h,w: Integer; X1,Y1: Real; mx,my: Real);
var
  i: Integer;
  Grow: Boolean;
  pY1,pY2,TempX: Integer;
begin
  LenMas:= w;

  QuantityGap:= 0;
  SetLength(GapPoints,QuantityGap);

  MainForm.DrawGraph.Canvas.Pen.Color:= ColorLine;
  SetLength(Arr,2 * w);
  i:= 0;
  Arr[i]:= Round((Mas[i] - X1) * mx);
  Arr[i + 1]:= Round(h + my * (Y1 - Mas[i + 1]));
  MainForm.DrawGraph.Canvas.Pixels[Arr[i], Arr[i + 1]]:= ColorLine;
  i:= i + 2;
  if (Mas[i - 1] < Mas[i + 1]) then
    Grow:= True //График возрастает
  else
    Grow:= False;

  if Mode then
    begin
      repeat
        Arr[i - 1]:= Round(h + my * (Y1 - Mas[i - 1]));
        Arr[i + 1]:= Round(h + my * (Y1 - Mas[i + 1]));
        pY1:= Arr[i - 1];
        pY2:= Arr[i + 1];

        if (Grow) and (Mas[i - 1] < Mas[i + 1]) then
          if ((pY2 <> pY1) or (pY2 <> pY1 + 1)) and (pY2 > 0) and (pY1 > 0) then
            begin
              Arr[i - 2]:= Round((Mas[i - 2] - X1) * mx);
              Arr[i]:= Round((Mas[i] - X1) * mx);
              MainForm.DrawGraph.Canvas.MoveTo(Arr[i - 2],pY1);
              MainForm.DrawGraph.Canvas.LineTo(Arr[i],pY2);
              TempX:= i; // Место где y ~ x/0
              if (i + 3 <= w * 2) and (Mas[i + 1] > Mas[i + 3] + Abs(Mas[i + 1])/10) and (Mas[i + 1] > Mas[i + 3] + 5) then
                begin
                  QuantityGap:= QuantityGap + 1;
                  SetLength(GapPoints,QuantityGap);
                  GapPoints[QuantityGap - 1]:= TempX;
                  MainForm.DrawGraph.Canvas.LineTo(Arr[TempX],0);
                end;
            end
          else
            if (i + 3 <= w * 2) and (TempX <= i) and (TempX >= 0) and (Mas[i + 1] > Mas[i + 3] + Abs(Mas[i + 1])/10) and (Mas[i + 1] > Mas[i + 3] + 5) then
              begin
                QuantityGap:= QuantityGap + 1;
                SetLength(GapPoints,QuantityGap);
                GapPoints[QuantityGap - 1]:= TempX;
                Arr[i]:= Round((Mas[i] - X1) * mx);
                MainForm.DrawGraph.Canvas.LineTo(Arr[TempX],0);
              end;

        if ((Not Grow) and (Mas[i - 1] > Mas[i + 1])) then
          if (pY2 <> pY1) or (pY2 <> pY1 - 1) and (pY2 > 0) and (pY1 > 0) then
            begin
              Arr[i - 2]:= Round((Mas[i - 2] - X1) * mx);
              Arr[i]:= Round((Mas[i] - X1) * mx);
              MainForm.DrawGraph.Canvas.MoveTo(Arr[i - 2],pY1);
              MainForm.DrawGraph.Canvas.LineTo(Arr[i],pY2);
              if (i + 3 <= w * 2) and (Mas[i + 1] + Abs(Mas[i + 1])/10 < Mas[i + 3]) and (Mas[i + 1] + 5 < Mas[i + 3]) then
                begin
                  QuantityGap:= QuantityGap + 1;
                  SetLength(GapPoints,QuantityGap);
                  GapPoints[QuantityGap - 1]:= i;
                  MainForm.DrawGraph.Canvas.LineTo(Arr[i],h);
                end;
            end
          else
            if (i + 3 <= w * 2) and (Mas[i + 1] + Abs(Mas[i + 1])/10 < Mas[i + 3]) and (Mas[i + 1] + 5 < Mas[i + 3]) then
              begin
                QuantityGap:= QuantityGap + 1;
                SetLength(GapPoints,QuantityGap);
                GapPoints[QuantityGap - 1]:= i;
                Arr[i]:= Round((Mas[i] - X1) * mx);
                MainForm.DrawGraph.Canvas.LineTo(Arr[i],h);
              end;

        Arr[i]:= Round((Mas[i] - X1) * mx);
        MainForm.DrawGraph.Canvas.Pixels[Arr[i], pY2]:= ColorLine;

        if (Mas[i - 1] <  Mas[i + 1]) then
          Grow:= True //График возрастает
        else
          Grow:= False;
        i:= i + 2;
      until (i >= 2 * w);

      i:= i - 4;
      if Grow then   // А теперь пройдемся в обратном направлении
        Grow:= False
      else
        Grow:= True;

      repeat
        pY1:= Arr[i + 1]; // pY2 и (или) pY1 могут быть отрицательными, если выставить свои ограничения по Y (или оно выставиться автоматически для сложных функци)
        pY2:= Arr[i - 1];

        if (Grow) and (Mas[i - 1] > Mas[i + 1]) then
          if ((pY2 <> pY1) or (pY2 <> pY1 + 1)) and (pY2 > 0) and (pY1 > 0) then
            begin
              MainForm.DrawGraph.Canvas.MoveTo(Arr[i - 2],pY1);
              if (i - 3 >= 0) and (Mas[i - 1] > Mas[i - 3] + Abs(Mas[i - 1])/10) and (Mas[i - 1] > Mas[i - 3] + 5) then
                begin
                  QuantityGap:= QuantityGap + 1;
                  SetLength(GapPoints,QuantityGap);
                  GapPoints[QuantityGap - 1]:= i - 2;
                  MainForm.DrawGraph.Canvas.LineTo(Arr[i - 2],0);
                end;
            end
          else
            if (i - 3 >= 0) and (Mas[i - 1] > Mas[i - 3] + Abs(Mas[i - 1])/10) and (Mas[i - 1] > Mas[i - 3] + 5) then
              begin
                QuantityGap:= QuantityGap + 1;
                SetLength(GapPoints,QuantityGap);
                GapPoints[QuantityGap - 1]:= i - 2;
                MainForm.DrawGraph.Canvas.MoveTo(Arr[i - 2],pY1);
                MainForm.DrawGraph.Canvas.LineTo(Arr[i - 2],0);
              end;

        if ((Not Grow) and (Mas[i - 1] < Mas[i + 1])) then
          if (pY2 <> pY1) or (pY2 <> pY1 - 1) and (pY2 > 0) and (pY1 > 0)  then
            begin
              MainForm.DrawGraph.Canvas.MoveTo(Arr[i - 2],pY1);
              if (i - 3 >= 0) and (Mas[i - 3] > Mas[i - 1] + Abs(Mas[i - 1])/10) and (Mas[i - 3] > Mas[i - 1] + 5) then
                begin
                  QuantityGap:= QuantityGap + 1;
                  SetLength(GapPoints,QuantityGap);
                  GapPoints[QuantityGap - 1]:= i - 2;
                  MainForm.DrawGraph.Canvas.LineTo(Arr[i - 2],h);
                end;
            end
          else
            if (i - 3 >= 0) and (Mas[i - 3] > Mas[i - 1] + Abs(Mas[i - 1])/10) and (Mas[i - 3] > Mas[i - 1] + 5) then
              begin
                QuantityGap:= QuantityGap + 1;
                SetLength(GapPoints,QuantityGap);
                GapPoints[QuantityGap - 1]:= i - 2;
                MainForm.DrawGraph.Canvas.MoveTo(Arr[i - 2],pY1);
                MainForm.DrawGraph.Canvas.LineTo(Arr[i - 2],h);
              end;

        if (Mas[i + 1] <  Mas[i - 1]) then
          Grow:= True //График возрастает
        else
          Grow:= False;
        i:= i - 2;
      until (i <= 0);
    end
  else
    begin
      MainForm.DrawGraph.Canvas.MoveTo(Arr[i - 2],Arr[i - 1]);
      repeat
        Arr[i]:= Round((Mas[i] - X1) * mx);
        Arr[i + 1]:= Round(h + my * (Y1 - Mas[i + 1]));
        MainForm.DrawGraph.Canvas.LineTo(Arr[i],Arr[i + 1]);
        i:= i + 2;
      until (i >= 2 * w);
    end;
end;

procedure GrOfFunc(var Func: String; var x1,x2,y1,y2: Real);
var
  x: Real; // аргумент функции
  y: Real; // значение функции в точке x
  dx,dy: Real;
  w, h: Integer; // ширина и высота области вывода графика
  dxDraw: Real;
  Skip: Integer; // Пропуск в массиве, если значение не подходит
  Error: Boolean;
  i: Integer;
  CountUp, ErrorOverflow: Boolean;
begin
                              {СОЗДАНИЕ ДЕРЕВА}
//------------------------------------------------------------------------------
  ClearTree(Tree); //Очистить дерево
  New(Tree);
  Tree.Left:= Nil;
  Tree.Right:= Nil;
  Tree.x1:= False;
  Tree.x2:= False;

  if Pos('=',Func) > 0 then
    begin
      Delete(Func,Pos('=',Func) - 1, Length(Func) - Pos('=',Func) + 2);
      MainForm.EditFunction.Clear;
      MainForm.EditFunction.Text:= Func;
    end;

  CheckStr(Func);
  CountUp:= False;
  if Pos('x',Func) = 0 then
    CountUp:= True;

  if Func <> 'Error' then
    begin
      Error:= False;
      try
        Encryption(Func); //Преобразование в польскую запись
        MakeRecord(Func, Tree); //Создание дерева
      except
        MainForm.EditFunction.Font.Color:= ClMaroon;
        MainForm.EditFunction.Text:= 'Ошибка!';
        Error:= True;
      end;
    end;

  if (Func <> 'Error') and not Error then
    begin
    // история вывода графиков
      with MainForm do
      begin
        if History.Items.Count > 31000 then
          begin
            History.Selected[0]:=True;
            History.DeleteSelected;
          end;

        if (History.Items.Count = 0) or ((History.Items.Count > 0) and
           (History.Items[History.Items.Count - 1] <> ('f(x) = ' + EditFunction.Text)))
        then
        begin
          if Length(EditFunction.Text) > 24 then
            begin
              HistoryScroll:= History.Width + (Length(EditFunction.Text) - 24) * 20;
              History.ScrollWidth:= HistoryScroll;
            end;
          History.Items.Add('f(x) = ' + EditFunction.Text);
        end;
      end;

      h := MainForm.DrawGraph.ClientHeight - 3; // высота
      w := MainForm.DrawGraph.ClientWidth; // ширина
      Skip:= 0;
      dxDraw:= Abs(X2 - X1) / w;
      SetLength(ArrPoints,2 * w);
      ErrorOverflow:= False;
      try // Проверка на переполнение
        begin
          Error:= False;
          Count(x1,Tree,Error);
          if MainForm.SetY.Enabled then
            begin
              if Not Error then
                Y1:= Tree.Count
              else
                Y1:= 0;
              Error:= False;
              Count(x2,Tree,Error);
              if Not Error then
                Y2:= Tree.Count
              else
                Y2:= 0;
            end;
        end;
      except
        MainForm.EditFunction.Font.Color:= ClMaroon;
        MainForm.EditFunction.Text:= 'Ошибка!';
        ErrorOverflow:= True;
      end;
      if not ErrorOverflow then
        begin
          X:= X1;
        //  SetFirstTime();
          i:= 0;
    //      X:= X + dxDraw;
          repeat
            Error:= False;
            Count(X,Tree,Error);
            if Not Error then
              begin
                Y:= Tree.Count;
                if (Y < Y1) and MainForm.SetY.Enabled then Y1 := Y;
                if (Y > Y2) and MainForm.SetY.Enabled  then Y2 := Y;
                ArrPoints[i - Skip * 2]:= X;
                ArrPoints[i + 1 - Skip * 2]:= Y;
              end
            else
              Skip:= Skip + 1;
            i:= i + 2;
            X:= X + dxDraw;
          until (i > 2 * w) or (Abs(X - X2) < 0.000000001);
        //  SetLastTime();

          if (Abs(Y2 - Y1) < 0.00000000001) then
            if Y2 > 0 then
              begin
                Y2:= Y2 * 3 / 2;
                Y1:= -Y1 * 3 / 2;
              end
            else
              begin
                Y2:= -Y2 * 3 / 2;
                Y1:= Y1 * 3 / 2;
              end
          else
            if ((Y1 < -300) or (Y2 > 300)) and (MainForm.SetY.Enabled) then
              begin
                Y1:= -20;
                Y2:= 20;
              end;
          if (Y1 = Y2) and (Y1 = 0) then
            begin
              Y1:= -20;
              Y2:= 20;
            end;

          nx:= X1;
          ny:= Y1;
          my := h / abs(Y2 - Y1); // масштаб по оси Y
          mx := w / abs(X2 - X1); // масштаб по оси X

          with MainForm.DrawGraph.Canvas do
          begin
            Font.Color:= ColorXY;
            dx:= (X2 - X1) / 10;
            X:= dx;
            if (y1 < 0) then
              begin
                while (X + dx < X2 - X1 + 0.00001) do
                begin
                  if (Abs(X + X1) > 0.0000001) then
                  begin
                    MoveTo(Round(mx * X), Round(h + my * Y1) - 7);
                    LineTo(Round(mx * X), Round(h + my * Y1) + 7);
                    TextOut(Round(mx * X) - 7, Round(h + my * Y1) + 7,FloatToStr(X + X1));
                  end;
                  X:= X + dx;
                end;
                MoveTo(0, Round(h + my * Y1));
                LineTo(w, Round(h + my * Y1));
                LineTo(w - 10, Round(h + my * Y1) + 5);
                MoveTo(w, Round(h + my * Y1));
                LineTo(w - 10, Round(h + my * Y1) - 5);
                TextOut(w - 15, Round(h + my * Y1) + 5 , 'x');
              end
            else
              begin
                MoveTo(0, h - 1);
                LineTo(w,h - 1);
                LineTo(w - 10, h - 6);
                TextOut(w - 20, h - 15, 'x');
              end;

            dy:= (Y2 - Y1) / 10;
            Y:= dy;
            if (x1 < 0) then
              begin
                while (Y + dy < Y2 - Y1 + 0.00001) do
                begin
                  if (Abs(Y + Y1) > 0.0000001) then
                  begin
                    MoveTo(Round(mx * (-X1)) - 7,Round(my * Y));
                    LineTo(Round(mx * (-X1)) + 7,Round(my * Y));
                    TextOut(Round(mx * (-X1)) + 12, Round(my * Y),FloatToStr(h / my - Y + Y1));
                  end;
                  Y:= Y + dy;
                end;
                MoveTo(Round(mx*(-X1)), h);
                LineTo(Round(mx*(-X1)), 0);
                LineTo(Round(mx*(-X1)) - 5, 10);
                MoveTo(Round(mx*(-X1)), 0);
                LineTo(Round(mx*(-X1)) + 5, 10);
                TextOut(Round(mx*(-X1)) + 5, 10, 'y');
                TextOut(Round(mx*(-X1)) - 10, Round(h + my * Y1) + 5,'0');
              end
            else
              begin
                MoveTo(0, h);
                LineTo(0, 0);
                LineTo(6, 10);
                TextOut(5, 10,'y');
              end;

            w:= w - (Skip + i - 2 * w);
            Setlength(ArrPoints, 2 * w);
          end;
          if length(ArrPoints) > 0 then
            begin
              DrawGrpahic(ArrPoints,h,w,X1,Y1,mx,my);
              if CountUp then
                MainForm.EditFunction.Text:= MainForm.EditFunction.Text + ' = ' + FloatToStr(Tree.Count);
            end
          else
            begin
              MainForm.EditFunction.Font.Color:= ClMaroon;
              MainForm.EditFunction.Text:= 'Ошибка!';
            end;
        end;
    end
  else
    begin
      with MainForm do
      begin
        MenuSave.Enabled:= False;
        MenuSaveAs.Enabled:= False;
        ButtonSearchEx.Enabled:= False;
        ButtonSearchEx.Visible:= False;
        SetLenEx.Enabled:= False;
        SetLenEx.Visible:= False;
        OnCoverGraph.Enabled:= False;
      end;

      MainForm.EditFunction.Font.Color:= ClMaroon;
      MainForm.EditFunction.Text:= 'Ошибка!';
    end;
end;

procedure CallDraw();
var
  f: String;
  xn,xk,yn,yk: Real;
begin
  with MainForm do
  begin
    DrawGraph.Left:= FuncField.ClientWidth;
    DrawGraph.Top:= 0;
    DrawGraph.ClientWidth:= MainForm.ClientWidth - FuncField.ClientWidth;
    DrawGraph.ClientHeight:= MainForm.ClientHeight;
    DrawGraph.Picture.Bitmap.Width:= MainForm.ClientWidth - FuncField.ClientWidth;
    DrawGraph.Picture.Bitmap.Height:= MainForm.ClientHeight;
  end;

  MainForm.DrawGraph.Canvas.Brush.Color:= ColorWinDraw;
  MainForm.DrawGraph.Canvas.Pen.Color:= ColorXY;
  MainForm.Color:= ColorWinDraw;

  if MainForm.EditMinX.Enabled then
    MainForm.DrawGraph.Canvas.FillRect(Rect(0, 0, MainForm.ClientWidth, MainForm.ClientHeight));

  xn:= StrToFloat(MainForm.EditMinX.Text);
  xk:= StrToFloat(MainForm.EditMaxX.Text);
  yn:= StrToFloat(MainForm.EditMinY.Text);
  yk:= StrToFloat(MainForm.EditMaxY.Text);
  f:= MainForm.EditFunction.Text;
  if (StrToFloat(MainForm.EditMinX.Text) < StrToFloat(MainForm.EditMaxX.Text)) and
     (StrToFloat(MainForm.EditMinY.Text) < StrToFloat(MainForm.EditMaxY.Text)) and
     (Length(MainForm.EditFunction.Text) > 0) and (MainForm.EditFunction.Text <> 'Ошибка!') and
     (MainForm.EditMinX.Text[Length((MainForm.EditMinX.Text))] <> ',') and
     (MainForm.EditMaxX.Text[Length((MainForm.EditMaxX.Text))] <> ',') and
     (MainForm.EditMinY.Text[Length((MainForm.EditMinY.Text))] <> ',') and
     (MainForm.EditMaxY.Text[Length((MainForm.EditMaxY.Text))] <> ',')
  then
    begin
      with MainForm do
      begin
        MenuSave.Enabled:= True;
        MenuSaveAs.Enabled:= True;
        ButtonSearchEx.Enabled:= True;
        ButtonSearchEx.Visible:= True;
        SetLenEx.Visible:= True;
        SetLenEx.Enabled:= True;
        OnCoverGraph.Enabled:= True;
      end;

      GrOfFunc(f,xn,xk,yn,yk);
    end
  else
    begin
      MainForm.MenuSave.Enabled:= False;
      MainForm.MenuSaveAs.Enabled:= False;
      MainForm.ButtonSearchEx.Enabled:= False;
      MainForm.ButtonSearchEx.Visible:= False;
      MainForm.EditFunction.Font.Color:= ClMaroon;
      MainForm.EditFunction.Text:= 'Ошибка!';
    end;
end;

procedure BackSpace();
var
  Temp: String;
begin
  Temp:= MainForm.EditFunction.Text;
  if Length(Temp) > 0 then
  case Temp[Length(Temp)] of
    ' ': Delete(Temp,Length(Temp)-2,3);
    'i': Delete(Temp,Length(Temp)-1,2);
    'x': Delete(Temp,Length(Temp),1);
    'e': Delete(Temp,Length(Temp),1);
    'g': Delete(Temp,Length(Temp) - 2, 3);
    '0'..'9':
        while ((Length(Temp) > 0) and (Temp[Length(Temp)] in ['0'..'9',','])) do
          Delete(Temp,Length(Temp),1);
    '(':
      case Temp[Length(Temp) - 1] of
        'n':
          case Temp[Length(Temp) - 2] of
            'i': Delete(Temp,Length(Temp) - 3, 4);
            'l': Delete(Temp,Length(Temp) - 2, 3);
          end;
        'g':
          Delete(Temp, Length(Temp) - 2, 3);
        's': Delete(Temp, Length(Temp) - 3, 4);
        else
        Delete(Temp,Length(Temp),1);
      end;
    else
      Delete(Temp,Length(Temp),1);
  end;
  MainForm.EditFunction.Text:= Temp;
end;

procedure TMainForm.ButtonDatClick(Sender: TObject);
begin
  if EditFunction.Text = 'Ошибка!' then
    begin
      EditFunction.Font.Color:= ClBlack;
      EditFunction.Clear;
    end;

  case (Sender as TButton).Tag of
    0: EditFunction.Text:= EditFunction.Text + '0' ;
    1: EditFunction.Text:= EditFunction.Text + '1' ;
    2: EditFunction.Text:= EditFunction.Text + '2' ;
    3: EditFunction.Text:= EditFunction.Text + '3' ;
    4: EditFunction.Text:= EditFunction.Text + '4' ;
    5: EditFunction.Text:= EditFunction.Text + '5' ;
    6: EditFunction.Text:= EditFunction.Text + '6' ;
    7: EditFunction.Text:= EditFunction.Text + '7' ;
    8: EditFunction.Text:= EditFunction.Text + '8' ;
    9: EditFunction.Text:= EditFunction.Text + '9' ;
    10: EditFunction.Text:= EditFunction.Text + 'x' ;
    11: EditFunction.Text:= EditFunction.Text + '-' ;
    12: EditFunction.Text:= EditFunction.Text + '+' ;
    13: EditFunction.Text:= EditFunction.Text + '/' ;
    14: EditFunction.Text:= EditFunction.Text + '*' ;
    15: EditFunction.Text:= EditFunction.Text + 'log';
    16: EditFunction.Text:= EditFunction.Text + 'ln(' ;
    17: EditFunction.Text:= EditFunction.Text + 'lg(' ;
    18: EditFunction.Text:= EditFunction.Text + '|' ;
    19: EditFunction.Text:= EditFunction.Text + '(' ;
    20: EditFunction.Text:= EditFunction.Text + ')' ;
    21: BackSpace();
    22: EditFunction.Clear;
    23: EditFunction.Text:= EditFunction.Text + '^';
    24: EditFunction.Text:= EditFunction.Text + '^(1/2)';
    25: EditFunction.Text:= EditFunction.Text + 'sin(';
    26: EditFunction.Text:= EditFunction.Text + 'cos(';
    27: EditFunction.Text:= EditFunction.Text + 'e';
    28: EditFunction.Text:= EditFunction.Text + 'Pi';
    29: EditFunction.Text:= EditFunction.Text + ',';
    30: EditFunction.Text:= EditFunction.Text + '^(1/3)';
  end;
end;

function CheckGap(Num: Integer): Boolean;
var
  d: Integer;
begin
  Result:= False;
  d:= 1;
  while (d <= QuantityGap) do
  begin
    if (Num = GapPoints[d - 1] - 1) or (Num = GapPoints[d - 1] + 1) then
      begin
        Result:= True;
        d:= QuantityGap;
      end
    else
      Result:= False;
    d:= d + 1;
  end;
end;

procedure DrawEx(Position: Integer; Max: Boolean);
var
  Col: COLORREF;
  From, Before, d: Integer;
begin
  if Max then
    Col:= ColorMax
  else
    Col:= ColorMin;

  From:= Position;
  d:= LenEx;
  while (From - 1 >= 0) and (d >= 0) do
  begin
    From:= From - 1;
    d:= d - 1;
  end;

  Before:= Position;
  d:= LenEx;
  while (Before + 1 <= LenMas * 2) and (d >= 0) do
  begin
    Before:= Before + 1; // Inc(Before)
    d:= d - 1; // Dec(d)
  end;

  d:= From;
  MainForm.DrawGraph.Canvas.Pen.Color:= Col;
  MainForm.DrawGraph.Canvas.Pen.Width:= 3;
  while (d <= Before) do
  begin
    if (Arr[d + 1] > 0) and (Arr[d - 1] > 0) then
      begin
        MainForm.DrawGraph.Canvas.MoveTo(Arr[d - 2],Arr[d + 1]);
        MainForm.DrawGraph.Canvas.LineTo(Arr[d],Arr[d - 1]);
      end;
    d:= d + 2;
  end;
  MainForm.DrawGraph.Canvas.Pen.Width:= 1;
end;

procedure TMainForm.ButtonSearchExClick(Sender: TObject);
var
  i,dMax,dMin: Integer;
  a,b,e,x1,x2,y1,y2: Real;
  Error: Boolean;
begin
  dMax:= 0;
  dMin:= 0;
  SetLength(MaxEx,dMax);
  SetLength(MinEx,dMin);

  MainForm.ListMin.Font.Color:= ColorMin;
  MainForm.ListMax.Font.Color:= ColorMax;
  ButtonSearchEx.Enabled:= False;
  ButtonSearchEx.Visible:= False;
  MainForm.ListMax.Items.Add('Список локальных максимумов');
  MainForm.ListMin.Items.Add('Список локальных минимумов');
  MainForm.ListMax.Items.Add('____________________________________________');
  MainForm.ListMin.Items.Add('____________________________________________');

  e:= 0.000001;
  i:= 3; // На нечетных местах в массиве расположен Y, на четных - X
  repeat
    {Точка локального минимума}
    if (ArrPoints[i - 2] > Arrpoints[i]) and (Arrpoints[i] < Arrpoints[i + 2]) and (Not CheckGap(i)) then
      begin
        a:= ArrPoints[i - 3];
        b:= ArrPoints[i + 3];
        dMin:= dMin + 1;
        SetLength(MinEx,dMin);
        MinEx[dMin - 1]:= i;

        repeat
          x1:= b - (b - a) / 1.6180339887498948482;
          x2:= a + (b - a) / 1.6180339887498948482;

          Error:= False;
          Count(x1,Tree,Error);
          if Not Error then
            Y1:= Tree.Count
          else
            Y1:= 0;

          Error:= False;
          Count(x2,Tree,Error);
          if Not Error then
            Y2:= Tree.Count
          else
            Y2:= 0;

          if y1 >= y2 then
            a:= x1
          else
            b:= x2;
        until (Abs(b - a) < e);

        Error:= False;
        a:= (a+b)/2;
        Count(a,Tree,Error);
        MainForm.ListMin.Items.Add('x = ' + FloatToStr(a) + ' y = ' + FloatToStr(Tree.Count));

        MainForm.ListMin.Left:= MainForm.FuncField.Width;
        MainForm.ListMin.Top:= 0;
        MainForm.ListMin.ScrollWidth:= 350;
        MainForm.ListMin.Visible:= True;
      end;

    {Точка локального максимума}
    if (ArrPoints[i - 2] < Arrpoints[i]) and (Arrpoints[i] > Arrpoints[i + 2]) and (Not CheckGap(i)) then
      begin
        a:= ArrPoints[i - 3];
        b:= ArrPoints[i + 3];
        dMax:= dMax + 1;
        SetLength(MaxEx,dMax);
        MaxEx[dMax - 1]:= i;

        repeat
          x1:= b - (b - a) / 1.6180339887498948482;
          x2:= a + (b - a) / 1.6180339887498948482;

          Error:= False;
          Count(x1,Tree,Error);
          if Not Error then
            y1:= Tree.Count;

          Error:= False;
          Count(x2,Tree,Error);
          if Not Error then
            Y2:= Tree.Count;

          if y1 <= y2 then
            a:= x1
          else
            b:= x2;
        until (Abs(b - a) < e);

        Error:= False;
        a:= (a+b)/2;
        Count(a,Tree,Error);
        MainForm.ListMax.Items.Add('x = ' + FloatToStr(a) + ' y = ' + FloatToStr(Tree.Count));

        MainForm.ListMax.Left:= MainForm.ClientWidth - 238;
        MainForm.ListMax.Top:= 0;
        MainForm.ListMax.ScrollWidth:= 350;
        MainForm.ListMax.Visible:= True;
      end;
    i:= i + 2;
  until (i > 2 * (LenMas - 1));

  if (not MainForm.ListMax.Visible) and (not MainForm.ListMin.Visible) then
    ShowMessage('Списки локальных экстремум пусты')
  else
    begin
      if not MainForm.ListMax.Visible then
        ShowMessage('Список локальных максимумов пуст');

      if not MainForm.ListMin.Visible then
        ShowMessage('Список локальных минимумов пуст');
    end;

end;

procedure TMainForm.EditFunctionKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Key:= 0;
end;

procedure TMainForm.EditFunctionKeyPress(Sender: TObject; var Key: Char);
begin
  if EditFunction.Text = 'Ошибка!' then
    begin
      EditFunction.Font.Color:= ClBlack;
      EditFunction.Clear;
    end;

  case key of
    #13: RunGraphClick(Sender);
    'o': EditFunction.Text:= EditFunction.Text + 'log';
    'p': EditFunction.Text:= EditFunction.Text + 'Pi';
    '0'..'9',',': EditFunction.Text:= EditFunction.Text + key;
    '.': EditFunction.Text:= EditFunction.Text + ',';
    'n': EditFunction.Text:= EditFunction.Text + 'ln(';
    'l': EditFunction.Text:= EditFunction.Text + 'lg(';
    's': EditFunction.Text:= EditFunction.Text + 'sin(';
    'c': EditFunction.Text:= EditFunction.Text + 'cos(';
    'e': EditFunction.Text:= EditFunction.Text + 'e';
    'x': EditFunction.Text:= EditFunction.Text + 'x';
    #8: BackSpace();
    #27: EditFunction.Clear;
    'q': EditFunction.Text:= EditFunction.Text + '^(1/2)';
    't': EditFunction.Text:= EditFunction.Text + '^(1/3)';
    '+','-','/','*','^','|','(',')': EditFunction.Text:= EditFunction.Text + key;
  end;

  key:= #0;

  EditFunction.SelStart:= Length(EditFunction.text);
end;

procedure TMainForm.EditMinXKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) then
    if ((key = '.') or (key = ',')) and (Pos(',',(Sender as TEdit).Text) = 0) and
       ((Length((Sender as TEdit).Text) > 1) and (Pos('-',(Sender as TEdit).Text) > 0) or
       (Length((Sender as TEdit).Text) > 0) and (Pos('-',(Sender as TEdit).Text) = 0))
    then
      Key:= ','
    else
      if (Key = '-') and (Pos('-',(Sender as TEdit).Text) = 0) then
        begin
          (Sender as TEdit).Text:= Key + (Sender as TEdit).Text;
          Key:= #0;
        end
      else
        if Key = #8 then
          Key:= #8
        else
          Key:= #0;
  (Sender as TEdit).SelStart:= Length((Sender as TEdit).Text);
end;

procedure TMainForm.ExCancelClick(Sender: TObject);
begin
  SettingsEx.Visible:= False;
  ChangeLenEx.Position:= LenEx;
end;

procedure TMainForm.ExOkClick(Sender: TObject);
begin
  LenEx:= 2*ChangeLenEx.Position;
  SettingsEx.Visible:= False;
end;

procedure TMainForm.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
var
  Coeff: Real;
begin
  if EditMinX.Enabled then
    begin
      ListMax.Clear;
      ListMin.Clear;
      ListMax.Visible:= False;
      ListMin.Visible:= False;

      Coeff:= Abs(StrToFloat(EditMaxX.Text) - StrToFloat(EditMinX.Text)) / 20;
      EditMinX.Text:= FloatToStr(StrToFloat(EditMinX.Text) - Coeff);
      EditMaxX.Text:= FloatToStr(StrToFloat(EditMaxX.Text) + Coeff);
      CallDraw;
    end;
end;

procedure TMainForm.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
var
  Coeff: Real;
begin
  if EditMinX.Enabled then
    begin
      ListMax.Clear;
      ListMin.Clear;
      ListMax.Visible:= False;
      ListMin.Visible:= False;

      Coeff:= Abs(StrToFloat(EditMaxX.Text) - StrToFloat(EditMinX.Text)) / 20;
      EditMinX.Text:= FloatToStr(StrToFloat(EditMinX.Text) + Coeff);
      EditMaxX.Text:= FloatToStr(StrToFloat(EditMaxX.Text) - Coeff);
      CallDraw;
    end;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  EditFunction.SetFocus;
  Application.CreateForm(TAbout, About);
  Application.CreateForm(TInstructions, Instructions);
end;

procedure TMainForm.FuncFieldMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  CurrentX.Caption:= '';
  CurrentY.Caption:= '';
end;

procedure TMainForm.GoAwayFuncFieldClick(Sender: TObject);
begin
  ListMax.Clear;
  ListMin.Clear;
  ListMax.Visible:= False;
  ListMin.Visible:= False;
  MainForm.FuncField.Width:= 0;
  MainForm.Splitter1.Left:= 0;
  BoxHistory.Left:= FuncField.Width - 427 - 367;
  if Length(EditFunction.Text) > 0 then
    CallDraw;
end;

procedure TMainForm.HistoryClick(Sender: TObject);
var
  i: Integer;
begin
  EditFunction.Font.Color:= ClBlack;
  i:= History.ItemIndex;
  if i >= 0 then
    EditFunction.Text:= Copy(History.Items[i], 8, Length(History.Items[i]) - 7);
end;

procedure TMainForm.InstructionClick(Sender: TObject);
begin
  Instructions.Show;
  Instructions.Left:= 700;
  Instructions.Top:= 300;
end;

procedure TMainForm.SetCloseClick(Sender: TObject);
begin
  Settings.Visible:= False;
  SetXY.Checked:= False;
  SetMin.Checked:= False;
  SetMax.Checked:= False;
  SetLine.Checked:= False;
  SetWinMaxMin.Checked:= False;
  SetFuncField.Checked:= False;
  SetWinDraw.Checked:= False;
end;

procedure TMainForm.SetLenExClick(Sender: TObject);
begin
  ChangeLenEx.Position:= LenEx div 2;
  SettingsEx.Left:= (DrawGraph.ClientWidth) - 400;
  SettingsEx.Top:= 33;
  SettingsEx.Visible:= True;
end;

procedure TMainForm.ListMaxClick(Sender: TObject);
var
  i: Integer;
begin
  i:= ListMax.ItemIndex;
  if i > 1 then
    begin
      i:= i - 2;
      i:= MaxEx[i];
      DrawEx(i,True);
    end;
end;

procedure TMainForm.ListMaxKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then ListMax.Visible:= False;
end;

procedure TMainForm.ListMaxMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  DownMax:= True;
  cx:= x;
  cy:= y;
end;

procedure TMainForm.ListMaxMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if DownMax then
    begin
      ListMax.Left:= ListMax.Left-cx+x;
      ListMax.Top:= ListMax.Top-cy+y;
    end;
end;

procedure TMainForm.ListMaxMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  DownMax:= False;
end;

procedure TMainForm.ListMinClick(Sender: TObject);
var
  i: Integer;
begin
  i:= ListMin.ItemIndex;
  if i > 1 then
    begin
      i:= i - 2;
      i:= MinEx[i];
      DrawEx(i,False);
    end;
end;

procedure TMainForm.ListMinKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then ListMin.Visible:= False;
end;

procedure TMainForm.ListMinMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  DownMin:= True;
  cx:= x;
  cy:= y;
end;

procedure TMainForm.ListMinMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if DownMin then
    begin
      ListMin.Left:= ListMin.Left-cx+x;
      ListMin.Top:= ListMin.Top-cy+y;
    end;
end;

procedure TMainForm.ListMinMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  DownMin:= False;
end;

procedure TMainForm.MenuChangeColorClick(Sender: TObject);
begin
  Settings.Visible:= True;
end;

procedure TMainForm.MenuExitClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.MenuHelpClick(Sender: TObject);
begin
  About.Show;
  About.Left:= 850;
  About.Top:= 400;
end;

procedure TMainForm.MenuSaveAsClick(Sender: TObject);
var
  Save: TSaveDialog;
begin
  Save:= TSaveDialog.Create(self);
  Save.Title := 'Сохранение';
  // Разрешаем сохранять файлы типа .txt и .doc
  Save.Filter := 'PNG|*.png|JPG|*.jpg|BMP|*.bmp';
  // Установка расширения по умолчанию
  Save.DefaultExt := 'png';
  Save.FilterIndex := 1;
  Save.Execute;
  if (Length(Save.FileName) <> 0) then
    begin
      DrawGraph.Picture.SaveToFile(Save.FileName);
      SaveFlag:= False;
      SavePhoto:= Save.FileName;
    end;
  Save.Free;
end;

procedure TMainForm.MenuSaveClick(Sender: TObject);
var
  Save: TSaveDialog;
begin
  if SaveFlag then
    begin
      Save:= TSaveDialog.Create(self);
      Save.Title := 'Сохранение';
      // Разрешаем сохранять файлы типа .txt и .doc
      Save.Filter := 'PNG|*.png|JPEG|*.jpg|BMP|*.bmp';
      // Установка расширения по умолчанию
      Save.DefaultExt := 'png';
      Save.FilterIndex := 1;
      Save.Execute;
      if (Length(Save.FileName) <> 0) then
        begin
          DrawGraph.Picture.SaveToFile(Save.FileName);
          SaveFlag:= False;
          SavePhoto:= Save.FileName;
        end;
      Save.Free;
    end
  else
    DrawGraph.Picture.SaveToFile(SavePhoto);
end;

procedure TMainForm.OffCoverGraphClick(Sender: TObject);
begin
  if ReSetY.Visible then
    begin
      EditMinY.Enabled:= True;
      EditMaxY.Enabled:= True;
      Label1.Enabled:= True;
      Label5.Enabled:= True;
      Label6.Enabled:= True;
      ReSetY.Enabled:= True;
    end
  else
    begin
      SetY.Visible:= True;
      SetY.Enabled:= True;
    end;
  OffCoverGraph.Enabled:= False;
  OffCoverGraph.Visible:= False;
  OnCoverGraph.Visible:= True;
  OnCoverGraph.Enabled:= True;
  Splitter1.Visible:= True;
  Label2.Enabled:= True;
  Label3.Enabled:= True;
  Label4.Enabled:= True;
  EditMinX.Enabled:= True;
  EditMaxX.Enabled:= True;
end;

procedure TMainForm.OffModeClick(Sender: TObject);
begin
  Mode:= False;
  OffMode.Visible:= False;
  OffMode.Enabled:= False;
  OnMode.Visible:= True;
  OnMode.Enabled:= True;
end;

procedure TMainForm.OnCoverGraphClick(Sender: TObject);
begin
  MainForm.DrawGraph.Canvas.Brush.Color:= ColorWinDraw;
  MainForm.DrawGraph.Canvas.FillRect(Rect(0, 0, MainForm.ClientWidth, MainForm.ClientHeight));
  if ReSetY.Visible then
    begin
      EditMinY.Enabled:= False;
      EditMaxY.Enabled:= False;
      Label1.Enabled:= False;
      Label5.Enabled:= False;
      Label6.Enabled:= False;
      ReSetY.Enabled:= False;
    end
  else
    begin
      SetY.Visible:= False;
      SetY.Enabled:= False;
    end;
  OnCoverGraph.Enabled:= False;
  OnCoverGraph.Visible:= False;
  OffCoverGraph.Enabled:= True;
  OffCoverGraph.Visible:= True;
  Splitter1.Visible:= False;
  Label2.Enabled:= False;
  Label3.Enabled:= False;
  Label4.Enabled:= False;
  EditMinX.Enabled:= False;
  EditMaxX.Enabled:= False;
end;

procedure TMainForm.OnModeClick(Sender: TObject);
begin
  Mode:= True;
  OffMode.Visible:= True;
  OffMode.Enabled:= True;
  OnMode.Visible:= False;
  OnMode.Enabled:= False;
end;

procedure TMainForm.ClearHistoryClick(Sender: TObject);
begin
  History.Clear;
end;

procedure TMainForm.ComeBackFuncFieldClick(Sender: TObject);
begin
  ListMax.Clear;
  ListMin.Clear;
  ListMax.Visible:= False;
  ListMin.Visible:= False;
  MainForm.FuncField.Width:= 427;
  MainForm.Splitter1.Left:= 427;
  if Splitter1.Left > 800 then
    begin
      Splitter1.Left:= 800;
      FuncField.Width:= 800;
    end;
  BoxHistory.Left:= FuncField.Width - 427 - 367;
  BoxHistory.Visible:= True;
  BoxHistory.Height:= MainForm.Height - 55;
  if Length(EditFunction.Text) > 0 then
    CallDraw;
end;

procedure TMainForm.DrawGraphMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if MenuSave.Enabled then
    begin
      CurrentX.Caption:= FloatToStr(X/mx + nx);
      CurrentY.Caption:= FloatToStr((DrawGraph.ClientHeight - Y - 3)/my + ny);
    end
  else
    begin
      CurrentX.Caption:= '';
      CurrentY.Caption:= '';
    end;
end;

procedure TMainForm.ReSetYClick(Sender: TObject);
begin
  SetY.Enabled:= True;
  SetY.Visible:= True;
  EditMinY.Enabled:= False;
  EditMaxY.Enabled:= False;
  Label1.Enabled:= False;
  Label5.Enabled:= False;
  Label6.Enabled:= False;
  ReSetY.Enabled:= False;
  ReSetY.Visible:= False;
end;

procedure TMainForm.RunGraphClick(Sender: TObject);
begin
  ListMax.Clear;
  ListMin.Clear;
  ListMax.Visible:= False;
  ListMin.Visible:= False;
  CallDraw;
end;

procedure TMainForm.SetApplyClick(Sender: TObject);
begin
  ColorLine:= NewColorLine;
  ColorMax:= NewColorMax;
  ColorMin:= NewColorMin;
  FuncField.Color:= NewColorFuncField;
  BoxHistory.Color:= NewColorFuncField;
  History.Color:= NewColorWinDraw;
  History.Font.Color:= NewColorLine;
  HistoryHead.Font.Color:= NewColorXY;
  ListMin.Color:= NewColorWinMaxMin;
  ListMax.Color:= NewColorWinMaxMin;
  ColorWinDraw:= NewColorWinDraw;
  ColorXY:= NewColorXY;
  Lbl1.Font.Color:= NewColorXY;
  Label1.Font.Color:= NewColorXY;
  Label2.Font.Color:= NewColorXY;
  Label3.Font.Color:= NewColorXY;
  Label4.Font.Color:= NewColorXY;
  Label5.Font.Color:= NewColorXY;
  Label6.Font.Color:= NewColorXY;
  CurrentPoint.Color:= NewColorWinDraw;
  CurrentX.Font.Color:= NewColorXY;
  CurrentY.Font.Color:= NewColorXY;
  LX.Font.Color:= NewColorXY;
  LY.Font.Color:= NewColorXY;
  //Зыкрыть
  Settings.Visible:= False;
  SetXY.Checked:= False;
  SetMin.Checked:= False;
  SetMax.Checked:= False;
  SetLine.Checked:= False;
  SetWinMaxMin.Checked:= False;
  SetFuncField.Checked:= False;
  SetWinDraw.Checked:= False;
end;

procedure TMainForm.SetChangeClick(Sender: TObject);
begin
  if SetLine.Checked or SetMax.Checked or SetMin.Checked or SetFuncField.Checked or SetWinMaxMin.Checked or SetWinDraw.Checked or SetXY.Checked then
    begin
      SetColor.Execute;
      if SetLine.Checked then NewColorLine:= SetColor.Color;
      if SetMax.Checked then NewColorMax:= SetColor.Color;
      if SetMin.Checked then NewColorMin:= SetColor.Color;
      if SetFuncField.Checked then NewColorFuncField:= SetColor.Color;
      if SetWinMaxMin.Checked then NewColorWinMaxMin:= SetColor.Color;
      if SetWinDraw.Checked then NewColorWinDraw:= SetColor.Color;
      if SetXY.Checked then NewColorXY:= SetColor.Color;
    end;
end;

procedure TMainForm.SettingsExMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  DownSetEx:= True;
  cx:= x;
  cy:= y;
end;

procedure TMainForm.SettingsExMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if DownSetEx then
    begin
      SettingsEx.Left:= SettingsEx.Left-cx+x;
      SettingsEx.Top:= SettingsEx.Top-cy+y;
    end;
end;

procedure TMainForm.SettingsExMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  DownSetEx:= False;
end;

procedure TMainForm.SettingsMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  DownSet:= True;
  cx:= x;
  cy:= y;
end;

procedure TMainForm.SettingsMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if DownSet then
    begin
      Settings.Left:= Settings.Left-cx+x;
      Settings.Top:= Settings.Top-cy+y;
    end;
end;

procedure TMainForm.SettingsMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  DownSet:= False;
end;

procedure TMainForm.SetYClick(Sender: TObject);
begin
  SetY.Enabled:= False;
  SetY.Visible:= False;
  EditMinY.Enabled:= True;
  EditMaxY.Enabled:= True;
  Label1.Enabled:= True;
  Label5.Enabled:= True;
  Label6.Enabled:= True;
  ReSetY.Enabled:= True;
  ReSetY.Visible:= True;
end;

procedure TMainForm.Splitter1Moved(Sender: TObject);
begin
  if FlagSplitter then
    begin
      ListMax.Clear;
      ListMin.Clear;
      ListMax.Visible:= False;
      ListMin.Visible:= False;
      if Splitter1.Left > 800 then
        begin
          Splitter1.Left:= 800;
          FuncField.Width:= 800;
        end;
      BoxHistory.Left:= FuncField.Width - 427 - 367;
      BoxHistory.Visible:= True;
      BoxHistory.Height:= MainForm.Height - 55;
      if Length(EditFunction.Text) > 0 then
        CallDraw;
      FlagSplitter:= False;
    end
  else
    FlagSplitter:= True;
end;

end.
