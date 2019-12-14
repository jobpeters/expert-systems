male(Francis_Griffin).
male(Carter_Pewterschmidth).
male(Peter_Griffin).
male(Brian_Griffin).
male(Adam_West).
male(Peter_Griffin_Jr).
male(Chris_Griffin).
male(Stewie_Griffin).
male(Dylan).
male(Carol_Son).
male(Bitch_Stewie).
male(Evil_Stewie).


female(Thelma_Griffin).
female(Barbara_Pewterschmidth).
female(Lois_Griffin).
female(Tracy).
female(Carol_West).
female(Meg_Griffin).

parent(Francis_Griffin,Peter_Griffin).
parent(Thelma_Griffin,Peter_Griffin).
parent(Carter_Pewterschmidth,Lois_Griffin).
parent(Carter_Pewterschmidth,Carol_West).
parent(Barbara_Pewterschmidth,Lois_Griffin).
parent(Barbara_Pewterschmidth,Carol_West).
parent(Lois_Griffin,Meg_Griffin).
parent(Lois_Griffin,Chris_Griffin).
parent(Lois_Griffin,Stewie).
parent(Lois_Griffin,Peter_Griffin_Jr).
parent(Peter_Griffin,Meg_Griffin).
parent(Peter_Griffin,Chris_Griffin).
parent(Peter_Griffin,Peter_Griffin_Jr).
parent(Carol_West,Carol_Son).
parent(Adam_West,Carol_Son).
parent(Stewie_Griffin,Bitch_Stewie).
parent(Stewie_Griffin,Evil_Stewie).
parent(Brian_Griffin,Dylan).
parent(Tracy,Dylan).

married(Francis_Griffin,Thelma_Griffin).
married(Thelma_Griffin,Francis_Griffin).

married(Peter_Griffin,Lois_Griffin).
married(Lois_Griffin,Peter_Griffin).

married(Carter_Pewterschmidth,Barbara_Pewterschmidth).
married(Barbara_Pewterschmidth,Carter_Pewterschmidth).

married(Carol_West,Adam_West).
married(Adam_West,Carol_West).







/* Rules*/
husband(Person, Wife):- male(Person),
    married(Person, Wife).

wife(Person, Husband):- female(Person),
    married(Person, Husband).

father(Parent, Child):- male(Parent),
    parent(Parent, Child).

mother(Parent, Child):- female(Parent),
    parent(Parent, Child).

child(Child, Parent):- parent(Parent, Child).

son(Child, Parent):- male(Child),
    parent(Parent, Child).

daughter(Child, Parent):- female(Child),
    parent(Parent, Child).

grandparent(GP, GC):- 
    parent(GP,Parent),
    parent(Parent, GC).

grandmother(GM, GC):- female(GM), 
    parent(GM,Parent),
    parent(Parent, GC).

grandfather(GF, GC):- male(GF),
    parent(GF,Parent),
    parent(Parent, GC).

grandchild(GC, GP):- 
    parent(GP,Parent),
    parent(Parent,GC).

grandson(GS, GP):- male(GS), 
   parent(GP,Parent),
    parent(Parent,GS).

granddaughter(GD, GP):- female(GD),
    parent(GP,Parent),
    parent(Parent,GD).

sibling(Person, Sibling):-
    parent(Parent, Person),
    parent(Parent, Sibling), 
    Person \= Sibling.

brother(Person, Sibling):- male(Person),
    parent(Parent, Person),
    parent(Parent, Sibling), 
    Person \= Sibling.

sister(Person, Sibling):- female(Person),
    parent(Parent, Person),
    parent(Parent, Sibling), 
    Person \= Sibling.

aunt(Person, NieceNephew):-
    female(Person)
    ,
      parent(P_NieceNephew, NieceNephew)
      ;   
      (married(Y, NieceNephew),
       parent(P_NieceNephew, Y))
    ,
      sibling(Person, P_NieceNephew)
      ;
      (sibling(Z, P_NieceNephew),
      married(Z, Person)).
 

uncle(Person, NieceNephew):-
    male(Person)
    ,
      parent(P_NieceNephew, NieceNephew)
      ;   
      (married(Y, NieceNephew),
       parent(P_NieceNephew, Y))
    ,
      sibling(Person, P_NieceNephew)
      ;
      (sibling(Z, P_NieceNephew),
      married(Z, Person)).

niece(Person, AuntUncle):-
    female(Person)
    ,
      parent(P_Person, Person)
      ;   
      (married(Y, Person),
       parent(P_Person, Y))
    ,
      sibling(P_Person, AuntUncle)
      ;
      (sibling(Z, P_Person),
      married(Z, AuntUncle)).

nephew(Person, AuntUncle):-
    male(Person)
    ,
      parent(P_Person, Person)
      ;   
      (married(Y, Person),
       parent(P_Person, Y))
    ,
      sibling(P_Person, AuntUncle)
      ;
      (sibling(Z, P_Person),
      married(Z, AuntUncle)).

?-  female(Lois_Griffin).