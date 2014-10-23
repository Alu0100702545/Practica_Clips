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
	;(or persona(sexo hombre) persona(sexo mujer)) 
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

