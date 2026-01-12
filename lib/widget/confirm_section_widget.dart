import 'package:flutter/material.dart';

class ConfirmSectionWidget extends StatefulWidget {
  final VoidCallback onConfirm;

  const ConfirmSectionWidget({
    super.key,
    required this.onConfirm,
  });

  @override
  State<ConfirmSectionWidget> createState() => _ConfirmSectionWidgetState();
}

class _ConfirmSectionWidgetState extends State<ConfirmSectionWidget> {
  bool _isCommited = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      children: [
        CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          value: _isCommited,
          onChanged: (bool? value) {
            setState(() {
              _isCommited = value ?? false;
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: Colors.lightBlue,
          title: const Text(
            "Tôi đồng ý thông tin tôi cung cấp bên trên chính xác",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Color(0xFF344054),
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _isCommited
                ? widget.onConfirm
                : null,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: Colors.lightBlue,
              disabledBackgroundColor: const Color(0xFFD6D6D6),
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            child: const Text(
              "Xác nhận",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
