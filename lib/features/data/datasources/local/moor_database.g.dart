// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class MensajeDBRegister extends DataClass
    implements Insertable<MensajeDBRegister> {
  final int id;
  final String remitente;
  final String destinatario;
  final DateTime fecha;
  final String tipoContenido;
  final String valor;
  final String resumen;
  final int obraId;
  MensajeDBRegister(
      {@required this.id,
      this.remitente,
      this.destinatario,
      @required this.fecha,
      @required this.tipoContenido,
      @required this.valor,
      this.resumen,
      @required this.obraId});
  factory MensajeDBRegister.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return MensajeDBRegister(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      remitente: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}remitente']),
      destinatario: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}destinatario']),
      fecha:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}fecha']),
      tipoContenido: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}tipo_contenido']),
      valor:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}valor']),
      resumen:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}resumen']),
      obraId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}obra_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || remitente != null) {
      map['remitente'] = Variable<String>(remitente);
    }
    if (!nullToAbsent || destinatario != null) {
      map['destinatario'] = Variable<String>(destinatario);
    }
    if (!nullToAbsent || fecha != null) {
      map['fecha'] = Variable<DateTime>(fecha);
    }
    if (!nullToAbsent || tipoContenido != null) {
      map['tipo_contenido'] = Variable<String>(tipoContenido);
    }
    if (!nullToAbsent || valor != null) {
      map['valor'] = Variable<String>(valor);
    }
    if (!nullToAbsent || resumen != null) {
      map['resumen'] = Variable<String>(resumen);
    }
    if (!nullToAbsent || obraId != null) {
      map['obra_id'] = Variable<int>(obraId);
    }
    return map;
  }

  MensajesTableCompanion toCompanion(bool nullToAbsent) {
    return MensajesTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      remitente: remitente == null && nullToAbsent
          ? const Value.absent()
          : Value(remitente),
      destinatario: destinatario == null && nullToAbsent
          ? const Value.absent()
          : Value(destinatario),
      fecha:
          fecha == null && nullToAbsent ? const Value.absent() : Value(fecha),
      tipoContenido: tipoContenido == null && nullToAbsent
          ? const Value.absent()
          : Value(tipoContenido),
      valor:
          valor == null && nullToAbsent ? const Value.absent() : Value(valor),
      resumen: resumen == null && nullToAbsent
          ? const Value.absent()
          : Value(resumen),
      obraId:
          obraId == null && nullToAbsent ? const Value.absent() : Value(obraId),
    );
  }

  factory MensajeDBRegister.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MensajeDBRegister(
      id: serializer.fromJson<int>(json['id']),
      remitente: serializer.fromJson<String>(json['remitente']),
      destinatario: serializer.fromJson<String>(json['destinatario']),
      fecha: serializer.fromJson<DateTime>(json['fecha']),
      tipoContenido: serializer.fromJson<String>(json['tipoContenido']),
      valor: serializer.fromJson<String>(json['valor']),
      resumen: serializer.fromJson<String>(json['resumen']),
      obraId: serializer.fromJson<int>(json['obraId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remitente': serializer.toJson<String>(remitente),
      'destinatario': serializer.toJson<String>(destinatario),
      'fecha': serializer.toJson<DateTime>(fecha),
      'tipoContenido': serializer.toJson<String>(tipoContenido),
      'valor': serializer.toJson<String>(valor),
      'resumen': serializer.toJson<String>(resumen),
      'obraId': serializer.toJson<int>(obraId),
    };
  }

  MensajeDBRegister copyWith(
          {int id,
          String remitente,
          String destinatario,
          DateTime fecha,
          String tipoContenido,
          String valor,
          String resumen,
          int obraId}) =>
      MensajeDBRegister(
        id: id ?? this.id,
        remitente: remitente ?? this.remitente,
        destinatario: destinatario ?? this.destinatario,
        fecha: fecha ?? this.fecha,
        tipoContenido: tipoContenido ?? this.tipoContenido,
        valor: valor ?? this.valor,
        resumen: resumen ?? this.resumen,
        obraId: obraId ?? this.obraId,
      );
  @override
  String toString() {
    return (StringBuffer('MensajeDBRegister(')
          ..write('id: $id, ')
          ..write('remitente: $remitente, ')
          ..write('destinatario: $destinatario, ')
          ..write('fecha: $fecha, ')
          ..write('tipoContenido: $tipoContenido, ')
          ..write('valor: $valor, ')
          ..write('resumen: $resumen, ')
          ..write('obraId: $obraId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          remitente.hashCode,
          $mrjc(
              destinatario.hashCode,
              $mrjc(
                  fecha.hashCode,
                  $mrjc(
                      tipoContenido.hashCode,
                      $mrjc(valor.hashCode,
                          $mrjc(resumen.hashCode, obraId.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is MensajeDBRegister &&
          other.id == this.id &&
          other.remitente == this.remitente &&
          other.destinatario == this.destinatario &&
          other.fecha == this.fecha &&
          other.tipoContenido == this.tipoContenido &&
          other.valor == this.valor &&
          other.resumen == this.resumen &&
          other.obraId == this.obraId);
}

class MensajesTableCompanion extends UpdateCompanion<MensajeDBRegister> {
  final Value<int> id;
  final Value<String> remitente;
  final Value<String> destinatario;
  final Value<DateTime> fecha;
  final Value<String> tipoContenido;
  final Value<String> valor;
  final Value<String> resumen;
  final Value<int> obraId;
  const MensajesTableCompanion({
    this.id = const Value.absent(),
    this.remitente = const Value.absent(),
    this.destinatario = const Value.absent(),
    this.fecha = const Value.absent(),
    this.tipoContenido = const Value.absent(),
    this.valor = const Value.absent(),
    this.resumen = const Value.absent(),
    this.obraId = const Value.absent(),
  });
  MensajesTableCompanion.insert({
    this.id = const Value.absent(),
    this.remitente = const Value.absent(),
    this.destinatario = const Value.absent(),
    @required DateTime fecha,
    @required String tipoContenido,
    @required String valor,
    this.resumen = const Value.absent(),
    @required int obraId,
  })  : fecha = Value(fecha),
        tipoContenido = Value(tipoContenido),
        valor = Value(valor),
        obraId = Value(obraId);
  static Insertable<MensajeDBRegister> custom({
    Expression<int> id,
    Expression<String> remitente,
    Expression<String> destinatario,
    Expression<DateTime> fecha,
    Expression<String> tipoContenido,
    Expression<String> valor,
    Expression<String> resumen,
    Expression<int> obraId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remitente != null) 'remitente': remitente,
      if (destinatario != null) 'destinatario': destinatario,
      if (fecha != null) 'fecha': fecha,
      if (tipoContenido != null) 'tipo_contenido': tipoContenido,
      if (valor != null) 'valor': valor,
      if (resumen != null) 'resumen': resumen,
      if (obraId != null) 'obra_id': obraId,
    });
  }

  MensajesTableCompanion copyWith(
      {Value<int> id,
      Value<String> remitente,
      Value<String> destinatario,
      Value<DateTime> fecha,
      Value<String> tipoContenido,
      Value<String> valor,
      Value<String> resumen,
      Value<int> obraId}) {
    return MensajesTableCompanion(
      id: id ?? this.id,
      remitente: remitente ?? this.remitente,
      destinatario: destinatario ?? this.destinatario,
      fecha: fecha ?? this.fecha,
      tipoContenido: tipoContenido ?? this.tipoContenido,
      valor: valor ?? this.valor,
      resumen: resumen ?? this.resumen,
      obraId: obraId ?? this.obraId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (remitente.present) {
      map['remitente'] = Variable<String>(remitente.value);
    }
    if (destinatario.present) {
      map['destinatario'] = Variable<String>(destinatario.value);
    }
    if (fecha.present) {
      map['fecha'] = Variable<DateTime>(fecha.value);
    }
    if (tipoContenido.present) {
      map['tipo_contenido'] = Variable<String>(tipoContenido.value);
    }
    if (valor.present) {
      map['valor'] = Variable<String>(valor.value);
    }
    if (resumen.present) {
      map['resumen'] = Variable<String>(resumen.value);
    }
    if (obraId.present) {
      map['obra_id'] = Variable<int>(obraId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MensajesTableCompanion(')
          ..write('id: $id, ')
          ..write('remitente: $remitente, ')
          ..write('destinatario: $destinatario, ')
          ..write('fecha: $fecha, ')
          ..write('tipoContenido: $tipoContenido, ')
          ..write('valor: $valor, ')
          ..write('resumen: $resumen, ')
          ..write('obraId: $obraId')
          ..write(')'))
        .toString();
  }
}

class $MensajesTableTable extends MensajesTable
    with TableInfo<$MensajesTableTable, MensajeDBRegister> {
  final GeneratedDatabase _db;
  final String _alias;
  $MensajesTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _remitenteMeta = const VerificationMeta('remitente');
  GeneratedTextColumn _remitente;
  @override
  GeneratedTextColumn get remitente => _remitente ??= _constructRemitente();
  GeneratedTextColumn _constructRemitente() {
    return GeneratedTextColumn(
      'remitente',
      $tableName,
      true,
    );
  }

  final VerificationMeta _destinatarioMeta =
      const VerificationMeta('destinatario');
  GeneratedTextColumn _destinatario;
  @override
  GeneratedTextColumn get destinatario =>
      _destinatario ??= _constructDestinatario();
  GeneratedTextColumn _constructDestinatario() {
    return GeneratedTextColumn(
      'destinatario',
      $tableName,
      true,
    );
  }

  final VerificationMeta _fechaMeta = const VerificationMeta('fecha');
  GeneratedDateTimeColumn _fecha;
  @override
  GeneratedDateTimeColumn get fecha => _fecha ??= _constructFecha();
  GeneratedDateTimeColumn _constructFecha() {
    return GeneratedDateTimeColumn(
      'fecha',
      $tableName,
      false,
    );
  }

  final VerificationMeta _tipoContenidoMeta =
      const VerificationMeta('tipoContenido');
  GeneratedTextColumn _tipoContenido;
  @override
  GeneratedTextColumn get tipoContenido =>
      _tipoContenido ??= _constructTipoContenido();
  GeneratedTextColumn _constructTipoContenido() {
    return GeneratedTextColumn('tipo_contenido', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _valorMeta = const VerificationMeta('valor');
  GeneratedTextColumn _valor;
  @override
  GeneratedTextColumn get valor => _valor ??= _constructValor();
  GeneratedTextColumn _constructValor() {
    return GeneratedTextColumn('valor', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _resumenMeta = const VerificationMeta('resumen');
  GeneratedTextColumn _resumen;
  @override
  GeneratedTextColumn get resumen => _resumen ??= _constructResumen();
  GeneratedTextColumn _constructResumen() {
    return GeneratedTextColumn(
      'resumen',
      $tableName,
      true,
    );
  }

  final VerificationMeta _obraIdMeta = const VerificationMeta('obraId');
  GeneratedIntColumn _obraId;
  @override
  GeneratedIntColumn get obraId => _obraId ??= _constructObraId();
  GeneratedIntColumn _constructObraId() {
    return GeneratedIntColumn(
      'obra_id',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        remitente,
        destinatario,
        fecha,
        tipoContenido,
        valor,
        resumen,
        obraId
      ];
  @override
  $MensajesTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'mensajes';
  @override
  final String actualTableName = 'mensajes';
  @override
  VerificationContext validateIntegrity(Insertable<MensajeDBRegister> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('remitente')) {
      context.handle(_remitenteMeta,
          remitente.isAcceptableOrUnknown(data['remitente'], _remitenteMeta));
    }
    if (data.containsKey('destinatario')) {
      context.handle(
          _destinatarioMeta,
          destinatario.isAcceptableOrUnknown(
              data['destinatario'], _destinatarioMeta));
    }
    if (data.containsKey('fecha')) {
      context.handle(
          _fechaMeta, fecha.isAcceptableOrUnknown(data['fecha'], _fechaMeta));
    } else if (isInserting) {
      context.missing(_fechaMeta);
    }
    if (data.containsKey('tipo_contenido')) {
      context.handle(
          _tipoContenidoMeta,
          tipoContenido.isAcceptableOrUnknown(
              data['tipo_contenido'], _tipoContenidoMeta));
    } else if (isInserting) {
      context.missing(_tipoContenidoMeta);
    }
    if (data.containsKey('valor')) {
      context.handle(
          _valorMeta, valor.isAcceptableOrUnknown(data['valor'], _valorMeta));
    } else if (isInserting) {
      context.missing(_valorMeta);
    }
    if (data.containsKey('resumen')) {
      context.handle(_resumenMeta,
          resumen.isAcceptableOrUnknown(data['resumen'], _resumenMeta));
    }
    if (data.containsKey('obra_id')) {
      context.handle(_obraIdMeta,
          obraId.isAcceptableOrUnknown(data['obra_id'], _obraIdMeta));
    } else if (isInserting) {
      context.missing(_obraIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MensajeDBRegister map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return MensajeDBRegister.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MensajesTableTable createAlias(String alias) {
    return $MensajesTableTable(_db, alias);
  }
}

class UsuarioDBRegister extends DataClass
    implements Insertable<UsuarioDBRegister> {
  final int id;
  final String login;
  final String firstName;
  final String lastName;
  final String email;
  final String imagenPath;
  final bool activated;
  final String langKey;
  final String createdBy;
  final DateTime createdDate;
  final String lastModifiedBy;
  final DateTime lastModifiedDate;
  final String password;
  final String authorities;
  UsuarioDBRegister(
      {@required this.id,
      this.login,
      this.firstName,
      this.lastName,
      this.email,
      this.imagenPath,
      this.activated,
      this.langKey,
      this.createdBy,
      this.createdDate,
      this.lastModifiedBy,
      this.lastModifiedDate,
      this.password,
      this.authorities});
  factory UsuarioDBRegister.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return UsuarioDBRegister(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      login:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}login']),
      firstName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}first_name']),
      lastName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_name']),
      email:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}email']),
      imagenPath: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}imagen_path']),
      activated:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}activated']),
      langKey: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}lang_key']),
      createdBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_by']),
      createdDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_date']),
      lastModifiedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_modified_by']),
      lastModifiedDate: dateTimeType.mapFromDatabaseResponse(
          data['${effectivePrefix}last_modified_date']),
      password: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}password']),
      authorities: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}authorities']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || login != null) {
      map['login'] = Variable<String>(login);
    }
    if (!nullToAbsent || firstName != null) {
      map['first_name'] = Variable<String>(firstName);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String>(lastName);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || imagenPath != null) {
      map['imagen_path'] = Variable<String>(imagenPath);
    }
    if (!nullToAbsent || activated != null) {
      map['activated'] = Variable<bool>(activated);
    }
    if (!nullToAbsent || langKey != null) {
      map['lang_key'] = Variable<String>(langKey);
    }
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<DateTime>(createdDate);
    }
    if (!nullToAbsent || lastModifiedBy != null) {
      map['last_modified_by'] = Variable<String>(lastModifiedBy);
    }
    if (!nullToAbsent || lastModifiedDate != null) {
      map['last_modified_date'] = Variable<DateTime>(lastModifiedDate);
    }
    if (!nullToAbsent || password != null) {
      map['password'] = Variable<String>(password);
    }
    if (!nullToAbsent || authorities != null) {
      map['authorities'] = Variable<String>(authorities);
    }
    return map;
  }

  UsuariosTableCompanion toCompanion(bool nullToAbsent) {
    return UsuariosTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      login:
          login == null && nullToAbsent ? const Value.absent() : Value(login),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      imagenPath: imagenPath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagenPath),
      activated: activated == null && nullToAbsent
          ? const Value.absent()
          : Value(activated),
      langKey: langKey == null && nullToAbsent
          ? const Value.absent()
          : Value(langKey),
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      lastModifiedBy: lastModifiedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(lastModifiedBy),
      lastModifiedDate: lastModifiedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastModifiedDate),
      password: password == null && nullToAbsent
          ? const Value.absent()
          : Value(password),
      authorities: authorities == null && nullToAbsent
          ? const Value.absent()
          : Value(authorities),
    );
  }

  factory UsuarioDBRegister.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return UsuarioDBRegister(
      id: serializer.fromJson<int>(json['id']),
      login: serializer.fromJson<String>(json['login']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      email: serializer.fromJson<String>(json['email']),
      imagenPath: serializer.fromJson<String>(json['imagenPath']),
      activated: serializer.fromJson<bool>(json['activated']),
      langKey: serializer.fromJson<String>(json['langKey']),
      createdBy: serializer.fromJson<String>(json['createdBy']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      lastModifiedBy: serializer.fromJson<String>(json['lastModifiedBy']),
      lastModifiedDate: serializer.fromJson<DateTime>(json['lastModifiedDate']),
      password: serializer.fromJson<String>(json['password']),
      authorities: serializer.fromJson<String>(json['authorities']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'login': serializer.toJson<String>(login),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'email': serializer.toJson<String>(email),
      'imagenPath': serializer.toJson<String>(imagenPath),
      'activated': serializer.toJson<bool>(activated),
      'langKey': serializer.toJson<String>(langKey),
      'createdBy': serializer.toJson<String>(createdBy),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'lastModifiedBy': serializer.toJson<String>(lastModifiedBy),
      'lastModifiedDate': serializer.toJson<DateTime>(lastModifiedDate),
      'password': serializer.toJson<String>(password),
      'authorities': serializer.toJson<String>(authorities),
    };
  }

  UsuarioDBRegister copyWith(
          {int id,
          String login,
          String firstName,
          String lastName,
          String email,
          String imagenPath,
          bool activated,
          String langKey,
          String createdBy,
          DateTime createdDate,
          String lastModifiedBy,
          DateTime lastModifiedDate,
          String password,
          String authorities}) =>
      UsuarioDBRegister(
        id: id ?? this.id,
        login: login ?? this.login,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        imagenPath: imagenPath ?? this.imagenPath,
        activated: activated ?? this.activated,
        langKey: langKey ?? this.langKey,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        lastModifiedBy: lastModifiedBy ?? this.lastModifiedBy,
        lastModifiedDate: lastModifiedDate ?? this.lastModifiedDate,
        password: password ?? this.password,
        authorities: authorities ?? this.authorities,
      );
  @override
  String toString() {
    return (StringBuffer('UsuarioDBRegister(')
          ..write('id: $id, ')
          ..write('login: $login, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('email: $email, ')
          ..write('imagenPath: $imagenPath, ')
          ..write('activated: $activated, ')
          ..write('langKey: $langKey, ')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('lastModifiedBy: $lastModifiedBy, ')
          ..write('lastModifiedDate: $lastModifiedDate, ')
          ..write('password: $password, ')
          ..write('authorities: $authorities')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          login.hashCode,
          $mrjc(
              firstName.hashCode,
              $mrjc(
                  lastName.hashCode,
                  $mrjc(
                      email.hashCode,
                      $mrjc(
                          imagenPath.hashCode,
                          $mrjc(
                              activated.hashCode,
                              $mrjc(
                                  langKey.hashCode,
                                  $mrjc(
                                      createdBy.hashCode,
                                      $mrjc(
                                          createdDate.hashCode,
                                          $mrjc(
                                              lastModifiedBy.hashCode,
                                              $mrjc(
                                                  lastModifiedDate.hashCode,
                                                  $mrjc(
                                                      password.hashCode,
                                                      authorities
                                                          .hashCode))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is UsuarioDBRegister &&
          other.id == this.id &&
          other.login == this.login &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.email == this.email &&
          other.imagenPath == this.imagenPath &&
          other.activated == this.activated &&
          other.langKey == this.langKey &&
          other.createdBy == this.createdBy &&
          other.createdDate == this.createdDate &&
          other.lastModifiedBy == this.lastModifiedBy &&
          other.lastModifiedDate == this.lastModifiedDate &&
          other.password == this.password &&
          other.authorities == this.authorities);
}

class UsuariosTableCompanion extends UpdateCompanion<UsuarioDBRegister> {
  final Value<int> id;
  final Value<String> login;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String> email;
  final Value<String> imagenPath;
  final Value<bool> activated;
  final Value<String> langKey;
  final Value<String> createdBy;
  final Value<DateTime> createdDate;
  final Value<String> lastModifiedBy;
  final Value<DateTime> lastModifiedDate;
  final Value<String> password;
  final Value<String> authorities;
  const UsuariosTableCompanion({
    this.id = const Value.absent(),
    this.login = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.email = const Value.absent(),
    this.imagenPath = const Value.absent(),
    this.activated = const Value.absent(),
    this.langKey = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.lastModifiedBy = const Value.absent(),
    this.lastModifiedDate = const Value.absent(),
    this.password = const Value.absent(),
    this.authorities = const Value.absent(),
  });
  UsuariosTableCompanion.insert({
    this.id = const Value.absent(),
    this.login = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.email = const Value.absent(),
    this.imagenPath = const Value.absent(),
    this.activated = const Value.absent(),
    this.langKey = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.lastModifiedBy = const Value.absent(),
    this.lastModifiedDate = const Value.absent(),
    this.password = const Value.absent(),
    this.authorities = const Value.absent(),
  });
  static Insertable<UsuarioDBRegister> custom({
    Expression<int> id,
    Expression<String> login,
    Expression<String> firstName,
    Expression<String> lastName,
    Expression<String> email,
    Expression<String> imagenPath,
    Expression<bool> activated,
    Expression<String> langKey,
    Expression<String> createdBy,
    Expression<DateTime> createdDate,
    Expression<String> lastModifiedBy,
    Expression<DateTime> lastModifiedDate,
    Expression<String> password,
    Expression<String> authorities,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (login != null) 'login': login,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (email != null) 'email': email,
      if (imagenPath != null) 'imagen_path': imagenPath,
      if (activated != null) 'activated': activated,
      if (langKey != null) 'lang_key': langKey,
      if (createdBy != null) 'created_by': createdBy,
      if (createdDate != null) 'created_date': createdDate,
      if (lastModifiedBy != null) 'last_modified_by': lastModifiedBy,
      if (lastModifiedDate != null) 'last_modified_date': lastModifiedDate,
      if (password != null) 'password': password,
      if (authorities != null) 'authorities': authorities,
    });
  }

  UsuariosTableCompanion copyWith(
      {Value<int> id,
      Value<String> login,
      Value<String> firstName,
      Value<String> lastName,
      Value<String> email,
      Value<String> imagenPath,
      Value<bool> activated,
      Value<String> langKey,
      Value<String> createdBy,
      Value<DateTime> createdDate,
      Value<String> lastModifiedBy,
      Value<DateTime> lastModifiedDate,
      Value<String> password,
      Value<String> authorities}) {
    return UsuariosTableCompanion(
      id: id ?? this.id,
      login: login ?? this.login,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      imagenPath: imagenPath ?? this.imagenPath,
      activated: activated ?? this.activated,
      langKey: langKey ?? this.langKey,
      createdBy: createdBy ?? this.createdBy,
      createdDate: createdDate ?? this.createdDate,
      lastModifiedBy: lastModifiedBy ?? this.lastModifiedBy,
      lastModifiedDate: lastModifiedDate ?? this.lastModifiedDate,
      password: password ?? this.password,
      authorities: authorities ?? this.authorities,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (login.present) {
      map['login'] = Variable<String>(login.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (imagenPath.present) {
      map['imagen_path'] = Variable<String>(imagenPath.value);
    }
    if (activated.present) {
      map['activated'] = Variable<bool>(activated.value);
    }
    if (langKey.present) {
      map['lang_key'] = Variable<String>(langKey.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (lastModifiedBy.present) {
      map['last_modified_by'] = Variable<String>(lastModifiedBy.value);
    }
    if (lastModifiedDate.present) {
      map['last_modified_date'] = Variable<DateTime>(lastModifiedDate.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (authorities.present) {
      map['authorities'] = Variable<String>(authorities.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsuariosTableCompanion(')
          ..write('id: $id, ')
          ..write('login: $login, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('email: $email, ')
          ..write('imagenPath: $imagenPath, ')
          ..write('activated: $activated, ')
          ..write('langKey: $langKey, ')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('lastModifiedBy: $lastModifiedBy, ')
          ..write('lastModifiedDate: $lastModifiedDate, ')
          ..write('password: $password, ')
          ..write('authorities: $authorities')
          ..write(')'))
        .toString();
  }
}

class $UsuariosTableTable extends UsuariosTable
    with TableInfo<$UsuariosTableTable, UsuarioDBRegister> {
  final GeneratedDatabase _db;
  final String _alias;
  $UsuariosTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _loginMeta = const VerificationMeta('login');
  GeneratedTextColumn _login;
  @override
  GeneratedTextColumn get login => _login ??= _constructLogin();
  GeneratedTextColumn _constructLogin() {
    return GeneratedTextColumn(
      'login',
      $tableName,
      true,
    );
  }

  final VerificationMeta _firstNameMeta = const VerificationMeta('firstName');
  GeneratedTextColumn _firstName;
  @override
  GeneratedTextColumn get firstName => _firstName ??= _constructFirstName();
  GeneratedTextColumn _constructFirstName() {
    return GeneratedTextColumn(
      'first_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _lastNameMeta = const VerificationMeta('lastName');
  GeneratedTextColumn _lastName;
  @override
  GeneratedTextColumn get lastName => _lastName ??= _constructLastName();
  GeneratedTextColumn _constructLastName() {
    return GeneratedTextColumn(
      'last_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _emailMeta = const VerificationMeta('email');
  GeneratedTextColumn _email;
  @override
  GeneratedTextColumn get email => _email ??= _constructEmail();
  GeneratedTextColumn _constructEmail() {
    return GeneratedTextColumn(
      'email',
      $tableName,
      true,
    );
  }

  final VerificationMeta _imagenPathMeta = const VerificationMeta('imagenPath');
  GeneratedTextColumn _imagenPath;
  @override
  GeneratedTextColumn get imagenPath => _imagenPath ??= _constructImagenPath();
  GeneratedTextColumn _constructImagenPath() {
    return GeneratedTextColumn(
      'imagen_path',
      $tableName,
      true,
    );
  }

  final VerificationMeta _activatedMeta = const VerificationMeta('activated');
  GeneratedBoolColumn _activated;
  @override
  GeneratedBoolColumn get activated => _activated ??= _constructActivated();
  GeneratedBoolColumn _constructActivated() {
    return GeneratedBoolColumn(
      'activated',
      $tableName,
      true,
    );
  }

  final VerificationMeta _langKeyMeta = const VerificationMeta('langKey');
  GeneratedTextColumn _langKey;
  @override
  GeneratedTextColumn get langKey => _langKey ??= _constructLangKey();
  GeneratedTextColumn _constructLangKey() {
    return GeneratedTextColumn(
      'lang_key',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdByMeta = const VerificationMeta('createdBy');
  GeneratedTextColumn _createdBy;
  @override
  GeneratedTextColumn get createdBy => _createdBy ??= _constructCreatedBy();
  GeneratedTextColumn _constructCreatedBy() {
    return GeneratedTextColumn(
      'created_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  GeneratedDateTimeColumn _createdDate;
  @override
  GeneratedDateTimeColumn get createdDate =>
      _createdDate ??= _constructCreatedDate();
  GeneratedDateTimeColumn _constructCreatedDate() {
    return GeneratedDateTimeColumn(
      'created_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _lastModifiedByMeta =
      const VerificationMeta('lastModifiedBy');
  GeneratedTextColumn _lastModifiedBy;
  @override
  GeneratedTextColumn get lastModifiedBy =>
      _lastModifiedBy ??= _constructLastModifiedBy();
  GeneratedTextColumn _constructLastModifiedBy() {
    return GeneratedTextColumn(
      'last_modified_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _lastModifiedDateMeta =
      const VerificationMeta('lastModifiedDate');
  GeneratedDateTimeColumn _lastModifiedDate;
  @override
  GeneratedDateTimeColumn get lastModifiedDate =>
      _lastModifiedDate ??= _constructLastModifiedDate();
  GeneratedDateTimeColumn _constructLastModifiedDate() {
    return GeneratedDateTimeColumn(
      'last_modified_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _passwordMeta = const VerificationMeta('password');
  GeneratedTextColumn _password;
  @override
  GeneratedTextColumn get password => _password ??= _constructPassword();
  GeneratedTextColumn _constructPassword() {
    return GeneratedTextColumn(
      'password',
      $tableName,
      true,
    );
  }

  final VerificationMeta _authoritiesMeta =
      const VerificationMeta('authorities');
  GeneratedTextColumn _authorities;
  @override
  GeneratedTextColumn get authorities =>
      _authorities ??= _constructAuthorities();
  GeneratedTextColumn _constructAuthorities() {
    return GeneratedTextColumn(
      'authorities',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        login,
        firstName,
        lastName,
        email,
        imagenPath,
        activated,
        langKey,
        createdBy,
        createdDate,
        lastModifiedBy,
        lastModifiedDate,
        password,
        authorities
      ];
  @override
  $UsuariosTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'usuarios';
  @override
  final String actualTableName = 'usuarios';
  @override
  VerificationContext validateIntegrity(Insertable<UsuarioDBRegister> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('login')) {
      context.handle(
          _loginMeta, login.isAcceptableOrUnknown(data['login'], _loginMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name'], _firstNameMeta));
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name'], _lastNameMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email'], _emailMeta));
    }
    if (data.containsKey('imagen_path')) {
      context.handle(
          _imagenPathMeta,
          imagenPath.isAcceptableOrUnknown(
              data['imagen_path'], _imagenPathMeta));
    }
    if (data.containsKey('activated')) {
      context.handle(_activatedMeta,
          activated.isAcceptableOrUnknown(data['activated'], _activatedMeta));
    }
    if (data.containsKey('lang_key')) {
      context.handle(_langKeyMeta,
          langKey.isAcceptableOrUnknown(data['lang_key'], _langKeyMeta));
    }
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by'], _createdByMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date'], _createdDateMeta));
    }
    if (data.containsKey('last_modified_by')) {
      context.handle(
          _lastModifiedByMeta,
          lastModifiedBy.isAcceptableOrUnknown(
              data['last_modified_by'], _lastModifiedByMeta));
    }
    if (data.containsKey('last_modified_date')) {
      context.handle(
          _lastModifiedDateMeta,
          lastModifiedDate.isAcceptableOrUnknown(
              data['last_modified_date'], _lastModifiedDateMeta));
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password'], _passwordMeta));
    }
    if (data.containsKey('authorities')) {
      context.handle(
          _authoritiesMeta,
          authorities.isAcceptableOrUnknown(
              data['authorities'], _authoritiesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UsuarioDBRegister map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return UsuarioDBRegister.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $UsuariosTableTable createAlias(String alias) {
    return $UsuariosTableTable(_db, alias);
  }
}

class PersonaDBRegister extends DataClass
    implements Insertable<PersonaDBRegister> {
  final int id;
  final String codigo;
  final String nombres;
  final String apellidos;
  final DateTime fechaNacimiento;
  final String correoElectronico;
  final String telefono;
  final int cuentaId;
  final int usuarioId;
  final int paisId;
  PersonaDBRegister(
      {@required this.id,
      this.codigo,
      this.nombres,
      this.apellidos,
      @required this.fechaNacimiento,
      this.correoElectronico,
      this.telefono,
      @required this.cuentaId,
      this.usuarioId,
      @required this.paisId});
  factory PersonaDBRegister.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return PersonaDBRegister(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      codigo:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}codigo']),
      nombres:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}nombres']),
      apellidos: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}apellidos']),
      fechaNacimiento: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}fecha_nacimiento']),
      correoElectronico: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}correo_electronico']),
      telefono: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}telefono']),
      cuentaId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}cuenta_id']),
      usuarioId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}usuario_id']),
      paisId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}pais_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || codigo != null) {
      map['codigo'] = Variable<String>(codigo);
    }
    if (!nullToAbsent || nombres != null) {
      map['nombres'] = Variable<String>(nombres);
    }
    if (!nullToAbsent || apellidos != null) {
      map['apellidos'] = Variable<String>(apellidos);
    }
    if (!nullToAbsent || fechaNacimiento != null) {
      map['fecha_nacimiento'] = Variable<DateTime>(fechaNacimiento);
    }
    if (!nullToAbsent || correoElectronico != null) {
      map['correo_electronico'] = Variable<String>(correoElectronico);
    }
    if (!nullToAbsent || telefono != null) {
      map['telefono'] = Variable<String>(telefono);
    }
    if (!nullToAbsent || cuentaId != null) {
      map['cuenta_id'] = Variable<int>(cuentaId);
    }
    if (!nullToAbsent || usuarioId != null) {
      map['usuario_id'] = Variable<int>(usuarioId);
    }
    if (!nullToAbsent || paisId != null) {
      map['pais_id'] = Variable<int>(paisId);
    }
    return map;
  }

  PersonasTableCompanion toCompanion(bool nullToAbsent) {
    return PersonasTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      codigo:
          codigo == null && nullToAbsent ? const Value.absent() : Value(codigo),
      nombres: nombres == null && nullToAbsent
          ? const Value.absent()
          : Value(nombres),
      apellidos: apellidos == null && nullToAbsent
          ? const Value.absent()
          : Value(apellidos),
      fechaNacimiento: fechaNacimiento == null && nullToAbsent
          ? const Value.absent()
          : Value(fechaNacimiento),
      correoElectronico: correoElectronico == null && nullToAbsent
          ? const Value.absent()
          : Value(correoElectronico),
      telefono: telefono == null && nullToAbsent
          ? const Value.absent()
          : Value(telefono),
      cuentaId: cuentaId == null && nullToAbsent
          ? const Value.absent()
          : Value(cuentaId),
      usuarioId: usuarioId == null && nullToAbsent
          ? const Value.absent()
          : Value(usuarioId),
      paisId:
          paisId == null && nullToAbsent ? const Value.absent() : Value(paisId),
    );
  }

  factory PersonaDBRegister.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PersonaDBRegister(
      id: serializer.fromJson<int>(json['id']),
      codigo: serializer.fromJson<String>(json['codigo']),
      nombres: serializer.fromJson<String>(json['nombres']),
      apellidos: serializer.fromJson<String>(json['apellidos']),
      fechaNacimiento: serializer.fromJson<DateTime>(json['fechaNacimiento']),
      correoElectronico: serializer.fromJson<String>(json['correoElectronico']),
      telefono: serializer.fromJson<String>(json['telefono']),
      cuentaId: serializer.fromJson<int>(json['cuentaId']),
      usuarioId: serializer.fromJson<int>(json['usuarioId']),
      paisId: serializer.fromJson<int>(json['paisId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'codigo': serializer.toJson<String>(codigo),
      'nombres': serializer.toJson<String>(nombres),
      'apellidos': serializer.toJson<String>(apellidos),
      'fechaNacimiento': serializer.toJson<DateTime>(fechaNacimiento),
      'correoElectronico': serializer.toJson<String>(correoElectronico),
      'telefono': serializer.toJson<String>(telefono),
      'cuentaId': serializer.toJson<int>(cuentaId),
      'usuarioId': serializer.toJson<int>(usuarioId),
      'paisId': serializer.toJson<int>(paisId),
    };
  }

  PersonaDBRegister copyWith(
          {int id,
          String codigo,
          String nombres,
          String apellidos,
          DateTime fechaNacimiento,
          String correoElectronico,
          String telefono,
          int cuentaId,
          int usuarioId,
          int paisId}) =>
      PersonaDBRegister(
        id: id ?? this.id,
        codigo: codigo ?? this.codigo,
        nombres: nombres ?? this.nombres,
        apellidos: apellidos ?? this.apellidos,
        fechaNacimiento: fechaNacimiento ?? this.fechaNacimiento,
        correoElectronico: correoElectronico ?? this.correoElectronico,
        telefono: telefono ?? this.telefono,
        cuentaId: cuentaId ?? this.cuentaId,
        usuarioId: usuarioId ?? this.usuarioId,
        paisId: paisId ?? this.paisId,
      );
  @override
  String toString() {
    return (StringBuffer('PersonaDBRegister(')
          ..write('id: $id, ')
          ..write('codigo: $codigo, ')
          ..write('nombres: $nombres, ')
          ..write('apellidos: $apellidos, ')
          ..write('fechaNacimiento: $fechaNacimiento, ')
          ..write('correoElectronico: $correoElectronico, ')
          ..write('telefono: $telefono, ')
          ..write('cuentaId: $cuentaId, ')
          ..write('usuarioId: $usuarioId, ')
          ..write('paisId: $paisId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          codigo.hashCode,
          $mrjc(
              nombres.hashCode,
              $mrjc(
                  apellidos.hashCode,
                  $mrjc(
                      fechaNacimiento.hashCode,
                      $mrjc(
                          correoElectronico.hashCode,
                          $mrjc(
                              telefono.hashCode,
                              $mrjc(
                                  cuentaId.hashCode,
                                  $mrjc(usuarioId.hashCode,
                                      paisId.hashCode))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is PersonaDBRegister &&
          other.id == this.id &&
          other.codigo == this.codigo &&
          other.nombres == this.nombres &&
          other.apellidos == this.apellidos &&
          other.fechaNacimiento == this.fechaNacimiento &&
          other.correoElectronico == this.correoElectronico &&
          other.telefono == this.telefono &&
          other.cuentaId == this.cuentaId &&
          other.usuarioId == this.usuarioId &&
          other.paisId == this.paisId);
}

class PersonasTableCompanion extends UpdateCompanion<PersonaDBRegister> {
  final Value<int> id;
  final Value<String> codigo;
  final Value<String> nombres;
  final Value<String> apellidos;
  final Value<DateTime> fechaNacimiento;
  final Value<String> correoElectronico;
  final Value<String> telefono;
  final Value<int> cuentaId;
  final Value<int> usuarioId;
  final Value<int> paisId;
  const PersonasTableCompanion({
    this.id = const Value.absent(),
    this.codigo = const Value.absent(),
    this.nombres = const Value.absent(),
    this.apellidos = const Value.absent(),
    this.fechaNacimiento = const Value.absent(),
    this.correoElectronico = const Value.absent(),
    this.telefono = const Value.absent(),
    this.cuentaId = const Value.absent(),
    this.usuarioId = const Value.absent(),
    this.paisId = const Value.absent(),
  });
  PersonasTableCompanion.insert({
    this.id = const Value.absent(),
    this.codigo = const Value.absent(),
    this.nombres = const Value.absent(),
    this.apellidos = const Value.absent(),
    @required DateTime fechaNacimiento,
    this.correoElectronico = const Value.absent(),
    this.telefono = const Value.absent(),
    @required int cuentaId,
    this.usuarioId = const Value.absent(),
    @required int paisId,
  })  : fechaNacimiento = Value(fechaNacimiento),
        cuentaId = Value(cuentaId),
        paisId = Value(paisId);
  static Insertable<PersonaDBRegister> custom({
    Expression<int> id,
    Expression<String> codigo,
    Expression<String> nombres,
    Expression<String> apellidos,
    Expression<DateTime> fechaNacimiento,
    Expression<String> correoElectronico,
    Expression<String> telefono,
    Expression<int> cuentaId,
    Expression<int> usuarioId,
    Expression<int> paisId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (codigo != null) 'codigo': codigo,
      if (nombres != null) 'nombres': nombres,
      if (apellidos != null) 'apellidos': apellidos,
      if (fechaNacimiento != null) 'fecha_nacimiento': fechaNacimiento,
      if (correoElectronico != null) 'correo_electronico': correoElectronico,
      if (telefono != null) 'telefono': telefono,
      if (cuentaId != null) 'cuenta_id': cuentaId,
      if (usuarioId != null) 'usuario_id': usuarioId,
      if (paisId != null) 'pais_id': paisId,
    });
  }

  PersonasTableCompanion copyWith(
      {Value<int> id,
      Value<String> codigo,
      Value<String> nombres,
      Value<String> apellidos,
      Value<DateTime> fechaNacimiento,
      Value<String> correoElectronico,
      Value<String> telefono,
      Value<int> cuentaId,
      Value<int> usuarioId,
      Value<int> paisId}) {
    return PersonasTableCompanion(
      id: id ?? this.id,
      codigo: codigo ?? this.codigo,
      nombres: nombres ?? this.nombres,
      apellidos: apellidos ?? this.apellidos,
      fechaNacimiento: fechaNacimiento ?? this.fechaNacimiento,
      correoElectronico: correoElectronico ?? this.correoElectronico,
      telefono: telefono ?? this.telefono,
      cuentaId: cuentaId ?? this.cuentaId,
      usuarioId: usuarioId ?? this.usuarioId,
      paisId: paisId ?? this.paisId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (codigo.present) {
      map['codigo'] = Variable<String>(codigo.value);
    }
    if (nombres.present) {
      map['nombres'] = Variable<String>(nombres.value);
    }
    if (apellidos.present) {
      map['apellidos'] = Variable<String>(apellidos.value);
    }
    if (fechaNacimiento.present) {
      map['fecha_nacimiento'] = Variable<DateTime>(fechaNacimiento.value);
    }
    if (correoElectronico.present) {
      map['correo_electronico'] = Variable<String>(correoElectronico.value);
    }
    if (telefono.present) {
      map['telefono'] = Variable<String>(telefono.value);
    }
    if (cuentaId.present) {
      map['cuenta_id'] = Variable<int>(cuentaId.value);
    }
    if (usuarioId.present) {
      map['usuario_id'] = Variable<int>(usuarioId.value);
    }
    if (paisId.present) {
      map['pais_id'] = Variable<int>(paisId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PersonasTableCompanion(')
          ..write('id: $id, ')
          ..write('codigo: $codigo, ')
          ..write('nombres: $nombres, ')
          ..write('apellidos: $apellidos, ')
          ..write('fechaNacimiento: $fechaNacimiento, ')
          ..write('correoElectronico: $correoElectronico, ')
          ..write('telefono: $telefono, ')
          ..write('cuentaId: $cuentaId, ')
          ..write('usuarioId: $usuarioId, ')
          ..write('paisId: $paisId')
          ..write(')'))
        .toString();
  }
}

class $PersonasTableTable extends PersonasTable
    with TableInfo<$PersonasTableTable, PersonaDBRegister> {
  final GeneratedDatabase _db;
  final String _alias;
  $PersonasTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _codigoMeta = const VerificationMeta('codigo');
  GeneratedTextColumn _codigo;
  @override
  GeneratedTextColumn get codigo => _codigo ??= _constructCodigo();
  GeneratedTextColumn _constructCodigo() {
    return GeneratedTextColumn(
      'codigo',
      $tableName,
      true,
    );
  }

  final VerificationMeta _nombresMeta = const VerificationMeta('nombres');
  GeneratedTextColumn _nombres;
  @override
  GeneratedTextColumn get nombres => _nombres ??= _constructNombres();
  GeneratedTextColumn _constructNombres() {
    return GeneratedTextColumn(
      'nombres',
      $tableName,
      true,
    );
  }

  final VerificationMeta _apellidosMeta = const VerificationMeta('apellidos');
  GeneratedTextColumn _apellidos;
  @override
  GeneratedTextColumn get apellidos => _apellidos ??= _constructApellidos();
  GeneratedTextColumn _constructApellidos() {
    return GeneratedTextColumn(
      'apellidos',
      $tableName,
      true,
    );
  }

  final VerificationMeta _fechaNacimientoMeta =
      const VerificationMeta('fechaNacimiento');
  GeneratedDateTimeColumn _fechaNacimiento;
  @override
  GeneratedDateTimeColumn get fechaNacimiento =>
      _fechaNacimiento ??= _constructFechaNacimiento();
  GeneratedDateTimeColumn _constructFechaNacimiento() {
    return GeneratedDateTimeColumn(
      'fecha_nacimiento',
      $tableName,
      false,
    );
  }

  final VerificationMeta _correoElectronicoMeta =
      const VerificationMeta('correoElectronico');
  GeneratedTextColumn _correoElectronico;
  @override
  GeneratedTextColumn get correoElectronico =>
      _correoElectronico ??= _constructCorreoElectronico();
  GeneratedTextColumn _constructCorreoElectronico() {
    return GeneratedTextColumn(
      'correo_electronico',
      $tableName,
      true,
    );
  }

  final VerificationMeta _telefonoMeta = const VerificationMeta('telefono');
  GeneratedTextColumn _telefono;
  @override
  GeneratedTextColumn get telefono => _telefono ??= _constructTelefono();
  GeneratedTextColumn _constructTelefono() {
    return GeneratedTextColumn(
      'telefono',
      $tableName,
      true,
    );
  }

  final VerificationMeta _cuentaIdMeta = const VerificationMeta('cuentaId');
  GeneratedIntColumn _cuentaId;
  @override
  GeneratedIntColumn get cuentaId => _cuentaId ??= _constructCuentaId();
  GeneratedIntColumn _constructCuentaId() {
    return GeneratedIntColumn(
      'cuenta_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _usuarioIdMeta = const VerificationMeta('usuarioId');
  GeneratedIntColumn _usuarioId;
  @override
  GeneratedIntColumn get usuarioId => _usuarioId ??= _constructUsuarioId();
  GeneratedIntColumn _constructUsuarioId() {
    return GeneratedIntColumn(
      'usuario_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _paisIdMeta = const VerificationMeta('paisId');
  GeneratedIntColumn _paisId;
  @override
  GeneratedIntColumn get paisId => _paisId ??= _constructPaisId();
  GeneratedIntColumn _constructPaisId() {
    return GeneratedIntColumn(
      'pais_id',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        codigo,
        nombres,
        apellidos,
        fechaNacimiento,
        correoElectronico,
        telefono,
        cuentaId,
        usuarioId,
        paisId
      ];
  @override
  $PersonasTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'personas';
  @override
  final String actualTableName = 'personas';
  @override
  VerificationContext validateIntegrity(Insertable<PersonaDBRegister> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('codigo')) {
      context.handle(_codigoMeta,
          codigo.isAcceptableOrUnknown(data['codigo'], _codigoMeta));
    }
    if (data.containsKey('nombres')) {
      context.handle(_nombresMeta,
          nombres.isAcceptableOrUnknown(data['nombres'], _nombresMeta));
    }
    if (data.containsKey('apellidos')) {
      context.handle(_apellidosMeta,
          apellidos.isAcceptableOrUnknown(data['apellidos'], _apellidosMeta));
    }
    if (data.containsKey('fecha_nacimiento')) {
      context.handle(
          _fechaNacimientoMeta,
          fechaNacimiento.isAcceptableOrUnknown(
              data['fecha_nacimiento'], _fechaNacimientoMeta));
    } else if (isInserting) {
      context.missing(_fechaNacimientoMeta);
    }
    if (data.containsKey('correo_electronico')) {
      context.handle(
          _correoElectronicoMeta,
          correoElectronico.isAcceptableOrUnknown(
              data['correo_electronico'], _correoElectronicoMeta));
    }
    if (data.containsKey('telefono')) {
      context.handle(_telefonoMeta,
          telefono.isAcceptableOrUnknown(data['telefono'], _telefonoMeta));
    }
    if (data.containsKey('cuenta_id')) {
      context.handle(_cuentaIdMeta,
          cuentaId.isAcceptableOrUnknown(data['cuenta_id'], _cuentaIdMeta));
    } else if (isInserting) {
      context.missing(_cuentaIdMeta);
    }
    if (data.containsKey('usuario_id')) {
      context.handle(_usuarioIdMeta,
          usuarioId.isAcceptableOrUnknown(data['usuario_id'], _usuarioIdMeta));
    }
    if (data.containsKey('pais_id')) {
      context.handle(_paisIdMeta,
          paisId.isAcceptableOrUnknown(data['pais_id'], _paisIdMeta));
    } else if (isInserting) {
      context.missing(_paisIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PersonaDBRegister map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return PersonaDBRegister.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $PersonasTableTable createAlias(String alias) {
    return $PersonasTableTable(_db, alias);
  }
}

class PaisDBRegister extends DataClass implements Insertable<PaisDBRegister> {
  final int id;
  final String codigo;
  final String nombre;
  PaisDBRegister(
      {@required this.id, @required this.codigo, @required this.nombre});
  factory PaisDBRegister.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return PaisDBRegister(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      codigo:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}codigo']),
      nombre:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}nombre']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || codigo != null) {
      map['codigo'] = Variable<String>(codigo);
    }
    if (!nullToAbsent || nombre != null) {
      map['nombre'] = Variable<String>(nombre);
    }
    return map;
  }

  PaisesTableCompanion toCompanion(bool nullToAbsent) {
    return PaisesTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      codigo:
          codigo == null && nullToAbsent ? const Value.absent() : Value(codigo),
      nombre:
          nombre == null && nullToAbsent ? const Value.absent() : Value(nombre),
    );
  }

  factory PaisDBRegister.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PaisDBRegister(
      id: serializer.fromJson<int>(json['id']),
      codigo: serializer.fromJson<String>(json['codigo']),
      nombre: serializer.fromJson<String>(json['nombre']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'codigo': serializer.toJson<String>(codigo),
      'nombre': serializer.toJson<String>(nombre),
    };
  }

  PaisDBRegister copyWith({int id, String codigo, String nombre}) =>
      PaisDBRegister(
        id: id ?? this.id,
        codigo: codigo ?? this.codigo,
        nombre: nombre ?? this.nombre,
      );
  @override
  String toString() {
    return (StringBuffer('PaisDBRegister(')
          ..write('id: $id, ')
          ..write('codigo: $codigo, ')
          ..write('nombre: $nombre')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(codigo.hashCode, nombre.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is PaisDBRegister &&
          other.id == this.id &&
          other.codigo == this.codigo &&
          other.nombre == this.nombre);
}

class PaisesTableCompanion extends UpdateCompanion<PaisDBRegister> {
  final Value<int> id;
  final Value<String> codigo;
  final Value<String> nombre;
  const PaisesTableCompanion({
    this.id = const Value.absent(),
    this.codigo = const Value.absent(),
    this.nombre = const Value.absent(),
  });
  PaisesTableCompanion.insert({
    @required int id,
    @required String codigo,
    @required String nombre,
  })  : id = Value(id),
        codigo = Value(codigo),
        nombre = Value(nombre);
  static Insertable<PaisDBRegister> custom({
    Expression<int> id,
    Expression<String> codigo,
    Expression<String> nombre,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (codigo != null) 'codigo': codigo,
      if (nombre != null) 'nombre': nombre,
    });
  }

  PaisesTableCompanion copyWith(
      {Value<int> id, Value<String> codigo, Value<String> nombre}) {
    return PaisesTableCompanion(
      id: id ?? this.id,
      codigo: codigo ?? this.codigo,
      nombre: nombre ?? this.nombre,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (codigo.present) {
      map['codigo'] = Variable<String>(codigo.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaisesTableCompanion(')
          ..write('id: $id, ')
          ..write('codigo: $codigo, ')
          ..write('nombre: $nombre')
          ..write(')'))
        .toString();
  }
}

class $PaisesTableTable extends PaisesTable
    with TableInfo<$PaisesTableTable, PaisDBRegister> {
  final GeneratedDatabase _db;
  final String _alias;
  $PaisesTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _codigoMeta = const VerificationMeta('codigo');
  GeneratedTextColumn _codigo;
  @override
  GeneratedTextColumn get codigo => _codigo ??= _constructCodigo();
  GeneratedTextColumn _constructCodigo() {
    return GeneratedTextColumn(
      'codigo',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  GeneratedTextColumn _nombre;
  @override
  GeneratedTextColumn get nombre => _nombre ??= _constructNombre();
  GeneratedTextColumn _constructNombre() {
    return GeneratedTextColumn(
      'nombre',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, codigo, nombre];
  @override
  $PaisesTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'paises';
  @override
  final String actualTableName = 'paises';
  @override
  VerificationContext validateIntegrity(Insertable<PaisDBRegister> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('codigo')) {
      context.handle(_codigoMeta,
          codigo.isAcceptableOrUnknown(data['codigo'], _codigoMeta));
    } else if (isInserting) {
      context.missing(_codigoMeta);
    }
    if (data.containsKey('nombre')) {
      context.handle(_nombreMeta,
          nombre.isAcceptableOrUnknown(data['nombre'], _nombreMeta));
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  PaisDBRegister map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return PaisDBRegister.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $PaisesTableTable createAlias(String alias) {
    return $PaisesTableTable(_db, alias);
  }
}

class ObraDBRegister extends DataClass implements Insertable<ObraDBRegister> {
  final int id;
  final String nombre;
  final String descripcion;
  final String imagen;
  final DateTime fecha;
  final String icono;
  final String protagonistas;
  final String direccion;
  final String autores;
  final String duracion;
  final int tipoId;
  final String etiquetas;
  ObraDBRegister(
      {@required this.id,
      @required this.nombre,
      this.descripcion,
      this.imagen,
      @required this.fecha,
      this.icono,
      this.protagonistas,
      this.direccion,
      this.autores,
      this.duracion,
      @required this.tipoId,
      this.etiquetas});
  factory ObraDBRegister.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return ObraDBRegister(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      nombre:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}nombre']),
      descripcion: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}descripcion']),
      imagen:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}imagen']),
      fecha:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}fecha']),
      icono:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}icono']),
      protagonistas: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}protagonistas']),
      direccion: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}direccion']),
      autores:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}autores']),
      duracion: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}duracion']),
      tipoId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}tipo_id']),
      etiquetas: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}etiquetas']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || nombre != null) {
      map['nombre'] = Variable<String>(nombre);
    }
    if (!nullToAbsent || descripcion != null) {
      map['descripcion'] = Variable<String>(descripcion);
    }
    if (!nullToAbsent || imagen != null) {
      map['imagen'] = Variable<String>(imagen);
    }
    if (!nullToAbsent || fecha != null) {
      map['fecha'] = Variable<DateTime>(fecha);
    }
    if (!nullToAbsent || icono != null) {
      map['icono'] = Variable<String>(icono);
    }
    if (!nullToAbsent || protagonistas != null) {
      map['protagonistas'] = Variable<String>(protagonistas);
    }
    if (!nullToAbsent || direccion != null) {
      map['direccion'] = Variable<String>(direccion);
    }
    if (!nullToAbsent || autores != null) {
      map['autores'] = Variable<String>(autores);
    }
    if (!nullToAbsent || duracion != null) {
      map['duracion'] = Variable<String>(duracion);
    }
    if (!nullToAbsent || tipoId != null) {
      map['tipo_id'] = Variable<int>(tipoId);
    }
    if (!nullToAbsent || etiquetas != null) {
      map['etiquetas'] = Variable<String>(etiquetas);
    }
    return map;
  }

  ObrasTableCompanion toCompanion(bool nullToAbsent) {
    return ObrasTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      nombre:
          nombre == null && nullToAbsent ? const Value.absent() : Value(nombre),
      descripcion: descripcion == null && nullToAbsent
          ? const Value.absent()
          : Value(descripcion),
      imagen:
          imagen == null && nullToAbsent ? const Value.absent() : Value(imagen),
      fecha:
          fecha == null && nullToAbsent ? const Value.absent() : Value(fecha),
      icono:
          icono == null && nullToAbsent ? const Value.absent() : Value(icono),
      protagonistas: protagonistas == null && nullToAbsent
          ? const Value.absent()
          : Value(protagonistas),
      direccion: direccion == null && nullToAbsent
          ? const Value.absent()
          : Value(direccion),
      autores: autores == null && nullToAbsent
          ? const Value.absent()
          : Value(autores),
      duracion: duracion == null && nullToAbsent
          ? const Value.absent()
          : Value(duracion),
      tipoId:
          tipoId == null && nullToAbsent ? const Value.absent() : Value(tipoId),
      etiquetas: etiquetas == null && nullToAbsent
          ? const Value.absent()
          : Value(etiquetas),
    );
  }

  factory ObraDBRegister.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ObraDBRegister(
      id: serializer.fromJson<int>(json['id']),
      nombre: serializer.fromJson<String>(json['nombre']),
      descripcion: serializer.fromJson<String>(json['descripcion']),
      imagen: serializer.fromJson<String>(json['imagen']),
      fecha: serializer.fromJson<DateTime>(json['fecha']),
      icono: serializer.fromJson<String>(json['icono']),
      protagonistas: serializer.fromJson<String>(json['protagonistas']),
      direccion: serializer.fromJson<String>(json['direccion']),
      autores: serializer.fromJson<String>(json['autores']),
      duracion: serializer.fromJson<String>(json['duracion']),
      tipoId: serializer.fromJson<int>(json['tipoId']),
      etiquetas: serializer.fromJson<String>(json['etiquetas']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nombre': serializer.toJson<String>(nombre),
      'descripcion': serializer.toJson<String>(descripcion),
      'imagen': serializer.toJson<String>(imagen),
      'fecha': serializer.toJson<DateTime>(fecha),
      'icono': serializer.toJson<String>(icono),
      'protagonistas': serializer.toJson<String>(protagonistas),
      'direccion': serializer.toJson<String>(direccion),
      'autores': serializer.toJson<String>(autores),
      'duracion': serializer.toJson<String>(duracion),
      'tipoId': serializer.toJson<int>(tipoId),
      'etiquetas': serializer.toJson<String>(etiquetas),
    };
  }

  ObraDBRegister copyWith(
          {int id,
          String nombre,
          String descripcion,
          String imagen,
          DateTime fecha,
          String icono,
          String protagonistas,
          String direccion,
          String autores,
          String duracion,
          int tipoId,
          String etiquetas}) =>
      ObraDBRegister(
        id: id ?? this.id,
        nombre: nombre ?? this.nombre,
        descripcion: descripcion ?? this.descripcion,
        imagen: imagen ?? this.imagen,
        fecha: fecha ?? this.fecha,
        icono: icono ?? this.icono,
        protagonistas: protagonistas ?? this.protagonistas,
        direccion: direccion ?? this.direccion,
        autores: autores ?? this.autores,
        duracion: duracion ?? this.duracion,
        tipoId: tipoId ?? this.tipoId,
        etiquetas: etiquetas ?? this.etiquetas,
      );
  @override
  String toString() {
    return (StringBuffer('ObraDBRegister(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('descripcion: $descripcion, ')
          ..write('imagen: $imagen, ')
          ..write('fecha: $fecha, ')
          ..write('icono: $icono, ')
          ..write('protagonistas: $protagonistas, ')
          ..write('direccion: $direccion, ')
          ..write('autores: $autores, ')
          ..write('duracion: $duracion, ')
          ..write('tipoId: $tipoId, ')
          ..write('etiquetas: $etiquetas')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          nombre.hashCode,
          $mrjc(
              descripcion.hashCode,
              $mrjc(
                  imagen.hashCode,
                  $mrjc(
                      fecha.hashCode,
                      $mrjc(
                          icono.hashCode,
                          $mrjc(
                              protagonistas.hashCode,
                              $mrjc(
                                  direccion.hashCode,
                                  $mrjc(
                                      autores.hashCode,
                                      $mrjc(
                                          duracion.hashCode,
                                          $mrjc(tipoId.hashCode,
                                              etiquetas.hashCode))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ObraDBRegister &&
          other.id == this.id &&
          other.nombre == this.nombre &&
          other.descripcion == this.descripcion &&
          other.imagen == this.imagen &&
          other.fecha == this.fecha &&
          other.icono == this.icono &&
          other.protagonistas == this.protagonistas &&
          other.direccion == this.direccion &&
          other.autores == this.autores &&
          other.duracion == this.duracion &&
          other.tipoId == this.tipoId &&
          other.etiquetas == this.etiquetas);
}

class ObrasTableCompanion extends UpdateCompanion<ObraDBRegister> {
  final Value<int> id;
  final Value<String> nombre;
  final Value<String> descripcion;
  final Value<String> imagen;
  final Value<DateTime> fecha;
  final Value<String> icono;
  final Value<String> protagonistas;
  final Value<String> direccion;
  final Value<String> autores;
  final Value<String> duracion;
  final Value<int> tipoId;
  final Value<String> etiquetas;
  const ObrasTableCompanion({
    this.id = const Value.absent(),
    this.nombre = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.imagen = const Value.absent(),
    this.fecha = const Value.absent(),
    this.icono = const Value.absent(),
    this.protagonistas = const Value.absent(),
    this.direccion = const Value.absent(),
    this.autores = const Value.absent(),
    this.duracion = const Value.absent(),
    this.tipoId = const Value.absent(),
    this.etiquetas = const Value.absent(),
  });
  ObrasTableCompanion.insert({
    @required int id,
    @required String nombre,
    this.descripcion = const Value.absent(),
    this.imagen = const Value.absent(),
    @required DateTime fecha,
    this.icono = const Value.absent(),
    this.protagonistas = const Value.absent(),
    this.direccion = const Value.absent(),
    this.autores = const Value.absent(),
    this.duracion = const Value.absent(),
    @required int tipoId,
    this.etiquetas = const Value.absent(),
  })  : id = Value(id),
        nombre = Value(nombre),
        fecha = Value(fecha),
        tipoId = Value(tipoId);
  static Insertable<ObraDBRegister> custom({
    Expression<int> id,
    Expression<String> nombre,
    Expression<String> descripcion,
    Expression<String> imagen,
    Expression<DateTime> fecha,
    Expression<String> icono,
    Expression<String> protagonistas,
    Expression<String> direccion,
    Expression<String> autores,
    Expression<String> duracion,
    Expression<int> tipoId,
    Expression<String> etiquetas,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nombre != null) 'nombre': nombre,
      if (descripcion != null) 'descripcion': descripcion,
      if (imagen != null) 'imagen': imagen,
      if (fecha != null) 'fecha': fecha,
      if (icono != null) 'icono': icono,
      if (protagonistas != null) 'protagonistas': protagonistas,
      if (direccion != null) 'direccion': direccion,
      if (autores != null) 'autores': autores,
      if (duracion != null) 'duracion': duracion,
      if (tipoId != null) 'tipo_id': tipoId,
      if (etiquetas != null) 'etiquetas': etiquetas,
    });
  }

  ObrasTableCompanion copyWith(
      {Value<int> id,
      Value<String> nombre,
      Value<String> descripcion,
      Value<String> imagen,
      Value<DateTime> fecha,
      Value<String> icono,
      Value<String> protagonistas,
      Value<String> direccion,
      Value<String> autores,
      Value<String> duracion,
      Value<int> tipoId,
      Value<String> etiquetas}) {
    return ObrasTableCompanion(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      descripcion: descripcion ?? this.descripcion,
      imagen: imagen ?? this.imagen,
      fecha: fecha ?? this.fecha,
      icono: icono ?? this.icono,
      protagonistas: protagonistas ?? this.protagonistas,
      direccion: direccion ?? this.direccion,
      autores: autores ?? this.autores,
      duracion: duracion ?? this.duracion,
      tipoId: tipoId ?? this.tipoId,
      etiquetas: etiquetas ?? this.etiquetas,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    if (imagen.present) {
      map['imagen'] = Variable<String>(imagen.value);
    }
    if (fecha.present) {
      map['fecha'] = Variable<DateTime>(fecha.value);
    }
    if (icono.present) {
      map['icono'] = Variable<String>(icono.value);
    }
    if (protagonistas.present) {
      map['protagonistas'] = Variable<String>(protagonistas.value);
    }
    if (direccion.present) {
      map['direccion'] = Variable<String>(direccion.value);
    }
    if (autores.present) {
      map['autores'] = Variable<String>(autores.value);
    }
    if (duracion.present) {
      map['duracion'] = Variable<String>(duracion.value);
    }
    if (tipoId.present) {
      map['tipo_id'] = Variable<int>(tipoId.value);
    }
    if (etiquetas.present) {
      map['etiquetas'] = Variable<String>(etiquetas.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ObrasTableCompanion(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('descripcion: $descripcion, ')
          ..write('imagen: $imagen, ')
          ..write('fecha: $fecha, ')
          ..write('icono: $icono, ')
          ..write('protagonistas: $protagonistas, ')
          ..write('direccion: $direccion, ')
          ..write('autores: $autores, ')
          ..write('duracion: $duracion, ')
          ..write('tipoId: $tipoId, ')
          ..write('etiquetas: $etiquetas')
          ..write(')'))
        .toString();
  }
}

class $ObrasTableTable extends ObrasTable
    with TableInfo<$ObrasTableTable, ObraDBRegister> {
  final GeneratedDatabase _db;
  final String _alias;
  $ObrasTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  GeneratedTextColumn _nombre;
  @override
  GeneratedTextColumn get nombre => _nombre ??= _constructNombre();
  GeneratedTextColumn _constructNombre() {
    return GeneratedTextColumn(
      'nombre',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descripcionMeta =
      const VerificationMeta('descripcion');
  GeneratedTextColumn _descripcion;
  @override
  GeneratedTextColumn get descripcion =>
      _descripcion ??= _constructDescripcion();
  GeneratedTextColumn _constructDescripcion() {
    return GeneratedTextColumn(
      'descripcion',
      $tableName,
      true,
    );
  }

  final VerificationMeta _imagenMeta = const VerificationMeta('imagen');
  GeneratedTextColumn _imagen;
  @override
  GeneratedTextColumn get imagen => _imagen ??= _constructImagen();
  GeneratedTextColumn _constructImagen() {
    return GeneratedTextColumn(
      'imagen',
      $tableName,
      true,
    );
  }

  final VerificationMeta _fechaMeta = const VerificationMeta('fecha');
  GeneratedDateTimeColumn _fecha;
  @override
  GeneratedDateTimeColumn get fecha => _fecha ??= _constructFecha();
  GeneratedDateTimeColumn _constructFecha() {
    return GeneratedDateTimeColumn(
      'fecha',
      $tableName,
      false,
    );
  }

  final VerificationMeta _iconoMeta = const VerificationMeta('icono');
  GeneratedTextColumn _icono;
  @override
  GeneratedTextColumn get icono => _icono ??= _constructIcono();
  GeneratedTextColumn _constructIcono() {
    return GeneratedTextColumn(
      'icono',
      $tableName,
      true,
    );
  }

  final VerificationMeta _protagonistasMeta =
      const VerificationMeta('protagonistas');
  GeneratedTextColumn _protagonistas;
  @override
  GeneratedTextColumn get protagonistas =>
      _protagonistas ??= _constructProtagonistas();
  GeneratedTextColumn _constructProtagonistas() {
    return GeneratedTextColumn(
      'protagonistas',
      $tableName,
      true,
    );
  }

  final VerificationMeta _direccionMeta = const VerificationMeta('direccion');
  GeneratedTextColumn _direccion;
  @override
  GeneratedTextColumn get direccion => _direccion ??= _constructDireccion();
  GeneratedTextColumn _constructDireccion() {
    return GeneratedTextColumn(
      'direccion',
      $tableName,
      true,
    );
  }

  final VerificationMeta _autoresMeta = const VerificationMeta('autores');
  GeneratedTextColumn _autores;
  @override
  GeneratedTextColumn get autores => _autores ??= _constructAutores();
  GeneratedTextColumn _constructAutores() {
    return GeneratedTextColumn(
      'autores',
      $tableName,
      true,
    );
  }

  final VerificationMeta _duracionMeta = const VerificationMeta('duracion');
  GeneratedTextColumn _duracion;
  @override
  GeneratedTextColumn get duracion => _duracion ??= _constructDuracion();
  GeneratedTextColumn _constructDuracion() {
    return GeneratedTextColumn(
      'duracion',
      $tableName,
      true,
    );
  }

  final VerificationMeta _tipoIdMeta = const VerificationMeta('tipoId');
  GeneratedIntColumn _tipoId;
  @override
  GeneratedIntColumn get tipoId => _tipoId ??= _constructTipoId();
  GeneratedIntColumn _constructTipoId() {
    return GeneratedIntColumn(
      'tipo_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _etiquetasMeta = const VerificationMeta('etiquetas');
  GeneratedTextColumn _etiquetas;
  @override
  GeneratedTextColumn get etiquetas => _etiquetas ??= _constructEtiquetas();
  GeneratedTextColumn _constructEtiquetas() {
    return GeneratedTextColumn(
      'etiquetas',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        nombre,
        descripcion,
        imagen,
        fecha,
        icono,
        protagonistas,
        direccion,
        autores,
        duracion,
        tipoId,
        etiquetas
      ];
  @override
  $ObrasTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'obras';
  @override
  final String actualTableName = 'obras';
  @override
  VerificationContext validateIntegrity(Insertable<ObraDBRegister> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('nombre')) {
      context.handle(_nombreMeta,
          nombre.isAcceptableOrUnknown(data['nombre'], _nombreMeta));
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    if (data.containsKey('descripcion')) {
      context.handle(
          _descripcionMeta,
          descripcion.isAcceptableOrUnknown(
              data['descripcion'], _descripcionMeta));
    }
    if (data.containsKey('imagen')) {
      context.handle(_imagenMeta,
          imagen.isAcceptableOrUnknown(data['imagen'], _imagenMeta));
    }
    if (data.containsKey('fecha')) {
      context.handle(
          _fechaMeta, fecha.isAcceptableOrUnknown(data['fecha'], _fechaMeta));
    } else if (isInserting) {
      context.missing(_fechaMeta);
    }
    if (data.containsKey('icono')) {
      context.handle(
          _iconoMeta, icono.isAcceptableOrUnknown(data['icono'], _iconoMeta));
    }
    if (data.containsKey('protagonistas')) {
      context.handle(
          _protagonistasMeta,
          protagonistas.isAcceptableOrUnknown(
              data['protagonistas'], _protagonistasMeta));
    }
    if (data.containsKey('direccion')) {
      context.handle(_direccionMeta,
          direccion.isAcceptableOrUnknown(data['direccion'], _direccionMeta));
    }
    if (data.containsKey('autores')) {
      context.handle(_autoresMeta,
          autores.isAcceptableOrUnknown(data['autores'], _autoresMeta));
    }
    if (data.containsKey('duracion')) {
      context.handle(_duracionMeta,
          duracion.isAcceptableOrUnknown(data['duracion'], _duracionMeta));
    }
    if (data.containsKey('tipo_id')) {
      context.handle(_tipoIdMeta,
          tipoId.isAcceptableOrUnknown(data['tipo_id'], _tipoIdMeta));
    } else if (isInserting) {
      context.missing(_tipoIdMeta);
    }
    if (data.containsKey('etiquetas')) {
      context.handle(_etiquetasMeta,
          etiquetas.isAcceptableOrUnknown(data['etiquetas'], _etiquetasMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  ObraDBRegister map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ObraDBRegister.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ObrasTableTable createAlias(String alias) {
    return $ObrasTableTable(_db, alias);
  }
}

class FuncionDBRegister extends DataClass
    implements Insertable<FuncionDBRegister> {
  final int id;
  final DateTime fecha;
  final int monedaId;
  final int paisId;
  final int obraId;
  final double precio;
  FuncionDBRegister(
      {@required this.id,
      @required this.fecha,
      @required this.monedaId,
      @required this.paisId,
      @required this.obraId,
      @required this.precio});
  factory FuncionDBRegister.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final doubleType = db.typeSystem.forDartType<double>();
    return FuncionDBRegister(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      fecha:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}fecha']),
      monedaId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}moneda_id']),
      paisId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}pais_id']),
      obraId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}obra_id']),
      precio:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}precio']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || fecha != null) {
      map['fecha'] = Variable<DateTime>(fecha);
    }
    if (!nullToAbsent || monedaId != null) {
      map['moneda_id'] = Variable<int>(monedaId);
    }
    if (!nullToAbsent || paisId != null) {
      map['pais_id'] = Variable<int>(paisId);
    }
    if (!nullToAbsent || obraId != null) {
      map['obra_id'] = Variable<int>(obraId);
    }
    if (!nullToAbsent || precio != null) {
      map['precio'] = Variable<double>(precio);
    }
    return map;
  }

  FuncionesTableCompanion toCompanion(bool nullToAbsent) {
    return FuncionesTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      fecha:
          fecha == null && nullToAbsent ? const Value.absent() : Value(fecha),
      monedaId: monedaId == null && nullToAbsent
          ? const Value.absent()
          : Value(monedaId),
      paisId:
          paisId == null && nullToAbsent ? const Value.absent() : Value(paisId),
      obraId:
          obraId == null && nullToAbsent ? const Value.absent() : Value(obraId),
      precio:
          precio == null && nullToAbsent ? const Value.absent() : Value(precio),
    );
  }

  factory FuncionDBRegister.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return FuncionDBRegister(
      id: serializer.fromJson<int>(json['id']),
      fecha: serializer.fromJson<DateTime>(json['fecha']),
      monedaId: serializer.fromJson<int>(json['monedaId']),
      paisId: serializer.fromJson<int>(json['paisId']),
      obraId: serializer.fromJson<int>(json['obraId']),
      precio: serializer.fromJson<double>(json['precio']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fecha': serializer.toJson<DateTime>(fecha),
      'monedaId': serializer.toJson<int>(monedaId),
      'paisId': serializer.toJson<int>(paisId),
      'obraId': serializer.toJson<int>(obraId),
      'precio': serializer.toJson<double>(precio),
    };
  }

  FuncionDBRegister copyWith(
          {int id,
          DateTime fecha,
          int monedaId,
          int paisId,
          int obraId,
          double precio}) =>
      FuncionDBRegister(
        id: id ?? this.id,
        fecha: fecha ?? this.fecha,
        monedaId: monedaId ?? this.monedaId,
        paisId: paisId ?? this.paisId,
        obraId: obraId ?? this.obraId,
        precio: precio ?? this.precio,
      );
  @override
  String toString() {
    return (StringBuffer('FuncionDBRegister(')
          ..write('id: $id, ')
          ..write('fecha: $fecha, ')
          ..write('monedaId: $monedaId, ')
          ..write('paisId: $paisId, ')
          ..write('obraId: $obraId, ')
          ..write('precio: $precio')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          fecha.hashCode,
          $mrjc(
              monedaId.hashCode,
              $mrjc(
                  paisId.hashCode, $mrjc(obraId.hashCode, precio.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is FuncionDBRegister &&
          other.id == this.id &&
          other.fecha == this.fecha &&
          other.monedaId == this.monedaId &&
          other.paisId == this.paisId &&
          other.obraId == this.obraId &&
          other.precio == this.precio);
}

class FuncionesTableCompanion extends UpdateCompanion<FuncionDBRegister> {
  final Value<int> id;
  final Value<DateTime> fecha;
  final Value<int> monedaId;
  final Value<int> paisId;
  final Value<int> obraId;
  final Value<double> precio;
  const FuncionesTableCompanion({
    this.id = const Value.absent(),
    this.fecha = const Value.absent(),
    this.monedaId = const Value.absent(),
    this.paisId = const Value.absent(),
    this.obraId = const Value.absent(),
    this.precio = const Value.absent(),
  });
  FuncionesTableCompanion.insert({
    @required int id,
    @required DateTime fecha,
    @required int monedaId,
    @required int paisId,
    @required int obraId,
    @required double precio,
  })  : id = Value(id),
        fecha = Value(fecha),
        monedaId = Value(monedaId),
        paisId = Value(paisId),
        obraId = Value(obraId),
        precio = Value(precio);
  static Insertable<FuncionDBRegister> custom({
    Expression<int> id,
    Expression<DateTime> fecha,
    Expression<int> monedaId,
    Expression<int> paisId,
    Expression<int> obraId,
    Expression<double> precio,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fecha != null) 'fecha': fecha,
      if (monedaId != null) 'moneda_id': monedaId,
      if (paisId != null) 'pais_id': paisId,
      if (obraId != null) 'obra_id': obraId,
      if (precio != null) 'precio': precio,
    });
  }

  FuncionesTableCompanion copyWith(
      {Value<int> id,
      Value<DateTime> fecha,
      Value<int> monedaId,
      Value<int> paisId,
      Value<int> obraId,
      Value<double> precio}) {
    return FuncionesTableCompanion(
      id: id ?? this.id,
      fecha: fecha ?? this.fecha,
      monedaId: monedaId ?? this.monedaId,
      paisId: paisId ?? this.paisId,
      obraId: obraId ?? this.obraId,
      precio: precio ?? this.precio,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fecha.present) {
      map['fecha'] = Variable<DateTime>(fecha.value);
    }
    if (monedaId.present) {
      map['moneda_id'] = Variable<int>(monedaId.value);
    }
    if (paisId.present) {
      map['pais_id'] = Variable<int>(paisId.value);
    }
    if (obraId.present) {
      map['obra_id'] = Variable<int>(obraId.value);
    }
    if (precio.present) {
      map['precio'] = Variable<double>(precio.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FuncionesTableCompanion(')
          ..write('id: $id, ')
          ..write('fecha: $fecha, ')
          ..write('monedaId: $monedaId, ')
          ..write('paisId: $paisId, ')
          ..write('obraId: $obraId, ')
          ..write('precio: $precio')
          ..write(')'))
        .toString();
  }
}

class $FuncionesTableTable extends FuncionesTable
    with TableInfo<$FuncionesTableTable, FuncionDBRegister> {
  final GeneratedDatabase _db;
  final String _alias;
  $FuncionesTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _fechaMeta = const VerificationMeta('fecha');
  GeneratedDateTimeColumn _fecha;
  @override
  GeneratedDateTimeColumn get fecha => _fecha ??= _constructFecha();
  GeneratedDateTimeColumn _constructFecha() {
    return GeneratedDateTimeColumn(
      'fecha',
      $tableName,
      false,
    );
  }

  final VerificationMeta _monedaIdMeta = const VerificationMeta('monedaId');
  GeneratedIntColumn _monedaId;
  @override
  GeneratedIntColumn get monedaId => _monedaId ??= _constructMonedaId();
  GeneratedIntColumn _constructMonedaId() {
    return GeneratedIntColumn(
      'moneda_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _paisIdMeta = const VerificationMeta('paisId');
  GeneratedIntColumn _paisId;
  @override
  GeneratedIntColumn get paisId => _paisId ??= _constructPaisId();
  GeneratedIntColumn _constructPaisId() {
    return GeneratedIntColumn(
      'pais_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _obraIdMeta = const VerificationMeta('obraId');
  GeneratedIntColumn _obraId;
  @override
  GeneratedIntColumn get obraId => _obraId ??= _constructObraId();
  GeneratedIntColumn _constructObraId() {
    return GeneratedIntColumn(
      'obra_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _precioMeta = const VerificationMeta('precio');
  GeneratedRealColumn _precio;
  @override
  GeneratedRealColumn get precio => _precio ??= _constructPrecio();
  GeneratedRealColumn _constructPrecio() {
    return GeneratedRealColumn(
      'precio',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, fecha, monedaId, paisId, obraId, precio];
  @override
  $FuncionesTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'funciones';
  @override
  final String actualTableName = 'funciones';
  @override
  VerificationContext validateIntegrity(Insertable<FuncionDBRegister> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('fecha')) {
      context.handle(
          _fechaMeta, fecha.isAcceptableOrUnknown(data['fecha'], _fechaMeta));
    } else if (isInserting) {
      context.missing(_fechaMeta);
    }
    if (data.containsKey('moneda_id')) {
      context.handle(_monedaIdMeta,
          monedaId.isAcceptableOrUnknown(data['moneda_id'], _monedaIdMeta));
    } else if (isInserting) {
      context.missing(_monedaIdMeta);
    }
    if (data.containsKey('pais_id')) {
      context.handle(_paisIdMeta,
          paisId.isAcceptableOrUnknown(data['pais_id'], _paisIdMeta));
    } else if (isInserting) {
      context.missing(_paisIdMeta);
    }
    if (data.containsKey('obra_id')) {
      context.handle(_obraIdMeta,
          obraId.isAcceptableOrUnknown(data['obra_id'], _obraIdMeta));
    } else if (isInserting) {
      context.missing(_obraIdMeta);
    }
    if (data.containsKey('precio')) {
      context.handle(_precioMeta,
          precio.isAcceptableOrUnknown(data['precio'], _precioMeta));
    } else if (isInserting) {
      context.missing(_precioMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  FuncionDBRegister map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return FuncionDBRegister.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $FuncionesTableTable createAlias(String alias) {
    return $FuncionesTableTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $MensajesTableTable _mensajesTable;
  $MensajesTableTable get mensajesTable =>
      _mensajesTable ??= $MensajesTableTable(this);
  $UsuariosTableTable _usuariosTable;
  $UsuariosTableTable get usuariosTable =>
      _usuariosTable ??= $UsuariosTableTable(this);
  $PersonasTableTable _personasTable;
  $PersonasTableTable get personasTable =>
      _personasTable ??= $PersonasTableTable(this);
  $PaisesTableTable _paisesTable;
  $PaisesTableTable get paisesTable => _paisesTable ??= $PaisesTableTable(this);
  $ObrasTableTable _obrasTable;
  $ObrasTableTable get obrasTable => _obrasTable ??= $ObrasTableTable(this);
  $FuncionesTableTable _funcionesTable;
  $FuncionesTableTable get funcionesTable =>
      _funcionesTable ??= $FuncionesTableTable(this);
  MensajeDao _mensajeDao;
  MensajeDao get mensajeDao => _mensajeDao ??= MensajeDao(this as AppDatabase);
  UsuarioDao _usuarioDao;
  UsuarioDao get usuarioDao => _usuarioDao ??= UsuarioDao(this as AppDatabase);
  PersonaDao _personaDao;
  PersonaDao get personaDao => _personaDao ??= PersonaDao(this as AppDatabase);
  PaisDao _paisDao;
  PaisDao get paisDao => _paisDao ??= PaisDao(this as AppDatabase);
  ObraDao _obraDao;
  ObraDao get obraDao => _obraDao ??= ObraDao(this as AppDatabase);
  FuncionDao _funcionDao;
  FuncionDao get funcionDao => _funcionDao ??= FuncionDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        mensajesTable,
        usuariosTable,
        personasTable,
        paisesTable,
        obrasTable,
        funcionesTable
      ];
}
