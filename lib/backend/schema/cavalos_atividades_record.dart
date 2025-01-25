import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CavalosAtividadesRecord extends FirestoreRecord {
  CavalosAtividadesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "frequencia" field.
  String? _frequencia;
  String get frequencia => _frequencia ?? '';
  bool hasFrequencia() => _frequencia != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "periodo" field.
  String? _periodo;
  String get periodo => _periodo ?? '';
  bool hasPeriodo() => _periodo != null;

  // "tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  bool hasTipo() => _tipo != null;

  // "data_fim" field.
  DateTime? _dataFim;
  DateTime? get dataFim => _dataFim;
  bool hasDataFim() => _dataFim != null;

  // "data_inicio" field.
  DateTime? _dataInicio;
  DateTime? get dataInicio => _dataInicio;
  bool hasDataInicio() => _dataInicio != null;

  // "cavalo" field.
  DocumentReference? _cavalo;
  DocumentReference? get cavalo => _cavalo;
  bool hasCavalo() => _cavalo != null;

  // "dono" field.
  DocumentReference? _dono;
  DocumentReference? get dono => _dono;
  bool hasDono() => _dono != null;

  void _initializeFields() {
    _frequencia = snapshotData['frequencia'] as String?;
    _nome = snapshotData['nome'] as String?;
    _periodo = snapshotData['periodo'] as String?;
    _tipo = snapshotData['tipo'] as String?;
    _dataFim = snapshotData['data_fim'] as DateTime?;
    _dataInicio = snapshotData['data_inicio'] as DateTime?;
    _cavalo = snapshotData['cavalo'] as DocumentReference?;
    _dono = snapshotData['dono'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cavalos_atividades');

  static Stream<CavalosAtividadesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CavalosAtividadesRecord.fromSnapshot(s));

  static Future<CavalosAtividadesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CavalosAtividadesRecord.fromSnapshot(s));

  static CavalosAtividadesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CavalosAtividadesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CavalosAtividadesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CavalosAtividadesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CavalosAtividadesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CavalosAtividadesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCavalosAtividadesRecordData({
  String? frequencia,
  String? nome,
  String? periodo,
  String? tipo,
  DateTime? dataFim,
  DateTime? dataInicio,
  DocumentReference? cavalo,
  DocumentReference? dono,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'frequencia': frequencia,
      'nome': nome,
      'periodo': periodo,
      'tipo': tipo,
      'data_fim': dataFim,
      'data_inicio': dataInicio,
      'cavalo': cavalo,
      'dono': dono,
    }.withoutNulls,
  );

  return firestoreData;
}

class CavalosAtividadesRecordDocumentEquality
    implements Equality<CavalosAtividadesRecord> {
  const CavalosAtividadesRecordDocumentEquality();

  @override
  bool equals(CavalosAtividadesRecord? e1, CavalosAtividadesRecord? e2) {
    return e1?.frequencia == e2?.frequencia &&
        e1?.nome == e2?.nome &&
        e1?.periodo == e2?.periodo &&
        e1?.tipo == e2?.tipo &&
        e1?.dataFim == e2?.dataFim &&
        e1?.dataInicio == e2?.dataInicio &&
        e1?.cavalo == e2?.cavalo &&
        e1?.dono == e2?.dono;
  }

  @override
  int hash(CavalosAtividadesRecord? e) => const ListEquality().hash([
        e?.frequencia,
        e?.nome,
        e?.periodo,
        e?.tipo,
        e?.dataFim,
        e?.dataInicio,
        e?.cavalo,
        e?.dono
      ]);

  @override
  bool isValidKey(Object? o) => o is CavalosAtividadesRecord;
}
