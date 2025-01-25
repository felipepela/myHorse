import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CavalosConsultasRecord extends FirestoreRecord {
  CavalosConsultasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "consulta" field.
  String? _consulta;
  String get consulta => _consulta ?? '';
  bool hasConsulta() => _consulta != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "foto" field.
  String? _foto;
  String get foto => _foto ?? '';
  bool hasFoto() => _foto != null;

  // "cavalo" field.
  DocumentReference? _cavalo;
  DocumentReference? get cavalo => _cavalo;
  bool hasCavalo() => _cavalo != null;

  // "profissional" field.
  DocumentReference? _profissional;
  DocumentReference? get profissional => _profissional;
  bool hasProfissional() => _profissional != null;

  // "dono" field.
  DocumentReference? _dono;
  DocumentReference? get dono => _dono;
  bool hasDono() => _dono != null;

  void _initializeFields() {
    _data = snapshotData['data'] as DateTime?;
    _consulta = snapshotData['consulta'] as String?;
    _descricao = snapshotData['descricao'] as String?;
    _foto = snapshotData['foto'] as String?;
    _cavalo = snapshotData['cavalo'] as DocumentReference?;
    _profissional = snapshotData['profissional'] as DocumentReference?;
    _dono = snapshotData['dono'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cavalos_consultas');

  static Stream<CavalosConsultasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CavalosConsultasRecord.fromSnapshot(s));

  static Future<CavalosConsultasRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CavalosConsultasRecord.fromSnapshot(s));

  static CavalosConsultasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CavalosConsultasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CavalosConsultasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CavalosConsultasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CavalosConsultasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CavalosConsultasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCavalosConsultasRecordData({
  DateTime? data,
  String? consulta,
  String? descricao,
  String? foto,
  DocumentReference? cavalo,
  DocumentReference? profissional,
  DocumentReference? dono,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'data': data,
      'consulta': consulta,
      'descricao': descricao,
      'foto': foto,
      'cavalo': cavalo,
      'profissional': profissional,
      'dono': dono,
    }.withoutNulls,
  );

  return firestoreData;
}

class CavalosConsultasRecordDocumentEquality
    implements Equality<CavalosConsultasRecord> {
  const CavalosConsultasRecordDocumentEquality();

  @override
  bool equals(CavalosConsultasRecord? e1, CavalosConsultasRecord? e2) {
    return e1?.data == e2?.data &&
        e1?.consulta == e2?.consulta &&
        e1?.descricao == e2?.descricao &&
        e1?.foto == e2?.foto &&
        e1?.cavalo == e2?.cavalo &&
        e1?.profissional == e2?.profissional &&
        e1?.dono == e2?.dono;
  }

  @override
  int hash(CavalosConsultasRecord? e) => const ListEquality().hash([
        e?.data,
        e?.consulta,
        e?.descricao,
        e?.foto,
        e?.cavalo,
        e?.profissional,
        e?.dono
      ]);

  @override
  bool isValidKey(Object? o) => o is CavalosConsultasRecord;
}
