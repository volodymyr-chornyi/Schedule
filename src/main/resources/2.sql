--
-- PostgreSQL database dump
--

-- Dumped from database version 11.4
-- Dumped by pg_dump version 11.4

-- Started on 2019-11-21 12:45:30

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 209 (class 1259 OID 17995)
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    id integer NOT NULL,
    day_of_week integer NOT NULL,
    number_event integer NOT NULL,
    teacher_id integer NOT NULL,
    subject_id integer NOT NULL,
    group_id integer NOT NULL,
    room_id integer NOT NULL
);


ALTER TABLE public.events OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 17993)
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO postgres;

--
-- TOC entry 2899 (class 0 OID 0)
-- Dependencies: 208
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- TOC entry 197 (class 1259 OID 17922)
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    id integer NOT NULL,
    name character varying(20)
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 17920)
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_id_seq OWNER TO postgres;

--
-- TOC entry 2900 (class 0 OID 0)
-- Dependencies: 196
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- TOC entry 207 (class 1259 OID 17985)
-- Name: rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms (
    id integer NOT NULL,
    building_number character varying(20),
    name character varying(20)
);


ALTER TABLE public.rooms OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 17983)
-- Name: rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rooms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rooms_id_seq OWNER TO postgres;

--
-- TOC entry 2901 (class 0 OID 0)
-- Dependencies: 206
-- Name: rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rooms_id_seq OWNED BY public.rooms.id;


--
-- TOC entry 199 (class 1259 OID 17932)
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    id integer NOT NULL,
    age integer,
    first_name character varying(20),
    last_name character varying(20),
    group_id integer
);


ALTER TABLE public.students OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 17930)
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_id_seq OWNER TO postgres;

--
-- TOC entry 2902 (class 0 OID 0)
-- Dependencies: 198
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- TOC entry 201 (class 1259 OID 17945)
-- Name: subjects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subjects (
    id integer NOT NULL,
    name character varying(20)
);


ALTER TABLE public.subjects OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 17943)
-- Name: subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subjects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subjects_id_seq OWNER TO postgres;

--
-- TOC entry 2903 (class 0 OID 0)
-- Dependencies: 200
-- Name: subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subjects_id_seq OWNED BY public.subjects.id;


--
-- TOC entry 203 (class 1259 OID 17955)
-- Name: teachers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teachers (
    id integer NOT NULL,
    age integer,
    first_name character varying(20),
    last_name character varying(20)
);


ALTER TABLE public.teachers OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 17953)
-- Name: teachers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teachers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teachers_id_seq OWNER TO postgres;

--
-- TOC entry 2904 (class 0 OID 0)
-- Dependencies: 202
-- Name: teachers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teachers_id_seq OWNED BY public.teachers.id;


--
-- TOC entry 205 (class 1259 OID 17965)
-- Name: teachers_subjects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teachers_subjects (
    id integer NOT NULL,
    teacher_id integer,
    subject_id integer
);


ALTER TABLE public.teachers_subjects OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 17963)
-- Name: teachers_subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teachers_subjects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teachers_subjects_id_seq OWNER TO postgres;

--
-- TOC entry 2905 (class 0 OID 0)
-- Dependencies: 204
-- Name: teachers_subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teachers_subjects_id_seq OWNED BY public.teachers_subjects.id;


--
-- TOC entry 2727 (class 2604 OID 17998)
-- Name: events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- TOC entry 2721 (class 2604 OID 17925)
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- TOC entry 2726 (class 2604 OID 17988)
-- Name: rooms id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms ALTER COLUMN id SET DEFAULT nextval('public.rooms_id_seq'::regclass);


--
-- TOC entry 2722 (class 2604 OID 17935)
-- Name: students id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- TOC entry 2723 (class 2604 OID 17948)
-- Name: subjects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects ALTER COLUMN id SET DEFAULT nextval('public.subjects_id_seq'::regclass);


--
-- TOC entry 2724 (class 2604 OID 17958)
-- Name: teachers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers ALTER COLUMN id SET DEFAULT nextval('public.teachers_id_seq'::regclass);


--
-- TOC entry 2725 (class 2604 OID 17968)
-- Name: teachers_subjects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers_subjects ALTER COLUMN id SET DEFAULT nextval('public.teachers_subjects_id_seq'::regclass);


--
-- TOC entry 2893 (class 0 OID 17995)
-- Dependencies: 209
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.events (id, day_of_week, number_event, teacher_id, subject_id, group_id, room_id) VALUES (1, 1, 2, 1, 4, 4, 3);
INSERT INTO public.events (id, day_of_week, number_event, teacher_id, subject_id, group_id, room_id) VALUES (2, 2, 5, 6, 2, 6, 2);
INSERT INTO public.events (id, day_of_week, number_event, teacher_id, subject_id, group_id, room_id) VALUES (3, 3, 7, 5, 5, 9, 1);
INSERT INTO public.events (id, day_of_week, number_event, teacher_id, subject_id, group_id, room_id) VALUES (4, 4, 1, 3, 3, 2, 3);
INSERT INTO public.events (id, day_of_week, number_event, teacher_id, subject_id, group_id, room_id) VALUES (5, 5, 6, 4, 1, 4, 8);
INSERT INTO public.events (id, day_of_week, number_event, teacher_id, subject_id, group_id, room_id) VALUES (6, 6, 8, 2, 7, 4, 6);
INSERT INTO public.events (id, day_of_week, number_event, teacher_id, subject_id, group_id, room_id) VALUES (7, 7, 5, 8, 6, 1, 8);
INSERT INTO public.events (id, day_of_week, number_event, teacher_id, subject_id, group_id, room_id) VALUES (8, 6, 8, 1, 4, 3, 2);
INSERT INTO public.events (id, day_of_week, number_event, teacher_id, subject_id, group_id, room_id) VALUES (9, 1, 7, 7, 9, 10, 2);
INSERT INTO public.events (id, day_of_week, number_event, teacher_id, subject_id, group_id, room_id) VALUES (10, 5, 3, 3, 3, 9, 6);
INSERT INTO public.events (id, day_of_week, number_event, teacher_id, subject_id, group_id, room_id) VALUES (11, 1, 4, 3, 3, 2, 7);
INSERT INTO public.events (id, day_of_week, number_event, teacher_id, subject_id, group_id, room_id) VALUES (12, 1, 2, 2, 7, 10, 7);
INSERT INTO public.events (id, day_of_week, number_event, teacher_id, subject_id, group_id, room_id) VALUES (13, 2, 2, 8, 6, 3, 6);
INSERT INTO public.events (id, day_of_week, number_event, teacher_id, subject_id, group_id, room_id) VALUES (14, 3, 3, 7, 9, 5, 6);


--
-- TOC entry 2881 (class 0 OID 17922)
-- Dependencies: 197
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.groups (id, name) VALUES (1, 'g-101');
INSERT INTO public.groups (id, name) VALUES (2, 'g-102');
INSERT INTO public.groups (id, name) VALUES (3, 'g-201');
INSERT INTO public.groups (id, name) VALUES (4, 'g-202');
INSERT INTO public.groups (id, name) VALUES (5, 'g-301');
INSERT INTO public.groups (id, name) VALUES (6, 'g-302');
INSERT INTO public.groups (id, name) VALUES (7, 'g-401');
INSERT INTO public.groups (id, name) VALUES (8, 'g-402');
INSERT INTO public.groups (id, name) VALUES (9, 'g-501');
INSERT INTO public.groups (id, name) VALUES (10, 'g-502');


--
-- TOC entry 2891 (class 0 OID 17985)
-- Dependencies: 207
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rooms (id, building_number, name) VALUES (1, '25,a', '11');
INSERT INTO public.rooms (id, building_number, name) VALUES (2, '25,a', '15');
INSERT INTO public.rooms (id, building_number, name) VALUES (3, '25,a', '22');
INSERT INTO public.rooms (id, building_number, name) VALUES (4, '25,a', '35');
INSERT INTO public.rooms (id, building_number, name) VALUES (6, '44,b', '31');
INSERT INTO public.rooms (id, building_number, name) VALUES (7, '44,b', '33');
INSERT INTO public.rooms (id, building_number, name) VALUES (8, '44, b', '12');
INSERT INTO public.rooms (id, building_number, name) VALUES (9, '44,b', '25');


--
-- TOC entry 2883 (class 0 OID 17932)
-- Dependencies: 199
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.students (id, age, first_name, last_name, group_id) VALUES (1, 35, 'Andriy', 'Pyatov', 1);
INSERT INTO public.students (id, age, first_name, last_name, group_id) VALUES (2, 23, 'Mykola', 'Matviyenko', 1);
INSERT INTO public.students (id, age, first_name, last_name, group_id) VALUES (3, 27, 'Oleksandr', 'Karavayev', 1);
INSERT INTO public.students (id, age, first_name, last_name, group_id) VALUES (4, 20, 'Vitaliy', 'Mykolenko', 1);
INSERT INTO public.students (id, age, first_name, last_name, group_id) VALUES (5, 30, 'Andriy', 'Yarmolenko', 1);
INSERT INTO public.students (id, age, first_name, last_name, group_id) VALUES (6, 30, 'Yevhen', 'Konoplyanka', 2);
INSERT INTO public.students (id, age, first_name, last_name, group_id) VALUES (7, 28, 'Serhiy', 'Sydorchuk', 2);
INSERT INTO public.students (id, age, first_name, last_name, group_id) VALUES (8, 26, 'Ruslan', 'Malinovskyi', 2);
INSERT INTO public.students (id, age, first_name, last_name, group_id) VALUES (9, 29, 'Roman', 'Bezus', 2);
INSERT INTO public.students (id, age, first_name, last_name, group_id) VALUES (10, 23, 'Roman', 'Yaremchuk', 2);


--
-- TOC entry 2885 (class 0 OID 17945)
-- Dependencies: 201
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.subjects (id, name) VALUES (1, 'JavaScript');
INSERT INTO public.subjects (id, name) VALUES (2, 'Python');
INSERT INTO public.subjects (id, name) VALUES (3, 'Java');
INSERT INTO public.subjects (id, name) VALUES (4, 'C++');
INSERT INTO public.subjects (id, name) VALUES (5, 'PHP');
INSERT INTO public.subjects (id, name) VALUES (6, 'Swift');
INSERT INTO public.subjects (id, name) VALUES (7, 'C-sharp');
INSERT INTO public.subjects (id, name) VALUES (8, 'Ruby');
INSERT INTO public.subjects (id, name) VALUES (9, 'SQL');


--
-- TOC entry 2887 (class 0 OID 17955)
-- Dependencies: 203
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.teachers (id, age, first_name, last_name) VALUES (1, 43, 'Chester', 'Bennington');
INSERT INTO public.teachers (id, age, first_name, last_name) VALUES (2, 42, 'Mike', 'Shinoda');
INSERT INTO public.teachers (id, age, first_name, last_name) VALUES (3, 74, 'Bob', 'Marley');
INSERT INTO public.teachers (id, age, first_name, last_name) VALUES (4, 84, 'Elvis', 'Presley');
INSERT INTO public.teachers (id, age, first_name, last_name) VALUES (5, 61, 'Michael', 'Jackson');
INSERT INTO public.teachers (id, age, first_name, last_name) VALUES (6, 50, 'Louis', 'Armstrong');
INSERT INTO public.teachers (id, age, first_name, last_name) VALUES (7, 80, 'Tina', 'Turner');
INSERT INTO public.teachers (id, age, first_name, last_name) VALUES (8, 30, 'Taylor', 'Swift');


--
-- TOC entry 2889 (class 0 OID 17965)
-- Dependencies: 205
-- Data for Name: teachers_subjects; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.teachers_subjects (id, teacher_id, subject_id) VALUES (1, 1, 4);
INSERT INTO public.teachers_subjects (id, teacher_id, subject_id) VALUES (2, 2, 7);
INSERT INTO public.teachers_subjects (id, teacher_id, subject_id) VALUES (3, 3, 3);
INSERT INTO public.teachers_subjects (id, teacher_id, subject_id) VALUES (4, 4, 1);
INSERT INTO public.teachers_subjects (id, teacher_id, subject_id) VALUES (5, 5, 5);
INSERT INTO public.teachers_subjects (id, teacher_id, subject_id) VALUES (6, 6, 2);
INSERT INTO public.teachers_subjects (id, teacher_id, subject_id) VALUES (7, 7, 9);
INSERT INTO public.teachers_subjects (id, teacher_id, subject_id) VALUES (8, 8, 6);


--
-- TOC entry 2906 (class 0 OID 0)
-- Dependencies: 208
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_id_seq', 14, true);


--
-- TOC entry 2907 (class 0 OID 0)
-- Dependencies: 196
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.groups_id_seq', 10, true);


--
-- TOC entry 2908 (class 0 OID 0)
-- Dependencies: 206
-- Name: rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_id_seq', 9, true);


--
-- TOC entry 2909 (class 0 OID 0)
-- Dependencies: 198
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_id_seq', 10, true);


--
-- TOC entry 2910 (class 0 OID 0)
-- Dependencies: 200
-- Name: subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subjects_id_seq', 9, true);


--
-- TOC entry 2911 (class 0 OID 0)
-- Dependencies: 202
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teachers_id_seq', 8, true);


--
-- TOC entry 2912 (class 0 OID 0)
-- Dependencies: 204
-- Name: teachers_subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teachers_subjects_id_seq', 8, true);


--
-- TOC entry 2751 (class 2606 OID 18000)
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 17929)
-- Name: groups groups_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_name_key UNIQUE (name);


--
-- TOC entry 2731 (class 2606 OID 17927)
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 17992)
-- Name: rooms rooms_building_number_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_building_number_name_key UNIQUE (building_number, name);


--
-- TOC entry 2749 (class 2606 OID 17990)
-- Name: rooms rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 17937)
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 17952)
-- Name: subjects subjects_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_name_key UNIQUE (name);


--
-- TOC entry 2737 (class 2606 OID 17950)
-- Name: subjects subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 17962)
-- Name: teachers teachers_first_name_last_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_first_name_last_name_key UNIQUE (first_name, last_name);


--
-- TOC entry 2741 (class 2606 OID 17960)
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 17970)
-- Name: teachers_subjects teachers_subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers_subjects
    ADD CONSTRAINT teachers_subjects_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 17972)
-- Name: teachers_subjects teachers_subjects_teacher_id_subject_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers_subjects
    ADD CONSTRAINT teachers_subjects_teacher_id_subject_id_key UNIQUE (teacher_id, subject_id);


--
-- TOC entry 2757 (class 2606 OID 18011)
-- Name: events events_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- TOC entry 2758 (class 2606 OID 18016)
-- Name: events events_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(id);


--
-- TOC entry 2755 (class 2606 OID 18001)
-- Name: events events_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subjects(id);


--
-- TOC entry 2756 (class 2606 OID 18006)
-- Name: events events_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.teachers(id);


--
-- TOC entry 2752 (class 2606 OID 17938)
-- Name: students students_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- TOC entry 2753 (class 2606 OID 17973)
-- Name: teachers_subjects teachers_subjects_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers_subjects
    ADD CONSTRAINT teachers_subjects_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subjects(id);


--
-- TOC entry 2754 (class 2606 OID 17978)
-- Name: teachers_subjects teachers_subjects_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers_subjects
    ADD CONSTRAINT teachers_subjects_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.teachers(id);


-- Completed on 2019-11-21 12:45:31

--
-- PostgreSQL database dump complete
--

