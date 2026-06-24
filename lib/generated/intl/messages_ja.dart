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

  static String m0(color) => "${color} をクリップボードにコピーしました";

  static String m1(author) => "Flaticonの${author}によるデザイン";

  static String m2(author) => "Magnific.comの${author}によるデザイン";

  static String m3(message) => "エラー: ${message}";

  static String m4(level) => "レベル ${level}";

  static String m5(version) => "バージョン ${version}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("約"),
    "aboutSylvaDescription": MessageLookupByLibrary.simpleMessage(
      "Sylvaは、世界の色彩を簡単にキャプチャして発見できるように設計されたカメラアプリケーションです。",
    ),
    "acknowledgements": MessageLookupByLibrary.simpleMessage("謝辞"),
    "acknowledgementsIntro": MessageLookupByLibrary.simpleMessage(
      "このアプリケーションで使用されているアセットの作成者に感謝いたします：",
    ),
    "appName": MessageLookupByLibrary.simpleMessage("Sylva"),
    "arrow": MessageLookupByLibrary.simpleMessage("矢印"),
    "autoDetectColors": MessageLookupByLibrary.simpleMessage("色を自動検出"),
    "awesome": MessageLookupByLibrary.simpleMessage("素晴らしい！"),
    "back": MessageLookupByLibrary.simpleMessage("戻る"),
    "blur": MessageLookupByLibrary.simpleMessage("ぼかし"),
    "brightness": MessageLookupByLibrary.simpleMessage("明るさ"),
    "cameraIcon": MessageLookupByLibrary.simpleMessage("カメラアイコン"),
    "cameraPermissionDenied": MessageLookupByLibrary.simpleMessage(
      "カメラへのアクセスが拒否されたか、デバイスにカメラがありません。",
    ),
    "cameraPermissionDescription": MessageLookupByLibrary.simpleMessage(
      "Sylvaは写真を撮り、色を抽出するためにカメラへのアクセスが必要です。",
    ),
    "cameraPermissionRequired": MessageLookupByLibrary.simpleMessage(
      "カメラの権限が必要です",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("キャンセル"),
    "circle": MessageLookupByLibrary.simpleMessage("円"),
    "clearAllHistory": MessageLookupByLibrary.simpleMessage("すべての履歴を消去"),
    "clearAllHistoryConfirm": MessageLookupByLibrary.simpleMessage(
      "すべての履歴を消去してもよろしいですか？この操作は元に戻せません。",
    ),
    "color": MessageLookupByLibrary.simpleMessage("色"),
    "colorCopiedFailure": MessageLookupByLibrary.simpleMessage("色のコピーに失敗しました"),
    "colorCopiedSuccess": m0,
    "colorsIcon": MessageLookupByLibrary.simpleMessage("カラーアイコン"),
    "confirmPassword": MessageLookupByLibrary.simpleMessage("パスワードの確認"),
    "confirmPasswordRequired": MessageLookupByLibrary.simpleMessage(
      "パスワードの確認が必要です",
    ),
    "contact": MessageLookupByLibrary.simpleMessage("連絡先"),
    "contactErrorMessage": MessageLookupByLibrary.simpleMessage(
      "すべてのフィールドに入力してください",
    ),
    "contactFormAttachDeviceInfo": MessageLookupByLibrary.simpleMessage(
      "デバイス情報を添付する",
    ),
    "contactFormDescription": MessageLookupByLibrary.simpleMessage("説明"),
    "contactFormDescriptionError": MessageLookupByLibrary.simpleMessage(
      "説明を入力してください",
    ),
    "contactFormDescriptionHint": MessageLookupByLibrary.simpleMessage(
      "説明を入力...",
    ),
    "contactFormDeviceInfoError": MessageLookupByLibrary.simpleMessage(
      "デバイス情報を入力してください",
    ),
    "contactFormDeviceInfoHint": MessageLookupByLibrary.simpleMessage(
      "デバイス情報（モデル、OS）が添付されます。",
    ),
    "contactFormDeviceInfoNotice": MessageLookupByLibrary.simpleMessage(
      "サポート向上のため、基本的なデバイス情報（モデル、OS）が添付されます。",
    ),
    "contactFormTitle": MessageLookupByLibrary.simpleMessage("タイトル"),
    "contactFormTitleError": MessageLookupByLibrary.simpleMessage(
      "タイトルを入力してください",
    ),
    "contactFormTitleHint": MessageLookupByLibrary.simpleMessage("タイトルを入力"),
    "contactFormTypeBug": MessageLookupByLibrary.simpleMessage("バグ"),
    "contactFormTypeOther": MessageLookupByLibrary.simpleMessage("その他"),
    "contactFormTypeSuggestion": MessageLookupByLibrary.simpleMessage("提案"),
    "contactSuccessMessage": MessageLookupByLibrary.simpleMessage(
      "フィードバックありがとうございます！",
    ),
    "contactType": MessageLookupByLibrary.simpleMessage("種類"),
    "createNewImage": MessageLookupByLibrary.simpleMessage("新しい画像を作成"),
    "createTime": MessageLookupByLibrary.simpleMessage("時間"),
    "days": MessageLookupByLibrary.simpleMessage("日"),
    "delete": MessageLookupByLibrary.simpleMessage("削除"),
    "deletePhoto": MessageLookupByLibrary.simpleMessage("写真の削除"),
    "delete_confirm_message": MessageLookupByLibrary.simpleMessage(
      "最後にもう一度確認してください！\nこの操作は元に戻せません。",
    ),
    "designedByAuthorFromFlaticon": m1,
    "designedByAuthorMagnific": m2,
    "deviceInfo": MessageLookupByLibrary.simpleMessage("デバイス情報"),
    "donation": MessageLookupByLibrary.simpleMessage("寄付"),
    "duplicates": MessageLookupByLibrary.simpleMessage("重複"),
    "email": MessageLookupByLibrary.simpleMessage("メール"),
    "emailInvalid": MessageLookupByLibrary.simpleMessage("無効なメール形式です"),
    "emailNotConfirmed": MessageLookupByLibrary.simpleMessage(
      "メールアドレスが確認されていません。",
    ),
    "emailRequired": MessageLookupByLibrary.simpleMessage("メールアドレスが必要です"),
    "error": m3,
    "errorPrefix": MessageLookupByLibrary.simpleMessage("エラー"),
    "failedToLoadColors": MessageLookupByLibrary.simpleMessage("色の読み込みに失敗しました"),
    "file": MessageLookupByLibrary.simpleMessage("ファイル"),
    "files": MessageLookupByLibrary.simpleMessage("ファイル"),
    "fill": MessageLookupByLibrary.simpleMessage("塗りつぶし"),
    "filter": MessageLookupByLibrary.simpleMessage("フィルター"),
    "finish": MessageLookupByLibrary.simpleMessage("完了"),
    "flashMode": MessageLookupByLibrary.simpleMessage("フラッシュモード"),
    "fullScreen": MessageLookupByLibrary.simpleMessage("全画面"),
    "gpsRemovedSuccess": MessageLookupByLibrary.simpleMessage(
      "GPS位置データが削除され、コピーとして保存されました。",
    ),
    "help": MessageLookupByLibrary.simpleMessage("ヘルプ"),
    "history": MessageLookupByLibrary.simpleMessage("履歴"),
    "historySort": MessageLookupByLibrary.simpleMessage("並べ替え"),
    "historyView": MessageLookupByLibrary.simpleMessage("表示の変更"),
    "imageSaved": MessageLookupByLibrary.simpleMessage("画像が正常に保存されました！"),
    "informationAndSupport": MessageLookupByLibrary.simpleMessage("情報とサポート"),
    "language": MessageLookupByLibrary.simpleMessage("言語"),
    "last30Days": MessageLookupByLibrary.simpleMessage("過去30日間"),
    "last7Days": MessageLookupByLibrary.simpleMessage("過去7日間"),
    "letGo": MessageLookupByLibrary.simpleMessage("行こう"),
    "level": m4,
    "line": MessageLookupByLibrary.simpleMessage("直線"),
    "login": MessageLookupByLibrary.simpleMessage("ログイン"),
    "logout": MessageLookupByLibrary.simpleMessage("ログアウト"),
    "luminance": MessageLookupByLibrary.simpleMessage("輝度"),
    "mon": MessageLookupByLibrary.simpleMessage("月"),
    "myColors": MessageLookupByLibrary.simpleMessage("私の色"),
    "nameLength": MessageLookupByLibrary.simpleMessage("名前は2文字以上である必要があります"),
    "nameRequired": MessageLookupByLibrary.simpleMessage("名前が必要です"),
    "next": MessageLookupByLibrary.simpleMessage("次へ"),
    "noCamerasFound": MessageLookupByLibrary.simpleMessage("デバイスにカメラが見つかりません"),
    "noHistoryYet": MessageLookupByLibrary.simpleMessage("履歴はまだありません"),
    "nothingSelectedToCopy": MessageLookupByLibrary.simpleMessage(
      "コピーする色が選択されていません",
    ),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "older": MessageLookupByLibrary.simpleMessage("それ以前"),
    "onboardDesc": MessageLookupByLibrary.simpleMessage(
      "撮影した写真から鮮やかな色を抽出し、保存して管理します。",
    ),
    "onboardTitle": MessageLookupByLibrary.simpleMessage("色をキャプチャする"),
    "onlyFavorites": MessageLookupByLibrary.simpleMessage("お気に入りのみ"),
    "opacity": MessageLookupByLibrary.simpleMessage("不透明度"),
    "or": MessageLookupByLibrary.simpleMessage("または"),
    "paint": MessageLookupByLibrary.simpleMessage("ペイント"),
    "password": MessageLookupByLibrary.simpleMessage("パスワード"),
    "passwordLength": MessageLookupByLibrary.simpleMessage(
      "パスワードは8文字以上で、大文字、小文字、数字、特殊文字を含む必要があります",
    ),
    "passwordRequired": MessageLookupByLibrary.simpleMessage("パスワードが必要です"),
    "passwordsDoNotMatch": MessageLookupByLibrary.simpleMessage("パスワードが一致しません"),
    "permissionDescription": MessageLookupByLibrary.simpleMessage(
      "Sylvaは、写真を選択して色を抽出するために写真ライブラリへのアクセスが必要です。",
    ),
    "permissionRequired": MessageLookupByLibrary.simpleMessage(
      "写真ライブラリの権限が必要です",
    ),
    "pickImageFromGallery": MessageLookupByLibrary.simpleMessage(
      "ライブラリから画像を選択",
    ),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("プライバシーポリシー"),
    "privacyPolicyContent": MessageLookupByLibrary.simpleMessage(
      "私たちはあなたのプライバシーを尊重します。Sylvaは可能な限りデバイス上でカメラデータをローカルに処理します。明示的な同意なしに個人的な写真を保存または共有することはありません。",
    ),
    "privacyPolicyContent1": MessageLookupByLibrary.simpleMessage(
      "私たちは個人の写真やカメラデータをサーバーに収集または保存しません。すべてのカメラ処理はデバイス上でローカルに実行されます。",
    ),
    "privacyPolicyContent2": MessageLookupByLibrary.simpleMessage(
      "Sylvaによって処理されたデータは、アプリケーション内のカメラおよび色分析機能を提供するためにのみ使用されます。",
    ),
    "privacyPolicyContent3": MessageLookupByLibrary.simpleMessage(
      "私たちはデータを保護するために業界標準のセキュリティ対策を実施しています。写真はデバイス上に残るため、プライバシーを完全に管理できます。",
    ),
    "privacyPolicyContent4": MessageLookupByLibrary.simpleMessage(
      "匿名のクラッシュレポートを収集するためにFirebase Crashlyticsを使用しています。これにより、バグを特定し、アプリケーションの安定性を向上させることができます。収集されるデータに個人を特定できる情報は含まれていません。",
    ),
    "privacyPolicyTitle1": MessageLookupByLibrary.simpleMessage("情報の収集"),
    "privacyPolicyTitle2": MessageLookupByLibrary.simpleMessage("情報の利用"),
    "privacyPolicyTitle3": MessageLookupByLibrary.simpleMessage("データセキュリティ"),
    "privacyPolicyTitle4": MessageLookupByLibrary.simpleMessage("クラッシュレポート"),
    "progress": MessageLookupByLibrary.simpleMessage("進捗"),
    "purchaseFailureMessage": MessageLookupByLibrary.simpleMessage(
      "購入に失敗したか、キャンセルされました。",
    ),
    "rainbowHalftoneDotsBackground": MessageLookupByLibrary.simpleMessage(
      "虹色のハーフトーンドット背景",
    ),
    "ratio": MessageLookupByLibrary.simpleMessage("比率"),
    "rectangle": MessageLookupByLibrary.simpleMessage("長方形"),
    "register": MessageLookupByLibrary.simpleMessage("登録"),
    "replaceExistingRecord": MessageLookupByLibrary.simpleMessage(
      "既存の記録を置き換える",
    ),
    "replaceOriginal": MessageLookupByLibrary.simpleMessage("元の画像を置換"),
    "reset": MessageLookupByLibrary.simpleMessage("リセット"),
    "restoreFailureMessage": MessageLookupByLibrary.simpleMessage(
      "購入を復元できなかったか、サブスクリプションがありません。",
    ),
    "restorePurchases": MessageLookupByLibrary.simpleMessage("購入の復元"),
    "retry": MessageLookupByLibrary.simpleMessage("再試行"),
    "roadBlockIcon": MessageLookupByLibrary.simpleMessage("ロードブロックアイコン"),
    "save": MessageLookupByLibrary.simpleMessage("保存"),
    "saveAsNew": MessageLookupByLibrary.simpleMessage("新しく保存"),
    "saveColor": MessageLookupByLibrary.simpleMessage("色を保存"),
    "saveToLibrary": MessageLookupByLibrary.simpleMessage("ライブラリに保存"),
    "scanLimit": MessageLookupByLibrary.simpleMessage("スキャン制限"),
    "settings": MessageLookupByLibrary.simpleMessage("設定"),
    "size": MessageLookupByLibrary.simpleMessage("サイズ"),
    "submit": MessageLookupByLibrary.simpleMessage("送信"),
    "success": MessageLookupByLibrary.simpleMessage("成功"),
    "switchCamera": MessageLookupByLibrary.simpleMessage("カメラ切り替え"),
    "termsOfService": MessageLookupByLibrary.simpleMessage("利用規約"),
    "termsOfServiceContent": MessageLookupByLibrary.simpleMessage(
      "Sylvaを使用することにより、利用規約に同意したことになります。違法または無許可の目的でアプリケーションを使用してはなりません。サービスとコンテンツは「現状有姿」で提供され、いかなる種類の保証もありません。",
    ),
    "text": MessageLookupByLibrary.simpleMessage("テキスト"),
    "textAlign": MessageLookupByLibrary.simpleMessage("文字揃え"),
    "thanksAndReference": MessageLookupByLibrary.simpleMessage("感謝と参考文献"),
    "theme": MessageLookupByLibrary.simpleMessage("テーマ"),
    "themeDark": MessageLookupByLibrary.simpleMessage("ダーク"),
    "themeLight": MessageLookupByLibrary.simpleMessage("ライト"),
    "themeSystem": MessageLookupByLibrary.simpleMessage("システム"),
    "thu": MessageLookupByLibrary.simpleMessage("木"),
    "timer": MessageLookupByLibrary.simpleMessage("タイマー"),
    "today": MessageLookupByLibrary.simpleMessage("今日"),
    "tosContent1": MessageLookupByLibrary.simpleMessage(
      "Sylvaをダウンロードして使用することにより、これらの利用規約に同意したことになります。同意しない場合は、アプリケーションを使用しないでください。",
    ),
    "tosContent2": MessageLookupByLibrary.simpleMessage(
      "Sylvaを使用してキャプチャまたは処理したコンテンツについては、ユーザーが責任を負います。アプリケーションを違法または禁止された活動に使用しないことに同意するものとします。",
    ),
    "tosContent3": MessageLookupByLibrary.simpleMessage(
      "Sylvaおよびその作成者は、アプリケーションの使用から生じるいかなる損害または損失についても責任を負いません。サービスは「現状有姿」で提供されます。",
    ),
    "tosContent4": MessageLookupByLibrary.simpleMessage(
      "Sylvaは、アプリケーションの安定性を監視し、クラッシュレポートを収集するためにFirebase Crashlyticsなどのサードパーティサービスを利用しています。本アプリを使用することにより、これらのサービスによる匿名のクラッシュおよびパフォーマンスデータの収集に同意するものとします。",
    ),
    "tosTitle1": MessageLookupByLibrary.simpleMessage("利用規約への同意"),
    "tosTitle2": MessageLookupByLibrary.simpleMessage("ユーザーの責任"),
    "tosTitle3": MessageLookupByLibrary.simpleMessage("責任の制限"),
    "tosTitle4": MessageLookupByLibrary.simpleMessage("サードパーティサービス"),
    "tutorialBackDesc": MessageLookupByLibrary.simpleMessage(
      "変更を破棄してカメラに戻ります。",
    ),
    "tutorialBackTitle": MessageLookupByLibrary.simpleMessage("戻る"),
    "tutorialCameraDesc": MessageLookupByLibrary.simpleMessage(
      "前面カメラと背面カメラを切り替えます。",
    ),
    "tutorialCameraTitle": MessageLookupByLibrary.simpleMessage("カメラ切り替え"),
    "tutorialCaptureDesc": MessageLookupByLibrary.simpleMessage("今すぐ写真を撮ります。"),
    "tutorialCaptureTitle": MessageLookupByLibrary.simpleMessage("撮影"),
    "tutorialDeleteAllDesc": MessageLookupByLibrary.simpleMessage(
      "以前に撮影したすべての写真を削除します。",
    ),
    "tutorialDeleteAllTitle": MessageLookupByLibrary.simpleMessage("履歴を消去"),
    "tutorialExpandPaletteDesc": MessageLookupByLibrary.simpleMessage(
      "抽出・選択したすべての色を表示します。",
    ),
    "tutorialExpandPaletteTitle": MessageLookupByLibrary.simpleMessage(
      "パレットを拡大",
    ),
    "tutorialFavoritesDesc": MessageLookupByLibrary.simpleMessage(
      "お気に入りの写真のみを表示するようにフィルタリングします。",
    ),
    "tutorialFavoritesTitle": MessageLookupByLibrary.simpleMessage("お気に入りのみ"),
    "tutorialFlashDesc": MessageLookupByLibrary.simpleMessage(
      "フラッシュのオン/オフを切り替えます。",
    ),
    "tutorialFlashTitle": MessageLookupByLibrary.simpleMessage("フラッシュ"),
    "tutorialFullScreenDesc": MessageLookupByLibrary.simpleMessage(
      "ここをタップすると、元の写真を全画面で表示します。",
    ),
    "tutorialFullScreenTitle": MessageLookupByLibrary.simpleMessage("全画面"),
    "tutorialGalleryDesc": MessageLookupByLibrary.simpleMessage(
      "ギャラリーから写真を選択します。",
    ),
    "tutorialGalleryTitle": MessageLookupByLibrary.simpleMessage("ギャラリー"),
    "tutorialHistoryDesc": MessageLookupByLibrary.simpleMessage(
      "過去に撮影した写真を表示します。",
    ),
    "tutorialHistoryTitle": MessageLookupByLibrary.simpleMessage("履歴"),
    "tutorialHistoryViewDesc": MessageLookupByLibrary.simpleMessage(
      "リスト表示とグリッド表示を切り替えます。",
    ),
    "tutorialHistoryViewTitle": MessageLookupByLibrary.simpleMessage("表示の変更"),
    "tutorialImageDesc": MessageLookupByLibrary.simpleMessage(
      "写真の上で指を動かして拡大し、色を選択します。",
    ),
    "tutorialImageTitle": MessageLookupByLibrary.simpleMessage("写真プレビュー"),
    "tutorialLibraryDesc": MessageLookupByLibrary.simpleMessage(
      "この写真をデバイスのギャラリーにエクスポートします。",
    ),
    "tutorialLibraryTitle": MessageLookupByLibrary.simpleMessage("ライブラリに保存"),
    "tutorialNext": MessageLookupByLibrary.simpleMessage("次へ"),
    "tutorialPaletteDesc": MessageLookupByLibrary.simpleMessage(
      "色をタップしてフィルター、長押しで16進数コードをコピーします。",
    ),
    "tutorialPaletteTitle": MessageLookupByLibrary.simpleMessage("カラーパレット"),
    "tutorialSaveDesc": MessageLookupByLibrary.simpleMessage(
      "この写真と色をアプリの履歴に保存します。",
    ),
    "tutorialSaveTitle": MessageLookupByLibrary.simpleMessage("アプリに保存"),
    "tutorialSettingsDesc": MessageLookupByLibrary.simpleMessage(
      "アプリの設定をカスタマイズします。",
    ),
    "tutorialSettingsTitle": MessageLookupByLibrary.simpleMessage("設定"),
    "tutorialSkip": MessageLookupByLibrary.simpleMessage("スキップ"),
    "tutorialSortDesc": MessageLookupByLibrary.simpleMessage(
      "時間で履歴を昇順または降順に並べ替えます。",
    ),
    "tutorialSortTitle": MessageLookupByLibrary.simpleMessage("並べ替え"),
    "tutorialTimerDesc": MessageLookupByLibrary.simpleMessage(
      "撮影前のカウントダウンを設定します。",
    ),
    "tutorialTimerTitle": MessageLookupByLibrary.simpleMessage("タイマー"),
    "tutorialZoomDesc": MessageLookupByLibrary.simpleMessage(
      "これらのボタンを使用して、正確にズームインまたはズームアウトします。",
    ),
    "tutorialZoomTitle": MessageLookupByLibrary.simpleMessage("ズーム"),
    "useMagnifierToPickColors": MessageLookupByLibrary.simpleMessage(
      "虫眼鏡を使って色を選択",
    ),
    "userBanned": MessageLookupByLibrary.simpleMessage("ユーザーは利用停止されています。"),
    "userNotFound": MessageLookupByLibrary.simpleMessage("ユーザーが見つかりません。"),
    "version": m5,
    "weakPassword": MessageLookupByLibrary.simpleMessage("パスワードが弱すぎます。"),
    "wed": MessageLookupByLibrary.simpleMessage("水"),
    "yesterday": MessageLookupByLibrary.simpleMessage("昨日"),
  };
}
