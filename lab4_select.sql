-- Choose all stations by routes
SELECT route_code, station_name
FROM routes JOIN link_routes_stations
	ON routes.route_id=link_routes_stations.route_id
    JOIN stations ON link_routes_stations.station_id=stations.station_id;

-- Choose all stations by definite route
SELECT route_code, station_name
FROM routes JOIN link_routes_stations
	ON routes.route_id=link_routes_stations.route_id
    JOIN stations ON link_routes_stations.station_id=stations.station_id  WHERE route_code='1';

-- Choose all routes by stations
SELECT station_name, route_code
FROM stations JOIN link_routes_stations
	ON stations.station_id=link_routes_stations.station_id
    JOIN routes ON link_routes_stations.route_id=routes.route_id;

-- Choose all routes by definite station
SELECT station_name, route_code
FROM stations JOIN link_routes_stations
	ON stations.station_id=link_routes_stations.station_id
    JOIN routes ON link_routes_stations.route_id=routes.route_id WHERE station_name='Railway station "Сentral"';

-- Calculate average time of moving between stations of definite route
SELECT route_code, Round(AVG(delta_time),2)
FROM routes INNER JOIN link_routes_stations
	ON routes.route_id=link_routes_stations.route_id
    WHERE route_code='2'
    GROUP BY route_code;

-- Calculate general time of moving in routes
SELECT route_code, Round(SUM(delta_time),2)
FROM routes INNER JOIN link_routes_stations
	ON routes.route_id=link_routes_stations.route_id
    GROUP BY route_code;

-- Calculate maximum delta_time for each route
SELECT route_code, Round(MAX(delta_time),2)
FROM routes JOIN link_routes_stations
	ON routes.route_id=link_routes_stations.route_id
    GROUP BY route_code;
