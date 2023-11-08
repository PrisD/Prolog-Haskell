persona(mariano, 20, m, caracteristica(68, 169, mediana)).
persona(leandro, 12, m, caracteristica(38, 123, mediana)).
persona(gisella, 30, f, caracteristica(59, 162, pequenia)).
persona(mara, 42, f, caracteristica(88, 195, grande)).
persona(osvaldo, 25, m, caracteristica(98, 165, grande)).

actividad(mariano, deportes([basket])).
actividad(mariano, ocupaciones([estudiante])).
actividad(leandro, deportes([futbol, skate, taekwondo])).
actividad(leandro, ocupaciones([estudiante])).
actividad(gisella, deportes([pilates,correr])).
actividad(gisella, ocupaciones([amaDeCasa, maestra])).
actividad(mara, ocupaciones([abogada, profesora])).
actividad(osvaldo, ocupaciones([empleado])).

enfermedad(leandro,alergias).
enfermedad(mara,diabetes).
enfermedad(leandro,alergias).

/* 1- Indicar si una persona es sedentaria. Una persona es sedentaria cuando no practica deportes y tiene menos de dos ocupaciones. */
esSedentaria(Persona) :-
    not(practicaDeportes(Persona)),
    cantidadOcupaciones(Persona,Cantidad),
    Cantidad < 2.


cantidadOcupaciones(Persona,Cantidad) :-
    findall(Ocupacion, actividad(Persona, ocupaciones(Ocupacion)), Ocupaciones),
    length(Ocupaciones, Cantidad).

/*  Desarrollar un predicado que indique si una persona es activa. Una persona es activa cuando 
practica al menos un deporte o tiene mas de dos ocupaciones.
 */

esActiva(Persona) :-
    actividad(Persona,deportes(_)).
esActiva(Persona) :-
    cantidadOcupaciones(Persona,Cantidad),
    Cantidad > 2.

/* - Calcular el peso ideal de una persona de acuerdo a la siguiente formula:
Peso Ideal = 0.75 * (altura en cm - 150) + 50 
 */

 pesoIdeal(Persona, PesoIdeal) :-
    persona(Persona, _, _, caracteristica(_, Altura, _)),
    PesoIdeal is 0.75 * (Altura - 150) + 50.

/* Calcular el IMC (Indice de Masa Corporal) de una persona. El IMC se obtiene dividiendo el peso por la estatura 
al cuadrado. Por lo tanto, si pesa 60 kilos y mide 1.60m, la cuenta será 60 dividido (1.60) al cuadrado = 23.43.
 Este es entonces, el índice de masa corporal.
 */

imc(Persona,Imc):-
    persona(Persona, _, _, caracteristica(Peso, Altura, _)),
    Imc is Peso / (Altura/100)^2 .

/* 5- Averiguar quienes son las personas deportistas, o sea todas las personas que practican 
al menos un deporte. Diseñar dos soluciones, con y sin listas.
 */

% Sin listas
practicaDeportes(Persona) :-
    actividad(Persona, deportes(_)).

% Con listas
deportistas(Deportistas) :-
    findall(
        Persona,
        actividad(Persona, deportes(_)),
        Deportistas).  

/*         6- Devolver todas las personas ultra deportistas (las personas ultra deportistas son aquellas que hacen más de 2 deportes).
 */
ultraDeportistas(Persona) :-
    actividad(Persona, deportes(Deportes)),
    length(Deportes,Cantidad),
    Cantidad >= 2.