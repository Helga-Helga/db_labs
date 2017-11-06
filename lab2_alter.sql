-- Add constraints to columns in tables
ALTER TABLE link_routes_stations ADD CONSTRAINT delta_time
	CHECK (delta_time>='0');

-- Add foreign keys
ALTER TABLE link_routes_stations ADD FOREIGN KEY (station_id) REFERENCES stations(station_id)
	ON DELETE CASCADE;

ALTER TABLE link_routes_stations ADD FOREIGN KEY (route_id) REFERENCES routes(route_id)
	ON DELETE CASCADE;

-- Add column with name 'single' to some table
ALTER TABLE routes ADD single VARCHAR(3) DEFAULT 'Yes';

-- Delete column 'single'
ALTER TABLE routes DROP COLUMN single;

-- Rename table
ALTER TABLE routes RENAME TO itineraries;

-- Return old name of table
ALTER TABLE itineraries RENAME TO routes;
