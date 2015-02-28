:author:    Wassim HOJEIJ
:revdate:   27 février 2015
:revnumber: 1.0.0
:numbered:
:data-uri:
:toc2:
:icons: font
:source-highlighter: highlightjs   


= Pose de références dans les fiches Oasis

== Objectif
Le but de ce projet est le développement d’un outil qui permet de poser automatiquement les liens dans les fiches oasis

== Contexte
Ce projet s’inscrit dans le cadre de la chaine Oasis

== Références posées
=== Références vers les codes
==== Référence vers un article d'un code
*Contexte* : RENV-CODE
 +
*Citation* : C. civ, art. 16-3
 +
*Référence posée sur* : art. 16-3

==== Références vers un article d'une loi dans un code
*Contexte* : RENV-LOI
 +
*Citation* : Ord. n<EXP>o</EXP> 96-51 du 24 janv. 1996 ss. art. 9 - <GRAS>CSS</GRAS>
 +
*Référence posée sur* : art. 9

==== Référence vers une loi d'un code
*Contexte* : RENV-LOI
 +
*Citation* : L. n<EXP>o</EXP> 2008-1330 du 17 déc. 2008 - <GRAS>CSS</GRAS>
 +
*Référence posée sur* : n<EXP>o</EXP> 2008-1330

==== Description
* *Référence posée avec un seul identifiant* : _OK_

[source, xml] 
----
<REF TYPE="CODE" REFID="CODE000001">art. 1<?OK?></REF>
----
-
* *Référence posée avec plusieurs identifiants* : _MULTI_

[source, xml] 
----
<REF TYPE="CODE" REFID="CODE000001 | CODE000002">art. 1<?MULTI?></REF>
----
* *Référence posée sans aucun identifiant* : _NULL_

[source, xml] 
----
<REF TYPE="CODE" REFID="VIDE-AUTO">art. 1<?NULL?></REF>
----

=== Référence vers la jurispridence

===== Référence avec vérification de cohérences *_Juridiction/Ville_* et/ou *_Juridiction/Numéro_*

|======================
|*Juridiction*|*Ville*|*Introducteur*|*Numéro* 
|NON|OUI|RG |15/12345
 +
 2015/12345
|CAA|OUI|req.|01PA12345
|TA|OUI|req.|123456
 +
 1234567
|CE|NON|req.|1234
 +
 12345
 +
 123456
|CEDH|NON|req.|1234/56
 +
 12345/67
 +
 12-3456-890-123
 +
 123-4567-890-123
|T. confl.|NON|req.|1234
|CJUE
 +
 CJCE|NON|aff.|C-1/23
 +
 C-12/34
 +
 C-123/45
|TPICE  
 +
 Trib. UE|NON|aff.|T-1/23
 +
 T-12/34 
 +
 T-123/45
|Com.
 +
 Soc.
 +
 Civ.
 +
 Crim.
 +
 Ch.
 +
 Cass.|NON|NON|98-76.543
 |Cons. const.|NON|NON|2004-3381/3396
 +
 2004-3381/3396
 +
 99-595 DC
 +
 93-1328/1487-AN
 +
 2003-123 DC
 +
 2008-123/345
 +
 2008-123 R
 +
 2008-123 L
 +
 2008-123 I
 +
 2007-1 LOM
 +
 2009-1 D
 +
 2010-12 QPC
|Cons. Prud'h|OUI|NON|01/1234
 +
 01/12345
 +
|CCA|NON|NON|12-34 
|======================

[CAUTION]
====
NOTE: *Ville Date Numéro*
----
Paris, 15 janv. 2015, RG n° 15/12345
----
NOTE: *Juridiction Ville Date Numéro*
----
CAA Paris, 23 nov. 2011, req. n° 01PA12345
TA Lille, 23 janv. 2004, req. n° 123456
Cos. Prud'h. Vienne, 21 oct. 2008, n° 07/00488 
----
NOTE: *Juridiction Date Numéro*
----
CE 4 mai 2011,  req. n° 123456
CEDH 6 juin 2000, Morel c/ France, req. n° 1234/56
T. confl. 19 nov. 2001, req. n° 1234
CJUE 3 janv. 2008, aff. C-1/08
Trib. UE 3 janv. 2011, aff. T-1/11
Com. 3 janv. 2001, n° 97-21.510
Cons. const. 3 déc. 2009, n° 2009-595 DC
----

NOTE: *Juridiction Numéro Date*
----
Cons. Conc. n° 04-D-74 du 2 déc. 2004
Aut. Conc. n° 09-D-74 du 21 déc. 2009 
CCA, avis, n° 05-02 du 24 févr. 2005
----
====

===== Référence avec vérification de cohérences

|======================
|*Juridiction*|*Ville*|*Introducteur*|*Numéro* 
|TGI
 +
 T. enfants 
 +
 TASS|OUI|NON|Pas de formalisme Commun
 +
|TI|OUI|NON|Pas de formalisme Commun
 +
|T. com.|OUI|NON|Pas de formalisme Commun
 +
|T. corr.|OUI|NON|Pas de formalisme Commun
|======================

[CAUTION]
====
NOTE: *Juridiction Ville Date Numéro*
----
TGI Carpentras, 10 nov. 1997, n° 04/15827
TI Tours, 4 mai 2007, n° 06/000428
T. com. Nanterre, 30 nov. 2011, n° 2011L02302
T. corr. Versailles, 10 janv. 1994, n° V9427680170
----
====

==== Description

* *Contexte* : RENV-JURIS

* *Référence posée* : _REFID = DATE_NUMERO_

[source, xml] 
----
<REF TYPE="JUR" REFID="2011-11-01_01/12345">n<EXP>o</EXP> 01/12345</REF>
----
* *Référence erronée* : _Un pi ERR-JUR est ajouté après le numéro_

[source, xml] 
----
n<EXP>o</EXP> 1234567<?ERR-JUR?>
----


=== Référence vers les revues

==== Description

* *Contexte* : RENV-ARTI
* *Citation* : Revue année type1 (optionniel) page, type2 auteur (optionnel)

* *Référence posée avec un seul identifiant* : _OK_

[source, xml] 
----
<REF TYPE="REV" REFID="DS/CHRON/2008/0032">Dr. soc. 2008. 196<?OK?></REF>
----
* *Référence posée avec plusieurs identifiants* : _MULTI_

[source, xml] 
----
<REF TYPE="REV" REFID="RECUEIL/IR/2005/0082 | RECUEIL/IR/2005/0046">D. 2005. 166<?MULTI?></REF>
----
* *Référence posée sans aucun identifiant* : _NULL_

[source, xml] 
----
<REF TYPE="REV" REFID="VIDE-AUTO">D. 2013. 556, obs. T. Tauran<?NULL?></REF>
----
[NOTE] 
====
Un Web Service REST est utilisé pour poser les identifiants sur les références revues
 +
*Serveur* : _srvrevues.dalloz.intra_
 +
*GET* : _Un identifiant d'un article en se basant sur la citation_
http://srvrevues.dalloz.intra:8080/revues/resources/citation/AJDA/1998/397/true/null/null/null
 +
*Résultat* : _Format json_
[source, json] 
----
{"revue":{"citation":[{"matchFound":1},{"id":"AJDA/CHRON/1998/0387"}]}}
----
====


== Procédure d'installation de l'outil

Pour télécharger l’outil oasis, cliquer sur le lien suivant:

-  link:file://srvdata10\Commun/Outils%20Production/CHAINE_OASIS/Outil_Production_Oasis/setup.exe[Outil Oasis]

Double cliquer sur le fichier *_setup.exe_* téléchargé et suivre les étapes ci-dessous

TIP: Cliquer sur les boutons
encadrés en rouge


image:img1.png[float="left",width="400"]  
image:imgx.png[width="0"]
image:img2.png[width="400"]

WARNING: Le message suivant peut apparaitre si l’outil est
déjà installé (Mise à Jour)

image:img3.png[width="400"]

image:img4.png[float="left",width="400"]  
image:imgx.png[width="0"]
image:img5.png[width="400"]

image:img6.png[float="left",width="400"]  
image:imgx.png[width="0"]
image:img7.png[width="400"]

== Procédure de mise à jour

Les mises à jour sont détectées automatiquement au lancement
de l’application.

Le message suivant est affiché :

image:img8.png[width="300"]

Appuyer sur le bouton *Update*
pour lancer la mise à jour.
Les étapes à suivre sont les mêmes que les étapes citées
dans *Installation*.

== Utilisation
image:img9.png[width="600"]  

* Pour poser les références dans un lot de fichiers (Un dossier contenant plusieurs fichiers) :
** Sélectionner le dossier à l'aide du bouton 
image:img10.png[width="40"]
* Pour poser les références dans une seul fichier :
** Sélectionner le fichier à l'aide du bouton 
image:img13.png[width="40"]

* Pour lancer le traitement, appuyer sur le bouton 
image:img11.png[width="40"] : une nouvelle fenêtre apparait

image:img12.png[width="300"] 

* Sélectionner les divers types de liens que vous désirer poser (par défaut tous les liens sont sélectionnés) et appuyer sur le bouton *_Lancer_*.

* En sortie vous allez trouver un sous-dossier *_OUTPUT_* qui contient les fichiers traité ainsi qu’un fichier *_LOG-OASIS.HTML_*

== Le fichier de LOG
Le fichier de log contient pour chaque fichier traité:
 
- Le nombre de références codes posées
- Le nombre de références codes multi
- Le nombre de références codes null
- Les numéros erronés de jurisprudence avec le type d'erreur (introducteur, ville, date numéro)
- Le nombre de références revues posées
- Le nombre de références revues multi
- Le nombre de références revues null
 



