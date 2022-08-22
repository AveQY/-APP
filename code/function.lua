function 卡片边框(控件ID,边框宽度,边框颜色,背景颜色,边框圆角)
  import "android.graphics.drawable.GradientDrawable"
  控件ID.setBackgroundDrawable(GradientDrawable()
  .setShape(GradientDrawable.RECTANGLE)
  .setStroke(边框宽度,tonumber(边框颜色))
  .setColor(tonumber(背景颜色))
  .setCornerRadius(边框圆角))
  return drawable
end
function 控件消失(控件ID)
  控件ID.setVisibility(View.GONE)
end
function 显示控件(控件ID)
  控件ID.setVisibility(View.VISIBLE)
end
function 弹窗(AweQY)
  Toast.makeText(activity,AweQY, Toast.LENGTH_LONG).show()
end
function 创建文件夹(路径)
  File(路径).mkdirs()
end
function 弹窗UI(标题,内容,确认事件,取消事件,按钮1,按钮2)
  import "android.graphics.Typeface"
  弹窗框架=
  {
    LinearLayout,
    orientation='vertical',
    layout_width='fill',
    layout_height='wrap',
    {
      CardView;
      layout_margin='8dp';
      layout_gravity='center';
      elevation='5dp';
      layout_width='90%w';
      layout_height='fill';
      CardBackgroundColor='0xfffFFFFF';
      radius='10dp';
      {
        LinearLayout,
        gravity='center';
        orientation='vertical',
        layout_width='fill',
        layout_height='wrap',
        background='#00FFFFFF',
        {
          TextView;
          layout_margin='4%w';
          gravity='center';
          layout_width='fill';
          layout_height='wrap';
          textColor='#eb000000';
          text=标题;
          textSize='16dp';
          typeface=Typeface.DEFAULT_BOLD,
        };
        {
          LinearLayout,
          layout_padding='10%';
          gravity='left|center';
          orientation='vertical',
          layout_width='fill',
          layout_height='25%h',
          background='#ffffffff',
          {
            ScrollView;
            layout_width='fill';
            layout_height='fill';
            verticalScrollBarEnabled=false,
            overScrollMode=View.OVER_SCROLL_NEVER,
            {
              TextView;
              padding="20dp",
              ellipsize="end";
              layout_width='fill';
              layout_height='fill';
              textColor='#FF888888';
              text=内容;
              textSize='15dp';
              gravity='center|left|top';
              id="内容",
            };
          };
        };
        {
          TextView,
          layout_width="fill",
          layout_height="2px",
          layout_gravity="center",
          backgroundColor="#ffbebebe",
        };
        {
          LinearLayout,
          orientation='horizontal',
          layout_width='fill',
          layout_height='13%w',
          background='#00FFFFFF',
          {
            LinearLayout,
            orientation='vertical',
            layout_width='45%w',
            layout_height='fill',
            background='#00FFFFFF',
            {
              TextView;
              gravity='center';
              layout_width='fill';
              layout_height='fill';
              textColor='#eb000000';
              text=按钮1;
              textSize='16dp';
              id="取消"
            };
          };
          {
            TextView,--垂直分割线
            layout_width="2px",--布局宽度
            layout_height="fill",
            layout_gravity="center",
            backgroundColor="#ffbebebe",
          };
          {
            TextView,
            layout_width="0px",
            layout_height="fill",
            layout_gravity="center",
            backgroundColor="#ffbebebe",
          };
          {
            LinearLayout,
            orientation='vertical',
            layout_width='45%w',
            layout_height='fill',
            background='#00000000',
            {
              TextView;
              gravity='center';
              layout_width='fill';
              layout_height='fill';
              textColor='#FF147CE4';
              text=按钮2;
              textSize='16dp';
              id="确认"
            };
          };
        };
      };
    };
  };
  xxx=AlertDialog.Builder(this)
  xxx.setView(loadlayout(弹窗框架))
  xxx.setCancelable(false)
  xxx=xxx.show()
  import "android.graphics.drawable.ColorDrawable"
  xxx.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000))
  function 波纹特效v2(颜色)
    import"android.content.res.ColorStateList"
    return activity.Resources.getDrawable(activity.obtainStyledAttributes({android.R.attr.selectableItemBackground--[[Borderless]]}).getResourceId(0,0))
    .setColor(ColorStateList(int[0]
    .class{int{}},int{颜色 or 0x20000000}))
  end
  确认.onClick=function()
    assert(loadstring(确认事件))()
  end;
  取消.onClick=function()
    assert(loadstring(取消事件))()
  end;
  确认.foreground=波纹特效v2(0xFFCECECE)
  取消.foreground=波纹特效v2(0xFFCECECE)
end
function 调用系统选择文件(callback)
  import "android.content.Intent"
  import "android.content.ContentUris"
  import "android.provider.MediaStore"
  import "android.provider.DocumentsContract"
  import "android.net.Uri"
  import "android.os.Build"
  import "android.os.Environment"
  intent=Intent("android.intent.action.GET_CONTENT").setType("*/*").addCategory("android.intent.category.OPENABLE")
  activity.startActivityForResult(intent,1)
  function uri2path(uri)
    local needToCheckUri=Build.VERSION.SDK_INT>=19
    local selection
    local selectionArgs
    if needToCheckUri && DocumentsContract.isDocumentUri(activity,uri) then
      if isExternalStorageDocument(uri) then
        local docId=DocumentsContract.getDocumentId(uri)
        local split=String(docId).split(":")
        return Environment.externalStorageDirectory.toString().."/"..split[1]
       elseif isDownloadsDocument(uri) then
        local id=DocumentsContract.getDocumentId(uri)
        local split=String(id).split(":")
        uri=ContentUris.withAppendedId(Uri.parse("content://downloads/public_downloads"),Long.valueOf(split[1]))
       elseif isMediaDocument(uri) then
        local docId=DocumentsContract.getDocumentId(uri)
        local split=String(docId).split(":")
        switch split[0]
         case "image"
          uri=MediaStore.Images.Media.EXTERNAL_CONTENT_URI
         case "video"
          uri=MediaStore.Video.Media.EXTERNAL_CONTENT_URI
         case "audio"
          uri=MediaStore.Audio.Media.EXTERNAL_CONTENT_URI
        end
        selection="_id=?"
        selectionArgs={split[1]}
      end
    end
    if String("content").equalsIgnoreCase(uri.scheme) then
      local projection={"_data"}
      local cursor
      local result
      pcall(function()
        cursor=activity.contentResolver.query(uri,projection,selection,selectionArgs,nil)
        local column_index=cursor.getColumnIndexOrThrow("_data")
        if cursor.moveToFirst() then
          result=cursor.getString(column_index)
        end
      end)
      return result
     elseif String("file").equalsIgnoreCase(uri.scheme)
      return uri.path
    end
  end
  function isExternalStorageDocument(uri)
    return uri.authority=="com.android.externalstorage.documents"
  end
  function isDownloadsDocument(uri)
    return uri.authority=="com.android.providers.downloads.documents"
  end
  function isMediaDocument(uri)
    return uri.authority=="com.android.providers.media.documents"
  end
  function onActivityResult(requestCode,resultCode,data)
    if data then
      callback(tostring(uri2path(data.data)))
    end
  end
end

function 初始化()
  if File(主路径.."/").isDirectory() then
   else
    File(主路径.."/").mkdirs()
  end
  if File(主路径.."/布局备份/").isDirectory() then
   else
    File(主路径.."/布局备份/").mkdirs()
  end
  if File(主路径.."/data/").isDirectory() then
    if io.open(主路径.."/data/状态")==nil then
      io.open(主路径.."/data/状态","w"):write("图片模板"):close()
     else
      main_title.setText('当前模板：'..io.open(主路径.."/data/状态"):read("*a"))
    end
    if io.open(主路径.."/data/about")==nil then
      io.open(主路径.."/data/about","w"):write("默认"):close()
    end
   else
    File(主路径.."/data/").mkdirs()
    io.open(主路径.."/data/状态","w"):write("图片模板"):close()
    io.open(主路径.."/data/about","w"):write("默认"):close()
  end
  if File(主路径.."/data/temporary/").isDirectory() then
   else
    File(主路径.."/data/temporary/").mkdirs()
  end
  if File(主路径.."/data/web/").isDirectory() then
   else
    File(主路径.."/data/web/").mkdirs()
  end
  if File(主路径.."/data/video/").isDirectory() then
   else
    File(主路径.."/data/video/").mkdirs()
  end
  if File(主路径.."/data/zip/").isDirectory() then
   else
    File(主路径.."/data/zip/").mkdirs()
  end
  if File(主路径.."/项目/").isDirectory() then
   else
    File(主路径.."/项目/").mkdirs()
  end
  if File(主路径.."/备份/").isDirectory() then
   else
    File(主路径.."/备份/").mkdirs()
  end
  if io.open(主路径.."/data/video_math")==nil then
    io.open(主路径.."/data/video_math","w"):write("1"):close()
  end
  if io.open(主路径.."/data/生成提示")==nil then
    io.open(主路径.."/data/生成提示","w"):write("提示"):close()
  end
end
function 写入剪切板(edit)
  import "android.content.Context"
  activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(edit)
end
function Drawable_round(id,back,up,down)
  import "android.graphics.Color"
  import "android.graphics.drawable.GradientDrawable"
  if not up then
    up=25
  end
  if not down then
    down=up
  end
  id.setBackgroundDrawable(GradientDrawable()
  .setShape(GradientDrawable.RECTANGLE)
  .setColor(back)
  .setCornerRadii({up,up,up,up,down,down,down,down}))
end

function 提示(AweQY)
  Toast.makeText(activity,AweQY, Toast.LENGTH_LONG).show()
end

function 公告()
  url="https://share.weiyun.com/7JUnqemt"
  Http.get(url,function(a,b)
    if a==200 then
      内容=b:match('>公告开关【(.-)】')
      if 内容=="关闭" then
       else
        import "android.graphics.drawable.ColorDrawable"
        Download_layout={
          FrameLayout;
          background="https://www.helloimg.com/images/2022/07/31/Z0CfnS.png",
          id="背景",
          {
            Button;
            layout_gravity="top|right";
            layout_width="50dp";
            backgroundColor="#",
            onClick=function()
              对话框.dismiss()
            end,
          };
          {
            LinearLayout,--线性布局
            orientation="vertical",--布局方向
            layout_width="fill",--布局宽度
            layout_height="40%h";
            {
              ScrollView,--纵向滑动控件
              layout_width="fill",--布局宽度
              layout_margin="25dp";
              layout_marginRight="60dp";
              layout_marginTop="50dp";
              --overScrollMode=View.OVER_SCROLL_NEVER,--隐藏圆弧阴影
              {
                LinearLayout,--线性布局
                orientation="vertical",--布局方向
                layout_width="fill",--布局宽度
                layout_height="40%h";
                {
                  TextView;
                  layout_gravity="center|left";
                  textColor="#62EEE9",
                  text="公告",
                  TextSize="9dp",
                };
                {
                  TextView;
                  layout_gravity="center|left";
                  textColor="#62EEE9",
                  text=[==[ ]==],
                  id="内容",
                  layout_marginTop="5dp";
                  textIsSelectable=true,
                };
              },
            },
          },
        };
        对话框=AlertDialog.Builder(this)
        .setView(loadlayout(Download_layout))
        .setCancelable(false)
        .show()
        内容.setText(b:match('>公告【(.-)】'))
        对话框.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000))
        对话框.create()
      end
     else
      Toast.makeText(activity,"请检查网络", Toast.LENGTH_LONG).show()
    end
  end)
end

function 输入对话框(标题,信息,事件)
  Download_layout={
    LinearLayout;
    orientation="vertical";
    id="Download_father_layout",
    {
      EditText;
      id="edit",
      layout_width="80%w";
      layout_gravity="center";
    };
  };
  dialog=AlertDialog.Builder(this)
  .setTitle(标题)
  .setMessage(信息)
  .setView(loadlayout(Download_layout))
  .setPositiveButton("确定",{onClick=function(v)
      内容=edit.Text
      assert(loadstring(事件))()
      Toast.makeText(activity,"设置完成", Toast.LENGTH_LONG).show()
    end})
  .setNegativeButton("取消",{onClick=function(v)
    end})
  .show()
  dialog.create()
  Drawable_round(dialog.getWindow(),0xFFffffff)
end

function generate()
  init=io.open(主路径.."/MyApp/init.lua"):read("*a")
  main=io.open(主路径.."/MyApp/main.lua"):read("*a")
  --main2=main:gsub([[activity.setTitle("(.-)")]],[[activity.setTitle("]]..edit1.Text..[[")]])
  init2=init:gsub('appname="(.-)"','appname="'..edit1.Text..'"')
  init3=init2:gsub('appver="(.-)"','appver="'..edit2.Text..'"')
  init4=init3:gsub('packagename="(.-)"','packagename="'..edit3.Text..'"')
  io.open(主路径.."/MyApp/init.lua","w"):write(init4):close()
  --io.open("/storage/emulated/0/訫/MyApp/main.lua","w"):write(main2):close()
  activity.newActivity('main2',{"N【"..edit1.Text.."】\nV【"..edit2.Text.."】\nB【"..edit3.Text.."】"})
end

function 关于软件()
  dialog=AlertDialog.Builder(this)
  .setTitle("关于软件")
  .setMessage(io.open(activity.getLuaDir().."/libs/about"):read("*a"):match('关于="(.-)"'))
  .setPositiveButton("我知道了",{onClick=function(v)
      当前版本=io.open(activity.getLuaDir().."/libs/about"):read("*a"):match('版本="(.-)"')
      io.open(主路径.."/data/about","w"):write(当前版本):close()
    end})
  .show()
  dialog.create()
  dialog.getButton(dialog.BUTTON_POSITIVE).setTextColor(0xFF000000)
  Drawable_round(dialog.getWindow(),0xFFffffff)
end
function 设置一言()
  txt={"桃李春风一杯酒，江湖夜雨十年灯。",
    "长风破浪会有时，直挂云帆济沧海。",
    "你是无意穿堂风，偏偏孤倨引山洪。",
    "愿你天黑有灯，下雨有伞，未来的路有良人相伴。",
    "我有一个梦，也许有一天，灿烂的阳光能照进黑暗森林。",
    "自古美人如名将，不许人间见白头。",
    "什么都无法舍弃的人，什么都无法改变。",
    "天不生我李淳罡，剑道万古长如夜",
    "斑竹枝，斑竹枝，点点泪痕寄相思",
    "一切都会变好,超级好,爆好,无敌好",
    "把喜欢的一切留在身边，这便是努力的意义",
    "悲喜自渡，他人难悟易误",
    "且以深情共白首，愿无岁月可回头",
    "保持热爱，奔赴山海！"}
  Http.get("https://v1.hitokoto.cn/?encode=json","utf8",function(code,content,cookie,header)
    if code==200 then
      local cjson=import "cjson"
      local json=cjson.decode(content)
      yiyan.setText(json.hitokoto)
     else
      yiyan.setText(txt[math.random(0,12)])
    end
  end)
end
function 状态栏()
  if tonumber(Build.VERSION.SDK) >= 23 then
    activity.getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
  end
  if Build.VERSION.SDK_INT >= 21 then
    activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xff4285f4);
  end
  if Build.VERSION.SDK_INT >= 19 then
    activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
  end
end

function 提示(AweQY)
  Toast.makeText(activity,AweQY, Toast.LENGTH_LONG).show()
end
function 控件圆角(view,InsideColor,radiu)
  import "android.graphics.drawable.GradientDrawable"
  drawable = GradientDrawable()
  drawable.setShape(GradientDrawable.RECTANGLE)
  drawable.setColor(InsideColor)
  drawable.setCornerRadii({radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu});
  view.setBackgroundDrawable(drawable)
end

function 水珠动画(view,time)
  import "android.animation.ObjectAnimator"
  ObjectAnimator().ofFloat(view,"scaleX",{1.2,.8,1.1,.9,1}).setDuration(time).start()
  ObjectAnimator().ofFloat(view,"scaleY",{1.2,.8,1.1,.9,1}).setDuration(time).start()
end
function 全屏()
  window = activity.getWindow();
  window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_FULLSCREEN|View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN);
  window.addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN)
  xpcall(function()
    lp = window.getAttributes();
    lp.layoutInDisplayCutoutMode = WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES;
    window.setAttributes(lp);
  end,
  function(e)
  end)
end
function QQ聊天(qq)
  import "android.net.Uri"
  import "android.content.Intent"
  activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse("mqqwpa://im/chat?chat_type=wpa&uin="..qq)))
end
function 打开小破站()
  import "android.content.Intent"
  import "android.net.Uri"
  url="bilibili://space/2036485750?from=search"
  activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))
end
function 下载文件(url,路)
  import "http"
  Http.download(url,路,function(code,data,cookie,header)end)
end
