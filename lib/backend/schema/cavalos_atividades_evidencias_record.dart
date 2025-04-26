import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CavalosAtividadesEvidenciasRecord extends FirestoreRecord {
  CavalosAtividadesEvidenciasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "atividadeRef" field.
  DocumentReference? _atividadeRef;
  DocumentReference? get atividadeRef => _atividadeRef;
  bool hasAtividadeRef() => _atividadeRef != null;

  // "foto" field.
  String? _foto;
  String get foto => _foto ?? '';
  bool hasFoto() => _foto != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "profissional" field.
  DocumentReference? _profissional;
  DocumentReference? get profissional => _profissional;
  bool hasProfissional() => _profissional != null;

  // "cavalo" field.
  DocumentReference? _cavalo;
  DocumentReference? get cavalo => _cavalo;
  bool hasCavalo() => _cavalo != null;

  void _initializeFields() {
    _atividadeRef = snapshotData['atividadeRef'] as DocumentReference?;
    _foto = snapshotData['foto'] as String?;
    _descricao = snapshotData['descricao'] as String?;
    _data = snapshotData['data'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _profissional = snapshotData['profissional'] as DocumentReference?;
    _cavalo = snapshotData['cavalo'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cavalos_atividades_evidencias');

  static Stream<CavalosAtividadesEvidenciasRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => CavalosAtividadesEvidenciasRecord.fromSnapshot(s));

  static Future<CavalosAtividadesEvidenciasRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CavalosAtividadesEvidenciasRecord.fromSnapshot(s));

  static CavalosAtividadesEvidenciasRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      CavalosAtividadesEvidenciasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CavalosAtividadesEvidenciasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CavalosAtividadesEvidenciasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CavalosAtividadesEvidenciasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CavalosAtividadesEvidenciasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCavalosAtividadesEvidenciasRecordData({
  DocumentReference? atividadeRef,
  String? foto,
  String? descricao,
  DateTime? data,
  String? phoneNumber,
  DocumentReference? profissional,
  DocumentReference? cavalo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'atividadeRef': atividadeRef,
      'foto': foto,
      'descricao': descricao,
      'data': data,
      'phone_number': phoneNumber,
      'profissional': profissional,
      'cavalo': cavalo,
    }.withoutNulls,
  );

  return firestoreData;
}

class CavalosAtividadesEvidenciasRecordDocumentEquality
    implements Equality<CavalosAtividadesEvidenciasRecord> {
  const CavalosAtividadesEvidenciasRecordDocumentEquality();

  @override
  bool equals(CavalosAtividadesEvidenciasRecord? e1,
      CavalosAtividadesEvidenciasRecord? e2) {
    return e1?.atividadeRef == e2?.atividadeRef &&
        e1?.foto == e2?.foto &&
        e1?.descricao == e2?.descricao &&
        e1?.data == e2?.data &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.profissional == e2?.profissional &&
        e1?.cavalo == e2?.cavalo;
  }

  @override
  int hash(CavalosAtividadesEvidenciasRecord? e) => const ListEquality().hash([
        e?.atividadeRef,
        e?.foto,
        e?.descricao,
        e?.data,
        e?.phoneNumber,
        e?.profissional,
        e?.cavalo
      ]);

  @override
  bool isValidKey(Object? o) => o is CavalosAtividadesEvidenciasRecord;
}
