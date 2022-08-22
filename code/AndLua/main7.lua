require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"

--[[

©--2022.8.23开源 
by訫念是你

]]

activity.setTheme(R.Theme_Black)
activity.ActionBar.hide()
layout={
  LinearLayout;
  orientation="vertical";
  {
    LuaWebView;
    id="web";
    layout_width="match_parent";
    layout_height="match_parent";
  };
};
activity.setContentView(loadlayout(layout))
function bu()
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
bu()
web.loadUrl("file://"..activity.getLuaDir().."/Color/index.html")