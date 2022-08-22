require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "function"
import "bin"

主路径="/sdcard/訫"

--[[

©--2022.8.23开源 
by訫念是你

]]

activity.setTheme(R.Theme_Black)
activity.ActionBar.hide()
layout={
  FrameLayout;
  layout_height="fill";
  layout_width="fill";
  backgroundColor="#ffffff";
  {
    FrameLayout;
    backgroundColor="#ffffff";
    layout_height="fill";
    layout_width="fill";
    {
      ImageView;
      layout_marginLeft="190dp";
      layout_height="200dp";
      scaleType="fitXY";
      src="res/ac.png";
      layout_width="200dp";
      layout_marginBottom="100dp";
    };
  };
  {
    CardView;
    layout_height="38%w";
    layout_width="80%w";
    radius="18dp";
    layout_gravity='center';--在父控件中的对齐方式
    backgroundColor="#ffffff";
    layout_marginTop='-100dp';--布局顶距
    {
      LinearLayout;
      layout_height="fill";
      layout_width="fill";
      {
        LinearLayout;
        layout_height="fill";
        layout_width="30%w";
        orientation="vertical";
        {
          ImageView;
          src=主路径.."/MyApp/icon.png";
          layout_margin="15dp";
          layout_width="20%w";
          layout_height="20%w";
          scaleType='fitXY';--图片显示类型
          id='icon',
        };
        {
          TextView;
          layout_width="match_parent";
          layout_height="match_parent";
          text="恢复默认图标",
          gravity="center|top";
          TextSize='5dp',
          onClick=function()
            LuaUtil.copyDir(activity.getLuaDir().."/res/icon.png",主路径.."/MyApp/icon.png")
            icon.setImageBitmap(loadbitmap(主路径.."/MyApp/icon.png"))
            Toast.makeText(activity,"已恢复", Toast.LENGTH_LONG).show()
          end,
        };
      };
      {
        TextView;
        layout_width="match_parent";
        layout_height="match_parent";
        text="软件名称：\n\n软件版本：\n\n包名：",
        gravity="center|left|top";
        TextSize='5dp',
        id='text',
        layout_marginTop="16dp";
      };
    };
  };

  {
    CardView;--卡片控件
    layout_width='80%w';--卡片宽度
    layout_height='8%h';--卡片高度
    cardBackgroundColor='#ffffff';--卡片颜色
    layout_marginTop='50dp';--布局顶距
    layout_margin='1dp';--卡片边距
    cardElevation='0dp';--卡片阴影
    layout_gravity='center';--在父控件中的对齐方式
    radius='8dp';--卡片圆角
    id="main2_ed1";
    {
      TextView;
      layout_width="match_parent";
      layout_height="fill";
      text="确定生成",
      gravity="center";
      TextSize='6dp',
    };
  },
};

activity.setContentView(loadlayout(layout))

卡片边框(main2_ed1,3,0x40000000,0xFFFFFFFF,360);

M=...
name=M:match('N【(.-)】')
version=M:match('V【(.-)】')
Baoming=M:match('B【(.-)】')

text.setText('软件名称：'..name..'\n\n软件版本：'..version..'\n\n包名：'..Baoming)

main2_ed1.onClick=function()
  bin(主路径.."/MyApp/",主路径.."/"..name..version..".apk")
end

icon.onClick=function()
  Toast.makeText(activity,"请选择图片", Toast.LENGTH_LONG).show()
  调用系统选择文件(function (a)
    LuaUtil.copyDir(a,主路径.."/MyApp/icon.png")
    icon.setImageBitmap(loadbitmap(a))
    Toast.makeText(activity,"设置完成", Toast.LENGTH_LONG).show()
  end)
end