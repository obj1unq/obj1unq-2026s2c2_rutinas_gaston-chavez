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
  var peso // con property esta mal colocarlo porque peso perdido ya me devuelve su peso y aplicar rutina me hace el proceso de cambiar el peso

  method tiempo()

  method caloriasPorKilo()

  method puedeRealizarRutina(rutina)

  method pesoPerdido(rutina){
    return rutina.caloriasConsumidas(self.tiempo())/ self.caloriasPorKilo()
  }

  method aplicarRutina(rutina) {
    self.validarSiPuedeAplicarRutina(rutina)
    peso = (peso - self.pesoPerdido(rutina)).truncate(3)
  }

  method validarSiPuedeAplicarRutina(rutina) {
    if(self.puedeRealizarRutina(rutina)) {
      self.error("No se puede realizar la rutina")
    }
  }
}

class PersonaSedentaria inherits Persona {
  var property tiempo  
  
  override method caloriasPorKilo() {
    return 7000
  }

  override method puedeRealizarRutina(rutina) {
    return peso <= 50
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

  override method puedeRealizarRutina(rutina) {
    return rutina.caloriasConsumidas(self.tiempo()) <= 10000
  }

  
}

class Predio { //predio nautico ejemplo
  const property rutinas = #{remaEnDelta,caminosDeLosRemeros}

  method caloriasConsumidasDePredio(persona) {
    return rutinas.sum({rutina => rutina.caloriasConsumidas(persona.tiempo())})
  }
}

class Club {
  const property predios = #{nautico,recreo}

  method elMejorPredioPara(persona) {
    const rutinasCalorias = predios.map({predio => predio.caloriasConsumidasDePredio(persona)})
    return if (rutinasCalorias.min() >rutinasCalorias.max()) rutinasCalorias.min() else rutinasCalorias.max()
  } 

  //acumular las calorias de una persona en una rutina o varias rutinas
  //comparar las calorias de esas rutinas y devolver cual es la mejor rutina para la persona

}