/* drivers */
--chargement des données
drivers = LOAD 'Pig/drivers.csv' USING PigStorage(',');
--selection des drivers dont l'id > 10
raw_drivers = FILTER drivers BY $0>10; 
-- affichage des colonnes driverId et name
drivers_details = FOREACH raw_drivers GENERATE $0 AS driverId, $1 AS name;
/* timesheet */
--chargement des données
timesheet = LOAD 'Pig/timesheet.csv' USING PigStorage(',');
raw_timesheet = FILTER timesheet by $0>10;
timesheet_logged = FOREACH raw_timesheet GENERATE $0 AS driverId, $2 AS hours_logged;
--calculer total des nombre d'heure de travail par driverId
grp_logged = GROUP timesheet_logged by driverId;
sum_logged = FOREACH grp_logged GENERATE group as driverId,
SUM(timesheet_logged.hours_logged) as sum_hourslogged;
--Affichage du nombre d'heure de travail par nom de chauffeur
join_sum_logged = JOIN sum_logged by driverId, drivers_details by driverId;
join_data = FOREACH join_sum_logged GENERATE $3 as name, $1 as hours_logged;
store join_data into 'outputscript';