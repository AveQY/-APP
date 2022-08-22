require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "java.io.File"
import "android.graphics.drawable.ColorDrawable"
import "android.graphics.drawable.StateListDrawable"
import "android.graphics.PorterDuffColorFilter"
import "android.graphics.PorterDuff"
import "function"

颜色1="#555555"--文字
颜色2="0x69E7EBEC"
颜色3="0xffffffff"

result = 0
resourceId = this.getResources().getIdentifier("status_bar_height", "dimen", "android");
if resourceId > 0 then
  result = this.getResources().getDimensionPixelSize(resourceId);
end

--[[

©--2022.8.23开源 
by訫念是你

]]


function 写入文件(路径,内容)
  io.open(路径,"w"):write(内容):close()
end

content2={
  LinearLayout;
  orientation="vertical";
  layout_height="match_parent";
  layout_width="match_parent";
  {
    CardView;
    CardElevation="3dp";
    layout_width="match_parent";
    backgroundColor="0xFFFFFFFF";
    radius="0dp";
    layout_height="wrap_content";
    {
      LinearLayout;
      layout_width="match_parent";
      {
        LinearLayout;
        orientation="horizontal";
        layout_height="56dp";
        gravity="center";
        layout_width="match_parent";
        {
          LinearLayout;
          gravity="center";
          layout_height="match_parent";
          {
            CardView;
            PreventCornerOverlap=false;
            CardElevation="0dp";
            background="#00000000";
            layout_width="80dp";
            UseCompatPadding=false;
            radius="40dp";
            layout_marginLeft="-15dp";
            layout_height="80dp";
            {
              ImageView;
              id="main2_btn";
              background="#00000000";
              layout_width="match_parent";
              padding="27dp";
              src="icon.png";
              layout_margin="-10dp";
              layout_height="match_parent";
            };
          };
        };
        {
          LinearLayout;
          orientation="vertical";
          layout_height="match_parent";
          layout_width="120dp";
          {
            TextView;
            layout_weight="1";
            textSize="19dp";
            layout_width="match_parent";
            layout_height="30dp";
            textColor="0xff303030";
            gravity="center|left";
            id="main2_title";
            ellipsize="end";
            singleLine=true;
            text="AndLua";
          };
          {
            MarText;
            id="file_name";
            layout_width="match_parent";
            textColor="0xFF03A98D";
            layout_marginTop="2dp";
            ellipsize="marquee";
            focusable=true;
            text="main.lua";
            singleLine=true;
            focusableInTouchMode=true;
          };
        };
        {
          CardView;
          PreventCornerOverlap=false;
          CardElevation="0dp";
          background="#00000000";
          layout_width="65dp";
          layout_marginRight="-17dp";
          UseCompatPadding=false;
          radius="33dp";
          layout_height="65dp";
          {
            ImageView;
            id="main2_btn1";
            background="#00000000";
            layout_width="match_parent";
            padding="27dp";
            src="res/finish.png";
            layout_margin="-10dp";
            layout_height="match_parent";
          };
        };
        {
          CardView;
          PreventCornerOverlap=false;
          CardElevation="0dp";
          background="#00000000";
          layout_width="65dp";
          layout_marginRight="-17dp";
          UseCompatPadding=false;
          radius="33dp";
          layout_height="65dp";
          {
            ImageView;
            id="main2_btn2";
            background="#00000000";
            layout_width="match_parent";
            padding="27dp";
            src="res/03.png";
            layout_margin="-10dp";
            layout_height="match_parent";
          };
        };
        {
          CardView;
          PreventCornerOverlap=false;
          CardElevation="0dp";
          background="#00000000";
          layout_width="65dp";
          layout_marginRight="-19dp";
          UseCompatPadding=false;
          radius="33dp";
          layout_height="65dp";
          {
            ImageView;
            id="main2_btn3";
            background="#00000000";
            layout_width="match_parent";
            padding="27dp";
            src="res/run.png";
            layout_margin="-10dp";
            layout_height="match_parent";
          };
        };
        {
          CardView;
          PreventCornerOverlap=false;
          CardElevation="0dp";
          background="#00000000";
          layout_width="65dp";
          layout_marginRight="-10dp";
          UseCompatPadding=false;
          radius="33dp";
          layout_height="65dp";
          {
            TextView;
            id="menu";
            layout_width="0dp";
            layout_marginTop="50dp";
            layout_marginLeft="-145dp";
            layout_height="0dp";
          };
          {
            ImageView;
            id="main2_btn4";
            background="#00000000";
            layout_width="match_parent";
            padding="27dp";
            src="res/Other.png";
            layout_margin="-10dp";
            layout_height="match_parent";
          };
        };
      };
    };
  };
  {
    LinearLayout;
    gravity="center";
    orientation="vertical";
    layout_width="match_parent";
    background="0xff959595";
    layout_height="match_parent";
    {
      RelativeLayout;
      {
        LinearLayout;
        orientation="vertical";
        {
          LinearLayout;
          id="错误提示";
          Visibility=8;
          backgroundColor="0xFFFF9A99";
          layout_width="match_parent";
          layout_height="3%h";
          {
            TextView;
            id="错误文字";
            textColor="0xffffffff";
            layout_gravity="center";
            layout_marginLeft="10dp";
            text="错误提示";
          };
        };
        {
          LuaEditor;
          layout_weight=1;
          id="editor";
          background="0xFFD8DFC3";
          layout_width="fill";
          layout_height="fill";
        };
        {
          LinearLayout;
          layout_height="5%h";
          layout_width="fill";
          {
            HorizontalScrollView;
            horizontalScrollBarEnabled=false;
            layout_height="fill";
            layout_width="fill";
            {
              LinearLayout;
              id="bar";
              layout_height="fill";
              layout_width="fill";
            };
          };
        };
      };
    };
  };
};
items2={
  LinearLayout;
  layout_width="match_parent";
  layout_height="match_parent";
  orientation="vertical";
  {
    LinearLayout;
    gravity="center";
    layout_width="match_parent";
    layout_height="60dp";
    layout_margin="-6dp";
    orientation="horizontal";
    {
      ImageView;
      layout_height="44dp";
      id="src";
      padding="10dp";
      layout_width="44dp";
      layout_marginLeft="10dp";
      ColorFilter="0xFFFFFFFF";
    };
    {
      TextView;
      id="title";
      layout_marginLeft="20dp";
      layout_width="match_parent";
      textColor="#000000";
    };
  };
};
drawer2={
  LinearLayout;
  layout_gravity="left",
  backgroundColor=颜色3;
  layout_height="match_parent";
  orientation="vertical";
  {
    LinearLayout;
    layout_width="match_parent";
    layout_height="85%h";
    orientation="vertical";
    {
      LinearLayout;
      layout_width="280dp";
      backgroundColor="0x00000000";
      orientation="vertical";
      gravity="center";
      layout_height="match_parent";
      {
        CardView;
        layout_marginTop="1dp";
        gravity="center";
        layout_height="50dp";
        layout_width="260dp";
        CardElevation=0;
        radius=25;
        backgroundColor=颜色2;
        {
          LinearLayout;
          layout_width="match_parent";
          gravity="center";
          orientation="vertical";
          layout_height="match_parent";
          {
            TextView;
            textColor=颜色1,
            textSize="16sp";
            text="文件列表";
          };
          {
            MarText;
            textColor=颜色1,
            ellipsize="marquee";
            focusableInTouchMode=true;
            focusable=true;
            singleLine=true;
            layout_width="240dp",
            layout_height="15dp";
            textSize="10sp";
            text="路径";
            layout_marginTop="5dp";
            id="cp";
          };
        };
      };
      {
        ListView;
        layout_height="fill";
        layout_width="fill";
        DividerHeight=0;
        id="lv";
        layout_marginTop="5dp";
      };
    };
  },
  {
    LinearLayout;
    layout_width="match_parent";
    layout_height="match_parent";
    gravity="center|Bottom";
    backgroundColor="0x00000000";
    {
      LinearLayout;
      layout_width="match_parent";
      layout_height="match_parent";
      gravity="center";
      orientation="vertical";
      {
        CardView;
        backgroundColor=颜色2;
        CardElevation="0dp";
        radius=25;
        layout_width="260dp";
        layout_height="50dp";
        gravity="center";
        id="new_file",
        {
          TextView;
          textColor=颜色1,
          gravity="center";
          text="新建文件";
          textSize="16sp";
          layout_width="match_parent";
          layout_height="match_parent";
        };
      };
      {
        CardView;
        backgroundColor=颜色2;
        CardElevation="0dp";
        radius=25;
        layout_width="260dp";
        layout_height="50dp";
        gravity="center";
        layout_marginTop="5dp",
        id="png_file",
        {
          TextView;
          textColor=颜色1,
          gravity="center";
          text="导入图片";
          textSize="16sp";
          layout_width="match_parent";
          layout_height="match_parent";
        };
      };
    };
  },
};

layout={DrawerLayout,id="mDrawer2"}
activity.setTheme(R.Theme_Teal)
activity.ActionBar.hide()
activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xFFFFFFFF);
if tonumber(Build.VERSION.SDK) >= 23 then
  activity.getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
end
table.insert(layout,content2)
table.insert(layout,drawer2)
activity.setContentView(loadlayout(layout))
项目名称,状态=...
main2_title.setText(项目名称)

if io.open("/storage/emulated/0/訫/项目/"..项目名称.."/icon.png")==nil then
 else
  main2_btn.setImageBitmap(loadbitmap("/storage/emulated/0/訫/项目/"..项目名称.."/icon.png"))
end

editor.Text=io.open(tostring("/storage/emulated/0/訫/项目/"..项目名称.."/main.lua")):read("*a")

function 保存()
  写入文件("/storage/emulated/0/訫/项目/"..项目名称.."/"..file_name.Text,editor.Text)
end

RippleHelper(main2_btn).RippleColor=0x25000000
RippleHelper(main2_btn1).RippleColor=0x25000000
RippleHelper(main2_btn2).RippleColor=0x25000000
RippleHelper(main2_btn3).RippleColor=0x25000000
RippleHelper(main2_btn4).RippleColor=0x25000000

function main2_btn.onClick()--图标
  调用系统选择文件(function (a)
    LuaUtil.copyDir(a,"/sdcard/訫/项目/"..项目名称.."/icon.png")
    Toast.makeText(activity,"已更换,退出刷新试试", Toast.LENGTH_LONG).show()
  end)
end
function main2_btn1.onClick()--撤销
  editor.undo()
end
function main2_btn2.onClick()--格式化
  保存()
  editor.format()
end
function main2_btn2.onLongClick()--长按格式化
  保存()
  Toast.makeText(activity, "格式化代码",Toast.LENGTH_SHORT).show()
end
function main2_btn3.onClick()--运行
  保存()
  activity.newActivity("/storage/emulated/0/訫/项目/"..项目名称.."/main.lua")
end
png_file.onClick=function()
  调用系统选择文件(function (a)
    na=File(a).getName()
    LuaUtil.copyDir(a,"/sdcard/訫/项目/"..项目名称.."/"..na..".png")
    Toast.makeText(activity,"已导入", Toast.LENGTH_LONG).show()
  end)
end

pop=PopupMenu(activity,menu)
menu=pop.Menu
menu.add("生成软件").onMenuItemClick=function(v)
  保存()
  import "bin"
  bin("/storage/emulated/0/訫/项目/"..项目名称.."/","/storage/emulated/0/訫/"..项目名称..".apk")
end
menu.add("备份工程").onMenuItemClick=function(v)
  保存()
  路径="/storage/emulated/0/訫/备份/"
  ZipUtil.zip("/storage/emulated/0/訫/项目/"..项目名称.."/","/storage/emulated/0/訫/备份/")
  File(路径..项目名称..".zip").renameTo(File(路径..项目名称..".alp"))
  Toast.makeText(activity,"备份成功", Toast.LENGTH_LONG).show()
end
menu.add("布局助手").onMenuItemClick=function(v)
  保存()
  activity.newActivity("layouthelper/main", {项目名称,"/storage/emulated/0/訫/项目/"..项目名称.."/"..file_name.Text })
end
menu.add("使用手册").onMenuItemClick=function(v)
  保存()
  activity.newActivity("AndLua/main4",true)
end
menu.add("打开侧滑").onMenuItemClick=function(v)
  SetItem("/storage/emulated/0/訫/项目/"..项目名称.."/")
  保存()
  mDrawer2.openDrawer(3)
end
menu.add("配色参考").onMenuItemClick=function(v)
  保存()
  activity.newActivity("AndLua/main7")
end

main2_btn4.onClick=function()
  保存()
  pop.show()
end

local itemq={
  LinearLayout;
  background="0";
  layout_width="match_parent";
  layout_height="match_parent";
  {
    LinearLayout;
    layout_width="match_parent";
    gravity="center";
    layout_height="match_parent";
    {
      LinearLayout;
      layout_width="280dp";
      gravity="center";
      orientation="vertical";
      layout_height="60dp";
      {
        CardView;
        backgroundColor=颜色2;
        CardElevation="0dp";
        radius=25;
        layout_width="260dp";
        layout_height="50dp";
        {
          LinearLayout;
          layout_width="fill";
          gravity="center";
          layout_height="match_parent";
          {
            LinearLayout;
            layout_width="50dp";
            gravity="center";
            layout_height="match_parent";
            {
              ImageView;
              layout_width="25dp";
              src="res/file.png";
              id="wjlx";
              layout_height="25dp";
            };
          };
          {
            LinearLayout;
            layout_width="match_parent";
            layout_height="match_parent";
            {
              TextView;
              textColor=颜色1,
              id="wjm",
              layout_gravity="center";
              text="main.lua";
              textSize="15sp";
            };
          };
        };
      };
    };
  };
};

data={}
adpq=LuaAdapter(activity,data,itemq)
lv.setAdapter(adpq)
function SetItem(path)
  path=tostring(path)
  adpq.clear()
  cp.Text=tostring(path)
  if path~=tostring("/storage/emulated/0/訫/项目/"..项目名称.."/") then--不是根目录则加上../
    adpq.add{wjm="返回上级目录",wjlx="icon/folder.png"}
  end
  ls=File(path).listFiles()
  if ls~=nil then
    ls=luajava.astable(File(path).listFiles())
    table.sort(ls,function(a,b)
      return (a.isDirectory()~=b.isDirectory() and a.isDirectory()) or ((a.isDirectory()==b.isDirectory()) and a.Name<b.Name)
    end)
   else
    ls={}
  end
  for index,c in ipairs(ls) do
    if c.isDirectory() then
      adpq.add{wjm=c.Name,wjlx="res/folder.png"}
     elseif c.isFile() then
      adpq.add{wjm=c.Name,wjlx="res/file.png"}
    end
  end

  lv.onItemClick=function(l,v,p,s)
    保存()
    a=v.Tag.wjm.Text
    if a:find("%.lua$") or a:find("%.aly$") or a:find("%.txt$") then
      file_name.setText(v.Tag.wjm.Text)
      mDrawer2.closeDrawer(3)
      editor.text=io.open(tostring("/storage/emulated/0/訫/项目/"..项目名称.."/"..v.Tag.wjm.Text)):read("*a")
     else
      弹窗("暂不支持打开此类文件")
    end
  end
  lv.onItemLongClick=function(l,v,p,s)
    文件名称=v.Tag.wjm.Text
    if 文件名称=="main.lua" then
      弹窗("此文件无法删除")
     elseif 文件名称=="init.lua" then
      弹窗("此文件无法删除")
     else
      layout_q={
        LinearLayout;
        layout_width="fill";
        gravity="center";
        layout_height="fill";
        {
          LinearLayout;
          orientation="vertical";
          layout_width="match_parent";
          layout_height="213dp";
          {
            TextView;
            layout_marginLeft="25dp";
            layout_marginTop="10dp";
            textSize="20sp";
            textColor="0xFF03A99F";
            text="确定删除？";
            layout_marginTop="10dp";
          };
          {
            TextView;
            textSize="15sp";
            layout_marginLeft="25dp";
            text='文件名称：'..文件名称.."\n您确定要删除此文件吗？删除后将无法恢复！";
            layout_marginTop="10dp";
          };
          {
            LinearLayout;
            layout_marginBottom="50dp";
            layout_gravity="bottom";
            layout_marginTop="20dp";
            layout_width="match_parent";
            layout_height="120dp";
            orientation="vertical";
            {
              Button;
              layout_gravity="center";
              text="删除";
              layout_height="50dp";
              id="确定删除";
              textColor="#FF0000",
              layout_marginTop="10dp";
              layout_width="match_parent";
            };
            {
              Button;
              text="取消";
              layout_gravity="center";
              id="取消删除";
              layout_height="50dp";
              textColor="#757575",
              layout_marginTop="0dp";
              layout_width="match_parent";
            };
          };
        };
      };

      dialog=AlertDialog.Builder(this)
      .setView(loadlayout(layout_q))
      .setCancelable(false)
      .show()
      dialog.create()
      控件圆角(确定删除,0,0xFFFFFFFF)
      控件圆角(取消删除,0,0xFFFFFFFF)
      function 确定删除.onClick()
        os.execute("rm -r ".."/storage/emulated/0/訫/项目/"..项目名称.."/"..文件名称)
        mDrawer2.closeDrawer(3)
        dialog.dismiss()
        SetItem("/storage/emulated/0/訫/项目/"..项目名称.."/")
      end
      function 取消删除.onClick()
        dialog.dismiss()
      end
      return true
    end
  end
end
SetItem("/storage/emulated/0/訫/项目/"..项目名称.."/")

new_file.onClick=function()
  local cj={
    LinearLayout;
    layout_height="fill";
    layout_width="fill";
    gravity="center";
    {
      LinearLayout;
      layout_height="210dp";
      layout_width="fill";
      orientation="vertical";
      {
        TextView;
        layout_marginTop="15dp";
        text="新建文件";
        layout_marginLeft="20dp";
        textColor="0xFF03A995";
        textSize="20sp";
      };
      {
        LinearLayout;
        layout_height="80dp";
        layout_width="match_parent";
        orientation="horizontal";
        gravity="center";
        {
          EditText;
          layout_marginTop="10dp";
          layout_width="150dp";
          hint="请输入新建文件名称";
          textSize="15sp";
          id="输入文件名称";
          gravity="center|Left";
        };
        {
          Spinner;
          layout_marginLeft="10dp";
          layout_marginTop="9dp",
          items={
            "lua(默认)";
            "布局";
            "文本";
            "文件夹";
          };
          id="类型";
          layout_gravity="center";
        };
      };
      {
        LinearLayout;
        layout_height="match_parent";
        layout_width="match_parent";
        {
          Button;
          textColor="0x7E000000";
          layout_gravity="center";
          text="取消";
          layout_height="40dp";
          layout_marginBottom="5dp";
          id="取消创建文件";
          layout_marginLeft="10dp";
        };
        {
          LinearLayout;
          layout_height="match_parent";
          layout_width="match_parent";
          gravity="right";
          {
            Button;
            layout_marginRight="10dp";
            textColor="0xFF03A995";
            text="创建";
            layout_height="40dp";
            layout_marginBottom="5dp";
            id="确定创建文件";
            layout_gravity="center";
          };
        };
      };
    };
  };
  dialog=AlertDialog.Builder(this)
  .setView(loadlayout(cj))
  .show()
  dialog.create()
  Drawable_round(dialog.getWindow(),0xFFffffff)
  local x=nil
  控件圆角(确定创建文件,20,0x12000000)
  控件圆角(取消创建文件,20,0x12000000)
  function 取消创建文件.onClick()
    dialog.dismiss()
  end
  类型.onItemSelected=function(l,v,p,i)
    x=v.text
  end
  function 确定创建文件.onClick()
    项目名称2="/storage/emulated/0/訫/项目/"..项目名称
    if #输入文件名称.text~=0 then
      if x=="lua(默认)" then
        local lua=[[require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "layout"

activity.setTitle("标题")--软件内标题
activity.setTheme(R.Theme_Teal)--主题颜色
activity.setContentView(loadlayout(layout))]]
        if not File(项目名称2.."/"..输入文件名称.Text..".lua").isFile() then
          写入文件(项目名称2.."/"..输入文件名称.Text..".lua",lua)
          dialog.dismiss()
          弹窗("创建成功")
          mDrawer2.closeDrawer(3)
         else
          弹窗("文件已存在")
        end
       elseif x=="布局" then
        local aly=[[{
LinearLayout;
  layout_height="fill";
  layout_width="fill";
};]]
        if not File(项目名称2.."/"..输入文件名称.Text..".aly").isFile() then
          写入文件(项目名称2.."/"..输入文件名称.Text..".aly",aly)
          dialog.dismiss()
          弹窗("创建成功")
          mDrawer2.closeDrawer(3)
         else
          弹窗("文件已存在")
        end
       elseif x=="文本" then
        if not File(项目名称2.."/"..输入文件名称.Text..".txt").isFile() then
          写入文件(项目名称2.."/"..输入文件名称.Text..".txt","")
          dialog.dismiss()
          弹窗("创建成功")
          mDrawer2.closeDrawer(3)
         else
          弹窗("文件已存在")
        end
       elseif x=="文件夹" then
        if not File(项目名称2.."/"..输入文件名称.Text).isDirectory() then
          创建文件夹(项目名称2,输入文件名称.Text)
          dialog.dismiss()
          mDrawer2.closeDrawer(3)
          弹窗("创建成功")
         else
          弹窗("文件夹已存在")
        end
      end
    end
  end
end

activity.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_PAN)

activity.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE)
fh=io.open(activity.getLuaDir().."/libs/Symbol"):read("*a")
for t,c in fh:gmatch("(.-) ") do
  button={
    Button;
    text=tostring(t);
    layout_width="50dp";
    layout_height="fill";
    background="#ffffff";
    textColor=0xFF03A99E;
    padding="5dp",
    textSize="13dp",
    id="sssss",
  };
  m=loadlayout(button)
  bar.addView(m)
  m.onClick=function(v)
    if v.text=="Fun" or v.text=="fun" or v.text=="FUN" or v.text=="function" or v.text=="Function" then
      editor.paste("function")
     else
      if v.text=="End" or v.text=="end" then
        editor.paste("end")
       else
        editor.paste(v.Text)
      end
    end
  end
end
function reopen(path)
  local f = io.open(path, "r")
  if f then
    local str = f:read("*all")
    if tostring(editor.getText()) ~= str then
      editor.setText(str, true)
    end
    f:close()
  end
end

ti1=Ticker()
ti1.Period=500
ti1.onTick=function()
  if file_name.Text:match("(.-).aly")~=nil then
    reopen("/storage/emulated/0/訫/项目/"..项目名称.."/"..file_name.Text)
  end
  保存()
  错误提示.setVisibility(View.GONE)
  local cc=editor.getText()
  luapath="/storage/emulated/0/訫/项目/"..项目名称.."/"..file_name.Text
  cc=cc.toString()
  if luapath:find("%.aly$") then
    cc="return "..cc
  end
  local _,data=loadstring(cc)
  if data then
    错误提示.setVisibility(View.VISIBLE)
    local _,_,line,data=data:find(".(%d+).(.+)")
    错误文字.text="发现错误：第"..line.."行   "..data
    return true
   elseif b then
   else
    错误提示.setVisibility(View.GONE)
  end
end

ti1.start()
function onKeyDown(code,event)
  if string.find(tostring(event),"KEYCODE_BACK") ~= nil then
    保存()
    ti1.stop()
    activity.finish()
  end
end
