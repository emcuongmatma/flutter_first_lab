import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class RefundScreen extends StatefulWidget {
  const RefundScreen({super.key});

  @override
  State<RefundScreen> createState() => _RefundScreenState();
}

class _RefundScreenState extends State<RefundScreen> {
  final _controller = TextEditingController();
  String? _bankImageUrl;
  bool _isCommited = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new),
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
      body: SingleChildScrollView(
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
                  _layoutInputInformation("Họ tên ba/mẹ", "Nhập họ tên"),
                  _layoutInputInformation(
                    "Số điện thoại đăng ký mua hàng",
                    "Nhập số điện thoại",
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
                  _layoutInputInformation("Chi nhánh", "Nhập chi nhánh"),
                  _layoutInputInformation("Số tài khoản", "Nhập số tài khoản"),
                  _layoutInputInformation("Chủ tài khoản", ""),
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
                  onPressed: _isCommited ? () {} : null,
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
                    fontStyle: FontStyle.italic
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
        return TextField(
          controller: controller,
          focusNode: focusNode,
          autofocus: false,
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
}

class BankModel {
  final String imageUrl;
  final String bankName;

  BankModel(this.imageUrl, this.bankName);
}

Widget _layoutInputInformation(
  String field,
  String hint, [
  Function(String)? callBack,
]) {
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
      TextField(
        onChanged: (text) => callBack?.call(text),
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
