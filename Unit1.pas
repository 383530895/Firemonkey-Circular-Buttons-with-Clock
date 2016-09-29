// ==============================================================================
//
// ������ Firemonkey ���ΰ�ť��ʱ��
// ���ߣ� ������
//
// Description�� Firemonkey Circular Buttons with Clock
// Author�� Chang
//
// ==============================================================================
unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Forms;

type
  TForm3 = class(TForm)
    StyleBook1: TStyleBook;
    Panel1: TPanel;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses AnonymousEvent, System.Rtti, System.DateUtils, System.Math;

{$R *.fmx}

procedure TForm3.FormShow(Sender: TObject);
begin
  Timer1Timer(nil);

  // ���ð�ť����¼�
  // �˸���ť�ֱ�Ϊ: Green LightSeaGreen SteelBlue Purple DeepPink Yellow Orange OrangeRed
  Panel1.StylesData['SteelBlue.OnClick'] := TAnonymousEvent.CreateAsTValue(
    procedure(Sender: TObject)
    begin
      Application.Terminate;
    end);
end;

procedure TForm3.Timer1Timer(Sender: TObject);
begin
  // ʱ��
  with Panel1 do
  begin
    // ʱ��Ƕ�
    StylesData['Hour.RotationAngle'] := IfThen(HourOf(Now) > 12,
      HourOf(Now) - 12, HourOf(Now)) * 30;
    // ����Ƕ�
    StylesData['Minute.RotationAngle'] := MinuteOf(Now) * 6;
    // ����Ƕ�
    StylesData['Second.RotationAngle'] := SecondOf(Now) * 6;
  end;
end;

end.
