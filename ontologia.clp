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

    
    ([El_ojo_de_Argon] of Libro
        (es_del_genero [Aventuras] [Fantasia])
        (escrito_por [Jim_Theis])
        (critica 2.4)
        (edad JUVENIL)
        (nombre "El ojo de Argon")
        (num_paginas 76)
        (ventas 10000)
    )

    ([Jim_Theis] of Autor
        (especializado_en [Fantasia])
        (nombre "Jim Theis")
    )

    ([Legitima_defensa] of Libro
        (es_del_genero [Suspense] [Ficción_criminal])
        (escrito_por [John_Grisham])
        (critica 7.41)
        (edad ADULTO)
        (nombre "Legitima defensa")
        (num_paginas 656)
        (ventas 2500000)
    )

    ([John_Grisham] of Autor
        (especializado_en [suspense] [Ficción_criminal])
        (nombre "John Grisham")
    )

    ([Ficción_criminal] of Genero
        (nombre "Ficción criminal")
    )

    ([La_Tapadera] of Libro
        (es_del_genero [Suspense] [Ficción_criminal])
        (escrito_por [John_Grisham])
        (critica 9.1)
        (edad ADULTO)
        (nombre "La Tapadera")
        (num_paginas 432)
        (ventas 3000000)
    )

)
