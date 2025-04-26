import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CavalosCompeticaoRecord extends FirestoreRecord {
  CavalosCompeticaoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "cavalo" field.
  DocumentReference? _cavalo;
  DocumentReference? get cavalo => _cavalo;
  bool hasCavalo() => _cavalo != null;

  // "dono" field.
  DocumentReference? _dono;
  DocumentReference? get dono => _dono;
  bool hasDono() => _dono != null;

  // "competicao" field.
  String? _competicao;
  String get competicao => _competicao ?? '';
  bool hasCompeticao() => _competicao != null;

  // "data_inicial" field.
  DateTime? _dataInicial;
  DateTime? get dataInicial => _dataInicial;
  bool hasDataInicial() => _dataInicial != null;

  // "data_final" field.
  DateTime? _dataFinal;
  DateTime? get dataFinal => _dataFinal;
  bool hasDataFinal() => _dataFinal != null;

  void _initializeFields() {
    _cavalo = snapshotData['cavalo'] as DocumentReference?;
    _dono = snapshotData['dono'] as DocumentReference?;
    _competicao = snapshotData['competicao'] as String?;
    _dataInicial = snapshotData['data_inicial'] as DateTime?;
    _dataFinal = snapshotData['data_final'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cavalos_competicao');

  static Stream<CavalosCompeticaoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CavalosCompeticaoRecord.fromSnapshot(s));

  static Future<CavalosCompeticaoRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CavalosCompeticaoRecord.fromSnapshot(s));

  static CavalosCompeticaoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CavalosCompeticaoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CavalosCompeticaoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CavalosCompeticaoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CavalosCompeticaoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CavalosCompeticaoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCavalosCompeticaoRecordData({
  DocumentReference? cavalo,
  DocumentReference? dono,
  String? competicao,
  DateTime? dataInicial,
  DateTime? dataFinal,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'cavalo': cavalo,
      'dono': dono,
      'competicao': competicao,
      'data_inicial': dataInicial,
      'data_final': dataFinal,
    }.withoutNulls,
  );

  return firestoreData;
}

class CavalosCompeticaoRecordDocumentEquality
    implements Equality<CavalosCompeticaoRecord> {
  const CavalosCompeticaoRecordDocumentEquality();

  @override
  bool equals(CavalosCompeticaoRecord? e1, CavalosCompeticaoRecord? e2) {
    return e1?.cavalo == e2?.cavalo &&
        e1?.dono == e2?.dono &&
        e1?.competicao == e2?.competicao &&
        e1?.dataInicial == e2?.dataInicial &&
        e1?.dataFinal == e2?.dataFinal;
  }

  @override
  int hash(CavalosCompeticaoRecord? e) => const ListEquality()
      .hash([e?.cavalo, e?.dono, e?.competicao, e?.dataInicial, e?.dataFinal]);

  @override
  bool isValidKey(Object? o) => o is CavalosCompeticaoRecord;
}
