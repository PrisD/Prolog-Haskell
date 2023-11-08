animal(vaca).
animal(cerdo).

materiaPrima(vaca).
materiaPrima(cerdo).
materiaPrima(arroz).
materiaPrima(trigo).

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