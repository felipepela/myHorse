import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CavalosProfissionaisRecord extends FirestoreRecord {
  CavalosProfissionaisRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "foto" field.
  String? _foto;
  String get foto => _foto ?? '';
  bool hasFoto() => _foto != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "cavalo" field.
  DocumentReference? _cavalo;
  DocumentReference? get cavalo => _cavalo;
  bool hasCavalo() => _cavalo != null;

  // "profissional" field.
  DocumentReference? _profissional;
  DocumentReference? get profissional => _profissional;
  bool hasProfissional() => _profissional != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _foto = snapshotData['foto'] as String?;
    _type = snapshotData['type'] as String?;
    _cavalo = snapshotData['cavalo'] as DocumentReference?;
    _profissional = snapshotData['profissional'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cavalos_profissionais');

  static Stream<CavalosProfissionaisRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => CavalosProfissionaisRecord.fromSnapshot(s));

  static Future<CavalosProfissionaisRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CavalosProfissionaisRecord.fromSnapshot(s));

  static CavalosProfissionaisRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CavalosProfissionaisRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CavalosProfissionaisRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CavalosProfissionaisRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CavalosProfissionaisRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CavalosProfissionaisRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCavalosProfissionaisRecordData({
  String? nome,
  String? foto,
  String? type,
  DocumentReference? cavalo,
  DocumentReference? profissional,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'foto': foto,
      'type': type,
      'cavalo': cavalo,
      'profissional': profissional,
    }.withoutNulls,
  );

  return firestoreData;
}

class CavalosProfissionaisRecordDocumentEquality
    implements Equality<CavalosProfissionaisRecord> {
  const CavalosProfissionaisRecordDocumentEquality();

  @override
  bool equals(CavalosProfissionaisRecord? e1, CavalosProfissionaisRecord? e2) {
    return e1?.nome == e2?.nome &&
        e1?.foto == e2?.foto &&
        e1?.type == e2?.type &&
        e1?.cavalo == e2?.cavalo &&
        e1?.profissional == e2?.profissional;
  }

  @override
  int hash(CavalosProfissionaisRecord? e) => const ListEquality()
      .hash([e?.nome, e?.foto, e?.type, e?.cavalo, e?.profissional]);

  @override
  bool isValidKey(Object? o) => o is CavalosProfissionaisRecord;
}
