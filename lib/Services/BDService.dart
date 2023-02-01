import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:project2/Models/JobModel.dart';
import 'package:project2/Models/ProfilModel.dart';

import '../Models/JobeurModel.dart';

class BdService {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<String> get term async {
    String content = "";
    DocumentReference documentReference =
        _firebaseFirestore.collection('jobs').doc('job1');
    content = (await documentReference.get()).get('jobName');
    return content;
  }

  /*FirebaseFirestore _firebaseFirestore1 = FirebaseFirestore.instance;
  Future<String> get term1 async {
    String content = "";
    DocumentReference documentReference =
        _firebaseFirestore.collection('jobeurs').doc('jobeurs1');
    content = (await documentReference.get()).get('jobeurName');
    return content;
  }*/

  CollectionReference _jobs = FirebaseFirestore.instance.collection('jobs');
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Stream<List<Job>> get jobs {
    Query queryJobs = _jobs.orderBy('jobName', descending: true);
    return queryJobs.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Job(
          JobName: doc.get('jobName'), /* JobImage: doc.get('jobImage')*/
        );
      }).toList();
    });
  }

  CollectionReference _jobeurs =
      FirebaseFirestore.instance.collection('jobeurs');
  //FirebaseStorage _firebaseStorage2 = FirebaseStorage.instance;

  Stream<List<Jobeur>> get jobeurs {
    Query queryJobeurs = _jobeurs.orderBy('jobeurName', descending: true);
    return queryJobeurs.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Jobeur(
            JobeurCity: doc.get('jobeurCity'),
            JobeurName: doc.get('jobeurName'),
            JobeurLastName: doc.get('jobeurLastName'),
            JobeurNumber: doc.get('jobeurNumber'));
      }).toList();
    });
  }

  /*CollectionReference _profils =
      FirebaseFirestore.instance.collection('profils');
  //FirebaseStorage _firebaseStorage2 = FirebaseStorage.instance;

  Stream<List<Profil>> get profils {
    Query queryProfils = _profils.orderBy('jobeurNumber', descending: true);
    return queryProfils.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Profil(
          JobeurNumber: doc.get('jobeurNumber'),
        );
      }).toList();
    });
  }*/
}
