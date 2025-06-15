
class Plaga {

  var property poblacion

  method nivelDeDanio()
  method transmiteEnfermedades() = poblacion > 10
  method atacar(unElemento) {
    poblacion *= 1.1 
    unElemento.recibeAtaque(self)
  } 
}

class Cucarachas inherits Plaga {

  var property pesoPromedio

  override method nivelDeDanio() = poblacion/2
  override method transmiteEnfermedades() = super() and pesoPromedio > 10
  override method atacar(unElemento){
    super(unElemento)
    pesoPromedio += 2
  } 
}

class Mosquitos inherits Plaga {

  override method nivelDeDanio() = poblacion
  override method transmiteEnfermedades() = super() and (poblacion % 3) == 0
}

class Pulgas inherits Plaga {

  override method nivelDeDanio() = poblacion*2
}

class Garrapatas inherits Pulgas {

  override method atacar(unElemento){
    poblacion *= 1.2 
    unElemento.recibeAtaque(self)
  }
}