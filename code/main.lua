require "import"

import "android.app.*"

import "android.os.*"

import "android.widget.*"

import "android.view.*"

import 'function'

import "java.io.File"

activity.setTheme(R.Theme_Black)

activity.ActionBar.hide()

activity.setTitle("一键生成APP")

主路径="/sdcard/訫"

--[[

©--2022.8.23开源 

by訫念是你

源码可供参考,你也可以接手这个项目

]]

layout={

  LinearLayout;

  layout_height="match_parent";

  layout_width="match_parent";

  orientation="vertical";

  {

    CardView;

    CardElevation="0dp";

    layout_height="wrap_content";

    radius="0dp";

    layout_width="match_parent";

    backgroundColor="#ffffff";

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

          TextView;

          ellipsize="end";

          layout_width="match_parent";

          id="title";

          textSize="22dp";

          textColor="#000000",

          layout_marginLeft="15dp";

          singleLine=true;

          gravity="center|left";

          layout_height="match_parent";

          layout_weight="1";

          text="一键生成APP";

        };

      };

    };

  };

  {

    LinearLayout,--线性布局

    orientation="vertical",--布局方向

    layout_width="fill",--布局宽度

    layout_height="fill";

    backgroundColor='#ffffff';

    {

      ScrollView,--纵向滑动控件

      layout_width="fill",--布局宽度

      layout_height="fill",--布局高度

      overScrollMode=View.OVER_SCROLL_NEVER,--隐藏圆弧阴影

      verticalScrollBarEnabled=false,--隐藏纵向滑条

      {

        LinearLayout;

        layout_height="fill";

        orientation="vertical";

        layout_width="fill";

        gravity="center";

        backgroundColor='#ffffff';

        {

          TextView;

          layout_width="match_parent";

          layout_height="20%w";

          text="当前模板：图片模板",

          gravity="center";

          TextSize='6dp',

          gravity="center";

          layout_marginTop='100dp';

          id='main_title',

        };

        {

          CardView;--卡片控件

          layout_width='80%w';--卡片宽度

          layout_height='8%h';--卡片高度

          cardBackgroundColor='#ffffff';--卡片颜色

          layout_marginTop='10dp';--布局顶距

          layout_margin='1dp';--卡片边距

          cardElevation='0dp';--卡片阴影

          layout_gravity='center';--在父控件中的对齐方式

          radius='8dp';--卡片圆角

          id="ed1";

          {

            TextView;

            layout_width="match_parent";

            layout_height="fill";

            text="开始制作",

            gravity="center";

            TextSize='6dp',

          };

        },

        {

          CardView;--卡片控件

          layout_width='80%w';--卡片宽度

          layout_height='8%h';--卡片高度

          cardBackgroundColor='#ffffff';--卡片颜色

          layout_marginTop='10dp';--布局顶距

          layout_margin='1dp';--卡片边距

          cardElevation='0dp';--卡片阴影

          layout_gravity='center';--在父控件中的对齐方式

          radius='8dp';--卡片圆角

          id="ed2";

          {

            TextView;

            layout_width="match_parent";

            layout_height="fill";

            text="选择模板",

            gravity="center";

            TextSize='6dp',

          };

        },

        {

          CardView;--卡片控件

          layout_width='80%w';--卡片宽度

          layout_height='8%h';--卡片高度

          cardBackgroundColor='#ffffff';--卡片颜色

          layout_marginTop='10dp';--布局顶距

          layout_margin='1dp';--卡片边距

          cardElevation='0dp';--卡片阴影

          layout_gravity='center';--在父控件中的对齐方式

          radius='8dp';--卡片圆角

          id="ed5";

          onClick=function()

            activity.newActivity("main11")

          end,

          {

            TextView;

            layout_width="match_parent";

            layout_height="fill";

            text="我的软件",

            gravity="center";

            TextSize='6dp',

          };

        },

        {

          CardView;--卡片控件

          layout_width='80%w';--卡片宽度

          layout_height='8%h';--卡片高度

          cardBackgroundColor='#ffffff';--卡片颜色

          layout_marginTop='10dp';--布局顶距

          layout_margin='1dp';--卡片边距

          cardElevation='0dp';--卡片阴影

          layout_gravity='center';--在父控件中的对齐方式

          radius='8dp';--卡片圆角

          id="ed3";

          onClick=function()

            关于软件()

          end,

          {

            TextView;

            layout_width="match_parent";

            layout_height="fill";

            text="关于软件",

            gravity="center";

            TextSize='6dp',

          };

        },

        --[[

        {

          CardView;--卡片控件

          layout_width='80%w';--卡片宽度

          layout_height='8%h';--卡片高度

          cardBackgroundColor='#ffffff';--卡片颜色

          layout_marginTop='10dp';--布局顶距

          layout_margin='1dp';--卡片边距

          cardElevation='0dp';--卡片阴影

          layout_gravity='center';--在父控件中的对齐方式

          radius='8dp';--卡片圆角

          layout_marginBottom='30dp';--布局顶距

          id="ed4";

          onClick=function()

    require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import 'function'
import "java.io.File"
activity.setTheme(R.Theme_Black)
activity.ActionBar.hide()
activity.setTitle("一键生成APP")
主路径="/sdcard/訫"

--[[

©--2022.8.23开源 
by訫念是你

源码可供参考,你也可以接手这个项目

]]


layout={
  LinearLayout;
  layout_height="match_parent";
  layout_width="match_parent";
  orientation="vertical";
  {
    CardView;
    CardElevation="0dp";
    layout_height="wrap_content";
    radius="0dp";
    layout_width="match_parent";
    backgroundColor="#ffffff";
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
          TextView;
          ellipsize="end";
          layout_width="match_parent";
          id="title";
          textSize="22dp";
          textColor="#000000",
          layout_marginLeft="15dp";
          singleLine=true;
          gravity="center|left";
          layout_height="match_parent";
          layout_weight="1";
          text="一键生成APP";
        };
      };
    };
  };
  {
    LinearLayout,--线性布局
    orientation="vertical",--布局方向
    layout_width="fill",--布局宽度
    layout_height="fill";
    backgroundColor='#ffffff';

    {
      ScrollView,--纵向滑动控件
      layout_width="fill",--布局宽度
      layout_height="fill",--布局高度
      overScrollMode=View.OVER_SCROLL_NEVER,--隐藏圆弧阴影
      verticalScrollBarEnabled=false,--隐藏纵向滑条
      {
        LinearLayout;
        layout_height="fill";
        orientation="vertical";
        layout_width="fill";
        gravity="center";
        backgroundColor='#ffffff';


        {
          TextView;
          layout_width="match_parent";
          layout_height="20%w";
          text="当前模板：图片模板",
          gravity="center";
          TextSize='6dp',
          gravity="center";
          layout_marginTop='100dp';
          id='main_title',
        };
        {
          CardView;--卡片控件
          layout_width='80%w';--卡片宽度
          layout_height='8%h';--卡片高度
          cardBackgroundColor='#ffffff';--卡片颜色
          layout_marginTop='10dp';--布局顶距
          layout_margin='1dp';--卡片边距
          cardElevation='0dp';--卡片阴影
          layout_gravity='center';--在父控件中的对齐方式
          radius='8dp';--卡片圆角
          id="ed1";
          {
            TextView;
            layout_width="match_parent";
            layout_height="fill";
            text="开始制作",
            gravity="center";
            TextSize='6dp',
          };
        },
        {
          CardView;--卡片控件
          layout_width='80%w';--卡片宽度
          layout_height='8%h';--卡片高度
          cardBackgroundColor='#ffffff';--卡片颜色
          layout_marginTop='10dp';--布局顶距
          layout_margin='1dp';--卡片边距
          cardElevation='0dp';--卡片阴影
          layout_gravity='center';--在父控件中的对齐方式
          radius='8dp';--卡片圆角
          id="ed2";
          {
            TextView;
            layout_width="match_parent";
            layout_height="fill";
            text="选择模板",
            gravity="center";
            TextSize='6dp',
          };
        },

        {
          CardView;--卡片控件
          layout_width='80%w';--卡片宽度
          layout_height='8%h';--卡片高度
          cardBackgroundColor='#ffffff';--卡片颜色
          layout_marginTop='10dp';--布局顶距
          layout_margin='1dp';--卡片边距
          cardElevation='0dp';--卡片阴影
          layout_gravity='center';--在父控件中的对齐方式
          radius='8dp';--卡片圆角
          id="ed5";
          onClick=function()
            activity.newActivity("main11")
          end,
          {
            TextView;
            layout_width="match_parent";
            layout_height="fill";
            text="我的软件",
            gravity="center";
            TextSize='6dp',
          };
        },
        {
          CardView;--卡片控件
          layout_width='80%w';--卡片宽度
          layout_height='8%h';--卡片高度
          cardBackgroundColor='#ffffff';--卡片颜色
          layout_marginTop='10dp';--布局顶距
          layout_margin='1dp';--卡片边距
          cardElevation='0dp';--卡片阴影
          layout_gravity='center';--在父控件中的对齐方式
          radius='8dp';--卡片圆角
          id="ed3";
          onClick=function()
            关于软件()
          end,
          {
            TextView;
            layout_width="match_parent";
            layout_height="fill";
            text="关于软件",
            gravity="center";
            TextSize='6dp',
          };
        },
        --[[
        {
          CardView;--卡片控件
          layout_width='80%w';--卡片宽度
          layout_height='8%h';--卡片高度
          cardBackgroundColor='#ffffff';--卡片颜色
          layout_marginTop='10dp';--布局顶距
          layout_margin='1dp';--卡片边距
          cardElevation='0dp';--卡片阴影
          layout_gravity='center';--在父控件中的对齐方式
          radius='8dp';--卡片圆角
          layout_marginBottom='30dp';--布局顶距
          id="ed4";
          onClick=function()
            import "android.net.Uri"
            import "android.content.Intent"
            url="mqqapi://card/show_pslcard?src_type=internal&version=1&uin=177405076&card_type=group&source=qrcode"
            activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))

          end,
          {
            TextView;
            layout_width="match_parent";
            layout_height="fill";
            text="加入群聊",
            gravity="center";
            TextSize='6dp',
          };
        },
        --]]

      };
    };

  },
}
activity.setContentView(loadlayout(layout))

--activity.newActivity("AndLua/main")


卡片边框(ed1,3,0x40000000,0xFFFFFFFF,360);
卡片边框(ed2,3,0x40000000,0xFFFFFFFF,360);
卡片边框(ed3,3,0x40000000,0xFFFFFFFF,360);
--卡片边框(ed4,3,0x40000000,0xFFFFFFFF,360);
卡片边框(ed5,3,0x40000000,0xFFFFFFFF,360);

初始化()

当前版本=io.open(activity.getLuaDir().."/libs/about"):read("*a"):match('版本="(.-)"')

if io.open(主路径.."/data/about"):read("*a")~=当前版本
  关于软件()
end

ed1.onClick=function()
  main_t=main_title.Text:match('当前模板：(.+)')
  if main_t=='图片模板'
    os.execute("rm -r ".."/sdcard/訫/MyApp/")
    File(主路径.."/MyApp/").mkdirs()
    ZipUtil.unzip(activity.getLuaDir().."/libs/MyApp",主路径)
    LuaUtil.copyDir(activity.getLuaDir().."/res/icon.png",主路径.."/MyApp/icon.png")
    activity.newActivity('main5',{main_t})
   elseif main_t=='视频模板'
    os.execute("rm -r ".."/sdcard/訫/MyApp/")
    File(主路径.."/MyApp/").mkdirs()
    ZipUtil.unzip(activity.getLuaDir().."/libs/MyApp",主路径)
    LuaUtil.copyDir(activity.getLuaDir().."/res/icon.png",主路径.."/MyApp/icon.png")
    ZipUtil.unzip(activity.getLuaDir().."/libs/video",主路径.."/MyApp/")
    activity.newActivity('main5',{main_t})
   elseif main_t=='音乐模板'
    os.execute("rm -r ".."/sdcard/訫/MyApp/")
    File(主路径.."/MyApp/").mkdirs()
    ZipUtil.unzip(activity.getLuaDir().."/libs/MyApp",主路径)
    LuaUtil.copyDir(activity.getLuaDir().."/res/icon.png",主路径.."/MyApp/icon.png")
    ZipUtil.unzip(activity.getLuaDir().."/libs/Music template",主路径.."/MyApp/")
    activity.newActivity('main5',{main_t})
   elseif main_t=='工具模板+网抑云'
    os.execute("rm -r ".."/sdcard/訫/MyApp/")
    ZipUtil.unzip(activity.getLuaDir().."/libs/MyApp",主路径.."/")
    LuaUtil.copyDir(activity.getLuaDir().."/res/icon.png",主路径.."/MyApp/icon.png")
    ZipUtil.unzip(activity.getLuaDir().."/libs/music",主路径.."/MyApp/")
    activity.newActivity('main5',{main_t})
   elseif main_t=='网页模板'
    os.execute("rm -r ".."/sdcard/訫/MyApp/")
    ZipUtil.unzip(activity.getLuaDir().."/libs/web",主路径.."/")
    LuaUtil.copyDir(activity.getLuaDir().."/res/icon.png",主路径.."/MyApp/icon.png")
    activity.newActivity('main5',{main_t})
   elseif main_t=='密码模板+图片'
    os.execute("rm -r ".."/sdcard/訫/MyApp/")
    ZipUtil.unzip(activity.getLuaDir().."/libs/password",主路径.."/")
    LuaUtil.copyDir(activity.getLuaDir().."/res/icon.png",主路径.."/MyApp/icon.png")
    activity.newActivity('main6',{main_t})
   elseif main_t=='密码模板+视频'
    os.execute("rm -r ".."/sdcard/訫/MyApp/")
    ZipUtil.unzip(activity.getLuaDir().."/libs/password",主路径.."/")
    ZipUtil.unzip(activity.getLuaDir().."/libs/video",主路径.."/data/")
    LuaUtil.copyDir(主路径.."/data/main.lua",主路径.."/MyApp/main2.lua")
    os.execute("rm -r "..主路径.."/data/main.lua")
    LuaUtil.copyDir(activity.getLuaDir().."/res/icon.png",主路径.."/MyApp/icon.png")
    activity.newActivity('main6',{main_t})
   elseif main_t=='密码模板+网页'
    os.execute("rm -r ".."/sdcard/訫/MyApp/")
    ZipUtil.unzip(activity.getLuaDir().."/libs/password",主路径.."/")
    LuaUtil.copyDir(activity.getLuaDir().."/res/icon.png",主路径.."/MyApp/icon.png")
    activity.newActivity('main6',{main_t})
   elseif main_t=='密码模板+音乐'
    os.execute("rm -r ".."/sdcard/訫/MyApp/")
    ZipUtil.unzip(activity.getLuaDir().."/libs/password",主路径.."/")
    ZipUtil.unzip(activity.getLuaDir().."/libs/Music template",主路径.."/data/")
    LuaUtil.copyDir(主路径.."/data/main.lua",主路径.."/MyApp/main2.lua")
    os.execute("rm -r "..主路径.."/data/main.lua")
    LuaUtil.copyDir(主路径.."/data/layout.aly",主路径.."/MyApp/layout.aly")
    os.execute("rm -r "..主路径.."/data/layout.aly")
    LuaUtil.copyDir(主路径.."/data/music",主路径.."/MyApp/music/")
    os.execute("rm -r "..主路径.."/data/music/")
    LuaUtil.copyDir(activity.getLuaDir().."/res/icon.png",主路径.."/MyApp/icon.png")
    activity.newActivity('main6',{main_t})
   elseif main_t=='自定义模板'
    if io.open(主路径.."/data/状态"):read("*a")=="自定义模板" then
      activity.newActivity('main8',{main_t})
     else
      os.execute("rm -r ".."/sdcard/訫/MyApp/")
      ZipUtil.unzip(activity.getLuaDir().."/libs/customize",主路径.."/")
      LuaUtil.copyDir(activity.getLuaDir().."/res/icon.png",主路径.."/MyApp/icon.png")
      activity.newActivity('main8',{main_t})
    end
   elseif main_t=='游戏模板+五子棋'
    os.execute("rm -r ".."/sdcard/訫/MyApp/")
    File(主路径.."/MyApp/").mkdirs()
    ZipUtil.unzip(activity.getLuaDir().."/libs/MyApp",主路径)
    LuaUtil.copyDir(activity.getLuaDir().."/res/icon.png",主路径.."/MyApp/icon.png")
    ZipUtil.unzip(activity.getLuaDir().."/libs/game/wzq",主路径.."/MyApp/")
    activity.newActivity('main5',{main_t})
   elseif main_t=='游戏模板+井字棋'
    os.execute("rm -r ".."/sdcard/訫/MyApp/")
    File(主路径.."/MyApp/").mkdirs()
    ZipUtil.unzip(activity.getLuaDir().."/libs/MyApp",主路径)
    LuaUtil.copyDir(activity.getLuaDir().."/res/icon.png",主路径.."/MyApp/icon.png")
    ZipUtil.unzip(activity.getLuaDir().."/libs/game/jzq",主路径.."/MyApp/")
    activity.newActivity('main5',{main_t})
   elseif main_t=='游戏模板+别踩白块儿'
    os.execute("rm -r ".."/sdcard/訫/MyApp/")
    File(主路径.."/MyApp/").mkdirs()
    ZipUtil.unzip(activity.getLuaDir().."/libs/MyApp",主路径)
    LuaUtil.copyDir(activity.getLuaDir().."/res/icon.png",主路径.."/MyApp/icon.png")
    ZipUtil.unzip(activity.getLuaDir().."/libs/game/white/",主路径.."/MyApp/")
    activity.newActivity('main5',{main_t})
   elseif main_t=='编辑模板'
    activity.newActivity('AndLua/main',{main_t})
   else
    Toast.makeText(activity,"新版本略有改动,请重新选择模板", Toast.LENGTH_LONG).show()
  end
  io.open(主路径.."/data/状态","w"):write(main_t):close()
end

ed2.onClick=function()
  单选列表={}
  table.insert(单选列表,"图片模板")
  table.insert(单选列表,"视频模板")
  table.insert(单选列表,"音乐模板")
  table.insert(单选列表,"密码模板")
  table.insert(单选列表,"网页模板")
  table.insert(单选列表,"游戏模板")
  table.insert(单选列表,"工具模板")
  table.insert(单选列表,"自定义模板")
  table.insert(单选列表,"编辑模板")

  单选对话框=AlertDialog.Builder(this)
  .setTitle("选择模板")
  .setSingleChoiceItems(单选列表,-1,{onClick=function(v,p)
      标题=单选列表[p+1]
    end})
  .setPositiveButton("确定",{onClick=function(v)
      if 标题=="密码模板" then
        单选列表2={"图片","视频","网页","音乐"}
        单=AlertDialog.Builder(this)
        .setTitle("密码模板")
        .setSingleChoiceItems(单选列表2,-1,{onClick=function(v,p)标题2=单选列表2[p+1]end})
        .setPositiveButton("确定",{onClick=function(v)
            main_title.setText('当前模板：'..标题.."+"..标题2)
          end})
        .show();
        单.create()
        Drawable_round(单.getWindow(),0xFFffffff)
       elseif 标题=="游戏模板" then
        单选列表2={"五子棋","井字棋","别踩白块儿"}
        单=AlertDialog.Builder(this)
        .setTitle("游戏模板")
        .setSingleChoiceItems(单选列表2,-1,{onClick=function(v,p)标题2=单选列表2[p+1]end})
        .setPositiveButton("确定",{onClick=function(v)
            main_title.setText('当前模板：'..标题.."+"..标题2)
          end})
        .show();
        单.create()
        Drawable_round(单.getWindow(),0xFFffffff)
       elseif 标题=="工具模板" then
        单选列表2={"网抑云"}
        单=AlertDialog.Builder(this)
        .setTitle("工具模板")
        .setSingleChoiceItems(单选列表2,-1,{onClick=function(v,p)标题2=单选列表2[p+1]end})
        .setPositiveButton("确定",{onClick=function(v)
            main_title.setText('当前模板：'..标题.."+"..标题2)
          end})
        .show();
        单.create()
        Drawable_round(单.getWindow(),0xFFffffff)
       else
        main_title.setText('当前模板：'..标题)
      end
    end})
  .setNegativeButton("取消",nil)
  .show()
  单选对话框.create()
  Drawable_round(单选对话框.getWindow(),0xFFffffff)
end
        
