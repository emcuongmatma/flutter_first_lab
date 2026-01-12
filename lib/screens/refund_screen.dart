import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled3/widget/bank_selection_widget.dart';
import 'package:untitled3/widget/confirm_section_widget.dart';

class RefundScreen extends StatefulWidget {
  final String? username;

  const RefundScreen({super.key, this.username});

  @override
  State<RefundScreen> createState() => _RefundScreenState();
}

class _RefundScreenState extends State<RefundScreen> {
  final _controller = TextEditingController();
  final _mainFormKey = GlobalKey<FormState>();
  final _backgroundImage = "assets/images/image_refund.png";
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            context.pop(true);
          },
        ),
        title: const Text(
          "Thông tin hoàn tiền",
          style: TextStyle(
            color: Color(0xFF333741),
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Form(
        key: _mainFormKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              spacing: 24,
              children: [
                const Column(
                  spacing: 8,
                  children: [
                    Text(
                      "Chúc mừng bé đã hoàn thành Thử thách 60 ngày!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF182230),
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      "Ba mẹ vui lòng điền đầy đủ thông tin bên dưới để Monkey hoàn tất thủ tục hoàn tiền",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF667085),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17.0),
                  child: Image.asset(
                    _backgroundImage,
                    filterQuality: FilterQuality.high,
                  ),
                ),

                //Thong tin nguoi nhan
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12.0,
                  children: [
                    const Text(
                      "Thông tin người nhận",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF333741),
                        fontSize: 16,
                      ),
                    ),
                    CustomInputField(
                      field: "Họ tên ba/mẹ",
                      hint: "Nhập họ tên",
                      defaultValue: widget.username,
                    ),
                    const CustomInputField(
                      field: "Số điện thoại đăng ký mua hàng",
                      hint: "Nhập số điện thoại",
                      keyboardType: TextInputType.number,
                      validator: validatorNumber,
                    ),
                  ],
                ),
                //Tai khoan ngan hang nhan tien
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12.0,
                  children: [
                    const Text(
                      "Tài khoản nhận tiền",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF333741),
                        fontSize: 16,
                      ),
                    ),
                    BankSelectionWidget(
                      controller: _controller,
                      onSelected: (item) {
                        _controller.text = item.bankName;
                        FocusScope.of(context).unfocus();
                      },
                    ),
                    const CustomInputField(
                      field: "Chi nhánh",
                      hint: "Nhập chi nhánh",
                    ),
                    const CustomInputField(
                      field: "Số tài khoản",
                      hint: "Nhập số tài khoản",
                      keyboardType: TextInputType.number,
                      validator: validatorNumber,
                    ),
                    const CustomInputField(field: "Chủ tài khoản", hint: ""),
                  ],
                ),

                ConfirmSectionWidget(
                  onConfirm: () {
                    if (_mainFormKey.currentState!.validate()) {
                      debugPrint("Hợp lệ");
                    }
                  },
                ),

                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF85888E),
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            "*Monkey sẽ hoàn tiền trong vòng 30 ngày kể từ ngày bé ",
                      ),
                      TextSpan(
                        text: "hoàn thành thử thách",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomInputField extends StatelessWidget {
  final String field;
  final String hint;
  final String? defaultValue;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const CustomInputField({
    super.key,
    required this.field,
    required this.hint,
    this.defaultValue,
    this.keyboardType = TextInputType.text,
    this.validator = validatorString,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          field,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Color(0xFF344054),
            fontSize: 14,
          ),
        ),
        TextFormField(
          keyboardType: keyboardType,
          validator: validator,
          initialValue: defaultValue,
          decoration: InputDecoration(
            hintText: hint,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ),
      ],
    );
  }
}

String? validatorNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Không được bỏ trống!';
  }
  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
    return "Chỉ được nhập chữ số";
  }

  if (value.contains(' ')) {
    return "Không được chứa khoảng trắng";
  }
  return null;
}

String? validatorString(String? value) {
  if (value == null || value.isEmpty) {
    return 'Không được bỏ trống!';
  }
  return null;
}