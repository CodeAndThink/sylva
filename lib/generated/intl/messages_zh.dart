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

  static String m1(author) => "由来自Flaticon的${author}设计";

  static String m2(author) => "由来自Magnific.com的${author}设计";

  static String m3(message) => "错误: ${message}";

  static String m4(level) => "等级 ${level}";

  static String m5(version) => "版本 ${version}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("关于"),
    "aboutSylvaDescription": MessageLookupByLibrary.simpleMessage(
      "Sylva是一款相机应用程序，旨在帮助您轻松捕捉和发现世界的色彩。",
    ),
    "acknowledgements": MessageLookupByLibrary.simpleMessage("鸣谢"),
    "acknowledgementsIntro": MessageLookupByLibrary.simpleMessage(
      "我们在此感谢以下创作者提供本应用中使用的资源：",
    ),
    "appName": MessageLookupByLibrary.simpleMessage("Sylva"),
    "arrow": MessageLookupByLibrary.simpleMessage("箭头"),
    "autoDetectColors": MessageLookupByLibrary.simpleMessage("自动检测颜色"),
    "awesome": MessageLookupByLibrary.simpleMessage("太棒了！"),
    "back": MessageLookupByLibrary.simpleMessage("返回"),
    "blur": MessageLookupByLibrary.simpleMessage("模糊"),
    "brightness": MessageLookupByLibrary.simpleMessage("亮度"),
    "cameraIcon": MessageLookupByLibrary.simpleMessage("相机图标"),
    "cameraPermissionDenied": MessageLookupByLibrary.simpleMessage(
      "拒绝访问相机或设备没有相机。",
    ),
    "cameraPermissionDescription": MessageLookupByLibrary.simpleMessage(
      "Sylva需要访问您的相机以拍摄照片并提取颜色。",
    ),
    "cameraPermissionRequired": MessageLookupByLibrary.simpleMessage("需要相机权限"),
    "cancel": MessageLookupByLibrary.simpleMessage("取消"),
    "circle": MessageLookupByLibrary.simpleMessage("圆形"),
    "clearAllHistory": MessageLookupByLibrary.simpleMessage("清除所有历史记录"),
    "clearAllHistoryConfirm": MessageLookupByLibrary.simpleMessage(
      "您确定要清除所有历史记录吗？此操作无法撤销。",
    ),
    "color": MessageLookupByLibrary.simpleMessage("颜色"),
    "colorCopiedFailure": MessageLookupByLibrary.simpleMessage("复制颜色失败"),
    "colorCopiedSuccess": m0,
    "colorPickMode": MessageLookupByLibrary.simpleMessage("取色模式"),
    "colorsIcon": MessageLookupByLibrary.simpleMessage("颜色图标"),
    "confirmPassword": MessageLookupByLibrary.simpleMessage("确认密码"),
    "confirmPasswordRequired": MessageLookupByLibrary.simpleMessage("必须确认密码"),
    "contact": MessageLookupByLibrary.simpleMessage("联系"),
    "contactErrorMessage": MessageLookupByLibrary.simpleMessage("请填写所有字段"),
    "contactFormAttachDeviceInfo": MessageLookupByLibrary.simpleMessage(
      "附加设备信息",
    ),
    "contactFormDescription": MessageLookupByLibrary.simpleMessage("描述"),
    "contactFormDescriptionError": MessageLookupByLibrary.simpleMessage(
      "请输入描述",
    ),
    "contactFormDescriptionHint": MessageLookupByLibrary.simpleMessage(
      "输入描述...",
    ),
    "contactFormDeviceInfoError": MessageLookupByLibrary.simpleMessage(
      "请输入设备信息",
    ),
    "contactFormDeviceInfoHint": MessageLookupByLibrary.simpleMessage(
      "设备信息（型号、OS）将附带，以便我们更好地为您提供支持。",
    ),
    "contactFormDeviceInfoNotice": MessageLookupByLibrary.simpleMessage(
      "将会附带基本设备信息（型号、操作系统），以帮助我们更好地为您提供支持。",
    ),
    "contactFormTitle": MessageLookupByLibrary.simpleMessage("标题"),
    "contactFormTitleError": MessageLookupByLibrary.simpleMessage("请输入标题"),
    "contactFormTitleHint": MessageLookupByLibrary.simpleMessage("输入标题"),
    "contactFormTypeBug": MessageLookupByLibrary.simpleMessage("错误"),
    "contactFormTypeOther": MessageLookupByLibrary.simpleMessage("其他"),
    "contactFormTypeSuggestion": MessageLookupByLibrary.simpleMessage("建议"),
    "contactSuccessMessage": MessageLookupByLibrary.simpleMessage("感谢您的反馈！"),
    "contactType": MessageLookupByLibrary.simpleMessage("反馈类型"),
    "createNewImage": MessageLookupByLibrary.simpleMessage("创建新图像"),
    "createTime": MessageLookupByLibrary.simpleMessage("时间"),
    "days": MessageLookupByLibrary.simpleMessage("天"),
    "delete": MessageLookupByLibrary.simpleMessage("删除"),
    "deletePhoto": MessageLookupByLibrary.simpleMessage("删除照片"),
    "delete_confirm_message": MessageLookupByLibrary.simpleMessage(
      "请最后仔细检查一次！\n此操作无法撤销。",
    ),
    "designedByAuthorFromFlaticon": m1,
    "designedByAuthorMagnific": m2,
    "deviceInfo": MessageLookupByLibrary.simpleMessage("设备信息"),
    "donation": MessageLookupByLibrary.simpleMessage("捐款"),
    "duplicates": MessageLookupByLibrary.simpleMessage("重复项"),
    "email": MessageLookupByLibrary.simpleMessage("邮箱"),
    "emailInvalid": MessageLookupByLibrary.simpleMessage("无效的邮箱格式"),
    "emailNotConfirmed": MessageLookupByLibrary.simpleMessage("邮箱未确认。"),
    "emailRequired": MessageLookupByLibrary.simpleMessage("必须输入邮箱"),
    "error": m3,
    "errorPrefix": MessageLookupByLibrary.simpleMessage("错误"),
    "failedToLoadColors": MessageLookupByLibrary.simpleMessage("加载颜色失败"),
    "file": MessageLookupByLibrary.simpleMessage("文件"),
    "files": MessageLookupByLibrary.simpleMessage("文件"),
    "fill": MessageLookupByLibrary.simpleMessage("填充"),
    "filter": MessageLookupByLibrary.simpleMessage("滤镜"),
    "finish": MessageLookupByLibrary.simpleMessage("完成"),
    "flashMode": MessageLookupByLibrary.simpleMessage("闪光灯模式"),
    "fullScreen": MessageLookupByLibrary.simpleMessage("全屏"),
    "gpsRemovedSuccess": MessageLookupByLibrary.simpleMessage(
      "GPS 位置数据已移除并另存为副本。",
    ),
    "help": MessageLookupByLibrary.simpleMessage("帮助"),
    "history": MessageLookupByLibrary.simpleMessage("历史记录"),
    "historySort": MessageLookupByLibrary.simpleMessage("排序"),
    "historyView": MessageLookupByLibrary.simpleMessage("更改视图"),
    "imageSaved": MessageLookupByLibrary.simpleMessage("图像保存成功！"),
    "informationAndSupport": MessageLookupByLibrary.simpleMessage("信息与支持"),
    "language": MessageLookupByLibrary.simpleMessage("语言"),
    "last30Days": MessageLookupByLibrary.simpleMessage("过去 30 天"),
    "last7Days": MessageLookupByLibrary.simpleMessage("过去 7 天"),
    "letGo": MessageLookupByLibrary.simpleMessage("开始吧"),
    "level": m4,
    "line": MessageLookupByLibrary.simpleMessage("直线"),
    "login": MessageLookupByLibrary.simpleMessage("登录"),
    "logout": MessageLookupByLibrary.simpleMessage("退出登录"),
    "luminance": MessageLookupByLibrary.simpleMessage("亮度"),
    "mon": MessageLookupByLibrary.simpleMessage("一"),
    "myColors": MessageLookupByLibrary.simpleMessage("我的颜色"),
    "nameLength": MessageLookupByLibrary.simpleMessage("姓名至少包含2个字符"),
    "nameRequired": MessageLookupByLibrary.simpleMessage("必须输入姓名"),
    "next": MessageLookupByLibrary.simpleMessage("下一步"),
    "noCamerasFound": MessageLookupByLibrary.simpleMessage("设备上未找到相机"),
    "noHistoryYet": MessageLookupByLibrary.simpleMessage("暂无记录"),
    "nothingSelectedToCopy": MessageLookupByLibrary.simpleMessage("未选择要复制的颜色"),
    "ok": MessageLookupByLibrary.simpleMessage("确定"),
    "older": MessageLookupByLibrary.simpleMessage("更早"),
    "onboardDesc": MessageLookupByLibrary.simpleMessage(
      "从您拍摄的任何照片中提取、保存和管理鲜艳的色彩。",
    ),
    "onboardTitle": MessageLookupByLibrary.simpleMessage("捕捉色彩"),
    "onlyFavorites": MessageLookupByLibrary.simpleMessage("仅限收藏"),
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
      "Sylva 需要访问您的相册以选择照片并提取颜色。",
    ),
    "permissionRequired": MessageLookupByLibrary.simpleMessage("需要相册权限"),
    "pickImageFromGallery": MessageLookupByLibrary.simpleMessage("从图库选择图片"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("隐私政策"),
    "privacyPolicyContent": MessageLookupByLibrary.simpleMessage(
      "我们尊重您的隐私。Sylva会尽可能在本地处理您的相机数据。未经您的明确同意，我们不会存储或分享您的个人照片。",
    ),
    "privacyPolicyContent1": MessageLookupByLibrary.simpleMessage(
      "我们不会在服务器上收集或存储任何个人照片或相机数据。所有相机处理都在您的设备上本地执行。",
    ),
    "privacyPolicyContent2": MessageLookupByLibrary.simpleMessage(
      "Sylva处理的任何数据仅用于提供应用程序内的相机和颜色分析功能。",
    ),
    "privacyPolicyContent3": MessageLookupByLibrary.simpleMessage(
      "我们实施行业标准的安全措施来保护您的数据。由于您的照片保留在设备上，您可以完全控制自己的隐私。",
    ),
    "privacyPolicyContent4": MessageLookupByLibrary.simpleMessage(
      "我们使用 Firebase Crashlytics 收集匿名崩溃报告。这有助于我们识别错误并提高应用程序的稳定性。收集的数据不包含个人身份信息。",
    ),
    "privacyPolicyTitle1": MessageLookupByLibrary.simpleMessage("信息收集"),
    "privacyPolicyTitle2": MessageLookupByLibrary.simpleMessage("信息使用"),
    "privacyPolicyTitle3": MessageLookupByLibrary.simpleMessage("数据安全"),
    "privacyPolicyTitle4": MessageLookupByLibrary.simpleMessage("崩溃报告"),
    "progress": MessageLookupByLibrary.simpleMessage("进度"),
    "purchaseFailureMessage": MessageLookupByLibrary.simpleMessage(
      "购买失败或已被取消。",
    ),
    "rainbowHalftoneDotsBackground": MessageLookupByLibrary.simpleMessage(
      "彩虹半色调圆点背景",
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
    "retry": MessageLookupByLibrary.simpleMessage("重试"),
    "roadBlockIcon": MessageLookupByLibrary.simpleMessage("路障图标"),
    "save": MessageLookupByLibrary.simpleMessage("保存"),
    "saveAsNew": MessageLookupByLibrary.simpleMessage("保存为新记录"),
    "saveColor": MessageLookupByLibrary.simpleMessage("保存颜色"),
    "saveToLibrary": MessageLookupByLibrary.simpleMessage("保存到图库"),
    "scanLimit": MessageLookupByLibrary.simpleMessage("扫描限制"),
    "settings": MessageLookupByLibrary.simpleMessage("设置"),
    "size": MessageLookupByLibrary.simpleMessage("大小"),
    "submit": MessageLookupByLibrary.simpleMessage("提交"),
    "success": MessageLookupByLibrary.simpleMessage("成功"),
    "switchCamera": MessageLookupByLibrary.simpleMessage("切换相机"),
    "termsOfService": MessageLookupByLibrary.simpleMessage("服务条款"),
    "termsOfServiceContent": MessageLookupByLibrary.simpleMessage(
      "使用Sylva即表示您同意我们的服务条款。您不得将该应用程序用于任何非法或未经授权的目的。服务和内容按\"原样\"提供，没有任何形式的保证。",
    ),
    "text": MessageLookupByLibrary.simpleMessage("文本"),
    "textAlign": MessageLookupByLibrary.simpleMessage("对齐文本"),
    "thanksAndReference": MessageLookupByLibrary.simpleMessage("感谢与参考文献"),
    "theme": MessageLookupByLibrary.simpleMessage("主题"),
    "themeDark": MessageLookupByLibrary.simpleMessage("深色"),
    "themeLight": MessageLookupByLibrary.simpleMessage("浅色"),
    "themeSystem": MessageLookupByLibrary.simpleMessage("系统"),
    "thu": MessageLookupByLibrary.simpleMessage("四"),
    "timer": MessageLookupByLibrary.simpleMessage("定时器"),
    "today": MessageLookupByLibrary.simpleMessage("今天"),
    "tosContent1": MessageLookupByLibrary.simpleMessage(
      "下载并使用Sylva即表示您同意这些服务条款。如果您不同意，请勿使用该应用程序。",
    ),
    "tosContent2": MessageLookupByLibrary.simpleMessage(
      "您对使用Sylva捕捉或处理的任何内容负责。您同意不将该应用程序用于任何非法或被禁止的活动。",
    ),
    "tosContent3": MessageLookupByLibrary.simpleMessage(
      "Sylva及其创作者对您使用该应用程序造成的任何损害或损失不承担任何责任。服务按“原样”提供。",
    ),
    "tosContent4": MessageLookupByLibrary.simpleMessage(
      "Sylva 利用 Firebase Crashlytics 等第三方服务来监控应用程序的稳定性并收集崩溃报告。使用本应用程序即表示您同意这些服务收集匿名崩溃和性能数据。",
    ),
    "tosTitle1": MessageLookupByLibrary.simpleMessage("接受条款"),
    "tosTitle2": MessageLookupByLibrary.simpleMessage("用户责任"),
    "tosTitle3": MessageLookupByLibrary.simpleMessage("责任限制"),
    "tosTitle4": MessageLookupByLibrary.simpleMessage("第三方服务"),
    "tutorialBackDesc": MessageLookupByLibrary.simpleMessage("放弃更改并返回相机。"),
    "tutorialBackTitle": MessageLookupByLibrary.simpleMessage("返回"),
    "tutorialCameraDesc": MessageLookupByLibrary.simpleMessage("在前后摄像头之间切换。"),
    "tutorialCameraTitle": MessageLookupByLibrary.simpleMessage("切换相机"),
    "tutorialCaptureDesc": MessageLookupByLibrary.simpleMessage("立即拍照。"),
    "tutorialCaptureTitle": MessageLookupByLibrary.simpleMessage("拍照"),
    "tutorialDeleteAllDesc": MessageLookupByLibrary.simpleMessage(
      "删除所有以前拍摄的照片。",
    ),
    "tutorialDeleteAllTitle": MessageLookupByLibrary.simpleMessage("清除历史记录"),
    "tutorialExpandPaletteDesc": MessageLookupByLibrary.simpleMessage(
      "查看所有提取和挑选的颜色。",
    ),
    "tutorialExpandPaletteTitle": MessageLookupByLibrary.simpleMessage("展开调色板"),
    "tutorialFavoritesDesc": MessageLookupByLibrary.simpleMessage(
      "筛选您的历史记录，仅显示收藏的照片。",
    ),
    "tutorialFavoritesTitle": MessageLookupByLibrary.simpleMessage("仅限收藏"),
    "tutorialFlashDesc": MessageLookupByLibrary.simpleMessage("切换闪光灯模式。"),
    "tutorialFlashTitle": MessageLookupByLibrary.simpleMessage("闪光灯"),
    "tutorialFullScreenDesc": MessageLookupByLibrary.simpleMessage(
      "点击此处全屏查看原照片。",
    ),
    "tutorialFullScreenTitle": MessageLookupByLibrary.simpleMessage("全屏"),
    "tutorialGalleryDesc": MessageLookupByLibrary.simpleMessage("从图库中选择现有照片。"),
    "tutorialGalleryTitle": MessageLookupByLibrary.simpleMessage("图库"),
    "tutorialHistoryDesc": MessageLookupByLibrary.simpleMessage("查看以前拍摄的照片。"),
    "tutorialHistoryTitle": MessageLookupByLibrary.simpleMessage("历史记录"),
    "tutorialHistoryViewDesc": MessageLookupByLibrary.simpleMessage(
      "在列表和网格视图之间切换。",
    ),
    "tutorialHistoryViewTitle": MessageLookupByLibrary.simpleMessage("更改视图"),
    "tutorialImageDesc": MessageLookupByLibrary.simpleMessage(
      "在照片上移动手指放大并选择任何颜色。",
    ),
    "tutorialImageTitle": MessageLookupByLibrary.simpleMessage("照片预览"),
    "tutorialLibraryDesc": MessageLookupByLibrary.simpleMessage(
      "将此照片导出到您设备的相册。",
    ),
    "tutorialLibraryTitle": MessageLookupByLibrary.simpleMessage("保存到图库"),
    "tutorialNext": MessageLookupByLibrary.simpleMessage("下一步"),
    "tutorialPaletteDesc": MessageLookupByLibrary.simpleMessage(
      "点击颜色进行过滤，长按复制其十六进制代码。",
    ),
    "tutorialPaletteTitle": MessageLookupByLibrary.simpleMessage("调色板"),
    "tutorialSaveDesc": MessageLookupByLibrary.simpleMessage(
      "将这张照片和颜色保存到应用的历史记录中。",
    ),
    "tutorialSaveTitle": MessageLookupByLibrary.simpleMessage("保存到应用"),
    "tutorialSettingsDesc": MessageLookupByLibrary.simpleMessage("自定义应用设置。"),
    "tutorialSettingsTitle": MessageLookupByLibrary.simpleMessage("设置"),
    "tutorialSkip": MessageLookupByLibrary.simpleMessage("跳过"),
    "tutorialSortDesc": MessageLookupByLibrary.simpleMessage("按时间升序或降序排序历史记录。"),
    "tutorialSortTitle": MessageLookupByLibrary.simpleMessage("排序"),
    "tutorialTimerDesc": MessageLookupByLibrary.simpleMessage("设置拍摄前的倒计时。"),
    "tutorialTimerTitle": MessageLookupByLibrary.simpleMessage("定时器"),
    "tutorialToggleModeDesc": MessageLookupByLibrary.simpleMessage(
      "在取色模式和缩放模式之间切换。取色模式下点击图片可取色。缩放模式下可双指缩放和拖动图片。",
    ),
    "tutorialToggleModeTitle": MessageLookupByLibrary.simpleMessage("切换模式"),
    "tutorialZoomDesc": MessageLookupByLibrary.simpleMessage(
      "使用这些按钮精确放大或缩小图像。",
    ),
    "tutorialZoomTitle": MessageLookupByLibrary.simpleMessage("缩放"),
    "useMagnifierToPickColors": MessageLookupByLibrary.simpleMessage(
      "使用放大镜选择颜色",
    ),
    "userBanned": MessageLookupByLibrary.simpleMessage("用户被封禁。"),
    "userNotFound": MessageLookupByLibrary.simpleMessage("未找到用户。"),
    "version": m5,
    "weakPassword": MessageLookupByLibrary.simpleMessage("密码太弱。"),
    "wed": MessageLookupByLibrary.simpleMessage("三"),
    "yesterday": MessageLookupByLibrary.simpleMessage("昨天"),
    "zoomMode": MessageLookupByLibrary.simpleMessage("缩放模式"),
  };
}
