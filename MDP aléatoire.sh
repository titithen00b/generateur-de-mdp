#!/bin/bash
clear
read -p "Inclure des chiffres ? " chiff
read -p "Inclure des lettres minuscules ? " min
read -p "Inclure des lettres majuscules ? " maj
read -p "Inclure des caractères spéciaux ? " spec
read -p "Exclure les caractères similaires: 0 o O 1 l I ? " exc
read -p 'Combien de caractères pour le mot de passe ? ' car

{
  j=$car
  somme=0
  maju=0
  spe=0
  exclu=0
  minu=0
  debug=0
}


debug () {
echo "Somme des variables $somme"
echo "Nombre de caractères pour la fonction cut $j"
}


if [[ $chiff == "oui" ]]; then
{
  mdp=$(curl -s "https://api.motdepasse.xyz/create/?include_digits&password_length=$car&quantity=1" | cut -d , -f 1 | cut -c 2- | cut -c 15- | cut -c 1-"$j" )
  chif=1
}
fi

if [[ $maj == "oui" ]]; then
{
  mdp=$(curl -s "https://api.motdepasse.xyz/create/?include_uppercase&password_length=$car&quantity=1" | cut -d , -f 1 | cut -c 2- | cut -c 15- | cut -c 1-"$j" )
  maju=5

}
fi

if [[ $spec == "oui" ]]; then
{
  mdp=$(curl -s "https://api.motdepasse.xyz/create/?include_special_characters&password_length=$car&quantity=1" | cut -d , -f 1 | cut -c 2- | cut -c 15- | cut -c 1-"$j" )
  spe=10
}
fi

if [[ $exc == "oui" ]]; then
{
  mdp=$(curl -s "https://api.motdepasse.xyz/create/?include_lowercase&include_digits&include_uppercase&exclude_similar_characters&password_length=$car&quantity=1" | cut -d , -f 1 | cut -c 2- | cut -c 15- | cut -c 1-"$j" )
  exclu=13

}
fi


if [[ $min == "oui" ]]; then
{
    minu=20
    mdp=$(curl -s "https://api.motdepasse.xyz/create/?include_lowercase&password_length=$car&quantity=1" | cut -d , -f 1 | cut -c 2- | cut -c 15- | cut -c 1-"$j" )
}
fi

let "somme=$chif+$maju+$spe+$exclu+$minu"

if [[ $somme -eq 49 ]]; then
{
  mdp=$(curl -s "https://api.motdepasse.xyz/create/?include_special_characters&include_lowercase&include_digits&include_uppercase&exclude_similar_characters&password_length=$car&quantity=1" | cut -d , -f 1 | cut -c 2- | cut -c 15- | cut -c 1-"$j" )
}
fi

if [[ $somme -eq 48 ]]; then
{
  mdp=$(curl -s "https://api.motdepasse.xyz/create/?include_special_characters&include_lowercase&include_uppercase&exclude_similar_characters&password_length=$car&quantity=1" | cut -d , -f 1 | cut -c 2- | cut -c 15- | cut -c 1-"$j" )
}
fi

if [[ $somme -eq 43 ]]; then
{
  mdp=$(curl -s "https://api.motdepasse.xyz/create/?include_special_characters&include_lowercase&iexclude_similar_characters&password_length=$car&quantity=1" | cut -d , -f 1 | cut -c 2- | cut -c 15- | cut -c 1-"$j" )
}
fi

if [[ $somme -eq 44 ]]; then
{
  mdp=$(curl -s "https://api.motdepasse.xyz/create/?include_special_characters&include_lowercase&include_digits&exclude_similar_characters&password_length=$car&quantity=1" | cut -d , -f 1 | cut -c 2- | cut -c 15- | cut -c 1-"$j" )
}
fi

if [[ $somme -eq 35 ]]; then
{
    mdp=$(curl -s "https://api.motdepasse.xyz/create/?include_special_characters&include_lowercase&nclude_uppercase&password_length=$car&quantity=1" | cut -d , -f 1 | cut -c 2- | cut -c 15- | cut -c 1-"$j" )
}
fi

if [[ $somme -eq 26 ]]; then
  {
    mdp=$(curl -s "https://api.motdepasse.xyz/create/?include_lowercase&include_digits&include_uppercase&password_length=$car&quantity=1" | cut -d , -f 1 | cut -c 2- | cut -c 15- | cut -c 1-"$j" )
  }
fi

if [[ $somme -eq 10 ]]; then
  {
    mdp=$(curl -s "https://api.motdepasse.xyz/create/?include_special_characters&password_length=$car&quantity=1" | cut -d , -f 1 | cut -c 2- | cut -c 15- | cut -c 1-"$j" )
  }
fi

if [[ $somme -eq 14 ]]; then
  {
    mdp=$(curl -s "https://api.motdepasse.xyz/create/?include_digits&exclude_similar_characters&password_length=$car&quantity=1" | cut -d , -f 1 | cut -c 2- | cut -c 15- | cut -c 1-"$j" )
  }
fi

if [[ $somme -eq 33 ]]; then
  {
      mdp=$(curl -s "https://api.motdepasse.xyz/create/?include_lowercase&exclude_similar_characters&password_length=$car&quantity=1" | cut -d , -f 1 | cut -c 2- | cut -c 15- | cut -c 1-"$j" )
  }
fi

if [[ $somme -eq 21 ]]; then
  {
    mdp=$(curl -s "https://api.motdepasse.xyz/create/?include_lowercase&include_digits&password_length=$car&quantity=1" | cut -d , -f 1 | cut -c 2- | cut -c 15- | cut -c 1-"$j" )
  }
fi

if [[ $somme -eq 11 ]]; then
  {
    mdp=$(curl -s "https://api.motdepasse.xyz/create/?include_special_characters&include_digits&password_length=$car&quantity=1" | cut -d , -f 1 | cut -c 2- | cut -c 15- | cut -c 1-"$j" )
  }
{
  mdp=$(curl -s "https://api.motdepasse.xyz/create/?include_special_characters&include_digits&password_length=$car&quantity=1" | cut -d , -f 1 | cut -c 2- | cut -c 15- | cut -c 1-"$j" )
}

fi

if [[ $somme -eq 24 ]]; then
  {
    mdp=$(curl -s "https://api.motdepasse.xyz/create/?include_special_characters&include_digits&exclude_similar_characters&password_length=$car&quantity=1" | cut -d , -f 1 | cut -c 2- | cut -c 15- | cut -c 1-"$j" )
  }
fi

if [[ $somme -eq 6 ]]; then
  {
      mdp=$(curl -s "https://api.motdepasse.xyz/create/?include_digits&include_uppercase&password_length=$car&quantity=1" | cut -d , -f 1 | cut -c 2- | cut -c 15- | cut -c 1-"$j" )
  }
fi

if [[ $somme -eq 25 ]]; then
  {
      mdp=$(curl -s "https://api.motdepasse.xyz/create/?include_lowercase&include_uppercase&password_length=$car&quantity=1" | cut -d , -f 1 | cut -c 2- | cut -c 15- | cut -c 1-"$j" )
  }
fi

if [[ $somme -eq 38 ]]; then
  {
      mdp=$(curl -s "https://api.motdepasse.xyz/create/?include_lowercase&include_uppercase&exclude_similar_characters&password_length=$car&quantity=1" | cut -d , -f 1 | cut -c 2- | cut -c 15- | cut -c 1-"$j" )
  }
fi

if [[ $somme -eq 36 ]]; then
  {
      mdp=$(curl -s "https://api.motdepasse.xyz/create/?include_digits&include_uppercase&include_special_characters&include_lowercase&password_length=$car&quantity=1" | cut -d , -f 1 | cut -c 2- | cut -c 15- | cut -c 1-"$j" )
  }
fi

if [[ $somme -eq 18 ]]; then
  {
      mdp=$(curl -s "https://api.motdepasse.xyz/create/?include_uppercase&exclude_similar_characters&password_length=$car&quantity=1" | cut -d , -f 1 | cut -c 2- | cut -c 15- | cut -c 1-"$j" )
  }
fi


echo "Mot de passe : $mdp"

# Mode debug
{ if [[ $debug -eq 1 ]]; then
  debug

elif [[ $1 == "debug" ]]; then
  debug

elif [[ $1 == "--debug"  ]]; then
  debug
fi }


echo -e "\n"
echo "Attention après avoir appuyer sur une touche, le mot de passe sera effacé. Merci de mémorisé/noter/copier le mot de passe avant d'appuyer sur une touche !"
echo -e "\n"
read -s -n1 -p "Merci d'appuyer sur une touche pour continuer..."; echo
echo -e "\n"
#sleep 20
clear


# Générateur de mot de passe via API du site https://api.motdepasse.xyz/
# EOF
