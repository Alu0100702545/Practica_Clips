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

(defrule inicio
	(initial-fact)
    =>
	(printout t "Bienvenido al sistema experto" crlf)
	(printout t "Aqui se le recomendara varios libro segun sus preferencias " crlf)
	(printout t "" crlf)
	
	(printout t "Conteste a las siguientes preguntas para comezar la busqueda" crlf)
	(printout t "Las opciones soportadas son las que apareceran detro parentesis" crlf)
	(printout t "" crlf)
	(printout t "De que sexo es usted?(hombre o mujer)." crlf)
	(bind ?sexo1 (read))

	(printout t "Que edad tiene? ( 1,2,...... 99)." crlf)
	(bind ?edad1 (read))
	
	(printout t "De que genero esta buscando el libro? (fantasia, miedo, accion, humor, historia,aprender, agricultura,musica, mitologia, religion)." crlf)
	(bind ?genero1 (read))
	(assert (persona(sexo ?sexo1)(edad ?edad1)(genero ?genero1)))
)




(defrule fantasia_peque
	(persona(edad ?a))
	(persona(genero fantasia))
	(test(and(>= ?a 7)(< ?a 15)))
	=>
	(printout t "Los libros recomendados  son los siguientes : "crlf)
	(printout t "" crlf)

	(assert(libro(nombre HarryPotterColeccion)(Editorial Salamandra)(n_pag 3500)))
	(assert(libro(nombre NarniaColeccion)(Editorial Destino)(n_pag 1700)))
	
 	
	
)
 


(defrule fantasia_joven_M
        (persona(sexo mujer)) 
        (persona(edad ?a))
        (persona(genero fantasia))
        (test(and(>= ?a 15)(<= ?a 20)))
        =>
	(printout t "Los libros recomendados  son los siguientes : "crlf)
	(printout t "" crlf)

        (assert(libro(nombre CrepusculoColeccion)(Editorial Anaya)(n_pag 4000)))
        (assert(libro(nombre MemoriasDeIdhun)(Editorial Destino)(n_pag 1700))
        )
)
(defrule fantasia_joven_H
        (persona(sexo hombre))
        (persona(edad ?a))
        (persona(genero fantasia))
        (test(and(>= ?a 15)(<= ?a 20)))
        =>
        (printout t "Los libros recomendados  son los siguientes : "crlf)
        (printout t "" crlf)

        (assert(libro(nombre EragonColeccion)(Editorial Salamandra)(n_pag 3500)))
        (assert(libro(nombre MontaracesColeccion)(Editorial Destino)(n_pag 2000))
        )
        
)
(defrule fantasia_adulta_M
        (persona(sexo mujer))
        (persona(edad ?a))
        (persona(genero fantasia))
        (test(> ?a 20))
        =>
	(printout t "Los libros recomendados  son los siguientes : "crlf)
	(printout t "" crlf)

        (assert(libro(nombre LasSombrasDeGrey)(Editorial Salamandra)(n_pag 800)))
        (assert(libro(nombre CrepusculoColeccion)(Editorial Destino)(n_pag 4000))
        )
        
)
(defrule fantasia_adulta_H
        (persona(sexo hombre))
        (persona(edad ?a))
        (persona(genero fantasia))
        (test(> ?a 20))
        =>
	(printout t "Los libros recomendados  son los siguientes : "crlf)
	(printout t "" crlf)

        (assert(libro(nombre JuegoDeTronosColeccion)(Editorial Salamandra)(n_pag 7000)))
        (assert(libro(nombre ElNombreDelViento)(Editorial Destino)(n_pag 700))
        )
        
)
(defrule accion_peque
        (persona(edad ?a))
        (persona(genero accion))
        (test(and(>= ?a 5)(<= ?a 15)))
        =>
	(printout t "Los libros recomendados  son los siguientes : "crlf)
	(printout t "" crlf)

        (assert(libro(nombre Fuego)(Editorial Salamandra)(n_pag 500)))
        (assert(libro(nombre Septimus)(Editorial Destino)(n_pag 400))
        )
        
)
(defrule accion_joven
        (persona(edad ?a))
        (persona(genero accion))
        (test(and(> ?a 15)(<= ?a 20)))
        =>
        (printout t "Los libros recomendados  son los siguientes : "crlf)
        (printout t "" crlf)

        (assert(libro(nombre ElGritoDeLasTierrasdeHielo)(Editorial Salamandra)(n_pag 500)))
        (assert(libro(nombre Graceling)(Editorial Destino)(n_pag 430))
        )
        
)
(defrule accion_adulta
        (persona(edad ?a))
        (persona(genero accion))
        (test(> ?a 20))
        =>
       (printout t "Los libros recomendados  son los siguientes : "crlf)
       (printout t "" crlf)

        (assert(libro(nombre Temerario)(Editorial Salamandra)(n_pag 1200)))
        (assert(libro(nombre ElCodigoDeDaVinchi)(Editorial Destino)(n_pag 800))
        )
        
)
(defrule humor
        
        (persona(edad ?a))
        (persona(genero humor))
        (test(>= ?a 15))
        =>
        (printout t "Los libros recomendados  son los siguientes : "crlf)
        (printout t "" crlf)

        (assert(libro(nombre 101ReasonstoShop)(Editorial HarperCollins)(n_pag 200)))
        (assert(libro(nombre 3650JokesPunsandRiddles)(Editorial  BlackDogLeventhalPublishers)(n_pag 543))
        )
        
)
(defrule historia_peque
        (persona(edad ?a))
        (persona(genero historia))
        (test(and(>= ?a 5)(< ?a 15)))
        =>
        (printout t "Los libros recomendados  son los siguientes : "crlf)
        (printout t "" crlf)

        (assert(libro(nombre LaEspadadeElbos)(Editorial Salamandra)(n_pag 3500)))
        (assert(libro(nombre LaLocaHistoriaDeLaHumanidad)(Editorial Montena)(n_pag 192))
        )
        
)
(defrule historia_joven
        (persona(edad ?a))
        (persona(genero historia))
        (test(and(>= ?a 15)(<= ?a 20)))
        =>
        (printout t "Los libros recomendados  son los siguientes : "crlf)
        (printout t "" crlf)

        (assert(libro(nombre DonQuijoteDeLaMancha)(Editorial Salamandra)(n_pag 800)))
        (assert(libro(nombre ElCapitanAlatriste)(Editorial Destino)(n_pag 700))
        )
        
)
(defrule historia_adulta
        (persona(sexo mujer))
        (persona(edad ?a))
        (persona(genero historia))
        (test(> ?a 20))
        =>
       (printout t "Los libros recomendados  son los siguientes : "crlf)
       (printout t "" crlf)

        (assert(libro(nombre Ronin)(Editorial Salamandra)(n_pag 1500)))
        (assert(libro(nombre ElTemplo)(Editorial Destino)(n_pag 700))
        )
        
)
(defrule Aprendizaje_peque
        
        (persona(edad ?a))
        (persona(genero apreder))
        (test(and(>= ?a 5)(< ?a 15)))
        =>
        (printout t "Los libros recomendados  son los siguientes : "crlf)
        (printout t "" crlf)

        (assert(libro(nombre TUHIJOJUEGAYAPRENDE)(Editorial Oniro)(n_pag 175)))
        (assert(libro(nombre CuentosdeLepe)(Editorial Anaya)(n_pag 400))
        )
        
)
(defrule Aprendizaje_joven
        (persona(edad ?a))
        (persona(genero aprender))
        (test(and(>= ?a 15)(<= ?a 20)))
        =>
       (printout t "Los libros recomendados  son los siguientes : "crlf)
       (printout t "" crlf)

        (assert(libro(nombre ADOLESCENCIAAPRENDIZAJEYPERSONALIDAD )(Editorial SelloEditorial)(n_pag 336)))
        (assert(libro(nombre Historiadeunamaestra )(Editorial PuntoDeLectura)(n_pag 240))
        )
        
)
(defrule aprendizaje_adulto
       
        (persona(edad ?a))
        (persona(genero aprender))
        (test(> ?a 20))
        =>
        (printout t "Los libros recomendados  son los siguientes : "crlf)
        (printout t "" crlf)

        (assert(libro(nombre EnciclopediaCPlusPlus)(Editorial RaMa)(n_pag 900)))
        (assert(libro(nombre ProgramacionPython)(Editorial Anaya)(n_pag 520))
        )
        
)
(defrule miedo
        (persona(edad ?a))
        (persona(genero miedo))
        (test(>= ?a 15))
        =>
        (printout t "Los libros recomendados  son los siguientes : "crlf)
        (printout t "" crlf)

        (assert(libro(nombre ColoradoKid)(Editorial desconocida)(n_pag 9999)))
        (assert(libro(nombre UndertheDome)(Editorial desconocida)(n_pag 9999))
        )
        
)
(defrule musica
        (persona(edad ?a))
        (persona(genero musica))
        (test(>= ?a 7))
        =>
        (printout t "Los libros recomendados  son los siguientes : "crlf)
        (printout t "" crlf)

        (assert(libro(nombre CursoFacilParaPiano)(Editorial JohnJonson)(n_pag 200)))
        (assert(libro(nombre EducadosConAmor)(Editorial desconocida)(n_pag 300))
        )
        
)
(defrule Agricultura
        (persona(edad ?a))
        (persona(genero agricultura))
        (test(and(>= ?a 10)(<= ?a 40)))
        =>
       (printout t "Los libros recomendados  son los siguientes : "crlf)
       (printout t "" crlf)

        (assert(libro(nombre Apiculturaconocimientodelaabeja )(Editorial MP)(n_pag 792)))
        (assert(libro(nombre CultivoDelOlivo)(Editorial MP)(n_pag 842))
        )
        
)
(defrule mitologia
        
        (persona(edad ?a))
        (persona(genero mitologia))
        (test(>= ?a 15))
        =>
        (printout t "Los libros recomendados  son los siguientes : "crlf)
        (printout t "" crlf)

        (assert(libro(nombre ElAngelPerdido)(Editorial Planeta11)(n_pag 9999)))
        (assert(libro(nombre ArqueologiaDeLosDioses)(Editorial Aguilar)(n_pag 9999))
        )
        
)
(defrule Religion
        
        (persona(edad ?a))
        (persona(genero religion))
        (test(>= ?a 15))
        =>
       (printout t "Los libros recomendados  son los siguientes : "crlf)
       (printout t "" crlf)

        (assert(libro(nombre LaBIBLIA)(Editorial desconocido)(n_pag 9999)))
        (assert(libro(nombre ELCoran)(Editorial Desconocido)(n_pag 9999))
        )
        
)


(defrule resultado
	(libro(nombre ?n)(Editorial ?e)(n_pag ?p))
    =>
	;(printout t "" crlf)
	(printout t "Libro: " ?n " Editorial: " ?e " numero_paginas: " ?p crlf)
)

