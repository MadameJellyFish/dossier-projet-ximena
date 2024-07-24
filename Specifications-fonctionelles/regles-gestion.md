# 📋 Règles de Gestion

# Profil User
- RG1 Le User contient un nom
- RG2 Le User contient un prénom
- RG3 Le User contient une adresse postale
- RG4 Le User peut contenir une photo (facultative)
- RG5 Le User peut contenir un abonement (facultative)
- RG6 Le User contient une adresse mail unique, qui sera utilisée pour la communication et la récupération de compte
- RG7 Le User contient un mot de passe sécurisé pour l'authentification. Le mot de passe doit comporter au moins 8 caractères, incluant des chiffres, des lettres majuscules et minuscules, et des symboles pour renforcer la sécurité

# 👥 Profil Membre
- RG8 Le Membre herite les informations du Profil User
- RG9 Les User avec une adhésion active peuvent accéder aux fonctionnalités du club
- RG10 Les Membres peuvent faire des réservations
- RG11 Le Membre peut s'inscrire au programme de Match making

# 🔐 Gestion de l'Authentification
- RG12 Authentification sécurisée avec vérification du mot de passe
- RG13 Sessions sécurisées avec expiration automatique après 2 semaines d'inactivité
- RG14 Reconnexion requise pour les actions sensibles pour vérifier l'identité de l'utilisateur.
    - Changement d'email, mot de passe, avant un paiement ...

# 📅 Gestion de l'Abonnement
- RG15 L'accès aux fonctionnalités avancées nécessite un abonnement
- RG16 L'abonement au club coute 50€ et viens avec tous les fonctionalités de l'application
- RG17 La gestion des paiements doit-être sécurisée et automatisée
- RG18 L'abonnement est renouvelé et débité automatiquement chaque mois
- RG19 Les Users peuvent annuler leur abonnement à tout moment via leur Profil, avec effet immédiat ou à la fin de la période de facturation courante

# 🏟️ Gestion de reservations
- RG20 La Réservation doit être faite au moins 30 min à l'avance
- RG21 Les Users peuvent effectuer des réservations de terrains uniquement s'ils ont une adhésion active
- RG22 Les réservations doivent avoir un statut mis à jour pour refléter si elles sont en attente, confirmées, annulées, etc.
- RG23 Un Terrain ne peut être Réservé que s'il est disponible
- RG24 Un User ne peut pas effectuer plusieurs Réservations pour un même Créneau horaire
- RG25 Affichage en temps réel de la disponibilité des Terrains
- RG26 Une Réservation à une durée de 1h

# 🚫 Gestion des Annulations
- RG27 Les Réservations peuvent être annulées jusqu'à 6 heures avant l'heure prévue sans pénalité
- RG28 Les annulations tardives auront une penalité x

# 📬 Gestion notifications
- RG29 Notification par email pour chaque étape importante : 
- RG30 Confirmation de Réservation
     - Le Membre reçoit une confirmation par email une fois la Réservation d'un Terrain effectuée
- RG31 Annulation de Réservation
    - Le Membre est informé par email en cas d'annulation de sa Réservation
- RG32 Rappel de match
    - Un rappel par email est envoyé au Membre 4 heures avant l'heure du match réservé
- RG33 Les notifications incluent tous les détails pertinents tels que la date, l'heure, et les informations du Membre

# 📩 Détails d'une Notification
- RG34 Une notification contient un titre qui résume l'évènement
- RG35 Une notification contient un message qui détaille l'événement, fournissant toutes les informations pertinentes nécessaires
- RG36 Une notification concernant une Réservation contient la date, l'heure du match, ainsi que le nombre et les noms des adversaires

# 🔍 Système de Match making
- RG37 Le Membre peut s'inscrire au Système de Match making
- RG38 Le Système de Match making contient les sports choisis du Membre (badminton, tennis, ping-pong), il faut en avoir un au minimum
- RG39 Le Système de Match making contient le niveau de sports du Membre 
- RG40 Le Système de Match making contient les Créneaux de disponibilité (jours, heures, minutes, ex: Lundi 19h30) du Membre
- RG41 Le Système de Match making évalue la compatibilité des Membres en fonction de leur évaluations, disponibilité, niveau de jeu et préférences sportives
- RG42 Le Membre peut banir un Membre avec lequelle il a joué
- RG43 Le Membre peut debanir un Membre avec lequelle il a joué
- RG44 Lorsqu'un Membre est sélectionné comme partenaire potentiel, il reçoit un email ou une notification directement sur l'application lui informant qu'un autre Membre lui propose un match, avec la possibilité d'accepter ou de refuser cette proposition

# ✅ Confirmation de Réservation Match making
- RG45 Propose automatiquement la première plage horaire disponible concordante
- RG46 Nécessite une confirmation mutuelle des deux parties pour finaliser la Réservation
- RG47 Lorsque la Réservation est confirmée mutuellement, chaque Membre reçoit une notification finale qui confirme les détails du match, y compris le Terrain, la date et l'heure

# Gestion des Terrains
- RG48 Un Terrain contient un numero, un Sport, une Disponibilité, un Créneau
- RG49 Un Terrain peut être Reservé si il est disponible
- RG50 La disponibilité de chaque Terrain est de 8h à 23h

# ⭐ Gestion de la Notation des Partenaires Match making
- RG51 Un User peut noter un autre User après un match, sur une échelle de 1 à 5 étoiles et ajouter un message
- RG52 Les notations affichent l'identité du Membre qui la noté
- RG53 Le score moyen de chaque Membre influence les futures propositions sur le match making

# 🚷 Bannir/Ignorer un Membre
- RG54 À côté de chaque Membre listé dans les suggestions du système de matching, un bouton "Bannir/Ignorer leMembre" doit être affiché
- RG55 Lorsqu'un Membre clique sur ce bouton, une fenêtre pop-up apparaît pour confirmer l'action
- RG56 Le Membre peut mettre une raison ou non pour ignorer l'autre Membre
- RG57 L'action est invisible pour leMembre banni/ignorer
- RG58 Lorsqu'un Membre choisit d'ignorer un autre Membre, celui-ci ne sera plus affiché ni proposé dans la liste des adversaires potentiels
- RG59 Le Membre ignoré ne pourra plus voir le Membre qui l'a ignoré, sans être informé de cette action. Cette fonctionnalité aide à prévenir les interactions indésirables entre les Membres, surtout en cas de conflits lors de rencontres précédentes
- RG60 Possibilité d'annuler le bannisement

# 👤 Profil Administrateur
- RG61 L'Administrateur peut créer, modifier et annuler des Réservations de Terrains
- RG62 L'Administrateur peut consulter des statistiques détaillées exemple : sur l'utilisation des Terrains, les habitudes de Réservation des Membres, et les revenus générés par les abonnements, taux d'occupation d'un Terrain etc ...
