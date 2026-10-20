class Running {
    var property intensidad

    method caloriasConsumidas(tiempo) {
      return 100 * (tiempo - self.descanso(tiempo)) * intensidad
    }

    method descanso(tiempo) {
      return if(tiempo > 20) 5 else 2
    }
}

class Maraton inherits Running {
  override method caloriasConsumidas(tiempo){
    return super(tiempo) * 2
  }
}

class Remo {
    method intensidad() {
      return 1.3
    }

    method caloriasConsumidas(tiempo){
      return 100 * (tiempo - self.descanso(tiempo)) * self.intensidad()
    }

    method descanso(tiempo) {
      return tiempo / 5
    }
}

class RemoDeCompeticion inherits Remo{
    override method intensidad() {
      return 1.7
    }

    override method descanso(tiempo) {
      return (super(tiempo) - 3).max(2)
    }
}