require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"

activity.setTheme(R.Theme_Black)
layout={
  LinearLayout;
  layout_height="fill";
  orientation="vertical";
  gravity="center";
  layout_width="fill";
  {
    LuaWebView;
    layout_height="match_parent";
    layout_width="match_parent";
    id='web',
  };
};
activity.setContentView(loadlayout(layout))


--[[

©--2022.8.23开源 
by訫念是你

]]

--标题栏返回按钮
activity.ActionBar.setDisplayHomeAsUpEnabled(true)

function onOptionsItemSelected(item)
  if item.Title==nil then
    activity.finish()
  end
end

import "http"
链接="https://support.qq.com/embed/phone/421179#label=show"

web.loadUrl(链接)
数据=web
openid="53555858107"
昵称 = "訫"
头像="https://www.helloimg.com/images/2022/06/19/ZSNYWm.png"
提交数据="openid="..openid.."&nickname="..昵称.."&avatar="..头像

数据.postUrl(链接,String(提交数据).getBytes())
