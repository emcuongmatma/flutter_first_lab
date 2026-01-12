import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:go_router/go_router.dart';

class RefundScreen extends StatefulWidget {
  final String? username;

  const RefundScreen({super.key, this.username});

  @override
  State<RefundScreen> createState() => _RefundScreenState();
}

class _RefundScreenState extends State<RefundScreen> {
  final _controller = TextEditingController();
  String? _bankImageUrl;
  bool _isCommited = false;
  final _mainFormKey = GlobalKey<FormState>();

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
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            context.pop(true);
          },
        ),
        title: Text(
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
                Column(
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
                  padding: EdgeInsets.symmetric(horizontal: 17.0),
                  child: Image.asset(
                    "assets/images/image_refund.png",
                    filterQuality: FilterQuality.high,
                  ),
                ),

                //Thong tin nguoi nhan
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12.0,
                  children: [
                    Text(
                      "Thông tin người nhận",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF333741),
                        fontSize: 16,
                      ),
                    ),
                    _layoutInputInformation(
                      field: "Họ tên ba/mẹ",
                      hint: "Nhập họ tên",
                      defaultValue: widget.username,
                    ),
                    _layoutInputInformation(
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
                    Text(
                      "Tài khoản nhận tiền",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF333741),
                        fontSize: 16,
                      ),
                    ),
                    _searchBar(),
                    _layoutInputInformation(
                      field: "Chi nhánh",
                      hint: "Nhập chi nhánh",
                    ),
                    _layoutInputInformation(
                      field: "Số tài khoản",
                      hint: "Nhập số tài khoản",
                      keyboardType: TextInputType.number,
                      validator: validatorNumber,
                    ),
                    _layoutInputInformation(field: "Chủ tài khoản", hint: ""),
                  ],
                ),

                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  value: _isCommited,
                  onChanged: (bool? value) {
                    setState(() {
                      _isCommited = value!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Colors.lightBlue,
                  title: Text(
                    "Tôi đồng ý thông tin tôi cung cấp bên trên chính xác",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xFF344054),
                    ),
                  ),
                  titleAlignment: ListTileTitleAlignment.center,
                ),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isCommited
                        ? () {
                            if (_mainFormKey.currentState!.validate()) {
                              debugPrint("Dữ liệu hợp lệ");
                            }
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Colors.lightBlue,
                      disabledBackgroundColor: Color(0xFFD6D6D6),
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(
                      "Xác nhận",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),

                RichText(
                  text: TextSpan(
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

  Widget _searchBar() {
    return TypeAheadField<BankModel>(
      suggestionsCallback: (search) => [
        BankModel("assets/images/ic_techcombank.png", "Techcombank"),
        BankModel("assets/images/ic_techcombank.png", "Techcombank"),
        BankModel("assets/images/ic_techcombank.png", "Techcombank"),
      ],
      controller: _controller,
      builder: (context, controller, focusNode) {
        return TextFormField(
          controller: controller,
          focusNode: focusNode,
          autofocus: false,
          validator: validatorString,
          decoration: InputDecoration(
            prefixIcon: _bankImageUrl != null
                ? Image.asset("assets/images/ic_techcombank.png")
                : Icon(Icons.search),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: "Chọn ngân hàng",
          ),
        );
      },
      itemBuilder: (context, item) {
        return ListTile(
          leading: Image.asset(item.imageUrl, width: 32, height: 32),
          title: Text(item.bankName),
        );
      },
      onSelected: (item) {
        setState(() {
          _bankImageUrl = item.imageUrl;
        });
        _controller.text = item.bankName;
        FocusScope.of(context).unfocus();
      },
    );
  }

  Widget _layoutInputInformation({
    required String field,
    required String hint,
    String? defaultValue,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator = validatorString,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          field,
          style: TextStyle(
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
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ),
      ],
    );
  }
}

String? validatorString(String? value) {
  if (value == null || value.isEmpty) {
    return 'Không được bỏ trống!';
  }
  return null;
}

String? validatorNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'This field is required';
  }
  if (!RegExp(r'^[0-9]').hasMatch(value)) {
    return "Chỉ được nhập chữ số";
  }

  if (value.contains(' ')) {
    return "Không được chứa khoảng trắng";
  }
  return null;
}

class BankModel {
  final String imageUrl;
  final String bankName;

  BankModel(this.imageUrl, this.bankName);
}
