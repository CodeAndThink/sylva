// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ja locale. All the
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
  String get localeName => 'ja';

  static String m0(version) => "バージョン ${version}";

  static String m1(num, unit, size) => "${num} ${unit} (${size}) をクリーンアップしました";

  static String m2(badgeName) => "「${badgeName}」バッジを獲得しました！";

  static String m3(count) => "${count} 個の新しいバッジを獲得しました！";

  static String m4(email) => "メールアプリを開けませんでした。サポートメール: ${email}";

  static String m5(count) => "削除 (${count})";

  static String m6(count) => "${count} 個の項目を削除しました";

  static String m7(count) => "${count}組の重複を検出しました";

  static String m8(message) => "エラー: ${message}";

  static String m9(index, count) => "グループ ${index} (${count}枚の写真)";

  static String m10(level) => "レベル ${level}";

  static String m11(count) => "ぼやけた写真が${count}枚見つかりました。タップして確認。";

  static String m12(count) => "文書が${count}件見つかりました。タップして確認。";

  static String m13(count) => "重複写真が${count}枚見つかりました。タップして確認。";

  static String m14(count) => "GPS付き写真が${count}枚見つかりました。タップして確認。";

  static String m15(current, total) => "${current}/${total} 枚スキャン済み";

  static String m16(percent) =>
      "ストレージがほぼいっぱいです (${percent}%)。今すぐクリーンアップしてください！";

  static String m17(percent) => "${percent}% 使用済み";

  static String m18(days) => "${days}日連続";

  static String m19(count) => "${count} 枚の写真";

  static String m20(count, mediaType) => "合計: ${count} ${mediaType} (過去7日間)";

  static String m21(count, mediaType) => "合計: ${count} ${mediaType} (過去7週間)";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "aboutDescription": MessageLookupByLibrary.simpleMessage(
      "Twinfixは、AIを使用して写真ギャラリーを簡単に整理・クリーンアップできる強力なツールです。",
    ),
    "aboutUs": MessageLookupByLibrary.simpleMessage("私たちについて"),
    "accountSyncActive": MessageLookupByLibrary.simpleMessage("アカウント同期が有効です"),
    "activity": MessageLookupByLibrary.simpleMessage("アクティビティ"),
    "activityDetailTitle": MessageLookupByLibrary.simpleMessage(
      "クリーンアップアクティビティ",
    ),
    "addWaterMark": MessageLookupByLibrary.simpleMessage("透かしを追加"),
    "addWaterMarkDescription": MessageLookupByLibrary.simpleMessage(
      "写真に透かしを追加します。",
    ),
    "allBadges": MessageLookupByLibrary.simpleMessage("すべてのバッジ"),
    "alreadyHaveAccountLogin": MessageLookupByLibrary.simpleMessage(
      "すでにアカウントをお持ちですか？ ログイン",
    ),
    "appDescription": MessageLookupByLibrary.simpleMessage("写真重複クリーナー"),
    "appName": MessageLookupByLibrary.simpleMessage("Sylva"),
    "appVersion": m0,
    "appearance": MessageLookupByLibrary.simpleMessage("外観"),
    "arrow": MessageLookupByLibrary.simpleMessage("矢印"),
    "awesome": MessageLookupByLibrary.simpleMessage("素晴らしい！"),
    "back": MessageLookupByLibrary.simpleMessage("戻る"),
    "backgroundMode": MessageLookupByLibrary.simpleMessage("背景モード"),
    "backgroundStyle": MessageLookupByLibrary.simpleMessage("背景スタイル"),
    "badgeAiCleanerDesc": MessageLookupByLibrary.simpleMessage(
      "自動クリーンアップ機能を使用しました。",
    ),
    "badgeAiCleanerName": MessageLookupByLibrary.simpleMessage("AI アシスタント"),
    "badgeBlurry10Desc": MessageLookupByLibrary.simpleMessage(
      "ぼやけた写真を10枚削除しました。",
    ),
    "badgeBlurry10Name": MessageLookupByLibrary.simpleMessage("ブラーハンター"),
    "badgeBlurry200Desc": MessageLookupByLibrary.simpleMessage(
      "ぼやけた写真を200枚削除しました。",
    ),
    "badgeBlurry200Name": MessageLookupByLibrary.simpleMessage("ブラーデストロイヤー"),
    "badgeBlurryKillerDesc": MessageLookupByLibrary.simpleMessage(
      "ぼやけた写真を50枚削除しました。",
    ),
    "badgeBlurryKillerName": MessageLookupByLibrary.simpleMessage("ブラーキラー"),
    "badgeCleaner1000Desc": MessageLookupByLibrary.simpleMessage(
      "合計1000枚の写真を削除しました。",
    ),
    "badgeCleaner1000Name": MessageLookupByLibrary.simpleMessage("写真シュレッダー"),
    "badgeCleaner100Desc": MessageLookupByLibrary.simpleMessage(
      "合計100枚の写真を削除しました。",
    ),
    "badgeCleaner100Name": MessageLookupByLibrary.simpleMessage("熟練クリーナー"),
    "badgeCleaner10Desc": MessageLookupByLibrary.simpleMessage(
      "合計10枚の写真を削除しました。",
    ),
    "badgeCleaner10Name": MessageLookupByLibrary.simpleMessage("見習いクリーナー"),
    "badgeDuplicate100Desc": MessageLookupByLibrary.simpleMessage(
      "重複した写真を100枚削除しました。",
    ),
    "badgeDuplicate100Name": MessageLookupByLibrary.simpleMessage("重複マスター"),
    "badgeDuplicate20Desc": MessageLookupByLibrary.simpleMessage(
      "重複した写真を20枚削除しました。",
    ),
    "badgeDuplicate20Name": MessageLookupByLibrary.simpleMessage("重複ハンター"),
    "badgeFirstCleanDesc": MessageLookupByLibrary.simpleMessage(
      "初めて写真を削除しました。",
    ),
    "badgeFirstCleanName": MessageLookupByLibrary.simpleMessage("初めてのクリーン"),
    "badgeFreed100mbDesc": MessageLookupByLibrary.simpleMessage(
      "合計200枚の写真を削除しました。",
    ),
    "badgeFreed100mbName": MessageLookupByLibrary.simpleMessage("ストレージの初心者"),
    "badgeFreed10gbDesc": MessageLookupByLibrary.simpleMessage(
      "合計5000枚の写真を削除しました。",
    ),
    "badgeFreed10gbName": MessageLookupByLibrary.simpleMessage("ディスクの伝説"),
    "badgeFreed5gbDesc": MessageLookupByLibrary.simpleMessage(
      "合計2000枚の写真を削除しました。",
    ),
    "badgeFreed5gbName": MessageLookupByLibrary.simpleMessage("ストレージヒーロー"),
    "badgeGigaKingDesc": MessageLookupByLibrary.simpleMessage(
      "合計500枚の写真を削除しました。",
    ),
    "badgeGigaKingName": MessageLookupByLibrary.simpleMessage("クリーニングマスター"),
    "badgeNewbieDesc": MessageLookupByLibrary.simpleMessage(
      "最初の写真を削除し、ストレージを解放する旅を始めましょう。",
    ),
    "badgeNewbieName": MessageLookupByLibrary.simpleMessage("新人クリーナー"),
    "badgePerfectionistDesc": MessageLookupByLibrary.simpleMessage(
      "デバイス上のぼやけた写真の80%以上を削除しました。",
    ),
    "badgePerfectionistName": MessageLookupByLibrary.simpleMessage("完璧主義者"),
    "badgeSpeedCleanDesc": MessageLookupByLibrary.simpleMessage(
      "1回のセッションで50枚の写真を削除しました。",
    ),
    "badgeSpeedCleanName": MessageLookupByLibrary.simpleMessage("スピードクリーナー"),
    "badgeStreak3Desc": MessageLookupByLibrary.simpleMessage(
      "3日間連続でクリーンアップしました。",
    ),
    "badgeStreak3Name": MessageLookupByLibrary.simpleMessage("献身的"),
    "badgeStreak7Desc": MessageLookupByLibrary.simpleMessage(
      "7日間連続でクリーンアップしました。",
    ),
    "badgeStreak7Name": MessageLookupByLibrary.simpleMessage("諦めない心"),
    "badges": MessageLookupByLibrary.simpleMessage("バッジ"),
    "becomeOneOfUs": MessageLookupByLibrary.simpleMessage("私たちの一員になりませんか"),
    "bgCustom": MessageLookupByLibrary.simpleMessage("カスタム"),
    "bgNature1": MessageLookupByLibrary.simpleMessage("自然 1"),
    "bgNature2": MessageLookupByLibrary.simpleMessage("自然 2"),
    "bgNature3": MessageLookupByLibrary.simpleMessage("自然 3"),
    "bgNature4": MessageLookupByLibrary.simpleMessage("自然 4"),
    "bgNone": MessageLookupByLibrary.simpleMessage("なし"),
    "blur": MessageLookupByLibrary.simpleMessage("ぼかし"),
    "blurFace": MessageLookupByLibrary.simpleMessage("顔をぼかす"),
    "blurFaceDescription": MessageLookupByLibrary.simpleMessage("写真内の顔をぼかします。"),
    "blurryDeleted": MessageLookupByLibrary.simpleMessage("ぼやけた写真を削除しました"),
    "blurryPhotos": MessageLookupByLibrary.simpleMessage("ぼやけた写真"),
    "blurryPhotosDescription": MessageLookupByLibrary.simpleMessage(
      "ぼやけた写真を検出してクリーンアップします。",
    ),
    "brightness": MessageLookupByLibrary.simpleMessage("明るさ"),
    "calculatingProgress": MessageLookupByLibrary.simpleMessage("計算中..."),
    "cancel": MessageLookupByLibrary.simpleMessage("キャンセル"),
    "cancelMonthlyMessage": MessageLookupByLibrary.simpleMessage(
      "無期限プランへのアップグレードに成功しました！ 以前に月額サブスクリプションを利用していたため、二重請求を避けるためにApp StoreまたはGoogle Playでキャンセルしてください。",
    ),
    "cancelMonthlyTitle": MessageLookupByLibrary.simpleMessage("必要なアクション"),
    "changeOpacity": MessageLookupByLibrary.simpleMessage("不透明度の変更"),
    "changePassword": MessageLookupByLibrary.simpleMessage("パスワードの変更"),
    "changePasswordSuccess": MessageLookupByLibrary.simpleMessage(
      "パスワードが正常に変更されました",
    ),
    "chinese": MessageLookupByLibrary.simpleMessage("中国語"),
    "circle": MessageLookupByLibrary.simpleMessage("円"),
    "cleaned": MessageLookupByLibrary.simpleMessage("クリーン"),
    "cleanedSpaceSuccess": m1,
    "clearSelection": MessageLookupByLibrary.simpleMessage("選択をクリア"),
    "color": MessageLookupByLibrary.simpleMessage("色"),
    "confirmDelete": MessageLookupByLibrary.simpleMessage("削除の確認"),
    "confirmPassword": MessageLookupByLibrary.simpleMessage("パスワードの確認"),
    "confirmPasswordRequired": MessageLookupByLibrary.simpleMessage(
      "パスワードの確認が必要です",
    ),
    "confirmnoMorePhotosToDelete": MessageLookupByLibrary.simpleMessage(
      "削除する写真はもうありません",
    ),
    "congratsBadgeMessage": m2,
    "congratsBadgeTitle": MessageLookupByLibrary.simpleMessage("新しいバッジ！"),
    "congratsMultipleBadgesMessage": m3,
    "contactUs": MessageLookupByLibrary.simpleMessage("お問い合わせ"),
    "continueWithFreeVersion": MessageLookupByLibrary.simpleMessage("無料版を続ける"),
    "contrast": MessageLookupByLibrary.simpleMessage("コントラスト"),
    "contributionGraph": MessageLookupByLibrary.simpleMessage("コントリビューショングラフ"),
    "convertImageFailed": MessageLookupByLibrary.simpleMessage("画像の変換に失敗しました"),
    "couldNotOpenEmailApp": m4,
    "countAsc": MessageLookupByLibrary.simpleMessage("数（昇順）"),
    "countDesc": MessageLookupByLibrary.simpleMessage("数（降順）"),
    "createNewImage": MessageLookupByLibrary.simpleMessage("新しい画像を作成"),
    "crop": MessageLookupByLibrary.simpleMessage("切り抜き"),
    "currentPlan": MessageLookupByLibrary.simpleMessage("現在のプラン"),
    "custom1": MessageLookupByLibrary.simpleMessage("カスタム 1"),
    "custom2": MessageLookupByLibrary.simpleMessage("カスタム 2"),
    "custom3": MessageLookupByLibrary.simpleMessage("カスタム 3"),
    "customThemeDescription": MessageLookupByLibrary.simpleMessage(
      "タップして選択、長押しして別の画像を選択",
    ),
    "dashDotLine": MessageLookupByLibrary.simpleMessage("一点鎖線"),
    "dashLine": MessageLookupByLibrary.simpleMessage("破線"),
    "dataSynchronizedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "データが正常に同期されました",
    ),
    "dateAsc": MessageLookupByLibrary.simpleMessage("日付昇順"),
    "dateDesc": MessageLookupByLibrary.simpleMessage("日付降順"),
    "days": MessageLookupByLibrary.simpleMessage("日"),
    "defaultErrorMessage": MessageLookupByLibrary.simpleMessage(
      "エラーが発生しました。もう一度お試しください。",
    ),
    "delete": MessageLookupByLibrary.simpleMessage("削除"),
    "deleteAccount": MessageLookupByLibrary.simpleMessage("アカウントを削除"),
    "deleteAccountConfirm": MessageLookupByLibrary.simpleMessage(
      "アカウントを削除してもよろしいですか？すべてのデータは完全に削除されます。",
    ),
    "deleteAccountWarningMessage": MessageLookupByLibrary.simpleMessage(
      "この操作は取り消すことができません。すべてのデータと個人情報はシステムから永久に削除されます。\n\n重要：アカウントを削除しても、有効なサブスクリプションは自動的にキャンセルされません。予期しない請求を避けるため、続行する前に必ずストアでサブスクリプションをキャンセルしてください。",
    ),
    "deleteAccountWarningTitle": MessageLookupByLibrary.simpleMessage(
      "アカウントを削除",
    ),
    "deleteSelected": m5,
    "delete_confirm_message": MessageLookupByLibrary.simpleMessage(
      "最後にもう一度確認してください！\nこの操作は元に戻せません。",
    ),
    "delete_confirm_message_permanent": MessageLookupByLibrary.simpleMessage(
      "最後にもう一度ご確認ください！\nこの操作は元に戻せません。写真はデバイスから完全に削除されます。",
    ),
    "delete_confirm_message_trash": MessageLookupByLibrary.simpleMessage(
      "最後にもう一度ご確認ください！\n写真はデバイスのゴミ箱に移動され、30日以内であれば復元可能です。",
    ),
    "deletedItemsCount": m6,
    "density": MessageLookupByLibrary.simpleMessage("密度"),
    "deselectAll": MessageLookupByLibrary.simpleMessage("すべて選択解除"),
    "detectedDuplicateGroups": m7,
    "deviceIsClean": MessageLookupByLibrary.simpleMessage("デバイスは非常に綺麗です。"),
    "document": MessageLookupByLibrary.simpleMessage("ドキュメント検出"),
    "documentDescription": MessageLookupByLibrary.simpleMessage(
      "テキストを含む画像を識別して管理します。",
    ),
    "done": MessageLookupByLibrary.simpleMessage("了解"),
    "duplicates": MessageLookupByLibrary.simpleMessage("重複"),
    "earned": MessageLookupByLibrary.simpleMessage("ロック解除済み"),
    "edit": MessageLookupByLibrary.simpleMessage("編集"),
    "editAnotherPhoto": MessageLookupByLibrary.simpleMessage("別の写真を編集"),
    "editDescription": MessageLookupByLibrary.simpleMessage("画像を編集"),
    "email": MessageLookupByLibrary.simpleMessage("メール"),
    "emailAlreadyInUse": MessageLookupByLibrary.simpleMessage(
      "このメールアドレスは既に使用されています。",
    ),
    "emailInvalid": MessageLookupByLibrary.simpleMessage("無効なメール形式です"),
    "emailNotConfirmed": MessageLookupByLibrary.simpleMessage(
      "メールアドレスが確認されていません。",
    ),
    "emailRequired": MessageLookupByLibrary.simpleMessage("メールアドレスが必要です"),
    "emoji": MessageLookupByLibrary.simpleMessage("絵文字"),
    "enableNotification": MessageLookupByLibrary.simpleMessage("通知を有効にする"),
    "enableNotificationDescription": MessageLookupByLibrary.simpleMessage(
      "スキャンの進行状況と完了の通知を受け取ります。",
    ),
    "english": MessageLookupByLibrary.simpleMessage("英語"),
    "enterWatermarkText": MessageLookupByLibrary.simpleMessage("透かしテキストを入力"),
    "eraser": MessageLookupByLibrary.simpleMessage("消しゴム"),
    "error": m8,
    "errorEmailNotFound": MessageLookupByLibrary.simpleMessage(
      "エラー: メールが見つかりません",
    ),
    "errorTitle": MessageLookupByLibrary.simpleMessage("エラー"),
    "error_unable_to_play_media": MessageLookupByLibrary.simpleMessage(
      "メディアを再生できません",
    ),
    "error_unsupported_media_type": MessageLookupByLibrary.simpleMessage(
      "サポートされていないメディアタイプです",
    ),
    "exposure": MessageLookupByLibrary.simpleMessage("露出"),
    "eyeBar": MessageLookupByLibrary.simpleMessage("目線"),
    "fade": MessageLookupByLibrary.simpleMessage("フェード"),
    "failedToChangePassword": MessageLookupByLibrary.simpleMessage(
      "パスワードの変更に失敗しました。もう一度お試しください。",
    ),
    "failedToLoadHistory": MessageLookupByLibrary.simpleMessage(
      "削除履歴の読み込みに失敗しました。",
    ),
    "failedToLoadProfile": MessageLookupByLibrary.simpleMessage(
      "ユーザープロファイルの読み込みに失敗しました。接続を確認してください。",
    ),
    "failedToLoadStorageInfo": MessageLookupByLibrary.simpleMessage(
      "ストレージ情報の読み込みに失敗しました。",
    ),
    "failedToRegister": MessageLookupByLibrary.simpleMessage(
      "登録に失敗しました。もう一度お試しください。",
    ),
    "failedToSaveImage": MessageLookupByLibrary.simpleMessage(
      "画像の保存に失敗しました。もう一度お試しください。",
    ),
    "failedToSendResetLink": MessageLookupByLibrary.simpleMessage(
      "リセットリンクの送信に失敗しました",
    ),
    "featureClean": MessageLookupByLibrary.simpleMessage("効率的なクリーンアップ"),
    "featureModernUI": MessageLookupByLibrary.simpleMessage("モダンなユーザーインターフェース"),
    "featureScan": MessageLookupByLibrary.simpleMessage("高速スキャン"),
    "featuresTitle": MessageLookupByLibrary.simpleMessage("主な機能"),
    "feedbackContentHint": MessageLookupByLibrary.simpleMessage(
      "バグの詳細や改善の提案をここに入力してください...",
    ),
    "feedbackContentLabel": MessageLookupByLibrary.simpleMessage("詳細内容"),
    "feedbackContentRequired": MessageLookupByLibrary.simpleMessage(
      "詳細内容を入力してください",
    ),
    "feedbackTitleHint": MessageLookupByLibrary.simpleMessage(
      "フィードバックのタイトルを入力...",
    ),
    "feedbackTitleLabel": MessageLookupByLibrary.simpleMessage("タイトル"),
    "feedbackTitleRequired": MessageLookupByLibrary.simpleMessage(
      "タイトルを入力してください",
    ),
    "feedbackTypeBug": MessageLookupByLibrary.simpleMessage("バグ"),
    "feedbackTypeImprovement": MessageLookupByLibrary.simpleMessage("改善"),
    "feedbackTypeLabel": MessageLookupByLibrary.simpleMessage("フィードバックの種類"),
    "feedbackTypeOther": MessageLookupByLibrary.simpleMessage("その他"),
    "feedbackTypeQuestion": MessageLookupByLibrary.simpleMessage("質問"),
    "file": MessageLookupByLibrary.simpleMessage("ファイル"),
    "files": MessageLookupByLibrary.simpleMessage("ファイル"),
    "fill": MessageLookupByLibrary.simpleMessage("塗りつぶし"),
    "filter": MessageLookupByLibrary.simpleMessage("フィルター"),
    "finish": MessageLookupByLibrary.simpleMessage("完了"),
    "flip": MessageLookupByLibrary.simpleMessage("反転"),
    "fontScale": MessageLookupByLibrary.simpleMessage("フォントサイズ"),
    "footerTitle": MessageLookupByLibrary.simpleMessage("お問い合わせ"),
    "forgotPasswordDescription": MessageLookupByLibrary.simpleMessage(
      "メールアドレスを入力すると、パスワードリセットリンクが送信されます。",
    ),
    "forgotPasswordQuestion": MessageLookupByLibrary.simpleMessage(
      "パスワードを忘れた場合",
    ),
    "forgotPasswordTitle": MessageLookupByLibrary.simpleMessage("パスワードを忘れた場合"),
    "freePlan": MessageLookupByLibrary.simpleMessage("無料プラン"),
    "freestyle": MessageLookupByLibrary.simpleMessage("フリースタイル"),
    "freestyleArrowEnd": MessageLookupByLibrary.simpleMessage("フリースタイル矢印終了"),
    "freestyleArrowStart": MessageLookupByLibrary.simpleMessage("フリースタイル矢印開始"),
    "freestyleArrowStartEnd": MessageLookupByLibrary.simpleMessage(
      "フリースタイル矢印両端",
    ),
    "fri": MessageLookupByLibrary.simpleMessage("金"),
    "fullName": MessageLookupByLibrary.simpleMessage("フルネーム"),
    "galleryManager": MessageLookupByLibrary.simpleMessage("ギャラリーマネージャー"),
    "general": MessageLookupByLibrary.simpleMessage("一般"),
    "glasses": MessageLookupByLibrary.simpleMessage("メガネ"),
    "googleLoginFailed": MessageLookupByLibrary.simpleMessage(
      "Googleサインインに失敗しました。もう一度お試しください。",
    ),
    "googleLoginSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Googleサインインに成功しました！",
    ),
    "gpsRemovedSuccess": MessageLookupByLibrary.simpleMessage(
      "GPS位置データが削除され、コピーとして保存されました。",
    ),
    "groupIndex": m9,
    "hexagon": MessageLookupByLibrary.simpleMessage("六角形"),
    "history": MessageLookupByLibrary.simpleMessage("履歴"),
    "historyEarlier": MessageLookupByLibrary.simpleMessage("以前"),
    "historyLast7Days": MessageLookupByLibrary.simpleMessage("過去7日間"),
    "historyThisMonth": MessageLookupByLibrary.simpleMessage("今月"),
    "historyToday": MessageLookupByLibrary.simpleMessage("今日"),
    "historyYesterday": MessageLookupByLibrary.simpleMessage("昨日"),
    "homeWidgetDialogSubtitle": MessageLookupByLibrary.simpleMessage(
      "Twinfixウィジェットをホーム画面に追加して、デバイスのストレージをすばやく監視できます：",
    ),
    "homeWidgetDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Twinfixウィジェットを追加",
    ),
    "homeWidgetStep1": MessageLookupByLibrary.simpleMessage(
      "1. 携帯電話のホーム画面に戻ります。",
    ),
    "homeWidgetStep2": MessageLookupByLibrary.simpleMessage(
      "2. 画面上の空白のスペースを長押しします。",
    ),
    "homeWidgetStep3": MessageLookupByLibrary.simpleMessage(
      "3. 「ウィジェット」を選択します。",
    ),
    "homeWidgetStep4": MessageLookupByLibrary.simpleMessage(
      "4. Twinfixを見つけて、ウィジェットを画面にドラッグします。",
    ),
    "homeWidgetSuggestionSubtitle": MessageLookupByLibrary.simpleMessage(
      "ウィジェットをホーム画面に追加して、すばやくアクセスし、ストレージを追跡します。",
    ),
    "homeWidgetSuggestionTitle": MessageLookupByLibrary.simpleMessage(
      "ホーム画面ウィジェット",
    ),
    "howToEarn": MessageLookupByLibrary.simpleMessage("獲得方法は？"),
    "howToEarnDescription": MessageLookupByLibrary.simpleMessage(
      "このバッジを獲得するには、さらにシステムのクリーンアップを実行するか、友達を招待する必要があります。",
    ),
    "hue": MessageLookupByLibrary.simpleMessage("色相"),
    "iUnderstandDeleteConsequences": MessageLookupByLibrary.simpleMessage(
      "結果を理解した上でアカウントを削除します",
    ),
    "imageSaved": MessageLookupByLibrary.simpleMessage("画像が正常に保存されました！"),
    "includedInLifetime": MessageLookupByLibrary.simpleMessage(
      "無期限プランに含まれています",
    ),
    "information": MessageLookupByLibrary.simpleMessage("情報"),
    "inputHintText": MessageLookupByLibrary.simpleMessage("テキストを入力"),
    "intensity": MessageLookupByLibrary.simpleMessage("強度"),
    "invalidTokenOrExpired": MessageLookupByLibrary.simpleMessage(
      "無効または期限切れのトークンです。",
    ),
    "itemsDeleted": MessageLookupByLibrary.simpleMessage("削除された項目"),
    "japanese": MessageLookupByLibrary.simpleMessage("日本語"),
    "keepLocalData": MessageLookupByLibrary.simpleMessage("ローカルデータを保持"),
    "language": MessageLookupByLibrary.simpleMessage("言語"),
    "level": m10,
    "line": MessageLookupByLibrary.simpleMessage("直線"),
    "lineWidth": MessageLookupByLibrary.simpleMessage("線の太さ"),
    "livePhotos": MessageLookupByLibrary.simpleMessage("ライブフォト"),
    "livePhotosDescription": MessageLookupByLibrary.simpleMessage(
      "ライブフォトは短い動画を再生できる動く写真です。これらをクリーンアップしてストレージを解放します。",
    ),
    "login": MessageLookupByLibrary.simpleMessage("ログイン"),
    "loginFailureMessage": MessageLookupByLibrary.simpleMessage(
      "ログインに失敗しました。もう一度お試しください。",
    ),
    "loginSuccessfully": MessageLookupByLibrary.simpleMessage("ログインに成功しました！"),
    "loginToSync": MessageLookupByLibrary.simpleMessage("ログインしてデバイス間で進捗を同期"),
    "logout": MessageLookupByLibrary.simpleMessage("ログアウト"),
    "longPressToSelectAll": MessageLookupByLibrary.simpleMessage("長押しで全選択"),
    "luminance": MessageLookupByLibrary.simpleMessage("輝度"),
    "manageSubscriptions": MessageLookupByLibrary.simpleMessage("サブスクリプションの管理"),
    "mediaTimeline": MessageLookupByLibrary.simpleMessage("メディアタイムライン"),
    "mediaTimelineDescription": MessageLookupByLibrary.simpleMessage(
      "時間別にメディアを表示します。",
    ),
    "media_audio": MessageLookupByLibrary.simpleMessage("オーディオ"),
    "media_other": MessageLookupByLibrary.simpleMessage("すべて"),
    "media_photo": MessageLookupByLibrary.simpleMessage("写真"),
    "media_type_selection": MessageLookupByLibrary.simpleMessage("メディアタイプの選択"),
    "media_video": MessageLookupByLibrary.simpleMessage("動画"),
    "memoryWarning": MessageLookupByLibrary.simpleMessage("ストレージがほぼいっぱいです！"),
    "mergeData": MessageLookupByLibrary.simpleMessage("データを統合"),
    "mon": MessageLookupByLibrary.simpleMessage("月"),
    "more": MessageLookupByLibrary.simpleMessage("もっと見る"),
    "moveAndZoom": MessageLookupByLibrary.simpleMessage("ズーム"),
    "nameLength": MessageLookupByLibrary.simpleMessage("名前は2文字以上である必要があります"),
    "nameRequired": MessageLookupByLibrary.simpleMessage("名前が必要です"),
    "newPassword": MessageLookupByLibrary.simpleMessage("新しいパスワード"),
    "next": MessageLookupByLibrary.simpleMessage("次へ"),
    "noAccountRegister": MessageLookupByLibrary.simpleMessage(
      "アカウントがありませんか？ 登録",
    ),
    "noActivity": MessageLookupByLibrary.simpleMessage("クリーンアップ活動はまだありません"),
    "noBadgesEarnedYet": MessageLookupByLibrary.simpleMessage("バッジはまだ獲得していません"),
    "noDocumentsFound": MessageLookupByLibrary.simpleMessage(
      "テキストを含む画像は見つかりませんでした。",
    ),
    "noEmailProvided": MessageLookupByLibrary.simpleMessage(
      "メールアドレスが提供されていません",
    ),
    "noFacesDetected": MessageLookupByLibrary.simpleMessage(
      "この写真からは顔が検出されませんでした。",
    ),
    "noFilter": MessageLookupByLibrary.simpleMessage("フィルターなし"),
    "noPhotosWithGPSFound": MessageLookupByLibrary.simpleMessage(
      "位置情報を含む画像は見つかりませんでした。",
    ),
    "notEarned": MessageLookupByLibrary.simpleMessage("条件未達成"),
    "notLoggedIn": MessageLookupByLibrary.simpleMessage("未ログイン（ゲスト）"),
    "nothingFound": MessageLookupByLibrary.simpleMessage("何も見つかりませんでした"),
    "notifScanCompleteBlurry": m11,
    "notifScanCompleteDocuments": m12,
    "notifScanCompleteDuplicates": m13,
    "notifScanCompleteGPS": m14,
    "notifScanCompleteNone": MessageLookupByLibrary.simpleMessage(
      "問題は見つかりませんでした。ギャラリーはきれいです！",
    ),
    "notifScanCompleteTitle": MessageLookupByLibrary.simpleMessage("スキャン完了！"),
    "notifScanningBody": m15,
    "notifScanningTitle": MessageLookupByLibrary.simpleMessage("写真をスキャン中..."),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "oldPassword": MessageLookupByLibrary.simpleMessage("古いパスワード"),
    "onboardingDemoSwipeLeft": MessageLookupByLibrary.simpleMessage(
      "左にスワイプして削除",
    ),
    "onboardingDemoSwipeRight": MessageLookupByLibrary.simpleMessage(
      "右にスワイプして保持",
    ),
    "onboardingStartScan": MessageLookupByLibrary.simpleMessage("スキャンを開始"),
    "onboardingWelcomeTitle": MessageLookupByLibrary.simpleMessage(
      "Twinfixへようこそ",
    ),
    "opacity": MessageLookupByLibrary.simpleMessage("不透明度"),
    "openGalleryManager": MessageLookupByLibrary.simpleMessage(
      "ギャラリーマネージャーを開く",
    ),
    "openGalleryManagerDescription": MessageLookupByLibrary.simpleMessage(
      "メディアタイプ別に手動でクリーンアップしたい場合は、ここをタップしてください。",
    ),
    "openingEmailApp": MessageLookupByLibrary.simpleMessage(
      "フィードバックを送信するためにメールアプリを開いています...",
    ),
    "or": MessageLookupByLibrary.simpleMessage("または"),
    "packageLifetimeDescription": MessageLookupByLibrary.simpleMessage(
      "1回限りの購入、永久に利用可能。",
    ),
    "packageLifetimeTitle": MessageLookupByLibrary.simpleMessage("無期限"),
    "packageMonthlyDescription": MessageLookupByLibrary.simpleMessage(
      "月額サブスクリプション。いつでもキャンセル可能。",
    ),
    "packageMonthlyTitle": MessageLookupByLibrary.simpleMessage("1ヶ月"),
    "paint": MessageLookupByLibrary.simpleMessage("ペイント"),
    "password": MessageLookupByLibrary.simpleMessage("パスワード"),
    "passwordLength": MessageLookupByLibrary.simpleMessage(
      "パスワードは8文字以上で、大文字、小文字、数字、特殊文字を含む必要があります",
    ),
    "passwordRequired": MessageLookupByLibrary.simpleMessage("パスワードが必要です"),
    "passwordTooShort": MessageLookupByLibrary.simpleMessage("パスワードが短すぎます"),
    "passwordsDoNotMatch": MessageLookupByLibrary.simpleMessage("パスワードが一致しません"),
    "paywallSubtitle": MessageLookupByLibrary.simpleMessage(
      "すべてのプロ機能を無制限にお楽しみください。",
    ),
    "paywallWelcomeSubtitle": MessageLookupByLibrary.simpleMessage(
      "AIツールと広告なしの体験でギャラリーの可能性を最大限に引き出します。",
    ),
    "paywallWelcomeTitle": MessageLookupByLibrary.simpleMessage("プレミアムへようこそ"),
    "perfect": MessageLookupByLibrary.simpleMessage("完璧！"),
    "permissionDescription": MessageLookupByLibrary.simpleMessage(
      "Twinfixは、重複写真をスキャンしてクリーンアップするために写真ライブラリへのアクセスが必要です。",
    ),
    "permissionRequired": MessageLookupByLibrary.simpleMessage("許可が必要です"),
    "personalCustomizeableTheme": MessageLookupByLibrary.simpleMessage(
      "インターフェースをカスタマイズ",
    ),
    "personalProcessSync": MessageLookupByLibrary.simpleMessage("進捗の同期"),
    "pixelate": MessageLookupByLibrary.simpleMessage("モザイク"),
    "pleaseEnterWatermarkText": MessageLookupByLibrary.simpleMessage(
      "透かしテキストを入力してください",
    ),
    "pleaseFillAllFields": MessageLookupByLibrary.simpleMessage(
      "すべてのフィールドに入力してください",
    ),
    "pleaseWaitWhileWeAreRedirectingYou": MessageLookupByLibrary.simpleMessage(
      "リダイレクトしています。しばらくお待ちください...",
    ),
    "polygon": MessageLookupByLibrary.simpleMessage("多角形"),
    "popular": MessageLookupByLibrary.simpleMessage("最も人気"),
    "premium": MessageLookupByLibrary.simpleMessage("プレミアム"),
    "premiumFeatureAiTools": MessageLookupByLibrary.simpleMessage(
      "すべてのAIツールのロックを解除",
    ),
    "premiumFeatureNoAds": MessageLookupByLibrary.simpleMessage("広告なし"),
    "premiumPlan": MessageLookupByLibrary.simpleMessage("プレミアムプラン"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("プライバシーポリシー"),
    "profile": MessageLookupByLibrary.simpleMessage("プロフィール"),
    "profileSettings": MessageLookupByLibrary.simpleMessage("プロフィール設定"),
    "progress": MessageLookupByLibrary.simpleMessage("進捗"),
    "purchaseErrorStoreConnection": MessageLookupByLibrary.simpleMessage(
      "ストアに接続できませんでした。",
    ),
    "purchaseFailureMessage": MessageLookupByLibrary.simpleMessage(
      "購入に失敗したか、キャンセルされました。",
    ),
    "purchaseSuccess": MessageLookupByLibrary.simpleMessage(
      "プレミアムのアップグレードに成功しました！",
    ),
    "ratio": MessageLookupByLibrary.simpleMessage("比率"),
    "rectangle": MessageLookupByLibrary.simpleMessage("長方形"),
    "redo": MessageLookupByLibrary.simpleMessage("やり直し"),
    "register": MessageLookupByLibrary.simpleMessage("登録"),
    "registerSuccess": MessageLookupByLibrary.simpleMessage("登録に成功しました"),
    "registerSuccessMessage": MessageLookupByLibrary.simpleMessage(
      "ログインする前にメールを確認してアカウントを認証してください。",
    ),
    "removeGPS": MessageLookupByLibrary.simpleMessage("GPSを削除"),
    "removeGPSDescription": MessageLookupByLibrary.simpleMessage(
      "写真からGPS情報を削除します。",
    ),
    "replaceOriginal": MessageLookupByLibrary.simpleMessage("元の画像を置換"),
    "reset": MessageLookupByLibrary.simpleMessage("リセット"),
    "resetLinkSent": MessageLookupByLibrary.simpleMessage(
      "リセットリンクがメールに送信されました！",
    ),
    "restoreFailureMessage": MessageLookupByLibrary.simpleMessage(
      "購入を復元できなかったか、サブスクリプションがありません。",
    ),
    "restoreFromCloud": MessageLookupByLibrary.simpleMessage("クラウドから復元"),
    "restorePurchases": MessageLookupByLibrary.simpleMessage("購入の復元"),
    "rotate": MessageLookupByLibrary.simpleMessage("回転"),
    "sat": MessageLookupByLibrary.simpleMessage("土"),
    "saturation": MessageLookupByLibrary.simpleMessage("彩度"),
    "save": MessageLookupByLibrary.simpleMessage("保存"),
    "saving": MessageLookupByLibrary.simpleMessage("保存中..."),
    "scanLimit": MessageLookupByLibrary.simpleMessage("スキャン制限"),
    "scanLimitAll": MessageLookupByLibrary.simpleMessage("すべて"),
    "scanLimitWarning": MessageLookupByLibrary.simpleMessage(
      "すべての写真をスキャンすると、時間がかかり、バッテリーを消費する可能性があります。",
    ),
    "scanResults": MessageLookupByLibrary.simpleMessage("スキャン結果"),
    "scanningDevice": MessageLookupByLibrary.simpleMessage("デバイスをスキャン中..."),
    "scanningDocument": MessageLookupByLibrary.simpleMessage("ドキュメントをスキャン中..."),
    "screenshots": MessageLookupByLibrary.simpleMessage("スクリーンショット"),
    "screenshotsDescription": MessageLookupByLibrary.simpleMessage(
      "スクリーンショットは静止画です。これらをクリーンアップしてストレージを解放します。",
    ),
    "search": MessageLookupByLibrary.simpleMessage("検索"),
    "selectAll": MessageLookupByLibrary.simpleMessage("すべて選択"),
    "selectEmoji": MessageLookupByLibrary.simpleMessage("絵文字を選択"),
    "selectTemplate": MessageLookupByLibrary.simpleMessage("テンプレートの選択"),
    "sendFeedbackSubtitle": MessageLookupByLibrary.simpleMessage(
      "ご意見をお待ちしております！",
    ),
    "sendFeedbackTitle": MessageLookupByLibrary.simpleMessage(
      "フィードバックをお送りください",
    ),
    "sendResetLink": MessageLookupByLibrary.simpleMessage("リセットリンクを送信"),
    "settings": MessageLookupByLibrary.simpleMessage("設定"),
    "sevenDays": MessageLookupByLibrary.simpleMessage("7日間"),
    "sevenWeeks": MessageLookupByLibrary.simpleMessage("7週間"),
    "sharpness": MessageLookupByLibrary.simpleMessage("シャープネス"),
    "signInWithGoogle": MessageLookupByLibrary.simpleMessage("Googleでサインイン"),
    "size": MessageLookupByLibrary.simpleMessage("サイズ"),
    "sizeAsc": MessageLookupByLibrary.simpleMessage("サイズ昇順"),
    "sizeDesc": MessageLookupByLibrary.simpleMessage("サイズ降順"),
    "skip": MessageLookupByLibrary.simpleMessage("スキップ"),
    "smallScreenMoreTooltip": MessageLookupByLibrary.simpleMessage("もっと見る"),
    "solid": MessageLookupByLibrary.simpleMessage("ソリッド"),
    "sort": MessageLookupByLibrary.simpleMessage("並び替え"),
    "startQuickScan": MessageLookupByLibrary.simpleMessage("クイックスキャンを開始"),
    "startQuickScanDescription": MessageLookupByLibrary.simpleMessage(
      "このボタンを使用してライブラリをスキャンし、一括で重複を検出します。",
    ),
    "stats": MessageLookupByLibrary.simpleMessage("統計"),
    "storageAlmostFull": m16,
    "storageUsedPercent": m17,
    "streak": MessageLookupByLibrary.simpleMessage("連続"),
    "streakDays": m18,
    "streaks": MessageLookupByLibrary.simpleMessage("連続記録"),
    "strokeWidth": MessageLookupByLibrary.simpleMessage("線の幅"),
    "submitFeedback": MessageLookupByLibrary.simpleMessage("フィードバックを送信"),
    "success": MessageLookupByLibrary.simpleMessage("成功"),
    "sun": MessageLookupByLibrary.simpleMessage("日"),
    "syncDataMessage": MessageLookupByLibrary.simpleMessage(
      "ゲストセッションのローカルデータが見つかりました。新しいアカウントに統合しますか？",
    ),
    "syncDataTitle": MessageLookupByLibrary.simpleMessage("ゲストデータをリンクしますか？"),
    "syncExplainKeepLocalDesc": MessageLookupByLibrary.simpleMessage(
      "このデバイス上の現在のゲストデータを保持し、既存のクラウドデータを上書きします。",
    ),
    "syncExplainMergeDesc": MessageLookupByLibrary.simpleMessage(
      "ローカルのゲスト統計と実績を既存のアカウントデータと統合します。進捗を失うことはありません。",
    ),
    "syncExplainRestoreDesc": MessageLookupByLibrary.simpleMessage(
      "現在のゲストセッションデータを破棄し、以前のアカウントデータをクラウドから復元します。",
    ),
    "syncExplainTitle": MessageLookupByLibrary.simpleMessage("同期オプションとは？"),
    "tabDashboard": MessageLookupByLibrary.simpleMessage("実績"),
    "tabOtherFeatures": MessageLookupByLibrary.simpleMessage("その他の機能"),
    "tabScan": MessageLookupByLibrary.simpleMessage("スキャン"),
    "tabSettings": MessageLookupByLibrary.simpleMessage("設定"),
    "tapToChangeStyle": MessageLookupByLibrary.simpleMessage("タップしてスタイルを変更"),
    "temperature": MessageLookupByLibrary.simpleMessage("色温度"),
    "termsOfService": MessageLookupByLibrary.simpleMessage("利用規約"),
    "text": MessageLookupByLibrary.simpleMessage("テキスト"),
    "textAlign": MessageLookupByLibrary.simpleMessage("文字揃え"),
    "theme": MessageLookupByLibrary.simpleMessage("テーマ"),
    "themeDark": MessageLookupByLibrary.simpleMessage("ダーク"),
    "themeLight": MessageLookupByLibrary.simpleMessage("ライト"),
    "themeSystem": MessageLookupByLibrary.simpleMessage("システム"),
    "thu": MessageLookupByLibrary.simpleMessage("木"),
    "timelineDay": MessageLookupByLibrary.simpleMessage("日"),
    "timelineMonth": MessageLookupByLibrary.simpleMessage("月"),
    "timelineYear": MessageLookupByLibrary.simpleMessage("年"),
    "toggleFill": MessageLookupByLibrary.simpleMessage("塗りつぶし切り替え"),
    "tooManyRequests": MessageLookupByLibrary.simpleMessage(
      "リクエストが多すぎます。後でもう一度お試しください。",
    ),
    "totalPhotos": m19,
    "totalPhotosLast7Days": m20,
    "totalPhotosLast7Weeks": m21,
    "tue": MessageLookupByLibrary.simpleMessage("火"),
    "tune": MessageLookupByLibrary.simpleMessage("調整"),
    "understood": MessageLookupByLibrary.simpleMessage("了解"),
    "undo": MessageLookupByLibrary.simpleMessage("元に戻す"),
    "unknown": MessageLookupByLibrary.simpleMessage("不明"),
    "unknownError": MessageLookupByLibrary.simpleMessage("不明なエラーが発生しました。"),
    "unknownUser": MessageLookupByLibrary.simpleMessage("不明なユーザー"),
    "upgradeToPremium": MessageLookupByLibrary.simpleMessage("プレミアムにアップグレード"),
    "userBanned": MessageLookupByLibrary.simpleMessage("ユーザーは利用停止されています。"),
    "userNotFound": MessageLookupByLibrary.simpleMessage("ユーザーが見つかりません。"),
    "verificationSuccess": MessageLookupByLibrary.simpleMessage("認証に成功しました！"),
    "vietnamese": MessageLookupByLibrary.simpleMessage("ベトナム語"),
    "viewAllBadges": MessageLookupByLibrary.simpleMessage("すべてのバッジを表示"),
    "viewDetail": MessageLookupByLibrary.simpleMessage("詳細を見る"),
    "viewFullHistory": MessageLookupByLibrary.simpleMessage("履歴全体を見る"),
    "watermarkText": MessageLookupByLibrary.simpleMessage("透かしテキスト"),
    "weakPassword": MessageLookupByLibrary.simpleMessage("パスワードが弱すぎます。"),
    "wed": MessageLookupByLibrary.simpleMessage("水"),
    "weekShort": MessageLookupByLibrary.simpleMessage("週"),
    "welcomeBack": MessageLookupByLibrary.simpleMessage("おかえりなさい"),
  };
}
