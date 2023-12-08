;; -----------------------------------------------------
;; AQUI IRIAN TODAS LAS CLASES DE LA ONTOLOGIA CREADAS 
;; CON OWL2CLIPS A PARTIR DEL FICHERO TURTLE DE PROTEGE
;; -----------------------------------------------------

;;; ---------------------------------------------------------
;;; ontologia.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology ontologia.ttl
;;; :Date 08/12/2023 13:40:10

(defclass Autor
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot especializado_en
        (type INSTANCE)
        (create-accessor read-write))
    (slot nombre
        (type STRING)
        (create-accessor read-write))
)

(defclass Genero
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot dificultad
        (type SYMBOL)
        (allowed-values FACIL MEDIO DIFICIL)
        (create-accessor read-write))
    (slot nombre
        (type STRING)
        (create-accessor read-write))
)

(defclass Libro
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot es_del_genero
        (type INSTANCE)
        (create-accessor read-write))
    (slot escrito_por
        (type INSTANCE)
        (create-accessor read-write))
    (slot critica
        (type FLOAT)
        (create-accessor read-write))
    (slot edad
        (type SYMBOL)
        (allowed-values INFANTIL JUVENIL ADOLESCENTE ADULTO)
        (create-accessor read-write))
    (slot nombre
        (type STRING)
        (create-accessor read-write))
    (slot num_paginas
        (type INTEGER)
        (create-accessor read-write))
    (slot ventas
        (type INTEGER)
        (create-accessor read-write))
)

(defclass Usuario
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot gusta_autor
        (type INSTANCE)
        (create-accessor read-write))
    (multislot gusta_genero
        (type INSTANCE)
        (create-accessor read-write))
    (slot buenas_ventas
        (type SYMBOL)
        (allowed-values TRUE FALSE)
        (create-accessor read-write))
    (slot buena_critica
        (type SYMBOL)
        (allowed-values TRUE FALSE)
        (create-accessor read-write))
    (slot edad
        (type SYMBOL)
        (allowed-values INFANTIL JUVENIL ADOLESCENTE ADULTO)
        (create-accessor read-write))
    (slot lugar
        (type SYMBOL)
        (allowed-values TRANQUILO CONCURRIDO)
        (create-accessor read-write))
    (slot tiempo_disponible
        (type SYMBOL)
        (allowed-values BAJO MEDIO ALTO)
        (create-accessor read-write))
)

;; -----------------------------------------------------------
;; AQUI TODAS LAS INSTANCIAS QUE DIOS SABE COMO VAMOS A CREAR
;; -----------------------------------------------------------

(definstances instances
    ([Acción] of Genero
         (nombre  "Acción")
    )

    ([Agatha_Christie] of Autor
         (nombre  "Agatha Christie")
    )

    ([Alejandro_Dumas] of Autor
         (nombre  "Alejandro Dumas")
    )

    ([Asesinato_en_el_Orient_Express] of Libro
         (es_del_genero  [Misterio] [Suspense])
         (escrito_por  [Agatha_Christie])
         (critica  9.0)
         (edad  "adolescente")
         (nombre  "Asesinato en el Orient Express")
         (num_paginas  256)
         (ventas  100000000)
    )

    ([Aventuras] of Genero
         (nombre  "Aventuras")
    )

    ([Bram_Stoker] of Autor
         (nombre  "Bram Stoker")
    )

    ([Ciencia_ficción] of Genero
         (nombre  "Ciencia ficción")
    )

    ([Comedia] of Genero
         (nombre  "Comedia")
    )

    ([Dracula] of Libro
         (es_del_genero  [Terror])
         (escrito_por  [Bram_Stoker])
         (critica  9.2)
         (edad  "adolescente")
         (nombre  "Dracula")
         (num_paginas  418)
         (ventas  200000000)
    )

    ([El_Señor_de_los_Anillos] of Libro
         (es_del_genero  [Aventuras] [Fantasia])
         (escrito_por  [J.R.R._Tolkien])
         (critica  9.6)
         (edad  "adolescente")
         (nombre  "El Señor de los Anillos")
         (num_paginas  576)
         (ventas  110000000)
    )

    ([Fantasia] of Genero
         (nombre  "Fantasia")
    )

    ([Groucho_Marx] of Autor
         (nombre  "Groucho Marx")
    )

    ([J.R.R._Tolkien] of Autor
         (nombre  "J.R.R. Tolkien")
    )

    ([Los_juegos_del_hambre] of Libro
         (es_del_genero  [Aventuras] [Ciencia_ficción])
         (escrito_por  [Suzanne_Collins])
         (critica  8.0)
         (edad  "adolescente")
         (nombre  "Los juegos del hambre")
         (num_paginas  374)
         (ventas  23000000)
    )

    ([Los_tres_mosqueteros] of Libro
         (es_del_genero  [Acción] [Aventuras])
         (escrito_por  [Alejandro_Dumas])
         (critica  9.0)
         (edad  "juvenil")
         (nombre  "Los tres mosqueteros")
         (num_paginas  617)
         (ventas  50000000)
    )

    ([Memorias_de_un_amante_sarnoso] of Libro
         (es_del_genero  [Comedia] [Romance])
         (escrito_por  [Groucho_Marx])
         (critica  8.6)
         (edad  "adulto")
         (nombre  "Memorias de un amante sarnoso")
         (num_paginas  224)
         (ventas  25000)
    )

    ([Misterio] of Genero
         (nombre  "Misterio")
    )

    ([Romance] of Genero
         (nombre  "Romance")
    )

    ([Suspense] of Genero
         (nombre  "Suspense")
    )

    ([Suzanne_Collins] of Autor
         (especializado_en  [Aventuras] [Ciencia_ficción])
         (nombre  "Suzanne Collins")
    )

    ([Terror] of Genero
         (nombre  "Terror")
    )

)

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


(deffunction MAIN::preguntaConIndices (?pregunta $?valoresPosibles)
   (bind ?indice 1)
   (bind ?linea (format nil "%s" ?pregunta))
   (printout t ?linea crlf)

   (progn$ (?valor $?valoresPosibles)
      (bind ?linea (format nil "  %d. %s" ?indice ?valor))
      (printout t ?linea crlf)
      (bind ?indice (+ ?indice 1))
   )

   (format t "%s" "Indica el indice de tu respuesta: ")
   (bind ?resp (read))
   ?resp
)

(deffunction MAIN::preguntaConRespuestaMultiple (?pregunta $?valores-posibles)
    (bind ?linea (format nil "%s" ?pregunta))
    (printout t ?linea crlf)
    (progn$ (?var ?valores-posibles)
            (bind ?linea (format nil "  %d. %s" ?var-index ?var))
            (printout t ?linea crlf)
    )
    (format t "%s" "Indica los indices separados por un espacio: ")
    (bind ?resp (readline))
    (bind ?numeros (str-explode ?resp))
    (bind $?lista (create$ ))
    (progn$ (?var ?numeros)
        (if (and (integerp ?var) (and (>= ?var 1) (<= ?var (length$ ?valores-posibles))))
            then
                (if (not (member$ ?var ?lista))
                    then (bind ?lista (insert$ ?lista (+ (length$ ?lista) 1) ?var))
                )
        )
    )
    ?lista
)

;; EN CADA REGALA QUE SE EJECUTA COMO ULTIMA EN CADA MODULO,
;; USAREMOS (focus nuevo_modulo) para pasar al siguiente modulo.

;; ---------------------------------------------------
;; ---------- MODULO DE RECOGIDA DE DATOS ------------
;; ---------------------------------------------------

(defrule recogidaDatos::reglaInicial
	(declare (salience 10))
	=>
	(assert (preferenciasUsuario))
)

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
    (assert (datosRecogidos))
	(printout t crlf)
)

(defrule recogidaDatos::determinarGenerosFavoritos
    (not (preguntaGenerosPreferidos))
    (datosRecogidos)
    ?pref <- (preferenciasUsuario)
    =>
    (bind ?resp (preguntaSiNo "Estas interesado en algun genero en concreto? "))
    (if (eq ?resp TRUE) then
        (bind $?instanciasGenero (find-all-instances ((?inst Genero)) TRUE))
        (bind $?nombresGenero (create$))

        (loop-for-count (?i 1 (length$ $?instanciasGenero)) do
            (bind ?inst (nth$ ?i $?instanciasGenero))
            (bind ?nombre (send ?inst get-nombre))
            (bind $?nombresGenero (insert$ $?nombresGenero ?i ?nombre))
        )

        (bind ?generosEscogidos (preguntaConRespuestaMultiple "Escoge los generos en los que estas interesado: " $?nombresGenero))

		(bind $?respuesta (create$))
		(loop-for-count (?i 1 (length$ ?generosEscogidos)) do
			    (bind ?curr-index (nth$ ?i ?generosEscogidos))
			    (bind ?curr-epc (nth$ ?curr-index $?instanciasGenero))
			    (bind $?respuesta(insert$ $?respuesta (+ (length$ $?respuesta) 1) ?curr-epc))
		)
		(modify ?pref (generos $?respuesta))
   )
    (assert (preguntaGenerosPreferidos))
)

(defrule recogidaDatos::determinarAutoresFavoritos
    (not (preguntaAutoresPreferidos))
    (datosRecogidos)
    (preguntaGenerosPreferidos)
    ?pref <- (preferenciasUsuario)
    =>
    (bind ?resp (preguntaSiNo "Estas interesado en algun autor en concreto? "))
    (if (eq ?resp TRUE) then
        (bind $?instanciasAutor (find-all-instances ((?inst Autor)) TRUE))
        (bind $?nombresAutor (create$))

        (loop-for-count (?i 1 (length$ $?instanciasAutor)) do
            (bind ?inst (nth$ ?i $?instanciasAutor))
            (bind ?nombre (send ?inst get-nombre))
            (bind $?nombresAutor (insert$ $?nombresAutor ?i ?nombre))
        )

        (bind ?autoresEscogidos (preguntaConRespuestaMultiple "Escoge los autores en los que estas interesado: " $?nombresAutor))

		    (bind $?respuesta (create$))
		    (loop-for-count (?i 1 (length$ ?autoresEscogidos)) do
			      (bind ?curr-index (nth$ ?i ?autoresEscogidos))
			      (bind ?curr-epc (nth$ ?curr-index $?instanciasAutor))
			      (bind $?respuesta(insert$ $?respuesta (+ (length$ $?respuesta) 1) ?curr-epc))
		    )
		    (modify ?pref (autores $?respuesta))
    )
    (assert (preguntaAutoresPreferidos))
    (focus abstraccionDatos)
)



;; --------------------------------------------------------------------
;; ---------- MODULO DE ABSTRACCION DE LOS DATOS RECOGIDOS ------------
;; --------------------------------------------------------------------

; Se debe crear una instancia de usuario con la abstraccion de todos los datos obtenidos


(defrule abstraccionDatos::tiempoDisponible "Se determina el tiempo del que dispone el usuario para leer"
    ?q <- (datosUsuario (periodo ?p) (frecuencia ?f))
    (not (tiempoDisponibleDefinido))
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
    (assert (tiempoDisponibleDefinido))
)

(defrule abstraccionDatos::edad
    ?usuario <- (object (is-a Usuario))
    ?datos <- (datosUsuario (edad ?e))
    (not (edadDefinida))
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
    (assert (edadDefinida))
)

(defrule abstraccionDatos::lugar
    ?usuario <- (object (is-a Usuario))
    ?datos <- (datosUsuario (lugarLectura ?l))
    (not (lugarDefinido))
    =>
    (send ?usuario put-lugar ?l)
    (assert (lugarDefinido))
)

(defrule abstraccionDatos::confianza
    ?usuario <- (object (is-a Usuario))
    ?datos <- (datosUsuario (buenaCritica ?c) (buenaVenta ?v))
    (not (confianzaDefinida))
    =>
    (send ?usuario put-buena_critica ?c)
    (send ?usuario put-buenas_ventas ?v)
    (assert (confianzaDefinida))
)

(defrule abstraccionDatos::favoritos
    ?usuario <- (object (is-a Usuario))
    ?pref <- (preferenciasUsuario (generos $?generos) (autores $?autores))
    (not (favoritosDefinidos))
    =>
    (send ?usuario put-gusta_genero $?generos)
    (send ?usuario put-gusta_autor $?autores)
    (assert (favoritosDefinidos))
	(focus impresionResultado)
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
















