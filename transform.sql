ROLLBACK;
BEGIN;
CREATE EXTENSION IF NOT EXISTS btree_gist WITH SCHEMA public;
SET search_path TO '';

\ir create_base_tables.sql
\ir insert_reference_data.sql
\ir insert_lahman_data.sql
\ir extra_allstar_data.sql
\ir extra_umpire_data.sql
\ir clean_up_bugs.sql
\ir extra_data.sql
\ir add_basic_constraints.sql
\ir add_foreign_constraints.sql
\ir add_indexes.sql
\ir recreate_lahman_views.sql

SET search_path TO base, lahman;
COMMIT;

