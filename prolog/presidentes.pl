presidencia(alfonsin,1983,1989,"Recuperacion de la democracia").
presidencia(menem,1990,1995,"Convertibilidad 1 peso = 1 dolar").
presidencia(menem,1996,1999,"Desocupacion record").
presidencia(deLaRua,2000,2001,"Salida en helicoptero").

/* Quiénes fueron presidente por más de un período (sin importar si fueron sucesivos o no) (Menem) */
masDeUnaPresidencia(Presidente) :-
        presidencia(Presidente,Inicio1,_,_),
        presidencia(Presidente,Inicio2,_,_),
        Inicio1 \= Inicio2.

presidenteMasDeUnPeriodo(X) :- 
    presidencia(X, _, _, _), 
    findall(X, presidencia(X, _, _, _), L), 
    length(L, N), 
    N > 1.
/* En una fecha dada, quién era el presidente. (2000 De la Rua) */
quienEsPresidente(Anio, Presidente) :-
    presidencia(Presidente,Inicio,Fin,_),
    Anio >= Inicio,
    Anio =< Fin.
    
/* Acciones de gobierno */
accion(juicio,1985,buenosAires,30000000).
accion(hiperinflacion,1989,buenosAires,10).
accion(privatizacion,1992,campana,1).

buenaAccion(Accion) :-
    accion(Accion,_,_,Beneficiarios),
    Beneficiarios >= 10000.

presidenteAccionesBuenas(Presidente) :-
    accion(Accion,Fecha,_,_),
    buenaAccion(Accion),
    quienEsPresidente(Fecha,Presidente).

/* Insulso. En su período no hizo nada. (De la Rua) */
accionPresidente(Presidente,Accion,Fecha) :-
    accion(Accion,Fecha,_,_),
    quienEsPresidente(Fecha,Presidente).

insulso(Presidente) :-
    presidencia(Presidente,Inicio,Fin,_),
    not(accionPresidente(Presidente,_,_)).
    
/* Malo. Hizo cosas, pero nada bueno. (Menem) */

malo(Presidente)  :-
  presidencia(Presidente,_,_,_),
  not((accionPresidente(Presidente,Accion,_),buenaAccion(Accion))).
    
/* Regular. En todos sus períodos hizo al menos una cosa buena (Alfonsín) */

regular(Presidente) :-
    presidencia(Presidente,_,_,_),
    any((accionPresidente(Presidente,Accion,_),buenaAccion(Accion))).