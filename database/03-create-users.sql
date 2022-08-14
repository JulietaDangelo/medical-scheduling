-- ********************************************************************************
-- This script creates the database users and grants them the necessary permissions
-- ********************************************************************************

CREATE USER brewery_finder_owner WITH PASSWORD 'medical_scheduling_owner1';

GRANT ALL 
ON ALL TABLES IN SCHEMA public
TO medical_scheduling_owner;

GRANT ALL 
ON ALL SEQUENCES IN SCHEMA public
TO medical_scheduling_owner;

CREATE USER brewery_finder_appuser WITH PASSWORD 'medical_scheduling_appuser1';

GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public
TO medical_scheduling_appuser;

GRANT USAGE, SELECT
ON ALL SEQUENCES IN SCHEMA public
TO medical_scheduling_appuser;