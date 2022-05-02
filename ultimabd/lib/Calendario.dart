class Calendario {
  final int id;
  final int idUsuario;
  final String nombre;
  final DateTime fechaIni;
  final DateTime fechaFin;
  final String horaIni;
  final String horaFin;
  final String detalles;
  final String tipo;
  final String imgIni;
  final String imgFin;

  Calendario(
      this.id,
      this.idUsuario,
      this.nombre,
      this.fechaIni,
      this.fechaFin,
      this.horaIni,
      this.horaFin,
      this.detalles,
      this.tipo,
      this.imgIni,
      this.imgFin);
}

List<Calendario> calendarioDatos = [];
