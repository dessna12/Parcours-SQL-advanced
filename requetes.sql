Phase 2 : Requêtes SQL (Jointures et Agrégats)

👉 Répondez aux questions suivantes à l’aide de requêtes SQL. Utilisez les jointures appropriées.

--1. Afficher les scores de chaque joueur pour la session 12, triés par score décroissant.--
SELECT j.pseudo, s.score
FROM scores s
JOIN joueurs j ON s.id_joueur = j.id
WHERE s.id_session = 12
ORDER BY s.score DESC;

--2. Afficher la liste des joueurs n'ayant jamais participé à une session.--

SELECT j.pseudo
FROM joueurs j
LEFT JOIN scores s ON j.id = s.id_joueur
WHERE s.id_joueur IS NULL;

--3. Lister les titres des jeux avec leur genre.--

SELECT j.titre, g.nom AS genre
FROM jeux j
JOIN genres g ON j.id_genre = g.id;


--4. Afficher pour chaque joueur le nombre total de sessions jouées.--

SELECT j.pseudo, COUNT(s.id_session) AS nombre_de_sessions
FROM joueurs j
LEFT JOIN scores s ON j.id = s.id_joueur
GROUP BY j.id, j.pseudo;


--5. Donner le score moyen obtenu par chaque joueur, avec leur pseudo.--

SELECT j.pseudo, AVG(s.score) AS score_moyen
FROM joueurs j
LEFT JOIN scores s ON j.id = s.id_joueur
GROUP BY j.id, j.pseudo;



--6. Lister les joueurs ayant obtenu un score supérieur à 1400 au moins une fois, avec la date et le jeu.--

SELECT j.pseudo, ses.date_session, jeu.titre
FROM scores s
JOIN joueurs j ON s.id_joueur = j.id
JOIN sessions ses ON s.id_session = ses.id
JOIN jeux jeu ON ses.id_jeu = jeu.id
WHERE s.score > 1400;


--7. Afficher les membres de chaque équipe, avec le nom de l'équipe, le pseudo et le pays.--

SELECT e.nom AS equipe, j.pseudo, j.pays
FROM equipes e
JOIN membres_equipes me ON e.id = me.id_equipe
JOIN joueurs j ON me.id_joueur = j.id;



--8. Afficher les jeux ayant eu plus de 3 sessions différentes.--

SELECT j.titre, COUNT(s.id) AS nombre_de_sessions
FROM jeux j
JOIN sessions s ON j.id = s.id_jeu
GROUP BY j.id, j.titre
HAVING COUNT(s.id) > 3;



--9. Donner pour chaque session le jeu joué, la date et le nombre de joueurs présents.--

SELECT s.id, j.titre, s.date_session, COUNT(sc.id_joueur) AS nombre_de_joueurs
FROM sessions s
JOIN jeux j ON s.id_jeu = j.id
LEFT JOIN scores sc ON s.id = sc.id_session
GROUP BY s.id, j.titre, s.date_session;


--10. Afficher les scores moyens par jeu, triés du plus fort au plus faible.--

SELECT j.titre, AVG(sc.score) AS score_moyen
FROM jeux j
JOIN sessions s ON j.id = s.id_jeu
JOIN scores sc ON s.id = sc.id_session
GROUP BY j.id, j.titre
ORDER BY score_moyen DESC;


--tester connexion via cmd de mysql
-- exercice phase 3 :>mysqldump -u root -p GameWorld


-- -creer le backup de gameworld entier----voir dans le repertoir sauvegarde -------

-- mysqldump -u root -p GameWorld > gameworld_backup
-- Enter password: ****   
-- --voir gameworld_backup.sql--
-- DROP DATABASE gameworld;
-- Query OK, 7 rows affected (0.38 sec)

-- mysql>
-------------------------RESTORE gameworld-----------------------------------------

--C:\Users\Stagiaire>mysqldump -u root -p gameworld < gameworld_backup
--Enter password: ****
-- MySQL dump 10.13  Distrib 8.4.5, for Win64 (x86_64)
--
-- Host: localhost    Database: gameworld
-- ------------------------------------------------------
-- Server version       8.4.5

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-04 15:13:41

--C:\Users\Stagiaire>
-- CREER mini_backup AVEC LES TABLES joueurs ET score
--mysqldump -u root -p gameworld joueurs scores > mini_backup

-- Microsoft Windows [version 10.0.26100.4349]
-- (c) Microsoft Corporation. Tous droits réservés.

-- C:\Users\Stagiaire>mysqldump -u root -p gameworld joueurs scores > mini_backup2
-- Enter password: ****

-- C:\Users\Stagiaire>dir/w
--  Le volume dans le lecteur C n’a pas de nom.
--  Le numéro de série du volume est 009E-D0A3
------------------------------------------------------------------------------------------------------------
--  Répertoire de C:\Users\Stagiaire

-- [.]                         [..]                        .bash_history
-- [.console-ninja]            [.dbus-keyrings]            .gitconfig
-- .lesshst                    [.ms-ad]                    [.quokka]
-- [.ssh]                      .viminfo                    .viminfo.tmp
-- .viminfx.tmp                .viminfy.tmp                .viminfz.tmp
-- [.vscode]                   [.wallaby]                  [03-Constraints-SQL]
-- [05-Joins-SQL]              Aceyourexam.fig             Aceyourexamdesktop.fig
-- [Archive]                   Archive.zip                 [backup]
-- backup.sql                  backup1.sql                 backup2.sql
-- [bash.sh]                   [Contacts]                  [convertisseur]
-- [Desktop]                   [Documents]                 [Downloads]
-- [exercice_todolist]         [Favorites]                 [Filerouge]
-- gameworld_backup            gameworld_backup2.sql       img-AYE-acceuil-2.jpg
-- img-AYE-acceuil-mobil.jpg   img-AYE-acceuil.jpg         index.html
-- [Links]                     [locovelo]                  [locovelo-1]
-- mini_backup                 mini_backup.sql             mini_backup2
-- mini_backupjoueurs.sql      mini_scores.sql             [Music]
-- [newverbeirregulier]        [OneDrive]                  [Parcours-SQL-advanced]
-- [Pictures]                  [projetAYE]                 python-3.13.4-amd64.exe
-- [react-todolist]            react-todolist.zip          [Saved Games]
-- [Searches]                  structure.sql               [test-react]
-- [verbesirreguliers]         [verbesirreguliers-1]       [Videos]
--               28 fichier(s)       33 249 391 octets
--               38 Rép(s)  154 637 037 568 octets libres

-- C:\Users\Stagiaire>mysqldump mini_backup2
-- mysqldump: Got error: 1045: Access denied for user 'ODBC'@'localhost' (using password: NO) when trying to connect

-- C:\Users\Stagiaire>type mini_backup2
-- -- MySQL dump 10.13  Distrib 8.4.5, for Win64 (x86_64)
-- --
-- -- Host: localhost    Database: gameworld
-- -- ------------------------------------------------------
-- -- Server version       8.4.5

-- /*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
-- /*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
-- /*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
-- /*!50503 SET NAMES utf8mb4 */;
-- /*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
-- /*!40103 SET TIME_ZONE='+00:00' */;
-- /*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
-- /*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
-- /*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- /*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- --
-- -- Table structure for table `joueurs`
-- --

-- DROP TABLE IF EXISTS `joueurs`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!50503 SET character_set_client = utf8mb4 */;
-- CREATE TABLE `joueurs` (
--   `id` int NOT NULL,
--   `pseudo` varchar(50) NOT NULL,
--   `pays` varchar(50) DEFAULT NULL,
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- /*!40101 SET character_set_client = @saved_cs_client */;

-- --
-- -- Dumping data for table `joueurs`
-- --

-- LOCK TABLES `joueurs` WRITE;
-- /*!40000 ALTER TABLE `joueurs` DISABLE KEYS */;
-- INSERT INTO `joueurs` VALUES (1,'ShadowKiller','France'),(2,'Elfae','Canada'),(3,'NoobMaster69','USA'),(4,'Z3r0Cool','Allemagne'),(5,'PixelPro','France'),(6,'MissClick','Espagne'),(7,'LagWizard','Italie'),(8,'Headshotz','France'),(9,'ManaQueen','Br├®sil'),(10,'StunLock','France'),(11,'AltF4','Belgique'),(12,'AFKLord','Su├¿de');
-- /*!40000 ALTER TABLE `joueurs` ENABLE KEYS */;
-- UNLOCK TABLES;

-- --
-- -- Table structure for table `scores`
-- --

-- DROP TABLE IF EXISTS `scores`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!50503 SET character_set_client = utf8mb4 */;
-- CREATE TABLE `scores` (
--   `id_session` int NOT NULL,
--   `id_joueur` int NOT NULL,
--   `score` int DEFAULT NULL,
--   PRIMARY KEY (`id_session`,`id_joueur`),
--   KEY `id_joueur` (`id_joueur`),
--   CONSTRAINT `scores_ibfk_1` FOREIGN KEY (`id_session`) REFERENCES `sessions` (`id`),
--   CONSTRAINT `scores_ibfk_2` FOREIGN KEY (`id_joueur`) REFERENCES `joueurs` (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- /*!40101 SET character_set_client = @saved_cs_client */;

-- --
-- -- Dumping data for table `scores`
-- --

-- LOCK TABLES `scores` WRITE;
-- /*!40000 ALTER TABLE `scores` DISABLE KEYS */;
-- INSERT INTO `scores` VALUES (1,1,1200),(1,2,950),(2,1,1300),(2,3,800),(3,2,1500),(3,4,1100),(4,3,1250),(4,5,1400),(5,6,1600),(6,1,1550),(6,7,1333),(6,8,999),(7,2,1432),(7,5,1200),(7,10,800),(8,3,1220),(8,9,1450),(9,6,1100),(9,11,920),(10,1,1350),(10,2,1490),(10,12,1050),(11,4,870),(11,5,900),(11,8,1240),(12,1,1600),(12,2,1200),(12,7,1100),(12,9,1170),(12,10,1250);
-- /*!40000 ALTER TABLE `scores` ENABLE KEYS */;
-- UNLOCK TABLES;
-- /*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

-- /*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
-- /*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
-- /*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
-- /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
-- /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
-- /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- /*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- -- Dump completed on 2025-07-04 17:46:42

-------------------------------phase 4--------------------------------------

-- mysql> grant select on gameworld.scores  to 'analyste@localhost';
-- Query OK, 0 rows affected (0.02 sec)

-- mysql> grant select on gameworld.sessions  to 'analyste@localhost';
-- Query OK, 0 rows affected (0.01 sec)

-- mysql> show grants for 'analyste@localhost';
-- +--------------------------------------------------------------------+
-- | Grants for analyste@localhost@%                                    |
-- +--------------------------------------------------------------------+
-- | GRANT USAGE ON *.* TO `analyste@localhost`@`%`                     |
-- | GRANT SELECT ON `gameworld`.`joueurs` TO `analyste@localhost`@`%`  |
-- | GRANT SELECT ON `gameworld`.`scores` TO `analyste@localhost`@`%`   |
-- | GRANT SELECT ON `gameworld`.`sessions` TO `analyste@localhost`@`%` |
-- +--------------------------------------------------------------------+
-- 4 rows in set (0.00 sec)



--bonus--


-- CREATE VIEW vue_scores_moyens AS
-- SELECT
--     j.pseudo,
--     AVG(s.score) AS score_moyen
-- FROM
--     joueurs j
-- LEFT JOIN
--     scores s ON j.id = s.id_joueur
-- GROUP BY
--     j.id, j.pseudo;

--     CREATE VIEW vue_scores_moyens AS
--     -> SELECT
--     ->     j.pseudo,
--     ->     AVG(s.score) AS score_moyen
--     -> FROM
--     ->     joueurs j
--     -> LEFT JOIN
--     ->     scores s ON j.id = s.id_joueur
--     -> GROUP BY
--     ->     j.id, j.pseudo;
-- Query OK, 0 rows affected (0.09 sec)

-- mysql> SELECT * FROM vue_scores_moyens;
-- +--------------+-------------+
-- | pseudo       | score_moyen |
-- +--------------+-------------+
-- | ShadowKiller |   1400.0000 |
-- | Elfae        |   1314.4000 |
-- | NoobMaster69 |   1090.0000 |
-- | Z3r0Cool     |    985.0000 |
-- | PixelPro     |   1166.6667 |
-- | MissClick    |   1350.0000 |
-- | LagWizard    |   1216.5000 |
-- | Headshotz    |   1119.5000 |
-- | ManaQueen    |   1310.0000 |
-- | StunLock     |   1025.0000 |
-- | AltF4        |    920.0000 |
-- | AFKLord      |   1050.0000 |
-- +--------------+-------------+
-- 12 rows in set (0.02 sec)

-- mysql>

