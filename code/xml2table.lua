require "import"
import "console"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "android.content.*"
import "com.androlua.*"
import "loadlayout3"
activity.setTheme(R.Theme_Black)
cm=activity.getSystemService(Context.CLIPBOARD_SERVICE)
t= {
  RelativeLayout;
  id="l",
  {LinearLayout,
    orientation="vertical",
    {
      LuaEditor,
      id="edit",
      --hint= "XML布局代码转换AndroLua布局表",
      layout_width="fill",
      layout_height="fill",
      layout_weight=1,
    },
    {
      HorizontalScrollView;
      backgroundColor="#ff00cbb8";
      layout_height="45dp";
      layout_width="fill";
      horizontalScrollBarEnabled=false;
      {
        LinearLayout;
        gravity="center";
        layout_width="fill";
        layout_height="fill";
        id="ps_bar";
      };
    };
    {
      LinearLayout,
      layout_width="fill",
      backgroundColor="#ff00cbb8";
      {
        Button,
        id="open",
        text="转换",
        layout_width="fill",
        layout_weight=1,
        onClick ="click",
      } ,
      {
        Button,
        id="open",
        text="预览",
        layout_width="fill",
        layout_weight=1,
        onClick ="click2",
      } ,
      {
        Button,
        id="open",
        text="复制",
        layout_width="fill",
        layout_weight=1,
        onClick ="click3",
      } ,
      {
        Button,
        id="open",
        text="确定",
        layout_width="fill",
        layout_weight=1,
        onClick ="click4",
      } ,
    }
  }
}

function xml2table(xml)
  local xml,s=xml:gsub("</%w+>","}")
  if s==0 then
    return xml
  end
  xml=xml:gsub("<%?[^<>]+%?>","")
  xml=xml:gsub("xmlns:android=%b\"\"","")
  xml=xml:gsub("%w+:","")
  xml=xml:gsub("\"([^\"]+)\"",function(s)return (string.format("\"%s\"",s:match("([^/]+)$")))end)
  xml=xml:gsub("[\t ]+","")
  xml=xml:gsub("\n+","\n")
  xml=xml:gsub("^\n",""):gsub("\n$","")
  xml=xml:gsub("<","{"):gsub("/>","}"):gsub(">",""):gsub("\n",",\n")
  return (xml)
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

dlg=Dialog(activity,R.Theme_Black)
dlg.setTitle("预览")

function show(s)
  dlg.setContentView(loadlayout3(loadstring("return "..s)(),{}))
  dlg.show()
end

function click()
  local str=edit.getText().toString()
  str=xml2table(str)
  str=console.format(str)
  edit.setText(str)
end

function click2()
  local str=edit.getText().toString()
  show(str)
end


function click3(s)
  local cd = ClipData.newPlainText("label", edit.getText().toString())
  cm.setPrimaryClip(cd)
  Toast.makeText(activity,"已复制的剪切板",1000).show()
end

function click4()
  local str=edit.getText().toString()
  layout.main=loadstring("return "..str)()
  activity.setContentView(loadlayout2(layout.main,{}))
  dlg2.hide()

end


loadlayout(t)


dlg2=Dialog(activity,android.R.style.Theme_Holo_Light)
dlg2.setTitle("编辑代码")
dlg2.getWindow().setSoftInputMode(0x10)

dlg2.setContentView(l)




--剪切板重写

悬浮框架=
{
  LinearLayout,--线性布局
  gravity='center';--重力
  orientation='vertical',--方向
  layout_width='fill',--宽度
  layout_height='525dp',--高度
  Visibility="8";--明显性~布局属性
  id="fugongneng",--控件ID

  {
    CardView;--卡片控件
    layout_marginRight="2%w",--布局右距
    layout_gravity='center|right';--重力
    layout_marginTop="5%w",--布局右距
    layout_marginBottom="5%w",--布局右距
    --左:left 右:right 中:center 顶:top 底:bottom
    elevation='5';--阴影
    layout_width='60dp';--宽度
    layout_height='200dp';--高度
    CardBackgroundColor='#ffc396e8';--颜色
    radius='10dp';--圆角
    {
      LinearLayout,--线性布局
      gravity='center';--重力
      orientation='vertical',--方向
      layout_width='fill',--宽度
      layout_height='fill',--高度
      backgroundColor="#ff00cbb8";
      {
        Button;--按钮控件
        text='全选';--显示文字
        textSize='14dp';--文字大小
        textColor='#ffffffff';--文字颜色
        backgroundColor="#ff00cbb8";
        layout_width='fill';--宽度
        layout_height='40dp';--高度
        id="fxn2";
      };
      {
        Button;--按钮控件
        text='剪切';--显示文字
        textSize='14dp';--文字大小
        textColor='#ffffffff';--文字颜色
        backgroundColor="#ff00cbb8";
        layout_width='fill';--宽度
        layout_height='40dp';--高度
        id="fxn3";
      };
      {
        Button;--按钮控件
        text='复制';--显示文字
        textSize='14dp';--文字大小
        textColor='#ffffffff';--文字颜色
        backgroundColor="#ff00cbb8";
        layout_width='fill';--宽度
        layout_height='40dp';--高度
        id="fxn4";
      };
      {
        Button;--按钮控件
        text='粘贴';--显示文字
        textSize='14dp';--文字大小
        textColor='#ffffffff';--文字颜色
        backgroundColor="#ff00cbb8";
        layout_width='fill';--宽度
        layout_height='40dp';--高度
        id="fxn5";
      };
      {
        Button;--按钮控件
        text='退出';--显示文字
        textSize='14dp';--文字大小
        textColor='#ffffffff';--文字颜色
        backgroundColor="#ff00cbb8";
        layout_width='fill';--宽度
        layout_height='40dp';--高度
        id="fxn1";
      };
    };
  };
};


--创建布局在这里
mye=activity.getWindow().getDecorView()
l.addView(loadlayout(悬浮框架))



fxn1.onClick=function()--返回
  if sskkg==nil then
    edit.setSelection(ed)
    fugongneng.setVisibility(View.GONE)
   else
    edit.setSelection(ed)
    fugongneng.setVisibility(View.GONE)
  end
end

fxn2.onClick=function()--全选
  edit.selectAll()
end

fxn3.onClick=function()--剪切
  edit.cut()
  fugongneng.setVisibility(View.GONE)
end

fxn4.onClick=function()--复制
  edit.copy()
  fugongneng.setVisibility(View.GONE)
end

fxn5.onClick=function()--粘贴
  edit.paste()
  fugongneng.setVisibility(View.GONE)
end



function click(v)
  if (#v.Text == 1) then
    edit.paste(v.Text)
  end
  if (#v.Text == 2) then
    edit.paste(v.Text)
    edit.setSelection(edit.getSelectionStart()-1)
  end
  if (v.Text == "Fun") then
    edit.paste("function \n\nend")


  end
  if (v.Text == "重做") then
    edit.undo()

  end
  if (v.Text == "事件") then
    edit.paste("单击事件=[=[print('代码')]=]")

  end
  if (v.Text == "空行") then
    edit.paste("\n")



  end
  if (v.Text == "调色板") then

    颜色选择器()


  end
end
function newButton(text)
  local btn=TextView()
  btn.TextSize=14
  btn.Text=text
  btn.TextColor=Color.WHITE
  btn.width=100
  btn.height=ps_bar.getHeight()
  btn.onClick=click
  btn.setGravity(Gravity.CENTER)
  btn.setSingleLine(true)
  return btn
end



local ps={"Fun","重做","事件","空行","调色板","()" ,"(", ")", "[", "]","<",">","/",'"',"'", ";", ".", ",", "+", "-", "&", "|", "_", "^"}
for k, v in ipairs(ps) do
  ps_bar.addView(newButton(v))
end


edit.addNames({"ImageButton,--图片按钮控件","Button,--按钮控件","EditText,--编辑框控件","SearchView,--搜索框","CheckBox,--复选框","AbsoluteLayout,--绝对布局","TableLayout,--表格布局","ScrollView,--纵向滑动控件","HorizontalScrollView,--横向滑动控件","LinearLayout,--线性布局","FrameLayout,--帧布局","RelativeLayout,--相对布局","TextView,--文本框控件","  VideoView,--视频控件","LuaWebView,--浏览器控件","ListView,--列表视图控件","GridView,--网格控件","LuaEditor,--lua编辑框控件","layout_width='fill',--布局宽度","orientation='horizontal',--水平方向","orientation='vertical',--垂直方向","layout_height='fill',--布局高度","layout_weight='1',--权重值分配","gravity='center',--顶：top｜中：center｜左：left｜右：right｜底：bottom","background='#ffffffff',--布局背景","id='',--控件ID","layout_margin='8dp',--布局边距","layout_marginTop='15dp',--布局顶距","layout_marginLeft='4%w',--布局左距","layout_marginRight='4%w',--布局右距","layout_marginBottom='15dp',--布局底距","padding=2dp',--布局填充","gravity='top|center',--重力居顶｜置中","gravity='bottom|center',--重力居底｜置中","gravity='top|left',--重力居顶｜置左","gravity='top|right',--重力居顶｜置右"," gravity='left|center',--重力居左｜置中","gravity='right|center',--重力居右｜置中"})

edit.addNames({"src='drawable/icon.png',--视图路径","colorFilter='#ffffff',--图片颜色","scaleType='fitXY',--图片显示类型：centerCrop","text='文本内容',--文本内容","typeface=Typeface.DEFAULT_BOLD,--文本显示类型","textIsSelectable=true,--内容可选复制","radius='10dp',--圆角半径","cardElevation='12dp',--卡片提升","elevation='4dp',--阴影层次","cardBackgroundColor='#ffffff',--卡片背景色","alpha=0.6,--控件透明度","visibility=8,--不可视4--隐藏8--显示0","overScrollMode=View.OVER_SCROLL_NEVER,--隐藏圆弧阴影","imeOptions='actionSearch',--输入法Enter键","maxLength='10',--限制最多输入文字","inputType='number',--设置只可输入数字"})


edit.addNames({"ellipsize='end',--文字过长自动隐藏","password=true,--自动隐藏为*号","error='请输入',--气泡提示","hint='请输入',--内容为空时显示","focusable=false,--禁用编辑框","focusableInTouchMode=true,--禁止弹出输入法","verticalScrollBarEnabled=false,--隐藏纵向滑条","horizontalScrollBarEnabled=false,--隐藏横向滑条","enabled=false,--是否可使用","focusable=true,--是否可点击","fitsSystemWindows=true,--调用系统窗口","DividerHeight=0--设置无隔断线","ColorFilter=Color.BLUE--设置图片着色","MaxEms=5--设置每行最大宽度为五个字符的宽度","MaxLines=5--设置最大输入行数","singleLine=true--设置单行输入","wrap","for","fill","fill_parent","wrap_content"})
function 打开输入法(控件)
  import "android.widget.*"
  import "android.view.*"
  import "android.content.*"
  import "android.view.inputmethod.InputMethodManager"
  task(10,function()
    srfa = 控件.getContext().getSystemService(Context.INPUT_METHOD_SERVICE)
    srfa.toggleSoftInput(0,InputMethodManager.HIDE_NOT_ALWAYS)
    local jiaodian=控件--设置焦点到编辑框
    jiaodian.setFocusable(true)
    jiaodian.setFocusableInTouchMode(true)
    jiaodian.requestFocus()
    jiaodian.requestFocusFromTouch()
  end)
end

function editlayout(txt)
  edit.Text=txt
  edit.format()
  dlg2.show()
  --设置弹窗位置
  dlg2.getWindow().setGravity(Gravity.BOTTOM)
  --设置触摸弹窗外部隐藏弹窗
  dlg2.setCanceledOnTouchOutside(true);
  --设置弹窗宽度
  dlg2.getWindow().getAttributes().width = WindowManager.LayoutParams.MATCH_PARENT
  --设置弹窗高度
  dlg2.getWindow().getAttributes().height = activity.Height*0.55
  --点击显示弹窗
  弹窗圆角(dlg2.getWindow(),0xffffffff)
  打开输入法(edit)
end


function 编辑框选中监听()
  --全选,复制,剪切,粘贴,判断是否选中
  edit.OnSelectionChangedListener=function(status,Start,End)--判断是否选中
    if status == true then
      ed = End
      fugongneng.setVisibility(View.VISIBLE)
     else
      theY=nil
      fugongneng.setVisibility(View.GONE)
    end
  end
end


编辑框选中监听()
function onResume2()
  local cd=cm.getPrimaryClip();
  local msg=cd.getItemAt(0).getText()--.toString();
  edit.setText(msg)
end
