import 'dart:io';

import 'package:epasys_app/models/user_model.dart';
import 'package:epasys_app/providers/auth_provider.dart';
import 'package:epasys_app/shared/image_helper.dart';
import 'package:epasys_app/shared/theme.dart';
import 'package:epasys_app/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UploadAvatarPage extends StatefulWidget {
  const UploadAvatarPage({super.key});

  @override
  State<UploadAvatarPage> createState() => _UploadAvatarPageState();
}

class _UploadAvatarPageState extends State<UploadAvatarPage> {
  File? _image;
  final _imageHelper = ImageHelper();

  @override
  Widget build(BuildContext context) {
    // AuthProvider authProvider = Provider.of<AuthProvider>(context);
    // UserModel user = authProvider.user;
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: Container(
        margin: const EdgeInsets.only(top: 70),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        width: double.infinity,
        child: Column(
          children: [
            Text(
              'Image Profile',
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: bold,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              'Upload your image profile',
              style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: greyColor2),
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Stack(
                      children: [
                        FittedBox(
                          fit: BoxFit.contain,
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            foregroundImage:
                                _image != null ? FileImage(_image!) : null,
                            radius: 64,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            final files = await _imageHelper.pickImage();
                            if (files.isNotEmpty) {
                              final croppedFile = await _imageHelper.crop(
                                file: files.first!,
                                cropStyle: CropStyle.circle,
                              );

                              if (croppedFile != null) {
                                setState(() {
                                  _image = File(croppedFile.path);
                                });
                                print(_image!.path);
                              }
                            }
                          },
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: blueColor,
                                border: Border.all(
                                  color: whiteColor,
                                  width: 3,
                                ),
                              ),
                              child: Icon(
                                Icons.add,
                                color: whiteColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Candi Agusta',
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'E41212152',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          title: 'Upload',
                          color: blueColor,
                          onPressed: () async {},
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CustomButton(
                          title: 'Skip',
                          textColor: greyColor,
                          color: lightBackgroundColor,
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/main', (route) => false);
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget headerSection() {
  //   return Container(
  //     margin: const EdgeInsets.only(top: 70),
  //     padding: const EdgeInsets.symmetric(
  //       horizontal: 24,
  //     ),
  //     width: double.infinity,
  //     child: Column(
  //       children: [
  //         Text(
  //           'Image Profile',
  //           style: blackTextStyle.copyWith(
  //             fontSize: 24,
  //             fontWeight: bold,
  //           ),
  //         ),
  //         const SizedBox(
  //           height: 2,
  //         ),
  //         Text(
  //           'Upload your image profile',
  //           style: greyTextStyle.copyWith(
  //             fontSize: 16,
  //             fontWeight: semiBold,
  //           ),
  //         ),
  //         const SizedBox(
  //           height: 30,
  //         ),
  //         Container(
  //           width: double.infinity,
  //           padding: const EdgeInsets.all(16),
  //           decoration: BoxDecoration(
  //             color: whiteColor,
  //             borderRadius: BorderRadius.circular(10),
  //             border: Border.all(color: greyColor2),
  //           ),
  //           child: Column(
  //             children: [
  //               SizedBox(
  //                 width: 100,
  //                 height: 100,
  //                 child: Stack(
  //                   children: [
  //                     CircleAvatar(
  //                       backgroundColor: Colors.grey,
  //                       foregroundImage: _image != null ? FileImage(_image.),
  //                     )
  //                     Align(
  //                       alignment: Alignment.bottomRight,
  //                       child: GestureDetector(
  //                         onTap: () async {
  //                           await getImage();
  //                         },
  //                         child: Container(
  //                           width: 40,
  //                           height: 40,
  //                           decoration: BoxDecoration(
  //                             shape: BoxShape.circle,
  //                             color: blueColor,
  //                             border: Border.all(
  //                               color: whiteColor,
  //                               width: 3,
  //                             ),
  //                           ),
  //                           child: Icon(
  //                             Icons.add,
  //                             color: whiteColor,
  //                           ),
  //                         ),
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //               ),
  //               const SizedBox(
  //                 height: 24,
  //               ),
  //               Text(
  //                 'Candi Agusta',
  //                 style: blackTextStyle.copyWith(
  //                   fontSize: 20,
  //                   fontWeight: bold,
  //                 ),
  //               ),
  //               const SizedBox(
  //                 height: 5,
  //               ),
  //               Text(
  //                 'E41212152',
  //                 style: greyTextStyle.copyWith(
  //                   fontSize: 16,
  //                   fontWeight: semiBold,
  //                 ),
  //               ),
  //               const SizedBox(
  //                 height: 24,
  //               ),
  //               Row(
  //                 children: [
  //                   Expanded(
  //                     child: CustomButton(
  //                       title: 'Upload',
  //                       color: blueColor,
  //                       onPressed: () async {
  //                         await getImage();
  //                       },
  //                     ),
  //                   ),
  //                   const SizedBox(
  //                     width: 10,
  //                   ),
  //                   Expanded(
  //                     child: CustomButton(
  //                       title: 'Skip',
  //                       textColor: greyColor,
  //                       color: lightBackgroundColor,
  //                       onPressed: () {
  //                         Navigator.pushNamedAndRemoveUntil(
  //                             context, '/main', (route) => false);
  //                       },
  //                     ),
  //                   ),
  //                 ],
  //               )
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
