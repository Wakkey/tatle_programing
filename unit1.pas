unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, SynMemo, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ListBox10: TListBox;
    ListBox11: TListBox;
    ListBox12: TListBox;
    ListBox13: TListBox;
    ListBox14: TListBox;
    ListBox15: TListBox;
    ListBox7: TListBox;
    ListBox8: TListBox;
    ListBox9: TListBox;
    Memo1: TMemo;
    PaintBox1: TPaintBox;
    SynMemo1: TSynMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListBox10Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure ListBox7Click(Sender: TObject);
    procedure ListBox7DblClick(Sender: TObject);
    procedure ListBox8DblClick(Sender: TObject);

  private
    { private declarations }
    t1,t2,t3,t4,t5:Tstringlist;
    function run(st,st1,st2,st3:TStringList;sw:boolean):boolean;
    function run_var(s:string;st,st2,st3,list_int,list_str,List_bool,index_int,index_str,index_bool:TStringList):string;
    function use_var(s:string;list1,list2:Tlistbox;st,st2,st3,list_int,list_str,list_bool:TStringList):string;
    function use_if(s:string;list1,list2,list3,list4:TListBox;st,st2,st3,list_int,list_str,list_bool:TStringList):boolean;
    function findcommand(s1,s2,st,st2,st3,list_int,list_str,list_bool:TStringList;sw:boolean):string;
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
function replace_space(st:TStringList):boolean;
  var
    i,i1:integer;
    sw,sw1:boolean;
 //   setchar:string;
    st1:TStringList;
  begin
//    setchar := 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz[]#$,.@1234567890{}-=~|\%+:*/!?\<>()';
    sw := true;
    st.Text := StringReplace(st.Text,'　',' ',[rfReplaceAll]);
    st.Text := StringReplace(st.Text,' ',char(13),[rfReplaceAll]);

    st1 := TStringList.Create;
    st1.Clear;
    for i := 0 to st.Count -1 do begin
      i1 := ansipos(';',st[i]);
    //if 0 < i1 then begin
      st[i] := StringReplace(st[i],';',' ',[rfReplaceAll]);
      //showmessage(st[i]);
      if length(st[i]) > 0 then begin
        st1.Add(st[i]);
        if i1 > 0 then
          st1.Add(';');
      end;

   // end;
    end;
    i := st1.Count -1;
    while i >= 0 do begin
      if st1[i] = ' ' then begin
        st1.Delete(i);
      end;
      dec(i)
    end;
    st.Text:= st1.Text;
end;

function ruthin0(s,s1,s2:string):string;
begin
  s := StringReplace(s,'　',' ',[rfReplaceAll]);
  s := StringReplace(s,s1,s2,[rfReplaceAll]);
  ruthin0 := StringReplace(s,' ',char(13),[rfReplaceAll]);
end;

function ruthin1:boolean;
var
  i:integer;
  h,j,k:TstringList;
  s,s0,s1,x:string;
  st0,st1,st2,st3:TStringList;
  sw,sw1,sw2,sw3:boolean;
  sw_number:boolean;
  function subruthin1(count:integer;x:String):boolean;
  var
    number,Str,chara,find_char:string;
    i,i1,i2,chek_spqace:integer;

    function set_words(s:string;st1,st2,st3:TStringList):boolean;
    var
      s1,s2,s3,setchar,setcara,setnumber:string;
      i,i1,i2:integer;
      setcommand:TStringList;
    function set_st(s:string;st:TStringList;sw:boolean):boolean;
    begin
      if sw then begin
        if st.Count > 0 then begin
          if st[st.Count -1] <> '' then begin
            st.Text:= st.Text + char(13);
          end;
        end;
        sw := false;
      end else if st.Count > 0 then begin
        st[st.Count-1]:= st[st.Count-1] + s;
      end else begin
        st.Add(s);
      end;
    end;
  begin
    setcommand := TStringList.create;
    setcommand.Add('newpath');
    setcommand.Add('moveto');
    setcommand.Add('lineto');
    setcommand.Add('ellipse');
    setcommand.Add('rect');
    setcommand.Add('stroke');

    setnumber := '1234567890';
    setcara := ',;';
    //showmessage(s1);
   // for i1 := 0 to length(setnumber) do begin


     for i1 := 0 to length(setnumber) do begin
       for i2 := 0 to length(setchar) do begin
         if s = setchar[i2] then begin
           sw_number := true;
         end else begin
           if (s = ' ') then begin
            sw2:=true;
           end;
           //number
           if not sw_number then begin
             if s = setnumber[i1] then begin
               s2 := s;
             end;
           end;
         end;

         if (s = ' ') or  ((not sw_number) and (s = setnumber[i1])) then  begin
           sw_number := false;
         end;
       end;
     end;


    for i1 := 0 to length(setcara) do begin
      if s = ' ' then begin
        sw3:=true;
      end;
      if (setcara[i1] = s) then begin
      //cara
        if length(s) > 0 then
          s3 := s3 + s;
      end;
    end;
    if st3.count > 0 then begin
      if length(st3[st3.Count -1]) >= 1 then begin
        sw := false;
        for i1 := 0 to length(setcara) do begin
          if 0 = ansipos(setcara[i1],st3[st3.Count -1]) then
            sw := true;
        end;
        if not sw then begin
           if length(s) > 0 then
             // s3 := s;
        end;
      end;
    end;
    set_st(s1,st1,sw1);
    sw1 := false;
    set_st(s2,st2,sw2);
    sw2 := false;
    set_st(s3,st3,sw3);
    sw3 := false;
  end;
  begin
    set_words(x,st1,st2,st3);
  end;
begin
  s := form1.SynMemo1.Text;
  sw1 := false;
  sw2 := false;
  sw3 := false;
  st0 := TStringList.Create;
  st0.Clear;
  st1 := TStringList.Create;
  st1.Clear;
  st2 := TStringList.Create;
  st2.Clear;
  st3 := TStringList.Create;
  st3.Clear;
  sw_number := false;
  for i := 1 to length(s) do begin;
    subruthin1(i,s[i]);
  end;

  st1.Free;
  st2.Free;
  st3.Free;
end;

function ruthin2(s,s1:TStringList):boolean;
var
  i,i1:integer;
  s2,s3:string;
  st,setcommand,getcommand,setnum,getnum,setcara,getcara,setvar,getvar:TStringList;
  sw2,sw_number:boolean;

  function get_var(x,x1:String;st1,st2:TStringList):string;
  var
    i,i1,i2,i3,i4:integer;
    s:string;
  begin
    try
      for i1 := 0 to st1.Count -1 do begin;
        i2 := ansipos(st1[i1],x);
        s := '';

        if (i2 > 0) and (i2 < 2) then begin
          //showmessage(st1[i1]);
          //if (length(x) >= length(st[i1]))  then begin
            for i4 := 0 to length(x) - i2 do begin
              s := S + ' ';
            end;
            for i3 := 0 to length(x)do begin
              s[i2 + i3] := x[i2 + i3 ];
            end;
            //showmessage(inttostr(length(s)));
            if (st1.IndexOf(s) > -1) then begin
              st2.Add(x1);
              get_var := x1;
            end;
          //end;
        end;
      end;
      except
        showmessage(inttostr(st2.Count));
        showmessage(st2.Text);
        showmessage(s + '_' + x);
    end;
    replace_space(st2);
  end;
  function get_ruthin(x:String;st1,st2:TStringList):boolean;
  var
    i,i1,i2,i3,i4:integer;
    s:string;
  begin
    try
      for i1 := 0 to st1.Count -1 do begin;
        i2 := ansipos(st1[i1],x);
        s := '';

        if (i2 > 0) and (i2 < 2) then begin
          //showmessage(st1[i1]);
          //if (length(x) >= length(st[i1]))  then begin
            for i4 := 0 to length(x) - i2 do begin
              s := S + ' ';
            end;
            for i3 := 0 to length(x)do begin
              s[i2 + i3] := x[i2 + i3 ];
            end;
            //showmessage(inttostr(length(s)));
            if st1.IndexOf(s) > -1 then begin
              st2.Add(s);
            end;
          //end;
        end;
      end;
      except
        showmessage(inttostr(st2.Count));
        showmessage(st2.Text);
        showmessage(s + '_' + x);
    end;
    replace_space(st2);
  end;

  function get_num(s:string;setchar:TStringList):string;
  var
    i1,i2:integer;
    s3:string;
  begin
    for i1 := 0 to setchar.Count-1 do begin
      if (sw2) or (0 < ansipos(s,setchar[0])) or (0 < ansipos(s,setchar[1]))
        or ('t' = s ) or ('f' = s ) then begin
        sw2 := true;
        for i2 := 1 to length(setchar[i1]) do begin
          {if s = setchar[i2] then begin
            sw_number := true;
          end else }begin
            {if (s = ' ') then begin
              sw2:=true;
            end;}
            //number
            //if not sw_number then begin
               s3 := setchar[i1][i2];
               if (s = s3) then begin
                get_num := s;
              end;
            end;
          end;
        end;
        {if (s = ' ') or  ((not sw_number) and (s = setchar[i1])) then  begin
          sw_number := false;
        end;}
      end;
    //end;
  end;

begin
  setcommand := TStringList.create;
  setcommand.Text:= s1.Text;
  getcommand := TStringList.create;
  getcommand.Clear;
  //ここを引数化しておく
  {setcommand.Add('newedit');
  setcommand.Add('newpaint');
  setcommand.Add('moveto');
  setcommand.Add('lineto');
  setcommand.Add('ellipse');
  setcommand.Add('rect');
  setcommand.Add('stroke');
  }
  setnum:=TStringList.Create;
  setnum.Clear;
  getnum:=TStringList.Create;
  getnum.Clear;

  setvar:=TStringList.Create;
  setvar.Clear;
  getvar:=TStringList.Create;
  getvar.Clear;
  {for i := 0 to 9 do begin
    setnum.Add(inttostr(i));
  end;}

  setnum.Add('''"');
  setnum.Add('1234567890');
  setnum.Add('abcdefghijklmnopqrstuvwxyz');

  setcara:=TStringList.Create;
  setcara.Clear;
  getcara:=TStringList.Create;
  getcara.Clear;
  setcara.Add(',');
  setcara.Add(';');
  setcara.Add('+');
  setcara.Add('-');
  setcara.Add('/');
  setcara.Add('*');
  setcara.Add('=');
  setcara.Add(':');
  setcara.Add('<');
  setcara.Add('>');
  setcara.Add('!');
  setcara.Add('(');
  setcara.Add(')');

  setvar.Add('int');
  setvar.Add('str');
  setvar.Add('bool');

  st:=TStringList.Create;
  st.Text:= s.Text;
  for i := 0 to setcara.Count -1 do begin
    st.Text := ruthin0(st.Text,setcara[i],char(13)+ setcara[i]+char(13));
  end;
  for i := 0 to st.Count -1 do begin
    get_ruthin(st[i],setcommand,getcommand);
    if i < st.Count -1 then begin
      getcommand.Add(get_var(st[i],st[i+1],setvar,getvar));
      //getcommand.Add(st[i+1]);
    end;
  end;


  sw2 := false;
  sw_number := false;
   for i := 0 to st.Count -1 do begin
     s3 := '';
     sw2 := false;
     for i1 := 1 to length(st[i])  do begin
       s2 := get_num(st[i][i1],setnum);
       s3 := s3 + s2;
     end;
     //showmessage(inttostr(length(s3)));


     if length(s3) > 0 then
     if (0 < ansipos(s3[1],'123457890')) or (s3[1] = '''' ) or (s3[1] = '"' ) or (s3 = 'true') or (s3 = 'false') then begin
       getnum.Add(s3);
     end;
    //get_ruthin(st[i],setnum,getnum);
  end;
  replace_space(getnum);
  for i := 0 to st.Count -1 do begin
    get_ruthin(st[i],setcara,getcara);
  end;
    i := getcara.Count -1;
    while i >= 0 do begin
      if getcara[i] = ' ' then begin
        getcara.Delete(i);
      end;
      dec(i)
    end;
  form1.ListBox8.Items.Text:= getcommand.Text;
  form1.ListBox9.Items.Text:= getnum.Text;
  form1.ListBox10.Items.Text:= getcara.Text;
  form1.ListBox11.Items.Text:= getvar.Text;
  s.Text := st.Text;
end;

function ruthin3(L1,L2:TStringList):boolean;
var
  i,i1:integer;
begin
  for i := 0 to l2.Count -1 do begin
    i1 := l1.IndexOf(l2[i]);
    if i1 > -1 then begin
      l1.Delete(i1);
    end;
  end;
end;

function ruthin4(st1,st2,st3,st4,st5,st6,st7,st8:TStringList;s1,s2,s3,s4,s5,s6,s7:string):boolean;
var
  s:string;
  i:integer;
  st:TStringList;
  function subruthin1(st1,st2,st3:TStringList;s:string):boolean;
  var
    i,i1:integer;
  begin
    if st1.Count > 0 then
    for i := 0 to st1.Count -1 do begin
      i1 := st2.IndexOf(st1[i]);
      if i1 > -1 then begin
        st3[i] := s + ' no.' + inttostr(i1);
      end;
    end;
  end;
begin
  for i := 0 to 7 do begin
    case i of
      0:begin
        st := st2;
        s := s1;
      end;
      1:begin
        st := st3;
        s := s2;
      end;
      2:begin
        st := st4;
        s := s3;
      end;
      3:begin
        st := st5;
        s := s4;
      end;
      4:begin
        st := st6;
        s := s5;
      end;
      5:begin
        st := st7;
        s := s6;
      end;
    end;
    subruthin1(st1,st,st8,s);
  end;
end;

function ruthin5(st:TStringList):boolean;
begin
  st.Text := StringReplace(st.Text,'set_',' ',[rfReplaceAll]);
  st.Text := StringReplace(st.Text,' no.',' ',[rfReplaceAll]);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  st,setcommand:TStringlist;
  i,i1:integer;
begin
  st := TStringList.Create;
  st.Text:=form1.SynMemo1.Text;
  setcommand := TStringList.Create;
  setcommand.Add('newedit');
  setcommand.Add('newpaint');
  setcommand.Add('moveto');
  setcommand.Add('lineto');
  setcommand.Add('ellipse');
  setcommand.Add('rect');
  setcommand.Add('ret');
  setcommand.Add('put');
  setcommand.Add('int');
  setcommand.Add('str');
  setcommand.Add('bool');
  setcommand.Add('end');
  setcommand.Add('if');
  //setcommand.Add('(');
  //setcommand.Add(')');

  ruthin2(st,setcommand);
  replace_space(st);
  form1.ListBox7.Items.Text:= st.Text;
end;

function TForm1.run_var(s:string;st,st2,st3,list_int,list_str,List_bool,index_int,index_str,index_bool:TStringList):string;
var
  s1,s2,s3,s4,err:string;
  i,i1:integer;
begin
  if 'int' = s then begin
    form1.ListBox8.ItemIndex := form1.ListBox8.Items.IndexOf(s);
    err := 'err ' + form1.ListBox8.Items[form1.ListBox8.ItemIndex];
    s2 := '0';
    s1 := (findcommand(st,st3,st,st2,st3,list_int,list_str,list_bool,true));
    if s1 = '=' then begin
      s2 := (findcommand(st,st2,st,st2,st3,list_int,list_str,list_bool,true));
      s1 := (findcommand(st,st3,st,st2,st3,list_int,list_str,list_bool,true));
    end;
    if (s1=';') then begin
      try
        i1 := form1.listbox11.Items.IndexOf(s);
        list_int.add(s2);
        index_int.add(s);
        run_var := s2;
      except
        begin showmessage(err); exit;; end;
      end;
    end else begin showmessage(err); exit;; end;
  end

  else

  if 'str' = s then begin
    form1.ListBox8.ItemIndex := form1.ListBox8.Items.IndexOf(s);
    err := 'err ' + form1.ListBox8.Items[form1.ListBox8.ItemIndex];
    s1 := (findcommand(st,st3,st,st2,st3,list_int,list_str,list_bool,true));
    s2 := '';
    if s1 = '=' then begin
      s2 := (findcommand(st,st2,st,st2,st3,list_int,list_str,list_bool,true));
      s1 := (findcommand(st,st3,st,st2,st3,list_int,list_str,list_bool,true));
    end;
    if (s1=';') then begin
      try
        i1 := form1.listbox11.Items.IndexOf(s);
        list_str.add(s2);
        index_str.add(s);
        run_var := s2;
      except
        begin showmessage(err); exit;; end;
      end;
    end else begin showmessage(err); exit;; end;
  end

  else

  if 'bool' = s then begin
    form1.ListBox8.ItemIndex := form1.ListBox8.Items.IndexOf(s);
    err := 'err ' + form1.ListBox8.Items[form1.ListBox8.ItemIndex];
    s1 := (findcommand(st,st3,st,st2,st3,list_int,list_str,list_bool,true));
    s2 := 'false';
    if s1 = '=' then begin
      s2 := (findcommand(st,st2,st,st2,st3,list_int,list_str,list_bool,true));
      s1 := (findcommand(st,st3,st,st2,st3,list_int,list_str,list_bool,true));
    end;
    if (s1=';') then begin
      try
        i1 := form1.listbox11.Items.IndexOf(s);
        list_bool.add(s2);
        index_bool.add(s);
        run_var := s2;
      except
        begin showmessage(err); exit;; end;
      end;
    end else begin showmessage(err); exit;; end;
  end
end;
function TForm1.use_var(s:string;list1,list2:Tlistbox;st,st2,st3,list_int,list_str,list_bool:TStringList):string;
var
  i1,i2:integer;
  s1,s2:string;
begin
  i1 := list1.Items.IndexOf(s);
  i2 := list2.Items.IndexOf(s);
  if (i1 > -1) and (i2 > -1) then begin
    s1 := (findcommand(st,st3,st,st2,st3,list_int,list_str,list_bool,false));
    if ('int' = list1.Items[i1 -1]) then begin
      //while s1 <> ';' do begin
        //s1 := (findcommand(st,st3,st,st2,st3,list_int,list_str,list_bool;false));
        //if s1 = '=' then begin
          s2 := (findcommand(st,list_int,st,st2,st3,list_int,list_str,list_bool,false));
          use_var := s2;
        {end else if s1 = '=' then begin
          s2 := (findcommand(st,list_int));
          use_var := s2;
        end else if s1 = '=' then begin
          s2 := (findcommand(st,list_int));
          use_var := s2;
        end else}


     // end;
    end else if ('str' = list1.Items[i1 -1]) then begin

    end else if ('bool' = list1.Items[i1 -1]) then begin

    end;
  end;
end;

function TForm1.use_if(s:string;list1,list2,list3,list4:TListBox;st,st2,st3,list_int,list_str,list_bool:TStringList):boolean;
var
  i,i1,i2,i3:integer;
  s1,s2,s3,s4:string;
  //t1,t2,t3,t4,t5:Tstringlist;
begin
  //s3 := findcommand(st,st3,st,st2,st3,list_int,list_str,list_bool,false);
  //if (st.Text = '') or (st2.Text = '') or (st3.Text = '') then
  //  exit;
  t1:=TStringList.Create;
  t2:=TStringList.Create;
  t3:=TStringList.Create;
  t4:=TStringList.Create;
  t5:=TStringList.Create;
  t1.Text:= list1.Items.Text;
  t2.Text:= list4.Items.Text;
  t3.Text:= list2.Items.Text;
  if s = 'if' then begin


    for i := 0 to t2.Count -1 do begin;
      i1 := t1.IndexOf(t2[i]);
      if i1 > -1 then begin
        s1 := t1[i1];
        s1 := use_var(s1,list2,list3,st,st2,st3,list_int,list_str,list_bool);
        t1.Delete(i1);
        t2.Delete(i);

        break;
      end;
     end;
     for i := 0 to t2.Count -1 do begin;
       i1 := t1.IndexOf(t2[i]);
        if i1 > -1 then begin
          s2 := t1[i1];
          s2 := use_var(s2,list2,list3,st,st2,st3,list_int,list_str,list_bool);
          t1.Delete(i1);
          t2.Delete(i);
          break;
        end;
      end;
    //for i := 0 to t3.Count -1 do begin;
      i1 := t1.IndexOf('if');
      if i3 > -1 then begin
        s3 := t1[i1+2];
        t1.Delete(i1);
        t1.Delete(i1 +2);
       // break;
      end;
    //end;

    t5.Text:= '('+ char(13) +')';
    findcommand(st,t4,st,st2,st3,list_int,list_str,list_bool,false);
    i1:=0;
    if s3 = '=' then begin
      if s1 = s2 then begin
        s4 := findcommand(st,t5,st,st2,st3,list_int,list_str,list_bool,false);
        if '(' = s4 then begin
          //showmessage(t1.Text+t2.Text+t3.Text);
          while s4 <> ')' do begin
            s4 := findcommand(st,t5,st,st2,st3,list_int,list_str,list_bool,false);
            run(t1,t2,t3,t4,true);

            if s4 = ')' then
             exit;
          end;
        end;
      end;
    end else if s3 = '<' then begin
      if s1 < s2 then begin
        s4 := findcommand(st,st3,st,st2,st3,list_int,list_str,list_bool,false);
        if '(' = s4 then begin
          while s4 <> ')' do begin
            s4 := findcommand(st,st3,st,st2,st3,list_int,list_str,list_bool,false);
            run(t1,t4,t2,t3,true);
            if s4 = ')' then
             exit;
          end;
        end;
      end;
    end else if s3 = '>' then begin
      if s1 > s2 then begin
        s4 := findcommand(st,st3,st,st2,st3,list_int,list_str,list_bool,false);
        if '(' = s4 then begin
          while s4 <> ')' do begin
            s4 := findcommand(st,st3,st,st2,st3,list_int,list_str,list_bool,false);
            run(t1,t4,t2,t3,true);
            if s4 = ')' then
             exit;
          end;
        end;
      end;
    end else if s3 = '!' then begin
      if s1 <> s2 then begin
        s4 := findcommand(st,st3,st,st2,st3,list_int,list_str,list_bool,false);
        if '(' = s4 then begin
          while s4 <> ')' do begin
            s4 := findcommand(st,st3,st,st2,st3,list_int,list_str,list_bool,false);
            run(t1,t4,t2,t3,true);
            if s4 = ')' then
             exit;
          end;
        end;
      end;
    end;
  end;
end;

function TForm1.findcommand(s1,s2,st,st2,st3,list_int,list_str,list_bool:TStringList;sw:boolean):string;
var
  i,i1,i2:integer;
  s3:string;
begin
  //showmessage(s1.Text + char(13) + s2.Text);
  for i := 0 to s2.Count -1 do begin
    i2 := ansipos(s2[i],s1.Text);
    if 0 < i2 then begin
      i1 := i;
      s3 := '';
      if sw then
        s3 := use_var(s2[i1],form1.ListBox8,form1.ListBox11,st,st2,st3,list_int,list_str,list_bool);
      end;
      if s2[i1] = 'if' then begin
        t1 := TStringlist.Create;
        t1.Text:= form1.ListBox7.Items.Text;
        t2 := TStringlist.Create;
        t2.Text:= form1.ListBox8.Items.Text;
        t3 := TStringlist.Create;
        t3.Text:= form1.ListBox9.Items.Text;
        t4 := TStringlist.Create;
        t4.Text:= form1.ListBox10.Items.Text;
        use_if(s2[i1],form1.listbox7,form1.listbox10,form1.ListBox8,form1.listbox11,st,st2,st3,list_int,list_str,list_bool);
      end;
      if (length(s3) = 0) or (s3 = 'if') or (s2[i1] = 'if') then begin
        s3 := s2[i1];
      end;
      //if 0 < i1 then begin
        findcommand := s3;
        i2 := s1.IndexOf(s3);
        //showmessage(s1[i2]+s2[i1]);
        if i2 > -1 then begin
          s1.Delete(i2);
        end;
        s2.Delete(i1);
        break;
      //end;
    end;// else findcommand := '';

  //end;
end;

function TForm1.run(st,st1,st2,st3:TStringList;sw:boolean):boolean;
var
  i,i1,i2,ans1,ans2:integer;
  setnum,set_func:TStringList;
  list_int,list_str,list_bool:TStringList;
  index_int,index_str,index_bool:TStringList;
  s,s1,s2,s3,s4,err,ans3,ans4:String;
  sw1,sw2,sw3:boolean;
begin
  list_int:=TStringList.Create;
  list_str:=TStringList.Create;
  list_bool:=TStringList.Create;
  index_int:=TStringList.Create;
  index_str:=TStringList.Create;
  index_bool:=TStringList.Create;
  list_int.Clear;
  list_str.Clear;
  list_bool.Clear;
  index_int.Clear;
  index_str.Clear;
  index_bool.Clear;
  setnum := TStringList.Create;
  setnum.text := st2.Text;
  form1.ListBox8.ItemIndex := 0;
  sw2 := false;
  sw3 := false;
  with form1 do

  for i := 0 to st.Count -1 do begin
    s := findcommand(st,st1,st,st2,st3,list_int,list_str,list_bool,false);
    if s = 'if' then
      sw2 := true;
    {if sw2 then
      }
    if sw then begin
      sw2 := false;
      if sw3 = false then begin
        if s <> 'if' then begin
          s := findcommand(st,st1,st,st2,st3,list_int,list_str,list_bool,false);
          //sw2 := true;
        end else if s = 'if' then begin
          sw3 := true;
        end;
      end;
    end;
    if not sw2 then begin

    s1 := run_var(s,st,st2,st3,list_int,list_str,List_bool,index_int,index_str,index_bool);
    use_var(s1,form1.ListBox8,listbox11,st,st2,st3,list_int,list_str,list_bool);
   // if sw then
    //showmessage(st.Text + st1.Text + '__' + s);
    {if length(s1)> 0 then begin

      form1.ListBox8.items.Add(s1);
    end;}
    //showmessage(s);
   if 'newedit' = s then begin
      form1.ListBox8.ItemIndex := form1.ListBox8.Items.IndexOf(s);
      err := 'err ' + form1.ListBox8.Items[form1.ListBox8.ItemIndex];
      s1 := (findcommand(st,st3,st,st2,st3,list_int,list_str,list_bool,false));
      if (s1 =';') then begin
        try
          form1.PaintBox1.Visible:= not true;
          form1.Memo1.Visible:= not false;
          //form1.PaintBox1.Canvas.Clear;
          form1.Memo1.Lines.Clear;
        except
           begin showmessage(err); break; end;
        end;
      end else begin showmessage(err); break; end;
    end

   else

    if 'newpaint' = s then begin
      form1.ListBox8.ItemIndex := form1.ListBox8.Items.IndexOf(s);
      err := 'err ' + form1.ListBox8.Items[form1.ListBox8.ItemIndex];
      s1 := (findcommand(st,st3,st,st2,st3,list_int,list_str,list_bool,false));
      if (s1 =';') then begin
        try
          form1.PaintBox1.Visible:= true;
          form1.Memo1.Visible:= false;
          form1.PaintBox1.Canvas.Clear;
        except
           begin showmessage(err); break; end;
        end;
      end else begin showmessage(err); break; end;
    end

    else

    if 'moveto' = s then begin
      form1.ListBox8.ItemIndex := form1.ListBox8.Items.IndexOf(s);
      err := 'err ' + form1.ListBox8.Items[form1.ListBox8.ItemIndex];
      s1 := (findcommand(st,st3,st,st2,st3,list_int,list_str,list_bool,false));
      s2 := (findcommand(st,st3,st,st2,st3,list_int,list_str,list_bool,false));
      //s3 := (findcommand(st,st3,st,st2,st3,list_int,list_str,list_bool;false));
      if (s1=',') and (s2=';') then begin
        try
          s3 := findcommand(st,setnum,st,st2,st3,list_int,list_str,list_bool,false);
          s4 := findcommand(st,setnum,st,st2,st3,list_int,list_str,list_bool,false);
          form1.PaintBox1.Canvas.MoveTo(
            strtoint(s3),
            strtoint(s4)
          );
        except
           begin showmessage(err); break; end;
        end;
      end else begin showmessage(err + s1 + s2); break; end;;
    end

    else

    if 'lineto' = s then begin
      form1.ListBox8.ItemIndex := form1.ListBox8.Items.IndexOf(s);
      err := 'err ' + form1.ListBox8.Items[form1.ListBox8.ItemIndex];
      s1 := (findcommand(st,st3,st,st2,st3,list_int,list_str,list_bool,false));
      s2 := (findcommand(st,st3,st,st2,st3,list_int,list_str,list_bool,false));

     // showmessage(s1+s2);
      if (s1=',')and(s2=';') then begin
        try
          form1.PaintBox1.Canvas.LineTo(
            strtoint(findcommand(st,setnum,st,st2,st3,list_int,list_str,list_bool,false)),
            strtoint(findcommand(st,setnum,st,st2,st3,list_int,list_str,list_bool,false))
          );
        except
          begin showmessage(err); break; end;
        end;
      end else begin showmessage(err); break; end;;
    end

    else

   if 'ellipse' = s then begin
      form1.ListBox8.ItemIndex := form1.ListBox8.Items.IndexOf(s);
      err := 'err ' + form1.ListBox8.Items[form1.ListBox8.ItemIndex];
      s1 := (findcommand(st,st3,st,st2,st3,list_int,list_str,list_bool,false));
      s2 := (findcommand(st,st3,st,st2,st3,list_int,list_str,list_bool,false));
      s3 := (findcommand(st,st3,st,st2,st3,list_int,list_str,list_bool,false));
      s4 := (findcommand(st,st3,st,st2,st3,list_int,list_str,list_bool,false));
      if (s1=',')and(s2=',')and (s3=',') and (s4=';') then begin
        try
          form1.PaintBox1.Canvas.Ellipse(
            strtoint(findcommand(st,setnum,st,st2,st3,list_int,list_str,list_bool,false)),
            strtoint(findcommand(st,setnum,st,st2,st3,list_int,list_str,list_bool,false)),
            strtoint(findcommand(st,setnum,st,st2,st3,list_int,list_str,list_bool,false)),
            strtoint(findcommand(st,setnum,st,st2,st3,list_int,list_str,list_bool,false))
          );
        except
          begin showmessage(err); break; end;
        end;
      end else begin showmessage(err); break; end;;
    end

    else

    if 'rect' = s then begin
      form1.ListBox8.ItemIndex := form1.ListBox8.Items.IndexOf(s);
      err := 'err ' + form1.ListBox8.Items[form1.ListBox8.ItemIndex];
      s1 := (findcommand(st,st3,st,st2,st3,list_int,list_str,list_bool,false));
      s2 := (findcommand(st,st3,st,st2,st3,list_int,list_str,list_bool,false));
      s3 := (findcommand(st,st3,st,st2,st3,list_int,list_str,list_bool,false));
      s4 := (findcommand(st,st3,st,st2,st3,list_int,list_str,list_bool,false));
      if (s1=',')and(s2=',')and (s3=',') and (s4=';') then begin
        try
          form1.PaintBox1.Canvas.Rectangle(
            strtoint(findcommand(st,setnum,st,st2,st3,list_int,list_str,list_bool,false)),
            strtoint(findcommand(st,setnum,st,st2,st3,list_int,list_str,list_bool,false)),
            strtoint(findcommand(st,setnum,st,st2,st3,list_int,list_str,list_bool,false)),
            strtoint(findcommand(st,setnum,st,st2,st3,list_int,list_str,list_bool,false))
          );
        except
          begin showmessage(err); break; end;
        end;
      end else begin showmessage(err); break; end;;
    end

    else

    if 'ret' = s then begin
      form1.ListBox8.ItemIndex := form1.ListBox8.Items.IndexOf(s);
      err := 'err ' + form1.ListBox8.Items[form1.ListBox8.ItemIndex];
      s1 := (findcommand(st,st3,st,st2,st3,list_int,list_str,list_bool,false));
      if (s1=';') then begin
        try
          form1.Memo1.Lines.Text:=form1.Memo1.Lines.Text + char(13);
        except
          begin showmessage(err); break; end;
        end;
      end else begin showmessage(err); break; end;
    end

    else

    if 'put' = s then begin
      set_func := TStringList.Create;
      set_func.Clear;
      form1.ListBox8.ItemIndex := form1.ListBox8.Items.IndexOf(s);
      err := 'err ' + form1.ListBox8.Items[form1.ListBox8.ItemIndex];
      //showmessage(st3.Text);
      s1 := (findcommand(st,st3,st,st2,st3,list_int,list_str,list_bool,false));
      //s1 := (findcommand(st,st3,st,st2,st3,list_int,list_str,list_bool,false));
      //全面的に見直す必要あり
      ans1 := 0;
      ans2 := 0;
      ans3 := '';
      ans4 := '';
      s2 := findcommand(st,setnum,st,st2,st3,list_int,list_str,list_bool,false);
      if length(s2) > 0 then begin
        if (0 < ansipos(s2[1],'1234567890')) and (0 = ansipos(s2[1],'"''')) then begin
          ans1 := strtoint(s2);
          sw1 := true;
          try
            s2 := inttostr(ans1);
            form1.Memo1.Lines.Text:=form1.Memo1.Lines.Text + s2;
          except
            begin showmessage(err); break; end;
          end;
        end else if (0 < ansipos(s2[2],'1234567890abcdefghijklmnopqrstuvwxyz')) and (0 < ansipos(s2[1],'"''')) then begin
          ans3 := s2;
          sw1 := false;
          try
            s2 := (ans3);
            form1.Memo1.Lines.Text:=form1.Memo1.Lines.Text + s2;
          except
            begin showmessage(err); break; end;
          end;
        end;
      end;
      if sw1 then begin
        if s1 = '+' then begin
          //set_func.Add(s1);
          ans1 := ans1 + ans2;
          try
            s2 := inttostr(ans1);
            form1.Memo1.Lines.Text:=form1.Memo1.Lines.Text + s2;
          except
            begin showmessage(err); break; end;
          end;
        end else if s1 = '-' then begin
          //set_func.Add(s1);
          ans1 := ans1 - ans2;
          try
            s2 := inttostr(ans1);
            form1.Memo1.Lines.Text:=form1.Memo1.Lines.Text + s2;
          except
            begin showmessage(err); break; end;
          end;
        end else if s1 = '/' then begin
          //set_func.Add(s1);
          ans1 := ans1 div ans2;
          try
            s2 := inttostr(ans1);
            form1.Memo1.Lines.Text:=form1.Memo1.Lines.Text + s2;
          except
            begin showmessage(err); break; end;
          end;
        end else if s1 = '*' then begin
          // set_func.Add(s1);
          ans1 := ans1 * ans2;
          try
            s2 := inttostr(ans1);
            form1.Memo1.Lines.Text:=form1.Memo1.Lines.Text + s2;
          except
            begin showmessage(err); break; end;
          end;
        end else if s1 = '=' then begin
           //set_func.Add(s1);
          ans1 :=  ans2;
          try
            s2 := inttostr(ans1);
            form1.Memo1.Lines.Text:=form1.Memo1.Lines.Text + s2;
          except
            begin showmessage(err); break; end;
          end;
        end else if s1 = ':' then begin
           //set_func.Add(s1);
        end;

       // showmessage(set_func.Text);
      end else if not sw1 then begin
        if s1 = '+' then begin
          //set_func.Add(s1);
          ans3 := ans3 + ans4;
          try
            s2 := ans3;
            form1.Memo1.Lines.Text:=form1.Memo1.Lines.Text + s2;
          except
            begin showmessage(err); break; end;
          end;
        end else if s1 = '-' then begin
          //set_func.Add(s1);
          //ans3 := ans3 - ans4;
        end else if s1 = '=' then begin
           //set_func.Add(s1);
          ans3 := ans4;
          try
            s2 := ans3;
            form1.Memo1.Lines.Text:=form1.Memo1.Lines.Text + s2;
          except
            begin showmessage(err); break; end;
          end;
        end else if s1 = ':' then begin
           //set_func.Add(s1);
        end;
      end



    end

    else
    if 'end' = s then begin
       form1.ListBox8.ItemIndex := form1.ListBox8.Items.IndexOf(s);
        err := 'err ' + form1.ListBox8.Items[form1.ListBox8.ItemIndex];
        s1 := (findcommand(st,st3,st,st2,st3,list_int,list_str,list_bool,false));
        if (s1=';') then begin
          try
            break;
            form1.Memo1.Lines.Text:=form1.Memo1.Lines.Text + char(13);
          except
            begin showmessage(err); break; end;
          end;
        end else begin showmessage(err); break; end;
    end;


    //form1.ListBox8.Items.Text:= st1.Text;
    //form1.ListBox9.Items.Text:= setnum.Text;
    //form1.ListBox10.Items.Text:= st3.Text;
   if form1.ListBox8.ItemIndex = form1.ListBox8.Items.Count -1 then
     break;
  end;
  end;
  form1.ListBox12.Items.Text:= list_int.Text;
  form1.ListBox13.Items.Text:= list_str.Text;
  form1.ListBox14.Items.Text:= list_bool.Text;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  st,st1,st2,st3:TStringList;
begin
  st := TStringlist.Create;
  st.Text:= form1.ListBox7.Items.Text;
  st1 := TStringlist.Create;
  st1.Text:= form1.ListBox8.Items.Text;
  st2 := TStringlist.Create;
  st2.Text:= form1.ListBox9.Items.Text;
  st3 := TStringlist.Create;
  st3.Text:= form1.ListBox10.Items.Text;
  run(st,st1,st2,st3,false);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  form1.ListBox7.Items.Clear;
  form1.ListBox8.Items.Clear;
  form1.ListBox9.Items.Clear;
  form1.ListBox10.Items.Clear;
  form1.ListBox11.Items.Clear;
  form1.ListBox12.Items.Clear;
  form1.ListBox13.Items.Clear;
  form1.ListBox14.Items.Clear;

end;

procedure TForm1.Button4Click(Sender: TObject);
var
  st1,st2,st3,st4,st5,st6,st7,st8:TStringList;
  s1,s2,s3,s4,s5,s6,s7:string;
  function set_string:boolean;
  var
    i:integer;
    s:string;
  begin
    for i := 0 to 7 do begin
      s := 'set_' + inttostr(i+1);
      case i of
        0:s1 := s;
        1:s2 := s;
        2:s3 := s;
        3:s4 := s;
        4:s5 := s;
        5:s6 := s;
        6:s7 := s;
      end;
    end;
  end;
begin

end;

procedure TForm1.Button5Click(Sender: TObject);
begin

end;

procedure TForm1.Button6Click(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.ListBox10Click(Sender: TObject);
begin
  //showmessage(inttostr(length(listbox10.Items[listbox10.ItemIndex])))
end;

procedure TForm1.ListBox3Click(Sender: TObject);
begin
  //showmessage(inttostr(length(form1.ListBox3.Items[form1.ListBox3.ItemIndex])));
end;

procedure TForm1.ListBox7Click(Sender: TObject);
begin

end;

procedure TForm1.ListBox7DblClick(Sender: TObject);

begin


end;

procedure TForm1.ListBox8DblClick(Sender: TObject);
begin

end;




end.

