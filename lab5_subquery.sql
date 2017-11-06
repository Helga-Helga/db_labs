-- Choose route codes with average time of moving between stations is more than average
SELECT route_code, delta_time
FROM routes r, link_routes_stations l
WHERE r.route_id=l.route_id
AND delta_time>(SELECT AVG(delta_time)
                FROM routes r1, link_routes_stations l1
                WHERE r1.route_id=l1.route_id);

-- Choose route codes with maximum time of moving between stations
SELECT route_code, delta_time
FROM routes r, link_routes_stations l
WHERE r.route_id=l.route_id
GROUP BY route_code, delta_time
HAVING MAX(delta_time)=(SELECT MAX(delta_time)
                        FROM link_routes_stations);

-- Choose route codes and name of stations on them with maximum time of moving between stations
SELECT route_code, station_name
FROM routes r INNER JOIN link_routes_stations l
ON r.route_id=l.route_id
INNER JOIN stations s
ON l.station_id=s.station_id
GROUP BY route_code, station_name
HAVING MAX(delta_time)=(SELECT MAX(delta_time)
                      FROM link_routes_stations);

-- Choose route code with the largest average time
SELECT route_code
FROM routes r, link_routes_stations l
WHERE r.route_id=l.route_id
AND delta_time>(SELECT AVG(delta_time)
                FROM routes r1, link_routes_stations l1
                WHERE r1.route_id=l1.route_id)
ORDER BY delta_time DESC LIMIT 1;
