import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CavalosGaleriaRecord extends FirestoreRecord {
  CavalosGaleriaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "foto" field.
  String? _foto;
  String get foto => _foto ?? '';
  bool hasFoto() => _foto != null;

  // "cavalo" field.
  DocumentReference? _cavalo;
  DocumentReference? get cavalo => _cavalo;
  bool hasCavalo() => _cavalo != null;

  void _initializeFields() {
    _foto = snapshotData['foto'] as String?;
    _cavalo = snapshotData['cavalo'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cavalos_galeria');

  static Stream<CavalosGaleriaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CavalosGaleriaRecord.fromSnapshot(s));

  static Future<CavalosGaleriaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CavalosGaleriaRecord.fromSnapshot(s));

  static CavalosGaleriaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CavalosGaleriaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CavalosGaleriaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CavalosGaleriaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CavalosGaleriaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CavalosGaleriaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCavalosGaleriaRecordData({
  String? foto,
  DocumentReference? cavalo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'foto': foto,
      'cavalo': cavalo,
    }.withoutNulls,
  );

  return firestoreData;
}

class CavalosGaleriaRecordDocumentEquality
    implements Equality<CavalosGaleriaRecord> {
  const CavalosGaleriaRecordDocumentEquality();

  @override
  bool equals(CavalosGaleriaRecord? e1, CavalosGaleriaRecord? e2) {
    return e1?.foto == e2?.foto && e1?.cavalo == e2?.cavalo;
  }

  @override
  int hash(CavalosGaleriaRecord? e) =>
      const ListEquality().hash([e?.foto, e?.cavalo]);

  @override
  bool isValidKey(Object? o) => o is CavalosGaleriaRecord;
}
