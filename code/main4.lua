require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "function"

activity.setTheme(R.Theme_Black)
activity.ActionBar.hide()
layout={
  LinearLayout;
  orientation="vertical";
  layout_height="fill";
  gravity="center";
  layout_width="fill";
  {
    ListView;
    layout_height="fill";
    layout_width="fill";
    id="list",
  };
};

activity.setContentView(loadlayout(layout))

主路径=...


function 设置对话框(参数)
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
      if 参数=="点击发送对话框" then
        执行路径=主路径.."/MyApp/onclick"
       elseif 参数=="长按发送对话框" then
        执行路径=主路径.."/MyApp/long"
       else
        执行路径=主路径.."/MyApp/automatic"
      end
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
  Drawable_round(dialog.getWindow(),0xFFffffff)
end

item={
  LinearLayout,
  orientation="vertical",
  layout_width="fill",
  {
    TextView,
    id="text",
    layout_margin="15dp",
    layout_height="28dp",
    layout_width="fill",TextSize="7dp"
  },
}

adpd={
  {
    text={
      text=("『点击事件』(点我关闭)"),
    },
  },
  {
    text={
      text=("点击发送弹窗"),
    },
  },
  {
    text={
      text=("点击发送对话框"),
    },
  },
  {
    text={
      text=("点击QQ聊天"),
    },
  },
  {
    text={
      text=("点击跳转到QQ群"),
    },
  },
  {
    text={
      text=("点击跳转到浏览器(自定义网址)"),
    },
  },
  {
    text={
      text=("点击删除文件"),
    },
  },
  {
    text={
      text=("点击横屏"),
    },
  },
  {
    text={
      text=("点击竖屏"),
    },
  },
  {
    text={
      text=("点击退出程序"),
    },
  },
  {
    text={
      text=("打开其它软件"),
    },
  },
  {
    text={
      text=("『长按事件』(点我关闭)"),
    },
  },
  {
    text={
      text=("长按发送弹窗"),
    },
  },
  {
    text={
      text=("长按发送对话框"),
    },
  },
  {
    text={
      text=("长按QQ聊天"),
    },
  },
  {
    text={
      text=("长按跳转到QQ群"),
    },
  },
  {
    text={
      text=("长按跳转到浏览器(自定义网址)"),
    },
  },
  {
    text={
      text=("长按删除文件"),
    },
  },
  {
    text={
      text=("长按横屏"),
    },
  },
  {
    text={
      text=("长按竖屏"),
    },
  },
  {
    text={
      text=("长按退出程序"),
    },
  },
  {
    text={
      text=("打开其它软件"),
    },
  },
  {
    text={
      text=("『进入软件自动执行』(点我关闭)"),
    },
  },
  {
    text={
      text=("发送弹窗"),
    },
  },
  {
    text={
      text=("发送对话框"),
    },
  },
  {
    text={
      text=("QQ聊天"),
    },
  },
  {
    text={
      text=("跳转到QQ群"),
    },
  },
  {
    text={
      text=("跳转到浏览器(自定义网址)"),
    },
  },
  {
    text={
      text=("删除文件"),
    },
  },
  {
    text={
      text=("自动横屏"),
    },
  },
}

adapter=LuaAdapter(this,adpd,item)
list.Adapter=adapter
list.onItemClick=function(l,v,p,id)
  ({
    function()
      io.open(主路径.."/MyApp/onclick","w"):write(""):close()
      Toast.makeText(activity,"已关闭", Toast.LENGTH_LONG).show()
    end,
    function()
      输入对话框(v.tag.text.Text,"输入发送的消息：",[[io.open(主路径.."/MyApp/onclick","w"):write('Toast.makeText(activity,"'..内容..'", Toast.LENGTH_LONG).show()'):close()]])
    end,
    function()
      设置对话框(v.tag.text.Text)
    end,
    function()
      输入对话框(v.tag.text.Text,"输入跳转的QQ号：(不要输自己的)",[==[io.open(主路径.."/MyApp/onclick","w"):write([[import "android.net.Uri" import "android.content.Intent" activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse("mqqwpa://im/chat?chat_type=wpa&uin=]]..内容..[[")))]]):close()]==])
    end,
    function()
      输入对话框(v.tag.text.Text,"输入跳转的QQ群号：",[==[io.open(主路径.."/MyApp/onclick","w"):write([[import "android.net.Uri" import "android.content.Intent" url="mqqapi://card/show_pslcard?src_type=internal&version=1&uin=]]..内容..[[&card_type=group&source=qrcode" activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))]]):close()]==])
    end,
    function()
      输入对话框(v.tag.text.Text,"输入跳转的网址：",[==[io.open(主路径.."/MyApp/onclick","w"):write([[import "android.content.Intent" import "android.net.Uri" url="]]..内容..[[" viewIntent = Intent("android.intent.action.VIEW",Uri.parse(url)) activity.startActivity(viewIntent)]]):close()]==])
    end,
    function()
      输入对话框(v.tag.text.Text,"输入删除文件路径：",[[io.open(主路径.."/MyApp/onclick","w"):write('os.execute("rm -r ".."'..内容..'")'):close()]])
    end,
    function()
      io.open(主路径.."/MyApp/onclick","w"):write('activity.setRequestedOrientation(0)'):close()
      Toast.makeText(activity,"设置完成", Toast.LENGTH_LONG).show()
    end,
    function()
      io.open(主路径.."/MyApp/onclick","w"):write('activity.setRequestedOrientation(1)'):close()
      Toast.makeText(activity,"设置完成", Toast.LENGTH_LONG).show()
    end,
    function()
      io.open(主路径.."/MyApp/onclick","w"):write('activity.finish()'):close()
      Toast.makeText(activity,"设置完成", Toast.LENGTH_LONG).show()
    end,
    function()
      输入对话框(v.tag.text.Text,"输入打开软件包名：",[=[io.open(主路径.."/MyApp/onclick","w"):write([[packageName="]]..内容..[["import "android.content.Intent" import "android.content.pm.PackageManager" manager = activity.getPackageManager() open = manager.getLaunchIntentForPackage(packageName) this.startActivity(open)]]):close()]=])
    end,
    function()
      io.open(主路径.."/MyApp/long","w"):write(""):close()
      Toast.makeText(activity,"已关闭", Toast.LENGTH_LONG).show()
    end,
    function()
      输入对话框(v.tag.text.Text,"输入发送的消息：",[[io.open(主路径.."/MyApp/long","w"):write('Toast.makeText(activity,"'..内容..'", Toast.LENGTH_LONG).show()'):close()]])
    end,
    function()
      设置对话框(v.tag.text.Text)
    end,
    function()
      输入对话框(v.tag.text.Text,"输入跳转的QQ号：(不要输自己的)",[==[io.open(主路径.."/MyApp/long","w"):write([[import "android.net.Uri" import "android.content.Intent" activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse("mqqwpa://im/chat?chat_type=wpa&uin=]]..内容..[[")))]]):close()]==])
    end,
    function()
      输入对话框(v.tag.text.Text,"输入跳转的QQ群号：",[==[io.open(主路径.."/MyApp/long","w"):write([[import "android.net.Uri" import "android.content.Intent" url="mqqapi://card/show_pslcard?src_type=internal&version=1&uin=]]..内容..[[&card_type=group&source=qrcode" activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))]]):close()]==])
    end,
    function()
      输入对话框(v.tag.text.Text,"输入跳转的网址：",[==[io.open(主路径.."/MyApp/long","w"):write([[import "android.content.Intent" import "android.net.Uri" url="]]..内容..[[" viewIntent = Intent("android.intent.action.VIEW",Uri.parse(url)) activity.startActivity(viewIntent)]]):close()]==])
    end,
    function()
      输入对话框(v.tag.text.Text,"输入删除文件路径：",[[io.open(主路径.."/MyApp/long","w"):write('os.execute("rm -r ".."'..内容..'")'):close()]])
    end,
    function()
      io.open(主路径.."/MyApp/long","w"):write('activity.setRequestedOrientation(0)'):close()
      Toast.makeText(activity,"设置完成", Toast.LENGTH_LONG).show()
    end,
    function()
      io.open(主路径.."/MyApp/long","w"):write('activity.setRequestedOrientation(1)'):close()
      Toast.makeText(activity,"设置完成", Toast.LENGTH_LONG).show()
    end,
    function()
      io.open(主路径.."/MyApp/long","w"):write('activity.finish()'):close()
      Toast.makeText(activity,"设置完成", Toast.LENGTH_LONG).show()
    end,
    function()
      输入对话框(v.tag.text.Text,"输入打开软件包名：",[=[io.open(主路径.."/MyApp/long","w"):write([[packageName="]]..内容..[["import "android.content.Intent" import "android.content.pm.PackageManager" manager = activity.getPackageManager() open = manager.getLaunchIntentForPackage(packageName) this.startActivity(open)]]):close()]=])
    end,
    function()
      io.open(主路径.."/MyApp/automatic","w"):write(""):close()
      Toast.makeText(activity,"已关闭", Toast.LENGTH_LONG).show()
    end,
    function()
      输入对话框(v.tag.text.Text,"输入发送的消息：",[[io.open(主路径.."/MyApp/automatic","w"):write('Toast.makeText(activity,"'..内容..'", Toast.LENGTH_LONG).show()'):close()]])
    end,
    function()
      设置对话框(v.tag.text.Text)
    end,
    function()
      输入对话框(v.tag.text.Text,"输入跳转的QQ号：(不要输自己的)",[==[io.open(主路径.."/MyApp/automatic","w"):write([[import "android.net.Uri" import "android.content.Intent" activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse("mqqwpa://im/chat?chat_type=wpa&uin=]]..内容..[[")))]]):close()]==])
    end,
    function()
      输入对话框(v.tag.text.Text,"输入跳转的QQ群号：",[==[io.open(主路径.."/MyApp/automatic","w"):write([[import "android.net.Uri" import "android.content.Intent" url="mqqapi://card/show_pslcard?src_type=internal&version=1&uin=]]..内容..[[&card_type=group&source=qrcode" activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))]]):close()]==])
    end,
    function()
      输入对话框(v.tag.text.Text,"输入跳转的网址：",[==[io.open(主路径.."/MyApp/automatic","w"):write([[import "android.content.Intent" import "android.net.Uri" url="]]..内容..[[" viewIntent = Intent("android.intent.action.VIEW",Uri.parse(url)) activity.startActivity(viewIntent)]]):close()]==])
    end,
    function()
      输入对话框(v.tag.text.Text,"输入删除文件路径：",[=[io.open(主路径.."/MyApp/automatic","w"):write([[os.execute("rm -r ".."]]..内容..[[")]]):close()]=])
    end,
    function()
      io.open(主路径.."/MyApp/automatic","w"):write('activity.setRequestedOrientation(0)'):close()
      Toast.makeText(activity,"设置完成", Toast.LENGTH_LONG).show()
    end,
  })[id]()
end