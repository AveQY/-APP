function 提示(str)
  Toast.makeText(activity,str, Toast.LENGTH_LONG).show()
end
function 拖动条颜色(id,颜色)
  id.ProgressDrawable.setColorFilter(PorterDuffColorFilter(颜色,PorterDuff.Mode.SRC_ATOP))
  --修改SeekBar滑块颜色
  id.Thumb.setColorFilter(PorterDuffColorFilter(颜色,PorterDuff.Mode.SRC_ATOP))
end
function 设置(类型,方法)
  local v=tostring(方法)
  if #v==0 then
    v=nil
  end
  local fld=类型
  local old=curr[tostring(fld)]
  curr[tostring(fld)]=v
  local s,l=pcall(loadlayout2,layout.main,{})
  if s then
    activity.setContentView(l)
   else
    curr[tostring(fld)]=old
  end
end
function 弹窗圆角(控件,背景色,上角度,下角度)
  if not 上角度 then
    上角度=25
  end
  if not 下角度 then
    下角度=上角度
  end
  控件.setBackgroundDrawable(GradientDrawable()
  .setShape(GradientDrawable.RECTANGLE)
  .setColor(背景色)
  .setCornerRadii({上角度,上角度,上角度,上角度,下角度,下角度,下角度,下角度}))
end
function 对话框按钮颜色(id,button,颜色)
  if Build.VERSION.SDK_INT >= 15 then
    import "android.graphics.PorterDuffColorFilter"
    import "android.graphics.PorterDuff"
    if button==1 then
      id.getButton(id.BUTTON_POSITIVE).setTextColor(颜色)
     elseif button==2 then
      id.getButton(id.BUTTON_NEGATIVE).setTextColor(颜色)
     elseif button==3 then
      id.getButton(id.BUTTON_NEUTRAL).setTextColor(颜色)
    end
  end
end
function 取色器(传递)
  取色器布局={
    LinearLayout;
    orientation="vertical";
    layout_width="fill";
    layout_height="fill";
    gravity="center";
    {
      CardView;
      id="卡片图";
      layout_margin="10dp";
      radius="40dp",
      elevation="0dp",
      layout_width="20%w";
      layout_height="20%w";
    };
    {
      TextView;
      layout_margin="0dp";
      textSize="20sp";
      id="颜色文本";
    };
    {
      SeekBar;
      id="拖动一";
      layout_margin="15dp";
      layout_width="match";
      layout_height="wrap";
    };
    {
      SeekBar;
      id="拖动二";
      layout_margin="15dp";
      layout_width="match";
      layout_height="wrap";
    };
    {
      SeekBar;
      id="拖动三";
      layout_margin="15dp";
      layout_width="match";
      layout_height="wrap";
    };
    {
      SeekBar;
      id="拖动四";
      layout_margin="15dp";
      layout_width="match";
      layout_height="wrap";
    };
  };
  local 取色器2=loadlayout(取色器布局)
  拖动一.setMax(255)
  拖动二.setMax(255)
  拖动三.setMax(255)
  拖动四.setMax(255)
  拖动一.setProgress(0xff)
  拖动二.setProgress(0x1e)
  拖动三.setProgress(0x8a)
  拖动四.setProgress(0xe8)
  --监听
  拖动一.setOnSeekBarChangeListener{
    onProgressChanged=function(view, i)
      updateArgb()
    end
  }

  拖动二.setOnSeekBarChangeListener{
    onProgressChanged=function(view, i)
      updateArgb()
    end
  }

  拖动三.setOnSeekBarChangeListener{
    onProgressChanged=function(view, i)
      updateArgb()
    end
  }

  拖动四.setOnSeekBarChangeListener{
    onProgressChanged=function(view, i)
      updateArgb()
    end
  }
  --更新颜色
  function updateArgb()
    local a=拖动一.getProgress()
    local r=拖动二.getProgress()
    local g=拖动三.getProgress()
    local b=拖动四.getProgress()
    local argb_hex=(a<<24|r<<16|g<<8|b)
    颜色文本.Text="#"..string.format("%#x",argb_hex):match("0x(.+)")
    卡片图.setCardBackgroundColor(argb_hex)
  end
  --翻译进度
  argbBuild=AlertDialog.Builder(activity)
  .setView(取色器2)
  .setTitle("配色")
  .setPositiveButton("选择", {
    onClick=function(view)
      local v=tostring(颜色文本.Text)
      if #v==0 then
        v=nil
      end
      local fld=传递
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
  })
  .setNegativeButton("取消",nil)
  .setNeutralButton("复制颜色",{onClick=function()
      local a=拖动一.getProgress()
      local r=拖动二.getProgress()
      local g=拖动三.getProgress()
      local b=拖动四.getProgress()
      local argb_hex=(a<<24|r<<16|g<<8|b)
      local argb_str=string.format("%#x", argb_hex)
      activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(argb_str)
    end})
  argbDialog=argbBuild.create()
  弹窗圆角(argbDialog.getWindow(),0xffffffff)
  function showArgbDialog()
    argbDialog.show()
    updateArgb()
  end
  showArgbDialog()
  对话框按钮颜色(argbDialog,1,副色)
  对话框按钮颜色(argbDialog,2,副色)
  对话框按钮颜色(argbDialog,3,副色)
  拖动条颜色(拖动一,0xff000000)
  拖动条颜色(拖动二,0xffff0000)
  拖动条颜色(拖动三,0xFF1DE9B6)
  拖动条颜色(拖动四,0xFF6699FF)
end
function 无id输入对话框(标题,信息2,事件)
  Download_layout={
    LinearLayout;
    orientation="vertical";
    id="Download_father_layout",
    {
      EditText;
      id="texteditnn",
      layout_width="80%w";
      layout_gravity="center";
    };
  };

  dialog=AlertDialog.Builder(this)
  .setTitle(标题)
  .setMessage("你还没有设置控件id,请先设置：")
  .setView(loadlayout(Download_layout))
  .setPositiveButton("确定",{onClick=function(v)
      内容=texteditnn.Text
      设置("id",内容)
      dialog2=AlertDialog.Builder(this)
      .setMessage(信息2)
      .setView(loadlayout(Download_layout))
      .setPositiveButton("确定",{onClick=function(v)
          内容2=texteditnn.Text
          assert(loadstring(事件))()
          Toast.makeText(activity,"设置完成", Toast.LENGTH_LONG).show()
        end})
      .setNegativeButton("取消",{onClick=function(v)
        end})
      .show()
      dialog2.create()
      弹窗圆角(dialog2.getWindow(),0xFFffffff)
    end})
  .setNegativeButton("取消",{onClick=function(v)
    end})
  .show()
  dialog.create()
  弹窗圆角(dialog.getWindow(),0xFFffffff)
end
function 有id输入对话框(标题,信息2,事件)
  Download_layout={
    LinearLayout;
    orientation="vertical";
    id="Download_father_layout",
    {
      EditText;
      id="texteditnn",
      layout_width="80%w";
      layout_gravity="center";
    };
  };
  内容=curr["id"]
  dialog2=AlertDialog.Builder(this)
  .setTitle(标题)
  .setMessage(信息2)
  .setView(loadlayout(Download_layout))
  .setPositiveButton("确定",{onClick=function(v)
      内容2=texteditnn.Text
      assert(loadstring(事件))()
      Toast.makeText(activity,"设置完成", Toast.LENGTH_LONG).show()
    end})
  .setNegativeButton("取消",{onClick=function(v)
    end})
  .show()
  dialog2.create()
  弹窗圆角(dialog2.getWindow(),0xFFffffff)
end
function 设置控件id对话框()
  Download_layout={
    LinearLayout;
    orientation="vertical";
    id="Download_father_layout",
    {
      EditText;
      id="texteditnn",
      layout_width="80%w";
      layout_gravity="center";
      hint='中英文都可'
    };
  };

  dialog=AlertDialog.Builder(this)
  .setTitle("设置控件id")
  .setMessage("注意！每个控件id必须不同")
  .setView(loadlayout(Download_layout))
  .setPositiveButton("确定",{onClick=function(v)
      内容2=texteditnn.Text
      设置("id",内容2)
      Toast.makeText(activity,"设置完成", Toast.LENGTH_LONG).show()
    end})
  .setNegativeButton("取消",{onClick=function(v)
    end})
  .show()
  dialog.create()
  弹窗圆角(dialog.getWindow(),0xFFffffff)
  texteditnn.Text=curr["id"]
end
function 更改控件id对话框()
  Download_layout={
    LinearLayout;
    orientation="vertical";
    id="Download_father_layout",
    {
      EditText;
      id="texteditnn",
      layout_width="80%w";
      layout_gravity="center";
      hint='中英文都可'
    };
  };
  原来id=curr["id"]
  dialog=AlertDialog.Builder(this)
  .setTitle("设置控件id")
  .setMessage("注意！每个控件id必须不同")
  .setView(loadlayout(Download_layout))
  .setPositiveButton("确定",{onClick=function(v)
      原来事件=io.open("/sdcard/訫/data/temporary/"..原来id):read("*a")
      内容2=texteditnn.Text
      io.open("/sdcard/訫/data/temporary/"..内容2,"w"):write(原来事件):close()
      os.execute("rm -r ".."/sdcard/訫/data/temporary/"..原来id)
      设置("id",内容2)
      Toast.makeText(activity,"设置完成", Toast.LENGTH_LONG).show()
    end})
  .setNegativeButton("取消",{onClick=function(v)
    end})
  .show()
  dialog.create()
  弹窗圆角(dialog.getWindow(),0xFFffffff)
  texteditnn.Text=curr["id"]
end
function 更改浏览器控件id对话框()
  Download_layout={
    LinearLayout;
    orientation="vertical";
    id="Download_father_layout",
    {
      EditText;
      id="texteditnn",
      layout_width="80%w";
      layout_gravity="center";
      hint='中英文都可'
    };
  };
  原来id=curr["id"]
  dialog=AlertDialog.Builder(this)
  .setTitle("设置控件id")
  .setMessage("注意！每个控件id必须不同")
  .setView(loadlayout(Download_layout))
  .setPositiveButton("确定",{onClick=function(v)
      原来事件=io.open("/sdcard/訫/data/web/"..原来id):read("*a")
      内容2=texteditnn.Text
      io.open("/sdcard/訫/data/web/"..内容2,"w"):write(原来事件):close()
      os.execute("rm -r ".."/sdcard/訫/data/web/"..原来id)
      设置("id",内容2)
      Toast.makeText(activity,"设置完成", Toast.LENGTH_LONG).show()
    end})
  .setNegativeButton("取消",{onClick=function(v)
    end})
  .show()
  dialog.create()
  弹窗圆角(dialog.getWindow(),0xFFffffff)
  texteditnn.Text=curr["id"]
end
function 更改video控件id对话框()
  Download_layout={
    LinearLayout;
    orientation="vertical";
    id="Download_father_layout",
    {
      EditText;
      id="texteditnn",
      layout_width="80%w";
      layout_gravity="center";
      hint='中英文都可'
    };
  };
  原来id=curr["id"]
  dialog=AlertDialog.Builder(this)
  .setTitle("设置控件id")
  .setMessage("注意！每个控件id必须不同")
  .setView(loadlayout(Download_layout))
  .setPositiveButton("确定",{onClick=function(v)
      原来事件=io.open("/sdcard/訫/data/video/"..原来id):read("*a")
      内容2=texteditnn.Text
      io.open("/sdcard/訫/data/video/"..内容2,"w"):write(原来事件):close()
      os.execute("rm -r ".."/sdcard/訫/data/video/"..原来id)
      设置("id",内容2)
      Toast.makeText(activity,"设置完成", Toast.LENGTH_LONG).show()
    end})
  .setNegativeButton("取消",{onClick=function(v)
    end})
  .show()
  dialog.create()
  弹窗圆角(dialog.getWindow(),0xFFffffff)
  texteditnn.Text=curr["id"]
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
function 点击事件_有id发送对话框()
  Download_layout={
    LinearLayout;
    orientation="vertical";
    id="Download_father_layout",
    {
      TextView;
      text="输入内容标题：",
      layout_width="80%w";
      layout_gravity="center";
    };
    {
      EditText;
      id="ed1",
      layout_width="80%w";
      layout_gravity="center";
    };
    {
      TextView;
      text="输入发送的内容：",
      layout_width="80%w";
      layout_gravity="center";
    };
    {
      EditText;
      id="ed2",
      layout_width="80%w";
      layout_gravity="center";
    };
    {
      TextView;
      text="确定按钮名称：",
      layout_width="80%w";
      layout_gravity="center";
    };
    {
      EditText;
      id="ed3",
      layout_width="80%w";
      layout_gravity="center";
    };
    {
      TextView;
      text="取消按钮名称：",
      layout_width="80%w";
      layout_gravity="center";
    };
    {
      EditText;
      id="ed4",
      layout_width="80%w";
      layout_gravity="center";
    };
  };

  dialog=AlertDialog.Builder(this)
  .setMessage("提示：我就是一个对话框,以下均非必填")
  .setView(loadlayout(Download_layout))
  .setPositiveButton("确定",{onClick=function(v)
      标题=ed1.Text 内容=ed2.Text 按钮1=ed3.Text 按钮2=ed4.Text
      执行路径="/sdcard/訫/data/temporary/"..curr["id"]
      io.open(执行路径,"w"):write([[AlertDialog.Builder(this)
.setTitle("]]..标题..[[")
.setMessage("]]..内容..[[")
.setPositiveButton("]]..按钮1..[[",function()

end)
.setNegativeButton("]]..按钮2..[[",nil)
.show();]]):close()
      Toast.makeText(activity,"设置完成", Toast.LENGTH_LONG).show()
    end})
  .setNegativeButton("取消",{onClick=function(v)
    end})
  .show()
  dialog.create()
  弹窗圆角(dialog.getWindow(),0xFFffffff)
end
function 点击事件_无id发送对话框()
  Downloa_layout={
    LinearLayout;
    orientation="vertical";
    id="Download_father_layout",
    {
      EditText;
      id="texteditnn",
      layout_width="80%w";
      layout_gravity="center";
    };
  };

  dialog=AlertDialog.Builder(this)
  .setMessage("你还没有设置控件id,请先设置：")
  .setView(loadlayout(Downloa_layout))
  .setPositiveButton("确定",{onClick=function(v)
      内容=texteditnn.Text
      设置("id",内容)
      Download_layout={
        LinearLayout;
        orientation="vertical";
        id="Download_father_layout",
        {
          TextView;
          text="输入内容标题：",
          layout_width="80%w";
          layout_gravity="center";
        };
        {
          EditText;
          id="ed1",
          layout_width="80%w";
          layout_gravity="center";
        };
        {
          TextView;
          text="输入发送的内容：",
          layout_width="80%w";
          layout_gravity="center";
        };
        {
          EditText;
          id="ed2",
          layout_width="80%w";
          layout_gravity="center";
        };
        {
          TextView;
          text="确定按钮名称：",
          layout_width="80%w";
          layout_gravity="center";
        };
        {
          EditText;
          id="ed3",
          layout_width="80%w";
          layout_gravity="center";
        };
        {
          TextView;
          text="取消按钮名称：",
          layout_width="80%w";
          layout_gravity="center";
        };
        {
          EditText;
          id="ed4",
          layout_width="80%w";
          layout_gravity="center";
        };
      };

      dialog=AlertDialog.Builder(this)
      .setMessage("提示：我就是一个对话框,以下均非必填")
      .setView(loadlayout(Download_layout))
      .setPositiveButton("确定",{onClick=function(v)
          标题=ed1.Text 内容=ed2.Text 按钮1=ed3.Text 按钮2=ed4.Text
          执行路径="/sdcard/訫/data/temporary/"..内容
          io.open(执行路径,"w"):write([[AlertDialog.Builder(this)
.setTitle("]]..标题..[[")
.setMessage("]]..内容..[[")
.setPositiveButton("]]..按钮1..[[",function()

end)
.setNegativeButton("]]..按钮2..[[",nil)
.show();]]):close()
          Toast.makeText(activity,"设置完成", Toast.LENGTH_LONG).show()
        end})
      .setNegativeButton("取消",{onClick=function(v)
        end})
      .show()
      dialog.create()
      弹窗圆角(dialog.getWindow(),0xFFffffff)
    end})
  .setNegativeButton("取消",{onClick=function(v)
    end})
  .show()
  dialog.create()
  弹窗圆角(dialog.getWindow(),0xFFffffff)
end
function 备份布局()
  Download_layout={
    LinearLayout;
    orientation="vertical";
    {
      EditText;
      id="linked",
      layout_width="80%w";
      layout_gravity="center";
    };
  };
  使用说明= AlertDialog.Builder(this)
  .setTitle([==[备份此布局?]==])
  .setMessage("已支持备份事件,请输入名称：")
  .setView(loadlayout(Download_layout))
  .setPositiveButton("确定",{onClick=function(v)
      标题=linked.Text
      save(dumplayout2(layout.main))
      activity.setResult(10000,Intent());
      io.open("/sdcard/訫/data/layout.aly","w"):write(dumplayout2(layout.main)):close()
      LuaUtil.copyDir("/sdcard/訫/data/layout.aly","/sdcard/訫/MyApp/layout.aly")
      LuaUtil.copyDir("/sdcard/訫/data/layout.aly","/sdcard/訫/data/zip/layout.aly")
      os.execute("rm -r ".."/storage/emulated/0/訫/data/zip/temporary/")
      LuaUtil.copyDir("/sdcard/訫/data/temporary","/sdcard/訫/data/zip/temporary")
      os.execute("rm -r ".."/storage/emulated/0/訫/data/zip/web/")
      LuaUtil.copyDir("/sdcard/訫/data/web","/sdcard/訫/data/zip/web")
      os.execute("rm -r ".."/storage/emulated/0/訫/data/zip/video/")
      LuaUtil.copyDir("/sdcard/訫/data/web","/sdcard/訫/data/zip/video")
      ZipUtil.zip("/storage/emulated/0/訫/data/zip","/storage/emulated/0/訫/布局备份/")
      File("/storage/emulated/0/訫/布局备份/zip.zip").renameTo(File("/storage/emulated/0/訫/布局备份/"..标题..".VE"))
      Toast.makeText(activity,"已备份",1000).show()
      activity.finish()
    end})
  .setNegativeButton("取消",nil)
  .show();
  使用说明.create()
  弹窗圆角(使用说明.getWindow(),0xFFffffff)
end
function 使用说明()
  使用说明= AlertDialog.Builder(this)
  .setMessage([==[使用说明：
√添加的控件都在左上角(仔细看)
✓控件id不能重复！
√拖动控件可移动
√拖动控件边缘可拉伸
√点击控件调试布局
✓注意！图片和背景只能在预览中显示出来
✓右上角点击预览
✓预览不能触发点击事件
✓调试浏览器控件需要点击子控件进入]==])
  .show();
  使用说明.create()
  弹窗圆角(使用说明.getWindow(),0xFFffffff)
end

function src_link()
  Download_layout={
    LinearLayout;
    orientation="vertical";
    id="Download_father_layout",
    {
      EditText;
      id="linkedit",
      layout_width="80%w";
      layout_gravity="center";
    };
  };
  dialog=AlertDialog.Builder(this)
  .setMessage("请输入图片链接")
  .setView(loadlayout(Download_layout))
  .setPositiveButton("确定",{onClick=function(v)
      设置('src',linkedit.Text)
      Toast.makeText(activity,"设置成功", Toast.LENGTH_LONG).show()
    end})
  .setNegativeButton("取消",nil)
  .show()
  dialog.create()
  弹窗圆角(dialog.getWindow(),0xFFffffff)
end