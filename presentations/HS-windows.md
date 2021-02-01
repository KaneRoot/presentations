
## Windows

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
