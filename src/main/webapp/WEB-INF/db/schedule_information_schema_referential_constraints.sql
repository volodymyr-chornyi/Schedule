INSERT INTO information_schema.referential_constraints (constraint_catalog, constraint_schema, constraint_name, unique_constraint_catalog, unique_constraint_schema, unique_constraint_name, match_option, update_rule, delete_rule) VALUES ('schedule', 'public', 'teachers_subjects_teacher_id_fkey', 'schedule', 'public', 'teachers_pkey', 'NONE', 'NO ACTION', 'NO ACTION');
INSERT INTO information_schema.referential_constraints (constraint_catalog, constraint_schema, constraint_name, unique_constraint_catalog, unique_constraint_schema, unique_constraint_name, match_option, update_rule, delete_rule) VALUES ('schedule', 'public', 'teachers_subjects_subject_id_fkey', 'schedule', 'public', 'subjects_pkey', 'NONE', 'NO ACTION', 'NO ACTION');
INSERT INTO information_schema.referential_constraints (constraint_catalog, constraint_schema, constraint_name, unique_constraint_catalog, unique_constraint_schema, unique_constraint_name, match_option, update_rule, delete_rule) VALUES ('schedule', 'public', 'events_room_id_fkey', 'schedule', 'public', 'rooms_pkey', 'NONE', 'NO ACTION', 'NO ACTION');
INSERT INTO information_schema.referential_constraints (constraint_catalog, constraint_schema, constraint_name, unique_constraint_catalog, unique_constraint_schema, unique_constraint_name, match_option, update_rule, delete_rule) VALUES ('schedule', 'public', 'events_group_id_fkey', 'schedule', 'public', 'groups_pkey', 'NONE', 'NO ACTION', 'NO ACTION');
INSERT INTO information_schema.referential_constraints (constraint_catalog, constraint_schema, constraint_name, unique_constraint_catalog, unique_constraint_schema, unique_constraint_name, match_option, update_rule, delete_rule) VALUES ('schedule', 'public', 'events_teacher_id_fkey', 'schedule', 'public', 'teachers_pkey', 'NONE', 'NO ACTION', 'NO ACTION');
INSERT INTO information_schema.referential_constraints (constraint_catalog, constraint_schema, constraint_name, unique_constraint_catalog, unique_constraint_schema, unique_constraint_name, match_option, update_rule, delete_rule) VALUES ('schedule', 'public', 'events_subject_id_fkey', 'schedule', 'public', 'subjects_pkey', 'NONE', 'NO ACTION', 'NO ACTION');
INSERT INTO information_schema.referential_constraints (constraint_catalog, constraint_schema, constraint_name, unique_constraint_catalog, unique_constraint_schema, unique_constraint_name, match_option, update_rule, delete_rule) VALUES ('schedule', 'public', 'students_group_id_fkey', 'schedule', 'public', 'groups_pkey', 'NONE', 'NO ACTION', 'NO ACTION');