require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "function"
import "java.io.File"
compile "libs/android-support-v4"
import "android.support.v4.widget.*"

result = 0
resourceId = this.getResources().getIdentifier("status_bar_height", "dimen", "android");
if resourceId > 0 then
  result = this.getResources().getDimensionPixelSize(resourceId);
end

颜色1="0xff555555"--文字
颜色2="0xFFFFFFFF"--卡片
颜色3="0xFFFFFFFF"--背景

import "java.lang.Thread"
import "com.androlua.LuaUtil"
import "com.androlua.LuaEditor"
import "com.androlua.LuaAdapter"
import "android.graphics.drawable.StateListDrawable"

layout={DrawerLayout,id="mDrawer"}

activity.setTheme(R.Theme_Teal)
activity.setTitle("AndLua")
activity.ActionBar.hide()
activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
if tonumber(Build.VERSION.SDK) >= 23 then
  activity.getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
end
function 配置文件()
  main_data={}
  main_adp=LuaAdapter(activity,main_data,main_datas)
  main1_list.Adapter=main_adp
  local a=luajava.astable(File("/storage/emulated/0/訫/项目/").listFiles())
  if a[1]==nil then
    控件消失(main_lay)
    显示控件(main_text1)
   else
    for i=1,#a do
      if File("/storage/emulated/0/訫/项目/"..a[i].name).isDirectory() then
        if File("/storage/emulated/0/訫/项目/"..a[i].name.."/main.lua").isFile() then
          if File("/storage/emulated/0/訫/项目/"..a[i].name.."/init.lua").isFile() then
            控件消失(main_text1)
            显示控件(main_lay)
            local b=io.open("/storage/emulated/0/訫/项目/"..a[i].name.."/init.lua"):read("*a")
            yz=io.open("/storage/emulated/0/訫/项目/"..a[i].name.."/init.lua"):read("*a")
            if yz:find("appcode") then
              d=b:match('appcode="(.-)"')
             else
              d="nil"
            end
            if yz:find("packagename") then
              c=b:match('packagename="(.-)"')
             else
              c="nil"
            end
            if File("/storage/emulated/0/訫/项目/"..a[i].name.."/icon.png").isFile() then
              main_adp.add{img="/storage/emulated/0/訫/项目/"..a[i].name.."/icon.png",text1=a[i].name,text2="包名："..c}
             else
              main_adp.add{text1=a[i].name,text2="包名："..c}
            end
          end
        end
      end
    end
  end
end

content={
  LinearLayout;
  layout_height="match_parent";
  layout_width="match_parent";
  orientation="vertical";
  {
    CardView;
    backgroundColor=颜色3;
    CardElevation="3dp";
    layout_height="wrap_content";
    radius="0dp";
    layout_width="match_parent";
    {
      LinearLayout;
      layout_width="match_parent";
      layout_marginTop=result;
      {
        LinearLayout;
        orientation="horizontal";
        layout_height="56dp";
        layout_width="match_parent";
        gravity="center";
        {
          LinearLayout;
          layout_height="match_parent";
          gravity="center";
          {
            CardView;
            layout_width="80dp";
            layout_marginLeft="-15dp";
            CardElevation="0dp";
            radius="40dp";
            layout_height="80dp";
            UseCompatPadding=false;
            PreventCornerOverlap=false;
            background="0x00000000";
            {
              ImageView;
              padding="32dp";
              layout_width="match_parent";
              src="res/icon.png";
              layout_height="match_parent";
              layout_margin="-10dp";
              id="btn";
              background="#00000000";
            };
          };
        };
        {
          TextView;
          ellipsize="end";
          layout_width="match_parent";
          id="title";
          textSize="19dp";
          textColor=颜色1,
          layout_marginLeft="-15dp";
          singleLine=true;
          gravity="center|left";
          layout_height="match_parent";
          layout_weight="1";
          text="编辑模板";
        };
        {
          CardView;
          layout_width="65dp";
          radius="33dp";
          CardElevation="0dp";
          layout_marginRight="-17dp";
          layout_height="65dp";
          UseCompatPadding=false;
          PreventCornerOverlap=false;
          background="#00000000";
          {
            ImageView;
            padding="27dp";
            layout_width="match_parent";
            src="res/Add.png";
            layout_height="match_parent";
            layout_margin="-10dp";
            id="btn1";
            background="#00000000";
          };
        };
        {
          CardView;
          layout_width="65dp";
          radius="33dp";
          CardElevation="0dp";
          layout_marginRight="-19dp";
          layout_height="65dp";
          UseCompatPadding=false;
          PreventCornerOverlap=false;
          background="#00000000";
          {
            ImageView;
            padding="27dp";
            layout_width="match_parent";
            src="res/Teach2.png";
            layout_height="match_parent";
            layout_margin="-10dp";
            id="btn2";
            background="#00000000";
          };
        };
        {
          CardView;
          layout_width="65dp";
          radius="33dp";
          CardElevation="0dp";
          layout_marginRight="-10dp";
          layout_height="65dp";
          UseCompatPadding=false;
          PreventCornerOverlap=false;
          background="#00000000";
          {
            TextView;
            layout_marginLeft="-150dp";
            layout_width="0dp";
            layout_marginTop="60dp";
            backgroundColor="#7BC8A5";
            layout_height="0dp";
            id="menu";
          };
          {
            ImageView;
            padding="27dp";
            layout_width="match_parent";
            src="res/Other.png";
            layout_height="match_parent";
            layout_margin="-10dp";
            id="btn3";
            background="#00000000";
          };
        };
      };
    };
  };
  {
    SwipeRefreshLayout;
    id="sx";
    {
      LinearLayout;
      orientation="vertical";
      layout_width="match_parent";
      gravity="center";
      layout_height="match_parent";
      backgroundColor=颜色3;
      {
        TextView;
        id="main_text1";
        text="你还没有创建工程，这里空空的~";
        textSize="16sp";
        textColor=颜色1,
      };
      {
        LinearLayout;
        orientation="vertical";
        layout_width="fill";
        layout_height="fill";
        id="main_lay";
        {
          LinearLayout;
          gravity="center";
          layout_height="fill";
          layout_width="fill";
          backgroundColor=颜色3;
          {
            LinearLayout;
            layout_height="fill";
            layout_width="fill";
            {
              ListView;
              id="main1_list";
              DividerHeight=0;
              verticalScrollBarEnabled=false;
              layout_gravity="end";
              layout_width="fill";
            };
          },
        },
      };
    };
  };
};

table.insert(layout,content)

activity.setContentView(loadlayout(layout))

title.getPaint().setFakeBoldText(true)
sx.setColorSchemeColors({颜色1});
sx.setProgressBackgroundColorSchemeColor(0xffffffff);
sx.setOnRefreshListener(SwipeRefreshLayout.OnRefreshListener{onRefresh=function()
    配置文件()
    sx.setRefreshing(false);
  end})

RippleHelper(btn1).RippleColor=0x25000000
RippleHelper(btn2).RippleColor=0x25000000
RippleHelper(btn3).RippleColor=0x25000000

main_datas={
  LinearLayout;
  gravity="center|top";
  orientation="vertical";
  layout_width="match_parent";
  {
    CardView;
    layout_margin="10dp";
    backgroundColor=颜色2;
    layout_width="match_parent";
    layout_height="75dp";
    radius="18dp";
    {
      LinearLayout;
      layout_width="match_parent";
      layout_height="match_parent";
      backgroundColor="0x00000000";
      {
        ImageView;
        layout_width="70dp";
        layout_height="match_parent";
        layout_margin="10dp";
        src="icon.png";
        id="img",
      };
      {
        LinearLayout;
        layout_width="match_parent";
        layout_height="match_parent";
        orientation="vertical";
        backgroundColor="0x00000000";
        {
          TextView;
          textColor=颜色1;
          layout_height="30dp";
          layout_width="match_parent";
          text="软件名称";
          textSize="16sp";
          gravity="center|left";
          id="text1",
          layout_marginTop="10dp";
          MaxLines=1;
        };
        {
          TextView;
          layout_height="match_parent";
          textColor=颜色1;
          layout_width="match_parent";
          text="包名：";
          textSize="13sp";
          gravity="center|left|top";
          id="text2",
        };
      };
    };
  };
};

配置文件()

main1_list.onItemLongClick=function(l,v,p,i)
  项目名称=v.Tag.text1.Text
  项目包名=v.Tag.text2.Text
  确认删除=[[os.execute("rm -r ".."/storage/emulated/0/訫/项目/"..项目名称) ]]..'配置文件() xxx.dismiss()'
  取消删除=[[xxx.dismiss()]]
  弹窗UI("提示","项目名称："..项目名称.."\n\n项目包名:"..项目包名.."\n\n确定删除？",确认删除,取消删除,"取消","确定")
  return true
end
main1_list.onItemClick=function(p,v,i,s)
  项目名称=v.Tag.text1.Text
  activity.newActivity("AndLua/main2",{项目名称})
end

function btn.onClick()
  mDrawer.openDrawer(3)
end
function btn1.onClick()
  Download_layout={
    LinearLayout;
    gravity="center";
    layout_width="fill";
    layout_height="fill";
    {
      LinearLayout;
      orientation="vertical";
      layout_width="fill";
      layout_height="260dp";
      {
        TextView;
        layout_marginTop="15dp";
        layout_marginLeft="20dp";
        textSize="20sp";
        textColor="0xFF757575";
        text="新建工程";
      };
      {
        LinearLayout;
        orientation="vertical";
        layout_width="match_parent";
        layout_height="75dp";
        gravity="center";
        {
          TextView;
          id="Prompt",
          textSize="15sp",
          layout_marginTop="10dp";
          layout_marginLeft="3dp",
          layout_width="80%w";
          layout_gravity="center",
          text="软件名称:";
        };
        {
          EditText;
          layout_marginTop="0dp",
          layout_width="320dp";
          gravity="center|leaf";
          textSize="15sp";
          text="我的软件";
          id="输入名称",
          textColor=颜色4,
          HintTextColor=颜色4,
        };
      };
      {
        LinearLayout;
        orientation="vertical";
        layout_width="match_parent";
        layout_height="75dp";
        gravity="center";
        {
          TextView;
          id="Prompt",
          textSize="15sp",
          layout_marginTop="5dp";
          layout_marginLeft="3dp",
          layout_width="80%w";
          layout_gravity="center",
          text="软件包名:";
        };
        {
          EditText;
          layout_marginTop="0dp",
          layout_width="320dp";
          gravity="center|leaf";
          textSize="15sp";
          id="输入包名",
          hintTextColor=颜色4,
          textColor=颜色4,
          text="com.ve.Myapp";
        };
      };
      {
        LinearLayout;
        layout_height="match_parent";
        layout_width="match_parent";
        {
          Button;
          id="取消创建工程",
          layout_gravity="center";
          layout_marginLeft="10dp";
          textColor="0x7E000000";
          text="取消";
          layout_marginBottom="5dp",
          layout_height="40dp";
        };
        {
          LinearLayout;
          gravity="right";
          layout_width="match_parent";
          layout_height="match_parent";
          {
            Button;
            layout_height="40dp";
            id="确定创建工程",
            layout_marginBottom="5dp",
            layout_gravity="center";
            layout_marginRight="10dp";
            textColor="0xFF03A97D";
            text="创建";
          };
        };
      };
    };
  };

  dialog=AlertDialog.Builder(this)
  .setView(loadlayout(Download_layout))
  .show()
  控件圆角(确定创建工程,20,0x12000000)
  控件圆角(取消创建工程,20,0x12000000)
  dialog.create()
  Drawable_round(dialog.getWindow(),0xFFffffff)
  function 确定创建工程.onClick()
    if #输入名称.text~=0 then
      if #输入包名.text~=0 then
        if File("/storage/emulated/0/訫/项目/"..输入名称.Text).isDirectory() then
          弹窗("工程已存在")
         else
          main=[[
require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "loadlayout"
import "loadmenu"
import "loadbitmap"
--上面工程配置文件,别乱动
import "VE"--导入中文函数
import "layout"--导入布局

activity.setTitle("标题")--软件内标题
activity.setTheme(R.AndLua18)--主题颜色1~18
activity.setContentView(loadlayout(layout))--设置布局

--不会用先看『使用手册』

弹窗("你好,世界！")

]]
          init=[[--软件名称
appname="我的软件"
--包名
packagename="com.Myapp.demo"
--版本号
appver="1.0"
appcode="1"
appsdk="15"
debugmode=false
--应用权限
user_permission={
  "INTERNET",
  "WRITE_EXTERNAL_STORAGE",
}
skip_compilation={
}
]]
          layout1=[[
{
  AbsoluteLayout;
  layout_height="fill";
  layout_width="fill";
};
]]

          File("/storage/emulated/0/訫/项目/"..输入名称.Text).mkdirs()
          main1=string.gsub(main,"Myapp",输入名称.Text)
          io.open("/storage/emulated/0/訫/项目/"..输入名称.Text.."/main.lua","w"):write(main1):close()
          init1=string.gsub(init,'appname="我的软件"','appname="'..输入名称.Text..'"')
          init2=string.gsub(init1,"com.Myapp.demo",输入包名.Text)
          io.open("/storage/emulated/0/訫/项目/"..输入名称.Text.."/init.lua","w"):write(init2):close()
          io.open("/storage/emulated/0/訫/项目/"..输入名称.Text.."/layout.aly","w"):write(layout1):close()
          LuaUtil.copyDir(activity.getLuaDir().."/res/icon.png","/storage/emulated/0/訫/项目/"..输入名称.Text.."/icon.png")
          LuaUtil.copyDir(activity.getLuaDir().."/VE.lua","/storage/emulated/0/訫/项目/"..输入名称.Text.."/VE.lua")
          task(10,function()
            if File("/storage/emulated/0/訫/项目/"..输入名称.Text).isDirectory() then
              弹窗("创建成功")
              配置文件()
              dialog.dismiss()
              activity.newActivity("AndLua/main2",{输入名称.Text})
             else 弹窗("创建失败")
            end
          end)
        end
       else
        弹窗("请输入软件包名")
      end
     else
      弹窗("请输入软件名称")
    end
  end
  function 取消创建工程.onClick()
    dialog.dismiss()
  end
end
function btn2.onClick()--中文手册
  activity.newActivity("AndLua/main4")
end

pop=PopupMenu(activity,menu)
menu=pop.Menu
menu.add("备份管理").onMenuItemClick=function(v)
  activity.newActivity("AndLua/main3")
end
menu.add("导入工程").onMenuItemClick=function(v)
  调用系统选择文件(function (a)
    import "java.io.File"--导入File类
    b=File(a).getName()
    ZipUtil.unzip(a,"/storage/emulated/0/訫/项目/"..b)
    LuaUtil.copyDir(activity.getLuaDir().."/VE.lua","/sdcard/訫/项目/"..b.."/VE.lua")
    配置文件()
  end)
end
btn3.onClick=function()
  pop.show()
end
