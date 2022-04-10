.so macros.ms   \" First, let's import some macros.
.ds SPACE_SS_NUMBER_TITLE 0.5\" not a number register because of leading 0
.nr CURRENT_SECTION 0 +1
.nr CURRENT_APPENDIX 0
.af CURRENT_APPENDIX I
.nr CURRENT_SUBSECTION 0 +1
.nr CURRENT_SSSECTION 0 +1
.rm SECTION
.de SECTION
.ie !(\\n[CURRENT_SECTION]=0) .sp +1
.br
.ps +2
.fam H   \" helvetica family
\fB\\n+[CURRENT_SECTION].\h'\\*[SPACE_SS_NUMBER_TITLE]' \\$*\fP
.fam     \" back to previous font family
.ps -2
.PARAGRAPH_INDENTED
..
.de SS
.ie (\\n[CURRENT_APPENDIX]=0) \
.SUBSECTION_NO_NUMBER \\n[CURRENT_SECTION].\
\\n+[CURRENT_SUBSECTION]\h'\\*[SPACE_SS_NUMBER_TITLE]' \\$*
.el \
.SUBSECTION_NO_NUMBER \\n[CURRENT_APPENDIX].\
\\n+[CURRENT_SUBSECTION]\h'\\*[SPACE_SS_NUMBER_TITLE]' \\$*
..
.de SSS
.ie (\\n[CURRENT_APPENDIX]=0) \
.SUBSECTION_NO_NUMBER \\n[CURRENT_SECTION].\
\\n[CURRENT_SUBSECTION].\\n+[CURRENT_SSSECTION]\h'\
\\*[SPACE_SS_NUMBER_TITLE]' \\$*
.el \
.SUBSECTION_NO_NUMBER \\n[CURRENT_APPENDIX].\
\\n[CURRENT_SUBSECTION].\\n+[CURRENT_SSSECTION]\h'\
\\*[SPACE_SS_NUMBER_TITLE]' \\$*
..
.de APPENDIX
.nr CURRENT_APPENDIX +1
.nr CURRENT_SUBSECTION 0       \" reset current subsection numbering
.nr CURRENT_SSSECTION 0        \" reset current subsubsection numbering
.bp                            \" new page
.SECTION_NO_NUMBER Annexe \\n[CURRENT_APPENDIX]. \\$*
..
.de INNERBULLET
.in +1
.br
\(bu
.in +1
.sp -1
\\$*
.in -2
..
.de EENUM           \" Numbered list
.nr LIST_NUMBER +1
.br
\\n[LIST_NUMBER]
.in +1
.sp -1
\\$*
.in -1
..
.de EENDENUM
.nr LIST_NUMBER 0
..
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
.de IEME
\\$1\u\s-4\\$2\s+4\d
..
.de CENTERED
.ce
\\$*
.br
..
.nr N_APPENDIX_BIAIS 1
.af N_APPENDIX_BIAIS I
.nr N_APPENDIX_ECRITURE_PAPIER 2
.af N_APPENDIX_ECRITURE_PAPIER I
.nr N_APPENDIX_MANIPULATIONS 3
.af N_APPENDIX_MANIPULATIONS I
.nr N_APPENDIX_HINDEX 4
.af N_APPENDIX_HINDEX I
.nr N_APPENDIX_CONSEILS_APPRENTISSAGE 5
.af N_APPENDIX_CONSEILS_APPRENTISSAGE I
.nr N_APPENDIX_MEDIAS 6
.af N_APPENDIX_MEDIAS I
.nr N_APPENDIX_MEDIAS_HABITUDES 7
.af N_APPENDIX_MEDIAS_HABITUDES I
.mso fr.tmac
.mso hdtbl.tmac
.TITLE La science et la méthode scientifique
.AUTHOR Philippe Pittoli
.ABSTRACT1
Ce document présente succinctement la science : son objectif, la méthode scientifique, le déroulement de la recherche ainsi que la création de papiers.
Le travail des chercheurs montre un raisonnement et des réflexions qui peuvent être utiles pour repérer des biais cognitifs présents dans la vie quotidienne, voire même des manipulations.
Suite à la lecture de ce document, il est attendu que les discussions (autour de l'actualité par exemple) soient plus fertiles et les prises de décision plus pertinentes.
De nombreuses annexes explorent un sujet en particulier, en complément du texte principal.

.INFORMATIONS_FR \\*[WEBSITE]/research_fr.pdf \\*[EMAIL]
.br
Statut : les 5 premières sections sont correctes. Le reste est en travaux.
.ABSTRACT2
.TWO_COLUMNS
.SECTION Introduction
La science est la somme de nos connaissances et les méthodes nécessaires pour obtenir de nouvelles connaissances.
Elle permet de comprendre le monde qui nous entoure et de mieux le contrôler.
Ainsi, nos sociétés sont des odes à la science, notre quotidien étant façonné par le progrès technique dans tous les domaines (agriculture, santé, génie civil, divertissement...).
En bien et en mal, la science permet à l'humanité de changer l'environnement dans lequel nous vivons.

Pour autant, la science et le travail des chercheurs ne sont pas correctement représentés dans les médias.
Les émissions télévisuelles, la radio ou encore les sites web des différents journaux grand public souffrent de ce même problème de représentation.
Des résultats d'études sont souvent présentés sans contextualisation, sans en décrire tous les paramètres initiaux, et donc sans rigueur intellectuelle.
Le temps journalistique n'est pas le temps scientifique.
Une étude de plusieurs dizaines de pages, complexe et avec de nombreux paramètres, est présentée en quelques minutes ou quelques lignes dans les journaux.
Peu voire aucun recul n'est possible de la part du lecteur sur la qualité de l'étude ainsi présentée.
De plus, les journalistes eux-mêmes n'ont souvent ni le temps ni les compétences pour émettre un tel jugement.
Par conséquent, il n'est pas possible de différencier les informations pertinentes d'une erreur, d'une manipulation grossière, ou encore d'une réclame déguisée.

Comprendre la science dans les grandes lignes permet de mieux jauger la confiance à accorder aux informations diffusées dans les médias.
De même, les erreurs et impostures intellectuelles deviennent plus évidentes à débusquer.
Par conséquent, les prises de décisions sont plus rationnelles et éclairées.
Mieux comprendre la science mène également à des discussions plus fructueuses au quotidien.

Ce document présente la science ainsi que le travail de recherche dans les grandes lignes.
La rigueur nécessaire pour toute contribution sérieuse à la science sera abordée.
Il n'est pas question, en seulement quelques pages, de faire du lecteur un chercheur aguerri (loin de là).
En revanche, la compréhension de ce document permet de prendre du recul sur les informations obtenues dans les médias ainsi que d'aborder n'importe quel sujet de manière plus rationnelle.

Ce document est écrit dans un style proche d'un papier scientifique, mais sans prétendre en avoir la rigueur.
L'objectif est de fournir des informations utiles au plus grand nombre pour découvrir ce qu'est la recherche, pas de s'adresser aux experts d'un domaine.
La concision est recherchée ainsi que la compréhension intuitive des informations fournies, le détail de certains concepts présentés sort du cadre de ce document.
En cas d'imprécision néfaste à la compréhension, n'hésitez pas à contacter l'auteur.

La section 2 présente le principe de biais (cognitif, méthodologique, statistique...), c'est-à-dire d'erreur de raisonnement ou de perception.
La section 3 présente la science et la méthode scientifique, qui permet de prévenir au mieux les erreurs de raisonnement et ainsi d'être plus confiant quant aux connaissances acquises.
Les limites de la science sont également présentées dans cette section, en expliquant le cadre de toute étude scientifique.
La section 4 présente l'art de l'écriture de papiers scientifiques ainsi que la rigueur nécessaire dans la formulation d'un problème.
Cette section est également l'occasion de voir que tous les papiers ne se valent pas.
La section 5 présente les journaux scientifiques, bien différents des journaux traditionnels, ainsi que les critères sur lesquels un scientifique juge leur qualité.
La section 6 portrait le travail de recherche en pratique, ainsi que ses difficultés.
La section 7 aborde la méthode scientifique au-delà de la recherche, car les biais sont partout dans notre quotidien et il est bénéfique pour tout le monde d'apprendre à les identifier.
Enfin, une conclusion sera tirée en section 8.
.SECTION Biais
Un biais cognitif est une erreur de raisonnement ou de perception.
Si l'erreur est honnête, c'est-à-dire involontaire, elle est nommée paralogisme.
À l'inverse, une erreur consciente, dans le but de tromper, est nommée sophisme.
D'autres types de biais existent également (méthodologique, statistique, etc.), et sont synonymes d'erreur dans la suite du document ; leur distinction sortant du cadre de ce papier.
Un biais ne mène pas nécessairement à une conclusion erronée, mais le processus logique y menant n'étant pas fiable, aucune confiance ne peut être accordée au résultat.
Dans cette section, différents biais sont présentés en les mettant en rapport avec des contextes où ils sont régulièrement présents.

.QUESTION "Dieu, où es-tu ?"
La notion de « Dieu » a fait couler beaucoup d'encre au fil des siècles et fait figure de cas d'école concernant les biais de raisonnement.
L'argumentation en faveur d'une divinité est, encore de nos jours, sujette à des dizaines de paralogismes plus ou moins évidents à identifier.
.[
sophismes
.]
Quelques exemples proposés pour justifier l'existence ou des propriétés d'un dieu :
.BULLET
.B "plaidoirie spéciale" " :"
une règle spéciale qui s'appliquerait mais sans justification « tout a une cause, sauf Dieu » ;
.BULLET
.B "tautologie" " :"
définir X comme étant Y, puis Y comme étant X.
Le résultat est donc que
.I "X = X"
et
.I "Y = Y" ,
ce qui ne dit rien.
« Dieu est la première de toutes les causes », en définissant « la première de toutes les causes » de Dieu.
Ce sont donc de simples synonymes, ce qui ne forme pas une définition acceptable ;
.BULLET
.B "argumentation circulaire" " :"
« la bible est la voix de Dieu, on le sait car la bible le dit, et la bible est infaillible car c'est la voix de Dieu » ;
.BULLET
.B "appel à l'ignorance" " :"
partir du principe qu'une position est vraie par défaut.
« Dieu existe car on ne peut pas prouver qu'il n'existe pas » ou encore « la science n'a jamais créé la vie, donc une intervention divine est nécessaire » ;
.BULLET
.B "appel à l'incrédulité personnelle" " :"
supposer une position vraie car on n'arrive pas à imaginer une autre solution.
Autrement dit, « je ne sais pas, donc Dieu ».
« Je vois pas comment un poisson peut devenir un homme, donc Dieu nous a créé puis c'est tout. » ;
.BULLET
.B "appel à la popularité" " :"
« Des milliards de personnes y croient, c'est bien que ça doit être vrai » ;
.BULLET
.B "argument « Galilée »" " (± l'inverse du précédent) :"
penser qu'une personne dans l'erreur est un lanceur d'alerte visionnaire, envers et contre tous, car ses conclusions confortent notre vision du monde quand bien même ses arguments sont faibles et légitimement rejetés par ses pairs ;
.BULLET
.B "argument d'autorité" " :"
« X est docteur et il y croit » ;
.BULLET
.B "appel à la purité" " :"
« Aucun chrétien ne renie sa foi, s'il a changé de religion, c'est qu'il n'a jamais été chrétien ».
.ENDBULLET

.QUESTION "Ma petite entreprise ne connaît pas la crise."
Le monde des affaires et de l'entreprise en général sont sujets à certains biais.
Par exemple, le biais du survivant se retrouve dans les jeunes entreprises où les différents associés se disent « si X a réussi, nous pouvons le faire aussi », en mettant de côté de taux de réussite réel des entreprises du secteur et tout autre facteur important.
De plus, cela peut être combiné à un biais de confirmation si ces mêmes personnes ne s'informent que sur des entreprises ayant du succès.

.QUESTION "Les statistiques, cruelles statistiques."
Les statistiques forment un outil très important en science, mais également dans des prises de décisions de la vie quotidienne.
Par exemple, un marchand peut décider de mettre en avant un produit (disons une poussette) plutôt qu'un autre (un sac de randonnée) suite à une étude de marché portant sur sa clientèle.
Si cette étude de marché se déroule (uniquement) via un formulaire à remplir à la sortie d'une crèche, elle conduira à la conclusion que 100 % des clients ont un enfant en bas âge, privilégiant le premier produit.
Bien entendu, cela est lié à un biais de sélection, les personnes sondées n'étant pas représentatives des clients du marchand.

Toute statistique doit être accompagnée d'un ou plusieurs paramètres pour comprendre les données (p-valeur, intervalle de confiance, écart à la moyenne…).
Pour illustrer cela, un exemple : un enseignant a deux classes et leur donne un devoir.
La première classe obtient une moyenne de
.FRAC 10 20
et l'autre
.FRAC 12 20 .
Quelle classe est la plus en difficulté ?
Avec seulement deux moyennes brutes, impossible de savoir.
Quelques étudiants, très bons ou en grande difficulté, peuvent avoir une grande influence sur une moyenne.
Le nombre d'étudiants par classe n'est pas non plus mentionné.
De plus, émettre un jugement sur un seul devoir est peut-être hâtif.
Une valeur seule (comme une moyenne) est insuffisante pour émettre un jugement.

.QUESTION "Une question peut être biaisée."
Un biais ne vient pas uniquement d'une réponse à une question ou d'une étude, la question peut être
.I chargée ,
c'est-à-dire qui contient une présupposition qui n'est pas remise en question.
Exemple : « depuis combien de temps avez-vous arrêté de battre votre femme ? ».

.QUESTION "Détecter les biais."
Un même biais peut être formulé de nombreuses manières, rendant sa détection parfois complexe.
Un biais peut également être présent dans de nombreux contextes, comme le biais de confirmation.
De plus, des erreurs peuvent se glisser dans l'acquisition d'une donnée ou son interprétation, biaisant, là encore, le résultat.
Il n'existe malheureusement aucune manière automatique de détecter toutes ces erreurs.
Par conséquent, la vigilance reste nécessaire.

Les quelques biais présentés dans cette section ne forment qu'un petit sous ensemble des biais existants (complétés par de nombreux autres exemples dans l'annexe \n[N_APPENDIX_BIAIS]).
La suite du document présente une manière, imparfaite mais suffisante, utilisée en science pour limiter ces erreurs dans le cadre de la recherche.
.SECTION Science et méthode scientifique
La méthode scientifique regroupe un ensemble de méthodes d'analyses et de vérifications différentes pour comprendre le monde qui nous entoure.
Suivant le problème étudié, le chercheur utilise une méthode plutôt qu'une autre pour le résoudre.
Dans cette section, deux méthodes sont introduites (hypothético-déductive et double-aveugle) pour montrer la diversité du travail de recherche.
De même, la chronologie de la recherche est présentée, de l'intuition permettant de résoudre un problème au consensus scientifique.
Par la suite, plusieurs discussions sont amorcées, comme le vocabulaire scientifique (différent du langage courant), le caractère non démocratique, matérialiste et descriptif de la science, la légitimité de la parole d'un scientifique, ou encore l'importance du doute et de la nuance.
Enfin, la section se termine par les limites de la science.

.QUESTION "La méthode hypothético-déductive."
Cette méthode pourrait se résumer brièvement par la formulation d'une hypothèse et la déduction de ses conséquences observables.
Cette méthode tend à faire des prédictions et à expliquer des événements qui se sont déroulés, ce qui permet de juger de sa validité.
Cette méthode a un vaste champ d'application et est très utilisée en science.

Par exemple, un chercheur en informatique s'intéresse à des algorithmes de tri de listes de nombres entiers (passer d'une liste
.I "3, 1, 2"
à
.I "1, 2, 3" ).
Il émet une ou plusieurs hypothèses qu'il suppose lui permettent de créer un algorithme plus rapide.
Ensuite, il explique son nouvel algorithme puis démontre sa complexité (pour faire simple : son nombre d'opérations nécessaires pour trier une liste de N éléments), en comparant cela aux meilleurs algorithmes actuels.
Enfin, comme cela est possible en informatique, le chercheur vérifie par la pratique sa solution en la comparant aux autres algorithmes, ce qui s'appelle une expérimentation\*[*].
.FOOTNOTE1
Certains travaux de recherche peuvent être résumés aussi simplement.
La difficulté du métier de chercheur n'est pas uniquement liée à la complexité des documents produits.
Voir section 6.
.FOOTNOTE2

.QUESTION "La méthode du double-aveugle."
Certaines méthodes sont plus spécifiques, et ont un champ d'application plus restreint.
Par exemple, la méthode du double-aveugle est utile dans un contexte médical.
Dans cette méthode (et dans un contexte médical), pour étudier l'efficacité d'un nouveau traitement, on prend deux groupes de patients : l'un qui reçoit le traitement, l'autre non (ils prennent un autre traitement ou un placébo).
Ni les patients ni le docteur ne savent qui prend le nouveau traitement.
De ce fait, les biais liés à la connaissance du traitement sont limités, que ce soit pour le patient (qui pourrait subir un effet psychosomatique) ou pour le médecin (qui pourrait avoir une interprétation biaisée des résultats ou traiter les patients différemment, par exemple).

.QUESTION "La multiplicité des méthodes."
Les différentes méthodes sont complémentaires et dépendent de la problématique à résoudre.
Par exemple, le double-aveugle n'a pas de sens en informatique ; cette méthode s'attaque à des biais qui ne sont pas présents dans ce contexte.
De même, la méthode hypothético-déductive n'est pas adaptée à tous les domaines, et certaines branches des mathématiques s'en passent.

.QUESTION "Chronologie de la recherche."
En premier lieu, un chercheur se documente sur un problème non résolu en lisant tous les papiers disponibles sur le sujet.
Cette première phase prend des mois de travail, le corpus dédié à un sujet (aussi précis soit-il) pouvant être immense.
Tous les papiers ne sont pas évidents à comprendre, surtout pour un nouveau chercheur, même brillant.

Lorsque le chercheur a une intuition sur une résolution possible du problème, il tente sa chance, par exemple en formulant des hypothèses.
Immédiatement après, il tente de réfuter sa propre proposition, par des calculs ou expérimentations.

.EXPLANATION1
Un chercheur doit essayer de
.UL réfuter
son analyse.
C'est l'effort de réfutation qui donne de la crédibilité à une étude.
Plus une analyse résiste, plus elle apparaît comme valide\*[*].
.EXPLANATION2
.FOOTNOTE1
Ceci est bien sûr discutable dans le cadre spécifique d'une preuve mathématique.
.FOOTNOTE2

Les chercheurs travaillent parfois à plusieurs sur un même sujet, parfois seuls.
Dans tous les cas, même au début de ses travaux, un chercheur peut discuter de sa démarche avec des collègues pour tenter de réfuter ses hypothèses ou enrichir sa réflexion.
Ces discussions peuvent, par exemple, prendre une forme semi-formelle via des réunions ou des présentations internes à l'équipe.

Une fois le travail accompli, un papier de recherche est rédigé\*[*] (détail en section suivante).
.FOOTNOTE1
Certains réussissent à écrire le papier avant de faire le travail.
Cela demande une grande confiance en soi : l'étude peut échouer (pour diverses raisons) ou être devancée par un autre laboratoire, rendant le papier inutile et faisant perdre des mois de travail.
.FOOTNOTE2
Ce document sera éventuellement relu par un collègue (qui pourra être second auteur) afin d'avoir un autre point de vue et de corriger les fautes les plus évidentes.
Le papier est ensuite envoyé à un journal.

Le journal demande à des chercheurs d'autres laboratoires de relire le papier.
Chaque relecteur émet une appréciation : acceptation forte, acceptation, rejet, rejet fort.
Les relecteurs fournissent un retour (bref) au journal et un retour détaillé aux auteurs.
Ils donnent ainsi des pistes d'amélioration, ou indiquent au moins ce qui les a dérangés lors de la lecture\*[*] (erreurs, imprécisions…).
.FOOTNOTE1
Tous les relecteurs ne sont pas consciencieux, malheureusement.
Un papier peut être rejeté avec une réponse très pauvre, ne permettant pas d'améliorer significativement le travail.
.FOOTNOTE2
Si le papier n'est pas directement rejeté, s'ensuivent des allers-retours entre les auteurs et les relecteurs.
Si le papier est rejeté, les auteurs tentent de le publier dans un autre journal.

Une fois le papier accepté, son contenu a déjà passé plusieurs filtres : des experts de la spécialité concernée l'ont jugé acceptable et apportant une contribution suffisante au domaine pour être publié.
Le papier n'est pas pour autant accepté comme vrai, et le chercheur se doit d'adopter une lecture critique de tout papier.
De plus, même une fois publié, l'auteur peut s'apercevoir d'une faille dans son étude et décider de contacter le journal pour rétracter sa publication.
Le journal peut rétracter lui-même le papier, sans l'aval de l'auteur, si des chercheurs lui font remarquer des erreurs trop importantes.

La même étude peut être répliquée par d'autres laboratoires, menant à d'autres publications.
Ainsi, ces nouvelles expérimentations confirment ou infirment les conclusions de la première étude.
Une étude gagne en crédibilité si elle est répliquée avec succès.

Lorsqu'une étude est suffisamment importante, elle fait l'objet de multiples réplications.
Une meta-analyse, c'est-à-dire une
.I "étude des études" ,
vient alors résumer l'état de nos connaissances, sur ce sujet précis et à un instant donné.

Enfin, le résultat de l'étude originelle devient un consensus scientifique, c'est-à-dire la position partagée par les chercheurs du domaine.
Cette expression est rarement employée en dehors des positions faisant l'objet de fausses controverses par idéologie ou pour le profit.
C'est pourquoi il est fait mention de consensus scientifique dans les médias pour le changement climatique (récent et d'origine humaine) ou la théorie de l'évolution par exemple : des lobbies travaillent encore aujourd'hui à nier les faits.

.QUESTION "La science a son propre vocabulaire."
Bien des mots se retrouvent à la fois au quotidien et dans le monde universitaire, pourtant leur signification y est différente.
La suite présente quelques cas évidents, montrant qu'une certaine culture scientifique est nécessaire pour comprendre les papiers, même dans les rares cas où aucun jargon n'est employé.

En statistiques, le terme
.I significatif
n'est pas synonyme d'une grande valeur.
Lors d'une comparaison de deux nombres, comme le taux de rétablissement de patients ayant pris soit un placébo soit un médicament, l'écart est dit
.I significatif
si la différence entre ces deux valeurs n'est pas due au hasard.
Dans ce cas, si le médicament a eu un effet observable, même totalement mineur (comme un taux de rétablissement amélioré de 0.5 %), l'écart sera dit significatif.

Une théorie dans le monde académique n'est pas synonyme d'hypothèse (une simple supposition), c'est un ensemble d'explications, de lois et d'hypothèses permettant de comprendre un phénomène.
Les principes d'une théorie scientifique doivent correspondre aux observations et aux expérimentations (passées, présentes, futures).
Une théorie scientifique est le plus haut niveau de connaissance.

En logique propositionnelle (un formalisme mathématique), dire qu'une proposition est
.I valide
ne veut pas dire qu'elle est vraie ou acceptable, mais que la manière dont elle est formulée (sa forme) est correcte.
La proposition suivante est valide, bien qu'absurde et sans intérêt : « si je mange un pruneau ma voiture change de couleur, si ma voiture change de couleur mon chat explose, donc si je mange un pruneau mon chat explose ».
Formalisé mathématiquement, cette proposition ressemble à :

.KS
.EQ
A -> B
.EN
.sp -1
.EQ
B -> C
.EN
.sp -1
.EQ
A -> C
.EN
.KE

.QUESTION "La science n'est pas une démocratie."
Si une hypothèse n'est pas réfutable (c'est-à-dire qui ne peut pas être vérifiée, pas testable, qui ne peut pas s'invalider), elle est rejetée.
Aucun vote n'est nécessaire.
De même, aucun vote ou cérémonie officielle ne sont nécessaires pour créer un consensus scientifique : les chercheurs doivent suivre les faits, où qu'ils mènent.
C'est ainsi que la communauté scientifique pensait que l'univers était éternel et statique, même après la publication en 1916 de la théorie de la relativité générale d'Albert Einstein, car ses travaux ne correspondaient pas aux observations.
En 1929, les observations évoluent grâce à Edwin Hubble et au télescope Hooker, montrant que l'univers est en expansion, changeant pratiquement du jour au lendemain le consensus scientifique sur le sujet.

.QUESTION "La science est matérialiste."
Certaines questions, ou sujets d'étude, ne relèvent pas du domaine scientifique.
La science se limite à l'étude de ce qui est observable (directement ou non), quantifiable, ainsi qu'aux mathématiques.
Par exemple, prouver l'existence (ou non) du
.I surnaturel ,
qui par définition ne peut s'expliquer rationnellement, ne rentre pas dans le cadre de la science.

À noter que le mot
.I matérialiste
est ici un abus de langage\*[*] pour dire que le domaine d'étude de la science est tout phénomène observable ou quantifiable (pas seulement la
.I matière ,
mais également l'énergie par exemple).
.FOOTNOTE1
Le mot
.I matérialisme
est polysémique.
En plus du sens utilisé ici, le matérialisme est une philosophie (obsolète) qui pensait que tout était composé de matière.
De même, le mot est également un qualificatif (souvent péjoratif) pour désigner des personnes cherchant avant tout des satisfactions matérielles, du plaisir, au lieu de nourrir leur esprit.
.FOOTNOTE2

.QUESTION "La science est descriptive."
La recherche scientifique est dédiée à mieux comprendre le monde qui nous entoure.
Elle ne dicte pas la conduite des individus, entreprises, médias, organisations ou gouvernements.
La distinction entre la recherche et ce qui en est fait est importante : la science est
.UL seulement
l'acquisition de la connaissance.

.QUESTION "L'art du doute raisonnable."
La science doute de toute affirmation péremptoire, ainsi le doute est un outil utile pour poser de meilleures questions.
En revanche, lorsque plusieurs études avec des méthodes indépendantes sont concordantes, c'est-à-dire qui partagent la même conclusion, le doute peut cesser d'être raisonnable.
Un exemple de doute ayant cessé d'être raisonnable concerne la théorie de l'évolution,
.[
origin of species
.]
qui regroupe l'évolution des espèces (fait observable) et les mécanismes de sélection naturelle.
Cette théorie, au départ très imparfaite mais ayant comme fondation des concepts solides, a été raffinée au fil du temps.
De nos jours, de très nombreuses méthodes indépendantes ont convergé vers les mêmes résultats (via la datation des fossiles, l'anatomie comparée des espèces, la biogéographie, l'épigénétique, etc.), rendant cette théorie la plus solidement vérifiée de toute l'histoire de la science.

Être raisonnable, c'est également ne pas accepter n'importe quelle hypothèse remettant en question tout ce que la science a acquis comme connaissance.
Une hypothèse rejetant tous les résultats d'un domaine d'étude nécessite de très solides arguments et une explication pour les résultats obtenus précédemment.
De plus, une hypothèse doit être une explication, non un appel à un plus grand mystère.
Ainsi, justifier la création des pyramides d'Égypte par la venue d'extra-terrestres n'est pas une proposition sérieuse (et par ailleurs non réfutable).

.QUESTION "La science s'accomode de résultats imparfaits."
La science rejette les affirmations sans justification ou qui n'ont pas de sens, et tente au mieux de rejeter toute affirmation fausse.
Mais toute proposition ne peut pas être jugée aussi facilement, parfois un raisonnement plus nuancé est nécessaire.
La véracité d'une affirmation peut être jaugée, via des métriques, parfois imparfaites ou peu précises, mais objectives.
De même, une théorie incomplète, menant à des calculs approximatifs et ayant des défauts, peut être acceptée.
Un exemple de cela est le modèle héliocentrique de Copernic, suivi de la théorie de la gravitation universelle de Newton, suivi de la théorie de la relativité générale d'Einstein.
Même imparfaites, ces théories apportent chacune une meilleure explication (ou des calculs plus précis) au mouvement des planètes dans le système solaire que leurs prédécesseurs.
Cet exemple montre également que la science se corrige elle-même.

.EXPLANATION1
La science est le raffinement de méthodes et la recherche systématique d'erreurs pour s'approcher de la vérité au mieux de nos capacités.
.EXPLANATION2

.QUESTION "La science n'est pas une opinion."
La conclusion d'un papier est le résultat d'un processus d'évaluation de tous les paramètres d'un problème donné, par plusieurs experts du sujet, en fournissant tous les éléments de la réflexion.
Par ailleurs, la conclusion d'une étude peut être qu'il n'est pas possible de statuer.
La science est ce processus, imparfait, mais qui s'est montré et continue de se montrer fiable, jour après jour, pour créer de la
.B connaissance .
Réduire tout ce travail à une affaire d'opinions n'est pas une représentation honnête.

.QUESTION "Un chercheur, un domaine."
Un chercheur a un domaine, par exemple l'informatique, et une spécialité, comme les protocoles de communication sécurisés sur des réseaux contraints (oui, une spécialité est souvent
.UL très
spécifique).
Chaque domaine a son jargon mais surtout des compétences bien distinctes des autres, un physicien n'est pas en mesure de se prononcer sur un problème de médecine.
C'est également le cas au sein des spécialités, chacune a un corpus scientifique bien précis, très différent des autres : les chercheurs ne sont pas interchangeables.

La complexité des études varie d'un domaine, voire d'une spécialité, à l'autre.
Une étude comparant la vitesse d'exécution de deux outils informatiques (comme 2 algorithmes pour un traitement quelconque) est
.UL compréhensible \*[*]
.FOOTNOTE1
Un papier peut être
.I compris
par un chercheur d'une autre spécialité, mais cela ne veut pas dire qu'il peut être pleinement
.I jugé
par celui-ci.
.FOOTNOTE2
même pour des personnes qui ne sont pas du domaine.
En revanche, une étude en biologie portant sur le traitement d'une maladie est hors de porté des non-initiés à la biologie, voire des non experts selon le jargon médical employé.

Certaines erreurs de raisonnement peuvent être repérées indépendamment du domaine, si elles sont suffisamment grossières.
Ainsi, un mauvais usage d'un outil mathématique, une corrélation annoncée comme causalité ou encore une conclusion qui ne correspond pas aux résultats de l'étude pourraient, dans certains cas, être des erreurs détectées par des chercheurs venant d'autres domaines.

Bien entendu, les chercheurs peuvent partager certains outils.
Ainsi, une bonne partie des chercheurs sait manipuler des statistiques\*[*], faire des graphiques, faire preuve de pédagogie (pour décrire un contexte, un problème et sa solution, une expérimentation), gérer une bibliographie, avoir un certain esprit de synthèse, etc.
.FOOTNOTE1
Les chercheurs savent manipuler des statistiques
.UL "dans leur spécialité" ,
voir le paradoxe de Simpson.
.FOOTNOTE2

.QUESTION "La recherche se fait entre chercheurs."
Un chercheur ne peut s'exprimer sur la qualité d'un papier dans un autre domaine.
À partir de cela, il est évident que les papiers sont destinés à être lu et compris par d'autres chercheurs, et du même domaine.
Les papiers publiés ne sont donc pas destinés au grand public, qui devra se contenter d'autres sources de connaissance (livres, informations en ligne…).

.QUESTION "Chercheur \(!= génie, découverte \(!= miracle."
Les chercheurs sont des personnes qui avaient un bon niveau en classe ; ils sont sélectionnés (en partie) sur ce critère.
Leur travail consiste en une très longue série d'exercices.
Personne ne qualifierait de miraculeux le fait qu'un élève, connu pour être bon en classe, réussisse un exercice.
La complexité du travail vient, bien souvent, de la somme de connaissances à acquérir pour s'y attaquer.
Le travail derrière un papier se résume parfois à quelques jours de réflexion et de tests suivis de plusieurs semaines de rédaction\*[*].
.FOOTNOTE1
Note de l'auteur.
Un de mes papiers a consisté en quelques jours de réflexion, 40
.B minutes
de développement informatique, quelques jours de tests, suivi de plusieurs
.B mois
de rédaction (j'étais très inexpérimenté).
.FOOTNOTE2
Certaines personnes ont un niveau excellent, c'est-à-dire un raisonnement à la fois rapide et juste, mais cela est plutôt rare même dans la communauté des chercheurs.

.QUESTION "La science n'a pas de frontières."
Seules de rares connaissances ou possessions (comme des virus) sont limitées pour des raisons de sécurité ou de stratégie économique ou militaire.
À part sur ces quelques sujets précis, la science est internationale.
Les papiers sont publiés dans des revues accessibles à tout le monde, quand ils ne sont pas directement en accès ouvert (gratuit).

Par ailleurs, un laboratoire est souvent composé de chercheurs venant de nombreux pays, de tous les continents\*[*].
.FOOTNOTE1
Note de l'auteur.
Dans mon équipe et en comptant seulement les doctorants : Algérie, Argentine, Brésil, France, Grèce, Maroc, Roumanie, Tunisie, Vietnam.
Nous venions presque tous d'un pays différent.
.FOOTNOTE2

.QUESTION "Un chercheur n'est pas la science."
Aucun chercheur ne fait autorité dans tout un domaine de recherche.
Un chercheur a une spécialité dont il connait le corpus, et sur ce sujet il doit pouvoir différencier un bon article d'une fraude.
Dans sa spécialité, a priori, le chercheur a un avis pertinent ; sa voix est légitime.
En revanche, même dans sa spécialité, la parole d'un chercheur n'est pas au-dessus de toute critique et il peut lui-même avoir un avis qui ne fait pas consensus.
Les arguments priment sur le statut, même pour un directeur de recherche dans un laboratoire prestigieux.

.QUESTION "Limites de la recherche"
Les limites théoriques à la science forment un domaine de recherche en soi, nommé
.I épistémologie .
Bien que ce domaine ait son intérêt, il n'offre pas une représentation correcte de ce qu'est la science en pratique pour la quasi-totalité des domaines de recherche et des chercheurs.
Pour faire simple, une règle générale : la science se positionne sur ce qui peut être testé.
Cette affirmation est simpliste mais valide dans la plupart des cas et donne un bon point de départ.

En pratique, un chercheur est lié à un domaine scientifique, et se focalise sur une spécialité.
Un domaine de travail a déjà des méthodologies de recherche en place et utilisées par tout le monde (double-aveugle, hypothético-déductive, etc.), voire un mélange de plusieurs méthodes.
Tout chercheur ne va pas défier les limites méthodologiques à chaque papier, c'est même extrêmement rare.

Les ressources matérielles (argent, matériaux, outils…), les ressources humaines et le temps sont de vraies limites à la recherche.
Même en ayant de solides connaissances théoriques, une équipe de recherche de 4 personnes sans financement ne peut imaginer coloniser Mars en un mois.

Cette section a présenté des méthodes scientifiques et diverses informations pour caractériser la science (sa chronologie, le vocabulaire académique, la nécessité du doute et de la nuance, etc.) ainsi que les limites à la science.
Rien de ce qui a été dit n'est une vérité absolue et intemporelle.
Par exemple, le principe de réfutabilité, bien que déjà plus ou moins appliqué depuis longtemps, n'a été théorisé qu'au
.IEME 20 e
siècle et ne fait pas l'unanimité.
Malgré cela, les informations données forment une explication intuitive et suffisante pour l'objectif initial du document.
La section suivante présente la matérialisation de toute étude, à savoir le papier scientifique.
.SECTION Écriture de papiers
En pratique, la science se matérialise par l'écriture de papiers de recherche, représentant la transmission du savoir.
Comprendre comment les spécialistes écrivent pour éviter divers biais permet de faire contraste avec les autres documents, comme les articles de journaux ou de blog, et ainsi de mieux cibler leurs faiblesses.
Cette section introduit l'art de l'écriture de papiers, ainsi que des critères pour juger de leur qualité.
De même, différents types de papiers sont présentés, chacun ayant un objectif, une utilité particulière dans le corpus scientifique.

Un papier établit un contexte dans lequel la recherche se fait (introduction au sujet de l'étude), décrit la problématique, dresse un état de l'art (en mentionnant les travaux annexes qui répondent à la même problématique), explique la solution étudiée ainsi que l'expérimentation, interprète les résultats et en tire des conclusions, et enfin, présente de futurs travaux possibles sur le sujet.
L'écriture est la plus rigoureuse possible, autant sur le fond que sur la forme.

.QUESTION "Sur la forme."
Un papier doit suivre autant que possible les quelques consignes suivantes\*[*].
.FOOTNOTE1
Ces consignes forment un guide qui tend à uniformiser les papiers, rendant la lecture et l'écriture plus faciles.
Par conséquent, l'analyse elle-même est simplifiée.
.FOOTNOTE2

Le style du papier doit favoriser une bonne transmission de l'information, le document doit être sobre\*[*].
.FOOTNOTE1
Le présent document se réserve le droit à un style légèrement plus libre, par simple préférence personnelle de l'auteur.
Ainsi, le document comporte de la couleur dans le texte et un style différent pour les extraits (texte coloré, barre verticale).
.FOOTNOTE2
Le papier est constitué de phrases simples et qui se suivent pour former une idée par paragraphe.
Peu d'éléments de style sont utilisés (italique, graisse, soulignement) et avec parcimonie.
Les listes à puces sont, dans la mesure du raisonnable, évitées ; lister des éléments se fait dans le texte autant que possible.

Un papier de recherche n'est pas un roman.
Un chercheur lit des dizaines de papiers par an, il faut lui faciliter la lecture.
Un papier est écrit au présent, sans formulation alambiquée et le langage utilisé est simple et concis.
De même, l'usage de vocabulaire complexe ou inhabituel doit être évité.
La répétition de certains termes (en lieu et place d'adjectifs ou d'acronymes) peut être envisagée pour aider à la compréhension.

Un papier n'est pas une tribune pour étaler sa culture personnelle ou se valoriser au-delà du travail effectué.
Par conséquent, les références littéraires sont à proscrire.
De même, l'utilisation du « je » doit, dans la mesure du possible, se limiter à la partie expérimentation.
Dans un papier, l'expression doit être
.B neutre .

Un papier doit être prudent, toute affirmation doit être justifiée.
Le sensationnalisme en science est très mal perçu, aucune affirmation excessive n'est tolérée.

Un papier comporte généralement les sections suivantes\*[*].
.FOOTNOTE1
Il n'est pas nécessaire d'avoir strictement toutes ces sections, toutes les études ne sont pas adaptées à ce format, mais cela forme un guide.
Bien d'autres sections sont ajoutées pour approfondir le sujet de l'étude, d'autres sont retirées si besoin, mais l'idée générale est préservée.
.FOOTNOTE2
Un abstract pour décrire le contenu du document en quelques lignes et donner envie de lire l'étude.
Une introduction pour décrire brièvement le contexte et présenter les futures sections.
Une section pour approfondir ce contexte et présenter en détail la problématique.
Une ou plusieurs sections pour l'état de l'art, qui décrit les solutions actuelles pour résoudre le problème en question.
Une ou plusieurs sections pour introduire la solution envisagée.
Une section pour décrire l'expérimentation, c'est-à-dire toute information nécessaire pour sa potentielle reproduction (paramètres initiaux, déroulement, outils utilisés, etc.).
Une section pour présenter les résultats ainsi que leur interprétation.
Le papier peut également inclure une section pour les travaux futurs en rapport avec ce qui a été publié, des pistes à creuser.
Ensuite, une section pour conclure l'étude menée, rappelant le sujet et mettant en avant les résultats.
Et enfin, les références utilisées pour l'étude, c'est-à-dire les papiers, livres et autres documents qui ont été mentionnés.
Un papier peut également posséder une ou plusieurs annexes, pour alléger le cœur du papier et se concentrer sur l'essentiel.
Par exemple, les données brutes d'une expérimentation peuvent faire l'objet d'une annexe, de même qu'une démonstration mathématique.

.QUESTIONS "Les auteurs et leur implication."
Un papier doit mentionner les auteurs, dans l'ordre d'implication dans le travail.
Le premier auteur est la personne la plus importante, celle ayant travaillée le plus sur le contenu (sur le fond et la forme).
Les autres auteurs peuvent avoir une implication soit identique, soit moindre.
Certains des auteurs peuvent avoir contribué via des conseils, ou avoir donné une direction au projet, ou même avoir sorti l'auteur principal d'une impasse dans ses travaux.
Bien souvent, les
.I seconds
auteurs ont relu le document et donné des correctifs voire des pistes d'améliorations, parfois à de multiples et longues reprises\*[*].
.FOOTNOTE1
Pardon, Pierre. Et merci.
.FOOTNOTE2
Enfin, le dernier auteur passe généralement moins de temps sur le travail, il ne s'occupe pas des détails.
Le dernier auteur est souvent bien plus expérimenté, est habilité à diriger des recherches et a proposé cette étude.
Il fournit des pistes de réflexion, vérifie le bon déroulement, prend éventuellement contact avec d'autres chercheurs pour des collaborations ou des relectures du travail en interne au sein de l'équipe, etc.

Chaque schéma, tableau ou équation doit être introduit et expliqué.
Chaque résultat doit être introduit, interprété, expliqué.
Aucun schéma, tableau ou donnée ne doit être présenté sans justification.
De même, les résultats doivent être précis et rigoureux.
Par exemple, d'une manière générale, une moyenne sur des mesures avec très peu d'occurrences et sans écart type n'a pas une grande valeur (trop de biais possibles).

Un papier est aussi concis que possible pour transmettre l'information.
Seules les informations nécessaires, en rapport avec le sujet et pertinentes, doivent se retrouver dans le document final.
Le nombre de pages d'une publication varie selon le domaine voire la spécialité, l'objectif de la publication (journal ou conférence) et le journal voire la publication elle-même.
Pour une publication nationale, dont l'objectif serait de faire rencontrer des doctorants entre eux (conférences ou présentation de posters), une publication très courte peut être acceptée (2 à 4 pages) et n'aurait même pas besoin d'être écrite en anglais.
Pour une publication internationale, avec comme objectif une réelle contribution scientifique (publication dans un journal ou une conférence), les publications vont de quelques pages jusqu'à plusieurs dizaines (ce qui est rare).
En informatique par exemple, le nombre de pages est généralement autour de 6 à 15, double colonne (comme dans ce document).

.QUESTION "Sur le fond."
Une introduction doit présenter le contexte et la problématique.
L'état de l'art doit présenter les méthodes actuelles pour résoudre le problème (si cela s'applique au sujet).
La solution doit ensuite être présentée, en indiquant le résultat attendu.
Puis, une expérimentation doit être conduite, en décrivant dans le détail ce qui est fait.
Ensuite, les résultats et leur interprétation doivent être présentés.
Enfin, une conclusion doit être apportée, en rappelant la problématique, la solution envisagée et le résultat.
La conclusion doit prendre un peu de hauteur sur le sujet, un papier n'est pas un simple rapport technique.
L'annexe \n[N_APPENDIX_ECRITURE_PAPIER] présente des exemples (fortement abrégés) de sections d'un papier fictif, pour mieux comprendre le travail d'écriture à faire.

.QUESTION "Un papier, une idée."
Chaque papier doit présenter une seule idée\*[*].
.FOOTNOTE1
Ou au moins un ensemble cohérent d'idées qui ne peuvent être présentées séparément, si cela est correctement justifié.
.FOOTNOTE2
Si l'auteur souhaite présenter plusieurs solutions à un même problème, alors il serait préférable (voire nécessaire) de publier plusieurs papiers.

.QUESTION "Tous les papiers ne sont pas égaux."
Certains papiers sont de bonne qualité, d'autres de moins bonne qualité, d'autres ne valent rien.
Cela dépend de nombreux paramètres.
Le respect de ce dont il est question dans cette section est l'un des critères.
De plus, un papier peut représenter une avancée considérable dans le domaine ou n'apporter qu'une contribution modeste.
Au-delà de la qualité intrinsèque du papier, le taux d'acceptation du journal dans lequel il est publié est important pour sa visibilité (voir section « journaux scientifiques »).

.QUESTION "Tous les papiers n'ont pas le même objectif."
La plupart des papiers apportent une contribution dans un domaine, une nouvelle connaissance.
D'autres papiers
.I survey ) (
font l'inventaire des différentes contributions d'un domaine, et les catégorisent pour les rendre plus accessibles (leur donner de la visibilité).
Le survey est important comme entrée en matière pour de jeunes chercheurs puisqu'il référence les papiers les plus importants du domaine.
Un autre type de papiers est la méta-analyse, c'est-à-dire une
.I "étude des études"
sur un sujet précis.
La méta-analyse apporte une position sur un sujet suivant
.I "état actuel" "" l'
du corpus scientifique sur le sujet traité.
Enfin, d'autres papiers sont davantage des rapports techniques pour décrire l'ingénierie derrière une infrastructure ou des outils.
Ces derniers n'apportent pas une contribution très intéressante d'un point de vue scientifique, mais peuvent être utiles en pratique pour les chercheurs et ingénieurs de recherche.

Cette section a présenté la forme et le contenu attendu d'un papier scientifique.
La rigueur d'écriture est nécessaire pour la bonne transmission du savoir ; la forme aide à rendre plus intelligible et à donner confiance au fond.
L'annexe \n[N_APPENDIX_ECRITURE_PAPIER] apporte un complément à cette section, montrant un papier en cours d'écriture mettant en œuvre la plupart des règles dictées précédemment.
Comprendre la nécessité d'une telle rigueur permet de mettre en lumière certaines techniques de manipulation, présentées par la suite.
.SECTION Publications scientifiques
Chaque papier est publié dans un journal à comité de lecture
.I "peer review" ). (
Cette section regroupe quelques informations sur ces journaux pour mieux situer leur rôle dans la science (objectifs, fonctionnement).
De même, des moyens de rechercher et d'accéder à des articles sont présentés.

.QUESTION "Qu'est-ce qu'un journal scientifique ?"
Un journal scientifique est un journal qui publie des papiers scientifiques.
Ces papiers sont envoyés au journal, et s'ensuit une revue par des pairs tel que décrit au chapitre précédent, puis le papier est (éventuellement) publié dans le journal.
Chaque journal a un domaine, voire une spécialité de prédilection, par exemple
.I "Ad Hoc Networks"
est un journal spécialisé dans les réseaux de capteurs (de petits ordinateurs qui vérifient des métriques comme la température ambiante, le taux de luminosité, etc.).
Un journal peut publier des papiers de conférences, c'est-à-dire qu'une série de conférences est organisée pour présenter ces travaux.
Un journal a également un
.I "Impact Factor" ,
c'est-à-dire un taux de visibilité pour les papiers publiés, qui se mesure par le taux de citations.
.
.de WRITE_URL_PAREN
\f[CW](\s-2\\$*\s+2)\f[]
..
.de WRITE_URL
\f[CW]\s-2\\$*\s+2\f[]
..

.ds CITESEERX Citeseer\u\s-3x\s+3\d

.QUESTION "La visibilité d'un journal."
La visibilité d'un journal se calcule simplement de la manière suivante :
.EQ
size 8 { roman "Visibilité d'un journal" = roman "nb citations" over roman "nb publications" }
.EN
Scopus\*[*]
.FOOTNOTE1
Scopus \h'1'\(em\h'1'
.WRITE_URL www.scopus.com
.FOOTNOTE2
est une base de données qui référence les documents (livres, articles scientifiques, etc.) permettant de faire ce calcul.
Google Scholar\*[*]
.FOOTNOTE1
Google Scholar \h'1'\(em\h'1'
.WRITE_URL scholar.google.com
.FOOTNOTE2
et \*[CITESEERX]\*[*]
.FOOTNOTE1
\*[CITESEERX] \h'1'\(em\h'1'
.WRITE_URL citeseerx.ist.psu.edu
.FOOTNOTE2
sont d'autres bases de données bibliographiques, accessibles gratuitement, permettant de faire des recherches.

.QUESTION "Où trouver ces journaux ?"
Énormément de journaux sont publiés par de grands groupes éditoriaux comme Elsevier ou Springer.
Leurs sites web respectifs recensent leurs journaux, et affichent certaines de leurs caractéristiques (objectifs, visibilité, taux d'acceptation, prochaine date de publication, etc.).
Des dizaines de milliers de journaux existent ; un moteur de recherche peut aider à trouver des journaux au-delà des plus gros éditeurs.

.QUESTION "Le taux d'acceptation des journaux."
Un journal à fort taux d'acceptation est peu intéressant, car le journal accepte des papiers de faible qualité, des contributions peut-être (très) modestes.
Un journal à faible taux d'acceptation privilégie la qualité à la quantité, il est donc plus prestigieux et apporte une meilleure visibilité aux papiers publiés.

.QUESTION "Attention aux arnaques."
Certains journaux sont qualifiés de
.I "revues prédatrices"
car ils n'ont pas de comité de lecture.
Leurs publications ne valent rien, l'intérêt de la publication scientifique résidant en grande partie dans la relecture par les pairs.
Sans cette relecture, le papier peut comporter de nombreux biais évidents, la confiance du lecteur en est sérieusement entachée.
Les scientifiques sérieux publient
.UL exclusivement
dans des revues à comité de lecture, de préférence avec un taux de sélection (très) faible.

Toujours dans le domaine de l'arnaque, un papier en « preprint » n'a pas encore été accepté.
Aucune confiance ne peut lui être accordée à ce stade, le document n'ayant fait l'objet d'aucune relecture par du personnel compétent.

.QUESTION "Conférences."
Un journal peut accepter des papiers de conférences, c'est-à-dire que la publication du journal est suivie par une série de conférences.
Chaque auteur vient présenter ses travaux aux autres auteurs, avec une courte conférence, habituellement de 20 minutes environ, suivie de quelques minutes de questions.
Ces conférences sont fréquentes dans le milieu de la recherche, et permettent (en théorie) de rencontrer d'autres chercheurs travaillant sur des sujets connexes.

.QUESTION "Qu'apporte un journal aux auteurs ?"
En théorie, une aide à la mise en page des papiers, mais cela semble plutôt faux de nos jours : les éditeurs ont des modèles LaTeX (un outil pour créer les fichiers numériques des papiers).
De fait, toute personne souhaitant publier un article n'a besoin que d'appliquer le modèle de l'éditeur, et le document est plus ou moins de facto
.I "camera ready" ,
c'est-à-dire bon pour impression.

Un journal peut apporter une aide pour la visualisation des données ou l'illustration du document (créer de plus beaux schémas).
De même, d'après le site d'Elsevier, la faible qualité de la langue est la principale source de rejet des documents (erreurs grammaticales, syntaxiques, orthographiques, etc.).
Pour éviter cela, l'éditeur propose une relecture pour corriger les fautes d'anglais.

.QUESTION "Où trouver des papiers ?"
Les journaux, voire les articles individuels, peuvent s'acheter sur les sites des éditeurs.
Certaines publications sont en accès libre
.I "Open Access" ) (
et sont disponibles gratuitement (parfois après une inscription) sur le site de l'éditeur.
Sci-hub est une excellente base de données gratuite d'articles\*[*] (l'URL change régulièrement).
.FOOTNOTE1
Même illégale, sci-hub est une base de données parfaitement légitime.
L'accès au savoir ne devrait pas être entravé par l'avarice des éditeurs.
Pour rappel, les chercheurs sont payés avec nos impôts, leur travail a déjà été rémunéré, et l'éditeur ne fournit quasi aucun travail.
.FOOTNOTE2
HAL\*[*]
.FOOTNOTE1
HAL \h'1'\(em\h'1'
.WRITE_URL hal.archives-ouvertes.fr
.FOOTNOTE2
est un site pour accéder gratuitement à des articles scientifiques (publiés ou non) et des thèses.
Les thèses françaises\*[*]
.FOOTNOTE1
Thèses françaises \h'1'\(em\h'1'
.WRITE_URL theses.fr
.FOOTNOTE2
sont également publiées et accessibles gratuitement.
Enfin, les bases de données bibliographiques présentées précédemment (Scopus, Google Scholar et \*[CITESEERX]) sont d'une grande aide pour rechercher des articles en rapport avec un sujet, des mots clés ou par auteur.

À noter que l'auteur conserve le droit de fournir ses documents, donc lui demander son œuvre (avec un simple mail) est tout à fait possible.

.QUESTION "Le juteux marché de l'édition scientifique."
Comme dit précédemment, un journal ne fournit pas un immense travail, son rôle est très limité.
La publication et l'accès aux documents sont payants.
Les universités payent également des sommes conséquentes pour un accès illimité au contenu… produit par leurs propres chercheurs.
La relecture scientifique est gratuite et est faite par des chercheurs, payés par leur université ou laboratoire (via un financement public ou privé) et non par le journal.
De même, ce sont les chercheurs qui organisent les conférences, mais c'est le journal qui en retire des bénéfices.
Ceci représente une spoliation du travail des chercheurs par les journaux, en toute légalité.

Cette section a présenté les journaux scientifiques (objectifs, fonctionnement, qualité), les éditeurs de ces journaux, les conférences organisées entre chercheurs et comment trouver des articles (gratuitement ou non).
Certaines fraudes ont été présentées, comme les revues prédatrices, les documents en « preprint » ou encore l'abus (légal) des journaux envers le travail des chercheurs.
La section suivante présente des informations générales autour de la recherche, qui étaient superflues dans les sections précédentes mais qui apportent une meilleure compréhension du métier de chercheur.
.SECTION Informations générales
Cette section regroupe des informations autour du métier de chercheur, donnant une image concrète du travail effectué par les chercheurs au quotidien.
Le financement de la recherche et une métrique d'évaluation des chercheurs sont également discutés.

.QUESTION "Comment est financée la recherche ?"
Les chercheurs sont payés soit par des universités (public), soit par des laboratoires (ou entreprises) privés.
Les entreprises peuvent avoir des subventions pour embaucher des chercheurs ou mener des études.
Dans le public, les universités sont attachées à des laboratoires.

.QUESTION "En pratique, que fait un chercheur ?"
Une grande partie du temps consacré à la recherche se passe à lire des papiers de sa spécialité ; le chercheur fait de la veille sur son domaine.
De plus, en France, le contrat universitaire classique
.I "maître de conférences"
inclut de l'enseignement, et les universités étant en sous effectif, le personnel fait énormément d'heures.
La veille et l'enseignement représentent ainsi la plus grande partie du temps de travail du chercheur.

Concernant l'aspect recherche, la partie la plus importante est de lire, écrire, et réfléchir à un problème : cela engendre un nombre d'heures conséquent à lire des papiers et des livres (et parfois d'autres sources).
Un sujet d'étude peut amener à créer des simulations, des modèles, des schémas ou des graphes pour se représenter une donnée, donc à maîtriser quelques outils informatiques.
Tout ceci nécessite de passer beaucoup de temps seul, souvent devant un ordinateur, dans un bureau.
Un
.I laboratoire
n'a pas à inclure des généticiens fous qui s'amusent avec des produits dangereux ; l'environnement de travail du chercheur est souvent un simple bureau.

Une autre partie du travail de recherche consiste à présenter ses travaux aux quatre coins du monde.
Les chercheurs voyagent régulièrement pour faire une présentation de 20 minutes face à des gens qui, parfois, sont passionnés et écoutent attentivement, soit qui veulent se faire un réseau de connaissances et visiter la ville d'accueil\*[*].
.FOOTNOTE1
De l'expérience de l'auteur, les conférences en informatique n'intéressent pas vraiment les participants, qui semblent là par défaut, et s'échappent souvent pour boire en ville.
.FOOTNOTE2

Certains domaines impliquent, au moins le temps d'une étude, un train de vie assez différent.
Une étude peut amener le chercheur à partir à l'autre bout du monde pour mettre des sondes sur des animaux et tracer leurs déplacements, étudier leur comportement, etc.
Certaines études nécessitent de faire de la plongée sous marine, passer 6 mois en Antarctique, ou travailler avec des outils particulièrement coûteux\*[*].
.FOOTNOTE1
Certains outils de mesure ont un financement à 7 chiffres.
Et tout un bâtiment est construit autour pour les protéger des interférences et améliorer leur précision.
.FOOTNOTE2
Le cadre d'une journée de travail peut changer radicalement d'un domaine à l'autre.

En dehors du cœur de son métier, un enseignant-chercheur a régulièrement des charges administratives à gérer.
Par exemple, la gestion d'une filière proposée à l'université, ou une promotion d'étudiants.

.QUESTION "Le doctorat."
Étape obligatoire pour devenir chercheur, le doctorat est une période après un master où l'étudiant acquiert de l'expérience dans la recherche.
Cette période est de quelques années, entre 3 et 5 dans la plupart des cas.
Certains domaines ont des doctorats plus longs, qui peuvent s'étaler sur dix ans (et ne pas être rémunérés).

Durant cette période, l'étudiant fait en pratique un travail de recherche.
Il s'informe sur les articles autour de son sujet (via des
.I surveys ,
livres, papiers, blogs, etc.) puis trouve des problématiques auxquelles s'attaquer.
Le doctorant publie des articles, participe à des conférences et peut même faire des relectures pour des journaux.

Le doctorant est supervisé par un directeur de thèse, et parfois un encadrant pour l'aider au quotidien.
Le travail à effectuer est parfois éloigné de ce qui est vu durant le cursus de master, et une aide pour démarrer est la bienvenue.

.QUESTION "Le post-doc."
Après le doctorat, le jeune chercheur est désormais à l'aise dans son travail, une habitude s'est installée.
Avant de postuler à un poste stable d'enseignant-chercheur, il est encouragé à faire un
.I post-doc ,
une période de recherche souvent à l'étranger qui dure entre un et cinq ans.

En revenant en France pour trouver un poste dans une des universités, le chercheur a des années de recherche derrière lui.
Mais la compétition est tout de même rude\*[*].
.FOOTNOTE1
Note de l'auteur.
Le CNRS a des méthodes de recrutement qui frôlent l'absurde.
Une conférence a été donnée à mon université pour expliquer comment y rentrer.
Il y était dit qu'un chercheur n'était jamais pris à son premier essai, qu'il devait prendre contact avec l'équipe pour montrer sa motivation, avoir énormément de publications, etc.
.br
À quel moment les exigences vont trop loin ?
.FOOTNOTE2

.QUESTION "Difficultés du métier de chercheur."
Faire de la recherche n'est pas nécessairement compliqué, mais cela prend du temps (veille et enseignement).
Une étude peut également prendre du temps, parfois des dizaines d'années.
Il n'est pas rare par exemple dans le domaine de la physique d'avoir des publications à titre posthume pour une partie des auteurs.

Autre difficulté, trouver la bonne représentation d'une donnée.
Présenter correctement une donnée, rendre une information évidente, est une tâche parfois complexe.

De même, faire un bon schéma peut être laborieux.
Le lecteur doit comprendre rapidement ce qui est représenté, avec un code couleur et une légende clairs, et le schéma doit être agréable à regarder.

La recherche n'est pas nécessairement complexe et théorique.
Chaque spécialité a son corpus, parfois très dense, et la difficulté peut venir de la quantité d'informations à assimiler pour comprendre tous les aspects du sujet traité.
Dans bien des études, seuls quelques outils statistiques de niveau lycée sont nécessaires.

.QUESTION "Le h-index, mesure de la productivité d'un chercheur."
Au même titre que les journaux sont jugés sur leur visibilité, la portée des travaux d'un chercheur se mesure via une métrique nommée
.I h-index " »" "« "
qui se base sur les nombres de publications et de citations d'un chercheur.
Cette métrique est expliquée graphiquement avec un exemple en annexe \n[N_APPENDIX_HINDEX].

Le
.I h-index
est une métrique qui force le chercheur à produire de bons papiers dans la durée.
La métrique n'encense pas les chercheurs ayant énormément de publications mais peu de citations, ni les chercheurs ayant énormément de citations mais sur très peu de papiers.
Bien entendu, cette métrique est loin d'être parfaite mais supprime les biais les plus évidents.

Cette section a montré le métier de chercheur dans son quotidien, et ses préoccupations premières.
La prochaine section sort du cadre de la recherche pour étudier la confiance à accorder aux informations obtenues dans la vie de tous les jours (notamment dans les médias).
.SECTION Science au-delà de la recherche
S'informer sur le monde qui nous entoure passe par divers moyens.
La recherche scientifique n'en est pas vraiment un, c'est un outil utilisé par des intermédiaires qui, eux, diffusent des informations (pas seulement de la connaissance).
Ces intermédiaires sont, entre autres, le journalisme, les livres et les réseaux sociaux (autrement dit le bouche-à-oreille).
Cette section introduit quelques pistes de réflexion, sans prétentions, sur la qualité de ces intermédiaires, et en particulier du journalisme qui constitue la principale source de diffusion de l'information.
Dans la suite, le journalisme est discuté dans son ensemble sous l'expression
.I "médias"
pour désigner tous les formats dans lesquels les journalistes s'expriment : journaux télévisuels et papiers (grande enquête ou simple pige), site internet, radio, ou encore des vidéos en ligne.

.QUESTION "La vérité est grise."
La recherche est complexe à lire, écrire et penser, parce que le monde qui nous entoure n'a rien d'évident ou de simple.
Le
.I "bon sens"
est régulièrement mis à mal en science.
Lorsque l'on s'éloigne de la recherche, ce n'est pas pour se rapprocher de sujets plus simples, seulement
.B "moins bien traités" .
Le journalisme s'exprimant dans des médias est un parfait exemple.

.QUESTION "Science vs médias."
La suite illustre les différences entre la science (plus particulièrement la recherche) et les médias (le journalisme).

La science produit de la connaissance.
Les médias ont tout un catalogue d'objectifs potentiels : produire du divertissement, relater des faits, donner des opinions, être une tribune pour une personne, une cause, une prospection commerciale, une communication gouvernementale, et caetera.

Chaque étude en science est sur un sujet précis et bien présenté, contextualisé, en indiquant la méthode de résolution du problème qui a été choisie et pourquoi, en indiquant le résultat suivi d'une explication détaillée et argumentée, et de manière uniformisée avec tous les autres sujets traités.
La science utilise les raisonnements les plus fiables possibles pour arriver à des conclusions, quitte à admettre ne pas savoir, par honnêteté intellectuelle.
Côté médias, tous les formats imaginables existent, toutes les qualités également.
Les études approfondies, pour expliquer tous les tenants et aboutissants d'un sujet, sont très minoritaires.
Dans le journalisme, la norme n'est pas l'étude sérieuse mais le commentaire.

En science, seuls les experts s'expriment.
Dans les médias, rares sont les experts, la plupart des journalistes ne sont pas experts des sujets qu'ils abordent, ils peuvent même ne pas être initiés au domaine\*[*].
.FOOTNOTE1
Le journaliste ne travaille que très rarement sur un seul sujet, et ne peut être expert en tout (mais peut n'avoir aucune expertise).
.FOOTNOTE2

Les papiers scientifiques sont pour un public restreint.
Les médias sont destinés à un large public.

La science se protège de très nombreux biais en forçant les papiers à être relus par plusieurs experts\*[*], de laboratoires indépendants.
.FOOTNOTE1
Cette méthodologie n'est pas parfaite pour autant.
Certains domaines sont plus susceptibles d'être corrompus que d'autres.
Mais cela est un sujet pour un autre document.
.FOOTNOTE2
Le papier n'est publié qu'à la condition d'apporter une vraie contribution (même modeste) et de bonne qualité.
Dans un média, presque toute information peut paraître, le seul garde fou est la hiérarchie directe.

La science travaille sur un temps long, chaque étude peut prendre quelques semaines, mois voire années pour être publiée.
Dans un média, les contraintes de temps ne sont pas les mêmes.
Certains journaux sont quotidiens et nécessitent de traiter un sujet en seulement quelques heures.
Parfois un journaliste est en direct pour traiter un sujet, et ne fournit aucun recul sur les événements relatés.

.nr table_size_offset 2
.vs -\n[table_size_offset]p
.ps -\n[table_size_offset]
.br
.TS
allbox tab(:);
c | c
lw(1.6i) | lew(1.6i).
Recherche:Médias
T{
produit de la connaissance
T}:T{
relate des faits selon un prisme de lecture, diffuse des opinions
T}
T{
sujet très précis, sérieux, contextualisé et uniformisé
T}:T{
tout existe en terme de sujet et de qualité, souvent pour le pire
T}
T{
expert du sujet
T}:T{
expert, non expert, voire non initié
T}
T{
destiné à des experts, mais souvent lisible par des initiés au domaine
T}:T{
destiné à un très large public
T}
T{
relecture par des experts, publication si qualité reconnue
T}:T{
aucune relecture indépendante, simple acceptation de la hiérarchie
T}
T{
temps long (plusieurs semaines, mois voire années)
T}:T{
instantané (juste quelques heures de rédaction, parfois même en direct)
et parfois (rarement) temps long
T}
.TE
.vs +\n[table_size_offset]p
.ps +\n[table_size_offset]
.LEGEND1
Résumé des différences entre la recherche et le journalisme.
.LEGEND2

Toutes ces différences pointent vers la même conclusion : le journalisme est fondamentalement moins fiable que la science.
Comme rien n'assure la qualité, le manque de sérieux est même de notoriété publique.
Tout lecteur avisé se méfie de ce qui est écrit dans un journal, non pas nécessairement à cause de (rares) erreurs factuelles et de bonne foi, mais bel et bien à cause de l'incompétence voire des manipulations diverses des journalistes\*[*].
.[
bias bullshit lies
.]
Tout pays confondu, parmi les 40 % de personnes faisant confiance au journalisme, 39 % le font presque par dogmatisme.
Certains éditorialistes ont conscience de ce manque de confiance.
.[
se méfier des médias
.]
.FOOTNOTE1
Attention, l'article
.I "Bias Bullshit and Lies"
a, selon l'auteur de ce document, quelques limites dans son étude.
En particulier, les réponses possibles aux questions auraient pu être plus complètes.
Par exemple, une personne peut se méfier des réseaux sociaux pour la faible qualité des informations tout en étant d'accord pour dire que la diversité des opinions est correctement représentée.
.FOOTNOTE2
La sortie du livre
.I "la fabrique du consentement"
marquait déjà une méfiance envers les journalistes.
.[
Manufacturing Consent
.]

.QUESTION "Tous les sujets ne relèvent pas de la science."
Le
.I "fait divers" ,
comme un homicide par exemple, est un phénomène médiatique
.I omniprésent .
Sauf que dans le cas de l'homicide, avant la fin de l'enquête policière, impossible de replacer ce phénomène dans un contexte permettant de le comprendre ; c'est une simple occurrence qui est peut-être singulière et n'a pas à être généralisée.
Trouver les mensonges, imprudences, inexactitudes, biais ou les erreurs est souvent complexe ; un temps d'étude est nécessaire.
Avant la conclusion des enquêteurs, tout n'est que spéculation, du commentaire, pas de l'information.
Bien entendu, la science est utilisée pour mener l'enquête, mais cette enquête ne se fait pas sur un plateau de télévision, à l'antenne, dans un média.

L'actualité à ce défaut de ne pas être une simple affaire de mathématiques, de bonnes et de mauvaises réponses.
Pour s'exprimer correctement sur un sujet, il faut avoir tous les éléments en mains.
La science peut s'exprimer, parfois, même en l'absence de tous les éléments, mais cela reste un fonctionnement dégradé.
S'exprimer précipitamment sur un sujet pour des besoins d'audimat alors que les informations pourraient être accessibles prochainement, relève du manque de sérieux.
L'actualité est alors du simple divertissement.

.QUESTION "Repérer des biais n'est pas toujours possible."
L'exemple suivant montre l'\c
.UL impossibilité
de s'assurer qu'un article ne contienne de biais.

.defcolor color_ressenti      rgb 0.6 0.2 0.2
.defcolor color_interet       rgb 1 0 0
.defcolor color_prisme        rgb 0 0 1
.defcolor color_faitpartiel   rgb 0.2 0.6 0.2
.defcolor color_liens         rgb 0.2 0.2 0.6
.defcolor color_contraintes   rgb 0.9 0 0.6
.
.vs -\n[table_size_offset]p
.ps -\n[table_size_offset]
.PS
reset
down
colsize=1.3
FAITS: "faits" \
	"(parfois \m[color_faitpartiel]partiels\m[]," \
	"voire rapportés)"
AVIS: "avis d'experts" \
	"(voire un seul expert," \
	"des non experts," \
	"ou des \m[color_interet]personnes intéressées\m[])" \
	at Here + (colsize,0)
BIAIS: "biais divers" \
	"(incompétence," \
	"\m[color_prisme]prisme de lecture\m[]," \
	"\m[color_liens]intérêt personnel\m[]," \
	"\m[color_contraintes]contraintes diverses\m[]," \
	"\m[color_ressenti]ressenti\m[], etc.)" \
	at Here + (colsize,0)
.
.ps +4
"Exemple fictif de journal biaisé" at AVIS + (0, 0.7)
.ps -4
.
firsttosecondarrows = 0.1
distarrow = 0.6
sizearrow = 0.2
.
A: line -> from AVIS + (0,-distarrow) to AVIS + (0,-(distarrow + sizearrow))
line from FAITS + (0,-(distarrow - firsttosecondarrows)) \
	to FAITS + (0,-(distarrow)) \
	to BIAIS + (0,-(distarrow)) \
	to BIAIS + (0,-(distarrow - firsttosecondarrows))
line from AVIS + (0,-(distarrow - firsttosecondarrows)) \
	to AVIS + (0,-(distarrow))
.
larger = 0.2
journalism_top = distarrow + sizearrow
page_len = 0.7
line from FAITS + (-larger,-(journalism_top + page_len)) \
	to FAITS + (-larger,-(journalism_top)) \
	to BIAIS + (larger,-(journalism_top)) \
	to BIAIS + (larger,-(journalism_top + page_len)) \
	to FAITS + (-larger,-(journalism_top + page_len)) \
	thickness 1.2
.PE
.sp -5.2
.LEGEND1
Fait divers : une promeneuse
.gcolor color_ressenti
inconsciente
.gcolor black
a pris une balle perdue
.gcolor color_prisme
alors que des pancartes annoncent partout que la chasse est ouverte.
.gcolor black
Enquête auprès des experts de chasse de
.gcolor color_interet
l'association
.I "Mon fusil, mon Âme" .
.gcolor black
.LEGEND2

Le schéma précédent montre une liste simplifiée des éléments sur lesquels se basent les journalistes pour écrire un article (des faits, des avis et des biais potentiels).
Puis un titre est présenté, relatant une histoire fictive dans un journal.
L'article est volontairement exagéré pour illustrer divers biais possibles.
Cette histoire parle d'un homicide involontaire d'une jeune femme \m[color_faitpartiel]la nuit sur une route fréquentée\m[] suite au tir d'un chasseur \m[color_faitpartiel]en état d'ébriété\m[].
Le titre n'indique pas de biais personnel de l'auteur, mais il peut avoir des \m[color_liens]liens avec l'association\m[].
De même, un \m[color_contraintes]manque de temps\m[] est peut-être à l'origine du point de vue présenté, les journalistes n'ayant \m[color_contraintes]pas encore toutes les informations\m[] pour avoir un avis pertinent.

Cet exemple montre qu'un lecteur doit accorder sa confiance à un journal pour ne pas tomber dans certains pièges.
Le lecteur n'a aucun moyen fiable de vérifier que le point de vue du journal est honnête et présente l'interprétation des faits la plus raisonnable.

Par ailleurs, distinguer les affirmations des explications est nécessaire.
L'article affirme que l'homicide est accidentel, mais rien de ce qui est écrit n'appuie ce fait.
De même, toute information n'est pas nécessairement pertinente.
Dire que des pancartes annonçaient la chasse est pertinent s'il est considéré normal pour un promeneur d'éviter de sortir pendant la période de chasse.
Cette information est donc une invitation plus ou moins subtile à adopter ce point de vue.

.QUESTION "L'objectivité est illusoire."
Un journal peut minimiser son interprétation des faits, mais même ce qui est montré, le sujet ou encore l'angle utilisé pour l'aborder, sont déjà des choix.
L'objectivité n'est donc pas atteignable, et ne peut être mesurée précisément.
Des manquements à l'objectivité sont détectables, pour peu qu'ils soient grossiers.
Mais si une information est tue (à des fins de manipulation ou parce que jugé impertinente), seule une investigation d'autres sources peut le montrer.

Par ailleurs, à la connaissance de l'auteur, aucun média ne présente correctement une stricte séparation entre les faits et leur interprétation par les journalistes.
Chaque spectateur ou lecteur doit trier ce qui relève du fait ou de l'interprétation.

.QUESTION "Les mauvaises habitudes des médias."
Les médias ont des sujets fétiches, des façons de présenter une information ou d'organiser le dialogue qui ne sont pas corrects.
Au-delà de la mauvaise transmission de l'information (voire les recommandations pour un papier en section 4), certains biais sont facilement introduits (section 2 et annexe \n[N_APPENDIX_BIAIS]), comme l'appel à l'émotion ou l'argument d'autorité.

L'annexe \n[N_APPENDIX_MEDIAS_HABITUDES] présente quelques exemples de mauvais journalisme télévisuel.
Ces exemples mettent en lumière ce qui devrait apparaître comme une évidence : le journalisme télévisuel est avant tout du divertissement.

.QUESTION "Se renseigner sur un sujet."
Les journaux, papiers ou télévisés, ne servent qu'à informer sur l'actualité et de manière peu fiable.
Mais alors, où trouver des informations pertinentes ?

La manière de s'informer dépend de l'objectif recherché.
Se poser une question ponctuelle sur un sujet n'implique pas le même investissement que vouloir devenir un expert dans un domaine.
L'annexe \n[N_APPENDIX_CONSEILS_APPRENTISSAGE] émet quelques suggestions (sans prétention aucune) sur comment se renseigner.
Quelques cas particuliers sont adressés, par exemple l'apprentissage de modèles politiques, ou en cas de forte contrainte de temps.

D'une manière générale, comprendre un sujet demande du temps et un investissement personnel.
Penser répondre à n'importe quelle question en quelques minutes est une
.B "illusion" ,
et peut même s'avérer dangereux si des décisions importantes s'ensuivent.

.EXPLANATION1
La connaissance ne connaît pas de raccourcis, seulement des pièges.
.EXPLANATION2

Connaître le sujet et le niveau de connaissances à atteindre permet de mieux cibler les documents à lire, et leur donner une priorité.

.BULLET D'une manière générale, les livres sont conseillés.
Ils sont de tout niveau, pédagogiques, et couvrent des sujets vastes de manière souvent complète (sans pour autant être exhaustif).
Ils permettent une vue d'ensemble sur un sujet, relier les savoirs pour les consolider.
.BULLET Ne pas sous-estimer les documents grand publics : wikipédia, blogs, documentaires.
Ces documents peuvent être utiles pour une première approche, comprendre rapidement un principe général ou en complément d'un bon livre.
Même après avoir lu une documentation plus sérieuse, relire un document plus léger peut être utile juste pour être sûr de tout comprendre.
Ces documents ne sont pas toujours pédagogiques ou très complets, et le niveau de connaissances varie, ce sont avant tout de bons compléments.
.BULLET Enfin, aucun document ne va aussi loin qu'un papier scientifique.
Mais il est rare d'avoir besoin de ce niveau de connaissances, un livre est presque toujours plus adapté.
Aussi, un papier nécessite parfois un niveau BAC+2 voire BAC+5 dans le domaine pour comprendre, mais tous les domaines ne sont pas aussi exigeants.
Pour tenter sa chance avec des papiers scientifiques, le mot clé à utiliser pour rechercher des papiers sur un sujet :
.I survey .
.ENDBULLET

Le plus important à retenir : comprendre un sujet demande du temps et un bon libraire (ou un moteur de recherche).
La répétition est mère de tout apprentissage.

.QUESTION "Se forger une opinion."
S'informer correctement
.B doit
nous mettre en face de documents, discussions ou discours défiant notre point de vue.
La suite présente plusieurs propositions pour des discussions apaisées.
À noter que, même si rien de ce qui est dit est transcendant, cela correspond pourtant aux principes les plus élémentaires qui permettent tout dialogue d'être fructueux et qui n'est malheureusement quasi jamais appliqué.
Un rappel n'est pas du luxe.

La suite met à rude épreuve votre biais émotionnel, à dessein.
Pour correctement s'informer, il est
.B nécessaire
de savoir contenir ses émotions, voyez cela comme un exercice.
Vous êtes prévenus.

.CENTERED Comprendre avant tout.
Comprendre les autres point de vue, sans en garder une version caricaturée, est nécessaire pour toute bonne prise de décision.
Même si le point de vue présenté ne nous paraît pas moralement acceptable, il faut réfréner son envie de le faire passer pour un problème mental ou lui prêter des intentions cachées.

Exemple pratique sur un sujet sensible et actuel : une personne souhaitant arrêter toute immigration n'est pas forcément raciste ou xénophobe.
Rien ne justifie de faire un si gros raccourcis et aussi large généralisation.
D'autres justifications peuvent mener à cette position sur le sujet.
Vous avez peut-être de très bons arguments pour penser ces justifications invalides, mais ce n'est pas le cas de votre interlocuteur, qui peut être malgré tout sincère.
Tout le monde n'a pas le même parcours de vie, chacun a ses sources d'informations et jauge différemment les priorités.
De même, toute personne acceptant sans limites l'arrivée de migrants n'est pas non plus à mettre dans une case.
Ici également, de multiples raisons (bonnes ou mauvaises) peuvent mener à cette position sur le sujet.
Aucun des deux groupes n'est homogène.
Et entre ces deux positions, comme très souvent sur un sujet politique, tout un éventail de possibilités existe.

.EXPLANATION1
Attention !
Les émotions obscurcissent le jugement.
.EXPLANATION2

Une vision dénuée de nuance ou la réticence à échanger des arguments peuvent être le résultat d'un biais émotionnel.
Peut-être êtes-vous convaincu à cause d'un appel à l'émotion.

Accepter ou au moins tolérer un point de vue est une réflexion personnelle.
Chacun aura ses propres conclusions.
Pour être sincère dans sa démarche, il faut comprendre avant de juger.

.CITATION1
« Je comprends que tu penses [...] pour des raisons [...], mais je ne partage pas cet avis car [...] » sera toujours préférable et constructif qu'une insulte.
.CITATION2

.CENTERED Accepter de nouveaux arguments.
La position la plus rationnelle sur un point de vue se base sur les éléments disponibles pour statuer.
Même après avoir émis un jugement, en pensant avoir tous les éléments nécessaires, une nouvelle information peut arriver et mettre à mal notre position.
Peut-être avons-nous jugé trop vite le sujet.
Les informations doivent être remises à plat pour juger à nouveau, ou suspendre son jugement si ces informations sont insuffisantes.
Dans tous les cas, la position initiale ne doit pas être gardée si elle ne correspond plus aux faits.
En pratique, et en particulier avec un sujet d'actualité, de nouvelles informations\*[*] font surface régulièrement.
.FOOTNOTE1
Peut-être que ces nouvelles informations ne le sont que pour vous.
Par exemple, si vous êtes exposé pour la première fois à un argument ou un point de vue qui n'est pas le vôtre, bien que déjà répandu.
.FOOTNOTE2

.CENTERED Se laisser la possibilité de changer d'avis.
Face à une problématique n'ayant pas sucité chez nous de réflexion sérieuse, le premier réflexe doit être de
.B "suspendre son jugement" ,
ne pas statuer avant d'avoir suffisamment d'informations pour juger.
Une fois cette phase terminée, l'engagement immédiat envers une opinion tranchée est à éviter ;
il faut se laisser du temps même si toutes les preuves s'accumulent dans un sens.
Nous devons également continuer,
.B sincèrement ,
à douter de notre position.
De cette manière, on se laisse une marge d'erreur possible.
Chaque nouvelle information est jugée à sa juste valeur, sans rejet systématique, pas de biais de cueillette (cherry picking).
C'est une position humble, sans pour autant faire de nous une girouette.

.EXPLANATION1
Réagissez aux arguments n'allant pas dans votre sens comme vous souhaitez que les autres réagissent à vos arguments.
.EXPLANATION2

.CENTERED Une opinion se travaille.
Se forger une opinion demande du temps et des efforts pour aller contre ses préjugés, pour comprendre
.B sincèrement
ceux qui ne sont pas d'accord.
Un avis ne peut être sincère sans comprendre les autres points de vue.

Une fois que les arguments des différents bords sont compris, que le sujet a été assimilé, avoir une opinion est parfaitement acceptable, même très tranchée.
Mes maigres conseils ne doivent pas encourager un sophisme du juste milieu (voir annexe 1).
Parfois une position tranchée se justifie très bien.

Par ailleurs, ceci est le fonctionnement de la science.
Obtenir des informations, interpréter, juger.
Si d'autres faits sont portés à notre connaissance et qu'ils n'avaient pas été intégrés à notre réflexion, notre point de vue doit changer s'il n'est plus tenable rationnellement.

.CENTERED Et la science dans tout ça ?
La science est utile pour prendre des décisions, en vous informant des conséquences de vos choix.
Par exemple, admettons vouloir « réémigrer » une partie de nos concitoyens sur une base raciale.
La psychologie peut aider à comprendre l'impact émotionnel sur les familles, l'économie peut aider à comprendre l'impact sur la disponibilité du travail, etc.
En revanche, vos valeurs sont des prémices indépendantes.
Si vous n'avez aucune considération pour l'économie, ou que vous jugez d'autres aspects prioritaires, aucune formule mathématique ne vous donnera
.I tort
sur ce point.
C'est votre opinion, vos valeurs, la science est hors sujet.

.EXPLANATION1
Avoir des valeurs très marquées ne dispense pas de comprendre d'autres points de vue.
.EXPLANATION2

Tout jugement doit se faire en pleine connaissance de cause.

.EXPLANATION1
Soyez curieux, allez voir ce que disent ceux qui ne pensent pas comme vous.
.EXPLANATION2

.\".vs +\n[table_size_offset]p
.\".ps +\n[table_size_offset]

.vs -\n[table_size_offset]p
.ps -\n[table_size_offset]
.G1 2.7
coord x 1994,2021 y 0,150
#frame ht 2.0 wid 2.2
frame invis bot solid
copy "data/dead-journalists.d" thru X
	line dotted from  $1,0 to $1,$2
	"\(bu" size -2 at $1,$2
	times size -2 at $1,$3
X

"\(bu" size -2 at 1997,150
"Chiffre \f[I]Wikipédia\f[] page \f[]\"journaliste\"\f[]" ljust size -3 at 1998,150
times size -2 at 1997,141
"Chiffre Reporter Sans Frontières" ljust size -3 at 1998,141

label top "Nombre de journalistes tués dans le monde"
#label left "Nombre de citations"
label bot "Année"

# values
times at 1,18
times at 2,10
times at 3,8
times at 4,7
times at 5,7
times at 6,3
times at 7,2
for i from 8 to 14 by 1 do {
  times at i,1
}
times at 15,0
.G2

.QUESTION "Les manipulations."
Les êtres humains sont des créatures perfectibles à bien des égards.
Il faut se méfier de tout le monde, y compris soi-même.
Dans la suite, des manipulations classiques de la vie quotidienne sont discutées.
Des éléments d'un discours ou des traits de personnalité peuvent mettre en doute la véracité ou le bien-fondé d'un propos.

.CENTERED "Effet gourou."
Une personne ayant confiance en elle, parlant avec aplomb, nous est agréable.
De même, si cette personne raconte quelques anecdotes intéressantes pour accompagner un discours, cela peut nous paraître sympathique.
Et c'est parce que c'est appréciable qu'il faut se méfier.
La sympathie fait baisser la vigilance du public, qui devient bien plus indulgent face aux sophismes.

.CITATION1
Qui aime bien châtie bien.
.CITATION2


.CENTERED "Repérer un gourou."
Le gourou a un objectif, comme une faveur à demander, vous faire entreprendre des actions, vendre un produit ou une formation, ou encore un intéressement en nature.
La malhonnêteté fait partie de sa trousse à outils pour parvenir à ses fins, et c'est bien là tout le problème.

Le gourou peut parler de concepts fumeux, ou présentés de manière trompeuse ou détournée.
Par exemple, les mots
.I quantique
et
.I énergie
désignent des concepts précis en physique, mais sont détournés par des gourous et des pseudo-sciences pour désigner tout et n'importe quoi.

Le gourou a une forte confiance en lui, parle avec aplomb pour se mettre en valeur.
Il étale son savoir, parfois sur de nombreux sujets comme s'il était compétent dans tous les domaines.
De même, des anecdotes ou des histoires personnelles enrobent son discours pour attirer la sympathie.

En cas de désaccord, pour parler d'arguments ou de point de vue opposés aux siens, le gourou n'hésite pas à user de sophismes.
Tout est bon pour tromper ou faire oublier le discours adverse.
Les tactiques qu'un gourou peut employer incluent, par exemple, la diversion via de longs discours pour éviter de répondre directement à un argument pertinent, la déformation des propos ou encore les citations hors contexte.

La forme peut prendre une place importante dans la manipulation.
Ainsi, un débit de parole élevé, l'étalage de références, de citations ou d'informations non suffisamment introduites ou expliquées (voire déformées) sont d'autant de façons de faire oublier la faiblesse du discours.
Pour une vidéo ou un podcast, un montage très rapide et sans pause pour assimiler le discours a le même effet.

La moquerie et le sarcasme peuvent également être présents pour flatter l'ego du public, lui donner un sentiment de supériorité.

Comme nous pouvons le voir, tous ces éléments vont à l'encontre des bonnes pratiques pour écrire un document scientifique.
Le format même d'un papier empêche l'apparition de gourous.

Par ailleurs, un gourou ne vise pas nécessairement
.I tout
le public, un petit groupe d'adeptes peut déjà être très lucratif\*[*].
.FOOTNOTE1
Les jeux
.I freemium
par exemple attirent qu'une petite fraction des joueurs à payer, mais cette fraction dépense beaucoup.
Parfois plus d'une dizaine de milliers d'euros... pour un jeu gratuit.
.FOOTNOTE2

.CENTERED "L'arnaque de Dieu."
La section 2 présente un petit florilège d'arguments fallacieux brandis par les apologistes pour justifier l'existence (ou des propriétés) d'une divinité.
Des
.UL dizaines
d'autres arguments sans valeur sont avancés.
Ils se retrouvent encore et toujours dans les conversations, débats et même livres
.[
sophismes
.]
.UL "malgré leurs réfutations" .
La validité des arguments n'a donc aucune valeur aux yeux des apologistes.

Le manque d'honnêteté est flagrant dans ce cas : lorsqu'un argument a trop été discuté, qu'il est devenu trop évident même par les personnes les moins perspicaces, l'argument est détourné.
Les mots sont changés pour paraître plus savant mais pas pour apporter un sens plus intéressant.
Ainsi, les apologistes continuent de parler de l'argument de l'improbabilité, en changeant quelques mots (en plus abstraits) pour les récalcitrants.
C'est ainsi que l'argument de l'improbabilité devient l'argument de la
.I contingence ,
alors que l'argument est strictement identique.
Cette tentative de manipulation est grossière et évidente.

.CENTERED "Pseudo-sciences"
Parfois, des concepts se font passer pour de la science, et tentent d'en reprendre les codes.
Les repérer est parfois difficile, la première étape pour vérifier en cas de doute est de consulter la page Wikipédia en rapport.

Une règle générale : aucune science n'est fondée sur des « énergies », une forme de mysticisme, la mémoire de l'eau (homéopathie), ou encore sur des techniques ancestrale exotiques.
De même, aucune science ne prétend guérir seulement parce que le produit fourni est « naturel » (sophisme d'appel à la nature).
Au niveau publicitaire, une entreprise peut vanter son produit comme étant naturel, mais cela n'a aucune valeur scientifique ; le produit doit avoir une vraie efficacité prouvée par ailleurs, sans cela ce n'est qu'un placébo.

.EXPLANATION1
À retenir : il n'y a pas de médecines alternatives, seulement des alternatives à la médecine.
.EXPLANATION2

.CENTERED Politique
La politique est la gestion d'un État, de ses citoyens, ou encore la relation avec les autres pays.
De très nombreux domaines interviennent dans les prises de décision : économie, écologie, santé, culture, finance, militaire, droit, et caetera.

La politique est une affaire de choix liés à des points de vue sur comment la société devrait fonctionner.
De ce fait, ce n'est pas un simple processus mécanique ou logique ; la politique ne peut être déléguée à des chercheurs ou des experts en gestion.
Ces points de vue sont nommés « idéologies », des ensembles cohérents d'opinions, menant à une politique cohérente selon ces idées\*[*].
.FOOTNOTE1
Le mot
.I idéologie
est parfois connoté négativement dans des conversations, ce n'est pas le cas ici.
.FOOTNOTE2
Un même problème peut se résoudre de multiples manières, sans qu'une méthode soit particulièrement meilleure qu'une autre.
.TBD

.TBD
Des mesures simples peuvent impliquer de nombreuses ramifications inattendues.

.CITATION1
Des automobilistes se moquent de personnes construisant un bateau car leur véhicule n'a pas de roues.
.CITATION2
.NAMECITATION "Discussions politiques entre personnes d'idéologies différentes"

.SECTION Conclusion
Ce document a présenté des biais présents dans la vie de tous les jours et dans de nombreux domaines.

La science s'est adaptée à ces erreurs de raisonnement, et les multiples méthodes prennent en compte les biais spécifiques à chaque domaine.
Les articles scientifiques matérialisent la réflexion des chercheurs en forçant la justification systématique des affirmations.
Ceci lève ainsi les ambigüités et forme un outil de raisonnement pour les auteurs eux-mêmes.
La relecture par les pairs (experts du domaine), antérieure à la publication, permet d'ajouter des vérifications supplémentaires.
Une faute d'inattention est vite arrivée, mais trois ou quatre chercheurs qui passent à côté d'une erreur est plus rare.
La publication est parfois suivie d'autres analyses, des réplications par d'autres laboratoires de la même étude.
Répliquer une analyse contribue à la crédibilité des résultats obtenus (ou y apporte du discrédit si la réplication échoue).
La synthèse des différentes études (sur le même sujet) est produite dans des meta-analyses, qui offrent un recul sur les résultats individuels de chaque laboratoire.
Après toutes ces étapes, chacune permettant de rejeter la validité des hypothèses (même bien au-delà de la publication du papier originel), le résultat devient un consensus scientifique, c'est-à-dire la position partagée par les chercheurs du domaine.

Bien entendu, l'apathie, le refus de se positionner sur le moindre sujet, ou encore la paralysie d'analyse ne sont pas les buts recherchés par ce document.
Dépassionner les discussions est nécessaire pour en avoir de meilleures.

Le document a présenté également le cadre de travail des chercheurs, partageant par moments des informations triviales pour restituer la dimension humaine de la recherche.
.\" Tout cela forme la manière utilisée en science pour acquérir des connaissances.
.\" Toute connaissance n'a pas à passer par ces étapes, si vous perdez vos clés il n'y a pas besoin de publier un article pour les retrouver.
.\" Pas nécessaire, mais plus sûr, on prend en compte les erreurs humaines.

.[
$LIST$
.]

.APPENDIX Quelques biais de plus
.
De nombreux biais ont été présentés en section 2 permettant de saisir l'idée générale, il n'était pas nécessaire d'en présenter davantage.
Cette annexe présente quelques biais de plus, dont certains qui sont répandus dans divers débats.
.SS Ergotage linguistique
Voici l'argument
.I ontologique ,
tel que donné par les apologistes (sous une forme ou une autre).

.gcolor citation
.EENUM Dieu est un être parfait.
.EENUM Une perfection qui ne comprendrait pas l'existence ne serait évidemment pas complète.
.EENUM Donc, Dieu est aussi doté de l'existence.
.EENDENUM
.gcolor black

Avec cet argument, peu importe la signification du mot « Dieu », il existe forcément puisque le concept est défini comme ayant la propriété d'exister.
Pour montrer la pauvreté de cet argument, les phrases précédentes pourraient être retranscrites de cette manière :

.gcolor citation
.EENUM Dieu est un être parfait (je le dis donc c'est vrai).
.EENUM « Parfait » ça veut aussi dire « qui existe » (là encore, je le dis donc c'est vrai).
.EENUM Donc, Dieu existe (= ce qui était dit en prémice 1).
.EENDENUM
.gcolor black

Fait intéressant : cet argument est donné y compris par les personnes
.UL "les plus éduquées"
sur le sujet.
Si un argument solide en faveur d'une divinité existait, est-ce que l'argument ontologique, qui est
.UL "digne d'une cours d'école" ,
serait encore d'actualité ?
Il est raisonnable d'en douter.

.HORIZONTALLINE

L'argument suivant est nommé
.I "argument cosmologique"
.I "Kalam cosmological argument" ) (
et se présente comme suit, tel que donné par les apologistes (sous une forme ou une autre).

.gcolor citation
.EENUM Tout ce qui commence à exister à une cause.
.EENUM L'univers a commencé à exister.
.EENUM Donc l'univers a une cause.
.EENDENUM
.gcolor black

Cet argument a plusieurs problèmes.
En premier, le plus évident,
.I "commencer à exister" " »" "« "
n'a aucun fondement scientifique ; personne n'a jamais observé de la matière qui
.I "commence à exister" .
De plus, nous ne savons pas si l'univers a réellement un début, il pourrait être éternel, cette hypothèse n'a jamais été écartée.
Notre représentation du temps étant elle-même un effet de bord de certaines forces apparues lors du Big Bang, il n'est pas sûr que le temps, tel que nous le concevons, existait au-delà du mur de Planck.

Les deux prémices sont donc contestées ; elles affirment des choses qui ne sont pas démontrées.
Pire, même en admettant ces deux prémices, c'est-à-dire en supposant que l'apparition de matière soit possible et que l'univers aurait un commencement, l'affirmation que l'univers a une cause resterait hasardeuse.
Une propriété physique inconnue (car hors de notre portée d'étude) pourrait toujours être à l'origine de notre univers.

Enfin, en ignorant
.B "tous"
les problèmes de cet argument, il ne démontrerait même pas l'existence d'un dieu mais l'existence d'une
.I cause ,
c'est-à-dire un terme vague qui n'indique rien sur la nature de cette cause.
C'est pour cela que cet argument est complété par d'autres affirmations (cette cause serait un dieu personnel, etc.) qui ne sont qu'un appel à l'ignorance
.I "je ne sais pas, donc dieu" ). (

En clair : cet argument est un charabia teinté d'appel à l'ignorance.

.HORIZONTALLINE

Autre pirouette linguistique, la première
.I cause ,
où comment traiter des adjectifs comme des noms.

Cette tentative de justification pour une divinité peut se résumer comme suit.
Nous comprenons qu'il doit exister dans la nature un arbre le plus grand : tous ont une taille, cette taille diffère d'un individu à l'autre, donc il doit exister un individu (ou un groupe) plus grand que les autres.
De manière analogue, notre monde répond jusqu'à preuve du contraire à une forme de causalité.
Chez moi j'ai des chaises en bois, si elles sont là c'est parce que je les ai achetées, elles étaient en magasin parce que quelqu'un les a fabriquées, la fabrication de ces chaises vient du bois d'un arbre, l'arbre a poussé suite à la réutilisation du carbone dans l'air, carbone qui lui-même provient de notre atmosphère, etc.

.I arbre "" L'
le plus grand,
la première
.I cause .

Cet argument n'est pas valide, il utilise un adjectif (cause) comme si cela était un nom (arbre).
Il revient à se demander quel est le bleu le plus bleu, la fraîcheur la plus fraiche.
Concrêtement, la seule chose possible à dire concernant le début de notre univers est qu'il nous est impossible pour le moment (peut-être pour toujours) de savoir ce qui se passe avant le mur de Planck.
Le principe de causalité est lié à notre représentation du temps, impossible de se prononcer sur le fonctionnement du monde avant l'apparition du temps lui-même.
Le concept même
.I avant "" d'
le temps est en soi difficile à concevoir, et reflète peut-être une simple limitation dans notre compréhension du monde et des lois physiques qui le régissent.
Dans tous les cas, nous ne pouvons nous exprimer sur ce sujet.

.HORIZONTALLINE

Autre sophisme linguistique : redéfinir des mots.
Les mots ont le sens que nous leur prêtons, nous nous accordons sur leur définition, ils ont un sens
.UL conventionnel .
Un mot n'a pas fondamentalement un sens, invariable et intemporel.

Donc, si une personne s'annonce comme athée, et qu'elle définit l'athéisme comme le fait de
.I "ne pas être convaincu qu'un dieu existe" ,
il est malhonnête de lui refuser cette définition.
Dire que l'athéisme est lié à la croyance qu'un dieu n'existe pas, sans se soucier de comment l'interlocuteur se définit lui-même, c'est vouloir déformer ses propos pour s'attaquer à un homme de paille.
Refuser une définition, ce n'est pas faire disparaître le concept auquel il était associé.
La personne disant ne pas être convaincue qu'un dieu existe, peu importe le mot associé, n'a pas changé son point de vue car on lui a refusé sa définition du mot
.I athéisme .
De plus, cette définition est valable parce qu'elle est usuelle, de nombreux athées définissent leur position de cette façon.

À l'inverse, le mot
.I Dieu
n'est jamais employé comme un simple synonyme de
.I concept ,
dans les textes bibliques ou par les croyants.
Pourtant certaines justifications de l'existence d'un dieu partent du principe que Dieu est un concept, les concepts existent, donc Dieu existe.
Cette définition de Dieu est si éloignée de la conception usuelle qu'elle n'a aucune valeur ; les religions amènent bien plus qu'une définition abstraite, et attribuent énormément de propriétés différentes à leur dieu (création de l'univers, des êtres vivants, miracles, etc.).
Ici, le simple fait que le mot existe est une justification qu'une divinité existe, et avec ce même raisonnement, n'importe quel personnage fictif existe également.

De même, redéfinir Dieu comme étant l'univers comme le font les panthéistes est vain.
Le mot
.I univers
existe déjà, lui ajouter un synonyme n'apporte aucune valeur à sa définition.

.HORIZONTALLINE

Dieu est absolu : sa réfutation doit l'être également.

À part dans certains formalismes mathématiques, comme en logique propositionnelle où il est possible de dire qu'une proposition est vraie ou fausse, sinon rien en science n'est absolu.
Même les découvertes scientifiques faisant actuellement consensus ne sont pas considérées comme des vérités absolues (y compris la théorie de l'évolution).
Toute hypothèse est considérée comme raisonnable si elle explique un phénomène, sans faire appel elle-même à un plus grand mystère, et s'il est possible de l'expérimenter (au moins en théorie).
Si l'hypothèse ne répond pas à ces critères elle est rejetée, car elle ne permet pas de créer de la connaissance, elle est donc inutile.

Pourtant, quand bien même
.B "strictement toutes"
les tentatives de prouver l'existence d'un dieu ont échoué, les croyants ne veulent pas admettre que cette hypothèse n'est pas valide.
Pire, des croyants demandent occasionnellement aux non croyants de prouver l'inexistence de dieu de manière absolue.

Demander une preuve de l'inexistence de Dieu, qui plus est de manière absolue, est à la fois une inversion de la charge de la preuve, une incompréhension du fonctionnement de la science et un avœu d'échec.

.SS N'importe quoi mathématique
.TBD
Les mathématiques et la science en général ont été utilisés à de nombreuses reprises dans des arguments douteux.

.BULLET argument d'improbabilité
.BULLET argument de contingence
.ENDBULLET

.SS Cueillette

.PS 2 2
reset

circlerad = 0.1
copy thru % circle shaded "black" outline "black" at ($1,$2) % until "END"
1 1
1 2
1 3.34
1 5
1 6.64
1 7
1 8
1 9
2 1
2 2
2 3.84
2 4.7
2 6.64
2 7
2 9
3 1
3 3.34
3 4
3 5
3 6.64
3 7
3 9
4 3.24
4 4
4 5
4 6.64
4 7
4 8
4 9
5 1
5 4
5 5
5 6.64
5 7
5 8
5.4 3.34
6 4
6 5
6 6.64
6 7
6 8
6 9
7 2
7 3.4
7 5
7 6.64
7 8
7 9
8 1
8 2
8 4
8 5
8 6.64
8 8
8 9
9 1
9 2
9 5
9 6.64
9 7
9 8
9 9
END


D: line thick 2 from (1, 3.34) to (1, 5) to (2, 4.7) to (2, 3.84) to (1, 3.34)
I: line thick 2 from (3, 3.34) to (3, 5)
E: line thick 2 from (4, 3.24) to (4, 5) to (5, 5)
   line thick 2 from (4, 4) to (5, 4)
   line thick 2 from (4, 3.24) to (5.4, 3.34)
U: line thick 2 from (6, 5) to (6, 4) to (7, 3.4) to (7, 5)

box height 10 width 10 with .sw at (0,0)
move to last box .se
# srand(1)
.PE

.SS Les erreurs d'attribution
Un biais d'attribution est le fait de donner à tort un attribut, comme une capacité ou une intention, à une personne ou un groupe de personnes.

.SSS Erreur fondamentale d'attribution
Par exemple, un enfant voyant deux 
.TBD

.SSS Biais d'auto-complaisance
Par exemple, un spectateur d'un match de football pense que la défaite est due à un arbitre complaisant avec l'autre équipe.

.SSS Biais d'attribution hostile
Par exemple, un enfant voit deux autres enfants chuchoter et pensent qu'ils se moquent de lui.

.SS Concordisme
Le concordisme est le fait de réinterpréter les textes religieux à la lumière de nos connaissances actuelles.
Prétendre que ce qui est découvert par la science était déjà présent dans des textes bibliques est un jeu auquel de nombreux croyants s'adonnent.
La suite donne quelques exemples.

.CITATION1
Si une mouche tombe dans votre boisson, plongez-le dedans, puis retirez-la car l’une de ses ailes contient une maladie et l’autre un remède.
.CITATION2
.NAMECITATION "Boukhari dans son Sahih n°3320"

Cette citation est utilisée comme « miracle » dans l'islam.
Comme nous savons de nos jours que certaines mouches peuvent propager des maladies (ou que nous pouvons les utiliser pour fabriquer des médicaments), alors cela validerait cette citation.
Quand bien même la citation dit bien que la maladie et son remède sont dans les ailes de la mouche (ce qui n'a aucun sens), quand bien même cela a mené à des
.I savants " »" "« "
de l'islam de se poser la question de quelle aile contenait la maladie et quelle aile contenait le remède (prouvant à quel point la citation n'a pas aidé du tout à comprendre quoi que ce soit au fonctionnement des maladies), le texte est considéré comme un miracle.

.SS Biais en vrac
.TBD

.BULLET homme de paille : déformer les propos de son interlocuteur pour s'attaquer à un argument plus facile à attaquer, quand bien même il n'a pas été dit.
.BULLET généralisation abusive
.BULLET double standard : juger deux situations identiques avec des critères différents ;
.BULLET double faute : corriger une erreur par une autre erreur.
.BULLET faux dilemme : « si Dieu n'existe pas, alors tout arrive par hasard » ou encore « sans Dieu il n'y a pas de morale » ;
.BULLET inversion de la charge de la preuve : c'est à celui qui affirme quelque chose de prouver que ce qu'il dit est vrai, pas l'inverse.
Pourtant, une remarque qui arrive souvent dans une conversation : « vous ne pouvez pas prouver que Dieu n'existe pas » ;
.BULLET mille-feuille argumentatif : méthode consistant à donner de multiples arguments sans se soucier de leur qualité ni des réponses, dans l'objectif de saturer la conversation.
.ENDBULLET

La religion est l'art d'entraîner l'esprit à réfléchir à rebourd.
Pour les « miracles » et autres « prophécies », au lieu se de demander
.I si
cela est bien arrivé, le croyant se demande
.I comment
cela a pu arriver.
Des histoires clairement fantaisistes passent ainsi pour des faits avérés.
Par la suite, face à un manque d'explication rationnelle, le croyant est invité à penser que la seule explication possible est l'intervention d'une divinité ; combinant un appel à l'ignorance et un faux dilemme.

.APPENDIX Écriture d'un papier
Cette annexe présente quelques exemples pour comprendre la logique et le type d'informations nécessaires dans un papier.
Ces exemples (volontairement très concis pour rester digeste) sont des tentatives, très imparfaites, d'écriture d'un papier.
Chaque exemple est accompagné des erreurs commises ainsi qu'une meilleure version (bien que toujours incomplète).

En premier, une introduction.
.de GIVEEXAMPLE1
.in +1
.ll -1
.KS          \" start a keep
.\" .ft I        \" citation in italics
.mk C        \" set a marker for line drawing
.in +1       \" indent a bit
.gcolor citation
..
.de GIVEEXAMPLE2
.mk D        \" set second marker to come back here
.\" .ft          \" back to previous font
.in -1       \" remove indent
.gcolor black\" remove previous color
.gcolor citationbar
.\" r     = move upward
.\" Z D t = drawing thickness
.\" L     = draw the line
\r\
\Z'\D't 1p''\
\L'|\\nCu'     \" draw line
.gcolor black  \" remove previous color
.sp -2         \" get two lines back
\Z'\D't 0.5p''    \" get the previous drawing thickness back
.KE            \" end of the keep
.ll +1
.in -1
..

.GIVEEXAMPLE1
Il y a des aboiements dehors.
Je veux que ces aboiements s'arrêtent.
.GIVEEXAMPLE2

Problème : source des aboiements ?
Où et quand est-ce qu'ils se produisent ?
Problème de style d'écriture également.

.GIVEEXAMPLE1
Dans les maisons à la campagne, des chiens sont dehors et aboient à midi et le soir lors des repas.
Ces aboiements constituent une nuisance sonore pour leurs propriétaires.
La suite du document présente une manière pour arrêter ces aboiements.
.GIVEEXAMPLE2

Mieux : contexte bien mieux établi, problème plus évident.

.HORIZONTALLINE

Pour l'état de l'art, les solutions alternatives à la nôtre doivent être présentées.
L'exemple suivant, composant l'état de l'art de notre papier fictif, décrit une de ces alternatives.

.GIVEEXAMPLE1
Une méthode pour résoudre ce problème est de s'enfermer chez soi, portes et fenêtres fermées.
.GIVEEXAMPLE2

Problème : la solution est présentée sans indiquer les limites.
Si le papier présente une autre solution, c'est bien que cette méthode n'est pas suffisante, il faut dire pourquoi.

.GIVEEXAMPLE1
Une méthode pour résoudre ce problème est de s'enfermer chez soi, portes et fenêtres fermées.
Cette solution n'est pas entièrement satisfaisante car la nuisance sonore reste présente, elle est seulement diminuée.
De plus, cela est contraignant pour les propriétaires qui pourraient vouloir profiter d'une météo ensoleillée.
.GIVEEXAMPLE2

Mieux : quelques limites sont présentées, qui semblent justifier d'imaginer une meilleure solution.
En pratique, chaque solution est liée à un article qui doit être référencé.

.HORIZONTALLINE

Expliquer son hypothèse, sa solution.

.GIVEEXAMPLE1
Notre hypothèse est qu'il faut jeter un steak par terre.
.GIVEEXAMPLE2

Problème : imprécis et confus.
Comment cela fonctionne ?
Quel est le résultat attendu ?
Si je jette le steak dans ma salle de bain (où les chiens ne vont pas) est-ce que cela fonctionne ?
Cela fonctionne pour combien de chiens ?
Quelle taille de steak ?
Etc.

.GIVEEXAMPLE1
Notre hypothèse est que donner de la nourriture aux chiens, à leur faim, juste avant de passer à table permettrait de résoudre le problème.
Les chiens mangeraient silencieusement, sans aboyer.
Une fois rassasiés, ils resteraient calmes.
.GIVEEXAMPLE2

Mieux : le concept et l'objectif sont plus clairs.
La présentation de l'hypothèse inclut également le résultat attendu, avec un niveau de détail satisfaisant.
Le détail est laissé à la partie expérimentation.

.HORIZONTALLINE

Ensuite il faut expliquer son expérimentation.

.GIVEEXAMPLE1
Je jette deux steaks dehors, et ça a marché.
.GIVEEXAMPLE2

Problème : très imprécis, aucun paramètre n'a été donné.
Décrire une expérimentation implique de fournir suffisamment d'informations (pertinentes) pour
.UL reproduire
l'expérience.
De plus, le résultat et l'interprétation du résultat doivent se faire à part.

.GIVEEXAMPLE1
L'expérience se passe dans une villa avec deux chiens de petite taille.
Les deux chiens sont habituellement nourris avec un steak haché de 150 grammes chacun, suffisant pour les satisfaire plusieurs heures.
À l'heure du repas, vers 12h et 19h, nous leur donnons chacun un steak de 150 grammes.
.GIVEEXAMPLE2

Mieux : les paramètres importants pour reproduire l'expérimentation ont été donnés.

.HORIZONTALLINE

Ensuite on donne les résultats et leur interprétation.

.GIVEEXAMPLE1
Les chiens sont silencieux, l'objectif est atteint.
.GIVEEXAMPLE2

Problème : cela manque d'informations.
Les chiens sont silencieux combien de temps, 5 minutes ?
Fonctionne à midi et le soir ?
Quelles sont les limites entrevues par cette méthode ?
Etc.

.GIVEEXAMPLE1
Les chiens n'aboient plus, ils sont silencieux durant toute la durée des repas.
Le résultat est concluant, l'objectif est atteint.

Cette méthode a des limites, tout d'abord le prix de la viande utilisée et la santé des chiens sur le long terme (la nourriture utilisée n'est pas assez diversifiée).
.GIVEEXAMPLE2

Mieux : l'explication montre que la solution fonctionne et répond réellement à la problématique initiale.
Ceci dit, deux métriques sont introduites, à savoir le prix de la nourriture et la santé des chiens.
L'étude devrait prendre en compte ces paramètres depuis le début, et donc y faire mention dans l'introduction, puis dans l'état de l'art (pour situer les autres solutions sur ces points), etc.

.HORIZONTALLINE

Enfin, on donne une conclusion à l'étude.

.GIVEEXAMPLE1
Il faut donner un steak aux chiens pour avoir la paix.
.GIVEEXAMPLE2

Problème : cette conclusion ne rappelle pas le contexte de l'étude, ni sa problématique, ni ne met en perspective notre solution par rapport aux autres.
De plus, la solution fournie est incorrecte, il n'est pas nécessaire de donner un steak mais plutôt de la nourriture, rien ne dit que d'autres aliments ne fonctionneraient pas aussi bien.

Évidemment, si on souhaite respecter toutes ces consignes, le texte est bien plus verbeux.

.GIVEEXAMPLE1
Cette étude porte sur la tranquillité des propriétaires de chiens lors des repas (à 12h et 19h).
À ces périodes, les chiens sont agités et aboient, ce qui est désagréable.

Notre solution a consisté à nourrir les chiens peu avant les heures de repas, avec leur nourriture habituelle (1 steak de 150 grammes par chien, mais peut varier selon le chien).
L'expérimentation a montré que les chiens restaient calmes durant toute la durée du repas (2h).
Contrairement aux solutions précédentes, les propriétaires ont eu la paix sans désagrément (ils peuvent ainsi profiter de la météo).
Notre solution coûte un peu d'argent, la nourriture n'est pas gratuite, mais malgré cela nous pensons que cette technique peut être satisfaisante pour la majorité des propriétaires de chiens.
.GIVEEXAMPLE2

Mieux : les problèmes adressés précédemment ont été répondus.
Il est fait mention de la portée de l'étude (valable pour la majorité des propriétaires de chiens), de même que l'apport à la science que cela représente (les propriétaires peuvent désormais manger tranquillement, contrairement aux autres solutions).
Cela aide à prendre du recul sur le sujet, mettre cette solution dans un contexte plus général, mieux comprendre son utilité réelle.
.

.APPENDIX Résumé des manipulations
.TBD
Cette annexe liste des techniques de manipulation qui peuvent être employées.
De même, des propriétés d'un discours (ou d'une personnalité) qui peuvent être suspicieuses.

.vs -\n[legendps]
.ps -\n[legendps]
.br
.TS
allbox tab(:);
c | c
lw(0.5i) | lew(2.7i).
Propriété : Raison de se méfier
T{
confiance excessive
T}:T{
Toute personne sérieuse connait les limites de ses travaux.
T}
T{
propos flous
T}:T{
Tout propos doit s'accompagner d'un contexte, d'affirmations expliquées clairement point par point, du cadre voire des limites de ce qui est proposé.
T}
T{
citation hors contexte
T}:T{
Ne pas indiquer de contexte à une citation peut être un signe de malhonnêteté.
T}
T{
propos choquants, injurieux, moqueurs
T}:T{
Attention aux appels à l'émotion (tristesse, colère, sentiment de supériorité intellectuelle ou morale, etc.).
Les émotions obscurcissent le jugement.
T}
T{
charabia, baratin
T}:T{
Attention à la rationalisation.
L'être humain est faillible et trouve du sens même lorsque le propos en est dépourvu.
Résumez le propos pour voir ce qui en ressort
.UL vraiment .
T}
T{
diversion
T}:T{
Au-delà d'une mise en contexte d'un propos, éviter le sujet principal est un signe de malhonnêteté.
T}
T{
débit
.br
important
T}:T{
La pédagogie nécessite de s'assurer de la bonne compréhension du propos.
Un débit de parole ou un montage (audio ou vidéo) trop rapides sont nuisibles à la compréhension.
T}
T{
vantardise, orgueil
T}:T{
Au-delà d'une blague, les deux sont mauvais signes pour le sérieux d'une personne.
T}
.TE
.br
.vs +\n[legendps]
.ps +\n[legendps]

.APPENDIX Calcul du h-index
Cette annexe montre comment calculer graphiquement le
.I h-index
d'un chercheur.

Pour voir le
.I h-index
d'un chercheur graphiquement, ses papiers sont listés par ordre décroissant de leur nombre de citations.
Le
.I h-index
est égal au nombre de papiers dont le nombre de citations est au-dessus de la courbe linéaire (x = y, soit \s-2n\u\s-3o\s+3\d papier = nb citations\s+2).
Autrement dit, le
.I h-index
équivaut au nombre de papiers ayant un nombre de citations supérieur ou égal à leur numéro dans la liste des papiers.
La visualisation est rapide : le
.IEME 1 er
papier doit avoir au moins une citation, ce qui vaut un
.I h-index
de 1.
Si c'est le cas on regarde le
.IEME 2 e
papier, s'il a au moins 2 citations, alors le
.I h-index
est de deux, etc.

.G1
coord x 0,20 y 0,20
grid bot  dotted from 0 to 20 by 5
grid left dotted from 0 to 20 by 5
frame ht 2.0 wid 2.2
draw LINEAR dashed
for i from 0 to 20 by 1 do {
  next LINEAR at i, i
}

"n\u\s-4o\s+4\dpapier = nb citations" rjust size -2 at 17,18

v=5
line from 0,v to v,v
line from v,0 to v,v
#"    linear curve" ljust at 1,650

label top "Calcul du h-index : représentation graphique"
label left "Nombre de citations"
label bot "Papiers \s-2(classés par ordre décroissant de citations)\s+2"

# values
times at 1,18
times at 2,10
times at 3,8
times at 4,7
times at 5,7
times at 6,3
times at 7,2
for i from 8 to 14 by 1 do {
  times at i,1
}
times at 15,0
.G2
.LEGEND1
Schéma représentant le classement des papiers d'un chercheur, par ordre décroissant du nombre de citations.
.LEGEND2

Le graphique précédent montre un calcul de
.I h-index .
Dans cet exemple, le chercheur a publié 15 papiers, allant de 0 à 18 citations, présentés par ordre décroissant sur le graphique.
Le premier papier a reçu 18 citations, le second 10, le troisième 8, et caetera.
Les 5 premiers papiers ont un nombre de citations supérieur ou égal à leur position dans la liste, mais le
.IEME 6 e
papier n'a été cité que 3 fois.
Le
.I h-index
du chercheur est donc de 5, car c'est le nombre de papiers ayant un nombre de citations sur ou au-delà de la courbe linéaire (y = x).

L'avantage de cette métrique est de mesurer la productivité d'un chercheur : il doit produire du contenu de bonne qualité dans la durée.
Écrire des dizaines d'articles inutiles ou se reposer sur un seul bon article ne mène pas à une bonne note.

.APPENDIX Se renseigner sur un sujet
.TBD
Se renseigner sur un sujet est une tâche parfois complexe, parfois même impossible à cause de contraintes de temps.
Cette annexe présente quelques pistes pour s'informer au mieux.

.QUESTION "Quel objectif, quel investissement ?"
Quelle est la raison qui pousse à se renseigner sur un sujet ?
Apprendre une compétence car le sujet nous intéresse ?
Trier le vrai du faux dans les médias ?
Se renseigner sur un potentiel complot ?
Combien de temps pouvez-vous investir ?
Essayons de répondre rapidement à tout ça.

Tout d'abord, si l'idée est de se renseigner sur un sujet de recherche très précis car des personnes accusent tous les chercheurs de faire partie d'un complot mondial, inutile d'aller plus loin.
Peu importe l'objectif qui est prêté aux chercheurs.
Déjà, vous ne
.UL "pouvez pas"
apprendre rapidement des notions complexes et avoir un recul suffisant pour vous faire un avis.
Devenir chercheur demande des années d'études (3 ans) après avoir déjà passé des années pour maîtriser un sujet (5 ans).
Condenser autant de savoir en quelques heures de vidéo ou quelques pages web est impossible.
Prétendre lire des papiers de recherche pour vous faire votre propre avis sans un bon bagage scientifique est
.B "tout aussi illusoire" .
De plus, les théories du complot impliquant autant de monde démontrent surtout l'incompréhension du fonctionnement de la recherche par les personnes qui les répandent, voire leur malhonnêteté.

Si l'objectif est de trier le vrai du faux dans les médias, vous devez disposer de suffisamment de temps (et parfois de moyens).
Certains principes permettent de relever de gros problèmes, et le présent document doit déjà vous aider à y voir plus clair.
Chaque affirmation dans un média doit être vérifiée, quand bien même le média en question est généralement de confiance.
Le journalisme est normalement là pour présenter un point de vue, et la multiplicité des points de vue permettraient de jauger (de manière très imparfaite) l'actualité.
Le fait est que de nos jours, en France, la presque totalité des médias sont détenus par seulement quelques personnes ; l'information tend à être proche d'un média à l'autre.
Les querelles entre médias sont bien souvent superficielles et les points de vue sont caricaturés voire non représentés.
L'étude des médias est un long sujet en soi.
Donc pour faire court : ne pas hésiter à regarder des médias indépendants et peu connus, en gardant en tête les principes pour éviter certains biais et manipulations, et en restant ouvert à de nouveaux arguments ou points de vue.

Ensuite, si l'objectif est d'étudier un sujet scientifique d'une manière générale, c'est-à-dire un sujet technique ou lié à la compréhension de la nature par exemple, il est important de partir du début avec des livres accessibles au grand public.
La sous-section \n[N_APPENDIX_CONSEILS_APPRENTISSAGE].1 est une discussion sur ce sujet.

Enfin, si l'objectif est d'étudier un sujet politique ou littéraire, la méthode va différer légèrement.
En politique, il est moins question de savoir qui a raison ou tort mais plutôt de comprendre des points de vue, qui peuvent être complexes et nécessiter plus d'un livre pour être mis au clair (cela dépend aussi de votre niveau d'investissement).
Quelques conseils sont donnés en sous-section \n[N_APPENDIX_CONSEILS_APPRENTISSAGE].2.

.SS Sujet « scientifique » (ou technique)
Si c'est un sujet lié à l'explication d'un phénomène naturel ou de la technique d'une manière générale, le plus simple est de lire des livres sur le sujet.
La démarche à suivre pour apprendre sereinement un sujet :
.ENUM Trouver plusieurs livres spécifiquement sur le sujet, de niveau débutant ;
.br
Généralement, trouver des livres en rapport avec un sujet est une tâche aisée.
Parfois des livres font office de référence, mais en étant réellement débutant le mieux est d'en consulter plusieurs.
Peu importe les faiblesses des approches, la multiplicité des sources permet de se faire une idée raisonnable du sujet.

Ne pas hésiter à démarrer avec des livres (très) grand public, fournissant peu d'explications mais faciles à lire.

Wikipédia peut être une piste intéressante pour un débutant, malgré le manque de pédagogie associé au style encyclopédique.
Lire les quelques premiers paragraphes d'une page ne donne qu'une idée superficielle du sujet, mais la bibliographie associée à la page permet d'aller plus loin.

Wikipédia, un article de blog ou une vidéo en ligne peuvent être utilisés en complément pour expliquer un mot ou un concept mal introduit dans le livre.
.ENUM Faire des fiches pour retenir le plus important ;
.br
Cela peut paraître comme une perte de temps, en réalité c'est un gain de temps considérable.
Les fiches sont d'autant plus utiles qu'elles permettent de ne pas avoir à revenir sur un livre déjà lu.
Elles permettent également de structurer la pensée, et elles sont encore plus utiles sur des sujets non techniques.
.ENUM Lire des livres plus avancés.
.br
Une fois que la base est acquise, et
.B "seulement à ce moment-là" ,
il est pertinent de lire des livres de plus haut niveau.
Même au niveau intermédiaire ou avancé, revenir sur des sources plus accessibles peut être pertinent pour se remémorer la base.
.ENDENUM

.EXPLANATION1
La pédagogie passe par la répétition.
.EXPLANATION2

.SS Sujet politique (ou littéraire)
.TBD
La politique (tout comme la littérature) implique des points de vue, donc il faut a minima avoir une base de compréhension des différentes approches.

.B Attention ,
que ce soit bien clair : il n'est pas question de partir dans un relativisme absolu où toutes les idées se valent.
Cette vision du monde est fausse.
Comprendre les courants politiques permet à terme d'avoir un résultat sur le réel, en prenant de meilleures décisions par exemple, ou ne serait-ce que pour mieux saisir le sens des discours de chaque partie.

.APPENDIX Médias : l'importance de la vérification
Le journalisme est l'activité qui consiste à recueillir et
.HIGHLIGHT \f[B]vérifier\fP\c
, puis éventuellement commenter, des faits pour les porter à l'attention du public.
Cette annexe présente quelques cas de journalisme défaillant.

.QUESTION "France 3 : « Macron Dégage »."
Cas d'école de la faute journalistique : la modification des faits.
France 3, le 18 décembre 2018, a modifié une image de l'AFP pour y faire supprimer un mot d'une pancarte, et cela a été repéré par des téléspectateurs.
La seule conséquence de ce manquement journalistique a été une mise en demeure du CSA, autant dire aucune conséquence.

.CENTERED Note de l'auteur.
Ici, la modification est à la fois flagrante, indéniable, et fait étonnant, cela s'est passé sur un élément
.B mineur
de l'information.
Rien n'est plus évident qu'un message non flatteur sur une pancarte d'un manifestant.
Pourtant les journalistes ont trouvé normal de modifier les faits.
Une partie importante du journalisme est la vérification des faits ; si la modification faite est mineure, la faute journalistique ne l'est pas,
.B "du tout" .

Si les journalistes pensent normal de modifier un élément aussi mineur, comment est-il honnêtement possible de leur faire confiance pour le reste ?
Quid des sujets plus importants, où une modification des faits ne serait pas aussi évidente ?
.\" La soumission au pouvoir de la chaîne ne peut être plus totale.

De plus, cette faute journalistique ne s'est pas passée sur un site internet obscur, mais sur une chaîne du service public.
Le CSA a par ailleurs infligé des amendes de plusieurs millions d'euros pour des séquences contrevenant aux bonnes mœurs.
Une simple mise en demeure pour un élément aussi grave s'apparente à une forme
.B impunité . d'

.QUESTION "France Soir."

.QUESTION "Libération."
Le journal
.I Libération
a donné la parole à un regroupement de
.B "groupes terroristes"
revendiqués pro-charia et pour un retour à l'Islam originel
.I "Jaych al-Ahrar" , (
.I "Liwa Shuhada al-Islam" ,
etc.), nommé complaisamment dans l'article comme
.I "la résistance" " »," "« "
.I "groupe rebelle" " »," "« "
et sous son nom officiel
.I "Front de libération" " »." "« "
Par ailleurs, ce groupement terroriste est soutenu militairement par l'armée Américaine, qui leur a fourni du matériel.
Ces informations concernant le
.I "Front de Libération" ,
pourtant importantes, n'ont pas été ne serait-ce que esquissées dans l'article.
.[
Libération donne la parole aux terroristes
.]

Par ailleurs, le texte est loin d'être neutre ; cela se voit jusque dans les deux titres de l'article.
Le premier est
.I "« La Russie ment »" ,
dont nous noterons des guillemets préventifs dans l'article, car il est bel est bien question d'une simple affirmation par le groupe terroriste (mais reportée sans aucune remise en question ou retenue par
.I Libération )
et non une affirmation venant de la rédaction du journal.
Le second titre,
.I "Frappes « punitives » contre les cibles civiles" ,
va même jusqu'à sous-entendre que la Russie attaque des civils délibérément.
Là encore, un peu de recul sur les dires de
.B terroristes
aurait été bienvenue, l'article leur fait presque office de tribune.

Le reste de l'article n'a que peu de contenu, et n'est pas fiable et ne met rien en perspectives.
Par exemple, l'article dit que
.I "les troupes gouvernementales piétinent depuis 3 mois" ,
sans préciser les très grandes avancées faites pendant des années (pour mettre fin au
.B terrorisme
des groupes visiblement identifiés comme fiables par
.I Libération ).

.QUESTION "Que retenir ?"
Cette annexe a montré différents manquements journalistiques bien réels, allant de la dissimulation à la modification des faits.
Des journalistes ont, entre autres, trafiqué des images et présenté des terroristes comme étant de confiance.
Pourtant, cela n'a suscité aucune réaction.

La modification des faits n'est pas seulement du mauvais journalisme et un aveux de partialité.
C'est un des éléments fondamentaux des dictatures, et si ce mot a été banalisé, il n'est ici pas employé à la légère.

.[
$LIST$
.]
.
.\".EXPLANATION1
.\"Ce qui n'est pas puni en pratique est autorisé.
.\".EXPLANATION2

.APPENDIX Médias : quelques mauvaises habitudes
Les exemples suivants illustrent des problèmes dans les journaux télévisuels.
Chaque exemple présente le traitement d'une information ou une méthode employée, qui échouent à traiter ou à correctement transmettre une information, trahissant a minima un manque de sérieux.

.CENTERED La météo.
La pluie et le beau temps sont régulièrement discutés.
Au printemps il commence à faire beau, en été il fait chaud, à l'automne le temps se couvre, et en hiver, surprise, il fait froid.
Ces annonces bouleversantes s'accompagnent également d'un reportage pour comprendre ce que cela signifie, prenant régulièrement du temps d'antenne pour un journal télévisé.

.CENTERED La grève.
Lors d'une grève, des reportages éclairs parlent du mécontentement des usagers du service en grève ; la SNCF est un exemple parlant de ce phénomène.
Le téléspectateur sait déjà bien qu'une grève créée du mécontentement.
La mise en scène de personnes en colère lors d'une séquence de micro-trottoir n'apporte aucune information.
Dans le même temps, les
.B revendications
des grévistes ne sont pas mises en avant.
Montrer la colère mais pas l'origine du problème est néfaste pour se faire un avis, et représente également un appel à l'émotion.
De là à parler de manipulation, il n'y a qu'un pas.

.CENTERED Le micro-trottoir.
Le micro-trottoir est, en soit, un format peu intéressant pour partager de l'information.
Le principe de couper quelques secondes de parole d'une conversation informelle et non préparée ne permet pas de transmettre autre chose qu'une information triviale, comme un sentiment.
Son usage lors des grèves, de manifestations et toute sorte de situation causant un désagrément prend alors tout son sens : le journaliste veut montrer des personnes sous le coup de l'émotion, donc pas en situation de fournir un avis éclairé.
Là encore, le journaliste ne fournit, au mieux, qu'un simple commentaire, voire provoque un appel à l'émotion.

.CENTERED Les débats scientifiques sans scientifique.
Sur certains plateaux, des philosophes se retrouvent à parler de médecine ou autres sujets dont ils n'ont strictement aucune compétence, en lieu et place de scientifiques spécialisés sur les sujets traités, ou au moins d'une personne ayant une connaissance approfondie du sujet pour expliquer la situation.
Au mieux, c'est du commentaire, des opinions, ce qui se retrouve ni plus ni moins sur les réseaux sociaux.
Reconnaissant le philosophe comme une figure d'autorité, surtout s'il a l'habitude d'être présent sur un plateau, un spectateur inattentif peut penser que sa parole dans ce contexte est légitime, et ainsi accepter plus facilement des arguments faibles.

.CENTERED Les interruptions incessantes.
Autre problème de format, les discussions (ou débats) avec des personnes qui se coupent régulièrement la parole.
Si une personne ne peut garder la parole sans interruption pendant plus de quelques dizaines de secondes, aucune pensée structurée ne peut être partagée.

.QUESTION "Que conclure ?"
Ces exemples montrent que l'information n'est pas toujours la priorité du journal télévisuel, le sérieux se substituant au divertissement.
Ces distractions seraient bien moins graves si elles ne prenaient pas la forme d'une transmission légitime de l'information.
Pire, le spectateur peut finir le journal en pensant être informé.

.EXPLANATION1
Le problème n'est pas le manque de connaissances, mais l'illusion de la connaissance.
.EXPLANATION2
