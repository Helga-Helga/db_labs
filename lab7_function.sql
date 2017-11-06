-- Create procedure that returns average time of moving between stations of the given route
CREATE OR REPLACE FUNCTION avg_time(route varchar(256))
	RETURNS real AS $time$
DECLARE
time real;
BEGIN
SELECT Round(AVG(delta_time),2) INTO time
FROM routes INNER JOIN link_routes_stations
ON routes.route_id=link_routes_stations.route_id
WHERE route_code=route;
RETURN time;
END;
$time$ LANGUAGE plpgsql;

SELECT avg_time('12');
