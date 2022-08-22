require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "function"

--[[

©--2022.8.23开源 
by訫念是你

]]

layout={
  LinearLayout;
  layout_height="fill";
  layout_width="fill";
  orientation="vertical";
  {
    TextView,
    layout_height="fill";
    layout_width="fill";
    text="这个家伙很懒(*꒦ິ⌓꒦ີ)还没有备份过项目~",
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

activity.setTitle("备份管理")
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
            src="res/folder.png";
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
  local a=luajava.astable(File("/storage/emulated/0/訫/备份").listFiles())
  if a[1]==nil then
   else
    ppp.setVisibility(View.GONE)
    for i=1,#a do
      if File("/storage/emulated/0/訫/备份/"..a[i].name).isFile() then
        asdp.add{备份文件名=a[i].name,备份时间=GetFilelastTime("/storage/emulated/0/訫/备份/"..a[i].name)}
      end
    end
  end
end
刷新备份()
function 备份列表.onItemClick(l,v,p,i)
  local bt=v.tag.备份文件名.text
  AlertDialog.Builder(this)
  .setTitle("提示")
  .setMessage("是否导入此备份："..bt)
  .setPositiveButton("确定",{onClick=function(v)
      b=bt:match("(.-).VE")
      if b==nil then
        Toast.makeText(activity,"无法识别！请选择后缀.VE的文件", Toast.LENGTH_LONG).show()
       else
        ZipUtil.unzip("/storage/emulated/0/訫/备份/"..bt,"/storage/emulated/0/訫/项目/"..b)
        弹窗("导入成功！")
      end
    end})
  .setNegativeButton("取消",nil)
  .setNeutralButton("删除工程",{onClick=function(v)
      删除工程(bt)
    end})
  .show()
end
function 删除工程(bt)
  dialog=AlertDialog.Builder(this)
  .setTitle("提示")
  .setMessage("此操作无法恢复！是否删除此备份："..bt)
  .setPositiveButton("确定",{onClick=function(v)
      os.remove("/storage/emulated/0/訫/备份/"..bt)
      刷新备份()
      弹窗("删除成功")
    end})
  .setNegativeButton("取消",nil)
  .show()
  dialog.create()
end