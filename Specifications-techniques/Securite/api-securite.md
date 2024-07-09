# 🛡️Stratégie de sécurisation de l'API

![Stratégie de sécurisation](/img/cybersecurity.png)

Notre API, développée avec PHP Symfony, sert d'interface entre notre application et les données stockées dans la base de données. Afin d'assurer la sécurité des données et de l'application, nous avons mis en place plusieurs mesures de protection.

##  Sécurisation fourni par Symfony
Symfony offre déjà plusieurs fonctionnalités et pratiques de sécurisation alignées sur les recommandations du guide de l'ANSSI. Voici quelques exemples :

### Contrôle d’Accès Basé sur les Rôles - Role Based Access Control (RBAC) 
Celui ci s’appuie sur le principe de sécurisation du « moindre privilège » et par défaut Symfony propose déjà un système de contrôle d’accès basé sur les rôles très flexible et qui assure que seuls les utilisateurs autorisés obtiennent l’accès aux fonctionnalités et informations sensibles de l’application.

### Protection contre les attaques Cross-Site Request Forgery (CSRF) 
Symfony intègre par défaut une protection contre les attaques CSRF, qui prévient les attaques où un site malveillant pourrait forcer un utilisateur à exécuter des actions indésirées sur un site web où il est authentifié

### Protection contre les injections SQL (SQLi) et les attaques Cross-Site Scripting (XSS) 
Symfony met à disposition des composants dédiés à l'encodage sécurisé et à la vérification des données entrantes, aidant ainsi à prévenir ces types d'attaques. De son côté, React sécurise automatiquement les données injectées dans le DOM, minimisant grandement les risques d'attaques XSS. En traitant les données insérées non pas comme du code HTML ou JavaScript exécutable, mais comme de simples textes, React évite d'interpréter les données potentiellement dangereuses comme sûres. De plus, grâce à son ORM Doctrine, Symfony renforce la sécurité en ajoutant une couche supplémentaire de protection contre les éventuelles injections SQL.

Bien entendu, il est essentiel d’enrichir et de personnaliser ces mesures fournies par Symfony avec des stratégies de sécurité plus spécifiques à notre projet, afin d’assurer une protection optimale.

## Mesures de Sécurité Spécifiques à Notre API
Toutes les communications entre l'application et l'API sont chiffrées en utilisant HTTPS. Cela empêche les tiers non autorisés d'intercepter et de lire les informations en transit, garantissant que les mots de passe et autres données sensibles sont toujours transmis de manière sécurisée.

### Utilisation de JWT
Nous utilisons des JSON Web Tokens (JWT) pour restreindre l’accès à l’API aux utilisateurs possédant un token valide. Ce système garantit que seuls les utilisateurs autorisés peuvent accéder aux informations sensibles.

### Protocole sécurisé HTTPS 
Toutes les communications entre l'application et l'API sont chiffrées en utilisant HTTPS. Cela empêche les tiers non autorisés d'intercepter et de lire les informations en transit.

### Limitation du nombre d'appels à l'API
Un utilisateur peut effectuer à 60 appels par minute pour éviter les abus et les attaques par déni de service.

### Monitoring
Nous avons établi un système de surveillance continue qui joue un rôle crucial dans la protection des données. Ce système nous permet d'enregistrer en permanence toutes les activités sur l'API, facilitant la détection immédiate de tout comportement inhabituel ou suspect. L'utilisation d'outils de surveillance spécialisés nous aide à analyser le trafic en temps réel et à garder un œil vigilant sur les indicateurs clés, nous permettant ainsi de réagir rapidement à toute anomalie détectée. De plus, nous gardons précieusement un historique de qui a accédé à l'API, tout en respectant les règles de protection des données. Cette approche nous permet de rester toujours un pas devant les menaces.

## Conclusion
La sécurité des API est ainsi en passe de rapidement devenir l'une des principales priorités et l'un des principaux sujets de préoccupation des responsables de l'informatique et de la sécurité.
En combinant les fonctionnalités de sécurité intégrées de Symfony avec des mesures spécifiques à notre projet, nous assurons une protection robuste et complète de notre API. Cela nous permet de sécuriser les données de nos utilisateurs et de garantir la confiance dans notre système.