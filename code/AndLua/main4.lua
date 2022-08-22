require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "function"

activity.setTheme(R.Theme_Teal)
activity.setTitle("使用手册")
activity.ActionBar.hide()
activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
if tonumber(Build.VERSION.SDK) >= 23 then
  activity.getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
end
result = 0
resourceId = this.getResources().getIdentifier("status_bar_height", "dimen", "android");
if resourceId > 0 then
  result = this.getResources().getDimensionPixelSize(resourceId);
end


颜色1="0xff555555"--文字
颜色2="0xFFFFFFFF"--卡片
颜色3="0xFFFFFFFF"--背景

layout={DrawerLayout,id="mDrawer2"}
layout1={
  LinearLayout;
  layout_height="match_parent";
  layout_width="match_parent";
  orientation="vertical";
  {
    ListView;
    id="List";
    DividerHeight=0;
    verticalScrollBarEnabled=false;
    layout_gravity="end";
    layout_width="fill";
  },
};
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
          CardView;
          layout_width="60dp";
          layout_marginLeft="-15dp";
          CardElevation="0dp";
          radius="40dp";
          layout_height="60dp";
          UseCompatPadding=false;
          PreventCornerOverlap=false;
          background="0x00000000";
          onClick=function()
            activity.finish()
          end,
          {
            ImageView;
            padding="32dp";
            layout_width="match_parent";
            src="res/finish.png";
            layout_height="match_parent";
            layout_margin="-18dp";
            id="btn";
            background="#00000000";
          };
        };

        {
          RelativeLayout;
          layout_height="fill";
          layout_width="66%w";
          focusableInTouchMode=true;
          focusable=true;
          gravity="center|left";
          {
            EditText;
            layout_height="wrap";
            layout_width="fill";
            layout_centerHorizontal="true";
            id="edit";
            singleLine="true";
            background="0";
            gravity="center|left";
            textSize="15dp";
            textColor="#757575";
            layout_marginTop="10dp";
          };
          {
            TextView;
            layout_height="15dp";
            layout_width="fill";
            layout_alignBottom="edit";
            id="text";
            layout_centerHorizontal="true";
            background="#";
            layout_marginLeft="15dp";
            layout_marginRight="15dp";
          };
          {
            TextView;
            ellipsize="end";
            layout_width="match_parent";
            id="title";
            textSize="19dp";
            textColor=颜色1,
            layout_marginLeft="2dp";
            singleLine=true;
            gravity="center|left";
            layout_height="match_parent";
            layout_weight="1";
            text="使用手册";
          };
        },

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
            ImageView;
            padding="27dp";
            layout_width="match_parent";
            src="res/Search.png";
            layout_height="match_parent";
            layout_margin="-10dp";
            id="btn2";
            background="#00000000";
            ColorFilter=颜色4;
          };


        };
      };
    };
  };
  {
    PageView;
    id="huadong";
    layout_height="fill";
    pages={
      layout1;
    };
  };
};
item={
  LinearLayout;
  gravity="center";
  layout_width="fill";
  layout_height="fill";
  {
    LinearLayout;
    orientation="vertical";
    gravity="center";
    layout_width="fill";
    layout_height="100dp";
    {
      CardView;
      layout_margin='10dp';
      layout_gravity='center';
      Elevation='1dp';
      layout_width='95%w';
      layout_height='85dp';
      radius='8dp';
      CardBackgroundColor=颜色3;
      {
        LinearLayout;
        Orientation='horizontal';
        layout_gravity='right';
        layout_width='match_parent';
        layout_height='match_parent';
        {
          LinearLayout;
          Orientation='vertical';
          layout_gravity='right';
          layout_width='match_parent';
          layout_height='match_parent';
          layout_margin="10dp";
          {
            LinearLayout;
            layout_width='match_parent';
            layout_height='5%h';
            {
              TextView;
              layout_marginTop='2%h';
              layout_width='match_parent';
              layout_height='match_parent';
              Gravity='left|center';
              textColor=颜色1,
              id="标题";
              textSize='16sp';
            };
          };
          {
            LinearLayout;
            layout_width='match_parent';
            layout_height='7%h';
            {
              TextView;
              layout_width='match_parent';
              layout_height='match_parent';
              Gravity='left';
              textColor='#69000000';
              textSize='11sp';
              id="内容";
              MaxLines=2;
            };
          };
        };
      };
    };
  };
};
table.insert(layout,content)

activity.setContentView(loadlayout(layout))

控件消失(btn2)
edit.setOnFocusChangeListener{
  onFocusChange=function( v, hasFocus)
    if hasFocus==true then
      显示控件(btn2)
      import "android.view.animation.ScaleAnimation"
      text.startAnimation(ScaleAnimation(0.0,1.0,1.0,1.0,1,0.5,1,0.5).setDuration(200))
      text.setVisibility(View.VISIBLE)
      import "android.view.animation.TranslateAnimation"
      title.startAnimation(TranslateAnimation(0,0,0,-80).setDuration(100).setFillAfter(true))
     else
      显示控件(btn2)
      text.startAnimation(ScaleAnimation(1.0,0.0,1.0,1.0,1,0.5,1,0.5).setDuration(200))
      text.setVisibility(View.INVISIBLE)
      title.startAnimation(TranslateAnimation(0,0,-80,0).setDuration(100).setFillAfter(true))
    end
  end}

--搜索按钮
function btn2.onClick()
  if edit.Text=="" then
    title.startAnimation(TranslateAnimation(0,0,-20,0).setDuration(100).setFillAfter(true))
    edit.clearFocus()--关闭焦点
    控件消失(btn2)
   else
    data={}
    适配器=LuaAdapter(activity,data,item)
    List.Adapter=适配器
    for i=1,#标题适配器 do
      if string.find(标题适配器[i],edit.Text) then
        适配器.add{标题=标题适配器[i],内容=内容适配器[i]}
      end
    end
    edit.setText("")
    edit.clearFocus()--关闭焦点
    title.startAnimation(TranslateAnimation(0,0,-20,0).setDuration(100).setFillAfter(true))
    控件消失(btn2)
  end
end

title.getPaint().setFakeBoldText(true)

标题=io.open(activity.getLuaDir().."/libs/manual"):read("*a"):gmatch('《(.-)》')
内容=io.open(activity.getLuaDir().."/libs/manual"):read("*a"):gmatch('【(.-)】')

标题适配器={}
内容适配器={}
for i in 标题 do
  table.insert(标题适配器,i)
end
for i in 内容 do
  table.insert(内容适配器,i)
end

data={}
适配器=LuaAdapter(activity,data,item)
for i=1,#标题适配器 do
  适配器.add{标题=标题适配器[i],内容=内容适配器[i]}
end
List.Adapter=适配器


function List.onItemClick(l,v,p,i)
  bt=v.tag.标题.text
  local bj=v.tag.内容.text
  activity.newActivity("AndLua/main5",{bt,bj})
end



