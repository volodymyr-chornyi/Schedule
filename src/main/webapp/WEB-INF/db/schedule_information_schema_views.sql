INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_shadow', ' SELECT pg_authid.rolname AS usename,
    pg_authid.oid AS usesysid,
    pg_authid.rolcreatedb AS usecreatedb,
    pg_authid.rolsuper AS usesuper,
    pg_authid.rolreplication AS userepl,
    pg_authid.rolbypassrls AS usebypassrls,
    pg_authid.rolpassword AS passwd,
    (pg_authid.rolvaliduntil)::abstime AS valuntil,
    s.setconfig AS useconfig
   FROM (pg_authid
     LEFT JOIN pg_db_role_setting s ON (((pg_authid.oid = s.setrole) AND (s.setdatabase = (0)::oid))))
  WHERE pg_authid.rolcanlogin;', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_roles', ' SELECT pg_authid.rolname,
    pg_authid.rolsuper,
    pg_authid.rolinherit,
    pg_authid.rolcreaterole,
    pg_authid.rolcreatedb,
    pg_authid.rolcanlogin,
    pg_authid.rolreplication,
    pg_authid.rolconnlimit,
    ''********''::text AS rolpassword,
    pg_authid.rolvaliduntil,
    pg_authid.rolbypassrls,
    s.setconfig AS rolconfig,
    pg_authid.oid
   FROM (pg_authid
     LEFT JOIN pg_db_role_setting s ON (((pg_authid.oid = s.setrole) AND (s.setdatabase = (0)::oid))));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_settings', ' SELECT a.name,
    a.setting,
    a.unit,
    a.category,
    a.short_desc,
    a.extra_desc,
    a.context,
    a.vartype,
    a.source,
    a.min_val,
    a.max_val,
    a.enumvals,
    a.boot_val,
    a.reset_val,
    a.sourcefile,
    a.sourceline,
    a.pending_restart
   FROM pg_show_all_settings() a(name, setting, unit, category, short_desc, extra_desc, context, vartype, source, min_val, max_val, enumvals, boot_val, reset_val, sourcefile, sourceline, pending_restart);', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_file_settings', ' SELECT a.sourcefile,
    a.sourceline,
    a.seqno,
    a.name,
    a.setting,
    a.applied,
    a.error
   FROM pg_show_all_file_settings() a(sourcefile, sourceline, seqno, name, setting, applied, error);', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_hba_file_rules', ' SELECT a.line_number,
    a.type,
    a.database,
    a.user_name,
    a.address,
    a.netmask,
    a.auth_method,
    a.options,
    a.error
   FROM pg_hba_file_rules() a(line_number, type, database, user_name, address, netmask, auth_method, options, error);', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_config', ' SELECT pg_config.name,
    pg_config.setting
   FROM pg_config() pg_config(name, setting);', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_replication_origin_status', ' SELECT pg_show_replication_origin_status.local_id,
    pg_show_replication_origin_status.external_id,
    pg_show_replication_origin_status.remote_lsn,
    pg_show_replication_origin_status.local_lsn
   FROM pg_show_replication_origin_status() pg_show_replication_origin_status(local_id, external_id, remote_lsn, local_lsn);', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_statio_all_indexes', ' SELECT c.oid AS relid,
    i.oid AS indexrelid,
    n.nspname AS schemaname,
    c.relname,
    i.relname AS indexrelname,
    (pg_stat_get_blocks_fetched(i.oid) - pg_stat_get_blocks_hit(i.oid)) AS idx_blks_read,
    pg_stat_get_blocks_hit(i.oid) AS idx_blks_hit
   FROM (((pg_class c
     JOIN pg_index x ON ((c.oid = x.indrelid)))
     JOIN pg_class i ON ((i.oid = x.indexrelid)))
     LEFT JOIN pg_namespace n ON ((n.oid = c.relnamespace)))
  WHERE (c.relkind = ANY (ARRAY[''r''::"char", ''t''::"char", ''m''::"char"]));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_matviews', ' SELECT n.nspname AS schemaname,
    c.relname AS matviewname,
    pg_get_userbyid(c.relowner) AS matviewowner,
    t.spcname AS tablespace,
    c.relhasindex AS hasindexes,
    c.relispopulated AS ispopulated,
    pg_get_viewdef(c.oid) AS definition
   FROM ((pg_class c
     LEFT JOIN pg_namespace n ON ((n.oid = c.relnamespace)))
     LEFT JOIN pg_tablespace t ON ((t.oid = c.reltablespace)))
  WHERE (c.relkind = ''m''::"char");', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_group', ' SELECT pg_authid.rolname AS groname,
    pg_authid.oid AS grosysid,
    ARRAY( SELECT pg_auth_members.member
           FROM pg_auth_members
          WHERE (pg_auth_members.roleid = pg_authid.oid)) AS grolist
   FROM pg_authid
  WHERE (NOT pg_authid.rolcanlogin);', 'NONE', 'YES', 'YES', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_user', ' SELECT pg_shadow.usename,
    pg_shadow.usesysid,
    pg_shadow.usecreatedb,
    pg_shadow.usesuper,
    pg_shadow.userepl,
    pg_shadow.usebypassrls,
    ''********''::text AS passwd,
    pg_shadow.valuntil,
    pg_shadow.useconfig
   FROM pg_shadow;', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_policies', ' SELECT n.nspname AS schemaname,
    c.relname AS tablename,
    pol.polname AS policyname,
        CASE
            WHEN pol.polpermissive THEN ''PERMISSIVE''::text
            ELSE ''RESTRICTIVE''::text
        END AS permissive,
        CASE
            WHEN (pol.polroles = ''{0}''::oid[]) THEN (string_to_array(''public''::text, ''''::text))::name[]
            ELSE ARRAY( SELECT pg_authid.rolname
               FROM pg_authid
              WHERE (pg_authid.oid = ANY (pol.polroles))
              ORDER BY pg_authid.rolname)
        END AS roles,
        CASE pol.polcmd
            WHEN ''r''::"char" THEN ''SELECT''::text
            WHEN ''a''::"char" THEN ''INSERT''::text
            WHEN ''w''::"char" THEN ''UPDATE''::text
            WHEN ''d''::"char" THEN ''DELETE''::text
            WHEN ''*''::"char" THEN ''ALL''::text
            ELSE NULL::text
        END AS cmd,
    pg_get_expr(pol.polqual, pol.polrelid) AS qual,
    pg_get_expr(pol.polwithcheck, pol.polrelid) AS with_check
   FROM ((pg_policy pol
     JOIN pg_class c ON ((c.oid = pol.polrelid)))
     LEFT JOIN pg_namespace n ON ((n.oid = c.relnamespace)));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_rules', ' SELECT n.nspname AS schemaname,
    c.relname AS tablename,
    r.rulename,
    pg_get_ruledef(r.oid) AS definition
   FROM ((pg_rewrite r
     JOIN pg_class c ON ((c.oid = r.ev_class)))
     LEFT JOIN pg_namespace n ON ((n.oid = c.relnamespace)))
  WHERE (r.rulename <> ''_RETURN''::name);', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_views', ' SELECT n.nspname AS schemaname,
    c.relname AS viewname,
    pg_get_userbyid(c.relowner) AS viewowner,
    pg_get_viewdef(c.oid) AS definition
   FROM (pg_class c
     LEFT JOIN pg_namespace n ON ((n.oid = c.relnamespace)))
  WHERE (c.relkind = ''v''::"char");', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_tables', ' SELECT n.nspname AS schemaname,
    c.relname AS tablename,
    pg_get_userbyid(c.relowner) AS tableowner,
    t.spcname AS tablespace,
    c.relhasindex AS hasindexes,
    c.relhasrules AS hasrules,
    c.relhastriggers AS hastriggers,
    c.relrowsecurity AS rowsecurity
   FROM ((pg_class c
     LEFT JOIN pg_namespace n ON ((n.oid = c.relnamespace)))
     LEFT JOIN pg_tablespace t ON ((t.oid = c.reltablespace)))
  WHERE (c.relkind = ANY (ARRAY[''r''::"char", ''p''::"char"]));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_indexes', ' SELECT n.nspname AS schemaname,
    c.relname AS tablename,
    i.relname AS indexname,
    t.spcname AS tablespace,
    pg_get_indexdef(i.oid) AS indexdef
   FROM ((((pg_index x
     JOIN pg_class c ON ((c.oid = x.indrelid)))
     JOIN pg_class i ON ((i.oid = x.indexrelid)))
     LEFT JOIN pg_namespace n ON ((n.oid = c.relnamespace)))
     LEFT JOIN pg_tablespace t ON ((t.oid = i.reltablespace)))
  WHERE ((c.relkind = ANY (ARRAY[''r''::"char", ''m''::"char"])) AND (i.relkind = ''i''::"char"));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_sequences', ' SELECT n.nspname AS schemaname,
    c.relname AS sequencename,
    pg_get_userbyid(c.relowner) AS sequenceowner,
    (s.seqtypid)::regtype AS data_type,
    s.seqstart AS start_value,
    s.seqmin AS min_value,
    s.seqmax AS max_value,
    s.seqincrement AS increment_by,
    s.seqcycle AS cycle,
    s.seqcache AS cache_size,
        CASE
            WHEN has_sequence_privilege(c.oid, ''SELECT,USAGE''::text) THEN pg_sequence_last_value((c.oid)::regclass)
            ELSE NULL::bigint
        END AS last_value
   FROM ((pg_sequence s
     JOIN pg_class c ON ((c.oid = s.seqrelid)))
     LEFT JOIN pg_namespace n ON ((n.oid = c.relnamespace)))
  WHERE ((NOT pg_is_other_temp_schema(n.oid)) AND (c.relkind = ''S''::"char"));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_stats', ' SELECT n.nspname AS schemaname,
    c.relname AS tablename,
    a.attname,
    s.stainherit AS inherited,
    s.stanullfrac AS null_frac,
    s.stawidth AS avg_width,
    s.stadistinct AS n_distinct,
        CASE
            WHEN (s.stakind1 = 1) THEN s.stavalues1
            WHEN (s.stakind2 = 1) THEN s.stavalues2
            WHEN (s.stakind3 = 1) THEN s.stavalues3
            WHEN (s.stakind4 = 1) THEN s.stavalues4
            WHEN (s.stakind5 = 1) THEN s.stavalues5
            ELSE NULL::anyarray
        END AS most_common_vals,
        CASE
            WHEN (s.stakind1 = 1) THEN s.stanumbers1
            WHEN (s.stakind2 = 1) THEN s.stanumbers2
            WHEN (s.stakind3 = 1) THEN s.stanumbers3
            WHEN (s.stakind4 = 1) THEN s.stanumbers4
            WHEN (s.stakind5 = 1) THEN s.stanumbers5
            ELSE NULL::real[]
        END AS most_common_freqs,
        CASE
            WHEN (s.stakind1 = 2) THEN s.stavalues1
            WHEN (s.stakind2 = 2) THEN s.stavalues2
            WHEN (s.stakind3 = 2) THEN s.stavalues3
            WHEN (s.stakind4 = 2) THEN s.stavalues4
            WHEN (s.stakind5 = 2) THEN s.stavalues5
            ELSE NULL::anyarray
        END AS histogram_bounds,
        CASE
            WHEN (s.stakind1 = 3) THEN s.stanumbers1[1]
            WHEN (s.stakind2 = 3) THEN s.stanumbers2[1]
            WHEN (s.stakind3 = 3) THEN s.stanumbers3[1]
            WHEN (s.stakind4 = 3) THEN s.stanumbers4[1]
            WHEN (s.stakind5 = 3) THEN s.stanumbers5[1]
            ELSE NULL::real
        END AS correlation,
        CASE
            WHEN (s.stakind1 = 4) THEN s.stavalues1
            WHEN (s.stakind2 = 4) THEN s.stavalues2
            WHEN (s.stakind3 = 4) THEN s.stavalues3
            WHEN (s.stakind4 = 4) THEN s.stavalues4
            WHEN (s.stakind5 = 4) THEN s.stavalues5
            ELSE NULL::anyarray
        END AS most_common_elems,
        CASE
            WHEN (s.stakind1 = 4) THEN s.stanumbers1
            WHEN (s.stakind2 = 4) THEN s.stanumbers2
            WHEN (s.stakind3 = 4) THEN s.stanumbers3
            WHEN (s.stakind4 = 4) THEN s.stanumbers4
            WHEN (s.stakind5 = 4) THEN s.stanumbers5
            ELSE NULL::real[]
        END AS most_common_elem_freqs,
        CASE
            WHEN (s.stakind1 = 5) THEN s.stanumbers1
            WHEN (s.stakind2 = 5) THEN s.stanumbers2
            WHEN (s.stakind3 = 5) THEN s.stanumbers3
            WHEN (s.stakind4 = 5) THEN s.stanumbers4
            WHEN (s.stakind5 = 5) THEN s.stanumbers5
            ELSE NULL::real[]
        END AS elem_count_histogram
   FROM (((pg_statistic s
     JOIN pg_class c ON ((c.oid = s.starelid)))
     JOIN pg_attribute a ON (((c.oid = a.attrelid) AND (a.attnum = s.staattnum))))
     LEFT JOIN pg_namespace n ON ((n.oid = c.relnamespace)))
  WHERE ((NOT a.attisdropped) AND has_column_privilege(c.oid, a.attnum, ''select''::text) AND ((c.relrowsecurity = false) OR (NOT row_security_active(c.oid))));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_publication_tables', ' SELECT p.pubname,
    n.nspname AS schemaname,
    c.relname AS tablename
   FROM pg_publication p,
    (pg_class c
     JOIN pg_namespace n ON ((n.oid = c.relnamespace)))
  WHERE (c.oid IN ( SELECT pg_get_publication_tables.relid
           FROM pg_get_publication_tables((p.pubname)::text) pg_get_publication_tables(relid)));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_locks', ' SELECT l.locktype,
    l.database,
    l.relation,
    l.page,
    l.tuple,
    l.virtualxid,
    l.transactionid,
    l.classid,
    l.objid,
    l.objsubid,
    l.virtualtransaction,
    l.pid,
    l.mode,
    l.granted,
    l.fastpath
   FROM pg_lock_status() l(locktype, database, relation, page, tuple, virtualxid, transactionid, classid, objid, objsubid, virtualtransaction, pid, mode, granted, fastpath);', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_cursors', ' SELECT c.name,
    c.statement,
    c.is_holdable,
    c.is_binary,
    c.is_scrollable,
    c.creation_time
   FROM pg_cursor() c(name, statement, is_holdable, is_binary, is_scrollable, creation_time);', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_available_extensions', ' SELECT e.name,
    e.default_version,
    x.extversion AS installed_version,
    e.comment
   FROM (pg_available_extensions() e(name, default_version, comment)
     LEFT JOIN pg_extension x ON ((e.name = x.extname)));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_available_extension_versions', ' SELECT e.name,
    e.version,
    (x.extname IS NOT NULL) AS installed,
    e.superuser,
    e.relocatable,
    e.schema,
    e.requires,
    e.comment
   FROM (pg_available_extension_versions() e(name, version, superuser, relocatable, schema, requires, comment)
     LEFT JOIN pg_extension x ON (((e.name = x.extname) AND (e.version = x.extversion))));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_prepared_xacts', ' SELECT p.transaction,
    p.gid,
    p.prepared,
    u.rolname AS owner,
    d.datname AS database
   FROM ((pg_prepared_xact() p(transaction, gid, prepared, ownerid, dbid)
     LEFT JOIN pg_authid u ON ((p.ownerid = u.oid)))
     LEFT JOIN pg_database d ON ((p.dbid = d.oid)));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_prepared_statements', ' SELECT p.name,
    p.statement,
    p.prepare_time,
    p.parameter_types,
    p.from_sql
   FROM pg_prepared_statement() p(name, statement, prepare_time, parameter_types, from_sql);', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_seclabels', ' SELECT l.objoid,
    l.classoid,
    l.objsubid,
        CASE
            WHEN (rel.relkind = ANY (ARRAY[''r''::"char", ''p''::"char"])) THEN ''table''::text
            WHEN (rel.relkind = ''v''::"char") THEN ''view''::text
            WHEN (rel.relkind = ''m''::"char") THEN ''materialized view''::text
            WHEN (rel.relkind = ''S''::"char") THEN ''sequence''::text
            WHEN (rel.relkind = ''f''::"char") THEN ''foreign table''::text
            ELSE NULL::text
        END AS objtype,
    rel.relnamespace AS objnamespace,
        CASE
            WHEN pg_table_is_visible(rel.oid) THEN quote_ident((rel.relname)::text)
            ELSE ((quote_ident((nsp.nspname)::text) || ''.''::text) || quote_ident((rel.relname)::text))
        END AS objname,
    l.provider,
    l.label
   FROM ((pg_seclabel l
     JOIN pg_class rel ON (((l.classoid = rel.tableoid) AND (l.objoid = rel.oid))))
     JOIN pg_namespace nsp ON ((rel.relnamespace = nsp.oid)))
  WHERE (l.objsubid = 0)
UNION ALL
 SELECT l.objoid,
    l.classoid,
    l.objsubid,
    ''column''::text AS objtype,
    rel.relnamespace AS objnamespace,
    ((
        CASE
            WHEN pg_table_is_visible(rel.oid) THEN quote_ident((rel.relname)::text)
            ELSE ((quote_ident((nsp.nspname)::text) || ''.''::text) || quote_ident((rel.relname)::text))
        END || ''.''::text) || (att.attname)::text) AS objname,
    l.provider,
    l.label
   FROM (((pg_seclabel l
     JOIN pg_class rel ON (((l.classoid = rel.tableoid) AND (l.objoid = rel.oid))))
     JOIN pg_attribute att ON (((rel.oid = att.attrelid) AND (l.objsubid = att.attnum))))
     JOIN pg_namespace nsp ON ((rel.relnamespace = nsp.oid)))
  WHERE (l.objsubid <> 0)
UNION ALL
 SELECT l.objoid,
    l.classoid,
    l.objsubid,
        CASE pro.prokind
            WHEN ''a''::"char" THEN ''aggregate''::text
            WHEN ''f''::"char" THEN ''function''::text
            WHEN ''p''::"char" THEN ''procedure''::text
            WHEN ''w''::"char" THEN ''window''::text
            ELSE NULL::text
        END AS objtype,
    pro.pronamespace AS objnamespace,
    (((
        CASE
            WHEN pg_function_is_visible(pro.oid) THEN quote_ident((pro.proname)::text)
            ELSE ((quote_ident((nsp.nspname)::text) || ''.''::text) || quote_ident((pro.proname)::text))
        END || ''(''::text) || pg_get_function_arguments(pro.oid)) || '')''::text) AS objname,
    l.provider,
    l.label
   FROM ((pg_seclabel l
     JOIN pg_proc pro ON (((l.classoid = pro.tableoid) AND (l.objoid = pro.oid))))
     JOIN pg_namespace nsp ON ((pro.pronamespace = nsp.oid)))
  WHERE (l.objsubid = 0)
UNION ALL
 SELECT l.objoid,
    l.classoid,
    l.objsubid,
        CASE
            WHEN (typ.typtype = ''d''::"char") THEN ''domain''::text
            ELSE ''type''::text
        END AS objtype,
    typ.typnamespace AS objnamespace,
        CASE
            WHEN pg_type_is_visible(typ.oid) THEN quote_ident((typ.typname)::text)
            ELSE ((quote_ident((nsp.nspname)::text) || ''.''::text) || quote_ident((typ.typname)::text))
        END AS objname,
    l.provider,
    l.label
   FROM ((pg_seclabel l
     JOIN pg_type typ ON (((l.classoid = typ.tableoid) AND (l.objoid = typ.oid))))
     JOIN pg_namespace nsp ON ((typ.typnamespace = nsp.oid)))
  WHERE (l.objsubid = 0)
UNION ALL
 SELECT l.objoid,
    l.classoid,
    l.objsubid,
    ''large object''::text AS objtype,
    NULL::oid AS objnamespace,
    (l.objoid)::text AS objname,
    l.provider,
    l.label
   FROM (pg_seclabel l
     JOIN pg_largeobject_metadata lom ON ((l.objoid = lom.oid)))
  WHERE ((l.classoid = (''pg_largeobject''::regclass)::oid) AND (l.objsubid = 0))
UNION ALL
 SELECT l.objoid,
    l.classoid,
    l.objsubid,
    ''language''::text AS objtype,
    NULL::oid AS objnamespace,
    quote_ident((lan.lanname)::text) AS objname,
    l.provider,
    l.label
   FROM (pg_seclabel l
     JOIN pg_language lan ON (((l.classoid = lan.tableoid) AND (l.objoid = lan.oid))))
  WHERE (l.objsubid = 0)
UNION ALL
 SELECT l.objoid,
    l.classoid,
    l.objsubid,
    ''schema''::text AS objtype,
    nsp.oid AS objnamespace,
    quote_ident((nsp.nspname)::text) AS objname,
    l.provider,
    l.label
   FROM (pg_seclabel l
     JOIN pg_namespace nsp ON (((l.classoid = nsp.tableoid) AND (l.objoid = nsp.oid))))
  WHERE (l.objsubid = 0)
UNION ALL
 SELECT l.objoid,
    l.classoid,
    l.objsubid,
    ''event trigger''::text AS objtype,
    NULL::oid AS objnamespace,
    quote_ident((evt.evtname)::text) AS objname,
    l.provider,
    l.label
   FROM (pg_seclabel l
     JOIN pg_event_trigger evt ON (((l.classoid = evt.tableoid) AND (l.objoid = evt.oid))))
  WHERE (l.objsubid = 0)
UNION ALL
 SELECT l.objoid,
    l.classoid,
    l.objsubid,
    ''publication''::text AS objtype,
    NULL::oid AS objnamespace,
    quote_ident((p.pubname)::text) AS objname,
    l.provider,
    l.label
   FROM (pg_seclabel l
     JOIN pg_publication p ON (((l.classoid = p.tableoid) AND (l.objoid = p.oid))))
  WHERE (l.objsubid = 0)
UNION ALL
 SELECT l.objoid,
    l.classoid,
    0 AS objsubid,
    ''subscription''::text AS objtype,
    NULL::oid AS objnamespace,
    quote_ident((s.subname)::text) AS objname,
    l.provider,
    l.label
   FROM (pg_shseclabel l
     JOIN pg_subscription s ON (((l.classoid = s.tableoid) AND (l.objoid = s.oid))))
UNION ALL
 SELECT l.objoid,
    l.classoid,
    0 AS objsubid,
    ''database''::text AS objtype,
    NULL::oid AS objnamespace,
    quote_ident((dat.datname)::text) AS objname,
    l.provider,
    l.label
   FROM (pg_shseclabel l
     JOIN pg_database dat ON (((l.classoid = dat.tableoid) AND (l.objoid = dat.oid))))
UNION ALL
 SELECT l.objoid,
    l.classoid,
    0 AS objsubid,
    ''tablespace''::text AS objtype,
    NULL::oid AS objnamespace,
    quote_ident((spc.spcname)::text) AS objname,
    l.provider,
    l.label
   FROM (pg_shseclabel l
     JOIN pg_tablespace spc ON (((l.classoid = spc.tableoid) AND (l.objoid = spc.oid))))
UNION ALL
 SELECT l.objoid,
    l.classoid,
    0 AS objsubid,
    ''role''::text AS objtype,
    NULL::oid AS objnamespace,
    quote_ident((rol.rolname)::text) AS objname,
    l.provider,
    l.label
   FROM (pg_shseclabel l
     JOIN pg_authid rol ON (((l.classoid = rol.tableoid) AND (l.objoid = rol.oid))));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_statio_sys_indexes', ' SELECT pg_statio_all_indexes.relid,
    pg_statio_all_indexes.indexrelid,
    pg_statio_all_indexes.schemaname,
    pg_statio_all_indexes.relname,
    pg_statio_all_indexes.indexrelname,
    pg_statio_all_indexes.idx_blks_read,
    pg_statio_all_indexes.idx_blks_hit
   FROM pg_statio_all_indexes
  WHERE ((pg_statio_all_indexes.schemaname = ANY (ARRAY[''pg_catalog''::name, ''information_schema''::name])) OR (pg_statio_all_indexes.schemaname ~ ''^pg_toast''::text));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_timezone_abbrevs', ' SELECT pg_timezone_abbrevs.abbrev,
    pg_timezone_abbrevs.utc_offset,
    pg_timezone_abbrevs.is_dst
   FROM pg_timezone_abbrevs() pg_timezone_abbrevs(abbrev, utc_offset, is_dst);', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_timezone_names', ' SELECT pg_timezone_names.name,
    pg_timezone_names.abbrev,
    pg_timezone_names.utc_offset,
    pg_timezone_names.is_dst
   FROM pg_timezone_names() pg_timezone_names(name, abbrev, utc_offset, is_dst);', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_stat_all_tables', ' SELECT c.oid AS relid,
    n.nspname AS schemaname,
    c.relname,
    pg_stat_get_numscans(c.oid) AS seq_scan,
    pg_stat_get_tuples_returned(c.oid) AS seq_tup_read,
    (sum(pg_stat_get_numscans(i.indexrelid)))::bigint AS idx_scan,
    ((sum(pg_stat_get_tuples_fetched(i.indexrelid)))::bigint + pg_stat_get_tuples_fetched(c.oid)) AS idx_tup_fetch,
    pg_stat_get_tuples_inserted(c.oid) AS n_tup_ins,
    pg_stat_get_tuples_updated(c.oid) AS n_tup_upd,
    pg_stat_get_tuples_deleted(c.oid) AS n_tup_del,
    pg_stat_get_tuples_hot_updated(c.oid) AS n_tup_hot_upd,
    pg_stat_get_live_tuples(c.oid) AS n_live_tup,
    pg_stat_get_dead_tuples(c.oid) AS n_dead_tup,
    pg_stat_get_mod_since_analyze(c.oid) AS n_mod_since_analyze,
    pg_stat_get_last_vacuum_time(c.oid) AS last_vacuum,
    pg_stat_get_last_autovacuum_time(c.oid) AS last_autovacuum,
    pg_stat_get_last_analyze_time(c.oid) AS last_analyze,
    pg_stat_get_last_autoanalyze_time(c.oid) AS last_autoanalyze,
    pg_stat_get_vacuum_count(c.oid) AS vacuum_count,
    pg_stat_get_autovacuum_count(c.oid) AS autovacuum_count,
    pg_stat_get_analyze_count(c.oid) AS analyze_count,
    pg_stat_get_autoanalyze_count(c.oid) AS autoanalyze_count
   FROM ((pg_class c
     LEFT JOIN pg_index i ON ((c.oid = i.indrelid)))
     LEFT JOIN pg_namespace n ON ((n.oid = c.relnamespace)))
  WHERE (c.relkind = ANY (ARRAY[''r''::"char", ''t''::"char", ''m''::"char"]))
  GROUP BY c.oid, n.nspname, c.relname;', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_stat_xact_all_tables', ' SELECT c.oid AS relid,
    n.nspname AS schemaname,
    c.relname,
    pg_stat_get_xact_numscans(c.oid) AS seq_scan,
    pg_stat_get_xact_tuples_returned(c.oid) AS seq_tup_read,
    (sum(pg_stat_get_xact_numscans(i.indexrelid)))::bigint AS idx_scan,
    ((sum(pg_stat_get_xact_tuples_fetched(i.indexrelid)))::bigint + pg_stat_get_xact_tuples_fetched(c.oid)) AS idx_tup_fetch,
    pg_stat_get_xact_tuples_inserted(c.oid) AS n_tup_ins,
    pg_stat_get_xact_tuples_updated(c.oid) AS n_tup_upd,
    pg_stat_get_xact_tuples_deleted(c.oid) AS n_tup_del,
    pg_stat_get_xact_tuples_hot_updated(c.oid) AS n_tup_hot_upd
   FROM ((pg_class c
     LEFT JOIN pg_index i ON ((c.oid = i.indrelid)))
     LEFT JOIN pg_namespace n ON ((n.oid = c.relnamespace)))
  WHERE (c.relkind = ANY (ARRAY[''r''::"char", ''t''::"char", ''m''::"char"]))
  GROUP BY c.oid, n.nspname, c.relname;', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_stat_sys_tables', ' SELECT pg_stat_all_tables.relid,
    pg_stat_all_tables.schemaname,
    pg_stat_all_tables.relname,
    pg_stat_all_tables.seq_scan,
    pg_stat_all_tables.seq_tup_read,
    pg_stat_all_tables.idx_scan,
    pg_stat_all_tables.idx_tup_fetch,
    pg_stat_all_tables.n_tup_ins,
    pg_stat_all_tables.n_tup_upd,
    pg_stat_all_tables.n_tup_del,
    pg_stat_all_tables.n_tup_hot_upd,
    pg_stat_all_tables.n_live_tup,
    pg_stat_all_tables.n_dead_tup,
    pg_stat_all_tables.n_mod_since_analyze,
    pg_stat_all_tables.last_vacuum,
    pg_stat_all_tables.last_autovacuum,
    pg_stat_all_tables.last_analyze,
    pg_stat_all_tables.last_autoanalyze,
    pg_stat_all_tables.vacuum_count,
    pg_stat_all_tables.autovacuum_count,
    pg_stat_all_tables.analyze_count,
    pg_stat_all_tables.autoanalyze_count
   FROM pg_stat_all_tables
  WHERE ((pg_stat_all_tables.schemaname = ANY (ARRAY[''pg_catalog''::name, ''information_schema''::name])) OR (pg_stat_all_tables.schemaname ~ ''^pg_toast''::text));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_stat_xact_sys_tables', ' SELECT pg_stat_xact_all_tables.relid,
    pg_stat_xact_all_tables.schemaname,
    pg_stat_xact_all_tables.relname,
    pg_stat_xact_all_tables.seq_scan,
    pg_stat_xact_all_tables.seq_tup_read,
    pg_stat_xact_all_tables.idx_scan,
    pg_stat_xact_all_tables.idx_tup_fetch,
    pg_stat_xact_all_tables.n_tup_ins,
    pg_stat_xact_all_tables.n_tup_upd,
    pg_stat_xact_all_tables.n_tup_del,
    pg_stat_xact_all_tables.n_tup_hot_upd
   FROM pg_stat_xact_all_tables
  WHERE ((pg_stat_xact_all_tables.schemaname = ANY (ARRAY[''pg_catalog''::name, ''information_schema''::name])) OR (pg_stat_xact_all_tables.schemaname ~ ''^pg_toast''::text));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_stat_user_tables', ' SELECT pg_stat_all_tables.relid,
    pg_stat_all_tables.schemaname,
    pg_stat_all_tables.relname,
    pg_stat_all_tables.seq_scan,
    pg_stat_all_tables.seq_tup_read,
    pg_stat_all_tables.idx_scan,
    pg_stat_all_tables.idx_tup_fetch,
    pg_stat_all_tables.n_tup_ins,
    pg_stat_all_tables.n_tup_upd,
    pg_stat_all_tables.n_tup_del,
    pg_stat_all_tables.n_tup_hot_upd,
    pg_stat_all_tables.n_live_tup,
    pg_stat_all_tables.n_dead_tup,
    pg_stat_all_tables.n_mod_since_analyze,
    pg_stat_all_tables.last_vacuum,
    pg_stat_all_tables.last_autovacuum,
    pg_stat_all_tables.last_analyze,
    pg_stat_all_tables.last_autoanalyze,
    pg_stat_all_tables.vacuum_count,
    pg_stat_all_tables.autovacuum_count,
    pg_stat_all_tables.analyze_count,
    pg_stat_all_tables.autoanalyze_count
   FROM pg_stat_all_tables
  WHERE ((pg_stat_all_tables.schemaname <> ALL (ARRAY[''pg_catalog''::name, ''information_schema''::name])) AND (pg_stat_all_tables.schemaname !~ ''^pg_toast''::text));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_stat_xact_user_tables', ' SELECT pg_stat_xact_all_tables.relid,
    pg_stat_xact_all_tables.schemaname,
    pg_stat_xact_all_tables.relname,
    pg_stat_xact_all_tables.seq_scan,
    pg_stat_xact_all_tables.seq_tup_read,
    pg_stat_xact_all_tables.idx_scan,
    pg_stat_xact_all_tables.idx_tup_fetch,
    pg_stat_xact_all_tables.n_tup_ins,
    pg_stat_xact_all_tables.n_tup_upd,
    pg_stat_xact_all_tables.n_tup_del,
    pg_stat_xact_all_tables.n_tup_hot_upd
   FROM pg_stat_xact_all_tables
  WHERE ((pg_stat_xact_all_tables.schemaname <> ALL (ARRAY[''pg_catalog''::name, ''information_schema''::name])) AND (pg_stat_xact_all_tables.schemaname !~ ''^pg_toast''::text));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_statio_all_tables', ' SELECT c.oid AS relid,
    n.nspname AS schemaname,
    c.relname,
    (pg_stat_get_blocks_fetched(c.oid) - pg_stat_get_blocks_hit(c.oid)) AS heap_blks_read,
    pg_stat_get_blocks_hit(c.oid) AS heap_blks_hit,
    (sum((pg_stat_get_blocks_fetched(i.indexrelid) - pg_stat_get_blocks_hit(i.indexrelid))))::bigint AS idx_blks_read,
    (sum(pg_stat_get_blocks_hit(i.indexrelid)))::bigint AS idx_blks_hit,
    (pg_stat_get_blocks_fetched(t.oid) - pg_stat_get_blocks_hit(t.oid)) AS toast_blks_read,
    pg_stat_get_blocks_hit(t.oid) AS toast_blks_hit,
    (sum((pg_stat_get_blocks_fetched(x.indexrelid) - pg_stat_get_blocks_hit(x.indexrelid))))::bigint AS tidx_blks_read,
    (sum(pg_stat_get_blocks_hit(x.indexrelid)))::bigint AS tidx_blks_hit
   FROM ((((pg_class c
     LEFT JOIN pg_index i ON ((c.oid = i.indrelid)))
     LEFT JOIN pg_class t ON ((c.reltoastrelid = t.oid)))
     LEFT JOIN pg_index x ON ((t.oid = x.indrelid)))
     LEFT JOIN pg_namespace n ON ((n.oid = c.relnamespace)))
  WHERE (c.relkind = ANY (ARRAY[''r''::"char", ''t''::"char", ''m''::"char"]))
  GROUP BY c.oid, n.nspname, c.relname, t.oid, x.indrelid;', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_statio_sys_tables', ' SELECT pg_statio_all_tables.relid,
    pg_statio_all_tables.schemaname,
    pg_statio_all_tables.relname,
    pg_statio_all_tables.heap_blks_read,
    pg_statio_all_tables.heap_blks_hit,
    pg_statio_all_tables.idx_blks_read,
    pg_statio_all_tables.idx_blks_hit,
    pg_statio_all_tables.toast_blks_read,
    pg_statio_all_tables.toast_blks_hit,
    pg_statio_all_tables.tidx_blks_read,
    pg_statio_all_tables.tidx_blks_hit
   FROM pg_statio_all_tables
  WHERE ((pg_statio_all_tables.schemaname = ANY (ARRAY[''pg_catalog''::name, ''information_schema''::name])) OR (pg_statio_all_tables.schemaname ~ ''^pg_toast''::text));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_statio_user_tables', ' SELECT pg_statio_all_tables.relid,
    pg_statio_all_tables.schemaname,
    pg_statio_all_tables.relname,
    pg_statio_all_tables.heap_blks_read,
    pg_statio_all_tables.heap_blks_hit,
    pg_statio_all_tables.idx_blks_read,
    pg_statio_all_tables.idx_blks_hit,
    pg_statio_all_tables.toast_blks_read,
    pg_statio_all_tables.toast_blks_hit,
    pg_statio_all_tables.tidx_blks_read,
    pg_statio_all_tables.tidx_blks_hit
   FROM pg_statio_all_tables
  WHERE ((pg_statio_all_tables.schemaname <> ALL (ARRAY[''pg_catalog''::name, ''information_schema''::name])) AND (pg_statio_all_tables.schemaname !~ ''^pg_toast''::text));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_stat_all_indexes', ' SELECT c.oid AS relid,
    i.oid AS indexrelid,
    n.nspname AS schemaname,
    c.relname,
    i.relname AS indexrelname,
    pg_stat_get_numscans(i.oid) AS idx_scan,
    pg_stat_get_tuples_returned(i.oid) AS idx_tup_read,
    pg_stat_get_tuples_fetched(i.oid) AS idx_tup_fetch
   FROM (((pg_class c
     JOIN pg_index x ON ((c.oid = x.indrelid)))
     JOIN pg_class i ON ((i.oid = x.indexrelid)))
     LEFT JOIN pg_namespace n ON ((n.oid = c.relnamespace)))
  WHERE (c.relkind = ANY (ARRAY[''r''::"char", ''t''::"char", ''m''::"char"]));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_stat_sys_indexes', ' SELECT pg_stat_all_indexes.relid,
    pg_stat_all_indexes.indexrelid,
    pg_stat_all_indexes.schemaname,
    pg_stat_all_indexes.relname,
    pg_stat_all_indexes.indexrelname,
    pg_stat_all_indexes.idx_scan,
    pg_stat_all_indexes.idx_tup_read,
    pg_stat_all_indexes.idx_tup_fetch
   FROM pg_stat_all_indexes
  WHERE ((pg_stat_all_indexes.schemaname = ANY (ARRAY[''pg_catalog''::name, ''information_schema''::name])) OR (pg_stat_all_indexes.schemaname ~ ''^pg_toast''::text));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_stat_user_indexes', ' SELECT pg_stat_all_indexes.relid,
    pg_stat_all_indexes.indexrelid,
    pg_stat_all_indexes.schemaname,
    pg_stat_all_indexes.relname,
    pg_stat_all_indexes.indexrelname,
    pg_stat_all_indexes.idx_scan,
    pg_stat_all_indexes.idx_tup_read,
    pg_stat_all_indexes.idx_tup_fetch
   FROM pg_stat_all_indexes
  WHERE ((pg_stat_all_indexes.schemaname <> ALL (ARRAY[''pg_catalog''::name, ''information_schema''::name])) AND (pg_stat_all_indexes.schemaname !~ ''^pg_toast''::text));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_statio_user_indexes', ' SELECT pg_statio_all_indexes.relid,
    pg_statio_all_indexes.indexrelid,
    pg_statio_all_indexes.schemaname,
    pg_statio_all_indexes.relname,
    pg_statio_all_indexes.indexrelname,
    pg_statio_all_indexes.idx_blks_read,
    pg_statio_all_indexes.idx_blks_hit
   FROM pg_statio_all_indexes
  WHERE ((pg_statio_all_indexes.schemaname <> ALL (ARRAY[''pg_catalog''::name, ''information_schema''::name])) AND (pg_statio_all_indexes.schemaname !~ ''^pg_toast''::text));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_statio_all_sequences', ' SELECT c.oid AS relid,
    n.nspname AS schemaname,
    c.relname,
    (pg_stat_get_blocks_fetched(c.oid) - pg_stat_get_blocks_hit(c.oid)) AS blks_read,
    pg_stat_get_blocks_hit(c.oid) AS blks_hit
   FROM (pg_class c
     LEFT JOIN pg_namespace n ON ((n.oid = c.relnamespace)))
  WHERE (c.relkind = ''S''::"char");', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_statio_sys_sequences', ' SELECT pg_statio_all_sequences.relid,
    pg_statio_all_sequences.schemaname,
    pg_statio_all_sequences.relname,
    pg_statio_all_sequences.blks_read,
    pg_statio_all_sequences.blks_hit
   FROM pg_statio_all_sequences
  WHERE ((pg_statio_all_sequences.schemaname = ANY (ARRAY[''pg_catalog''::name, ''information_schema''::name])) OR (pg_statio_all_sequences.schemaname ~ ''^pg_toast''::text));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_statio_user_sequences', ' SELECT pg_statio_all_sequences.relid,
    pg_statio_all_sequences.schemaname,
    pg_statio_all_sequences.relname,
    pg_statio_all_sequences.blks_read,
    pg_statio_all_sequences.blks_hit
   FROM pg_statio_all_sequences
  WHERE ((pg_statio_all_sequences.schemaname <> ALL (ARRAY[''pg_catalog''::name, ''information_schema''::name])) AND (pg_statio_all_sequences.schemaname !~ ''^pg_toast''::text));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_stat_activity', ' SELECT s.datid,
    d.datname,
    s.pid,
    s.usesysid,
    u.rolname AS usename,
    s.application_name,
    s.client_addr,
    s.client_hostname,
    s.client_port,
    s.backend_start,
    s.xact_start,
    s.query_start,
    s.state_change,
    s.wait_event_type,
    s.wait_event,
    s.state,
    s.backend_xid,
    s.backend_xmin,
    s.query,
    s.backend_type
   FROM ((pg_stat_get_activity(NULL::integer) s(datid, pid, usesysid, application_name, state, query, wait_event_type, wait_event, xact_start, query_start, backend_start, state_change, client_addr, client_hostname, client_port, backend_xid, backend_xmin, backend_type, ssl, sslversion, sslcipher, sslbits, sslcompression, sslclientdn)
     LEFT JOIN pg_database d ON ((s.datid = d.oid)))
     LEFT JOIN pg_authid u ON ((s.usesysid = u.oid)));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_stat_replication', ' SELECT s.pid,
    s.usesysid,
    u.rolname AS usename,
    s.application_name,
    s.client_addr,
    s.client_hostname,
    s.client_port,
    s.backend_start,
    s.backend_xmin,
    w.state,
    w.sent_lsn,
    w.write_lsn,
    w.flush_lsn,
    w.replay_lsn,
    w.write_lag,
    w.flush_lag,
    w.replay_lag,
    w.sync_priority,
    w.sync_state
   FROM ((pg_stat_get_activity(NULL::integer) s(datid, pid, usesysid, application_name, state, query, wait_event_type, wait_event, xact_start, query_start, backend_start, state_change, client_addr, client_hostname, client_port, backend_xid, backend_xmin, backend_type, ssl, sslversion, sslcipher, sslbits, sslcompression, sslclientdn)
     JOIN pg_stat_get_wal_senders() w(pid, state, sent_lsn, write_lsn, flush_lsn, replay_lsn, write_lag, flush_lag, replay_lag, sync_priority, sync_state) ON ((s.pid = w.pid)))
     LEFT JOIN pg_authid u ON ((s.usesysid = u.oid)));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_stat_wal_receiver', ' SELECT s.pid,
    s.status,
    s.receive_start_lsn,
    s.receive_start_tli,
    s.received_lsn,
    s.received_tli,
    s.last_msg_send_time,
    s.last_msg_receipt_time,
    s.latest_end_lsn,
    s.latest_end_time,
    s.slot_name,
    s.sender_host,
    s.sender_port,
    s.conninfo
   FROM pg_stat_get_wal_receiver() s(pid, status, receive_start_lsn, receive_start_tli, received_lsn, received_tli, last_msg_send_time, last_msg_receipt_time, latest_end_lsn, latest_end_time, slot_name, sender_host, sender_port, conninfo)
  WHERE (s.pid IS NOT NULL);', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_stat_subscription', ' SELECT su.oid AS subid,
    su.subname,
    st.pid,
    st.relid,
    st.received_lsn,
    st.last_msg_send_time,
    st.last_msg_receipt_time,
    st.latest_end_lsn,
    st.latest_end_time
   FROM (pg_subscription su
     LEFT JOIN pg_stat_get_subscription(NULL::oid) st(subid, relid, pid, received_lsn, last_msg_send_time, last_msg_receipt_time, latest_end_lsn, latest_end_time) ON ((st.subid = su.oid)));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_stat_ssl', ' SELECT s.pid,
    s.ssl,
    s.sslversion AS version,
    s.sslcipher AS cipher,
    s.sslbits AS bits,
    s.sslcompression AS compression,
    s.sslclientdn AS clientdn
   FROM pg_stat_get_activity(NULL::integer) s(datid, pid, usesysid, application_name, state, query, wait_event_type, wait_event, xact_start, query_start, backend_start, state_change, client_addr, client_hostname, client_port, backend_xid, backend_xmin, backend_type, ssl, sslversion, sslcipher, sslbits, sslcompression, sslclientdn);', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_replication_slots', ' SELECT l.slot_name,
    l.plugin,
    l.slot_type,
    l.datoid,
    d.datname AS database,
    l.temporary,
    l.active,
    l.active_pid,
    l.xmin,
    l.catalog_xmin,
    l.restart_lsn,
    l.confirmed_flush_lsn
   FROM (pg_get_replication_slots() l(slot_name, plugin, slot_type, datoid, temporary, active, active_pid, xmin, catalog_xmin, restart_lsn, confirmed_flush_lsn)
     LEFT JOIN pg_database d ON ((l.datoid = d.oid)));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_stat_database', ' SELECT d.oid AS datid,
    d.datname,
    pg_stat_get_db_numbackends(d.oid) AS numbackends,
    pg_stat_get_db_xact_commit(d.oid) AS xact_commit,
    pg_stat_get_db_xact_rollback(d.oid) AS xact_rollback,
    (pg_stat_get_db_blocks_fetched(d.oid) - pg_stat_get_db_blocks_hit(d.oid)) AS blks_read,
    pg_stat_get_db_blocks_hit(d.oid) AS blks_hit,
    pg_stat_get_db_tuples_returned(d.oid) AS tup_returned,
    pg_stat_get_db_tuples_fetched(d.oid) AS tup_fetched,
    pg_stat_get_db_tuples_inserted(d.oid) AS tup_inserted,
    pg_stat_get_db_tuples_updated(d.oid) AS tup_updated,
    pg_stat_get_db_tuples_deleted(d.oid) AS tup_deleted,
    pg_stat_get_db_conflict_all(d.oid) AS conflicts,
    pg_stat_get_db_temp_files(d.oid) AS temp_files,
    pg_stat_get_db_temp_bytes(d.oid) AS temp_bytes,
    pg_stat_get_db_deadlocks(d.oid) AS deadlocks,
    pg_stat_get_db_blk_read_time(d.oid) AS blk_read_time,
    pg_stat_get_db_blk_write_time(d.oid) AS blk_write_time,
    pg_stat_get_db_stat_reset_time(d.oid) AS stats_reset
   FROM pg_database d;', 'NONE', 'YES', 'YES', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_stat_database_conflicts', ' SELECT d.oid AS datid,
    d.datname,
    pg_stat_get_db_conflict_tablespace(d.oid) AS confl_tablespace,
    pg_stat_get_db_conflict_lock(d.oid) AS confl_lock,
    pg_stat_get_db_conflict_snapshot(d.oid) AS confl_snapshot,
    pg_stat_get_db_conflict_bufferpin(d.oid) AS confl_bufferpin,
    pg_stat_get_db_conflict_startup_deadlock(d.oid) AS confl_deadlock
   FROM pg_database d;', 'NONE', 'YES', 'YES', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_stat_user_functions', ' SELECT p.oid AS funcid,
    n.nspname AS schemaname,
    p.proname AS funcname,
    pg_stat_get_function_calls(p.oid) AS calls,
    pg_stat_get_function_total_time(p.oid) AS total_time,
    pg_stat_get_function_self_time(p.oid) AS self_time
   FROM (pg_proc p
     LEFT JOIN pg_namespace n ON ((n.oid = p.pronamespace)))
  WHERE ((p.prolang <> (12)::oid) AND (pg_stat_get_function_calls(p.oid) IS NOT NULL));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_stat_xact_user_functions', ' SELECT p.oid AS funcid,
    n.nspname AS schemaname,
    p.proname AS funcname,
    pg_stat_get_xact_function_calls(p.oid) AS calls,
    pg_stat_get_xact_function_total_time(p.oid) AS total_time,
    pg_stat_get_xact_function_self_time(p.oid) AS self_time
   FROM (pg_proc p
     LEFT JOIN pg_namespace n ON ((n.oid = p.pronamespace)))
  WHERE ((p.prolang <> (12)::oid) AND (pg_stat_get_xact_function_calls(p.oid) IS NOT NULL));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_stat_archiver', ' SELECT s.archived_count,
    s.last_archived_wal,
    s.last_archived_time,
    s.failed_count,
    s.last_failed_wal,
    s.last_failed_time,
    s.stats_reset
   FROM pg_stat_get_archiver() s(archived_count, last_archived_wal, last_archived_time, failed_count, last_failed_wal, last_failed_time, stats_reset);', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_stat_bgwriter', ' SELECT pg_stat_get_bgwriter_timed_checkpoints() AS checkpoints_timed,
    pg_stat_get_bgwriter_requested_checkpoints() AS checkpoints_req,
    pg_stat_get_checkpoint_write_time() AS checkpoint_write_time,
    pg_stat_get_checkpoint_sync_time() AS checkpoint_sync_time,
    pg_stat_get_bgwriter_buf_written_checkpoints() AS buffers_checkpoint,
    pg_stat_get_bgwriter_buf_written_clean() AS buffers_clean,
    pg_stat_get_bgwriter_maxwritten_clean() AS maxwritten_clean,
    pg_stat_get_buf_written_backend() AS buffers_backend,
    pg_stat_get_buf_fsync_backend() AS buffers_backend_fsync,
    pg_stat_get_buf_alloc() AS buffers_alloc,
    pg_stat_get_bgwriter_stat_reset_time() AS stats_reset;', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_stat_progress_vacuum', ' SELECT s.pid,
    s.datid,
    d.datname,
    s.relid,
        CASE s.param1
            WHEN 0 THEN ''initializing''::text
            WHEN 1 THEN ''scanning heap''::text
            WHEN 2 THEN ''vacuuming indexes''::text
            WHEN 3 THEN ''vacuuming heap''::text
            WHEN 4 THEN ''cleaning up indexes''::text
            WHEN 5 THEN ''truncating heap''::text
            WHEN 6 THEN ''performing final cleanup''::text
            ELSE NULL::text
        END AS phase,
    s.param2 AS heap_blks_total,
    s.param3 AS heap_blks_scanned,
    s.param4 AS heap_blks_vacuumed,
    s.param5 AS index_vacuum_count,
    s.param6 AS max_dead_tuples,
    s.param7 AS num_dead_tuples
   FROM (pg_stat_get_progress_info(''VACUUM''::text) s(pid, datid, relid, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10)
     LEFT JOIN pg_database d ON ((s.datid = d.oid)));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'pg_catalog', 'pg_user_mappings', ' SELECT u.oid AS umid,
    s.oid AS srvid,
    s.srvname,
    u.umuser,
        CASE
            WHEN (u.umuser = (0)::oid) THEN ''public''::name
            ELSE a.rolname
        END AS usename,
        CASE
            WHEN (((u.umuser <> (0)::oid) AND (a.rolname = CURRENT_USER) AND (pg_has_role(s.srvowner, ''USAGE''::text) OR has_server_privilege(s.oid, ''USAGE''::text))) OR ((u.umuser = (0)::oid) AND pg_has_role(s.srvowner, ''USAGE''::text)) OR ( SELECT pg_authid.rolsuper
               FROM pg_authid
              WHERE (pg_authid.rolname = CURRENT_USER))) THEN u.umoptions
            ELSE NULL::text[]
        END AS umoptions
   FROM ((pg_user_mapping u
     JOIN pg_foreign_server s ON ((u.umserver = s.oid)))
     LEFT JOIN pg_authid a ON ((a.oid = u.umuser)));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'key_column_usage', ' SELECT (current_database())::information_schema.sql_identifier AS constraint_catalog,
    (ss.nc_nspname)::information_schema.sql_identifier AS constraint_schema,
    (ss.conname)::information_schema.sql_identifier AS constraint_name,
    (current_database())::information_schema.sql_identifier AS table_catalog,
    (ss.nr_nspname)::information_schema.sql_identifier AS table_schema,
    (ss.relname)::information_schema.sql_identifier AS table_name,
    (a.attname)::information_schema.sql_identifier AS column_name,
    ((ss.x).n)::information_schema.cardinal_number AS ordinal_position,
    (
        CASE
            WHEN (ss.contype = ''f''::"char") THEN information_schema._pg_index_position(ss.conindid, ss.confkey[(ss.x).n])
            ELSE NULL::integer
        END)::information_schema.cardinal_number AS position_in_unique_constraint
   FROM pg_attribute a,
    ( SELECT r.oid AS roid,
            r.relname,
            r.relowner,
            nc.nspname AS nc_nspname,
            nr.nspname AS nr_nspname,
            c.oid AS coid,
            c.conname,
            c.contype,
            c.conindid,
            c.confkey,
            c.confrelid,
            information_schema._pg_expandarray(c.conkey) AS x
           FROM pg_namespace nr,
            pg_class r,
            pg_namespace nc,
            pg_constraint c
          WHERE ((nr.oid = r.relnamespace) AND (r.oid = c.conrelid) AND (nc.oid = c.connamespace) AND (c.contype = ANY (ARRAY[''p''::"char", ''u''::"char", ''f''::"char"])) AND (r.relkind = ANY (ARRAY[''r''::"char", ''p''::"char"])) AND (NOT pg_is_other_temp_schema(nr.oid)))) ss
  WHERE ((ss.roid = a.attrelid) AND (a.attnum = (ss.x).x) AND (NOT a.attisdropped) AND (pg_has_role(ss.relowner, ''USAGE''::text) OR has_column_privilege(ss.roid, a.attnum, ''SELECT, INSERT, UPDATE, REFERENCES''::text)));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'information_schema_catalog_name', ' SELECT (current_database())::information_schema.sql_identifier AS catalog_name;', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'column_privileges', ' SELECT (u_grantor.rolname)::information_schema.sql_identifier AS grantor,
    (grantee.rolname)::information_schema.sql_identifier AS grantee,
    (current_database())::information_schema.sql_identifier AS table_catalog,
    (nc.nspname)::information_schema.sql_identifier AS table_schema,
    (x.relname)::information_schema.sql_identifier AS table_name,
    (x.attname)::information_schema.sql_identifier AS column_name,
    (x.prtype)::information_schema.character_data AS privilege_type,
    (
        CASE
            WHEN (pg_has_role(x.grantee, x.relowner, ''USAGE''::text) OR x.grantable) THEN ''YES''::text
            ELSE ''NO''::text
        END)::information_schema.yes_or_no AS is_grantable
   FROM ( SELECT pr_c.grantor,
            pr_c.grantee,
            a.attname,
            pr_c.relname,
            pr_c.relnamespace,
            pr_c.prtype,
            pr_c.grantable,
            pr_c.relowner
           FROM ( SELECT pg_class.oid,
                    pg_class.relname,
                    pg_class.relnamespace,
                    pg_class.relowner,
                    (aclexplode(COALESCE(pg_class.relacl, acldefault(''r''::"char", pg_class.relowner)))).grantor AS grantor,
                    (aclexplode(COALESCE(pg_class.relacl, acldefault(''r''::"char", pg_class.relowner)))).grantee AS grantee,
                    (aclexplode(COALESCE(pg_class.relacl, acldefault(''r''::"char", pg_class.relowner)))).privilege_type AS privilege_type,
                    (aclexplode(COALESCE(pg_class.relacl, acldefault(''r''::"char", pg_class.relowner)))).is_grantable AS is_grantable
                   FROM pg_class
                  WHERE (pg_class.relkind = ANY (ARRAY[''r''::"char", ''v''::"char", ''f''::"char", ''p''::"char"]))) pr_c(oid, relname, relnamespace, relowner, grantor, grantee, prtype, grantable),
            pg_attribute a
          WHERE ((a.attrelid = pr_c.oid) AND (a.attnum > 0) AND (NOT a.attisdropped))
        UNION
         SELECT pr_a.grantor,
            pr_a.grantee,
            pr_a.attname,
            c.relname,
            c.relnamespace,
            pr_a.prtype,
            pr_a.grantable,
            c.relowner
           FROM ( SELECT a.attrelid,
                    a.attname,
                    (aclexplode(COALESCE(a.attacl, acldefault(''c''::"char", cc.relowner)))).grantor AS grantor,
                    (aclexplode(COALESCE(a.attacl, acldefault(''c''::"char", cc.relowner)))).grantee AS grantee,
                    (aclexplode(COALESCE(a.attacl, acldefault(''c''::"char", cc.relowner)))).privilege_type AS privilege_type,
                    (aclexplode(COALESCE(a.attacl, acldefault(''c''::"char", cc.relowner)))).is_grantable AS is_grantable
                   FROM (pg_attribute a
                     JOIN pg_class cc ON ((a.attrelid = cc.oid)))
                  WHERE ((a.attnum > 0) AND (NOT a.attisdropped))) pr_a(attrelid, attname, grantor, grantee, prtype, grantable),
            pg_class c
          WHERE ((pr_a.attrelid = c.oid) AND (c.relkind = ANY (ARRAY[''r''::"char", ''v''::"char", ''f''::"char", ''p''::"char"])))) x,
    pg_namespace nc,
    pg_authid u_grantor,
    ( SELECT pg_authid.oid,
            pg_authid.rolname
           FROM pg_authid
        UNION ALL
         SELECT (0)::oid AS oid,
            ''PUBLIC''::name) grantee(oid, rolname)
  WHERE ((x.relnamespace = nc.oid) AND (x.grantee = grantee.oid) AND (x.grantor = u_grantor.oid) AND (x.prtype = ANY (ARRAY[''INSERT''::text, ''SELECT''::text, ''UPDATE''::text, ''REFERENCES''::text])) AND (pg_has_role(u_grantor.oid, ''USAGE''::text) OR pg_has_role(grantee.oid, ''USAGE''::text) OR (grantee.rolname = ''PUBLIC''::name)));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'applicable_roles', ' SELECT (a.rolname)::information_schema.sql_identifier AS grantee,
    (b.rolname)::information_schema.sql_identifier AS role_name,
    (
        CASE
            WHEN m.admin_option THEN ''YES''::text
            ELSE ''NO''::text
        END)::information_schema.yes_or_no AS is_grantable
   FROM ((pg_auth_members m
     JOIN pg_authid a ON ((m.member = a.oid)))
     JOIN pg_authid b ON ((m.roleid = b.oid)))
  WHERE pg_has_role(a.oid, ''USAGE''::text);', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'administrable_role_authorizations', ' SELECT applicable_roles.grantee,
    applicable_roles.role_name,
    applicable_roles.is_grantable
   FROM information_schema.applicable_roles
  WHERE ((applicable_roles.is_grantable)::text = ''YES''::text);', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'domain_udt_usage', ' SELECT (current_database())::information_schema.sql_identifier AS udt_catalog,
    (nbt.nspname)::information_schema.sql_identifier AS udt_schema,
    (bt.typname)::information_schema.sql_identifier AS udt_name,
    (current_database())::information_schema.sql_identifier AS domain_catalog,
    (nt.nspname)::information_schema.sql_identifier AS domain_schema,
    (t.typname)::information_schema.sql_identifier AS domain_name
   FROM pg_type t,
    pg_namespace nt,
    pg_type bt,
    pg_namespace nbt
  WHERE ((t.typnamespace = nt.oid) AND (t.typbasetype = bt.oid) AND (bt.typnamespace = nbt.oid) AND (t.typtype = ''d''::"char") AND pg_has_role(bt.typowner, ''USAGE''::text));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'attributes', ' SELECT (current_database())::information_schema.sql_identifier AS udt_catalog,
    (nc.nspname)::information_schema.sql_identifier AS udt_schema,
    (c.relname)::information_schema.sql_identifier AS udt_name,
    (a.attname)::information_schema.sql_identifier AS attribute_name,
    (a.attnum)::information_schema.cardinal_number AS ordinal_position,
    (pg_get_expr(ad.adbin, ad.adrelid))::information_schema.character_data AS attribute_default,
    (
        CASE
            WHEN (a.attnotnull OR ((t.typtype = ''d''::"char") AND t.typnotnull)) THEN ''NO''::text
            ELSE ''YES''::text
        END)::information_schema.yes_or_no AS is_nullable,
    (
        CASE
            WHEN ((t.typelem <> (0)::oid) AND (t.typlen = ''-1''::integer)) THEN ''ARRAY''::text
            WHEN (nt.nspname = ''pg_catalog''::name) THEN format_type(a.atttypid, NULL::integer)
            ELSE ''USER-DEFINED''::text
        END)::information_schema.character_data AS data_type,
    (information_schema._pg_char_max_length(information_schema._pg_truetypid(a.*, t.*), information_schema._pg_truetypmod(a.*, t.*)))::information_schema.cardinal_number AS character_maximum_length,
    (information_schema._pg_char_octet_length(information_schema._pg_truetypid(a.*, t.*), information_schema._pg_truetypmod(a.*, t.*)))::information_schema.cardinal_number AS character_octet_length,
    (NULL::character varying)::information_schema.sql_identifier AS character_set_catalog,
    (NULL::character varying)::information_schema.sql_identifier AS character_set_schema,
    (NULL::character varying)::information_schema.sql_identifier AS character_set_name,
    (
        CASE
            WHEN (nco.nspname IS NOT NULL) THEN current_database()
            ELSE NULL::name
        END)::information_schema.sql_identifier AS collation_catalog,
    (nco.nspname)::information_schema.sql_identifier AS collation_schema,
    (co.collname)::information_schema.sql_identifier AS collation_name,
    (information_schema._pg_numeric_precision(information_schema._pg_truetypid(a.*, t.*), information_schema._pg_truetypmod(a.*, t.*)))::information_schema.cardinal_number AS numeric_precision,
    (information_schema._pg_numeric_precision_radix(information_schema._pg_truetypid(a.*, t.*), information_schema._pg_truetypmod(a.*, t.*)))::information_schema.cardinal_number AS numeric_precision_radix,
    (information_schema._pg_numeric_scale(information_schema._pg_truetypid(a.*, t.*), information_schema._pg_truetypmod(a.*, t.*)))::information_schema.cardinal_number AS numeric_scale,
    (information_schema._pg_datetime_precision(information_schema._pg_truetypid(a.*, t.*), information_schema._pg_truetypmod(a.*, t.*)))::information_schema.cardinal_number AS datetime_precision,
    (information_schema._pg_interval_type(information_schema._pg_truetypid(a.*, t.*), information_schema._pg_truetypmod(a.*, t.*)))::information_schema.character_data AS interval_type,
    (NULL::integer)::information_schema.cardinal_number AS interval_precision,
    (current_database())::information_schema.sql_identifier AS attribute_udt_catalog,
    (nt.nspname)::information_schema.sql_identifier AS attribute_udt_schema,
    (t.typname)::information_schema.sql_identifier AS attribute_udt_name,
    (NULL::character varying)::information_schema.sql_identifier AS scope_catalog,
    (NULL::character varying)::information_schema.sql_identifier AS scope_schema,
    (NULL::character varying)::information_schema.sql_identifier AS scope_name,
    (NULL::integer)::information_schema.cardinal_number AS maximum_cardinality,
    (a.attnum)::information_schema.sql_identifier AS dtd_identifier,
    (''NO''::character varying)::information_schema.yes_or_no AS is_derived_reference_attribute
   FROM ((((pg_attribute a
     LEFT JOIN pg_attrdef ad ON (((a.attrelid = ad.adrelid) AND (a.attnum = ad.adnum))))
     JOIN (pg_class c
     JOIN pg_namespace nc ON ((c.relnamespace = nc.oid))) ON ((a.attrelid = c.oid)))
     JOIN (pg_type t
     JOIN pg_namespace nt ON ((t.typnamespace = nt.oid))) ON ((a.atttypid = t.oid)))
     LEFT JOIN (pg_collation co
     JOIN pg_namespace nco ON ((co.collnamespace = nco.oid))) ON (((a.attcollation = co.oid) AND ((nco.nspname <> ''pg_catalog''::name) OR (co.collname <> ''default''::name)))))
  WHERE ((a.attnum > 0) AND (NOT a.attisdropped) AND (c.relkind = ''c''::"char") AND (pg_has_role(c.relowner, ''USAGE''::text) OR has_type_privilege(c.reltype, ''USAGE''::text)));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'column_udt_usage', ' SELECT (current_database())::information_schema.sql_identifier AS udt_catalog,
    (COALESCE(nbt.nspname, nt.nspname))::information_schema.sql_identifier AS udt_schema,
    (COALESCE(bt.typname, t.typname))::information_schema.sql_identifier AS udt_name,
    (current_database())::information_schema.sql_identifier AS table_catalog,
    (nc.nspname)::information_schema.sql_identifier AS table_schema,
    (c.relname)::information_schema.sql_identifier AS table_name,
    (a.attname)::information_schema.sql_identifier AS column_name
   FROM pg_attribute a,
    pg_class c,
    pg_namespace nc,
    ((pg_type t
     JOIN pg_namespace nt ON ((t.typnamespace = nt.oid)))
     LEFT JOIN (pg_type bt
     JOIN pg_namespace nbt ON ((bt.typnamespace = nbt.oid))) ON (((t.typtype = ''d''::"char") AND (t.typbasetype = bt.oid))))
  WHERE ((a.attrelid = c.oid) AND (a.atttypid = t.oid) AND (nc.oid = c.relnamespace) AND (a.attnum > 0) AND (NOT a.attisdropped) AND (c.relkind = ANY (ARRAY[''r''::"char", ''v''::"char", ''f''::"char", ''p''::"char"])) AND pg_has_role(COALESCE(bt.typowner, t.typowner), ''USAGE''::text));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'character_sets', ' SELECT (NULL::character varying)::information_schema.sql_identifier AS character_set_catalog,
    (NULL::character varying)::information_schema.sql_identifier AS character_set_schema,
    (getdatabaseencoding())::information_schema.sql_identifier AS character_set_name,
    (
        CASE
            WHEN (getdatabaseencoding() = ''UTF8''::name) THEN ''UCS''::name
            ELSE getdatabaseencoding()
        END)::information_schema.sql_identifier AS character_repertoire,
    (getdatabaseencoding())::information_schema.sql_identifier AS form_of_use,
    (current_database())::information_schema.sql_identifier AS default_collate_catalog,
    (nc.nspname)::information_schema.sql_identifier AS default_collate_schema,
    (c.collname)::information_schema.sql_identifier AS default_collate_name
   FROM (pg_database d
     LEFT JOIN (pg_collation c
     JOIN pg_namespace nc ON ((c.collnamespace = nc.oid))) ON (((d.datcollate = c.collcollate) AND (d.datctype = c.collctype))))
  WHERE (d.datname = current_database())
  ORDER BY (char_length((c.collname)::text)) DESC, c.collname
 LIMIT 1;', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'check_constraint_routine_usage', ' SELECT (current_database())::information_schema.sql_identifier AS constraint_catalog,
    (nc.nspname)::information_schema.sql_identifier AS constraint_schema,
    (c.conname)::information_schema.sql_identifier AS constraint_name,
    (current_database())::information_schema.sql_identifier AS specific_catalog,
    (np.nspname)::information_schema.sql_identifier AS specific_schema,
    ((((p.proname)::text || ''_''::text) || (p.oid)::text))::information_schema.sql_identifier AS specific_name
   FROM pg_namespace nc,
    pg_constraint c,
    pg_depend d,
    pg_proc p,
    pg_namespace np
  WHERE ((nc.oid = c.connamespace) AND (c.contype = ''c''::"char") AND (c.oid = d.objid) AND (d.classid = (''pg_constraint''::regclass)::oid) AND (d.refobjid = p.oid) AND (d.refclassid = (''pg_proc''::regclass)::oid) AND (p.pronamespace = np.oid) AND pg_has_role(p.proowner, ''USAGE''::text));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'check_constraints', ' SELECT (current_database())::information_schema.sql_identifier AS constraint_catalog,
    (rs.nspname)::information_schema.sql_identifier AS constraint_schema,
    (con.conname)::information_schema.sql_identifier AS constraint_name,
    ("substring"(pg_get_constraintdef(con.oid), 7))::information_schema.character_data AS check_clause
   FROM (((pg_constraint con
     LEFT JOIN pg_namespace rs ON ((rs.oid = con.connamespace)))
     LEFT JOIN pg_class c ON ((c.oid = con.conrelid)))
     LEFT JOIN pg_type t ON ((t.oid = con.contypid)))
  WHERE (pg_has_role(COALESCE(c.relowner, t.typowner), ''USAGE''::text) AND (con.contype = ''c''::"char"))
UNION
 SELECT (current_database())::information_schema.sql_identifier AS constraint_catalog,
    (n.nspname)::information_schema.sql_identifier AS constraint_schema,
    (((((((n.oid)::text || ''_''::text) || (r.oid)::text) || ''_''::text) || (a.attnum)::text) || ''_not_null''::text))::information_schema.sql_identifier AS constraint_name,
    (((a.attname)::text || '' IS NOT NULL''::text))::information_schema.character_data AS check_clause
   FROM pg_namespace n,
    pg_class r,
    pg_attribute a
  WHERE ((n.oid = r.relnamespace) AND (r.oid = a.attrelid) AND (a.attnum > 0) AND (NOT a.attisdropped) AND a.attnotnull AND (r.relkind = ANY (ARRAY[''r''::"char", ''p''::"char"])) AND pg_has_role(r.relowner, ''USAGE''::text));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'columns', ' SELECT (current_database())::information_schema.sql_identifier AS table_catalog,
    (nc.nspname)::information_schema.sql_identifier AS table_schema,
    (c.relname)::information_schema.sql_identifier AS table_name,
    (a.attname)::information_schema.sql_identifier AS column_name,
    (a.attnum)::information_schema.cardinal_number AS ordinal_position,
    (pg_get_expr(ad.adbin, ad.adrelid))::information_schema.character_data AS column_default,
    (
        CASE
            WHEN (a.attnotnull OR ((t.typtype = ''d''::"char") AND t.typnotnull)) THEN ''NO''::text
            ELSE ''YES''::text
        END)::information_schema.yes_or_no AS is_nullable,
    (
        CASE
            WHEN (t.typtype = ''d''::"char") THEN
            CASE
                WHEN ((bt.typelem <> (0)::oid) AND (bt.typlen = ''-1''::integer)) THEN ''ARRAY''::text
                WHEN (nbt.nspname = ''pg_catalog''::name) THEN format_type(t.typbasetype, NULL::integer)
                ELSE ''USER-DEFINED''::text
            END
            ELSE
            CASE
                WHEN ((t.typelem <> (0)::oid) AND (t.typlen = ''-1''::integer)) THEN ''ARRAY''::text
                WHEN (nt.nspname = ''pg_catalog''::name) THEN format_type(a.atttypid, NULL::integer)
                ELSE ''USER-DEFINED''::text
            END
        END)::information_schema.character_data AS data_type,
    (information_schema._pg_char_max_length(information_schema._pg_truetypid(a.*, t.*), information_schema._pg_truetypmod(a.*, t.*)))::information_schema.cardinal_number AS character_maximum_length,
    (information_schema._pg_char_octet_length(information_schema._pg_truetypid(a.*, t.*), information_schema._pg_truetypmod(a.*, t.*)))::information_schema.cardinal_number AS character_octet_length,
    (information_schema._pg_numeric_precision(information_schema._pg_truetypid(a.*, t.*), information_schema._pg_truetypmod(a.*, t.*)))::information_schema.cardinal_number AS numeric_precision,
    (information_schema._pg_numeric_precision_radix(information_schema._pg_truetypid(a.*, t.*), information_schema._pg_truetypmod(a.*, t.*)))::information_schema.cardinal_number AS numeric_precision_radix,
    (information_schema._pg_numeric_scale(information_schema._pg_truetypid(a.*, t.*), information_schema._pg_truetypmod(a.*, t.*)))::information_schema.cardinal_number AS numeric_scale,
    (information_schema._pg_datetime_precision(information_schema._pg_truetypid(a.*, t.*), information_schema._pg_truetypmod(a.*, t.*)))::information_schema.cardinal_number AS datetime_precision,
    (information_schema._pg_interval_type(information_schema._pg_truetypid(a.*, t.*), information_schema._pg_truetypmod(a.*, t.*)))::information_schema.character_data AS interval_type,
    (NULL::integer)::information_schema.cardinal_number AS interval_precision,
    (NULL::character varying)::information_schema.sql_identifier AS character_set_catalog,
    (NULL::character varying)::information_schema.sql_identifier AS character_set_schema,
    (NULL::character varying)::information_schema.sql_identifier AS character_set_name,
    (
        CASE
            WHEN (nco.nspname IS NOT NULL) THEN current_database()
            ELSE NULL::name
        END)::information_schema.sql_identifier AS collation_catalog,
    (nco.nspname)::information_schema.sql_identifier AS collation_schema,
    (co.collname)::information_schema.sql_identifier AS collation_name,
    (
        CASE
            WHEN (t.typtype = ''d''::"char") THEN current_database()
            ELSE NULL::name
        END)::information_schema.sql_identifier AS domain_catalog,
    (
        CASE
            WHEN (t.typtype = ''d''::"char") THEN nt.nspname
            ELSE NULL::name
        END)::information_schema.sql_identifier AS domain_schema,
    (
        CASE
            WHEN (t.typtype = ''d''::"char") THEN t.typname
            ELSE NULL::name
        END)::information_schema.sql_identifier AS domain_name,
    (current_database())::information_schema.sql_identifier AS udt_catalog,
    (COALESCE(nbt.nspname, nt.nspname))::information_schema.sql_identifier AS udt_schema,
    (COALESCE(bt.typname, t.typname))::information_schema.sql_identifier AS udt_name,
    (NULL::character varying)::information_schema.sql_identifier AS scope_catalog,
    (NULL::character varying)::information_schema.sql_identifier AS scope_schema,
    (NULL::character varying)::information_schema.sql_identifier AS scope_name,
    (NULL::integer)::information_schema.cardinal_number AS maximum_cardinality,
    (a.attnum)::information_schema.sql_identifier AS dtd_identifier,
    (''NO''::character varying)::information_schema.yes_or_no AS is_self_referencing,
    (
        CASE
            WHEN (a.attidentity = ANY (ARRAY[''a''::"char", ''d''::"char"])) THEN ''YES''::text
            ELSE ''NO''::text
        END)::information_schema.yes_or_no AS is_identity,
    (
        CASE a.attidentity
            WHEN ''a''::"char" THEN ''ALWAYS''::text
            WHEN ''d''::"char" THEN ''BY DEFAULT''::text
            ELSE NULL::text
        END)::information_schema.character_data AS identity_generation,
    (seq.seqstart)::information_schema.character_data AS identity_start,
    (seq.seqincrement)::information_schema.character_data AS identity_increment,
    (seq.seqmax)::information_schema.character_data AS identity_maximum,
    (seq.seqmin)::information_schema.character_data AS identity_minimum,
    (
        CASE
            WHEN seq.seqcycle THEN ''YES''::text
            ELSE ''NO''::text
        END)::information_schema.yes_or_no AS identity_cycle,
    (''NEVER''::character varying)::information_schema.character_data AS is_generated,
    (NULL::character varying)::information_schema.character_data AS generation_expression,
    (
        CASE
            WHEN ((c.relkind = ANY (ARRAY[''r''::"char", ''p''::"char"])) OR ((c.relkind = ANY (ARRAY[''v''::"char", ''f''::"char"])) AND pg_column_is_updatable((c.oid)::regclass, a.attnum, false))) THEN ''YES''::text
            ELSE ''NO''::text
        END)::information_schema.yes_or_no AS is_updatable
   FROM ((((((pg_attribute a
     LEFT JOIN pg_attrdef ad ON (((a.attrelid = ad.adrelid) AND (a.attnum = ad.adnum))))
     JOIN (pg_class c
     JOIN pg_namespace nc ON ((c.relnamespace = nc.oid))) ON ((a.attrelid = c.oid)))
     JOIN (pg_type t
     JOIN pg_namespace nt ON ((t.typnamespace = nt.oid))) ON ((a.atttypid = t.oid)))
     LEFT JOIN (pg_type bt
     JOIN pg_namespace nbt ON ((bt.typnamespace = nbt.oid))) ON (((t.typtype = ''d''::"char") AND (t.typbasetype = bt.oid))))
     LEFT JOIN (pg_collation co
     JOIN pg_namespace nco ON ((co.collnamespace = nco.oid))) ON (((a.attcollation = co.oid) AND ((nco.nspname <> ''pg_catalog''::name) OR (co.collname <> ''default''::name)))))
     LEFT JOIN (pg_depend dep
     JOIN pg_sequence seq ON (((dep.classid = (''pg_class''::regclass)::oid) AND (dep.objid = seq.seqrelid) AND (dep.deptype = ''i''::"char")))) ON (((dep.refclassid = (''pg_class''::regclass)::oid) AND (dep.refobjid = c.oid) AND (dep.refobjsubid = a.attnum))))
  WHERE ((NOT pg_is_other_temp_schema(nc.oid)) AND (a.attnum > 0) AND (NOT a.attisdropped) AND (c.relkind = ANY (ARRAY[''r''::"char", ''v''::"char", ''f''::"char", ''p''::"char"])) AND (pg_has_role(c.relowner, ''USAGE''::text) OR has_column_privilege(c.oid, a.attnum, ''SELECT, INSERT, UPDATE, REFERENCES''::text)));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'collations', ' SELECT (current_database())::information_schema.sql_identifier AS collation_catalog,
    (nc.nspname)::information_schema.sql_identifier AS collation_schema,
    (c.collname)::information_schema.sql_identifier AS collation_name,
    (''NO PAD''::character varying)::information_schema.character_data AS pad_attribute
   FROM pg_collation c,
    pg_namespace nc
  WHERE ((c.collnamespace = nc.oid) AND (c.collencoding = ANY (ARRAY[''-1''::integer, ( SELECT pg_database.encoding
           FROM pg_database
          WHERE (pg_database.datname = current_database()))])));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'collation_character_set_applicability', ' SELECT (current_database())::information_schema.sql_identifier AS collation_catalog,
    (nc.nspname)::information_schema.sql_identifier AS collation_schema,
    (c.collname)::information_schema.sql_identifier AS collation_name,
    (NULL::character varying)::information_schema.sql_identifier AS character_set_catalog,
    (NULL::character varying)::information_schema.sql_identifier AS character_set_schema,
    (getdatabaseencoding())::information_schema.sql_identifier AS character_set_name
   FROM pg_collation c,
    pg_namespace nc
  WHERE ((c.collnamespace = nc.oid) AND (c.collencoding = ANY (ARRAY[''-1''::integer, ( SELECT pg_database.encoding
           FROM pg_database
          WHERE (pg_database.datname = current_database()))])));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'column_domain_usage', ' SELECT (current_database())::information_schema.sql_identifier AS domain_catalog,
    (nt.nspname)::information_schema.sql_identifier AS domain_schema,
    (t.typname)::information_schema.sql_identifier AS domain_name,
    (current_database())::information_schema.sql_identifier AS table_catalog,
    (nc.nspname)::information_schema.sql_identifier AS table_schema,
    (c.relname)::information_schema.sql_identifier AS table_name,
    (a.attname)::information_schema.sql_identifier AS column_name
   FROM pg_type t,
    pg_namespace nt,
    pg_class c,
    pg_namespace nc,
    pg_attribute a
  WHERE ((t.typnamespace = nt.oid) AND (c.relnamespace = nc.oid) AND (a.attrelid = c.oid) AND (a.atttypid = t.oid) AND (t.typtype = ''d''::"char") AND (c.relkind = ANY (ARRAY[''r''::"char", ''v''::"char", ''f''::"char", ''p''::"char"])) AND (a.attnum > 0) AND (NOT a.attisdropped) AND pg_has_role(t.typowner, ''USAGE''::text));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'constraint_column_usage', ' SELECT (current_database())::information_schema.sql_identifier AS table_catalog,
    (x.tblschema)::information_schema.sql_identifier AS table_schema,
    (x.tblname)::information_schema.sql_identifier AS table_name,
    (x.colname)::information_schema.sql_identifier AS column_name,
    (current_database())::information_schema.sql_identifier AS constraint_catalog,
    (x.cstrschema)::information_schema.sql_identifier AS constraint_schema,
    (x.cstrname)::information_schema.sql_identifier AS constraint_name
   FROM ( SELECT DISTINCT nr.nspname,
            r.relname,
            r.relowner,
            a.attname,
            nc.nspname,
            c.conname
           FROM pg_namespace nr,
            pg_class r,
            pg_attribute a,
            pg_depend d,
            pg_namespace nc,
            pg_constraint c
          WHERE ((nr.oid = r.relnamespace) AND (r.oid = a.attrelid) AND (d.refclassid = (''pg_class''::regclass)::oid) AND (d.refobjid = r.oid) AND (d.refobjsubid = a.attnum) AND (d.classid = (''pg_constraint''::regclass)::oid) AND (d.objid = c.oid) AND (c.connamespace = nc.oid) AND (c.contype = ''c''::"char") AND (r.relkind = ANY (ARRAY[''r''::"char", ''p''::"char"])) AND (NOT a.attisdropped))
        UNION ALL
         SELECT nr.nspname,
            r.relname,
            r.relowner,
            a.attname,
            nc.nspname,
            c.conname
           FROM pg_namespace nr,
            pg_class r,
            pg_attribute a,
            pg_namespace nc,
            pg_constraint c
          WHERE ((nr.oid = r.relnamespace) AND (r.oid = a.attrelid) AND (nc.oid = c.connamespace) AND (r.oid =
                CASE c.contype
                    WHEN ''f''::"char" THEN c.confrelid
                    ELSE c.conrelid
                END) AND (a.attnum = ANY (
                CASE c.contype
                    WHEN ''f''::"char" THEN c.confkey
                    ELSE c.conkey
                END)) AND (NOT a.attisdropped) AND (c.contype = ANY (ARRAY[''p''::"char", ''u''::"char", ''f''::"char"])) AND (r.relkind = ANY (ARRAY[''r''::"char", ''p''::"char"])))) x(tblschema, tblname, tblowner, colname, cstrschema, cstrname)
  WHERE pg_has_role(x.tblowner, ''USAGE''::text);', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'domains', ' SELECT (current_database())::information_schema.sql_identifier AS domain_catalog,
    (nt.nspname)::information_schema.sql_identifier AS domain_schema,
    (t.typname)::information_schema.sql_identifier AS domain_name,
    (
        CASE
            WHEN ((t.typelem <> (0)::oid) AND (t.typlen = ''-1''::integer)) THEN ''ARRAY''::text
            WHEN (nbt.nspname = ''pg_catalog''::name) THEN format_type(t.typbasetype, NULL::integer)
            ELSE ''USER-DEFINED''::text
        END)::information_schema.character_data AS data_type,
    (information_schema._pg_char_max_length(t.typbasetype, t.typtypmod))::information_schema.cardinal_number AS character_maximum_length,
    (information_schema._pg_char_octet_length(t.typbasetype, t.typtypmod))::information_schema.cardinal_number AS character_octet_length,
    (NULL::character varying)::information_schema.sql_identifier AS character_set_catalog,
    (NULL::character varying)::information_schema.sql_identifier AS character_set_schema,
    (NULL::character varying)::information_schema.sql_identifier AS character_set_name,
    (
        CASE
            WHEN (nco.nspname IS NOT NULL) THEN current_database()
            ELSE NULL::name
        END)::information_schema.sql_identifier AS collation_catalog,
    (nco.nspname)::information_schema.sql_identifier AS collation_schema,
    (co.collname)::information_schema.sql_identifier AS collation_name,
    (information_schema._pg_numeric_precision(t.typbasetype, t.typtypmod))::information_schema.cardinal_number AS numeric_precision,
    (information_schema._pg_numeric_precision_radix(t.typbasetype, t.typtypmod))::information_schema.cardinal_number AS numeric_precision_radix,
    (information_schema._pg_numeric_scale(t.typbasetype, t.typtypmod))::information_schema.cardinal_number AS numeric_scale,
    (information_schema._pg_datetime_precision(t.typbasetype, t.typtypmod))::information_schema.cardinal_number AS datetime_precision,
    (information_schema._pg_interval_type(t.typbasetype, t.typtypmod))::information_schema.character_data AS interval_type,
    (NULL::integer)::information_schema.cardinal_number AS interval_precision,
    (t.typdefault)::information_schema.character_data AS domain_default,
    (current_database())::information_schema.sql_identifier AS udt_catalog,
    (nbt.nspname)::information_schema.sql_identifier AS udt_schema,
    (bt.typname)::information_schema.sql_identifier AS udt_name,
    (NULL::character varying)::information_schema.sql_identifier AS scope_catalog,
    (NULL::character varying)::information_schema.sql_identifier AS scope_schema,
    (NULL::character varying)::information_schema.sql_identifier AS scope_name,
    (NULL::integer)::information_schema.cardinal_number AS maximum_cardinality,
    (1)::information_schema.sql_identifier AS dtd_identifier
   FROM (((pg_type t
     JOIN pg_namespace nt ON ((t.typnamespace = nt.oid)))
     JOIN (pg_type bt
     JOIN pg_namespace nbt ON ((bt.typnamespace = nbt.oid))) ON (((t.typbasetype = bt.oid) AND (t.typtype = ''d''::"char"))))
     LEFT JOIN (pg_collation co
     JOIN pg_namespace nco ON ((co.collnamespace = nco.oid))) ON (((t.typcollation = co.oid) AND ((nco.nspname <> ''pg_catalog''::name) OR (co.collname <> ''default''::name)))))
  WHERE (pg_has_role(t.typowner, ''USAGE''::text) OR has_type_privilege(t.oid, ''USAGE''::text));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'constraint_table_usage', ' SELECT (current_database())::information_schema.sql_identifier AS table_catalog,
    (nr.nspname)::information_schema.sql_identifier AS table_schema,
    (r.relname)::information_schema.sql_identifier AS table_name,
    (current_database())::information_schema.sql_identifier AS constraint_catalog,
    (nc.nspname)::information_schema.sql_identifier AS constraint_schema,
    (c.conname)::information_schema.sql_identifier AS constraint_name
   FROM pg_constraint c,
    pg_namespace nc,
    pg_class r,
    pg_namespace nr
  WHERE ((c.connamespace = nc.oid) AND (r.relnamespace = nr.oid) AND (((c.contype = ''f''::"char") AND (c.confrelid = r.oid)) OR ((c.contype = ANY (ARRAY[''p''::"char", ''u''::"char"])) AND (c.conrelid = r.oid))) AND (r.relkind = ANY (ARRAY[''r''::"char", ''p''::"char"])) AND pg_has_role(r.relowner, ''USAGE''::text));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'domain_constraints', ' SELECT (current_database())::information_schema.sql_identifier AS constraint_catalog,
    (rs.nspname)::information_schema.sql_identifier AS constraint_schema,
    (con.conname)::information_schema.sql_identifier AS constraint_name,
    (current_database())::information_schema.sql_identifier AS domain_catalog,
    (n.nspname)::information_schema.sql_identifier AS domain_schema,
    (t.typname)::information_schema.sql_identifier AS domain_name,
    (
        CASE
            WHEN con.condeferrable THEN ''YES''::text
            ELSE ''NO''::text
        END)::information_schema.yes_or_no AS is_deferrable,
    (
        CASE
            WHEN con.condeferred THEN ''YES''::text
            ELSE ''NO''::text
        END)::information_schema.yes_or_no AS initially_deferred
   FROM pg_namespace rs,
    pg_namespace n,
    pg_constraint con,
    pg_type t
  WHERE ((rs.oid = con.connamespace) AND (n.oid = t.typnamespace) AND (t.oid = con.contypid) AND (pg_has_role(t.typowner, ''USAGE''::text) OR has_type_privilege(t.oid, ''USAGE''::text)));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'role_column_grants', ' SELECT column_privileges.grantor,
    column_privileges.grantee,
    column_privileges.table_catalog,
    column_privileges.table_schema,
    column_privileges.table_name,
    column_privileges.column_name,
    column_privileges.privilege_type,
    column_privileges.is_grantable
   FROM information_schema.column_privileges
  WHERE (((column_privileges.grantor)::text IN ( SELECT enabled_roles.role_name
           FROM information_schema.enabled_roles)) OR ((column_privileges.grantee)::text IN ( SELECT enabled_roles.role_name
           FROM information_schema.enabled_roles)));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'enabled_roles', ' SELECT (a.rolname)::information_schema.sql_identifier AS role_name
   FROM pg_authid a
  WHERE pg_has_role(a.oid, ''USAGE''::text);', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'referential_constraints', ' SELECT (current_database())::information_schema.sql_identifier AS constraint_catalog,
    (ncon.nspname)::information_schema.sql_identifier AS constraint_schema,
    (con.conname)::information_schema.sql_identifier AS constraint_name,
    (
        CASE
            WHEN (npkc.nspname IS NULL) THEN NULL::name
            ELSE current_database()
        END)::information_schema.sql_identifier AS unique_constraint_catalog,
    (npkc.nspname)::information_schema.sql_identifier AS unique_constraint_schema,
    (pkc.conname)::information_schema.sql_identifier AS unique_constraint_name,
    (
        CASE con.confmatchtype
            WHEN ''f''::"char" THEN ''FULL''::text
            WHEN ''p''::"char" THEN ''PARTIAL''::text
            WHEN ''s''::"char" THEN ''NONE''::text
            ELSE NULL::text
        END)::information_schema.character_data AS match_option,
    (
        CASE con.confupdtype
            WHEN ''c''::"char" THEN ''CASCADE''::text
            WHEN ''n''::"char" THEN ''SET NULL''::text
            WHEN ''d''::"char" THEN ''SET DEFAULT''::text
            WHEN ''r''::"char" THEN ''RESTRICT''::text
            WHEN ''a''::"char" THEN ''NO ACTION''::text
            ELSE NULL::text
        END)::information_schema.character_data AS update_rule,
    (
        CASE con.confdeltype
            WHEN ''c''::"char" THEN ''CASCADE''::text
            WHEN ''n''::"char" THEN ''SET NULL''::text
            WHEN ''d''::"char" THEN ''SET DEFAULT''::text
            WHEN ''r''::"char" THEN ''RESTRICT''::text
            WHEN ''a''::"char" THEN ''NO ACTION''::text
            ELSE NULL::text
        END)::information_schema.character_data AS delete_rule
   FROM ((((((pg_namespace ncon
     JOIN pg_constraint con ON ((ncon.oid = con.connamespace)))
     JOIN pg_class c ON (((con.conrelid = c.oid) AND (con.contype = ''f''::"char"))))
     LEFT JOIN pg_depend d1 ON (((d1.objid = con.oid) AND (d1.classid = (''pg_constraint''::regclass)::oid) AND (d1.refclassid = (''pg_class''::regclass)::oid) AND (d1.refobjsubid = 0))))
     LEFT JOIN pg_depend d2 ON (((d2.refclassid = (''pg_constraint''::regclass)::oid) AND (d2.classid = (''pg_class''::regclass)::oid) AND (d2.objid = d1.refobjid) AND (d2.objsubid = 0) AND (d2.deptype = ''i''::"char"))))
     LEFT JOIN pg_constraint pkc ON (((pkc.oid = d2.refobjid) AND (pkc.contype = ANY (ARRAY[''p''::"char", ''u''::"char"])) AND (pkc.conrelid = con.confrelid))))
     LEFT JOIN pg_namespace npkc ON ((pkc.connamespace = npkc.oid)))
  WHERE (pg_has_role(c.relowner, ''USAGE''::text) OR has_table_privilege(c.oid, ''INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER''::text) OR has_any_column_privilege(c.oid, ''INSERT, UPDATE, REFERENCES''::text));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'parameters', ' SELECT (current_database())::information_schema.sql_identifier AS specific_catalog,
    (ss.n_nspname)::information_schema.sql_identifier AS specific_schema,
    ((((ss.proname)::text || ''_''::text) || (ss.p_oid)::text))::information_schema.sql_identifier AS specific_name,
    ((ss.x).n)::information_schema.cardinal_number AS ordinal_position,
    (
        CASE
            WHEN (ss.proargmodes IS NULL) THEN ''IN''::text
            WHEN (ss.proargmodes[(ss.x).n] = ''i''::"char") THEN ''IN''::text
            WHEN (ss.proargmodes[(ss.x).n] = ''o''::"char") THEN ''OUT''::text
            WHEN (ss.proargmodes[(ss.x).n] = ''b''::"char") THEN ''INOUT''::text
            WHEN (ss.proargmodes[(ss.x).n] = ''v''::"char") THEN ''IN''::text
            WHEN (ss.proargmodes[(ss.x).n] = ''t''::"char") THEN ''OUT''::text
            ELSE NULL::text
        END)::information_schema.character_data AS parameter_mode,
    (''NO''::character varying)::information_schema.yes_or_no AS is_result,
    (''NO''::character varying)::information_schema.yes_or_no AS as_locator,
    (NULLIF(ss.proargnames[(ss.x).n], ''''::text))::information_schema.sql_identifier AS parameter_name,
    (
        CASE
            WHEN ((t.typelem <> (0)::oid) AND (t.typlen = ''-1''::integer)) THEN ''ARRAY''::text
            WHEN (nt.nspname = ''pg_catalog''::name) THEN format_type(t.oid, NULL::integer)
            ELSE ''USER-DEFINED''::text
        END)::information_schema.character_data AS data_type,
    (NULL::integer)::information_schema.cardinal_number AS character_maximum_length,
    (NULL::integer)::information_schema.cardinal_number AS character_octet_length,
    (NULL::character varying)::information_schema.sql_identifier AS character_set_catalog,
    (NULL::character varying)::information_schema.sql_identifier AS character_set_schema,
    (NULL::character varying)::information_schema.sql_identifier AS character_set_name,
    (NULL::character varying)::information_schema.sql_identifier AS collation_catalog,
    (NULL::character varying)::information_schema.sql_identifier AS collation_schema,
    (NULL::character varying)::information_schema.sql_identifier AS collation_name,
    (NULL::integer)::information_schema.cardinal_number AS numeric_precision,
    (NULL::integer)::information_schema.cardinal_number AS numeric_precision_radix,
    (NULL::integer)::information_schema.cardinal_number AS numeric_scale,
    (NULL::integer)::information_schema.cardinal_number AS datetime_precision,
    (NULL::character varying)::information_schema.character_data AS interval_type,
    (NULL::integer)::information_schema.cardinal_number AS interval_precision,
    (current_database())::information_schema.sql_identifier AS udt_catalog,
    (nt.nspname)::information_schema.sql_identifier AS udt_schema,
    (t.typname)::information_schema.sql_identifier AS udt_name,
    (NULL::character varying)::information_schema.sql_identifier AS scope_catalog,
    (NULL::character varying)::information_schema.sql_identifier AS scope_schema,
    (NULL::character varying)::information_schema.sql_identifier AS scope_name,
    (NULL::integer)::information_schema.cardinal_number AS maximum_cardinality,
    ((ss.x).n)::information_schema.sql_identifier AS dtd_identifier,
    (
        CASE
            WHEN pg_has_role(ss.proowner, ''USAGE''::text) THEN pg_get_function_arg_default(ss.p_oid, (ss.x).n)
            ELSE NULL::text
        END)::information_schema.character_data AS parameter_default
   FROM pg_type t,
    pg_namespace nt,
    ( SELECT n.nspname AS n_nspname,
            p.proname,
            p.oid AS p_oid,
            p.proowner,
            p.proargnames,
            p.proargmodes,
            information_schema._pg_expandarray(COALESCE(p.proallargtypes, (p.proargtypes)::oid[])) AS x
           FROM pg_namespace n,
            pg_proc p
          WHERE ((n.oid = p.pronamespace) AND (pg_has_role(p.proowner, ''USAGE''::text) OR has_function_privilege(p.oid, ''EXECUTE''::text)))) ss
  WHERE ((t.oid = (ss.x).x) AND (t.typnamespace = nt.oid));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'routine_privileges', ' SELECT (u_grantor.rolname)::information_schema.sql_identifier AS grantor,
    (grantee.rolname)::information_schema.sql_identifier AS grantee,
    (current_database())::information_schema.sql_identifier AS specific_catalog,
    (n.nspname)::information_schema.sql_identifier AS specific_schema,
    ((((p.proname)::text || ''_''::text) || (p.oid)::text))::information_schema.sql_identifier AS specific_name,
    (current_database())::information_schema.sql_identifier AS routine_catalog,
    (n.nspname)::information_schema.sql_identifier AS routine_schema,
    (p.proname)::information_schema.sql_identifier AS routine_name,
    (''EXECUTE''::character varying)::information_schema.character_data AS privilege_type,
    (
        CASE
            WHEN (pg_has_role(grantee.oid, p.proowner, ''USAGE''::text) OR p.grantable) THEN ''YES''::text
            ELSE ''NO''::text
        END)::information_schema.yes_or_no AS is_grantable
   FROM ( SELECT pg_proc.oid,
            pg_proc.proname,
            pg_proc.proowner,
            pg_proc.pronamespace,
            (aclexplode(COALESCE(pg_proc.proacl, acldefault(''f''::"char", pg_proc.proowner)))).grantor AS grantor,
            (aclexplode(COALESCE(pg_proc.proacl, acldefault(''f''::"char", pg_proc.proowner)))).grantee AS grantee,
            (aclexplode(COALESCE(pg_proc.proacl, acldefault(''f''::"char", pg_proc.proowner)))).privilege_type AS privilege_type,
            (aclexplode(COALESCE(pg_proc.proacl, acldefault(''f''::"char", pg_proc.proowner)))).is_grantable AS is_grantable
           FROM pg_proc) p(oid, proname, proowner, pronamespace, grantor, grantee, prtype, grantable),
    pg_namespace n,
    pg_authid u_grantor,
    ( SELECT pg_authid.oid,
            pg_authid.rolname
           FROM pg_authid
        UNION ALL
         SELECT (0)::oid AS oid,
            ''PUBLIC''::name) grantee(oid, rolname)
  WHERE ((p.pronamespace = n.oid) AND (grantee.oid = p.grantee) AND (u_grantor.oid = p.grantor) AND (p.prtype = ''EXECUTE''::text) AND (pg_has_role(u_grantor.oid, ''USAGE''::text) OR pg_has_role(grantee.oid, ''USAGE''::text) OR (grantee.rolname = ''PUBLIC''::name)));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'role_routine_grants', ' SELECT routine_privileges.grantor,
    routine_privileges.grantee,
    routine_privileges.specific_catalog,
    routine_privileges.specific_schema,
    routine_privileges.specific_name,
    routine_privileges.routine_catalog,
    routine_privileges.routine_schema,
    routine_privileges.routine_name,
    routine_privileges.privilege_type,
    routine_privileges.is_grantable
   FROM information_schema.routine_privileges
  WHERE (((routine_privileges.grantor)::text IN ( SELECT enabled_roles.role_name
           FROM information_schema.enabled_roles)) OR ((routine_privileges.grantee)::text IN ( SELECT enabled_roles.role_name
           FROM information_schema.enabled_roles)));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'routines', ' SELECT (current_database())::information_schema.sql_identifier AS specific_catalog,
    (n.nspname)::information_schema.sql_identifier AS specific_schema,
    ((((p.proname)::text || ''_''::text) || (p.oid)::text))::information_schema.sql_identifier AS specific_name,
    (current_database())::information_schema.sql_identifier AS routine_catalog,
    (n.nspname)::information_schema.sql_identifier AS routine_schema,
    (p.proname)::information_schema.sql_identifier AS routine_name,
    (
        CASE p.prokind
            WHEN ''f''::"char" THEN ''FUNCTION''::text
            WHEN ''p''::"char" THEN ''PROCEDURE''::text
            ELSE NULL::text
        END)::information_schema.character_data AS routine_type,
    (NULL::character varying)::information_schema.sql_identifier AS module_catalog,
    (NULL::character varying)::information_schema.sql_identifier AS module_schema,
    (NULL::character varying)::information_schema.sql_identifier AS module_name,
    (NULL::character varying)::information_schema.sql_identifier AS udt_catalog,
    (NULL::character varying)::information_schema.sql_identifier AS udt_schema,
    (NULL::character varying)::information_schema.sql_identifier AS udt_name,
    (
        CASE
            WHEN (p.prokind = ''p''::"char") THEN NULL::text
            WHEN ((t.typelem <> (0)::oid) AND (t.typlen = ''-1''::integer)) THEN ''ARRAY''::text
            WHEN (nt.nspname = ''pg_catalog''::name) THEN format_type(t.oid, NULL::integer)
            ELSE ''USER-DEFINED''::text
        END)::information_schema.character_data AS data_type,
    (NULL::integer)::information_schema.cardinal_number AS character_maximum_length,
    (NULL::integer)::information_schema.cardinal_number AS character_octet_length,
    (NULL::character varying)::information_schema.sql_identifier AS character_set_catalog,
    (NULL::character varying)::information_schema.sql_identifier AS character_set_schema,
    (NULL::character varying)::information_schema.sql_identifier AS character_set_name,
    (NULL::character varying)::information_schema.sql_identifier AS collation_catalog,
    (NULL::character varying)::information_schema.sql_identifier AS collation_schema,
    (NULL::character varying)::information_schema.sql_identifier AS collation_name,
    (NULL::integer)::information_schema.cardinal_number AS numeric_precision,
    (NULL::integer)::information_schema.cardinal_number AS numeric_precision_radix,
    (NULL::integer)::information_schema.cardinal_number AS numeric_scale,
    (NULL::integer)::information_schema.cardinal_number AS datetime_precision,
    (NULL::character varying)::information_schema.character_data AS interval_type,
    (NULL::integer)::information_schema.cardinal_number AS interval_precision,
    (
        CASE
            WHEN (nt.nspname IS NOT NULL) THEN current_database()
            ELSE NULL::name
        END)::information_schema.sql_identifier AS type_udt_catalog,
    (nt.nspname)::information_schema.sql_identifier AS type_udt_schema,
    (t.typname)::information_schema.sql_identifier AS type_udt_name,
    (NULL::character varying)::information_schema.sql_identifier AS scope_catalog,
    (NULL::character varying)::information_schema.sql_identifier AS scope_schema,
    (NULL::character varying)::information_schema.sql_identifier AS scope_name,
    (NULL::integer)::information_schema.cardinal_number AS maximum_cardinality,
    (
        CASE
            WHEN (p.prokind <> ''p''::"char") THEN 0
            ELSE NULL::integer
        END)::information_schema.sql_identifier AS dtd_identifier,
    (
        CASE
            WHEN (l.lanname = ''sql''::name) THEN ''SQL''::text
            ELSE ''EXTERNAL''::text
        END)::information_schema.character_data AS routine_body,
    (
        CASE
            WHEN pg_has_role(p.proowner, ''USAGE''::text) THEN p.prosrc
            ELSE NULL::text
        END)::information_schema.character_data AS routine_definition,
    (
        CASE
            WHEN (l.lanname = ''c''::name) THEN p.prosrc
            ELSE NULL::text
        END)::information_schema.character_data AS external_name,
    (upper((l.lanname)::text))::information_schema.character_data AS external_language,
    (''GENERAL''::character varying)::information_schema.character_data AS parameter_style,
    (
        CASE
            WHEN (p.provolatile = ''i''::"char") THEN ''YES''::text
            ELSE ''NO''::text
        END)::information_schema.yes_or_no AS is_deterministic,
    (''MODIFIES''::character varying)::information_schema.character_data AS sql_data_access,
    (
        CASE
            WHEN (p.prokind <> ''p''::"char") THEN
            CASE
                WHEN p.proisstrict THEN ''YES''::text
                ELSE ''NO''::text
            END
            ELSE NULL::text
        END)::information_schema.yes_or_no AS is_null_call,
    (NULL::character varying)::information_schema.character_data AS sql_path,
    (''YES''::character varying)::information_schema.yes_or_no AS schema_level_routine,
    (0)::information_schema.cardinal_number AS max_dynamic_result_sets,
    (NULL::character varying)::information_schema.yes_or_no AS is_user_defined_cast,
    (NULL::character varying)::information_schema.yes_or_no AS is_implicitly_invocable,
    (
        CASE
            WHEN p.prosecdef THEN ''DEFINER''::text
            ELSE ''INVOKER''::text
        END)::information_schema.character_data AS security_type,
    (NULL::character varying)::information_schema.sql_identifier AS to_sql_specific_catalog,
    (NULL::character varying)::information_schema.sql_identifier AS to_sql_specific_schema,
    (NULL::character varying)::information_schema.sql_identifier AS to_sql_specific_name,
    (''NO''::character varying)::information_schema.yes_or_no AS as_locator,
    (NULL::timestamp with time zone)::information_schema.time_stamp AS created,
    (NULL::timestamp with time zone)::information_schema.time_stamp AS last_altered,
    (NULL::character varying)::information_schema.yes_or_no AS new_savepoint_level,
    (''NO''::character varying)::information_schema.yes_or_no AS is_udt_dependent,
    (NULL::character varying)::information_schema.character_data AS result_cast_from_data_type,
    (NULL::character varying)::information_schema.yes_or_no AS result_cast_as_locator,
    (NULL::integer)::information_schema.cardinal_number AS result_cast_char_max_length,
    (NULL::integer)::information_schema.cardinal_number AS result_cast_char_octet_length,
    (NULL::character varying)::information_schema.sql_identifier AS result_cast_char_set_catalog,
    (NULL::character varying)::information_schema.sql_identifier AS result_cast_char_set_schema,
    (NULL::character varying)::information_schema.sql_identifier AS result_cast_char_set_name,
    (NULL::character varying)::information_schema.sql_identifier AS result_cast_collation_catalog,
    (NULL::character varying)::information_schema.sql_identifier AS result_cast_collation_schema,
    (NULL::character varying)::information_schema.sql_identifier AS result_cast_collation_name,
    (NULL::integer)::information_schema.cardinal_number AS result_cast_numeric_precision,
    (NULL::integer)::information_schema.cardinal_number AS result_cast_numeric_precision_radix,
    (NULL::integer)::information_schema.cardinal_number AS result_cast_numeric_scale,
    (NULL::integer)::information_schema.cardinal_number AS result_cast_datetime_precision,
    (NULL::character varying)::information_schema.character_data AS result_cast_interval_type,
    (NULL::integer)::information_schema.cardinal_number AS result_cast_interval_precision,
    (NULL::character varying)::information_schema.sql_identifier AS result_cast_type_udt_catalog,
    (NULL::character varying)::information_schema.sql_identifier AS result_cast_type_udt_schema,
    (NULL::character varying)::information_schema.sql_identifier AS result_cast_type_udt_name,
    (NULL::character varying)::information_schema.sql_identifier AS result_cast_scope_catalog,
    (NULL::character varying)::information_schema.sql_identifier AS result_cast_scope_schema,
    (NULL::character varying)::information_schema.sql_identifier AS result_cast_scope_name,
    (NULL::integer)::information_schema.cardinal_number AS result_cast_maximum_cardinality,
    (NULL::character varying)::information_schema.sql_identifier AS result_cast_dtd_identifier
   FROM (((pg_namespace n
     JOIN pg_proc p ON ((n.oid = p.pronamespace)))
     JOIN pg_language l ON ((p.prolang = l.oid)))
     LEFT JOIN (pg_type t
     JOIN pg_namespace nt ON ((t.typnamespace = nt.oid))) ON (((p.prorettype = t.oid) AND (p.prokind <> ''p''::"char"))))
  WHERE (pg_has_role(p.proowner, ''USAGE''::text) OR has_function_privilege(p.oid, ''EXECUTE''::text));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'schemata', ' SELECT (current_database())::information_schema.sql_identifier AS catalog_name,
    (n.nspname)::information_schema.sql_identifier AS schema_name,
    (u.rolname)::information_schema.sql_identifier AS schema_owner,
    (NULL::character varying)::information_schema.sql_identifier AS default_character_set_catalog,
    (NULL::character varying)::information_schema.sql_identifier AS default_character_set_schema,
    (NULL::character varying)::information_schema.sql_identifier AS default_character_set_name,
    (NULL::character varying)::information_schema.character_data AS sql_path
   FROM pg_namespace n,
    pg_authid u
  WHERE ((n.nspowner = u.oid) AND (pg_has_role(n.nspowner, ''USAGE''::text) OR has_schema_privilege(n.oid, ''CREATE, USAGE''::text)));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'table_constraints', ' SELECT (current_database())::information_schema.sql_identifier AS constraint_catalog,
    (nc.nspname)::information_schema.sql_identifier AS constraint_schema,
    (c.conname)::information_schema.sql_identifier AS constraint_name,
    (current_database())::information_schema.sql_identifier AS table_catalog,
    (nr.nspname)::information_schema.sql_identifier AS table_schema,
    (r.relname)::information_schema.sql_identifier AS table_name,
    (
        CASE c.contype
            WHEN ''c''::"char" THEN ''CHECK''::text
            WHEN ''f''::"char" THEN ''FOREIGN KEY''::text
            WHEN ''p''::"char" THEN ''PRIMARY KEY''::text
            WHEN ''u''::"char" THEN ''UNIQUE''::text
            ELSE NULL::text
        END)::information_schema.character_data AS constraint_type,
    (
        CASE
            WHEN c.condeferrable THEN ''YES''::text
            ELSE ''NO''::text
        END)::information_schema.yes_or_no AS is_deferrable,
    (
        CASE
            WHEN c.condeferred THEN ''YES''::text
            ELSE ''NO''::text
        END)::information_schema.yes_or_no AS initially_deferred,
    (''YES''::character varying)::information_schema.yes_or_no AS enforced
   FROM pg_namespace nc,
    pg_namespace nr,
    pg_constraint c,
    pg_class r
  WHERE ((nc.oid = c.connamespace) AND (nr.oid = r.relnamespace) AND (c.conrelid = r.oid) AND (c.contype <> ALL (ARRAY[''t''::"char", ''x''::"char"])) AND (r.relkind = ANY (ARRAY[''r''::"char", ''p''::"char"])) AND (NOT pg_is_other_temp_schema(nr.oid)) AND (pg_has_role(r.relowner, ''USAGE''::text) OR has_table_privilege(r.oid, ''INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER''::text) OR has_any_column_privilege(r.oid, ''INSERT, UPDATE, REFERENCES''::text)))
UNION ALL
 SELECT (current_database())::information_schema.sql_identifier AS constraint_catalog,
    (nr.nspname)::information_schema.sql_identifier AS constraint_schema,
    (((((((nr.oid)::text || ''_''::text) || (r.oid)::text) || ''_''::text) || (a.attnum)::text) || ''_not_null''::text))::information_schema.sql_identifier AS constraint_name,
    (current_database())::information_schema.sql_identifier AS table_catalog,
    (nr.nspname)::information_schema.sql_identifier AS table_schema,
    (r.relname)::information_schema.sql_identifier AS table_name,
    (''CHECK''::character varying)::information_schema.character_data AS constraint_type,
    (''NO''::character varying)::information_schema.yes_or_no AS is_deferrable,
    (''NO''::character varying)::information_schema.yes_or_no AS initially_deferred,
    (''YES''::character varying)::information_schema.yes_or_no AS enforced
   FROM pg_namespace nr,
    pg_class r,
    pg_attribute a
  WHERE ((nr.oid = r.relnamespace) AND (r.oid = a.attrelid) AND a.attnotnull AND (a.attnum > 0) AND (NOT a.attisdropped) AND (r.relkind = ANY (ARRAY[''r''::"char", ''p''::"char"])) AND (NOT pg_is_other_temp_schema(nr.oid)) AND (pg_has_role(r.relowner, ''USAGE''::text) OR has_table_privilege(r.oid, ''INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER''::text) OR has_any_column_privilege(r.oid, ''INSERT, UPDATE, REFERENCES''::text)));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'sequences', ' SELECT (current_database())::information_schema.sql_identifier AS sequence_catalog,
    (nc.nspname)::information_schema.sql_identifier AS sequence_schema,
    (c.relname)::information_schema.sql_identifier AS sequence_name,
    (format_type(s.seqtypid, NULL::integer))::information_schema.character_data AS data_type,
    (information_schema._pg_numeric_precision(s.seqtypid, ''-1''::integer))::information_schema.cardinal_number AS numeric_precision,
    (2)::information_schema.cardinal_number AS numeric_precision_radix,
    (0)::information_schema.cardinal_number AS numeric_scale,
    (s.seqstart)::information_schema.character_data AS start_value,
    (s.seqmin)::information_schema.character_data AS minimum_value,
    (s.seqmax)::information_schema.character_data AS maximum_value,
    (s.seqincrement)::information_schema.character_data AS increment,
    (
        CASE
            WHEN s.seqcycle THEN ''YES''::text
            ELSE ''NO''::text
        END)::information_schema.yes_or_no AS cycle_option
   FROM pg_namespace nc,
    pg_class c,
    pg_sequence s
  WHERE ((c.relnamespace = nc.oid) AND (c.relkind = ''S''::"char") AND (NOT (EXISTS ( SELECT 1
           FROM pg_depend
          WHERE ((pg_depend.classid = (''pg_class''::regclass)::oid) AND (pg_depend.objid = c.oid) AND (pg_depend.deptype = ''i''::"char"))))) AND (NOT pg_is_other_temp_schema(nc.oid)) AND (c.oid = s.seqrelid) AND (pg_has_role(c.relowner, ''USAGE''::text) OR has_sequence_privilege(c.oid, ''SELECT, UPDATE, USAGE''::text)));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'triggered_update_columns', ' SELECT (current_database())::information_schema.sql_identifier AS trigger_catalog,
    (n.nspname)::information_schema.sql_identifier AS trigger_schema,
    (t.tgname)::information_schema.sql_identifier AS trigger_name,
    (current_database())::information_schema.sql_identifier AS event_object_catalog,
    (n.nspname)::information_schema.sql_identifier AS event_object_schema,
    (c.relname)::information_schema.sql_identifier AS event_object_table,
    (a.attname)::information_schema.sql_identifier AS event_object_column
   FROM pg_namespace n,
    pg_class c,
    pg_trigger t,
    ( SELECT ta0.tgoid,
            (ta0.tgat).x AS tgattnum,
            (ta0.tgat).n AS tgattpos
           FROM ( SELECT pg_trigger.oid AS tgoid,
                    information_schema._pg_expandarray(pg_trigger.tgattr) AS tgat
                   FROM pg_trigger) ta0) ta,
    pg_attribute a
  WHERE ((n.oid = c.relnamespace) AND (c.oid = t.tgrelid) AND (t.oid = ta.tgoid) AND ((a.attrelid = t.tgrelid) AND (a.attnum = ta.tgattnum)) AND (NOT t.tgisinternal) AND (NOT pg_is_other_temp_schema(n.oid)) AND (pg_has_role(c.relowner, ''USAGE''::text) OR has_column_privilege(c.oid, a.attnum, ''INSERT, UPDATE, REFERENCES''::text)));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'table_privileges', ' SELECT (u_grantor.rolname)::information_schema.sql_identifier AS grantor,
    (grantee.rolname)::information_schema.sql_identifier AS grantee,
    (current_database())::information_schema.sql_identifier AS table_catalog,
    (nc.nspname)::information_schema.sql_identifier AS table_schema,
    (c.relname)::information_schema.sql_identifier AS table_name,
    (c.prtype)::information_schema.character_data AS privilege_type,
    (
        CASE
            WHEN (pg_has_role(grantee.oid, c.relowner, ''USAGE''::text) OR c.grantable) THEN ''YES''::text
            ELSE ''NO''::text
        END)::information_schema.yes_or_no AS is_grantable,
    (
        CASE
            WHEN (c.prtype = ''SELECT''::text) THEN ''YES''::text
            ELSE ''NO''::text
        END)::information_schema.yes_or_no AS with_hierarchy
   FROM ( SELECT pg_class.oid,
            pg_class.relname,
            pg_class.relnamespace,
            pg_class.relkind,
            pg_class.relowner,
            (aclexplode(COALESCE(pg_class.relacl, acldefault(''r''::"char", pg_class.relowner)))).grantor AS grantor,
            (aclexplode(COALESCE(pg_class.relacl, acldefault(''r''::"char", pg_class.relowner)))).grantee AS grantee,
            (aclexplode(COALESCE(pg_class.relacl, acldefault(''r''::"char", pg_class.relowner)))).privilege_type AS privilege_type,
            (aclexplode(COALESCE(pg_class.relacl, acldefault(''r''::"char", pg_class.relowner)))).is_grantable AS is_grantable
           FROM pg_class) c(oid, relname, relnamespace, relkind, relowner, grantor, grantee, prtype, grantable),
    pg_namespace nc,
    pg_authid u_grantor,
    ( SELECT pg_authid.oid,
            pg_authid.rolname
           FROM pg_authid
        UNION ALL
         SELECT (0)::oid AS oid,
            ''PUBLIC''::name) grantee(oid, rolname)
  WHERE ((c.relnamespace = nc.oid) AND (c.relkind = ANY (ARRAY[''r''::"char", ''v''::"char", ''f''::"char", ''p''::"char"])) AND (c.grantee = grantee.oid) AND (c.grantor = u_grantor.oid) AND (c.prtype = ANY (ARRAY[''INSERT''::text, ''SELECT''::text, ''UPDATE''::text, ''DELETE''::text, ''TRUNCATE''::text, ''REFERENCES''::text, ''TRIGGER''::text])) AND (pg_has_role(u_grantor.oid, ''USAGE''::text) OR pg_has_role(grantee.oid, ''USAGE''::text) OR (grantee.rolname = ''PUBLIC''::name)));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'role_table_grants', ' SELECT table_privileges.grantor,
    table_privileges.grantee,
    table_privileges.table_catalog,
    table_privileges.table_schema,
    table_privileges.table_name,
    table_privileges.privilege_type,
    table_privileges.is_grantable,
    table_privileges.with_hierarchy
   FROM information_schema.table_privileges
  WHERE (((table_privileges.grantor)::text IN ( SELECT enabled_roles.role_name
           FROM information_schema.enabled_roles)) OR ((table_privileges.grantee)::text IN ( SELECT enabled_roles.role_name
           FROM information_schema.enabled_roles)));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'triggers', ' SELECT (current_database())::information_schema.sql_identifier AS trigger_catalog,
    (n.nspname)::information_schema.sql_identifier AS trigger_schema,
    (t.tgname)::information_schema.sql_identifier AS trigger_name,
    (em.text)::information_schema.character_data AS event_manipulation,
    (current_database())::information_schema.sql_identifier AS event_object_catalog,
    (n.nspname)::information_schema.sql_identifier AS event_object_schema,
    (c.relname)::information_schema.sql_identifier AS event_object_table,
    (rank() OVER (PARTITION BY n.oid, c.oid, em.num, ((t.tgtype)::integer & 1), ((t.tgtype)::integer & 66) ORDER BY t.tgname))::information_schema.cardinal_number AS action_order,
    (
        CASE
            WHEN pg_has_role(c.relowner, ''USAGE''::text) THEN (regexp_match(pg_get_triggerdef(t.oid), ''.{35,} WHEN \((.+)\) EXECUTE PROCEDURE''::text))[1]
            ELSE NULL::text
        END)::information_schema.character_data AS action_condition,
    ("substring"(pg_get_triggerdef(t.oid), ("position"("substring"(pg_get_triggerdef(t.oid), 48), ''EXECUTE PROCEDURE''::text) + 47)))::information_schema.character_data AS action_statement,
    (
        CASE ((t.tgtype)::integer & 1)
            WHEN 1 THEN ''ROW''::text
            ELSE ''STATEMENT''::text
        END)::information_schema.character_data AS action_orientation,
    (
        CASE ((t.tgtype)::integer & 66)
            WHEN 2 THEN ''BEFORE''::text
            WHEN 64 THEN ''INSTEAD OF''::text
            ELSE ''AFTER''::text
        END)::information_schema.character_data AS action_timing,
    (t.tgoldtable)::information_schema.sql_identifier AS action_reference_old_table,
    (t.tgnewtable)::information_schema.sql_identifier AS action_reference_new_table,
    (NULL::character varying)::information_schema.sql_identifier AS action_reference_old_row,
    (NULL::character varying)::information_schema.sql_identifier AS action_reference_new_row,
    (NULL::timestamp with time zone)::information_schema.time_stamp AS created
   FROM pg_namespace n,
    pg_class c,
    pg_trigger t,
    ( VALUES (4,''INSERT''::text), (8,''DELETE''::text), (16,''UPDATE''::text)) em(num, text)
  WHERE ((n.oid = c.relnamespace) AND (c.oid = t.tgrelid) AND (((t.tgtype)::integer & em.num) <> 0) AND (NOT t.tgisinternal) AND (NOT pg_is_other_temp_schema(n.oid)) AND (pg_has_role(c.relowner, ''USAGE''::text) OR has_table_privilege(c.oid, ''INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER''::text) OR has_any_column_privilege(c.oid, ''INSERT, UPDATE, REFERENCES''::text)));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'tables', ' SELECT (current_database())::information_schema.sql_identifier AS table_catalog,
    (nc.nspname)::information_schema.sql_identifier AS table_schema,
    (c.relname)::information_schema.sql_identifier AS table_name,
    (
        CASE
            WHEN (nc.oid = pg_my_temp_schema()) THEN ''LOCAL TEMPORARY''::text
            WHEN (c.relkind = ANY (ARRAY[''r''::"char", ''p''::"char"])) THEN ''BASE TABLE''::text
            WHEN (c.relkind = ''v''::"char") THEN ''VIEW''::text
            WHEN (c.relkind = ''f''::"char") THEN ''FOREIGN''::text
            ELSE NULL::text
        END)::information_schema.character_data AS table_type,
    (NULL::character varying)::information_schema.sql_identifier AS self_referencing_column_name,
    (NULL::character varying)::information_schema.character_data AS reference_generation,
    (
        CASE
            WHEN (t.typname IS NOT NULL) THEN current_database()
            ELSE NULL::name
        END)::information_schema.sql_identifier AS user_defined_type_catalog,
    (nt.nspname)::information_schema.sql_identifier AS user_defined_type_schema,
    (t.typname)::information_schema.sql_identifier AS user_defined_type_name,
    (
        CASE
            WHEN ((c.relkind = ANY (ARRAY[''r''::"char", ''p''::"char"])) OR ((c.relkind = ANY (ARRAY[''v''::"char", ''f''::"char"])) AND ((pg_relation_is_updatable((c.oid)::regclass, false) & 8) = 8))) THEN ''YES''::text
            ELSE ''NO''::text
        END)::information_schema.yes_or_no AS is_insertable_into,
    (
        CASE
            WHEN (t.typname IS NOT NULL) THEN ''YES''::text
            ELSE ''NO''::text
        END)::information_schema.yes_or_no AS is_typed,
    (NULL::character varying)::information_schema.character_data AS commit_action
   FROM ((pg_namespace nc
     JOIN pg_class c ON ((nc.oid = c.relnamespace)))
     LEFT JOIN (pg_type t
     JOIN pg_namespace nt ON ((t.typnamespace = nt.oid))) ON ((c.reloftype = t.oid)))
  WHERE ((c.relkind = ANY (ARRAY[''r''::"char", ''v''::"char", ''f''::"char", ''p''::"char"])) AND (NOT pg_is_other_temp_schema(nc.oid)) AND (pg_has_role(c.relowner, ''USAGE''::text) OR has_table_privilege(c.oid, ''SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER''::text) OR has_any_column_privilege(c.oid, ''SELECT, INSERT, UPDATE, REFERENCES''::text)));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'transforms', ' SELECT (current_database())::information_schema.sql_identifier AS udt_catalog,
    (nt.nspname)::information_schema.sql_identifier AS udt_schema,
    (t.typname)::information_schema.sql_identifier AS udt_name,
    (current_database())::information_schema.sql_identifier AS specific_catalog,
    (np.nspname)::information_schema.sql_identifier AS specific_schema,
    ((((p.proname)::text || ''_''::text) || (p.oid)::text))::information_schema.sql_identifier AS specific_name,
    (l.lanname)::information_schema.sql_identifier AS group_name,
    (''FROM SQL''::character varying)::information_schema.character_data AS transform_type
   FROM (((((pg_type t
     JOIN pg_transform x ON ((t.oid = x.trftype)))
     JOIN pg_language l ON ((x.trflang = l.oid)))
     JOIN pg_proc p ON (((x.trffromsql)::oid = p.oid)))
     JOIN pg_namespace nt ON ((t.typnamespace = nt.oid)))
     JOIN pg_namespace np ON ((p.pronamespace = np.oid)))
UNION
 SELECT (current_database())::information_schema.sql_identifier AS udt_catalog,
    (nt.nspname)::information_schema.sql_identifier AS udt_schema,
    (t.typname)::information_schema.sql_identifier AS udt_name,
    (current_database())::information_schema.sql_identifier AS specific_catalog,
    (np.nspname)::information_schema.sql_identifier AS specific_schema,
    ((((p.proname)::text || ''_''::text) || (p.oid)::text))::information_schema.sql_identifier AS specific_name,
    (l.lanname)::information_schema.sql_identifier AS group_name,
    (''TO SQL''::character varying)::information_schema.character_data AS transform_type
   FROM (((((pg_type t
     JOIN pg_transform x ON ((t.oid = x.trftype)))
     JOIN pg_language l ON ((x.trflang = l.oid)))
     JOIN pg_proc p ON (((x.trftosql)::oid = p.oid)))
     JOIN pg_namespace nt ON ((t.typnamespace = nt.oid)))
     JOIN pg_namespace np ON ((p.pronamespace = np.oid)))
  ORDER BY 1, 2, 3, 7, 8;', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'role_udt_grants', ' SELECT udt_privileges.grantor,
    udt_privileges.grantee,
    udt_privileges.udt_catalog,
    udt_privileges.udt_schema,
    udt_privileges.udt_name,
    udt_privileges.privilege_type,
    udt_privileges.is_grantable
   FROM information_schema.udt_privileges
  WHERE (((udt_privileges.grantor)::text IN ( SELECT enabled_roles.role_name
           FROM information_schema.enabled_roles)) OR ((udt_privileges.grantee)::text IN ( SELECT enabled_roles.role_name
           FROM information_schema.enabled_roles)));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'udt_privileges', ' SELECT (u_grantor.rolname)::information_schema.sql_identifier AS grantor,
    (grantee.rolname)::information_schema.sql_identifier AS grantee,
    (current_database())::information_schema.sql_identifier AS udt_catalog,
    (n.nspname)::information_schema.sql_identifier AS udt_schema,
    (t.typname)::information_schema.sql_identifier AS udt_name,
    (''TYPE USAGE''::character varying)::information_schema.character_data AS privilege_type,
    (
        CASE
            WHEN (pg_has_role(grantee.oid, t.typowner, ''USAGE''::text) OR t.grantable) THEN ''YES''::text
            ELSE ''NO''::text
        END)::information_schema.yes_or_no AS is_grantable
   FROM ( SELECT pg_type.oid,
            pg_type.typname,
            pg_type.typnamespace,
            pg_type.typtype,
            pg_type.typowner,
            (aclexplode(COALESCE(pg_type.typacl, acldefault(''T''::"char", pg_type.typowner)))).grantor AS grantor,
            (aclexplode(COALESCE(pg_type.typacl, acldefault(''T''::"char", pg_type.typowner)))).grantee AS grantee,
            (aclexplode(COALESCE(pg_type.typacl, acldefault(''T''::"char", pg_type.typowner)))).privilege_type AS privilege_type,
            (aclexplode(COALESCE(pg_type.typacl, acldefault(''T''::"char", pg_type.typowner)))).is_grantable AS is_grantable
           FROM pg_type) t(oid, typname, typnamespace, typtype, typowner, grantor, grantee, prtype, grantable),
    pg_namespace n,
    pg_authid u_grantor,
    ( SELECT pg_authid.oid,
            pg_authid.rolname
           FROM pg_authid
        UNION ALL
         SELECT (0)::oid AS oid,
            ''PUBLIC''::name) grantee(oid, rolname)
  WHERE ((t.typnamespace = n.oid) AND (t.typtype = ''c''::"char") AND (t.grantee = grantee.oid) AND (t.grantor = u_grantor.oid) AND (t.prtype = ''USAGE''::text) AND (pg_has_role(u_grantor.oid, ''USAGE''::text) OR pg_has_role(grantee.oid, ''USAGE''::text) OR (grantee.rolname = ''PUBLIC''::name)));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'role_usage_grants', ' SELECT usage_privileges.grantor,
    usage_privileges.grantee,
    usage_privileges.object_catalog,
    usage_privileges.object_schema,
    usage_privileges.object_name,
    usage_privileges.object_type,
    usage_privileges.privilege_type,
    usage_privileges.is_grantable
   FROM information_schema.usage_privileges
  WHERE (((usage_privileges.grantor)::text IN ( SELECT enabled_roles.role_name
           FROM information_schema.enabled_roles)) OR ((usage_privileges.grantee)::text IN ( SELECT enabled_roles.role_name
           FROM information_schema.enabled_roles)));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'usage_privileges', ' SELECT (u.rolname)::information_schema.sql_identifier AS grantor,
    (''PUBLIC''::character varying)::information_schema.sql_identifier AS grantee,
    (current_database())::information_schema.sql_identifier AS object_catalog,
    (n.nspname)::information_schema.sql_identifier AS object_schema,
    (c.collname)::information_schema.sql_identifier AS object_name,
    (''COLLATION''::character varying)::information_schema.character_data AS object_type,
    (''USAGE''::character varying)::information_schema.character_data AS privilege_type,
    (''NO''::character varying)::information_schema.yes_or_no AS is_grantable
   FROM pg_authid u,
    pg_namespace n,
    pg_collation c
  WHERE ((u.oid = c.collowner) AND (c.collnamespace = n.oid) AND (c.collencoding = ANY (ARRAY[''-1''::integer, ( SELECT pg_database.encoding
           FROM pg_database
          WHERE (pg_database.datname = current_database()))])))
UNION ALL
 SELECT (u_grantor.rolname)::information_schema.sql_identifier AS grantor,
    (grantee.rolname)::information_schema.sql_identifier AS grantee,
    (current_database())::information_schema.sql_identifier AS object_catalog,
    (n.nspname)::information_schema.sql_identifier AS object_schema,
    (t.typname)::information_schema.sql_identifier AS object_name,
    (''DOMAIN''::character varying)::information_schema.character_data AS object_type,
    (''USAGE''::character varying)::information_schema.character_data AS privilege_type,
    (
        CASE
            WHEN (pg_has_role(grantee.oid, t.typowner, ''USAGE''::text) OR t.grantable) THEN ''YES''::text
            ELSE ''NO''::text
        END)::information_schema.yes_or_no AS is_grantable
   FROM ( SELECT pg_type.oid,
            pg_type.typname,
            pg_type.typnamespace,
            pg_type.typtype,
            pg_type.typowner,
            (aclexplode(COALESCE(pg_type.typacl, acldefault(''T''::"char", pg_type.typowner)))).grantor AS grantor,
            (aclexplode(COALESCE(pg_type.typacl, acldefault(''T''::"char", pg_type.typowner)))).grantee AS grantee,
            (aclexplode(COALESCE(pg_type.typacl, acldefault(''T''::"char", pg_type.typowner)))).privilege_type AS privilege_type,
            (aclexplode(COALESCE(pg_type.typacl, acldefault(''T''::"char", pg_type.typowner)))).is_grantable AS is_grantable
           FROM pg_type) t(oid, typname, typnamespace, typtype, typowner, grantor, grantee, prtype, grantable),
    pg_namespace n,
    pg_authid u_grantor,
    ( SELECT pg_authid.oid,
            pg_authid.rolname
           FROM pg_authid
        UNION ALL
         SELECT (0)::oid AS oid,
            ''PUBLIC''::name) grantee(oid, rolname)
  WHERE ((t.typnamespace = n.oid) AND (t.typtype = ''d''::"char") AND (t.grantee = grantee.oid) AND (t.grantor = u_grantor.oid) AND (t.prtype = ''USAGE''::text) AND (pg_has_role(u_grantor.oid, ''USAGE''::text) OR pg_has_role(grantee.oid, ''USAGE''::text) OR (grantee.rolname = ''PUBLIC''::name)))
UNION ALL
 SELECT (u_grantor.rolname)::information_schema.sql_identifier AS grantor,
    (grantee.rolname)::information_schema.sql_identifier AS grantee,
    (current_database())::information_schema.sql_identifier AS object_catalog,
    (''''::character varying)::information_schema.sql_identifier AS object_schema,
    (fdw.fdwname)::information_schema.sql_identifier AS object_name,
    (''FOREIGN DATA WRAPPER''::character varying)::information_schema.character_data AS object_type,
    (''USAGE''::character varying)::information_schema.character_data AS privilege_type,
    (
        CASE
            WHEN (pg_has_role(grantee.oid, fdw.fdwowner, ''USAGE''::text) OR fdw.grantable) THEN ''YES''::text
            ELSE ''NO''::text
        END)::information_schema.yes_or_no AS is_grantable
   FROM ( SELECT pg_foreign_data_wrapper.fdwname,
            pg_foreign_data_wrapper.fdwowner,
            (aclexplode(COALESCE(pg_foreign_data_wrapper.fdwacl, acldefault(''F''::"char", pg_foreign_data_wrapper.fdwowner)))).grantor AS grantor,
            (aclexplode(COALESCE(pg_foreign_data_wrapper.fdwacl, acldefault(''F''::"char", pg_foreign_data_wrapper.fdwowner)))).grantee AS grantee,
            (aclexplode(COALESCE(pg_foreign_data_wrapper.fdwacl, acldefault(''F''::"char", pg_foreign_data_wrapper.fdwowner)))).privilege_type AS privilege_type,
            (aclexplode(COALESCE(pg_foreign_data_wrapper.fdwacl, acldefault(''F''::"char", pg_foreign_data_wrapper.fdwowner)))).is_grantable AS is_grantable
           FROM pg_foreign_data_wrapper) fdw(fdwname, fdwowner, grantor, grantee, prtype, grantable),
    pg_authid u_grantor,
    ( SELECT pg_authid.oid,
            pg_authid.rolname
           FROM pg_authid
        UNION ALL
         SELECT (0)::oid AS oid,
            ''PUBLIC''::name) grantee(oid, rolname)
  WHERE ((u_grantor.oid = fdw.grantor) AND (grantee.oid = fdw.grantee) AND (fdw.prtype = ''USAGE''::text) AND (pg_has_role(u_grantor.oid, ''USAGE''::text) OR pg_has_role(grantee.oid, ''USAGE''::text) OR (grantee.rolname = ''PUBLIC''::name)))
UNION ALL
 SELECT (u_grantor.rolname)::information_schema.sql_identifier AS grantor,
    (grantee.rolname)::information_schema.sql_identifier AS grantee,
    (current_database())::information_schema.sql_identifier AS object_catalog,
    (''''::character varying)::information_schema.sql_identifier AS object_schema,
    (srv.srvname)::information_schema.sql_identifier AS object_name,
    (''FOREIGN SERVER''::character varying)::information_schema.character_data AS object_type,
    (''USAGE''::character varying)::information_schema.character_data AS privilege_type,
    (
        CASE
            WHEN (pg_has_role(grantee.oid, srv.srvowner, ''USAGE''::text) OR srv.grantable) THEN ''YES''::text
            ELSE ''NO''::text
        END)::information_schema.yes_or_no AS is_grantable
   FROM ( SELECT pg_foreign_server.srvname,
            pg_foreign_server.srvowner,
            (aclexplode(COALESCE(pg_foreign_server.srvacl, acldefault(''S''::"char", pg_foreign_server.srvowner)))).grantor AS grantor,
            (aclexplode(COALESCE(pg_foreign_server.srvacl, acldefault(''S''::"char", pg_foreign_server.srvowner)))).grantee AS grantee,
            (aclexplode(COALESCE(pg_foreign_server.srvacl, acldefault(''S''::"char", pg_foreign_server.srvowner)))).privilege_type AS privilege_type,
            (aclexplode(COALESCE(pg_foreign_server.srvacl, acldefault(''S''::"char", pg_foreign_server.srvowner)))).is_grantable AS is_grantable
           FROM pg_foreign_server) srv(srvname, srvowner, grantor, grantee, prtype, grantable),
    pg_authid u_grantor,
    ( SELECT pg_authid.oid,
            pg_authid.rolname
           FROM pg_authid
        UNION ALL
         SELECT (0)::oid AS oid,
            ''PUBLIC''::name) grantee(oid, rolname)
  WHERE ((u_grantor.oid = srv.grantor) AND (grantee.oid = srv.grantee) AND (srv.prtype = ''USAGE''::text) AND (pg_has_role(u_grantor.oid, ''USAGE''::text) OR pg_has_role(grantee.oid, ''USAGE''::text) OR (grantee.rolname = ''PUBLIC''::name)))
UNION ALL
 SELECT (u_grantor.rolname)::information_schema.sql_identifier AS grantor,
    (grantee.rolname)::information_schema.sql_identifier AS grantee,
    (current_database())::information_schema.sql_identifier AS object_catalog,
    (n.nspname)::information_schema.sql_identifier AS object_schema,
    (c.relname)::information_schema.sql_identifier AS object_name,
    (''SEQUENCE''::character varying)::information_schema.character_data AS object_type,
    (''USAGE''::character varying)::information_schema.character_data AS privilege_type,
    (
        CASE
            WHEN (pg_has_role(grantee.oid, c.relowner, ''USAGE''::text) OR c.grantable) THEN ''YES''::text
            ELSE ''NO''::text
        END)::information_schema.yes_or_no AS is_grantable
   FROM ( SELECT pg_class.oid,
            pg_class.relname,
            pg_class.relnamespace,
            pg_class.relkind,
            pg_class.relowner,
            (aclexplode(COALESCE(pg_class.relacl, acldefault(''r''::"char", pg_class.relowner)))).grantor AS grantor,
            (aclexplode(COALESCE(pg_class.relacl, acldefault(''r''::"char", pg_class.relowner)))).grantee AS grantee,
            (aclexplode(COALESCE(pg_class.relacl, acldefault(''r''::"char", pg_class.relowner)))).privilege_type AS privilege_type,
            (aclexplode(COALESCE(pg_class.relacl, acldefault(''r''::"char", pg_class.relowner)))).is_grantable AS is_grantable
           FROM pg_class) c(oid, relname, relnamespace, relkind, relowner, grantor, grantee, prtype, grantable),
    pg_namespace n,
    pg_authid u_grantor,
    ( SELECT pg_authid.oid,
            pg_authid.rolname
           FROM pg_authid
        UNION ALL
         SELECT (0)::oid AS oid,
            ''PUBLIC''::name) grantee(oid, rolname)
  WHERE ((c.relnamespace = n.oid) AND (c.relkind = ''S''::"char") AND (c.grantee = grantee.oid) AND (c.grantor = u_grantor.oid) AND (c.prtype = ''USAGE''::text) AND (pg_has_role(u_grantor.oid, ''USAGE''::text) OR pg_has_role(grantee.oid, ''USAGE''::text) OR (grantee.rolname = ''PUBLIC''::name)));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'user_defined_types', ' SELECT (current_database())::information_schema.sql_identifier AS user_defined_type_catalog,
    (n.nspname)::information_schema.sql_identifier AS user_defined_type_schema,
    (c.relname)::information_schema.sql_identifier AS user_defined_type_name,
    (''STRUCTURED''::character varying)::information_schema.character_data AS user_defined_type_category,
    (''YES''::character varying)::information_schema.yes_or_no AS is_instantiable,
    (NULL::character varying)::information_schema.yes_or_no AS is_final,
    (NULL::character varying)::information_schema.character_data AS ordering_form,
    (NULL::character varying)::information_schema.character_data AS ordering_category,
    (NULL::character varying)::information_schema.sql_identifier AS ordering_routine_catalog,
    (NULL::character varying)::information_schema.sql_identifier AS ordering_routine_schema,
    (NULL::character varying)::information_schema.sql_identifier AS ordering_routine_name,
    (NULL::character varying)::information_schema.character_data AS reference_type,
    (NULL::character varying)::information_schema.character_data AS data_type,
    (NULL::integer)::information_schema.cardinal_number AS character_maximum_length,
    (NULL::integer)::information_schema.cardinal_number AS character_octet_length,
    (NULL::character varying)::information_schema.sql_identifier AS character_set_catalog,
    (NULL::character varying)::information_schema.sql_identifier AS character_set_schema,
    (NULL::character varying)::information_schema.sql_identifier AS character_set_name,
    (NULL::character varying)::information_schema.sql_identifier AS collation_catalog,
    (NULL::character varying)::information_schema.sql_identifier AS collation_schema,
    (NULL::character varying)::information_schema.sql_identifier AS collation_name,
    (NULL::integer)::information_schema.cardinal_number AS numeric_precision,
    (NULL::integer)::information_schema.cardinal_number AS numeric_precision_radix,
    (NULL::integer)::information_schema.cardinal_number AS numeric_scale,
    (NULL::integer)::information_schema.cardinal_number AS datetime_precision,
    (NULL::character varying)::information_schema.character_data AS interval_type,
    (NULL::integer)::information_schema.cardinal_number AS interval_precision,
    (NULL::character varying)::information_schema.sql_identifier AS source_dtd_identifier,
    (NULL::character varying)::information_schema.sql_identifier AS ref_dtd_identifier
   FROM pg_namespace n,
    pg_class c,
    pg_type t
  WHERE ((n.oid = c.relnamespace) AND (t.typrelid = c.oid) AND (c.relkind = ''c''::"char") AND (pg_has_role(t.typowner, ''USAGE''::text) OR has_type_privilege(t.oid, ''USAGE''::text)));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'view_column_usage', ' SELECT DISTINCT (current_database())::information_schema.sql_identifier AS view_catalog,
    (nv.nspname)::information_schema.sql_identifier AS view_schema,
    (v.relname)::information_schema.sql_identifier AS view_name,
    (current_database())::information_schema.sql_identifier AS table_catalog,
    (nt.nspname)::information_schema.sql_identifier AS table_schema,
    (t.relname)::information_schema.sql_identifier AS table_name,
    (a.attname)::information_schema.sql_identifier AS column_name
   FROM pg_namespace nv,
    pg_class v,
    pg_depend dv,
    pg_depend dt,
    pg_class t,
    pg_namespace nt,
    pg_attribute a
  WHERE ((nv.oid = v.relnamespace) AND (v.relkind = ''v''::"char") AND (v.oid = dv.refobjid) AND (dv.refclassid = (''pg_class''::regclass)::oid) AND (dv.classid = (''pg_rewrite''::regclass)::oid) AND (dv.deptype = ''i''::"char") AND (dv.objid = dt.objid) AND (dv.refobjid <> dt.refobjid) AND (dt.classid = (''pg_rewrite''::regclass)::oid) AND (dt.refclassid = (''pg_class''::regclass)::oid) AND (dt.refobjid = t.oid) AND (t.relnamespace = nt.oid) AND (t.relkind = ANY (ARRAY[''r''::"char", ''v''::"char", ''f''::"char", ''p''::"char"])) AND (t.oid = a.attrelid) AND (dt.refobjsubid = a.attnum) AND pg_has_role(t.relowner, ''USAGE''::text));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'view_routine_usage', ' SELECT DISTINCT (current_database())::information_schema.sql_identifier AS table_catalog,
    (nv.nspname)::information_schema.sql_identifier AS table_schema,
    (v.relname)::information_schema.sql_identifier AS table_name,
    (current_database())::information_schema.sql_identifier AS specific_catalog,
    (np.nspname)::information_schema.sql_identifier AS specific_schema,
    ((((p.proname)::text || ''_''::text) || (p.oid)::text))::information_schema.sql_identifier AS specific_name
   FROM pg_namespace nv,
    pg_class v,
    pg_depend dv,
    pg_depend dp,
    pg_proc p,
    pg_namespace np
  WHERE ((nv.oid = v.relnamespace) AND (v.relkind = ''v''::"char") AND (v.oid = dv.refobjid) AND (dv.refclassid = (''pg_class''::regclass)::oid) AND (dv.classid = (''pg_rewrite''::regclass)::oid) AND (dv.deptype = ''i''::"char") AND (dv.objid = dp.objid) AND (dp.classid = (''pg_rewrite''::regclass)::oid) AND (dp.refclassid = (''pg_proc''::regclass)::oid) AND (dp.refobjid = p.oid) AND (p.pronamespace = np.oid) AND pg_has_role(p.proowner, ''USAGE''::text));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'view_table_usage', ' SELECT DISTINCT (current_database())::information_schema.sql_identifier AS view_catalog,
    (nv.nspname)::information_schema.sql_identifier AS view_schema,
    (v.relname)::information_schema.sql_identifier AS view_name,
    (current_database())::information_schema.sql_identifier AS table_catalog,
    (nt.nspname)::information_schema.sql_identifier AS table_schema,
    (t.relname)::information_schema.sql_identifier AS table_name
   FROM pg_namespace nv,
    pg_class v,
    pg_depend dv,
    pg_depend dt,
    pg_class t,
    pg_namespace nt
  WHERE ((nv.oid = v.relnamespace) AND (v.relkind = ''v''::"char") AND (v.oid = dv.refobjid) AND (dv.refclassid = (''pg_class''::regclass)::oid) AND (dv.classid = (''pg_rewrite''::regclass)::oid) AND (dv.deptype = ''i''::"char") AND (dv.objid = dt.objid) AND (dv.refobjid <> dt.refobjid) AND (dt.classid = (''pg_rewrite''::regclass)::oid) AND (dt.refclassid = (''pg_class''::regclass)::oid) AND (dt.refobjid = t.oid) AND (t.relnamespace = nt.oid) AND (t.relkind = ANY (ARRAY[''r''::"char", ''v''::"char", ''f''::"char", ''p''::"char"])) AND pg_has_role(t.relowner, ''USAGE''::text));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'views', ' SELECT (current_database())::information_schema.sql_identifier AS table_catalog,
    (nc.nspname)::information_schema.sql_identifier AS table_schema,
    (c.relname)::information_schema.sql_identifier AS table_name,
    (
        CASE
            WHEN pg_has_role(c.relowner, ''USAGE''::text) THEN pg_get_viewdef(c.oid)
            ELSE NULL::text
        END)::information_schema.character_data AS view_definition,
    (
        CASE
            WHEN (''check_option=cascaded''::text = ANY (c.reloptions)) THEN ''CASCADED''::text
            WHEN (''check_option=local''::text = ANY (c.reloptions)) THEN ''LOCAL''::text
            ELSE ''NONE''::text
        END)::information_schema.character_data AS check_option,
    (
        CASE
            WHEN ((pg_relation_is_updatable((c.oid)::regclass, false) & 20) = 20) THEN ''YES''::text
            ELSE ''NO''::text
        END)::information_schema.yes_or_no AS is_updatable,
    (
        CASE
            WHEN ((pg_relation_is_updatable((c.oid)::regclass, false) & 8) = 8) THEN ''YES''::text
            ELSE ''NO''::text
        END)::information_schema.yes_or_no AS is_insertable_into,
    (
        CASE
            WHEN (EXISTS ( SELECT 1
               FROM pg_trigger
              WHERE ((pg_trigger.tgrelid = c.oid) AND (((pg_trigger.tgtype)::integer & 81) = 81)))) THEN ''YES''::text
            ELSE ''NO''::text
        END)::information_schema.yes_or_no AS is_trigger_updatable,
    (
        CASE
            WHEN (EXISTS ( SELECT 1
               FROM pg_trigger
              WHERE ((pg_trigger.tgrelid = c.oid) AND (((pg_trigger.tgtype)::integer & 73) = 73)))) THEN ''YES''::text
            ELSE ''NO''::text
        END)::information_schema.yes_or_no AS is_trigger_deletable,
    (
        CASE
            WHEN (EXISTS ( SELECT 1
               FROM pg_trigger
              WHERE ((pg_trigger.tgrelid = c.oid) AND (((pg_trigger.tgtype)::integer & 69) = 69)))) THEN ''YES''::text
            ELSE ''NO''::text
        END)::information_schema.yes_or_no AS is_trigger_insertable_into
   FROM pg_namespace nc,
    pg_class c
  WHERE ((c.relnamespace = nc.oid) AND (c.relkind = ''v''::"char") AND (NOT pg_is_other_temp_schema(nc.oid)) AND (pg_has_role(c.relowner, ''USAGE''::text) OR has_table_privilege(c.oid, ''SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER''::text) OR has_any_column_privilege(c.oid, ''SELECT, INSERT, UPDATE, REFERENCES''::text)));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'data_type_privileges', ' SELECT (current_database())::information_schema.sql_identifier AS object_catalog,
    x.objschema AS object_schema,
    x.objname AS object_name,
    (x.objtype)::information_schema.character_data AS object_type,
    x.objdtdid AS dtd_identifier
   FROM ( SELECT attributes.udt_schema,
            attributes.udt_name,
            ''USER-DEFINED TYPE''::text AS text,
            attributes.dtd_identifier
           FROM information_schema.attributes
        UNION ALL
         SELECT columns.table_schema,
            columns.table_name,
            ''TABLE''::text AS text,
            columns.dtd_identifier
           FROM information_schema.columns
        UNION ALL
         SELECT domains.domain_schema,
            domains.domain_name,
            ''DOMAIN''::text AS text,
            domains.dtd_identifier
           FROM information_schema.domains
        UNION ALL
         SELECT parameters.specific_schema,
            parameters.specific_name,
            ''ROUTINE''::text AS text,
            parameters.dtd_identifier
           FROM information_schema.parameters
        UNION ALL
         SELECT routines.specific_schema,
            routines.specific_name,
            ''ROUTINE''::text AS text,
            routines.dtd_identifier
           FROM information_schema.routines) x(objschema, objname, objtype, objdtdid);', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'user_mapping_options', ' SELECT um.authorization_identifier,
    um.foreign_server_catalog,
    um.foreign_server_name,
    (opts.option_name)::information_schema.sql_identifier AS option_name,
    (
        CASE
            WHEN (((um.umuser <> (0)::oid) AND ((um.authorization_identifier)::name = CURRENT_USER)) OR ((um.umuser = (0)::oid) AND pg_has_role((um.srvowner)::name, ''USAGE''::text)) OR ( SELECT pg_authid.rolsuper
               FROM pg_authid
              WHERE (pg_authid.rolname = CURRENT_USER))) THEN opts.option_value
            ELSE NULL::text
        END)::information_schema.character_data AS option_value
   FROM information_schema._pg_user_mappings um,
    LATERAL pg_options_to_table(um.umoptions) opts(option_name, option_value);', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'element_types', ' SELECT (current_database())::information_schema.sql_identifier AS object_catalog,
    (n.nspname)::information_schema.sql_identifier AS object_schema,
    x.objname AS object_name,
    (x.objtype)::information_schema.character_data AS object_type,
    (x.objdtdid)::information_schema.sql_identifier AS collection_type_identifier,
    (
        CASE
            WHEN (nbt.nspname = ''pg_catalog''::name) THEN format_type(bt.oid, NULL::integer)
            ELSE ''USER-DEFINED''::text
        END)::information_schema.character_data AS data_type,
    (NULL::integer)::information_schema.cardinal_number AS character_maximum_length,
    (NULL::integer)::information_schema.cardinal_number AS character_octet_length,
    (NULL::character varying)::information_schema.sql_identifier AS character_set_catalog,
    (NULL::character varying)::information_schema.sql_identifier AS character_set_schema,
    (NULL::character varying)::information_schema.sql_identifier AS character_set_name,
    (
        CASE
            WHEN (nco.nspname IS NOT NULL) THEN current_database()
            ELSE NULL::name
        END)::information_schema.sql_identifier AS collation_catalog,
    (nco.nspname)::information_schema.sql_identifier AS collation_schema,
    (co.collname)::information_schema.sql_identifier AS collation_name,
    (NULL::integer)::information_schema.cardinal_number AS numeric_precision,
    (NULL::integer)::information_schema.cardinal_number AS numeric_precision_radix,
    (NULL::integer)::information_schema.cardinal_number AS numeric_scale,
    (NULL::integer)::information_schema.cardinal_number AS datetime_precision,
    (NULL::character varying)::information_schema.character_data AS interval_type,
    (NULL::integer)::information_schema.cardinal_number AS interval_precision,
    (NULL::character varying)::information_schema.character_data AS domain_default,
    (current_database())::information_schema.sql_identifier AS udt_catalog,
    (nbt.nspname)::information_schema.sql_identifier AS udt_schema,
    (bt.typname)::information_schema.sql_identifier AS udt_name,
    (NULL::character varying)::information_schema.sql_identifier AS scope_catalog,
    (NULL::character varying)::information_schema.sql_identifier AS scope_schema,
    (NULL::character varying)::information_schema.sql_identifier AS scope_name,
    (NULL::integer)::information_schema.cardinal_number AS maximum_cardinality,
    ((''a''::text || (x.objdtdid)::text))::information_schema.sql_identifier AS dtd_identifier
   FROM pg_namespace n,
    pg_type at,
    pg_namespace nbt,
    pg_type bt,
    (( SELECT c.relnamespace,
            (c.relname)::information_schema.sql_identifier AS relname,
                CASE
                    WHEN (c.relkind = ''c''::"char") THEN ''USER-DEFINED TYPE''::text
                    ELSE ''TABLE''::text
                END AS "case",
            a.attnum,
            a.atttypid,
            a.attcollation
           FROM pg_class c,
            pg_attribute a
          WHERE ((c.oid = a.attrelid) AND (c.relkind = ANY (ARRAY[''r''::"char", ''v''::"char", ''f''::"char", ''c''::"char", ''p''::"char"])) AND (a.attnum > 0) AND (NOT a.attisdropped))
        UNION ALL
         SELECT t.typnamespace,
            (t.typname)::information_schema.sql_identifier AS typname,
            ''DOMAIN''::text AS text,
            1,
            t.typbasetype,
            t.typcollation
           FROM pg_type t
          WHERE (t.typtype = ''d''::"char")
        UNION ALL
         SELECT ss.pronamespace,
            ((((ss.proname)::text || ''_''::text) || (ss.oid)::text))::information_schema.sql_identifier AS sql_identifier,
            ''ROUTINE''::text AS text,
            (ss.x).n AS n,
            (ss.x).x AS x,
            0
           FROM ( SELECT p.pronamespace,
                    p.proname,
                    p.oid,
                    information_schema._pg_expandarray(COALESCE(p.proallargtypes, (p.proargtypes)::oid[])) AS x
                   FROM pg_proc p) ss
        UNION ALL
         SELECT p.pronamespace,
            ((((p.proname)::text || ''_''::text) || (p.oid)::text))::information_schema.sql_identifier AS sql_identifier,
            ''ROUTINE''::text AS text,
            0,
            p.prorettype,
            0
           FROM pg_proc p) x(objschema, objname, objtype, objdtdid, objtypeid, objcollation)
     LEFT JOIN (pg_collation co
     JOIN pg_namespace nco ON ((co.collnamespace = nco.oid))) ON (((x.objcollation = co.oid) AND ((nco.nspname <> ''pg_catalog''::name) OR (co.collname <> ''default''::name)))))
  WHERE ((n.oid = x.objschema) AND (at.oid = x.objtypeid) AND ((at.typelem <> (0)::oid) AND (at.typlen = ''-1''::integer)) AND (at.typelem = bt.oid) AND (nbt.oid = bt.typnamespace) AND ((n.nspname, (x.objname)::text, x.objtype, ((x.objdtdid)::information_schema.sql_identifier)::text) IN ( SELECT data_type_privileges.object_schema,
            data_type_privileges.object_name,
            data_type_privileges.object_type,
            data_type_privileges.dtd_identifier
           FROM information_schema.data_type_privileges)));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', '_pg_foreign_table_columns', ' SELECT n.nspname,
    c.relname,
    a.attname,
    a.attfdwoptions
   FROM pg_foreign_table t,
    pg_authid u,
    pg_namespace n,
    pg_class c,
    pg_attribute a
  WHERE ((u.oid = c.relowner) AND (pg_has_role(c.relowner, ''USAGE''::text) OR has_column_privilege(c.oid, a.attnum, ''SELECT, INSERT, UPDATE, REFERENCES''::text)) AND (n.oid = c.relnamespace) AND (c.oid = t.ftrelid) AND (c.relkind = ''f''::"char") AND (a.attrelid = c.oid) AND (a.attnum > 0));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'column_options', ' SELECT (current_database())::information_schema.sql_identifier AS table_catalog,
    (c.nspname)::information_schema.sql_identifier AS table_schema,
    (c.relname)::information_schema.sql_identifier AS table_name,
    (c.attname)::information_schema.sql_identifier AS column_name,
    ((pg_options_to_table(c.attfdwoptions)).option_name)::information_schema.sql_identifier AS option_name,
    ((pg_options_to_table(c.attfdwoptions)).option_value)::information_schema.character_data AS option_value
   FROM information_schema._pg_foreign_table_columns c;', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', '_pg_foreign_data_wrappers', ' SELECT w.oid,
    w.fdwowner,
    w.fdwoptions,
    (current_database())::information_schema.sql_identifier AS foreign_data_wrapper_catalog,
    (w.fdwname)::information_schema.sql_identifier AS foreign_data_wrapper_name,
    (u.rolname)::information_schema.sql_identifier AS authorization_identifier,
    (''c''::character varying)::information_schema.character_data AS foreign_data_wrapper_language
   FROM pg_foreign_data_wrapper w,
    pg_authid u
  WHERE ((u.oid = w.fdwowner) AND (pg_has_role(w.fdwowner, ''USAGE''::text) OR has_foreign_data_wrapper_privilege(w.oid, ''USAGE''::text)));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'foreign_data_wrapper_options', ' SELECT w.foreign_data_wrapper_catalog,
    w.foreign_data_wrapper_name,
    ((pg_options_to_table(w.fdwoptions)).option_name)::information_schema.sql_identifier AS option_name,
    ((pg_options_to_table(w.fdwoptions)).option_value)::information_schema.character_data AS option_value
   FROM information_schema._pg_foreign_data_wrappers w;', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'user_mappings', ' SELECT _pg_user_mappings.authorization_identifier,
    _pg_user_mappings.foreign_server_catalog,
    _pg_user_mappings.foreign_server_name
   FROM information_schema._pg_user_mappings;', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'foreign_data_wrappers', ' SELECT w.foreign_data_wrapper_catalog,
    w.foreign_data_wrapper_name,
    w.authorization_identifier,
    (NULL::character varying)::information_schema.character_data AS library_name,
    w.foreign_data_wrapper_language
   FROM information_schema._pg_foreign_data_wrappers w;', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', '_pg_foreign_servers', ' SELECT s.oid,
    s.srvoptions,
    (current_database())::information_schema.sql_identifier AS foreign_server_catalog,
    (s.srvname)::information_schema.sql_identifier AS foreign_server_name,
    (current_database())::information_schema.sql_identifier AS foreign_data_wrapper_catalog,
    (w.fdwname)::information_schema.sql_identifier AS foreign_data_wrapper_name,
    (s.srvtype)::information_schema.character_data AS foreign_server_type,
    (s.srvversion)::information_schema.character_data AS foreign_server_version,
    (u.rolname)::information_schema.sql_identifier AS authorization_identifier
   FROM pg_foreign_server s,
    pg_foreign_data_wrapper w,
    pg_authid u
  WHERE ((w.oid = s.srvfdw) AND (u.oid = s.srvowner) AND (pg_has_role(s.srvowner, ''USAGE''::text) OR has_server_privilege(s.oid, ''USAGE''::text)));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'foreign_server_options', ' SELECT s.foreign_server_catalog,
    s.foreign_server_name,
    ((pg_options_to_table(s.srvoptions)).option_name)::information_schema.sql_identifier AS option_name,
    ((pg_options_to_table(s.srvoptions)).option_value)::information_schema.character_data AS option_value
   FROM information_schema._pg_foreign_servers s;', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'foreign_servers', ' SELECT _pg_foreign_servers.foreign_server_catalog,
    _pg_foreign_servers.foreign_server_name,
    _pg_foreign_servers.foreign_data_wrapper_catalog,
    _pg_foreign_servers.foreign_data_wrapper_name,
    _pg_foreign_servers.foreign_server_type,
    _pg_foreign_servers.foreign_server_version,
    _pg_foreign_servers.authorization_identifier
   FROM information_schema._pg_foreign_servers;', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', '_pg_foreign_tables', ' SELECT (current_database())::information_schema.sql_identifier AS foreign_table_catalog,
    (n.nspname)::information_schema.sql_identifier AS foreign_table_schema,
    (c.relname)::information_schema.sql_identifier AS foreign_table_name,
    t.ftoptions,
    (current_database())::information_schema.sql_identifier AS foreign_server_catalog,
    (s.srvname)::information_schema.sql_identifier AS foreign_server_name,
    (u.rolname)::information_schema.sql_identifier AS authorization_identifier
   FROM pg_foreign_table t,
    pg_foreign_server s,
    pg_foreign_data_wrapper w,
    pg_authid u,
    pg_namespace n,
    pg_class c
  WHERE ((w.oid = s.srvfdw) AND (u.oid = c.relowner) AND (pg_has_role(c.relowner, ''USAGE''::text) OR has_table_privilege(c.oid, ''SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER''::text) OR has_any_column_privilege(c.oid, ''SELECT, INSERT, UPDATE, REFERENCES''::text)) AND (n.oid = c.relnamespace) AND (c.oid = t.ftrelid) AND (c.relkind = ''f''::"char") AND (s.oid = t.ftserver));', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'foreign_table_options', ' SELECT t.foreign_table_catalog,
    t.foreign_table_schema,
    t.foreign_table_name,
    ((pg_options_to_table(t.ftoptions)).option_name)::information_schema.sql_identifier AS option_name,
    ((pg_options_to_table(t.ftoptions)).option_value)::information_schema.character_data AS option_value
   FROM information_schema._pg_foreign_tables t;', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', 'foreign_tables', ' SELECT _pg_foreign_tables.foreign_table_catalog,
    _pg_foreign_tables.foreign_table_schema,
    _pg_foreign_tables.foreign_table_name,
    _pg_foreign_tables.foreign_server_catalog,
    _pg_foreign_tables.foreign_server_name
   FROM information_schema._pg_foreign_tables;', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');
INSERT INTO information_schema.views (table_catalog, table_schema, table_name, view_definition, check_option, is_updatable, is_insertable_into, is_trigger_updatable, is_trigger_deletable, is_trigger_insertable_into) VALUES ('schedule', 'information_schema', '_pg_user_mappings', ' SELECT um.oid,
    um.umoptions,
    um.umuser,
    (COALESCE(u.rolname, ''PUBLIC''::name))::information_schema.sql_identifier AS authorization_identifier,
    s.foreign_server_catalog,
    s.foreign_server_name,
    s.authorization_identifier AS srvowner
   FROM (pg_user_mapping um
     LEFT JOIN pg_authid u ON ((u.oid = um.umuser))),
    information_schema._pg_foreign_servers s
  WHERE (s.oid = um.umserver);', 'NONE', 'NO', 'NO', 'NO', 'NO', 'NO');