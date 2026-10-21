class Rutina {
  method intensidad()
  
  method caloriasConsumidas(tiempo){
    return 100 * (tiempo - self.descanso(tiempo)) * self.intensidad()
  }

  method descanso(tiempo) 
}


class Running inherits Rutina{
    var property intensidad

    override method descanso(tiempo) {
      return if(tiempo > 20) 5 else 2
    }
}

class Maraton inherits Running {
  override method caloriasConsumidas(tiempo){
    return super(tiempo) * 2
  }
}

class Remo inherits Rutina {
    override method intensidad() {
      return 1.3
    }

    override method descanso(tiempo) {
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

class Persona {
  var property peso

  method tiempo()

  method caloriasPorKilo()

  method pesoPerdido(rutina){
    return rutina.caloriasConsumidas(self.tiempo())/ self.caloriasPorKilo()
  }

  method aplicarRutina(rutina) {
    self.validarSiPuedeAplicarRutina(rutina)
    peso = (peso - self.pesoPerdido(rutina)).truncate(3)
  }

  method validarSiPuedeAplicarRutina(rutina) 

}

class PersonaSedentaria inherits Persona {
  var property tiempo  
  
  override method caloriasPorKilo() {
    return 7000
  }

  override method validarSiPuedeAplicarRutina(rutina) {
    if(peso <= 50){
      self.error("no puede aplicar rutina")
    }
  }
}

class PersonaAtleta inherits Persona{
  
  override method tiempo() {
    return 90
  }

  override method pesoPerdido(rutina) {
    return super(rutina) -1
  }

  override method caloriasPorKilo() {
    return 8000
  }

  override method validarSiPuedeAplicarRutina(rutina) {
    if(rutina.caloriasConsumidas(self.tiempo()) <= 10000){
      self.error("no puede aplicar rutina")
    }
  }
}