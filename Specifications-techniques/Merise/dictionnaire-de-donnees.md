## 📖 Dictionnaire de données

| Entité  | Attribut         | Type de données | Longueur | Contraintes      | Description                                          | Exemple                                     |
|---------|------------------|-----------------|----------|------------------|------------------------------------------------------|--------------------------------------------|
| Users   | user_uuid        | UUID            | -        | UNIQUE, REQUIS, PRIMARY KEY   | Identifiant unique de l'utilisateur                 | '03183852-55b9-4808-954c-d390fbbed6f2'                                           |
|         | first_name        | VARCHAR         | 255      | REQUIS           | Prénom de l'utilisateur                              | 'Alain'                                       |
|         | last_name         | VARCHAR         | 255      | REQUIS           | Nom de l'utilisateur                                 | 'Parfait'                                     |
|         | email             | VARCHAR         | 255      | UNIQUE, REQUIS           | Adresse email de l'utilisateur                       | 'alain@example.com '                          |
|         | password          | VARCHAR         | 255      | REQUIS           | Mot de passe email de l'utilisateur                  | 'p4ssw0rD1!'                          |
|         | birth_date        | DATE            | -        | REQUIS           | Date de naissance de l'utilisateur                   | 1990-01-01                                  |
| Addresses | addresse_id       | SERIAL        | -        | UNIQUE, REQUIS, PRIMARY KEY   | Identifiant unique de l'adresse                 | 80                                           |
|          | address           | VARCHAR         | 255      | REQUIS           | Adresse du membre                     | '37 rue de Bancel'                     |
|          | city           | VARCHAR         | 255      | REQUIS           | Ville de l'adresse du membre                     | 'Lyon'                     |
|          | country           | VARCHAR         | 255      | REQUIS           | Pays de l'adresse du membre                     | 'France'                     |
|          | zip_code           | VARCHAR         | 50      | REQUIS           | Code postale de l'adresse du membre                     | '69007'                     |
| Sports | sport_id       | SERIAL        | -        | UNIQUE, REQUIS, PRIMARY KEY   | Identifiant unique du sport                 | 3                                           |
|          | sport_name           | VARCHAR         | 50      | REQUIS           | Nom du sport                     | 'Badminton'                     |
| Sport_Fields | sport_field_id       | SERIAL        | -        | UNIQUE, REQUIS, PRIMARY KEY   | Identifiant unique du terrain selon le sport                 | 8                                           |
|          | numero           | INTEGER          | 50      | REQUIS           | Numero du terrain                     | 5                     |
|             | sport_id       | INTEGER        | -        | UNIQUE, REQUIS, FOREIGN KEY (référence Sports)   | Identifiant unique du sport                 | 3                                           |
| Fields_Availabilities | field_availability_id       | SERIAL        | -        | UNIQUE, REQUIS, PRIMARY KEY   | Identifiant unique de la disponibilité horaire                 | 152                                           |
|            | field_start_time       | TIME        | -        | REQUIS      |  Heure de début de la disponibilité horaire d'un terrain de sport                 | '09:00:00'                                           |
|            | field_end_time       | TIME        | -        | REQUIS      | Heure de fin de la disponibilité horaire d'un terrain                | '10:00:00'                                           |
|            | availability_date       | DATE        | -        | REQUIS      | Date de la disponibilité horaire d'un terrain de sport                | '2024-07-16'                                           |
|            | sport_field_id       | SERIAL        | -        | UNIQUE, REQUIS, FOREIGN KEY (référence Sport_Fields)   | Identifiant unique du terrain selon le sport                 | 8                                           |
| Days | day_id        | SERIAL          | -        | UNIQUE, REQUIS, PRIMARY KEY   | Identifiant unique du jour                 | 6                                           |
|         | day_name         | VARCHAR         | 50      | REQUIS       | Nom du jour de la semaine           | 'Samedi'       |
| Admins | admin_uuid         | UUID          | -        | UNIQUE, REQUIS, PRIMARY KEY   | Identifiant unique du membre                 | '03183852-55b9-4808-954c-d390fbbed6f2'                                           |
|         | admin_first_name        | VARCHAR         | 255      | REQUIS           | Prénom de l'admin                              | 'Alexis'                                       |
|         | admin_last_name         | VARCHAR         | 255      | REQUIS           | Nom de l'admin                                  | 'Perrin'                                     |
|         | admin_email             | VARCHAR         | 255      | UNIQUE, REQUIS           | Adresse email de l'admin                       | 'admin@example.com '                          |
|         | admin_password          | VARCHAR         | 255      | REQUIS           | Mot de passe email de l'admin                   | 'Azerty1!'                          |
| Members | member_id        | SERIAL          | -        | UNIQUE, REQUIS, PRIMARY KEY   | Identifiant unique du membre                 | 20                                           |
|         | photo_url        | VARCHAR         | 255      | FACULTATIF       | URL de l'image de profil du membre           | ''       |
|         | has_match_making | BOOLEAN         | -        | REQUIS                | Indique si le match making est activé pour le membre               | true                                        |
|        | addresse_id       | INTEGER        | -        | UNIQUE, REQUIS, FOREIGN KEY (référence Addresses)   | Identifiant unique de l'adresse du membre                 | 80                                           |
|         | user_uuid        | UUID            | -        | UNIQUE, REQUIS, FOREIGN KEY (référence Users)   | Identifiant unique de l'utilisateur associé au membre                 | '03183852-55b9-4808-954c-d390fbbed6f2'                                           |
| Members_Reservations | reservation_id        | SERIAL          | -        | UNIQUE, REQUIS, PRIMARY KEY   | Identifiant unique de la réservation                 | 20                                           |
|         | reservation_date        | TIMESTAMP         | -      | REQUIS       | Date et heure de la cancelation de la réservation           | '2024-07-16 09:00:00'         |
|         | cancelation_date        | TIMESTAMP         | -      | FACULTATIF       | Date et heure de la cancelation de la réservation          | '2024-07-15 16:30:08'      |
|         | field_availability_id       | INTEGER        | -        | UNIQUE, REQUIS, FOREIGN KEY (référence Fields_Availabilities)   | Identifiant unique de la disponibilité horaire du terrain réservé                 | 152                                           |
|         | member_id        | INTEGER          | -        | UNIQUE, REQUIS, FOREIGN KEY (référence Members)   | Identifiant unique du membre qui a effectué la réservation                 | 20                                           |
| Members_Availabilities | _availability_id        | SERIAL          | -        | UNIQUE, REQUIS, PRIMARY KEY   | Identifiant unique de la disponibilité du membre                 | 187                                           |
|            | start_time       | TIMESTAMP        | -        | REQUIS      |  Date et heure de début de la disponibilité du membre                 | '2024-03-16 18:00:00'                                           |
|            | end_time       | TIMESTAMP        | -        | REQUIS      |  Date et heure de la fin de la disponibilité du membre                 | '2024-03-16 21:00:00'                                           |
|            | day_id        | INTEGER          | -        | UNIQUE, REQUIS, FOREIGN KEY (référence Days)   | Identifiant unique du jour de la semaine où le membre est disponible                 | 6                                           |
|         | member_id        | INTEGER          | -        | UNIQUE, REQUIS, FOREIGN KEY (référence Members)   | Identifiant unique du membre qui a enregistré sa disponibilité                 | 20                                           |
| Members_Sports | member_id        | INTEGER          | -        | UNIQUE, REQUIS, PRIMARY KEY, FOREIGN KEY (référence Members)   | Identifiant unique de la disponibilité du membre                 | 187                                           |
|               | sport_id       | INTEGER        | -        | UNIQUE, REQUIS, PRIMARY KEY, FOREIGN KEY (référence Sports)   | Identifiant unique du sport                 | 3                                           |
|             | level        | VARCHAR         | 50      | REQUIS       | Niveau de jeu du membre dans le sport defini           | 'Débutant'       |
|         | member_id        | INTEGER          | -        | UNIQUE, REQUIS, FOREIGN KEY (référence Members)   | Identifiant unique du membre                 | 20                                           |
|             | sport_id       | INTEGER        | -        | UNIQUE, REQUIS, FOREIGN KEY (référence Sports)   | Identifiant unique du sport                 | 3                                           |
| Members_Bans | banned_member_id        | INTEGER          | -        | UNIQUE, REQUIS, PRIMARY KEY, FOREIGN KEY (référence Members)   | Identifiant unique du membre banni                | 20                                           |
|          | banned_by_member_id        | INTEGER          | -        | UNIQUE, REQUIS, PRIMARY KEY, FOREIGN KEY (référence Members)   | Identifiant unique du membre qui a banni                | 50                                           |
|         | reason        | VARCHAR         | 50      | FACULTATIF       | Raison pour laquelle un membre a décidé de bannir un autre membre           | 'Comportement antisportif et refus de respecter les règles du jeu'       |
|         | ban_date        | TIMESTAMP         | -      | REQUIS       | Date et heure à laquelle le bannissement a été généré          | '2024-03-16 14:30:00'       |
| Members_Notations | member_id        | INTEGER          | -        | UNIQUE, REQUIS, PRIMARY KEY, FOREIGN KEY (référence Members)   | Identifiant unique du membre qui a noté un autre membre                | 20                                           |
|          | target_member_id        | INTEGER          | -        | UNIQUE, REQUIS, PRIMARY KEY, FOREIGN KEY (référence Members)   | Identifiant unique du membre qui a été noté par un autre membre                | 50                                           |
|         | commentary        | VARCHAR         | 500      | FACULTATIF       | Raison pour laquelle un membre a décidé de noter un autre membre           | 'J'ai eu le plaisir de jouer avec Alain au badminton hier soir. C'était un match très agréable et compétitif.' '       |
|             | note       | INTEGER        | -        | REQUIS   | Note donné au membre adversaire apres le match                 | 4                                           |