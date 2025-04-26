import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CavalosDocumentosRecord extends FirestoreRecord {
  CavalosDocumentosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "documento" field.
  String? _documento;
  String get documento => _documento ?? '';
  bool hasDocumento() => _documento != null;

  // "cavalo" field.
  DocumentReference? _cavalo;
  DocumentReference? get cavalo => _cavalo;
  bool hasCavalo() => _cavalo != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _documento = snapshotData['documento'] as String?;
    _cavalo = snapshotData['cavalo'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cavalos_documentos');

  static Stream<CavalosDocumentosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CavalosDocumentosRecord.fromSnapshot(s));

  static Future<CavalosDocumentosRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CavalosDocumentosRecord.fromSnapshot(s));

  static CavalosDocumentosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CavalosDocumentosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CavalosDocumentosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CavalosDocumentosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CavalosDocumentosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CavalosDocumentosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCavalosDocumentosRecordData({
  String? nome,
  String? documento,
  DocumentReference? cavalo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'documento': documento,
      'cavalo': cavalo,
    }.withoutNulls,
  );

  return firestoreData;
}

class CavalosDocumentosRecordDocumentEquality
    implements Equality<CavalosDocumentosRecord> {
  const CavalosDocumentosRecordDocumentEquality();

  @override
  bool equals(CavalosDocumentosRecord? e1, CavalosDocumentosRecord? e2) {
    return e1?.nome == e2?.nome &&
        e1?.documento == e2?.documento &&
        e1?.cavalo == e2?.cavalo;
  }

  @override
  int hash(CavalosDocumentosRecord? e) =>
      const ListEquality().hash([e?.nome, e?.documento, e?.cavalo]);

  @override
  bool isValidKey(Object? o) => o is CavalosDocumentosRecord;
}
