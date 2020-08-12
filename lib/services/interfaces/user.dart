class User {
  final int id;
  final String nom;
  final String cognoms;
  final String correu;
  final String nick;
  final String idioma;

  /// @property {string} fullName This property is created when userDb.read() is called
  final String fullName;

  /// @property {boolean} checked This property helps to identify a checked member
  final bool checked;

  /// @property {boolean} disabled This property helps to identify a disabled (not checkable) member
  final bool disabled;

  User(
    this.id,
    this.nom,
    this.cognoms,
    this.correu,
    this.nick,
    this.idioma,
    this.fullName,
    this.checked,
    this.disabled,
  );
}
