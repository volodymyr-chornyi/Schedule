INSERT INTO pg_catalog.pg_constraint (conname, connamespace, contype, condeferrable, condeferred, convalidated, conrelid, contypid, conindid, conparentid, confrelid, confupdtype, confdeltype, confmatchtype, conislocal, coninhcount, connoinherit, conkey, confkey, conpfeqop, conppeqop, conffeqop, conexclop, conbin, consrc) VALUES ('cardinal_number_domain_check', 12716, 'c', false, false, true, 0, 12730, 0, 0, 0, ' ', ' ', ' ', true, 0, false, null, null, null, null, null, null, {OPEXPR :opno 525 :opfuncid 150 :opresulttype 16 :opretset false :opcollid 0 :inputcollid 0 :args ({COERCETODOMAINVALUE :typeId 23 :typeMod -1 :collation 0 :location 195} {CONST :consttype 23 :consttypmod -1 :constcollid 0 :constlen 4 :constbyval true :constisnull false :location 204 :constvalue 4 [ 0 0 0 0 0 0 0 0 ]}) :location 201}, '(VALUE >= 0)');
INSERT INTO pg_catalog.pg_constraint (conname, connamespace, contype, condeferrable, condeferred, convalidated, conrelid, contypid, conindid, conparentid, confrelid, confupdtype, confdeltype, confmatchtype, conislocal, coninhcount, connoinherit, conkey, confkey, conpfeqop, conppeqop, conffeqop, conexclop, conbin, consrc) VALUES ('yes_or_no_check', 12716, 'c', false, false, true, 0, 12742, 0, 0, 0, ' ', ' ', ' ', true, 0, false, null, null, null, null, null, null, {SCALARARRAYOPEXPR :opno 98 :opfuncid 67 :useOr true :inputcollid 100 :args ({RELABELTYPE :arg {COERCETODOMAINVALUE :typeId 1043 :typeMod 7 :collation 100 :location 121} :resulttype 25 :resulttypmod -1 :resultcollid 100 :relabelformat 2 :location -1} {ARRAYCOERCEEXPR :arg {ARRAY :array_typeid 1015 :array_collid 100 :element_typeid 1043 :elements ({CONST :consttype 1043 :consttypmod -1 :constcollid 100 :constlen -1 :constbyval false :constisnull false :location 131 :constvalue 7 [ 28 0 0 0 89 69 83 ]} {CONST :consttype 1043 :consttypmod -1 :constcollid 100 :constlen -1 :constbyval false :constisnull false :location 138 :constvalue 6 [ 24 0 0 0 78 79 ]}) :multidims false :location -1} :elemexpr {RELABELTYPE :arg {CASETESTEXPR :typeId 1043 :typeMod -1 :collation 0} :resulttype 25 :resulttypmod -1 :resultcollid 100 :relabelformat 2 :location -1} :resulttype 1009 :resulttypmod -1 :resultcollid 100 :coerceformat 2 :location -1}) :location 127}, '((VALUE)::text = ANY ((ARRAY[''YES''::character varying, ''NO''::character varying])::text[]))');
INSERT INTO pg_catalog.pg_constraint (conname, connamespace, contype, condeferrable, condeferred, convalidated, conrelid, contypid, conindid, conparentid, confrelid, confupdtype, confdeltype, confmatchtype, conislocal, coninhcount, connoinherit, conkey, confkey, conpfeqop, conppeqop, conffeqop, conexclop, conbin, consrc) VALUES ('groups_pkey', 2200, 'p', false, false, true, 17756, 0, 17760, 0, 0, ' ', ' ', ' ', true, 0, true, '{1}', null, null, null, null, null, null, null);
INSERT INTO pg_catalog.pg_constraint (conname, connamespace, contype, condeferrable, condeferred, convalidated, conrelid, contypid, conindid, conparentid, confrelid, confupdtype, confdeltype, confmatchtype, conislocal, coninhcount, connoinherit, conkey, confkey, conpfeqop, conppeqop, conffeqop, conexclop, conbin, consrc) VALUES ('groups_name_key', 2200, 'u', false, false, true, 17756, 0, 17762, 0, 0, ' ', ' ', ' ', true, 0, true, '{2}', null, null, null, null, null, null, null);
INSERT INTO pg_catalog.pg_constraint (conname, connamespace, contype, condeferrable, condeferred, convalidated, conrelid, contypid, conindid, conparentid, confrelid, confupdtype, confdeltype, confmatchtype, conislocal, coninhcount, connoinherit, conkey, confkey, conpfeqop, conppeqop, conffeqop, conexclop, conbin, consrc) VALUES ('subjects_pkey', 2200, 'p', false, false, true, 17779, 0, 17783, 0, 0, ' ', ' ', ' ', true, 0, true, '{1}', null, null, null, null, null, null, null);
INSERT INTO pg_catalog.pg_constraint (conname, connamespace, contype, condeferrable, condeferred, convalidated, conrelid, contypid, conindid, conparentid, confrelid, confupdtype, confdeltype, confmatchtype, conislocal, coninhcount, connoinherit, conkey, confkey, conpfeqop, conppeqop, conffeqop, conexclop, conbin, consrc) VALUES ('subjects_name_key', 2200, 'u', false, false, true, 17779, 0, 17785, 0, 0, ' ', ' ', ' ', true, 0, true, '{2}', null, null, null, null, null, null, null);
INSERT INTO pg_catalog.pg_constraint (conname, connamespace, contype, condeferrable, condeferred, convalidated, conrelid, contypid, conindid, conparentid, confrelid, confupdtype, confdeltype, confmatchtype, conislocal, coninhcount, connoinherit, conkey, confkey, conpfeqop, conppeqop, conffeqop, conexclop, conbin, consrc) VALUES ('teachers_pkey', 2200, 'p', false, false, true, 17789, 0, 17793, 0, 0, ' ', ' ', ' ', true, 0, true, '{1}', null, null, null, null, null, null, null);
INSERT INTO pg_catalog.pg_constraint (conname, connamespace, contype, condeferrable, condeferred, convalidated, conrelid, contypid, conindid, conparentid, confrelid, confupdtype, confdeltype, confmatchtype, conislocal, coninhcount, connoinherit, conkey, confkey, conpfeqop, conppeqop, conffeqop, conexclop, conbin, consrc) VALUES ('teachers_first_name_last_name_key', 2200, 'u', false, false, true, 17789, 0, 17795, 0, 0, ' ', ' ', ' ', true, 0, true, '{3,4}', null, null, null, null, null, null, null);
INSERT INTO pg_catalog.pg_constraint (conname, connamespace, contype, condeferrable, condeferred, convalidated, conrelid, contypid, conindid, conparentid, confrelid, confupdtype, confdeltype, confmatchtype, conislocal, coninhcount, connoinherit, conkey, confkey, conpfeqop, conppeqop, conffeqop, conexclop, conbin, consrc) VALUES ('teachers_subjects_pkey', 2200, 'p', false, false, true, 17799, 0, 17803, 0, 0, ' ', ' ', ' ', true, 0, true, '{1}', null, null, null, null, null, null, null);
INSERT INTO pg_catalog.pg_constraint (conname, connamespace, contype, condeferrable, condeferred, convalidated, conrelid, contypid, conindid, conparentid, confrelid, confupdtype, confdeltype, confmatchtype, conislocal, coninhcount, connoinherit, conkey, confkey, conpfeqop, conppeqop, conffeqop, conexclop, conbin, consrc) VALUES ('teachers_subjects_teacher_id_subject_id_key', 2200, 'u', false, false, true, 17799, 0, 17805, 0, 0, ' ', ' ', ' ', true, 0, true, '{2,3}', null, null, null, null, null, null, null);
INSERT INTO pg_catalog.pg_constraint (conname, connamespace, contype, condeferrable, condeferred, convalidated, conrelid, contypid, conindid, conparentid, confrelid, confupdtype, confdeltype, confmatchtype, conislocal, coninhcount, connoinherit, conkey, confkey, conpfeqop, conppeqop, conffeqop, conexclop, conbin, consrc) VALUES ('teachers_subjects_subject_id_fkey', 2200, 'f', false, false, true, 17799, 0, 17783, 0, 17779, 'a', 'a', 's', true, 0, true, '{3}', '{1}', '{96}', '{96}', '{96}', null, null, null);
INSERT INTO pg_catalog.pg_constraint (conname, connamespace, contype, condeferrable, condeferred, convalidated, conrelid, contypid, conindid, conparentid, confrelid, confupdtype, confdeltype, confmatchtype, conislocal, coninhcount, connoinherit, conkey, confkey, conpfeqop, conppeqop, conffeqop, conexclop, conbin, consrc) VALUES ('teachers_subjects_teacher_id_fkey', 2200, 'f', false, false, true, 17799, 0, 17793, 0, 17789, 'a', 'a', 's', true, 0, true, '{2}', '{1}', '{96}', '{96}', '{96}', null, null, null);
INSERT INTO pg_catalog.pg_constraint (conname, connamespace, contype, condeferrable, condeferred, convalidated, conrelid, contypid, conindid, conparentid, confrelid, confupdtype, confdeltype, confmatchtype, conislocal, coninhcount, connoinherit, conkey, confkey, conpfeqop, conppeqop, conffeqop, conexclop, conbin, consrc) VALUES ('rooms_pkey', 2200, 'p', false, false, true, 17858, 0, 17862, 0, 0, ' ', ' ', ' ', true, 0, true, '{1}', null, null, null, null, null, null, null);
INSERT INTO pg_catalog.pg_constraint (conname, connamespace, contype, condeferrable, condeferred, convalidated, conrelid, contypid, conindid, conparentid, confrelid, confupdtype, confdeltype, confmatchtype, conislocal, coninhcount, connoinherit, conkey, confkey, conpfeqop, conppeqop, conffeqop, conexclop, conbin, consrc) VALUES ('rooms_building_number_name_key', 2200, 'u', false, false, true, 17858, 0, 17864, 0, 0, ' ', ' ', ' ', true, 0, true, '{2,3}', null, null, null, null, null, null, null);
INSERT INTO pg_catalog.pg_constraint (conname, connamespace, contype, condeferrable, condeferred, convalidated, conrelid, contypid, conindid, conparentid, confrelid, confupdtype, confdeltype, confmatchtype, conislocal, coninhcount, connoinherit, conkey, confkey, conpfeqop, conppeqop, conffeqop, conexclop, conbin, consrc) VALUES ('events_pkey', 2200, 'p', false, false, true, 17868, 0, 17872, 0, 0, ' ', ' ', ' ', true, 0, true, '{1}', null, null, null, null, null, null, null);
INSERT INTO pg_catalog.pg_constraint (conname, connamespace, contype, condeferrable, condeferred, convalidated, conrelid, contypid, conindid, conparentid, confrelid, confupdtype, confdeltype, confmatchtype, conislocal, coninhcount, connoinherit, conkey, confkey, conpfeqop, conppeqop, conffeqop, conexclop, conbin, consrc) VALUES ('events_subject_id_fkey', 2200, 'f', false, false, true, 17868, 0, 17783, 0, 17779, 'a', 'a', 's', true, 0, true, '{5}', '{1}', '{96}', '{96}', '{96}', null, null, null);
INSERT INTO pg_catalog.pg_constraint (conname, connamespace, contype, condeferrable, condeferred, convalidated, conrelid, contypid, conindid, conparentid, confrelid, confupdtype, confdeltype, confmatchtype, conislocal, coninhcount, connoinherit, conkey, confkey, conpfeqop, conppeqop, conffeqop, conexclop, conbin, consrc) VALUES ('events_teacher_id_fkey', 2200, 'f', false, false, true, 17868, 0, 17793, 0, 17789, 'a', 'a', 's', true, 0, true, '{4}', '{1}', '{96}', '{96}', '{96}', null, null, null);
INSERT INTO pg_catalog.pg_constraint (conname, connamespace, contype, condeferrable, condeferred, convalidated, conrelid, contypid, conindid, conparentid, confrelid, confupdtype, confdeltype, confmatchtype, conislocal, coninhcount, connoinherit, conkey, confkey, conpfeqop, conppeqop, conffeqop, conexclop, conbin, consrc) VALUES ('events_group_id_fkey', 2200, 'f', false, false, true, 17868, 0, 17760, 0, 17756, 'a', 'a', 's', true, 0, true, '{6}', '{1}', '{96}', '{96}', '{96}', null, null, null);
INSERT INTO pg_catalog.pg_constraint (conname, connamespace, contype, condeferrable, condeferred, convalidated, conrelid, contypid, conindid, conparentid, confrelid, confupdtype, confdeltype, confmatchtype, conislocal, coninhcount, connoinherit, conkey, confkey, conpfeqop, conppeqop, conffeqop, conexclop, conbin, consrc) VALUES ('events_room_id_fkey', 2200, 'f', false, false, true, 17868, 0, 17862, 0, 17858, 'a', 'a', 's', true, 0, true, '{7}', '{1}', '{96}', '{96}', '{96}', null, null, null);
INSERT INTO pg_catalog.pg_constraint (conname, connamespace, contype, condeferrable, condeferred, convalidated, conrelid, contypid, conindid, conparentid, confrelid, confupdtype, confdeltype, confmatchtype, conislocal, coninhcount, connoinherit, conkey, confkey, conpfeqop, conppeqop, conffeqop, conexclop, conbin, consrc) VALUES ('students_pkey', 2200, 'p', false, false, true, 17909, 0, 17913, 0, 0, ' ', ' ', ' ', true, 0, true, '{1}', null, null, null, null, null, null, null);
INSERT INTO pg_catalog.pg_constraint (conname, connamespace, contype, condeferrable, condeferred, convalidated, conrelid, contypid, conindid, conparentid, confrelid, confupdtype, confdeltype, confmatchtype, conislocal, coninhcount, connoinherit, conkey, confkey, conpfeqop, conppeqop, conffeqop, conexclop, conbin, consrc) VALUES ('students_group_id_fkey', 2200, 'f', false, false, true, 17909, 0, 17760, 0, 17756, 'a', 'a', 's', true, 0, true, '{5}', '{1}', '{96}', '{96}', '{96}', null, null, null);