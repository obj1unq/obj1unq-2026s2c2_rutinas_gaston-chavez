1. Indicar un template method en la solución. Dónde está el template y cuales son los métodos hooks. Indicar quienes implementan métodos hooks
-Respuesta:
    -en la clase Persona, hay un template method aplicarRutina(rutina). Sus metodos hooks son validarSiPuedeAplicarRutina(rutina), puedeRealizarRutina(rutina),pesoPerdido(rutina)
    -Quienes implementan los metodos hook es la clase PersonaSedentaria que redefine el metodo puedeRealizarRutina(rutina)
    la clase PersonaAtleta redefine puedeRealizarRutina(rutina) y pesoPerdido(rutina)

2. Dibujar un diagrama estático que muestre la relación entre clubes, predios y rutinas. Se pide solo incluir los métodos polimórficos y los relacionados con el template method del punto anterior.
-Link diagrama: https://imgur.com/a/NVY0v0X