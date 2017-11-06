-- Create view to view  all stations along the routes
CREATE VIEW view_stations
AS
SELECT route_code, station_name
FROM routes JOIN link_routes_stations
ON routes.route_id=link_routes_stations.route_id
JOIN stations ON link_routes_stations.station_id=stations.station_id;

-- Create view to to view all routes by stations
CREATE VIEW view_routes
AS
SELECT station_name, route_code
FROM stations JOIN link_routes_stations
ON stations.station_id=link_routes_stations.station_id
JOIN routes ON link_routes_stations.route_id=routes.route_id;

-- Create view to calculate total time of moving on routes
CREATE VIEW general_time
AS
SELECT route_code, Round(SUM(delta_time),2)
FROM routes INNER JOIN link_routes_stations
ON routes.route_id=link_routes_stations.route_id
GROUP BY route_code;
