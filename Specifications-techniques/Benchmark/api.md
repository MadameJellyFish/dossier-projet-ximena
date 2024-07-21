# 📄 Proposition d'une API

![API](/img/api.png)

Pour construire notre API, le choix s'est porté sur l'architecture REST plutôt qu'une API GraphQL. 

Voici pourquoi cette architecture est au cœur de notre projet :

- **Compatibilité universelle :** Notre API vise à être accessible depuis diverses applications et dispositifs. Grâce à REST, qui repose sur le standard HTTP, nous assurons une large compatibilité, facilitant ainsi son intégration.

- **Facilité d'évolution :** L'architecture REST offre une grande souplesse pour les mises à jour futures. Les modifications ou ajouts de ressources se font sans incidence sur l'utilisation actuelle, un atout majeur pour l'adaptabilité de notre API.

- **Optimisation des performances :** Dans le contexte d'un nombre croissant de requêtes, REST se distingue par sa capacité à optimiser la charge serveur. Cette efficience contribue directement à la réactivité et à la stabilité de notre service.

- **Clarté structurelle :** L'assignation d'une URL spécifique à chaque ressource simplifie la conception et la gestion de notre API. Cette organisation favorise une meilleure division logique et une maintenance allégée.

L'implémentation de REST dans notre projet a pour but proposer une API qui soit à la fois universellement intégrable, aisément extensible, hautement performante et intuitive à gérer.
