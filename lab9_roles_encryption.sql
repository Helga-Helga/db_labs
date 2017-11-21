-- Create new account
CREATE USER olya WITH PASSWORD 'olya';

-- Provide user the authority to access any stored procedure
CREATE OR REPLACE FUNCTION watch_routes()
	RETURNS table(route_id integer, route_code character varying) AS $$
BEGIN
SELECT * FROM routes;
END;
$$ LANGUAGE plpgsql;

GRANT EXECUTE ON FUNCTION watch_routes() TO olya;

-- Assing any database role to the user
CREATE ROLE admin WITH CREATEDB CREATEROLE;
GRANT admin TO olya;

-- Revoke all provided to the user privileges
REVOKE ALL PRIVILEGES ON routes FROM olya;

-- Encrypt the contents of one of the columns in some table of created database
UPDATE routes SET route_code = md5(route_code);
