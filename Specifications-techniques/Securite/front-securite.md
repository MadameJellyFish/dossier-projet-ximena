## 🛡️ Stratégie de sécurisation du front-end

![Stratégie de sécurisation du front-end](/img/cybersecurity.png)

Avant de détailler les mesures spécifiques, il est important d’introduire trois concepts fondamentaux de notre stratégie de sécurisation qui est le concept des « trois piliers » :

- La défense en profondeur : Notre stratégie intègre le principe de défense en profondeur, visant à mettre en place plusieurs niveaux de sécurité sur nos différents points d’entrée. Cela signifie que chaque couche de notre application, de l’interface utilisateur jusqu’aux données stockées, est conçue pour résister aux attaques, en créant ainsi plusieurs barrières de sécurité successives.

- Réduction de la surface d'attaque : Ce principe vise à limiter autant que possible les points par lesquels une attaque peut être lancée. En simplifiant notre architecture et en exposant le moins de fonctionnalités nécessaires, nous minimisons les opportunités pour les attaquants de trouver et d'exploiter des vulnérabilités. Cela passe par la désactivation des services inutilisés, la limitation des ports ouverts, et l'application des mises à jour de sécurité pour tous nos systèmes. Dans le cadre de notre projet l’exposition des ports pourrait se limiter aux ports : ◦ Échange des informations en HTTP et HTTPS (port 80 et port 443) ◦ Protocol Secure Shell (SSH) (port 22) ◦ PostgreSQL (port 5432)

- Moindre privilèges : Le principe de moindre privilège consiste à limiter les droits et à ne donner les permissions qu'aux personnes autorisées. (exemple un utilisateur « lambda » ne pourra pas avoir accès aux données administrateur.)

Validation des Formulaires / Nettoyage

Pour garantir la validité des données, nous appliquerons des méthodes de nettoyage à la fois sur le front-end et l'API back-end, nettoyant toutes les données saisies pour prévenir les injections SQL et XSS. De plus, des tokens uniques seront générés pour chaque formulaire afin de contrer les attaques CSRF. Pour éviter les injections SQL, nous utiliserons un ORM (Doctrine ORM, recommandé par Symfony) ainsi que des requêtes préparées, ajoutant ainsi une couche supplémentaire de protection.

SOP, CORS, CSP, SRI

- SOP (Same-Origin Policy) : Politique de sécurité mise en œuvre par les navigateurs web pour prévenir les attaques XSS. Elle restreint l'accès et l'interaction des scripts entre différentes origines, définies par le protocole, le domaine et le port. Grâce à la SOP, un script d'une origine donnée ne peut pas lire ou modifier les données d'une autre origine sans autorisation explicite, protégeant ainsi les cookies et les données sensibles des utilisateurs contre les accès malveillants.

- CORS (Cross-Origin Resource Sharing) : Permet de sécuriser le partage de ressources entre différentes origines. CORS est une extension de la SOP qui permet aux serveurs de spécifier les origines autorisées à accéder à leurs ressources. Cela aide à prévenir les attaques de type "cross-site request forgery" (CSRF) en contrôlant l'accès aux ressources entre différents domaines. Par exemple, un serveur peut utiliser des en-têtes CORS pour autoriser uniquement certaines origines à lire ses données, empêchant ainsi l'accès non autorisé.

- CSP (Content Security Policy) : Un outil puissant pour prévenir les attaques XSS et d'autres injections de contenu. Cela permet de définir une liste blanche d'origines sûres à partir desquelles le navigateur peut charger des ressources. Par exemple, vous pouvez spécifier quelles sources de scripts sont fiables, empêchant l'exécution de scripts malveillants injectés. La mise en œuvre de CSP aide à limiter les dommages potentiels en restreignant où et comment les contenus peuvent être chargés et exécutés.

- SRI (Subresource Integrity) : Sert à assurer l'intégrité des ressources chargées depuis des origines tierces. SRI permet aux développeurs de spécifier un hash cryptographique pour les fichiers externes, comme les scripts ou les feuilles de style. Le navigateur vérifie alors si le contenu téléchargé correspond au hash fourni avant de l'exécuter. Cela protège contre la modification malveillante de ces ressources, comme lorsqu'un CDN est compromis et sert un script malveillant à la place de celui attendu.