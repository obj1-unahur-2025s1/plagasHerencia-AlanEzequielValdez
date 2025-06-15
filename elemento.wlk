
class Barrio{
    const elementos = []

    method esCopado() = elementos.filter({e=>e.esBueno()}).size() > elementos.size()/2
}

class Elemento{

    method esBueno()
    method recibeAtaque(unaPlaga)
}

class Hogar inherits Elemento {
    var mugre 
    var confort

    override method esBueno() = confort/2 >= mugre
    method mugre() = mugre
    method confort() = confort
    override method recibeAtaque(unaPlaga){
        mugre += unaPlaga.nivelDeDanio()
    } 
}

class Huerta inherits Elemento {
    var capDeProd
    var nivelMinimoProd

    override method esBueno() = capDeProd > nivelMinimoProd
    method capDeProd() = capDeProd
    method nivelMinimoProd() = nivelMinimoProd
    override method recibeAtaque(unaPlaga){
        capDeProd = capDeProd-(unaPlaga.nivelDeDanio())*0.1 + (if (unaPlaga.transmiteEnfermedades()) 10 else 0)
    } 
}

class Mascota inherits Elemento {
    var nivelDeSalud

    override method esBueno() = nivelDeSalud > 250
    method nivelDeSalud() = nivelDeSalud
    override method recibeAtaque(unaPlaga){
        if (unaPlaga.transmiteEnfermedades()) nivelDeSalud -= unaPlaga.nivelDeDanio()
    }
}