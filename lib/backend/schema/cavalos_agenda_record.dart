import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CavalosAgendaRecord extends FirestoreRecord {
  CavalosAgendaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "foto" field.
  String? _foto;
  String get foto => _foto ?? '';
  bool hasFoto() => _foto != null;

  // "tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  bool hasTipo() => _tipo != null;

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  // "cavalo" field.
  DocumentReference? _cavalo;
  DocumentReference? get cavalo => _cavalo;
  bool hasCavalo() => _cavalo != null;

  // "dono" field.
  DocumentReference? _dono;
  DocumentReference? get dono => _dono;
  bool hasDono() => _dono != null;

  // "profissional" field.
  DocumentReference? _profissional;
  DocumentReference? get profissional => _profissional;
  bool hasProfissional() => _profissional != null;

  void _initializeFields() {
    _data = snapshotData['data'] as DateTime?;
    _descricao = snapshotData['descricao'] as String?;
    _foto = snapshotData['foto'] as String?;
    _tipo = snapshotData['tipo'] as String?;
    _titulo = snapshotData['titulo'] as String?;
    _cavalo = snapshotData['cavalo'] as DocumentReference?;
    _dono = snapshotData['dono'] as DocumentReference?;
    _profissional = snapshotData['profissional'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cavalos_agenda');

  static Stream<CavalosAgendaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CavalosAgendaRecord.fromSnapshot(s));

  static Future<CavalosAgendaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CavalosAgendaRecord.fromSnapshot(s));

  static CavalosAgendaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CavalosAgendaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CavalosAgendaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CavalosAgendaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CavalosAgendaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CavalosAgendaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCavalosAgendaRecordData({
  DateTime? data,
  String? descricao,
  String? foto,
  String? tipo,
  String? titulo,
  DocumentReference? cavalo,
  DocumentReference? dono,
  DocumentReference? profissional,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'data': data,
      'descricao': descricao,
      'foto': foto,
      'tipo': tipo,
      'titulo': titulo,
      'cavalo': cavalo,
      'dono': dono,
      'profissional': profissional,
    }.withoutNulls,
  );

  return firestoreData;
}

class CavalosAgendaRecordDocumentEquality
    implements Equality<CavalosAgendaRecord> {
  const CavalosAgendaRecordDocumentEquality();

  @override
  bool equals(CavalosAgendaRecord? e1, CavalosAgendaRecord? e2) {
    return e1?.data == e2?.data &&
        e1?.descricao == e2?.descricao &&
        e1?.foto == e2?.foto &&
        e1?.tipo == e2?.tipo &&
        e1?.titulo == e2?.titulo &&
        e1?.cavalo == e2?.cavalo &&
        e1?.dono == e2?.dono &&
        e1?.profissional == e2?.profissional;
  }

  @override
  int hash(CavalosAgendaRecord? e) => const ListEquality().hash([
        e?.data,
        e?.descricao,
        e?.foto,
        e?.tipo,
        e?.titulo,
        e?.cavalo,
        e?.dono,
        e?.profissional
      ]);

  @override
  bool isValidKey(Object? o) => o is CavalosAgendaRecord;
}
