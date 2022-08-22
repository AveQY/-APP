require "import"
import "android.app.*"
import "android.os.*"
import "java.io.*"
import "android.widget.*"
import "android.view.*"
import "android.content.*"
import "com.androlua.*"
import "android.graphics.Color"
import "android.graphics.drawable.GradientDrawable"
import "android.net.Uri"
import "com.androlua.LuaUtil"
import 'android.graphics.*'
import "android.content.*"
import "android.net.*"
import "android.content.Intent"
import "android.graphics.PorterDuffColorFilter"
import "java.io.FileInputStream"
import "android.graphics.drawable.Drawable"

--[[
改了很多地方，深深的限制用户使用,但还是被玩出bug(￢_￢)

©--2022.8.23开源 
by訫念是你

]]

layout={main={LinearLayout,orientation="vertical",},
  ck={LinearLayout;{ RadioGroup;layout_weight="1";id="ck_rg"; }; { Button; Text="确定"; layout_gravity="right"; id="ck_bt"; }; orientation="vertical"; };}
luadir,luapath=...
luadir=luadir or luapath:gsub("/[^/]+$","")
package.path=package.path..";"..luadir.."/?.lua;"

import "loadlayout2"
import "xml2table"
import "main10_function"

if luapath:find("%.aly$") then
  local f=io.open(luapath)
  local s=f:read("*a")
  f:close()
  xpcall(function()
    layout.main=assert(loadstring("return "..s))()
  end,
  function()
    Toast.makeText(activity,"布局错误,请重新布局",1000).show()
  end)
  showsave=true
end
activity.ActionBar.setDisplayHomeAsUpEnabled(true)
lua = luapath:match(luadir .. "(.+)")
activity.setTitle("自定义模板")

主色=0xff1e8ae8;
副色=0xFFd68189;
文字色=0xffffffff;
警告色=0xff60c5ba;
背景底层色=0xfff1f1f1;
背景顶层色=0xffffffff;
左侧栏项目色=0xFFa3a1a1;
对话框字体色=0xff000000;


function onTouch(v,e)
  if e.getAction() == MotionEvent.ACTION_DOWN then
    getCurr(v)
    return true
  end
end

local TypedValue=luajava.bindClass("android.util.TypedValue")
local dm=activity.getResources().getDisplayMetrics()
function dp(n)
  return TypedValue.applyDimension(1,n,dm)
end

function to(n)
  return string.format("%ddp",n//dn)
end

dn=dp(1)
lastX=0
lastY=0
vx=0
vy=0
vw=0
vh=0
zoomX=false
zoomY=false
function move(v,e)
  curr=v.Tag
  currView=v
  ry=e.getRawY()
  rx=e.getRawX()
  if e.getAction() == MotionEvent.ACTION_DOWN then
    lp=v.getLayoutParams()
    vy=v.getY()
    vx=v.getX()
    lastY=ry
    lastX=rx
    vw=v.getWidth()
    vh=v.getHeight()
    if vw-e.getX()<20 then
      zoomX=true
     elseif vh-e.getY()<20 then
      zoomY=true
    end

   elseif e.getAction() == MotionEvent.ACTION_MOVE then
    if zoomX then
      lp.width=(vw+(rx-lastX))
     elseif zoomY then
      lp.height=(vh+(ry-lastY))
     else
      lp.x=(vx+(rx-lastX))
      lp.y=(vy+(ry-lastY))
    end
    v.setLayoutParams(lp)
   elseif e.getAction() == MotionEvent.ACTION_UP then
    if (rx-lastX)^2<100 and (ry-lastY)^2<100 then
      getCurr(v)
     else
      curr.layout_x=to(v.getX())
      curr.layout_y=to(v.getY())
      if zoomX then
        curr.layout_width=to(v.getWidth())
       elseif zoomY then
        curr.layout_height=to(v.getHeight())
      end
    end
    zoomX=false
    zoomY=false
  end
  return true
end

function getCurr(v)
  curr = v.Tag
  currView = v
  fd_dlg.setView(View(activity))
  fd_dlg.Title = tostring(v.Class.getSimpleName())
  if luajava.instanceof(v, EditText) then
    fd_dlg.setItems(输入框)
   elseif luajava.instanceof(v, TextClock) then
    fd_dlg.setItems(时间文本)
   elseif luajava.instanceof(v, VideoView) then
    fd_dlg.setItems(视频控件)
   elseif luajava.instanceof(v, LuaWebView) then
    fd_dlg.setItems(浏览器)
   elseif luajava.instanceof(v, TextView) or luajava.instanceof(v, Button) then
    fd_dlg.setItems(文本)
   elseif luajava.instanceof(v, AbsoluteLayout) then
    fd_dlg.setItems(默认布局)
   elseif luajava.instanceof(v, ImageView) or luajava.instanceof(v, CircleImageView) then
    fd_dlg.setItems(图片)
   else
    fd_dlg.setItems(通用)
  end
  if luajava.instanceof(v.Parent, LinearLayout) then
   elseif luajava.instanceof(v.Parent, LuaWebView) then
    设置("backgroundColor", "#ff0000")
  end
  fd_dlg.show()
  fd_dlg.getWindow().setGravity(Gravity.BOTTOM)
  fd_dlg.setCanceledOnTouchOutside(true)
  fd_dlg.getWindow().getAttributes().width = WindowManager.LayoutParams.MATCH_PARENT
  fd_dlg.getWindow().getAttributes().height = activity.Height * 0.55
  弹窗圆角(fd_dlg.getWindow(), 4294967295, 30)
end

function adapter(t)
  local ls=ArrayList()
  for k,v in ipairs(t) do
    ls.add(v)
  end
  return ArrayAdapter(activity,android.R.layout.simple_list_item_1, ls)
end

import "android.graphics.drawable.*"
gd=GradientDrawable()
gd.setColor(0x00ffffff)--布局助手背景颜色
gd.setStroke(2,0xff212121,10,10)--布局助手，虚线颜色，参数(粗细, 颜色, 后面两个值都是:样式[0实线,5虚线, 自己看着改])
gd.setGradientRadius(700)
gd.setGradientType(1)

curr=nil
activity.setTheme(android.R.style.Theme_Material_Light)
xpcall(function()
  activity.setContentView(loadlayout2(layout.main,{}))
end,
function()
  提示("布局属性错误,请重新布局")
end)

relative={
  "layout_above","layout_alignBaseline","layout_alignBottom","layout_alignEnd","layout_alignLeft","layout_alignParentBottom","layout_alignParentEnd","layout_alignParentLeft","layout_alignParentRight","layout_alignParentStart","layout_alignParentTop","layout_alignRight","layout_alignStart","layout_alignTop","layout_alignWithParentIfMissing","layout_below","layout_centerHorizontal","layout_centerInParent","layout_centerVertical","layout_toEndOf","layout_toLeftOf","layout_toRightOf","layout_toStartOf"
}

relative = {
  "layout_above",
  "layout_alignBaseline",
  "layout_alignBottom",
  "layout_alignEnd",
  "layout_alignLeft",
  "layout_alignParentBottom",
  "layout_alignParentEnd",
  "layout_alignParentLeft",
  "layout_alignParentRight",
  "layout_alignParentStart",
  "layout_alignParentTop",
  "layout_alignRight",
  "layout_alignStart",
  "layout_alignTop",
  "layout_alignWithParentIfMissing",
  "layout_below",
  "layout_centerHorizontal",
  "layout_centerInParent",
  "layout_centerVertical",
  "layout_toEndOf",
  "layout_toLeftOf",
  "layout_toRightOf",
  "layout_toStartOf"
}
fd_dlg = AlertDialogBuilder(activity)
fd_list = fd_dlg.getListView()
fd_list.setDividerHeight(0)
fd_list.setVerticalScrollBarEnabled(false)
fds_grid = {
  "添加",
  "删除",
  "父控件",
  "子控件",
  "id",
  "orientation",
  "columnCount",
  "rowCount",
  "单击事件",
  "长按事件",
  "旋转(rotation)",
  "宽度(layout_width)",
  "高度(layout_height)",
  "权重值(layout_weight)",
  "重力属性(layout_gravity)",
  "背景(background)",
  "背景色(backgroundColor)",
  "gravity",
  "onClick",
  "边距(layout_margin)",
  "左距(layout_marginLeft)",
  "顶距(layout_marginTop)",
  "右距(layout_marginRight)",
  "底距(layout_marginBottom)",
  "padding(布局填充)",
  "paddingLeft(填充左侧)(填充左侧)",
  "paddingTop(上边距)",
  "paddingRight(右边距)",
  "paddingButtom(填充钮)",
  "alpha(控件透明度)",
  "Elevation(阴影层次)",
  "scaleX",
  "scaleY",
  "Visibility",
  "TranslationX(平移X)",
  "TranslationY(平移Y)",
  "TranslationZ(平移Z)"
}
通用 = {
  "添加控件",
  "删除控件",
  "父控件",
  "子控件",
  "单击事件",
  "旋转控件",
  "控件高度",
  "控件宽度",
  "重力属性",
  "背景",
  "背景颜色"
}
默认布局 = {
  "添加控件",
  "子控件",
  "背景图片",
  "背景颜色"
}
文本 = {
  "删除控件",
  "父控件",
  "控件id",
  "点击事件",
  "显示内容",
  "文字颜色",
  "文字大小",
  "旋转控件",
  "控件高度",
  "控件宽度",
  "重力属性",
  "背景颜色"
}
时间文本 = {
  "删除控件",
  "父控件",
  "控件id",
  "点击事件",
  "文字颜色",
  "文字大小",
  "旋转控件",
  "控件高度",
  "控件宽度",
  "背景颜色"
}
图片 = {
  "删除控件",
  "父控件",
  "控件id",
  "点击事件",
  "设置图片",
  "强制拉伸",
  "关闭强制拉伸",
  "旋转控件",
  "控件高度",
  "控件宽度",
  "背景颜色",

}
输入框 = {
  "删除控件",
  "父控件",
  "控件id",
  "显示内容",
  "文字颜色",
  "文字大小",
  "隐藏文字",
  "隐藏文字颜色",
  "旋转控件",
  "控件高度",
  "控件宽度",
  "背景颜色",
  "气泡内容"
}
浏览器 = {
  "删除控件",
  "父控件",
  "控件id",
  "加载网址",
  "旋转控件",
  "控件高度",
  "控件宽度",
  "背景颜色"
}
视频控件 = {
  "删除控件",
  "父控件",
  "控件id",
  "加载视频",
  "旋转控件",
  "控件高度",
  "控件宽度",
  "背景颜色"
}


checks = {}
checks.方向 = {
  "竖直",
  "水平"
}
checks.设置图片 = {
  "选择本地图片",
  "输入图片链接"
}
checks.点击事件 = {
  "关闭点击事件",
  "发送弹窗",
  "发送对话框",
  "跳转QQ",
  "跳转到QQ群",
  "跳转到浏览器(自定义网址)"
}
checks.长按事件 = {
  "关闭长按事件",
  "发送弹窗",
  "发送对话框",
  "跳转QQ",
  "跳转到QQ群",
  "跳转到浏览器(自定义网址)"
}
checks.重力属性 = {
  "左边",
  "顶部",
  "右边",
  "底部",
  "开头",
  "中间",
  "结尾"
}

function addDir(out,dir,f)
  local ls=f.listFiles()
  for n=0,#ls-1 do
    local name=ls[n].getName()
    if ls[n].isDirectory() then
      addDir(out,dir..name.."/",ls[n])
     elseif name:find("%.j?pn?g$") then
      table.insert(out,dir..name)
     elseif name:find("%.gif$") then
      table.insert(out,dir..name)
    end
  end
end

function checkid()
  local cs={}
  local parent=currView.Parent.Tag
  for k,v in ipairs(parent) do
    if v==curr then
      break
    end
    if type(v)=="table" and v.id then
      table.insert(cs,v.id)
    end
  end
  return cs
end

rbs = {
  "layout_alignParentBottom",
  "layout_alignParentEnd",
  "layout_alignParentLeft",
  "layout_alignParentRight",
  "layout_alignParentStart",
  "layout_alignParentTop",
  "layout_centerHorizontal",
  "layout_centerInParent",
  "layout_centerVertical"
}
ris = {
  "layout_above",
  "layout_alignBaseline",
  "layout_alignBottom",
  "layout_alignEnd",
  "layout_alignLeft",
  "layout_alignRight",
  "layout_alignStart",
  "layout_alignTop",
  "layout_alignWithParentIfMissing",
  "layout_below",
  "layout_toEndOf",
  "layout_toLeftOf",
  "layout_toRightOf",
  "layout_toStartOf"
}
for k,v in ipairs(rbs) do
  checks[v]={"true","false","none"}
end

for k,v in ipairs(ris) do
  checks[v]=checkid
end

if luadir then
  checks.src=function()
    local src={}
    addDir(src,"",File(luadir))
    return src
  end
end

fd_list.onItemClick=function(l,v,p,i)
  fd_dlg.hide()
  local fd=tostring(v.Text)
  if checks[fd] then
    if type(checks[fd])=="table" then
      check_dlg.Title=fd
      check_dlg.setItems(checks[fd])
      check_dlg.show()
     else
      check_dlg.Title=fd
      check_dlg.setItems(checks[fd](fd))
      check_dlg.show()
    end
   else
    func[fd]()
  end
end


--子视图列表对话框
cd_dlg=AlertDialogBuilder(activity)
cd_list=cd_dlg.getListView()
cd_list.setDividerHeight(0)
cd_list.setVerticalScrollBarEnabled(false)
cd_list.onItemClick=function(l,v,p,i)
  getCurr(chids[p])
  cd_dlg.hide()
end

--可选属性对话框
check_dlg=AlertDialogBuilder(activity)
check_list=check_dlg.getListView()
check_list.setDividerHeight(0)
check_list.setVerticalScrollBarEnabled(false)
check_list.onItemClick=function(l,v,p,i)
  local v=tostring(v.Text)
  if #v==0 or v=="none" then
    v=nil
  end
  local fld=check_dlg.Title
  local old=curr[tostring(fld)]

  --过滤
  switch (v)
   case "水平"
    v = "horizontal"
   case "vertical"
    v= "竖直"
   case "背景图片"
    v= "background"
   case "左边" then
    v= "left"
   case "右边" then
    v= "right"
   case "顶部" then
    v= "top"
   case "底部" then
    v= "bottom"
   case "中间" then
    v= "center"
   case"开头" then
    v="start"
   case "结尾" then
    v="end"
   default
    v = v
  end
  if v == "发送弹窗" then
    if curr.id == nil then
      无id输入对话框(v, "请输入发送内容：", [[io.open("/sdcard/訫/data/temporary/"..内容,w):write('Toast.makeText(activity,"'..内容2..'", Toast.LENGTH_LONG).show()'):close()]])
     else
      有id输入对话框(v, "请输入发送内容：", [[io.open("/sdcard/訫/data/temporary/"..内容,w):write('Toast.makeText(activity,"'..内容2..'", Toast.LENGTH_LONG).show()'):close()]])
    end
    check_dlg.hide()
   elseif v == "发送对话框" then
    check_dlg.hide()
    if curr.id == nil then
      点击事件_无id发送对话框()
     else
      点击事件_有id发送对话框()
    end
   elseif v == "跳转到浏览器(自定义网址)" then
    check_dlg.hide()
    if curr.id == nil then
      无id输入对话框(v, "请输入网址：", [=[io.open("/sdcard/訫/data/temporary/"..内容,w):write([[import android.content.Intent import android.net.Uri url="]]..内容2..[[" viewIntent = Intent(android.intent.action.VIEW,Uri.parse(url)) activity.startActivity(viewIntent)]]):close()]=])
     else
      有id输入对话框(v, "请输入网址：", [=[io.open("/sdcard/訫/data/temporary/"..内容,w):write([[import android.content.Intent import android.net.Uri url="]]..内容2..[[" viewIntent = Intent(android.intent.action.VIEW,Uri.parse(url)) activity.startActivity(viewIntent)]]):close()]=])
    end
   elseif v == "跳转到QQ群" then
    check_dlg.hide()
    if curr.id == nil then
      无id输入对话框(v, "请输入QQ群号：", [=[io.open("/sdcard/訫/data/temporary/"..内容,w):write([[import android.net.Uri import android.content.Intent url=mqqapi://card/show_pslcard?src_type=internal&version=1&uin=]]..内容2..[[&card_type=group&source=qrcode activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))]]):close()]=])
     else
      有id输入对话框(v, "请输入QQ群号：", [=[io.open("/sdcard/訫/data/temporary/"..内容,w):write([[import android.net.Uri import android.content.Intent url=mqqapi://card/show_pslcard?src_type=internal&version=1&uin=]]..内容2..[[&card_type=group&source=qrcode activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))]]):close()]=])
    end
   elseif v == "跳转QQ" then
    check_dlg.hide()
    if curr.id == nil then
      无id输入对话框(v, "请输入QQ：", [=[io.open("/sdcard/訫/data/temporary/"..内容,w):write([[import android.net.Uri import android.content.Intent activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(mqqwpa://im/chat?chat_type=wpa&uin=]]..内容2..[[)))]]):close()]=])
     else
      有id输入对话框(v, "请输入QQ：", [=[io.open("/sdcard/訫/data/temporary/"..内容,w):write([[import android.net.Uri import android.content.Intent activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(mqqwpa://im/chat?chat_type=wpa&uin=]]..内容2..[[)))]]):close()]=])
    end
   elseif v == "选择本地图片" then
    check_dlg.hide()
    调用系统选择文件(function (路径)
      local a=luajava.astable(File("/sdcard/訫/MyApp").listFiles())
      if a[1]==nil then
       else
        now=os.time()
        LuaUtil.copyDir(路径,"/sdcard/訫/MyApp/icon/"..now..".png")
        设置('src','icon/'..now..'.png')
      end
    end)
   elseif v == "输入图片链接" then
    check_dlg.hide()
    src_link()
   else
    check_dlg.hide()
    设置("gravity", v)
  end
end

func = {}
setmetatable(func,{__index=function(t,k)
    return function()
      fld.hint="请输入"..k--内容为空时显示
      switch (k)
       case "控件宽度"
        k = "layout_width"
       case "控件高度" then
        k = "layout_height"
       case "重力属性" then
        k = "gravity"
       case "设置图片" then
        k = "src"
       case "关闭强制拉伸" then
        k = "scaleType_nil"
       case "强制拉伸" then
        k = "scaleType"
       case "背景图片" then
        k = "background"
       case "文字颜色" then
        k = "TextColor"
       case"隐藏文字" then
        k = "hint"
       case "背景颜色" then
        k = "backgroundColor"
       case "旋转控件" then
        k = "rotation"
       case"显示内容" then
        k = "text"
       case "文字大小" then
        k = "TextSize"
       case "气泡内容" then
        k = "error"
       default
        k = k
      end
      sfd_dlg.Title=k--tostring(currView.Class.getSimpleName())

      if k == "backgroundColor" then
        取色器("backgroundColor")
       elseif k == "scaleType_nil" then
        设置("scaleType", "centerCrop")
       elseif k == "scaleType" then
        设置("scaleType", "fitXY")
       elseif k == "TextColor" then
        取色器("TextColor")
       elseif k == "隐藏文字颜色" then
        取色器("hintTextColor")
       elseif k == "background" then
        调用系统选择文件(function (路径)
          now=os.time()
          LuaUtil.copyDir(路径,"/sdcard/訫/MyApp/icon/"..now..".png")
          设置('background','icon/'..now..'.png')
          Toast.makeText(activity,"设置完成", Toast.LENGTH_LONG).show()
        end)
       elseif k == "控件id" then
        if curr.id == nil then
          设置控件id对话框()
         elseif tostring(currView.Class.getSimpleName()) == "LuaWebView" then
          更改浏览器控件id对话框()
         elseif tostring(currView.Class.getSimpleName()) == "VideoView" then
          更改video控件id对话框()
         else
          更改控件id对话框()
        end
       elseif k == "加载视频" then
        if curr.id == nil then
          设置控件id对话框()
         else
          now = io.open("/sdcard/訫/data/video_math"):read("*a")
          调用系统选择文件(function(A0_33)
            LuaUtil.copyDir(A0_33, "/sdcard/訫/MyApp/video/" .. now .. ".mp4")
            io.open("/sdcard/訫/data/video/" .. curr.id, "w"):write(now):close()
            io.open("/sdcard/訫/data/video_math", "w"):write(tonumber(now + 1)):close()
            提示("设置完成")
          end)
        end
       elseif k == "加载网址" then
        if curr.id == nil then
          无id输入对话框(A1_28, "请输入控件加载网址：", "io.open(/sdcard/訫/data/web/..内容,w):write([[]]..内容2..[[]]):close()")
         else
          有id输入对话框(A1_28, "请输入控件加载网址：", "io.open(/sdcard/訫/data/web/..内容,w):write([[]]..内容2..[[]]):close()")
        end
       else
        sfd_dlg.show()
      end
    end
  end
})

func["添加控件"]=function()
  add_dlg.Title=tostring(currView.Class.getSimpleName())
  for n=0,#ns-1 do
    if n~=i then
      el.collapseGroup(n)
    end
  end
  add_dlg.show()
end

function func.删除控件()
  local L0_34
  L0_34 = currView
  L0_34 = L0_34.Parent
  L0_34 = L0_34.Tag
  if L0_34 == nil then
    Toast.makeText(activity, "不可以删除顶部控件", 1000).show()
    return
  end
  for _FORV_4_, _FORV_5_ in ipairs(L0_34) do
    if _FORV_5_ == curr then
      _FORV_5_ = tostring(L0_34[_FORV_4_][_FORV_4_ - 1]):sub(22, -1)
      AlertDialog.Builder(this).setTitle("删除控件").setMessage("确定删除 " .. tostring(currView.Class.getSimpleName()) .. " 吗？").setPositiveButton("确定", {
        onClick = function()
          if curr.id ~= nil then
            if tostring(currView.Class.getSimpleName()) == "LuaWebView" then
              os.execute("rm -r " .. "/sdcard/訫/data/web/" .. curr.id)
             elseif tostring(currView.Class.getSimpleName()) == "VideoView" then
              if io.open("/sdcard/訫/data/video/" .. curr.id) ~= nil then
                t = io.open("/sdcard/訫/data/video/" .. curr.id):read("*a")
                os.execute("rm -r " .. "/sdcard/訫/MyApp/video/" .. t .. ".mp4")
                os.execute("rm -r " .. "/sdcard/訫/data/video/" .. curr.id)
              end
             else
              os.execute("rm -r " .. "/sdcard/訫/data/temporary/" .. curr.id)
            end
          end
          table.remove(L0_34, _UPVALUE2_)
          activity.setContentView(loadlayout2(layout.main, {}))
        end

      }).setNegativeButton("取消", nil).show()
    end
  end
end

func["父控件"]=function()
  local p=currView.Parent
  if p.Tag==nil then
    提示("已经是最开始的控件")
   else
    getCurr(p)
  end
end

chids={}
func["子控件"]=function()
  chids={}
  local arr={}
  for n=0,currView.ChildCount-1 do
    local chid=currView.getChildAt(n)
    chids[n]=chid
    table.insert(arr,chid.Class.getSimpleName())
  end
  cd_dlg.Title=tostring(currView.Class.getSimpleName())
  cd_dlg.setItems(arr)
  cd_dlg.show()
end

--添加视图对话框
add_dlg=Dialog(activity)
add_dlg.Title="添加"
wdt_list=ListView(activity)
wdt_list.setDividerHeight(0)
wdt_list.setVerticalScrollBarEnabled(false)

ns = {
  "小部件",
  "高级控件"
}
wds = {
  {
    "Button",
    "EditText",
    "TextView",
    "ImageView",
    "CircleImageView"
  },
  {
    "LuaWebView",
    "VideoView",
    "TextClock"
  }
}
汉化 = {
  {
    "按钮",
    "输入框",
    "文本",
    "图片",
    "圆形图片"
  },
  {
    "浏览器",
    "视频控件",
    "时间文本"
  }
}
mAdapter=ArrayExpandableListAdapter(activity)
for k,v in ipairs(ns) do
  mAdapter.add(v,汉化[k])
end

el=ExpandableListView(activity)
el.setAdapter(mAdapter)
el.setDividerHeight(0)
el.setVerticalScrollBarEnabled(false)
add_dlg.setContentView(el)
add_dlg.getWindow().setGravity(Gravity.BOTTOM)
add_dlg.setCanceledOnTouchOutside(true);
add_dlg.getWindow().getAttributes().width = WindowManager.LayoutParams.MATCH_PARENT
add_dlg.getWindow().getAttributes().height = activity.Height*0.55
弹窗圆角(add_dlg.getWindow(),0xffffffff,28)
el.onChildClick=function(l,v,g,c)
  local w={_G[wds[g+1][c+1]]}
  table.insert(curr,w)
  local s,l=pcall(loadlayout2,layout.main,{})
  if s then
    activity.setContentView(l)
   else
    table.remove(curr)
    print(l)
  end
  add_dlg.hide()
end

function ok()
  local v=tostring(fld.Text)
  if #v==0 then
    v=nil
  end
  local fld=sfd_dlg.Title
  local old=curr[tostring(fld)]
  curr[tostring(fld)]=v
  local s,l=pcall(loadlayout2,layout.main,{})
  if s then
    activity.setContentView(l)
   else
    curr[tostring(fld)]=old
    print(l)
  end
end

function none()
  local old=curr[tostring(sfd_dlg.Title)]
  curr[tostring(sfd_dlg.Title)]=nil
  local s,l=pcall(loadlayout2,layout.main,{})
  if s then
    activity.setContentView(l)
   else
    curr[tostring(sfd_dlg.Title)]=old
    print(l)
  end
end

InputLayout = {
  LinearLayout,
  orientation = "vertical",
  Focusable = true,
  FocusableInTouchMode = true,
  {
    TextView,
    id = "Prompt",
    textSize = "15sp",
    layout_marginTop = "10dp",
    layout_marginLeft = "3dp",
    layout_width = "80%w",
    layout_gravity = "center",
    text = "请输入："
  },
  {
    SeekBar,
    layout_marginTop = "5dp",
    layout_width = "80%w",
    id = "seekbar",
    layout_gravity = "center"
  },
  {
    EditText,
    hint = "请输入相关数值...",
    layout_marginTop = "5dp",
    layout_width = "80%w",
    text = Title,
    layout_gravity = "center",
    id = "fld"
  }
}
sfd_dlg = AlertDialogBuilder(activity)
sfd_dlg.setView(loadlayout(InputLayout))
function ok2()
  local v=tostring(fld.Text)
  if #v==0 then
    v=nil
  end
  local fld=sfd_dlg.Title
  local old=curr[tostring(fld)]
  curr[tostring(fld)]=v
  local s,l=pcall(loadlayout2,layout.main,{})
  if s then
    activity.setContentView(l)
   else
    curr[tostring(fld)]=old
    print(l)
  end
end


sfd_dlg.setPositiveButton("确定",{onClick=function(v)
    ok2()
  end})
sfd_dlg.setNegativeButton("取消",nil)
sfd_dlg.setNeutralButton("清空",{onClick=function(v) none()提示("ok")end})

xpcall(function()
  loadstring(activity.getSharedData("弹窗位置"))()
end
, function(error)
  sfd_dlg.getWindow().setGravity(Gravity.BOTTOM)
end
)
sfd_dlg.setCanceledOnTouchOutside(true);
sfd_dlg.getWindow().getAttributes().width = WindowManager.LayoutParams.MATCH_PARENT
sfd_dlg.getWindow().getAttributes().height = activity.Height*0.55

弹窗圆角(sfd_dlg.getWindow(),0xffffffff,28)
pcall(function()
  activity.getWindow().setSoftInputMode(0x10)--输入法不遮挡布局(上方控件需设置layout_weight=1;)
end)
seekbar.setMax(200)
seekbar.setProgress(0)
seekbar.setOnSeekBarChangeListener{
  onProgressChanged=function(seekbar,int,boolean)
    Prompt.Text=tostring("正在拖动 "..int)
    fld.Text=tostring(int.."dp")
    ok()
  end,
  onStartTrackingTouch=function(seekbar)
    Prompt.setText(tostring("开始拖动"))
  end,
  onStopTrackingTouch=function(seekbar)
    Prompt.setText(tostring("停止拖动"))
  end}

function dumparray(arr)
  local ret={}
  table.insert(ret,"{\n")
  for k,v in ipairs(arr) do
    table.insert(ret,string.format("\"%s\";\n",v))
  end
  table.insert(ret,"};\n")
  return table.concat(ret)
end
function dumplayout(t)
  table.insert(ret,"{\n")
  table.insert(ret,tostring(t[1].getSimpleName()..";\n"))
  for k,v in pairs(t) do
    if type(k)=="number" then
     elseif type(v)=="table" then
      table.insert(ret,k.."="..dumparray(v))
     elseif type(v)=="string" then
      if v:find("[\"\'\r\n]") then
        table.insert(ret,string.format("%s=[==[%s]==];\n",k,v))
       else
        table.insert(ret,string.format("%s=\"%s\";\n",k,v))
      end
     else
      table.insert(ret,string.format("%s=%s;\n",k,tostring(v)))
    end
  end
  for k,v in ipairs(t) do
    if type(v)=="table" then
      dumplayout(v)
    end
  end
  table.insert(ret,"};\n")
end

function dumplayout2(t)
  ret={}
  dumplayout(t)
  return table.concat(ret)
end

function onCreateOptionsMenu(menu)
  menu.add("保存")
  menu.add("预览")
  menu.add("使用说明")
  menu.add("清空布局")
  menu.add("备份布局")
end

function save(A0_55)
  io.open(luapath, "w"):write(A0_55)
  io.open(luapath, "w"):close()
end

import("android.content.*")
cm = activity.getSystemService(activity.CLIPBOARD_SERVICE)
function onMenuItemSelected(A0_56, A1_57)
  if A1_57.getTitle() == "预览" then
    save(dumplayout2(layout.main))
    activity.setResult(10000, Intent())
    io.open("/sdcard/訫/data/layout.aly", "w"):write(dumplayout2(layout.main)):close()
    --复制文件
    LuaUtil.copyDir("/sdcard/訫/data/layout.aly","/sdcard/訫/MyApp/layout.aly")
    activity.newActivity("/sdcard/訫/MyApp/main")
   elseif A1_57.getTitle() == "保存" then
    save(dumplayout2(layout.main))
    activity.setResult(10000, Intent())
    io.open("/sdcard/訫/data/layout.aly", "w"):write(dumplayout2(layout.main)):close()
    LuaUtil.copyDir("/sdcard/訫/data/layout.aly", "/sdcard/訫/MyApp/layout.aly")
    提示("已保存")
    activity.finish()
   elseif A1_57.getTitle() == "清空布局" then
    ZipUtil.unzip(activity.getLuaDir() .. "/libs/customize_lay", "/sdcard/訫/data/")
    activity.recreate()
   elseif A1_57.getTitle() == "使用说明" then
    使用说明()
   elseif A1_57.getTitle() == "备份布局" then
    备份布局()
  end
  if(item.getItemId() == android.R.id.home)
    save(dumplayout2(layout.main))
    io.open("/sdcard/訫/data/layout.aly", "w"):write(dumplayout2(layout.main)):close()
    LuaUtil.copyDir("/sdcard/訫/data/layout.aly", "/sdcard/訫/MyApp/layout.aly")
    Toast.makeText(activity, "已保存", Toast.LENGTH_SHORT).show()
    activity.setResult(10000, Intent())
    activity.finish()
    return true
  end
end

function onStart()
  activity.setContentView(loadlayout2(layout.main, {}))
end

lastclick = os.time() - 2
function onKeyDown(A0_58)
  if A0_58 == 4 then
    if luapath:find("%.aly$") then
      io.open(luapath):close()
      if os.time() - lastclick > 2 then
        xpcall(function()
          local L0_59=luajava.astable(File("/sdcard/訫/data/web").listFiles())
          if L0_59[1] == nil then
            if luajava.astable(File("/sdcard/訫/data/temporary").listFiles())[1] == nil then
              if luajava.astable(File("/sdcard/訫/data/video").listFiles())[1] == nil then
                退出 = AlertDialog.Builder(this).setTitle("提示").setMessage("是否保存当前布局").setPositiveButton("保存", {
                  onClick = function()
                    save(dumplayout2(layout.main))
                    io.open("/sdcard/訫/data/layout.aly", "w"):write(dumplayout2(layout.main)):close()
                    LuaUtil.copyDir("/sdcard/訫/data/layout.aly", "/sdcard/訫/MyApp/layout.aly")
                    Toast.makeText(activity, "已保存", Toast.LENGTH_SHORT).show()
                    activity.setResult(10000, Intent())
                    activity.finish()
                  end})
                .setNegativeButton("不保存并退出", {
                  onClick = function()
                    activity.finish()
                  end })
                .show()
                退出.create()
                弹窗圆角(退出.getWindow(), 0xFFffffff)
               else
                save(dumplayout2(layout.main))
                io.open("/sdcard/訫/data/layout.aly", "w"):write(dumplayout2(layout.main)):close()
                LuaUtil.copyDir("/sdcard/訫/data/layout.aly", "/sdcard/訫/MyApp/layout.aly")
                Toast.makeText(activity, "已保存.", Toast.LENGTH_SHORT).show()
                activity.setResult(10000, Intent())
                activity.finish()
              end
             else
              save(dumplayout2(layout.main))
              io.open("/sdcard/訫/data/layout.aly", "w"):write(dumplayout2(layout.main)):close()
              LuaUtil.copyDir("/sdcard/訫/data/layout.aly", "/sdcard/訫/MyApp/layout.aly")
              Toast.makeText(activity, "已保存.", Toast.LENGTH_SHORT).show()
              activity.setResult(10000, Intent())
              activity.finish()
            end
           else
            save(dumplayout2(layout.main))
            io.open("/sdcard/訫/data/layout.aly", "w"):write(dumplayout2(layout.main)):close()
            LuaUtil.copyDir("/sdcard/訫/data/layout.aly", "/sdcard/訫/MyApp/layout.aly")
            Toast.makeText(activity, "已保存", Toast.LENGTH_SHORT).show()
            activity.setResult(10000, Intent())
            activity.finish()
          end
        end,
        function()
          Toast.makeText(activity, "不支持保存该布局,请修改", 1000).show()
        end
        )
        showsave = true
      end
      return true
    end
   else
    pcall(function()
      a = dump(assert(loadstring("return " .. 读取文件(luapath)))())
      b = dump(layout.main)
    end
    )
    if a == b then
      activity.finish()
      return true
     else
      Toast.makeText(activity, "再按一次返回", Toast.LENGTH_SHORT).show()
      lastclick = os.time()
      return true
    end
  end
end