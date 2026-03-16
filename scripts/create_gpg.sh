#!/bin/bash

# Créer le fichier final
cat > /tmp/protection_mdp.txt << 'EOF'
############################################################################################
🎊🎊🎊 FÉLICITATIONS 🎊🎊🎊

Tu as réussi tous les défis!!! Tu es maintenant un(e) vrai(e) hacker / hackeuse Linux! 🐧💻

Tu as appris à:
✅ Naviguer dans le système de fichiers (cd, ls, pwd)
✅ Lire des fichiers (cat)
✅ Trouver des fichiers cachés (ls -a)
✅ Utiliser les privilèges sudo
✅ Décompresser des archives (tar)
✅ Éditer des fichiers (nano, vi, vim)
✅ Exécuter des scripts
✅ Utiliser ping pour résoudre des noms de domaine
✅ Décrypter des fichiers avec gpg

Bravo pour ta persévérance! 🚀🚀🚀
############################################################################################
EOF

# Chiffrer le fichier avec gpg
# Le mot de passe sera l'IP de svit-esx-winsrv.epfl.ch (128.178.15.227)
echo "127.0.0.1" | gpg --batch --yes --passphrase-fd 0 --symmetric --cipher-algo AES256 -o /home/stage/protection_mdp.gpg /tmp/protection_mdp.txt

# Nettoyer
rm /tmp/protection_mdp.txt

# Changer les permissions
chown stage:stage /home/stage/protection_mdp.gpg
