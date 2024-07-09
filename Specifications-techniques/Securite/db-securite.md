# 🛡️ Stratégie de sécurisation de la base de données

![Stratégie de sécurisation](/Img/cybersecurity.png)

Notre application utilise une base de données pour stocker les données sensibles de nos utilisateurs, telles que leurs informations personnelles, leurs coordonnées et les données de paiement. Nous avons choisi de développer la base de données avec PostgreSQL.

## Menaces Principales

- Cross-Site Scripting (XSS) : Cette vulnérabilité permet à un attaquant d’injecter du code malveillant dans les pages web vues par d’autres utilisateurs. Notre application offre de multiples points d'entrée pour les données, ce qui pourrait être exploité pour exécuter du code malveillant sur l'appareil d'un utilisateur, compromettant sa sécurité. posant un risque direct à la confidentialité des données personnelles.
- Cross-Site Request Forgery (CSRF) : Cette attaque force l’utilisateur final à exécuter des actions non désirées sur une application web où il est authentifié. Cela peut compromettre l’intégrité des transactions et des informations de l’utilisateur.
- Injection SQL (SQLi) : Les attaquants peuvent exploiter des vulnérabilités dans la gestion des bases de données pour accéder, manipuler ou supprimer des données sensibles, y compris des personnelles stockées. Cette menace constitue une de nos principales préoccupations. La raison en est l'impact considérable qu'une telle attaque peut avoir sur la confidentialité et l'intégrité des données personnelles et financières des utilisateurs. Assurer la sécurité de ces informations est essentiel pour maintenir la confiance de nos clients et la réputation de notre application.

## Mesures de Sécurité Mises en Place

- La défense en profondeur : Nous avons intégré le principe de défense en profondeur pour mettre en place plusieurs niveaux de sécurité sur nos différents points d’entrée. Cela signifie que chaque couche de notre application, de l’interface utilisateur jusqu’aux données stockées, est conçue pour résister aux attaques.
- Réduction de la surface d'attaque : Nous limitons autant que possible les points par lesquels une attaque peut être lancée. En simplifiant notre architecture et en exposant le moins de fonctionnalités nécessaires, nous minimisons les opportunités pour les attaquants de trouver et d'exploiter des vulnérabilités. Pour sécuriser notre base de données PostgreSQL, seules les IP autorisées pourront accéder au port 5432.
- Moindre privilège : Nous créons des comptes utilisateurs dédiés uniquement à PostgreSQL, avec des permissions limitées aux fichiers et ressources nécessaires. Nous limitons les droits et n'accordons les permissions qu'aux personnes autorisées.
- Protection contre les injections SQL (SQLi) : Nous utilisons l'ORM Doctrine de Symfony pour ajouter une couche supplémentaire de sécurité contre les injections SQL grâce à l'emploi de requêtes préparées.

## 🔐 Authentification

Pour combattre l'usurpation d'identité, nous suivons une politique de mots de passe stricte incluant la complexité, la longueur minimale, et la vérification des critères. Nous utilisons le hashage SHA256 avec salage pour le stockage sécurisé des mots de passe.

### Politique des mots de passe

Pour lutter contre l'usurpation d'identité, nous adoptons une politique de mots de passe stricte qui inclut des exigences de complexité, une longueur minimale et une vérification approfondie des critères. Nos mots de passe doivent combiner des lettres majuscules et minuscules, des chiffres, et des caractères spéciaux, avec une longueur minimale de 8 caractères. Pour renforcer la sécurité, nous mettons en œuvre le hashage **SHA256**, accompagné d'un **salage**, pour un stockage sécurisé des mots de passe.

Notre système intègre des mesures de sécurité supplémentaires telles la réinitialisation de mot de passe, qui doit être différent du précédent, après trois tentatives de connexion échouées. 
Cette mesure vise à décourager les attaques par force brute. De plus, nous envoyons des notifications par email aux utilisateurs en cas d'activités suspectes détectées sur leur compte, comme des tentatives de connexion inhabituelles ou des changements de mots de passe, pour garantir une vigilance accrue.

### Gestion des Sessions et Authentification

Les **sessions sont limitées à une durée de validité de deux semaines** avec obligation de se reconnecter pour les actions sensibles (paiement, reservation, changement de mot de passe ...). Nous utiliserons des **JWT** et des cookies sécurisés pour une gestion robuste des sessions.

## 🪪 Gestion des Identités Utilisateurs avec les UUID

Pour renforcer la sécurité et la confidentialité des données de nos utilisateurs, notre application adopte une stratégie d'identification basée sur les Unique User ID (UUID), et plus spécifiquement sur la version 4 (UUIDv4). 
Les UUIDv4 sont des identifiants générés de manière totalement aléatoire. Cela rend la tâche très difficile pour l’attaquant qui essaierait de voler des informations en devinant ces numéros, car il n'y a aucun ordre ou logique dans la manière dont ils sont faits.

De ce fait, l'utilisation des **UUIDv4** constitue une barrière robuste contre les tentatives d'accès non autorisé, contribuant significativement à la protection des informations de nos utilisateurs.

## 📓 Journalisation / Rapport des événements

Nous prévoyons d'intégrer un système de journalisation dans notre application.
La journalisation permet d'avoir un historique structuré et chronologique des activités de l'application. Le suivi et l'enregistrement des événements importants tels que les erreurs et les actions effectuées sont primordiaux pour détecter les comportements suspects et diagnostiquer les problèmes. 

## ORM contre les Injections SQL
Pour protéger notre application contre les injections SQL (SQLi), nous utilisons l'ORM Doctrine de Symfony. L'ORM ajoute une couche de sécurité en utilisant des requêtes préparées, qui traitent les entrées utilisateur comme des paramètres et non comme du code SQL. Cela empêche les attaquants d'injecter du code malveillant.
L'ORM fournit une couche d'abstraction qui sépare le code SQL de la logique métier, réduisant ainsi les risques de vulnérabilités et simplifiant l'accès à la base de données. De plus, l'ORM gère automatiquement les requêtes et transactions, assurant l'intégrité des données.

## 💾 Stratégie de sauvegarde

Mettre en place une stratégie de sauvegarde est crucial pour protéger les données de l'application contre les incidents tels que pannes, erreurs ou attaques. Les données de réservation sont vitales et  leur perte affecterait gravement l'expérience utilisateur, le fonctionnement de l'application et pourrait entrainer un cout financier non négligable pour le club. Nous prévoyons dans notre cas au moins une sauvegarde complète quotidienne, idéalement la nuit, et de deux ou trois sauvegardes partielles des réservations durant la journée.

##  Le chiffrement des données sensibles et l'utilisation des UUID 
Pour protéger les données sensibles dans notre base de données, nous utilisons le chiffrement, réduisant ainsi les risques de vol en cas d'accès non autorisé. Nous employons également des UUID (Universally Unique IDentifiers) pour la gestion des identités utilisateurs. Les UUID, générés de manière aléatoire, rendent difficile la prédiction des identifiants, renforçant ainsi la sécurité et la confidentialité des données.
Pour protéger les données sensibles stockées dans la base de données. Cela permet de réduire les risques de vol de données en cas d'accès non autorisé à la base de données.

## Conclusion
Nous avons couvert plusieurs méthodes d’authentification différentes, y compris celles intégrées au serveur PostgreSQL. Il est toutefois crucial que la base de données soit correctement sécurisée pour empêcher tout accès non autorisé aux données. En suivant ces mesures de sécurité, nous sommes en mesure de réduire considérablement les risques d'attaques contre la base de données et de protéger les données sensibles de nos utilisateurs.