--
-- PostgreSQL database dump
--

-- Dumped from database version 10.14 (Ubuntu 10.14-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.14 (Ubuntu 10.14-0ubuntu0.18.04.1)

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: telegrambot
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO telegrambot;

--
-- Name: cart_items; Type: TABLE; Schema: public; Owner: telegrambot
--

CREATE TABLE public.cart_items (
    id integer NOT NULL,
    user_id integer,
    dish_id integer,
    count integer
);


ALTER TABLE public.cart_items OWNER TO telegrambot;

--
-- Name: cart_items_id_seq; Type: SEQUENCE; Schema: public; Owner: telegrambot
--

CREATE SEQUENCE public.cart_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_items_id_seq OWNER TO telegrambot;

--
-- Name: cart_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: telegrambot
--

ALTER SEQUENCE public.cart_items_id_seq OWNED BY public.cart_items.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: telegrambot
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    text character varying(100),
    user_id integer,
    username character varying(100)
);


ALTER TABLE public.comments OWNER TO telegrambot;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: telegrambot
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO telegrambot;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: telegrambot
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: dish_categories; Type: TABLE; Schema: public; Owner: telegrambot
--

CREATE TABLE public.dish_categories (
    id integer NOT NULL,
    name character varying(100),
    name_uz character varying(100),
    number integer,
    lft integer NOT NULL,
    rgt integer NOT NULL,
    level integer NOT NULL,
    tree_id integer,
    parent_id integer,
    image_id character varying(150),
    image_path character varying(150)
);


ALTER TABLE public.dish_categories OWNER TO telegrambot;

--
-- Name: dish_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: telegrambot
--

CREATE SEQUENCE public.dish_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dish_categories_id_seq OWNER TO telegrambot;

--
-- Name: dish_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: telegrambot
--

ALTER SEQUENCE public.dish_categories_id_seq OWNED BY public.dish_categories.id;


--
-- Name: dishes; Type: TABLE; Schema: public; Owner: telegrambot
--

CREATE TABLE public.dishes (
    id integer NOT NULL,
    name character varying(100),
    name_uz character varying(100),
    image_id character varying(150),
    image_path character varying(150),
    description character varying(500),
    description_uz character varying(500),
    is_hidden boolean,
    price double precision,
    number integer,
    category_id integer,
    show_usd boolean,
    quantity integer
);


ALTER TABLE public.dishes OWNER TO telegrambot;

--
-- Name: dishes_id_seq; Type: SEQUENCE; Schema: public; Owner: telegrambot
--

CREATE SEQUENCE public.dishes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dishes_id_seq OWNER TO telegrambot;

--
-- Name: dishes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: telegrambot
--

ALTER SEQUENCE public.dishes_id_seq OWNED BY public.dishes.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: telegrambot
--

CREATE TABLE public.locations (
    id integer NOT NULL,
    latitude double precision,
    longitude double precision,
    address character varying(100),
    order_id integer
);


ALTER TABLE public.locations OWNER TO telegrambot;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: telegrambot
--

CREATE SEQUENCE public.locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_id_seq OWNER TO telegrambot;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: telegrambot
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- Name: notification_chats; Type: TABLE; Schema: public; Owner: telegrambot
--

CREATE TABLE public.notification_chats (
    chat_id integer NOT NULL,
    chat_title character varying(100)
);


ALTER TABLE public.notification_chats OWNER TO telegrambot;

--
-- Name: notification_chats_chat_id_seq; Type: SEQUENCE; Schema: public; Owner: telegrambot
--

CREATE SEQUENCE public.notification_chats_chat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notification_chats_chat_id_seq OWNER TO telegrambot;

--
-- Name: notification_chats_chat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: telegrambot
--

ALTER SEQUENCE public.notification_chats_chat_id_seq OWNED BY public.notification_chats.chat_id;


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: telegrambot
--

CREATE TABLE public.order_items (
    id integer NOT NULL,
    order_id integer,
    dish_id integer,
    count integer
);


ALTER TABLE public.order_items OWNER TO telegrambot;

--
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: telegrambot
--

CREATE SEQUENCE public.order_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_items_id_seq OWNER TO telegrambot;

--
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: telegrambot
--

ALTER SEQUENCE public.order_items_id_seq OWNED BY public.order_items.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: telegrambot
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id integer,
    user_name character varying(100),
    shipping_method character varying(50),
    payment_method character varying(50),
    address_txt character varying(100),
    phone_number character varying(15),
    confirmed boolean,
    confirmation_date timestamp without time zone,
    delivery_price integer,
    total_amount double precision,
    distance character varying(15)
);


ALTER TABLE public.orders OWNER TO telegrambot;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: telegrambot
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO telegrambot;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: telegrambot
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: registration_requests; Type: TABLE; Schema: public; Owner: telegrambot
--

CREATE TABLE public.registration_requests (
    id integer NOT NULL,
    user_id integer,
    phone_number character varying(20),
    tg_username character varying(100),
    username character varying(100),
    created_at timestamp without time zone
);


ALTER TABLE public.registration_requests OWNER TO telegrambot;

--
-- Name: registration_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: telegrambot
--

CREATE SEQUENCE public.registration_requests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_requests_id_seq OWNER TO telegrambot;

--
-- Name: registration_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: telegrambot
--

ALTER SEQUENCE public.registration_requests_id_seq OWNED BY public.registration_requests.id;


--
-- Name: user_admins; Type: TABLE; Schema: public; Owner: telegrambot
--

CREATE TABLE public.user_admins (
    id integer NOT NULL,
    email character varying(100),
    password_hash character varying(120)
);


ALTER TABLE public.user_admins OWNER TO telegrambot;

--
-- Name: user_admins_id_seq; Type: SEQUENCE; Schema: public; Owner: telegrambot
--

CREATE SEQUENCE public.user_admins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_admins_id_seq OWNER TO telegrambot;

--
-- Name: user_admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: telegrambot
--

ALTER SEQUENCE public.user_admins_id_seq OWNED BY public.user_admins.id;


--
-- Name: user_dish; Type: TABLE; Schema: public; Owner: telegrambot
--

CREATE TABLE public.user_dish (
    user_id integer NOT NULL,
    dish_id integer
);


ALTER TABLE public.user_dish OWNER TO telegrambot;

--
-- Name: user_dish_user_id_seq; Type: SEQUENCE; Schema: public; Owner: telegrambot
--

CREATE SEQUENCE public.user_dish_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_dish_user_id_seq OWNER TO telegrambot;

--
-- Name: user_dish_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: telegrambot
--

ALTER SEQUENCE public.user_dish_user_id_seq OWNED BY public.user_dish.user_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: telegrambot
--

CREATE TABLE public.users (
    id integer NOT NULL,
    full_user_name character varying(100),
    username character varying(100),
    phone_number character varying(15),
    language character varying(5),
    token character varying(50),
    confirmed boolean,
    telegram_id integer,
    registration_date timestamp without time zone,
    accept_policy boolean
);


ALTER TABLE public.users OWNER TO telegrambot;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: telegrambot
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO telegrambot;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: telegrambot
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: cart_items id; Type: DEFAULT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.cart_items ALTER COLUMN id SET DEFAULT nextval('public.cart_items_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: dish_categories id; Type: DEFAULT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.dish_categories ALTER COLUMN id SET DEFAULT nextval('public.dish_categories_id_seq'::regclass);


--
-- Name: dishes id; Type: DEFAULT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.dishes ALTER COLUMN id SET DEFAULT nextval('public.dishes_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- Name: notification_chats chat_id; Type: DEFAULT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.notification_chats ALTER COLUMN chat_id SET DEFAULT nextval('public.notification_chats_chat_id_seq'::regclass);


--
-- Name: order_items id; Type: DEFAULT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.order_items ALTER COLUMN id SET DEFAULT nextval('public.order_items_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: registration_requests id; Type: DEFAULT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.registration_requests ALTER COLUMN id SET DEFAULT nextval('public.registration_requests_id_seq'::regclass);


--
-- Name: user_admins id; Type: DEFAULT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.user_admins ALTER COLUMN id SET DEFAULT nextval('public.user_admins_id_seq'::regclass);


--
-- Name: user_dish user_id; Type: DEFAULT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.user_dish ALTER COLUMN user_id SET DEFAULT nextval('public.user_dish_user_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: telegrambot
--

COPY public.alembic_version (version_num) FROM stdin;
b4738f82e6d9
\.


--
-- Data for Name: cart_items; Type: TABLE DATA; Schema: public; Owner: telegrambot
--

COPY public.cart_items (id, user_id, dish_id, count) FROM stdin;
235	1294618325	\N	1
232	465632014	\N	1
236	1294618325	\N	2
233	465632014	\N	1
263	1294618325	7336	1
264	64925540	7336	5
265	758668569	7336	1
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: telegrambot
--

COPY public.comments (id, text, user_id, username) FROM stdin;
1	Yaxshi ⭐️⭐️⭐️⭐️	\N	⦑ NvrbckDowN ⦒
2	Сервис отличный! Спасибо.	\N	Точка Точковна.
9	Всё понравилось ⭐️⭐️⭐️⭐️⭐️	\N	⦑ NvrbckDowN ⦒
3	Привет	\N	Владимир Мякота
4	Всё понравилось ⭐️⭐️⭐️⭐️⭐️	\N	Владимир Мякота
5	Хороший сервис, спасибо	\N	Владимир Мякота
6	Оставляю отзыв	\N	Владимир Мякота
7	Всё понравилось ⭐️⭐️⭐️⭐️⭐️	\N	Владимир Мякота
8	Пишу отзыв	\N	Владимир Мякота
12	Хорошо	\N	Ram
10	Хорошо сделалм	\N	Владимир Мякота
11	Yaxshi ⭐️⭐️⭐️⭐️	\N	Владимир Мякота
\.


--
-- Data for Name: dish_categories; Type: TABLE DATA; Schema: public; Owner: telegrambot
--

COPY public.dish_categories (id, name, name_uz, number, lft, rgt, level, tree_id, parent_id, image_id, image_path) FROM stdin;
2995	Ахтамар	\N	1	29	30	3	4	3060	\N	\N
3058	Местное	\N	1	2	3	2	14	3039	\N	\N
3039	Вино	\N	1	1	6	1	14	\N	\N	\N
2842	Виски	\N	1	1	52	1	1	\N	\N	\N
3059	Импортное	\N	1	4	5	2	14	3039	\N	\N
2844	Jameson	\N	1	3	4	3	1	2843	\N	\N
2991	JP Chenet XO	\N	1	33	34	3	4	3060	\N	\N
2843	Ирландский	\N	1	2	7	2	1	2842	\N	\N
2845	Proper No. Twelve 40%	\N	1	5	6	3	1	2843	\N	\N
3068	Pulsar	\N	1	113	114	3	2	2915	\N	\N
2927	Stella Artois(бут)	\N	1	87	88	3	2	2915	\N	\N
2928	Bud King of Beers	\N	1	89	90	3	2	2915	\N	\N
2846	Американский	\N	1	8	11	2	1	2842	\N	\N
2847	Jack Daniels Black 40%	\N	1	9	10	3	1	2846	\N	\N
2932	Крушовице(Ж\\Б)	\N	1	97	98	3	2	2915	\N	\N
2933	Гессер(бут)	\N	1	99	100	3	2	2915	\N	\N
2934	Гессер(Ж\\Б)	\N	1	101	102	3	2	2915	\N	\N
2935	Эдельвейс(Ж\\Б)	\N	1	103	104	3	2	2915	\N	\N
2936	Эдельвейс(бут)	\N	1	105	106	3	2	2915	\N	\N
2921	Grolch	\N	1	75	76	3	2	2915	\N	\N
2922	Amsterdamt	\N	1	77	78	3	2	2915	\N	\N
2923	Amsterdamt(Ж\\Б)	\N	1	79	80	3	2	2915	\N	\N
3070	Жигулёвское	\N	1	60	61	4	2	3069	\N	\N
2912	Рижское	\N	2	50	51	4	2	3067	\N	\N
2886	Munchen	\N	1	46	47	4	2	3067	\N	\N
3062	Sarbast Original UNFILTERED	\N	1	22	23	4	2	3061	\N	\N
3063	Балтика	\N	1	14	15	4	2	3061	\N	\N
3066	Braufest	\N	1	43	44	3	2	2871	\N	\N
2874	Sarbast Original	\N	1	18	19	4	2	3061	\N	\N
2899	Portland Original	\N	1	48	49	4	2	3067	\N	\N
2903	Qibray ж\\б	\N	1	7	8	3	2	2871	\N	\N
3060	Импортный	\N	1	18	35	2	4	2981	\N	\N
2981	Коньяк	\N	1	1	36	1	4	\N	\N	\N
2994	Арарат-5 40%	\N	1	31	32	3	4	3060	\N	\N
2953	Российская	\N	1	26	49	2	3	2940	\N	\N
3003	Captain Morgan Black Label (Jamaica) 40%	\N	1	2	3	2	7	3002	\N	\N
2920	Велкопоповицкий Козёл(Ж\\Б)	\N	1	73	74	3	2	2915	\N	\N
3069	Пиво Pulsar	\N	1	53	62	3	2	2871	\N	\N
2870	Пиво	\N	1	1	116	1	2	\N	\N	\N
2892	Английский Эль	\N	1	40	41	4	2	3064	\N	\N
2897	Яблочный сидр	\N	1	38	39	4	2	3064	\N	\N
2966	Finlandia	\N	1	51	52	3	3	2965	\N	\N
2967	Grey Goose	\N	1	53	54	3	3	2965	\N	\N
2906	Бочка Свежего	\N	1	58	59	4	2	3069	\N	\N
2904	Бочка Крепкого	\N	1	56	57	4	2	3069	\N	\N
2969	Smirnoff Red	\N	1	57	58	3	3	2965	\N	\N
2970	Absolut Berri Acai	\N	1	59	60	3	3	2965	\N	\N
2974	Absolut Mandarin	\N	1	67	68	3	3	2965	\N	\N
2978	Absolut vodka Raspberry	\N	1	75	76	3	3	2965	\N	\N
2975	Absolut vodka Citron	\N	1	69	70	3	3	2965	\N	\N
2942	Лёгкая Воздух Альфа	\N	1	3	4	3	3	2941	\N	\N
2976	Absolut vodka EOY Love	\N	1	71	72	3	3	2965	\N	\N
2972	Absolut Kurant	\N	1	63	64	3	3	2965	\N	\N
2943	Лёгкая Воздух	\N	1	5	6	3	3	2941	\N	\N
2973	Absolut Lime	\N	1	65	66	3	3	2965	\N	\N
2979	Absolut vodka Vanilia	\N	1	77	78	3	3	2965	\N	\N
2944	Талка	\N	1	7	8	3	3	2941	\N	\N
2977	Absolut vodka Pears	\N	1	73	74	3	3	2965	\N	\N
2971	Absolut Elyx	\N	1	61	62	3	3	2965	\N	\N
2945	Белое Солнце	\N	1	9	10	3	3	2941	\N	\N
2980	Absolut vodka	\N	1	79	80	3	3	2965	\N	\N
2946	ROYAL ELITE GOLD	\N	1	11	12	3	3	2941	\N	\N
2947	SENATOR	\N	1	13	14	3	3	2941	\N	\N
2948	Белое Золото	\N	1	15	16	3	3	2941	\N	\N
2949	Тошкент Окшоми	\N	1	17	18	3	3	2941	\N	\N
2950	OLIGARCH	\N	1	19	20	3	3	2941	\N	\N
2951	Тройка	\N	1	21	22	3	3	2941	\N	\N
2992	Metaxa 5*38°	\N	1	27	28	3	4	3060	\N	\N
2941	Местная	\N	1	2	25	2	3	2940	\N	\N
2952	Alfa	\N	1	23	24	3	3	2941	\N	\N
2993	Арарат-3 40%	\N	1	25	26	3	4	3060	\N	\N
2954	Столичная север	\N	1	27	28	3	3	2953	\N	\N
2955	Столичная	\N	1	29	30	3	3	2953	\N	\N
2956	Царская Оригинальная	\N	1	31	32	3	3	2953	\N	\N
2957	Царская Золотая	\N	1	33	34	3	3	2953	\N	\N
2958	Воздух	\N	1	35	36	3	3	2953	\N	\N
2959	Русский лёд	\N	1	37	38	3	3	2953	\N	\N
2960	Беленькая золотая	\N	1	39	40	3	3	2953	\N	\N
2961	Беленькая люкс, 40%	\N	1	41	42	3	3	2953	\N	\N
2962	Беленькая	\N	1	43	44	3	3	2953	\N	\N
2963	Белуга	\N	1	45	46	3	3	2953	\N	\N
2964	Kremlin Award 40%	\N	1	47	48	3	3	2953	\N	\N
2968	Belvedere	\N	1	55	56	3	3	2965	\N	\N
2940	Водка	\N	1	1	82	1	3	\N	\N	\N
2965	Европейская	\N	1	50	81	2	3	2940	\N	\N
2983	Самарканд	\N	1	3	4	3	4	2982	\N	\N
2984	Филатов	\N	1	5	6	3	4	2982	\N	\N
2985	Ташкент ХО	\N	1	7	8	3	4	2982	\N	\N
2986	Узбекистан	\N	1	9	10	3	4	2982	\N	\N
2987	Bagizagan Tanbour 5 лет	\N	1	11	12	3	4	2982	\N	\N
2988	Bagizagan Tanbour 7 лет	\N	1	13	14	3	4	2982	\N	\N
2982	Местный	\N	1	2	17	2	4	2981	\N	\N
2989	Bagizagan Tanbour special	\N	1	15	16	3	4	2982	\N	\N
2997	Bombay Sapphire, 47%	\N	1	2	3	2	6	2996	\N	\N
2998	Gordon's Dry Gin, 37.5%	\N	1	4	5	2	6	2996	\N	\N
2999	Gordon's Dry Gin, 47.3%	\N	1	6	7	2	6	2996	\N	\N
3000	Tanqueray London dry gin, 43,1%	\N	1	8	9	2	6	2996	\N	\N
2996	Джин	\N	1	1	12	1	6	\N	\N	\N
3001	Beefeater, 47%	\N	1	10	11	2	6	2996	\N	\N
3004	Captain Morgan Spiced Gold, 35%	\N	1	4	5	2	7	3002	\N	\N
3005	Captain Morgan White, 37.5%	\N	1	6	7	2	7	3002	\N	\N
3006	Bacardi OakHeart, 35%	\N	1	8	9	2	7	3002	\N	\N
3007	Bacardi Rum Carta Blanca, 40%	\N	1	10	11	2	7	3002	\N	\N
3008	Bacardi Rum Gold, 40%	\N	1	12	13	2	7	3002	\N	\N
3002	Ром	\N	1	1	16	1	7	\N	\N	\N
3009	Bacardi Rum Premium Black 40%	\N	1	14	15	2	7	3002	\N	\N
2926	Budweiser beer 5%(Ж\\Б)	\N	1	85	86	3	2	2915	\N	\N
3011	Martini Bianco, 15%	\N	1	2	3	2	8	3010	\N	\N
2929	Амстел(Ж\\Б)	\N	1	91	92	3	2	2915	\N	\N
3012	Martini Extra dry, 18%	\N	1	4	5	2	8	3010	\N	\N
2930	Аффлигем блонд(бут)	\N	1	93	94	3	2	2915	\N	\N
3013	Martini Rossato, 15%	\N	1	6	7	2	8	3010	\N	\N
2931	Аффлигем блонд(Ж\\Б)	\N	1	95	96	3	2	2915	\N	\N
3014	Martini Rose, 9,5%	\N	1	8	9	2	8	3010	\N	\N
2937	Heineken Premium Quality(бут)	\N	1	107	108	3	2	2915	\N	\N
2938	Heineken Bier(бут)	\N	1	109	110	3	2	2915	\N	\N
3018	Olmeca Blanco, 38%	\N	1	2	3	2	9	3017	\N	\N
2896	Сухой сидр	\N	1	30	31	4	2	3064	\N	\N
3019	Olmeca Blanco, 40%	\N	1	4	5	2	9	3017	\N	\N
3010	Вермут	\N	1	1	10	1	8	\N	\N	\N
3020	Olmeca Gold, 38%	\N	1	6	7	2	9	3017	\N	\N
3017	Текила	\N	1	1	10	1	9	\N	\N	\N
3021	Olmeca Gold, 40%	\N	1	8	9	2	9	3017	\N	\N
3055	Шампанское	\N	1	1	10	1	18	\N	\N	\N
3057	Импорт	\N	1	4	9	2	18	3055	\N	\N
3015	Martini Brut, 11,5%	\N	1	7	8	3	18	3057	\N	\N
3016	Martini Prosecco, 11,5%	\N	1	5	6	3	18	3057	\N	\N
2893	Вишневый Стаут(бут)	\N	1	36	37	4	2	3064	\N	\N
2850	Johnnie Walker Black Label 43%	\N	1	27	28	3	1	2848	\N	\N
2891	Kriek бут	\N	1	28	29	4	2	3064	\N	\N
3032	Абсент	\N	1	1	4	1	12	\N	\N	\N
3033	Fruko Schulz Absinth, 60%	\N	1	2	3	2	12	3032	\N	\N
2900	Pulsar Silver	\N	1	54	55	4	2	3069	\N	\N
2902	Qibray	\N	1	5	6	3	2	2871	\N	\N
2849	Johnnie Walker 18YO GB	\N	1	25	26	3	1	2848	\N	\N
2851	Johnnie Walker Red Label	\N	1	29	30	3	1	2848	\N	\N
2854	William Lawson	\N	1	35	36	3	1	2848	\N	\N
2852	White Horse	\N	1	31	32	3	1	2848	\N	\N
2853	White Horse GB	\N	1	33	34	3	1	2848	\N	\N
2856	Ballantine's Finest	\N	1	39	40	3	1	2848	\N	\N
2859	Chivas Regal 18YO	\N	1	45	46	3	1	2848	\N	\N
2855	William Lawson's	\N	1	37	38	3	1	2848	\N	\N
2858	Chivas Regal 12YO	\N	1	43	44	3	1	2848	\N	\N
2860	Macallan Triple Cask 12YO GB	\N	1	47	48	3	1	2848	\N	\N
2857	Dewar's 12YO	\N	1	41	42	3	1	2848	\N	\N
3023	Sheridans, 15.5%	\N	1	4	5	2	10	3022	\N	\N
3024	Becherovka, 38%	\N	1	6	7	2	10	3022	\N	\N
3025	Malibu, 21%	\N	1	8	9	2	10	3022	\N	\N
3036	SARAJISHVILI 3*	\N	1	23	24	3	4	3060	\N	\N
3037	SARAJISHVILI 5*	\N	1	21	22	3	4	3060	\N	\N
3026	Aperol Barbieri, 11%	\N	1	10	11	2	10	3022	\N	\N
3027	Cointreau, 40%	\N	1	12	13	2	10	3022	\N	\N
3028	Sambuca Extra Malinari, 40%	\N	1	14	15	2	10	3022	\N	\N
3022	Ликёр	\N	1	1	18	1	10	\N	\N	\N
3029	Campari, 41%	\N	1	16	17	2	10	3022	\N	\N
3053	Напитки	\N	1	1	2	1	16	\N	\N	\N
3031	Jagermeister, 35%	\N	1	2	3	2	10	3022	\N	\N
3038	Sarajishvili VS 	\N	1	19	20	3	4	3060	\N	\N
3056	Местное	\N	1	2	3	2	18	3055	\N	\N
2898	Olmaliq	\N	1	3	4	3	2	2871	\N	\N
2915	Импорт	\N	1	64	115	2	2	2870	\N	\N
2939	Hoegaarden Wit Bianche	\N	1	111	112	3	2	2915	\N	\N
2924	Сибирская Корона(бут)	\N	1	81	82	3	2	2915	\N	\N
2925	Budweiser beer 5%(бут)	\N	1	83	84	3	2	2915	\N	\N
2871	Местное	\N	1	2	63	2	2	2870	\N	\N
2864	Clan MacGregor	\N	1	21	22	3	1	2848	\N	\N
2868	Glenfiddich 12YO GB	\N	1	19	20	3	1	2848	\N	\N
2867	Monkey Shoulder	\N	1	17	18	3	1	2848	\N	\N
2866	Grant's triple Wood 	\N	1	15	16	3	1	2848	\N	\N
2865	Grant's triple Wood GB	\N	1	13	14	3	1	2848	\N	\N
2861	Macallan Triple Cask 15YO GB 43%	\N	1	49	50	3	1	2848	\N	\N
2869	Glenfiddich 15YO GB	\N	1	23	24	3	1	2848	\N	\N
2916	Corona Extra	\N	1	65	66	3	2	2915	\N	\N
2917	Efes Pilsener	\N	1	67	68	3	2	2915	\N	\N
2918	Efes Pilsener(бут)	\N	1	69	70	3	2	2915	\N	\N
2919	Велкопоповицкий Козёл	\N	1	71	72	3	2	2915	\N	\N
2911	Нагдаун бакл	\N	2	9	10	3	2	2871	\N	\N
2873	Sarbast Lite	\N	1	20	21	4	2	3061	\N	\N
2880	Sarbast Special	\N	1	16	17	4	2	3061	\N	\N
3061	Sarbast	\N	1	13	26	3	2	2871	\N	\N
3064	Крафт	\N	1	27	42	3	2	2871	\N	\N
2895	Медовое(бут)	\N	1	34	35	4	2	3064	\N	\N
2894	Жигули копейка	\N	1	32	33	4	2	3064	\N	\N
3065	Tuborg	\N	1	24	25	4	2	3061	\N	\N
2914	Юнусобод бакл	\N	2	11	12	3	2	2871	\N	\N
3067	Пиво Мехнат	\N	1	45	52	3	2	2871	\N	\N
2848	Шотландский	\N	1	12	51	2	1	2842	\N	\N
\.


--
-- Data for Name: dishes; Type: TABLE DATA; Schema: public; Owner: telegrambot
--

COPY public.dishes (id, name, name_uz, image_id, image_path, description, description_uz, is_hidden, price, number, category_id, show_usd, quantity) FROM stdin;
7084	0.5л	\N	\N	\N	Jameson	\N	f	275000	1	2844	f	7
7085	0.7л	\N	\N	\N	Jameson	\N	f	375000	1	2844	f	7
7086	1л	\N	\N	\N	Jameson	\N	f	587000	1	2844	f	7
7087	0.7л	\N	\N	\N	Proper No. Twelve 40%	\N	f	500000	1	2845	f	10
7088	0,7 л	\N	\N	\N	Jack Daniels Black 40%	\N	f	553000	1	2847	f	10
7089	1 л	\N	\N	\N	Jack Daniels Black 40%	\N	f	637000	1	2847	f	10
7090	0,5 л	\N	\N	\N	Jack Daniels Black 40%	\N	f	445000	1	2847	f	10
7091	0,7 л	\N	\N	\N	Johnnie Walker 18YO GB 40%	\N	f	1325000	1	2849	f	10
7092	0,75 л	\N	\N	\N	Johnnie Walker Black Label 43%	\N	f	443000	1	2850	f	10
7093	1 л	\N	\N	\N	Johnnie Walker Black Label 43%	\N	f	567000	1	2850	f	10
7094	0,5 л	\N	\N	\N	Johnnie Walker Black Label 43%	\N	f	316000	1	2850	f	10
7095	0,5 л	\N	\N	\N	Johnnie Walker Red Label 40%	\N	f	184000	1	2851	f	10
7096	0,75 л	\N	\N	\N	Johnnie Walker Red Label 40%	\N	f	259000	1	2851	f	10
7097	1 л	\N	\N	\N	Johnnie Walker Red Label 40%	\N	f	342000	1	2851	f	10
7098	0,5 л	\N	\N	\N	White Horse 40%	\N	f	203000	1	2852	f	10
7099	0,7 л	\N	\N	\N	White Horse GB 40%	\N	f	273000	1	2853	f	10
7100	1 л	\N	\N	\N	White Horse GB 40%	\N	f	377000	1	2853	f	10
7101	1 л	\N	\N	\N	William Lawson 40%	\N	f	326000	1	2854	f	10
7102	0,7 л	\N	\N	\N	William Lawson's 40%	\N	f	237000	1	2855	f	10
7103	0,5 л	\N	\N	\N	Ballantine's Finest 40%	\N	f	213000	1	2856	f	10
7104	0,7 л	\N	\N	\N	Ballantine's Finest 40%	\N	f	300000	1	2856	f	10
7105	1 л	\N	\N	\N	Ballantine's Finest 40%	\N	f	407000	1	2856	f	10
7106	1 л	\N	\N	\N	Dewar's 12YO 40%	\N	f	658000	1	2857	f	10
7107	0,375 л	\N	\N	\N	Chivas Regal 12YO 40%	\N	f	288000	1	2858	f	10
7108	0,5 л	\N	\N	\N	Chivas Regal 12YO 40%	\N	f	375000	1	2858	f	10
7109	0,7 л	\N	\N	\N	Chivas Regal 12YO 40%	\N	f	500000	1	2858	f	10
7110	1 л	\N	\N	\N	Chivas Regal 12YO 40%	\N	f	688000	1	2858	f	10
7111	0,7 л	\N	\N	\N	Chivas Regal 18YO 40%	\N	f	1100000	1	2859	f	10
7112	1 л	\N	\N	\N	Chivas Regal 18YO 40%	\N	f	1500000	1	2859	f	10
7113	0,7 л	\N	\N	\N	Macallan Triple Cask 12YO GB 40%	\N	f	1079000	1	2860	f	10
7114	1 л	\N	\N	\N	Macallan Triple Cask 15YO GB 43%	\N	f	1810000	1	2861	f	10
7117	0,7 л	\N	\N	\N	Clan MacGregor	\N	f	173500	1	2864	f	10
7118	1 л	\N	\N	\N	Clan MacGregor	\N	f	226500	1	2864	f	10
7119	1 л	\N	\N	\N	Grant's triple Wood GB	\N	f	348500	1	2865	f	10
7120	0,7 л	\N	\N	\N	Grant's triple Wood 	\N	f	258500	1	2866	f	10
7121	1 л	\N	\N	\N	Monkey Shoulder	\N	f	615000	1	2867	f	10
7122	0,7 л	\N	\N	\N	Monkey Shoulder	\N	f	474000	1	2867	f	10
7123	0,5 л	\N	\N	\N	Glenfiddich 12YO GB	\N	f	379000	1	2868	f	10
7124	0,7 л	\N	\N	\N	Glenfiddich 12YO GB	\N	f	578500	1	2868	f	10
7125	1 л	\N	\N	\N	Glenfiddich 12YO GB	\N	f	747000	1	2868	f	10
7126	0,7 л	\N	\N	\N	Glenfiddich 15YO GB	\N	f	868500	1	2869	f	10
7127	1 л	\N	\N	\N	Glenfiddich 15YO GB	\N	f	1053000	1	2869	f	10
7147	0,33 л	\N	\N	\N	Kriek(бут)	\N	f	15000	1	2891	f	10
7148	0,5 л	\N	\N	\N	Английский Эль	\N	f	15000	1	2892	f	10
7149	0,5 л	\N	\N	\N	Вишневый Стаут(бут)	\N	f	9000	1	2893	f	10
7150	0,5 л	\N	\N	\N	Жигули копейка	\N	f	7500	1	2894	f	10
7151	0,5 л	\N	\N	\N	Медовое(бут)	\N	f	9000	1	2895	f	10
7152	0,5 л	\N	\N	\N	Сухой сидр	\N	f	15000	1	2896	f	10
7153	0,5 л	\N	\N	\N	Яблочный сидр	\N	f	15000	1	2897	f	10
7154	1 л	\N	\N	\N	Olmaliq	\N	f	8500	1	2898	f	10
7155	1 л	\N	\N	\N	Olmaliq	\N	f	8000	1	2898	f	10
7156	0,5 л	\N	\N	\N	Portland Original	\N	f	5000	1	2899	f	10
7157	1,5 л	\N	\N	\N	Portland Original	\N	f	10000	1	2899	f	10
7158	1,5 л	\N	\N	\N	Pulsar Silver	\N	f	11000	1	2900	f	10
7159	2,3 л	\N	\N	\N	Pulsar Silver	\N	f	15000	1	2900	f	10
7161	1,5 л	\N	\N	\N	Qibray	\N	f	8000	1	2902	f	10
7162	0,5 л	\N	\N	\N	Qibray(Ж\\Б)	\N	f	5000	1	2903	f	10
7163	2,3 л	\N	\N	\N	Бочка Крепкого	\N	f	15500	1	2904	f	10
7165	2,3 л	\N	\N	\N	Бочка Свежего	\N	f	15000	1	2906	f	10
7131	0,5 л	\N	\N	\N	Sarbast Original (Ж\\Б)	\N	f	6500	1	\N	f	10
7135	0,5 л	\N	\N	\N	Sarbast Special (Ж\\Б)	\N	f	7000	1	\N	f	10
7133	1,5 л	\N	\N	\N	Sarbast Original (ПЭТ)	\N	f	10000	1	\N	f	10
7128	0,5 л	\N	\N	\N	Sarbast Lite (Ж\\Б)	\N	f	6500	1	\N	f	10
7134	0,5 л	\N	\N	\N	Sarbast Special	\N	f	6000	1	\N	f	10
7132	0,45 л	\N	\N	\N	Sarbast Original UNFILTERED(Ж\\Б)	\N	f	7000	1	\N	f	10
7130	0,5 ж\\б	\N	\N	\N	Sarbast Original	\N	f	5500	1	2874	f	10
7136	1,5 пэт	\N	\N	\N	Sarbast Special (ПЭТ)	\N	f	11000	1	2880	f	10
7139	0,5 л	\N	\N	\N	Балтика 7	\N	f	9000	1	\N	f	10
7141	0,5 л	\N	\N	\N	Балтика 9	\N	f	10000	1	\N	f	10
7140	0,5 л	\N	\N	\N	Балтика 7(Ж\\Б)	\N	f	10000	1	\N	f	10
7138	0,5 л	\N	\N	\N	Tuborg Green (Ж\\Б)	\N	f	9000	1	\N	f	10
7137	0,5 л	\N	\N	\N	Tuborg Green	\N	f	8000	1	\N	f	10
7167	1,25 л	\N	\N	\N	Бранфест	\N	f	10500	1	\N	f	10
7145	1,25 л	\N	\N	\N	Braufest(ПЭТ)	\N	f	11000	1	\N	f	10
7144	0,5 л	\N	\N	\N	Buchinger(бут)	\N	f	8000	1	\N	f	10
7146	1,25 л	\N	\N	\N	Craft Lager(ПЭТ)	\N	f	11000	1	\N	f	10
7143	0,5 л	\N	\N	\N	Рижское	\N	f	5000	1	\N	f	10
7142	0,5 бут	\N	\N	\N	MUNCHEN(бут)	\N	f	7500	1	2886	f	10
7164	0,45 л	\N	\N	\N	Бочка Крепкого(Ж\\Б)	\N	f	6500	1	\N	f	10
7166	0,45 л	\N	\N	\N	Бочка Свежего(Ж\\Б)	\N	f	6000	1	\N	f	10
7160	0,45 л	\N	\N	\N	Pulsar Silver(Ж\\Б)	\N	f	6000	1	\N	f	10
7170	2,5 л	\N	\N	\N	Нагдаун(бакл)	\N	f	14000	1	2911	f	10
7171	1,25 л	\N	\N	\N	Рижское(бакл)	\N	f	8500	1	2912	f	10
7172	2,3 л	\N	\N	\N	Рижское(бакл)	\N	f	15000	1	2912	f	10
7174	2,5 л	\N	\N	\N	Юнусобод(бакл)	\N	f	13000	1	2914	f	10
7175	0,35 л	\N	\N	\N	Corona Extra	\N	f	42000	1	2916	f	10
7176	0,45 л	\N	\N	\N	Efes Pilsener	\N	f	21000	1	2917	f	10
7177	0,45 л	\N	\N	\N	Efes Pilsener(бут)	\N	f	20500	1	2918	f	10
7178	0,5 л	\N	\N	\N	Велкопоповицкий Козёл	\N	f	21000	1	2919	f	10
7179	0,5 л	\N	\N	\N	Велкопоповицкий Козёл(Ж\\Б)	\N	f	20500	1	2920	f	10
7180	0,5 л	\N	\N	\N	Grolch	\N	f	21500	1	2921	f	10
7181	0,5 л	\N	\N	\N	Amsterdamt	\N	f	21000	1	2922	f	10
7182	0,45 л	\N	\N	\N	Amsterdamt(Ж\\Б)	\N	f	20500	1	2923	f	10
7183	0,5 л	\N	\N	\N	Сибирская Корона(бут)	\N	f	18000	1	2924	f	10
7184	0,33 л	\N	\N	\N	Budweiser beer 5%(бут)	\N	f	27000	1	2925	f	10
7185	0,33 л	\N	\N	\N	Budweiser beer 5%(Ж\\Б)	\N	f	25500	1	2926	f	10
7186	0,5 л	\N	\N	\N	Stella Artois(бут)	\N	f	24000	1	2927	f	10
7187	0,5 л	\N	\N	\N	Bud King of Beers	\N	f	24000	1	2928	f	10
7188	0,45 л	\N	\N	\N	Амстел(Ж\\Б)	\N	f	21500	1	2929	f	10
7189	0,4 л	\N	\N	\N	Аффлигем блонд(бут)	\N	f	22000	1	2930	f	10
7190	0,45 л	\N	\N	\N	Аффлигем блонд(Ж\\Б)	\N	f	23500	1	2931	f	10
7191	0,45 л	\N	\N	\N	Крушовице(Ж\\Б)	\N	f	22000	1	2932	f	10
7192	0,45 л	\N	\N	\N	Гессер(бут)	\N	f	22000	1	2933	f	10
7193	0,45 л	\N	\N	\N	Гессер(Ж\\Б)	\N	f	22000	1	2934	f	10
7194	0,45 л	\N	\N	\N	Эдельвейс(Ж\\Б)	\N	f	22500	1	2935	f	10
7195	0,45 л	\N	\N	\N	Эдельвейс(бут)	\N	f	22000	1	2936	f	10
7196	0,33 л	\N	\N	\N	Heineken Premium Quality(бут)	\N	f	19500	1	2937	f	10
7197	0,5 л	\N	\N	\N	Heineken Bier(бут)	\N	f	25000	1	2938	f	10
7198	0,5 л	\N	\N	\N	Hoegaarden Wit Bianche	\N	f	25500	1	2939	f	10
7199	0,5 л	\N	\N	\N	Лёгкая Воздух Альфа	\N	f	30000	1	2942	f	10
7200	0,7 л	\N	\N	\N	Лёгкая Воздух Альфа	\N	f	41000	1	2942	f	10
7201	0,5 л	\N	\N	\N	Лёгкая Воздух	\N	f	26000	1	2943	f	10
7202	0,7 л	\N	\N	\N	Лёгкая Воздух	\N	f	35000	1	2943	f	10
7203	0,5 л	\N	\N	\N	Талка	\N	f	25500	1	2944	f	10
7204	0,75 л	\N	\N	\N	Талка	\N	f	34500	1	2944	f	10
7205	0,75 л	\N	\N	\N	Белое Солнце	\N	f	45000	1	2945	f	10
7206	1 л	\N	\N	\N	Белое Солнце	\N	f	55500	1	2945	f	10
7207	0,5 л	\N	\N	\N	Белое Солнце	\N	f	34500	1	2945	f	10
7208	0,75 л	\N	\N	\N	ROYAL ELITE GOLD	\N	f	48500	1	2946	f	10
7209	0,75 л	\N	\N	\N	SENATOR	\N	f	43500	1	2947	f	10
7210	0,75 л	\N	\N	\N	Белое Золото	\N	f	58000	1	2948	f	10
7211	0,5 л	\N	\N	\N	Тошкент Окшоми	\N	f	23000	1	2949	f	10
7212	0,7 л	\N	\N	\N	Тошкент Окшоми	\N	f	30000	1	2949	f	10
7213	1 л	\N	\N	\N	Тошкент Окшоми	\N	f	40500	1	2949	f	10
7214	0,5 л	\N	\N	\N	OLIGARCH	\N	f	23000	1	2950	f	10
7215	0,7 л	\N	\N	\N	OLIGARCH	\N	f	30000	1	2950	f	10
7216	1 л	\N	\N	\N	OLIGARCH	\N	f	39500	1	2950	f	10
7217	0,5 л	\N	\N	\N	Белое Золото	\N	f	39000	1	2948	f	10
7218	0,7 л	\N	\N	\N	Белое Золото	\N	f	47000	1	2948	f	10
7219	0,7 л	\N	\N	\N	Тройка	\N	f	30000	1	2951	f	10
7220	0,5 л	\N	\N	\N	Тройка	\N	f	22000	1	2951	f	10
7221	1 л	\N	\N	\N	Тройка	\N	f	38500	1	2951	f	10
7222	0,75 л	\N	\N	\N	Alfa	\N	f	71500	1	2952	f	10
7223	0,5 л	\N	\N	\N	Столичная север	\N	f	119000	1	2954	f	10
7224	0,75 л	\N	\N	\N	Столичная север	\N	f	172000	1	2954	f	10
7225	0,5 л	\N	\N	\N	Столичная	\N	f	119000	1	2955	f	10
7226	0,75 л	\N	\N	\N	Столичная	\N	f	172000	1	2955	f	10
7227	1 л	\N	\N	\N	Царская Оригинальная	\N	f	262000	1	2956	f	10
7228	0,5 л	\N	\N	\N	Царская Оригинальная	\N	f	134000	1	2956	f	10
7229	0,7 л	\N	\N	\N	Царская Оригинальная	\N	f	185000	1	2956	f	10
7230	1 л	\N	\N	\N	Царская Золотая	\N	f	324000	1	2957	f	10
7231	0,5 л	\N	\N	\N	Царская Золотая	\N	f	183000	1	2957	f	10
7232	0,7 л	\N	\N	\N	Царская Золотая	\N	f	252000	1	2957	f	10
7233	0,5 л	\N	\N	\N	Воздух	\N	f	129000	1	2958	f	10
7234	0,5 л	\N	\N	\N	Русский лёд	\N	f	137000	1	2959	f	10
7235	0,7 л	\N	\N	\N	Русский лёд	\N	f	194000	1	2959	f	10
7236	1 л	\N	\N	\N	Русский лёд	\N	f	271000	1	2959	f	10
7237	1 л	\N	\N	\N	Беленькая золотая	\N	f	262000	1	2960	f	10
7238	0,5 л	\N	\N	\N	Беленькая золотая	\N	f	135000	1	2960	f	10
7239	0,7 л	\N	\N	\N	Беленькая золотая	\N	f	182000	1	2960	f	10
7240	0,5 л	\N	\N	\N	Беленькая люкс, 40%	\N	f	135000	1	2961	f	10
7241	1 л	\N	\N	\N	Беленькая	\N	f	260000	1	2962	f	10
7242	0,5 л	\N	\N	\N	Беленькая	\N	f	134000	1	2962	f	10
7243	0,7 л	\N	\N	\N	Беленькая	\N	f	179000	1	2962	f	10
7244	0,7 л	\N	\N	\N	Белуга	\N	f	508000	1	2963	f	10
7245	1 л	\N	\N	\N	Белуга	\N	f	657000	1	2963	f	10
7246	0,5 л	\N	\N	\N	Kremlin Award 40%	\N	f	310000	1	2964	f	10
7247	0,7 л	\N	\N	\N	Kremlin Award 40%	\N	f	405000	1	2964	f	10
7248	1 л	\N	\N	\N	Kremlin Award 40%	\N	f	552000	1	2964	f	10
7249	0,7 л	\N	\N	\N	Finlandia 40%	\N	f	276000	1	2966	f	10
7169	0,45 л	\N	\N	\N	Жигулёвское (Ж\\Б)	\N	f	18000	1	\N	f	10
7168	1,5 л	\N	\N	\N	Жигулёвское оригинал Pulsar	\N	f	11000	1	\N	f	10
7250	1 л	\N	\N	\N	Finlandia 40%	\N	f	327000	1	2966	f	10
7251	1 л	\N	\N	\N	Grey Goose 40%	\N	f	652000	1	2967	f	10
7252	0,7 л	\N	\N	\N	Grey Goose 40%	\N	f	508000	1	2967	f	10
7253	0,7 л	\N	\N	\N	Belvedere	\N	f	450000	1	2968	f	10
7254	1 л	\N	\N	\N	Belvedere	\N	f	551000	1	2968	f	10
7255	0,5 л	\N	\N	\N	Smirnoff Red 40%	\N	f	185000	1	2969	f	10
7256	1 л	\N	\N	\N	Smirnoff Red 40%	\N	f	324000	1	2969	f	10
7257	0,75 л	\N	\N	\N	Smirnoff Red 40%	\N	f	263000	1	2969	f	10
7258	0,7 л	\N	\N	\N	Absolut Berri Acai 40%	\N	f	269000	1	2970	f	10
7259	0,7 л	\N	\N	\N	Absolut Elyx 40%	\N	f	469000	1	2971	f	10
7260	1 л	\N	\N	\N	Absolut Kurant 40%	\N	f	394000	1	2972	f	10
7261	0,7 л	\N	\N	\N	Absolut Lime 40%	\N	f	269000	1	2973	f	10
7262	1 л	\N	\N	\N	Absolut Mandarin 40%	\N	f	394000	1	2974	f	10
7263	0,5 л	\N	\N	\N	Absolut vodka Citron 40%	\N	f	200000	1	2975	f	10
7264	0,7 л	\N	\N	\N	Absolut vodka Citron 40%	\N	f	269000	1	2975	f	10
7265	1 л	\N	\N	\N	Absolut vodka Citron 40%	\N	f	394000	1	2975	f	10
7266	0,7 л	\N	\N	\N	Absolut vodka EOY Love 40%	\N	f	269000	1	2976	f	10
7267	0,7 л	\N	\N	\N	Absolut vodka Pears 40%	\N	f	269000	1	2977	f	10
7268	0,7 л	\N	\N	\N	Absolut vodka Raspberry 40%	\N	f	269000	1	2978	f	10
7269	0,7 л	\N	\N	\N	Absolut vodka Vanilia 40%	\N	f	269000	1	2979	f	10
7270	0,05 л	\N	\N	\N	Absolut vodka 40%	\N	f	22000	1	2980	f	10
7271	0,375 л	\N	\N	\N	Absolut vodka 40%	\N	f	150000	1	2980	f	10
7272	0,5 л	\N	\N	\N	Absolut vodka 40%	\N	f	178000	1	2980	f	10
7273	0,7 л	\N	\N	\N	Absolut vodka 40%	\N	f	269000	1	2980	f	10
7274	1 л	\N	\N	\N	Absolut vodka 40%	\N	f	388000	1	2980	f	10
7275	0,5 л	\N	\N	\N	Самарканд	\N	f	24500	1	2983	f	10
7276	0,5 л	\N	\N	\N	Филатов	\N	f	75000	1	2984	f	10
7277	0,5 л	\N	\N	\N	Ташкент ХО	\N	f	88000	1	2985	f	10
7278	0,5 л	\N	\N	\N	Узбекистан	\N	f	38000	1	2986	f	10
7279	0,7 л	\N	\N	\N	Узбекистан	\N	f	199000	1	2986	f	10
7280	0,5 л	\N	\N	\N	Узбекистан	\N	f	71000	1	2986	f	10
7281	0,5 л	\N	\N	\N	Bagizagan Tanbour 5 лет	\N	f	100000	1	2987	f	10
7282	0,7 л	\N	\N	\N	Bagizagan Tanbour 5 лет	\N	f	119000	1	2987	f	10
7283	0,5 л	\N	\N	\N	Bagizagan Tanbour 7 лет	\N	f	131500	1	2988	f	10
7284	0,7 л	\N	\N	\N	Bagizagan Tanbour 7 лет	\N	f	122000	1	2988	f	10
7285	0,5 л	\N	\N	\N	Bagizagan Tanbour special	\N	f	71500	1	2989	f	10
7286	0,7 л	\N	\N	\N	JP Chenet XO 40%	\N	f	257000	1	2991	f	10
7287	0,7 л	\N	\N	\N	Metaxa 5*38°	\N	f	327000	1	2992	f	10
7288	0,5 л	\N	\N	\N	Арарат-3 40%	\N	f	188000	1	2993	f	10
7289	0,5 л	\N	\N	\N	Арарат-5 40%	\N	f	213000	1	2994	f	10
7290	0,5 л	\N	\N	\N	Ахтамар 40%	\N	f	350000	1	2995	f	10
7291	1 л	\N	\N	\N	Bombay Sapphire, 47%	\N	f	567000	1	2997	f	10
7292	0,7 л	\N	\N	\N	Gordon's Dry Gin, 37.5%	\N	f	294000	1	2998	f	10
7293	1 л	\N	\N	\N	Gordon's Dry Gin, 47.3%	\N	f	343000	1	2999	f	10
7294	0,7 л	\N	\N	\N	Tanqueray London dry gin, 43,1%	\N	f	395000	1	3000	f	10
7295	1 л	\N	\N	\N	Tanqueray London dry gin, 43,1%	\N	f	520000	1	3000	f	10
7296	0,375 л	\N	\N	\N	Beefeater, 47%	\N	f	169000	1	3001	f	10
7297	0,5 л	\N	\N	\N	Beefeater, 47%	\N	f	213000	1	3001	f	10
7298	0,7 л	\N	\N	\N	Beefeater, 47%	\N	f	300000	1	3001	f	10
7299	1 л	\N	\N	\N	Beefeater, 47%	\N	f	419000	1	3001	f	10
7300	0,7 л	\N	\N	\N	Captain Morgan Black Label (Jamaica), 40%	\N	f	304000	1	3003	f	10
7301	1 л	\N	\N	\N	Captain Morgan Black Label (Jamaica), 40%	\N	f	398000	1	3003	f	10
7302	1 л	\N	\N	\N	Captain Morgan Spiced Gold, 35%	\N	f	384000	1	3004	f	10
7303	0,7 л	\N	\N	\N	Captain Morgan White, 37.5%	\N	f	277000	1	3005	f	10
7304	1 л	\N	\N	\N	Captain Morgan White, 37.5%	\N	f	369000	1	3005	f	10
7305	1 л	\N	\N	\N	Bacardi OakHeart, 35%	\N	f	416000	1	3006	f	10
7306	1 л	\N	\N	\N	Bacardi Rum Carta Blanca, 40%	\N	f	371000	1	3007	f	10
7307	1 л	\N	\N	\N	Bacardi Rum Gold, 40%	\N	f	420000	1	3008	f	10
7308	1 л	\N	\N	\N	Bacardi Rum Premium Black, 40%	\N	f	379000	1	3009	f	10
7309	0,5 л	\N	\N	\N	Martini Bianco, 15%	\N	f	183000	1	3011	f	10
7310	1 л	\N	\N	\N	Martini Bianco, 15%	\N	f	279000	1	3011	f	10
7311	1 л	\N	\N	\N	Martini Extra dry, 18%	\N	f	348000	1	3012	f	10
7312	1 л	\N	\N	\N	Martini Rossato, 15%	\N	f	348000	1	3013	f	10
7313	1 л	\N	\N	\N	Martini Rossato, 15%	\N	f	348000	1	3013	f	10
7314	0,75 л	\N	\N	\N	Martini Rose, 9,5%	\N	f	316000	1	3014	f	10
7315	0,75 л	\N	\N	\N	Martini Brut, 11,5%	\N	f	316000	1	3015	f	10
7316	0,75 л	\N	\N	\N	Martini Prosecco, 11,5%	\N	f	316000	1	3016	f	10
7317	1 л	\N	\N	\N	Olmeca Blanco, 38%	\N	f	494000	1	3018	f	10
7318	0,7 л	\N	\N	\N	Olmeca Blanco, 40%	\N	f	363000	1	3019	f	10
7319	0,5 л	\N	\N	\N	Olmeca Gold, 38%	\N	f	263000	1	3020	f	10
7320	1 л	\N	\N	\N	Olmeca Gold, 40%	\N	f	494000	1	3021	f	10
7321	0,7 л	\N	\N	\N	Sheridans, 15.5%	\N	f	369000	1	3023	f	10
7322	1 л	\N	\N	\N	Sheridans, 15.5%	\N	f	482000	1	3023	f	10
7323	0,5 л	\N	\N	\N	Sheridans, 15.5%	\N	f	306000	1	3023	f	10
7324	0,5 л	\N	\N	\N	Becherovka, 38%	\N	f	194000	1	3024	f	10
7325	1 л	\N	\N	\N	Becherovka, 38%	\N	f	375000	1	3024	f	10
7326	0,7 л	\N	\N	\N	Malibu, 21%	\N	f	300000	1	3025	f	10
7327	1 л	\N	\N	\N	Aperol Barbieri, 11%	\N	f	516000	1	3026	f	10
7328	0,375 л	\N	\N	\N	Cointreau, 40%	\N	f	229000	1	3027	f	10
7329	0,5 л	\N	\N	\N	Cointreau, 40%	\N	f	308000	1	3027	f	10
7330	0,7 л	\N	\N	\N	Cointreau, 40%	\N	f	420000	1	3027	f	10
7331	1 л	\N	\N	\N	Cointreau, 40%	\N	f	525000	1	3027	f	10
7332	1 л	\N	\N	\N	Sambuca Extra Malinari, 40%	\N	f	429000	1	3028	f	10
7333	1 л	\N	\N	\N	Campari, 41%	\N	f	536000	1	3029	f	10
7334	0,7 л	\N	\N	\N	Jagermeister, 35%	\N	f	237000	1	3031	f	10
7335	1 л	\N	\N	\N	Jagermeister, 35%	\N	f	350000	1	3031	f	10
7336	0,7 л	\N	\N	\N	Fruko Schulz Absinth, 60%	\N	f	300000	1	3033	f	10
7340	0,5 л	\N	\N	\N	SARAJISHVILI 3*	\N	f	181000	1	3036	f	10
7341	0,7 л	\N	\N	\N	SARAJISHVILI 3*	\N	f	242500	1	3036	f	10
7342	0,5 л	\N	\N	\N	SARAJISHVILI 5*	\N	f	189500	1	3037	f	10
7343	0,7 л	\N	\N	\N	Sarajishvili VS 	\N	f	395000	1	3038	f	10
7363	Romantini asti 0.75л	\N	\N	\N	Romantini asti 0.75л	\N	f	34000	1	3056	f	10
7364	Romantini peach 0.75л	\N	\N	\N	Romantini peach 0.75л	\N	f	34000	1	3056	f	10
7365	Cassa bella 0.75л	\N	\N	\N	Cassa bella 0.75л	\N	f	35000	1	3056	f	10
7366	Moet & Chandon Brut GB Франция 0.75л	\N	\N	\N	Moet & Chandon Brut GB Франция 0.75л	\N	f	811000	1	3057	f	10
7367	Moet & Chandon Brut Rose GB, 12% 0.75л	\N	\N	\N	Moet & Chandon Brut Rose GB, 12% 0.75л	\N	f	869000	1	3057	f	10
7368	Asti Martini, 7,5% 0.75л	\N	\N	\N	Asti Martini, 7,5% 0.75л	\N	f	232000	1	3057	f	10
7369	Asti Martini 7,5% GB 0.75л	\N	\N	\N	Asti Martini 7,5% GB 0.75л	\N	f	232000	1	3057	f	10
7370	Martini Prosecco, 11,5% 0.75л	\N	\N	\N	Martini Prosecco, 11,5% 0.75л	\N	f	300000	1	3057	f	10
7357	Гидролайф 1,5 л	\N	\N	\N	Гидролайф	\N	f	2500	1	3053	f	10
7376	0.5 ж\\б	\N	\N	\N	Sarbast 0.5 ж\\б	\N	f	10	1	2873	f	10
7377	0,5 бут	\N	\N	\N	Sarbast 0.5 бут	\N	f	10000	1	2873	f	10
7362	Red Bull	\N	\N	\N	Red Bull	\N	f	15500	1	3053	f	10
7115	1 л	\N	\N	\N	JAMESON	\N	f	492000	1	\N	f	10
7116	0,7 л	\N	\N	\N	JAMESON	\N	f	369000	1	\N	f	10
7360	Coca cola 1.5л	\N	\N	\N	Coca Cola 1.5л	\N	f	9000	1	3053	f	10
7358	Borjomi 0,33 л	\N	\N	\N	Borjomi 	\N	f	11000	1	3053	f	10
7359	Чорток 0,5 л	\N	\N	\N	ЧОРТОК	\N	f	8000	1	3053	f	10
7361	PepsiI 1.5л	\N	\N	\N	PEPSI 1.5л	\N	f	9000	1	3053	f	10
7344	Peri Rose 0,75 л	\N	\N	\N	Peri Rose 0,75 л	\N	f	62500	1	\N	f	10
7345	Багизаган  Зулхумор 0,75 л	\N	\N	\N	Багизаган  Зулхумор 0,75 л	\N	f	38000	1	\N	f	10
7346	Багизаган Изабелла 0,75 л	\N	\N	\N	Багизаган Изабелла 0,75 л	\N	f	38000	1	\N	f	10
7347	Багизаган Мерло 0,75 л	\N	\N	\N	Багизаган Мерло 0,75 л	\N	f	38000	1	\N	f	10
7348	Багизаган Наргис 0,75 л	\N	\N	\N	Багизаган Наргис 0,75 л	\N	f	38000	1	\N	f	10
7349	Багизаган Шардене 0,75 л	\N	\N	\N	Багизаган Шардене 0,75 л	\N	f	38000	1	\N	f	10
7350	PERI CABERNET SAUVIGNON 0,75 л	\N	\N	\N	PERI CABERNET SAUVIGNON 0,75 л	\N	f	75000	1	\N	f	10
7351	PERI Шардоне 0,75 л	\N	\N	\N	PERI Шардоне 0,75 л	\N	f	62500	1	\N	f	10
7352	BAHOR 0,75 л	\N	\N	\N	BAHOR 0,75 л	\N	f	37500	1	\N	f	10
7353	Incontro 0,75 л	\N	\N	\N	Incontro 0,75 л	\N	f	25500	1	\N	f	10
7354	Incontro 0,75 л	\N	\N	\N	Incontro 0,75 л	\N	f	25500	1	\N	f	10
7355	Emozioni  0,75 л	\N	\N	\N	Emozioni  0,75 л	\N	f	25500	1	\N	f	10
7356	Emozioni  0,75 л	\N	\N	\N	Emozioni  0,75 л	\N	f	25500	1	\N	f	10
7337	0,7 л	\N	\N	\N	Jack Daniels	\N	f	545000	1	\N	f	10
7338	0,75 л	\N	\N	\N	Jack Daniels	\N	f	627500	1	\N	f	10
7339	1 л	\N	\N	\N	Jack Daniels	\N	f	595500	1	\N	f	10
7372	0.5 бут	\N	\N	\N	0.5 бут	\N	f	10000	1	2874	f	10
7375	1.5 пэт	\N	\N	\N	Sarbast 1.5л	\N	f	10000	1	2874	f	10
7378	1.5 пэт	\N	\N	\N	Sarbast 1.5 пэт	\N	f	10000	1	2873	f	10
7379	0.5 бут	\N	\N	\N	Sarbast 0.5 бут	\N	f	10000	1	2880	f	10
7380	0,5 ж\\б	\N	\N	\N	Sarbast0,5 ж\\б	\N	f	10000	1	2880	f	10
7381	0,5 ж\\б	\N	\N	\N	Не фильтрованное 	\N	f	10000	1	3062	f	10
7382	7 бут	\N	\N	\N	Балтика 7 бут	\N	f	10000	1	3063	f	10
7383	7 ж\\б	\N	\N	\N	Балтика 7 ж\\б	\N	f	10000	1	3063	f	10
7384	9 ж\\б	\N	\N	\N	Балтика 9 ж\\б	\N	f	10000	1	3063	f	10
7385	9 бут	\N	\N	\N	Балтика 9 бут	\N	f	10000	1	3063	f	10
7386	0,5 ж\\б	\N	\N	\N	Tuborg 	\N	f	10000	1	3065	f	10
7387	0.5 бут	\N	\N	\N	Tuborg 0.5 бут	\N	f	10000	1	3065	f	10
7388	Craft Lager пэт	\N	\N	\N	Craft Lager пэт	\N	f	10000	1	3066	f	10
7389	Buchinger бут	\N	\N	\N	Buchinger бут	\N	f	10000	1	3066	f	10
7390	Braufest пэт	\N	\N	\N	Braufest пэт	\N	f	10000	1	3066	f	10
7173	0,5 л	\N	\N	\N	Рижское(бут)	\N	f	5000	1	\N	f	10
7391	0.5 бут	\N	\N	\N	Рижское 0.5 бут	\N	f	10000	1	2912	f	10
7392	2.3 бакл	\N	\N	\N	Portland 2.3 бакл	\N	f	10000	1	2899	f	10
7393	1.25 бакл	\N	\N	\N	Munchen 1.25 бакл	\N	f	10000	1	2886	f	10
7394	0.5 ж\\б	\N	\N	\N	Pulsar Silver 0.5 ж\\б	\N	f	10000	1	2900	f	10
7395	0.5 ж\\б	\N	\N	\N	Бочка крепкого 0.5 ж\\б	\N	f	10000	1	2906	f	10
7396	0.5 ж\\б	\N	\N	\N	Бочка крепкого 0.5 ж\\б	\N	f	10000	1	2904	f	10
7397	0.5 ж\\б	\N	\N	\N	Жигулёвское 0.5 ж\\б	\N	f	10000	1	3070	f	10
7398	1.5 пэт	\N	\N	\N	Жигулевское 1.5 пэт	\N	f	10000	1	3070	f	10
7399	2.3 бакл	\N	\N	\N	Жигулевское 2.3 бакл	\N	f	10000	1	3070	f	10
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: telegrambot
--

COPY public.locations (id, latitude, longitude, address, order_id) FROM stdin;
126	41.2078720000000018	69.1928220000000067	Узбекистан, Ташкент, Сергелийский район, массив Сергели-IX, 83	116
135	41.2078720000000018	69.1928220000000067	Узбекистан, Ташкент, Сергелийский район, массив Сергели-IX, 83	117
141	41.2078720000000018	69.1928220000000067	Узбекистан, Ташкент, Сергелийский район, массив Сергели-IX, 83	123
149	41.3447010000000006	69.3438649999999939	Узбекистан, Ташкент, улица Шахриабад	133
152	41.3024040000000028	69.2295859999999976	Узбекистан, Ташкент, 2-й проезд Козиробод	134
153	41.3024040000000028	69.2295859999999976	Узбекистан, Ташкент, 2-й проезд Козиробод	135
\.


--
-- Data for Name: notification_chats; Type: TABLE DATA; Schema: public; Owner: telegrambot
--

COPY public.notification_chats (chat_id, chat_title) FROM stdin;
-434965037	Оповещения Доставка Крепость
-460475070	Notify
\.


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: telegrambot
--

COPY public.order_items (id, order_id, dish_id, count) FROM stdin;
327	117	\N	1
280	113	\N	1
292	116	\N	1
350	123	\N	1
384	124	\N	1
375	133	\N	1
328	117	\N	1
385	124	\N	2
330	117	\N	1
329	117	\N	1
376	133	\N	1
386	134	\N	1
387	135	\N	1
388	136	7336	1
389	137	7336	5
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: telegrambot
--

COPY public.orders (id, user_id, user_name, shipping_method, payment_method, address_txt, phone_number, confirmed, confirmation_date, delivery_price, total_amount, distance) FROM stdin;
116	1294618325	Den	delivery	cash	\N	79032024978	t	2020-09-07 12:16:42.540639	82700	382700	(15.7,км)
134	64925540	Владимир	delivery	cash	\N	998935856774	t	2020-09-28 11:00:42.321504	27500	177500	(6.5,км)
135	64925540	Владимир	delivery	cash	\N	998935856774	t	2020-09-28 11:01:37.024375	27500	327500	(6.5,км)
136	758668569	\N	delivery	\N	\N	\N	f	\N	\N	\N	\N
137	64925540	\N	delivery	\N	\N	\N	f	\N	\N	\N	\N
123	1294618325	Den	delivery	cash	\N	79032024978	t	2020-09-08 18:53:16.366656	82700	382700	(15.7,км)
117	1294618325	Den	delivery	cash	\N	79032024978	t	2020-09-08 16:29:33.962369	82700	1222700	(15.7,км)
113	1294618325	Den	delivery	cash	asd	+79032024978	t	2020-09-05 17:39:09.576727	\N	300000	\N
133	465632014	\N	delivery	\N	\N	\N	f	\N	16000	\N	(4.2,км)
124	1294618325	\N	delivery	\N	\N	\N	f	\N	\N	\N	\N
\.


--
-- Data for Name: registration_requests; Type: TABLE DATA; Schema: public; Owner: telegrambot
--

COPY public.registration_requests (id, user_id, phone_number, tg_username, username, created_at) FROM stdin;
\.


--
-- Data for Name: user_admins; Type: TABLE DATA; Schema: public; Owner: telegrambot
--

COPY public.user_admins (id, email, password_hash) FROM stdin;
1	admin@example.com	pbkdf2:sha256:150000$9ZV4CxM9$862c163fe6ee97aac3c35c28697bea2baa0da9cdc567e1a88a9b1d4141517ef6
\.


--
-- Data for Name: user_dish; Type: TABLE DATA; Schema: public; Owner: telegrambot
--

COPY public.user_dish (user_id, dish_id) FROM stdin;
583411442	58
202624021	7087
1294618325	7336
64925540	7336
758668569	7336
155962879	6728
465632014	6716
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: telegrambot
--

COPY public.users (id, full_user_name, username, phone_number, language, token, confirmed, telegram_id, registration_date, accept_policy) FROM stdin;
76777495	Дмитрий	dmitriyl99	+998909879930	ru	\N	\N	\N	2020-08-16 19:11:08.577507	\N
583411442	Дв	zakking1	998900000000	ru	\N	\N	\N	2020-09-11 18:40:23.489021	t
388227600	Эльвира	\N	998977551084	ru	\N	\N	\N	2020-09-16 05:48:13.777899	f
773939127	Амир	aydash_96	998909411927	ru	\N	\N	\N	2020-09-16 09:11:20.817952	t
64925540	Владимир	BJIaDMuP	998935856774	ru	\N	\N	\N	2020-09-24 12:53:43.614394	t
202624021	Рамиль	\N	998909623532	ru	\N	\N	\N	2020-09-24 12:55:15.322562	t
758668569	Дениель	L_4D4N	998998248048	ru	\N	\N	\N	2020-08-26 09:28:48.490631	\N
895082471	Дамир	blackgold_oo7	+998909579691	ru	\N	\N	\N	2020-09-03 06:54:23.402588	\N
465632014	NvrbckDown	Nvrbckdown	998909643469	ru	\N	\N	\N	2020-09-04 18:13:57.593579	t
155962879	Мурад	Seo_of_vid_uz	998909408196	ru	\N	\N	\N	2020-09-05 09:45:09.421385	t
1294618325	Den	permanentusernames	79032024978	ru	\N	\N	\N	2020-09-05 17:38:37.843737	t
\.


--
-- Name: cart_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telegrambot
--

SELECT pg_catalog.setval('public.cart_items_id_seq', 265, true);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telegrambot
--

SELECT pg_catalog.setval('public.comments_id_seq', 12, true);


--
-- Name: dish_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telegrambot
--

SELECT pg_catalog.setval('public.dish_categories_id_seq', 3070, true);


--
-- Name: dishes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telegrambot
--

SELECT pg_catalog.setval('public.dishes_id_seq', 7399, true);


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telegrambot
--

SELECT pg_catalog.setval('public.locations_id_seq', 153, true);


--
-- Name: notification_chats_chat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telegrambot
--

SELECT pg_catalog.setval('public.notification_chats_chat_id_seq', 1, false);


--
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telegrambot
--

SELECT pg_catalog.setval('public.order_items_id_seq', 389, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telegrambot
--

SELECT pg_catalog.setval('public.orders_id_seq', 137, true);


--
-- Name: registration_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telegrambot
--

SELECT pg_catalog.setval('public.registration_requests_id_seq', 1, false);


--
-- Name: user_admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telegrambot
--

SELECT pg_catalog.setval('public.user_admins_id_seq', 1, true);


--
-- Name: user_dish_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telegrambot
--

SELECT pg_catalog.setval('public.user_dish_user_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telegrambot
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: cart_items cart_items_pkey; Type: CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: dish_categories dish_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.dish_categories
    ADD CONSTRAINT dish_categories_pkey PRIMARY KEY (id);


--
-- Name: dishes dishes_pkey; Type: CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.dishes
    ADD CONSTRAINT dishes_pkey PRIMARY KEY (id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: notification_chats notification_chats_pkey; Type: CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.notification_chats
    ADD CONSTRAINT notification_chats_pkey PRIMARY KEY (chat_id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: registration_requests registration_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.registration_requests
    ADD CONSTRAINT registration_requests_pkey PRIMARY KEY (id);


--
-- Name: user_admins user_admins_pkey; Type: CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.user_admins
    ADD CONSTRAINT user_admins_pkey PRIMARY KEY (id);


--
-- Name: user_dish user_dish_pkey; Type: CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.user_dish
    ADD CONSTRAINT user_dish_pkey PRIMARY KEY (user_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: dish_categories_level_idx; Type: INDEX; Schema: public; Owner: telegrambot
--

CREATE INDEX dish_categories_level_idx ON public.dish_categories USING btree (level);


--
-- Name: dish_categories_lft_idx; Type: INDEX; Schema: public; Owner: telegrambot
--

CREATE INDEX dish_categories_lft_idx ON public.dish_categories USING btree (lft);


--
-- Name: dish_categories_rgt_idx; Type: INDEX; Schema: public; Owner: telegrambot
--

CREATE INDEX dish_categories_rgt_idx ON public.dish_categories USING btree (rgt);


--
-- Name: ix_user_admins_email; Type: INDEX; Schema: public; Owner: telegrambot
--

CREATE INDEX ix_user_admins_email ON public.user_admins USING btree (email);


--
-- Name: ix_user_dish_dish_id; Type: INDEX; Schema: public; Owner: telegrambot
--

CREATE INDEX ix_user_dish_dish_id ON public.user_dish USING btree (dish_id);


--
-- Name: ix_user_dish_user_id; Type: INDEX; Schema: public; Owner: telegrambot
--

CREATE INDEX ix_user_dish_user_id ON public.user_dish USING btree (user_id);


--
-- Name: cart_items cart_items_dish_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_dish_id_fkey FOREIGN KEY (dish_id) REFERENCES public.dishes(id) ON DELETE SET NULL;


--
-- Name: cart_items cart_items_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: comments comments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: dish_categories dish_categories_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.dish_categories
    ADD CONSTRAINT dish_categories_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.dish_categories(id) ON DELETE CASCADE;


--
-- Name: dishes dishes_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.dishes
    ADD CONSTRAINT dishes_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.dish_categories(id);


--
-- Name: locations locations_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: order_items order_items_dish_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_dish_id_fkey FOREIGN KEY (dish_id) REFERENCES public.dishes(id) ON DELETE SET NULL;


--
-- Name: order_items order_items_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

