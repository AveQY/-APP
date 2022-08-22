----------------弹窗区*********************
function 弹窗(内容)
  Toast.makeText(activity,内容,Toast.LENGTH_LONG).show()
end
function 自定义位置弹窗(内容,x轴,Y轴)
  Toast.makeText(activity,内容, Toast.LENGTH_LONG).setGravity(Gravity.CENTER,x轴,Y轴).show()
end
function MD弹窗(内容,颜色,文字颜色,阴影,圆角)
  if time then toasttime=Toast.LENGTH_SHORT else toasttime= Toast.LENGTH_SHORT end
  toasts={
    CardView;
    id="toastb",
    CardElevation=阴影;
    radius=圆角;
    backgroundColor=颜色;
    {
      TextView;
      layout_margin="7dp";
      textSize="13sp";
      TextColor=文字颜色,
      text=内容;
      layout_gravity="center";
      id="mess",
    };
  };
  local toast=Toast.makeText(activity,nil,toasttime);
  toast.setView(loadlayout(toasts))
  toast.show()
end
function 底部弹窗(内容,按钮,颜色,背景颜色)
  import "android.animation.Animator"
  SnackerBar={shouldDismiss=true}
  import "android.animation.ValueAnimator"
  local w=activity.width
  import "android.view.animation.AccelerateDecelerateInterpolator"
  local layout={
    LinearLayout,
    Gravity="bottom",
    {
      LinearLayout,
      layout_height=-2,
      layout_width=-1,
      Gravity="center",
      BackgroundColor=背景颜色,
      {
        TextView,
        textColor=颜色,
        layout_weight=.8,
        paddingLeft="10dp",
        paddingTop="5dp",
        paddingBottom="5dp",
        layout_width=0,
      },
      {Button,
        layout_height=-2,
        style="?android:attr/buttonBarButtonStyle",
        text="DONE",
      }
    }
  }
  local function addView(view)
    local mLayoutParams=ViewGroup.LayoutParams
    (-1,-1)
    activity.Window.DecorView.addView(view,mLayoutParams)
  end
  local function removeView(view)
    activity.Window.DecorView.removeView(view)
  end
  function SnackerBar:msg(textMsg)
    self.textView.text=textMsg
    return self
  end
  function SnackerBar:actionText(textAction)
    self.actionView.text=textAction
    return self
  end
  function SnackerBar:action(func)
    self.actionView.onClick=
    function()
      func()
      self:dismiss()
    end
    return self
  end
  function SnackerBar:show()
    local view=self.view
    addView(view)
    view.translationY=300
    view.animate().translationY(0)
    .setInterpolator(AccelerateDecelerateInterpolator())
    .setDuration(400).start()
    indefiniteDismiss(self)
  end
  function indefiniteDismiss(snackerBar)
    task(2000,function()
      if snackerBar.shouldDismiss==true then
        snackerBar:dismiss()
       else
        indefiniteDismiss(snackerBar)
      end
    end)
  end
  function SnackerBar:dismiss()
    local view=self.view
    view.animate().translationY(300)
    .setDuration(400)
    .setListener(Animator.AnimatorListener{
      onAnimationEnd=function()
        removeView(view)
      end
    }).start()
  end
  SnackerBar.__index=SnackerBar
  function SnackerBar.build()
    local mSnackerBar={}
    setmetatable(mSnackerBar,SnackerBar)
    mSnackerBar.view=loadlayout(layout)
    mSnackerBar.bckView=mSnackerBar.view
    .getChildAt(0)
    mSnackerBar.textView=mSnackerBar.bckView
    .getChildAt(0)
    mSnackerBar.actionView=mSnackerBar.bckView
    .getChildAt(1)
    local function animate(v,tx,dura)
      ValueAnimator().ofFloat({v.translationX,tx}).setDuration(dura)
      .addUpdateListener( ValueAnimator.AnimatorUpdateListener
      {
        onAnimationUpdate=function( p1)
          local f=p1.animatedValue
          v.translationX=f
          v.alpha=1-math.abs(v.translationX)/w
        end
      }).addListener(ValueAnimator.AnimatorListener{
        onAnimationEnd=function()
          if math.abs(tx)>=w then
            removeView(mSnackerBar.view)
          end
        end
      }).start()
    end
    local frx,p,v,fx=0,0,0,0
    mSnackerBar.bckView.setOnTouchListener(View.OnTouchListener{
      onTouch=function(view,event)
        if event.Action==event.ACTION_DOWN then
          mSnackerBar.shouldDismiss=false
          frx=event.x
          fx=event.x
         elseif event.Action==event.ACTION_MOVE then
          if math.abs(event.rawX-frx)>=2 then
            v=math.abs((frx-event.rawX)/(os.clock()-p)/1000)
          end
          p=os.clock()
          frx=event.rawX
          view.translationX=frx-fx
          view.alpha=1-math.abs(view.translationX)/w
         elseif event.Action==event.ACTION_UP then
          mSnackerBar.shouldDismiss=true
          local tx=view.translationX
          if tx>=w/5 then
            animate(view,w,(w-tx)/v)
           elseif tx>0 and tx<w/5 then
            animate(view,0,tx/v)
           elseif tx<=-w/5 then
            animate(view,-w,(w+tx)/v)
           else
            animate(view,0,-tx/v)
          end
          fx=0
        end
        return true
      end
    })
    return mSnackerBar
  end
  SnackerBar.build()
  :msg(内容)
  :actionText(按钮)
  --:action(function() end)
  :show()
end

----------------对话框区--------****************************
function 对话框(标题,内容,按钮1,按钮2,按钮3)
  AlertDialog.Builder(this)
  .setTitle(标题)
  .setMessage(内容)
  .setPositiveButton(按钮1,function()

  end)
  .setNegativeButton(按钮2,nil)
  .setNeutralButton(按钮3,nil)
  .show();
end
function 圆角对话框(标题,内容,按钮1,按钮2,按钮3)
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
  .setTitle(标题)
  .setMessage(内容)
  --.setView(loadlayout(Download_layout))
  .setPositiveButton(按钮1,{onClick=function(v)
    end})
  .setNegativeButton(按钮2,nil)
  .setNeutralButton(按钮3,nil)
  .show()
  dialog.create()
  --dialog.getButton(dialog.BUTTON_POSITIVE).setTextColor(0xFFFF7272)
  --dialog.getButton(dialog.BUTTON_NEGATIVE).setTextColor(0xFFFFFFFF)
  --dialog.getButton(dialog.BUTTON_NEUTRAL).setTextColor(0xFFFFFFFF)
  Drawable_round(dialog.getWindow(),0xFFffffff)
end



-------------功能区------------------------------------------------------*****************
function 设置文本(控件身份证,内容)
  控件身份证.setText(内容)
end

function 跳转窗口(新界面)
  activity.newAcivity(新界面)
end
function 关闭窗口()
  activity.finish()
end
function 二次返回(内容)
  参数=0
  function onKeyDown(code,event)
    if string.find(tostring(event),"KEYCODE_BACK") ~= nil then
      if 参数+2 > tonumber(os.time()) then
        activity.finish()
       else
        Toast.makeText(activity,内容,Toast.LENGTH_SHORT )
        .show()
        参数=tonumber(os.time())
      end
      return true
    end
  end
end
function 打开(程序包名)
  packageName=程序包名
  import "android.content.Intent"
  import "android.content.pm.PackageManager"
  manager = activity.getPackageManager()
  open = manager.getLaunchIntentForPackage(packageName)
  this.startActivity(open)
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
function 隐藏标题栏()
  activity.ActionBar.hide()
end
function 沉浸状态栏()
  if Build.VERSION.SDK_INT >= 21 then
    activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xff4285f4);
  end
  if Build.VERSION.SDK_INT >= 19 then
    activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
  end
end

function 加载框(内容,时间)
  local dl=ProgressDialog.show(activity,nil,内容)
  dl.show()
  local a=0
  local tt=Ticker()
  tt.start()
  tt.onTick=function()
    a=a+1
    if a==时间 then
      dl.dismiss()
      tt.stop()
    end
  end
end
function 分享内容(标题,内容)
  import "android.content.Intent"
  intent=Intent(Intent.ACTION_SEND);
  intent.setType("text/plain");
  intent.putExtra(Intent.EXTRA_SUBJECT,"分享");
  intent.putExtra(Intent.EXTRA_TEXT,内容);
  intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
  activity.startActivity(Intent.createChooser(intent,标题));
end
function 跳转QQ群(qq)
  activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse("mqqapi://card/show_pslcard?src_type=internal&version=1&uin="..qq.."&card_type=group&source=qrcode")))
end
function QQ聊天(qq)
  import "android.net.Uri"
  import "android.content.Intent"
  activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse("mqqwpa://im/chat?chat_type=wpa&uin="..qq)))
end
function 获取剪切板()
  return activity.getSystemService(Context.CLIPBOARD_SERVICE).getText()
end
function 写入剪切板(内容)
  activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(内容)
end
function 写入文件(文件路径,内容)
  return io.open(文件路径,"w"):write(内容):close()
end
function 创建文件(路径,文件名)
  io.open(路径..文件名,'w')
end
function 创建文件夹(路径,文件夹名称)
  import "java.io.File"
  File(路径..文件夹名称).mkdirs()
end
function 删除文件(路径)
  os.execute("rm -r "..路径)
end
function 复制文件(旧文件路径,新文件路径及移动后的文件名)
  LuaUtil.copyDir(旧文件路径,新文件路径及移动后的文件名)
end
function 更新文件(路径,更新内容)
  io.open(路径,"a+"):write(更新内容):close()
end
function 打开网址(网址)
  import "android.content.Intent"
  import "android.net.Uri"
  viewIntent = Intent("android.intent.action.VIEW",Uri.parse(网址))
  activity.startActivity(viewIntent)
end
function 打开WIFI()
  import "android.content.Context"
  wifi = activity.Context.getSystemService(Context.WIFI_SERVICE)
  wifi.setWifiEnabled(true)
end
function 关闭WIFI()
  import "android.content.Context"
  wifi = activity.Context.getSystemService(Context.WIFI_SERVICE)
  wifi.setWifiEnabled(false)
end
function 网速监听(mTextView1)
  function update(s)
    设置文本(mTextView1,s.."k/s")
  end
  function f()
    require "import"
    import "android.net.TrafficStats"
    s=TrafficStats.getTotalRxBytes()
    Thread.sleep(500)
    call("update",(TrafficStats.getTotalRxBytes()-s)*2/1000)
  end
  timer(f,0,1000)
end
function 播放视频(链接)
  import "android.content.Intent"
  import "android.net.Uri"
  intent = Intent(Intent.ACTION_VIEW)
  uri = Uri.parse(链接)
  intent.setDataAndType(uri,"video/mp4")
  activity.startActivity(intent)
end
function 播放音乐(链接)
  mediaPlayer = MediaPlayer()
  mediaPlayer.reset()
  mediaPlayer.setDataSource(链接)
  mediaPlayer.prepare()
  mediaPlayer.setLooping(true)
  mediaPlayer.isPlaying()
  task(1000,function()
    mediaPlayer.start()
  end)
end
function 设置图片(ID,icon)
  ID.setImageBitmap(loadbitmap(activity.getLuaDir()..icon))
end
function 打开微信()
  import "android.content.Intent"
  import "android.content.pm.PackageManager"
  manager = activity.getPackageManager()
  open = manager.getLaunchIntentForPackage("com.tencent.mm")
  this.startActivity(open)
end
function 微信扫一扫()
  intent=Intent()
  intent.setComponent(ComponentName("com.tencent.mm","com.tencent.mm.ui.LauncherUI"))
  intent.putExtra("LauncherUI.From.Scaner.Shortcut",true)
  intent.setFlags(335544320)
  intent.setAction("android.intent.action.VIEW")
  activity.startActivity(intent)
end
function 禁止截屏()
  this.getWindow().addFlags(WindowManager.LayoutParams.FLAG_SECURE)
end
function 截取网页内容(链接,截取开端,截取末尾)
  Http.get(链接,function(a,b)
    if a==200 then
      截取内容=b:match(截取开端..'(.-)'..截取末尾)
     else
      弹窗("请检查网络")
    end
  end)
end
function 获取文件大小(路径)
  import "java.io.File"
  import "android.text.format.Formatter"
  size=File(tostring(路径)).length()
  Sizes=Formatter.formatFileSize(activity, size)
  return Sizes
end
function 写入剪切板(内容)
  import "android.content.Context"
  activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(内容)
end
function 获取剪切板()
  import "android.content.Context"
  a=activity.getSystemService(Context.CLIPBOARD_SERVICE).getText()
  return a
end
function 下载文件(下载链接,保存文件路径)
  import "http"
  http.download(下载链接,保存文件路径)
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

-------------控件区-------------------------------------------------------*****************
function 设置控件颜色(控件ID,颜色)
  控件ID.setBackgroundColor(颜色)
end
function 设置控件图片(控件ID,路径)
  控件ID.setImageBitmap(loadbitmap(路径))
end
function 隐藏控件(控件ID)
  控件ID.setVisibility(View.INVISIBLE)
end
function 显示控件(控件ID)
  控件ID.setVisibility(View.VISIBLE)
end
function 控件消失(控件ID)
  控件ID.setVisibility(View.GONE)
end
function 控件圆角(控件ID,角度,颜色)
  import "android.graphics.drawable.GradientDrawable"
  drawable = GradientDrawable()
  drawable.setShape(GradientDrawable.RECTANGLE)
  drawable.setColor(颜色)
  drawable.setCornerRadii({角度,角度,角度,角度,角度,角度,角度,角度});
  控件ID.setBackgroundDrawable(drawable)
end
function 控件颜色渐变(控件ID,颜色1,颜色2,颜色3,颜色4)
  import "android.graphics.drawable.GradientDrawable"
  控件ID.setBackgroundDrawable(GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM,{颜色1,颜色2,颜色3,颜色4,}))
end
