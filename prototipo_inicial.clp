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
(defmodule recogidaDatos
	(import MAIN ?ALL)
	(export ?ALL)
)

;; Modulo que permite pasar de un problema concreto a uno abstracto, con la abstraccion de los datos recogidos
(defmodule abstraccionDatos
	(import MAIN ?ALL)
	(import recogidaDatos ?ALL)
	(export ?ALL)
)

;;Modulo que realiza la asociacion heuristica
(defmodule asociacionHeuristica
	(import MAIN ?ALL)
	(export ?ALL)
)

;;Modulo que muestra el resultado (refinamiento/adaptacion)
(defmodule impresionResultado
	(import MAIN ?ALL)
	(import recogidaDatos ?ALL)
	(import abstraccionDatos ?ALL)
	(import asociacionHeuristica ?ALL)
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
	(focus recogidaDatos) ;;Deberia ser a recogida_datos, esto es provisional
)

;; ----------------------------------------
;; ------------- TEMPLATES ----------------
;; ----------------------------------------

; Aqui todos los deftemplates que necesitemos

(deftemplate MAIN::datosUsuario
	(slot edad (type INTEGER))
	(slot lugarLectura (type SYMBOL) (default NONE))
	(slot frecuencia (type SYMBOL) (default NONE))
	(slot periodo (type INTEGER) (default -1))
	(slot buenaCritica (type SYMBOL) (default NONE))
	(slot buenaVenta (type SYMBOL) (default NONE))
) 

;;; Template para las preferencias del usuario
(deftemplate MAIN::preferenciasUsuario
	(multislot generos (type INSTANCE))
	(multislot autores (type INSTANCE))
)

;; ----------------------------------------
;; ------------- FUNCIONES ----------------
;; ----------------------------------------

;; Aqui todas las deffunctions que necesitemos 
;; (haran falta para las preguntas, cuando por ejemplo necesitemos ver que la respuesta tiene un formato adecuado)

;;; Funcion para hacer una pregunta con respuesta numerica unica
(deffunction MAIN::preguntaNumerica (?pregunta)
	(printout t ?pregunta)
	(bind ?response (read))
	?response
)

(deffunction MAIN::preguntaSiNo (?pregunta)
   (format t "%s [S/N] " ?pregunta)
   (bind ?resp (read))

   (while (not (or (eq ?resp S) (eq ?resp N) (eq ?resp s) (eq ?resp n)))
   		(format t "%s [S/N] " ?pregunta)
      (bind ?resp (read))
   )

   (if (or (eq ?resp S) (eq ?resp s))
      then TRUE
      else FALSE
   )
)


(deffunction MAIN::preguntaConIndices (?pregunta $?valores-posibles)
   (bind ?indice 1)
   (bind ?linea (format nil "%s" ?pregunta))
   (printout t ?linea crlf)

   (progn$ (?valor $?valores-posibles)
      (bind ?linea (format nil "  %d. %s" ?indice ?valor))
      (printout t ?linea crlf)
      (bind ?indice (+ ?indice 1))
   )

   (format t "%s" "Indica el indice de tu respuesta: ")
   (bind ?resp (read))
   ?resp
)


;; EN CADA REGALA QUE SE EJECUTA COMO ULTIMA EN CADA MODULO,
;; USAREMOS (focus nuevo_modulo) para pasar al siguiente modulo.

;; ---------------------------------------------------
;; ---------- MODULO DE RECOGIDA DE DATOS ------------
;; ---------------------------------------------------

(defrule recogidaDatos::determinarEdad "Se pregunta por la edad"
	(not (datosUsuario))
	=>
	(bind ?edad (preguntaNumerica "Que edad tienes? "))
	(assert (datosUsuario (edad ?edad)))
	(printout t crlf)
)

(defrule recogidaDatos::determinarLugar "Se pregunta por el lugar de lectura"
	?datos <- (datosUsuario (lugarLectura ?lugar))
	(test (eq ?lugar NONE))
	=> 
	(bind ?resp (preguntaConIndices "Donde sueles leer? " "Lugar tranquilo" "Lugar concurrido"))
	(if (= ?resp 1) 
		then (modify ?datos (lugarLectura TRANQUILO))
		else (modify ?datos (lugarLectura CONCURRIDO))
	)
	(printout t crlf)
)

(defrule recogidaDatos::determinarFrecuencia "Se pregunta por la frecuencia de lectura"
	?datos <- (datosUsuario (frecuencia ?freq))
	(test (eq ?freq NONE))
	=> 
	(bind ?resp (preguntaConIndices "Con que frecuencia lees? " "Diariamente" "Ocasionalmente" "Semanalmente"))
	(if (= ?resp 1) 
		then (modify ?datos (frecuencia DIARIAMENTE))
		else (modify ?datos (frecuencia OCASIONALMENTE))
	)
	(printout t crlf)
)

(defrule recogidaDatos::determinarPeriodo "Se pregunta por los minutos de lectura por dia"
	?datos <- (datosUsuario (periodo ?p))
	(test (eq ?p -1))
	=>
	(bind ?periodo (preguntaNumerica "Cuanto sueles leer al dia de forma aproximada? (en minutos) "))
	(modify ?datos (periodo ?periodo))
	(printout t crlf)
)

(defrule recogidaDatos::determinarPreferenciaCritica "Se pregunta si confia en las criticas literarias"
	?datos <- (datosUsuario (buenaCritica ?b))
	(test (eq ?b NONE))
	=> 
	(bind ?resp (preguntaSiNo "Confias en las criticas literarias? "))
	(modify ?datos (buenaCritica ?resp))
	(printout t crlf)
)

(defrule recogidaDatos::determinarPreferenciaVentas "Se pregunta si prefiere libros con buenas ventas"
	?datos <- (datosUsuario (buenaVenta ?b))
	(test (eq ?b NONE))
	=> 
	(bind ?resp (preguntaSiNo "Prefieres los libros mas vendidos? "))
	(modify ?datos (buenaVenta ?resp))
	(printout t crlf)
	(focus impresionResultado)
)


;;Falta preguntar por preferencias de genero y autor si es que las hay




;; --------------------------------------------------------------------
;; ---------- MODULO DE ABSTRACCION DE LOS DATOS RECOGIDOS ------------
;; --------------------------------------------------------------------

; Se debe crear una instancia de usuario con la abstraccion de todos los datos obtenidos


(defrule inferir-datos::tiempo-disponible "Se determina el tiempo del que dispone el usuario para leer"
    ?q <- (datos-usuario (periodo ?p) (frecuencia ?f))
    (not (tiempo-disponible-definido))
    =>
    (if (eq ?f DIARIA)
        then (bind ?frecuencia 4)
        else (if (eq ?f FRECUENTE)
            then (bind ?frecuencia 3)
            else (if (eq ?f OCASIONAL)
                then (bind ?frecuencia 2)
                else (bind ?frecuencia 1)
            )
        )
    )
    (if (eq ?p BAJO)
        then (bind ?periodo 1)
        else (if (eq ?p MEDIO)
            then (bind ?periodo 2)
            else (bind ?periodo 3)
        )
    )
    (bind ?tiempoDisponible (+ (* 0.7 ?frecuencia) (* 0.3 ?periodo)))
    (if (>= ?tiempoDisponible 3.0)
        then (bind ?tp ALTO)
        else (if (>= ?tiempoDisponible 2.0)
            then (bind ?tp MEDIO)
            else (bind ?tp BAJO)
        )
    )
    (bind ?usuario (make-instance usuario of Usuario))
    (send ?usuario put-tiempo_disponible ?tp)
    (assert (tiempo-disponible-definido))
)

(defrule abstraccionDatos::edad
    ?usuario <- (object (is-a Usuario))
    ?datos <- (datosUsuario (edad ?e))
    (not (edad-definida))
    =>
    (if (>= ?e 18)
        then (bind ?edad ADULTO)
        else (if (>= ?e 13)
            then (bind ?edad ADOLESCENTE)
            else (if (>= ?e 6)
                then (bind ?edad JUVENIL)
                else (bind ?edad INFANTIL)
            )
        )
    )
    (send ?usuario put-edad ?edad)
    (assert edad-definida)
)

(defrule abstraccionDatos::lugar
    ?usuario <- (object (is-a Usuario))
    ?datos <- (datosUsuario (lugarLectura ?l))
    (not lugar-definido)
    =>
    (send ?usuario put-lugar ?l)
    (assert lugar-definido)
)

(defrule abstraccionDatos::confianza
    ?usuario <- (object (is-a Usuario))
    ?datos <- (datosUsuario (buenaCritica ?c) (buenaVenta ?v))
    (not confianza-definida)
    =>
    (send ?usuario put-buenaCritica ?c)
    (send ?usuario put-buenaVenta ?v)
    (assert confianza-definida)
)

;; --------------------------------------------------------------------
;; ------------------ MODULO DE ASOCIACION HEURISTICA -----------------
;; --------------------------------------------------------------------



;; --------------------------------------------------------------------
;; --------------- MODULO DE IMPRESION DEL RESULTADO ------------------
;; --------------------------------------------------------------------


(defrule impresionResultado::imprime_gay "regla inicial"
	(declare (salience 10))
	=>
	(printout t crlf)
	(printout t "Te recomendamos el libro Introduction to Algorithms, una preciosa novela de ciencia ficcion!" crlf)
	(printout t crlf)
)
















