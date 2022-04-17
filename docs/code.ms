.so macros.ms   \" First, let's import some macros.
.mso fr.tmac
.mso hdtbl.tmac
.nr legendps 2
.de LEGEND1
.QP
.vs -\\n[legendps]p
.ps -\\n[legendps]
.br
..
.de LEGEND2
.br
.vs +\\n[legendps]p
.ps +\\n[legendps]
.br
.LP
..
.defcolor color_ressenti      rgb 0.6 0.2 0.2
.defcolor color_interet       rgb 1 0 0
.defcolor color_prisme        rgb 0 0 1
.defcolor color_faitpartiel   rgb 0.2 0.6 0.2
.defcolor color_liens         rgb 0.2 0.2 0.6
.defcolor color_contraintes   rgb 0.9 0 0.6
.
.TITLE Code de la route : quelques notes
.AUTHOR Philippe Pittoli
.ABSTRACT1
Quelques notes sur le code de la route.

.INFORMATIONS_FR \\*[WEBSITE]/research_fr.pdf \\*[EMAIL]
.ABSTRACT2
.\".TWO_COLUMNS
.\".vs -\n[table_size_offset]p
.\".ps -\n[table_size_offset]
.PS
x = 0.5
y = x
r  = 0.02
rt = 0.02
marge = 0.05
iconsep = 0.3

DANGER:
L1: line from Here to Here + (x,0)
L2: line from Here + (0,marge/2) to Here + (-(x/2)+marge/2,y)
L3: line from L1.w + (0,marge/2) to L2.n + (-marge/2,0)
arc rad r  from L1.e to L2.s
arc rad rt from L2.w to L3.e
arc rad r  from L3.w to L1.w

OBLIG: circle rad x/2 with .n at L1 .c + (0,-iconsep)
INDIC: box rad 0.02 width x with .n at OBLIG .s + (0,-iconsep)

# En cas de ligne jaune
#LJAUNE_DIS: circle rad x/2 with .n at INDIC.s + (0,-iconsep)
#line from 
#LJAUNE_CON: circle rad x/2 with .n at LJAUNE_DIS.s + (0,-iconsep)

"Danger"     ljust at DANGER.e  + (x/2,x/2)
"Obligation" ljust at OBLIG.e   + (x/2,0)
"Indication" ljust at INDIC.e   + (x/2,0)
.PE
.\".vs +\n[table_size_offset]p
.\".ps +\n[table_size_offset]

ligne jaune
.BULLET discontinue : stationnement interdit
.br
panneau = cercle (obligation) avec trait oblique
.BULLET continue : stationnement + arrêt interdit
.br
panneau = cercle (obligation) avec double trait oblique
.ENDBULLET

.de DOUBLESPACE
.br
\h'1.6'\\$*
..

.de SPACE
.br
\h'0.8'\\$*
..

.SECTION Info aléatoires
.BULLET Sur une autoroute, je vais rencontrer une borne d'appel d'urgence tous les 2km
.BULLET zones de rencontre
.SPACE = 20km/h pour éviter accidents mortels
.SPACE = cohabitation entre usagers
.BULLET piéton qui traverse = s'arrêter pour ne pas le laisser sur la chaussée
.SPACE + il a le droit s'il n'y a pas de passage piéton à moins de 50m
.ENDBULLET

.SECTION Bonnes pratiques
.BULLET sortie de véhicule = regard rétroviseur et angle mort (véhicule, cycliste etc.)
.SPACE + main droite pour ouvrir la portière
.BULLET regard doit "traverser" le pare-brise au milieu de celui-ci
.BULLET serrer les écrous d'une roue = à faire quand la roue est au sol pour pas qu'elle tourne
.BULLET objet léger et encombrant = coffre de toit (forme aérodynamique)
.ENDBULLET

.SECTION Panneaux
.BULLET intersection = peut être signalée par une balise blanche avec anneau rouge (petit poteau)
.BULLET aucun signal de priorité = intersection = priorité à droite
.BULLET panneau carré bleu + autobus = arrêt d'autobus
.ENDBULLET

.SECTION Sécurité
.BULLET il ne neige plus = feux de croisement mais pas feux de brouillard
.BULLET danger passage à niveau = imprudence des conduteurs
.BULLET sécurité enfant = portière s'ouvre que de l'extérieur
.BULLET enfants à l'arrière, à l'avant à partir de 10 ans
.BULLET 80km/h distance de sécurité = 44m
.BULLET A l'arrêt, champ visuel = 180°, 30 km/h = 120°, 80 km/h = 60°, 100 km/h = 45°, 130 km/h = 30°
.BULLET accuité visuelle de 10/10 = pouvoir lire panneaux d'entrée d'agglomération jusqu'à 50m
.BULLET alcool + cannabis = 29 fois plus de chances d'avoir un accident
.BULLET moto : intervalle acceptable de 1m (ville), 1.5m hors agglo = acceptable pour 2m aussi !
.BULLET dégagement d'urgence = poignets ou chevilles, pas toucher à l'alignement tête - cou - tronc
.BULLET soleil + voiture = 60° en 10 minutes = déshydratation + arrêt cardiaque
.BULLET 112 = préférable, met en relation avec les services concernés
.SPACE mais aussi possible d'appeler le 15 (SAMU), 18 (pompiers), 17 (police)
.ENDBULLET

.SECTION Véhicule
.BULLET Certains régulateurs de vitesse aident au maintien des espaces de sécurité avant
.BULLET si 1 seul feu brouillard arrière = à gauche depuis 1990
.BULLET passager sans ceinture = conducteur responsable si passager mineur (135€)
.BULLET mauvais entretiens du véhicule = de 25 à 30% de carburant consommé en plus
.BULLET feux diurnes = haut du parechoc avant (même niveau que les phares)
.BULLET feux anti brouillard = bas du parechoc
.BULLET feux de route > croisement > position (insuffisants levé du soleil)
.BULLET signalement dans la voiture : triangle ORANGE voiture qui dérape
.SPACE = problème d'E.S.P. (évite dérapage lors d'un changement de direction ou manoeuvre d'évitement)
.SPACE = peut rouler mais à réparer rapidement
.BULLET AFU (Aide au Freinage d’Urgence) = détecte la vitesse d’enfoncement de la pédale de frein
.SPACE = amplifie le freinage sans bloquer les roues (AFU = couplé avec l’ABS)
.SPACE = allumer automatiquement les feux de détresse
.SPACE = ne freine pas automatiquement à la place du conducteur
.BULLET essuie-glaces = en temps de pluie + brouillard par exemple
.BULLET vérifier les niveaux d'huile et de liquide de refroidissement
.SPACE = sur terrain plat, moteur à froid (huile redescend où on la contrôle + éviter brûlure)
.BULLET le véhicule doit avoir gilet jaune + triangle de présignalisation, pas d'éthylotest ou fusibles
.ENDBULLET

.SECTION Punitions
.BULLET téléphone (y compris kit mains-libres) = 3 points, contravention classe 4 (135€ forfaitaire)
.BULLET ne pas s'arrêter quand les FDO le demandent = refus d'obtempérer
.SPACE => 6 points, 7500 euros et 1 an de prison
.BULLET pas de téléphone, même à l'arrêt (bouchon, feux rouges) sinon 135€ et 3 points
.ENDBULLET

.SECTION Administratif
.BULLET invalidation du permis 1ère année (6 points perdus) = repasser les épreuves théorique et pratique
.SPACE + restituer le permis à la préfecture dans les 10 jours suivant la réception de la lettre
.BULLET conduite accompagnée = accompagnateur peut subir un test de dépistage de stupéfiants
.BULLET place handicapée = faut avoir la carte, sinon stationnement très gênant = 135€
.BULLET deux roues = peuvent circuler entre 2 voies
.SPACE = circulation dense et ralentie à < 50km/h ou 2 voies <= 70 km/h
.SPACE => si 3 voies, entre 2 voies de gauche
.BULLET récépissé en cas de vol de permis de conduire = valable 2 mois
.BULLET Contrôle technique :
.SPACE 1ère visite = dans les 6 mois qui précèdent le 4ème anniversaire,
.SPACE  au-delà de la première visite = tous les 2 ans
.BULLET vignette Crit'Air (certificat qualité de l'air)
.SPACE = apposée sur le véhicule, indique son niveau de pollution.
.SPACE = obligatoire pour circuler dans certaines zones
.DOUBLESPACE => ZCR (Zones à Circulation Restreinte) où elle est obligatoire en permanence.
.DOUBLESPACE => ZPA (Zones de Protection de l'Air) où elle est obligatoire lors de pics de pollution
.DOUBLESPACE => ZPAd (Zones de Protection de l'Air départementale).
.SPACE = permet de circuler en cas de pic de pollution lorsque le préfet décide de mettre en oeuvre la circulation différenciée.
.SPACE = Tous les véhicules sont concernés.
.SPACE = niveau fonction de norme Euro (inscrite sur le certificat d'immatriculation) ou de la date de la première immatriculation.
.ENDBULLET
