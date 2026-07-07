# 🔐 generateur-de-mdp - Générateur de mot de passe Unix

![Bash](https://img.shields.io/badge/Bash-5%2B-informational?style=for-the-badge)
![Linux](https://img.shields.io/badge/Linux-Unix-orange?style=for-the-badge)
![API](https://img.shields.io/badge/API-motdepasse.xyz-blueviolet?style=for-the-badge)
![Licence](https://img.shields.io/badge/Licence-MIT-green?style=for-the-badge)

Script Bash interactif de génération de mots de passe aléatoires. Utilise l'API publique [motdepasse.xyz](https://api.motdepasse.xyz/) pour générer des mots de passe selon les critères choisis par l'utilisateur.

---

## Fonctionnalités

- Génération via API externe (aucune dépendance locale pour l'entropie)
- Choix interactif des critères :
  - Chiffres
  - Lettres minuscules
  - Lettres majuscules
  - Caractères spéciaux
  - Exclusion des caractères similaires (`0`, `o`, `O`, `1`, `l`, `I`)
- Longueur du mot de passe au choix
- Affichage sécurisé : le mot de passe est effacé de l'écran après confirmation
- Mode debug intégré

---

## Prérequis

- Bash 5+
- `curl` installé
- Accès Internet (pour requêter l'API)

---

## Installation

```bash
git clone https://github.com/Axolotty/generateur-de-mdp.git
cd generateur-de-mdp
chmod +x "MDP aléatoire.sh"
```

---

## Utilisation

### Lancement normal

```bash
./"MDP aléatoire.sh"
```

Le script pose une série de questions :

```
Inclure des chiffres ? oui
Inclure des lettres minuscules ? oui
Inclure des lettres majuscules ? oui
Inclure des caractères spéciaux ? oui
Exclure les caractères similaires: 0 o O 1 l I ? non
Combien de caractères pour le mot de passe ? 16

Mot de passe : X7k$mP2@qRv!nL9w

Attention après avoir appuyé sur une touche, le mot de passe sera effacé.
```

### Avec mode debug

```bash
./"MDP aléatoire.sh" debug
# ou
./"MDP aléatoire.sh" --debug
```

Le mode debug affiche la somme des variables et le nombre de caractères utilisés pour la construction de la requête API.

---

## Fonctionnement

Le script calcule une somme numérique basée sur les options choisies (chaque option a une valeur fixe), puis construit la requête vers l'API `api.motdepasse.xyz/create/` avec les paramètres correspondants.

---

## Fichiers du projet

| Fichier | Description |
|---------|-------------|
| `MDP aléatoire.sh` | Script principal de génération |

---

## Licence

MIT © Axolotty
