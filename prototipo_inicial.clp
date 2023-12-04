;; -----------------------------------------------------
;; AQUI IRIAN TODAS LAS CLASES DE LA ONTOLOGIA CREADAS 
;; CON OWL2CLIPS A PARTIR DEL FICHERO TURTLE DE PROTEGE
;; -----------------------------------------------------


;; -----------------------------------------------------------
;; AQUI TODAS LAS INSTANCIAS QUE DIOS SABE COMO VAMOS A CREAR
;; -----------------------------------------------------------

;; Usaremos modulos para estructurar bien el codigo, en vez
;; de usar la sentencia defmodule y luego todo el codigo
;; definiremos todos los modulos al principio con nombres 
;; autosignificantes, y al hacer cualquier regla, hecho, etc
;; usaremos nombre_modulo::nombre

;; USAMOS EL METODO DE RESOLUCION DE CLASIFICACION HEURÍSTICA! (abstraccion -> asociacion heuristica -> refinamiento)
;; Es el necesario para este problema, ya que se trata de una tarea de analisis

;; Modulo main 
(defmodule MAIN (export ?ALL))

;; Modulo de recogida de datos del usuario 
;; (podemos dividirlo en mas modulos mas adelante si vemos que hay como "subgrupos" de preguntas)
(defmodule recogida_datos
	(import MAIN ?ALL)
	(export ?ALL)
)

;; Modulo que permite pasar de un problema concreto a uno abstracto, con la abstraccion de los datos recogidos
(defmodule abstraccion_datos
	(import MAIN ?ALL)
	(import recogida_datos ?ALL)
	(export ?ALL)
)

;;Modulo que realiza la asociacion heuristica
(defmodule asociacion_heuristica
	(import MAIN ?ALL)
	(export ?ALL)
)

;;Modulo que muestra el resultado (refinamiento/adaptacion)
(defmodule impresion_resultado
	(import MAIN ?ALL)
	(import recogida_datos ?ALL)
	(import abstraccion_datos ?ALL)
	(import asociacion_heuristica ?ALL)
	(export ?ALL)
)

(defrule MAIN::reglaInicial
	(declare (salience 10))
	=>
	(printout t crlf)
	(printout t "--------------------------------------------------------------" crlf)
	(printout t "------------ Sistema de Recomendacion de Libros --------------" crlf)
	(printout t "--------------------------------------------------------------" crlf)
	(printout t crlf)
	(focus impresion_resultado) ;;Deberia ser a recogida_datos, esto es provisional
)

;; ----------------------------------------
;; ------------- TEMPLATES ----------------
;; ----------------------------------------

; Aqui todos los deftemplates que necesitemos

;;; Template para las preferencias del usuario
(deftemplate MAIN::preferencias
	(multislot generos (type INSTANCE))
	(multislot autores (type INSTANCE))
)

;; ----------------------------------------
;; ------------- FUNCIONES ----------------
;; ----------------------------------------

;; Aqui todas las deffunctions que necesitemos 
;; (haran falta para las preguntas, cuando por ejemplo necesitemos ver que la respuesta tiene un formato adecuado)

;;Ejemplo:
(deffunction MAIN::pregunt_si_no (?preg)
	(format t "%s [Y/N] " ?preg)
	(bind ?resp (read))
	(while (not(or(eq ?resp Y)(eq ?resp N))) do
		(printout t ?preg)
		(bind ?resp (read))
	)
	(if (eq ?resp Y)
		then TRUE
		else FALSE)
)


;; EN CADA REGALA QUE SE EJECUTA COMO ULTIMA EN CADA MODULO,
;; USAREMOS (focus nuevo_modulo) para pasar al siguiente modulo.

;; ---------------------------------------------------
;; ---------- MODULO DE RECOGIDA DE DATOS ------------
;; ---------------------------------------------------


;; --------------------------------------------------------------------
;; ---------- MODULO DE ABSTRACCION DE LOS DATOS RECOGIDOS ------------
;; --------------------------------------------------------------------


;; --------------------------------------------------------------------
;; ------------------ MODULO DE ASOCIACION HEURISTICA -----------------
;; --------------------------------------------------------------------


;; --------------------------------------------------------------------
;; --------------- MODULO DE IMPRESION DEL RESULTADO ------------------
;; --------------------------------------------------------------------


(defrule impresion_resultado::imprime_gay "regla inicial"
	(declare (salience 10))
	=>
	(printout t crlf)
	(printout t "Eres gay, fin del programa." crlf)
	(printout t crlf)
)
















