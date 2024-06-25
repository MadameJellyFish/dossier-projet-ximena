🛡️Stratégie de sécurisation de l'API

![Stratégie de sécurisation](/Img/cybersecurity.png)

Notre API développée avec PHP Symfony est l'interface entre notre application et les données stockées dans la base de données. 

Symfony offre déjà plusieurs fonctionnalités et pratiques de sécurisation alignées sur les recommandations du guide de l'ANSSI. Voici quelques exemples :

- Contrôle d’Accès Basé sur les Rôles - Role Based Access Control (RBAC) : Celui ci s’appuie sur le principe de sécurisation du « moindre privilège » et par défaut Symfony propose déjà un système de contrôle d’accès basé sur les rôles très flexible et qui assure que seuls les utilisateurs autorisés obtiennent l’accès aux fonctionnalités et informations sensibles de l’application.

- Protection contre les attaques Cross-Site Request Forgery (CSRF) : Symfony intègre par défaut une protection contre les attaques CSRF, qui prévient les attaques où un site malveillant pourrait forcer un utilisateur à exécuter des actions indésirées sur un site web où il est authentifié

- Protection contre les injections SQL (SQLi) et les attaques Cross-Site Scripting (XSS) : Symfony met à disposition des composants dédiés à l'encodage sécurisé et à la vérification des données entrantes, aidant ainsi à prévenir ces types d'attaques. De son côté, React sécurise automatiquement les données injectées dans le DOM, minimisant grandement les risques d'attaques XSS. En traitant les données insérées non pas comme du code HTML ou JavaScript exécutable, mais comme de simples textes, React évite d'interpréter les données potentiellement dangereuses comme sûres. De plus, grâce à son ORM Doctrine, Symfony renforce la sécurité en ajoutant une couche supplémentaire de protection contre les éventuelles injections SQL.

Bien entendu, il est essentiel d’enrichir et de personnaliser ces mesures fournies par Symfony avec des stratégies de sécurité plus spécifiques à notre projet, afin d’assurer une protection optimale.

Une API pour application mobile permet à une application de prendre des données d’une autre application ou d'un serveur. Les API fournissent un accès à des informations stables et structurées, ce qui est exactement ce que les acteurs malveillants recherchent. Pour contrer cette menace nous avons mis en place plusieurs mesures de sécurité :

- Utilisation de JWT : Afin de restreindre l’accès à l’API aux utilisateurs possédant un token. Ce système assure que seuls les utilisateurs autorisés peuvent accéder aux informations sensibles.
- Protocole sécurisé HTTPS : Afin de chiffrer les informations en transit. Cette mesure prévient l'interception et la lecture des informations par des tiers non autorisés.
- Limitation du nombre d'appels à l'API : Un utilisateur peut effectuer à 60 appels par minute pour éviter les abus et les attaques par déni de service.