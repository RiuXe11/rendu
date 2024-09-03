### Mesures de sécurité défensive en entreprise

1. **Pare-feu (Firewall)** : Un dispositif qui surveille et contrôle le trafic réseau entrant et sortant basé sur des règles de sécurité prédéfinies. Les pare-feu permettent de bloquer ou d'autoriser certains types de trafic pour protéger le réseau contre les menaces externes.

2. **Systèmes de détection et de prévention d'intrusions (IDS/IPS)** : Ces systèmes surveillent le réseau pour détecter des activités suspectes (IDS) et peuvent aussi prendre des mesures pour bloquer ou prévenir ces activités (IPS).

3. **Antivirus/Antimalware** : Logiciels conçus pour détecter, prévenir et éliminer les logiciels malveillants tels que les virus, les vers, et les chevaux de Troie.

4. **Gestion des informations et des événements de sécurité (SIEM)** : Solutions qui collectent, analysent et rapportent les informations de sécurité en temps réel à partir de multiples sources pour identifier des incidents de sécurité.

5. **Chiffrement** : Techniques utilisées pour protéger la confidentialité et l'intégrité des données en les transformant en un format inintelligible sans la clé de déchiffrement appropriée.

6. **Contrôle d'accès** : Processus pour garantir que seules les personnes autorisées peuvent accéder aux systèmes et aux données. Cela inclut l'authentification à deux facteurs, les droits d'accès basés sur les rôles, etc.

7. **Segmentation du réseau** : Pratique de diviser un réseau en plusieurs sous-réseaux, chacun isolé des autres, pour limiter la propagation des attaques et faciliter la gestion de la sécurité.

8. **Sauvegarde et récupération** : Politiques et procédures pour sauvegarder les données critiques et assurer leur récupération en cas de perte, de vol, ou de corruption des données.

### Analyse de trafic

L'analyse de trafic est le processus de surveillance et d'examen du trafic réseau pour identifier des schémas, des anomalies ou des activités malveillantes. Elle est essentielle pour comprendre le comportement du réseau et détecter les menaces potentielles.

- **Bénéfices** :
  - Identification des comportements anormaux.
  - Détection précoce des cyberattaques.
  - Optimisation de l'utilisation du réseau.
  - Conformité avec les réglementations de sécurité.

- **Techniques principales** :
  - **Analyse de flux (Flow Analysis)** : Se concentre sur les métadonnées des communications réseau (par exemple, adresse IP source et destination, port, protocole). C'est moins détaillé mais offre une vue d'ensemble rapide du trafic.
  - **Analyse de paquets (Packet Analysis)** : Examine en détail le contenu de chaque paquet de données pour une analyse approfondie. Cela permet de détecter des menaces spécifiques mais demande plus de ressources et de temps.

### IDS (Intrusion Detection System)

Un IDS est un système conçu pour détecter des activités malveillantes ou des violations de politique dans un réseau ou un système informatique. Il alerte les administrateurs lorsqu'une menace potentielle est identifiée.

- **Sous-catégories** :
  - **NIDS (Network-based IDS)** : Surveille le trafic réseau pour détecter des intrusions.
  - **HIDS (Host-based IDS)** : Surveille un hôte spécifique (comme un serveur ou un ordinateur) pour détecter des activités suspectes.

### IPS (Intrusion Prevention System)

Un IPS est similaire à un IDS mais va plus loin en prenant des mesures pour prévenir l'intrusion détectée, comme bloquer le trafic ou isoler le système compromis.

- **Sous-catégories** :
  - **NIPS (Network-based IPS)** : Positionné dans le réseau pour intercepter et bloquer le trafic malveillant.
  - **HIPS (Host-based IPS)** : Installé sur des hôtes spécifiques pour surveiller et prévenir des activités malveillantes.

### Techniques de détection et de prévention

- **Basées sur les signatures** : Utilisent des bases de données de signatures connues de malwares ou d'activités malveillantes pour détecter des menaces. Rapides et efficaces pour les menaces connues, mais inefficaces contre les menaces nouvelles ou modifiées.

- **Basées sur les anomalies** : Se basent sur la définition d'un comportement normal et détectent des déviations par rapport à ce comportement. Capables de détecter des menaces inconnues mais peuvent générer des faux positifs.

- **Basées sur les heuristiques** : Utilisent des règles et des modèles de comportement pour identifier des activités suspectes. Un compromis entre les méthodes basées sur les signatures et les anomalies.

### Présentation succincte de Snort

Snort est un logiciel open source de détection et de prévention d'intrusions (IDS/IPS) développé par Cisco. Il peut analyser le trafic réseau en temps réel, rechercher des signatures de menaces et générer des alertes. Snort est largement utilisé en raison de sa flexibilité, de sa capacité à détecter une large gamme de menaces et de sa communauté active qui contribue à l'amélioration continue des règles de détection. Il peut fonctionner en mode de surveillance, d'enregistrement de paquets ou de détection d'intrusions, ce qui en fait un outil polyvalent pour la sécurité réseau.