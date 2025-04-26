import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CavalosMedicacoesRecord extends FirestoreRecord {
  CavalosMedicacoesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "consulta" field.
  DocumentReference? _consulta;
  DocumentReference? get consulta => _consulta;
  bool hasConsulta() => _consulta != null;

  // "medicamento" field.
  String? _medicamento;
  String get medicamento => _medicamento ?? '';
  bool hasMedicamento() => _medicamento != null;

  // "foto" field.
  String? _foto;
  String get foto => _foto ?? '';
  bool hasFoto() => _foto != null;

  // "modo_de_usar" field.
  String? _modoDeUsar;
  String get modoDeUsar => _modoDeUsar ?? '';
  bool hasModoDeUsar() => _modoDeUsar != null;

  // "profissional" field.
  DocumentReference? _profissional;
  DocumentReference? get profissional => _profissional;
  bool hasProfissional() => _profissional != null;

  void _initializeFields() {
    _consulta = snapshotData['consulta'] as DocumentReference?;
    _medicamento = snapshotData['medicamento'] as String?;
    _foto = snapshotData['foto'] as String?;
    _modoDeUsar = snapshotData['modo_de_usar'] as String?;
    _profissional = snapshotData['profissional'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cavalos_medicacoes');

  static Stream<CavalosMedicacoesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CavalosMedicacoesRecord.fromSnapshot(s));

  static Future<CavalosMedicacoesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CavalosMedicacoesRecord.fromSnapshot(s));

  static CavalosMedicacoesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CavalosMedicacoesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CavalosMedicacoesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CavalosMedicacoesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CavalosMedicacoesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CavalosMedicacoesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCavalosMedicacoesRecordData({
  DocumentReference? consulta,
  String? medicamento,
  String? foto,
  String? modoDeUsar,
  DocumentReference? profissional,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'consulta': consulta,
      'medicamento': medicamento,
      'foto': foto,
      'modo_de_usar': modoDeUsar,
      'profissional': profissional,
    }.withoutNulls,
  );

  return firestoreData;
}

class CavalosMedicacoesRecordDocumentEquality
    implements Equality<CavalosMedicacoesRecord> {
  const CavalosMedicacoesRecordDocumentEquality();

  @override
  bool equals(CavalosMedicacoesRecord? e1, CavalosMedicacoesRecord? e2) {
    return e1?.consulta == e2?.consulta &&
        e1?.medicamento == e2?.medicamento &&
        e1?.foto == e2?.foto &&
        e1?.modoDeUsar == e2?.modoDeUsar &&
        e1?.profissional == e2?.profissional;
  }

  @override
  int hash(CavalosMedicacoesRecord? e) => const ListEquality().hash(
      [e?.consulta, e?.medicamento, e?.foto, e?.modoDeUsar, e?.profissional]);

  @override
  bool isValidKey(Object? o) => o is CavalosMedicacoesRecord;
}
