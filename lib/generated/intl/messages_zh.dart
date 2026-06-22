// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'zh';

  static String m0(color) => "已将 ${color} 复制到剪贴板";

  static String m1(message) => "错误: ${message}";

  static String m2(level) => "等级 ${level}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "appName": MessageLookupByLibrary.simpleMessage("Sylva"),
    "arrow": MessageLookupByLibrary.simpleMessage("箭头"),
    "autoDetectColors": MessageLookupByLibrary.simpleMessage("自动检测颜色"),
    "awesome": MessageLookupByLibrary.simpleMessage("太棒了！"),
    "back": MessageLookupByLibrary.simpleMessage("返回"),
    "blur": MessageLookupByLibrary.simpleMessage("模糊"),
    "brightness": MessageLookupByLibrary.simpleMessage("亮度"),
    "cancel": MessageLookupByLibrary.simpleMessage("取消"),
    "cancelMonthlyMessage": MessageLookupByLibrary.simpleMessage(
      "您已成功升级至终身版！因为您之前有一个包月订阅，请记得在 App Store/Google Play 中取消它，以避免被重复扣费。",
    ),
    "cancelMonthlyTitle": MessageLookupByLibrary.simpleMessage("需要采取操作"),
    "circle": MessageLookupByLibrary.simpleMessage("圆形"),
    "color": MessageLookupByLibrary.simpleMessage("颜色"),
    "colorCopiedFailure": MessageLookupByLibrary.simpleMessage("复制颜色失败"),
    "colorCopiedSuccess": m0,
    "confirmPassword": MessageLookupByLibrary.simpleMessage("确认密码"),
    "confirmPasswordRequired": MessageLookupByLibrary.simpleMessage("必须确认密码"),
    "createNewImage": MessageLookupByLibrary.simpleMessage("创建新图像"),
    "days": MessageLookupByLibrary.simpleMessage("天"),
    "delete": MessageLookupByLibrary.simpleMessage("删除"),
    "deletePhoto": MessageLookupByLibrary.simpleMessage("删除照片"),
    "delete_confirm_message": MessageLookupByLibrary.simpleMessage(
      "请最后仔细检查一次！\n此操作无法撤销。",
    ),
    "duplicates": MessageLookupByLibrary.simpleMessage("重复项"),
    "email": MessageLookupByLibrary.simpleMessage("邮箱"),
    "emailInvalid": MessageLookupByLibrary.simpleMessage("无效的邮箱格式"),
    "emailNotConfirmed": MessageLookupByLibrary.simpleMessage("邮箱未确认。"),
    "emailRequired": MessageLookupByLibrary.simpleMessage("必须输入邮箱"),
    "error": m1,
    "failedToLoadColors": MessageLookupByLibrary.simpleMessage("加载颜色失败"),
    "file": MessageLookupByLibrary.simpleMessage("文件"),
    "files": MessageLookupByLibrary.simpleMessage("文件"),
    "fill": MessageLookupByLibrary.simpleMessage("填充"),
    "filter": MessageLookupByLibrary.simpleMessage("滤镜"),
    "finish": MessageLookupByLibrary.simpleMessage("完成"),
    "flashMode": MessageLookupByLibrary.simpleMessage("闪光灯模式"),
    "gpsRemovedSuccess": MessageLookupByLibrary.simpleMessage(
      "GPS 位置数据已移除并另存为副本。",
    ),
    "help": MessageLookupByLibrary.simpleMessage("帮助"),
    "history": MessageLookupByLibrary.simpleMessage("历史记录"),
    "homeWidgetDialogSubtitle": MessageLookupByLibrary.simpleMessage(
      "您可以将 Twinfix 小部件添加到主屏幕以快速监控设备存储：",
    ),
    "homeWidgetDialogTitle": MessageLookupByLibrary.simpleMessage(
      "添加 Twinfix 小部件",
    ),
    "homeWidgetStep1": MessageLookupByLibrary.simpleMessage("1. 返回手机主屏幕。"),
    "homeWidgetStep2": MessageLookupByLibrary.simpleMessage("2. 长按屏幕上的任何空白处。"),
    "homeWidgetStep3": MessageLookupByLibrary.simpleMessage("3. 选择“小部件”。"),
    "homeWidgetStep4": MessageLookupByLibrary.simpleMessage(
      "4. 找到 Twinfix 并将小部件拖到屏幕上。",
    ),
    "imageSaved": MessageLookupByLibrary.simpleMessage("图像保存成功！"),
    "language": MessageLookupByLibrary.simpleMessage("语言"),
    "last30Days": MessageLookupByLibrary.simpleMessage("过去 30 天"),
    "last7Days": MessageLookupByLibrary.simpleMessage("过去 7 天"),
    "level": m2,
    "line": MessageLookupByLibrary.simpleMessage("直线"),
    "login": MessageLookupByLibrary.simpleMessage("登录"),
    "logout": MessageLookupByLibrary.simpleMessage("退出登录"),
    "luminance": MessageLookupByLibrary.simpleMessage("亮度"),
    "manageSubscriptions": MessageLookupByLibrary.simpleMessage("管理订阅"),
    "mon": MessageLookupByLibrary.simpleMessage("一"),
    "myColors": MessageLookupByLibrary.simpleMessage("我的颜色"),
    "nameLength": MessageLookupByLibrary.simpleMessage("姓名至少包含2个字符"),
    "nameRequired": MessageLookupByLibrary.simpleMessage("必须输入姓名"),
    "next": MessageLookupByLibrary.simpleMessage("下一步"),
    "noHistoryYet": MessageLookupByLibrary.simpleMessage("暂无记录"),
    "nothingSelectedToCopy": MessageLookupByLibrary.simpleMessage("未选择要复制的颜色"),
    "ok": MessageLookupByLibrary.simpleMessage("确定"),
    "older": MessageLookupByLibrary.simpleMessage("更早"),
    "opacity": MessageLookupByLibrary.simpleMessage("不透明度"),
    "or": MessageLookupByLibrary.simpleMessage("或"),
    "paint": MessageLookupByLibrary.simpleMessage("涂鸦"),
    "password": MessageLookupByLibrary.simpleMessage("密码"),
    "passwordLength": MessageLookupByLibrary.simpleMessage(
      "密码长度至少为 8 个字符，且必须包含大写、小写、数字和特殊字符",
    ),
    "passwordRequired": MessageLookupByLibrary.simpleMessage("必须输入密码"),
    "passwordsDoNotMatch": MessageLookupByLibrary.simpleMessage("密码不匹配"),
    "permissionDescription": MessageLookupByLibrary.simpleMessage(
      "Twinfix 需要访问您的相册以扫描和清理重复照片。",
    ),
    "permissionRequired": MessageLookupByLibrary.simpleMessage("需要权限"),
    "pickImageFromGallery": MessageLookupByLibrary.simpleMessage("从图库选择图片"),
    "premium": MessageLookupByLibrary.simpleMessage("高级版"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("隐私政策"),
    "progress": MessageLookupByLibrary.simpleMessage("进度"),
    "purchaseFailureMessage": MessageLookupByLibrary.simpleMessage(
      "购买失败或已被取消。",
    ),
    "ratio": MessageLookupByLibrary.simpleMessage("比例"),
    "rectangle": MessageLookupByLibrary.simpleMessage("矩形"),
    "register": MessageLookupByLibrary.simpleMessage("注册"),
    "replaceExistingRecord": MessageLookupByLibrary.simpleMessage("替换现有记录"),
    "replaceOriginal": MessageLookupByLibrary.simpleMessage("替换原图"),
    "reset": MessageLookupByLibrary.simpleMessage("重置"),
    "restoreFailureMessage": MessageLookupByLibrary.simpleMessage(
      "无法恢复购买或您没有订阅。",
    ),
    "restorePurchases": MessageLookupByLibrary.simpleMessage("恢复购买"),
    "save": MessageLookupByLibrary.simpleMessage("保存"),
    "saveAsNew": MessageLookupByLibrary.simpleMessage("保存为新记录"),
    "saveColor": MessageLookupByLibrary.simpleMessage("保存颜色"),
    "saveToLibrary": MessageLookupByLibrary.simpleMessage("保存到图库"),
    "scanLimit": MessageLookupByLibrary.simpleMessage("扫描限制"),
    "settings": MessageLookupByLibrary.simpleMessage("设置"),
    "size": MessageLookupByLibrary.simpleMessage("大小"),
    "success": MessageLookupByLibrary.simpleMessage("成功"),
    "switchCamera": MessageLookupByLibrary.simpleMessage("切换相机"),
    "termsOfService": MessageLookupByLibrary.simpleMessage("服务条款"),
    "text": MessageLookupByLibrary.simpleMessage("文本"),
    "textAlign": MessageLookupByLibrary.simpleMessage("对齐文本"),
    "theme": MessageLookupByLibrary.simpleMessage("主题"),
    "themeDark": MessageLookupByLibrary.simpleMessage("深色"),
    "themeLight": MessageLookupByLibrary.simpleMessage("浅色"),
    "themeSystem": MessageLookupByLibrary.simpleMessage("系统"),
    "thu": MessageLookupByLibrary.simpleMessage("四"),
    "timer": MessageLookupByLibrary.simpleMessage("定时器"),
    "today": MessageLookupByLibrary.simpleMessage("今天"),
    "tutorialCameraDesc": MessageLookupByLibrary.simpleMessage("在前后摄像头之间切换。"),
    "tutorialCameraTitle": MessageLookupByLibrary.simpleMessage("切换相机"),
    "tutorialCaptureDesc": MessageLookupByLibrary.simpleMessage("立即拍照。"),
    "tutorialCaptureTitle": MessageLookupByLibrary.simpleMessage("拍照"),
    "tutorialFlashDesc": MessageLookupByLibrary.simpleMessage("切换闪光灯模式。"),
    "tutorialFlashTitle": MessageLookupByLibrary.simpleMessage("闪光灯"),
    "tutorialGalleryDesc": MessageLookupByLibrary.simpleMessage("从图库中选择现有照片。"),
    "tutorialGalleryTitle": MessageLookupByLibrary.simpleMessage("图库"),
    "tutorialHistoryDesc": MessageLookupByLibrary.simpleMessage("查看以前拍摄的照片。"),
    "tutorialHistoryTitle": MessageLookupByLibrary.simpleMessage("历史记录"),
    "tutorialNext": MessageLookupByLibrary.simpleMessage("下一步"),
    "tutorialSettingsDesc": MessageLookupByLibrary.simpleMessage("自定义应用设置。"),
    "tutorialSettingsTitle": MessageLookupByLibrary.simpleMessage("设置"),
    "tutorialSkip": MessageLookupByLibrary.simpleMessage("跳过"),
    "tutorialTimerDesc": MessageLookupByLibrary.simpleMessage("设置拍摄前的倒计时。"),
    "tutorialTimerTitle": MessageLookupByLibrary.simpleMessage("定时器"),
    "understood": MessageLookupByLibrary.simpleMessage("知道了"),
    "useMagnifierToPickColors": MessageLookupByLibrary.simpleMessage(
      "使用放大镜选择颜色",
    ),
    "userBanned": MessageLookupByLibrary.simpleMessage("用户被封禁。"),
    "userNotFound": MessageLookupByLibrary.simpleMessage("未找到用户。"),
    "weakPassword": MessageLookupByLibrary.simpleMessage("密码太弱。"),
    "wed": MessageLookupByLibrary.simpleMessage("三"),
    "yesterday": MessageLookupByLibrary.simpleMessage("昨天"),
  };
}
