{-----------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/MPL-1.1.html

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either expressed or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: JvBaseDBPasswordDialog.pas, released on 2006-07-21

The Initial Developer of the Original Code is Jens Fudickar
All Rights Reserved.

Contributor(s):

You may retrieve the latest version of this file at the Project JEDI's JVCL home page,
located at http://jvcl.sourceforge.net

Known Issues:
-----------------------------------------------------------------------------}
// $Id$

unit JvBaseDBPasswordDialog;

{$I jvcl.inc}

interface

uses
{$IFDEF UNITVERSIONING}
  JclUnitVersioning,
{$ENDIF UNITVERSIONING}
  JvDynControlEngine,
  Classes, JvBaseDlg, JvAppStorage, Forms, Controls,
  JvPropertyStore, Menus, JvBaseDBDialog, JvDynControlEngineIntf;

type
  TJvPasswordDialogModifyPasswordEvent = procedure(var Password: string) of object;

  TJvBaseDBPasswordDialogOptions = class(TPersistent)
  private
    FAllowedPasswordCharacters: string;
    FCheckOldPassword: Boolean;
    FMinPasswordLength: Integer;
  public
    constructor Create; virtual;
    procedure Assign(Source: TPersistent); override;
  published
    property AllowedPasswordCharacters: string read FAllowedPasswordCharacters
      write FAllowedPasswordCharacters;
    property CheckOldPassword: Boolean read FCheckOldPassword write
      FCheckOldPassword default True;
    property MinPasswordLength: Integer read FMinPasswordLength write
      FMinPasswordLength default 4;
  end;

  TJvBaseDBPasswordDialog = class(TJvBaseDBDialog)
  private
    ButtonPanel: TWinControl;
    CancelBtn: TWinControl;
    ChangeBtn: TWinControl;
    FAfterTransferPasswordFromSession: TJvPasswordDialogModifyPasswordEvent;
    FBeforeTransferPasswordToSession: TJvPasswordDialogModifyPasswordEvent;
    FOptions: TJvBaseDBPasswordDialogOptions;
    INewPasswordEditData: IJvDynControlData;
    INewPasswordRetypeEditData: IJvDynControlData;
    IOldPasswordEditData: IJvDynControlData;
    NewPasswordEdit: TWinControl;
    NewPasswordRetypeEdit: TWinControl;
    OldPasswordEdit: TWinControl;
    procedure CancelBtnClick(Sender: TObject);
    procedure ChangeBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    function GetNewPassword: string;
    function GetNewPasswordRetype: string;
    function GetOldPassword: string;
    procedure ResizeFormControls;
    procedure SetOptions(const Value: TJvBaseDBPasswordDialogOptions);
  protected
    function ChangePasswordInSession(NewPassword: string): Boolean; virtual;
    function CheckAllowedCharacters(const NewPassword: string): Boolean;
    procedure ClearControlInterfaceObjects; virtual;
    procedure CreateFormControls(aForm: TForm); override;
    function GetPasswordFromSession: string; virtual;
    property NewPassword: string read GetNewPassword;
    property NewPasswordRetype: string read GetNewPasswordRetype;
    property OldPassword: string read GetOldPassword;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ChangePassword: Boolean;
  published
    property Options: TJvBaseDBPasswordDialogOptions read FOptions write SetOptions;
    property AfterTransferPasswordFromSession: TJvPasswordDialogModifyPasswordEvent
      read FAfterTransferPasswordFromSession write
      FAfterTransferPasswordFromSession;
    property BeforeTransferPasswordToSession: TJvPasswordDialogModifyPasswordEvent
      read FBeforeTransferPasswordToSession write
      FBeforeTransferPasswordToSession;
  end;

{$IFDEF UNITVERSIONING}
const
  UnitVersioning: TUnitVersionInfo = (
    RCSfile: '$URL$';
    Revision: '$Revision$';
    Date: '$Date$';
    LogPath: 'JVCL\run'
    );
{$ENDIF UNITVERSIONING}

implementation

uses Sysutils,  
  {$IFDEF HAS_UNIT_TYPES}
  Types,
  {$ENDIF HAS_UNIT_TYPES}
  ExtCtrls, ComCtrls, StdCtrls, JvResources, JvdsADialogs,
  Dialogs;


constructor TJvBaseDBPasswordDialog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FOptions := TJvBaseDBPasswordDialogOptions.Create();
end;

destructor TJvBaseDBPasswordDialog.Destroy;
begin
  FreeAndNil(FOptions);
  inherited Destroy;
end;

procedure TJvBaseDBPasswordDialog.CancelBtnClick(Sender: TObject);
begin
  DBDialog.ModalResult := mrCancel;
end;

procedure TJvBaseDBPasswordDialog.ChangeBtnClick(Sender: TObject);
begin
  if not ChangeBtn.Enabled then
    Exit;
  if not ChangePassword then
    DBDialog.ModalResult := mrNone
  else
    DBDialog.ModalResult := mrOk;
end;

function TJvBaseDBPasswordDialog.ChangePassword: Boolean;
var
  SessionPassword: string;
begin
  Result := False;
  try
    if Options.CheckOldPassword then
    begin
      SessionPassword := GetPasswordFromSession;
      if Assigned(AfterTransferPasswordFromSession) then
        AfterTransferPasswordFromSession(SessionPassword);
      if not (OldPassword = SessionPassword) then
      begin
        JVDsaDialogs.MessageDlg(RsOldPasswordsMismatch, mtError, [mbok], 0, dckScreen,
          0, mbDefault, mbDefault, mbDefault, DynControlEngine);
        exit;
      end;
    end;
    if not (NewPassword = NewPasswordRetype) then
    begin
      JVDsaDialogs.MessageDlg(RsPasswordsMismatch, mtError, [mbok], 0, dckScreen,
        0, mbDefault, mbDefault, mbDefault, DynControlEngine);
      Exit;
    end;
    if (Length(NewPassword) < Options.MinPasswordLength) then
    begin
      JVDsaDialogs.MessageDlg(Format(RsPasswordLengthToShort, [Options.MinPasswordLength]), mtError, [mbok], 0,
        dckScreen,
        0, mbDefault, mbDefault, mbDefault, DynControlEngine);
      exit;
    end;
    if not CheckAllowedCharacters(NewPassword) then
    begin
      JVDsaDialogs.MessageDlg(Format(RsPasswordNotAllowedCharacters, [Options.MinPasswordLength]), mtError, [mbok], 0,
        dckScreen,
        0, mbDefault, mbDefault, mbDefault, DynControlEngine);
      exit;
    end;

    if Assigned(BeforeTransferPasswordToSession) then
      BeforeTransferPasswordToSession(SessionPassword);
    Result := ChangePasswordInSession(NewPassword);
    if Result then
      JVDsaDialogs.MessageDlg(RsPasswordChanged, mtInformation, [mbOK], 0, dckScreen,
        0, mbDefault, mbDefault, mbDefault, DynControlEngine)
    else
      JVDsaDialogs.MessageDlg(RsPasswordNotChanged, mtInformation, [mbOK], 0, dckScreen,
        0, mbDefault, mbDefault, mbDefault, DynControlEngine);
  except
    on E: Exception do
      JVDsaDialogs.MessageDlg(E.Message, mtError, [mbOK], 0, dckScreen,
        0, mbDefault, mbDefault, mbDefault, DynControlEngine);
  end;
end;

function TJvBaseDBPasswordDialog.ChangePasswordInSession(NewPassword: string):
  Boolean;
begin
  Result := False;
end;

function TJvBaseDBPasswordDialog.CheckAllowedCharacters(const NewPassword:
  string): Boolean;
var
  I: Integer;
begin
  if Options.AllowedPasswordCharacters <> '' then
  begin
    Result := False;
    for I := 1 to Length(NewPassword) - 1 do
      if Pos(NewPassword[i], Options.AllowedPasswordCharacters) <= 0 then
        Exit;
  end;
  Result := True;
end;

procedure TJvBaseDBPasswordDialog.ClearControlInterfaceObjects;
begin
  INewPasswordEditData := nil;
  INewPasswordRetypeEditData := nil;
  IOldPasswordEditData := nil;
end;

procedure TJvBaseDBPasswordDialog.CreateFormControls(aForm: TForm);
var
  MainPanel: TWinControl;
  LabelControl: TControl;
  IDynControlLabel: IJvDynControlLabel;
  IDynControlBevelBorder: IJvDynControlBevelBorder;
  IDynControlEdit: IJvDynControlEdit;
begin

  with aForm do
  begin
    Name := 'DBChangePasswordDialog';
    Left := 472;
    Top := 229;
    BorderIcons := [biSystemMenu, biMinimize, biMaximize, biHelp];
    BorderStyle := bsDialog;
    Caption := RsChangePassword;
    ClientHeight := 415;
    ClientWidth := 317;
    Position := poScreenCenter;
    OnClose := FormClose;
    OnShow := FormShow;
  end;

  ButtonPanel := DynControlEngine.CreatePanelControl(aForm, aForm, 'ButtonPanel', '', alBottom);
  ChangeBtn := DynControlEngine.CreateButton(AForm, ButtonPanel, 'ChangeBtn',
    RsChangeButtonCaption, '', ChangeBtnClick, True, False);
  with ChangeBtn do
  begin
    Left := 60;
    Top := 4;
    Width := 90;
    Height := 25;
  end;
  CancelBtn := DynControlEngine.CreateButton(AForm, ButtonPanel, 'CancelBtn',
    RsButtonCancelCaption, '', CancelBtnClick, False, True);
  with CancelBtn do
  begin
    Left := 460;
    Top := 4;
    Width := 90;
    Height := 25;
  end;

  ButtonPanel.Height := CancelBtn.Height + 8;

  MainPanel := DynControlEngine.CreatePanelControl(aForm, aForm, 'MainPanel', '', alClient);
  with MainPanel do
  begin
    TabOrder := 0;
    if Supports(MainPanel, IJvDynControlBevelBorder, IDynControlBevelBorder) then
      IDynControlBevelBorder.ControlSetBorderWidth(5);
    if Supports(MainPanel, IJvDynControlBevelBorder, IDynControlBevelBorder) then
      IDynControlBevelBorder.ControlSetBevelOuter(bvNone);
  end;

  if Options.CheckOldPassword then
  begin
    LabelControl := DynControlEngine.CreateLabelControl(aForm, MainPanel, 'OldPasswortLabel', RsOldPasswordLabel, nil);
    with LabelControl do
      Align := alTop;
    OldPasswordEdit := DynControlEngine.CreateEditControl(aForm, MainPanel, 'OldPasswortEdit');
    with OldPasswordEdit do
    begin
      Align := alTop;
      TabOrder := 0;
      Supports(OldPasswordEdit, IJvDynControlData, IOldPasswordEditData);
      IOldPasswordEditData.ControlValue := '';
      if Supports(OldPasswordEdit, IJvDynControlEdit, IDynControlEdit) then
        IDynControlEdit.ControlSetPasswordChar('*');
    end;
    if Supports(LabelControl, IJvDynControlLabel, IDynControlLabel) then
      IDynControlLabel.ControlSetFocusControl(OldPasswordEdit);
  end;
  LabelControl := DynControlEngine.CreateLabelControl(aForm, MainPanel, 'NewPasswortLabel', RsNewPasswordLabel, nil);
  with LabelControl do
    Align := alTop;
  NewPasswordEdit := DynControlEngine.CreateEditControl(aForm, MainPanel, 'NewPasswortEdit');
  with NewPasswordEdit do
  begin
    Align := alTop;
    TabOrder := 1;
    Supports(NewPasswordEdit, IJvDynControlData, INewPasswordEditData);
    INewPasswordEditData.ControlValue := '';
    if Supports(NewPasswordEdit, IJvDynControlEdit, IDynControlEdit) then
      IDynControlEdit.ControlSetPasswordChar('*');
  end;
  if Supports(LabelControl, IJvDynControlLabel, IDynControlLabel) then
    IDynControlLabel.ControlSetFocusControl(NewPasswordEdit);
  LabelControl := DynControlEngine.CreateLabelControl(aForm, MainPanel, 'NewPasswortLabelRetype',
    RsConfirmPasswordLabel, nil);
  with LabelControl do
    Align := alTop;
  NewPasswordRetypeEdit := DynControlEngine.CreateEditControl(aForm, MainPanel, 'NewPasswortRetypeEdit');
  with NewPasswordRetypeEdit do
  begin
    Align := alTop;
    TabOrder := 2;
    Supports(NewPasswordRetypeEdit, IJvDynControlData, INewPasswordRetypeEditData);
    INewPasswordRetypeEditData.ControlValue := '';
    if Supports(INewPasswordRetypeEditData, IJvDynControlEdit, IDynControlEdit) then
      IDynControlEdit.ControlSetPasswordChar('*');
  end;
  if Supports(LabelControl, IJvDynControlLabel, IDynControlLabel) then
    IDynControlLabel.ControlSetFocusControl(NewPasswordRetypeEdit);
end;

procedure TJvBaseDBPasswordDialog.FormClose(Sender: TObject; var Action:
  TCloseAction);
begin
  ClearControlInterfaceObjects;
  Action := caFree;
end;

procedure TJvBaseDBPasswordDialog.FormShow(Sender: TObject);
begin
  ResizeFormControls;
end;

function TJvBaseDBPasswordDialog.GetNewPassword: string;
begin
  Result := INewPasswordEditData.ControlValue;
end;

function TJvBaseDBPasswordDialog.GetNewPasswordRetype: string;
begin
  Result := INewPasswordRetypeEditData.ControlValue;
end;

function TJvBaseDBPasswordDialog.GetOldPassword: string;
begin
  if assigned(IOldPasswordEditData) then
    Result := IOldPasswordEditData.ControlValue
  else
    Result := '';
end;

function TJvBaseDBPasswordDialog.GetPasswordFromSession: string;
begin
  Result := '';
end;

procedure TJvBaseDBPasswordDialog.ResizeFormControls;
begin
  if Assigned(DBDialog) then
  begin
    CancelBtn.Left := DBDialog.ClientWidth - CancelBtn.Width - 5;
    ChangeBtn.Left := CancelBtn.Left - ChangeBtn.Width - 5;
    DBDialog.ClientHeight := NewPasswordRetypeEdit.Top + NewPasswordRetypeEdit.Height + 2 + ButtonPanel.Height;
  end;
end;

procedure TJvBaseDBPasswordDialog.SetOptions(const Value:
  TJvBaseDBPasswordDialogOptions);
begin
  FOptions.Assign(Value);
end;

constructor TJvBaseDBPasswordDialogOptions.Create;
begin
  inherited Create;
  FCheckOldPassword := True;
  FMinPasswordLength := 4;
  FAllowedPasswordCharacters := 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890_#$';
end;

procedure TJvBaseDBPasswordDialogOptions.Assign(Source: TPersistent);
begin
  if Source is TJvBaseDBPasswordDialogOptions then
  begin
    CheckOldPassword := TJvBaseDBPasswordDialogOptions(Source).CheckOldPassword;
    MinPasswordLength := TJvBaseDBPasswordDialogOptions(Source).MinPasswordLength;
    AllowedPasswordCharacters := TJvBaseDBPasswordDialogOptions(Source).AllowedPasswordCharacters;
  end
  else
    inherited Assign(Source);
end;

{$IFDEF UNITVERSIONING}
initialization
  RegisterUnitVersion(HInstance, UnitVersioning);

finalization
  UnregisterUnitVersion(HInstance);
{$ENDIF UNITVERSIONING}

end.

