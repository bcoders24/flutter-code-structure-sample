// import 'dart:io';
// import 'dart:typed_data';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:pixtra/common_widget/app_text.dart';
// import 'package:pixtra/utils/app_color.dart';
// import 'package:pixtra/utils/utils.dart';
//
//
// import 'cropper/ui_helper.dart'
// if (dart.library.io) 'cropper/mobile_ui_helper.dart'
// if (dart.library.html) 'cropper/web_ui_helper.dart';
//
// abstract class CameraOnCompleteListener {
//   void onSuccessFile(File file, String fileType);
//   void onSuccessWebFile(File file, Uint8List uint8list, String fileType);
// }
//
// class CameraHelper{
//   final picker = ImagePicker();
//   BuildContext context =  Get.context!;
//   CropAspectRatioPreset? cropAspectRatioPreset;
//   CropStyle? cropStyle;
//   late CameraOnCompleteListener callback;
//
//   CameraHelper(this.callback);
//
//   void setCropping(CropAspectRatioPreset cropAspectRatioPreset) {
//     this.cropAspectRatioPreset = cropAspectRatioPreset;
//
//   }
//   void setCroppingWithCircle(CropStyle cropStyle) {
//     this.cropStyle = cropStyle;
//
//   }
//
//   void openAttachmentDialog() async {
//     if (await isStorageEnabled()) {
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         type: FileType.custom,
//         allowedExtensions: [
//           'pdf',
//           'docx',
//           'xlsx',
//           'pptx',
//           'doc',
//           'xls',
//           'ppt',
//           'txt'
//         ],
//       );
//
//       if (result != null) {
//         File file = File(result.files.single.path!);
//         debugPrint(file.path);
//         callback.onSuccessFile(file, "document");
//       } else {
//         // User canceled the picker
//       }
//     }
//   }
//
//   //for picking image from camera and gallery
//   void openImagePicker() {
//     showModalBottomSheet(
//       context: context,
//       useRootNavigator: false,
//       backgroundColor: Colors.transparent,
//       builder: (BuildContext bc) => GestureDetector(
//         child: Container(
//           margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//           padding: const EdgeInsets.symmetric(
//             vertical: 15,
//           ),
//           decoration: const BoxDecoration(
//               color: AppColor.blueE5EDFD,
//               shape: BoxShape.rectangle,
//               borderRadius: BorderRadius.all(Radius.circular(30))),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   GestureDetector(
//                     child: Column(
//                       children: [
//                         Container(
//                           height: 50,
//                           width: 50,
//                           decoration: const BoxDecoration(
//                               color: AppColor.white,
//                               shape: BoxShape.circle,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Color(0x194A841C),
//                                   offset: Offset(0.0, 1.0), //(x,y)
//                                   blurRadius: 19,
//                                 ),
//                               ]),
//                           child: const Icon(
//                             Icons.camera_alt_rounded,
//                             size: 25,
//                             color: AppColor.primary,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         const Text(
//                           "Camera",
//                           style: TextStyle(
//                               color: AppColor.primary,
//                               fontWeight: FontWeight.w500,
//                               fontSize: 12),
//                         )
//                       ],
//                     ),
//                     onTap: () async {
//                       if (await isCameraEnabled()) {
//                         Navigator.pop(context);
//                         if(cropAspectRatioPreset !=null || cropStyle!=null){
//                           if(cropStyle!=null){
//                             getImageWithCircleCropping(ImageSource.camera);
//                           }else{
//                             getImageWithCropping(ImageSource.camera);
//                           }
//                         }else{
//                           getImageWithoutCropping(ImageSource.camera);
//                         }
//                       }
//                     },
//                   ),
//                   const SizedBox(
//                     width: 60,
//                   ),
//                   GestureDetector(
//                     child: Column(
//                       children: [
//                         Container(
//                           height: 50,
//                           width: 50,
//                           decoration: const BoxDecoration(
//                               color: AppColor.white,
//                               shape: BoxShape.circle,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Color(0x194A841C),
//                                   offset: Offset(0.0, 1.0), //(x,y)
//                                   blurRadius: 19,
//                                 ),
//                               ]),
//                           child: const Icon(
//                             Icons.image_rounded,
//                             size: 25,
//                             color: AppColor.primary,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         const Text(
//                           "Gallery",
//                           style: TextStyle(
//                               color: AppColor.primary,
//                               fontWeight: FontWeight.w500,
//                               fontSize: 12),
//                         )
//                       ],
//                     ),
//                     onTap: () async {
//                       if (await isStorageEnabled()) {
//                         Navigator.pop(context);
//                         if(cropAspectRatioPreset !=null || cropStyle!=null){
//                           if(cropStyle!=null){
//                             getImageWithCircleCropping(ImageSource.gallery);
//                           }else{
//                             getImageWithCropping(ImageSource.gallery);
//                           }
//                         }else{
//                           getImageWithoutCropping(ImageSource.gallery);
//                         }
//
//                       }
//                     },
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               InkWell(
//                 child: const Padding(
//                   padding: EdgeInsets.all(13.0),
//                   child: Text(
//                     "Cancel",
//                     style: TextStyle(
//                       color: AppColor.black,
//                       fontWeight: FontWeight.normal,
//                       fontSize: 14,
//                       decoration: TextDecoration.underline,
//                       decorationColor: AppColor.primary
//                     ),
//                   ),
//                 ),
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//               )
//             ],
//           ),
//         ),
//         onTap: () {
//           FocusScope.of(context).requestFocus(FocusScopeNode());
//         },
//       ),
//     );
//   }
//
//   Future getImageWithCropping(ImageSource imageSource) async {
//     XFile? imageFile = await picker.pickImage(source: imageSource,imageQuality: 50);
//     CroppedFile? croppedFile ;
//     if(imageFile!=null) {
//       croppedFile = await ImageCropper().cropImage(
//           sourcePath: imageFile.path,
//           aspectRatioPresets: [
//             cropAspectRatioPreset!,
//           ],
//           uiSettings:buildUiSettings(context),
//           compressQuality: 50
//       );
//     }
//
//     if (croppedFile != null) {
//       if(GetPlatform.isWeb){
//         callback.onSuccessWebFile(File(croppedFile.path), await croppedFile.readAsBytes(),"image");
//       }else{
//         callback.onSuccessFile(File(croppedFile.path), "image");
//       }
//     } else {
//       print('No image selected.');
//     }
//   }
//
//   Future<File?> cropImage(CropAspectRatioPreset? cropAspectRatioPreset, File imageFile) async {
//     CroppedFile? croppedFile;
//     croppedFile = await ImageCropper().cropImage(
//         sourcePath: imageFile.path,
//         // aspectRatioPresets: [
//         //   cropAspectRatioPreset!,
//         // ],
//         uiSettings:buildUiSettings(context),
//         compressQuality: 50
//     );
//
//     if (croppedFile != null) {
//       return File(croppedFile.path);
//     } else {
//       return null;
//     }
//   }
//
//   Future getImageWithCircleCropping(ImageSource imageSource) async {
//     XFile? imageFile = await picker.pickImage(source: imageSource,imageQuality: 50);
//     CroppedFile? croppedFile ;
//     if(imageFile!=null) {
//       croppedFile = await ImageCropper().cropImage(
//           sourcePath: imageFile.path,
//
//           cropStyle: cropStyle!, uiSettings:buildUiSettings(context),
//           compressQuality: 50
//       );
//     }
//
//     if (croppedFile != null) {
//       if(GetPlatform.isWeb){
//         callback.onSuccessWebFile(File(croppedFile.path), await croppedFile.readAsBytes(),"image");
//       }else{
//         callback.onSuccessFile(File(croppedFile.path), "image");
//       }
//     } else {
//       print('No image selected.');
//     }
//   }
//
//
//   Future getImageWithoutCropping(ImageSource imageSource) async {
//     XFile? imageFile;
//     imageFile = await picker.pickImage(source: imageSource,imageQuality: 20);
//     if (imageFile != null) {
//       if(GetPlatform.isWeb){
//         callback.onSuccessWebFile(File(imageFile.path), await imageFile.readAsBytes(),"image");
//       }else{
//         callback.onSuccessFile(File(imageFile.path), "image");
//       }
//     }else {
//       print('No image selected.');
//     }
//   }
//
//
//   Future<bool> isCameraEnabled() async {
//     if(GetPlatform.isAndroid || GetPlatform.isWeb) {
//       return true;
//     }
//     var status = await Permission.camera.request();
//     print("status: " + status.toString());
//     if (status == PermissionStatus.permanentlyDenied) {
//       // Utils.showSnackBar(
//       //     "Camera permission permanently denied, we are redirecting to you setting screen to enable permission");
//       // Future.delayed(const Duration(seconds: 4), () {
//       //   openAppSettings();
//       // });
//       dialogForOpenSetting();
//       return false;
//     } else if (status == PermissionStatus.granted) {
//       return true;
//     } else {
//       return false;
//     }
//   }
//
//   Future<bool> isStorageEnabled() async {
//     if(GetPlatform.isAndroid || GetPlatform.isWeb) {
//       return true;
//     }
//     PermissionStatus status;
//     if (Platform.isAndroid) {
//       status = await Permission.storage.request();
//     } else {
//       status = await Permission.photos.request();
//     }
//     print("status: " + status.toString());
//     if (Platform.isAndroid) {
//       if (status == PermissionStatus.permanentlyDenied) {
//         Utils.showSnackBar(
//             "Storage permission permanently denied, we are redirecting to you setting screen to enable permission");
//         Future.delayed(const Duration(seconds: 4), () {
//           openAppSettings();
//         });
//         return false;
//       } else if (status == PermissionStatus.granted) {
//         return true;
//       } else {
//         return false;
//       }
//     } else {
//       if (status == PermissionStatus.permanentlyDenied) {
//         Utils.showSnackBar(
//             "Photos permission permanently denied, we are redirecting to you setting screen to enable permission");
//         Future.delayed(const Duration(seconds: 4), () {
//           openAppSettings();
//         });
//         return false;
//       } else if (status == PermissionStatus.granted ||
//           status == PermissionStatus.limited) {
//         return true;
//       } else {
//         return false;
//       }
//     }
//   }
//
//   Future dialogForOpenSetting() {
//     return showDialog(
//         context: Get.context!,
//         builder: (BuildContext context) {
//           return Dialog(
//             insetPadding: EdgeInsets.only(left: 20.w,right: 20.w,bottom: 20.h),
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20.0)), //this right here
//             child: SizedBox(
//               height: 160.h,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: 5.h,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 15.w,right: 15.w),
//                     child: AppText(
//                       text: "Photos permission permanently denied, we are redirecting to you setting screen to enable permission.",
//                       style: AppTextStyle.regular,textAlign: TextAlign.center,
//                       textSize: 15.sp,lineHeight: 1.7,
//                       color: AppColor.black,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 25.h,
//                   ),
//
//                   Padding(
//                     padding: EdgeInsets.only(left: 20.w,right: 20.w),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         GestureDetector(
//                           onTap: (){
//                             Get.back();
//                           },
//                           child: AppText(
//                             text: "Cancel",
//                             style: AppTextStyle.regular,
//                             textSize: 15.sp,
//                             color: AppColor.iconColor,
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: (){
//                             openAppSettings();
//                           },
//                           child: AppText(
//                             text: "Go to Setting",
//                             style: AppTextStyle.medium,
//                             textSize: 15.sp,
//                             color: AppColor.iconColor,
//                           ),
//                         ),
//
//                       ],
//                     ),
//                   )
//
//                 ],
//               ),
//             ),
//           );
//         });
//   }
//
// }