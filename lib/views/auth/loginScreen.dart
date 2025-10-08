import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shinr_mob/utils/constants/Strings.dart';
import 'package:shinr_mob/utils/constants/app.themes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();
  bool _isValid = false;

  @override
  void initState() {
    super.initState();
    // Auto focus and show keyboard when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppThemes.backgroundClr,
        resizeToAvoidBottomInset: true, // Ensures proper layout with keyboard
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.w),
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/images/shinr_logo.png",
                        width: 350.w,
                        height: 32.h,
                        alignment: Alignment.centerLeft,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        Strings.enterMobile,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20.sp),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        Strings.loginScreenNote,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: AppThemes.neutral60),
                      ),
                      SizedBox(height: 12.h),
                      TextFormField(
                        controller: _controller,
                        focusNode: _focusNode, // Assign focus node
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        onChanged: (value) {
                          final isValidNow =
                              RegExp(r'^[6-9]\d{9}$').hasMatch(value);
                          if (isValidNow != _isValid) {
                            setState(() => _isValid = isValidNow);
                          }
                        },
                        decoration: InputDecoration(
                          counterText: "",
                          hintText: Strings.enterMobile,
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(48.r),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 14.h),
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: Icon(
                              Icons.phone,
                              color: AppThemes.neutral60,
                            ),
                          ),
                          prefixIconConstraints: BoxConstraints(
                            minWidth: 40.w,
                            minHeight: 40.h,
                          ),
                          suffixIcon: _isValid
                              ? Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.w),
                                  child: Icon(
                                    Icons.check_circle,
                                    color: AppThemes.tickColor,
                                    size: 20.sp,
                                  ),
                                )
                              : null,
                          suffixIconConstraints: BoxConstraints(
                            minWidth: 40.w,
                            minHeight: 40.h,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return Strings.err_enter_mobile_for_empty;
                          }
                          if (!RegExp(r'^[6-9]\d{9}$').hasMatch(value)) {
                            return Strings.err_enter_mobile_for_valid;
                          }
                          return null; // valid
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 0.h, 16.w, 32.h),
              child: GestureDetector(
                onTap: () {
                  if (_formKey.currentState?.validate() ?? false) {}
                },
                child: Container(
                  padding: EdgeInsets.all(16.w),
                  width: double.infinity,
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: AppThemes.primaryColor,
                    borderRadius: BorderRadius.circular(32.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Strings.getOtp,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
