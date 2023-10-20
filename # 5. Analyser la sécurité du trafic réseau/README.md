# Analyser la sécurité du trafic réseau


## 1. Capturer le processus DORA du protocole DHCP

![Wireshark check DORA](https://cdn.discordapp.com/attachments/1036557173943185491/1164500994323918938/image.png?ex=65437110&is=6530fc10&hm=35d20e772053abea3784043e3adbd7a550705b93e439c047c2e9c91945c1fc48&)

## 2. Qu’est ce que le DHCP Starvation / snooping ? Rogue DHCP ?

- DHCP Starvation / snooping 
    - DHCP Starvation : Cette attaque consiste à épuiser le pool d'adresse IP du serveur DHCP avec un nombre énorme de requêtes. L'attaquant envoie de nombreuses requêtes DHCP avec différentes adresses MAC, ce qui se traduit par l'utilisation de toutes les adresses IP disponibles. Toutes les nouvelles machines qui essaieront de se connecter au réseau n'auront pas d'IP.

    - DHCP Snooping : Le DHCP Snooping est une fonction de sécurité utilisée dans les réseaux Ethernet pour protéger le protocole DHCP contre les attaques. Il fonctionne en surveillant les échanges DHCP entre les clients et les serveurs, en enregistrant ces informations, et en rejetant les messages DHCP qui ne correspondent pas aux enregistrements.

- Rogue DHCP : Un "Rogue DHCP" est un serveur DHCP non autorisé et potentiellement malveillant dans un réseau. Il attribue des adresses IP et des configurations de réseau aux appareils, créant des problèmes de sécurité et de performance.

## 3. Que ce passe lors du « ipconfig /release » (windows) ? D’un point de vue sécurité quel peut etre l'enjeu ?

- Un " ipconfig /release " permet à une machine (windows) de ne plus avoir d'adresse IP. D'un point de vue sécurité, cela peut être très dangereux si un Rogue DHCP est en place sur le réseaux.

## 4. Quelle fonctionnalité propose CISCO pour se prémunir de ce type d’attaque ?

- Cisco propose plusieurs fonctionnalités de sécurité pour se prémunir contre les attaques liées aux serveurs DHCP malveillants (Rogue DHCP) et renforcer la sécurité du réseau. Parmi ces fonctionnalités, on trouve le "DHCP Snooping" pour surveiller et filtrer le trafic DHCP, ainsi que d'autres mesures telles que le "Port Security," le "Dynamic ARP Inspection (DAI)," l'"IP Source Guard," l'utilisation de méthodes sécurisées comme SSH et SNMPv3, ainsi que des solutions de contrôle d'accès au réseau (Network Access Control, ou NAC). Ces mesures aident à maintenir un réseau plus sûr en détectant et en prévenant les menaces potentielles.

## 5. Capturer une requête DNS et sa réponse

![Wireshark check DNS](https://cdn.discordapp.com/attachments/1036557173943185491/1164501353834483783/image.png?ex=65437166&is=6530fc66&hm=c5ad6b2fca9c412d957229c8e9fbceb5b26dd7a61c31ebb23822ff74402f0868&)

## 6. Qu’est-ce que le DSN Spoofing ? Comment s’en protéger ?

- Le DNS Spoofing, ou DNS Cache Poisoning, est une attaque visant à corrompre les données du système de noms de domaine (DNS) d'un réseau. L'attaquant envoie de fausses informations aux serveurs DNS, corrompt les caches DNS locaux et redirige le trafic vers des sites web malveillants. Les conséquences peuvent inclure l'accès à des sites de phishing et des problèmes de sécurité. Pour se protéger, il est essentiel de maintenir à jour les logiciels DNS, d'utiliser la validation DNSSEC, des serveurs DNS de confiance et éventuellement un VPN pour chiffrer les communications DNS.

## 7. Qu’est-ce que DNS Sec ? DNS over TLS / HTTPS ?

- DNS Sec : DNSSEC (Domain Name System Security Extensions) est une série de protocoles et d'extensions de sécurité pour le système de noms de domaine (DNS). Il ajoute des signatures numériques aux enregistrements DNS pour garantir leur authenticité et intégrité. DNSSEC établit une hiérarchie de confiance et permet aux clients DNS de valider ces signatures, renforçant ainsi la sécurité du DNS et réduisant les risques d'attaques de falsification DNS.

- DNS over TLS/HTTPS : DNS over TLS (DoT) et DNS over HTTPS (DoH) sont des protocoles de sécurité qui chiffrent les requêtes DNS entre les clients et les serveurs DNS. DoT utilise le chiffrement TLS pour sécuriser les requêtes DNS, tandis que DoH encapsule les requêtes DNS dans des requêtes HTTPS. Ces protocoles visent à améliorer la confidentialité des utilisateurs en empêchant les tiers de surveiller ou de modifier leurs requêtes DNS. Ils sont utilisés pour renforcer la sécurité et la confidentialité des connexions DNS.

## 8. Dans quels cas trouve-t-on du DNS sur TCP ?

- Certaines situations peuvent nécessiter l'utilisation du protocole TCP pour les communications DNS. Cela inclut des cas tels que des réponses DNS volumineuses qui ne tiennent pas dans un paquet UDP, les transferts de zone DNS, l'utilisation de DNSSEC, et dans des environnements de sécurité renforcée. Le choix entre UDP et TCP dépend des besoins spécifiques du réseau et des applications. Le DNS sur TCP est utilisé pour garantir la fiabilité et la cohérence des données dans ces situations particulières.

## 9. Capturer un flux HTTP

![Wireshark check HTTP](https://cdn.discordapp.com/attachments/1036557173943185491/1164509584615014443/image.png?ex=65437910&is=65310410&hm=6ad985f231c9927d318d7473a89600506445f0bb807951f3f81e9a223e84b657&)

## 10. Qu’est-ce que le HTTP Smuggling ? Donner un exemple de CVE

- HTTP Smuggling : L'HTTP Smuggling (ou HTTP Request Smuggling) est une technique d'attaque qui exploite les variations de traitement des requêtes HTTP par les serveurs web et les proxies. L'attaquant crée des requêtes HTTP spécialement conçues pour induire en erreur le serveur et le proxy, ce qui peut permettre à l'attaquant d'exécuter des actions malveillantes non détectées par les systèmes de sécurité. Pour se protéger contre de telles attaques, il est essentiel de maintenir à jour les serveurs web et les proxies, de suivre les bonnes pratiques de sécurité et de surveiller le trafic HTTP pour détecter toute activité suspecte.

- CVE : [CVE-2022-26377](https://nvd.nist.gov/vuln/detail/CVE-2022-26377)

## 11. Comment mettre en place la confidentialité pour ce service ?

- Pour prévenir le HTTP Smuggling et d'utiliser le protocol "HTTPS".

## 12. Qu’est-ce qu’une PKI ?

- Une PKI (Infrastructure à Clés Publiques) est un système qui gère les certificats numériques et les clés publiques utilisées pour sécuriser les communications électroniques. Elle comprend une Autorité de Certification (CA) qui émet des certificats, des paires de clés publiques et privées pour les utilisateurs, un répertoire pour stocker les informations, et des protocoles de sécurité. Les certificats numériques sont utilisés pour authentifier les entités, établir des connexions sécurisées, signer électroniquement des documents et protéger la confidentialité des données en ligne. La PKI est essentielle pour garantir la sécurité et la confiance dans les communications numériques.

## 13. Capturer un mot de passe FTP ou Telnet (mettre en place les services si nécessaire)

![Wireshark check password FTP](https://cdn.discordapp.com/attachments/1036557173943185491/1164551462735585300/image.png?ex=6543a011&is=65312b11&hm=330856401f106a3b5b4906d3ca0a6e716992729bdcd4a99da6be28fbf4145d70&)

## 14. Comment mettre en place la confidentialité pour ce service ?

- Pour éviter de voir un mot de passe en clair lors de l'analyse d'une connexion FTP avec Wireshark, vous pouvez chiffrer la connexion FTP en utilisant FTPS (FTP sécurisé) ou SFTP (SSH File Transfer Protocol) au lieu de FTP non sécurisé. Le chiffrement est essentiel pour protéger le mot de passe et les données pendant la transmission. Assurez-vous que votre serveur FTP et votre client FTP sont configurés pour utiliser FTPS ou SFTP, et ainsi vos données resteront confidentielles.

## 15. Capturer un handshake TLS – puis déchiffrer le trafic avec votre certificat

## 16. Qu’est-ce qu’une autorité de certification (AC) racine ? Qu'est qu'une AC intermediaire ?

- Une autorité de certification racine (Root CA) est le sommet de la hiérarchie des autorités de certification. Elle émet des certificats pour d'autres autorités de certification intermédiaires et est la source de confiance ultime.

- Une autorité de certification intermédiaire (Intermediate CA) se situe entre l'autorité de certification racine et les certificats serveur ou clients finaux. Elle est responsable de l'émission de certificats spécifiques, comme les certificats SSL/TLS, et dépend de l'autorité de certification racine pour valider son autorité.

## 17. Connectez-vous sur https://taisen.fr et affichez la chaine de confiance du certificat

![Chaine confiance](https://cdn.discordapp.com/attachments/1036557173943185491/1164839097211305984/image.png?ex=6544abf2&is=653236f2&hm=438d3865107b64c66b23c948048c1261b2959f3b4b53e0d52a4141fc382ed1ce&)

## 18. Capturer une authentification Kerberos (mettre en place le service si nécessaire)

![Auth KRB5](https://cdn.discordapp.com/attachments/1036557173943185491/1164841602108370954/image.png?ex=6544ae47&is=65323947&hm=8c89954565ef116c9327d760bf78d26d648f85002fd142c6d9e828cc304606df&)

## 19. Capturer une authentification RDP (mettre en place le service si nécessaire)

![Check RDP](https://cdn.discordapp.com/attachments/1036557173943185491/1164845897750949898/image.png?ex=6544b247&is=65323d47&hm=d6e0be169e16d76b17a9bec6c80f2a67dd9a7336ff55cf4c735b12906f8b9022&)

## 20. Quelles sont les attaques connues sur NetLM ?

NetLM présente des vulnérabilités connues, notamment les suivantes :

1. **Attaques de rétroingénierie de hachage LM** : Le hachage LM divise les mots de passe en deux parties de 7 caractères chacune, les transforme en majuscules et ajoute du remplissage si nécessaire. Il est vulnérable à l'attaque de rétroingénierie, où un attaquant peut retrouver le mot de passe d'origine en utilisant des tables de précalcul (tables arc-en-ciel) ou des attaques de force brute.

2. **Utilisation de hachages faibles** : Les hachages LM sont relativement faibles en termes de sécurité, car ils sont sensibles à des attaques relativement simples. Les mots de passe faibles ou courants sont particulièrement vulnérables.

3. **Défi-réponse faible** : NetLM utilise un mécanisme de défi-réponse qui est vulnérable à certaines attaques d'usurpation ou d'écoute passive. Il n'offre pas la même sécurité que les mécanismes de défi-réponse plus robustes utilisés dans les systèmes plus récents.

4. **Tables arc-en-ciel** : Les tables arc-en-ciel peuvent être utilisées pour attaquer les hachages LM en précalculant une grande quantité de hachages possibles, puis en les comparant aux hachages stockés pour trouver des correspondances.

## 21. Capturer une authentification WinRM (Vous pouvez utiliser EvilWinRM si nécessaire côté client.)

![Wireshark check WinRM](https://cdn.discordapp.com/attachments/1036557173943185491/1164849209195900948/image.png?ex=6544b55d&is=6532405d&hm=2e32b8afba10a8658e18e961f2bf98a586c459ed31f348de99604940d92474d3&)

## 22. Capturer une authentification SSH ou SFTP (mettre en place le service si nécessaire)

![Wireshark check SSH-SFTP](https://cdn.discordapp.com/attachments/1036557173943185491/1164869722081337465/image.png?ex=6544c877&is=65325377&hm=706cb8d0b31ee9ee626a0e4e3d7afa2c5b155ebbea9a6fad8f55adf27b84e5c4&)

## 23. Intercepter un fichier au travers du protocole SMB

![Wireshark check SMB](https://cdn.discordapp.com/attachments/1036557173943185491/1164871957460832287/image.png?ex=6544ca8c&is=6532558c&hm=fd068cb7e758c37d29964f6c885d2977b0419e581ed1df30b93d262ae001de94&)

## 24. Comment proteger l'authenticité et la confidentialité d'un partage SMB ?

- Pour protéger l'authenticité et la confidentialité d'un partage SMB (Server Message Block) :

1. Utilisez SMBv3.
2. Activez le chiffrement SMB pour sécuriser les données en transit.
3. Utilisez une authentification forte et configurez des autorisations d'accès appropriées.
4. Utilisez un pare-feu pour restreindre l'accès au serveur SMB.
5. Gérez les utilisateurs et les groupes efficacement.
6. Mettez en place une surveillance des activités et des journaux d'audit.
7. Gardez le système et les logiciels à jour.
8. Protégez contre les rançongiciels avec des sauvegardes.
9. Limitez l'accès distant et utilisez des VPN si nécessaire.
10. Sensibilisez les utilisateurs aux risques de sécurité et aux bonnes pratiques.

## 25. Quels sont les flags TCP ?

![Wireshark check flag](https://cdn.discordapp.com/attachments/1036557173943185491/1164872918426189864/image.png?ex=6544cb72&is=65325672&hm=5ac01e399bbd70f5bb29e211e8684d1058b3cbd7299bc3b6ed92a5eaa97ed915&)