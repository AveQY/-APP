require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "function"
import "java.io.File"
activity.setTheme(R.Theme_Black)
--隐藏标题栏
activity.ActionBar.hide()

主路径="/sdcard/訫"

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
          text=...;
        };

        {
          CardView;
          layout_width="65dp";
          radius="33dp";
          CardElevation="0dp";
          layout_marginRight="0dp";
          layout_height="65dp";
          UseCompatPadding=false;
          PreventCornerOverlap=false;
          background="#00000000";
          {
            ImageView;
            padding="27dp";
            layout_width="match_parent";
            src="res/ic_arrow_forward_black_24dp.png";
            layout_height="match_parent";
            layout_margin="-10dp";
            id="btn";
            background="#00000000";
            --ColorFilter=颜色4;
          };
        };
      };
    };
  };
  {
    LinearLayout,--线性布局
    orientation="vertical",--布局方向
    layout_width="fill",--布局宽度
    layout_height="fill",--布局高度
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
        gravity="center|top";
        backgroundColor='#ffffff';
        {
          TextView;
          layout_width="match_parent";
          layout_height="30dp";
          text="软件名称：",
          gravity="center|left";
          layout_marginTop='20dp';--布局顶距
          TextSize='9dp',
          layout_marginLeft='15dp';--布局顶距
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
            EditText;--编辑框控件
            layout_width='fill';--控件宽度
            layout_height='fill';--控件高度
            layout_margin='0dp';--控件外边距
            id='edit1';--设置控件ID
            layout_marginRight='5dp';--布局顶距
            layout_marginLeft='15dp';--布局顶距
            Hint=' 请输入软件名称';--编辑框内容为空时提示文字
            textSize='16sp';--本文大小
            textColor='#000000';--本文颜色
            gravity='center|left';--重力
            background='#00ffffff';--底条透明
            singleLine=true;--设置单行输入
            text="我的软件"
          };
        };

        {
          TextView;
          layout_width="match_parent";
          layout_height="30dp";
          text="版本：",
          gravity="center|left";
          TextSize='9dp',
          layout_marginTop='10dp';--布局顶距
          layout_marginLeft='15dp';--布局顶距
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
          id="ed2";
          {
            EditText;--编辑框控件
            layout_width='fill';--控件宽度
            layout_height='fill';--控件高度
            layout_margin='0dp';--控件外边距
            id='edit2';--设置控件ID
            layout_marginRight='5dp';--布局顶距
            layout_marginLeft='15dp';--布局顶距
            Hint=' 请输入软件版本';--编辑框内容为空时提示文字
            textSize='16sp';--本文大小
            textColor='#000000';--本文颜色
            gravity='center|left';--重力
            background='#00ffffff';--底条透明
            singleLine=true;--设置单行输入
            text="1.0"
          };
        };

        {
          TextView;
          layout_width="match_parent";
          layout_height="30dp";
          text="包名：",
          gravity="center|left";
          TextSize='9dp',
          layout_marginTop='10dp';--布局顶距
          layout_marginLeft='15dp';--布局顶距
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
          id="ed3";
          {
            EditText;--编辑框控件
            layout_width='fill';--控件宽度
            layout_height='fill';--控件高度
            layout_margin='0dp';--控件外边距
            id='edit3';--设置控件ID
            layout_marginRight='5dp';--布局顶距
            layout_marginLeft='15dp';--布局顶距
            Hint=' 请输入软件包名';--编辑框内容为空时提示文字
            textSize='16sp';--本文大小
            textColor='#000000';--本文颜色
            gravity='center|left';--重力
            background='#00ffffff';--底条透明
            singleLine=true;--设置单行输入
            text="com.myapp"
          };
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
          id="ed4";
          {
            TextView;
            layout_width="match_parent";
            layout_height="fill";
            text="开始布局",
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
          id="ed5";
          {
            TextView;
            layout_width="match_parent";
            layout_height="fill";
            text="创建新界面",
            gravity="center";
            TextSize='6dp',
          };
        },
]]
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
          id="ed6";
          {
            TextView;
            layout_width="match_parent";
            layout_height="fill";
            text="恢复默认设置",
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
          id="ed7";
          layout_marginBottom='30dp';--布局顶距
          {
            TextView;
            layout_width="match_parent";
            layout_height="fill";
            text="布局备份管理",
            gravity="center";
            TextSize='6dp',
          };
        },
      };
    };

  },
}
activity.setContentView(loadlayout(layout))


卡片边框(ed1,3,0x40000000,0xFFFFFFFF,360);
卡片边框(ed2,3,0x40000000,0xFFFFFFFF,360);
卡片边框(ed3,3,0x40000000,0xFFFFFFFF,360);
卡片边框(ed4,3,0x40000000,0xFFFFFFFF,360);
--卡片边框(ed5,3,0x40000000,0xFFFFFFFF,360);
卡片边框(ed6,3,0x40000000,0xFFFFFFFF,360);
卡片边框(ed7,3,0x40000000,0xFFFFFFFF,360);

init=io.open(主路径.."/MyApp/init.lua"):read("*a")
edit1.setText(init:match('appname="(.-)"'))
edit2.setText(init:match('appver="(.-)"'))
edit3.setText(init:match('packagename="(.-)"'))

function 点击事件载入()
  local a=luajava.astable(File(主路径.."/data/temporary").listFiles())
  if a[1]==nil then
   else
    临时文本="\n"
    for i=1,#a do
      if File(主路径.."/data/temporary/"..a[i].name).isFile() then
        临时文本2=io.open(主路径.."/data/temporary/"..a[i].name):read("*a")
        临时文本=临时文本.."\n"..a[i].name..".onClick=function()\n"..临时文本2.."end\n"
        os.execute("rm -r "..主路径.."/data/temporary/"..a[i].name)
      end
    end
    io.open(主路径.."/MyApp/main.lua","a+"):write(临时文本):close()
  end
end
function 浏览器载入()
  local a=luajava.astable(File(主路径.."/data/web").listFiles())
  if a[1]==nil then
   else
    web临时文本="\n"
    for i=1,#a do
      if File(主路径.."/data/web/"..a[i].name).isFile() then
        web临时文本2=io.open(主路径.."/data/web/"..a[i].name):read("*a")
        web临时文本=web临时文本.."\n"..a[i].name..".loadUrl('"..web临时文本2.."')\n"
        os.execute("rm -r "..主路径.."/data/web/"..a[i].name)
      end
    end
    io.open(主路径.."/MyApp/main.lua","a+"):write(web临时文本):close()
  end
end
function video载入()
  local a=luajava.astable(File(主路径.."/data/video").listFiles())
  if a[1]==nil then
   else
    vi临时文本='\nimport "android.media.MediaPlayer"\n'
    for i=1,#a do
      if File(主路径.."/data/video/"..a[i].name).isFile() then
        vi路径=io.open(主路径.."/data/video/"..a[i].name):read("*a")
        main_vi=io.open(activity.getLuaDir().."/libs/customize_video"):read("*a")
        vi文本=main_vi:gsub("vidoo",a[i].name)
        vi文本=vi文本:gsub("路径","/video/"..vi路径..".mp4")
        vi临时文本=vi临时文本.."\n"..vi文本
        os.execute("rm -r "..主路径.."/data/video/"..a[i].name)
      end
    end
    io.open(主路径.."/MyApp/main.lua","a+"):write(vi临时文本):close()
  end
end

btn.onClick=function()--生成
  if io.open("/sdcard/訫/data/生成提示"):read("*a")~="不再提示" then
    dialog2=AlertDialog.Builder(this)
    .setTitle("提示")
    .setMessage("是否跳转生成界面？一旦操作,布局设置的事件将写入软件并清空,下次布局仍需重写事件。\n\n建议先备份布局(已支持备份事件)")
    .setPositiveButton("确定",{onClick=function(v)
        浏览器载入()
        点击事件载入()
        video载入()
        io.open(主路径.."/MyApp/init","w"):write(edit1.Text):close()
        LuaUtil.copyDir(activity.getLuaDir().."/res/icon.png",主路径.."/MyApp/icon.png")
        generate()
      end})
    .setNegativeButton("取消",nil)
    .setNeutralButton("不再提示并进入",{onClick=function(v)
        io.open("/sdcard/訫/data/生成提示",'w'):write("不再提示"):close()
        浏览器载入()
        点击事件载入()
        video载入()
        io.open(主路径.."/MyApp/init","w"):write(edit1.Text):close()
        LuaUtil.copyDir(activity.getLuaDir().."/res/icon.png",主路径.."/MyApp/icon.png")
        generate()
      end})
    .show()
    dialog2.create()
    Drawable_round(dialog2.getWindow(),0xFFffffff)
   else
    浏览器载入()
    点击事件载入()
    video载入()
    io.open(主路径.."/MyApp/init","w"):write(edit1.Text):close()
    LuaUtil.copyDir(activity.getLuaDir().."/res/icon.png",主路径.."/MyApp/icon.png")
    generate()
  end
end

ed4.onClick=function()--开始布局
  if io.open(主路径.."/data/layout.aly")==nil then
    LuaUtil.copyDir(主路径.."/MyApp/layout.aly",主路径.."/data/layout.aly")
    activity.newActivity("main10", {"自定义模板" ,主路径.."/data/layout.aly"})
   else
    activity.newActivity("main10", {"自定义模板" ,主路径.."/data/layout.aly"})
  end
end


ed6.onClick=function()--恢复默认
  os.execute("rm -r "..主路径.."/MyApp/")
  ZipUtil.unzip(activity.getLuaDir().."/libs/customize",主路径.."/")
  LuaUtil.copyDir(主路径.."/MyApp/layout.aly",主路径.."/data/layout.aly")
  activity.recreate()
  Toast.makeText(activity,"已恢复", Toast.LENGTH_LONG).show()
end

ed7.onClick=function()--布局备份
  activity.newActivity("main9")
end