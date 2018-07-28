--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 9.6.6

-- Started on 2018-07-28 18:48:47 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12429)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2367 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 192 (class 1259 OID 79600)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 79598)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO postgres;

--
-- TOC entry 2368 (class 0 OID 0)
-- Dependencies: 191
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- TOC entry 194 (class 1259 OID 79610)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 79608)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 2369 (class 0 OID 0)
-- Dependencies: 193
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- TOC entry 190 (class 1259 OID 79592)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 79590)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO postgres;

--
-- TOC entry 2370 (class 0 OID 0)
-- Dependencies: 189
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- TOC entry 196 (class 1259 OID 79618)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 79628)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 79626)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO postgres;

--
-- TOC entry 2371 (class 0 OID 0)
-- Dependencies: 197
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- TOC entry 195 (class 1259 OID 79616)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO postgres;

--
-- TOC entry 2372 (class 0 OID 0)
-- Dependencies: 195
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- TOC entry 200 (class 1259 OID 79636)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 79634)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 2373 (class 0 OID 0)
-- Dependencies: 199
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- TOC entry 204 (class 1259 OID 79726)
-- Name: core_city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE core_city (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    active boolean NOT NULL,
    name character varying(120) NOT NULL,
    country_id bigint NOT NULL
);


ALTER TABLE core_city OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 79724)
-- Name: core_city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE core_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_city_id_seq OWNER TO postgres;

--
-- TOC entry 2374 (class 0 OID 0)
-- Dependencies: 203
-- Name: core_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE core_city_id_seq OWNED BY core_city.id;


--
-- TOC entry 206 (class 1259 OID 79734)
-- Name: core_country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE core_country (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    active boolean NOT NULL,
    name character varying(120) NOT NULL
);


ALTER TABLE core_country OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 79732)
-- Name: core_country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE core_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_country_id_seq OWNER TO postgres;

--
-- TOC entry 2375 (class 0 OID 0)
-- Dependencies: 205
-- Name: core_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE core_country_id_seq OWNED BY core_country.id;


--
-- TOC entry 208 (class 1259 OID 79744)
-- Name: core_shipment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE core_shipment (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    active boolean NOT NULL,
    object_number character varying(12) NOT NULL,
    actual_location_id bigint NOT NULL,
    next_location_id bigint NOT NULL,
    status_id bigint NOT NULL
);


ALTER TABLE core_shipment OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 79742)
-- Name: core_shipment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE core_shipment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_shipment_id_seq OWNER TO postgres;

--
-- TOC entry 2376 (class 0 OID 0)
-- Dependencies: 207
-- Name: core_shipment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE core_shipment_id_seq OWNED BY core_shipment.id;


--
-- TOC entry 210 (class 1259 OID 79754)
-- Name: core_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE core_status (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    active boolean NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE core_status OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 79752)
-- Name: core_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE core_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_status_id_seq OWNER TO postgres;

--
-- TOC entry 2377 (class 0 OID 0)
-- Dependencies: 209
-- Name: core_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE core_status_id_seq OWNED BY core_status.id;


--
-- TOC entry 202 (class 1259 OID 79696)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 79694)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO postgres;

--
-- TOC entry 2378 (class 0 OID 0)
-- Dependencies: 201
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- TOC entry 188 (class 1259 OID 79582)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 79580)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO postgres;

--
-- TOC entry 2379 (class 0 OID 0)
-- Dependencies: 187
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- TOC entry 186 (class 1259 OID 79571)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 79569)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 2380 (class 0 OID 0)
-- Dependencies: 185
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- TOC entry 211 (class 1259 OID 79790)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO postgres;

--
-- TOC entry 2124 (class 2604 OID 79603)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- TOC entry 2125 (class 2604 OID 79613)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2123 (class 2604 OID 79595)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- TOC entry 2126 (class 2604 OID 79621)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- TOC entry 2127 (class 2604 OID 79631)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- TOC entry 2128 (class 2604 OID 79639)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2131 (class 2604 OID 79729)
-- Name: core_city id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_city ALTER COLUMN id SET DEFAULT nextval('core_city_id_seq'::regclass);


--
-- TOC entry 2132 (class 2604 OID 79737)
-- Name: core_country id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_country ALTER COLUMN id SET DEFAULT nextval('core_country_id_seq'::regclass);


--
-- TOC entry 2133 (class 2604 OID 79747)
-- Name: core_shipment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_shipment ALTER COLUMN id SET DEFAULT nextval('core_shipment_id_seq'::regclass);


--
-- TOC entry 2134 (class 2604 OID 79757)
-- Name: core_status id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_status ALTER COLUMN id SET DEFAULT nextval('core_status_id_seq'::regclass);


--
-- TOC entry 2129 (class 2604 OID 79699)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- TOC entry 2122 (class 2604 OID 79585)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- TOC entry 2121 (class 2604 OID 79574)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- TOC entry 2341 (class 0 OID 79600)
-- Dependencies: 192
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 2381 (class 0 OID 0)
-- Dependencies: 191
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- TOC entry 2343 (class 0 OID 79610)
-- Dependencies: 194
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 2382 (class 0 OID 0)
-- Dependencies: 193
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 2339 (class 0 OID 79592)
-- Dependencies: 190
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add City	1	add_city
2	Can change City	1	change_city
3	Can delete City	1	delete_city
4	Can add Country	2	add_country
5	Can change Country	2	change_country
6	Can delete Country	2	delete_country
7	Can add Shipment	3	add_shipment
8	Can change Shipment	3	change_shipment
9	Can delete Shipment	3	delete_shipment
10	Can add Status	4	add_status
11	Can change Status	4	change_status
12	Can delete Status	4	delete_status
13	Can add log entry	5	add_logentry
14	Can change log entry	5	change_logentry
15	Can delete log entry	5	delete_logentry
16	Can add permission	6	add_permission
17	Can change permission	6	change_permission
18	Can delete permission	6	delete_permission
19	Can add group	7	add_group
20	Can change group	7	change_group
21	Can delete group	7	delete_group
22	Can add user	8	add_user
23	Can change user	8	change_user
24	Can delete user	8	delete_user
25	Can add content type	9	add_contenttype
26	Can change content type	9	change_contenttype
27	Can delete content type	9	delete_contenttype
28	Can add session	10	add_session
29	Can change session	10	change_session
30	Can delete session	10	delete_session
\.


--
-- TOC entry 2383 (class 0 OID 0)
-- Dependencies: 189
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 30, true);


--
-- TOC entry 2345 (class 0 OID 79618)
-- Dependencies: 196
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$100000$2EslwS0W7UJJ$l73Yd2qkzp8t9KumTRb4GexHoHS2uSMiFQzwJxTeCMk=	\N	t	diemesleno			diemesleno@gmail.com	t	t	2018-07-28 15:54:45.401425-03
\.


--
-- TOC entry 2347 (class 0 OID 79628)
-- Dependencies: 198
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 2384 (class 0 OID 0)
-- Dependencies: 197
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- TOC entry 2385 (class 0 OID 0)
-- Dependencies: 195
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- TOC entry 2349 (class 0 OID 79636)
-- Dependencies: 200
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 2386 (class 0 OID 0)
-- Dependencies: 199
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 2353 (class 0 OID 79726)
-- Dependencies: 204
-- Data for Name: core_city; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY core_city (id, created, updated, active, name, country_id) FROM stdin;
1	2018-07-28 16:00:08.102066-03	2018-07-28 16:00:08.102085-03	t	São Paulo	1
2	2018-07-28 16:00:20.571036-03	2018-07-28 16:00:20.571054-03	t	Rio de Janeiro	1
3	2018-07-28 16:00:32.066869-03	2018-07-28 16:00:32.066895-03	t	Tallin	2
4	2018-07-28 16:00:40.590005-03	2018-07-28 16:00:40.590026-03	t	Tartu	2
5	2018-07-28 16:00:49.003187-03	2018-07-28 16:00:49.003214-03	t	Berlin	3
6	2018-07-28 16:00:57.046756-03	2018-07-28 16:00:57.04678-03	t	Frankfurt	3
\.


--
-- TOC entry 2387 (class 0 OID 0)
-- Dependencies: 203
-- Name: core_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('core_city_id_seq', 7, true);


--
-- TOC entry 2355 (class 0 OID 79734)
-- Dependencies: 206
-- Data for Name: core_country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY core_country (id, created, updated, active, name) FROM stdin;
1	2018-07-28 15:58:21.216034-03	2018-07-28 15:58:21.216066-03	t	Brazil
2	2018-07-28 15:58:28.408376-03	2018-07-28 15:58:28.408403-03	t	Estonia
3	2018-07-28 15:58:35.652993-03	2018-07-28 16:16:38.82238-03	t	Alemanha
\.


--
-- TOC entry 2388 (class 0 OID 0)
-- Dependencies: 205
-- Name: core_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('core_country_id_seq', 4, true);


--
-- TOC entry 2357 (class 0 OID 79744)
-- Dependencies: 208
-- Data for Name: core_shipment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY core_shipment (id, created, updated, active, object_number, actual_location_id, next_location_id, status_id) FROM stdin;
1	2018-07-28 16:03:03.719088-03	2018-07-28 16:03:03.719106-03	t	123456789012	1	5	1
\.


--
-- TOC entry 2389 (class 0 OID 0)
-- Dependencies: 207
-- Name: core_shipment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('core_shipment_id_seq', 2, true);


--
-- TOC entry 2359 (class 0 OID 79754)
-- Dependencies: 210
-- Data for Name: core_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY core_status (id, created, updated, active, name) FROM stdin;
1	2018-07-28 15:56:07.152089-03	2018-07-28 15:56:07.152123-03	t	In Transit
2	2018-07-28 15:56:16.38108-03	2018-07-28 15:56:16.381099-03	t	Delivered
\.


--
-- TOC entry 2390 (class 0 OID 0)
-- Dependencies: 209
-- Name: core_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('core_status_id_seq', 3, true);


--
-- TOC entry 2351 (class 0 OID 79696)
-- Dependencies: 202
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- TOC entry 2391 (class 0 OID 0)
-- Dependencies: 201
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- TOC entry 2337 (class 0 OID 79582)
-- Dependencies: 188
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	core	city
2	core	country
3	core	shipment
4	core	status
5	admin	logentry
6	auth	permission
7	auth	group
8	auth	user
9	contenttypes	contenttype
10	sessions	session
\.


--
-- TOC entry 2392 (class 0 OID 0)
-- Dependencies: 187
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 10, true);


--
-- TOC entry 2335 (class 0 OID 79571)
-- Dependencies: 186
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-07-28 15:54:29.618178-03
2	auth	0001_initial	2018-07-28 15:54:29.681225-03
3	admin	0001_initial	2018-07-28 15:54:29.703928-03
4	admin	0002_logentry_remove_auto_add	2018-07-28 15:54:29.714805-03
5	contenttypes	0002_remove_content_type_name	2018-07-28 15:54:29.736535-03
6	auth	0002_alter_permission_name_max_length	2018-07-28 15:54:29.744398-03
7	auth	0003_alter_user_email_max_length	2018-07-28 15:54:29.755152-03
8	auth	0004_alter_user_username_opts	2018-07-28 15:54:29.762526-03
9	auth	0005_alter_user_last_login_null	2018-07-28 15:54:29.772584-03
10	auth	0006_require_contenttypes_0002	2018-07-28 15:54:29.775052-03
11	auth	0007_alter_validators_add_error_messages	2018-07-28 15:54:29.782363-03
12	auth	0008_alter_user_username_max_length	2018-07-28 15:54:29.793633-03
13	auth	0009_alter_user_last_name_max_length	2018-07-28 15:54:29.802697-03
14	core	0001_initial	2018-07-28 15:54:29.853351-03
15	sessions	0001_initial	2018-07-28 15:54:29.864409-03
\.


--
-- TOC entry 2393 (class 0 OID 0)
-- Dependencies: 185
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 15, true);


--
-- TOC entry 2360 (class 0 OID 79790)
-- Dependencies: 211
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- TOC entry 2148 (class 2606 OID 79607)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2153 (class 2606 OID 79662)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2156 (class 2606 OID 79615)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2150 (class 2606 OID 79605)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2143 (class 2606 OID 79648)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2145 (class 2606 OID 79597)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2164 (class 2606 OID 79633)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2167 (class 2606 OID 79677)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 2158 (class 2606 OID 79623)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2170 (class 2606 OID 79641)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2173 (class 2606 OID 79691)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 2161 (class 2606 OID 79719)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 2180 (class 2606 OID 79731)
-- Name: core_city core_city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_city
    ADD CONSTRAINT core_city_pkey PRIMARY KEY (id);


--
-- TOC entry 2183 (class 2606 OID 79741)
-- Name: core_country core_country_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_country
    ADD CONSTRAINT core_country_name_key UNIQUE (name);


--
-- TOC entry 2185 (class 2606 OID 79739)
-- Name: core_country core_country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_country
    ADD CONSTRAINT core_country_pkey PRIMARY KEY (id);


--
-- TOC entry 2191 (class 2606 OID 79751)
-- Name: core_shipment core_shipment_object_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_shipment
    ADD CONSTRAINT core_shipment_object_number_key UNIQUE (object_number);


--
-- TOC entry 2193 (class 2606 OID 79749)
-- Name: core_shipment core_shipment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_shipment
    ADD CONSTRAINT core_shipment_pkey PRIMARY KEY (id);


--
-- TOC entry 2197 (class 2606 OID 79761)
-- Name: core_status core_status_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_status
    ADD CONSTRAINT core_status_name_key UNIQUE (name);


--
-- TOC entry 2199 (class 2606 OID 79759)
-- Name: core_status core_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_status
    ADD CONSTRAINT core_status_pkey PRIMARY KEY (id);


--
-- TOC entry 2176 (class 2606 OID 79705)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2138 (class 2606 OID 79589)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2140 (class 2606 OID 79587)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2136 (class 2606 OID 79579)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2202 (class 2606 OID 79797)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2146 (class 1259 OID 79650)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2151 (class 1259 OID 79663)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- TOC entry 2154 (class 1259 OID 79664)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2141 (class 1259 OID 79649)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- TOC entry 2162 (class 1259 OID 79679)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON auth_user_groups USING btree (group_id);


--
-- TOC entry 2165 (class 1259 OID 79678)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON auth_user_groups USING btree (user_id);


--
-- TOC entry 2168 (class 1259 OID 79693)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 2171 (class 1259 OID 79692)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 2159 (class 1259 OID 79720)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 2178 (class 1259 OID 79784)
-- Name: core_city_country_id_cafe81ca; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_city_country_id_cafe81ca ON core_city USING btree (country_id);


--
-- TOC entry 2181 (class 1259 OID 79763)
-- Name: core_country_name_4c49419d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_country_name_4c49419d_like ON core_country USING btree (name varchar_pattern_ops);


--
-- TOC entry 2186 (class 1259 OID 79762)
-- Name: core_shipme_object__53fc78_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_shipme_object__53fc78_idx ON core_shipment USING btree (object_number);


--
-- TOC entry 2187 (class 1259 OID 79775)
-- Name: core_shipment_actual_location_id_5149ca06; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_shipment_actual_location_id_5149ca06 ON core_shipment USING btree (actual_location_id);


--
-- TOC entry 2188 (class 1259 OID 79776)
-- Name: core_shipment_next_location_id_c2c4d7b7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_shipment_next_location_id_c2c4d7b7 ON core_shipment USING btree (next_location_id);


--
-- TOC entry 2189 (class 1259 OID 79774)
-- Name: core_shipment_object_number_5ed9ff6f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_shipment_object_number_5ed9ff6f_like ON core_shipment USING btree (object_number varchar_pattern_ops);


--
-- TOC entry 2194 (class 1259 OID 79778)
-- Name: core_shipment_status_id_85391aa9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_shipment_status_id_85391aa9 ON core_shipment USING btree (status_id);


--
-- TOC entry 2195 (class 1259 OID 79777)
-- Name: core_status_name_135473eb_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_status_name_135473eb_like ON core_status USING btree (name varchar_pattern_ops);


--
-- TOC entry 2174 (class 1259 OID 79716)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- TOC entry 2177 (class 1259 OID 79717)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- TOC entry 2200 (class 1259 OID 79799)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- TOC entry 2203 (class 1259 OID 79798)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2206 (class 2606 OID 79656)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2205 (class 2606 OID 79651)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2204 (class 2606 OID 79642)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2208 (class 2606 OID 79671)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2207 (class 2606 OID 79666)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2210 (class 2606 OID 79685)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2209 (class 2606 OID 79680)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2213 (class 2606 OID 79785)
-- Name: core_city core_city_country_id_cafe81ca_fk_core_country_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_city
    ADD CONSTRAINT core_city_country_id_cafe81ca_fk_core_country_id FOREIGN KEY (country_id) REFERENCES core_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2214 (class 2606 OID 79764)
-- Name: core_shipment core_shipment_actual_location_id_5149ca06_fk_core_city_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_shipment
    ADD CONSTRAINT core_shipment_actual_location_id_5149ca06_fk_core_city_id FOREIGN KEY (actual_location_id) REFERENCES core_city(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2215 (class 2606 OID 79769)
-- Name: core_shipment core_shipment_next_location_id_c2c4d7b7_fk_core_city_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_shipment
    ADD CONSTRAINT core_shipment_next_location_id_c2c4d7b7_fk_core_city_id FOREIGN KEY (next_location_id) REFERENCES core_city(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2216 (class 2606 OID 79779)
-- Name: core_shipment core_shipment_status_id_85391aa9_fk_core_status_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_shipment
    ADD CONSTRAINT core_shipment_status_id_85391aa9_fk_core_status_id FOREIGN KEY (status_id) REFERENCES core_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2211 (class 2606 OID 79706)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2212 (class 2606 OID 79711)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2018-07-28 18:48:48 -03

--
-- PostgreSQL database dump complete
--

