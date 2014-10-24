;-----------------------------------------
;         BIBLIOTECA DE LIBROS
;-----------------------------------------
;Nombre:Fabián Díaz Lorenzo
;Grupo de Practicas: L3
;Asignatura: INTELIGENCIA ARTIFICIAL
;Práctica de Sistema Experto basado en Reglas con CLIPS 
;************************************************************************
;Este programa lo que realizar es segun unos valores:
;	* sexo
;	* edad
;	* genero literario
;Te devolvera varias opciones de literatura adaptada a esos requisitos 
;en forma de: 
;	* Nombre del libro
;	* Editorial
;	* Numero de paginas
;
;***********************************************************************
(deftemplate persona
	(slot sexo(type SYMBOL)(allowed-symbols hombre mujer))
	(slot edad(type INTEGER))
	(slot genero(type SYMBOL))
)
(deftemplate libro
	(slot nombre (type SYMBOL))
	(slot Editorial(type SYMBOL))
	(slot n_pag(type INTEGER))
)
(
(defrule fantasia_peque

	(persona(edad ?a))
	(persona(genero fantasia))
	(test(and(>= ?a 7)(< ?a 15)))
	=>
	(printout "Bienvenido a la biblioteca de libros" crlf)
	(printout "Al poner la edad" ?a "los libros seran los mismos para los dos sexos" crlf)
	(printout "Los libros son los siguientes")
	(assert(libro(nombre HarryPotterColeccion)(Editorial Salamandra)(n_pag 3500)))
	(assert(libro(nombre NarniaColeccion)(Editorial Destino)(n_pag 1700))
	)
	(facts)
)
(defrule fantasia_joven_M
        (persona(sexo mujer)) 
        (persona(edad ?a))
        (persona(genero fantasia))
        (test(and(>= ?a 15)(<= ?a 20)))
        =>
        (printout "Bienvenido a la biblioteca de libros" crlf)
        (printout )
        (assert(libro(nombre CrepusculoColeccion)(Editorial Salamandra)(n_pag 3500)))
        (assert(libro(nombre MemoriasDeIdhun)(Editorial Destino)(n_pag 1700))
        )
        (facts)
)
(defrule fantasia_joven_H
        (persona(sexo varon))
        (persona(edad ?a))
        (persona(genero fantasia))
        (test(and(>= ?a 15)(<= ?a 20)))
        =>
        (printout "Bienvenido a la biblioteca de libros" crlf)
        (assert(libro(nombre EragonColeccion)(Editorial Salamandra)(n_pag 3500)))
        (assert(libro(nombre MontaracesColeccion)(Editorial Destino)(n_pag 1700))
        )
        (facts)
)
(defrule fantasia_adulta_M
        (persona(sexo mujer))
        (persona(edad ?a))
        (persona(genero fantasia))
        (test(and(>= ?a 15)(<= ?a 20)))
        =>
        (printout "Bienvenido a la biblioteca de libros" crlf)
        (printout "Para la edad " ?a " Los libros son los siguientes")
        (assert(libro(nombre LasSombrasDeGrey)(Editorial Salamandra)(n_pag 3500)))
        (assert(libro(nombre CrepusculoColeccion)(Editorial Destino)(n_pag 1700))
        )
        (facts)
)
(defrule fantasia_adulta_H
        (persona(sexo varon))
        (persona(edad ?a))
        (persona(genero fantasia))
        (test(and(>= ?a 15)(<= ?a 20)))
        =>
        (printout "Bienvenido a la biblioteca de libros" crlf)
        (printout "Para la edad " ?a " Los libros son los siguientes")
        (assert(libro(nombre JuegoDeTronosColeccion)(Editorial Salamandra)(n_pag 3500)))
        (assert(libro(nombre ElNombreDelViento)(Editorial Destino)(n_pag 1700))
        )
        (facts)
)
(defrule accion_peque
        (persona(sexo mujer))
        (persona(edad ?a))
        (persona(genero fantasia))
        (test(and(>= ?a 15)(<= ?a 20)))
        =>
        (printout "Bienvenido a la biblioteca de libros" crlf)
        (printout "Para la edad " ?a "Los libros son los siguientes")
        (assert(libro(nombre Fuego)(Editorial Salamandra)(n_pag 3500)))
        (assert(libro(nombre Septimus)(Editorial Destino)(n_pag 1700))
        )
        (facts)
)
(defrule accion_joven
        (persona(sexo mujer))
        (persona(edad ?a))
        (persona(genero fantasia))
        (test(and(>= ?a 15)(<= ?a 20)))
        =>
        (printout "Bienvenido a la biblioteca de libros" crlf)
        (printout "Para la edad " ?a " Los libros son los siguientes")
        (assert(libro(nombre ElGritoDeLasTierrasdeHielo)(Editorial Salamandra)(n_pag 3500)))
        (assert(libro(nombre Graceling)(Editorial Destino)(n_pag 1700))
        )
        (facts)
)
(defrule accion_adulta
        (persona(sexo mujer))
        (persona(edad ?a))
        (persona(genero fantasia))
        (test(and(>= ?a 15)(<= ?a 20)))
        =>
        (printout "Bienvenido a la biblioteca de libros" crlf)
        (printout "Para la edad " ?a " Los libros son los siguientes")
        (assert(libro(nombre Temerario)(Editorial Salamandra)(n_pag 3500)))
        (assert(libro(nombre ElCodigoDeDaVinchi)(Editorial Destino)(n_pag 1700))
        )
        (facts)
)
(defrule fantasia_joven
        (persona(sexo mujer))
        (persona(edad ?a))
        (persona(genero fantasia))
        (test(and(>= ?a 15)(<= ?a 20)))
        =>
        (printout "Bienvenido a la biblioteca de libros" crlf)
        (printout "Para la edad " ?a " Los libros son los siguientes")
        (assert(libro(nombre HarryPotterColeccion)(Editorial Salamandra)(n_pag 3500)))
        (assert(libro(nombre NarniaColeccion)(Editorial Destino)(n_pag 1700))
        )
        (facts)
)
(defrule historia_peque
        (persona(sexo mujer))
        (persona(edad ?a))
        (persona(genero fantasia))
        (test(and(>= ?a 15)(<= ?a 20)))
        =>
        (printout "Bienvenido a la biblioteca de libros" crlf)
        (printout "Para la edad " ?a " Los libros son los siguientes")
        (assert(libro(nombre LaEspadadeElbos)(Editorial Salamandra)(n_pag 3500)))
        (assert(libro(nombre LaLocaHistoriaDeLaHumanidad)(Editorial Montena)(n_pag 192))
        )
        (facts)
)
(defrule historia_joven
        (persona(sexo mujer))
        (persona(edad ?a))
        (persona(genero fantasia))
        (test(and(>= ?a 15)(<= ?a 20)))
        =>
        (printout "Bienvenido a la biblioteca de libros" crlf)
        (printout "Para la edad " ?a " Los libros son los siguientes")
        (assert(libro(nombre DonQuijoteDeLaMancha)(Editorial Salamandra)(n_pag 3500)))
        (assert(libro(nombre ElCapitanAlatriste)(Editorial Destino)(n_pag 1700))
        )
        (facts)
)
(defrule historia_adulta
        (persona(sexo mujer))
        (persona(edad ?a))
        (persona(genero fantasia))
        (test(and(>= ?a 15)(<= ?a 20)))
        =>
        (printout "Bienvenido a la biblioteca de libros" crlf)
        (printout "Para la edad " ?a " Los libros son los siguientes")
        (assert(libro(nombre Ronin)(Editorial Salamandra)(n_pag 3500)))
        (assert(libro(nombre ElTemplo)(Editorial Destino)(n_pag 1700))
        )
        (facts)
)
(defrule Aprendizaje_peque
        (persona(sexo mujer))
        (persona(edad ?a))
        (persona(genero fantasia))
        (test(and(>= ?a 15)(<= ?a 20)))
        =>
        (printout "Bienvenido a la biblioteca de libros" crlf)
        (printout "Para la edad " ?a " Los libros son los siguientes")
        (assert(libro(nombre HarryPotterColeccion)(Editorial Salamandra)(n_pag 3500)))
        (assert(libro(nombre NarniaColeccion)(Editorial Destino)(n_pag 1700))
        )
        (facts)
)
(defrule Aprendizaje_joven
        (persona(sexo mujer))
        (persona(edad ?a))
        (persona(genero fantasia))
        (test(and(>= ?a 15)(<= ?a 20)))
        =>
        (printout "Bienvenido a la biblioteca de libros" crlf)
        (printout "Para la edad " ?a " Los libros son los siguientes")
        (assert(libro(nombre HarryPotterColeccion)(Editorial Salamandra)(n_pag 3500)))
        (assert(libro(nombre NarniaColeccion)(Editorial Destino)(n_pag 1700))
        )
        (facts)
)
(defrule aprendizaje_adulto
        (persona(sexo mujer))
        (persona(edad ?a))
        (persona(genero fantasia))
        (test(and(>= ?a 15)(<= ?a 20)))
        =>
        (printout "Bienvenido a la biblioteca de libros" crlf)
        (printout "Para la edad " ?a " Los libros son los siguientes")
        (assert(libro(nombre HarryPotterColeccion)(Editorial Salamandra)(n_pag 3500)))
        (assert(libro(nombre NarniaColeccion)(Editorial Destino)(n_pag 1700))
        )
        (facts)
)
(defrule fantasia_joven
        (persona(sexo mujer))
        (persona(edad ?a))
        (persona(genero fantasia))
        (test(and(>= ?a 15)(<= ?a 20)))
        =>
        (printout "Bienvenido a la biblioteca de libros" crlf)
        (printout "Para la edad " ?a " Los libros son los siguientes")
        (assert(libro(nombre HarryPotterColeccion)(Editorial Salamandra)(n_pag 3500)))
        (assert(libro(nombre NarniaColeccion)(Editorial Destino)(n_pag 1700))
        )
        (facts)
)
(defrule fantasia_joven
        (persona(sexo mujer))
        (persona(edad ?a))
        (persona(genero fantasia))
        (test(and(>= ?a 15)(<= ?a 20)))
        =>
        (printout "Bienvenido a la biblioteca de libros" crlf)
        (printout "Para la edad " ?a " Los libros son los siguientes")
        (assert(libro(nombre HarryPotterColeccion)(Editorial Salamandra)(n_pag 3500)))
        (assert(libro(nombre NarniaColeccion)(Editorial Destino)(n_pag 1700))
        )
        (facts)
)
(defrule fantasia_joven
        (persona(sexo mujer))
        (persona(edad ?a))
        (persona(genero fantasia))
        (test(and(>= ?a 15)(<= ?a 20)))
        =>
        (printout "Bienvenido a la biblioteca de libros" crlf)
        (printout "Para la edad " ?a " Los libros son los siguientes")
        (assert(libro(nombre HarryPotterColeccion)(Editorial Salamandra)(n_pag 3500)))
        (assert(libro(nombre NarniaColeccion)(Editorial Destino)(n_pag 1700))
        )
        (facts)
)
(defrule fantasia_joven
        (persona(sexo mujer))
        (persona(edad ?a))
        (persona(genero fantasia))
        (test(and(>= ?a 15)(<= ?a 20)))
        =>
        (printout "Bienvenido a la biblioteca de libros" crlf)
        (printout "Para la edad " ?a " Los libros son los siguientes")
        (assert(libro(nombre HarryPotterColeccion)(Editorial Salamandra)(n_pag 3500)))
        (assert(libro(nombre NarniaColeccion)(Editorial Destino)(n_pag 1700))
        )
        (facts)
)
(defrule fantasia_joven
        (persona(sexo mujer))
        (persona(edad ?a))
        (persona(genero fantasia))
        (test(and(>= ?a 15)(<= ?a 20)))
        =>
        (printout "Bienvenido a la biblioteca de libros" crlf)
        (printout "Para la edad " ?a " Los libros son los siguientes")
        (assert(libro(nombre HarryPotterColeccion)(Editorial Salamandra)(n_pag 3500)))
        (assert(libro(nombre NarniaColeccion)(Editorial Destino)(n_pag 1700))
        )
        (facts)
)
