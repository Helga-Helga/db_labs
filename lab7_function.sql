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

-- Create procedure that inserts new route to routes table if it doens'n exist already
CREATE OR REPLACE FUNCTION insert_route(r_id integer, code varchar(256))
	RETURNS void AS $$
BEGIN
IF NOT EXISTS(SELECT route_id, route_code FROM routes WHERE route_id=r_id OR route_code=code) THEN
INSERT INTO routes (route_id, route_code) VALUES (r_id, code);
END IF;
END;
$$ LANGUAGE plpgsql;

SELECT insert_route('18', '18');
SELECT * FROM routes;
