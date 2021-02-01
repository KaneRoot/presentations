
TODO:

- binaire : contenu

%application
%	processus = instance d'une application
%	une application peut engendrer plusieurs processus
%	compilation

## 

## Application

Résoudre un problème

Exemple : déplacer un fichier

1. utilisateur : donne 2 paramètres (fichier à copier, destination)
2. application : copie le fichier puis supprime le fichier original

étape 2 = algorithme

## Algorithme

algorithme = description du comportement de l'application
           = description haut niveau : on ne se préoccupe pas des détails

algorithme traduit dans un langage de programmation = implémentation
                                                    = code source

exemple d'implémentation (langage : sh)
% shell pour les intimes
% on ne va pas s'attarder sur ce code, l'idée étant surtout de voir à
% quoi peut ressembler du code
% ici, ce sont 2 lignes très courtes dans un fichier texte, très simple

	cp $1 $2
	rm $1

(détails dans une future vidéo)

## Code source

Suivant le langage de programmation

1. le code source est compilé
   une application (compilateur) lit le code source et en fait un exécutable (= binaire)

2. le code source est interprété
   une application (interpréteur) lit le code source et exécute les instructions

## Résumé

Application = résoudre un problème

Étapes de conception d'une application :
	problème => algorithme => implémentation

implémentation = code source, algo décrit dans un langage de programmation

## Exemple

(!) algorithme présenté est simple
    son implémentation en LIGNE DE COMMANDE est simple, pas en graphique

implémentation dans le langage « sh », fichier "move" :

	cp $1 $2
	rm $1


usage   : move source destination
exemple : move fichier répertoire

explications

	cp = application de copie de fichiers
	rm = application de suppression de fichiers
	$1, $2 = premier et second paramètre

1. copier un fichier (paramètre 1) vers une destination (paramètre 2)
   cp $1 $2

2. supprimer le fichier original (paramètre 1)
   rm $1

vocabulaire : une application lançant d'autres applications = script (langage courant)

