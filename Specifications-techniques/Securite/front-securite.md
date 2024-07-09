# 🛡️ Stratégie de sécurisation du front-end

![Stratégie de sécurisation du front-end](/img/cybersecurity.png)

Nous avons choisi d'utiliser React, accompagné de TypeScript, pour développer notre interface utilisateur. Cette combinaison offre non seulement une grande flexibilité et une robustesse accrue, mais aussi des outils et des pratiques de sécurité intégrés qui nous permettent de protéger efficacement notre application front-end.

## Mesures de Sécurité Implementées

### Utilisation de TypeScript
TypeScript, un surensemble de JavaScript, aide à prévenir les erreurs courantes en fournissant une vérification statique des types. Cela permet de détecter les anomalies et les erreurs potentielles dès la phase de développement, réduisant ainsi les risques de vulnérabilités dans le code.

### Content Security Policy (CSP)
Un outil puissant pour prévenir les attaques XSS et d'autres injections de contenu. Cela permet de définir une liste blanche d'origines sûres à partir desquelles le navigateur peut charger des ressources. Par exemple, vous pouvez spécifier quelles sources de scripts sont fiables, empêchant l'exécution de scripts malveillants injectés. La mise en œuvre de CSP aide à limiter les dommages potentiels en restreignant où et comment les contenus peuvent être chargés et exécutés.

### SRI (Subresource Integrity) 
Sert à assurer l'intégrité des ressources chargées depuis des origines tierces. SRI permet aux développeurs de spécifier un hash cryptographique pour les fichiers externes, comme les scripts ou les feuilles de style. Le navigateur vérifie alors si le contenu téléchargé correspond au hash fourni avant de l'exécuter. Cela protège contre la modification malveillante de ces ressources, comme lorsqu'un CDN est compromis et sert un script malveillant à la place de celui attendu.

### Protection contre les attaques Cross-Site Scripting (XSS)
React inclut des mécanismes de sécurité intégrés pour se protéger contre les attaques XSS. En traitant automatiquement les données insérées dans le DOM comme du texte et non comme du code exécutable, React minimise les risques de script malveillant.

### SOP (Same-Origin Policy) 
Politique de sécurité mise en œuvre par les navigateurs web pour prévenir les attaques XSS. Elle restreint l'accès et l'interaction des scripts entre différentes origines, définies par le protocole, le domaine et le port. Grâce à la SOP, un script d'une origine donnée ne peut pas lire ou modifier les données d'une autre origine sans autorisation explicite, protégeant ainsi les cookies et les données sensibles des utilisateurs contre les accès malveillants.

### CORS (Cross-Origin Resource Sharing) 
Permet de sécuriser le partage de ressources entre différentes origines. CORS est une extension de la SOP qui permet aux serveurs de spécifier les origines autorisées à accéder à leurs ressources. Cela aide à prévenir les attaques de type "cross-site request forgery" (CSRF) en contrôlant l'accès aux ressources entre différents domaines. Par exemple, un serveur peut utiliser des en-têtes CORS pour autoriser uniquement certaines origines à lire ses données, empêchant ainsi l'accès non autorisé.

## Validation des Formulaires / Nettoyage
Pour garantir la validité des données, nous appliquerons des méthodes de nettoyage à la fois sur le front-end et l'API back-end, nettoyant toutes les données saisies pour prévenir les injections SQL et XSS. De plus, des tokens uniques seront générés pour chaque formulaire afin de contrer les attaques CSRF. Pour éviter les injections SQL, nous utiliserons un ORM (Doctrine ORM, recommandé par Symfony) ainsi que des requêtes préparées, ajoutant ainsi une couche supplémentaire de protection.

## Conclusion
En utilisant React et TypeScript, et en implémentant ces mesures de sécurité rigoureuses, nous nous assurons que notre front-end est bien protégé contre les menaces potentielles. Cela nous permet de fournir une expérience utilisateur sécurisée et fiable, tout en protégeant les données sensibles de nos utilisateurs.