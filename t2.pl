% PROLOG
%
% Testado utilizando GNU Prolog, mas é possível executar com qualquer
% compilador Prolog, como SWI.
%
% André Walker    - 407593
% Matheus Finatti - 379603
% Rafael Goes     - 379441
%
%%%%%%  FATOS  %%%%%%

pessoa(francisco).
pessoa(rute).
pessoa(joao).
pessoa(jose).
pessoa(pedro).
pessoa(paulo).
pessoa(antonio).
pessoa(maria).
pessoa(ana).
pessoa(luiza).
pessoa(julia).

pai(joao, antonio).
pai(joao, ana).
pai(joao, pedro).

pai(jose, luiza).
pai(jose, paulo).

pai(francisco, joao).
pai(francisco, jose).

mae(maria, antonio).
mae(maria, ana).
mae(maria, pedro).
mae(julia, luiza).
mae(julia, paulo).
mae(rute, joao).
mae(rute, jose).

%%%%%%  PREDICADOS  %%%%%%

% não é possível ser irmão de si mesmo
irmao(X,Y) :- =(X,Y), !, fail.

irmao(X,Y) :- pessoa(X),
              pessoa(Y),
              pessoa(Pai),
              pessoa(Mae),
              pai(Pai, X),
              pai(Pai, Y), % X e Y têm o mesmo pai
              mae(Mae, X),
              mae(Mae, Y). % X e Y têm a mesma mãe

% caso 1: Y é pai de X
filho(X,Y) :- pessoa(X), pessoa(Y), pai(Y,X).

% caso 2: Y é mãe de X
filho(X,Y) :- pessoa(X), pessoa(Y), mae(Y,X), !.

primo(X,Y) :- pessoa(X),
              pessoa(Y),
              pessoa(P1),
              pessoa(P2),
              filho(X, P1),
              filho(Y, P2),
              irmao(P1, P2).

% X é filho do filho de Y
neto(X,Y) :- pessoa(X),
             pessoa(Y),
             pessoa(Z),
             filho(X,Z),
             filho(Z,Y).
