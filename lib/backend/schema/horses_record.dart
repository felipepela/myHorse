import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HorsesRecord extends FirestoreRecord {
  HorsesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "data_nascimento" field.
  String? _dataNascimento;
  String get dataNascimento => _dataNascimento ?? '';
  bool hasDataNascimento() => _dataNascimento != null;

  // "pelagem" field.
  String? _pelagem;
  String get pelagem => _pelagem ?? '';
  bool hasPelagem() => _pelagem != null;

  // "raca" field.
  String? _raca;
  String get raca => _raca ?? '';
  bool hasRaca() => _raca != null;

  // "peso" field.
  String? _peso;
  String get peso => _peso ?? '';
  bool hasPeso() => _peso != null;

  // "altura" field.
  String? _altura;
  String get altura => _altura ?? '';
  bool hasAltura() => _altura != null;

  // "studbook" field.
  String? _studbook;
  String get studbook => _studbook ?? '';
  bool hasStudbook() => _studbook != null;

  // "foto" field.
  String? _foto;
  String get foto => _foto ?? '';
  bool hasFoto() => _foto != null;

  // "dono" field.
  DocumentReference? _dono;
  DocumentReference? get dono => _dono;
  bool hasDono() => _dono != null;

  // "priority" field.
  bool? _priority;
  bool get priority => _priority ?? false;
  bool hasPriority() => _priority != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _dataNascimento = snapshotData['data_nascimento'] as String?;
    _pelagem = snapshotData['pelagem'] as String?;
    _raca = snapshotData['raca'] as String?;
    _peso = snapshotData['peso'] as String?;
    _altura = snapshotData['altura'] as String?;
    _studbook = snapshotData['studbook'] as String?;
    _foto = snapshotData['foto'] as String?;
    _dono = snapshotData['dono'] as DocumentReference?;
    _priority = snapshotData['priority'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('horses');

  static Stream<HorsesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HorsesRecord.fromSnapshot(s));

  static Future<HorsesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HorsesRecord.fromSnapshot(s));

  static HorsesRecord fromSnapshot(DocumentSnapshot snapshot) => HorsesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HorsesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HorsesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HorsesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HorsesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHorsesRecordData({
  String? nome,
  String? dataNascimento,
  String? pelagem,
  String? raca,
  String? peso,
  String? altura,
  String? studbook,
  String? foto,
  DocumentReference? dono,
  bool? priority,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'data_nascimento': dataNascimento,
      'pelagem': pelagem,
      'raca': raca,
      'peso': peso,
      'altura': altura,
      'studbook': studbook,
      'foto': foto,
      'dono': dono,
      'priority': priority,
    }.withoutNulls,
  );

  return firestoreData;
}

class HorsesRecordDocumentEquality implements Equality<HorsesRecord> {
  const HorsesRecordDocumentEquality();

  @override
  bool equals(HorsesRecord? e1, HorsesRecord? e2) {
    return e1?.nome == e2?.nome &&
        e1?.dataNascimento == e2?.dataNascimento &&
        e1?.pelagem == e2?.pelagem &&
        e1?.raca == e2?.raca &&
        e1?.peso == e2?.peso &&
        e1?.altura == e2?.altura &&
        e1?.studbook == e2?.studbook &&
        e1?.foto == e2?.foto &&
        e1?.dono == e2?.dono &&
        e1?.priority == e2?.priority;
  }

  @override
  int hash(HorsesRecord? e) => const ListEquality().hash([
        e?.nome,
        e?.dataNascimento,
        e?.pelagem,
        e?.raca,
        e?.peso,
        e?.altura,
        e?.studbook,
        e?.foto,
        e?.dono,
        e?.priority
      ]);

  @override
  bool isValidKey(Object? o) => o is HorsesRecord;
}
