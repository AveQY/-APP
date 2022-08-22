require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "function"
import "java.io.File"--导入File类
layout={
  LinearLayout;
  layout_height="fill";
  layout_width="fill";
  orientation="vertical";
  {
    TextView,
    layout_height="fill";
    layout_width="fill";
    text="这个家伙很懒(*꒦ິ⌓꒦ີ)还没有备份过布局~",
    gravity='center',
    id="ppp",
  },
  {
    LinearLayout;
    gravity="center";
    layout_height="fill";
    orientation="vertical";
    layout_alignParentBottom="true";
    layout_width="fill";
    {
      ListView;
      layout_gravity="end";
      layout_width="fill";
      layout_height="fill";
      id="备份列表";
      DividerHeight=0;
      layout_marginTop="5dp";
    };
  },
},

activity.setTitle("布局备份管理")
activity.setTheme(R.Theme_Black)
activity.setContentView(loadlayout(layout))

activity.ActionBar.setDisplayHomeAsUpEnabled(true)
function onOptionsItemSelected(item)
  if item.Title==nil then
    activity.finish()
  end
end


local item={
  LinearLayout;
  gravity="center";
  layout_width="fill";
  layout_height="fill";
  {
    LinearLayout;
    orientation="vertical";
    gravity="center";
    layout_width="fill";
    layout_height="70dp";
    {
      CardView;
      radius=20;
      CardElevation=0;
      layout_width="fill";
      layout_height="60dp";
      {
        LinearLayout;
        layout_width="match_parent";
        layout_height="match_parent";
        {
          LinearLayout;
          gravity="center";
          layout_width="8%h";
          layout_height="match_parent";
          {
            ImageView;
            src="res/file.png";
            layout_width="35dp";
            layout_height="35dp";
          };
        };
        {
          LinearLayout;
          orientation="vertical";
          layout_width="match_parent";
          layout_height="match_parent";
          {
            TextView;
            layout_marginTop="10dp";
            id="备份文件名";
            text="文件名";
          };
          {
            TextView;
            text="时间";
            id="备份时间";
            layout_marginTop="5dp";
          };
        };
      };
    };
  };
};
function GetFilelastTime(path)
  f = File(path);
  cal = Calendar.getInstance();
  time = f.lastModified()
  cal.setTimeInMillis(time);
  return cal.getTime().toLocaleString()
end
local function 刷新备份()
  sdata={}
  asdp=LuaAdapter(activity,sdata,item)
  备份列表.Adapter=asdp
  local a=luajava.astable(File("/storage/emulated/0/訫/布局备份").listFiles())
  if a[1]==nil then
   else
    ppp.setVisibility(View.GONE)
    for i=1,#a do
      if File("/storage/emulated/0/訫/布局备份/"..a[i].name).isFile() then
        asdp.add{备份文件名=a[i].name,备份时间=GetFilelastTime("/storage/emulated/0/訫/布局备份/"..a[i].name)}
      end
    end
  end
end
刷新备份()

function onCreateOptionsMenu(menu)
  menu.add("导入布局").onMenuItemClick=function(a)
    调用系统选择文件(function (a)
      name = File(a).getName()
      LuaUtil.copyDir(a,"/sdcard/訫/布局备份/"..name)
      Toast.makeText(activity,"导入成功", Toast.LENGTH_LONG).show()
      刷新备份()
    end)
  end
end

function 备份列表.onItemClick(l,v,p,i)
  local bt=v.tag.备份文件名.text
  对话框=AlertDialog.Builder(this)
  .setTitle("提示")
  .setMessage("是否导入此布局："..bt)
  .setPositiveButton("确定",{onClick=function(v)
      b=bt:match("(.+).VE")
      if b==nil then
        Toast.makeText(activity,"无法识别！请选择后缀.VE的文件", Toast.LENGTH_LONG).show()
       else
        os.execute("rm -r ".."/storage/emulated/0/訫/data/zip/")
        ZipUtil.unzip("/storage/emulated/0/訫/布局备份/"..bt,"/storage/emulated/0/訫/data/zip/")
        os.execute("rm -r ".."/storage/emulated/0/訫/data/temporary/")
        LuaUtil.copyDir("/sdcard/訫/data/zip/temporary","/sdcard/訫/data/temporary")
        os.execute("rm -r ".."/storage/emulated/0/訫/data/web/")
        LuaUtil.copyDir("/sdcard/訫/data/zip/web","/sdcard/訫/data/web")
        os.execute("rm -r ".."/storage/emulated/0/訫/data/video/")
        LuaUtil.copyDir("/sdcard/訫/data/zip/video","/sdcard/訫/data/video")
        LuaUtil.copyDir("/sdcard/訫/data/zip/layout.aly","/sdcard/訫/data/layout.aly")
        Toast.makeText(activity,"导入成功", Toast.LENGTH_LONG).show()
      end
    end})
  .setNegativeButton("取消",nil)
  .setNeutralButton("删除备份",{onClick=function(v)
      删除工程(bt)
    end})
  .show()
  对话框.create()
  Drawable_round(对话框.getWindow(),0xFFffffff)
end
function 删除工程(bt)
  dialog=AlertDialog.Builder(this)
  .setTitle("提示")
  .setMessage("此操作无法恢复！是否删除此备份："..bt)
  .setPositiveButton("确定",{onClick=function(v)
      os.remove("/storage/emulated/0/訫/布局备份/"..bt)
      刷新备份()
      Toast.makeText(activity,"删除成功", Toast.LENGTH_LONG).show()
    end})
  .setNegativeButton("取消",nil)
  .show()
  dialog.create()Drawable_round(dialog.getWindow(),0xFFffffff)
end