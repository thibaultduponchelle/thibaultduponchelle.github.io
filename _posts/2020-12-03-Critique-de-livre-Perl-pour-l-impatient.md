---
layout: post
title: Critique de livre "Perl pour l'impatient"
date: 2020-12-03 14:14:38
---
![Perl pour l'impatient](/assets/images/ypnaaxlaaz2u8ilmav6j.jpg)

# Perl pour l'impatient
This is a french book, my review will be in French :smile:

## Introduction qui donne envie

![Jojo](/assets/images/3ljssfim72xafef3fb8n.jpg)

J'ai bien aime la facon d'introduire le langage Perl :
* Perl ce langage de programmation hors norme
* Roi de l’analyse des données
* "Tronçonneuse suisse"
* Spécialité : optimiser votre temps
* Humilité en toutes circonstances
* Redondance et contextualite
* Ressources déplacées du "hardware" au "brainware", il faut simplifier la vie du "brainware"
* Ce qui se conçoit aisément doit s’écrire simplement

## Ce n'est pas tout jeune
Plusieures références a des logiciels disparus depuis comme **IndigoStar** ou **Open Perl IDE** ou encore **PerlBuilder**...
Ou d'autres logiciels que je connais pas comme **Qmail** ou **FCheck** (c'est quoi ?).

J'aime bien ces vieilles références, je suis toujours curieux à ce sujet.

Et ce n'est pas étonnant pour un livre dont la dernière édition date de **2005**.

## Bon
Bonnes explications sur les scalaires. 
Les boucles sont bien expliquées, tout comme les tableaux et hashs egalement.

L'auteur amène gentiment vers les **idioms Perl** (`print if`, `unless`, or `die`)

Le chapitre regex est très bien : explication douce évolutive et pointue.

Le style est bien écrit.

### De bons conseils

![Conseil](/assets/images/8kbtudp5fivfvsy6uj1v.png)

* "N’abusez pas des conversions automatiques, elles obscurcissent le code" 
* Ne pas tester un float contre 0 mais inférieur à `1E-6` 
* Comparer des chaînes avec `le` ou `gt` -> utiliser plutôt `sort`
* Attention à ne pas écrire sur un répertoire
* `use diagnostics`

### Les annexes sont top
De bons conseils dans l'annexe pour debugger :smile:

L'annexe est tres bien ca parle meme des signaux etc...

## Bof
J'ai relevé un mauvais conseil "on peut utiliser une variable sans la déclarer avant"

## Bizarreries
* Plutôt marrant ces exemples en français avec les guillemets Francais...
* ... et le nom des variables en francais 
* Savez vous qu'on peut parler le *perlien* (la langue) ?
* Connaissez vous le programme qui se lit lui meme ? `open PROG, $0`

## Conclusion 

Tres bon petit livre, je recommande :smile:
