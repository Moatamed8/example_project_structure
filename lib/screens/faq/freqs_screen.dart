import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamyez/screens/widgets/text.dart';
import 'package:tamyez/utils/ColorsUtils.dart';
import 'package:tamyez/viewmodel/auth_provider.dart';

class FrqsScreen extends StatefulWidget {
  const FrqsScreen({Key key}) : super(key: key);

  @override
  _FrqsScreenState createState() => _FrqsScreenState();
}

class _FrqsScreenState extends State<FrqsScreen> {
  @override
  void initState() {
    AuthProvider.of(context).getFaq(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsUtils.tamyez,
          title: CustomText(
            text: "الاسئلة الشائعه",
            color: ColorsUtils.whiteColor,
            fontSize: 20,
          ),
        ),
        body: AuthProvider.of(context, listen: true).isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                padding: EdgeInsets.only(bottom: 10.h,top: 10),
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: AuthProvider.of(context).faqs.length,
                      itemBuilder: (context, index) => Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    AuthProvider.of(context)
                                            .faqs[index]
                                            .isSelect =
                                        !AuthProvider.of(context)
                                            .faqs[index]
                                            .isSelect;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: ColorsUtils.whiteColor,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromRGBO(
                                                0, 64, 128, 0.04),
                                            offset: Offset(0, 5),
                                            blurRadius: MediaQuery.of(context)
                                                    .size
                                                    .aspectRatio *
                                                10),
                                      ]),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            text: AuthProvider.of(context)
                                                .faqs[index]
                                                .question,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          AuthProvider.of(context)
                                                  .faqs[index]
                                                  .isSelect
                                              ? Icon(
                                                  Icons
                                                      .keyboard_arrow_down_outlined,
                                                  color: ColorsUtils.greyColor,
                                                  size: 23.sp,
                                                )
                                              : Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: ColorsUtils.greyColor,
                                                  size: 15.sp,
                                                ),
                                        ],
                                      ),
                                      AuthProvider.of(context)
                                              .faqs[index]
                                              .isSelect
                                          ? SizedBox(
                                              height: 16.h,
                                            )
                                          : SizedBox(),
                                      AuthProvider.of(context)
                                          .faqs[index]
                                          .isSelect
                                          ?Divider():SizedBox(),
                                      AuthProvider.of(context)
                                              .faqs[index]
                                              .isSelect
                                          ? Wrap(
                                              children: [
                                                Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    AuthProvider.of(context)
                                                        .faqs[index]
                                                        .answer,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 15.sp,
                                                        color: ColorsUtils
                                                            .blackColor),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : SizedBox(),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                            ],
                          ))
                ],
              ),
      ),
    );
  }
}
