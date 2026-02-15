# XAYA – Application de gestion et réservation de salles

## 📌 Description du projet
**XAYA** est une application web développée avec **Spring Boot** permettant la gestion et la réservation de salles.  
Elle propose un système d’authentification avec rôles (**ADMIN** et **CLIENT**) ainsi qu’une gestion des salles disponibles.

Le projet a été réalisé dans un cadre académique.
---
👨‍💻 Auteur
Projet XAYA
AGBOGBA ZOUNON Silas O. C - etudiant - Master I – Genie Logiciel

DOUGLOUI Doskie Adinette  - etudiante- Master I - Genie Logiciel

Institut de Formation et de Recherche en Informatique (IFRI)

## 🛠️ Technologies utilisées
- Java 17+
- Spring Boot
- Spring Security
- Spring Data JPA
- Hibernate
- Base de données relationnelle (PostgreSQL )
- Maven
- HTML / CSS (frontend)
- JAR exécutable

---

## 👥 Rôles utilisateurs
- **ADMIN**
  - Gestion des salles
  - Visualisation des utilisateurs
  - Administration globale du système

- **CLIENT**
  - Consultation des salles
  - Réservation de salles disponibles
---

## 🗂️ Initialisation automatique des données
Au **premier démarrage de l’application**, la base de données est automatiquement initialisée grâce à la classe :

com.ifri.XAYA.config.DataInitializer


### 🔹 Comptes créés par défaut

#### Administrateurs
| Nom    | Email              | Mot de passe |
|--------|--------------------|--------------|
| Admin 1 | admin1@xaya.com   | admin123     |
| Admin 2 | admin2@xaya.com   | admin123     |
| Admin 3 | admin3@xaya.com   | admin123     |

#### Clients
| Nom      | Email               | Mot de passe |
|--------- |---------------------|--------------|
| Client 1 | client1@xaya.com    | client123    |
| Client 2 | client2@xaya.com    | client123    |
| Client 3 | client3@xaya.com    | client123    |
---

### 🔹 Salles créées par défaut

| Nom                | Capacité | Localisation | Disponible | Image 			|
|---                 |---       |---           |---         |---                        |
| Salle Informatique | 40       | Bloc A       | Oui        | /images/salles/salle1.jpg |
| Salle Réunion      | 20       | Bloc B       | Oui        | /images/salles/salle2.jpg |
| Salle Conférence   | 100      | Grand Hall   | Oui        | /images/salles/salle3.jpg |

---
## ▶️ Exécution du projet

### 1️⃣ Génération du fichier JAR

Le fichier JAR sera généré dans le dossier :

target/


### 2️⃣ Lancement de l’application
### Exécuter la commande suivante :

java -jar target/XAYA-0.0.1-SNAPSHOT.jar

### 🗄️Concernant la base donnée 
  
  Nous avions utiliser une base de donnée PostgreSQL

###   Nom de la base : xaya
 

### 🌐 Accès à l’application
Par défaut :

http://localhost:8080

### 📁 Gestion des images
Les images des salles sont chargées depuis le chemin :

/uploads/salles/
Ces images sont référencées en base de données via l’attribut imageUrl.

### 🔐 Sécurité
Authentification basée sur Spring Security

### Mots de passe chiffrés
 
  Les utilisateurs sont créer par default au démarrage du projet (ADMIN , Client ) référencer en haut (Compte créer par defaut )

Accès aux fonctionnalités contrôlé par rôle

🎓 Contexte académique
Ce projet a été réalisé dans le cadre d’un travail académique visant à mettre en pratique :

Spring Boot

Sécurité

Accès aux données

Architecture MVC

Déploiement d’une application Java sous forme de JAR
