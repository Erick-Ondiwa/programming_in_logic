male(amakalu).
male(muthungu).
male(mino).
male(oruko).
male(levi).
male(osama).
male(sang).
male(mike).
male(edick).
male(lisandro).
male(cliff).

female(faith).
female(volka).
female(mercy).
female(joan).
female(fridah).
female(vivian).
female(samantha).
female(annete).
female(phenny).
female(stephanny).

#There are two parents, sang and faith
#They gave birth to mino and volka
#Mino married annete, who was from the family of osama and samantha and gave birth to muthungu.
#muthungu married vivian and gave birth to edick

#mino is the son to sang and faith
#muthungu is a grandson to sang and faith
#edick is a greatgrandson to sang and faith

#sang is a paternal_gf to muthungu

parent(sang, mino).
parent(sang, oruko).
parent(sang, levi).
parent(sang, lisandro).

parent(sang, volka).
parent(faith, volka).

parent(faith, mino).
parent(faith, oruko).
parent(faith, rooney).
parent(faith, lisandro).

parent(osama, annete).
parent(samantha, annete).
parent(osama, cliff).
parent(samantha, cliff).

parent(mino, muthungu).
parent(annete, muthungu).

parent(muthungu, edick).
parent(vivian, edick).

parent(volak, joan).

brother(X,Y):-
  male(X),
  parent(Z, X), 
  parent(Z, Y),
  X \= Y.


sister(X,Y):-
  female(X),
  parent(Z, X), 
  parent(Z, Y),
  X \= Y.

paternal_gf(X, Y):-
  male(X),
  male(W),
  male(Y);
  female(Y),
  parent(X, W),
  parent(W, Y),
  X \= Y, X \= W, Y \= W.

paternal_gm(X, Y):-
  female(X),
  male(W),
  male(Y);
  female(Y),
  parent(X, W),
  parent(W, Y),
  X \= Y, X \= W, Y \= W.

maternal_gf(X, Y):-
  male(X),
  female(W),
  male(Y);
  female(Y),
  parent(X, W),
  parent(W, Y),
  X \= Y, X \= W, Y \= W.

maternal_gm(X, Y):-
  female(X),
  female(W),
  male(Y);
  female(Y),
  parent(X, W),
  parent(W, Y),
  X \= Y, X \= W, Y \= W.


auntie(X, Y):-
  female(X),
  (female(Y); male(Y)),
  male(W),
  sister(X, W),
  parent(W, Y),
  X \= Y, X \= W, Y \= W.

uncle(X, Y):-
  male(X),
  (male(Y); female(Y)),
  female(W),
  sister(W, X),
  parent(W, Y),
  X \= Y, X \= W, Y \= W. # Ensure all variables are distinct


cousin(X, Y):-
  (auntie(W, Y),
  parent(W, X));

  (uncle(W, Y),
  parent(W, X)),
  
  X \= Y, X \= W, Y \= W. # Ensure all variables are distinct

