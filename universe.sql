--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: civilization; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.civilization (
    civilization_id integer NOT NULL,
    planet_id integer NOT NULL,
    population integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.civilization OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    width_in_ly numeric(5,3) NOT NULL,
    distance_in_ly numeric(7,3) NOT NULL,
    age numeric(7,3) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    "position" integer,
    notes text,
    habitable boolean NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    "position" integer,
    habitable boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    distance numeric(7,3) NOT NULL,
    magnitude integer,
    spectral_type character varying(1)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: civilization; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.civilization VALUES (1, 3, 10500, 'Humans');
INSERT INTO public.civilization VALUES (2, 10, 1000, 'Augmented Humans');
INSERT INTO public.civilization VALUES (3, 12, 7400, 'Vulcans');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 26.8, 0, 5.1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 46.56, 2.45, 3.44);
INSERT INTO public.galaxy VALUES (3, 'Antennae Galaxies', 95.2, 55, 11.2);
INSERT INTO public.galaxy VALUES (4, 'Backward Galaxy', 1.6, 200, 12.6);
INSERT INTO public.galaxy VALUES (5, 'Black Eye Galaxy', 10.71, 17.3, 8.52);
INSERT INTO public.galaxy VALUES (6, 'Bodes Galaxy', 26.9, 21.120, 6.94);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 'Thought to be made of cheese.', FALSE, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 1, 'Discovered Second', FALSE, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 'Discovered First', FALSE, 4);
INSERT INTO public.moon VALUES (4, 'Io', 5, 'Discovered by Galileo', FALSE, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 6, 'Discovered by Galileo', TRUE, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 7, 'Discovered by Galileo', FALSE, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 8, 'Discovered by Galileo', TRUE, 5);
INSERT INTO public.moon VALUES (8, 'Mimas', 10, 'Discovered by Herschel', FALSE, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 14, 'Discovered by Herschel', FALSE, 6);
INSERT INTO public.moon VALUES (10, 'Tethys', 15, 'Discovered by Cassini', FALSE, 6);
INSERT INTO public.moon VALUES (11, 'Dione', 18, 'Discovered by Cassini', TRUE, 6);
INSERT INTO public.moon VALUES (12, 'Rhea', 21, 'Discovered by Cassini', FALSE, 6);
INSERT INTO public.moon VALUES (13, 'Titan', 22, 'Discovered by Huygens', TRUE, 6);
INSERT INTO public.moon VALUES (14, 'Ariel', 15, 'Discovered by Lassell', FALSE, 7);
INSERT INTO public.moon VALUES (15, 'Umbriel', 16, 'Discovered by Lassell', FALSE, 7);
INSERT INTO public.moon VALUES (16, 'Titania', 17, 'Discovered by Herschel', FALSE, 7);
INSERT INTO public.moon VALUES (17, 'Oberon', 18, 'Discovered by Herschel', FALSE, 7);
INSERT INTO public.moon VALUES (18, 'Miranda', 14, 'Discovered by Kuiper', FALSE, 7);
INSERT INTO public.moon VALUES (19, 'Triton', 8, 'Discovered by Lassell', FALSE, 8);
INSERT INTO public.moon VALUES (20, 'Nereid', 9, 'Discovered by Kuiper', FALSE, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, FALSE, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 2, FALSE, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 3, TRUE, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 4, TRUE, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 5, FALSE, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 6, FALSE, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 7, FALSE, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 8, FALSE, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 9, FALSE, 1);
INSERT INTO public.planet VALUES (10, 'Ceti Alpha V', 5, TRUE, 7);
INSERT INTO public.planet VALUES (11, 'Ceti Alpha IV', 4, FALSE, 7);
INSERT INTO public.planet VALUES (12, 'Vulcan', 1, TRUE, 8);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, 0.001, 4.83, 'G');
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 1, 4.6, 1.33, 'G');
INSERT INTO public.star VALUES (3, 'Arcturus', 1, 36.7, -0.30, 'K');
INSERT INTO public.star VALUES (4, 'Polaris', 1, 447.6, 3.1, 'F');
INSERT INTO public.star VALUES (5, 'Vega', 1, 25.04, 0.026, 'A');
INSERT INTO public.star VALUES (6, 'Dubhe', 1, 123, −1.10, 'F');
INSERT INTO public.star VALUES (7, 'Ceti Alpha', 1, 44, 4.53, 'K');
INSERT INTO public.star VALUES (8, '40 Eridani A', 1, 16, 2.44, 'K');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: civilization civilization_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilization
    ADD CONSTRAINT civilization_name_key UNIQUE (name);


--
-- Name: civilization civilization_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilization
    ADD CONSTRAINT civilization_pkey PRIMARY KEY (civilization_id);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: civilization fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilization
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--


