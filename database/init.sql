--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

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

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: shakalyan
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.categories OWNER TO shakalyan;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: shakalyan
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO shakalyan;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: shakalyan
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: employees; Type: TABLE; Schema: public; Owner: shakalyan
--

CREATE TABLE public.employees (
    id uuid NOT NULL,
    username character varying(32) NOT NULL,
    password character varying(255) NOT NULL,
    full_name character varying(255) NOT NULL
);


ALTER TABLE public.employees OWNER TO shakalyan;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: shakalyan
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.roles OWNER TO shakalyan;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: shakalyan
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO shakalyan;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: shakalyan
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: roles_mapping; Type: TABLE; Schema: public; Owner: shakalyan
--

CREATE TABLE public.roles_mapping (
    employee_id uuid NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.roles_mapping OWNER TO shakalyan;

--
-- Name: tasks; Type: TABLE; Schema: public; Owner: shakalyan
--

CREATE TABLE public.tasks (
    id uuid NOT NULL,
    name character varying(32) NOT NULL,
    category_id integer NOT NULL,
    text_url character varying(255) NOT NULL
);


ALTER TABLE public.tasks OWNER TO shakalyan;

--
-- Name: tasks_completions; Type: TABLE; Schema: public; Owner: shakalyan
--

CREATE TABLE public.tasks_completions (
    employee_id uuid NOT NULL,
    task_id uuid NOT NULL
);


ALTER TABLE public.tasks_completions OWNER TO shakalyan;

--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: shakalyan
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: shakalyan
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: shakalyan
--

COPY public.categories (id, name) FROM stdin;
2	Вишинг
3	Смишинг
1	Фишинг
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: shakalyan
--

COPY public.employees (id, username, password, full_name) FROM stdin;
a9d4d66d-2d35-433c-98bd-42e2f1da8298	volkov_am	$2a$10$up9XnvS/.c/YiVBNFm.Vue82.3OGmtHaX95tb.jdYa/DRGmwxJCfe	Волков Артём Максимович
5a132654-02e9-4b5c-a03b-fba81ac006be	berezin_ai	$2a$10$AAi.Ofwj4SRJH4HsXSzZB.44FSXhnAJQBrcuPVUQVjxrTeOkqrtFS	Березин Артём Ибрагимович
6730b60e-8fb0-469d-9f98-91dfbb8107c6	ivanov_dk	$2a$10$77H.gn8TNKeePYuumn2l5ePQStxAZP6V4izQXT.Eq4N0QgXHYOtSG	Иванов Дмитрий Константинович
d1ac008d-8441-4cb8-8ea2-23f26dcc6282	filippova_at	$2a$10$FQgJi0dGL3ao7zlGpDM2vuf3q95XiK.UXy2CgugRBbW3T2vOsnbM6	Филиппова Алёна Тимофеевна
1d60665c-cf90-4623-ac68-6302286bc680	petrova_aa	$2a$10$uwQw9GuGuuiE5LevzrYoQOUAEmieNjnphcbWZietPYt7.7ayQ/ZEu	Петрова Арина Анатольевна
fe2889ea-6f1e-4615-a3dc-e5aa0d85606b	scherbakov_fs	$2a$10$VpXCpL13Ovv71vkhpppTleUMA3Y1nCLnCtigklkneonJdqchpqk9m	Щербаков Фёдор Сергеевич
5618283f-c1c9-4a00-839c-ad048bd07d56	vasilieva_vya	$2a$10$NISPluQcp/BDHPMsrozGRebZE5hGzS.v4NUMr48oERcpoo4KFlHiu	Васильева Варвара Ярославовна
a4e5ddb9-b553-4dde-aea8-909bb84b77b8	hohlov_vm	$2a$10$CRdusukmbPe/5QUlJy3wmO3C0VuU7.NujstpTg3EAQ6CDq4CCMG.2	Хохлов Владимир Макарович
906953e3-29cd-42e9-97e0-41b2772118b0	filimonova_yaf	$2a$10$d383MPUukyTRYqYxCXXn.OzshLYxYGkNOYwxQpKM8AF1Pg85uhFzW	Филимонова Ясмина Фёдоровна
157278fd-4f77-4841-977b-b693652d0b50	vereschagina_ld	$2a$10$oFhxkDbmxwCkwU/mAyTMmesuPUuxmyg8/YmgZm6.lyVtEo6c02s.i	Верещагина Лидия Демидовна
c6acdc6a-50f5-49ca-bd76-1afcaaea64b2	admin	$2a$10$6d9IcdCzUVXlx90RhtWmOupKkRhn2NxW5CYhG9/4mNltVMPEppl92	Админ
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: shakalyan
--

COPY public.roles (id, name) FROM stdin;
7	ROLE_USER
8	ROLE_ADMIN
\.


--
-- Data for Name: roles_mapping; Type: TABLE DATA; Schema: public; Owner: shakalyan
--

COPY public.roles_mapping (employee_id, role_id) FROM stdin;
a9d4d66d-2d35-433c-98bd-42e2f1da8298	7
5a132654-02e9-4b5c-a03b-fba81ac006be	7
6730b60e-8fb0-469d-9f98-91dfbb8107c6	7
d1ac008d-8441-4cb8-8ea2-23f26dcc6282	7
1d60665c-cf90-4623-ac68-6302286bc680	7
fe2889ea-6f1e-4615-a3dc-e5aa0d85606b	7
5618283f-c1c9-4a00-839c-ad048bd07d56	7
a4e5ddb9-b553-4dde-aea8-909bb84b77b8	7
906953e3-29cd-42e9-97e0-41b2772118b0	7
157278fd-4f77-4841-977b-b693652d0b50	7
c6acdc6a-50f5-49ca-bd76-1afcaaea64b2	7
c6acdc6a-50f5-49ca-bd76-1afcaaea64b2	8
\.


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: shakalyan
--

COPY public.tasks (id, name, category_id, text_url) FROM stdin;
16693a7a-98cb-430d-8f95-35b0c6ae5815	Fishing1	1	text-site/fishing/1
2bfb29df-9456-4ba6-a297-2b29a50efb94	Fishing2	1	text-site/fishing/2
6d833f8b-dfef-4a6b-94c3-dfffe63f9cc9	Fishing3	1	text-site/fishing/3
9278bc6f-031c-4778-b7f2-b77be570b584	Fishing4	1	text-site/fishing/4
459c9185-b7b6-48c8-8d71-1b9110f0758f	Fishing5	1	text-site/fishing/5
c416d078-e21d-4589-bf0c-be5471da3d5c	Vishing1	2	text-site/vishing/1
bdd5dcac-5dc5-4976-8844-01a48f4c6188	Vishing2	2	text-site/vishing/2
98234a30-861d-497a-9187-59df68969ada	Vishing3	2	text-site/vishing/3
9076ea06-feaf-4254-b200-a885b34ab4ae	Vishing4	2	text-site/vishing/4
966a43af-b084-4745-a6ef-91443e56a626	Vishing5	2	text-site/vishing/5
ceefb400-7317-4d49-9352-ed908179c7bd	Smishing1	3	text-site/smishing/1
1266981e-9bec-47cf-9cbc-d8ed9152d598	Smishing2	3	text-site/smishing/2
6fe6d8f8-4d9e-4d98-99f7-331042b72c74	Smishing3	3	text-site/smishing/3
4e67e758-8628-4419-b2e1-9bf87cc63ec0	Smishing4	3	text-site/smishing/4
c9c020ae-0831-46bc-aba6-ff7c43649598	Smishing5	3	text-site/smishing/5
\.


--
-- Data for Name: tasks_completions; Type: TABLE DATA; Schema: public; Owner: shakalyan
--

COPY public.tasks_completions (employee_id, task_id) FROM stdin;
a9d4d66d-2d35-433c-98bd-42e2f1da8298	16693a7a-98cb-430d-8f95-35b0c6ae5815
a9d4d66d-2d35-433c-98bd-42e2f1da8298	2bfb29df-9456-4ba6-a297-2b29a50efb94
a9d4d66d-2d35-433c-98bd-42e2f1da8298	c416d078-e21d-4589-bf0c-be5471da3d5c
a9d4d66d-2d35-433c-98bd-42e2f1da8298	ceefb400-7317-4d49-9352-ed908179c7bd
1d60665c-cf90-4623-ac68-6302286bc680	16693a7a-98cb-430d-8f95-35b0c6ae5815
1d60665c-cf90-4623-ac68-6302286bc680	2bfb29df-9456-4ba6-a297-2b29a50efb94
1d60665c-cf90-4623-ac68-6302286bc680	6d833f8b-dfef-4a6b-94c3-dfffe63f9cc9
6730b60e-8fb0-469d-9f98-91dfbb8107c6	c416d078-e21d-4589-bf0c-be5471da3d5c
6730b60e-8fb0-469d-9f98-91dfbb8107c6	bdd5dcac-5dc5-4976-8844-01a48f4c6188
6730b60e-8fb0-469d-9f98-91dfbb8107c6	98234a30-861d-497a-9187-59df68969ada
6730b60e-8fb0-469d-9f98-91dfbb8107c6	ceefb400-7317-4d49-9352-ed908179c7bd
157278fd-4f77-4841-977b-b693652d0b50	ceefb400-7317-4d49-9352-ed908179c7bd
157278fd-4f77-4841-977b-b693652d0b50	1266981e-9bec-47cf-9cbc-d8ed9152d598
157278fd-4f77-4841-977b-b693652d0b50	6fe6d8f8-4d9e-4d98-99f7-331042b72c74
157278fd-4f77-4841-977b-b693652d0b50	4e67e758-8628-4419-b2e1-9bf87cc63ec0
157278fd-4f77-4841-977b-b693652d0b50	16693a7a-98cb-430d-8f95-35b0c6ae5815
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: shakalyan
--

SELECT pg_catalog.setval('public.categories_id_seq', 3, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: shakalyan
--

SELECT pg_catalog.setval('public.roles_id_seq', 8, true);


--
-- Name: categories categories_name_key; Type: CONSTRAINT; Schema: public; Owner: shakalyan
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_name_key UNIQUE (name);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: shakalyan
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: shakalyan
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- Name: employees employees_username_key; Type: CONSTRAINT; Schema: public; Owner: shakalyan
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key UNIQUE (username);


--
-- Name: roles_mapping roles_mapping_pkey; Type: CONSTRAINT; Schema: public; Owner: shakalyan
--

ALTER TABLE ONLY public.roles_mapping
    ADD CONSTRAINT roles_mapping_pkey PRIMARY KEY (employee_id, role_id);


--
-- Name: roles roles_name_key; Type: CONSTRAINT; Schema: public; Owner: shakalyan
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: shakalyan
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: tasks_completions tasks_completions_pkey; Type: CONSTRAINT; Schema: public; Owner: shakalyan
--

ALTER TABLE ONLY public.tasks_completions
    ADD CONSTRAINT tasks_completions_pkey PRIMARY KEY (employee_id, task_id);


--
-- Name: tasks tasks_name_key; Type: CONSTRAINT; Schema: public; Owner: shakalyan
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_name_key UNIQUE (name);


--
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: shakalyan
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: roles_mapping roles_mapping_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: shakalyan
--

ALTER TABLE ONLY public.roles_mapping
    ADD CONSTRAINT roles_mapping_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employees(id);


--
-- Name: roles_mapping roles_mapping_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: shakalyan
--

ALTER TABLE ONLY public.roles_mapping
    ADD CONSTRAINT roles_mapping_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: tasks tasks_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: shakalyan
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: tasks_completions tasks_completions_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: shakalyan
--

ALTER TABLE ONLY public.tasks_completions
    ADD CONSTRAINT tasks_completions_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employees(id);


--
-- Name: tasks_completions tasks_completions_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: shakalyan
--

ALTER TABLE ONLY public.tasks_completions
    ADD CONSTRAINT tasks_completions_task_id_fkey FOREIGN KEY (task_id) REFERENCES public.tasks(id);


--
-- PostgreSQL database dump complete
--

