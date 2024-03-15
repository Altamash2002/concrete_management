--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

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
-- Name: acceptance_strengths; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.acceptance_strengths (
    id bigint NOT NULL,
    title character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    percentage double precision
);


ALTER TABLE public.acceptance_strengths OWNER TO altmash;

--
-- Name: acceptance_strengths_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.acceptance_strengths_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acceptance_strengths_id_seq OWNER TO altmash;

--
-- Name: acceptance_strengths_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.acceptance_strengths_id_seq OWNED BY public.acceptance_strengths.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO altmash;

--
-- Name: binder1_flyashes; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.binder1_flyashes (
    id bigint NOT NULL,
    name character varying,
    dosage integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.binder1_flyashes OWNER TO altmash;

--
-- Name: binder1_flyashes_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.binder1_flyashes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.binder1_flyashes_id_seq OWNER TO altmash;

--
-- Name: binder1_flyashes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.binder1_flyashes_id_seq OWNED BY public.binder1_flyashes.id;


--
-- Name: binder2s; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.binder2s (
    id bigint NOT NULL,
    name character varying,
    dosage integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.binder2s OWNER TO altmash;

--
-- Name: binder2s_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.binder2s_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.binder2s_id_seq OWNER TO altmash;

--
-- Name: binder2s_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.binder2s_id_seq OWNED BY public.binder2s.id;


--
-- Name: binder3s; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.binder3s (
    id bigint NOT NULL,
    name character varying,
    dosage integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.binder3s OWNER TO altmash;

--
-- Name: binder3s_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.binder3s_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.binder3s_id_seq OWNER TO altmash;

--
-- Name: binder3s_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.binder3s_id_seq OWNED BY public.binder3s.id;


--
-- Name: building_masters; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.building_masters (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    project_master_id bigint
);


ALTER TABLE public.building_masters OWNER TO altmash;

--
-- Name: building_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.building_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.building_masters_id_seq OWNER TO altmash;

--
-- Name: building_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.building_masters_id_seq OWNED BY public.building_masters.id;


--
-- Name: cement_brands; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.cement_brands (
    id bigint NOT NULL,
    title character varying,
    company character varying,
    contact_number integer,
    location character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.cement_brands OWNER TO altmash;

--
-- Name: cement_brands_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.cement_brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cement_brands_id_seq OWNER TO altmash;

--
-- Name: cement_brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.cement_brands_id_seq OWNED BY public.cement_brands.id;


--
-- Name: cement_types; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.cement_types (
    id bigint NOT NULL,
    title character varying,
    company character varying,
    contact_number integer,
    location character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    cement_brand_id bigint NOT NULL
);


ALTER TABLE public.cement_types OWNER TO altmash;

--
-- Name: cement_types_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.cement_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cement_types_id_seq OWNER TO altmash;

--
-- Name: cement_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.cement_types_id_seq OWNED BY public.cement_types.id;


--
-- Name: cements; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.cements (
    id bigint NOT NULL,
    brand character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.cements OWNER TO altmash;

--
-- Name: cements_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.cements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cements_id_seq OWNER TO altmash;

--
-- Name: cements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.cements_id_seq OWNED BY public.cements.id;


--
-- Name: concrete_mix_design_rmcs; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.concrete_mix_design_rmcs (
    id bigint NOT NULL,
    project_master_id bigint NOT NULL,
    building_master_id bigint NOT NULL,
    contractor_master_id bigint NOT NULL,
    rmc_list_id bigint NOT NULL,
    acceptance_strength_id bigint NOT NULL,
    revision character varying,
    grade_master_id bigint NOT NULL,
    wb_ratio double precision,
    cement_content_kg_per_m3 double precision,
    "Binder1_FlyAsh_kg_per_m3" double precision,
    third_binder double precision,
    water_in_ltrs_per_m3 double precision,
    ca2_20mm_in_kg_per_m3 double precision,
    ca1_10mm_in_kg_per_m3 double precision,
    manufactured_sand_in_kg_per_m3 double precision,
    wash_sand_in_kg_per_m3 double precision,
    cement_id bigint NOT NULL,
    superplasticizer_id bigint NOT NULL,
    plasticizer_percent_wt_of_c_plus_f double precision,
    platicizer_in_kg_per_m3 double precision,
    structure_master_id bigint NOT NULL,
    date date,
    remark character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.concrete_mix_design_rmcs OWNER TO altmash;

--
-- Name: concrete_mix_design_rmcs_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.concrete_mix_design_rmcs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.concrete_mix_design_rmcs_id_seq OWNER TO altmash;

--
-- Name: concrete_mix_design_rmcs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.concrete_mix_design_rmcs_id_seq OWNED BY public.concrete_mix_design_rmcs.id;


--
-- Name: concrete_mix_design_sites; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.concrete_mix_design_sites (
    id bigint NOT NULL,
    project_master_id bigint NOT NULL,
    building_master_id bigint NOT NULL,
    contractor_master_id bigint NOT NULL,
    acceptance_strength_id bigint NOT NULL,
    revision character varying,
    grade_master_id bigint NOT NULL,
    wb_ratio double precision,
    cement_content_kg_per_m3 double precision,
    binder1_flyash_kg_per_m3 double precision,
    third_binder character varying,
    water_in_ltrs_per_m3 double precision,
    ca2_20mm_in_kg_per_m3 double precision,
    ca1_10mm_in_kg_per_m3 double precision,
    fa2_in_kg_per_m3 double precision,
    manufactured_sand_in_kg_per_m3 double precision,
    cement_id bigint NOT NULL,
    superplasticizer_id bigint NOT NULL,
    plasticizer_percent_wt_of_c_plus_f character varying,
    plasticizer_in_kg_per_m3 double precision,
    remarks character varying,
    date date,
    latest character varying,
    plant character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.concrete_mix_design_sites OWNER TO altmash;

--
-- Name: concrete_mix_design_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.concrete_mix_design_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.concrete_mix_design_sites_id_seq OWNER TO altmash;

--
-- Name: concrete_mix_design_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.concrete_mix_design_sites_id_seq OWNED BY public.concrete_mix_design_sites.id;


--
-- Name: concretes; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.concretes (
    id bigint NOT NULL,
    rmc_site_concrete character varying,
    structure character varying,
    grade character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.concretes OWNER TO altmash;

--
-- Name: concretes_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.concretes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.concretes_id_seq OWNER TO altmash;

--
-- Name: concretes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.concretes_id_seq OWNED BY public.concretes.id;


--
-- Name: contractor_masters; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.contractor_masters (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.contractor_masters OWNER TO altmash;

--
-- Name: contractor_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.contractor_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contractor_masters_id_seq OWNER TO altmash;

--
-- Name: contractor_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.contractor_masters_id_seq OWNED BY public.contractor_masters.id;


--
-- Name: day15_acceptances; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.day15_acceptances (
    id bigint NOT NULL,
    grade_master_id bigint NOT NULL,
    strength_at_80p integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.day15_acceptances OWNER TO altmash;

--
-- Name: day15_acceptances_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.day15_acceptances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.day15_acceptances_id_seq OWNER TO altmash;

--
-- Name: day15_acceptances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.day15_acceptances_id_seq OWNED BY public.day15_acceptances.id;


--
-- Name: day28_acceptances; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.day28_acceptances (
    id bigint NOT NULL,
    grade_master_id bigint NOT NULL,
    strength_at_100p integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.day28_acceptances OWNER TO altmash;

--
-- Name: day28_acceptances_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.day28_acceptances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.day28_acceptances_id_seq OWNER TO altmash;

--
-- Name: day28_acceptances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.day28_acceptances_id_seq OWNED BY public.day28_acceptances.id;


--
-- Name: day3_acceptances; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.day3_acceptances (
    id bigint NOT NULL,
    grade_master_id bigint NOT NULL,
    strength_at_50p integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.day3_acceptances OWNER TO altmash;

--
-- Name: day3_acceptances_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.day3_acceptances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.day3_acceptances_id_seq OWNER TO altmash;

--
-- Name: day3_acceptances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.day3_acceptances_id_seq OWNED BY public.day3_acceptances.id;


--
-- Name: day5_acceptances; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.day5_acceptances (
    id bigint NOT NULL,
    grade_master_id bigint NOT NULL,
    strength_at_70p integer,
    strength_at_75p integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.day5_acceptances OWNER TO altmash;

--
-- Name: day5_acceptances_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.day5_acceptances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.day5_acceptances_id_seq OWNER TO altmash;

--
-- Name: day5_acceptances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.day5_acceptances_id_seq OWNED BY public.day5_acceptances.id;


--
-- Name: day7_acceptances; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.day7_acceptances (
    id bigint NOT NULL,
    grade_master_id bigint NOT NULL,
    strength_at_67p integer,
    strength_at_72p integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.day7_acceptances OWNER TO altmash;

--
-- Name: day7_acceptances_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.day7_acceptances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.day7_acceptances_id_seq OWNER TO altmash;

--
-- Name: day7_acceptances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.day7_acceptances_id_seq OWNED BY public.day7_acceptances.id;


--
-- Name: grade_masters; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.grade_masters (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.grade_masters OWNER TO altmash;

--
-- Name: grade_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.grade_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grade_masters_id_seq OWNER TO altmash;

--
-- Name: grade_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.grade_masters_id_seq OWNED BY public.grade_masters.id;


--
-- Name: m_admixtures; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.m_admixtures (
    id bigint NOT NULL,
    brand character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.m_admixtures OWNER TO altmash;

--
-- Name: m_admixtures_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.m_admixtures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.m_admixtures_id_seq OWNER TO altmash;

--
-- Name: m_admixtures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.m_admixtures_id_seq OWNED BY public.m_admixtures.id;


--
-- Name: m_silicas; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.m_silicas (
    id bigint NOT NULL,
    brand character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.m_silicas OWNER TO altmash;

--
-- Name: m_silicas_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.m_silicas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.m_silicas_id_seq OWNER TO altmash;

--
-- Name: m_silicas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.m_silicas_id_seq OWNED BY public.m_silicas.id;


--
-- Name: mix_designs; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.mix_designs (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    recipe_id bigint NOT NULL
);


ALTER TABLE public.mix_designs OWNER TO altmash;

--
-- Name: mix_designs_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.mix_designs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mix_designs_id_seq OWNER TO altmash;

--
-- Name: mix_designs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.mix_designs_id_seq OWNED BY public.mix_designs.id;


--
-- Name: mix_strengthand_structures; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.mix_strengthand_structures (
    id bigint NOT NULL,
    structure_master_id bigint NOT NULL,
    acceptance_strength_id bigint NOT NULL,
    structure_name character varying,
    number integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.mix_strengthand_structures OWNER TO altmash;

--
-- Name: mix_strengthand_structures_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.mix_strengthand_structures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mix_strengthand_structures_id_seq OWNER TO altmash;

--
-- Name: mix_strengthand_structures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.mix_strengthand_structures_id_seq OWNED BY public.mix_strengthand_structures.id;


--
-- Name: project_masters; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.project_masters (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.project_masters OWNER TO altmash;

--
-- Name: project_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.project_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_masters_id_seq OWNER TO altmash;

--
-- Name: project_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.project_masters_id_seq OWNED BY public.project_masters.id;


--
-- Name: recipe_ingredients; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.recipe_ingredients (
    id bigint NOT NULL,
    recipe_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.recipe_ingredients OWNER TO altmash;

--
-- Name: recipe_ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.recipe_ingredients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipe_ingredients_id_seq OWNER TO altmash;

--
-- Name: recipe_ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.recipe_ingredients_id_seq OWNED BY public.recipe_ingredients.id;


--
-- Name: recipes; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.recipes (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    cement_id bigint,
    m_admixture_id bigint,
    m_silica_id bigint,
    superplasticizer_id bigint
);


ALTER TABLE public.recipes OWNER TO altmash;

--
-- Name: recipes_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.recipes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_id_seq OWNER TO altmash;

--
-- Name: recipes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.recipes_id_seq OWNED BY public.recipes.id;


--
-- Name: rmc_lists; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.rmc_lists (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.rmc_lists OWNER TO altmash;

--
-- Name: rmc_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.rmc_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rmc_lists_id_seq OWNER TO altmash;

--
-- Name: rmc_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.rmc_lists_id_seq OWNED BY public.rmc_lists.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO altmash;

--
-- Name: strength_acceptances; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.strength_acceptances (
    id bigint NOT NULL,
    grade character varying,
    day character varying,
    percentage double precision,
    value double precision,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.strength_acceptances OWNER TO altmash;

--
-- Name: strength_acceptances_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.strength_acceptances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strength_acceptances_id_seq OWNER TO altmash;

--
-- Name: strength_acceptances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.strength_acceptances_id_seq OWNED BY public.strength_acceptances.id;


--
-- Name: strength_testings; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.strength_testings (
    id bigint NOT NULL,
    density integer,
    remark character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    project_master_id bigint,
    building_master_id bigint,
    structure_master_id bigint,
    grade_master_id bigint,
    cement_id bigint,
    s_plasticizer_id bigint,
    m_admixture_id bigint,
    m_silica_id bigint,
    date date,
    w_b_ratio double precision,
    cement_c_c_kg_m3 double precision,
    s_plasticizer_dosage double precision,
    m_admixture_dosage double precision,
    m_silica_dosage double precision,
    rmc_list_id bigint,
    is_gray boolean DEFAULT false,
    is_red boolean DEFAULT false,
    is_green boolean DEFAULT false,
    user_id bigint
);


ALTER TABLE public.strength_testings OWNER TO altmash;

--
-- Name: strength_testings_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.strength_testings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strength_testings_id_seq OWNER TO altmash;

--
-- Name: strength_testings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.strength_testings_id_seq OWNED BY public.strength_testings.id;


--
-- Name: structure_masters; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.structure_masters (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    acceptance_strength_id bigint
);


ALTER TABLE public.structure_masters OWNER TO altmash;

--
-- Name: structure_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.structure_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.structure_masters_id_seq OWNER TO altmash;

--
-- Name: structure_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.structure_masters_id_seq OWNED BY public.structure_masters.id;


--
-- Name: structure_types; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.structure_types (
    id bigint NOT NULL,
    title character varying,
    company character varying,
    city character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    mix_design_id bigint NOT NULL
);


ALTER TABLE public.structure_types OWNER TO altmash;

--
-- Name: structure_types_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.structure_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.structure_types_id_seq OWNER TO altmash;

--
-- Name: structure_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.structure_types_id_seq OWNED BY public.structure_types.id;


--
-- Name: superplasticizer_brands; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.superplasticizer_brands (
    id bigint NOT NULL,
    title character varying,
    company character varying,
    city character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.superplasticizer_brands OWNER TO altmash;

--
-- Name: superplasticizer_brands_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.superplasticizer_brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.superplasticizer_brands_id_seq OWNER TO altmash;

--
-- Name: superplasticizer_brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.superplasticizer_brands_id_seq OWNED BY public.superplasticizer_brands.id;


--
-- Name: superplasticizer_types; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.superplasticizer_types (
    id bigint NOT NULL,
    title character varying,
    type character varying,
    company character varying,
    city character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    superplasticizer_brand_id bigint NOT NULL
);


ALTER TABLE public.superplasticizer_types OWNER TO altmash;

--
-- Name: superplasticizer_types_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.superplasticizer_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.superplasticizer_types_id_seq OWNER TO altmash;

--
-- Name: superplasticizer_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.superplasticizer_types_id_seq OWNED BY public.superplasticizer_types.id;


--
-- Name: superplasticizers; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.superplasticizers (
    id bigint NOT NULL,
    brand character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    base_of_plasticizer character varying,
    plasticizer_in_kg_per_m3 double precision
);


ALTER TABLE public.superplasticizers OWNER TO altmash;

--
-- Name: superplasticizers_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.superplasticizers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.superplasticizers_id_seq OWNER TO altmash;

--
-- Name: superplasticizers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.superplasticizers_id_seq OWNED BY public.superplasticizers.id;


--
-- Name: testing_day_masters; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.testing_day_masters (
    id bigint NOT NULL,
    day character varying,
    title character varying,
    sequence integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.testing_day_masters OWNER TO altmash;

--
-- Name: testing_day_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.testing_day_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.testing_day_masters_id_seq OWNER TO altmash;

--
-- Name: testing_day_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.testing_day_masters_id_seq OWNED BY public.testing_day_masters.id;


--
-- Name: testing_duration_masters; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.testing_duration_masters (
    id bigint NOT NULL,
    name character varying,
    contact_number integer,
    location character varying,
    duration character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.testing_duration_masters OWNER TO altmash;

--
-- Name: testing_duration_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.testing_duration_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.testing_duration_masters_id_seq OWNER TO altmash;

--
-- Name: testing_duration_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.testing_duration_masters_id_seq OWNED BY public.testing_duration_masters.id;


--
-- Name: testing_results; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.testing_results (
    id bigint NOT NULL,
    slot_type character varying,
    result_value integer,
    attempts integer,
    pass_status character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    strength_testing_id bigint NOT NULL
);


ALTER TABLE public.testing_results OWNER TO altmash;

--
-- Name: testing_results_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.testing_results_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.testing_results_id_seq OWNER TO altmash;

--
-- Name: testing_results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.testing_results_id_seq OWNED BY public.testing_results.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    is_admin boolean DEFAULT false,
    building_master_id integer,
    project_master_id integer,
    strength_testing_id integer
);


ALTER TABLE public.users OWNER TO altmash;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO altmash;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: water_reducer_brands; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.water_reducer_brands (
    id bigint NOT NULL,
    title character varying,
    company character varying,
    city character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.water_reducer_brands OWNER TO altmash;

--
-- Name: water_reducer_brands_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.water_reducer_brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.water_reducer_brands_id_seq OWNER TO altmash;

--
-- Name: water_reducer_brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.water_reducer_brands_id_seq OWNED BY public.water_reducer_brands.id;


--
-- Name: water_reducer_types; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.water_reducer_types (
    id bigint NOT NULL,
    title character varying,
    company character varying,
    city character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    water_reducer_brand_id bigint NOT NULL
);


ALTER TABLE public.water_reducer_types OWNER TO altmash;

--
-- Name: water_reducer_types_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.water_reducer_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.water_reducer_types_id_seq OWNER TO altmash;

--
-- Name: water_reducer_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.water_reducer_types_id_seq OWNED BY public.water_reducer_types.id;


--
-- Name: zone_masters; Type: TABLE; Schema: public; Owner: altmash
--

CREATE TABLE public.zone_masters (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.zone_masters OWNER TO altmash;

--
-- Name: zone_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: altmash
--

CREATE SEQUENCE public.zone_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.zone_masters_id_seq OWNER TO altmash;

--
-- Name: zone_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: altmash
--

ALTER SEQUENCE public.zone_masters_id_seq OWNED BY public.zone_masters.id;


--
-- Name: acceptance_strengths id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.acceptance_strengths ALTER COLUMN id SET DEFAULT nextval('public.acceptance_strengths_id_seq'::regclass);


--
-- Name: binder1_flyashes id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.binder1_flyashes ALTER COLUMN id SET DEFAULT nextval('public.binder1_flyashes_id_seq'::regclass);


--
-- Name: binder2s id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.binder2s ALTER COLUMN id SET DEFAULT nextval('public.binder2s_id_seq'::regclass);


--
-- Name: binder3s id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.binder3s ALTER COLUMN id SET DEFAULT nextval('public.binder3s_id_seq'::regclass);


--
-- Name: building_masters id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.building_masters ALTER COLUMN id SET DEFAULT nextval('public.building_masters_id_seq'::regclass);


--
-- Name: cement_brands id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.cement_brands ALTER COLUMN id SET DEFAULT nextval('public.cement_brands_id_seq'::regclass);


--
-- Name: cement_types id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.cement_types ALTER COLUMN id SET DEFAULT nextval('public.cement_types_id_seq'::regclass);


--
-- Name: cements id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.cements ALTER COLUMN id SET DEFAULT nextval('public.cements_id_seq'::regclass);


--
-- Name: concrete_mix_design_rmcs id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.concrete_mix_design_rmcs ALTER COLUMN id SET DEFAULT nextval('public.concrete_mix_design_rmcs_id_seq'::regclass);


--
-- Name: concrete_mix_design_sites id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.concrete_mix_design_sites ALTER COLUMN id SET DEFAULT nextval('public.concrete_mix_design_sites_id_seq'::regclass);


--
-- Name: concretes id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.concretes ALTER COLUMN id SET DEFAULT nextval('public.concretes_id_seq'::regclass);


--
-- Name: contractor_masters id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.contractor_masters ALTER COLUMN id SET DEFAULT nextval('public.contractor_masters_id_seq'::regclass);


--
-- Name: day15_acceptances id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.day15_acceptances ALTER COLUMN id SET DEFAULT nextval('public.day15_acceptances_id_seq'::regclass);


--
-- Name: day28_acceptances id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.day28_acceptances ALTER COLUMN id SET DEFAULT nextval('public.day28_acceptances_id_seq'::regclass);


--
-- Name: day3_acceptances id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.day3_acceptances ALTER COLUMN id SET DEFAULT nextval('public.day3_acceptances_id_seq'::regclass);


--
-- Name: day5_acceptances id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.day5_acceptances ALTER COLUMN id SET DEFAULT nextval('public.day5_acceptances_id_seq'::regclass);


--
-- Name: day7_acceptances id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.day7_acceptances ALTER COLUMN id SET DEFAULT nextval('public.day7_acceptances_id_seq'::regclass);


--
-- Name: grade_masters id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.grade_masters ALTER COLUMN id SET DEFAULT nextval('public.grade_masters_id_seq'::regclass);


--
-- Name: m_admixtures id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.m_admixtures ALTER COLUMN id SET DEFAULT nextval('public.m_admixtures_id_seq'::regclass);


--
-- Name: m_silicas id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.m_silicas ALTER COLUMN id SET DEFAULT nextval('public.m_silicas_id_seq'::regclass);


--
-- Name: mix_designs id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.mix_designs ALTER COLUMN id SET DEFAULT nextval('public.mix_designs_id_seq'::regclass);


--
-- Name: mix_strengthand_structures id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.mix_strengthand_structures ALTER COLUMN id SET DEFAULT nextval('public.mix_strengthand_structures_id_seq'::regclass);


--
-- Name: project_masters id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.project_masters ALTER COLUMN id SET DEFAULT nextval('public.project_masters_id_seq'::regclass);


--
-- Name: recipe_ingredients id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.recipe_ingredients ALTER COLUMN id SET DEFAULT nextval('public.recipe_ingredients_id_seq'::regclass);


--
-- Name: recipes id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.recipes ALTER COLUMN id SET DEFAULT nextval('public.recipes_id_seq'::regclass);


--
-- Name: rmc_lists id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.rmc_lists ALTER COLUMN id SET DEFAULT nextval('public.rmc_lists_id_seq'::regclass);


--
-- Name: strength_acceptances id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.strength_acceptances ALTER COLUMN id SET DEFAULT nextval('public.strength_acceptances_id_seq'::regclass);


--
-- Name: strength_testings id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.strength_testings ALTER COLUMN id SET DEFAULT nextval('public.strength_testings_id_seq'::regclass);


--
-- Name: structure_masters id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.structure_masters ALTER COLUMN id SET DEFAULT nextval('public.structure_masters_id_seq'::regclass);


--
-- Name: structure_types id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.structure_types ALTER COLUMN id SET DEFAULT nextval('public.structure_types_id_seq'::regclass);


--
-- Name: superplasticizer_brands id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.superplasticizer_brands ALTER COLUMN id SET DEFAULT nextval('public.superplasticizer_brands_id_seq'::regclass);


--
-- Name: superplasticizer_types id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.superplasticizer_types ALTER COLUMN id SET DEFAULT nextval('public.superplasticizer_types_id_seq'::regclass);


--
-- Name: superplasticizers id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.superplasticizers ALTER COLUMN id SET DEFAULT nextval('public.superplasticizers_id_seq'::regclass);


--
-- Name: testing_day_masters id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.testing_day_masters ALTER COLUMN id SET DEFAULT nextval('public.testing_day_masters_id_seq'::regclass);


--
-- Name: testing_duration_masters id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.testing_duration_masters ALTER COLUMN id SET DEFAULT nextval('public.testing_duration_masters_id_seq'::regclass);


--
-- Name: testing_results id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.testing_results ALTER COLUMN id SET DEFAULT nextval('public.testing_results_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: water_reducer_brands id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.water_reducer_brands ALTER COLUMN id SET DEFAULT nextval('public.water_reducer_brands_id_seq'::regclass);


--
-- Name: water_reducer_types id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.water_reducer_types ALTER COLUMN id SET DEFAULT nextval('public.water_reducer_types_id_seq'::regclass);


--
-- Name: zone_masters id; Type: DEFAULT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.zone_masters ALTER COLUMN id SET DEFAULT nextval('public.zone_masters_id_seq'::regclass);


--
-- Data for Name: acceptance_strengths; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.acceptance_strengths (id, title, created_at, updated_at, percentage) FROM stdin;
5	7 days B	2023-06-07 07:13:45.721289	2023-07-08 02:30:52.254926	72
4	7 days A	2023-06-07 07:13:26.364828	2023-07-08 02:30:59.697394	67
3	5 days B	2023-06-07 07:13:04.694422	2023-07-08 02:31:07.204654	75
2	5 days A	2023-06-07 07:12:49.223841	2023-07-08 02:31:13.477013	70
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2023-05-24 13:06:41.422288	2023-05-24 13:06:41.422288
\.


--
-- Data for Name: binder1_flyashes; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.binder1_flyashes (id, name, dosage, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: binder2s; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.binder2s (id, name, dosage, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: binder3s; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.binder3s (id, name, dosage, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: building_masters; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.building_masters (id, name, created_at, updated_at, project_master_id) FROM stdin;
18	Centauras A 	2023-06-30 01:15:39.047405	2023-06-30 01:15:39.047405	\N
19	Centauras B 	2023-06-30 01:15:56.94334	2023-06-30 01:15:56.94334	\N
20	Villa Nebula	2023-06-30 01:16:11.238346	2023-06-30 01:16:11.238346	\N
21	Belicia	2023-06-30 01:16:21.896004	2023-06-30 01:16:21.896004	\N
22	Greenwood	2023-06-30 01:16:36.199529	2023-06-30 01:16:36.199529	\N
23	Bridgewood	2023-06-30 01:16:46.853971	2023-06-30 01:16:46.853971	\N
24	Oakwood	2023-06-30 01:16:57.135637	2023-06-30 01:16:57.135637	\N
25	Castalia	2023-06-30 01:17:12.563539	2023-06-30 01:17:12.563539	\N
17	hira	2023-06-13 07:36:24.167205	2023-07-03 09:44:31.97801	\N
16	Falcon	2023-05-29 09:42:52.173192	2023-07-04 10:41:31.754498	\N
\.


--
-- Data for Name: cement_brands; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.cement_brands (id, title, company, contact_number, location, created_at, updated_at) FROM stdin;
1	\N	\N	\N	\N	2023-05-25 12:28:31.985178	2023-05-25 12:28:31.985178
2	\N	\N	\N	\N	2023-05-25 12:28:32.036558	2023-05-25 12:28:32.036558
\.


--
-- Data for Name: cement_types; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.cement_types (id, title, company, contact_number, location, created_at, updated_at, cement_brand_id) FROM stdin;
\.


--
-- Data for Name: cements; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.cements (id, brand, created_at, updated_at) FROM stdin;
6	Ultratech opc Dronagiri Navi Mumbai - Maharashtra	2023-06-22 06:15:47.58512	2023-06-22 06:15:47.58512
7	Ultratech opc Awarpur Chandrapur - Maharashtra	2023-06-22 06:15:47.625429	2023-06-22 06:15:47.625429
8	Ultratech opc Rajshree Malkhedroad - Karanatak	2023-06-22 06:15:47.636205	2023-06-22 06:15:47.636205
9	Ultratech opc Hotgi Solapur - Maharashtra	2023-06-22 06:15:47.647581	2023-06-22 06:15:47.647581
10	Ambuja opc Maratha Chandrapur - Maharashtra	2023-06-22 06:15:47.658162	2023-06-22 06:15:47.658162
11	Ambuja opc Kodinar Gir Somnath - Gujarat	2023-06-22 06:15:47.670371	2023-06-22 06:15:47.670371
12	Ambuja Powercem Panvel Riagad - Maharashtra	2023-06-22 06:15:47.681855	2023-06-22 06:15:47.681855
13	Binani opc Pindwara Sirohi - Rajasthan	2023-06-22 06:15:47.692969	2023-06-22 06:15:47.692969
14	Sanghi opc Sanghipura Abdasa Kutch - Gujarat	2023-06-22 06:15:47.703234	2023-06-22 06:15:47.703234
15	Shree Ultra opc Beawar Ajmer - Rajasthan	2023-06-22 06:15:47.715509	2023-06-22 06:15:47.715509
16	Hathi opc Saurashtra Porbandar - Gujarat	2023-06-22 06:15:47.726715	2023-06-22 06:15:47.726715
17	Hathi opc Sidheegram Gir Somnath -Gujarat	2023-06-22 06:15:47.737464	2023-06-22 06:15:47.737464
18	ACC opc Wadi - Karanatak	2023-06-22 06:15:47.748295	2023-06-22 06:15:47.748295
19	ACC opc Chandrapur - Maharashtra	2023-06-22 06:15:47.759463	2023-06-22 06:15:47.759463
20	Birla Gold opc  Manikgarh Gadchandur -Maharashtra	2023-06-22 06:15:47.77158	2023-06-22 06:15:47.77158
21	Coromandale king opc Malkapur Tandur Mandal - Telanganna	2023-06-22 06:15:47.784239	2023-06-22 06:15:47.784239
22	Coromandale king opc Chilamkur Kadappa -Andrapradesh	2023-06-22 06:15:47.794791	2023-06-22 06:15:47.794791
23	Vicat Optimate opc Kalburgi - Karanatak	2023-06-22 06:15:47.806621	2023-06-22 06:15:47.806621
24	Sharjah OPC U.A.E	2023-06-22 06:15:47.817926	2023-06-22 06:15:47.817926
25	Bangur opc Sedam Kalburgi - Karanatak	2023-06-22 06:15:47.828446	2023-06-22 06:15:47.828446
26	Wonder opc Shindkhed Dhule - Maharashtra 	2023-06-22 06:15:47.840284	2023-06-22 06:15:47.840284
27	J.K Lakshmi opc Jaykapuram Sirohi - Rajasthan 	2023-06-22 06:15:47.851583	2023-06-22 06:15:47.851583
28	Birla Shakti opc Kesoram Sedam - Karanatak	2023-06-22 06:15:47.864186	2023-06-22 06:15:47.864186
29	Bharthi opc Kamlapuram Kadapa - Andrapradesh	2023-06-22 06:15:47.877629	2023-06-22 06:15:47.877629
30	Bharthi opc Gulbarga - Karanatak	2023-06-22 06:15:47.888449	2023-06-22 06:15:47.888449
38	Vasavdatta opc	2023-06-22 06:15:47.990186	2023-06-22 06:15:47.990186
\.


--
-- Data for Name: concrete_mix_design_rmcs; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.concrete_mix_design_rmcs (id, project_master_id, building_master_id, contractor_master_id, rmc_list_id, acceptance_strength_id, revision, grade_master_id, wb_ratio, cement_content_kg_per_m3, "Binder1_FlyAsh_kg_per_m3", third_binder, water_in_ltrs_per_m3, ca2_20mm_in_kg_per_m3, ca1_10mm_in_kg_per_m3, manufactured_sand_in_kg_per_m3, wash_sand_in_kg_per_m3, cement_id, superplasticizer_id, plasticizer_percent_wt_of_c_plus_f, platicizer_in_kg_per_m3, structure_master_id, date, remark, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: concrete_mix_design_sites; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.concrete_mix_design_sites (id, project_master_id, building_master_id, contractor_master_id, acceptance_strength_id, revision, grade_master_id, wb_ratio, cement_content_kg_per_m3, binder1_flyash_kg_per_m3, third_binder, water_in_ltrs_per_m3, ca2_20mm_in_kg_per_m3, ca1_10mm_in_kg_per_m3, fa2_in_kg_per_m3, manufactured_sand_in_kg_per_m3, cement_id, superplasticizer_id, plasticizer_percent_wt_of_c_plus_f, plasticizer_in_kg_per_m3, remarks, date, latest, plant, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: concretes; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.concretes (id, rmc_site_concrete, structure, grade, created_at, updated_at) FROM stdin;
3	godrej rmc	lift pardi	m70	2023-05-29 09:58:11.922759	2023-06-05 04:37:27.391402
2	godrej rmc	column	m70	2023-05-29 09:55:44.41367	2023-06-05 04:37:35.725528
1	skyway rmc	stater	m70	2023-05-29 09:52:37.503732	2023-06-05 04:37:43.662238
\.


--
-- Data for Name: contractor_masters; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.contractor_masters (id, name, created_at, updated_at) FROM stdin;
1	Raunak Enterprises	2023-06-08 07:49:07.765918	2023-06-08 07:49:07.765918
\.


--
-- Data for Name: day15_acceptances; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.day15_acceptances (id, grade_master_id, strength_at_80p, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: day28_acceptances; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.day28_acceptances (id, grade_master_id, strength_at_100p, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: day3_acceptances; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.day3_acceptances (id, grade_master_id, strength_at_50p, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: day5_acceptances; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.day5_acceptances (id, grade_master_id, strength_at_70p, strength_at_75p, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: day7_acceptances; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.day7_acceptances (id, grade_master_id, strength_at_67p, strength_at_72p, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: grade_masters; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.grade_masters (id, name, created_at, updated_at) FROM stdin;
4	M12.5	2023-06-22 06:45:24.243184	2023-06-22 06:45:24.243184
5	M15	2023-06-22 06:45:34.501436	2023-06-22 06:45:34.501436
6	M20	2023-06-22 06:45:39.647497	2023-06-22 06:45:39.647497
7	M25	2023-06-22 06:45:48.65903	2023-06-22 06:45:48.65903
8	M30	2023-06-22 06:46:08.353228	2023-06-22 06:46:08.353228
9	M35	2023-06-22 06:46:12.662327	2023-06-22 06:46:12.662327
10	M40	2023-06-22 06:46:16.510942	2023-06-22 06:46:16.510942
11	M45	2023-06-22 06:46:20.574252	2023-06-22 06:46:20.574252
12	M50	2023-06-22 06:46:31.037897	2023-06-22 06:46:31.037897
17	M55	2023-07-03 09:19:42.146599	2023-07-03 09:19:42.146599
19	M60	2023-07-04 05:32:50.307519	2023-07-04 05:32:50.307519
20	M70	2023-07-04 10:34:15.657602	2023-07-04 15:00:27.374631
\.


--
-- Data for Name: m_admixtures; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.m_admixtures (id, brand, created_at, updated_at) FROM stdin;
5	Durapozz	2023-06-22 06:33:35.172351	2023-06-22 06:33:35.172351
6	Pozzocrete -83	2023-06-22 06:33:35.18667	2023-06-22 06:33:35.18667
7	Pozzocrete -63	2023-06-22 06:33:35.200149	2023-06-22 06:33:35.200149
8	Pozzocrete -60	2023-06-22 06:33:35.21077	2023-06-22 06:33:35.21077
9	Pozzocrete -40	2023-06-22 06:33:35.223513	2023-06-22 06:33:35.223513
10	H-Tech 25	2023-06-22 06:33:35.235632	2023-06-22 06:33:35.235632
11	Cemguard - Jaycce	2023-06-22 06:33:35.245446	2023-06-22 06:33:35.245446
12	CAP Flyash	2023-06-22 06:33:35.255594	2023-06-22 06:33:35.255594
13	GGBS-JSW	2023-06-22 06:33:35.267457	2023-06-22 06:33:35.267457
14	Superpozz	2023-06-22 06:33:35.278126	2023-06-22 06:33:35.278126
20	H-Tech 25	2023-06-22 06:33:35.341213	2023-06-22 06:33:35.341213
21	Cemguard - Jaycce	2023-06-22 06:33:35.351385	2023-06-22 06:33:35.351385
22	CAP Flyash	2023-06-22 06:33:35.363054	2023-06-22 06:33:35.363054
24	Tata Flyash	2023-06-22 06:33:35.38579	2023-06-22 06:33:35.38579
26	Dirk-60	2023-06-22 06:33:35.411759	2023-06-22 06:33:35.411759
27	Ashtech	2023-06-22 06:33:35.423701	2023-06-22 06:33:35.423701
29	Adani Flyash	2023-06-22 06:33:35.448254	2023-07-04 10:41:10.120571
28	Nano Flyash	2023-06-22 06:33:35.437205	2023-07-04 10:42:37.54906
23	Dhanu Flyash	2023-06-22 06:33:35.373297	2023-07-04 10:43:08.57575
\.


--
-- Data for Name: m_silicas; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.m_silicas (id, brand, created_at, updated_at) FROM stdin;
4	Elkem-Microsilica	2023-06-22 06:35:52.686807	2023-06-22 06:35:52.686807
5	Calipar -Microsilica	2023-06-22 06:35:52.757296	2023-06-22 06:35:52.757296
6	CAC -Microsilica	2023-06-22 06:35:52.777194	2023-06-22 06:35:52.777194
\.


--
-- Data for Name: mix_designs; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.mix_designs (id, created_at, updated_at, recipe_id) FROM stdin;
\.


--
-- Data for Name: mix_strengthand_structures; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.mix_strengthand_structures (id, structure_master_id, acceptance_strength_id, structure_name, number, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: project_masters; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.project_masters (id, name, created_at, updated_at) FROM stdin;
19	Thane Estate 	2023-06-22 06:37:47.2894	2023-06-22 06:37:47.2894
20	Nitin Thane 	2023-06-22 06:38:04.386696	2023-06-22 06:38:04.386696
21	HOH Kalyan	2023-06-22 06:38:15.464101	2023-06-22 06:38:15.464101
22	HOH Kandivali	2023-06-22 06:38:24.989971	2023-06-22 06:38:24.989971
\.


--
-- Data for Name: recipe_ingredients; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.recipe_ingredients (id, recipe_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.recipes (id, created_at, updated_at, cement_id, m_admixture_id, m_silica_id, superplasticizer_id) FROM stdin;
\.


--
-- Data for Name: rmc_lists; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.rmc_lists (id, name, created_at, updated_at) FROM stdin;
3	Procon RMC- Chandivali plant	2023-06-22 06:21:06.790475	2023-06-22 06:21:06.790475
4	Procon RMC- Malad plant	2023-06-22 06:21:06.808934	2023-06-22 06:21:06.808934
5	Ultratech RMC- Kandivali Plant	2023-06-22 06:21:06.823261	2023-06-22 06:21:06.823261
6	Ultratech RMC- Mankoli plant	2023-06-22 06:21:06.837444	2023-06-22 06:21:06.837444
7	Ultratech RMC- Padgha plant	2023-06-22 06:21:06.852561	2023-06-22 06:21:06.852561
8	Ultratech RMC- Rabale plant	2023-06-22 06:21:06.865149	2023-06-22 06:21:06.865149
9	RDC RMC-Mankoli Plant	2023-06-22 06:21:06.87624	2023-06-22 06:21:06.87624
10	RDC RMC-Malad plant	2023-06-22 06:21:06.887588	2023-06-22 06:21:06.887588
11	Prism RMC - Ghatkopar plant	2023-06-22 06:21:06.898024	2023-06-22 06:21:06.898024
12	Prism RMC - Malad West  plant	2023-06-22 06:21:06.909161	2023-06-22 06:21:06.909161
13	Prism RMC - Kolshet plant	2023-06-22 06:21:06.921759	2023-06-22 06:21:06.921759
14	ACC RMC- Sakinaka plant	2023-06-22 06:21:06.933767	2023-06-22 06:21:06.933767
15	ACC RMC- Mankoli plant	2023-06-22 06:21:06.948432	2023-06-22 06:21:06.948432
16	Concretech RMC- Miraroad plant	2023-06-22 06:21:06.960785	2023-06-22 06:21:06.960785
17	Skyway RMC - Kurla plant	2023-06-22 06:21:06.97531	2023-06-22 06:21:06.97531
18	Skyway RMC - Mankoli plant	2023-06-22 06:21:06.98954	2023-06-22 06:21:06.98954
19	Skyway RMC - Owala plant	2023-06-22 06:21:07.00415	2023-06-22 06:21:07.00415
20	Relcon RMC- Chandivali plant	2023-06-22 06:21:07.017538	2023-06-22 06:21:07.017538
21	Nuvoco RMC- Powai plant	2023-06-22 06:21:07.032413	2023-06-22 06:21:07.032413
22	Supreme RMC- Powai Plant	2023-06-22 06:21:07.048443	2023-06-22 06:21:07.048443
23	Indiacrete RMC- Devnar plant	2023-06-22 06:21:07.064608	2023-06-22 06:21:07.064608
24	Indiacrete RMC- Dahisar mori plant	2023-06-22 06:21:07.079454	2023-06-22 06:21:07.079454
25	TNA RMC- Mankoli plant	2023-06-22 06:21:07.094546	2023-06-22 06:21:07.094546
26	TNA RMC- Satav Naka kalyan plant	2023-06-22 06:21:07.112195	2023-06-22 06:21:07.112195
27	Godrej & Boyce RMC- Vikroli Plant	2023-06-22 06:21:07.12768	2023-06-22 06:21:07.12768
28	Godrej & Boyce RMC- H Estate plant	2023-06-22 06:21:07.141995	2023-06-22 06:21:07.141995
29	Godrej & Boyce RMC- Saket plant	2023-06-22 06:21:07.157396	2023-06-22 06:21:07.157396
30	Godrej & Boyce RMC- Mankoli plant	2023-06-22 06:21:07.173777	2023-06-22 06:21:07.173777
31	Swastik RMC- Kurla Plant	2023-06-22 06:21:07.188941	2023-06-22 06:21:07.188941
32	Swastik RMC- Mankoli plant	2023-06-22 06:21:07.203889	2023-06-22 06:21:07.203889
33	Swastik RMC- Turbhe plant	2023-06-22 06:21:07.22427	2023-06-22 06:21:07.22427
34	Y M Landmark RMC - Powai plant	2023-06-22 06:21:07.240119	2023-06-22 06:21:07.240119
35	Creative RMC - Saket plant	2023-06-22 06:21:07.252397	2023-06-22 06:21:07.252397
36	Hella RMC- Kalher plant	2023-06-22 06:21:07.265581	2023-06-22 06:21:07.265581
37	Pinnacle RMC - Kalher plant	2023-06-22 06:21:07.278973	2023-07-04 10:45:59.488701
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.schema_migrations (version) FROM stdin;
20230519052652
20230519074141
20230519074158
20230519074559
20230519074653
20230519074724
20230519074742
20230519074851
20230519075125
20230519075141
20230519075207
20230519075226
20230523072053
20230524095024
20230524095220
20230524124651
20230524130429
20230524132911
20230525045736
20230525051142
20230525052225
20230525062946
20230525070706
20230526071729
20230526102418
20230526105605
20230526105826
20230526110107
20230526110725
20230526111137
20230526112116
20230526113714
20230529051322
20230529054422
20230529055057
20230529055845
20230529060421
20230529061715
20230529062313
20230529062633
20230529090111
20230529092236
20230529111318
20230529111846
20230530044523
20230530045326
20230530045619
20230530050106
20230530050301
20230530050452
20230530050706
20230530051046
20230530051431
20230530052132
20230530052825
20230530053207
20230602062105
20230602062118
20230602064014
20230605061240
20230607044705
20230607045233
20230607045351
20230607045448
20230607045534
20230607050340
20230607051206
20230607051813
20230607054257
20230607054608
20230607054656
20230607063926
20230607071005
20230607071512
20230607072809
20230607075958
20230607094404
20230607094721
20230607094945
20230607100559
20230608072726
20230612060706
20230614173609
20230615122342
20230616043612
20230616050036
20230616040001
20230616043826
20230616111259
20230617065415
20230630034817
20230704100508
20230704101416
20230704101834
20230703103057
20230705065446
20230705065917
20230705081550
20230705082343
20230706054622
20230706055256
20230706073700
20230706074032
20230706081047
20230706082406
20230704114400
20230704115118
20230711055216
20230711074428
20230711074604
\.


--
-- Data for Name: strength_acceptances; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.strength_acceptances (id, grade, day, percentage, value, created_at, updated_at) FROM stdin;
452	M12.5	7 days	67	88	2023-07-07 09:46:05.546571	2023-07-07 09:46:05.546571
453	M12.5	28 days	100	131	2023-07-07 09:46:05.565464	2023-07-07 09:46:05.565464
454	M15	3 days	50	79	2023-07-07 09:46:05.579278	2023-07-07 09:46:05.579278
455	M15	5 days A	70	111	2023-07-07 09:46:05.595897	2023-07-07 09:46:05.595897
456	M15	5 days B	75	119	2023-07-07 09:46:05.610178	2023-07-07 09:46:05.610178
457	M15	7 days A	67	106	2023-07-07 09:46:05.622701	2023-07-07 09:46:05.622701
458	M15	7 days B	72	114	2023-07-07 09:46:05.64326	2023-07-07 09:46:05.64326
459	M15	15 days	80	126	2023-07-07 09:46:05.660074	2023-07-07 09:46:05.660074
460	M15	28 days	100	158	2023-07-07 09:46:05.67753	2023-07-07 09:46:05.67753
461	M20	3 days	50	105	2023-07-07 09:46:05.692274	2023-07-07 09:46:05.692274
462	M20	5 days A	70	147	2023-07-07 09:46:05.706202	2023-07-07 09:46:05.706202
463	M20	5 days B	75	158	2023-07-07 09:46:05.718466	2023-07-07 09:46:05.718466
464	M20	7 days A	67	141	2023-07-07 09:46:05.731417	2023-07-07 09:46:05.731417
465	M20	7 days B	72	151	2023-07-07 09:46:05.743563	2023-07-07 09:46:05.743563
466	M20	15 days	80	168	2023-07-07 09:46:05.757904	2023-07-07 09:46:05.757904
467	M20	28 days	100	210	2023-07-07 09:46:05.769408	2023-07-07 09:46:05.769408
468	M25	3 days	50	132	2023-07-07 09:46:05.781981	2023-07-07 09:46:05.781981
469	M25	5 days A	70	184	2023-07-07 09:46:05.793008	2023-07-07 09:46:05.793008
470	M25	5 days B	75	197	2023-07-07 09:46:05.805652	2023-07-07 09:46:05.805652
471	M25	7 days A	67	176	2023-07-07 09:46:05.820843	2023-07-07 09:46:05.820843
472	M25	7 days B	72	189	2023-07-07 09:46:05.833375	2023-07-07 09:46:05.833375
473	M25	15 days	80	210	2023-07-07 09:46:05.846847	2023-07-07 09:46:05.846847
474	M25	28 days	100	263	2023-07-07 09:46:05.862509	2023-07-07 09:46:05.862509
475	M30	3 days	50	158	2023-07-07 09:46:05.875174	2023-07-07 09:46:05.875174
476	M30	5 days A	70	221	2023-07-07 09:46:05.886923	2023-07-07 09:46:05.886923
477	M30	5 days B	75	236	2023-07-07 09:46:05.898827	2023-07-07 09:46:05.898827
478	M30	7 days A	67	211	2023-07-07 09:46:05.912214	2023-07-07 09:46:05.912214
479	M30	7 days B	72	227	2023-07-07 09:46:05.924827	2023-07-07 09:46:05.924827
480	M30	15 days	80	252	2023-07-07 09:46:05.936433	2023-07-07 09:46:05.936433
481	M30	28 days	100	315	2023-07-07 09:46:05.94936	2023-07-07 09:46:05.94936
482	M35	3 days	50	184	2023-07-07 09:46:05.961089	2023-07-07 09:46:05.961089
483	M35	5 days A	70	258	2023-07-07 09:46:05.97295	2023-07-07 09:46:05.97295
484	M35	5 days B	75	276	2023-07-07 09:46:05.98635	2023-07-07 09:46:05.98635
485	M35	7 days A	67	247	2023-07-07 09:46:06.000327	2023-07-07 09:46:06.000327
486	M35	7 days B	72	265	2023-07-07 09:46:06.016628	2023-07-07 09:46:06.016628
487	M35	15 days	80	294	2023-07-07 09:46:06.032668	2023-07-07 09:46:06.032668
488	M35	28 days	100	368	2023-07-07 09:46:06.04731	2023-07-07 09:46:06.04731
489	M40	3 days	50	211	2023-07-07 09:46:06.05991	2023-07-07 09:46:06.05991
490	M40	5 days A	70	295	2023-07-07 09:46:06.071081	2023-07-07 09:46:06.071081
491	M40	5 days B	75	316	2023-07-07 09:46:06.085925	2023-07-07 09:46:06.085925
492	M40	7 days A	67	282	2023-07-07 09:46:06.100632	2023-07-07 09:46:06.100632
493	M40	7 days B	72	303	2023-07-07 09:46:06.115394	2023-07-07 09:46:06.115394
494	M40	15 days	80	337	2023-07-07 09:46:06.12752	2023-07-07 09:46:06.12752
495	M40	28 days	100	421	2023-07-07 09:46:06.140215	2023-07-07 09:46:06.140215
496	M45	3 days	50	237	2023-07-07 09:46:06.152709	2023-07-07 09:46:06.152709
497	M45	5 days A	70	331	2023-07-07 09:46:06.165597	2023-07-07 09:46:06.165597
498	M45	5 days B	75	355	2023-07-07 09:46:06.178504	2023-07-07 09:46:06.178504
499	M45	7 days A	67	317	2023-07-07 09:46:06.201324	2023-07-07 09:46:06.201324
500	M45	7 days B	72	341	2023-07-07 09:46:06.215277	2023-07-07 09:46:06.215277
501	M45	15 days	80	378	2023-07-07 09:46:06.23197	2023-07-07 09:46:06.23197
502	M45	28 days	100	473	2023-07-07 09:46:06.245323	2023-07-07 09:46:06.245323
503	M50	3 days	50	263	2023-07-07 09:46:06.259382	2023-07-07 09:46:06.259382
504	M50	5 days A	70	368	2023-07-07 09:46:06.273677	2023-07-07 09:46:06.273677
505	M50	5 days B	75	394	2023-07-07 09:46:06.28563	2023-07-07 09:46:06.28563
506	M50	7 days A	67	352	2023-07-07 09:46:06.300639	2023-07-07 09:46:06.300639
507	M50	7 days B	72	378	2023-07-07 09:46:06.314739	2023-07-07 09:46:06.314739
508	M50	15 days	80	421	2023-07-07 09:46:06.328194	2023-07-07 09:46:06.328194
509	M50	28 days	100	525	2023-07-07 09:46:06.339663	2023-07-07 09:46:06.339663
510	M55	3 days	50	289	2023-07-07 09:46:06.35248	2023-07-07 09:46:06.35248
511	M55	5 days A	70	405	2023-07-07 09:46:06.367587	2023-07-07 09:46:06.367587
512	M55	5 days B	75	434	2023-07-07 09:46:06.383083	2023-07-07 09:46:06.383083
513	M55	7 days A	67	387	2023-07-07 09:46:06.396277	2023-07-07 09:46:06.396277
514	M55	7 days B	72	416	2023-07-07 09:46:06.410857	2023-07-07 09:46:06.410857
515	M55	15 days	80	462	2023-07-07 09:46:06.425967	2023-07-07 09:46:06.425967
516	M55	28 days	100	578	2023-07-07 09:46:06.439251	2023-07-07 09:46:06.439251
517	M60	3 days	50	315	2023-07-07 09:46:06.452254	2023-07-07 09:46:06.452254
518	M60	5 days A	70	441	2023-07-07 09:46:06.467116	2023-07-07 09:46:06.467116
519	M60	5 days B	75	473	2023-07-07 09:46:06.48165	2023-07-07 09:46:06.48165
520	M60	7 days A	67	422	2023-07-07 09:46:06.495096	2023-07-07 09:46:06.495096
521	M60	7 days B	72	454	2023-07-07 09:46:06.510106	2023-07-07 09:46:06.510106
522	M60	15 days	80	504	2023-07-07 09:46:06.524393	2023-07-07 09:46:06.524393
523	M60	28 days	100	630	2023-07-07 09:46:06.535989	2023-07-07 09:46:06.535989
524	M70	3 days	50	368	2023-07-07 09:46:06.550007	2023-07-07 09:46:06.550007
525	M70	5 days A	70	515	2023-07-07 09:46:06.565088	2023-07-07 09:46:06.565088
526	M70	5 days B	75	551	2023-07-07 09:46:06.579386	2023-07-07 09:46:06.579386
527	M70	7 days A	67	492	2023-07-07 09:46:06.593844	2023-07-07 09:46:06.593844
528	M70	7 days B	72	529	2023-07-07 09:46:06.609459	2023-07-07 09:46:06.609459
529	M70	15 days	80	588	2023-07-07 09:46:06.621967	2023-07-07 09:46:06.621967
530	M70	28 days	100	735	2023-07-07 09:46:06.634633	2023-07-07 09:46:06.634633
531	M12.5	2 days	0	100	2023-07-07 09:46:06.647968	2023-07-07 09:46:06.647968
532	M15	2 days	0	100	2023-07-07 09:46:06.660913	2023-07-07 09:46:06.660913
533	M20	2 days	0	100	2023-07-07 09:46:06.672831	2023-07-07 09:46:06.672831
534	M25	2 days	0	100	2023-07-07 09:46:06.685068	2023-07-07 09:46:06.685068
535	M30	2 days	0	100	2023-07-07 09:46:06.700006	2023-07-07 09:46:06.700006
536	M35	2 days	0	100	2023-07-07 09:46:06.71323	2023-07-07 09:46:06.71323
537	M40	2 days	0	100	2023-07-07 09:46:06.725532	2023-07-07 09:46:06.725532
538	M45	2 days	0	100	2023-07-07 09:46:06.738859	2023-07-07 09:46:06.738859
539	M50	2 days	0	100	2023-07-07 09:46:06.752501	2023-07-07 09:46:06.752501
540	M55	2 days	0	100	2023-07-07 09:46:06.765341	2023-07-07 09:46:06.765341
541	M60	2 days	0	100	2023-07-07 09:46:06.778148	2023-07-07 09:46:06.778148
542	M65	2 days	0	100	2023-07-07 09:46:06.7898	2023-07-07 09:46:06.7898
543	M70	2 days	0	100	2023-07-07 09:46:06.802318	2023-07-07 09:46:06.802318
544	M15	10 days	\N	119	2023-07-07 09:46:06.815944	2023-07-07 09:46:06.815944
545	M20	10 days	\N	158	2023-07-07 09:46:06.828313	2023-07-07 09:46:06.828313
546	M25	10 days	\N	197	2023-07-07 09:46:06.841144	2023-07-07 09:46:06.841144
547	M30	10 days	\N	236	2023-07-07 09:46:06.852248	2023-07-07 09:46:06.852248
548	M35	10 days	\N	276	2023-07-07 09:46:06.865269	2023-07-07 09:46:06.865269
549	M40	10 days	\N	316	2023-07-07 09:46:06.878059	2023-07-07 09:46:06.878059
550	M45	10 days	\N	355	2023-07-07 09:46:06.888184	2023-07-07 09:46:06.888184
551	M50	10 days	\N	394	2023-07-07 09:46:06.900022	2023-07-07 09:46:06.900022
552	M55	10 days	\N	434	2023-07-07 09:46:06.915131	2023-07-07 09:46:06.915131
553	M60	10 days	\N	473	2023-07-07 09:46:06.927275	2023-07-07 09:46:06.927275
554	M70	10 days	\N	551	2023-07-07 09:46:06.939021	2023-07-07 09:46:06.939021
555	M15	14 days	\N	126	2023-07-07 09:46:06.952806	2023-07-07 09:46:06.952806
556	M20	14 days	\N	168	2023-07-07 09:46:06.965616	2023-07-07 09:46:06.965616
557	M25	14 days	\N	210	2023-07-07 09:46:06.978006	2023-07-07 09:46:06.978006
558	M30	14 days	\N	252	2023-07-07 09:46:06.989106	2023-07-07 09:46:06.989106
559	M35	14 days	\N	294	2023-07-07 09:46:07.004799	2023-07-07 09:46:07.004799
560	M40	14 days	\N	337	2023-07-07 09:46:07.02195	2023-07-07 09:46:07.02195
561	M45	14 days	\N	378	2023-07-07 09:46:07.040859	2023-07-07 09:46:07.040859
562	M50	14 days	\N	421	2023-07-07 09:46:07.054257	2023-07-07 09:46:07.054257
563	M55	14 days	\N	462	2023-07-07 09:46:07.069563	2023-07-07 09:46:07.069563
564	M60	14 days	\N	504	2023-07-07 09:46:07.163155	2023-07-07 09:46:07.163155
565	M70	14 days	\N	588	2023-07-07 09:46:07.17777	2023-07-07 09:46:07.17777
\.


--
-- Data for Name: strength_testings; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.strength_testings (id, density, remark, created_at, updated_at, project_master_id, building_master_id, structure_master_id, grade_master_id, cement_id, s_plasticizer_id, m_admixture_id, m_silica_id, date, w_b_ratio, cement_c_c_kg_m3, s_plasticizer_dosage, m_admixture_dosage, m_silica_dosage, rmc_list_id, is_gray, is_red, is_green, user_id) FROM stdin;
7	\N		2023-06-14 12:01:01.972657	2023-07-06 09:22:08.690866	20	18	1	20	28	44	27	5	2022-06-29	\N	\N	\N	\N	\N	37	t	f	f	\N
26	\N		2023-07-07 11:06:08.674778	2023-07-07 11:06:12.848198	19	18	21	4	6	6	5	4	\N	\N	\N	\N	\N	\N	3	t	t	f	\N
12	\N		2023-07-06 05:57:09.928624	2023-07-06 09:33:58.709752	19	18	21	20	6	6	5	4	2023-07-25	\N	\N	\N	\N	\N	3	f	t	f	\N
14	\N		2023-07-06 06:52:15.739127	2023-07-08 02:44:12.90867	19	18	21	20	6	6	5	4	2023-08-28	\N	\N	\N	\N	\N	3	f	t	f	\N
27	\N	pass	2023-07-10 06:46:46.994679	2023-07-10 06:51:50.339314	19	18	21	4	6	6	5	4	1111-11-11	\N	\N	\N	\N	111	3	f	f	f	\N
25	\N	pass	2023-07-07 09:12:20.311679	2023-07-10 07:01:30.130415	19	18	21	4	6	6	5	4	\N	\N	\N	\N	\N	111	3	f	f	f	\N
13	\N		2023-07-06 06:31:24.063199	2023-07-06 09:44:43.386275	19	18	21	20	6	6	5	4	2023-08-31	\N	\N	\N	\N	\N	3	t	t	f	\N
8	\N	\N	2023-06-27 07:06:45.712981	2023-07-06 07:43:57.569637	20	23	19	20	30	47	26	5	2023-06-20	\N	\N	\N	\N	\N	35	t	t	f	\N
15	\N		2023-07-06 07:21:41.369939	2023-07-06 09:45:19.542207	19	18	21	20	6	6	5	4	2023-08-30	\N	\N	\N	\N	\N	3	t	t	f	\N
24	\N	pass	2023-07-07 09:01:59.258776	2023-07-10 08:25:10.189024	19	18	21	4	6	6	5	4	\N	\N	\N	\N	\N	420	3	t	f	f	\N
1	2577	pass	2023-05-29 12:54:01.299645	2023-07-06 08:27:04.517871	22	25	1	20	38	47	29	6	2023-06-06	0.25	490	1.2	130	60	37	f	f	t	\N
2	2522	pass	2023-05-29 13:12:27.429665	2023-07-06 08:27:04.541604	22	16	1	20	29	47	28	6	2023-06-07	\N	\N	\N	\N	\N	37	f	f	t	\N
5	\N		2023-06-12 12:13:32.651463	2023-07-06 08:27:04.57427	20	25	1	19	6	12	28	6	2023-06-01	\N	\N	\N	\N	\N	9	f	f	t	\N
28	\N		2023-07-13 05:40:35.161749	2023-07-13 05:40:35.161749	19	18	21	4	6	6	5	4	\N	\N	\N	\N	\N	\N	3	f	f	f	1
11	\N	\N	2023-07-03 08:08:09.293029	2023-07-06 08:27:04.673378	19	16	1	19	6	6	5	4	2023-06-08	\N	\N	\N	\N	\N	5	t	t	t	\N
10	\N	\N	2023-06-30 10:08:03.637522	2023-07-06 08:27:04.693459	21	16	1	17	30	47	28	5	2023-07-01	\N	\N	\N	\N	\N	33	t	t	t	\N
\.


--
-- Data for Name: structure_masters; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.structure_masters (id, name, created_at, updated_at, acceptance_strength_id) FROM stdin;
21	Mivan Slab	2023-07-04 10:58:14.866342	2023-07-05 08:44:26.625924	3
20	Laseer Screeds	2023-06-22 07:06:10.174631	2023-07-05 08:44:45.245556	4
19	Concrete Roads	2023-06-22 07:05:38.51268	2023-07-05 08:44:59.161349	4
18	UTWT	2023-06-22 07:05:23.067802	2023-07-05 08:45:13.571197	4
17	VDF (without dewatering)	2023-06-22 07:05:04.703089	2023-07-05 08:45:24.524691	4
15	Shear walls	2023-06-22 07:04:05.990568	2023-07-05 08:47:03.32878	2
14	Flat Slab	2023-06-22 07:03:52.680798	2023-07-05 08:47:18.640126	3
13	Staircase	2023-06-22 07:03:22.718325	2023-07-05 08:47:43.195601	2
12	Beam	2023-06-22 07:02:53.868183	2023-07-05 08:47:55.128355	2
11	Ordinary Slab	2023-06-22 07:02:26.515746	2023-07-05 08:48:07.352938	2
10	Plint Beam	2023-06-22 07:01:58.429504	2023-07-05 08:48:25.982763	5
9	Retaining Wall	2023-06-22 07:01:31.846415	2023-07-05 08:49:06.1594	4
8	Pile Cap	2023-06-22 07:00:54.827843	2023-07-05 08:49:17.110413	4
7	Pile	2023-06-22 07:00:42.854864	2023-07-05 08:49:32.814526	4
6	Raft Beam	2023-06-22 07:00:31.440635	2023-07-05 08:50:02.458262	4
5	Raft Slab	2023-06-22 07:00:17.866301	2023-07-05 08:51:24.793378	4
4	Footing	2023-06-22 06:59:55.116629	2023-07-05 08:51:47.239466	4
2	Column	2023-06-02 11:51:28.322726	2023-07-05 08:52:09.334714	2
1	Starter	2023-06-02 11:51:18.65548	2023-07-05 08:52:28.181175	2
\.


--
-- Data for Name: structure_types; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.structure_types (id, title, company, city, created_at, updated_at, mix_design_id) FROM stdin;
\.


--
-- Data for Name: superplasticizer_brands; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.superplasticizer_brands (id, title, company, city, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: superplasticizer_types; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.superplasticizer_types (id, title, type, company, city, created_at, updated_at, superplasticizer_brand_id) FROM stdin;
\.


--
-- Data for Name: superplasticizers; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.superplasticizers (id, brand, created_at, updated_at, base_of_plasticizer, plasticizer_in_kg_per_m3) FROM stdin;
6	TP Buildtech 1F2	2023-06-22 06:24:53.794215	2023-06-22 06:24:53.794215	-	0
7	TP Buildtech 350 HN	2023-06-22 06:24:53.810372	2023-06-22 06:24:53.810372	-	0
8	Chyrso Delta -G933	2023-06-22 06:24:53.824848	2023-06-22 06:24:53.824848	-	0
9	Chyrso Fluid Optima- K9316	2023-06-22 06:24:53.839322	2023-06-22 06:24:53.839322	-	0
10	Chyrso Fluid Optima- K9320	2023-06-22 06:24:53.854804	2023-06-22 06:24:53.854804	-	0
11	Fosroc-Aura Mix 400	2023-06-22 06:24:53.869625	2023-06-22 06:24:53.869625	-	0
12	Fosroc-Aura Mix 300	2023-06-22 06:24:53.883841	2023-06-22 06:24:53.883841	-	0
13	Sika- 401 X	2023-06-22 06:24:53.897199	2023-06-22 06:24:53.897199	-	0
14	Sika- 701 X	2023-06-22 06:24:53.910835	2023-06-22 06:24:53.910835	-	0
15	TP Buildtech 530	2023-06-22 06:24:53.922141	2023-06-22 06:24:53.922141	-	0
16	Sika- 772 X	2023-06-22 06:24:53.933117	2023-06-22 06:24:53.933117	-	0
17	Fosroc Aura Mix 200	2023-06-22 06:24:53.946508	2023-06-22 06:24:53.946508	-	0
19	CAC -H5	2023-06-22 06:24:53.969452	2023-06-22 06:24:53.969452	-	0
20	Asian 300	2023-06-22 06:24:53.98212	2023-06-22 06:24:53.98212	-	0
21	CAC -R250	2023-06-22 06:24:53.993825	2023-06-22 06:24:53.993825	-	0
22	Chryso Delta -8310K	2023-06-22 06:24:54.006054	2023-06-22 06:24:54.006054	-	0
23	Chryso Optima -S 842	2023-06-22 06:24:54.018775	2023-06-22 06:24:54.018775	-	0
24	ACC Admix	2023-06-22 06:24:54.030921	2023-06-22 06:24:54.030921	-	0
25	MARS	2023-06-22 06:24:54.042863	2023-06-22 06:24:54.042863	-	0
26	Mapei	2023-06-22 06:24:54.054983	2023-06-22 06:24:54.054983	-	0
27	Chryso Optima K930 	2023-06-22 06:24:54.067403	2023-06-22 06:24:54.067403	-	0
28	CAC- Hyperfluid Plus G	2023-06-22 06:24:54.080772	2023-06-22 06:24:54.080772	-	0
29	Chemoxo -9055	2023-06-22 06:24:54.092095	2023-06-22 06:24:54.092095	-	0
30	BASF-1125 UT	2023-06-22 06:24:54.102263	2023-06-22 06:24:54.102263	-	0
31	Chemoxo - E72	2023-06-22 06:24:54.115109	2023-06-22 06:24:54.115109	-	0
32	Chemoxo - 9011	2023-06-22 06:24:54.126309	2023-06-22 06:24:54.126309	-	0
33	CAC-R100	2023-06-22 06:24:54.140293	2023-06-22 06:24:54.140293	-	0
34	CAC-H6	2023-06-22 06:24:54.150303	2023-06-22 06:24:54.150303	-	0
35	CAC- H2	2023-06-22 06:24:54.164061	2023-06-22 06:24:54.164061	-	0
36	HRWRA	2023-06-22 06:24:54.17733	2023-06-22 06:24:54.17733	-	0
37	CAC-Superflow- 65	2023-06-22 06:24:54.188913	2023-06-22 06:24:54.188913	-	0
38	TP Buildtech- 30S	2023-06-22 06:24:54.199382	2023-06-22 06:24:54.199382	-	0
39	TP Buildtech- 45S	2023-06-22 06:24:54.212803	2023-06-22 06:24:54.212803	-	0
40	TP Buildtech- 60S	2023-06-22 06:24:54.224606	2023-06-22 06:24:54.224606	-	0
41	BASF-8396	2023-06-22 06:24:54.236307	2023-06-22 06:24:54.236307	-	0
42	Yashka	2023-06-22 06:24:54.248445	2023-06-22 06:24:54.248445	-	0
43	Aakarsh	2023-06-22 06:24:54.260424	2023-06-22 06:24:54.260424	-	0
44	TP Buildtech- 360	2023-06-22 06:24:54.274273	2023-06-22 06:24:54.274273	-	0
45	TP Buildtech- 410	2023-06-22 06:24:54.289132	2023-06-22 06:24:54.289132	-	0
46	TP Buildtech- 5G3	2023-06-22 06:24:54.302074	2023-06-22 06:24:54.302074	-	0
47	Fosroc Aura Mix 500	2023-06-22 06:24:54.317748	2023-06-22 06:24:54.317748	-	0
\.


--
-- Data for Name: testing_day_masters; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.testing_day_masters (id, day, title, sequence, created_at, updated_at) FROM stdin;
1	2 days	2 days	0	2023-07-12 17:45:25.246357	2023-07-12 17:45:25.246357
2	3 days	3 days	1	2023-07-12 17:45:25.250407	2023-07-12 17:45:25.250407
3	5 days	5 days	2	2023-07-12 17:45:25.254179	2023-07-12 17:45:25.254179
4	7 days	7 days	3	2023-07-12 17:45:25.257165	2023-07-12 17:45:25.257165
5	10 days	10 days	4	2023-07-12 17:45:25.259778	2023-07-12 17:45:25.259778
6	14 days	14 days	5	2023-07-12 17:45:25.262554	2023-07-12 17:45:25.262554
7	15 days	15 days	6	2023-07-12 17:45:25.266648	2023-07-12 17:45:25.266648
8	28 days	28 days	7	2023-07-12 17:45:25.269254	2023-07-12 17:45:25.269254
9	35 days	35 days	8	2023-07-12 17:45:25.272494	2023-07-12 17:45:25.272494
10	45 days	45 days	9	2023-07-12 17:45:25.274813	2023-07-12 17:45:25.274813
11	56 days	56 days	10	2023-07-12 17:45:25.277243	2023-07-12 17:45:25.277243
12	90 days	90 days	11	2023-07-12 17:45:25.279852	2023-07-12 17:45:25.279852
13	120 days	120 days	12	2023-07-12 17:45:25.28336	2023-07-12 17:45:25.28336
\.


--
-- Data for Name: testing_duration_masters; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.testing_duration_masters (id, name, contact_number, location, duration, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: testing_results; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.testing_results (id, slot_type, result_value, attempts, pass_status, created_at, updated_at, strength_testing_id) FROM stdin;
7	28 days	745	1	pass	2023-05-29 13:01:50.055254	2023-05-29 13:01:50.055254	1
14	56 days	729	1	pass	2023-05-29 13:06:04.426623	2023-05-29 13:06:04.426623	1
17	3 days	448	1	pass	2023-05-29 13:13:46.0032	2023-05-29 13:13:46.0032	2
18	3 days	437	2	pass	2023-05-29 13:14:15.295022	2023-05-29 13:14:15.295022	2
19	3 days	429	3	pass	2023-05-29 13:14:44.342974	2023-05-29 13:14:44.342974	2
11	35 days	730	1	pass	2023-05-29 13:04:36.817951	2023-06-27 05:40:43.460325	1
626	5 days	0	0	\N	2023-07-07 09:01:59.332784	2023-07-07 09:01:59.332784	24
627	5 days	0	1	\N	2023-07-07 09:01:59.337324	2023-07-07 09:01:59.337324	24
628	5 days	0	2	\N	2023-07-07 09:01:59.34124	2023-07-07 09:01:59.34124	24
629	5 days	0	3	\N	2023-07-07 09:01:59.345294	2023-07-07 09:01:59.345294	24
630	7 days	0	0	\N	2023-07-07 09:01:59.35197	2023-07-07 09:01:59.35197	24
631	7 days	0	1	\N	2023-07-07 09:01:59.356163	2023-07-07 09:01:59.356163	24
632	7 days	0	2	\N	2023-07-07 09:01:59.360043	2023-07-07 09:01:59.360043	24
633	7 days	0	3	\N	2023-07-07 09:01:59.365246	2023-07-07 09:01:59.365246	24
634	10 days	0	0	\N	2023-07-07 09:01:59.369522	2023-07-07 09:01:59.369522	24
635	10 days	0	1	\N	2023-07-07 09:01:59.373668	2023-07-07 09:01:59.373668	24
619	2 days	1	1	\N	2023-07-07 09:01:59.302254	2023-07-10 08:25:03.84816	24
622	3 days	1	0	\N	2023-07-07 09:01:59.314816	2023-07-10 08:26:27.097812	24
623	3 days	2	1	\N	2023-07-07 09:01:59.320144	2023-07-10 08:26:27.161241	24
63	3 days	300	1	\N	2023-06-14 12:01:02.001287	2023-06-14 12:01:02.001287	7
64	3 days	310	2	\N	2023-06-14 12:01:02.007367	2023-06-14 12:01:02.007367	7
65	3 days	320	3	\N	2023-06-14 12:01:02.014397	2023-06-14 12:01:02.014397	7
69	15 days	420	3	\N	2023-06-14 12:01:02.035489	2023-06-14 12:01:02.035489	7
15	56 days	1200	2	pass	2023-05-29 13:06:28.169741	2023-07-01 12:18:45.348553	1
68	15 days	587	2	\N	2023-06-14 12:01:02.030495	2023-07-05 02:14:57.987495	7
624	3 days	3	2	\N	2023-07-07 09:01:59.324033	2023-07-10 08:26:27.168217	24
70	28 days	800	0	\N	2023-06-14 12:01:02.040399	2023-07-06 09:22:04.068685	7
67	15 days	588	1	\N	2023-06-14 12:01:02.024733	2023-07-05 02:21:57.99956	7
76	35 Days	655	2	\N	2023-06-14 12:01:02.072815	2023-06-14 12:01:02.072815	7
77	35 Days	660	3	\N	2023-06-14 12:01:02.078091	2023-06-14 12:01:02.078091	7
10	28 days	699	0	pass	2023-05-29 13:02:55.34131	2023-06-30 02:47:50.982711	1
12	35 days	730	2	pass	2023-05-29 13:05:07.05285	2023-06-27 05:40:43.472848	1
13	35 days	730	3	pass	2023-05-29 13:05:38.132321	2023-06-27 05:40:43.47725	1
53	3 days	400	1	\N	2023-06-12 12:15:11.550985	2023-06-17 04:03:43.077686	5
71	28 days	900	1	\N	2023-06-14 12:01:02.045452	2023-07-06 09:22:04.074782	7
72	28 days	900	2	\N	2023-06-14 12:01:02.05052	2023-07-06 09:22:04.080738	7
80	56 Days	777	2	\N	2023-06-14 12:01:02.093962	2023-06-14 12:01:02.093962	7
81	56 Days	765	3	\N	2023-06-14 12:01:02.09901	2023-06-14 12:01:02.09901	7
62	3 days	300	0	\N	2023-06-14 12:01:01.989422	2023-06-14 12:01:43.834092	7
66	15 days	399	0	\N	2023-06-14 12:01:02.020114	2023-06-14 12:01:43.841335	7
54	3 days	455	2	\N	2023-06-12 12:17:19.196296	2023-06-17 04:03:43.085347	5
74	35 Days	600	0	\N	2023-06-14 12:01:02.060926	2023-06-14 12:01:43.862527	7
78	56 Days	789	0	\N	2023-06-14 12:01:02.083981	2023-06-14 12:01:43.885708	7
55	3 days	499	3	\N	2023-06-12 12:17:43.343555	2023-06-17 04:03:43.093547	5
26	28 days	799	0	pass	2023-05-29 13:18:56.314659	2023-06-30 02:51:35.35723	2
1	3 days	437	1	pass	2023-05-29 12:56:15.874538	2023-06-17 04:36:02.998985	1
75	35 Days	600	1	\N	2023-06-14 12:01:02.06716	2023-06-27 12:42:30.222669	7
8	28 days	700	2	pass	2023-05-29 13:02:10.535906	2023-06-17 03:11:42.717171	1
73	28 days	900	3	\N	2023-06-14 12:01:02.055808	2023-07-06 09:22:04.088288	7
23	28 days	400	1	pass	2023-05-29 13:16:57.934974	2023-06-17 02:37:23.837397	2
24	28 days	400	2	pass	2023-05-29 13:17:28.03348	2023-06-17 02:37:23.843716	2
25	28 days	333	3	pass	2023-05-29 13:17:57.705829	2023-06-17 02:37:23.848847	2
9	28 days	744	3	pass	2023-05-29 13:02:35.04614	2023-06-17 03:11:42.722286	1
20	15 days	888	1	pass	2023-05-29 13:15:29.816881	2023-06-17 04:47:56.097709	2
56	15 days	741	1	\N	2023-06-12 12:18:18.387677	2023-06-17 03:47:56.029723	5
61	28 days	400	3	\N	2023-06-12 12:20:47.132143	2023-06-17 03:16:23.059567	5
59	28 days	401	1	\N	2023-06-12 12:19:55.249422	2023-06-17 03:16:23.064297	5
60	28 days	500	2	\N	2023-06-12 12:20:23.547041	2023-06-17 03:16:23.068727	5
101	56 Days	800	0	\N	2023-06-27 07:06:45.824183	2023-06-30 02:22:45.287446	8
57	15 days	619	2	\N	2023-06-12 12:18:58.117087	2023-06-17 03:45:18.771614	5
58	15 days	599	3	\N	2023-06-12 12:19:28.813694	2023-06-17 03:45:18.775916	5
102	56 Days	800	1	\N	2023-06-27 07:06:45.829001	2023-06-30 02:23:17.596843	8
4	15 days	702	1	pass	2023-05-29 12:59:30.055848	2023-06-17 04:10:56.8144	1
5	15 days	702	2	pass	2023-05-29 13:00:54.108633	2023-06-17 04:10:56.818713	1
21	15 days	888	2	pass	2023-05-29 13:15:55.593266	2023-06-17 04:47:56.104616	2
22	15 days	888	3	pass	2023-05-29 13:16:25.469529	2023-06-17 04:47:56.108892	2
103	56 Days	899	2	\N	2023-06-27 07:06:45.834456	2023-06-30 02:23:31.574859	8
85	3 days	0	0	\N	2023-06-27 07:06:45.737739	2023-06-27 07:06:45.737739	8
86	3 days	0	1	\N	2023-06-27 07:06:45.747213	2023-06-27 07:06:45.747213	8
87	3 days	0	2	\N	2023-06-27 07:06:45.751916	2023-06-27 07:06:45.751916	8
88	3 days	0	3	\N	2023-06-27 07:06:45.757117	2023-06-27 07:06:45.757117	8
6	15 days	702	3	pass	2023-05-29 13:01:18.607497	2023-06-17 04:10:56.822157	1
27	35 days	740	1	pass	2023-05-29 13:19:27.599937	2023-06-26 05:41:31.995549	2
28	35 days	738	2	pass	2023-05-29 13:19:49.641113	2023-06-26 05:41:32.000799	2
2	3 days	426	2	pass	2023-05-29 12:56:45.954787	2023-06-30 02:43:37.666432	1
82	35 days	600	1	\N	2023-06-26 11:52:01.840157	2023-06-26 11:52:01.840157	5
83	35 days	600	2	\N	2023-06-26 11:52:53.176595	2023-06-26 11:52:53.176595	5
84	35 days	600	3	\N	2023-06-26 11:53:28.451835	2023-06-26 11:53:28.451835	5
89	15 days	0	0	\N	2023-06-27 07:06:45.761865	2023-06-27 07:06:45.761865	8
90	15 days	0	1	\N	2023-06-27 07:06:45.766721	2023-06-27 07:06:45.766721	8
91	15 days	0	2	\N	2023-06-27 07:06:45.77257	2023-06-27 07:06:45.77257	8
92	15 days	0	3	\N	2023-06-27 07:06:45.777887	2023-06-27 07:06:45.777887	8
93	28 days	0	0	\N	2023-06-27 07:06:45.782283	2023-06-27 07:06:45.782283	8
94	28 days	0	1	\N	2023-06-27 07:06:45.78847	2023-06-27 07:06:45.78847	8
95	28 days	0	2	\N	2023-06-27 07:06:45.793454	2023-06-27 07:06:45.793454	8
96	28 days	0	3	\N	2023-06-27 07:06:45.798012	2023-06-27 07:06:45.798012	8
97	35 Days	0	0	\N	2023-06-27 07:06:45.804258	2023-06-27 07:06:45.804258	8
98	35 Days	0	1	\N	2023-06-27 07:06:45.809649	2023-06-27 07:06:45.809649	8
99	35 Days	0	2	\N	2023-06-27 07:06:45.814231	2023-06-27 07:06:45.814231	8
100	35 Days	0	3	\N	2023-06-27 07:06:45.81953	2023-06-27 07:06:45.81953	8
16	56 days	750	3	pass	2023-05-29 13:07:06.706994	2023-06-28 08:40:54.511071	1
30	56 days	0	1	pass	2023-05-29 13:21:14.62086	2023-06-28 08:44:14.870942	2
31	56 days	0	2	pass	2023-05-29 13:21:39.564284	2023-06-28 08:44:14.879063	2
79	56 Days	700	1	\N	2023-06-14 12:01:02.089512	2023-06-27 12:42:30.227639	7
32	56 days	0	3	pass	2023-05-29 13:21:59.213975	2023-06-28 08:44:14.884262	2
3	3 days	455	3	pass	2023-05-29 12:57:09.775606	2023-06-30 02:43:37.674105	1
104	56 Days	0	3	\N	2023-06-27 07:06:45.839433	2023-06-27 07:06:45.839433	8
636	10 days	0	2	\N	2023-07-07 09:01:59.378382	2023-07-07 09:01:59.378382	24
637	10 days	0	3	\N	2023-07-07 09:01:59.384311	2023-07-07 09:01:59.384311	24
638	14 days	0	0	\N	2023-07-07 09:01:59.388546	2023-07-07 09:01:59.388546	24
639	14 days	0	1	\N	2023-07-07 09:01:59.392515	2023-07-07 09:01:59.392515	24
640	14 days	0	2	\N	2023-07-07 09:01:59.396917	2023-07-07 09:01:59.396917	24
641	14 days	0	3	\N	2023-07-07 09:01:59.401242	2023-07-07 09:01:59.401242	24
642	15 days	0	0	\N	2023-07-07 09:01:59.405429	2023-07-07 09:01:59.405429	24
643	15 days	0	1	\N	2023-07-07 09:01:59.409361	2023-07-07 09:01:59.409361	24
644	15 days	0	2	\N	2023-07-07 09:01:59.414276	2023-07-07 09:01:59.414276	24
645	15 days	0	3	\N	2023-07-07 09:01:59.418132	2023-07-07 09:01:59.418132	24
646	28 days	0	0	\N	2023-07-07 09:01:59.42223	2023-07-07 09:01:59.42223	24
647	28 days	0	1	\N	2023-07-07 09:01:59.42678	2023-07-07 09:01:59.42678	24
648	28 days	0	2	\N	2023-07-07 09:01:59.4315	2023-07-07 09:01:59.4315	24
649	28 days	0	3	\N	2023-07-07 09:01:59.435261	2023-07-07 09:01:59.435261	24
650	35 days	0	0	\N	2023-07-07 09:01:59.439714	2023-07-07 09:01:59.439714	24
651	35 days	0	1	\N	2023-07-07 09:01:59.444643	2023-07-07 09:01:59.444643	24
652	35 days	0	2	\N	2023-07-07 09:01:59.449083	2023-07-07 09:01:59.449083	24
653	35 days	0	3	\N	2023-07-07 09:01:59.452863	2023-07-07 09:01:59.452863	24
654	45 days	0	0	\N	2023-07-07 09:01:59.457432	2023-07-07 09:01:59.457432	24
655	45 days	0	1	\N	2023-07-07 09:01:59.461923	2023-07-07 09:01:59.461923	24
139	15 days	744	0	\N	2023-06-30 03:02:22.716446	2023-07-05 02:54:13.88514	5
125	3 days	\N	0	\N	2023-06-30 02:32:26.185339	2023-07-05 05:47:58.07449	1
656	45 days	0	2	\N	2023-07-07 09:01:59.466185	2023-07-07 09:01:59.466185	24
657	45 days	0	3	\N	2023-07-07 09:01:59.527832	2023-07-07 09:01:59.527832	24
658	56 days	0	0	\N	2023-07-07 09:01:59.536874	2023-07-07 09:01:59.536874	24
659	56 days	0	1	\N	2023-07-07 09:01:59.545816	2023-07-07 09:01:59.545816	24
660	56 days	0	2	\N	2023-07-07 09:01:59.561475	2023-07-07 09:01:59.561475	24
661	56 days	0	3	\N	2023-07-07 09:01:59.571746	2023-07-07 09:01:59.571746	24
29	35 days	700	3	pass	2023-05-29 13:20:26.205392	2023-06-28 08:44:14.889923	2
662	90 days	0	0	\N	2023-07-07 09:01:59.580986	2023-07-07 09:01:59.580986	24
126	15 days	503	0	\N	2023-06-30 02:49:23.575341	2023-06-30 02:49:23.575341	1
127	35 days	532	0	\N	2023-06-30 02:49:53.237561	2023-06-30 02:49:53.237561	1
128	56 days	609	0	\N	2023-06-30 02:50:12.645425	2023-06-30 02:50:12.645425	1
129	3 days	388	0	\N	2023-06-30 02:53:49.614831	2023-06-30 02:53:49.614831	2
130	15 days	477	0	\N	2023-06-30 02:54:06.928282	2023-06-30 02:54:06.928282	2
131	35 days	555	0	\N	2023-06-30 02:54:32.250932	2023-06-30 02:54:32.250932	2
132	56 days	688	0	\N	2023-06-30 02:55:07.501235	2023-06-30 02:55:07.501235	2
663	90 days	0	1	\N	2023-07-07 09:01:59.590677	2023-07-07 09:01:59.590677	24
664	90 days	0	2	\N	2023-07-07 09:01:59.601115	2023-07-07 09:01:59.601115	24
665	90 days	0	3	\N	2023-07-07 09:01:59.609276	2023-07-07 09:01:59.609276	24
666	120 days	0	0	\N	2023-07-07 09:01:59.618658	2023-07-07 09:01:59.618658	24
667	120 days	0	1	\N	2023-07-07 09:01:59.627806	2023-07-07 09:01:59.627806	24
138	3 days	399	0	\N	2023-06-30 03:01:41.096416	2023-06-30 03:01:41.096416	5
140	28 days	565	0	\N	2023-06-30 03:02:54.445503	2023-06-30 03:02:54.445503	5
141	35 days	487	0	\N	2023-06-30 03:03:32.855464	2023-06-30 03:03:32.855464	5
142	56 days	667	0	\N	2023-06-30 03:04:17.033826	2023-06-30 03:04:17.033826	5
143	56 days	676	1	\N	2023-06-30 03:06:27.697017	2023-06-30 03:06:27.697017	5
144	56 days	767	2	\N	2023-06-30 03:07:04.723775	2023-06-30 03:07:04.723775	5
145	56 days	787	3	\N	2023-06-30 03:07:29.729237	2023-06-30 03:07:29.729237	5
150	10 days	0	0	\N	2023-06-30 10:08:03.703327	2023-06-30 10:08:03.703327	10
151	10 days	0	1	\N	2023-06-30 10:08:03.708189	2023-06-30 10:08:03.708189	10
152	10 days	0	2	\N	2023-06-30 10:08:03.712834	2023-06-30 10:08:03.712834	10
153	10 days	0	3	\N	2023-06-30 10:08:03.719096	2023-06-30 10:08:03.719096	10
154	15 days	0	0	\N	2023-06-30 10:08:03.725392	2023-06-30 10:08:03.725392	10
155	15 days	0	1	\N	2023-06-30 10:08:03.732816	2023-06-30 10:08:03.732816	10
156	15 days	0	2	\N	2023-06-30 10:08:03.738158	2023-06-30 10:08:03.738158	10
157	15 days	0	3	\N	2023-06-30 10:08:03.741719	2023-06-30 10:08:03.741719	10
158	28 days	0	0	\N	2023-06-30 10:08:03.746475	2023-06-30 10:08:03.746475	10
159	28 days	0	1	\N	2023-06-30 10:08:03.752243	2023-06-30 10:08:03.752243	10
160	28 days	0	2	\N	2023-06-30 10:08:03.757812	2023-06-30 10:08:03.757812	10
161	28 days	0	3	\N	2023-06-30 10:08:03.762594	2023-06-30 10:08:03.762594	10
162	35 days	0	0	\N	2023-06-30 10:08:03.769204	2023-06-30 10:08:03.769204	10
163	35 days	0	1	\N	2023-06-30 10:08:03.773212	2023-06-30 10:08:03.773212	10
164	35 days	0	2	\N	2023-06-30 10:08:03.777859	2023-06-30 10:08:03.777859	10
165	35 days	0	3	\N	2023-06-30 10:08:03.783044	2023-06-30 10:08:03.783044	10
166	56 days	0	0	\N	2023-06-30 10:08:03.788327	2023-06-30 10:08:03.788327	10
167	56 days	0	1	\N	2023-06-30 10:08:03.794976	2023-06-30 10:08:03.794976	10
168	56 days	0	2	\N	2023-06-30 10:08:03.800716	2023-06-30 10:08:03.800716	10
169	56 days	0	3	\N	2023-06-30 10:08:03.805312	2023-06-30 10:08:03.805312	10
170	90 days	1000	0	\N	2023-06-30 10:08:03.810491	2023-06-30 10:08:03.810491	10
171	90 days	1000	1	\N	2023-06-30 10:08:03.817006	2023-06-30 10:08:03.817006	10
172	90 days	1000	2	\N	2023-06-30 10:08:03.82198	2023-06-30 10:08:03.82198	10
173	90 days	1000	3	\N	2023-06-30 10:08:03.827563	2023-06-30 10:08:03.827563	10
146	3 days	1	0	\N	2023-06-30 10:08:03.679189	2023-07-01 13:20:55.179697	10
147	3 days	2	1	\N	2023-06-30 10:08:03.687574	2023-07-01 13:20:55.189926	10
148	3 days	3	2	\N	2023-06-30 10:08:03.692023	2023-07-01 13:20:55.194766	10
149	3 days	5	3	\N	2023-06-30 10:08:03.696494	2023-07-01 13:23:42.110559	10
174	3 days	0	0	\N	2023-07-03 08:08:09.367831	2023-07-03 08:08:09.367831	11
175	3 days	0	1	\N	2023-07-03 08:08:09.377958	2023-07-03 08:08:09.377958	11
176	3 days	0	2	\N	2023-07-03 08:08:09.382807	2023-07-03 08:08:09.382807	11
177	3 days	0	3	\N	2023-07-03 08:08:09.387089	2023-07-03 08:08:09.387089	11
178	10 days	0	0	\N	2023-07-03 08:08:09.393191	2023-07-03 08:08:09.393191	11
179	10 days	0	1	\N	2023-07-03 08:08:09.397794	2023-07-03 08:08:09.397794	11
180	10 days	0	2	\N	2023-07-03 08:08:09.402312	2023-07-03 08:08:09.402312	11
181	10 days	0	3	\N	2023-07-03 08:08:09.406831	2023-07-03 08:08:09.406831	11
182	15 days	0	0	\N	2023-07-03 08:08:09.41166	2023-07-03 08:08:09.41166	11
183	15 days	0	1	\N	2023-07-03 08:08:09.416145	2023-07-03 08:08:09.416145	11
184	15 days	0	2	\N	2023-07-03 08:08:09.421651	2023-07-03 08:08:09.421651	11
185	15 days	0	3	\N	2023-07-03 08:08:09.425925	2023-07-03 08:08:09.425925	11
186	28 days	0	0	\N	2023-07-03 08:08:09.430748	2023-07-03 08:08:09.430748	11
187	28 days	0	1	\N	2023-07-03 08:08:09.435083	2023-07-03 08:08:09.435083	11
188	28 days	0	2	\N	2023-07-03 08:08:09.440693	2023-07-03 08:08:09.440693	11
189	28 days	0	3	\N	2023-07-03 08:08:09.446617	2023-07-03 08:08:09.446617	11
190	35 days	0	0	\N	2023-07-03 08:08:09.452811	2023-07-03 08:08:09.452811	11
191	35 days	0	1	\N	2023-07-03 08:08:09.457848	2023-07-03 08:08:09.457848	11
192	35 days	0	2	\N	2023-07-03 08:08:09.464021	2023-07-03 08:08:09.464021	11
193	35 days	0	3	\N	2023-07-03 08:08:09.472078	2023-07-03 08:08:09.472078	11
194	56 days	0	0	\N	2023-07-03 08:08:09.476958	2023-07-03 08:08:09.476958	11
195	56 days	0	1	\N	2023-07-03 08:08:09.481463	2023-07-03 08:08:09.481463	11
196	56 days	0	2	\N	2023-07-03 08:08:09.485873	2023-07-03 08:08:09.485873	11
668	120 days	0	2	\N	2023-07-07 09:01:59.650551	2023-07-07 09:01:59.650551	24
669	120 days	0	3	\N	2023-07-07 09:01:59.655896	2023-07-07 09:01:59.655896	24
674	3 days	400	0	\N	2023-07-07 09:12:20.341996	2023-07-07 09:47:49.224589	25
675	3 days	400	1	\N	2023-07-07 09:12:20.347982	2023-07-07 09:47:49.237315	25
676	3 days	400	2	\N	2023-07-07 09:12:20.354237	2023-07-07 09:47:49.241965	25
197	56 days	0	3	\N	2023-07-03 08:08:09.490477	2023-07-03 08:08:09.490477	11
198	90 days	0	0	\N	2023-07-03 08:08:09.496848	2023-07-03 08:08:09.496848	11
199	90 days	0	1	\N	2023-07-03 08:08:09.501806	2023-07-03 08:08:09.501806	11
200	90 days	0	2	\N	2023-07-03 08:08:09.506092	2023-07-03 08:08:09.506092	11
201	90 days	0	3	\N	2023-07-03 08:08:09.510759	2023-07-03 08:08:09.510759	11
202	2 days	0	0	\N	2023-07-06 05:57:09.947185	2023-07-06 05:57:09.947185	12
203	2 days	0	1	\N	2023-07-06 05:57:09.956303	2023-07-06 05:57:09.956303	12
204	2 days	0	2	\N	2023-07-06 05:57:09.961663	2023-07-06 05:57:09.961663	12
205	2 days	0	3	\N	2023-07-06 05:57:09.967878	2023-07-06 05:57:09.967878	12
210	5 days	0	0	\N	2023-07-06 05:57:09.993648	2023-07-06 05:57:09.993648	12
211	5 days	0	1	\N	2023-07-06 05:57:09.998394	2023-07-06 05:57:09.998394	12
212	5 days	0	2	\N	2023-07-06 05:57:10.003293	2023-07-06 05:57:10.003293	12
213	5 days	0	3	\N	2023-07-06 05:57:10.009181	2023-07-06 05:57:10.009181	12
214	7 days	0	0	\N	2023-07-06 05:57:10.015161	2023-07-06 05:57:10.015161	12
215	7 days	0	1	\N	2023-07-06 05:57:10.019761	2023-07-06 05:57:10.019761	12
216	7 days	0	2	\N	2023-07-06 05:57:10.025528	2023-07-06 05:57:10.025528	12
217	7 days	0	3	\N	2023-07-06 05:57:10.029815	2023-07-06 05:57:10.029815	12
218	10 days	0	0	\N	2023-07-06 05:57:10.034725	2023-07-06 05:57:10.034725	12
219	10 days	0	1	\N	2023-07-06 05:57:10.040025	2023-07-06 05:57:10.040025	12
220	10 days	0	2	\N	2023-07-06 05:57:10.045263	2023-07-06 05:57:10.045263	12
221	10 days	0	3	\N	2023-07-06 05:57:10.051191	2023-07-06 05:57:10.051191	12
222	14 days	0	0	\N	2023-07-06 05:57:10.057512	2023-07-06 05:57:10.057512	12
223	14 days	0	1	\N	2023-07-06 05:57:10.062968	2023-07-06 05:57:10.062968	12
224	14 days	0	2	\N	2023-07-06 05:57:10.06759	2023-07-06 05:57:10.06759	12
225	14 days	0	3	\N	2023-07-06 05:57:10.072109	2023-07-06 05:57:10.072109	12
234	35 days	0	0	\N	2023-07-06 05:57:10.110255	2023-07-06 05:57:10.110255	12
235	35 days	0	1	\N	2023-07-06 05:57:10.114315	2023-07-06 05:57:10.114315	12
236	35 days	0	2	\N	2023-07-06 05:57:10.118109	2023-07-06 05:57:10.118109	12
237	35 days	0	3	\N	2023-07-06 05:57:10.122677	2023-07-06 05:57:10.122677	12
238	45 days	0	0	\N	2023-07-06 05:57:10.126552	2023-07-06 05:57:10.126552	12
239	45 days	0	1	\N	2023-07-06 05:57:10.130476	2023-07-06 05:57:10.130476	12
240	45 days	0	2	\N	2023-07-06 05:57:10.13534	2023-07-06 05:57:10.13534	12
241	45 days	0	3	\N	2023-07-06 05:57:10.140382	2023-07-06 05:57:10.140382	12
242	56 days	0	0	\N	2023-07-06 05:57:10.144207	2023-07-06 05:57:10.144207	12
243	56 days	0	1	\N	2023-07-06 05:57:10.148894	2023-07-06 05:57:10.148894	12
244	56 days	0	2	\N	2023-07-06 05:57:10.153204	2023-07-06 05:57:10.153204	12
245	56 days	0	3	\N	2023-07-06 05:57:10.157663	2023-07-06 05:57:10.157663	12
246	90 days	0	0	\N	2023-07-06 05:57:10.161308	2023-07-06 05:57:10.161308	12
247	90 days	0	1	\N	2023-07-06 05:57:10.167447	2023-07-06 05:57:10.167447	12
248	90 days	0	2	\N	2023-07-06 05:57:10.172188	2023-07-06 05:57:10.172188	12
249	90 days	0	3	\N	2023-07-06 05:57:10.176312	2023-07-06 05:57:10.176312	12
250	120 days	0	0	\N	2023-07-06 05:57:10.180403	2023-07-06 05:57:10.180403	12
251	120 days	0	1	\N	2023-07-06 05:57:10.184597	2023-07-06 05:57:10.184597	12
252	120 days	0	2	\N	2023-07-06 05:57:10.189099	2023-07-06 05:57:10.189099	12
253	120 days	0	3	\N	2023-07-06 05:57:10.192756	2023-07-06 05:57:10.192756	12
230	28 days	0	0	\N	2023-07-06 05:57:10.091387	2023-07-06 09:33:58.71806	12
231	28 days	0	1	\N	2023-07-06 05:57:10.096063	2023-07-06 09:33:58.724063	12
670	2 days	0	0	\N	2023-07-07 09:12:20.319951	2023-07-07 09:12:20.319951	25
671	2 days	0	1	\N	2023-07-07 09:12:20.326	2023-07-07 09:12:20.326	25
206	3 days	500	0	\N	2023-07-06 05:57:09.973399	2023-07-06 06:37:06.856723	12
207	3 days	500	1	\N	2023-07-06 05:57:09.978652	2023-07-06 06:37:06.863136	12
208	3 days	500	2	\N	2023-07-06 05:57:09.983557	2023-07-06 06:37:06.867686	12
209	3 days	500	3	\N	2023-07-06 05:57:09.988827	2023-07-06 06:37:06.873502	12
226	15 days	600	0	\N	2023-07-06 05:57:10.076166	2023-07-06 06:50:50.791522	12
227	15 days	600	1	\N	2023-07-06 05:57:10.080052	2023-07-06 06:50:50.799658	12
228	15 days	600	2	\N	2023-07-06 05:57:10.083538	2023-07-06 06:50:50.803928	12
229	15 days	600	3	\N	2023-07-06 05:57:10.087422	2023-07-06 06:50:50.808751	12
254	2 days	0	0	\N	2023-07-06 06:31:24.069939	2023-07-06 06:31:24.069939	13
255	2 days	0	1	\N	2023-07-06 06:31:24.076075	2023-07-06 06:31:24.076075	13
256	2 days	0	2	\N	2023-07-06 06:31:24.081385	2023-07-06 06:31:24.081385	13
257	2 days	0	3	\N	2023-07-06 06:31:24.087297	2023-07-06 06:31:24.087297	13
258	3 days	400	0	\N	2023-07-06 06:31:24.091894	2023-07-06 06:31:24.091894	13
259	3 days	400	1	\N	2023-07-06 06:31:24.096072	2023-07-06 06:31:24.096072	13
260	3 days	400	2	\N	2023-07-06 06:31:24.099926	2023-07-06 06:31:24.099926	13
261	3 days	400	3	\N	2023-07-06 06:31:24.104278	2023-07-06 06:31:24.104278	13
262	5 days	0	0	\N	2023-07-06 06:31:24.108199	2023-07-06 06:31:24.108199	13
263	5 days	0	1	\N	2023-07-06 06:31:24.112495	2023-07-06 06:31:24.112495	13
264	5 days	0	2	\N	2023-07-06 06:31:24.116459	2023-07-06 06:31:24.116459	13
265	5 days	0	3	\N	2023-07-06 06:31:24.121134	2023-07-06 06:31:24.121134	13
266	7 days	0	0	\N	2023-07-06 06:31:24.124952	2023-07-06 06:31:24.124952	13
267	7 days	0	1	\N	2023-07-06 06:31:24.129175	2023-07-06 06:31:24.129175	13
268	7 days	0	2	\N	2023-07-06 06:31:24.133818	2023-07-06 06:31:24.133818	13
269	7 days	0	3	\N	2023-07-06 06:31:24.13859	2023-07-06 06:31:24.13859	13
270	10 days	0	0	\N	2023-07-06 06:31:24.142417	2023-07-06 06:31:24.142417	13
271	10 days	0	1	\N	2023-07-06 06:31:24.146256	2023-07-06 06:31:24.146256	13
272	10 days	0	2	\N	2023-07-06 06:31:24.150629	2023-07-06 06:31:24.150629	13
273	10 days	0	3	\N	2023-07-06 06:31:24.156061	2023-07-06 06:31:24.156061	13
274	14 days	0	0	\N	2023-07-06 06:31:24.16015	2023-07-06 06:31:24.16015	13
275	14 days	0	1	\N	2023-07-06 06:31:24.163778	2023-07-06 06:31:24.163778	13
276	14 days	0	2	\N	2023-07-06 06:31:24.16837	2023-07-06 06:31:24.16837	13
277	14 days	0	3	\N	2023-07-06 06:31:24.172856	2023-07-06 06:31:24.172856	13
278	15 days	0	0	\N	2023-07-06 06:31:24.176749	2023-07-06 06:31:24.176749	13
279	15 days	0	1	\N	2023-07-06 06:31:24.18075	2023-07-06 06:31:24.18075	13
280	15 days	0	2	\N	2023-07-06 06:31:24.185577	2023-07-06 06:31:24.185577	13
281	15 days	0	3	\N	2023-07-06 06:31:24.189188	2023-07-06 06:31:24.189188	13
286	35 days	0	0	\N	2023-07-06 06:31:24.208504	2023-07-06 06:31:24.208504	13
287	35 days	0	1	\N	2023-07-06 06:31:24.212019	2023-07-06 06:31:24.212019	13
288	35 days	0	2	\N	2023-07-06 06:31:24.217022	2023-07-06 06:31:24.217022	13
289	35 days	0	3	\N	2023-07-06 06:31:24.220524	2023-07-06 06:31:24.220524	13
290	45 days	0	0	\N	2023-07-06 06:31:24.22424	2023-07-06 06:31:24.22424	13
291	45 days	0	1	\N	2023-07-06 06:31:24.22813	2023-07-06 06:31:24.22813	13
672	2 days	0	2	\N	2023-07-07 09:12:20.33116	2023-07-07 09:12:20.33116	25
673	2 days	0	3	\N	2023-07-07 09:12:20.336995	2023-07-07 09:12:20.336995	25
232	28 days	0	2	\N	2023-07-06 05:57:10.101484	2023-07-06 09:33:58.728304	12
233	28 days	0	3	\N	2023-07-06 05:57:10.106586	2023-07-06 09:33:58.732478	12
282	28 days	0	0	\N	2023-07-06 06:31:24.19286	2023-07-06 09:44:21.444853	13
283	28 days	0	1	\N	2023-07-06 06:31:24.196601	2023-07-06 09:44:21.450609	13
284	28 days	0	2	\N	2023-07-06 06:31:24.200992	2023-07-06 09:44:21.454846	13
285	28 days	0	3	\N	2023-07-06 06:31:24.204843	2023-07-06 09:44:21.460886	13
678	5 days	100	0	\N	2023-07-07 09:12:20.364399	2023-07-08 02:13:18.152777	25
679	5 days	100	1	\N	2023-07-07 09:12:20.370138	2023-07-08 02:13:18.170765	25
680	5 days	100	2	\N	2023-07-07 09:12:20.374337	2023-07-08 02:13:18.18024	25
292	45 days	0	2	\N	2023-07-06 06:31:24.232545	2023-07-06 06:31:24.232545	13
293	45 days	0	3	\N	2023-07-06 06:31:24.237821	2023-07-06 06:31:24.237821	13
294	56 days	0	0	\N	2023-07-06 06:31:24.241624	2023-07-06 06:31:24.241624	13
295	56 days	0	1	\N	2023-07-06 06:31:24.24679	2023-07-06 06:31:24.24679	13
296	56 days	0	2	\N	2023-07-06 06:31:24.250958	2023-07-06 06:31:24.250958	13
297	56 days	0	3	\N	2023-07-06 06:31:24.255106	2023-07-06 06:31:24.255106	13
298	90 days	0	0	\N	2023-07-06 06:31:24.259519	2023-07-06 06:31:24.259519	13
299	90 days	0	1	\N	2023-07-06 06:31:24.26443	2023-07-06 06:31:24.26443	13
300	90 days	0	2	\N	2023-07-06 06:31:24.268243	2023-07-06 06:31:24.268243	13
301	90 days	0	3	\N	2023-07-06 06:31:24.272084	2023-07-06 06:31:24.272084	13
302	120 days	0	0	\N	2023-07-06 06:31:24.276525	2023-07-06 06:31:24.276525	13
303	120 days	0	1	\N	2023-07-06 06:31:24.281166	2023-07-06 06:31:24.281166	13
304	120 days	0	2	\N	2023-07-06 06:31:24.284882	2023-07-06 06:31:24.284882	13
305	120 days	0	3	\N	2023-07-06 06:31:24.288835	2023-07-06 06:31:24.288835	13
310	3 days	400	0	\N	2023-07-06 06:52:15.769397	2023-07-06 06:52:15.769397	14
311	3 days	400	1	\N	2023-07-06 06:52:15.774533	2023-07-06 06:52:15.774533	14
312	3 days	400	2	\N	2023-07-06 06:52:15.779848	2023-07-06 06:52:15.779848	14
313	3 days	400	3	\N	2023-07-06 06:52:15.783861	2023-07-06 06:52:15.783861	14
330	15 days	600	0	\N	2023-07-06 06:52:15.860017	2023-07-06 06:52:15.860017	14
331	15 days	600	1	\N	2023-07-06 06:52:15.863627	2023-07-06 06:52:15.863627	14
333	15 days	600	3	\N	2023-07-06 06:52:15.872848	2023-07-06 06:52:15.872848	14
338	35 days	0	0	\N	2023-07-06 06:52:15.89501	2023-07-06 06:52:15.89501	14
339	35 days	0	1	\N	2023-07-06 06:52:15.899833	2023-07-06 06:52:15.899833	14
340	35 days	0	2	\N	2023-07-06 06:52:15.904544	2023-07-06 06:52:15.904544	14
341	35 days	0	3	\N	2023-07-06 06:52:15.908687	2023-07-06 06:52:15.908687	14
342	45 days	0	0	\N	2023-07-06 06:52:15.912275	2023-07-06 06:52:15.912275	14
343	45 days	0	1	\N	2023-07-06 06:52:15.917673	2023-07-06 06:52:15.917673	14
344	45 days	0	2	\N	2023-07-06 06:52:15.922019	2023-07-06 06:52:15.922019	14
345	45 days	0	3	\N	2023-07-06 06:52:15.926809	2023-07-06 06:52:15.926809	14
346	56 days	0	0	\N	2023-07-06 06:52:15.931833	2023-07-06 06:52:15.931833	14
347	56 days	0	1	\N	2023-07-06 06:52:15.937186	2023-07-06 06:52:15.937186	14
348	56 days	0	2	\N	2023-07-06 06:52:15.941305	2023-07-06 06:52:15.941305	14
349	56 days	0	3	\N	2023-07-06 06:52:15.945908	2023-07-06 06:52:15.945908	14
350	90 days	0	0	\N	2023-07-06 06:52:15.950437	2023-07-06 06:52:15.950437	14
351	90 days	0	1	\N	2023-07-06 06:52:15.955553	2023-07-06 06:52:15.955553	14
352	90 days	0	2	\N	2023-07-06 06:52:15.959633	2023-07-06 06:52:15.959633	14
353	90 days	0	3	\N	2023-07-06 06:52:15.964965	2023-07-06 06:52:15.964965	14
354	120 days	0	0	\N	2023-07-06 06:52:15.970196	2023-07-06 06:52:15.970196	14
355	120 days	0	1	\N	2023-07-06 06:52:15.974013	2023-07-06 06:52:15.974013	14
356	120 days	0	2	\N	2023-07-06 06:52:15.979048	2023-07-06 06:52:15.979048	14
357	120 days	0	3	\N	2023-07-06 06:52:15.983091	2023-07-06 06:52:15.983091	14
382	15 days	100	0	\N	2023-07-06 07:21:41.493592	2023-07-06 07:26:52.072397	15
332	15 days	600	2	\N	2023-07-06 06:52:15.868574	2023-07-06 07:13:02.236732	14
358	2 days	0	0	\N	2023-07-06 07:21:41.37595	2023-07-06 07:21:41.37595	15
359	2 days	0	1	\N	2023-07-06 07:21:41.380837	2023-07-06 07:21:41.380837	15
360	2 days	0	2	\N	2023-07-06 07:21:41.385272	2023-07-06 07:21:41.385272	15
361	2 days	0	3	\N	2023-07-06 07:21:41.389998	2023-07-06 07:21:41.389998	15
362	3 days	400	0	\N	2023-07-06 07:21:41.39363	2023-07-06 07:21:41.39363	15
363	3 days	400	1	\N	2023-07-06 07:21:41.398016	2023-07-06 07:21:41.398016	15
364	3 days	400	2	\N	2023-07-06 07:21:41.402112	2023-07-06 07:21:41.402112	15
365	3 days	400	3	\N	2023-07-06 07:21:41.406735	2023-07-06 07:21:41.406735	15
366	5 days	0	0	\N	2023-07-06 07:21:41.410679	2023-07-06 07:21:41.410679	15
367	5 days	0	1	\N	2023-07-06 07:21:41.414929	2023-07-06 07:21:41.414929	15
368	5 days	0	2	\N	2023-07-06 07:21:41.419136	2023-07-06 07:21:41.419136	15
369	5 days	0	3	\N	2023-07-06 07:21:41.422972	2023-07-06 07:21:41.422972	15
370	7 days	0	0	\N	2023-07-06 07:21:41.428423	2023-07-06 07:21:41.428423	15
371	7 days	0	1	\N	2023-07-06 07:21:41.43307	2023-07-06 07:21:41.43307	15
372	7 days	0	2	\N	2023-07-06 07:21:41.437362	2023-07-06 07:21:41.437362	15
373	7 days	0	3	\N	2023-07-06 07:21:41.440935	2023-07-06 07:21:41.440935	15
374	10 days	0	0	\N	2023-07-06 07:21:41.445621	2023-07-06 07:21:41.445621	15
375	10 days	0	1	\N	2023-07-06 07:21:41.450841	2023-07-06 07:21:41.450841	15
376	10 days	0	2	\N	2023-07-06 07:21:41.456182	2023-07-06 07:21:41.456182	15
377	10 days	0	3	\N	2023-07-06 07:21:41.460007	2023-07-06 07:21:41.460007	15
378	14 days	0	0	\N	2023-07-06 07:21:41.473788	2023-07-06 07:21:41.473788	15
379	14 days	0	1	\N	2023-07-06 07:21:41.478991	2023-07-06 07:21:41.478991	15
380	14 days	0	2	\N	2023-07-06 07:21:41.484028	2023-07-06 07:21:41.484028	15
381	14 days	0	3	\N	2023-07-06 07:21:41.488012	2023-07-06 07:21:41.488012	15
383	15 days	600	1	\N	2023-07-06 07:21:41.498414	2023-07-06 07:21:41.498414	15
384	15 days	600	2	\N	2023-07-06 07:21:41.502061	2023-07-06 07:21:41.502061	15
385	15 days	600	3	\N	2023-07-06 07:21:41.507326	2023-07-06 07:21:41.507326	15
390	35 days	0	0	\N	2023-07-06 07:21:41.529601	2023-07-06 07:21:41.529601	15
391	35 days	0	1	\N	2023-07-06 07:21:41.53353	2023-07-06 07:21:41.53353	15
392	35 days	0	2	\N	2023-07-06 07:21:41.538381	2023-07-06 07:21:41.538381	15
393	35 days	0	3	\N	2023-07-06 07:21:41.542351	2023-07-06 07:21:41.542351	15
394	45 days	0	0	\N	2023-07-06 07:21:41.546478	2023-07-06 07:21:41.546478	15
395	45 days	0	1	\N	2023-07-06 07:21:41.550087	2023-07-06 07:21:41.550087	15
386	28 days	0	0	\N	2023-07-06 07:21:41.511815	2023-07-06 09:37:13.51359	15
387	28 days	0	1	\N	2023-07-06 07:21:41.516355	2023-07-06 09:37:13.518775	15
334	28 days	0	0	\N	2023-07-06 06:52:15.876976	2023-07-06 09:42:34.41336	14
335	28 days	0	1	\N	2023-07-06 06:52:15.880536	2023-07-06 09:42:34.420524	14
336	28 days	0	2	\N	2023-07-06 06:52:15.885984	2023-07-06 09:42:34.426065	14
337	28 days	0	3	\N	2023-07-06 06:52:15.890677	2023-07-06 09:42:34.43061	14
306	2 days	400	0	\N	2023-07-06 06:52:15.746555	2023-07-08 02:36:08.650733	14
307	2 days	400	1	\N	2023-07-06 06:52:15.750958	2023-07-08 02:36:08.654901	14
308	2 days	400	2	\N	2023-07-06 06:52:15.758127	2023-07-08 02:36:08.658477	14
309	2 days	400	3	\N	2023-07-06 06:52:15.763794	2023-07-08 02:36:08.664161	14
322	10 days	600	0	\N	2023-07-06 06:52:15.825351	2023-07-08 02:36:08.669228	14
323	10 days	600	1	\N	2023-07-06 06:52:15.829543	2023-07-08 02:36:08.673909	14
324	10 days	600	2	\N	2023-07-06 06:52:15.833124	2023-07-08 02:36:08.678315	14
314	5 days	555	0	\N	2023-07-06 06:52:15.789047	2023-07-08 02:44:12.750578	14
315	5 days	608	1	\N	2023-07-06 06:52:15.793842	2023-07-08 02:44:12.755165	14
316	5 days	566	2	\N	2023-07-06 06:52:15.797881	2023-07-08 02:44:12.761052	14
317	5 days	766	3	\N	2023-07-06 06:52:15.801891	2023-07-08 02:44:12.765316	14
396	45 days	0	2	\N	2023-07-06 07:21:41.554773	2023-07-06 07:21:41.554773	15
397	45 days	0	3	\N	2023-07-06 07:21:41.5595	2023-07-06 07:21:41.5595	15
398	56 days	0	0	\N	2023-07-06 07:21:41.563451	2023-07-06 07:21:41.563451	15
399	56 days	0	1	\N	2023-07-06 07:21:41.567023	2023-07-06 07:21:41.567023	15
400	56 days	0	2	\N	2023-07-06 07:21:41.571879	2023-07-06 07:21:41.571879	15
401	56 days	0	3	\N	2023-07-06 07:21:41.576001	2023-07-06 07:21:41.576001	15
402	90 days	0	0	\N	2023-07-06 07:21:41.580188	2023-07-06 07:21:41.580188	15
403	90 days	0	1	\N	2023-07-06 07:21:41.584572	2023-07-06 07:21:41.584572	15
404	90 days	0	2	\N	2023-07-06 07:21:41.589674	2023-07-06 07:21:41.589674	15
405	90 days	0	3	\N	2023-07-06 07:21:41.594751	2023-07-06 07:21:41.594751	15
406	120 days	0	0	\N	2023-07-06 07:21:41.59924	2023-07-06 07:21:41.59924	15
407	120 days	0	1	\N	2023-07-06 07:21:41.604031	2023-07-06 07:21:41.604031	15
408	120 days	0	2	\N	2023-07-06 07:21:41.608466	2023-07-06 07:21:41.608466	15
409	120 days	0	3	\N	2023-07-06 07:21:41.615295	2023-07-06 07:21:41.615295	15
686	10 days	0	0	\N	2023-07-07 09:12:20.40202	2023-07-07 09:12:20.40202	25
687	10 days	0	1	\N	2023-07-07 09:12:20.40585	2023-07-07 09:12:20.40585	25
688	10 days	0	2	\N	2023-07-07 09:12:20.409886	2023-07-07 09:12:20.409886	25
689	10 days	0	3	\N	2023-07-07 09:12:20.413619	2023-07-07 09:12:20.413619	25
690	14 days	0	0	\N	2023-07-07 09:12:20.417401	2023-07-07 09:12:20.417401	25
691	14 days	0	1	\N	2023-07-07 09:12:20.421171	2023-07-07 09:12:20.421171	25
692	14 days	0	2	\N	2023-07-07 09:12:20.42492	2023-07-07 09:12:20.42492	25
693	14 days	0	3	\N	2023-07-07 09:12:20.428855	2023-07-07 09:12:20.428855	25
702	35 days	0	0	\N	2023-07-07 09:12:20.471863	2023-07-07 09:12:20.471863	25
703	35 days	0	1	\N	2023-07-07 09:12:20.476169	2023-07-07 09:12:20.476169	25
704	35 days	0	2	\N	2023-07-07 09:12:20.480103	2023-07-07 09:12:20.480103	25
705	35 days	0	3	\N	2023-07-07 09:12:20.48472	2023-07-07 09:12:20.48472	25
706	45 days	0	0	\N	2023-07-07 09:12:20.489265	2023-07-07 09:12:20.489265	25
707	45 days	0	1	\N	2023-07-07 09:12:20.493223	2023-07-07 09:12:20.493223	25
708	45 days	0	2	\N	2023-07-07 09:12:20.497077	2023-07-07 09:12:20.497077	25
709	45 days	0	3	\N	2023-07-07 09:12:20.502783	2023-07-07 09:12:20.502783	25
710	56 days	0	0	\N	2023-07-07 09:12:20.506716	2023-07-07 09:12:20.506716	25
711	56 days	0	1	\N	2023-07-07 09:12:20.510427	2023-07-07 09:12:20.510427	25
712	56 days	0	2	\N	2023-07-07 09:12:20.514228	2023-07-07 09:12:20.514228	25
713	56 days	0	3	\N	2023-07-07 09:12:20.518847	2023-07-07 09:12:20.518847	25
714	90 days	0	0	\N	2023-07-07 09:12:20.52289	2023-07-07 09:12:20.52289	25
715	90 days	0	1	\N	2023-07-07 09:12:20.526974	2023-07-07 09:12:20.526974	25
716	90 days	0	2	\N	2023-07-07 09:12:20.530635	2023-07-07 09:12:20.530635	25
717	90 days	0	3	\N	2023-07-07 09:12:20.535161	2023-07-07 09:12:20.535161	25
718	120 days	0	0	\N	2023-07-07 09:12:20.539362	2023-07-07 09:12:20.539362	25
719	120 days	0	1	\N	2023-07-07 09:12:20.543267	2023-07-07 09:12:20.543267	25
720	120 days	0	2	\N	2023-07-07 09:12:20.546985	2023-07-07 09:12:20.546985	25
721	120 days	0	3	\N	2023-07-07 09:12:20.551655	2023-07-07 09:12:20.551655	25
677	3 days	400	3	\N	2023-07-07 09:12:20.35906	2023-07-07 09:47:49.246231	25
694	15 days	600	0	\N	2023-07-07 09:12:20.432296	2023-07-07 09:47:49.252427	25
695	15 days	600	1	\N	2023-07-07 09:12:20.43815	2023-07-07 09:47:49.256962	25
696	15 days	600	2	\N	2023-07-07 09:12:20.4426	2023-07-07 09:47:49.262029	25
697	15 days	600	3	\N	2023-07-07 09:12:20.447871	2023-07-07 09:47:49.26654	25
698	28 days	800	0	\N	2023-07-07 09:12:20.45329	2023-07-07 09:47:49.271254	25
699	28 days	800	1	\N	2023-07-07 09:12:20.458127	2023-07-07 09:47:49.275538	25
700	28 days	800	2	\N	2023-07-07 09:12:20.462347	2023-07-07 09:47:49.28126	25
701	28 days	800	3	\N	2023-07-07 09:12:20.466017	2023-07-07 09:47:49.286741	25
722	2 days	0	0	\N	2023-07-07 11:06:08.717301	2023-07-07 11:06:08.717301	26
723	2 days	0	1	\N	2023-07-07 11:06:08.725813	2023-07-07 11:06:08.725813	26
724	2 days	0	2	\N	2023-07-07 11:06:08.731573	2023-07-07 11:06:08.731573	26
725	2 days	0	3	\N	2023-07-07 11:06:08.736098	2023-07-07 11:06:08.736098	26
726	3 days	0	0	\N	2023-07-07 11:06:08.741066	2023-07-07 11:06:08.741066	26
727	3 days	0	1	\N	2023-07-07 11:06:08.74564	2023-07-07 11:06:08.74564	26
728	3 days	0	2	\N	2023-07-07 11:06:08.750109	2023-07-07 11:06:08.750109	26
729	3 days	0	3	\N	2023-07-07 11:06:08.754137	2023-07-07 11:06:08.754137	26
730	5 days	0	0	\N	2023-07-07 11:06:08.759127	2023-07-07 11:06:08.759127	26
731	5 days	0	1	\N	2023-07-07 11:06:08.763984	2023-07-07 11:06:08.763984	26
732	5 days	0	2	\N	2023-07-07 11:06:08.767933	2023-07-07 11:06:08.767933	26
733	5 days	0	3	\N	2023-07-07 11:06:08.772395	2023-07-07 11:06:08.772395	26
734	7 days	0	0	\N	2023-07-07 11:06:08.776691	2023-07-07 11:06:08.776691	26
388	28 days	0	2	\N	2023-07-06 07:21:41.520272	2023-07-06 09:37:13.527636	15
389	28 days	0	3	\N	2023-07-06 07:21:41.525919	2023-07-06 09:37:13.534365	15
735	7 days	0	1	\N	2023-07-07 11:06:08.780962	2023-07-07 11:06:08.780962	26
736	7 days	0	2	\N	2023-07-07 11:06:08.784886	2023-07-07 11:06:08.784886	26
737	7 days	0	3	\N	2023-07-07 11:06:08.789522	2023-07-07 11:06:08.789522	26
738	10 days	0	0	\N	2023-07-07 11:06:08.794457	2023-07-07 11:06:08.794457	26
739	10 days	0	1	\N	2023-07-07 11:06:08.799205	2023-07-07 11:06:08.799205	26
740	10 days	0	2	\N	2023-07-07 11:06:08.803174	2023-07-07 11:06:08.803174	26
741	10 days	0	3	\N	2023-07-07 11:06:08.807948	2023-07-07 11:06:08.807948	26
742	14 days	0	0	\N	2023-07-07 11:06:08.811918	2023-07-07 11:06:08.811918	26
743	14 days	0	1	\N	2023-07-07 11:06:08.815994	2023-07-07 11:06:08.815994	26
744	14 days	0	2	\N	2023-07-07 11:06:08.821657	2023-07-07 11:06:08.821657	26
745	14 days	0	3	\N	2023-07-07 11:06:08.82625	2023-07-07 11:06:08.82625	26
746	15 days	0	0	\N	2023-07-07 11:06:08.830397	2023-07-07 11:06:08.830397	26
748	15 days	0	2	\N	2023-07-07 11:06:08.840665	2023-07-07 11:06:08.840665	26
749	15 days	0	3	\N	2023-07-07 11:06:08.844951	2023-07-07 11:06:08.844951	26
750	28 days	0	0	\N	2023-07-07 11:06:08.850524	2023-07-07 11:06:08.850524	26
751	28 days	0	1	\N	2023-07-07 11:06:08.855151	2023-07-07 11:06:08.855151	26
752	28 days	0	2	\N	2023-07-07 11:06:08.860081	2023-07-07 11:06:08.860081	26
753	28 days	0	3	\N	2023-07-07 11:06:08.878454	2023-07-07 11:06:08.878454	26
754	35 days	0	0	\N	2023-07-07 11:06:08.885273	2023-07-07 11:06:08.885273	26
755	35 days	0	1	\N	2023-07-07 11:06:08.890666	2023-07-07 11:06:08.890666	26
756	35 days	0	2	\N	2023-07-07 11:06:08.895774	2023-07-07 11:06:08.895774	26
757	35 days	0	3	\N	2023-07-07 11:06:08.901705	2023-07-07 11:06:08.901705	26
758	45 days	0	0	\N	2023-07-07 11:06:08.906836	2023-07-07 11:06:08.906836	26
759	45 days	0	1	\N	2023-07-07 11:06:08.911752	2023-07-07 11:06:08.911752	26
760	45 days	0	2	\N	2023-07-07 11:06:08.917913	2023-07-07 11:06:08.917913	26
761	45 days	0	3	\N	2023-07-07 11:06:08.923128	2023-07-07 11:06:08.923128	26
762	56 days	0	0	\N	2023-07-07 11:06:08.92763	2023-07-07 11:06:08.92763	26
763	56 days	0	1	\N	2023-07-07 11:06:08.932569	2023-07-07 11:06:08.932569	26
764	56 days	0	2	\N	2023-07-07 11:06:08.937036	2023-07-07 11:06:08.937036	26
765	56 days	0	3	\N	2023-07-07 11:06:08.941622	2023-07-07 11:06:08.941622	26
747	15 days	1	1	\N	2023-07-07 11:06:08.835257	2023-07-07 11:33:23.488735	26
685	7 days	200	3	\N	2023-07-07 09:12:20.397354	2023-07-08 02:13:18.223126	25
766	90 days	0	0	\N	2023-07-07 11:06:08.947654	2023-07-07 11:06:08.947654	26
767	90 days	0	1	\N	2023-07-07 11:06:08.955521	2023-07-07 11:06:08.955521	26
768	90 days	0	2	\N	2023-07-07 11:06:08.960146	2023-07-07 11:06:08.960146	26
769	90 days	0	3	\N	2023-07-07 11:06:08.965422	2023-07-07 11:06:08.965422	26
770	120 days	0	0	\N	2023-07-07 11:06:08.970225	2023-07-07 11:06:08.970225	26
771	120 days	0	1	\N	2023-07-07 11:06:08.975394	2023-07-07 11:06:08.975394	26
772	120 days	0	2	\N	2023-07-07 11:06:08.980778	2023-07-07 11:06:08.980778	26
773	120 days	0	3	\N	2023-07-07 11:06:08.985882	2023-07-07 11:06:08.985882	26
681	5 days	100	3	\N	2023-07-07 09:12:20.379163	2023-07-08 02:13:18.187631	25
682	7 days	200	0	\N	2023-07-07 09:12:20.384017	2023-07-08 02:13:18.198642	25
683	7 days	200	1	\N	2023-07-07 09:12:20.388025	2023-07-08 02:13:18.206702	25
684	7 days	200	2	\N	2023-07-07 09:12:20.392501	2023-07-08 02:13:18.214662	25
325	10 days	600	3	\N	2023-07-06 06:52:15.838025	2023-07-08 02:36:08.6817	14
326	14 days	600	0	\N	2023-07-06 06:52:15.842727	2023-07-08 02:36:08.686972	14
327	14 days	600	1	\N	2023-07-06 06:52:15.846624	2023-07-08 02:36:08.692089	14
328	14 days	600	2	\N	2023-07-06 06:52:15.850724	2023-07-08 02:36:08.695675	14
329	14 days	645	3	\N	2023-07-06 06:52:15.855426	2023-07-08 02:36:08.699365	14
318	7 days	565	0	\N	2023-07-06 06:52:15.80716	2023-07-08 02:44:12.769145	14
319	7 days	566	1	\N	2023-07-06 06:52:15.812536	2023-07-08 02:44:12.773861	14
320	7 days	656	2	\N	2023-07-06 06:52:15.816195	2023-07-08 02:44:12.778449	14
321	7 days	454	3	\N	2023-07-06 06:52:15.821133	2023-07-08 02:44:12.781952	14
774	2 days	0	0	\N	2023-07-10 06:46:47.031679	2023-07-10 06:46:47.031679	27
775	2 days	0	1	\N	2023-07-10 06:46:47.039574	2023-07-10 06:46:47.039574	27
776	2 days	0	2	\N	2023-07-10 06:46:47.044981	2023-07-10 06:46:47.044981	27
777	2 days	0	3	\N	2023-07-10 06:46:47.050049	2023-07-10 06:46:47.050049	27
778	3 days	0	0	\N	2023-07-10 06:46:47.054015	2023-07-10 06:46:47.054015	27
779	3 days	0	1	\N	2023-07-10 06:46:47.060104	2023-07-10 06:46:47.060104	27
780	3 days	0	2	\N	2023-07-10 06:46:47.064826	2023-07-10 06:46:47.064826	27
781	3 days	0	3	\N	2023-07-10 06:46:47.069407	2023-07-10 06:46:47.069407	27
782	5 days	0	0	\N	2023-07-10 06:46:47.073219	2023-07-10 06:46:47.073219	27
783	5 days	0	1	\N	2023-07-10 06:46:47.077756	2023-07-10 06:46:47.077756	27
784	5 days	0	2	\N	2023-07-10 06:46:47.08154	2023-07-10 06:46:47.08154	27
785	5 days	0	3	\N	2023-07-10 06:46:47.085595	2023-07-10 06:46:47.085595	27
786	7 days	0	0	\N	2023-07-10 06:46:47.089372	2023-07-10 06:46:47.089372	27
787	7 days	0	1	\N	2023-07-10 06:46:47.093918	2023-07-10 06:46:47.093918	27
788	7 days	0	2	\N	2023-07-10 06:46:47.099855	2023-07-10 06:46:47.099855	27
789	7 days	0	3	\N	2023-07-10 06:46:47.104896	2023-07-10 06:46:47.104896	27
790	10 days	0	0	\N	2023-07-10 06:46:47.109865	2023-07-10 06:46:47.109865	27
791	10 days	0	1	\N	2023-07-10 06:46:47.113779	2023-07-10 06:46:47.113779	27
792	10 days	0	2	\N	2023-07-10 06:46:47.118362	2023-07-10 06:46:47.118362	27
793	10 days	0	3	\N	2023-07-10 06:46:47.122619	2023-07-10 06:46:47.122619	27
794	14 days	0	0	\N	2023-07-10 06:46:47.126875	2023-07-10 06:46:47.126875	27
795	14 days	0	1	\N	2023-07-10 06:46:47.130424	2023-07-10 06:46:47.130424	27
796	14 days	0	2	\N	2023-07-10 06:46:47.135883	2023-07-10 06:46:47.135883	27
797	14 days	0	3	\N	2023-07-10 06:46:47.140461	2023-07-10 06:46:47.140461	27
798	15 days	0	0	\N	2023-07-10 06:46:47.144447	2023-07-10 06:46:47.144447	27
799	15 days	0	1	\N	2023-07-10 06:46:47.148992	2023-07-10 06:46:47.148992	27
800	15 days	0	2	\N	2023-07-10 06:46:47.153166	2023-07-10 06:46:47.153166	27
801	15 days	0	3	\N	2023-07-10 06:46:47.157337	2023-07-10 06:46:47.157337	27
802	28 days	0	0	\N	2023-07-10 06:46:47.160876	2023-07-10 06:46:47.160876	27
803	28 days	0	1	\N	2023-07-10 06:46:47.165016	2023-07-10 06:46:47.165016	27
804	28 days	0	2	\N	2023-07-10 06:46:47.172347	2023-07-10 06:46:47.172347	27
805	28 days	0	3	\N	2023-07-10 06:46:47.178993	2023-07-10 06:46:47.178993	27
806	35 days	0	0	\N	2023-07-10 06:46:47.183808	2023-07-10 06:46:47.183808	27
807	35 days	0	1	\N	2023-07-10 06:46:47.188625	2023-07-10 06:46:47.188625	27
808	35 days	0	2	\N	2023-07-10 06:46:47.192239	2023-07-10 06:46:47.192239	27
809	35 days	0	3	\N	2023-07-10 06:46:47.196188	2023-07-10 06:46:47.196188	27
810	45 days	0	0	\N	2023-07-10 06:46:47.200922	2023-07-10 06:46:47.200922	27
811	45 days	0	1	\N	2023-07-10 06:46:47.204683	2023-07-10 06:46:47.204683	27
812	45 days	0	2	\N	2023-07-10 06:46:47.209073	2023-07-10 06:46:47.209073	27
813	45 days	0	3	\N	2023-07-10 06:46:47.212739	2023-07-10 06:46:47.212739	27
814	56 days	0	0	\N	2023-07-10 06:46:47.217407	2023-07-10 06:46:47.217407	27
815	56 days	0	1	\N	2023-07-10 06:46:47.221124	2023-07-10 06:46:47.221124	27
816	56 days	0	2	\N	2023-07-10 06:46:47.225088	2023-07-10 06:46:47.225088	27
817	56 days	0	3	\N	2023-07-10 06:46:47.22879	2023-07-10 06:46:47.22879	27
818	90 days	0	0	\N	2023-07-10 06:46:47.233308	2023-07-10 06:46:47.233308	27
819	90 days	0	1	\N	2023-07-10 06:46:47.237215	2023-07-10 06:46:47.237215	27
820	90 days	0	2	\N	2023-07-10 06:46:47.241179	2023-07-10 06:46:47.241179	27
821	90 days	0	3	\N	2023-07-10 06:46:47.24487	2023-07-10 06:46:47.24487	27
822	120 days	0	0	\N	2023-07-10 06:46:47.249343	2023-07-10 06:46:47.249343	27
823	120 days	0	1	\N	2023-07-10 06:46:47.253219	2023-07-10 06:46:47.253219	27
824	120 days	0	2	\N	2023-07-10 06:46:47.257448	2023-07-10 06:46:47.257448	27
825	120 days	0	3	\N	2023-07-10 06:46:47.261541	2023-07-10 06:46:47.261541	27
620	2 days	2	2	\N	2023-07-07 09:01:59.306318	2023-07-10 08:25:03.870441	24
621	2 days	3	3	\N	2023-07-07 09:01:59.310569	2023-07-10 08:25:03.88332	24
618	2 days	4	0	\N	2023-07-07 09:01:59.29328	2023-07-10 08:25:03.894629	24
625	3 days	4	3	\N	2023-07-07 09:01:59.328189	2023-07-10 08:26:27.176866	24
826	2 days	0	0	\N	2023-07-13 05:40:35.231457	2023-07-13 05:40:35.231457	28
827	2 days	0	1	\N	2023-07-13 05:40:35.241193	2023-07-13 05:40:35.241193	28
828	2 days	0	2	\N	2023-07-13 05:40:35.247758	2023-07-13 05:40:35.247758	28
829	2 days	0	3	\N	2023-07-13 05:40:35.252693	2023-07-13 05:40:35.252693	28
830	3 days	0	0	\N	2023-07-13 05:40:35.261365	2023-07-13 05:40:35.261365	28
831	3 days	0	1	\N	2023-07-13 05:40:35.268031	2023-07-13 05:40:35.268031	28
832	3 days	0	2	\N	2023-07-13 05:40:35.276696	2023-07-13 05:40:35.276696	28
833	3 days	0	3	\N	2023-07-13 05:40:35.282112	2023-07-13 05:40:35.282112	28
834	5 days	0	0	\N	2023-07-13 05:40:35.290146	2023-07-13 05:40:35.290146	28
835	5 days	0	1	\N	2023-07-13 05:40:35.297388	2023-07-13 05:40:35.297388	28
836	5 days	0	2	\N	2023-07-13 05:40:35.304507	2023-07-13 05:40:35.304507	28
837	5 days	0	3	\N	2023-07-13 05:40:35.462645	2023-07-13 05:40:35.462645	28
838	7 days	0	0	\N	2023-07-13 05:40:35.477717	2023-07-13 05:40:35.477717	28
839	7 days	0	1	\N	2023-07-13 05:40:35.484283	2023-07-13 05:40:35.484283	28
840	7 days	0	2	\N	2023-07-13 05:40:35.496443	2023-07-13 05:40:35.496443	28
841	7 days	0	3	\N	2023-07-13 05:40:35.501975	2023-07-13 05:40:35.501975	28
842	10 days	0	0	\N	2023-07-13 05:40:35.511433	2023-07-13 05:40:35.511433	28
843	10 days	0	1	\N	2023-07-13 05:40:35.520662	2023-07-13 05:40:35.520662	28
844	10 days	0	2	\N	2023-07-13 05:40:35.52761	2023-07-13 05:40:35.52761	28
845	10 days	0	3	\N	2023-07-13 05:40:35.534498	2023-07-13 05:40:35.534498	28
846	14 days	0	0	\N	2023-07-13 05:40:35.54091	2023-07-13 05:40:35.54091	28
847	14 days	0	1	\N	2023-07-13 05:40:35.547367	2023-07-13 05:40:35.547367	28
848	14 days	0	2	\N	2023-07-13 05:40:35.553597	2023-07-13 05:40:35.553597	28
849	14 days	0	3	\N	2023-07-13 05:40:35.560822	2023-07-13 05:40:35.560822	28
850	15 days	0	0	\N	2023-07-13 05:40:35.56957	2023-07-13 05:40:35.56957	28
851	15 days	0	1	\N	2023-07-13 05:40:35.576612	2023-07-13 05:40:35.576612	28
852	15 days	0	2	\N	2023-07-13 05:40:35.582355	2023-07-13 05:40:35.582355	28
853	15 days	0	3	\N	2023-07-13 05:40:35.589294	2023-07-13 05:40:35.589294	28
854	28 days	0	0	\N	2023-07-13 05:40:35.595409	2023-07-13 05:40:35.595409	28
855	28 days	0	1	\N	2023-07-13 05:40:35.604253	2023-07-13 05:40:35.604253	28
856	28 days	0	2	\N	2023-07-13 05:40:35.610347	2023-07-13 05:40:35.610347	28
857	28 days	0	3	\N	2023-07-13 05:40:35.617837	2023-07-13 05:40:35.617837	28
858	35 days	0	0	\N	2023-07-13 05:40:35.626193	2023-07-13 05:40:35.626193	28
859	35 days	0	1	\N	2023-07-13 05:40:35.632157	2023-07-13 05:40:35.632157	28
860	35 days	0	2	\N	2023-07-13 05:40:35.639462	2023-07-13 05:40:35.639462	28
861	35 days	0	3	\N	2023-07-13 05:40:35.644364	2023-07-13 05:40:35.644364	28
862	45 days	0	0	\N	2023-07-13 05:40:35.650833	2023-07-13 05:40:35.650833	28
863	45 days	0	1	\N	2023-07-13 05:40:35.656741	2023-07-13 05:40:35.656741	28
864	45 days	0	2	\N	2023-07-13 05:40:35.662427	2023-07-13 05:40:35.662427	28
865	45 days	0	3	\N	2023-07-13 05:40:35.66778	2023-07-13 05:40:35.66778	28
866	56 days	0	0	\N	2023-07-13 05:40:35.675102	2023-07-13 05:40:35.675102	28
867	56 days	0	1	\N	2023-07-13 05:40:35.680954	2023-07-13 05:40:35.680954	28
868	56 days	0	2	\N	2023-07-13 05:40:35.68807	2023-07-13 05:40:35.68807	28
869	56 days	0	3	\N	2023-07-13 05:40:35.695378	2023-07-13 05:40:35.695378	28
870	90 days	0	0	\N	2023-07-13 05:40:35.700896	2023-07-13 05:40:35.700896	28
871	90 days	0	1	\N	2023-07-13 05:40:35.707839	2023-07-13 05:40:35.707839	28
872	90 days	0	2	\N	2023-07-13 05:40:35.713646	2023-07-13 05:40:35.713646	28
873	90 days	0	3	\N	2023-07-13 05:40:35.719995	2023-07-13 05:40:35.719995	28
874	120 days	0	0	\N	2023-07-13 05:40:35.727566	2023-07-13 05:40:35.727566	28
875	120 days	0	1	\N	2023-07-13 05:40:35.735002	2023-07-13 05:40:35.735002	28
876	120 days	0	2	\N	2023-07-13 05:40:35.742151	2023-07-13 05:40:35.742151	28
877	120 days	0	3	\N	2023-07-13 05:40:35.749849	2023-07-13 05:40:35.749849	28
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at, is_admin, building_master_id, project_master_id, strength_testing_id) FROM stdin;
1	admin@example.com	$2a$12$aVrt7QqWjEUDOw87crkSLeuJp7JKP1ANAi2jmg8WcsWn/e4DaTyqG	\N	\N	\N	2023-05-24 13:21:30.726537	2023-05-24 13:21:30.726537	t	\N	\N	\N
2	todomail116@gmail.com	$2a$12$6wk1yu66XTCOt576ocwYNe1UZ7L2Pd8uGK15KgnCdlJNihyj/dBFu	\N	\N	\N	2023-06-19 05:24:44.191143	2023-07-12 17:57:14.465639	f	18	19	13
\.


--
-- Data for Name: water_reducer_brands; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.water_reducer_brands (id, title, company, city, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: water_reducer_types; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.water_reducer_types (id, title, company, city, created_at, updated_at, water_reducer_brand_id) FROM stdin;
\.


--
-- Data for Name: zone_masters; Type: TABLE DATA; Schema: public; Owner: altmash
--

COPY public.zone_masters (id, name, created_at, updated_at) FROM stdin;
1	Red	2023-06-07 05:14:26.063244	2023-06-07 05:14:26.063244
2	Grey	2023-06-07 05:14:32.124634	2023-06-07 05:14:32.124634
\.


--
-- Name: acceptance_strengths_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.acceptance_strengths_id_seq', 7, true);


--
-- Name: binder1_flyashes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.binder1_flyashes_id_seq', 1, false);


--
-- Name: binder2s_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.binder2s_id_seq', 1, false);


--
-- Name: binder3s_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.binder3s_id_seq', 1, false);


--
-- Name: building_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.building_masters_id_seq', 25, true);


--
-- Name: cement_brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.cement_brands_id_seq', 2, true);


--
-- Name: cement_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.cement_types_id_seq', 1, false);


--
-- Name: cements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.cements_id_seq', 42, true);


--
-- Name: concrete_mix_design_rmcs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.concrete_mix_design_rmcs_id_seq', 1, true);


--
-- Name: concrete_mix_design_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.concrete_mix_design_sites_id_seq', 1, true);


--
-- Name: concretes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.concretes_id_seq', 3, true);


--
-- Name: contractor_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.contractor_masters_id_seq', 1, true);


--
-- Name: day15_acceptances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.day15_acceptances_id_seq', 1, false);


--
-- Name: day28_acceptances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.day28_acceptances_id_seq', 1, false);


--
-- Name: day3_acceptances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.day3_acceptances_id_seq', 1, false);


--
-- Name: day5_acceptances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.day5_acceptances_id_seq', 1, false);


--
-- Name: day7_acceptances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.day7_acceptances_id_seq', 1, false);


--
-- Name: grade_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.grade_masters_id_seq', 20, true);


--
-- Name: m_admixtures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.m_admixtures_id_seq', 29, true);


--
-- Name: m_silicas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.m_silicas_id_seq', 6, true);


--
-- Name: mix_designs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.mix_designs_id_seq', 1, false);


--
-- Name: mix_strengthand_structures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.mix_strengthand_structures_id_seq', 15, true);


--
-- Name: project_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.project_masters_id_seq', 22, true);


--
-- Name: recipe_ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.recipe_ingredients_id_seq', 1, false);


--
-- Name: recipes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.recipes_id_seq', 5, true);


--
-- Name: rmc_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.rmc_lists_id_seq', 37, true);


--
-- Name: strength_acceptances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.strength_acceptances_id_seq', 565, true);


--
-- Name: strength_testings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.strength_testings_id_seq', 28, true);


--
-- Name: structure_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.structure_masters_id_seq', 21, true);


--
-- Name: structure_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.structure_types_id_seq', 1, false);


--
-- Name: superplasticizer_brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.superplasticizer_brands_id_seq', 1, false);


--
-- Name: superplasticizer_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.superplasticizer_types_id_seq', 1, false);


--
-- Name: superplasticizers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.superplasticizers_id_seq', 89, true);


--
-- Name: testing_day_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.testing_day_masters_id_seq', 13, true);


--
-- Name: testing_duration_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.testing_duration_masters_id_seq', 1, false);


--
-- Name: testing_results_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.testing_results_id_seq', 877, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: water_reducer_brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.water_reducer_brands_id_seq', 1, false);


--
-- Name: water_reducer_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.water_reducer_types_id_seq', 1, false);


--
-- Name: zone_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: altmash
--

SELECT pg_catalog.setval('public.zone_masters_id_seq', 2, true);


--
-- Name: acceptance_strengths acceptance_strengths_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.acceptance_strengths
    ADD CONSTRAINT acceptance_strengths_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: binder1_flyashes binder1_flyashes_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.binder1_flyashes
    ADD CONSTRAINT binder1_flyashes_pkey PRIMARY KEY (id);


--
-- Name: binder2s binder2s_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.binder2s
    ADD CONSTRAINT binder2s_pkey PRIMARY KEY (id);


--
-- Name: binder3s binder3s_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.binder3s
    ADD CONSTRAINT binder3s_pkey PRIMARY KEY (id);


--
-- Name: building_masters building_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.building_masters
    ADD CONSTRAINT building_masters_pkey PRIMARY KEY (id);


--
-- Name: cement_brands cement_brands_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.cement_brands
    ADD CONSTRAINT cement_brands_pkey PRIMARY KEY (id);


--
-- Name: cement_types cement_types_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.cement_types
    ADD CONSTRAINT cement_types_pkey PRIMARY KEY (id);


--
-- Name: cements cements_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.cements
    ADD CONSTRAINT cements_pkey PRIMARY KEY (id);


--
-- Name: concrete_mix_design_rmcs concrete_mix_design_rmcs_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.concrete_mix_design_rmcs
    ADD CONSTRAINT concrete_mix_design_rmcs_pkey PRIMARY KEY (id);


--
-- Name: concrete_mix_design_sites concrete_mix_design_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.concrete_mix_design_sites
    ADD CONSTRAINT concrete_mix_design_sites_pkey PRIMARY KEY (id);


--
-- Name: concretes concretes_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.concretes
    ADD CONSTRAINT concretes_pkey PRIMARY KEY (id);


--
-- Name: contractor_masters contractor_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.contractor_masters
    ADD CONSTRAINT contractor_masters_pkey PRIMARY KEY (id);


--
-- Name: day15_acceptances day15_acceptances_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.day15_acceptances
    ADD CONSTRAINT day15_acceptances_pkey PRIMARY KEY (id);


--
-- Name: day28_acceptances day28_acceptances_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.day28_acceptances
    ADD CONSTRAINT day28_acceptances_pkey PRIMARY KEY (id);


--
-- Name: day3_acceptances day3_acceptances_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.day3_acceptances
    ADD CONSTRAINT day3_acceptances_pkey PRIMARY KEY (id);


--
-- Name: day5_acceptances day5_acceptances_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.day5_acceptances
    ADD CONSTRAINT day5_acceptances_pkey PRIMARY KEY (id);


--
-- Name: day7_acceptances day7_acceptances_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.day7_acceptances
    ADD CONSTRAINT day7_acceptances_pkey PRIMARY KEY (id);


--
-- Name: grade_masters grade_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.grade_masters
    ADD CONSTRAINT grade_masters_pkey PRIMARY KEY (id);


--
-- Name: m_admixtures m_admixtures_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.m_admixtures
    ADD CONSTRAINT m_admixtures_pkey PRIMARY KEY (id);


--
-- Name: m_silicas m_silicas_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.m_silicas
    ADD CONSTRAINT m_silicas_pkey PRIMARY KEY (id);


--
-- Name: mix_designs mix_designs_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.mix_designs
    ADD CONSTRAINT mix_designs_pkey PRIMARY KEY (id);


--
-- Name: mix_strengthand_structures mix_strengthand_structures_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.mix_strengthand_structures
    ADD CONSTRAINT mix_strengthand_structures_pkey PRIMARY KEY (id);


--
-- Name: project_masters project_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.project_masters
    ADD CONSTRAINT project_masters_pkey PRIMARY KEY (id);


--
-- Name: recipe_ingredients recipe_ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.recipe_ingredients
    ADD CONSTRAINT recipe_ingredients_pkey PRIMARY KEY (id);


--
-- Name: recipes recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_pkey PRIMARY KEY (id);


--
-- Name: rmc_lists rmc_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.rmc_lists
    ADD CONSTRAINT rmc_lists_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: strength_acceptances strength_acceptances_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.strength_acceptances
    ADD CONSTRAINT strength_acceptances_pkey PRIMARY KEY (id);


--
-- Name: strength_testings strength_testings_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.strength_testings
    ADD CONSTRAINT strength_testings_pkey PRIMARY KEY (id);


--
-- Name: structure_masters structure_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.structure_masters
    ADD CONSTRAINT structure_masters_pkey PRIMARY KEY (id);


--
-- Name: structure_types structure_types_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.structure_types
    ADD CONSTRAINT structure_types_pkey PRIMARY KEY (id);


--
-- Name: superplasticizer_brands superplasticizer_brands_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.superplasticizer_brands
    ADD CONSTRAINT superplasticizer_brands_pkey PRIMARY KEY (id);


--
-- Name: superplasticizer_types superplasticizer_types_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.superplasticizer_types
    ADD CONSTRAINT superplasticizer_types_pkey PRIMARY KEY (id);


--
-- Name: superplasticizers superplasticizers_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.superplasticizers
    ADD CONSTRAINT superplasticizers_pkey PRIMARY KEY (id);


--
-- Name: testing_day_masters testing_day_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.testing_day_masters
    ADD CONSTRAINT testing_day_masters_pkey PRIMARY KEY (id);


--
-- Name: testing_duration_masters testing_duration_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.testing_duration_masters
    ADD CONSTRAINT testing_duration_masters_pkey PRIMARY KEY (id);


--
-- Name: testing_results testing_results_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.testing_results
    ADD CONSTRAINT testing_results_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: water_reducer_brands water_reducer_brands_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.water_reducer_brands
    ADD CONSTRAINT water_reducer_brands_pkey PRIMARY KEY (id);


--
-- Name: water_reducer_types water_reducer_types_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.water_reducer_types
    ADD CONSTRAINT water_reducer_types_pkey PRIMARY KEY (id);


--
-- Name: zone_masters zone_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.zone_masters
    ADD CONSTRAINT zone_masters_pkey PRIMARY KEY (id);


--
-- Name: index_building_masters_on_project_master_id; Type: INDEX; Schema: public; Owner: altmash
--

CREATE INDEX index_building_masters_on_project_master_id ON public.building_masters USING btree (project_master_id);


--
-- Name: index_cement_types_on_cement_brand_id; Type: INDEX; Schema: public; Owner: altmash
--

CREATE INDEX index_cement_types_on_cement_brand_id ON public.cement_types USING btree (cement_brand_id);


--
-- Name: index_concrete_mix_design_rmcs_on_acceptance_strength_id; Type: INDEX; Schema: public; Owner: altmash
--

CREATE INDEX index_concrete_mix_design_rmcs_on_acceptance_strength_id ON public.concrete_mix_design_rmcs USING btree (acceptance_strength_id);


--
-- Name: index_concrete_mix_design_rmcs_on_building_master_id; Type: INDEX; Schema: public; Owner: altmash
--

CREATE INDEX index_concrete_mix_design_rmcs_on_building_master_id ON public.concrete_mix_design_rmcs USING btree (building_master_id);


--
-- Name: index_concrete_mix_design_rmcs_on_cement_id; Type: INDEX; Schema: public; Owner: altmash
--

CREATE INDEX index_concrete_mix_design_rmcs_on_cement_id ON public.concrete_mix_design_rmcs USING btree (cement_id);


--
-- Name: index_concrete_mix_design_rmcs_on_contractor_master_id; Type: INDEX; Schema: public; Owner: altmash
--

CREATE INDEX index_concrete_mix_design_rmcs_on_contractor_master_id ON public.concrete_mix_design_rmcs USING btree (contractor_master_id);


--
-- Name: index_concrete_mix_design_rmcs_on_grade_master_id; Type: INDEX; Schema: public; Owner: altmash
--

CREATE INDEX index_concrete_mix_design_rmcs_on_grade_master_id ON public.concrete_mix_design_rmcs USING btree (grade_master_id);


--
-- Name: index_concrete_mix_design_rmcs_on_project_master_id; Type: INDEX; Schema: public; Owner: altmash
--

CREATE INDEX index_concrete_mix_design_rmcs_on_project_master_id ON public.concrete_mix_design_rmcs USING btree (project_master_id);


--
-- Name: index_concrete_mix_design_rmcs_on_rmc_list_id; Type: INDEX; Schema: public; Owner: altmash
--

CREATE INDEX index_concrete_mix_design_rmcs_on_rmc_list_id ON public.concrete_mix_design_rmcs USING btree (rmc_list_id);


--
-- Name: index_concrete_mix_design_rmcs_on_structure_master_id; Type: INDEX; Schema: public; Owner: altmash
--

CREATE INDEX index_concrete_mix_design_rmcs_on_structure_master_id ON public.concrete_mix_design_rmcs USING btree (structure_master_id);


--
-- Name: index_concrete_mix_design_rmcs_on_superplasticizer_id; Type: INDEX; Schema: public; Owner: altmash
--

CREATE INDEX index_concrete_mix_design_rmcs_on_superplasticizer_id ON public.concrete_mix_design_rmcs USING btree (superplasticizer_id);


--
-- Name: index_concrete_mix_design_sites_on_acceptance_strength_id; Type: INDEX; Schema: public; Owner: altmash
--

CREATE INDEX index_concrete_mix_design_sites_on_acceptance_strength_id ON public.concrete_mix_design_sites USING btree (acceptance_strength_id);


--
-- Name: index_concrete_mix_design_sites_on_building_master_id; Type: INDEX; Schema: public; Owner: altmash
--

CREATE INDEX index_concrete_mix_design_sites_on_building_master_id ON public.concrete_mix_design_sites USING btree (building_master_id);


--
-- Name: index_concrete_mix_design_sites_on_cement_id; Type: INDEX; Schema: public; Owner: altmash
--

CREATE INDEX index_concrete_mix_design_sites_on_cement_id ON public.concrete_mix_design_sites USING btree (cement_id);


--
-- Name: index_concrete_mix_design_sites_on_contractor_master_id; Type: INDEX; Schema: public; Owner: altmash
--

CREATE INDEX index_concrete_mix_design_sites_on_contractor_master_id ON public.concrete_mix_design_sites USING btree (contractor_master_id);


--
-- Name: index_concrete_mix_design_sites_on_grade_master_id; Type: INDEX; Schema: public; Owner: altmash
--

CREATE INDEX index_concrete_mix_design_sites_on_grade_master_id ON public.concrete_mix_design_sites USING btree (grade_master_id);


--
-- Name: index_concrete_mix_design_sites_on_project_master_id; Type: INDEX; Schema: public; Owner: altmash
--

CREATE INDEX index_concrete_mix_design_sites_on_project_master_id ON public.concrete_mix_design_sites USING btree (project_master_id);


--
-- Name: index_concrete_mix_design_sites_on_superplasticizer_id; Type: INDEX; Schema: public; Owner: altmash
--

CREATE INDEX index_concrete_mix_design_sites_on_superplasticizer_id ON public.concrete_mix_design_sites USING btree (superplasticizer_id);


--
-- Name: index_day15_acceptances_on_grade_master_id; Type: INDEX; Schema: public; Owner: altmash
--

CREATE INDEX index_day15_acceptances_on_grade_master_id ON public.day15_acceptances USING btree (grade_master_id);


--
-- Name: index_day28_acceptances_on_grade_master_id; Type: INDEX; Schema: public; Owner: altmash
--

CREATE INDEX index_day28_acceptances_on_grade_master_id ON public.day28_acceptances USING btree (grade_master_id);


--
-- Name: index_day3_acceptances_on_grade_master_id; Type: INDEX; Schema: public; Owner: altmash
--

CREATE INDEX index_day3_acceptances_on_grade_master_id ON public.day3_acceptances USING btree (grade_master_id);


--
-- Name: index_day5_acceptances_on_grade_master_id; Type: INDEX; Schema: public; Owner: altmash
--

CREATE INDEX index_day5_acceptances_on_grade_master_id ON public.day5_acceptances USING btree (grade_master_id);


--
-- Name: index_day7_acceptances_on_grade_master_id; Type: INDEX; Schema: public; Owner: altmash
--

CREATE INDEX index_day7_acceptances_on_grade_master_id ON public.day7_acceptances USING btree (grade_master_id);


--
-- Name: index_mix_designs_on_recipe_id; Type: INDEX; Schema: public; Owner: altmash
--

CREATE INDEX index_mix_designs_on_recipe_id ON public.mix_designs USING btree (recipe_id);


--
-- Name: index_mix_strengthand_structures_on_acceptance_strength_id; Type: INDEX; Schema: public; Owner: altmash
--

CREATE INDEX index_mix_strengthand_structures_on_acceptance_strength_id ON public.mix_strengthand_structures USING btree (acceptance_strength_id);


--
-- Name: index_mix_strengthand_structures_on_structure_master_id; Type: INDEX; Schema: public; Owner: altmash
--

CREATE INDEX index_mix_strengthand_structures_on_structure_master_id ON public.mix_strengthand_structures USING btree (structure_master_id);


--
-- Name: index_recipe_ingredients_on_recipe_id; Type: INDEX; Schema: public; Owner: altmash
--

CREATE INDEX index_recipe_ingredients_on_recipe_id ON public.recipe_ingredients USING btree (recipe_id);


--
-- Name: index_recipes_on_cement_id; Type: INDEX; Schema: public; Owner: altmash
--

CREATE INDEX index_recipes_on_cement_id ON public.recipes USING btree (cement_id);


--
-- Name: index_recipes_on_m_admixture_id; Type: INDEX; Schema: public; Owner: altmash
--

CREATE INDEX index_recipes_on_m_admixture_id ON public.recipes USING btree (m_admixture_id);


--
-- Name: index_recipes_on_m_silica_id; Type: INDEX; Schema: public; Owner: altmash
--

CREATE INDEX index_recipes_on_m_silica_id ON public.recipes USING btree (m_silica_id);


--
-- Name: index_recipes_on_superplasticizer_id; Type: INDEX; Schema: public; Owner: altmash
--

CREATE INDEX index_recipes_on_superplasticizer_id ON public.recipes USING btree (superplasticizer_id);


--
-- Name: index_strength_testings_on_rmc_list_id; Type: INDEX; Schema: public; Owner: altmash
--

CREATE INDEX index_strength_testings_on_rmc_list_id ON public.strength_testings USING btree (rmc_list_id);


--
-- Name: index_structure_masters_on_acceptance_strength_id; Type: INDEX; Schema: public; Owner: altmash
--

CREATE INDEX index_structure_masters_on_acceptance_strength_id ON public.structure_masters USING btree (acceptance_strength_id);


--
-- Name: index_structure_types_on_mix_design_id; Type: INDEX; Schema: public; Owner: altmash
--

CREATE INDEX index_structure_types_on_mix_design_id ON public.structure_types USING btree (mix_design_id);


--
-- Name: index_superplasticizer_types_on_superplasticizer_brand_id; Type: INDEX; Schema: public; Owner: altmash
--

CREATE INDEX index_superplasticizer_types_on_superplasticizer_brand_id ON public.superplasticizer_types USING btree (superplasticizer_brand_id);


--
-- Name: index_testing_results_on_strength_testing_id; Type: INDEX; Schema: public; Owner: altmash
--

CREATE INDEX index_testing_results_on_strength_testing_id ON public.testing_results USING btree (strength_testing_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: altmash
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: altmash
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_water_reducer_types_on_water_reducer_brand_id; Type: INDEX; Schema: public; Owner: altmash
--

CREATE INDEX index_water_reducer_types_on_water_reducer_brand_id ON public.water_reducer_types USING btree (water_reducer_brand_id);


--
-- Name: concrete_mix_design_rmcs fk_rails_04adcd961c; Type: FK CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.concrete_mix_design_rmcs
    ADD CONSTRAINT fk_rails_04adcd961c FOREIGN KEY (superplasticizer_id) REFERENCES public.superplasticizers(id);


--
-- Name: concrete_mix_design_rmcs fk_rails_0596fe3f7a; Type: FK CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.concrete_mix_design_rmcs
    ADD CONSTRAINT fk_rails_0596fe3f7a FOREIGN KEY (rmc_list_id) REFERENCES public.rmc_lists(id);


--
-- Name: concrete_mix_design_rmcs fk_rails_1368739e9b; Type: FK CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.concrete_mix_design_rmcs
    ADD CONSTRAINT fk_rails_1368739e9b FOREIGN KEY (acceptance_strength_id) REFERENCES public.acceptance_strengths(id);


--
-- Name: recipe_ingredients fk_rails_176a228c1e; Type: FK CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.recipe_ingredients
    ADD CONSTRAINT fk_rails_176a228c1e FOREIGN KEY (recipe_id) REFERENCES public.recipes(id);


--
-- Name: superplasticizer_types fk_rails_1ab15e0faa; Type: FK CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.superplasticizer_types
    ADD CONSTRAINT fk_rails_1ab15e0faa FOREIGN KEY (superplasticizer_brand_id) REFERENCES public.superplasticizer_brands(id);


--
-- Name: building_masters fk_rails_2214ec6d25; Type: FK CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.building_masters
    ADD CONSTRAINT fk_rails_2214ec6d25 FOREIGN KEY (project_master_id) REFERENCES public.project_masters(id);


--
-- Name: strength_testings fk_rails_2474319125; Type: FK CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.strength_testings
    ADD CONSTRAINT fk_rails_2474319125 FOREIGN KEY (rmc_list_id) REFERENCES public.rmc_lists(id);


--
-- Name: structure_masters fk_rails_248d24bebd; Type: FK CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.structure_masters
    ADD CONSTRAINT fk_rails_248d24bebd FOREIGN KEY (acceptance_strength_id) REFERENCES public.acceptance_strengths(id);


--
-- Name: concrete_mix_design_rmcs fk_rails_34017ac1f9; Type: FK CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.concrete_mix_design_rmcs
    ADD CONSTRAINT fk_rails_34017ac1f9 FOREIGN KEY (contractor_master_id) REFERENCES public.contractor_masters(id);


--
-- Name: recipes fk_rails_35d100dab5; Type: FK CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT fk_rails_35d100dab5 FOREIGN KEY (m_admixture_id) REFERENCES public.m_admixtures(id);


--
-- Name: concrete_mix_design_rmcs fk_rails_3c13c45f4b; Type: FK CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.concrete_mix_design_rmcs
    ADD CONSTRAINT fk_rails_3c13c45f4b FOREIGN KEY (grade_master_id) REFERENCES public.grade_masters(id);


--
-- Name: concrete_mix_design_rmcs fk_rails_5845f03d20; Type: FK CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.concrete_mix_design_rmcs
    ADD CONSTRAINT fk_rails_5845f03d20 FOREIGN KEY (cement_id) REFERENCES public.cements(id);


--
-- Name: day5_acceptances fk_rails_597c4e4fa5; Type: FK CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.day5_acceptances
    ADD CONSTRAINT fk_rails_597c4e4fa5 FOREIGN KEY (grade_master_id) REFERENCES public.grade_masters(id);


--
-- Name: mix_designs fk_rails_59f6910b53; Type: FK CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.mix_designs
    ADD CONSTRAINT fk_rails_59f6910b53 FOREIGN KEY (recipe_id) REFERENCES public.recipes(id);


--
-- Name: mix_strengthand_structures fk_rails_5bac6acd6b; Type: FK CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.mix_strengthand_structures
    ADD CONSTRAINT fk_rails_5bac6acd6b FOREIGN KEY (structure_master_id) REFERENCES public.structure_masters(id);


--
-- Name: day7_acceptances fk_rails_701e16ba2c; Type: FK CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.day7_acceptances
    ADD CONSTRAINT fk_rails_701e16ba2c FOREIGN KEY (grade_master_id) REFERENCES public.grade_masters(id);


--
-- Name: concrete_mix_design_sites fk_rails_76519da5df; Type: FK CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.concrete_mix_design_sites
    ADD CONSTRAINT fk_rails_76519da5df FOREIGN KEY (superplasticizer_id) REFERENCES public.superplasticizers(id);


--
-- Name: recipes fk_rails_7ee87ef084; Type: FK CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT fk_rails_7ee87ef084 FOREIGN KEY (cement_id) REFERENCES public.cements(id);


--
-- Name: recipes fk_rails_89f2b5d9aa; Type: FK CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT fk_rails_89f2b5d9aa FOREIGN KEY (m_silica_id) REFERENCES public.m_silicas(id);


--
-- Name: structure_types fk_rails_9864b40e62; Type: FK CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.structure_types
    ADD CONSTRAINT fk_rails_9864b40e62 FOREIGN KEY (mix_design_id) REFERENCES public.mix_designs(id);


--
-- Name: concrete_mix_design_sites fk_rails_99bfc8eae7; Type: FK CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.concrete_mix_design_sites
    ADD CONSTRAINT fk_rails_99bfc8eae7 FOREIGN KEY (acceptance_strength_id) REFERENCES public.acceptance_strengths(id);


--
-- Name: water_reducer_types fk_rails_9a4fbfef0b; Type: FK CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.water_reducer_types
    ADD CONSTRAINT fk_rails_9a4fbfef0b FOREIGN KEY (water_reducer_brand_id) REFERENCES public.water_reducer_brands(id);


--
-- Name: concrete_mix_design_sites fk_rails_9f0de60097; Type: FK CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.concrete_mix_design_sites
    ADD CONSTRAINT fk_rails_9f0de60097 FOREIGN KEY (building_master_id) REFERENCES public.building_masters(id);


--
-- Name: recipes fk_rails_a73c9ed6a8; Type: FK CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT fk_rails_a73c9ed6a8 FOREIGN KEY (superplasticizer_id) REFERENCES public.superplasticizers(id);


--
-- Name: day3_acceptances fk_rails_a7e503e526; Type: FK CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.day3_acceptances
    ADD CONSTRAINT fk_rails_a7e503e526 FOREIGN KEY (grade_master_id) REFERENCES public.grade_masters(id);


--
-- Name: concrete_mix_design_sites fk_rails_a97414783e; Type: FK CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.concrete_mix_design_sites
    ADD CONSTRAINT fk_rails_a97414783e FOREIGN KEY (cement_id) REFERENCES public.cements(id);


--
-- Name: day15_acceptances fk_rails_ac8c2b42a7; Type: FK CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.day15_acceptances
    ADD CONSTRAINT fk_rails_ac8c2b42a7 FOREIGN KEY (grade_master_id) REFERENCES public.grade_masters(id);


--
-- Name: testing_results fk_rails_c85cc8a414; Type: FK CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.testing_results
    ADD CONSTRAINT fk_rails_c85cc8a414 FOREIGN KEY (strength_testing_id) REFERENCES public.strength_testings(id);


--
-- Name: concrete_mix_design_sites fk_rails_cec18f02fc; Type: FK CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.concrete_mix_design_sites
    ADD CONSTRAINT fk_rails_cec18f02fc FOREIGN KEY (grade_master_id) REFERENCES public.grade_masters(id);


--
-- Name: concrete_mix_design_rmcs fk_rails_d1941f1307; Type: FK CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.concrete_mix_design_rmcs
    ADD CONSTRAINT fk_rails_d1941f1307 FOREIGN KEY (building_master_id) REFERENCES public.building_masters(id);


--
-- Name: concrete_mix_design_rmcs fk_rails_e585c14fb5; Type: FK CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.concrete_mix_design_rmcs
    ADD CONSTRAINT fk_rails_e585c14fb5 FOREIGN KEY (project_master_id) REFERENCES public.project_masters(id);


--
-- Name: cement_types fk_rails_e87e4bcc96; Type: FK CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.cement_types
    ADD CONSTRAINT fk_rails_e87e4bcc96 FOREIGN KEY (cement_brand_id) REFERENCES public.cement_brands(id);


--
-- Name: day28_acceptances fk_rails_eefd3784f3; Type: FK CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.day28_acceptances
    ADD CONSTRAINT fk_rails_eefd3784f3 FOREIGN KEY (grade_master_id) REFERENCES public.grade_masters(id);


--
-- Name: concrete_mix_design_rmcs fk_rails_efcbe47f33; Type: FK CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.concrete_mix_design_rmcs
    ADD CONSTRAINT fk_rails_efcbe47f33 FOREIGN KEY (structure_master_id) REFERENCES public.structure_masters(id);


--
-- Name: mix_strengthand_structures fk_rails_f6b1a2d5b1; Type: FK CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.mix_strengthand_structures
    ADD CONSTRAINT fk_rails_f6b1a2d5b1 FOREIGN KEY (acceptance_strength_id) REFERENCES public.acceptance_strengths(id);


--
-- Name: concrete_mix_design_sites fk_rails_f77a709438; Type: FK CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.concrete_mix_design_sites
    ADD CONSTRAINT fk_rails_f77a709438 FOREIGN KEY (contractor_master_id) REFERENCES public.contractor_masters(id);


--
-- Name: concrete_mix_design_sites fk_rails_fd49e8430d; Type: FK CONSTRAINT; Schema: public; Owner: altmash
--

ALTER TABLE ONLY public.concrete_mix_design_sites
    ADD CONSTRAINT fk_rails_fd49e8430d FOREIGN KEY (project_master_id) REFERENCES public.project_masters(id);


--
-- PostgreSQL database dump complete
--

