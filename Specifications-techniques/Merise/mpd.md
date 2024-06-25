# 🪄 Scripts SQL base de données

Après avoir généré le script SQL à partir du MLD avec l'outil Looping, nous avons apporté quelques modifications manuelles. Par exemple, nous avons choisi d'utiliser des UUID pour les clés primaires dans les tables contenant des informations sensibles, telles que les tables "admins" et "users". Cela permet d'assurer une sécurité accrue pour les données de nos utilisateurs. Nous avons également ajusté certains types de données et contraintes d'intégrité pour répondre aux besoins spécifiques de notre application de réservation de terrains sportifs.

[Script SQL](/Specifications-techniques/Merise/script_sql.sql)