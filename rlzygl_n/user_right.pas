unit user_right;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Menus, Grids, DBGrids,
  DB, IBCustomDataSet, IBDatabase, IBQuery, IBTable, MemDS, IBC, DBAccess,
  DBCtrls, RzButton, RzRadChk, RzDBChk, RzTreeVw;

type
  Tfrm_user_right = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    RzCheckTree1: TRzCheckTree;
    Button1: TButton;
    Bevel1: TBevel;
    DBGrid1: TDBGrid;
    btn_int_right: TButton;
    btn_save_right: TButton;
    DataSource1: TDataSource;
    IBTransaction_user1: TIBCTransaction;
    ibqry_user: TIBCQuery;
    ibtbl_sys_right: TIBCTable;
    IBTransaction_sys_right: TIBCTransaction;
    ibtbl_sys_rightRIGHT_NAME: TStringField;
    ibtbl_sys_rightRIGHT_CAPTION: TStringField;
    ibtbl_sys_rightRIGHT_TAG: TIntegerField;
    IBQuery1: TIBCQuery;
    IBTransaction1: TIBCTransaction;
    ibqry_set_right: TIBCQuery;
    IBTransaction_set_right: TIBCTransaction;
    ibqry_userOPERATOR_NO: TIntegerField;
    ibqry_userOPERATOR_NAME: TStringField;
    ibqry_userOPERATOR_PASSWORD: TStringField;
    ibqry_userOPERATOR_LX: TIntegerField;
    ibqry_userIS_LOGIN: TBooleanField;
    RzDBCheckBox1: TRzDBCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure btn_int_rightClick(Sender: TObject);
    procedure btn_save_rightClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_user_right: Tfrm_user_right;
  OPERATOR_NO_S: string;
implementation
uses MainUnit;
{$R *.dfm}

procedure grayallparent(tnode: ttreenode); //检查子节点是否全选上
var
  i, chkcount, unchkcount: Integer;
  tmpnode: ttreenode;
begin
  if tnode.Level <> 0 then begin
    tmpnode := tnode.Parent;
    chkcount := 0;
    unchkcount := 0;
    for i := 0 to tmpnode.Count - 1 do begin
      if tmpnode.item[i].StateIndex = 2 then
        inc(chkcount)
      else
        if tmpnode.item[i].StateIndex = 1 then inc(unchkcount);
    end;

    //stateindex=1  unchecked   =2 checked  =3 grayed

    if chkcount = tmpnode.Count then
      tmpnode.StateIndex := 2 //all checked
    else
      if unchkcount = tmpnode.Count then
        tmpnode.StateIndex := 1 //all unchecked
      else
        tmpnode.StateIndex := 3; //some unchecked

    grayallparent(tnode.Parent);
  end;
end;

function MenuItemToTreeNode(MenuItem: TMenuItem; TreeView: TRzCheckTree; TreeNode: ttreenode): Boolean;
var
  i: Integer;
  mTreeNode: ttreenode;
begin
  result := False;
  mTreeNode := (nil);
  if (not Assigned(TreeView)) or (not Assigned(MenuItem)) then exit;
  try
    for i := 0 to Pred(MenuItem.Count) do
      if (MenuItem[i].Visible) then begin
        if (MenuItem[i].Caption = '-') then
          // mTreeNode := TreeView.Items.AddChildObject(TreeNode, '分隔符', MenuItem[i])
        else
          mTreeNode := TreeView.Items.AddChildObject(TreeNode, StripHotkey(MenuItem[i].Caption + '' + MenuItem[i].name), MenuItem[i]);
        mTreeNode.ImageIndex := MenuItem[i].ImageIndex;
        mTreeNode.SelectedIndex := MenuItem[i].ImageIndex;
        MenuItemToTreeNode(MenuItem[i], TreeView, mTreeNode);
        MenuItem.MenuIndex;
      end;
  except
    exit;
  end;
  result := True;
end;

procedure Tfrm_user_right.Button1Click(Sender: TObject);
begin
  if MenuItemToTreeNode(MainForm.MainMenu1.Items, RzCheckTree1, nil) then
    RzCheckTree1.FullExpand;
end;

procedure Tfrm_user_right.btn_int_rightClick(Sender: TObject);
var
  i, j: Integer;
  mynode: ttreenode;
begin
  RzCheckTree1.Items.Clear;
  //IBTransaction_sys_right.Active := False;
  //IBTransaction_sys_right.StartTransaction;
  ibtbl_sys_right.EmptyTable;
  ibtbl_sys_right.Open;
  with RzCheckTree1 do
    for i := 0 to MainForm.MainMenu1.Items.Count - 1 do begin
      mynode := Items.add(nil, StripHotkey(MainForm.MainMenu1.Items[i].Caption));
      for j := 0 to MainForm.MainMenu1.Items[i].Count - 1 do begin
        if MainForm.MainMenu1.Items[i].Items[j].Caption <> '-' then begin
          ibtbl_sys_right.Append;
          ibtbl_sys_rightRIGHT_NAME.AsString := MainForm.MainMenu1.Items[i].Items[j].name;
          ibtbl_sys_rightRIGHT_CAPTION.AsString := StripHotkey(MainForm.MainMenu1.Items[i].Items[j].Caption);
          ibtbl_sys_rightRIGHT_TAG.AsInteger := MainForm.MainMenu1.Items[i].Items[j].Tag;
          ibtbl_sys_right.Post;
          Items.AddChild(mynode, StripHotkey(MainForm.MainMenu1.Items[i].Items[j].Caption));
        end;
      end;
    end;
  RzCheckTree1.FullExpand;
  Application.MessageBox('操作成功', '初始化菜单',
    MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);
  IBTransaction_sys_right.Commit;
  ibtbl_sys_right.Close;
end;

procedure Tfrm_user_right.btn_save_rightClick(Sender: TObject);
var
  i: Integer;

begin
  if RzDBCheckBox1.Checked then
  begin
    with ibqry_set_right do begin
      sql.Clear;
      sql.Add('update OPERATOR_XX set IS_LOGIN=true where OPERATOR_NO=' + quotedstr(ibqry_userOPERATOR_NO.AsString));
      ExecSQL;
    end;
  end
  else
  begin
    with ibqry_set_right do begin
      sql.Clear;
      sql.Add('update OPERATOR_XX set IS_LOGIN=false where OPERATOR_NO=' + quotedstr(ibqry_userOPERATOR_NO.AsString));
      ExecSQL;
    end;
  end;

  with ibqry_set_right do begin
    sql.Clear;
    sql.add('delete from user_right where user_id=:User_id');
    ParamByName('user_id').AsString := ibqry_userOPERATOR_NO.AsString;
    ExecSQL;
   // IBTransaction_set_right.Commit;
  end;
  ibtbl_sys_right.Open;
  ibtbl_sys_right.First;
  for i := 0 to RzCheckTree1.Items.Count - 1 do
    if (RzCheckTree1.Items[i].StateIndex = 2) then begin
      if RzCheckTree1.Items.item[i].Text <> '权限设置' then //超级用户可给其它用户增加权限
      begin
        with ibqry_set_right do begin
          sql.Clear;
          sql.add('insert into user_right ');
          sql.add('select :user_id ,RIGHT_NAME from system_right where right_caption=' + quotedstr(RzCheckTree1.Items.item[i].Text));
          ParamByName('USER_ID').AsInteger := strtoint(ibqry_userOPERATOR_no.AsString);
        //ParamByName('right_caption').Value := RzCheckTree1.Items.item[i].Text;
          ExecSQL;
         // IBTransaction_set_right.Commit;
        end;
      end;
    end;
  ibqry_user.Locate('OPERATOR_NO',OPERATOR_NO_S,[]);

  Application.MessageBox('操作成功', '权限设定',
    MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

end;

procedure Tfrm_user_right.FormCreate(Sender: TObject);
var
  i, j: Integer;
  mynode: ttreenode;
begin
  ibqry_user.Close;
  ibqry_user.Open;
  //ibqry_user.Last;
  RzCheckTree1.Items.Clear;
 // IBTransaction_sys_right.StartTransaction;
  ibtbl_sys_right.EmptyTable;
  ibtbl_sys_right.Open;
  with RzCheckTree1 do
    for i := 0 to MainForm.MainMenu1.Items.Count - 1 do begin
      mynode := Items.add(nil, StripHotkey(MainForm.MainMenu1.Items[i].Caption));
      for j := 0 to MainForm.MainMenu1.Items[i].Count - 1 do begin
        if MainForm.MainMenu1.Items[i].Items[j].Caption <> '-' then begin
          ibtbl_sys_right.Append;
          ibtbl_sys_rightRIGHT_NAME.AsString := MainForm.MainMenu1.Items[i].Items[j].name;
          ibtbl_sys_rightRIGHT_CAPTION.AsString := StripHotkey(MainForm.MainMenu1.Items[i].Items[j].Caption);
          ibtbl_sys_rightRIGHT_TAG.AsInteger := MainForm.MainMenu1.Items[i].Items[j].Tag;
          ibtbl_sys_right.Post;
          Items.AddChild(mynode, StripHotkey(MainForm.MainMenu1.Items[i].Items[j].Caption));
        end;
      end;
    end;
  RzCheckTree1.FullExpand;
  IBTransaction_sys_right.Commit;
  ibtbl_sys_right.Close;
  DBGrid1CellClick(DBGRID1.Columns.Items[0]);
end;

procedure Tfrm_user_right.DBGrid1CellClick(Column: TColumn);
var
  i: Integer;
begin
  for i := 0 to RzCheckTree1.Items.Count - 1 do {//清除已选择项}  begin
    RzCheckTree1.Items.item[i].StateIndex := 1;
  end;
  with IBQuery1 do begin
    sql.Clear;
    sql.add('select a.USER_ID,a.user_right, b.RIGHT_CAPTION ');
    sql.add(' from user_right a,system_right b where a.user_right=b.RIGHT_NAME and user_id=:user_id');
    ParamByName('user_id').AsInteger := strtoint(ibqry_userOPERATOR_no.AsString);
    Open;
    IBQuery1.First;
  end;
  while not IBQuery1.Eof do {//按有的权限选上项目}  begin
    for i := 0 to RzCheckTree1.Items.Count - 1 do begin
      if Trim(RzCheckTree1.Items.item[i].Text) = Trim(IBQuery1.Fields[2].AsString) then begin
        RzCheckTree1.Items.item[i].StateIndex := 2;
        grayallparent(RzCheckTree1.Items[i]);
      end;
    end;
    IBQuery1.Next;
  end;
  OPERATOR_NO_S := ibqry_userOPERATOR_NO.AsString;
end;

procedure Tfrm_user_right.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ibtbl_sys_right.Close;
  ibqry_user.Close;
  IBQuery1.Close;
  ibqry_set_right.Close;
  Action := caFree;
  frm_user_right := nil;
end;

end.

