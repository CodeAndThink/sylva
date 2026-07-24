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

  static String m1(seconds) => "再送信まであと${seconds}秒お待ちください";

  static String m2(author) => "Flaticonの${author}によるデザイン";

  static String m3(author) => "Magnific.comの${author}によるデザイン";

  static String m4(message) => "エラー: ${message}";

  static String m5(level) => "レベル ${level}";

  static String m6(version) => "バージョン ${version}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("約"),
    "aboutDescription": MessageLookupByLibrary.simpleMessage(
      "Sylva についてもっと知りたいですか？最新情報や機能紹介など、ウェブサイトでチェックしてみてください！",
    ),
    "aboutSylvaDescription": MessageLookupByLibrary.simpleMessage(
      "Sylvaは、世界の色彩を簡単にキャプチャして発見できるように設計されたカメラアプリケーションです。",
    ),
    "aboutUs": MessageLookupByLibrary.simpleMessage("私たちについて"),
    "acknowledgements": MessageLookupByLibrary.simpleMessage("謝辞"),
    "acknowledgementsIntro": MessageLookupByLibrary.simpleMessage(
      "このアプリケーションで使用されているアセットの作成者に感謝いたします：",
    ),
    "allRecords": MessageLookupByLibrary.simpleMessage("すべての記録"),
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
    "cancelBtn": MessageLookupByLibrary.simpleMessage("キャンセル"),
    "circle": MessageLookupByLibrary.simpleMessage("円"),
    "clearAllHistory": MessageLookupByLibrary.simpleMessage("すべての履歴をクリア"),
    "clearAllHistoryConfirm": MessageLookupByLibrary.simpleMessage(
      "すべての履歴を消去してもよろしいですか？この操作は元に戻せません。",
    ),
    "clearAllHistorySubtitle": MessageLookupByLibrary.simpleMessage(
      "保存されたすべての画像とデータを削除する",
    ),
    "clearColor": MessageLookupByLibrary.simpleMessage("色をクリア"),
    "clearUnfavoritedHistory": MessageLookupByLibrary.simpleMessage(
      "お気に入り以外の履歴をクリア",
    ),
    "clearUnfavoritedHistorySubtitle": MessageLookupByLibrary.simpleMessage(
      "お気に入りを維持し、空き容量を増やす",
    ),
    "color": MessageLookupByLibrary.simpleMessage("色"),
    "colorCopiedFailure": MessageLookupByLibrary.simpleMessage("色のコピーに失敗しました"),
    "colorCopiedSuccess": m0,
    "colorPickMode": MessageLookupByLibrary.simpleMessage("カラーピックモード"),
    "colorPickerSelectColor": MessageLookupByLibrary.simpleMessage("色を選択"),
    "colorPickerSelectShade": MessageLookupByLibrary.simpleMessage("色の濃淡を選択"),
    "colorPickerShades": MessageLookupByLibrary.simpleMessage("選択した色とその濃淡"),
    "colorsIcon": MessageLookupByLibrary.simpleMessage("カラーアイコン"),
    "confirmClearAll": MessageLookupByLibrary.simpleMessage("すべてクリアの確認"),
    "confirmClearAllDesc": MessageLookupByLibrary.simpleMessage(
      "すべてのデータが削除され、復元することはできません。本当によろしいですか？",
    ),
    "confirmDeleteUnfavoritedDesc": MessageLookupByLibrary.simpleMessage(
      "お気に入り以外の履歴を削除してもよろしいですか？この操作は元に戻せません。",
    ),
    "confirmDeletion": MessageLookupByLibrary.simpleMessage("削除の確認"),
    "confirmPassword": MessageLookupByLibrary.simpleMessage("パスワードの確認"),
    "confirmPasswordRequired": MessageLookupByLibrary.simpleMessage(
      "パスワードの確認が必要です",
    ),
    "contact": MessageLookupByLibrary.simpleMessage("連絡先"),
    "contactCooldownMessage": m1,
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
    "deleteBtn": MessageLookupByLibrary.simpleMessage("削除"),
    "deletePhoto": MessageLookupByLibrary.simpleMessage("写真の削除"),
    "delete_confirm_message": MessageLookupByLibrary.simpleMessage(
      "最後にもう一度確認してください！\nこの操作は元に戻せません。",
    ),
    "designedByAuthorFromFlaticon": m2,
    "designedByAuthorMagnific": m3,
    "deviceInfo": MessageLookupByLibrary.simpleMessage("デバイス情報"),
    "donation": MessageLookupByLibrary.simpleMessage("寄付"),
    "duplicates": MessageLookupByLibrary.simpleMessage("重複"),
    "email": MessageLookupByLibrary.simpleMessage("メール"),
    "emailInvalid": MessageLookupByLibrary.simpleMessage("無効なメール形式です"),
    "emailNotConfirmed": MessageLookupByLibrary.simpleMessage(
      "メールアドレスが確認されていません。",
    ),
    "emailRequired": MessageLookupByLibrary.simpleMessage("メールアドレスが必要です"),
    "error": m4,
    "errorAlreadyPurchased": MessageLookupByLibrary.simpleMessage(
      "すでにこのアイテムを所有しています。",
    ),
    "errorCameraPermission": MessageLookupByLibrary.simpleMessage(
      "アプリに権限がありません。設定からアクセス権限を付与してください。",
    ),
    "errorDatabaseFull": MessageLookupByLibrary.simpleMessage(
      "アプリのストレージがいっぱいです。これ以上データを保存できません。",
    ),
    "errorFileNotFound": MessageLookupByLibrary.simpleMessage(
      "ファイルが見つかりません。削除または移動された可能性があります。",
    ),
    "errorInvalidImage": MessageLookupByLibrary.simpleMessage(
      "無効な画像フォーマットまたはファイルが破損しています。",
    ),
    "errorNetwork": MessageLookupByLibrary.simpleMessage(
      "ネットワーク接続が失われました。インターネット接続を確認してください。",
    ),
    "errorOutOfMemory": MessageLookupByLibrary.simpleMessage(
      "処理に必要なRAMが不足しています。小さい画像でお試しください。",
    ),
    "errorPermissionDenied": MessageLookupByLibrary.simpleMessage(
      "この操作を実行するにはアクセス権限を付与してください。",
    ),
    "errorPrefix": MessageLookupByLibrary.simpleMessage("エラー"),
    "errorSomethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "予期せぬエラーが発生しました。後でもう一度お試しください。",
    ),
    "errorStorageFull": MessageLookupByLibrary.simpleMessage(
      "デバイスのストレージ容量が不足しています。空き容量を増やして再度お試しください。",
    ),
    "errorStoreUnavailable": MessageLookupByLibrary.simpleMessage(
      "アプリストアに接続できません。通信状況を確認してください。",
    ),
    "errorUserCanceled": MessageLookupByLibrary.simpleMessage("操作がキャンセルされました。"),
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
    "hapticFeedback": MessageLookupByLibrary.simpleMessage("触覚フィードバック"),
    "help": MessageLookupByLibrary.simpleMessage("ヘルプ"),
    "history": MessageLookupByLibrary.simpleMessage("履歴"),
    "historySort": MessageLookupByLibrary.simpleMessage("並べ替え"),
    "historyView": MessageLookupByLibrary.simpleMessage("表示の変更"),
    "imageSaved": MessageLookupByLibrary.simpleMessage("画像が正常に保存されました！"),
    "informationAndSupport": MessageLookupByLibrary.simpleMessage("情報とサポート"),
    "interactionEffects": MessageLookupByLibrary.simpleMessage("インタラクション効果"),
    "language": MessageLookupByLibrary.simpleMessage("言語"),
    "last30Days": MessageLookupByLibrary.simpleMessage("過去30日間"),
    "last7Days": MessageLookupByLibrary.simpleMessage("過去7日間"),
    "letGo": MessageLookupByLibrary.simpleMessage("行こう"),
    "level": m5,
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
    "noImageToShare": MessageLookupByLibrary.simpleMessage("共有する画像がありません"),
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
    "realTimeColorPicker": MessageLookupByLibrary.simpleMessage(
      "リアルタイムカラーピッカー",
    ),
    "rectangle": MessageLookupByLibrary.simpleMessage("長方形"),
    "redo": MessageLookupByLibrary.simpleMessage("やり直し"),
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
    "savedImagesStorage": MessageLookupByLibrary.simpleMessage("保存された画像のストレージ"),
    "scanLimit": MessageLookupByLibrary.simpleMessage("スキャン制限"),
    "seedColor": MessageLookupByLibrary.simpleMessage("アプリカラー"),
    "settings": MessageLookupByLibrary.simpleMessage("設定"),
    "size": MessageLookupByLibrary.simpleMessage("サイズ"),
    "soundEffects": MessageLookupByLibrary.simpleMessage("サウンド効果"),
    "storageManagement": MessageLookupByLibrary.simpleMessage("ストレージ管理"),
    "submit": MessageLookupByLibrary.simpleMessage("送信"),
    "success": MessageLookupByLibrary.simpleMessage("成功"),
    "switchCamera": MessageLookupByLibrary.simpleMessage("カメラ切り替え"),
    "termsOfService": MessageLookupByLibrary.simpleMessage("利用規約"),
    "termsOfServiceContent": MessageLookupByLibrary.simpleMessage(
      "Sylvaを使用することにより、利用規約に同意したことになります。違法または無許可の目的でアプリケーションを使用してはなりません。サービスとコンテンツは「現状有姿」で提供され、いかなる種類の保証もありません。",
    ),
    "text": MessageLookupByLibrary.simpleMessage("テキスト"),
    "textAlign": MessageLookupByLibrary.simpleMessage("文字揃え"),
    "textOptionNone": MessageLookupByLibrary.simpleMessage("なし"),
    "textPositionBottom": MessageLookupByLibrary.simpleMessage("下"),
    "textPositionInside": MessageLookupByLibrary.simpleMessage("内側"),
    "textPositionLeft": MessageLookupByLibrary.simpleMessage("左"),
    "textPositionRight": MessageLookupByLibrary.simpleMessage("右"),
    "textPositionTop": MessageLookupByLibrary.simpleMessage("上"),
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
      "写真の上で指をスライドさせて拡大し、任意の色を選択します。",
    ),
    "tutorialImageTitle": MessageLookupByLibrary.simpleMessage("写真のプレビュー"),
    "tutorialLibraryDesc": MessageLookupByLibrary.simpleMessage(
      "この写真をデバイスのギャラリーにエクスポートします。",
    ),
    "tutorialLibraryTitle": MessageLookupByLibrary.simpleMessage("ライブラリに保存"),
    "tutorialNext": MessageLookupByLibrary.simpleMessage("次へ"),
    "tutorialPaletteDesc": MessageLookupByLibrary.simpleMessage(
      "色をタップしてフィルター、長押しで16進数コードをコピーします。",
    ),
    "tutorialPaletteTitle": MessageLookupByLibrary.simpleMessage("カラーパレット"),
    "tutorialRealTimeColorPickerDesc": MessageLookupByLibrary.simpleMessage(
      "カメラからリアルタイムで色を抽出します。",
    ),
    "tutorialRealTimeColorPickerTitle": MessageLookupByLibrary.simpleMessage(
      "リアルタイムカラーピッカー",
    ),
    "tutorialSaveDesc": MessageLookupByLibrary.simpleMessage(
      "この写真と色をアプリの履歴に保存します。",
    ),
    "tutorialSaveTitle": MessageLookupByLibrary.simpleMessage("アプリに保存"),
    "tutorialSettingsDesc": MessageLookupByLibrary.simpleMessage(
      "アプリの設定をカスタマイズします。",
    ),
    "tutorialSettingsTitle": MessageLookupByLibrary.simpleMessage("設定"),
    "tutorialShareDesc": MessageLookupByLibrary.simpleMessage("色を選択して画像を共有する"),
    "tutorialShareTitle": MessageLookupByLibrary.simpleMessage("画像を作成する"),
    "tutorialSkip": MessageLookupByLibrary.simpleMessage("スキップ"),
    "tutorialSortDesc": MessageLookupByLibrary.simpleMessage(
      "時間で履歴を昇順または降順に並べ替えます。",
    ),
    "tutorialSortTitle": MessageLookupByLibrary.simpleMessage("並べ替え"),
    "tutorialTimerDesc": MessageLookupByLibrary.simpleMessage(
      "撮影前のカウントダウンを設定します。",
    ),
    "tutorialTimerTitle": MessageLookupByLibrary.simpleMessage("タイマー"),
    "tutorialToggleModeDesc": MessageLookupByLibrary.simpleMessage(
      "カラーピックモードとズームモードを切り替えます。カラーピックモードでは画像をタップして色を選択できます。ズームモードではピンチでズーム、ドラッグで移動できます。",
    ),
    "tutorialToggleModeTitle": MessageLookupByLibrary.simpleMessage("モード切替"),
    "tutorialZoomDesc": MessageLookupByLibrary.simpleMessage(
      "これらのボタンを使用して、正確にズームインまたはズームアウトします。",
    ),
    "tutorialZoomTitle": MessageLookupByLibrary.simpleMessage("ズーム"),
    "undo": MessageLookupByLibrary.simpleMessage("元に戻す"),
    "useMagnifierToPickColors": MessageLookupByLibrary.simpleMessage(
      "虫眼鏡を使って色を選択",
    ),
    "userBanned": MessageLookupByLibrary.simpleMessage("ユーザーは利用停止されています。"),
    "userNotFound": MessageLookupByLibrary.simpleMessage("ユーザーが見つかりません。"),
    "version": m6,
    "visitOurWebsite": MessageLookupByLibrary.simpleMessage("ウェブサイトを見る"),
    "weakPassword": MessageLookupByLibrary.simpleMessage("パスワードが弱すぎます。"),
    "wed": MessageLookupByLibrary.simpleMessage("水"),
    "yesterday": MessageLookupByLibrary.simpleMessage("昨日"),
    "zoomMode": MessageLookupByLibrary.simpleMessage("ズームモード"),
  };
}
