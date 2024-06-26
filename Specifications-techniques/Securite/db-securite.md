# 🛡️ Stratégie de sécurisation de la base de données

![Stratégie de sécurisation](/Img/cybersecurity.png)

Notre application utilise une base de données pour stocker les données sensibles de nos utilisateurs, telles que leurs informations personnelles, leurs coordonnées et les données de paiement. Pour assurer la protection de ces données, nous avons mis en place les mesures suivantes :

- La défense en profondeur : nous avons intégré le principe de défense en profondeur pour mettre en place plusieurs niveaux de sécurité sur nos différents points d’entrée. Cela signifie que chaque couche de notre application, de l’interface utilisateur jusqu’aux données stockées, est conçue pour résister aux attaques.
- Réduction de la surface d'attaque : nous limitons autant que possible les points par lesquels une attaque peut être lancée. En simplifiant notre architecture et en exposant le moins de fonctionnalités nécessaires, nous minimisons les opportunités pour les attaquants de trouver et d'exploiter des vulnérabilités. Dans le cadre de notre projet, l’exposition des ports pourrait se limiter aux ports suivants : Échange des informations en HTTP et HTTPS (port 80 et port 443), Protocol Secure Shell (SSH) (port 22) et PostgreSQL (port 5432).
- Moindre privilège : nous limitons les droits et ne donnons les permissions qu'aux personnes autorisées. Par exemple, un utilisateur « lambda » ne pourra pas avoir accès aux données administrateur.
- Protection contre les injections SQL (SQLi) : nous utilisons l'ORM Doctrine de Symfony pour ajouter une couche supplémentaire de sécurité contre les injections SQL grâce à l'emploi de requêtes préparées.

Une des principales menaces que nous avons identifiées pour notre application est l'injection SQL (SQLi). Les attaquants peuvent exploiter des vulnérabilités dans la gestion des bases de données pour accéder, manipuler ou supprimer des données sensibles, y compris des données personnelles stockées. Cette menace constitue une de nos principales préoccupations. La raison en est l'impact considérable qu'une telle attaque peut avoir sur la confidentialité et l'intégrité des données personnelles et financières des utilisateurs. Assurer la sécurité de ces informations est essentiel pour maintenir la confiance de nos clients et la réputation de notre application.

Pour renforcer la sécurité de la base de données, nous avons également mis en place les mesures suivantes :

- Chiffrement des données sensibles : nous utilisons le chiffrement pour protéger les données sensibles stockées dans la base de données. Cela permet de réduire les risques de vol de données en cas d'accès non autorisé à la base de données.
- Sauvegardes régulières : nous effectuons des sauvegardes régulières de la base de données pour éviter la perte de données en cas de défaillance matérielle ou de catastrophe naturelle.
- Surveillance et journalisation : nous surveillons en permanence l'activité de la base de données pour détecter tout comportement suspect ou malveillant. Nous enregistrons également toutes les actions effectuées sur la base de données pour faciliter la détection et l'analyse des incidents de sécurité.
- Mises à jour régulières : nous appliquons régulièrement les mises à jour de sécurité pour le système de gestion de base de données et les logiciels associés pour corriger les vulnérabilités connues.
- Contrôle d'accès : nous limitons l'accès à la base de données aux personnes autorisées et nous mettons en place des contrôles d'accès stricts pour empêcher tout accès non autorisé.

En suivant ces mesures de sécurité, nous sommes en mesure de réduire considérablement les risques d'attaques contre la base de données et de protéger les données sensibles de nos utilisateurs.