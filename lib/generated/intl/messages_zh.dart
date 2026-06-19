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

  static String m0(version) => "版本 ${version}";

  static String m1(num, unit, size) => "成功清理 ${num} ${unit} (${size})";

  static String m2(badgeName) => "您刚刚获得了\"${badgeName}\"徽章！";

  static String m3(count) => "您刚刚获得了 ${count} 个新徽章！";

  static String m4(email) => "无法打开邮件应用。支持邮箱: ${email}";

  static String m5(count) => "删除 (${count})";

  static String m6(count) => "已删除 ${count} 个项目";

  static String m7(count) => "检测到 ${count} 组重复项";

  static String m8(message) => "错误: ${message}";

  static String m9(index, count) => "第 ${index} 组 (${count} 张照片)";

  static String m10(level) => "等级 ${level}";

  static String m11(count) => "发现 ${count} 张模糊照片。点击查看。";

  static String m12(count) => "发现 ${count} 个文档。点击查看。";

  static String m13(count) => "发现 ${count} 张重复照片。点击查看。";

  static String m14(count) => "发现 ${count} 张含GPS数据的照片。点击查看。";

  static String m15(current, total) => "已扫描 ${current}/${total} 张照片";

  static String m16(percent) => "存储空间即将用完 (${percent}%)，立即清理！";

  static String m17(percent) => "已使用 ${percent}%";

  static String m18(days) => "连续 ${days} 天";

  static String m19(count) => "${count} 张照片";

  static String m20(count, mediaType) => "总计: ${count} ${mediaType} (最近7天)";

  static String m21(count, mediaType) => "总计: ${count} ${mediaType} (最近7周)";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "aboutDescription": MessageLookupByLibrary.simpleMessage(
      "Twinfix 是一款强大的工具，旨在使用 AI 帮助您轻松整理和清理您的相册。",
    ),
    "aboutUs": MessageLookupByLibrary.simpleMessage("关于我们"),
    "accountSyncActive": MessageLookupByLibrary.simpleMessage("帐户同步已激活"),
    "activity": MessageLookupByLibrary.simpleMessage("活动"),
    "activityDetailTitle": MessageLookupByLibrary.simpleMessage("清理活动"),
    "addWaterMark": MessageLookupByLibrary.simpleMessage("添加水印"),
    "addWaterMarkDescription": MessageLookupByLibrary.simpleMessage("为照片添加水印。"),
    "allBadges": MessageLookupByLibrary.simpleMessage("所有徽章"),
    "alreadyHaveAccountLogin": MessageLookupByLibrary.simpleMessage("已有帐户？登录"),
    "appDescription": MessageLookupByLibrary.simpleMessage("照片重复清理工具"),
    "appName": MessageLookupByLibrary.simpleMessage("Sylva"),
    "appVersion": m0,
    "appearance": MessageLookupByLibrary.simpleMessage("外观"),
    "arrow": MessageLookupByLibrary.simpleMessage("箭头"),
    "autoDetectColors": MessageLookupByLibrary.simpleMessage("自动检测颜色"),
    "awesome": MessageLookupByLibrary.simpleMessage("太棒了！"),
    "back": MessageLookupByLibrary.simpleMessage("返回"),
    "backgroundMode": MessageLookupByLibrary.simpleMessage("背景模式"),
    "backgroundStyle": MessageLookupByLibrary.simpleMessage("背景样式"),
    "badgeAiCleanerDesc": MessageLookupByLibrary.simpleMessage("使用自动清理功能。"),
    "badgeAiCleanerName": MessageLookupByLibrary.simpleMessage("AI 助手"),
    "badgeBlurry10Desc": MessageLookupByLibrary.simpleMessage("删除 10 张模糊照片。"),
    "badgeBlurry10Name": MessageLookupByLibrary.simpleMessage("模糊猎人"),
    "badgeBlurry200Desc": MessageLookupByLibrary.simpleMessage("删除 200 张模糊照片。"),
    "badgeBlurry200Name": MessageLookupByLibrary.simpleMessage("模糊破坏者"),
    "badgeBlurryKillerDesc": MessageLookupByLibrary.simpleMessage(
      "删除 50 张模糊照片。",
    ),
    "badgeBlurryKillerName": MessageLookupByLibrary.simpleMessage("模糊杀手"),
    "badgeCleaner1000Desc": MessageLookupByLibrary.simpleMessage(
      "总共删除 1000 张照片。",
    ),
    "badgeCleaner1000Name": MessageLookupByLibrary.simpleMessage("照片粉碎机"),
    "badgeCleaner100Desc": MessageLookupByLibrary.simpleMessage(
      "总共删除 100 张照片。",
    ),
    "badgeCleaner100Name": MessageLookupByLibrary.simpleMessage("专家清理者"),
    "badgeCleaner10Desc": MessageLookupByLibrary.simpleMessage("总共删除 10 张照片。"),
    "badgeCleaner10Name": MessageLookupByLibrary.simpleMessage("见习清理者"),
    "badgeDuplicate100Desc": MessageLookupByLibrary.simpleMessage(
      "删除 100 张重复照片。",
    ),
    "badgeDuplicate100Name": MessageLookupByLibrary.simpleMessage("重复大师"),
    "badgeDuplicate20Desc": MessageLookupByLibrary.simpleMessage(
      "删除 20 张重复照片。",
    ),
    "badgeDuplicate20Name": MessageLookupByLibrary.simpleMessage("重复猎手"),
    "badgeFirstCleanDesc": MessageLookupByLibrary.simpleMessage("删除您最初的照片。"),
    "badgeFirstCleanName": MessageLookupByLibrary.simpleMessage("第一次清理"),
    "badgeFreed100mbDesc": MessageLookupByLibrary.simpleMessage(
      "总共删除 200 张照片。",
    ),
    "badgeFreed100mbName": MessageLookupByLibrary.simpleMessage("存储新手"),
    "badgeFreed10gbDesc": MessageLookupByLibrary.simpleMessage(
      "总共删除 5000 张照片。",
    ),
    "badgeFreed10gbName": MessageLookupByLibrary.simpleMessage("磁盘传奇"),
    "badgeFreed5gbDesc": MessageLookupByLibrary.simpleMessage("总共删除 2000 张照片。"),
    "badgeFreed5gbName": MessageLookupByLibrary.simpleMessage("存储英雄"),
    "badgeGigaKingDesc": MessageLookupByLibrary.simpleMessage("总共删除 500 张照片。"),
    "badgeGigaKingName": MessageLookupByLibrary.simpleMessage("清理大师"),
    "badgeNewbieDesc": MessageLookupByLibrary.simpleMessage(
      "删除您的第一张照片，开启释放存储空间之旅。",
    ),
    "badgeNewbieName": MessageLookupByLibrary.simpleMessage("新手清理者"),
    "badgePerfectionistDesc": MessageLookupByLibrary.simpleMessage(
      "删除设备上 80% 以上的模糊照片。",
    ),
    "badgePerfectionistName": MessageLookupByLibrary.simpleMessage("完美主义者"),
    "badgeSpeedCleanDesc": MessageLookupByLibrary.simpleMessage(
      "在一次会话中删除 50 张照片。",
    ),
    "badgeSpeedCleanName": MessageLookupByLibrary.simpleMessage("极速清理者"),
    "badgeStreak3Desc": MessageLookupByLibrary.simpleMessage("连续 3 天进行清理。"),
    "badgeStreak3Name": MessageLookupByLibrary.simpleMessage("尽心尽力"),
    "badgeStreak7Desc": MessageLookupByLibrary.simpleMessage("连续 7 天进行清理。"),
    "badgeStreak7Name": MessageLookupByLibrary.simpleMessage("永不放弃"),
    "badges": MessageLookupByLibrary.simpleMessage("徽章"),
    "becomeOneOfUs": MessageLookupByLibrary.simpleMessage("加入我们"),
    "bgCustom": MessageLookupByLibrary.simpleMessage("自定义"),
    "bgNature1": MessageLookupByLibrary.simpleMessage("自然 1"),
    "bgNature2": MessageLookupByLibrary.simpleMessage("自然 2"),
    "bgNature3": MessageLookupByLibrary.simpleMessage("自然 3"),
    "bgNature4": MessageLookupByLibrary.simpleMessage("自然 4"),
    "bgNone": MessageLookupByLibrary.simpleMessage("无"),
    "blur": MessageLookupByLibrary.simpleMessage("模糊"),
    "blurFace": MessageLookupByLibrary.simpleMessage("模糊面部"),
    "blurFaceDescription": MessageLookupByLibrary.simpleMessage("模糊照片中的面部。"),
    "blurryDeleted": MessageLookupByLibrary.simpleMessage("已删除模糊照片"),
    "blurryPhotos": MessageLookupByLibrary.simpleMessage("模糊照片"),
    "blurryPhotosDescription": MessageLookupByLibrary.simpleMessage(
      "检测并清理模糊的照片。",
    ),
    "brightness": MessageLookupByLibrary.simpleMessage("亮度"),
    "calculatingProgress": MessageLookupByLibrary.simpleMessage("计算中..."),
    "cancel": MessageLookupByLibrary.simpleMessage("取消"),
    "cancelMonthlyMessage": MessageLookupByLibrary.simpleMessage(
      "您已成功升级至终身版！因为您之前有一个包月订阅，请记得在 App Store/Google Play 中取消它，以避免被重复扣费。",
    ),
    "cancelMonthlyTitle": MessageLookupByLibrary.simpleMessage("需要采取操作"),
    "changeOpacity": MessageLookupByLibrary.simpleMessage("更改透明度"),
    "changePassword": MessageLookupByLibrary.simpleMessage("更改密码"),
    "changePasswordSuccess": MessageLookupByLibrary.simpleMessage("密码更改成功"),
    "chinese": MessageLookupByLibrary.simpleMessage("中文"),
    "circle": MessageLookupByLibrary.simpleMessage("圆形"),
    "cleaned": MessageLookupByLibrary.simpleMessage("已清理"),
    "cleanedSpaceSuccess": m1,
    "clearSelection": MessageLookupByLibrary.simpleMessage("清除选择"),
    "color": MessageLookupByLibrary.simpleMessage("颜色"),
    "confirmDelete": MessageLookupByLibrary.simpleMessage("确认删除"),
    "confirmPassword": MessageLookupByLibrary.simpleMessage("确认密码"),
    "confirmPasswordRequired": MessageLookupByLibrary.simpleMessage("必须确认密码"),
    "confirmnoMorePhotosToDelete": MessageLookupByLibrary.simpleMessage(
      "没有更多照片可删除",
    ),
    "congratsBadgeMessage": m2,
    "congratsBadgeTitle": MessageLookupByLibrary.simpleMessage("新徽章！"),
    "congratsMultipleBadgesMessage": m3,
    "contactUs": MessageLookupByLibrary.simpleMessage("联系我们"),
    "continueWithFreeVersion": MessageLookupByLibrary.simpleMessage("继续使用免费版"),
    "contrast": MessageLookupByLibrary.simpleMessage("对比度"),
    "contributionGraph": MessageLookupByLibrary.simpleMessage("贡献图"),
    "convertImageFailed": MessageLookupByLibrary.simpleMessage("转换图像失败"),
    "couldNotOpenEmailApp": m4,
    "countAsc": MessageLookupByLibrary.simpleMessage("数量递增"),
    "countDesc": MessageLookupByLibrary.simpleMessage("数量递减"),
    "createNewImage": MessageLookupByLibrary.simpleMessage("创建新图像"),
    "crop": MessageLookupByLibrary.simpleMessage("裁剪"),
    "currentPlan": MessageLookupByLibrary.simpleMessage("当前套餐"),
    "custom1": MessageLookupByLibrary.simpleMessage("自定义 1"),
    "custom2": MessageLookupByLibrary.simpleMessage("自定义 2"),
    "custom3": MessageLookupByLibrary.simpleMessage("自定义 3"),
    "customThemeDescription": MessageLookupByLibrary.simpleMessage(
      "点击选择，长按选择另一张图片",
    ),
    "dashDotLine": MessageLookupByLibrary.simpleMessage("点划线"),
    "dashLine": MessageLookupByLibrary.simpleMessage("虚线"),
    "dataSynchronizedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "数据同步成功",
    ),
    "dateAsc": MessageLookupByLibrary.simpleMessage("按日期升序"),
    "dateDesc": MessageLookupByLibrary.simpleMessage("按日期降序"),
    "days": MessageLookupByLibrary.simpleMessage("天"),
    "defaultErrorMessage": MessageLookupByLibrary.simpleMessage("发生错误。请重试。"),
    "delete": MessageLookupByLibrary.simpleMessage("删除"),
    "deleteAccount": MessageLookupByLibrary.simpleMessage("删除帐户"),
    "deleteAccountConfirm": MessageLookupByLibrary.simpleMessage(
      "您确定要删除您的帐户吗？所有数据将被永久删除。",
    ),
    "deleteAccountWarningMessage": MessageLookupByLibrary.simpleMessage(
      "此操作无法撤销。您的所有数据和个人信息将从我们的系统中永久删除。\n\n重要提示：删除帐户不会自动取消有效的订阅。请在继续操作前在应用商店中管理并取消您的订阅，以避免意外扣费。",
    ),
    "deleteAccountWarningTitle": MessageLookupByLibrary.simpleMessage("删除帐户"),
    "deleteSelected": m5,
    "delete_confirm_message": MessageLookupByLibrary.simpleMessage(
      "请最后仔细检查一次！\n此操作无法撤销。",
    ),
    "delete_confirm_message_permanent": MessageLookupByLibrary.simpleMessage(
      "请最后再检查一次！\n此操作无法撤销。照片将从设备中永久删除。",
    ),
    "delete_confirm_message_trash": MessageLookupByLibrary.simpleMessage(
      "请最后再检查一次！\n照片将被移至设备的垃圾桶，可在30天内恢复。",
    ),
    "deletedItemsCount": m6,
    "density": MessageLookupByLibrary.simpleMessage("密度"),
    "deselectAll": MessageLookupByLibrary.simpleMessage("取消全选"),
    "detectedDuplicateGroups": m7,
    "deviceIsClean": MessageLookupByLibrary.simpleMessage("您的设备非常干净。"),
    "document": MessageLookupByLibrary.simpleMessage("文档检测"),
    "documentDescription": MessageLookupByLibrary.simpleMessage(
      "识别并管理包含文本的图像。",
    ),
    "done": MessageLookupByLibrary.simpleMessage("知道了"),
    "duplicates": MessageLookupByLibrary.simpleMessage("重复项"),
    "earned": MessageLookupByLibrary.simpleMessage("已解锁"),
    "edit": MessageLookupByLibrary.simpleMessage("编辑"),
    "editAnotherPhoto": MessageLookupByLibrary.simpleMessage("编辑另一张照片"),
    "editDescription": MessageLookupByLibrary.simpleMessage("编辑图像"),
    "email": MessageLookupByLibrary.simpleMessage("邮箱"),
    "emailAlreadyInUse": MessageLookupByLibrary.simpleMessage("邮箱已被使用。"),
    "emailInvalid": MessageLookupByLibrary.simpleMessage("无效的邮箱格式"),
    "emailNotConfirmed": MessageLookupByLibrary.simpleMessage("邮箱未确认。"),
    "emailRequired": MessageLookupByLibrary.simpleMessage("必须输入邮箱"),
    "emoji": MessageLookupByLibrary.simpleMessage("表情符号"),
    "enableNotification": MessageLookupByLibrary.simpleMessage("启用通知"),
    "enableNotificationDescription": MessageLookupByLibrary.simpleMessage(
      "接收扫描进度和完成提醒。",
    ),
    "english": MessageLookupByLibrary.simpleMessage("英语"),
    "enterWatermarkText": MessageLookupByLibrary.simpleMessage("输入水印文本"),
    "eraser": MessageLookupByLibrary.simpleMessage("橡皮擦"),
    "error": m8,
    "errorEmailNotFound": MessageLookupByLibrary.simpleMessage("错误邮箱未找到"),
    "errorTitle": MessageLookupByLibrary.simpleMessage("错误"),
    "error_unable_to_play_media": MessageLookupByLibrary.simpleMessage(
      "无法播放媒体",
    ),
    "error_unsupported_media_type": MessageLookupByLibrary.simpleMessage(
      "不支持的媒体类型",
    ),
    "exposure": MessageLookupByLibrary.simpleMessage("曝光"),
    "eyeBar": MessageLookupByLibrary.simpleMessage("眼罩"),
    "fade": MessageLookupByLibrary.simpleMessage("淡化"),
    "failedToChangePassword": MessageLookupByLibrary.simpleMessage(
      "无法更改密码。请重试。",
    ),
    "failedToLoadColors": MessageLookupByLibrary.simpleMessage("加载颜色失败"),
    "failedToLoadHistory": MessageLookupByLibrary.simpleMessage("无法加载删除历史记录。"),
    "failedToLoadProfile": MessageLookupByLibrary.simpleMessage(
      "无法加载用户配置文件。请检查您的网络连接。",
    ),
    "failedToLoadStorageInfo": MessageLookupByLibrary.simpleMessage(
      "无法加载存储信息。",
    ),
    "failedToRegister": MessageLookupByLibrary.simpleMessage("注册失败。请重试。"),
    "failedToSaveImage": MessageLookupByLibrary.simpleMessage("无法保存图像。请重试。"),
    "failedToSendResetLink": MessageLookupByLibrary.simpleMessage("发送重置链接失败"),
    "featureClean": MessageLookupByLibrary.simpleMessage("高效清理"),
    "featureModernUI": MessageLookupByLibrary.simpleMessage("现代化的用户界面"),
    "featureScan": MessageLookupByLibrary.simpleMessage("快速扫描"),
    "featuresTitle": MessageLookupByLibrary.simpleMessage("主要功能"),
    "feedbackContentHint": MessageLookupByLibrary.simpleMessage(
      "在此处输入错误详情或改进建议...",
    ),
    "feedbackContentLabel": MessageLookupByLibrary.simpleMessage("详细内容"),
    "feedbackContentRequired": MessageLookupByLibrary.simpleMessage("请输入详细内容"),
    "feedbackTitleHint": MessageLookupByLibrary.simpleMessage("输入反馈标题..."),
    "feedbackTitleLabel": MessageLookupByLibrary.simpleMessage("标题"),
    "feedbackTitleRequired": MessageLookupByLibrary.simpleMessage("请输入标题"),
    "feedbackTypeBug": MessageLookupByLibrary.simpleMessage("漏洞"),
    "feedbackTypeImprovement": MessageLookupByLibrary.simpleMessage("改进"),
    "feedbackTypeLabel": MessageLookupByLibrary.simpleMessage("反馈类型"),
    "feedbackTypeOther": MessageLookupByLibrary.simpleMessage("其他"),
    "feedbackTypeQuestion": MessageLookupByLibrary.simpleMessage("问题"),
    "file": MessageLookupByLibrary.simpleMessage("文件"),
    "files": MessageLookupByLibrary.simpleMessage("文件"),
    "fill": MessageLookupByLibrary.simpleMessage("填充"),
    "filter": MessageLookupByLibrary.simpleMessage("滤镜"),
    "finish": MessageLookupByLibrary.simpleMessage("完成"),
    "flip": MessageLookupByLibrary.simpleMessage("翻转"),
    "fontScale": MessageLookupByLibrary.simpleMessage("字体大小"),
    "footerTitle": MessageLookupByLibrary.simpleMessage("联系我们"),
    "forgotPasswordDescription": MessageLookupByLibrary.simpleMessage(
      "输入您的邮箱地址，我们将向您发送重置密码的链接。",
    ),
    "forgotPasswordQuestion": MessageLookupByLibrary.simpleMessage("忘记密码？"),
    "forgotPasswordTitle": MessageLookupByLibrary.simpleMessage("忘记密码"),
    "freePlan": MessageLookupByLibrary.simpleMessage("免费套餐"),
    "freestyle": MessageLookupByLibrary.simpleMessage("自由绘制"),
    "freestyleArrowEnd": MessageLookupByLibrary.simpleMessage("自由箭头终点"),
    "freestyleArrowStart": MessageLookupByLibrary.simpleMessage("自由箭头起点"),
    "freestyleArrowStartEnd": MessageLookupByLibrary.simpleMessage("自由双头箭头"),
    "fri": MessageLookupByLibrary.simpleMessage("五"),
    "fullName": MessageLookupByLibrary.simpleMessage("全名"),
    "galleryManager": MessageLookupByLibrary.simpleMessage("图库管理器"),
    "general": MessageLookupByLibrary.simpleMessage("常规"),
    "glasses": MessageLookupByLibrary.simpleMessage("眼镜"),
    "googleLoginFailed": MessageLookupByLibrary.simpleMessage(
      "Google 登录失败。请重试。",
    ),
    "googleLoginSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Google 登录成功！",
    ),
    "gpsRemovedSuccess": MessageLookupByLibrary.simpleMessage(
      "GPS 位置数据已移除并另存为副本。",
    ),
    "groupIndex": m9,
    "hexagon": MessageLookupByLibrary.simpleMessage("六边形"),
    "history": MessageLookupByLibrary.simpleMessage("历史记录"),
    "historyEarlier": MessageLookupByLibrary.simpleMessage("更早"),
    "historyLast7Days": MessageLookupByLibrary.simpleMessage("最近 7 天"),
    "historyThisMonth": MessageLookupByLibrary.simpleMessage("本月"),
    "historyToday": MessageLookupByLibrary.simpleMessage("今天"),
    "historyYesterday": MessageLookupByLibrary.simpleMessage("昨天"),
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
    "homeWidgetSuggestionSubtitle": MessageLookupByLibrary.simpleMessage(
      "将小部件添加到主屏幕以快速访问和跟踪存储。",
    ),
    "homeWidgetSuggestionTitle": MessageLookupByLibrary.simpleMessage("主屏幕小部件"),
    "howToEarn": MessageLookupByLibrary.simpleMessage("如何获得？"),
    "howToEarnDescription": MessageLookupByLibrary.simpleMessage(
      "您需要执行更多系统清理步骤或邀请朋友来获得此徽章。",
    ),
    "hue": MessageLookupByLibrary.simpleMessage("色调"),
    "iUnderstandDeleteConsequences": MessageLookupByLibrary.simpleMessage(
      "我了解后果并希望删除我的帐户",
    ),
    "imageSaved": MessageLookupByLibrary.simpleMessage("图像保存成功！"),
    "includedInLifetime": MessageLookupByLibrary.simpleMessage("包含在终身版中"),
    "information": MessageLookupByLibrary.simpleMessage("信息"),
    "inputHintText": MessageLookupByLibrary.simpleMessage("输入文本"),
    "intensity": MessageLookupByLibrary.simpleMessage("强度"),
    "invalidTokenOrExpired": MessageLookupByLibrary.simpleMessage("无效或过期的令牌。"),
    "itemsDeleted": MessageLookupByLibrary.simpleMessage("已删除项目"),
    "japanese": MessageLookupByLibrary.simpleMessage("日语"),
    "keepLocalData": MessageLookupByLibrary.simpleMessage("保留本地数据"),
    "language": MessageLookupByLibrary.simpleMessage("语言"),
    "level": m10,
    "line": MessageLookupByLibrary.simpleMessage("直线"),
    "lineWidth": MessageLookupByLibrary.simpleMessage("线宽"),
    "livePhotos": MessageLookupByLibrary.simpleMessage("实况照片"),
    "livePhotosDescription": MessageLookupByLibrary.simpleMessage(
      "实况照片是可以播放短视频的动态照片。清理它们以释放存储空间。",
    ),
    "login": MessageLookupByLibrary.simpleMessage("登录"),
    "loginFailureMessage": MessageLookupByLibrary.simpleMessage("登录失败。请重试。"),
    "loginSuccessfully": MessageLookupByLibrary.simpleMessage("登录成功！"),
    "loginToSync": MessageLookupByLibrary.simpleMessage("登录以在设备间同步您的进度"),
    "logout": MessageLookupByLibrary.simpleMessage("退出登录"),
    "longPressToSelectAll": MessageLookupByLibrary.simpleMessage("长按全选"),
    "luminance": MessageLookupByLibrary.simpleMessage("亮度"),
    "manageSubscriptions": MessageLookupByLibrary.simpleMessage("管理订阅"),
    "mediaTimeline": MessageLookupByLibrary.simpleMessage("媒体时间线"),
    "mediaTimelineDescription": MessageLookupByLibrary.simpleMessage(
      "按时间查看您的媒体",
    ),
    "media_audio": MessageLookupByLibrary.simpleMessage("音频"),
    "media_other": MessageLookupByLibrary.simpleMessage("全部"),
    "media_photo": MessageLookupByLibrary.simpleMessage("照片"),
    "media_type_selection": MessageLookupByLibrary.simpleMessage("选择媒体类型"),
    "media_video": MessageLookupByLibrary.simpleMessage("视频"),
    "memoryWarning": MessageLookupByLibrary.simpleMessage("存储空间几乎已满！"),
    "mergeData": MessageLookupByLibrary.simpleMessage("合并数据"),
    "mon": MessageLookupByLibrary.simpleMessage("一"),
    "more": MessageLookupByLibrary.simpleMessage("更多"),
    "moveAndZoom": MessageLookupByLibrary.simpleMessage("缩放"),
    "nameLength": MessageLookupByLibrary.simpleMessage("姓名至少包含2个字符"),
    "nameRequired": MessageLookupByLibrary.simpleMessage("必须输入姓名"),
    "newPassword": MessageLookupByLibrary.simpleMessage("新密码"),
    "next": MessageLookupByLibrary.simpleMessage("下一步"),
    "noAccountRegister": MessageLookupByLibrary.simpleMessage("没有帐户？注册"),
    "noActivity": MessageLookupByLibrary.simpleMessage("暂无清理活动"),
    "noBadgesEarnedYet": MessageLookupByLibrary.simpleMessage("尚未获得任何徽章"),
    "noDocumentsFound": MessageLookupByLibrary.simpleMessage("未找到包含文本的图像。"),
    "noEmailProvided": MessageLookupByLibrary.simpleMessage("未提供邮箱"),
    "noFacesDetected": MessageLookupByLibrary.simpleMessage("此照片中未检测到面孔。"),
    "noFilter": MessageLookupByLibrary.simpleMessage("无滤镜"),
    "noPhotosWithGPSFound": MessageLookupByLibrary.simpleMessage(
      "未找到包含位置数据的图像。",
    ),
    "notEarned": MessageLookupByLibrary.simpleMessage("未满足条件"),
    "notLoggedIn": MessageLookupByLibrary.simpleMessage("未登录 (访客)"),
    "nothingFound": MessageLookupByLibrary.simpleMessage("未找到内容"),
    "notifScanCompleteBlurry": m11,
    "notifScanCompleteDocuments": m12,
    "notifScanCompleteDuplicates": m13,
    "notifScanCompleteGPS": m14,
    "notifScanCompleteNone": MessageLookupByLibrary.simpleMessage(
      "未发现问题。您的相册很干净！",
    ),
    "notifScanCompleteTitle": MessageLookupByLibrary.simpleMessage("扫描完成！"),
    "notifScanningBody": m15,
    "notifScanningTitle": MessageLookupByLibrary.simpleMessage("正在扫描照片..."),
    "ok": MessageLookupByLibrary.simpleMessage("确定"),
    "oldPassword": MessageLookupByLibrary.simpleMessage("旧密码"),
    "onboardingDemoSwipeLeft": MessageLookupByLibrary.simpleMessage("向左滑动删除"),
    "onboardingDemoSwipeRight": MessageLookupByLibrary.simpleMessage("向右滑动保留"),
    "onboardingStartScan": MessageLookupByLibrary.simpleMessage("开始扫描"),
    "onboardingWelcomeTitle": MessageLookupByLibrary.simpleMessage(
      "欢迎使用 Twinfix",
    ),
    "opacity": MessageLookupByLibrary.simpleMessage("不透明度"),
    "openGalleryManager": MessageLookupByLibrary.simpleMessage("打开图库管理器"),
    "openGalleryManagerDescription": MessageLookupByLibrary.simpleMessage(
      "如果您想按媒体类型手动清理，请点击此处。点击高亮按钮将其打开。",
    ),
    "openingEmailApp": MessageLookupByLibrary.simpleMessage("正在打开邮件应用以发送反馈..."),
    "or": MessageLookupByLibrary.simpleMessage("或"),
    "packageLifetimeDescription": MessageLookupByLibrary.simpleMessage(
      "一次性购买，永久使用。",
    ),
    "packageLifetimeTitle": MessageLookupByLibrary.simpleMessage("终身"),
    "packageMonthlyDescription": MessageLookupByLibrary.simpleMessage(
      "按月订阅。可随时取消。",
    ),
    "packageMonthlyTitle": MessageLookupByLibrary.simpleMessage("1 个月"),
    "paint": MessageLookupByLibrary.simpleMessage("涂鸦"),
    "password": MessageLookupByLibrary.simpleMessage("密码"),
    "passwordLength": MessageLookupByLibrary.simpleMessage(
      "密码长度至少为 8 个字符，且必须包含大写、小写、数字和特殊字符",
    ),
    "passwordRequired": MessageLookupByLibrary.simpleMessage("必须输入密码"),
    "passwordTooShort": MessageLookupByLibrary.simpleMessage("密码太短"),
    "passwordsDoNotMatch": MessageLookupByLibrary.simpleMessage("密码不匹配"),
    "paywallSubtitle": MessageLookupByLibrary.simpleMessage("无限制享受所有专业功能。"),
    "paywallWelcomeSubtitle": MessageLookupByLibrary.simpleMessage(
      "释放相册的全部潜力，体验强大的 AI 工具和无广告的环境。",
    ),
    "paywallWelcomeTitle": MessageLookupByLibrary.simpleMessage("欢迎使用高级版"),
    "perfect": MessageLookupByLibrary.simpleMessage("完美！"),
    "permissionDescription": MessageLookupByLibrary.simpleMessage(
      "Twinfix 需要访问您的相册以扫描和清理重复照片。",
    ),
    "permissionRequired": MessageLookupByLibrary.simpleMessage("需要权限"),
    "personalCustomizeableTheme": MessageLookupByLibrary.simpleMessage("个性化界面"),
    "personalProcessSync": MessageLookupByLibrary.simpleMessage("同步清理进度"),
    "pixelate": MessageLookupByLibrary.simpleMessage("像素化"),
    "pleaseEnterWatermarkText": MessageLookupByLibrary.simpleMessage("请输入水印文本"),
    "pleaseFillAllFields": MessageLookupByLibrary.simpleMessage("请填写所有字段"),
    "pleaseWaitWhileWeAreRedirectingYou": MessageLookupByLibrary.simpleMessage(
      "请稍候，我们正在为您重定向...",
    ),
    "polygon": MessageLookupByLibrary.simpleMessage("多边形"),
    "popular": MessageLookupByLibrary.simpleMessage("最受欢迎"),
    "premium": MessageLookupByLibrary.simpleMessage("高级版"),
    "premiumFeatureAiTools": MessageLookupByLibrary.simpleMessage("解锁所有 AI 工具"),
    "premiumFeatureNoAds": MessageLookupByLibrary.simpleMessage("无广告"),
    "premiumPlan": MessageLookupByLibrary.simpleMessage("高级套餐"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("隐私政策"),
    "profile": MessageLookupByLibrary.simpleMessage("个人资料"),
    "profileSettings": MessageLookupByLibrary.simpleMessage("个人资料设置"),
    "progress": MessageLookupByLibrary.simpleMessage("进度"),
    "purchaseErrorStoreConnection": MessageLookupByLibrary.simpleMessage(
      "无法连接到商店。",
    ),
    "purchaseFailureMessage": MessageLookupByLibrary.simpleMessage(
      "购买失败或已被取消。",
    ),
    "purchaseSuccess": MessageLookupByLibrary.simpleMessage("高级版升级成功！"),
    "ratio": MessageLookupByLibrary.simpleMessage("比例"),
    "rectangle": MessageLookupByLibrary.simpleMessage("矩形"),
    "redo": MessageLookupByLibrary.simpleMessage("重做"),
    "register": MessageLookupByLibrary.simpleMessage("注册"),
    "registerSuccess": MessageLookupByLibrary.simpleMessage("注册成功"),
    "registerSuccessMessage": MessageLookupByLibrary.simpleMessage(
      "请在登录前查看您的邮箱以验证您的帐户。",
    ),
    "removeGPS": MessageLookupByLibrary.simpleMessage("移除 GPS"),
    "removeGPSDescription": MessageLookupByLibrary.simpleMessage(
      "从照片中移除 GPS 信息。",
    ),
    "replaceOriginal": MessageLookupByLibrary.simpleMessage("替换原图"),
    "reset": MessageLookupByLibrary.simpleMessage("重置"),
    "resetLinkSent": MessageLookupByLibrary.simpleMessage("重置链接已发送到您的邮箱！"),
    "restoreFailureMessage": MessageLookupByLibrary.simpleMessage(
      "无法恢复购买或您没有订阅。",
    ),
    "restoreFromCloud": MessageLookupByLibrary.simpleMessage("从云端恢复"),
    "restorePurchases": MessageLookupByLibrary.simpleMessage("恢复购买"),
    "rotate": MessageLookupByLibrary.simpleMessage("旋转"),
    "sat": MessageLookupByLibrary.simpleMessage("六"),
    "saturation": MessageLookupByLibrary.simpleMessage("饱和度"),
    "save": MessageLookupByLibrary.simpleMessage("保存"),
    "saving": MessageLookupByLibrary.simpleMessage("保存中..."),
    "scanLimit": MessageLookupByLibrary.simpleMessage("扫描限制"),
    "scanLimitAll": MessageLookupByLibrary.simpleMessage("全部"),
    "scanLimitWarning": MessageLookupByLibrary.simpleMessage(
      "扫描所有照片可能需要很长时间并消耗更多电量。",
    ),
    "scanResults": MessageLookupByLibrary.simpleMessage("扫描结果"),
    "scanningDevice": MessageLookupByLibrary.simpleMessage("正在扫描设备..."),
    "scanningDocument": MessageLookupByLibrary.simpleMessage("正在扫描文档..."),
    "screenshots": MessageLookupByLibrary.simpleMessage("屏幕截图"),
    "screenshotsDescription": MessageLookupByLibrary.simpleMessage(
      "屏幕截图是静态照片。清理它们以释放存储空间。",
    ),
    "search": MessageLookupByLibrary.simpleMessage("搜索"),
    "selectAll": MessageLookupByLibrary.simpleMessage("全选"),
    "selectEmoji": MessageLookupByLibrary.simpleMessage("选择表情符号"),
    "selectTemplate": MessageLookupByLibrary.simpleMessage("选择模板"),
    "sendFeedbackSubtitle": MessageLookupByLibrary.simpleMessage(
      "我们很乐意听取您的意见！",
    ),
    "sendFeedbackTitle": MessageLookupByLibrary.simpleMessage("向我们发送您的反馈"),
    "sendResetLink": MessageLookupByLibrary.simpleMessage("发送重置链接"),
    "settings": MessageLookupByLibrary.simpleMessage("设置"),
    "sevenDays": MessageLookupByLibrary.simpleMessage("7 天"),
    "sevenWeeks": MessageLookupByLibrary.simpleMessage("7 周"),
    "sharpness": MessageLookupByLibrary.simpleMessage("清晰度"),
    "signInWithGoogle": MessageLookupByLibrary.simpleMessage("使用 Google 登录"),
    "size": MessageLookupByLibrary.simpleMessage("大小"),
    "sizeAsc": MessageLookupByLibrary.simpleMessage("按大小升序"),
    "sizeDesc": MessageLookupByLibrary.simpleMessage("按大小降序"),
    "skip": MessageLookupByLibrary.simpleMessage("跳过"),
    "smallScreenMoreTooltip": MessageLookupByLibrary.simpleMessage("更多"),
    "solid": MessageLookupByLibrary.simpleMessage("纯色"),
    "sort": MessageLookupByLibrary.simpleMessage("排序"),
    "startQuickScan": MessageLookupByLibrary.simpleMessage("开始快速扫描"),
    "startQuickScanDescription": MessageLookupByLibrary.simpleMessage(
      "使用此按钮扫描您的图库并一次性检测重复项。",
    ),
    "stats": MessageLookupByLibrary.simpleMessage("统计数据"),
    "storageAlmostFull": m16,
    "storageUsedPercent": m17,
    "streak": MessageLookupByLibrary.simpleMessage("连续"),
    "streakDays": m18,
    "streaks": MessageLookupByLibrary.simpleMessage("连续记录"),
    "strokeWidth": MessageLookupByLibrary.simpleMessage("笔触宽度"),
    "submitFeedback": MessageLookupByLibrary.simpleMessage("提交反馈"),
    "success": MessageLookupByLibrary.simpleMessage("成功"),
    "sun": MessageLookupByLibrary.simpleMessage("日"),
    "syncDataMessage": MessageLookupByLibrary.simpleMessage(
      "我们发现您访客会话中的一些本地清理数据。您要将其合并到新帐户中吗？",
    ),
    "syncDataTitle": MessageLookupByLibrary.simpleMessage("链接访客数据？"),
    "syncExplainKeepLocalDesc": MessageLookupByLibrary.simpleMessage(
      "在此设备上保留当前访客数据并覆盖现有的云端数据。",
    ),
    "syncExplainMergeDesc": MessageLookupByLibrary.simpleMessage(
      "将本地访客统计数据和成就与现有帐户数据合并。您不会丢失任何进度。",
    ),
    "syncExplainRestoreDesc": MessageLookupByLibrary.simpleMessage(
      "放弃当前访客会话数据并从云端恢复以前的帐户数据。",
    ),
    "syncExplainTitle": MessageLookupByLibrary.simpleMessage("有哪些同步选项？"),
    "tabDashboard": MessageLookupByLibrary.simpleMessage("成就"),
    "tabOtherFeatures": MessageLookupByLibrary.simpleMessage("其他功能"),
    "tabScan": MessageLookupByLibrary.simpleMessage("扫描"),
    "tabSettings": MessageLookupByLibrary.simpleMessage("设置"),
    "tapToChangeStyle": MessageLookupByLibrary.simpleMessage("点击以更改样式"),
    "temperature": MessageLookupByLibrary.simpleMessage("色温"),
    "termsOfService": MessageLookupByLibrary.simpleMessage("服务条款"),
    "text": MessageLookupByLibrary.simpleMessage("文本"),
    "textAlign": MessageLookupByLibrary.simpleMessage("对齐文本"),
    "theme": MessageLookupByLibrary.simpleMessage("主题"),
    "themeDark": MessageLookupByLibrary.simpleMessage("深色"),
    "themeLight": MessageLookupByLibrary.simpleMessage("浅色"),
    "themeSystem": MessageLookupByLibrary.simpleMessage("系统"),
    "thu": MessageLookupByLibrary.simpleMessage("四"),
    "timelineDay": MessageLookupByLibrary.simpleMessage("日"),
    "timelineMonth": MessageLookupByLibrary.simpleMessage("月"),
    "timelineYear": MessageLookupByLibrary.simpleMessage("年"),
    "toggleFill": MessageLookupByLibrary.simpleMessage("切换填充"),
    "tooManyRequests": MessageLookupByLibrary.simpleMessage("请求过多。请稍后再试。"),
    "totalPhotos": m19,
    "totalPhotosLast7Days": m20,
    "totalPhotosLast7Weeks": m21,
    "tue": MessageLookupByLibrary.simpleMessage("二"),
    "tune": MessageLookupByLibrary.simpleMessage("调整"),
    "understood": MessageLookupByLibrary.simpleMessage("知道了"),
    "undo": MessageLookupByLibrary.simpleMessage("撤销"),
    "unknown": MessageLookupByLibrary.simpleMessage("未知"),
    "unknownError": MessageLookupByLibrary.simpleMessage("发生未知错误。"),
    "unknownUser": MessageLookupByLibrary.simpleMessage("未知用户"),
    "upgradeToPremium": MessageLookupByLibrary.simpleMessage("升级至高级版"),
    "userBanned": MessageLookupByLibrary.simpleMessage("用户被封禁。"),
    "userNotFound": MessageLookupByLibrary.simpleMessage("未找到用户。"),
    "verificationSuccess": MessageLookupByLibrary.simpleMessage("验证成功！"),
    "vietnamese": MessageLookupByLibrary.simpleMessage("越南语"),
    "viewAllBadges": MessageLookupByLibrary.simpleMessage("查看所有徽章"),
    "viewDetail": MessageLookupByLibrary.simpleMessage("查看详情"),
    "viewFullHistory": MessageLookupByLibrary.simpleMessage("查看完整历史"),
    "watermarkText": MessageLookupByLibrary.simpleMessage("水印文本"),
    "weakPassword": MessageLookupByLibrary.simpleMessage("密码太弱。"),
    "wed": MessageLookupByLibrary.simpleMessage("三"),
    "weekShort": MessageLookupByLibrary.simpleMessage("周"),
    "welcomeBack": MessageLookupByLibrary.simpleMessage("欢迎回来"),
  };
}
