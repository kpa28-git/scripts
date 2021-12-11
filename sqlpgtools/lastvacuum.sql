-- Print out the last vacuum run
SELECT
	schemaname,
	relname,
	last_vacuum,
	last_autovacuum,
	vacuum_count,
	autovacuum_count
FROM pg_stat_all_tables
ORDER BY schemaname, relname;
