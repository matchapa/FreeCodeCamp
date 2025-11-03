--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    age_in_million_years integer,
    galaxy_types_id integer NOT NULL,
    distance_from_earth numeric(30,3) NOT NULL
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_types_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_types_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_million_years integer,
    distance_from_earth numeric(30,3) NOT NULL,
    planet_id integer NOT NULL,
    description text
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
    age_in_million_years integer,
    distance_from_earth numeric(30,3) NOT NULL,
    star_id integer NOT NULL,
    description text,
    has_life boolean NOT NULL
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
    star_types_id integer NOT NULL,
    age_in_millions_years integer,
    distance_from_earth numeric(30,3) NOT NULL,
    galaxy_id integer NOT NULL
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
-- Name: star_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_types (
    star_types_id integer NOT NULL,
    name character varying(5) NOT NULL,
    description text
);


ALTER TABLE public.star_types OWNER TO freecodecamp;

--
-- Name: star_types_star_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_types_star_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_types_star_types_id_seq OWNER TO freecodecamp;

--
-- Name: star_types_star_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_types_star_types_id_seq OWNED BY public.star_types.star_types_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_types_id_seq'::regclass);


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
-- Name: star_types star_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_types ALTER COLUMN star_types_id SET DEFAULT nextval('public.star_types_star_types_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy, containing the Solar System.', true, 13600, 1, 0.000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest major galaxy to the Milky Way, on a collision course with it.', false, 10000, 1, 2537000.000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A smaller spiral galaxy part of the Local Group.', false, 12000, 1, 3000000.000);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'An unusual galaxy with a bright nucleus and large central bulge.', false, 13000, 3, 29000000.000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'A classic spiral galaxy interacting with a smaller companion.', false, 11000, 1, 23000000.000);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'A giant elliptical galaxy with a supermassive black hole at its center.', false, 13500, 2, 53000000.000);
INSERT INTO public.galaxy VALUES (7, 'Large Magellanic Cloud', 'A satellite galaxy of the Milky Way visible from the southern hemisphere.', false, 13000, 4, 163000.000);
INSERT INTO public.galaxy VALUES (8, 'Small Magellanic Cloud', 'Another nearby satellite galaxy of the Milky Way.', false, 13000, 4, 200000.000);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Spiral', 'Spiral galaxies are characterized by a flat, rotating disk with a central bulge and spiral arms composed of gas, dust, and young stars');
INSERT INTO public.galaxy_types VALUES (2, 'Elliptical', 'Elliptical galaxies are shaped like ellipsoids, ranging from nearly spherical (E0) to highly elongated (E7), and lack the structured disk and spiral arms seen in spiral galaxies.');
INSERT INTO public.galaxy_types VALUES (3, 'Lenticular', 'Lenticular galaxies (S0) represent an intermediate form between spirals and ellipticals, possessing a central bulge and a disk but no visible spiral arms.');
INSERT INTO public.galaxy_types VALUES (4, 'Irregular', 'Irregular galaxies lack a defined shape and appear disorganized, often due to gravitational interactions or collisions with other galaxies.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 4500, 0.001, 1, 'Satélite natural de Earth, importante para mareas y estabilidad axial');
INSERT INTO public.moon VALUES (2, 'Phobos', 4500, 0.002, 2, 'Satélite interior irregular de Mars');
INSERT INTO public.moon VALUES (3, 'Deimos', 4500, 0.005, 2, 'Satélite exterior pequeño de Mars');
INSERT INTO public.moon VALUES (4, 'Venus-NoMoon-1', 4500, 0.010, 3, 'Satélite hipotético/temporal alrededor de Venus (ejemplo)');
INSERT INTO public.moon VALUES (5, 'Proxima-b-Moon-A', 1800, 4.244, 4, 'Pequeño satélite rocoso orbitando Proxima b');
INSERT INTO public.moon VALUES (6, 'SiriusB-Moon-Alpha', 180, 8.583, 5, 'Luna alrededor del planeta en el sistema de Sirius');
INSERT INTO public.moon VALUES (7, 'Betelgeuse-Moon-1', 5, 642.501, 6, 'Luna expuesta a radiación intensa por la supergigante');
INSERT INTO public.moon VALUES (8, 'Vega-Io-like', 250, 25.041, 7, 'Satelite volcánico alrededor de Vega-Companion');
INSERT INTO public.moon VALUES (9, 'Barnard-X-Moon', 1400, 5.964, 8, 'Pequeña luna rocoso en órbita cercana');
INSERT INTO public.moon VALUES (10, 'WD-Orbit-Moon', 8000, 18.201, 9, 'Luna sobreviviente alrededor de un planeta que orbita una enana blanca');
INSERT INTO public.moon VALUES (11, 'Andromeda-1-Moon-1', 400, 2537000.001, 10, 'Luna de Andromeda-World-1');
INSERT INTO public.moon VALUES (12, 'Andromeda-Oceanus-Moon', 15, 2537200.002, 11, 'Gran luna con posibles océanos en Andrómeda');
INSERT INTO public.moon VALUES (13, 'Triangulum-Small', 900, 3000000.001, 12, 'Luna interior del sistema Triangulum-T1');
INSERT INTO public.moon VALUES (14, 'Triangulum-Moonlet-1', 80, 3000500.005, 13, 'Pequeño satélite del satélite (moonlet)');
INSERT INTO public.moon VALUES (15, 'Sombrero-Pulsar-Moon', 8, 2900000.002, 14, 'Luna cerca del núcleo activo, condiciones extremas');
INSERT INTO public.moon VALUES (16, 'Sombrero-OldMoon', 6900, 2900100.100, 15, 'Luna antigua en la región del bulbo del Sombrero');
INSERT INTO public.moon VALUES (17, 'Whirlpool-Inner', 700, 23000000.001, 16, 'Luna en sistema planetario de Whirlpool-G1');
INSERT INTO public.moon VALUES (18, 'Whirlpool-Outer-1', 550, 23001000.200, 17, 'Luna en sistema múltiple de Whirlpool-G2');
INSERT INTO public.moon VALUES (19, 'M87-Inner-Moon-A', 8, 530000000.100, 18, 'Luna cercana al núcleo de M87 (estimada)');
INSERT INTO public.moon VALUES (20, 'M87-Pulsar-Moon-1', 1, 530000500.050, 19, 'Luna pequeña, altamente magnetizada, cerca del pulsar');
INSERT INTO public.moon VALUES (21, 'LMC-Moon-Eden-I', 1100, 163000.001, 20, 'Luna en órbita de LMC-Eden (posible condiciones habitables)');
INSERT INTO public.moon VALUES (22, 'LMC-Giant-Moon', 8500, 163050.020, 21, 'Gran luna alrededor del gigante gaseoso en LMC');
INSERT INTO public.moon VALUES (23, 'SMC-Rock-M1', 950, 200000.010, 22, 'Luna rocosa en la Pequeña Nube de Magallanes');
INSERT INTO public.moon VALUES (24, 'SMC-WD-Moon', 2900, 200100.005, 23, 'Luna en órbita de planeta que rodea una enana blanca en SMC');
INSERT INTO public.moon VALUES (25, 'Rogue-Captured-1', 25, 150000.100, 24, 'Luna capturada por Rogue-orbit-1 en encuentro dinámico');
INSERT INTO public.moon VALUES (26, 'Blue-SG-Companion-Moon', 2, 2536800.010, 25, 'Luna joven alrededor del planeta de la estrella azul supergigante');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4500, 0.000, 1, 'Planeta rocoso, hogar de la vida', true);
INSERT INTO public.planet VALUES (2, 'Mars', 4500, 0.000, 1, 'Planeta rocoso, potencial habitabilidad pasada', false);
INSERT INTO public.planet VALUES (3, 'Venus', 4500, 0.000, 1, 'Atmósfera densa y caliente', false);
INSERT INTO public.planet VALUES (4, 'Proxima b', 2000, 4.243, 4, 'Exoplaneta terrestre orbitando Proxima Centauri', false);
INSERT INTO public.planet VALUES (5, 'Sirius b-1', 200, 8.582, 2, 'Gigante gaseoso brillante en sistema cercano', false);
INSERT INTO public.planet VALUES (6, 'Betelgeuse-b', 5, 642.500, 3, 'Planeta en torno a supergigante, condiciones extremas', false);
INSERT INTO public.planet VALUES (7, 'Vega-Companion', 300, 25.040, 5, 'Planeta joven alrededor de Vega', false);
INSERT INTO public.planet VALUES (8, 'Barnard Planet X', 1500, 5.963, 7, 'Pequeño planeta rocoso de baja masa', false);
INSERT INTO public.planet VALUES (9, 'WD-Companion', 8000, 18.200, 8, 'Planeta superviviente alrededor de enana blanca', false);
INSERT INTO public.planet VALUES (10, 'Andromeda-World-1', 500, 2537000.000, 9, 'Planeta en Andrómeda (estimado)', false);
INSERT INTO public.planet VALUES (11, 'Andromeda-Oceanus', 20, 2537200.000, 10, 'Gigante con océanos profundos en Andrómeda', false);
INSERT INTO public.planet VALUES (12, 'Triangulum-T1', 1000, 3000000.000, 11, 'Planeta con atmósfera densa en Triangulum', false);
INSERT INTO public.planet VALUES (13, 'Triangulum-Moonlet', 100, 3000500.000, 12, 'Gran satélite en sistema múltiple', false);
INSERT INTO public.planet VALUES (14, 'Sombrero-Pulsar-Planet', 10, 2900000.000, 13, 'Planeta cercano a núcleo activo del Sombrero', false);
INSERT INTO public.planet VALUES (15, 'Sombrero-RedG-Planet', 7000, 2900100.000, 14, 'Planeta viejo en la región del bulbo', false);
INSERT INTO public.planet VALUES (16, 'Whirlpool-G1', 800, 23000000.000, 15, 'Planeta en brazo espiral de Whirlpool', false);
INSERT INTO public.planet VALUES (17, 'Whirlpool-G2', 600, 23001000.000, 16, 'Sistema planetario múltiple en Whirlpool', false);
INSERT INTO public.planet VALUES (18, 'M87-Inner', 10, 530000000.000, 17, 'Planeta cercano al núcleo de M87', false);
INSERT INTO public.planet VALUES (19, 'M87-Pulsar-Orbit', 1, 530000500.000, 18, 'Planeta compacto y magnetizado', false);
INSERT INTO public.planet VALUES (20, 'LMC-Eden', 1200, 163000.000, 19, 'Planeta en la Gran Nube de Magallanes', false);
INSERT INTO public.planet VALUES (21, 'LMC-Giant', 9000, 163050.000, 20, 'Gigante gaseoso en LMC', false);
INSERT INTO public.planet VALUES (22, 'SMC-RockA', 1000, 200000.000, 21, 'Planeta rocoso en la Pequeña Nube', false);
INSERT INTO public.planet VALUES (23, 'SMC-WhiteDwarf-Orb', 3000, 200100.000, 22, 'Planeta en órbita de enana blanca en SMC', false);
INSERT INTO public.planet VALUES (24, 'Rogue-orbit-1', 30, 150000.000, 23, 'Planeta capturado en sistema binario', false);
INSERT INTO public.planet VALUES (25, 'Blue-Supergiant-Companion', 2, 2536800.000, 24, 'Planeta joven alrededor de estrella masiva', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, 4600, 0.000, 1);
INSERT INTO public.star VALUES (2, 'Sirius A', 1, 242, 8.582, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 5, 10, 642.500, 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 4500, 4.243, 1);
INSERT INTO public.star VALUES (5, 'Vega', 1, 455, 25.040, 1);
INSERT INTO public.star VALUES (6, 'Antares', 5, 12, 550.000, 1);
INSERT INTO public.star VALUES (7, 'Barnard''s Star', 1, 7000, 5.963, 1);
INSERT INTO public.star VALUES (8, 'White Dwarf HD 27442 B', 3, 10000, 18.200, 1);
INSERT INTO public.star VALUES (9, 'Andromeda-1', 1, 3000, 2537000.000, 2);
INSERT INTO public.star VALUES (10, 'Andromeda-2 (giant)', 5, 50, 2537200.000, 2);
INSERT INTO public.star VALUES (11, 'Triangulum-A', 1, 1500, 3000000.000, 3);
INSERT INTO public.star VALUES (12, 'Triangulum-B (binary)', 6, 2000, 3000500.000, 3);
INSERT INTO public.star VALUES (13, 'Sombrero-Core-Pulsar', 4, 20, 2900000.000, 4);
INSERT INTO public.star VALUES (14, 'Sombrero-RedGiant', 2, 8000, 2900100.000, 4);
INSERT INTO public.star VALUES (15, 'Whirlpool-Alpha', 1, 1200, 23000000.000, 5);
INSERT INTO public.star VALUES (16, 'Whirlpool-Companion', 6, 900, 23001000.000, 5);
INSERT INTO public.star VALUES (17, 'M87-Central-Supergiant', 5, 15, 530000000.000, 6);
INSERT INTO public.star VALUES (18, 'M87-Pulsar-1', 4, 5, 530000500.000, 6);
INSERT INTO public.star VALUES (19, 'LMC-Star-1', 1, 1300, 163000.000, 7);
INSERT INTO public.star VALUES (20, 'LMC-RedGiant-2', 2, 10000, 163050.000, 7);
INSERT INTO public.star VALUES (21, 'SMC-Star-A', 1, 1200, 200000.000, 8);
INSERT INTO public.star VALUES (22, 'SMC-WhiteDwarf', 3, 8500, 200100.000, 8);
INSERT INTO public.star VALUES (23, 'Rogue-Binary-X', 6, 50, 150000.000, 1);
INSERT INTO public.star VALUES (24, 'Distant-Blue-Supergiant', 5, 8, 2536800.000, 2);


--
-- Data for Name: star_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_types VALUES (1, 'I', 'hypergiants or extremely luminous supergiants');
INSERT INTO public.star_types VALUES (2, 'II', 'luminous supergiants');
INSERT INTO public.star_types VALUES (3, 'III', 'intermediate-size luminous supergiants');
INSERT INTO public.star_types VALUES (4, 'IV', 'less luminous supergiants');
INSERT INTO public.star_types VALUES (5, 'V', 'bright giants');
INSERT INTO public.star_types VALUES (6, 'VI', 'normal giants');
INSERT INTO public.star_types VALUES (7, 'VII', 'subgiants');
INSERT INTO public.star_types VALUES (8, 'VIII', 'main-sequence stars (dwarfs)');
INSERT INTO public.star_types VALUES (9, 'IX', 'subdwarfs');
INSERT INTO public.star_types VALUES (10, 'X', 'white dwarfs');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_types_id_seq', 4, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: star_types_star_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_types_star_types_id_seq', 10, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_types galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star_types star_types_class_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_types
    ADD CONSTRAINT star_types_class_key UNIQUE (name);


--
-- Name: star_types star_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_types
    ADD CONSTRAINT star_types_pkey PRIMARY KEY (star_types_id);


--
-- Name: galaxy galaxy_galaxy_types_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_types_id_fkey FOREIGN KEY (galaxy_types_id) REFERENCES public.galaxy_types(galaxy_types_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_star_types_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_types_id_fkey FOREIGN KEY (star_types_id) REFERENCES public.star_types(star_types_id);


--
-- PostgreSQL database dump complete
--

