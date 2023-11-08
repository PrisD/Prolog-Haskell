animal(vaca).
animal(cerdo).

proviene(leche,vaca).
proviene(queso,leche).
proviene(pan,trigo).
proviene(jamon,cerdo).


esLacteo(Alimento) :-
    proviene(Alimento,leche).

tieneGluten(Alimento) :-
    proviene(Alimento,trigo).

/* Recursividad! */
esDerivadoAnimal(Alimento) :-
    proviene(Alimento,Materia),
    animal(Materia).
esDerivadoAnimal(Alimento) :-
    proviene(Alimento,Materia),
    esDerivadoAnimal(Materia).

/* platos */

plato(sandwich,pan).
plato(sandwich,jamon).
plato(sandwich,queso).

plato(wok,pan).
plato(wok,arroz).
plato(wok,zanahoria).
plato(wok,cebolla).
plato(wok,morron).

dietaVegana(Plato) :-
    forall(
            plato(Plato,Alimento),
            not(esDerivadoAnimal(Alimento))).

dietaCeliaca(Plato) :-
    forall(
        plato(Plato,Alimento),
        not(tieneGluten(Alimento))).
dieta(Plato):-
    plato(Plato,_).

% Define las restricciones dietéticas de las personas.
restricciones(analia, vegana).
restricciones(benito, celiaca).
restricciones(claudia, omnivora).

% Define los diagnósticos de las personas y sus niveles.
diagnostico(analia, prevencion,obesidad, 5).
diagnostico(benito, prevencion,hipertension, 4).
diagnostico(claudia, critico,colesterol, 3).

% Define reglas para verificar si un diagnóstico es peligroso.


