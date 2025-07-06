-- 1 - Afficher les scores de chaque joueurs pour la session 12, triés par score décroissant.
SELECT joueurs.pseudo, scores.score FROM joueurs
INNER JOIN scores ON joueurs.id = scores.id_joueur
INNER JOIN sessions ON scores.id_session = sessions.id
WHERE sessions.id = 12;

-- 2 - Afficher la liste des joueurs n'ayant jamais participé à une session.

SELECT joueurs.pseudo FROM joueurs
CROSS JOIN scores ON joueurs.id = scores.id_joueur
CROSS JOIN sessions ON scores.id_session = sessions.id
WHERE joueurs.id IS NULL;


-- 3 - Lister les titres des jeux avec leur genre.

SELECT titre, nom AS "genre" FROM jeux
LEFT JOIN genres ON jeux.id_genre = genres.id;

-- 4 - Afficher pour chaque joueur le nombre total de sessions jouées.

SELECT joueurs.pseudo, COUNT(id_session) AS "nombres de sessions jouées" FROM scores
INNER JOIN joueurs ON id_joueur = joueurs.id
GROUP BY id_joueur;


-- 5 - Donner le score moyen obtenu par chaque joueur, avec leur pseudo.

SELECT joueurs.pseudo, ROUND(AVG(score),2) AS "score moyen" FROM scores
INNER JOIN joueurs ON id_joueur = joueurs.id
GROUP BY id_joueur;


-- 6 - Lister les joueurs ayant obtenu un score supérieur à 1400 au moins une fois, avec la date et le jeu.

SELECT joueurs.pseudo, score, date_session, titre FROM scores s
INNER JOIN joueurs ON s.id_joueur = joueurs.id
INNER JOIN sessions ON s.id_session = sessions.id
INNER JOIN jeux ON sessions.id_jeu = jeux.id
WHERE score >= 1400;

-- 7 - Afficher les membres de chaque équipe, avec le nom de l'équipe, le pseudo et le pays.

SELECT equipes.nom AS "équipe", joueurs.pseudo, joueurs.pays FROM joueurs
LEFT JOIN membres_equipes ON joueurs.id = membres_equipes.id_joueur
INNER JOIN equipes ON membres_equipes.id_equipe = equipes.id;

-- 8 - Afficher les jeux ayant eu plus de 3 sessions différentes.

SELECT jeux.titre, COUNT(jeux.titre) AS "nombres de sessions" FROM jeux
INNER JOIN sessions ON jeux.id = sessions.id_jeu
GROUP BY jeux.titre;

-- 9 - Donner pour chaque session le jeu joué, la date et le nombre de joueurs présents.

SELECT jeux.titre, date_session, COUNT(id_joueur) AS "nombres de joueurs présents" FROM scores
INNER JOIN sessions ON sessions.id = scores.id_session
INNER JOIN jeux ON jeux.id = sessions.id_jeu
INNER JOIN joueurs ON joueurs.id = scores.id_joueur
GROUP BY scores.id_session;

-- 10 - Afficher les scores moyens par jeu, triés du plus fort au plus faible.

SELECT ROUND(AVG(scores.score),2) AS "moyenne des scores", jeux.titre FROM scores
INNER JOIN sessions ON scores.id_session = sessions.id
INNER JOIN jeux ON sessions.id_jeu = jeux.id
GROUP BY jeux.titre;

