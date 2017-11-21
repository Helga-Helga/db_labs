-- Create trigger for DELETE a row in routes. If stations exist for the route, prevent detelion

CREATE OR REPLACE FUNCTION check_route_delete()
	RETURNS trigger AS $$
BEGIN
	IF EXISTS(SELECT id FROM link_routes_stations
         WHERE route_id=OLD.route_id) THEN
         RAISE EXCEPTION 'Cannot delete route as it has stations';
         RETURN OLD;
    ELSE
    	RETURN NEW;
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_delete
    BEFORE DELETE ON routes
    FOR EACH ROW
    EXECUTE PROCEDURE check_route_delete();
