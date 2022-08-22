require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "function"

import "android.graphics.drawable.ColorDrawable"
import "android.graphics.drawable.StateListDrawable"
import "android.graphics.PorterDuffColorFilter"
import "android.graphics.PorterDuff"

颜色1="#555555"--文字
颜色2="0x69E7EBEC"
颜色3="0xffffffff"

result = 0
resourceId = this.getResources().getIdentifier("status_bar_height", "dimen", "android");
if resourceId > 0 then
  result = this.getResources().getDimensionPixelSize(resourceId);
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
      layout_marginTop=result;
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
              padding="38dp";
              src="res/finish.png";
              layout_margin="-10dp";
              layout_height="match_parent";
            };
          };
        };
        {
          LinearLayout;
          orientation="vertical";
          layout_height="match_parent";
          layout_width="52%w";
          {
            TextView;
            layout_weight="1";
            textSize="19dp";
            layout_width="match_parent";
            layout_height="match_parent";
            textColor="0xff303030";
            gravity="center|left";
            id="main2_title";
            ellipsize="end";
            singleLine=true;
            text="手册笔记";
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
      LinearLayout;
      orientation="vertical";
      {
        LuaEditor;
        layout_weight=1;
        id="editor";
        background="0xFFD8DFC3";
        layout_width="fill";
        layout_height="fill";
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

layout={DrawerLayout,id="mDrawer2"}
activity.setTheme(R.Theme_Teal)
activity.ActionBar.hide()
activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
if tonumber(Build.VERSION.SDK) >= 23 then
  activity.getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
end
table.insert(layout,content2)
table.insert(layout,drawer2)
activity.setContentView(loadlayout(layout))

教程名称,editor.Text=...
main2_title.setText(教程名称)

function main2_btn.onClick()
  activity.finish()
end
function main2_btn2.onClick()
  editor.format()
end
function main2_btn3.onClick()--运行
  activity.newActivity("AndLua/main6",{editor.Text})
end

