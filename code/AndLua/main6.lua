require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "VE"

activity.setTheme(R.Theme_Teal)
activity.setTitle("运行结果")
layout={
  LinearLayout;
  orientation="vertical";
};
activity.setContentView(loadlayout(layout))

activity.ActionBar.setDisplayHomeAsUpEnabled(true)
function onOptionsItemSelected(item)
  if item.Title==nil then
    activity.finish()
  end
end

事件=...
assert(loadstring(事件))()