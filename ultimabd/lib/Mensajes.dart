class Mensajes {
  final num id;
  final num iduDe;
  final num idPara;
  final String titulo;
  final String mensaje;
  final num idGrupo;
  final String fecha;
  final String hora;
  final String tags;

  Mensajes(this.id, this.iduDe, this.idPara, this.titulo, this.mensaje,
      this.idGrupo, this.fecha, this.hora, this.tags);
}

List<Mensajes> mensajesDatos = [];
