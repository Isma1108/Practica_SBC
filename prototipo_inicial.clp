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
    (nombre "Acción")
    (dificultad MEDIO)
)

([Fantasia] of Genero
    (nombre "Fantasía")
    (dificultad MEDIO)
)

([Drama] of Genero
    (nombre "Drama")
    (dificultad MEDIO)
)

([Aventuras] of Genero
    (nombre "Aventuras")
    (dificultad MEDIO)
)

([Ciencia_ficción] of Genero
    (nombre "Ciencia ficción")
    (dificultad DIFICIL)
)

([Comedia] of Genero
    (nombre "Comedia")
    (dificultad FACIL)
)

([Misterio] of Genero
    (nombre "Misterio")
    (dificultad MEDIO)
)

([Romance] of Genero
    (nombre "Romance")
    (dificultad MEDIO)
)

([Suspense] of Genero
    (nombre "Suspense")
    (dificultad MEDIO)
)

([Terror] of Genero
    (nombre "Terror")
    (dificultad MEDIO)
)

([Agatha_Christie] of Autor
    (especializado_en [Misterio] [Suspense])
     (nombre  "Agatha Christie")
)


([Alejandro_Dumas] of Autor
    (especializado_en [Acción]  [Aventuras])
    (nombre  "Alejandro Dumas")
)


([Groucho_Marx] of Autor
    (especializado_en [Comedia])
    (nombre  "Groucho Marx")
)

([Franz_Kafka] of Autor
    (especializado_en [Fantasia] [Misterio] [Terror])
    (nombre "Franz Kafka")
)

([C.S_Lewis] of Autor
    (especializado_en [Fantasia] [Aventuras])
    (nombre "C.S. Lewis")
)

([Robert_Louis_Stevenson] of Autor
    (especializado_en [Misterio] [Suspense] [Terror])
    (nombre "Robert Louis Stevenson")
)

([H.G_Wells] of Autor
    (especializado_en [Ciencia_ficción] [Suspense])
    (nombre "H.G. Wells")
)

([Mary_Shelley] of Autor
    (especializado_en [Terror])
    (nombre "Mary Shelley")
)

([Herman_Melville] of Autor
    (especializado_en [Aventuras])
    (nombre "Herman Melville")
)

([Aldous_Huxley] of Autor
    (especializado_en [Ciencia_ficción])
    (nombre "Aldous Huxley")
)

([J.K._Rowling] of Autor
    (especializado_en [Fantasia] [Aventuras])
    (nombre "J.K. Rowling")
)

([Dan_Brown] of Autor
    (especializado_en [Misterio] [Suspense])
    (nombre "Dan Brown")
)

([Margaret_Atwood] of Autor
    (especializado_en [Ciencia_ficción] [Fantasia])
    (nombre "Margaret Atwood")
)

;;añadir libro
([H.P_Lovecraft] of Autor
    (especializado_en [Terror] [Ciencia_ficción])
    (nombre "H.P. Lovecraft")
)

;; añadir libro
([Roald_Dahl] of Autor
    (especializado_en [Fantasia] [Misterio])
    (nombre "Roald Dahl")
)

;; añadir libro
([Isaac_Asimov] of Autor
    (especializado_en [Ciencia_ficción])
    (nombre "Isaac Asimov")
)

([Terry_Pratchett] of Autor
    (especializado_en [Fantasia] [Comedia])
    (nombre "Terry Pratchett")
)

([Gabriel_García_Márquez] of Autor
    (especializado_en [Fantasía] [Misterio])
    (nombre "Gabriel García Márquez")
)


([George_Orwell] of Autor
    (especializado_en [Ciencia_ficción])
    (nombre "George Orwell")
)

([J.R.R_Tolkien] of Autor
    (especializado_en [Fantasía])
    (nombre "J.R.R. Tolkien")
)

;; añadir libro
([Ursula_K_Le_Guin] of Autor
    (especializado_en [Fantasia] [Ciencia_ficción])
    (nombre "Ursula K. Le Guin")
)

([Carlos_Ruiz_Zafón] of Autor
    (nombre "Carlos Ruiz Zafón")
    (especializado_en [Misterio] [Suspense])
)

([Ernest_Cline] of Autor
    (nombre "Ernest Cline")
    (especializado_en [Ciencia_ficción])
)

([Bram_Stoker] of Autor
    (nombre "Bram Stoker")
    (especializado_en [Terror])
)

([Suzanne_Collins] of Autor
    (nombre "Suzanne Collins")
    (especializado_en [Aventuras])
)


([Jane_Austen] of Autor
    (nombre "Jane Austen")
    (especializado_en [Drama])
)

    ([El_Color_de_la_Magia] of Libro
        (es_del_genero [Fantasia] [Comedia])
        (escrito_por [Terry_Pratchett])
        (critica 8.2)
        (edad JUVENIL)
        (nombre "El Color de la Magia")
        (num_paginas 288)
        (ventas 5000000)
    )

    ([Matilda] of Libro
        (es_del_genero [Fantasia] [Misterio])
        (escrito_por [Roald_Dahl])
        (critica 8.7)
        (edad INFANTIL)
        (nombre "Matilda")
        (num_paginas 240)
        (ventas 6000000)
    )

    ([Fundacion] of Libro
        (es_del_genero [Ciencia_ficción])
        (escrito_por [Isaac_Asimov])
        (critica 9.5)
        (edad ADULTO)
        (nombre "Fundación")
        (num_paginas 300)
        (ventas 8000000)
    )

    ([El_Caso_de_Charles_Dexter_Ward] of Libro
        (es_del_genero [Terror] [Misterio])
        (escrito_por [H.P_Lovecraft])
        (critica 8.6)
        (edad ADULTO)
        (nombre "El Caso de Charles Dexter Ward")
        (num_paginas 208)
        (ventas 200000)
    )

    ([La_Mano_Izquierda_de_la_Oscuridad] of Libro
        (es_del_genero [Ciencia_ficción] [Fantasia])
        (escrito_por [Ursula_K_Le_Guin])
        (critica 9.1)
        (edad ADULTO)
        (nombre "La Mano Izquierda de la Oscuridad")
        (num_paginas 336)
        (ventas 800000)
    )

    ([Asesinato_en_el_Orient_Express] of Libro
         (es_del_genero  [Misterio] [Suspense])
         (escrito_por  [Agatha_Christie])
         (critica  9.0)
         (edad  ADOLESCENTE)
         (nombre  "Asesinato en el Orient Express")
         (num_paginas  190)
         (ventas  100000000)
    )


    ([El_Señor_de_los_Anillos] of Libro
         (es_del_genero  [Aventuras] [Fantasia])
         (escrito_por  [J.R.R._Tolkien])
         (critica  9.6)
         (edad  ADOLESCENTE)
         (nombre  "El Señor de los Anillos")
         (num_paginas  576)
         (ventas  110000000)
    )

    ([Los_tres_mosqueteros] of Libro
         (es_del_genero  [Acción] [Aventuras])
         (escrito_por  [Alejandro_Dumas])
         (critica  9.0)
         (edad  JUVENIL)
         (nombre  "Los tres mosqueteros")
         (num_paginas  617)
         (ventas  50000000)
    )

    ([Memorias_de_un_amante_sarnoso] of Libro
         (es_del_genero  [Comedia] [Romance])
         (escrito_por  [Groucho_Marx])
         (critica  8.6)
         (edad  ADULTO)
         (nombre  "Memorias de un amante sarnoso")
         (num_paginas  224)
         (ventas  25000)
    )

    ([El_Juego_del_Angel] of Libro
    (es_del_genero [Misterio] [Suspense])
    (escrito_por [Carlos_Ruiz_Zafón])
    (critica 8.5)
    (edad ADULTO)
    (nombre "El Juego del Ángel")
    (num_paginas 500)
    (ventas 15000000)
)

([Ready_Player_One] of Libro
    (es_del_genero [Ciencia_ficción])
    (escrito_por [Ernest_Cline])
    (critica 9.2)
    (edad ADULTO)
    (nombre "Ready Player One")
    (num_paginas 372)
    (ventas 8000000)
)

([Cien_años_de_soledad] of Libro
    (es_del_genero [Fantasia] [Romance])
    (escrito_por [Gabriel_García_Márquez])
    (critica 9.8)
    (edad ADULTO)
    (nombre "Cien años de soledad")
    (num_paginas 432)
    (ventas 30000000)
)

([El_Código_Da_Vinci] of Libro
    (es_del_genero [Misterio] [Suspense])
    (escrito_por [Dan_Brown])
    (critica 9.0)
    (edad ADULTO)
    (nombre "El Código Da Vinci")
    (num_paginas 589)
    (ventas 80000000)
)

([1984] of Libro
    (es_del_genero [Ciencia_ficción])
    (escrito_por [George_Orwell])
    (critica 9.5)
    (edad ADULTO)
    (nombre "1984")
    (num_paginas 328)
    (ventas 25000000)
)

([Orgullo_y_Prejuicio] of Libro
    (es_del_genero [Romance])
    (escrito_por [Jane_Austen])
    (critica 8.7)
    (edad ADULTO)
    (nombre "Orgullo y Prejuicio")
    (num_paginas 279)
    (ventas 12000000)
)

([El_Hobbit] of Libro
    (es_del_genero [Fantasia] [Aventuras])
    (escrito_por [J.R.R_Tolkien])
    (critica 9.0)
    (edad ADULTO)
    (nombre "El Hobbit")
    (num_paginas 310)
    (ventas 15000000)
)

([Drácula] of Libro
    (es_del_genero [Terror])
    (escrito_por [Bram_Stoker])
    (critica 8.9)
    (edad ADULTO)
    (nombre "Drácula")
    (num_paginas 418)
    (ventas 10000000)
)

([Los_Juegos_del_Hambre] of Libro
    (es_del_genero [Aventuras] [Ciencia_ficción])
    (escrito_por [Suzanne_Collins])
    (critica 9.2)
    (edad ADOLESCENTE)
    (nombre "Los Juegos del Hambre")
    (num_paginas 374)
    (ventas 65000000)
)

([El_Silmarillion] of Libro
    (es_del_genero [Fantasia])
    (escrito_por [J.R.R_Tolkien])
    (critica 8.8)
    (edad ADULTO)
    (nombre "El Silmarillion")
    (num_paginas 365)
    (ventas 9000000)
)

([Crónica_de_una_muerte_anunciada] of Libro
    (es_del_genero [Misterio])
    (escrito_por [Gabriel_García_Márquez])
    (critica 8.6)
    (edad ADULTO)
    (nombre "Crónica de una muerte anunciada")
    (num_paginas 128)
    (ventas 5000000)
)

([El_Origen] of Libro
    (es_del_genero [Ciencia_ficción] [Suspense])
    (escrito_por [Dan_Brown])
    (critica 9.3)
    (edad ADULTO)
    (nombre "El Origen")
    (num_paginas 460)
    (ventas 18000000)
)

([La_Metamorfosis] of Libro
    (es_del_genero [Fantasia])
    (escrito_por [Franz_Kafka])
    (critica 8.9)
    (edad ADULTO)
    (nombre "La Metamorfosis")
    (num_paginas 55)
    (ventas 7000000)
)

([Las_Crónicas_de_Narnia] of Libro
    (es_del_genero [Fantasia] [Aventuras])
    (escrito_por [C.S_Lewis])
    (critica 9.1)
    (edad INFANTIL)
    (nombre "Las Crónicas de Narnia")
    (num_paginas 767)
    (ventas 28000000)
)



([El_Extraño_Caso_del_Doctor_Jekyll_y_Mr_Hyde] of Libro
    (es_del_genero [Misterio] [Suspense] [Terror])
    (escrito_por [Robert_Louis_Stevenson])
    (critica 8.7)
    (edad ADULTO)
    (nombre "El Extraño Caso del Doctor Jekyll y Mr Hyde")
    (num_paginas 144)
    (ventas 6000000)
)

([La_Guerra_de_los_Mundos] of Libro
    (es_del_genero [Ciencia_ficción])
    (escrito_por [H.G_Wells])
    (critica 9.4)
    (edad ADULTO)
    (nombre "La Guerra de los Mundos")
    (num_paginas 288)
    (ventas 11000000)
)

([Frankenstein] of Libro
    (es_del_genero [Terror])
    (escrito_por [Mary_Shelley])
    (critica 8.8)
    (edad ADULTO)
    (nombre "Frankenstein")
    (num_paginas 280)
    (ventas 8500000)
)

([Moby_Dick] of Libro
    (es_del_genero [Aventuras])
    (escrito_por [Herman_Melville])
    (critica 9.0)
    (edad ADULTO)
    (nombre "Moby Dick")
    (num_paginas 704)
    (ventas 9200000)
)

([El_Hombre_Invisible] of Libro
    (es_del_genero [Ciencia_ficción] [Suspense])
    (escrito_por [H.G_Wells])
    (critica 8.6)
    (edad ADULTO)
    (nombre "El Hombre Invisible")
    (num_paginas 208)
    (ventas 4800000)
)

([Un_Mundo_Feliz] of Libro
    (es_del_genero [Ciencia_ficción])
    (escrito_por [Aldous_Huxley])
    (critica 9.3)
    (edad ADULTO)
    (nombre "Un Mundo Feliz")
    (num_paginas 288)
    (ventas 14000000)
)

([El_Conde_de_Monte_Cristo] of Libro
    (es_del_genero [Aventuras])
    (escrito_por [Alejandro_Dumas])
    (critica 9.0)
    (edad ADULTO)
    (nombre "El Conde de Monte Cristo")
    (num_paginas 1276)
    (ventas 18000000)
)

([La_Granja] of Libro
    (es_del_genero [Fantasia])
    (escrito_por [George_Orwell])
    (critica 9.2)
    (edad ADULTO)
    (nombre "La Granja")
    (num_paginas 112)
    (ventas 8000000)
)


([El_Crimen_del_Siglo] of Libro
    (es_del_genero [Misterio] [Suspense])
    (escrito_por [Dan_Brown])
    (critica 8.9)
    (edad ADULTO)
    (nombre "El Crimen del Siglo")
    (num_paginas 336)
    (ventas 950000)
)

([La_Revolucion_de_las_Ratas] of Libro
    (es_del_genero [Aventuras] [Fantasia])
    (escrito_por [C.S_Lewis])
    (critica 8.5)
    (edad JUVENIL)
    (nombre "La Revolución de las Ratas")
    (num_paginas 240)
    (ventas 150000)
)

([El_Susurro_del_Viento] of Libro
    (es_del_genero [Romance] [Drama])
    (escrito_por [Margaret_Atwood])
    (critica 8.7)
    (edad ADULTO)
    (nombre "El Susurro del Viento")
    (num_paginas 368)
    (ventas 2800000)
)

([El_Llamado_de_la_Aventura] of Libro
    (es_del_genero [Aventuras])
    (escrito_por [Herman_Melville])
    (critica 9.0)
    (edad ADULTO)
    (nombre "El Llamado de la Aventura")
    (num_paginas 224)
    (ventas 750000)
)

([Los_Secretos_del_Corazon] of Libro
    (es_del_genero [Romance] [Drama])
    (escrito_por [Jane_Austen])
    (critica 8.8)
    (edad ADULTO)
    (nombre "Los Secretos del Corazón")
    (num_paginas 400)
    (ventas 3800000)
)

([La_Noche_de_las_Mil_Estrellas] of Libro
    (es_del_genero [Fantasia])
    (escrito_por [J.R.R_Tolkien])
    (critica 9.2)
    (edad ADULTO)
    (nombre "La Noche de las Mil Estrellas")
    (num_paginas 528)
    (ventas 5200000)
)

([El_Pergamino_Enigmático] of Libro
    (es_del_genero [Misterio])
    (escrito_por [Agatha_Christie])
    (critica 8.6)
    (edad ADULTO)
    (nombre "El Pergamino Enigmático")
    (num_paginas 320)
    (ventas 1100000)
)

([El_Suspiro_de_la_Noche] of Libro
    (es_del_genero [Terror])
    (escrito_por [Mary_Shelley])
    (critica 9.3)
    (edad ADULTO)
    (nombre "El Suspiro de la Noche")
    (num_paginas 432)
    (ventas 8900000)
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


(deftemplate MAIN::libroConPuntuacion
    (slot index (type INTEGER))
    (slot libro (type INSTANCE))
    (slot puntuacion (type INTEGER))
    (multislot motivos (type STRING))
)

(deftemplate MAIN::libroRecomendado
    (slot nombre (type STRING))   
    (slot autor (type STRING))
    (multislot motivos (type STRING))
)


;; ----------------------------------------
;; ------------- FUNCIONES ----------------
;; ----------------------------------------

;; Aqui todas las deffunctions que necesitemos 
;; (haran falta para las preguntas

;;; Funcion para hacer una pregunta con respuesta numerica unica
(deffunction MAIN::preguntaNumerica (?pregunta)
	(printout t ?pregunta)
	(bind ?response (read))
	?response
)

;;; Funcion para una pregunta de respuesta SI/NO (acepta S/s, N/n)
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

;;; Función para una pregunta de índice con respuesta única
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

;;; Función para una pregunta de índice multirespuesta
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

;;; Funcion para mirar si existe algún elemento compartido en dos variables multislot
(deffunction intersectionp (?m1 ?m2)
   (foreach ?i1 ?m1
      (foreach ?i2 ?m2
         (if (eq ?i1 ?i2)
            then (return TRUE))))
   (return FALSE))

;; EN CADA REGLA QUE SE EJECUTA COMO ULTIMA EN CADA MODULO,
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
		else (if (= ?resp 2) 
            then (modify ?datos (frecuencia OCASIONALMENTE))
            else (modify ?datos (frecuencia SEMANALMENTE))
        )
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

	  (printout t crlf)
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
	  (printout t crlf)
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
    (if (eq ?f DIARIAMENTE)
        then (bind ?frecuencia 4)
        else (if (eq ?f OCASIONALMENTE)
            then (bind ?frecuencia 2)
            else (bind ?frecuencia 1)
        )
    )
    (if (<= ?p 10)
        then (bind ?periodo 1)
        else (if (<= ?p 40)
            then (bind ?periodo 2)
            else (bind ?periodo 3)
        )
    )
    (bind ?tiempoDisponible (+ (* 0.7 ?frecuencia) (* 0.3 ?periodo)))
    (printout t "tiempoDisponible: " ?tiempoDisponible crlf)
    (printout t "frecuencia: " ?frecuencia crlf)
    (printout t "periodo: " ?periodo crlf)
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
	  (focus asociacionHeuristica)
)
;; --------------------------------------------------------------------
;; ------------------ MODULO DE ASOCIACION HEURISTICA -----------------
;; --------------------------------------------------------------------

(defrule asociacionHeuristica::crearLibrosConPuntuacion
    ?usuario <- (object (is-a Usuario))
    ?libro <- (object (is-a Libro))
    => 
    (bind ?puntos 0)
    (bind $?motivos (create$))

    ;Actualizamos los puntos y los motivos en funcion de los atributos del libro que
    ;coinciden con las preferencias del usuario
    ;Las ponderaciones estan por determinar


    ;(ponderaciones)
    ;1. Es de uno de sus autores favoritos (20)
    ;2. Es de uno de sus generos favoritos (10)
    ;3. Es adecuado para su edad (15)
    ;4. Tiene buena crítica y el usuario se fia (5)
    ;5. Tiene buenas ventas y al usuario le gustan los libros vendidos (5)
    ;6. En funcion del lugar de lectura del usuario:
    ; - concurrido -> sumamos libro genero facil (8), restamos dificil (-6) (a no ser que sea un genero que le gusta al user)
    ; - tranquilo -> nada
    ;7. No es de su genero favorito, pero es de los géneros en los que se especializa uno de sus autores favoritos (5)
    ;8. En funcion del tiempo disponible del usuario y las paginas del libro sumamos o restamos. 
    ; - poco tiempo: sumamos a los cortos (9), restamos a los largos (5)
    ; - mucho tiempo: sumamos a los largos (3)

    ;libros: <= 200 paginas -> corto
    ;        <= 500 -> medio, else largo


    (bind ?DeSusGenFav FALSE)
    ;1. 
    (bind $?uAutorFav (send ?usuario get-gusta_autor))
    (bind ?lAutor (send ?libro get-escrito_por))

    (if (member$ ?lAutor ?uAutorFav) then 
        (bind ?puntos (+ ?puntos 20))
        (bind $?motivos (insert$ $?motivos (+ (length$ $?motivos) 1) "Es de tus autores favoritos"))
    )

    ;2

    (bind $?uGenFav(send ?usuario get-gusta_genero))
    (bind $?lGenero (send ?libro get-es_del_genero))
    (bind ?intersect (intersectionp ?uGenFav ?lGenero))

    (if (eq ?intersect TRUE) then 
        (bind ?puntos (+ ?puntos 10))
        (bind $?motivos (insert$ $?motivos (+ (length$ $?motivos) 1) "Es de tus generos favoritos"))
        (bind ?DeSusGenFav TRUE)
    )

    ;3.
    (bind ?uEdad (send ?usuario get-edad))
    (bind ?lEdad (send ?libro get-edad))
    
    (if (eq ?uEdad ?lEdad) then
        (bind ?puntos (+ ?puntos 15))
        (bind $?motivos (insert$ $?motivos (+ (length$ $?motivos) 1) "Es adecuado para tu edad"))
    )

    ;4. 
    (bind ?Cr (send ?libro get-critica))
    (bind ?uCr (send ?usuario get-buena_critica))

    (if (and (>= ?Cr 8) (eq ?uCr TRUE)) then
        (bind ?puntos (+ ?puntos 5))
        (bind $?motivos (insert$ $?motivos (+ (length$ $?motivos) 1) "Tiene buena crítica"))
    )

    ;5.
    (bind ?Ventas (send ?libro get-ventas))
    (bind ?uVentas (send ?usuario get-buenas_ventas))

    (if (and (>= ?Ventas 1000000) (eq ?uVentas TRUE)) then
        (bind ?puntos (+ ?puntos 5))
        (bind $?motivos (insert$ $?motivos (+ (length$ $?motivos) 1) "Tiene buenas ventas"))
    )

    ;6.

    (bind ?uSitioFav (send ?usuario get-lugar))
    ;; Primero, mirar si lee en sitio concurrido

    (bind ?esDificil FALSE)

    (if (eq ?uSitioFav CONCURRIDO) then
        ;; El libro está en sus géneros favoritos, solo damos puntuacion si es de un genero fácil
        (if (neq (length$ ?intersect) 0) then 
            (loop-for-count (?i 1 (length$ $?lGenero)) do 
                (bind ?genero (nth$ ?i $?lGenero))
                (if (eq (send ?genero get-dificultad) FACIL) then 
                    (bind ?puntos (+ ?puntos 8))
                    (bind $?motivos (insert$ $?motivos (+ (length$ $?motivos) 1) "Lees en espacios concurridos y es de un género de fácil comprensión"))
                    (break)
                )
            )
        else 
            (loop-for-count (?i 1 (length$ $?lGenero)) do
                (bind ?genero (nth$ ?i $?lGenero))
                (if (eq (send ?genero get-dificultad) DIFICIL) then 
                (bind ?puntos (- ?puntos 6))
                (bind ?esDificil TRUE)
                (break)
                )
            )
            (if (eq ?esDificil FALSE) then (loop-for-count (?i 1 (length$ $?lGenero)) do 
                (bind ?genero (nth$ ?i $?lGenero))
                (if (eq (send ?genero get-dificultad) FACIL) then 
                    (bind ?puntos (+ ?puntos 8))
                    (bind $?motivos (insert$ $?motivos (+ (length$ $?motivos) 1) "Lees en espacios concurridos y es de un género de fácil comprensión"))
                    (break)
                )
            ))
        )
    )

    ;7.

    ;; El libro no está entre sus géneros favoritos
    (if (eq ?DeSusGenFav FALSE)
        then
        ;; Miramos los géneros en los que se especializa el autor, si hay intersección
        ;; con los del libro, terminamos
        (loop-for-count (?i 1 (length$ $?uAutorFav)) do 
            (bind ?autor (nth$ ?i $?uAutorFav))
            (bind ?generos (send ?autor get-especializado_en))
            (bind ?intersectG (intersectionp ?generos ?lGenero))
            (if (eq ?intersectG TRUE)
                then
                (bind ?puntos (+ ?puntos 5))
                (bind $?motivos (insert$ $?motivos (+ (length$ $?motivos) 1) "De un género en el que se especializa uno de tus autores favoritos"))
                (break)
            )
        )
    )

    ;8.
    (bind ?numP (send ?libro get-num_paginas))
    (bind ?tiempo (send ?usuario get-tiempo_disponible))

    (if (eq ?tiempo BAJO)
        then 
        (if (<= ?numP 200)
            then 
            (bind ?puntos (+ ?puntos 9))
            (bind $?motivos (insert$ $?motivos (+ (length$ $?motivos) 1) "Es adecuado para tu tiempo disponible"))
            else (if (>= ?numP 500) then (bind ?puntos (- ?puntos 5)))
        )
        else 
        (if (and (eq ?tiempo ALTO) (>= ?numP 500)) then
            (bind ?puntos (+ ?puntos 3))
            (bind $?motivos (insert$ $?motivos (+ (length$ $?motivos) 1) "Es adecuado para tu tiempo disponible"))
        )
    )

    ;etc

    ;Al final creamos el hecho
    (assert (libroConPuntuacion
        (index (+ (length$ (find-all-facts((?lp libroConPuntuacion)) TRUE)) 1))
        (libro ?libro)
        (puntuacion ?puntos)
        (motivos $?motivos)
    ))
)

(defrule asociacionHeuristica::ordenacion
    (declare(salience -10))
    ?l1 <- (libroConPuntuacion (index ?index1) (libro ?libro1) (puntuacion ?puntuacion1) (motivos $?motivos1))
    ?l2 <- (libroConPuntuacion (index ?index2&:(= ?index2 (+ ?index1 1))) (libro ?libro2) (puntuacion ?puntuacion2&:(> ?puntuacion2 ?puntuacion1)) (motivos $?motivos2)) =>
    (modify ?l1 (libro ?libro2) (puntuacion ?puntuacion2) (motivos $?motivos2))
    (modify ?l2 (libro ?libro1) (puntuacion ?puntuacion1) (motivos $?motivos1))
)

(defrule asociacionHeuristica::saltoDeModulo
    (declare (salience -20))
    => 
    (focus impresionResultado)
)


;; --------------------------------------------------------------------
;; --------------- MODULO DE IMPRESION DEL RESULTADO ------------------
;; --------------------------------------------------------------------


(defrule impresionResultado::banner "regla inicial"
    (declare (salience 10))
    =>
    (printout t crlf)
    (printout t "--------------------------------------------------------------" crlf)
    (printout t "---------------------- Recomendaciones -----------------------" crlf)
	  (printout t "--------------------------------------------------------------" crlf)
	  (printout t crlf)
)

(defrule impresionResultado::imprimir "impresion del resultado"
    ?l <- (libroConPuntuacion (index ?p1&: (<= ?p1 3)) (libro ?libro) (motivos $?motivos))
    (forall (libroConPuntuacion (index ?p2)) (test (<= ?p1 ?p2)))
    =>
    (printout t "Te recomendamos el libro " (send ?libro get-nombre)"." crlf)
    (loop-for-count (?i 1 (length$ $?motivos)) do
        (if (= ?i 1) then (printout t "Los motivos son: " crlf))
        (printout t "    "(nth$ ?i $?motivos) crlf)
    )
    (printout t crlf)
    (retract ?l)
)

















