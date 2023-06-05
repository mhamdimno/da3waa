// import 'dart:async';
// import 'dart:convert';
//
// import 'package:flutter/foundation.dart';
// import 'package:da3wa/app/extentions/dynamics_extentions.dart';
// import 'package:da3wa/app/extentions/strings_extentions.dart';
// import 'package:da3wa/app/extentions/lists_extentions.dart';
//
// import 'dart:developer';
//
// import 'package:da3wa/data/network/appUrls.dart';
// import 'package:dio/dio.dart' as d;
// import 'package:da3wa/app/my_res.dart';
// import 'package:da3wa/data/mapper/paramters_keys.dart';
// import 'package:da3wa/presentation/modules/login/login_sc.dart';
//
// import '../../app/enums.dart';
//
// import '../../app/functios.dart';
// import '../../presentation/effects/animations.dart';
// import '../../presentation/modules/dashboard/dashboard_con.dart';
// import '../../presentation/widgets/dialogs_managar.dart';
// import '../../presentation/resources/toasts_managers.dart';
// import '../mapper/decodable.dart';
//
// class NetWorkLayer {
//
//
//   _goToLoginScreen(){
//     // AppToasts.showInfo(
//     //     AppStrings.needtologin);
//     Timer(Duration(seconds: AppConstants.splashDelay),
//             () {
//           AppStorage.logout();
//           AppNavigation.ToRouteScreen();
//         });
//   }
//   Map<String, String> _headers = {};
//
//   Future<ResponseWrapper<T>?> request<T extends Decodable>(
//        String url,  Create<T> create,
//       {
//         Map<String, String?>? parms,
//       Map<String, dynamic>? headers,
//       bool showLoading = true,
//       List<String?>? arrFiles,
//       String arrFileNames = "images",
//       String? file,
//       ApiType method = ApiType.post,
//       String fileName = "avatar",
//       bool showToast = true,
//       bool? is_reversed_app_type,
//       bool showSucssed = false,
//       List? inputs,
//       bool backWhenSuccess = false,
//       bool need_token = false,
//       bool go_to_root = false}) async {
//     bool isStopValidate = false;
//     if (AppStorage.token.is_null && need_token){
//       return null;
//     }
//     if (inputs.validateInputs() == false) {
//       AppToasts.showError(AppStrings.fillAllField);
//       isStopValidate = true;
//       return null;
//     }
//
//
//
//     if (parms != null) {
//       parms.forEach((k, v) {
//         if (!v.isNullOrEmpty) {
//           if (v.toEnglishNumbers().isNumber) {
//             parms[k] = v.toEnglishNumbers();
//           }
//         }
//       });
//       parms.forEach((k, v) {
//         if (k.contains(ParametersKeys.phone) &&
//             !v.toString().isNullOrEmpty &&
//             v.toEnglishNumbers().toString().isNotPhone == true &&
//             !isStopValidate) {
//           AppToasts.showError(AppStrings.phonenotvalidate, showToast: showToast);
//           isStopValidate = true;
//         }
//       });
//     }
//
//     if (!isStopValidate) {
//       if (showLoading) {
//         DialogsManager.showProgress();
//       }
//
//       var fullUrl = url;
//
//       Map<String, dynamic> staticParms = {
//         // "device_type": Platform.isAndroid ? "android" : "ios",
//         // "OsVer": deviceinfo['OsVer'],
//         // "uuid": deviceinfo["Mac"],
//         // "Model": deviceinfo["Model"],
//         // "Manufacturer": deviceinfo["Manufacturer"],
//         // "type": AppStorage.type.toString().reversed(is_reversed_app_type),
//         // "is_client": AppStorage.type == kys.client.s ? "1" : "0",
//         // "device_id": AppStorage.tokenID
//       };
//       print('🎒xurl ${AppUrls.main + fullUrl}');
//
//       print('🎒 xparmonly ${parms}');
//       print('🎒staticParms ${staticParms}');
//
//       if (parms != null) {
//         staticParms.addAll(parms);
//       }
//
//       try {
//         d.FormData? formData;
//         if (file != null) {
//           formData = d.FormData.fromMap({
//             fileName: await d.MultipartFile.fromFile(file,
//                 filename: "${generateRandomNumber}${file.suffix}"),
//           });
//           print('🙄 xfiles ${formData.files.toString()}');
//         }
//
//         if (arrFiles != null) {
//           formData = d.FormData.fromMap({
//             arrFileNames: [
//               for (var file in arrFiles)
//                 {
//                   await d.MultipartFile.fromFile(file ?? "",
//                       filename: "${generateRandomNumber}${file?.suffix ?? ""}")
//                 }.toList()
//             ]
//           });
//
//           print('🙄 xfiles ${formData.files.toString()}');
//         }
//         _headers['lang'] = ConstantType.en.toStringEnumKey;
//         _headers['content-type'] = "application/json";
//         if (!AppStorage.is_not_login) {
//           _headers['Authorization'] = "Bearer ${AppStorage.token}";
//         }
//         log('🎒headers ${_headers}');
//
//         d.Options options = d.Options(
//             responseType: d.ResponseType.plain,
//             headers: _headers,
//             contentType: d.Headers.jsonContentType);
//
//         d.Dio dio = d.Dio();
//
//         var response = method == ApiType.post
//             ? await dio.post(AppUrls.main + fullUrl,
//                 data: staticParms, options: options)
//             : method == ApiType.put
//                 ? await dio.put(AppUrls.main + fullUrl,
//                     queryParameters: staticParms, options: options)
//                 : await dio.get(AppUrls.main + fullUrl,
//                     queryParameters: staticParms, options: options);
//
//         print('🎒 statusCode ${response.statusCode}');
//         if (showLoading) {
//           DialogsManager.dismissProgress();
//
//         }
//         try {
//           final responseData = json.decode(response.data);
//           log('🎒 xjson ${responseData}');
//           // DialogsManager.dismissProgress();
// switch (response.statusCode) {
//     case 200:
//         if (method == ApiType.get) {
//           isInSameScreen.value = false;
//         }
//         String? key = responseData[ConstantType.key.toStringEnumKey];
//         if (key == ConstantType.fail.toStringEnumKey || key == ConstantType.failed.toStringEnumKey ||
//             key == ConstantType.exception.toStringEnumKey) {
//           print(',,,,,,,,,,,,,,,,,,,,,,,,,,,,,');
//           if (showToast) {
//             AppToasts.showError(
//                 "for ($url)  ${responseData[ConstantType.msg.toStringEnumKey]}");
//           }
//           return null;
//           //return null;
//         } else {
//           if (showSucssed) {
//             AppToasts.showMessage(
//                 "${responseData[ConstantType.msg.toStringEnumKey]} ");
//           }
//           if (backWhenSuccess) {
//             AppToasts.showMessage(
//                 "${responseData[ConstantType.msg.toStringEnumKey]}");
//             Timer(
//                 Duration(seconds: AppConstants.splashDelay),
//                     () => AppNavigation.pop()
//             );
//             return null;
//           }
//           if (go_to_root) {
//             AppToasts.showMessage(
//                 "${responseData[ConstantType.msg.toStringEnumKey]}");
//             Timer(Duration(seconds: AppConstants.splashDelay),
//                     () {
//                   Get.lazyPut(() => DashboardController());
//                   Get.find<DashboardController>().packegesAPI();
//                   AppNavigation.ToRouteScreen();
//                 });
//             return null;
//           } else {
//             return ResponseWrapper.init(create: create, json: responseData);
//           }
//         }
//     case 401:
//       _goToLoginScreen();
//       break;
//
//
//
//     default:
//       if (showLoading) {
//         DialogsManager.dismissProgress();
//
//       }
//       if (showToast) {
//         AppToasts.showError(
//             "${AppStrings.serverError} -> ${response.statusCode} for ($url)");
//       }
//       return null;
// }
//
//
//         } on FormatException catch (e) {
//           print('The provided string is not valid JSON');
//           if (showSucssed) {
//             AppToasts.showError(e.message);
//           }
//           return null;
//         }
//       } on d.DioError catch (e) {
//         if (e.response?.statusCode==401 || e.response?.statusCode==403){
//           _goToLoginScreen();
//         }else{
//           if (showLoading) {
//             DialogsManager.dismissProgress();
//
//           }
//           if (showToast) {
//             AppToasts.showError("${e.message}");
//           }
//         }
//
//         return null;
//
//       }
//     }
//   }
// }
