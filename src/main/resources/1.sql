--
-- PostgreSQL database dump
--

-- Dumped from database version 11.4
-- Dumped by pg_dump version 11.4

-- Started on 2019-11-20 18:09:50

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
-- TOC entry 207 (class 1259 OID 17868)
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
-- TOC entry 206 (class 1259 OID 17866)
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
-- Dependencies: 206
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- TOC entry 197 (class 1259 OID 17756)
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    id integer NOT NULL,
    name character varying(20)
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 17754)
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
-- TOC entry 205 (class 1259 OID 17858)
-- Name: rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms (
    id integer NOT NULL,
    building_number character varying(20),
    name character varying(20)
);


ALTER TABLE public.rooms OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 17856)
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
-- Dependencies: 204
-- Name: rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rooms_id_seq OWNED BY public.rooms.id;


--
-- TOC entry 209 (class 1259 OID 17909)
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
-- TOC entry 208 (class 1259 OID 17907)
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
-- Dependencies: 208
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- TOC entry 199 (class 1259 OID 17779)
-- Name: subjects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subjects (
    id integer NOT NULL,
    name character varying(20)
);


ALTER TABLE public.subjects OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 17777)
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
-- Dependencies: 198
-- Name: subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subjects_id_seq OWNED BY public.subjects.id;


--
-- TOC entry 201 (class 1259 OID 17789)
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
-- TOC entry 200 (class 1259 OID 17787)
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
-- Dependencies: 200
-- Name: teachers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teachers_id_seq OWNED BY public.teachers.id;


--
-- TOC entry 203 (class 1259 OID 17799)
-- Name: teachers_subjects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teachers_subjects (
    id integer NOT NULL,
    teacher_id integer,
    subject_id integer
);


ALTER TABLE public.teachers_subjects OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 17797)
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
-- Dependencies: 202
-- Name: teachers_subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teachers_subjects_id_seq OWNED BY public.teachers_subjects.id;


--
-- TOC entry 2726 (class 2604 OID 17871)
-- Name: events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- TOC entry 2721 (class 2604 OID 17759)
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- TOC entry 2725 (class 2604 OID 17861)
-- Name: rooms id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms ALTER COLUMN id SET DEFAULT nextval('public.rooms_id_seq'::regclass);


--
-- TOC entry 2727 (class 2604 OID 17912)
-- Name: students id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- TOC entry 2722 (class 2604 OID 17782)
-- Name: subjects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects ALTER COLUMN id SET DEFAULT nextval('public.subjects_id_seq'::regclass);


--
-- TOC entry 2723 (class 2604 OID 17792)
-- Name: teachers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers ALTER COLUMN id SET DEFAULT nextval('public.teachers_id_seq'::regclass);


--
-- TOC entry 2724 (class 2604 OID 17802)
-- Name: teachers_subjects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers_subjects ALTER COLUMN id SET DEFAULT nextval('public.teachers_subjects_id_seq'::regclass);


--
-- TOC entry 2891 (class 0 OID 17868)
-- Dependencies: 207
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.events (id, day_of_week, number_event, teacher_id, subject_id, group_id, room_id) VALUES (1, 1, 1, 3, 1, 1, 1);
INSERT INTO public.events (id, day_of_week, number_event, teacher_id, subject_id, group_id, room_id) VALUES (3, 1, 2, 3, 1, 1, 1);
INSERT INTO public.events (id, day_of_week, number_event, teacher_id, subject_id, group_id, room_id) VALUES (5, 1, 3, 3, 1, 1, 1);
INSERT INTO public.events (id, day_of_week, number_event, teacher_id, subject_id, group_id, room_id) VALUES (8, 7, 1, 3, 1, 1, 1);
INSERT INTO public.events (id, day_of_week, number_event, teacher_id, subject_id, group_id, room_id) VALUES (9, 1, 8, 3, 1, 1, 1);
INSERT INTO public.events (id, day_of_week, number_event, teacher_id, subject_id, group_id, room_id) VALUES (10, 1, 4, 3, 1, 1, 1);
INSERT INTO public.events (id, day_of_week, number_event, teacher_id, subject_id, group_id, room_id) VALUES (11, 1, 5, 3, 1, 1, 1);
INSERT INTO public.events (id, day_of_week, number_event, teacher_id, subject_id, group_id, room_id) VALUES (12, 1, 6, 3, 1, 1, 1);
INSERT INTO public.events (id, day_of_week, number_event, teacher_id, subject_id, group_id, room_id) VALUES (13, 1, 7, 3, 1, 1, 1);
INSERT INTO public.events (id, day_of_week, number_event, teacher_id, subject_id, group_id, room_id) VALUES (14, 1, 1, 40, 1, 2, 7);
INSERT INTO public.events (id, day_of_week, number_event, teacher_id, subject_id, group_id, room_id) VALUES (15, 4, 6, 39, 1, 3, 1);
INSERT INTO public.events (id, day_of_week, number_event, teacher_id, subject_id, group_id, room_id) VALUES (7, 7, 8, 40, 1, 2, 7);


--
-- TOC entry 2881 (class 0 OID 17756)
-- Dependencies: 197
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.groups (id, name) VALUES (1, 'g101');
INSERT INTO public.groups (id, name) VALUES (3, 'g103');
INSERT INTO public.groups (id, name) VALUES (2, 'g302');


--
-- TOC entry 2889 (class 0 OID 17858)
-- Dependencies: 205
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rooms (id, building_number, name) VALUES (4, '25,a', '201');
INSERT INTO public.rooms (id, building_number, name) VALUES (5, '44', '101');
INSERT INTO public.rooms (id, building_number, name) VALUES (6, '44', '201');
INSERT INTO public.rooms (id, building_number, name) VALUES (7, '44', '301');
INSERT INTO public.rooms (id, building_number, name) VALUES (1, '25,a', '301');


--
-- TOC entry 2893 (class 0 OID 17909)
-- Dependencies: 209
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.students (id, age, first_name, last_name, group_id) VALUES (3, 30, 'Ivan', 'Petrov', 3);
INSERT INTO public.students (id, age, first_name, last_name, group_id) VALUES (2, 25, 'Sam', 'Petrov', 1);
INSERT INTO public.students (id, age, first_name, last_name, group_id) VALUES (7, 31, 'Stepan', 'Petrov', 1);


--
-- TOC entry 2883 (class 0 OID 17779)
-- Dependencies: 199
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.subjects (id, name) VALUES (1, 'comedy');
INSERT INTO public.subjects (id, name) VALUES (2, 'tragedy');


--
-- TOC entry 2885 (class 0 OID 17789)
-- Dependencies: 201
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.teachers (id, age, first_name, last_name) VALUES (3, 0, 'charlie', 'chaplin');
INSERT INTO public.teachers (id, age, first_name, last_name) VALUES (6, 50, 'Ivan', 'Ivanov');
INSERT INTO public.teachers (id, age, first_name, last_name) VALUES (40, 30, 'Stepan', 'Ivanov');
INSERT INTO public.teachers (id, age, first_name, last_name) VALUES (39, 31, 'Semen', 'Ivanov');


--
-- TOC entry 2887 (class 0 OID 17799)
-- Dependencies: 203
-- Data for Name: teachers_subjects; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.teachers_subjects (id, teacher_id, subject_id) VALUES (3, 6, 2);
INSERT INTO public.teachers_subjects (id, teacher_id, subject_id) VALUES (7, 39, 1);
INSERT INTO public.teachers_subjects (id, teacher_id, subject_id) VALUES (8, 40, 1);


--
-- TOC entry 2906 (class 0 OID 0)
-- Dependencies: 206
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_id_seq', 16, true);


--
-- TOC entry 2907 (class 0 OID 0)
-- Dependencies: 196
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.groups_id_seq', 6, true);


--
-- TOC entry 2908 (class 0 OID 0)
-- Dependencies: 204
-- Name: rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_id_seq', 8, true);


--
-- TOC entry 2909 (class 0 OID 0)
-- Dependencies: 208
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_id_seq', 7, true);


--
-- TOC entry 2910 (class 0 OID 0)
-- Dependencies: 198
-- Name: subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subjects_id_seq', 30, true);


--
-- TOC entry 2911 (class 0 OID 0)
-- Dependencies: 200
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teachers_id_seq', 71, true);


--
-- TOC entry 2912 (class 0 OID 0)
-- Dependencies: 202
-- Name: teachers_subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teachers_subjects_id_seq', 35, true);


--
-- TOC entry 2749 (class 2606 OID 17873)
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 17763)
-- Name: groups groups_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_name_key UNIQUE (name);


--
-- TOC entry 2731 (class 2606 OID 17761)
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 17865)
-- Name: rooms rooms_building_number_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_building_number_name_key UNIQUE (building_number, name);


--
-- TOC entry 2747 (class 2606 OID 17863)
-- Name: rooms rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- TOC entry 2751 (class 2606 OID 17914)
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 17786)
-- Name: subjects subjects_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_name_key UNIQUE (name);


--
-- TOC entry 2735 (class 2606 OID 17784)
-- Name: subjects subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 17796)
-- Name: teachers teachers_first_name_last_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_first_name_last_name_key UNIQUE (first_name, last_name);


--
-- TOC entry 2739 (class 2606 OID 17794)
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 17804)
-- Name: teachers_subjects teachers_subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers_subjects
    ADD CONSTRAINT teachers_subjects_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 17806)
-- Name: teachers_subjects teachers_subjects_teacher_id_subject_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers_subjects
    ADD CONSTRAINT teachers_subjects_teacher_id_subject_id_key UNIQUE (teacher_id, subject_id);


--
-- TOC entry 2756 (class 2606 OID 17884)
-- Name: events events_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- TOC entry 2757 (class 2606 OID 17889)
-- Name: events events_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(id);


--
-- TOC entry 2754 (class 2606 OID 17874)
-- Name: events events_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subjects(id);


--
-- TOC entry 2755 (class 2606 OID 17879)
-- Name: events events_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.teachers(id);


--
-- TOC entry 2758 (class 2606 OID 17915)
-- Name: students students_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- TOC entry 2752 (class 2606 OID 17807)
-- Name: teachers_subjects teachers_subjects_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers_subjects
    ADD CONSTRAINT teachers_subjects_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subjects(id);


--
-- TOC entry 2753 (class 2606 OID 17812)
-- Name: teachers_subjects teachers_subjects_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers_subjects
    ADD CONSTRAINT teachers_subjects_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.teachers(id);


-- Completed on 2019-11-20 18:09:51

--
-- PostgreSQL database dump complete
--

