Sujets:
application, processus, algorithme, système d'exploitation, internet, réseau, sécurité, compilation, fournisseur d'accès, VPN, torrent, DNS, mail, adresse IP…

## Prologue
  Mon objectif :
    introduction à l'informatique : arriver à un niveau minimal de connaissances pour tous
      comprendre l'informatique, sans faire soi-même de l'administration ou du développement informatique
      vocabulaire
      l'état actuel de l'info : comment ça fonctionne en pratique ?
      systèmes d'exploitation : sujet trop peu exploré
      effet de bord : comprendre ce qui ne va pas quand « ça plante »
    dans un second temps
      sujets plus complexes : 
        ce qui ne va pas dans les OS : systemd
        développement :
          outils => compilation
          programmation (Zig, Haskell, Crystal)
    donner mon avis : pourquoi tout est nul
    (directive 4)

  Format : minimaliste
    vidéo de 5 à 10 minutes
    très peu d'histoire (Wikipédia est là pour ça)
    quelques anecdotes pour une meilleure compréhension (qui justement, ne sont pas forcément accessibles sur wikipédia)
    … et un peu de Français ! (peut-être pas seulement)

  Objectif alternatif pour la chaîne
    tribune libre, format ± travaillé



## Introduction à l'informatique
  => de « c'est quoi un clavier » à amateur
     quelques bases pour comprendre de quoi il retourne,
  (pastilles de 5 à 10 minutes max)

  Ordinateur : composants
  Mémoire : types et usages
  Application (exécutable, binaire…)
  Interface utilisateur : graphique vs ligne de commande
  Adresse IP, Réseau, Internet, Ethernet, Wifi…
  Sécurité
  Algorithme
  Terminal et interpréteur de commandes
  Logs / historique
  Système d'exploitation : base d'un SE, comparaison de quelques SE, choix
  Langage de programmation

- Dans le vif
  Sécurité

- ??


## Ce qu'est un ordinateur

unité de calculs (micro-processeur, CPU)
mémoire (RAM)
périphériques
- entré : clavier, souris, réseau…
- sortie : audio, vidéo, réseau…
- stockage : disque dur, SSD, CD…
carte mère (liaison entre les éléments)

  - Ce qu'est un SE
      Logiciels permettant aux utilisateurs d'exploiter le matériel.

    Moyens
      Noyau : interface entre les applications et le matériel
      Applications
      - « de base » (varie selon le système)
      - fonctionnelles, pour utilisateur final, pas forcément pré-installées
      (distinction lâche, mais qui donne une idée générale)
      Documentation
      Abstractions => éviter aux développeurs de gérer la complexité du matériel
      Installation, mises à jour et suppression des applications

    Quels sont les OS
      Windows => épisode dédié
      MAC OS X
      Linux
      *BSD: netbsd, freebsd, openbsd <3
      Haiku
      Unix
      GNU/Hurd
      Plan9
      … et littéralement des milliers d'autres : 1/jeu à une époque (ex: AMIGA)

    Noyaux et Pilotes
      Qui développe les pilotes ?
        Fabriquants de matériels
        Éditeurs du SE (ou du noyau)
        Salariés de diverses entreprises qui ont un intérêt à améliorer le système (prise en charge matérielle, nouvelles fonctionnalités, corrections, etc.)
        Bénévoles (qui peuvent être de simples particuliers durant leur temps libre)

        - Linux => éditeur du noyau (financé par la Linux Foundation), fabriquants, salariés et bénévoles
        - Windows => microsoft et les fabriquants
        - Tous les autres systèmes : principalement des bénévoles,
                                     qui s'inspirent parfois des pilotes du noyau Linux

    - Processus

    - Choix d'un OS
      Lié aux objectifs et contraintes, et à des critères personnels.

      Critères supplémentaires
      - prise en charge matérielle
      - prise en charge de logiciels spécifiques
      - fonctionnement technique (type de noyau)
      - mode de mise à jour
        rolling release (pas de versionnage contraignant, les logiciels sont mis à jour au fil de l'eau)
        versionnage à date fixe (tous les 6 mois, par exemple)
      - durée du support (= mises à jour de sécurité sans forcer la mise à jour des outils)
        de quelques mois à quelques années
      - choix des logiciels pré-installés (y compris l'interface)
      - orientation générale du système (pour débutants, minimaliste, axé sur la sécurité, etc.)
      - 

  Mémoire
    Un espace de stockage
    Plein de types différents : RAM, cache CPU, registres, RAM dans la carte vidéo, disque dur, SSD…
    Usuellement « mémoire » fait référence à la RAM => données temporaires.
    Des données sont stockées à un paquet d'endroits différents sur une machine moderne.
    - CPU : registres, cache
    - Carte vidéo : 

    Organisation de la RAM
      dépendant du SE

      UNIX-like
        pour un processus :

  Interface graphique vs ligne de commande
    Avantages d'une interface graphique
    * plus simple à prendre en mains
      certaines applications sont assez naturelles avec une interface
      exemple : montage vidéo
    * besoin limité en documentation, tout est sous les yeux !

    Désavantages d'une interface graphique
    * interface graphique != simple à utiliser
      passé une certaine complexité dans la fonctionnalité, la complexité de l'interface est inévitable
      exemple : after effect, photoshop, blender… ces applications ne sont pas triviales à prendre en mains
    * beaucoup plus complexe
      à concevoir : une CLI peut être ± simple, y compris pour des actions compliquées
      à coder : plus de code, plus d'erreurs
    * automatisation bien plus compliquée
    * quand la documentation est nécessaire
      elle devient horrible à lire et écrire
      elle devient obsolète à chaque mise à jour
    * plus lourd (binaire, mémoire)
      et ce, même sans prendre en compte la complexité des bibliothèques utilisées


Épisode Windows
- non ergonomique
- raccourcis claviers OK
- quelques absurdités
- sécurité à chier : API pour accéder à la mémoire d'autres processus…
                     puis chiffrer la mémoire parce que c'est pas bien
- complexité
  interface
  API
- non libre => pilotes faits par des entreprises partenaires
  Ce qui donne des outils spécifiques qui ne s'intègrent pas au reste du système pour compenser l'absence de pilotes.
  Par exemple, la lecture de systèmes de fichiers : un outil existe pour lire ces systèmes de fichiers (existant et étant massivement utilisés depuis des décennies). L'outil n'est pas développé par microsoft, il est à télécharger à part (pas système de base).
  L'outil s'intègre très mal au système : on lance cet outil, il a sa propre interface (qui plante… mais passons) et a de fortes limitations sur l'usage que l'on peut faire de la partition lue. On ne peut pas aller dans le navigateur de fichiers et faire des copiers-collers. À la place de cela, on pourrait juste pouvoir lire et écrire de manière transparente n'importe-quelle partition _exactement_ comme si on branchait un disque dur formaté en NTFS ou FAT (c'est-à-dire, comme sous Linux), mais non.
  Les outils comme celui-ci comblent un manque de pilote dans le noyau (oui, la lecture des partitions est bel est bien le travail du noyau), et peuvent avoir de la publicité, du traçage voire carrément contenir des virus.
