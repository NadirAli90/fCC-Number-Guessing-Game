--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22) NOT NULL,
    games_played integer DEFAULT 0 NOT NULL,
    best_game integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (2, 'user_1703182606822', 2, 608);
INSERT INTO public.users VALUES (1, 'user_1703182606823', 5, 68);
INSERT INTO public.users VALUES (18, 'user_1703183026797', 2, 118);
INSERT INTO public.users VALUES (4, 'user_1703182638905', 2, 70);
INSERT INTO public.users VALUES (17, 'user_1703183026798', 5, 259);
INSERT INTO public.users VALUES (3, 'user_1703182638906', 5, 382);
INSERT INTO public.users VALUES (6, 'user_1703182767878', 2, 216);
INSERT INTO public.users VALUES (20, 'user_1703183055421', 2, 578);
INSERT INTO public.users VALUES (5, 'user_1703182767879', 5, 130);
INSERT INTO public.users VALUES (19, 'user_1703183055422', 5, 57);
INSERT INTO public.users VALUES (8, 'user_1703182785946', 2, 810);
INSERT INTO public.users VALUES (7, 'user_1703182785947', 5, 257);
INSERT INTO public.users VALUES (10, 'user_1703182804739', 2, 156);
INSERT INTO public.users VALUES (9, 'user_1703182804740', 5, 43);
INSERT INTO public.users VALUES (12, 'user_1703182842985', 2, 613);
INSERT INTO public.users VALUES (11, 'user_1703182842986', 5, 136);
INSERT INTO public.users VALUES (14, 'user_1703182897118', 2, 687);
INSERT INTO public.users VALUES (13, 'user_1703182897119', 5, 26);
INSERT INTO public.users VALUES (16, 'user_1703182982711', 2, 430);
INSERT INTO public.users VALUES (15, 'user_1703182982712', 5, 198);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 20, true);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

