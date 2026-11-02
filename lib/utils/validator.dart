class AppValidator {
  // --- 1. KIỂM TRA HỌ TÊN  ---
  static String? validateFullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Họ tên không được để trống';
    }
    if (value.trim().length < 2) {
      return 'Họ tên phải có ít nhất 2 ký tự';
    }
    return null;
  }

  // --- 2. KIỂM TRA EMAIL ---
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email bắt buộc nhập';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Email không đúng định dạng (VD: abc@gmail.com)';
    }
    return null;
  }

  // --- 3. KIỂM TRA BẮT BUỘC NHẬP  ---
  static String? validateRequired(String? value, {String fieldName = 'Trường này'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName không được để trống';
    }
    return null;
  }

  // --- 4. KIỂM TRA SỐ ĐIỆN THOẠI VIỆT NAM (10 chữ số, đầu 03, 05, 07, 08, 09) ---
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Số điện thoại không được để trống';
    }
    final phoneRegex = RegExp(r'^(0[3|5|7|8|9])+[0-9]{8}$');
    if (!phoneRegex.hasMatch(value.trim())) {
      return 'Số điện thoại không hợp lệ (VD: 0912345678)';
    }
    return null;
  }

  // --- 5. KIỂM TRA MẬT KHẨU (Độ dài tối thiểu & ký tự) ---
  static String? validatePassword(String? value, {int minLength = 6}) {
    if (value == null || value.isEmpty) {
      return 'Mật khẩu không được để trống';
    }
    if (value.length < minLength) {
      return 'Mật khẩu phải chứa ít nhất $minLength ký tự';
    }
    return null;
  }

  // --- 6. KIỂM TRA XÁC NHẬN MẬT KHẨU (Khớp với mật khẩu trước đó) ---
  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng xác nhận lại mật khẩu';
    }
    if (value != password) {
      return 'Mật khẩu xác nhận không trùng khớp';
    }
    return null;
  }

  // --- 7. KIỂM TRA SỐ (Giá tiền, Số lượng, Độ tuổi...) ---
  static String? validateNumber(String? value, {String fieldName = 'Giá trị', double? min, double? max}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName không được để trống';
    }
    final numValue = double.tryParse(value.trim());
    if (numValue == null) {
      return '$fieldName phải là một số hợp lệ';
    }
    if (min != null && numValue < min) {
      return '$fieldName phải lớn hơn hoặc bằng $min';
    }
    if (max != null && numValue > max) {
      return '$fieldName phải nhỏ hơn hoặc bằng $max';
    }
    return null;
  }

  // --- 8. KIỂM TRA ĐƯỜNG DẪN URL / ẢNH (Http / Https) ---
  static String? validateUrl(String? value, {String fieldName = 'Đường dẫn URL'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName không được để trống';
    }
    final urlRegex = RegExp(r'^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$');
    if (!urlRegex.hasMatch(value.trim())) {
      return '$fieldName không đúng định dạng URL (VD: https://example.com)';
    }
    return null;
  }

  // --- 9. KIỂM TRA SỐ CCCD / CMND VIỆT NAM (9 hoặc 12 số) ---
  static String? validateIdentityCard(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Số CCCD/CMND không được để trống';
    }
    final idRegex = RegExp(r'^[0-9]{9}$|^[0-9]{12}$');
    if (!idRegex.hasMatch(value.trim())) {
      return 'Số CCCD/CMND phải bao gồm 9 hoặc 12 chữ số';
    }
    return null;
  }

  // --- 10. KIỂM TRA ĐỊNH DẠNG NGÀY THÁNG (DD/MM/YYYY) ---
  static String? validateDate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Ngày tháng không được để trống';
    }
    final dateRegex = RegExp(r'^(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/\d{4}$');
    if (!dateRegex.hasMatch(value.trim())) {
      return 'Định dạng ngày phải là DD/MM/YYYY (VD: 25/12/2000)';
    }
    return null;
  }
}
