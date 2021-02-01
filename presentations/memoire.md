
## Mémoire

Un espace de stockage

Plein de types différents :

* DRAM (mémoire centrale, carte vidéo)
* SRAM (cache CPU)
* registres (chaque cœur de CPU, carte vidéo)
* cache (disque dur, SSD)
* stockage de masse (disque dur, SSD)

Usuellement « mémoire » fait référence à la DRAM => données temporaires.

Organisation de la RAM => dépendant du SE

## Hiérarchie de la mémoire

ordre : vitesse croissante

┌─────────────────────────┬─────────────────────────┬───────────────────┬───────────────┐
│                         │ Organisation            │ Taille            │ Temps d'accès │
├─────────────────────────┼─────────────────────────┼───────────────────┼───────────────┤
│ disque dur et SSD       │ fichiers                │ taille arbitraire │ 1 à 30 ms     │
├─────────────────────────┼─────────────────────────┼───────────────────┼───────────────┤
│ mémoire centrale (DRAM) │ pages                   │ 2 à 4 Kio         │ 30 à 100 ns   │
├─────────────────────────┼─────────────────────────┼───────────────────┼───────────────┤
│ cache processeur (SRAM) │ blocs ou lignes         │ 8 à 128 octets    │ 1 à 10 ns     │
├─────────────────────────┼─────────────────────────┼───────────────────┼───────────────┤
│ registres processeur    │ instructions et données │ 1 à 8 octets      │ < 0.5 ns      │
└─────────────────────────┴─────────────────────────┴───────────────────┴───────────────┘


%1. disque dur et SSD
%	* organisation : fichiers (taille arbitraire)
%	* temps d'accès : jusqu'à 30 ms
%2. mémoire centrale (DRAM)
%	* organisation : pages (2 à 4 Kio)
%	* temps d'accès : 30 à 100 ns
%3. cache processeur
%	* organisation : blocs ou lignes (8 à 128 octets)
%	* temps d'accès : 1 à 10 ns
%4. registres processeur
%	* organisation : instructions et données (1 à 8 octets)
%	* temps d'accès : < 0.5 ns


UNIX-like
pour un processus :
