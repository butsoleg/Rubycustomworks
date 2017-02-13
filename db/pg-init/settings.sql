--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

-- Started on 2017-02-07 17:48:52 UTC

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 108385)
-- Name: settings; Type: TABLE; Schema: public;
--

CREATE TABLE settings (
    id integer NOT NULL,
    var character varying NOT NULL UNIQUE,
    value text,
    thing_id integer,
    thing_type character varying(30),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- TOC entry 196 (class 1259 OID 108383)
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public;
--

CREATE SEQUENCE settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2155 (class 0 OID 0)
-- Dependencies: 196
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public;
--

ALTER SEQUENCE settings_id_seq OWNED BY settings.id;


--
-- TOC entry 2031 (class 2604 OID 108388)
-- Name: id; Type: DEFAULT; Schema: public;
--

ALTER TABLE ONLY settings ALTER COLUMN id SET DEFAULT nextval('settings_id_seq'::regclass);


--
-- TOC entry 2150 (class 0 OID 108385)
-- Dependencies: 197
-- Data for Name: settings; Type: TABLE DATA; Schema: public;
--

COPY settings (id, var, value, thing_id, thing_type, created_at, updated_at) FROM stdin;
1	Site	---\n:title: Workshop Manager\n:logo: logo.png\n:footer: Copyright © 2016 Example Organization\n:events_url: http://www.example.com/events\n:legacy_api: https://database.example.com/api/your_api_key\n:legacy_person: https://www.example.com/db/?section=Updates&sub=person&id=\n:application_email: workshops@example.com\n:webmaster_email: webmaster@example.com\n:sysadmin_email: sysadmin@example.com\n:event_types:\n- 5 Day Workshop\n- 2 Day Workshop\n- Research in Teams\n- Focussed Research Group\n- Summer School\n- Public Lecture\n:code_pattern: "\\\\A\\\\d{2}(w|ss|rit|frg|pl)\\\\d{3,4}\\\\z"\n	\N	\N	2017-02-07 17:48:24.396863	2017-02-07 17:48:24.396863
2	Emails	---\n:EO:\n  :program_coordinator: organization@example.com\n  :secretary: organization-secretary@example.com\n  :administrator: organization-administrator@example.com\n  :director: organization-director@example.com\n  :videos: videos@example.com\n  :schedule_staff: barista@example.com, photographer@example.com\n  :event_updates: webmaster@example.com, communications@example.com\n  :name_tags: organization-secretary@example.com\n	\N	\N	2017-02-07 17:48:24.415055	2017-02-07 17:48:24.415055
3	Locations	---\n:EO:\n  :Name: Example Organization\n  :Country: Canada\n  :Timezone: Mountain Time (US & Canada)\n	\N	\N	2017-02-07 17:48:24.427253	2017-02-07 17:48:24.427253
4	Rooms	---\n:EO:\n  :5 Day Workshop: TCPL 201\n  :2 Day Workshop: TCPL 201\n  :Summer School: TCPL 202\n  :Focussed Research Group: TCPL 202\n  :Research in Teams: TCPL 107\n  :Contact Organizer: CH2\n  :Organizer: CH2\n  :Participant: CH1\n  :CH1:\n  - '5112'\n  - '5114'\n  - '5120'\n  - '5122'\n  :CH2:\n  - '5116'\n  - '5124'\n	\N	\N	2017-02-07 17:48:24.438762	2017-02-07 17:48:24.438762
\.


--
-- TOC entry 2156 (class 0 OID 0)
-- Dependencies: 196
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public;
--

SELECT pg_catalog.setval('settings_id_seq', 4, true);


--
-- TOC entry 2034 (class 2606 OID 108393)
-- Name: settings_pkey; Type: CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- TOC entry 2032 (class 1259 OID 108394)
-- Name: index_settings_on_thing_type_and_thing_id_and_var; Type: INDEX; Schema: public;
--

CREATE UNIQUE INDEX index_settings_on_thing_type_and_thing_id_and_var ON settings USING btree (thing_type, thing_id, var);


-- Completed on 2017-02-07 17:48:52 UTC

--
-- PostgreSQL database dump complete
--

