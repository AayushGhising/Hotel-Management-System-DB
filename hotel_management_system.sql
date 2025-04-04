--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2025-04-04 12:43:24

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

SET default_table_access_method = heap;

--
-- TOC entry 245 (class 1259 OID 82444)
-- Name: applied_discounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.applied_discounts (
    applied_discount_id integer NOT NULL,
    reservation_id integer NOT NULL,
    discount_id integer NOT NULL
);


ALTER TABLE public.applied_discounts OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 82443)
-- Name: applied_discounts_applied_discount_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.applied_discounts ALTER COLUMN applied_discount_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.applied_discounts_applied_discount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 241 (class 1259 OID 82421)
-- Name: cancellations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cancellations (
    cancellation_id integer NOT NULL,
    reservation_id integer NOT NULL,
    cancellation_reason text,
    cancellation_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.cancellations OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 82420)
-- Name: cancellations_cancellation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cancellations ALTER COLUMN cancellation_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cancellations_cancellation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 228 (class 1259 OID 82321)
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    department_id integer NOT NULL,
    department_name character varying(100) NOT NULL,
    location character varying(255) NOT NULL,
    manager_id integer
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 82320)
-- Name: departments_department_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.departments ALTER COLUMN department_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.departments_department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 243 (class 1259 OID 82435)
-- Name: discounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discounts (
    discount_id integer NOT NULL,
    code character varying(50) NOT NULL,
    discount_percentage numeric(5,2),
    valid_from date NOT NULL,
    valid_to date NOT NULL,
    CONSTRAINT discounts_discount_percentage_check CHECK (((discount_percentage >= (0)::numeric) AND (discount_percentage <= (100)::numeric)))
);


ALTER TABLE public.discounts OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 82434)
-- Name: discounts_discount_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.discounts ALTER COLUMN discount_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.discounts_discount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 229 (class 1259 OID 82331)
-- Name: employee_departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_departments (
    employee_id integer NOT NULL,
    department_id integer NOT NULL
);


ALTER TABLE public.employee_departments OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 82308)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    employee_id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(20) NOT NULL,
    "position" character varying(100) NOT NULL,
    salary numeric(10,2),
    hire_date date NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 82307)
-- Name: employees_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.employees ALTER COLUMN employee_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.employees_employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 233 (class 1259 OID 82353)
-- Name: guest_services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guest_services (
    guest_service_id integer NOT NULL,
    reservation_id integer NOT NULL,
    service_id integer NOT NULL,
    status character varying(50),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT guest_services_status_check CHECK (((status)::text = ANY ((ARRAY['Requested'::character varying, 'In Progress'::character varying, 'Completed'::character varying])::text[])))
);


ALTER TABLE public.guest_services OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 82352)
-- Name: guest_services_guest_service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.guest_services ALTER COLUMN guest_service_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.guest_services_guest_service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 82241)
-- Name: guests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guests (
    guest_id integer NOT NULL,
    name character varying(255) NOT NULL,
    government_id character varying(100) NOT NULL,
    phone character varying(20) NOT NULL,
    email character varying(255) NOT NULL,
    address text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.guests OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 82240)
-- Name: guests_guest_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.guests ALTER COLUMN guest_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.guests_guest_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 239 (class 1259 OID 82402)
-- Name: housekeeping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.housekeeping (
    task_id integer NOT NULL,
    employee_id integer NOT NULL,
    room_id integer NOT NULL,
    task_type character varying(50),
    status character varying(50),
    assigned_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT housekeeping_status_check CHECK (((status)::text = ANY ((ARRAY['Pending'::character varying, 'In Progress'::character varying, 'Completed'::character varying])::text[]))),
    CONSTRAINT housekeeping_task_type_check CHECK (((task_type)::text = ANY ((ARRAY['Cleaning'::character varying, 'Inspection'::character varying, 'Maintenance'::character varying])::text[])))
);


ALTER TABLE public.housekeeping OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 82401)
-- Name: housekeeping_task_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.housekeeping ALTER COLUMN task_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.housekeeping_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 82294)
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    payment_id integer NOT NULL,
    reservation_id integer NOT NULL,
    amount numeric(10,2) NOT NULL,
    payment_method character varying(50),
    payment_status character varying(50),
    payment_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT payments_payment_method_check CHECK (((payment_method)::text = ANY ((ARRAY['Cash'::character varying, 'Credit Card'::character varying, 'Debit Card'::character varying, 'Online'::character varying])::text[]))),
    CONSTRAINT payments_payment_status_check CHECK (((payment_status)::text = ANY ((ARRAY['Pending'::character varying, 'Completed'::character varying, 'Failed'::character varying])::text[])))
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 82293)
-- Name: payments_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.payments ALTER COLUMN payment_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.payments_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 82276)
-- Name: reservations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservations (
    reservation_id integer NOT NULL,
    guest_id integer NOT NULL,
    room_id integer NOT NULL,
    check_in_date date NOT NULL,
    check_out_date date NOT NULL,
    total_price numeric(10,2),
    reservation_status character varying(50),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT reservations_reservation_status_check CHECK (((reservation_status)::text = ANY ((ARRAY['Confirmed'::character varying, 'Checked-In'::character varying, 'Checked-Out'::character varying, 'Cancelled'::character varying])::text[])))
);


ALTER TABLE public.reservations OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 82275)
-- Name: reservations_reservation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.reservations ALTER COLUMN reservation_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.reservations_reservation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 235 (class 1259 OID 82371)
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    review_id integer NOT NULL,
    guest_id integer NOT NULL,
    reservation_id integer NOT NULL,
    rating integer,
    review_text text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT reviews_rating_check CHECK (((rating >= 1) AND (rating <= 5)))
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 82370)
-- Name: reviews_review_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.reviews ALTER COLUMN review_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.reviews_review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 82256)
-- Name: room_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.room_types (
    room_type_id integer NOT NULL,
    type_name character varying(100) NOT NULL,
    price numeric(10,2) NOT NULL
);


ALTER TABLE public.room_types OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 82255)
-- Name: room_types_room_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.room_types ALTER COLUMN room_type_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.room_types_room_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 82262)
-- Name: rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms (
    room_id integer NOT NULL,
    room_number character varying(20) NOT NULL,
    room_type_id integer NOT NULL,
    status character varying(50),
    CONSTRAINT rooms_status_check CHECK (((status)::text = ANY ((ARRAY['Available'::character varying, 'Unavailable'::character varying, 'Maintenance'::character varying])::text[])))
);


ALTER TABLE public.rooms OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 82261)
-- Name: rooms_room_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.rooms ALTER COLUMN room_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.rooms_room_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 231 (class 1259 OID 82347)
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    service_id integer NOT NULL,
    service_name character varying(255) NOT NULL,
    price numeric(10,2) NOT NULL
);


ALTER TABLE public.services OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 82346)
-- Name: services_service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.services ALTER COLUMN service_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.services_service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 237 (class 1259 OID 82391)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(100) NOT NULL,
    password_hash text NOT NULL,
    role character varying(50),
    guest_id integer,
    employee_id integer,
    CONSTRAINT chk_user_link CHECK ((((guest_id IS NOT NULL) AND (employee_id IS NULL)) OR ((employee_id IS NOT NULL) AND (guest_id IS NULL)))),
    CONSTRAINT users_role_check CHECK (((role)::text = ANY ((ARRAY['Admin'::character varying, 'Receptionist'::character varying, 'Housekeeping'::character varying, 'Guest'::character varying])::text[])))
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 82390)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN user_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 5020 (class 0 OID 82444)
-- Dependencies: 245
-- Data for Name: applied_discounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.applied_discounts (applied_discount_id, reservation_id, discount_id) FROM stdin;
1	2	1
\.


--
-- TOC entry 5016 (class 0 OID 82421)
-- Dependencies: 241
-- Data for Name: cancellations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cancellations (cancellation_id, reservation_id, cancellation_reason, cancellation_date) FROM stdin;
1	1	Guest personal reasons	2025-04-03 22:35:30.43794
\.


--
-- TOC entry 5003 (class 0 OID 82321)
-- Dependencies: 228
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (department_id, department_name, location, manager_id) FROM stdin;
1	Front Desk	Lobby	1
2	Housekeeping	Service Area	2
\.


--
-- TOC entry 5018 (class 0 OID 82435)
-- Dependencies: 243
-- Data for Name: discounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.discounts (discount_id, code, discount_percentage, valid_from, valid_to) FROM stdin;
1	SUMMER20	20.00	2025-06-01	2025-08-31
\.


--
-- TOC entry 5004 (class 0 OID 82331)
-- Dependencies: 229
-- Data for Name: employee_departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_departments (employee_id, department_id) FROM stdin;
1	1
2	2
\.


--
-- TOC entry 5001 (class 0 OID 82308)
-- Dependencies: 226
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (employee_id, name, email, phone, "position", salary, hire_date, created_at) FROM stdin;
1	Alice Johnson	alice.johnson@example.com	9876543212	Manager	5000.00	2023-01-15	2025-04-03 22:35:30.43794
2	Bob Williams	bob.williams@example.com	9876543213	Receptionist	3000.00	2023-06-10	2025-04-03 22:35:30.43794
\.


--
-- TOC entry 5008 (class 0 OID 82353)
-- Dependencies: 233
-- Data for Name: guest_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guest_services (guest_service_id, reservation_id, service_id, status, created_at) FROM stdin;
1	1	1	Requested	2025-04-03 22:35:30.43794
2	2	2	In Progress	2025-04-03 22:35:30.43794
\.


--
-- TOC entry 4991 (class 0 OID 82241)
-- Dependencies: 216
-- Data for Name: guests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guests (guest_id, name, government_id, phone, email, address, created_at) FROM stdin;
1	John Doe	GOV123456	9876543210	john.doe@example.com	123 Main St	2025-04-03 22:35:30.43794
2	Jane Smith	GOV789012	9876543211	jane.smith@example.com	456 Elm St	2025-04-03 22:35:30.43794
\.


--
-- TOC entry 5014 (class 0 OID 82402)
-- Dependencies: 239
-- Data for Name: housekeeping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.housekeeping (task_id, employee_id, room_id, task_type, status, assigned_at) FROM stdin;
1	2	1	Cleaning	Pending	2025-04-03 22:35:30.43794
\.


--
-- TOC entry 4999 (class 0 OID 82294)
-- Dependencies: 224
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (payment_id, reservation_id, amount, payment_method, payment_status, payment_date) FROM stdin;
1	1	400.00	Credit Card	Completed	2025-04-03 22:35:30.43794
2	2	600.00	Cash	Pending	2025-04-03 22:35:30.43794
\.


--
-- TOC entry 4997 (class 0 OID 82276)
-- Dependencies: 222
-- Data for Name: reservations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservations (reservation_id, guest_id, room_id, check_in_date, check_out_date, total_price, reservation_status, created_at) FROM stdin;
1	1	1	2025-04-01	2025-04-05	400.00	Confirmed	2025-04-03 22:35:30.43794
2	2	2	2025-04-02	2025-04-06	600.00	Checked-In	2025-04-03 22:35:30.43794
\.


--
-- TOC entry 5010 (class 0 OID 82371)
-- Dependencies: 235
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (review_id, guest_id, reservation_id, rating, review_text, created_at) FROM stdin;
1	1	1	5	Excellent stay!	2025-04-03 22:35:30.43794
2	2	2	4	Good experience.	2025-04-03 22:35:30.43794
\.


--
-- TOC entry 4993 (class 0 OID 82256)
-- Dependencies: 218
-- Data for Name: room_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.room_types (room_type_id, type_name, price) FROM stdin;
1	Single Room	100.00
2	Double Room	150.00
3	Deluxe Room	200.00
\.


--
-- TOC entry 4995 (class 0 OID 82262)
-- Dependencies: 220
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rooms (room_id, room_number, room_type_id, status) FROM stdin;
1	101	1	Available
2	102	2	Unavailable
3	103	3	Maintenance
\.


--
-- TOC entry 5006 (class 0 OID 82347)
-- Dependencies: 231
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services (service_id, service_name, price) FROM stdin;
1	Room Service	20.00
2	Spa	50.00
\.


--
-- TOC entry 5012 (class 0 OID 82391)
-- Dependencies: 237
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, username, password_hash, role, guest_id, employee_id) FROM stdin;
3	admin	hashed_password_1	Admin	\N	1
4	receptionist	hashed_password_2	Receptionist	\N	2
5	guest_john	hashed_password_3	Guest	1	\N
6	guest_jane	hashed_password_4	Guest	2	\N
\.


--
-- TOC entry 5026 (class 0 OID 0)
-- Dependencies: 244
-- Name: applied_discounts_applied_discount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.applied_discounts_applied_discount_id_seq', 1, true);


--
-- TOC entry 5027 (class 0 OID 0)
-- Dependencies: 240
-- Name: cancellations_cancellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cancellations_cancellation_id_seq', 1, true);


--
-- TOC entry 5028 (class 0 OID 0)
-- Dependencies: 227
-- Name: departments_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departments_department_id_seq', 2, true);


--
-- TOC entry 5029 (class 0 OID 0)
-- Dependencies: 242
-- Name: discounts_discount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.discounts_discount_id_seq', 1, true);


--
-- TOC entry 5030 (class 0 OID 0)
-- Dependencies: 225
-- Name: employees_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employees_employee_id_seq', 2, true);


--
-- TOC entry 5031 (class 0 OID 0)
-- Dependencies: 232
-- Name: guest_services_guest_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.guest_services_guest_service_id_seq', 2, true);


--
-- TOC entry 5032 (class 0 OID 0)
-- Dependencies: 215
-- Name: guests_guest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.guests_guest_id_seq', 2, true);


--
-- TOC entry 5033 (class 0 OID 0)
-- Dependencies: 238
-- Name: housekeeping_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.housekeeping_task_id_seq', 1, true);


--
-- TOC entry 5034 (class 0 OID 0)
-- Dependencies: 223
-- Name: payments_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_payment_id_seq', 2, true);


--
-- TOC entry 5035 (class 0 OID 0)
-- Dependencies: 221
-- Name: reservations_reservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservations_reservation_id_seq', 2, true);


--
-- TOC entry 5036 (class 0 OID 0)
-- Dependencies: 234
-- Name: reviews_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_review_id_seq', 2, true);


--
-- TOC entry 5037 (class 0 OID 0)
-- Dependencies: 217
-- Name: room_types_room_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.room_types_room_type_id_seq', 3, true);


--
-- TOC entry 5038 (class 0 OID 0)
-- Dependencies: 219
-- Name: rooms_room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_room_id_seq', 3, true);


--
-- TOC entry 5039 (class 0 OID 0)
-- Dependencies: 230
-- Name: services_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.services_service_id_seq', 2, true);


--
-- TOC entry 5040 (class 0 OID 0)
-- Dependencies: 236
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 6, true);


--
-- TOC entry 4828 (class 2606 OID 82448)
-- Name: applied_discounts applied_discounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applied_discounts
    ADD CONSTRAINT applied_discounts_pkey PRIMARY KEY (applied_discount_id);


--
-- TOC entry 4822 (class 2606 OID 82428)
-- Name: cancellations cancellations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cancellations
    ADD CONSTRAINT cancellations_pkey PRIMARY KEY (cancellation_id);


--
-- TOC entry 4806 (class 2606 OID 82325)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (department_id);


--
-- TOC entry 4824 (class 2606 OID 82442)
-- Name: discounts discounts_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discounts
    ADD CONSTRAINT discounts_code_key UNIQUE (code);


--
-- TOC entry 4826 (class 2606 OID 82440)
-- Name: discounts discounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discounts
    ADD CONSTRAINT discounts_pkey PRIMARY KEY (discount_id);


--
-- TOC entry 4808 (class 2606 OID 82335)
-- Name: employee_departments employee_departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_departments
    ADD CONSTRAINT employee_departments_pkey PRIMARY KEY (employee_id, department_id);


--
-- TOC entry 4800 (class 2606 OID 82317)
-- Name: employees employees_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key UNIQUE (email);


--
-- TOC entry 4802 (class 2606 OID 82319)
-- Name: employees employees_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_phone_key UNIQUE (phone);


--
-- TOC entry 4804 (class 2606 OID 82315)
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);


--
-- TOC entry 4812 (class 2606 OID 82359)
-- Name: guest_services guest_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guest_services
    ADD CONSTRAINT guest_services_pkey PRIMARY KEY (guest_service_id);


--
-- TOC entry 4782 (class 2606 OID 82254)
-- Name: guests guests_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guests
    ADD CONSTRAINT guests_email_key UNIQUE (email);


--
-- TOC entry 4784 (class 2606 OID 82250)
-- Name: guests guests_government_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guests
    ADD CONSTRAINT guests_government_id_key UNIQUE (government_id);


--
-- TOC entry 4786 (class 2606 OID 82252)
-- Name: guests guests_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guests
    ADD CONSTRAINT guests_phone_key UNIQUE (phone);


--
-- TOC entry 4788 (class 2606 OID 82248)
-- Name: guests guests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guests
    ADD CONSTRAINT guests_pkey PRIMARY KEY (guest_id);


--
-- TOC entry 4820 (class 2606 OID 82409)
-- Name: housekeeping housekeeping_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.housekeeping
    ADD CONSTRAINT housekeeping_pkey PRIMARY KEY (task_id);


--
-- TOC entry 4798 (class 2606 OID 82301)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (payment_id);


--
-- TOC entry 4796 (class 2606 OID 82282)
-- Name: reservations reservations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_pkey PRIMARY KEY (reservation_id);


--
-- TOC entry 4814 (class 2606 OID 82379)
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (review_id);


--
-- TOC entry 4790 (class 2606 OID 82260)
-- Name: room_types room_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room_types
    ADD CONSTRAINT room_types_pkey PRIMARY KEY (room_type_id);


--
-- TOC entry 4792 (class 2606 OID 82267)
-- Name: rooms rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (room_id);


--
-- TOC entry 4794 (class 2606 OID 82269)
-- Name: rooms rooms_room_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_room_number_key UNIQUE (room_number);


--
-- TOC entry 4810 (class 2606 OID 82351)
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (service_id);


--
-- TOC entry 4816 (class 2606 OID 82398)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 4818 (class 2606 OID 82400)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 4845 (class 2606 OID 82454)
-- Name: applied_discounts applied_discounts_discount_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applied_discounts
    ADD CONSTRAINT applied_discounts_discount_id_fkey FOREIGN KEY (discount_id) REFERENCES public.discounts(discount_id);


--
-- TOC entry 4846 (class 2606 OID 82449)
-- Name: applied_discounts applied_discounts_reservation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applied_discounts
    ADD CONSTRAINT applied_discounts_reservation_id_fkey FOREIGN KEY (reservation_id) REFERENCES public.reservations(reservation_id);


--
-- TOC entry 4844 (class 2606 OID 82429)
-- Name: cancellations cancellations_reservation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cancellations
    ADD CONSTRAINT cancellations_reservation_id_fkey FOREIGN KEY (reservation_id) REFERENCES public.reservations(reservation_id);


--
-- TOC entry 4833 (class 2606 OID 82326)
-- Name: departments departments_manager_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_manager_id_fkey FOREIGN KEY (manager_id) REFERENCES public.employees(employee_id);


--
-- TOC entry 4834 (class 2606 OID 82341)
-- Name: employee_departments employee_departments_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_departments
    ADD CONSTRAINT employee_departments_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(department_id);


--
-- TOC entry 4835 (class 2606 OID 82336)
-- Name: employee_departments employee_departments_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_departments
    ADD CONSTRAINT employee_departments_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employees(employee_id);


--
-- TOC entry 4836 (class 2606 OID 82360)
-- Name: guest_services guest_services_reservation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guest_services
    ADD CONSTRAINT guest_services_reservation_id_fkey FOREIGN KEY (reservation_id) REFERENCES public.reservations(reservation_id);


--
-- TOC entry 4837 (class 2606 OID 82365)
-- Name: guest_services guest_services_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guest_services
    ADD CONSTRAINT guest_services_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.services(service_id);


--
-- TOC entry 4842 (class 2606 OID 82410)
-- Name: housekeeping housekeeping_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.housekeeping
    ADD CONSTRAINT housekeeping_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employees(employee_id);


--
-- TOC entry 4843 (class 2606 OID 82415)
-- Name: housekeeping housekeeping_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.housekeeping
    ADD CONSTRAINT housekeeping_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(room_id);


--
-- TOC entry 4832 (class 2606 OID 82302)
-- Name: payments payments_reservation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_reservation_id_fkey FOREIGN KEY (reservation_id) REFERENCES public.reservations(reservation_id);


--
-- TOC entry 4830 (class 2606 OID 82283)
-- Name: reservations reservations_guest_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_guest_id_fkey FOREIGN KEY (guest_id) REFERENCES public.guests(guest_id);


--
-- TOC entry 4831 (class 2606 OID 82288)
-- Name: reservations reservations_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(room_id);


--
-- TOC entry 4838 (class 2606 OID 82380)
-- Name: reviews reviews_guest_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_guest_id_fkey FOREIGN KEY (guest_id) REFERENCES public.guests(guest_id);


--
-- TOC entry 4839 (class 2606 OID 82385)
-- Name: reviews reviews_reservation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_reservation_id_fkey FOREIGN KEY (reservation_id) REFERENCES public.reservations(reservation_id);


--
-- TOC entry 4829 (class 2606 OID 82270)
-- Name: rooms rooms_room_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_room_type_id_fkey FOREIGN KEY (room_type_id) REFERENCES public.room_types(room_type_id);


--
-- TOC entry 4840 (class 2606 OID 82476)
-- Name: users users_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employees(employee_id);


--
-- TOC entry 4841 (class 2606 OID 82471)
-- Name: users users_guest_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_guest_id_fkey FOREIGN KEY (guest_id) REFERENCES public.guests(guest_id);


-- Completed on 2025-04-04 12:43:25

--
-- PostgreSQL database dump complete
--

