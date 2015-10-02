;***************************************************************************

;                              Proyecto Final Ingeniería Del 
;				     Conocimiento

;                                      ----------

;   

;   Nombre:		José Arcos Aneas
;    D.N.I:		74740565-H	
;   email:		joseaa@correo.ugr.es

;***************************************************************************/



;1---------------------------------------------

(deffacts startup 
(rama Software) 
(rama Inteligencia) 
(rama Arquitectura) 
(rama Sistemas_Informacion) 
(rama Tecnologias_de_la_informacion)
(nexoramaasig Software SO SCD BD FFT MP )
(nexoramaasig Inteligencia IA SCD BD FFT MP) 
(nexoramaasig Arquitectura AC SCD BD FFT MP) 
(nexoramaasig Sistemas_Informacion DDSI SCD BD FFT MP)
(nexoramaasig Tecnologias_de_la_informacion PDOO SCD BD FFT MP)
(profesiones Inteligencia Consultor_de_sistemas_inteligentes Investigador Tecnico_de_integracion Especialista_en_integracion_y_pruebas Director_de_proyectos_TIC)
(profesiones Software Programador_Software_de_sistemas Tecnico_de_implementacion_de_sistemas DiseÒador_de_videojuegos Especialista_en_sistemas Especialista_en_integracion_y_pruebas)
(profesiones Arquitectura Tecnico_en_integracion Arquitectura_de_sistemas Arquitectura_de_aplicaciones Microprogramador DiseÒador_de_hardware)
(profesiones Sistemas_Informacion Programador_multimedia Mantenimiento_en_redes DiseÒador_web DiseÒador_de_interfaces Tecnico_en_implementacion_de_sistemas)
(profesiones Tecnologias_de_la_informacion Especialista_en_redes Especialista_en_seguridad DiseÒador_de_redes Diseñador_de_interfaces Diseñador_de_redes_moviles)
(objetivo reinicio)
(infor Software Esta_rama_se_orienta_al_desarrollo_de_aplicacion._Por_lo_que_se_requiere_un_dominio_alto_en_varios_lenguajes_de_programacion.)
(infor Inteligencia La_inteligencia_artificial_IA_es_un_area_que_esta_en_constante_evolucion_para_esta_rama_se_necesita_interes_por_la_investigacion.)
(infor Arquitectura Para_esta_rama_es_neceario_interes_por_la_fisica_,_el_hardware_, y la programacion bajo nivel.)
(infor Sistemas_Informacion Programacion_web,_diseño_de_base_datos.) 
(infor Tecnologias_de_la_informacion Esta_rama_trabaja_con_se�ales, Esta orientada al campo de las telecomnicaciones.)
)

; Modulo RamaPreferida:--------------------------------

(defrule rama-preferida
?f1 <- (objetivo reinicio)
(not (ramaprefe ?name))
=>
(printout t "Elige la rama que mas te gusta:
 1-Software
 2-Inteligencia
 3-Arquitectura
 4-Sistemas_informacion
 5-Tecnologias_de_la_informacion
 Tu eleccion: ")
(assert (ramaprefe (read)))
(retract ?f1)
)




;Módulos rama-prefe:--------------------------------------------

(defrule rama-prefe1
(ramaprefe ?selec)
(test(= ?selec 1) )
=>
(assert (ramasel Software))
(assert (objetivo sondeaAsignatura1))
(assert (MostrarInfo))
)

;(2.2)----------------------------------------------

(defrule rama-prefe2
(ramaprefe ?selec)
(test(= ?selec 2))
=>
(assert (ramasel Inteligencia))
(assert (objetivo sondeaAsignatura1))
(assert (MostrarInfo))
)

;(2.3)---------------------------------------------------------

(defrule rama-prefe3
(ramaprefe ?selec)
(test(= ?selec 3))
=>
(assert (ramasel Arquitectura))
(assert (objetivo sondeaAsignatura1))
(assert (MostrarInfo))
)

;(2.4)----------------------------------------------------------

(defrule rama-prefe4
(ramaprefe ?selec)
(test(= ?selec 4))
=>
(assert (ramasel Sistemas_Informacion))
(assert (objetivo sondeaAsignatura1))
(assert (MostrarInfo))
)
;(2.5)-------------------------------------------------------------
(defrule rama-prefe5
(ramaprefe ?selec)
(test(= ?selec 5))
=>
(assert (ramasel Tecnologias_de_la_informacion))
(assert (objetivo sondeaAsignatura1))
(assert (MostrarInfo))
)

;(2.6)------------------------------------------------------------

(defrule info
	?m <-(MostrarInfo)
	(ramasel ?r)
	(infor ?r ?d)
	=>
	(printout t "La infomacion de la rama "?r" es " ?d " Despues de esta informacion, �cuanto te interesa esta rama?(0-10)
	")
	(assert (pondera2 ?r (read)))
	(retract ?m)
)


;3-Modulo Sondeo De Asignaturas------------------------------------------

(defrule sondear-asignatura1
?f3 <- (objetivo sondeaAsignatura1)
(ramasel ?rama)
(nexoramaasig ?rama ?asig1 ? ? ? ?)
=>
(printout t "Ahora vamos a evaluar algunas asignaturas relacionadas con la ramas. Que tal se te da ha dado la asignatura " ?asig1 " 
 1-Muy mal
 2-Mal
 3-Bien
 4-Muy bien
 5-Fenomenal
 Tu eleccion: ")
(assert (ponderaAsignatura1 ?rama (read)))
(assert (objetivo sondeaAsignatura2))
(retract ?f3)

)

(defrule sondear-asignatura2
?f3 <- (objetivo sondeaAsignatura2)
(ramasel ?rama)
(nexoramaasig ?rama ?asig1 ?asig2 ?asig3 ?asig4 ?asig5)
=>
(printout t "Que tal se te da la asignatura " ?asig2 " 
 1-Muy mal
 2-Mal
 3-Bien
 4-Muy bien
 5-Fenomenal
 Tu eleccion: ")
(assert (ponderaAsignatura2 ?rama (read)))
(assert (objetivo sondeaAsignatura3))
(retract ?f3)
)

(defrule sondear-asignatura3
?f3 <- (objetivo sondeaAsignatura3)
(ramasel ?rama)
(nexoramaasig ?rama ? ? ?asig3 ? ?)
=>
(printout t "Que tal se te da la asignatura " ?asig3 " 
 1-Muy mal
 2-Mal
 3-Bien
 4-Muy bien
 5-Fenomenal
 Tu eleccion: ")
(assert (ponderaAsignatura3 ?rama (read)))
(assert (objetivo sondeaAsignatura4))
(retract ?f3)
)

(defrule sondear-asignatura4
?f3 <- (objetivo sondeaAsignatura4)
(ramasel ?rama)
(nexoramaasig ?rama ? ? ? ?asig4 ?)
=>
(printout t "Que tal se te da la asignatura " ?asig4 " 
 1-Muy mal
 2-Mal
 3-Bien
 4-Muy bien
 5-Fenomenal
 Tu eleccion: ")
(assert (ponderaAsignatura4 ?rama (read)))
(assert (objetivo sondeaAsignatura5))
(retract ?f3)
)

(defrule sondear-Asignatura5
?f3 <- (objetivo sondeaAsignatura5)
(ramasel ?rama)
(nexoramaasig ?rama ? ? ? ? ?asig5)
=>
(printout t "Que tal se te da la asignatura " ?asig5 " 
 1-Muy mal
 2-Mal
 3-Bien
 4-Muy bien
 5-Fenomenal
 Tu eleccion: ")
(assert (ponderaAsignatura5 ?rama (read)))
(assert (objetivo sondearFuturo))
(retract ?f3)
)

;3.2-----------------------------------------------------------------

(defrule sondear-futuro
?f3 <- (objetivo sondearFuturo)
(ramasel ?rama)
(profesiones ?rama ?prof1 ?prof2 ?prof3 ?prof4 ?prof5)
=>
(printout t "Ahora vamos a ver que salidas laborales ofrece esta rama.En cuantas de estas profesiones te gustaria trabajar:
 
 * " ?prof1 " 
 
 * " ?prof2 " 

 * " ?prof3 " 

 * " ?prof4 "

 * " ?prof5 "

 Responde con el numero de profesiones que te atraigan: ")
(assert (pondera3 ?rama (read)))
(assert (objetivo2  valfinasig))
(retract ?f3)
)

;4------------------------------------------------------------------

(defrule conclusion-asignaturas
(ramasel ?rama)
?f3 <- (objetivo2 valfinasig)
?h1<-(ponderaAsignatura1 ?rama ?val1)
?h2<-(ponderaAsignatura2 ?rama ?val2)
?h3<-(ponderaAsignatura3 ?rama ?val3)
?h4<-(ponderaAsignatura4 ?rama ?val4)
?h5<-(ponderaAsignatura5 ?rama ?val5)
=>
(assert (valfin ?rama (+ ?val5 ?val4 ?val3 ?val1 ?val2)))
(retract ?f3)
)

(defrule conclusion-global
?h1<-(valfin ?rama ?val1)
?h2<-(pondera2 ?rama ?val2)
?h3<-(pondera3 ?rama ?val3)
=>
(retract ?h1)
(retract ?h2)
(retract ?h3)
(assert(valorglobal ?rama (+ ?val1 ?val2 ?val3)));este valor ira entre 6-31
)
;5--------------------------------------------------------------------



;5.5-------------------------------------------------------------------

(defrule siafin
(valorglobal ?rama1 ?val1)
(test(> ?val1 16))
=>
(assert (afinidad 1))
(assert (objetivo3 finalizar))
)

;---------

(defrule noafin
(valorglobal ?rama1 ?val1)
(test(< ?val1 17))
=>
(assert (afinidad 0))
(assert (objetivo3 finalizar))
)


;6--------------------------------------------------------------------
;
(defrule finalize1-1
(valorglobal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 1))
(test (eq ?rama Arquitectura))
(ponderaAsignatura4 ?rama ?val4)
(test (> ?val4 4))

=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una mala opcion para ti. Te recomendaria tener en cuentra la rama de Tecnologias de la informacion, ya que podria asemejarse mas a tus caracteristicas . Te gustaria informarte sobre otra rama?(y/n)")
(assert (repetir (read)))
)

(defrule finalize1-2
(valorglobal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 1))
(test (eq ?rama Arquitectura))
(ponderaAsignatura4 ?rama ?val2)
(test (> ?val2 4))
=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una mala opcion para ti. Te recomendaria tener en cuentra la rama de Ingenieria en Software, ya que podria asemejarse mas a tus caracteristicas . Te gustaria informarte sobre otra rama?(y/n)")
(assert (repetir (read)))
)

(defrule finalize1-3
(valorglobal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 1))
(test (eq ?rama Arquitectura))
(ponderaAsignatura4 ?rama ?val3)
(test (> ?val3 4))

=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una mala opcion para ti. Te recomendaria tener en cuentra la rama de Sistemas de informacion, ya que podria asemejarse mas a tus caracteristicas . Te gustaria informarte sobre otra rama?(y/n)")
(assert (repetir (read)))
)

(defrule finalize1-4
(valorglobal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 1))
(test (eq ?rama Arquitectura))
(ponderaAsignatura4 ?rama ?val5)
(test (> ?val5 4))

=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una mala opcion para ti. Te recomendaria tener en cuenta la rama de Computacion y sistemas inteligentes, ya que podria asemejarse mas a tus caracteristicas. Te gustaria informarte sobre otra rama?(y/n)")
(assert (repetir (read)))
)



(defrule finalize2-1
(valorglobal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 1))
(test (eq ?rama Tecnologias_de_la_informacion))
(ponderaAsignatura4 ?rama ?val4)
(test (> ?val4 4))
=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una mala opcion para ti. Te recomendaria tener en cuenta la rama de Arquitectura . Te gustaria informarte sobre otra rama?(y/n)")
(assert (repetir (read)))
)

(defrule finalize2-2
(valorglobal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 1))
(test (eq ?rama Tecnologias_de_la_informacion))
(ponderaAsignatura4 ?rama ?val2)
(test (> ?val2 4))
=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una mala opcion para ti. Te recomendaria tener en cuentra la rama de Ingenieria del software. Te gustaria informarte sobre otra rama?(y/n)")
(assert (repetir (read)))
)

(defrule finalize2-3
(valorglobal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 1))
(test (eq ?rama Tecnologias_de_la_informacion))
(ponderaAsignatura4 ?rama ?val3)
(test (> ?val3 4))
=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una mala opcion para ti. Te recomendaria tener en cuentra la rama de Sistemas de la informacion . Te gustaria informarte sobre otra rama?(y/n)")
(assert (repetir (read)))
)

(defrule finalize2-4
(valorglobal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 1))
(test (eq ?rama Tecnologias_de_la_informacion))
(ponderaAsignatura5 ?rama ?val5)
(test (> ?val5 4))
=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una mala opcion para ti. Te recomendaria tener en cuentra la rama de Computacion y sistemas inteligentes . Te gustaria informarte sobre otra rama?(y/n)")
(assert (repetir (read)))
)

(defrule finalize3-1
(valorglobal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 1))
(test (eq ?rama Inteligencia))
(ponderaAsignatura2 ?rama ?val2)
(test (> ?val2 4))
=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una mala opcion para ti. Te recomendaria tener en cuentra la rama de ingenieria del softaware . Te gustaria informarte sobre otra rama?(y/n)")
(assert (repetir (read)))
)

(defrule finalize3-2
(valorglobal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 1))
(test (eq ?rama Inteligencia))
(ponderaAsignatura5 ?rama ?val3)
(test (> ?val3 4))
=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una mala opcion para ti. Te recomendaria tener en cuentra la rama de Sistemas de informacion . Te gustaria informarte sobre otra rama?(y/n)")
(assert (repetir (read)))
)

(defrule finalize3-3
(valorglobal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 1))
(test (eq ?rama Inteligencia))
(ponderaAsignatura5 ?rama ?val4)
(test (> ?val4 4))
=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una mala opcion para ti. Te recomendaria tener en cuentra la rama de hardware . Te gustaria informarte sobre otra rama?(y/n)")
(assert (repetir (read)))
)

(defrule finalize4-1
(valorglogal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 1))
(test (eq ?rama Sistemas_Informacion))
(ponderaAsignatura5 ?rama ?val2)
(test (> ?val2 4))
=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una mala opcion para ti. Te recomendaria tener en cuentra la rama de Ingnieria del Software . Te gustaria informarte sobre otra rama?(y/n)")
(assert (repetir (read)))
)

(defrule finalize4-2
(valorglobal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 1))
(test (eq ?rama Sistemas_Informacion))
(ponderaAsignatura5 ?rama ?val3)
(test (> ?val3 4))
=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una mala opcion para ti. Te recomendaria tener en cuentra la rama de Sistemas de informacion informarte sobre otra rama?(y/n)")
(assert (repetir (read)))
)

(defrule finalize4-3
(valorglobal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 1))
(test (eq ?rama Sistemas_Informacion))
(ponderaAsignatura5 ?rama ?val4)
(test (> ?val4 4))
=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una mala opcion para ti. Te recomendaria tener en cuentra la rama de Ingeniriea del Hardaware")
(assert (repetir (read)))
)

(defrule finalize4-2
(valorglobal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 1))
(test (eq ?rama Sistemas_Informacion))
(ponderaAsignatura5 ?rama ?val5)
(test (> ?val5 4))
=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una mala opcion para ti. Te recomendaria tener en cuentra la rama de Computacion y Sistemas inteligentes. Te gustaria informarte sobre otra rama?(y/n)")
(assert (repetir (read)))
)

(defrule finalize5-1
(valorglobal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 1))
(test (eq ?rama Software))
(ponderaAsignatura5 ?rama ?val3)
(test (> ?val3 4))
=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una mala opcion para ti. Te recomendaria tener en cuentra la rama de Sistemas de Informacion . Te gustaria informarte sobre otra rama?(y/n)")
(assert (repetir (read)))
)

(defrule finalize5-2
(valorglobal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 1))
(test (eq ?rama Software))
(ponderaAsignatura5 ?rama ?val4)
(test (> ?val4 4))
=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una mala opcion para ti. Te recomendaria tener en cuentra la rama de Ingeniria de computadores . Te gustaria informarte sobre otra rama?(y/n)")
(assert (repetir (read)))
)

(defrule finalize5-3
(valorglobal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 1))
(test (eq ?rama Software))
(ponderaAsignatura5 ?rama ?val5)
(test (> ?val5 4))
=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una mala opcion para ti. Te recomendaria tener en cuentra la rama de Computacion y sistemas inteligentes. Te gustaria informarte sobre otra rama?(y/n)")
(assert (repetir (read)))
)
;--------------------------------------------------------------------------------------------

(defrule finalize2-1-1
(valorglobal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 0))
(test (eq ?rama Arquitectura))
(ponderaAsignatura4 ?rama ?val4)
(test (> ?val4 4))

=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una mala opcion para ti. Te recomendaria tener en cuentra la rama de Tecnologias de la informacion, ya que podria asemejarse mas a tus caracteristicas . Te gustaria informarte sobre otra rama?(y/n)")
(assert (repetir (read)))
)

(defrule finalize2-1-2
(valorglobal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 0))
(test (eq ?rama Arquitectura))
(ponderaAsignatura4 ?rama ?val2)
(test (> ?val2 4))

=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una mala opcion para ti. Te recomendaria tener en cuentra la rama de Ingenieria en Software, ya que podria asemejarse mas a tus caracteristicas . Te gustaria informarte sobre otra rama?(y/n)")
(assert (repetir (read)))
)

(defrule finalize2-1-3
(valorglobal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 0))
(test (eq ?rama Arquitectura))
(ponderaAsignatura4 ?rama ?val3)
(test (> ?val3 4))

=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una mala opcion para ti. Te recomendaria tener en cuentra la rama de Sistemas de informacion, ya que podria asemejarse mas a tus caracteristicas . Te gustaria informarte sobre otra rama?(y/n)")
(assert (repetir (read)))
)

(defrule finalize2-1-4
(valorglobal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 0))
(test (eq ?rama Arquitectura))
(ponderaAsignatura4 ?rama ?val5)
(test (> ?val5 4))

=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una mala opcion para ti. Te recomendaria tener en cuentra la rama de Coomputacion y sistemas inteligentes, ya que podria asemejarse mas a tus caracteristicas . Te gustaria informarte sobre otra rama?(y/n)")
(assert (repetir (read)))
)



(defrule finalize2-2-1
(valorglobal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 0))
(test (eq ?rama Tecnologias_de_la_informacion))
(ponderaAsignatura4 ?rama ?val4)
(test (> ?val4 4))
=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una mala opcion para ti. Te recomendaria tener en cuentra la rama de Arquitectura . Te gustaria informarte sobre otra rama?(y/n)")
(assert (repetir (read)))
)

(defrule finalize2-2-2
(valorglobal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 0))
(test (eq ?rama Tecnologias_de_la_informacion))
(ponderaAsignatura4 ?rama ?val2)
(test (> ?val2 4))
=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una mala opcion para ti. Te recomendaria tener en cuentra la rama de Ingenieria del software. Te gustaria informarte sobre otra rama?(y/n)")
(assert (repetir (read)))
)

(defrule finalize2-2-3
(valorglobal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 0))
(test (eq ?rama Tecnologias_de_la_informacion))
(ponderaAsignatura4 ?rama ?val3)
(test (> ?val3 4))
=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una buena opcion para ti. Te recomendaria tener en cuentra la rama de Sistemas de la informacion . Te gustaria informarte sobre otra rama?(y/n)")
(assert (repetir (read)))
)

(defrule finalize2-2-4
(valorglobal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 0))
(test (eq ?rama Tecnologias_de_la_informacion))
(ponderaAsignatura5 ?rama ?val5)
(test (> ?val5 4))
=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una mala opcion para ti. Te recomendaria tener en cuentra la rama de Computacion y sistemas inteligentes . Te gustaria informarte sobre otra rama?(y/n)")
(assert (repetir (read)))
)

(defrule finalize2-3-1
(valorglobal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 0))
(test (eq ?rama Inteligencia))
(ponderaAsignatura2 ?rama ?val2)
(test (> ?val2 4))
=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una mala opcion para ti. Te recomendaria tener en cuentra la rama de ingenieria del softaware . Te gustaria informarte sobre otra rama?(y/n)")
(assert (repetir (read)))
)

(defrule finalize2-3-2
(valorglobal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 0))
(test (eq ?rama Inteligencia))
(ponderaAsignatura5 ?rama ?val3)
(test (> ?val3 4))
=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una mala opcion para ti. Te recomendaria tener en cuentra la rama de Sistemas de informacion . Te gustaria informarte sobre otra rama?(y/n)")
(assert (repetir (read)))
)

(defrule finalize2-3-3
(valorglobal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 0))
(test (eq ?rama Inteligencia))
(ponderaAsignatura5 ?rama ?val4)
(test (> ?val4 4))
=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una mala opcion para ti. Te recomendaria tener en cuentra la rama de hardware . Te gustaria informarte sobre otra rama?(y/n)")
(assert (repetir (read)))
)

(defrule finalize2-4-1
(valorglobal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 0))
(test (eq ?rama Sistemas_Informacion))
(ponderaAsignatura5 ?rama ?val2)
(test (> ?val2 4))
=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una mala opcion para ti. Te recomendaria tener en cuentra la rama de Ingnieria del Software . Te gustaria informarte sobre otra rama?(y/n)")
(assert (repetir (read)))
)

(defrule finalize2-4-2
(valorglobal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 0))
(test (eq ?rama Sistemas_Informacion))
(ponderaAsignatura5 ?rama ?val3)
(test (> ?val3 4))
=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una mala opcion para ti. Te recomendaria tener en cuentra la rama de Sistemas de informacion informarte sobre otra rama? (y/n)")
(assert (repetir (read)))
)

(defrule finalize2-4-3
(valorglobal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 0))
(test (eq ?rama Sistemas_Informacion))
(ponderaAsignatura5 ?rama ?val4)
(test (> ?val4 4))
=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una mala opcion para ti. Te recomendaria tener en cuentra la rama de Ingeniriea del Hardaware")
(assert (repetir (read)))
)

(defrule finalize2-4-2
(valorglobal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 0))
(test (eq ?rama Sistemas_Informacion))
(ponderaAsignatura5 ?rama ?val5)
(test (> ?val5 4))
=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una mala opcion para ti. Te recomendaria tener en cuentra la rama de Computacion y Sistemas inteligentes. Te gustaria informarte sobre otra rama?(y/n)")
(assert (repetir (read)))
)

(defrule finalize2-5-1
(valorglobal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 0))
(test (eq ?rama Software))
(ponderaAsignatura5 ?rama ?val3)
(test (> ?val3 4))
=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una mala opcion para ti. Te recomendaria tener en cuentra la rama de Sistemas de Informacion . Te gustaria informarte sobre otra rama?(y/n)")
(assert (repetir (read)))
)

(defrule finalize2-5-2
(valorglobal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 0))
(test (eq ?rama Software))
(ponderaAsignatura5 ?rama ?val4)
(test (> ?val1 6))
=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una mala opcion para ti. Te recomendaria tener en cuentra la rama de Ingeniria de computadores . Te gustaria informarte sobre otra rama?(y/n)")
(assert (repetir (read)))
)

(defrule finalize2-5-3
(valorglobal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 0))
(test (eq ?rama Software))
(ponderaAsignatura5 ?rama ?val5)
(test (> ?val1 2))
=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una mala opcion para ti. Te recomendaria tener en cuentra la rama de Computacion y sistemas inteligentes. Te gustaria informarte sobre otra rama?(y/n)")
(assert (repetir (read)))
)
;------------------------------------------------------------------
(defrule finalizeConafinidadGlobal
(valorglobal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 1))
=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una mala opcion para ti.. Te gustaria informarte sobre otra rama?(y/n)")
(assert (repetir (read)))
)

(defrule finalizeSinafinidadGlobal
(valorglobal ?rama ?val1)
?f2<-(objetivo3 finalizar)
(afinidad ?a)
(test (eq ?a 0))
=>
(retract ?f2)
(printout t "La rama de " ?rama " no es una buena opcion para ti. Te gustaria informarte sobre otra rama?(y/n)")
(assert (repetir (read)))
)




;REinicio-----------------------------------------------------------

(defrule reboot
?f1<-(valorglobal ?rama ?valtotal)
?f2<-(afinidad ?)
?f3<-(repetir y)
?f4<-(ramaprefe ?val)
?f6<-(ramasel ?)
?h8<-(ponderaAsignatura1 ?rama ?val1)
?h9<-(ponderaAsignatura2 ?rama ?val2)
?h10<-(ponderaAsignatura3 ?rama ?val3)
?h11<-(ponderaAsignatura4 ?rama ?val4)
?h12<-(ponderaAsignatura5 ?rama ?val5)
=>
(retract ?f1 ?f2 ?f3 ?f4 ?f6 ?h8 ?h9 ?h10 ?h11 ?h12)
(assert (primersondeo ?valtotal))
(assert (objetivo reinicio))
)


(defrule noreboot
(repetir n)
=>
(printout t "Esperamos que el programa te resultara util. :-)
")
)

;------------------------------------------------------------------------------
(defrule comparacion1
?f1<-(valorglobal ?rama ?valtotal)
?f2<-(primersondeo ?val)
(test (> ?valtotal ?val))
=>
(printout t "Esta rama podr�a ser mejor para ti que la anterior.
")
)
(defrule comparacion2
?f1<-(valorglobal ?rama ?valtotal)
?f2<-(primersondeo ?val)
(test (< ?valtotal ?val))
=>
(printout t "Esta rama podr�a ser peor eleccion para ti que la anterior.
")
)