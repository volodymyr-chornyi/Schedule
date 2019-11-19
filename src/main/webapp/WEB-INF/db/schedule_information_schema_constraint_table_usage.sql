INSERT INTO information_schema.constraint_table_usage (table_catalog, table_schema, table_name, constraint_catalog, constraint_schema, constraint_name) VALUES ('schedule', 'public', 'groups', 'schedule', 'public', 'groups_pkey');
INSERT INTO information_schema.constraint_table_usage (table_catalog, table_schema, table_name, constraint_catalog, constraint_schema, constraint_name) VALUES ('schedule', 'public', 'groups', 'schedule', 'public', 'groups_name_key');
INSERT INTO information_schema.constraint_table_usage (table_catalog, table_schema, table_name, constraint_catalog, constraint_schema, constraint_name) VALUES ('schedule', 'public', 'groups', 'schedule', 'public', 'events_group_id_fkey');
INSERT INTO information_schema.constraint_table_usage (table_catalog, table_schema, table_name, constraint_catalog, constraint_schema, constraint_name) VALUES ('schedule', 'public', 'groups', 'schedule', 'public', 'students_group_id_fkey');
INSERT INTO information_schema.constraint_table_usage (table_catalog, table_schema, table_name, constraint_catalog, constraint_schema, constraint_name) VALUES ('schedule', 'public', 'subjects', 'schedule', 'public', 'subjects_pkey');
INSERT INTO information_schema.constraint_table_usage (table_catalog, table_schema, table_name, constraint_catalog, constraint_schema, constraint_name) VALUES ('schedule', 'public', 'subjects', 'schedule', 'public', 'subjects_name_key');
INSERT INTO information_schema.constraint_table_usage (table_catalog, table_schema, table_name, constraint_catalog, constraint_schema, constraint_name) VALUES ('schedule', 'public', 'subjects', 'schedule', 'public', 'teachers_subjects_subject_id_fkey');
INSERT INTO information_schema.constraint_table_usage (table_catalog, table_schema, table_name, constraint_catalog, constraint_schema, constraint_name) VALUES ('schedule', 'public', 'subjects', 'schedule', 'public', 'events_subject_id_fkey');
INSERT INTO information_schema.constraint_table_usage (table_catalog, table_schema, table_name, constraint_catalog, constraint_schema, constraint_name) VALUES ('schedule', 'public', 'teachers_subjects', 'schedule', 'public', 'teachers_subjects_pkey');
INSERT INTO information_schema.constraint_table_usage (table_catalog, table_schema, table_name, constraint_catalog, constraint_schema, constraint_name) VALUES ('schedule', 'public', 'teachers_subjects', 'schedule', 'public', 'teachers_subjects_teacher_id_subject_id_key');
INSERT INTO information_schema.constraint_table_usage (table_catalog, table_schema, table_name, constraint_catalog, constraint_schema, constraint_name) VALUES ('schedule', 'public', 'teachers', 'schedule', 'public', 'teachers_pkey');
INSERT INTO information_schema.constraint_table_usage (table_catalog, table_schema, table_name, constraint_catalog, constraint_schema, constraint_name) VALUES ('schedule', 'public', 'teachers', 'schedule', 'public', 'teachers_first_name_last_name_key');
INSERT INTO information_schema.constraint_table_usage (table_catalog, table_schema, table_name, constraint_catalog, constraint_schema, constraint_name) VALUES ('schedule', 'public', 'teachers', 'schedule', 'public', 'teachers_subjects_teacher_id_fkey');
INSERT INTO information_schema.constraint_table_usage (table_catalog, table_schema, table_name, constraint_catalog, constraint_schema, constraint_name) VALUES ('schedule', 'public', 'teachers', 'schedule', 'public', 'events_teacher_id_fkey');
INSERT INTO information_schema.constraint_table_usage (table_catalog, table_schema, table_name, constraint_catalog, constraint_schema, constraint_name) VALUES ('schedule', 'public', 'events', 'schedule', 'public', 'events_pkey');
INSERT INTO information_schema.constraint_table_usage (table_catalog, table_schema, table_name, constraint_catalog, constraint_schema, constraint_name) VALUES ('schedule', 'public', 'rooms', 'schedule', 'public', 'rooms_pkey');
INSERT INTO information_schema.constraint_table_usage (table_catalog, table_schema, table_name, constraint_catalog, constraint_schema, constraint_name) VALUES ('schedule', 'public', 'rooms', 'schedule', 'public', 'rooms_building_number_name_key');
INSERT INTO information_schema.constraint_table_usage (table_catalog, table_schema, table_name, constraint_catalog, constraint_schema, constraint_name) VALUES ('schedule', 'public', 'rooms', 'schedule', 'public', 'events_room_id_fkey');
INSERT INTO information_schema.constraint_table_usage (table_catalog, table_schema, table_name, constraint_catalog, constraint_schema, constraint_name) VALUES ('schedule', 'public', 'students', 'schedule', 'public', 'students_pkey');