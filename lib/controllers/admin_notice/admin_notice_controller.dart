import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_application/model/admin_notice/admin_notice_model.dart';
import 'package:get/get.dart';

class AdminNoticeController extends GetxController {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<List<AdminNoticeModel>> getNoticeData(String schoolId) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> noticeData =
          await firebaseFirestore
              .collection('SchoolListCollection')
              .doc(schoolId)
              .collection('adminNotice')
              .get();

      List<AdminNoticeModel> adminNoticeModel = noticeData.docs.map((e) {
        return AdminNoticeModel.fromJson(e.data());
      }).toList();
      return adminNoticeModel;
    } catch (e) {
      return [];
    }
  }
}
