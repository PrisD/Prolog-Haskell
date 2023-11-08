persona(mariano, 20, m, caracteristica(68, 169, mediana)).
persona(leandro, 12, m, caracteristica(38, 123, mediana)).
persona(gisella, 30, f, caracteristica(59, 162, pequenia)).
persona(mara, 42, f, caracteristica(88, 195, grande)).
persona(osvaldo, 25, m, caracteristica(98, 165, grande)).

actividad(mariano, deportes([basket])).
actividad(mariano, ocupaciones([estudiante])).
actividad(leandro, deportes([futbol, skate, taekwondo])).
actividad(leandro, ocupaciones([estudiante])).
actividad(gisella, deportes([pilates])).
actividad(gisella, ocupaciones([amaDeCasa, maestra])).
actividad(mara, ocupaciones([abogada, profesora])).
actividad(osvaldo, ocupaciones([empleado])).

enfermedad(leandro,alergias).
enfermedad(mara,diabetes).
enfermedad(leandro,alergias).

/* 1- Indicar si una persona es sedentaria. Una persona es sedentaria cuando no practica deportes y tiene menos de dos ocupaciones. */
esSedentaria(Persona) :-
    not(practicaDeportes(Persona)),
    findall(Ocupacion, actividad(Persona, ocupaciones(Ocupacion)), Ocupaciones),
    length(Ocupaciones, NumOcupaciones),
    NumOcupaciones < 2.
practicaDeportes(Persona) :-
    actividad(Persona, deportes(_)).