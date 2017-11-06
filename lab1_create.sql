-- Create tables
CREATE TABLE IF NOT EXISTS routes
(
    route_id INTEGER NOT NULL UNIQUE,
    route_code VARCHAR(256) UNIQUE,
    PRIMARY KEY(route_id)
);

CREATE TABLE IF NOT EXISTS stations
(
    station_id INTEGER NOT NULL UNIQUE,
    station_name VARCHAR(256) UNIQUE,
    PRIMARY KEY(station_id)
);

CREATE TABLE IF NOT EXISTS link_routes_stations
(
    id INTEGER NOT NULL UNIQUE,
    route_id INTEGER,
    station_id INTEGER,
    delta_time INTEGER,
    PRIMARY KEY(id)
);
