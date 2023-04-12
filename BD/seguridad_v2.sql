--
-- PostgreSQL database dump
--

-- Dumped from database version 10.15 (Debian 10.15-1.pgdg90+1)
-- Dumped by pg_dump version 13.7 (Debian 13.7-0+deb11u1)

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
-- Name: seguridad_v2; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA seguridad_v2;


ALTER SCHEMA seguridad_v2 OWNER TO postgres;

SET default_tablespace = '';

--
-- Name: areas; Type: TABLE; Schema: seguridad_v2; Owner: postgres
--

CREATE TABLE seguridad_v2.areas (
    id_area bigint NOT NULL,
    id_oficina bigint NOT NULL,
    cod_oficina character varying(3) NOT NULL,
    nombre character varying(30) NOT NULL,
    descripcion character varying(255),
    estado_registro integer DEFAULT 1,
    usuario_reg character varying(30) DEFAULT "current_user"() NOT NULL,
    fecha_reg timestamp without time zone DEFAULT now() NOT NULL,
    host_reg character varying(20) DEFAULT inet_client_addr() NOT NULL,
    usuario_mod character varying(30),
    fecha_mod timestamp without time zone,
    host_mod character varying(20)
);


ALTER TABLE seguridad_v2.areas OWNER TO postgres;

--
-- Name: areas_id_area_seq; Type: SEQUENCE; Schema: seguridad_v2; Owner: postgres
--

CREATE SEQUENCE seguridad_v2.areas_id_area_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seguridad_v2.areas_id_area_seq OWNER TO postgres;

--
-- Name: areas_id_area_seq; Type: SEQUENCE OWNED BY; Schema: seguridad_v2; Owner: postgres
--

ALTER SEQUENCE seguridad_v2.areas_id_area_seq OWNED BY seguridad_v2.areas.id_area;


--
-- Name: departamento; Type: TABLE; Schema: seguridad_v2; Owner: postgres
--

CREATE TABLE seguridad_v2.departamento (
    id_departamento bigint NOT NULL,
    cod_departamento character varying(3) NOT NULL,
    nombre character varying(30) NOT NULL,
    descripcion character varying(255),
    estado_registro integer DEFAULT 1,
    usuario_reg character varying(30) DEFAULT "current_user"() NOT NULL,
    fecha_reg timestamp without time zone DEFAULT now() NOT NULL,
    host_reg character varying(20) DEFAULT inet_client_addr() NOT NULL,
    usuario_mod character varying(30),
    fecha_mod timestamp without time zone,
    host_mod character varying(20)
);


ALTER TABLE seguridad_v2.departamento OWNER TO postgres;

--
-- Name: departamento_id_departamento_seq; Type: SEQUENCE; Schema: seguridad_v2; Owner: postgres
--

CREATE SEQUENCE seguridad_v2.departamento_id_departamento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seguridad_v2.departamento_id_departamento_seq OWNER TO postgres;

--
-- Name: departamento_id_departamento_seq; Type: SEQUENCE OWNED BY; Schema: seguridad_v2; Owner: postgres
--

ALTER SEQUENCE seguridad_v2.departamento_id_departamento_seq OWNED BY seguridad_v2.departamento.id_departamento;


--
-- Name: entidad; Type: TABLE; Schema: seguridad_v2; Owner: postgres
--

CREATE TABLE seguridad_v2.entidad (
    id_entidad bigint NOT NULL,
    nombre character varying(30),
    descripcion character varying(255),
    estado_registro integer DEFAULT 1,
    usuario_reg character varying(30) DEFAULT "current_user"() NOT NULL,
    fecha_reg timestamp without time zone DEFAULT now() NOT NULL,
    host_reg character varying(20) DEFAULT inet_client_addr() NOT NULL,
    usuario_mod character varying(30),
    fecha_mod timestamp without time zone,
    host_mod character varying(20)
);


ALTER TABLE seguridad_v2.entidad OWNER TO postgres;

--
-- Name: entidad_id_entidad_seq; Type: SEQUENCE; Schema: seguridad_v2; Owner: postgres
--

CREATE SEQUENCE seguridad_v2.entidad_id_entidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seguridad_v2.entidad_id_entidad_seq OWNER TO postgres;

--
-- Name: entidad_id_entidad_seq; Type: SEQUENCE OWNED BY; Schema: seguridad_v2; Owner: postgres
--

ALTER SEQUENCE seguridad_v2.entidad_id_entidad_seq OWNED BY seguridad_v2.entidad.id_entidad;


--
-- Name: menu; Type: TABLE; Schema: seguridad_v2; Owner: postgres
--

CREATE TABLE seguridad_v2.menu (
    id_menu bigint NOT NULL,
    nombre character varying(225),
    url character varying(250) NOT NULL,
    icon character varying(30),
    id_modulo bigint NOT NULL,
    estado_registro integer DEFAULT 1,
    usuario_reg character varying(30) DEFAULT "current_user"() NOT NULL,
    fecha_reg timestamp without time zone DEFAULT now() NOT NULL,
    host_reg character varying(20) DEFAULT inet_client_addr() NOT NULL,
    usuario_mod character varying(30),
    fecha_mod timestamp without time zone,
    host_mod character varying(20)
);


ALTER TABLE seguridad_v2.menu OWNER TO postgres;

--
-- Name: menu_id_menu_seq; Type: SEQUENCE; Schema: seguridad_v2; Owner: postgres
--

CREATE SEQUENCE seguridad_v2.menu_id_menu_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seguridad_v2.menu_id_menu_seq OWNER TO postgres;

--
-- Name: menu_id_menu_seq; Type: SEQUENCE OWNED BY; Schema: seguridad_v2; Owner: postgres
--

ALTER SEQUENCE seguridad_v2.menu_id_menu_seq OWNED BY seguridad_v2.menu.id_menu;


--
-- Name: menu_id_modulo_seq; Type: SEQUENCE; Schema: seguridad_v2; Owner: postgres
--

CREATE SEQUENCE seguridad_v2.menu_id_modulo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seguridad_v2.menu_id_modulo_seq OWNER TO postgres;

--
-- Name: menu_id_modulo_seq; Type: SEQUENCE OWNED BY; Schema: seguridad_v2; Owner: postgres
--

ALTER SEQUENCE seguridad_v2.menu_id_modulo_seq OWNED BY seguridad_v2.menu.id_modulo;


--
-- Name: modulos; Type: TABLE; Schema: seguridad_v2; Owner: postgres
--

CREATE TABLE seguridad_v2.modulos (
    id_modulo bigint NOT NULL,
    cod_modulo character varying(10) NOT NULL,
    nombre character varying(30) NOT NULL,
    descripcion character varying(255),
    estado_registro integer DEFAULT 1,
    usuario_reg character varying(30) DEFAULT "current_user"() NOT NULL,
    fecha_reg timestamp without time zone DEFAULT now() NOT NULL,
    host_reg character varying(20) DEFAULT inet_client_addr() NOT NULL,
    usuario_mod character varying(30),
    fecha_mod timestamp without time zone,
    host_mod character varying(20),
    id_sistema bigint
);


ALTER TABLE seguridad_v2.modulos OWNER TO postgres;

--
-- Name: modulos_id_modulo_seq; Type: SEQUENCE; Schema: seguridad_v2; Owner: postgres
--

CREATE SEQUENCE seguridad_v2.modulos_id_modulo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seguridad_v2.modulos_id_modulo_seq OWNER TO postgres;

--
-- Name: modulos_id_modulo_seq; Type: SEQUENCE OWNED BY; Schema: seguridad_v2; Owner: postgres
--

ALTER SEQUENCE seguridad_v2.modulos_id_modulo_seq OWNED BY seguridad_v2.modulos.id_modulo;


--
-- Name: oficina_areas; Type: TABLE; Schema: seguridad_v2; Owner: postgres
--

CREATE TABLE seguridad_v2.oficina_areas (
    id_oficina_area bigint NOT NULL,
    id_oficina bigint NOT NULL,
    id_area bigint NOT NULL,
    estado_registro integer DEFAULT 1,
    usuario_reg character varying(30) DEFAULT "current_user"() NOT NULL,
    fecha_reg timestamp without time zone DEFAULT now() NOT NULL,
    host_reg character varying(20) DEFAULT inet_client_addr() NOT NULL,
    usuario_mod character varying(30),
    fecha_mod timestamp without time zone,
    host_mod character varying(20)
);


ALTER TABLE seguridad_v2.oficina_areas OWNER TO postgres;

--
-- Name: oficina_areas_id_oficina_area_seq; Type: SEQUENCE; Schema: seguridad_v2; Owner: postgres
--

CREATE SEQUENCE seguridad_v2.oficina_areas_id_oficina_area_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seguridad_v2.oficina_areas_id_oficina_area_seq OWNER TO postgres;

--
-- Name: oficina_areas_id_oficina_area_seq; Type: SEQUENCE OWNED BY; Schema: seguridad_v2; Owner: postgres
--

ALTER SEQUENCE seguridad_v2.oficina_areas_id_oficina_area_seq OWNED BY seguridad_v2.oficina_areas.id_oficina_area;


--
-- Name: oficinas; Type: TABLE; Schema: seguridad_v2; Owner: postgres
--

CREATE TABLE seguridad_v2.oficinas (
    id_oficina bigint NOT NULL,
    id_departamento bigint NOT NULL,
    cod_oficina character varying(3) NOT NULL,
    nombre character varying(30) NOT NULL,
    descripcion character varying(255),
    estado_registro integer DEFAULT 1,
    usuario_reg character varying(30) DEFAULT "current_user"() NOT NULL,
    fecha_reg timestamp without time zone DEFAULT now() NOT NULL,
    host_reg character varying(20) DEFAULT inet_client_addr() NOT NULL,
    usuario_mod character varying(30),
    fecha_mod timestamp without time zone,
    host_mod character varying(20)
);


ALTER TABLE seguridad_v2.oficinas OWNER TO postgres;

--
-- Name: oficinas_id_oficina_seq; Type: SEQUENCE; Schema: seguridad_v2; Owner: postgres
--

CREATE SEQUENCE seguridad_v2.oficinas_id_oficina_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seguridad_v2.oficinas_id_oficina_seq OWNER TO postgres;

--
-- Name: oficinas_id_oficina_seq; Type: SEQUENCE OWNED BY; Schema: seguridad_v2; Owner: postgres
--

ALTER SEQUENCE seguridad_v2.oficinas_id_oficina_seq OWNED BY seguridad_v2.oficinas.id_oficina;


--
-- Name: persona; Type: TABLE; Schema: seguridad_v2; Owner: postgres
--

CREATE TABLE seguridad_v2.persona (
    id_persona bigint NOT NULL,
    nombres character varying(100) NOT NULL,
    primer_apellido character varying(50) NOT NULL,
    segundo_apellido character varying(50),
    otro_apellido character varying(50),
    fecha_nacimiento timestamp without time zone,
    tipo_documento character varying(50),
    nro_documento character varying(50),
    genero character varying(50),
    nacionalidad character varying(20),
    direccion character varying(150),
    email character varying(50),
    telefono character varying(15),
    cargo character varying(50),
    estado_registro integer DEFAULT 1 NOT NULL,
    usuario_reg character varying(30) DEFAULT "current_user"() NOT NULL,
    fecha_reg timestamp without time zone DEFAULT now() NOT NULL,
    host_reg character varying(30) DEFAULT inet_client_addr() NOT NULL,
    usuario_mod character varying(30),
    fecha_mod timestamp without time zone,
    host_mod character varying(30),
    id_entidad integer
);


ALTER TABLE seguridad_v2.persona OWNER TO postgres;

--
-- Name: persona_id_persona_seq; Type: SEQUENCE; Schema: seguridad_v2; Owner: postgres
--

CREATE SEQUENCE seguridad_v2.persona_id_persona_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seguridad_v2.persona_id_persona_seq OWNER TO postgres;

--
-- Name: persona_id_persona_seq; Type: SEQUENCE OWNED BY; Schema: seguridad_v2; Owner: postgres
--

ALTER SEQUENCE seguridad_v2.persona_id_persona_seq OWNED BY seguridad_v2.persona.id_persona;


--
-- Name: rol; Type: TABLE; Schema: seguridad_v2; Owner: postgres
--

CREATE TABLE seguridad_v2.rol (
    id_rol bigint NOT NULL,
    cod_rol character varying(50) NOT NULL,
    rol character varying(50) NOT NULL,
    descripcion character varying(225),
    estado_registro integer DEFAULT 1 NOT NULL,
    usuario_reg character varying(30) DEFAULT "current_user"() NOT NULL,
    fecha_reg timestamp without time zone DEFAULT now() NOT NULL,
    host_reg character varying(30) DEFAULT inet_client_addr() NOT NULL,
    usuario_mod character varying(30),
    fecha_mod timestamp without time zone,
    host_mod character varying(30)
);


ALTER TABLE seguridad_v2.rol OWNER TO postgres;

--
-- Name: rol_id_rol_seq; Type: SEQUENCE; Schema: seguridad_v2; Owner: postgres
--

CREATE SEQUENCE seguridad_v2.rol_id_rol_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seguridad_v2.rol_id_rol_seq OWNER TO postgres;

--
-- Name: rol_id_rol_seq; Type: SEQUENCE OWNED BY; Schema: seguridad_v2; Owner: postgres
--

ALTER SEQUENCE seguridad_v2.rol_id_rol_seq OWNED BY seguridad_v2.rol.id_rol;


--
-- Name: rol_modulos; Type: TABLE; Schema: seguridad_v2; Owner: postgres
--

CREATE TABLE seguridad_v2.rol_modulos (
    id_rol_modulo bigint NOT NULL,
    id_modulo bigint NOT NULL,
    id_rol bigint NOT NULL,
    estado_registro integer DEFAULT 1,
    usuario_reg character varying(30) DEFAULT "current_user"() NOT NULL,
    fecha_reg timestamp without time zone DEFAULT now() NOT NULL,
    host_reg character varying(20) DEFAULT inet_client_addr() NOT NULL,
    usuario_mod character varying(30),
    fecha_mod timestamp without time zone,
    host_mod character varying(20)
);


ALTER TABLE seguridad_v2.rol_modulos OWNER TO postgres;

--
-- Name: rol_modulos_id_rol_modulo_seq; Type: SEQUENCE; Schema: seguridad_v2; Owner: postgres
--

CREATE SEQUENCE seguridad_v2.rol_modulos_id_rol_modulo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seguridad_v2.rol_modulos_id_rol_modulo_seq OWNER TO postgres;

--
-- Name: rol_modulos_id_rol_modulo_seq; Type: SEQUENCE OWNED BY; Schema: seguridad_v2; Owner: postgres
--

ALTER SEQUENCE seguridad_v2.rol_modulos_id_rol_modulo_seq OWNED BY seguridad_v2.rol_modulos.id_rol_modulo;


--
-- Name: sistemas; Type: TABLE; Schema: seguridad_v2; Owner: postgres
--

CREATE TABLE seguridad_v2.sistemas (
    id_sistema bigint NOT NULL,
    cod_sistema character varying(10),
    nombre character varying(50) NOT NULL,
    descripcion character varying(225),
    estado_registro integer DEFAULT 1 NOT NULL,
    usuario_reg character varying(30) DEFAULT "current_user"() NOT NULL,
    fecha_reg timestamp without time zone DEFAULT now() NOT NULL,
    host_reg character varying(20) DEFAULT inet_client_addr() NOT NULL,
    usuario_mod character varying(30),
    fecha_mod timestamp without time zone,
    host_mod character varying(20),
    cliente character varying(20)
);


ALTER TABLE seguridad_v2.sistemas OWNER TO postgres;

--
-- Name: sistemas_id_sistema_seq; Type: SEQUENCE; Schema: seguridad_v2; Owner: postgres
--

CREATE SEQUENCE seguridad_v2.sistemas_id_sistema_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seguridad_v2.sistemas_id_sistema_seq OWNER TO postgres;

--
-- Name: sistemas_id_sistema_seq; Type: SEQUENCE OWNED BY; Schema: seguridad_v2; Owner: postgres
--

ALTER SEQUENCE seguridad_v2.sistemas_id_sistema_seq OWNED BY seguridad_v2.sistemas.id_sistema;


--
-- Name: usuario; Type: TABLE; Schema: seguridad_v2; Owner: postgres
--

CREATE TABLE seguridad_v2.usuario (
    id_usuario bigint NOT NULL,
    id_persona bigint NOT NULL,
    usuario character varying(50) NOT NULL,
    password character varying(225) NOT NULL,
    estado_registro integer DEFAULT 1,
    usuario_reg character varying(30) DEFAULT "current_user"() NOT NULL,
    fecha_reg timestamp without time zone DEFAULT now() NOT NULL,
    host_reg character varying(20) DEFAULT inet_client_addr() NOT NULL,
    usuario_mod character varying(30),
    fecha_mod timestamp without time zone,
    host_mod character varying(20),
    id_oficina bigint,
    id_entidad bigint
);


ALTER TABLE seguridad_v2.usuario OWNER TO postgres;

--
-- Name: usuario_areas; Type: TABLE; Schema: seguridad_v2; Owner: postgres
--

CREATE TABLE seguridad_v2.usuario_areas (
    id_usuario_area bigint NOT NULL,
    id_area bigint NOT NULL,
    id_usuario bigint NOT NULL,
    estado_registro integer DEFAULT 1,
    usuario_reg character varying(30) DEFAULT "current_user"() NOT NULL,
    fecha_reg timestamp without time zone DEFAULT now() NOT NULL,
    host_reg character varying(20) DEFAULT inet_client_addr() NOT NULL,
    usuario_mod character varying(30),
    fecha_mod timestamp without time zone,
    host_mod character varying(20)
);


ALTER TABLE seguridad_v2.usuario_areas OWNER TO postgres;

--
-- Name: usuario_areas_id_usuario_area_seq; Type: SEQUENCE; Schema: seguridad_v2; Owner: postgres
--

CREATE SEQUENCE seguridad_v2.usuario_areas_id_usuario_area_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seguridad_v2.usuario_areas_id_usuario_area_seq OWNER TO postgres;

--
-- Name: usuario_areas_id_usuario_area_seq; Type: SEQUENCE OWNED BY; Schema: seguridad_v2; Owner: postgres
--

ALTER SEQUENCE seguridad_v2.usuario_areas_id_usuario_area_seq OWNED BY seguridad_v2.usuario_areas.id_usuario_area;


--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: seguridad_v2; Owner: postgres
--

CREATE SEQUENCE seguridad_v2.usuario_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seguridad_v2.usuario_id_usuario_seq OWNER TO postgres;

--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: seguridad_v2; Owner: postgres
--

ALTER SEQUENCE seguridad_v2.usuario_id_usuario_seq OWNED BY seguridad_v2.usuario.id_usuario;


--
-- Name: usuario_rol; Type: TABLE; Schema: seguridad_v2; Owner: postgres
--

CREATE TABLE seguridad_v2.usuario_rol (
    id_usuario_rol bigint NOT NULL,
    id_rol bigint NOT NULL,
    id_usuario bigint NOT NULL,
    id_sistema bigint NOT NULL,
    estado_registro integer DEFAULT 1 NOT NULL,
    usuario_reg character varying(30) DEFAULT "current_user"() NOT NULL,
    fecha_reg timestamp without time zone DEFAULT now() NOT NULL,
    host_reg character varying(20) DEFAULT inet_client_addr() NOT NULL,
    usuario_mod character varying(30),
    fecha_mod timestamp without time zone,
    host_mod character varying(20)
);


ALTER TABLE seguridad_v2.usuario_rol OWNER TO postgres;

--
-- Name: usuario_rol_id_usuario_rol_seq; Type: SEQUENCE; Schema: seguridad_v2; Owner: postgres
--

CREATE SEQUENCE seguridad_v2.usuario_rol_id_usuario_rol_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seguridad_v2.usuario_rol_id_usuario_rol_seq OWNER TO postgres;

--
-- Name: usuario_rol_id_usuario_rol_seq; Type: SEQUENCE OWNED BY; Schema: seguridad_v2; Owner: postgres
--

ALTER SEQUENCE seguridad_v2.usuario_rol_id_usuario_rol_seq OWNED BY seguridad_v2.usuario_rol.id_usuario_rol;


--
-- Name: areas id_area; Type: DEFAULT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.areas ALTER COLUMN id_area SET DEFAULT nextval('seguridad_v2.areas_id_area_seq'::regclass);


--
-- Name: departamento id_departamento; Type: DEFAULT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.departamento ALTER COLUMN id_departamento SET DEFAULT nextval('seguridad_v2.departamento_id_departamento_seq'::regclass);


--
-- Name: entidad id_entidad; Type: DEFAULT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.entidad ALTER COLUMN id_entidad SET DEFAULT nextval('seguridad_v2.entidad_id_entidad_seq'::regclass);


--
-- Name: menu id_menu; Type: DEFAULT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.menu ALTER COLUMN id_menu SET DEFAULT nextval('seguridad_v2.menu_id_menu_seq'::regclass);


--
-- Name: menu id_modulo; Type: DEFAULT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.menu ALTER COLUMN id_modulo SET DEFAULT nextval('seguridad_v2.menu_id_modulo_seq'::regclass);


--
-- Name: modulos id_modulo; Type: DEFAULT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.modulos ALTER COLUMN id_modulo SET DEFAULT nextval('seguridad_v2.modulos_id_modulo_seq'::regclass);


--
-- Name: oficina_areas id_oficina_area; Type: DEFAULT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.oficina_areas ALTER COLUMN id_oficina_area SET DEFAULT nextval('seguridad_v2.oficina_areas_id_oficina_area_seq'::regclass);


--
-- Name: oficinas id_oficina; Type: DEFAULT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.oficinas ALTER COLUMN id_oficina SET DEFAULT nextval('seguridad_v2.oficinas_id_oficina_seq'::regclass);


--
-- Name: persona id_persona; Type: DEFAULT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.persona ALTER COLUMN id_persona SET DEFAULT nextval('seguridad_v2.persona_id_persona_seq'::regclass);


--
-- Name: rol id_rol; Type: DEFAULT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.rol ALTER COLUMN id_rol SET DEFAULT nextval('seguridad_v2.rol_id_rol_seq'::regclass);


--
-- Name: rol_modulos id_rol_modulo; Type: DEFAULT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.rol_modulos ALTER COLUMN id_rol_modulo SET DEFAULT nextval('seguridad_v2.rol_modulos_id_rol_modulo_seq'::regclass);


--
-- Name: sistemas id_sistema; Type: DEFAULT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.sistemas ALTER COLUMN id_sistema SET DEFAULT nextval('seguridad_v2.sistemas_id_sistema_seq'::regclass);


--
-- Name: usuario id_usuario; Type: DEFAULT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('seguridad_v2.usuario_id_usuario_seq'::regclass);


--
-- Name: usuario_areas id_usuario_area; Type: DEFAULT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.usuario_areas ALTER COLUMN id_usuario_area SET DEFAULT nextval('seguridad_v2.usuario_areas_id_usuario_area_seq'::regclass);


--
-- Name: usuario_rol id_usuario_rol; Type: DEFAULT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.usuario_rol ALTER COLUMN id_usuario_rol SET DEFAULT nextval('seguridad_v2.usuario_rol_id_usuario_rol_seq'::regclass);


--
-- Data for Name: areas; Type: TABLE DATA; Schema: seguridad_v2; Owner: postgres
--

COPY seguridad_v2.areas (id_area, id_oficina, cod_oficina, nombre, descripcion, estado_registro, usuario_reg, fecha_reg, host_reg, usuario_mod, fecha_mod, host_mod) FROM stdin;
1	1	EXT	EXTRANJERIA	\N	1	postgres	2022-07-29 14:34:08.592942	172.168.80.26/32	\N	\N	\N
2	1	INS	INSPECTORIA	\N	1	postgres	2022-07-29 14:34:08.592942	172.168.80.26/32	\N	\N	\N
3	1	FIL	FILIACION	\N	1	postgres	2022-07-29 14:36:52.623162	172.168.80.26/32	\N	\N	\N
4	1	FLU	FLUJOS	\N	1	postgres	2022-07-29 14:36:52.646181	172.168.80.26/32	\N	\N	\N
5	1	SIS	SISTEMAS	\N	1	postgres	2022-07-29 14:36:52.692101	172.168.80.26/32	\N	\N	\N
6	1	SEG	ADMINISTRATIVA	SERVICIOS GENERALES	1	postgres	2022-07-29 14:36:52.704275	172.168.80.26/32	\N	\N	\N
7	1	COM	COMUNICACION	\N	1	postgres	2022-07-29 14:36:52.716909	172.168.80.26/32	\N	\N	\N
\.


--
-- Data for Name: departamento; Type: TABLE DATA; Schema: seguridad_v2; Owner: postgres
--

COPY seguridad_v2.departamento (id_departamento, cod_departamento, nombre, descripcion, estado_registro, usuario_reg, fecha_reg, host_reg, usuario_mod, fecha_mod, host_mod) FROM stdin;
1	LP	LA PAZ	\N	1	postgres	2022-07-29 13:49:38.002801	172.168.80.26/32	\N	\N	\N
2	SC	SANTA CRUZ	\N	1	postgres	2022-07-29 13:49:38.074552	172.168.80.26/32	\N	\N	\N
3	CB	COCHAMBANBA	\N	1	postgres	2022-07-29 13:49:38.105163	172.168.80.26/32	\N	\N	\N
4	CH	CHUQUISACA	\N	1	postgres	2022-07-29 13:49:38.131042	172.168.80.26/32	\N	\N	\N
5	OR	ORURO	\N	1	postgres	2022-07-29 13:49:38.143888	172.168.80.26/32	\N	\N	\N
6	PT	POTOSI	\N	1	postgres	2022-07-29 13:49:38.164434	172.168.80.26/32	\N	\N	\N
7	BN	BENI	\N	1	postgres	2022-07-29 13:49:38.28053	172.168.80.26/32	\N	\N	\N
8	TJ	TARIJA	\N	1	postgres	2022-07-29 13:49:38.40184	172.168.80.26/32	\N	\N	\N
9	PN	PANDO	\N	1	postgres	2022-07-29 13:49:38.417879	172.168.80.26/32	\N	\N	\N
\.


--
-- Data for Name: entidad; Type: TABLE DATA; Schema: seguridad_v2; Owner: postgres
--

COPY seguridad_v2.entidad (id_entidad, nombre, descripcion, estado_registro, usuario_reg, fecha_reg, host_reg, usuario_mod, fecha_mod, host_mod) FROM stdin;
1	DIGEMIG	Dirección General de Migración	1	postgres	2022-08-08 12:49:47.50499	172.168.80.19/32	\N	\N	\N
2	CANCILLERIA	Ministerio de Relaciones Exteriores Cancillería Boliviana	1	postgres	2022-08-08 14:11:01.497634	172.168.80.19/32	\N	\N	\N
\.


--
-- Data for Name: menu; Type: TABLE DATA; Schema: seguridad_v2; Owner: postgres
--

COPY seguridad_v2.menu (id_menu, nombre, url, icon, id_modulo, estado_registro, usuario_reg, fecha_reg, host_reg, usuario_mod, fecha_mod, host_mod) FROM stdin;
\.


--
-- Data for Name: modulos; Type: TABLE DATA; Schema: seguridad_v2; Owner: postgres
--

COPY seguridad_v2.modulos (id_modulo, cod_modulo, nombre, descripcion, estado_registro, usuario_reg, fecha_reg, host_reg, usuario_mod, fecha_mod, host_mod, id_sistema) FROM stdin;
2	RSS	RESERVAS WEB	MODULO DE RESERVAS WEB	1	postgres	2022-08-02 14:13:16.886574	172.168.80.26/32	\N	\N	\N	\N
1	ALL	ALL MODULE	TODOS LOS MODULOS	1	postgres	2022-08-02 14:12:34.370718	172.168.80.26/32	\N	\N	\N	\N
3	FSS	FIRMADOR	MODULO DE SOLICITUD DE FIRMAS	1	postgres	2022-08-02 14:23:04.720839	172.168.80.26/32	\N	\N	\N	\N
\.


--
-- Data for Name: oficina_areas; Type: TABLE DATA; Schema: seguridad_v2; Owner: postgres
--

COPY seguridad_v2.oficina_areas (id_oficina_area, id_oficina, id_area, estado_registro, usuario_reg, fecha_reg, host_reg, usuario_mod, fecha_mod, host_mod) FROM stdin;
\.


--
-- Data for Name: oficinas; Type: TABLE DATA; Schema: seguridad_v2; Owner: postgres
--

COPY seguridad_v2.oficinas (id_oficina, id_departamento, cod_oficina, nombre, descripcion, estado_registro, usuario_reg, fecha_reg, host_reg, usuario_mod, fecha_mod, host_mod) FROM stdin;
1	1	LPG	DIRECCION GENERAL DE MIGRACION	OFICINA CENTRAL	1	postgres	2022-07-29 14:14:16.247508	172.168.80.26/32	\N	\N	\N
3	2	SCD	DISTRITAL DE SANTA CRUZ	OFICINA DISTRITAL	1	postgres	2022-07-29 14:14:37.878	172.168.80.26/32	\N	\N	\N
4	3	CBD	DISTRITAL COCHABAMBA	OFICINA DISTRITAL	1	postgres	2022-07-29 14:16:47.800472	172.168.80.26/32	\N	\N	\N
5	4	CHD	DISTRITAL CHUQUISACA	OFICINA DISTRITAL	1	postgres	2022-07-29 14:25:18.375302	172.168.80.26/32	\N	\N	\N
6	5	ORD	DISTRITAL ORURO	OFICINA DISTRITAL	1	postgres	2022-07-29 14:25:18.402575	172.168.80.26/32	\N	\N	\N
7	6	PTD	DISTRITAL POTOSI	OFICINA DISTRITAL	1	postgres	2022-07-29 14:25:18.411017	172.168.80.26/32	\N	\N	\N
8	7	BND	DISTRITAL BENI	OFICINA DISTRITAL	1	postgres	2022-07-29 14:25:18.418879	172.168.80.26/32	\N	\N	\N
9	8	TJD	DISTRITAL TARIJA	OFICINA DISTRITAL	1	postgres	2022-07-29 14:25:18.427446	172.168.80.26/32	\N	\N	\N
10	9	PDD	DISTRITAL PANDO	OFICINA DISTRITAL	1	postgres	2022-07-29 14:25:18.444403	172.168.80.26/32	\N	\N	\N
0	1	EXT	EXTERNO	EXTERNO	1	postgres	2022-08-15 15:05:56.477424	172.168.80.19/32	\N	\N	\N
\.


--
-- Data for Name: persona; Type: TABLE DATA; Schema: seguridad_v2; Owner: postgres
--

COPY seguridad_v2.persona (id_persona, nombres, primer_apellido, segundo_apellido, otro_apellido, fecha_nacimiento, tipo_documento, nro_documento, genero, nacionalidad, direccion, email, telefono, cargo, estado_registro, usuario_reg, fecha_reg, host_reg, usuario_mod, fecha_mod, host_mod, id_entidad) FROM stdin;
1	GILMAR	LOPEZ	RIOS		0001-01-01 00:00:00		4042187	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:24.902339	172.168.80.26/32	\N	\N	\N	\N
2	CRISTHIAN JHOEL	ARAOZ	MAGNE		0001-01-01 00:00:00		8004559	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:24.926911	172.168.80.26/32	\N	\N	\N	\N
3	DIEGO FREDDY	INGALI	ANDRADE		0001-01-01 00:00:00		6935712	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:24.943434	172.168.80.26/32	\N	\N	\N	\N
4	SAUL ABEL	CHAMBI	MAMANI		0001-01-01 00:00:00		7309362	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:24.951581	172.168.80.26/32	\N	\N	\N	\N
5	SARA XIMENA	VARGAS	POZO		2002-01-21 00:00:00		5806338	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:24.959956	172.168.80.26/32	\N	\N	\N	\N
6	HERNAN	ARELLANO	UREY		0001-01-01 00:00:00		2726270	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:24.96891	172.168.80.26/32	\N	\N	\N	\N
7	VICTOR ANTONIO	TORRES	ARGANDOÑA		\N		2139188	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:24.977226	172.168.80.26/32	\N	\N	\N	\N
8	SIXTO	QUISPE	RAMIREZ		1976-08-05 00:00:00		4011277	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:24.98545	172.168.80.26/32	\N	\N	\N	\N
9	EDGAR MARTIN	DIAZ	POMA		1984-09-27 00:00:00		6807058	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:24.99409	172.168.80.26/32	\N	\N	\N	\N
10	MARILYN	JAIME	MORENO		1976-01-16 00:00:00		4181858	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.002527	172.168.80.26/32	\N	\N	\N	\N
11	MARIA GABRIELA	AVE	JARILLO		0001-01-01 00:00:00		4198434	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.010843	172.168.80.26/32	\N	\N	\N	\N
12	HERLAND IGNACIO	GONZALES			1993-05-06 00:00:00		5870283	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.018878	172.168.80.26/32	\N	\N	\N	\N
13	KATHYA ALEJANDRA	AGUILAR 	FIORILO		1978-06-19 00:00:00		1764067	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.027179	172.168.80.26/32	\N	\N	\N	\N
14	OLIVER RICHARD	 PINTO 	MUSTAFA		0001-01-01 00:00:00		7769089	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.035477	172.168.80.26/32	\N	\N	\N	\N
15	GIMY	ESCOBAR 	SANCHEZ		\N		3516401	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.04367	172.168.80.26/32	\N	\N	\N	\N
16	MANUEL ALEJANDRO	BRAVO 	WITLEY		0001-01-01 00:00:00		7618838	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.052258	172.168.80.26/32	\N	\N	\N	\N
17	JHENNY MAGALI	SUNTURA	QUISPE		0001-01-01 00:00:00		4313211	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.060225	172.168.80.26/32	\N	\N	\N	\N
18	LILIANA	SORIA 	CUELLAR		0001-01-01 00:00:00		8871749	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.068471	172.168.80.26/32	\N	\N	\N	\N
19	ANA GABRIELA	FUENTES 	ARANDIA		0001-01-01 00:00:00		7847444	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.076719	172.168.80.26/32	\N	\N	\N	\N
20	ANDRES	ZENTENO	GONZALES		0001-01-01 00:00:00		4124356	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.085023	172.168.80.26/32	\N	\N	\N	\N
21	CARLOS UBI	TERRAZAS	CACERES		0001-01-01 00:00:00		4382483	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.093684	172.168.80.26/32	\N	\N	\N	\N
22	PAOLA MARIA	CHIPANA	NAVARRO		0001-01-01 00:00:00		6840390	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.101966	172.168.80.26/32	\N	\N	\N	\N
23	MARCIAL	QUISPE	HUANCA		1997-03-26 00:00:00		10013272	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.110274	172.168.80.26/32	\N	\N	\N	\N
24	ALVARO DENIS	CACERES	VARGAS		1995-01-03 00:00:00		7310022	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.118379	172.168.80.26/32	\N	\N	\N	\N
25	JAIRO	CERVANTES	NAVA		0001-01-01 00:00:00		8071612	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.127459	172.168.80.26/32	\N	\N	\N	\N
26	DEYBES RICHARD	CONDORI	CONDORI		1990-11-08 00:00:00		8643549	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.135157	172.168.80.26/32	\N	\N	\N	\N
27	ELMER SEDIL	ROSAS	ARANDO		1988-05-20 00:00:00		6669674	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.143488	172.168.80.26/32	\N	\N	\N	\N
28	CHRISTIAN OLIVER	ZUBIETA	RODRIGUEZ		0001-01-01 00:00:00		3611238	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.151876	172.168.80.26/32	\N	\N	\N	\N
29	JESUS FIDEL	OJEDA	ESCALANTE		1993-03-11 00:00:00		7854989	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.269023	172.168.80.26/32	\N	\N	\N	\N
30	JHILA SANDY	QUISPE	ZUÑIGA		1984-07-22 00:00:00		6303970	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.284876	172.168.80.26/32	\N	\N	\N	\N
31	GERLAND KENETT	HERBAS	MARTINEZ		\N		12	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.293509	172.168.80.26/32	\N	\N	\N	\N
32	PEPE LUIS	LOPEZ	EGUEZ		0001-01-01 00:00:00		4574046	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.301821	172.168.80.26/32	\N	\N	\N	\N
33	LUIS FERNANDO	MORALES 	SAUCEDO		1983-12-08 00:00:00		5395599	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.310073	172.168.80.26/32	\N	\N	\N	\N
34	ERICK PAUL	ENCINAS	GUTIERREZ		0001-01-01 00:00:00		6389488	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.318371	172.168.80.26/32	\N	\N	\N	\N
35	GERMAN	PARDO	CORDOVA		\N		5085318	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.326722	172.168.80.26/32	\N	\N	\N	\N
36	FREDDY	TELLEZ	CAMACHO		1989-05-17 00:00:00		7713564	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.334976	172.168.80.26/32	\N	\N	\N	\N
37	RODRIGO REINALDO	FRANCO	PANIAGUA		1987-06-18 00:00:00		6311930	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.343517	172.168.80.26/32	\N	\N	\N	\N
38	BRIGIDA VIRGINIA	QUIROGA	RAMOS		1969-10-08 00:00:00		3444072	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.351852	172.168.80.26/32	\N	\N	\N	\N
39	JOSUE	CONDORI	CORREA		1989-06-22 00:00:00		7722142	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.360205	172.168.80.26/32	\N	\N	\N	\N
40	RINAT LEONIDAS	SUEIRO 	PHILLIPS		0001-01-01 00:00:00		7583666	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.368801	172.168.80.26/32	\N	\N	\N	\N
41	YSABELA	JUSTINIANO 	SANCHEZ		1989-02-10 00:00:00		4212088	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.394009	172.168.80.26/32	\N	\N	\N	\N
42	MARIA EUGENIA	TABOADA	FLORES		1989-12-27 00:00:00		4083222	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.402318	172.168.80.26/32	\N	\N	\N	\N
43	JERRY	VARGAS			\N		3378142	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.410676	172.168.80.26/32	\N	\N	\N	\N
44	ISMAEL	PATZI 	MAMANI		1990-03-20 00:00:00		7342801	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.423282	172.168.80.26/32	\N	\N	\N	\N
45	ALEJANDRO ALBERTO	CALIZAYA	GODOY		1994-08-03 00:00:00		6478660	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.435564	172.168.80.26/32	\N	\N	\N	\N
46	ALONDRA FIORELLA	HUMEREZ	VIDAL		1997-11-07 00:00:00		4206465	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.443859	172.168.80.26/32	\N	\N	\N	\N
47	MICHAEL RAUL	SOTO	ANCIETA		1989-09-03 00:00:00		8778937	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.452164	172.168.80.26/32	\N	\N	\N	\N
48	FABIO EMILIO	ARATA	URQUIZU		0001-01-01 00:00:00		1092221	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.460283	172.168.80.26/32	\N	\N	\N	\N
49	JIANFRANCO 	MENDEZ			1985-10-23 00:00:00		6431922	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.46858	172.168.80.26/32	\N	\N	\N	\N
50	JOSE MAURICIO	RAMIREZ	AYALA		0001-01-01 00:00:00		4708128	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.477192	172.168.80.26/32	\N	\N	\N	\N
51	ALI	PEREDO	ZABALA		0001-01-01 00:00:00		5760834	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.485259	172.168.80.26/32	\N	\N	\N	\N
52	ANDREA	MIRANDA	SOSA		0001-01-01 00:00:00		7636138	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.493949	172.168.80.26/32	\N	\N	\N	\N
53	ANDREA	PANDO	BOZO		0001-01-01 00:00:00		6122604	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.510648	172.168.80.26/32	\N	\N	\N	\N
54	JUAN CARLOS	OLGUIN	THENIER		1981-03-08 00:00:00		5542706	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.51881	172.168.80.26/32	\N	\N	\N	\N
55	VALERIA	PATRICIA	AGUIRRE		1982-06-19 00:00:00		5033698	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.527252	172.168.80.26/32	\N	\N	\N	\N
56	GRACIELA	SERRUDO	QUISPE		0001-01-01 00:00:00		5666326	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.535284	172.168.80.26/32	\N	\N	\N	\N
57	RONALD ERICK	BECERRA	VILLARROEL		1992-06-02 00:00:00		8976874	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.543709	172.168.80.26/32	\N	\N	\N	\N
58	FRANCISCO XAVIER	BELLOT	ARREDONDO		1991-11-24 00:00:00		8997813	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.552075	172.168.80.26/32	\N	\N	\N	\N
59	MARIO PLACIDO	ROCA	CALVO		0001-01-01 00:00:00		5333985	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.560652	172.168.80.26/32	\N	\N	\N	\N
60	JESUS ANGEL	ZEBALLOS	PAREDES		1997-07-31 00:00:00		13704134	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.568702	172.168.80.26/32	\N	\N	\N	\N
61	JHONNY RENE	LEAÑO	ALANIS		0001-01-01 00:00:00		3690780	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.577136	172.168.80.26/32	\N	\N	\N	\N
62	ABIGAIL SARA	HUANCA	ARUQUIPA		1997-01-02 00:00:00		12830482	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.585372	172.168.80.26/32	\N	\N	\N	\N
63	SABRINA ANDREA	MEDINACELI	HINOJOSA		0001-01-01 00:00:00		5402524	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.593819	172.168.80.26/32	\N	\N	\N	\N
64	PABLO EDUARDO	CLAROS	CRUZ		\N		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.602292	172.168.80.26/32	\N	\N	\N	\N
65	JOSE FERNANDO	PEREDO	CESPEDES		\N		12	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.610562	172.168.80.26/32	\N	\N	\N	\N
66	LORENZO JUSTINO	HUARACHI	MAMANI		0001-01-01 00:00:00		1412594	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.618913	172.168.80.26/32	\N	\N	\N	\N
67	PEDRO	LACOA	DIEDERICH		\N		3297955	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.627209	172.168.80.26/32	\N	\N	\N	\N
68	VERONICA EUGENIA	CORDERO	ESCOBAR		0001-01-01 00:00:00		9826617	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.635471	172.168.80.26/32	\N	\N	\N	\N
69	CARLOS JHEYSON	WILLIS	CRUZ		0001-01-01 00:00:00		5374112	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.652097	172.168.80.26/32	\N	\N	\N	\N
70	WALTER	RODRIGUEZ	CUIZA		0001-01-01 00:00:00		6603402	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.701504	172.168.80.26/32	\N	\N	\N	\N
71	MARIA ANGELICA	CAMPOS	LOPEZ		\N		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.711438	172.168.80.26/32	\N	\N	\N	\N
72	DAVID	SUAREZ	CALLAU		0001-01-01 00:00:00		4700783	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.719806	172.168.80.26/32	\N	\N	\N	\N
73	CRISTINA	MAMANI	TICLLA		0001-01-01 00:00:00		9504496	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.728135	172.168.80.26/32	\N	\N	\N	\N
74	ELDER EDUARDO	REVOLLO	ZEBALLOS		\N		12	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.736396	172.168.80.26/32	\N	\N	\N	\N
75	MARIO ERVIN	BAUER	ARTEAGA		0001-01-01 00:00:00		1993605	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.744859	172.168.80.26/32	\N	\N	\N	\N
76	ROSARIO LAURA	MONTECINOS	LOPEZ		\N		5138644	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.753092	172.168.80.26/32	\N	\N	\N	\N
77	DAYANA	ANGOLA	LANDAVARI		\N		6370083	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.761336	172.168.80.26/32	\N	\N	\N	\N
78	KELVIN	AJATA	CALIZAYA		1995-02-23 00:00:00		13174648	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.769782	172.168.80.26/32	\N	\N	\N	\N
79	MOISES	TORRES	VEIZAGA		0001-01-01 00:00:00		2886535	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.778115	172.168.80.26/32	\N	\N	\N	\N
80	BORIS	GOMEZ	RAMOS		0001-01-01 00:00:00		14058521	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.786269	172.168.80.26/32	\N	\N	\N	\N
81	RUBEN DARIO	QUIROGA	VELASQUEZ		1983-02-24 00:00:00		5849113	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.794474	172.168.80.26/32	\N	\N	\N	\N
82	TATIANA DEISY	ESTRADA	MURUCHI		\N			\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.802733	172.168.80.26/32	\N	\N	\N	\N
83	OMAR 	HIDALGO 	AGUIRRE		1990-01-24 00:00:00		3888743	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.811207	172.168.80.26/32	\N	\N	\N	\N
84	CLAUDIA DYANA	ADAUTO	LUIZAGA		\N		5292515	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.819406	172.168.80.26/32	\N	\N	\N	\N
85	HERSSON ALVARO	ROJAS	CRUZ		0001-01-01 00:00:00		7255861	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.82782	172.168.80.26/32	\N	\N	\N	\N
86	ERWIN	SANCHEZ	MACHICADO		1986-05-29 00:00:00		6354620	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.836133	172.168.80.26/32	\N	\N	\N	\N
87	KAREN ROSARIO	TORREZ	HURTADO		1997-02-28 00:00:00		8961511	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.844499	172.168.80.26/32	\N	\N	\N	\N
88	RIMELDA	CHIRI	AGUANTA		\N		5009389	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.852835	172.168.80.26/32	\N	\N	\N	\N
89	BETZI DAYLE	GONZALES	HERBAS		0001-01-01 00:00:00		4494088	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.861109	172.168.80.26/32	\N	\N	\N	\N
90	VERONICA TATIANA	GARCIA	VELASCO		0001-01-01 00:00:00		4320850	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.869443	172.168.80.26/32	\N	\N	\N	\N
91	BORIS 	CORRALES 	MONTIEL		0001-01-01 00:00:00		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.877872	172.168.80.26/32	\N	\N	\N	\N
92	OLIVER JEAN  YVES 	DE LA GOUBLAYE 	DE MENORVAL 		0001-01-01 00:00:00		4932579	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.886154	172.168.80.26/32	\N	\N	\N	\N
93	MARCO AUGUSTO	HANSSEN	ARANIBAR		0001-01-01 00:00:00		6120053	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.894542	172.168.80.26/32	\N	\N	\N	\N
94	SENOBIO	GUARACHI	VILLCA		1991-02-21 00:00:00		8686792	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.902812	172.168.80.26/32	\N	\N	\N	\N
95	VERONICA	ROMERO	MARISCAL		0001-01-01 00:00:00		8090271	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.911124	172.168.80.26/32	\N	\N	\N	\N
96	LUISA PATRICIA 	CUCHALLO 	GARCIA		0001-01-01 00:00:00		6383309	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.919558	172.168.80.26/32	\N	\N	\N	\N
97	ROBERTO ENRIQUE 	PAREDES 	SEGOVIA		\N		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.927773	172.168.80.26/32	\N	\N	\N	\N
98	KATHERINE CARLA	 ZUNA 	ZEGARRA		\N		7094855	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.936103	172.168.80.26/32	\N	\N	\N	\N
99	VANESSA YOHANNA	SERRANO	QUIROGA		1992-06-15 00:00:00		8981859	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.944435	172.168.80.26/32	\N	\N	\N	\N
100	MARIA YAZMIN	PINTO	TRIGO		1985-08-24 00:00:00		7705217	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.952757	172.168.80.26/32	\N	\N	\N	\N
101	JUDITH	TERRAZAS	NAVARRO		1980-03-16 00:00:00		4507048	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.96117	172.168.80.26/32	\N	\N	\N	\N
102	INGRID	PAMELA	VILLARROEL		0001-01-01 00:00:00		6466694	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.969539	172.168.80.26/32	\N	\N	\N	\N
103	PAUL	PAJARI	CHOQUE		0001-01-01 00:00:00		5063465	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.977774	172.168.80.26/32	\N	\N	\N	\N
104	MARCIA MAVEL	ROCHA	BUSTILLOS		\N		4823408	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.986154	172.168.80.26/32	\N	\N	\N	\N
105	SERGIO HUMBERTO	VILLANUEVA	GUTIERREZ		\N		8307254	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:25.994535	172.168.80.26/32	\N	\N	\N	\N
106	LUIS MIGUEL	COIMBRA	GONZALES		0001-01-01 00:00:00		6105221	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.002875	172.168.80.26/32	\N	\N	\N	\N
107	GABRIEL LUIS	MALDONADO	GUTIERREZ		\N		3731958	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.014686	172.168.80.26/32	\N	\N	\N	\N
108	MIGUEL ANGEL	NOGALES	REVOLLO		0001-01-01 00:00:00		5926555	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.025947	172.168.80.26/32	\N	\N	\N	\N
109	MARIA	TOCONAS	JANCKO		\N		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.036432	172.168.80.26/32	\N	\N	\N	\N
110	OSCAR ALEXANDER	FRANCO	ZEBALLOS		1981-03-30 00:00:00		595861	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.044721	172.168.80.26/32	\N	\N	\N	\N
111	MIGUEL ANGEL	PEREZ	QUIROZ		1991-03-22 00:00:00		7840564	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.053025	172.168.80.26/32	\N	\N	\N	\N
112	ALAIN	GONZALES	B.		0001-01-01 00:00:00		4272134	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.061356	172.168.80.26/32	\N	\N	\N	\N
113	CARMEN JULIETA	VIDAURRE	BAYON		1966-07-21 00:00:00		1437501	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.069688	172.168.80.26/32	\N	\N	\N	\N
114	MILENKA ROSAURA	VALLES	PICABIA		0001-01-01 00:00:00		5777158	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.07808	172.168.80.26/32	\N	\N	\N	\N
115	KARINA	ALMARAZ	MONTOYA		\N		4175839	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.086343	172.168.80.26/32	\N	\N	\N	\N
116	EVA	MAMANI	LAZARO		1996-10-26 00:00:00		4030143	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.094721	172.168.80.26/32	\N	\N	\N	\N
117	LUISA	ARROYO	YOVIO		0001-01-01 00:00:00		6390450	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.103069	172.168.80.26/32	\N	\N	\N	\N
118	RONALD JOSE	ANGULO	VALDEZ		\N		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.111384	172.168.80.26/32	\N	\N	\N	\N
119	DALECIO 	RAMOS			2000-01-01 00:00:00		2525737	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.119606	172.168.80.26/32	\N	\N	\N	\N
120	JHONATAN YEYCO	TRIGUERO	QUISBERT		2000-01-01 00:00:00		9207645	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.127922	172.168.80.26/32	\N	\N	\N	\N
121	EVA	MAMANI	LAZARO		1996-10-26 00:00:00		4030143	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.136294	172.168.80.26/32	\N	\N	\N	\N
122	JUAN	CARLOS	RIVERO		\N		4206514	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.167646	172.168.80.26/32	\N	\N	\N	\N
123	JUAN JOSE	LLAVETA	PEÑA		0001-01-01 00:00:00		4425015	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.178194	172.168.80.26/32	\N	\N	\N	\N
124	FERNANDO ANTONIO	CONDORI	CACHI		2000-01-01 00:00:00		123	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.286481	172.168.80.26/32	\N	\N	\N	\N
125	DANIEL MARCELO	HERRERA	ARANCIBIA		0001-01-01 00:00:00		5759145	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.294724	172.168.80.26/32	\N	\N	\N	\N
126	KATHERINE	CALDERON	VALLE		\N		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.302979	172.168.80.26/32	\N	\N	\N	\N
127	BETTY	MACHICADO	ALTAMIRANO		2000-01-01 00:00:00		10955096	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.31128	172.168.80.26/32	\N	\N	\N	\N
128	ANGEL JHUNIOR	DELGADILLO	CASTAÑETE		0001-01-01 00:00:00		6763048	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.319571	172.168.80.26/32	\N	\N	\N	\N
129	FELIPE	MENDOZA	VASQUEZ		1993-02-17 00:00:00		10827219	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.327928	172.168.80.26/32	\N	\N	\N	\N
130	MYRKO REYNALDO	ARANA	SALAS		1987-01-21 00:00:00		6120372	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.336403	172.168.80.26/32	\N	\N	\N	\N
131	KELLY JUDIT	JUSTINIANO	POQUIVIQUI		1988-09-19 00:00:00		8161887	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.349567	172.168.80.26/32	\N	\N	\N	\N
132	WILLY	NINA	CALLE		1972-07-18 00:00:00		4372894	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.361396	172.168.80.26/32	\N	\N	\N	\N
133	ALEX	ROJAS	FLORES		1974-04-08 00:00:00		3930104	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.369746	172.168.80.26/32	\N	\N	\N	\N
134	MERCY	VARGAS	RIBERA		1975-01-13 00:00:00		4614121	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.377972	172.168.80.26/32	\N	\N	\N	\N
135	ALEJANDRA	PADILLA	QUISPE		1972-02-17 00:00:00		1891510	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.386636	172.168.80.26/32	\N	\N	\N	\N
136	ERICKA	ARREDONDO	PARADA		1973-07-17 00:00:00		3954868	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.419691	172.168.80.26/32	\N	\N	\N	\N
137	MARIA DE LOS ANGELES 	AGUILAR			0001-01-01 00:00:00		4004966	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.427927	172.168.80.26/32	\N	\N	\N	\N
138	MATILDE ROXANA	FERNANDEZ	MALDONADO		1988-03-14 00:00:00		6905470	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.439185	172.168.80.26/32	\N	\N	\N	\N
139	FAVIO CESAR	BORESAY	ROJAS		1998-09-02 00:00:00		12757110	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.45083	172.168.80.26/32	\N	\N	\N	\N
140	DALCY OLINDA	MARAZ	CASTILLO		0001-01-01 00:00:00		5795689	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.461324	172.168.80.26/32	\N	\N	\N	\N
141	MARIA DEL CARMEN  	SERRANO	ALCOBA		0001-01-01 00:00:00		7146486	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.469579	172.168.80.26/32	\N	\N	\N	\N
142	FATIMA SARA	ORTEGA	SOLANO		\N		7108460	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.477897	172.168.80.26/32	\N	\N	\N	\N
143	JORGE ALEJANDRO	MERCADO	LUCERO		\N		6192532	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.486324	172.168.80.26/32	\N	\N	\N	\N
144	WILLAMS	RIVERA	BUITRAGO		\N		5784863	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.494542	172.168.80.26/32	\N	\N	\N	\N
145	FELICIA KARINA	CHOQUE	ALVAREZ		0001-01-01 00:00:00		4014205	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.502956	172.168.80.26/32	\N	\N	\N	\N
146	JAVIER	BURGOS	RAMOS		0001-01-01 00:00:00		5851945	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.511062	172.168.80.26/32	\N	\N	\N	\N
147	MAURICIO DIEGO	 CABRERA 	ARISPE		\N		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.519402	172.168.80.26/32	\N	\N	\N	\N
148	WILDER 	NOVA 	TERCEROS		\N		7689174	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.527701	172.168.80.26/32	\N	\N	\N	\N
149	PAOLA	MIRANDA	VARGAS		\N		9970773	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.535993	172.168.80.26/32	\N	\N	\N	\N
150	ROLANDO	 LEON 	SARAVIA		\N		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.544375	172.168.80.26/32	\N	\N	\N	\N
151	BETHY SILVIA	TERRAZAS	CAMPOS		\N		3338907	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.552701	172.168.80.26/32	\N	\N	\N	\N
152	RODRIGO	KANTUTA	POMACUSI		\N		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.561286	172.168.80.26/32	\N	\N	\N	\N
153	LIZZETH TANIA	FUENTES	PERALTA		0001-01-01 00:00:00		4838892	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.569447	172.168.80.26/32	\N	\N	\N	\N
154	ALFONSO	CUELLAR	RODRIGUEZ		\N			\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.577687	172.168.80.26/32	\N	\N	\N	\N
155	GENESIS	MEDINA	LINO		\N			\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.586059	172.168.80.26/32	\N	\N	\N	\N
156	EDGAR ALFREDO	CORANI	COPAJA		\N		9809259	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.594451	172.168.80.26/32	\N	\N	\N	\N
157	ALEJANDRA INES	QUIROZ 	NUÑEZ		0001-01-01 00:00:00		8230077	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.602714	172.168.80.26/32	\N	\N	\N	\N
158	ELISA	YAPURA 	MOLLO		\N		4868082	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.610956	172.168.80.26/32	\N	\N	\N	\N
159	MICAELA SOLEDAD	MACHICADO			1991-07-28 00:00:00		8302171	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.619417	172.168.80.26/32	\N	\N	\N	\N
160	NANCY ELIZABETH	RODRIGUEZ 	VALDIVIA		1992-11-10 00:00:00		7050661	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.627694	172.168.80.26/32	\N	\N	\N	\N
161	PATRICIA	GUTIERREZ	PINEDO		0001-01-01 00:00:00		6827115	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.636128	172.168.80.26/32	\N	\N	\N	\N
162	GABY ANDREA	MAMANI	PEREZ		1995-07-21 00:00:00		7799849	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.786535	172.168.80.26/32	\N	\N	\N	\N
163	DAVID	BOLIVAR	CABELLO		0001-01-01 00:00:00		5539605	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.836633	172.168.80.26/32	\N	\N	\N	\N
164	RAUL SORUCO	DEL	CARPIO		0001-01-01 00:00:00		2469567	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.859226	172.168.80.26/32	\N	\N	\N	\N
165	JOSE	SORIA	MENDIZABAL		1961-07-20 00:00:00		2376509	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.8697	172.168.80.26/32	\N	\N	\N	\N
166	ELENA	CASTRO	CHARUPA		1987-01-16 00:00:00		7671468	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.877921	172.168.80.26/32	\N	\N	\N	\N
167	YEFERSON EDSON	CHAMBI	CHALLA		1995-05-19 00:00:00		9850108	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.886226	172.168.80.26/32	\N	\N	\N	\N
168	RAUL SORUCO	DEL	CARPIO		0001-01-01 00:00:00		2469567	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.894867	172.168.80.26/32	\N	\N	\N	\N
169	LIDIA MARCELA	CAMACHO	YABETA		1987-06-28 00:00:00		7873968	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.90323	172.168.80.26/32	\N	\N	\N	\N
170	LILIANA	AVILA	CUELLAR		1986-02-10 00:00:00		7110693	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.911476	172.168.80.26/32	\N	\N	\N	\N
171	ROSA ANGELICA	VILTE	BATALLANOS		1995-08-21 00:00:00		7182377	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.919969	172.168.80.26/32	\N	\N	\N	\N
172	MELITON CARLOS	APAZA	QUISPE		1980-07-07 00:00:00		6899298	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.928208	172.168.80.26/32	\N	\N	\N	\N
173	MYRKO REYNALDO	ARANA	SALAS		1987-01-21 00:00:00		6120372	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.936584	172.168.80.26/32	\N	\N	\N	\N
174	OCTAVIO	MENDOZA	ZABALA		1993-04-16 00:00:00		7652711	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.959311	172.168.80.26/32	\N	\N	\N	\N
175	AMBAR JESSICA	ACUÑA 	ZEGARRA		1987-01-10 00:00:00		5035159	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.969625	172.168.80.26/32	\N	\N	\N	\N
176	ERLINDA	TEJERINA 	MENDOZA		0001-01-01 00:00:00		10715838	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.978225	172.168.80.26/32	\N	\N	\N	\N
177	MIRIAM	 TOLA 	BERNAL		0001-01-01 00:00:00		8581911	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.986376	172.168.80.26/32	\N	\N	\N	\N
178	LIDIA	GUZMAN	 VIA		\N		2725659	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:26.994849	172.168.80.26/32	\N	\N	\N	\N
179	OSCAR GABRIEL	LAVERAN 	VACA		\N			\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.003189	172.168.80.26/32	\N	\N	\N	\N
180	ANAHI VICTORIA	GALARZA			1987-11-30 00:00:00		7200907	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.011571	172.168.80.26/32	\N	\N	\N	\N
181	SANTA CAROLINA	MOJICA 	ZURITA		1994-02-10 00:00:00		8240612	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.034422	172.168.80.26/32	\N	\N	\N	\N
182	EUFRANSIS 	REYES 	GALLARDO		1989-10-03 00:00:00		4606203	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.045002	172.168.80.26/32	\N	\N	\N	\N
183	CELESTE HOSHIMI	HIGA	BANEGAS		0001-01-01 00:00:00		5894300	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.053136	172.168.80.26/32	\N	\N	\N	\N
184	ESTHER JUANA	CLAROS	GABRIEL		0001-01-01 00:00:00		4411066	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.061818	172.168.80.26/32	\N	\N	\N	\N
185	FREDY	ESCOBAR 	VEGA		1956-11-15 00:00:00		934295	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.095107	172.168.80.26/32	\N	\N	\N	\N
186	ELVIA MARCELA	RODRIGUEZ	PADILLA		0001-01-01 00:00:00		6508716	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.103322	172.168.80.26/32	\N	\N	\N	\N
187	FRANKLIN	MONTERO	SEJAS		0001-01-01 00:00:00		8039241	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.111876	172.168.80.26/32	\N	\N	\N	\N
188	YULISSA	RODRIGUEZ	GALINDO		0001-01-01 00:00:00		4211733	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.126666	172.168.80.26/32	\N	\N	\N	\N
189	MONICA	SARCO	MENDOZA		0001-01-01 00:00:00		8347052	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.145813	172.168.80.26/32	\N	\N	\N	\N
190	MAURICIO DANIEL	PEREZ	VALENZUELA		\N		5307763	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.153381	172.168.80.26/32	\N	\N	\N	\N
191	ARMANDO	YEPEZ	ZABALA		1986-06-04 00:00:00		8133516	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.161394	172.168.80.26/32	\N	\N	\N	\N
192	LUIS JORGE	CASTRO	TORREZ		0001-01-01 00:00:00		11337594	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.169984	172.168.80.26/32	\N	\N	\N	\N
193	DEDY DAMIAN	HUARACHI	MAMANI		0001-01-01 00:00:00		3085688	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.17815	172.168.80.26/32	\N	\N	\N	\N
194	RODRIGO	FERREIRA	MERRIT		0001-01-01 00:00:00		5700810	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.186464	172.168.80.26/32	\N	\N	\N	\N
195	OMAR ROLANDO	ZUÑAGUA	ARIAS		1990-02-28 00:00:00		8134120	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.194874	172.168.80.26/32	\N	\N	\N	\N
196	ORLANDO	CRUZ	RUIZ		0001-01-01 00:00:00		10342341	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.203067	172.168.80.26/32	\N	\N	\N	\N
197	JOSE BENJAMIN	IBAÑEZ	FERNNADEZ		\N		5867469	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.21157	172.168.80.26/32	\N	\N	\N	\N
198	MARIA SANDRA	ABASTOFLOR	CORDOVA		0001-01-01 00:00:00		3395054	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.219873	172.168.80.26/32	\N	\N	\N	\N
199	ALEXANDER	COLMAN	TORO		0001-01-01 00:00:00		7178278	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.228225	172.168.80.26/32	\N	\N	\N	\N
200	RAMIRO	HEREDIA	CLAROS		1982-03-31 00:00:00		5303481	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.236484	172.168.80.26/32	\N	\N	\N	\N
201	RODRIGO	MARTINEZ	AZUCARELA		0001-01-01 00:00:00		10827932	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.244924	172.168.80.26/32	\N	\N	\N	\N
202	CAROLINA	FLORES	VACA		0001-01-01 00:00:00		6257318	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.253066	172.168.80.26/32	\N	\N	\N	\N
203	DANIELA EVA	MAMANI	LAZARO		0001-01-01 00:00:00		4030143	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.261634	172.168.80.26/32	\N	\N	\N	\N
204	CINTHYA MICHELLE	ACHA	BOLIVAR		1986-11-13 00:00:00		5171369	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.269977	172.168.80.26/32	\N	\N	\N	\N
205	BRAULIO	JANKO	RAMOS		\N		7702505	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.278182	172.168.80.26/32	\N	\N	\N	\N
206	DIEGO FERNANDO	FARFAN	VELASQUEZ		1992-04-13 00:00:00		7170200	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.286391	172.168.80.26/32	\N	\N	\N	\N
207	LUIS REMBERTO	PEREDO	CARDOZO		1997-10-17 00:00:00		8905822	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.294909	172.168.80.26/32	\N	\N	\N	\N
208	WALTER	ALPIRE	MONTERO		0001-01-01 00:00:00		6201462	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.409803	172.168.80.26/32	\N	\N	\N	\N
209	BLADIMIR WALTER	PLATA	ARANDA		0001-01-01 00:00:00		2358489	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.453282	172.168.80.26/32	\N	\N	\N	\N
210	JOSE FERNANDO	TEMO	JIMENEZ		1996-02-16 00:00:00		7846841	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.461311	172.168.80.26/32	\N	\N	\N	\N
211	MARCO ANTONIO	APAZA	CORDERO		0001-01-01 00:00:00		4758936	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.469733	172.168.80.26/32	\N	\N	\N	\N
212	ROBERTO JAVIER	RIOJA	RUIZ		0001-01-01 00:00:00		5852491	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.477895	172.168.80.26/32	\N	\N	\N	\N
213	CARLOS DANIEL	VARGAS	AYALA		0001-01-01 00:00:00		5397451	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.486322	172.168.80.26/32	\N	\N	\N	\N
214	JULIETA	COLQUE	CANDY		0001-01-01 00:00:00		7627603	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.49483	172.168.80.26/32	\N	\N	\N	\N
215	IVONNE CAROLA	VASQUEZ	CHAVEZ		0001-01-01 00:00:00		3903010	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.50294	172.168.80.26/32	\N	\N	\N	\N
216	MARIA ANDREA	MELGAR	ZAMBRANA		0001-01-01 00:00:00		6319860	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.511602	172.168.80.26/32	\N	\N	\N	\N
217	ALDO	GARCIA	BALDERRAMA		\N			\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.519575	172.168.80.26/32	\N	\N	\N	\N
218	JORGE ALEJANDRO	LARA	VILLEGAS		0001-01-01 00:00:00		7873794	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.52809	172.168.80.26/32	\N	\N	\N	\N
219	ZOBEIDA ELI	MURILLO	PEREZ		1987-06-02 00:00:00		9607105	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.536434	172.168.80.26/32	\N	\N	\N	\N
220	ABIGAIL	IRIARTE	POMA		1996-09-09 00:00:00		13110736	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.544632	172.168.80.26/32	\N	\N	\N	\N
221	ROBERTO CARLOS	CHAMBI	MONTOYA		0001-01-01 00:00:00		4607100	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.552896	172.168.80.26/32	\N	\N	\N	\N
222	JORGE ALFREDO	MOZA	BARBA		1995-05-31 00:00:00		12447460	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.561338	172.168.80.26/32	\N	\N	\N	\N
223	PAOLA DEL ROSARIO  	LUJAN	TORRICO		1986-11-03 00:00:00		6525339	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.56969	172.168.80.26/32	\N	\N	\N	\N
224	JOAQUIN MARIO	COAQUIRA	TENORIO		0001-01-01 00:00:00		7773408	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.578197	172.168.80.26/32	\N	\N	\N	\N
225	JOSEFA	LESCANO	RAMOS		0001-01-01 00:00:00		7164433	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.586401	172.168.80.26/32	\N	\N	\N	\N
226	ESTEBAN	GALINDO	MOLLE		\N		4178599	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.594962	172.168.80.26/32	\N	\N	\N	\N
227	RODRIGO	KANTUTA	POMACUSI		1989-05-05 00:00:00		8286247	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.602943	172.168.80.26/32	\N	\N	\N	\N
228	INDALECIO	RAMOS	QUISPE		0001-01-01 00:00:00		2525737	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.611537	172.168.80.26/32	\N	\N	\N	\N
229	HERLAND	IGNACIO	GONZALES		0001-01-01 00:00:00		5870283	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.620042	172.168.80.26/32	\N	\N	\N	\N
230	ELOY	GONZALES	VERA		\N		5631038	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.628192	172.168.80.26/32	\N	\N	\N	\N
231	SHEILA LORENA	GUERRERO	ABREGO		1977-04-28 00:00:00		6157698	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.636469	172.168.80.26/32	\N	\N	\N	\N
232	LUIS ORLANDO	REYES	MONTAÑO		0001-01-01 00:00:00		2854007	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.64486	172.168.80.26/32	\N	\N	\N	\N
233	DORIAN	AYALA	MOYE		0001-01-01 00:00:00		7619153	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.653023	172.168.80.26/32	\N	\N	\N	\N
234	MAURICIO EDWIN	CARVALLO	CASTELLON		0001-01-01 00:00:00		9432302	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.661344	172.168.80.26/32	\N	\N	\N	\N
235	VALERIO	MARTINEZ	GUARAYO		\N		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.669674	172.168.80.26/32	\N	\N	\N	\N
236	MARIA PATRICIA	ROJAS	FIGUEROA		\N			\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.678463	172.168.80.26/32	\N	\N	\N	\N
237	VIRGINIA	VARGAS	VASQUEZ		0001-01-01 00:00:00		6500233	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.686375	172.168.80.26/32	\N	\N	\N	\N
238	DARDO	GRECO	PICACHURI		1982-09-17 00:00:00		5559184	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.694929	172.168.80.26/32	\N	\N	\N	\N
239	FRANZ IVAN	SANGALLINI	HILARI		0001-01-01 00:00:00		7072111	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.703035	172.168.80.26/32	\N	\N	\N	\N
240	ARIEL MARTIN	SARUBBE	TERAN		0001-01-01 00:00:00		2373006	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.71137	172.168.80.26/32	\N	\N	\N	\N
241	JAIME MAURICIO	MONTES	CANO		0001-01-01 00:00:00		4414284	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.719547	172.168.80.26/32	\N	\N	\N	\N
242	PAUL KEVIN	ALTAMIRANO	ARANDA		0001-01-01 00:00:00		9585394	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.728155	172.168.80.26/32	\N	\N	\N	\N
243	FARY	RODRIGUEZ	RODRIGUEZ		0001-01-01 00:00:00		7586468	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.736298	172.168.80.26/32	\N	\N	\N	\N
244	ROYERS	TRUJILLO	VASQUEZ		0001-01-01 00:00:00		8113089	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.744912	172.168.80.26/32	\N	\N	\N	\N
245	STEPHANIE CAROLINA	PEREZ	REYES		0001-01-01 00:00:00		7832815	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.753147	172.168.80.26/32	\N	\N	\N	\N
246	ROSARIO	COELHO	CHAVEZ		0001-01-01 00:00:00		5618953	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.761581	172.168.80.26/32	\N	\N	\N	\N
247	JHOVANI	QUISBERT	VILELO		1998-06-26 00:00:00		9513890	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.769567	172.168.80.26/32	\N	\N	\N	\N
248	DANIEL	MAMANI	DAZA		0001-01-01 00:00:00		3480478	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.778273	172.168.80.26/32	\N	\N	\N	\N
249	FREDDY	MELGAR	SURUBI		0001-01-01 00:00:00		6293780	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.786347	172.168.80.26/32	\N	\N	\N	\N
250	KARINA LIZETH	TERRAZAS	VEGA		\N		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.794909	172.168.80.26/32	\N	\N	\N	\N
251	HERNAN	ERAZO	RIVERA		0001-01-01 00:00:00		2838016	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.802929	172.168.80.26/32	\N	\N	\N	\N
252	MARCIAL	SILES			0001-01-01 00:00:00		5816547	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.81149	172.168.80.26/32	\N	\N	\N	\N
253	DANIELA FLORES	BELLONI	RIVAS		0001-01-01 00:00:00		7921303	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.819655	172.168.80.26/32	\N	\N	\N	\N
254	CLAUDIA NOEMY	CHALAR	VARGAS		0001-01-01 00:00:00		3250841	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.828166	172.168.80.26/32	\N	\N	\N	\N
255	LINDA CAROLAY	SMITH	SANROMAN		1989-05-02 00:00:00		7906296	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.836522	172.168.80.26/32	\N	\N	\N	\N
256	RICHARD	TORREJON	FERNANDEZ		0001-01-01 00:00:00		6136524	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.844954	172.168.80.26/32	\N	\N	\N	\N
257	ISRAEL VICTOR	ESPINOZA	CAMACHO		\N		12	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.853075	172.168.80.26/32	\N	\N	\N	\N
258	DIANDRA	VACA	RIVERO		\N		5877803	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.86154	172.168.80.26/32	\N	\N	\N	\N
259	LUCAS	VILLARREAL	LISBOA		0001-01-01 00:00:00		4084031	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.869699	172.168.80.26/32	\N	\N	\N	\N
260	RUBI MARGARITA	ANTELO	RAMIREZ		\N		8034463	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.878216	172.168.80.26/32	\N	\N	\N	\N
261	ROSAMEL	ESCOBAR	ROJAS		0001-01-01 00:00:00		6467224	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.911428	172.168.80.26/32	\N	\N	\N	\N
262	RONALD	SILES	ALMANZA		0001-01-01 00:00:00		7181596	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.919595	172.168.80.26/32	\N	\N	\N	\N
263	CARLA	PAILLO	RIVERO		0001-01-01 00:00:00		10643934	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.928149	172.168.80.26/32	\N	\N	\N	\N
264	JUAN PABLO	CABELLO	RIVERO		0001-01-01 00:00:00		6245196	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.936375	172.168.80.26/32	\N	\N	\N	\N
265	HILDA PAOLA	PORCEL	MEJIA		1976-09-01 00:00:00		3657250	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.945012	172.168.80.26/32	\N	\N	\N	\N
266	CINTHIA	PANIAGUA	MARISCAL		0001-01-01 00:00:00		3290936	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.952966	172.168.80.26/32	\N	\N	\N	\N
267	CLAUDIA	GALVEZ	GUERRERO		0001-01-01 00:00:00		5039545	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.961277	172.168.80.26/32	\N	\N	\N	\N
268	MARIA ESTELA	VELIZ	FLORES		\N		8061140	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.969592	172.168.80.26/32	\N	\N	\N	\N
269	GUSTAVO	GONGORA	GARCIA		\N		7904718	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.97789	172.168.80.26/32	\N	\N	\N	\N
270	JIMMY	PEREZ	VACA		\N		7666904	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.986157	172.168.80.26/32	\N	\N	\N	\N
271	ANA RITA	COTA	MAMANI		0001-01-01 00:00:00		8990360	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:27.994902	172.168.80.26/32	\N	\N	\N	\N
272	MANUEL	ROGER	VINACHA		\N		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.002914	172.168.80.26/32	\N	\N	\N	\N
273	FELIX CAMILO	LLANQUIPACHA	CORTEZ		1981-11-16 00:00:00		5341101	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.011378	172.168.80.26/32	\N	\N	\N	\N
274	MARIO EDGAR	CUIZARA	CORDOVA		\N		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.036346	172.168.80.26/32	\N	\N	\N	\N
275	RUDDY EDDY	PEREZ	SALGUERO		1993-01-21 00:00:00		6379626	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.153194	172.168.80.26/32	\N	\N	\N	\N
276	ANA MARIA	ORTIZ	EGUEZ		1983-07-26 00:00:00		4191110	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.167486	172.168.80.26/32	\N	\N	\N	\N
277	ANDREA	ORTEGA	ARZE		0001-01-01 00:00:00		6453256	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.178185	172.168.80.26/32	\N	\N	\N	\N
278	SERGIO	CHAVARRIA	POLO		\N		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.20077	172.168.80.26/32	\N	\N	\N	\N
279	ARTHUR FELIPE	RODRIGUEZ	MENDONCA		0001-01-01 00:00:00		8847816	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.211399	172.168.80.26/32	\N	\N	\N	\N
280	GUETTBY OMAYRA	CLAURE	ACOSTA		0001-01-01 00:00:00		6543531	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.219651	172.168.80.26/32	\N	\N	\N	\N
281	PERCY	YUJRA	POMA		1987-03-23 00:00:00		6815263	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.334106	172.168.80.26/32	\N	\N	\N	\N
282	VICTOR HUGO	ALURRALDE	GONZALES		0001-01-01 00:00:00		2338572	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.353121	172.168.80.26/32	\N	\N	\N	\N
283	JORGE	ROBLES	BARRERA		\N		6447725	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.361333	172.168.80.26/32	\N	\N	\N	\N
284	EDGAR	FERNANDEZ	BURGIA		\N		5206397	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.369711	172.168.80.26/32	\N	\N	\N	\N
285	URBANO CESAR	CUELLAR	PARADA		0001-01-01 00:00:00		6225721	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.378151	172.168.80.26/32	\N	\N	\N	\N
286	ELMER YOHAN	ROSALES	SOTO		0001-01-01 00:00:00		9750117	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.386496	172.168.80.26/32	\N	\N	\N	\N
287	NOEMI LOURDES	POMA	BELLO		\N			\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.394768	172.168.80.26/32	\N	\N	\N	\N
288	JORGE	COCA	AYALA		0001-01-01 00:00:00		5223082	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.402965	172.168.80.26/32	\N	\N	\N	\N
289	ROLANDO	ROBLES	CHAVEZ		1985-11-18 00:00:00		7727976	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.411485	172.168.80.26/32	\N	\N	\N	\N
290	GUSTAVO ADOLFO	ALVAREZ	AÑEZ		0001-01-01 00:00:00		3827886	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.41966	172.168.80.26/32	\N	\N	\N	\N
291	SANDRO	TORRICO	CORRALES		\N		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.428069	172.168.80.26/32	\N	\N	\N	\N
292	HUGO	MARTINEZ	CALVETTY		0001-01-01 00:00:00		8050257	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.43626	172.168.80.26/32	\N	\N	\N	\N
293	MARGOTH	CASTILLO	LOPEZ		\N		8910273	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.444842	172.168.80.26/32	\N	\N	\N	\N
294	JORNADA AISHA ESMEE  	BALKE	ROCA		0001-01-01 00:00:00		7849034	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.452928	172.168.80.26/32	\N	\N	\N	\N
295	ALFREDO	BLANCO	MOLLO		\N		7288464	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.461251	172.168.80.26/32	\N	\N	\N	\N
296	MARIANELA	QUISBERT	RAMOS		\N		4938978	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.46953	172.168.80.26/32	\N	\N	\N	\N
297	WALTER JAVIER	GUMUCIO	PORTUGAL		0001-01-01 00:00:00		4692160	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.477844	172.168.80.26/32	\N	\N	\N	\N
298	EDGAR	POMA	TORRICO		0001-01-01 00:00:00		3376552	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.486482	172.168.80.26/32	\N	\N	\N	\N
299	ROSA 	ARAOZ 	MENACHO		2002-02-28 00:00:00		7766601	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.494946	172.168.80.26/32	\N	\N	\N	\N
300	JAVIER	PALACHAI	PUTARE		1991-12-14 00:00:00		5414472	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.5031	172.168.80.26/32	\N	\N	\N	\N
301	INGAR 	ISITA 	SEMO		1980-07-21 00:00:00		8238421	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.511303	172.168.80.26/32	\N	\N	\N	\N
302	VERONICA	HUANCA	ASPI		0001-01-01 00:00:00		8366505	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.519794	172.168.80.26/32	\N	\N	\N	\N
303	LUIS EVANGELINO	PATZI	VERA		\N		656234	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.527943	172.168.80.26/32	\N	\N	\N	\N
304	RAUL	CALAMANI	QUISPE		1980-06-06 00:00:00		5955180	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.536342	172.168.80.26/32	\N	\N	\N	\N
305	LUIS ALBERTO	CASTELLANOS	FLORES		0001-01-01 00:00:00		5787882	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.545489	172.168.80.26/32	\N	\N	\N	\N
306	PATRICIA	RUIZ	PEDRIEL		0001-01-01 00:00:00		9776412	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.553071	172.168.80.26/32	\N	\N	\N	\N
307	ANTONIO	ORTIZ	ATIPOBO		\N		3351784	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.561407	172.168.80.26/32	\N	\N	\N	\N
308	JAIME	POMACOSI	CATARI		\N		6743895	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.594867	172.168.80.26/32	\N	\N	\N	\N
309	JERMY ALEJANDRA	NACIR	JIMENEZ		0001-01-01 00:00:00		5213985	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.603058	172.168.80.26/32	\N	\N	\N	\N
310	RUBY MARCELA	FLORES	GALARZA		0001-01-01 00:00:00		4947780	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.611308	172.168.80.26/32	\N	\N	\N	\N
311	NANCY	LOPEZ	MUJICA		\N		2443388	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.619681	172.168.80.26/32	\N	\N	\N	\N
312	RAMIRO	LLANOS	GUERRA		0001-01-01 00:00:00		2461257	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.627737	172.168.80.26/32	\N	\N	\N	\N
313	JULIO CESAR	CONTRERAS	SOLIZ		0001-01-01 00:00:00		3901599	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.659398	172.168.80.26/32	\N	\N	\N	\N
314	ALEX	MARCA	HUANCA		\N		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.678073	172.168.80.26/32	\N	\N	\N	\N
315	YOHANA ALEJANDRA	FARFAN	VARGAS		0001-01-01 00:00:00		9251583	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.686217	172.168.80.26/32	\N	\N	\N	\N
316	MARGOTH	ARTEAGA	MOJICA		\N		8178046	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.694759	172.168.80.26/32	\N	\N	\N	\N
317	ILSEN ROSSE MARY   	GALLARDO	CHAVEZ		1982-10-28 00:00:00		5046795	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.728154	172.168.80.26/32	\N	\N	\N	\N
318	MARIA ELENA 	LIPA 	ALANOCA		1990-10-18 00:00:00		8364075	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.845398	172.168.80.26/32	\N	\N	\N	\N
319	NOELIA ALEJANDRA	CHACON	LARICO		0001-01-01 00:00:00		8410459	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.859299	172.168.80.26/32	\N	\N	\N	\N
320	FRANZ MAURICIO	ACHA	ZAMBRANA		0001-01-01 00:00:00		3731447	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.86965	172.168.80.26/32	\N	\N	\N	\N
321	JUAN CARLOS 	ALVAREZ 	VEGA		0001-01-01 00:00:00		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.8926	172.168.80.26/32	\N	\N	\N	\N
322	ANA MARIA	DURAN 	ALARCON		0001-01-01 00:00:00		3450296	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.902936	172.168.80.26/32	\N	\N	\N	\N
323	MAX EMILIO	QUIROGA	ANTEZANA		1986-01-15 00:00:00		3731958	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:28.911286	172.168.80.26/32	\N	\N	\N	\N
324	FERNANDO DANIEL	BUTRON	ALVAREZ		1982-05-08 00:00:00		8002762	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.026037	172.168.80.26/32	\N	\N	\N	\N
325	TIANA PATRICIA	ACHAVAL	BRESS		\N		3251775	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.044804	172.168.80.26/32	\N	\N	\N	\N
326	LIMBERT	VELARDE	ALARCON		1991-06-29 00:00:00		4823467	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.052894	172.168.80.26/32	\N	\N	\N	\N
327	MICHAEL EDWIN	GOMEZ	PEÑA		\N			\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.061403	172.168.80.26/32	\N	\N	\N	\N
328	JOSE GUMERCINDO	GAMEZ	PEREZ		\N		12	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.069463	172.168.80.26/32	\N	\N	\N	\N
329	EDUARDO MARCIAL	ARO	MAMANI		\N		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.078108	172.168.80.26/32	\N	\N	\N	\N
330	MINDY ANABEL	 GARZON 	CONTRERAS		0001-01-01 00:00:00		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.08629	172.168.80.26/32	\N	\N	\N	\N
331	JORGE LUIS	SANCHEZ	DELGADO		0001-01-01 00:00:00		5818563	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.094749	172.168.80.26/32	\N	\N	\N	\N
332	DAVID	 MOLLINEDO 	SILVA		\N		4278693	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.103166	172.168.80.26/32	\N	\N	\N	\N
333	FABIOLA	MENDOZA	NINA		0001-01-01 00:00:00		8108348	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.111205	172.168.80.26/32	\N	\N	\N	\N
334	YELISA 	DELGADO 	VILLCA		\N		7848668	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.119649	172.168.80.26/32	\N	\N	\N	\N
335	EDIL RODRIGO	MARCA	VIDAL		0001-01-01 00:00:00		6257306	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.128001	172.168.80.26/32	\N	\N	\N	\N
336	MARCOS BRUNO	MOROCHI	VERA		1992-07-18 00:00:00		7799605	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.136393	172.168.80.26/32	\N	\N	\N	\N
337	JORGE ALEJANDRO	NEGRETE	VELASCO		0001-01-01 00:00:00		4771048	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.144817	172.168.80.26/32	\N	\N	\N	\N
338	HENRY EDUARDO	MARTINEZ	AVENDANO		0001-01-01 00:00:00		3425132	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.186352	172.168.80.26/32	\N	\N	\N	\N
339	ROBERTO	MOJICA	SUAREZ		\N		3378142	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.194764	172.168.80.26/32	\N	\N	\N	\N
340	FLADIMIR OSCAR	RAMOS	CRUZ		2000-01-14 00:00:00		13977428	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.203014	172.168.80.26/32	\N	\N	\N	\N
341	RICHARD	MANGUTA	MOJICA		1988-02-15 00:00:00		7806425	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.211212	172.168.80.26/32	\N	\N	\N	\N
342	EDWIN	FREDDY	GARCIA		\N		7139005	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.21954	172.168.80.26/32	\N	\N	\N	\N
343	TATIANA	MAGARIÑOS	TORANZOS		0001-01-01 00:00:00		3605929	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.227981	172.168.80.26/32	\N	\N	\N	\N
344	GASTON	VILAR	MORENO		1989-12-27 00:00:00		6683369	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.236248	172.168.80.26/32	\N	\N	\N	\N
345	EVELIN	ALCOCER	ROCA		0001-01-01 00:00:00		9584333	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.267572	172.168.80.26/32	\N	\N	\N	\N
346	JORGE ANDRES	RAMIREZ	VELEZ		\N		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.28646	172.168.80.26/32	\N	\N	\N	\N
347	ALFREDO	MARQUEZ	JIMENEZ		1977-07-21 00:00:00		4403124	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.302823	172.168.80.26/32	\N	\N	\N	\N
348	LIANETH YAJAIRA	LOPEZ	CRUZ		1993-07-18 00:00:00		10824836	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.311258	172.168.80.26/32	\N	\N	\N	\N
349	FATIMA PILAR	DELGADILLO	CHARAÑA		1986-04-22 00:00:00		6958701	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.319658	172.168.80.26/32	\N	\N	\N	\N
350	SILVIA EUGENIA	RIVAS	AGUILAR		0001-01-01 00:00:00		6382138	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.328024	172.168.80.26/32	\N	\N	\N	\N
351	NELSON JUAN	CORONEL	ZAPANA		1974-01-31 00:00:00		4300787	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.336388	172.168.80.26/32	\N	\N	\N	\N
352	GABY ROSSANA	GUILLEN	RIBERA		0001-01-01 00:00:00		3161871-1K	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.34444	172.168.80.26/32	\N	\N	\N	\N
353	MARGOTH	URQUIETA	FARELL		0001-01-01 00:00:00		3268855	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.353076	172.168.80.26/32	\N	\N	\N	\N
354	JOSE MAURICIO	ALBAN	MONTERO		0001-01-01 00:00:00		4532630	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.361313	172.168.80.26/32	\N	\N	\N	\N
355	OMAR RODRIGO	TERRAZAS	QUIROZ		0001-01-01 00:00:00		6284982	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.369661	172.168.80.26/32	\N	\N	\N	\N
356	GUILLERMO SERGIO	ZAMORANO	SANTALLA		0001-01-01 00:00:00		7361543	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.378088	172.168.80.26/32	\N	\N	\N	\N
357	GERMAN	GOMEZ	VASQUEZ		\N		5197455	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.386281	172.168.80.26/32	\N	\N	\N	\N
358	EVA DANIELA	ORTIZ	ORTIZ		0001-01-01 00:00:00		3381662	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.394398	172.168.80.26/32	\N	\N	\N	\N
359	MARCELO	PASTRANA	FERNANDEZ		\N		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.403052	172.168.80.26/32	\N	\N	\N	\N
360	NELSON JUAN	CORONEL	ZAPANA		1974-01-31 00:00:00		4300787	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.411226	172.168.80.26/32	\N	\N	\N	\N
361	LUIS MIGUEL	IBAÑEZ	BERAZAIN		0001-01-01 00:00:00		6732361	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.419495	172.168.80.26/32	\N	\N	\N	\N
362	MARIA ANGELICA	ALDANA	SARAVIA		\N		6383218	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.427938	172.168.80.26/32	\N	\N	\N	\N
363	VERONICA	MARAZ	VALENZUELA		\N		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.436268	172.168.80.26/32	\N	\N	\N	\N
364	JOSE LUIS	MOYA	CABEZAS		1993-12-04 00:00:00		8332071	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.444474	172.168.80.26/32	\N	\N	\N	\N
365	OLIVER	POLO	CUELLAR		1987-03-04 00:00:00		6760556	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.452944	172.168.80.26/32	\N	\N	\N	\N
366	SILVANA	VACA	ZAMBRANA		0001-01-01 00:00:00		5833314	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.461066	172.168.80.26/32	\N	\N	\N	\N
367	OVIDIO ARMENGOL	HUANCA	QUISPE		1980-04-27 00:00:00		4907508	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.469298	172.168.80.26/32	\N	\N	\N	\N
368	ALEX EDUARDO	ALIAGA	ARTEAGA		1964-06-01 00:00:00		2608375	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.47773	172.168.80.26/32	\N	\N	\N	\N
369	LUIS ENRIQUE	ALBA	ZABALA		0001-01-01 00:00:00		7636468	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.486207	172.168.80.26/32	\N	\N	\N	\N
370	REYNALDO	MORE	GUASANIA		\N		4272134	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.494631	172.168.80.26/32	\N	\N	\N	\N
371	BERENIZE	MONTAÑO	GUARECO		\N		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.503147	172.168.80.26/32	\N	\N	\N	\N
372	DANIEL AUGUSTO	APURI	VASQUEZ		0001-01-01 00:00:00		7937102	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.51094	172.168.80.26/32	\N	\N	\N	\N
373	AYDEE ERIKA	CABALLERO	CABALLERO		\N		7887404-1E	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.519476	172.168.80.26/32	\N	\N	\N	\N
374	VERONICA	VASQUEZ	ROJAS		1980-10-21 00:00:00		5601411	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.527743	172.168.80.26/32	\N	\N	\N	\N
375	LUIS ARIEL	CHAO	GALVEZ		1991-01-03 00:00:00		7620941	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.536321	172.168.80.26/32	\N	\N	\N	\N
376	JULIO CESAR	CALCINA	POMA		1993-01-05 00:00:00		8301467	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.544445	172.168.80.26/32	\N	\N	\N	\N
377	NOEL WILFREDO	BLANCO	HUARACO		1985-02-12 00:00:00		6430943	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.552915	172.168.80.26/32	\N	\N	\N	\N
378	DANIEL	MAMANI	DAZA		\N		3480478	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.561249	172.168.80.26/32	\N	\N	\N	\N
379	SANDRA	TERRAZAS	CONDORI		1984-09-12 00:00:00		5338630	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.569676	172.168.80.26/32	\N	\N	\N	\N
380	JUANA	MARIA	LOPEZ		1981-05-17 00:00:00		4093477	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.577775	172.168.80.26/32	\N	\N	\N	\N
381	LUIS ARNALDO	VACA	RIVERO		1991-02-03 00:00:00		7627817	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.586444	172.168.80.26/32	\N	\N	\N	\N
382	MARCELO	CHAVEZ	BECERRA		\N		7771411	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.594453	172.168.80.26/32	\N	\N	\N	\N
383	ERICK	ARANO	PEDRAZA		1985-09-07 00:00:00		5394616	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.602729	172.168.80.26/32	\N	\N	\N	\N
384	GUADALUPE	EJURO	REJAS		1986-06-11 00:00:00		7585818	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.611257	172.168.80.26/32	\N	\N	\N	\N
385	MIGUEL	SUAREZ	AGUILAR		0001-01-01 00:00:00		7930020	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.619525	172.168.80.26/32	\N	\N	\N	\N
386	VANIA	CALIZAYA	AMPUERO		0001-01-01 00:00:00		5310043	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.627935	172.168.80.26/32	\N	\N	\N	\N
387	FRANCISCO ARMANDO	MENDOZA	COORITE		\N		8462489	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.636234	172.168.80.26/32	\N	\N	\N	\N
388	MIRIAN	ROSA	SAHONERO		0001-01-01 00:00:00		3800988	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.644524	172.168.80.26/32	\N	\N	\N	\N
389	YOLANDA MARIA	BELTRAN	TORRICO		0001-01-01 00:00:00		484256	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.669696	172.168.80.26/32	\N	\N	\N	\N
390	JAVIER BENJAMIN	MEDINA	MELGAR		0001-01-01 00:00:00		6308147	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.694496	172.168.80.26/32	\N	\N	\N	\N
391	LILIAN	DOMINGUEZ	ROJAS		1981-12-21 00:00:00		5588060	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.71967	172.168.80.26/32	\N	\N	\N	\N
392	JEAN LUCAS	SANCHEZ	GUTIERREZ		0001-01-01 00:00:00		9615954	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.727894	172.168.80.26/32	\N	\N	\N	\N
393	DILSON	RIVERA	CUELLAR		\N		3253521	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.736205	172.168.80.26/32	\N	\N	\N	\N
394	JOEL FELIPE	ANCALLE	MAMANI		1978-09-12 00:00:00		5061051	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.744283	172.168.80.26/32	\N	\N	\N	\N
395	LIZETH LINA	FUENTES	ALBINO		1980-09-28 00:00:00		4037155	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.752552	172.168.80.26/32	\N	\N	\N	\N
396	EDDY WILSON	BALBOA	CHOQUEHUANCA		\N		6739677	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.761018	172.168.80.26/32	\N	\N	\N	\N
397	OSCAR DANIEL	OSINAGA	ROMAN		1998-03-18 00:00:00		12663998	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.769587	172.168.80.26/32	\N	\N	\N	\N
398	ARIEL DAYGOR	ESPINOZA	SANJINEZ		0001-01-01 00:00:00		3512296	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.777983	172.168.80.26/32	\N	\N	\N	\N
399	LIDER ERNESTO	ILICH	CALDERON		\N			\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.802872	172.168.80.26/32	\N	\N	\N	\N
400	RAMIRO RUBEN	LOPEZ	CRESPO		1958-04-04 00:00:00		2299164	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.834024	172.168.80.26/32	\N	\N	\N	\N
401	SOLEMNIO	CONDORI	JIMENEZ		\N		5928622	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.961286	172.168.80.26/32	\N	\N	\N	\N
402	PERCY	FERNANDEZ	MUÑOZ		\N		6294584	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:29.99214	172.168.80.26/32	\N	\N	\N	\N
403	JOSE LUIS	FLORES	CHOQUE		1981-12-28 00:00:00		6561176	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.00284	172.168.80.26/32	\N	\N	\N	\N
404	JAVIER	NOGALES	ROJAS		1980-03-05 00:00:00		5580468	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.010919	172.168.80.26/32	\N	\N	\N	\N
405	YUFAR	CARTAGENA	MARUPA		\N		6535541	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.019459	172.168.80.26/32	\N	\N	\N	\N
406	CARLA JHASMINA	LOZA	CONDORI		\N		9227056	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.027801	172.168.80.26/32	\N	\N	\N	\N
407	JOSE FLAVIO	ALCOCER	CLAROS		\N		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.036266	172.168.80.26/32	\N	\N	\N	\N
408	SIMON BLADIMIR	RAMOS	BURGOS		0001-01-01 00:00:00		4035191	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.044351	172.168.80.26/32	\N	\N	\N	\N
409	JUAN CARLOS	FARFAN	LAMAS		1986-04-06 00:00:00		7167144	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.094612	172.168.80.26/32	\N	\N	\N	\N
410	NOELIA ALICIA	CARDOZO	MORENO		0001-01-01 00:00:00		9371799	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.136273	172.168.80.26/32	\N	\N	\N	\N
411	MARIA FERNANDA	SILISQUE	ALVARADO		0001-01-01 00:00:00		10654975	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.144251	172.168.80.26/32	\N	\N	\N	\N
412	JOSE ROBERTO	ECHALAR	BARRIENTOS		0001-01-01 00:00:00		4057783	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.152508	172.168.80.26/32	\N	\N	\N	\N
413	EDMUNDO	COCTANA	TORRICO		0001-01-01 00:00:00		7298808	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.161015	172.168.80.26/32	\N	\N	\N	\N
414	JESUS	MENDEZ	CHOQUE		1991-12-21 00:00:00		8510315	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.169588	172.168.80.26/32	\N	\N	\N	\N
415	EDWIN RONALD	ZAMBRANA	RAMALLO		1970-02-09 00:00:00		3504571	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.177591	172.168.80.26/32	\N	\N	\N	\N
416	DAVIR ORLANDO	ESPINOZA	URQUIETA		\N		120130	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.186122	172.168.80.26/32	\N	\N	\N	\N
417	SERGIO CELESTINO FREDDY  	IQUISE	BONIFACIO		1981-01-06 00:00:00		5079015	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.194392	172.168.80.26/32	\N	\N	\N	\N
418	PABLO RILDO	VILLARROEL	FERNANDEZ		1977-09-09 00:00:00		3547725	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.202983	172.168.80.26/32	\N	\N	\N	\N
419	ALONDRA NICOLE	PALOMINO	AYARACHI		1997-04-06 00:00:00		10529831	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.210931	172.168.80.26/32	\N	\N	\N	\N
420	JACINTO	TITO	COAQUIRA		1980-09-06 00:00:00		6159173	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.219414	172.168.80.26/32	\N	\N	\N	\N
421	ABDEL DIEGO	ESPADA	VILLCA		1977-05-05 00:00:00		3532636	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.227584	172.168.80.26/32	\N	\N	\N	\N
422	ESTEFANI	CASTELLON	ARZE		0001-01-01 00:00:00		5279570	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.236265	172.168.80.26/32	\N	\N	\N	\N
423	ARNALDO ENRIQUE	RIVERO	RAMIREZ		0001-01-01 00:00:00		2309062	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.260998	172.168.80.26/32	\N	\N	\N	\N
424	ANA	SORIA GALVARRO 	CHAVEZ		\N		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.269248	172.168.80.26/32	\N	\N	\N	\N
425	RUTH	TORREZ	CONDORI		\N		8022322	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.27751	172.168.80.26/32	\N	\N	\N	\N
426	JORGE MARCIAL	ARUQUIPA	MARQUEZ		0001-01-01 00:00:00		3315341	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.285784	172.168.80.26/32	\N	\N	\N	\N
427	PODRIGO	KANTUTA	POMACUSI		1989-05-05 00:00:00		8286247	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.294045	172.168.80.26/32	\N	\N	\N	\N
428	EVA RITA	INCAPOMA	TANCARA		2000-01-01 00:00:00		9995052	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.302271	172.168.80.26/32	\N	\N	\N	\N
429	MELVY ADRIANA	NUÑEZ	GONZALES		2000-01-01 00:00:00		10008189	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.310612	172.168.80.26/32	\N	\N	\N	\N
430	RODRIGO	GARCIA	LUQUE		2000-01-01 00:00:00		11545040	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.319071	172.168.80.26/32	\N	\N	\N	\N
431	ANDREA ELIZABETH	RIOS	MALAGA		2000-01-01 00:00:00		6137760	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.32727	172.168.80.26/32	\N	\N	\N	\N
432	ENE	CONDORI	CHALCO		2000-01-01 00:00:00		9194520	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.335613	172.168.80.26/32	\N	\N	\N	\N
433	DIEGO	MAMANI	PEÑA		0001-01-01 00:00:00		7199454	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.343841	172.168.80.26/32	\N	\N	\N	\N
434	SERGIO YAMIL	ANDRADE	CALVIMONTES		0001-01-01 00:00:00		6095640	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.352251	172.168.80.26/32	\N	\N	\N	\N
435	MICHELLE	HERRERA	IBAÑEZ		0001-01-01 00:00:00		9784891	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.360606	172.168.80.26/32	\N	\N	\N	\N
436	ANA MERCEDES	HERBAS	MALDONADO		1993-12-11 00:00:00		7404346	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.377173	172.168.80.26/32	\N	\N	\N	\N
437	JHOVANNA BELEN	BETANZOS	MIGUEZ		1980-10-20 00:00:00		5490939	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.385548	172.168.80.26/32	\N	\N	\N	\N
438	SANDRA	CRUZ	CERRUTO		1986-06-25 00:00:00		5796940	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.393886	172.168.80.26/32	\N	\N	\N	\N
439	SANDRA ANA	CALLE	OCAMPO		1980-07-26 00:00:00		7112047	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.402212	172.168.80.26/32	\N	\N	\N	\N
440	ANDREA ENNITH	VELARDE	SALCEDO		2000-01-01 00:00:00		6755259	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.410571	172.168.80.26/32	\N	\N	\N	\N
441	JULY EDITH	FLORES	TORREZ		2000-01-01 00:00:00		5471616	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.418861	172.168.80.26/32	\N	\N	\N	\N
442	FERNANDO BORIS	COPANA	GUZMAN		\N		4306429	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.42719	172.168.80.26/32	\N	\N	\N	\N
443	STEPHANI ROCIO	ESCOBAR	YAÑEZ		0001-01-01 00:00:00		8369603	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.435741	172.168.80.26/32	\N	\N	\N	\N
444	RODRIGO	CORI	CRUZ		2000-01-01 00:00:00		123	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.443863	172.168.80.26/32	\N	\N	\N	\N
445	PEDRO SANTOS	BASCOPE	APAZA		2000-01-01 00:00:00		123	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.452207	172.168.80.26/32	\N	\N	\N	\N
446	LUCIA	SOLIZ	CRUZ		2000-01-01 00:00:00		8328148	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.460553	172.168.80.26/32	\N	\N	\N	\N
447	PAOLA ANDREA	MARCA	MARCO		2000-01-01 00:00:00		123	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.46894	172.168.80.26/32	\N	\N	\N	\N
448	ADRIANA FILY	PRADO	CARRANZA		2000-01-01 00:00:00		5954233	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.477304	172.168.80.26/32	\N	\N	\N	\N
449	GLADIS	TICONA	CAVIÑA		1994-02-05 00:00:00		8354380	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.504431	172.168.80.26/32	\N	\N	\N	\N
450	GLORIA	ESPINOZA	BALDERRAMA		0001-01-01 00:00:00		7911705	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.510565	172.168.80.26/32	\N	\N	\N	\N
451	ZOILO VENTURA	DOMINGUEZ	MOLINA		0001-01-01 00:00:00		3190569	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.51894	172.168.80.26/32	\N	\N	\N	\N
452	JAVIER	TRIGUERO	PAIRUMANI		0001-01-01 00:00:00		3350825	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.527286	172.168.80.26/32	\N	\N	\N	\N
453	JESUS DE MARIA  	TEJERINA	GARCIA		1979-04-11 00:00:00		5326608	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.535553	172.168.80.26/32	\N	\N	\N	\N
454	JOSE LUIS	BONILLA	CABRERA		1976-08-22 00:00:00		3878571	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.543932	172.168.80.26/32	\N	\N	\N	\N
455	CECILIA PAOLA	VIDAURRE	ARAMAYO		0001-01-01 00:00:00		7119107	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.55227	172.168.80.26/32	\N	\N	\N	\N
456	EDIL RODRIGO	MARCA	VIDAL		1984-08-02 00:00:00		6257306	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.567177	172.168.80.26/32	\N	\N	\N	\N
457	CRISTHIAN WALDO	AYALA	APAZA		0001-01-01 00:00:00		4057460	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.577262	172.168.80.26/32	\N	\N	\N	\N
458	ESTEFANY ANDREA	TERCEROS	ARZE		0001-01-01 00:00:00		12460751	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.585499	172.168.80.26/32	\N	\N	\N	\N
459	XIMENA CINTGHIA	JUAREZ	PEREIRA		0001-01-01 00:00:00		2206362	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.593841	172.168.80.26/32	\N	\N	\N	\N
460	CARLOS	ROCABADO	ZUAZO		1961-03-13 00:00:00		2478690	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.602197	172.168.80.26/32	\N	\N	\N	\N
461	JUANA	TORREZ	ARUQUIPA		1983-12-17 00:00:00		9138344	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.61884	172.168.80.26/32	\N	\N	\N	\N
462	LUIS ALBERTO	OSINAGA	GARCIA		0001-01-01 00:00:00		6382541	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.627212	172.168.80.26/32	\N	\N	\N	\N
463	CINDY	TERRAZAS	IBAÑEZ		1987-11-20 00:00:00		6897555	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.635489	172.168.80.26/32	\N	\N	\N	\N
464	MELANY BELEN 	PEREZ 	MONTAÑO		1990-12-05 00:00:00		10030163	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.643781	172.168.80.26/32	\N	\N	\N	\N
465	KATHY	RODRIGUEZ	HUDAZAN		1989-01-08 00:00:00		10780157	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.693927	172.168.80.26/32	\N	\N	\N	\N
466	ASTRID HILDA	AYALA	MARCO		2000-01-01 00:00:00		123	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.7021	172.168.80.26/32	\N	\N	\N	\N
467	RUTH JUDYTH 	MAMANI 	MARCA		2000-01-01 00:00:00		8344814	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.710515	172.168.80.26/32	\N	\N	\N	\N
468	RAUL FERNANDO	CUELLAR	ARANCIBIA		0001-01-01 00:00:00		7718135	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.718706	172.168.80.26/32	\N	\N	\N	\N
469	YOSET GABRIELA	ESPEJO	YAMPASI		\N		8342581	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.727137	172.168.80.26/32	\N	\N	\N	\N
470	JUAN PABLO	AGUILAR	FUENTES		1988-04-04 00:00:00		6322939	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.735546	172.168.80.26/32	\N	\N	\N	\N
471	OSCAR RODRIGO	LUNA	PEREZ		1988-08-03 00:00:00		6381545	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.743816	172.168.80.26/32	\N	\N	\N	\N
472	WEIMAR DANIEL	SOLARES	GONZALES		1986-03-06 00:00:00		6337555	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.752089	172.168.80.26/32	\N	\N	\N	\N
473	MARCOS	MUÑOZ	SIANCAS		1992-11-02 00:00:00		7996545	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.760635	172.168.80.26/32	\N	\N	\N	\N
474	ELMER	CLAROS	MOJICA		1992-11-30 00:00:00		8680422	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.768795	172.168.80.26/32	\N	\N	\N	\N
475	RICHARD	RAMOS	GUZMAN		0001-01-01 00:00:00		1885095	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.777161	172.168.80.26/32	\N	\N	\N	\N
476	ABRAHAM	GOMER	MENDOZA		1995-05-03 00:00:00		12903539	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.78543	172.168.80.26/32	\N	\N	\N	\N
477	YORKA	CONDORI	ZAPATA		1974-05-17 00:00:00		3117518	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.793815	172.168.80.26/32	\N	\N	\N	\N
478	GIOVANNY JOAQUIN 	ALMANZA 	UREY		1959-06-16 00:00:00		2323713	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.802049	172.168.80.26/32	\N	\N	\N	\N
479	ISRRAEL	FERNANDEZ	FERNANDEZ		1997-09-08 00:00:00		6908700	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.81051	172.168.80.26/32	\N	\N	\N	\N
480	ELIZABETH	BARRIOS	VEIZAGA		1995-03-27 00:00:00		9308884	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.818754	172.168.80.26/32	\N	\N	\N	\N
481	JOSE LUIS	MAMANI	SINCHI		1978-02-02 00:00:00		5940623	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.827176	172.168.80.26/32	\N	\N	\N	\N
482	JHONNY	JALLAZA	VELIZ		0001-01-01 00:00:00		5099186	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.835408	172.168.80.26/32	\N	\N	\N	\N
483	WARA MIKAELA	VARGAS	CHUQUIMIA		0001-01-01 00:00:00		8692189	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.843743	172.168.80.26/32	\N	\N	\N	\N
484	JUAN JOSE	AUCACHI	ORTEGA		1993-02-26 00:00:00		8074651	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.852074	172.168.80.26/32	\N	\N	\N	\N
485	TEODORA ERLINDA	BECERRA	PEREZ		1982-09-06 00:00:00		5292910	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.860382	172.168.80.26/32	\N	\N	\N	\N
486	EDITH	GUZMAN	MOJICA		1983-05-09 00:00:00		7778534	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.868758	172.168.80.26/32	\N	\N	\N	\N
487	REVECA	ROJAS	CAZAZOLA		1989-06-27 00:00:00		9608175	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.877147	172.168.80.26/32	\N	\N	\N	\N
488	ROGER HUGO	DAVILA	HELGUERO		1990-01-09 00:00:00		5971038	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.885413	172.168.80.26/32	\N	\N	\N	\N
489	CARMEN ADDALENA	GALARZA	ORDOÑEZ		1990-12-07 00:00:00		9019645	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.893727	172.168.80.26/32	\N	\N	\N	\N
490	EVELIN VICTORIA	PALLUCA	QUISPE		2001-11-23 00:00:00		7202569	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.902047	172.168.80.26/32	\N	\N	\N	\N
491	GELBER	BURGOA	CASTRO		1981-02-01 00:00:00		5788621	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.910482	172.168.80.26/32	\N	\N	\N	\N
492	ROSELVY	TORO	PEDRAZA		1997-08-15 00:00:00		10787771	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.918823	172.168.80.26/32	\N	\N	\N	\N
493	JHONATAN	HUALLPARA	GUARACHI		1992-11-25 00:00:00		6944064	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.927184	172.168.80.26/32	\N	\N	\N	\N
494	LOURDES	ENRIQUEZ	BLACUDT		1991-02-23 00:00:00		7509802	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.935441	172.168.80.26/32	\N	\N	\N	\N
495	JOSE REYNALDO	ORTIZ	UUALAMPA		0001-01-01 00:00:00		6572511	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.943817	172.168.80.26/32	\N	\N	\N	\N
496	DAVID GUSTAVO	BALDELOMAR	VALLEJOS		0001-01-01 00:00:00		4456885	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.952068	172.168.80.26/32	\N	\N	\N	\N
497	JUAN CARLOS	NOYA	VACA		0001-01-01 00:00:00		3600822	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.960473	172.168.80.26/32	\N	\N	\N	\N
498	FABIOLA MICLEY	LIMPIAS	CAPOBIANCO		1990-05-14 00:00:00		4213942	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.968734	172.168.80.26/32	\N	\N	\N	\N
499	OSCAR	RAFAEL	BARAHONA		1980-06-12 00:00:00		4039264	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.977044	172.168.80.26/32	\N	\N	\N	\N
500	CARLOS ENRIQUE	TICONA	CHAMBI		\N			\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.985442	172.168.80.26/32	\N	\N	\N	\N
501	LORENA	VARGAS	CHOQUE		1989-12-28 00:00:00		7222874	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:30.993795	172.168.80.26/32	\N	\N	\N	\N
502	CLAUDIA VERONICA	HIDALGO	VIRGO		1977-06-01 00:00:00		1939922	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.002095	172.168.80.26/32	\N	\N	\N	\N
503	DUBERTY	PORTUGAL	SUAREZ		\N		6738884	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.010533	172.168.80.26/32	\N	\N	\N	\N
504	NANCY	ROMERO	FLORES		1993-06-04 00:00:00		10307531	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.019437	172.168.80.26/32	\N	\N	\N	\N
505	GALA LIBERTAD	BUSTAMANTE	RIVERO		1991-10-22 00:00:00		5270823	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.027138	172.168.80.26/32	\N	\N	\N	\N
506	MARIA	GUERRERO	ORDOÑEZ		0001-01-01 00:00:00		7245347	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.035462	172.168.80.26/32	\N	\N	\N	\N
507	MIGUEL ORLANDO	 ORMACHEA 	GAMARRA		\N		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.043838	172.168.80.26/32	\N	\N	\N	\N
508	GUDNAR	FERNANDEZ	PANICA		1984-09-28 00:00:00		5789540	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.052332	172.168.80.26/32	\N	\N	\N	\N
509	ARNOLFO HERNAN	PUERTA	MORALES		1981-12-07 00:00:00		1765328	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.108336	172.168.80.26/32	\N	\N	\N	\N
510	JOSE ARTURO	GONZALES	BALLON		1984-12-07 00:00:00		5627871	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.118976	172.168.80.26/32	\N	\N	\N	\N
511	CECILIA ALEJANDRA	GUTIERREZ	RAMOS		1993-11-24 00:00:00		7182616	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.12715	172.168.80.26/32	\N	\N	\N	\N
512	CLAUDIO WILLANS	DAZA	MENDEZ		1989-04-13 00:00:00		6347296	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.13545	172.168.80.26/32	\N	\N	\N	\N
513	LENY MONICA	ALARCON	MINAYA		0001-01-01 00:00:00		4313412	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.143843	172.168.80.26/32	\N	\N	\N	\N
514	JIMY PEDRO	CONDORI	NINA		\N		4819178	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.152097	172.168.80.26/32	\N	\N	\N	\N
515	ANA STEPHANY	MONTAÑO	ESCALANTE		0001-01-01 00:00:00		5820596	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.160396	172.168.80.26/32	\N	\N	\N	\N
516	WILLY FAVIO	FLORES	CABRERA		0001-01-01 00:00:00		6234938	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.168768	172.168.80.26/32	\N	\N	\N	\N
517	REBECA	BARBOZA	ACHACOLLO		\N		8213591	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.177033	172.168.80.26/32	\N	\N	\N	\N
518	JAIRO	MAMIO	SUÁREZ		0001-01-01 00:00:00		4216384	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.185364	172.168.80.26/32	\N	\N	\N	\N
519	TANIA	VELA	GONZALES		0001-01-01 00:00:00		8911924	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.193693	172.168.80.26/32	\N	\N	\N	\N
520	ELSIER  	VILLARROEL	SANABRIA		\N		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.202059	172.168.80.26/32	\N	\N	\N	\N
521	LUIS ANTONIO	MONTAÑO	JANCO		\N		12	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.210457	172.168.80.26/32	\N	\N	\N	\N
522	MARGEL	RIBERA	CUELLAR		\N		3873986	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.218722	172.168.80.26/32	\N	\N	\N	\N
523	FABIOLA	PEREZ	FERNANDEZ		\N		3655261	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.227081	172.168.80.26/32	\N	\N	\N	\N
524	RAUL ANGEL	 PEÑARANDA 	CUENTAS		0001-01-01 00:00:00		6125310	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.235364	172.168.80.26/32	\N	\N	\N	\N
525	JULIAN SAMUEL	CALDERON	FERNANDEZ		0001-01-01 00:00:00		3551803	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.243755	172.168.80.26/32	\N	\N	\N	\N
526	DIEGO IVAN	COLQUE	CRUZ		\N		4566476	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.252152	172.168.80.26/32	\N	\N	\N	\N
527	OSCAR	VILLAROEL	APAZA		\N		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.260453	172.168.80.26/32	\N	\N	\N	\N
528	IVAN RUBEN	HUAYTA	QUISPE		\N		6154718	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.268756	172.168.80.26/32	\N	\N	\N	\N
529	RAFAEL ANGEL	MAMANI	MAYTA		\N		2351252	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.277077	172.168.80.26/32	\N	\N	\N	\N
530	HENRY	 BORGES 	ESCOBAR		\N		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.285362	172.168.80.26/32	\N	\N	\N	\N
531	SILVIA MAGDALENA	LLANOS	ESCOBAR		\N		4117129	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.29372	172.168.80.26/32	\N	\N	\N	\N
532	FAVIOLA PAOLA	HURTADO	L.		\N		4788329	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.302002	172.168.80.26/32	\N	\N	\N	\N
533	RENE	CONDORI	CHALCO		\N		9194520	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.310454	172.168.80.26/32	\N	\N	\N	\N
534	ROSARIO	MERY	QUISBERT		\N		4841036	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.318772	172.168.80.26/32	\N	\N	\N	\N
535	MARYANGELA	GUTIERREZ	 F.		0001-01-01 00:00:00		5967738	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.327072	172.168.80.26/32	\N	\N	\N	\N
536	ALFREDO	YANA	HUACANI		\N		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.335372	172.168.80.26/32	\N	\N	\N	\N
537	DAVID ISRAEL	MARIÑO	PEÑARANDA		\N		6750091	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.343678	172.168.80.26/32	\N	\N	\N	\N
538	NASSIME	ROSSEL	CABRERA		0001-01-01 00:00:00		9772076	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.352088	172.168.80.26/32	\N	\N	\N	\N
539	RILDA MABEL	 MORALES	MAGNE		0001-01-01 00:00:00		4999852	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.360585	172.168.80.26/32	\N	\N	\N	\N
540	EVER SANTOS	TELLEZ	ALVARADO		0001-01-01 00:00:00		5758363	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.368956	172.168.80.26/32	\N	\N	\N	\N
541	NAIROVY	CEDEÑO	GONZALES		1990-04-13 00:00:00		6221788	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.377264	172.168.80.26/32	\N	\N	\N	\N
542	PABLO DAVID	GUTIERREZ	RIBERA		0001-01-01 00:00:00		5421887	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.385456	172.168.80.26/32	\N	\N	\N	\N
543	FRANCISCO	LEON	JUSTINIANO		\N		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.393662	172.168.80.26/32	\N	\N	\N	\N
544	ROBERTO	 CRUZ 	MEJIA		\N		1855064	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.402012	172.168.80.26/32	\N	\N	\N	\N
545	PATRICIA NEIDA	RIOJA	LEON		0001-01-01 00:00:00		3425441	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.410372	172.168.80.26/32	\N	\N	\N	\N
546	JOSE ANTONIO	MELGAR	MELGAR		\N		7843069	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.418663	172.168.80.26/32	\N	\N	\N	\N
547	HERLAND	MOY	VIRI		\N		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.427019	172.168.80.26/32	\N	\N	\N	\N
548	ALEX	ROJAS	FLORES		1974-04-08 00:00:00		3930104	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.435403	172.168.80.26/32	\N	\N	\N	\N
549	FERNANDO WILFREDO	HURTADO	TARDIO		0001-01-01 00:00:00		4596775	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.44372	172.168.80.26/32	\N	\N	\N	\N
550	ALEXANDER	REVOLLO	SOLARES		0001-01-01 00:00:00		4189503	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.451975	172.168.80.26/32	\N	\N	\N	\N
551	MIRIAN	RIVERA	MIRANDA		\N		5807342	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.460428	172.168.80.26/32	\N	\N	\N	\N
552	ALEX ROMULO	POVEDA	LOAYZA		\N		5632564	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.468603	172.168.80.26/32	\N	\N	\N	\N
553	GUALBERTO	ORTIZ	GOLDSWORTHY		\N		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.583499	172.168.80.26/32	\N	\N	\N	\N
554	DORCAS	POLANCO	SUBELZA		0001-01-01 00:00:00		7108634	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.702318	172.168.80.26/32	\N	\N	\N	\N
555	GRECIA HELEN	VARGAS	QUISBERT		\N		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.733135	172.168.80.26/32	\N	\N	\N	\N
556	INDALECIO	RAMOS	QUISPE		\N		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.752096	172.168.80.26/32	\N	\N	\N	\N
557	MARIO CESAR	ALVAREZ	PATTY		\N		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.76643	172.168.80.26/32	\N	\N	\N	\N
558	JEIMMY CAROLA	ZENTENO	CALDERON		\N		5944305	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.777034	172.168.80.26/32	\N	\N	\N	\N
559	MAGDALENA	POIQUI	TOMICHA		1991-04-30 00:00:00		4689620	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.785349	172.168.80.26/32	\N	\N	\N	\N
560	MARIEL	SALVATIERRA	VIVEROS		1995-01-11 00:00:00		8990785	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.793662	172.168.80.26/32	\N	\N	\N	\N
561	LIZ ALEJANDRA	AGUAYO	VILLEGAS		1995-04-26 00:00:00		14155519	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:31.814767	172.168.80.26/32	\N	\N	\N	\N
562	OMAR	NINA	VALDEZ		1993-09-06 00:00:00		11107149	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:32.052306	172.168.80.26/32	\N	\N	\N	\N
563	FRANCISCO JAVIER	LEANDRO	APAZA		1993-12-12 00:00:00		7090436	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:32.074794	172.168.80.26/32	\N	\N	\N	\N
564	NORAH	QUISPE	MENDOZA		1978-04-04 00:00:00		4274401	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:32.08526	172.168.80.26/32	\N	\N	\N	\N
565	JUAN RICARDO	LLUSCO	CALLISAYA		1991-01-30 00:00:00		9188645	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:32.09363	172.168.80.26/32	\N	\N	\N	\N
566	CARLOS GABRIEL	MAYTA	ALARCON		2001-05-14 00:00:00		8053108	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:32.208172	172.168.80.26/32	\N	\N	\N	\N
567	AZUCARLOLA	PARRAGA	PATTY		1986-08-10 00:00:00		6942786	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:32.226957	172.168.80.26/32	\N	\N	\N	\N
568	ELMA AUGENIA	ALI	TICONA		1990-03-04 00:00:00		8422400	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:32.235227	172.168.80.26/32	\N	\N	\N	\N
569	OMAR	MAMANI	CHOQUE		1989-03-08 00:00:00		6994991	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:32.243511	172.168.80.26/32	\N	\N	\N	\N
570	PAULINA	LOPEZ	CHOQUE		1986-01-04 00:00:00		5773967	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:32.251858	172.168.80.26/32	\N	\N	\N	\N
571	JOSUE FELIPE	 MAYTA 	MAMANI		1994-05-01 00:00:00		8179934	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:32.26021	172.168.80.26/32	\N	\N	\N	\N
572	ALEJANDRO	SURUBI	ORTIZ		1987-02-12 00:00:00		9008663	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:32.268534	172.168.80.26/32	\N	\N	\N	\N
573	VENTANILLA	PLATAFORMA	LA PAZ		1990-01-01 00:00:00		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:32.299729	172.168.80.26/32	\N	\N	\N	\N
574	VENTANILLA	PLATAFORMA	SANTA CRUZ		1990-01-01 00:00:00		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:32.419193	172.168.80.26/32	\N	\N	\N	\N
575	VENTANILLA	PLATAFORMA	COCHABAMBA		1990-01-01 00:00:00		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:32.45017	172.168.80.26/32	\N	\N	\N	\N
576	VENTANILLA	PLATAFORMA	ORURO		1990-01-01 00:00:00		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:32.460778	172.168.80.26/32	\N	\N	\N	\N
577	VENTANILLA	PLATAFORMA	PANDO		1990-01-01 00:00:00		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:32.468933	172.168.80.26/32	\N	\N	\N	\N
578	VENTANILLA	PLATAFORMA	BENI		1990-01-01 00:00:00		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:32.583566	172.168.80.26/32	\N	\N	\N	\N
579	VENTANILLA	PLATAFORMA	TARIJA		1990-01-01 00:00:00		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:32.760804	172.168.80.26/32	\N	\N	\N	\N
580	VENTANILLA	PLATAFORMA	CHUQUISACA		1990-01-01 00:00:00		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:32.775186	172.168.80.26/32	\N	\N	\N	\N
581	VENTANILLA	PLATAFORMA	POTOSI		1990-01-01 00:00:00		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:32.891769	172.168.80.26/32	\N	\N	\N	\N
582	VENTANILLA	PLATAFORMA	SANTA CRUZ - VENTURA MALL		1990-01-01 00:00:00		0	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:32.960775	172.168.80.26/32	\N	\N	\N	\N
583	NOELIA LEONOR	BLANCO	TUCUPA		1993-11-06 00:00:00		8333468	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.033708	172.168.80.26/32	\N	\N	\N	\N
584	WILSON	OLIVA	LIMACHI		1993-10-11 00:00:00		9620926	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.043438	172.168.80.26/32	\N	\N	\N	\N
585	JUAN PABLO 	JAMACHI	QUISPE		1979-04-30 00:00:00		4809056	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.051815	172.168.80.26/32	\N	\N	\N	\N
586	SEBASTIAN MATIAS	PONCE	SUAREZ		2001-09-20 00:00:00		13204411	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.060795	172.168.80.26/32	\N	\N	\N	\N
587	CARLOS	MACHACA	 CHOQUE		1985-10-17 00:00:00		4061891	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.08521	172.168.80.26/32	\N	\N	\N	\N
588	ANDREA	CAMACHO	RAMIREZ		1988-05-03 00:00:00		8053557	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.093511	172.168.80.26/32	\N	\N	\N	\N
589	LUIS ARMANDO	NORIEGA	ROJAS		1983-10-06 00:00:00		4816440	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.101771	172.168.80.26/32	\N	\N	\N	\N
590	ROBERTO EDSON	CUSICANQUI	PEREZ		1985-04-24 00:00:00		4892643	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.110306	172.168.80.26/32	\N	\N	\N	\N
591	DANIEL JAVIER	VARGAS	PAILLO		1993-04-25 00:00:00		8446452	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.118397	172.168.80.26/32	\N	\N	\N	\N
592	YERKO JAVIER	ROJAS	INTURIAS		1991-11-12 00:00:00		5245320	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.126852	172.168.80.26/32	\N	\N	\N	\N
593	USUARIO	CONSULTAS PASAPORTE WS	MINGOB		1991-11-12 00:00:00		1	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.135103	172.168.80.26/32	\N	\N	\N	\N
594	RONALD HEBERTH	QUISPE	LAURA		1987-03-14 00:00:00		6062464	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.143491	172.168.80.26/32	\N	\N	\N	\N
595	GLORIA STEFANY	OVANDO	FLORES		1996-08-07 00:00:00		9014648	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.151725	172.168.80.26/32	\N	\N	\N	\N
596	DAIR ESTEBAN	SANTOS	PEREZ		1994-09-12 00:00:00		7840675	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.160212	172.168.80.26/32	\N	\N	\N	\N
597	GLADDYS	YUJRA	YUJRA		1985-07-24 00:00:00		6841292	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.16842	172.168.80.26/32	\N	\N	\N	\N
598	ALEJANDRO PEDRO	HUANCA	CONDORI		1982-02-09 00:00:00		5972350	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.176858	172.168.80.26/32	\N	\N	\N	\N
599	INGRID MAGDALENA	SALVATIERRA	MENCIAS		1982-07-22 00:00:00		3365130	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.185124	172.168.80.26/32	\N	\N	\N	\N
600	ARACELI	VALERO	MAMANI		1999-09-22 00:00:00		8181498	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.209995	172.168.80.26/32	\N	\N	\N	\N
601	SARAHI YESSENIA	CAYOJA	SALOMON		1998-03-21 00:00:00		13711242	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.218317	172.168.80.26/32	\N	\N	\N	\N
602	VERONICA	VARGAS	CORDERO		1992-09-11 00:00:00		8912194	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.226857	172.168.80.26/32	\N	\N	\N	\N
603	GEOVANNI MICHAEL	ANAYA	HUAYTA		1994-02-05 00:00:00		8070819	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.23503	172.168.80.26/32	\N	\N	\N	\N
604	BRYAN	ALVAREZ	PAZ		1996-05-28 00:00:00		8860025	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.243422	172.168.80.26/32	\N	\N	\N	\N
605	MIGUEL ANGEL	CHALCO	QUISPE		1990-02-21 00:00:00		8338242	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.251757	172.168.80.26/32	\N	\N	\N	\N
606	GABRIEL	CALLEJAS	RIOS		1998-07-05 00:00:00		9148445	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.26012	172.168.80.26/32	\N	\N	\N	\N
607	ELIAS	QUISPE	SUXO		1982-07-06 00:00:00		6004254	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.268257	172.168.80.26/32	\N	\N	\N	\N
608	LUIS OSCAR	OBLITAS	VARGAS		1986-10-07 00:00:00		6154542	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.276854	172.168.80.26/32	\N	\N	\N	\N
609	ANGELINES YESENIA	PINEDA	FLORES		1996-01-10 00:00:00		9983002	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.285061	172.168.80.26/32	\N	\N	\N	\N
610	JOSE ALVARO	TOLA	YARHUI		2000-03-19 00:00:00		12757756	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.29354	172.168.80.26/32	\N	\N	\N	\N
611	NORAH JHOVANA	ILLESCAS	VACA GUZMAN		1996-02-06 00:00:00		12503677	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.301707	172.168.80.26/32	\N	\N	\N	\N
612	MARLENE	FERNANDEZ	ORTEGA		1992-06-30 00:00:00		7817670	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.310219	172.168.80.26/32	\N	\N	\N	\N
613	FERNANDO	QUISBERT	NAVIA		1997-02-08 00:00:00		12475089	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.318481	172.168.80.26/32	\N	\N	\N	\N
614	LILIANA ANGELICA	CHOQUE	CALLEJAS		1992-07-18 00:00:00		9804328	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.326736	172.168.80.26/32	\N	\N	\N	\N
615	MARIO	PURI	CONDORI		1989-09-21 00:00:00		8936685	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.335149	172.168.80.26/32	\N	\N	\N	\N
616	JUDITH	NINA	CALDERON		1990-04-21 00:00:00		8907272	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.343483	172.168.80.26/32	\N	\N	\N	\N
617	MIGUEL ANGEL	VIDAL	ANDRADE		1996-06-27 00:00:00		8149709	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.35169	172.168.80.26/32	\N	\N	\N	\N
618	TANIA	MARTINEZ	CUBA		1993-12-26 00:00:00		9652517	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.360382	172.168.80.26/32	\N	\N	\N	\N
619	VICTOR ENRIQUE	QUINTANA	CASARRUBIA		1990-05-24 00:00:00		4592044	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.368376	172.168.80.26/32	\N	\N	\N	\N
620	VANESSA GEORGINA	HUANCA	NAVA		1995-05-04 00:00:00		9581252	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.37676	172.168.80.26/32	\N	\N	\N	\N
621	ROLANDO	YANIQUE	CESPEDES		1987-10-11 00:00:00		6872803	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.384878	172.168.80.26/32	\N	\N	\N	\N
622	EDSON GUSTAVO	SALAZAR	LIMA		1993-06-05 00:00:00		8354297	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.393403	172.168.80.26/32	\N	\N	\N	\N
623	NEIL VLADIMIR	OVALLE	BUSTILLOS		1991-03-13 00:00:00		4910813	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.401696	172.168.80.26/32	\N	\N	\N	\N
624	SAUL	PEÑALOZA	EYZAGUIRRE		1986-02-05 00:00:00		5868310	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.410201	172.168.80.26/32	\N	\N	\N	\N
625	NOEMI MILENKA	VEGA	CHUQUIMIA		1999-03-05 00:00:00		10634232	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.418511	172.168.80.26/32	\N	\N	\N	\N
626	ANA MARIA	QUISPE	CHOQUE		2002-01-12 00:00:00		13920200	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.45981	172.168.80.26/32	\N	\N	\N	\N
627	LUIS FERNANDO	TORREZ	LEDEZMA		1980-07-14 00:00:00		4300890	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.576544	172.168.80.26/32	\N	\N	\N	\N
628	FREDDY ALEJANDRO	FLORES	RAMOS		1982-06-28 00:00:00		3444743	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.716396	172.168.80.26/32	\N	\N	\N	\N
629	ENRIQUE VIDAL	POMA	MONASTERIOS		1990-11-04 00:00:00		6754093	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.726259	172.168.80.26/32	\N	\N	\N	\N
630	RAMBER	GOMEZ	CLAROS		1990-09-25 00:00:00		8219247	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.734561	172.168.80.26/32	\N	\N	\N	\N
631	CARLA MARIA	ALVAREZ	ALDANA		1991-04-01 00:00:00		6686613	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.742844	172.168.80.26/32	\N	\N	\N	\N
632	SOLEMNIO	CONDORI	JIMENEZ		\N		5928622	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.751108	172.168.80.26/32	\N	\N	\N	\N
633	DAVID	BOLIVAR	CABELLO		0001-01-01 00:00:00		5539605	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.759461	172.168.80.26/32	\N	\N	\N	\N
634	JUANA	MARIA	LOPEZ		1981-05-17 00:00:00		4093477	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.767979	172.168.80.26/32	\N	\N	\N	\N
635	ALONDRA NICOLE	PALOMINO	AYARACHI		1997-04-06 00:00:00		10529831	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.776131	172.168.80.26/32	\N	\N	\N	\N
636	LIDIA	GUZMAN	 VIA		\N		2725659	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.784482	172.168.80.26/32	\N	\N	\N	\N
637	ANDREA	MIRANDA	SOSA		0001-01-01 00:00:00		7636138	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.793068	172.168.80.26/32	\N	\N	\N	\N
639	EDDY MARCELO	TARQUI	QUISPE		\N		4962266	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.809407	172.168.80.26/32	\N	\N	\N	\N
640	IVAN	FLORES	FLORES		1987-11-05 00:00:00		6645278	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.817708	172.168.80.26/32	\N	\N	\N	\N
641	MIGUEL COSME	POMA	CAUNALLA		1993-09-28 00:00:00		12449857	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.826136	172.168.80.26/32	\N	\N	\N	\N
642	EDMAR JOSUE	PALACIOS	QUISPE		1992-11-27 00:00:00		8342572	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.834347	172.168.80.26/32	\N	\N	\N	\N
638	OVIDIO ARMENGOL	HUANCA	QUISPE		1980-04-27 00:00:00		\N	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.80118	172.168.80.26/32	postgres	2022-07-29 12:41:20.454739	172.168.80.26/32	\N
652	EDSON CANCI	CANCILLERIA	PRUEBA	\N	2022-08-12 15:25:27	\N	123654789	M	\N	\N	\N	\N	\N	1	postgres	2022-08-12 19:21:43.582266	172.168.80.19/32	postgres	2022-08-12 20:48:27.78214	172.168.80.19/32	2
643	EDSON VLADIMIR	SOSA	SACARI		1988-06-07 00:00:00		6906104	\N	\N	\N	\N	\N	\N	1	postgres	2022-07-29 12:40:33.842795	172.168.80.26/32	postgres	2022-08-12 20:48:27.78214	172.168.80.19/32	1
653	PRUEBA CANCI	CANCILLERIA	CANCILLERIA		1988-07-05 20:00:00	CI	369852147	M	Bolivia	avenida 5 N 777-A	cancilleria@gmail.com	\N	\N	1	postgres	2022-08-15 10:32:11.574163	172.168.80.19/32	\N	\N	\N	2
654	JUAN PRUEBA	CANCILLERIA	CANCILLERIA		1988-07-05 20:00:00	CI	12449834	M	Bolivia	avenida 5 N 777-A	canci@gmail.com	\N	\N	1	postgres	2022-08-15 15:24:50.350173	172.168.80.19/32	\N	\N	\N	1
\.


--
-- Data for Name: rol; Type: TABLE DATA; Schema: seguridad_v2; Owner: postgres
--

COPY seguridad_v2.rol (id_rol, cod_rol, rol, descripcion, estado_registro, usuario_reg, fecha_reg, host_reg, usuario_mod, fecha_mod, host_mod) FROM stdin;
2	SUP	SUPERVIDOR	\N	1	postgres	2022-07-28 12:35:36.850791	172.168.80.26/32	\N	\N	\N
3	OPE	OPERADOR	\N	1	postgres	2022-07-28 12:35:53.445914	172.168.80.26/32	\N	\N	\N
1	ADM	ADMINISTRADOR	\N	1	postgres	2022-07-28 12:35:22.742131	172.168.80.26/32	postgres	2022-07-28 12:36:11.940898	172.168.80.26/32
4	CON	CONSULTAS	\N	1	postgres	2022-07-29 12:53:10.54444	172.168.80.26/32	\N	\N	\N
\.


--
-- Data for Name: rol_modulos; Type: TABLE DATA; Schema: seguridad_v2; Owner: postgres
--

COPY seguridad_v2.rol_modulos (id_rol_modulo, id_modulo, id_rol, estado_registro, usuario_reg, fecha_reg, host_reg, usuario_mod, fecha_mod, host_mod) FROM stdin;
\.


--
-- Data for Name: sistemas; Type: TABLE DATA; Schema: seguridad_v2; Owner: postgres
--

COPY seguridad_v2.sistemas (id_sistema, cod_sistema, nombre, descripcion, estado_registro, usuario_reg, fecha_reg, host_reg, usuario_mod, fecha_mod, host_mod, cliente) FROM stdin;
17	SER	SERVICIOS EXTERNOS	SERVICIOS EXTERNOS	1	postgres	2022-08-08 14:14:44.893903	172.168.80.19/32	postgres	2022-08-08 18:00:31.825064	172.168.80.19/32	M-e/Ru$}3wWeX%$81&uU
4	INV	INVENPAS	SISTEMA DE INVENTARIOS DE PASAPORTES	1	postgres	2022-07-28 11:57:58.169176	172.168.80.26/32	postgres	2022-08-08 18:26:32.728556	172.168.80.19/32	B-Ou[[r8ReSfU:mr|651
18	ADM	ADMINISTRADOR	ADMINISTRADOR DE LOS SISTEMAS	1	postgres	2022-08-15 13:14:49.869561	172.168.80.19/32	postgres	2022-08-15 13:17:19.706964	172.168.80.19/32	A-$0$1HLMN2/Qw:L1Nux
11	CMX	CONSULTAS MEXICO	CONSULTAS MEXICO	1	postgres	2022-07-28 11:57:58.227576	172.168.80.26/32	postgres	2022-07-28 12:11:20.004297	172.168.80.26/32	\N
12	CON	SICOMIG	SISTEMA DE CONSULTAS	1	postgres	2022-07-28 12:17:49.603063	172.168.80.26/32	\N	\N	\N	\N
1	SOP	SOPORTE	SISTEMA DE SOPORTE DE DESARROLLO	1	postgres	2022-07-28 11:57:57.988954	172.168.80.26/32	postgres	2022-07-28 12:17:49.66986	172.168.80.26/32	\N
2	SIE	SIEM	SITEMA DE ESTADISTICAS	1	postgres	2022-07-28 11:57:58.017326	172.168.80.26/32	postgres	2022-07-28 12:17:49.680381	172.168.80.26/32	\N
3	SIT	SITRAM	SISTEMA DE TRAMITES	1	postgres	2022-07-28 11:57:58.160866	172.168.80.26/32	postgres	2022-07-28 12:17:49.688701	172.168.80.26/32	\N
5	JUR	JURIDICA	SISTEMA DE JURIDICA	1	postgres	2022-07-28 11:57:58.177411	172.168.80.26/32	postgres	2022-07-28 12:17:49.845024	172.168.80.26/32	\N
6	SIC	SICOF	SISTEMA DE CONTROL MIGRATORIO	1	postgres	2022-07-28 11:57:58.185775	172.168.80.26/32	postgres	2022-07-28 12:17:49.855814	172.168.80.26/32	\N
7	ACT	ACTIVOS	SISTEMA DE ACTIVOS DE LA INSTITUCION	1	postgres	2022-07-28 11:57:58.19411	172.168.80.26/32	postgres	2022-07-28 12:17:49.864613	172.168.80.26/32	\N
8	SIO	SIOS	SISTEMA DE INSPECCION Y OPERATIVOS	1	postgres	2022-07-28 11:57:58.202657	172.168.80.26/32	postgres	2022-07-28 12:17:49.871935	172.168.80.26/32	\N
9	CEN	CENSO	SISTEMA DE CENSO	1	postgres	2022-07-28 11:57:58.210682	172.168.80.26/32	postgres	2022-07-28 12:17:49.880649	172.168.80.26/32	\N
10	SIA	SIAF	SISTEMA DE ATENCION DE FICHAS	1	postgres	2022-07-28 11:57:58.219193	172.168.80.26/32	postgres	2022-07-28 12:17:49.88907	172.168.80.26/32	\N
13	ALT	ALERTAS	SISTEMA DE ALERTAS MIGRATORIAS	1	postgres	2022-07-28 12:19:29.03469	172.168.80.26/32	\N	\N	\N	\N
14	SIG	SIGET	SISTEMA DE GESTION DE TRAMITES	1	postgres	2022-07-28 12:19:29.061496	172.168.80.26/32	\N	\N	\N	\N
15	SIF	SIGET FRONTERIZO	SISTEMA DE GESTION DE TRAMITES FRONTERIZO	1	postgres	2022-07-28 12:20:25.368785	172.168.80.26/32	\N	\N	\N	\N
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: seguridad_v2; Owner: postgres
--

COPY seguridad_v2.usuario (id_usuario, id_persona, usuario, password, estado_registro, usuario_reg, fecha_reg, host_reg, usuario_mod, fecha_mod, host_mod, id_oficina, id_entidad) FROM stdin;
1	1	GLOPEZ	$2b$10$2PdlKrH7aqP08GI01UAokO.cvykf7XeIc/kLOrzAg7r34Lthx3idK	1	postgres	2022-07-29 12:47:07.549377	172.168.80.26/32	\N	\N	\N	\N	\N
2	2	CARAOZ	$2b$10$iXSI7hS56OZ3be8vFN9PDusG9I2j5849jvZNwD.XTcdYSWWHIgPK6	1	postgres	2022-07-29 12:47:07.559989	172.168.80.26/32	\N	\N	\N	\N	\N
3	3	DINGALI	$2b$10$BuXoxPE0tfoQr923YjmNjupyniXRYUNQx4pyGZjcSNaTxJJi/RWUe	1	postgres	2022-07-29 12:47:07.571511	172.168.80.26/32	\N	\N	\N	\N	\N
4	4	SCHAMBI2	$2b$10$7OUV2nakjC6vw8gMZzpB4urLF0e0J1hMwiOBXgxSwHp6YVIDvoVPO	1	postgres	2022-07-29 12:47:07.581465	172.168.80.26/32	\N	\N	\N	\N	\N
5	5	SVARGAS	$2b$10$R/tYS1FAmIRSMaupPlv.m.DAsePbYklV6BIsT629HNijUbjamIUB6	1	postgres	2022-07-29 12:47:07.601565	172.168.80.26/32	\N	\N	\N	\N	\N
6	6	HARELLANO	$2b$10$XAg/iy1IK6C.dL4Gwksis.hvnEIhJ0jAx81uv5lwEg0tHbpmrRDc2	1	postgres	2022-07-29 12:47:07.609928	172.168.80.26/32	\N	\N	\N	\N	\N
7	7	VTORRES	$2b$10$Yva6DVoVH8mdm.z2q3tOLumxZiQB6QFdLXFs/eNmzqxyUzGpoQLvO	1	postgres	2022-07-29 12:47:07.618459	172.168.80.26/32	\N	\N	\N	\N	\N
8	8	SQUISPE2	$2b$10$Uv1Uv.VNmXbJ5flBetBnNOMNQ8bmbgx4PFyj9dAjH6ml7Jxpb9ojy	1	postgres	2022-07-29 12:47:07.626697	172.168.80.26/32	\N	\N	\N	\N	\N
9	9	EDIAZ	$2b$10$K3FIi/CsglbQ84O.HdDt3e0teD2N2A8thKlgAjTfTAkNWYoYLhcyG	1	postgres	2022-07-29 12:47:07.635105	172.168.80.26/32	\N	\N	\N	\N	\N
10	10	MJAIME	$2b$10$J4NkKokMBPFFdpEhQbuZN.TKlx6cb4mQQwXDgg8jVb.cL7mU7iXe2	1	postgres	2022-07-29 12:47:07.64342	172.168.80.26/32	\N	\N	\N	\N	\N
11	11	MAVE	$2b$10$znjmqTwkzSPiSMMumredEevglRPZcG8Qa3G9Dy/R/TJF4JOiYgC/m	1	postgres	2022-07-29 12:47:07.651924	172.168.80.26/32	\N	\N	\N	\N	\N
12	12	HIGNACIO	$2b$10$unxb1qNxMyIXr7P6.W/MXe1wY3uQBMifn1tFzHepmJTr3DNb4sbvC	1	postgres	2022-07-29 12:47:07.660134	172.168.80.26/32	\N	\N	\N	\N	\N
13	13	KAGUILAR	$2b$10$O55ffW6VeZkJ.lvv2jkAhemElktVEL4kHZbHrBNQNl27AgvPwTZae	1	postgres	2022-07-29 12:47:07.6687	172.168.80.26/32	\N	\N	\N	\N	\N
14	14	OPINTO	$2b$10$v1XSgiZzU9XtPLgqvKuQtOrGSUESlWevDWZiEe0bQhqcpYdfrQCIa	1	postgres	2022-07-29 12:47:07.681924	172.168.80.26/32	\N	\N	\N	\N	\N
15	15	GESCOBAR	$2b$10$I6VqS73MljHibcYxVv47Gu2Rk/DFm2IZed1/CvbSKiBP15tHf92rq	1	postgres	2022-07-29 12:47:07.700548	172.168.80.26/32	\N	\N	\N	\N	\N
16	16	MBRAVO	$2b$10$/UD47KLGuGpkfIQJcQjhYOoxQDw5lw/V5jy9DVB4hY2MDjjeDROce	1	postgres	2022-07-29 12:47:07.711854	172.168.80.26/32	\N	\N	\N	\N	\N
17	17	JSUNTURA	$2b$10$3eOKm.rWfZZiWkh5/ueOTONB0llpnR.dpjh78Ygk8n5rTcd48ShL2	1	postgres	2022-07-29 12:47:07.718675	172.168.80.26/32	\N	\N	\N	\N	\N
18	18	LSORIA	$2b$10$/svjMo38sLNCp.xkdqam0eANQlzlY7YhnZ/p5e1cv1Rn91c/2Eex6	1	postgres	2022-07-29 12:47:07.751476	172.168.80.26/32	\N	\N	\N	\N	\N
19	19	AFUENTES	$2b$10$iRYEy1ZA9VI8CswSqDCr6.uYZfY3ZAQsDi.5tXryHx84guHHV2Jhq	1	postgres	2022-07-29 12:47:07.760105	172.168.80.26/32	\N	\N	\N	\N	\N
20	20	AZENTENO	$2b$10$koahVbfud26EsyJeEX9HneVlMWqblEiov/wkfq5Oms5PQ7URg/ZIm	1	postgres	2022-07-29 12:47:07.768709	172.168.80.26/32	\N	\N	\N	\N	\N
21	21	CTERRAZAS	$2b$10$m5F1rhdR/88xE9PwU5wRJOctpZpL7Trt4Hdhqxq8USS7dqwEyjVFK	1	postgres	2022-07-29 12:47:07.776903	172.168.80.26/32	\N	\N	\N	\N	\N
22	22	PCHIPANA	$2b$10$6EAuvpnmyM4EpmhseHFcz.6M2jqoZcrVBHxnnjtudFBRLtCqm/OUG	1	postgres	2022-07-29 12:47:07.893768	172.168.80.26/32	\N	\N	\N	\N	\N
23	23	MQUISPE23	$2b$10$NuBZfi26eMbBLySWFGeMDetjKiMAjfR5M3.URlgLFBkBjU3rpOjG6	1	postgres	2022-07-29 12:47:07.90219	172.168.80.26/32	\N	\N	\N	\N	\N
24	24	ACACERES	$2b$10$yoHGIjH6bobJwwlBTE9I5O/AeB6arv.6eMc0b6M9WYe.sMrN0v3H6	1	postgres	2022-07-29 12:47:07.910157	172.168.80.26/32	\N	\N	\N	\N	\N
25	25	JCERVANTES	$2b$10$UhRXnv2WafL7TjD16K1EaO4YBOQEEwxMRhzIg/ghek.bGfh8QBAAe	1	postgres	2022-07-29 12:47:07.918648	172.168.80.26/32	\N	\N	\N	\N	\N
26	26	DCONDORI	$2b$10$LyuWZm.ukMSZLxwiw29VK.2s7Y0rg5fSZqEEJXHG63SFrH/.c7NHW	1	postgres	2022-07-29 12:47:07.926847	172.168.80.26/32	\N	\N	\N	\N	\N
27	27	EROSAS	$2b$10$.0f9L5NaHmAxa2hWD75NUOqFuaOPif1NMWOYMShjJNgxYss0AOIfK	1	postgres	2022-07-29 12:47:07.935446	172.168.80.26/32	\N	\N	\N	\N	\N
28	28	CZUBIETA	$2b$10$BpXNwocdrHuO0rvjQiStGeeiLUAtHxmWPkJhHYBN0QjeumspmnrEq	1	postgres	2022-07-29 12:47:07.943534	172.168.80.26/32	\N	\N	\N	\N	\N
29	29	JOJEDA	$2b$10$rIbqhXEvKSFvgGoY4U7y/uSef2QGxWA1Yqnkwk5ToPw1t7a15tWE6	1	postgres	2022-07-29 12:47:07.952253	172.168.80.26/32	\N	\N	\N	\N	\N
30	30	JQUISPE2	$2b$10$bhoeE8BrvpcC3v1H5DGq0OqqPanp1uItiZREjYpCqNoMvZ54UBgzS	1	postgres	2022-07-29 12:47:07.960218	172.168.80.26/32	\N	\N	\N	\N	\N
31	31	GHERBAS	$2b$10$6qyP/qUcoARRa07kTOjMHe2MhdvN.BhCifBblkxSy6ttBMiyr7bG.	1	postgres	2022-07-29 12:47:07.968761	172.168.80.26/32	\N	\N	\N	\N	\N
32	32	PLOPEZ	$2b$10$IdVyvXVWHu.2Vk6LiirEl.6pZZefsTHDSJE6rIxNvjrylmYL1cwEK	1	postgres	2022-07-29 12:47:07.977038	172.168.80.26/32	\N	\N	\N	\N	\N
33	33	LMORALES	$2b$10$oVD.UdHMFu8QsBybD8Wnz.ZmoODU29Ir852jJgCfKc6TxT1HKQvRO	1	postgres	2022-07-29 12:47:07.985298	172.168.80.26/32	\N	\N	\N	\N	\N
34	34	EENCINAS	$2b$10$lCEqYcrNSE1M4ouY47v9fuM/M60tTdQC1r2z3sZyYoB4v7Nxxd2Ty	1	postgres	2022-07-29 12:47:07.993678	172.168.80.26/32	\N	\N	\N	\N	\N
35	35	GPARDO	$2b$10$LDMXKvV.SwobBC6KO4Xy6.ZQi4OPnE/9oFXLsgsBCl0fyUL/N9DJK	1	postgres	2022-07-29 12:47:08.001893	172.168.80.26/32	\N	\N	\N	\N	\N
36	36	FTELLEZ	$2b$10$I.NM2sfLB6uPFQLH7.5jV.fZedVKLzRqCkXwCAFZkCqNi350EtlIO	1	postgres	2022-07-29 12:47:08.010321	172.168.80.26/32	\N	\N	\N	\N	\N
37	37	RFRANCO	$2b$10$IO6KuYMsXUfj1egkN2o/N.ASbbihmfAiYNUwwj8ylfQIOEYgRugIC	1	postgres	2022-07-29 12:47:08.019041	172.168.80.26/32	\N	\N	\N	\N	\N
38	38	BQUIROGA	$2b$10$xf8tTzHJigRbiO892MjArel2Yj4lNTmfgr8g4ybh8ndDxE9fvWzWq	1	postgres	2022-07-29 12:47:08.027131	172.168.80.26/32	\N	\N	\N	\N	\N
39	39	JCONDORI23	$2b$10$lr99PPGEnU2BSTSmLG2PTucDB6GfTxCblAZSuZpn7Z3SceYvCoFqi	1	postgres	2022-07-29 12:47:08.035682	172.168.80.26/32	\N	\N	\N	\N	\N
40	40	RSUEIRO	$2b$10$fAVKKnM50oaE7Ga6od0GD.uIbxrfMsI0BqBR/B1XurV9UbpIq8g2u	1	postgres	2022-07-29 12:47:08.043825	172.168.80.26/32	\N	\N	\N	\N	\N
41	41	YJUSTINIANO	$2b$10$mE5sEiQ17/IljR0Csc.ZIOARJS3f89gseEnSgKmZW43IKiAn308KK	1	postgres	2022-07-29 12:47:08.052083	172.168.80.26/32	\N	\N	\N	\N	\N
42	42	MTABOADA2	$2b$10$TkZp84.Wg9HHMxjMawPyeeHOBPoUBvX5B8/T39htgJYrE7.gMB/uS	1	postgres	2022-07-29 12:47:08.060577	172.168.80.26/32	\N	\N	\N	\N	\N
43	43	JVARGAS	$2b$10$Tf/.7F5kc4HOaPUa7hvNYeJ5QbDuZw6tdWifwYSwlzWkXm2G2p9g6	1	postgres	2022-07-29 12:47:08.085497	172.168.80.26/32	\N	\N	\N	\N	\N
44	44	IPATZI	$2b$10$fdNzLEm0B8TeXh5Mmz7TE.44PBo6ckvvQQ.MKxsDPiudIK.q0Ran6	1	postgres	2022-07-29 12:47:08.093907	172.168.80.26/32	\N	\N	\N	\N	\N
45	45	ACALIZAYA	$2b$10$X.jeTAQ2ZjksCmGBYANbqOy0AoLzei1BzQq/pwpoktROo898mVqI6	1	postgres	2022-07-29 12:47:08.10212	172.168.80.26/32	\N	\N	\N	\N	\N
46	46	AHUMEREZ	$2b$10$6kCi0AFYpOq1s/YC52Rr.OOMAI.U0mF2xmA5HIpF1nsnw..Y44pP.	1	postgres	2022-07-29 12:47:08.110455	172.168.80.26/32	\N	\N	\N	\N	\N
47	47	MSOTO2	$2b$10$1ZXAEtBhoICjItG.nnZVv.AXNKCXuuO6.1KpKFfHv82pF/Hs1OR3e	1	postgres	2022-07-29 12:47:08.118943	172.168.80.26/32	\N	\N	\N	\N	\N
48	48	FARATA	$2b$10$DdlkWtjFBKZJFLgHgB3E2OFB.RXON3uc/cpS4IZHKB6mMX7R9.9Dm	1	postgres	2022-07-29 12:47:08.137161	172.168.80.26/32	\N	\N	\N	\N	\N
49	49	JMENDEZ	$2b$10$NV0CcG2i/LCGHwVQ78vfy.PWqlCGpq3OJEa9Hlby/KT2V9XZBjTWm	1	postgres	2022-07-29 12:47:08.145439	172.168.80.26/32	\N	\N	\N	\N	\N
50	50	JRAMIREZ2	$2b$10$DHdTjxO36Jt0fLCp32upP.Z0OfI9WTvx714Yd7ocA.52pjYOVyXRS	1	postgres	2022-07-29 12:47:08.153868	172.168.80.26/32	\N	\N	\N	\N	\N
51	51	APEREDO	$2b$10$SJaWBdL.cDIZP2YRPIOAdOiw0JOTFQ7cIdAlwRLpBptNaRYLheAPq	1	postgres	2022-07-29 12:47:08.162043	172.168.80.26/32	\N	\N	\N	\N	\N
52	52	AMIRANDA2	$2b$10$AngLakH8R/ToHcCaRtjmJeTS3XaWz39rRtOJN1xugTsKHMmNWS6T2	1	postgres	2022-07-29 12:47:08.170613	172.168.80.26/32	\N	\N	\N	\N	\N
53	53	APANDO	$2b$10$SgxlTAfmZiLJzZqu6l8yLeLvehuWhd1lh1LL7Wq0kl0.OHU9B3uae	1	postgres	2022-07-29 12:47:08.178844	172.168.80.26/32	\N	\N	\N	\N	\N
54	54	JOLGUIN	$2b$10$EH7y7tDDcbQ/U57ClhJ7z.dIcV4sgAZZn9kdWA5YuyNzn.CYXTAsO	1	postgres	2022-07-29 12:47:08.187515	172.168.80.26/32	\N	\N	\N	\N	\N
55	55	VAGUIRRE	$2b$10$q1rO25aPaYQ.2BMCMjnWtuS6hGtD0xpcHW50CRUQgs2BPf79uuhGm	1	postgres	2022-07-29 12:47:08.218085	172.168.80.26/32	\N	\N	\N	\N	\N
56	56	GSERRUDO	$2b$10$RWndc9PSE0H08pOBDa3aYef4XWI96iT3hkNkzbTD2dLpspiU5JXfu	1	postgres	2022-07-29 12:47:08.229117	172.168.80.26/32	\N	\N	\N	\N	\N
57	57	RBECERRA	$2b$10$G08keoeGq6O9Ti6o5edjYecTTHgS6HqK73YRdG4FDNsumAhrVy2zu	1	postgres	2022-07-29 12:47:08.237139	172.168.80.26/32	\N	\N	\N	\N	\N
58	58	FBELLOT	$2b$10$8zBtENCt7HyS.jnpibs5aeWmxttht0oaWJtBWYxcka5MKwIzggeBS	1	postgres	2022-07-29 12:47:08.245412	172.168.80.26/32	\N	\N	\N	\N	\N
59	59	MROCA2	$2b$10$uAjjvy6hm/1wdWUJd16.mOLZX/n0.8Hg9flP8ZkKBqlil46T6PUT.	1	postgres	2022-07-29 12:47:08.253612	172.168.80.26/32	\N	\N	\N	\N	\N
60	60	JZEBALLOS	$2b$10$uVO77zpOskCbT7.2ye07XOb7Q1z7qIQPzWSJlC5SP5ebx7E3iaxYi	1	postgres	2022-07-29 12:47:08.261974	172.168.80.26/32	\N	\N	\N	\N	\N
61	61	JLEAÑO	$2b$10$BJlFTga/hM7EyJCBFj4QqulVLTHiDQwOJDY9Ya3Go6RV4mTKq2rXO	1	postgres	2022-07-29 12:47:08.270607	172.168.80.26/32	\N	\N	\N	\N	\N
62	62	AHUANCA	$2b$10$FAbfrFFpT3pmtGLvSe2wnOU8x7Vva9MpyZyyayR1.B34lXvTtxWtm	1	postgres	2022-07-29 12:47:08.278821	172.168.80.26/32	\N	\N	\N	\N	\N
63	63	SMEDINACELI	$2b$10$zCtpmdPnwecW.qAxaEMU4.JWTAH4YKOhfFhHu9t3WWvSv7iqpHzNu	1	postgres	2022-07-29 12:47:08.287374	172.168.80.26/32	\N	\N	\N	\N	\N
64	64	PCLAROS	$2b$10$pIz5VDgtFWAVsmsnY.pbVeZdWMATm0n.uVmziCw1QImrZmDDmLh5K	1	postgres	2022-07-29 12:47:08.295463	172.168.80.26/32	\N	\N	\N	\N	\N
65	65	JPEREDO	$2b$10$xehTczmd8AwIqvwr.EqS/u67KEFSg0va4y.yj8i7NQE/XlUh1TqQS	1	postgres	2022-07-29 12:47:08.30375	172.168.80.26/32	\N	\N	\N	\N	\N
66	66	LHUARACHI	$2b$10$.TRT9.Zwa9m0lTRFWyjPDuwR3KsxSA3OKJBfoxfDPRmtMIDcetQiy	1	postgres	2022-07-29 12:47:08.312108	172.168.80.26/32	\N	\N	\N	\N	\N
67	67	PLACOA	$2b$10$YfXBI9swJQc6HRU4mlTDO.GZEi0UhhTIR61ljsZR2D8nH.tvi0JHy	1	postgres	2022-07-29 12:47:08.320849	172.168.80.26/32	\N	\N	\N	\N	\N
68	68	VCORDERO	$2b$10$aXqGXKOhjlz6JSCUyFYAvu2C5qJEEXOXvJ9UlBDJ0KT/MIilp04Ta	1	postgres	2022-07-29 12:47:08.337326	172.168.80.26/32	\N	\N	\N	\N	\N
69	69	CWILLIS	$2b$10$lDEnooHqjN6syDCHSBNf7ejzaJQjMFsPbeUrc3YrbdgLTr0YqSm4q	1	postgres	2022-07-29 12:47:08.345415	172.168.80.26/32	\N	\N	\N	\N	\N
70	70	WRODRIGUEZ2	$2b$10$pKdVqWxE2kJ4j1yj35zoquX1Q11scKe74OaBD1vYAkvVdb./PMJ0G	1	postgres	2022-07-29 12:47:08.353751	172.168.80.26/32	\N	\N	\N	\N	\N
71	71	MCAMPOS	$2b$10$QgSsOsuTh8wBh9gA9MPHQOsRV4gDCjN5Og32VQLwZip9gUpNC2y1.	1	postgres	2022-07-29 12:47:08.362167	172.168.80.26/32	\N	\N	\N	\N	\N
72	72	DSUAREZ2	$2b$10$4bAGef1TiVoi5SmovUcfW.Yr7xl8AYSGXmAqM40OetFlKIDlG9FdC	1	postgres	2022-07-29 12:47:08.370409	172.168.80.26/32	\N	\N	\N	\N	\N
73	73	CMAMANI2	$2b$10$oij9Q6qKO/bonJdJ9JbcOOEmZH17Vw9HaRzSX3eYuDeY5ieeaulE6	1	postgres	2022-07-29 12:47:08.378597	172.168.80.26/32	\N	\N	\N	\N	\N
74	74	EREVOLLO	$2b$10$0bTQQVaBhJXh6Ag25yPcA.38aEWB4Y5mzApnmNMdBqjqsF4rXv6Rm	1	postgres	2022-07-29 12:47:08.387	172.168.80.26/32	\N	\N	\N	\N	\N
75	75	MBAUER	$2b$10$X3OopAmfFf1ZurScjoOMue2FwsFSOHg7uZ.9QpYxuKOy.lqrBOgK2	1	postgres	2022-07-29 12:47:08.395473	172.168.80.26/32	\N	\N	\N	\N	\N
76	76	RMONTECINOS	$2b$10$F5souj3/SnfcmPLEP7RzIeqsA0txKRgxzSOinHiKhUdEBGgzAvCo.	1	postgres	2022-07-29 12:47:08.404011	172.168.80.26/32	\N	\N	\N	\N	\N
77	77	DANGOLA	$2b$10$EHZZiWUCc8pz6.KglzrnieEkbQoKksIgTGYgIbM4MWZ6CCFLRraYa	1	postgres	2022-07-29 12:47:08.412051	172.168.80.26/32	\N	\N	\N	\N	\N
78	78	KAJATA	$2b$10$Z5Abf9kB5aFqc3/urn4MIuPOPrNfFAsEsu1uvQoT9VqxIkj9wgIiC	1	postgres	2022-07-29 12:47:08.42044	172.168.80.26/32	\N	\N	\N	\N	\N
79	79	MTORRES2	$2b$10$UnPMw64MpitpO84gHCpdn.dO0sfHCO14LUMJO/n2plLc9/M4b9Vna	1	postgres	2022-07-29 12:47:08.42875	172.168.80.26/32	\N	\N	\N	\N	\N
80	80	BGOMEZ2	$2b$10$gZRtC9nzHB35.UU9pCdzpuqhnsjahkiCwcPnxNp2b325XQb0hGs1y	1	postgres	2022-07-29 12:47:08.437241	172.168.80.26/32	\N	\N	\N	\N	\N
81	81	RQUIROGA	$2b$10$Kuj6JAP5BG5U4OPHmUEXl.mnNFI1kFl2vhaLBLpY6mwDN.St609Py	1	postgres	2022-07-29 12:47:08.470442	172.168.80.26/32	\N	\N	\N	\N	\N
82	82	TESTRADA	$2b$10$eAOzmR4X45ruMEcLKecXI.5v095/htSDk1n3KK3NpasFeUUljKYk6	1	postgres	2022-07-29 12:47:08.478703	172.168.80.26/32	\N	\N	\N	\N	\N
83	83	OHIDALGO	$2b$10$Y5Y9dvxD4zLFf3Z8BGQLWO4cCr433b8dK3BUrxlu58vWCmh1ElMW6	1	postgres	2022-07-29 12:47:08.487246	172.168.80.26/32	\N	\N	\N	\N	\N
84	84	CADAUTO	$2b$10$2o9YcmRID467sqvh34wrcOeW4V8m6m.WaF0fysf.xZwHojqHTrExy	1	postgres	2022-07-29 12:47:08.495483	172.168.80.26/32	\N	\N	\N	\N	\N
85	85	HROJAS	$2b$10$yGdImzLNXGcI6.vN/sMbUO1GIgl7JBs/3.KKsSWJcfw7LeTUio9Nu	1	postgres	2022-07-29 12:47:08.503888	172.168.80.26/32	\N	\N	\N	\N	\N
86	86	ESANCHEZ	$2b$10$vyRy2vXzu0/CiO962Q.HMO/FsyBFq3xmj8DFoTmEAA2VLFhd1L.NO	1	postgres	2022-07-29 12:47:08.512186	172.168.80.26/32	\N	\N	\N	\N	\N
87	87	KTORREZ	$2b$10$ashb/Ov3xREhxVpOr2bmkOoMMyAgYl5kdlRF3vUyP6HDwrQRHM9Ai	1	postgres	2022-07-29 12:47:08.52048	172.168.80.26/32	\N	\N	\N	\N	\N
88	88	RCHIRI	$2b$10$XtBytBW5Q/OTMl5l1sHmRu3XvymNdZasc3avi3v5mMZge0eOn.CvW	1	postgres	2022-07-29 12:47:08.528943	172.168.80.26/32	\N	\N	\N	\N	\N
89	89	BGONZALES	$2b$10$k87Sc8IByxDx/AbkJ8x/bOLXUKzYKfcFbo4kXe6VaGiPe8XUlCjWG	1	postgres	2022-07-29 12:47:08.537109	172.168.80.26/32	\N	\N	\N	\N	\N
90	90	VGARCIA	$2b$10$awehK2WWEga0Bz9yiVRmgOYk5vz5zhlWlTrid/eekJyz7Sot.rbyC	1	postgres	2022-07-29 12:47:08.545474	172.168.80.26/32	\N	\N	\N	\N	\N
91	91	BCORRALES	$2b$10$1B8hfWVWcfvjOqPn6KRHZufSgyEkfPLoSAE0DvDaFT1PrgiVi35jG	1	postgres	2022-07-29 12:47:08.553852	172.168.80.26/32	\N	\N	\N	\N	\N
92	92	OGOUBLAYE	$2b$10$cbU5c53llvnriC13nl.1Xu57CP9eNRtvhZGCks4UA0uUFmoUVZJgy	1	postgres	2022-07-29 12:47:08.70424	172.168.80.26/32	\N	\N	\N	\N	\N
93	93	MHANSSEN	$2b$10$s1cM8TIHRzrEArq.DGkl/u1Ut4h0cqWRQtgn3UGY9YtvKcGL64s1q	1	postgres	2022-07-29 12:47:08.779827	172.168.80.26/32	\N	\N	\N	\N	\N
94	94	SGUARACHI	$2b$10$GvgBLuEKOXEWKMq2wqMk..CDTFxoioLn1XKBqM28RfISzs0d55uAO	1	postgres	2022-07-29 12:47:08.787181	172.168.80.26/32	\N	\N	\N	\N	\N
95	95	VROMERO	$2b$10$W9mS8P.dLiKcgUtATKasLOYslQFL3CE22.9RIw7Ca4Yy/dKIe8eBe	1	postgres	2022-07-29 12:47:08.820681	172.168.80.26/32	\N	\N	\N	\N	\N
96	96	LCUCHALLO	$2b$10$H27roUBa2sJDamFfVg5CG.dI4QxkpbqDIWUJ.PUmm1PBJnMPlq0c6	1	postgres	2022-07-29 12:47:08.828882	172.168.80.26/32	\N	\N	\N	\N	\N
97	97	RPAREDES	$2b$10$RgV4sK7bnsaPAfjaSEkVCedmNJJC/dqHt.3C5ioqw/ZwmYT3sI17W	1	postgres	2022-07-29 12:47:08.837033	172.168.80.26/32	\N	\N	\N	\N	\N
98	98	KZUNA	$2b$10$CjR5zSJdbWIMyi.ObTG1w.iJ7lVXZKa7Gu2C5LoxGwPvqdzMQeQ8m	1	postgres	2022-07-29 12:47:08.845438	172.168.80.26/32	\N	\N	\N	\N	\N
99	99	VSERRANO	$2b$10$kchxFVyDJVTAcrBeYEKSgelpUJLhsdKpgBjda0p/pNjp4YbPUvXge	1	postgres	2022-07-29 12:47:08.853838	172.168.80.26/32	\N	\N	\N	\N	\N
100	100	MPINTO	$2b$10$N1A0PLszJAUHAdM5NRBnVuvuukRXSA2ayXv98KZTBXG33VycwtJOy	1	postgres	2022-07-29 12:47:08.86212	172.168.80.26/32	\N	\N	\N	\N	\N
101	101	JTERRAZAS	$2b$10$HPA60xUr5tIejZpTu39hx.OAkzTIE36oLzJpeD51r7VHBoHEnJ/ea	1	postgres	2022-07-29 12:47:08.870424	172.168.80.26/32	\N	\N	\N	\N	\N
102	102	IVILLARROEL	$2b$10$P/bzeCj86eViSPutlIxwpeZTdoSH9jZabaZa0uamoTZCgAQ6mAjm.	1	postgres	2022-07-29 12:47:08.878608	172.168.80.26/32	\N	\N	\N	\N	\N
103	103	PPAJARI	$2b$10$JAY/ENw9vGGT2xbAme1P/.LZo6OhfBK5juDB1WlzA362IbMgc5Sqy	1	postgres	2022-07-29 12:47:08.903747	172.168.80.26/32	\N	\N	\N	\N	\N
104	104	MROCHA	$2b$10$0wEtJBG2.Sd2boTE7Tthn.C59nReQ7IQ.xa.UBLgdNGx5/Mzuuzru	1	postgres	2022-07-29 12:47:08.912132	172.168.80.26/32	\N	\N	\N	\N	\N
105	105	SVILLANUEVA	$2b$10$SZ0wPB6Tc6hCwf5Et1GAiuiOfi5dEfxW.GQWylfoEDpFSgiYo03xi	1	postgres	2022-07-29 12:47:08.92054	172.168.80.26/32	\N	\N	\N	\N	\N
106	106	LCOIMBRA	$2b$10$bMjfhANFEyAa02FgJK0QLOUknawI6CrJJYHW2eKtuX3aOrSb3nKLW	1	postgres	2022-07-29 12:47:08.928958	172.168.80.26/32	\N	\N	\N	\N	\N
107	107	GMALDONADO	$2b$10$yPHyjUwFjZiZ5Bd7mMVDyueLIVnvR4SO4X8uq1Kxhtdvbptr7v0Km	1	postgres	2022-07-29 12:47:08.93705	172.168.80.26/32	\N	\N	\N	\N	\N
108	108	MNOGALES	$2b$10$0fazyGP8nBbP9/ELXVe8yuQrPVhgMAUYzTVf24bHAK72mI.rbeTzy	1	postgres	2022-07-29 12:47:08.945384	172.168.80.26/32	\N	\N	\N	\N	\N
109	109	MTOCONAS	$2b$10$DswcLTKSr4nMqgQPhoUKh.12Fn5fdfWIvitw0fku14sbd3.7Dkhg6	1	postgres	2022-07-29 12:47:08.953816	172.168.80.26/32	\N	\N	\N	\N	\N
110	110	OFRANCO	$2b$10$gPsJkpL4kdbTPfko1cICo.Aunqpt8Adf8WfvyIJPMDPnimu0CUbSK	1	postgres	2022-07-29 12:47:08.962107	172.168.80.26/32	\N	\N	\N	\N	\N
111	111	MPEREZ	$2b$10$w4N.MsEFGFzvL4JlMaSrGeSsSpD6tileMJL7RgMP8og55HqNbG4g2	1	postgres	2022-07-29 12:47:08.979721	172.168.80.26/32	\N	\N	\N	\N	\N
112	112	AGONZALES	$2b$10$avw8GeppskFK47ywPp3vTOUVOZb7tJnSKQnf2DEKl322V0XlS02i.	1	postgres	2022-07-29 12:47:09.019938	172.168.80.26/32	\N	\N	\N	\N	\N
113	113	CVIDAURRE2	$2b$10$Joei3/XQ1hM2nvJc5ghtkumyiyR5sts6idRo3f9a1HAW4cJ8fiKJ.	1	postgres	2022-07-29 12:47:09.028181	172.168.80.26/32	\N	\N	\N	\N	\N
114	114	MVALLES	$2b$10$ZOLS8zFfmGT0tfZQc3d14eB8/Kf3jHnfG0XBzf/6xyy7s/hO5T8lC	1	postgres	2022-07-29 12:47:09.036512	172.168.80.26/32	\N	\N	\N	\N	\N
115	115	KALMARAZ	$2b$10$/MncKYKe0um0dTmQIwyZDeNB3LOPReVtf2Exouep9xOhWNqwO7i..	1	postgres	2022-07-29 12:47:09.044789	172.168.80.26/32	\N	\N	\N	\N	\N
116	116	EMAMANI	$2b$10$nLS2sauJXT1rMQwpcdzQp.6ZpTOWoYXSggbyMNM8JXpO/3RGnhIcS	1	postgres	2022-07-29 12:47:09.053211	172.168.80.26/32	\N	\N	\N	\N	\N
117	117	LARROYO	$2b$10$ka.SW24AayJaBMs/cbu7.egtndrGZS2wfZLX0sO5DutqkUIP8.Jhq	1	postgres	2022-07-29 12:47:09.067937	172.168.80.26/32	\N	\N	\N	\N	\N
118	118	RANGULO	$2b$10$kW3sD2/gjxaT85JYBvPu4OwwoaNJfsxFaJjZilzSDjR7r3pclNMCa	1	postgres	2022-07-29 12:47:09.078207	172.168.80.26/32	\N	\N	\N	\N	\N
119	119	DRAMOS	$2b$10$3jVxqByZ9Ja.lFCHAAdVvOrrfVe3TANMCAbOtJaK.S24CoS2zEiC.	1	postgres	2022-07-29 12:47:09.086478	172.168.80.26/32	\N	\N	\N	\N	\N
120	120	JTRIGUERO	$2b$10$rhi92gtto80.k7DxP1wyf.lOQpSsE07X0Y2UMr7FSsRcOypzpmYf2	1	postgres	2022-07-29 12:47:09.094814	172.168.80.26/32	\N	\N	\N	\N	\N
121	121	EMAMANI2	$2b$10$ePjZ5fIVHdHCVDdCH4tJaeGkTgAD3I/VViXGgt4hoP6F57CKF4gQG	1	postgres	2022-07-29 12:47:09.103154	172.168.80.26/32	\N	\N	\N	\N	\N
122	122	JRIVERO	$2b$10$.BrMEAxa.OUqlJByCzOUQe/dLu9BO4TeVlI3WJsTSfHZVUMayFf2G	1	postgres	2022-07-29 12:47:09.111772	172.168.80.26/32	\N	\N	\N	\N	\N
123	123	JLLAVETA	$2b$10$wxOLkycIqHyCzMk07lTNAOYP5RXyyyHCjPY.EEQnhrmavaxTpbNtC	1	postgres	2022-07-29 12:47:09.216273	172.168.80.26/32	\N	\N	\N	\N	\N
124	124	FCONDORI	$2b$10$Ivlwc9D6tQiZ/2JKTcUiYePv8UvfjyjzX32Dpu7rz1PsC1HKnk29a	1	postgres	2022-07-29 12:47:09.293107	172.168.80.26/32	\N	\N	\N	\N	\N
125	125	DHERRERA	$2b$10$hb50R7ZKyixlxtMjZOdEoeK4b99DZa2mVM7xOe17H0NkCqvr.v3CW	1	postgres	2022-07-29 12:47:09.416758	172.168.80.26/32	\N	\N	\N	\N	\N
126	126	KCALDERON	$2b$10$OTCCkqXVzYbv0XQE7W28w.Q7n1kTuM/RkoMhFg1q5zUUvjEXyG2nK	1	postgres	2022-07-29 12:47:09.484799	172.168.80.26/32	\N	\N	\N	\N	\N
127	127	BMACHICADO	$2b$10$QNUak.dKij82OrMS695S0eYlm0XEeI82LvheabkVpx54/1GP7ai2G	1	postgres	2022-07-29 12:47:09.495394	172.168.80.26/32	\N	\N	\N	\N	\N
128	128	ADELGADILLO	$2b$10$Balk363I5pT.1IdjHbt1rO8F4WUy5qjC0csWmvstgU7g1PmZHmIi6	1	postgres	2022-07-29 12:47:09.503552	172.168.80.26/32	\N	\N	\N	\N	\N
129	129	FMENDOZA23	$2b$10$87o9FnnEUvKrQvggt3FxyemMygLtJAjMryL.Cs9yAWQhjOQd3AcBe	1	postgres	2022-07-29 12:47:09.512284	172.168.80.26/32	\N	\N	\N	\N	\N
130	130	MARANA	$2b$10$QmSo73yTkT4eJKCs69hjM.upnsZd.vTTXJRCKHBcVAkCUasw5jF8a	1	postgres	2022-07-29 12:47:09.520367	172.168.80.26/32	\N	\N	\N	\N	\N
131	131	KJUSTINIANO	$2b$10$c2FVDYAAu8MRnzniOmqWiOSXzxVhLjtpcKnFVeOhIDNB8N70K73L2	1	postgres	2022-07-29 12:47:09.528924	172.168.80.26/32	\N	\N	\N	\N	\N
132	132	WNINA	$2b$10$fYtOqKl6l8GwnnCLnT0sFerJjkHtRSdUO2hValz7MzgnZu0mybq62	1	postgres	2022-07-29 12:47:09.536953	172.168.80.26/32	\N	\N	\N	\N	\N
133	133	EMOSQUES	$2b$10$GYGjWuqNTDAjJgpHgLZZyuEumcI4bLWmT7zh/wtI2Z6v5FQUWubQa	1	postgres	2022-07-29 12:47:09.545255	172.168.80.26/32	\N	\N	\N	\N	\N
134	134	MVARGAS2	$2b$10$AQlu0trn7AE4P8EVPMahoexjUfm3h0twGodEBN01NIJhs4fSgHWkm	1	postgres	2022-07-29 12:47:09.553754	172.168.80.26/32	\N	\N	\N	\N	\N
135	135	APADILLA	$2b$10$bH6tJAu9R882GEhD1WJ7feKE8u1BemKuAyJOFn9PvcA0ZzVdrHBtC	1	postgres	2022-07-29 12:47:09.561961	172.168.80.26/32	\N	\N	\N	\N	\N
136	136	EARREDONDO2	$2b$10$1y820u3WwOj0N26qqMNYeuaPgvMH4vVWt33r5vED4t3K4ZvO3/FqK	1	postgres	2022-07-29 12:47:09.570359	172.168.80.26/32	\N	\N	\N	\N	\N
137	137	MAGUILAR	$2b$10$buvn9osjwuJ/QeXWED7v6uWWCMOA8TCSr4PNboP15vsNQ/oWmSFTu	1	postgres	2022-07-29 12:47:09.57874	172.168.80.26/32	\N	\N	\N	\N	\N
138	138	MFERNANDEZ	$2b$10$LLxyMDZUsApF5vPxTVhL6.uvldokLD4mHGlecrUHNSe9qixGHGPt2	1	postgres	2022-07-29 12:47:09.586949	172.168.80.26/32	\N	\N	\N	\N	\N
139	139	FBORESAY	$2b$10$wQ3sfGGxWwcB3qMQcJ4ZvuO7U//grLLPgf041kA9DAJnzW8fD.JRy	1	postgres	2022-07-29 12:47:09.595214	172.168.80.26/32	\N	\N	\N	\N	\N
140	140	DMARAZ	$2b$10$UY6vQqN8xMT/yaAcedWec.59GRB1xpKBtdclJ2YA6/DpxB.I1pV.C	1	postgres	2022-07-29 12:47:09.60346	172.168.80.26/32	\N	\N	\N	\N	\N
141	141	MSERRANO	$2b$10$9KClh0.N/CI/0Ty4ok28T.H..x859vDXWUwEUlPLjHXCYmykKMR9C	1	postgres	2022-07-29 12:47:09.612054	172.168.80.26/32	\N	\N	\N	\N	\N
142	142	FORTEGA	$2b$10$t8wqThvnr1gitbYeY8ldkeXUYRdUgIH2/oe4LQ9IrSQH4iweJP.5.	1	postgres	2022-07-29 12:47:09.620311	172.168.80.26/32	\N	\N	\N	\N	\N
143	143	JMERCADO	$2b$10$9rINT/zPCc6f5y5tiJUlxePH7yAYouynSTS/02wNwB/SZV4FDs.sC	1	postgres	2022-07-29 12:47:09.628705	172.168.80.26/32	\N	\N	\N	\N	\N
144	144	WRIVERA	$2b$10$yunLiEAYdHX6JnA3iMQ8s.C1qVsTTZqjrl9BywqKRlhP1GwIoN/1i	1	postgres	2022-07-29 12:47:09.637014	172.168.80.26/32	\N	\N	\N	\N	\N
145	145	FCHOQUE	$2b$10$.S8icRH1QD5Q0tWNM1wmkO5T9X71IGyDmYYZAMFfnVCg.hmqSSzTm	1	postgres	2022-07-29 12:47:09.645473	172.168.80.26/32	\N	\N	\N	\N	\N
146	146	JBURGOS	$2b$10$E1YJ/gquQAcUoFrGz41/Ze0kK8dWRF.PuR.ECnKaluHPPctvsXAyq	1	postgres	2022-07-29 12:47:09.653659	172.168.80.26/32	\N	\N	\N	\N	\N
147	147	MCABRERA	$2b$10$JWrzGjayQ7GDQuQV2h70v.7rnBxdFxLhUlNJ0oZYDDM3BC90XrweG	1	postgres	2022-07-29 12:47:09.662176	172.168.80.26/32	\N	\N	\N	\N	\N
148	148	WNOVA	$2b$10$QnKch67gxy74KPx4oOxE5.g8QElWLRhl6S2wd73.GRbE/iyfHUu2S	1	postgres	2022-07-29 12:47:09.670392	172.168.80.26/32	\N	\N	\N	\N	\N
149	149	PMIRANDA	$2b$10$PVDVklCQ58CEfIde5wOX..D436gskkbkt/DChUO5Zi778FNhY1/yq	1	postgres	2022-07-29 12:47:09.678862	172.168.80.26/32	\N	\N	\N	\N	\N
150	150	RLEON	$2b$10$GbqX3CHjIulo50Q6TCSPteJ5R6RCKDlGab7Dr7ZYfYmHWyKlesKAS	1	postgres	2022-07-29 12:47:09.687039	172.168.80.26/32	\N	\N	\N	\N	\N
151	151	BTERRAZAS	$2b$10$Mwia9HsNtFVjUiIdChtp8OwLHWGUDoOB7pn9WlxuI1tqDLrPe4J6u	1	postgres	2022-07-29 12:47:09.69543	172.168.80.26/32	\N	\N	\N	\N	\N
152	152	RKANTUTA	$2b$10$rZrrbfBLu.KpDcF5hkrrmudsc4u9jNeDTmEjrO0c3HwxuHVOCxYj6	1	postgres	2022-07-29 12:47:09.703617	172.168.80.26/32	\N	\N	\N	\N	\N
153	153	LFUENTES	$2b$10$mJUOjwiyTpjjqzPOrU5/Xu2cL8f7dVINwXbTMQOfYqgb3O3FczueG	1	postgres	2022-07-29 12:47:09.712148	172.168.80.26/32	\N	\N	\N	\N	\N
154	154	ACUELLAR	$2b$10$QVHBhOzsHLNjgxOyM3otMOCDUoWOV5b61CAB0KnbcCtekFeBTWQ62	1	postgres	2022-07-29 12:47:09.720254	172.168.80.26/32	\N	\N	\N	\N	\N
155	155	GMEDINA	$2b$10$SLDSOrCzWxNATLJW/73mN.3S/Fctksk6/GG08z8a8vIpSh61DNiwy	1	postgres	2022-07-29 12:47:09.72872	172.168.80.26/32	\N	\N	\N	\N	\N
156	156	ECORANI	$2b$10$XtVxmDqmH7x8PrVHIs1X3OhGu.Ll9QxvxEL4hm8jjT2SAv3lERwgW	1	postgres	2022-07-29 12:47:09.736935	172.168.80.26/32	\N	\N	\N	\N	\N
157	157	AQUIROZ	$2b$10$hUaV4rCqGnaIcK2lZ3x.EebwRCYL2X27eHobuAgXo04fs1UEIMnhG	1	postgres	2022-07-29 12:47:09.745404	172.168.80.26/32	\N	\N	\N	\N	\N
158	158	EYAPURA	$2b$10$I.aeGlvLP46yTMy1MX0E6e7tC07U8qJifGxOEXdU02.s8f4d/7BQi	1	postgres	2022-07-29 12:47:09.753662	172.168.80.26/32	\N	\N	\N	\N	\N
159	159	MMACHICADO	$2b$10$Awal8NgWEaIUZzy3.IkKyutmBR7LteoOmKtsNLtwaHc.85hc1U.Cu	1	postgres	2022-07-29 12:47:09.762076	172.168.80.26/32	\N	\N	\N	\N	\N
160	160	NRODRIGUEZ	$2b$10$jFLCo36UFSPK82iRoS3LD.6RZnJZ596YNeJxLQ96LKAVyfWkay.Z.	1	postgres	2022-07-29 12:47:09.770367	172.168.80.26/32	\N	\N	\N	\N	\N
161	161	PGUTIERREZ2	$2b$10$gFd2U5u0yzyMaIF5m.7kGuwTccPSIAN/yaHOCwIz9uyGTl6/WtYQy	1	postgres	2022-07-29 12:47:09.778459	172.168.80.26/32	\N	\N	\N	\N	\N
162	162	GMAMANI2	$2b$10$BsngLxOb9l8xR3pYqApzTeVPcUUW1J5t1uGgrqvo1nhkxXG9j8U6u	1	postgres	2022-07-29 12:47:09.786839	172.168.80.26/32	\N	\N	\N	\N	\N
163	163	DBOLIVAR	$2b$10$LPVtUGDy11XQFB/.VomsS.D4ZwrQQqn45I84YjGc.V5m5DrzUvNX2	1	postgres	2022-07-29 12:47:09.795335	172.168.80.26/32	\N	\N	\N	\N	\N
164	164	RSORUCO2	$2b$10$Kpk48fATTWolagx7mx5YJewnru74tSaDvo3AMurBBkfcgkdL/H646	1	postgres	2022-07-29 12:47:09.803922	172.168.80.26/32	\N	\N	\N	\N	\N
165	165	JSORIA	$2b$10$V8q4vK0q0GggFaxBgVYwE.j7iePnafgzsiVYwed2xvrdI77uyc1bm	1	postgres	2022-07-29 12:47:09.951247	172.168.80.26/32	\N	\N	\N	\N	\N
166	166	ECASTRO	$2b$10$uODjYNPTmGXUY.gfDoKYquRTEwJMz97hi2VVT445gMBaahnqECV2i	1	postgres	2022-07-29 12:47:09.96212	172.168.80.26/32	\N	\N	\N	\N	\N
167	167	YCHAMBI	$2b$10$yWn1BMdouKcHiv2DZFCtJOWa4jfaCGMIkwVjq7jy483f..yifj.ES	1	postgres	2022-07-29 12:47:10.087218	172.168.80.26/32	\N	\N	\N	\N	\N
168	168	RSORUCO	$2b$10$nrsF2REe/Eb9yWvXTAoJAec8bPuWfj/sgc3odtmpDQc6AB7au9V.C	1	postgres	2022-07-29 12:47:10.112058	172.168.80.26/32	\N	\N	\N	\N	\N
169	169	LCAMACHO	$2b$10$35unfFx7OFn7rqtPguJLCupHFkOdhDqj6U/msbMpOJnHr1UJqNW1.	1	postgres	2022-07-29 12:47:10.120375	172.168.80.26/32	\N	\N	\N	\N	\N
170	170	LAVILA	$2b$10$F5ck6eJHn79ovxq.OlgAz.o0bQtnXiDbthLxgDyvft9faio0voCtC	1	postgres	2022-07-29 12:47:10.234867	172.168.80.26/32	\N	\N	\N	\N	\N
171	171	RVILTE	$2b$10$ykEkIw77qXSX41mJXZut1eR9PV66qH2/2rIBxlOFLHxyY1KJiQNAG	1	postgres	2022-07-29 12:47:10.260073	172.168.80.26/32	\N	\N	\N	\N	\N
172	172	MAPAZA2	$2b$10$05rT5KQoHWaJaqhNVoQmtedkCm/e9DPPnefRjk4Mib.z/soOTstW.	1	postgres	2022-07-29 12:47:10.27024	172.168.80.26/32	\N	\N	\N	\N	\N
173	173	MARANA2	$2b$10$aURP8nUFfHVbGmuWVx.nkuMhrmqjtDe1/qoITqxTyWp1O2/n4dPNK	1	postgres	2022-07-29 12:47:10.278484	172.168.80.26/32	\N	\N	\N	\N	\N
174	174	OMENDOZA	$2b$10$46DaEx0PeqqNP/lQMJjRrueClhSUumovi3nHYeoKgCiWHJJFWy54u	1	postgres	2022-07-29 12:47:10.286738	172.168.80.26/32	\N	\N	\N	\N	\N
175	175	AACUÑA	$2b$10$pSswdn7nJboKCDN9952PJ.b8X6CEJZ5MBCwuIqnAI/8Ps9QdzgjuW	1	postgres	2022-07-29 12:47:10.294992	172.168.80.26/32	\N	\N	\N	\N	\N
176	176	ETEJERINA	$2b$10$snbmHx.cTEOW7h64xs5Ar.I2hM9Qj7LZCWBKWhVCcLXRZsrgQmD4y	1	postgres	2022-07-29 12:47:10.303274	172.168.80.26/32	\N	\N	\N	\N	\N
177	177	MTOLA	$2b$10$IYGF1TAIOiW3rRNFQMF/c.zoSdthunC30WK8dnTBMxX2PrVubTmRi	1	postgres	2022-07-29 12:47:10.311576	172.168.80.26/32	\N	\N	\N	\N	\N
178	178	LGUZMAN	$2b$10$lTVrcMDWczGjEZ0dAgrKdOjL/qT7nBUHfAik10.ewM3EKDYsG21Z2	1	postgres	2022-07-29 12:47:10.319933	172.168.80.26/32	\N	\N	\N	\N	\N
179	179	OLAVERAN	$2b$10$SVlWsNyOtd8G3mxtHVUc..JXVcTdaPZKGm9dOOig5R3oZ9LBvvg9y	1	postgres	2022-07-29 12:47:10.328236	172.168.80.26/32	\N	\N	\N	\N	\N
180	180	AGALARZA	$2b$10$1J/y422FJGobL1jgtUaVcOoBicphhFUuaRqkbdviqQN2l7MEFvKee	1	postgres	2022-07-29 12:47:10.336662	172.168.80.26/32	\N	\N	\N	\N	\N
181	181	SMOJICA	$2b$10$djWGgVI3x7WgvakdTTo3bOm7zOAbBVrEu6.jh6XQcrtpqcDw1aaK2	1	postgres	2022-07-29 12:47:10.344873	172.168.80.26/32	\N	\N	\N	\N	\N
182	182	EREYES	$2b$10$/jqp.j2BsWt4h5gXScZmteX.hZQkeaUQU5xWUFbwGSICeNe2udJrW	1	postgres	2022-07-29 12:47:10.353292	172.168.80.26/32	\N	\N	\N	\N	\N
183	183	CHIGA	$2b$10$2uCKUn8F.GS8wLXnpR.63.gMDRIIAn7lazkxEi8f7YvQtn9xay5Om	1	postgres	2022-07-29 12:47:10.361721	172.168.80.26/32	\N	\N	\N	\N	\N
184	184	ECLAROS	$2b$10$Z.lQDAOiWFYTYgrsGJvaKekguXmHlmRatklmRhfGR8U2jj9kxwEnG	1	postgres	2022-07-29 12:47:10.378454	172.168.80.26/32	\N	\N	\N	\N	\N
185	185	FESCOBAR	$2b$10$L.nowHpvgX12.im4tZryjuQsM3z4AEa08OHYKlhpLctafCueaAlsu	1	postgres	2022-07-29 12:47:10.38669	172.168.80.26/32	\N	\N	\N	\N	\N
186	186	ERODRIGUEZ	$2b$10$3z9Mxj7toiiiXkv2HjuU6uNj1yAQ3AKEZiCZOvkYIVKu8gkuSisCq	1	postgres	2022-07-29 12:47:10.395237	172.168.80.26/32	\N	\N	\N	\N	\N
187	187	FMONTERO	$2b$10$tSLBZIWxT.ozubdhmwmqceehmFdRLdT83/kdJCiptDe.16Q0AaW2S	1	postgres	2022-07-29 12:47:10.403514	172.168.80.26/32	\N	\N	\N	\N	\N
188	188	YRODRIGUEZ	$2b$10$1Aug1P0Q7HXEbVy7Oj0SLuwzbn2PHYdXQfSswQXr.qPC7DrcthChS	1	postgres	2022-07-29 12:47:10.411778	172.168.80.26/32	\N	\N	\N	\N	\N
189	189	MSARCO	$2b$10$Wi7/lRwqMupWNWRL.BQbcOXDFccgfisv9wn62R1evkDSUnH0eOUO.	1	postgres	2022-07-29 12:47:10.420142	172.168.80.26/32	\N	\N	\N	\N	\N
190	190	MDPEREZ	$2b$10$UAIb50oI2wcprd1JDPwYiOYx9dLYP/ZioOl9iK80qAfjm1QXwh4hm	1	postgres	2022-07-29 12:47:10.428709	172.168.80.26/32	\N	\N	\N	\N	\N
191	191	AYEPEZ	$2b$10$NtEu/IpJUufxo2gv7vPoT.M7litZBFzavy7QI..XmcEYCxR1M8Eny	1	postgres	2022-07-29 12:47:10.436841	172.168.80.26/32	\N	\N	\N	\N	\N
192	192	LCASTRO	$2b$10$wBUahq0y4JDpSsy538Y1duxZRZU0ZaoxvCSFeTFsIyKb3YTV339uK	1	postgres	2022-07-29 12:47:10.445275	172.168.80.26/32	\N	\N	\N	\N	\N
193	193	DHUARACHI	$2b$10$CzhY.92pyHhQ6Dy8.ykJwuqT7E/EuXIkxYE4I/PIU6IKmIkXsY7UO	1	postgres	2022-07-29 12:47:10.453605	172.168.80.26/32	\N	\N	\N	\N	\N
194	194	RFERREIRA	$2b$10$KYusP9uM2Yimw6PvB04F2OZ79zTH3RkG4iykxFAI7t8bt77ECcA5G	1	postgres	2022-07-29 12:47:10.462031	172.168.80.26/32	\N	\N	\N	\N	\N
195	195	OZUÑAGUA	$2b$10$1Iny5KvJtmGN25uF2ptfo.o5FZP2ZfBpbzSO2RNT62ufPkXqyP91i	1	postgres	2022-07-29 12:47:10.470239	172.168.80.26/32	\N	\N	\N	\N	\N
196	196	OCRUZ	$2b$10$cC8M2lFdCJows7Yh4KYxg.SFFuweg7TwOirLp4ns6sf.ejHijkLnW	1	postgres	2022-07-29 12:47:10.478513	172.168.80.26/32	\N	\N	\N	\N	\N
197	197	JIBAÑEZ	$2b$10$xn9MyykhZBcy.X82C/Yf7esk15j0Hfbdmh3eJfVYbrDmD5TuR/eFi	1	postgres	2022-07-29 12:47:10.486973	172.168.80.26/32	\N	\N	\N	\N	\N
198	198	MABASTOFLOR	$2b$10$rLs4tVicbnkS35Eo5hQfcOZ7jonKiPw4oS8IpHkH6bhW8Dt3Yj2Ju	1	postgres	2022-07-29 12:47:10.495261	172.168.80.26/32	\N	\N	\N	\N	\N
199	199	ACOLMAN	$2b$10$rTylLfGinrju7yT5LNbVmOy21GEdKdn8SSoAle639vhkHEyWDwWQy	1	postgres	2022-07-29 12:47:10.503547	172.168.80.26/32	\N	\N	\N	\N	\N
200	200	RHEREDIA	$2b$10$UlDA2jx4gDWORnIWSn4ecOHpz7tWfhAkkjTuqAE1BM/Jb/Nys3p3y	1	postgres	2022-07-29 12:47:10.511689	172.168.80.26/32	\N	\N	\N	\N	\N
201	201	RMARTINEZ2	$2b$10$PztwI2hU/RSWclOJnR3s1.AeyAanvtwTvYNSRe/7re8MYn1VZ2c5a	1	postgres	2022-07-29 12:47:10.520245	172.168.80.26/32	\N	\N	\N	\N	\N
202	202	CFLORES2	$2b$10$Dmbvx9cQ.gjxwAQ6T1.E7O9h9BgkWWDMxPAEwiH86Q2wHXFbe8CqG	1	postgres	2022-07-29 12:47:10.528731	172.168.80.26/32	\N	\N	\N	\N	\N
203	203	DEMAMANI	$2b$10$GNtqeHWoC4PGUDVwcKcoFu5UXIDJb7GTr9JKC5WOkH7znHpBguRz.	1	postgres	2022-07-29 12:47:10.536888	172.168.80.26/32	\N	\N	\N	\N	\N
204	204	CACHA	$2b$10$5rhDXH55sf679YEKx3WAtOhoDCVlZ9RlVkWxFjGDJ2U4JkmOpXaRG	1	postgres	2022-07-29 12:47:10.545168	172.168.80.26/32	\N	\N	\N	\N	\N
205	205	BJANKO	$2b$10$9A4d1HBvZTICd1s4oeCA3ObnFd3q377RK4X7hmiUrH/tpzG2rRhFW	1	postgres	2022-07-29 12:47:10.55342	172.168.80.26/32	\N	\N	\N	\N	\N
206	206	DFARFAN	$2b$10$kqWaMgiRXQ7wzg4RuJKy8e1/k8uoq1XTDRxhfincfEqUTiCIqCYhC	1	postgres	2022-07-29 12:47:10.561767	172.168.80.26/32	\N	\N	\N	\N	\N
207	207	LPEREDO	$2b$10$JvKmUzY4ojyUJQMUPfTWSuUV.fYZTcqJB3KewMfSr3Aa.J67wex8S	1	postgres	2022-07-29 12:47:10.570066	172.168.80.26/32	\N	\N	\N	\N	\N
208	208	WALPIRE	$2b$10$TrhDK.44XqH19Hxqz0CteOBkQp1eReRe9LpWODvVJel59AQuKID5O	1	postgres	2022-07-29 12:47:10.578676	172.168.80.26/32	\N	\N	\N	\N	\N
209	209	BPLATA	$2b$10$BMnA0Mk2.rgQE3WGgshpfewx18pAzxxeLTGA/iUZkB407yAfIycJS	1	postgres	2022-07-29 12:47:10.586988	172.168.80.26/32	\N	\N	\N	\N	\N
210	210	JTEMO	$2b$10$31LFyo979MTdhWHK/6IdyeM2VQ1Lg4RlSPKzwHH/h2G6Dk1wDhnRu	1	postgres	2022-07-29 12:47:10.745338	172.168.80.26/32	\N	\N	\N	\N	\N
211	211	MAPAZA	$2b$10$Y1IPSvGns.rArbu9NHPFNeDRo46T4ebsbtfrpJf7wl2b8BZm/JgU6	1	postgres	2022-07-29 12:47:10.770219	172.168.80.26/32	\N	\N	\N	\N	\N
212	212	RRIOJA	$2b$10$OqBsknmW81jsulIYTQD8Jeey3ruRhZHBJIkdRsxeFtZWQID9vjF/.	1	postgres	2022-07-29 12:47:10.792753	172.168.80.26/32	\N	\N	\N	\N	\N
213	213	CVARGAS	$2b$10$2RutHo21etUklqHpipRbNeyYOh6oOZygHJ99sYDOCdozQ9vSrgfxO	1	postgres	2022-07-29 12:47:10.803429	172.168.80.26/32	\N	\N	\N	\N	\N
214	214	JCOLQUE2	$2b$10$Kpg.bRWYGrmb6J3BxkA4peev9jJpgV6lbu7sNxnhELNoffE2zQ84y	1	postgres	2022-07-29 12:47:10.811733	172.168.80.26/32	\N	\N	\N	\N	\N
215	215	IVASQUEZ	$2b$10$vsZ1zbBfOT7lxh1GQtoMQ.9SUuuWpKA.gaix538nlTQcTF2yaVo96	1	postgres	2022-07-29 12:47:10.926263	172.168.80.26/32	\N	\N	\N	\N	\N
216	216	MMELGAR	$2b$10$0vlqlRLVKMUNqA2f0N16eO5uhiZUmlfmkrfNKJTADnLcfDJcjuwgq	1	postgres	2022-07-29 12:47:10.961689	172.168.80.26/32	\N	\N	\N	\N	\N
217	217	AGARCIA	$2b$10$QPEEx7zMDa4fVoH4rSQ7GuN1lVIPbkpRBZ2Q5LQBuO7V4PPL1Muyi	1	postgres	2022-07-29 12:47:11.086988	172.168.80.26/32	\N	\N	\N	\N	\N
218	218	JLARA	$2b$10$1a9V2gft3LXEdLUgMVmEzORWppAM65FX/HJntESxieZRIcvOHWcWG	1	postgres	2022-07-29 12:47:11.128617	172.168.80.26/32	\N	\N	\N	\N	\N
219	219	ZMURILLO	$2b$10$P2mj1jN2UV2P8u/bLmE2IuV.dsuGctvIWgEQo8iAtBIfrE40ZzhOq	1	postgres	2022-07-29 12:47:11.136704	172.168.80.26/32	\N	\N	\N	\N	\N
220	220	AIRIARTE	$2b$10$r/6rXokjorAekYRts4whaOKTDmgz2T/PQuWR8iXJVuKomZheKggbS	1	postgres	2022-07-29 12:47:11.251205	172.168.80.26/32	\N	\N	\N	\N	\N
221	221	RCHAMBI	$2b$10$9CROvfl5kc73dejm3M82ZOSn75KtW8E3XpNnlD9k3EJqhgJdr/uCO	1	postgres	2022-07-29 12:47:11.267591	172.168.80.26/32	\N	\N	\N	\N	\N
222	222	JMOZA	$2b$10$8LZx6HG6FYHmfuS9HGILOul5tHWCxHcyRoX2nKi5RV0RrdRObAeOO	1	postgres	2022-07-29 12:47:11.278482	172.168.80.26/32	\N	\N	\N	\N	\N
223	223	PLUJAN	$2b$10$j5Dh7uzLXNbKGlWue8l.L.HegzLWNkU.f0aE6EKoDjlv9y/podBam	1	postgres	2022-07-29 12:47:11.286713	172.168.80.26/32	\N	\N	\N	\N	\N
224	224	JCOAQUIRA	$2b$10$wciRRad8iD3dfZw4x8Raq.SrGVo79DEY/ud0lp1879T0rHLI8r0ze	1	postgres	2022-07-29 12:47:11.294984	172.168.80.26/32	\N	\N	\N	\N	\N
225	225	JLESCANO	$2b$10$HEXuLD1vi17PcW9Uxm3M7u6G/NTZaOavzMcFEdx0aZ3f8isaJmXhm	1	postgres	2022-07-29 12:47:11.30336	172.168.80.26/32	\N	\N	\N	\N	\N
226	226	EGALINDO	$2b$10$XdNQj2Ge2Cws1hH0Rgdi0Ouxxl7fVEg8q/tgdkVpWuCtwbWiMS/Im	1	postgres	2022-07-29 12:47:11.311757	172.168.80.26/32	\N	\N	\N	\N	\N
227	227	RKANTUTA2	$2b$10$SWVEvnb6Kkor48Re.jGPYO0We87XYhM8v99BNzd6GXmJZwLqd/xV.	1	postgres	2022-07-29 12:47:11.320043	172.168.80.26/32	\N	\N	\N	\N	\N
228	228	IRAMOS2	$2b$10$alKRwLPlbgF3Gq55n/MGNek99pytLwJpp0nYQDdiRHKoq2l7n6YVG	1	postgres	2022-07-29 12:47:11.328612	172.168.80.26/32	\N	\N	\N	\N	\N
229	229	HGONZALES	$2b$10$kQviEbuemzB2azeRubcVfueZP6QZwXHLCy706sOkAdc7a8qzLxTpu	1	postgres	2022-07-29 12:47:11.337033	172.168.80.26/32	\N	\N	\N	\N	\N
230	230	EGONZALES	$2b$10$sjx2mzZt39paas/z1ik7Leavr.b6OfJ5MD4A7C861mWIcqxUlSMLG	1	postgres	2022-07-29 12:47:11.345236	172.168.80.26/32	\N	\N	\N	\N	\N
231	231	SGUERRERO	$2b$10$BK6m/cV3o47d26/j6FPclegyeA0tjT9t4ezdev3AOofnVMOOTcay.	1	postgres	2022-07-29 12:47:11.353487	172.168.80.26/32	\N	\N	\N	\N	\N
232	232	LREYES	$2b$10$BxposVw79JxB6ccWiTASbusRf1q3RAOtVkTRYZR70.olWiRHc9AyS	1	postgres	2022-07-29 12:47:11.361876	172.168.80.26/32	\N	\N	\N	\N	\N
233	233	DAYALA	$2b$10$ZEIlcAnSydII83WuC7f8teAfw2s5xV0GLTa7Du3NZNVzcQpAaiDmO	1	postgres	2022-07-29 12:47:11.370152	172.168.80.26/32	\N	\N	\N	\N	\N
234	234	MCARVALLO	$2b$10$Zc1JdFZQBvDyttXQYtKHFufL47IIEgY0F8bXNO0uyZD6CKqzjWj9q	1	postgres	2022-07-29 12:47:11.403462	172.168.80.26/32	\N	\N	\N	\N	\N
235	235	VMARTINEZ	$2b$10$jPlKlOb/kivsZ5zKKujxsuxpjwecB1xtj6yql6QFoNd0kcKnvB8ZK	1	postgres	2022-07-29 12:47:11.411793	172.168.80.26/32	\N	\N	\N	\N	\N
236	236	MROJAS	$2b$10$1Dvi37bgsMmgiC5vKZxcOeHTa/T9EAhoftqUHZjFLja/EFV6qx0Qi	1	postgres	2022-07-29 12:47:11.420005	172.168.80.26/32	\N	\N	\N	\N	\N
237	237	VVARGAS	$2b$10$.vr7lzciSFp748md7AH5/el4PDH8dT4X2gUh4bJWeOfSA8KsITBFK	1	postgres	2022-07-29 12:47:11.428658	172.168.80.26/32	\N	\N	\N	\N	\N
238	238	DGRECO	$2b$10$./FlKbnsZuiFuawvPHMMy.YOPL9JBoY07jVjKsNOJgfN/eEyqdRy6	1	postgres	2022-07-29 12:47:11.436623	172.168.80.26/32	\N	\N	\N	\N	\N
239	239	FSANGALLINI	$2b$10$WVhlh5uNqL2mYzkq765PGeDwhwIzFMoSpdZOWH4yc6t/z7x9wbOhK	1	postgres	2022-07-29 12:47:11.445037	172.168.80.26/32	\N	\N	\N	\N	\N
240	240	ASARUBBE	$2b$10$XfkjA.xV1yRoJWZphJbzwOoy0qjsVeg02C4F6.HwBtX3gesKbhPoW	1	postgres	2022-07-29 12:47:11.453295	172.168.80.26/32	\N	\N	\N	\N	\N
241	241	JMONTES	$2b$10$VNoaa7CU6Tol2/jKIMShvudSMLSFCma7jb2HBUZZrQ7REMb3glbfq	1	postgres	2022-07-29 12:47:11.461588	172.168.80.26/32	\N	\N	\N	\N	\N
242	242	PALTAMIRANO2	$2b$10$dvA2BKinsrPIad/yc8ilHeEZ/MhzVSipRUg1D6XOWvgzaJTkt17ie	1	postgres	2022-07-29 12:47:11.469937	172.168.80.26/32	\N	\N	\N	\N	\N
243	243	FRODRIGUEZ	$2b$10$ZiOWAU72pZmeTRayAx.TM.CCxBqCTg3JC/0BkE/BiP4.I21XKsvCW	1	postgres	2022-07-29 12:47:11.478491	172.168.80.26/32	\N	\N	\N	\N	\N
244	244	RTRUJILLO2	$2b$10$K3ZyTSRgwcNlEkZPZ6pRguzOa.vY3.7SpusF/TtwvYjYJS0rgQADy	1	postgres	2022-07-29 12:47:11.486671	172.168.80.26/32	\N	\N	\N	\N	\N
245	245	SPEREZ	$2b$10$5nGUm3wuud0X7VA7UqjHd.Pa8KyqGM7PIyovbAxrT9QpjdOTPHbmm	1	postgres	2022-07-29 12:47:11.49529	172.168.80.26/32	\N	\N	\N	\N	\N
246	246	RCOELHO	$2b$10$I/pc5AAPIP4zxJHpa6wrZeL2kgce9xvuvYtAdo.UolOLq0OvbM/Ki	1	postgres	2022-07-29 12:47:11.520307	172.168.80.26/32	\N	\N	\N	\N	\N
247	247	JQUISBERT2	$2b$10$emEuAoHjtPF02OSz8YGxB.mv6UI/njHzWNuuOU5nZPmiD.PJcbWnu	1	postgres	2022-07-29 12:47:11.55347	172.168.80.26/32	\N	\N	\N	\N	\N
248	248	DMAMANI2	$2b$10$3a1Xd5AXPzxMQFlrBRzipe.WWs2J95uMi3mIv5A1f74BF8D4HbAmW	1	postgres	2022-07-29 12:47:11.678785	172.168.80.26/32	\N	\N	\N	\N	\N
249	249	FMELGAR	$2b$10$6fEqF.UR.8PR4FrgYhufdeA1huHW.GemtrPIgBbzaACeRc2bxHSOe	1	postgres	2022-07-29 12:47:11.692444	172.168.80.26/32	\N	\N	\N	\N	\N
250	250	KTERRAZAS	$2b$10$ScUMsdeaVZKQ7io0WyeczuRWDRdSeuRn9IAi45GIMpYZlZlo2.hey	1	postgres	2022-07-29 12:47:11.703472	172.168.80.26/32	\N	\N	\N	\N	\N
251	251	HERAZO	$2b$10$d7e1AYq0emif//5n6zeCGueU56/N/eEx3hvZq36eUdgXcxl4pNDme	1	postgres	2022-07-29 12:47:11.711578	172.168.80.26/32	\N	\N	\N	\N	\N
252	252	MSILES	$2b$10$3kmdDD.Uj.IXT2ukLjHFFO8Vo8xQKFtQiDplp/AaBhpoQhE.rVAfi	1	postgres	2022-07-29 12:47:11.825749	172.168.80.26/32	\N	\N	\N	\N	\N
253	253	DFLORES	$2b$10$ga1hwQhgTzXHUYxNclZyqu6f25v0WGtzHBpaoO8kkF.gmJPUsdSJu	1	postgres	2022-07-29 12:47:11.845012	172.168.80.26/32	\N	\N	\N	\N	\N
254	254	CCHALAR	$2b$10$6KEaOhH/ZrerzCgy9qQ4uusBgjaawMw5Dtw/tlpw5gVWYfE4/kkly	1	postgres	2022-07-29 12:47:11.853351	172.168.80.26/32	\N	\N	\N	\N	\N
255	255	LSMITH	$2b$10$bV9QlVej36jrzz5u1p93VeMTVCMU94O8LijtenzXfavh46eG90yOy	1	postgres	2022-07-29 12:47:11.861708	172.168.80.26/32	\N	\N	\N	\N	\N
256	256	RTORREJON	$2b$10$2C1i5IPUnSK364uoMDkHje1CBhDHy3AyaeCTGsbOg.TPrHrzMTFeK	1	postgres	2022-07-29 12:47:11.869923	172.168.80.26/32	\N	\N	\N	\N	\N
257	257	IESPINOZA	$2b$10$EfTXMULxusvm9mlodkUpgOkvFB3G4BK0nrLyI8D9kMgSk1rp6yD5y	1	postgres	2022-07-29 12:47:11.878163	172.168.80.26/32	\N	\N	\N	\N	\N
258	258	DVACA	$2b$10$bb545ahyvAusdUh7R93Gv.Pl3PUc5IHOVjgDNhRd8Vwy/nFc59dlG	1	postgres	2022-07-29 12:47:11.886438	172.168.80.26/32	\N	\N	\N	\N	\N
259	259	LVILLARREAL	$2b$10$Py9Kiyo3ICZ1/L38gofakOONlUEC5daFtGDHyDad0pCq6hssDzd1m	1	postgres	2022-07-29 12:47:11.894916	172.168.80.26/32	\N	\N	\N	\N	\N
260	260	RANTELO	$2b$10$mEXPUig.2u3AxY4fy2PgV.v//uW0NGYlvsCtFArZpnFI6BYLfvqsW	1	postgres	2022-07-29 12:47:11.917688	172.168.80.26/32	\N	\N	\N	\N	\N
261	261	RESCOBAR	$2b$10$QSrdmdDs4AqYgqLaf1jr3eq/wNyg7rglEeHSV/TJ/04tVaghs.ENu	1	postgres	2022-07-29 12:47:11.928354	172.168.80.26/32	\N	\N	\N	\N	\N
262	262	RSILES	$2b$10$7Gc.mORreEwIxiLgUonqhOCYTB/D/NBed0vhVRCmF137q1ihhhhZ.	1	postgres	2022-07-29 12:47:11.936677	172.168.80.26/32	\N	\N	\N	\N	\N
263	263	CPAILLO	$2b$10$FSGB9JuUFOedz9Mc.tmVEOpV7D6zf8NKlOJnzQw9n.xGKZjNHkqEe	1	postgres	2022-07-29 12:47:11.944972	172.168.80.26/32	\N	\N	\N	\N	\N
264	264	JCABELLO	$2b$10$JF0K12N7DmF56/Vcl9wR4.U5YVBRgbEcjeWaSdJ7Va4QvMGLTLZvK	1	postgres	2022-07-29 12:47:11.978447	172.168.80.26/32	\N	\N	\N	\N	\N
265	265	HPORCEL	$2b$10$N4H0fDyhAYT0j.lZU7PHROZnERY.5HvD8LraZiHmKJ9oYVanfP5vC	1	postgres	2022-07-29 12:47:11.986607	172.168.80.26/32	\N	\N	\N	\N	\N
266	266	CPANIAGUA	$2b$10$kyeVR06ErHtLgiG5t29CNuxXS4Ztbr4Pxgr/Q7NYpjM7VkRPtCavG	1	postgres	2022-07-29 12:47:11.995135	172.168.80.26/32	\N	\N	\N	\N	\N
267	267	CGALVEZ	$2b$10$XUu0dqPhNiQNluJ9aXtABe8vXkU8k/gPN2zkQY8MiEE2eC2HPDqyG	1	postgres	2022-07-29 12:47:12.003449	172.168.80.26/32	\N	\N	\N	\N	\N
268	268	MVELIZ	$2b$10$AfPY6kQ78pJj6VZG3zv.COlUp8q57V8soxYZ/J/T5/jU2gM0oNDq2	1	postgres	2022-07-29 12:47:12.01149	172.168.80.26/32	\N	\N	\N	\N	\N
269	269	GGONGORA	$2b$10$FGmAToWmxvDvbDTYe4JfFeCemqPTHf1TViA96QimW5HpYuzRSXHuK	1	postgres	2022-07-29 12:47:12.020006	172.168.80.26/32	\N	\N	\N	\N	\N
270	270	JPEREZ	$2b$10$f0aMEkGC8GoNX.tcweLI2.bhC3Rkjb9D78iDQvYHRstfmVNO/k8UK	1	postgres	2022-07-29 12:47:12.028432	172.168.80.26/32	\N	\N	\N	\N	\N
271	271	ACOTA	$2b$10$WAslnwUXhO3alahuft8s6eDdJ3TwcjHTshA6spCA5Zh86Pco0Vg7G	1	postgres	2022-07-29 12:47:12.03667	172.168.80.26/32	\N	\N	\N	\N	\N
272	272	MVINACHA	$2b$10$W7XtcqJ8tWGy9.7IdItTveyKNUWsnJQl3OCQUaF91ACzgEBGFJmjC	1	postgres	2022-07-29 12:47:12.044871	172.168.80.26/32	\N	\N	\N	\N	\N
273	273	FLLANQUIPACHA	$2b$10$lyNhWMnqncAP6io/QAture7S5G9gackuSFtNTR2FxXuQbvDIX2DI2	1	postgres	2022-07-29 12:47:12.053398	172.168.80.26/32	\N	\N	\N	\N	\N
274	274	MCUIZARA	$2b$10$NteXNsCn5xVx5fojtp7WMeKSn2mObKvk3cFY1PMZ5OPS.D5z6vfrm	1	postgres	2022-07-29 12:47:12.061705	172.168.80.26/32	\N	\N	\N	\N	\N
275	275	RPEREZ2	$2b$10$.uH1wmYF.hMq3SzrhiF79OkKio.x333zIt.iyIyMowsAA1VrYSXvy	1	postgres	2022-07-29 12:47:12.070047	172.168.80.26/32	\N	\N	\N	\N	\N
276	276	AORTIZ2	$2b$10$TTDmyU1jL2EQResJUvY1/u8l0FBlyhpMbdyuao1B9vp2gqs2Y4u5K	1	postgres	2022-07-29 12:47:12.078606	172.168.80.26/32	\N	\N	\N	\N	\N
277	277	AORTEGA	$2b$10$ihmaCYephYYM7KhmKVQbiuQ9hO/7kDiJvCA41b/i5dITLHhRyQC9O	1	postgres	2022-07-29 12:47:12.120057	172.168.80.26/32	\N	\N	\N	\N	\N
278	278	SCHAVARRIA	$2b$10$UJFYyQKqvbJ2idlAajLHKu9MJEMYcVB37K3ev5XYhk8KI4bA/ssYW	1	postgres	2022-07-29 12:47:12.128384	172.168.80.26/32	\N	\N	\N	\N	\N
279	279	ARODRIGUEZ	$2b$10$5rt9sQcDwAIfrCX1cmDcu.519PM1.LECxWi0o8HEw9mra7hYISHSm	1	postgres	2022-07-29 12:47:12.136622	172.168.80.26/32	\N	\N	\N	\N	\N
280	280	GCLAURE	$2b$10$E/TgpH/Q6myio3W54vytpezvQeybb8NTqX07JSKlvUMNvWGGjyEdO	1	postgres	2022-07-29 12:47:12.144466	172.168.80.26/32	\N	\N	\N	\N	\N
281	281	PYUJRA	$2b$10$G1k4wXO6fn472uTI98hX9.RaTghVBSeX1cgT7nie/Ea4gTWk3arEK	1	postgres	2022-07-29 12:47:12.153047	172.168.80.26/32	\N	\N	\N	\N	\N
282	282	VALURRALDE	$2b$10$M.rY/cnCzcyZ6CtG9O2xouoKZ9GfB06Hc71jfYPpGd6wRbh3y.r7a	1	postgres	2022-07-29 12:47:12.195016	172.168.80.26/32	\N	\N	\N	\N	\N
283	283	JROBLES	$2b$10$8Lli/u7Lj/8DMHmH8MyXFOcriTuKNI6ZG0aTwwdU06VUxqtLaM0A.	1	postgres	2022-07-29 12:47:12.203597	172.168.80.26/32	\N	\N	\N	\N	\N
284	284	EFERNANDEZ	$2b$10$zVP5BfrEOys.JLk8RGeAEO6HARFb2CNuq6tjPqmnarbVGV3sigt3e	1	postgres	2022-07-29 12:47:12.21161	172.168.80.26/32	\N	\N	\N	\N	\N
285	285	UCUELLAR	$2b$10$Wy.gsKiAV.V7.JUOsvZZYe9zl7ZGZMi7ZeSjKbBwO1dbfOJ9Ph4Ne	1	postgres	2022-07-29 12:47:12.219923	172.168.80.26/32	\N	\N	\N	\N	\N
286	286	EROSALES	$2b$10$71gktxaw/tRPSjwsLkqNJuMD8MXbnVqa6HzZaTlKRsvkwQTgFdJwS	1	postgres	2022-07-29 12:47:12.228375	172.168.80.26/32	\N	\N	\N	\N	\N
287	287	NPOMA	$2b$10$.04.p1.sgt5EKT4hlU8xCe27sPjo3HiwAkbGbkZ50hy9zBi88v5qe	1	postgres	2022-07-29 12:47:12.236798	172.168.80.26/32	\N	\N	\N	\N	\N
288	288	JCOCA	$2b$10$UNQ3hbaxp.EVLBFp4jgLUeqzM8pBGITTAGko2dGkxo6b44vu7y8lC	1	postgres	2022-07-29 12:47:12.261903	172.168.80.26/32	\N	\N	\N	\N	\N
289	289	RROBLES	$2b$10$OdobEM2kmJcqWwe8NjjIveWZoKkeWVJzwAq8A0qxzHuEb4N9Xq6xi	1	postgres	2022-07-29 12:47:12.286918	172.168.80.26/32	\N	\N	\N	\N	\N
290	290	GALVAREZ	$2b$10$tTWsQu4DNel.gxykGfLOA.BjtaPbFH.ge801JsALiqNDe6Wc1gXzu	1	postgres	2022-07-29 12:47:12.311917	172.168.80.26/32	\N	\N	\N	\N	\N
291	291	STORRICO	$2b$10$Dy7e0lwdiPoBTw1cQP4xz.ODOQmm.lTd5DQrMHKrq/e6Ydu/cy4OW	1	postgres	2022-07-29 12:47:12.345067	172.168.80.26/32	\N	\N	\N	\N	\N
292	292	HMARTINEZ2	$2b$10$ZKGJLze50gPe7VH4WkBiJujkjygr2kOke5aBPy8I4Lm3oqNbYQp/O	1	postgres	2022-07-29 12:47:12.370267	172.168.80.26/32	\N	\N	\N	\N	\N
293	293	MCASTILLO	$2b$10$kNNxXok.YEamrhE5lRbsJuaDaXW8T9ycMx8n2jJw3FSHC1UG8SJu.	1	postgres	2022-07-29 12:47:12.395307	172.168.80.26/32	\N	\N	\N	\N	\N
294	294	JBALKE	$2b$10$lbxIVcUVINEiNphz2SMiNeRzv17uJ6yeY6N9TTJ.iYfpKcWYRRl4K	1	postgres	2022-07-29 12:47:12.420269	172.168.80.26/32	\N	\N	\N	\N	\N
295	295	ABLANCO	$2b$10$YRlAba6HDeiFOWFFUd6NlOhQ8xfrqf7JsC9L74bkl0bLaB5sFNSRi	1	postgres	2022-07-29 12:47:12.445248	172.168.80.26/32	\N	\N	\N	\N	\N
296	296	MQUISBERT	$2b$10$ZZbYfvu3Ukj9jQpVVZ7tO.DC2AIMWVIQoCoGzbOTb1nwPDWfp3DQ.	1	postgres	2022-07-29 12:47:12.470344	172.168.80.26/32	\N	\N	\N	\N	\N
297	297	WGUMUCIO	$2b$10$3jqa/JXWq6P0UYYh47VgNe3I.LGpNb1LvPkFD3w3KtDcGgrJh2jW2	1	postgres	2022-07-29 12:47:12.495143	172.168.80.26/32	\N	\N	\N	\N	\N
298	298	EPOMA	$2b$10$kis/0vMQM/Yqf4mUWEXtZe0.IQUcLafR1L2y9fM6LZ6mFcjJgaFem	1	postgres	2022-07-29 12:47:12.520239	172.168.80.26/32	\N	\N	\N	\N	\N
299	299	RARAOZ	$2b$10$Ki.pFcH8VauYXMAQ5Noq0.6ODmBJeQPrmfDnUK3DkXWHUzbm9OhN.	1	postgres	2022-07-29 12:47:12.544976	172.168.80.26/32	\N	\N	\N	\N	\N
300	300	JPALACHAI	$2b$10$uHV7JVYuF9tSaaXHy.AP.OBCuoTnWKo5vQyT2lbt/QjWwi91Dx14G	1	postgres	2022-07-29 12:47:12.570191	172.168.80.26/32	\N	\N	\N	\N	\N
301	301	IISITA	$2b$10$yWajJ0nHVxwEXNtRxpx3UeHM3Lfg6OAzCBA0gAnFlhLprE0cOB0h.	1	postgres	2022-07-29 12:47:12.594996	172.168.80.26/32	\N	\N	\N	\N	\N
302	302	VHUANCA	$2b$10$/MqIufR67oEKpsemrCkQmOuL/27dIoVP1P2u2qSFFDUdcJDWEySd6	1	postgres	2022-07-29 12:47:12.620357	172.168.80.26/32	\N	\N	\N	\N	\N
303	303	EPATZI	$2b$10$IEMSIqq3aCmGS9MAyUH/K.Iqg0WxWeqLZEW1mtmu02KQ4zE2x5AZe	1	postgres	2022-07-29 12:47:12.64528	172.168.80.26/32	\N	\N	\N	\N	\N
304	304	RCALAMANI	$2b$10$2Qh2XEzAVZ8/gkqKIjCV3uWVF3mQyjhfzwNAP/KWo7brSBnq5QZYe	1	postgres	2022-07-29 12:47:12.676829	172.168.80.26/32	\N	\N	\N	\N	\N
305	305	LCASTELLANOS	$2b$10$PhMJ.dogeMrVtg8iBN/1E.k/zWx9CqfalTxtc.P5Y9zNmpPjKKsx6	1	postgres	2022-07-29 12:47:12.687075	172.168.80.26/32	\N	\N	\N	\N	\N
306	306	PRUIZ	$2b$10$Rb0TqWdkAuFtskCpFOm4WegzG0fT7zqHGcZmy5LAaRLeHhGQnXWce	1	postgres	2022-07-29 12:47:12.711826	172.168.80.26/32	\N	\N	\N	\N	\N
307	307	AORTIZ	$2b$10$6qBIHsTzQ/5CzCQD0vk15eB1JKA48RCZqu5.Fe7QlHX7sG4IvaZO6	1	postgres	2022-07-29 12:47:12.720058	172.168.80.26/32	\N	\N	\N	\N	\N
308	308	JPOMACOSI	$2b$10$D/sEumtjq1Q2aRTFZU5U3.p1J7g.gv62ezv1bdk452C7oHgx1Up.C	1	postgres	2022-07-29 12:47:12.728523	172.168.80.26/32	\N	\N	\N	\N	\N
309	309	JNACIR	$2b$10$KkGQ4kk4XRBLE5HLT9Wtp.Of8i4LsJUFUjRZVwe5jTuIW2JubZDxe	1	postgres	2022-07-29 12:47:12.736682	172.168.80.26/32	\N	\N	\N	\N	\N
310	310	RFLORES	$2b$10$lCryI55vkU6pAWPnOMb26..7aoKUVYWaF8jYPvOdcP7KbrVH9cTu2	1	postgres	2022-07-29 12:47:12.744898	172.168.80.26/32	\N	\N	\N	\N	\N
311	311	NLOPEZ	$2b$10$LG94WAiDuCQ1YsR3THiH7OsjLsE90ByywzZQvNbcJm4rZjxqAJsTS	1	postgres	2022-07-29 12:47:12.753355	172.168.80.26/32	\N	\N	\N	\N	\N
312	312	RLLANOS	$2b$10$y1h6KO1Kin1npbVy2qTQ6eilOmxv4VBQDnFfYS7PDsuDpTcnPrpXS	1	postgres	2022-07-29 12:47:12.761576	172.168.80.26/32	\N	\N	\N	\N	\N
313	313	JCONTRERAS	$2b$10$w2Nf8KXMdL.iWFEtkKykVuh8kZhN99cjbRJkoKGd8r0TYdLz0W5L.	1	postgres	2022-07-29 12:47:12.769946	172.168.80.26/32	\N	\N	\N	\N	\N
314	314	AMARCA	$2b$10$rJ0g9B9Met5OP3UFamKTrunCSYKVbu7SbOfbkj54ePNdHYKZ5YfsS	1	postgres	2022-07-29 12:47:12.778346	172.168.80.26/32	\N	\N	\N	\N	\N
315	315	YFARFAN	$2b$10$LDB8i51pqeOcKbmmLW0yNOd4KydczKhNQxW7Q2/oVYvM5DJZEpQLS	1	postgres	2022-07-29 12:47:12.786421	172.168.80.26/32	\N	\N	\N	\N	\N
316	316	MARTEAGA	$2b$10$jHP8ypP/dRn7tOHnw5mAIue73eRHfkz7E24.c4izqJkBT6yhW4jza	1	postgres	2022-07-29 12:47:12.794983	172.168.80.26/32	\N	\N	\N	\N	\N
317	317	IGALLARDO	$2b$10$2Qwr4Mznj0nvR5NgoZJDfeSyzduHjdggP7JQOJk62dslKQY.WmWLm	1	postgres	2022-07-29 12:47:12.802992	172.168.80.26/32	\N	\N	\N	\N	\N
318	318	MLIPA	$2b$10$xqolnXxM9KKORXg0EHusxuqE6wA/Tcbi2LfoH4fRWxALusgIKFJ7G	1	postgres	2022-07-29 12:47:12.811392	172.168.80.26/32	\N	\N	\N	\N	\N
319	319	NCHACON	$2b$10$x5zNbVle159SrJ1Pj6yhje74spV33ySjJ5URfKXM3d1KzKrhzbDde	1	postgres	2022-07-29 12:47:12.819558	172.168.80.26/32	\N	\N	\N	\N	\N
320	320	FACHA	$2b$10$XCSKPA8sDFyoizEvLNbEu.L4RK.qvFmwRGnmX444zgDZqTOZdG5gS	1	postgres	2022-07-29 12:47:12.827886	172.168.80.26/32	\N	\N	\N	\N	\N
321	321	JALVAREZ	$2b$10$rvfjGcNfo7mwUpmPY8BR8OhmIsNVwoojQD0Kzx71gGdhYYFHeN65K	1	postgres	2022-07-29 12:47:12.836232	172.168.80.26/32	\N	\N	\N	\N	\N
322	322	ADURAN	$2b$10$am8qxsfXY4cBd671KxOsyOCSh/.THngpU/tq2fk1RW98xdbB//OuS	1	postgres	2022-07-29 12:47:12.844615	172.168.80.26/32	\N	\N	\N	\N	\N
323	323	MQUIROGA	$2b$10$4cJPDpg6MkkCMMmbEAIQ1.D4avNqSaIzjC2dW06...NMMQU3Z9Q0i	1	postgres	2022-07-29 12:47:12.852808	172.168.80.26/32	\N	\N	\N	\N	\N
324	324	FBUTRON	$2b$10$p9nwUql.QWsymFsK9Ayq/e6F6LPLhnA.BRZkfPZ.U.i6uXT0KCt1m	1	postgres	2022-07-29 12:47:12.861261	172.168.80.26/32	\N	\N	\N	\N	\N
325	325	TACHAVAL	$2b$10$4ehkuEmFsV1mj5ZnmI4w6eW9XzudsY5EJfkmkS/zNmM293k2Q2AFG	1	postgres	2022-07-29 12:47:12.869558	172.168.80.26/32	\N	\N	\N	\N	\N
326	326	LVELARDE	$2b$10$bm06Ck00GmJhTJy70Q3E.u25j.tRwXpdpGVdgME.gPhwjSx7EGDP2	1	postgres	2022-07-29 12:47:12.884289	172.168.80.26/32	\N	\N	\N	\N	\N
327	327	MGOMEZ	$2b$10$bHJaMeF09UP4nrMPzqwk/u20OExYqR.WI2m1RmmHlH9NOhtdBQ0lm	1	postgres	2022-07-29 12:47:12.89486	172.168.80.26/32	\N	\N	\N	\N	\N
328	328	JGAMEZ	$2b$10$e3k2ND8dlukuMB8kRmVDNuTtiO.8tpRnSHXQ6ZF7Apo4wB92dc3Wi	1	postgres	2022-07-29 12:47:12.903205	172.168.80.26/32	\N	\N	\N	\N	\N
329	329	EARO	$2b$10$NwKonVeDdUXHqtmfs0P.GuS3F8c9XbS1o06/FhAQe/6vFes/a5NM6	1	postgres	2022-07-29 12:47:12.911576	172.168.80.26/32	\N	\N	\N	\N	\N
330	330	MGARZON	$2b$10$2d/ft0P2D8SeirOGcbZfz.l4zLlhISqzn6oX7YBWsjJ0bpqwGki02	1	postgres	2022-07-29 12:47:12.919825	172.168.80.26/32	\N	\N	\N	\N	\N
331	331	JSANCHEZ2	$2b$10$1ZfmuQ8d8bezjodAl6IpreJvglM49gNwiQ1Ut1ZgPbi9cDXtTGSsq	1	postgres	2022-07-29 12:47:12.92835	172.168.80.26/32	\N	\N	\N	\N	\N
332	332	DMOLLINEDO	$2b$10$grJZUE0myOl/J3AdwtwTdeLAEySn57lCcZk6TCGNuw/7R7gKnEhre	1	postgres	2022-07-29 12:47:12.936432	172.168.80.26/32	\N	\N	\N	\N	\N
333	333	FMENDOZA2	$2b$10$Ag5bJ98LHZYUXrbbEfedP.phBDtJxUJ3u8afWecZefHP/EaHZu2nC	1	postgres	2022-07-29 12:47:12.944946	172.168.80.26/32	\N	\N	\N	\N	\N
334	334	YDELGADO	$2b$10$oHpLJzwCNA/Xq4beemSEnutlDbDPLrDZqre8Kne3d9CqfjpNojHva	1	postgres	2022-07-29 12:47:12.953238	172.168.80.26/32	\N	\N	\N	\N	\N
335	335	EMARCA2	$2b$10$MJRhXBI2k5Pkpg/l/JDnZOoi3tXKB2d6VADXdHFbkDtzBwhTLqL0S	1	postgres	2022-07-29 12:47:12.961565	172.168.80.26/32	\N	\N	\N	\N	\N
336	336	MMOROCHI	$2b$10$RuKWcSujmy2C9aLgYtIxoefI37oW8U3ULjoHXbWnJg5gXOExd3Eci	1	postgres	2022-07-29 12:47:12.969849	172.168.80.26/32	\N	\N	\N	\N	\N
337	337	JNEGRETE	$2b$10$Ykp4KKWmRKfKIcezWuuiYeX61DOuviAeIPjNPLpeDhzLDLc3MiOmC	1	postgres	2022-07-29 12:47:12.978254	172.168.80.26/32	\N	\N	\N	\N	\N
338	338	HMARTINEZ3	$2b$10$dpeQy7UcSN2HINlIDl71COqGvtjuu.iL57AaGXyGFq7KZGGfdm6RC	1	postgres	2022-07-29 12:47:12.986387	172.168.80.26/32	\N	\N	\N	\N	\N
339	339	RMOJICA	$2b$10$kSuwDQTUdnpjrb2Hx2.Tp.KCzyYssEhj6uaOiSN2K.Ifu5P7ke2qi	1	postgres	2022-07-29 12:47:12.994741	172.168.80.26/32	\N	\N	\N	\N	\N
340	340	FRAMOS	$2b$10$DgIZGDja40AeRJbbBwEDpu0oHxPUxhXyaY4zAjmSIAFZzkgGEIZRS	1	postgres	2022-07-29 12:47:13.003229	172.168.80.26/32	\N	\N	\N	\N	\N
341	341	RMANGUTA	$2b$10$9SRgb/tEyEz4GWe/TG6GyOnn9vReT1dOh68dOr5pgAlAjr/AHwCMC	1	postgres	2022-07-29 12:47:13.0116	172.168.80.26/32	\N	\N	\N	\N	\N
342	342	EGARCIA	$2b$10$DxYE.TS1uFLUjMaVvH/puuqky/cEPmGPxWrBKZCholxHQCptUH/4a	1	postgres	2022-07-29 12:47:13.019892	172.168.80.26/32	\N	\N	\N	\N	\N
343	343	TMAGARIÑOS	$2b$10$cQtTpnZwAvSqGw2SHk5Y3ugKkCYRaxU1vmcOdAP1EpZr.DL3s429u	1	postgres	2022-07-29 12:47:13.02832	172.168.80.26/32	\N	\N	\N	\N	\N
344	344	GVILAR	$2b$10$7xNWdSILN0QY0eu1aeUymesOR0EQK1MeO96rCDAeQU/1N6GMo3a/.	1	postgres	2022-07-29 12:47:13.036785	172.168.80.26/32	\N	\N	\N	\N	\N
345	345	EALCOCER	$2b$10$QSqn.zyZJ2J8onEMkrFZJuXBzy4JhvHAPAULfJH5MvAIl04K.xgbm	1	postgres	2022-07-29 12:47:13.20177	172.168.80.26/32	\N	\N	\N	\N	\N
346	346	JRAMIREZ	$2b$10$jNBZukh1fLh3YyJp1vqtue0L1PmUNMICplWtGyVrlG3pwUWOenqOq	1	postgres	2022-07-29 12:47:13.354001	172.168.80.26/32	\N	\N	\N	\N	\N
347	347	AMARQUEZ	$2b$10$hXVrXBlGy/hBuM/rATFxm.LapVfubTd1wfjfbWe24mLN8ECYjxla2	1	postgres	2022-07-29 12:47:13.368163	172.168.80.26/32	\N	\N	\N	\N	\N
348	348	LLOPEZ	$2b$10$KwJxXBpsd6XWi6/j0M25t.IWI8dGMM1k631xmNig4BPEtCu8hFRCu	1	postgres	2022-07-29 12:47:13.378514	172.168.80.26/32	\N	\N	\N	\N	\N
349	349	FDELGADILLO	$2b$10$MBVKlHymh/W33EpIafhp1Oi/3DH3kZBdroY0/YsgcrH09NKs0JFSi	1	postgres	2022-07-29 12:47:13.40153	172.168.80.26/32	\N	\N	\N	\N	\N
350	350	SRIVAS	$2b$10$.a/GdwGAF4YqfR1mpZ/JRu8M8hj79fUFez0lyDdZ1LO82QS3pPFPe	1	postgres	2022-07-29 12:47:13.411788	172.168.80.26/32	\N	\N	\N	\N	\N
351	351	NCORONEL2	$2b$10$PygVsqNY7vrLPmhZUFOJue1MxAFwzzR7mQFPVDRzrUsHLIs/A555C	1	postgres	2022-07-29 12:47:13.420272	172.168.80.26/32	\N	\N	\N	\N	\N
352	352	GGUILLEN	$2b$10$HRzaZ/kmhK9Vd3ee8H.vPecrenZoE/h8WUhoNNpyl9JxpMij76X1e	1	postgres	2022-07-29 12:47:13.428745	172.168.80.26/32	\N	\N	\N	\N	\N
353	353	MURQUIETA	$2b$10$UyIh2tD9yyUWF0SXyR0HiOR2y83/ecSDUI6m6YKOFhRZzK7wU71zu	1	postgres	2022-07-29 12:47:13.436985	172.168.80.26/32	\N	\N	\N	\N	\N
354	354	JALBAN	$2b$10$O/4.CDP1l0RzIToJi2cA8.IIU.NNKNQZ0swigQ4tZyo6XqrTtpzfS	1	postgres	2022-07-29 12:47:13.445154	172.168.80.26/32	\N	\N	\N	\N	\N
355	355	OTERRAZAS	$2b$10$G.bbSkOEZlwRZ7tyTx0D2Ou.hxw8NeMJUOU7uXPJHZMMVX9QeafdS	1	postgres	2022-07-29 12:47:13.453613	172.168.80.26/32	\N	\N	\N	\N	\N
356	356	GZAMORANO	$2b$10$y7L16ZldPJYTkuIUaIpEpOBE2kPZSetNZZxPPSkWcaSIC/04qnrpy	1	postgres	2022-07-29 12:47:13.48476	172.168.80.26/32	\N	\N	\N	\N	\N
357	357	GGOMEZ	$2b$10$Jco8h9aRbspMnIAvWDhJdOlsRLVZByJuFwtnrvgY6t1IOPM5S95iO	1	postgres	2022-07-29 12:47:13.501174	172.168.80.26/32	\N	\N	\N	\N	\N
358	358	EORTIZ	$2b$10$y.GJjazVpHwCCBGd3Chyx.iytThZwx3fs9szC/GDMENV/l1T6MU7S	1	postgres	2022-07-29 12:47:13.618257	172.168.80.26/32	\N	\N	\N	\N	\N
359	359	MPASTRANA	$2b$10$0MPzyuP740LVl79x4S5JZOBqDeK3K/j0LlCNRrMDTI/3O3kws8bKe	1	postgres	2022-07-29 12:47:13.661891	172.168.80.26/32	\N	\N	\N	\N	\N
360	360	NCORONEL	$2b$10$SfK0YrufVKpYZI1S5GkyQ.xzm9XUcIMSum8qSNFnKuNO5.2xDjzYy	1	postgres	2022-07-29 12:47:13.670157	172.168.80.26/32	\N	\N	\N	\N	\N
361	361	LIBAÑEZ	$2b$10$CwuJF6MpXIOt4xXYke9vluJr7zCvmlIzFaEql0LOddBgLIiurLcUC	1	postgres	2022-07-29 12:47:13.678511	172.168.80.26/32	\N	\N	\N	\N	\N
362	362	MALDANA	$2b$10$Cqf1oJaxkCWzEcQJHlJnWu0Ln00fSGzQ04Jz39O1W8evWoG1DMwiK	1	postgres	2022-07-29 12:47:13.692175	172.168.80.26/32	\N	\N	\N	\N	\N
363	363	VMARAZ	$2b$10$BP2bcbhe8EPCIIDBYIbhAeScE8Bo1XWYRAxdTZDlKdj0m53F2a.Ky	1	postgres	2022-07-29 12:47:13.703761	172.168.80.26/32	\N	\N	\N	\N	\N
364	364	JMOYA	$2b$10$aeX/Ig2zi.iEPIjXT3W/DO8EPX7VPwVyZ4wfCJffwV5UKlEmvWJrC	1	postgres	2022-07-29 12:47:13.83827	172.168.80.26/32	\N	\N	\N	\N	\N
365	365	OPOLO	$2b$10$stSWHh6C1Iy6kXI6Obg4LuzSaoLbgoDZCSI2kfBWatkxiAX0hvUSe	1	postgres	2022-07-29 12:47:13.901942	172.168.80.26/32	\N	\N	\N	\N	\N
366	366	SVACA	$2b$10$BIGs1UmBo2Ja1BQmBe7j8uaiwJAL1Jr3sL/dR1ZHVPSVgGYg9F7Zq	1	postgres	2022-07-29 12:47:13.911799	172.168.80.26/32	\N	\N	\N	\N	\N
367	367	OHUANCA	$2b$10$uxPpAYgY95JjYJPSonDAMuiL7M7GCNTx8YMI/D3OCMkH2SiFAN0iW	1	postgres	2022-07-29 12:47:13.92002	172.168.80.26/32	\N	\N	\N	\N	\N
368	368	AALIAGA	$2b$10$Td1gj7f8zIR.hCF6gmQKnetwyuoyawgrz8AIvT3XkNXFY4xjT2HvO	1	postgres	2022-07-29 12:47:13.928308	172.168.80.26/32	\N	\N	\N	\N	\N
369	369	LALBA	$2b$10$rKqvS2wor0tCLmi6VKHONumloR2DBpAYZtEeuh5OmoOKggYffD39a	1	postgres	2022-07-29 12:47:13.936487	172.168.80.26/32	\N	\N	\N	\N	\N
370	370	RMORE	$2b$10$ddgUGMcyoqwiFN1AGdAQieRitFNvMLWsDB7ympWqkN7EclpUGZDeS	1	postgres	2022-07-29 12:47:13.944753	172.168.80.26/32	\N	\N	\N	\N	\N
371	371	BMONTAÑO	$2b$10$EtD7KnQNMsDFU8F6dG579.LZ6WSNaY1pjD6vd4fnDyo8oqs4BKD9S	1	postgres	2022-07-29 12:47:13.953112	172.168.80.26/32	\N	\N	\N	\N	\N
372	372	DAPURI	$2b$10$e/SRn8iIij.xdV8tNuQGG.t.zw.hdECtduyRUVt.UmqGgdqUCC/j.	1	postgres	2022-07-29 12:47:13.961386	172.168.80.26/32	\N	\N	\N	\N	\N
373	373	ACABALLERO	$2b$10$ECrYhPO8bD7Chc.ymRQFouIJ5D/qJN7Wv6ziM06lG/hVK8CdOD1/C	1	postgres	2022-07-29 12:47:13.969895	172.168.80.26/32	\N	\N	\N	\N	\N
374	374	VVASQUEZ2	$2b$10$jLZevlrKyVCvTLb55PghpuSG2eV7OFQ4XyHjxs/btZstc4dX17dkO	1	postgres	2022-07-29 12:47:13.978168	172.168.80.26/32	\N	\N	\N	\N	\N
375	375	LCHAO	$2b$10$nJLapzF9WnVurQwFqW8OcO4axDXFYN13gqLu6T0lOJpSC4NZrXEHi	1	postgres	2022-07-29 12:47:13.986473	172.168.80.26/32	\N	\N	\N	\N	\N
376	376	JCALCINA	$2b$10$6e82LESsk6psRxQuysnIceGB/aOHppYXh/QZOzeCLfP9qhU3DhG6G	1	postgres	2022-07-29 12:47:13.994701	172.168.80.26/32	\N	\N	\N	\N	\N
377	377	NBLANCO2	$2b$10$N1ALJw7Mlw6td7phyP3aKOnmS8qu7yhwW2q.ZDycEi9elhqM79LbG	1	postgres	2022-07-29 12:47:14.003322	172.168.80.26/32	\N	\N	\N	\N	\N
378	378	DMAMANI	$2b$10$oNFCkA4cXSSa5czPxQCNDuCXJ3SLZPsglkMgksIsqhqc4OGbWZKou	1	postgres	2022-07-29 12:47:14.011442	172.168.80.26/32	\N	\N	\N	\N	\N
379	379	STERRAZAS2	$2b$10$OjbLIR0LH4n0rw0pQRV6E.1TrdaorOAymmSSn1kIPxZ89Xe1EkIoC	1	postgres	2022-07-29 12:47:14.020047	172.168.80.26/32	\N	\N	\N	\N	\N
380	380	JLOPEZ	$2b$10$foAV/e1XgyzVm/3RHW6wS.tVjUo4YEiyxFx4G6NA7bcHqqkrR2y5K	1	postgres	2022-07-29 12:47:14.025707	172.168.80.26/32	\N	\N	\N	\N	\N
381	381	LVACA2	$2b$10$iydneaM2/8ypa1KrdZUXNOpc75bAJhUx4tLF.WZgS1R1OgfGunA2C	1	postgres	2022-07-29 12:47:14.034135	172.168.80.26/32	\N	\N	\N	\N	\N
382	382	MCHAVEZ	$2b$10$oMaMgYe0EXQFq88QYQk54Ou56M6h5OijwHRdmg4wX0odByiGDbV3K	1	postgres	2022-07-29 12:47:14.042568	172.168.80.26/32	\N	\N	\N	\N	\N
383	383	EARANO	$2b$10$yLVf5/PJ5DFpYql.YoqYwe9oEdX2lAAguYqv4PcvDwaZX5J121JdW	1	postgres	2022-07-29 12:47:14.050658	172.168.80.26/32	\N	\N	\N	\N	\N
384	384	GEJURO	$2b$10$YKCqMFBu8b2YmZLqR1N3puzZvRRFueN7pXaZDIldbJXlApG/E6Q7G	1	postgres	2022-07-29 12:47:14.059247	172.168.80.26/32	\N	\N	\N	\N	\N
385	385	MSUAREZ	$2b$10$9kos5/2PdXcoWv8qWCC1Z.Fpm/PdtQyrSx6Kwx7dy3yRQUZs5LEUu	1	postgres	2022-07-29 12:47:14.06752	172.168.80.26/32	\N	\N	\N	\N	\N
386	386	VCALIZAYA	$2b$10$35wkxFM6D/ecTVc2wl3WE.iEiHHPLqUTI.6Mr.BQmkpOpN4fIH6DK	1	postgres	2022-07-29 12:47:14.075937	172.168.80.26/32	\N	\N	\N	\N	\N
387	387	FMENDOZA	$2b$10$mvZSRknJemxubeubGlvgQucNboxrsCQOID4xG6agrx04Ay.tAjUzW	1	postgres	2022-07-29 12:47:14.084126	172.168.80.26/32	\N	\N	\N	\N	\N
388	388	MROSA	$2b$10$Qmdc2v76ylqp8IsFwtx0U.FApLN3hO2t7H0aolem2gjYXTdtp6JP6	1	postgres	2022-07-29 12:47:14.092349	172.168.80.26/32	\N	\N	\N	\N	\N
389	389	YBELTRAN	$2b$10$1Sy31nJ5r0XJ3MmdYholauYRbGSTYxATXD6LktmiJ.PlXZQ6xEFV.	1	postgres	2022-07-29 12:47:14.100628	172.168.80.26/32	\N	\N	\N	\N	\N
390	390	JMEDINA	$2b$10$0U2vmkgjMmToTrELtWFID.PDE/W8HapoPue8RjQKlh9xHHRAeAxMW	1	postgres	2022-07-29 12:47:14.10955	172.168.80.26/32	\N	\N	\N	\N	\N
391	391	LDOMINGUEZ	$2b$10$iI/LC3q35JP6j8hWiGHa4eUTA1Ix7Joe/djoeRoj1cZiYjB9blgqy	1	postgres	2022-07-29 12:47:14.117323	172.168.80.26/32	\N	\N	\N	\N	\N
392	392	JSANCHEZ	$2b$10$RzhQ7bYgZErcL.tbKhBiR.8nMdWuRVytrVft7tvWqzS5BhUb8DXRm	1	postgres	2022-07-29 12:47:14.126014	172.168.80.26/32	\N	\N	\N	\N	\N
393	393	DRIVERO	$2b$10$qrcav6xnaDCx0nGN/RdTGOvBvcJ463.zWYRqlJn0PZ9TRaMOwRikW	1	postgres	2022-07-29 12:47:14.134245	172.168.80.26/32	\N	\N	\N	\N	\N
394	394	JANCALLE	$2b$10$1rdRZo/TkHGUOPVyw8TccuHimHwGtYwrV2b51HOK95kRPxa9qnz1O	1	postgres	2022-07-29 12:47:14.142716	172.168.80.26/32	\N	\N	\N	\N	\N
395	395	LFUENTES2	$2b$10$6pn1i2ljso4pYuK7ki.RIetT4Vg7qa8c4YM7rayDoc7mGStn7pIVe	1	postgres	2022-07-29 12:47:14.15074	172.168.80.26/32	\N	\N	\N	\N	\N
396	396	EBALBOA	$2b$10$IXk7ZQjTmKURj8JrzVBWWeOgJnJV7gIR49BnOClkpvSzBqhWjfqTO	1	postgres	2022-07-29 12:47:14.159289	172.168.80.26/32	\N	\N	\N	\N	\N
397	397	OOSINAGA	$2b$10$BxFYrDVsqM3ygPM1xNp.cO3Q1NIADej1ucCVTdxARGhis6h0frDy2	1	postgres	2022-07-29 12:47:14.167718	172.168.80.26/32	\N	\N	\N	\N	\N
398	398	AESPINOZA	$2b$10$Nm2LCcOv.4W6Z1RrrhtOu.RNRyoMsUyTqegqgm5H1Pgrk99iBI.Ha	1	postgres	2022-07-29 12:47:14.175896	172.168.80.26/32	\N	\N	\N	\N	\N
399	399	LILICH	$2b$10$687ixLKJ7JcA4slNpVPFj.LA9aU2UwL2BuHeP6l5h2.6cMPL7Ozaq	1	postgres	2022-07-29 12:47:14.184182	172.168.80.26/32	\N	\N	\N	\N	\N
400	400	RLOPEZ	$2b$10$wTWjHTGpmeAC4awqoejXmuECTg3lut28b8wws9VuMuZkY.HO67DMa	1	postgres	2022-07-29 12:47:14.192624	172.168.80.26/32	\N	\N	\N	\N	\N
401	401	SCONDORI	$2b$10$P.Kmwr5nOSGrZA1obSsmaezxTWBVRsby1URbW/7m4UzfL1khsDu.O	1	postgres	2022-07-29 12:47:14.200851	172.168.80.26/32	\N	\N	\N	\N	\N
402	402	PFERNANDEZ	$2b$10$QtpYDepghdCh0tblrdt7oOUeb5RR8SXs8FdK6plrfvqwyhXQyRZHC	1	postgres	2022-07-29 12:47:14.209164	172.168.80.26/32	\N	\N	\N	\N	\N
403	403	JFLORES2	$2b$10$ZqISsmbNQYhKn8Z2OEXCQuaLErzyisKyyubrpW0qMP2jTHZOWuuza	1	postgres	2022-07-29 12:47:14.217598	172.168.80.26/32	\N	\N	\N	\N	\N
404	404	JNOGALES	$2b$10$JznqvOV.YrFCxyJ0GScFMO6Ha2kwAQRm8rcqww7z.EZHvbXeG6Hbu	1	postgres	2022-07-29 12:47:14.259516	172.168.80.26/32	\N	\N	\N	\N	\N
405	405	YCARTAGENA	$2b$10$IKtsRZmNAqUPsp6jw.iRDemnceqtT8AdFXeHPIM6dYZY2alrXmQ4a	1	postgres	2022-07-29 12:47:14.267471	172.168.80.26/32	\N	\N	\N	\N	\N
406	406	JLOZA	$2b$10$o06A9QI/ylYm6plfwfQ2Z.zAAAj8fsP5OAfWvSWBlT2qXPOzfUKhm	1	postgres	2022-07-29 12:47:14.27577	172.168.80.26/32	\N	\N	\N	\N	\N
407	407	FALCOCER	$2b$10$cfdCanlGTbCYMAVg5d5wD.92Fcm4wW.dJDJMdjfQEvlej3vufhVvW	1	postgres	2022-07-29 12:47:14.284267	172.168.80.26/32	\N	\N	\N	\N	\N
408	408	SRAMOS	$2b$10$r.ArxV5AOtPx/ZYz1UXgeOSQTVoMLDAIaL9/9YIDntKVlp8tJH16W	1	postgres	2022-07-29 12:47:14.292701	172.168.80.26/32	\N	\N	\N	\N	\N
409	409	JFARFAN	$2b$10$4sqxY3nI6Y77Bkvuu17nyeGt2JSM6ZqNdf5g5eyY8JacbmnEVQhAS	1	postgres	2022-07-29 12:47:14.300729	172.168.80.26/32	\N	\N	\N	\N	\N
410	410	NCARDOZO	$2b$10$pD/Uw39/M4eUvyXr4NEnVe4mFnGjOT86shIplowzeB1VgzNYgAeYC	1	postgres	2022-07-29 12:47:14.309467	172.168.80.26/32	\N	\N	\N	\N	\N
411	411	MSILISQUE	$2b$10$8abSTuB1x4bT6VlAh.lWaes7gBC8wryH5j0H.Ej/4SirOc4WhBLDO	1	postgres	2022-07-29 12:47:14.317413	172.168.80.26/32	\N	\N	\N	\N	\N
412	412	JECHALAR	$2b$10$HM17YgryBs3PsbXQBTA7SODayLhk3w.i0gBfhK480uY0OSCYd/8UG	1	postgres	2022-07-29 12:47:14.325822	172.168.80.26/32	\N	\N	\N	\N	\N
413	413	ECOCTANA	$2b$10$IralX.vWEI0EddVGgUiq0un9vG8Lc1Mh1nJa6m9yjDTWv04iLlD6K	1	postgres	2022-07-29 12:47:14.334107	172.168.80.26/32	\N	\N	\N	\N	\N
414	414	JMENDEZ2	$2b$10$EPrPbbz6pM9Qa6ixAHLT.u8mC5RtBiAcc4C3BRzf6Nf4h1v0XvNPu	1	postgres	2022-07-29 12:47:14.3426	172.168.80.26/32	\N	\N	\N	\N	\N
415	415	EZAMBRANA2	$2b$10$q5QkfwGdK1cratCh.ab1oe8CctN8oTZ8qsncDLQ7gfjS3A3sLF6Yq	1	postgres	2022-07-29 12:47:14.350678	172.168.80.26/32	\N	\N	\N	\N	\N
416	416	OESPINOZA	$2b$10$8CCkGYd2jEqZ5km4DgXTRe11hsDuj5k66VAetxOEbq5baHCMs/qRu	1	postgres	2022-07-29 12:47:14.359403	172.168.80.26/32	\N	\N	\N	\N	\N
417	417	SIQUISE	$2b$10$4iTd9iNSX1rXhAVnpCngM.G3fjV68sypMUT7h8iBAV4xtX2wsqwcS	1	postgres	2022-07-29 12:47:14.409201	172.168.80.26/32	\N	\N	\N	\N	\N
418	418	PVILLARROEL	$2b$10$PqxvIbaUCRnTEXoUKSePsO99mKkH8xMmZas7kBOLL9SiYpfOyH5vi	1	postgres	2022-07-29 12:47:14.417399	172.168.80.26/32	\N	\N	\N	\N	\N
419	419	APALOMINO	$2b$10$ORMImIk23WytN9XeVD.W4.HN9I.ERLFGpPtgpX5H//64gLQwTs3pO	1	postgres	2022-07-29 12:47:14.42591	172.168.80.26/32	\N	\N	\N	\N	\N
420	420	JTITO2	$2b$10$Hs/viuOPUYsB4sMHVmImruQrkZeKXWyeZfqgobjzqg5kmBclnbwyO	1	postgres	2022-07-29 12:47:14.434034	172.168.80.26/32	\N	\N	\N	\N	\N
421	421	AESPADA	$2b$10$RjXQeRpnha5.7HqQ8ny90uSWED2F35wgtbU0TuJrxNl17hhQiGCkq	1	postgres	2022-07-29 12:47:14.442829	172.168.80.26/32	\N	\N	\N	\N	\N
422	422	ECASTELLON	$2b$10$oqpk2zyQcXIchk1n62l1kuToxDxkt4DQ.MT0VVz81linkXuzzRAGW	1	postgres	2022-07-29 12:47:14.450764	172.168.80.26/32	\N	\N	\N	\N	\N
423	423	ARIVERO2	$2b$10$a3tMK0gCQARCw5UbjpVF0OiYxjWNF0BVNW/zlh0JGa6O4ZZJzRTfS	1	postgres	2022-07-29 12:47:14.459306	172.168.80.26/32	\N	\N	\N	\N	\N
424	424	ASORIA	$2b$10$oAdTXEgkXQb/vNEfGnxAPOyCG9yl8XBbmYqwLK0dJSNA1Y/FmdA6y	1	postgres	2022-07-29 12:47:14.467403	172.168.80.26/32	\N	\N	\N	\N	\N
425	425	RTORREZ	$2b$10$pTG6xQPtF7DHPjRdBFCpoOQIbVOXRxOfVUgFCfOK97/JEnf/KDBnS	1	postgres	2022-07-29 12:47:14.475953	172.168.80.26/32	\N	\N	\N	\N	\N
426	426	JARUQUIPA2	$2b$10$1FMCVATkQbAfCMU.5DuvWeIihTEkziISaD.Wj.V9dCq3mz4.PDtzK	1	postgres	2022-07-29 12:47:14.484069	172.168.80.26/32	\N	\N	\N	\N	\N
427	427	PKANTUTA	$2b$10$wqrHwhrA50cIver/uNpty.pwgMwUtlbYn.amhF6FljP0cfoIZT8Ja	1	postgres	2022-07-29 12:47:14.492617	172.168.80.26/32	\N	\N	\N	\N	\N
428	428	EINCAPOMA	$2b$10$8Vlcv.3k9EBuF6j6JlGo5u9sU2J1EZvQGgTSnFXhIQeJIB91pvLHS	1	postgres	2022-07-29 12:47:14.500696	172.168.80.26/32	\N	\N	\N	\N	\N
429	429	MNUÑEZ	$2b$10$5b0n5F/0SbURrgQPqv1P3OC4ENAD2nPWEegohNuDcnUn5zB9FxMSa	1	postgres	2022-07-29 12:47:14.509341	172.168.80.26/32	\N	\N	\N	\N	\N
430	430	RGARCIA	$2b$10$.nMx7jfKOwnB3VM5AiTvNOhkhzhx6//Sh/h/AjgFJTsdb9q0DYKqe	1	postgres	2022-07-29 12:47:14.51743	172.168.80.26/32	\N	\N	\N	\N	\N
431	431	ARIOS	$2b$10$pDcaDeVoN8Xs7AcQa69LkuQhJlvarOe2OJ28yko0jqQU8.2DB0c0K	1	postgres	2022-07-29 12:47:14.537715	172.168.80.26/32	\N	\N	\N	\N	\N
432	432	ECONDORI	$2b$10$T8JRkQPExDtecxqo69wew.I5kAeDbcV7vI/9ly2n1fo16Y3q9eCIK	1	postgres	2022-07-29 12:47:14.542335	172.168.80.26/32	\N	\N	\N	\N	\N
433	433	DMAMANI23	$2b$10$p3AV4DFaMRYyZhjDfN4fmualzrsfjyM75MTYDQYJedLkaUGQ4rekm	1	postgres	2022-07-29 12:47:14.550606	172.168.80.26/32	\N	\N	\N	\N	\N
434	434	SANDRADE	$2b$10$i.Qa3o3WsuVsm0SYh3.JxeFumuJyrmrn3fCUlSuWVQCemcraF0xXK	1	postgres	2022-07-29 12:47:14.559248	172.168.80.26/32	\N	\N	\N	\N	\N
435	435	MHERRERA	$2b$10$jKVWHaIO2Upyn./zT.igGe9ACrs8Toq1Wgu1xmn6R4SDe0pXcTDHa	1	postgres	2022-07-29 12:47:14.56762	172.168.80.26/32	\N	\N	\N	\N	\N
436	436	AHERBAS	$2b$10$Jv81UdKJcDtRYrjnvOVJCuHCAiT6muH2axdspPj7F8c/A6S9QPk8G	1	postgres	2022-07-29 12:47:14.575905	172.168.80.26/32	\N	\N	\N	\N	\N
437	437	JBETANZOS	$2b$10$AArummEgqPE7x8b.gzCsceScBwoY5s5ua8QhoHRDYQXYEFQiDNoQ6	1	postgres	2022-07-29 12:47:14.584311	172.168.80.26/32	\N	\N	\N	\N	\N
438	438	SCRUZ	$2b$10$T7vxdFgEnprqNykhMS8VvuEVEp6eudMHU01l2ZrJV0S5xqVczPlZO	1	postgres	2022-07-29 12:47:14.592714	172.168.80.26/32	\N	\N	\N	\N	\N
439	439	SCALLE	$2b$10$k7dB4fc6KUfsKuwTZqeoYOI7GYllohcwEpHsfduWg4/3VGuqIx8B.	1	postgres	2022-07-29 12:47:14.600971	172.168.80.26/32	\N	\N	\N	\N	\N
440	440	AVELARDE	$2b$10$9bwifwj6ScU5os9TEqfty.K4qYqtR1qEbU04BYNn8Yjz13dcrfNSK	1	postgres	2022-07-29 12:47:14.609273	172.168.80.26/32	\N	\N	\N	\N	\N
441	441	JFLORES23	$2b$10$kZhQsHgJqAwjKyg2Az4YSuRQAL5BzVWNQAjElpL2AGxSzK2p.kSae	1	postgres	2022-07-29 12:47:14.617635	172.168.80.26/32	\N	\N	\N	\N	\N
442	442	FCOPANA	$2b$10$/x5Pko.hvXnloS//VAZ2AuIYzAJsXa6Jzj7wQyl7alby.HT927rm.	1	postgres	2022-07-29 12:47:14.625964	172.168.80.26/32	\N	\N	\N	\N	\N
443	443	SESCOBAR	$2b$10$bJi5C4S0B94ZOiNXFhxW/.D7BvfK0yLLK56u5Qr1ep4fdCNFdsrfa	1	postgres	2022-07-29 12:47:14.634279	172.168.80.26/32	\N	\N	\N	\N	\N
444	444	RCORI	$2b$10$S4F3tWVPuaLSQHA4HGF3/ObBXLRFl2AWTAaVAwxqqaMNDP3XpV0eG	1	postgres	2022-07-29 12:47:14.642476	172.168.80.26/32	\N	\N	\N	\N	\N
445	445	PBASCOPE	$2b$10$Rd5/Q/4rf7ZZbdhLC0.VnerzWQ9ue.HLSrj/pE5Txp51etMEg6PUq	1	postgres	2022-07-29 12:47:14.667641	172.168.80.26/32	\N	\N	\N	\N	\N
446	446	LSOLIZ	$2b$10$4WQvRCpMVKUPOpUMDn7D9O7QqvwpSLkgyndwhFsMrutxiHgL8j/g6	1	postgres	2022-07-29 12:47:14.68424	172.168.80.26/32	\N	\N	\N	\N	\N
447	447	PMARCA	$2b$10$ulRrFqgDcfnF9D7LLYja/OONMyP.32Q8sk2gZ56Svo9PvPwNk//pq	1	postgres	2022-07-29 12:47:14.692344	172.168.80.26/32	\N	\N	\N	\N	\N
448	448	APRADO	$2b$10$6a9DvvF4Qe9FLJT80PQ//.EOvoOi6JnE5ehcD4bKKNKMPfNaK80qK	1	postgres	2022-07-29 12:47:14.701261	172.168.80.26/32	\N	\N	\N	\N	\N
449	449	GTICONA	$2b$10$hqOgZLHelNnETLgycTM5BuNrmIgrRRhd8rHXrYVJApiiP746gK23e	1	postgres	2022-07-29 12:47:14.709172	172.168.80.26/32	\N	\N	\N	\N	\N
450	450	GESPINOZA2	$2b$10$opY3FEEdo4m3IoWOdXGFT.eEWnP7uqrLNAAsYSpwn1YRAHgrVYiwi	1	postgres	2022-07-29 12:47:14.717551	172.168.80.26/32	\N	\N	\N	\N	\N
451	451	ZDOMINGUEZ	$2b$10$tkfuVgJPKN7BeOJ6mugpnOBGzqdcy73gGMpqh7.IoAlhb7x1cQYhC	1	postgres	2022-07-29 12:47:14.725905	172.168.80.26/32	\N	\N	\N	\N	\N
452	452	JTRIGUERO2	$2b$10$P9J9j3WF9IjlxsqtkZaD2.Mozbptc4HNap47ICO8f.7SxwXDZRu5K	1	postgres	2022-07-29 12:47:14.734267	172.168.80.26/32	\N	\N	\N	\N	\N
453	453	JTEJERINA	$2b$10$WRXOU1VSwil992dqwBwJw.aTl8vfAxFB5nNOPfPXQb6QwazEahpJW	1	postgres	2022-07-29 12:47:14.742375	172.168.80.26/32	\N	\N	\N	\N	\N
454	454	JBONILLA2	$2b$10$SKdJ8IBXlGOns1DMt2hIZOshmNxWi0RkDWkamAFYvz.i6a4UKKoJG	1	postgres	2022-07-29 12:47:14.750948	172.168.80.26/32	\N	\N	\N	\N	\N
455	455	CVIDAURRE	$2b$10$.DtO1V99HVcy6TFwkIj41egL.LpaKWSwYOvadBnti7CdYVnzJKQ7W	1	postgres	2022-07-29 12:47:14.759755	172.168.80.26/32	\N	\N	\N	\N	\N
456	456	EMARCA	$2b$10$Wk2IPgd2FHn6R3Vzh/wFqeZU34TjtATyqgWMVopWPFa9w3ud47RnW	1	postgres	2022-07-29 12:47:14.767716	172.168.80.26/32	\N	\N	\N	\N	\N
457	457	CAYALA	$2b$10$ZbiMuSHa3z/GKnkcJxn7oeMCc2GoUh/4c1LkjFFWunxJhwAOZkVqO	1	postgres	2022-07-29 12:47:14.776044	172.168.80.26/32	\N	\N	\N	\N	\N
458	458	ETERCEROS	$2b$10$UwB/ibJEyHtpoJTqnQ4nnuHMbQCOtPUBoL9A6v8JmxMmBk9SR9kmK	1	postgres	2022-07-29 12:47:14.784468	172.168.80.26/32	\N	\N	\N	\N	\N
459	459	XJUAREZ	$2b$10$72jIaTBobMQl5ZybuEYODe7M/F6VzCDaN85ox.nPIoqwUTZokmIsC	1	postgres	2022-07-29 12:47:14.809578	172.168.80.26/32	\N	\N	\N	\N	\N
460	460	CROCABADO	$2b$10$Th6d9fVrpRmNB6CiALHkn.gb/SkAu7G3QZBDxvJdxVXYcnONu7G7a	1	postgres	2022-07-29 12:47:14.817606	172.168.80.26/32	\N	\N	\N	\N	\N
461	461	JTORREZ	$2b$10$1bofeMWE9RRpkh72YxS5hev2qWgj5PUWJW4.hFt72IrSegrqeLZYa	1	postgres	2022-07-29 12:47:14.825791	172.168.80.26/32	\N	\N	\N	\N	\N
462	462	LOSINAGA	$2b$10$lyNjPp0gKTUmqk8lbli6POgQVQgZpm3PyJvpx2GEuXAMKkQXbzkgO	1	postgres	2022-07-29 12:47:14.83435	172.168.80.26/32	\N	\N	\N	\N	\N
463	463	CTERRAZAS23	$2b$10$43GuOBVpaH8D.H./cZdjpeDTdYVW5LxaviN8DiwI0ixCFs9YftgAK	1	postgres	2022-07-29 12:47:14.842699	172.168.80.26/32	\N	\N	\N	\N	\N
464	464	MPEREZ2	$2b$10$U6De2To3bQ9heip4S9DXzOKAKF4wJL6tv1r36RCbXsBVm2zb.mejW	1	postgres	2022-07-29 12:47:14.850925	172.168.80.26/32	\N	\N	\N	\N	\N
465	465	KRODRIGUEZ	$2b$10$/0hgDa3mBthoKuqDkAPGbe52t8NrlXwXWvDMH0Bji1.vX2/qlz9HS	1	postgres	2022-07-29 12:47:14.859221	172.168.80.26/32	\N	\N	\N	\N	\N
466	466	AAYALA	$2b$10$SzNWrzlAUFgq7I6rpr8eUeV6UgKIV3zbYix.K97AbJ7i9DkPr.P3O	1	postgres	2022-07-29 12:47:14.867663	172.168.80.26/32	\N	\N	\N	\N	\N
467	467	RMAMANI23	$2b$10$gle6WWHveUmlHkO6l6j5auI2bi1vNP3RrGCoKAuc9M6MJ9N80RSdq	1	postgres	2022-07-29 12:47:14.890483	172.168.80.26/32	\N	\N	\N	\N	\N
468	468	RCUELLAR	$2b$10$2ch/QDGcE7nT3JN1ZU6rQOGvTHZIviHleeUKsfrFdSrGvTWvtA1LS	1	postgres	2022-07-29 12:47:14.925693	172.168.80.26/32	\N	\N	\N	\N	\N
469	469	YESPEJO	$2b$10$7ATq3czju4wbkFRLPRYO6e8MPx8lsWdVrGB9h51cLAv2aAx.YMsRm	1	postgres	2022-07-29 12:47:14.934036	172.168.80.26/32	\N	\N	\N	\N	\N
470	470	JAGUILAR2	$2b$10$aJXrZSnXgKyv9Y.F1bqpZ.6Xa2/FV662DxMT1eX2HJFUkpXOzFKxa	1	postgres	2022-07-29 12:47:14.942338	172.168.80.26/32	\N	\N	\N	\N	\N
471	471	OLUNA	$2b$10$Xrs6gjOJ5FK9zxyg1/WwJOMcodEWKYIKG1lVNwhHhf35LzjXnhB6e	1	postgres	2022-07-29 12:47:14.950586	172.168.80.26/32	\N	\N	\N	\N	\N
472	472	WSOLARES	$2b$10$e6IxS.HHN3yM4SXbzf3acOfOP.VzFwzc3rk2hJqTA0ePu4NAAfWly	1	postgres	2022-07-29 12:47:14.959081	172.168.80.26/32	\N	\N	\N	\N	\N
473	473	MMUÑOZ2	$2b$10$sjUMwk/tc7RGpWfG8xQkZeLC/Tv5oobaIGIBUlHLURoxHSvfAY2ye	1	postgres	2022-07-29 12:47:14.967365	172.168.80.26/32	\N	\N	\N	\N	\N
474	474	ECLAROS2	$2b$10$5FSefjEoXMOTexZidaT..ONeFe9san..lpWMiMjcwbI.Ey5QiKGdq	1	postgres	2022-07-29 12:47:14.975906	172.168.80.26/32	\N	\N	\N	\N	\N
475	475	RRAMOS	$2b$10$U.9ucb.7AELKx/4o2z4G6.2JzS1kdOxAbRHcLMixMMIfoadRpQSgq	1	postgres	2022-07-29 12:47:14.98438	172.168.80.26/32	\N	\N	\N	\N	\N
476	476	AMENDOZA	$2b$10$dhPCilwdVNioD8P/XzmpNOfS1ZiBH.mgCYf/FskNUHcyo4F4tQG.G	1	postgres	2022-07-29 12:47:14.992698	172.168.80.26/32	\N	\N	\N	\N	\N
477	477	YCONDORI2	$2b$10$f/UPsPNJDhM6O0qWqMMwzu.d1UusxV3f0P2HklgMX4SVbjWFnFCx.	1	postgres	2022-07-29 12:47:15.001072	172.168.80.26/32	\N	\N	\N	\N	\N
478	478	JALMANZA	$2b$10$O44gebmlt2VELqWuCgkR8OeqByTOzaPVm0IivuGkSMhUMLYgPBR.a	1	postgres	2022-07-29 12:47:15.009315	172.168.80.26/32	\N	\N	\N	\N	\N
479	479	IFERNANDEZ	$2b$10$IqUdnnrBee8DYKFGwPR0NOlZdsdChPM5b8pXZ/CBJgKM8K3kTs33a	1	postgres	2022-07-29 12:47:15.017464	172.168.80.26/32	\N	\N	\N	\N	\N
480	480	EBARRIOS	$2b$10$S0uDcnJb1gpNzihL.bZQyO.yketagd9kD0s75sfVTgzqAjJMYJ7nO	1	postgres	2022-07-29 12:47:15.025926	172.168.80.26/32	\N	\N	\N	\N	\N
481	481	JMAMANI	$2b$10$oxK3BJanj/Am8yl/vWgTPOOlIl3Z5FZ.9w/oiRKwohk1co5XcEQBO	1	postgres	2022-07-29 12:47:15.034369	172.168.80.26/32	\N	\N	\N	\N	\N
482	482	JJALLAZA	$2b$10$CKtCKme5fzDIU/7tLMTUw.XXXrAOa8aDgCCpQtW1pStMgG.4Eyly.	1	postgres	2022-07-29 12:47:15.042688	172.168.80.26/32	\N	\N	\N	\N	\N
483	483	WVARGAS	$2b$10$IwI7dRGVBhza/3t5.B9D1.TWWWe1gLLuLZwkjuyteCRy8uKsGA2XC	1	postgres	2022-07-29 12:47:15.050989	172.168.80.26/32	\N	\N	\N	\N	\N
484	484	JAUCACHI	$2b$10$3/zRb7mXQToJrOknmJvyBeUP.YBPQqp8r.AhHGMyMFoNLghx4i1kW	1	postgres	2022-07-29 12:47:15.05945	172.168.80.26/32	\N	\N	\N	\N	\N
485	485	TBECERRA	$2b$10$CydGg1X3krzVkRnHKSE2T.x.G.nzz.pphEED6biGjeV6MNwNP1Aqi	1	postgres	2022-07-29 12:47:15.067757	172.168.80.26/32	\N	\N	\N	\N	\N
486	486	EGUZMAN	$2b$10$x.ZS1cYQgW7cDjhYO06OqeNJZSx1f/lHAwYSi3wx9rW0vIVxQHir2	1	postgres	2022-07-29 12:47:15.076129	172.168.80.26/32	\N	\N	\N	\N	\N
487	487	RROJAS	$2b$10$GnPtZYixOrBe7CNW1LPXLO1SLgYDA/nRKhl8xzxPQXvC96fqqeoRS	1	postgres	2022-07-29 12:47:15.08444	172.168.80.26/32	\N	\N	\N	\N	\N
488	488	RDAVILA	$2b$10$CV5U0AWKRYRYVmHGZbWK2egHWwLHo/dAFKo0Wutv2hdxxTvhW.2tG	1	postgres	2022-07-29 12:47:15.092705	172.168.80.26/32	\N	\N	\N	\N	\N
489	489	CGALARZA	$2b$10$QfayipOWu2L3yYAZOvm9quyqlOd/NHwHwxfVwcyHJwQeea9JEes4y	1	postgres	2022-07-29 12:47:15.101009	172.168.80.26/32	\N	\N	\N	\N	\N
490	490	EPALLUCA	$2b$10$HZUXqkHapHW2BwkEKJrC8up2RzbK3Ku4Xne29PBw0lpjJMEf1YyTy	1	postgres	2022-07-29 12:47:15.109363	172.168.80.26/32	\N	\N	\N	\N	\N
491	491	GBURGOA	$2b$10$yHa/Hkd/SaGC.K2x.JeXvuHG3X2BHzBTm8Ck5h5YyoBz7bPGMtWze	1	postgres	2022-07-29 12:47:15.117679	172.168.80.26/32	\N	\N	\N	\N	\N
492	492	RTORO	$2b$10$eASRfRfLQ.nOG0al.3r9sOcY/vnubr65OLbETkhl8ANiuPND.goaa	1	postgres	2022-07-29 12:47:15.12599	172.168.80.26/32	\N	\N	\N	\N	\N
493	493	JHUALLPARA	$2b$10$lgFqwjPbmb7QyF5VaAPHMudzRklbVKEeJXp.JclvfEF26MYRV4LHS	1	postgres	2022-07-29 12:47:15.134401	172.168.80.26/32	\N	\N	\N	\N	\N
494	494	LENRIQUEZ	$2b$10$W/fgdKFzrMlrpHEDvxIEfejIVSBQV.ozoFvgO2VjkUqp3b7vKqwhC	1	postgres	2022-07-29 12:47:15.142599	172.168.80.26/32	\N	\N	\N	\N	\N
495	495	JORTIZ2	$2b$10$NRl8TNmX0.f87qbrkdeN/ujJoz52mdpAx3RRwl3zuL1mffQLQgkKq	1	postgres	2022-07-29 12:47:15.151066	172.168.80.26/32	\N	\N	\N	\N	\N
496	496	DBALDELOMAR	$2b$10$KgGdUO35bIFeehsvF9xMbeqkTCvHj/Mfdpi83IAGwK3z2sQfLV5dC	1	postgres	2022-07-29 12:47:15.159397	172.168.80.26/32	\N	\N	\N	\N	\N
497	497	JNOYA	$2b$10$6TWQzlPGHuyzxDJWy5ckz.tfvx538ngQwQlq8X2dsV8V6tmsZkON.	1	postgres	2022-07-29 12:47:15.167751	172.168.80.26/32	\N	\N	\N	\N	\N
498	498	FLIMPIAS	$2b$10$LZ9fphPNNY/VDRumirotce5Q4QmPnqp6JJfhkA1IM0vuuD.V/8az6	1	postgres	2022-07-29 12:47:15.175868	172.168.80.26/32	\N	\N	\N	\N	\N
499	499	ORAFAEL	$2b$10$rg3EbPE4DjVqmzYQ5Vi.5O6hMucXDMVZH/Xr0HJvdVtG3B4ScG7hO	1	postgres	2022-07-29 12:47:15.184573	172.168.80.26/32	\N	\N	\N	\N	\N
500	500	CTICONA	$2b$10$wbuj4W5DavYnVFq8FPNH5uc3dSh0A/kCc/Ddn/QyblDUZPTegJ4IW	1	postgres	2022-07-29 12:47:15.192758	172.168.80.26/32	\N	\N	\N	\N	\N
501	501	LVARGAS2	$2b$10$fwHhX2mqeD5Buifka9HFYu2khJFpUv1MHRhKIjluN92qW8fMHg9ja	1	postgres	2022-07-29 12:47:15.201001	172.168.80.26/32	\N	\N	\N	\N	\N
502	502	CHIDALGO	$2b$10$ikVBTPK0EVVooPEL3zbmIuXYHvXO1/KhyWYwo6FL0euApoyglP8Ra	1	postgres	2022-07-29 12:47:15.209262	172.168.80.26/32	\N	\N	\N	\N	\N
503	503	DPORTUGAL	$2b$10$agaszET9UQGE.vvVrP01OOXoYH7JYefOlQluTLUR0cDnl5.BIntKS	1	postgres	2022-07-29 12:47:15.217717	172.168.80.26/32	\N	\N	\N	\N	\N
504	504	NROMERO	$2b$10$sMgbA9pnxaa42f8t1Xc.TOdM5O1Zd6cHrp6m19yPPsYkECUPapq9i	1	postgres	2022-07-29 12:47:15.226842	172.168.80.26/32	\N	\N	\N	\N	\N
505	505	GBUSTAMANTE	$2b$10$GmD3WnBhE4RX.WIPbX4wY.odXhz8Sa1DYzCmwMTMLtrey9Ilthowu	1	postgres	2022-07-29 12:47:15.234293	172.168.80.26/32	\N	\N	\N	\N	\N
506	506	MGUERRERO	$2b$10$jGL1JLfbMspYWhZlu205PubVyqo/09V8d3kX8mSbUVHYzaY5Tk5WW	1	postgres	2022-07-29 12:47:15.243036	172.168.80.26/32	\N	\N	\N	\N	\N
507	507	MORMACHEA	$2b$10$/sSdl5f7/Kyts6WXCccAEegA7k.2WZfOIzKseS11U43dKyz.6bpE2	1	postgres	2022-07-29 12:47:15.25108	172.168.80.26/32	\N	\N	\N	\N	\N
508	508	GFERNANDEZ	$2b$10$kj86yaRYY7jyFW0Ygxtm7OvoQvGN7VjlMqKNxuqw9kp.IM77QxH4K	1	postgres	2022-07-29 12:47:15.259437	172.168.80.26/32	\N	\N	\N	\N	\N
509	509	APUERTA	$2b$10$dwBnuaub2nJ34w2KB./hD.3XEfYP18Kp7EzBx4I.3Vyvth1csYv1q	1	postgres	2022-07-29 12:47:15.26776	172.168.80.26/32	\N	\N	\N	\N	\N
510	510	JGONZALES	$2b$10$YmrZGJlO3hnmf/XUpAOYSeCSG53vPY7Yh3tXrDqAIqZB/u8xxwQZC	1	postgres	2022-07-29 12:47:15.275862	172.168.80.26/32	\N	\N	\N	\N	\N
511	511	CGUTIERREZ	$2b$10$58hxFbYNnDh0jLdaBJz3A.Dpxy7.vvedmG7ONMr2oZvmdVnfaG1ei	1	postgres	2022-07-29 12:47:15.284151	172.168.80.26/32	\N	\N	\N	\N	\N
512	512	CDAZA	$2b$10$b7r8KYwGoFoKYQgnNtcX.eliFLdNZceO3/zpAjRNNvNphtzLPZC/W	1	postgres	2022-07-29 12:47:15.292658	172.168.80.26/32	\N	\N	\N	\N	\N
513	513	LALARCON	$2b$10$jZkvGI1a11QhQokIexn4luTZ/XS3qSG5ubkjZdqa21X3vNQje5c1u	1	postgres	2022-07-29 12:47:15.30075	172.168.80.26/32	\N	\N	\N	\N	\N
514	514	JCONDORI	$2b$10$8kwsjqLNDkEN3BRLtWKh/ORcMWlWrKBgyHqMb2f3Z1dBpCD51oVDW	1	postgres	2022-07-29 12:47:15.308939	172.168.80.26/32	\N	\N	\N	\N	\N
515	515	AMONTAÑO	$2b$10$FfjEgGaNxYsHlN6U8v6I3OB5DMySiYV3ig0u8/YuCE7A7iIMz89wC	1	postgres	2022-07-29 12:47:15.31732	172.168.80.26/32	\N	\N	\N	\N	\N
516	516	WFLORES	$2b$10$2PbJquOz9JDkWS7Oz2WZ9OFG/pEYwP06bvXil3OFriuXPT0vJF1GG	1	postgres	2022-07-29 12:47:15.325635	172.168.80.26/32	\N	\N	\N	\N	\N
517	517	RBARBOZA	$2b$10$woPEZI333YJh/iWkpNCqJ.97Ax7E0z3PF9Q9cR3LDchRdUN3k4l7m	1	postgres	2022-07-29 12:47:15.334009	172.168.80.26/32	\N	\N	\N	\N	\N
518	518	JMAMIO	$2b$10$xJzrxpFyAROThDfNhdEDHuAsZi795Zducf7aXLxcfzmoXgEdheczq	1	postgres	2022-07-29 12:47:15.342202	172.168.80.26/32	\N	\N	\N	\N	\N
519	519	TVELA	$2b$10$E7kEDyYSMnRW2P0dmpuhY.87wY7FPQvHEfeb2SQBN99iwncIy1kNO	1	postgres	2022-07-29 12:47:15.350597	172.168.80.26/32	\N	\N	\N	\N	\N
520	520	EVILLARROEL	$2b$10$8fIAcs/nZfz4PrQWs9soSeo3HmxLe064jA8mXzj9FGymVjvdXxBOK	1	postgres	2022-07-29 12:47:15.358937	172.168.80.26/32	\N	\N	\N	\N	\N
521	521	LMONTAÑO	$2b$10$p3EsYezOwdFl9ZMLRh0AjeFDa2jjpfobSN9sT5hdV704aemo20B2.	1	postgres	2022-07-29 12:47:15.367499	172.168.80.26/32	\N	\N	\N	\N	\N
522	522	MRIBERA	$2b$10$9CS0SmTDqyWhDX9Ves30J.kQ59MZk1WhId8LkjoW.g4WBHNsoXQBO	1	postgres	2022-07-29 12:47:15.375775	172.168.80.26/32	\N	\N	\N	\N	\N
523	523	LPEREZ	$2b$10$5Byl3IZn9bUYte9/vsvw0uLPxLRZd88Jev.Sz0mbmhFl2PXP8ZJeW	1	postgres	2022-07-29 12:47:15.383947	172.168.80.26/32	\N	\N	\N	\N	\N
524	524	RPEÑARANDA	$2b$10$qpHxOhT1CVZ83FlFzeWWJuLeVdYH.IsMO.vmnJAUnYOwuSqGP.7Sa	1	postgres	2022-07-29 12:47:15.392462	172.168.80.26/32	\N	\N	\N	\N	\N
525	525	JCALDERON	$2b$10$EhazaEkwqvSKu1UBYH4Jeuvj87Qrz3FxSgBWYBEfh0WPcCqGTfZam	1	postgres	2022-07-29 12:47:15.400875	172.168.80.26/32	\N	\N	\N	\N	\N
526	526	DCOLQUE	$2b$10$H9Yd/gKfx24OIQuy/N2R5OXdMl1YyeEAdE2b1Z0GEMEXc4QA9RLIy	1	postgres	2022-07-29 12:47:15.409105	172.168.80.26/32	\N	\N	\N	\N	\N
527	527	OVILLARROEL	$2b$10$rMfu1v9Ktwk9B4kquPOi8.JqtkfB/IsD/bWmdPa8HDtsKnbzh/NZC	1	postgres	2022-07-29 12:47:15.417788	172.168.80.26/32	\N	\N	\N	\N	\N
528	528	IHUAYTA	$2b$10$uKIvcd49rFbVnUYRJiqOAe9dumDedTL/wSHCgVX5yQPrVF.OoVO2q	1	postgres	2022-07-29 12:47:15.426045	172.168.80.26/32	\N	\N	\N	\N	\N
529	529	RAMAMANI	$2b$10$dPKmFAE1rMRlNBDJyJbBZOAoJz4igzJ.5PZc4Hjuzrd9O9Ys7CuGq	1	postgres	2022-07-29 12:47:15.434581	172.168.80.26/32	\N	\N	\N	\N	\N
530	530	HBORGES	$2b$10$rKZ4UiSLhad1TGhsdlBA7.7r1yf9w/Iyt4mghVpcgEm4o4rD/PCwS	1	postgres	2022-07-29 12:47:15.442621	172.168.80.26/32	\N	\N	\N	\N	\N
531	531	MLLANOS	$2b$10$La4tBj3nUHpJlUKIYvyG/uuQhcUL1pwJhnbdC0F0x.hjDD7sLYbeq	1	postgres	2022-07-29 12:47:15.450991	172.168.80.26/32	\N	\N	\N	\N	\N
532	532	FHURTADO	$2b$10$OGHCt72tcaTaN7D9uJbNOOX33Hr5DUX7bypBFPS7FvGoOmCM2aPOq	1	postgres	2022-07-29 12:47:15.459525	172.168.80.26/32	\N	\N	\N	\N	\N
533	533	RCONDORI	$2b$10$UW3YfHbNHi64NXGvVliqeejyPiLbxjJYB9fz3p8YLxJEJUahJ2hr2	1	postgres	2022-07-29 12:47:15.501087	172.168.80.26/32	\N	\N	\N	\N	\N
534	534	ROQUISBERT	$2b$10$Rds/wiIMoZzIicUBYzWsoedCU0cf/XFuHEhhq7zWuwQ1An4upTm/C	1	postgres	2022-07-29 12:47:15.50948	172.168.80.26/32	\N	\N	\N	\N	\N
535	535	MGUTIERREZ2	$2b$10$VL9ApduXW/DtgxqZPoBQs.AUdaRGPzPn7Lob5uV4OIRZkodk3Zke6	1	postgres	2022-07-29 12:47:15.517828	172.168.80.26/32	\N	\N	\N	\N	\N
536	536	AYANA	$2b$10$pTXMMJ4vXu3i/WOClf59KeJlMy/ECkCLyc0o7E4mOgFUbrocD5R9O	1	postgres	2022-07-29 12:47:15.526052	172.168.80.26/32	\N	\N	\N	\N	\N
537	537	DMARIÑO	$2b$10$Wtj4zlPQCO8Qm0zqlxBGguSsKv5CB36.3jSan/nGOF6qsqh8B8UGm	1	postgres	2022-07-29 12:47:15.534256	172.168.80.26/32	\N	\N	\N	\N	\N
538	538	NROSSEL	$2b$10$9R8Pg33DLkScJthc.dbsQeb.YSEYqm735.UFZCfCSSaCAiR7aa6yq	1	postgres	2022-07-29 12:47:15.54256	172.168.80.26/32	\N	\N	\N	\N	\N
539	539	RMORALES	$2b$10$mJeK3.0f16YzISGSVTu61u9HIkE.C2Hf.RJPfZCMA4VKCZ0xBPjze	1	postgres	2022-07-29 12:47:15.55105	172.168.80.26/32	\N	\N	\N	\N	\N
540	540	ETELLEZ	$2b$10$nwnDK9u7KsRr5W1pp84oP.RQOj8WQjmeJyavGXFei6U6XidTG2zM2	1	postgres	2022-07-29 12:47:15.559159	172.168.80.26/32	\N	\N	\N	\N	\N
541	541	NCEDEÑO	$2b$10$oNwr1eZD7CrlXGspgM2tw.xpGK5EhAcDHm9WXtF7.sDnORaRBqkwS	1	postgres	2022-07-29 12:47:15.567655	172.168.80.26/32	\N	\N	\N	\N	\N
542	542	PGUTIERREZ	$2b$10$TEJYSfvYUmRggBoPafdB/eUgVCZTiq6rMJ0dwwmyRj1ksrelEC9ye	1	postgres	2022-07-29 12:47:15.576019	172.168.80.26/32	\N	\N	\N	\N	\N
543	543	FLEON	$2b$10$1izzeRxCi08s71llWUoAYelLHToW2GG2qVkfKM8Mc8W.xqg/7bPi6	1	postgres	2022-07-29 12:47:15.584219	172.168.80.26/32	\N	\N	\N	\N	\N
544	544	ROCRUZ	$2b$10$nCmnrYie/fQu6qVrZIE2DudGy9SmUs0vOzVFWApfHIUir7qd/DUr6	1	postgres	2022-07-29 12:47:15.592841	172.168.80.26/32	\N	\N	\N	\N	\N
545	545	PRIOJA	$2b$10$Aq4tJaC7HKs/WsSuMqgXf.Vm9eYNWmJgaTZCggCOfkrRYgbmYKvaa	1	postgres	2022-07-29 12:47:15.601018	172.168.80.26/32	\N	\N	\N	\N	\N
546	546	JMELGAR	$2b$10$nZ7otJdlCEbPHyrhlEGOneuH0y1iZ4oXNHu7GAEiNpKF7w14d7OEG	1	postgres	2022-07-29 12:47:15.617862	172.168.80.26/32	\N	\N	\N	\N	\N
547	547	HMOY	$2b$10$5yZ6OWMOQAQBxCNr.k0U2O8iQMEKb/UulW7pWOY7aDn6MJbCCK3KC	1	postgres	2022-07-29 12:47:15.62602	172.168.80.26/32	\N	\N	\N	\N	\N
548	548	AROJAS	$2b$10$sRWn0ksG1haW7Ewq1nzZtO9NoBoGEiLKBuW4rLOVY5Jko9BQvH1pS	1	postgres	2022-07-29 12:47:15.634323	172.168.80.26/32	\N	\N	\N	\N	\N
549	549	FHURTADO2	$2b$10$rhWMiJpvigoDVGOajjO5Yek6Pk7B9IfVnwNwxv/1OS8v3Ub4ZPpeK	1	postgres	2022-07-29 12:47:15.642596	172.168.80.26/32	\N	\N	\N	\N	\N
550	550	AREVOLLO	$2b$10$Vv6Nh2uEu7uRL2lyhhLh4eZCxRggxvLlvpqbk3R5fmg5K/WE6Pacm	1	postgres	2022-07-29 12:47:15.650991	172.168.80.26/32	\N	\N	\N	\N	\N
551	551	MRIVERA	$2b$10$Ph.xEl.ANH.HTmWVsXfELOc8FftyA5EbKgHwoohKNWlpHGzmaPLpW	1	postgres	2022-07-29 12:47:15.659309	172.168.80.26/32	\N	\N	\N	\N	\N
552	552	APOVEDA	$2b$10$PEl/.uBFSAJ7Y/7d/eLtSu52DF9u0cWHdjCuHU.U9S5dHRutOmhdO	1	postgres	2022-07-29 12:47:15.66772	172.168.80.26/32	\N	\N	\N	\N	\N
553	553	GORTIZ	$2b$10$H79ZVd7B1.KRu61vQxcz3.75tCsr62pybFG0PwsLEyU/bkxTaJjf.	1	postgres	2022-07-29 12:47:15.676091	172.168.80.26/32	\N	\N	\N	\N	\N
554	554	DPOLANCO	$2b$10$UMk71Kz45oidw8t/I7sfcePjn84AOSmTrFjNr21c0xAY6MsGA/rze	1	postgres	2022-07-29 12:47:15.684313	172.168.80.26/32	\N	\N	\N	\N	\N
555	555	GVARGAS	$2b$10$1CcP99o5zin1W7iAxUmW4ugWJZliesfsgicrPJxvGJUj7SQAV4hk2	1	postgres	2022-07-29 12:47:15.692577	172.168.80.26/32	\N	\N	\N	\N	\N
556	556	IRAMOS	$2b$10$Q75OOzcF4PcPuQ6geOVo0uf5o8ZnOxgksSCcsAqZwo0I7YAjHqROy	1	postgres	2022-07-29 12:47:15.700808	172.168.80.26/32	\N	\N	\N	\N	\N
557	557	MALVAREZ	$2b$10$rpghBtMBtbwySRY2.k0Pr.pSspYcrNiRZ4TsMsUfikTRSKcwJ4MU2	1	postgres	2022-07-29 12:47:15.709316	172.168.80.26/32	\N	\N	\N	\N	\N
558	558	JZENTENO	$2b$10$xKL6Fu8PHvo5sOJk.yOXK.wL5xBsHyMSoOSgZ3Ro/jmnLGU70WtAS	1	postgres	2022-07-29 12:47:15.717624	172.168.80.26/32	\N	\N	\N	\N	\N
559	559	MPOIQUI	$2b$10$iZ4qOql2nRmKSrEFaAe6M.czzadgirCZh6SIasavpc6/G.tAciYTi	1	postgres	2022-07-29 12:47:15.725992	172.168.80.26/32	\N	\N	\N	\N	\N
560	560	MSALVATIERRA	$2b$10$ZnpjG3IeDKVamw5m4dORGui01BGOg8o80EpNxAKVCs0M9iDugKFPW	1	postgres	2022-07-29 12:47:15.734276	172.168.80.26/32	\N	\N	\N	\N	\N
561	561	LAGUAYO	$2b$10$i5MqSRP.5f80.PVtT7oEdO9.FQvJp048GzBnZ5NAmJKeB55kDViuC	1	postgres	2022-07-29 12:47:15.74283	172.168.80.26/32	\N	\N	\N	\N	\N
562	562	ONINA	$2b$10$wXI.jSpydpea74md2RXvo.DYea7ExmoMQkRdNCCwe.Q8TyUVgWRmy	1	postgres	2022-07-29 12:47:15.767718	172.168.80.26/32	\N	\N	\N	\N	\N
563	563	FLEANDRO	$2b$10$IBc1xKRgMRFg4/Myg4Yp1OXZC5PGJJRc2AsO2guCDaY3QP3q5g2yC	1	postgres	2022-07-29 12:47:15.775997	172.168.80.26/32	\N	\N	\N	\N	\N
564	564	NQUISPE	$2b$10$phET8tJaIOdIf5dHvageXe0VLaqsDqP9e5Oj5BzNwdQBkUu24wuru	1	postgres	2022-07-29 12:47:15.784411	172.168.80.26/32	\N	\N	\N	\N	\N
565	565	JLLUSCO	$2b$10$11/5rCxApXyAlsUkEGqX3.h.yBhXD.RhKfdp4K5Tpr/D5t.3mQRte	1	postgres	2022-07-29 12:47:15.792795	172.168.80.26/32	\N	\N	\N	\N	\N
566	566	CMAYTA	$2b$10$Wd.f2Gu0dqpgPe3f3FycZO42wuBumwHYPxLFH3vawkvfhaq3gV2Ra	1	postgres	2022-07-29 12:47:15.801212	172.168.80.26/32	\N	\N	\N	\N	\N
567	567	APARRAGA	$2b$10$Y2c.rWJO3mLWsoWvzNZWuumnextzhl8aoADqwmfvx1x4PXDRpqzKK	1	postgres	2022-07-29 12:47:15.809304	172.168.80.26/32	\N	\N	\N	\N	\N
568	568	EALI	$2b$10$cpa41r6dhJdMiVdLllfuOurZdvHZbwhGkRZnadoWPfPODgb7nmlq2	1	postgres	2022-07-29 12:47:15.817796	172.168.80.26/32	\N	\N	\N	\N	\N
569	569	OMAMANI	$2b$10$780F/7RzzsBcCTF8EBmg8Ok9m1Q1S9ZJ9BpRA3gG62LaAFwIyj91C	1	postgres	2022-07-29 12:47:15.826036	172.168.80.26/32	\N	\N	\N	\N	\N
570	570	PLOPEZ2	$2b$10$9/FYDBjdYTspbENcNiHcwOG1qKUiWkTMfc9kabRACl9cRGEjiefni	1	postgres	2022-07-29 12:47:15.834399	172.168.80.26/32	\N	\N	\N	\N	\N
571	571	JMAYTA	$2b$10$Bm4YOizxSLMM/gz324TH0eeyzClHaYZIWY.CKprkJjE2Nq6dcUMPe	1	postgres	2022-07-29 12:47:15.842887	172.168.80.26/32	\N	\N	\N	\N	\N
572	572	ASURUBI	$2b$10$WpLm15M9a9lrD5FVmjvsMuBGYIalmIiALTwDTFyKZVofLbQ1pn2lu	1	postgres	2022-07-29 12:47:15.851297	172.168.80.26/32	\N	\N	\N	\N	\N
573	573	LPG.PLATAFORMA	$2b$10$dj7cx04re./YprUcJdKIiOp6bsL7cX6npDQ1Y28DHfiYR8a7ng/9O	1	postgres	2022-07-29 12:47:15.85933	172.168.80.26/32	\N	\N	\N	\N	\N
574	574	SCD.PLATAFORMA	$2b$10$wd/MRNeboXUD3IgDVIQ.xu8BYSg4Ye3DJa2ARcA1bKDmEbI.PNG1C	1	postgres	2022-07-29 12:47:15.867867	172.168.80.26/32	\N	\N	\N	\N	\N
575	575	CBD.PLATAFORMA	$2b$10$r2ZW/gucsj9wcG4IItTqp.EaGd/voVPF8.vcTfyImBbeejdvU73ZS	1	postgres	2022-07-29 12:47:15.876209	172.168.80.26/32	\N	\N	\N	\N	\N
576	576	ORD.PLATAFORMA	$2b$10$dXf43P4ngo2KvVQVaZ711uRQL3dA0f2qWYSWtzSawnQXASlufXR.W	1	postgres	2022-07-29 12:47:15.884336	172.168.80.26/32	\N	\N	\N	\N	\N
577	577	PND.PLATAFORMA	$2b$10$R0lQs0wSNyQdEK/CcGnhZ.KZ31NiWLeOBWm4ybq.Ghva9j2JTnJ7O	1	postgres	2022-07-29 12:47:15.89263	172.168.80.26/32	\N	\N	\N	\N	\N
578	578	BND.PLATAFORMA	$2b$10$vB3WdYl88VfxO/jodN1aIehNMO2HCJvjDUJQOLIkHikBGZy8dZ8cS	1	postgres	2022-07-29 12:47:15.901084	172.168.80.26/32	\N	\N	\N	\N	\N
579	579	TJD.PLATAFORMA	$2b$10$TsKOmTJHotKVlXiX5VH/z.HLhqno6/ratlG1hEtK.Xtx7crjO05Gi	1	postgres	2022-07-29 12:47:15.909311	172.168.80.26/32	\N	\N	\N	\N	\N
580	580	CHD.PLATAFORMA	$2b$10$bcNiXUng0Y4tINnuRB2jEOF1cSfjmf97fjwRpOjHZNoGp7MeG.Qs6	1	postgres	2022-07-29 12:47:15.917783	172.168.80.26/32	\N	\N	\N	\N	\N
581	581	PTD.PLATAFORMA	$2b$10$0Yz/Fm.njt5MhD/H5Bpk1ORsjin1MWi/JXBPBl65VAkLf4lvXRxuS	1	postgres	2022-07-29 12:47:15.926082	172.168.80.26/32	\N	\N	\N	\N	\N
582	582	SCR.PLATAFORMA	$2b$10$RqUBCAqeUcRNjWHH8vvuQ.K7MvJYd4F4RTpUzrvWB4Wkk5Fmg3gxq	1	postgres	2022-07-29 12:47:15.934611	172.168.80.26/32	\N	\N	\N	\N	\N
583	583	NBLANCO	$2b$10$LH8qV/.CTNWRMasyeD2Wm.TAHEmEq3R.fZRnj58dh6/KrNhIhVQpK	1	postgres	2022-07-29 12:47:15.953089	172.168.80.26/32	\N	\N	\N	\N	\N
584	584	WOLIVA	$2b$10$.H2JqFIQ2gMIT7ELqhXMMu7fFLMU8JcuFFdmhwX/w9O8Gb4fZJyDu	1	postgres	2022-07-29 12:47:15.961222	172.168.80.26/32	\N	\N	\N	\N	\N
585	585	JJAMACHI	$2b$10$DTBBidJ.3EYiXGQRAWyLReQ4ecvzfOHQgfUKK28DNlkgC.9JZW1Ry	1	postgres	2022-07-29 12:47:15.969635	172.168.80.26/32	\N	\N	\N	\N	\N
586	586	SPONCE	$2b$10$3Co4dstVpfX/z1IkEXuEFuUGbHThQdH4xAgruXgLo8y5b0tKEGrpe	1	postgres	2022-07-29 12:47:15.978105	172.168.80.26/32	\N	\N	\N	\N	\N
587	587	CMACHACA	$2b$10$1ZiGDOs1J1wSi7e/W9SijuVOdmzPGyTr5XyUWgbZF.UinRRqjoe/6	1	postgres	2022-07-29 12:47:15.986319	172.168.80.26/32	\N	\N	\N	\N	\N
588	588	ACAMACHO	$2b$10$TbzS7wcyjAhaYSkdte9y4u9HPedCrEcyYU9djUt7A17b1rv2LM2/q	1	postgres	2022-07-29 12:47:15.994676	172.168.80.26/32	\N	\N	\N	\N	\N
589	589	LNORIEGA	$2b$10$5BCGnFDnQcDO0LZXj8ZMm.IhWmOpqfN0U76nucnAtA7mxwHcDeAKC	1	postgres	2022-07-29 12:47:16.002989	172.168.80.26/32	\N	\N	\N	\N	\N
590	590	RCUSICANQUI	$2b$10$9/hFr2cReA84HcICeo0aPOlewkGylMBjdtAoui7IXiMBFhYNa6R8S	1	postgres	2022-07-29 12:47:16.011474	172.168.80.26/32	\N	\N	\N	\N	\N
591	591	DVARGAS	$2b$10$s031YJhc6dBNwxTRqoLXu.HC36xoLxasHhxls1EeF6IpnsQFI6Ot6	1	postgres	2022-07-29 12:47:16.019532	172.168.80.26/32	\N	\N	\N	\N	\N
592	592	YROJAS	$2b$10$nz2epXNXiuQkZImeQCz3BOWxcye7OX9Ay94AvHZrgN2Ah.RIUQD7S	1	postgres	2022-07-29 12:47:16.028142	172.168.80.26/32	\N	\N	\N	\N	\N
593	593	USMINGOB	$2b$10$GJgbOQrJjAigRw09/gGZkeqdlx9hGiBMDdgiUdY55i28EQym6AQdS	1	postgres	2022-07-29 12:47:16.036263	172.168.80.26/32	\N	\N	\N	\N	\N
594	594	RQUISPE234	$2b$10$Qk5JIWbc.ATDjg/72wxcFOOynb.kJGJ2McEOac.Q/fGvtykxYlt1S	1	postgres	2022-07-29 12:47:16.044435	172.168.80.26/32	\N	\N	\N	\N	\N
595	595	GOVANDO	$2b$10$d4NSd4trQmDoGcYYGuVthu46gdWQI0yO4LIehLBQuhmk.dZtQtSRy	1	postgres	2022-07-29 12:47:16.052913	172.168.80.26/32	\N	\N	\N	\N	\N
596	596	DSANTOS	$2b$10$YaKZG.WXQ/YsfgDVrwDcVeL2E6u0b70G7ohWNgm0jBH8jTXiWfYIi	1	postgres	2022-07-29 12:47:16.0613	172.168.80.26/32	\N	\N	\N	\N	\N
597	597	GYUJRA	$2b$10$GmTjnZSBTNrW2gy35BJmhuB5Zn43qR472QEP.jctQ1aAJ0ajbu/Qm	1	postgres	2022-07-29 12:47:16.069529	172.168.80.26/32	\N	\N	\N	\N	\N
598	598	AHUANCA2	$2b$10$lGev99THQG4118JgLWbbXuUAFYJe82cHxpEmlArJk2JS56EEizZ9G	1	postgres	2022-07-29 12:47:16.078	172.168.80.26/32	\N	\N	\N	\N	\N
599	599	ISALVATIERRA	$2b$10$ZxEfHzRDng9uYwmEUov6ruAhSSTKZD75yXEhVDxTukwQ7UwCG6PBq	1	postgres	2022-07-29 12:47:16.086229	172.168.80.26/32	\N	\N	\N	\N	\N
600	600	AVALERO	$2b$10$1CrvlLcnT2YeVC8IZhftIegm480WTKksgTdmrZ2xMVnP0gbaxh8Ai	1	postgres	2022-07-29 12:47:16.094683	172.168.80.26/32	\N	\N	\N	\N	\N
601	601	SCAYOJA	$2b$10$ZAv6ZMFBUo6ckPJiej/9Ou2/TRvAmCA2ymFtMx93Nj3HCTIaNI.16	1	postgres	2022-07-29 12:47:16.102911	172.168.80.26/32	\N	\N	\N	\N	\N
602	602	VVARGAS2	$2b$10$YdA45usyqn3fR76AVic/b.aLH8IRtmy3FCi16TqlnyDfYnjO0FMRG	1	postgres	2022-07-29 12:47:16.111305	172.168.80.26/32	\N	\N	\N	\N	\N
603	603	GANAYA	$2b$10$DRz4UYJoAOb69xDrQ/jFruYa4mxnbcKpfzy/Sa7eRa6GTCFW14tTq	1	postgres	2022-07-29 12:47:16.119624	172.168.80.26/32	\N	\N	\N	\N	\N
604	604	BALVAREZ	$2b$10$9EQPnPO2AKrfkvhXyyxWRu55XxpEc2/Cg1uHHWyGmroFox0TaiMLq	1	postgres	2022-07-29 12:47:16.128188	172.168.80.26/32	\N	\N	\N	\N	\N
605	605	MCHALCO	$2b$10$4sI0ncQoxIailGJD9NfcfuauBWJt1ucEYO5V0ht1SSRjAgb9vr6Aa	1	postgres	2022-07-29 12:47:16.136377	172.168.80.26/32	\N	\N	\N	\N	\N
606	606	GCALLEJAS	$2b$10$mnupJ/2NygopgXqhLK1hvuOPrpQEdfwCWuxUGyTfJkl7CGnbK5DQi	1	postgres	2022-07-29 12:47:16.144696	172.168.80.26/32	\N	\N	\N	\N	\N
607	607	EQUISPE	$2b$10$S.AkavOhnNtQyQkaCHzJR.Gt/dvjq9W7R2qZpd4R3rDn4Vbt7hsDa	1	postgres	2022-07-29 12:47:16.166915	172.168.80.26/32	\N	\N	\N	\N	\N
608	608	LOBLITAS	$2b$10$.AMk5qaHg2KMC517ShO8lOMYcEIO0I9fHe2JeCMMvyq9j194GL3iW	1	postgres	2022-07-29 12:47:16.219706	172.168.80.26/32	\N	\N	\N	\N	\N
609	609	APINEDA	$2b$10$CiQQEp4UHDTO69/lj18gBuFhaFB3MD5GhcXTon/phw.s7nY.W5h4W	1	postgres	2022-07-29 12:47:16.228101	172.168.80.26/32	\N	\N	\N	\N	\N
610	610	JTOLA	$2b$10$rPuJc8E9TYnvIG.4dYNhcOc4oeW3N49LL8/quQfXqrXnfYATa2/Xm	1	postgres	2022-07-29 12:47:16.236421	172.168.80.26/32	\N	\N	\N	\N	\N
611	611	NILLESCAS	$2b$10$icBg.xzEA1IKTqofTnNXgeRVJMW9/LFLo5/c.vlk7KoPOFbrx9lZa	1	postgres	2022-07-29 12:47:16.24463	172.168.80.26/32	\N	\N	\N	\N	\N
612	612	MFERNANDEZ2	$2b$10$S2p8Jx8gQ2Rb8Asm3Gn2JOZQwx8vNgYQJGi/H3bxDFBwnWzKYX026	1	postgres	2022-07-29 12:47:16.252842	172.168.80.26/32	\N	\N	\N	\N	\N
613	613	FQUISBERT	$2b$10$t1tTZ966rtjR/gvgaOHWv.gXsPEVqc7sK4L74yqtGLy5ezgIOYK2W	1	postgres	2022-07-29 12:47:16.261127	172.168.80.26/32	\N	\N	\N	\N	\N
614	614	LCHOQUE	$2b$10$18MS0iojifumDEfhmPqfBuz.hxA/xIpw/nt9XIo2Kh.jz1ODIg9XW	1	postgres	2022-07-29 12:47:16.269597	172.168.80.26/32	\N	\N	\N	\N	\N
615	615	MPURI	$2b$10$B6/0/.NPiJaZKixBMrgyC.hCCzDb9EvRN88/VyC1AljadW5kqUov.	1	postgres	2022-07-29 12:47:16.278079	172.168.80.26/32	\N	\N	\N	\N	\N
616	616	JNINA2	$2b$10$DIX.DrDT0bsyRakYNGv0suyd.pEl6274J3W2QzxYkmD8iqEdWzFqG	1	postgres	2022-07-29 12:47:16.286221	172.168.80.26/32	\N	\N	\N	\N	\N
617	617	MVIDAL	$2b$10$4aeJTn.nThVCAullWudIYuj.ME73Eccd0UfwJtN3aSiPumkdYhBOG	1	postgres	2022-07-29 12:47:16.294432	172.168.80.26/32	\N	\N	\N	\N	\N
618	618	TMARTINEZ	$2b$10$vcxM98JvtGj9XDRn9JBNv.WbaOXeRqds20xELttESWnlfIqbUH8Iu	1	postgres	2022-07-29 12:47:16.302944	172.168.80.26/32	\N	\N	\N	\N	\N
619	619	VQUINTANA	$2b$10$VZjyZ45u0VbRTn5s7Vsi/uQvr64DARqfPUKwI5GJI38coaofsxcQa	1	postgres	2022-07-29 12:47:16.311266	172.168.80.26/32	\N	\N	\N	\N	\N
620	620	VHUANCA2	$2b$10$HVdKoHIaPltrIzj0J8JKX.Wen5dsfxqc6.DhJvui4nsLNBAn7RETe	1	postgres	2022-07-29 12:47:16.319608	172.168.80.26/32	\N	\N	\N	\N	\N
621	621	RYANIQUE	$2b$10$yjKWefi27oTZt3tqvo6Yke7VQMA0pjrlPVGAH0Ya7eANrE/H6z.G6	1	postgres	2022-07-29 12:47:16.36691	172.168.80.26/32	\N	\N	\N	\N	\N
622	622	ESALAZAR	$2b$10$LCVUrRjHMM7Cf1CVER0uCe3/.bceZdosDUDGOKg99hgcvgpi/0QCi	1	postgres	2022-07-29 12:47:16.37814	172.168.80.26/32	\N	\N	\N	\N	\N
623	623	NOVALLE	$2b$10$jtUtE5H8I6NPwEyzeFtXj.ioKgR4NfBxnpn8K6lq25QSyoXjM.tBm	1	postgres	2022-07-29 12:47:16.386153	172.168.80.26/32	\N	\N	\N	\N	\N
624	624	SPEÑALOZA	$2b$10$9tobOlVBtbE8FZvO9xSukeF/e8hIEIh67mXKZQmx1yNX9eXbLoCDe	1	postgres	2022-07-29 12:47:16.394391	172.168.80.26/32	\N	\N	\N	\N	\N
625	625	NVEGA2	$2b$10$6ZrIjRhbEdlvZrikhArFwurlbKVRvoClcgVNy4UhHNtWiaflI9B.m	1	postgres	2022-07-29 12:47:16.403055	172.168.80.26/32	\N	\N	\N	\N	\N
626	626	AQUISPE2	$2b$10$BvCU5iXzEQ/Bb76mn3IjR.3Z5xTJo92OtUnSSKRkrpFwGtOY4Rm7W	1	postgres	2022-07-29 12:47:16.41143	172.168.80.26/32	\N	\N	\N	\N	\N
628	628	FFLORES	$2b$10$wyxzIjM/jg2Q8nzeGcyUIOcyDfGryMpEKfeQ2mbIeQseeWO2zjJiK	1	postgres	2022-07-29 12:47:16.428026	172.168.80.26/32	\N	\N	\N	\N	\N
629	629	JUR.EPOMA	$2b$10$AzLmzWeuBMSAU3hgRanevOPdOaiuZKhbFjM82mLbM0MRpWUzzpXO.	1	postgres	2022-07-29 12:47:16.436623	172.168.80.26/32	\N	\N	\N	\N	\N
630	630	JUR.RGOMEZ	$2b$10$/xyhtY1xB9T9/YvmRE6kkuuJ.2gXQbNnmWuKo/oGJZ1iSCG.zLYAO	1	postgres	2022-07-29 12:47:16.444604	172.168.80.26/32	\N	\N	\N	\N	\N
631	631	JUR.CALVAREZ	$2b$10$E5QDtsEEbGZzI2r6Ah5LfOvwnS09HQ.FWdtnpJbF7Qit7Mbem12Hy	1	postgres	2022-07-29 12:47:16.45308	172.168.80.26/32	\N	\N	\N	\N	\N
632	632	JUR.SCONDORI	$2b$10$KYARYbR4.Vry12GAm2dgHeURISt4YY4LXVQIKMp1O2X5S5iaaefC6	1	postgres	2022-07-29 12:47:16.461152	172.168.80.26/32	\N	\N	\N	\N	\N
633	633	JUR.DBOLIVAR	$2b$10$55CF.yXQbuBq2T23BNJuGu9Ku9x7BE4R/N0WubHAHJdlG2L5wJu9.	1	postgres	2022-07-29 12:47:16.469586	172.168.80.26/32	\N	\N	\N	\N	\N
634	634	JUR.JLOPEZ	$2b$10$KfFgsgjN1KYwXyN1G7Lsl.ZDEag/UkpR3ndqEs2n3GUzlO6P.OZ3u	1	postgres	2022-07-29 12:47:16.478221	172.168.80.26/32	\N	\N	\N	\N	\N
635	635	JUR.APALOMINO	$2b$10$OLl7avmEY6/Ij59UpCXz6.8ekuuWQga0TI64l/EZZGyPAv/dQ3136	1	postgres	2022-07-29 12:47:16.486443	172.168.80.26/32	\N	\N	\N	\N	\N
636	636	JUR.LGUZMAN	$2b$10$HKN1T6m.EvuegkJKKZ.lFu7ncJ9ACAMUFAuKw.OUm2h9C5PH8BB1.	1	postgres	2022-07-29 12:47:16.494766	172.168.80.26/32	\N	\N	\N	\N	\N
637	637	JUR.AMIRANDA	$2b$10$rDTZA.je2X9dsXMleYBKOOd/657.j5buOJG.C3CTjSbQQaj2CtMwm	1	postgres	2022-07-29 12:47:16.503049	172.168.80.26/32	\N	\N	\N	\N	\N
638	638	OARMENGOL	$2b$10$WFek2xNSXmkSaPcE/YmF/uj8m9.b1quK/UAWcLfwnbkH3ti/kAPha	1	postgres	2022-07-29 12:47:16.511511	172.168.80.26/32	\N	\N	\N	\N	\N
639	639	ETARQUI	$2b$10$1B3HVJSDt8x4AOKnLIfFGurBGTa9UHhIenan.qrbCDLGPhgQQ0tO6	1	postgres	2022-07-29 12:47:16.519656	172.168.80.26/32	\N	\N	\N	\N	\N
640	640	IFLORES	$2b$10$gbTSwPA0V2KwWWlHSrFZ3.V7.i/RnSoMDMuQh.WosjB6.fjY7IiGO	1	postgres	2022-07-29 12:47:16.527958	172.168.80.26/32	\N	\N	\N	\N	\N
641	641	MPOMA	$2b$10$SNqz7Q7J2zjyuo9ji.8Zm.CadhAdH5/vCfQ5PQcO7ok7rU6aO5L1W	1	postgres	2022-07-29 12:47:16.536787	172.168.80.26/32	\N	\N	\N	\N	\N
642	642	EPALACIOS	$2b$10$SNqz7Q7J2zjyuo9ji.8Zm.CadhAdH5/vCfQ5PQcO7ok7rU6aO5L1W	1	postgres	2022-07-29 12:47:16.544588	172.168.80.26/32	\N	\N	\N	\N	\N
627	627	LTORREZ	$2b$10$9Vf7OiYM.joojudJ55sbOOvH6rYCZm51I/Inxk1dqYmDpq.VHV5XK	1	postgres	2022-07-29 12:47:16.419578	172.168.80.26/32	postgres	2022-08-02 15:27:21.562758	172.168.80.26/32	\N	\N
643	643	ESOSA	$2b$10$7gw6bYpdc9Man1t6kprqR.Ftq74qsu/Oall5H6S/FM4qdOlQppi/q	1	postgres	2022-07-29 12:47:16.552755	172.168.80.26/32	postgres	2022-08-15 13:22:46.054865	172.168.80.19/32	\N	1
653	653	CANCI	$2b$10$xaOyMleC/pO8lLv0X/20ruvvDaXIvEa6V/a8wEEX.X2SMdYeC0VPC	1	postgres	2022-08-15 11:06:04.805971	172.168.80.19/32	\N	\N	\N	0	1
658	654	CANCONSUL	$2b$10$U48/3CMj7b/Qv87JLEDF8.zvdzHlPiIgP6s7zcZ1HUjnp79eD9QJ6	1	postgres	2022-08-15 16:14:02.662299	172.168.80.19/32	postgres	2022-08-18 12:26:30.702537	172.168.80.19/32	\N	1
\.


--
-- Data for Name: usuario_areas; Type: TABLE DATA; Schema: seguridad_v2; Owner: postgres
--

COPY seguridad_v2.usuario_areas (id_usuario_area, id_area, id_usuario, estado_registro, usuario_reg, fecha_reg, host_reg, usuario_mod, fecha_mod, host_mod) FROM stdin;
\.


--
-- Data for Name: usuario_rol; Type: TABLE DATA; Schema: seguridad_v2; Owner: postgres
--

COPY seguridad_v2.usuario_rol (id_usuario_rol, id_rol, id_usuario, id_sistema, estado_registro, usuario_reg, fecha_reg, host_reg, usuario_mod, fecha_mod, host_mod) FROM stdin;
1	4	627	1	1	postgres	2022-07-29 12:51:32.877913	172.168.80.26/32	postgres	2022-07-29 13:24:58.97365	172.168.80.26/32
2	4	126	1	1	postgres	2022-07-29 15:31:48.439008	172.168.80.26/32	\N	\N	\N
5	1	643	18	1	postgres	2022-08-15 13:21:11.132021	172.168.80.19/32	\N	\N	\N
14	1	653	17	1	postgres	2022-08-15 15:08:35.245112	172.168.80.19/32	\N	\N	\N
16	4	658	17	1	postgres	2022-08-15 16:14:02.906175	172.168.80.19/32	\N	\N	\N
\.


--
-- Name: areas_id_area_seq; Type: SEQUENCE SET; Schema: seguridad_v2; Owner: postgres
--

SELECT pg_catalog.setval('seguridad_v2.areas_id_area_seq', 7, true);


--
-- Name: departamento_id_departamento_seq; Type: SEQUENCE SET; Schema: seguridad_v2; Owner: postgres
--

SELECT pg_catalog.setval('seguridad_v2.departamento_id_departamento_seq', 9, true);


--
-- Name: entidad_id_entidad_seq; Type: SEQUENCE SET; Schema: seguridad_v2; Owner: postgres
--

SELECT pg_catalog.setval('seguridad_v2.entidad_id_entidad_seq', 2, true);


--
-- Name: menu_id_menu_seq; Type: SEQUENCE SET; Schema: seguridad_v2; Owner: postgres
--

SELECT pg_catalog.setval('seguridad_v2.menu_id_menu_seq', 1, false);


--
-- Name: menu_id_modulo_seq; Type: SEQUENCE SET; Schema: seguridad_v2; Owner: postgres
--

SELECT pg_catalog.setval('seguridad_v2.menu_id_modulo_seq', 1, false);


--
-- Name: modulos_id_modulo_seq; Type: SEQUENCE SET; Schema: seguridad_v2; Owner: postgres
--

SELECT pg_catalog.setval('seguridad_v2.modulos_id_modulo_seq', 3, true);


--
-- Name: oficina_areas_id_oficina_area_seq; Type: SEQUENCE SET; Schema: seguridad_v2; Owner: postgres
--

SELECT pg_catalog.setval('seguridad_v2.oficina_areas_id_oficina_area_seq', 1, false);


--
-- Name: oficinas_id_oficina_seq; Type: SEQUENCE SET; Schema: seguridad_v2; Owner: postgres
--

SELECT pg_catalog.setval('seguridad_v2.oficinas_id_oficina_seq', 11, true);


--
-- Name: persona_id_persona_seq; Type: SEQUENCE SET; Schema: seguridad_v2; Owner: postgres
--

SELECT pg_catalog.setval('seguridad_v2.persona_id_persona_seq', 654, true);


--
-- Name: rol_id_rol_seq; Type: SEQUENCE SET; Schema: seguridad_v2; Owner: postgres
--

SELECT pg_catalog.setval('seguridad_v2.rol_id_rol_seq', 4, true);


--
-- Name: rol_modulos_id_rol_modulo_seq; Type: SEQUENCE SET; Schema: seguridad_v2; Owner: postgres
--

SELECT pg_catalog.setval('seguridad_v2.rol_modulos_id_rol_modulo_seq', 1, false);


--
-- Name: sistemas_id_sistema_seq; Type: SEQUENCE SET; Schema: seguridad_v2; Owner: postgres
--

SELECT pg_catalog.setval('seguridad_v2.sistemas_id_sistema_seq', 18, true);


--
-- Name: usuario_areas_id_usuario_area_seq; Type: SEQUENCE SET; Schema: seguridad_v2; Owner: postgres
--

SELECT pg_catalog.setval('seguridad_v2.usuario_areas_id_usuario_area_seq', 1, false);


--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: seguridad_v2; Owner: postgres
--

SELECT pg_catalog.setval('seguridad_v2.usuario_id_usuario_seq', 658, true);


--
-- Name: usuario_rol_id_usuario_rol_seq; Type: SEQUENCE SET; Schema: seguridad_v2; Owner: postgres
--

SELECT pg_catalog.setval('seguridad_v2.usuario_rol_id_usuario_rol_seq', 16, true);


--
-- Name: areas id_area_pk; Type: CONSTRAINT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.areas
    ADD CONSTRAINT id_area_pk PRIMARY KEY (id_area);


--
-- Name: departamento id_departamento_pk; Type: CONSTRAINT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.departamento
    ADD CONSTRAINT id_departamento_pk PRIMARY KEY (id_departamento);


--
-- Name: entidad id_entidad_pk; Type: CONSTRAINT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.entidad
    ADD CONSTRAINT id_entidad_pk PRIMARY KEY (id_entidad);


--
-- Name: modulos id_modulo_pk; Type: CONSTRAINT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.modulos
    ADD CONSTRAINT id_modulo_pk PRIMARY KEY (id_modulo);


--
-- Name: oficina_areas id_oficina_area_pk; Type: CONSTRAINT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.oficina_areas
    ADD CONSTRAINT id_oficina_area_pk PRIMARY KEY (id_oficina_area);


--
-- Name: oficinas id_oficina_pk; Type: CONSTRAINT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.oficinas
    ADD CONSTRAINT id_oficina_pk PRIMARY KEY (id_oficina);


--
-- Name: persona id_persona_pk; Type: CONSTRAINT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.persona
    ADD CONSTRAINT id_persona_pk PRIMARY KEY (id_persona);


--
-- Name: rol_modulos id_rol_modulo_pk; Type: CONSTRAINT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.rol_modulos
    ADD CONSTRAINT id_rol_modulo_pk PRIMARY KEY (id_rol_modulo);


--
-- Name: rol id_rol_pk; Type: CONSTRAINT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.rol
    ADD CONSTRAINT id_rol_pk PRIMARY KEY (id_rol);


--
-- Name: usuario_areas id_usuario_area_pk; Type: CONSTRAINT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.usuario_areas
    ADD CONSTRAINT id_usuario_area_pk PRIMARY KEY (id_usuario_area);


--
-- Name: usuario_rol id_usuario_rol_pk; Type: CONSTRAINT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.usuario_rol
    ADD CONSTRAINT id_usuario_rol_pk PRIMARY KEY (id_usuario_rol);


--
-- Name: menu menu_pk; Type: CONSTRAINT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.menu
    ADD CONSTRAINT menu_pk PRIMARY KEY (id_menu);


--
-- Name: sistemas sistemas_pk; Type: CONSTRAINT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.sistemas
    ADD CONSTRAINT sistemas_pk PRIMARY KEY (id_sistema);


--
-- Name: usuario usuario_pk; Type: CONSTRAINT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.usuario
    ADD CONSTRAINT usuario_pk PRIMARY KEY (id_usuario);


--
-- Name: usuario usuario_unico; Type: CONSTRAINT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.usuario
    ADD CONSTRAINT usuario_unico UNIQUE (usuario);


--
-- Name: entidad tg_ins_upd_usr_fecha; Type: TRIGGER; Schema: seguridad_v2; Owner: postgres
--

CREATE TRIGGER tg_ins_upd_usr_fecha BEFORE INSERT OR UPDATE ON seguridad_v2.entidad FOR EACH ROW EXECUTE PROCEDURE public.fl_tg_ins_upd_usr_fecha();


--
-- Name: menu tg_ins_upd_usr_fecha; Type: TRIGGER; Schema: seguridad_v2; Owner: postgres
--

CREATE TRIGGER tg_ins_upd_usr_fecha BEFORE INSERT OR UPDATE ON seguridad_v2.menu FOR EACH ROW EXECUTE PROCEDURE public.fl_tg_ins_upd_usr_fecha();


--
-- Name: modulos tg_ins_upd_usr_fecha; Type: TRIGGER; Schema: seguridad_v2; Owner: postgres
--

CREATE TRIGGER tg_ins_upd_usr_fecha BEFORE INSERT OR UPDATE ON seguridad_v2.modulos FOR EACH ROW EXECUTE PROCEDURE public.fl_tg_ins_upd_usr_fecha();


--
-- Name: oficina_areas tg_ins_upd_usr_fecha; Type: TRIGGER; Schema: seguridad_v2; Owner: postgres
--

CREATE TRIGGER tg_ins_upd_usr_fecha BEFORE INSERT OR UPDATE ON seguridad_v2.oficina_areas FOR EACH ROW EXECUTE PROCEDURE public.fl_tg_ins_upd_usr_fecha();


--
-- Name: persona tg_ins_upd_usr_fecha; Type: TRIGGER; Schema: seguridad_v2; Owner: postgres
--

CREATE TRIGGER tg_ins_upd_usr_fecha BEFORE INSERT OR UPDATE ON seguridad_v2.persona FOR EACH ROW EXECUTE PROCEDURE public.fl_tg_ins_upd_usr_fecha();


--
-- Name: rol tg_ins_upd_usr_fecha; Type: TRIGGER; Schema: seguridad_v2; Owner: postgres
--

CREATE TRIGGER tg_ins_upd_usr_fecha BEFORE INSERT OR UPDATE ON seguridad_v2.rol FOR EACH ROW EXECUTE PROCEDURE public.fl_tg_ins_upd_usr_fecha();


--
-- Name: rol_modulos tg_ins_upd_usr_fecha; Type: TRIGGER; Schema: seguridad_v2; Owner: postgres
--

CREATE TRIGGER tg_ins_upd_usr_fecha BEFORE INSERT OR UPDATE ON seguridad_v2.rol_modulos FOR EACH ROW EXECUTE PROCEDURE public.fl_tg_ins_upd_usr_fecha();


--
-- Name: sistemas tg_ins_upd_usr_fecha; Type: TRIGGER; Schema: seguridad_v2; Owner: postgres
--

CREATE TRIGGER tg_ins_upd_usr_fecha BEFORE INSERT OR UPDATE ON seguridad_v2.sistemas FOR EACH ROW EXECUTE PROCEDURE public.fl_tg_ins_upd_usr_fecha();


--
-- Name: usuario tg_ins_upd_usr_fecha; Type: TRIGGER; Schema: seguridad_v2; Owner: postgres
--

CREATE TRIGGER tg_ins_upd_usr_fecha BEFORE INSERT OR UPDATE ON seguridad_v2.usuario FOR EACH ROW EXECUTE PROCEDURE public.fl_tg_ins_upd_usr_fecha();


--
-- Name: usuario_areas tg_ins_upd_usr_fecha; Type: TRIGGER; Schema: seguridad_v2; Owner: postgres
--

CREATE TRIGGER tg_ins_upd_usr_fecha BEFORE INSERT OR UPDATE ON seguridad_v2.usuario_areas FOR EACH ROW EXECUTE PROCEDURE public.fl_tg_ins_upd_usr_fecha();


--
-- Name: usuario_rol tg_ins_upd_usr_fecha; Type: TRIGGER; Schema: seguridad_v2; Owner: postgres
--

CREATE TRIGGER tg_ins_upd_usr_fecha BEFORE INSERT OR UPDATE ON seguridad_v2.usuario_rol FOR EACH ROW EXECUTE PROCEDURE public.fl_tg_ins_upd_usr_fecha();


--
-- Name: usuario_areas id_area_fk; Type: FK CONSTRAINT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.usuario_areas
    ADD CONSTRAINT id_area_fk FOREIGN KEY (id_area) REFERENCES seguridad_v2.areas(id_area);


--
-- Name: oficina_areas id_area_fk; Type: FK CONSTRAINT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.oficina_areas
    ADD CONSTRAINT id_area_fk FOREIGN KEY (id_area) REFERENCES seguridad_v2.areas(id_area);


--
-- Name: oficinas id_departamento_fk; Type: FK CONSTRAINT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.oficinas
    ADD CONSTRAINT id_departamento_fk FOREIGN KEY (id_departamento) REFERENCES seguridad_v2.departamento(id_departamento);


--
-- Name: menu id_menu_fk; Type: FK CONSTRAINT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.menu
    ADD CONSTRAINT id_menu_fk FOREIGN KEY (id_modulo) REFERENCES seguridad_v2.modulos(id_modulo);


--
-- Name: rol_modulos id_modulo_fk; Type: FK CONSTRAINT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.rol_modulos
    ADD CONSTRAINT id_modulo_fk FOREIGN KEY (id_modulo) REFERENCES seguridad_v2.modulos(id_modulo);


--
-- Name: oficina_areas id_oficina_fk; Type: FK CONSTRAINT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.oficina_areas
    ADD CONSTRAINT id_oficina_fk FOREIGN KEY (id_oficina) REFERENCES seguridad_v2.oficinas(id_oficina);


--
-- Name: usuario id_persona_fk; Type: FK CONSTRAINT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.usuario
    ADD CONSTRAINT id_persona_fk FOREIGN KEY (id_persona) REFERENCES seguridad_v2.persona(id_persona);


--
-- Name: usuario_rol id_rol_fk; Type: FK CONSTRAINT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.usuario_rol
    ADD CONSTRAINT id_rol_fk FOREIGN KEY (id_rol) REFERENCES seguridad_v2.rol(id_rol);


--
-- Name: rol_modulos id_rol_fk; Type: FK CONSTRAINT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.rol_modulos
    ADD CONSTRAINT id_rol_fk FOREIGN KEY (id_rol) REFERENCES seguridad_v2.rol(id_rol);


--
-- Name: usuario_rol id_sistema_fk; Type: FK CONSTRAINT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.usuario_rol
    ADD CONSTRAINT id_sistema_fk FOREIGN KEY (id_sistema) REFERENCES seguridad_v2.sistemas(id_sistema);


--
-- Name: usuario_rol id_usuario_fk; Type: FK CONSTRAINT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.usuario_rol
    ADD CONSTRAINT id_usuario_fk FOREIGN KEY (id_usuario) REFERENCES seguridad_v2.usuario(id_usuario);


--
-- Name: usuario_areas id_usuario_fk; Type: FK CONSTRAINT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.usuario_areas
    ADD CONSTRAINT id_usuario_fk FOREIGN KEY (id_usuario) REFERENCES seguridad_v2.usuario(id_usuario);


--
-- Name: modulos modulos_sistemas_fk; Type: FK CONSTRAINT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.modulos
    ADD CONSTRAINT modulos_sistemas_fk FOREIGN KEY (id_sistema) REFERENCES seguridad_v2.sistemas(id_sistema);


--
-- Name: usuario usuario_entidad_id_entidad_fk; Type: FK CONSTRAINT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.usuario
    ADD CONSTRAINT usuario_entidad_id_entidad_fk FOREIGN KEY (id_entidad) REFERENCES seguridad_v2.entidad(id_entidad);


--
-- Name: usuario usuario_oficina_fk; Type: FK CONSTRAINT; Schema: seguridad_v2; Owner: postgres
--

ALTER TABLE ONLY seguridad_v2.usuario
    ADD CONSTRAINT usuario_oficina_fk FOREIGN KEY (id_oficina) REFERENCES seguridad_v2.oficinas(id_oficina);


--
-- PostgreSQL database dump complete
--

