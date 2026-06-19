// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a vi locale. All the
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
  String get localeName => 'vi';

  static String m0(version) => "Phiên bản ${version}";

  static String m1(num, unit, size) =>
      "Đã dọn dẹp thành công ${num} ${unit} (${size})";

  static String m2(badgeName) => "Bạn vừa đạt được huy hiệu \"${badgeName}\"!";

  static String m3(count) => "Bạn vừa đạt được ${count} huy hiệu mới!";

  static String m4(email) =>
      "Không thể mở ứng dụng Email. Email hỗ trợ: ${email}";

  static String m5(count) => "Xóa (${count})";

  static String m6(count) => "Đã xóa ${count} ảnh";

  static String m7(count) => "Phát hiện ${count} nhóm ảnh tương đồng";

  static String m8(message) => "Lỗi: ${message}";

  static String m9(index, count) => "Nhóm ${index} (${count} ảnh)";

  static String m10(level) => "Cấp ${level}";

  static String m11(count) => "Tìm thấy ${count} ảnh mờ. Nhấn để xem.";

  static String m12(count) => "Tìm thấy ${count} tài liệu. Nhấn để xem.";

  static String m13(count) => "Tìm thấy ${count} ảnh trùng lặp. Nhấn để xem.";

  static String m14(count) =>
      "Tìm thấy ${count} ảnh có dữ liệu GPS. Nhấn để xem.";

  static String m15(current, total) => "${current}/${total} ảnh đã quét";

  static String m16(percent) =>
      "Dung lượng sắp hết (${percent}%), hãy dọn dẹp ngay!";

  static String m17(percent) => "Đã dùng ${percent}%";

  static String m18(days) => "${days} Ngày liên tiếp";

  static String m19(count) => "${count} ảnh";

  static String m20(count, mediaType) =>
      "Tổng: ${count} ${mediaType} (7 ngày qua)";

  static String m21(count, mediaType) =>
      "Tổng: ${count} ${mediaType} (7 tuần qua)";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "aboutDescription": MessageLookupByLibrary.simpleMessage(
      "Twinfix là một công cụ mạnh mẽ được thiết kế để giúp bạn sắp xếp và dọn dẹp thư viện ảnh một cách dễ dàng bằng AI.",
    ),
    "aboutUs": MessageLookupByLibrary.simpleMessage("Về chúng tôi"),
    "accountSyncActive": MessageLookupByLibrary.simpleMessage(
      "Đã kích hoạt đồng bộ tài khoản",
    ),
    "activity": MessageLookupByLibrary.simpleMessage("Hoạt động"),
    "activityDetailTitle": MessageLookupByLibrary.simpleMessage(
      "Chi tiết hoạt động",
    ),
    "addWaterMark": MessageLookupByLibrary.simpleMessage("Thêm Watermark"),
    "addWaterMarkDescription": MessageLookupByLibrary.simpleMessage(
      "Thêm watermark vào ảnh.",
    ),
    "allBadges": MessageLookupByLibrary.simpleMessage("Tất cả huy hiệu"),
    "alreadyHaveAccountLogin": MessageLookupByLibrary.simpleMessage(
      "Đã có tài khoản? Đăng nhập",
    ),
    "appDescription": MessageLookupByLibrary.simpleMessage(
      "Trình dọn dẹp ảnh trùng lặp",
    ),
    "appName": MessageLookupByLibrary.simpleMessage("Sylva"),
    "appVersion": m0,
    "appearance": MessageLookupByLibrary.simpleMessage("Diện mạo"),
    "arrow": MessageLookupByLibrary.simpleMessage("Mũi tên"),
    "awesome": MessageLookupByLibrary.simpleMessage("Tuyệt vời!"),
    "back": MessageLookupByLibrary.simpleMessage("Quay lại"),
    "backgroundMode": MessageLookupByLibrary.simpleMessage("Chế độ nền"),
    "backgroundStyle": MessageLookupByLibrary.simpleMessage("Hình nền"),
    "badgeAiCleanerDesc": MessageLookupByLibrary.simpleMessage(
      "Sử dụng tính năng dọn dẹp tự động.",
    ),
    "badgeAiCleanerName": MessageLookupByLibrary.simpleMessage("Trợ thủ AI"),
    "badgeBlurry10Desc": MessageLookupByLibrary.simpleMessage("Xóa 10 ảnh mờ."),
    "badgeBlurry10Name": MessageLookupByLibrary.simpleMessage("Thợ săn ảnh mờ"),
    "badgeBlurry200Desc": MessageLookupByLibrary.simpleMessage(
      "Xóa 200 ảnh mờ.",
    ),
    "badgeBlurry200Name": MessageLookupByLibrary.simpleMessage(
      "Kẻ hủy diệt ảnh mờ",
    ),
    "badgeBlurryKillerDesc": MessageLookupByLibrary.simpleMessage(
      "Xóa 50 ảnh mờ.",
    ),
    "badgeBlurryKillerName": MessageLookupByLibrary.simpleMessage(
      "Sát thủ ảnh mờ",
    ),
    "badgeCleaner1000Desc": MessageLookupByLibrary.simpleMessage(
      "Xóa tổng cộng 1000 ảnh.",
    ),
    "badgeCleaner1000Name": MessageLookupByLibrary.simpleMessage(
      "Máy nghiền ảnh",
    ),
    "badgeCleaner100Desc": MessageLookupByLibrary.simpleMessage(
      "Xóa tổng cộng 100 ảnh.",
    ),
    "badgeCleaner100Name": MessageLookupByLibrary.simpleMessage(
      "Chuyên gia dọn dẹp",
    ),
    "badgeCleaner10Desc": MessageLookupByLibrary.simpleMessage(
      "Xóa tổng cộng 10 ảnh.",
    ),
    "badgeCleaner10Name": MessageLookupByLibrary.simpleMessage(
      "Tập sự dọn dẹp",
    ),
    "badgeDuplicate100Desc": MessageLookupByLibrary.simpleMessage(
      "Xóa 100 ảnh trùng lặp.",
    ),
    "badgeDuplicate100Name": MessageLookupByLibrary.simpleMessage(
      "Bậc thầy ảnh trùng",
    ),
    "badgeDuplicate20Desc": MessageLookupByLibrary.simpleMessage(
      "Xóa 20 ảnh trùng lặp.",
    ),
    "badgeDuplicate20Name": MessageLookupByLibrary.simpleMessage(
      "Thợ săn ảnh trùng",
    ),
    "badgeFirstCleanDesc": MessageLookupByLibrary.simpleMessage(
      "Xóa những bức ảnh đầu tiên.",
    ),
    "badgeFirstCleanName": MessageLookupByLibrary.simpleMessage(
      "Phát dọn lần đầu",
    ),
    "badgeFreed100mbDesc": MessageLookupByLibrary.simpleMessage(
      "Xóa tổng cộng 200 ảnh.",
    ),
    "badgeFreed100mbName": MessageLookupByLibrary.simpleMessage(
      "Tập sự dọn dẹp (Cấp 2)",
    ),
    "badgeFreed10gbDesc": MessageLookupByLibrary.simpleMessage(
      "Xóa tổng cộng 5000 ảnh.",
    ),
    "badgeFreed10gbName": MessageLookupByLibrary.simpleMessage(
      "Huyền thoại dọn dẹp",
    ),
    "badgeFreed5gbDesc": MessageLookupByLibrary.simpleMessage(
      "Xóa tổng cộng 2000 ảnh.",
    ),
    "badgeFreed5gbName": MessageLookupByLibrary.simpleMessage(
      "Anh hùng dọn dẹp",
    ),
    "badgeGigaKingDesc": MessageLookupByLibrary.simpleMessage(
      "Xóa tổng cộng 500 ảnh.",
    ),
    "badgeGigaKingName": MessageLookupByLibrary.simpleMessage(
      "Bậc thầy dọn dẹp",
    ),
    "badgeNewbieDesc": MessageLookupByLibrary.simpleMessage(
      "Xóa ảnh lần đầu tiên và bắt đầu cuộc hành trình giải cứu bộ nhớ.",
    ),
    "badgeNewbieName": MessageLookupByLibrary.simpleMessage(
      "Người mới dọn dẹp",
    ),
    "badgePerfectionistDesc": MessageLookupByLibrary.simpleMessage(
      "Xóa hơn 80% ảnh mờ trong thiết bị.",
    ),
    "badgePerfectionistName": MessageLookupByLibrary.simpleMessage(
      "Người cầu toàn",
    ),
    "badgeSpeedCleanDesc": MessageLookupByLibrary.simpleMessage(
      "Xóa 50 ảnh trong một lần.",
    ),
    "badgeSpeedCleanName": MessageLookupByLibrary.simpleMessage(
      "Dọn dẹp thần tốc",
    ),
    "badgeStreak3Desc": MessageLookupByLibrary.simpleMessage(
      "Dọn dẹp 3 ngày liên tiếp.",
    ),
    "badgeStreak3Name": MessageLookupByLibrary.simpleMessage("Chăm chỉ"),
    "badgeStreak7Desc": MessageLookupByLibrary.simpleMessage(
      "Dọn dẹp 7 ngày liên tiếp.",
    ),
    "badgeStreak7Name": MessageLookupByLibrary.simpleMessage("Không bỏ cuộc"),
    "badges": MessageLookupByLibrary.simpleMessage("Huy hiệu"),
    "becomeOneOfUs": MessageLookupByLibrary.simpleMessage(
      "Hãy là một phần của chúng tôi",
    ),
    "bgCustom": MessageLookupByLibrary.simpleMessage("Tuỳ chỉnh"),
    "bgNature1": MessageLookupByLibrary.simpleMessage("Thiên nhiên 1"),
    "bgNature2": MessageLookupByLibrary.simpleMessage("Thiên nhiên 2"),
    "bgNature3": MessageLookupByLibrary.simpleMessage("Thiên nhiên 3"),
    "bgNature4": MessageLookupByLibrary.simpleMessage("Thiên nhiên 4"),
    "bgNone": MessageLookupByLibrary.simpleMessage("Không"),
    "blur": MessageLookupByLibrary.simpleMessage("Làm mờ"),
    "blurFace": MessageLookupByLibrary.simpleMessage("Ẩn khuôn mặt"),
    "blurFaceDescription": MessageLookupByLibrary.simpleMessage(
      "Ẩn khuôn mặt khỏi ảnh.",
    ),
    "blurryDeleted": MessageLookupByLibrary.simpleMessage("Đã xóa ảnh mờ"),
    "blurryPhotos": MessageLookupByLibrary.simpleMessage("Ảnh mờ"),
    "blurryPhotosDescription": MessageLookupByLibrary.simpleMessage(
      "Ảnh mờ là ảnh bị mờ, không rõ nét. Hãy dọn dẹp chúng để giải phóng dung lượng.",
    ),
    "brightness": MessageLookupByLibrary.simpleMessage("Độ sáng"),
    "calculatingProgress": MessageLookupByLibrary.simpleMessage(
      "Đang tính toán...",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Hủy"),
    "cancelMonthlyMessage": MessageLookupByLibrary.simpleMessage(
      "Bạn đã nâng cấp Trọn đời thành công! Vì bạn đang sử dụng gói Tháng, vui lòng vào Cửa hàng ứng dụng (App Store/Google Play) để HỦY gói Tháng, tránh bị trừ tiền vào chu kỳ tới.",
    ),
    "cancelMonthlyTitle": MessageLookupByLibrary.simpleMessage(
      "Hành động cần thiết",
    ),
    "changeOpacity": MessageLookupByLibrary.simpleMessage("Thay đổi độ mờ"),
    "changePassword": MessageLookupByLibrary.simpleMessage("Đổi mật khẩu"),
    "changePasswordSuccess": MessageLookupByLibrary.simpleMessage(
      "Đổi mật khẩu thành công",
    ),
    "chinese": MessageLookupByLibrary.simpleMessage("Tiếng Trung"),
    "circle": MessageLookupByLibrary.simpleMessage("Hình tròn"),
    "cleaned": MessageLookupByLibrary.simpleMessage("Đã dọn"),
    "cleanedSpaceSuccess": m1,
    "clearSelection": MessageLookupByLibrary.simpleMessage("Bỏ chọn tất cả"),
    "color": MessageLookupByLibrary.simpleMessage("Màu sắc"),
    "confirmDelete": MessageLookupByLibrary.simpleMessage("Xác nhận xóa"),
    "confirmPassword": MessageLookupByLibrary.simpleMessage(
      "Xác nhận mật khẩu",
    ),
    "confirmPasswordRequired": MessageLookupByLibrary.simpleMessage(
      "Xác nhận mật khẩu không được để trống",
    ),
    "confirmnoMorePhotosToDelete": MessageLookupByLibrary.simpleMessage(
      "Không còn ảnh nào để xoá",
    ),
    "congratsBadgeMessage": m2,
    "congratsBadgeTitle": MessageLookupByLibrary.simpleMessage("Huy hiệu mới!"),
    "congratsMultipleBadgesMessage": m3,
    "contactUs": MessageLookupByLibrary.simpleMessage("Liên hệ với chúng tôi"),
    "continueWithFreeVersion": MessageLookupByLibrary.simpleMessage(
      "Tiếp tục với phiên bản miễn phí",
    ),
    "contrast": MessageLookupByLibrary.simpleMessage("Độ tương phản"),
    "contributionGraph": MessageLookupByLibrary.simpleMessage(
      "Biểu đồ đóng góp",
    ),
    "convertImageFailed": MessageLookupByLibrary.simpleMessage(
      "Không thể chuyển đổi ảnh",
    ),
    "couldNotOpenEmailApp": m4,
    "countAsc": MessageLookupByLibrary.simpleMessage("Số lượng tăng dần"),
    "countDesc": MessageLookupByLibrary.simpleMessage("Số lượng giảm dần"),
    "createNewImage": MessageLookupByLibrary.simpleMessage("Tạo ảnh mới"),
    "crop": MessageLookupByLibrary.simpleMessage("Cắt"),
    "currentPlan": MessageLookupByLibrary.simpleMessage("Gói Hiện Tại"),
    "custom1": MessageLookupByLibrary.simpleMessage("Tự chọn 1"),
    "custom2": MessageLookupByLibrary.simpleMessage("Tự chọn 2"),
    "custom3": MessageLookupByLibrary.simpleMessage("Tự chọn 3"),
    "customThemeDescription": MessageLookupByLibrary.simpleMessage(
      "Nhấn để chọn, nhấn giữ để chọn ảnh khác",
    ),
    "dashDotLine": MessageLookupByLibrary.simpleMessage("Đường gạch chấm"),
    "dashLine": MessageLookupByLibrary.simpleMessage("Đường đứt nét"),
    "dataSynchronizedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Đã đồng bộ dữ liệu thành công",
    ),
    "dateAsc": MessageLookupByLibrary.simpleMessage("Ngày tăng dần"),
    "dateDesc": MessageLookupByLibrary.simpleMessage("Ngày giảm dần"),
    "days": MessageLookupByLibrary.simpleMessage("Ngày"),
    "defaultErrorMessage": MessageLookupByLibrary.simpleMessage(
      "Đã xảy ra lỗi. Vui lòng thử lại.",
    ),
    "delete": MessageLookupByLibrary.simpleMessage("Xóa"),
    "deleteAccount": MessageLookupByLibrary.simpleMessage("Xóa tài khoản"),
    "deleteAccountConfirm": MessageLookupByLibrary.simpleMessage(
      "Bạn có chắc chắn muốn xóa tài khoản không? Tất cả dữ liệu của bạn sẽ bị xóa vĩnh viễn.",
    ),
    "deleteAccountWarningMessage": MessageLookupByLibrary.simpleMessage(
      "Hành động này không thể hoàn tác. Toàn bộ dữ liệu và thông tin cá nhân của bạn sẽ bị xóa vĩnh viễn khỏi hệ thống.\n\nLưu ý quan trọng: Việc xóa tài khoản sẽ KHÔNG tự động hủy các gói đăng ký trả phí. Vui lòng đảm bảo quản lý và hủy gói đăng ký trong cửa hàng ứng dụng trước khi tiếp tục để tránh bị trừ tiền.",
    ),
    "deleteAccountWarningTitle": MessageLookupByLibrary.simpleMessage(
      "Xóa tài khoản",
    ),
    "deleteSelected": m5,
    "delete_confirm_message": MessageLookupByLibrary.simpleMessage(
      "Hãy kiểm tra kỹ lần cuối!\nBạn không thể hoàn tác đâu nhé!",
    ),
    "delete_confirm_message_permanent": MessageLookupByLibrary.simpleMessage(
      "Vui lòng kiểm tra lại lần cuối!\nHành động này không thể hoàn tác. Ảnh sẽ bị xóa vĩnh viễn khỏi thiết bị.",
    ),
    "delete_confirm_message_trash": MessageLookupByLibrary.simpleMessage(
      "Vui lòng kiểm tra lại lần cuối!\nẢnh sẽ được chuyển vào Thùng rác của thiết bị và có thể khôi phục trong vòng 30 ngày.",
    ),
    "deletedItemsCount": m6,
    "density": MessageLookupByLibrary.simpleMessage("Mật độ"),
    "deselectAll": MessageLookupByLibrary.simpleMessage("Bỏ chọn tất cả"),
    "detectedDuplicateGroups": m7,
    "deviceIsClean": MessageLookupByLibrary.simpleMessage(
      "Thiết bị của bạn rất sạch sẽ.",
    ),
    "document": MessageLookupByLibrary.simpleMessage("Phát hiện tài liệu"),
    "documentDescription": MessageLookupByLibrary.simpleMessage(
      "Nhận diện và quản lý các ảnh có chứa văn bản.",
    ),
    "done": MessageLookupByLibrary.simpleMessage("Đã hiểu"),
    "duplicates": MessageLookupByLibrary.simpleMessage("Ảnh trùng lặp"),
    "earned": MessageLookupByLibrary.simpleMessage("Đã mở khóa"),
    "edit": MessageLookupByLibrary.simpleMessage("Chỉnh sửa"),
    "editAnotherPhoto": MessageLookupByLibrary.simpleMessage("Sửa ảnh khác"),
    "editDescription": MessageLookupByLibrary.simpleMessage("Chỉnh sửa ảnh"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "emailAlreadyInUse": MessageLookupByLibrary.simpleMessage(
      "Email này đã được sử dụng.",
    ),
    "emailInvalid": MessageLookupByLibrary.simpleMessage(
      "Định dạng email không hợp lệ",
    ),
    "emailNotConfirmed": MessageLookupByLibrary.simpleMessage(
      "Email chưa được xác nhận.",
    ),
    "emailRequired": MessageLookupByLibrary.simpleMessage(
      "Email không được để trống",
    ),
    "emoji": MessageLookupByLibrary.simpleMessage("Emoji"),
    "enableNotification": MessageLookupByLibrary.simpleMessage("Bật thông báo"),
    "enableNotificationDescription": MessageLookupByLibrary.simpleMessage(
      "Nhận thông báo tiến trình và kết quả quét.",
    ),
    "english": MessageLookupByLibrary.simpleMessage("Tiếng Anh"),
    "enterWatermarkText": MessageLookupByLibrary.simpleMessage(
      "Nhập văn bản watermark",
    ),
    "eraser": MessageLookupByLibrary.simpleMessage("Tẩy"),
    "error": m8,
    "errorEmailNotFound": MessageLookupByLibrary.simpleMessage(
      "Email hỗ trợ không được tìm thấy",
    ),
    "errorTitle": MessageLookupByLibrary.simpleMessage("Lỗi"),
    "error_unable_to_play_media": MessageLookupByLibrary.simpleMessage(
      "Không thể phát media",
    ),
    "error_unsupported_media_type": MessageLookupByLibrary.simpleMessage(
      "Không hỗ trợ loại media này",
    ),
    "exposure": MessageLookupByLibrary.simpleMessage("Độ phơi sáng"),
    "eyeBar": MessageLookupByLibrary.simpleMessage("Thanh che mắt"),
    "fade": MessageLookupByLibrary.simpleMessage("Làm mờ dần"),
    "failedToChangePassword": MessageLookupByLibrary.simpleMessage(
      "Không thể đổi mật khẩu. Vui lòng thử lại.",
    ),
    "failedToLoadHistory": MessageLookupByLibrary.simpleMessage(
      "Không thể tải lịch sử xóa.",
    ),
    "failedToLoadProfile": MessageLookupByLibrary.simpleMessage(
      "Không thể tải hồ sơ người dùng. Vui lòng kiểm tra kết nối.",
    ),
    "failedToLoadStorageInfo": MessageLookupByLibrary.simpleMessage(
      "Không thể tải thông tin dung lượng lưu trữ.",
    ),
    "failedToRegister": MessageLookupByLibrary.simpleMessage(
      "Đăng ký thất bại. Vui lòng thử lại.",
    ),
    "failedToSaveImage": MessageLookupByLibrary.simpleMessage(
      "Không thể lưu ảnh. Vui lòng thử lại.",
    ),
    "failedToSendResetLink": MessageLookupByLibrary.simpleMessage(
      "Gửi liên kết đặt lại mật khẩu thất bại",
    ),
    "featureClean": MessageLookupByLibrary.simpleMessage("Dọn dẹp hiệu quả"),
    "featureModernUI": MessageLookupByLibrary.simpleMessage(
      "Giao diện hiện đại",
    ),
    "featureScan": MessageLookupByLibrary.simpleMessage("Quét nhanh chóng"),
    "featuresTitle": MessageLookupByLibrary.simpleMessage("Tính năng chính"),
    "feedbackContentHint": MessageLookupByLibrary.simpleMessage(
      "Nhập mô tả chi tiết lỗi hoặc đề xuất cải tiến của bạn tại đây...",
    ),
    "feedbackContentLabel": MessageLookupByLibrary.simpleMessage(
      "Nội dung chi tiết",
    ),
    "feedbackContentRequired": MessageLookupByLibrary.simpleMessage(
      "Vui lòng nhập nội dung chi tiết",
    ),
    "feedbackTitleHint": MessageLookupByLibrary.simpleMessage(
      "Nhập tiêu đề phản hồi...",
    ),
    "feedbackTitleLabel": MessageLookupByLibrary.simpleMessage("Tiêu đề"),
    "feedbackTitleRequired": MessageLookupByLibrary.simpleMessage(
      "Vui lòng nhập tiêu đề",
    ),
    "feedbackTypeBug": MessageLookupByLibrary.simpleMessage("Lỗi (Bug)"),
    "feedbackTypeImprovement": MessageLookupByLibrary.simpleMessage(
      "Gợi ý (Improvement)",
    ),
    "feedbackTypeLabel": MessageLookupByLibrary.simpleMessage("Loại phản hồi"),
    "feedbackTypeOther": MessageLookupByLibrary.simpleMessage("Khác (Other)"),
    "feedbackTypeQuestion": MessageLookupByLibrary.simpleMessage(
      "Câu hỏi (Question)",
    ),
    "file": MessageLookupByLibrary.simpleMessage("tệp"),
    "files": MessageLookupByLibrary.simpleMessage("tệp"),
    "fill": MessageLookupByLibrary.simpleMessage("Tô màu"),
    "filter": MessageLookupByLibrary.simpleMessage("Bộ lọc"),
    "finish": MessageLookupByLibrary.simpleMessage("Hoàn tất"),
    "flip": MessageLookupByLibrary.simpleMessage("Lật"),
    "fontScale": MessageLookupByLibrary.simpleMessage("Cỡ chữ"),
    "footerTitle": MessageLookupByLibrary.simpleMessage(
      "Liên hệ với chúng tôi",
    ),
    "forgotPasswordDescription": MessageLookupByLibrary.simpleMessage(
      "Nhập địa chỉ email của bạn và chúng tôi sẽ gửi cho bạn một liên kết để đặt lại mật khẩu.",
    ),
    "forgotPasswordQuestion": MessageLookupByLibrary.simpleMessage(
      "Quên mật khẩu?",
    ),
    "forgotPasswordTitle": MessageLookupByLibrary.simpleMessage(
      "Quên mật khẩu",
    ),
    "freePlan": MessageLookupByLibrary.simpleMessage("Gói Miễn phí"),
    "freestyle": MessageLookupByLibrary.simpleMessage("Vẽ tự do"),
    "freestyleArrowEnd": MessageLookupByLibrary.simpleMessage(
      "Vẽ mũi tên kết thúc",
    ),
    "freestyleArrowStart": MessageLookupByLibrary.simpleMessage(
      "Vẽ mũi tên bắt đầu",
    ),
    "freestyleArrowStartEnd": MessageLookupByLibrary.simpleMessage(
      "Vẽ mũi tên hai đầu",
    ),
    "fri": MessageLookupByLibrary.simpleMessage("Th 6"),
    "fullName": MessageLookupByLibrary.simpleMessage("Họ và tên"),
    "galleryManager": MessageLookupByLibrary.simpleMessage("Quản lý ảnh"),
    "general": MessageLookupByLibrary.simpleMessage("Chung"),
    "glasses": MessageLookupByLibrary.simpleMessage("Kính râm"),
    "googleLoginFailed": MessageLookupByLibrary.simpleMessage(
      "Đăng nhập bằng Google thất bại. Vui lòng thử lại.",
    ),
    "googleLoginSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Đăng nhập bằng Google thành công!",
    ),
    "gpsRemovedSuccess": MessageLookupByLibrary.simpleMessage(
      "Đã xóa dữ liệu vị trí và lưu thành bản sao mới.",
    ),
    "groupIndex": m9,
    "hexagon": MessageLookupByLibrary.simpleMessage("Hình lục giác"),
    "history": MessageLookupByLibrary.simpleMessage("Lịch sử"),
    "historyEarlier": MessageLookupByLibrary.simpleMessage("Cũ hơn"),
    "historyLast7Days": MessageLookupByLibrary.simpleMessage("7 ngày qua"),
    "historyThisMonth": MessageLookupByLibrary.simpleMessage("Tháng này"),
    "historyToday": MessageLookupByLibrary.simpleMessage("Hôm nay"),
    "historyYesterday": MessageLookupByLibrary.simpleMessage("Hôm qua"),
    "homeWidgetDialogSubtitle": MessageLookupByLibrary.simpleMessage(
      "Bạn có thể thêm widget của Twinfix ra màn hình chính để theo dõi dung lượng thiết bị nhanh chóng:",
    ),
    "homeWidgetDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Thêm Widget Twinfix",
    ),
    "homeWidgetStep1": MessageLookupByLibrary.simpleMessage(
      "1. Trở về màn hình chính của điện thoại.",
    ),
    "homeWidgetStep2": MessageLookupByLibrary.simpleMessage(
      "2. Nhấn giữ vào một khoảng trống bất kỳ trên màn hình.",
    ),
    "homeWidgetStep3": MessageLookupByLibrary.simpleMessage(
      "3. Chọn mục \"Tiện ích\" (hoặc \"Widgets\").",
    ),
    "homeWidgetStep4": MessageLookupByLibrary.simpleMessage(
      "4. Tìm ứng dụng Twinfix và kéo widget ra màn hình.",
    ),
    "homeWidgetSuggestionSubtitle": MessageLookupByLibrary.simpleMessage(
      "Thêm widget ra màn hình chính để truy cập nhanh và theo dõi bộ nhớ.",
    ),
    "homeWidgetSuggestionTitle": MessageLookupByLibrary.simpleMessage(
      "Tiện ích màn hình chính",
    ),
    "howToEarn": MessageLookupByLibrary.simpleMessage("Làm sao để đạt được?"),
    "howToEarnDescription": MessageLookupByLibrary.simpleMessage(
      "Bạn cần thực hiện thêm các bước dọn dẹp hệ thống hoặc mời bạn bè để nhận về huy hiệu danh giá này.",
    ),
    "hue": MessageLookupByLibrary.simpleMessage("Tông màu"),
    "iUnderstandDeleteConsequences": MessageLookupByLibrary.simpleMessage(
      "Tôi hiểu rõ hậu quả và vẫn muốn xóa tài khoản",
    ),
    "imageSaved": MessageLookupByLibrary.simpleMessage(
      "Đã lưu ảnh thành công!",
    ),
    "includedInLifetime": MessageLookupByLibrary.simpleMessage(
      "Đã bao gồm trong Trọn Đời",
    ),
    "information": MessageLookupByLibrary.simpleMessage("Thông tin"),
    "inputHintText": MessageLookupByLibrary.simpleMessage("Nhập văn bản"),
    "intensity": MessageLookupByLibrary.simpleMessage("Độ đậm nhạt"),
    "invalidTokenOrExpired": MessageLookupByLibrary.simpleMessage(
      "Token không hợp lệ hoặc đã hết hạn.",
    ),
    "itemsDeleted": MessageLookupByLibrary.simpleMessage("Ảnh đã xoá"),
    "japanese": MessageLookupByLibrary.simpleMessage("Tiếng Nhật"),
    "keepLocalData": MessageLookupByLibrary.simpleMessage(
      "Giữ dữ liệu trên máy",
    ),
    "language": MessageLookupByLibrary.simpleMessage("Ngôn ngữ"),
    "level": m10,
    "line": MessageLookupByLibrary.simpleMessage("Đường thẳng"),
    "lineWidth": MessageLookupByLibrary.simpleMessage("Độ dày nét"),
    "livePhotos": MessageLookupByLibrary.simpleMessage("Ảnh Live"),
    "livePhotosDescription": MessageLookupByLibrary.simpleMessage(
      "Ảnh Live là ảnh động, có thể phát lại video ngắn. Hãy dọn dẹp chúng để giải phóng dung lượng.",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Đăng nhập"),
    "loginFailureMessage": MessageLookupByLibrary.simpleMessage(
      "Đăng nhập thất bại. Vui lòng thử lại.",
    ),
    "loginSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Đăng nhập thành công!",
    ),
    "loginToSync": MessageLookupByLibrary.simpleMessage(
      "Đăng nhập để đồng bộ tiến trình của bạn",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Đăng xuất"),
    "longPressToSelectAll": MessageLookupByLibrary.simpleMessage(
      "Nhấn giữ để chọn tất cả",
    ),
    "luminance": MessageLookupByLibrary.simpleMessage("Độ chói"),
    "manageSubscriptions": MessageLookupByLibrary.simpleMessage(
      "Quản lý Đăng ký",
    ),
    "mediaTimeline": MessageLookupByLibrary.simpleMessage("Dòng thời gian"),
    "mediaTimelineDescription": MessageLookupByLibrary.simpleMessage(
      "Xem ảnh và video của bạn được phân loại theo thời gian.",
    ),
    "media_audio": MessageLookupByLibrary.simpleMessage("Âm thanh"),
    "media_other": MessageLookupByLibrary.simpleMessage("Tất cả"),
    "media_photo": MessageLookupByLibrary.simpleMessage("Ảnh"),
    "media_type_selection": MessageLookupByLibrary.simpleMessage(
      "Chọn loại phương tiện",
    ),
    "media_video": MessageLookupByLibrary.simpleMessage("Video"),
    "memoryWarning": MessageLookupByLibrary.simpleMessage("Bộ nhớ sắp đầy!"),
    "mergeData": MessageLookupByLibrary.simpleMessage("Kết hợp dữ liệu"),
    "mon": MessageLookupByLibrary.simpleMessage("Th 2"),
    "more": MessageLookupByLibrary.simpleMessage("nhiều"),
    "moveAndZoom": MessageLookupByLibrary.simpleMessage("Phóng to"),
    "nameLength": MessageLookupByLibrary.simpleMessage(
      "Tên phải có ít nhất 2 ký tự",
    ),
    "nameRequired": MessageLookupByLibrary.simpleMessage(
      "Tên không được để trống",
    ),
    "newPassword": MessageLookupByLibrary.simpleMessage("Mật khẩu mới"),
    "next": MessageLookupByLibrary.simpleMessage("Tiếp theo"),
    "noAccountRegister": MessageLookupByLibrary.simpleMessage(
      "Chưa có tài khoản? Đăng ký ngay",
    ),
    "noActivity": MessageLookupByLibrary.simpleMessage(
      "Chưa có hoạt động dọn dẹp nào",
    ),
    "noBadgesEarnedYet": MessageLookupByLibrary.simpleMessage(
      "Chưa có huy hiệu",
    ),
    "noDocumentsFound": MessageLookupByLibrary.simpleMessage(
      "Không tìm thấy ảnh có chứa văn bản.",
    ),
    "noEmailProvided": MessageLookupByLibrary.simpleMessage(
      "Chưa cung cấp email",
    ),
    "noFacesDetected": MessageLookupByLibrary.simpleMessage(
      "Không phát hiện khuôn mặt nào trong ảnh.",
    ),
    "noFilter": MessageLookupByLibrary.simpleMessage("Không bộ lọc"),
    "noPhotosWithGPSFound": MessageLookupByLibrary.simpleMessage(
      "Không tìm thấy ảnh có chứa dữ liệu vị trí.",
    ),
    "notEarned": MessageLookupByLibrary.simpleMessage(
      "Chưa hoàn thành yêu cầu",
    ),
    "notLoggedIn": MessageLookupByLibrary.simpleMessage(
      "Chưa đăng nhập (Khách)",
    ),
    "nothingFound": MessageLookupByLibrary.simpleMessage("Không tìm thấy gì"),
    "notifScanCompleteBlurry": m11,
    "notifScanCompleteDocuments": m12,
    "notifScanCompleteDuplicates": m13,
    "notifScanCompleteGPS": m14,
    "notifScanCompleteNone": MessageLookupByLibrary.simpleMessage(
      "Không tìm thấy vấn đề. Thư viện ảnh rất sạch!",
    ),
    "notifScanCompleteTitle": MessageLookupByLibrary.simpleMessage(
      "Quét hoàn tất!",
    ),
    "notifScanningBody": m15,
    "notifScanningTitle": MessageLookupByLibrary.simpleMessage(
      "Đang quét ảnh...",
    ),
    "ok": MessageLookupByLibrary.simpleMessage("Đồng ý"),
    "oldPassword": MessageLookupByLibrary.simpleMessage("Mật khẩu cũ"),
    "onboardingDemoSwipeLeft": MessageLookupByLibrary.simpleMessage(
      "Vuốt trái để Xóa",
    ),
    "onboardingDemoSwipeRight": MessageLookupByLibrary.simpleMessage(
      "Vuốt phải để Giữ",
    ),
    "onboardingStartScan": MessageLookupByLibrary.simpleMessage(
      "Bắt đầu dọn dẹp",
    ),
    "onboardingWelcomeTitle": MessageLookupByLibrary.simpleMessage(
      "Chào mừng đến với Twinfix",
    ),
    "opacity": MessageLookupByLibrary.simpleMessage("Đậm nhạt"),
    "openGalleryManager": MessageLookupByLibrary.simpleMessage(
      "Mở Gallery Manager",
    ),
    "openGalleryManagerDescription": MessageLookupByLibrary.simpleMessage(
      "Nếu muốn dọn thủ công theo từng loại media, hãy vào đây. Chạm nút được highlight để mở luôn.",
    ),
    "openingEmailApp": MessageLookupByLibrary.simpleMessage(
      "Đang mở ứng dụng Email để gửi phản hồi...",
    ),
    "or": MessageLookupByLibrary.simpleMessage("Hoặc"),
    "packageLifetimeDescription": MessageLookupByLibrary.simpleMessage(
      "Mua 1 lần dùng mãi mãi.",
    ),
    "packageLifetimeTitle": MessageLookupByLibrary.simpleMessage("Trọn Đời"),
    "packageMonthlyDescription": MessageLookupByLibrary.simpleMessage(
      "Đăng ký hàng tháng. Hủy bất cứ lúc nào.",
    ),
    "packageMonthlyTitle": MessageLookupByLibrary.simpleMessage("1 Tháng"),
    "paint": MessageLookupByLibrary.simpleMessage("Vẽ"),
    "password": MessageLookupByLibrary.simpleMessage("Mật khẩu"),
    "passwordLength": MessageLookupByLibrary.simpleMessage(
      "Mật khẩu phải có ít nhất 8 ký tự, bao gồm chữ hoa, chữ thường, số và ký tự đặc biệt",
    ),
    "passwordRequired": MessageLookupByLibrary.simpleMessage(
      "Mật khẩu không được để trống",
    ),
    "passwordTooShort": MessageLookupByLibrary.simpleMessage(
      "Mật khẩu quá ngắn",
    ),
    "passwordsDoNotMatch": MessageLookupByLibrary.simpleMessage(
      "Mật khẩu không trùng khớp",
    ),
    "paywallSubtitle": MessageLookupByLibrary.simpleMessage(
      "Tận hưởng mọi tính năng chuyên nghiệp mà không bị giới hạn.",
    ),
    "paywallWelcomeSubtitle": MessageLookupByLibrary.simpleMessage(
      "Khai phá toàn bộ tiềm năng thư viện ảnh của bạn với các công cụ AI mạnh mẽ và trải nghiệm không quảng cáo.",
    ),
    "paywallWelcomeTitle": MessageLookupByLibrary.simpleMessage(
      "Chào mừng bạn đến với Premium",
    ),
    "perfect": MessageLookupByLibrary.simpleMessage("Hoàn hảo!"),
    "permissionDescription": MessageLookupByLibrary.simpleMessage(
      "Twinfix cần quyền truy cập vào thư viện ảnh để quét và dọn dẹp các ảnh trùng lặp.",
    ),
    "permissionRequired": MessageLookupByLibrary.simpleMessage(
      "Yêu cầu quyền truy cập",
    ),
    "personalCustomizeableTheme": MessageLookupByLibrary.simpleMessage(
      "Cá nhân hoá giao diện",
    ),
    "personalProcessSync": MessageLookupByLibrary.simpleMessage(
      "Đồng bộ tiến trình dọn dẹp",
    ),
    "pixelate": MessageLookupByLibrary.simpleMessage("Dạng Pixel"),
    "pleaseEnterWatermarkText": MessageLookupByLibrary.simpleMessage(
      "Vui lòng nhập văn bản watermark",
    ),
    "pleaseFillAllFields": MessageLookupByLibrary.simpleMessage(
      "Vui lòng điền đầy đủ các trường",
    ),
    "pleaseWaitWhileWeAreRedirectingYou": MessageLookupByLibrary.simpleMessage(
      "Vui lòng đợi trong lúc chúng tôi chuyển hướng bạn...",
    ),
    "polygon": MessageLookupByLibrary.simpleMessage("Hình đa giác"),
    "popular": MessageLookupByLibrary.simpleMessage("PHỔ BIẾN NHẤT"),
    "premium": MessageLookupByLibrary.simpleMessage("Premium"),
    "premiumFeatureAiTools": MessageLookupByLibrary.simpleMessage(
      "Mở khóa mọi công cụ AI",
    ),
    "premiumFeatureNoAds": MessageLookupByLibrary.simpleMessage(
      "Không có quảng cáo",
    ),
    "premiumPlan": MessageLookupByLibrary.simpleMessage("Gói Premium"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("Chính sách bảo mật"),
    "profile": MessageLookupByLibrary.simpleMessage("Cá nhân"),
    "profileSettings": MessageLookupByLibrary.simpleMessage("Cài đặt cá nhân"),
    "progress": MessageLookupByLibrary.simpleMessage("Tiến trình"),
    "purchaseErrorStoreConnection": MessageLookupByLibrary.simpleMessage(
      "Không thể kết nối đến cửa hàng.",
    ),
    "purchaseFailureMessage": MessageLookupByLibrary.simpleMessage(
      "Mua hàng thất bại hoặc bị hủy.",
    ),
    "purchaseSuccess": MessageLookupByLibrary.simpleMessage(
      "Nâng cấp Premium thành công!",
    ),
    "ratio": MessageLookupByLibrary.simpleMessage("Tỷ lệ"),
    "rectangle": MessageLookupByLibrary.simpleMessage("Hình chữ nhật"),
    "redo": MessageLookupByLibrary.simpleMessage("Làm lại"),
    "register": MessageLookupByLibrary.simpleMessage("Đăng ký"),
    "registerSuccess": MessageLookupByLibrary.simpleMessage(
      "Đăng ký thành công",
    ),
    "registerSuccessMessage": MessageLookupByLibrary.simpleMessage(
      "Vui lòng truy cập vào email và xác thực tài khoản để có thể đăng nhập",
    ),
    "removeGPS": MessageLookupByLibrary.simpleMessage("Xóa GPS"),
    "removeGPSDescription": MessageLookupByLibrary.simpleMessage(
      "Xóa thông tin vị trí khỏi ảnh.",
    ),
    "replaceOriginal": MessageLookupByLibrary.simpleMessage("Thay thế bản gốc"),
    "reset": MessageLookupByLibrary.simpleMessage("Đặt lại"),
    "resetLinkSent": MessageLookupByLibrary.simpleMessage(
      "Liên kết đặt lại mật khẩu đã được gửi đến email của bạn!",
    ),
    "restoreFailureMessage": MessageLookupByLibrary.simpleMessage(
      "Không thể khôi phục giao dịch hoặc bạn chưa đăng ký.",
    ),
    "restoreFromCloud": MessageLookupByLibrary.simpleMessage(
      "Khôi phục từ đám mây",
    ),
    "restorePurchases": MessageLookupByLibrary.simpleMessage(
      "Khôi phục giao dịch (Restore Purchases)",
    ),
    "rotate": MessageLookupByLibrary.simpleMessage("Xoay"),
    "sat": MessageLookupByLibrary.simpleMessage("Th 7"),
    "saturation": MessageLookupByLibrary.simpleMessage("Độ bão hòa"),
    "save": MessageLookupByLibrary.simpleMessage("Lưu"),
    "saving": MessageLookupByLibrary.simpleMessage("Đang lưu..."),
    "scanLimit": MessageLookupByLibrary.simpleMessage("Giới hạn quét"),
    "scanLimitAll": MessageLookupByLibrary.simpleMessage("Tất cả"),
    "scanLimitWarning": MessageLookupByLibrary.simpleMessage(
      "Giới hạn quét tất cả có thể mất nhiều thời gian và tốn pin hơn.",
    ),
    "scanResults": MessageLookupByLibrary.simpleMessage("Kết quả quét"),
    "scanningDevice": MessageLookupByLibrary.simpleMessage(
      "Đang quét thiết bị...",
    ),
    "scanningDocument": MessageLookupByLibrary.simpleMessage(
      "Đang quét tài liệu...",
    ),
    "screenshots": MessageLookupByLibrary.simpleMessage("Ảnh chụp màn hình"),
    "screenshotsDescription": MessageLookupByLibrary.simpleMessage(
      "Ảnh chụp màn hình là ảnh chụp màn hình. Hãy dọn dẹp chúng để giải phóng dung lượng.",
    ),
    "search": MessageLookupByLibrary.simpleMessage("Tìm kiếm"),
    "selectAll": MessageLookupByLibrary.simpleMessage("Chọn tất cả"),
    "selectEmoji": MessageLookupByLibrary.simpleMessage("Chọn Emoji"),
    "selectTemplate": MessageLookupByLibrary.simpleMessage("Chọn mẫu"),
    "sendFeedbackSubtitle": MessageLookupByLibrary.simpleMessage(
      "Chúng tôi luôn lắng nghe ý kiến của bạn!",
    ),
    "sendFeedbackTitle": MessageLookupByLibrary.simpleMessage(
      "Gửi phản hồi của bạn",
    ),
    "sendResetLink": MessageLookupByLibrary.simpleMessage(
      "Gửi liên kết đặt lại",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("Cài đặt"),
    "sevenDays": MessageLookupByLibrary.simpleMessage("7 Ngày"),
    "sevenWeeks": MessageLookupByLibrary.simpleMessage("7 Tuần"),
    "sharpness": MessageLookupByLibrary.simpleMessage("Độ sắc nét"),
    "signInWithGoogle": MessageLookupByLibrary.simpleMessage(
      "Đăng nhập bằng Google",
    ),
    "size": MessageLookupByLibrary.simpleMessage("Kích thước"),
    "sizeAsc": MessageLookupByLibrary.simpleMessage("Kích thước tăng dần"),
    "sizeDesc": MessageLookupByLibrary.simpleMessage("Kích thước giảm dần"),
    "skip": MessageLookupByLibrary.simpleMessage("Bỏ qua"),
    "smallScreenMoreTooltip": MessageLookupByLibrary.simpleMessage("Thêm"),
    "solid": MessageLookupByLibrary.simpleMessage("Màu đặc"),
    "sort": MessageLookupByLibrary.simpleMessage("Sắp xếp"),
    "startQuickScan": MessageLookupByLibrary.simpleMessage(
      "Bắt đầu quét nhanh",
    ),
    "startQuickScanDescription": MessageLookupByLibrary.simpleMessage(
      "Nút này dùng để quét thư viện và tìm ảnh trùng chỉ với vài thao tác.",
    ),
    "stats": MessageLookupByLibrary.simpleMessage("Thống kê"),
    "storageAlmostFull": m16,
    "storageUsedPercent": m17,
    "streak": MessageLookupByLibrary.simpleMessage("Chuỗi ngày"),
    "streakDays": m18,
    "streaks": MessageLookupByLibrary.simpleMessage("Chuỗi ngày"),
    "strokeWidth": MessageLookupByLibrary.simpleMessage("Độ dày viền"),
    "submitFeedback": MessageLookupByLibrary.simpleMessage("Gửi phản hồi"),
    "success": MessageLookupByLibrary.simpleMessage("Thành công"),
    "sun": MessageLookupByLibrary.simpleMessage("CN"),
    "syncDataMessage": MessageLookupByLibrary.simpleMessage(
      "Chúng tôi thấy bạn có dữ liệu dọn dẹp cũ từ phiên làm việc khách. Bạn có muốn kết hợp chúng vào tài khoản mới này không?",
    ),
    "syncDataTitle": MessageLookupByLibrary.simpleMessage(
      "Liên kết dữ liệu khách?",
    ),
    "syncExplainKeepLocalDesc": MessageLookupByLibrary.simpleMessage(
      "Giữ lại dữ liệu hiện tại trên thiết bị này và ghi đè lên dữ liệu cũ đã lưu trên đám mây.",
    ),
    "syncExplainMergeDesc": MessageLookupByLibrary.simpleMessage(
      "Kết hợp số liệu dọn dẹp và thành tựu hiện tại trên máy với dữ liệu đã lưu trên tài khoản. Bạn sẽ không bị mất bất kỳ tiến trình nào.",
    ),
    "syncExplainRestoreDesc": MessageLookupByLibrary.simpleMessage(
      "Xóa dữ liệu của phiên khách hiện tại và khôi phục lại dữ liệu tài khoản cũ đã được lưu trên đám mây.",
    ),
    "syncExplainTitle": MessageLookupByLibrary.simpleMessage(
      "Tùy chọn đồng bộ là gì?",
    ),
    "tabDashboard": MessageLookupByLibrary.simpleMessage("Thành tựu"),
    "tabOtherFeatures": MessageLookupByLibrary.simpleMessage("Khác"),
    "tabScan": MessageLookupByLibrary.simpleMessage("Dọn dẹp"),
    "tabSettings": MessageLookupByLibrary.simpleMessage("Cài đặt"),
    "tapToChangeStyle": MessageLookupByLibrary.simpleMessage(
      "Chạm để thay đổi phong cách",
    ),
    "temperature": MessageLookupByLibrary.simpleMessage("Nhiệt độ màu"),
    "termsOfService": MessageLookupByLibrary.simpleMessage(
      "Điều khoản dịch vụ",
    ),
    "text": MessageLookupByLibrary.simpleMessage("Văn bản"),
    "textAlign": MessageLookupByLibrary.simpleMessage("Căn lề chữ"),
    "theme": MessageLookupByLibrary.simpleMessage("Giao diện"),
    "themeDark": MessageLookupByLibrary.simpleMessage("Tối"),
    "themeLight": MessageLookupByLibrary.simpleMessage("Sáng"),
    "themeSystem": MessageLookupByLibrary.simpleMessage("Hệ thống"),
    "thu": MessageLookupByLibrary.simpleMessage("Th 5"),
    "timelineDay": MessageLookupByLibrary.simpleMessage("Ngày"),
    "timelineMonth": MessageLookupByLibrary.simpleMessage("Tháng"),
    "timelineYear": MessageLookupByLibrary.simpleMessage("Năm"),
    "toggleFill": MessageLookupByLibrary.simpleMessage("Tô màu nền"),
    "tooManyRequests": MessageLookupByLibrary.simpleMessage(
      "Quá nhiều yêu cầu. Vui lòng thử lại sau.",
    ),
    "totalPhotos": m19,
    "totalPhotosLast7Days": m20,
    "totalPhotosLast7Weeks": m21,
    "tue": MessageLookupByLibrary.simpleMessage("Th 3"),
    "tune": MessageLookupByLibrary.simpleMessage("Điều chỉnh"),
    "understood": MessageLookupByLibrary.simpleMessage("ĐÃ HIỂU"),
    "undo": MessageLookupByLibrary.simpleMessage("Hoàn tác"),
    "unknown": MessageLookupByLibrary.simpleMessage("Không xác định"),
    "unknownError": MessageLookupByLibrary.simpleMessage(
      "Đã xảy ra lỗi không xác định.",
    ),
    "unknownUser": MessageLookupByLibrary.simpleMessage("Người dùng ẩn danh"),
    "upgradeToPremium": MessageLookupByLibrary.simpleMessage(
      "Nâng cấp Premium",
    ),
    "userBanned": MessageLookupByLibrary.simpleMessage("Người dùng đã bị cấm."),
    "userNotFound": MessageLookupByLibrary.simpleMessage(
      "Không tìm thấy người dùng.",
    ),
    "verificationSuccess": MessageLookupByLibrary.simpleMessage(
      "Xác thực thành công!",
    ),
    "vietnamese": MessageLookupByLibrary.simpleMessage("Tiếng Việt"),
    "viewAllBadges": MessageLookupByLibrary.simpleMessage(
      "Xem tất cả huy hiệu",
    ),
    "viewDetail": MessageLookupByLibrary.simpleMessage("Xem chi tiết"),
    "viewFullHistory": MessageLookupByLibrary.simpleMessage(
      "Xem toàn bộ lịch sử",
    ),
    "watermarkText": MessageLookupByLibrary.simpleMessage("Văn bản Watermark"),
    "weakPassword": MessageLookupByLibrary.simpleMessage("Mật khẩu quá yếu."),
    "wed": MessageLookupByLibrary.simpleMessage("Th 4"),
    "weekShort": MessageLookupByLibrary.simpleMessage("T."),
    "welcomeBack": MessageLookupByLibrary.simpleMessage("Chào mừng trở lại"),
  };
}
