--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
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


--
-- Name: citext; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ad (
    usc1_id public.citext,
    uscre_id public.citext,
    uscn_id public.citext,
    login_id public.citext,
    user_id public.citext,
    givenname public.citext,
    surname public.citext,
    loginname public.citext,
    email public.citext,
    eigthid public.citext,
    employeeid public.citext,
    description public.citext,
    department public.citext,
    telephonenumber public.citext,
    city public.citext,
    st public.citext,
    postalcode public.citext,
    country public.citext
);


ALTER TABLE public.ad OWNER TO postgres;

--
-- Name: asdi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asdi (
    asdi_id bigint NOT NULL,
    disposed_poc public.citext DEFAULT 'No Description'::public.citext NOT NULL,
    disposed_vendor public.citext DEFAULT 'No Description'::public.citext NOT NULL,
    disposed_phone public.citext DEFAULT 'No Description'::public.citext NOT NULL
);


ALTER TABLE public.asdi OWNER TO postgres;

--
-- Name: astc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.astc (
    astc_id bigint NOT NULL,
    category public.citext NOT NULL
);


ALTER TABLE public.astc OWNER TO postgres;

--
-- Name: astd; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.astd (
    astd_id bigint NOT NULL,
    asset_name public.citext NOT NULL,
    asset_displayname public.citext NOT NULL,
    purchase_date date,
    assigned_date date,
    expiry_date date,
    created timestamp without time zone DEFAULT now(),
    description public.citext DEFAULT 'No Description'::public.citext NOT NULL
);


ALTER TABLE public.astd OWNER TO postgres;

--
-- Name: astdes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.astdes (
    astdes_id bigint NOT NULL,
    serialno public.citext NOT NULL,
    mcount public.citext NOT NULL,
    rslot public.citext NOT NULL
);


ALTER TABLE public.astdes OWNER TO postgres;

--
-- Name: astdesgpu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.astdesgpu (
    astdesgpu_id bigint NOT NULL,
    gpucard public.citext NOT NULL,
    gpusize public.citext NOT NULL,
    gpuuom public.citext NOT NULL
);


ALTER TABLE public.astdesgpu OWNER TO postgres;

--
-- Name: astdeshdd; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.astdeshdd (
    astdeshdd_id bigint NOT NULL,
    hddtype public.citext NOT NULL,
    hddsize public.citext NOT NULL,
    hdduom public.citext NOT NULL
);


ALTER TABLE public.astdeshdd OWNER TO postgres;

--
-- Name: astdesmod; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.astdesmod (
    astdesmod_id bigint NOT NULL,
    make public.citext NOT NULL,
    model public.citext NOT NULL
);


ALTER TABLE public.astdesmod OWNER TO postgres;

--
-- Name: astdesopt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.astdesopt (
    astdesopt_id bigint NOT NULL,
    optdrive public.citext NOT NULL
);


ALTER TABLE public.astdesopt OWNER TO postgres;

--
-- Name: astdesos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.astdesos (
    astdesos_id bigint NOT NULL,
    os public.citext NOT NULL,
    "bit" public.citext NOT NULL,
    sp public.citext NOT NULL
);


ALTER TABLE public.astdesos OWNER TO postgres;

--
-- Name: astdespro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.astdespro (
    astdespro_id bigint NOT NULL,
    processor public.citext NOT NULL,
    speed public.citext NOT NULL
);


ALTER TABLE public.astdespro OWNER TO postgres;

--
-- Name: astdesr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.astdesr (
    astdesr_id bigint NOT NULL,
    astr_id bigint NOT NULL,
    astdes_id bigint DEFAULT '-1'::integer NOT NULL,
    astdesgpu_id bigint DEFAULT '-1'::integer NOT NULL,
    astdeshdd_id bigint DEFAULT '-1'::integer NOT NULL,
    astdesmod_id bigint DEFAULT '-1'::integer NOT NULL,
    astdesopt_id bigint DEFAULT '-1'::integer NOT NULL,
    astdesos_id bigint DEFAULT '-1'::integer NOT NULL,
    astdespro_id bigint DEFAULT '-1'::integer NOT NULL,
    astdesram_id bigint DEFAULT '-1'::integer NOT NULL,
    createdtime timestamp without time zone DEFAULT now(),
    description public.citext DEFAULT 'No Description'::public.citext NOT NULL
);


ALTER TABLE public.astdesr OWNER TO postgres;

--
-- Name: astdesram; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.astdesram (
    astdesram_id bigint NOT NULL,
    rtype public.citext NOT NULL,
    rsize public.citext NOT NULL,
    ruom public.citext NOT NULL
);


ALTER TABLE public.astdesram OWNER TO postgres;

--
-- Name: astf; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.astf (
    astf_id bigint NOT NULL,
    po_number public.citext,
    warranty public.citext,
    amc_auth public.citext,
    amc_expiry date
);


ALTER TABLE public.astf OWNER TO postgres;

--
-- Name: astg; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.astg (
    astg_id bigint NOT NULL,
    astg_group public.citext NOT NULL
);


ALTER TABLE public.astg OWNER TO postgres;

--
-- Name: asto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asto (
    asto_id bigint NOT NULL,
    user_id bigint NOT NULL,
    astd_id bigint NOT NULL
);


ALTER TABLE public.asto OWNER TO postgres;

--
-- Name: astr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.astr (
    astr_id bigint NOT NULL,
    astd_id bigint NOT NULL,
    astt_id bigint DEFAULT '-1'::integer NOT NULL,
    astc_id bigint DEFAULT '-1'::integer NOT NULL,
    astg_id bigint DEFAULT '-1'::integer NOT NULL,
    asts_id bigint DEFAULT '-1'::integer NOT NULL,
    astv_id bigint DEFAULT '-1'::integer NOT NULL,
    astf_id bigint DEFAULT '-1'::integer NOT NULL,
    asdi_id bigint DEFAULT '-1'::integer NOT NULL,
    createdtime timestamp without time zone DEFAULT now(),
    description public.citext DEFAULT 'No Description'::public.citext NOT NULL
);


ALTER TABLE public.astr OWNER TO postgres;

--
-- Name: asts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asts (
    asts_id bigint NOT NULL,
    status public.citext NOT NULL
);


ALTER TABLE public.asts OWNER TO postgres;

--
-- Name: astt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.astt (
    astt_id bigint NOT NULL,
    type public.citext NOT NULL
);


ALTER TABLE public.astt OWNER TO postgres;

--
-- Name: astv; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.astv (
    astv_id bigint NOT NULL,
    vendor_name public.citext NOT NULL,
    vendor_location public.citext NOT NULL
);


ALTER TABLE public.astv OWNER TO postgres;

--
-- Name: empdata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empdata (
    employeecode public.citext,
    employee8id public.citext,
    relatedcostcenter public.citext,
    deptname public.citext,
    surname public.citext,
    f_name public.citext,
    m_name public.citext,
    new_designation public.citext
);


ALTER TABLE public.empdata OWNER TO postgres;

--
-- Name: usarl; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usarl (
    usarl_id bigint NOT NULL,
    user_id bigint NOT NULL,
    usrl_id bigint NOT NULL
);


ALTER TABLE public.usarl OWNER TO postgres;

--
-- Name: usasg; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usasg (
    usasg_id bigint NOT NULL,
    user_id bigint NOT NULL,
    ussg_id bigint NOT NULL
);


ALTER TABLE public.usasg OWNER TO postgres;

--
-- Name: usaug; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usaug (
    usaug_id bigint NOT NULL,
    user_id bigint NOT NULL,
    usug_id bigint NOT NULL
);


ALTER TABLE public.usaug OWNER TO postgres;

--
-- Name: usc1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usc1 (
    usc1_id bigint NOT NULL,
    eightid public.citext,
    empid public.citext,
    vipstatus public.citext
);


ALTER TABLE public.usc1 OWNER TO postgres;

--
-- Name: uscbld; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.uscbld (
    uscbld_id bigint NOT NULL,
    building public.citext NOT NULL,
    floor public.citext NOT NULL
);


ALTER TABLE public.uscbld OWNER TO postgres;

--
-- Name: uscbr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.uscbr (
    uscbr_id bigint NOT NULL,
    branch public.citext NOT NULL
);


ALTER TABLE public.uscbr OWNER TO postgres;

--
-- Name: uscn; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.uscn (
    uscn_id bigint NOT NULL,
    emailid public.citext,
    landline public.citext,
    mobile public.citext,
    web_url public.citext,
    res_phone public.citext
);


ALTER TABLE public.uscn OWNER TO postgres;

--
-- Name: uscorg; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.uscorg (
    uscorg_id bigint NOT NULL,
    org public.citext NOT NULL
);


ALTER TABLE public.uscorg OWNER TO postgres;

--
-- Name: uscre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.uscre (
    uscre_id bigint NOT NULL,
    usre_id bigint NOT NULL,
    uscorg_id bigint,
    uscbr_id bigint,
    uscbld_id bigint,
    uscsec_id bigint,
    usctit_id bigint,
    usc1_id bigint
);


ALTER TABLE public.uscre OWNER TO postgres;

--
-- Name: uscsec; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.uscsec (
    uscsec_id bigint NOT NULL,
    scode public.citext NOT NULL
);


ALTER TABLE public.uscsec OWNER TO postgres;

--
-- Name: usctit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usctit (
    usctit_id bigint NOT NULL,
    title public.citext NOT NULL
);


ALTER TABLE public.usctit OWNER TO postgres;

--
-- Name: usdg; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usdg (
    usdg_id bigint NOT NULL,
    designationname public.citext NOT NULL
);


ALTER TABLE public.usdg OWNER TO postgres;

--
-- Name: usdt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usdt (
    usdt_id bigint NOT NULL,
    deptname public.citext NOT NULL,
    deptheadid bigint,
    phoneno public.citext,
    fax public.citext,
    siteid bigint,
    deptdesc public.citext
);


ALTER TABLE public.usdt OWNER TO postgres;

--
-- Name: uslg; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.uslg (
    login_id bigint NOT NULL,
    user_id bigint NOT NULL,
    name public.citext NOT NULL,
    status public.citext DEFAULT 'ACTIVE'::public.citext
);


ALTER TABLE public.uslg OWNER TO postgres;

--
-- Name: usph; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usph (
    uspw_id bigint NOT NULL,
    mothername public.citext NOT NULL,
    birthplace public.citext NOT NULL,
    firstschool public.citext NOT NULL
);


ALTER TABLE public.usph OWNER TO postgres;

--
-- Name: uspw; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.uspw (
    uspw_id bigint NOT NULL,
    password public.citext NOT NULL,
    algorithm public.citext DEFAULT 'bcrypt'::public.citext NOT NULL,
    salt bytea NOT NULL,
    login_id bigint NOT NULL,
    createdtime timestamp without time zone DEFAULT now()
);


ALTER TABLE public.uspw OWNER TO postgres;

--
-- Name: usre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usre (
    usre_id bigint NOT NULL,
    user_id bigint NOT NULL,
    ustp_id bigint NOT NULL,
    usdg_id bigint NOT NULL,
    usdt_id bigint NOT NULL,
    usrt_id bigint NOT NULL,
    uscn_id bigint NOT NULL
);


ALTER TABLE public.usre OWNER TO postgres;

--
-- Name: usrl; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usrl (
    usrl_id bigint NOT NULL,
    name public.citext NOT NULL,
    description public.citext DEFAULT 'No Description'::public.citext NOT NULL
);


ALTER TABLE public.usrl OWNER TO postgres;

--
-- Name: usrt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usrt (
    usrt_id bigint NOT NULL,
    reportingto_id bigint NOT NULL
);


ALTER TABLE public.usrt OWNER TO postgres;

--
-- Name: ussg; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ussg (
    ussg_id bigint NOT NULL,
    sgname public.citext NOT NULL,
    sgowner_id bigint NOT NULL,
    description public.citext DEFAULT 'No Description'::public.citext
);


ALTER TABLE public.ussg OWNER TO postgres;

--
-- Name: ustp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ustp (
    ustp_id bigint NOT NULL,
    usertype public.citext NOT NULL
);


ALTER TABLE public.ustp OWNER TO postgres;

--
-- Name: usud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usud (
    user_id bigint NOT NULL,
    first_name public.citext NOT NULL,
    middle_name public.citext,
    last_name public.citext,
    description public.citext DEFAULT 'No Description'::public.citext NOT NULL,
    createdtime timestamp without time zone DEFAULT now()
);


ALTER TABLE public.usud OWNER TO postgres;

--
-- Name: usug; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usug (
    usug_id bigint NOT NULL,
    ugname public.citext NOT NULL,
    ugowner_id bigint NOT NULL,
    description public.citext DEFAULT 'No Description'::public.citext
);


ALTER TABLE public.usug OWNER TO postgres;

--
-- Data for Name: ad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ad (usc1_id, uscre_id, uscn_id, login_id, user_id, givenname, surname, loginname, email, eigthid, employeeid, description, department, telephonenumber, city, st, postalcode, country) FROM stdin;
﻿506	1106	3006	200006	100006	Santosh	Adsul	AdsulS	santosh.adsul@thyssenkrupp.com	10446754	9207	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4145	Pune	Maharashtra	411018	IN
507	1107	3007	200007	100007	Arun	Chadha	ChadhaA	Arun.Chadha@ThyssenKrupp.com	10383742	15537	MHE  SELLING (Dept Code: 3002)	MHE  SELLING (Dept Code: 3002)	+91 20 6612 4074	Pune	Maharashtra	411018	IN
508	1108	3008	200008	100008	Sangram	Shitole	shitoles	sangram.shitole@thyssenkrupp.com	10446908	9919	MHE  ENGINEERING GR I (Dept Code: 7307)	MHE  ENGINEERING GR I (Dept Code: 7307)	+91 20 6612 4478	Pune	Maharashtra	411018	IN
509	1109	3009	200009	100009	Oak	Purva	OakP	purva.oak@thyssenkrupp.com	10447094	9183	FINANCE  BILL PASSING (Dept Code: 7604)	FINANCE  BILL PASSING (Dept Code: 7604)	+91 20 66124255	Pune	Maharashtra	411018	IN
510	1110	3010	200010	100010	Somarajan	Pillai	PillaiR	Somarajan.Pillai@ThyssenKrupp.com	10446784	5332	MHE	MHE	+91 20 6612 4522	Pune	Maharashtra	411018	IN
511	1111	3011	200011	100011	tkii	Desksupport2	admin_se2	\N	\N	Orbit	T&IS - Orbit	T&IS - Orbit	+91 20 6612 4177	Pune	Maharashtra	411018	IN
512	1112	3012	200012	100012	Anil	Talnikar	TalnikarA	Anil.Talnikar@ThyssenKrupp.com	10207705	9517	T&IS (Dept. No.: 7901)	T&IS (Dept. No.: 7901)	+91 20 6612 4170	Pune	Maharashtra	411018	IN
513	1113	3013	200013	100013	Shekhar	Gaikwad	GaikwadS	Shekhar.Gaikwad@ThyssenKrupp.com	10446789	9286	T & IS  ADMINISTRATION (Dept. Code:  7901)	T & IS  ADMINISTRATION (Dept. Code:  7901)	+91 20 6612 4573	Pune	Maharashtra	411018	IN
514	1114	3014	200014	100014	Abhijit	Khandekar	KhandekarA	abhijit.khandekar@thyssenkrupp.com	10383799	5868	T&IS (Dept. No.: 7901)	T&IS (Dept. No.: 7901)	+91 20 6612 4538	Pune	Maharashtra	411018	IN
515	1115	3015	200015	100015	Sachin	Kangarkar	KangarkarS	sachin.kangarkar@thyssenkrupp.com	10447118	9815	CEMENT  EXECUTION (Dept Code: 6004)	PM_B&PP_9204	+91 20 6612 4421	Pune	Maharashtra	411018	IN
516	1116	3016	200016	100016	Shripati	Rupnawar	RupnawarS	shripati.rupanwar@thyssenkrupp.com	10445562	9703	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4827	Pune	Maharashtra	411018	IN
517	1117	3017	200017	100017	Rajashree	Joshi	JoshiR	rajashree.joshi@thyssenkrupp.com	10446872	9606	CEMENT  ENGINEERING (Dept Code: 6003)	Post Order Engineering Group (Dept Code: 6008)	+91 20 6612 4034	Pune	Maharashtra	411018	IN
518	1118	3018	200018	100018	Shrinivas	Kamble	KambleSV	shrinivasv.kamble@thyssenkrupp.com	10445669	90405	Machine Shop	Fabrication Shop	+91 20 6612 4426	Pune	Maharashtra	411018	IN
519	1119	3019	200019	100019	Mahesh	Gole	GoleM	mahesh.gole@thyssenkrupp.com	10431221	90062	SUGAR  EXECUTION (Dept Code: 4004)	SUGAR  EXECUTION (Dept Code: 4004)	+91 20 6612 4196	Pune	Maharashtra	411018	IN
520	1120	3020	200020	100020	Avinash	Andore	AndoreA	avinash.andore@thyssenkrupp.com	10445587	9618	CEMENT  ENGINEERING (Dept Code: 6003)	Plant Design (Post Order) Group (Dept Code: 6009)	+91 20 6612 4889	Pune	Maharashtra	411018	IN
521	1121	3021	200021	100021	Kini	Arun	KiniA	arun.kini@thyssenkrupp.com	10446751	9034	Stores  (Dept. Code:7752  )	Stores & Despatch	+91 20 66124322	Pune	Maharashtra	411018	IN
522	1122	3022	200022	100022	Anup	Patil	Patil_A	Anup.Patil@thyssenkrupp.com	10447127	9845	CIVIL EXECUTION (Dept Code: 7202)	CIVIL EXECUTION (Dept Code: 7202)	+91 20 6612 4561	Pune	Maharashtra	411018	IN
523	1123	3023	200023	100023	Onkar	Gosavi	GosaviO	onkar.gosavi@thyssenkrupp.com	10447225	90142	BOILER  SELLING	BOILER  SELLING (Dept Code: 2002)	+91 20 6612 4587	Pune	Maharashtra	411018	IN
524	1124	3024	200024	100024	Kumbhar	V	KumbharV	vijayanand.kumbhar@thyssenkrupp.com	10447090	5298	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4483	Pune	Maharashtra	411018	IN
525	1125	3025	200025	100025	Iranappa	Manthale	ManthaleI	iranappa.manthale@thyssenkrupp.com	10445676	90433	Quality Assurance (Receiving)	Quality Assurance (Receiving)	+91 20 6612 4377	Pune	Maharashtra	411018	IN
526	1126	3026	200026	100026	Shrikrishna	Birare	BirareS	shrikrishna.birare@thyssenkrupp.com	10445603	9901	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4879	Pune	Maharashtra	411018	IN
527	1127	3027	200027	100027	Waghmare	A	WaghmareA	anthony.waghmare@thyssenkrupp.com	10445715	9165	DESIGN & ENGINEERING  CRUSHER/SCREEN (Dept Code: 7304)	DESIGN & ENGINEERING  CRUSHER/SCREEN (Dept Code: 7304)	+91 20 6612 4462	Pune	Maharashtra	411018	IN
528	1128	3028	200028	100028	Ramchandra	Gadiwadd	GadiwaddR	ramchandra.gadiwadd@thyssenkrupp.com	10445642	9977	WORKSHOP SUPERVISORS (Dept Code: 5061)	WORKSHOP SUPERVISORS (Dept Code: 5061)	+91 20 66124404	Pune	Maharashtra	411018	IN
529	1129	3029	200029	100029	tkii	Desksupport3	admin_se3	\N	\N	Orbit	T&IS - Orbit	T&IS - Orbit	+91 20 6612 4177	Pune	Maharashtra	411018	IN
530	1130	3030	200030	100030	Smita	Dhanore	DhanoreS	smita.dhanore@thyssenkrupp.com	10445635	9781	CEMENT  ENGINEERING (Dept Code: 6003)	Plant Design (Post Order) Group (Dept Code: 6009)	+91 20 6612 4892	Pune	Mahatashtra	411018	IN
531	1131	3031	200031	100031	Vishal	Bhosale	BhosaleV	vishal.bhosale@thyssenkrupp.com	10445615	90112	MHE  ENGINEERING GR I (Dept Code: 7307)	MHE  ENGINEERING GR I (Dept Code: 7307)	+91 20 6612 4638	Pune	Maharashtra	411018	IN
532	1132	3032	200032	100032	Pankaj	Kamble	KamblePG	pankaj.kamble@thyssenkrupp.com	10447197	90432	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4498	Pune	Maharashtra	411018	IN
533	1133	3033	200033	100033	Sagar	Kodilkar	KodilkarS	\N	\N	PFS50	Subcontract Dept.	Subcontract (Dept. Code: 7742)	+91 20 66124311	Pune	Maharashtra	411018	IN
534	1134	3034	200034	100034	Avinash	Nagare	NagareA	avinash.nagare@thyssenkrupp.com	10445670	90406	Fabrication Shop	Fabrication Shop	+91 20 66124748	Pune	Maharashtra	411018	IN
535	1135	3035	200035	100035	Sachin	Potdar	PotdarS	sachin.potdar@thyssenkrupp.com	10447105	9585	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4459	Pune	Maharashtra	411018	IN
536	1136	3036	200036	100036	Dineshkumar	Wani	WaniD	dineshkumar.wani@thyssenkrupp.com	10445549	9544	WORKSHOP SUPERVISORS (Dept Code: 5061)	WORKSHOP SUPERVISORS (Dept Code: 5061)	+91 20 6612 4412	Pune	Maharashtra	411018	IN
537	1137	3037	200037	100037	Shekhar	Choure	ChoureSR	shekhar.choure@thyssenkrupp.com	10445628	90534	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612  4486	Pune	Maharashtra	411018	IN
538	1138	3038	200038	100038	Neeta	Vispute	VisputeN	neeta.vispute@tkiidc.com	\N	1792480	DESIGN & ENGINEERING  STRUCTURAL (Dept code-7305)	DESIGN & ENGINEERING  STRUCTURAL (Dept code-7305)	+91 20 6612 4710	Pune	Maharashtra	411018	IN
704	1304	3204	200204	100204	Dijeesh	Divakaran	DivakaranD	\N	\N	9609	Services	PM_Cement_9604_E&C	\N	pune	Maharashtra	411018	IN
539	1139	3039	200039	100039	Amol	Chaudhari	ChaudhariA	amol.chaudhari@thyssenkrupp.com	10447312	90272	Estimation (Dept. Code:7620)	Estimation (Dept. Code:7620)	+91 20 6612 4672	Pune	Maharashtra	411018	IN
540	1140	3040	200040	100040	Umesh	Kadam	KadamU	umesh.kadam@thyssenkrupp.com	10431186	9705	MHE  EXECUTION (Dept Code: 3004)	PM_MHE_9304	+91 20 6612 4635	Pune	Maharashtra	411018	IN
541	1141	3041	200041	100041	Sunil	Kumbhar	KumbharSB	sunil.kumbhar@thyssenkrupp.com	10445674	90428	Polysius Cement (Dept. ID: 6003 PE)	Plant Design (Post Order) Group (Dept Code: 6009)	+91 20 6612 4894	Pune	Maharashtra	411018	IN
542	1142	3042	200042	100042	Shashikumar	Todkar	TodkarS	Shashikumar.Todkar@ThyssenKrupp.com	10383710	9330	CEMENT  ENGINEERING (Dept Code: 6003)	Proposal Engineering Group (Dept Code: 6003)	+91 20 66124135	Pune	Maharashtra	411018	IN
543	1143	3043	200043	100043	Vinod	Wadile	WadileV	Vinod.Wadile@ThyssenKrupp.com	10383821	9396	CEMENT  ENGINEERING (Dept Code: 6003)	Proposal Engineering Group (Dept Code: 6003)	+91 20 66124151	\N	\N	\N	\N
544	1144	3044	200044	100044	Ali	Asgar	AliA	ali.asgar@thyssenkrupp.com	10383829	9886	CEMENT  ENGINEERING (Dept Code: 6003)	Proposal Engineering Group (Dept Code: 6003)	+91 20 6612 4534	Pune	Maharashtra	411018	IN
545	1145	3045	200045	100045	Pritam	Kulkarni	KulkarniP	pritam.kulkarni@thyssenkrupp.com	10447143	9984	CEMENT  ENGINEERING (Dept Code: 6003)	Proposal Engineering Group (Dept Code: 6003)	+91 20 6612 4848	Pune	Maharashtra	411018	IN
546	1146	3046	200046	100046	Shridhar	Kotnis	KotnisS	shridhar.kotnis@thyssenkrupp.com	10447249	90321	CEMENT  ENGINEERING (Dept Code: 6003)	Proposal Engineering Group (Dept Code: 6003)	+91 20 6612 4160	Pune	Maharashtra	411018	IN
547	1147	3047	200047	100047	Prakash	Wagh	WaghP	prakash.wagh@thyssenkrupp.com	10447247	90319	CEMENT  ENGINEERING (Dept Code: 6003)	Proposal Engineering Group (Dept Code: 6003)	+91 20 6612 4533	Pune	Maharashtra	411018	IN
548	1148	3048	200048	100048	Suraj	Lambe	LambeS	suraj.lambe@thyssenkrupp.com	10447264	90377	CEMENT  ENGINEERING (Dept Code: 6003)	Proposal Engineering Group (Dept Code: 6003)	+91 20 6612 4590	Pune	Maharashtra	411018	IN
549	1149	3049	200049	100049	Digvijay	Kharade	KharadeD	digvijay.kharade@thyssenkrupp.com	10447267	90380	CEMENT  ENGINEERING (Dept Code: 6003)	Proposal Engineering Group (Dept Code: 6003)	+91 20 6612 4160	Pune	Maharashtra	411018	IN
550	1150	3050	200050	100050	Ameya	Golwalkar	GolwalkarA	ameya.golwalkar@thyssenkrupp.com	10431219	9965	SUGAR  EXECUTION (Dept Code: 4004)	PM_Sugar_9404	+91 20 6612 4798	Pune	Maharashtra	411018	IN
551	1151	3051	200051	100051	Vinod	Mane	ManeV	vinod.mane@thyssenkrupp.com	10431592	9801	BOILER  EXECUTION (Dept Code: 2004)	PM_B&PP_9204	+91 20 6612 4667	Pune	Maharashtra	411018	IN
552	1152	3052	200052	100052	Sandhya	Jadhav	JadhavSD	sandhya.jadhav@thyssenkrupp.com	10447228	90181	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4499	Pune	Maharashtra	411018	IN
553	1153	3053	200053	100053	Mayur	Patil	PatilMV	mayur.patil@thyssenkrupp.com	10447131	9888	CEMENT  ENGINEERING (Dept Code: 6003)	Plant Design (Post Order) Group (Dept Code: 6009)	+91 20 6612 4535	Pune	Maharashtra	411018	IN
554	1154	3054	200054	100054	Rajesh	Kulkarni	Kulkarni_R	rajesh.kulkarni@thyssenkrupp.com	10446875	9615	FINANCE  TAXATION (Dept Code: 7606)	FINANCE  TAXATION (Dept Code: 7606)	+91 20 6612 4236	Pune	Maharashtra	411018	IN
555	1155	3055	200055	100055	Prashant	Deshpande	DeshpandePP	prashantp.deshpande@thyssenkrupp.com	10446881	9691	RESEARCH & DEVELOPMENT (Dept Code: 1100)	DESIGN & ENGINEERING  CRUSHER/SCREEN (Dept Code: 7304)	+91 20 6612 4458	\N	\N	\N	\N
556	1156	3056	200056	100056	Kapil	Shirole	ShiroleK	kapil.shirole@thyssenkrupp.com	10403074	90038	Purchase Dept. (Dept. Code: 7712 )	Purchase Dept.	+91 20 6612 4568	Pune	Maharashtra	411018	IN
557	1157	3057	200057	100057	Dattatray	More	MoreD	dattatray.more@thyssenkrupp.com	10447186	90295	Quality:- Subcontract (5404)	Quality:- Subcontract (5404)	+91 20 6612 4525	Pune	Maharashtra	411018	IN
558	1158	3058	200058	100058	Vasudha	Buchake	BuchakeV	vasudha.buchake@thyssenkrupp.com	10445655	90207	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	+91 20 6612 4655	Pune	Maharashtra	411018	IN
559	1159	3059	200059	100059	Vaibhav	Borate	BorateV	Vaibhav.Borate@ThyssenKrupp.com	10446795	9434	CEMENT  ENGINEERING (Dept Code: 6003)	Plant Design (Post Order) Group (Dept Code: 6009)	+91 20 6612 4873	Pune	Maharashtra	411018	IN
560	1160	3060	200060	100060	Dnyanesh	Bute	ButeD	dnyanesh.bute@thyssenkrupp.com	10446846	9385	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4447	Pune	Maharashtra	411018	IN
561	1161	3061	200061	100061	Harshal	Dhande	DhandeH	harshal.dhande@thyssenkrupp.com	10445679	90443	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20  6612 4491	Pune	Maharashtra	411018	IN
562	1162	3062	200062	100062	Patil	Shashikant	PatilsK	shashikant.patil@thyssenkrupp.com	10446753	9150	SUGAR  CENTRIFUGALS DESIGN (Dept Code: 4005)	SUGAR  CENTRIFUGALS DESIGN (Dept Code: 4005)	+91 20 6612 4592	Pune	Maharashtra	411018	IN
563	1163	3063	200063	100063	Anil	Godse	GodseA	anil.godse@tkiidc.com	10488345	1959	President TKII Workers Union	President TKII Workers Union	+91 20 6612 4357	Pune	Maharashtra	411018	IN
564	1164	3064	200064	100064	Santosh	Pujari	PujariS	santosh.pujari@thyssenkrupp.com	10446879	9686	CEMENT  ENGINEERING (Dept Code: 6003)	Plant Design (Post Order) Group (Dept Code: 6009)	+91 20 6612 4874	Pune	Maharashtra	411018	IN
565	1165	3065	200065	100065	Dattatraya	Dhole	DholeD	dattatraya.dhole@thyssenkrupp.com	10445671	90421	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 206612 4491	Pune	Maharashtra	411018	IN
566	1166	3066	200066	100066	Vinit	Mokashi	MokashiV	vinit.mokashi@thyssenkrupp.com	10447246	90318	CEMENT  EXECUTION (Dept Code: 6004)	PM_MHE_9304	+91 20 6612 4189	Pune	Maharashtra	411018	IN
567	1167	3067	200067	100067	Ganesh	Deshpande	deshpandeg	ganesh.deshpande@thyssenkrupp.com	10446901	9850	CEMENT  ENGINEERING (Dept Code: 6003)	Post Order Engineering Group (Dept Code: 6008)	+91 20  6612 4897	Pune	Maharashtra	411018	IN
568	1168	3068	200068	100068	Vilas	Apet	ApetV	vilas.apet@thyssenkrupp.com	10446816	90251	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	+91 20 6612 4724	Pune	Maharashtra	411018	IN
569	1169	3069	200069	100069	Girish	Bansude	BansudeG	girish.bansude@thyssenkrupp.com	10445589	9667	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4767	Pune	Maharashtra	411018	IN
570	1170	3070	200070	100070	Ganesh	Jagtap	JagtapG	ganesh.jagtap@thyssenkrupp.com	10445726	90323	Cement	Cement Design & Engineering (Dept Code: 6005)	+91 20 6612 4445	Pune	Maharashtra	411018	IN
705	1305	3205	200205	100205	Nilesh	Kudte	KudteN	\N	\N	90552	MFS Dept.	MFS Dept.	\N	Pune	Maharashtra	411018	IN
571	1171	3071	200071	100071	Vikram	Vairat	VairatV	vikram.vairat@thyssenkrupp.com	10403097	9942	SUB CONTRACT (Dept. Code:7742 )	Subcontract Department	+91 20 6612 4666	Pune	Maharashtra	411018	IN
572	1172	3072	200072	100072	Maran	Vengai	VengaiM	Maran.Vengai@thyssenkrupp.com	10447161	90115	Services Dept	Services Dept	\N	Pune	Maharashtra	411018	IN
573	1173	3073	200073	100073	Santosh	Pujari	PujariSK	santoshk.pujari@thyssenkrupp.com	10447145	9996	MHE  EXECUTION (Dept Code: 3004)	MHE  EXECUTION (Dept Code: 3004)	+91 20 6612 4439	Pune	Maharastra	\N	IN
574	1174	3074	200074	100074	Prakash	Sutar	SutarP	prakash.sutar@thyssenkrupp.com	10447169	90144	MHE  Equipment Cell (Dept. Code: 3002 )	MHE  Equipment Cell (Dept. Code: 3002 )	+91 20 6612 4619	Pune	Maharashtra	411018	IN
575	1175	3075	200075	100075	Pooja	Bhalerao	BhaleraoP	pooja.bhalerao@thyssenkrupp.com	10447184	90274	CEMENT  ENGINEERING (Dept Code: 6003)	Process Engineering Group (Dept Code: 6010)	+91 20 6612 4859	Pune	Maharashtra	411018	IN
576	1176	3076	200076	100076	Ajit	Koshti	KoshtiA	ajit.koshti@thyssenkrupp.com	10447284	90551	CEMENT  ENGINEERING (Dept Code: 6003)	Proposal Engineering Group (Dept Code: 6003)	+91 20 6612 4590	Pune	Maharashtra	411018	IN
577	1177	3077	200077	100077	Yuvraj	Gangawane	GangawaneY	yuvraj.gangawane@thyssenkrupp.com	10445567	90068	Quality ? Site Dept. (Code ? 5406).	Quality ? Site Dept. (Code ? 5406)	\N	Pune	Maharashtra	411018	IN
578	1178	3078	200078	100078	Natasha	Kulkarni	KulkarniNA	natasha.kulkarni@thyssenkrupp.com	10482313	90719	Bough-Out Materials - 7702	Bough-Out Materials - 7702	+91 20 6612 4614	Pune	Maharashtra	411018	IN
579	1179	3079	200079	100079	Joshi	A	JoshiA	anil.joshi@thyssenkrupp.com	10383813	9196	Stores  (Dept. Code:  7752)	Stores & Despatch	+91 20 66124328	Pune	Maharashtra	411018	IN
580	1180	3080	200080	100080	Shinde	A	ShindeA	ajay.shinde@thyssenkrupp.com	10445729	90412	Sugar Mill Design	Sugar Mill Design	+91 20 6612 4709	Pune	Maharashtra	411018	IN
581	1181	3081	200081	100081	Krishnakant	Kurma	KurmaK	krishnakant.kurma@thyssenkrupp.com	10447165	90122	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	+91 20 6612 4678	Pune	Maharashtra	411018	IN
582	1182	3082	200082	100082	Sriharsha	Sandaka	SandakaS	sriharsha.sandaka@thyssenkrupp.com	10445673	98063	Quality Assurance (Fabrication)	Quality Assurance (Fabrication)	4027941507	Pune	Maharashtra	411018	IN
583	1183	3083	200083	100083	Ajit	Chougule	ChouguleA	ajit.chougule@thyssenkrupp.com	10447273	90475	Purchase Dept. (Dept. Code:7712  )	Purchase Dept.	+91 20 6612 4265	Pune	Maharashtra	411018	IN
584	1184	3084	200084	100084	Nitin	Marane	MaraneN	nitin.marane@thyssenkrupp.com	10446868	9569	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4492	\N	\N	\N	\N
585	1185	3085	200085	100085	Navnath	Borawake	BorawakeN	navnath.borawake@thyssenkrupp.com	10446871	9597	QUALITY-  PRODUCTION (Dept Code: 5403)	QUALITY-  PRODUCTION (Dept Code: 5403)	+91 20 6612 4528	Pune	Maharashtra	411018	IN
586	1186	3086	200086	100086	Kushal	Shinde	ShindeK	kushal.shinde@thyssenkrupp.com	10445694	90597	QUALITY- SITE (Dept Code: 5406)	QUALITY- SITE (Dept Code: 5406)	+91 20 6612 4518	Pune	Maharashtra	411018	IN
587	1187	3087	200087	100087	Harish	Patil	PatilHV	harish.patil@thyssenkrupp.com	10488547	90698	DESIGN & ENGINEERING  CRUSHER/SCREEN (Dept Code: 7304)	DESIGN & ENGINEERING  CRUSHER/SCREEN (Dept Code: 7304)	+91 20 6612 4627	Pune	Maharashtra	411018	IN
588	1188	3088	200088	100088	Dattamurti	Degaonkar	DegaonkarD	dattamurti.degaonkar@thyssenkrupp.com	10447181	90261	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4459	Pune	Maharashtra	411018	IN
589	1189	3089	200089	100089	Nishikant	Nanda	NandaN	nishikant.nanda@thyssenkrupp.com	10447319	90374	FINANCE  TAXATION (Dept Code: 7606)	FINANCE  TAXATION (Dept Code: 7606)	+91 20 6612 4261	Pune	Maharashtra	411018	IN
590	1190	3090	200090	100090	Amit	Pawar	PawarA	amit.pawar@thyssenkrupp.com	10445704	90042	Mech. Maintenance Dept.	Mech. Maintenance Dept.	\N	Pune	Maharashtra	411018	IN
591	1191	3091	200091	100091	Anil	Bandre	BandreA	anil.bandre@thyssenkrupp.com	10446903	9865	DESIGN & ENGINEERING  STRUCTURAL (Dept Code: 7305)	DESIGN & ENGINEERING  STRUCTURAL (Dept Code: 7305)	+91 20 6612 4436	Pune	Maharashtra	411018	IN
592	1192	3092	200092	100092	Abhinav	Kulkarni	KulkarniAR	abhinav.kulkarni@thyssenkrupp.com	10447166	90127	CIVIL EXECUTION (Dept Code: 7202)	CIVIL EXECUTION (Dept Code: 7202)	+91 20 6612 4088	Pune	Maharashtra	411018	IN
593	1193	3093	200093	100093	Khaja	Ahmed	AhmedK	khaja.ahmed@thyssenkrupp.com	10447134	9899	BOILER  EXECUTION (Dept Code: 2004)	PM_B&PP_9204	+91 20 6612 4542	Pune	Maharashtra	411018	IN
594	1194	3094	200094	100094	Santosh	Wadghule	WadghuleS	santosh.wadghule@thyssenkrupp.com	10447163	90117	BOILER  ENGINEERING (Dept Code: 2003)	BOILER  ENGINEERING (Dept Code: 2003)	+91 20 6612 4432	Pune	Maharashtra	411018	IN
595	1195	3095	200095	100095	Ashok	Alur	AlurA	ashok.alur@thyssenkrupp.com	10623144	91039	Dispensary	Personnel & HRD	+91 20 6612 4356	Pune	Maharashtra	411018	IN
596	1196	3096	200096	100096	Sudhakar	Zambre	ZambreS	sudhakar.zambre@thyssenkrupp.com	10447170	90152	Services  (Dept. Code: 7804 )	Services	+91 20 6612 4045	Pune	Maharashtra	411018	IN
597	1197	3097	200097	100097	Avilkumar	Bekwadkar	BekwadkarA	avil.bekwadkar@thyssenkrupp.com	10446867	9555	DESIGN & ENGINEERING  SUGAR MILL (Dept Code: 7306)	DESIGN & ENGINEERING  SUGAR MILL (Dept Code: 7306)	+91 20 6612 4508	Pune	Maharashtra	411018	IN
598	1198	3098	200098	100098	Dhananjay	Mavadikar	MavadikarD	dhananjay.mavadikar@thyssenkrupp.com	10445663	90345	CEMENT  DESIGN & ENGINEERING (Dept Code: 6005)	Cement Design & Engineering (Dept Code: 6005)	+91 20 6612 4444	Pune	Maharashtra	411018	IN
599	1199	3099	200099	100099	Santosh	Gavade	GavadeS	santosh.gavade@thyssenkrupp.com	10446863	9527	FINANCE  BILLING (Dept Code: 7603)	FINANCE  BILLING (Dept Code: 7603)	+91 20 6612 4260	Pune	Maharashtra	411018	IN
600	1200	3100	200100	100100	Deepak	Gawali	GawaliD	deepak.gawali@thyssenkrupp.com	10446891	9753	CEMENT  ENGINEERING (Dept Code: 6003)	Post Order Engineering Group (Dept Code: 6008)	+91 20 6612 4137	Pune	Maharashtra	\N	IN
601	1201	3101	200101	100101	Suyog	Kumbhar	KumbharSR	suyog.kumbhar@thyssenkrupp.com	10445682	90462	QUALITY- TESTING & RECEIVING (Dept Code: 5402)	QUALITY- TESTING & RECEIVING (Dept Code: 5402)	+91 20 6612 4385	pune	Maharastra	411018	IN
602	1202	3102	200102	100102	Ashish	Kamble	KambleA	ashish.kamble@thyssenkrupp.com	10403068	9904	Purchase Material (Dept. ID: 7712)	Purchase Material (Dept. ID: 7712)	+91 20 6612 4384	Pune	Maharashtra	411018	IN
603	1203	3103	200103	100103	Amit	Koli	KoliA	Amit.Koli@thyssenkrupp.com	10446801	9519	BOILER  ENGINEERING (Dept Code: 2003)	BOILER  ENGINEERING (Dept Code: 2003)	+91 20 66124583	\N	\N	\N	\N
1191	1791	3691	200691	100691	Shammi	Shetty	ShettyS	\N	\N	15856	Mumbai Office	Mumbai Office	\N	Pune	Maharashtra	411 018	IN
604	1204	3104	200104	100104	CH	Jayaprakash	JayaprakashCH	ch.jayaprakash@thyssenkrupp.com	10447301	98034	Hyderabad Office - PPC	Hyderabad Office - PPC	040-2794 1404	Pune	Maharashtra	411018	IN
605	1205	3105	200105	100105	Ketan	Pendse	PendseK	Ketan.Pendse@ThyssenKrupp.com	10242192	9625	Finance Controlling(Dept. Code:7607)	Finance Controlling(Dept. Code:7607)	+91 20 66124262	Pune	Maharashtra	411018	IN
606	1206	3106	200106	100106	Suraj	Shete	SheteS	suraj.shete@thyssenkrupp.com	10447290	90607	QUALITY-SUBCONTRACT(Dept Code: 5404)	Quality Assurance (Site)	+91 20 6612 4383	Pune	Maharashtra	411018	IN
607	1207	3107	200107	100107	Seema	Dere	DereS	seema.dere@thyssenkrupp.com	10445651	90169	SUGAR  ENGINEERING (Dept Code: 4003)	SUGAR  ENGINEERING (Dept Code: 4003)	+91 20 6612 4511	Pune	Maharashtra	411018	IN
608	1208	3108	200108	100108	Sunil	Kothale	KothaleS	sunil.kothale@thyssenkrupp.com	10417938	90176	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	+91 20 6612 4706	Pune	Maharashtra	411018	IN
609	1209	3109	200109	100109	Deshmukh	Sachin	DeshmukhSD	sachin.deshmukh@thyssenkrupp.com	10446851	9424	QUALITY- TESTING & RECEIVING (Dept Code: 5402)	QUALITY- TESTING & RECEIVING (Dept Code: 5402)	+ 91 20 6612 4338	\N	\N	\N	\N
610	1210	3110	200110	100110	Yuvraj	Kashidkar	KashidkarYV	yuvraj.kashidkar@thyssenkrupp.com	10447283	90539	Boht-Out (Dept. Code:  7702)	BOHT Dept.	+91 20 6612 4295	Pune	Maharashtra	411018	IN
611	1211	3111	200111	100111	Nilesh	Chaudhari	ChaudhariN	nilesh.chaudhari@thyssenkrupp.com	10447107	9641	CEMENT  DESIGN & ENGINEERING (Dept Code: 6005)	Cement Design & Engineering (Dept Code: 6005)	+91 20 6612 4734	Pune	Maharashtra	411018	IN
612	1212	3112	200112	100112	ok	Kulkarni	KulkarniSB	satish.kulkarni@thyssenkrupp.com	10445561	9631	CEMENT  DESIGN & ENGINEERING (Dept Code: 6005)	Cement Design & Engineering (Dept Code: 6005)	+91 20 6612 4556	Pune	Maharashtra	411018	IN
613	1213	3113	200113	100113	Chopade	Sudhir	ChopadeS	sudhirc.chopade@thyssenkrupp.com	10447112	9710	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	+91 20 6612 4446	Pune	Maharashtra	411018	IN
614	1214	3114	200114	100114	Laxman	Jadhav	JadhavL	laxman.jadhav@thyssenkrupp.com	10445638	9914	WORKSHOP SUPERVISORS (Dept Code: 5061)	WORKSHOP SUPERVISORS (Dept Code: 5061)	+91 20 6612 4579	Pune	Maharashtra	411018	IN
615	1215	3115	200115	100115	Dnyaneshwar	Bhosale	BhosaleD	dnyaneshwar.bhosale@thyssenkrupp.com	10445716	9219	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	+91 20 6612 4814	Pune	Maharashtra	411018	IN
616	1216	3116	200116	100116	Shivaji	Shirsath	ShirsathS	shivaji.shirsath@thyssenkrupp.com	10447137	9922	WORKSHOP SUPERVISORS (Dept Code: 5061)	WORKSHOP SUPERVISORS (Dept Code: 5061)	+91 20 6612 4406	Pune	Maharashtra	411018	IN
617	1217	3117	200117	100117	Rajiv	Kondawar	KondawarR	rajiv.kondawar@thyssenkrupp.com	10445551	9582	QUALITY -BOUGHTOUT (Dept Code: 5405)	QUALITY -BOUGHTOUT (Dept Code: 5405)	+91 20 6612 4517	Pune	Maharashra	411018	IN
618	1218	3118	200118	100118	Sagar	Deshmane	DeshmaneS	sagar.deshmane@thyssenkrupp.com	10445620	90179	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	+91 20 6612 4595	Pune	Maharashtra	411018	IN
619	1219	3119	200119	100119	Ganesh	Dhanrale	DhanraleG	ganesh.dhanrale@thyssenkrupp.com	10446880	9687	CEMENT  ENGINEERING (Dept Code: 6003)	Plant Design (Post Order) Group (Dept Code: 6009)	+91 20 6612 4132	Pune	Maharashtra	411018	IN
620	1220	3120	200120	100120	Jitesh	Limje	LimjeJ	jitesh.limje@thyssenkrupp.com	10447126	9842	CEMENT  ENGINEERING (Dept Code: 6003)	Plant Design (Proposal) Group (Dept Code: 6004)	+91 20 6612 4147	Pune	Maharashtra	411018	IN
621	1221	3121	200121	100121	Sachin	Kumbhar	KumbharS	sachin.kumbhar@thyssenkrupp.com	10445596	9719	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	+ 91 20 6612 4723	Pune	maharashtra	411018	IN
622	1222	3122	200122	100122	Amrapali	Waghmare	WaghmareAP	amrapali.waghmare@thyssenkrupp.com	10445599	9795	CEMENT  ENGINEERING (Dept Code: 6003)	Plant Design (Post Order) Group (Dept Code: 6009)	+91 20 6612 4892	Pune	Maharashtra	411018	IN
623	1223	3123	200123	100123	Vijaykumar	Shinde	ShindeVK	vijaykumar.shinde@thyssenkrupp.com	10445650	90149	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4886	Pune	Maharashtra	411018	IN
624	1224	3124	200124	100124	Swapnil	Chavan	ChavanS	swapnil.chavan@thyssenkrupp.com	10447254	90337	BOILER  EXECUTION (Dept Code: 2004)	PM_B&PP_9204	+91 20 6612 4472	Pune	Maharashtra	411018	IN
625	1225	3125	200125	100125	Ravindra	Kamthe	KamtheR	ravindra.kamthe@thyssenkrupp.com	10445563	9706	WORKSHOP SUPERVISORS (Dept Code: 5061)	WORKSHOP SUPERVISORS (Dept Code: 5061)	+91 20 6612 4417	Pune	Maharashtra	411018	IN
626	1226	3126	200126	100126	Chetan	Limbikai	LimbikaiC	chetan.limbikai@thyssenkrupp.com	10447226	90150	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4863	Pune	Maharashtra	411018	IN
627	1227	3127	200127	100127	Yuvraj	Patil	Patil_Y	yuvraj.patil@thyssenkrupp.com	10446918	90023	BOILER  ENGINEERING (Dept Code: 2003)	BOILER  ENGINEERING (Dept Code: 2003)	+91 20 6612 4622	Pune	\N	\N	IN
628	1228	3128	200128	100128	Shrinivas	Kamble	kambles	shrinivas.kamble@thyssenkrupp.com	10445646	90110	CEMENT  DESIGN & ENGINEERING (Dept Code: 6005)	Cement Design & Engineering (Dept Code: 6005)	+91 20 6612 4445	Pune	Maharashtra	411018	IN
629	1229	3129	200129	100129	Uttam	Kulkarni	KulkarniU	Uttam.Kulkarni@thyssenkrupp.com	10445565	9881	WORKSHOP SUPERVISORS (Dept Code: 5061)	WORKSHOP SUPERVISORS (Dept Code: 5061)	+91 20 6612 4386	Pune	Maharashtra	411018	IN
630	1230	3130	200130	100130	Mayuresh	Kanherikar	KanherikarM	mayuresh.kanherikar@thyssenkrupp.com	10445735	9814	Preparatory Dept.	Preparatory Dept.	+91 20 6612 4851	Pune	Maharashtra	411018	IN
631	1231	3131	200131	100131	Ajit	Peshave	PeshaveA	ajit.peshave@thyssenkrupp.com	10446887	9720	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4140	Pune	Maharashtra	411018	IN
632	1232	3132	200132	100132	Nilesh	Bhosale	BhosaleN	nilesh.bhosale@thyssenkrupp.com	10445643	90076	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4864	Pune	Maharashtra	411018	IN
633	1233	3133	200133	100133	Sudhir	Mishra	MishraS	Sudhir.Mishra@thyssenkrupp.com	10447192	90361	Services Dept	Services Dept	\N	Pune	Maharashtra	411018	IN
634	1234	3134	200134	100134	Makarand	Marathe	MaratheM	Makarand.Marathe@ThyssenKrupp.com	10216863	15531	Cement Management (Dept Code: 6001)	Cement Management Group (Dept Code: 6001)	+91 20 6612 4139	\N	\N	\N	\N
635	1235	3135	200135	100135	Yashwant	Sakhardande	SakhardandeY	Yashwant.Sakhardande@ThyssenKrupp.com	10242572	15527	DESIGN & ENGINEERING  MANAGEMENT (Dept Code: 7301)	DESIGN & ENGINEERING  MANAGEMENT (Dept Code: 7301)	+91 20 6612 4430	Pune	Maharashtra	411018	IN
636	1236	3136	200136	100136	Suhas	Talathi	TalathiS	Suhas.Talathi@ThyssenKrupp.com	10380031	9378	WORKSHOP  MANAGEMENT (Dept Code: 5001)	WORKSHOP  MANAGEMENT (Dept Code: 5001)	+91 20 6612 4410	Pune	Maharashtra	411018	IN
637	1237	3137	200137	100137	Sunil	Sagane	SaganeS	Sunil.Sagane@ThyssenKrupp.com	10383685	5530	ADMINISTRATION ELECTRICAL (Dept Code: 7401)	ADMINISTRATION ELECTRICAL (Dept Code: 7401)	+91 20 6612 4210	Pune	Maharashtra	411018	IN
638	1238	3138	200138	100138	Sharad	Sankpal	SankpalS	\N	\N	90108	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4460	Pune	Maharashtra	411018	IN
639	1239	3139	200139	100139	Unde	Uday	UndeU	\N	\N	5960	Stores  (Dept. Code:7752  )	Stores & Despatch	+91 20 66124324	Pune	Maharashtra	411018	IN
640	1240	3140	200140	100140	Sanjay	Misal	MisalSR	\N	\N	9761	CEMENT  ENGINEERING (Dept Code: 6003)	Plant Design (Post Order) Group (Dept Code: 6009)	+91 20 6612 4889	Pune	Maharashtra	411018	IN
641	1241	3141	200141	100141	Uday	Pandit	PanditU	\N	\N	90431	PPC Dept	PPC Dept	+91 20 6612 4387	Pune	Maharashtra	411018	IN
642	1242	3142	200142	100142	Swapnil	Patekar	PatekarS	Swapnil.Patekar@thyssenkrupp.com	\N	PFS-207	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4886	Pune	Maharashtra	411018	IN
643	1243	3143	200143	100143	Sunilkumar	Savalgi	SavalgiS	sunilkumar.savalgi@thyssenkrupp.com	10446362	90296	QUALITY- SITE (Dept Code: 5406)	QUALITY- SITE (Dept Code: 5406)	\N	Pune	Maharashtra	411018	IN
644	1244	3144	200144	100144	Azharuddin	Mohd	AzharuddinM	\N	\N	90310	Quality ? Site (Dept Code: 5402)	Quality ? Site  (Dept Code: 5402)	\N	pune	maharashtra	411018	IN
645	1245	3145	200145	100145	Virendra	Acharya	AcharyaV	virendra.acharya@thyssenkrupp.com	10445660	90311	QUALITY- TESTING & RECEIVING (Dept Code: 5402)	QUALITY- TESTING & RECEIVING (Dept Code: 5402)	\N	Pune	Maharashtra	411018	IN
646	1246	3146	200146	100146	Nandukishore	Singh	singhn	nandukishore.singh@thyssenkrupp.com	10383824	9563	Services Division	Services Division	\N	Pune	Maharashtra	411018	IN
647	1247	3147	200147	100147	Priya	Kakade	KakadeP	priya.kakade@thyssenkrupp.com	10445585	9568	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4768	Pune	Maharashtra	411018	IN
648	1248	3148	200148	100148	Pranay	Yedewar	YedewarP	pranay.yedewar@thyssenkrupp.com	10447125	9841	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4768	Pune	Maharashtra	\N	IN
649	1249	3149	200149	100149	Sunil	Bhatade	BhatadeS	sunil.bhatade@thyssenkrupp.com	10445601	9840	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4879	Pune	Maharashtra	\N	IN
650	1250	3150	200150	100150	Swapnil	Halgekar	HalgekarS	swapnil.halgekar@thyssenkrupp.com	10445691	90568	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4879	Pune	Maharashtra	\N	IN
651	1251	3151	200151	100151	Manish	Parchure	ParchureM	manish.parchure@thyssenkrupp.com	10383777	9365	Services  (Dept. Code:  7802)	PM_Cement_9604_E&C	\N	Pune	Maharashtra	411018	IN
652	1252	3152	200152	100152	Anagha	Deshpande	DeshpandeA	anagha.deshpande@thyssenkrupp.com	10445727	90324	Boiler and Power Plant	Boiler and Power Plant	\N	Pune	Maharashtra	411018	IN
653	1253	3153	200153	100153	Swikriti	Bhardwaj	BhardwajS	\N	\N	90523	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	+ 91 020 6612 4703	Pune	Maharashtra	411018	IN
654	1254	3154	200154	100154	Sandeep	Dadhe	DadheS	\N	\N	9935	HYD. WORKSHOP  QUALITY (Dept Code: 5511)	QUALITY- SITE (Dept Code: 5406)	+91 20 6612 4518	Pune	Maharashtra	411018	IN
655	1255	3155	200155	100155	Tanaji	Gangawane	GangawaneT	Tanaji.Gangawane@ThyssenKrupp.com	10447306	5503	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	+ 91 20 6612 4707	\N	\N	\N	\N
656	1256	3156	200156	100156	Mandar	Karve	KarveM	mandar.karve@thyssenkrupp.com	10383805	9021	WORKSHOP SUPERVISORS (Dept Code: 5061)	WORKSHOP SUPERVISORS (Dept Code: 5061)	+91 20 6612 4419	Pune	Maharashtra	\N	IN
657	1257	3157	200157	100157	Khomane	V	KhomaneV	vitthal.khomane@thyssenkrupp.com	10445582	9135	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	+91 20 6612 4792	Pune	Maharashtra	411018	IN
658	1258	3158	200158	100158	Kumbhar	B	KumbharB	balasaheb.kumbhar@thyssenkrupp.com	10445711	5810	BOILER  ENGINEERING (Dept Code: 2003)	BOILER  ENGINEERING (Dept Code: 2003)	+91 20 6612 4565	Pune	Maharashtra	411018	IN
659	1259	3159	200159	100159	Jaisinh	Nimbalkar	NimbalkarJ	Jaisinh.Nimbalkar@ThyssenKrupp.com	10446748	5387	Stores  (Dept. Code:  7752)	Stores & Despatch	+91 20 6612 4327	Pune	Maharashtra	Pune	IN
660	1260	3160	200160	100160	Patil	Y	PatilY	yeshwant.patil@thyssenkrupp.com	10445714	9140	Stores  (Dept. Code: 7752 )	Stores & Despatch	+91 20 6612 4326	Pune	Maharashtra	411018	IN
661	1261	3161	200161	100161	Poovalingam	Palani	PalaniP	Poovalingam.Palani@thyssenkrupp.com	10446800	9515	Services (Dept. Code: 7802  )	PM_Cement_9604_E&C	\N	Pune	Maharashtra	\N	IN
662	1262	3162	200162	100162	Ravi	Mullur	MullurR	ravi.mullur@thyssenkrupp.com	10383798	5826	QUALITY- SITE (Dept Code: 5406)	QUALITY- SITE (Dept Code: 5406)	+91 20  66124416	\N	\N	\N	\N
663	1263	3163	200163	100163	Mahadev	Rawool	RawoolM	mahadev.rawool@thyssenkrupp.com	10447120	9820	DESIGN & ENGINEERING  STRUCTURAL (Dept Code: 7305)	DESIGN & ENGINEERING  STRUCTURAL (Dept Code: 7305)	+91 20 6612 4779	Pune	Maharashtra	411018	IN
664	1264	3164	200164	100164	Sapkal	S	SapkalS	sachin.sapkal@thyssenkrupp.com	10445710	5803	Stores  (Dept. Code:  7752)	Stores & Despatch	+91 20 6612 4334	Pune	Maharashtra	411018	IN
665	1265	3165	200165	100165	Sasanapuri	R	SasanapuriR	Ramakrishna.Sasanapuri@thyssenkrupp.com	10383858	9260	WORKSHOP SUPERVISORS (Dept Code: 5061)	WORKSHOP SUPERVISORS (Dept Code: 5061)	+91 20 6612 4392	Pune	Maharashtra	411018	IN
666	1266	3166	200166	100166	Udapikar	Raj	UdapikarR	raj.udapikar@thyssenkrupp.com	10383744	5570	Services	Services	+91 20 6612 4789	Pune	Maharashtra	411018	IN
667	1267	3167	200167	100167	Vishal	Patil	PatilVL	vishal.patil@thyssenkrupp.com	10417933	9604	ENGG./EXECUTION INSTRUMENTATION (Dept Code: 7404)	ENGG./EXECUTION INSTRUMENTATION (Dept Code: 7404)	+91 20 6612 4219	Pune	Maharashtra	411018	IN
668	1268	3168	200168	100168	Prashant	Sambare	SambareP	prashant.sambare@thyssenkrupp.com	10447098	9442	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4496	Pune	Maharastra	411018	IN
669	1269	3169	200169	100169	Harishkumar	Dhabi	DhabiH	Harishkumar.Dhabi@thyssenkrupp.com	10446764	9514	Services Site.	PM_Cement_9604_E&C	+91 20 66124107	Pune	Maharashtra	411018	IN
670	1270	3170	200170	100170	Milind	Todkar	TodkarM	milind.todkar@thyssenkrupp.com	10447114	9749	HYD. WORKSHOP  MANAGEMENT P.P.P (Dept Code: 5502)	HYD. WORKSHOP  MANAGEMENT P.P.P (Dept Code: 5502)	+91 20 66124541	Pune	Maharashtra	411018	IN
671	1271	3171	200171	100171	Sandeep	Gawas	GawasS	sandeep.gawas@thyssenkrupp.com	10383560	9613	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	Electrical Department	+91 20 6612 4215	Pune	Maharashtra	411018	IN
672	1272	3172	200172	100172	Sanjeev	Yelge	YelgeS	sanjeev.yelge@thyssenkrupp.com	10445550	9551	WORKSHOP SUPERVISORS (Dept Code: 5061)	WORKSHOP SUPERVISORS (Dept Code: 5061)	+91 20 6612 4816	Pune	Maharashtra	411018	IN
673	1273	3173	200173	100173	Somnath	Mane	ManeS	Somnath.Mane@ThyssenKrupp.com	10446858	9492	WORKSHOP SUPERVISORS (Dept Code: 5061)	WORKSHOP SUPERVISORS (Dept Code: 5061)	+91 20 66124812	Pune	Maharashtra	411018	IN
674	1274	3174	200174	100174	Ganesh	Pawar	PawarG	ganesh.pawar@thyssenkrupp.com	10445725	90293	Structural Design	Structural Design Dept.	+91 20 6612 4479	Pune	Maharashtra	411018	IN
675	1275	3175	200175	100175	Ganeshkumar	Thayalan	ThayalanG	ganeshkumar.thayalan@thyssenkrupp.com	10446878	9672	WORKSHOP  P.P.PLANNING (Dept Code: 5002)	WORKSHOP  P.P.PLANNING (Dept Code: 5002)	+91 20 6612 4578	Pune	Maharashtra	411018	IN
676	1276	3176	200176	100176	Amol	Shewale	ShevaleA	amol.shevale@thyssenkrupp.com	10447113	9718	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	+91 20 6612 4527	Pune	Maharashtra	411018	IN
677	1277	3177	200177	100177	Arunkumar	Gobbur	GobburA	arunkumar.gobbur@thyssenkrupp.com	10446766	9637	Services Dept	PM_Cement_9604_E&C	\N	Pune	Maharashtra	411018	IN
678	1278	3178	200178	100178	Prasad	Patil	Patil_P	prasad.patil@thyssenkrupp.com	10445552	9751	WORKSHOP SUPERVISORS (Dept Code: 5061)	WORKSHOP SUPERVISORS (Dept Code: 5061)	+91 20 6612 4412	Pune	Maharashtra	411018	IN
679	1279	3179	200179	100179	James	Dcosta	DcostaJ	james.dcosta@thyssenkrupp.com	10445637	9898	QUALITY-  PRODUCTION (Dept Code: 5403)	QUALITY-  PRODUCTION (Dept Code: 5403)	+91 20 6612 4381	Pune	Maharashtra	411018	IN
680	1280	3180	200180	100180	Rahul	Shinde	Shinde_R	rahul.shinde@thyssenkrupp.com	10445644	90081	WORKSHOP SUPERVISORS (Dept Code: 5061)	WORKSHOP SUPERVISORS (Dept Code: 5061)	+91 20 66124749	Pune	Maharashtra	411018	IN
681	1281	3181	200181	100181	Deepak	Mhasudage	MhasudageD	deepak.mhasudage@thyssenkrupp.com	10445720	90033	DESIGN & ENGINEERING  STRUCTURAL (Dept Code: 7305)	DESIGN & ENGINEERING  STRUCTURAL (Dept Code: 7305)	+91 20 6612 4453	Pune	Maharashtra	411018	IN
682	1282	3182	200182	100182	Xevier	Mendis	MendisX	xevier.mendis@thyssenkrupp.com	10445718	9950	QUALITY-  PRODUCTION (Dept Code: 5403)	QUALITY-  PRODUCTION (Dept Code: 5403)	\N	Pune	Maharashtra	411018	IN
683	1283	3183	200183	100183	Girish	Paranjape	ParanjapeG	girish.paranjape@thyssenkrupp.com	10445719	9970	QUALITY- TESTING & RECEIVING (Dept Code: 5402)	QUALITY- TESTING & RECEIVING (Dept Code: 5402)	\N	pune	maharashtra	411018	IN
684	1284	3184	200184	100184	Rishikesh	Jadhav	JadhavR	rishikesh.jadhav@thyssenkrupp.com	10445649	90147	WORKSHOP SUPERVISORS (Dept Code: 5061)	WORKSHOP SUPERVISORS (Dept Code: 5061)	+91 20 66124749	Pune	Maharashtra	411018	IN
685	1285	3185	200185	100185	Dildar	Surve	SurveD	\N	\N	9949	WORKSHOP SUPERVISORS (Dept Code: 5061)	WORKSHOP SUPERVISORS (Dept Code: 5061)	+91 20 6612 4379	Pune	Maharashtra	411018	IN
686	1286	3186	200186	100186	Amol	Ranmode	RanmodeA	amol.ranmode@thyssenkrupp.com	10445613	90073	SUGAR  ENGINEERING (Dept Code: 4003)	SUGAR  ENGINEERING (Dept Code: 4003)	020 6612 4193	Pune	Maharashtra	411018	IN
687	1287	3187	200187	100187	Swapnil	Mohare	MohareS	Swapnil.Mohare@tkiidc.com	\N	PFS-209	Design - Crusher & Screen	Design - Crusher & Screen	+91 20 6612 4642	Pune	Maharashtra	411018	IN
688	1288	3188	200188	100188	Akash	Kamble	KambleAB	akash.kamble@thyssenkrupp.com	10445752	60100	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	020 6612 4451	Pune	Maharashtra	411018	IN
689	1289	3189	200189	100189	Sushant	Kale	KaleSD	sushant.kale@thyssenkrupp.com	10445661	90317	WORKSHOP  P.P.PLANNING (Dept Code: 5002)	WORKSHOP  P.P.PLANNING (Dept Code: 5002)	\N	Pune	\N	\N	IN
690	1290	3190	200190	100190	Anup	Kshirsagar	KshirsagarA	anup.kshirsagar@thyssenkrupp.com	10447251	90327	ENGG./EXECUTION INSTRUMENTATION (Dept Code: 7404)	ENGG./EXECUTION INSTRUMENTATION (Dept Code: 7404)	+91 20 6612 4577	Pune	Maharashtra	411018	IN
691	1291	3191	200191	100191	Ganapati	Jagadale	JagadaleG	ganapati.jagadale@thyssenkrupp.com	10447174	90168	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	+91 20 6612 4610	Pune	Maharashtra	411018	IN
692	1292	3192	200192	100192	Nilesh	Nanavare	NanavareN	\N	\N	15849	BOILER  ENGINEERING (Dept Code: 2003)	BOILER  ENGINEERING (Dept Code: 2003)	\N	Pune	Maharashtra	411018	IN
693	1293	3193	200193	100193	Arvind	Rajivan	RajivanA	arvind.rajivan@thyssenkrupp.com	10447258	90348	ENGG./EXECUTION INSTRUMENTATION (Dept Code: 7404)	ENGG./EXECUTION INSTRUMENTATION (Dept Code: 7404)	+91 20 6612 4813	Pune	Maharashtra	411018	IN
694	1294	3194	200194	100194	Sachin	Gurav	GuravSK	sachink.gurav@thyssenkrupp.com	10488354	90434	Quality Assurance (SubContract)	Quality Assurance (SubContract)	+91 20 6612 4528	Pune	Maharashtra	411018	IN
695	1295	3195	200195	100195	Sanjay	Wakchaure	WakchaureSI	sanjay.wakchaure@thyssenkrupp.com	10445621	90200	WORKSHOP SUPERVISORS (Dept Code: 5061)	WORKSHOP SUPERVISORS (Dept Code: 5061)	+91 20 6612 4890	Pune	\N	411018	IN
696	1296	3196	200196	100196	Manoj	Nazirkar	NazirkarM	manoj.nazirkar@thyssenkrupp.com	10447233	90227	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	+91 20 6612 4655	Pune	Maharashtra	411018	IN
697	1297	3197	200197	100197	Amol	Parkale	ParkaleA	amol.parkale@thyssenkrupp.com	10445722	90226	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4863	Pune	Maharashtra	411018	IN
698	1298	3198	200198	100198	Subhash	Nanekar	NanekarS	\N	\N	90445	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4842	Pune	Maharashtra	411018	IN
699	1299	3199	200199	100199	Kiran	Kamble	KambleK	kiran.kamble@thyssenkrupp.com	10445623	90249	CNC MACHINE Shop	CNC MACHINE Shop	+91 20 6612 4890	Pune	Maharashtra	411018	IN
700	1300	3200	200200	100200	Kirtikumar	Deochake	DeochakeK	kirtikumar.deochake@thyssenkrupp.com	10445544	9007	SUGAR  ENGINEERING (Dept Code: 4003)	\N	+91 20 6612 4661	\N	\N	\N	\N
701	1301	3201	200201	100201	Rajendra	Abhyankar	AbhyankarR	rajendra.abhyankar@thyssenkrupp.com	10445555	9213	SUGAR  ENGINEERING (Dept Code: 4003)	Sugar Dept.	\N	Pune	Maharashtra	411018	IN
702	1302	3202	200202	100202	Nitin	Dhoke	DhokeN	nitin.dhoke@thyssenkrupp.com	10445624	90287	Workshop Dept.	Workshop Dept.	+91 20 6612 4415	\N	\N	\N	\N
703	1303	3203	200203	100203	Vikas	Khade	KhadeV	\N	\N	90304	Workshop Machine Shop	Workshop Machine Shop	+91 20 2742 4494	Pune	Maharashtra	411018	IN
706	1306	3206	200206	100206	Vinod	Patil	PatilV	vinodb.patil@thyssenkrupp.com	10446395	90007	Mech. Maintenance Dept.	Mech. Maintenance Dept.	+91 20 6612 4406	Pune	Maharashtra	411018	IN
707	1307	3207	200207	100207	Janardhan	Sunkara	SunkaraJ	janardhan.sunkara@thyssenkrupp.com	10447302	98036	BOQA Dept.	BOQA Dept.	4027941509	Pune	Maharashtra	411018	IN
708	1308	3208	200208	100208	Paresh	Chaudhari	ChaudhariP	\N	\N	90368	HFS Dept	HFS Dept	+91 20 6612 4372	Pune	Maharashtra	411018	IN
709	1309	3209	200209	100209	Amit	Bhambure	BhambureA	amit.bhambure@thyssenkrupp.com	10445736	9831	Preparatory Dept.	Preparatory Dept.	\N	Pune	Maharashtra	411018	IN
710	1310	3210	200210	100210	Kumar	Patil	PatilKB	\N	\N	4782	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	+91 20 6612 4686	Pune	Maharashtra	411018	IN
711	1311	3211	200211	100211	Omkar	Kale	KaleO	\N	\N	BSA70015	Estimation (Dept. Code:7620)	Estimation (Dept. Code:7620)	+91 20 6612 4125	Pune	Maharashtra	411018	IN
712	1312	3212	200212	100212	Kishore	Gedela	GedelaK	\N	\N	90441	Services Division	Services Division	\N	Pune	Maharashtra	411018	IN
713	1313	3213	200213	100213	Tushar	Chaudhari	ChaudhariT	\N	\N	90680	BOQA Dept.	BOQA Dept.	+91 20 6612 4385	Pune	maharashtra	411018	IN
714	1314	3214	200214	100214	Anirudhh	Ingle	IngleA	anirudhh.ingle@thyssenkrupp.com	\N	BSA70007	FINANCE  BILLING (Dept Code: 7603)	FINANCE  BILLING (Dept Code: 7603)	\N	Pune	Maharashtra	\N	IN
715	1315	3215	200215	100215	Ajit	Pagale	PagaleA	ajit.pagale@thyssenkrupp.com	10488525	90718	MFS Dept. - Hall No. 1	MFS Dept.	+91 20 6612 4764	Pune	Maharashtra	411018	IN
716	1316	3216	200216	100216	R	Raghunath	RaghunathR	R.Raghunath@thyssenkrupp.com	10447250	90322	Services  (Dept. Code: 7802)	Services  (Dept. Code: 7802)	\N	Pune	Maharashtra	411018	IN
717	1317	3217	200217	100217	TV	Pradeep	PradeepTV	tv.pradeep@thyssenkrupp.com	10446758	9275	Services  (Dept. Code: 7802)	Services  (Dept. Code: 7802)	\N	Pune	Maharashtra	411018	IN
718	1318	3218	200218	100218	Tarun	Kumar	KumarT	tarun.kumar@thyssenkrupp.com	10445659	90309	Services  (Dept. Code: 7801 )	Services	\N	Pune	Maharashtra	411018	IN
719	1319	3219	200219	100219	Bhaskar	Dutta	DuttaB	bhaskar.dutta@thyssenkrupp.com	10383687	15536	Kolkata Office	Kolkatta Office	+91 033 6605 5201	Kolkatta	Kolkatta	\N	IN
720	1320	3220	200220	100220	Ajees	Thajudheen	ThajudheenA	ajees.thajudheen@thyssenkrupp.com	10383806	9025	Services Site.	Services	\N	Pune	Maharashtra	411018	IN
721	1321	3221	200221	100221	Anirudha	Chakraverty	ChakravertyA	anirudha.chakraverty@thyssenkrupp.com	10383840	16282	Delhi Office	Delhi Office	+91 11 2644 9971	\N	\N	\N	\N
722	1322	3222	200222	100222	Abhijit	Chakraborti	ChakrabortiA	abhijit.chakraborti@thyssenkrupp.com	10383828	9884	Kolkata Office	Kolkata Office	+91 033 6605 5209	Pune	Maharashtra	411018	IN
723	1323	3223	200223	100223	Samiran	Singha	SinghaS	samiran.singha@thyssenkrupp.com	10446904	9870	Kolkata Office	Kolkata Office	+91 33 2226 7419 or +91 33 6605 5200	Pune	Maharashtra	411018	IN
724	1324	3224	200224	100224	Sarfarazul	Hoda	HodaS	sarfarazul.hoda@thyssenkrupp.com	10446905	9876	Kolkata Office	Kolkata Office	+91 033 6605 5210	Pune	Maharashtra	411018	IN
725	1325	3225	200225	100225	Debashis	Das	DasD	debashis.das@thyssenkrupp.com	10447139	9946	Kolkata Office	Kolkata Office	+91 033 6605 5212	Pune	Maharashtra	411018	IN
726	1326	3226	200226	100226	Probir	Modak	ModakP	probir.modak@thyssenkrupp.com	10447221	9955	Kolkata Office	Kolkata Office	+91 033 6605 5210	Pune	Maharashtra	411018	IN
727	1327	3227	200227	100227	Venkateshwara	Rao	RaoVV	venkateshwara.rao@thyssenkrupp.com	10393255	98001	Hyderabad Office	Hyderabad Office	040-2794 1451	\N	\N	\N	\N
728	1328	3228	200228	100228	Srinivasa	Rao	RaoSK	srinivasa.rao@thyssenkrupp.com	10393257	98002	Hyderabad Office	Hyderabad Office	040-2794 1410	\N	\N	\N	\N
729	1329	3229	200229	100229	Giri	Ramu	RamuG	giri.ramu@thyssenkrupp.com	10447215	98011	TKII HYD.- QA	TKII HYD.- QA	040-2794 1505	Pune	Maharashtra	411018	IN
730	1330	3230	200230	100230	Mathai	Samuel	SamuelM	samuel.mathai@thyssenkrupp.com	10447083	98008	TKII HYD.- QA	TKII HYD.- QA	040-2794 1502	Pune	Maharashtra	411018	IN
731	1331	3231	200231	100231	Satyanarayana	Murthy	MurthyS	satyanarayana.murthy@thyssenkrupp.com	10445733	98006	TKII HYD.- QA	TKII HYD.- QA	040-2794 1510	Pune	Maharashtra	411018	IN
732	1332	3232	200232	100232	Raghaviah	Veera	VeeraR	vv.raghavaiah@thyssenkrupp.com	10447216	98018	TKII HYD.- QA	TKII HYD.- QA	4027941506	Pune	Maharashtra	411018	IN
733	1333	3233	200233	100233	Vikas	Gupta	GuptaV	vikas_gupta@thyssenkrupp.com	10446778	98003	Hyderabad Office	Hyderabad Office	040-2794 1411	Pune	Maharashtra	411018	IN
734	1334	3234	200234	100234	VVV	Kalyan	KalyanV	vvv.kalyan@thyssenkrupp.com	10446368	98019	Hyderabad Office	Hyderabad Office	040-2794 1206	Pune	Maharashtra	411018	IN
735	1335	3235	200235	100235	G	Gopal	GopalG	g.gopal@thyssenkrupp.com	10447084	98014	Hyderabad Office	Hyderabad Office	040-2794 1429	Pune	Maharashtra	411018	IN
736	1336	3236	200236	100236	Y	Syamsunder	SyamsunderY	syam.sunder@thyssenkrupp.com	10445633	98010	Hyderabad Office	Hyderabad Office	040-2794 1426	Pune	Maharashtra	411018	IN
737	1337	3237	200237	100237	Vrs	Srinivas	SrinivasV	vrs.srinivas@thyssenkrupp.com	10446835	98012	Hyderabad Office	Hyderabad Office	040-2794 1326	Hyderabad	Maharashtra	411018	IN
738	1338	3238	200238	100238	T	Saratchandra	SaratchandraT	sarat.chandra@thyssenkrupp.com	10446367	98015	Hyderabad Office	Hyderabad Office	040-2794 1304	Pune	Maharashtra	411018	IN
739	1339	3239	200239	100239	B	Ravindranath	RavindranathB	b.ravindranath@thyssenkrupp.com	10447331	98016	Hyderabad Office	Hyderabad Office	040-2794 1302	Pune	Maharashtra	411018	IN
740	1340	3240	200240	100240	T	Muralikrishna	MuralikrishnaT	t.muralikrishna@thyssenkrupp.com	10446833	98004	Hyderabad Office	Hyderabad Office	040-2794 1477	Pune	Maharashtra	411018	IN
741	1341	3241	200241	100241	Rao	Rajeswara	RajeswaraR	rao.rajeswara@thyssenkrupp.com	10446834	98009	Hyderabad Office	Hyderabad Office	+91 40 2726 3896	Pune	Maharashtra	411018	IN
742	1342	3242	200242	100242	Anupam	Sinha	SinhaA	anupam.sinha@thyssenkrupp.com	10447193	90367	Kolkata Office	Kolkata Office	+91 33 6605 5200	Pune	Maharashtra	411018	IN
743	1343	3243	200243	100243	Touchbaseadmin	\N	Touchbaseadmin	touchbaseadmin@thyssenkrupp.com	\N	System-ID	For tochbase application ID configured on TimeEnttry application	Design	\N	\N	\N	411018	IN
744	1344	3244	200244	100244	M	Sureshkumar	SureshkumarM	m.sureshkumar@thyssenkrupp.com	10446836	98022	Hyderabad Office	Hyderabad Office	040-2794 1504	\N	\N	\N	\N
745	1345	3245	200245	100245	Chiradip	Chandra	ChandraC	chiradip.chandra@thyssenkrupp.com	10445653	90178	Kolkata Office	Kolkata Office	+91 033 6605 5212	Pune	Maharashtra	411018	IN
1654	2254	4154	201154	101154	\N	\N	SAPServiceQIN	\N	\N	\N	SAP Service User for System QIN	\N	\N	\N	\N	\N	\N
746	1346	3246	200246	100246	C	Venkateshwarlu	VenkateshwarluC	c.venkateshwarlu@thyssenkrupp.com	10403096	98023	Hyderabad Office	Hyderabad Office	040-2794 1308	Pune	Maharashtra	411018	IN
747	1347	3247	200247	100247	Soumen	Das	Dassoumen	soumen.das@thyssenkrupp.com	10383790	90191	Kolkata Office	Kolkata Office	+91 033 6605 5208	Pune	Maharashtra	411018	IN
748	1348	3248	200248	100248	Ch	Srikanth	SrikanthC	chavali.srikanth@thyssenkrupp.com	10445634	98025	Hyderabad Office (Welding)	Hyderabad Office (Welding)	040-2794 1207	Pune	Maharashtra	411018	IN
749	1349	3249	200249	100249	Vamsi	Krishna	KrishnaV	vamsi.krishna@thyssenkrupp.com	10447085	98026	Hyderabad Office (QA)	Hyderabad Office (QA)	040-2794 1506	Pune	Maharashtra	411018	IN
750	1350	3250	200250	100250	D	Srinivas	SrinivasD	d.srinivas@thyssenkrupp.com	10447086	98027	Hyderabad Office	Hyderabad Office - Fabrication	040-2794 1453	Pune	Maharashtra	411018	IN
751	1351	3251	200251	100251	P	Shankarshan	ShankarshanP	p.sankarshan@thyssenkrupp.com	10447087	98029	Hyderabad Office	Hyderabad Office	040-2794 1204	Pune	Maharashtra	411018	IN
752	1352	3252	200252	100252	A	Srinivasu	SrinivasuA	a.srinivasu@thyssenkrupp.com	10393262	98031	Hyderabad Office - QA Dept.	Hyderabad Office - QA Dept.	040-2794 1503	Pune	Maharashtra	411018	IN
753	1353	3253	200253	100253	V	Mohankumar	MohankumarV	\N	\N	98032	Hyderabad Office	Hyderabad Office	040-2794 1307	\N	\N	\N	\N
754	1354	3254	200254	100254	P	Saikrishnamohan	SaikrishnamohanP	p.saikrishnamohan@thyssenkrupp.com	10393253	98033	Hyderabad Office - Stores	Hyderabad Office - Stores	040-2794 1306	Pune	Maharashtra	411018	IN
755	1355	3255	200255	100255	Ramu	Allapula	AllapulaR	ramu.allapula@thyssenkrupp.com	10447253	90335	Quality Assurance - NDT Testing	Quality Assurance - NDT Testing	4027941501	Pune	maharashtra	411018	IN
756	1356	3256	200256	100256	A	Rajeev	RajeevA	rajeev.kidambi@thyssenkrupp.com	10446440	98007	TKII HYD.- QA	TKII HYD.- QA	040-2794 1511	Pune	Maharashtra	411018	IN
757	1357	3257	200257	100257	Dastagiri	Reddy	ReddyD	dastagiri.reddy@thyssenkrupp.com	10445701	98017	TKII HYD - Electrical	TKII HYD - Electrical	040-2794 1478	Pune	Maharashtra	411018	IN
758	1358	3258	200258	100258	Nilanjan	Chakraborty	ChakrabortyN	nilanjan.chakraborty@thyssenkrupp.com	10445724	90257	Kolkata Office	Kolkata Office	033 6605 5220	Pune	Maharashtra	411018	IN
759	1359	3259	200259	100259	Dhruba	Bhattacharjee	BhattacharjeeD	Dhruba.Bhattacharjee@thyssenkrupp.com	10446447	60076	Kolkata Office	Kolkata Office	033 6605 5225	Pune	Maharashtra	411018	IN
760	1360	3260	200260	100260	S	Shailaja	ShailajaS	s.shailaja@thyssenkrupp.com	10488640	98051	Hyderabad Office - P & A	Hyderabad Office - P & A	040-2794 1100	Pune	Maharashtra	411018	IN
761	1361	3261	200261	100261	Ramanujam	Rangarajan	RamanujamR	Ramanujam.Rangarajan@thyssenkrupp.com	10383847	5508	Chennai Office	Chennai Office	+91 44 2433 9482	\N	\N	\N	\N
762	1362	3262	200262	100262	J	Mohan	MohanJ	j.mohan@thyssenkrupp.com	10447300	98030	Hyderabad Office	Hyderabad Office	040-2794 1409	Pune	Maharashtra	411018	IN
763	1363	3263	200263	100263	Rajshekhar	Mittalkod	MittalkodR	Rajshekhar.Mittalkod@thyssenkrupp.com	10446924	90130	Services - Cement Division	PM_Cement_9604_E&C	\N	Pune	Maharastra	411018	IN
764	1364	3264	200264	100264	Vasimalla	Bhan	BhanV	Vasimalla.Bhan@thyssenkrupp.com	10446767	9913	Services  (Dept. Code:  7807)	PM_Cement_9604_E&C	\N	Pune	Maharastra	411018	IN
765	1365	3265	200265	100265	Nagindra	Singh	NagindraS	Nagindra.Singh@thyssenkrupp.com	10446921	90064	Services - Cement Division	PM_Cement_9604_E&C	\N	Pune	Maharastra	411018	IN
766	1366	3266	200266	100266	Praloy	Sen	SenP	\N	\N	90271	Quality Management & Control (Dept Code: 5406)	Kolkatta Office	+91 33 22267428	Kolkatta	Kolkatta	\N	IN
767	1367	3267	200267	100267	Farzan	Dalal	DalalF	farzan.dalal@thyssenkrupp.com	10447320	90381	Mumbai Office	Mumbai Office	\N	Pune	Maharashtra	411018	IN
768	1368	3268	200268	100268	Nadeem	Patel	PatelN	nadeem.patel@thyssenkrupp.com	10488532	98020	Hyderabad Office	Hyderabad Office	040-2794 1428	Pune	Maharashtra	411018	IN
769	1369	3269	200269	100269	TV	Sunder	SunderT	thamarakulam.sunder@thyssenkrupp.com	10445734	98038	Hyderabad Office	Hyderabad Office	040-2794 1305	Pune	Maharashtra	411018	IN
770	1370	3270	200270	100270	Sivabalan	Salai	SalaiS	sivabalan.salai@thyssenkrupp.com	10447081	97004	Chennai Office	Chennai Office	\N	Pune	Maharashtra	411018	IN
771	1371	3271	200271	100271	Suresh	Babu	BabuS	suresh.babu@thyssenkrupp.com	10447299	97005	Chennai Office	Chennai Office	\N	Pune	Maharashtra	411018	IN
772	1372	3272	200272	100272	N	Srinivas	SrinivasN	nagella.Srinivas@thyssenkrupp.com	10446369	98037	Hyderabad Office	Hyderabad Office	040-2794 1460	Pune	Maharashtra	411018	IN
773	1373	3273	200273	100273	A	Ramavinodh	RamavinodhA	a.ramavinodh@thyssenkrupp.com	10482353	98043	Hyderabad Office	Fabrication Shop - Hyderabad Office	\N	Pune	Maharashtra	411018	IN
774	1374	3274	200274	100274	K	Shoba	ShobaK	k.shoba@thyssenkrupp.com	10447082	98005	Hyderabad Office	Hyderabad Office	040-2794 1203	Pune	Maharashtra	411018	IN
775	1375	3275	200275	100275	Atul	Kulkarni	KulkarniAV	atul.kulkarni@thyssenkrupp.com	10383691	9472	WORKSHOP SUPERVISORS (Dept Code: 5061)	WORKSHOP SUPERVISORS (Dept Code: 5061)	040-2794 1101	Pune	Maharashtra	411018	IN
776	1376	3276	200276	100276	Vaibhav	Kale	KaleV	vaibhav.kale@thyssenkrupp.com	10403082	9750	SUB CONTRACT (Dept. Code: 7742 )	Subcontract	+91 20 66124318	Pune	Maharashtra	411018	IN
777	1377	3277	200277	100277	Niranjan	Sapkal	SapkalN	Niranjan.Sapkal@ThyssenKrupp.com	10383809	9119	Purchase - Material (Dept. Code: 7712 )	Purchase - Material	+91 20 66124284	Pune	Maharashtra	411018	IN
778	1378	3278	200278	100278	Sunil	Kobal	KobalS	sunil.kobal@thyssenkrupp.com	10446860	9502	T&IS (Dept. No.: 7901)	T&IS (Dept. No.: 7901)	+91 20 6612 4576	\N	\N	\N	\N
779	1379	3279	200279	100279	Mahesh	Patil	PatilMD	maheshd.patil@thyssenkrupp.com	10447141	9954	MHE  Equipment Cell (Dept. Code: 3007 )	MHE  Equipment Cell (Dept. Code: 3007 )	+91 20 6612 4106	Pune	Maharashtra	411018	IN
780	1380	3280	200280	100280	Hanumanth	Reddy	ReddyH	hanumanth.reddy@thyssenkrupp.com	10383763	9090	Services  (Dept. Code:7804  )	Services  (Dept. Code:7804  )	+91 20 6612 4591	Pune	Maharashtra	411018	IN
781	1381	3281	200281	100281	Abhaysinh	Gaikwad	GaikwadA	Abhaysinh.Gaikwad@ThyssenKrupp.com	10446866	9554	Services  (Dept. Code: 7804 )	Services	+91 20 66124223	Pune	Maharashtra	411018	IN
782	1382	3282	200282	100282	Ganesh	Dongre	DongreG	ganesh.dongre@thyssenkrupp.com	10447149	90017	Services  (Dept. Code: 7804 )	Services	+91 20 66124644	Pune	Maharashtra	411018	IN
783	1383	3283	200283	100283	Pradeep	Mishra	MishraPK	\N	\N	90579	AVP ? Manufacturing (Dept. code 5061) ? Welding Department	AVP ? Manufacturing (Dept. code 5061) ? Welding Department	+91 20 6612 4408	\N	Hyderabad	\N	IN
784	1384	3284	200284	100284	Kochupurakal	Mathew	MathewK	Mathew.Kochupurakal@ThyssenKrupp.com	10242561	5543	QUALITY- TESTING & RECEIVING (Dept Code: 5402)	QUALITY- TESTING & RECEIVING (Dept Code: 5402)	+91 20 66124374	Pune	Maharashtra	411018	IN
785	1385	3285	200285	100285	Amol	Patil	PatilAS	amol.patil@thyssenkrupp.com	10446861	9503	T & IS Dept.	T&IS	+91 20 6612 4547	Pune	Maharashtra	411018	IN
786	1386	3286	200286	100286	Bhide	Sanjay	BhideS	sanjay.bhide@thyssenkrupp.com	10242547	15529	WORKSHOP  P.P.PLANNING (Dept Code: 5002)	WORKSHOP  P.P.PLANNING (Dept Code: 5002)	+91 20 6612 4429	Pune	Maharashtra	411018	IN
787	1387	3287	200287	100287	Prashant	Suryawanshi	SuryawanshiP	prashant.suryawanshi@thyssenkrupp.com	10417935	9663	ENGG./EXECUTION INSTRUMENTATION (Dept Code: 7404)	ENGG./EXECUTION INSTRUMENTATION (Dept Code: 7404)	+91 20 6612 4224	Pune	Maharashtra	411058	IN
788	1388	3288	200288	100288	Arvind	Chougule	Chougule_A	arvind.chougule@thyssenkrupp.com	10447148	90016	Services  (Dept. Code: 7801 )	Services	+91 20 6612 4653	Pune	Maharashtra	411018	IN
789	1389	3289	200289	100289	Mansing	Chavan	ChavanMS	mansing.chavan@thyssenkrupp.com	10422192	9368	BOILER  EXECUTION (Dept Code: 2004)	PM_B&PP_9204	+91 20 6612 4046	Pune	Maharashtra	411018	IN
790	1390	3290	200290	100290	Priyesh	Agrawal	AgrawalP	\N	\N	90161	CEMENT  EXECUTION (Dept Code: 6004)	PM_Cement_9604	+91 20 6612 4226	Pune	Maharashtra	411018	IN
791	1391	3291	200291	100291	Pillai	V	PillaiV	Venugopal.Pillai@ThyssenKrupp.com	10383764	9185	QUALITY -BOUGHTOUT (Dept Code: 5405)	QUALITY -BOUGHTOUT (Dept Code: 5405)	+91 20 6612 4382	Pune	Maharashtra	411018	IN
792	1392	3292	200292	100292	Zubbin	Registrar	RegistrarZ	\N	\N	9964	Logistics (Dept : 7653)	Logistics	+91 20 6612 4569	Pune	Maharashtra	\N	IN
793	1393	3293	200293	100293	Sanjay	Navayath	NavayathS	sanjay.navayath@thyssenkrupp.com	10426437	90460	Boht-Out	MHE  EXECUTION (Dept Code: 3004)	+91 20 6612 4293	Pune	Maharashtra	411018	IN
794	1394	3294	200294	100294	Uday	Warke	WarkeU	uday.warke@thyssenkrupp.com	10431202	9712	BOILER  EXECUTION (Dept Code: 2004)	PM_B&PP_9204	+91 20 6612 4086	Pune	Maharashtra	411018	IN
795	1395	3295	200295	100295	Ashutosh	Pandita	PanditaA	ashutosh.pandita@thyssenkrupp.com	10442302	90592	CEMENT  SELLING (Dept Code: 6002)	Cement Selling Group (Dept Code: 6002)	+91 20 6612 4588	Pune	Maharashtra	411018	IN
796	1396	3296	200296	100296	Susheel	Bhat	BhatS	Susheel.Bhat@ThyssenKrupp.com	10431223	9397	MHE  Equipment Cell (Dept. Code: 3007 )	MHE  Equipment Cell (Dept. Code: 3007 )	+91 20 6612 4101	\N	\N	\N	\N
797	1397	3297	200297	100297	Kishor	Nevse	NevseK	kishor.nevse@thyssenkrupp.com	10500196	60081	Services	Services	+91 20 6612 4799	Pune	Maharashtra	411018	IN
798	1398	3298	200298	100298	Bipin	Pinge	PingeB	Bipin.Pinge@ThyssenKrupp.com	10383760	9016	Estimation(Dept. Code:7620)	Estimation(Dept. Code:7620)	+91 20 66124119	Pune	Maharashtra	411018	IN
799	1399	3299	200299	100299	Arif	Shaikh	ShaikhAR	arif.shaikh@thyssenkrupp.com	10447297	90639	Services Dept	Services	+91 20 6612 4682	Pune	Maharashtra	411018	IN
800	1400	3300	200300	100300	Santosh	Nagane	NaganeS	santosh.nagane@thyssenkrupp.com	10447147	90015	Services Dept.	Services Dept.	+91 20 6612 4507	Pune	Maharashtra	411 018	IN
801	1401	3301	200301	100301	Abhaysinh	Bhasme	BhasmeA	Abhaysinh.Bhasme@thyssenkrupp.com	10488243	90737	Workshop	Workshop	+91 20 6612 4387	\N	Maharashtra	411018	IN
802	1402	3302	200302	100302	Mubin	Kapdi	KapdiM	Mubin.Kapdi@thyssenkrupp.com	10488408	90777	CEMENT  DESIGN & ENGINEERING (Dept Code: 6005)	Cement Design & Engineering (Dept Code: 6005)	+91 20 6612 4443	Pune	Maharashtra	411018	IN
803	1403	3303	200303	100303	Abdus	Mondal	MondalAS	as.mondal@thyssenkrupp.com	10426445	90537	RESEARCH & DEVELOPMENT (Dept Code: 1100)	DESIGN & ENGINEERING  MANAGEMENT (Dept Code: 7301)	+91 20 6612 4420	Pune	Maharashtra	411018	IN
804	1404	3304	200304	100304	Rohit	Gadekar	GadekarR	rohit.gadekar@thyssenkrupp.com	10447109	9685	CEMENT  DESIGN & ENGINEERING (Dept Code: 6005)	Cement Design & Engineering (Dept Code: 6005)	+91 20 6612 4896	Pune	Maharashtra	411018	IN
805	1405	3305	200305	100305	Santosh	Nilkanth	NilkanthS	santosh.nilkanth@thyssenkrupp.com	10446928	90185	CEMENT  ENGINEERING (Dept Code: 6003)	Plant Design (Proposal) Group (Dept Code: 6004)	+91 20 6612 4887	Pune	Maharashtra	411018	IN
806	1406	3306	200306	100306	Ashutosh	Solanke	SolankeA	ashutosh.solanke@thyssenkrupp.com	10447285	90558	Services	Services Dept.	+91 20 6612 4606	Pune	Maharashtra	411 018	IN
807	1407	3307	200307	100307	Pravin	Nagpure	NagpureP	pravin.nagpure@thyssenkrupp.com	10446899	9832	CEMENT  EXECUTION (Dept Code: 6004)	PM_Cement_9604	+91 20 6612 4531	Pune	Maharashtra	411018	IN
808	1408	3308	200308	100308	Shripad	Khire	KhireS	shripad.khire@thyssenkrupp.com	10383838	90246	Workshop Machine Shop	Workshop Machine Shop	+91 20 6612 4763	Pune	Maharashtra	411018	IN
809	1409	3309	200309	100309	Zubin	Gagrat	GagratZ	zubin.gagrat@thyssenkrupp.com	10393267	90372	Import Export (Dept. Code:7652)	Import Export (Dept. Code:7652)	+91 20 6612 4122	Pune	Maharashtra	411018	IN
810	1410	3310	200310	100310	Ashutosh	Abhyankar	AbhyankarA	Ashutosh.Abhyankar@ThyssenKrupp.com	10383773	9294	BOILER  EXECUTION (Dept Code: 2004)	PM_B&PP_9204	+91 20 66124047	Pune	Maharashtra	411018	IN
811	1411	3311	200311	100311	Anoop	Sharma	SharmaA	anoop.sharma@thyssenkrupp.com	10446927	90180	BOILER  EXECUTION (Dept Code: 2004)	PM_B&PP_9204	+91 20 6612 4696	Pune	Maharashtra	411018	IN
812	1412	3312	200312	100312	Kedar	Bahdule	BahduleK	Kedar.Bahdule@ThyssenKrupp.com	10417932	9405	ENGG./EXECUTION INSTRUMENTATION (Dept Code: 7404)	ENGG./EXECUTION INSTRUMENTATION (Dept Code: 7404)	+91 20 6612 4702	\N	\N	\N	\N
813	1413	3313	200313	100313	Yogesh	Kulkarni	kulkarni_y	yogesh.kulkarni@thyssenkrupp.com	10447110	9693	CEMENT  EXECUTION (Dept Code: 6004)	PM_MHE_9304	+91 20 6612 4529	Pune	Maharashtra	411018	IN
814	1414	3314	200314	100314	Shreyas	Hedgire	HedgireS	shreyas.hedgire@thyssenkrupp.com	10445598	9780	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4460	Pune	Maharashtra	411018	IN
815	1415	3315	200315	100315	Anant	Bhide	BhideAM	Anant.Bhide@ThyssenKrupp.com	10383765	9187	SUGAR  CENTRIFUGALS DESIGN (Dept Code: 4005)	SUGAR  CENTRIFUGALS DESIGN (Dept Code: 4005)	+91 20 66124456	Pune	Maharashtra	411018	IN
816	1416	3316	200316	100316	Mohini	Kirane	KiraneM	mohini.kirane@thyssenkrupp.com	10447195	90389	CEMENT  ENGINEERING (Dept Code: 6003)	Process Engineering Group (Dept Code: 6010)	+91 20 6612 4728	Pune	Maharashtra	411018	IN
817	1417	3317	200317	100317	Sachin	Sadavarte	SadavarteS	sachin.sadavarte@thyssenkrupp.com	10417930	9629	ENGG./EXECUTION INSTRUMENTATION (Dept Code: 7404)	ENGG./EXECUTION INSTRUMENTATION (Dept Code: 7404)	+91 20 6612 4701	Pune	Maharashtra	411018	IN
818	1418	3318	200318	100318	Umesh	Shinde	ShindeU	umesh.shinde@thyssenkrupp.com	10447103	9574	Estimation(Dept. Code:7620)	Estimation(Dept. Code:7620)	+91 20 6612 4120	Pune	Maharashtra	411018	IN
819	1419	3319	200319	100319	Balvant	Patil	PatilB	balvant.patil@ThyssenKrupp.com	10403064	9530	Purchase-Material (Dept. Code: 7712 )	Purchase - Material	+91 20 6612 4302	Pune	Maharashtra	411018	IN
820	1420	3320	200320	100320	Virendra	Kulkarni	virendrakulkarni	Virendra.Kulkarni@ThyssenKrupp.com	10383775	9306	CEMENT  ENGINEERING (Dept Code: 6003)	Plant Design (Proposal) Group (Dept Code: 6004)	+91 20 66124143	Pune	Maharashtra	411018	IN
821	1421	3321	200321	100321	Yashpal	Deshmukh	DeshmukhY	yashpal.deshmukh@thyssenkrupp.com	10447168	90135	BOILER  EXECUTION (Dept Code: 2004)	PM_B&PP_9204	+91 20 6612 4687	Pune	Maharashtra	411018	IN
822	1422	3322	200322	100322	Himmat	More	MoreH	himmat.more@thyssenkrupp.com	10447106	9587	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	+91 20 6612 4603	Pune	Maharashtra	411018	IN
823	1423	3323	200323	100323	Sameer	Marathe	MaratheS	sameer.marathe@thyssenkrupp.com	10446853	9437	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4817	Pune	Maharashtra	411018	IN
824	1424	3324	200324	100324	Sincy	John	JohnS	sincy.john@thyssenkrupp.com	10447076	90590	CEMENT  EXECUTION (Dept Code: 2004)	Cement Management_6001	+91 20 6612 4294	Pune	Maharashtra	411018	IN
825	1425	3325	200325	100325	Shashank	Admulwar	AdmulwarS	shashank.admulwar@thyssenkrupp.com	10447210	90576	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	+91 20 6612 4718	Pune	Maharashtra	411018	IN
826	1426	3326	200326	100326	Kiran	Bobade	BobadeK	kiran.bobade@thyssenkrupp.com	10445566	90063	SUGAR  ENGINEERING (Dept Code: 4003)	SUGAR  ENGINEERING (Dept Code: 4003)	+91 20 6612 4194	Pune	Maharashtra	411018	IN
827	1427	3327	200327	100327	Sachin	Jain	JainS	Sachin.Jain@ThyssenKrupp.com	10403060	9401	Purchsse-Administration (Dept. Code: 7711 )	Purchase - Administration	+91 20 66124268	Pune	Maharashtra	\N	IN
828	1428	3328	200328	100328	Krishnakant	Musne	MusneK	krishnakant.musne@thyssenkrupp.com	10431200	9915	BOILER  EXECUTION (Dept Code: 2004)	PM_B&PP_9204	+91 20 6612 4597	Pune	Maharashtra	411018	IN
829	1429	3329	200329	100329	Sharma	S	SharmaS	sudhirkumar.sharma@thyssenkrupp.com	10445578	5291	MHE  ENGINEERING GR I (Dept Code: 7307)	MHE  ENGINEERING GR I (Dept Code: 7307)	+91 20 6612 4557	Pune	Maharashtra	411018	IN
830	1430	3330	200330	100330	Vivek	Moharil	MoharilV	Vivek.Moharil@ThyssenKrupp.com	10403092	9310	Import - Export (Dept. Code:7652 )	Import - Export	+91 20 66124121	\N	\N	\N	\N
831	1431	3331	200331	100331	Mangesh	Salunkhe	SalunkheM	mangesh.salunkhe@thyssenkrupp.com	10417934	9664	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	+91 20 6612 4211	Pune	Maharashtra	411018	IN
832	1432	3332	200332	100332	Sanatkumar	Pattekari	PattekariS	sanatkumar.pattekari@thyssenkrupp.com	10403055	9974	Boht-Out (Dept. Code:  7702)	BOHT	+91 20 66124615	Pune	Maharashtra	411018	IN
833	1433	3333	200333	100333	Nilesh	Jumale	JumaleN	Nilesh.Jumale@ThyssenKrupp.com	10446873	9610	CEMENT  EXECUTION (Dept Code: 6004)	PM_Cement_9604	+91 20 6612 4532	Pune	Maharashtra	411018	IN
834	1434	3334	200334	100334	Tella	Rao 	RaoTK	tella.rao@thyssenkrupp.com	10445703	98041	Hyderabad Office	Hyderabad Office	\N	\N	\N	\N	\N
835	1435	3335	200335	100335	Parimal	Shinde	ShindeP	Parimal.Shinde@ThyssenKrupp.com	10445584	9565	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	+91 20 6612 4767	Pune	Maharashtra	411018	IN
836	1436	3336	200336	100336	Krushal	Patel	PatelKP	krushal.patel@thyssenkrupp.com	10488531	90692	Quality Assurance	Quality Assurance	+91 20 6612 4506	Pune	maharashtra	411018	IN
837	1437	3337	200337	100337	Shreyas	Mohite	MohiteS	shreyas.mohite@thyssenkrupp.com	10447259	90354	MHE  EXECUTION (Dept Code: 3004)	PM_MHE_9304	+91 20 6612 4673	Pune	Maharashtra	\N	IN
838	1438	3338	200338	100338	Kantilal	Puri	PuriK	kantilal.puri@thyssenkrupp.com	10447101	9543	CEMENT  DESIGN & ENGINEERING (Dept Code: 6005)	Cement Design & Engineering (Dept Code: 6005)	+91 20 6612 4465	Pune	Maharashtra	411018	IN
839	1439	3339	200339	100339	Prashant	Jamadar	JamadarP	prashant.jamadar@thyssenkrupp.com	10446763	9512	MHE  Equipment Cell (Dept. Code: 3002 )	MHE  Equipment Cell (Dept. Code: 3002 )	+91 20 66124105	Pune	Maharastra	411018	IN
840	1440	3340	200340	100340	Vidyadhar	Deshpande	DeshpandeV	vidyadhar.deshpande@thyssenkrupp.com	10447133	9895	CEMENT  DESIGN & ENGINEERING (Dept Code: 6005)	Cement Design & Engineering (Dept Code: 6005)	+91 20 6612 4736	Pune	Maharashtra	411018	IN
841	1441	3341	200341	100341	Srinivas	Mutchintala	MutchintalaS	srinivas.mutchintala@thyssenkrupp.com	10446935	90420	BOILER  ENGINEERING (Dept Code: 2003)	BOILER  ENGINEERING (Dept Code: 2003)	+91 20 6612 4087	Pune	Maharashtra	411018	IN
842	1442	3342	200342	100342	Harshal	Shinde	ShindeH	harshal.shinde@thyssenkrupp.com	10446906	9889	WORKSHOP SUPERVISORS (Dept Code: 5061)	WORKSHOP SUPERVISORS (Dept Code: 5061)	+91 20 6612 4414	Pune	Maharashtra	411018	IN
843	1443	3343	200343	100343	Rajesh	Santhanam	SanthanamR	rajesh.santhanam@thyssenkrupp.com	10447279	90520	Services (Dept code) : 7808	Services (Dept code) : 7808	+91 20 6612 4192	Pune	Maharashtra	411018	IN
844	1444	3344	200344	100344	Pradeep	Chitale	ChitaleP	pradeep.chitale@thyssenkrupp.com	10383827	9775	Finance Controlling(Dept. Code:7607)	Finance Controlling(Dept. Code:7607)	+91 20 66124523	Pune	Maharashtra	411018	IN
845	1445	3345	200345	100345	Vishal	Waghole	WagholeV	vishal.waghole@thyssenkrupp.com	10446892	9755	CEMENT  ENGINEERING (Dept Code: 6003)	Plant Design (Post Order) Group (Dept Code: 6009)	+91 20 6612 4148	Pune	Maharashtra	\N	IN
846	1446	3346	200346	100346	Raheem	Ieleyas	IeleyasR	raheem.ieleyas@thyssenkrupp.com	10446865	9542	Services Dept.	Services Dept.	\N	Pune	Maharashtra	411 018	IN
847	1447	3347	200347	100347	Helpdesk	\N	admin_hd	ITHelpdesk.tkii@thyssenkrupp.com	\N	Orbit	T & IS - Orbit	T & IS - Orbit	+91 20 6612 4177 / 76	\N	\N	\N	\N
848	1448	3348	200348	100348	tkii	Desksupport1	admin_se1	\N	\N	Orbit	T&IS - Orbit	\N	+91 20 6612 4165	Pune	Maharashtra	411018	IN
849	1449	3349	200349	100349	TVS	Srinivas	SrinivasT	tvs.srinivas@thyssenkrupp.com	10383830	9911	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4509	Pune	Maharashtra	411018	IN
850	1450	3350	200350	100350	MK	Subramanian	SubramanianMK	mk.subramanian@thyssenkrupp.com	10426443	90529	ADMINISTRATION ELECTRICAL	ADMINISTRATION ELECTRICAL (Dept Code: 7401)	+91 20 66124608	Pune	Maharashtra	411018	IN
851	1451	3351	200351	100351	Mohammadelias	Khan	KhanE	elias.Khan@thyssenkrupp.com	10446771	90493	Services	Services Dept.	\N	Pune	Maharashtra	411 018	IN
852	1452	3352	200352	100352	Vijay	Patil	PatilVN	vijayn.patil@thyssenkrupp.com	10446815	90233	Services Dept	Services Dept.	\N	Pune	Maharashtra	411 018	IN
1454	2054	3954	200954	100954	Sambantham	Karthikeyan	KarthikeyanS	\N	\N	60057	Services	AFTER SALES SERVICES	\N	Pune	Maharashtra	411018	IN
853	1453	3353	200353	100353	Prince	Oliver	OliverP	Prince.Oliver@thyssenkrupp.com	10447067	90503	CEMENT  EXECUTION (Dept Code: 6004)	PM_Cement_9604	\N	Pune	Maharashtra	411018	IN
854	1454	3354	200354	100354	Aniket	Kulkarni	Kulkarni_AR	\N	\N	90681	WORKSHOP SUPERVISORS (Dept Code: 5061)	WORKSHOP SUPERVISORS (Dept Code: 5061)	+91 20 6612 4423	Pune	Maharashtra	411018	IN
855	1455	3355	200355	100355	Mangesh	Deokar	DeokarM	mangesh.deokar@thyssenkrupp.com	10446352	90543	Preparatory Dept.	Preparatory Dept.	\N	Pune	Maharashtra	411018	IN
856	1456	3356	200356	100356	Anku	Adhikary	AdhikaryA	anku.adhikary@thyssenkrupp.com	10447203	90526	Kolkata Office	Kolkata Office	+91 033 6605 5212	Pune	Maharashtra	411018	IN
857	1457	3357	200357	100357	Joydeep	Sarkar	SarkarJ	joydeep.sarkar@thyssenkrupp.com	10445685	90507	Kolkata Office	Kolkata Office	+91 033 6605 5210	Pune	Maharashtra	411018	IN
858	1458	3358	200358	100358	Y	Prasanth	PrasanthY	y.prasanth@thyssenkrupp.com	10488569	98050	Hyderabad Office	Hyderabad Office	040-2794 1408	Pune	Maharashtra	411018	IN
859	1459	3359	200359	100359	Afzal	Khan	KhanA	afzal.khan@thyssenkrupp.com	10447235	90239	Services  (Dept. Code: 7805 )	Services	\N	Pune	Maharashtra	411018	IN
860	1460	3360	200360	100360	Vinayak	Pimpalkar	PimpalkarV	\N	\N	90608	QUALITY-NDT (Dept Code:5402)	Quality Assurance (Site)	\N	Pune	Maharashtra	411018	IN
861	1461	3361	200361	100361	Rahul	Patil	PatilRR	\N	\N	16129	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	020-6612 4814	Pune	Maharashtra	411018	IN
862	1462	3362	200362	100362	Tapadev	Das	DasTD	Tapadev.Das@thyssenkrupp.com	10445730	90497	Kolkatta Office	Kolkata Office	+91 033 6605 5211	Pune	Maharashtra	411018	IN
863	1463	3363	200363	100363	Alexander	Joseph	JosephA	\N	\N	90609	QUALITY-SUBCONTRACT(Dept Code:5403)	Quality Assurance (Production)	\N	Pune	Maharashtra	411018	IN
864	1464	3364	200364	100364	Mohasin	Mujawar	MujawarM	Mohasin.Mujawar@ThyssenKrupp.com	10446756	9264	CEMENT  EXECUTION (Dept Code: 6004)	CEMENT  EXECUTION (Dept Code: 6004)	+91 20 66124161	Pune	Maharashtra	411018	IN
865	1465	3365	200365	100365	Pradeep	Jagtap	JagtapP	pradeep.jagtap@thyssenkrupp.com	10417931	9857	ENGG./EXECUTION INSTRUMENTATION (Dept Code: 7404)	ENGG./EXECUTION INSTRUMENTATION (Dept Code: 7404)	+91 20 6612 4138	Pune	Maharashtra	411018	IN
866	1466	3366	200366	100366	Satyendra	Jha	JhaS	satyendra.jha@thyssenkrupp.com	10393263	90396	Commercial (Dept. Code:7630)	Commercial (Dept. Code:7630)	+91 20 66124024	Pune	Maharashtra	411018	IN
867	1467	3367	200367	100367	Priyanka	Mishra	MishraP	priyanka.mishra@thyssenkrupp.com	10488491	90808	CIVIL EXECUTION (Dept Code: 7202)	CIVIL EXECUTION (Dept Code: 7202)	+91 20  6612 4350	Pune	Maharashtra	411018	IN
868	1468	3368	200368	100368	Aniket	Kadekar	KadekarA	aniket.kadekar@thyssenkrupp.com	10445548	9440	QUALITY -BOUGHTOUT (Dept Code: 5405)	QUALITY -BOUGHTOUT (Dept Code: 5405)	+91 20 6612 4009	Pune	Maharashtra	\N	IN
869	1469	3369	200369	100369	Nikhil	Desai	DesaiN	Nikhil.Desai@ThyssenKrupp.com	10446856	9488	CEMENT  EXECUTION (Dept Code: 6004)	PM_Cement_9604	+91 20 6612 4689	\N	\N	\N	\N
870	1470	3370	200370	100370	Kalpak	Surve	SurveK	kalpak.surve@thyssenkrupp.com	10447317	90364	Estimation(Dept. Code:7620)	Estimation(Dept. Code:7620)	+91 20 6612 4625	Pune	Maharashtra	411018	IN
871	1471	3371	200371	100371	Kalim	Shaikh	ShaikhK	kalim.shaikh@thyssenkrupp.com	10446824	90536	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4035	Pune	Maharashtra	411018	IN
872	1472	3372	200372	100372	Sumesh	Sawant	SawantS	Sumesh.Sawant@thyssenkrupp.com	10431226	90459	Contract Management	PM_Planning_9704	+91 20 6612 4504	Pune	Maharashtra	411018	IN
873	1473	3373	200373	100373	Pavan	Mahale	MahaleP	pavan.mahale@thyssenkrupp.com	10446920	90046	BOILER  EXECUTION (Dept Code: 2004)	PM_B&PP_9204	+91 20 6612 4585	Pune	Maharashtra	411018	IN
874	1474	3374	200374	100374	Yuvvraaj	Marralkar	MaralkarY	yuvvraaj.marralkar@thyssenkrupp.com	10447099	9487	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	+91 20 6612 4628	Pune	Maharashtra	411018	IN
875	1475	3375	200375	100375	Suntosh	Utekarr	UtekarrS	suntosh.utekarr@thyssenkrupp.com	10446925	90155	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	+91 20 6612 4502	Pune	Maharashtra	411018	IN
876	1476	3376	200376	100376	Abid	Shahbad	ShahbadA	abid.shahbad@thyssenkrupp.com	10446874	9611	CEMENT  EXECUTION (Dept Code: 6004)	PM_Cement_9604	+91 20  6612 4228	Pune	Maharashtra	411018	IN
877	1477	3377	200377	100377	Kedareshwar	Kurle	KurleK	kedareshwar.kurle@thyssenkrupp.com	10446930	90221	CEMENT  SELLING (Dept Code: 6002)	CEMENT  SELLING (Dept Code: 6002)	+91 20 6612 4714	Pune	Maharashtra	411018	IN
878	1478	3378	200378	100378	Malhar	Inamdar	InamdarM	malhar.inamdar@thyssenkrupp.com	10383729	15533	CEMENT  ENGINEERING (Dept Code: 6003)	Plant Design (Post Order) Group (Dept Code: 6009)	+91 20 6612 4537	Pune	Maharashtra	411018	IN
879	1479	3379	200379	100379	Sudhakar	Pawar	PawarsK	sudhakar.pawar@ThyssenKrupp.com	10383751	1858675	SUGAR  ENGINEERING (Dept Code: 4003)	SUGAR  ENGINEERING (Dept Code: 4003)	+91 20 66124182	Pune	Maharashtra	411018	IN
880	1480	3380	200380	100380	Pankaj	Malhotra	MalhotraP	pankaj.malhotra@thyssenkrupp.com	10435457	90556	Management Assurance (Dept.Code 7610)	Management Assurance (Dept.Code 7610)	+91 20 6612 4659	Pune	Maharashtra	411018	IN
881	1481	3381	200381	100381	Shrirang	Shinde	ShindeSS	shrirang.shinde@thyssenkrupp.com	\N	PFS40	Boiler Management (Dept Code: 2001)	Boiler Management (Dept Code: 2001)	+91 20 6612 4064	Pune	Maharashtra	411018	IN
882	1482	3382	200382	100382	Parbate	D	ParbateD	parbate.d@thyssenkrupp.com	10446750	9011	SUGAR  ENGINEERING (Dept Code: 4003)	SUGAR  ENGINEERING (Dept Code: 4003)	+91 20 6612 4301	Pune	Maharashtra	411018	IN
883	1483	3383	200383	100383	Thipse	Mangesh	ThipseM	mangesh.thipse@thyssenkrupp.com	10446755	9245	QUALITY-  PRODUCTION (Dept Code: 5403)	QUALITY-  PRODUCTION (Dept Code: 5403)	+91 20 6612 4375	Pune	Maharashtra	411018	IN
884	1484	3384	200384	100384	Atonu	Bhattacharya	BhattacharyaA	Atonu.Bhattacharya@ThyssenKrupp.com	10242539	5909	CEMENT  SELLING (Dept Code: 6002)	Cement Selling Group (Dept Code: 6002)	+91 20 66124134	Pune	Maharashtra	411018	IN
885	1485	3385	200385	100385	Sekhar	Sasmal	SasmalS	sekhar.sasmal@thyssenkrupp.com	10446806	9635	CEMENT  SELLING (Dept Code: 6002)	Cement Selling Group (Dept Code: 6002)	+91 20 6612 4152	Pune	Maharashtra	411018	IN
886	1486	3386	200386	100386	Abhijeet	Uppin	UppinA	abhijeet.uppin@thyssenkrupp.com	10446898	9828	CEMENT  SELLING (Dept Code: 6002)	Cement Selling Group (Dept Code: 6002)	+91 20 6612 4544	Pune	Maharashtra	411018	IN
887	1487	3387	200387	100387	Vikas	Bharti	BhartiV	vikas.bharti@thyssenkrupp.com	10446810	9791	CEMENT  SELLING (Dept Code: 6002)	Cement Selling Group (Dept Code: 6002)	+91 20 6612 4759	Pune	Maharashtra	411018	IN
888	1488	3388	200388	100388	Indraneel	Dassharma	DassharmaI	indraneel.dassharma@thyssenkrupp.com	10446910	9927	CEMENT  SELLING (Dept Code: 6002)	Cement Selling Group (Dept Code: 6002)	+91 20 6612 4133	Pune	Maharashtra	411018	IN
889	1489	3389	200389	100389	Kunal	Parundekar	ParundekarK	kunal.parundekar@thyssenkrupp.com	10447260	90356	MHE  SELLING (Dept Code: 3002)	MHE  SELLING (Dept Code: 3002)	+91 20 6612 4167	Pune	Maharashtra	411018	IN
890	1490	3390	200390	100390	Parvez	Shaikh	ShaikhPS	parvez.shaikh@thyssenkrupp.com	10445573	90595	HFS Dept	HFS Dept	\N	Pune	Maharashtra	411018	IN
891	1491	3391	200391	100391	Devendra	Kale	KaleD	devendra.kale@thyssenkrupp.com	10447135	9902	Estimation(Dept. Code:7620)	Estimation(Dept. Code:7620)	+91 20 6612 4623	Pune	Maharashtra	411018	IN
892	1492	3392	200392	100392	Sanket	Konnur	KonnurS	sanket.konnur@thyssenkrupp.com	10447315	90355	Estimation (Dept. Code:7620)	Estimation (Dept. Code:7620)	+91 20 6612 4766	Pune	Maharashtra	411018	IN
893	1493	3393	200393	100393	Milind	Kulkarni	KulkarniM	milinds.kulkarni@thyssenkrupp.com	10383833	90048	MHE  Equipment Cell (Dept. Code: 3002 )	MHE  Equipment Cell (Dept. Code: 3002 )	+ 91 20 6612 4072	Pune	Maharashtra	411018	IN
894	1494	3394	200394	100394	Sagar	Vijan	VijanS	sagar.vijan@thyssenkrupp.com	10447074	90562	Management Assurance (Dept.Code 7610)	Management Assurance (Dept.Code 7610)	+91 20 6612 4252	Pune	Maharashtra	411018	IN
895	1495	3395	200395	100395	Manojkumar	Mali	MaliM	manojkumar.mali@thyssenkrupp.com	10445614	90079	SUGAR  ENGINEERING (Dept Code: 4003)	Sugar Dept.	+91 20 6612 4191	Pune	Maharashtra	411018	IN
896	1496	3396	200396	100396	Bharat	Patel	PatelB	bharatm.patel@thyssenkrupp.com	10442319	90574	Services Dept.	Services Dept.	+91 20 6612 4560	Pune	Maharashtra	411 018	IN
897	1497	3397	200397	100397	Abhinandan	Jadhav	JadhavAB	abhinandan.jadhav@thyssenkrupp.com	10446890	9752	CEMENT  ENGINEERING (Dept Code: 6003)	Proposal Engineering Group (Dept Code: 6003)	+91 20 6612 4545	Pune	Maharashtra	411018	IN
898	1498	3398	200398	100398	Hitesh	Ajmera	AjmeraH	hitesh.ajmera@thyssenkrupp.com	10445558	9581	QUALITY -BOUGHTOUT (Dept Code: 5405)	QUALITY -BOUGHTOUT (Dept Code: 5405)	+91 20 6612 4099	Pune	Maharashtra	411018	IN
899	1499	3399	200399	100399	Sanjeev	Nargund	NargundS	sanjeev.nargund@thyssenkrupp.com	10383732	90129	Design & Engg (CSD)	RESEARCH & DEVELOPMENT	+91 20 6612 4683	Pune	Maharashtra	411018	IN
900	1500	3400	200400	100400	Gangadhar	Kulkarni	KulkarniG	gangadhar.kulkarni@thyssenkrupp.com	10383786	9958	SUGAR  EXECUTION (Dept Code: 4004)	PM_Management_9101	+91 20 6612 4185	Pune	Maharashtra	411018	IN
901	1501	3401	200401	100401	Sujeet	Jagtap	JagtapSS	sujeet.jagtap@thyssenkrupp.com	10445668	90402	DESIGN & ENGINEERING  SUGAR MILL (Dept Code: 7306)	DESIGN & ENGINEERING  SUGAR MILL (Dept Code: 7306)	+91 20 6612 4330	Pune	Maharashtra	411018	IN
902	1502	3402	200402	100402	Srinivas	Juthiga	JuthigaS	srinivas.juthiga@thyssenkrupp.com	10445571	90485	BOILER  ENGINEERING (Dept Code: 2003)	BOILER  ENGINEERING (Dept Code: 2003)	+91 20 6612 4605	Pune	Maharashtra	411018	IN
903	1503	3403	200403	100403	Basavaraj	Malipatil	malipatilb	basavaraj.malipatil@thyssenkrupp.com	10446882	9696	CEMENT  EXECUTION (Dept Code: 6004)	PM_Cement_9604	+91 20 6612 4549	Pune	Maharashtra	411018	IN
904	1504	3404	200404	100404	Shishir	Bhalerao	BhaleraoS	shishir.bhalerao@thyssenkrupp.com	10445564	9717	WORKSHOP SUPERVISORS (Dept Code: 5061)	WORKSHOP SUPERVISORS (Dept Code: 5061)	+91 20 6612 4809	Pune	Maharashtra	411018	IN
905	1505	3405	200405	100405	Vanita	Chandak	ChandakV	vanita.chandak@thyssenkrupp.com	10250937	90285	Finance Controlling (Dept. Code:7607)	Finance Controlling (Dept. Code:7607)	+91 20 6612 4257	Pune	Maharashtra	411018	IN
906	1506	3406	200406	100406	Shashidhar	Bonagiri	BonagiriS	shashidhar.bonagiri@thyssenkrupp.com	10446923	90124	BOILER  ENGINEERING (Dept Code: 2003)	BOILER  ENGINEERING (Dept Code: 2003)	+91 20 6612 4685	Pune	Maharashtra	411018	IN
907	1507	3407	200407	100407	Ankit	Patel	PatelA	ankit.patel@thyssenkrupp.com	10447266	90379	CEMENT  ENGINEERING (Dept Code: 6003)	Post Order Engineering Group (Dept Code: 6008)	+91 20 6612 4732	Pune	Maharashtra	411018	IN
908	1508	3408	200408	100408	Shashikant	Khedkar	KhedkarS	shashikant.khedkar@thyssenkrupp.com	10383782	9535	Boht-Out (Dept. Code:  7702)	Boht-Out Administration	+91 20 6612 4019	Pune	Maharashtra	411018	IN
909	1509	3409	200409	100409	Anand	Kulkarni	KulkarniAA	anand.kulkarni@thyssenkrupp.com	10403084	9957	SUB CONTRACT (Dept. Code:7742  )	Subcontract Department	+91 20 6612 4304	Pune	Maharashtra	411018	IN
910	1510	3410	200410	100410	Banibrata	Mondal	MondalB	banibrata.mondal@thyssenkrupp.com	10445690	90560	Kolkata Office	Kolkata Office	+91 033 6605 5211	Pune	Maharashtra	411018	IN
911	1511	3411	200411	100411	Gajendra	Sangle	SangleG	Gajendra.Sangle@ThyssenKrupp.com	10446844	9336	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4867	\N	\N	\N	\N
912	1512	3412	200412	100412	Sunil	Arbatti	ArbattiS	sunil.arbatti@thyssenkrupp.com	10383785	9892	Services  (Dept. Code: 7805 )	Services	+91 20 6612 4092	Pune	Maharashtra	411018	IN
913	1513	3413	200413	100413	Sachin	Bhosale	BhosaleSR	sachin.bhosale@thyssenkrupp.com	10445652	90174	Design & Engg (CSD)	RESEARCH & DEVELOPMENT (Dept Code: 1100)	+91 20 6612 4627	Pune	Maharashtra	411018	IN
914	1514	3414	200414	100414	Saurabh	Shinde	ShindeSC	saurabh.shinde@thyssenkrupp.com	10447255	90342	CEMENT  SELLING (Dept Code: 6002)	CEMENT  SELLING (Dept Code: 6002)	+91 20 6612 4714	Pune	Maharashtra	411018	IN
915	1515	3415	200415	100415	Santosh	Bobade	BobadeS	santosh.bobade@thyssenkrupp.com	10400545	90222	Boht-Out (Dept. Code:  7702)	Boht-Out (Dept. Code:  7702)	+91 20 6612 4012	Pune	Maharashtra	411018	IN
916	1516	3416	200416	100416	Sandeep	Shinde	ShindeSR	sandeep.shinde@thyssenkrupp.com	10447132	9890	Services Dept	Services Dept	+91 20 6612 4543	Pune	Maharashtra	411018	IN
917	1517	3417	200417	100417	Gopal	Bhosale	BhosaleG	gopal.bhosale@thyssenkrupp.com	10447326	90521	Services Dept. (Dept. Code: 7802)	Services Dept. (Dept. Code: 7802)	+91 20 6612 4093	Pune	Maharashtra	411018	IN
918	1518	3418	200418	100418	Pankaj	Ranadive	RanadiveP	pankaj.ranadive@thyssenkrupp.com	10447191	90344	FINANCE  TAXATION (Dept Code: 7606)	FINANCE  TAXATION (Dept Code: 7606)	+91 20 6612 4232	Pune	Maharashtra	411018	IN
919	1519	3419	200419	100419	Neelesh	Shanbhag	ShanbhagN	Neelesh.Shanbhag@thyssenkrupp.com	10446821	90511	Import Export (Dept. Code:7652)	Import Export (Dept. Code:7652)	+91 20 6612 4051	Pune	Maharashtra	411018	IN
920	1520	3420	200420	100420	Ch	Annapurna	AnnapurnaC	ch.annapurna@thyssenkrupp.com	10447330	98013	Hyderabad Office	Hyderabad Office	040-2794 1301	Pune	Maharashtra	411018	IN
921	1521	3421	200421	100421	Jadhav	P	JadhavP	prashant.jadhav@thyssenkrupp.com	10445712	5889	MHE Project Engineering	MHE Project Engineering	+91 20 6612 4557	Pune	Maharashtra	411018	IN
922	1522	3422	200422	100422	Umakant	Katlawar	KatlawarU	umakant.katlawar@thyssenkrupp.com	10447194	90373	SUGAR  ENGINEERING (Dept Code: 4003)	SUGAR  ENGINEERING (Dept Code: 4003)	+91 20 6612 4202	Pune	Maharashtra	411018	IN
923	1523	3423	200423	100423	Rahul	Krishnaswamy	KrishnaswamyR	rahul.krishnaswamy@thyssenkrupp.com	10446870	9580	MHE  Equipment Cell (Dept. Code: 3007 )	MHE  Equipment Cell (Dept. Code: 3007 )	+91 20 6612 4108	Pune	Maharahtra	411018	IN
924	1524	3424	200424	100424	Prakash	Bhoi	BhoiP	prakash.bhoi@thyssenkrupp.com	10446886	9704	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4552	Pune	Maharashtra	411018	IN
925	1525	3425	200425	100425	Haree	Gend	GendH	haree.gend@thyssenkrupp.com	10446902	9862	MHE  ENGINEERING GR I (Dept Code: 7307)	MHE  ENGINEERING GR I (Dept Code: 7307)	+91 20 6612 4478	Pune	Maharashtra	411018	IN
926	1526	3426	200426	100426	Kantilal	Janrao	JanraoK	kantilal.janrao@thyssenkrupp.com	10445723	90253	DESIGN & ENGINEERING  STRUCTURAL (Dept Code: 7305)	DESIGN & ENGINEERING  STRUCTURAL (Dept Code: 7305)	+91 20 6612 4453	Pune	Maharashtra	411 018	IN
927	1527	3427	200427	100427	Murzban	Mogal	MogalM	Murzban.Mogal@ThyssenKrupp.com	10446845	9352	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	+91 20 6612 4717	\N	\N	\N	\N
928	1528	3428	200428	100428	June	Achar	AcharJ	June.Achar@ThyssenKrupp.com	10447092	5609	SUGAR  MANAGEMENT (Dept Code: 4001)	SUGAR  MANAGEMENT (Dept Code: 4001)	+91 20 66124181	Pune	Maharashtra	411018	IN
929	1529	3429	200429	100429	Udaykumar	Arockiam	ArockiamU	uday.arockiam@Thyssenkrupp.com	10446842	9082	CANTEEN ADMINISTRATION (Dept Code: 5205)	CANTEEN ADMINISTRATION (Dept Code: 5205)	+91 20 6612 4339	Pune	Maharashtra	411018	IN
930	1530	3430	200430	100430	Tarnnum	Inamdar	InamdarT	tarnnum.inamdar@thyssenkrupp.com	10447146	90004	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4885	Pune	Maharashtra	411018	IN
931	1531	3431	200431	100431	Sameer	Kulkarni	KulkarniSV	sameerv.kulkarni@thyssenkrupp.com	10445641	9976	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	+91 20 6612 4676	Pune	Maharashtra	411018	IN
932	1532	3432	200432	100432	Gopal	Prabhu	PrabhuG	Gopal.Prabhu@ThyssenKrupp.com	10383796	5783	FINANCE  TAXATION (Dept Code: 7606)	FINANCE  TAXATION (Dept Code: 7606)	+91 20 66124246	Pune	Maharashtra	411018	IN
933	1533	3433	200433	100433	Mangesh	Karmalkar	KarmalkarM	mangesh.karmalkar@thyssenkrupp.com	10446805	9602	BOILER  EXECUTION (Dept Code: 2004)	PM_MHE_9304	+91 20 6612 4681	Pune	Maharashtra	411018	IN
934	1534	3434	200434	100434	Abhijit	Mohanty	MohantyA	abhijit.mohanty@thyssenkrupp.com	10447262	90375	CEMENT  EXECUTION (Dept Code: 6004)	PM_Cement_9604	+91 20 6612  4594	Pune	Maharashtra	411018	IN
935	1535	3435	200435	100435	Harish	Gaikwad	GaikwadH	Harish.Gaikwad@ThyssenKrupp.com	10446869	9578	CEMENT  ENGINEERING (Dept Code: 6003)	Post Order Engineering Group (Dept Code: 6008)	+91 20 66124174	Pune	Maharashtra	411018	IN
936	1536	3436	200436	100436	Sumit	Karkamkar	KarkamkarS	sumit.karkamkar@thyssenkrupp.com	10447205	90532	VICE CHAIRMAN'S OFFICE (Dept Code: 1001)	VICE CHAIRMAN'S OFFICE (Dept Code: 1001)	+91 20 6612 4677	Pune	maharashtra	411018	IN
937	1537	3437	200437	100437	Rahul	Pote	PoteR	rahul.pote@thyssenkrupp.com	10403080	9627	SUB CONTRACT (Dept. Code: 7742 )	Sub_Contract	+91 20 66124309	pune	Maharashtra	411018	IN
938	1538	3438	200438	100438	Jyoti	Gavali	GavaliJ	jyoti.gavali@thyssenkrupp.com	10447144	9985	CEMENT  ENGINEERING (Dept Code: 6003)	Post Order Engineering Group (Dept Code: 6008)	+91 20 6612 4853	Pune	Maharashtra	411018	IN
939	1539	3439	200439	100439	Devendra	Kshirsagar	KshirsagarD	devendra.kshirsagar@thyssenkrupp.com	10445568	90313	BOQA Dept.	BOQA Dept.	+91 20 6612 4506	Pune	Maharashtra	411018	IN
940	1540	3440	200440	100440	Maitre	R	MaitreR	rajendra.maitre@thyssenkrupp.com	10445547	9142	Quality Assurance	Quality Assurance	+91 20 6612 4377	Pune	Maharashtra	411018	IN
941	1541	3441	200441	100441	Santosh	Killamsetty	SantoshK	santosh.killamsetty@thyssenkrupp.com	10447244	90306	BOILER  EXECUTION (Dept Code: 2004)	PM_MHE_9304	+91 20 6612 4562	Pune	Maharashtra	411018	IN
942	1542	3442	200442	100442	Chaitanya	Rashinkar	RashinkarC	chaitanya.rashinkar@thyssenkrupp.com	10446932	90286	Electrical Maintenance Dept.	Electrical Maintenance Dept.	+91 20 6612 4406	Pune	Maharashtra	411018	IN
943	1543	3443	200443	100443	Sunanda	Malshikare	MalshikareS	sunanda.malshikare@thyssenkrupp.com	10445656	90260	DESIGN & ENGINEERING  SUGAR MILL (Dept. Code: 7306)	DESIGN & ENGINEERING  SUGAR MILL (Dept. Code: 7306)	+91 20 6612 4508	Pune	Maharashtra	411018	IN
944	1544	3444	200444	100444	Kiran	Patil	PatilK	kiran.patil@thyssenkrupp.com	10447142	9966	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	+91 20 6612 4437	Pune	Maharashtra	411018	IN
945	1545	3445	200445	100445	Dipak	Ughade	UghadeD	dipak.ughade@thyssenkrupp.com	10445617	90137	CEMENT  ENGINEERING (Dept Code: 6003)	CEMENT  ENGINEERING (Dept Code: 6003)	+91 20 6612 4060	Pune	Maharashtra	411018	IN
946	1546	3446	200446	100446	Hemant	Bhalerao	BhaleraoH	Hemant.Bhalerao@ThyssenKrupp.com	10446786	5818	Services  (Dept. Code: 7801 )	Services - Administration	+91 20 6612 4107	Pune	Maharashtra	411018	IN
947	1547	3447	200447	100447	Ramesh Mahaling	Swami	RameshMS	ramesh.swami@thyssenkrupp.com	10445648	90136	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	+91 20 66124723	\N	\N	\N	\N
948	1548	3448	200448	100448	Manojkumar	Thakre	ThakreM	manojkumar.thakre@thyssenkrupp.com	10445625	90314	BOQA Dept.	BOQA Dept.	+91 20 6612 4501	Pune	Maharashtra	411018	IN
949	1549	3449	200449	100449	Maruti	Morbale	MorbaleM	maruti.morbale@thyssenkrupp.com	10445611	90026	CEMENT  DESIGN & ENGINEERING (Dept Code: 6005)	Cement Design & Engineering (Dept Code: 6005)	+91 20 6612 4461	Pune	Maharashtra	\N	IN
950	1550	3450	200450	100450	Prashant	Belhekar	BelhekarP	prashant.belhekar@thyssenkrupp.com	10447219	9662	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 66124768	Pune	Maharashtra	411018	IN
951	1551	3451	200451	100451	Amina	Shaikh	ShaikhA	amina.shaikh@thyssenkrupp.com	10447180	90243	CEMENT  ENGINEERING (Dept Code: 6003)	Process Engineering Group (Dept Code: 6010)	+91 20 6612 4859	Pune	Maharashtra	411018	IN
952	1552	3452	200452	100452	Makarand	Chavan	ChavanM	Makarand.Chavan@ThyssenKrupp.com	10446787	5837	FINANCE  INSURANCE (Dept Code: 7605)	FINANCE  INSURANCE (Dept Code: 7605)	+91 20 6612 4243	Pune	Maharashtra	411018	IN
953	1553	3453	200453	100453	Mayuresh	Sonawane	SonawneM	mayuresh.sonawane@thyssenkrupp.com	10447241	90278	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	+91 20 6612 4598	Pune	Maharashtra	411018	IN
1951	2551	4451	201451	101451	Services	VLJ  EI BO	VLJ_EI_BO	servicesvlj.ei.bo@thyssenkrupp.com	\N	\N	\N	O&M of Pet Coke Handling System.	\N	\N	\N	\N	\N
954	1554	3454	200454	100454	Tushar	Yannewar	YannewarT	Tushar.Yannewar@ThyssenKrupp.com	10446759	9339	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	+91 20 66124059	Pune	Maharashtra	411018	IN
955	1555	3455	200455	100455	Ashok	Gaikwad	GaikwadAd	Ashok.Gaikwad@ThyssenKrupp.com	10447310	9929	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4461	Pune	Maharashtra	411018	IN
956	1556	3456	200456	100456	Udaykumar	Raynade	RaynadeU	udaykumar.raynade@thyssenkrupp.com	10446377	90358	DESIGN & ENGINEERING  CRUSHER/SCREEN (Dept Code: 7304)	DESIGN & ENGINEERING  CRUSHER/SCREEN (Dept Code: 7304)	+91 20 6612 4220	Pune	Maharashtra	411018	IN
957	1557	3457	200457	100457	Vijay	Paygude	PaygudeV	vijay.paygude@thyssenkrupp.com	10403086	90338	SUB CONTRACT (Dept. Code: 7742 )	SUB CONTRACT (Dept. Code: 7742 )	+91 20 6612 4311	Pune	Maharashtra	411018	IN
958	1558	3458	200458	100458	Ganesh	Deshmukh	DeshmukhG	ganesh.deshmukh@thyssenkrupp.com	10447122	9827	Cement Engineering	Cement Design & Engineering (Dept Code: 6005)	+91 20 6612 4556	Pune	Maharashtra	411018	IN
959	1559	3459	200459	100459	Dharmadhikari	U	DharmadhikariU	ujwal.dharmadhikari@thyssenkrupp.com	10445556	9263	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	+91 20 6612 4442	Pune	Maharashtra	411018	IN
960	1560	3460	200460	100460	Nitin	Panchbhai	PanchbhaiN	nitin.panchbhai@thyssenkrupp.com	10447304	90652	Purchase	Purchase	+91 20 6612 4287	Pune	Maharashtra	411018	IN
961	1561	3461	200461	100461	Navnath	Mane	ManeN	navnath.mane@thyssenkrupp.com	10445657	90291	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	+91 20 6612 4656	Pune	Maharashtra	411018	IN
962	1562	3462	200462	100462	Harshal	Wani	WaniH	harshal.wani@thyssenkrupp.com	10445681	90446	DESIGN & ENGINEERING  SUGAR MILL (Dept Code: 7306)	DESIGN & ENGINEERING  SUGAR MILL (Dept Code: 7306)	+91 20 6612 4782	Pune	Maharashtra	411018	IN
963	1563	3463	200463	100463	Betty	Dcruz	DcruzB	betty.dcruz@thyssenkrupp.com	10447307	9465	COMMERCIAL & SECRETARIAL department (7630)	COMMERCIAL & SECRETARIAL department (7630)	+91 20 6612 4021	Pune	Maharashtra	411018	IN
964	1564	3464	200464	100464	Cyril	Joseph	JosephC	cyril.joseph@thyssenkrupp.com	10403094	9071	ADMINISTRATION (Dept Code: 7009)	ADMINISTRATION (Dept Code: 7009)	+91 20 6612 4343	Pune	Maharashtra	411018	IN
965	1565	3465	200465	100465	Mahesh	Ghongade	GhongadeM	mahesh.ghongade@thyssenkrupp.com	10446897	9825	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	+91 20 6612 4649	Pune	Maharashtra	411018	IN
966	1566	3466	200466	100466	Anil	Kakade	KakadeA	Anil.Kakade@thyssenkrupp.com	10447111	9709	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4489	Pune	Maharashtra	411018	IN
967	1567	3467	200467	100467	Amit	Patil	PatilAB	amit.patil@thyssenkrupp.com	10447140	9948	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4883	Pune	Maharashtra	411018	IN
968	1568	3468	200468	100468	Pradip	Gosavi	GosaviP	Pradip.Gosavi@ThyssenKrupp.com	10446849	9414	CEMENT  ENGINEERING (Dept Code: 6003)	Plant Design (Proposal) Group (Dept Code: 6004)	+91 20 6612 4875	\N	\N	\N	\N
969	1569	3469	200469	100469	Venkata	Nandipati	NandipatiV	venkata.nandipati@thyssenkrupp.com	10445616	90125	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	+91 20 6612 4089	Pune	Maharashtra	411018	IN
970	1570	3470	200470	100470	Chetan	Jadhav	JadhavC	chetan.jadhav@thyssenkrupp.com	10447138	9938	CEMENT  DESIGN & ENGINEERING (Dept Code: 6005)	Cement Design & Engineering (Dept Code: 6005)	+91 20 6612 4734	Pune	Maharashtra	411018	IN
971	1571	3471	200471	100471	Prasad	Kale	KalePV	prasad.kale@thyssenkrupp.com	10446803	9590	MHE  ENGINEERING GR I (Dept Code: 7307)	MHE  ENGINEERING GR I (Dept Code: 7307)	+91 20 6612 4073	Pune	Maharashtra	411018	IN
972	1572	3472	200472	100472	Mahesh	Patil	PatilMA	mahesha.patil@thyssenkrupp.com	10447303	9822	Mech. Maintenance Dept.	Mech. Maintenance Dept.	\N	Pune	Maharashtra	411018	IN
973	1573	3473	200473	100473	Saurabh	Kumar	KumarS	saurabh.kumar@thyssenkrupp.com	10447151	90028	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4602	Pune	Maharashtra	411018	IN
974	1574	3474	200474	100474	Vinay	Mhaske	MhaskeV	vinay.mhaske@thyssenkrupp.com	10447222	90020	Services  (Dept. Code: 7801)	Services  (Dept. Code: 7801)	+91 20 6612 4526	Pune	Maharashtra	411018	IN
975	1575	3475	200475	100475	Bharat	Suryawanshi	SuryawanshiB	bharat.suryawanshi@thyssenkrupp.com	10446807	9721	CEMENT  ENGINEERING (Dept Code: 6003)	Plant Design (Post Order) Group (Dept Code: 6009)	+ 91 20 6612 4876	Pune	Maharashtra	411018	IN
976	1576	3476	200476	100476	Sagar	Deshmukh	Deshmukh_S	sagar.deshmukh@thyssenkrupp.com	10447171	90153	CEMENT  ENGINEERING (Dept Code: 6003)	Post Order Engineering Group (Dept Code: 6008)	+91 20 6612 4732	Pune	Maharashtra	411018	IN
977	1577	3477	200477	100477	Shreenivas	Kale	KaleS	shreenivas.kale@thyssenkrupp.com	10445559	9614	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4771	Pune	Maharashtra	411018	IN
978	1578	3478	200478	100478	Nilesh	Akolkar	AkolkarN	Nilesh.Akolkar@ThyssenKrupp.com	10446848	9413	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4810	\N	\N	\N	\N
979	1579	3479	200479	100479	Raviraj	Belvalkar	BelvalkarR	raviraj.belvalkar@thyssenkrupp.com	10447152	90030	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4601	Pune	Maharashtra	411018	IN
980	1580	3480	200480	100480	Dilip	Joshi	JoshiD	Dilip.Joshi@ThyssenKrupp.com	10383698	15526	PERSONNEL  ADMINISTRATION (Dept Code: 5202)	PERSONNEL  ADMINISTRATION (Dept Code: 5202)	+91 20 6612 4356	Pune	Maharashtra	411018	IN
981	1581	3481	200481	100481	Wadingekar	D	wadingekarD	dattatraya.wadingekar@thyssenkrupp.com	10445721	90212	Sugar Mill Design	Sugar Mill Design	+91 20 6612 4709	Pune	Maharashtra	411018	IN
982	1582	3482	200482	100482	Vikas	Salunke	SalunkeV	vikas.salunke@thyssenkrupp.com	10446852	9430	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4868	\N	\N	\N	\N
983	1583	3483	200483	100483	Ashwini	Telekone	TelekoneA	ashwini.telekone@thyssenkrupp.com	10445692	90571	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4445	Pune	Maharashtra	411018	IN
984	1584	3484	200484	100484	Niranjan	Bhate	BhateN	Niranjan.Bhate@ThyssenKrupp.com	10447096	9353	FINANCE  BOOK KEEPING (Dept Code: 7602)	FINANCE  BOOK KEEPING (Dept Code: 7602)	+91 20 6612 4234	\N	\N	\N	\N
1050	1650	3550	200550	100550	Manishkumar	Tiwari	TiwariM	manishkumar.tiwari@thyssenkrupp.com	10393251	90388	BOILER  EXECUTION (Dept Code: 2004)	PM_B&PP_9204	+91 20 6612 4082	Pune	Maharashtra	411018	IN
985	1585	3485	200485	100485	Nilesh	Godase	GodaseN	nilesh.godase@thyssenkrupp.com	10445618	90156	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	+91 20 6612 4487	Pune	Maharashtra	411018	IN
986	1586	3486	200486	100486	Ashish	Barthwal	BarthwalA	ashish.barthwal@thyssenkrupp.com	10422197	90435	Services Dept. (Dept. Code: 7802)	Services Dept. (Dept. Code: 7802)	020 6612 4671	Pune	Maharashtra	411018	IN
987	1587	3487	200487	100487	Yogesh	Jahagirdar	JahagirdarY	yogesh.jahagirdar@thyssenkrupp.com	10446814	90231	MHE  ENGINEERING GR I (Dept Code: 7307)	MHE  ENGINEERING GR I (Dept Code: 7307)	+91 20 6612 4559	Pune	Maharashtra	411018	IN
988	1588	3488	200488	100488	Amit	Bhoomkar	BhoomkarA	amit.bhoomkar@thyssenkrupp.com	10446915	90009	BOILER  SELLING (Dept Code: 2002)	BOILER  SELLING (Dept Code: 2002)	+91 20 6612 4621	Pimpri	Maharashtra	411018	IN
989	1589	3489	200489	100489	Sheetal	Kulkarni	KulkarniSH	sheetal.kulkarni@thyssenkrupp.com	10422198	5856	Commercial (Dept. Code:7630)	Commercial (Dept. Code:7630)	+91 20 6612 4026	Pune	Maharashtra	411018	IN
990	1590	3490	200490	100490	Umakant	Godase	GodaseU	umakant.godase@thyssenkrupp.com	10431218	9848	SUGAR  EXECUTION (Dept Code: 4004)	SUGAR  EXECUTION (Dept Code: 4004)	+91 20 6612 4186	Pune	Maharashtra	411018	IN
991	1591	3491	200491	100491	Amol	Patil	PatilAD	amold.patil@thyssenkrupp.com	10445667	90401	DESIGN & ENGINEERING  SUGAR MILL (Dept Code: 7306)	DESIGN & ENGINEERING  SUGAR MILL (Dept Code: 7306)	+91 20 6612 4840	Pune	Maharashtra	411018	IN
992	1592	3492	200492	100492	Ravi	Vardhannavar	VardhannavarR	ravi.vardhannavar@thyssenkrupp.com	10447070	90513	Services Dept	Services	+91 20 2742 4673	Pune	Maharashtra	411018	IN
993	1593	3493	200493	100493	MahajanS	V	MahajanSV	smita.mahajan@thyssenkrupp.com	10447093	5753	FINANCE  BOOK KEEPING (Dept Code: 7602)	FINANCE  BOOK KEEPING (Dept Code: 7602)	+91 20 6612 4238	Pune	Maharashtra	411018	IN
994	1594	3494	200494	100494	Joel	Chinan	ChinanJ	chinan.joel@thyssenkrupp.com	10383850	5781	WORKSHOP SUPERVISORS (Dept Code: 5061)	WORKSHOP SUPERVISORS (Dept Code: 5061)	+91 20 66124393	Pune	Maharashtra	411018	IN
995	1595	3495	200495	100495	Digvijay	Patil	Patil_D	digvijay.patil@thyssenkrupp.com	10447182	90262	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4016	Pune	Maharashtra	411018	IN
996	1596	3496	200496	100496	Amin	Irani	IraniA	amin.irani@thyssenkrupp.com	10446911	9971	DIRECTOR OPERATIONS OFFICE (Dept Code: 1005)	DIRECTOR OPERATIONS OFFICE (Dept Code: 1005)	+91 20 6612 4634	Pune	Maharashtra	411018	IN
997	1597	3497	200497	100497	Kaknani	Suresh	KaknaniS	Suresh.Kaknani@thyssenkrupp.com	10447305	5492	Stores Dept.	Stores Dept.	+91 20 6612 4333	Pune	Maharashtra	411018	IN
998	1598	3498	200498	100498	Abhijit	Bubane	BubaneA	abhijit.bubane@thyssenkrupp.com	10447224	90121	CEMENT  EXECUTION (Dept Code: 6004)	PM_Cement_9604	+91 20 6612 4171	Pune	Maharashtra	411018	IN
999	1599	3499	200499	100499	Raghvendra	Savant	SavantR	raghvendra.savant@thyssenkrupp.com	10447223	90098	BOILER  EXECUTION (Dept Code: 2004)	PM_B&PP_9204	+91 20 6612 4584	Pune	Maharashtra	411018	IN
1000	1600	3500	200500	100500	Khedkar	N	KhedkarN	nitin.khedkar@thyssenkrupp.com	10445583	9318	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	+91 20 6612 4648	\N	\N	\N	\N
1001	1601	3501	200501	100501	Vinayak	Belekar	BelekarV	Vinayak.Belekar@ThyssenKrupp.com	10446850	9415	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4878	\N	\N	\N	\N
1002	1602	3502	200502	100502	Vijay	Vishwasrao	VishwasraoV	Vijay.Vishwasrao@ThyssenKrupp.com	10383822	9418	SUB CONTRACT (Dept. Code: 7742 )	SUB CONTRACT	+91 20 66124267	Pune	Maharashtra	411018	IN
1003	1603	3503	200503	100503	Sandesh	Amrutkar	AmrutkarS	sandesh.amrutkar@thyssenkrupp.com	10447316	90362	Estimation (Dept. Code:7620)	Estimation Dept	+91 20 6612 4111	Pune	Maharashtra	411018	IN
1004	1604	3504	200504	100504	Manmohan	Kotibhaskar	KotibhaskarM	manmohan.kotibhaskar@thyssenkrupp.com	10446859	9495	QUALITY- TESTING & RECEIVING (Dept Code: 5402)	QUALITY- TESTING & RECEIVING (Dept Code: 5402)	+91 20 6612 4338	pune	maharashtra	411018	IN
1005	1605	3505	200505	100505	Hemant	Jadhav	JadhavH	hemant.jadhav@thyssenkrupp.com	10403072	9546	Purchase-Material (Dept. Code: 7712 )	Purchase - Administration	+91 20 6612 4253	Pune	Maharashtra	411018	IN
1006	1606	3506	200506	100506	Virendra	Bandgar	BandgarV	Virendra.Bandgar@ThyssenKrupp.com	10446843	9335	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4772	\N	\N	\N	\N
1007	1607	3507	200507	100507	Durgaprasad	Naraharisetty	NaraharisettyD	durgaprasad.naraharisetty@thyssenkrupp.com	10447243	90290	QUALITY-  PRODUCTION (Dept Code: 5403)	QUALITY-  PRODUCTION (Dept Code: 5403)	+91 20 6612 4519	Pune	Maharashtra	411018	IN
1008	1608	3508	200508	100508	Sandeep	Thorat	ThoratSP	sandeep.thorat@thyssenkrupp.com	10447311	90092	SUGAR  ENGINEERING (Dept Code: 4003)	SUGAR  ENGINEERING (Dept Code: 4003)	+91 20 6612 4516	Pune	Maharashtra	411018	IN
1009	1609	3509	200509	100509	Vaibhav	Videkar	VidekarV	vaibhav.videkar@thyssenkrupp.com	10445609	90024	CEMENT  DESIGN & ENGINEERING (Dept Code: 6005)	Cement Design & Engineering (Dept Code: 6005)	+91 20 6612 4736	Pune	Maharashtra	411018	IN
1010	1610	3510	200510	100510	Yashwant	Pawar	PawarY	yashwant.pawar@thyssenkrupp.com	10447159	90100	BOILER  EXECUTION (Dept Code: 2004)	PM_B&PP_9204	+91 20 6612 4699	Pune	Maharashtra	411018	IN
1011	1611	3511	200511	100511	Shah	R	ShahR	rajesh.shah@thyssenkrupp.com	10445545	9175	WORKSHOP  P.P.PLANNING (Dept Code: 5002)	WORKSHOP  P.P.PLANNING (Dept Code: 5002)	+91 20 6612 4762	Pune	Maharashtra	411018	IN
1012	1612	3512	200512	100512	Datta	Nimbalkar	NimbalkarD	datta.nimbalkar@thyssenkrupp.com	10447183	90269	CEMENT  ENGINEERING (Dept Code: 6003)	Plant Design (Proposal) Group (Dept Code: 6004)	+91 20 6612 4891	Pune	Maharashtra	411018	IN
1013	1613	3513	200513	100513	Mayur	Palkhe	PalkheM	mayur.palkhe@thyssenkrupp.com	10447321	90391	Estimation (Dept. Code:7620)	Estimation (Dept. Code:7620)	+91 20 6612 4514	Pune	Maharashtra	411018	IN
1014	1614	3514	200514	100514	Abhijeet	Patil	PatilA	abhijeet.patil@thyssenkrupp.com	10447123	9834	SUGAR  ENGINEERING (Dept Code: 4003)	SUGAR  ENGINEERING (Dept Code: 4003)	+91 20 6612 4225	Pune	Maharashtra	411018	IN
1015	1615	3515	200515	100515	Jahiruddin	Inamdar	InamdarJ	Jahiruddin.inamdar@thyssenkrupp.com	10445592	9688	DESIGN & ENGINEERING  SUGAR MILL (Dept Code: 7306)	DESIGN & ENGINEERING  SUGAR MILL (Dept Code: 7306)	+91 20 6612 4330	Pune	Maharashtra	411018	IN
1016	1616	3516	200516	100516	Venkataramanan	Iyer	IyerV	Venkataramanan.Iyer@ThyssenKrupp.com	10403067	9337	Purchase-Material (Dept. Code: 7712 )	Purchase-Material (Dept. Code: 7712 )	+91 20 6612 4269	\N	\N	\N	\N
1051	1651	3551	200551	100551	Deepak	Gawande	GawandeD	deepakp.gawande@thyssenkrupp.com	10447164	90120	CEMENT  EXECUTION (Dept Code: 6004)	PM_MHE_9304	+91 20 6612 4691	Pune	Maharashtra	411018	IN
1017	1617	3517	200517	100517	Pankaj	Pachghare	PachghareP	pankaj.pachghare@thyssenkrupp.com	10445607	9969	CEMENT  ENGINEERING (Dept Code: 6003)	Plant Design (Post Order) Group (Dept Code: 6009)	+91 20 6612 4893	Pune	Maharashtra	411018	IN
1018	1618	3518	200518	100518	Ganesh	Chavan	ChavanG	ganesh.chavan@thyssenkrupp.com	10403093	9455	WORKSHOP SUPERVISORS (Dept Code: 5061)	WORKSHOP SUPERVISORS (Dept Code: 5061)	+91 20 6612 4783	Pune	Maharashtra	411018	IN
1019	1619	3519	200519	100519	Pramod	Kamble	KambleP	pramod.kamble@thyssenkrupp.com	10445640	9968	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	+91 20 6612 4057	Pune	Maharashtra	411018	IN
1020	1620	3520	200520	100520	Anup	Shintre	ShintreA	anup.shintre@thyssenkrupp.com	10403057	90170	Boht-Out (Dept. Code: 7702 )	BOHT Dept.	+91 20 6612 4616	Pune	Maharashtra	411018	IN
1021	1621	3521	200521	100521	Abhay	Kulkarni	KulkarniAM	Abhay.Kulkarni@ThyssenKrupp.com	10383797	5823	Boht-Out (Dept. Code:  7702)	Boht-Out	+91 20 6612 4275	Pune	Maharashtra	411018	IN
1022	1622	3522	200522	100522	Uttam	Patil	PatilUT	uttam.patil@thyssenkrupp.com	10445746	90792	CEMENT  DESIGN & ENGINEERING (Dept Code: 6005)	Cement Design & Engineering (Dept Code: 6005)	+91 20 6612 4735	Pune	Maharashtra	411018	IN
1023	1623	3523	200523	100523	Ravindra	Raut	RautR	ravindra.raut@thyssenkrupp.com	10445622	90208	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4849	Pune	Maharashtra	411018	IN
1024	1624	3524	200524	100524	Sunil	Ghare	GhareS	sunil.ghare@thyssenkrupp.com	10445686	90516	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4746	Pune	Maharashtra	\N	IN
1025	1625	3525	200525	100525	Sumedh	Gadgil	GadgilS	Sumedh.Gadgil@ThyssenKrupp.com	10383804	9018	QUALITY -BOUGHTOUT (Dept Code: 5405)	QUALITY -BOUGHTOUT (Dept Code: 5405)	+91 20 66124834	Pune	Maharashtra	411018	IN
1026	1626	3526	200526	100526	Patil	Manoj	PatilM	manoj.patil@thyssenkrupp.com	10445581	9066	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	+91 20 6612 4725	Pune	Maharashtra	411018	IN
1027	1627	3527	200527	100527	Dilip	Thombare	ThombareD	dilip.thombare@thyssenkrupp.com	10445591	9669	CEMENT  ENGINEERING (Dept Code: 6003)	Plant Design (Post Order) Group (Dept Code: 6009)	020 6612 4892	Pune	Mahareshtra	411018	IN
1028	1628	3528	200528	100528	Sandeep	Sagare	SagareS	sandeep.sagare@thyssenkrupp.com	10447242	90283	CIVIL EXECUTION (Dept Code: 7202)	CIVIL EXECUTION (Dept Code: 7202)	+91 20 6612 4512	Pune	Maharashtra	411018	IN
1029	1629	3529	200529	100529	Amarnath	Deshmukh	DeshmukhA	amarnath.deshmukh@thyssenkrupp.com	10445619	90175	CEMENT  ENGINEERING (Dept Code: 6003)	Plant Design (Post Order) Group (Dept Code: 6009)	+91 20 6612 4147	Pune	Maharashtra	411018	IN
1030	1630	3530	200530	100530	Digambar	Kadam	KadamD	digambar.kadam@thyssenkrupp.com	10445593	9708	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4804	Pune	Maharashtra	411018	IN
1031	1631	3531	200531	100531	Albert	Kurian	KurianA	albert.kurian@thyssenkrupp.com	10447167	90132	BOILER  EXECUTION (Dept Code: 2004)	PM_B&PP_9204	+91 20 6612 4698	Pune	Maharashtra	411018	IN
1032	1632	3532	200532	100532	Tushar	Dawange	DawangeT	tushar.dawange@thyssenkrupp.com	10446926	90177	BOILER  SELLING (Dept Code: 2002)	BOILER  SELLING (Dept Code: 2002)	+91 20 6612 4722	Pune	Maharashtra	411018	IN
1033	1633	3533	200533	100533	Shreyas	Kulkarni	KulkarniShreyas	shreyas.kulkarni@thyssenkrupp.com	10447115	9754	CEMENT  DESIGN & ENGINEERING (Dept Code: 6005)	Cement Design & Engineering (Dept Code: 6005)	+91 20 6612 4735	Pune	Maharashtra	411018	IN
1034	1634	3534	200534	100534	Mukund	Kulkarni	kulkarniMD	mukund.kulkarni@thyssenkrupp.com	10383834	90075	Purchase Dept. (Dept. Code:7712  )	Purchase Dept.	+91 20 6612 4651	Pune	Maharashtra	411018	IN
1035	1635	3535	200535	100535	Rohit	Chavan	ChavanRR	rohit.chavan@thyssenkrupp.com	10447158	90099	BOILER  EXECUTION (Dept Code: 2004)	PM_B&PP_9204	+91 20 6612 4697	Pune	Maharashtra	411018	IN
1036	1636	3536	200536	100536	Yogesh	Wayase	WayaseY	yogesh.wayase@thyssenkrupp.com	10447117	9807	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	+91 20 6612 4463	Pune	Maharashtra	411018	IN
1037	1637	3537	200537	100537	Bijoy	Balram	BijoyB	bijoy.balram@thyssenkrupp.com	10447173	90163	BOILER  ENGINEERING (Dept Code: 2003)	BOILER  ENGINEERING (Dept Code: 2003)	+91 20 6612 4720	Pune	Maharashtra	411018	IN
1038	1638	3538	200538	100538	Kolhe	Shirish	KolheS	shirish.kolhe@thyssenkrupp.com	10447091	5394	CEMENT  ENGINEERING (Dept Code: 6003)	Post Order Engineering Group (Dept Code: 6008)	+91 20 6612 4551	Pune	Maharashtra	411018	IN
1039	1639	3539	200539	100539	Randhir	Korhale	KorhaleR	randhir.korhale@thyssenkrupp.com	10446916	90010	QUALITY- TESTING & RECEIVING (Dept Code: 5402)	QUALITY- TESTING & RECEIVING (Dept Code: 5402)	+91 20 6612 4378	Pune	Maharashtra	411018	IN
1040	1640	3540	200540	100540	Sachin	Telake	TelakeS	sachin.telake@thyssenkrupp.com	10447119	9818	QUALITY- SITE (Dept Code: 5406)	QUALITY- SITE (Dept Code: 5406)	+91 20 6612 4371	Pune	Maharahstra	411018	IN
1041	1641	3541	200541	100541	Ravindranath	Patil	PatilRB	ravindranath.patil@thyssenkrupp.com	10393264	90217	CIVIL EXECUTION (Dept Code: 7202)	CIVIL EXECUTION (Dept Code: 7202)	+91 20  66124643	Pune	Maharashtra	411018	IN
1042	1642	3542	200542	100542	lakshminath	Dwara	DwaraL	lakshminath.dwara@thyssenkrupp.com	10431189	90162	MHE Project Execution (Dept.3004)	PM_Cement_9604	+91 20 6612 4695	Pune	Maharashtra	411018	IN
1043	1643	3543	200543	100543	Pote	\N	PoteV	Vishnu.Pote@ThyssenKrupp.com	10446760	9363	Estimation(Dept. Code:7620)	Estimation(Dept. Code:7620)	+91 20 66124115	Pune	Maharashtra	411018	IN
1044	1644	3544	200544	100544	Amol	Deshmukh	DeshmukhAS	amol.deshmukh@thyssenkrupp.com	10446791	9369	RESEARCH & DEVELOPMENT (Dept Code: 1100)	RESEARCH & DEVELOPMENT (Dept Code: 1100)	+91 20 6612 4488	Pune	Maharashtra	411018	IN
1045	1645	3545	200545	100545	Deepaklal	Lohar	LoharD	deepaklal.lohar@thyssenkrupp.com	10445560	9630	CEMENT  DESIGN & ENGINEERING (Dept Code: 6005)	Cement Design & Engineering (Dept Code: 6005)	+91 20 6612 4444	Pune	Maharashtra	411018	IN
1046	1646	3546	200546	100546	Yogesh	Skulkarni	KulkarniY	yogesh.skulkarni@thyssenkrupp.com	10447157	90097	BOILER  EXECUTION (Dept Code: 2004)	PM_MHE_9304	+91 20 6612 4675	Pune	Maharashtra	411018	IN
1047	1647	3547	200547	100547	Jalindar	Zinjurke	ZinjurkeJ	jalindar.zinjurke@ThyssenKrupp.com	10403071	9467	Purchsse-Material (Dept. Code:  7712)	Purchsse-Material	+91 20 66124266	Pune	Maharashtra	411018	IN
1048	1648	3548	200548	100548	Yogesh	Kulkarni	KulkarniYD	\N	\N	90589	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	+91 20 6612 4527	Pune	Maharashtra	411018	IN
1049	1649	3549	200549	100549	Rahulraj	Chavan	ChavanR	\N	\N	9778	MHE  SELLING (Dept Code: 3002)	MHE  SELLING (Dept Code: 3002)	+91 20 6612 4563	Pune	Maharashtra	411018	IN
1052	1652	3552	200552	100552	Arjun	Nalawade	NalawadeAR	arjun.nalawade@thyssenkrupp.com	10447261	90365	Services  (Dept. Code7804  )	Services Division	+91 20 66124620	Pune	Maharashtra	411018	IN
1053	1653	3553	200553	100553	Radhakrishna	Gundepally	RadhakrishnaG	Radhakrishna.Gundepally@ThyssenKrupp.com	10383722	5944	CIVIL EXECUTION (Dept Code: 7202)	CIVIL EXECUTION (Dept Code: 7202)	+91 20 66124065	Pune	Maharashtra	411018	IN
1054	1654	3554	200554	100554	Anup	Udagave	UdagaveA	anup.udagave@ThyssenKrupp.com	10446895	9777	Services   (Dept. Code: 7804  )	Services	+91 20 6612 4645	Pune	Maharashtra	411018	IN
1055	1655	3555	200555	100555	Kersy	Chindhy	ChindhyK	Kersy.Chindhy@thyssenkrupp.com	10383692	9477	Purchsse-Material (Dept. Code: 7712 )	Purchase	+91 20 66124285	Pune	Maharashtra	411018	IN
1056	1656	3556	200556	100556	Chandrashekar	Bapat	BapatC	chandrashekar.bapat@thyssenkrupp.com	10383724	9088	WORKSHOP SUPERVISORS (Dept Code: 5061)	WORKSHOP SUPERVISORS (Dept Code: 5061)	+91 20 6612 4427	Pune	Maharashtra	411018	IN
1057	1657	3557	200557	100557	Partha	Biswas	BiswasP	partha.biswas@thyssenkrupp.com	10426435	90458	DESIGN & ENGINEERING  STRUCTURAL (Dept Code: 7305)	DESIGN & ENGINEERING  STRUCTURAL (Dept Code: 7305)	+91 20 6612 4490	Pune	Maharashtra	411018	IN
1058	1658	3558	200558	100558	Shashikant	Shinde	ShindeS	shashikant.shinde@thyssenkrupp.com	10431205	9816	BOILER  EXECUTION (Dept Code: 2004)	PM_B&PP_9204	+91 20 6612 4564	Pune	Maharashtra	411018	IN
1059	1659	3559	200559	100559	Nikhil	Menon	MenonN	\N	\N	90439	MHE  Equipment Cell (Dept. Code: 3007 )	MHE  Equipment Cell (Dept. Code: 3007 )	+91 20 6612 4450	Pune	Maharashtra	411018	IN
1060	1660	3560	200560	100560	Sunil	Haval	HavalS	Sunil.Haval@ThyssenKrupp.com	10403077	9114	SUB CONTRACT (Dept. Code:7742  )	Sub-Contract	+91 20 66124319	Pune	Maharashtra	411018	IN
1061	1661	3561	200561	100561	Vijay	Kakade	KakadeV	Vijay.Kakade@ThyssenKrupp.com	10383756	5936	SUB CONTRACT (Dept. Code:7742  )	Sub-Contract	+91 20 66124312	Pune	Maharashtra	411018	IN
1062	1662	3562	200562	100562	Kiran	Mudbidri	MudbidriK	Kiran.Mudbidri@ThyssenKrupp.com	10242562	5363	Estimation(Dept. Code:7620)	Estimation(Dept. Code:7620)	+91 20 66124124	Pune	Maharashtra	411018	IN
1063	1663	3563	200563	100563	Gaurang	Parmar	ParmarG	Gaurang.Parmar@ThyssenKrupp.com	10383755	5893	MHE  ENGINEERING GR I (Dept Code: 7307)	MHE  ENGINEERING GR I (Dept Code: 7307)	+91 20 6612 4158	Pune	Maharashtra	411018	IN
1064	1664	3564	200564	100564	Milind	Vaidya	VaidyaM	milind.vaidya@thyssenkrupp.com	10237776	15530	CEMENT  SELLING (Dept Code: 6002)	CEMENT  SELLING (Dept Code: 6002)	+91 20 6612 4155	Pune	Maharashtra	411018	IN
1065	1665	3565	200565	100565	Vishwanathan	Balasubramanian	BalasubramanianV	vishwanathan.balasubramanian@thyssenkrupp.com	10380035	90198	CEMENT  EXECUTION (Dept Code: 6004)	Cement Management_6001	+91 20 6612 4175	Pune	Maharashtra	411018	IN
1066	1666	3566	200566	100566	Kaustubh	Nadgonde	NadgondeK	kaustubh.nadgonde@thyssenkrupp.com	10407750	9509	MHE  SELLING (Dept Code: 3002)	MHE  SELLING (Dept Code: 3002)	+91 20 66124043	Pune	Maharashtra	411018	IN
1067	1667	3567	200567	100567	Girish	Ketkar	KetkarG	Girish.Ketkar@ThyssenKrupp.com	10242191	5382	FINANCE  MANAGEMENT (Dept Code: 7601)	FINANCE  MANAGEMENT (Dept Code: 7601)	+91 20 6612 4248	Pune	Maharashtra	411018	IN
1068	1668	3568	200568	100568	Tejomurtula	Prasad	PrasadT	Tejomurtula.Prasad@ThyssenKrupp.com	10383686	9297	BOILER  ENGINEERING (Dept Code: 2003)	BOILER  ENGINEERING (Dept Code: 2003)	+91 20 66124067	Pune	Maharashtra	411018	IN
1069	1669	3569	200569	100569	Vaijanath	Sangekar	SangekarV	vaijanath.sangekar@thyssenkrupp.com	10446896	9804	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	+91 20 6612 4217	Pune	Maharashtra	411018	IN
1070	1670	3570	200570	100570	Balkrishna	Bailkeri	BailkeriB	Balkrishna.Bailkeri@ThyssenKrupp.com	10383758	5985	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	+91 20 6612 4218	Pune	Maharashtra	411018	IN
1071	1671	3571	200571	100571	Rakesh	Mullapully	MullapullyR	\N	\N	90232	Services Dept	Services Dept	+91 20 6612 4394	Pune	Maharashtra	411018	IN
1072	1672	3572	200572	100572	Srinivas	Acharya	AcharyaS	Shrinivas.Acharya@ThyssenKrupp.com	10383780	9399	Sercives  (Dept. Code: 7804 )	Process Engineering Group (Dept Code: 6010)	+91 20 6612 4222	pune	Maharashtra	411018	IN
1073	1673	3573	200573	100573	Rajendra	Dhamal	DhamalR	rajendra.dhamal@thyssenkrupp.com	10431193	9738	BOILER  EXECUTION (Dept Code: 2004)	PM_MHE_9304	+91 20 6612 4056	Pune	maharashtra	411018	IN
1074	1674	3574	200574	100574	Chandrashekhar	Kulkarni	KulkarniC	Chandrashekhar.Kulkarni@thyssenkrupp.com	10447338	60080	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	+ 91 20 6612 4791	Pune	Maharashtra	411018	IN
1075	1675	3575	200575	100575	Sunitha	Jaykumar	JaykumarS	sunitha.jaykumar@thyssenkrupp.com	10445632	97001	Chennai	\N	\N	\N	\N	\N	\N
1076	1676	3576	200576	100576	Fernandes	Terrence	FernandesT	Terrence.Fernandes@ThyssenKrupp.com	10383738	5251	Purchase - Material (Dept. Code: 7712)	Purchase - Material (Dept. Code: 7712)	+91 20 66124277	Pune	Maharashtra	411018	IN
1077	1677	3577	200577	100577	Sanjay	Shelar	shelars	Sanjay.Shelar@ThyssenKrupp.com	10383808	9099	ENGG./EXECUTION INSTRUMENTATION (Dept Code: 7404)	ENGG./EXECUTION INSTRUMENTATION (Dept Code: 7404)	+91 20 6612 4153	\N	\N	\N	\N
1078	1678	3578	200578	100578	Gautam	Singh	SinghG	gautam.singh@thyssenkrupp.com	10442312	90618	BOILER  SELLING (Dept Code: 2002)	BOILER SELLING  (Dept Code: 2004)	+91 20 66124040	Pune	Maharashtra	411018	IN
1079	1679	3579	200579	100579	Bhausaheb	Sangle	SangleB	bhausaheb.sangle@thyssenkrupp.com	10383800	15532	PERSONNEL  ADMINISTRATION (Dept Code: 5202)	PERSONNEL  ADMINISTRATION (Dept Code: 5202)	+91 20 6612 4363	Pune	Maharashtra	411018	IN
1080	1680	3580	200580	100580	Sandeep	Sontakke	SontakkeS	sandeep.sontakke@thyssenkrupp.com	10383789	90190	MHE  EXECUTION (Dept Code: 3004)	PM_MHE_9304	+91 20 6612 4637	Pune	Maharashtra	411018	IN
1081	1681	3581	200581	100581	Madan	Jadhav	JadhavM	madan.jadhav@thyssenkrupp.com	10446798	9474	QUALITY- SUB CONTRACT (Dept Code: 5404)	QUALITY- SUB CONTRACT (Dept Code: 5404)	+91 20 6612 4524	Pune	Maharashtra	411018	\N
1082	1682	3582	200582	100582	Ravindra	Divekar	DivekarR	ravindra.divekar@thyssenkrupp.com	10446775	90621	Purchase	Purchase	+91 20 6612 4251	Pune	Maharashtra	411018	IN
1083	1683	3583	200583	100583	Vikas	Matane	MatneV	vikas.matane@thyssenkrupp.com	10446884	9700	QUALITY-  PRODUCTION (Dept Code: 5403)	QUALITY-  PRODUCTION (Dept Code: 5403)	+91 20 6612 4381	Pune	Maharashtra	411018	\N
1084	1684	3584	200584	100584	Nitin	Chavan	ChavanN	nitin.chavan@thyssenkrupp.com	10403095	9616	PERSONNEL  PRODUCTION (Dept Code: 5201)	PERSONNEL  PRODUCTION (Dept Code: 5201)	+91 20 6612 4336	Pune	Maharashtra	411018	IN
1085	1685	3585	200585	100585	Manoj	Rane	RaneM	Manoj.Rane@ThyssenKrupp.com	10383737	5228	PERSONNEL  ADMINISTRATION (Dept Code: 5202)	PERSONNEL  ADMINISTRATION (Dept Code: 5202)	+91 20 66124354	Pune	Maharashtra	411018	IN
1086	1686	3586	200586	100586	Vinod	Singh	SinghV	Vinodk.Singh@thyssenkrupp.com	10446788	9130	Services  (Dept. Code:7804)	Services  (Dept. Code:7804)	020 6612 4037	pune	Maharashtra	411018	IN
1087	1687	3587	200587	100587	Sadanand	Awale	AwaleS	sadanand.awale@thyssenkrupp.com	10446855	9482	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	+91 20 6612 4041	Pune	Maharashtra	411018	IN
1088	1688	3588	200588	100588	Naved	Akhtar	AkhtarN	naved.akhtar@thyssenkrupp.com	10447176	90202	Polysius Laboratory Automation (Dept Code: 6007)	Polysius Laboratory Automation (Dept Code: 6007)	+91 20 6612 4731	Pune	Maharashtra	411018	IN
1089	1689	3589	200589	100589	Chandrasekar	Ramamoorthy	RamamoorthyC	chandrasekar.ramamoorthy@thyssenkrupp.com	10481190	90626	Services	Services	\N	Pune	Maharashtra	411018	IN
1090	1690	3590	200590	100590	Naresh	Thakur	ThakurN	naresh.thakur@thyssenkrupp.com	10446823	90535	Services  (Dept. Code: 7804)	Services  (Dept. Code: 7804)	\N	Pune	Maharashtra	411018	IN
1091	1691	3591	200591	100591	Ramakrishna	Somalanka	SomalankaR	ramakrishna.somalanka@thyssenkrupp.com	10383859	90128	Services Dept	Services Dept.	\N	Pune	Maharashtra	411 018	IN
1092	1692	3592	200592	100592	Dilip	Patil	PatilDK	dilipk.patil@thyssenkrupp.com	10445557	9439	QUALITY -BOUGHTOUT (Dept Code: 5405)	QUALITY -BOUGHTOUT (Dept Code: 5405)	+91 20 6612 4517	Pune	Maharashtra	\N	IN
1093	1693	3593	200593	100593	Dasharath	Parab	ParabD	dasharath.parab@thyssenkrupp.com	10447329	90629	Estimation	Estimation	+91 20 6612 4624	Pune	Maharashtra	411018	IN
1094	1694	3594	200594	100594	Rajendra	Parasnis	ParasnisR	Rajendra.Parasnis@ThyssenKrupp.com	10383702	5553	SUB CONTRACT (Dept. Code:7741  )	Sub-Contract	+91 20 66124316	Pune	Maharashtra	411018	IN
1095	1695	3595	200595	100595	Ganesh	Doke	DokeG	ganesh.doke@thyssenkrupp.com	10445575	90627	Boiler	Boiler	+91 20 6612 4775	Pune	Maharashtra	411018	IN
1096	1696	3596	200596	100596	Tushar	Bhujbal	BhujbalT	tushar.bhujbal@thyssenkrupp.com	10400550	9599	Boht-Out (Dept. Code:7702  )	Boht -Out	+91 20 6612 4613	Pune	Maharashtra	411018	IN
1097	1697	3597	200597	100597	Rajendra	Katule	KatuleR	Rajendra.Katule@ThyssenKrupp.com	10383766	9201	Boht-Out (Dept. Code:  7702)	Boht-Out - Material	+91 20 66124296	Pune	Maharashtra	411018	IN
1098	1698	3598	200598	100598	Raju	Kaleeswaran	RajuK	Raju.Kaleeswaran@ThyssenKrupp.com	10446762	9461	CEMENT  ENGINEERING (Dept Code: 6003)	Process Engineering Group (Dept Code: 6010)	+91 20 6612 4201	Pune	Maharashtra	411018	IN
1099	1699	3599	200599	100599	Mahimmay	Paul	PaulM	mahimmay.paul@thyssenkrupp.com	10447207	90547	Services Dept	Services Dept.	\N	Pune	Maharashtra	411 018	IN
1100	1700	3600	200600	100600	Swapnil	Saraswat	SaraswatS	Swapnil.Saraswat@thyssenkrupp.com	10447154	90040	Services	PM_Cement_9604_E&C	+91 20 6612  4631	pune	Maharashtra	411018	IN
1101	1701	3601	200601	100601	Rajkumar	Navale	NavaleR	Rajkumar.Navale@ThyssenKrupp.com	10383727	9295	BOILER  ENGINEERING (Dept Code: 2003)	BOILER  ENGINEERING (Dept Code: 2003)	+91 20 6612 4066	\N	\N	\N	\N
1102	1702	3602	200602	100602	Vilas	Mahajan	MahajanV	Vilas.Mahajan@ThyssenKrupp.com	10446749	5635	FINANCE  BILLING (Dept Code: 7603)	FINANCE  BILLING (Dept Code: 7603)	+91 20 66124242	Pune	Maharashtra	411018	IN
1103	1703	3603	200603	100603	Vinod	Kadam	KadamV	Vinod.Kadam.external@thyssenkrupp.com	\N	9387	FINANCE  BILLING (Dept Code: 7603)	FINANCE  BILLING (Dept Code: 7603)	+91 20 6612 4264	Pune	Maharashtra	\N	IN
1104	1704	3604	200604	100604	Kanchisingh	Kajania	KajaniaK	Kanchisingh.Kajania@ThyssenKrupp.com	10403090	9128	ADMINISTRATION  STATIONARY (Dept Code: 7004)	ADMINISTRATION  STATIONARY (Dept Code: 7004)	+91 20 6612 4005	Pune	Maharashtra	411018	IN
1105	1705	3605	200605	100605	Arun	Prasad	PrasadAE	Arun.Prasad@thyssenkrupp.com	10447068	90508	Services Dept	Services Dept.	020 6612 4606	Pune	Maharashtra	411018	IN
1106	1706	3606	200606	100606	Arumugam	Kumar	Kumar_A	Arumugam.Kumar@thyssenkrupp.com	10445738	97003	chennai office	\N	\N	\N	\N	\N	\N
1107	1707	3607	200607	100607	Dilip	Yelpale	YelpaleD	dilip.yelpale@thyssenkrupp.com	10445630	90612	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	+91 20 6612 4596	Pune	Maharashtra	411018	IN
1108	1708	3608	200608	100608	Prashant	Kasar	KasarP	Prashant.Kasar@ThyssenKrupp.com	10400540	9344	Boht-Out (Dept. Code: 7702 )	Boht-Out - Material	+91 20 66124292	\N	\N	\N	\N
1109	1709	3609	200609	100609	postmaster	\N	postmaster	postmaster@ThyssenKrupp.com	\N	System-ID	To auto gererated  postmaster mail from mail server	\N	\N	\N	\N	\N	\N
1110	1710	3610	200610	100610	Dipankar	Saha	SahaD	dipankar.saha@thyssenkrupp.com	10445629	90603	Kolkata Office	Kolkata Office	033 6605 5219	Pune	Maharashtra	411018	IN
1111	1711	3611	200611	100611	Piyush	Ghelani	GhelaniP	piyush.ghelani@thyssenkrupp.com	10426441	90471	Services  (Dept. Code:7804  )	Services	+91 20 6612 4727	Pune	Maharashtra	411018	IN
1112	1712	3612	200612	100612	Shrinivas	Joshi	JoshiSD	Shrinivas.Joshi@ThyssenKrupp.com	10383768	9208	BOILER  EXECUTION (Dept Code: 2004)	PM_B&PP_9204	+91 20 66124282	Pune	Maharashtra	411018	IN
1113	1713	3613	200613	100613	Deepak	Vernekar	VernekarD	deepak.vernekar@thyssenkrupp.com	10383783	9562	Boht-Out (Dept. Code:7702  )	Boht-Out	+91 20 6612 4305	Pune	Maharashtra	411018	IN
1114	1714	3614	200614	100614	Rahul	Niwal	NiwalR	rahul.niwal@thyssenkrupp.com	10422193	9873	MHE  EXECUTION (Dept Code: 3004)	PM_MHE_9304	+91 20 6612 4636	Pune	Maharashtra	411018	IN
1115	1715	3615	200615	100615	Dadasaheb	Sakore	SakoreD	dadasaheb.sakore@thyssenkrupp.com	10445600	9796	CEMENT  DESIGN & ENGINEERING (Dept Code: 6005)	Cement Design & Engineering (Dept Code: 6005)	+91 20 6612 4445	Pune	Maharashtra	411018	IN
1116	1716	3616	200616	100616	Amitabh	Paul	PaulA	amitabh.paul@thyssenkrupp.com	10383734	90331	CEMENT  EXECUTION (Dept Code: 6004)	CEMENT  EXECUTION (Dept Code: 6004)	+91 20 6612 4142	Pune	Maharashtra	411018	IN
1117	1717	3617	200617	100617	Rajesh	Badhe	BadheR	rajesh.badhe@thyssenkrupp.com	10383784	9879	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4469	Pune	Maharashtra	411018	IN
1118	1718	3618	200618	100618	Sridhar	Vaidyanathan	VaidyanathanS	sridhar.vaidyanathan@thyssenkrupp.com	10442305	90632	MHE-Dept.	MHE-Dept.	+91 20  66124199	Pune	Maharashtra	411018	\N
1119	1719	3619	200619	100619	Nilesh	Utpat	UtpatN	nilesh.utpat@thyssenkrupp.com	10442311	90606	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	\N	Pune	\N	411018	IN
1120	1720	3620	200620	100620	Yogesh	Sharma	SharmaY	yogesh.sharma@thyssenkrupp.com	10442308	90599	Services Dept. (Dept. Code: 7802)	Services Dept. (Dept. Code: 7802)	+91 20 6612 4790	Pune	Maharashtra	411018	IN
1121	1721	3621	200621	100621	Adarsh	Sahay	SahayAD	adarsh.sahay@thyssenkrupp.com	10447309	9909	Services	Services	\N	KOCHI Dt. Ernakulam	KERALA	682302	IN
1122	1722	3622	200622	100622	Nayak	Vinayak	NayakV	vinayak.nayak@thyssenkrupp.com	10383802	5956	QUALITY-  PRODUCTION (Dept Code: 5403)	QUALITY-  PRODUCTION (Dept Code: 5403)	+91 20 6612 4411	Pune	Maharashtra	411018	IN
1123	1723	3623	200623	100623	Pravin	Gaidhar	GaidharP	pravin.gaidhar@thyssenkrupp.com	10446857	9491	CEMENT  EXECUTION (Dept Code: 6004)	PM_Cement_9604	+91 20 6612 4688	Pune	Maharashtra	411018	IN
1124	1724	3624	200624	100624	Maneesh	Sabharwal	SabharwalM	maneesh.sabharwal@thyssenkrupp.com	10446777	90635	Boiler	PM_B&PP_9204	+91 20 6612 4785	Pune	Maharashtra	411018	IN
1125	1725	3625	200625	100625	Omkar	Durge 	DurgeO	Omkar.Durge@Tkiidc.com	\N	PFS90	Stores & Despatch	Stores & Despatch	020 6612 4332	Pune	Maharashtra	411018	IN
1126	1726	3626	200626	100626	Anirban	Chakrabarti 	ChakrabartiA	\N	\N	90614	Kolkata Office	Kolkata Office	033 6605 5222	Pune	Maharashtra	411018	IN
1127	1727	3627	200627	100627	Yogesh	Karmalkar	KarmalkarYS	Yogesh.Karmalkar@tkiidc.com	\N	PFS68	Stores  (Dept. Code:7752  )	Stores & Despatch	+91 020 66124341	Pune	Maharashtra	411018	IN
1128	1728	3628	200628	100628	Surya	Bhushan	BhushanS	surya.bhushan@thyssenkrupp.com	10446917	90013	Services	Services	\N	\N	\N	\N	\N
1129	1729	3629	200629	100629	Rajasekhara	Reddy	ReddyR	\N	\N	90602	Services	Services	\N	\N	\N	\N	\N
1130	1730	3630	200630	100630	Chandan	Singha	SinghaC	chandan.singha@thyssenkrupp.com	10445706	90235	Kolkata Office	Kolkata Office	\N	Pune	Maharashtra	411018	IN
1131	1731	3631	200631	100631	Dilip	Das	DasSD	\N	\N	15906	Kolkata Office	\N	033 6605 5219	Pune	Maharashtra	411018	IN
1132	1732	3632	200632	100632	Ritesh	Chakravorty	ChakravortyR	ritesh.chakravorty@thyssenkrupp.com	10383839	90341	BOILER  ENGINEERING (Dept Code: 2003)	BOILER  ENGINEERING (Dept Code: 2003)	+91 20 6612 4721	Pune	Maharashtra	411018	IN
1133	1733	3633	200633	100633	Sunil	Magoo	MagooS	Sunil.Magoo@ThyssenKrupp.com	10400539	9882	Boht-Out (Dept. Code:7702  )	BOHT Dept.	+91 20 6612 4617	Pune	Maharashtra	411018	IN
1134	1734	3634	200634	100634	Nagraj	Rao	RaoN	nagraj.rao@thyssenkrupp.com	10400547	9654	Boht-Out (Dept. Code: 7702 )	Procurement Dept	+91 20 6612 4618	Pune	Maharashtra	411018	IN
1135	1735	3635	200635	100635	Amol	Takalkar	TakalkarA	amol.takalkar@thyssenkrupp.com	10400548	9469	Boht-Out (Dept. Code: 7702 )	BOHT-OUT	+91 20 6612 4307	Pune	Maharashtra	411018	IN
1136	1736	3636	200636	100636	Shivsagar	Patil	PatilSR	shivsagar.patil@thyssenkrupp.com	10400552	9867	Boht-Out (Dept. Code: 7702 )	Boht-out	+91 20 6612 4611	Pune	Maharashtra	\N	IN
1137	1737	3637	200637	100637	Amit	Kuber	KuberA	amit.kuber@thyssenkrupp.com	10400549	9598	Boht-Out (Dept. Code: 7702 )	Boht - Out	+91 20  6612 4289	Pune	Maharashtra	411018	IN
1138	1738	3638	200638	100638	Mandar	Pingale	PingaleM	mandar.pingale@thyssenkrupp.com	10400542	9646	Boht-Out (Dept. Code: 7702 )	Procurement Department	+91 20 6612 4298	\N	\N	\N	\N
1139	1739	3639	200639	100639	Gund	R	GundR	\N	\N	5542	QUALITY- SUB CONTRACT (Dept Code: 5404)	QUALITY- SUB CONTRACT (Dept Code: 5404)	+91 20 6612 4525	Pune	Maharashtra	411018	IN
1140	1740	3640	200640	100640	Prashant	Punde	PundeP	Prashant.Punde@ThyssenKrupp.com	10383816	9278	WORKSHOP SUPERVISORS (Dept Code: 5061)	WORKSHOP SUPERVISORS (Dept Code: 5061)	+91 20 66124425	pune	Maharastra	411018	IN
1141	1741	3641	200641	100641	Dhara	N	DharaN	nabakumar.dhara.external@thyssenkrupp.com	10655102	1876979	QUALITY- SITE (Dept Code: 5406)	QUALITY- SITE (Dept Code: 5406)	+91 20 6612 4834	Pune	Maharashtra	411018	IN
1142	1742	3642	200642	100642	T	Manikanta	ManikantaT	t.manikanta@thyssenkrupp.com	10447189	90312	BOQA Dept	BOQA Dept	+91 20 6612 4286	Pune	Maharashtra	411018	IN
1143	1743	3643	200643	100643	Krishna	Babar	BabarK	krishna.babar@thyssenkrupp.com	10446854	9441	WORKSHOP SUPERVISORS (Dept Code: 5061)	WORKSHOP SUPERVISORS (Dept Code: 5061)	+91 20 6612 4407	Pune	Maharashtra	411018	IN
1144	1744	3644	200644	100644	Deore	Milind	DeoreM	Milind.Deore@ThyssenKrupp.com	10383745	5572	QUALITY- SUB CONTRACT (Dept Code: 5404)	QUALITY- SUB CONTRACT (Dept Code: 5404)	+91 20 66124376	Pune	Maharashtra	411018	IN
1145	1745	3645	200645	100645	Rahul	Lohar	LoharR	\N	\N	9837	WORKSHOP SUPERVISORS (Dept Code: 5061)	WORKSHOP SUPERVISORS (Dept Code: 5061)	\N	Pune	Maharashtra	411018	IN
1146	1746	3646	200646	100646	Khushrov	Bengali	BengaliK	Khushrov.Bengali@ThyssenKrupp.com	10383801	5955	WORKSHOP SUPERVISORS (Dept Code: 5061)	WORKSHOP SUPERVISORS (Dept Code: 5061)	+91 20 6612 4398	Pune	Maharashtra	411018	IN
1147	1747	3647	200647	100647	Nandkumar	Pawar	PawarN	nandkumar.pawar@thyssenkrupp.com	10447206	90542	Mech. Maintenance Dept.	Mech. Maintenance Dept.	\N	Pune	Maharashtra	411018	IN
1148	1748	3648	200648	100648	Sable	R	SableR	rajendra.sable@thyssenkrupp.com	10383807	9059	QUALITY- TESTING & RECEIVING (Dept Code: 5402)	QUALITY- TESTING & RECEIVING (Dept Code: 5402)	+91 20 66124373	Pune	Maharashtra	411018	IN
1149	1749	3649	200649	100649	Sachin	Londhe	LondheS	Sachin.Londhe@thyssenkrupp.com	10447097	9392	FINISHED GOODS DESPATCH (Dept. Code: 7753 )	FINISHED GOODS DESPATCH (Dept. Code: 7753 )	+91 20 6612 4331	Pune	Maharashtra	411018	IN
1150	1750	3650	200650	100650	Nitin	Yadnopavit	YadnopavitN	Nitin.Yadnopavit@ThyssenKrupp.com	10383750	5829	Polysius Laboratory Automation Dept. (Dept. Code: 6007)	Polysius Laboratory Automation Dept. (Dept. Code: 6007)	+91 20 66124405	Pune	Maharashtra	411018	IN
1151	1751	3651	200651	100651	Ajay	Birari	BirariA	\N	\N	5684	CEMENT  ENGINEERING (Dept Code: 6003)	Plant Design (Post Order) Group (Dept Code: 6009)	+91 20 66124148	Pune	Maharashtra	411018	IN
1152	1752	3652	200652	100652	Harihara	Bhogishetty	HariharaB	Harihara.Bhogishetty@ThyssenKrupp.com	10242556	5645	CIVIL ADMINISTRATION (Dept Code: 7201)	CIVIL ADMINISTRATION (Dept Code: 7201)	+91 20 6612 4061	Pune	Maharashtra	411018	IN
1153	1753	3653	200653	100653	Manish	Laddhad	LaddhadM	Manish.Laddhad@ThyssenKrupp.com	10383770	9249	CEMENT  EXECUTION (Dept Code: 6004)	PM_Cement_9604	+91 20 66124281	Pune	Maharashtra	411018	IN
1154	1754	3654	200654	100654	Prem	Nair	NairP	\N	\N	5257	M.D. AND CEO'S  OFFICE ( Dept code 1002)	M.D. AND CEO'S  OFFICE ( Dept code 1002)	+91 20 6612 4131	Pune	Maharashtra	411018	IN
1155	1755	3655	200655	100655	Jitendra	Patil	patilj	Jitendra.Patil@ThyssenKrupp.com	10403089	9391	CEMENT  EXECUTION (Dept Code: 6004)	PM_Management_9101	+91 20 6612 4227	Pune	Maharashtra	411018	IN
1156	1756	3656	200656	100656	Arvind	Dusane	DusaneA	Arvind.Dusane@thyssenkrupp.com	10445546	PFS199	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4481	Pune	Maharashtra	411018	IN
1157	1757	3657	200657	100657	Deshpande	C	DeshpandeC	\N	\N	9164	DESIGN & ENGINEERING  STRUCTURAL (Dept Code: 7305)	DESIGN & ENGINEERING  STRUCTURAL (Dept Code: 7305)	+91 20 6612 4460	Pune	Maharashtra	411018	IN
1190	1790	3690	200690	100690	Amar	Deshpande	Deshpande_A	\N	\N	90500	SUGAR  DIVISION	SUGAR  MANAGEMENT (Dept Code: 4001)	+91 20 6612 4661	Pune	Maharashtra	411018	IN
1158	1758	3658	200658	100658	Deepak	Gokhale	GokhaleD	deepak.gokhale@thyssenkrupp.com	10279919	9518	CEMENT  ENGINEERING (Dept Code: 6003)	Post Order Engineering Group (Dept Code: 6008)	+91 20 6612 4166	Pune	Maharashtra	411018	IN
1159	1759	3659	200659	100659	Sachin	Thite	ThiteS	sachin.thite@thyssenkrupp.com	10446794	9422	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	+91 20 6612 4581	Pune	Maharashtra	411018	IN
1160	1760	3660	200660	100660	Sulekha	Dhamdhere	DhamdhereS	\N	\N	90116	MHE  ENGINEERING GR I (Dept Code: 7307)	MHE  ENGINEERING GR I (Dept Code: 7307)	+ 91 206612 4819	Pune	Maharashtra	411018	IN
1161	1761	3661	200661	100661	Dhanashri	Parekh	ParekhD	dhanashri.parekh@thyssenkrupp.com	10447102	9567	CEMENT  ENGINEERING (Dept Code: 6003)	Plant Design (Post Order) Group (Dept Code: 6009)	+91 20 6612 4898	Pune	Maharashtra	411018	IN
1162	1762	3662	200662	100662	Shashikant	Garad	GaradS	\N	\N	90546	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	+91 20 6612 4200	Pune	Maharashtra	411018	IN
1163	1763	3663	200663	100663	Shriniwas	Hingne	HingneS	Shriniwas.Hingne@ThyssenKrupp.com	10383746	5654	DESIGN & ENGINEERING  SUGAR MILL (Dept Code: 7306)	DESIGN & ENGINEERING  SUGAR MILL (Dept Code: 7306)	+91 20 6612 4448	Pune	Maharashtra	411018	IN
1164	1764	3664	200664	100664	Mukul	Khare	KhareM	Mukul.Khare@ThyssenKrupp.com	10383707	5988	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4081	Pune	Maharashtra	411018	IN
1165	1765	3665	200665	100665	Vaibhav	Mote	MoteV	vaibhav.mote@thyssenkrupp.com	10446877	9655	DESIGN & ENGINEERING  CRUSHER/SCREEN (Dept Code: 7304)	DESIGN & ENGINEERING  CRUSHER/SCREEN (Dept Code: 7304)	+91 20 6612 4493	Pune	Maharashtra	411018	IN
1166	1766	3666	200666	100666	Dibakar	Mitra	MitraD	dibakar.mitra@thyssenkrupp.com	10383823	9484	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4482	Pune	Maharastra	411018	IN
1167	1767	3667	200667	100667	Kirve	Manish	KirveM	Manish.Kirve@ThyssenKrupp.com	10383817	9314	MHE Design Pulleys & Idlers (Dept. 7332)	MHE Design Pulleys & Idlers (Dept. 7332)	+91 20 66124146	\N	\N	\N	\N
1168	1768	3668	200668	100668	Satish	Bhosale	BhosaleS	satish.bhosale@thyssenkrupp.com	10446862	9505	CEMENT  DESIGN & ENGINEERING (Dept Code: 6005)	Cement Design & Engineering (Dept Code: 6005)	+91 20 6612 4555	Pune	maharashtra	411018	IN
1169	1769	3669	200669	100669	Anupkumar	Das	DasA	Anupkumar.Das@ThyssenKrupp.com	10383820	9394	CEMENT  ENGINEERING (Dept Code: 6003)	Process Engineering Group (Dept Code: 6010)	+91 20 66124141	Pune	Maharashtra	411018	IN
1170	1770	3670	200670	100670	Anirudha	Panchwagh	PanchwaghA	anirudha.panchwagh@thyssenkrupp.com	10446752	9143	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4455	Pune	Maharashtra	411018	IN
1171	1771	3671	200671	100671	Mallesh	Mashale	MashaleM	mallesh.mashale@thyssenkrupp.com	10446885	9701	CEMENT  DESIGN & ENGINEERING (Dept Code: 6005)	Cement Design & Engineering (Dept Code: 6005)	+91 20 6612 4737	Pune	Maharashtra	411018	IN
1172	1772	3672	200672	100672	Vishal	Durge	DurgeV	vishal.durge@thyssenkrupp.com	10447104	9577	ENGG./EXECUTION INSTRUMENTATION (Dept Code: 7404)	ENGG./EXECUTION INSTRUMENTATION (Dept Code: 7404)	+91 20 6612 4219	Pune	Maharashtra	411018	IN
1173	1773	3673	200673	100673	Shavanna	Salgond	SalgondS	shavanna.salgond@thyssenkrupp.com	10383703	PFS274	CEMENT  DESIGN & ENGINEERING (Dept Code: 6005)	Cement Design & Engineering (Dept Code: 6005)	+91 20 6612 4454	Pune	Maharashtra	411018	IN
1174	1774	3674	200674	100674	Pranab	Chakraborty	ChakrabortyP	Pranab.Chakraborty@thyssenkrupp.com	10383709	9138	CEMENT  EXECUTION (Dept Code: 6004)	PM_MHE_9304	+91 20 66124156	Pune	Maharashtra	411018	IN
1175	1775	3675	200675	100675	Rajput	Bhupendra	RajputB	bhupendra.rajput@thyssenkrupp.com	10446783	5321	CEMENT  DESIGN & ENGINEERING (Dept Code: 6005)	Cement Design & Engineering (Dept Code: 6005)	+91 20 66124466	Pune	Maharashtra	411018	IN
1176	1776	3676	200676	100676	Sandeep	Thite	ThiteSN	sandeep.thite@thyssenkrupp.com	10447100	9510	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	+91 20 6612 4446	Pune	Maharastra	411018	IN
1177	1777	3677	200677	100677	Deoskar	A	DeoskarA	anil.deoskar@thyssenkrupp.com	10383726	9241	RESEARCH & DEVELOPMENT (Dept Code: 1100)	RESEARCH & DEVELOPMENT (Dept Code: 1100)	+91 20 6612 4449	Pune	Maharashtra	411018	IN
1178	1778	3678	200678	100678	Jayprakash	Patil	PatilJS	jayprakash.patil@thyssenkrupp.com	10383835	90090	SUGAR  EXECUTION (Dept Code: 4004)	PM_Sugar_9404	+91 20 6612 4657	Pune	Maharashtra	411018	IN
1179	1779	3679	200679	100679	Pathan	Rajekhan	PathanR	Rajekhan.Pathan@thyssenkrupp.com	10383857	9132	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	+91 20 66124595	Pune	Maharashtra	411018	IN
1180	1780	3680	200680	100680	Rajesh	Mane	ManeR	rajesh.mane@thyssenkrupp.com	10446796	9470	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4127	Pune	Maharashtra	411018	IN
1181	1781	3681	200681	100681	Shakeel	Ahmad	AhmadS	Shakeel.Ahmad@ThyssenKrupp.com	10383776	9327	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4464	Pune	Maharashtra	411018	IN
1182	1782	3682	200682	100682	Atul	Patil	PatilaP	atul.patil@thyssenkrupp.com	10446876	9621	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4770	Pune	Maharashtra	411018	IN
1183	1783	3683	200683	100683	Sandeep	Doshi	DoshiS	sandeep.doshi@thyssenkrupp.com	10446761	9380	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 66124128	\N	\N	\N	\N
1184	1784	3684	200684	100684	Kedar	Agnihotri	AgnihotriK	Kedar.Agnihotri@thyssenkrupp.com	\N	90442	kedar.agnihotri@thyssenkrupp.com tranffered to tkscDESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4491	Pune	Maharashtra	411018	IN
1185	1785	3685	200685	100685	Methel	Devadasan	DevadasanM	\N	\N	90544	Services Dept.	Services Dept.	\N	Pune	Maharashtra	411018	IN
1186	1786	3686	200686	100686	Digvijay	Jachak	JachakD	\N	\N	90138	Boht-Out (Dept. Code: 7702 )	BOHT	+91 20 6612 4017	Pune	Maharashtra	411018	IN
1187	1787	3687	200687	100687	Aniket	Anaokar	AnaokarA	\N	\N	90334	CEMENT  ENGINEERING (Dept Code: 6003)	Post Order Engineering Group (Dept Code: 6008)	+91 20 6612 4898	Pune	Maharashtra	411018	IN
1188	1788	3688	200688	100688	Balamurugan	A	BalamuruganA	\N	\N	90637	Services	Services	\N	Pune	Maharashtra	411018	IN
1189	1789	3689	200689	100689	Pawan	Goswami	GoswamiP	\N	\N	90427	Services  (Dept. Code:7804)	Services  (Dept. Code:7804)	+91 20 66124599	Pune	Maharashtra	411018	IN
1192	1792	3692	200692	100692	Vinay	Jadhav	JadhavV	\N	\N	90620	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	+91 20 6612 4216	Pune	Maharashtra	411018	IN
1193	1793	3693	200693	100693	Pratap	Chilhal	ChilhalP	Pratap.Chilhal@thyssenkrupp.com	\N	PFS-211	WORKSHOP SUPERVISORS (Dept Code: 5061)	WORKSHOP SUPERVISORS (Dept Code: 5061)	+91 20 6612 4401	\N	\N	\N	\N
1194	1794	3694	200694	100694	Dileep	Singh	SinghD	dileep.singh@thyssenkrupp.com	10446933	90384	CIVIL EXECUTION (Dept Code: 7202)	\N	\N	\N	\N	\N	\N
1195	1795	3695	200695	100695	Tarunkumar	Das	DasT	tarunkumar.das@thyssenkrupp.com	10383837	90220	MHE  EXECUTION (Dept Code: 3004)	PM_MHE_9304	+91 20 6612 4633	Pune	Maharashtra	411018	IN
1196	1796	3696	200696	100696	Ravindra	Kaldate	KaldateR	Ravindra.Kaldate@ThyssenKrupp.com	10403078	9358	SUB CONTRACT (Dept. Code: 7742 )	Sub Contract	+91 20 6612 4317	Pune	Maharashtra	411018	IN
1197	1797	3697	200697	100697	Shesdev	Sahu	SahuS	shesdev.sahu@thyssenkrupp.com	10481191	90566	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	+91 20 6612 4467	Pune	Maharashtra	411018	IN
1198	1798	3698	200698	100698	Viknesh	Rajendran	RajendranV	Viknesh.Rajendran@thyssenkrupp.com	10403081	9690	SUB CONTRACT (Dept. Code:7742  )	Sub-Contract	+91 20 6612 4663	Pune	Maharashtra	411018	IN
1199	1799	3699	200699	100699	Charuta	Mulay	MulayC	\N	\N	9939	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	+91 20 6612 4212	Pune	Maharashtra	411018	IN
1200	1800	3700	200700	100700	Kishor	Pathak	PathakK	kishor.pathak@thyssenkrupp.com	10446802	9548	CEMENT  DESIGN & ENGINEERING (Dept Code: 6005)	Cement Design & Engineering (Dept Code: 6005)	+91 20 6612 4558	Pune	Maharashtra	411018	IN
1201	1801	3701	200701	100701	Galagali	Vaman	GalagaliV	Vaman.Galagali@ThyssenKrupp.com	10431196	9360	MHE  EXECUTION (Dept Code: 3004)	MHE  EXECUTION (Dept Code: 3004)	+91 20 6612 4632	Pune	Maharashtra	4110118	IN
1202	1802	3702	200702	100702	Upendra	U	DeoU	Upendra.Deo@thyssenkrupp.com	10383814	9218	Estimation(Dept. Code:7620)	Estimation(Dept. Code:7620)	+91 20 66124126	Pune	Maharashtra	411018	IN
1203	1803	3703	200703	100703	Sunilkumar	Awasthi	AwasthiS	\N	\N	90457	Services  (Dept. Code:7804  )	DGM Services dept	\N	Pune	Maharashtra	411018	IN
1204	1804	3704	200704	100704	Vishal	Walunj	WalunjV	vishal.walunj@thyssenkrupp.com	10431227	90194	MHE  EXECUTION (Dept Code: 3004)	PM_MHE_9304	+91 20 6612 4708	Pune	Maharashtra	411018	IN
1205	1805	3705	200705	100705	Adil	Masalawala	MasalawalaA	Adil.Masalawala@ThyssenKrupp.com	10403059	5360	Purchsse-Administration (Dept. Code:  7711)	Purchase - Administration	+91 20 66124273	Pune	Maharashtra	411018	IN
1206	1806	3706	200706	100706	Rajesh	Bhat	BhatR	rajesh.bhat@thyssenkrupp.com	10383832	9944	Sub-Contract (Dept. Code: 7741 )	Sub-Contract	+91 20 6612 4204	Pune	Maharashtra	411018	IN
1207	1807	3707	200707	100707	Amit	Sahay	SahayA	\N	\N	90160	Boht-Out (Dept. Code:7702  )	BOHT	+91 20 6612 4612	Pune	Maharashtra	411018	IN
1208	1808	3708	200708	100708	Srinivas	Udapikar	UdapikarS	Srinivas.Udapikar@thyssenKrupp.com	10446797	9473	Purchsse-Material (Dept. Code: 7712 )	Purchase Dept.	+91 20 6612 4303	Pune	Maharashtra	411018	IN
1209	1809	3709	200709	100709	Prabhu	Hiremath	HiremathP	\N	\N	9089	Services Dept.	Services Dept.	\N	Pune	Maharashtra	411 018	IN
1210	1810	3710	200710	100710	Omkar	Kanade	KanadeO	omkar.kanade@thyssenkrupp.com	10447156	90056	MHE  SELLING (Dept Code: 3002)	MHE  SELLING (Dept Code: 3002)	+91 20 6612 4474	Pune	Maharashtra	411018	IN
1211	1811	3711	200711	100711	Polindia	Infoweb	Polindia-infoweb	\N	\N	System-ID	Polycius Cement for login Polycius data server	Polysius India	\N	Pune	Maharashtra	411018	IN
1212	1812	3712	200712	100712	Prasad	Menon	MenonP	Prasad.Menon@thyssenkrupp.com	10383843	15528	Services Dept.	Services Dept.	\N	Pune	Maharashtra	411 018	IN
1213	1813	3713	200713	100713	Dilip	Sangle	SangaleD	dilip.sangale@thyssenkrupp.com	10403079	9626	SUB CONTRACT (Dept. Code:7742  )	Sub-Contract	+91 20  6612 4665	Pune	Maharashtra	411018	IN
1214	1814	3714	200714	100714	Manish	Gawade	GawadeM	manish.gawade@thyssenkrupp.com	10446894	9768	PERSONNEL  PRODUCTION (Dept Code: 5201)	PERSONNEL  PRODUCTION (Dept Code: 5201)	+91 20 6612 4389	Pune	Maharashtra	411018	IN
1215	1815	3715	200715	100715	Venkatesh	Hadapad	VenkateshHG	venkatesh.hadapad@thyssenkrupp.com	10442306	90577	Services Dept.	Services Dept.	\N	Pune	Maharashtra	411 018	IN
1216	1816	3716	200716	100716	Ramkrishna	Yerla	YerlaR	ramkrishna.yerla@thyssenkrupp.com	10431194	9861	MHE  EXECUTION (Dept Code: 3004)	PM_MHE_9304	+91 20 6612 4084	Pune	Maharashtra	\N	IN
1217	1817	3717	200717	100717	Surajit	Dasgupta	DasguptaS	surajit.dasgupta@thyssenkrupp.com	10383712	9776	MHE  EXECUTION (Dept Code: 3004)	PM_MHE_9304	+91 20 6612 4477	Pune	Maharashtra	411018	IN
1218	1818	3718	200718	100718	Subodh	Aranke	ArankeS	Subodh.Aranke@thyssenkrupp.com	10447200	90514	Services  (Dept. Code:  7807)	Services  (Dept. Code:  7804)	+91 20 6612 4207	Pune	Maharashtra	411018	IN
1219	1819	3719	200719	100719	Dhanaji	Pendavale	PendavaleD	dhanaji.pendavale@thyssenkrupp.com	10445731	90545	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	+91 20 6612 4463	Pune	Maharashtra	411018	IN
1220	1820	3720	200720	100720	Eustace	Vimal	VimalE	eustace.vimal@thyssenkrupp.com	10442322	90605	Services	Services	7887867562	Pune	Maharashtra	411018	IN
1221	1821	3721	200721	100721	Mandar	Kulkarni	KulkarniMP	mandarp.kulkarni@thyssenkrupp.com	10446826	90549	Services	Services Dept.	+91 20 6612 4609	Pune	Maharashtra	411 018	IN
1222	1822	3722	200722	100722	Raghav	Ramachandran	RaghavR	raghav.ramachandran@thyssenkrupp.com	10442303	90564	Services	Process Engineering Group (Dept Code: 6010)	+91 20 6612 4760	Pune	Maharashtra	411 018	IN
1223	1823	3723	200723	100723	Shrirang	Gorhe	GorheS	Shrirang.Gorhe@ThyssenKrupp.com	10403063	9338	COMMERCIAL & SECRETARIAL  (7630)	COMMERCIAL & SECRETARIAL  (7630)	+91 20 66124288	\N	\N	\N	\N
1224	1824	3724	200724	100724	Sreenath	Hegga	HeggaS	Sreenath.Hegga@thyssenkrupp.com	10446765	9607	CEMENT  EXECUTION (Dept Code: 6004)	PM_Cement_9604	+91 20 6612 4184	Pune	Maharashtra	411018	IN
1225	1825	3725	200725	100725	Sagar	Kalyani	KalyaniS	sagar.kalyani@thyssenkrupp.com	10431197	9838	MHE  EXECUTION (Dept Code: 3004)	PM_MHE_9304	+91 20 6612 4031	Pune	Maharashtra	411018	IN
1226	1826	3726	200726	100726	Ravishankar	Kaza	KazaR	Ravishankar.Kaza@ThyssenKrupp.com	10383762	9032	MHE  EXECUTION (Dept Code: 3004)	PM_MHE_9304	+91 20 6612 4521	Pune	Maharashtra	411018	IN
1227	1827	3727	200727	100727	Sanjay	Panse	PanseS	sanjay.panse@thyssenkrupp.com	10446813	90230	CEMENT ENGINEERING (Dept Code: 6003)	Process Engineering Group (Dept Code: 6010)	+91 20 6612 4729	Pune	Maharashtra	411018	IN
1952	2552	4452	201452	101452	Services	VLJ  Store	VLJ_Store	servicesvlj.store@thyssenkrupp.com	\N	\N	\N	O&M of Pet Coke Handling System.	\N	\N	\N	\N	\N
1228	1828	3728	200728	100728	Shentu	Chacko	ChackoS	\N	\N	90554	Services  (Dept. Code: 7804)	Services  (Dept. Code: 7804)	\N	Pune	Maharashtra	411018	IN
1229	1829	3729	200729	100729	Sanjoy	Dey	DeyS	sanjoy.dey@thyssenkrupp.com	10442317	90593	MHE  EXECUTION (Dept Code: 3004)	MHE  EXECUTION (Dept Code: 3004)	+91 20 6612 4684	Pune	Maharashtra	411018	IN
1230	1830	3730	200730	100730	Girish	Kulkarni	KulkarniGirish	girishp.kulkarni@thyssenkrupp.com	10383725	9215	SUGAR  SELLING (Dept Code: 4002)	SUGAR  SELLING (Dept Code: 4002)	+91 20 6612 4188	Pune	Maharashtra	411018	IN
1231	1831	3731	200731	100731	Nitin	Titar	TitarN	nitin.titar@thyssenkrupp.com	10403070	9463	Purchsse-Material (Dept. Code: 7712 )	Purchase	+91 20 6612 4566	Pune	Maharashtra	411018	IN
1232	1832	3732	200732	100732	Sajith	Das	DasS	sajith.das@thyssenkrupp.com	10403083	9872	SUB CONTRACT (Dept. Code:  7742)	Sub Contract	+91 20 6612 4008	Pune	Maharashtra	411018	IN
1233	1833	3733	200733	100733	Jayant	Deshpande	DeshpandeJ	\N	\N	5740	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	+91 20 6612 4451	Pune	Maharashtra	411018	IN
1234	1834	3734	200734	100734	Shreyas	Nair	NairSR	Shreyas.Nair@thyssenkrupp.com	10447069	90512	MHE Selling (Dept. Code 3002)	MHE Selling (Dept. Code 3002)	+91 20 6612 4818	Pune	Maharashtra	411018	IN
1235	1835	3735	200735	100735	Abhijit	Thorat	ThoratA	abhijit.thorat@thyssenkrupp.com	10403073	9851	Purchsse-Material (Dept. Code: 7712 )	Purchsse-Material	+91 20 6612 4279	Pune	Maharashtra	411018	IN
1236	1836	3736	200736	100736	Mukund	Tonape	TonapeM	mukund.tonape@thyssenkrupp.com	10447292	90616	E&I (7404)	E&I (7402)	+91 20 6612 4813	Pune	Maharashtra	411018	IN
1237	1837	3737	200737	100737	Biju	Kumar	KumarB	Biju.Kumar@ThyssenKrupp.com	10383761	9023	Services  (Dept. Code:  7804)	Services - MHE Division	+91 20 6612 4091	Pune	Maharashtra	411 018	IN
1238	1838	3738	200738	100738	Anand	Malkunje	MalkunjeA	anand.malkunje@thyssenkrupp.com	10442318	90572	CEMENT  EXECUTION (Dept Code: 6004)	PM_Cement_9604	+91 20 6612 4169	Pune	Maharashtra	411018	IN
1239	1839	3739	200739	100739	Shrijay	Tawade	TawadeS	shrijay.tawade@thyssenkrupp.com	10482343	90761	Services	Services Division	+91 20 66124395	Pune	Maharashtra	411018	IN
1240	1840	3740	200740	100740	Pankaj	Zambare	ZambareP	pankaj.zambare@thyssenkrupp.com	10403088	9650	CIVIL EXECUTION (Dept Code: 7202)	CIVIL EXECUTION (Dept Code: 7202)	+91 20 6612 4069	Pune	Maharashtra	411018	IN
1241	1841	3741	200741	100741	Umesh	Lele	LeleU	Umesh.Lele@ThyssenKrupp.com	10383739	5378	SUB CONTRACT  (Dept. Code: 7742 )	Sub-Contract	+91 20 66124315	Pune	Maharashtra	411018	IN
1242	1842	3742	200742	100742	Giridhar	Marella	MarellaG	giridhar.marella@thyssenkrupp.com	10383730	9916	CEMENT  ENGINEERING (Dept Code: 6003)	Post Order Engineering Group (Dept Code: 6008)	+91 20 6612 4157	Pune	Maharashtra	411018	IN
1243	1843	3743	200743	100743	Vijai	Joseph	JosephV	\N	\N	90131	MHE  Equipment Cell (Dept. Code: 3007 )	MHE  Equipment Cell (Dept. Code: 3007 )	+91 20 6612 4684	Pune	Maharashtra	411018	IN
1244	1844	3744	200744	100744	Jayashri	Chaudhari	ChaudhariJ	\N	\N	90610	E&I (dept code7404)	E&I (dept code7404)	+91 206612 4129	\N	\N	\N	\N
1245	1845	3745	200745	100745	Soumyajit	Nandi	NandiS	soumyajit.nandi@thyssenkrupp.com	10446931	90270	BOILER  ENGINEERING (Dept Code: 2003)	BOILER  ENGINEERING (Dept Code: 2003)	+91 20 6612 4860	Pune	\N	411018	IN
1246	1846	3746	200746	100746	Rama	Nair	NairR	\N	\N	90651	MD and CEO Office	MD and CEO Office	+ 91 20 6612 4071	Pune	Maharashtra	411018	IN
1247	1847	3747	200747	100747	Aslam	Sayyed	SayyedA	aslam.sayyed@thyssenkrupp.com	10442314	90578	Services	Services Division	+91 20 66124652	Pune	Maharashtra	411018	IN
1248	1848	3748	200748	100748	Vivek	Kamat	KamatV	vivek.kamat@thyssenkrupp.com	10446757	9273	SERVICES DIVISION ? SPARE PARTS BUSINESS (Dept code. 7807)	SERVICES DIVISION ? SPARE PARTS BUSINESS (Dept code. 7807)	+91 20 6612 4209	Pune	Maharashtra	411018	IN
1249	1849	3749	200749	100749	Lalit	Surajiwale	SurajiwaleL	lalit.surajiwale@thyssenkrupp.com	10422195	90305	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4769	Pune	Maharashtra	411018	IN
1250	1850	3750	200750	100750	Chinmay	Pandit	PanditC	chinmay.pandit@thyssenkrupp.com	10446883	9697	CEMENT  EXECUTION (Dept Code: 6004)	PM_Cement_9604	+91 20 6612 4586	Pune	Maharashtra	411018	IN
1251	1851	3751	200751	100751	Sridhar	Ramalingam	RamalingamS	Sridhar.Ramalingam@thyssenkrupp.com	10446825	90548	Services Dept	Services Dept.	\N	Pune	Maharashtra	411018	IN
1252	1852	3752	200752	100752	Sudhir	Kulkarni	KulkarniSD	Sudhir.Kulkarni@thyssenkrupp.com	10383855	9042	Services Dept.	Services Dept.	91 20 6612 4650	Pune	Maharashtra	411 018	IN
1253	1853	3753	200753	100753	Sona	Biswas	BiswasS	Sona.Biswas@thyssenkrupp.com	10446742	90444	CEMENT  EXECUTION (Dept Code: 6004)	CEMENT  EXECUTION (Dept Code: 6004)	+91 20 6612 4142	Pune	Maharashtra	411018	IN
1254	1854	3754	200754	100754	Dadasaheb	Kanherkar	KanherkarD	dadasaheb.kanherkar@thyssenkrupp.com	10403099	90080	Subcontract  (Dept. Code:  7742)	Subcontract Department	+91 20 6612 4664	Pune	Maharashtra	411018	IN
1255	1855	3755	200755	100755	Kumar	MA	KumarMA	Kumar.MA@ThyssenKrupp.com	10383753	5873	MHE  EXECUTION (Dept Code: 3004)	PM_MHE_9304	+91 20 66124078	Pune	Maharashtra	411018	IN
1256	1856	3756	200756	100756	Ashish	Uravane	UravaneA	ashish.uravane@thyssenkrupp.com	10446774	90587	DESIGN & ENGINEERING  STRUCTURAL (Dept Code: 7305)	DESIGN & ENGINEERING  STRUCTURAL (Dept Code: 7305)	+91 20 6612 4680	Pune	Maharashtra	411 018	IN
1257	1857	3757	200757	100757	Nilesh	Mehta	MehtaNI	Nilesh.Mehta@ThyssenKrupp.com	10383759	9014	BOILER  EXECUTION (Dept Code: 2004)	PM_B&PP_9204	+91 20 66124149	Pune	Maharashtra	411018	IN
1258	1858	3758	200758	100758	Rajnish	Sinha	SinhaR	rajnish.sinha@thyssenkrupp.com	10442321	90628	MHE Marketing	MHE Marketing	\N	Pune	Maharashtra	411018	IN
1259	1859	3759	200759	100759	Rajeev	Handa	HandaR	rajeev.handa@thyssenkrupp.com	10431195	90451	Services  (Dept. Code:7804)	Services  (Dept. Code:7804)	+91 20 6612 4206	Pune	Maharashtra	411018	IN
1260	1860	3760	200760	100760	Vrushali	Sangaonkar	SangaonkarV	vrushali.sangaonkar@thyssenkrupp.com	10417936	9684	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	+91 20 6612 4221	\N	\N	\N	\N
1261	1861	3761	200761	100761	Raju	Bellary	BellaryR	Raju.Bellary@thyssenkrupp.com	10446772	90495	Services  (Dept. Code: 7803 )	Services Dept.	\N	Pune	Maharashtra	411018	IN
1262	1862	3762	200762	100762	Dayanand	Kulkarni	KulkarniD	Dayanand.Kulkarni@thyssenkrupp.com	10446793	9404	BOILER  EXECUTION (Dept Code: 2004)	BOILER  EXECUTION (Dept Code: 2004)	+91 20 66124044	Pune	Maharashtra	411018	IN
1263	1863	3763	200763	100763	Kiran	Suroshi	SuroshiK	kiran.suroshi@thyssenkrupp.com	10403066	9575	Purchsse-Material (Dept. Code: 7712 )	Purchase - Material	+91 20 66124274	Pune	Maharashtra	411018	IN
1264	1864	3764	200764	100764	Amit	Savekar	SavekarA	amit.savekar@thyssenkrupp.com	10446790	9309	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4485	Pune	Maharashtra	411018	IN
1265	1865	3765	200765	100765	Onkar	Sakatkar	SakatkarO	Onkar.Sakatkar@thyssenkrupp.com	10447072	90553	MHE  EXECUTION	PM_MHE_9304	+91 20 6612 4640	Pune	Maharashtra	411018	IN
1266	1866	3766	200766	100766	Hemanth	Dodda	DoddaH	hemanth.dodda@thyssenkrupp.com	10447268	90390	Services Dept.	Services Dept.	\N	Pune	Maharashtra	411018	IN
1267	1867	3767	200767	100767	Santosh	Shirolikar	ShirolikarS	santosh.shirolikar@thyssenkrupp.com	10431192	90145	MHE  EXECUTION (Dept Code: 3004)	PM_MHE_9304	+ 91 20 6612 4641	Pune	\N	411018	IN
1268	1868	3768	200768	100768	PMS	System	pmssystem	pms.system@thyssenkrupp.com	\N	System-ID	This ID is only for Performance Management System	\N	\N	Pune	Maharashtra	411018	IN
1269	1869	3769	200769	100769	Vineet	Limaye	LimayeV	vineet.limaye@thyssenkrupp.com	10488453	90782	SMB - Sales & Marketing department (5702)	SMB - Sales & Marketing department (5702)	+91 20 6612 4314	Pune	Maharashtra	411018	IN
1270	1870	3770	200770	100770	Vikas	Gund	GundV	vikas.gund@thyssenkrupp.com	10445693	90588	QUALITY-  PRODUCTION (Dept Code: 5403)	\N	+91 20 6612 4519	Pune	Maharashtra	411018	IN
1271	1871	3771	200771	100771	Sujit	Hande	HandeS	sujit.hande@thyssenkrupp.com	10445572	90582	PPC Dept	PPC Dept	+91 20 6612 4495	Pune	Maharashtra	411018	IN
1272	1872	3772	200772	100772	Anilkumar	P	AnilkumarP	anilkumar.poovath@thyssenkrupp.com	10446841	5752	FINANCE  BILL PASSING (Dept Code: 7604)	FINANCE  BILL PASSING (Dept Code: 7604)	+91 20 6612 4626	Pune	Maharashtra	411018	IN
1273	1873	3773	200773	100773	Rajesh	Musalunkar	MusalunkarR	Rajesh.Musalunkar@thyssenkrupp.com	10446847	9400	FINANCE  BILLING (Dept Code: 7603)	FINANCE  BILLING (Dept Code: 7603)	+91 20 66124241	\N	\N	\N	\N
1274	1874	3774	200774	100774	Yogiraj	Panse	PanseY	yogiraj.panse@thyssenkrupp.com	10447175	90184	CEMENT  ENGINEERING (Dept Code: 6003)	Plant Design (Post Order) Group (Dept Code: 6009)	+91 20 6612 4132	Pune	Maharashtra	411018	IN
1275	1875	3775	200775	100775	Govind	Soni	SoniG	Govind.Soni@ThyssenKrupp.com	10446799	9493	Import Export (Dept. Code: 7652 )	Import Exports	+91 20  6612 4114	\N	\N	\N	\N
1276	1876	3776	200776	100776	Sadanand	Rote	RoteS	sadanand.rote@thyssenkrupp.com	10445636	9863	CEMENT  ENGINEERING (Dept Code: 6003)	Plant Design (Post Order) Group (Dept Code: 6009)	+91 20 6612 4888	Pune	Maharashtra	411018	IN
1277	1877	3777	200777	100777	Manoj	Sharma	SharmaM	manojm.sharma@thyssenkrupp.com	10435456	90561	Internal Audit (Dept. Code:7610)	Internal Audit (Dept. Code:7610)	+91 20  66124235	Pune	Maharashtra	411018	IN
1278	1878	3778	200778	100778	Sampada	Godse	GodseS	Sampada.Godse@thyssenkrupp.com	10447095	9184	FINANCE  BILL PASSING (Dept Code: 7604)	FINANCE  BILL PASSING (Dept Code: 7604)	+91 20 66124258	Pune	Maharashtra	411018	IN
1279	1879	3779	200779	100779	Deepak	Padalkar	PadalkarD	deepak.padalkar@thyssenkrupp.com	10403091	90087	PERSONNEL  ADMINISTRATION (Dept Code: 5202)	PERSONNEL  ADMINISTRATION (Dept Code: 5202)	+91 20 6612 4364	Pune	Maharashtra	411018	IN
1280	1880	3780	200780	100780	Vinod	Varma	VarmaV	vinod.varma@thyssenkrupp.com	10446900	9843	BOILER  EXECUTION (Dept Code: 2004)	PM_MHE_9304	+91 20 6612 4503	Pune	Maharashtra	411018	IN
1281	1881	3781	200781	100781	Nitin	Gawhane	GawhaneN	nitin.gawhane@thyssenkrupp.com	10363512	90071	Personnel & HRD Department	Personnel & HRD Department	+91 20 6612 4014	Pune	Maharashtra	411018	IN
1282	1882	3782	200782	100782	Satish	Kadam	KadamSV	satish.kadam@thyssenkrupp.com	10447073	90559	Services Dept	Services Dept	+91 20 6612 4207	Pune	Maharashtra	411018	IN
1283	1883	3783	200783	100783	Sandeep	Thite	ThiteSB	sandeepb.thite@thyssenkrupp.com	10442315	90611	MHE ? Project Execution	PM_Planning_9704	+91 20 6612 4570	Pune	Maharashtra	411018	\N
1284	1884	3784	200784	100784	Anand	Vedpathak	VedpathakA	anand.vedpathak@tkiidc.com	\N	BSA70005 10645088	RESEARCH & DEVELOPMENT (Dept Code: 1100)	DESIGN & ENGINEERING  MANAGEMENT (Dept Code: 7301)	+91 20 6612 4431	Pune	Maharashtra	411018	IN
1285	1885	3785	200785	100785	Saurabh	Rane	RaneS	Saurabh.Rane@thyssenkrupp.com	10488582	90770	Services  (Dept. Code:7804)	Services  (Dept. Code:7804)	+91 20 6612 4774	Pune	Maharashtra	411018	IN
1286	1886	3786	200786	100786	Vishal	Pawar	PawarV	vishal.pawar@thyssenkrupp.com	10445604	9924	Commercial (Dept. Code:7630)	Commercial (Dept. Code:7630)	+91 2066124025	Pune	Maharashtra	411018	IN
1287	1887	3787	200787	100787	Ramasamy	Kannan	KannanR	ramasamy.kannan@thyssenkrupp.com	10446822	90528	Services Dept.	Services Dept.	\N	Pune	Maharashtra	411 018	IN
1288	1888	3788	200788	100788	Swapnil	Risbud	RisbudS	swapnil.risbud@thyssenkrupp.com	10447318	90369	Estimation (Dept. Code:7620)	Estimation(Dept. Code:7620)	+91 20 6612 4118	Pune	Maharashtra	411018	IN
1289	1889	3789	200789	100789	Somasundaram	Natarajan	SundarN	somasundaram.natarajan@thyssenkrupp.com	10447231	90214	BOILER  EXECUTION (Dept Code: 2004)	PM_B&PP_9204	+91 20 6612 4197	Pune	Maharashtra	411018	IN
1290	1890	3790	200790	100790	Suresh	Ramasamy	RamasamyS	suresh.ramasamy@thyssenkrupp.com	10446356	9734	Services	Services	\N	Pune	Maharashtra	411 018	IN
1291	1891	3791	200791	100791	Nilesh	Nandurkar	NandurkarN	nilesh.nandurkar@thyssenkrupp.com	10445654	90197	DESIGN & ENGINEERING  SUGAR MILL (Dept Code: 7306)	DESIGN & ENGINEERING  SUGAR MILL (Dept Code: 7306)	+91 20 6612 4462	Pune	Maharashtra	411018	IN
1292	1892	3792	200792	100792	Dinesh	Sakhare	SakhareD	dinesh.sakhare@thyssenkrupp.com	10417937	9725	ENGG./EXECUTION INSTRUMENTATION (Dept Code: 7404)	ENGG./EXECUTION INSTRUMENTATION (Dept Code: 7404)	+91 20 6612 4015	Pune	Maharashtra	411018	IN
1293	1893	3793	200793	100793	Amol	Phalke	PhalkeA	amol.phalke@thyssenkrupp.com	10431220	90052	SUGAR  EXECUTION (Dept Code: 4004)	PM_Sugar_9404	+91 20 6612 4646	Pune	Maharashtra	411018	IN
1294	1894	3794	200794	100794	Veekkas	Sondckar	SondkarV	veekkas.sondckar@thyssenkrupp.com	10445612	90051	SUGAR  ENGINEERING (Dept Code: 4003)	SUGAR  ENGINEERING (Dept Code: 4003)	+91 20 6612 4516	Pune	Maharashtra	411018	IN
1295	1895	3795	200795	100795	Rajesh	Radhakrishnan	RadhakrishnanR	rajesh.radhakrishnan@thyssenkrupp.com	10383711	9520	SUGAR EXECUTION (Dept Code: 4001)	SUGAR EXECUTION (Dept Code: 4001)	+91 20 6612 4083	Pune	Maharashtra	4110118	IN
1296	1896	3796	200796	100796	Sunil	Pansare	PansareSB	sunil.pansare@thyssenkrupp.com	10445588	9636	CEMENT  DESIGN & ENGINEERING (Dept Code: 6005)	Cement Design & Engineering (Dept Code: 6005)	+91 20 6612 4444	Pune	Maharashtra	411018	IN
1297	1897	3797	200797	100797	Shedge	Narendra	ShedgeN	narendra.shedge@thyssenkrupp.com	10446838	5368	FINANCE  BILL PASSING (Dept Code: 7604)	FINANCE  BILL PASSING (Dept Code: 7604)	+91 20 6612 4244	Pune	Maharashtra	411018	IN
2192	2792	4692	201692	101692	Shyam	Kollamparambil	KollamparambilS	\N	\N	60183	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
1298	1898	3798	200798	100798	Vitthal	Sagare	SagareV	vitthal.sagare@thyssenkrupp.com	10445553	90569	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	020 6612 4686	Pune	Maharashtra	411018	IN
1299	1899	3799	200799	100799	Madhukar	Chawadekar	ChawadekarM	madhukar.chawadekar@thyssenkrupp.com	10446827	90565	Estimation(Dept. Code:7620)	Estimation(Dept. Code:7620)	+91 20 6612 4654	Pune	Maharashtra	411018	IN
1300	1900	3800	200800	100800	Sachin	Phadke	PhadkeS	sachin.phadke@thyssenkrupp.com	10446770	90470	WORKSHOP SUPERVISORS (Dept Code: 5061)	WORKSHOP SUPERVISORS (Dept Code: 5061)	+91 20 6612 4440	Pune	Maharashtra	411018	IN
1301	1901	3801	200801	100801	Mahendra	Umbrajkar	UmbrajkarM	mahendra.umbrajkar@thyssenkrupp.com	10445610	90025	CEMENT  DESIGN & ENGINEERING (Dept Code: 6005)	Cement Design & Engineering (Dept Code: 6005)	+91 20 6612 4443	Pune	Maharashtra	411018	IN
1302	1902	3802	200802	100802	Suhas	Damle	DamleS	suhas.damle@thyssenkrupp.com	10383714	9978	MHE  SELLING (Dept Code: 3002)	MHE  SELLING (Dept Code: 3002)	+91 20 6612 4079	Pune	Maharashtra	411018	IN
1303	1903	3803	200803	100803	Ashutosh	Tilve	TilveA	ashutosh.tilve@thyssenkrupp.com	10383787	9986	Management Assurance (Dept.Code 7610)	Management Assurance (Dept.Code 7610)	+91 20 6612 4237	Pune	Maharashtra	411018	IN
1304	1904	3804	200804	100804	Chanchal	Sinha	SinhaC	Chanchal.Sinha@thyssenkrupp.com	10426433	90461	DESIGN & ENGINEERING	DESIGN & ENGINEERING	+91 20 6612 4471	Pune	Maharashtra	411018	IN
1305	1905	3805	200805	100805	Nazneen	Limboowalla	LimboowallaN	nazneen.limboowalla@thyssenkrupp.com	10446817	90350	VICE CHAIRMAN'S OFFICE (Dept Code: 1001)	M.D & CEOs Office  (Dept Code: 1002)	+91 20 6612 4001	Pune	Maharashtra	411018	IN
1306	1906	3806	200806	100806	Shahrukh	Manjra	ManjraS	shahrukh.manjra@thyssenkrupp.com	10446804	9595	ADMINISTRATION (Dept Code: 7009)	ADMINISTRATION (Dept Code: 7009)	+91 20 6612 4013	Pune	Maharashtra	411018	IN
1307	1907	3807	200807	100807	Ahmar	Afzal	AfzalA	ahmar.afzal@thyssenkrupp.com	10445576	90655	DESIGN & ENGINEERING  STRUCTURAL (Dept Code: 7305)	DESIGN & ENGINEERING  STRUCTURAL (Dept Code: 7305)	+91 20 6612 4784	Pune	Maharashtra	411018	IN
1308	1908	3808	200808	100808	Abhijeet	Shinde	ShindeAS	Abhijeet.Shinde@thyssenkrupp.com	10446428	90303	Workshop	CNC MACHINE SHOP	\N	Pune	Maharashtra	411018	IN
1309	1909	3809	200809	100809	Alok	Bhasme	BhasmeAA	alok.bhasme@thyssenkrupp.com	10488242	90817	Department: R&D (Dept code-1100)	Department: R&D (Dept code-1100)	+91 20 6612  4862	Pune	Maharashtra	411018	IN
1310	1910	3810	200810	100810	Bahubali	Sankannavar	SankannavarB	Bahubali.Sankannavar@thyssenkrupp.com	10446405	9790	Workshop	CNC MACHINE SHOP	\N	Pune	Maharashtra	411018	IN
1311	1911	3811	200811	100811	Kashiray	Tanvanshi	TanvanshiK	Kashiray.Tanvanshi@thyssenkrupp.com	10446397	9740	Workshop	CNC MACHINE SHOP	\N	Pune	Maharashtra	411018	IN
1312	1912	3812	200812	100812	Rahul	Singh	SinghR	rahulr.singh@thyssenkrupp.com	10446747	90659	Sugar	Sugar	020 6612 4020	Pune	Maharashtra	411018	IN
1313	1913	3813	200813	100813	Traf	System	trafsystem	traf.system@thyssenkrupp.com	\N	System-ID	This ID is only for Traf System	\N	\N	Pune	Maharashtra	411018	IN
1314	1914	3814	200814	100814	Rizwan	Ali	AliR	Rizwan.Ali@thyssenkrupp.com	10446389	90494	Services	SERVICES  BOILER DIVISION	\N	Pune	Maharashtra	411018	IN
1315	1915	3815	200815	100815	Shantanu	Saha	SahaSU	shantanu.saha@thyssenkrupp.com	10482348	90661	Kolkata Office	Kolkata Office	033 6605 5222	Pune	Maharashtra	411018	IN
1316	1916	3816	200816	100816	Ambadas	Mane	ManeAV	ambadas.mane@thyssenkrupp.com	10488476	90810	Purchase - Material (Dept. Code: 7712)	Purchase - Material (Dept. Code: 7712)	+91 20 6612 4765	Pune	Maharashtra	411018	IN
1317	1917	3817	200817	100817	Vijaykumar	Ghevade	GhevadeV	Vijaykumar.Ghevade@thyssenkrupp.com	10446435	90479	Workshop	CENTRIFUGAL SHOP	\N	Pune	Maharashtra	411018	IN
1318	1918	3818	200818	100818	Abhijeet	Jadhav	JadhavAA	Abhijeet.Jadhav@thyssenkrupp.com	10446424	90281	Workshop	CNC MACHINE SHOP	\N	Pune	Maharashtra	411018	IN
1319	1919	3819	200819	100819	Vijay	Mungase	MungaseV	Vijay.Mungase@thyssenkrupp.com	10446404	9786	Workshop	CNC MACHINE SHOP	+91 20 6612 4402	Pune	Maharashtra	411018	IN
1320	1920	3820	200820	100820	Prakash	Kumar	KumarPC	Prakash.Kumar@thyssenkrupp.com	10446472	90968	Services	AFTER SALES SERVICES	\N	Pune	Maharashtra	411018	IN
1321	1921	3821	200821	100821	Narendra	Khirnar	KhirnarN	Narendra.Khirnar@Tkiidc.com	\N	PFS99	STORES	\N	\N	\N	\N	\N	\N
1322	1922	3822	200822	100822	Rahul	Gosavi	GosaviR	Rahul.Gosavi@thyssenkrupp.com	10482302	90674	MHE	MHE-Systems, Dept. Code-7303	+91 20 6615 4886	\N	\N	\N	\N
1323	1923	3823	200823	100823	Vijay	Mali	MaliV	Vijay.Mali@thyssenkrupp.com	10446414	90003	Workshop	CON. MACHINE SHOP	\N	Pune	Maharashtra	411018	IN
1324	1924	3824	200824	100824	Amol	Bharankar	BharankarA	Amol.Bharankar@thyssenkrupp.com	10446425	90282	Workshop	CON. MACHINE SHOP	\N	Pune	Maharashtra	411018	IN
1325	1925	3825	200825	100825	Vidyanand	Rawool	RawoolV	vidyanand.rawool@thyssenkrupp.com	10446832	90658	Subcontract Dept	Subcontract Dept	+91 20 6612 4313	Pune	Maharashtra	411018	IN
1326	1926	3826	200826	100826	Bipin	Kate	KateB	Bipin.Kate@thyssenkrupp.com	10446423	90258	Workshop	CNC MACHINE SHOP	\N	Pune	Maharashtra	411018	IN
1327	1927	3827	200827	100827	Paritosh	Wani	WaniP	paritosh.wani@thyssenkrupp.com	10445700	90653	FGD Equipment Design (Dept. 7335)	FGD Equipment Design (Dept. 7335)	+91 20 6612 4441	Pune	Maharashtra	411018	IN
1328	1928	3828	200828	100828	Sandip	Gagare	GagareS	Sandip.Gagare@thyssenkrupp.com	10446403	9783	Workshop	CON. MACHINE SHOP	\N	Pune	Maharashtra	411018	IN
1329	1929	3829	200829	100829	Krishnan	Ramaraj	RamarajK	Krishnan.Ramaraj@thyssenkrupp.com	10446489	60096	Services	SERVICES  MHE DIVISION	\N	Pune	Maharashtra	411018	IN
1330	1930	3830	200830	100830	Vaijnath	Pundkare	PundkareV	Vaijnath.Pundkare@thyssenkrupp.com	10446417	90060	Workshop	PREPARATORY SHOP	\N	Pune	Maharashtra	411018	IN
1331	1931	3831	200831	100831	Pravin	Jadhav	JadhavPM	Pravin.Jadhav@thyssenkrupp.com	10446399	9757	Workshop	CON. MACHINE SHOP	\N	Pune	Maharashtra	411018	IN
1332	1932	3832	200832	100832	Savarimuthu	George	GeorgeS	Savarimuthu.George@thyssenkrupp.com	10446361	90219	Services	SERVICES  MHE DIVISION	\N	Pune	Maharashtra	411018	IN
1333	1933	3833	200833	100833	Vinay	Nayar	NayarV	vinay.nayar@thyssenkrupp.com	10446829	90640	Boiler	Bioler	+ 91 20 6612 4786	Pune	Maharashtra	411018	IN
1334	1934	3834	200834	100834	Namdeo	Katkar	KatkarN	Namdeo.Katkar@thyssenkrupp.com	10446408	9811	Workshop	CNC MACHINE SHOP	\N	Pune	Maharashtra	411018	IN
1335	1935	3835	200835	100835	Abhijit	Kadam	KadamA	Abhijit.Kadam@thyssenkrupp.com	10446396	9737	Services	CNC MACHINE SHOP	\N	Pune	Maharashtra	411018	IN
2193	2793	4693	201693	101693	Bhavin	Ladva	LadvaB	Bhavin.Ladva@thyssenkrupp.com	10619308	60192	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
1336	1936	3836	200836	100836	Vikramshih	Yadav	YadavVS	Vikramshih.Yadav@thyssenkrupp.com	10446400	9762	Workshop	CNC MACHINE SHOP	\N	Pune	Maharashtra	411018	IN
1337	1937	3837	200837	100837	Sanjay	Prajapati	PrajapatiS	Sanjay.Prajapati@thyssenkrupp.com	10446430	90333	Workshop	CON. MACHINE SHOP	\N	Pune	Maharashtra	411018	IN
1338	1938	3838	200838	100838	Prasanna	Kshirsagar	KshirsagarP	Prasanna.Kshirsagar@thyssenkrupp.com	10446421	90241	Workshop	CNC MACHINE SHOP	\N	Pune	Maharashtra	411018	IN
1339	1939	3839	200839	100839	Bapi	Naskar	NaskarB	bapi.naskar@thyssenkrupp.com	10447079	90648	Kolkata Office	\N	033 6605 5225	\N	\N	\N	\N
1340	1940	3840	200840	100840	Onkar	Malekar	MalekarO	Onkar.Malekar@thyssenkrupp.com	10488465	90912	D & E System Engineering (Dept. code 7303)	D & E System Engineering (Dept. code 7303)	+91 20 6612 4883	Pune	Maharashtra	411018	IN
1341	1941	3841	200841	100841	Bharatram	Malkoti	MalkotiB	Bharatram.Malkoti@thyssenkrupp.com	10446438	9307	Delhi Office	DELHI OFFICE EXECUTION	\N	Pune	Maharashtra	411018	IN
1342	1942	3842	200842	100842	Alendra	Rai	RaiA	Alendra.Rai@thyssenkrupp.com	10446491	60097	Services	Services	\N	Pune	Maharashtra	411018	IN
1343	1943	3843	200843	100843	Vishal	Joshi	JoshiVN	Vishal.Joshi@thyssenkrupp.com	10482288	90670	MHE - Marketing	MHE - Marketing	+91 20 6612 4346	Pune	Maharashtra	411018	IN
1344	1944	3844	200844	100844	Edvel	Raja	RajaE	Edvel.Raja@thyssenkrupp.com	10446490	90740	Services	\N	\N	\N	\N	\N	\N
1345	1945	3845	200845	100845	Santosh	Pakhare	PakhareS	Santosh.Pakhare@thyssenkrupp.com	10446420	90094	Workshop	CON. MACHINE SHOP	+91 20 2742 4418	Pune	Maharashtra	411018	IN
1346	1946	3846	200846	100846	Manirul	Haque	HaqueM	manirul.haque@thyssenkrupp.com	10482345	90645	Kolkata Office	Hyderabad Office	033 6605 5224	Pune	Maharashtra	411018	IN
1347	1947	3847	200847	100847	Eknath	Gawas	GawasE	Eknath.Gawas@thyssenkrupp.com	10446412	9998	Workshop	CON. MACHINE SHOP	\N	Pune	Maharashtra	411018	IN
1348	1948	3848	200848	100848	Vivek	Mandekar	MandekarV	vivek.mandekar@thyssenkrupp.com	10488472	90796	DESIGN & ENGINEERING	Design & Engineering To Group Co.(Dept Code: 6006)	+91-20-6612 4843	Pune	Maharashtra	411018	IN
1349	1949	3849	200849	100849	Sumesh	Chakkingal	ChakkingalS	Sumesh.Chakkingal@thyssenkrupp.com	10446379	90385	Services	SERVICES  BOILER DIVISION	\N	Pune	Maharashtra	411018	IN
1350	1950	3850	200850	100850	Navnath	Kagde	KagdeN	Navnath.Kagde@thyssenkrupp.com	10446433	90463	Workshop	CON. MACHINE SHOP	\N	Pune	Maharashtra	411018	IN
1351	1951	3851	200851	100851	Santosh	Singh	SinghSK	SantoshK.Singh@thyssenkrupp.com	10446378	90383	Services-MHE	SERVICES  BOILER DIVISION	\N	Pune	Maharashtra	411018	IN
1352	1952	3852	200852	100852	Attendance	System	Attendance.System	Attendance.System@thyssenkrupp.com	\N	System-ID	This ID is only for Attendance System	\N	\N	Pune	Maharashtra	411018	IN
1353	1953	3853	200853	100853	Arvind	Singh	SinghAK	Arvindk.Singh@thyssenkrupp.com	10446360	90206	Services	SERVICES  MHE DIVISION	\N	Pune	Maharashtra	411018	IN
1354	1954	3854	200854	100854	Sambhaji	Sangle	SangleS	Sambhaji.Sangle@thyssenkrupp.com	10446436	90480	Workshop	CNC MACHINE SHOP	\N	Pune	Maharashtra	411018	IN
1355	1955	3855	200855	100855	Nandkishor	Thitame	ThitameN	Nandkishor.Thitame@thyssenkrupp.com	10446416	90053	Workshop	CNC MACHINE SHOP	\N	Pune	Maharashtra	411018	IN
1356	1956	3856	200856	100856	Kaushal	Sharma	SharmaK	kaushal.sharma@thyssenkrupp.com	10447214	90644	Quality ? Site	Quality ? Site	\N	Pune	Maharashtra	411018	IN
1357	1957	3857	200857	100857	Bhagyashri	Bhagat	BhagatB	bhagyashri.bhagat@thyssenkrupp.com	\N	BSA70014	ADMINISTRATION	ADMINISTRATION	\N	Pune	Maharashtra	411018	IN
1358	1958	3858	200858	100858	Kiran	Narewadikar	NarewadikarK	Kiran.Narewadikar@thyssenkrupp.com	10446355	9732	Services	SERVICES  BOILER DIVISION	\N	Pune	Maharashtra	411018	IN
1359	1959	3859	200859	100859	Subramaniyan	Rajashekar	RajashekarS	Subramaniyan.Rajashekar@thyssenkrupp.com	10446443	60049	Services	AFTER SALES SERVICES	\N	Pune	Maharashtra	411018	IN
1360	1960	3860	200860	100860	Arabinda	Deb	DebA	arabinda.deb@thyssenkrupp.com	10446830	90643	Kolkata Office	Kolkata Office	033 6605 5227	Pune	Maharashtra	Maharashtra	IN
1361	1961	3861	200861	100861	Ramchandra	Pawar	PawarRK	Ramchandra.Pawar@thyssenkrupp.com	10446419	90083	Workshop	CON. MACHINE SHOP	\N	Pune	Maharashtra	411018	IN
1362	1962	3862	200862	100862	Kaliyaperumal	Kirubakaran	KirubakaranK	Kaliyaperumal.Kirubakaran@thyssenkrupp.com	10446465	90671	Services	AFTER SALES SERVICES	\N	Pune	Maharashtra	411018	IN
1363	1963	3863	200863	100863	Ravi	Nitturkar	NitturkarR	ravi.nitturkar@thyssenkrupp.com	10447116	9803	Services	Services Dept.	+91 20 6612 4036	\N	\N	\N	\N
1364	1964	3864	200864	100864	Srikanth	Kommajosyula	KommajosyulaS	srikanth.kommajosyula@thyssenkrupp.com	10447177	90211	Services	Services	\N	Pune	Maharashtra	411 018	IN
1365	1965	3865	200865	100865	Jayesh	Chaudhari	ChaudhariJH	Jayesh.Chaudhari@thyssenkrupp.com	10446434	90472	Workshop	CON. MACHINE SHOP	\N	Pune	Maharashtra	411018	IN
1366	1966	3866	200866	100866	Ponnusamy	Periyasaamy	PeriyasaamyP	Ponnusamy.Periyasaamy@thyssenkrupp.com	10446475	60053	Services	AFTER SALES SERVICES	\N	Pune	Maharashtra	411018	IN
1367	1967	3867	200867	100867	Prasad	Kanagala	KanagalaP	prasad.kanagala@thyssenkrupp.com	10447324	90417	Services	Services	\N	Pune	Maharashtra	411 018	IN
1368	1968	3868	200868	100868	Govindasamy	Elumalai	ElumalaiG	Govindasamy.Elumalai@thyssenkrupp.com	10446480	60054	Services	AFTER SALES SERVICES	\N	Pune	Maharashtra	411018	IN
1369	1969	3869	200869	100869	Harshad	Lad	LadH	Harshad.Lad@thyssenkrupp.com	10446401	9773	Workshop	CNC MACHINE SHOP	\N	Pune	Maharashtra	411018	IN
1370	1970	3870	200870	100870	Gaurav	Makashir	MakashirG	gaurav.makashir@thyssenkrupp.com	10446831	90654	Finance Dept.	Finance Dept.	+ 91 20 6612 4256	Pune	Maharashtra	411018	IN
1371	1971	3871	200871	100871	Rahul	Pillai	PillaiRS	Rahul.Pillai@thyssenkrupp.com	10446488	60095	Services	Services	\N	Pune	Maharashtra	411018	IN
1372	1972	3872	200872	100872	Savarinuthu	Charles	CharlesS	Savarinuthu.Charles@thyssenkrupp.com	10446464	60056	Services	AFTER SALES SERVICES	\N	Pune	Maharashtra	411018	IN
1373	1973	3873	200873	100873	Mahendra	Kharate	KharateM	Mahendra.Kharate@thyssenkrupp.com	10446415	90044	Workshop	CNC MACHINE SHOP	\N	Pune	Maharashtra	411018	IN
1374	1974	3874	200874	100874	Vidyadhar	Mukane	MukaneV	Vidyadhar.Mukane@thyssenkrupp.com	10446375	90330	Services-MHE	\N	\N	\N	\N	\N	\N
1375	1975	3875	200875	100875	Ramasamy	Arumugam	ArumugamR	Ramasamy.Arumugam@thyssenkrupp.com	10446471	90913	CIVIL  EXECUTION	CIVIL  EXECUTION	\N	Pune	Maharashtra	411018	IN
1376	1976	3876	200876	100876	Umesh	Gade	GadeU	Umesh.Gade@thyssenkrupp.com	10446411	9972	Workshop	CON. MACHINE SHOP	\N	Pune	Maharashtra	411018	IN
1377	1977	3877	200877	100877	Somnath	Singh	SinghSR	Somnath.Singh@thyssenkrupp.com	10446492	90739	Services	Services	\N	Pimpri	Maharashtra	411018	IN
1378	1978	3878	200878	100878	Srikrishna	Boopathy	BoopathyS	Srikrishna.Boopathy@thyssenkrupp.com	10446357	9988	Services	SERVICES  BOILER DIVISION	\N	Pune	Maharashtra	411018	IN
1379	1979	3879	200879	100879	Meghanad	Das	DasMD	Meghanad.Das@thyssenkrupp.com	10446359	90088	CIVIL  EXECUTION	CIVIL  EXECUTION	\N	Pune	Maharashtra	411018	IN
1380	1980	3880	200880	100880	Puthiya	Muralidharan	MuralidharanP	Puthiya.Muralidharan@thyssenkrupp.com	10446381	90415	Services	AFTER SALES SERVICES	\N	Pune	Maharashtra	411018	IN
1381	1981	3881	200881	100881	Santosh	Poal	PoalS	Santosh.Poal@thyssenkrupp.com	10446386	90478	Services	SERVICES  BOILER DIVISION	\N	Pune	Maharashtra	411018	IN
1382	1982	3882	200882	100882	Ravi	Danawale	DanawaleR	Ravi.Danawale@thyssenkrupp.com	10482292	90675	Cement Engineering ( DEPT CODE: 6003)	Plant Design (Post Order) Group (Dept Code: 6009)	+91 20 6612 4554	Pune	Maharashtra	411018	IN
1383	1983	3883	200883	100883	Prashant	Kamble	KamblePT	Prashant.Kamble@thyssenkrupp.com	10446437	9311	Workshop	ADMINISTRATION  GARAGE	\N	Pune	Maharashtra	411018	IN
1384	1984	3884	200884	100884	Kishor	Bhagat	BhagatK	kishor.bhagat@thyssenkrupp.com	10445707	90646	PPC Workshop	PPC Workshop	+91 20 6612 4413	Pune	Maharashtra	411018	IN
1385	1985	3885	200885	100885	Varadarajan	Rajasekhar	RajasekharV	Varadarajan.Rajasekhar@thyssenkrupp.com	10446474	60052	Services	AFTER SALES SERVICES	\N	Pune	Maharashtra	411018	IN
1386	1986	3886	200886	100886	Nilesh	Jagtap	JagtapN	Nilesh.Jagtap@thyssenkrupp.com	10446422	90248	Workshop	CNC MACHINE SHOP	\N	Pune	Maharashtra	411018	IN
1387	1987	3887	200887	100887	Veeraragavan	Murugan	MuruganV	Veeraragavan.Murugan@thyssenkrupp.com	10446383	90418	Services	AFTER SALES SERVICES	\N	Pune	Maharashtra	411018	IN
1388	1988	3888	200888	100888	Madhukar	Damame	DamameM	Madhukar.Damame@thyssenkrupp.com	10446409	9813	Workshop	CON. MACHINE SHOP	\N	Pune	Maharashtra	411018	IN
1389	1989	3889	200889	100889	Venkatakrishnan	Pillai	PillaiVP	Venkatakrishnan.Pillai@thyssenkrupp.com	10446382	90416	Services	AFTER SALES SERVICES	\N	Pune	Maharashtra	411018	IN
1390	1990	3890	200890	100890	Radheshyam	Kumar	KumarR	Radheshyam.Kumar@thyssenkrupp.com	10446387	90482	Services	SERVICES  BOILER DIVISION	\N	Pune	Maharashtra	411018	IN
1391	1991	3891	200891	100891	Satish	Poojari	PoojariSA	Satish.Poojari@thyssenkrupp.com	10446439	90006	VICE CHAIRMAN'S OFFICE (Dept Code: 1001)	VICE CHAIRMAN'S OFFICE	\N	Pune	Maharashtra	411018	\N
1392	1992	3892	200892	100892	Prem	Shrivastav	ShrivastavP	prem.shrivastav@thyssenkrupp.com	10481188	90666	Cement	PM_Cement_9604	+91 20 6612 4229	\N	\N	\N	\N
1393	1993	3893	200893	100893	Aniket	Jagtap	JagtapA	aniket.jagtap@thyssenkrupp.com	10488374	90797	ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4768	Pune	Maharashtra	411018	IN
1394	1994	3894	200894	100894	Sachin	Nikam	NikamS	Sachin.Nikam@thyssenkrupp.com	10446413	90002	Workshop	CNC MACHINE SHOP	\N	Pune	Maharashtra	411018	IN
1395	1995	3895	200895	100895	Ashok	Jangam	JangamA	Ashok.Jangam@thyssenkrupp.com	10446463	90780	CIVIL  EXECUTION	CIVIL  EXECUTION	\N	Pune	Maharashtra	411018	IN
1396	1996	3896	200896	100896	PrantikKumar	Ray	RayP	prantikkumar.ray@thyssenkrupp.com	10383713	15534	BOILER  SELLING (Dept Code: 2002)	BOILER  SELLING (Dept Code: 2002)	+91 20 6612 4085	Pune	Maharashtra	411018	IN
1397	1997	3897	200897	100897	Sudarshan	Nasery	NaseryS	sudarshan.nasery@thyssenkrupp.com	10447179	90228	BOILER  SELLING (Dept Code: 2002)	BOILER  SELLING (Dept Code: 2002)	+91 20 6612 4668	Pimpri	Maharashtra	411018	IN
1398	1998	3898	200898	100898	Dadasaheb	Tanpure	TanpureT	Dadasaheb.Tanpure@thyssenkrupp.com	10488668	9410	SERVICES  BOILER DIVISION	SERVICES  BOILER DIVISION	+91 20 6612 4098	Pune	Maharashtra	411018	IN
1399	1999	3899	200899	100899	Sanjeev	Kumar	KumarSN	Sanjeev.Kumar@thyssenkrupp.com	10446388	90483	Services	SERVICES  MHE DIVISION	\N	Pune	Maharashtra	411018	IN
1400	2000	3900	200900	100900	Pandurang	Kadam	KadamP	Pandurang.Kadam@thyssenkrupp.com	10446467	90738	Services	SERVICES  BOILER DIVISION	\N	Pune	Maharashtra	411018	IN
1401	2001	3901	200901	100901	Venkiteswaran	Sivaramakrishnan	SivaramakrishnanV	Venkiteswaran.Sivaramakrishnan@thyssenkrupp.com	10446354	9639	Services	Construction Services	+91 20 6612 4036	Pune	Maharashtra	411018	IN
1402	2002	3902	200902	100902	Chandrakant	Dhenge	DhengeC	Chandrakant.Dhenge@thyssenkrupp.com	10446410	9817	Workshop	CNC MACHINE SHOP	\N	Pune	Maharashtra	411018	IN
1403	2003	3903	200903	100903	Subhashis	Dey	Dey_S	subhashis.dey@thyssenkrupp.com	10447078	90642	Kolkatta	Kolkatta	+91 033 6605 5211	Pune	Maharashtra	411018	IN
1404	2004	3904	200904	100904	Sanjay	Kavathekar	KavathekarS	sanjay.kavathekar@thyssenkrupp.com	10446812	90157	Service	Services	\N	Pune	Maharashtra	411 018	IN
1405	2005	3905	200905	100905	Mallinath	Chitali	ChitaliM	Mallinath.Chitali@thyssenkrupp.com	10446402	9782	Workshop	CNC MACHINE SHOP	\N	Pune	Maharashtra	411018	IN
1406	2006	3906	200906	100906	Velayutham	Shanmugam	ShanmugamV	Velayutham.Shanmugam@thyssenkrupp.com	10446481	60050	Services	AFTER SALES SERVICES	\N	Pune	Maharashtra	411018	IN
1407	2007	3907	200907	100907	Sagar	Kachi	KachiS	Sagar.Kachi@thyssenkrupp.com	\N	PFS82	FINANCE  TAXATION (Dept Code: 7606)	FINANCE  TAXATION (Dept Code: 7606)	\N	Pune	Maharashtra	411018	IN
1408	2008	3908	200908	100908	Ravindra	Dake	DakeR	Ravindra.Dake@thyssenkrupp.com	10446418	90066	Workshop	CON. MACHINE SHOP	\N	Pune	Maharashtra	411018	IN
1409	2009	3909	200909	100909	Amit	Singh	SinghA	amit.singh@thyssenkrupp.com	10447218	98042	Hyderabad Office	Hyderabad Office	\N	Pune	Maharashtra	411018	IN
1410	2010	3910	200910	100910	Dattatray	Bombatkar	BombatkarD	dattatray.bombatkar@thyssenkrupp.com	10446366	90625	DESIGN & ENGINEERING  STRUCTURAL (Dept Code: 7305)	DESIGN & ENGINEERING  STRUCTURAL (Dept Code: 7305)	+91 20 6612 4778	Pune	Maharashtra	411018	IN
1411	2011	3911	200911	100911	BBS	Admin	bbsadmin	BBS.Admin@Tkiidc.com	\N	System-ID	For Blackberry 2K10 Application T&IS	\N	\N	\N	\N	\N	\N
1412	2012	3912	200912	100912	Nagesh	Chavan	ChavanNS	Nagesh.Chavan@thyssenkrupp.com	10446426	90299	Workshop	CNC MACHINE SHOP	\N	Pune	Maharashtra	411018	IN
1413	2013	3913	200913	100913	Shripad	Vakil	VakilS	\N	\N	90236	CEMENT  SELLING (Dept Code: 6002)	CEMENT  SELLING (Dept Code: 6002)	+91 20 6612 4168	Pune	Maharashtra	411018	IN
1414	2014	3914	200914	100914	Anmol	Mudholkar	MudholkarA	Anmol.Mudholkar@ThyssenKrupp.com	10242540	9331	BOILER  SELLING (Dept Code: 2002)	BOILER  SELLING (Dept Code: 2002)	+91 20 66124048	Pune	Maharashtra	411018	IN
2371	2971	4871	201871	101871	aman	verma	verma_ar	aman.verma@thyssenkrupp.com	10619339	60227	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
1415	2015	3915	200915	100915	Suresh	Taklikar	TaklikarS	\N	\N	9176	FINANCE  TAXATION (Dept Code: 7606)	FINANCE  TAXATION (Dept Code: 7606)	\N	Pune	Maharashtra	411018	IN
1416	2016	3916	200916	100916	Ganesh	Kulkarni	KulkarniGJ	\N	\N	90468	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	+91 20 6612 4487	Pune	Maharashtra	411018	IN
1417	2017	3917	200917	100917	Gopal	Shankar	ShankarG	Gopal.Shankar@ThyssenKrupp.com	10383708	9037	MHE EXECUTION (Dept Code: 3004)	PM_MHE_9304	+91 20 66124159	Pune	Maharashtra	411018	IN
1418	2018	3918	200918	100918	Abhishek	Tripathi	TripathiA	\N	\N	90292	Estimation(Dept. Code:7620)	Estimation(Dept. Code:7620)	+91 20 6612 4110	Pune	Maharashtra	411018	IN
1419	2019	3919	200919	100919	Ravindra	Agarkar	AgarkarR	\N	\N	9019	Boht-Out (Dept. Code: 7702 )	Boht-Out Material	+91 20 6612 4049	Pune	Maharashtra	411018	IN
1420	2020	3920	200920	100920	Prem	Gupta	GuptaP	\N	\N	9532	Quality Assurance (Site)	Quality Assurance (Site)	\N	Pune	Maharashtra	411018	IN
1421	2021	3921	200921	100921	Raju	Nageshkar	NageshkarR	raju.nageshkar@ThyssenKrupp.com	10258749	5278	PERSONNEL  ADMINISTRATION (Dept Code: 5202)	PERSONNEL  ADMINISTRATION (Dept Code: 5202)	+91 20 6612 4355	Pune	Maharashtra	411018	IN
1422	2022	3922	200922	100922	Umakant	Patil	PatilU	\N	\N	90357	DESIGN & ENGINEERING  CRUSHER/SCREEN (Dept Code: 7304)	DESIGN & ENGINEERING  CRUSHER/SCREEN (Dept Code: 7304)	+91 20 6612 4658	Pune	Maharashtra	411018	IN
1423	2023	3923	200923	100923	Nishant	Shrivatsava	ShrivatsavaN	\N	\N	90601	Commercial (Dept. Code:7630)	Commercial (Dept. Code:7630)	+91 20 6612 4022	Pune	Maharashtra	411018	IN
1424	2024	3924	200924	100924	K	Kumaresan	Kumaresan	k.kumaresan@thyssenkrupp.com	10383688	15535	FINANCE  MANAGEMENT (Dept Code: 7601)	FINANCE  MANAGEMENT (Dept Code: 7601)	+91 20 6612 4679	Pune	Maharashtra	411018	IN
1425	2025	3925	200925	100925	Pravin	Mahadik	MahadikP	pravin.mahadik@thyssenkrupp.com	10446809	9789	PERSONNEL  ADMINISTRATION (Dept Code: 5202)	PERSONNEL  ADMINISTRATION (Dept Code: 5202)	+91 20 6612 4351	Pune	maharashtra	411018	IN
1426	2026	3926	200926	100926	Mallikarjun	Puranik	PuranikM	Mallikarjun.Puranik@ThyssenKrupp.com	10383778	PFS276	FINANCE  TAXATION (Dept Code: 7606)	FINANCE  TAXATION (Dept Code: 7606)	+91 20 66124263	\N	\N	\N	\N
1427	2027	3927	200927	100927	Ranjit	Mohite	MohiteR	ranjit.mohite@thyssenkrupp.com	10422196	90411	PERSONNEL  ADMINISTRATION (Dept Code: 5202)	PERSONNEL  ADMINISTRATION (Dept Code: 5202)	+91 20 6612 4353	Pune	Maharashtra	411018	IN
1428	2028	3928	200928	100928	Sameer	Kulkarni	KulkarniSK	\N	\N	9920	BOILER  SELLING (Dept Code: 2002)	BOILER  SELLING (Dept Code: 2002)	+91 20 6612 4582	Pune	Maharashtra	411018	IN
1429	2029	3929	200929	100929	Mahaveer	Kale	KaleM	mahaveer.kale@thyssenkrupp.com	10442313	90630	Sugar Marketing	Sugar Marketing	+91 20 66124144	Pune	Maharashtra	411018	IN
1430	2030	3930	200930	100930	Kaustav	Mukherjee	MukherjeeK	kaustav.mukherjee@thyssenkrupp.com	10447282	90531	Services	Services	+91 8897462334	VIZAG	ANDHRA PRADESH	530023	IN
1431	2031	3931	200931	100931	Sanjay	Extross	ExtrossS	Sanjay.Extross@ThyssenKrupp.com	10383757	5939	SUGAR  SELLING (Dept Code: 4002)	SUGAR  SELLING (Dept Code: 4002)	+91 20 66124198	Pune	Maharashtra	411018	IN
1432	2032	3932	200932	100932	Prasanth	Radhakrishnan	RadhakrishnanP	prasanth.radhakrishnan@thyssenkrupp.com	10447289	90598	Services	Services	9.1867E+11	Pune	Maharashtra	411018	IN
1433	2033	3933	200933	100933	Wilson	K	WilsonK	wilson.sagayaraj@thyssenkrupp.com	10446776	90633	BOILER  EXECUTION (Dept Code: 2004)	BOILER  EXECUTION (Dept Code: 2004)	+91 20 6612 4797	Pune	Maharashtra	411018	IN
1434	2034	3934	200934	100934	Jeevan	Sutar	SutarJ	Jeevan.Sutar@thyssenkrupp.com	10445732	90617	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	020 6612 4596	Pune	Maharashtra	411018	IN
1435	2035	3935	200935	100935	Deshmukh	Madan	Deshmukh M	Madan.Deshmukh@ThyssenKrupp.com	10446785	5459	Internal Audit(Dept. Code:7610)	Internal Audit(Dept. Code:7610)	+91 20 6612 4172	Pune	Maharashtra	411018	IN
1436	2036	3936	200936	100936	Suhas	Mengane	MenganeS	suhas.mengane@thyssenkrupp.com	10446934	90392	Services  (Dept. Code: 7805 )	Services  (Dept. Code: 7805 )	+91 20 2742 4098	Pune	Maharashtra	411018	IN
1437	2037	3937	200937	100937	Sushant 	Pawar	PawarSV	\N	\N	4838	MHE	MHE	\N	Pune	Maharashtra	411018	IN
1438	2038	3938	200938	100938	Balakrishnan	Menon	MenonB	Balakrishnan.Menon@Tkiidc.com	\N	BSA149038	Indirect -Taxation	Finance	\N	Pune	Maharashtra	411018	IN
1439	2039	3939	200939	100939	Malay	Das	DasM	Malay.Das@ThyssenKrupp.com	10216799	15525	Business Advisor & Board Member	Business Advisor & Board Member's Office ( Dept code 1004)	+91 20 6612 4136	Pune	Maharashtra	411018	IN
1440	2040	3940	200940	100940	Dastoor	K	DastoorK	\N	\N	5205	Commercial (Dept. Code:7630)	Vice President Commercial (Dept. Code:7630)	+91 20 6612 4270	Pune	Maharashtra	411018	IN
1441	2041	3941	200941	100941	Suryakant	Chindage	ChindageS	\N	\N	90647	PPC Workshop	PPC Workshop	020 6612 4413	Pune	Maharashtra	411018	IN
1442	2042	3942	200942	100942	Aditya	Godse	GodseAP	\N	\N	90779	Services Division	Services Division	020-66124620	Pune	Maharashtra	411018	IN
1443	2043	3943	200943	100943	SQLExecutiveCmdExec	\N	SQLExecutiveCmdExec	SQLExecutiveCmdExec@thyssenkruppindia.com	\N	System-ID	For Running SQL services	\N	\N	Pune	Maharashtra	411018	IN
1444	2044	3944	200944	100944	Laxmikant	Patil	PatilL	\N	\N	16141	Structural Design	Structural Design	+91 20 6612 4828	Pune	Maharashtra	411018	IN
1445	2045	3945	200945	100945	Vishvas	Yadav	VishvasY	\N	\N	PFS-198	IMPORT-EXPORT	IMPORT-EXPORT	+91 20 6612 4761	Pune	Maharashtra	411018	IN
1446	2046	3946	200946	100946	Sharad	Patil	Patil_SM	\N	\N	9665	Services	SERVICES  SUGAR DIVISION	\N	Pune	Maharashtra	411018	IN
1447	2047	3947	200947	100947	Dasharath	Aher	AherD	\N	\N	60098	Services	SERVICES  BOILER DIVISION	9.17995E+11	Pune	Maharashtra	411018	IN
1448	2048	3948	200948	100948	Payal	Hoval	HovalP	\N	\N	PFS69	Estimation(Dept. Code:7620)	Estimation(Dept. Code:7620)	+91 20 6612 4742	Pune	Maharashtra	411018	IN
1449	2049	3949	200949	100949	\N	\N	IISAUTHOR	IISAUTHOR@thyssenkruppindia.com	\N	System-ID	Buit-in account for IIS	\N	\N	Pune	Maharashtra	411018	IN
1450	2050	3950	200950	100950	Krishnakumar	Iyer	IyerKV	\N	\N	9524	CEMENT  EXECUTION (Dept Code: 6004)	PM_Cement_9604	+91 20 6612 4229	Pune	Maharashtra	411018	IN
1451	2051	3951	200951	100951	Amit	Narkhede	NarkhedeA	amit.narkhede@thyssenkrupp.com	10446828	90636	Boiler	Boiler	+91 20 6612 4788	Pune	Maharashtra	411018	IN
1452	2052	3952	200952	100952	Vikram	Sable	SableV	vikram.sabale@thyssenkrupp.com	10488612	90887	WORKSHOP	WORKSHOP	\N	Pune	Maharashtra	411018	IN
1453	2053	3953	200953	100953	Bala	Balamurugan	BalamuruganB	Bala.Balamurugan@thyssenkrupp.com	10446486	90804	Services	Services	\N	Pune	Maharashtra	411018	IN
1455	2055	3955	200955	100955	Arun	Patil	PatilAU	arun.patil@thyssenkrupp.com	10446407	9794	Workshop	CNC MACHINE SHOP	\N	Pune	Maharashtra	411018	IN
1456	2056	3956	200956	100956	Parasaram	Nirupdrava	NirupdravaP	Parasaram.Nirupdrava@thyssenkrupp.com	10488528	90664	Quality ? Boughtout	Quality ? Boughtout	+91 20 6612 4109	Pune	Maharashtra	411018	IN
1457	2057	3957	200957	100957	Tushar	Durgawale	DurgawaleT	tushar.durgawale@thyssenkrupp.com	10488307	90788	RESEARCH & DEVELOPMENT (Dept Code: 1100)	MHE M/C	\N	Pune	Maharashtra	411018	IN
1458	2058	3958	200958	100958	Vishwanath	Chikadoli 	ChikadoliV	vishwanath.chikadoli@thyssenkrupp.com	10488266	90809	Purchase - Material (Dept. Code: 7712)	Purchase - Material (Dept. Code: 7712)	+ 020 6612 4787	Pune	Maharashtra	411018	IN
1459	2059	3959	200959	100959	Chinnadurai	Saravanan	SaravananC	Chinnadurai.Saravanan@thyssenkrupp.com	10446363	90413	Services	AFTER SALES SERVICES	\N	Pune	Maharashtra	411018	IN
1460	2060	3960	200960	100960	Nitesh	Patokar	PatokarN	Nitesh.Patokar@thyssenkrupp.com	10446427	90301	Workshop	\N	\N	\N	\N	\N	\N
1461	2061	3961	200961	100961	Nitin	Kawade	KawadeN	Nitin.Kawade@thyssenkrupp.com	10446398	9756	Workshop	Workshop	\N	Pune	Maharashtra	411018	IN
1462	2062	3962	200962	100962	IT	HYD	ithyd	ithyd.tkii@tkiidc.com	\N	Orbit	Hyderabad Office	IT - Hyderabad Office	040-2794 1205	Pune	Maharashtra	411018	IN
1463	2063	3963	200963	100963	Abdul	Shaik	ShaikA	Abdul.Shaik@thyssenkrupp.com	10482352	98044	Hyderabad Office	Hyderabad Office	040-2794 1481	Pune	Maharashtra	411018	IN
1464	2064	3964	200964	100964	Sudeep	Sar	SarS	\N	\N	90731	CEMENT  ENGINEERING (Dept Code: 6003)	CEMENT  ENGINEERING (Dept Code: 6003)	+91  20 6612 4183	Pune	Maharashtra	411018	IN
1465	2065	3965	200965	100965	Pramod	Ranjan	RanjanP	pramod.ranjan@thyssenkrupp.com	10481185	90729	Project Management (Dept. code : 9704)	Project Management (Dept. code : 7500).	+91 20 6612 4390	Pune	Maharashtra	400018	IN
1466	2066	3966	200966	100966	Kedar	Tanksale	TanksaleK	Kedar.Tanksale@thyssenkrupp.com	10481193	90683	ELECTRICAL ENGINEERING	\N	+91 20 6612 4213	\N	\N	\N	\N
1467	2067	3967	200967	100967	Rahul	Bang	BangR	rahul.bang@thyssenkrupp.com	10482321	90768	Services  (Dept. Code: 7804)	Services  (Dept. Code: 7804)	+91 20 6612 4370	\N	\N	\N	\N
1468	2068	3968	200968	100968	Nishikant	Potode	PotodeN	nishikant.potode@thyssenkrupp.com	10481186	90722	Boht-Out ( Dept. Code:7702 )	Boht-Out (Dept. Code:  7702)	+91 20 6612 4808	Pune	Maharashtra	411018	IN
1469	2069	3969	200969	100969	Gangesh	Mishra	MishraG	\N	\N	90749	Services	PM_Planning_9704	\N	Pune	Maharashtra	411018	IN
1470	2070	3970	200970	100970	Pramod	Jadhav	JadhavPS	pramod.jadhav@thyssenkrupp.com	10482335	90726	Services	AFTER SALES SERVICES	+91 20 6612 4077	Pune	Maharashtra	411018	IN
1471	2071	3971	200971	100971	Pravin	Keshari	KeshariP	pravin.keshari@thyssenkrupp.com	10482331	90715	Services Dept	Services Dept	\N	Pune	Maharashtra	411018	IN
1472	2072	3972	200972	100972	Pratik	Roy	RoyP	pratik.roy@thyssenkrupp.com	10488611	90772	Services	\N	\N	\N	\N	\N	\N
1473	2073	3973	200973	100973	Gajanan	Uppe	UppeG	gajanan.uppe.external@thyssenkrupp.com 	\N	1792418	Design	\N	\N	\N	\N	\N	\N
1474	2074	3974	200974	100974	Mahesh	Doifode	DoifodeM	Mahesh.Doifode@Tkiidc.com	\N	1792466	Design	Design	\N	\N	\N	\N	\N
1475	2075	3975	200975	100975	Ajoy	Saha	SahaA	ajoy.saha@thyssenkrupp.com	10482317	90730	Services Dept	Services Dept.	+91 20 6612 4825	Pune	Maharashtra	411 018	IN
1476	2076	3976	200976	100976	Aditya	Kathavate	KathavateA	aditya.kathavate@thyssenkrupp.com	10482320	90757	Services	Services Dept.	\N	Pune	Maharashtra	411 018	IN
1477	2077	3977	200977	100977	Rohan	Kadam	KadamR	rohan.kadam@thyssenkrupp.com	10488389	90885	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4459	Pune	Maharashtra	411018	IN
1478	2078	3978	200978	100978	Shailesh	Thakare	ThakareS	Shailesh.Thakare@thyssenkrupp.com	10446909	9921	CEMENT  DESIGN & ENGINEERING (Dept Code: 6005)	Cement Design & Engineering (Dept Code: 6005)	+91 20 6612 4461	Pune	Maharashtra	411018	IN
1479	2079	3979	200979	100979	Pandu	Varala	VaralaP	pandu.varala@thyssenkrupp.com	10482303	91004	DESIGN & ENGINEERING  STRUCTURAL (Dept Code: 7305)	DESIGN & ENGINEERING  STRUCTURAL (Dept Code: 7305)	\N	Pune	Maharashtra	411018	IN
1480	2080	3980	200980	100980	Arijit	Mukherjee	MukherjeeA	arijit.mukherjee@thyssenkrupp.com	10482295	90716	Project Management (Dept. code : 9704)	PM_Planning_9704	+91 20 6612 4690	Pune	Maharashtra	400018	IN
1481	2081	3981	200981	100981	Jayasundar	Thangasamy	ThangasamyJ	jayasundar.thangasamy@thyssenkrupp.com	10446468	60051	Services	AFTER SALES SERVICES	\N	Pune	Maharashtra	411018	IN
1482	2082	3982	200982	100982	Satyabrata	Kumar	KumarSH	satyabrata.kumar@thyssenkrupp.com	10488439	90704	Kolkata Office (Dept. Code:8021)	Plant Design (Post Order) Group (Dept Code: 6009)	033 6605 5214	Kolkata	West Bengal	700156	IN
1483	2083	3983	200983	100983	Nirav	Prajapati	PrajapatiN	nirav.prajapati@thyssenkrupp.com	10488566	90791	MHE  Equipment Cell (Dept. Code: 3002 )	MHE  Equipment Cell (Dept. Code: 3002 )	91 20 6612 4830	Pune	Maharashtra	411018	IN
1484	2084	3984	200984	100984	Alagesan	Natarajan	NatarajanA	alagesan.natarajan@thyssenkrupp.com	10446462	60055	Services	AFTER SALES SERVICES	\N	Pune	Maharashtra	411018	IN
1485	2085	3985	200985	100985	Rajiv	Saha	SahaR	Rajiv.Saha@thyssenkrupp.com	10488613	90677	Kolkata Office	Kolkata Office	033 6605 5217	Pune	Maharashtra	411018	IN
1486	2086	3986	200986	100986	Rajesh	Khandekar	KhandekarR	rajesh.khandekar@thyssenkrupp.com	10488418	90904	CEMENT  DESIGN & ENGINEERING (Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4843	Pune	Maharashtra	411018	IN
1487	2087	3987	200987	100987	Rohit	Awatade	AwatadeR	rohit.awatade@thyssenkrupp.com	10488222	90910	FGD Equipment Design (Dept. 7335)	FGD Equipment Design (Dept. 7335)	+91 20 6612 4781	Pune	Maharashtra	411018	IN
1488	2088	3988	200988	100988	Kaniska	Bhattacharya	BhattacharyaK	kaniska.bhattacharya@thyssenkrupp.com	10482347	90713	Kolkata Office	Kolkata Office	+91 033 6605 5212	Pune	Maharashtra	411018	IN
1489	2089	3989	200989	100989	Subhankar	Chaudhuri	ChaudhuriS	Subhankar.Chaudhuri@thyssenkrupp.com	10481187	90694	Service	Services	+91 20 6612 4063	\N	\N	\N	\N
1490	2090	3990	200990	100990	Ramulu	Singannagari	SingannagariR	ramulu.singannagari@thyssenkrupp.com	10488580	98049	Hyderabad Office	Hyderabad Office	040-2794 1430	\N	\N	\N	\N
1491	2091	3991	200991	100991	Rakesh	Kaji	KajiR	rakesh.kaji@thyssenkrupp.com	10482312	90700	Boht-Out (Dept. Code:  7702)	BOHT-OUT	020 6612 4738	Pune	Maharashtra	411018	IN
1492	2092	3992	200992	100992	Santosh	Pathare	PathareS	santosh.pathare@tkiidc.com	\N	PFS122	Stores  (Dept. Code:  7752)	Stores & Despatch	\N	Pune	Maharashtra	411018	IN
1493	2093	3993	200993	100993	Pravin	Wadekar	WadekarP	pravin.wadekar@tkiidc.com	\N	PFS15	SUB CONTRACT (Dept. Code:7742  )	Subcontract Department	\N	Pune	Maharashtra	411018	IN
1494	2094	3994	200994	100994	Naushadh	Maideen	MaideenN	Naushadh.Maideen@thyssenkrupp.com	10482341	90705	Services	AFTER SALES SERVICES	\N	Pune	Maharashtra	411018	IN
1495	2095	3995	200995	100995	Swapan	Jati	JatiS	Swapan.Jati@thyssenkrupp.com	10488377	90703	Kolkata Office (Dept. Code:8021)	Plant Design (Post Order) Group (Dept Code: 6009)	033 6605 5214	Kolkata	West Bengal	700156	IN
1496	2096	3996	200996	100996	Chandrasekar	Kandhaswamy	ChandrasekarK	chandrasekar.kandhaswamy@thyssenkrupp.com	10482300	90762	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4820	Pune	Maharashtra	411018	IN
1497	2097	3997	200997	100997	Santanu	Majumder	MajumderS	Santanu.Majumder@thyssenkrupp.com	10482346	90691	Kolkata Office	\N	033 6605 5222	Pune	Maharashtra	411018	IN
1498	2098	3998	200998	100998	Ganesh	Dhapte	DhapteG	ganesh.dhapte@tkiidc.com	\N	PFS128	Stores  (Dept. Code:  7752)	Stores & Despatch	020 66124029	Pune	Maharashtra	411018	IN
1499	2099	3999	200999	100999	Rahul	Ghulanawar	GhulanawarR	rahul.ghulanawar@thyssenkrupp.com	10488340	90954	CEMENT  ENGINEERING (Dept Code: 6003)	Plant Design (Post Order) Group (Dept Code: 6009)	+91 20 6612 4536	Pune	Maharashtra	411018	IN
1500	2100	4000	201000	101000	Suraj	Tarlekar	TarlekarS	suraj.tarlekar@thyssenkrupp.com	10482323	90733	Services  (Dept. Code: 7804 )	Services	+91 020 6612 4168	Pune	Maharashtra	411018	IN
1501	2101	4001	201001	101001	Gagandeep	Kaur	KaurG	gagandeep.kaur@thyssenKrupp.com	\N	BSA156271	Cement Management (Dept Code: 6001)	Cement Management Group (Dept Code: 6001)	+91 20 6612 4131	Pune	Maharashtra	411018	IN
1502	2102	4002	201002	101002	jayan	Jayanthi	JayanthiN	naveen.jayanthi@thyssenkrupp.com	10482287	90766	BOILER  ENGINEERING (Dept Code: 2003)	BOILER  ENGINEERING (Dept Code: 2003)	+91 20 6612 4823	\N	\N	\N	\N
1503	2103	4003	201003	101003	Mohan	Giridharan	GiridharanM	mohan.giridharan@thyssenkrupp.com	10482301	90712	DESIGN & ENGINEERING  STRUCTURAL (Dept Code: 7305)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4884	Pune	Maharashtra	411018	IN
1504	2104	4004	201004	101004	Karthikeyan	Kuppusamy	KuppusamyK	karthikeyan.kuppusamy@thyssenkrupp.com	10482334	90702	Services Dept.	Services	\N	Pune	Maharashtra	411018	IN
1505	2105	4005	201005	101005	Galla	Rao	RaoG	galla.rao@thyssenkrupp.com	10488591	98045	Hyderabad Office	Hyderabad Office	\N	Pune	Maharashtra	411018	IN
1506	2106	4006	201006	101006	Lakhan	Kuwar	KuwarL	Lakhan.Kuwar@thyssenkrupp.com	10482330	90695	After sales  services	After sales  services	+91 20 6612 4790	Pune	Maharashtra	411018	IN
1507	2107	4007	201007	101007	Ashish	Mehendale	MehendaleA	ashish.mehendale@thyssenkrupp.com	10488486	90879	CEMENT  ENGINEERING (Dept Code: 6003)	Proposal Engineering Group (Dept Code: 6003)	+91 20 6612 4590	Pune	Maharashtra	411018	IN
1508	2108	4008	201008	101008	Ankush	Khot	KhotAP	ankush.khot@thyssenkrupp.com	10488423	90959	Hyd. Workshop Management ( Dept. Code 5502)	Hyd. Workshop Management ( Dept. Code 5502)	+91 20 6612 4473	Pune	Maharashtra	411018	IN
1509	2109	4009	201009	101009	Jaganath	Shinde	ShindeJ	Jaganath.Shinde@thyssenkrupp.com	10488648	9812	\N	\N	\N	\N	\N	\N	\N
1510	2110	4010	201010	101010	Ramachandran	Menon	MenonR	ramachandran.menon@thyssenkrupp.com	10481183	90781	CEMENT  ENGINEERING (Dept Code: 6003)	Process Engineering Group (Dept Code: 6010)	+91 20 6612 4824	Pune	Maharashtra	411018	IN
1511	2111	4011	201011	101011	Vidyasagar	Girmal	GirmalV	vidyasagar.girmal@thyssenkrupp.com	10488343	90728	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	+91 20 6612 4676	Pune	Maharashtra	411018	IN
1512	2112	4012	201012	101012	Kalicharan	Mahato	MahatoK	kalicharan.mahato@thyssenkrupp.com	10482351	90693	Kolkata Office	\N	+91 033 6605 5210	\N	\N	\N	\N
1513	2113	4013	201013	101013	Sameer	Chalke	ChalkeS	Sameer.Chalke@thyssenkrupp.com	10488252	90874	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	020 6612 4716	Pune	Maharashtra	411018	IN
1514	2114	4014	201014	101014	Dhaval	Jayawant	JayawantD	Dhaval.Jayawant@thyssenkrupp.com	10488296	90878	Boiler & Power Plant ( Dept. Code 2003 )	Boiler & Power Plant ( Dept. Code 2003 )	+91 20 6612 4457	\N	\N	\N	\N
1515	2115	4015	201015	101015	Ratndeep	Ghatge	GhatgeR	\N	\N	90908	SUB CONTRACT (Dept. Code: 7742 )	SUB CONTRACT (Dept. Code: 7742 )	+91 20 6612 4861	Pune	Maharashtra	\N	IN
1516	2116	4016	201016	101016	Shrikant	Kanase	KanaseS	shrikant.kanase@thyssenkrupp.com	10482289	90752	Mechanical Assembly	Mechanical Assembly	+91 20 6612 4495	Pune	Maharashtra	411018	IN
1517	2117	4017	201017	101017	Bhaskar	Govindasamy	GovindasamyB	bhaskar.govindasamy@thyssenkrupp.com	10482336	90734	Services	Services Dept.	\N	Pune	Maharashtra	411 018	IN
1518	2118	4018	201018	101018	Sahil	Salvi	SalviS	sahil.salvi@thyssenkrupp.com	\N	PFS115	Services	Services Dept.	\N	Pune	Maharashtra	411 018	IN
1519	2119	4019	201019	101019	Dandu	Varma	VarmaD	dandu.varma@thyssenkrupp.com	10488683	98046	Hyderabad Office	Hyderabad Office	\N	Pune	Maharashtra	411018	IN
1520	2120	4020	201020	101020	EUQ_TKIIEXCH	\N	EUQ_TKIIEXCH	\N	\N	System-ID	For Exchange Server	\N	\N	\N	\N	\N	\N
1521	2121	4021	201021	101021	Raveendran	Rajeesh	RajeeshR	rajeesh.raveendran@thyssenkrupp.com	10488574	90165	Services	\N	\N	\N	\N	\N	\N
1522	2122	4022	201022	101022	tkii	Desksupport4	admin_se4	\N	\N	Orbit	T&IS - Orbit	T&IS - Orbit	+91 20 6612 4176	Pune	Maharashtra	411018	IN
1523	2123	4023	201023	101023	Mokanpally	Reddy	ReddyM	mokanpally.reddy@thyssenkrupp.com	10488607	98047	Hyderabad Office	Hyderabad Office	\N	Pune	Maharashtra	411018	IN
1524	2124	4024	201024	101024	Anish	Girme	GirmeA	anishn.girme@thyssenkrupp.com	10424586	90764	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4882	Pune	Maharashtra	411018	IN
1525	2125	4025	201025	101025	Boddu	Nancharaiah	NancharaiahB	boddu.nancharaiah@thyssenkrupp.com	10500281	60230	Hyderabad Office	Hyderabad Office	040-2794 1456	Pune	Maharashtra	411018	IN
1526	2126	4026	201026	101026	Sagar	Khanekar	KhanekarS	sagar.khanekar@thyssenkrupp.com	10488419	90944	Services	Services	+91 20 6612 4830	\N	\N	\N	IN
1527	2127	4027	201027	101027	\N	\N	SMEX Administrator	SMEXAdministrator@thyssenkruppindia.com	\N	System-ID	Users can manage installed ScanMail servers for this domain	\N	\N	\N	\N	\N	\N
1528	2128	4028	201028	101028	Venkatesh	Durairaj	DurairajV	venkatesh.durairaj@thyssenkrupp.com	10488306	90784	MHE Project Execution	MHE Project Execution	+91 20 6612 4693	\N	\N	\N	\N
1529	2129	4029	201029	101029	Prasad	Tele	TeleP	prasad.tele@thyssenkrupp.com	10488671	90769	RESEARCH & DEVELOPMENT (Dept Code: 1100)	RESEARCH & DEVELOPMENT (Dept Code: 1100)	\N	Pune	Maharashtra	411018	IN
1572	2172	4072	201072	101072	Prashant	Wasnik	WasnikP	\N	\N	11540	Services	SERVICES  BOILER DIVISION	+91 20 6612 4747	Pune	Maharashtra	411018	IN
1530	2130	4030	201030	101030	Vijaykumar	Manchare	ManchareV	vijaykumar.manchare@thyssenkrupp.com	10488470	90875	CEMENT  DESIGN & ENGINEERING (Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4843	Pune	Maharashtra	411018	IN
1531	2131	4031	201031	101031	Thatchinamoorthy	Chinnadurai	ChinnaduraiT	thatchinamoorthy.chinnadurai@thyssenkrupp.com	10482337	90735	Services	Services Dept.	\N	Pune	Maharashtra	411 018	IN
1532	2132	4032	201032	101032	Kavishwar	Pachare	PachareK	kavishwar.pachare@thyssenkrupp.com	10488523	90720	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	+91 206612 4863	Pune	Maharashtra	411018	IN
1533	2133	4033	201033	101033	Louie	Parakkal	ParakkalL	\N	\N	90825	Chennai Office	TKII Chennai Quality (Dept : 8030)	\N	\N	\N	\N	\N
1534	2134	4034	201034	101034	Rohan	Sood	SoodR	Rohan.Sood@thyssenkrupp.com	10482340	90684	Services	Services	\N	Pune	Maharashtra	\N	IN
1535	2135	4035	201035	101035	Sukanta	Bag	BagS	Sukanta.Bag@thyssenkrupp.com	10488224	90254	Services  (Dept. Code: 7804 )	Services  (Dept. Code: 7804 )	\N	\N	\N	\N	\N
1536	2136	4036	201036	101036	Venkat	Iyer	IyerVA	venkat.iyer@thyssenkrupp.com	10488364	90787	Finance	Finance	+91 20 66124004	Pune	Maharashtra	411018	IN
1537	2137	4037	201037	101037	Rameshwar	Hosnale	HosnaleR	Rameshwar.Hosnale@thyssenkrupp.com	\N	BSA70019	FINANCE  BILLING (Dept Code: 7603)	FINANCE  BILLING (Dept Code: 7603)	\N	\N	\N	\N	\N
1538	2138	4038	201038	101038	BES	Admin	besadmin	BES.Admin@tkiidc.com	\N	System-ID	For Blackberry Application T&IS	\N	\N	\N	\N	\N	\N
1539	2139	4039	201039	101039	Akash	Patodi	PatodiA	akash.patodi@thyssenkrupp.com	\N	91038	Logistics (Dept : 7653)	Logistics	+91 20 66124254	Pune	Maharashtra	411018	IN
1540	2140	4040	201040	101040	Gottapu	Naidu	NaiduG	gottapu.naidu@thyssenkrupp.com	10488505	98048	Hyderabad Office	Hyderabad Office	040-2794 1430	Pune	Maharashtra	411018	IN
1541	2141	4041	201041	101041	Sanjay	Rai	RaiS	sanjay.rai@thyssenkrupp.com	10482329	90767	Services	Services	\N	Pune	Maharashtra	411018	IN
1542	2142	4042	201042	101042	Munasir	Sayyed	SayyedM	munasir.sayyed@thyssenkrupp.com	10488633	90963	SUB CONTRACT (Dept. Code:  7742)	Subcontract Department	+91 20 6612 4308	Pune	Maharashtra	411018	IN
1543	2143	4043	201043	101043	Soham	Pawaskar	PawaskarS	soham.pawaskar@thyssenkrupp.com	10488564	90916	Services	Services	+91 20 6612 4010	Pune	maharashtra	411018	IN
1544	2144	4044	201044	101044	Jagdish	Kulkarni	KulkarniJ	jagdish.kulkarni@thyssenkrupp.com	10500165	60110	Workshop Management ( Dept. Code 5001)	Workshop Management ( Dept. Code 5001)	+91 20 6612 4391	Pune	Maharashtra	411018	IN
1545	2145	4045	201045	101045	Saravana	Kumar	Kumar-S	Saravana.Kumar@thyssenkrupp.com	10446380	90414	Services	Services	\N	\N	\N	\N	\N
1546	2146	4046	201046	101046	Sunder	Kalyani	KalyaniSP	Sunder.Kalyani@thyssenkrupp.com	\N	BSA70017	Import Export (Dept. Code:7652)	Import Export (Dept. Code:7652)	\N	\N	\N	\N	\N
1547	2147	4047	201047	101047	Dipanjan	Koley	KoleyD	Dipanjan.Koley@thyssenkrupp.com	10488427	90673	Kolkata Office	\N	+91 033 6605 5211	\N	\N	\N	\N
1548	2148	4048	201048	101048	Rahul	Nigam	NigamR	rahul.nigam@thyssenkrupp.com	10482328	90756	Services	Services Dept.	020 6612 4190	Pune	Maharashtra	411 018	IN
1549	2149	4049	201049	101049	Ashish	Singh	Singh_AK	ashish.singh@thyssenkrupp.com	10488653	90775	Services	\N	\N	\N	\N	\N	\N
1550	2150	4050	201050	101050	Kiran	Nambiar	NambiarK	kiran.nambiar@thyssenkrupp.com	10488434	90798	Project Management (Dept. code : 9704)	PM_Planning_9704	\N	Pune	Maharashtra	400018	IN
1551	2151	4051	201051	101051	Catherine	Tekade	TekadeC	catherine.tekade@thyssenKrupp.com	10482286	90765	Boiler & Power Plant	Boiler & Power Plant	+91 206612 4180	Pune	Maharashtra	411018	IN
1552	2152	4052	201052	101052	Admin$	\N	Admin$	Admin$@ThyssenKrupp.com	\N	System-ID	Spare Administrator For Domain	\N	\N	\N	\N	\N	\N
1553	2153	4053	201053	101053	Rahul	Gaikwad	GaikwadR	rahul.gaikwad@tkiidc.com	\N	PFS131	Stores  (Dept. Code:  7752)	Stores & Despatch	\N	Pune	Maharashtra	411018	IN
1554	2154	4054	201054	101054	Mohini	Kshetramade	KshetramadeM	mohini.kshetramade@thyssenkrupp.com	10488431	90789	Import - Export (Dept. Code:  7652)	Import Export	+91 20 66124239	\N	\N	\N	\N
1555	2155	4055	201055	101055	Prasad	Natekar	NatekarP	prasad.natekar@thyssenkrupp.com	10488516	90960	HFS Dept - Hall No. 10	HFS Dept	+91 20 6612 4388	Pune	Maharashtra	411018	IN
1556	2156	4056	201056	101056	Avijit	Pramanik	PramanikA	Avijit.Pramanik@thyssenkrupp.com	10482349	90667	Kolkata Office	\N	033 6605 5222	\N	\N	\N	\N
1557	2157	4057	201057	101057	Srikanth	Kumar	KumarSA	srikanth.kumar@thyssenkrupp.com	10482322	90678	Services	Services	\N	Pune	Maharashtra	\N	IN
1558	2158	4058	201058	101058	Bhairu	Wagharalkar	WagharalkarB	Bhairu.Wagharalkar@thyssenkrupp.com	10488691	90689	\N	\N	\N	\N	\N	\N	\N
1559	2159	4059	201059	101059	Manashi	Mitra	MitraMN	Manashi.Mitra@thyssenkrupp.com	10488492	90686	Kolkata Office	\N	033 6605 5220	\N	\N	\N	\N
1560	2160	4060	201060	101060	Uday	Shinde	ShindeUA	uday.shinde@thyssenkrupp.com	10482290	90744	Personnel & HRD Department	Personnel & HRD Department.	+91 20 66124822	Pune	maharashtra	411018	IN
1561	2161	4061	201061	101061	Chetan	Rajebhosale	RajebhosaleC	chetan.rajebhosale@thyssenkrupp.com	10483753	90823	DESIGN & ENGINEERING	DESIGN & ENGINEERING	+91 20 66124080	Pune	Maharashtra	411018	IN
1562	2162	4062	201062	101062	TKtrust	\N	TKtrust	\N	\N	System-ID	Test user for is.tknet.thyssenkrupp.com	\N	\N	\N	\N	\N	\N
1563	2163	4063	201063	101063	Srikanth	Jampala	JampalaS	Srikanth.Jampala@thyssenkrupp.com	10489379	91002	SMB-SALES & MARKETING 5702	Hyderabad Office	040-2794 1155	\N	\N	\N	\N
1564	2164	4064	201064	101064	Satyanarayana	Sadanala	SadanalaS	Satyanarayana.Sadanala@thyssenkrupp.com	10489387	91006	SMB-PURCHASE-5705	Hyderabad Office	020-6612 4858	\N	\N	\N	\N
1565	2165	4065	201065	101065	Prathamesh	Kamble	KamblePJ	\N	\N	90263	CEMENT  EXECUTION (Dept Code: 6004)	PM_Cement_9604	+91 20 6612 4831	Pune	Maharashtra	411018	IN
1566	2166	4066	201066	101066	Bheemana	Swami	SwamiB	\N	\N	38002	Hyderabad Office	Hyderabad Office	\N	Pune	Maharashtra	411018	IN
1567	2167	4067	201067	101067	Emmanuel	Joseph	JosephE	\N	\N	35041	TKII HYD.- QA	TKII HYD.- QA	\N	Pune	Maharashtra	411018	IN
1568	2168	4068	201068	101068	Dattatraya	Shinde	ShindeD	\N	\N	PFS123	Stores  (Dept. Code:  7752)	Stores & Despatch	\N	Pune	Maharashtra	411018	IN
1569	2169	4069	201069	101069	Saurabh	Renke	RenkeS	\N	\N	90961	CNC HALL NO.02	CNC HALL	+91 20 6612 4495	Pune	Maharashtra	411018	IN
1570	2170	4070	201070	101070	Sushant	Jagadale	JagadaleS	\N	\N	16162	Preparatory Dept.	Preparatory Dept.	+91 20 6612 4851	Pune	Maharashtra	411018	IN
1571	2171	4071	201071	101071	Rohan	Parasnis	ParasnisRR	\N	\N	90696	Boht-Out (Dept. Code: 7702 )	Boht-Out (Dept. Code: 7702 )	+91 20 6612 4018	\N	\N	\N	\N
1653	2253	4153	201153	101153	ivlcoin2	\N	ivlcoin2	\N	\N	\N	Functional ID ( For VPN SandBox )	\N	\N	\N	\N	\N	\N
1573	2173	4073	201073	101073	Pallavi	Purandare	PurandareP	\N	\N	\N	Project Management (Dept. code : 9704)	PM_Planning_9704	+91 20 6612 4795	Pune	Maharashtra	400018	IN
1574	2174	4074	201074	101074	Ramdas	Dhanavade	DhanavadeR	Ramdas.Dhanavade@thyssenkrupp.com	\N	PFS-219	Sugar Centrifugal Design (4005)	\N	+91 20 6612 4196	Pune	Maharashtra	\N	IN
1575	2175	4075	201075	101075	Shashikant	Shinde	Shinde_S	Shashikant.Shinde1@thyssenkrupp.com	\N	PFS112	QUALITY-SUBCONTRACT(Dept Code: 5404)	QUALITY- SUB CONTRACT (Dept Code: 5404)	+91 20 6612 4833	Pune	Maharashtra	411018	IN
1576	2176	4076	201076	101076	Muthukrishnan	Karuppusamy	KaruppusamyM	\N	\N	90706	Services	AFTER SALES SERVICES	\N	Pune	Maharashtra	411018	IN
1577	2177	4077	201077	101077	Vijayalaxmi	Birajdar	BirajdarV	\N	\N	11538	Structural Design	Structural Design	+91 20 6612  4828	Pune	Maharashtra	411018	IN
1578	2178	4078	201078	101078	Chaitanya	Murumkar	MurumkarC	\N	\N	15950	QUALITY- TESTING & RECEIVING (Dept Code: 5402)	QUALITY- TESTING & RECEIVING (Dept Code: 5402)	+91 20 6612 4385	\N	\N	\N	\N
1579	2179	4079	201079	101079	Shridhar	Giri	GiriS	Shridhar.Giri@thyssenkrupp.com	10488342	90876	CEMENT  DESIGN & ENGINEERING (Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4843	Pune	Maharashtra	411018	IN
1580	2180	4080	201080	101080	Supriya	Choudhari	ChoudhariS	\N	\N	11541	CIVIL  EXECUTION	CIVIL  EXECUTION	+91 20 6612 4350	Pune	Maharashtra	411018	IN
1581	2181	4081	201081	101081	Rudra	Som	SomR	\N	\N	90563	Services	SERVICES  MHE DIVISION	\N	Pune	Maharashtra	411018	IN
1582	2182	4082	201082	101082	Kamlesh	Mishra	MishraK	\N	\N	90567	MHE  EXECUTION	PM_MHE_9304	+91 20 6612 4780	Pune	maharashtra	411018	IN
1583	2183	4083	201083	101083	Dhanesh	Shivangekar	ShivangekarD	\N	\N	11497	SUB CONTRACT  (Dept. Code: 7742 )	Sub-Contract	\N	Pune	Maharashtra	411018	IN
1584	2184	4084	201084	101084	Sachin	Sable	SableS	\N	\N	15999	Quality Assurance (Site)	\N	\N	Pune	Maharashtra	411018	IN
1585	2185	4085	201085	101085	Hemant	Boid	BoidH	\N	\N	9299	CANTEEN ADMINISTRATION	CANTEEN ADMINISTRATION	\N	Pune	Maharashtra	411018	IN
1586	2186	4086	201086	101086	Parvraj	Pachore	PachoreP	\N	\N	11504	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	\N	Pune	Maharashtra	411018	IN
1587	2187	4087	201087	101087	Rajkumar	Suryawanshi	SuryawanshiR	Rajkumar.Suryawanshi@tkiidc.com	\N	PFS-208	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4781	Pune	Maharashtra	411018	IN
1588	2188	4088	201088	101088	Srikrishna	Perumal	PerumalS	\N	\N	90525	Services	Services Dept.	\N	Pune	Maharashtra	411 018	IN
1589	2189	4089	201089	101089	Shyamlal	Nayak	NayakS	\N	\N	16231	Services	SERVICES  MHE DIVISION	\N	Pune	Maharashtra	411018	IN
1590	2190	4090	201090	101090	Manikanand	Vivekandan	VivekandanM	\N	\N	16258	Services	SERVICES  BOILER DIVISION	\N	Pune	Maharashtra	411018	IN
1591	2191	4091	201091	101091	Sarish	Chandran	ChandranS	\N	\N	16123	Services	SERVICES  MHE DIVISION	\N	Pune	Maharashtra	411018	IN
1592	2192	4092	201092	101092	Sourabh	Kale	KaleSV	\N	\N	90880	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	\N	Pune	Maharashtra	411018	IN
1593	2193	4093	201093	101093	Chandrakant	Hiwarale	HiwaraleC	\N	\N	9999	BOILER  EXECUTION (Dept Code: 2004)	PM_Sugar_9404	+91 20 6612 4539	Pune	Maharashtra	411018	IN
1594	2194	4094	201094	101094	Surajit	Chowdhury	ChowdhurySR	\N	\N	15965	Kolkata Office (Dept. Code:8021)	Plant Design (Post Order) Group (Dept Code: 6009)	033 6605 5214	Kolkata	West Bengal	700156	IN
1595	2195	4095	201095	101095	Manikant	Siva	SivaM	\N	\N	35042	Hyderabad Office	Hyderabad Office	\N	Pune	Maharashtra	411018	IN
1596	2196	4096	201096	101096	Akram	Khan	KhanAA	\N	\N	35043	Hyderabad Office	Hyderabad Office	\N	Pune	Maharashtra	411018	IN
1597	2197	4097	201097	101097	Deepak	Reddy	ReddyDK	\N	\N	35044	Hyderabad Office	Hyderabad Office	\N	Pune	Maharashtra	411018	IN
1598	2198	4098	201098	101098	Middela	Ramesh	MiddelaR	\N	\N	35040	Hyderabad Office	Hyderabad Office	\N	Pune	Maharashtra	411018	IN
1599	2199	4099	201099	101099	Abhay	Krishnanunni	KrisnhnanunniA	\N	\N	90679	Boiler & Power Plant.	Boiler & Power Plant.	+91 20 6612 4604	pune	Maharashtra	411018	IN
1600	2200	4100	201100	101100	Kalvakuntla	Santhosh	SanthoshK	\N	\N	35022	Hyderabad Office	Hyderabad Office	\N	Pune	Maharashtra	411018	IN
1601	2201	4101	201101	101101	Upendra	Rout	RoutU	\N	\N	15972	Services	SERVICES  BOILER DIVISION	\N	Pune	Maharashtra	411018	IN
1602	2202	4102	201102	101102	Samadhan	Borse	BorseS	\N	\N	16114	Services	SERVICES  MHE DIVISION	\N	Pune	Maharashtra	411018	IN
1603	2203	4103	201103	101103	Cluster	\N	Cluster	\N	\N	System-ID	Cluster Services Running	\N	\N	\N	\N	\N	\N
1604	2204	4104	201104	101104	Gautam	Dutta	DuttaG	\N	\N	PFS275	CEMENT  ENGINEERING (Dept Code: 6003)	Process Engineering Group (Dept Code: 6010)	+91 20 6612 4104	Pune	Maharashtra	411018	IN
1605	2205	4105	201105	101105	Ajay	Babhre	BabhreA	Ajay.Babhre@thyssenkrupp.com	10489384	91009	EXECUTION-5704	SMB	+91 20 6612 4068	\N	\N	\N	\N
1606	2206	4106	201106	101106	Shib	Banerjee	BanerjeeS	\N	\N	90101	BOILER  EXECUTION (Dept Code: 2004)	PM_Sugar_9404	+91 20 6612 4589	Pune	Maharashtra	411018	IN
1607	2207	4107	201107	101107	\N	\N	sapadm	\N	\N	\N	SAP System Administrator	\N	\N	\N	\N	\N	\N
1608	2208	4108	201108	101108	Suresh	Agasti	AgastiS	\N	\N	\N	MD's Office	MD Office	+91 20 6612 4844	Pune	Maharashtra	411018	IN
1609	2209	4109	201109	101109	Judhisthir	Behera	BeheraJ	Judhisthir.Behera@thyssenkrupp.com	10506657	91003	Kolkata Office	Kolkata Office	\N	Pune	Maharashtra	411018	IN
1610	2210	4110	201110	101110	VPN_FA04	\N	VPN_FA04	\N	\N	\N	For accessing the Files through VPN - 4	\N	\N	\N	\N	\N	\N
1611	2211	4111	201111	101111	Ravi	Dang	DangR	\N	\N	90862	Delhi Office	Delhi Office Selling ( Dep Code: 8010)	011-26449971	New Delhi	\N	\N	IN
1612	2212	4112	201112	101112	Prashant	Junghare	JunghareP	Prashant.Junghare@thyssenkrupp.com	10488380	90834	MHE Project Execution	PM_MHE_9304	+91 20 6612 4835	\N	\N	\N	\N
1613	2213	4113	201113	101113	Janardhana	Ramalingam	RamalingamJ	Janardhana.Ramalingam@thyssenkrupp.com	10488577	90909	CEMENT  ENGINEERING (Dept Code: 6003)	Process Engineering Group (Dept Code: 6010)	020 6612 4540	Pune	Maharashtra	411018	IN
1614	2214	4114	201114	101114	Sandeep	Shinde	ShindeSV	sandeepv.shinde@thyssenkrupp.com	10446406	9792	Workshop	CNC MACHINE SHOP	020 6612 4495	Pune	Maharashtra	411018	IN
1615	2215	4115	201115	101115	Harshal	Phadtare	PhadtareH	Harshal.Phadtare@thyssenkrupp.com	\N	PFS145	Indirect Taxation ? Sales Tax Dept code 7606	Indirect Taxation ? Sales Tax Dept code 7606	\N	\N	\N	\N	\N
1616	2216	4116	201116	101116	Somnath	Kakare	KakareS	somnath.kakare@thyssenkrupp.com	\N	PFS55	Quality Assurance	Quality Assurance	+91 20 6612 4833	Pune	Maharashtra	411018	IN
1617	2217	4117	201117	101117	Vanakkili	Ganeshan	GaneshanV	vanakkili.ganeshan@thyssenkrupp.com	10488318	90812	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	+91 20 6612 4214	Pune	Mahrashtra	411018	IN
1618	2218	4118	201118	101118	Debajyoti	Chatterjee	ChatterjeeD	debajyoti.chatterjee@thyssenkrupp.com	10488257	90905	CEMENT  ENGINEERING (Dept Code: 6003)	Proposal Engineering Group (Dept Code: 6003)	91 20 6612 4660	Pune	Maharashtra	411018	IN
1619	2219	4119	201119	101119	Snigdha	Biswas	BiswasSN	Snigdha.Biswas@thyssenkrupp.com	10488249	90839	Kolkata Office (Dept. Code:8021)	Kolkata Office (Dept. Code:8021)	033 6605 5220	Kolkata	West Bengal	700156	IN
1620	2220	4120	201120	101120	Pravin	Mane	ManeP	pravin.mane@thyssenkrupp.com	10488479	90911	CEMENT  ENGINEERING (Dept Code: 6003)	Plant Design (Post Order) Group (Dept Code: 6009)	+91 20 6612 4887	Pune	Maharashtra	411018	IN
1621	2221	4121	201121	101121	Shailesh	Shinde	ShindeSD	Shailesh.Shinde@tkiidc.com	\N	PFS142	FINANCE  BILL PASSING (Dept Code: 7604)	Finance - Bill Passing	\N	Pune	Maharashtra	411018	IN
1622	2222	4122	201122	101122	Tejas	Chopde	ChopdeT	tejas.chopde@thyssenkrupp.com	10488269	90829	CEMENT  SELLING (Dept Code: 6002)	Cement Selling Group (Dept Code: 6002)	+91 20 6612 4553	Pune	Maharashtra	411018	IN
1623	2223	4123	201123	101123	Santhan	Loganathan	LoganathanS	santhan.loganathan@thyssenkrupp.com	10484670	90786	Services  (Dept. Code: 7804 )	Services	\N	Pune	Maharashtra	411018	IN
1624	2224	4124	201124	101124	Ravikumar	Prajapati	PrajapatiR	Ravikumar.Prajapati@thyssenkrupp.com	10488567	90835	Services	SERVICES	\N	Pune	Maharashtra	411018	IN
1625	2225	4125	201125	101125	Asmita	Shedge	ShedgeA	asmita.shedge@thyssenkrupp.com	\N	PFS139	FINANCE  TAXATION (Dept Code: 7606)	FINANCE  TAXATION (Dept Code: 7606)	+91 20 6612 4776	Pune	Maharashtra	411018	IN
1626	2226	4126	201126	101126	IT	KOL	ITKOL	IT.KOL@tkiidc.com	\N	Orbit	Kolkata Office	IT - Kolkata Office	\N	Pune	Maharashtra	411018	IN
1627	2227	4127	201127	101127	Chittaranjan	Sawant	SawantC	Chittaranjan.Sawant@thyssenkrupp.com	10488632	90736	Preparatory Dept. - Hall No 12	Preparatory Dept.	+91 20 6612 4379	Pune	Maharashtra	411018	IN
1628	2228	4128	201128	101128	Ambar	Todkar	TodkarA	ambar.todkar@thyssenkrupp.com	10488674	90955	CEMENT  ENGINEERING (Dept Code: 6003)	Plant Design (Post Order) Group (Dept Code: 6009)	+91 20 6612 4888	Pune	Maharashtra	411018	IN
1629	2229	4129	201129	101129	Jayvant	Gaikwad	GaikwadJ	jayvant.gaikwad@thyssenkrupp.com	10488316	90822	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	+91 20 6612 4704	Pune	Maharashtra	411018	IN
1630	2230	4130	201130	101130	Shreenivas	Chennur	ChennurS	Shreenivas.Chennur@thyssenkrupp.com	10500205	60082	Services	SERVICES	+91 20 6612 4096	Pune	Maharashtra	411018	IN
1631	2231	4131	201131	101131	Arijit	Modak	ModakA	arijit.modak@thyssenkrupp.com	10488493	90802	DESIGN & ENGINEERING  STRUCTURAL (Dept Code: 7305)	DESIGN & ENGINEERING  STRUCTURAL (Dept Code: 7305)	+91 20 6612 4829	Pune	Maharashtra	411018	IN
1632	2232	4132	201132	101132	Vaibhav	Patil	PatilVP	VaibhavP.Patil@thyssenkrupp.com	\N	PFS144	FINANCE  BILLING (Dept Code: 7603)	FINANCE  BILLING (Dept Code: 7603)	\N	Pune	Maharashtra	\N	IN
1633	2233	4133	201133	101133	Mohit	Benadikar	BenadikarM	mohit.benadikar@thyssenkrupp.com	10488235	91022	Mechanical Assembly	Mechanical Assembly	+91 20 6612 4747	Pune	Maharashtra	411018	IN
1634	2234	4134	201134	101134	Amarendra	Das	DasAK	amarendra.das@thyssenkrupp.com	10488281	90707	Kolkata Office	Kolkata Office	033 6605 5227	Pune	Maharashtra	411018	IN
1635	2235	4135	201135	101135	Adham	Beik	BeikA	Adham.Beik@thyssenkrupp.com	10500983	90848	Services ? After Sales  (Dept. Code: 7807)	Services ? After Sales  (Dept. Code: 7807)	\N	Pune	Maharashtra	411018	IN
1636	2236	4136	201136	101136	Jijaram	Gaikwad	GaikwadJS	Jijaram.Gaikwad@tkiidc.com	\N	PFS111	SUB CONTRACT  (Dept. Code: 7742 )	Subcontract Department	+91 20 66124670	Pune	Maharashtra	411018	IN
1637	2237	4137	201137	101137	Pramod	Barge	BargeP	pramod.barge@thyssenkrupp.com	10488227	90811	WORKSHOP SUPERVISORS (Dept Code: 5061)	WORKSHOP SUPERVISORS (Dept Code: 5061)	+91 20 6612 4850	Pune	Maharashtra	411018	IN
1638	2238	4138	201138	101138	Sanjaykumar	Behera	BeheraS	Sanjaykumar.Behera@thyssenkrupp.com	10488232	90805	Services	Services - Cement Division	\N	Pune	Maharastra	411018	IN
1639	2239	4139	201139	101139	Pravin	Patil	PatilPN	Pravin.Patil2@thyssenkrupp.com	10488545	90838	Boiler & Power Plant	Boiler & Power Plant	+91 20 6612 4730	Pune	Maharashtra	411018	IN
1640	2240	4140	201140	101140	Ashishkumar	Nayak	NayakA	Ashishkumar.Nayak@thyssenkrupp.com	10488517	90806	Services	Services Dept.	\N	Pune	Maharashtra	411 018	IN
1641	2241	4141	201141	101141	Navnath	Khodave	KhodaveN	Navnath.Khodave@tkiidc.com	10561602	1792518	FINANCE  BILL PASSING (Dept Code: 7604)	Finance - Bill Passing	\N	Pune	Maharashtra	411018	IN
1642	2242	4142	201142	101142	Sheba	George	GeorgeSS	Sheba.George@thyssenkrupp.com	10491225	90844	CIVIL EXECUTION (Dept Code: 7202)	CIVIL EXECUTION (Dept Code: 7202)	+91 20 6612 4571	Pune	Maharashtra	411018	IN
1643	2243	4143	201143	101143	Yogesh	Deoghare	DeoghareY	Yogesh.Deoghare@tkiidc.com	\N	PFS137	Stores  (Dept. Code:  7752)	Stores & Despatch	\N	Pune	Maharashtra	411018	IN
1644	2244	4144	201144	101144	Rahul	Shahapurkar	ShahapurkarR	Rahul.Shahapurkar@tkiidc.com	\N	PFS138	Stores  (Dept. Code:  7752)	Stores & Despatch	\N	Pune	Maharashtra	411018	IN
1645	2245	4145	201145	101145	Keshav	Nagpurkar	NagpurkarK	Keshav.Nagpurkar@thyssenkrupp.com	\N	PFS126	SUB CONTRACT (Dept. Code: 7742 )	Store Department	+91 20 6612 4861	Pune	Maharashtra	411018	IN
1646	2246	4146	201146	101146	Chandan	Mishra	MishraC	chandan.mishra@thyssenkrupp.com	10488490	90831	MHE Project Execution	PM_MHE_9304	+91 20 66124435	\N	\N	\N	\N
1647	2247	4147	201147	101147	Srimanta	Samanta	SamantaS	Srimanta.Samanta@thyssenkrupp.com	10488617	90827	Kolkata Office (Dept. Code:8021)	Kolkata Office (Dept. Code:8021)	033 6605 5224	Kolkata	West Bengal	700156	IN
1648	2248	4148	201148	101148	Vishnu	Kandukuri	KandukuriV	Kandukuri.Vishnu@thyssenkrupp.com	10489385	91001	SMB-D&E [5703]	Hyderabad Office	020 6612 4497	\N	\N	\N	\N
1649	2249	4149	201149	101149	Baswanth	Jyothi	JyothiB	Baswanth.Jyothi@thyssenkrupp.com	10489383	91008	EXECUTION-5704	Hyderabad Office	+91 20 66124306	\N	\N	\N	\N
1650	2250	4150	201150	101150	Vignesh	Athimoolam	AthimoolamV	\N	\N	CTS062	PDMS Engineers ( On contract of Chandan Tech Solution Pvt.Ltd)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	\N	Pune	Maharashtra	411018	IN
1651	2251	4151	201151	101151	Paresh	Shelke	ShelkeP	\N	\N	\N	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4035	Pune	Maharashtra	411018	IN
1652	2252	4152	201152	101152	\N	\N	qinadm	\N	\N	\N	SAP System Administrator	\N	\N	\N	\N	\N	\N
1655	2255	4155	201155	101155	Abhay	Patil	PatilAR	Abhay.Patil@thyssenkrupp.com	10528493	90900	Design & Engineering Structural	Boiler and Power Plant Division	+91 20 6612 4187	Pune	Maharashtra	411018	IN
1656	2256	4156	201156	101156	Indranil	Roy	RoyI	Indranil.Roy@thyssenkrupp.com	10528488	90899	Director, MHE Division	MHE Division	91-20-6612 4205	Pune	Maharashtra	411018	IN
1657	2257	4157	201157	101157	Akshay	Nanekar	NanekarA	akshay.nanekar@tkiidc.com	10445572	PFS153	PPC Dept	PPC Dept	\N	Pune	Maharashtra	411018	IN
1658	2258	4158	201158	101158	Ashish	Tale	TaleA	Ashish.Tale@thyssenkrupp.com	10525544	91023	DE-S (Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4491	Pune	Maharashtra	411018	IN
1659	2259	4159	201159	101159	CemGuest	PDMS01	CemGuestPDMS01	\N	\N	\N	Function ID ( Cement Dept.6003 )	Cement Dept.6003	\N	Pune	Maharashtra	411018	IN
1660	2260	4160	201160	101160	Balkrushana	More	MoreB	Balkrushana.More@thyssenkrupp.com	10445602	9887	CEMENT  ENGINEERING (Dept Code: 6003)	Plant Design (Post Order) Group (Dept Code: 6009)	+91 20 6612 4536	Pune	Maharashtra	411018	IN
1661	2261	4161	201161	101161	Sachin	Kumbhar	KumbharSG	SachinG.Kumbhar@thyssenkrupp.com	10446370	90166	Services  (Dept. Code: 7802)	Services  (Dept. Code: 7802)	\N	Pune	Maharashtra	411018	IN
1662	2262	4162	201162	101162	Rahul	Bartakke	BartakkeR	rahul.bartakke@tkiidc.com	\N	PFS147	Stores  (Dept. Code:  7752)	Stores & Despatch	\N	Pune	Maharashtra	411018	IN
1663	2263	4163	201163	101163	Ananth	V.R	VR.A	Ananth.V.R@thyssenkrupp.com	10488218	90836	Services Dept. ( MHE 7804 )	Services Dept. ( MHE 7804 )	\N	Pune	Maharashtra	411018	IN
1664	2264	4164	201164	101164	Harshal	Tilekar	TilekarH	Harshal.Tilekar@thyssenkrupp.com	10517509	90869	Cement .(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4767	Pune	Maharashtra	411018	IN
1665	2265	4165	201165	101165	Namrata	Bathija	BathijaN	Namrata.Bathija@thyssenkrupp.com	10529208	90974	FINANCE BANKING AND INSURANCE (Dept Code: 7605)	FINANCE BANKING AND INSURANCE (Dept Code: 7605)	+91 20 6612 4249	Pune	Maharashtra	411018	IN
1666	2266	4166	201166	101166	Sandip	Mokashi	MokashiS	Sandip.Mokashi@thyssenkrupp.com	10518887	90871	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91-20-6612 4491	Pune	Maharashtra	411018	IN
1667	2267	4167	201167	101167	Abhay	Gulavani	GulavaniA	abhay.gulavani@thyssenkrupp.com	\N	PFS151	FINANCE  BILLING (Dept Code: 7603)	Finance - Bill Passing	\N	Pune	Maharashtra	411018	IN
1668	2268	4168	201168	101168	Amitesh	Verma	VermaA	Amitesh.Verma@thyssenkrupp.com	10516013	90867	Services - After Sales (Dept Code 7807)	Services - After Sales (Dept Code 7807)	\N	Pune	Maharashtra	411018	IN
1669	2269	4169	201169	101169	Pravin	Kumbhar	KumbharPV	pravinV.kumbhar@thyssenkrupp.com	10519011	91036	Purchase 7712	Purchsse-Material	+91 20 6612 4272	Pune	Maharashtra	411018	IN
1670	2270	4170	201170	101170	Umed	Dangi	DangiU	Umed.Dangi@thyssenkrupp.com	10514743	60116	Services (Dept Code 7807)	Services (Dept Code 7807)	\N	Pune	Maharashtra	411018	IN
1671	2271	4171	201171	101171	Nahush	Kelkar	KelkarN	Nahush.Kelkar@thyssenkrupp.com	10507472	90952	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4491	Pune	Maharashtra	411018	IN
1672	2272	4172	201172	101172	Prashant	Soddagi	SoddagiP	Prashant.Soddagi@thyssenkrupp.com	10525538	90897	FGD Equipment Design (Dept. 7335)	FGD Equipment Design (Dept. 7335)	+91 20 6612 4441	Pune	Maharashtra	411018	IN
1673	2273	4173	201173	101173	Vijay	Khairkhar	KhairkharV	Vijay.Khairkhar@thyssenkrupp.com	10522042	90892	ENGG./ Instrumentation (Dept Code: 7402)	ENGG./ Instrumentation (Dept Code: 7402)	+91 20 6612 4215	Pune	Maharashtra	411018	IN
1674	2274	4174	201174	101174	Laxman	Nevge	NevgeL	Laxman.Nevge@thyssenkrupp.com	10540147	91020	MFS (Dept Code: 5061)	MFS (Dept Code: 5061)	+91 20 6612 4379	Pune	Maharashtra	411018	IN
1675	2275	4175	201175	101175	Pooja	Dhawle	DhawleP	Pooja.Dhawle@tkiidc.com	\N	PFS171	Design & Engineering (Dept Code 7301)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4038	Pune	Maharashtra	411018	IN
1676	2276	4176	201176	101176	Anand	Malpedi	MalpediA	anand.malpedi@tkiidc.com	\N	PFS148	Stores  (Dept. Code:  7752)	Stores & Despatch	\N	Pune	Maharashtra	411018	IN
1677	2277	4177	201177	101177	Sneha	Tamgave	TamgaveS	Sneha.Tamgave@thyssenkrupp.com	10525549	91024	DE-S (Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4881	Pune	Maharashtra	411018	IN
1678	2278	4178	201178	101178	Priyanka	Kaldhone	KaldhoneP	Priyanka.Kaldhone@thyssenkrupp.com	10506560	90945	Services Dept.	Services Dept.	+ 91 20 6612 4791	Pune	Maharashtra	411018	IN
1679	2279	4179	201179	101179	Devendra	Pawar	PawarD	Devendra.Pawar@thyssenkrupp.com	\N	PFS160	FINANCE  BILLING (Dept Code: 7603)	FINANCE  BILLING (Dept Code: 7603)	\N	Pune	Maharashtra	\N	IN
1680	2280	4180	201180	101180	Sandeep	Singh	SinghKS	Sandeep.Singh@thyssenkrupp.com	10488438	90837	Services  (Dept. Code: 7807)	Services	\N	pune	Maharashtra	411018	IN
1681	2281	4181	201181	101181	CemGuest	PDMS02	CemGuestPDMS02	\N	\N	\N	Function ID ( Cement Dept.6003 )	Cement Dept.6003	\N	Pune	Maharashtra	411018	IN
1682	2282	4182	201182	101182	Shivani	Nikam	Nikam_S	Shivani.Nikam@thyssenkrupp.com	10508830	90962	PERSONNEL  PRODUCTION (Dept Code: 5201)	PERSONNEL  PRODUCTION (Dept Code: 5201)	020 6612 4799	Pune	Maharashtra	411018	IN
1683	2283	4183	201183	101183	Ashish	Ranjane	RanjaneA	Ashish.Ranjane@thyssenkrupp.com	\N	PFS 156	FINANCE  BILLING (Dept Code: 7603)	Finance - Bill Passing	\N	Pune	Maharashtra	411018	IN
1684	2284	4184	201184	101184	Nilesh	Bhor	BhorN	Nilesh.Bhor@thyssenkrupp.com	10507485	90966	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4879	Pune	Maharashtra	411018	IN
1685	2285	4185	201185	101185	Swapnil	Jagadale	JagadaleSM	Swapnil.Jagadale@thyssenkrupp.com	10507484	90965	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4849	Pune	Maharashtra	411018	IN
1686	2286	4186	201186	101186	Prasad	Vadrevu	VadrevuP	Prasad.Vadrevu@thyssenkrupp.com	10488680	90714	Services dept ( Dept. Code 7804 )	Services dept ( Dept. Code 7804 )	\N	Pune	Maharashtra	411018	IN
1687	2287	4187	201187	101187	Mangesh	Jadhav	JadhavMG	mangesh.jadhav@thyssenkrupp.com	10519008	91034	ENGG./EXECUTION ELECTRICAL (Dept Code: 7404)	ENGG./EXECUTION ELECTRICAL (Dept Code: 7404)	+91 02 66124216	Pune	Maharashtra	411018	IN
1688	2288	4188	201188	101188	Arun	Munigonda	MunigondaA	arun.munigonda@thyssenkrupp.com	10513077	35067	PPC Dept.Code 5502	Hyderabad Office ( PPC Dept.Code 5502 )	\N	Pune	Maharashtra	411018	IN
1689	2289	4189	201189	101189	Fakruddin	Fayaz	FayazF	Fakruddin.Fayaz@thyssenkrupp.com	10445662	98065	CNC Machine Shop	CNC MACHINE Shop	040-2794 1427	Pune	Maharashtra	411018	IN
1690	2290	4190	201190	101190	Pooja	Demanna	DemannaP	Pooja.Demanna@thyssenkrupp.com	10507479	90964	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4879	Pune	Maharashtra	411018	IN
1691	2291	4191	201191	101191	Eshwar	Solanki	SolankiE	Eshwar.Solanki@thyssenkrupp.com	10522871	98073	Hyderabad Office	Hyderabad Office Fabrication (Dept Code 5524)	040-2794 1458	Pune	Maharashtra	411018	IN
1692	2292	4192	201192	101192	Pranav	Tanpure	TanpureP	pranav.tanpure@thyssenkrupp.com	10518958	90958	ENGG./EXECUTION ELECTRICAL (Dept Code: 7404)	ENGG./EXECUTION ELECTRICAL (Dept Code: 7404)	+91 02 66124719	Pune	Maharashtra	411018	IN
1693	2293	4193	201193	101193	Santosh	Shirote	ShiroteS	Santosh.Shirote@thyssenkrupp.com	10515439	90866	ENGINEERING  STRUCTURAL (Dept Code: 7305)	DESIGN & ENGINEERING  STRUCTURAL	+91 20 6612 4779	Pune	Maharashtra	411018	IN
1694	2294	4194	201194	101194	Himanshu	Lipare	LipareH	Himanshu.Lipare@thyssenkrupp.com	10507486	90967	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4849	Pune	Maharashtra	411018	IN
1695	2295	4195	201195	101195	Vivek	Tampi	TampiV	Vivek.Tampi@thyssenkrupp.com	10508835	90856	Import Export ( Dept. Code 7652 )	Import Export ( Dept. Code 7652 )	-66124052	Pune	Maharashtra	411018	IN
1696	2296	4196	201196	101196	Arun	R	RArun	Arun.R@thyssenkrupp.com	10510842	90860	Construction Services ( Dept. Code 7804 )	Construction Services	\N	Pune	Maharashtra	411018	IN
1697	2297	4197	201197	101197	Sneha	Mane	Mane_S	Sneha.Mane@thyssenkrupp.com	\N	PFS155	Administration Department	Administration Department	+91 20 6612 4539	Pune	Maharashtra	411018	IN
1698	2298	4198	201198	101198	Sumit	Kalel	KalelS	Sumit.Kalel@thyssenkrupp.com	10540059	91019	HFS HALL NO 10 (Dept Code: 5004)	HFS HALL NO 10 (Dept Code: 5004)	+91 20 6612 4749	Pune	Maharashtra	411018	IN
1699	2299	4199	201199	101199	Vaithiyanathan	Subramanian	SubramanianV	Vaithiyanathan.Subramanian@thyssenkrupp.com	10488681	90816	Cement Division  (Dept. Code: 6010 )	Cement Division  (Dept. Code: 6010 )	+91 20 6612 4540	Pune	Maharashtra	411018	IN
1700	2300	4200	201200	101200	Shajahan	Sheik	SheikS	Shajahan.Sheik@thyssenkrupp.com	10488641	90790	Sercives  (Dept. Code: 7804 )	Services	\N	Pune	Maharashtra	411018	IN
1701	2301	4201	201201	101201	Preet	Saroa	SaroaP	Preet.Saroa@thyssenkrupp.com	10510359	90859	MD & CEO's Office ( Dept Code: 1002 )	MD & CEO's Office	+91 020 6612 4290	Pune	Maharashtra	411018	IN
1702	2302	4202	201202	101202	Zohurul	Sarkar	SarkarZ	Zohurul.Sarkar@thyssenkrupp.com	10488622	90662	Services	SERVICES  BOILER DIVISION	\N	Pune	Maharashtra	411018	IN
1703	2303	4203	201203	101203	Mrunalini	Raskar	RaskarM	Mrunalini.Raskar@thyssenkrupp.com	10521440	90890	DESIGN & ENGINEERING (Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4866	Pune	Maharashtra	411018	IN
1704	2304	4204	201204	101204	Omkar	Shejwal	ShejwalO	Omkar.Shejwal@thyssenkrupp.com	10525543	91025	DE-S (Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4768	Pune	Maharashtra	411018	IN
1705	2305	4205	201205	101205	Ayush	Jailkhani	JailkhaniA	Ayush.Jailkhani@thyssenkrupp.com	10508831	90950	CEMENT  SELLING (Dept Code: 6002)	Cement Selling Group (Dept Code: 6002)	+91 20 6612 4895	Pune	Maharashtra	411018	IN
1706	2306	4206	201206	101206	Aman	Goyal	GoyalA	Aman.Goyal@thyssenkrupp.com	10521477	90891	Import Export (Dept. Code:7652)	Import Export (Dept. Code:7652)	+91 206612 4113	Pune	Maharashtra	411018	IN
1707	2307	4207	201207	101207	Prachi	Patade	PatadeP	prachi.patade@thyssenkrupp.com	\N	PFS130	ADMINISTRATION (Dept Code: 7009)	ADMINISTRATION (Dept Code: 7009)	\N	Pune	Maharashtra	411018	IN
1708	2308	4208	201208	101208	Aniruddh	Sankpal	SankpalAS	Aniruddh.Sankpal@thyssenkrupp.com	10525199	90896	Construction Services  (Dept. Code: 7804 )	Construction Services	020 6612 4062	Pune	Maharashtra	411018	IN
1709	2309	4209	201209	101209	Swapnil	Shah	ShahS	swapnil.shah@thyssenkrupp.com	10513793	90864	Finance Dept. Controlling & risk Management	Finance Dept. Controlling & risk Management	+91 20 6612 4815	Pune	Maharashtra	411018	IN
1710	2310	4210	201210	101210	Nilam	Sutar	SutarN	Nilam.Sutar@tkiidc.com	10517285	40640	Boiler Design & Engineering (Dept Code: 2005)	Boiler Design & Engineering (Dept Code: 2005)	020 6612 4595	Pune	Maharashtra	411018	IN
1711	2311	4211	201211	101211	Amit	Karante	KaranteA	Amit.Karante@thyssenkrupp.com	10522165	91028	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4463	Pune	Maharashtra	411018	IN
1712	2312	4212	201212	101212	Rahul	Patil	PatilR	Rahulb.Patil@thyssenkrupp.com	10445590	9668	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4745	Pune	Maharashtra	411018	IN
1713	2313	4213	201213	101213	Chaitanya	Gramopadhye	GramopadhyeC	Chaitanya.Gramopadhye@thyssenkrupp.com	10525057	90895	DESIGN & ENGINEERING  MANAGEMENT (Dept Code: 7301)	DESIGN & ENGINEERING  MANAGEMENT (Dept Code: 7301)	+91 20 6612 4871	Pune	Maharashtra	411018	IN
1714	2314	4214	201214	101214	Adarsh	Kumar	KumarAG	Adarsh.Kumar@tkiidc.com	10525105	60133	Services - After Sales (Dept Code 7807)	Services - After Sales (Dept Code 7807)	\N	Pune	Maharashtra	411018	IN
1715	2315	4215	201215	101215	Vikas	Retwade	RetwadeV	Vikas.Retwade@thyssenkrupp.com	10512657	90861	FINANCE (Dept Code: 7606)	FINANCE (Dept Code: 7606)	020 6612 4712	Pune	Maharashtra	411018	IN
1716	2316	4216	201216	101216	Mahendra	Bechawade	BechawadeM	Mahendra.Bechawade@thyssenkrupp.com	10425763	60139	D & E_Management (Dept Code: 7301)	D & E_Management (Dept Code: 7301)	+91 20 6612 4872	Pune	Maharashtra	411018	IN
1717	2317	4217	201217	101217	Santosh	Asangi	AsangiS	Santosh.Asangi@thyssenkrupp.com	10503024	90850	Boiler & Power Plant	Boiler & Power Plant	+91 20 6612 4794	Pune	Maharashtra	411018	IN
1718	2318	4218	201218	101218	Rohit	Pukale	PukaleR	Rohit.Pukale@thyssenkrupp.com	10508832	90956	Cement Pr Engg ( Dept. Code. 6003 PE )	Plant Design (Post Order) Group (Dept Code: 6009)	+91 20 6612 4893	Pune	Maharashtra	411018	IN
1719	2319	4219	201219	101219	Sadakatali	Mulla	MullaS	Sadakatali.Mulla@thyssenkrupp.com	10525497	60135	DE-S (Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4849	Pune	Maharashtra	411018	IN
1720	2320	4220	201220	101220	Nimal	Babu	BabuN	Nimal.Babu@thyssenkrupp.com	10506658	91005	Hyderabad Office	Hyderabad Office	040-2794 1156	Pune	Maharashtra	411018	IN
1721	2321	4221	201221	101221	Siddhant	Mohite	MohiteSR	Siddhant.Mohite@thyssenkrupp.com	10523045	91037	Sercives  (Dept. Code: 7804 )	Sercives  (Dept. Code: 7804 )	+91 20 6612 4075	Pune	Maharashtra	411018	IN
1722	2322	4222	201222	101222	Mayank	Tiwari	TiwariM1	Mayank.Tiwari@thyssenkrupp.com	10520088	90889	Services  (Dept. Code:  7807)	Services  (Dept. Code:  7807)	\N	Pune	Maharashtra	411018	IN
2497	3097	4997	201997	101997	Vijay	Sharma	SharmaVK	\N	\N	60294	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
1723	2323	4223	201223	101223	Vikas	Kulkarni	KulkarniV	Vikas.Kulkarni@thyssenkrupp.com	10543149	90903	MHE ? DIVISION - MINERAL PROCESSING Dept 3008	MHE ? DIVISION - MINERAL PROCESSING Dept 3008	+91 20 6612 4033	Pune	Maharashtra	411018	IN
1724	2324	4224	201224	101224	Avijit	Paul	Paul_A	Avijit.Paul@thyssenkrupp.com	10551740	90918	Kolkata Office (Dept Code: 8021)	Kolkata Office (Dept. Code:8021)	\N	Kolkata	West Bengal	700156	IN
1725	2325	4225	201225	101225	Rohan	Joshi	JoshiRP	Rohan.Joshi@thyssenkrupp.com	10619264	60148	DE-S (Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4865	Pune	Maharashtra	411018	IN
1726	2326	4226	201226	101226	Sunil	Mali	MaliS	Sunil.Mali@thyssenkrupp.com	10488467	90818	M/C Shop Hall No. 08	M/C Shop Hall No. 08	\N	Pune	Maharashtra	411018	IN
1727	2327	4227	201227	101227	Prathmesh	Gandhi	GandhiP	Prathmesh.Gandhi@thyssenkrupp.com	10548986	91007	Purchase - Materials ( Dept. Code 7712)	Purchase - Materials ( Dept. Code 7712)	020 6612 4569	Pune	Maharashtra	411018	IN
1728	2328	4228	201228	101228	Omkar	Kolge	KolgeO	Omkar.Kolge@thyssenkrupp.com	10561965	91027	CEMENT  DESIGN & ENGINEERING (Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4872	Pune	Maharashtra	411018	IN
1729	2329	4229	201229	101229	Marisamy	Solaiyappan	SolaiyappanM	\N	\N	60077	Const Services  (Dept. Code: 7807)	Const Services  (Dept. Code: 7807)	\N	Pune	Maharashtra	411018	IN
1730	2330	4230	201230	101230	Shyam	Pandey	PandeyS	Shyam.Pandey@thyssenkrupp.com	10542178	90901	Services  (Dept. Code:  7807)	Services  (Dept. Code:  7804)	\N	Pune	Maharashtra	411018	IN
1731	2331	4231	201231	101231	Akshay	Todkar	TodkarAT	Akshay.Todkar@thyssenkrupp.com	10561964	91050	Cement Drawing (Dept Code: 6003)	Plant Design (Post Order) Group (Dept Code: 6009)	+91 20 6612 4894	Pune	Maharashtra	411018	IN
1732	2332	4232	201232	101232	Nandkishor	Dahule	DahuleN	Nandkishor.Dahule@thyssenkrupp.com	10517502	90870	Sercives  (Dept. Code: 7807 )	Sercives  (Dept. Code: 7807	\N	Pune	Maharashtra	411018	IN
1733	2333	4233	201233	101233	Akshay	Jadhav	JadhavA	Akshay.Jadhav@thyssenkrupp.com	10553249	11616	DE-S (Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4865	Pune	Maharashtra	411018	IN
1734	2334	4234	201234	101234	Indrajit	Patil	PatilI	Indrajit.Patil@thyssenkrupp.com	10561974	91031	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	+91 20 6612 4452	Pune	Maharashtra	411018	IN
1735	2335	4235	201235	101235	Adarsh	Chandgude	ChandgudeA	Adarsh.Chandgude@thyssenkrupp.com	10561978	91017	MINERAL PROCESSING MARKETING (Dept Code: 3008)	MINERAL PROCESSING MARKETING (Dept Code: 3008)	\N	Pune	Maharastra	\N	IN
1736	2336	4236	201236	101236	Shounak	Bhise	BhiseS	Shounak.Bhise@thyssenkrupp.com	10561986	90921	Detail engineering (Dept Code: 2005)	Detail engineering (Dept Code: 2005)	+91 20 6612 4854	Pune	Maharashtra	411018	IN
1737	2337	4237	201237	101237	Shobha	Devadiga	DevadigaS	Shobha.Devadiga@thyssenkrupp.com	\N	PFS180	Services - (Dept Code 7807)	Services - (Dept Code 7807)	\N	Pune	Maharashtra	411018	IN
1738	2338	4238	201238	101238	Aditya	Kore	KoreA	\N	\N	60149	DE-S (Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4881	Pune	Maharashtra	411018	IN
1739	2339	4239	201239	101239	Mangal	Pokharkar	PokharkarM	Mangal.Pokharkar@thyssenkrupp.com	10619263	60147	DE-S (Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4746	Pune	Maharashtra	411018	IN
1740	2340	4240	201240	101240	Sanjay	Ghone	GhoneS	Sanjay.Ghone@tkiidc.com	10488334	1968	MFS Dept. - Hall No. 1	Workshop	+91 20 6612 4764	Pune	Maharashtra	411018	IN
1741	2341	4241	201241	101241	Alok	Yadav	YadavA	Alok.Yadav@thyssenkrupp.com	10546705	91021	Mech Assly (Dept Code: 5006)	Mech Assly (Dept Code: 5006)	+91 20 66124407	Pune	Maharashtra	411018	IN
1742	2342	4242	201242	101242	Vaibhav	Vaidya	VaidyaV	Vaibhav.Vaidya@thyssenkrupp.com	10559553	90919	Controlling & Risk Management (Dept Code: 7608)	Controlling & Risk Management (Dept Code: 7608)	+91 20 6612 4877	Pune	Maharashtra	411018	IN
1743	2343	4243	201243	101243	Aumkar	Pradhan	PradhanA	Aumkar.Pradhan@thyssenkrupp.com	10561981	91014	Boiler Project /Processing Engineering (Dept Code:2003)	Boiler Project /Processing Engineering (Dept Code:2003)	\N	Pune	Maharashtra	411018	IN
1744	2344	4244	201244	101244	Sandip	Naik	NaikS	Sandip.Naik@thyssenkrupp.com	10619261	60145	DE-S (Dept Code: 6006	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4864	Pune	Maharashtra	411018	IN
1745	2345	4245	201245	101245	Varjavan	Dastoor	DastoorV	\N	\N	90840	RESEARCH & DEVELOPMENT (Dept Code: 1100)	RESEARCH & DEVELOPMENT (Dept Code: 1100)	\N	Pune	Maharashtra	411018	IN
1746	2346	4246	201246	101246	Vishnuprasad	Varma	VarmaVC	\N	\N	35054	BOQA Dept.	BOQA Dept.	\N	Pune	Maharashtra	411018	IN
1747	2347	4247	201247	101247	Nileema	Chaphekar	ChaphekarN	\N	\N	90841	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	\N	Pune	Maharashtra	411018	IN
1748	2348	4248	201248	101248	Khemraj	Gadgil	GadgilK	\N	\N	90858	FINANCE  BOOK KEEPING (Dept Code: 7602)	FINANCE  BOOK KEEPING (Dept Code: 7602)	+91 20 66124247	\N	\N	\N	\N
1749	2349	4249	201249	101249	Ashutosh	Bejekar	BejekarA	\N	\N	90832	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	+91 20 6612 4216	Pune	Maharashtra	411018	IN
1750	2350	4250	201250	101250	Sanjeev	Tata	TataS	\N	\N	90853	Construction Services - 7804	Services	\N	Pune	Maharashtra	411018	IN
1751	2351	4251	201251	101251	Tarun	Chakraborty	ChakrabortyTK	\N	\N	16301	Services  (Dept. Code: 7804 )	Services  (Dept. Code: 7804)	\N	Pune	Maharashtra	411018	IN
1752	2352	4252	201252	101252	Siddharth	Jirage	JirageS	Siddharth.Jirage@tkiidc.com	\N	PFS-234	PPC Dept (Dept Code: 5002 )	PPC Dept (Dept Code: 5002 )	+91 20 6612 4422	Pune	Maharashtra	411018	IN
1753	2353	4253	201253	101253	Snehankit	Kharbas	KharbasS	Snehankit.Kharbas@tkiidc.com	\N	Excellent-733	Manufacturing 5061	Manufacturing 5061	+91 20 6612 4821	Pune	Maharashtra	411018	IN
1754	2354	4254	201254	101254	Soumik	Paul	PaulS	Soumik.Paul@thyssenkrupp.com	10550491	90914	Kolkata Office (Dept Code: 6003)	Plant Design (Post Order) Group (Dept Code: 6009)	033 66055223	Pune	Maharashtra	411018	IN
1755	2355	4255	201255	101255	Ganesh	Lohar	LoharG	\N	\N	16298	Structural Design (Dep Code: 7305)	Structural Design (Dep Code: 7305)	+91 20 6612 4629	\N	\N	\N	\N
1756	2356	4256	201256	101256	Fariyaz	Irani	IraniF	\N	\N	90893	CEMENT  ENGINEERING (Dept Code: 6003)	Proposal Engineering Group (Dept Code: 6003)	+91 20 6612 4660	Pune	Maharashtra	411018	IN
1757	2357	4257	201257	101257	Ashish	Kale	KaleA	\N	\N	90953	DE-S (Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4491	Pune	Maharashtra	411018	IN
1992	2592	4492	201492	101492	Omkar	Dhane	DhaneO	\N	\N	PFS261	D & E - Structural Dept.	Structural Design (Dep Code: 7305)	+91 20 2742 4710	Pune	Maharashtra	411018	IN
1758	2358	4258	201258	101258	Ankita	Pawar	PawarAR	\N	\N	90957	Cement Process (Dept Code: 6003)	Process Engineering Group (Dept Code: 6010)	+91 20 6612 4728	Pune	Maharashtra	411018	IN
1759	2359	4259	201259	101259	Onkar	Dapke	DapkeO	\N	\N	11608	Cement Dept. 6003	Plant Design (Post Order) Group (Dept Code: 6009)	+91 20 6612 4832	\N	\N	\N	\N
1760	2360	4260	201260	101260	Sudhanva	Kadkol	KadkolS	\N	\N	11609	CEMENT  DESIGN & ENGINEERING (Dept Code: 6005)	Cement Design & Engineering (Dept Code: 6005)	+91 20 6612 4445	Pune	Maharashtra	411018	IN
1761	2361	4261	201261	101261	Dharamkumar	Maradiya	MaradiyaD	\N	\N	11610	HFS HALL NO 11 (Dept Code: 5007)	HFS HALL NO 11 (Dept Code: 5007)	+91 20 6612 4372	Pune	Maharashtra	411018	IN
1762	2362	4262	201262	101262	Yash	Ponde	PondeY	\N	\N	11599	Services (Dept Code 7807)	Services (Dept Code 7807)	+91 20 6612 4251	Pune	Maharashtra	411018	IN
1763	2363	4263	201263	101263	Snehal	Ozarkar	OzarkarS	\N	\N	4445	Personnel & HRD  (Dept Code: 5202)	Personnel & HRD  (Dept Code: 5202)	\N	Pune	maharashtra	411018	IN
1764	2364	4264	201264	101264	Vedashri	Telang	TelangV	\N	\N	4440	Personnel & HRD  (Dept Code: 5202)	Personnel & HRD  (Dept Code: 5202)	+91 20 6612 4515	Pune	maharashtra	411018	IN
1765	2365	4265	201265	101265	Sangamesh	Dukandar	DukandarS	Sangamesh.Dukandar@thyssenkrupp.com	10540968	91030	DE-S (Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4881	\N	\N	\N	\N
1766	2366	4266	201266	101266	Mayur	Pawar	PawarM	\N	\N	40639	Preparatory Dept Code: 5003	Preparatory Dept.	+91 20 6612  4851	Pune	Maharashtra	411018	IN
1767	2367	4267	201267	101267	Korupolu	Srinivas	SrinivasK	\N	\N	98054	SMB-D&E [5703]	Hyderabad Office	\N	\N	\N	\N	\N
1768	2368	4268	201268	101268	Swarup	Senapati	SenapatiS	\N	\N	16150	Services	Services	\N	Pune	Maharashtra	411018	IN
1769	2369	4269	201269	101269	Shubham	Patil	PatilS	\N	\N	11577	CEMENT  ENGINEERING (Dept Code: 6003)	CEMENT  ENGINEERING (Dept Code: 6003)	\N	Pune	Maharashtra	411018	IN
1770	2370	4270	201270	101270	Aditya	Athavale	AthavaleA	\N	\N	11624	Cement Drawing (Dept Code: 6003)	Post Order Engineering Group (Dept Code: 6008)	+91 20 6612 4034	Pune	Maharashtra	411018	IN
1771	2371	4271	201271	101271	Satish	Jagtap	JagtapS	Satish.Jagtap@thyssenkrupp.com	\N	PFS181	Material (Dept. Code: 7712 )	Material	+91 20 6612 4855	Pune	Maharashtra	411018	IN
1772	2372	4272	201272	101272	Mahesh	Mane	ManeMB	\N	\N	PFS 165	FINANCE  TAXATION (Dept Code: 7606)	FINANCE  TAXATION (Dept Code: 7606)	+91 20 6612 4773	Pune	Maharashtra	411018	IN
1773	2373	4273	201273	101273	Vijesh	Madarapu	MadarapuV	\N	\N	98055	SMB-D&E [5703]	Hyderabad Office	\N	\N	\N	\N	\N
1774	2374	4274	201274	101274	Devesh	Nigudkar	NigudkarD	Devesh.Nigudkar@thyssenkrupp.com	10561629	PFS177	Personnel & HRD (Dep Code : 5200)	Personnel & HRD  (Dept Code: 5200)	+9120 6612 4357	Pune	maharashtra	411018	IN
1775	2375	4275	201275	101275	Sheetal	Bhosale	Bhosale_S	Sheetal.Bhosale@thyssenkrupp.com	10572285	PFS175	Indirect Taxation Dept code (7606)	Indirect Taxation Dept code (7606)	+91 20 6612 4773	\N	\N	\N	\N
1776	2376	4276	201276	101276	Palash	Baheti	BahetiP	\N	\N	11574	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	\N	Pune	Maharashtra	411018	IN
1777	2377	4277	201277	101277	Mukesh	Murugan	MuruganM	\N	\N	90807	Services	\N	\N	\N	\N	\N	\N
1778	2378	4278	201278	101278	Kartik	Bakshi	BakshiK	\N	\N	11591	M/CSHOP (Dept Code 5061)	M/CSHOP (Dept Code 5061)	+91 20 6612 4426	Pune	Maharashtra	411018	IN
1779	2379	4279	201279	101279	Nisarg	Shah	ShahN	\N	\N	90882	Construction Services  (Dept. Code: 7804 )	Construction Services	\N	Pune	Maharashtra	411018	IN
1780	2380	4280	201280	101280	Rohit	Bhurale	BhuraleR	\N	\N	4860	SUGAR  ENGINEERING (Dept Code: 4003)	SUGAR  ENGINEERING (Dept Code: 4003)	\N	Pune	Maharashtra	411018	IN
1781	2381	4281	201281	101281	Vishvajeet	Chavan	ChavanV	\N	\N	90883	Construction Services ( Dept. Code 7804 )	Construction Services ( Dept. Code 7804 )	\N	Pune	Maharashtra	411018	IN
1782	2382	4282	201282	101282	Seema	Pawar	PawarSN	\N	\N	PFS146	Finance - Bill Passing	Finance - Bill Passing	\N	Pune	Maharashtra	411018	IN
1783	2383	4283	201283	101283	Omkar	Pawar	PawarO	\N	\N	11628	PROPOSAL ENGINEERING (Dept Code:3003)	PROPOSAL ENGINEERING (Dept Code:3003)	\N	Pune	Maharastra	\N	IN
1784	2384	4284	201284	101284	Dinesh	Wagh	WaghD	\N	\N	11632	Manufacturing (Dept Code:5003)	Manufacturing (Dept Code:5003)	+91 20 6612 4379	Pune	Maharashtra	411018	IN
1785	2385	4285	201285	101285	Shubham	Bhagwat	BhagwatS	\N	\N	91070	CEMENT  DESIGN & ENGINEERING (Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4746	Pune	Maharashtra	411018	IN
1786	2386	4286	201286	101286	Varun	Joshi	Joshi_V	\N	\N	11627	Manufacturing (Dept Code:5020)	Manufacturing (Dept Code:5020)	+91 20 6612 4386	Pune	Maharashtra	411018	IN
1787	2387	4287	201287	101287	Shantaram	Patil	PatilSY	\N	\N	90799	Manufacturing (Dept Code:5020)	Manufacturing (Dept Code:5020)	+91 20 6612 4809	Pune	Maharashtra	411018	IN
1788	2388	4288	201288	101288	Varun	Kulkarni	KulkarniVB	Varun.Kulkarni@thyssenkrupp.com	10561970	91032	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4842	Pune	Maharashtra	411018	IN
1789	2389	4289	201289	101289	Sudhakar	Reddy	ReddySM	\N	\N	11568	CEMENT  DESIGN & ENGINEERING (Dept Code: 6005)	CEMENT  DESIGN & ENGINEERING (Dept Code: 6005)	\N	Pune	Maharashtra	411018	IN
1790	2390	4290	201290	101290	Tanmay	Bhave	BhaveT	Tanmay.Bhave@thyssenkrupp.com	10561979	91015	PROPOSAL ENGINEERING (Dept Code:3003)	PROPOSAL ENGINEERING (Dept Code:3003)	+91 20 6612 4487	Pune	Maharastra	\N	IN
1791	2391	4291	201291	101291	Reshmi	Nair	NairRV	Reshmi.Nair@thyssenkrupp.com	10561628	70029 (BSA)	FINANCE  (Dept Code: 7604)	FINANCE  (Dept Code: 7604)	+91 20 6612 4744	Pune	Maharashtra	411018	IN
1792	2392	4292	201292	101292	Narsu	Patil	PatilN	\N	\N	91026	DESIGN & ENGINEERING.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4642	Pune	Maharashtra	411018	IN
1793	2393	4293	201293	101293	Pradeep	Kamble	KamblePD	Pradeep.Kamble@thyssenkrupp.com	10488400	90783	Services  (Dept. Code:7804)	Services  (Dept. Code:7804)	\N	Pune	Maharashtra	411018	IN
1794	2394	4294	201294	101294	Kishor	Mhetre	MhetreK	Kishor.Mhetre@thyssenkrupp.com	10551742	90917	DE-S (Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	Tel: +91 20 6612 4734	Pune	Maharashtra	411018	IN
1795	2395	4295	201295	101295	Rohit	Bharvesh	BharveshR	\N	\N	90922	DESIGN & ENGINEERING  MHE-MACHINES (Dept. Code: 7302)	DESIGN & ENGINEERING  MHE-MACHINES (Dept. Code: 7302)	+91 20 6612 4726	Pune	Maharashtra	411018	IN
1796	2396	4296	201296	101296	Venkateshwarlu	Dommati	DommatiV	\N	\N	35061	SMB Dept.Code 5705	Hyderabad Office	\N	Pune	Maharashtra	411018	IN
1797	2397	4297	201297	101297	Atul	Belgamwar	BelgamwarA	\N	\N	CTS087	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	\N	Pune	Maharashtra	411018	IN
1798	2398	4298	201298	101298	Byraboiena	Nagaraju	NagarajuB	\N	\N	35065	Hyderabad Office	Hyderabad Office -PPC (5502)	\N	Pune	Maharashtra	411018	IN
1799	2399	4299	201299	101299	Vikranth	Pulakala	PulakalaV	\N	\N	35071	Quality Assurance (Dept Code: 5511)	Quality Assurance (Dept Code: 5511)	\N	Pune	Maharashtra	411018	IN
1800	2400	4300	201300	101300	Jagdish	Dhumal	DhumalJ	\N	\N	CTS0126	PDMS Engineers ( On contract of Chandan Tech Solution Pvt.Ltd)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	\N	Pune	Maharashtra	411018	IN
1801	2401	4301	201301	101301	Pramodh	Thoudoos	ThoudoosP	\N	\N	35062	Hyderabad Office ( Dept. Code 5551)	Hyderabad Office	\N	Pune	Maharashtra	411018	IN
1802	2402	4302	201302	101302	Kasireddy	Karthik	KarthikK	\N	\N	35072	Hyderabad Office	Hyderabad Office Fabrication (Dept Code 5524)	\N	Pune	Maharashtra	411018	IN
1803	2403	4303	201303	101303	Shiva	Poosa	PoosaS	\N	\N	35070	Hyderabad Office	Hyderabad Office Maintenance (Dept Code 5510)	\N	Pune	Maharashtra	411018	IN
1804	2404	4304	201304	101304	Bibhuti	Sahu	SahuB	Bibhuti.Sahu@thyssenkrupp.com	10551261	90915	Delhi Office	Delhi Office SMB- Execution ( Dep Code: 5704)	\N	New Delhi	\N	\N	\N
1805	2405	4305	201305	101305	Shaik	Baji	BajiS	\N	\N	35064	Hyderabad Office	Hyderabad Office -PPC (5502)	\N	Pune	Maharashtra	411018	IN
1806	2406	4306	201306	101306	Satish	Chandra	ChandraS	\N	\N	35026	Hyd Office	\N	\N	\N	\N	\N	\N
1807	2407	4307	201307	101307	Srinivasulu	M	SrinivasuluM	Srinivasulu.M@thyssenkrupp.com	10564118	90925	PROPOSAL ENGINEERING (Dept Code:3003)	PROPOSAL ENGINEERING (Dept Code:3003)	+91 206612 4857	Pune	Maharastra	\N	IN
1808	2408	4308	201308	101308	Lokesh	Kumar	KumarL	Lokesh.Kumar@thyssenkrupp.com	10561985	91013	RESEARCH & DEVELOPMENT (Dept Code: 1100)	RESEARCH & DEVELOPMENT (Dept Code: 1100)	\N	Pune	Maharashtra	411018	IN
1809	2409	4309	201309	101309	Jaiee	Adhe	AdheJ	Jaiee.Adhe@thyssenkrupp.com	10564546	BSA70029	FINANCE  BILLING (Dept Code: 7603)	FINANCE  BILLING (Dept Code: 7603)	020 6612 4669	\N	\N	\N	\N
1810	2410	4310	201310	101310	Vaijinath	Rawale	RawaleV	Vaijinath.Rawale@thyssenkrupp.com	10488597	90815	Manufacturing (Dept Code:5020)	Manufacturing (Dept Code:5020)	+91 20 66124809	Pune	Maharashtra	411018	IN
1811	2411	4311	201311	101311	Ajay	Guduru	GuduruA	ajay.guduru@thyssenkrupp.com	10566949	35081	Hyderabad Office PPC ( Dept.Code 5502 )	Hyderabad Office PPC ( Dept.Code 5502 )	040-2794 1405	Pune	Maharashtra	411018	IN
1812	2412	4312	201312	101312	Vinayak	Salke	SalkeV	Vinayak.Salke@thyssenkrupp.com	10619279	60163	Services (Dept. code 7807)	Services (Dept. code 7807)	+91 20 6612 4575	Pune	Maharashtra	411018	IN
1813	2413	4313	201313	101313	Archana	Kadam	KadamAD	Archana.Kadam@thyssenkrupp.com	10569369	PFS189	Finance (7604)	FINANCE  (Dept Code: 7604)	+91 20 6612 4240	Pune	Maharashtra	411018	IN
1814	2414	4314	201314	101314	Manohar	Nayak	NayakM	Manohar.Nayak@thyssenkrupp.com	\N	70031	FINANCE (Dept Code: 7603)	FINANCE (Dept Code: 7603)	\N	Pune	Maharashtra	\N	IN
1815	2415	4315	201315	101315	Nilesh	Swamy	SwamyN	Nilesh.Swamy@thyssenkrupp.com	\N	PFS191	FINANCE (Dept Code: 7603)	FINANCE (Dept Code: 7603)	\N	Pune	Maharashtra	\N	IN
1816	2416	4316	201316	101316	Rajeev	Keskar	KeskarR	Rajeev.Keskar@thyssenkrupp.com	10569434	90927	FINANCE  Indirect Taxation (Dept Code: 7606)	FINANCE  Indirect Taxation (Dept Code: 7606)	+91 20 6612 4259	Pune	Maharashtra	411018	IN
1817	2417	4317	201317	101317	Lava	Adari	AdariL	lava.adari@thyssenkrupp.com	10569152	35083	Fabrication (Dept. Code 5551)	Fabrication (Dept. Code 5551)	040-2794 1483	\N	\N	\N	\N
1818	2418	4318	201318	101318	Rishikesh	Ahire	AhireR	\N	\N	90851	Services	Services	020 6612 4841	\N	\N	\N	\N
1819	2419	4319	201319	101319	Anil	Aravindan	AravindanA	Anil.Aravindan@thyssenkrupp.com	10570882	90929	Services  (Dept. Code:  7807)	Services  (Dept. Code:  7807)	\N	Pune	Maharashtra	411018	IN
1820	2420	4320	201320	101320	Aditya	Naikwadi	NaikwadiA	\N	\N	PFS182	Structural Design/7305	Structural Design/7305	+91 20 6612 4781	Pune	Maharashtra	411018	IN
1821	2421	4321	201321	101321	Vinit	Dave	DaveV	Vinit.Dave@thyssenkrupp.com	10572662	90930	Service (Dept.Code 7807)	Services	\N	Pune	Maharashtra	\N	IN
1822	2422	4322	201322	101322	Mukesh	Ojha	OjhaM	Mukesh.Ojha@thyssenkrupp.com	10573850	90931	Sales & Marketing department (5702)	SMB - Sales & Marketing department (5702)	7769820011	Pune	Maharashtra	411018	IN
1823	2423	4323	201323	101323	Mukesh	Rm	MukeshRM	\N	\N	90807	\N	\N	\N	\N	\N	\N	\N
1824	2424	4324	201324	101324	Kailas	Nikalje	NikaljeK	Kailas.Nikalje@tkiidc.com	\N	PFS280	Design & Engineering To Group Co.(Dept Code: 3003)	MHE -7303	020 6612 4619	\N	\N	\N	\N
1825	2425	4325	201325	101325	Siddheshwar	Sonwalkar	SonwalkarS	Siddheshwar.Sonwalkar@thyssenkruppindia.com	10561976	1792484	PPC (Dept Code:5002)	PPC (Dept Code:5002)	+91 20 6612 4418	Pune	Maharashtra	411018	IN
1826	2426	4326	201326	101326	Akshay	Chorage	ChorageA	Akshay.Chorage@tkiidc.com	10488562	1792477	MHE System (Dept.Code 7303)	MHE System (Dept.Code 7303)	020 6612 4777	Pune	Maharashtra	411018	IN
1827	2427	4327	201327	101327	Channabasappa	Sannappanava	SannappanavarC	channabasappa.sannappanavar@thyssenkrupp.com	10577040	90932	SMB 5704	SMB 5704	+91 20 6612 4747	\N	\N	\N	\N
1828	2428	4328	201328	101328	Subramanya	S	SubramanyaS	Subramanya.S@thyssenkrupp.com	10578111	90933	MHE Utilities - 7303	MHE Utilities - 7303	+91 20 6612 4844	Pune	maharashtra	411018	IN
1829	2429	4329	201329	101329	Manish	Singh	SinghM	Manish.Singh@thyssenkrupp.com	10579186	90934	Services  (Dept. Code: 7807 )	Services  (Dept. Code: 7807 )	\N	Pune	Maharashtra	411018	IN
1830	2430	4330	201330	101330	Kailash	Jadhav	JadhavK	Kailash.Jadhav@thyssenkrupp.com	10566001	90923	Services  (Dept. Code: 7807)	Services  (Dept. Code: 7807)	\N	pune	Maharashtra	411018	IN
1831	2431	4331	201331	101331	Sonika	Kulhare	KulhareS	Sonika.Kulhare@thyssenkrupp.com	10579537	90935	Commercial (Dept. Code:7630)	Commercial (Dept. Code:7630)	+91 20 66124090	Pune	Maharashtra	411018	IN
1832	2432	4332	201332	101332	Akshay	Chavan	ChavanA	Akshay.Chavan@tkiidc.com	\N	70032	Commercial & Secretarial, 7630	Commercial & Secretarial, 7630	\N	\N	\N	\N	\N
1833	2433	4333	201333	101333	Sujeetkumar	Bhagat	BhagatS	Sujeetkumar.Bhagat@thyssenkrupp.com	10579568	10579568	Import-Export 7650	Import-Export 7650	\N	\N	\N	\N	\N
1834	2434	4334	201334	101334	Sagar	Ghule	GhuleS	Sagar.Ghule@thyssenkrupp.com	\N	10579567	Import-Export 7650	Import-Export 7650	\N	\N	\N	\N	\N
1835	2435	4335	201335	101335	Bibhuti	Nayak	NayakBI	Bibhuti.Nayak@thyssenkrupp.com	10529083	35074	Hyderabad Office (QA 5511)	Hyderabad Office (QA 5511)	4027941510	Pune	Maharashtra	411018	IN
1993	2593	4493	201493	101493	Rishabh	Bhapkar	BhapkarR	\N	\N	11676	Construction dept ? 7804	Construction dept ? 7804	\N	Pune	Maharashtra	411 018	IN
1836	2436	4336	201336	101336	Ajay	Joshi	AjayJ	Ajay.Joshi@thyssenkrupp.com	\N	PFS-215	Services  (Dept. Code: 7801)	Services  (Dept. Code: 7801)	+91 20 6612 4102	Pune	Maharashtra	411018	IN
1837	2437	4337	201337	101337	Anandkumar	Bhairappa	BhairappaA	\N	\N	PFS-196	Electrical ( Contract )	Electrical ( Contract )	\N	Pune	Maharashtra	411018	IN
1838	2438	4338	201338	101338	Sachin	Misal	MisalS	Sachin.Misal@tkiidc.com	10517295	PFS-218	PPC Dept (Dept Code: 5002 )	PPC Dept (Dept Code: 5002 )	+91 20 6612 4422	Pune	Maharashtra	411018	IN
1839	2439	4339	201339	101339	Arun	Chilakala	ChilakalaA	Arun.Chilakala@thyssenkrupp.com	10619342	60231	SMB Dept Code. 5702	Hyderabad Office SMB Dept Code. 5702	\N	Pune	Maharashtra	411018	IN
1840	2440	4340	201340	101340	Praveen	Kumar	KumarP	Praveen.Kumar1@thyssenkrupp.com	10582639	90937	Services (Dept Code. 7807)	Services (Dept Code. 7807)	\N	Pune	Maharashtra	411018	IN
1841	2441	4341	201341	101341	Sandeep	Kumar	KumarSAN	\N	\N	90928	Services	Services Division	\N	Pune	Maharashtra	411018	IN
1842	2442	4342	201342	101342	Sukhjiwan	Biring	BiringS	Sukhjiwan.Biring@thyssenkrupp.com	10446819	90938	Structural Design	Structural Design	+91 20 6612 4711	Pune	Maharashtra	411018	IN
1843	2443	4343	201343	101343	Pravin	Shirke	ShirkeP	Pravin.Shirke@thyssenkrupp.com	\N	PFS-224	Services (Dept Code 7807)	Services (Dept Code 7807)	+91 20 6612 4652	Pune	Maharashtra	411018	IN
1844	2444	4344	201344	101344	Harshal	Thakare	ThakareH	harshal.thakare@thyssenkrupp.com	10584323	91035	E&I (dept code7402)	E&I (dept code7402)	+91 20 6612 4716	Pune	Maharashtra	411018	IN
1845	2445	4345	201345	101345	Rajan	Verma	VermaR	Rajan.Verma@thyssenkrupp.com	10562785	90920	Services	Services	\N	Pune	Maharashtra	\N	IN
1846	2446	4346	201346	101346	Amita	Shewale	ShewaleA	Amita.Shewale@thyssenkrupp.com	\N	PFS-226	Services  (Dept. Code: 7801)	Services  (Dept. Code: 7801)	+91 20 6612 4472	Pune	Maharashtra	411018	IN
1847	2447	4347	201347	101347	Prashant	Mane	ManePS	Prashant.Mane@thyssenkrupp.com	10542178	PFS225/1792445	Services  (Dept. Code:  7807)	Services  (Dept. Code:  7807)	+91 20 6612 4880	Pune	Maharashtra	411018	IN
1848	2448	4348	201348	101348	Dinesh	Humnabadkar	HumnabadkarD	\N	\N	5689	Purchase - Material (Dept. Code: 7712 )	Purchase - Material	+091 20 66124276	Pune	Maharashtra	411018	IN
1849	2449	4349	201349	101349	Pawar	R	PawarR	\N	\N	9402	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	+91 20 6612 4452	Pune	Maharashtra	411018	IN
1850	2450	4350	201350	101350	tkii	Desksupport5	admin_se5	\N	\N	Orbit	T&IS - Orbit	T&IS - Orbit	+91 20 6612 4176	Pune	Maharashtra	411018	IN
1851	2451	4351	201351	101351	Deepa	D'souza	DsouzaD	Deepa.Dsouza@thyssenkrupp.com	\N	PFS-232	Estimation(Dept. Code:7620)	Estimation(Dept. Code:7620)	+91 20 6612 4742	Pune	Maharashtra	411018	IN
1852	2452	4352	201352	101352	Selambathevar	Krishnaswamy	KrishnaswamyS	\N	\N	5248	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	+91 20 6612 4447	Pune	Maharashtra	411018	IN
1853	2453	4353	201353	101353	Krushna	Swain	SwainK	Krushna.Swain@thyssenkrupp.com	10619309	60193	Construction Services  (Dept. Code: 7804)	Construction Services  (Dept. Code: 7804)	\N	Pune	Maharashtra	411018	IN
1854	2454	4354	201354	101354	Abhijit	Pujari	PujariA	Abhijit.Pujari@thyssenkrupp.com	\N	PFS-233	SERVICES	SERVICES	\N	Pune	Maharashtra	411018	IN
1855	2455	4355	201355	101355	Rishikesh	Kanshetti	KanshettiR	\N	\N	VISION ENGINEERS	VISION ENGINEERS	Cement	\N	Pune	Maharashtra	411018	IN
1856	2456	4356	201356	101356	Avinash	Kshirsagar	KshirsagarAV	\N	\N	VISION ENGINEERS	VISION ENGINEERS	Cement	\N	Pune	Maharashtra	411018	IN
1857	2457	4357	201357	101357	Printer Test	\N	Printer	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1858	2458	4358	201358	101358	Rahul	Deshmukh	DeshmukhR	Rahul.Deshmukh@thyssenkrupp.com	10587747	90940	Services  (Dept. Code: 7807)	Services  (Dept. Code: 7807)	+91 20 6612 4230	Pune	Maharashtra	411018	IN
1859	2459	4359	201359	101359	Ravi	Choudhary	ChoudharyR	Ravi.Choudhary@thyssenkrupp.com	10584316	90939	Services (Dept Code. 7807)	Services (Dept Code. 7807)	\N	Pune	Maharashtra	411018	IN
1860	2460	4360	201360	101360	Michael	Schniederkoetter	MichaelS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1861	2461	4361	201361	101361	Mahendra	Joshi	JoshiMD	\N	\N	90717	MHE MANAGEMENT (Dept Code: 3001)	MHE MANAGEMENT (Dept Code: 3001)	+91 20 6612 4438	Pune	Maharashtra	411018	IN
1862	2462	4362	201362	101362	Virat	Joshii	JoshiV	\N	\N	90151	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	+91 20-6612 4718	Pune	Maharashtra	\N	IN
1863	2463	4363	201363	101363	Chaitanya	Akhouri	AkhouriC	\N	\N	9852	ENGG./EXECUTION INSTRUMENTATION (Dept Code: 7404)	ENGG./EXECUTION INSTRUMENTATION (Dept Code: 7404)	+91 20 6612 4577	Pune	Maharashtra	411018	IN
1864	2464	4364	201364	101364	Ruksana	Kapase	KapaseR	\N	\N	PFS284	MHE System (Dept.Code 7303)	MHE System (Dept.Code 7303)	020 66124777	Pune	Maharashtra	411018	IN
1865	2465	4365	201365	101365	Dattatray	Chikane	ChikaneD	\N	10488562	PFS-216	MHE System (Dept.Code 7303)	MHE System (Dept.Code 7303)	\N	Pune	Maharashtra	411018	IN
1866	2466	4366	201366	101366	ARCHANA	KURHADE	KURHADEA	\N	\N	40650	BOILER & POWER PLANT (Dept. Code: 2000)	BOILER & POWER PLANT (Dept. Code: 2000)	+91 20 6612 4054	Pune	Maharashtra	411018	IN
1867	2467	4367	201367	101367	Raghunath	Joshi	JoshiRS	\N	\N	90826	MHE- Project Management (Dept Code: 93604)	PM_MHE_9304	+91 20 6612 4647	\N	\N	\N	\N
1868	2468	4368	201368	101368	Mandar	Kulkarni	Kulkarni_M	\N	\N	90300	CEMENT  EXECUTION (Dept Code: 6004)	PM_Cement_9604	+91 20 6612 4758	Pune	Maharashtra	411018	IN
1869	2469	4369	201369	101369	Janhavi	Muley	MuleyJ	\N	\N	PFS-230	B&PP	B&PP	+91 20 6612 4064	\N	\N	\N	\N
1870	2470	4370	201370	101370	Vijayanand	Mishra	MishraV	\N	\N	60196	Service (Dept.Code 7807)	Service (Dept.Code 7807)	\N	Pune	Maharashtra	\N	IN
1871	2471	4371	201371	101371	Anandaroop	Ghosal	GhosalA	\N	\N	11639	SERVICES ? (Dep.Code : 7807)	SERVICES ? (Dep.Code : 7808)	+91 20 6612 4192	Pune	Maharashtra	411018	IN
1872	2472	4372	201372	101372	Satyanarayanaa	Rama	RamaS	\N	\N	98070	Hydrabad Office	Admin (5513)	\N	Pune	Maharashtra	411018	IN
1873	2473	4373	201373	101373	Devashree	Shastrakar	ShastrakarD	\N	\N	4447	Personnel & HRD  (Dept Code: 5202)	Personnel & HRD  (Dept Code: 5202)	+91 20 6612 4515	Pune	maharashtra	411018	IN
1874	2474	4374	201374	101374	Bhusan	Nayak	NayakB	\N	10529083	35074	Hydrabad Office	QA (Dept Code 5511)	040-2794 1510	Pune	Maharashtra	411018	IN
1875	2475	4375	201375	101375	Pooja	Sumbad	SumbadP	\N	\N	4446	Personnel & HRD  (Dept Code: 5202)	Personnel & HRD  (Dept Code: 5202)	+91 20 6612 4357	Pune	maharashtra	411018	IN
1994	2594	4494	201494	101494	QA	Trainee	Qatrainee	\N	\N	\N	QA Conf room for Auditor-Qa Trainee	\N	\N	Pune	Maharashtra	411018	IN
1876	2476	4376	201376	101376	Happy	Verma	VermaH	\N	\N	16241	Construction Services (Dept.Code: 7805)	Construction Services (Dept.Code: 7805)	\N	Pune	Maharashtra	411018	IN
1877	2477	4377	201377	101377	SURESH BABU	LANKAYAGARI	LANKAYAGARIS	\N	\N	16336	Construction Services (Dept.Code: 7805)	Construction Services (Dept.Code: 7805)	\N	Pune	Maharashtra	411018	IN
1878	2478	4378	201378	101378	Bommaram	Shiva	ShivaB	\N	\N	35084	Stores & Despatch	Stores & Despatch	\N	Pune	Maharashtra	411018	IN
1879	2479	4379	201379	101379	Purushottam	Yadav	YadavP	\N	\N	PFS283	PROPOSAL ENGINEERING (Dept Code:3003)	PROPOSAL ENGINEERING (Dept Code:3003)	+91 20 6612 4589	Pune	Maharastra	\N	IN
1880	2480	4380	201380	101380	Megha	Hanchate	HanchateM	\N	\N	PFS185	Admin 7000	Admin 7000	+91 20 6612 4007	\N	\N	\N	\N
1881	2481	4381	201381	101381	Siva	Kundur	ReddyS	\N	\N	98069	Hyderabad Office ( Dept. Code 5502)	Hyderabad Office ( Dept. Code 5502)	\N	Pune	Maharashtra	411018	IN
1882	2482	4382	201382	101382	Umesh	Jangam	JangamU	\N	\N	90336	MHE  EXECUTION (Dept Code: 3004)	PM_MHE_9304	+91 20 6612 4674	Pune	Maharashtra	411018	IN
1883	2483	4383	201383	101383	Anand	Nalawade	NalawadeA	\N	\N	VISION ENGINEERS	VISION ENGINEERS	Cement	\N	Pune	Maharashtra	411018	IN
1884	2484	4384	201384	101384	Suraj	Shinde	ShindeSU	Suraj.Shinde@thyssenkrupp.com	10590504	91029	Cement 6006	Cement 6006	+91 20 6612 4849	\N	\N	\N	\N
1885	2485	4385	201385	101385	Prakash	Mane	ManePP	Prakash.Mane@tkiidc.com	\N	PFS-241	Stores & Despatch	Stores & Despatch	020 6612 4332	Pune	Maharashtra	411018	IN
1886	2486	4386	201386	101386	Sunil	Dindegave	DindegaveS	Sunil.Dindegave@tkiidc.com	\N	PFS 242	Stores  (Dept. Code:  7752)	Stores & Despatch	\N	Pune	Maharashtra	411018	IN
1887	2487	4387	201387	101387	Gopal	Choudhari	ChoudhariG	Gopal.Choudhari@thyssenkrupp.com	10593182	11656	CEMENT  DESIGN & ENGINEERING (Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4460	Pune	Maharashtra	411018	IN
1888	2488	4388	201388	101388	Prashant	Dhole	DholeP	Prashant.Dhole@thyssenkrupp.com	10593174	11654	CEMENT  DESIGN & ENGINEERING (Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4879	Pune	Maharashtra	411018	IN
1889	2489	4389	201389	101389	Deepak	Patil	PatilD	Deepak.Patil@thyssenkrupp.com	10592073	11652	Machine Shop (5020)	Machine Shop (5020)	+91 20 6612 4386	Pune	Maharashtra	411018	IN
1890	2490	4390	201390	101390	Digambar	Kamble	KambleD	Digambar.Kamble2@thyssenkrupp.com	\N	PFS250	B & PP-process & proposal ( Dept. Code 2003 )	B & PP-process & proposal ( Dept. Code 2003 )	+91 20 6612 4565	Pune	\N	411018	IN
1891	2491	4391	201391	101391	Sagar	Thombare	ThombareS	\N	\N	\N	BOILER & POWER PLANT (Dept. Code: 2000)	BOILER & POWER PLANT (Dept. Code: 2000)	+91 20 6612 4854	\N	\N	\N	\N
1892	2492	4392	201392	101392	Priya	Nilakhe	NilakheP	Priya.Nilakhe@thyssenkrupp.com	10593721	PFS 249	Finance - Bill Passing	Finance - Bill Passing	020 6612 4744	Pune	Maharashtra	411018	IN
1893	2493	4393	201393	101393	Mantosh	Kumar	KumarM	Mantosh.Kumar@thyssenkrupp.com	10593802	90941	Delhi Office	Delhi Office SMB ( Dep Code: 5702)	\N	New Delhi	\N	\N	\N
1894	2494	4394	201394	101394	Ameya	Karve	KarveA	Ameya.Karve@thyssenkrupp.com	10594356	90942	B&PP Dept. Code - 2003	B&PP Dept. Code - 2003	+91 20 6612 4457	Pune	Maharashtra	411018	IN
1895	2495	4395	201395	101395	Ramkrushna	Chaudhari	ChaudhariR	Ramkrushna.Chaudhari@thyssenkrupp.com	10593175	11655	MHE Design Pulleys & Idlers (Dept. 7332)	MHE Design Pulleys & Idlers (Dept. 7332)	+91 20 6612 4842	Pune	Maharashtra	411018	IN
1896	2496	4396	201396	101396	Suraj	Londhe	LondheSR	Suraj.Londhe@thyssenkrupp.com	10590505	11647	CIVIL EXECUTION (Dept Code: 7202)	CIVIL EXECUTION (Dept Code: 7202)	\N	Pune	Maharashtra	411018	IN
1897	2497	4397	201397	101397	Mohammad	Ahmad	AhmadM	mohammad.ahmad@thyssenkrupp.com	10383831	35098	Hyderabad Office	QUALITY- SITE (Dept Code: 5406)	040-2794 1508	Hyderabad	Telangana	500051	IN
1898	2498	4398	201398	101398	Phanidhar	Annabattula	AnnabattulaP	phanidhar.annabattula@thyssenkrupp.com	10488253	35097	Hyderabad Office	\N	4027941511	\N	\N	\N	\N
1899	2499	4399	201399	101399	Pralash	Mandal	MandalP	Pralash.Mandal@thyssenkrupp.com	10512658	35091	Hyderabad Office -PPC (5502)	Hyderabad Office -PPC (5502)	040-2794 1406	Pune	Maharashtra	411018	IN
1900	2500	4400	201400	101400	Ganji	Rahul	RahulG	Ganji.Rahul@tkiidc.com	10447218	35096	Hyderabad Office	Hyderabad Office	\N	Pune	Maharashtra	411018	IN
1901	2501	4401	201401	101401	Jetti	Varaprasad	VaraprasadJ	Jetti.Varaprasad@tkiidc.com	10383831	0075 / SUB-CONTRACT	Hyderabad Office	QUALITY- SITE (Dept Code: 5406)	\N	Pune	Maharashtra	411018	IN
1902	2502	4402	201402	101402	Saumitra	Kolhatkar	KolhatkarS	Saumitra.Kolhatkar@thyssenkrupp.com	10595543	91071	SERVICES ? (Dep.Code : 7808)	Boiler Services R&R (7808)	+91 20 6612 4839	Pune	Maharashtra	411018	IN
1903	2503	4403	201403	101403	Shashi	Ranjan	RanjanS	Shashi.Ranjan@tkiidc.com	10595544	11661	QUALITY-  PRODUCTION (Dept Code: 5403)	QUALITY-  PRODUCTION (Dept Code: 5403)	+91 20 6612 4385	Pune	Maharashtra	411018	IN
1904	2504	4404	201404	101404	Akash	Patil	Patil_AB	Akash.Patil@tkiidc.com	10488235	11660	MANUFACTURING Mech Assly (Dept Code. 5061)	MANUFACTURING Mech Assly (Dept Code. 5061)	+91 20 66124407	Pune	Maharashtra	411018	IN
1905	2505	4405	201405	101405	Yashpalsinh	Jethwa	JethwaY	Yashpalsinh.Jethwa@thyssenkrupp.com	10500189	90969	Services (Dept Code. 7807)	Services (Dept Code. 7807)	\N	Pune	Maharashtra	411018	IN
1906	2506	4406	201406	101406	Rachakonda	Mokshagna	MokshagnaR	Rachakonda.Mokshagna@thyssenkrupp.com	10596639	35102	Hyderabad Office -PPC (5502)	Hyderabad Office -PPC (5502)	040-2794 1407	Pune	Maharashtra	411018	IN
1907	2507	4407	201407	101407	Omkar	Mulik	MulikO	Omkar.Mulik@tkiidc.com	\N	PFS-200	Controlling & Risk Management (Dept Code: 7608)	Controlling & Risk Management (Dept Code: 7608)	\N	Pune	Maharashtra	411018	IN
1908	2508	4408	201408	101408	Abhijit	Bhasme	BhasmeAS	abhijit.bhasme@thyssenkrupp.com	10598384	91088	BOILER  ENGINEERING (Dept Code: 2003)	BOILER  ENGINEERING (Dept Code: 2003)	+91 20 6612 4442	\N	\N	\N	\N
1909	2509	4409	201409	101409	Pratik	Rakh	RakhP	Pratik.Rakh@thyssenkrupp.com	10598458	11666	SERVICES ? 7808	Boiler Services R&R (7808)	91 20 6612 4520	Pune	Maharashtra	411018	IN
1910	2510	4410	201410	101410	Tukaram	Maskale	MaskaleT	Tukaram.Maskale@thyssenkrupp.com	10598380	11670	Design & Engineering  (Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	020 6612 4872	Pune	Maharashtra	411018	IN
1911	2511	4411	201411	101411	Aman	Kathuria	KathuriaA	aman.kathuria@thyssenkrupp.com	10598369	91092	Electrical & Instrumentation (dept code7402)	E&I (dept code7402)	+91 20 2742 4527	Pune	Maharashtra	411018	IN
1912	2512	4412	201412	101412	Mahesh	Bade	BadeM	Mahesh.Bade@thyssenkrupp.com	10598371	91090	E&I (dept code7402)	E&I (dept code7402)	+91 20 2742 4224	Pune	Maharashtra	411018	IN
1913	2513	4413	201413	101413	VikashKumar	Panda	PandaV	vikashkumar.panda@thyssenkrupp.com	10598375	91091	E&I (dept code7402)	E&I (dept code7402)	+91 20 2742 4706	Pune	Maharashtra	411018	IN
1914	2514	4414	201414	101414	Pratik	Bharsakale	BharsakaleP	Pratik.Bharsakale@thyssenkrupp.com	10598459	11674	MHE Systems	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4489	Pune	Maharashtra	411018	IN
1915	2515	4415	201415	101415	Avinash	Kulkarni	Kulkarni_A	Avinash.Kulkarni@thyssenkrupp.com	10598382	11677	MHE Machines  (Dept. Code: 7302)	DESIGN & ENGINEERING  MHE-MACHINES (Dept. Code: 7302)	+91 20 6612 4452	Pune	Maharashtra	411018	IN
1916	2516	4416	201416	101416	Mallinath	Wale	WaleM	Mallinath.Wale@thyssenkrupp.com	10619317	60203	D & E - Structural	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	+91 20 2742 4639	Pune	Maharashtra	411018	IN
1917	2517	4417	201417	101417	Samadhan	Gaikwad	GaikwadSS	Samadhan.Gaikwad@thyssenkrupp.com	10598460	4448	Estimation (Dept. Code:7620)	Estimation (Dept. Code:7620)	+91 20 2742 4380	Pune	Maharashtra	411018	IN
1918	2518	4418	201418	101418	Avinash	Lohar	LoharA	Avinash.Lohar@thyssenkrupp.com	10598367	11669	PROPOSAL ENGINEERING (Dept Code:3003)	PROPOSAL ENGINEERING (Dept Code:3003)	+91 20 6612 4819	Pune	Maharastra	\N	IN
1919	2519	4419	201419	101419	Venkatamahesh	Punugu	PunuguV	Venkatamahesh.Punugu@thyssenkrupp.com	10598370	11673	PROPOSAL ENGINEERING (Dept Code:3003)	PROPOSAL ENGINEERING (Dept Code:3003)	+91 20 66124589	Pune	Maharastra	\N	IN
1920	2520	4420	201420	101420	Vivek	Bhatia	bhatiav	Vivek.Bhatia@thyssenkrupp.com	10425249	90977	Managing Director and CEO	M.D. AND CEO'S  OFFICE ( Dept code 1002)	+91 20 66124070	Pune	Maharashtra	411018	IN
1921	2521	4421	201421	101421	Tarit	Mondal	MondalT	Tarit.Mondal@thyssenkrupp.com	10500223	90971	Services (Dept Code 7807)	Services (Dept Code 7807)	\N	Pune	Maharashtra	411018	IN
1922	2522	4422	201422	101422	Ashish	Wadkar	WadkarA	ashish.wadkar@thyssenkrupp.com	10488697	90907	Preparatory .Manufacturing (Dept Code:5003)	Preparatory .Manufacturing (Dept Code:5003)	\N	Pune	Maharashtra	411018	IN
1923	2523	4423	201423	101423	tyu	ghj	tyughj	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1924	2524	4424	201424	101424	Alfred	Kasote	KasoteA	Alfred.Kasote@thyssenkrupp.com	10600488	90979	Import Export (Dept. Code: 7653 )	Import Export (Dept. Code: 7653 )	+91 20 66124692	Pune	Maharashtra	411018	IN
1925	2525	4425	201425	101425	Raman	Dey	DeyR	\N	\N	VISION ENGINEERS	VISION ENGINEERS	Cement	\N	Pune	Maharashtra	411018	IN
1926	2526	4426	201426	101426	Amit	Roy	RoyA	Amit.Roy@thyssenkrupp.com	10601425	90980	BOILER  SELLING (Dept Code: 2002)	BOILER  SELLING (Dept Code: 2002)	020 6612 4582	Pimpri	Maharashtra	411018	IN
1927	2527	4427	201427	101427	Balu	Dange	DangeB	Balu.Dange@tkiidc.com	\N	1792411	DESIGN & ENGINEERING  STRUCTURAL (Dept Code: 7305)	DESIGN & ENGINEERING  STRUCTURAL (Dept Code: 7305)	+91 20 6612 4453	Pune	Maharashtra	411 018	IN
1928	2528	4428	201428	101428	Jyothish	Pillai	PillaiJ	Jyothish.Pillai@thyssenkrupp.com	10500209	90970	Services ? After Sales  (Dept. Code: 7807)	Services ? After Sales  (Dept. Code: 7807)	\N	Pune	Maharashtra	411018	IN
1929	2529	4429	201429	101429	Kesavan	Kaliappan	KaliappanK	Kesavan.Kaliappan@thyssenkrupp.com	10598005	90976	Services (Dept Code. 7807)	Services (Dept Code. 7807)	\N	Pune	Maharashtra	411018	IN
1930	2530	4430	201430	101430	Surya	Pillai	PillaiS	Surya.Pillai@thyssenkrupp.com	\N	PFS263	Services (Dept Code 7807)	Services (Dept Code 7807)	+91 20 6612 4438	Pune	Maharashtra	411018	IN
1931	2531	4431	201431	101431	Abhijit	Thorat	ThoratAT	Abhijit.Thorat@tkiidc.com	\N	PFS269	Stores  (Dept. Code:  7752)	Stores & Despatch	\N	Pune	Maharashtra	411018	IN
1932	2532	4432	201432	101432	Milind	Navare	NavareM	Milind.Navare@thyssenkrupp.com	10603858	90982	Commercial (Dept. Code:7630)	Commercial (Dept. Code:7630)	+91 20 6612 4022	Pune	Maharashtra	411018	IN
1933	2533	4433	201433	101433	Sobhan	Gudduri	GudduriS	Sobhan.Gudduri@thyssenkrupp.com	10603859	90983	SMB (Dept. Code :5704)	SMB (Dept. Code :5704)	\N	Pune	Maharashtra	411018	IN
1934	2534	4434	201434	101434	Services	VLJ Mechanical	VLJ_Mech	servicesvlj.mech@thyssenkrupp.com	\N	\N	\N	Site SWML Barmer	\N	\N	\N	\N	\N
1935	2535	4435	201435	101435	Services	VLJ  EI	VLJ_EI	servicesvlj.ei@thyssenkrupp.com	\N	\N	\N	O&M of Pet Coke Handling System.	\N	\N	\N	\N	\N
1936	2536	4436	201436	101436	Services	VLJ  HSE	VLJ_Hse	servicesvlj.hse@thyssenkrupp.com	\N	\N	\N	O&M of Pet Coke Handling System.	\N	\N	\N	\N	\N
1937	2537	4437	201437	101437	Tamidela	Reddy	ReddyT	Tamidela.Reddy@thyssenkrupp.com	10602624	35105	Hyderabad Office - PPC	Hyderabad Office - PPC	\N	Pune	Maharashtra	411018	IN
1938	2538	4438	201438	101438	Pallaviy	Purandarre	PurandarreP	Pallaviy.Purandarre@thyssenkrupp.com	10482297	90685	Project Management (Dept. code : 9704) New-ID	PM_Planning_9704	+91 20 6612 4795	Pune	Maharashtra	400018	IN
1939	2539	4439	201439	101439	Shravan	Tripathi	TripathiS	Shravan.Tripathi@thyssenkrupp.com	10500247	60092	Services (Dept Code. 7807)	Services (Dept Code. 7807)	+91 20 2742 4575	Pune	Maharashtra	411018	IN
1940	2540	4440	201440	101440	Pooja	Ingale	IngaleP	Pooja.Ingale@thyssenkrupp.com	\N	PFS-272	Personnel & HRD	Personnel & HRD	+91 20 66124476	Pune	Maharashtra	411018	IN
1941	2541	4441	201441	101441	Kavita	Choudhary	ChoudharyK	Kavita.Choudhary@thyssenkrupp.com	10604497	91100	Estimation(Dept. Code:7620)	Estimation(Dept. Code:7620)	+91 20 66124125	Pune	Maharashtra	411018	IN
1942	2542	4442	201442	101442	Pradeep	Vadakeveedu	VadakeveeduP	Pradeep.Vadakeveedu@thyssenkrupp.com	10604738	90984	PPP (Dept Code: 5061)	WORKSHOP SUPERVISORS (Dept Code: 5061)	+91 20 6612 4428	Pune	Maharashtra	411018	IN
1943	2543	4443	201443	101443	Sumedh	Deshpande	DeshpandeSM	Sumedh.Deshpande@thyssenkrupp.com	10598377	11681	Services  (Dept. Code: 7804 )	Construction (Dept. Code: 7804)	\N	Pune	Maharashtra	411018	IN
1944	2544	4444	201444	101444	Rakesh	Gupta	GuptaR	Rakesh.Gupta@thyssenkrupp.com	10619328	60215	Construction dept ? 7804	Construction dept ? 7804	\N	Pune	Maharashtra	411018	IN
1945	2545	4445	201445	101445	Digvijay	Chundawat	ChundawatD	Digvijay.Chundawat@thyssenkrupp.com	10619330	60218	Construction dept ? 7804	Construction dept ? 7804	\N	Pune	Maharashtra	411018	IN
1946	2546	4446	201446	101446	Services	VLJ Mechanical Rodding	VLJ_Mech_RD	servicesvlj.mech.rd@thyssenkrupp.com	\N	\N	\N	Site SWML Barmer	\N	\N	\N	\N	\N
1947	2547	4447	201447	101447	Services	VLJ  EI Rodding	VLJ_EI_RD	servicesvlj.ei.rd@thyssenkrupp.com	\N	\N	\N	O&M of Pet Coke Handling System.	\N	\N	\N	\N	\N
1948	2548	4448	201448	101448	Services	VLJ Mechanical GAP	VLJ_Mech_GAP	servicesvlj.mech.gap@thyssenkrupp.com	\N	\N	\N	Site SWML Barmer	\N	\N	\N	\N	\N
1949	2549	4449	201449	101449	Services	VLJ  EI GAP	VLJ_EI_GAP	servicesvlj.ei.gap@thyssenkrupp.com	\N	\N	\N	Site SWML Barmer	\N	\N	\N	\N	\N
1950	2550	4450	201450	101450	Services	VLJ Mechanical BO	VLJ_Mech_BO	servicesvlj.mech.bo@thyssenkrupp.com	\N	\N	\N	Mech Maintenance Team	\N	\N	\N	\N	\N
1953	2553	4453	201453	101453	Vishal	More	MoreV	Vishal.More@tkiidc.com	10488597	PFS277	Manufacturing (Dept Code:5005)	Manufacturing (Dept Code:5005)	+91 20 2742 4415	Pune	Maharashtra	411018	IN
1954	2554	4454	201454	101454	Hitesh	Tamore	TamoreH	Hitesh.Tamore@tkiidc.com	\N	PFS258	Stores & Despatch (Dept.Code:7752)	Stores & Despatch	\N	Pune	Maharashtra	411018	IN
1955	2555	4455	201455	101455	Jayesh	Khune	KhuneJ	Jayesh.Khune@thyssenkrupp.com	10605888	90986	FGD Equipment Design (Dept. 7335)	FGD Equipment Design (Dept. 7335)	+91 206612 4150	Pune	Maharashtra	411018	IN
1956	2556	4456	201456	101456	Aditi	Talewar	TalewarA	Aditi.Talewar@thyssenkrupp.com	10605896	90987	PM_Planning_9704	PM_Planning_9704	+91 20 6612 4179	Pune	Maharashtra	400018	IN
1957	2557	4457	201457	101457	Harshada	Joshi	JoshiH	Harshada.Joshi@thyssenkrupp.com	10605881	91118	Estimation (Dept. Code:7620)	Estimation (Dept. Code:7620)	+91 20 27424027	Pune	Maharashtra	411018	IN
1958	2558	4458	201458	101458	Umesh	Dhapre	DhapreU	Umesh.Dhapre@thyssenkrupp.com	\N	PFS278	Purchsse-Material (Dept. Code: 7712 )	Purchsse-Material (Dept. Code: 7712 )	+91 20 2742 4325	Pune	Maharashtra	411018	IN
1959	2559	4459	201459	101459	Rahul	Patil	Patil_R	Rahul.Patil@tkiidc.com	10600486	PFS264	PPC Planning(Dept Code:5002)	PPC Planning(Dept Code:5002)	020 6612 4422	Pune	Maharashtra	411018	IN
1960	2560	4460	201460	101460	JinnyM	Joseph	JosephJM	JinnyM.Joseph@thyssenkrupp.com	\N	70033	FINANCE  BILLING (Dept Code: 7603)	FINANCE  BILLING (Dept Code: 7603)	\N	Pune	Maharashtra	411018	IN
1961	2561	4461	201461	101461	Shrishail	Hiratot	HiratotS	Shrishail.Hiratot@tkiidc.com	10600486	PFS-265	Preparatory .Manufacturing (Dept Code:5003)	Preparatory .Manufacturing (Dept Code:5003)	\N	Pune	Maharashtra	411018	IN
1962	2562	4462	201462	101462	Prashant	Patil	PatilPS	Prashant.Patil@tkiidc.com	\N	PFS279	WORKSHOP  P.P.PLANNING (Dept Code: 5002)	WORKSHOP  P.P.PLANNING (Dept Code: 5002)	+91 20 6612 4413	Pune	Maharashtra	411018	IN
1963	2563	4463	201463	101463	Mayuresh	Kumbhar	KumbharM	\N	\N	11684	Preparatory .Manufacturing (Dept Code:5003)	Preparatory .Manufacturing (Dept Code:5003)	+91 20 2742 4379	Pune	Maharashtra	411018	IN
1964	2564	4464	201464	101464	Muthukrishnan	CV	CVMuthukrishnan	\N	\N	90972	Services (Dept Code. 7807)	Services (Dept Code. 7807)	+91 20 66124575	Pune	Maharashtra	411018	IN
1965	2565	4465	201465	101465	Amruta	Deshpande	DeshpandeAA	\N	\N	90580	Estimation (Dept. Code:7620)	Estimation (Dept. Code:7620)	+91 20 6612 4027	Pune	Maharashtra	411018	IN
1966	2566	4466	201466	101466	Prateek	Prasoon	PrasoonP	\N	\N	90936	SMB-SALES & MARKETING 5702	SMB-SALES & MARKETING 5702	\N	\N	\N	\N	\N
1967	2567	4467	201467	101467	Pranjul	Tyagi	TyagiP	\N	\N	11620	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4885	Pune	Maharashtra	411018	IN
1968	2568	4468	201468	101468	Pavan	Tikate	TikateP	\N	\N	90873	Structural Design	Structural Design	+91 20 6612 4828	Pune	Maharashtra	411018	IN
1969	2569	4469	201469	101469	Shubham	Patil	Patil_S	\N	\N	11651	Manufacturing (Dept Code:5003)	Preparatory .Manufacturing (Dept Code:5003)	+91 20 6612 4379	Pune	Maharashtra	411018	IN
1970	2570	4470	201470	101470	Akash	Botre	BotreA	\N	\N	11653	MFS - (5005)	MFS - 5005	+91 20 2742 4415	Pune	Maharashtra	411018	IN
1971	2571	4471	201471	101471	Kapil	Kanunje	KanunjeK	\N	\N	90430	PPC Dept	PPC Dept	+91 20 6612 4388	Pune	Maharashtra	411018	IN
1972	2572	4472	201472	101472	Ganesh	Bhokare	BhokareG	\N	\N	PFS-238	Stores  (Dept. Code:  7752)	Stores & Despatch	020 6612 4277	Pune	Maharashtra	411018	IN
1973	2573	4473	201473	101473	Anil	Kandale	KandaleA	\N	\N	9742	CEMENT  SELLING (Dept Code: 6002)	Proposal Engineering Group (Dept Code: 6003)	+91 20 6612 4848	Pune	Maharashtra	411018	IN
1974	2574	4474	201474	101474	Khaladkar	Vilas	KhaladkarV	\N	\N	5400	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4489	Pune	Maharashtra	411018	IN
1975	2575	4475	201475	101475	Bibek	Bhola	BholaB	Bibek.Bhola@thyssenkrupp.com	10603798	90981	Services ? After Sales  (Dept. Code: 7807)	Services ? After Sales  (Dept. Code: 7807)	\N	Pune	Maharashtra	411018	IN
1976	2576	4476	201476	101476	Pankaj	Jadhav	JadhavPV	Pankaj.Jadhav@thyssenkrupp.com	10599587	11682	MANUFACTURING (Dept. Code 5030)	Manufacturing (Dept Code:5020)	\N	Pune	Maharashtra	411018	IN
1977	2577	4477	201477	101477	Suraj	Pawar	PawarSS	\N	\N	PFS-254	PPC Dept (Dept Code: 5002 )	PPC Dept (Dept Code: 5002 )	+91 20 6612 4851	Pune	Maharashtra	411018	IN
1978	2578	4478	201478	101478	Manas	Das	DasMR	Manas.Das@thyssenkrupp.com	10104075	90985	Services Dept Code 7807	Services (Dept Code 7807)	\N	Pune	Maharashtra	411018	IN
1979	2579	4479	201479	101479	Amey	Dongare	DongareAR	Amey.Dongare@thyssenkrupp.com	10607596	11690	WORKSHOP SUPERVISORS (Dept Code: 5061)	WORKSHOP SUPERVISORS (Dept Code: 5061)	+91 20 6612 4379	Pune	Maharashtra	411018	IN
1980	2580	4480	201480	101480	Mangesh	Mahamuni	MahamuniM	\N	\N	VISION ENGINEERS	VISION ENGINEERS	Cement	\N	Pune	Maharashtra	411018	IN
1981	2581	4481	201481	101481	Vishal	Naikwade	NaikwadeV	\N	\N	11667	MHE Systems	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 2742 4864	Pune	Maharashtra	411018	IN
1982	2582	4482	201482	101482	Boiler	Guest	Boiler_Guest	\N	\N	\N	For Draftsman from Outside Agency	Boiler	\N	Pune	\N	411018	IN
1983	2583	4483	201483	101483	Bepsy	Dumasia	DumasiaB	\N	\N	90793	Mumbai Office	Mumbai Office	\N	\N	\N	\N	\N
1984	2584	4484	201484	101484	test	\N	testA	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1985	2585	4485	201485	101485	Mukul	Sheth	ShethM	\N	\N	11683	PPC Dept	PPC Dept	+91 20 6612 4816	Pune	Maharashtra	411018	IN
1986	2586	4486	201486	101486	Shreyas	Deshpande	DeshpandeS	\N	\N	11650	HFS HALL NO 10 (Dept Code: 5004)	HFS HALL NO 10 (Dept Code: 5004)	+91 20 6612 4749	Pune	Maharashtra	411018	IN
1987	2587	4487	201487	101487	Kumaresan	Subbiramani	SubbiramaniK	\N	\N	90943	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4042	Pune	Maharastra	411018	IN
1988	2588	4488	201488	101488	Yash	Chavan	ChavanY	\N	\N	11657	ENGG./EXECUTION INSTRUMENTATION (Dept Code: 7404)	ENGG./EXECUTION INSTRUMENTATION (Dept Code: 7404)	+91 20 6612 4577	Pune	Maharashtra	411018	IN
1989	2589	4489	201489	101489	Rahul	Panicker	PanickerR	\N	\N	11544	Services (Dept Code. 7807)	Services (Dept Code. 7807)	\N	Pune	Maharashtra	411018	IN
1990	2590	4490	201490	101490	Paritosh	Kumar	Kumar_P	\N	\N	90988	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 2742 4042	Pune	Maharashtra	411018	IN
1991	2591	4491	201491	101491	Shrishal	Hirthot	HirthotS	\N	\N	PFS265	Preparatory .Manufacturing (Dept Code:5003)	Preparatory .Manufacturing (Dept Code:5003)	\N	Pune	Maharashtra	411018	IN
1995	2595	4495	201495	101495	Prajyot	Pomannawar	PomannawarP	\N	\N	11658	QUALITY-Assurance (Dept Code:5403)	Quality Assurance (Production)	\N	Pune	Maharashtra	411018	IN
1996	2596	4496	201496	101496	Nikhil	Shingade	ShingadeN	\N	\N	11665	DESIGN & ENGINEERING  STRUCTURAL (Dept Code: 7305)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	4828	Pune	Maharashtra	411018	IN
1997	2597	4497	201497	101497	Sumit	Bhosale	BhosaleSJ	\N	\N	11675	Services  (Dept. Code: 7804)	Services  (Dept. Code: 7804)	\N	Pune	Maharashtra	411018	IN
1998	2598	4498	201498	101498	Pushkaraj	Mahadwar	MahadwarP	\N	\N	11672	Cement Engineering .(Dept Code: 6008)	Cement Engineering .(Dept Code: 6008)	+91 20 6612 4898	Pune	Maharashtra	411018	IN
1999	2599	4499	201499	101499	Pankaj	Pawar	PawarP	\N	\N	98071	Fabrication (Dept. Code 5551)	Fabrication (Dept. Code 5551)	\N	\N	\N	\N	\N
2000	2600	4500	201500	101500	Arun	Ravindranath	RavindranathA	\N	\N	90247	Services	Services Dept.	\N	Pune	Maharashtra	411018	IN
2001	2601	4501	201501	101501	Mosuganti	Subhakar	SubhakarM	\N	\N	98068	Hyderabad Office ( Dept. Code 5554)	Hyderabad Office ( Dept. Code 5554)	\N	Pune	Maharashtra	411018	IN
2002	2602	4502	201502	101502	Sneha	Mahalle	MahalleS	\N	\N	90833	ENGG./EXECUTION INSTRUMENTATION (Dept Code: 7404)	ENGG./EXECUTION INSTRUMENTATION (Dept Code: 7404)	+ 91 020 6612 4015	Pune	Maharashtra	411018	IN
2003	2603	4503	201503	101503	Prachita	Mane	ManePN	\N	\N	90821	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	Electrical Department	+ 91 020 6612 4703	Pune	Maharashtra	411018	IN
2004	2604	4504	201504	101504	Sagar	Nakhate	NakhateS	\N	\N	90973	services (Dept code: 7807)	Services dept ( Dept. Code 7807 )	+91 20 2742 4673	Pune	Maharashtra	411018	IN
2005	2605	4505	201505	101505	Anilkumar	Jha	JhaA	\N	\N	90014	Contract Management.	PM_Planning_9704	+91 20 66124480	Pune	Maharashtra	411018	IN
2006	2606	4506	201506	101506	Abhijit	Latthe	LattheA	\N	\N	90034	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	+91 20 6612 4452	Pune	Maharashtra	411018	IN
2007	2607	4507	201507	101507	Kiran	Barathe	BaratheK	Kiran.Barathe@thyssenkrupp.com	10609271	PFS248	FINANCE  BILL PASSING (Dept Code: 7604)	FINANCE  BILL PASSING (Dept Code: 7604)	+91 20 2742 4744	Pune	Maharashtra	411018	IN
2008	2608	4508	201508	101508	Vasudev	Dange	DangeV	Vasudev.Dange@thyssenkrupp.com	\N	PFS287	QUALITY-  PRODUCTION (Dept Code: 5403)	QUALITY-  PRODUCTION (Dept Code: 5403)	\N	Pune	Maharashtra	411018	IN
2009	2609	4509	201509	101509	Abhijeet	Keskar	KeskarA	Abhijeet.Keskar@thyssenkrupp.com	10609810	90990	MHE ? DIVISION - MINERAL PROCESSING Dept 3008	MHE ? DIVISION - MINERAL PROCESSING Dept 3008	+91 20 6612 4076	Pune	Maharashtra	411018	IN
2010	2610	4510	201510	101510	Tkiiservices	RiljsezHse	Riljsez_Hse	tkiiservicesriljsez.hse@thyssenkrupp.com	\N	\N	\N	\N	\N	\N	\N	\N	\N
2011	2611	4511	201511	101511	Tkiiservices	RiljsezEi	Riljsez_Ei	tkiiservicesriljsez.ei@thyssenkrupp.com	\N	\N	\N	\N	\N	\N	\N	\N	\N
2012	2612	4512	201512	101512	Sayali	Patil	PatilSD	Sayali.Patil@thyssenkrupp.com	10609714	40824	Sugar Division	Sugar Division	+91 20 2742 4592	Pune	Maharashtra	411018	IN
2013	2613	4513	201513	101513	Ganesh	Patil	PatilG	\N	\N	40821	Cement Design & Engineering (Dept Code: 6005)	Cement Design & Engineering (Dept Code: 6005)	+91 20 2742 4735	Pune	Maharashtra	411018	IN
2014	2614	4514	201514	101514	Avinash	Patil	PatilAG	Avinash.Patil@tkiidc.com	10609713	40823	WORKSHOP  P.P.PLANNING (Dept Code: 5002)	WORKSHOP  P.P.PLANNING (Dept Code: 5002)	+9120 6612 4890	Pune	MH	411018	IN
2015	2615	4515	201515	101515	Sanagala	Mahesh	MaheshS	sanagala.mahesh@thyssenkrupp.com	10610193	35108	Hyderabad Office	Hyderabad Office	\N	Pune	Maharashtra	411018	IN
2016	2616	4516	201516	101516	Abhishek	Ghutukade	GhutukadeA	Abhishek.Ghutukade@thyssenkrupp.com	10609712	40822	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	+91 20 6612 4057	Pune	Maharashtra	411018	IN
2017	2617	4517	201517	101517	Bahubali	Narasagond	NarasagondB	\N	\N	15974	Services Dept. (Dept. Code: 7802)	Services Dept. (Dept. Code: 7802)	+91 20 6612 4102	Pune	Maharashtra	411018	IN
2018	2618	4518	201518	101518	Amol	Khot	KhotAS	Amol.Khot@thyssenkrupp.com	10482291	60216	Services  (Dept. Code: 7804)	Services  (Dept. Code: 7804)	\N	Pune	Maharashtra	411018	IN
2019	2619	4519	201519	101519	Amol	Ambhore	AmbhoreA	\N	\N	90975	Workshop	Workshop Supervisors	+91 20 6612 4395	Pune	Maharashtra	411018	IN
2020	2620	4520	201520	101520	Oudesh	Didwania	DidwaniaO	\N	\N	90638	Services	Services Dept.	020 6612 4839	Pune	Maharashtra	411 018	IN
2021	2621	4521	201521	101521	Naveen	Gupta	GuptaN	\N	\N	90486	Services  (Dept. Code:7804  )	Services Dept.	+91 20 6612 4550	Pune	Maharashtra	411018	IN
2022	2622	4522	201522	101522	Shubham	Jadhav	JadhavS	\N	\N	40743	WORKSHOP  P.P.PLANNING (Dept Code: 5002)	WORKSHOP  P.P.PLANNING (Dept Code: 5002)	+91 20 6612 4851	Pune	Maharashtra	411018	IN
2023	2623	4523	201523	101523	Bappa	Karmakar	KarmakarB	\N	\N	90613	Kolkata Office	Kolkata Office	033 6605 5220	Pune	Maharashtra	411018	IN
2024	2624	4524	201524	101524	Vidyadhar	Konkeri	KonkeriV	\N	\N	9478	MHE  EXECUTION (Dept Code: 3004)	MHE  EXECUTION (Dept Code: 3004)	+91 20 6612 4567	Pune	Maharashtra	411018	IN
2025	2625	4525	201525	101525	Tamal	Das	Das_T	Tamal.Das@thyssenkrupp.com	10609539	90989	Kolkata Office	Kolkata Office	033 6605 5219	Pune	Maharashtra	411018	IN
2026	2626	4526	201526	101526	Rabindranath	Basuroy	BasuroyR	Rabindranath.Basuroy@tkiidc.com	\N	PFS890	Kolkata Office	Kolkata Office	\N	Pune	Maharashtra	411018	IN
2027	2627	4527	201527	101527	Purnendu	Mohanty	MohantyP	Purnendu.Mohanty@tkiidc.com	\N	PFS889	Kolkata Office	Kolkata Office	\N	Pune	Maharashtra	411018	IN
2028	2628	4528	201528	101528	Jayashri	Naikawadi	NaikawadiJ	jayashri.naikawadi@tkiidc.com	10609710	40820	ADMINISTRATION (Dept Code: 7009)	ADMINISTRATION (Dept Code: 7009)	\N	Pune	Maharashtra	411018	IN
2029	2629	4529	201529	101529	Rahul	Parab	ParabR	\N	\N	90540	Mech. Maintenance Dept.	Mech. Maintenance Dept.	\N	Pune	Maharashtra	411018	IN
2030	2630	4530	201530	101530	Nagraj	Kamat	KamatN	\N	\N	90656	Services	SERVICES  CEMENT DIVISION	+91 20 6612 4192	Pune	Maharashtra	411018	IN
2031	2631	4531	201531	101531	Ujjwal	Zamindar	ZamindarU	\N	\N	90688	Contracts Management	PM_Planning_9704	+91 20 6612 4796	Pune	Maharashtra	\N	IN
2032	2632	4532	201532	101532	Ashish	Kinkar	KinkarA	\N	\N	90947	Boiler Services R&R (7808)	Boiler Services R&R (7808)	\N	Pune	Maharashtra	411018	IN
2033	2633	4533	201533	101533	Vinay	Boddu	BodduV	\N	\N	90721	Services	SERVICES	+91 20 6612 4743	Pune	Maharashtra	411018	IN
2034	2634	4534	201534	101534	Aniket	Nale	NaleA	\N	\N	90884	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 206612 4486	Pune	Maharashtra	411018	IN
2035	2635	4535	201535	101535	Suresh	Agasti	AgastiSC	suresh.agasti@thyssenkrupp.com	10504499	90852	MD Office	MD Office	+91 20 6612 4103	Pune	Maharashtra	411018	IN
2036	2636	4536	201536	101536	Shrikant	Gudda	GuddaS	\N	\N	1792428	Design	Design	\N	\N	\N	\N	\N
2037	2637	4537	201537	101537	Nilesh	Dhembare	DhembareN	\N	\N	PFS167	FINANCE (Dept Code : 7604)	Finance	\N	Pune	Maharashtra	411018	IN
2038	2638	4538	201538	101538	Suyash	Sharma 	SharmaSK	\N	\N	90778	Quality ? Subcontract	Quality ? Subcontract	\N	Pune	Maharashtra	411018	IN
2039	2639	4539	201539	101539	Vijay	Bhave	BhaveV	\N	\N	5220	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	+91 20 6612 4057	Pune	Maharashtra	411018	IN
2040	2640	4540	201540	101540	Hariprasanna	B	HariprasannaB	\N	\N	90488	BOILER  ENGINEERING (Dept Code: 2003)	BOILER  ENGINEERING (Dept Code: 2003)	+91 20 66124604	Pune	Maharashtra	411018	IN
2041	2641	4541	201541	101541	Vinit	Jagnade	JagnadeV	\N	\N	90795	BOILER  ENGINEERING (Dept Code: 2003)	BOILER  ENGINEERING (Dept Code: 2003)	+91 20 6612 4457	Pune	Maharashtra	411018	IN
2042	2642	4542	201542	101542	Gaurav	Sancheti	SanchetiG	gaurav.sancheti@thyssenkrupp.com	10611877	90993	WORKSHOP SUPERVISORS (Dept Code: 5061)	WORKSHOP SUPERVISORS (Dept Code: 5061)	+91 20 66124423	Pune	Maharashtra	411018	IN
2043	2643	4543	201543	101543	Sagar	Randive	RandiveS	sagar.randive@thyssenkrupp.com	\N	PFS293	Project Management - Boiler	Project Management - Boiler	+91 20 6612 4856	Pune	Maharashtra	411018	IN
2044	2644	4544	201544	101544	Pravakar	Chakraborty	Chakraborty_P	pravakar.chakraborty@thyssenkrupp.com	10611134	90992	Services	Services	\N	Pune	Maharashtra	411018	IN
2045	2645	4545	201545	101545	Yuvraj	Patil	PatilYS	YuvrajS.Patil@thyssenkrupp.com	10488235	2019	MANUFACTURING Machine shop (Dept.Code 5061)	MANUFACTURING Machine shop (Dept.Code 5061)	+91 20 66124812	Pune	Maharashtra	411018	IN
2046	2646	4546	201546	101546	Nilesh	Londhe	LondheN	\N	\N	11691	MANUFACTURING (Dept Code. 5020)	MANUFACTURING (Dept Code. 5020)	+91 20 6612 4809	Pune	Maharashtra	411018	IN
2047	2647	4547	201547	101547	Jacob	David	DavidJ	jacob.david@thyssenkrupp.com	10612729	90994	BOILER  ENGINEERING (Dept Code: 2003)	BOILER  ENGINEERING (Dept Code: 2003)	020 6612 4593	\N	\N	\N	\N
2048	2648	4548	201548	101548	Digambar	Jadhav	JadhavD	Digambar.Jadhav.external@thyssenkrupp.com	10522013	PFS292	D & E - Structural Dept ( Dept Code 7305)	Structural Design (Dep Code: 7305)	+91 20 66124710	Pune	Maharashtra	411018	IN
2049	2649	4549	201549	101549	Vishwas	Hulle	HulleV	vishwas.hulle.external@thyssenkrupp.com	\N	PFS294	DESIGN & ENGINEERING  STRUCTURAL (Dept code-7305)	DESIGN & ENGINEERING  STRUCTURAL (Dept code-7305)	020 6612 4639	Pune	Maharashtra	411018	IN
2050	2650	4550	201550	101550	Koushik	Chatterjee	ChatterjeeK	koushik.chatterjee@thyssenkrupp.com	10611034	90991	Boiler Services R&R (7808)	Boiler Services R&R (7808)	\N	Pune	Maharashtra	411018	IN
2051	2651	4551	201551	101551	Mohammad	Niyaz	NiyazM	\N	\N	Orbit	T&IS - Orbit	\N	\N	Pune	Maharashtra	411018	IN
2052	2652	4552	201552	101552	Keyur	Khole	kholeK	\N	\N	Orbit	T&IS - Orbit	\N	\N	Pune	Maharashtra	411018	IN
2053	2653	4553	201553	101553	Amar	Fartare	FartareA	\N	10612380	\N	Tech Center	Tech Center	\N	Pune	Maharashtra	411018	IN
2054	2654	4554	201554	101554	Manish	Kumar	Kumar_M	manish.kumar.external@thyssenkrupp.com	10612453	\N	Tech Center	Tech Center	\N	Pune	Maharashtra	411018	IN
2055	2655	4555	201555	101555	Sagar	Shrivastav	ShrivastavS	Sagar.Shrivastav.external@thyssenkrupp.com	10612452	\N	Tech Center	Tech Center	\N	Pune	Maharashtra	411018	IN
2056	2656	4556	201556	101556	Pravin	Jagtap	JagtapPG	pravin.jagtap.external@thyssenkrupp.com	10488622	PFS330	SERVICES  BOILER DIVISION	SERVICES  BOILER DIVISION	+91 20 6612 4856	Pune	Maharashtra	411018	IN
2057	2657	4557	201557	101557	Om	Prakash	PrakashOm	om.prakash.external@thyssenkrupp.com	10445706	OT1165	Delhi Office	Kolkata Office	\N	Pune	Maharashtra	411018	IN
2058	2658	4558	201558	101558	Swapnil	Jagtap	Jagtap_S	Swapnil.Jagtap@thyssenkrupp.com	10613897	90996	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	+91 20 6612 4899	Pune	Maharashtra	411018	IN
2059	2659	4559	201559	101559	Gaurav	Badhe	BadheG	\N	\N	11623	CEMENT  DESIGN & ENGINEERING (Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4486	Pune	Maharashtra	411018	IN
2060	2660	4560	201560	101560	Abhay	Thampy	ThampyA	\N	\N	11645	Services (dept ? 7805)	Services (dept ? 7805)	\N	Pune	Maharashtra	411018	IN
2061	2661	4561	201561	101561	Shailesh	Umap	UmapS	\N	\N	90027	Services division	Services division	+91 20 6612 4075	Pune	Maharashtra	411018	IN
2062	2662	4562	201562	101562	Ashwini	Patil	SalgondA	\N	\N	90134	SUGAR  ENGINEERING (Dept Code: 4003)	SUGAR  ENGINEERING (Dept Code: 4003)	+91 20 6612 4885	Pune	Maharashtra	411018	IN
2063	2663	4563	201563	101563	Mohammad	Imrankhan	ImrankhanM	\N	\N	90997	Construction Services (Dept.Code: 7805)	Construction Services (Dept.Code: 7805)	\N	Pune	Maharashtra	411018	IN
2064	2664	4564	201564	101564	Prasad	Asabe	AsabeP	prasad.asabe@thyssenkrupp.com	10615020	11693	MANUFACTURING Mech Assly (Dept Code. 5061)	MANUFACTURING Mech Assly (Dept Code. 5061)	\N	Pune	Maharashtra	411018	IN
2065	2665	4565	201565	101565	Nilesh	Kesarkar	KesarkarN	nilesh.kesarkar.external@thyssenkrupp.com	\N	PFS300	FINANCE  BILLING (Dept Code: 7603)	FINANCE  BILLING (Dept Code: 7603)	+91 20 6612 4773	Pune	Maharashtra	\N	IN
2066	2666	4566	201566	101566	Vutla	Prakash	PrakashV	Vutla.Prakash@thyssenkrupp.com	10614719	35111	Hyderabad Office	Hyderabad Office	040-2794 1462	Hyderabad	Maharashtra	411018	IN
2067	2667	4567	201567	101567	Sudhir	Balghare	BalghareS	Sudhir.Balghare@tkiidc.com	10507479	1792473	Design & Engineering (Dept Code: 7305)	Design & Engineering(Dept Code: 7305)	\N	Pune	Maharashtra	411018	IN
2068	2668	4568	201568	101568	Gaurav	Hasbe	HasbeG	gaurav.hasbe.external@thyssenkrupp.com 	10507479	1792508	Design & Engineering(Dept Code: 7305)	Design & Engineering(Dept Code: 7305)	020 6612 4629	Pune	Maharashtra	411018	IN
2069	2669	4569	201569	101569	Saurabh	Jadhav	JadhavSS	Saurabh.Jadhav@thyssenkrupp.com	10615021	11695	Engineer in Fabrication (Dept. 5004)	Engineer in Fabrication (Dept. 5004)	+91 20 6612 4748/4821	Pune	Maharashtra	411018	IN
2070	2670	4570	201570	101570	Mahesh	Pawar	PawarMB	Mahesh.Pawar@thyssenkrupp.com	10615019	11694	Engineer in Mechanical Assembly (Dept 5006)	Engineer in Mechanical Assembly (Dept 5006)	+91 20 6612 4407	Pune	Maharashtra	411018	IN
2071	2671	4571	201571	101571	Sajal	Akhuli	AkhuliS	Sajal.Akhuli@thyssenkrupp.com	10613476	90995	Construction dept ( Dept. Code 7804 )	Services dept ( Dept. Code 7804 )	\N	Pune	Maharashtra	411018	IN
2072	2672	4572	201572	101572	Nusrat	Anzar	AnzarN	nusrat.anzar.external@thyssenkrupp.com	\N	PFS302	BOILER  DESIGN (Dept Code: 2000)	BOILER  DESIGN Dept Code: 2000)	+91 20 6612 4064	\N	\N	\N	\N
2073	2673	4573	201573	101573	Pramod	Sawant	SawantP	pramod.sawant.external@thyssenkrupp.com	10616007	PFS303	FINANCE  BILL PASSING (Dept Code: 7604)	FINANCE  BILL PASSING (Dept Code: 7604)	+91 20 6612 4117	Pune	Maharashtra	411018	IN
2074	2674	4574	201574	101574	Payal	Pardeshi	PardeshiP	payal.pardeshi.external@thyssenkrupp.com	\N	PFS301	Personnel & HRD	Personnel & HRD	+91 20 6612  4515	Pune	Maharashtra	411018	IN
2075	2675	4575	201575	101575	PM	PRISM	PMPRISM	PMTKII.PRISM@thyssenkrupp.com	\N	\N	\N	Boiler	\N	Pune	Maharashtra	411018	IN
2076	2676	4576	201576	101576	Bodakunta	Kishore	KishoreB	bodakunta.kishore@thyssenkrupp.com	10616568	35113	Hyderabad Office (5502)	Hyderabad Office	040-2794 1430	Pune	Maharashtra	411018	IN
2077	2677	4577	201577	101577	Shivam	Sudarshan	SudarshanS	Shivam.Sudarshan@thyssenkrupp.com	10616535	90998	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	+91 20 6612  4726	Pune	Maharastra	411018	IN
2078	2678	4578	201578	101578	Dhiresh	Kumar	KumarDB	\N	\N	90524	Services	SERVICES  BOILER DIVISION	\N	Pune	Maharashtra	411018	IN
2079	2679	4579	201579	101579	Indrashekhar	Sarkar	SarkarI	\N	\N	90725	CIVIL EXECUTION (Dept Code: 7202)	CIVIL EXECUTION (Dept Code: 7202)	\N	Pune	Maharashtra	411018	IN
2080	2680	4580	201580	101580	Pankaj	Mali	MaliP	\N	\N	PFS176	FINANCE  (Dept Code: 7604)	Finance	+91 20 6612 4117	Pune	Maharashtra	411018	IN
2081	2681	4581	201581	101581	Moumita	Ghosh	GhoshM	\N	\N	90819	Project Management (Dept. code : 9704)	PM_Planning_9704	+91 20 6612 4793	Pune	Maharashtra	400018	IN
2082	2682	4582	201582	101582	Pradnyesh	Bagade	BagadeP	\N	\N	11612	Centrifugal (Dept Code: 5007	Centrifugal (Dept Code: 5007	+91 20 6612 4403	Pune	Maharashtra	411018	IN
2083	2683	4583	201583	101583	Sagar	Omble	OmbleS	\N	\N	11607	Cement Dept. 6003	Plant Design (Post Order) Group (Dept Code: 6009)	+91 20 6612 4832	\N	\N	\N	\N
2084	2684	4584	201584	101584	Sonu	Kanthed	KanthedS	\N	\N	90877	CONSTRUCTION SERVICES - 7805	CONSTRUCTION SERVICES - 7805	\N	Pune	Maharashtra	411018	IN
2085	2685	4585	201585	101585	Machavarapu	Subhash	SubhashM	machavarapu.subhash@thyssenkrupp.com	10616567	35112	Hyderabad Office	Hyderabad Office Fabrication (Dept Code 5524)	\N	Pune	Maharashtra	411018	IN
2086	2686	4586	201586	101586	Nandkishor	Matlabe	MatlabeN	\N	\N	PFS289	WORKSHOP  P.P.PLANNING (Dept Code: 5002)	WORKSHOP  P.P.PLANNING (Dept Code: 5002)	4422	Pune	\N	\N	IN
2087	2687	4587	201587	101587	Garud	Harshal	GarudH	\N	\N	PFS-212	DESIGN & ENGINEERING  STRUCTURAL (Dept Code: 7305)	DESIGN & ENGINEERING  STRUCTURAL (Dept Code: 7305)	+91 20 6612 4710	Pune	Maharashtra	411018	IN
2088	2688	4588	201588	101588	Suchita	Janjire	JanjireS	Suchita.Janjire@thyssenkrupp.com	10617278	91000	ENGG./EXECUTION INSTRUMENTATION ( Dept.Code 7404)	ENGG./EXECUTION INSTRUMENTATION ( Dept.Code 7404)	+91 20 66124703	Pune	Maharashtra	411018	IN
2089	2689	4589	201589	101589	Sangramsinh	Bhosale	BhosaleSS	Sangramsinh.Bhosale@thyssenkrupp.com	10617080	90999	Field Service (Dept.Code 7808)	Field Service (Dept.Code 7808)	\N	Pune	Maharashtra	411018	IN
2090	2690	4590	201590	101590	Vikrant	Luktuke	LuktukeV	Vikrant.Luktuke@thyssenkrupp.com	10617083	60059	Services (Dept Code. 7807)	Services (Dept Code. 7807)	\N	Pune	Maharashtra	411018	IN
2091	2691	4591	201591	101591	Atharva	Gholap	GholapA	Atharva.Gholap@thyssenkrupp.com	10617413	11698	Cement (Dept.6004)	Cement (Dept.6004)	020 6612 4832	Pune	Maharashtra	411018	IN
2092	2692	4592	201592	101592	Rushikesh	Pawar	PawarRR	Rushikesh.Pawar@Tkiidc.com	\N	PFS308	WORKSHOP  P.P.PLANNING (Dept Code: 5002)	WORKSHOP  P.P.PLANNING (Dept Code: 5002)	+ 91 20 6612 4495	Pune	Maharashtra	411018	IN
2093	2693	4593	201593	101593	Vishal	Pawar	PawarVS	Vishal.Pawar2@thyssenkrupp.com	10616249	11696	Manufacturing (Dept Code:5005)	Manufacturing (Dept Code:5005)	+ 91 20 6612  4415	Pune	Maharashtra	411018	IN
2094	2694	4594	201594	101594	Mandar	Pujari	PujariM	mandar.pujari@thyssenkrupp.com	10617411	11697	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4486	Pune	Maharashtra	411018	IN
2095	2695	4595	201595	101595	Deoyani	Tajane	TajaneD	Deoyani.Tajane@thyssenkrupp.com	10618250	11703	ENGG./EXECUTION INSTRUMENTATION (Dept Code: 7404)	ENGG./EXECUTION INSTRUMENTATION (Dept Code: 7404)	+91 20 6612 4015	Pune	Maharashtra	411018	IN
2096	2696	4596	201596	101596	Shubhangi	Vikhe	VikheS	Shubhangi.Vikhe@thyssenkrupp.com	10618249	11702	ENGG./EXECUTION INSTRUMENTATION (Dept Code: 7404)	ENGG./EXECUTION INSTRUMENTATION (Dept Code: 7404)	+91 20 6612 4703	Pune	Maharashtra	411018	IN
2097	2697	4597	201597	101597	Tanmay	Pharande	PharandeT	Tanmay.Pharande@thyssenkrupp.com	10618248	11700	Boiler Services R&R (7808)	Boiler Services R&R (7808)	91 20 6612 4520	Pune	Maharashtra	411018	IN
2098	2698	4598	201598	101598	Tanaji	Sutar	SutarT	Tanaji.Sutar@thyssenkrupp.com	10618253	91011	Services  (Dept. Code: 7807)	Services (Dept. Code: 7807)	020 6612 4510	Pune	Maharashtra	411018	IN
2099	2699	4599	201599	101599	Prasad	Deshpande	Deshpande_PP	\N	\N	90758	Structural Design	Structural Design	+91 20 6612 4778	Pune	Maharashtra	411018	IN
2100	2700	4600	201600	101600	Swapnil	Pilare	PilareS	Swapnil.Pilare@thyssenkrupp.com	10618280	91012	PM_Planning_9704	PM_Planning_9704	+91 20 6612 4480	Pune	Maharashtra	400018	IN
2101	2701	4601	201601	101601	Sarang	Chaudhari	ChaudhariS	Sarang.Chaudhari@thyssenkrupp.com	10618252	91010	WORKSHOP SUPERVISORS (Dept Code: 5061)	WORKSHOP SUPERVISORS (Dept Code: 5061)	\N	Pune	Maharashtra	411018	IN
2102	2702	4602	201602	101602	Panchatcharam	Rajaram	RajaramP	Panchatcharam.Rajaram@thyssenkrupp.com	10500262	60058	Services (Dept Code. 7807)	Services (Dept Code. 7807)	\N	Pune	Maharashtra	411018	IN
2103	2703	4603	201603	101603	Bharat	Surase	SuraseB	bharat.surase.external@thyssenkrupp.com	10426437	PFS312	Boht-Out (Dept. Code: 7702 )	Boht-Out (Dept. Code: 7702 )	+91 20 6612 4299	Pune	Maharashtra	411018	IN
2104	2704	4604	201604	101604	Shivshankar	Patil	PatilSL	shivshankar.patil.external@thyssenkrupp.com	10500209	PFS310	Services ? After Sales  (Dept. Code: 7807)	Services ? After Sales  (Dept. Code: 7807)	\N	Pune	Maharashtra	411018	IN
2105	2705	4605	201605	101605	Subrata	Biswas	Biswas_S	subrata.biswas@thyssenkrupp.com	10419564	\N	Tech Center	Tech Center	\N	Pune	Maharashtra	411018	IN
2106	2706	4606	201606	101606	Rohit	Gupta	Gupta_R	rohit.gupta@thyssenkrupp.com	10600518	OT1185	Tech Center	Tech Center	\N	Pune	Maharashtra	411018	IN
2107	2707	4607	201607	101607	Kiran	Chaudhary	ChaudharyK	kiran.chaudhary.external@thyssenkrupp.com	\N	PFS313	Boht-Out (Dept. Code: 7702 )	Boht-Out (Dept. Code: 7702 )	+91 20 6612 4567	Pune	Maharashtra	411018	IN
2108	2708	4608	201608	101608	Sumant	Thakur	ThakurS	Sumant.Thakur@thyssenkrupp.com	10446773	60061	Services  (Dept. Code: 7804)	Services  (Dept. Code: 7804)	\N	Pune	Maharashtra	411018	IN
2109	2709	4609	201609	101609	Abhay	Ghiranikar	GhiranikarA	Abhay.Ghiranikar@thyssenkrupp.com	10618872	91018	Commercial (Dept. Code:7711)	Director ? Commercial (Dept. Code:7711)	020 6612 4023	Pune	Maharashtra	411018	IN
2110	2710	4610	201610	101610	Rahul	Verma	VermaRK	Rahul.Verma@thyssenkrupp.com	10446767	60111	Construction (Dept. 7804)	Services (Dept.7804)	\N	Pune	Maharastra	411018	IN
2111	2711	4611	201611	101611	Printing	Test	TestP	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2112	2712	4612	201612	101612	Sagar	Talpe	TalpeS	sagar.talpe.external@thyssenkrupp.com	\N	PFS309	QUALITY-  PRODUCTION (Dept Code: 5403)	QUALITY-  PRODUCTION (Dept Code: 5403)	\N	Pune	Maharashtra	411018	IN
2113	2713	4613	201613	101613	Ankush	Badgujar	BadgujarA	Ankush.Badgujar@Tkiidc.com	10595544	PFS311	QUALITY-  PRODUCTION (Dept Code: 5403)	QUALITY-  PRODUCTION (Dept Code: 5403)	\N	Pune	Maharashtra	411018	IN
2114	2714	4614	201614	101614	Rahul	Suryawanshi	SuryawanshiRS	Rahul.Suryawanshi@Tkiidc.com	\N	1792527	DESIGN & ENGINEERING  STRUCTURAL (Dept Code: 7305)	DESIGN & ENGINEERING  STRUCTURAL (Dept Code: 7305)	\N	Pune	Maharashtra	411 018	IN
2115	2715	4615	201615	101615	Raghava	Balliparthy	BalliparthyR	\N	\N	OT1167	Tech Center	Tech Center	\N	Pune	Maharashtra	411018	IN
2116	2716	4616	201616	101616	Tushanth	Nair	NairT	\N	\N	16453	Construction dept ? 7804	Services  (Dept. Code:7804)	\N	pune	Maharashtra	411018	IN
2117	2717	4617	201617	101617	Vishal	Chauhan	ChauhanV	\N	\N	OT1166	Tech Center	Tech Center	\N	Pune	Maharashtra	411018	IN
2118	2718	4618	201618	101618	Boddeti	Achuth	AchuthB	\N	\N	35107	Hyderabad Office	Hyderabad Office	\N	Pune	Maharashtra	411018	IN
2119	2719	4619	201619	101619	Gopi	Swamy	SwamyG	\N	\N	AE128	Hyderabad Office	Hyderabad Office	\N	Hyderabad	Maharashtra	411018	IN
2120	2720	4620	201620	101620	Bhushan	Modgekar	ModgekarB	\N	\N	90394	DESIGN & ENGINEERING  CRUSHER/SCREEN (Dept Code: 7304)	DESIGN & ENGINEERING  CRUSHER/SCREEN (Dept Code: 7304)	+91 20 6612 4642	Pune	Maharashtra	411018	IN
2121	2721	4621	201621	101621	Shanmukh	Joshi	JoshiSR	\N	\N	90951	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4491	Pune	Maharashtra	411018	IN
2122	2722	4622	201622	101622	Jitendra	Beri	BeriJ	\N	\N	90308	Electrical Department	Electrical Department	+91 20  66124716	Pune	Maharashtra	411018	IN
2123	2723	4623	201623	101623	Chaitali	Chavan	ChavanC	\N	\N	90906	CEMENT  SELLING (Dept Code: 6002)	Cement Selling Group (Dept Code: 6002)	+91 206612 4895	Pune	Maharashtra	411018	IN
2124	2724	4624	201624	101624	Joydeb	Santra	SantraJ	\N	\N	16303	Structural Design (Dep Code: 7305)	Structural Design (Dep Code: 7305)	+91 20 6612 4781	\N	\N	\N	\N
2125	2725	4625	201625	101625	Sameer	Mande	MandeS	\N	\N	PFS 192	MHE Machines 7302	MHE Machines 7302	\N	\N	\N	\N	\N
2126	2726	4626	201626	101626	Tejas	Sheth	ShethT	\N	\N	90946	Services Dept.	Services Dept.	+91 20 66124652	Pune	Maharashtra	411018	IN
2127	2727	4627	201627	101627	Udayan	Chakravorty	ChakravortyU	\N	\N	90978	SMB-SALES & MARKETING 5702	SMB-SALES & MARKETING 5702	\N	\N	\N	\N	\N
2128	2728	4628	201628	101628	Mithun	Patil	Patil_M	\N	\N	90785	SUB CONTRACT (Dept. Code:7742  )	SUB CONTRACT  (Dept. Code:7742  )	+91 20 66124308	Pune	Maharashtra	411018	IN
2129	2729	4629	201629	101629	Amol	Chaudhary	ChaudharyAH	\N	\N	90570	Finance Dept.	Finance Controlling(Dept. Code:7607)	+91 20 6612 4741	Pune	Maharashtra	411018	IN
2130	2730	4630	201630	101630	Sujit	Ghosh	GhoshS	\N	\N	15895	Kolkatta Office	Kolkatta Office	033 6605 5225	Kolkatta	Kolkatta	\N	IN
2131	2731	4631	201631	101631	Eknath	Kumavat	KumavatE	\N	\N	16252	CEMENT  ENGINEERING (Dept Code: 6003)	Plant Design (Post Order) Group (Dept Code: 6009)	+91 20 66124887	Pune	Maharashtra	411018	IN
2132	2732	4632	201632	101632	Vinod	Gadkar	GadkarV	\N	\N	90868	STRUCTURAL DESIGN (Dept Code: 7305)	STRUCTURAL DESIGN (Dept Code: 7305)	+91 20 6612 4629	Pune	Maharashtra	411018	IN
2133	2733	4633	201633	101633	Nishat	Zaman	ZamanN	Nishat.Zaman@thyssenkrupp.com	10618585	60063	Construction dept ? 7804	Services	\N	Pune	Maharashtra	411018	IN
2134	2734	4634	201634	101634	Kacherlagadda	Raju	Raju_K	Kacherlagadda.Raju@thyssenkrupp.com	10620175	91042	Services ? After Sales  (Dept. Code: 7807)	Services ? After Sales  (Dept. Code: 7807)	\N	Pune	Maharashtra	411018	IN
2135	2735	4635	201635	101635	Rachakonda	Krishna	KrishnaR	rachakonda.krishna@thyssenkrupp.com	10619460	35114	Hyderabad Office ( Maint -Mech Dept.Code 5510)	Hyderabad Office	\N	Hyderabad	Maharashtra	411018	IN
2136	2736	4636	201636	101636	Vijay	Yadav	Yadav_VS	Vijay.Yadav@thyssenkrupp.com	10620636	98072	Hyderabad Office ( Fabrication Dept.Code :5554)	Hyderabad Office ( Dept. Code 5554)	040-2794 1403	Pune	Maharashtra	411018	IN
2137	2737	4637	201637	101637	Raghavendar	Pathipati	PathipatiR	Raghavendar.Pathipati@thyssenkrupp.com	10620002	91041	Hyerabad Office SMB 5704	SMB (Dept. Code :5704)	\N	Pune	Maharashtra	411018	IN
2138	2738	4638	201638	101638	Akash	Biranje	BiranjeA	Akash.Biranje@thyssenkrupp.com	10619329	60217	Construction dept ? 7804	Construction dept ? 7804	\N	Pune	Maharashtra	411 018	IN
2139	2739	4639	201639	101639	Sourbh	Satpute	SatputeS	Sourbh.Satpute@thyssenkrupp.com	10621250	11707	PM B&PP	PM B&PP	+91 20 6612 4662	Pune	Maharashtra	411018	IN
2140	2740	4640	201640	101640	Rajesh	Dhara	DharaR	Rajesh.Dhara@thyssenkrupp.com	10620662	91040	Kolkata Office	Kolkata Office	033 6605 5224	Pune	Maharashtra	411018	IN
2141	2741	4641	201641	101641	Subhajit	Paul	Paul_S	Subhajit.Paul@thyssenkrupp.com	10620846	91043	PROJECT MANAGEMENTDept.(9206)	PROJECT MANAGEMENTDept.(9206)	\N	Pune	Maharashtra	411018	IN
2142	2742	4642	201642	101642	Dhiman	Naskar	NaskarD	Dhiman.Naskar@thyssenkrupp.com	10620845	91045	PROJECT MANAGEMENTDept.(9206)	PROJECT MANAGEMENTDept.(9206)	\N	Pune	Maharashtra	411018	IN
2143	2743	4643	201643	101643	Vijay	Soni	SoniV	Vijay.Soni@thyssenkrupp.com	10620844	91044	PROJECT MANAGEMENTDept.(9206)	PROJECT MANAGEMENTDept.(9206)	\N	Pune	Maharashtra	411018	IN
2144	2744	4644	201644	101644	Omkesh	Pandey	PandeyO	Omkesh.Pandey@thyssenkrupp.com	10620847	60239	Construction dept ? 7809	Construction dept ? 7809	\N	Pune	Maharashtra	411018	IN
2145	2745	4645	201645	101645	Alpesh	Chauhan	ChauhanA	Alpesh.Chauhan@thyssenkrupp.com	10500160	60068	Services  (Dept. Code:  7807)	Services  (Dept. Code:  7807)	8780282513	Pune	Maharashtra	411018	IN
2146	2746	4646	201646	101646	Pradeep	Prajapati	PrajapatiP	pradeep.prajapati@thyssenkrupp.com	10620645	\N	Tech Center	Tech Center	\N	Pune	Maharashtra	411018	IN
2147	2747	4647	201647	101647	Naresh	Maan	MaanN	Naresh.Maan@thyssenkrupp.com	10621355	91047	Services  (Dept. Code: 7807)	Services  (Dept. Code: 7807)	\N	Pune	Maharastra	411018	IN
2148	2748	4648	201648	101648	Pranav	Ukkadgaonkar	UkkadgaonkarP	Pranav.Ukkadgaonkar@thyssenkrupp.com	10622417	91046	E&I (dept code7402)	E&I (dept code7402)	+91 20 6612 4716	Pune	Maharashtra	411018	IN
2149	2749	4649	201649	101649	Anmol	Sagare	SagareA	Anmol.Sagare@thyssenkrupp.com	10540457	11705	Construction Services (Dept.Code: 7805)	Construction Services (Dept.Code: 7805)	\N	Pune	Maharashtra	411018	IN
2150	2750	4650	201650	101650	Prasad	Kare	KareP	Prasad.Kare@thyssenkrupp.com	10445575	11709	PM B&PP 9204	PM B&PP  (9204 )	+91 20 6612 4831	Pune	Maharashtra	411018	IN
2151	2751	4651	201651	101651	PM	Lntpower-FGD	PmLntpower	PM.Lntpower-FGD@thyssenkrupp.com	\N	\N	\N	\N	\N	\N	\N	\N	\N
2152	2752	4652	201652	101652	Apurv	Sahasrabudhe	SahasrabudheA	Apurv.Sahasrabudhe@thyssenkrupp.com	10623193	91052	Estimation(Dept. Code:7620)	Estimation(Dept. Code:7620)	+91 20 6612 4112	Pune	Maharashtra	411018	IN
2153	2753	4653	201653	101653	Shahrukh	Sheikh	SheikhS	Shahrukh.Sheikh@thyssenkrupp.com	10623190	91051	Boiler Commissioning  ( Dept:9206)	Boiler Commissioning  ( Dept:9206)	\N	Pune	Maharashtra	411018	IN
2154	2754	4654	201654	101654	Saffiullah	Kadarbatcha	KadarbatchaS	Saffiullah.Kadarbatcha@thyssenkrupp.com	10446450	60078	Services  (Dept. Code: 7807 )	Services  (Dept. Code: 7807 )	7902229555	Pune	Maharashtra	411018	IN
2155	2755	4655	201655	101655	Sivakumar	Velmurugan	VelmuruganS	Sivakumar.Velmurugan@thyssenkrupp.com	10622748	60250	Services  (Dept. Code:  7807)	Services  (Dept. Code:  7807)	\N	Pune	Maharashtra	411018	IN
2156	2756	4656	201656	101656	Sureshkumar	Sasikumar	SasikumarS	Sureshkumar.Sasikumar@thyssenkrupp.com	10619313	60198	Services (Dept. Code: 7807)	Services (Dept. Code: 7807)	\N	Pune	Maharashtra	411018	IN
2157	2757	4657	201657	101657	Ulhas	Patil	PatilUV	Ulhas.Patil@thyssenkrupp.com	10622693	91049	Services Dept:7807	Services Dept:7807	\N	Pune	Maharashtra	411018	IN
2158	2758	4658	201658	101658	Civil	Maintenace	Civil_Maintenace	\N	\N	\N	\N	Civil Dept.	\N	Pune	Maharashtra	411018	IN
2159	2759	4659	201659	101659	Ashok	Londhe	LondheA	\N	\N	16335	ADMINISTRATION  CIVIL WORK MAINT (Dept Code: 7007)	ADMINISTRATION  CIVIL WORK MAINT (Dept Code: 7007)	+91 20 6612 4062	\N	\N	\N	\N
2160	2760	4660	201660	101660	Nikhil	Gupta	GuptaNR	Nikhil.Gupta@thyssenkrupp.com	10623729	91056	Project Management (Dept. code : 9304)	Project Management (Dept. code : 9304)	020 6612 4793	Pune	Maharashtra	400018	IN
2161	2761	4661	201661	101661	Sanjay	Nakade	NakadeS	sanjay.nakade@thyssenkrupp.com	10623727	60262	Construction Services (Dept.Code: 7805)	Construction Services (Dept.Code: 7805)	\N	Pune	Maharashtra	411018	IN
2162	2762	4662	201662	101662	Alok	Jagannath	JagannathA	alok.jagannath@thyssenkrupp.com	10623724	60264	Construction Services (Dept.Code: 7805)	Construction Services (Dept.Code: 7805)	\N	Pune	Maharashtra	411018	IN
2163	2763	4663	201663	101663	Sanchita	Pawar	PawarS	Sanchita.Pawar@tkiidc.com	\N	\N	\N	ELECTRICAL	\N	Pune	Maharashtra	411018	IN
2164	2764	4664	201664	101664	Digamber	Sinha	SinhaD	Digamber.Sinha@thyssenkrupp.com	10482327	91059	Services (Dept Code. 7807)	Services Dept.Code 7807	+91 20 6612 4837	Pune	Maharashtra	411 018	IN
2165	2765	4665	201665	101665	Rupesh	Singh	singh_rk	RUPESH.SINGH@thyssenkrupp.com	10619320	60206	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2166	2766	4666	201666	101666	Kishore	Behera	BeheraK	Kishore.Behera@thyssenkrupp.com	10500167	60071	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2167	2767	4667	201667	101667	Mohammed	Akram	AkramM	Mohammed.Akram@thyssenkrupp.com	10619229	60066	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2168	2768	4668	201668	101668	Shamsheer	Ansari	AnsariS	Shamsheer.Ansari@thyssenkrupp.com	10500982	60109	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2169	2769	4669	201669	101669	Dastagir	Alam	AlamD	Dastagir.Alam@thyssenkrupp.com	10619291	60175	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2170	2770	4670	201670	101670	Tapankumar	Desai	DesaiT	Tapankumar.Desai@thyssenkrupp.com	10540150	60138	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2171	2771	4671	201671	101671	Tanujit	Biswas	BiswasT	Tanujit.Biswas@thyssenkrupp.com	10615245	60048	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2172	2772	4672	201672	101672	Pankaj	Kanoujiya	KanoujiyaP	Pankaj.Kanoujiya@thyssenkrupp.com	10620853	60241	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2173	2773	4673	201673	101673	Mukesh	Dhote	DhoteM	Mukesh.Dhote@thyssenkrupp.com	10620986	60245	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2174	2774	4674	201674	101674	Riddhi	Jha	JhaR	Riddhi.Jha@thyssenkrupp.com	10614169	60018	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2175	2775	4675	201675	101675	Aurobhil	Ghosh	GhoshA	Aurobhil.Ghosh@thyssenkrupp.com	10614162	60010	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2176	2776	4676	201676	101676	Lokendra Singh	Chouhan	ChouhanL	LokendraSingh.Chouhan@thyssenkrupp.com	10619306	60190	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2177	2777	4677	201677	101677	Deepak	Gautam	GautamD	Deepak.Gautam@thyssenkrupp.com	10619337	60225	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2178	2778	4678	201678	101678	Manas	Dash	DashManas	Manas.Dash@thyssenkrupp.com	10623145	60253	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2179	2779	4679	201679	101679	Nitesh	Jha	JhaN	Nitesh.Jha@thyssenkrupp.com	10623617	60256	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2180	2780	4680	201680	101680	Topesh	Bisen	BisenT	Topesh.Bisen@thyssenkrupp.com	10619988	60235	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2181	2781	4681	201681	101681	Virendra Kumar	Bhargave	BhargaveV	VirendraKumar.Bhargave@thyssenkrupp.com	10619304	60188	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2182	2782	4682	201682	101682	Vinay	Ganta	GantaV	Vinay.Ganta@thyssenkrupp.com	10619334	60222	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2183	2783	4683	201683	101683	Chintan	Gajjar	GajjarC	Chintan.Gajjar@thyssenkrupp.com	10619307	60191	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2184	2784	4684	201684	101684	Mrutyunjay	Dash	DashMrutyunjay	Mrutyunjay.Dash@thyssenkrupp.com	10500233	60012	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2185	2785	4685	201685	101685	Himanshu	Bhatt	BhattH	Himanshu.Bhatt@thyssenkrupp.com	10619319	60205	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2186	2786	4686	201686	101686	Toyaj	Jangid	JangidT	Toyaj.Jangid@thyssenkrupp.com	10619289	60173	\N	AFTER SALES SERVICES	9413163416	Barmer	Rajasthan	344001	IN
2187	2787	4687	201687	101687	Sushil	Kumar	KumarSushil	Sushil.Kumar@thyssenkrupp.com	10619301	60185	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2188	2788	4688	201688	101688	Dharmendra	Kumar	KumarDharmendra	Dharmendra.Kumar@thyssenkrupp.com	10619292	60176	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2189	2789	4689	201689	101689	Nirmal	Lenka	LenkaN	Nirmal.Lenka@thyssenkrupp.com	10614185	60035	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2190	2790	4690	201690	101690	Jayapalan	Karuna	KarunaJ	Jayapalan.Karuna@thyssenkrupp.com	10619294	60178	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2191	2791	4691	201691	101691	Sanallal	Kumar	KumarSanallal	Sanallal.Kumar@thyssenkrupp.com	10619271	60155	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2194	2794	4694	201694	101694	Bikash	Mahana	MahanaB	Bikash.Mahana@thyssenkrupp.com	10500271	60008	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2195	2795	4695	201695	101695	Mohd	Khan	KhanM	Mohd.Khan@thyssenkrupp.com	10514758	60121	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2196	2796	4696	201696	101696	Abhay	Mishra	MishraAbhay	Abhay.Mishra@thyssenkrupp.com	10619272	60156	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2197	2797	4697	201697	101697	Amit	Kulkarni	KulkarniA	Amit.Kulkarni@thyssenkrupp.com	10526005	60136	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2198	2798	4698	201698	101698	Sudhakar	Mani	ManiS	Sudhakar.Mani@thyssenkrupp.com	10500188	60003	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2199	2799	4699	201699	101699	Pawan	Kumar	KumarPawan	Pawan.Kumar@thyssenkrupp.com	10619283	60167	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2200	2800	4700	201700	101700	Komal	Kashyap	KashyapK	Komal.Kashyap@thyssenkrupp.com	10619340	60228	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2201	2801	4701	201701	101701	Sudhir	Kumar	KumarSudhir	Sudhir.Kumar@thyssenkrupp.com	10619286	60170	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2202	2802	4702	201702	101702	Pritam	Naik	NaikP	Pritam.Naik@thyssenkrupp.com	10614184	60034	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2203	2803	4703	201703	101703	Amit	Mishra	MishraAmit	Amit.Mishra@thyssenkrupp.com	10619277	60161	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2204	2804	4704	201704	101704	Soumen	Mondal	MondalS	Soumen.Mondal@thyssenkrupp.com	10513001	60117	\N	AFTER SALES SERVICES	9749495270	\N	Maharashtra	\N	IN
2205	2805	4705	201705	101705	Topesh	Nimsarkar	NimsarkarT	Topesh.Nimsarkar@thyssenkrupp.com	10500163	60070	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2206	2806	4706	201706	101706	Amit	Pandey	PandeyAmit	Amit.Pandey@thyssenkrupp.com	10500243	60089	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2207	2807	4707	201707	101707	Dharamveer	Pandey	PandeyDharamveer	Dharamveer.Pandey@thyssenkrupp.com	10614167	60016	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2208	2808	4708	201708	101708	Deepak	Prajapat	PrajapatD	Deepak.Prajapat@thyssenkrupp.com	10619290	60174	\N	AFTER SALES SERVICES	9461636277	\N	Maharashtra	\N	\N
2209	2809	4709	201709	101709	Neelesh	Pandey	PandeyNeelesh	Neelesh.Pandey@thyssenkrupp.com	10619818	60233	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2210	2810	4710	201710	101710	Hansraj	Parmar	ParmarH	Hansraj.Parmar@thyssenkrupp.com	10619281	60165	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2211	2811	4711	201711	101711	Mahesh Kumar	Pandey	PandeyMaheshkumar	MaheshKumar.Pandey@thyssenkrupp.com	10619305	60189	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2212	2812	4712	201712	101712	Vikas	Parihar	PariharV	Vikas.Parihar@thyssenkrupp.com	10513072	60119	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2213	2813	4713	201713	101713	Shibasis	Sahu	SahuShibasis	Shibasis.Sahu@thyssenkrupp.com	10614193	60043	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2214	2814	4714	201714	101714	Subhranshu	Pratihari	PratihariS	Subhranshu.Pratihari@thyssenkrupp.com	10614189	60039	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2215	2815	4715	201715	101715	Mahashakti	Singh	SinghMahashakti	Mahashakti.Singh@thyssenkrupp.com	10513074	60120	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2216	2816	4716	201716	101716	Dal Singar	Prajapati	PrajapatiD	DalSingar.Prajapati@thyssenkrupp.com	10619296	60180	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2217	2817	4717	201717	101717	Jaydip	Sathvara	SathvaraJ	Jaydip.Sathvara@thyssenkrupp.com	10500246	60091	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2218	2818	4718	201718	101718	Md.Noushad	Rashid	RashidMd	Md.Noushad.Rashid@thyssenkrupp.com	10614163	60011	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2219	2819	4719	201719	101719	Surajit	Seal	SealS	Surajit.Seal@thyssenkrupp.com	10614172	60021	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2220	2820	4720	201720	101720	Krushna	Singh	SinghK	Krushna.Singh@thyssenkrupp.com	10614173	60022	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2221	2821	4721	201721	101721	Srikant	Rout	RoutSrikant	Srikant.Rout@thyssenkrupp.com	10500210	60004	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2222	2822	4722	201722	101722	Navin	Sharma	SharmaN	Navin.Sharma@thyssenkrupp.com	10619325	60212	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2223	2823	4723	201723	101723	Lokendra	Rawat	RawatL	Lokendra.Rawat@thyssenkrupp.com	10619333	60221	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2224	2824	4724	201724	101724	Manjesh	Rai	RaiM	Manjesh.Rai@thyssenkrupp.com	10619327	60214	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2225	2825	4725	201725	101725	Satchidananda	Rout	RoutS	Satchidananda.Rout@thyssenkrupp.com	10614179	60028	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2226	2826	4726	201726	101726	Dipankar	Sahu	SahuD	Dipankar.Sahu@thyssenkrupp.com	10500240	60005	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2227	2827	4727	201727	101727	Anupam	Singh	SinghAnupam	Anupam.Singh@thyssenkrupp.com	10500161	60069	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2228	2828	4728	201728	101728	Akshaykumar	Sankpal	SankpalA	Akshaykumar.Sankpal@thyssenkrupp.com	10622352	11708	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2229	2829	4729	201729	101729	Sujit	Sahu	SahuSujit	Sujit.Sahu@thyssenkrupp.com	10614180	60029	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2230	2830	4730	201730	101730	Mohamed	Rasheed	RasheedM	Mohamed.Rasheed@thyssenkrupp.com	10500232	60085	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2231	2831	4731	201731	101731	Ravindra Singh	Rathore	RathoreR	Ravindrasingh.Rathore@thyssenkrupp.com	10619288	60172	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2232	2832	4732	201732	101732	Poshendra	Singh	SinghPoshendra	Poshendra.Singh@thyssenkrupp.com	10500237	60087	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2233	2833	4733	201733	101733	Akhtar	Tauheed	TauheedA	Akhtar.Tauheed@thyssenkrupp.com	10614161	60009	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2234	2834	4734	201734	101734	Manish	Singh	SinghManish	ManishS.Singh@thyssenkrupp.com	10619282	60166	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2235	2835	4735	201735	101735	Palendra	Singh	SinghPalendra	Palendra.Singh@thyssenkrupp.com	10619278	60162	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2236	2836	4736	201736	101736	Premkumar	Thampi	ThampiP	Premkumar.Thampi@thyssenkrupp.com	10500252	60099	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2237	2837	4737	201737	101737	Veerendra	Tripathi	TripathiV	Veerendra.Tripathi@thyssenkrupp.com	10619323	60209	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2238	2838	4738	201738	101738	Alaguharihara	Subramanian	SubramanianA	Alaguharihara.Subramanian@thyssenkrupp.com	10619298	60182	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2239	2839	4739	201739	101739	Sumeet	Verma	VermaS	Sumeet.Verma@thyssenkrupp.com	10614191	60041	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2240	2840	4740	201740	101740	Dhirendra	Singh	SinghDhirendra	Dhirendra.Singh@thyssenkrupp.com	10623611	60261	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2241	2841	4741	201741	101741	Kiran	Suryawanshi	SuryawanshiK	Kiran.Suryawanshi@thyssenkrupp.com	10500235	60086	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2242	2842	4742	201742	101742	Bimlesh	Tiwari	TiwariB	Bimlesh.Tiwari@thyssenkrupp.com	10614181	60031	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2243	2843	4743	201743	101743	Pravin	Upadhyay	UpadhyayP	Pravin.Upadhyay@thyssenkrupp.com	10501468	60113	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2244	2844	4744	201744	101744	Sudhir	Tripathy	TripathyS	Sudhir.Tripathy@thyssenkrupp.com	10614168	60017	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2245	2845	4745	201745	101745	Kamalesh	Yadav	YadavK	Kamalesh.Yadav@thyssenkrupp.com	10619321	60207	\N	AFTER SALES SERVICES	9839171985	\N	Rajstan 	\N	\N
2246	2846	4746	201746	101746	Randhir	Tiwari	TiwariR	Randhir.Tiwari@thyssenkrupp.com	10620353	60237	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2247	2847	4747	201747	101747	Harshvardhan	Sinha	SinhaH	Harshvardhan.Sinha@thyssenkrupp.com	10619280	60164	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2248	2848	4748	201748	101748	Shailendra	Chandra	ChandraSK	Shailendra.Chandra@thyssenkrupp.com	10517318	60128	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2249	2849	4749	201749	101749	Ashutosh	Singh	SinghAshutosh	Ashutosh.Singh@thyssenkrupp.com	10619819	60234	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2250	2850	4750	201750	101750	Vijay	Sodha	SodhaV	Vijay.Sodha@thyssenkrupp.com	10619331	60219	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2251	2851	4751	201751	101751	Rahul	Soni	SoniR	Rahul.Soni@thyssenkrupp.com	10500981	60108	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2252	2852	4752	201752	101752	Ajaykumar	Singh	SinghAjaykumar	Ajaykumar.Singh@thyssenkrupp.com	10619293	60177	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2253	2853	4753	201753	101753	Barinder	Singh	SinghBarinder	Barinder.Singh@thyssenkrupp.com	10619303	60187	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2254	2854	4754	201754	101754	Shiv	Prajapati	PrajapatiSK	Shiv.Prajapati@thyssenkrupp.com	10619295	60179	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2255	2855	4755	201755	101755	Suraj	Naik	NaikSK	Suraj.Naik@thyssenkrupp.com	10614178	60027	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2256	2856	4756	201756	101756	Bhaveshkumar	Patel	PatelBB	Bhaveshkumar.Patel@thyssenkrupp.com	10503899	60114	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2257	2857	4757	201757	101757	Narendra	Rao	RaoNS	Narendra.Rao@thyssenkrupp.com	10619332	60220	\N	AFTER SALES SERVICES	9799787877	\N	Maharashtra	\N	\N
2258	2858	4758	201758	101758	Shravan	Tripathi	TripathiSJ	ShravanJ.Tripathi@thyssenkrupp.com	10500247	60092	Double id created	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2259	2859	4759	201759	101759	Akash	Patel	PatelAS	Akash.Patel@thyssenkrupp.com	10614177	60026	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2260	2860	4760	201760	101760	Ashutosh	Verma	VermaAR	Ashutosh.Verma@thyssenkrupp.com	10619322	60208	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2261	2861	4761	201761	101761	Anuj	Sharma	SharmaAnuj	Anuj.Sharma@thyssenkrupp.com	10541528	60141	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2262	2862	4762	201762	101762	Raju	Singh	SinghRaju	Raju.Singh@thyssenkrupp.com	10500264	60106	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2263	2863	4763	201763	101763	Vivekvarma	Manthena	ManthenaV	Vivekvarma.Manthena@thyssenkrupp.com	10624247	11710	B & PP /2003	BOILER  DESIGN Dept Code: 2000)	\N	\N	\N	\N	\N
2264	2864	4764	201764	101764	Rahul	Kurlikar	KurlikarR	Rahul.Kurlikar@thyssenkrupp.com	10447124	9837	WORKSHOP SUPERVISORS (Dept Code: 5061)	WORKSHOP SUPERVISORS (Dept Code: 5061)	91 20 6612 4424	Pune	Maharashtra	411018	IN
2265	2865	4765	201765	101765	PMtkII	Grasim.IR	GrasimIR	PMtkII.Grasim.IR@thyssenkrupp.com	\N	\N	1x110 tph CFBC Boiler on EPC	CFBC Boiler	\N	Pune	\N	411018	IN
2266	2866	4766	201766	101766	Avinash	Sharma	SharmaAD	avinash.sharma.external@thyssenkrupp.com	\N	PFS756	Construction dept ? 7804	Construction dept ? 7804	\N	Pune	Maharashtra	411 018	IN
2267	2867	4767	201767	101767	Nilesh	Malviya	MalviyaN	Nilesh.Malviya@thyssenkrupp.com	10623731	91055	Services  (Dept. Code:  7807)	Services  (Dept. Code:  7807)	\N	Pune	Maharashtra	411018	IN
2268	2868	4768	201768	101768	Vijay	Rahangdale	RahangdaleV	vijay.rahangdale@thyssenkrupp.com	10623613	91054	SERVICES	SERVICES	\N	Pune	Maharashtra	411018	IN
2269	2869	4769	201769	101769	Sanjaya	Santi	SantiS	sanjaya.santi@thyssenkrupp.com	10624049	91058	Services	Services	\N	\N	\N	\N	\N
2270	2870	4770	201770	101770	Yogesh	Ingale	IngaleY	yogesh.ingale@thyssenkrupp.com	10622456	91048	SERVICES	SERVICES	\N	Pune	Maharashtra	411018	IN
2271	2871	4771	201771	101771	Nitin	Sharma	Sharma_N	\N	\N	91053	Services	SERVICES	\N	Pune	Maharashtra	411018	IN
2272	2872	4772	201772	101772	Malapura	Basappa	BasappaM	basappa.malapura@thyssenkrupp.com	10624449	91060	Services	Services	\N	Pune	Maharashtra	411018	IN
2273	2873	4773	201773	101773	Easwara	Mandava	MandavaE	easwara.mandava@thyssenkrupp.com	10623920	91057	Services	Services	\N	Pune	Maharastra	411018	IN
2274	2874	4774	201774	101774	MdAbdul	Rahim	RahimM	abdulrahim.mohammad@thyssenkrupp.com	10625222	91061	Services	Services	\N	\N	\N	\N	\N
2275	2875	4775	201775	101775	Pravin	Suryawanshi	SuryawanshiPP	pravin.suryawanshi.external@thyssenkrupp.com	\N	Excellent 1000	Manufacturing (Dept.5061)	Manufacturing (Dept.5061)	\N	Pune	Maharashtra	411018	IN
2276	2876	4776	201776	101776	Amaresh	Dhall	DhallA	Amaresh.Dhall@thyssenkrupp.com	10625112	91062	Services	Services	\N	\N	\N	\N	\N
2277	2877	4777	201777	101777	Abhishaik	Sharma	SharmaAH	Abhishaik.Sharma@thyssenkrupp.com	10625508	60271	services	services	\N	\N	\N	\N	\N
2278	2878	4778	201778	101778	Chaitanya	Shaligram	ShaligramC	Chaitanya.Shaligram@thyssenkrupp.com	10625425	11712	Project Management (Dept. code : 9304)	Project Management (Dept. code : 9304)	+91 20 6612 4674	Pune	Maharashtra	400018	IN
2279	2879	4779	201779	101779	Nidhi	Mohan	MohanN	Nidhi.Mohan@thyssenkrupp.com	10625427	11713	Project Management (Dept. code : 9304)	Project Management (Dept. code : 9304)	020 6612 4780	Pune	Maharashtra	400018	IN
2280	2880	4780	201780	101780	Isha	Sathaye	SathayeI	Isha.Sathaye@thyssenkrupp.com	10625578	11714	PM_Planning_9704	PM_Planning_9704	+91 20 6612 4796	Pune	Maharashtra	400018	IN
2281	2881	4781	201781	101781	Suraj	Jangam	JangamS	Suraj.Jangam@thyssenkrupp.com	10625579	11716	PM B&PP  (9204 )	PM B&PP  (9204 )	+91 20 6612 4743	Pune	Maharashtra	411018	IN
2282	2882	4782	201782	101782	Nilesh	Matale	MataleN	Nilesh.Matale@thyssenkrupp.com	10625580	11715	PM B&PP  (9204 )	PM B&PP  (9204 )	+91 20 6612 4687	Pune	Maharashtra	411018	IN
2500	3100	5000	202000	102000	Vinay	Kumar	KumarVM	Vinay.Kumar@thyssenkrupp.com	10626769	60288	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2283	2883	4783	201783	101783	Harshada	Janorkar	JanorkarH	harshada.janorkar.external@thyssenkrupp.com	10625779	PFS325	FINANCE  BILL PASSING (Dept Code: 7604)	FINANCE  BILL PASSING (Dept Code: 7604)	\N	Pune	Maharashtra	411018	IN
2284	2884	4784	201784	101784	Shoheb	Malik	MalikS	shoheb.malik@thyssenkrupp.com	10625430	\N	Tech Center	Tech Center	\N	Pune	Maharashtra	411018	IN
2285	2885	4785	201785	101785	Sumit	Jha	JhaSK	sumitkumar.jha@thyssenkrupp.com	10514710	60123	AFTER SALES SERVICES	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2286	2886	4786	201786	101786	Thangathirumaran	Viruthagiri	ViruthagiriT	Thangathirumaran.Viruthagiri@thyssenkrupp.com	10517321	60129	AFTER SALES SERVICES	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2287	2887	4787	201787	101787	Bibin	Kuniyil	KuniyilB	Bibin.Kuniyil@thyssenkrupp.com	10526002	60137	AFTER SALES SERVICES	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2288	2888	4788	201788	101788	Sreeraj	Kurup	KurupS	Sreeraj.Kurup@thyssenkrupp.com	10619270	60154	AFTER SALES SERVICES	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2289	2889	4789	201789	101789	Akhilghosh	Pillai	PillaiA	Akhilghosh.Pillai@thyssenkrupp.com	10619297	60181	AFTER SALES SERVICES	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2290	2890	4790	201790	101790	Mritunjay	Singh	SinghMK	Mritunjayk.Singh@thyssenkrupp.com	10619312	60197	AFTER SALES SERVICES	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2291	2891	4791	201791	101791	Prabakaran	Paulsamy	PaulsamyP	Prabakaran.Paulsamy@thyssenkrupp.com	10500170	60073	AFTER SALES SERVICES	AFTER SALES SERVICES	7902229555	\N	Maharashtra	\N	\N
2292	2892	4792	201792	101792	Nayan	Bajpaiee	BajpaieeN	Nayan.Bajpaiee@thyssenkrupp.com	10619329	60083	Construction dept ? 7804	Construction dept ? 7804	\N	Pune	Maharashtra	411 018	IN
2293	2893	4793	201793	101793	Devendra	Kumar	KumarDS	Devendra.Kumar@thyssenkrupp.com	10626120	60275	Construction Services (Dept.Code: 7805)	Construction Services (Dept.Code: 7805)	\N	Pune	Maharashtra	411018	IN
2294	2894	4794	201794	101794	Mohsin	Mulla	MullaM	Mohsin.Mulla@thyssenkrupp.com	10626116	91064	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	+91 20 6612 4216	Pune	Maharashtra	411018	IN
2295	2895	4795	201795	101795	Komal	Pimpale	PimpaleK	Komal.Pimpale@thyssenkrupp.com	10626115	91065	PM_MHE_9204	PM_9204	+91 20 6612 4807	\N	\N	\N	\N
2296	2896	4796	201796	101796	Prajakta	Padwal	PadwalP	Prajakta.Padwal@thyssenkrupp.com	10626119	11717	Project Management (Dept. code : 9304)	Project Management (Dept. code : 9304)	+91 20 6612 4780	Pune	Maharashtra	400018	IN
2297	2897	4797	201797	101797	Arun	Yadav	YadavAK	\N	\N	60280	Construction dept ? 7804	Construction dept ? 7804	\N	Pune	Maharashtra	411018	IN
2298	2898	4798	201798	101798	Vivek	Dorke	DorkeV	Vivek.Dorke@thyssenkrupp.com	10626113	11718	Construction dept ? 7202	Construction dept ? 7202	\N	Pune	Maharashtra	411018	IN
2299	2899	4799	201799	101799	Ritesh	Jamwal	JamwalR	\N	\N	91066	PM_Planning_9704	PM_Planning_9704	\N	Pune	Maharashtra	400018	IN
2300	2900	4800	201800	101800	Subrata	Dutta	Dutta_S	\N	\N	60094	Kolkata Office	Kolkata Office	033 6605 5224	Pune	Maharashtra	411018	IN
2301	2901	4801	201801	101801	Prashant	Vankar	VankarP	\N	\N	90363	DESIGN & ENGINEERING TO GROUP CO.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4060	Pune	Maharashtra	411018	IN
2302	2902	4802	201802	101802	Rohit	Maidamwar	MaidamwarR	\N	\N	90948	Boiler Services R&R (7808)	Boiler Services R&R (7808)	\N	Pune	Maharashtra	411018	IN
2303	2903	4803	201803	101803	Sharon	Sheejo	SheejoS	sharon.sheejo.external@thyssenkrupp.com	10627200	PFS323	Administration Department	Administration Department	+91 20 6612 4271	Pune	Maharashtra	411018	IN
2304	2904	4804	201804	101804	Pruthviraj	Nimbalkar	NimbalkarP	\N	\N	11454	Sugar Division	Sugar Division	\N	Pune	Maharashtra	411018	IN
2305	2905	4805	201805	101805	Venkat	Rao 	RaoVP	\N	\N	35027	Hyd Office	\N	\N	\N	\N	\N	\N
2306	2906	4806	201806	101806	Venkat	Rao	RaoV	\N	\N	11706	Construction dept (7202)	Construction dept (7202)	\N	Pune	Maharashtra	411 018	IN
2307	2907	4807	201807	101807	Mahesh	Mane	Mane_M	\N	\N	4858	Manufacturing Fabrication	Manufacturing Fabrication (Dept code 506)	+91 20 6612 4748	Pune	Maharashtra	411018	IN
2308	2908	4808	201808	101808	Satish	Nautiyal	NautiyalS	\N	\N	60088	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2309	2909	4809	201809	101809	Apurva	Zaware	ZawareA	\N	\N	11671	SERVICES ? 7808	Boiler Services R&R (7808)	\N	Pune	Maharashtra	411018	IN
2310	2910	4810	201810	101810	Samruddhi	Moze	MozeS	Samruddhi.Moze@thyssenkrupp.com	10626768	11721	Research & Development/1100	Research & Development/1100	\N	\N	\N	\N	\N
2311	2911	4811	201811	101811	Amit	Sharma	SharmaAK	Amit.Sharma@thyssenkrupp.com	10627399	60303	Construction Services (Dept.Code: 7805)	Construction Services (Dept.Code: 7805)	\N	Pune	Maharashtra	411018	IN
2312	2912	4812	201812	101812	Anushri	Deulkar	DeulkarA	Anushri.Deulkar@tkiidc.com	10507479	\N	students of VJTI a period of ten months	Design & Engineering(Dept Code: 7305)	\N	Pune	Maharashtra	411018	IN
2313	2913	4813	201813	101813	Harshad	Patil	Patil_H	Harshad.Patil@tkiidc.com	\N	\N	students of VJTI a period of ten months	\N	\N	Pune	Maharashtra	411018	IN
2314	2914	4814	201814	101814	Vijendra	Ingle	IngleV	Vijendra.Ingle@tkiidc.com	10507479	\N	student of VJTI a period of ten months	\N	\N	Pune	Maharashtra	411018	IN
2315	2915	4815	201815	101815	Tirtharaj	Panda	PandaT	Tirtharaj.Panda@thyssenkrupp.com	10627195	60292	Construction Services (Dept.Code: 7805)	Construction Services (Dept.Code: 7805)	\N	Pune	Maharashtra	411018	IN
2316	2916	4816	201816	101816	Jitendra	Nartam	NartamJ	Jitendra.Nartam@thyssenkrupp.com	10619338	60226	Construction Services (Dept.Code: 7805)	Construction Services (Dept.Code: 7805)	\N	Pune	Maharashtra	411018	IN
2317	2917	4817	201817	101817	sanjay	maji	majisb	sanjay.maji@thyssenkrupp.com	10500267	60006	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2318	2918	4818	201818	101818	rafiqul	middya	middyarj	rafiqul.middya@thyssenkrupp.com	10500156	60001	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2319	2919	4819	201819	101819	ghanshyam	sahu	sahugn	ghanshyam.sahu@thyssenkrupp.com	10614408	60030	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2320	2920	4820	201820	101820	bhajaram	behera	beherabh	bhajaram.behera@thyssenkrupp.com	10614195	60045	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2321	2921	4821	201821	101821	sourabhkumar	thakur	thakursm	sourabhkumar.thakur@thyssenkrupp.com	10614165	60014	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2322	2922	4822	201822	101822	shyam	shobhit	shobhitsv	shyam.shobhit@thyssenkrupp.com	10614174	60023	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2323	2923	4823	201823	101823	debraj	bandyopadhyay	bandyopadhyaydl	debraj.bandyopadhyay@thyssenkrupp.com	10500169	60002	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2549	3149	5049	202049	102049	Sanjeev	Tiwari	TiwariSD	\N	\N	60270	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2324	2924	4824	201824	101824	pinaki	pattnaik	pattnaikps	pinaki.pattnaik@thyssenkrupp.com	10614196	60046	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2325	2925	4825	201825	101825	dasarathi	gouda	goudadg	dasarathi.gouda@thyssenkrupp.com	10614187	60037	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2326	2926	4826	201826	101826	niranjan	ping	pingnd	niranjan.ping@thyssenkrupp.com	10614194	60044	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2327	2927	4827	201827	101827	md	nazir	nazirmm	md.nazir@thyssenkrupp.com	10614186	60036	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2328	2928	4828	201828	101828	vikas	kumar	kumarvr	vikas.kumar@thyssenkrupp.com	10614190	60040	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2329	2929	4829	201829	101829	koushik	dasgupta	dasguptaks	koushik.dasgupta@thyssenkrupp.com	10500268	60007	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2330	2930	4830	201830	101830	anand	sagar	sagarar	anand.sagar@thyssenkrupp.com	10614171	60020	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2331	2931	4831	201831	101831	ravi	shankar	shankarrb	ravi.shankar@thyssenkrupp.com	10614192	60042	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2332	2932	4832	201832	101832	subrat	pattnaik	pattnaiksd	subrat.pattnaik@thyssenkrupp.com	10614182	60032	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2333	2933	4833	201833	101833	s	santhanam	santhanamss	s.santhanam@thyssenkrupp.com	10614166	60015	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2334	2934	4834	201834	101834	prateek	singh	singhpm	prateek.singh@thyssenkrupp.com	10614170	60019	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2335	2935	4835	201835	101835	sukumar	patel	patelsp	sukumar.patel@thyssenkrupp.com	10614183	60033	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2336	2936	4836	201836	101836	abhishek	kumar	kumarat	abhishekt.kumar@thyssenkrupp.com	10614176	60025	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2337	2937	4837	201837	101837	bhanu	pratap	pratapbn	bhanu.pratap@thyssenkrupp.com	10517319	60127	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2338	2938	4838	201838	101838	sourabh	dosi	dosisk	sourabh.dosi@thyssenkrupp.com	10514718	60125	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2339	2939	4839	201839	101839	karthik	sethuraman,	sethuramankk	karthik.sethuraman@thyssenkrupp.com	10500172	60074	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2340	2940	4840	201840	101840	baswajit	sahu	sahubb	baswajit.sahu@thyssenkrupp.com	10518881	60126	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2341	2941	4841	201841	101841	k	malaiyarasan	malaiyarasankm	k.malaiyarasan@thyssenkrupp.com	10500259	60103	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2342	2942	4842	201842	101842	vikash	anand	anandvr	vikash.anand@thyssenkrupp.com	10513002	60118	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2343	2943	4843	201843	101843	sivananthan	dakshinamoorthy	dakshinamoorthyss	sivananthan.dakshinamoorthy@thyssenkrupp.com	10500168	60072	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2344	2944	4844	201844	101844	suresh	sundaresan	sundaresansk	suresh.sundaresan@thyssenkrupp.com	10500219	60084	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2345	2945	4845	201845	101845	sirshendu	kar	karsc	sirshendu.kar@thyssenkrupp.com	10500272	60107	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2346	2946	4846	201846	101846	kishore	ippili	ippiliks	kishore.ippili@thyssenkrupp.com	10619230	60065	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2347	2947	4847	201847	101847	victorsaloman	arulraj	arulrajvj	victorsaloman.arulraj@thyssenkrupp.com	10500260	60104	\N	AFTER SALES SERVICES	9751507003	Munnar	Kerala	685612	IN
2348	2948	4848	201848	101848	manoj kumar	muni	munimb	manojkumar.muni@thyssenkrupp.com	10614407	60047	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2349	2949	4849	201849	101849	sukumar	murugaiya	murugaiyass	sukumar.murugaiya@thyssenkrupp.com	10500143	60067	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2350	2950	4850	201850	101850	dharmpal	kumar	kumardr	dharmpal.kumar@thyssenkrupp.com	10619311	60195	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2351	2951	4851	201851	101851	laxminarayan	bhargav	bhargavlm	laxminarayan.bhargav@thyssenkrupp.com	10619335	60223	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2352	2952	4852	201852	101852	arunkumar	pillai	pillaiat	arunkumar.pillai@thyssenkrupp.com	10619260	60144	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2353	2953	4853	201853	101853	p	nallaperumal	nallaperumalpa	p.nallaperumal@thyssenkrupp.com	10619336	60224	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2354	2954	4854	201854	101854	mariappan	murugan	muruganmm	mariappan.murugan@thyssenkrupp.com	10619326	60213	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2355	2955	4855	201855	101855	vikesh	kumar	kumarvh	vikesh.kumar@thyssenkrupp.com	10619269	60153	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2356	2956	4856	201856	101856	md	ashfaque	ashfaquema	\N	\N	60210	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2357	2957	4857	201857	101857	ananda	ghosh	ghoshas	ananda.ghosh@thyssenkrupp.com	10619318	60204	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2358	2958	4858	201858	101858	kundan	kumar	kumarkv	kundan.kumar@thyssenkrupp.com	10619259	60143	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2359	2959	4859	201859	101859	dharmadas	jadhav	jadhavdb	dharmadas.jadhav@thyssenkrupp.com	10500152	60232	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2360	2960	4860	201860	101860	ishtiyaque	ahmad	ahmadia	ishtiyaque.ahmad@thyssenkrupp.com	10619274	60158	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2361	2961	4861	201861	101861	sanket	vishwakarma	vishwakarmasg	sanket.vishwakarma@thyssenkrupp.com	10620984	60244	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2362	2962	4862	201862	101862	deepak	kumar	kumardn	deepak.kumar@thyssenkrupp.com	10619262	60146	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2363	2963	4863	201863	101863	vikram	saini	sainivg	vikram.saini@thyssenkrupp.com	10623189	60252	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2364	2964	4864	201864	101864	muhilan	thennarasu	thennarasuma	muhilan.thennarasu@thyssenkrupp.com	10619324	60211	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2365	2965	4865	201865	101865	mujeeb	khan	khanmm	mujeeb.khan@thyssenkrupp.com	10619310	60194	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2366	2966	4866	201866	101866	siddharth	rao	rao_sk	siddharth.rao@thyssenkrupp.com	10619316	60202	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2367	2967	4867	201867	101867	ganesan	gnanaprakasam	gnanaprakasamgg	\N	\N	60200	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2368	2968	4868	201868	101868	a	kannan	kannanaa	a.kannan@thyssenkrupp.com	10619315	60201	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2369	2969	4869	201869	101869	gangadhar	ghag	ghaggd	gangadhar.ghag@thyssenkrupp.com	10619275	60159	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2370	2970	4870	201870	101870	asif	mansuri	mansuriag	asif.mansuri@thyssenkrupp.com	10619314	60199	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2372	2972	4872	201872	101872	Satyajeet	Deshmukh	DeshmukhS	Satyajeet.Deshmukh@thyssenkrupp.com	10627787	91068	Indirect Taxation ? Sales Tax Dept code 7606	Indirect Taxation ? Sales Tax Dept code 7606	+91 20 6612 4811	\N	\N	\N	\N
2373	2973	4873	201873	101873	soumya	venkatesh	venkateshS	soumya.venkatesh@thyssenkrupp.com	10614164	60013	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2374	2974	4874	201874	101874	Rajan	Chaudhary	ChaudharyR	Rajan.Chaudhary@thyssenkrupp.com	10628235	91069	Service 7808	Service (Dept.Code 7808)	+91 20 6612 4841	Pune	Maharashtra	411018	IN
2375	2975	4875	201875	101875	Pratik	Wategave	WategaveP	Pratik.Wategave@thyssenkrupp.com	10628015	11732	Services(7808)	Services(7808)	\N	Pune	Maharashtra	411018	IN
2376	2976	4876	201876	101876	Murtuza	Contractor	ContractorM	Murtuza.Contractor@thyssenkrupp.com	10628018	11726	Services (7808)	Services (7808)	\N	Pune	Maharashtra	411018	IN
2377	2977	4877	201877	101877	Tejas	Kondhalkar	KondhalkarT	Tejas.Kondhalkar@thyssenkrupp.com	10628017	11727	Energy /2008	Energy /2008	\N	Pune	Maharashtra	411018	IN
2378	2978	4878	201878	101878	Swapnil	Sonawane	SonawaneS	Swapnil.Sonawane@thyssenkrupp.com	10628016	11725	Energy /2008	Energy /2008	+91 20 6612 4788	Pune	Maharashtra	411018	IN
2379	2979	4879	201879	101879	Anand	Mishra	MishraAS	\N	\N	60020	Services ?  (Dept. Code: 7807)	Services ?  (Dept. Code: 7807)	\N	Pune	Maharashtra	411018	IN
2380	2980	4880	201880	101880	Nikhil	Marwaha	MarwahaN	Nikhil.Marwaha@thyssenkrupp.com	10628236	11722	WORKSHOP  P.P.PLANNING (Dept Code: 5002)	WORKSHOP  P.P.PLANNING (Dept Code: 5002)	\N	Pune	\N	\N	IN
2381	2981	4881	201881	101881	Amey	Birje	BirjeA	Amey.Birje@thyssenkrupp.com	10628487	11730	Boht-Out	Boht-Out	+91 20 6612 4845	Pune	Maharashtra	411018	IN
2382	2982	4882	201882	101882	Chinmay	Khedkar	KhedkarC	Chinmay.Khedkar@thyssenkrupp.com	10628019	11728	MHE Utilities - 7303	MHE Utilities - 7303	+91 20 6612 4844	Pune	maharashtra	411018	IN
2383	2983	4883	201883	101883	Neha	Bhosale	BhosaleNC	Neha.Bhosale@thyssenkrupp.com	10628489	11723	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	\N	Pune	Maharashtra	411018	IN
2384	2984	4884	201884	101884	Vidyadhar	Shinde	ShindeVH	Vidyadhar.Shinde@thyssenkrupp.com	10628488	11724	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	+91 20 66124719	\N	\N	\N	\N
2385	2985	4885	201885	101885	Anish	Shiralkar	ShiralkarA	Anish.Shiralkar@thyssenkrupp.com	10628504	11734	Project Management / 9604	Project Management / 9604	\N	\N	\N	\N	\N
2386	2986	4886	201886	101886	Ameya	Jaydeokar	JaydeokarA	Ameya.Jaydeokar@thyssenkrupp.com	10628503	11735	Project Management / 9604	Project Management / 9604	+91 20 6612 4758	Pune	Maharashtra	411018	IN
2387	2987	4887	201887	101887	Priyanshu	Agarwal	AgarwalP	Priyanshu.Agarwal@thyssenkrupp.com	10628507	11731	Research & Development/1100	Research & Development/1100	\N	Pune	Maharashtra	411018	IN
2388	2988	4888	201888	101888	Manisha	Karunakaran	KarunakaranM	manisha.karunakaran@thyssenkrupp.com	10447308	9466	Sugar Management(4001)	Sugar Management(4001)	+91 20 6612 4181	Pune	Maharashtra	411018	IN
2389	2989	4889	201889	101889	Anand	Naik	NaikA	Anand.Naik@thyssenkrupp.com	10488507	2028	Hfsweld 5008	Hfsweld 5008	\N	Pune	Maharashtra	411018	IN
2390	2990	4890	201890	101890	Vivek	Jadhav	JadhavVV	Vivek.Jadhav@thyssenkrupp.com	10629353	91072	ENGG./EXECUTION INSTRUMENTATION (Dept Code: 7404)	ENGG./EXECUTION INSTRUMENTATION (Dept Code: 7404)	+91 20 6612 4208	Pune	Maharashtra	411018	IN
2391	2991	4891	201891	101891	Saurabh	Shrivastav	ShrivastavSA	Saurabh.Shrivastav@thyssenkrupp.com	10629593	11741	5700 SMB	SMB (5700)	\N	\N	\N	\N	\N
2392	2992	4892	201892	101892	Dipankar	Majumdar	MajumdarD	Dipankar.Majumdar@thyssenkrupp.com	10526004	60320	Services (Dept Code. 7807)	Services (Dept Code. 7807)	+91 20 6612 4869	Pune	Maharashtra	411018	IN
2393	2993	4893	201893	101893	Shivalingappa	Anavatter	AnavatterS	Shivalingappa.Anavatter@thyssenkrupp.com	10629518	91073	BOILER  ENGINEERING (Dept Code: 2003)	BOILER  ENGINEERING (Dept Code: 2003)	020 6612 4040	\N	\N	\N	\N
2394	2994	4894	201894	101894	Migration	tkii	Migrationtkii	Migration.tkii@thyssenkrupp.com	\N	Exchange to O365 Migration Account	\N	\N	\N	\N	\N	\N	\N
2395	2995	4895	201895	101895	Manas	Chowdhury	ChowdhuryM	\N	\N	9746	CIVIL  EXECUTION	CIVIL  EXECUTION	\N	Pune	Maharashtra	411018	IN
2396	2996	4896	201896	101896	Vishnu	Varier	VarierV	\N	\N	11719	WORKSHOP SUPERVISORS (Dept Code: 5061)	WORKSHOP SUPERVISORS (Dept Code: 5061)	+91 20 6612 4749	Pune	Maharashtra	411018	IN
2397	2997	4897	201897	101897	Vishal	Somani	SomaniV	\N	\N	11729	Purchase Material (Dept. ID: 7712)	Purchase Material (Dept. ID: 7712)	+91 20 6612 4765	Pune	Maharashtra	411018	IN
2398	2998	4898	201898	101898	Rahul	Panicker	PanickerRahul	\N	\N	11544	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2399	2999	4899	201899	101899	Nitesh	Kumar	KumarN	\N	\N	11588	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2400	3000	4900	201900	101900	Harish	Suthar	SutharH	\N	\N	11636	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2401	3001	4901	201901	101901	Manisha	Poojary	PoojaryM	\N	\N	9466	ADMINISTRATION (Dept Code: 7009)	ADMINISTRATION (Dept Code: 7009)	+91 20 6612 4836	Pune	Maharashtra	411018	IN
2402	3002	4902	201902	101902	tkii	system	tkiisystem	tkii.system@thyssenkrupp.com	\N	System-ID	on-line system (  Budget Over RUN Sanction System)	Technology and Information systems	\N	Pune	Maharashtra	411018	IN
2403	3003	4903	201903	101903	Hrushikesh	Deshmukh	DeshmukhHM	Hrushikesh.Deshmukh@thyssenkrupp.com	10629517	11739	Wagon Tipplers Design (Dept Code: 7334)	Wagon Tipplers Design (Dept Code: 7334)	+91 20 6612 4486	Pune	Maharashtra	411018	IN
2404	3004	4904	201904	101904	Jayant	Varat	VaratJ	jayant.varat.external@thyssenkrupp.com	\N	PFS331	Finance - Bill Passing	Finance - Bill Passing	\N	Pune	Maharashtra	411018	IN
2405	3005	4905	201905	101905	Anup	Kulkarni	Kulkarni_AA	anup.kulkarni.external@thyssenkrupp.com	10631413	PFS332	Finance - Bill Passing	Finance - Bill Passing	\N	Pune	Maharashtra	411018	IN
2406	3006	4906	201906	101906	Deepak	Kadam	KadamDD	deepak.kadam.external@thyssenkrupp.com	\N	PFS320	MHE Utilities - 7303	MHE Utilities - 7303	+91 20 6612 4468	Pune	maharashtra	411018	IN
2407	3007	4907	201907	101907	Rohit	Raj	RajR	Rohit.Raj@thyssenkrupp.com	10629589	11738	\N	MFS hall no.1	\N	Pune	Maharashtra	411018	IN
2408	3008	4908	201908	101908	Rakesh	Barik	BarikR	Rakesh.Barik@thyssenkrupp.com	10630437	91075	\N	SMB 5700	\N	\N	\N	\N	\N
2409	3009	4909	201909	101909	Sourabh	Selukar	SelukarS	Sourabh.Selukar@thyssenkrupp.com	10630271	91074	\N	SMB 5700	\N	Pimpri	Maharashtra	411018	IN
2410	3010	4910	201910	101910	Jyoti	Agrawal	AgrawalJ	Jyoti.Agrawal@thyssenkrupp.com	10630452	\N	Tech Center	Tech Center	\N	Pune	Maharashtra	411018	IN
2498	3098	4998	201998	101998	Veerendra	Sahu	SahuVP	Veerendra.Sahu@thyssenkrupp.com	10626571	60277	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2411	3011	4911	201911	101911	Dulal	Rakshit	RakshitD	Dulal.Rakshit@thyssenkrupp.com	10630023	60322	Construction dept ? 7804	Construction dept ? 7804	\N	Pune	Maharashtra	411018	IN
2412	3012	4912	201912	101912	Sunil	Acharya	AcharyaSK	Sunil.Acharya@thyssenkrupp.com	10628918	60319	Construction Services (Dept.Code: 7805)	Construction Services (Dept.Code: 7805)	\N	Pune	Maharashtra	411018	IN
2413	3013	4913	201913	101913	Kamlesh	Padiyar	PadiyarK	Kamlesh.Padiyar@thyssenkrupp.com	10631190	91076	\N	Services Dept	\N	Pune	Maharashtra	411018	IN
2414	3014	4914	201914	101914	Vipin	Bighane	BighaneV	Vipin.Bighane@thyssenkrupp.com	10631193	91077	Project Management / 9704	Project Management (Dept. code : 9704).	\N	Pune	Maharashtra	400018	IN
2415	3015	4915	201915	101915	Amit	Jadhav	Jadhav_A	Amit.Jadhav@thyssenkrupp.com	10631273	91079	Boiler & PP	PM B&PP	\N	Pune	Maharashtra	411018	IN
2416	3016	4916	201916	101916	Pramatma	Prasad	PrasadP	Pramatma.Prasad@thyssenkrupp.com	10630758	60329	Construction dept ? 7804	Construction dept ? 7804	\N	Pune	Maharashtra	411018	IN
2417	3017	4917	201917	101917	Nandkumar	Shinde	ShindeN	Nandkumar.Shinde2@thyssenkrupp.com	10631271	91078	PM B&PP	PM B&PP	\N	Pune	Maharashtra	411018	IN
2418	3018	4918	201918	101918	Rajshekhar	Titar	TitarR	Rajshekhar.Titar@thyssenkrupp.com	10631195	11743	WORKSHOP SUPERVISORS (Dept Code: 5061)	WORKSHOP SUPERVISORS (Dept Code: 5061)	+91 20 6612 4426	Pune	Maharashtra	411018	IN
2419	3019	4919	201919	101919	Udayan	Pawar	PawarU	Udayan.Pawar@thyssenkrupp.com	10631457	91080	FGD Equipment Design (Dept. 7335)	FGD Equipment Design (Dept. 7335)	+91 20 6612 4441	Pune	Maharashtra	411018	IN
2420	3020	4920	201920	101920	Vagili	Sagar	SagarV	Vagili.Sagar@thyssenkrupp.com	10631653	35118	Hyderabad Office PPC	Hyderabad Office PPC	\N	Pune	Maharashtra	411018	IN
2421	3021	4921	201921	101921	Abhijeet	Madane	MadaneA	Abhijeet.Madane@thyssenkrupp.com	10631194	11744	HFS Hall no.10	HFS Dept	\N	Pune	Maharashtra	411018	IN
2422	3022	4922	201922	101922	Mayuresh	Vaze	VazeM	Mayuresh.Vaze@thyssenkrupp.com	10631665	91082	Secretarial	Secretarial	+91 20 6612 4802	Pune	Maharashtra	411018	IN
2423	3023	4923	201923	101923	Guest	tkii	tkii_Guest	\N	\N	\N	For thyssenkrupp Official Guest	\N	\N	Pune	Maharashtra	400018	IN
2424	3024	4924	201924	101924	Sachin	Kothawade	KothawadeS	Sachin.Kothawade@thyssenkrupp.com	10631734	91083	BOILER  SELLING (Dept Code: 2002)	BOILER  SELLING (Dept Code: 2002)	020 6612 4801	Pimpri	Maharashtra	411018	IN
2425	3025	4925	201925	101925	Sanchit	Agrawal	AgrawalS	Sanchit.Agrawal@thyssenkrupp.com	10631778	91084	Project Management / 9704	Project Management / 9704	\N	Pune	Maharashtra	400018	IN
2426	3026	4926	201926	101926	Sushant	Pawar	Pawar_S	Sushant.Pawar@thyssenkrupp.com	10631664	11745	DESIGN & ENGINEERING  CRUSHER/SCREEN (Dept Code: 7304)	DESIGN & ENGINEERING  CRUSHER/SCREEN (Dept Code: 7304)	+91 20 6612 4220	Pune	Maharashtra	411018	IN
2427	3027	4927	201927	101927	Munjuluri	Srinivas	SrinivasM	Munjuluri.Srinivas@thyssenkrupp.com	10632163	98074	Hyderabad Office	ADMIN  (Dept Code: 5513)	040-2794 1201	Pune	Maharashtra	411018	IN
2428	3028	4928	201928	101928	Atul	Mane	ManeA	Atul.Mane@thyssenkrupp.com	10632338	91094	E&I (dept code7402)	E&I (dept code7402)	\N	Pune	Maharashtra	411018	IN
2429	3029	4929	201929	101929	Saurabh	Kulkarni	Kulkarni_S	Saurabh.Kulkarni2@thyssenkrupp.com	10632337	91093	E&I (dept code7402)	E&I  (dept code7402)	\N	Pune	Maharashtra	411018	IN
2430	3030	4930	201930	101930	Sarvesh	Saxena	SaxenaS	Sarvesh.Saxena@thyssenkrupp.com	10632575	11748	Cement Engineering	Cement Engineering	\N	Pune	Maharashtra	411018	IN
2431	3031	4931	201931	101931	Danish	Mulla	MullaD	Danish.Mulla@thyssenkrupp.com	10632574	91095	Cement  Selling (Dept Code: 6002)	Cement  Selling (Dept Code: 6002)	020 6612 4895	Pune	Maharashtra	411018	IN
2432	3032	4932	201932	101932	Suresh	Kumar	KumarSS	suresh.kumars@thyssenkrupp.com	10630851	60330	\N	Boiler Services R&R (7808)	\N	Pune	Maharashtra	411018	IN
2433	3033	4933	201933	101933	Busini	Thrilok	ThrilokB	Busini.Thrilok@thyssenkrupp.com	10632922	98075	Hyderabad Office	Hyderabad Office	\N	Pune	Maharashtra	411018	IN
2434	3034	4934	201934	101934	Anil	Kalal	KalalA	\N	\N	60171	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2435	3035	4935	201935	101935	Praveen	Kumar	KumarPV	\N	\N	90216	ENGG./EXECUTION INSTRUMENTATION (Dept Code: 7404)	ENGG./EXECUTION INSTRUMENTATION (Dept Code: 7404)	+91 20 6612 4129	Pune	Maharashtra	411018	IN
2436	3036	4936	201936	101936	Mohanish	Waghela	WaghelaM	\N	\N	91033	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4042	Pune	Maharashtra	411018	IN
2437	3037	4937	201937	101937	Sachin	Dange	DangeS	\N	\N	60263	Construction Services (Dept.Code: 7805)	Construction Services (Dept.Code: 7805)	\N	Pune	Maharashtra	411018	IN
2438	3038	4938	201938	101938	Abhishek	Kumar	kumarA	\N	\N	90668	Electrical Department	Electrical Department	+91 20 6612 4719	Pune	Maharashtra	411018	IN
2439	3039	4939	201939	101939	Santoshkumar	Sanadi	SanadiS	\N	\N	90872	DESIGN & ENGINEERING  STRUCTURAL (Dept Code: 7305)	DESIGN & ENGINEERING  STRUCTURAL (Dept Code: 7305)	+91 20 6612 4828	Pune	Maharashtra	411018	IN
2440	3040	4940	201940	101940	Deepak	Patil	PatilDD	\N	\N	60131	DE-S (Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4849	Pune	Maharashtra	411018	IN
2441	3041	4941	201941	101941	Amruta	Dongare	DongareA	\N	\N	90886	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4842	Pune	Maharashtra	411018	IN
2442	3042	4942	201942	101942	Abhijeet	Dhavale	DhavaleA	\N	\N	60134	Services - After Sales (Dept Code 7807)	Services - After Sales (Dept Code 7807)	+91 20 6612 4869	Pune	Maharashtra	411018	IN
2443	3043	4943	201943	101943	Nitin	Pawar	PawarNM	\N	\N	60060	Construction Services (Dept.Code: 7805)	Construction Services (Dept.Code: 7805)	\N	Pune	Maharashtra	411018	IN
2444	3044	4944	201944	101944	Manoj	Chasta	ChastaM	\N	\N	60168	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2445	3045	4945	201945	101945	dinesh	krishnan	krishnandk	\N	\N	60186	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2446	3046	4946	201946	101946	Narendra	Joshi	JoshiN	\N	\N	60184	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2447	3047	4947	201947	101947	Prodipto	Ghosh	GhoshP	\N	\N	60242	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2448	3048	4948	201948	101948	Dev	Pandey	PandeyDev	\N	\N	60101	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2449	3049	4949	201949	101949	Arbind	Prajapati	PrajapatiA	\N	\N	60062	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2450	3050	4950	201950	101950	Shivang	Gaur	GaurS	\N	\N	90776	Services	\N	\N	\N	\N	\N	\N
2499	3099	4999	201999	101999	Shubham	Dubey	DubeySD	Shubham.Dubey@thyssenkrupp.com	10627043	60290	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2451	3051	4951	201951	101951	Poonam	Borate	BorateP	Poonam.Borate@thyssenkrupp.com	10632916	91096	FINANCE  BOOK KEEPING (Dept Code: 7602)	FINANCE  BOOK KEEPING (Dept Code: 7602)	\N	Pune	Maharashtra	411018	IN
2452	3052	4952	201952	101952	Satish	Sawase	SawaseS	Satish.Sawase@thyssenkrupp.com	10632339	11747	Quality Assurance	Quality Assurance	\N	Pune	Maharashtra	411018	IN
2453	3053	4953	201953	101953	Dhananjay	Sonawane	SonawaneD	dhananjay.sonawane.external@thyssenkrupp.com	\N	PFS296	Subcontract Department	Subcontract Department	\N	Pune	Maharashtra	411018	IN
2454	3054	4954	201954	101954	Suraj	Rane	RaneST	suraj.rane.external@thyssenkrupp.com	\N	PFS295	Subcontract Department	Subcontract Department	\N	Pune	Maharashtra	411018	IN
2455	3055	4955	201955	101955	Meher Prakash	Nori	NoriM	meherprakash.nori@thyssenkrupp.com	10633222	91097	Boiler & PP	Boiler & PP	\N	Pune	Maharashtra	411018	IN
2456	3056	4956	201956	101956	Akancha	Sonkar	SonkarA	\N	\N	90746	Finance Dept.	Finance Dept.	+91 20-66124342	Pune	Maharashtra	411018	IN
2457	3057	4957	201957	101957	Santosh	Singh	Singh_SK	Santosh.Singh@thyssenkrupp.com	10625224	91063	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2458	3058	4958	201958	101958	Mithileshh	Reddy	ReddyMP	Mithileshh.Reddy@thyssenkrupp.com	10627197	11720	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2459	3059	4959	201959	101959	Pragyan	Pathak	PathakPU	Pragyan.Pathak@thyssenkrupp.com	10629804	11742	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2460	3060	4960	201960	101960	Nitish	Bondre	BondreNV	Nitish.Bondre@thyssenkrupp.com	10628775	11737	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2461	3061	4961	201961	101961	Sunil	Singh	Singh-SK	Sunil.Singh@thyssenkrupp.com	10627592	91067	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2462	3062	4962	201962	101962	Riken	Desai	DesaiRT	Riken.Desai@thyssenkrupp.com	10627207	11711	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2463	3063	4963	201963	101963	Renjith	Rama Varma	RamaVarmaRM	Renjith.RamaVarma@thyssenkrupp.com	10622683	60249	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2464	3064	4964	201964	101964	Amit	Yadav	YadavAmitK	Amit.Yadav@thyssenkrupp.com	10619276	60160	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2465	3065	4965	201965	101965	Mahipatsinh	Chauhan	ChauhanMJ	Mahipatsinh.Chauhan@thyssenkrupp.com	10500174	60075	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2466	3066	4966	201966	101966	Yatendra	Kumar	KumarYR	Yatendra.Kumar@thyssenkrupp.com	10623610	60255	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2467	3067	4967	201967	101967	Pradeep	Pathak	PathakPK	Pradeep.Pathak@thyssenkrupp.com	10619341	60229	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2468	3068	4968	201968	101968	Darshankumar	Prajapati	PrajapatiDS	Darshankumar.Prajapati@thyssenkrupp.com	10619266	60150	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2469	3069	4969	201969	101969	Yogendra	Pandey	PandeyYK	Yogendra.Pandey@thyssenkrupp.com	10521478	60130	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2470	3070	4970	201970	101970	Debjyoti	Haldar	HaldarDS	Debjyoti.Haldar@thyssenkrupp.com	10622351	60247	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2471	3071	4971	201971	101971	Vivek	Kumar	Kumar-VM	Vivek.Kumar@thyssenkrupp.com	10622964	60251	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2472	3072	4972	201972	101972	Arvind	Kumar	KumarAP	Arvind.Kumar@thyssenkrupp.com	10619268	60152	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2473	3073	4973	201973	101973	M	Ananthakrishnan	AnanthakrishnanMM	M.Ananthakrishnan@thyssenkrupp.com	10621011	60246	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2474	3074	4974	201974	101974	Rajamani	Venkataramani	VenkataramaniRI	Rajamani.Venkataramani@thyssenkrupp.com	10500186	60079	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2475	3075	4975	201975	101975	Harsh	Rathod	RathodHN	Harsh.Rathod@thyssenkrupp.com	10500263	60105	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2476	3076	4976	201976	101976	Manish	Tiwari	TiwariMK	Manish.Tiwari@thyssenkrupp.com	10548987	60142	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2477	3077	4977	201977	101977	Pankaj	Pandey	PandeyPT	Pankaj.Pandey@thyssenkrupp.com	10623620	60254	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2478	3078	4978	201978	101978	Sachin	Jain	JainSP	Sachin.Jain2@thyssenkrupp.com	10514755	60122	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2479	3079	4979	201979	101979	Pratap	Rout	RoutPP	Pratap.Rout@thyssenkrupp.com	10620180	60236	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2480	3080	4980	201980	101980	Shubham	Tiwari	TiwariSS	Shubham.Tiwari@thyssenkrupp.com	10618988	60064	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2481	3081	4981	201981	101981	Soumya	Routh	RouthSS	Soumya.Routh@thyssenkrupp.com	10622348	60248	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2482	3082	4982	201982	101982	Ratnesh	Kaushik	KaushikRB	Ratnesh.Kaushik@thyssenkrupp.com	10514756	60124	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2483	3083	4983	201983	101983	Kishore	Mohanty	MohantyKK	Kishore.Mohanty@thyssenkrupp.com	10624446	60267	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2484	3084	4984	201984	101984	Rishi	Dwivedi	DwivediRR	Rishi.Dwivedi@thyssenkrupp.com	10624445	60268	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2485	3085	4985	201985	101985	Ayush	Shukla	ShuklaAR	Ayush.Shukla@thyssenkrupp.com	10623619	60257	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2486	3086	4986	201986	101986	Gaurav	Dhanre	DhanreGT	Gaurav.Dhanre@thyssenkrupp.com	10624448	60265	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2487	3087	4987	201987	101987	Praveen	Gupta	GuptaPR	Praveen.Gupta@thyssenkrupp.com	10624486	60269	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2488	3088	4988	201988	101988	Rajendra	Harijan	HarijanRK	Rajendra.Harijan@thyssenkrupp.com	10624447	60266	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2489	3089	4989	201989	101989	Dharmendra	Mewade	MewadeDG	Dharmendra.Mewade@thyssenkrupp.com	10623615	60259	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2490	3090	4990	201990	101990	Gaurav	Tiwari	TiwariGG	Gaurav.Tiwari@thyssenkrupp.com	10623614	60260	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2491	3091	4991	201991	101991	Pradeep	Kumar	KumarPR	Pradeep.Kumar2@thyssenkrupp.com	10626590	60285	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2492	3092	4992	201992	101992	Chandra	Pandey	PandeyCP	Chandra.Pandey@thyssenkrupp.com	10626117	60274	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2493	3093	4993	201993	101993	Nishant	Choudhary	ChoudharyNR	\N	\N	60286	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2494	3094	4994	201994	101994	Vivek	Singh	SinghVR	Vivek.Singh2@thyssenkrupp.com	10626583	60278	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2495	3095	4995	201995	101995	Mithun	Ghosh	GhoshMM	Mithun.Ghosh@thyssenkrupp.com	10627194	60293	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2496	3096	4996	201996	101996	Chirag	Jadav	JadavCG	Chirag.Jadav@thyssenkrupp.com	10625507	60272	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2501	3101	5001	202001	102001	Pradeep	Totadi	TotadiPK	Pradeep.Totadi@thyssenkrupp.com	10626584	60279	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2502	3102	5002	202002	102002	Arup	Das	DasAS	Arup.Das@thyssenkrupp.com	10626585	60281	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2503	3103	5003	202003	102003	Sachin	Khobragade	KhobragadeSB	Sachin.Khobragade@thyssenkrupp.com	10626118	60276	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2504	3104	5004	202004	102004	SushilKumar	Singh	SinghSushilKB	SushilKumar.Singh2@thyssenkrupp.com	10626770	60289	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2505	3105	5005	202005	102005	Debasis	Patra	PatraDK	Debasis.Patra@thyssenkrupp.com	10627042	60291	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2506	3106	5006	202006	102006	Abhishek	Richhariya	RichhariyaAR	Abhishek.Richhariya@thyssenkrupp.com	10626588	60284	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2507	3107	5007	202007	102007	Yogesh	Pandit	PanditYA	Yogesh.Pandit@thyssenkrupp.com	10626573	60287	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2508	3108	5008	202008	102008	Jeeban	Mahanayak	MahanayakJP	Jeeban.Mahanayak@thyssenkrupp.com	10626587	60283	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2509	3109	5009	202009	102009	VivekSingh	Yadav	YadavVivekSS	VivekSingh.Yadav@thyssenkrupp.com	10626586	60282	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2510	3110	5010	202010	102010	Reetesh	Singh	SinghRK	Reetesh.Singh@thyssenkrupp.com	10625646	60273	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2511	3111	5011	202011	102011	Neeraj	Shriwas	ShriwasNR	Neeraj.Shriwas@thyssenkrupp.com	10627370	60298	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2512	3112	5012	202012	102012	A	Rajesh	RajeshAA	\N	\N	60302	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2513	3113	5013	202013	102013	Alkesh	Upadhyay	UpadhyayAA	Alkesh.Upadhyay@thyssenkrupp.com	10627501	60305	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2514	3114	5014	202014	102014	Ajeet	Singh	SinghAG	\N	\N	60300	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2515	3115	5015	202015	102015	Shiv	Singh	SinghSN	Shiv.Singh@thyssenkrupp.com	10627044	60295	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2516	3116	5016	202016	102016	Sultan	Ali	AliSA	Sultan.Ali@thyssenkrupp.com	10627387	60304	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2517	3117	5017	202017	102017	Ramdas	Prajapati	PrajapatiRM	Ramdas.Prajapati@thyssenkrupp.com	10627372	60297	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2518	3118	5018	202018	102018	DevendraSingh	Yadav	YadavDevendraSN	DevendraSingh.Yadav@thyssenkrupp.com	10627590	60307	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2519	3119	5019	202019	102019	Ved	Sakwar	SakwarVP	Ved.Sakwar@thyssenkrupp.com	10627367	60301	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2520	3120	5020	202020	102020	Santosh	Singh	SinghSantoshK	Santosh.Singh2@thyssenkrupp.com	10627045	60296	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2521	3121	5021	202021	102021	Vrejendra	Kourav	KouravVS	Vrejendra.Kourav@thyssenkrupp.com	10627502	60306	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2522	3122	5022	202022	102022	Mohan	Natarajan	NatarajanMN	\N	\N	60299	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2523	3123	5023	202023	102023	Kalidasu	Saibabu	SaibabuKN	Kalidasu.Saibabu@thyssenkrupp.com	10627588	60308	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2524	3124	5024	202024	102024	Rajesh	Mohapatra	MohapatraRK	Rajesh.Mohapatra@thyssenkrupp.com	10628011	60317	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2525	3125	5025	202025	102025	Harish	Suthar	SutharHJ	Harish.Suthar@thyssenkrupp.com	10564219	60325	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2526	3126	5026	202026	102026	Nitesh	Kumar	KumarNG	Nitesh.Kumar@thyssenkrupp.com	10513094	60323	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2527	3127	5027	202027	102027	Rangnath	Singh	SinghRS	Rangnath.Singh@thyssenkrupp.com	10627772	60313	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2528	3128	5028	202028	102028	T	Sathiskumar	SathiskumarTT	T.Sathiskumar@thyssenkrupp.com	10627586	60309	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2529	3129	5029	202029	102029	Jugal	Nayak	NayakJK	\N	\N	60321	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2530	3130	5030	202030	102030	Sushil	Tiwari	TiwariSK	Sushil.Tiwari@thyssenkrupp.com	10628009	60315	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2531	3131	5031	202031	102031	Rahul	Panicker	PanickerRR	Rahul.Panicker@thyssenkrupp.com	10488526	60324	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2532	3132	5032	202032	102032	Mohmmad	Ansari	AnsariMI	Mohmmad.Ansari@thyssenkrupp.com	10628794	60318	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2533	3133	5033	202033	102033	AtulKumar	Shivhare	ShivhareAtulKL	AtulKumar.Shivhare@thyssenkrupp.com	10627771	60312	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2534	3134	5034	202034	102034	Rohit	Kumar	Kumar_RK	Rohit.Kumar@thyssenkrupp.com	10630702	60326	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2535	3135	5035	202035	102035	Ashish	Choubey	ChoubeyAK	Ashish.Choubey@thyssenkrupp.com	10628010	60316	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2536	3136	5036	202036	102036	Khushhal	Tomar	TomarKP	Khushhal.Tomar@thyssenkrupp.com	10627716	60310	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2537	3137	5037	202037	102037	Srinivasarao	Gedda	GeddaSS	Srinivasarao.Gedda@thyssenkrupp.com	10627770	60311	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2538	3138	5038	202038	102038	Vivek	Kumar	Kumar-VR	Vivek.Kumar2@thyssenkrupp.com	10504497	60115	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2539	3139	5039	202039	102039	Pareekshit	Katwal	KatwalP	Pareekshit.Katwal@thyssenkrupp.com	10633130	11751	Construction Services (Dept.Code: 7805)	Construction Services (Dept.Code: 7805)	9805279043	Pune	Maharashtra	411018	IN
2540	3140	5040	202040	102040	Mrinal	Deyati	DeyatiM	Mrinal.Deyati@thyssenkrupp.com	10633406	91098	Kolkata Office	D& E Structural  7305	\N	Pune	Maharashtra	411018	IN
2541	3141	5041	202041	102041	Abhinav	Singh	Singh_A	\N	\N	\N	Tech Center	Tech Center	\N	Pune	Maharashtra	411018	IN
2542	3142	5042	202042	102042	Navdeep	Chandel	ChandelN	\N	\N	PFS340	Project Management (Dept. code : 9204)	Project Management (Dept. code : 9204)	\N	Pune	Maharashtra	400018	IN
2543	3143	5043	202043	102043	\N	\N	___VMware_Conv_SA___	\N	\N	\N	Dedicated User to run VMware Converter Standalone server jobs.	\N	\N	\N	\N	\N	\N
2544	3144	5044	202044	102044	tkIIEMCHP	HPL	tkIIEMCHP	tkIIEMCHP.HPL@thyssenkrupp.com	\N	\N	\N	\N	\N	\N	\N	\N	\N
2545	3145	5045	202045	102045	PM	DangoteGhana	DangoteGhanaPM	PM.DangoteGhana@thyssenkrupp.com	\N	\N	\N	Function ID	\N	\N	\N	\N	\N
2546	3146	5046	202046	102046	Prasad	Gumati	GumatiP	\N	\N	11740	QUALITY-  PRODUCTION (Dept Code: 5403)	QUALITY-  PRODUCTION (Dept Code: 5403)	\N	Pune	Maharashtra	411018	IN
2547	3147	5047	202047	102047	Vaibhav	More	MoreVM	\N	\N	60314	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2548	3148	5048	202048	102048	Pankaj	Garg	GargPT	\N	\N	60240	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2550	3150	5050	202050	102050	tkII	PrintScan	tkIIPrintScan	print-scan.tkII@thyssenkrupp.com	\N	\N	\N	T&IS Dept	\N	\N	\N	\N	\N
2551	3151	5051	202051	102051	Lakshmita	Lamani	LamaniL	\N	\N	90924	Import Export (Dept. Code: 7652 )	Import Export (Dept. Code: 7652 )	+ 91 20 6612 4733	\N	\N	\N	\N
2552	3152	5052	202052	102052	Pratik	Tambade	TambadeP	Pratik.Tambade@thyssenkrupp.com	10633405	91099	MANUFACTURING Mech Assly (Dept Code. 5061)	MANUFACTURING Mech Assly (Dept Code. 5061)	+91 20 6612 4372	Pune	Maharashtra	411018	IN
2553	3153	5053	202053	102053	Deepak	Reddy	ReddyDV	Deepak.Reddy@thyssenkrupp.com	10633131	11750	Construction dept ? 7805	Construction dept ? 7805	\N	Pune	Maharashtra	411 018	IN
2554	3154	5054	202054	102054	Manas	Bala	BalaMK	\N	\N	60327	Construction dept ? 7202	Construction dept ? 7202	\N	Pune	Maharashtra	411018	IN
2555	3155	5055	202055	102055	Bhoopendra	Barve	BarveB	Bhoopendra.Barve@thyssenkrupp.com	10633910	91101	FGD Equipment Design (Dept. 7335)	FGD Equipment Design (Dept. 7335)	+91 20 6612 4441	Pune	Maharashtra	411018	IN
2556	3156	5056	202056	102056	Ranjeet	Bhal	BhalR	Ranjeet.Bhal@thyssenkrupp.com	10630850	60328	Construction Services (Dept.Code: 7805)	Construction Services (Dept.Code: 7805)	7978000247	Pune	Maharashtra	411018	IN
2557	3157	5057	202057	102057	Keval	Gangawane	GangawaneK	Keval.Gangawane@thyssenkrupp.com	10634127	91102	Stores & Dispatch - 7752	Stores & Dispatch - 7752	020 6612 4324	Pune	Maharashtra	411018	IN
2558	3158	5058	202058	102058	Akshay	Pawar	PawarAN	Akshay.Pawar@thyssenkrupp.com	10634509	11757	Design & Engineering To Group Co.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	\N	Pune	Maharashtra	411018	IN
2559	3159	5059	202059	102059	Pranav	Deshpande	Deshpande_P	Pranav.Deshpande@thyssenkrupp.com	10634511	11754	Design & Engineering To Group Co.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	\N	Pune	Maharashtra	411018	IN
2560	3160	5060	202060	102060	Akshay	Dhamangaonkar	DhamangaonkarA	Akshay.Dhamangaonkar@thyssenkrupp.com	10634510	11755	Design & Engineering To Group Co.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	\N	Pune	Maharashtra	411018	IN
2561	3161	5061	202061	102061	Mayur	Chaudhari	ChaudhariMV	Mayur.Chaudhari@thyssenkrupp.com	10634508	11756	Design & Engineering To Group Co.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	\N	Pune	Maharashtra	411018	IN
2562	3162	5062	202062	102062	Albert	R	AlbertR	Albert.R@thyssenkrupp.com	10634439	91103	Project Management / 9704	Project Management / 9704	\N	Pune	Maharashtra	400018	IN
2563	3163	5063	202063	102063	Snehashis	Dhali	DhaliS	Snehashis.Dhali@thyssenkrupp.com	10634438	91104	B&PP Commissioning	B&PP Commissioning	\N	\N	\N	\N	\N
2564	3164	5064	202064	102064	Pujala	Raghuvamsi	RaghuvamsiP	Pujala.Raghuvamsi@thyssenkrupp.com	10635029	35121	Hyderabad Office	Hyderabad Office	\N	\N	\N	\N	\N
2565	3165	5065	202065	102065	Saurav	Kumar	Kumar_S	Saurav.Kumar@thyssenkrupp.com	10634440	11752	Construction dept. ? 7202	Construction dept. ? 7202	\N	Pune	Maharastra	411018	IN
2566	3166	5066	202066	102066	Jitendra	Shende	ShendeJ	Jitendra.Shende@thyssenkrupp.com	10635014	91109	MHE Revamp (7808)	MHE Revamp (7808)	020 6612 4599	Pune	Maharashtra	411018	IN
2567	3167	5067	202067	102067	Mudit	Pandey	PandeyM	Mudit.Pandey@thyssenkrupp.com	10634441	11753	Services (7808)	Services (7808)	\N	Pune	Maharashtra	411018	IN
2568	3168	5068	202068	102068	Vinod	Patil	PatilVB	Vinod.Patil@thyssenkrupp.com	10551260	91026	DESIGN & ENGINEERING.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	+91 20 6612 4642	Pune	Maharashtra	411018	IN
2569	3169	5069	202069	102069	Anand	Deshpande	DeshpandeAP	Anand.Deshpande@thyssenkrupp.com	10635110	91110	CPM / 7609	CPM / 7609	+91 20 6612 4484	Pune	Maharashtra	411018	IN
2570	3170	5070	202070	102070	Krishnamohan	DV	KrishnamohanDV	Krishnamohan.DV@thyssenkrupp.com	10635197	91113	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	+91 20 6612 4705	Pune	Maharashtra	411018	IN
2571	3171	5071	202071	102071	Naresh	Thakre	ThakreN	Naresh.Thakre@thyssenkrupp.com	10635111	91111	Services  (Dept. Code: 7807)	Services  (Dept. Code: 7807)	\N	Pune	Maharashtra	411018	IN
2572	3172	5072	202072	102072	Sunilkumar	Awasthi	AwasthiSK	Sunilkumar.Awasthi@thyssenkrupp.com	10481192	60341	Services (Dept.Code: 7805)	Services (Dept.Code: 7805)	\N	Pune	Maharashtra	411018	IN
2573	3173	5073	202073	102073	Rajesh	Singh	SinghRB	rajesh.singh@thyssenkrupp.com	10515468	91105	BOUGHT OUT ADMINISTRATION	BOUGHT OUT ADMINISTRATION	+91 20 6612 4276	Pune	Maharashtra	411018	IN
2574	3174	5074	202074	102074	Vipul	Biranje	BiranjeV	Vipul.Biranje@thyssenkrupp.com	10488248	2015	MANUFACTURING Mech Assly (Dept Code. 5061)	CON.MANUFACTURING Mech Assly (Dept Code. 5061)	+ 91 20 6612 4407	Pune	Maharashtra	411018	IN
2575	3175	5075	202075	102075	Ramchandra	Waingade	WaingadeR	Ramchandra.Waingade@thyssenkrupp.com	10488693	1998	MANUFACTURING Mech Assly (Dept Code. 5061)	MANUFACTURING Machine shop (Dept.Code 5061)	+ 91 20 6612 4407	Pune	Maharashtra	411018	IN
2576	3176	5076	202076	102076	Kamalakannan	K	KamalakannanK	Kamalakannan.K@thyssenkrupp.com	10635196	91112	Construction dept ? 7805	Construction dept ? 7805	\N	Pune	Maharashtra	411 018	IN
2577	3177	5077	202077	102077	Rajan	Acharya	AcharyaR	Rajan.Acharya@thyssenkrupp.com	10635523	91115	Finance Controlling(Dept. Code:7607)	Finance Controlling(Dept. Code:7607)	\N	Pune	Maharashtra	411018	IN
2578	3178	5078	202078	102078	Sandeep	Solse	SolseS	Sandeep.Solse@thyssenkrupp.com	10635477	91114	MHE Utilities - 7303	MHE Utilities - 7303	+91 20 6612 4844	Pune	maharashtra	411018	IN
2579	3179	5079	202079	102079	Vasanthan	KP	VasanthanKP	vasanthan.kp@thyssenkrupp.com	10635814	91116	SUGAR  SELLING (Dept Code: 4002)	SUGAR  SELLING (Dept Code: 4002)	+91 20 6612 4245	Pune	Maharashtra	411018	IN
2580	3180	5080	202080	102080	Dasharatha	Rana	RanaD	Dasharatha.Rana@thyssenkrupp.com	10634131	60345	Construction dept ? 7805	Construction dept ? 7805	\N	Pune	Maharashtra	411 018	IN
2581	3181	5081	202081	102081	Shashikant	Ahire	AhireS	Shashikant.Ahire@thyssenkrupp.com	10636052	91117	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	020 6612 4451	Pune	Maharashtra	411018	IN
2582	3182	5082	202082	102082	Mohammedwasif	Patel	PatelM	Mohammedwasif.Patel@thyssenkrupp.com	10635276	35122	Fabrication	Fabrication	\N	\N	\N	\N	\N
2583	3183	5083	202083	102083	Aritra	Bhaduri	BhaduriA	Aritra.Bhaduri@thyssenkrupp.com	10636596	91120	ENGG./EXECUTION INSTRUMENTATION ( Dept.Code 7404)	ENGG./EXECUTION INSTRUMENTATION ( Dept.Code 7404)	\N	Pune	Maharashtra	411018	IN
2584	3184	5084	202084	102084	Manali	Kadam	KadamM	Manali.Kadam@thyssenkrupp.com	10609708	1793186	QUALITY- SUB CONTRACT (Dept Code: 5404)	QUALITY- SUB CONTRACT (Dept Code: 5404)	\N	Pune	Maharashtra	411018	\N
2725	3325	5225	202225	102225	Jayakumar	JM	JayakumarJM	\N	10650355	60390	\N	Services - Cement Division	\N	Pune	Maharastra	411018	IN
2585	3185	5085	202085	102085	Nitin	Verma	VermaN	Nitin.Verma@thyssenkrupp.com	10636062	60352	Services  (Dept. Code: 7802)	Construction dept. ? 7202	\N	Pune	Maharashtra	411018	IN
2586	3186	5086	202086	102086	Vinaykumar	Pingali	PingaliV	Vinaykumar.Pingali@thyssenkrupp.com	10636718	91121	MHE	MHE	\N	Pune	Maharashtra	411018	IN
2587	3187	5087	202087	102087	Susan	Daniel	DanielS	susan.daniel.external@thyssenkrupp.com	10636788	PFS346	Project Management	Project Management	+91 20 6612 4131	Pune	Maharashtra	400018	IN
2588	3188	5088	202088	102088	Milind	Chaudhari	Chaudhari_MV	Milind.Chaudhari@thyssenkrupp.com	10636801	91122	Boiler & PP (Dept. Code 2005)	BOILER  DESIGN & ENGINEERING (Dept Code: 2005)	\N	Pune	Maharashtra	411018	IN
2589	3189	5089	202089	102089	Sourabh	Ghadge	GhadgeS	Sourabh.Ghadge@thyssenkrupp.com	10637130	11759	Mining / MHE Mineral processing (Dept. Code 3008)	MHE ? DIVISION - MINERAL PROCESSING Dept 3008	+91 66124076	Pune	Maharashtra	411018	IN
2590	3190	5090	202090	102090	Mayuresh	Deo	DeoM	Mayuresh.Deo@thyssenkrupp.com	10637129	11758	MHE Design Pulleys & Idlers (Dept. 7332)	MHE Design Pulleys & Idlers (Dept. 7332)	+91 20 6612 4781	Pune	Maharashtra	411018	IN
2591	3191	5091	202091	102091	Subin	Baskaran	BaskaranSV	Subin.Baskaran@thyssenkrupp.com	10617414	11699	Construction dept. ? 7805	Construction Services (Dept.Code: 7805)	\N	Pune	Maharashtra	411018	IN
2592	3192	5092	202092	102092	Girish	Joshi	JoshiG	\N	\N	5240	DESIGN & ENGINEERING  STRUCTURAL (Dept Code: 7305)	DESIGN & ENGINEERING  STRUCTURAL (Dept Code: 7305)	+91 20 6612 4479	Pune	Maharashtra	411018	IN
2593	3193	5093	202093	102093	Samir	Kitukale	KitukaleS	Samir.Kitukale@thyssenkrupp.com	10637738	91126	Service 7808	Service 7808	\N	Pune	Maharashtra	411 018	IN
2594	3194	5094	202094	102094	Englesh	Saini	SainiE	Englesh.Saini@thyssenkrupp.com	10637741	91127	Service 7808	Service 7808	\N	Pune	Maharashtra	411018	IN
2595	3195	5095	202095	102095	Ashish	Kathpal	KathpalA	Ashish.Kathpal@thyssenkrupp.com	10637740	91128	PM B&PP  (9206 )	PM B&PP  (9206 )	\N	Pune	Maharashtra	411018	IN
2596	3196	5096	202096	102096	Akshay	Patil	PatilAN	Akshay.Patil@thyssenkrupp.com	10638048	11760	SUGAR  Division (Dept Code: 4003)	SUGAR  Division (Dept Code: 4003)	\N	Pune	Maharashtra	411018	IN
2597	3197	5097	202097	102097	Vijay	Jadhav	JadhavVT	Vijay.Jadhav@thyssenkrupp.com	10638046	11761	Service 7808	Service 7808	\N	Pune	Maharashtra	411018	IN
2598	3198	5098	202098	102098	Puneet	Minj	MinjP	Puneet.Minj@thyssenkrupp.com	10636802	91123	Boiler Commissioning - 9206	Boiler Commissioning - 9206	\N	Pune	Maharashtra	411018	IN
2599	3199	5099	202099	102099	Devagiri	Gedela	GedelaD	Devagiri.Gedela@thyssenkrupp.com	10632915	60339	Services  (Dept. Code: 7807)	Services  (Dept. Code: 7807)	\N	Pune	Maharashtra	411018	IN
2600	3200	5100	202100	102100	Raju	Khade	KhadeR	Raju.Khade@thyssenkrupp.com	10638212	91130	Cement Marketing (Dept Code: 6002)	Cement Marketing (Dept Code: 6002)	\N	Pune	Maharashtra	411018	IN
2601	3201	5101	202101	102101	Ankit	Gawande	GawandeA	Ankit.Gawande@thyssenkrupp.com	10638047	91129	Design	Design	\N	Pune	Maharashtra	411018	IN
2602	3202	5102	202102	102102	Star	CCM	STCCM01	\N	\N	\N	For Star CCM Application	\N	\N	\N	\N	\N	\N
2603	3203	5103	202103	102103	Printer	Admin	Printer.admin	\N	\N	System-ID	Admin User For Canon Printers	\N	\N	\N	\N	\N	\N
2604	3204	5104	202104	102104	Ashish	Dubey	DubeyA	\N	10637668	Tech Center	Tech Center (O365 ID)	Tech Center	\N	\N	\N	\N	\N
2605	3205	5105	202105	102105	Vaibhav	Mase	MaseV	Vaibhav.Mase@thyssenkrupp.com	10638964	91131	PM_Planning_9704	PM_Planning_9704	\N	Pune	Maharashtra	400018	IN
2606	3206	5106	202106	102106	Samir	Attar	AttarS	\N	\N	PFS305	MHE-SYSTEMS (Dept Code: 7303)	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	+91 20 6612 4468	Pune	Maharashtra	411018	IN
2607	3207	5107	202107	102107	Pramod	Kumar	PKumar	Pramod.Kumar@thyssenkrupp.com	10637327	91125	B&PP Commissioning	B&PP Commissioning  (9206 )	\N	Pune	Maharashtra	411018	IN
2608	3208	5108	202108	102108	Avishkar	Sorate	SorateA	Avishkar.Sorate@thyssenkrupp.com	10638687	11762	Design & Engineering To Group Co.(Dept Code: 6006)	Design & Engineering To Group Co.(Dept Code: 6006)	\N	Pune	Maharashtra	411018	IN
2609	3209	5109	202109	102109	SPDMS	batch	spdmsbatch	\N	\N	\N	Function ID	Polysius India	\N	Pune	Maharashtra	411018	IN
2610	3210	5110	202110	102110	Pooja	Jadhav	JadhavPR	\N	\N	40642	Sugar dept. (dept. code: 4003)	Sugar dept. (dept. code: 4003)	+91 20 6612 4777	Pune	Maharashtra	411018	IN
2611	3211	5111	202111	102111	Aditya	Shrivastava	ShrivastavaA	\N	\N	90949	Boiler Services R&R (7808)	Boiler Services R&R (7808)	\N	Pune	Maharashtra	411018	IN
2612	3212	5112	202112	102112	Tushar	Das	DasTR	\N	\N	90763	Construction Services  (Dept. Code: 7804 )	Services Dept. ( MHE 7804 )	\N	Pune	Maharashtra	411018	IN
2613	3213	5113	202113	102113	Nikhil	Phadnis	PhadnisN	\N	\N	9823	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	ENGG./EXECUTION ELECTRICAL (Dept Code: 7402)	+91 20 6612 4705	Pune	Mahrashtra	411018	IN
2614	3214	5114	202114	102114	Niraj	Kishore	KishoreN	\N	\N	60169	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2615	3215	5115	202115	102115	Brijesh	Mishra	MishraBK	\N	\N	60258	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2616	3216	5116	202116	102116	Mukesh	Kumar	MKumar	Mukesh.Kumar@thyssenkrupp.com	10639265	60359	Construction Services (Dept.Code: 7805)	Construction Services (Dept.Code: 7805)	\N	Pune	Maharashtra	411018	IN
2617	3217	5117	202117	102117	E3D	Batch	E3DBatch	\N	\N	\N	\N	Polysius India	\N	Pune	Maharashtra	411018	IN
2618	3218	5118	202118	102118	Seshadeb	Dora	DoraS	Seshadeb.Dora@thyssenkrupp.com	10638228	60357	Construction Services (Dept.Code: 7805)	Construction Services (Dept.Code: 7805)	\N	Pune	Maharashtra	411018	IN
2619	3219	5119	202119	102119	Sudhanshu	Behera	BeheraSB	Sudhanshu.Behera@thyssenkrupp.com	10637132	91124	Construction dept. ? 7202	Construction dept. ? 7202	\N	Pune	Maharashtra	411018	IN
2620	3220	5120	202120	102120	Chandrashekhar	Barwad	BarwadC	Chandrashekhar.Barwad@thyssenkrupp.com	10639510	91132	Mineral Processing	Mineral Processing	\N	Pune	Maharashtra	411018	IN
2621	3221	5121	202121	102121	Pavan	Deshmane	DeshmaneP	Pavan.Deshmane@thyssenkrupp.com	10639292	40825	MHE System	MHE System- 7303	+91 20 6612 4777	Pune	maharashtra	411018	IN
2622	3222	5122	202122	102122	Suraj	Botre	BotreS	Suraj.Botre@thyssenkrupp.com	10639293	40826	MHE System	MHE System- 7303	+91 20 6612 4777	Pune	maharashtra	411018	IN
2623	3223	5123	202123	102123	Venkateswarulu	Gandrotu	GandrotuV	Venkateswarulu.Gandrotu@thyssenkrupp.com	10639542	91133	MHE Utilities Design	MHE Utilities - 7303	+91 20 6612 4844	Pune	maharashtra	411018	IN
2624	3224	5124	202124	102124	Aravinth	Murugan	MuruganA	Aravinth.Murugan@thyssenkrupp.com	10639688	91135	B&PP Commissioning	B&PP Commissioning	\N	\N	\N	\N	\N
2625	3225	5125	202125	102125	Mahadev	Sutar	SutarM	Mahadev.Sutar@thyssenkrupp.com	10639295	40828	Cement Design & Engineering (Dept Code: 6005)	Cement Design & Engineering (Dept Code: 6005)	\N	Pune	Maharashtra	411018	IN
2626	3226	5126	202126	102126	Kalaikovan	Karuppannan	KaruppannanK	Kalaikovan.Karuppannan@thyssenkrupp.com	10639690	91134	Boiler & PP	Boiler & PP	044-2431-4232	\N	\N	\N	\N
2627	3227	5127	202127	102127	Sourabh	Mishra	Mishra_S	Sourabh.Mishra@thyssenkrupp.com	10639689	91136	SMB Dept.Code 5702	DESIGN & ENGINEERING	\N	Pune	Maharashtra	411018	IN
2628	3228	5128	202128	102128	Sachin	Mane	ManeSN	Sachin.Mane@thyssenkrupp.com	10639294	40827	Boiler & PP Dept Code.2005	PM_B&PP_9204	020 6612 4648	Pune	Maharashtra	411018	IN
2629	3229	5129	202129	102129	Gaurav	Deshpande	Deshpande_G	Gaurav.Deshpande@thyssenkrupp.com	10640165	91137	E&I  ( Dept. Code 7402 )	E&I (Dept Code: 7402)	\N	Pune	Maharashtra	411018	IN
2630	3230	5130	202130	102130	Nilesh	Unde	UndeN	Nilesh.Unde.External@thyssenkrupp.com	10640060	PFS351	FINANCE  BILLING (Dept Code: 7603)	FINANCE  BILLING (Dept Code: 7603)	\N	Pune	Maharashtra	\N	IN
2631	3231	5131	202131	102131	Sayali	Kshirsagar	KshirsagarS	Sayali.Kshirsagar@thyssenkrupp.com	10447322	91138	Imp.Exp & Logistics (7652)	Imp.Exp & Logistics (7652)	91 20 6612 4733	\N	\N	\N	\N
2632	3232	5132	202132	102132	Divyaa	Nair	NairD	Divyaa.Nair@thyssenkrupp.com	10488243	11763	Civil Maintenance 7007	Civil Maintenance 7007	\N	\N	Maharashtra	411018	IN
2633	3233	5133	202133	102133	Raviranjan	Kumar	KumarRR	\N	10641159	91144	O365 Login ID	PM_Planning_9704	\N	Pune	Maharashtra	400018	IN
2634	3234	5134	202134	102134	Mameet	Shrivastava	ShrivastavaRM	\N	10641604	Tech Center	Tech Center (O365 ID)	Tech Center	\N	\N	\N	\N	\N
2635	3235	5135	202135	102135	Ganta	Srikanth	SrikanthG	\N	10641015	98083	Hyderabad Office	Hyderabad Office	\N	Pune	Maharashtra	411018	IN
2636	3236	5136	202136	102136	Flywin	I	FlywinI	\N	10641734	91146	Project Management (Dept. code : 9304)	Project Management (Dept. code : 9304)	\N	Pune	Maharashtra	400018	IN
2637	3237	5137	202137	102137	Sandeep	Majumdar	MajumdarS	\N	10641156	91143	BORL site	BORL site	\N	Pune	Maharashtra	411018	IN
2638	3238	5138	202138	102138	Amit	Kumar	Kumar.A	\N	10641279	91145	MHE Selling & 3002	MHE Selling & 3002	\N	Pune	Maharashtra	411018	IN
2639	3239	5139	202139	102139	Umakanta	Patro	PatroU	\N	10642901	91147	Project Management / 9704	\N	\N	\N	\N	\N	\N
2640	3240	5140	202140	102140	Sanket	Patil	PatilSP	\N	10641157	91141	PM B&PP  (2003 )	PM B&PP  (2003 )	\N	Pune	Maharashtra	411018	IN
2641	3241	5141	202141	102141	Primus	Tech	PrimusTech	\N	\N	for SAP Access	Function ID	for SAP Access to Vendor	\N	\N	\N	\N	\N
2642	3242	5142	202142	102142	Abhishek	Sharma	SharmaAM	\N	10644219	91150	Sugar Proposal Engg (Dept.Code 4001)	Sugar Management(4001)	+91 20 66124448	Pune	Maharashtra	411018	IN
2643	3243	5143	202143	102143	Srinivasa	Ravella	RavellaS	\N	10641160	98084	Hyderabad Office PPP (Dept.Code 5500)	Hyderabad Office PPP (Dept.Code 5500)	\N	Pune	Maharashtra	411018	IN
2644	3244	5144	202144	102144	Somil	Shrivastava	ShrivastavaS	\N	10644228	91149	Project_Management_Dept	Project_Management_Dept	\N	Pune	Maharashtra	411018	IN
2645	3245	5145	202145	102145	Dhananjay	Ghargade	GhargadeD	\N	10641157	91142	Asset Management	Service 7807	\N	Pune	Maharashtra	411018	IN
2646	3246	5146	202146	102146	Baburao	Madduri	MadduriB	\N	10488594	25014	Hyderabad works	Machine shop/5506	\N	Pune	Maharashtra	411018	IN
2647	3247	5147	202147	102147	Amit	Shinde	ShindeAR	\N	10643570	11769	5402 (Quality - Testing & Receiving)	5400 (Quality Assurance)	\N	Pune	Maharashtra	411018	IN
2648	3248	5148	202148	102148	Vankar	Laljibhai	LaljibhaiV	\N	10643322	60371	Construction dept. ? 7805	Construction dept. ? 7805	\N	Pune	Maharastra	411018	IN
2649	3249	5149	202149	102149	Abhishek	Singh	SinghAR	\N	10619627	11704	Construction dept. ? 7805	Construction dept. ? 7805	\N	Pune	Maharashtra	411018	IN
2650	3250	5150	202150	102150	Ajay	Borage	BorageA	\N	10641549	11765	Construction dept ? 7202	Construction dept ? 7202	\N	Pune	Maharashtra	411018	IN
2651	3251	5151	202151	102151	Akash	Hajnale	HajnaleA	\N	10644307	\N	11771	HFS Dept	\N	Pune	Maharashtra	411018	IN
2652	3252	5152	202152	102152	Bhupendra	Singh	SinghBK	\N	10642236	60366	Construction dept. ? 7805	Construction dept ? 7805	\N	Pune	Maharashtra	411 018	IN
2653	3253	5153	202153	102153	Nilesh	Jadhav	JadhavN	\N	10644218	91151	Boiler & PP	Boiler & PP	\N	\N	\N	\N	\N
2654	3254	5154	202154	102154	Aishwarya	Dantam	DantamA	\N	10644805	91154	E&I Department - 7404	E&I Department - 7404	\N	Pune	Maharashtra	411018	IN
2655	3255	5155	202155	102155	Mahindra	Godbole	GodboleM	\N	10644693	91153	PM_Planning_9704	PM_Planning_9704	\N	Pune	Maharashtra	411018	\N
2656	3256	5156	202156	102156	Pushkaraj	Dindore	DindoreP	\N	10645371	91156	MHE	Design & Engineering To Group Co.(Dept Code: 6006)	\N	Pune	Maharashtra	411018	IN
2657	3257	5157	202157	102157	Sheetal	Patel	PatelS	\N	10646199	91158	\N	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	\N	Pune	Maharashtra	411018	IN
2658	3258	5158	202158	102158	Sachin	Dongre	DongreS	\N	10646192	91157	\N	Design & Engineering To Group Co.(Dept Code: 6006)	\N	\N	\N	\N	\N
2659	3259	5159	202159	102159	Rahul	Bhirud	BhirudR	\N	10640060	1817156	FINANCE  BILLING (Dept Code: 7603)	FINANCE  BILLING (Dept Code: 7603)	+91 20 6612 4669	Pune	Maharashtra	\N	IN
2660	3260	5160	202160	102160	Arunkumar	Manivannan	ManivannanA	\N	10490533	98086	Hyderabad Office	Hyderabad Office	\N	Pune	Maharashtra	411018	IN
2661	3261	5161	202161	102161	Vanitha	Dweraipudi	DweraipudiV	\N	10394518	98085	Hyderabad Office	Hyderabad Office	\N	Pune	Maharashtra	411018	IN
2662	3262	5162	202162	102162	Nikhil	Virkud	VirkudN	\N	10446434	\N	\N	CON. MACHINE SHOP	\N	Pune	Maharashtra	411018	IN
2663	3263	5163	202163	102163	Abhishek	Prabhavalkar	PrabhavalkarA	\N	10445621	91148	WORKSHOP	PPC	\N	Pune	\N	411018	IN
2664	3264	5164	202164	102164	Aditya	Prakash	PrakashA	\N	10647199	91159	\N	Services - Cement Division	\N	Pune	Maharastra	411018	IN
2665	3265	5165	202165	102165	Rohit	Mhaiskar	MhaiskarR	\N	10647197	91160	\N	Services - Cement Division	\N	Pune	Maharastra	411018	IN
2666	3266	5166	202166	102166	Divyanshu	Garg	GargD	\N	10647197	91161	\N	Services - Cement Division	\N	Pune	Maharastra	411018	IN
2667	3267	5167	202167	102167	Harishankar	L	HarishankarL	\N	10647196	91162	\N	Services - Cement Division	\N	Pune	Maharastra	411018	IN
2668	3268	5168	202168	102168	Ajitesh	Sahoo	SahooA	\N	10647200	91163	\N	Services - Cement Division	\N	Pune	Maharastra	411018	IN
2669	3269	5169	202169	102169	Kushagra	Shah	ShahK	kushagra.shah@thyssenkrupp.com	10647195	91164	\N	Services - Cement Division	\N	Pune	Maharastra	411018	IN
2670	3270	5170	202170	102170	Raghavendra	Patil	Patil-R	\N	10644807	11772	\N	Department: R&D (Dept code-1100)	\N	Pune	Maharashtra	411018	IN
2671	3271	5171	202171	102171	Sandeep	Jambhale	JambhaleS	\N	10647461	Tech Centre	\N	\N	\N	Pune	Maharashtra	411018	IN
2672	3272	5172	202172	102172	Vishal	Yadav	YadavV	\N	10641725	40903	\N	CON. MACHINE SHOP	\N	Pune	Maharashtra	411018	IN
2673	3273	5173	202173	102173	Bhausaheb	Patil	Patil-B	\N	10488538	2017	\N	Mech. Maintenance Dept.	\N	Pune	Maharashtra	411018	IN
2674	3274	5174	202174	102174	tkii	VaultAdmin	tkiiVaultAdmin	\N	\N	\N	\N	Polysius India	\N	Pune	Maharashtra	411018	IN
2675	3275	5175	202175	102175	Amol	Kulkarni	Kulkarni-A	\N	10645170	91155	\N	QUALITY- SUB CONTRACT (Dept Code: 5404)	\N	Pune	Maharashtra	411018	IN
2676	3276	5176	202176	102176	Sandip	Pawar	PawarSM	\N	10645086	\N	\N	\N	\N	\N	\N	\N	\N
2677	3277	5177	202177	102177	Kishor	Mali	MaliKM	\N	10645087	\N	\N	\N	\N	\N	\N	\N	\N
2678	3278	5178	202178	102178	Abhishekh	Desai	DesaiA	\N	106646192	11768	MFS H09	MFS H09	\N	Pune	Maharashtra	411018	IN
2679	3279	5179	202179	102179	Vivek	Soni	Soni-V	\N	10647548	91165	\N	FGD Equipment Design (Dept. 7335)	\N	Pune	Maharashtra	411018	IN
2680	3280	5180	202180	102180	Rohit	Gautam	GautamR	\N	10638689	60358	\N	Services	\N	Pune	Maharashtra	411018	IN
2681	3281	5181	202181	102181	Santosh	Aglawe	AglaweS	\N	10640725	60361	\N	Services	\N	Pune	Maharashtra	411018	IN
2682	3282	5182	202182	102182	Amit	Sen	SenA	\N	10640724	60362	\N	Services	\N	Pune	Maharashtra	411018	IN
2683	3283	5183	202183	102183	Abhijeet	Kherde	KherdeA	\N	10641546	\N	\N	Services	\N	Pune	Maharashtra	411018	IN
2684	3284	5184	202184	102184	Vimal	Kumar	KumarV	\N	10641547	60364	\N	Services	\N	Pune	Maharashtra	411018	IN
2685	3285	5185	202185	102185	Amit	Dewangan	DewanganA	\N	10641938	60365	\N	Services	\N	Pune	Maharashtra	411018	IN
2686	3286	5186	202186	102186	Rajneesh	Sharma	SharmaR	\N	10642903	60368	\N	Services	\N	Pune	Maharashtra	411018	IN
2687	3287	5187	202187	102187	Kondapalli	Venkateswararao	VenkateswararaoK	\N	10642902	60369	\N	Services	\N	Pune	Maharashtra	411018	IN
2688	3288	5188	202188	102188	Gaurav	Sharma	SharmaG	\N	10642904	60370	\N	Services	\N	Pune	Maharashtra	411018	IN
2689	3289	5189	202189	102189	Neeraj	Jain	JainN	\N	10643710	60373	\N	Services	\N	Pune	Maharashtra	411018	IN
2690	3290	5190	202190	102190	Viren	Joshi	JoshiVM	\N	10643972	60375	\N	Services	\N	Pune	Maharashtra	411018	IN
2691	3291	5191	202191	102191	Avindragiri	Gauswami	GauswamiA	\N	10644227	60377	\N	Services	\N	Pune	Maharashtra	411018	IN
2692	3292	5192	202192	102192	Pramhansh	Singh	SinghP	\N	10644704	60379	\N	Services	\N	Pune	Maharashtra	411018	IN
2693	3293	5193	202193	102193	Pratik	Singh	Singh-P	\N	10645219	60382	\N	Services	\N	Pune	Maharashtra	411018	IN
2694	3294	5194	202194	102194	Ranjithkumar	K	RanjithkumarK	\N	10645171	60383	\N	Services	\N	Pune	Maharashtra	411018	IN
2695	3295	5195	202195	102195	Mayur	Ahirkar	AhirkarM	\N	10647520	60384	\N	Services	\N	Pune	Maharashtra	411018	IN
2696	3296	5196	202196	102196	Tushar	Vaidya	VaidyaT	\N	10648376	Tech Centre	\N	\N	\N	Pune	Maharashtra	411018	IN
2697	3297	5197	202197	102197	Prasad	Kumthekar	KumthekarP	\N	10645433	1833811	\N	Services	\N	Pune	Maharashtra	411018	IN
2698	3298	5198	202198	102198	Rajendra	Salve	SalveR	\N	10648308	\N	\N	Mumbai Office	\N	\N	\N	\N	\N
2699	3299	5199	202199	102199	Onkar	Patil	PatilO	\N	10648309	1833813	\N	Services	\N	Pune	Maharashtra	411018	IN
2700	3300	5200	202200	102200	Prathamesh	Jirange	JirangeP	prathamesh.jirange.external@thyssenkrupp.com	10577383	1792419	\N	FGD Equipment Design (Dept. 7335)	\N	Pune	Maharashtra	411018	IN
2701	3301	5201	202201	102201	Dev	Kumar	Kumar-DR	\N	10647827	91166	\N	Project Management / 9604	\N	Pune	Maharashtra	411018	IN
2702	3302	5202	202202	102202	Kshitij	Wat	WatK	\N	10648423	Tech Centre	\N	Tech Center	\N	Pune	Maharashtra	411018	IN
2703	3303	5203	202203	102203	Avinash	Patil	Patil-AG	\N	10645079	1817160	\N	HFS Dept	\N	Pune	Maharashtra	411018	IN
2704	3304	5204	202204	102204	Nilesh	Sake	SakeN	\N	10645084	1793187	\N	MFS hall no.1	\N	Pune	Maharashtra	411018	IN
2705	3305	5205	202205	102205	Ravindra	Zombade	ZombadeR	\N	10641726	40904	\N	OSHE 5210	\N	Pune	Maharashtra	411018	IN
2706	3306	5206	202206	102206	Jaibheem	Shirole	ShiroleJ	\N	10648311	Ex-654	\N	OSHE 5210	\N	Pune	Maharashtra	411018	IN
2707	3307	5207	202207	102207	Dhanaraj	Boyane	BoyaneD	\N	10648310	BSA-119524	\N	OSHE 5210	\N	Pune	Maharashtra	411018	IN
2708	3308	5208	202208	102208	Omkar	Patil	PatilOV	\N	10641724	40902	\N	OSHE 5210	\N	Pune	Maharashtra	411018	IN
2709	3309	5209	202209	102209	Nana	Patil	PatilNS	\N	10649219	91169	E&I	E&I (dept code7402)	\N	Pune	Maharashtra	411018	IN
2710	3310	5210	202210	102210	Madhusudhan	C	MadhusudhanC	\N	10649218	91168	E&I	E&I (dept code7402)	\N	Pune	Maharashtra	411018	IN
2711	3311	5211	202211	102211	Prabakaran	M	PrabakaranM	\N	10648625	60386	Services	Services	\N	Pune	Maharashtra	411018	IN
2712	3312	5212	202212	102212	Amit	Khara	KharaA	\N	10648624	60387	Services	Services	\N	Pune	Maharashtra	411018	IN
2713	3313	5213	202213	102213	Eldho	Paul	PaulE	\N	10648946	60388	Service  7864	Services	\N	Pune	Maharashtra	411018	IN
2714	3314	5214	202214	102214	Akhil	George	GeorgeA	\N	10648945	60389	\N	Services	\N	Pune	Maharashtra	411018	IN
2715	3315	5215	202215	102215	ObulamPalli	Reddy	ReddyV	\N	10648958	91167	\N	Services	\N	Pune	Maharashtra	411018	IN
2716	3316	5216	202216	102216	Sudarshan	Bhalerao	BhaleraoSS	\N	10649488	1792487	\N	FGD Equipment Design (Dept. 7335)	\N	Pune	Maharashtra	411018	IN
2717	3317	5217	202217	102217	Aniket	More	MoreA	\N	10650351	91171	Manufacturing	Manufacturing	\N	Pune	Maharashtra	411018	IN
2718	3318	5218	202218	102218	Sujeet	Patil	Patil-S	\N	10649336	91170	Automation (dept code7405)	Automation (dept code7405)	\N	Pune	Maharashtra	411018	IN
2719	3319	5219	202219	102219	Hemant	Bhalerao	BhaleraoHR	\N	10650568	1859558	\N	SMB 5700	\N	Pimpri	Maharashtra	411018	IN
2720	3320	5220	202220	102220	Anand	Relekar	RelekarA	\N	10651898	91172	\N	E&I (dept code7402)	\N	Pune	Maharashtra	411018	IN
2721	3321	5221	202221	102221	Chandan	Mondal	MondalC	\N	10650563	60394	\N	Services	\N	Pune	Maharashtra	411018	IN
2722	3322	5222	202222	102222	Brajakishore	Jena	JenaB	\N	10650562	60393	\N	Services - Cement Division	\N	Pune	Maharastra	411018	IN
2723	3323	5223	202223	102223	Raushan	Prasad	PrasadR	\N	10650357	60392	\N	Services - Cement Division	\N	Pune	Maharastra	411018	IN
2724	3324	5224	202224	102224	Promod	Mondal	MondalP	\N	10650356	60391	\N	Services - Cement Division	\N	Pune	Maharastra	411018	IN
2726	3326	5226	202226	102226	Ajay	Pisal	PisalA	\N	10648416	1792451	\N	PPC Dept	\N	Pune	Maharashtra	411018	IN
2727	3327	5227	202227	102227	Sarathkumar	VulluriKondala	VulluriKondalaS	\N	10649487	1835652	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2728	3328	5228	202228	102228	Swarup	Senapati	SenapatiSH	\N	10500204	60385	\N	Services	\N	Pune	Maharashtra	411018	IN
2729	3329	5229	202229	102229	Goutam	Biswal	BiswalG	\N	10636054	60351	\N	Services	\N	Pune	Maharashtra	411018	IN
2730	3330	5230	202230	102230	Amit	Patel	Patel-A	\N	10634046	\N	\N	PM_Cement_9604_E&C	\N	Pune	Maharashtra	411018	IN
2731	3331	5231	202231	102231	Akash	Patel	Patel_A	\N	10650783	60395	Services	Services	\N	Pune	Maharashtra	411018	IN
2732	3332	5232	202232	102232	Shyam	S	ShyamS	\N	10651910	60396	Services	Services	\N	Pune	Maharashtra	411018	IN
2733	3333	5233	202233	102233	Khan	Sameer	SameerK	\N	10649486	1776984	Construction	Services	\N	Pune	Maharashtra	411018	IN
2734	3334	5234	202234	102234	Sreedhar	Kondala	KondalaS	\N	10649485	1776802	Construction	PM_Cement_9604_E&C	\N	Pune	Maharashtra	411018	IN
2735	3335	5235	202235	102235	Abhijeet	Phalke	Phalke-A	\N	10652467	1792457	\N	QUALITY- SUB CONTRACT (Dept Code: 5404)	\N	Pune	Maharashtra	411018	IN
2736	3336	5236	202236	102236	Suhas	Patil	PatilSS	\N	10652465	1817158	\N	PPC Dept	\N	Pune	Maharashtra	411018	IN
2737	3337	5237	202237	102237	Raju	Vhankeri	VhankeriR	\N	10652466	1792517	Steel Fabrication,Code-7742	Subcontract Department	\N	Pune	Maharashtra	411018	IN
2738	3338	5238	202238	102238	Prashant	Patil	PatilPR	\N	10652464	1792442	Manufacturing	HFS Dept	\N	Pune	Maharashtra	411018	IN
2739	3339	5239	202239	102239	Awadesh	Tiwari	TiwariA	\N	10653080	Tech Centre	Tech Centre	Tech Center	\N	Pune	Maharashtra	411018	IN
2740	3340	5240	202240	102240	Ankit	Srivastava	SrivastavaA	\N	10652195	60397	\N	Services	\N	Pune	Maharashtra	411018	IN
2741	3341	5241	202241	102241	Rajesh	Singh	Singh-R	\N	10652364	60399	\N	Services	\N	Pune	Maharashtra	411018	IN
2742	3342	5242	202242	102242	Aptabuddin	Mondal	MondalA	\N	10500222	60400	\N	Services	\N	Pune	Maharashtra	411018	IN
2743	3343	5243	202243	102243	Devmani	Singh	Singh-D	\N	10652473	60401	\N	Services	\N	Pune	Maharashtra	411018	IN
2744	3344	5244	202244	102244	Jogeswar	Sahu	SahuJ	\N	10500250	60398	\N	Services	\N	Pune	Maharashtra	411018	IN
2745	3345	5245	202245	102245	Pulkit	Goyal	GoyalP	\N	10407578	10407578	Sheikh Zayed Road, The H Dubai Office	tkIS AG LLO Middle East & Turkey	\N	Pimpri	Maharashtra	411018	IN
2746	3346	5246	202246	102246	Ranjitha	Poojary	PoojaryR	\N	10645080	1833814	Finance (7604)	Finance (7604)	020 6612 4244	Pimpri	Maharashtra	411018	IN
2747	3347	5247	202247	102247	Sekhar	Vijaya	VijayaS	\N	10653477	1854079	Hyderabad Office	Hyderabad Office	\N	Pune	Maharashtra	411018	IN
2748	3348	5248	202248	102248	Aswini	Das	Das-A	\N	10653409	60402	aswini.das@thyssenkrupp.com	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2749	3349	5249	202249	102249	Arun	Ruidas	RuidasA	\N	10653675	60403	arun.ruidas@thyssenkrupp.com	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2750	3350	5250	202250	102250	Bhushan	Shelke	ShelkeB	\N	10647548	1792526	bhushan.shelke.external@thyssenkrupp.com	FGD Equipment Design (Dept. 7335)	020 6612 4630	Pune	Maharashtra	411018	IN
2751	3351	5251	202251	102251	Amol	Zope	ZopeA	\N	10577383	1871918	amol.zope.external@thyssenkrupp.com	FGD Equipment Design (Dept. 7335)	\N	Pune	Maharashtra	411018	IN
2752	3352	5252	202252	102252	Bhalchandra	Pawar	PawarB	\N	10653895	60404	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2753	3353	5253	202253	102253	Sathish Kumar	R	SathishKumarR	\N	10653896	91173	sathish.r@thyssenkrupp.com	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2754	3354	5254	202254	102254	Manohar	Gurudu	GuruduM	\N	10653857	1851719	manohar.gurudu.external@thyssenkrupp.com	Hyderabad Office	\N	Pune	Maharashtra	411018	IN
2755	3355	5255	202255	102255	Harshavardhana	B	HarshavardhanaB	\N	10653873	1868515	harshavardhana.b.external@thyssenkrupp.com	Hyderabad Office Fabrication (Dept Code 5524)	\N	Pune	Maharashtra	411018	IN
2756	3356	5256	202256	102256	Rajasekhar	Vissapragada	VissapragadaR	\N	10653863	1835649	rajasekhar.vissapragada.external@thyssenkrupp.com	Hyderabad Office	\N	Pune	Maharashtra	411018	IN
2757	3357	5257	202257	102257	Venkata	Naragani	NaraganiV	\N	10482352	1835645	venkata.naragani.external@thyssenkrupp.com	Hyderabad Office	\N	Pune	Maharashtra	411018	IN
2758	3358	5258	202258	102258	Kulothungan	Samidurai	SsamiduraiK	\N	10653877	1835647	kulothungan.samidurai.external@thyssenkrupp.com	Hyderabad Office	\N	\N	\N	\N	\N
2759	3359	5259	202259	102259	Ranjeetkumar	Singh	SinghKR	\N	10653871	\N	ranjeetkumar.singh.external@thyssenkrupp.com	Hyderabad Office	\N	Pune	Maharashtra	411018	IN
2760	3360	5260	202260	102260	Primus	Tech2	primustech2	\N	\N	for SAP Access	Function ID	for SAP Access to Vendor	\N	\N	\N	\N	\N
2761	3361	5261	202261	102261	Vishakha	Bhalerao	BhaleraoV	\N	10653872	1800123	vishakha.bhalerao.external@thyssenkrupp.com	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2762	3362	5262	202262	102262	Anita	Waghwal	WaghwalA	\N	10626585	1890763	\N	AFTER SALES SERVICES	\N	\N	Maharashtra	\N	\N
2763	3363	5263	202263	102263	Kamalakannan	Mayavan	MayavanK	\N	10490687	1835658	\N	Hyderabad Office	\N	\N	\N	\N	\N
2764	3364	5264	202264	102264	Abhijeet	Pawar	Pawar-A	abhijeet.pawar.external@thyssenkrupp.com	10655100	1863586	Store	\N	\N	\N	\N	\N	\N
2765	3365	5265	202265	102265	Ankush	Badgujar	BadgujarAR	ankush.badgujar.external@thyssenkrupp.com	10655101	1792506	Quality-  Production - 5403	\N	\N	\N	\N	\N	\N
2766	3366	5266	202266	102266	Babasaheb	Sarode	SarodeB	babasaheb.sarode@thyssenkrupp.com	10488624	2016	WORKSHOP(5006)	\N	\N	\N	\N	\N	\N
2767	3367	5267	202267	102267	Neeraj	Bhuyan	BhuyanN	neeraj.bhuyan@thyssenkrupp.com	10655898	91175	Strategic Procurement(7722)	\N	\N	\N	\N	\N	\N
2768	3368	5268	202268	102268	Atul	Pawar	Pawar-AR	atul.pawar@thyssenkrupp.com	10655910	11773	CNC H2 & TOOL ROOM(5020)	\N	\N	\N	\N	\N	\N
2769	3369	5269	202269	102269	Aditya	Manjul	ManjulA	\N	10656179	\N	Tech Centre	\N	\N	\N	\N	\N	\N
2770	3370	5270	202270	102270	Dileep	Kumar	KumarD	dileep.kumar@thyssenkrupp.com	10655929	60407	Service  7864	\N	\N	\N	\N	\N	\N
2771	3371	5271	202271	102271	Rupak	Mohanty	MohantyR	rupak.mohanty@thyssenkrupp.com	10655521	60405	Services (Dept. Code 7864)	\N	\N	\N	\N	\N	\N
2772	3372	5272	202272	102272	Shillpa	Chabria	ChabriaS	shillpa.chabria@thyssenkrupp.com	10656591	91176	Personnel & HRD (5202)	\N	\N	\N	\N	\N	\N
2773	3373	5273	202273	102273	Rahul	Narnavare	NarnavreR	rahul.narnavare.external@thyssenkrupp.com	10656233	1905432	Finance - 7603	\N	\N	\N	\N	\N	\N
2774	3374	5274	202274	102274	Pankaj	Patil	PatilP	pankaj.patil.external@thyssenkrupp.com	10656231	1800537	Subcontract? - 7732	\N	\N	\N	\N	\N	\N
2775	3375	5275	202275	102275	Suhel	Bagwan	BagwanS	suhel.bagwan.external@thyssenkrupp.com	10656235	1187932	M/C Shop Hall No.1	\N	\N	\N	\N	\N	\N
2776	3376	5276	202276	102276	Basant	Narayan	NarayanB	basant.narayan@thyssenkrupp.com	10655522	60406	Services (Dept. Code 7864)	\N	\N	\N	\N	\N	\N
2777	3377	5277	202277	102277	Ganesh	Patil	PatilGA	ganesh.patil.external@thyssenkrupp.com	10656692	1923029	PPP (Dept. Code: 5002)	\N	\N	\N	\N	\N	\N
2778	3378	5278	202278	102278	MD Irfan	Ahmed	irfan.ahmed	md.ahmed@thyssenkrupp.com	10656747	91179	Project Management (Dept. code : 9304)	\N	\N	\N	\N	\N	\N
2779	3379	5279	202279	102279	Abhijeet	Pawar	PawarAU	abhijeet.pawar.external2@thyssenkrupp.com	10655646	1863585	Stores & Despatch (Dept. Code: 7753)	\N	\N	\N	\N	\N	\N
2780	3380	5280	202280	102280	Ajay	Pisal	PisalAA	ajay.pisal.external2@thyssenkrupp.com	10656232	1897935	SPS Hall no.09  (Dept. Code; 5005)	\N	\N	\N	\N	\N	\N
2781	3381	5281	202281	102281	Abi	Johns	JohnsA	abi.johns@thyssenkrupp.com	10656740	91183	DESIGN & ENGINEERING  MHE-SYSTEMS (Dept Code: 7303)	\N	\N	\N	\N	\N	\N
2782	3382	5282	202282	102282	Pratyush	Behera	BeheraP	pratyush.behera@thyssenkrupp.com	10656743	91177	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	\N	\N	\N	\N	\N	\N
2783	3383	5283	202283	102283	CH Prabhanjan	Patro	PatroP	ch.patro@thyssenkrupp.com	10656741	91182	Wagon Tipplers Design (Dept Code: 7334)	\N	\N	\N	\N	\N	\N
2784	3384	5284	202284	102284	Srinibas	Mohapatra	MohapatraS	srinibas.mohapatra@thyssenkrupp.com	10656744	91180	DESIGN & ENGINEERING  STRUCTURAL (Dept Code: 7305)	\N	\N	\N	\N	\N	\N
2785	3385	5285	202285	102285	Lokesh	Harioudh	HarioudhA	\N	10656738	91185	DESIGN & ENGINEERING  STRUCTURAL (Dept Code: 7305)	\N	\N	\N	\N	\N	\N
2786	3386	5286	202286	102286	Manoj	Kumar	Kumar-M	manoj.kumar@thyssenkrupp.com	10656974	60408	Service (Dept. Code. 7864)	\N	\N	\N	\N	\N	\N
2787	3387	5287	202287	102287	Ranjeet	Ingale	IngaleR	ranjeet.ingale@thyssenkrupp.com	10656976	91186	SUGAR  ENGINEERING (Dept Code: 4003)	\N	020 6612 4229	\N	\N	\N	\N
2788	3388	5288	202288	102288	Abhijeet	Kumar	Kumar-A	abhijeet.kumar@thyssenkrupp.com	10656742	91181	DESIGN & ENGINEERING  STRUCTURAL (Dept Code: 7305)	\N	\N	\N	\N	\N	\N
2789	3389	5289	202289	102289	Debojyoti	Chatterjee	Chatterjee-D	debyojit.chatterjee.external@thyssenkrupp.com	10656234	1897933	Kolkata Office	\N	\N	\N	\N	\N	\N
2790	3390	5290	202290	102290	Pravin	Dharammali	DharammaliP	pravin.dharammali.external@thyssenkrupp.com	10656693	1918172	QUALITY- TESTING & RECEIVING (Dept. Code: 5402)	\N	\N	\N	\N	\N	\N
2791	3391	5291	202291	102291	Aniket	Vairagi	VairagiA	\N	10648314	1792436	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	\N	\N	\N	\N	\N	\N
2792	3392	5292	202292	102292	Dev	Basant	BasantD	\N	10656748	91178	Kolkata Office	\N	\N	\N	\N	\N	\N
2793	3393	5293	202293	102293	Siddharth	Deshmukh	DeshmukhSR	siddharth.deshmukh@thyssenkrupp.com	10657281	11774	Service (Dept. Code: 7850)	\N	\N	\N	\N	\N	\N
2794	3394	5294	202294	102294	Abburi	Anirudh	AnirudhA	anirudh.l@thyssenkrupp.com	10656737	91184	Construction (Dept. Code: 7202)	\N	\N	\N	\N	\N	\N
2795	3395	5295	202295	102295	Renuka	Deshmukh	DeshmukhRN	renuka.deshmukh@thyssenkrupp.com	10645435	1792481	Admin (Dept. Code:7000)	\N	\N	\N	\N	\N	\N
2796	3396	5296	202296	102296	Swapnil	Mayekar	MayekarS	swapnil.mayekar@thyssenkrupp.com	10657574	60411	Service (Dept. Code:7864)	\N	\N	\N	\N	\N	\N
2797	3397	5297	202297	102297	Shyamji	Tiwari	TiwariS	shyam.tiwari@thyssenkrupp.com	10657731	91187	Sugar Division (Dept. Code:4003)	\N	\N	\N	\N	\N	\N
2798	3398	5298	202298	102298	Amit	Gargate	GargateA	amit.gargate.external@thyssenkrupp.com	10657655	1923031	Finance (Dept. Code:7603)	\N	\N	\N	\N	\N	\N
2799	3399	5299	202299	102299	Hardik	Pandya	PandyaH	hardik.pandya@thyssenkrupp.com	10657729	60412	Service (Dept. Code:7864)	\N	\N	\N	\N	\N	\N
2800	3400	5300	202300	102300	Santosh	Jena	JenaS	santosh.jena@thyssenkrupp.com	10657971	60414	Service (Dept. Code:7864)	\N	\N	\N	\N	\N	\N
2801	3401	5301	202301	102301	Dhirendra	Kumar	Kumar-D	dhirendra.kumar@thyssenkrupp.com	10657867	60413	Service (Service Dept.7864)	\N	\N	\N	\N	\N	\N
2802	3402	5302	202302	102302	Saravanan	Eliyavel	EliyavelS	saravanan.e@thyssenkrupp.com	10657489	60410	Construction Services (Dept. Code 7804)	\N	\N	\N	\N	\N	\N
2803	3403	5303	202303	102303	Ganesh	Ganapathi	GanapathiG	ganesh.g@thyssenkrupp.com	10657972	60415	Service (Dept. Code:7864)	\N	\N	\N	\N	\N	\N
2804	3404	5304	202304	102304	Shubham	Singh	SinghS	shubham.singh@thyssenkrupp.com	10658216	901189	DESIGN & ENGINEERING  MHE-MACHINES (Dept Code: 7302)	\N	\N	\N	\N	\N	\N
2805	3405	5305	202305	102305	Arnab	Banerjee	BanerjeeA	arnab.banerjee2@thyssenkrupp.com	10658215	91188	DESIGN & ENGINEERING  Paddle Feeder (Dept Code: 7336)	\N	\N	\N	\N	\N	\N
2806	3406	5306	202306	102306	Sandip	Pawar	Pawar-S	sandip.pawar.external2@thyssenkrupp.com	10658699	1929668	Finance (Dept. Code. 7608)	\N	\N	\N	\N	\N	\N
2807	3407	5307	202307	102307	Shivraj	Patil	Patil-SR	\N	10657845	\N	\N	\N	\N	\N	\N	\N	\N
2808	3408	5308	202308	102308	Lankayagari	Babu	BabuL	suresh.lankayagari@thyssenkrupp.com	10657228	60409	SAFETY	\N	\N	\N	\N	\N	\N
2809	3409	5309	202309	102309	Suraj	Suradkar	SuradkarS	\N	10573348	Orbit	T&IS - Orbit	\N	\N	Pune	Maharashtra	411018	IN
\.


--
-- Data for Name: asdi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asdi (asdi_id, disposed_poc, disposed_vendor, disposed_phone) FROM stdin;
\.


--
-- Data for Name: astc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.astc (astc_id, category) FROM stdin;
\.


--
-- Data for Name: astd; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.astd (astd_id, asset_name, asset_displayname, purchase_date, assigned_date, expiry_date, created, description) FROM stdin;
\.


--
-- Data for Name: astdes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.astdes (astdes_id, serialno, mcount, rslot) FROM stdin;
\.


--
-- Data for Name: astdesgpu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.astdesgpu (astdesgpu_id, gpucard, gpusize, gpuuom) FROM stdin;
\.


--
-- Data for Name: astdeshdd; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.astdeshdd (astdeshdd_id, hddtype, hddsize, hdduom) FROM stdin;
\.


--
-- Data for Name: astdesmod; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.astdesmod (astdesmod_id, make, model) FROM stdin;
\.


--
-- Data for Name: astdesopt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.astdesopt (astdesopt_id, optdrive) FROM stdin;
\.


--
-- Data for Name: astdesos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.astdesos (astdesos_id, os, "bit", sp) FROM stdin;
\.


--
-- Data for Name: astdespro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.astdespro (astdespro_id, processor, speed) FROM stdin;
\.


--
-- Data for Name: astdesr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.astdesr (astdesr_id, astr_id, astdes_id, astdesgpu_id, astdeshdd_id, astdesmod_id, astdesopt_id, astdesos_id, astdespro_id, astdesram_id, createdtime, description) FROM stdin;
\.


--
-- Data for Name: astdesram; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.astdesram (astdesram_id, rtype, rsize, ruom) FROM stdin;
\.


--
-- Data for Name: astf; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.astf (astf_id, po_number, warranty, amc_auth, amc_expiry) FROM stdin;
\.


--
-- Data for Name: astg; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.astg (astg_id, astg_group) FROM stdin;
\.


--
-- Data for Name: asto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asto (asto_id, user_id, astd_id) FROM stdin;
\.


--
-- Data for Name: astr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.astr (astr_id, astd_id, astt_id, astc_id, astg_id, asts_id, astv_id, astf_id, asdi_id, createdtime, description) FROM stdin;
\.


--
-- Data for Name: asts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asts (asts_id, status) FROM stdin;
\.


--
-- Data for Name: astt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.astt (astt_id, type) FROM stdin;
\.


--
-- Data for Name: astv; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.astv (astv_id, vendor_name, vendor_location) FROM stdin;
\.


--
-- Data for Name: empdata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.empdata (employeecode, employee8id, relatedcostcenter, deptname, surname, f_name, m_name, new_designation) FROM stdin;
﻿90977	10425249	10101002	M.D. & CEO' S OFFICE	BHATIA	VIVEK	\N	M.D. & CEO
90350	10446817	10101002	M.D. & CEO' S OFFICE	LIMBOOWALLA	MRS.NAZNEEN	F.	SENIOR MANAGER
90852	10504499	10101006	Account Management & Communication	AGASTI	SURESH	 CHANDRA	SENIOR GENERAL MANAGER
90532	10447205	10101006	Account Management & Communication	KARKAMKAR	SUMIT	P.	SENIOR MANAGER
91161	10647198	10101006	Account Management & Communication	GARG	DIVYANSHU	\N	MANAGER
91162	10647196	10101006	Account Management & Communication	HARISHAKAR	L.	\N	MANAGER
9971	10446911	10101006	Account Management & Communication	IRANI	AMIN	A.	MANAGER
9297	10383686	10101100	REASERCH & DEVELOPMENT	PRASAD	TEJOMURTULA	TSUBARAO	VICE PRESIDENT
90537	10426445	10101100	REASERCH & DEVELOPMENT	MONDAL	ABDUS	S.	VICE PRESIDENT
90071	10363512	10101100	REASERCH & DEVELOPMENT	GAWHANE	NITIN	S.	SENIOR GENERAL MANAGER
9241	10383726	10101100	REASERCH & DEVELOPMENT	DEOSKAR	ANIL	WAMAN	SENIOR GENERAL MANAGER
9369	10446791	10101100	REASERCH & DEVELOPMENT	DESHMUKH	AMOL	S.	SENIOR MANAGER
9519	10446801	10101100	REASERCH & DEVELOPMENT	KOLI	AMIT	B.	SENIOR MANAGER
90838	10488545	10101100	REASERCH & DEVELOPMENT	PATIL	PRAVIN	N.	MANAGER
90769	10488671	10101100	REASERCH & DEVELOPMENT	TELE	 PRASAD	R.	SR. EXECUTIVE
90817	10488242	10101100	REASERCH & DEVELOPMENT	BHASME	ALOK	A.	EXECUTIVE
90788	10488307	10101100	REASERCH & DEVELOPMENT	DURGAWALE	 TUSHAR	S.	SR. EXECUTIVE
91013	10561985	10101100	REASERCH & DEVELOPMENT	KUMAR	LOKESH	ASHOK	ENGINEER
11721	10626768	10101100	REASERCH & DEVELOPMENT	MOZE	MS.SAMRUDDHI	EKNATH	T/E
90900	10528493	10102001	Energy - Management	PATIL	ABHAY	RAMRAO	DIRECTOR
91097	10633222	10102002	Energy -Selling	NORI	MEHER PRAKASH	\N	VICE PRESIDENT
15534	10383713	10102002	Energy -Selling	RAY	PRANTIK	K.	BUSINESS ADVISOR
90659	10446747	10102002	Energy -Selling	SINGH	RAHUL	--	GENERAL MANAGER
90618	10442312	10102002	Energy -Selling	SINGH	GAUTAM	 Y.	SENIOR MANAGER
90009	10446915	10102002	Energy -Selling	BHOOMKAR	AMIT	U.	MANAGER
90177	10446926	10102002	Energy -Selling	DAWANGE	TUSHAR	A.	SENIOR MANAGER
90606	10442311	10102002	Energy -Selling	UTPAT	NILESH	 J.	SENIOR MANAGER
90636	10446828	10102002	Energy -Selling	NARKHEDE	AMIT	R.	SENIOR MANAGER
90640	10446829	10102002	Energy -Selling	NAYAR	VINAY	B.	SENIOR MANAGER
91083	10631734	10102002	Energy -Selling	KOTHAWADE	SACHIN	ARUN	SENIOR MANAGER
90980	10601425	10102002	Energy -Selling	ROY	AMIT	\N	MANAGER
90228	10447179	10102002	Energy -Selling	NASERY	SUDARSHAN	S.	MANAGER
91134	10639690	10102002	Energy -Selling	KARUPPANNAN	KALAIKOVAN	\N	SR. EXECUTIVE
90850	10503024	10102003	Energy - Proposal Engineering	ASANGI	SANTOSH	SHANTESH	VICE PRESIDENT
90994	10612729	10102003	Energy - Proposal Engineering	DAVID	JACOB	MOSES	SENIOR MANAGER
90341	10383839	10102003	Energy - Proposal Engineering	CHAKRAVORTY	RITESH	\N	SENIOR MANAGER
90420	10446935	10102003	Energy - Proposal Engineering	MUTCHINTALA	SRINIVASA	RAO	SENIOR MANAGER
90633	10446776	10102003	Energy - Proposal Engineering	SAGAYARAJ	K.	WILSON	SENIOR MANAGER
90163	10447173	10102003	Energy - Proposal Engineering	BALRAM	BIJOY	-	SENIOR MANAGER
90117	10447163	10102003	Energy - Proposal Engineering	WADGHULE	SANTOSH	B.	MANAGER
91073	10629518	10102003	Energy - Proposal Engineering	ANAVATTER	SHIVALINGAPPA	\N	MANAGER
90765	10482286	10102003	Energy - Proposal Engineering	TEKADE	MS.CATHERINE	--	MANAGER
5810	10445711	10102003	Energy - Proposal Engineering	KUMBHAR	BALASAHEB	BABURAO	SR. EXECUTIVE
91088	10598384	10102003	Energy - Proposal Engineering	BHASME	ABHIJIT	SANDEEP	ENGINEER
91141	10641599	10102003	Energy - Proposal Engineering	PATIL	SANKET	PRALHAD	ENGINEER
11710	10624247	10102003	Energy - Proposal Engineering	MANTHENA	VIVEK VARMA	\N	T/E
11725	10628016	10102003	Energy - Proposal Engineering	SONAWANE	SWAPNIL	VISHNU	T/E
91079	10631273	10102005	Energy - Contract Detail Engineering	JADHAV	AMIT	ASHOK	GENERAL MANAGER
9339	10446759	10102005	Energy - Contract Detail Engineering	YANNEWAR	TUSHAR	SURENDRA	SENIOR MANAGER
9422	10446794	10102005	Energy - Contract Detail Engineering	THITE	SACHIN	VILAS	SENIOR MANAGER
90921	10561986	10102005	Energy - Contract Detail Engineering	BHISE	SHOUNAK	RAMESH	SENIOR MANAGER
9132	10383857	10102005	Energy - Contract Detail Engineering	PATHAN	RAJEKHAN	RAHIMKHAN	SENIOR MANAGER
9825	10446897	10102005	Energy - Contract Detail Engineering	GHONGADE	MAHESH	S.	MANAGER
90569	10445553	10102005	Energy - Contract Detail Engineering	SAGARE	VITTAL	PANDIT	MANAGER
90485	10445571	10102005	Energy - Contract Detail Engineering	JUTHIGA	S.B	S.	MANAGER
90728	10488343	10102005	Energy - Contract Detail Engineering	GIRMAL	VIDYASAGAR	M.	MANAGER
9318	10445583	10102005	Energy - Contract Detail Engineering	KHEDKAR	Nitin	Sukhdeo	SR. EXECUTIVE
9719	10445596	10102005	Energy - Contract Detail Engineering	KUMBHAR	SACHIN	P.	SR. EXECUTIVE
90179	10445620	10102005	Energy - Contract Detail Engineering	DESHMANE	SAGAR	N.	SR. EXECUTIVE
90278	10447241	10102005	Energy - Contract Detail Engineering	SONAWANE	MAYURESH	D.	MANAGER
90291	10445657	10102005	Energy - Contract Detail Engineering	MANE	NAVNATH	D.	SR. EXECUTIVE
91122	10636801	10102005	Energy - Contract Detail Engineering	CHAUDHARI	MILIND	VASUDEO	SR. EXECUTIVE
9066	10445581	10102005	Energy - Contract Detail Engineering	PATIL	MANOJKUMAR	MADHUKAR	SR. EXECUTIVE
9135	10445582	10102005	Energy - Contract Detail Engineering	KHOMNE	VITTAL	HANUMANT	SR. EXECUTIVE
9968	10445640	10102005	Energy - Contract Detail Engineering	KAMBLE	PRAMOD	T.	EXECUTIVE
9976	10445641	10102005	Energy - Contract Detail Engineering	KULKARNI	SAMEER	V.	EXECUTIVE
90227	10447233	10102005	Energy - Contract Detail Engineering	NAZIRKAR	MANOJ	B.	EXECUTIVE
90612	10445630	10102005	Energy - Contract Detail Engineering	YELPALE	DILIP	 S.	EXECUTIVE
90207	10445655	10102005	Energy - Contract Detail Engineering	BUCHAKE	MRS.VASUDHA	U	EXECUTIVE
91151	10644218	10102005	Energy - Contract Detail Engineering	JADHAV	NILESH	DNYANESHWAR	EXECUTIVE
90324	10445727	10102005	Energy - Contract Detail Engineering	DESHPANDE	MRS.ANAGHA	A.	OFFICER
90617	10445732	10102005	Energy - Contract Detail Engineering	SUTAR	JEEVAN	 R.	EXECUTIVE
91078	10631271	10102005	Energy - Contract Detail Engineering	SHINDE	NANDKUMAR	TANAJI	OFFICER
91117	10636052	10102005	Energy - Contract Detail Engineering	AHIRE	SHASHIKANT	HEMRAJ	OFFICER
11727	10628017	10102005	Energy - Contract Detail Engineering	KONDHALKAR	TEJAS	ANANDA	T/E
60100	10445752	10102005	Energy - Contract Detail Engineering	KAMBLE	 AKASH	B.	CAD TECHNICIAN
40827	10639294	10102005	Energy - Contract Detail Engineering	MANE	SACHIN	NAMDEV	T/A
9263	10445556	10102007	Energy - TIS	DHARMADHIKARI	UJWAL	SUHAS	SR. EXECUTIVE
90124	10446923	10102008	Energy - Post Order Process Engineering	BONAGIRI	SHASHIDHAR	\N	SENIOR MANAGER
90627	10445575	10102008	Energy - Post Order Process Engineering	DOKE	GANESH	S.	SR. EXECUTIVE
90766	10482287	10102008	Energy - Post Order Process Engineering	JAYANTHI	V.S.	NAVEEN	MANAGER
90878	10488296	10102008	Energy - Post Order Process Engineering	JAYAWANT	DHAVAL	RAVINDRA	EXECUTIVE
90251	10446816	10102008	Energy - Post Order Process Engineering	APET	VILAS	P.	SENIOR MANAGER
90899	10528488	10103001	MHE  MANAGEMENT	ROY	INDRANIL	--	DIRECTOR
9978	10383714	10103002	MHE  SELLING	DAMLE	SUHAS	A.	SENIOR VICE PRESIDENT
9509	10407750	10103002	MHE  SELLING	NADGONDE	KAUSTUBH	S	GENERAL MANAGER
90048	10383833	10103002	MHE  SELLING	KULKARNI	MILIND	S.	GENERAL MANAGER
90632	10442305	10103002	MHE  SELLING	VENKATARAMAN	SRIDHARA	V.	GENERAL MANAGER
90628	10442321	10103002	MHE  SELLING	SINHA	RAJNISH	KUMAR	GENERAL MANAGER
91145	10641279	10123002	MHE  SELLING	KUMAR	AMIT	\N	GENERAL MANAGER
9778	10446808	10103002	MHE  SELLING	CHAVAN	RAHULRAJ	P.	SENIOR MANAGER
9512	10446763	10103002	MHE  SELLING	JAMADAR	PRASHANT	L.	SENIOR MANAGER
90056	10447156	10103002	MHE  SELLING	KANADE	OMKAR	U.	SENIOR MANAGER
90512	10447069	10103002	MHE  SELLING	NAIR	SHREYAS	R.	SENIOR MANAGER
90670	10482288	10103002	MHE  SELLING	JOSHI	 VISHAL	NARENDRA	SENIOR MANAGER
90144	10447169	10103002	MHE  SELLING	SUTAR	PRAKASH	R.	MANAGER
9996	10447145	10103002	MHE  SELLING	PUJARI	SANTOSH	K.	MANAGER
91159	10647199	10103002	MHE  SELLING	PRAKASH	ADITYA	\N	MANAGER
90356	10447260	10103002	MHE  SELLING	PARUNDEKAR	KUNAL	S.	SR. EXECUTIVE
91178	10656748	10103002	MHE  SELLING	BASANT	DEV	KUMAR	SR. EXECUTIVE
11661	10595544	10103002	MHE  SELLING	RANJAN	SHASHI	KUMAR	T/E
15537	10383742	10103002	MHE  SELLING	CHADHA	ARUN	ROOPCHAND	BUSINESS ADVISOR
5893	10383755	10103003	 Proposal Co-ordination	PARMAR	GAURANG	MANEKLAL	SENIOR GENERAL MANAGER
9862	10446902	10103003	 Proposal Co-ordination	GEND	HAREE	S.	SENIOR MANAGER
9919	10446908	10103003	 Proposal Co-ordination	SHITOLE	SANGRAM	K.	SENIOR MANAGER
90112	10445615	10103003	 Proposal Co-ordination	BHOSALE	VISHAL	Y.	SR. EXECUTIVE
90823	10483753	10103005	Revamp Engineering	RAJEBHOSALE	CHETAN	M.	VICE PRESIDENT
90712	10482301	10103005	Revamp Engineering	GIRIDHARAN	 MOHAN	\N	SENIOR MANAGER
90155	10446925	10103005	Revamp Engineering	UTTEKAR	SUNTOSH	\N	MANAGER
90262	10447182	10103005	Revamp Engineering	PATIL	DIGVIJAY	\N	MANAGER
90534	10445628	10103005	Revamp Engineering	CHOURE	SHEKHAR	R.	SR. EXECUTIVE
91028	10522165	10103005	Revamp Engineering	KARANTE	AMIT	AMBADAS	ENGINEER
91107	10619261	10103005	Revamp Engineering	NAIK	SANDIP	SABAJI	ENGINEER
9667	10445589	10103006	MHE DESIGN & ENGINEERING SERVICES	BANSUDE	GIRISH	G.	SR. EXECUTIVE
9565	10445584	10103006	MHE DESIGN & ENGINEERING SERVICES	SHINDE	PARIMAL	S.	SR. EXECUTIVE
90996	10613897	10103006	MHE DESIGN & ENGINEERING SERVICES	JAGTAP	SWAPNIL	--	SR. EXECUTIVE
90869	10517509	10103006	MHE DESIGN & ENGINEERING SERVICES	TILEKAR	 HARSHAL	OMPRAKASH	EXECUTIVE
15530	10237776	10103008	MHE  SELLING MINERAL PROCESSING	VAIDYA	MILIND	PRABHAKAR	BUSINESS ADVISOR
90593	10442317	10103008	MHE  SELLING MINERAL PROCESSING	DEY	SANJOY	K.	GENERAL MANAGER
90903	10543149	10103008	MHE  SELLING MINERAL PROCESSING	KULKARNI	VIKAS	VASANTRAO	GENERAL MANAGER
90221	10446930	10103008	MHE  SELLING MINERAL PROCESSING	KURLE	Kedareshwar	S.	SENIOR MANAGER
90342	10447255	10103008	MHE  SELLING MINERAL PROCESSING	SHINDE	SAURABH	C.	SR. EXECUTIVE
91132	10639510	10103008	MHE  SELLING MINERAL PROCESSING	BARWAD	CHANDRASHEKHAR	M.	SR. EXECUTIVE
90990	10609810	10103008	MHE  SELLING MINERAL PROCESSING	KESKAR	ABHIJIT	ANIL	EXECUTIVE
11759	10637130	10103008	MHE  SELLING MINERAL PROCESSING	GHADGE	SOURABH	MAHENDRA	T/E
9911	10383830	10103100	MHE Product Life Cycle Mgmt.	SRINIVAS	T.V.S.S.	\N	SENIOR MANAGER
90461	10426433	10103101	 Mineral Processing and SMB	SINHA	CHANCHAL	\N	SENIOR VICE PRESIDENT
9331	10242540	10104001	SUGAR  MANAGEMENT	MUDHOLKAR	ANMOL	ARVIND	SENIOR VICE PRESIDENT
9466	10447308	10104001	SUGAR  MANAGEMENT	KARUNAKARAN	MRS.MANISHA	ARUM	EXECUTIVE
9215	10383725	10104002	SUGAR  SELLING	KULKARNI	GIRISH	P.	SENIOR GENERAL MANAGER
5939	10383757	10104002	SUGAR  SELLING	EXTROSS	SANJAY	ANGELO	SENIOR GENERAL MANAGER
90630	10442313	10104002	SUGAR  SELLING	KALE	MAHAVEER	S.	MANAGER
91116	10635814	10104002	SUGAR  SELLING	VASANTHAN	KP	\N	MANAGER
90373	10447194	10104002	SUGAR  SELLING	KATLAWAR	UMAKANT	G.	MANAGER
9834	10447123	10104002	SUGAR  SELLING	PATIL	ABHIJEET	A.	SR. EXECUTIVE
9295	10383727	10104003	SUGAR PROJECT/PROCESS ENGINEERING	NAVALE	RAJKUMAR	NEMINATH	VICE PRESIDENT
9011	10446750	10104003	SUGAR PROJECT/PROCESS ENGINEERING	PARBATE	DATTARAM	BHIWA	SENIOR MANAGER
91186	10656976	10104003	SUGAR PROJECT/PROCESS ENGINEERING	INGALE	RANJEET	NARHARI	SENIOR MANAGER
9555	10446867	10104003	SUGAR PROJECT/PROCESS ENGINEERING	BEKWADKAR	AVIL	S.	MANAGER
90063	10445566	10104003	SUGAR PROJECT/PROCESS ENGINEERING	BOBADE	KIRAN	T.	MANAGER
9688	10445592	10104003	SUGAR PROJECT/PROCESS ENGINEERING	INAMDAR	JAIRUDDIN	S.	MANAGER
90023	10446918	10104003	SUGAR PROJECT/PROCESS ENGINEERING	PATIL	YUVRAJ	S.	MANAGER
90073	10445613	10104003	SUGAR PROJECT/PROCESS ENGINEERING	RANMODE	AMOL	U.	SR. EXECUTIVE
90079	10445614	10104003	SUGAR PROJECT/PROCESS ENGINEERING	MALI	MANOJKUMAR	B.	SR. EXECUTIVE
90051	10445612	10104003	SUGAR PROJECT/PROCESS ENGINEERING	Sondckar	Veekkas	K.	MANAGER
90092	10447311	10104003	SUGAR PROJECT/PROCESS ENGINEERING	THORAT	SANDEEP	P.	SR. EXECUTIVE
90169	10445651	10104003	SUGAR PROJECT/PROCESS ENGINEERING	DHERAY	MRS. SHWETA 	S.	EXECUTIVE
90212	10445721	10104003	SUGAR PROJECT/PROCESS ENGINEERING	WADINGEKAR	DATTATRAYA	A.	EXECUTIVE
90401	10445667	10104003	SUGAR PROJECT/PROCESS ENGINEERING	PATIL	AMOL	DINKAR	SR. EXECUTIVE
91150	10644219	10104003	SUGAR PROJECT/PROCESS ENGINEERING	SHARMA	ABHISHEK	\N	SR. EXECUTIVE
90402	10445668	10104003	SUGAR PROJECT/PROCESS ENGINEERING	JAGTAP	SUJEET	SANJAY	EXECUTIVE
90412	10445729	10104003	SUGAR PROJECT/PROCESS ENGINEERING	SHINDE	AJAY	ANIL	EXECUTIVE
90446	10445681	10104003	SUGAR PROJECT/PROCESS ENGINEERING	WANI	HARSHAL	D.	EXECUTIVE
90260	10445656	10104003	SUGAR PROJECT/PROCESS ENGINEERING	MALSHIKARE (BHARANE )	MRS.SUNANDA	AMIT	EXECUTIVE
11760	10638048	10104003	SUGAR PROJECT/PROCESS ENGINEERING	PATIL	AKSHAY	NARAYAN	T/E
9187	10383765	10104005	SUGAR  CENTRIFUGALS DESIGN	BHIDE	ANANT	MANOHAR	GENERAL MANAGER
9150	10446753	10104005	SUGAR  CENTRIFUGALS DESIGN	PATIL	SHASHIKANT	KASHINATH	SENIOR MANAGER
90967	10507486	10104005	SUGAR  CENTRIFUGALS DESIGN	LIPARE	HIMANSHU	DEEPAK	ENGINEER
11754	10634511	10104005	SUGAR  CENTRIFUGALS DESIGN	DESHPANDE	PRANAV	PRADIPRAO	T/E
9007	10445544	10104007	SUGAR  CENTRIFUGALS 	DEOCHAKE	KIRTIKUMAR	J.	SENIOR MANAGER
9848	10431218	10104007	SUGAR  CENTRIFUGALS 	GODASE	UMAKANT	B.	MANAGER
9213	10445555	10104007	SUGAR  CENTRIFUGALS 	ABHYANKAR	RAJENDRA	R.	SR. EXECUTIVE
90062	10431221	10104007	SUGAR  CENTRIFUGALS 	GOLE	MAHESH	P.	SR. EXECUTIVE
9378	10380031	10105001	WORKSHOP  MANAGEMENT	TALATHI	SUHAS	MADHAV	DIRECTOR
60110	10500165	10105001	WORKSHOP  MANAGEMENT	KULKARNI	JAGDISH	\N	OFFICE ASSISTANT
15529	10242547	10105002	PRODUCTION PLANNING AND CONTROL.	BHIDE	SANJAY	S.	BUSINESS ADVISOR
9088	10383724	10105002	PRODUCTION PLANNING AND CONTROL.	BAPAT	CHANDRASHEKHAR	JAGNNATH	SENIOR GENERAL MANAGER
90811	10488227	10105002	PRODUCTION PLANNING AND CONTROL.	BARGE	PRAMOD	P.	SENIOR MANAGER
9551	10445550	10105002	PRODUCTION PLANNING AND CONTROL.	YELGE	SANJEEV	S.	SENIOR MANAGER
5781	10383850	10105002	PRODUCTION PLANNING AND CONTROL.	CHINAN	JOEL	LUDGER	MANAGER
9175	10445545	10105002	PRODUCTION PLANNING AND CONTROL.	SHAH	RAJESH	HIRACHAND.	MANAGER
90246	10383838	10105002	PRODUCTION PLANNING AND CONTROL.	KHIRE	SHRIPAD	G.	MANAGER
9544	10445549	10105002	PRODUCTION PLANNING AND CONTROL.	WANI	DINESHKUMAR	D.	MANAGER
9672	10446878	10105002	PRODUCTION PLANNING AND CONTROL.	THAYALAN	GANESHKUMAR	Harshvardhan	MANAGER
9751	10445552	10105002	PRODUCTION PLANNING AND CONTROL.	PATIL	PRASAD	S.	MANAGER
9889	10446906	10105002	PRODUCTION PLANNING AND CONTROL.	SHINDE	HARSHVARDHAN	G.	MANAGER
91163	10647200	10105002	PRODUCTION PLANNING AND CONTROL.	SAHOO	AJITESH	\N	MANAGER
90582	10445572	10105002	PRODUCTION PLANNING AND CONTROL.	HANDE	SUJIT	\N	SR. EXECUTIVE
90317	10445661	10105002	PRODUCTION PLANNING AND CONTROL.	KALE	SUSHANT	D.	SR. EXECUTIVE
90646	10445707	10105002	PRODUCTION PLANNING AND CONTROL.	BHAGAT	KISHOR	D.	ENGINEER
90737	10488243	10105002	PRODUCTION PLANNING AND CONTROL.	BHASME	ABHAYSINH	Y	EXECUTIVE
9792	10446406	10105002	PRODUCTION PLANNING AND CONTROL.	SHINDE (GUND)	SANDEEP	V.	PRODUCTION ASSOCIATE
1692	10488244	10105002	PRODUCTION PLANNING AND CONTROL.	BHISE	VIJAY	S.	FITTER
40903	10641725	10105002	PRODUCTION PLANNING AND CONTROL.	YADAV	VISHAL	BABAN	T/A
11773	10655910	10105002	PRODUCTION PLANNING AND CONTROL.	PAWAR	ATUL	RAJARAM	T/E
11722	10628236	10105002	PRODUCTION PLANNING AND CONTROL.	MARWAHA	NIKHIL	RAJENDRA	T/E
90907	10488697	10105003	PREPARATORY SHOP FITTERS	WADKAR	ASHISH	YASHWANT	PRODUCTION ASSOCIATE
1972	10488651	10105003	PREPARATORY SHOP FITTERS	SHIRSATH	ARUN	B.	FITTER CUM GAS CUTTER
1713	10488420	10105003	PREPARATORY SHOP FITTERS	KHARADE	RAMDAS	D.	HELPER
1851	10488320	10105003	PREPARATORY SHOP FITTERS	GANPATI	SONIMUTTU	\N	FITTER
1968	10488334	10105003	PREPARATORY SHOP FITTERS	GHONE	SANJAY	N.	FITTER
11771	10644307	10105003	PREPARATORY SHOP FITTERS	HAJNALE	AKASH	SUBHASH	T/E
11690	10607596	10105003	PREPARATORY SHOP FITTERS	DONGARE	AMEY	RAMESH	T/E
11648	10512215	10105003	PREPARATORY SHOP FITTERS	KAMBLE	SURAJ	MAHADEV	TECH. TRAINEE
1694	10488315	10105004	FITTERS - HEAVY FABRICATIO HALL 10	GAIKWAD	RAJU	Baban	FITTER
1965	10488383	10105004	FITTERS - HEAVY FABRICATIO HALL 10	KADAM	SANJAY	B.	FITTER
1967	10488702	10105004	FITTERS - HEAVY FABRICATIO HALL 10	YADAV	DILIP	D.	FITTER
1545	10488452	10105005	MEDIUM FABRICATION SHOP FITTERS	LAWAND	ANILKUMAR	GANAPAT	FITTER
1857	10488370	10105006	MECHANICAL ASSEMBLY FITTERS	JADHAV	GANPAT	M.	ATTENDANT
1827	10488630	10105006	MECHANICAL ASSEMBLY FITTERS	SAWANT	SATYAWAN	S.	FITTER
2016	10488624	10105006	MECHANICAL ASSEMBLY FITTERS	SARODE	BABASAHEB	B.	FITTER
90479	10446435	10105007	CENTRIFUGAL SHOP FITTERS	GHEVADE	VIJAYKUMAR	B.	PRODUCTION ASSOCIATE
1975	10488535	10105007	CENTRIFUGAL SHOP FITTERS	PATIL	MAHESH	G.	FITTER
2009	10488619	10105007	CENTRIFUGAL SHOP FITTERS	SANAS	NEERAJ	V.	FITTER
2017	10488538	10105007	CENTRIFUGAL SHOP FITTERS	PATIL	BHAUSAHEB	S.	FITTER
2010	10488219	10105008	WELDERS - HEAVY FAB 10	ANCHAN	MANOJ	K.	WELDER
2032	10488518	10105008	WELDERS - HEAVY FAB 10	NEMADE	PRAVIN	VISHNU	WELDER
2002	10488275	10105009	WELDERS - MEDIUM FAB HALL 1	CHOURE	BALASAHEB	D.	WELDER
2027	10488483	10105009	WELDERS - MEDIUM FAB HALL 1	MANJARE	RAHUL	R	WELDER
1977	10488328	10105009	WELDERS - MEDIUM FAB HALL 1	GHANWAT	SHANKAR	D.	WELDER
1635	10488637	10105012	FITTERS - HEAVY FABRICATION HALL 11	SHAIKH	NAUSHAD	Ismail	FITTER
1969	10488449	10105012	FITTERS - HEAVY FABRICATION HALL 11	LAD	KIRIT	D.	FITTER
90406	10445670	10105012	FITTERS - HEAVY FABRICATION HALL 11	NAGARE	AVINASH	B.	EXECUTIVE
1837	10488382	10105013	FITTERS - MEDIUM FAB HALL 9	KADAM	SHANTARAM	K.	FITTER
1838	10488560	10105013	FITTERS - MEDIUM FAB HALL 9	PAWAR	SHIVAJI	L.	FITTER
1853	10488502	10105013	FITTERS - MEDIUM FAB HALL 9	MULLIYA	MAHABALA	N.	FITTER
2008	10488272	10105013	FITTERS - MEDIUM FAB HALL 9	CHOUGALE	SUNIL	M	FITTER
1970	10488381	10105014	WELDERS - HEAVY FAB 11	KADAM	SANJEEV	R.	WELDER
2014	10488373	10105014	WELDERS - HEAVY FAB 11	JAGTAP	PRALHAD	C.	WELDER
2028	10488507	10105014	WELDERS - HEAVY FAB 11	NAIK	ANANDA	M	WELDER
2030	10488323	10105014	WELDERS - HEAVY FAB 11	GAVHAR	SONBA	BHIMRAO	WELDER
2031	10488675	10105014	WELDERS - HEAVY FAB 11	UCHAGAONKAR	RAJESH	PUNDLIK	WELDER
1581	10488625	10105014	WELDERS - HEAVY FAB 11	SASTE	RAJENDRA	D.	WELDER
1987	10488411	10105014	WELDERS - HEAVY FAB 11	KATE	ANIL	M.	WELDER
1639	10488356	10105015	WELDERS - MEDIUM FAB HALL 9	HADALIA	BIJENDRA	Benami	WELDER
2029	10488245	10105015	WELDERS - MEDIUM FAB HALL 9	BHOSALE	KIRAN	SHANKAR	WELDER
9740	10446397	10105020	MACHINE SHOP H. NO 2	TANVANSHI	KASHIRAY	G	PRODUCTION ASSOCIATE
90281	10446424	10105020	MACHINE SHOP H. NO 2	JADHAV	ABHIJEET	A.	PRODUCTION ASSOCIATE
90299	10446426	10105020	MACHINE SHOP H. NO 2	CHAVAN	NAGESH	S.	PRODUCTION ASSOCIATE
1647	10488310	10105020	MACHINE SHOP H. NO 2	GAIKWAD	RAJENDRA	A.	MACHINIST
1695	10488391	10105020	MACHINE SHOP H. NO 2	KADUSKAR	DEELIP	V.	MACHINIST
1960	10488661	10105020	MACHINE SHOP H. NO 2	SURYAWANSHI	PRALHAD	V.	MACHINIST
1981	10488284	10105020	MACHINE SHOP H. NO 2	DAWARE	JAYWANT	V.	MACHINIST
1982	10488346	10105020	MACHINE SHOP H. NO 2	GOKAKKAR	ASHOK	B.	MACHINIST
1994	10488456	10105020	MACHINE SHOP H. NO 2	LONDHE	ANAND	S	MACHINIST
1995	10488352	10105020	MACHINE SHOP H. NO 2	GUNJAL	ANAND	T.	MACHINIST
2000	10488397	10105020	MACHINE SHOP H. NO 2	KAMBLE	DNYANESHWAR	S.	MACHINIST
2001	10488422	10105020	MACHINE SHOP H. NO 2	KHOND	SANTOSH	C.	MACHINIST
2004	10488690	10105020	MACHINE SHOP H. NO 2	WADKAR	RAJENDRA	S.	MACHINIST
2021	10488500	10105020	MACHINE SHOP H. NO 2	MULANI	JAVED	M.	MACHINIST
2023	10488609	10105020	MACHINE SHOP H. NO 2	REDEKAR	VIJAY	S.	MACHINIST
2026	10488273	10105020	MACHINE SHOP H. NO 2	CHOUGULE	TANAJI	G.	MACHINIST
9773	10446401	10105021	MACHINE SHOP H. NO 6	LAD	HARSHAD	N.	PRODUCTION ASSOCIATE
9782	10446402	10105021	MACHINE SHOP H. NO 6	CHITALI	MALLINATH	S.	PRODUCTION ASSOCIATE
9790	10446405	10105021	MACHINE SHOP H. NO 6	SANKANNAVAR	BAHUBALI	\N	PRODUCTION ASSOCIATE
9794	10446407	10105021	MACHINE SHOP H. NO 6	PATIL	ARUN	U.	PRODUCTION ASSOCIATE
9811	10446408	10105021	MACHINE SHOP H. NO 6	KATKAR	NAMDEO	S.	PRODUCTION ASSOCIATE
9950	10445718	10105021	MACHINE SHOP H. NO 6	MENDES	XAVIER	S.	OFFICER
90044	10446415	10105021	MACHINE SHOP H. NO 6	KHARATE	MAHENDRA	D.	PRODUCTION ASSOCIATE
90241	10446421	10105021	MACHINE SHOP H. NO 6	KSHIRSAGAR	PRASANNA	V.	PRODUCTION ASSOCIATE
90248	10446422	10105021	MACHINE SHOP H. NO 6	JAGTAP	NILESH	G.	PRODUCTION ASSOCIATE
90258	10446423	10105021	MACHINE SHOP H. NO 6	KATE	BIPIN	\N	PRODUCTION ASSOCIATE
90301	10446427	10105021	MACHINE SHOP H. NO 6	PATOKAR	NITESH	H.	PRODUCTION ASSOCIATE
90303	10446428	10105021	MACHINE SHOP H. NO 6	SHINDE	ABHIJEET	S.	PRODUCTION ASSOCIATE
90480	10446436	10105021	MACHINE SHOP H. NO 6	SANGLE	SAMBHAJI	N.	PRODUCTION ASSOCIATE
90815	10488597	10105021	MACHINE SHOP H. NO 6	RAWALE	VAIJNATH	B.	PRODUCTION ASSOCIATE
1825	10488404	10105029	MACHINE SHOP H. NO-1	KANADE	CHANDRAKANT	M.	MACHINIST
1856	10488458	10105029	MACHINE SHOP H. NO-1	MAGADE	GAUTAM	B.	MACHINIST
1956	10488288	10105029	MACHINE SHOP H. NO-1	DESHMUKH	MADHAV	N.	MACHINIST
1961	10488537	10105029	MACHINE SHOP H. NO-1	PATIL	BALIRAM	U	MACHINIST
1991	10488536	10105029	MACHINE SHOP H. NO-1	PATIL	GANESH	J.	MACHINIST
1993	10488295	10105029	MACHINE SHOP H. NO-1	DHARMADHIKARI	SANJAY	D	MACHINIST
2005	10488393	10105029	MACHINE SHOP H. NO-1	KALE	DADASAHEB	B.	MACHINIST
2006	10488311	10105029	MACHINE SHOP H. NO-1	GAIKWAD	BHAGVAN	C.	MACHINIST
2018	10488660	10105029	MACHINE SHOP H. NO-1	SURYAWANSHI	SUNIL	A.	MACHINIST
2022	10488230	10105029	MACHINE SHOP H. NO-1	BASAN	RAMESH	T.	MACHINIST
9756	10446398	10105029	MACHINE SHOP H. NO-1	KAWADE	NITIN	G.	PRODUCTION ASSOCIATE
9813	10446409	10105029	MACHINE SHOP H. NO-1	DAMAME	MADHUKAR	B.	PRODUCTION ASSOCIATE
90002	10446413	10105029	MACHINE SHOP H. NO-1	NIKAM	SACHIN	M.	PRODUCTION ASSOCIATE
90472	10446434	10105029	MACHINE SHOP H. NO-1	CHAUDHARI	JAYESH	H.	PRODUCTION ASSOCIATE
9970	10445719	10105030	MACHINE SHOP H. NO 8-11	PARANJAPE	GIRISH	Y.	OFFICER
9757	10446399	10105030	MACHINE SHOP H. NO 8-11	JADHAV	PRAVIN	M.	PRODUCTION ASSOCIATE
9783	10446403	10105030	MACHINE SHOP H. NO 8-11	GAGARE	SANDIP	D.	PRODUCTION ASSOCIATE
9972	10446411	10105030	MACHINE SHOP H. NO 8-11	GADE	UMESH	P.	PRODUCTION ASSOCIATE
9998	10446412	10105030	MACHINE SHOP H. NO 8-11	GAWAS	EKNATH	M.	PRODUCTION ASSOCIATE
90003	10446414	10105030	MACHINE SHOP H. NO 8-11	MALI	VIJAY	S.	PRODUCTION ASSOCIATE
90066	10446418	10105030	MACHINE SHOP H. NO 8-11	DAKE	RAVINDRAKUMAR	S.	PRODUCTION ASSOCIATE
90083	10446419	10105030	MACHINE SHOP H. NO 8-11	PAWAR	RAMCHANDRA	K.	PRODUCTION ASSOCIATE
90282	10446425	10105030	MACHINE SHOP H. NO 8-11	BHARANKAR	AMOL	R.	PRODUCTION ASSOCIATE
90818	10488467	10105030	MACHINE SHOP H. NO 8-11	MALI	SUNIL	S.	PRODUCTION ASSOCIATE
90463	10446433	10105030	MACHINE SHOP H. NO 8-11	KAGDE	NAVNATH	S.	PRODUCTION ASSOCIATE
1953	10488644	10105030	MACHINE SHOP H. NO 8-11	SHELAR	VIJAY	S.	MACHINIST
1963	10488421	10105030	MACHINE SHOP H. NO 8-11	KHOBRAGADE	KAILASH	N.	MACHINIST
1974	10488394	10105030	MACHINE SHOP H. NO 8-11	KALE	PRAKASH	B.	MACHINIST
1996	10488347	10105030	MACHINE SHOP H. NO 8-11	GORULE	VILAS	M.	MACHINIST
1997	10488324	10105030	MACHINE SHOP H. NO 8-11	GAWADE	ATUL	R.	MACHINIST
1999	10488274	10105030	MACHINE SHOP H. NO 8-11	CHOURE	SUNIL	V.	MACHINIST
2003	10488366	10105030	MACHINE SHOP H. NO 8-11	JADHAV	RAMESH	B.	MACHINIST
2007	10488312	10105030	MACHINE SHOP H. NO 8-11	GAIKWAD	SACHIN	R.	MACHINIST
1986	10488636	10105030	MACHINE SHOP H. NO 8-11	SHAIKH	NUSRAT	B.	MACHINIST
11688	10605226	10105030	MACHINE SHOP H. NO 8-11	BHOGIL	KIRAN	DATTATRAY	TECH. TRAINEE
11686	10601991	10105030	MACHINE SHOP H. NO 8-11	MHETRE	ANNASAHEB	RAMESH	TECH. TRAINEE
11682	10599587	10105030	MACHINE SHOP H. NO 8-11	JADHAV	PANKAJ	VILAS	TECH. TRAINEE
11764	10640728	10105030	MACHINE SHOP H. NO 8-11	SHANKAR	AKASH	\N	TECH. TRAINEE
11766	10641548	10105030	MACHINE SHOP H. NO 8-11	KHAN	SANTANU	TARUN	TECH. TRAINEE
11643	10590267	10105030	MACHINE SHOP H. NO 8-11	JADHAV	CHETAN	ASHOK	TECH. TRAINEE
1567	10488692	10105060	INDIRECT LABOUR	WAGHERE	VILAS	K.	CRANE OPERATOR
1572	10488462	10105060	INDIRECT LABOUR	MAHANKALE	ANDREWS	J.	FITTER
1816	10488489	10105060	INDIRECT LABOUR	MIRAJKAR	AHMED	M.	WELDER
1964	10488615	10105060	INDIRECT LABOUR	SAKHALE	S.	B.	FITTER
1966	10488351	10105060	INDIRECT LABOUR	GULIG	DILIP	M.	FITTER
1959	10488345	10105060	INDIRECT LABOUR	GODSE	ANIL	B.	MACHINIST
1998	10488693	10105060	INDIRECT LABOUR	WAINGADE	RAMCHANDRA	S.	MACHINIST
2015	10488248	10105060	INDIRECT LABOUR	BIRANJE	VIPUL	K.	FITTER
2019	10488555	10105060	INDIRECT LABOUR	PATIL	YUVRAJ	S.	MACHINIST
1684	10488628	10105060	INDIRECT LABOUR	CHAVAN (SATPUTE)	DILIP	ABASAHEB	WELDER
40829	10639296	10105060	INDIRECT LABOUR	NANGARE	YOGESH	TATOBA	T/A
40830	10639297	10105060	INDIRECT LABOUR	SAWANT	KIRAN	BHARAT	T/A
40831	10639298	10105060	INDIRECT LABOUR	LAD	VISHWAJEET	TANAJI	T/A
40832	10639299	10105060	INDIRECT LABOUR	MOHITE	ANANT	BHARAT	T/A
40833	10639300	10105060	INDIRECT LABOUR	KHARADE	DIPAK	PRAKASH	T/A
40834	10639301	10105060	INDIRECT LABOUR	RANGAREJ	SAFALI	MOHAMMAD HUSEN	T/A
40835	10639302	10105060	INDIRECT LABOUR	PATIL	PRAFULL	SANJAY	T/A
40836	10639303	10105060	INDIRECT LABOUR	GURAV	ANIKET	TANAJI	T/A
40837	10639304	10105060	INDIRECT LABOUR	SAVANT	YALLESH	BABASAHEB	T/A
40838	10639305	10105060	INDIRECT LABOUR	JADHAV	SUDESH	BHAGWAN	T/A
40839	10639306	10105060	INDIRECT LABOUR	DAVANG	RAHUL	BALKRISHNA	T/A
40840	10639307	10105060	INDIRECT LABOUR	PATIL	ANIKET	BHAGAVAN	T/A
40841	10639308	10105060	INDIRECT LABOUR	PATIL	JOTIBA	BHAUSO	T/A
40842	10639309	10105060	INDIRECT LABOUR	KHOT	ANIKET	BHAUSO	T/A
40843	10639310	10105060	INDIRECT LABOUR	PATIL	ABHIJEET	VITTHAL	T/A
40844	10639311	10105060	INDIRECT LABOUR	KHOT	YOGESH	DASHARATH	T/A
40845	10639312	10105060	INDIRECT LABOUR	SHINDE	RUTIK	SANDIP	T/A
40846	10639313	10105060	INDIRECT LABOUR	PATIL	SACHIN	RAJARAM	T/A
40847	10639314	10105060	INDIRECT LABOUR	JADHAV	PRAKASH	RAMCHANDRA	T/A
40848	10639315	10105060	INDIRECT LABOUR	KAMBLE	OMKAR	RAJARAM	T/A
40849	10639316	10105060	INDIRECT LABOUR	BHANDARE	ANKUSH	BALASO	T/A
40850	10639317	10105060	INDIRECT LABOUR	DESHMUKH	YOGESH	BAJIRAO	T/A
40851	10639318	10105060	INDIRECT LABOUR	NILE	VITTHAL	KENCHAPPA	T/A
40852	10639319	10105060	INDIRECT LABOUR	AUTADE	SURAJ	BALASO	T/A
40853	10639320	10105060	INDIRECT LABOUR	LOKHANDE	GANESH	SAGAR	T/A
40854	10639321	10105060	INDIRECT LABOUR	MORE	RUSHIKESH	RAJENDRA	T/A
40855	10639322	10105060	INDIRECT LABOUR	NAIK	AKASH	TUKARAM	T/A
40857	10639324	10105060	INDIRECT LABOUR	CHAVAN	VINOD	OMSING	T/A
40858	10639325	10105060	INDIRECT LABOUR	PATIL	RUSHIKESH	DILIP	T/A
40859	10639326	10105060	INDIRECT LABOUR	HELWAR	PARSHURAM	DHONDIRAM	T/A
40860	10639327	10105060	INDIRECT LABOUR	KAMBLE	ANANDA	BHIKAJI	T/A
40861	10639328	10105060	INDIRECT LABOUR	BHITTAM	PRAKASH	ANANDA	T/A
40862	10639329	10105060	INDIRECT LABOUR	KARANDE	RUSHIKESH	BALASAHEB	T/A
40863	10639330	10105060	INDIRECT LABOUR	PATIL	SAURABH	SAMBHAJI	T/A
40864	10639331	10105060	INDIRECT LABOUR	JAGTAP	SANGRAM	YUVRAJ	T/A
40865	10639332	10105060	INDIRECT LABOUR	SUTAR	SACHIN	DAGADU	T/A
40866	10639333	10105060	INDIRECT LABOUR	BHOITE	PRATHAMESH	PANDURANG	T/A
40867	10639334	10105060	INDIRECT LABOUR	ALEKAR	ANIKET	RAMESH	T/A
40868	10639335	10105060	INDIRECT LABOUR	GANESHKAR	VISHWAJEET	SANJAY	T/A
40869	10639336	10105060	INDIRECT LABOUR	BHOSALE	RUTURAJ	SHAHAJI	T/A
40870	10639337	10105060	INDIRECT LABOUR	KADAM	ROHIT	SOMANA	T/A
40871	10639338	10105060	INDIRECT LABOUR	PATIL	AKASH	MARUTI	T/A
40872	10639339	10105060	INDIRECT LABOUR	PATIL	SHUBHAM	JAGANNATH	T/A
40873	10639340	10105060	INDIRECT LABOUR	SURYAWANSHI	RUSHIKESH	VISHWANATH	T/A
40874	10639341	10105060	INDIRECT LABOUR	KUMBHAR	MADHAV	SADASHIV	T/A
40875	10639342	10105060	INDIRECT LABOUR	CHAVAN	VISHAL	SUBHASH	T/A
40877	10639344	10105060	INDIRECT LABOUR	SHEVALE	OMKAR	BAJIRAO	T/A
40878	10639345	10105060	INDIRECT LABOUR	MANE	PANDURANG	JYOTIBA	T/A
40879	10639346	10105060	INDIRECT LABOUR	KAMBLE	MANDAR	DINKAR	T/A
40880	10639347	10105060	INDIRECT LABOUR	KANSE	ADARSH	DATTATRAY	T/A
40881	10639348	10105060	INDIRECT LABOUR	PUJARI	SANDIP	SHIVAJI	T/A
40876	10639343	10105060	INDIRECT LABOUR	SHIROLE	ROHIT	SHREEPAL	T/A
40882	10641704	10105060	INDIRECT LABOUR	THOMBARE	AVADHUT	SHANKAR	T/A
40883	10641705	10105060	INDIRECT LABOUR	VHATKAR	PIYUSH	SUBHASH	T/A
40884	10641706	10105060	INDIRECT LABOUR	KAMBLE	SAMARTH	SHIVAJI	T/A
40885	10641707	10105060	INDIRECT LABOUR	PATIL	AMOL	UMAJI	T/A
40886	10641708	10105060	INDIRECT LABOUR	BHOSALE	RAJENDRA	SHIVAJI	T/A
40887	10641709	10105060	INDIRECT LABOUR	KAMBLE	VAIBHAV	RANGRAO	T/A
40888	10641710	10105060	INDIRECT LABOUR	SURVE	KAPIL	KALIDAS	T/A
40889	10641711	10105060	INDIRECT LABOUR	SHINDE	RAMADAS	BABASO	T/A
40890	10641712	10105060	INDIRECT LABOUR	MANE	ANKUSH	MARUTI	T/A
40891	10641713	10105060	INDIRECT LABOUR	BANGE	OMKAR	PANDURANG	T/A
40892	10641714	10105060	INDIRECT LABOUR	NAIK	VISHAL	VISHNU	T/A
40893	10641715	10105060	INDIRECT LABOUR	BISNAL	BASGONDA	SAHADEV	T/A
40894	10641716	10105060	INDIRECT LABOUR	MANE	KIRAN	TANAJI	T/A
40895	10641717	10105060	INDIRECT LABOUR	JADHAV	SUSHANT	ASHOK	T/A
40896	10641718	10105060	INDIRECT LABOUR	KAMBLE	TEJAS	GAJANAN	T/A
40897	10641719	10105060	INDIRECT LABOUR	GURAV	DHEERAJ	KUMAR	T/A
40898	10641720	10105060	INDIRECT LABOUR	KOLI	SANTOSH	TANAJI	T/A
40899	10641721	10105060	INDIRECT LABOUR	BHOSALE	KIRAN	KRISHNA	T/A
40900	10641722	10105060	INDIRECT LABOUR	VAGHANODE	RAJARAM	ASHOK	T/A
40901	10641723	10105060	INDIRECT LABOUR	SHIKALGAR	ARSHAD	RAJJAK	T/A
90736	10488632	10105003	PREPARATORY SHOP FITTERS	SAWANT	CHITTARANJAN	B.	EXECUTIVE
9831	10445736	10105003	PREPARATORY SHOP FITTERS	BHAMBURE	AMIT	T.	PRODUCTION ASSOCIATE
91019	10540059	10105003	PREPARATORY SHOP FITTERS	KALEL	SUMIT	HANUMANT	ENGINEER
90060	10446417	10105003	PREPARATORY SHOP FITTERS	PUNDKARE	VAIJNATH	T.	ENGINEER
9977	10445642	10105004	FITTERS - HEAVY FABRICATIO HALL 10	GADIWADD	RAMCHANDRA	A.	SR. EXECUTIVE
90081	10445644	10105004	FITTERS - HEAVY FABRICATIO HALL 10	SHINDE	RAHUL	V.	EXECUTIVE
11744	10631194	10105004	FITTERS - HEAVY FABRICATIO HALL 10	MADANE	ABHIJEET	RAMESH	T/E
9260	10383858	10105005	MEDIUM FABRICATION SHOP FITTERS	SASANAPURI	RAMAKRISHNA	\N	SENIOR MANAGER
90718	10488525	10105005	MEDIUM FABRICATION SHOP FITTERS	PAGALE	AJIT	U	EXECUTIVE
90689	10488691	10105005	MEDIUM FABRICATION SHOP FITTERS	WAGHARALKAR	BHAIRU	C.	EXECUTIVE
9441	10446854	10105006	MECHANICAL ASSEMBLY FITTERS	BABAR	KRISHNA	A	MANAGER
11694	10615019	10105006	MECHANICAL ASSEMBLY FITTERS	PAWAR	MAHESH	BABAN	T/E
9914	10445638	10105007	CENTRIFUGAL SHOP FITTERS	JADHAV	LAXMAN	A.	EXECUTIVE
90752	10482289	10105007	CENTRIFUGAL SHOP FITTERS	KANASE	SHRIKANT	H.	SR. EXECUTIVE
90147	10445649	10105008	WELDERS - HEAVY FAB 10	JADHAV	RISHIKESH	R.	EXECUTIVE
11768	10643320	10105009	WELDERS - MEDIUM FAB HALL 1	DESAI	ABHISHEK	SANJAY	T/E
90993	10611877	10105010	Welding Engineering	SANCHETI	GAURAV	POPATLAL	EXECUTIVE
91010	10618252	10105010	Welding Engineering	CHAUDHARI	SARANG	KASHINATH	SENIOR MANAGER
90595	10445573	10105012	FITTERS - HEAVY FABRICATION HALL 11	SHAIKH	PARVEZ	S.	MANAGER
91099	10633405	10105012	FITTERS - HEAVY FABRICATION HALL 11	TAMBADE	PRATIK	SHASHIKANT	SR. EXECUTIVE
91020	10540147	10105012	FITTERS - HEAVY FABRICATION HALL 11	NEVGE	LAXMAN	BAJIRAO	ENGINEER
90543	10446352	10105012	FITTERS - HEAVY FABRICATION HALL 11	DEOKAR	MANGESH	M.	MANAGER
9737	10446396	10105012	FITTERS - HEAVY FABRICATION HALL 11	KADAM	ABHIJIT	L.	ENGINEER
11695	10615021	10105012	FITTERS - HEAVY FABRICATION HALL 11	JADHAV	SAURABH	SURESH	T/E
91021	10546705	10105013	FITTERS - MEDIUM FAB HALL 9	YADAV	ALOK	PRAKASH	ENGINEER
90333	10446430	10105013	FITTERS - MEDIUM FAB HALL 9	PRAJAPATI	SANJAY	C.	ENGINEER
90287	10445624	10105013	FITTERS - MEDIUM FAB HALL 9	DHOKE	NITIN	I.	MANAGER
9814	10445735	10105019	PLANNING MATERIAL, ERP & CNC NESTING	KANHERIKAR	MAYURESH	R.	ENGINEER
9786	10446404	10105019	PLANNING MATERIAL, ERP & CNC NESTING	MUNGASE	VIJAY	S.	EXECUTIVE
90960	10488516	10105019	PLANNING MATERIAL, ERP & CNC NESTING	NATEKAR	PRASAD	JAYANT	ENGINEER
9881	10445565	10105020	MACHINE SHOP H. NO 2	KULKARNI	UTTAM	M.	MANAGER
90249	10445623	10105020	MACHINE SHOP H. NO 2	KAMBLE	KIRAN	C.	MANAGER
91171	10650351	10105020	MACHINE SHOP H. NO 2	More	Aniket	Sahadev	ENGINEER
9717	10445564	10105021	MACHINE SHOP H. NO 6	BHALERAO	SHISHIR	B.	MANAGER
90984	10604738	10105022	FABRICATION SHOP	VADAKEVEEDU	PRADEEP	--	SENIOR GENERAL MANAGER
9021	10383805	10105023	MACHINE SHOP	KARVE	MANDAR	MADHAV	GENERAL MANAGER
90200	10445621	10105028	MACHINE SHOP PROCESS PLANNING	WAKCHAURE	SANJAY	I.	MANAGER
9706	10445563	10105029	MACHINE SHOP H. NO-1	KAMTHE	RAVINDRA	B.	MANAGER
9762	10446400	10105029	MACHINE SHOP H. NO-1	YADAV	VIKRAMSHIH	S.	EXECUTIVE
9492	10446858	10105030	MACHINE SHOP H. NO 8-11	MANE	SOMNATH	G.	MANAGER
90405	10445669	10105030	MACHINE SHOP H. NO 8-11	KAMBLE	SHRINIVAS	V.	SR. EXECUTIVE
91152	10644692	10105030	MACHINE SHOP H. NO 8-11	VIRKUD	NIKHIL	UDAY	SR. EXECUTIVE
9812	10488648	10105030	MACHINE SHOP H. NO 8-11	SHINDE	JAGANATH	C.	ENGINEER
11743	10631195	10105030	MACHINE SHOP H. NO 8-11	TITAR	RAJSHEKHAR	SUBHASH	T/E
90094	10446420	10105062	TOOL ROOM	PAKHARE	SANTOSH	P.	ENGINEER
9817	10446410	10105062	TOOL ROOM	DHENGE	CHANDRAKANT	D.	PRODUCTION ASSOCIATE
9278	10383816	10105302	ELECTRICAL MAINTENANCE WORKSHOP	PUNDE	PRASHANT	RAMESH	SENIOR MANAGER
90286	10446932	10105302	ELECTRICAL MAINTENANCE WORKSHOP	RASHINKAR	CHAITANYA	V.	MANAGER
9922	10447137	10105302	ELECTRICAL MAINTENANCE WORKSHOP	SHIRSATH	SHIVAJI	G.	MANAGER
5955	10383801	10105303	MECHANICAL MAINTENANCE WORKSHOP	BENGALI	KHUSHROV	HOMI	GENERAL MANAGER
9455	10403093	10105303	MECHANICAL MAINTENANCE WORKSHOP	CHAVAN	GANESH	M.	MANAGER
9837	10447124	10105303	MECHANICAL MAINTENANCE WORKSHOP	LOHAR	RAHUL	B.	MANAGER
90542	10447206	10105303	MECHANICAL MAINTENANCE WORKSHOP	PAWAR	NANDAKUMAR	S.	SR. EXECUTIVE
1992	10488485	10105062	TOOL ROOM	MATHE	SUNIL	S.	MACHINIST
15526	10383698	10105201	OSHE	JOSHI	DILIP	KESHAV	BUSINESS ADVISOR
90744	10482290	10105201	OSHE	SHINDE	 UDAY	A.	SENIOR GENERAL MANAGER
9768	10446894	10105201	OSHE	GAWADE	MANISH	J.	MANAGER
90962	10508830	10105201	OSHE	NIKAM	SHIVANI	VIJAY	OFFICER
91039	10623144	10105201	OSHE	ALUR	ASHOK	BHOJARAY	OFFICE ASSOCIATE
40904	10641726	10105201	OSHE	ZOMBADE	RAVINDRA	UTTAM	T/A
60081	10500196	10105201	OSHE	NEVSE	 KISHORE	P.	LEAD SAFETY ENGINEER
5278	10258749	10105202	PERSONNEL & HRD	NAGESHKAR	RAJENDRASINH	SHANKARRAO	DIRECTOR
91176	10656591	10105202	PERSONNEL & HRD	CHABRIA	MRS. SHILLPA	 S.	DIRECTOR
5228	10383737	10105202	PERSONNEL & HRD	RANE	MANOJ	MUKUND	SENIOR GENERAL MANAGER
15532	10383800	10105202	PERSONNEL & HRD	SANGLE	BHAUSAHEB	SAYAJI	BUSINESS ADVISOR
9789	10446809	10105202	PERSONNEL & HRD	MAHADIK	PRAVINKUMAR	D.	SENIOR MANAGER
90411	10422196	10105202	PERSONNEL & HRD	MOHITE	RANJIT	S.	SENIOR MANAGER
90087	10403091	10105202	PERSONNEL & HRD	PADALKAR	DEEPAK	B.	MANAGER
40902	10641724	10105202	PERSONNEL & HRD	PATIL	OMKAR	VILAS	T/A
9822	10447303	10105302	ELECTRICAL MAINTENANCE WORKSHOP	PATIL	MAHESH	A.	ENGINEER
2024	10488412	10105302	ELECTRICAL MAINTENANCE WORKSHOP	KATHALE	MAHESH	S.	ELECTRICIAN
2025	10488348	10105302	ELECTRICAL MAINTENANCE WORKSHOP	GOSAVI	MANGESH	S.	ELECTRICIAN
1819	10488349	10105302	ELECTRICAL MAINTENANCE WORKSHOP	GOSAVI	SHIVANAND	R.	ELECTRICIAN
90007	10446395	10105303	MECHANICAL MAINTENANCE WORKSHOP	PATIL	VINOD	B.	MAINT. ASSOCIATE
90042	10445704	10105303	MECHANICAL MAINTENANCE WORKSHOP	PAWAR	AMIT	A.	MAINT. ASSOCIATE
90887	10488612	10105303	MECHANICAL MAINTENANCE WORKSHOP	SABALE	VIKRAM	SHANKAR	MAINT. ASSOCIATE
1990	10488497	10105303	MECHANICAL MAINTENANCE WORKSHOP	MUDLIAR	G.	K.	DIESEL MECH.
2033	10488451	10105303	MECHANICAL MAINTENANCE WORKSHOP	LANDGE	SHARAD	A.	MILLRIGHT MECH.
91172	10651898	10105401	QUALITY & CONTROL MANAGEMENT	RELEKAR	MR.ANAND	ARVIND	SENIOR GENERAL MANAGER
15539	10242561	10105401	QUALITY & CONTROL MANAGEMENT	MATHEW	K.	 A.	BUSINESS ADVISOR
9424	10446851	10105402	QUALITY- TESTING & RECEIVING	DESHMUKH	SACHIN	DATTAJIRAO	MANAGER
9495	10446859	10105402	QUALITY- TESTING & RECEIVING	KOTIBHASKAR	MANMOHAN	S	MANAGER
11769	10643570	10105402	QUALITY- TESTING & RECEIVING	SHINDE	AMIT	RAJARAM	T/E
90462	10445682	10105402	QUALITY- TESTING & RECEIVING	KUMBHAR	SUYOG	R.	SR. EXECUTIVE
5956	10383802	10105403	QUALITY-  PRODUCTION	NAYAK	VINAYAK	BALAKRISHNA	GENERAL MANAGER
9245	10446755	10105403	QUALITY-  PRODUCTION	THIPSE	MANGESH	\N	SENIOR MANAGER
9059	10383807	10105403	QUALITY-  PRODUCTION	SABALE	RAJENDRA	KUNDALIKA	SENIOR MANAGER
9142	10445547	10105403	QUALITY-  PRODUCTION	MAITRE	RAJENDRA	SUBHASH	MANAGER
9597	10446871	10105403	QUALITY-  PRODUCTION	BORAWAKE	NAVANATH	A.	MANAGER
9700	10446884	10105403	QUALITY-  PRODUCTION	MATANE	VIKAS	T.	MANAGER
90010	10446916	10105403	QUALITY-  PRODUCTION	KORHALE	RANDHIR	C.	MANAGER
9818	10447119	10105403	QUALITY-  PRODUCTION	TELAKE	SACHIN	A.	MANAGER
9898	10445637	10105403	QUALITY-  PRODUCTION	D'COSTA	JAMES	R.	SR. EXECUTIVE
90290	10447243	10105403	QUALITY-  PRODUCTION	NARAHARISETTY	V.S.N.	D.	SR. EXECUTIVE
90433	10445676	10105403	QUALITY-  PRODUCTION	MANTHALE	IRANNAPPA	K.	SR. EXECUTIVE
90434	10488354	10105403	QUALITY-  PRODUCTION	GURAV	SACHIN	K.	SR. EXECUTIVE
90607	10447290	10105403	QUALITY-  PRODUCTION	SHETE	SURAJ	 K.	EXECUTIVE
11747	10632339	10105403	QUALITY-  PRODUCTION	SAWASE	SATISH	SHRIRAM	T/E
9185	10383764	10105404	QUALITY- SUB CONTRACT	PILLAI	VENUGOPAL	AYAPPAN	SENIOR GENERAL MANAGER
9474	10446798	10105404	QUALITY- SUB CONTRACT	JADHAV	MADAN	G.	MANAGER
9582	10445551	10105404	QUALITY- SUB CONTRACT	KONDAWAR	RAJIV	B.	MANAGER
90295	10447186	10105404	QUALITY- SUB CONTRACT	MORE	DATTATRAY	A.	SR. EXECUTIVE
90597	10445694	10105404	QUALITY- SUB CONTRACT	SHINDE	KUSHAL	G.	SR. EXECUTIVE
90588	10445693	10105404	QUALITY- SUB CONTRACT	GUND	VIKAS	S.	EXECUTIVE
9018	10383804	10105405	QUALITY -BOUGHTOUT	GADGIL	SUMEDH	V.	GENERAL MANAGER
9440	10445548	10105405	QUALITY -BOUGHTOUT	KADEKAR	ANIKET	C	SENIOR MANAGER
9439	10445557	10105405	QUALITY -BOUGHTOUT	PATIL	DILIP	K	MANAGER
9581	10445558	10105405	QUALITY -BOUGHTOUT	AJMERA	HITESH	N.	MANAGER
90313	10445568	10105405	QUALITY -BOUGHTOUT	KSHIRSAGAR	DEVENDRA	D.	MANAGER
90314	10445625	10105405	QUALITY -BOUGHTOUT	THAKARE	MANOJKUMAR	G.	MANAGER
90664	10488528	10105405	QUALITY -BOUGHTOUT	PARASARAM	NIRUPADRAVA	\N	EXECUTIVE
90692	10488531	10105405	QUALITY -BOUGHTOUT	PATEL	 K.	P.	EXECUTIVE
5572	10383745	10105406	QUALITY- SITE	DEORE	MILIND	PRABHAKAR	GENERAL MANAGER
5826	10383798	10105406	QUALITY- SITE	MULLUR	RAVI	RAMCHANDRA	SENIOR MANAGER
90068	10445567	10105406	QUALITY- SITE	GANGAWANE	YUVRAJ	V.	MANAGER
90296	10446362	10105406	QUALITY- SITE	SAVALAGI	SUNILKUMAR	G.	MANAGER
90644	10447214	10105406	QUALITY- SITE	SHARMA	KAUSHAL	K.	SR. EXECUTIVE
90311	10445660	10105406	QUALITY- SITE	ACHARYA	VIRENDRA	B.	SR. EXECUTIVE
97004	10447081	10145407	QUALITY-BRANCH OFFICE	SIVABALAN	SALAI	\N	MANAGER
90367	10447193	10125407	QUALITY-BRANCH OFFICE	SINHA	ANUPAM	\N	MANAGER
97005	10447299	10145407	QUALITY-BRANCH OFFICE	SURESH BABU	K.	\N	SR. EXECUTIVE
9472	10383691	10115501	HYD. WORKSHOP  MANAGEMENT	KULKARNI	ATUL	V.	SENIOR VICE PRESIDENT
9749	10447114	10115502	HYD. WORKSHOP  MANAGEMENT P.P.P	TODKAR	MILIND	R.	SR. EXECUTIVE
90959	10488423	10115502	HYD. WORKSHOP  MANAGEMENT P.P.P	KHOT	ANKUSH	PANDURANG	ENGINEER
90335	10447253	10115511	HYD. WORKSHOP  QUALITY	ALLAPULA	RAMU	\N	SR. EXECUTIVE
90918	10551740	10125701	SMB-Sales and Marketing	PAUL	 AVIJIT	--	VICE PRESIDENT
90931	10573849	10105702	SMB-Sales and Marketing	OJHA	MUKESH	RAMJI	MANAGER
91136	10639689	10105702	SMB-Sales and Marketing	MISHRA	SOURABH	KUMAR	MANAGER
90941	10593802	10155702	SMB-Sales and Marketing	MANTOSH	--	KUMAR	SR. EXECUTIVE
11741	10629593	10105702	SMB-Sales and Marketing	SHRIVASTAV	SAURABH	A.	T/E
9655	10446877	10105703	SMB Design and Engineering 	MOTE	VAIBHAV	R.	SENIOR MANAGER
90174	10445652	10105703	SMB Design and Engineering 	BHOSALE	SACHIN	R.	EXECUTIVE
90698	10488547	10105703	SMB Design and Engineering 	PATIL	HARISH	V.	EXECUTIVE
91004	10482303	10105703	SMB Design and Engineering 	PANDU	 VARALA	\N	EXECUTIVE
91001	10489385	10105703	SMB Design and Engineering 	REDDY	KANDUKURI	VISHNUGOPAL	EXECUTIVE
91129	10638047	10105703	SMB Design and Engineering 	GAWANDE	ANKIT	ASHOK	ENGINEER
90757	10482320	10105704	SMB - Execution	KATHAVATE	ADITYA	A.	MANAGER
90714	10488680	10115704	SMB - Execution	VADREVU	PRASAD	LPVSK	SR. EXECUTIVE
91005	10506658	10115704	SMB - Execution	BABU	 NIMAL	N	EXECUTIVE
90983	10603859	10105704	SMB - Execution	GUDDURI	SOBHAN	BABU	EXECUTIVE
91041	10620002	10115704	SMB - Execution	PATHIPATI	RAGHAVENDAR	RAO	ENGINEER
90932	10577040	10105704	SMB - Execution	SANNAPPANAVAR	CHANNABASAPPA	N	ENGINEER
91074	10630271	10105704	SMB - Execution	SELUKAR	SOURABH	SUNIL	EXECUTIVE
91075	10630437	10105704	SMB - Execution	BARIK	RAKESHKUMAR	\N	EXECUTIVE
90915	10551261	10105704	SMB - Execution	SAHU	BIBHUTI	BHUSAN	EXECUTIVE
91022	10488235	10105704	SMB - Execution	BENADIKAR	MOHIT	MAHENDRA	ENGINEER
90198	10380035	10106001	CEMENT  MANAGEMENT	BALASUBRAMANIAN	V.	N.	DIRECTOR
15531	10216863	10106001	CEMENT  MANAGEMENT	MARATHE	MAKARAND	SHRIDHAR	BUSINESS ADVISOR
90590	10447076	10106001	CEMENT  MANAGEMENT	JOHN	MRS.SINCY	\N	MANAGER
90592	10442302	10106002	CEMENT  SELLING	PANDITA	ASHUTOSH	\N	SENIOR GENERAL MANAGER
9635	10446806	10106002	CEMENT  SELLING	SASMAL	SEKHAR	\N	SENIOR MANAGER
9791	10446810	10106002	CEMENT  SELLING	BHARTI	VIKAS	\N	SENIOR MANAGER
9828	10446898	10106002	CEMENT  SELLING	UPPIN	ABHIJIT	S.	MANAGER
9927	10446910	10106002	CEMENT  SELLING	DAS SHARMA	INDRANEEL	C.	MANAGER
90829	10488269	10106002	CEMENT  SELLING	CHOPDE	TEJAS	S.	SR. EXECUTIVE
91130	10638212	10106002	CEMENT  SELLING	KHADE	RAJU	ASHRUBA	ENGINEER
90950	10508831	10106002	CEMENT  SELLING	JAILKHANI	AYUSH	--	EXECUTIVE
9330	10383710	10106003	CEMENT PROPOSAL ENGINEERING	TODKAR	SHASHIKUMAR	SHANKARRAO	VICE PRESIDENT
9396	10383821	10106003	CEMENT PROPOSAL ENGINEERING	WADILE	VINOD	PANDITRAO	GENERAL MANAGER
9886	10383829	10106003	CEMENT PROPOSAL ENGINEERING	ASGAR	ALI	\N	GENERAL MANAGER
90377	10447264	10106003	CEMENT PROPOSAL ENGINEERING	LAMBE	SURAJ	C.	SR. EXECUTIVE
90380	10447267	10106003	CEMENT PROPOSAL ENGINEERING	KHARADE	DIGVIJAY	K.	SR. EXECUTIVE
90319	10447247	10106003	CEMENT PROPOSAL ENGINEERING	WAGH	PRAKASH	S.	SR. EXECUTIVE
90551	10447284	10106003	CEMENT PROPOSAL ENGINEERING	KOSHTI	AJITKUMAR	M.	EXECUTIVE
90879	10488486	10106003	CEMENT PROPOSAL ENGINEERING	MEHENDALE	ASHISH	PRADEEP	ENGINEER
90905	10488257	10106003	CEMENT PROPOSAL ENGINEERING	CHATTERJEE	DEBAJYOTI	--	EXECUTIVE
9518	10279919	10106005	CEMENT  DESIGN & ENGINEERING	GOKHALE	DEEPAK	D.	VICE PRESIDENT
9548	10446802	10106005	CEMENT  DESIGN & ENGINEERING	PATHAK	KISHOR	V.	SENIOR MANAGER
5321	10446783	10106005	CEMENT  DESIGN & ENGINEERING	RAJPUT	BHUPENDRA	BALDEVRAJ	MANAGER
9505	10446862	10106005	CEMENT  DESIGN & ENGINEERING	BHOSALE	SATISH	M	MANAGER
9543	10447101	10106005	CEMENT  DESIGN & ENGINEERING	PURI	KANTILAL	S.	MANAGER
9630	10445560	10106005	CEMENT  DESIGN & ENGINEERING	LOHAR	DEEPAKLAL	R.	MANAGER
9636	10445588	10106005	CEMENT  DESIGN & ENGINEERING	PANSARE	SUNIL	B.	MANAGER
9641	10447107	10106005	CEMENT  DESIGN & ENGINEERING	CHAUDHARI	NILESH	S.	MANAGER
9685	10447109	10106005	CEMENT  DESIGN & ENGINEERING	GADEKAR	ROHIT	K.	MANAGER
9701	10446885	10106005	CEMENT  DESIGN & ENGINEERING	MASHALE	MALLESH	V.	MANAGER
9827	10447122	10106005	CEMENT  DESIGN & ENGINEERING	DESHMUKH	GANESH	K.	MANAGER
9895	10447133	10106005	CEMENT  DESIGN & ENGINEERING	DESHPANDE	VIDYADHAR	R.	MANAGER
9921	10446909	10106005	CEMENT  DESIGN & ENGINEERING	THAKARE	SHAILESH	N.	MANAGER
90025	10445610	10106005	CEMENT  DESIGN & ENGINEERING	UMBRAJKAR	MAHENDRA	R.	MANAGER
9631	10445561	10106005	CEMENT  DESIGN & ENGINEERING	KULKARNI	SATISH	B.	MANAGER
9754	10447115	10106005	CEMENT  DESIGN & ENGINEERING	KULKARNI	SHREYAS	S.	MANAGER
9796	10445600	10106005	CEMENT  DESIGN & ENGINEERING	SAKORE	DADASAHEB	D.	MANAGER
9938	10447138	10106005	CEMENT  DESIGN & ENGINEERING	JADHAV	CHETAN	D.	MANAGER
90024	10445609	10106005	CEMENT  DESIGN & ENGINEERING	VIDEKAR	VAIBHAV	M.	MANAGER
90026	10445611	10106005	CEMENT  DESIGN & ENGINEERING	MORBALE	MARUTI	A.	MANAGER
90110	10445646	10106005	CEMENT  DESIGN & ENGINEERING	KAMBLE	SHRINIVAS	J.	SR. EXECUTIVE
90323	10445726	10106005	CEMENT  DESIGN & ENGINEERING	JAGTAP	GANESH	M.	SR. EXECUTIVE
90345	10445663	10106005	CEMENT  DESIGN & ENGINEERING	MAVADIKAR	DHANANJAY	R.	SR. EXECUTIVE
90777	10488408	10106005	CEMENT  DESIGN & ENGINEERING	KAPDI	MUBIN	B.	EXECUTIVE
90792	10445746	10106005	CEMENT  DESIGN & ENGINEERING	PATIL	 UTTAM	T.	EXECUTIVE
40828	10639295	10106005	CEMENT  DESIGN & ENGINEERING	SUTAR	MAHADEV	TANAJI	T/A
5988	10383707	10106006	CEMENT DESIGN & ENGINEERING SERVICES	KHARE	MUKUL	VIJAY	VICE PRESIDENT
9380	10446761	10106006	CEMENT DESIGN & ENGINEERING SERVICES	DOSHI	SANDEEP	SUBHASH	SENIOR MANAGER
9207	10446754	10106006	CEMENT DESIGN & ENGINEERING SERVICES	ADSUL	SANTOSH	SADASHIV	SENIOR MANAGER
9335	10446843	10106006	CEMENT DESIGN & ENGINEERING SERVICES	BANDGAR	VIRENDRA	T.	MANAGER
9470	10446796	10106006	CEMENT DESIGN & ENGINEERING SERVICES	MANE	RAJESH	B	SENIOR MANAGER
9336	10446844	10106006	CEMENT DESIGN & ENGINEERING SERVICES	SANGLE	GAJENDRA	BHAUSAHEB	MANAGER
9413	10446848	10106006	CEMENT DESIGN & ENGINEERING SERVICES	AKOLKAR	NILESH	SHASHIKANT	MANAGER
9415	10446850	10106006	CEMENT DESIGN & ENGINEERING SERVICES	BELEKAR	VINAYAK	VASANT	MANAGER
9430	10446852	10106006	CEMENT DESIGN & ENGINEERING SERVICES	SALUNKE	VIKAS	K	MANAGER
9437	10446853	10106006	CEMENT DESIGN & ENGINEERING SERVICES	MARATHE	SAMEER	S.	MANAGER
9569	10446868	10106006	CEMENT DESIGN & ENGINEERING SERVICES	MARANE	NITIN	S.	MANAGER
9614	10445559	10106006	CEMENT DESIGN & ENGINEERING SERVICES	KALE	SHREENIVAS	D.	MANAGER
9621	10446876	10106006	CEMENT DESIGN & ENGINEERING SERVICES	PATIL	ATUL	P.	MANAGER
9704	10446886	10106006	CEMENT DESIGN & ENGINEERING SERVICES	BHOI	PRAKASH	M.	MANAGER
9720	10446887	10106006	CEMENT DESIGN & ENGINEERING SERVICES	PESHAVE	AJIT	S.	MANAGER
90305	10422195	10106006	CEMENT DESIGN & ENGINEERING SERVICES	SURAJIWALE	LALIT	B.	MANAGER
9568	10445585	10106006	CEMENT DESIGN & ENGINEERING SERVICES	KAKADE	MRS.PRIYA	V.	SR. EXECUTIVE
9668	10445590	10106006	CEMENT DESIGN & ENGINEERING SERVICES	PATIL (VENDAIT)	RAHUL	B.	SR. EXECUTIVE
9703	10445562	10106006	CEMENT DESIGN & ENGINEERING SERVICES	RUPANWAR	SHRIPATI	S.	MANAGER
9780	10445598	10106006	CEMENT DESIGN & ENGINEERING SERVICES	HEDGIRE	SHREYAS	S.	SR. EXECUTIVE
9840	10445601	10106006	CEMENT DESIGN & ENGINEERING SERVICES	BHATADE	SUNIL	S.	SR. EXECUTIVE
9841	10447125	10106006	CEMENT DESIGN & ENGINEERING SERVICES	YEDEWAR	PRANAY	M.	SR. EXECUTIVE
9901	10445603	10106006	CEMENT DESIGN & ENGINEERING SERVICES	BIRARE	SHRIKRISHNA	P.	SR. EXECUTIVE
90208	10445622	10106006	CEMENT DESIGN & ENGINEERING SERVICES	RAUT	RAVINDRA	G.	SR. EXECUTIVE
90516	10445686	10106006	CEMENT DESIGN & ENGINEERING SERVICES	GHARE	SUNIL	N.	SR. EXECUTIVE
9662	10447219	10106006	CEMENT DESIGN & ENGINEERING SERVICES	BELHEKAR	PRASHANT	B.	SR. EXECUTIVE
9929	10447310	10106006	CEMENT DESIGN & ENGINEERING SERVICES	GAIKWAD	ASHOK	D.	EXECUTIVE
90421	10445671	10106006	CEMENT DESIGN & ENGINEERING SERVICES	DHOLE	DATTATRAYA	ABASAHEB	SR. EXECUTIVE
90442	10445678	10106006	CEMENT DESIGN & ENGINEERING SERVICES	AGNIHOTRI	KEDAR	R.	SR. EXECUTIVE
90443	10445679	10106006	CEMENT DESIGN & ENGINEERING SERVICES	DHANDE	HARSHAL	M.	SR. EXECUTIVE
90568	10445691	10106006	CEMENT DESIGN & ENGINEERING SERVICES	HALGEKAR	SWAPNIL	C.	EXECUTIVE
90796	10488472	10106006	CEMENT DESIGN & ENGINEERING SERVICES	MANDEKAR	 VIVEK	V.	EXECUTIVE
90797	10488374	10106006	CEMENT DESIGN & ENGINEERING SERVICES	JAGTAP	ANIKET	A.	EXECUTIVE
90871	10518887	10106006	CEMENT DESIGN & ENGINEERING SERVICES	MOKASHI	SANDIP	ATMARAM	ENGINEER
90875	10488470	10106006	CEMENT DESIGN & ENGINEERING SERVICES	MANCHARE	VIJAYKUMAR	SITARAM	ENGINEER
90876	10488342	10106006	CEMENT DESIGN & ENGINEERING SERVICES	GIRI	SHRIDHAR	DATTATRAYA	ENGINEER
90890	10521440	10106006	CEMENT DESIGN & ENGINEERING SERVICES	RASKAR	MS MRUNALINI	HEMANT	EXECUTIVE
90904	10488418	10106006	CEMENT DESIGN & ENGINEERING SERVICES	KHANDEKAR	RAJESH	ISHWARA	ENGINEER
90917	10551742	10106006	CEMENT DESIGN & ENGINEERING SERVICES	MHETRE	KISHOR	UMAKANT	ENGINEER
90952	10507472	10106006	CEMENT DESIGN & ENGINEERING SERVICES	KELKAR	NAHUSH	GANESH	ENGINEER
90964	10507479	10106006	CEMENT DESIGN & ENGINEERING SERVICES	DEMANNA	POOJA	PRAKASH	ENGINEER
90965	10507484	10106006	CEMENT DESIGN & ENGINEERING SERVICES	JAGADALE	SWAPNIL	MAHARUDRA	ENGINEER
90966	10507485	10106006	CEMENT DESIGN & ENGINEERING SERVICES	BHOR	NILESH	MARUTI	ENGINEER
91023	10525544	10106006	CEMENT DESIGN & ENGINEERING SERVICES	TALE	ASHISH	PRADIP	ENGINEER
91024	10525549	10106006	CEMENT DESIGN & ENGINEERING SERVICES	TAMGAVE	MS.SNEHA	SHREEDHAR	ENGINEER
91025	10525543	10106006	CEMENT DESIGN & ENGINEERING SERVICES	SHEJWAL	OMKAR	VINAYAK	ENGINEER
91027	10561965	10106006	CEMENT DESIGN & ENGINEERING SERVICES	KOLGE	OMKAR	RAJENDRA	ENGINEER
91029	10590504	10106006	CEMENT DESIGN & ENGINEERING SERVICES	SHINDE	SURAJ	SURESH	ENGINEER
91030	10540968	10106006	CEMENT DESIGN & ENGINEERING SERVICES	DUKANDAR	SANGAMESH	BASAPPA	ENGINEER
91085	10598380	10106006	CEMENT DESIGN & ENGINEERING SERVICES	MASKALE	TUKARAM	H.	ENGINEER
91106	10525497	10106006	CEMENT DESIGN & ENGINEERING SERVICES	MULLA	SADAKATALI	MAINUDDIN	ENGINEER
11762	10638687	10106006	CEMENT DESIGN & ENGINEERING SERVICES	SORATE	AVISHKAR	SHIVAJI	T/E
11756	10634508	10106006	CEMENT DESIGN & ENGINEERING SERVICES	CHAAUDHARI	MAYUR	VILAS	T/E
11654	10593174	10106006	CEMENT DESIGN & ENGINEERING SERVICES	PRASHANT	BALASAHEB	DHOLE	T/E
9916	10383730	10106008	Cement Post Order Engg 	MARELLA	PAHI	G.	SENIOR GENERAL MANAGER
9578	10446869	10106008	Cement Post Order Engg 	GAIKWAD	HARISH	V.	MANAGER
9606	10446872	10106008	Cement Post Order Engg 	JOSHI	MRS.RAJASHREE	R.	MANAGER
9753	10446891	10106008	Cement Post Order Engg 	GAWALI	DEEPAK	B.	MANAGER
9850	10446901	10106008	Cement Post Order Engg 	DESHPANDE	GANESH	R.	MANAGER
5394	10447091	10106008	Cement Post Order Engg 	KOLHE	SHIRISHKUMAR	VITHALRAO	MANAGER
9567	10447102	10106008	Cement Post Order Engg 	PAREKH	MS.DHANASHRI	R.	MANAGER
9985	10447144	10106008	Cement Post Order Engg 	GAVALI	MS.JYOTI	B.	MANAGER
90153	10447171	10106008	Cement Post Order Engg 	DESHMUKH	SAGAR	D.	SR. EXECUTIVE
90379	10447266	10106008	Cement Post Order Engg 	PATEL	ANKIT	R.	SR. EXECUTIVE
90571	10445692	10106008	Cement Post Order Engg 	TELEKONE	MRS.ASHWINI	S.	EXECUTIVE
9306	10383775	10106009	Cement Plant Design ( POST ORDER )	KULKARNI	VIRENDRA	VIJAY	SENIOR GENERAL MANAGER
9434	10446795	10106009	Cement Plant Design ( POST ORDER )	BORATE	VAIBHAV	G.	MANAGER
9686	10446879	10106009	Cement Plant Design ( POST ORDER )	PUJARI	SANTOSH	A.	MANAGER
9721	10446807	10106009	Cement Plant Design ( POST ORDER )	SURYAWANSHI	BHARAT	M.	SENIOR MANAGER
9687	10446880	10106009	Cement Plant Design ( POST ORDER )	DHANRALE	GANESH	A.	MANAGER
9755	10446892	10106009	Cement Plant Design ( POST ORDER )	WAGHOLE	VISHAL	K.	MANAGER
9888	10447131	10106009	Cement Plant Design ( POST ORDER )	PATIL	MAYUR	V.	MANAGER
9669	10445591	10106009	Cement Plant Design ( POST ORDER )	THOMBARE	DILIP	D.	SR. EXECUTIVE
9795	10445599	10106009	Cement Plant Design ( POST ORDER )	WAGHMARE	MS.AMRAPALI	P.	SR. EXECUTIVE
9887	10445602	10106009	Cement Plant Design ( POST ORDER )	MORE (NHANE)	Balkrishna	D.	MANAGER
9969	10445607	10106009	Cement Plant Design ( POST ORDER )	PACHGHARE	PANKAJ	S.	MANAGER
90184	10447175	10106009	Cement Plant Design ( POST ORDER )	PANSE	YOGIRAJ	P.	MANAGER
90428	10445674	10106009	Cement Plant Design ( POST ORDER )	KUMBHAR	SUNIL	B.	SR. EXECUTIVE
90675	10482292	10106009	Cement Plant Design ( POST ORDER )	DANAWALE	RAVI	BAJIRAO	MANAGER
9618	10445587	10106009	Cement Plant Design ( POST ORDER )	ANDORE	AVINASH	S.	SR. EXECUTIVE
9781	10445635	10106009	Cement Plant Design ( POST ORDER )	DHANORE	MS.SMITA	S.	SR. EXECUTIVE
9863	10445636	10106009	Cement Plant Design ( POST ORDER )	ROTE	SADANAND	K.	SR. EXECUTIVE
90175	10445619	10106009	Cement Plant Design ( POST ORDER )	DESHMUKH	AMARNATH	U.	SR. EXECUTIVE
90704	10488439	10126009	Cement Plant Design ( POST ORDER )	KUMAR	 SATYABRATA	-	SR. EXECUTIVE
90914	10550491	10126009	Cement Plant Design ( POST ORDER )	PAUL	SOUMIK	--	EXECUTIVE
90703	10488377	10126009	Cement Plant Design ( POST ORDER )	JATI	 SWAPAN	\N	ENGINEER
90911	10488479	10106009	Cement Plant Design ( POST ORDER )	MANE	PRAVIN	ARJUN	EXECUTIVE
90954	10488340	10106009	Cement Plant Design ( POST ORDER )	GHULANAWAR	RAHUL	BASAWANI	EXECUTIVE
90955	10488674	10106009	Cement Plant Design ( POST ORDER )	TODKAR	AMBAR	KUBER	EXECUTIVE
90956	10508832	10106009	Cement Plant Design ( POST ORDER )	PUKALE	ROHIT	VIJAY	ENGINEER
11698	10617413	10106009	Cement Plant Design ( POST ORDER )	GHOLAP	ATHARV	NITIN	T/E
15538	10481183	10106010	Cement Process Engg	MENON	AMBAT	R.	BUSINESS ADVISOR
9399	10383780	10106010	Cement Process Engg	ACHARYA	PRAGTOOR	S	GENERAL MANAGER
9394	10383820	10106010	Cement Process Engg	DAS	ANUPKUMAR	\N	GENERAL MANAGER
90564	10442303	10106010	Cement Process Engg	RAMACHANDRAN	RAGHAV	-	GENERAL MANAGER
9461	10446762	10106010	Cement Process Engg	KALEESWARAN	RAJU	\N	SENIOR MANAGER
9752	10446890	10106010	Cement Process Engg	JADHAV	ABHINANDAN	B.	MANAGER
90243	10447180	10106010	Cement Process Engg	SHAIKH	MS.AMINA	G.	MANAGER
90274	10447184	10106010	Cement Process Engg	BHALERAO	MS.POOJA	R.	SR. EXECUTIVE
90909	10488577	10106010	Cement Process Engg	RAMALINGAM	JANARDHANA	B	EXECUTIVE
11772	10644807	10106010	Cement Process Engg	PATIL	RAGHAVENDRA	\N	T/E
9414	10446849	10106011	Cement Plant ( PROPOSAL )	GOSAVI	PRADIP	MURLIDHAR	MANAGER
9842	10447126	10106011	Cement Plant ( PROPOSAL )	LIMJE	JITESH	N.	MANAGER
90185	10446928	10106011	Cement Plant ( PROPOSAL )	NILKANTH	SANTOSH	A.	MANAGER
90269	10447183	10106011	Cement Plant ( PROPOSAL )	NIMBALKAR	DATTA	\N	MANAGER
9071	10403094	10107002	ADMINISTRATION  GARAGE	NICHOLAS	CYRIL	JOSEPH	SENIOR MANAGER
9082	10446842	10107004	ADMINISTRATION  STATIONARY	AROCKIAM	UDAYKUMARCHARLES	GABRIAL	MANAGER
11763	10640565	10107007	ADMINISTRATION  CIVIL WORK MAINT	NAIR	MS. DIVYAA	\N	T/E
9595	10446804	10107009	ADMINISTRATION GENERAL	MANJRA	SHAHRUKH	V.	SENIOR MANAGER
90006	10446439	10107009	ADMINISTRATION GENERAL	POOJARI	SATISH	A.	PEON
1858	10488673	10107100	ADMINISTRATION ENGINEERS BUNGLOW	TIKONE	YUVRAJ	N.	COOK
5944	10383722	10107202	CIVIL ENGINEERING/EXECUTION	RADHAKRISHNA	GUNDEPALLY	\N	VICE PRESIDENT
90217	10393264	10107202	CIVIL ENGINEERING/EXECUTION	PATIL	Ravindranath	B.	GENERAL MANAGER
9482	10446855	10107202	CIVIL ENGINEERING/EXECUTION	AWALE	SADANAND	Y.	MANAGER
9650	10403088	10107202	CIVIL ENGINEERING/EXECUTION	ZAMBARE	PANKAJ	S.	MANAGER
9845	10447127	10107202	CIVIL ENGINEERING/EXECUTION	PATIL	ANUP	M.	MANAGER
90384	10446933	10107202	CIVIL ENGINEERING/EXECUTION	SINGH	DILEEP	K.	SENIOR MANAGER
90127	10447166	10107202	CIVIL ENGINEERING/EXECUTION	KULKARNI	ABHINAV	R.	MANAGER
90283	10447242	10107202	CIVIL ENGINEERING/EXECUTION	SAGARE	SANDEEP	A.	SR. EXECUTIVE
90088	10446359	10107202	CIVIL ENGINEERING/EXECUTION	DAS	MEGHANAD	\N	SR. EXECUTIVE
90780	10446463	10107202	CIVIL ENGINEERING/EXECUTION	JANGAM	ASHOK	J	SR. EXECUTIVE
90844	10491225	10107202	CIVIL ENGINEERING/EXECUTION	GEORGE	MS. SHEBA	SUSAN	SR. EXECUTIVE
90913	10446471	10107202	CIVIL ENGINEERING/EXECUTION	ARUMUGAM	R.	--	SR. EXECUTIVE
91184	10656737	10107202	CIVIL ENGINEERING/EXECUTION	ANIRUDH	A.	L.	SR. EXECUTIVE
90662	10488622	10107202	CIVIL ENGINEERING/EXECUTION	SARKAR	ZOHURUL	H.	EXECUTIVE
91124	10637132	10107202	CIVIL ENGINEERING/EXECUTION	BEHERA	SUDHANSHU	SEKHAR	EXECUTIVE
90808	10488491	10107202	CIVIL ENGINEERING/EXECUTION	MISHRA	MS.PRIYANKA	S.	EXECUTIVE
91119	10590505	10107202	CIVIL ENGINEERING/EXECUTION	LONDHE	SURAJ	RANGNATH	ENGINEER
11705	10620850	10107202	CIVIL ENGINEERING/EXECUTION	SAGARE	ANMOL	VASANT	T/E
11752	10634440	10107202	CIVIL ENGINEERING/EXECUTION	KUMAR	SAURAV	\N	T/E
11765	10641549	10107202	CIVIL ENGINEERING/EXECUTION	BORAGE	AJAY	HANUMANT	T/E
60352	10636062	10107202	CIVIL ENGINEERING/EXECUTION	VERMA	NITIN	\N	TECH SUPERVISOR
9327	10383776	10107301	DESIGN & ENGINEERING  MANAGEMENT	AHMAD	SHAKEEL	\N	ViICE PRESIDENT
90566	10481191	10107302	DESIGN & ENGINEERING  MHE-MACHINES	SAHU	SHESDEV	-	SENIOR GENERAL MANAGER
90231	10446814	10107302	DESIGN & ENGINEERING  MHE-MACHINES	JAHAGIRDAR	YOGESH	B.	SENIOR MANAGER
9487	10447099	10107302	DESIGN & ENGINEERING  MHE-MACHINES	MARRALKAR	YUVVRAAJ	D.	MANAGER
9510	10447100	10107302	DESIGN & ENGINEERING  MHE-MACHINES	THITE	SANDEEP	N.	MANAGER
9587	10447106	10107302	DESIGN & ENGINEERING  MHE-MACHINES	MORE	HIMMAT	S.	MANAGER
9966	10447142	10107302	DESIGN & ENGINEERING  MHE-MACHINES	PATIL	KIRAN	V.	MANAGER
90998	10616535	10107302	DESIGN & ENGINEERING  MHE-MACHINES	SUDARSHAN	SHIVAM	--	MANAGER
91121	10636718	10107302	DESIGN & ENGINEERING  MHE-MACHINES	PINGALI	VINAY	KUMAR	MANAGER
9710	10447112	10107302	DESIGN & ENGINEERING  MHE-MACHINES	CHOPADE	SUDHIR	C.	SR. EXECUTIVE
9807	10447117	10107302	DESIGN & ENGINEERING  MHE-MACHINES	WAYASE	YOGESH	R.	SR. EXECUTIVE
90137	10445617	10107302	DESIGN & ENGINEERING  MHE-MACHINES	UGHADE	DIPAK	P.	SR. EXECUTIVE
90156	10445618	10107302	DESIGN & ENGINEERING  MHE-MACHINES	GODASE	NILESH	A.	SR. EXECUTIVE
91177	10656743	10107302	DESIGN & ENGINEERING  MHE-MACHINES	BEHERA	PRATYUSH	PRASANNA	SR. EXECUTIVE
90545	10445731	10107302	DESIGN & ENGINEERING  MHE-MACHINES	PENDAVALE	DHANAJI	G.	EXECUTIVE
91031	10561974	10107302	DESIGN & ENGINEERING  MHE-MACHINES	PATIL	INDRAJIT	MARUTI	ENGINEER
91015	10561979	10107302	DESIGN & ENGINEERING  MHE-MACHINES	BHAVE	TANMAY	BALKRISHNA	ENGINEER
11677	10598382	10107302	DESIGN & ENGINEERING  MHE-MACHINES	KULKARNI	AVINASH	ANIL	T/E
90191	10383790	10127303	DESIGN & ENGINEERING  MHE-SYSTEMS	DAS	SOUMEN	\N	GENERAL MANAGER
90762	10482300	10107303	DESIGN & ENGINEERING  MHE-SYSTEMS	CHANDRASEKAR	 K.	-	GENERAL MANAGER
9884	10383828	10127303	DESIGN & ENGINEERING  MHE-SYSTEMS	CHAKRABORTI	ABHIJIT	\N	GENERAL MANAGER
9143	10446752	10107303	DESIGN & ENGINEERING  MHE-SYSTEMS	PANCHWAGH	ANIRUDHA	BHASKAR	SENIOR MANAGER
9309	10446790	10107303	DESIGN & ENGINEERING  MHE-SYSTEMS	SAVEKAR	AMIT	SHIVAJIRAO	SENIOR MANAGER
9590	10446803	10107303	DESIGN & ENGINEERING  MHE-SYSTEMS	KALE	PRASAD	V.	SENIOR MANAGER
90784	10488306	10107303	DESIGN & ENGINEERING  MHE-SYSTEMS	DURAIRAJ	VENKATESH	--	MANAGER
9385	10446846	10107303	DESIGN & ENGINEERING  MHE-SYSTEMS	BUTE	DNYANESH	ULHAS	MANAGER
90897	10525538	10107303	DESIGN & ENGINEERING  MHE-SYSTEMS	SODDAGI	 PRASHANT	SHIVASHARANAPPA	MANAGER
9876	10446905	10127303	DESIGN & ENGINEERING  MHE-SYSTEMS	HODA	Sarfarazul	\N	SENIOR MANAGER
9948	10447140	10107303	DESIGN & ENGINEERING  MHE-SYSTEMS	PATIL	AMIT	B.	MANAGER
9442	10447098	10107303	DESIGN & ENGINEERING  MHE-SYSTEMS	SAMBARE	PRASHANT	R	SR. EXECUTIVE
9709	10447111	10107303	DESIGN & ENGINEERING  MHE-SYSTEMS	KAKADE	ANIL	S.	SR. EXECUTIVE
9946	10447139	10127303	DESIGN & ENGINEERING  MHE-SYSTEMS	DAS	DEBASISH	\N	SR. EXECUTIVE
9955	10447221	10127303	DESIGN & ENGINEERING  MHE-SYSTEMS	MODAK	PROBIR	\N	SR. EXECUTIVE
91183	10656740	10107303	DESIGN & ENGINEERING  MHE-SYSTEMS	JOHNS	ABI	\N	SR. EXECUTIVE
90004	10447146	10107303	DESIGN & ENGINEERING  MHE-SYSTEMS	INAMDAR	MS.TARNNUM	G.	MANAGER
90028	10447151	10107303	DESIGN & ENGINEERING  MHE-SYSTEMS	KUMAR	SAURABH	\N	MANAGER
90030	10447152	10107303	DESIGN & ENGINEERING  MHE-SYSTEMS	BELVALKAR	RAVIRAJ	M.	MANAGER
90076	10445643	10107303	DESIGN & ENGINEERING  MHE-SYSTEMS	BHOSALE	NILESH	S.	SR. EXECUTIVE
90526	10447203	10127303	DESIGN & ENGINEERING  MHE-SYSTEMS	ADHIKARY	ANKU	S.	SR. EXECUTIVE
90642	10447078	10127303	DESIGN & ENGINEERING  MHE-SYSTEMS	DEY	SUBHASHIS	\N	MANAGER
90149	10445650	10107303	DESIGN & ENGINEERING  MHE-SYSTEMS	SHINDE	VIJAYKUMAR	R.	SR. EXECUTIVE
90150	10447226	10107303	DESIGN & ENGINEERING  MHE-SYSTEMS	LIMBIKAI	CHETAN	D.	SR. EXECUTIVE
90226	10445722	10107303	DESIGN & ENGINEERING  MHE-SYSTEMS	PARKALE	AMOL	N.	SR. EXECUTIVE
90497	10445730	10127303	DESIGN & ENGINEERING  MHE-SYSTEMS	DAS	TAPADEV	T.	SR. EXECUTIVE
5889	10445712	10107303	DESIGN & ENGINEERING  MHE-SYSTEMS	JADHAV	PRASANT	J.	SR. EXECUTIVE
90178	10445653	10127303	DESIGN & ENGINEERING  MHE-SYSTEMS	CHANDRA	CHIRADIP	\N	EXECUTIVE
90507	10445685	10127303	DESIGN & ENGINEERING  MHE-SYSTEMS	SARKAR	JOYDEEP	\N	EXECUTIVE
90673	10488427	10127303	DESIGN & ENGINEERING  MHE-SYSTEMS	KOLEY	DIPANJAN	\N	EXECUTIVE
90713	10482347	10127303	DESIGN & ENGINEERING  MHE-SYSTEMS	BHATTACHARYA	KANISKA	\N	EXECUTIVE
90674	10482302	10107303	DESIGN & ENGINEERING  MHE-SYSTEMS	GOSAVI	RAHUL	DAGDU	EXECUTIVE
90560	10445690	10127303	DESIGN & ENGINEERING  MHE-SYSTEMS	MONDAL	BANIBRATA	-	ENGINEER
90677	10488613	10127303	DESIGN & ENGINEERING  MHE-SYSTEMS	SAHA	RAJIV	\N	ENGINEER
90693	10482351	10127303	DESIGN & ENGINEERING  MHE-SYSTEMS	MAHATO	 KALICHARAN	\N	ENGINEER
90720	10488523	10107303	DESIGN & ENGINEERING  MHE-SYSTEMS	PACHARE	KAVISHWAR	S.	ENGINEER
90912	10488465	10107303	DESIGN & ENGINEERING  MHE-SYSTEMS	MALEKAR	ONKAR	VIJAY	ENGINEER
91086	10598370	10107303	DESIGN & ENGINEERING  MHE-SYSTEMS	PUNUGU	VENKATA MAHESH	N.	ENGINEER
40825	10639292	10107303	DESIGN & ENGINEERING  MHE-SYSTEMS	DESHMANE	PAVAN	SUNIL	T/A
40826	10639293	10107303	DESIGN & ENGINEERING  MHE-SYSTEMS	BOTRE	SURAJ	DNYANESHWAR	T/A
11674	10598459	10107303	DESIGN & ENGINEERING  MHE-SYSTEMS	BHARSAKALE	PRATIK	DHANANJAY	T/E
90129	10383732	10107304	DESIGN & ENGINEERING CRUSHER/SCREEN - DESIGN	NARGUND	SANJEEV	S.	SENIOR GENERAL MANAGER
9691	10446881	10107304	DESIGN & ENGINEERING CRUSHER/SCREEN - DESIGN	DESHPANDE	PRASHANT	P.	MANAGER
90358	10446377	10107304	DESIGN & ENGINEERING CRUSHER/SCREEN - DESIGN	RAYNADE	UDAYKUMAR	A.	SR. EXECUTIVE
90197	10445654	10107304	DESIGN & ENGINEERING CRUSHER/SCREEN - DESIGN	NANDURKAR	NILESH	R.	SR. EXECUTIVE
11745	10631664	10107304	DESIGN & ENGINEERING CRUSHER/SCREEN - DESIGN	PAWAR	SUSHANT	SHASHANK	T/E
9165	10445715	10107304	DESIGN & ENGINEERING CRUSHER/SCREEN - DESIGN	WAGHMARE	ANTHONY	P.	OFFICER
90802	10488493	10107305	DESIGN & ENGINEERING STRUCTURAL - DESIGN	MODAK	ARIJIT	--	GENERAL MANAGER
90587	10446774	10107305	DESIGN & ENGINEERING STRUCTURAL - DESIGN	URAVANE	ASHISH	S.	SENIOR MANAGER
90938	10446819	10107305	DESIGN & ENGINEERING STRUCTURAL - DESIGN	BIRING	SUKHJIWAN	SINGH	SENIOR MANAGER
9865	10446903	10107305	DESIGN & ENGINEERING STRUCTURAL - DESIGN	BANDRE	ANIL	V.	MANAGER
90643	10446830	10127305	DESIGN & ENGINEERING STRUCTURAL - DESIGN	DEB	ARABINDA	A.	MANAGER
90655	10445576	10107305	DESIGN & ENGINEERING STRUCTURAL - DESIGN	AFZAL	AHMAR	\N	MANAGER
9820	10447120	10107305	DESIGN & ENGINEERING STRUCTURAL - DESIGN	RAWOOL	MAHADEV	S.	MANAGER
91098	10633406	10127305	DESIGN & ENGINEERING STRUCTURAL - DESIGN	DEYATI	MRINAL	\N	MANAGER
90033	10445720	10107305	DESIGN & ENGINEERING STRUCTURAL - DESIGN	MHASUDAGE	DEEPAK	P.	SR. EXECUTIVE
90645	10482345	10127305	DESIGN & ENGINEERING STRUCTURAL - DESIGN	HAQUE	SK	M	MANAGER
90648	10447079	10127305	DESIGN & ENGINEERING STRUCTURAL - DESIGN	NASKAR	BAPI	\N	MANAGER
90839	10488249	10127305	DESIGN & ENGINEERING STRUCTURAL - DESIGN	BISWAS	MS. SNIGDHA	\N	MANAGER
90253	10445723	10107305	DESIGN & ENGINEERING STRUCTURAL - DESIGN	JANRAO	KANTILAL	S.	EXECUTIVE
90257	10445724	10127305	DESIGN & ENGINEERING STRUCTURAL - DESIGN	CHAKRABORTY	NILANJAN	\N	EXECUTIVE
90293	10445725	10107305	DESIGN & ENGINEERING STRUCTURAL - DESIGN	PAWAR	GANESH	B.	EXECUTIVE
90603	10445629	10127305	DESIGN & ENGINEERING STRUCTURAL - DESIGN	SAHA	DIPANKAR	 P.	SR. EXECUTIVE
90625	10446366	10107305	DESIGN & ENGINEERING STRUCTURAL - DESIGN	BOMBATKAR	DATTATRAY	S.	SR. EXECUTIVE
90866	10515439	10107305	DESIGN & ENGINEERING STRUCTURAL - DESIGN	SHIROTE	SANTOSH	B.	SR. EXECUTIVE
91180	10656744	10107305	DESIGN & ENGINEERING STRUCTURAL - DESIGN	MOHAPATRA	SRINIBAS	\N	SR. EXECUTIVE
91181	10656742	10107305	DESIGN & ENGINEERING STRUCTURAL - DESIGN	KUMAR	ABHIJEET	\N	SR. EXECUTIVE
91185	10656738	10107305	DESIGN & ENGINEERING STRUCTURAL - DESIGN	HARIOUDH	LOKESH	\N	SR. EXECUTIVE
90989	10609539	10127305	DESIGN & ENGINEERING STRUCTURAL - DESIGN	DAS	TAMAL	--	EXECUTIVE
90686	10488492	10127305	DESIGN & ENGINEERING STRUCTURAL - DESIGN	MITRA	MS. MANASHI	N.	EXECUTIVE
90827	10488617	10127305	DESIGN & ENGINEERING STRUCTURAL - DESIGN	SAMANTA	SRIMANTA	-	EXECUTIVE
60076	10446447	10127305	DESIGN & ENGINEERING STRUCTURAL - DESIGN	BHATTACHARJEE	 DHRUBA	J.	CAD TECHNICIAN
60203	10619317	10107305	DESIGN & ENGINEERING STRUCTURAL - DESIGN	WALE	MALLINATH	\N	CAD ENGINEER
90895	10525057	10107331	Engineering Planning and Documentation 	GRAMOPADHYE	CHAITANYA	DATTATRAY	EXECUTIVE
60139	10425763	10107331	Engineering Planning and Documentation 	BECHAWADE	MAHENDRA	SITARAM	TECHNICAL ASSISTANT
9585	10447105	10107332	Pulleys and Idlers Design 	POTDAR	SACHIN	D.	MANAGER
91032	10561970	10107332	Pulleys and Idlers Design 	KULKARNI	VARUN	BADRINARAYAN	ENGINEER
91087	10598367	10107332	Pulleys and Idlers Design 	LOHAR	AVINASH	SANJAY	ENGINEER
91139	10593175	10107332	Pulleys and Idlers Design 	CHAUDHARI	RAMKRUSHNA	VITTHAL	ENGINEER
11758	10637129	10107332	Pulleys and Idlers Design 	DEO	MAYURESH	JAYANT	T/E
9484	10383823	10107333	Utilities Design 	MITRA	DIBAKAR	\N	GENERAL MANAGER
90933	10578111	10107333	Utilities Design 	SUBRAMANYA	 S	--	MANAGER
90691	10482346	10127333	Utilities Design 	MAJUMDER	SANTANU	\N	MANAGER
90925	10564118	10107333	Utilities Design 	SRINIVASULU	B.M.	--	MANAGER
91114	10635477	10107333	Utilities Design 	SOLSE	SANDEEP	ANANTA	EXECUTIVE
90661	10482348	10127333	Utilities Design 	SAHA	SHANTANU	\N	EXECUTIVE
90667	10482349	10127333	Utilities Design 	PRAMANIK	AVIJIT	A.	EXECUTIVE
91133	10639542	10107333	Utilities Design 	GANDROTU	VENKATESWARULU	\N	EXECUTIVE
11728	10628019	10107333	Utilities Design 	KHEDKAR	CHINMAY	VILAS	T/E
9879	10383784	10107334	Wagon Tipplers Design 	BADHE	RAJESH	S.	SENIOR GENERAL MANAGER
90536	10446824	10107334	Wagon Tipplers Design 	SHAIKH	MOHD. KALIMUDDIN	\N	SENIOR MANAGER
90432	10447197	10107334	Wagon Tipplers Design 	KAMBLE	PANKAJ	B.	MANAGER
9708	10445593	10107334	Wagon Tipplers Design 	KADAM	DIGAMBAR	K.	SR. EXECUTIVE
91182	10656741	10107334	Wagon Tipplers Design 	PATRO	CH PRABHANJAN	\N	SR. EXECUTIVE
11739	10629517	10107334	Wagon Tipplers Design 	DESHMUKH	HRUSHIKESH	M.	T/E
11697	10617411	10107334	Wagon Tipplers Design 	PUJARI	MANDAR	SHRIDHAR	T/E
9314	10383817	10107335	FGD Equipment Design	KIRVE	MANISH	MADHUKAR	SENIOR MANAGER
90986	10605888	10107335	FGD Equipment Design	KHUNE	JAYESH	RAJENDRA	MANAGER
90261	10447181	10107335	FGD Equipment Design	DEGAONKAR	DATTAMURTI	\N	SR. EXECUTIVE
90653	10445700	10107335	FGD Equipment Design	WANI	PARITOSH	S	EXECUTIVE
91080	10631457	10107335	FGD Equipment Design	PAWAR	UDAYAN	DHANANJAY	EXECUTIVE
90910	10488222	10107335	FGD Equipment Design	AWATADE	ROHIT	UTTAMRAO	ENGINEER
91101	10633910	10107335	FGD Equipment Design	BARVE	BHOOPENDRA	DILIP	ENGINEER
91108	10619264	10107335	FGD Equipment Design	JOSHI	ROHAN	PARMANAND	ENGINEER
90181	10447228	10107336	Paddle Feeder Design	JADHAV	MRS.SANDHYA	D.	EXECUTIVE
11616	10553249	10107336	Paddle Feeder Design	JADHAV	AKSHAY	RAJENDRA	T/E
5530	10383685	10107401	ELECTRICAL/INSTRUMENTATION ADMINISTRATION - ELECTRICAL	SAGANE	SUNIL	CHANDRAKANT	HEAD - ELECTRICAL & INSTRUMENTATION
90529	10426443	10107402	ENGG./EXECUTION ELECTRICAL	SUBRAMANIAN	M	K	VICE PRESIDENT
5985	10383758	10107402	ENGG./EXECUTION ELECTRICAL	BAILKERI	BALKRISHNA	GAJANAN	GENERAL MANAGER
9939	10393265	10107402	ENGG./EXECUTION ELECTRICAL	MULAY	MRS.CHARUTA	V.	GENERAL MANAGER
90683	10481193	10107402	ENGG./EXECUTION ELECTRICAL	TANKSALE	 KEDAR	V.	SENIOR MANAGER
9804	10446896	10107402	ENGG./EXECUTION ELECTRICAL	SANGEKAR	VAIJNATH	G.	SENIOR MANAGER
90812	10488318	10107402	ENGG./EXECUTION ELECTRICAL	GANESHAN	MS. VANAKKILI	-	SENIOR MANAGER
9352	10446845	10107402	ENGG./EXECUTION ELECTRICAL	MOGAL	MURZBAN	KAIKOBAD	MANAGER
9613	10383560	10107402	ENGG./EXECUTION ELECTRICAL	GAWAS	SANDEEP	R.	SENIOR MANAGER
9664	10417934	10107402	ENGG./EXECUTION ELECTRICAL	SALUNKHE	MANGESH	V.	SENIOR MANAGER
9684	10417936	10107402	ENGG./EXECUTION ELECTRICAL	SANGAONKAR	MS.VRUSHALI	D.	SENIOR MANAGER
90176	10417938	10107402	ENGG./EXECUTION ELECTRICAL	KOTHALE	SUNIL	K.	MANAGER
9718	10447113	10107402	ENGG./EXECUTION ELECTRICAL	SHEWALE	AMOL	G.	MANAGER
90168	10447174	10107402	ENGG./EXECUTION ELECTRICAL	JAGADALE	GANAPATI	S.	MANAGER
90576	10447210	10107402	ENGG./EXECUTION ELECTRICAL	ADMULWAR	SHASHANK	S.	MANAGER
91064	10626116	10107402	ENGG./EXECUTION ELECTRICAL	MULLA	MOHSIN	BADSHAH	MANAGER
91093	10632337	10107402	ENGG./EXECUTION ELECTRICAL	KULKARNI	SAURABH	VITTHAL	MANAGER
90892	10522042	10107402	ENGG./EXECUTION ELECTRICAL	KHAIRKHAR	VIJAY	SUKALAL	MANAGER
91113	10635197	10107402	ENGG./EXECUTION ELECTRICAL	DACHEPALLI	VENKATA	KRISHNAMOHAN	SR. EXECUTIVE
90874	10488252	10107402	ENGG./EXECUTION ELECTRICAL	CHALKE	SAMEER	ASHOK	EXECUTIVE
90958	10518958	10107402	ENGG./EXECUTION ELECTRICAL	TANPURE	PRANAV	SOPANRAO	EXECUTIVE
91137	10640165	10107402	ENGG./EXECUTION ELECTRICAL	DESHPANDE	GAURAV	SUNIL	EXECUTIVE
91034	10519008	10107402	ENGG./EXECUTION ELECTRICAL	JADHAV	MANGESH	GANPAT	ENGINEER
91035	10584323	10107402	ENGG./EXECUTION ELECTRICAL	THAKARE	HARSHAL	VISHWAS	ENGINEER
91046	10622417	10107402	ENGG./EXECUTION ELECTRICAL	UKKADGAONKAR	PRANAV	 D.	ENGINEER
91091	10598375	10107402	ENGG./EXECUTION ELECTRICAL	PANDA	VIKASH	KUMAR	ENGINEER
91092	10598369	10107402	ENGG./EXECUTION ELECTRICAL	KATHURIA	AMAN	\N	ENGINEER
9219	10445716	10107402	ENGG./EXECUTION ELECTRICAL	BHOSALE	DNYANESHWAR	KRISHNARAO	OFFICER
11723	10628489	10107402	ENGG./EXECUTION ELECTRICAL	BHOSALE	MS.NEHA	CHANDRAKANT	T/E
11724	10628488	10107402	ENGG./EXECUTION ELECTRICAL	SHINDE	VIDYADHAR	HANUMANT	T/E
9099	10383808	10107404	ENGG./EXECUTION INSTRUMENTATION	SHELAR	SANJAY	RAMCHANDRA	SENIOR GENERAL MANAGER
9629	10417930	10107404	ENGG./EXECUTION INSTRUMENTATION	SADAVARTE	SACHIN	N.	GENERAL MANAGER
9405	10417932	10107404	ENGG./EXECUTION INSTRUMENTATION	BHADULE	KEDAR	DEVIDAS	SENIOR MANAGER
9857	10417931	10107404	ENGG./EXECUTION INSTRUMENTATION	JAGTAP	PRADEEP	T.	SENIOR MANAGER
9577	10447104	10107404	ENGG./EXECUTION INSTRUMENTATION	DURGE	VISHAL	M.	MANAGER
9604	10417933	10107404	ENGG./EXECUTION INSTRUMENTATION	PATIL	VISHAL	L.	MANAGER
9663	10417935	10107404	ENGG./EXECUTION INSTRUMENTATION	SURYAWANSHI	PRASHANT	D.	MANAGER
9725	10417937	10107404	ENGG./EXECUTION INSTRUMENTATION	SAKHARE	DINESH	V.	MANAGER
90348	10447258	10107404	ENGG./EXECUTION INSTRUMENTATION	RAJEEVAN	ARVIND	U.	SR. EXECUTIVE
90616	10447292	10107404	ENGG./EXECUTION INSTRUMENTATION	TONAPE	MUKUND	 S.	SR. EXECUTIVE
91000	10617278	10107404	ENGG./EXECUTION INSTRUMENTATION	JANJIRE	MS.SUCHITA	SURYAKANT	EXECUTIVE
91072	10629353	10107404	ENGG./EXECUTION INSTRUMENTATION	JADHAV	VIVEK	VILAS	EXECUTIVE
91120	10636596	10107404	ENGG./EXECUTION INSTRUMENTATION	BHADURI	ARITRA	\N	EXECUTIVE
91094	10632338	10107404	ENGG./EXECUTION INSTRUMENTATION	MANE	ATUL	ABASO	EXECUTIVE
91168	10649218	10107404	ENGG./EXECUTION INSTRUMENTATION	MADHUSUDHAN	C.	\N	EXECUTIVE
91169	10649219	10107404	ENGG./EXECUTION INSTRUMENTATION	PATIL	NANA	SHIVAJI	EXECUTIVE
91090	10598371	10107404	ENGG./EXECUTION INSTRUMENTATION	BADE	MAHESH	PARASRAM	ENGINEER
91154	10644805	10107404	ENGG./EXECUTION INSTRUMENTATION	DANTAM	MS. AISHWARYA	SATYASAI	ENGINEER
11702	10618249	10107404	ENGG./EXECUTION INSTRUMENTATION	VIKHE	MS.SHUBHANGI	SOMNATH	T/E
11703	10618250	10107404	ENGG./EXECUTION INSTRUMENTATION	TAJANE	MS.DEOYANI	RAMESH	T/E
5829	10383750	10107405	Automation	YADNOPAVIT	NITIN	VISHNUPANT	SENIOR GENERAL MANAGER
90331	10383734	10107405	Automation	PAUL	AMITABH	K.	GENERAL MANAGER
90389	10447195	10107405	Automation	KIRANE	MS.MOHINI	R.	MANAGER
90202	10447176	10107405	Automation	NAVED AKHTAR	MOHD IQBAL KALIM	\N	MANAGER
91170	10649336	10107405	Automation	PATIL	SUJEET	PRATAPSINH	EXECUTIVE
91174	10407578	10107601	FINANCE  MANAGEMENT	GOYAL	PULKIT	RAMESHWAR	Whole Time Director & CFO
15540	10242191	10107601	FINANCE  MANAGEMENT	KETKAR	GIRISH	 V.	BUSINESS ADVISOR
90787	10488364	10107601	FINANCE  MANAGEMENT	IYER	VENKAT	A.	SR. EXECUTIVE
5753	10447093	10107602	FINANCE  BOOK KEEPING	MAHAJAN	MRS.SMITA	VILAS	MANAGER
9353	10447096	10107602	FINANCE  BOOK KEEPING	BHATE	NIRANJAN	DINKAR	SR. EXECUTIVE
91096	10632916	10107602	FINANCE  BOOK KEEPING	BORATE	MS. POONAM	SANDEEP	OFFICER
5635	10446749	10107603	FINANCE  BILLING	MAHAJAN	VILAS	GAJANAN	SENIOR MANAGER
9404	10446793	10107603	FINANCE  BILLING	KULKARNI	DAYANAND	KRISHNAJI	MANAGER
9264	10446756	10107603	FINANCE  BILLING	MUJAWAR	MOHASIN	MUBARAK	MANAGER
9400	10446847	10107603	FINANCE  BILLING	MASALUNKAR	RAJESH	HARISHCHANDRA	MANAGER
9527	10446863	10107603	FINANCE  BILLING	GAVADE	SANTOSH	S	MANAGER
5783	10383796	10107604	FINANCE  BILL PASSING	PRABHU	GOPAL	RAMKRISHNA	SENIOR GENERAL MANAGER
9310	10403092	10107604	FINANCE  BILL PASSING	MOHARIL	VIVEK	VISHNU	MANAGER
5752	10446841	10107604	FINANCE  BILL PASSING	ANILKUMAR	POORATH	NARAYAN	SENIOR MANAGER
9183	10447094	10107604	FINANCE  BILL PASSING	OAK	MRS.PURVA	HARSH	MANAGER
9184	10447095	10107604	FINANCE  BILL PASSING	GODSE	MRS.SAMPADA	NARENDRA	MANAGER
90654	10446831	10107605	FINANCE BANKING AND INSURANCE	MAKASHIR	GAURAV	D.	SENIOR MANAGER
90974	10529208	10107605	FINANCE BANKING AND INSURANCE	BATHIJA	MS.NAMRATA	--	EXECUTIVE
15535	10383688	10107606	FINANCE  TAXATION	KUMARESAN	K.	\N	BUSINESS ADVISOR
90927	10569434	10107606	FINANCE  TAXATION	KESKAR	RAJEEV	ANANT	GENERAL MANAGER
9615	10446875	10107606	FINANCE  TAXATION	KULKARNI	RAJESH	R.	MANAGER
90344	10447191	10107606	FINANCE  TAXATION	RANADIVE	PANKAJ	V.	MANAGER
91068	10627787	10107606	FINANCE  TAXATION	DESHMUKH	SATYAJEET	BHASKAR	MANAGER
90374	10447319	10107606	FINANCE  TAXATION	NANDA	NISHIKANTA	B.	SR. EXECUTIVE
90861	10512657	10107606	FINANCE  TAXATION	RETWADE	VIKAS	H.	EXECUTIVE
9625	10242192	10107607	FINANCE  CONTROLLING	PENDSE	KETAN	V.	VICE PRESIDENT
90285	10250937	10107607	FINANCE  CONTROLLING	MALPANI	MS.VANITA	YOGESH	GENERAL MANAGER
9775	10383827	10107607	FINANCE  CONTROLLING	CHITALE	PRADEEP	P.	GENERAL MANAGER
91115	10635523	10107607	FINANCE  CONTROLLING	ACHARYA	RAJAN	SUSHIL	SR. EXECUTIVE
90561	10435456	10107608	Risks, Internal Controls and Compliance	SHARMA	MANOJ	MAHABIRPRASAD	VICE PRESIDENT
5837	10446787	10107608	Risks, Internal Controls and Compliance	CHAVAN	MAKARAND	RAMCHANDRA	SENIOR MANAGER
90919	10559553	10107608	Risks, Internal Controls and Compliance	VAIDYA	VAIBHAV	VASANT	EXECUTIVE
90396	10393263	10107609	Pre & Post Commercial Project Management	JHA	SATYENDRA	K	GENERAL MANAGER
90459	10431226	10107609	Pre & Post Commercial Project Management	SAWANT	SUMESH	V.	MANAGER
91110	10635110	10107609	Pre & Post Commercial Project Management	DESHPANDE	ANAND	PRAMOD	SR. EXECUTIVE
90556	10435457	10107610	MANAGEMENT ASSURANCE	MALHOTRA	PANKAJ	-	VICE PRESIDENT
9986	10383787	10107610	MANAGEMENT ASSURANCE	TILVE	ASHUTOSH	S.	SENIOR GENERAL MANAGER
91158	10646199	10107610	MANAGEMENT ASSURANCE	Patel	Ms. Sheetal	\N	MANAGER
90562	10447074	10107610	MANAGEMENT ASSURANCE	VIJAN	SAGAR	-	SENIOR MANAGER
5363	10242562	10107620	Commercial Project Management	MUDBIDRI	KIRAN	DINKAR	SENIOR VICE PRESIDENT
9016	10383760	10107620	Commercial Project Management	PINGE	BIPIN	YASHWANT	SENIOR GENERAL MANAGER
9218	10383814	10107620	Commercial Project Management	DEO	UPENDRA	VINAYAK	GENERAL MANAGER
9363	10446760	10107620	Commercial Project Management	POTE	VISHNU	MADHAV	GENERAL MANAGER
90565	10446827	10107620	Commercial Project Management	CHAWADEKAR	MADHUKAR	N.	SENIOR MANAGER
9574	10447103	10107620	Commercial Project Management	SHINDE	UMESH	B.	MANAGER
9902	10447135	10107620	Commercial Project Management	KALE	DEVENDRA	S.	MANAGER
90272	10447312	10107620	Commercial Project Management	CHAUDHARI	AMOL	\N	SR. EXECUTIVE
90355	10447315	10107620	Commercial Project Management	KONNUR	SANKET	S.	SR. EXECUTIVE
90362	10447316	10107620	Commercial Project Management	AMRUTKAR	SANDESH	P.	EXECUTIVE
90369	10447318	10107620	Commercial Project Management	RISBUD	SWAPNIL	V.	EXECUTIVE
90629	10447329	10107620	Commercial Project Management	PARAB	DASHRATH	B.	SR. EXECUTIVE
91052	10623193	10107620	Commercial Project Management	SAHASRABUDHE	APURV	RAVINDRA	OFFICER
91100	10604497	10107620	Commercial Project Management	CHOUDHARY	MS.KAVITA	ROHITESH	OFFICER
91118	10605881	10107620	Commercial Project Management	JOSHI	MRS.HARSHADA	AJINKYA	OFFICER
4448	10598460	10107620	Commercial Project Management	GAIKWAD	SAMADHAN	SANTOSHRAO	M/T
5856	10422198	10107630	LEGAL	KULKARNI	MRS.SHEETAL	SUSHIL	VICE PRESIDENT
90982	10603858	10107630	LEGAL	NAVARE	MILIND	\N	SENIOR MANAGER
9924	10445604	10107630	LEGAL	PAWAR	VISHAL	V.	MANAGER
9465	10447307	10107630	LEGAL	D'CRUZ	MRS.BETTY	S.	EXECUTIVE
91082	10631665	10107631	Secretarial	VAZE	MAYURESH	P.	SENIOR MANAGER
90935	10579537	10107631	Secretarial	KULHARE	MRS.SONIKA	AMIT	OFFICER
90372	10393267	10107651	IMPORT / EXPORT  ADMINISTRATION	GAGRAT	ZUBIN	B.	VICE PRESIDENT
90789	10488431	10107652	IMPORT / EXPORT  EXECUTION	KSHETRAMADE	MS.MOHINI	--	SENIOR MANAGER
90856	10508835	10107652	IMPORT / EXPORT  EXECUTION	TAMPI	 VIVEK	V.	SENIOR MANAGER
90511	10446821	10107652	IMPORT / EXPORT  EXECUTION	SHANBHAG	NEELESH	S.	MANAGER
91138	10447322	10107652	IMPORT / EXPORT  EXECUTION	KSHIRSAGAR	MS. SAYALI	ANIL	SR. EXECUTIVE
90891	10521477	10107652	IMPORT / EXPORT  EXECUTION	GOYAL	AMAN	--	SR. EXECUTIVE
5360	10403059	10107653	Logistics	MASALAWALA	ADIL	M.	MANAGER
90979	10600488	10107653	Logistics	KASOTE	ALFRED	\N	EXECUTIVE
91038	10625589	10107653	Logistics	PATODI	AKASH	SURESH	ASSOCIATES
90859	10510359	10107702	Project Procurement Bought Out	SAROA	PREET	MOHINDER SINGH	VICE PRESIDENT
9201	10383766	10107702	Project Procurement Bought Out	KATULE	RAJENDRA	M.	SENIOR GENERAL MANAGER
90722	10481186	10107702	Project Procurement Bought Out	POTODE	NISHIKANT	M.	SENIOR GENERAL MANAGER
9535	10383782	10107702	Project Procurement Bought Out	KHEDKAR	SHASHIKANT	M	GENERAL MANAGER
9562	10383783	10107702	Project Procurement Bought Out	VERNEKAR	DEEPAK	G.	GENERAL MANAGER
5823	10383797	10107702	Project Procurement Bought Out	KULKARNI	ABHAY	M.	GENERAL MANAGER
9344	10400540	10107702	Project Procurement Bought Out	KASAR	PRASHANT	M.	GENERAL MANAGER
9646	10400542	10107702	Project Procurement Bought Out	PINGALE	MANDAR	B.	SENIOR MANAGER
9882	10400539	10107702	Project Procurement Bought Out	MAGOO	SUNIL	M.	SENIOR MANAGER
9654	10400547	10107702	Project Procurement Bought Out	RAO	NAGARAJ	S.	MANAGER
9867	10400552	10107702	Project Procurement Bought Out	PATIL	SHIVSAGAR,	R.	MANAGER
90222	10400545	10107702	Project Procurement Bought Out	BOBADE	SANTOSH	K.	MANAGER
9469	10400548	10107702	Project Procurement Bought Out	TAKALKAR	AMOL	A	MANAGER
9598	10400549	10107702	Project Procurement Bought Out	KUBER	AMIT	P.	MANAGER
9599	10400550	10107702	Project Procurement Bought Out	BHUJBAL	TUSHAR	R.	SR. EXECUTIVE
9974	10403055	10107702	Project Procurement Bought Out	PATTEKARI	SANATKUMAR	S.	SR. EXECUTIVE
90170	10403057	10107702	Project Procurement Bought Out	SHINTRE	ANUP	A.	MANAGER
90138	10403056	10107702	Project Procurement Bought Out	JACHAK	DIGVIJAY	A.	SR. EXECUTIVE
90160	10403058	10107702	Project Procurement Bought Out	SAHAY	AMIT	\N	SR. EXECUTIVE
90312	10447189	10107702	Project Procurement Bought Out	MANIKANTA	THOTA	DN	SR. EXECUTIVE
90539	10447283	10107702	Project Procurement Bought Out	KASHIDKAR	YUVRAJ	V.	EXECUTIVE
90696	10482311	10107702	Project Procurement Bought Out	PARASNIS	 ROHAN	R.	EXECUTIVE
90700	10482312	10107702	Project Procurement Bought Out	KAJI	RAKESH	C.	EXECUTIVE
90719	10482313	10107702	Project Procurement Bought Out	KULKARNI	MS. NATASHA	A.	ENGINEER
11730	10628487	10107702	Project Procurement Bought Out	BIRJE	AMEY	PRAKASH	T/E
91018	10618872	10107711	Commercial	GHIRNIKAR	ABHAY	SHRIRAM	DIRECTOR
9119	10383809	10107712	Project Procurement Raw Material	SAPKAL	NIRANJAN	M.	SENIOR GENERAL MANAGER
90075	10383834	10107712	Project Procurement Raw Material	KULKARNI	MUKUND	D.	SENIOR GENERAL MANAGER
9575	10403066	10107712	Project Procurement Raw Material	SUROSHI	KIRAN	M.	SENIOR MANAGER
9401	10403060	10107712	Project Procurement Raw Material	JAIN	SACHIN	U	MANAGER
9473	10446797	10107712	Project Procurement Raw Material	UDAPIKAR	SRINIVAS	R	SENIOR MANAGER
9546	10403072	10107712	Project Procurement Raw Material	JADHAV	Hemant	S.	MANAGER
9904	10403068	10107712	Project Procurement Raw Material	KAMBALE	ASHISH	A.	MANAGER
9337	10403067	10107712	Project Procurement Raw Material	IYER	VENKATARAMANAN	R.	MANAGER
9467	10403071	10107712	Project Procurement Raw Material	ZINJURKE	JALINDAR	E.	MANAGER
9463	10403070	10107712	Project Procurement Raw Material	TITAR	NITIN	M	MANAGER
90038	10403074	10107712	Project Procurement Raw Material	SHIROLE	KAPIL	V.	SR. EXECUTIVE
9128	10403090	10107712	Project Procurement Raw Material	KAJANIA	KANCHISINGH	RATANLAL	SR. EXECUTIVE
90475	10447273	10107712	Project Procurement Raw Material	CHOUGULE	AJIT	S.	SR. EXECUTIVE
90652	10447304	10107712	Project Procurement Raw Material	PANCHBHAI	NITIN	M.	SR. EXECUTIVE
91036	10519011	10107712	Project Procurement Raw Material	KUMBHAR	PRAVIN	VITTHAL	ENGINEER
90809	10488266	10107712	Project Procurement Raw Material	CHIKADOLI	VISHWANATH	V	EXECUTIVE
91105	10515468	10107722	Strategic Procurement	SINGH	RAJESHKUMAR	\N	SENIOR GENERAL MANAGER
91175	10655898	10107722	Strategic Procurement	BHUYAN	NEERAJ	\N	MANAGER
9851	10403073	10107732	Subcontracting	THORAT	ABHIJIT	V.	SR. EXECUTIVE
9338	10403063	10107732	Subcontracting	GORHE	SHRIRANG	D.	SENIOR MANAGER
90016	10447148	10107732	Subcontracting	CHOUGULE	ARVIND	M.	MANAGER
5553	10383702	10107742	Project Procurement Steel Fabrication	PARASNIS	RAJENDRA	S.	SENIOR GENERAL MANAGER
90460	10426437	10107742	Project Procurement Steel Fabrication	NAVAYATH	SANJAY	\N	VICE PRESIDENT
5378	10383739	10107742	Project Procurement Steel Fabrication	LELE	UMESH	P.	SENIOR GENERAL MANAGER
5936	10383756	10107742	Project Procurement Steel Fabrication	KAKADE	VIJAY	R.	GENERAL MANAGER
9418	10383822	10107742	Project Procurement Steel Fabrication	VISHWASARAO	VIJAY	G.	GENERAL MANAGER
9114	10403077	10107742	Project Procurement Steel Fabrication	HAVAL	SUNIL	S.	SENIOR MANAGER
9944	10383832	10107742	Project Procurement Steel Fabrication	BHAT	RAJESH	M.	GENERAL MANAGER
9358	10403078	10107742	Project Procurement Steel Fabrication	KALDATE	RAVINDRA	B.	SENIOR MANAGER
9957	10403084	10107742	Project Procurement Steel Fabrication	KULKARNI	ANAND	A.	MANAGER
90658	10446832	10107742	Project Procurement Steel Fabrication	RAWOOL	VIDYANAND	B.	MANAGER
9627	10403080	10107742	Project Procurement Steel Fabrication	POTE	RAHUL	S.	MANAGER
9690	10403081	10107742	Project Procurement Steel Fabrication	VIKNESH	R.	\N	MANAGER
9750	10403082	10107742	Project Procurement Steel Fabrication	KALE	VAIBHAV	H.	MANAGER
9626	10403079	10107742	Project Procurement Steel Fabrication	SANGLE	DILIP	B.	MANAGER
90080	10403099	10107742	Project Procurement Steel Fabrication	KANHERKAR	DADASAHEB	M.	MANAGER
90338	10403086	10107742	Project Procurement Steel Fabrication	PAYGUDE	VIJAY	A.	MANAGER
91155	10645170	10107742	Project Procurement Steel Fabrication	KULKARNI	AMOL	PRAKASHRAO	MANAGER
9942	10403097	10107742	Project Procurement Steel Fabrication	VAIRAT	VIKRAM	S.	SR. EXECUTIVE
90963	10488633	10107742	Project Procurement Steel Fabrication	SAYYED	MOHAMMED	M.S.	ENGINEER
9034	10446751	10107752	STORES & DESPATCH STORES	KINI	ARUN	J.	MANAGER
91102	10634127	10107752	STORES & DESPATCH STORES	GANGAWANE	KEVAL	SUDARSHAN	EXECUTIVE
5492	10447305	10107752	STORES & DESPATCH STORES	KAKNANI	SURESH	HIRANAND	OFFICER
5803	10445710	10107752	STORES & DESPATCH STORES	SAPKAL	SACHIN	T.	OFFICER
9196	10383813	10107753	STORES & DESPATCH FINISHED GOOD	JOSHI	ANIL	D.	MANAGER
9392	10447097	10107753	STORES & DESPATCH FINISHED GOOD	LONDHE	SACHIN	A.	SR. EXECUTIVE
9140	10445714	10107754	STORES & DESPATCH TOOLS STORE	PATIL	YESHWANT	R.	SR. EXECUTIVE
2013	10488293	10107754	STORES & DESPATCH TOOLS STORE	DHAMANE	MAHADEV	M.	WELDER
5645	10242556	10107801	Construction Services -  Administration	HARIHARA	BHOGISHETTY	RAJENDRAPRASAD	HEAD - CONSTRUCTION 
9616	10403095	10107801	Construction Services -  Administration	CHAVAN	NITIN	V.	SENIOR MANAGER
90521	10447326	10107801	Construction Services -  Administration	BHOSALE	GOPAL	R.	SR. EXECUTIVE
90916	10488564	10107801	Construction Services -  Administration	PAWASKAR	SOHAM	DIWAKAR	OFFICER
60082	10500205	10107801	Construction Services -  Administration	CHENNUR	 SHRINIVAS	S.	OFFICE ASSISTANT
15528	10383843	10107804	Construction Services - MHE Division	MENON	PRASAD	P.	BUSINESS ADVISOR
5570	10383744	10107804	Construction Services - MHE Division	UDAPIKAR	RAJGOPAL	RAMCHANDRA	GENERAL MANAGER
9025	10383806	10107804	Construction Services - MHE Division	AJEES	THAJUDHEEN	K.S.	GENERAL MANAGER
9892	10383785	10107804	Construction Services - MHE Division	ARBATTI	SUNIL	B.	GENERAL MANAGER
90157	10446812	10107804	Construction Services - MHE Division	KAVATHEKAR	SANJAY	A.	SENIOR MANAGER
90528	10446822	10107804	Construction Services - MHE Division	KANNAN	R.	-	SENIOR MANAGER
90548	10446825	10107804	Construction Services - MHE Division	RAMALINGAM	SRIDHAR	-	SENIOR MANAGER
90730	10482317	10107804	Construction Services - MHE Division	SAHA	 AJOY	\N	SENIOR MANAGER
9542	10446865	10107804	Construction Services - MHE Division	RAHEEM	IELEYAS	\N	MANAGER
9554	10446866	10107804	Construction Services - MHE Division	GAIKWAD	Abhaysinh	S.	MANAGER
9777	10446895	10107804	Construction Services - MHE Division	UDAGAVE	ANUP	A.	MANAGER
90017	10447149	10107804	Construction Services - MHE Division	DONGRE	GANESH	V.	SR. EXECUTIVE
90206	10446360	10107804	Construction Services - MHE Division	SINGH	ARVIND	K.	MANAGER
9909	10447309	10107804	Construction Services - MHE Division	SAHAY	ADARSH	\N	EXECUTIVE
90166	10446370	10107804	Construction Services - MHE Division	KUMBHAR	SACHIN	G.	SR. EXECUTIVE
90322	10447250	10107804	Construction Services - MHE Division	RAGUNATH	R.	\N	SR. EXECUTIVE
90417	10447324	10107804	Construction Services - MHE Division	PRASAD	KANAGALA	\N	EXECUTIVE
90483	10446388	10107804	Construction Services - MHE Division	KUMAR	SANJEEV	N.	SR. EXECUTIVE
90309	10445659	10107804	Construction Services - MHE Division	KUMAR	TARUN	\N	EXECUTIVE
90482	10446387	10107804	Construction Services - MHE Division	KUMAR	RADHESHYAM	K.	EXECUTIVE
90531	10447282	10107804	Construction Services - MHE Division	MUKHERJEE	KAUSTAV	--	EXECUTIVE
90739	10446492	10107804	Construction Services - MHE Division	SINGH	 SOMNATH	R.	EXECUTIVE
9307	10446438	10107804	Construction Services - MHE Division	MALKOTI	BHARATRAM	MANIRAM	PEON
60193	10619309	10107804	Construction Services - MHE Division	SWAIN	KRUSHNA CHANDRA	BIPRA CHARAN	LEAD SAFETY ENGINEER
60083	10500207	10107804	Construction Services - MHE Division	BAJPAIEE	NAYAN	\N	TECH SUPERVISOR
60111	10500159	10107804	Construction Services - MHE Division	VERMA	 RAHUL	KUMAR	TECH SUPERVISOR
60112	10500157	10107804	Construction Services - MHE Division	ROY	SIDDHARTHA	S.	TECH SUPERVISOR
60216	10482291	10107804	Construction Services - MHE Division	KHOT	AMOL	SHRIKANT	TECH SUPERVISOR
60217	10619329	10107804	Construction Services - MHE Division	BIRANJE	AKASH	TUKARAM	TECH SUPERVISOR
60061	10618585	10107804	Construction Services - MHE Division	KUMAR	SUMANT	--	ACCOUNTANT
60063	10618879	10107804	Construction Services - MHE Division	ZAMAN	NISHAT	--	LEAD SAFETY ENGINEER
60292	10627195	10107804	Construction Services - MHE Division	PANDA	TIRTHARAJ	\N	LEAD
60322	10630023	10107804	Construction Services - MHE Division	RAKSHIT	DULAL	\N	TECH SUPERVISOR
60329	10630758	10107804	Construction Services - MHE Division	PRASAD	PRAMATMA	\N	TECH SUPERVISOR
60381	10645007	10107804	Construction Services - MHE Division	PARMAR	RUCHANG	BHARATBHAI	LEAD
60410	10657489	10107804	Construction Services - MHE Division	SARAVANAN	E.	\N	TECH SUPERVISOR
60404	10653895	10107804	Construction Services - MHE Division	PAWAR	BHALCHANDRA	RAMCHANDRA	TECH EXPERT
9090	10383763	10107805	Construction Services  - Energy Division 	REDDY PATIL	Hanumanth	\N	SENIOR GENERAL MANAGER
9563	10383824	10107805	Construction Services  - Energy Division 	SINGH	Nandukishore	B.	SENIOR MANAGER
90128	10383859	10107805	Construction Services  - Energy Division 	SOMALANKA	RAMAKRISHNA	NAGESWARARAO	SENIOR MANAGER
90495	10446772	10107805	Construction Services  - Energy Division 	RAJU	BELLARY	V.K.	SENIOR MANAGER
90013	10446917	10107805	Construction Services  - Energy Division 	BHUSHAN	SURYA	\N	MANAGER
9410	10488668	10107805	Construction Services  - Energy Division 	TANPURE	DADASAHEB	U.	MANAGER
90233	10446815	10107805	Construction Services  - Energy Division 	PATIL	VIJAY	N.	MANAGER
91112	10635196	10107805	Construction Services  - Energy Division 	KAMALAKANNAN	K	\N	MANAGER
90015	10447147	10107805	Construction Services  - Energy Division 	NAGANE	SANTOSH	M.	MANAGER
90020	10447222	10107805	Construction Services  - Energy Division 	MHASKE	VINAY	T.	MANAGER
91167	10648958	10107805	Construction Services  - Energy Division 	REDDY	VISWANATA	\N	MANAGER
90383	10446378	10107805	Construction Services  - Energy Division 	SINGH	SANTOSH	KUMAR	SR. EXECUTIVE
90478	10446386	10107805	Construction Services  - Energy Division 	POAL	SANTOSH	C.	SR. EXECUTIVE
90385	10446379	10107805	Construction Services  - Energy Division 	CHAKKINGAL	SUMESH	V.	SR. EXECUTIVE
90390	10447268	10107805	Construction Services  - Energy Division 	DODDA	HEMANTH	KUMAR	SR. EXECUTIVE
90738	10446467	10107805	Construction Services  - Energy Division 	KADAM	 PANDURANG	R.	SR. EXECUTIVE
90330	10446375	10107805	Construction Services  - Energy Division 	MUKANE	VIDYADHAR	L.	EXECUTIVE
90598	10447289	10107805	Construction Services  - Energy Division 	KRISHNAN	PRASANTH	R.	EXECUTIVE
90740	10446490	10107805	Construction Services  - Energy Division 	RAJA	 C.	EDVEL	EXECUTIVE
60226	10619338	10107805	Construction Services  - Energy Division 	NARTAM	JITENDRA	PANDURANG	TECH SUPERVISOR
60097	10446491	10107805	Construction Services  - Energy Division 	RAI	 ALENDRA	KUMAR	TECHNICAL ASSISTANT
60262	10623727	10107805	Construction Services  - Energy Division 	NAKADE	SANJAY	JANARDAN	LEAD SAFETY ENGINEER
60264	10623724	10107805	Construction Services  - Energy Division 	JAGANNATH	ALOK	--	LEAD SAFETY ENGINEER
60275	10626120	10107805	Construction Services  - Energy Division 	KUMAR	DEVENDRA	\N	LEAD
60328	10630850	10107805	Construction Services  - Energy Division 	BHAL	RANJEETKUMAR	\N	TECH SUPERVISOR
60218	10619330	10107805	Construction Services  - Energy Division 	CHUNDAWAT	DIGVIJAY	 SINGH	LEAD SAFETY ENGINEER
60303	10627399	10107805	Construction Services  - Energy Division 	SHARMA	AMIT	\N	LEAD
60345	10634131	10107805	Construction Services  - Energy Division 	RANA	DASHRATHA	\N	LEAD
60341	10481192	10107805	Construction Services  - Energy Division 	AWASTHI	SUNILKUMAR	K.	TECH EXPERT
60319	10628918	10107805	Construction Services  - Energy Division 	ACHARYA	SUNIL	KUMAR	TECH SUPERVISOR
60360	10640281	10107805	Construction Services  - Energy Division 	SARKAR	CHANCHAL	\N	TECH EXPERT
60366	10642236	10107805	Construction Services  - Energy Division 	SINGH	BHUPENDRA	KUMAR	LEAD
60367	10642581	10107805	Construction Services  - Energy Division 	CHOUDHARY	SURAJKUNAL	\N	TECH SUPERVISOR
60371	10643322	10107805	Construction Services  - Energy Division 	VANKAR	PRAVINBHAI	\N	LEAD
60385	10500204	10107805	Construction Services  - Energy Division 	Senapati	Swarup	\N	TECH SUPERVISOR
60215	10619328	10107805	Construction Services  - Energy Division 	GUPTA	RAKESH	KUMAR	LEAD SAFETY ENGINEER
60409	10657228	10107805	Construction Services  - Energy Division 	LANKAYAGARI	SURESH BABU	\N	LEAD
11704	10619627	10107805	Construction Services  - Energy Division 	SINGH	ABHISHEK	RAKESH	T/E
11699	10617414	10107805	Construction Services  - Energy Division 	SUBIN	V.	--	T/E
11750	10633131	10107805	Construction Services  - Energy Division 	REDDY	DEEPAK	\N	T/E
11751	10633130	10107805	Construction Services  - Energy Division 	KATWAL	PAREEKSHIT	ROOP LAL	T/E
90940	10587747	10107851	Service Management 	DESHMUKH	RAHUL	RATNAKAR	DIRECTOR
90451	10431195	10107861	Asset Management  	HANDA	RAJEEV	\N	SENIOR GENERAL MANAGER
90435	10422197	10107862	Asset Management  Selling	BARTHWAL	ASHISH	\N	GENERAL MANAGER
9890	10447132	10107862	Asset Management  Selling	SHINDE	SANDEEP	R.	SENIOR MANAGER
91160	10647197	10107862	Asset Management  Selling	MHAISKAR	ROHIT	GAUTAM	MANAGER
90867	10516013	10107862	Asset Management  Selling	VERMA	AMITESH	\N	MANAGER
91061	10625222	10107864	Asset Management  Order Management	RAHIM	MOHAMMAD	ABDUL	GENERAL MANAGER
90756	10482328	10107864	Asset Management  Order Management	NIGAM	 RAHUL	KUMAR	SENIOR MANAGER
90767	10482329	10107864	Asset Management  Order Management	RAI	SANJAY	KUMAR	SENIOR MANAGER
90937	10582639	10107864	Asset Management  Order Management	KUMAR	 PRAVEEN	--	SENIOR MANAGER
90493	10446771	10107864	Asset Management  Order Management	KHAN	MOHAMMAD	ELIAS	SENIOR MANAGER
90577	10442306	10107864	Asset Management  Order Management	HADAPAD	VENKATESH	G.	SENIOR MANAGER
90715	10482331	10107864	Asset Management  Order Management	KESHARI	 PRAVIN	KUMAR	SENIOR MANAGER
9275	10446758	10107864	Asset Management  Order Management	PRADEEP	T.	V.	SENIOR MANAGER
91011	10618253	10107864	Asset Management  Order Management 	SUTAR	TANAJI	BALKRISHNA	SENIOR MANAGER
91059	10482327	10107864	Asset Management  Order Management 	SINHA	DIGAMBER	NATH	GENERAL MANAGER
9130	10446788	10107864	Asset Management  Order Management 	SINGH	VINOD	K.	SENIOR MANAGER
91111	10635111	10107864	Asset Management  Order Management 	THAKRE	NARESH	NAMDEO	SENIOR MANAGER
90165	10488574	10107864	Asset Management  Order Management 	RAJEESH	R.	\N	SENIOR MANAGER
91058	10624049	10107864	Asset Management  Order Management 	SANTI	SANJAYA	KUAMR	MANAGER
91062	10625112	10107864	Asset Management  Order Management 	DHALL	AMARESH	--	MANAGER
90923	10566001	10107864	Asset Management  Order Management 	JADHAV	KAILASH	SHIVAJI	SENIOR MANAGER
90934	10579186	10107864	Asset Management  Order Management 	SINGH	MANISH 	KUMAR	SENIOR MANAGER
9360	10431196	10107864	Asset Management  Order Management 	GALAGALI	VAMAN	PARIMALACHARYA	SENIOR MANAGER
90514	10447200	10107864	Asset Management  Order Management 	ARANKE	SUBODH	S.	MANAGER
90535	10446823	10107864	Asset Management  Order Management 	THAKUR	NARESH	--	MANAGER
90605	10442322	10107864	Asset Management  Order Management 	JEYAKUMAR	EUSTACE	 V.	MANAGER
90726	10482335	10107864	Asset Management  Order Management 	JADHAV	 PRAMOD	S.	MANAGER
90930	10572662	10107864	Asset Management  Order Management 	DAVE	VINIT	CHHELSHANKAR	MANAGER
90152	10447170	10107864	Asset Management  Order Management 	ZAMBRE	SUDHAKAR	P.	MANAGER
90413	10446363	10107864	Asset Management  Order Management 	SARAVANAN	C.	\N	MANAGER
90559	10447073	10107864	Asset Management  Order Management 	KADAM	SATISH	V.	MANAGER
90702	10482334	10107864	Asset Management  Order Management 	KARTHIKEYAN	 V.	K.	MANAGER
90848	10500983	10107864	Asset Management  Order Management 	BEIK	 ADHAM	\N	MANAGER
90929	10570882	10107864	Asset Management  Order Management 	ARAVIDAN	 ANILKUMAR	--	MANAGER
91047	10621355	10107864	Asset Management  Order Management 	MAAN	NARESH	KUMAR	MANAGER
91049	10622693	10107864	Asset Management  Order Management 	PATIL	ULHAS	VASUDEO	MANAGER
90734	10482336	10107864	Asset Management  Order Management 	GOVINDASAMY	BASKAR	--	MANAGER
90735	10482337	10107864	Asset Management  Order Management 	CHINNADURAI	T	--	SR. EXECUTIVE
90835	10488567	10107864	Asset Management  Order Management 	PRAJAPATI	RAVIKUMAR	J.	MANAGER
90416	10446382	10107864	Asset Management  Order Management 	VENKATAKRISHNAN	P.	\N	SR. EXECUTIVE
90671	10446465	10107864	Asset Management  Order Management 	KIRUBAKARAN	K.	\N	SR. EXECUTIVE
90939	10584316	10107864	Asset Management  Order Management 	CHOUDHARY	RAVI	CHANDER	SR. EXECUTIVE
90971	10500223	10107864	Asset Management  Order Management 	MONDAL	 TARIT	--	MANAGER
90889	10520088	10107864	Asset Management  Order Management 	TIWARI	MAYANK	--	SR. EXECUTIVE
90836	10488218	10107864	Asset Management  Order Management 	ANANTH	V	R	SR. EXECUTIVE
90837	10488438	10107864	Asset Management  Order Management 	KUMAR	 SANDEEP	\N	SR. EXECUTIVE
91042	10620175	10107864	Asset Management  Order Management 	RAJU	KACHERLAGADDA	--	SR. EXECUTIVE
91048	10622456	10107864	Asset Management  Order Management 	INGALE	YOGESH	UTTAMRAO	SR. EXECUTIVE
91054	10623613	10107864	Asset Management  Order Management 	RAHANGDALE	VIJAY	--	SR. EXECUTIVE
91067	10627592	10107864	Asset Management  Order Management 	SINGH	SUNIL	KUMAR	SR. EXECUTIVE
90142	10447225	10107864	Asset Management  Order Management 	GOSAVI	ONKAR	M.	SR. EXECUTIVE
90337	10447254	10107864	Asset Management  Order Management 	CHAVAN	SWAPNIL	S.	EXECUTIVE
90414	10446380	10107864	Asset Management  Order Management 	SARAVAN KUMAR	R.	A.	SR. EXECUTIVE
90415	10446381	10107864	Asset Management  Order Management 	MURALIDHARAN	P.	\N	EXECUTIVE
90418	10446383	10107864	Asset Management  Order Management 	MURUGAN	V.	\N	EXECUTIVE
90684	10482340	10107864	Asset Management  Order Management 	SOOD	ROHAN	\N	EXECUTIVE
90705	10482341	10107864	Asset Management  Order Management 	NAUSHADH	 M.	\N	EXECUTIVE
90804	10488504	10107864	Asset Management  Order Management 	BALAMURUGAN	R	M.	SR. EXECUTIVE
90805	10488232	10107864	Asset Management  Order Management 	BEHARA	SANJAY	KUMAR	SR. EXECUTIVE
90806	10488517	10107864	Asset Management  Order Management 	NAYAK	ASHISH	KUMAR	EXECUTIVE
90870	10517502	10107864	Asset Management  Order Management 	DAHULE	NANDKISHOR	BHIVSAN	EXECUTIVE
90901	10542178	10107864	Asset Management  Order Management 	PANDEY	SHYAMJEE	KRISHNA KUMAR	EXECUTIVE
90920	10562785	10107864	Asset Management  Order Management 	VERMA	RAJAN	\N	EXECUTIVE
90968	10446472	10107864	Asset Management  Order Management 	KUMAR	PRAKASH	--	EXECUTIVE
90969	10500189	10107864	Asset Management  Order Management 	JETHWA	YASHPALSINH	DILIPSINH	SR. EXECUTIVE
90981	10603798	10107864	Asset Management  Order Management 	BHOLA	BIBEK	\N	EXECUTIVE
91060	10624449	10107864	Asset Management  Order Management 	MALAPURA	BASAPPA	--	EXECUTIVE
91063	10625224	10107864	Asset Management  Order Management 	SINGH	SANTOSH	KUMAR	EXECUTIVE
90970	10500209	10107864	Asset Management  Order Management 	PILLAI	JYOTHISH	NANDKUMAR	EXECUTIVE
90354	10447259	10107864	Asset Management  Order Management 	MOHITE	SHREYAS	V.	ENGINEER
90770	10488582	10107864	Asset Management  Order Management 	RANE	SAURABH	M	EXECUTIVE
60159	10619275	10107864	Asset Management  Order Management 	GHAG	GANGADHAR	--	CONSULTANT
60163	10619279	10107864	Asset Management  Order Management 	SALKE	VINAYAK	MACCHINDRA	EHS -CO ORDINATOR
60180	10619296	10107864	Asset Management  Order Management 	PRAJAPATI	DAL SINGAR	RAMAYAN	EHS -CO ORDINATOR
60181	10619297	10107864	Asset Management  Order Management 	GHOSH	 AKHIL	\N	EHS -CO ORDINATOR
60092	10500247	10107864	Asset Management  Order Management 	TRIPATHI	SHRAVAN	J.	HSE CORDINATOR
60144	10619260	10107864	Asset Management  Order Management 	ARUN KUMAR	T.	--	HSE CORDINATOR
60177	10619293	10107864	Asset Management  Order Management 	SINGH	AJAYKUMAR	K.	LEAD SAFETY ENGINEER
60078	10446450	10107864	Asset Management  Order Management 	KADARBATCHA	SAFFIULLAH	\N	OFFICE ASSISTANT
60164	10619280	10107864	Asset Management  Order Management 	SINHA	HARSHVARDHAN	ASHOK	OFFICE ASSISTANT
60079	10500186	10107864	Asset Management  Order Management 	VENKATARAMANI	RAJAMANI	\N	TECH EXPERT
60067	10500143	10107864	Asset Management  Order Management 	SUKUMAR	M.	\N	TECH SUPERVISOR
60068	10500160	10107864	Asset Management  Order Management 	CHAUHAN	ALPESH	N.	TECH SUPERVISOR
60069	10500161	10107864	Asset Management  Order Management 	SINGH	 ANUPAM	KUMAR	TECH SUPERVISOR
60070	10500163	10107864	Asset Management  Order Management 	NIMSARKAR	 TOPESH	A.	TECH SUPERVISOR
60071	10500167	10107864	Asset Management  Order Management 	BEHERA	 KISHORE	KUMAR	TECH SUPERVISOR
60072	10500168	10107864	Asset Management  Order Management 	SIVANANTHAN	 D.	-	TECH SUPERVISOR
60073	10500170	10107864	Asset Management  Order Management 	PRABAKARAN	 P.	-	TECH SUPERVISOR
60074	10500172	10107864	Asset Management  Order Management 	SETHURAMAN,	KATHIK	-	TECH SUPERVISOR
60075	10500174	10107864	Asset Management  Order Management 	CHAUHAN	 MAHIPATSINH	-	TECH SUPERVISOR
60084	10500219	10107864	Asset Management  Order Management 	SUNDARESAN	SURESH	--	TECH SUPERVISOR
60085	10500232	10107864	Asset Management  Order Management 	RASHEED	MOHAMED	N.	TECH SUPERVISOR
60086	10500235	10107864	Asset Management  Order Management 	SURYAWANSHI	KIRAN	S.	TECH SUPERVISOR
60087	10500237	10107864	Asset Management  Order Management 	SINGH	POSHENDRA	R.	TECH SUPERVISOR
60089	10500243	10107864	Asset Management  Order Management 	PANDEY	AMIT	KUMAR	TECH SUPERVISOR
60091	10500246	10107864	Asset Management  Order Management 	SATHVARA	JAYDIP	J.	TECH SUPERVISOR
60095	10446488	10107864	Asset Management  Order Management 	RAHUL	S.	\N	TECH SUPERVISOR
60096	10446489	10107864	Asset Management  Order Management 	RAMARAJ	KRISHNAN	\N	TECH SUPERVISOR
60099	10500252	10107864	Asset Management  Order Management 	THAMPI	PREMKUMAR	A.	TECH SUPERVISOR
60104	10500260	10107864	Asset Management  Order Management 	VICTORSALOMAN	 A.	\N	TECH SUPERVISOR
60105	10500263	10107864	Asset Management  Order Management 	RATHOD	HARSH	\N	TECH SUPERVISOR
60106	10500264	10107864	Asset Management  Order Management 	SINGH	RAJU	KUMAR	TECH SUPERVISOR
60107	10500272	10107864	Asset Management  Order Management 	KAR	 SIRSHENDU	\N	TECH SUPERVISOR
60108	10500981	10107864	Asset Management  Order Management 	SONI	RAHUL	KUMAR	TECH SUPERVISOR
60114	10503899	10107864	Asset Management  Order Management 	PATEL	BHAVESHKUMAR	MUKESHBHAI	TECH SUPERVISOR
60116	10514743	10107864	Asset Management  Order Management 	DANGI	UMED	SINGH	TECH SUPERVISOR
60118	10513002	10107864	Asset Management  Order Management 	ANAND	VIKASH	\N	TECH SUPERVISOR
60119	10513072	10107864	Asset Management  Order Management 	PARIHAR	VIKAS	SINGH	TECH SUPERVISOR
60120	10513074	10107864	Asset Management  Order Management 	SINGH	MAHASHAKTI	DIGVIJAY	TECH SUPERVISOR
60121	10514758	10107864	Asset Management  Order Management 	KHAN	MOHD	AMIR	TECH SUPERVISOR
60123	10514710	10107864	Asset Management  Order Management 	KUMAR	SUMIT	--	TECH SUPERVISOR
60124	10514756	10107864	Asset Management  Order Management 	KAUSHIK	RATNESH	--	TECH SUPERVISOR
60125	10514718	10107864	Asset Management  Order Management 	DOSI	SOURABH	--	TECH SUPERVISOR
60126	10518881	10107864	Asset Management  Order Management 	SAHU	BASWAJIT	--	TECH SUPERVISOR
60128	10517318	10107864	Asset Management  Order Management 	CHANDRA	SHAILENDRA	KUMAR	TECH SUPERVISOR
60129	10517321	10107864	Asset Management  Order Management 	THANGATHIRUMARAN	VIRUTHAGIRI	--	TECH SUPERVISOR
60130	10521478	10107864	Asset Management  Order Management 	PANDEY	YOGENDRA	--	TECH SUPERVISOR
60133	10525105	10107864	Asset Management  Order Management 	KUMAR	ADARSH	--	TECH SUPERVISOR
60137	10526002	10107864	Asset Management  Order Management 	KUNIYIL	BIBIN	--	TECH SUPERVISOR
60138	10540150	10107864	Asset Management  Order Management 	DESAI	 TAPANKUMAR	JATINBHAI	TECH SUPERVISOR
60141	10541528	10107864	Asset Management  Order Management 	SHARMA	ANUJ	PREMSHANKAR	TECH SUPERVISOR
60142	10548987	10107864	Asset Management  Order Management 	TIWARI	 MANISH	--	TECH SUPERVISOR
60143	10619259	10107864	Asset Management  Order Management 	KUMAR	 KUNDAN	--	TECH SUPERVISOR
60146	10619262	10107864	Asset Management  Order Management 	KUMAR	DEEPAK	--	TECH SUPERVISOR
60152	10619268	10107864	Asset Management  Order Management 	KUMAR	ARVIND	--	TECH SUPERVISOR
60154	10619270	10107864	Asset Management  Order Management 	SREENIVASA KURUP	SREERAJ MV	\N	TECH SUPERVISOR
60155	10619271	10107864	Asset Management  Order Management 	KUMAR	SANALLAL	SATEESH	TECH SUPERVISOR
60158	10619274	10107864	Asset Management  Order Management 	AHMAD	ISHTIYAQUE	--	TECH SUPERVISOR
60160	10619276	10107864	Asset Management  Order Management 	YADAV	AMIT	--	TECH SUPERVISOR
60161	10619277	10107864	Asset Management  Order Management 	MISHRA	AMIT	KUMAR	TECH SUPERVISOR
60162	10619278	10107864	Asset Management  Order Management 	SINGH	PALENDRA	JEETAN	TECH SUPERVISOR
60165	10619281	10107864	Asset Management  Order Management 	PARMAR	HANSRAJ	MOHAN LAL	TECH SUPERVISOR
60166	10619282	10107864	Asset Management  Order Management 	SINGH	MANISH	SHIV PRATAP	TECH SUPERVISOR
60167	10619283	10107864	Asset Management  Order Management 	KUMAR	PAWAN	BHOOR CHAND	TECH SUPERVISOR
60170	10619286	10107864	Asset Management  Order Management 	KUMAR	SUDHIR	BABUDHAN SINGH	TECH SUPERVISOR
60172	10619288	10107864	Asset Management  Order Management 	RATHORE	RAVINDRA SINGH	GIRDHAR	TECH SUPERVISOR
60173	10619289	10107864	Asset Management  Order Management 	JANGID	TOYAJ	RATAN LAL	TECH SUPERVISOR
60174	10619290	10107864	Asset Management  Order Management 	PRAJAPAT	DEEPAK	BANSHIDHAR	TECH SUPERVISOR
60175	10619291	10107864	Asset Management  Order Management 	ALAM	DASTAGIR	MUSTKIM	TECH SUPERVISOR
60176	10619292	10107864	Asset Management  Order Management 	KUMAR	DHARMENDRA	PADAMARAM	TECH SUPERVISOR
60178	10619294	10107864	Asset Management  Order Management 	KARUNA	JAYAPALAN	J.	TECH SUPERVISOR
60179	10619295	10107864	Asset Management  Order Management 	PRAJAPATI	SHIV	KARAN	TECH SUPERVISOR
60188	10619304	10107864	Asset Management  Order Management 	BHARGAVE	VIRENDRA KUMAR	LADDU LAL	TECH SUPERVISOR
60189	10619305	10107864	Asset Management  Order Management 	PANDEY	MAHESH KUMAR	BRIJ	TECH SUPERVISOR
60190	10619306	10107864	Asset Management  Order Management 	CHOUHAN	LOKENDRA SINGH	S.	TECH SUPERVISOR
60192	10619308	10107864	Asset Management  Order Management 	LADVA	BHAVIN	AMRUTLAL	TECH SUPERVISOR
60103	10500259	10107864	Asset Management  Order Management 	MALAIYARASAN	 K.	\N	TECHNICAL ASSISTANT
60232	10500152	10107864	Asset Management  Order Management 	JADHAV	DHARMADAS	-	TECH SUPERVISOR
11708	10622352	10107864	Asset Management  Order Management 	SANKPAL	AKSHAYKUMAR	KRISHNAT	T/E
11711	10627207	10107864	Asset Management  Order Management 	DESAI	RIKEN	\N	T/E
11720	10627197	10107864	Asset Management  Order Management 	REDDY	MITHILESHH	\N	T/E
11737	10628775	10107864	Asset Management  Order Management 	BONDRE	NITISH	VIVEK	T/E
60194	10619310	10107864	Asset Management  Order Management 	KHAN	MUJEEB	--	TECH SUPERVISOR
60197	10619312	10107864	Asset Management  Order Management 	SINGH	MRITUNJAY	--	TECH SUPERVISOR
60199	10619314	10107864	Asset Management  Order Management 	MANSURI	ASIF	--	TECH SUPERVISOR
60198	10619313	10107864	Asset Management  Order Management 	SURESH KUMAR	--	SASI KUMAR	TECH SUPERVISOR
60195	10619311	10107864	Asset Management  Order Management 	KUMAR	DHARMPAL	--	TECH SUPERVISOR
60201	10619315	10107864	Asset Management  Order Management 	KANNAN	 A.	--	TECH SUPERVISOR
60202	10619316	10107864	Asset Management  Order Management 	RAO	SIDDHARTH	--	TECH SUPERVISOR
90695	10482330	10107882	Field Services Selling	KUWAR	 LAKHAN	C.	MANAGER
60204	10619318	10107864	Asset Management  Order Management 	GHOSH	ANANDA	\N	TECH SUPERVISOR
60205	10619319	10107864	Asset Management  Order Management 	BHATT	HIMANSHU	YASHVANTRAY	SAFETY OFFICER
60206	10619320	10107864	Asset Management  Order Management 	SINGH	RUPESH	KUMAR	TECH SUPERVISOR
60207	10619321	10107864	Asset Management  Order Management 	YADAV	KAMALESH	RAMAJEE	EHS -CO ORDINATOR
60208	10619322	10107864	Asset Management  Order Management 	VERMA	ASHUTOSH	RADHEY SHYAM	TECH SUPERVISOR
60209	10619323	10107864	Asset Management  Order Management 	TRIPATHI	VEERENDRA	KUMAR	TECH SUPERVISOR
60211	10619324	10107864	Asset Management  Order Management 	THENNARASU	 MUHILAN	\N	TECH SUPERVISOR
60212	10619325	10107864	Asset Management  Order Management 	SHARMA	NAVIN	KUMAR	TECH SUPERVISOR
60213	10619326	10107864	Asset Management  Order Management 	MURUGAN	MARIAPPAN	\N	EHS -CO ORDINATOR
60214	10619327	10107864	Asset Management  Order Management 	RAI	MANJESH	KUMAR	TECH SUPERVISOR
60219	10619331	10107864	Asset Management  Order Management 	SODHA	VIJAY	R.	EHS -CO ORDINATOR
60220	10619332	10107864	Asset Management  Order Management 	RAO	NARENDRA	SINGH	TECH SUPERVISOR
60222	10619334	10107864	Asset Management  Order Management 	GANTA	VINAY	KUMAR	TECH SUPERVISOR
60223	10619335	10107864	Asset Management  Order Management 	BHARGAV	LAXMINARAYAN	--	TECH SUPERVISOR
60224	10619336	10107864	Asset Management  Order Management 	NALLAPERUMAL	P.	--	HSE CORDINATOR
60225	10619337	10107864	Asset Management  Order Management 	GAUTAM	DEEPAK	KUMAR	TECH SUPERVISOR
60227	10619339	10107864	Asset Management  Order Management 	VERMA	AMAN	--	TECH SUPERVISOR
60228	10619340	10107864	Asset Management  Order Management 	KASHYAP	KOMAL	PRASAD	TECH SUPERVISOR
60001	10500156	10107864	Asset Management  Order Management 	MIDDYA	RAFIQUL	 -	TECH SUPERVISOR
60002	10500169	10107864	Asset Management  Order Management 	BANDYOPADHYAY	DEBRAJ	 -	TECH SUPERVISOR
60003	10500188	10107864	Asset Management  Order Management 	MANI	SUDHAKAR	 S.	TECH SUPERVISOR
60004	10500210	10107864	Asset Management  Order Management 	ROUT	SRIKANT	 KUMAR	TECH SUPERVISOR
60005	10500240	10107864	Asset Management  Order Management 	SAHU	DIPANKAR	 P	TECH SUPERVISOR
60006	10500267	10107864	Asset Management  Order Management 	MAJI	 SANJAY	0	TECH SUPERVISOR
60007	10500268	10107864	Asset Management  Order Management 	DASGUPTA	 KOUSHIK	0	TECH SUPERVISOR
60008	10500271	10107864	Asset Management  Order Management 	MAHANA	 BIKASH	 KUMAR	TECH SUPERVISOR
60009	10614161	10107864	Asset Management  Order Management 	TAUHEED	AKHTAR	MD	TECH SUPERVISOR
60010	10614162	10107864	Asset Management  Order Management 	GHOSH	AUROBHIL	KUNAL	TECH SUPERVISOR
60011	10614163	10107864	Asset Management  Order Management 	RASHID	MD.NOUSHAD	ABDUL	TECH SUPERVISOR
60012	10500233	10107864	Asset Management  Order Management 	DASH	MRUTYUNJAY	RABINDRA	LEAD SAFETY ENGINEER
60013	10614164	10107864	Asset Management  Order Management 	VENKATESH	MRS.SOUMYA	--	TECH SUPERVISOR
60014	10614165	10107864	Asset Management  Order Management 	THAKUR	SOURABH KUMAR	--	TECH SUPERVISOR
60015	10614166	10107864	Asset Management  Order Management 	SANTHANAM	S.	--	TECH SUPERVISOR
60016	10614167	10107864	Asset Management  Order Management 	PANDEY	DHARAMVEER	P.	TECH SUPERVISOR
60017	10614168	10107864	Asset Management  Order Management 	TRIPATHY	SUDHIR	KUMAR	OFFICE ASSISTANT
60018	10614169	10107864	Asset Management  Order Management 	JHA	RIDDHI	 NATH	TECH SUPERVISOR
60019	10614170	10107864	Asset Management  Order Management 	SINGH	PRATEEK	--	TECH SUPERVISOR
60021	10614172	10107864	Asset Management  Order Management 	SEAL	SURAJIT	NARESH CHANDRA	TECH SUPERVISOR
60022	10614173	10107864	Asset Management  Order Management 	SINGH	KRUSHNA	CHANDRA	TECH SUPERVISOR
60023	10614174	10107864	Asset Management  Order Management 	SHOBHIT	SHYAM	--	TECH SUPERVISOR
60027	10614178	10107864	Asset Management  Order Management 	NAIK	SURAJ	KIRAN	TECH SUPERVISOR
60028	10614179	10107864	Asset Management  Order Management 	ROUT	SATCHIDANANDA	BIRABAR	EHS -CO ORDINATOR
60029	10614180	10107864	Asset Management  Order Management 	SAHU	SUJIT	KUMAR	TECH SUPERVISOR
60030	10614408	10107864	Asset Management  Order Management 	SAHU	GHANSHYAM	--	TECH SUPERVISOR
60031	10614181	10107864	Asset Management  Order Management 	TIWARI	BIMLESH	NATHUNI	TECH SUPERVISOR
60032	10614182	10107864	Asset Management  Order Management 	PATTNAIK	SUBRAT	--	TECH SUPERVISOR
60033	10614183	10107864	Asset Management  Order Management 	PATEL	SUKUMAR	--	TECH SUPERVISOR
60034	10614184	10107864	Asset Management  Order Management 	NAIK	PRITAM	KUMMAR	TECH SUPERVISOR
60035	10614185	10107864	Asset Management  Order Management 	LENKA	NIRMAL	KUMAR	TECH SUPERVISOR
60036	10614186	10107864	Asset Management  Order Management 	NAZIR	 MD.	--	TECH SUPERVISOR
60037	10614187	10107864	Asset Management  Order Management 	GOUDA	DASARATHI	--	TECH SUPERVISOR
60040	10614190	10107864	Asset Management  Order Management 	KUMAR	VIKAS	--	TECH SUPERVISOR
60041	10614191	10107864	Asset Management  Order Management 	VERMA	SUMEET	KUMAR	TECH SUPERVISOR
60042	10614192	10107864	Asset Management  Order Management 	SHANKAR	RAVI	--	TECH EXPERT
60043	10614193	10107864	Asset Management  Order Management 	SAHU	SHIBASIS	SUBHADARSHI	TECH SUPERVISOR
60044	10614194	10107864	Asset Management  Order Management 	PING	NIRANJAN	--	TECH SUPERVISOR
60045	10614195	10107864	Asset Management  Order Management 	BEHERA	BHAJARAM	--	TECH SUPERVISOR
60046	10614196	10107864	Asset Management  Order Management 	PATTNAIK	PINAKI	--	TECH SUPERVISOR
60047	10614407	10107864	Asset Management  Order Management 	MUNI	MANOJ KUMAR	--	ADMIN OFFICER
60049	10446443	10107864	Asset Management  Order Management 	SUBRAMANIYAN	RAJASHEKAR	--	ACCOUNT ASSISTANT
60050	10446481	10107864	Asset Management  Order Management 	VELAYUDHAM	SHANMUGAM	--	TECH SUPERVISOR
60051	10446468	10107864	Asset Management  Order Management 	THANGASAMY	JAYASUNDAR	--	TECH SUPERVISOR
60052	10446474	10107864	Asset Management  Order Management 	VARADHARAJAN	RAJASEKHAR	--	TECH SUPERVISOR
60053	10446475	10107864	Asset Management  Order Management 	POONUSAMY	PERIYASAAMY	--	TECH SUPERVISOR
60054	10446480	10107864	Asset Management  Order Management 	GOVINDASAMY	ELUMALAI	--	TECH SUPERVISOR
60055	10446462	10107864	Asset Management  Order Management 	NATARAJAN	ALAGESAN	--	TECH SUPERVISOR
60056	10446464	10107864	Asset Management  Order Management 	SAVARIMUTHU	CHARLES	--	TECH SUPERVISOR
60058	10500262	10107864	Asset Management  Order Management 	PANCHATCHARAM	RAJARAM	--	OFFICER_C
60059	10617083	10107864	Asset Management  Order Management 	LUKTUKE	VIKRANT	SURESH	TECH EXPERT
60065	10619230	10107864	Asset Management  Order Management 	IPPILI	KISHORE	--	TECH SUPERVISOR
60233	10619818	10107864	Asset Management  Order Management 	PANDEY	NEELESH	KUMAR	TECH SUPERVISOR
60234	10619819	10107864	Asset Management  Order Management 	SINGH	ASHUTOSH	DEVENDRA	TECH SUPERVISOR
60235	10619988	10107864	Asset Management  Order Management 	BISEN	TOPESH	KUMAR	TECH SUPERVISOR
60236	10620180	10107864	Asset Management  Order Management 	ROUT	PRATAP	--	TECH SUPERVISOR
60241	10620853	10107864	Asset Management  Order Management 	KANOUJIYA	PANKAJ	KUMAR	TECH SUPERVISOR
60244	10620984	10107864	Asset Management  Order Management 	VISHWAKARMA	SANKET	--	TECH SUPERVISOR
60245	10620986	10107864	Asset Management  Order Management 	DHOTE	MUKESH	KUMAR	TECH SUPERVISOR
60248	10622348	10107864	Asset Management  Order Management 	ROUTH	SOUMYA	--	TECH SUPERVISOR
60250	10622748	10107864	Asset Management  Order Management 	SIVA KUMAR	V.	--	TECH SUPERVISOR
60252	10623189	10107864	Asset Management  Order Management 	SAINI	VIKRAM	--	TECH SUPERVISOR
60253	10623145	10107864	Asset Management  Order Management 	DASH	MANAS	RANJAN	TECH SUPERVISOR
60254	10623620	10107864	Asset Management  Order Management 	PANDEY	PANKAJ	--	TECH SUPERVISOR
60255	10623610	10107864	Asset Management  Order Management 	KUMAR	YATENDRA	--	TECH SUPERVISOR
60256	10623617	10107864	Asset Management  Order Management 	JHA	NITESH	KUMAR	TECH SUPERVISOR
60259	10623615	10107864	Asset Management  Order Management 	MEWADE	DHARMENDRA	--	TECH SUPERVISOR
60260	10623614	10107864	Asset Management  Order Management 	TIWARI	GAURAV	--	TECH SUPERVISOR
60261	10623611	10107864	Asset Management  Order Management 	SINGH	DHIRENDRA	PRATAP	TECH SUPERVISOR
60265	10624448	10107864	Asset Management  Order Management 	DHANRE	GAURAV	TARACHAND	TECH SUPERVISOR
60266	10624447	10107864	Asset Management  Order Management 	HARIJAN	RAJENDRA	KUMAR	TECH SUPERVISOR
60267	10624446	10107864	Asset Management  Order Management 	MOHANTY	KISHORE	KUMAR	TECH SUPERVISOR
60268	10624445	10107864	Asset Management  Order Management 	DWIVEDI	RISHI	--	TECH SUPERVISOR
60271	10625508	10107864	Asset Management  Order Management 	SHARMA	ABHISHAIK	\N	TECH SUPERVISOR
60272	10625507	10107864	Asset Management  Order Management 	JADAV	CHIRAG	GOVINDBHAI	HSE CORDINATOR
60273	10625646	10107864	Asset Management  Order Management 	SINGH	REETESH	KUMAR	TECH SUPERVISOR
60274	10626117	10107864	Asset Management  Order Management 	PANDEY	CHANDRA	PRAKASH	TECH SUPERVISOR
60276	10626118	10107864	Asset Management  Order Management 	KHOBRAGADE	SACHIN	\N	TECH SUPERVISOR
60277	10626571	10107864	Asset Management  Order Management 	SAHU	VEERENDRA	\N	LEAD
60278	10626583	10107864	Asset Management  Order Management 	SINGH	VIVEK	\N	LEAD
60279	10626584	10107864	Asset Management  Order Management 	TOTADI	PRADEEP	KUMAR	LEAD
60281	10626585	10107864	Asset Management  Order Management 	DAS	ARUP	\N	LEAD
60282	10626586	10107864	Asset Management  Order Management 	YADAV	VIVEKSINGH	\N	LEAD
60283	10626587	10107864	Asset Management  Order Management 	MAHANAYAK	JEEBAN	PRASAD	LEAD
60284	10626588	10107864	Asset Management  Order Management 	RICHHARIYA	ABHISHEK	\N	LEAD
60287	10626573	10107864	Asset Management  Order Management 	PANDIT	YOGESH	\N	LEAD
60288	10626769	10107864	Asset Management  Order Management 	KUMAR	VINAY	\N	LEAD
60289	10626770	10107864	Asset Management  Order Management 	SINGH	SUSHILKUMAR	\N	LEAD
60290	10627043	10107864	Asset Management  Order Management 	DUBEY	SHUBHAM	\N	LEAD
60291	10627042	10107864	Asset Management  Order Management 	PATRA	DEBASIS	\N	LEAD
60295	10627044	10107864	Asset Management  Order Management 	SINGH	SHIV	NARAYAN	LEAD
60296	10627045	10107864	Asset Management  Order Management 	SINGH	SANTOSH	KUMAR	LEAD
60297	10627372	10107864	Asset Management  Order Management 	PRAJAPATI	RAMDAS	\N	LEAD
60298	10627370	10107864	Asset Management  Order Management 	SHRIWAS	NEERAJ	\N	LEAD
60301	10627367	10107864	Asset Management  Order Management 	SAKWAR	VED	PRAKASH	LEAD
60304	10627387	10107864	Asset Management  Order Management 	ALI	SULTAN	\N	LEAD
60305	10627501	10107864	Asset Management  Order Management 	UPADHYAY	ALKESH	\N	LEAD
60306	10627502	10107864	Asset Management  Order Management 	KOURAV	VREJENDRA	\N	LEAD
60307	10627590	10107864	Asset Management  Order Management 	YADAV	DEVENDRASINGH	\N	LEAD
60308	10627588	10107864	Asset Management  Order Management 	SAIBABU	KALIDASU	NAGA	LEAD
60309	10627586	10107864	Asset Management  Order Management 	SATHISKUMAR	T	\N	LEAD
60310	10627716	10107864	Asset Management  Order Management 	TOMAR	KHUSHHAL	\N	LEAD
60311	10627770	10107864	Asset Management  Order Management 	GEDDA	SRINIVASARAO	\N	LEAD
60313	10627772	10107864	Asset Management  Order Management 	SINGH	RANGNATH	\N	TECH SUPERVISOR
60315	10628009	10107864	Asset Management  Order Management 	TIWARI	SUSHIL	KUMAR	LEAD
60317	10628011	10107864	Asset Management  Order Management 	MOHAPATRA	RAJESH	KUMAR	HSE CORDINATOR
60318	10628794	10107864	Asset Management  Order Management 	ANSARI	MOHD.	IMTIYAZ	LEAD
60323	10513094	10107864	Asset Management  Order Management 	KUMAR	NITESH	GANESH	TECH SUPERVISOR
60324	10488526	10107864	Asset Management  Order Management 	PANICKER	RAHUL	RAJUKUTTA	TECH SUPERVISOR
60326	10630702	10107864	Asset Management  Order Management 	KUMAR	ROHIT	\N	LEAD
60332	10631272	10107864	Asset Management  Order Management 	PRADHAN	TAPAS	\N	LEAD
60333	10631297	10107864	Asset Management  Order Management 	BISWAL	LINGARAJ	\N	LEAD
60334	10631377	10107864	Asset Management  Order Management 	PARMAR	JAYDIPSINH	BHUPATSINH	LEAD
11742	10629804	10107864	Asset Management  Order Management 	PATHAK	PRAGYAN	U.	T/E
60336	10631977	10107864	Asset Management  Order Management 	SAXENA	KALPIT	\N	LEAD
60337	10632167	10107864	Asset Management  Order Management 	MAHMOOD	QUAISER	\N	LEAD
60338	10632913	10107864	Asset Management  Order Management 	AYYAPPAN	DHANESH	\N	LEAD SAFETY ENGINEER
60339	10632915	10107864	Asset Management  Order Management 	GEDELA	DEVAGIRI	\N	LEAD
60340	10633132	10107864	Asset Management  Order Management 	MOHANTY	RATIKANTA	\N	LEAD
60342	10633608	10107864	Asset Management  Order Management 	MAHANTA	BISWANATH	\N	LEAD
60343	10633905	10107864	Asset Management  Order Management 	ACHARYA	ANUP	\N	LEAD
60344	10634046	10107864	Asset Management  Order Management 	PATEL	AMIT KUMAR	\N	LEAD
60346	10634655	10107864	Asset Management  Order Management 	SAHU	NANDA	KISHOR	LEAD
60347	10634726	10107864	Asset Management  Order Management 	TADVI	NAYANKUMAR	GOVINDLAL	LEAD
60348	10635031	10107864	Asset Management  Order Management 	SIKDAR	TAPABRATA	\N	LEAD
60351	10636054	10107864	Asset Management  Order Management 	BISWAL	GAUTAM	KUMAR	HSE CORDINATOR
60320	10526004	10107864	Asset Management  Order Management 	MAJUMDAR	DIPANKAR	D.	OFFICE COORDINATOR
60349	10635478	10107864	Asset Management  Order Management 	KANT	SHASHI	\N	LEAD
60350	10636053	10107864	Asset Management  Order Management 	GUPTA	VINAY	\N	LEAD
60353	10637054	10107864	Asset Management  Order Management 	POWAR	AKSHAY	KRISHNAT	TECH SUPERVISOR
60358	10638689	10107864	Asset Management  Order Management 	GAUTAM	ROHIT	SINGH	LEAD
91142	10641157	10107864	Asset Management  Order Management 	GHARGADE	DHANANJAY	\N	MANAGER
91143	10641156	10107864	Asset Management  Order Management 	MAJUMDAR	SANDEEP	\N	MANAGER
60361	10640725	10107864	Asset Management  Order Management 	AGLAWE	SANTOSH	BALAJI	LEAD
60362	10640724	10107864	Asset Management  Order Management 	SEN	AMIT KUMAR	\N	LEAD
60363	10641546	10107864	Asset Management  Order Management 	KHERDE	ABHIJEET	SHRIRAM	LEAD
60364	10641547	10107864	Asset Management  Order Management 	KUMAR	VIMAL	\N	LEAD
60365	10641938	10107864	Asset Management  Order Management 	DEWANGAN	AMIT	PRAKASH	TECH SUPERVISOR
60368	10642903	10107864	Asset Management  Order Management 	SHARMA	RAJNEESH	\N	LEAD
60369	10642902	10107864	Asset Management  Order Management 	KONDAPALLI	VENKATESWARARAO	\N	LEAD
60370	10642904	10107864	Asset Management  Order Management 	SHARMA	GAURAV	GIRIRAJ PRASAD	LEAD
60373	10643710	10107864	Asset Management  Order Management 	JAIN	NEERAJ	\N	LEAD
60374	10643711	10107864	Asset Management  Order Management 	GONDALIYA	KOUSHIK	AMARDAS	LEAD
60375	10643972	10107864	Asset Management  Order Management 	JOSHI	VIREN	MADHUSUDAN	HSE CORDINATOR
60377	10644227	10107864	Asset Management  Order Management 	GAUSWAMI	RAVINDRAGIRI	\N	LEAD
60380	10644904	10107864	Asset Management  Order Management 	SAMANTARA	SIDHARTHA SANKAR	\N	LEAD
60382	10645219	10107864	Asset Management  Order Management 	SINGH	PRATIK	\N	LEAD
60383	10645171	10107864	Asset Management  Order Management 	K	Ranjithkumar	\N	LEAD
60384	10647520	10107864	Asset Management  Order Management 	AHIRKAR	MAYUR	KISHOR	LEAD
60386	10648625	10107864	Asset Management  Order Management 	PRABAKARAN	M.	\N	LEAD
60387	10648624	10107864	Asset Management  Order Management 	KHARA	AMIT	\N	LEAD
60379	10644704	10107864	Asset Management  Order Management 	SINGH	PRAMHANSH	KUMAR	LEAD
60388	10648946	10107864	Asset Management  Order Management 	PAUL	ELDHO	K	LEAD
60389	10648945	10107864	Asset Management  Order Management 	GEORGE	AKHIL	\N	LEAD
60390	10650355	10107864	Asset Management  Order Management 	JAYAKUMAR	JM	\N	LEAD
60391	10650356	10107864	Asset Management  Order Management 	MONDAL	PROMOD	KUMAR	LEAD
60392	10650357	10107864	Asset Management  Order Management 	Prasad	Raushan	\N	LEAD
60393	10650562	10107864	Asset Management  Order Management 	JENA	BRAJAKISHORE	\N	LEAD
60394	10650563	10107864	Asset Management  Order Management 	JHA	CHANDAN	KUMAR	LEAD
60395	10650783	10107864	Asset Management  Order Management 	PATEL	AKASH	SUSHIL	LEAD
60396	10651910	10107864	#N/A	SHYAM	K S	\N	LEAD
60397	10652195	10107864	#N/A	SRIVASTAVA	ANKIT	\N	LEAD
60398	10500250	10107864	#N/A	SAHU	MR.JOGESHWAR	\N	LEAD
60399	10652364	10107864	#N/A	SINGH	MR.RAJESH	\N	LEAD
60400	10500222	10107864	#N/A	MONDAL	APTABUDDIN	\N	LEAD
60401	10652473	10107864	#N/A	SINGH	DEVMANI	\N	LEAD
60402	10653409	10107864	#N/A	DAS	MR.ASWINI	\N	LEAD
60405	10655521	10107864	#N/A	MOHANTY	RUPAK	\N	LEAD
60406	10655522	10107864	#N/A	NARAYAN	BASANT	\N	LEAD
60407	10655929	10107864	#N/A	KUMAR	DILEEP	\N	LEAD
60408	10656974	10107864	#N/A	KUMAR	MANOJ	\N	LEAD
60411	10657574	10107864	#N/A	MAYEKAR	SWAPNIL	\N	LEAD
60403	10653675	10107864	#N/A	RUIDAS	ARUN	\N	LEAD
90471	10426441	10107871	Revamp Management 	GHELANI	PIYUSH	D.	SENIOR GENERAL MANAGER
90230	10446813	10107872	Revamp Selling	PANSE	SANJAY	R.	SENIOR MANAGER
90508	10447068	10107872	Revamp Selling	PRASAD	E.	ARUN	MANAGER
90549	10446826	10107872	Revamp Selling	KULKARNI	MANDAR	P.	SENIOR MANAGER
90945	10506560	10107872	Revamp Selling	REDEKAR	MS.PRIYANKA	ROHAN	ENGINEER
90764	10424586	10107872	Revamp Selling	GIRME	ANISH	N.	SR. EXECUTIVE
91069	10628235	10107872	Revamp Selling	KUMAR	RAJAN	\N	SR. EXECUTIVE
91157	10646192	10107872	Revamp Selling	Dongre	Sachin	Gorakh	SR. EXECUTIVE
91126	10637738	10107872	Revamp Selling	KITUKALE	SAMIR	DIWAKARRAO	MANAGER
91109	10635014	10107874	Revamp Order Management 	SHENDE	JITENDRA	SUDHAKAR	SENIOR MANAGER
90621	10446775	10107874	Revamp Order Management 	DIVEKAR	RAVINDRA	 P.	MANAGER
91037	10523045	10107874	Revamp Order Management 	MOHITE	SIDDHANT	RANJIT	ENGINEER
91156	10645371	10107874	Revamp Order Management 	Dindore	Pushkaraj	Rajendra	ENGINEER
60080	10447338	10107874	Revamp Order Management 	KULKARNI	 C.	B.	CAD TECHNICIAN
90599	10442308	10107882	Field Services Selling	SHARMA	YOGESH	\N	MANAGER
9042	10383855	10107884	Field Services Order Management 	KULKARNI	SUDHIR	D.	SENIOR MANAGER
90470	10446770	10107884	Field Services Order Management 	PHADKE	SACHIN	V.	SENIOR MANAGER
90513	10447070	10107884	Field Services Order Management 	VARDHANNAVAR	RAVI	K.	MANAGER
90520	10447279	10107884	Field Services Order Management 	SANTHANAM	RAJESH	-	SR. EXECUTIVE
90999	10617080	10107884	Field Services Order Management 	BHOSALE	SANGRAMSINH	SURYAKANT	SR. EXECUTIVE
91076	10631190	10107884	Field Services Order Management 	PADIYAR	KAMLESH	\N	ENGINEER
91127	10637741	10107884	Field Services Order Management 	SAINI	ENGLESH	\N	ENGINEER
11774	10657281	10107884	Field Services Order Management 	DESHMUKH	SIDDHARTH	 RAJIV	T/E
11761	10638046	10107884	Field Services Order Management 	JADHAV	VIJAY	TANAJI	T/E
9273	10446757	10107891	Part and Supply  Management 	KAMAT	VIVEK	\N	GENERAL MANAGER
90791	10488566	10107892	Part and Supply  Selling	PRAJAPATI	NIRAV	S.	MANAGER
90761	10482343	10107892	Part and Supply  Selling	TAWADE	 SHRIJAY	A.	SR. EXECUTIVE
90639	10447297	10107892	Part and Supply  Selling	SHAIKH	ARIF	R.	EXECUTIVE
91071	10595543	10107892	Part and Supply  Selling	KOLHATKAR	SAUMITRA	DEEPAK	ENGINEER
11732	10628015	10107892	Part and Supply  Selling	WATEGAVE	PRATIK	PRAMOD	T/E
90365	10447261	10107894	Part and Supply  Order Management	NALAWADE	ARJUN	J.	SR. EXECUTIVE
90578	10442314	10107894	Part and Supply  Order Management	SAYYED	ASLAM	A.	EXECUTIVE
91089	10598458	10107894	Part and Supply  Order Management	RAKH	PRATIK	SURESH	ENGINEER
11753	10634441	10107894	Part and Supply  Order Management	PANDEY	MUDIT	\N	T/E
11726	10628018	10107894	Part and Supply  Order Management	CONTRACTOR	MURTUZA	SHABBIR	T/E
9023	10383761	10107809	Construction Services - E and I 	KUMAR	BIJU	S.	SENIOR GENERAL MANAGER
90790	10488641	10107809	Construction Services - E and I 	SHAJAHAN	 S.	\N	MANAGER
9639	10446354	10107809	Construction Services - E and I 	SIVARAMAKRISHNAN	VENKITESWARAN	\N	MANAGER
9732	10446355	10107809	Construction Services - E and I 	NAREWADIKAR	KIRAN	S.	MANAGER
9734	10446356	10107809	Construction Services - E and I 	SURESH	R.	\N	MANAGER
9988	10446357	10107809	Construction Services - E and I 	BOOPATHY	S.	S.	MANAGER
90115	10447161	10107809	Construction Services - E and I 	VENGAIMARAN	M.	\N	MANAGER
90211	10447177	10107809	Construction Services - E and I 	KOMMAJOSYULA	SRIKANTH	\N	MANAGER
90219	10446361	10107809	Construction Services - E and I 	GEORGE	S.	\N	SR. EXECUTIVE
90361	10447192	10107809	Construction Services - E and I 	MISHRA	SUDHIR	K.	SR. EXECUTIVE
90860	10510842	10107809	Construction Services - E and I 	ARUN	 R.	--	SR. EXECUTIVE
90991	10611034	10107809	Construction Services - E and I 	CHATTERJEE	KOUSHIK	--	SR. EXECUTIVE
90254	10488224	10107809	Construction Services - E and I 	BAG	SUKANTA	\N	SR. EXECUTIVE
90678	10482322	10107809	Construction Services - E and I 	SRIKANTH	A.	-	SR. EXECUTIVE
90786	10484670	10107809	Construction Services - E and I 	LOGANATHAN	SANTHAN	KUMAR	EXECUTIVE
90992	10611134	10107809	Construction Services - E and I 	CHAKRABORTY	PRAVAKAR	\N	EXECUTIVE
9803	10447116	10107809	Construction Services - E and I 	NITTURKAR	RAVI	B.	MANAGER
90494	10446389	10107809	Construction Services - E and I 	ALI	RIZWAN	\N	SR. EXECUTIVE
60330	10630851	10107809	Construction Services - E and I 	SURESHKUMAR	S	\N	TECH SUPERVISOR
60239	10620847	10107809	Construction Services - E and I 	PANDEY	OMKESH	--	TECH SUPERVISOR
90694	10481187	10107810	CONSTRUCTION ENERGY- COMMISSIONING	CHAUDHURI	SUBHANKAR	\N	SENIOR GENERAL MANAGER
90270	10446931	10107810	CONSTRUCTION ENERGY- COMMISSIONING	NANDI	SOUMYAJIT	\N	SENIOR MANAGER
90547	10447207	10107810	CONSTRUCTION ENERGY- COMMISSIONING	PAUL	MAHIMMAY	-	MANAGER
91123	10636802	10107810	CONSTRUCTION ENERGY- COMMISSIONING	MINJ	PUNEET	\N	MANAGER
91128	10637740	10107810	CONSTRUCTION ENERGY- COMMISSIONING	KATHPAL	ASHISH	\N	SR. EXECUTIVE
91173	10653896	10107810	CONSTRUCTION ENERGY- COMMISSIONING	SATHISH KUMAR	 R	\N	SR. EXECUTIVE
90775	10488653	10107810	CONSTRUCTION ENERGY- COMMISSIONING	SINGH	ASHISH	K	EXECUTIVE
90772	10488611	10107810	CONSTRUCTION ENERGY- COMMISSIONING	ROY	PRATIK	--	EXECUTIVE
91043	10620846	10107810	CONSTRUCTION ENERGY- COMMISSIONING	PAUL	SUBHAJIT	--	EXECUTIVE
91044	10620844	10107810	CONSTRUCTION ENERGY- COMMISSIONING	SONI	VIJAY	KUMAR	EXECUTIVE
91045	10620845	10107810	CONSTRUCTION ENERGY- COMMISSIONING	NASKAR	DHIMAN	--	EXECUTIVE
91125	10637327	10107810	CONSTRUCTION ENERGY- COMMISSIONING	KUMAR	PRAMOD	\N	EXECUTIVE
91135	10639688	10107810	CONSTRUCTION ENERGY- COMMISSIONING	MURUGAN	ARAVINTH	\N	EXECUTIVE
91104	10634438	10107810	CONSTRUCTION ENERGY- COMMISSIONING	DHALI	SNEHASHIS	SAMIRAN	ENGINEER
90666	10481188	10107811	CONSTRUCTION CEMENT- COMMISSIONING	SHRIVASTAV	PREM	SHANKAR	GENERAL MANAGER
9514	10446764	10107811	CONSTRUCTION CEMENT- COMMISSIONING	DABHI	HARISH	S	GENERAL MANAGER
9637	10446766	10107811	CONSTRUCTION CEMENT- COMMISSIONING	GOBBUR	ARUNKUMAR	M.	GENERAL MANAGER
9913	10446767	10107811	CONSTRUCTION CEMENT- COMMISSIONING	BHAN	VASIMALLA	V.	SENIOR MANAGER
9515	10446800	10107811	CONSTRUCTION CEMENT- COMMISSIONING	PALANI	POOVALINGAM	\N	MANAGER
9365	10383777	10107802	CONSTRUCTION ERECTION - CEMENT 	PARCHURE	MANISH	S	GENERAL MANAGER
90444	10446742	10107802	CONSTRUCTION ERECTION - CEMENT 	BISWAS	SONA	\N	GENERAL MANAGER
90064	10446921	10107802	CONSTRUCTION ERECTION - CEMENT 	SINGH	NAGINDRA	R.	MANAGER
90130	10446924	10107802	CONSTRUCTION ERECTION - CEMENT 	MITTALKOD	RAJSHEKHAR	R.	MANAGER
90503	10447067	10107802	CONSTRUCTION ERECTION - CEMENT 	DAVID	G.PRINCE	O.	MANAGER
90239	10447235	10107802	CONSTRUCTION ERECTION - CEMENT 	KHAN	AFZAL	\N	SR. EXECUTIVE
9517	10207705	10107901	T & IS  ADMINISTRATION	TALNIKAR	ANIL	M.	SENIOR VICE PRESIDENT
5868	10383799	10107901	T & IS  ADMINISTRATION	KHANDEKAR	ABHIJIT	ARVIND	GENERAL MANAGER
9286	10446789	10107901	T & IS  ADMINISTRATION	GAIKWAD	SHEKHAR	K.	SENIOR MANAGER
9464	10212762	10107902	T & IS  MAINTENANCE OF SYSTEMS	DIGHE	AJAY	B	GENERAL MANAGER
9502	10446860	10107903	T & IS  DEVELOPMENT	KOBAL	SUNIL	C.	MANAGER
9503	10446861	10107903	T & IS  DEVELOPMENT	PATIL	AMOL	S	SENIOR MANAGER
90381	10447320	10138001	MUMBAI OFFICE ADMINISTRATION	DALAL	FARZAN	ASPI	EXECUTIVE
9870	10446904	10128021	KOLKATA OFFICE - EXECUTION	SINGHA	SAMIRAN	K.	MANAGER
90235	10445706	10128021	KOLKATA OFFICE - EXECUTION	SINGHA	CHANDAN	\N	EXECUTIVE
90626	10481190	10148031	CHENNAI OFFICE EXECUTION	CHANDRASEKAR	R.	-	SENIOR GENERAL MANAGER
5508	10383847	10148031	CHENNAI OFFICE EXECUTION	RAMANUJAM	R.	\N	SENIOR MANAGER
97001	10445632	10148031	CHENNAI OFFICE EXECUTION	JAYKUMAR	MRS.SUNITHA	\N	EXECUTIVE
97003	10445738	10148031	CHENNAI OFFICE EXECUTION	KUMAR	A	\N	OFFICE ASSOCIATE
90729	10481185	10109101	Projects Management	RANJAN	PRAMOD	--	DIRECTOR
9391	10403089	10109101	Projects Management	PATIL	JITENDRA	SHIVAJI	SENIOR MANAGER
91164	10647195	10109101	Projects Management	Shah	 Kushagra	Kaushikkumar	MANAGER
9138	10383709	10109204	Project Execution - ENERGY	CHAKRABORTY	PRANAB	SUNIL	VICE PRESIDENT
9208	10383768	10109204	Project Execution - ENERGY	JOSHI	SRINIVAS	D.	GENERAL MANAGER
9014	10383759	10109204	Project Execution - ENERGY	MEHTA	NILESH	INDRAVADAN	GENERAL MANAGER
9294	10383773	10109204	Project Execution - ENERGY	ABHYANKAR	ASHUTOSH	ARVIND	GENERAL MANAGER
90388	10393251	10109204	Project Execution - ENERGY	TIWARI	MANISH	KUMAR	GENERAL MANAGER
9958	10383786	10109204	Project Execution - ENERGY	KULKARNI	GANGADHAR	V.	GENERAL MANAGER
9368	10422192	10109204	Project Execution - ENERGY	CHAVAN	MANSING	HINDURAO	SENIOR MANAGER
90635	10446777	10109204	Project Execution - ENERGY	SABHARWAL	MANEESH	\N	GENERAL MANAGER
9712	10431202	10109204	Project Execution - ENERGY	WARKE	UDAY	V.	MANAGER
9738	10431193	10109204	Project Execution - ENERGY	DHAMAL	RAJENDRA	N	MANAGER
9816	10431205	10109204	Project Execution - ENERGY	SHINDE	SHASHIKANT	S.	SENIOR MANAGER
90180	10446927	10109204	Project Execution - ENERGY	SHARMA	ANOOP	G.	MANAGER
9801	10431592	10109204	Project Execution - ENERGY	MANE	VINOD	A.	MANAGER
9899	10447134	10109204	Project Execution - ENERGY	AHMED	RIZWAN	K.	MANAGER
9915	10431200	10109204	Project Execution - ENERGY	MUSNE	KRISHNAKANT	G.	MANAGER
90768	10482321	10109204	Project Execution - ENERGY	BANG	RAHUL	L.	MANAGER
90052	10431220	10109204	Project Execution - ENERGY	PHALKE	AMOL	B.	MANAGER
90099	10447158	10109204	Project Execution - ENERGY	CHAVAN	ROHIT	R.	MANAGER
90100	10447159	10109204	Project Execution - ENERGY	PAWAR	YASHWANT	Y.	SR. EXECUTIVE
90132	10447167	10109204	Project Execution - ENERGY	KURIAN	ALBERT	\N	MANAGER
90097	10447157	10109204	Project Execution - ENERGY	KULKARNI	YOGESH	S.	SR. EXECUTIVE
9965	10431219	10109204	Project Execution - ENERGY	GOLWALKAR	AMEYA	R.	MANAGER
90098	10447223	10109204	Project Execution - ENERGY	SAVANT	RAGHAVENDRA	S.	SR. EXECUTIVE
90214	10447231	10109204	Project Execution - ENERGY	NATARAJAN	SOMASUNDARAM	S.	SR. EXECUTIVE
91065	10626115	10109204	Project Execution - ENERGY	PIMPALE	KOMAL	\N	SR. EXECUTIVE
11712	10625425	10109204	Project Execution - ENERGY	SHALIGRAM	CHAITANYA	JITENDRA	T/E
11715	10625580	10109204	Project Execution - ENERGY	MATALE	NILESH	SHIVAJI	T/E
11716	10625579	10109204	Project Execution - ENERGY	JANGAM	SURAJ	NARENDRA	T/E
11707	10621250	10109204	Project Execution - ENERGY	SATPUTE	SOURBH	GOKUL	T/E
11709	10622687	10109204	Project Execution - ENERGY	KARE	PRASAD	RAJENDRA	T/E
9037	10383708	10109304	Project Execution - MHE	SHANKAR	GOPAL	\N	SENIOR VICE PRESIDENT
9776	10383712	10109304	Project Execution - MHE	DASGUPTA	SURAJIT	\N	SENIOR GENERAL MANAGER
9032	10383762	10109304	Project Execution - MHE	RAVISHANKAR	KAZA	\N	SENIOR GENERAL MANAGER
90190	10383789	10109304	Project Execution - MHE	SONTAKKE	SANDEEP	S.	GENERAL MANAGER
5873	10383753	10109304	Project Execution - MHE	KUMAR	M.	A.	GENERAL MANAGER
90220	10383837	10109304	Project Execution - MHE	DAS	TARUN	KUMAR	GENERAL MANAGER
9838	10431197	10109304	Project Execution - MHE	KALYANI	SAGAR	B.	SENIOR MANAGER
90716	10482295	10109304	Project Execution - MHE	MUKHERJEE	 ARIJIT	\N	SENIOR MANAGER
90194	10431227	10109304	Project Execution - MHE	WALUNJ	VISHAL	B.	SENIOR MANAGER
9705	10431186	10109304	Project Execution - MHE	KADAM	UMESH	M.	MANAGER
9843	10446900	10109304	Project Execution - MHE	VARMA	VINOD	\N	MANAGER
9861	10431194	10109304	Project Execution - MHE	YERLA	RAMKRISHNA	B.	SENIOR MANAGER
90553	10447072	10109304	Project Execution - MHE	SAKATKAR	ONKAR	B.	MANAGER
90831	10488490	10109304	Project Execution - MHE	MISHRA	CHANDAN	--	MANAGER
9488	10446856	10109304	Project Execution - MHE	DESAI	NIKHIL	B	SENIOR MANAGER
9693	10447110	10109304	Project Execution - MHE	KULKARNI	YOGESH	D.	MANAGER
9873	10422193	10109304	Project Execution - MHE	NIWAL	RAHUL	D.	MANAGER
90306	10447244	10109304	Project Execution - MHE	SANTOSH	K.	\N	SR. EXECUTIVE
90318	10447246	10109304	Project Execution - MHE	MOKASHI	VINIT	S.	SR. EXECUTIVE
91056	10623729	10109304	Project Execution - MHE	GUPTA	NIKHIL	RAKESH	SR. EXECUTIVE
91179	10656747	10109304	Project Execution - MHE	AHMED	MD IRFAN	\N	SR. EXECUTIVE
90834	10488380	10109304	Project Execution - MHE	JUNGHARE	PRASHANT	S.	EXECUTIVE
91149	10644228	10109304	Project Execution - MHE	SHRIVASTAVA	SOMIL	\N	EXECUTIVE
11713	10625427	10109304	Project Execution - MHE	MOHAN	MS.NIDHI	--	T/E
90090	10383835	10109404	Project Execution -  Sugar	PATIL	JAYPRAKASH	S.	SENIOR MANAGER
9249	10383770	10109604	Project Execution - Cement	LADDHAD	MANISH	BRIJMOHANJI	SENIOR GENERAL MANAGER
9607	10446765	10109604	Project Execution - Cement	HEGGA	SREENATH	R.	GENERAL MANAGER
90162	10431189	10109604	Project Execution - Cement	DWARA	LAKSHMINATH	\N	SENIOR MANAGER
90572	10442318	10109604	Project Execution - Cement	MALKUNJE	ANAND	S.	SENIOR MANAGER
9491	10446857	10109604	Project Execution - Cement	GAIDHAR	PRAVIN	V	SENIOR MANAGER
9696	10446882	10109604	Project Execution - Cement	MALIPATIL	BASAVARAJ	V.	SENIOR MANAGER
9697	10446883	10109604	Project Execution - Cement	PANDIT	CHINMAY	R.	SENIOR MANAGER
9610	10446873	10109604	Project Execution - Cement	JUMALE	NILESH	H.	SENIOR MANAGER
9611	10446874	10109604	Project Execution - Cement	SHAHBAD	ABID	A.	SENIOR MANAGER
9815	10447118	10109604	Project Execution - Cement	KANGARKAR	SACHIN	V.	MANAGER
9832	10446899	10109604	Project Execution - Cement	NAGPURE	PRAVIN	R.	SENIOR MANAGER
90040	10447154	10109604	Project Execution - Cement	SARASWAT	SWAPNIL	\N	MANAGER
9602	10446805	10109604	Project Execution - Cement	KARMALKAR	MANGESH	S.	MANAGER
90120	10447164	10109604	Project Execution - Cement	GAWANDE	DEEPAK	P.	MANAGER
90121	10447224	10109604	Project Execution - Cement	BUBANE	ABHIJIT	V.	SR. EXECUTIVE
11734	10628504	10109604	Project Execution - Cement	SHIRALKAR	ANISH	MILIND	T/E
11735	10628503	10109604	Project Execution - Cement	JAYDEOKAR	AMEYA	MANOJ	T/E
9520	10383711	10109704	Project Execution - Planning	RADHAKRISHNAN	RAJESH	\N	SENIOR VICE PRESIDENT
90611	10442315	10109704	Project Execution - Planning	THITE	SANDEEP	 B.	SENIOR GENERAL MANAGER
9872	10403083	10109704	Project Execution - Planning	DAS	SAJITH	K.	MANAGER
91012	10618280	10109704	Project Execution - Planning	PILARE	SWAPNIL	LALAJI	SR. EXECUTIVE
91077	10631193	10109704	Project Execution - Planning	BIGHANE	VIPIN	NARAYAN	SR. EXECUTIVE
91103	10634439	10109704	Project Execution - Planning	ALBERT	R.	\N	SR. EXECUTIVE
90798	10488434	10109704	Project Execution - Planning	KUMAR	 KIRAN	-	SR. EXECUTIVE
91147	10642901	10109704	Project Execution - Planning	PATRO	UMAKANTA	\N	SR. EXECUTIVE
91153	10644693	10109704	Project Execution - Planning	GODBOLE	MAHINDRA	MUKTESHWAR	SR. EXECUTIVE
91165	10647548	10109704	Project Execution - Planning	SONI	VIVEK	\N	SR. EXECUTIVE
91146	10641734	10109704	Project Execution - Planning	FLYWIN	I	\N	EXECUTIVE
91131	10638964	10109704	Project Execution - Planning	MASE	VAIBHAV	VIVEK	ENGINEER
11714	10625578	10109704	Project Execution - Planning	SATHAYE	MS.ISHA	BHALCHANDRA	T/E
9397	10431223	10109904	Single Machine Project Exe.	BHAT	SUSHEEL	J.	SENIOR MANAGER
9580	10446870	10109904	Single Machine Project Exe.	KRISHNASWAMY	RAHUL	\N	MANAGER
9954	10447141	10109904	Single Machine Project Exe.	PATIL	MAHESH	D.	MANAGER
90782	10488453	10109804	SMB Project Execution 	LIMAYE	VINEET	N.	EXECUTIVE
98001	10393255	10115502	HYD. WORKSHOP  MANAGEMENT P.P.P	VENKATESHWARARAO	V.	\N	SENIOR GENERAL MANAGER
98002	10393257	10115502	HYD. WORKSHOP  MANAGEMENT P.P.P	SRINIVASA RAO	K.	\N	GENERAL MANAGER
98003	10446778	10115502	HYD. WORKSHOP  MANAGEMENT P.P.P	GUPTA	VIKAS	\N	SENIOR MANAGER
98014	10447084	10115502	HYD. WORKSHOP  MANAGEMENT P.P.P	GOPAL	G.	\N	MANAGER
98034	10447301	10115502	HYD. WORKSHOP  MANAGEMENT P.P.P	CHITTI	JAYAPRAKASH	\N	SR. EXECUTIVE
98030	10447300	10115502	HYD. WORKSHOP  MANAGEMENT P.P.P	JAGAD	MOHAN	\N	SR. EXECUTIVE
98050	10488569	10115502	HYD. WORKSHOP  MANAGEMENT P.P.P	PRASANTH	 Y.	\N	EXECUTIVE
98041	10445703	10115502	HYD. WORKSHOP  MANAGEMENT P.P.P	RAO	T.	KURMA	EXECUTIVE
98076	10513077	10115502	HYD. WORKSHOP  MANAGEMENT P.P.P	MUNIGONDA	ARUN	\N	ENGINEER
98077	10566949	10115502	HYD. WORKSHOP  MANAGEMENT P.P.P	GUDURU	AJAY	\N	ENGINEER
35121	10635029	10115502	HYD. WORKSHOP  MANAGEMENT P.P.P	RAGHUVAMSI	PUJALA	\N	T/E
35102	10596639	10115502	HYD. WORKSHOP  MANAGEMENT P.P.P	RACHAKONDA	MOKSHAGNA	\N	T/E
35105	10602624	10115502	HYD. WORKSHOP  MANAGEMENT P.P.P	ASHOK REDDY	TAMIDELA	\N	T/E
35118	10631653	10115502	HYD. WORKSHOP  MANAGEMENT P.P.P	VIDYA SAGAR	VAGILI	\N	T/E
35090	10590940	10115505	HYDERABAD WORKSHOP MACHINE SHOP	MAHESH	KOTHA	--	T/E
98082	10504498	10115505	HYDERABAD WORKSHOP MACHINE SHOP	KISHAN KUMAR	SAHU	\N	PRODUCTION ASSOCIATE
98081	10488213	10115505	HYDERABAD WORKSHOP MACHINE SHOP	ALI	MOHAMMED	\N	PRODUCTION ASSOCIATE
98080	10641014	10115505	HYDERABAD WORKSHOP MACHINE SHOP	GOUSE PEERVALI	SHAIK	MADINA	PRODUCTION ASSOCIATE
35116	10631091	10115505	HYDERABAD WORKSHOP MACHINE SHOP	ABHISHEK	MANDAL	\N	T/E
25014	10488594	10115506	HYDERABAD WORKSHOP INDIRECT LABOUR	RAO	MADDURI	BABU	MACHINIST
98004	10446833	10115510	HYDERABAD WORKSHOP MAINTENANCE	MURALI KRISHNA	T.	\N	SENIOR MANAGER
98009	10446834	10115510	HYDERABAD WORKSHOP MAINTENANCE	RAJESHWARRAO	KASUBA	\N	SENIOR MANAGER
98017	10445701	10115510	HYDERABAD WORKSHOP MAINTENANCE	REDDY	B.	DASTAGIRI	SR. EXECUTIVE
25022	10488599	10115510	HYDERABAD WORKSHOP MAINTENANCE	REDDY	REDDIVARI	CHENNAKRISHNA	FITTER
35120	10633438	10115510	HYDERABAD WORKSHOP MAINTENANCE	PRATHAP	MELLAM	\N	T/A
35114	10619460	10115510	HYDERABAD WORKSHOP MAINTENANCE	SAI KRISHNA	RACHAKONDA	--	T/E
98031	10393262	10115511	HYD. WORKSHOP  QUALITY	SRINIVAS	ADARI	\N	GENERAL MANAGER
98022	10446836	10115511	HYD. WORKSHOP  QUALITY	Suresh	M.V.	Kumar	MANAGER
98008	10447083	10115511	HYD. WORKSHOP  QUALITY	MATHAI	SAMUEL	\N	MANAGER
98026	10447085	10115511	HYD. WORKSHOP  QUALITY	Kola	Vamsi	Krishna	MANAGER
98011	10447215	10115511	HYD. WORKSHOP  QUALITY	RAMU	G	\N	MANAGER
98018	10447216	10115511	HYD. WORKSHOP  QUALITY	RAGHAVAIAH	VEERANKI	VEERA	MANAGER
98006	10445733	10115511	HYD. WORKSHOP  QUALITY	MURTHY	T.	S.N	EXECUTIVE
98036	10447302	10115511	HYD. WORKSHOP  QUALITY	JANARDHAN	\N	SUNKARA	SR. EXECUTIVE
98063	10445673	10115511	HYD. WORKSHOP  QUALITY	SANDAKA	SRI	HARSHVARDHAN	SR. EXECUTIVE
98007	10446440	10115511	HYD. WORKSHOP  QUALITY	RAJEEV	A.	K	OFFICER
35097	10593626	10115511	HYD. WORKSHOP  QUALITY	PHANIDHAR	--	ANNABATTULA	T/E
35098	10593627	10115511	HYD. WORKSHOP  QUALITY	MOHAMMAD	--	ASIF AHMAD	T/E
35074	10529083	10115511	HYD. WORKSHOP  QUALITY	NAYAK	BIBHUTI	BHUSAN	T/E
98015	10446367	10115512	HYDERABAD WORKSHOP STORES AND DESPATCH	CHANDRA	T	SARAT	MANAGER
98016	10447331	10115512	HYDERABAD WORKSHOP STORES AND DESPATCH	RAVINDRANATH	B	\N	MANAGER
98023	10403096	10115512	HYDERABAD WORKSHOP STORES AND DESPATCH	Venkateswarlu	CH.	\N	MANAGER
98038	10445734	10115512	HYDERABAD WORKSHOP STORES AND DESPATCH	SUNDER	THAMARAKULAM	VISWANATHAN	SR. EXECUTIVE
25003	10488642	10115512	HYDERABAD WORKSHOP STORES AND DESPATCH	MEDARI	SHANKARAIAH	\N	ATTENDANT
25043	10488604	10115512	HYDERABAD WORKSHOP STORES AND DESPATCH	REDDY	MOHAN	ANNARAM	ATTENDANT
98074	10632163	10115513	HYDERABAD WORKSHOP ADMINISTRATION	SRINIVAS	MUNJULURI	\N	SENIOR MANAGER
98029	10447087	10115513	HYDERABAD WORKSHOP ADMINISTRATION	P	Shankarshan	Kumar	MANAGER
98005	10447082	10115513	HYDERABAD WORKSHOP ADMINISTRATION	SHOBA	MS.K.	\N	MANAGER
98051	10488640	10115513	HYDERABAD WORKSHOP ADMINISTRATION	SHAILAJA	MS.S.	\N	EXECUTIVE
98012	10446835	10115514	Hyd. Finance	SRINIVAS	V	RS	MANAGER
98013	10447330	10115514	Hyd. Finance	Annapurna	MS.Ch.	\N	SR. EXECUTIVE
98044	10482352	10115524	Hyd. Common Cost Panels	SHAIK	ABDUL	RAHIM	MANAGER
35122	10635276	10115524	Hyd. Common Cost Panels	PATEL	MOHAMMEDWASIF	\N	T/E
35113	10616568	10115524	Hyd. Common Cost Panels	KISHORE	BODAKUNTA	\N	T/E
98010	10445633	10115534	Hyd. Common Cost Idlers	SYAMSUNDAR	Y	\N	MANAGER
35112	10616567	10115534	Hyd. Common Cost Idlers	SUBHASH	MACHAVARAPU	--	T/E
25008	10488514	10115541	Hyd. Pulley - Fitting	NARAYANA	KOSARAJU	VENKATA	FITTER
98025	10445634	10115542	Hyd. Pulleys - Welding	Chavali	Srikanth	\N	MANAGER
98065	10445662	10115543	Hyd. Pulleys - Machining	FAYAZ	Y.M.	F.	EXECUTIVE
25017	10488623	10115543	Hyd. Pulleys - Machining	SARMA	MRUTHYUNJAYA	\N	MACHINIST
25029	10488255	10115543	Hyd. Pulleys - Machining	CHARY	KATAKAM	SRINIVASA	MACHINIST
25031	10488601	10115543	Hyd. Pulleys - Machining	REDDY	KEESARA	UMASHANKER	MACHINIST
98048	10488505	10115543	Hyd. Pulleys - Machining	NAIDU	 G.	APPALA	OFFICER
98049	10488580	10115543	Hyd. Pulleys - Machining	RAMULU	S.	\N	OFFICER
25011	10488279	10115543	Hyd. Pulleys - Machining	DAS	CHALAMANI	MOHAN	TURNER
25033	10488602	10115543	Hyd. Pulleys - Machining	REDDY	DUDDEKUNTA	GOURISHANKARREDDY	TURNER
25034	10488429	10115543	Hyd. Pulleys - Machining	KRISHNA	KOTHAPALLI	RAMA	TURNER
25042	10488231	10115543	Hyd. Pulleys - Machining	BASHA	S.K.	MAHABOOB	TURNER
98020	10488532	10115544	Hyd. Common Cost Pulleys	Nadeem	\N	Patel	SR. EXECUTIVE
98078	10569152	10115551	Hyd. Equipments - Fitting	KUMAR	ADARI	LAVA	ENGINEER
25005	10488256	10115551	Hyd. Equipments - Fitting	CHARI	MUNIGANTI	NARASIMHA	FITTER
25006	10488579	10115551	Hyd. Equipments - Fitting	RAMESH	EEGA	\N	FITTER
25007	10488593	10115551	Hyd. Equipments - Fitting	RAO	UTTLA	NARSINGA	FITTER
25015	10488584	10115551	Hyd. Equipments - Fitting	SRINIVASA RAO	VALLABHANENI	\N	FITTER
25020	10488658	10115551	Hyd. Equipments - Fitting	NURUKURTHI	SRINIVASU	\N	FITTER
25023	10488575	10115551	Hyd. Equipments - Fitting	RAJU	ADDEPALLI	SREEDHAR	FITTER
25026	10488586	10115551	Hyd. Equipments - Fitting	RAO	BONANGI	PUSHPANGADHA	FITTER
25032	10488685	10115551	Hyd. Equipments - Fitting	VENKATESWARULU	NAKKALA	\N	FITTER
25035	10488402	10115551	Hyd. Equipments - Fitting	RAO	YALLAMILLI	KAMESWARA	FITTER
25036	10488603	10115551	Hyd. Equipments - Fitting	REDDY	NALLA	YADAVA	FITTER
25037	10488225	10115551	Hyd. Equipments - Fitting	BALRAJ	KANAGALLA	\N	FITTER
25038	10488587	10115551	Hyd. Equipments - Fitting	RAO	KANKATALA	SRINIVASA	FITTER
25041	10488589	10115551	Hyd. Equipments - Fitting	RAO	PECHETTY	SRINIVAS	FITTER
35123	10639616	10115551	Hyd. Equipments - Fitting	RANJITH KUMAR	ADERLA	\N	T/A
98019	10446368	10115552	Hyd. Equipments - Welding	Kalyan	V.V.V.	\N	MANAGER
25013	10488656	10115552	Hyd. Equipments - Welding	KANDUKURI	SRINIVAS	\N	WELDER
25019	10488694	10115552	Hyd. Equipments - Welding	WAJID	MOHAMMAD	ABDUL	WELDER
25021	10488585	10115552	Hyd. Equipments - Welding	RAO	KANDERRAO	YADAGIRI	WELDER
25030	10488596	10115552	Hyd. Equipments - Welding	RAO	PETLA	JAYANANDALAKSHMIKANTHARAO	WELDER
25040	10488588	10115552	Hyd. Equipments - Welding	RAO	YARLAGADDA	SRIHARI	WELDER
25018	10488595	10115553	Hyd. Equipments - Machining	RAO	RAJANA	BABU	MACHINIST
25024	10488581	10115553	Hyd. Equipments - Machining	RAMULU	ANDUKOLU	\N	MACHINIST
25012	10488600	10115553	Hyd. Equipments - Machining	REDDY	MANDA	SEETHARAM	WELDER
98072	10620636	10115554	Hyd. Common Cost Equp. Fabri.	YADAV	VIJAYSHANKAR	--	GENERAL MANAGER
98027	10447086	10115554	Hyd. Common Cost Equp. Fabri.	Dewani	Srinivas	\N	MANAGER
98045	10488591	10115554	Hyd. Common Cost Equp. Fabri.	RAO	G	NAGAMALLESWARA	OFFICER
98046	10488683	10115554	Hyd. Common Cost Equp. Fabri.	VARMA	 D	PHANEENDRA	EXECUTIVE
98043	10482353	10115554	Hyd. Common Cost Equp. Fabri.	VINODH	 A.	RAMA	EXECUTIVE
98073	10522871	10115554	Hyd. Common Cost Equp. Fabri.	SOLANKI	ESHWAR	--	ENGINEER
98047	10488607	10115554	Hyd. Common Cost Equp. Fabri.	REDDY	M.	SRINIVAS	EXECUTIVE
98079	10572184	10115554	Hyd. Common Cost Equp. Fabri.	HARISH	YERRA	\N	PRODUCTION ASSOCIATE
60230	10500281	10115554	Hyd. Common Cost Equp. Fabri.	NANCHARAIAH	B.	\N	CAD ENGINEER
35104	10599898	10115554	Hyd. Common Cost Equp. Fabri.	NARESH	KOTA	\N	T/E
35108	10610193	10115554	Hyd. Common Cost Equp. Fabri.	VENKATA MAHESH	 SANAGALA	--	T/E
35111	10614719	10115554	Hyd. Common Cost Equp. Fabri.	BHANU PRAKASH	VUTLA	--	T/E
98037	10446369	10115564	Hyd. Common Cost Stru. Fabri.	SRINIVAS	\N	NAGELLA	MANAGER
98083	10641015	10115564	Hyd. Common Cost Stru. Fabri.	SRIKANTH	GANTA	\N	SR. EXECUTIVE
91003	10506657	10125702	SMB-Sales and Marketing	BEHERA	JUDHISTHIR	-	MANAGER
91002	10489379	10115702	SMB-Sales and Marketing	SRIKANTH	JAMPALA	\N	MANAGER
60231	10619342	10115704	SMB - Execution	CHILAKALA	 ARUNA KUMAR	--	COMMERCIAL ASSISTANT
98086	10490533	10117895	Undercarriages PSM  Order Management	ARUNKUMAR	M.	--	SENIOR MANAGER
98085	10394518	10117895	Undercarriages PSM  Order Management	VANITHA	MS. DWARAPUDI	--	SR. EXECUTIVE
91006	10489387	10107712	Project Procurement Raw Material	SATYANARAYANA	 SADANALA	\N	SENIOR MANAGER
91007	10548986	10107712	Project Procurement Raw Material	GANDHI	 PRATHMESH	PRAFULLA	EXECUTIVE
91009	10489384	10109804	SMB Project Execution 	BABHRE	AJAY	P.	GENERAL MANAGER
91008	10489383	10109804	SMB Project Execution 	JYOTHI	BASWANTH	T.	MANAGER
\.


--
-- Data for Name: usarl; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usarl (usarl_id, user_id, usrl_id) FROM stdin;
401	100001	301
402	100002	303
403	100003	302
404	100004	304
405	100005	304
406	100006	304
407	100007	304
408	100008	304
409	100009	304
410	100010	304
411	100011	304
412	100012	304
413	100013	304
414	100014	304
415	100015	304
416	100016	304
417	100017	304
418	100018	304
419	100019	304
420	100020	304
421	100021	304
422	100022	304
423	100023	304
424	100024	304
425	100025	304
426	100026	304
427	100027	304
428	100028	304
429	100029	304
430	100030	304
431	100031	304
432	100032	304
433	100033	304
434	100034	304
435	100035	304
436	100036	304
437	100037	304
438	100038	304
439	100039	304
440	100040	304
441	100041	304
442	100042	304
443	100043	304
444	100044	304
445	100045	304
446	100046	304
447	100047	304
448	100048	304
449	100049	304
450	100050	304
451	100051	304
452	100052	304
453	100053	304
454	100054	304
455	100055	304
456	100056	304
457	100057	304
458	100058	304
459	100059	304
460	100060	304
461	100061	304
462	100062	304
463	100063	304
464	100064	304
465	100065	304
466	100066	304
467	100067	304
468	100068	304
469	100069	304
470	100070	304
471	100071	304
472	100072	304
473	100073	304
474	100074	304
475	100075	304
476	100076	304
477	100077	304
478	100078	304
479	100079	304
480	100080	304
481	100081	304
482	100082	304
483	100083	304
484	100084	304
485	100085	304
486	100086	304
487	100087	304
488	100088	304
489	100089	304
490	100090	304
491	100091	304
492	100092	304
493	100093	304
494	100094	304
495	100095	304
496	100096	304
497	100097	304
498	100098	304
499	100099	304
500	100100	304
501	100101	304
502	100102	304
503	100103	304
504	100104	304
505	100105	304
506	100106	304
507	100107	304
508	100108	304
509	100109	304
510	100110	304
511	100111	304
512	100112	304
513	100113	304
514	100114	304
515	100115	304
516	100116	304
517	100117	304
518	100118	304
519	100119	304
520	100120	304
521	100121	304
522	100122	304
523	100123	304
524	100124	304
525	100125	304
526	100126	304
527	100127	304
528	100128	304
529	100129	304
530	100130	304
531	100131	304
532	100132	304
533	100133	304
534	100134	304
535	100135	304
536	100136	304
537	100137	304
538	100138	304
539	100139	304
540	100140	304
541	100141	304
542	100142	304
543	100143	304
544	100144	304
545	100145	304
546	100146	304
547	100147	304
548	100148	304
549	100149	304
550	100150	304
551	100151	304
552	100152	304
553	100153	304
554	100154	304
555	100155	304
556	100156	304
557	100157	304
558	100158	304
559	100159	304
560	100160	304
561	100161	304
562	100162	304
563	100163	304
564	100164	304
565	100165	304
566	100166	304
567	100167	304
568	100168	304
569	100169	304
570	100170	304
571	100171	304
572	100172	304
573	100173	304
574	100174	304
575	100175	304
576	100176	304
577	100177	304
578	100178	304
579	100179	304
580	100180	304
581	100181	304
582	100182	304
583	100183	304
584	100184	304
585	100185	304
586	100186	304
587	100187	304
588	100188	304
589	100189	304
590	100190	304
591	100191	304
592	100192	304
593	100193	304
594	100194	304
595	100195	304
596	100196	304
597	100197	304
598	100198	304
599	100199	304
600	100200	304
601	100201	304
602	100202	304
603	100203	304
604	100204	304
605	100205	304
606	100206	304
607	100207	304
608	100208	304
609	100209	304
610	100210	304
611	100211	304
612	100212	304
613	100213	304
614	100214	304
615	100215	304
616	100216	304
617	100217	304
618	100218	304
619	100219	304
620	100220	304
621	100221	304
622	100222	304
623	100223	304
624	100224	304
625	100225	304
626	100226	304
627	100227	304
628	100228	304
629	100229	304
630	100230	304
631	100231	304
632	100232	304
633	100233	304
634	100234	304
635	100235	304
636	100236	304
637	100237	304
638	100238	304
639	100239	304
640	100240	304
641	100241	304
642	100242	304
643	100243	304
644	100244	304
645	100245	304
646	100246	304
647	100247	304
648	100248	304
649	100249	304
650	100250	304
651	100251	304
652	100252	304
653	100253	304
654	100254	304
655	100255	304
656	100256	304
657	100257	304
658	100258	304
659	100259	304
660	100260	304
661	100261	304
662	100262	304
663	100263	304
664	100264	304
665	100265	304
666	100266	304
667	100267	304
668	100268	304
669	100269	304
670	100270	304
671	100271	304
672	100272	304
673	100273	304
674	100274	304
675	100275	304
676	100276	304
677	100277	304
678	100278	304
679	100279	304
680	100280	304
681	100281	304
682	100282	304
683	100283	304
684	100284	304
685	100285	304
686	100286	304
687	100287	304
688	100288	304
689	100289	304
690	100290	304
691	100291	304
692	100292	304
693	100293	304
694	100294	304
695	100295	304
696	100296	304
697	100297	304
698	100298	304
699	100299	304
700	100300	304
701	100301	304
702	100302	304
703	100303	304
704	100304	304
705	100305	304
706	100306	304
707	100307	304
708	100308	304
709	100309	304
710	100310	304
711	100311	304
712	100312	304
713	100313	304
714	100314	304
715	100315	304
716	100316	304
717	100317	304
718	100318	304
719	100319	304
720	100320	304
721	100321	304
722	100322	304
723	100323	304
724	100324	304
725	100325	304
726	100326	304
727	100327	304
728	100328	304
729	100329	304
730	100330	304
731	100331	304
732	100332	304
733	100333	304
734	100334	304
735	100335	304
736	100336	304
737	100337	304
738	100338	304
739	100339	304
740	100340	304
741	100341	304
742	100342	304
743	100343	304
744	100344	304
745	100345	304
746	100346	304
747	100347	304
748	100348	304
749	100349	304
750	100350	304
751	100351	304
752	100352	304
753	100353	304
754	100354	304
755	100355	304
756	100356	304
757	100357	304
758	100358	304
759	100359	304
760	100360	304
761	100361	304
762	100362	304
763	100363	304
764	100364	304
765	100365	304
766	100366	304
767	100367	304
768	100368	304
769	100369	304
770	100370	304
771	100371	304
772	100372	304
773	100373	304
774	100374	304
775	100375	304
776	100376	304
777	100377	304
778	100378	304
779	100379	304
780	100380	304
781	100381	304
782	100382	304
783	100383	304
784	100384	304
785	100385	304
786	100386	304
787	100387	304
788	100388	304
789	100389	304
790	100390	304
791	100391	304
792	100392	304
793	100393	304
794	100394	304
795	100395	304
796	100396	304
797	100397	304
798	100398	304
799	100399	304
800	100400	304
801	100401	304
802	100402	304
803	100403	304
804	100404	304
805	100405	304
806	100406	304
807	100407	304
808	100408	304
809	100409	304
810	100410	304
811	100411	304
812	100412	304
813	100413	304
814	100414	304
815	100415	304
816	100416	304
817	100417	304
818	100418	304
819	100419	304
820	100420	304
821	100421	304
822	100422	304
823	100423	304
824	100424	304
825	100425	304
826	100426	304
827	100427	304
828	100428	304
829	100429	304
830	100430	304
831	100431	304
832	100432	304
833	100433	304
834	100434	304
835	100435	304
836	100436	304
837	100437	304
838	100438	304
839	100439	304
840	100440	304
841	100441	304
842	100442	304
843	100443	304
844	100444	304
845	100445	304
846	100446	304
847	100447	304
848	100448	304
849	100449	304
850	100450	304
851	100451	304
852	100452	304
853	100453	304
854	100454	304
855	100455	304
856	100456	304
857	100457	304
858	100458	304
859	100459	304
860	100460	304
861	100461	304
862	100462	304
863	100463	304
864	100464	304
865	100465	304
866	100466	304
867	100467	304
868	100468	304
869	100469	304
870	100470	304
871	100471	304
872	100472	304
873	100473	304
874	100474	304
875	100475	304
876	100476	304
877	100477	304
878	100478	304
879	100479	304
880	100480	304
881	100481	304
882	100482	304
883	100483	304
884	100484	304
885	100485	304
886	100486	304
887	100487	304
888	100488	304
889	100489	304
890	100490	304
891	100491	304
892	100492	304
893	100493	304
894	100494	304
895	100495	304
896	100496	304
897	100497	304
898	100498	304
899	100499	304
900	100500	304
901	100501	304
902	100502	304
903	100503	304
904	100504	304
905	100505	304
906	100506	304
907	100507	304
908	100508	304
909	100509	304
910	100510	304
911	100511	304
912	100512	304
913	100513	304
914	100514	304
915	100515	304
916	100516	304
917	100517	304
918	100518	304
919	100519	304
920	100520	304
921	100521	304
922	100522	304
923	100523	304
924	100524	304
925	100525	304
926	100526	304
927	100527	304
928	100528	304
929	100529	304
930	100530	304
931	100531	304
932	100532	304
933	100533	304
934	100534	304
935	100535	304
936	100536	304
937	100537	304
938	100538	304
939	100539	304
940	100540	304
941	100541	304
942	100542	304
943	100543	304
944	100544	304
945	100545	304
946	100546	304
947	100547	304
948	100548	304
949	100549	304
950	100550	304
951	100551	304
952	100552	304
953	100553	304
954	100554	304
955	100555	304
956	100556	304
957	100557	304
958	100558	304
959	100559	304
960	100560	304
961	100561	304
962	100562	304
963	100563	304
964	100564	304
965	100565	304
966	100566	304
967	100567	304
968	100568	304
969	100569	304
970	100570	304
971	100571	304
972	100572	304
973	100573	304
974	100574	304
975	100575	304
976	100576	304
977	100577	304
978	100578	304
979	100579	304
980	100580	304
981	100581	304
982	100582	304
983	100583	304
984	100584	304
985	100585	304
986	100586	304
987	100587	304
988	100588	304
989	100589	304
990	100590	304
991	100591	304
992	100592	304
993	100593	304
994	100594	304
995	100595	304
996	100596	304
997	100597	304
998	100598	304
999	100599	304
1000	100600	304
1001	100601	304
1002	100602	304
1003	100603	304
1004	100604	304
1005	100605	304
1006	100606	304
1007	100607	304
1008	100608	304
1009	100609	304
1010	100610	304
1011	100611	304
1012	100612	304
1013	100613	304
1014	100614	304
1015	100615	304
1016	100616	304
1017	100617	304
1018	100618	304
1019	100619	304
1020	100620	304
1021	100621	304
1022	100622	304
1023	100623	304
1024	100624	304
1025	100625	304
1026	100626	304
1027	100627	304
1028	100628	304
1029	100629	304
1030	100630	304
1031	100631	304
1032	100632	304
1033	100633	304
1034	100634	304
1035	100635	304
1036	100636	304
1037	100637	304
1038	100638	304
1039	100639	304
1040	100640	304
1041	100641	304
1042	100642	304
1043	100643	304
1044	100644	304
1045	100645	304
1046	100646	304
1047	100647	304
1048	100648	304
1049	100649	304
1050	100650	304
1051	100651	304
1052	100652	304
1053	100653	304
1054	100654	304
1055	100655	304
1056	100656	304
1057	100657	304
1058	100658	304
1059	100659	304
1060	100660	304
1061	100661	304
1062	100662	304
1063	100663	304
1064	100664	304
1065	100665	304
1066	100666	304
1067	100667	304
1068	100668	304
1069	100669	304
1070	100670	304
1071	100671	304
1072	100672	304
1073	100673	304
1074	100674	304
1075	100675	304
1076	100676	304
1077	100677	304
1078	100678	304
1079	100679	304
1080	100680	304
1081	100681	304
1082	100682	304
1083	100683	304
1084	100684	304
1085	100685	304
1086	100686	304
1087	100687	304
1088	100688	304
1089	100689	304
1090	100690	304
1091	100691	304
1092	100692	304
1093	100693	304
1094	100694	304
1095	100695	304
1096	100696	304
1097	100697	304
1098	100698	304
1099	100699	304
1100	100700	304
1101	100701	304
1102	100702	304
1103	100703	304
1104	100704	304
1105	100705	304
1106	100706	304
1107	100707	304
1108	100708	304
1109	100709	304
1110	100710	304
1111	100711	304
1112	100712	304
1113	100713	304
1114	100714	304
1115	100715	304
1116	100716	304
1117	100717	304
1118	100718	304
1119	100719	304
1120	100720	304
1121	100721	304
1122	100722	304
1123	100723	304
1124	100724	304
1125	100725	304
1126	100726	304
1127	100727	304
1128	100728	304
1129	100729	304
1130	100730	304
1131	100731	304
1132	100732	304
1133	100733	304
1134	100734	304
1135	100735	304
1136	100736	304
1137	100737	304
1138	100738	304
1139	100739	304
1140	100740	304
1141	100741	304
1142	100742	304
1143	100743	304
1144	100744	304
1145	100745	304
1146	100746	304
1147	100747	304
1148	100748	304
1149	100749	304
1150	100750	304
1151	100751	304
1152	100752	304
1153	100753	304
1154	100754	304
1155	100755	304
1156	100756	304
1157	100757	304
1158	100758	304
1159	100759	304
1160	100760	304
1161	100761	304
1162	100762	304
1163	100763	304
1164	100764	304
1165	100765	304
1166	100766	304
1167	100767	304
1168	100768	304
1169	100769	304
1170	100770	304
1171	100771	304
1172	100772	304
1173	100773	304
1174	100774	304
1175	100775	304
1176	100776	304
1177	100777	304
1178	100778	304
1179	100779	304
1180	100780	304
1181	100781	304
1182	100782	304
1183	100783	304
1184	100784	304
1185	100785	304
1186	100786	304
1187	100787	304
1188	100788	304
1189	100789	304
1190	100790	304
1191	100791	304
1192	100792	304
1193	100793	304
1194	100794	304
1195	100795	304
1196	100796	304
1197	100797	304
1198	100798	304
1199	100799	304
1200	100800	304
1201	100801	304
1202	100802	304
1203	100803	304
1204	100804	304
1205	100805	304
1206	100806	304
1207	100807	304
1208	100808	304
1209	100809	304
1210	100810	304
1211	100811	304
1212	100812	304
1213	100813	304
1214	100814	304
1215	100815	304
1216	100816	304
1217	100817	304
1218	100818	304
1219	100819	304
1220	100820	304
1221	100821	304
1222	100822	304
1223	100823	304
1224	100824	304
1225	100825	304
1226	100826	304
1227	100827	304
1228	100828	304
1229	100829	304
1230	100830	304
1231	100831	304
1232	100832	304
1233	100833	304
1234	100834	304
1235	100835	304
1236	100836	304
1237	100837	304
1238	100838	304
1239	100839	304
1240	100840	304
1241	100841	304
1242	100842	304
1243	100843	304
1244	100844	304
1245	100845	304
1246	100846	304
1247	100847	304
1248	100848	304
1249	100849	304
1250	100850	304
1251	100851	304
1252	100852	304
1253	100853	304
1254	100854	304
1255	100855	304
1256	100856	304
1257	100857	304
1258	100858	304
1259	100859	304
1260	100860	304
1261	100861	304
1262	100862	304
1263	100863	304
1264	100864	304
1265	100865	304
1266	100866	304
1267	100867	304
1268	100868	304
1269	100869	304
1270	100870	304
1271	100871	304
1272	100872	304
1273	100873	304
1274	100874	304
1275	100875	304
1276	100876	304
1277	100877	304
1278	100878	304
1279	100879	304
1280	100880	304
1281	100881	304
1282	100882	304
1283	100883	304
1284	100884	304
1285	100885	304
1286	100886	304
1287	100887	304
1288	100888	304
1289	100889	304
1290	100890	304
1291	100891	304
1292	100892	304
1293	100893	304
1294	100894	304
1295	100895	304
1296	100896	304
1297	100897	304
1298	100898	304
1299	100899	304
1300	100900	304
1301	100901	304
1302	100902	304
1303	100903	304
1304	100904	304
1305	100905	304
1306	100906	304
1307	100907	304
1308	100908	304
1309	100909	304
1310	100910	304
1311	100911	304
1312	100912	304
1313	100913	304
1314	100914	304
1315	100915	304
1316	100916	304
1317	100917	304
1318	100918	304
1319	100919	304
1320	100920	304
1321	100921	304
1322	100922	304
1323	100923	304
1324	100924	304
1325	100925	304
1326	100926	304
1327	100927	304
1328	100928	304
1329	100929	304
1330	100930	304
1331	100931	304
1332	100932	304
1333	100933	304
1334	100934	304
1335	100935	304
1336	100936	304
1337	100937	304
1338	100938	304
1339	100939	304
1340	100940	304
1341	100941	304
1342	100942	304
1343	100943	304
1344	100944	304
1345	100945	304
1346	100946	304
1347	100947	304
1348	100948	304
1350	100950	304
1351	100951	304
1352	100952	304
1353	100953	304
1354	100954	304
1355	100955	304
1356	100956	304
1357	100957	304
1358	100958	304
1359	100959	304
1360	100960	304
1361	100961	304
1362	100962	304
1363	100963	304
1364	100964	304
1365	100965	304
1366	100966	304
1367	100967	304
1368	100968	304
1369	100969	304
1370	100970	304
1371	100971	304
1372	100972	304
1373	100973	304
1374	100974	304
1375	100975	304
1376	100976	304
1377	100977	304
1378	100978	304
1379	100979	304
1380	100980	304
1381	100981	304
1382	100982	304
1383	100983	304
1384	100984	304
1385	100985	304
1386	100986	304
1387	100987	304
1388	100988	304
1389	100989	304
1390	100990	304
1391	100991	304
1392	100992	304
1393	100993	304
1394	100994	304
1395	100995	304
1396	100996	304
1397	100997	304
1398	100998	304
1399	100999	304
1400	101000	304
1401	101001	304
1402	101002	304
1403	101003	304
1404	101004	304
1405	101005	304
1406	101006	304
1407	101007	304
1408	101008	304
1409	101009	304
1410	101010	304
1411	101011	304
1412	101012	304
1413	101013	304
1414	101014	304
1415	101015	304
1416	101016	304
1417	101017	304
1418	101018	304
1419	101019	304
1420	101020	304
1421	101021	304
1422	101022	304
1423	101023	304
1424	101024	304
1425	101025	304
1426	101026	304
1428	101028	304
1429	101029	304
1430	101030	304
1431	101031	304
1432	101032	304
1433	101033	304
1434	101034	304
1435	101035	304
1436	101036	304
1437	101037	304
1438	101038	304
1439	101039	304
1440	101040	304
1441	101041	304
1442	101042	304
1443	101043	304
1444	101044	304
1445	101045	304
1446	101046	304
1447	101047	304
1448	101048	304
1449	101049	304
1450	101050	304
1451	101051	304
1452	101052	304
1453	101053	304
1454	101054	304
1455	101055	304
1456	101056	304
1457	101057	304
1458	101058	304
1459	101059	304
1460	101060	304
1461	101061	304
1462	101062	304
1463	101063	304
1464	101064	304
1465	101065	304
1466	101066	304
1467	101067	304
1468	101068	304
1469	101069	304
1470	101070	304
1471	101071	304
1472	101072	304
1473	101073	304
1474	101074	304
1475	101075	304
1476	101076	304
1477	101077	304
1478	101078	304
1479	101079	304
1480	101080	304
1481	101081	304
1482	101082	304
1483	101083	304
1484	101084	304
1485	101085	304
1486	101086	304
1487	101087	304
1488	101088	304
1489	101089	304
1490	101090	304
1491	101091	304
1492	101092	304
1493	101093	304
1494	101094	304
1495	101095	304
1496	101096	304
1497	101097	304
1498	101098	304
1499	101099	304
1500	101100	304
1501	101101	304
1502	101102	304
1503	101103	304
1504	101104	304
1505	101105	304
1506	101106	304
1508	101108	304
1509	101109	304
1510	101110	304
1511	101111	304
1512	101112	304
1513	101113	304
1514	101114	304
1515	101115	304
1516	101116	304
1517	101117	304
1518	101118	304
1519	101119	304
1520	101120	304
1521	101121	304
1522	101122	304
1523	101123	304
1524	101124	304
1525	101125	304
1526	101126	304
1527	101127	304
1528	101128	304
1529	101129	304
1530	101130	304
1531	101131	304
1532	101132	304
1533	101133	304
1534	101134	304
1535	101135	304
1536	101136	304
1537	101137	304
1538	101138	304
1539	101139	304
1540	101140	304
1541	101141	304
1542	101142	304
1543	101143	304
1544	101144	304
1545	101145	304
1546	101146	304
1547	101147	304
1548	101148	304
1549	101149	304
1550	101150	304
1551	101151	304
1553	101153	304
1555	101155	304
1556	101156	304
1557	101157	304
1558	101158	304
1559	101159	304
1560	101160	304
1561	101161	304
1562	101162	304
1563	101163	304
1564	101164	304
1565	101165	304
1566	101166	304
1567	101167	304
1568	101168	304
1569	101169	304
1570	101170	304
1571	101171	304
1572	101172	304
1573	101173	304
1574	101174	304
1575	101175	304
1576	101176	304
1577	101177	304
1578	101178	304
1579	101179	304
1580	101180	304
1581	101181	304
1582	101182	304
1583	101183	304
1584	101184	304
1585	101185	304
1586	101186	304
1587	101187	304
1588	101188	304
1589	101189	304
1590	101190	304
1591	101191	304
1592	101192	304
1593	101193	304
1594	101194	304
1595	101195	304
1596	101196	304
1597	101197	304
1598	101198	304
1599	101199	304
1600	101200	304
1601	101201	304
1602	101202	304
1603	101203	304
1604	101204	304
1605	101205	304
1606	101206	304
1607	101207	304
1608	101208	304
1609	101209	304
1610	101210	304
1611	101211	304
1612	101212	304
1613	101213	304
1614	101214	304
1615	101215	304
1616	101216	304
1617	101217	304
1618	101218	304
1619	101219	304
1620	101220	304
1621	101221	304
1622	101222	304
1623	101223	304
1624	101224	304
1625	101225	304
1626	101226	304
1627	101227	304
1628	101228	304
1629	101229	304
1630	101230	304
1631	101231	304
1632	101232	304
1633	101233	304
1634	101234	304
1635	101235	304
1636	101236	304
1637	101237	304
1638	101238	304
1639	101239	304
1640	101240	304
1641	101241	304
1642	101242	304
1643	101243	304
1644	101244	304
1645	101245	304
1646	101246	304
1647	101247	304
1648	101248	304
1649	101249	304
1650	101250	304
1651	101251	304
1652	101252	304
1653	101253	304
1654	101254	304
1655	101255	304
1656	101256	304
1657	101257	304
1658	101258	304
1659	101259	304
1660	101260	304
1661	101261	304
1662	101262	304
1663	101263	304
1664	101264	304
1665	101265	304
1666	101266	304
1667	101267	304
1668	101268	304
1669	101269	304
1670	101270	304
1671	101271	304
1672	101272	304
1673	101273	304
1674	101274	304
1675	101275	304
1676	101276	304
1677	101277	304
1678	101278	304
1679	101279	304
1680	101280	304
1681	101281	304
1682	101282	304
1683	101283	304
1684	101284	304
1685	101285	304
1686	101286	304
1687	101287	304
1688	101288	304
1689	101289	304
1690	101290	304
1691	101291	304
1692	101292	304
1693	101293	304
1694	101294	304
1695	101295	304
1696	101296	304
1697	101297	304
1698	101298	304
1699	101299	304
1700	101300	304
1701	101301	304
1702	101302	304
1703	101303	304
1704	101304	304
1705	101305	304
1706	101306	304
1707	101307	304
1708	101308	304
1709	101309	304
1710	101310	304
1711	101311	304
1712	101312	304
1713	101313	304
1714	101314	304
1715	101315	304
1716	101316	304
1717	101317	304
1718	101318	304
1719	101319	304
1720	101320	304
1721	101321	304
1722	101322	304
1723	101323	304
1724	101324	304
1725	101325	304
1726	101326	304
1727	101327	304
1728	101328	304
1729	101329	304
1730	101330	304
1731	101331	304
1732	101332	304
1733	101333	304
1734	101334	304
1735	101335	304
1736	101336	304
1737	101337	304
1738	101338	304
1739	101339	304
1740	101340	304
1741	101341	304
1742	101342	304
1743	101343	304
1744	101344	304
1745	101345	304
1746	101346	304
1747	101347	304
1748	101348	304
1749	101349	304
1750	101350	304
1751	101351	304
1752	101352	304
1753	101353	304
1754	101354	304
1755	101355	304
1756	101356	304
1757	101357	304
1758	101358	304
1759	101359	304
1760	101360	304
1761	101361	304
1762	101362	304
1763	101363	304
1764	101364	304
1765	101365	304
1766	101366	304
1767	101367	304
1768	101368	304
1769	101369	304
1770	101370	304
1771	101371	304
1772	101372	304
1773	101373	304
1774	101374	304
1775	101375	304
1776	101376	304
1777	101377	304
1778	101378	304
1779	101379	304
1780	101380	304
1781	101381	304
1782	101382	304
1783	101383	304
1784	101384	304
1785	101385	304
1786	101386	304
1787	101387	304
1788	101388	304
1789	101389	304
1790	101390	304
1791	101391	304
1792	101392	304
1793	101393	304
1794	101394	304
1795	101395	304
1796	101396	304
1797	101397	304
1798	101398	304
1799	101399	304
1800	101400	304
1801	101401	304
1802	101402	304
1803	101403	304
1804	101404	304
1805	101405	304
1806	101406	304
1807	101407	304
1808	101408	304
1809	101409	304
1810	101410	304
1811	101411	304
1812	101412	304
1813	101413	304
1814	101414	304
1815	101415	304
1816	101416	304
1817	101417	304
1818	101418	304
1819	101419	304
1820	101420	304
1821	101421	304
1822	101422	304
1823	101423	304
1824	101424	304
1825	101425	304
1826	101426	304
1827	101427	304
1828	101428	304
1829	101429	304
1830	101430	304
1831	101431	304
1832	101432	304
1833	101433	304
1834	101434	304
1835	101435	304
1836	101436	304
1837	101437	304
1838	101438	304
1839	101439	304
1840	101440	304
1841	101441	304
1842	101442	304
1843	101443	304
1844	101444	304
1845	101445	304
1846	101446	304
1847	101447	304
1848	101448	304
1849	101449	304
1850	101450	304
1851	101451	304
1852	101452	304
1853	101453	304
1854	101454	304
1855	101455	304
1856	101456	304
1857	101457	304
1858	101458	304
1859	101459	304
1860	101460	304
1861	101461	304
1862	101462	304
1863	101463	304
1864	101464	304
1865	101465	304
1866	101466	304
1867	101467	304
1868	101468	304
1869	101469	304
1870	101470	304
1871	101471	304
1872	101472	304
1873	101473	304
1874	101474	304
1875	101475	304
1876	101476	304
1877	101477	304
1878	101478	304
1879	101479	304
1880	101480	304
1881	101481	304
1882	101482	304
1883	101483	304
1884	101484	304
1885	101485	304
1886	101486	304
1887	101487	304
1888	101488	304
1889	101489	304
1890	101490	304
1891	101491	304
1892	101492	304
1893	101493	304
1894	101494	304
1895	101495	304
1896	101496	304
1897	101497	304
1898	101498	304
1899	101499	304
1900	101500	304
1901	101501	304
1902	101502	304
1903	101503	304
1904	101504	304
1905	101505	304
1906	101506	304
1907	101507	304
1908	101508	304
1909	101509	304
1910	101510	304
1911	101511	304
1912	101512	304
1913	101513	304
1914	101514	304
1915	101515	304
1916	101516	304
1917	101517	304
1918	101518	304
1919	101519	304
1920	101520	304
1921	101521	304
1922	101522	304
1923	101523	304
1924	101524	304
1925	101525	304
1926	101526	304
1927	101527	304
1928	101528	304
1929	101529	304
1930	101530	304
1931	101531	304
1932	101532	304
1933	101533	304
1934	101534	304
1935	101535	304
1936	101536	304
1937	101537	304
1938	101538	304
1939	101539	304
1940	101540	304
1941	101541	304
1942	101542	304
1943	101543	304
1944	101544	304
1945	101545	304
1946	101546	304
1947	101547	304
1948	101548	304
1949	101549	304
1950	101550	304
1951	101551	304
1952	101552	304
1953	101553	304
1954	101554	304
1955	101555	304
1956	101556	304
1957	101557	304
1958	101558	304
1959	101559	304
1960	101560	304
1961	101561	304
1962	101562	304
1963	101563	304
1964	101564	304
1965	101565	304
1966	101566	304
1967	101567	304
1968	101568	304
1969	101569	304
1970	101570	304
1971	101571	304
1972	101572	304
1973	101573	304
1974	101574	304
1975	101575	304
1976	101576	304
1977	101577	304
1978	101578	304
1979	101579	304
1980	101580	304
1981	101581	304
1982	101582	304
1983	101583	304
1984	101584	304
1985	101585	304
1986	101586	304
1987	101587	304
1988	101588	304
1989	101589	304
1990	101590	304
1991	101591	304
1992	101592	304
1993	101593	304
1994	101594	304
1995	101595	304
1996	101596	304
1997	101597	304
1998	101598	304
1999	101599	304
2000	101600	304
2001	101601	304
2002	101602	304
2003	101603	304
2004	101604	304
2005	101605	304
2006	101606	304
2007	101607	304
2008	101608	304
2009	101609	304
2010	101610	304
2011	101611	304
2012	101612	304
2013	101613	304
2014	101614	304
2015	101615	304
2016	101616	304
2017	101617	304
2018	101618	304
2019	101619	304
2020	101620	304
2021	101621	304
2022	101622	304
2023	101623	304
2024	101624	304
2025	101625	304
2026	101626	304
2027	101627	304
2028	101628	304
2029	101629	304
2030	101630	304
2031	101631	304
2032	101632	304
2033	101633	304
2034	101634	304
2035	101635	304
2036	101636	304
2037	101637	304
2038	101638	304
2039	101639	304
2040	101640	304
2041	101641	304
2042	101642	304
2043	101643	304
2044	101644	304
2045	101645	304
2046	101646	304
2047	101647	304
2048	101648	304
2049	101649	304
2050	101650	304
2051	101651	304
2052	101652	304
2053	101653	304
2054	101654	304
2055	101655	304
2056	101656	304
2057	101657	304
2058	101658	304
2059	101659	304
2060	101660	304
2061	101661	304
2062	101662	304
2063	101663	304
2064	101664	304
2065	101665	304
2066	101666	304
2067	101667	304
2068	101668	304
2069	101669	304
2070	101670	304
2071	101671	304
2072	101672	304
2073	101673	304
2074	101674	304
2075	101675	304
2076	101676	304
2077	101677	304
2078	101678	304
2079	101679	304
2080	101680	304
2081	101681	304
2082	101682	304
2083	101683	304
2084	101684	304
2085	101685	304
2086	101686	304
2087	101687	304
2088	101688	304
2089	101689	304
2090	101690	304
2091	101691	304
2092	101692	304
2093	101693	304
2094	101694	304
2095	101695	304
2096	101696	304
2097	101697	304
2098	101698	304
2099	101699	304
2100	101700	304
2101	101701	304
2102	101702	304
2103	101703	304
2104	101704	304
2105	101705	304
2106	101706	304
2107	101707	304
2108	101708	304
2109	101709	304
2110	101710	304
2111	101711	304
2112	101712	304
2113	101713	304
2114	101714	304
2115	101715	304
2116	101716	304
2117	101717	304
2118	101718	304
2119	101719	304
2120	101720	304
2121	101721	304
2122	101722	304
2123	101723	304
2124	101724	304
2125	101725	304
2126	101726	304
2127	101727	304
2128	101728	304
2129	101729	304
2130	101730	304
2131	101731	304
2132	101732	304
2133	101733	304
2134	101734	304
2135	101735	304
2136	101736	304
2137	101737	304
2138	101738	304
2139	101739	304
2140	101740	304
2141	101741	304
2142	101742	304
2143	101743	304
2144	101744	304
2145	101745	304
2146	101746	304
2147	101747	304
2148	101748	304
2149	101749	304
2150	101750	304
2151	101751	304
2152	101752	304
2153	101753	304
2154	101754	304
2155	101755	304
2156	101756	304
2157	101757	304
2158	101758	304
2159	101759	304
2160	101760	304
2161	101761	304
2162	101762	304
2163	101763	304
2164	101764	304
2165	101765	304
2166	101766	304
2167	101767	304
2168	101768	304
2169	101769	304
2170	101770	304
2171	101771	304
2172	101772	304
2173	101773	304
2174	101774	304
2175	101775	304
2176	101776	304
2177	101777	304
2178	101778	304
2179	101779	304
2180	101780	304
2181	101781	304
2182	101782	304
2183	101783	304
2184	101784	304
2185	101785	304
2186	101786	304
2187	101787	304
2188	101788	304
2189	101789	304
2190	101790	304
2191	101791	304
2192	101792	304
2193	101793	304
2194	101794	304
2195	101795	304
2196	101796	304
2197	101797	304
2198	101798	304
2199	101799	304
2200	101800	304
2201	101801	304
2202	101802	304
2203	101803	304
2204	101804	304
2205	101805	304
2206	101806	304
2207	101807	304
2208	101808	304
2209	101809	304
2210	101810	304
2211	101811	304
2212	101812	304
2213	101813	304
2214	101814	304
2215	101815	304
2216	101816	304
2217	101817	304
2218	101818	304
2219	101819	304
2220	101820	304
2221	101821	304
2222	101822	304
2223	101823	304
2224	101824	304
2225	101825	304
2226	101826	304
2227	101827	304
2228	101828	304
2229	101829	304
2230	101830	304
2231	101831	304
2232	101832	304
2233	101833	304
2234	101834	304
2235	101835	304
2236	101836	304
2237	101837	304
2238	101838	304
2239	101839	304
2240	101840	304
2241	101841	304
2242	101842	304
2243	101843	304
2244	101844	304
2245	101845	304
2246	101846	304
2247	101847	304
2248	101848	304
2249	101849	304
2250	101850	304
2251	101851	304
2252	101852	304
2253	101853	304
2254	101854	304
2255	101855	304
2256	101856	304
2257	101857	304
2258	101858	304
2259	101859	304
2260	101860	304
2261	101861	304
2262	101862	304
2263	101863	304
2264	101864	304
2265	101865	304
2266	101866	304
2267	101867	304
2268	101868	304
2269	101869	304
2270	101870	304
2271	101871	304
2272	101872	304
2273	101873	304
2274	101874	304
2275	101875	304
2276	101876	304
2277	101877	304
2278	101878	304
2279	101879	304
2280	101880	304
2281	101881	304
2282	101882	304
2283	101883	304
2284	101884	304
2285	101885	304
2286	101886	304
2287	101887	304
2288	101888	304
2289	101889	304
2290	101890	304
2291	101891	304
2292	101892	304
2293	101893	304
2294	101894	304
2295	101895	304
2296	101896	304
2297	101897	304
2298	101898	304
2299	101899	304
2300	101900	304
2301	101901	304
2302	101902	304
2303	101903	304
2304	101904	304
2305	101905	304
2306	101906	304
2307	101907	304
2308	101908	304
2309	101909	304
2310	101910	304
2311	101911	304
2312	101912	304
2313	101913	304
2314	101914	304
2315	101915	304
2316	101916	304
2317	101917	304
2318	101918	304
2319	101919	304
2320	101920	304
2321	101921	304
2322	101922	304
2323	101923	304
2324	101924	304
2325	101925	304
2326	101926	304
2327	101927	304
2328	101928	304
2329	101929	304
2330	101930	304
2331	101931	304
2332	101932	304
2333	101933	304
2334	101934	304
2335	101935	304
2336	101936	304
2337	101937	304
2338	101938	304
2339	101939	304
2340	101940	304
2341	101941	304
2342	101942	304
2343	101943	304
2344	101944	304
2345	101945	304
2346	101946	304
2347	101947	304
2348	101948	304
2349	101949	304
2350	101950	304
2351	101951	304
2352	101952	304
2353	101953	304
2354	101954	304
2355	101955	304
2356	101956	304
2357	101957	304
2358	101958	304
2359	101959	304
2360	101960	304
2361	101961	304
2362	101962	304
2363	101963	304
2364	101964	304
2365	101965	304
2366	101966	304
2367	101967	304
2368	101968	304
2369	101969	304
2370	101970	304
2371	101971	304
2372	101972	304
2373	101973	304
2374	101974	304
2375	101975	304
2376	101976	304
2377	101977	304
2378	101978	304
2379	101979	304
2380	101980	304
2381	101981	304
2382	101982	304
2383	101983	304
2384	101984	304
2385	101985	304
2386	101986	304
2387	101987	304
2388	101988	304
2389	101989	304
2390	101990	304
2391	101991	304
2392	101992	304
2393	101993	304
2394	101994	304
2395	101995	304
2396	101996	304
2397	101997	304
2398	101998	304
2399	101999	304
2400	102000	304
2401	102001	304
2402	102002	304
2403	102003	304
2404	102004	304
2405	102005	304
2406	102006	304
2407	102007	304
2408	102008	304
2409	102009	304
2410	102010	304
2411	102011	304
2412	102012	304
2413	102013	304
2414	102014	304
2415	102015	304
2416	102016	304
2417	102017	304
2418	102018	304
2419	102019	304
2420	102020	304
2421	102021	304
2422	102022	304
2423	102023	304
2424	102024	304
2425	102025	304
2426	102026	304
2427	102027	304
2428	102028	304
2429	102029	304
2430	102030	304
2431	102031	304
2432	102032	304
2433	102033	304
2434	102034	304
2435	102035	304
2436	102036	304
2437	102037	304
2438	102038	304
2439	102039	304
2440	102040	304
2441	102041	304
2442	102042	304
2444	102044	304
2445	102045	304
2446	102046	304
2447	102047	304
2448	102048	304
2449	102049	304
2450	102050	304
2451	102051	304
2452	102052	304
2453	102053	304
2454	102054	304
2455	102055	304
2456	102056	304
2457	102057	304
2458	102058	304
2459	102059	304
2460	102060	304
2461	102061	304
2462	102062	304
2463	102063	304
2464	102064	304
2465	102065	304
2466	102066	304
2467	102067	304
2468	102068	304
2469	102069	304
2470	102070	304
2471	102071	304
2472	102072	304
2473	102073	304
2474	102074	304
2475	102075	304
2476	102076	304
2477	102077	304
2478	102078	304
2479	102079	304
2480	102080	304
2481	102081	304
2482	102082	304
2483	102083	304
2484	102084	304
2485	102085	304
2486	102086	304
2487	102087	304
2488	102088	304
2489	102089	304
2490	102090	304
2491	102091	304
2492	102092	304
2493	102093	304
2494	102094	304
2495	102095	304
2496	102096	304
2497	102097	304
2498	102098	304
2499	102099	304
2500	102100	304
2501	102101	304
2502	102102	304
2503	102103	304
2504	102104	304
2505	102105	304
2506	102106	304
2507	102107	304
2508	102108	304
2509	102109	304
2510	102110	304
2511	102111	304
2512	102112	304
2513	102113	304
2514	102114	304
2515	102115	304
2516	102116	304
2517	102117	304
2518	102118	304
2519	102119	304
2520	102120	304
2521	102121	304
2522	102122	304
2523	102123	304
2524	102124	304
2525	102125	304
2526	102126	304
2527	102127	304
2528	102128	304
2529	102129	304
2530	102130	304
2531	102131	304
2532	102132	304
2533	102133	304
2534	102134	304
2535	102135	304
2536	102136	304
2537	102137	304
2538	102138	304
2539	102139	304
2540	102140	304
2541	102141	304
2542	102142	304
2543	102143	304
2544	102144	304
2545	102145	304
2546	102146	304
2547	102147	304
2548	102148	304
2549	102149	304
2550	102150	304
2551	102151	304
2552	102152	304
2553	102153	304
2554	102154	304
2555	102155	304
2556	102156	304
2557	102157	304
2558	102158	304
2559	102159	304
2560	102160	304
2561	102161	304
2562	102162	304
2563	102163	304
2564	102164	304
2565	102165	304
2566	102166	304
2567	102167	304
2568	102168	304
2569	102169	304
2570	102170	304
2571	102171	304
2572	102172	304
2573	102173	304
2574	102174	304
2575	102175	304
2576	102176	304
2577	102177	304
2578	102178	304
2579	102179	304
2580	102180	304
2581	102181	304
2582	102182	304
2583	102183	304
2584	102184	304
2585	102185	304
2586	102186	304
2587	102187	304
2588	102188	304
2589	102189	304
2590	102190	304
2591	102191	304
2592	102192	304
2593	102193	304
2594	102194	304
2595	102195	304
2596	102196	304
2597	102197	304
2598	102198	304
2599	102199	304
2600	102200	304
2601	102201	304
2602	102202	304
2603	102203	304
2604	102204	304
2605	102205	304
2606	102206	304
2607	102207	304
2608	102208	304
2609	102209	304
2610	102210	304
2611	102211	304
2612	102212	304
2613	102213	304
2614	102214	304
2615	102215	304
2616	102216	304
2617	102217	304
2618	102218	304
2619	102219	304
2620	102220	304
2621	102221	304
2622	102222	304
2623	102223	304
2624	102224	304
2625	102225	304
2626	102226	304
2627	102227	304
2628	102228	304
2629	102229	304
2630	102230	304
2631	102231	304
2632	102232	304
2633	102233	304
2634	102234	304
2635	102235	304
2636	102236	304
2637	102237	304
2638	102238	304
2639	102239	304
2640	102240	304
2641	102241	304
2642	102242	304
2643	102243	304
2644	102244	304
2645	102245	304
2646	102246	304
2647	102247	304
2648	102248	304
2649	102249	304
2650	102250	304
2651	102251	304
2652	102252	304
2653	102253	304
2654	102254	304
2655	102255	304
2656	102256	304
2657	102257	304
2658	102258	304
2659	102259	304
2660	102260	304
2661	102261	304
2662	102262	304
2663	102263	304
2664	102264	304
2665	102265	304
2666	102266	304
2667	102267	304
2668	102268	304
2669	102269	304
2670	102270	304
2671	102271	304
2672	102272	304
2673	102273	304
2674	102274	304
2675	102275	304
2676	102276	304
2677	102277	304
2678	102278	304
2679	102279	304
2680	102280	304
2681	102281	304
2682	102282	304
2683	102283	304
2684	102284	304
2685	102285	304
2686	102286	304
2687	102287	304
2688	102288	304
2689	102289	304
2690	102290	304
2691	102291	304
2692	102292	304
2693	102293	304
2694	102294	304
2695	102295	304
2696	102296	304
2697	102297	304
2698	102298	304
2699	102299	304
2700	102300	304
2701	102301	304
2702	102302	304
2703	102303	304
2704	102304	304
2705	102305	304
2706	102306	304
2707	102307	304
2708	102308	304
2709	102309	304
\.


--
-- Data for Name: usasg; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usasg (usasg_id, user_id, ussg_id) FROM stdin;
8001	100001	6001
8002	100003	6002
\.


--
-- Data for Name: usaug; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usaug (usaug_id, user_id, usug_id) FROM stdin;
9001	100004	7001
9002	100005	7001
\.


--
-- Data for Name: usc1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usc1 (usc1_id, eightid, empid, vipstatus) FROM stdin;
501	10212762	9464	VIP
502	\N	ORB001	\N
503	\N	90666	\N
504	TKII281120	TKII2811	General
\.


--
-- Data for Name: uscbld; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.uscbld (uscbld_id, building, floor) FROM stdin;
701	Cement	Ground
702	Cement	First
703	Cement	Second
704	Corporate	Ground
705	Corporate	First
706	Corporate	Second
707	Corporate	Third
\.


--
-- Data for Name: uscbr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.uscbr (uscbr_id, branch) FROM stdin;
601	PIMPRI
602	KOLKATA
\.


--
-- Data for Name: uscn; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.uscn (uscn_id, emailid, landline, mobile, web_url, res_phone) FROM stdin;
3001	admin@admin	9999988888	9999988888	admin.com	8888899999
3002	helpdesk@admin	\N	\N	\N	\N
3003	itsupport@admin	\N	\N	\N	\N
3004	enduser@admin	\N	\N	\N	\N
3005	rizwan@tkii.com	\N	\N	\N	\N
\.


--
-- Data for Name: uscorg; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.uscorg (uscorg_id, org) FROM stdin;
901	TKII
902	ORBIT
\.


--
-- Data for Name: uscre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.uscre (uscre_id, usre_id, uscorg_id, uscbr_id, uscbld_id, uscsec_id, usctit_id, usc1_id) FROM stdin;
1103	100004	901	601	707	802	1201	\N
\.


--
-- Data for Name: uscsec; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.uscsec (uscsec_id, scode) FROM stdin;
801	7902
802	9604
803	7805
\.


--
-- Data for Name: usctit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usctit (usctit_id, title) FROM stdin;
1201	MR.
1202	MRS.
1203	MISS.
\.


--
-- Data for Name: usdg; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usdg (usdg_id, designationname) FROM stdin;
4001	Administrator
4002	Software Engineer
\.


--
-- Data for Name: usdt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usdt (usdt_id, deptname, deptheadid, phoneno, fax, siteid, deptdesc) FROM stdin;
2003	Project Execution - Cement	\N	\N	\N	\N	\N
2002	T & IS MAINTENANCE OF SYSTEM	100001	9977788880	999988880	1	T & IS MAINTENANCE OF SYSTEM
2001	IT	100001	9977788888	999988888	1	IT Client Services
\.


--
-- Data for Name: uslg; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.uslg (login_id, user_id, name, status) FROM stdin;
200001	100001	Administrator	ACTIVE
200004	100004	enduser	ACTIVE
200002	100002	Helpdesk	ACTIVE
200003	100003	ITsupport	ACTIVE
200005	100005	RIZWAN	ACTIVE
200006	100006	AdsulS	ACTIVE
200007	100007	ChadhaA	ACTIVE
200008	100008	shitoles	ACTIVE
200009	100009	OakP	ACTIVE
200010	100010	PillaiR	ACTIVE
200011	100011	admin_se2	ACTIVE
200012	100012	TalnikarA	ACTIVE
200013	100013	GaikwadS	ACTIVE
200014	100014	KhandekarA	ACTIVE
200015	100015	KangarkarS	ACTIVE
200016	100016	RupnawarS	ACTIVE
200017	100017	JoshiR	ACTIVE
200018	100018	KambleSV	ACTIVE
200019	100019	GoleM	ACTIVE
200020	100020	AndoreA	ACTIVE
200021	100021	KiniA	ACTIVE
200022	100022	Patil_A	ACTIVE
200023	100023	GosaviO	ACTIVE
200024	100024	KumbharV	ACTIVE
200025	100025	ManthaleI	ACTIVE
200026	100026	BirareS	ACTIVE
200027	100027	WaghmareA	ACTIVE
200028	100028	GadiwaddR	ACTIVE
200029	100029	admin_se3	ACTIVE
200030	100030	DhanoreS	ACTIVE
200031	100031	BhosaleV	ACTIVE
200032	100032	KamblePG	ACTIVE
200033	100033	KodilkarS	ACTIVE
200034	100034	NagareA	ACTIVE
200035	100035	PotdarS	ACTIVE
200036	100036	WaniD	ACTIVE
200037	100037	ChoureSR	ACTIVE
200038	100038	VisputeN	ACTIVE
200039	100039	ChaudhariA	ACTIVE
200040	100040	KadamU	ACTIVE
200041	100041	KumbharSB	ACTIVE
200042	100042	TodkarS	ACTIVE
200043	100043	WadileV	ACTIVE
200044	100044	AliA	ACTIVE
200045	100045	KulkarniP	ACTIVE
200046	100046	KotnisS	ACTIVE
200047	100047	WaghP	ACTIVE
200048	100048	LambeS	ACTIVE
200049	100049	KharadeD	ACTIVE
200050	100050	GolwalkarA	ACTIVE
200051	100051	ManeV	ACTIVE
200052	100052	JadhavSD	ACTIVE
200053	100053	PatilMV	ACTIVE
200054	100054	Kulkarni_R	ACTIVE
200055	100055	DeshpandePP	ACTIVE
200056	100056	ShiroleK	ACTIVE
200057	100057	MoreD	ACTIVE
200058	100058	BuchakeV	ACTIVE
200059	100059	BorateV	ACTIVE
200060	100060	ButeD	ACTIVE
200061	100061	DhandeH	ACTIVE
200062	100062	PatilsK	ACTIVE
200063	100063	GodseA	ACTIVE
200064	100064	PujariS	ACTIVE
200065	100065	DholeD	ACTIVE
200066	100066	MokashiV	ACTIVE
200067	100067	deshpandeg	ACTIVE
200068	100068	ApetV	ACTIVE
200069	100069	BansudeG	ACTIVE
200070	100070	JagtapG	ACTIVE
200071	100071	VairatV	ACTIVE
200072	100072	VengaiM	ACTIVE
200073	100073	PujariSK	ACTIVE
200074	100074	SutarP	ACTIVE
200075	100075	BhaleraoP	ACTIVE
200076	100076	KoshtiA	ACTIVE
200077	100077	GangawaneY	ACTIVE
200078	100078	KulkarniNA	ACTIVE
200079	100079	JoshiA	ACTIVE
200080	100080	ShindeA	ACTIVE
200081	100081	KurmaK	ACTIVE
200082	100082	SandakaS	ACTIVE
200083	100083	ChouguleA	ACTIVE
200084	100084	MaraneN	ACTIVE
200085	100085	BorawakeN	ACTIVE
200086	100086	ShindeK	ACTIVE
200087	100087	PatilHV	ACTIVE
200088	100088	DegaonkarD	ACTIVE
200089	100089	NandaN	ACTIVE
200090	100090	PawarA	ACTIVE
200091	100091	BandreA	ACTIVE
200092	100092	KulkarniAR	ACTIVE
200093	100093	AhmedK	ACTIVE
200094	100094	WadghuleS	ACTIVE
200095	100095	AlurA	ACTIVE
200096	100096	ZambreS	ACTIVE
200097	100097	BekwadkarA	ACTIVE
200098	100098	MavadikarD	ACTIVE
200099	100099	GavadeS	ACTIVE
200100	100100	GawaliD	ACTIVE
200101	100101	KumbharSR	ACTIVE
200102	100102	KambleA	ACTIVE
200103	100103	KoliA	ACTIVE
200104	100104	JayaprakashCH	ACTIVE
200105	100105	PendseK	ACTIVE
200106	100106	SheteS	ACTIVE
200107	100107	DereS	ACTIVE
200108	100108	KothaleS	ACTIVE
200109	100109	DeshmukhSD	ACTIVE
200110	100110	KashidkarYV	ACTIVE
200111	100111	ChaudhariN	ACTIVE
200112	100112	KulkarniSB	ACTIVE
200113	100113	ChopadeS	ACTIVE
200114	100114	JadhavL	ACTIVE
200115	100115	BhosaleD	ACTIVE
200116	100116	ShirsathS	ACTIVE
200117	100117	KondawarR	ACTIVE
200118	100118	DeshmaneS	ACTIVE
200119	100119	DhanraleG	ACTIVE
200120	100120	LimjeJ	ACTIVE
200121	100121	KumbharS	ACTIVE
200122	100122	WaghmareAP	ACTIVE
200123	100123	ShindeVK	ACTIVE
200124	100124	ChavanS	ACTIVE
200125	100125	KamtheR	ACTIVE
200126	100126	LimbikaiC	ACTIVE
200127	100127	Patil_Y	ACTIVE
200128	100128	kambles	ACTIVE
200129	100129	KulkarniU	ACTIVE
200130	100130	KanherikarM	ACTIVE
200131	100131	PeshaveA	ACTIVE
200132	100132	BhosaleN	ACTIVE
200133	100133	MishraS	ACTIVE
200134	100134	MaratheM	ACTIVE
200135	100135	SakhardandeY	ACTIVE
200136	100136	TalathiS	ACTIVE
200137	100137	SaganeS	ACTIVE
200138	100138	SankpalS	ACTIVE
200139	100139	UndeU	ACTIVE
200140	100140	MisalSR	ACTIVE
200141	100141	PanditU	ACTIVE
200142	100142	PatekarS	ACTIVE
200143	100143	SavalgiS	ACTIVE
200144	100144	AzharuddinM	ACTIVE
200145	100145	AcharyaV	ACTIVE
200146	100146	singhn	ACTIVE
200147	100147	KakadeP	ACTIVE
200148	100148	YedewarP	ACTIVE
200149	100149	BhatadeS	ACTIVE
200150	100150	HalgekarS	ACTIVE
200151	100151	ParchureM	ACTIVE
200152	100152	DeshpandeA	ACTIVE
200153	100153	BhardwajS	ACTIVE
200154	100154	DadheS	ACTIVE
200155	100155	GangawaneT	ACTIVE
200156	100156	KarveM	ACTIVE
200157	100157	KhomaneV	ACTIVE
200158	100158	KumbharB	ACTIVE
200159	100159	NimbalkarJ	ACTIVE
200160	100160	PatilY	ACTIVE
200161	100161	PalaniP	ACTIVE
200162	100162	MullurR	ACTIVE
200163	100163	RawoolM	ACTIVE
200164	100164	SapkalS	ACTIVE
200165	100165	SasanapuriR	ACTIVE
200166	100166	UdapikarR	ACTIVE
200167	100167	PatilVL	ACTIVE
200168	100168	SambareP	ACTIVE
200169	100169	DhabiH	ACTIVE
200170	100170	TodkarM	ACTIVE
200171	100171	GawasS	ACTIVE
200172	100172	YelgeS	ACTIVE
200173	100173	ManeS	ACTIVE
200174	100174	PawarG	ACTIVE
200175	100175	ThayalanG	ACTIVE
200176	100176	ShevaleA	ACTIVE
200177	100177	GobburA	ACTIVE
200178	100178	Patil_P	ACTIVE
200179	100179	DcostaJ	ACTIVE
200180	100180	Shinde_R	ACTIVE
200181	100181	MhasudageD	ACTIVE
200182	100182	MendisX	ACTIVE
200183	100183	ParanjapeG	ACTIVE
200184	100184	JadhavR	ACTIVE
200185	100185	SurveD	ACTIVE
200186	100186	RanmodeA	ACTIVE
200187	100187	MohareS	ACTIVE
200188	100188	KambleAB	ACTIVE
200189	100189	KaleSD	ACTIVE
200190	100190	KshirsagarA	ACTIVE
200191	100191	JagadaleG	ACTIVE
200192	100192	NanavareN	ACTIVE
200193	100193	RajivanA	ACTIVE
200194	100194	GuravSK	ACTIVE
200195	100195	WakchaureSI	ACTIVE
200196	100196	NazirkarM	ACTIVE
200197	100197	ParkaleA	ACTIVE
200198	100198	NanekarS	ACTIVE
200199	100199	KambleK	ACTIVE
200200	100200	DeochakeK	ACTIVE
200201	100201	AbhyankarR	ACTIVE
200202	100202	DhokeN	ACTIVE
200203	100203	KhadeV	ACTIVE
200204	100204	DivakaranD	ACTIVE
200205	100205	KudteN	ACTIVE
200206	100206	PatilV	ACTIVE
200207	100207	SunkaraJ	ACTIVE
200208	100208	ChaudhariP	ACTIVE
200209	100209	BhambureA	ACTIVE
200210	100210	PatilKB	ACTIVE
200211	100211	KaleO	ACTIVE
200212	100212	GedelaK	ACTIVE
200213	100213	ChaudhariT	ACTIVE
200214	100214	IngleA	ACTIVE
200215	100215	PagaleA	ACTIVE
200216	100216	RaghunathR	ACTIVE
200217	100217	PradeepTV	ACTIVE
200218	100218	KumarT	ACTIVE
200219	100219	DuttaB	ACTIVE
200220	100220	ThajudheenA	ACTIVE
200221	100221	ChakravertyA	ACTIVE
200222	100222	ChakrabortiA	ACTIVE
200223	100223	SinghaS	ACTIVE
200224	100224	HodaS	ACTIVE
200225	100225	DasD	ACTIVE
200226	100226	ModakP	ACTIVE
200227	100227	RaoVV	ACTIVE
200228	100228	RaoSK	ACTIVE
200229	100229	RamuG	ACTIVE
200230	100230	SamuelM	ACTIVE
200231	100231	MurthyS	ACTIVE
200232	100232	VeeraR	ACTIVE
200233	100233	GuptaV	ACTIVE
200234	100234	KalyanV	ACTIVE
200235	100235	GopalG	ACTIVE
200236	100236	SyamsunderY	ACTIVE
200237	100237	SrinivasV	ACTIVE
200238	100238	SaratchandraT	ACTIVE
200239	100239	RavindranathB	ACTIVE
200240	100240	MuralikrishnaT	ACTIVE
200241	100241	RajeswaraR	ACTIVE
200242	100242	SinhaA	ACTIVE
200243	100243	Touchbaseadmin	ACTIVE
200244	100244	SureshkumarM	ACTIVE
200245	100245	ChandraC	ACTIVE
200246	100246	VenkateshwarluC	ACTIVE
200247	100247	Dassoumen	ACTIVE
200248	100248	SrikanthC	ACTIVE
200249	100249	KrishnaV	ACTIVE
200250	100250	SrinivasD	ACTIVE
200251	100251	ShankarshanP	ACTIVE
200252	100252	SrinivasuA	ACTIVE
200253	100253	MohankumarV	ACTIVE
200254	100254	SaikrishnamohanP	ACTIVE
200255	100255	AllapulaR	ACTIVE
200256	100256	RajeevA	ACTIVE
200257	100257	ReddyD	ACTIVE
200258	100258	ChakrabortyN	ACTIVE
200259	100259	BhattacharjeeD	ACTIVE
200260	100260	ShailajaS	ACTIVE
200261	100261	RamanujamR	ACTIVE
200262	100262	MohanJ	ACTIVE
200263	100263	MittalkodR	ACTIVE
200264	100264	BhanV	ACTIVE
200265	100265	NagindraS	ACTIVE
200266	100266	SenP	ACTIVE
200267	100267	DalalF	ACTIVE
200268	100268	PatelN	ACTIVE
200269	100269	SunderT	ACTIVE
200270	100270	SalaiS	ACTIVE
200271	100271	BabuS	ACTIVE
200272	100272	SrinivasN	ACTIVE
200273	100273	RamavinodhA	ACTIVE
200274	100274	ShobaK	ACTIVE
200275	100275	KulkarniAV	ACTIVE
200276	100276	KaleV	ACTIVE
200277	100277	SapkalN	ACTIVE
200278	100278	KobalS	ACTIVE
200279	100279	PatilMD	ACTIVE
200280	100280	ReddyH	ACTIVE
200281	100281	GaikwadA	ACTIVE
200282	100282	DongreG	ACTIVE
200283	100283	MishraPK	ACTIVE
200284	100284	MathewK	ACTIVE
200285	100285	PatilAS	ACTIVE
200286	100286	BhideS	ACTIVE
200287	100287	SuryawanshiP	ACTIVE
200288	100288	Chougule_A	ACTIVE
200289	100289	ChavanMS	ACTIVE
200290	100290	AgrawalP	ACTIVE
200291	100291	PillaiV	ACTIVE
200292	100292	RegistrarZ	ACTIVE
200293	100293	NavayathS	ACTIVE
200294	100294	WarkeU	ACTIVE
200295	100295	PanditaA	ACTIVE
200296	100296	BhatS	ACTIVE
200297	100297	NevseK	ACTIVE
200298	100298	PingeB	ACTIVE
200299	100299	ShaikhAR	ACTIVE
200300	100300	NaganeS	ACTIVE
200301	100301	BhasmeA	ACTIVE
200302	100302	KapdiM	ACTIVE
200303	100303	MondalAS	ACTIVE
200304	100304	GadekarR	ACTIVE
200305	100305	NilkanthS	ACTIVE
200306	100306	SolankeA	ACTIVE
200307	100307	NagpureP	ACTIVE
200308	100308	KhireS	ACTIVE
200309	100309	GagratZ	ACTIVE
200310	100310	AbhyankarA	ACTIVE
200311	100311	SharmaA	ACTIVE
200312	100312	BahduleK	ACTIVE
200313	100313	kulkarni_y	ACTIVE
200314	100314	HedgireS	ACTIVE
200315	100315	BhideAM	ACTIVE
200316	100316	KiraneM	ACTIVE
200317	100317	SadavarteS	ACTIVE
200318	100318	ShindeU	ACTIVE
200319	100319	PatilB	ACTIVE
200320	100320	virendrakulkarni	ACTIVE
200321	100321	DeshmukhY	ACTIVE
200322	100322	MoreH	ACTIVE
200323	100323	MaratheS	ACTIVE
200324	100324	JohnS	ACTIVE
200325	100325	AdmulwarS	ACTIVE
200326	100326	BobadeK	ACTIVE
200327	100327	JainS	ACTIVE
200328	100328	MusneK	ACTIVE
200329	100329	SharmaS	ACTIVE
200330	100330	MoharilV	ACTIVE
200331	100331	SalunkheM	ACTIVE
200332	100332	PattekariS	ACTIVE
200333	100333	JumaleN	ACTIVE
200334	100334	RaoTK	ACTIVE
200335	100335	ShindeP	ACTIVE
200336	100336	PatelKP	ACTIVE
200337	100337	MohiteS	ACTIVE
200338	100338	PuriK	ACTIVE
200339	100339	JamadarP	ACTIVE
200340	100340	DeshpandeV	ACTIVE
200341	100341	MutchintalaS	ACTIVE
200342	100342	ShindeH	ACTIVE
200343	100343	SanthanamR	ACTIVE
200344	100344	ChitaleP	ACTIVE
200345	100345	WagholeV	ACTIVE
200346	100346	IeleyasR	ACTIVE
200347	100347	admin_hd	ACTIVE
200348	100348	admin_se1	ACTIVE
200349	100349	SrinivasT	ACTIVE
200350	100350	SubramanianMK	ACTIVE
200351	100351	KhanE	ACTIVE
200352	100352	PatilVN	ACTIVE
200353	100353	OliverP	ACTIVE
200354	100354	Kulkarni_AR	ACTIVE
200355	100355	DeokarM	ACTIVE
200356	100356	AdhikaryA	ACTIVE
200357	100357	SarkarJ	ACTIVE
200358	100358	PrasanthY	ACTIVE
200359	100359	KhanA	ACTIVE
200360	100360	PimpalkarV	ACTIVE
200361	100361	PatilRR	ACTIVE
200362	100362	DasTD	ACTIVE
200363	100363	JosephA	ACTIVE
200364	100364	MujawarM	ACTIVE
200365	100365	JagtapP	ACTIVE
200366	100366	JhaS	ACTIVE
200367	100367	MishraP	ACTIVE
200368	100368	KadekarA	ACTIVE
200369	100369	DesaiN	ACTIVE
200370	100370	SurveK	ACTIVE
200371	100371	ShaikhK	ACTIVE
200372	100372	SawantS	ACTIVE
200373	100373	MahaleP	ACTIVE
200374	100374	MaralkarY	ACTIVE
200375	100375	UtekarrS	ACTIVE
200376	100376	ShahbadA	ACTIVE
200377	100377	KurleK	ACTIVE
200378	100378	InamdarM	ACTIVE
200379	100379	PawarsK	ACTIVE
200380	100380	MalhotraP	ACTIVE
200381	100381	ShindeSS	ACTIVE
200382	100382	ParbateD	ACTIVE
200383	100383	ThipseM	ACTIVE
200384	100384	BhattacharyaA	ACTIVE
200385	100385	SasmalS	ACTIVE
200386	100386	UppinA	ACTIVE
200387	100387	BhartiV	ACTIVE
200388	100388	DassharmaI	ACTIVE
200389	100389	ParundekarK	ACTIVE
200390	100390	ShaikhPS	ACTIVE
200391	100391	KaleD	ACTIVE
200392	100392	KonnurS	ACTIVE
200393	100393	KulkarniM	ACTIVE
200394	100394	VijanS	ACTIVE
200395	100395	MaliM	ACTIVE
200396	100396	PatelB	ACTIVE
200397	100397	JadhavAB	ACTIVE
200398	100398	AjmeraH	ACTIVE
200399	100399	NargundS	ACTIVE
200400	100400	KulkarniG	ACTIVE
200401	100401	JagtapSS	ACTIVE
200402	100402	JuthigaS	ACTIVE
200403	100403	malipatilb	ACTIVE
200404	100404	BhaleraoS	ACTIVE
200405	100405	ChandakV	ACTIVE
200406	100406	BonagiriS	ACTIVE
200407	100407	PatelA	ACTIVE
200408	100408	KhedkarS	ACTIVE
200409	100409	KulkarniAA	ACTIVE
200410	100410	MondalB	ACTIVE
200411	100411	SangleG	ACTIVE
200412	100412	ArbattiS	ACTIVE
200413	100413	BhosaleSR	ACTIVE
200414	100414	ShindeSC	ACTIVE
200415	100415	BobadeS	ACTIVE
200416	100416	ShindeSR	ACTIVE
200417	100417	BhosaleG	ACTIVE
200418	100418	RanadiveP	ACTIVE
200419	100419	ShanbhagN	ACTIVE
200420	100420	AnnapurnaC	ACTIVE
200421	100421	JadhavP	ACTIVE
200422	100422	KatlawarU	ACTIVE
200423	100423	KrishnaswamyR	ACTIVE
200424	100424	BhoiP	ACTIVE
200425	100425	GendH	ACTIVE
200426	100426	JanraoK	ACTIVE
200427	100427	MogalM	ACTIVE
200428	100428	AcharJ	ACTIVE
200429	100429	ArockiamU	ACTIVE
200430	100430	InamdarT	ACTIVE
200431	100431	KulkarniSV	ACTIVE
200432	100432	PrabhuG	ACTIVE
200433	100433	KarmalkarM	ACTIVE
200434	100434	MohantyA	ACTIVE
200435	100435	GaikwadH	ACTIVE
200436	100436	KarkamkarS	ACTIVE
200437	100437	PoteR	ACTIVE
200438	100438	GavaliJ	ACTIVE
200439	100439	KshirsagarD	ACTIVE
200440	100440	MaitreR	ACTIVE
200441	100441	SantoshK	ACTIVE
200442	100442	RashinkarC	ACTIVE
200443	100443	MalshikareS	ACTIVE
200444	100444	PatilK	ACTIVE
200445	100445	UghadeD	ACTIVE
200446	100446	BhaleraoH	ACTIVE
200447	100447	RameshMS	ACTIVE
200448	100448	ThakreM	ACTIVE
200449	100449	MorbaleM	ACTIVE
200450	100450	BelhekarP	ACTIVE
200451	100451	ShaikhA	ACTIVE
200452	100452	ChavanM	ACTIVE
200453	100453	SonawneM	ACTIVE
200454	100454	YannewarT	ACTIVE
200455	100455	GaikwadAd	ACTIVE
200456	100456	RaynadeU	ACTIVE
200457	100457	PaygudeV	ACTIVE
200458	100458	DeshmukhG	ACTIVE
200459	100459	DharmadhikariU	ACTIVE
200460	100460	PanchbhaiN	ACTIVE
200461	100461	ManeN	ACTIVE
200462	100462	WaniH	ACTIVE
200463	100463	DcruzB	ACTIVE
200464	100464	JosephC	ACTIVE
200465	100465	GhongadeM	ACTIVE
200466	100466	KakadeA	ACTIVE
200467	100467	PatilAB	ACTIVE
200468	100468	GosaviP	ACTIVE
200469	100469	NandipatiV	ACTIVE
200470	100470	JadhavC	ACTIVE
200471	100471	KalePV	ACTIVE
200472	100472	PatilMA	ACTIVE
200473	100473	KumarS	ACTIVE
200474	100474	MhaskeV	ACTIVE
200475	100475	SuryawanshiB	ACTIVE
200476	100476	Deshmukh_S	ACTIVE
200477	100477	KaleS	ACTIVE
200478	100478	AkolkarN	ACTIVE
200479	100479	BelvalkarR	ACTIVE
200480	100480	JoshiD	ACTIVE
200481	100481	wadingekarD	ACTIVE
200482	100482	SalunkeV	ACTIVE
200483	100483	TelekoneA	ACTIVE
200484	100484	BhateN	ACTIVE
200485	100485	GodaseN	ACTIVE
200486	100486	BarthwalA	ACTIVE
200487	100487	JahagirdarY	ACTIVE
200488	100488	BhoomkarA	ACTIVE
200489	100489	KulkarniSH	ACTIVE
200490	100490	GodaseU	ACTIVE
200491	100491	PatilAD	ACTIVE
200492	100492	VardhannavarR	ACTIVE
200493	100493	MahajanSV	ACTIVE
200494	100494	ChinanJ	ACTIVE
200495	100495	Patil_D	ACTIVE
200496	100496	IraniA	ACTIVE
200497	100497	KaknaniS	ACTIVE
200498	100498	BubaneA	ACTIVE
200499	100499	SavantR	ACTIVE
200500	100500	KhedkarN	ACTIVE
200501	100501	BelekarV	ACTIVE
200502	100502	VishwasraoV	ACTIVE
200503	100503	AmrutkarS	ACTIVE
200504	100504	KotibhaskarM	ACTIVE
200505	100505	JadhavH	ACTIVE
200506	100506	BandgarV	ACTIVE
200507	100507	NaraharisettyD	ACTIVE
200508	100508	ThoratSP	ACTIVE
200509	100509	VidekarV	ACTIVE
200510	100510	PawarY	ACTIVE
200511	100511	ShahR	ACTIVE
200512	100512	NimbalkarD	ACTIVE
200513	100513	PalkheM	ACTIVE
200514	100514	PatilA	ACTIVE
200515	100515	InamdarJ	ACTIVE
200516	100516	IyerV	ACTIVE
200517	100517	PachghareP	ACTIVE
200518	100518	ChavanG	ACTIVE
200519	100519	KambleP	ACTIVE
200520	100520	ShintreA	ACTIVE
200521	100521	KulkarniAM	ACTIVE
200522	100522	PatilUT	ACTIVE
200523	100523	RautR	ACTIVE
200524	100524	GhareS	ACTIVE
200525	100525	GadgilS	ACTIVE
200526	100526	PatilM	ACTIVE
200527	100527	ThombareD	ACTIVE
200528	100528	SagareS	ACTIVE
200529	100529	DeshmukhA	ACTIVE
200530	100530	KadamD	ACTIVE
200531	100531	KurianA	ACTIVE
200532	100532	DawangeT	ACTIVE
200533	100533	KulkarniShreyas	ACTIVE
200534	100534	kulkarniMD	ACTIVE
200535	100535	ChavanRR	ACTIVE
200536	100536	WayaseY	ACTIVE
200537	100537	BijoyB	ACTIVE
200538	100538	KolheS	ACTIVE
200539	100539	KorhaleR	ACTIVE
200540	100540	TelakeS	ACTIVE
200541	100541	PatilRB	ACTIVE
200542	100542	DwaraL	ACTIVE
200543	100543	PoteV	ACTIVE
200544	100544	DeshmukhAS	ACTIVE
200545	100545	LoharD	ACTIVE
200546	100546	KulkarniY	ACTIVE
200547	100547	ZinjurkeJ	ACTIVE
200548	100548	KulkarniYD	ACTIVE
200549	100549	ChavanR	ACTIVE
200550	100550	TiwariM	ACTIVE
200551	100551	GawandeD	ACTIVE
200552	100552	NalawadeAR	ACTIVE
200553	100553	RadhakrishnaG	ACTIVE
200554	100554	UdagaveA	ACTIVE
200555	100555	ChindhyK	ACTIVE
200556	100556	BapatC	ACTIVE
200557	100557	BiswasP	ACTIVE
200558	100558	ShindeS	ACTIVE
200559	100559	MenonN	ACTIVE
200560	100560	HavalS	ACTIVE
200561	100561	KakadeV	ACTIVE
200562	100562	MudbidriK	ACTIVE
200563	100563	ParmarG	ACTIVE
200564	100564	VaidyaM	ACTIVE
200565	100565	BalasubramanianV	ACTIVE
200566	100566	NadgondeK	ACTIVE
200567	100567	KetkarG	ACTIVE
200568	100568	PrasadT	ACTIVE
200569	100569	SangekarV	ACTIVE
200570	100570	BailkeriB	ACTIVE
200571	100571	MullapullyR	ACTIVE
200572	100572	AcharyaS	ACTIVE
200573	100573	DhamalR	ACTIVE
200574	100574	KulkarniC	ACTIVE
200575	100575	JaykumarS	ACTIVE
200576	100576	FernandesT	ACTIVE
200577	100577	shelars	ACTIVE
200578	100578	SinghG	ACTIVE
200579	100579	SangleB	ACTIVE
200580	100580	SontakkeS	ACTIVE
200581	100581	JadhavM	ACTIVE
200582	100582	DivekarR	ACTIVE
200583	100583	MatneV	ACTIVE
200584	100584	ChavanN	ACTIVE
200585	100585	RaneM	ACTIVE
200586	100586	SinghV	ACTIVE
200587	100587	AwaleS	ACTIVE
200588	100588	AkhtarN	ACTIVE
200589	100589	RamamoorthyC	ACTIVE
200590	100590	ThakurN	ACTIVE
200591	100591	SomalankaR	ACTIVE
200592	100592	PatilDK	ACTIVE
200593	100593	ParabD	ACTIVE
200594	100594	ParasnisR	ACTIVE
200595	100595	DokeG	ACTIVE
200596	100596	BhujbalT	ACTIVE
200597	100597	KatuleR	ACTIVE
200598	100598	RajuK	ACTIVE
200599	100599	PaulM	ACTIVE
200600	100600	SaraswatS	ACTIVE
200601	100601	NavaleR	ACTIVE
200602	100602	MahajanV	ACTIVE
200603	100603	KadamV	ACTIVE
200604	100604	KajaniaK	ACTIVE
200605	100605	PrasadAE	ACTIVE
200606	100606	Kumar_A	ACTIVE
200607	100607	YelpaleD	ACTIVE
200608	100608	KasarP	ACTIVE
200609	100609	postmaster	ACTIVE
200610	100610	SahaD	ACTIVE
200611	100611	GhelaniP	ACTIVE
200612	100612	JoshiSD	ACTIVE
200613	100613	VernekarD	ACTIVE
200614	100614	NiwalR	ACTIVE
200615	100615	SakoreD	ACTIVE
200616	100616	PaulA	ACTIVE
200617	100617	BadheR	ACTIVE
200618	100618	VaidyanathanS	ACTIVE
200619	100619	UtpatN	ACTIVE
200620	100620	SharmaY	ACTIVE
200621	100621	SahayAD	ACTIVE
200622	100622	NayakV	ACTIVE
200623	100623	GaidharP	ACTIVE
200624	100624	SabharwalM	ACTIVE
200625	100625	DurgeO	ACTIVE
200626	100626	ChakrabartiA	ACTIVE
200627	100627	KarmalkarYS	ACTIVE
200628	100628	BhushanS	ACTIVE
200629	100629	ReddyR	ACTIVE
200630	100630	SinghaC	ACTIVE
200631	100631	DasSD	ACTIVE
200632	100632	ChakravortyR	ACTIVE
200633	100633	MagooS	ACTIVE
200634	100634	RaoN	ACTIVE
200635	100635	TakalkarA	ACTIVE
200636	100636	PatilSR	ACTIVE
200637	100637	KuberA	ACTIVE
200638	100638	PingaleM	ACTIVE
200639	100639	GundR	ACTIVE
200640	100640	PundeP	ACTIVE
200641	100641	DharaN	ACTIVE
200642	100642	ManikantaT	ACTIVE
200643	100643	BabarK	ACTIVE
200644	100644	DeoreM	ACTIVE
200645	100645	LoharR	ACTIVE
200646	100646	BengaliK	ACTIVE
200647	100647	PawarN	ACTIVE
200648	100648	SableR	ACTIVE
200649	100649	LondheS	ACTIVE
200650	100650	YadnopavitN	ACTIVE
200651	100651	BirariA	ACTIVE
200652	100652	HariharaB	ACTIVE
200653	100653	LaddhadM	ACTIVE
200654	100654	NairP	ACTIVE
200655	100655	patilj	ACTIVE
200656	100656	DusaneA	ACTIVE
200657	100657	DeshpandeC	ACTIVE
200658	100658	GokhaleD	ACTIVE
200659	100659	ThiteS	ACTIVE
200660	100660	DhamdhereS	ACTIVE
200661	100661	ParekhD	ACTIVE
200662	100662	GaradS	ACTIVE
200663	100663	HingneS	ACTIVE
200664	100664	KhareM	ACTIVE
200665	100665	MoteV	ACTIVE
200666	100666	MitraD	ACTIVE
200667	100667	KirveM	ACTIVE
200668	100668	BhosaleS	ACTIVE
200669	100669	DasA	ACTIVE
200670	100670	PanchwaghA	ACTIVE
200671	100671	MashaleM	ACTIVE
200672	100672	DurgeV	ACTIVE
200673	100673	SalgondS	ACTIVE
200674	100674	ChakrabortyP	ACTIVE
200675	100675	RajputB	ACTIVE
200676	100676	ThiteSN	ACTIVE
200677	100677	DeoskarA	ACTIVE
200678	100678	PatilJS	ACTIVE
200679	100679	PathanR	ACTIVE
200680	100680	ManeR	ACTIVE
200681	100681	AhmadS	ACTIVE
200682	100682	PatilaP	ACTIVE
200683	100683	DoshiS	ACTIVE
200684	100684	AgnihotriK	ACTIVE
200685	100685	DevadasanM	ACTIVE
200686	100686	JachakD	ACTIVE
200687	100687	AnaokarA	ACTIVE
200688	100688	BalamuruganA	ACTIVE
200689	100689	GoswamiP	ACTIVE
200690	100690	Deshpande_A	ACTIVE
200691	100691	ShettyS	ACTIVE
200692	100692	JadhavV	ACTIVE
200693	100693	ChilhalP	ACTIVE
200694	100694	SinghD	ACTIVE
200695	100695	DasT	ACTIVE
200696	100696	KaldateR	ACTIVE
200697	100697	SahuS	ACTIVE
200698	100698	RajendranV	ACTIVE
200699	100699	MulayC	ACTIVE
200700	100700	PathakK	ACTIVE
200701	100701	GalagaliV	ACTIVE
200702	100702	DeoU	ACTIVE
200703	100703	AwasthiS	ACTIVE
200704	100704	WalunjV	ACTIVE
200705	100705	MasalawalaA	ACTIVE
200706	100706	BhatR	ACTIVE
200707	100707	SahayA	ACTIVE
200708	100708	UdapikarS	ACTIVE
200709	100709	HiremathP	ACTIVE
200710	100710	KanadeO	ACTIVE
200711	100711	Polindia-infoweb	ACTIVE
200712	100712	MenonP	ACTIVE
200713	100713	SangaleD	ACTIVE
200714	100714	GawadeM	ACTIVE
200715	100715	VenkateshHG	ACTIVE
200716	100716	YerlaR	ACTIVE
200717	100717	DasguptaS	ACTIVE
200718	100718	ArankeS	ACTIVE
200719	100719	PendavaleD	ACTIVE
200720	100720	VimalE	ACTIVE
200721	100721	KulkarniMP	ACTIVE
200722	100722	RaghavR	ACTIVE
200723	100723	GorheS	ACTIVE
200724	100724	HeggaS	ACTIVE
200725	100725	KalyaniS	ACTIVE
200726	100726	KazaR	ACTIVE
200727	100727	PanseS	ACTIVE
200728	100728	ChackoS	ACTIVE
200729	100729	DeyS	ACTIVE
200730	100730	KulkarniGirish	ACTIVE
200731	100731	TitarN	ACTIVE
200732	100732	DasS	ACTIVE
200733	100733	DeshpandeJ	ACTIVE
200734	100734	NairSR	ACTIVE
200735	100735	ThoratA	ACTIVE
200736	100736	TonapeM	ACTIVE
200737	100737	KumarB	ACTIVE
200738	100738	MalkunjeA	ACTIVE
200739	100739	TawadeS	ACTIVE
200740	100740	ZambareP	ACTIVE
200741	100741	LeleU	ACTIVE
200742	100742	MarellaG	ACTIVE
200743	100743	JosephV	ACTIVE
200744	100744	ChaudhariJ	ACTIVE
200745	100745	NandiS	ACTIVE
200746	100746	NairR	ACTIVE
200747	100747	SayyedA	ACTIVE
200748	100748	KamatV	ACTIVE
200749	100749	SurajiwaleL	ACTIVE
200750	100750	PanditC	ACTIVE
200751	100751	RamalingamS	ACTIVE
200752	100752	KulkarniSD	ACTIVE
200753	100753	BiswasS	ACTIVE
200754	100754	KanherkarD	ACTIVE
200755	100755	KumarMA	ACTIVE
200756	100756	UravaneA	ACTIVE
200757	100757	MehtaNI	ACTIVE
200758	100758	SinhaR	ACTIVE
200759	100759	HandaR	ACTIVE
200760	100760	SangaonkarV	ACTIVE
200761	100761	BellaryR	ACTIVE
200762	100762	KulkarniD	ACTIVE
200763	100763	SuroshiK	ACTIVE
200764	100764	SavekarA	ACTIVE
200765	100765	SakatkarO	ACTIVE
200766	100766	DoddaH	ACTIVE
200767	100767	ShirolikarS	ACTIVE
200768	100768	pmssystem	ACTIVE
200769	100769	LimayeV	ACTIVE
200770	100770	GundV	ACTIVE
200771	100771	HandeS	ACTIVE
200772	100772	AnilkumarP	ACTIVE
200773	100773	MusalunkarR	ACTIVE
200774	100774	PanseY	ACTIVE
200775	100775	SoniG	ACTIVE
200776	100776	RoteS	ACTIVE
200777	100777	SharmaM	ACTIVE
200778	100778	GodseS	ACTIVE
200779	100779	PadalkarD	ACTIVE
200780	100780	VarmaV	ACTIVE
200781	100781	GawhaneN	ACTIVE
200782	100782	KadamSV	ACTIVE
200783	100783	ThiteSB	ACTIVE
200784	100784	VedpathakA	ACTIVE
200785	100785	RaneS	ACTIVE
200786	100786	PawarV	ACTIVE
200787	100787	KannanR	ACTIVE
200788	100788	RisbudS	ACTIVE
200789	100789	SundarN	ACTIVE
200790	100790	RamasamyS	ACTIVE
200791	100791	NandurkarN	ACTIVE
200792	100792	SakhareD	ACTIVE
200793	100793	PhalkeA	ACTIVE
200794	100794	SondkarV	ACTIVE
200795	100795	RadhakrishnanR	ACTIVE
200796	100796	PansareSB	ACTIVE
200797	100797	ShedgeN	ACTIVE
200798	100798	SagareV	ACTIVE
200799	100799	ChawadekarM	ACTIVE
200800	100800	PhadkeS	ACTIVE
200801	100801	UmbrajkarM	ACTIVE
200802	100802	DamleS	ACTIVE
200803	100803	TilveA	ACTIVE
200804	100804	SinhaC	ACTIVE
200805	100805	LimboowallaN	ACTIVE
200806	100806	ManjraS	ACTIVE
200807	100807	AfzalA	ACTIVE
200808	100808	ShindeAS	ACTIVE
200809	100809	BhasmeAA	ACTIVE
200810	100810	SankannavarB	ACTIVE
200811	100811	TanvanshiK	ACTIVE
200812	100812	SinghR	ACTIVE
200813	100813	trafsystem	ACTIVE
200814	100814	AliR	ACTIVE
200815	100815	SahaSU	ACTIVE
200816	100816	ManeAV	ACTIVE
200817	100817	GhevadeV	ACTIVE
200818	100818	JadhavAA	ACTIVE
200819	100819	MungaseV	ACTIVE
200820	100820	KumarPC	ACTIVE
200821	100821	KhirnarN	ACTIVE
200822	100822	GosaviR	ACTIVE
200823	100823	MaliV	ACTIVE
200824	100824	BharankarA	ACTIVE
200825	100825	RawoolV	ACTIVE
200826	100826	KateB	ACTIVE
200827	100827	WaniP	ACTIVE
200828	100828	GagareS	ACTIVE
200829	100829	RamarajK	ACTIVE
200830	100830	PundkareV	ACTIVE
200831	100831	JadhavPM	ACTIVE
200832	100832	GeorgeS	ACTIVE
200833	100833	NayarV	ACTIVE
200834	100834	KatkarN	ACTIVE
200835	100835	KadamA	ACTIVE
200836	100836	YadavVS	ACTIVE
200837	100837	PrajapatiS	ACTIVE
200838	100838	KshirsagarP	ACTIVE
200839	100839	NaskarB	ACTIVE
200840	100840	MalekarO	ACTIVE
200841	100841	MalkotiB	ACTIVE
200842	100842	RaiA	ACTIVE
200843	100843	JoshiVN	ACTIVE
200844	100844	RajaE	ACTIVE
200845	100845	PakhareS	ACTIVE
200846	100846	HaqueM	ACTIVE
200847	100847	GawasE	ACTIVE
200848	100848	MandekarV	ACTIVE
200849	100849	ChakkingalS	ACTIVE
200850	100850	KagdeN	ACTIVE
200851	100851	SinghSK	ACTIVE
200852	100852	Attendance.System	ACTIVE
200853	100853	SinghAK	ACTIVE
200854	100854	SangleS	ACTIVE
200855	100855	ThitameN	ACTIVE
200856	100856	SharmaK	ACTIVE
200857	100857	BhagatB	ACTIVE
200858	100858	NarewadikarK	ACTIVE
200859	100859	RajashekarS	ACTIVE
200860	100860	DebA	ACTIVE
200861	100861	PawarRK	ACTIVE
200862	100862	KirubakaranK	ACTIVE
200863	100863	NitturkarR	ACTIVE
200864	100864	KommajosyulaS	ACTIVE
200865	100865	ChaudhariJH	ACTIVE
200866	100866	PeriyasaamyP	ACTIVE
200867	100867	KanagalaP	ACTIVE
200868	100868	ElumalaiG	ACTIVE
200869	100869	LadH	ACTIVE
200870	100870	MakashirG	ACTIVE
200871	100871	PillaiRS	ACTIVE
200872	100872	CharlesS	ACTIVE
200873	100873	KharateM	ACTIVE
200874	100874	MukaneV	ACTIVE
200875	100875	ArumugamR	ACTIVE
200876	100876	GadeU	ACTIVE
200877	100877	SinghSR	ACTIVE
200878	100878	BoopathyS	ACTIVE
200879	100879	DasMD	ACTIVE
200880	100880	MuralidharanP	ACTIVE
200881	100881	PoalS	ACTIVE
200882	100882	DanawaleR	ACTIVE
200883	100883	KamblePT	ACTIVE
200884	100884	BhagatK	ACTIVE
200885	100885	RajasekharV	ACTIVE
200886	100886	JagtapN	ACTIVE
200887	100887	MuruganV	ACTIVE
200888	100888	DamameM	ACTIVE
200889	100889	PillaiVP	ACTIVE
200890	100890	KumarR	ACTIVE
200891	100891	PoojariSA	ACTIVE
200892	100892	ShrivastavP	ACTIVE
200893	100893	JagtapA	ACTIVE
200894	100894	NikamS	ACTIVE
200895	100895	JangamA	ACTIVE
200896	100896	RayP	ACTIVE
200897	100897	NaseryS	ACTIVE
200898	100898	TanpureT	ACTIVE
200899	100899	KumarSN	ACTIVE
200900	100900	KadamP	ACTIVE
200901	100901	SivaramakrishnanV	ACTIVE
200902	100902	DhengeC	ACTIVE
200903	100903	Dey_S	ACTIVE
200904	100904	KavathekarS	ACTIVE
200905	100905	ChitaliM	ACTIVE
200906	100906	ShanmugamV	ACTIVE
200907	100907	KachiS	ACTIVE
200908	100908	DakeR	ACTIVE
200909	100909	SinghA	ACTIVE
200910	100910	BombatkarD	ACTIVE
200911	100911	bbsadmin	ACTIVE
200912	100912	ChavanNS	ACTIVE
200913	100913	VakilS	ACTIVE
200914	100914	MudholkarA	ACTIVE
200915	100915	TaklikarS	ACTIVE
200916	100916	KulkarniGJ	ACTIVE
200917	100917	ShankarG	ACTIVE
200918	100918	TripathiA	ACTIVE
200919	100919	AgarkarR	ACTIVE
200920	100920	GuptaP	ACTIVE
200921	100921	NageshkarR	ACTIVE
200922	100922	PatilU	ACTIVE
200923	100923	ShrivatsavaN	ACTIVE
200924	100924	Kumaresan	ACTIVE
200925	100925	MahadikP	ACTIVE
200926	100926	PuranikM	ACTIVE
200927	100927	MohiteR	ACTIVE
200928	100928	KulkarniSK	ACTIVE
200929	100929	KaleM	ACTIVE
200930	100930	MukherjeeK	ACTIVE
200931	100931	ExtrossS	ACTIVE
200932	100932	RadhakrishnanP	ACTIVE
200933	100933	WilsonK	ACTIVE
200934	100934	SutarJ	ACTIVE
200935	100935	Deshmukh M	ACTIVE
200936	100936	MenganeS	ACTIVE
200937	100937	PawarSV	ACTIVE
200938	100938	MenonB	ACTIVE
200939	100939	DasM	ACTIVE
200940	100940	DastoorK	ACTIVE
200941	100941	ChindageS	ACTIVE
200942	100942	GodseAP	ACTIVE
200943	100943	SQLExecutiveCmdExec	ACTIVE
200944	100944	PatilL	ACTIVE
200945	100945	VishvasY	ACTIVE
200946	100946	Patil_SM	ACTIVE
200947	100947	AherD	ACTIVE
200948	100948	HovalP	ACTIVE
200950	100950	IyerKV	ACTIVE
200951	100951	NarkhedeA	ACTIVE
200952	100952	SableV	ACTIVE
200953	100953	BalamuruganB	ACTIVE
200954	100954	KarthikeyanS	ACTIVE
200955	100955	PatilAU	ACTIVE
200956	100956	NirupdravaP	ACTIVE
200957	100957	DurgawaleT	ACTIVE
200958	100958	ChikadoliV	ACTIVE
200959	100959	SaravananC	ACTIVE
200960	100960	PatokarN	ACTIVE
200961	100961	KawadeN	ACTIVE
200962	100962	ithyd	ACTIVE
200963	100963	ShaikA	ACTIVE
200964	100964	SarS	ACTIVE
200965	100965	RanjanP	ACTIVE
200966	100966	TanksaleK	ACTIVE
200967	100967	BangR	ACTIVE
200968	100968	PotodeN	ACTIVE
200969	100969	MishraG	ACTIVE
200970	100970	JadhavPS	ACTIVE
200971	100971	KeshariP	ACTIVE
200972	100972	RoyP	ACTIVE
200973	100973	UppeG	ACTIVE
200974	100974	DoifodeM	ACTIVE
200975	100975	SahaA	ACTIVE
200976	100976	KathavateA	ACTIVE
200977	100977	KadamR	ACTIVE
200978	100978	ThakareS	ACTIVE
200979	100979	VaralaP	ACTIVE
200980	100980	MukherjeeA	ACTIVE
200981	100981	ThangasamyJ	ACTIVE
200982	100982	KumarSH	ACTIVE
200983	100983	PrajapatiN	ACTIVE
200984	100984	NatarajanA	ACTIVE
200985	100985	SahaR	ACTIVE
200986	100986	KhandekarR	ACTIVE
200987	100987	AwatadeR	ACTIVE
200988	100988	BhattacharyaK	ACTIVE
200989	100989	ChaudhuriS	ACTIVE
200990	100990	SingannagariR	ACTIVE
200991	100991	KajiR	ACTIVE
200992	100992	PathareS	ACTIVE
200993	100993	WadekarP	ACTIVE
200994	100994	MaideenN	ACTIVE
200995	100995	JatiS	ACTIVE
200996	100996	ChandrasekarK	ACTIVE
200997	100997	MajumderS	ACTIVE
200998	100998	DhapteG	ACTIVE
200999	100999	GhulanawarR	ACTIVE
201000	101000	TarlekarS	ACTIVE
201001	101001	KaurG	ACTIVE
201002	101002	JayanthiN	ACTIVE
201003	101003	GiridharanM	ACTIVE
201004	101004	KuppusamyK	ACTIVE
201005	101005	RaoG	ACTIVE
201006	101006	KuwarL	ACTIVE
201007	101007	MehendaleA	ACTIVE
201008	101008	KhotAP	ACTIVE
201009	101009	ShindeJ	ACTIVE
201010	101010	MenonR	ACTIVE
201011	101011	GirmalV	ACTIVE
201012	101012	MahatoK	ACTIVE
201013	101013	ChalkeS	ACTIVE
201014	101014	JayawantD	ACTIVE
201015	101015	GhatgeR	ACTIVE
201016	101016	KanaseS	ACTIVE
201017	101017	GovindasamyB	ACTIVE
201018	101018	SalviS	ACTIVE
201019	101019	VarmaD	ACTIVE
201020	101020	EUQ_TKIIEXCH	ACTIVE
201021	101021	RajeeshR	ACTIVE
201022	101022	admin_se4	ACTIVE
201023	101023	ReddyM	ACTIVE
201024	101024	GirmeA	ACTIVE
201025	101025	NancharaiahB	ACTIVE
201026	101026	KhanekarS	ACTIVE
201028	101028	DurairajV	ACTIVE
201029	101029	TeleP	ACTIVE
201030	101030	ManchareV	ACTIVE
201031	101031	ChinnaduraiT	ACTIVE
201032	101032	PachareK	ACTIVE
201033	101033	ParakkalL	ACTIVE
201034	101034	SoodR	ACTIVE
201035	101035	BagS	ACTIVE
201036	101036	IyerVA	ACTIVE
201037	101037	HosnaleR	ACTIVE
201038	101038	besadmin	ACTIVE
201039	101039	PatodiA	ACTIVE
201040	101040	NaiduG	ACTIVE
201041	101041	RaiS	ACTIVE
201042	101042	SayyedM	ACTIVE
201043	101043	PawaskarS	ACTIVE
201044	101044	KulkarniJ	ACTIVE
201045	101045	Kumar-S	ACTIVE
201046	101046	KalyaniSP	ACTIVE
201047	101047	KoleyD	ACTIVE
201048	101048	NigamR	ACTIVE
201049	101049	Singh_AK	ACTIVE
201050	101050	NambiarK	ACTIVE
201051	101051	TekadeC	ACTIVE
201052	101052	Admin$	ACTIVE
201053	101053	GaikwadR	ACTIVE
201054	101054	KshetramadeM	ACTIVE
201055	101055	NatekarP	ACTIVE
201056	101056	PramanikA	ACTIVE
201057	101057	KumarSA	ACTIVE
201058	101058	WagharalkarB	ACTIVE
201059	101059	MitraMN	ACTIVE
201060	101060	ShindeUA	ACTIVE
201061	101061	RajebhosaleC	ACTIVE
201062	101062	TKtrust	ACTIVE
201063	101063	JampalaS	ACTIVE
201064	101064	SadanalaS	ACTIVE
201065	101065	KamblePJ	ACTIVE
201066	101066	SwamiB	ACTIVE
201067	101067	JosephE	ACTIVE
201068	101068	ShindeD	ACTIVE
201069	101069	RenkeS	ACTIVE
201070	101070	JagadaleS	ACTIVE
201071	101071	ParasnisRR	ACTIVE
201072	101072	WasnikP	ACTIVE
201073	101073	PurandareP	ACTIVE
201074	101074	DhanavadeR	ACTIVE
201075	101075	Shinde_S	ACTIVE
201076	101076	KaruppusamyM	ACTIVE
201077	101077	BirajdarV	ACTIVE
201078	101078	MurumkarC	ACTIVE
201079	101079	GiriS	ACTIVE
201080	101080	ChoudhariS	ACTIVE
201081	101081	SomR	ACTIVE
201082	101082	MishraK	ACTIVE
201083	101083	ShivangekarD	ACTIVE
201084	101084	SableS	ACTIVE
201085	101085	BoidH	ACTIVE
201086	101086	PachoreP	ACTIVE
201087	101087	SuryawanshiR	ACTIVE
201088	101088	PerumalS	ACTIVE
201089	101089	NayakS	ACTIVE
201090	101090	VivekandanM	ACTIVE
201091	101091	ChandranS	ACTIVE
201092	101092	KaleSV	ACTIVE
201093	101093	HiwaraleC	ACTIVE
201094	101094	ChowdhurySR	ACTIVE
201095	101095	SivaM	ACTIVE
201096	101096	KhanAA	ACTIVE
201097	101097	ReddyDK	ACTIVE
201098	101098	MiddelaR	ACTIVE
201099	101099	KrisnhnanunniA	ACTIVE
201100	101100	SanthoshK	ACTIVE
201101	101101	RoutU	ACTIVE
201102	101102	BorseS	ACTIVE
201103	101103	Cluster	ACTIVE
201104	101104	DuttaG	ACTIVE
201105	101105	BabhreA	ACTIVE
201106	101106	BanerjeeS	ACTIVE
201108	101108	AgastiS	ACTIVE
201109	101109	BeheraJ	ACTIVE
201110	101110	VPN_FA04	ACTIVE
201111	101111	DangR	ACTIVE
201112	101112	JunghareP	ACTIVE
201113	101113	RamalingamJ	ACTIVE
201114	101114	ShindeSV	ACTIVE
201115	101115	PhadtareH	ACTIVE
201116	101116	KakareS	ACTIVE
201117	101117	GaneshanV	ACTIVE
201118	101118	ChatterjeeD	ACTIVE
201119	101119	BiswasSN	ACTIVE
201120	101120	ManeP	ACTIVE
201121	101121	ShindeSD	ACTIVE
201122	101122	ChopdeT	ACTIVE
201123	101123	LoganathanS	ACTIVE
201124	101124	PrajapatiR	ACTIVE
201125	101125	ShedgeA	ACTIVE
201126	101126	ITKOL	ACTIVE
201127	101127	SawantC	ACTIVE
201128	101128	TodkarA	ACTIVE
201129	101129	GaikwadJ	ACTIVE
201130	101130	ChennurS	ACTIVE
201131	101131	ModakA	ACTIVE
201132	101132	PatilVP	ACTIVE
201133	101133	BenadikarM	ACTIVE
201134	101134	DasAK	ACTIVE
201135	101135	BeikA	ACTIVE
201136	101136	GaikwadJS	ACTIVE
201137	101137	BargeP	ACTIVE
201138	101138	BeheraS	ACTIVE
201139	101139	PatilPN	ACTIVE
201140	101140	NayakA	ACTIVE
201141	101141	KhodaveN	ACTIVE
201142	101142	GeorgeSS	ACTIVE
201143	101143	DeoghareY	ACTIVE
201144	101144	ShahapurkarR	ACTIVE
201145	101145	NagpurkarK	ACTIVE
201146	101146	MishraC	ACTIVE
201147	101147	SamantaS	ACTIVE
201148	101148	KandukuriV	ACTIVE
201149	101149	JyothiB	ACTIVE
201150	101150	AthimoolamV	ACTIVE
201151	101151	ShelkeP	ACTIVE
201153	101153	ivlcoin2	ACTIVE
201155	101155	PatilAR	ACTIVE
201156	101156	RoyI	ACTIVE
201157	101157	NanekarA	ACTIVE
201158	101158	TaleA	ACTIVE
201159	101159	CemGuestPDMS01	ACTIVE
201160	101160	MoreB	ACTIVE
201161	101161	KumbharSG	ACTIVE
201162	101162	BartakkeR	ACTIVE
201163	101163	VR.A	ACTIVE
201164	101164	TilekarH	ACTIVE
201165	101165	BathijaN	ACTIVE
201166	101166	MokashiS	ACTIVE
201167	101167	GulavaniA	ACTIVE
201168	101168	VermaA	ACTIVE
201169	101169	KumbharPV	ACTIVE
201170	101170	DangiU	ACTIVE
201171	101171	KelkarN	ACTIVE
201172	101172	SoddagiP	ACTIVE
201173	101173	KhairkharV	ACTIVE
201174	101174	NevgeL	ACTIVE
201175	101175	DhawleP	ACTIVE
201176	101176	MalpediA	ACTIVE
201177	101177	TamgaveS	ACTIVE
201178	101178	KaldhoneP	ACTIVE
201179	101179	PawarD	ACTIVE
201180	101180	SinghKS	ACTIVE
201181	101181	CemGuestPDMS02	ACTIVE
201182	101182	Nikam_S	ACTIVE
201183	101183	RanjaneA	ACTIVE
201184	101184	BhorN	ACTIVE
201185	101185	JagadaleSM	ACTIVE
201186	101186	VadrevuP	ACTIVE
201187	101187	JadhavMG	ACTIVE
201188	101188	MunigondaA	ACTIVE
201189	101189	FayazF	ACTIVE
201190	101190	DemannaP	ACTIVE
201191	101191	SolankiE	ACTIVE
201192	101192	TanpureP	ACTIVE
201193	101193	ShiroteS	ACTIVE
201194	101194	LipareH	ACTIVE
201195	101195	TampiV	ACTIVE
201196	101196	RArun	ACTIVE
201197	101197	Mane_S	ACTIVE
201198	101198	KalelS	ACTIVE
201199	101199	SubramanianV	ACTIVE
201200	101200	SheikS	ACTIVE
201201	101201	SaroaP	ACTIVE
201202	101202	SarkarZ	ACTIVE
201203	101203	RaskarM	ACTIVE
201204	101204	ShejwalO	ACTIVE
201205	101205	JailkhaniA	ACTIVE
201206	101206	GoyalA	ACTIVE
201207	101207	PatadeP	ACTIVE
201208	101208	SankpalAS	ACTIVE
201209	101209	ShahS	ACTIVE
201210	101210	SutarN	ACTIVE
201211	101211	KaranteA	ACTIVE
201212	101212	PatilR	ACTIVE
201213	101213	GramopadhyeC	ACTIVE
201214	101214	KumarAG	ACTIVE
201215	101215	RetwadeV	ACTIVE
201216	101216	BechawadeM	ACTIVE
201217	101217	AsangiS	ACTIVE
201218	101218	PukaleR	ACTIVE
201219	101219	MullaS	ACTIVE
201220	101220	BabuN	ACTIVE
201221	101221	MohiteSR	ACTIVE
201222	101222	TiwariM1	ACTIVE
201223	101223	KulkarniV	ACTIVE
201224	101224	Paul_A	ACTIVE
201225	101225	JoshiRP	ACTIVE
201226	101226	MaliS	ACTIVE
201227	101227	GandhiP	ACTIVE
201228	101228	KolgeO	ACTIVE
201229	101229	SolaiyappanM	ACTIVE
201230	101230	PandeyS	ACTIVE
201231	101231	TodkarAT	ACTIVE
201232	101232	DahuleN	ACTIVE
201233	101233	JadhavA	ACTIVE
201234	101234	PatilI	ACTIVE
201235	101235	ChandgudeA	ACTIVE
201236	101236	BhiseS	ACTIVE
201237	101237	DevadigaS	ACTIVE
201238	101238	KoreA	ACTIVE
201239	101239	PokharkarM	ACTIVE
201240	101240	GhoneS	ACTIVE
201241	101241	YadavA	ACTIVE
201242	101242	VaidyaV	ACTIVE
201243	101243	PradhanA	ACTIVE
201244	101244	NaikS	ACTIVE
201245	101245	DastoorV	ACTIVE
201246	101246	VarmaVC	ACTIVE
201247	101247	ChaphekarN	ACTIVE
201248	101248	GadgilK	ACTIVE
201249	101249	BejekarA	ACTIVE
201250	101250	TataS	ACTIVE
201251	101251	ChakrabortyTK	ACTIVE
201252	101252	JirageS	ACTIVE
201253	101253	KharbasS	ACTIVE
201254	101254	PaulS	ACTIVE
201255	101255	LoharG	ACTIVE
201256	101256	IraniF	ACTIVE
201257	101257	KaleA	ACTIVE
201258	101258	PawarAR	ACTIVE
201259	101259	DapkeO	ACTIVE
201260	101260	KadkolS	ACTIVE
201261	101261	MaradiyaD	ACTIVE
201262	101262	PondeY	ACTIVE
201263	101263	OzarkarS	ACTIVE
201264	101264	TelangV	ACTIVE
201265	101265	DukandarS	ACTIVE
201266	101266	PawarM	ACTIVE
201267	101267	SrinivasK	ACTIVE
201268	101268	SenapatiS	ACTIVE
201269	101269	PatilS	ACTIVE
201270	101270	AthavaleA	ACTIVE
201271	101271	JagtapS	ACTIVE
201272	101272	ManeMB	ACTIVE
201273	101273	MadarapuV	ACTIVE
201274	101274	NigudkarD	ACTIVE
201275	101275	Bhosale_S	ACTIVE
201276	101276	BahetiP	ACTIVE
201277	101277	MuruganM	ACTIVE
201278	101278	BakshiK	ACTIVE
201279	101279	ShahN	ACTIVE
201280	101280	BhuraleR	ACTIVE
201281	101281	ChavanV	ACTIVE
201282	101282	PawarSN	ACTIVE
201283	101283	PawarO	ACTIVE
201284	101284	WaghD	ACTIVE
201285	101285	BhagwatS	ACTIVE
201286	101286	Joshi_V	ACTIVE
201287	101287	PatilSY	ACTIVE
201288	101288	KulkarniVB	ACTIVE
201289	101289	ReddySM	ACTIVE
201290	101290	BhaveT	ACTIVE
201291	101291	NairRV	ACTIVE
201292	101292	PatilN	ACTIVE
201293	101293	KamblePD	ACTIVE
201294	101294	MhetreK	ACTIVE
201295	101295	BharveshR	ACTIVE
201296	101296	DommatiV	ACTIVE
201297	101297	BelgamwarA	ACTIVE
201298	101298	NagarajuB	ACTIVE
201299	101299	PulakalaV	ACTIVE
201300	101300	DhumalJ	ACTIVE
201301	101301	ThoudoosP	ACTIVE
201302	101302	KarthikK	ACTIVE
201303	101303	PoosaS	ACTIVE
201304	101304	SahuB	ACTIVE
201305	101305	BajiS	ACTIVE
201306	101306	ChandraS	ACTIVE
201307	101307	SrinivasuluM	ACTIVE
201308	101308	KumarL	ACTIVE
201309	101309	AdheJ	ACTIVE
201310	101310	RawaleV	ACTIVE
201311	101311	GuduruA	ACTIVE
201312	101312	SalkeV	ACTIVE
201313	101313	KadamAD	ACTIVE
201314	101314	NayakM	ACTIVE
201315	101315	SwamyN	ACTIVE
201316	101316	KeskarR	ACTIVE
201317	101317	AdariL	ACTIVE
201318	101318	AhireR	ACTIVE
201319	101319	AravindanA	ACTIVE
201320	101320	NaikwadiA	ACTIVE
201321	101321	DaveV	ACTIVE
201322	101322	OjhaM	ACTIVE
201323	101323	MukeshRM	ACTIVE
201324	101324	NikaljeK	ACTIVE
201325	101325	SonwalkarS	ACTIVE
201326	101326	ChorageA	ACTIVE
201327	101327	SannappanavarC	ACTIVE
201328	101328	SubramanyaS	ACTIVE
201329	101329	SinghM	ACTIVE
201330	101330	JadhavK	ACTIVE
201331	101331	KulhareS	ACTIVE
201332	101332	ChavanA	ACTIVE
201333	101333	BhagatS	ACTIVE
201334	101334	GhuleS	ACTIVE
201335	101335	NayakBI	ACTIVE
201336	101336	AjayJ	ACTIVE
201337	101337	BhairappaA	ACTIVE
201338	101338	MisalS	ACTIVE
201339	101339	ChilakalaA	ACTIVE
201340	101340	KumarP	ACTIVE
201341	101341	KumarSAN	ACTIVE
201342	101342	BiringS	ACTIVE
201343	101343	ShirkeP	ACTIVE
201344	101344	ThakareH	ACTIVE
201345	101345	VermaR	ACTIVE
201346	101346	ShewaleA	ACTIVE
201347	101347	ManePS	ACTIVE
201348	101348	HumnabadkarD	ACTIVE
201349	101349	PawarR	ACTIVE
201350	101350	admin_se5	ACTIVE
201351	101351	DsouzaD	ACTIVE
201352	101352	KrishnaswamyS	ACTIVE
201353	101353	SwainK	ACTIVE
201354	101354	PujariA	ACTIVE
201355	101355	KanshettiR	ACTIVE
201356	101356	KshirsagarAV	ACTIVE
201357	101357	Printer	ACTIVE
201358	101358	DeshmukhR	ACTIVE
201359	101359	ChoudharyR	ACTIVE
201360	101360	MichaelS	ACTIVE
201361	101361	JoshiMD	ACTIVE
201362	101362	JoshiV	ACTIVE
201363	101363	AkhouriC	ACTIVE
201364	101364	KapaseR	ACTIVE
201365	101365	ChikaneD	ACTIVE
201366	101366	KURHADEA	ACTIVE
201367	101367	JoshiRS	ACTIVE
201368	101368	Kulkarni_M	ACTIVE
201369	101369	MuleyJ	ACTIVE
201370	101370	MishraV	ACTIVE
201371	101371	GhosalA	ACTIVE
201372	101372	RamaS	ACTIVE
201373	101373	ShastrakarD	ACTIVE
201374	101374	NayakB	ACTIVE
201375	101375	SumbadP	ACTIVE
201376	101376	VermaH	ACTIVE
201377	101377	LANKAYAGARIS	ACTIVE
201378	101378	ShivaB	ACTIVE
201379	101379	YadavP	ACTIVE
201380	101380	HanchateM	ACTIVE
201381	101381	ReddyS	ACTIVE
201382	101382	JangamU	ACTIVE
201383	101383	NalawadeA	ACTIVE
201384	101384	ShindeSU	ACTIVE
201385	101385	ManePP	ACTIVE
201386	101386	DindegaveS	ACTIVE
201387	101387	ChoudhariG	ACTIVE
201388	101388	DholeP	ACTIVE
201389	101389	PatilD	ACTIVE
201390	101390	KambleD	ACTIVE
201391	101391	ThombareS	ACTIVE
201392	101392	NilakheP	ACTIVE
201393	101393	KumarM	ACTIVE
201394	101394	KarveA	ACTIVE
201395	101395	ChaudhariR	ACTIVE
201396	101396	LondheSR	ACTIVE
201397	101397	AhmadM	ACTIVE
201398	101398	AnnabattulaP	ACTIVE
201399	101399	MandalP	ACTIVE
201400	101400	RahulG	ACTIVE
201401	101401	VaraprasadJ	ACTIVE
201402	101402	KolhatkarS	ACTIVE
201403	101403	RanjanS	ACTIVE
201404	101404	Patil_AB	ACTIVE
201405	101405	JethwaY	ACTIVE
201406	101406	MokshagnaR	ACTIVE
201407	101407	MulikO	ACTIVE
201408	101408	BhasmeAS	ACTIVE
201409	101409	RakhP	ACTIVE
201410	101410	MaskaleT	ACTIVE
201411	101411	KathuriaA	ACTIVE
201412	101412	BadeM	ACTIVE
201413	101413	PandaV	ACTIVE
201414	101414	BharsakaleP	ACTIVE
201415	101415	Kulkarni_A	ACTIVE
201416	101416	WaleM	ACTIVE
201417	101417	GaikwadSS	ACTIVE
201418	101418	LoharA	ACTIVE
201419	101419	PunuguV	ACTIVE
201420	101420	bhatiav	ACTIVE
201421	101421	MondalT	ACTIVE
201422	101422	WadkarA	ACTIVE
201423	101423	tyughj	ACTIVE
201424	101424	KasoteA	ACTIVE
201425	101425	DeyR	ACTIVE
201426	101426	RoyA	ACTIVE
201427	101427	DangeB	ACTIVE
201428	101428	PillaiJ	ACTIVE
201429	101429	KaliappanK	ACTIVE
201430	101430	PillaiS	ACTIVE
201431	101431	ThoratAT	ACTIVE
201432	101432	NavareM	ACTIVE
201433	101433	GudduriS	ACTIVE
201434	101434	VLJ_Mech	ACTIVE
201435	101435	VLJ_EI	ACTIVE
201436	101436	VLJ_Hse	ACTIVE
201437	101437	ReddyT	ACTIVE
201438	101438	PurandarreP	ACTIVE
201439	101439	TripathiS	ACTIVE
201440	101440	IngaleP	ACTIVE
201441	101441	ChoudharyK	ACTIVE
201442	101442	VadakeveeduP	ACTIVE
201443	101443	DeshpandeSM	ACTIVE
201444	101444	GuptaR	ACTIVE
201445	101445	ChundawatD	ACTIVE
201446	101446	VLJ_Mech_RD	ACTIVE
201447	101447	VLJ_EI_RD	ACTIVE
201448	101448	VLJ_Mech_GAP	ACTIVE
201449	101449	VLJ_EI_GAP	ACTIVE
201450	101450	VLJ_Mech_BO	ACTIVE
201451	101451	VLJ_EI_BO	ACTIVE
201452	101452	VLJ_Store	ACTIVE
201453	101453	MoreV	ACTIVE
201454	101454	TamoreH	ACTIVE
201455	101455	KhuneJ	ACTIVE
201456	101456	TalewarA	ACTIVE
201457	101457	JoshiH	ACTIVE
201458	101458	DhapreU	ACTIVE
201459	101459	Patil_R	ACTIVE
201460	101460	JosephJM	ACTIVE
201461	101461	HiratotS	ACTIVE
201462	101462	PatilPS	ACTIVE
201463	101463	KumbharM	ACTIVE
201464	101464	CVMuthukrishnan	ACTIVE
201465	101465	DeshpandeAA	ACTIVE
201466	101466	PrasoonP	ACTIVE
201467	101467	TyagiP	ACTIVE
201468	101468	TikateP	ACTIVE
201469	101469	Patil_S	ACTIVE
201470	101470	BotreA	ACTIVE
201471	101471	KanunjeK	ACTIVE
201472	101472	BhokareG	ACTIVE
201473	101473	KandaleA	ACTIVE
201474	101474	KhaladkarV	ACTIVE
201475	101475	BholaB	ACTIVE
201476	101476	JadhavPV	ACTIVE
201477	101477	PawarSS	ACTIVE
201478	101478	DasMR	ACTIVE
201479	101479	DongareAR	ACTIVE
201480	101480	MahamuniM	ACTIVE
201481	101481	NaikwadeV	ACTIVE
201482	101482	Boiler_Guest	ACTIVE
201483	101483	DumasiaB	ACTIVE
201484	101484	testA	ACTIVE
201485	101485	ShethM	ACTIVE
201486	101486	DeshpandeS	ACTIVE
201487	101487	SubbiramaniK	ACTIVE
201488	101488	ChavanY	ACTIVE
201489	101489	PanickerR	ACTIVE
201490	101490	Kumar_P	ACTIVE
201491	101491	HirthotS	ACTIVE
201492	101492	DhaneO	ACTIVE
201493	101493	BhapkarR	ACTIVE
201494	101494	Qatrainee	ACTIVE
201495	101495	PomannawarP	ACTIVE
201496	101496	ShingadeN	ACTIVE
201497	101497	BhosaleSJ	ACTIVE
201498	101498	MahadwarP	ACTIVE
201499	101499	PawarP	ACTIVE
201500	101500	RavindranathA	ACTIVE
201501	101501	SubhakarM	ACTIVE
201502	101502	MahalleS	ACTIVE
201503	101503	ManePN	ACTIVE
201504	101504	NakhateS	ACTIVE
201505	101505	JhaA	ACTIVE
201506	101506	LattheA	ACTIVE
201507	101507	BaratheK	ACTIVE
201508	101508	DangeV	ACTIVE
201509	101509	KeskarA	ACTIVE
201510	101510	Riljsez_Hse	ACTIVE
201511	101511	Riljsez_Ei	ACTIVE
201512	101512	PatilSD	ACTIVE
201513	101513	PatilG	ACTIVE
201514	101514	PatilAG	ACTIVE
201515	101515	MaheshS	ACTIVE
201516	101516	GhutukadeA	ACTIVE
201517	101517	NarasagondB	ACTIVE
201518	101518	KhotAS	ACTIVE
201519	101519	AmbhoreA	ACTIVE
201520	101520	DidwaniaO	ACTIVE
201521	101521	GuptaN	ACTIVE
201522	101522	JadhavS	ACTIVE
201523	101523	KarmakarB	ACTIVE
201524	101524	KonkeriV	ACTIVE
201525	101525	Das_T	ACTIVE
201526	101526	BasuroyR	ACTIVE
201527	101527	MohantyP	ACTIVE
201528	101528	NaikawadiJ	ACTIVE
201529	101529	ParabR	ACTIVE
201530	101530	KamatN	ACTIVE
201531	101531	ZamindarU	ACTIVE
201532	101532	KinkarA	ACTIVE
201533	101533	BodduV	ACTIVE
201534	101534	NaleA	ACTIVE
201535	101535	AgastiSC	ACTIVE
201536	101536	GuddaS	ACTIVE
201537	101537	DhembareN	ACTIVE
201538	101538	SharmaSK	ACTIVE
201539	101539	BhaveV	ACTIVE
201540	101540	HariprasannaB	ACTIVE
201541	101541	JagnadeV	ACTIVE
201542	101542	SanchetiG	ACTIVE
201543	101543	RandiveS	ACTIVE
201544	101544	Chakraborty_P	ACTIVE
201545	101545	PatilYS	ACTIVE
201546	101546	LondheN	ACTIVE
201547	101547	DavidJ	ACTIVE
201548	101548	JadhavD	ACTIVE
201549	101549	HulleV	ACTIVE
201550	101550	ChatterjeeK	ACTIVE
201551	101551	NiyazM	ACTIVE
201552	101552	kholeK	ACTIVE
201553	101553	FartareA	ACTIVE
201554	101554	Kumar_M	ACTIVE
201555	101555	ShrivastavS	ACTIVE
201556	101556	JagtapPG	ACTIVE
201557	101557	PrakashOm	ACTIVE
201558	101558	Jagtap_S	ACTIVE
201559	101559	BadheG	ACTIVE
201560	101560	ThampyA	ACTIVE
201561	101561	UmapS	ACTIVE
201562	101562	SalgondA	ACTIVE
201563	101563	ImrankhanM	ACTIVE
201564	101564	AsabeP	ACTIVE
201565	101565	KesarkarN	ACTIVE
201566	101566	PrakashV	ACTIVE
201567	101567	BalghareS	ACTIVE
201568	101568	HasbeG	ACTIVE
201569	101569	JadhavSS	ACTIVE
201570	101570	PawarMB	ACTIVE
201571	101571	AkhuliS	ACTIVE
201572	101572	AnzarN	ACTIVE
201573	101573	SawantP	ACTIVE
201574	101574	PardeshiP	ACTIVE
201575	101575	PMPRISM	ACTIVE
201576	101576	KishoreB	ACTIVE
201577	101577	SudarshanS	ACTIVE
201578	101578	KumarDB	ACTIVE
201579	101579	SarkarI	ACTIVE
201580	101580	MaliP	ACTIVE
201581	101581	GhoshM	ACTIVE
201582	101582	BagadeP	ACTIVE
201583	101583	OmbleS	ACTIVE
201584	101584	KanthedS	ACTIVE
201585	101585	SubhashM	ACTIVE
201586	101586	MatlabeN	ACTIVE
201587	101587	GarudH	ACTIVE
201588	101588	JanjireS	ACTIVE
201589	101589	BhosaleSS	ACTIVE
201590	101590	LuktukeV	ACTIVE
201591	101591	GholapA	ACTIVE
201592	101592	PawarRR	ACTIVE
201593	101593	PawarVS	ACTIVE
201594	101594	PujariM	ACTIVE
201595	101595	TajaneD	ACTIVE
201596	101596	VikheS	ACTIVE
201597	101597	PharandeT	ACTIVE
201598	101598	SutarT	ACTIVE
201599	101599	Deshpande_PP	ACTIVE
201600	101600	PilareS	ACTIVE
201601	101601	ChaudhariS	ACTIVE
201602	101602	RajaramP	ACTIVE
201603	101603	SuraseB	ACTIVE
201604	101604	PatilSL	ACTIVE
201605	101605	Biswas_S	ACTIVE
201606	101606	Gupta_R	ACTIVE
201607	101607	ChaudharyK	ACTIVE
201608	101608	ThakurS	ACTIVE
201609	101609	GhiranikarA	ACTIVE
201610	101610	VermaRK	ACTIVE
201611	101611	TestP	ACTIVE
201612	101612	TalpeS	ACTIVE
201613	101613	BadgujarA	ACTIVE
201614	101614	SuryawanshiRS	ACTIVE
201615	101615	BalliparthyR	ACTIVE
201616	101616	NairT	ACTIVE
201617	101617	ChauhanV	ACTIVE
201618	101618	AchuthB	ACTIVE
201619	101619	SwamyG	ACTIVE
201620	101620	ModgekarB	ACTIVE
201621	101621	JoshiSR	ACTIVE
201622	101622	BeriJ	ACTIVE
201623	101623	ChavanC	ACTIVE
201624	101624	SantraJ	ACTIVE
201625	101625	MandeS	ACTIVE
201626	101626	ShethT	ACTIVE
201627	101627	ChakravortyU	ACTIVE
201628	101628	Patil_M	ACTIVE
201629	101629	ChaudharyAH	ACTIVE
201630	101630	GhoshS	ACTIVE
201631	101631	KumavatE	ACTIVE
201632	101632	GadkarV	ACTIVE
201633	101633	ZamanN	ACTIVE
201634	101634	Raju_K	ACTIVE
201635	101635	KrishnaR	ACTIVE
201636	101636	Yadav_VS	ACTIVE
201637	101637	PathipatiR	ACTIVE
201638	101638	BiranjeA	ACTIVE
201639	101639	SatputeS	ACTIVE
201640	101640	DharaR	ACTIVE
201641	101641	Paul_S	ACTIVE
201642	101642	NaskarD	ACTIVE
201643	101643	SoniV	ACTIVE
201644	101644	PandeyO	ACTIVE
201645	101645	ChauhanA	ACTIVE
201646	101646	PrajapatiP	ACTIVE
201647	101647	MaanN	ACTIVE
201648	101648	UkkadgaonkarP	ACTIVE
201649	101649	SagareA	ACTIVE
201650	101650	KareP	ACTIVE
201651	101651	PmLntpower	ACTIVE
201652	101652	SahasrabudheA	ACTIVE
201653	101653	SheikhS	ACTIVE
201654	101654	KadarbatchaS	ACTIVE
201655	101655	VelmuruganS	ACTIVE
201656	101656	SasikumarS	ACTIVE
201657	101657	PatilUV	ACTIVE
201658	101658	Civil_Maintenace	ACTIVE
201659	101659	LondheA	ACTIVE
201660	101660	GuptaNR	ACTIVE
201661	101661	NakadeS	ACTIVE
201662	101662	JagannathA	ACTIVE
201663	101663	PawarS	ACTIVE
201664	101664	SinhaD	ACTIVE
201665	101665	singh_rk	ACTIVE
201666	101666	BeheraK	ACTIVE
201667	101667	AkramM	ACTIVE
201668	101668	AnsariS	ACTIVE
201669	101669	AlamD	ACTIVE
201670	101670	DesaiT	ACTIVE
201671	101671	BiswasT	ACTIVE
201672	101672	KanoujiyaP	ACTIVE
201673	101673	DhoteM	ACTIVE
201674	101674	JhaR	ACTIVE
201675	101675	GhoshA	ACTIVE
201676	101676	ChouhanL	ACTIVE
201677	101677	GautamD	ACTIVE
201678	101678	DashManas	ACTIVE
201679	101679	JhaN	ACTIVE
201680	101680	BisenT	ACTIVE
201681	101681	BhargaveV	ACTIVE
201682	101682	GantaV	ACTIVE
201683	101683	GajjarC	ACTIVE
201684	101684	DashMrutyunjay	ACTIVE
201685	101685	BhattH	ACTIVE
201686	101686	JangidT	ACTIVE
201687	101687	KumarSushil	ACTIVE
201688	101688	KumarDharmendra	ACTIVE
201689	101689	LenkaN	ACTIVE
201690	101690	KarunaJ	ACTIVE
201691	101691	KumarSanallal	ACTIVE
201692	101692	KollamparambilS	ACTIVE
201693	101693	LadvaB	ACTIVE
201694	101694	MahanaB	ACTIVE
201695	101695	KhanM	ACTIVE
201696	101696	MishraAbhay	ACTIVE
201697	101697	KulkarniA	ACTIVE
201698	101698	ManiS	ACTIVE
201699	101699	KumarPawan	ACTIVE
201700	101700	KashyapK	ACTIVE
201701	101701	KumarSudhir	ACTIVE
201702	101702	NaikP	ACTIVE
201703	101703	MishraAmit	ACTIVE
201704	101704	MondalS	ACTIVE
201705	101705	NimsarkarT	ACTIVE
201706	101706	PandeyAmit	ACTIVE
201707	101707	PandeyDharamveer	ACTIVE
201708	101708	PrajapatD	ACTIVE
201709	101709	PandeyNeelesh	ACTIVE
201710	101710	ParmarH	ACTIVE
201711	101711	PandeyMaheshkumar	ACTIVE
201712	101712	PariharV	ACTIVE
201713	101713	SahuShibasis	ACTIVE
201714	101714	PratihariS	ACTIVE
201715	101715	SinghMahashakti	ACTIVE
201716	101716	PrajapatiD	ACTIVE
201717	101717	SathvaraJ	ACTIVE
201718	101718	RashidMd	ACTIVE
201719	101719	SealS	ACTIVE
201720	101720	SinghK	ACTIVE
201721	101721	RoutSrikant	ACTIVE
201722	101722	SharmaN	ACTIVE
201723	101723	RawatL	ACTIVE
201724	101724	RaiM	ACTIVE
201725	101725	RoutS	ACTIVE
201726	101726	SahuD	ACTIVE
201727	101727	SinghAnupam	ACTIVE
201728	101728	SankpalA	ACTIVE
201729	101729	SahuSujit	ACTIVE
201730	101730	RasheedM	ACTIVE
201731	101731	RathoreR	ACTIVE
201732	101732	SinghPoshendra	ACTIVE
201733	101733	TauheedA	ACTIVE
201734	101734	SinghManish	ACTIVE
201735	101735	SinghPalendra	ACTIVE
201736	101736	ThampiP	ACTIVE
201737	101737	TripathiV	ACTIVE
201738	101738	SubramanianA	ACTIVE
201739	101739	VermaS	ACTIVE
201740	101740	SinghDhirendra	ACTIVE
201741	101741	SuryawanshiK	ACTIVE
201742	101742	TiwariB	ACTIVE
201743	101743	UpadhyayP	ACTIVE
201744	101744	TripathyS	ACTIVE
201745	101745	YadavK	ACTIVE
201746	101746	TiwariR	ACTIVE
201747	101747	SinhaH	ACTIVE
201748	101748	ChandraSK	ACTIVE
201749	101749	SinghAshutosh	ACTIVE
201750	101750	SodhaV	ACTIVE
201751	101751	SoniR	ACTIVE
201752	101752	SinghAjaykumar	ACTIVE
201753	101753	SinghBarinder	ACTIVE
201754	101754	PrajapatiSK	ACTIVE
201755	101755	NaikSK	ACTIVE
201756	101756	PatelBB	ACTIVE
201757	101757	RaoNS	ACTIVE
201758	101758	TripathiSJ	ACTIVE
201759	101759	PatelAS	ACTIVE
201760	101760	VermaAR	ACTIVE
201761	101761	SharmaAnuj	ACTIVE
201762	101762	SinghRaju	ACTIVE
201763	101763	ManthenaV	ACTIVE
201764	101764	KurlikarR	ACTIVE
201765	101765	GrasimIR	ACTIVE
201766	101766	SharmaAD	ACTIVE
201767	101767	MalviyaN	ACTIVE
201768	101768	RahangdaleV	ACTIVE
201769	101769	SantiS	ACTIVE
201770	101770	IngaleY	ACTIVE
201771	101771	Sharma_N	ACTIVE
201772	101772	BasappaM	ACTIVE
201773	101773	MandavaE	ACTIVE
201774	101774	RahimM	ACTIVE
201775	101775	SuryawanshiPP	ACTIVE
201776	101776	DhallA	ACTIVE
201777	101777	SharmaAH	ACTIVE
201778	101778	ShaligramC	ACTIVE
201779	101779	MohanN	ACTIVE
201780	101780	SathayeI	ACTIVE
201781	101781	JangamS	ACTIVE
201782	101782	MataleN	ACTIVE
201783	101783	JanorkarH	ACTIVE
201784	101784	MalikS	ACTIVE
201785	101785	JhaSK	ACTIVE
201786	101786	ViruthagiriT	ACTIVE
201787	101787	KuniyilB	ACTIVE
201788	101788	KurupS	ACTIVE
201789	101789	PillaiA	ACTIVE
201790	101790	SinghMK	ACTIVE
201791	101791	PaulsamyP	ACTIVE
201792	101792	BajpaieeN	ACTIVE
201793	101793	KumarDS	ACTIVE
201794	101794	MullaM	ACTIVE
201795	101795	PimpaleK	ACTIVE
201796	101796	PadwalP	ACTIVE
201797	101797	YadavAK	ACTIVE
201798	101798	DorkeV	ACTIVE
201799	101799	JamwalR	ACTIVE
201800	101800	Dutta_S	ACTIVE
201801	101801	VankarP	ACTIVE
201802	101802	MaidamwarR	ACTIVE
201803	101803	SheejoS	ACTIVE
201804	101804	NimbalkarP	ACTIVE
201805	101805	RaoVP	ACTIVE
201806	101806	RaoV	ACTIVE
201807	101807	Mane_M	ACTIVE
201808	101808	NautiyalS	ACTIVE
201809	101809	ZawareA	ACTIVE
201810	101810	MozeS	ACTIVE
201811	101811	SharmaAK	ACTIVE
201812	101812	DeulkarA	ACTIVE
201813	101813	Patil_H	ACTIVE
201814	101814	IngleV	ACTIVE
201815	101815	PandaT	ACTIVE
201816	101816	NartamJ	ACTIVE
201817	101817	majisb	ACTIVE
201818	101818	middyarj	ACTIVE
201819	101819	sahugn	ACTIVE
201820	101820	beherabh	ACTIVE
201821	101821	thakursm	ACTIVE
201822	101822	shobhitsv	ACTIVE
201823	101823	bandyopadhyaydl	ACTIVE
201824	101824	pattnaikps	ACTIVE
201825	101825	goudadg	ACTIVE
201826	101826	pingnd	ACTIVE
201827	101827	nazirmm	ACTIVE
201828	101828	kumarvr	ACTIVE
201829	101829	dasguptaks	ACTIVE
201830	101830	sagarar	ACTIVE
201831	101831	shankarrb	ACTIVE
201832	101832	pattnaiksd	ACTIVE
201833	101833	santhanamss	ACTIVE
201834	101834	singhpm	ACTIVE
201835	101835	patelsp	ACTIVE
201836	101836	kumarat	ACTIVE
201837	101837	pratapbn	ACTIVE
201838	101838	dosisk	ACTIVE
201839	101839	sethuramankk	ACTIVE
201840	101840	sahubb	ACTIVE
201841	101841	malaiyarasankm	ACTIVE
201842	101842	anandvr	ACTIVE
201843	101843	dakshinamoorthyss	ACTIVE
201844	101844	sundaresansk	ACTIVE
201845	101845	karsc	ACTIVE
201846	101846	ippiliks	ACTIVE
201847	101847	arulrajvj	ACTIVE
201848	101848	munimb	ACTIVE
201849	101849	murugaiyass	ACTIVE
201850	101850	kumardr	ACTIVE
201851	101851	bhargavlm	ACTIVE
201852	101852	pillaiat	ACTIVE
201853	101853	nallaperumalpa	ACTIVE
201854	101854	muruganmm	ACTIVE
201855	101855	kumarvh	ACTIVE
201856	101856	ashfaquema	ACTIVE
201857	101857	ghoshas	ACTIVE
201858	101858	kumarkv	ACTIVE
201859	101859	jadhavdb	ACTIVE
201860	101860	ahmadia	ACTIVE
201861	101861	vishwakarmasg	ACTIVE
201862	101862	kumardn	ACTIVE
201863	101863	sainivg	ACTIVE
201864	101864	thennarasuma	ACTIVE
201865	101865	khanmm	ACTIVE
201866	101866	rao_sk	ACTIVE
201867	101867	gnanaprakasamgg	ACTIVE
201868	101868	kannanaa	ACTIVE
201869	101869	ghaggd	ACTIVE
201870	101870	mansuriag	ACTIVE
201871	101871	verma_ar	ACTIVE
201872	101872	DeshmukhS	ACTIVE
201873	101873	venkateshS	ACTIVE
201874	101874	ChaudharyR	ACTIVE
201875	101875	WategaveP	ACTIVE
201876	101876	ContractorM	ACTIVE
201877	101877	KondhalkarT	ACTIVE
201878	101878	SonawaneS	ACTIVE
201879	101879	MishraAS	ACTIVE
201880	101880	MarwahaN	ACTIVE
201881	101881	BirjeA	ACTIVE
201882	101882	KhedkarC	ACTIVE
201883	101883	BhosaleNC	ACTIVE
201884	101884	ShindeVH	ACTIVE
201885	101885	ShiralkarA	ACTIVE
201886	101886	JaydeokarA	ACTIVE
201887	101887	AgarwalP	ACTIVE
201888	101888	KarunakaranM	ACTIVE
201889	101889	NaikA	ACTIVE
201890	101890	JadhavVV	ACTIVE
201891	101891	ShrivastavSA	ACTIVE
201892	101892	MajumdarD	ACTIVE
201893	101893	AnavatterS	ACTIVE
201894	101894	Migrationtkii	ACTIVE
201895	101895	ChowdhuryM	ACTIVE
201896	101896	VarierV	ACTIVE
201897	101897	SomaniV	ACTIVE
201898	101898	PanickerRahul	ACTIVE
201899	101899	KumarN	ACTIVE
201900	101900	SutharH	ACTIVE
201901	101901	PoojaryM	ACTIVE
201902	101902	tkiisystem	ACTIVE
201903	101903	DeshmukhHM	ACTIVE
201904	101904	VaratJ	ACTIVE
201905	101905	Kulkarni_AA	ACTIVE
201906	101906	KadamDD	ACTIVE
201907	101907	RajR	ACTIVE
201908	101908	BarikR	ACTIVE
201909	101909	SelukarS	ACTIVE
201910	101910	AgrawalJ	ACTIVE
201911	101911	RakshitD	ACTIVE
201912	101912	AcharyaSK	ACTIVE
201913	101913	PadiyarK	ACTIVE
201914	101914	BighaneV	ACTIVE
201915	101915	Jadhav_A	ACTIVE
201916	101916	PrasadP	ACTIVE
201917	101917	ShindeN	ACTIVE
201918	101918	TitarR	ACTIVE
201919	101919	PawarU	ACTIVE
201920	101920	SagarV	ACTIVE
201921	101921	MadaneA	ACTIVE
201922	101922	VazeM	ACTIVE
201923	101923	tkii_Guest	ACTIVE
201924	101924	KothawadeS	ACTIVE
201925	101925	AgrawalS	ACTIVE
201926	101926	Pawar_S	ACTIVE
201927	101927	SrinivasM	ACTIVE
201928	101928	ManeA	ACTIVE
201929	101929	Kulkarni_S	ACTIVE
201930	101930	SaxenaS	ACTIVE
201931	101931	MullaD	ACTIVE
201932	101932	KumarSS	ACTIVE
201933	101933	ThrilokB	ACTIVE
201934	101934	KalalA	ACTIVE
201935	101935	KumarPV	ACTIVE
201936	101936	WaghelaM	ACTIVE
201937	101937	DangeS	ACTIVE
201938	101938	kumarA	ACTIVE
201939	101939	SanadiS	ACTIVE
201940	101940	PatilDD	ACTIVE
201941	101941	DongareA	ACTIVE
201942	101942	DhavaleA	ACTIVE
201943	101943	PawarNM	ACTIVE
201944	101944	ChastaM	ACTIVE
201945	101945	krishnandk	ACTIVE
201946	101946	JoshiN	ACTIVE
201947	101947	GhoshP	ACTIVE
201948	101948	PandeyDev	ACTIVE
201949	101949	PrajapatiA	ACTIVE
201950	101950	GaurS	ACTIVE
201951	101951	BorateP	ACTIVE
201952	101952	SawaseS	ACTIVE
201953	101953	SonawaneD	ACTIVE
201954	101954	RaneST	ACTIVE
201955	101955	NoriM	ACTIVE
201956	101956	SonkarA	ACTIVE
201957	101957	Singh_SK	ACTIVE
201958	101958	ReddyMP	ACTIVE
201959	101959	PathakPU	ACTIVE
201960	101960	BondreNV	ACTIVE
201961	101961	Singh-SK	ACTIVE
201962	101962	DesaiRT	ACTIVE
201963	101963	RamaVarmaRM	ACTIVE
201964	101964	YadavAmitK	ACTIVE
201965	101965	ChauhanMJ	ACTIVE
201966	101966	KumarYR	ACTIVE
201967	101967	PathakPK	ACTIVE
201968	101968	PrajapatiDS	ACTIVE
201969	101969	PandeyYK	ACTIVE
201970	101970	HaldarDS	ACTIVE
201971	101971	Kumar-VM	ACTIVE
201972	101972	KumarAP	ACTIVE
201973	101973	AnanthakrishnanMM	ACTIVE
201974	101974	VenkataramaniRI	ACTIVE
201975	101975	RathodHN	ACTIVE
201976	101976	TiwariMK	ACTIVE
201977	101977	PandeyPT	ACTIVE
201978	101978	JainSP	ACTIVE
201979	101979	RoutPP	ACTIVE
201980	101980	TiwariSS	ACTIVE
201981	101981	RouthSS	ACTIVE
201982	101982	KaushikRB	ACTIVE
201983	101983	MohantyKK	ACTIVE
201984	101984	DwivediRR	ACTIVE
201985	101985	ShuklaAR	ACTIVE
201986	101986	DhanreGT	ACTIVE
201987	101987	GuptaPR	ACTIVE
201988	101988	HarijanRK	ACTIVE
201989	101989	MewadeDG	ACTIVE
201990	101990	TiwariGG	ACTIVE
201991	101991	KumarPR	ACTIVE
201992	101992	PandeyCP	ACTIVE
201993	101993	ChoudharyNR	ACTIVE
201994	101994	SinghVR	ACTIVE
201995	101995	GhoshMM	ACTIVE
201996	101996	JadavCG	ACTIVE
201997	101997	SharmaVK	ACTIVE
201998	101998	SahuVP	ACTIVE
201999	101999	DubeySD	ACTIVE
202000	102000	KumarVM	ACTIVE
202001	102001	TotadiPK	ACTIVE
202002	102002	DasAS	ACTIVE
202003	102003	KhobragadeSB	ACTIVE
202004	102004	SinghSushilKB	ACTIVE
202005	102005	PatraDK	ACTIVE
202006	102006	RichhariyaAR	ACTIVE
202007	102007	PanditYA	ACTIVE
202008	102008	MahanayakJP	ACTIVE
202009	102009	YadavVivekSS	ACTIVE
202010	102010	SinghRK	ACTIVE
202011	102011	ShriwasNR	ACTIVE
202012	102012	RajeshAA	ACTIVE
202013	102013	UpadhyayAA	ACTIVE
202014	102014	SinghAG	ACTIVE
202015	102015	SinghSN	ACTIVE
202016	102016	AliSA	ACTIVE
202017	102017	PrajapatiRM	ACTIVE
202018	102018	YadavDevendraSN	ACTIVE
202019	102019	SakwarVP	ACTIVE
202020	102020	SinghSantoshK	ACTIVE
202021	102021	KouravVS	ACTIVE
202022	102022	NatarajanMN	ACTIVE
202023	102023	SaibabuKN	ACTIVE
202024	102024	MohapatraRK	ACTIVE
202025	102025	SutharHJ	ACTIVE
202026	102026	KumarNG	ACTIVE
202027	102027	SinghRS	ACTIVE
202028	102028	SathiskumarTT	ACTIVE
202029	102029	NayakJK	ACTIVE
202030	102030	TiwariSK	ACTIVE
202031	102031	PanickerRR	ACTIVE
202032	102032	AnsariMI	ACTIVE
202033	102033	ShivhareAtulKL	ACTIVE
202034	102034	Kumar_RK	ACTIVE
202035	102035	ChoubeyAK	ACTIVE
202036	102036	TomarKP	ACTIVE
202037	102037	GeddaSS	ACTIVE
202038	102038	Kumar-VR	ACTIVE
202039	102039	KatwalP	ACTIVE
202040	102040	DeyatiM	ACTIVE
202041	102041	Singh_A	ACTIVE
202042	102042	ChandelN	ACTIVE
202044	102044	tkIIEMCHP	ACTIVE
202045	102045	DangoteGhanaPM	ACTIVE
202046	102046	GumatiP	ACTIVE
202047	102047	MoreVM	ACTIVE
202048	102048	GargPT	ACTIVE
202049	102049	TiwariSD	ACTIVE
202050	102050	tkIIPrintScan	ACTIVE
202051	102051	LamaniL	ACTIVE
202052	102052	TambadeP	ACTIVE
202053	102053	ReddyDV	ACTIVE
202054	102054	BalaMK	ACTIVE
202055	102055	BarveB	ACTIVE
202056	102056	BhalR	ACTIVE
202057	102057	GangawaneK	ACTIVE
202058	102058	PawarAN	ACTIVE
202059	102059	Deshpande_P	ACTIVE
202060	102060	DhamangaonkarA	ACTIVE
202061	102061	ChaudhariMV	ACTIVE
202062	102062	AlbertR	ACTIVE
202063	102063	DhaliS	ACTIVE
202064	102064	RaghuvamsiP	ACTIVE
202065	102065	Kumar_S	ACTIVE
202066	102066	ShendeJ	ACTIVE
202067	102067	PandeyM	ACTIVE
202068	102068	PatilVB	ACTIVE
202069	102069	DeshpandeAP	ACTIVE
202070	102070	KrishnamohanDV	ACTIVE
202071	102071	ThakreN	ACTIVE
202072	102072	AwasthiSK	ACTIVE
202073	102073	SinghRB	ACTIVE
202074	102074	BiranjeV	ACTIVE
202075	102075	WaingadeR	ACTIVE
202076	102076	KamalakannanK	ACTIVE
202077	102077	AcharyaR	ACTIVE
202078	102078	SolseS	ACTIVE
202079	102079	VasanthanKP	ACTIVE
202080	102080	RanaD	ACTIVE
202081	102081	AhireS	ACTIVE
202082	102082	PatelM	ACTIVE
202083	102083	BhaduriA	ACTIVE
202084	102084	KadamM	ACTIVE
202085	102085	VermaN	ACTIVE
202086	102086	PingaliV	ACTIVE
202087	102087	DanielS	ACTIVE
202088	102088	Chaudhari_MV	ACTIVE
202089	102089	GhadgeS	ACTIVE
202090	102090	DeoM	ACTIVE
202091	102091	BaskaranSV	ACTIVE
202092	102092	JoshiG	ACTIVE
202093	102093	KitukaleS	ACTIVE
202094	102094	SainiE	ACTIVE
202095	102095	KathpalA	ACTIVE
202096	102096	PatilAN	ACTIVE
202097	102097	JadhavVT	ACTIVE
202098	102098	MinjP	ACTIVE
202099	102099	GedelaD	ACTIVE
202100	102100	KhadeR	ACTIVE
202101	102101	GawandeA	ACTIVE
202102	102102	STCCM01	ACTIVE
202103	102103	Printer.admin	ACTIVE
202104	102104	DubeyA	ACTIVE
202105	102105	MaseV	ACTIVE
202106	102106	AttarS	ACTIVE
202107	102107	PKumar	ACTIVE
202108	102108	SorateA	ACTIVE
202109	102109	spdmsbatch	ACTIVE
202110	102110	JadhavPR	ACTIVE
202111	102111	ShrivastavaA	ACTIVE
202112	102112	DasTR	ACTIVE
202113	102113	PhadnisN	ACTIVE
202114	102114	KishoreN	ACTIVE
202115	102115	MishraBK	ACTIVE
202116	102116	MKumar	ACTIVE
202117	102117	E3DBatch	ACTIVE
202118	102118	DoraS	ACTIVE
202119	102119	BeheraSB	ACTIVE
202120	102120	BarwadC	ACTIVE
202121	102121	DeshmaneP	ACTIVE
202122	102122	BotreS	ACTIVE
202123	102123	GandrotuV	ACTIVE
202124	102124	MuruganA	ACTIVE
202125	102125	SutarM	ACTIVE
202126	102126	KaruppannanK	ACTIVE
202127	102127	Mishra_S	ACTIVE
202128	102128	ManeSN	ACTIVE
202129	102129	Deshpande_G	ACTIVE
202130	102130	UndeN	ACTIVE
202131	102131	KshirsagarS	ACTIVE
202132	102132	NairD	ACTIVE
202133	102133	KumarRR	ACTIVE
202134	102134	ShrivastavaRM	ACTIVE
202135	102135	SrikanthG	ACTIVE
202136	102136	FlywinI	ACTIVE
202137	102137	MajumdarS	ACTIVE
202138	102138	Kumar.A	ACTIVE
202139	102139	PatroU	ACTIVE
202140	102140	PatilSP	ACTIVE
202141	102141	PrimusTech	ACTIVE
202142	102142	SharmaAM	ACTIVE
202143	102143	RavellaS	ACTIVE
202144	102144	ShrivastavaS	ACTIVE
202145	102145	GhargadeD	ACTIVE
202146	102146	MadduriB	ACTIVE
202147	102147	ShindeAR	ACTIVE
202148	102148	LaljibhaiV	ACTIVE
202149	102149	SinghAR	ACTIVE
202150	102150	BorageA	ACTIVE
202151	102151	HajnaleA	ACTIVE
202152	102152	SinghBK	ACTIVE
202153	102153	JadhavN	ACTIVE
202154	102154	DantamA	ACTIVE
202155	102155	GodboleM	ACTIVE
202156	102156	DindoreP	ACTIVE
202157	102157	PatelS	ACTIVE
202158	102158	DongreS	ACTIVE
202159	102159	BhirudR	ACTIVE
202160	102160	ManivannanA	ACTIVE
202161	102161	DweraipudiV	ACTIVE
202162	102162	VirkudN	ACTIVE
202163	102163	PrabhavalkarA	ACTIVE
202164	102164	PrakashA	ACTIVE
202165	102165	MhaiskarR	ACTIVE
202166	102166	GargD	ACTIVE
202167	102167	HarishankarL	ACTIVE
202168	102168	SahooA	ACTIVE
202169	102169	ShahK	ACTIVE
202170	102170	Patil-R	ACTIVE
202171	102171	JambhaleS	ACTIVE
202172	102172	YadavV	ACTIVE
202173	102173	Patil-B	ACTIVE
202174	102174	tkiiVaultAdmin	ACTIVE
202175	102175	Kulkarni-A	ACTIVE
202176	102176	PawarSM	ACTIVE
202177	102177	MaliKM	ACTIVE
202178	102178	DesaiA	ACTIVE
202179	102179	Soni-V	ACTIVE
202180	102180	GautamR	ACTIVE
202181	102181	AglaweS	ACTIVE
202182	102182	SenA	ACTIVE
202183	102183	KherdeA	ACTIVE
202184	102184	KumarV	ACTIVE
202185	102185	DewanganA	ACTIVE
202186	102186	SharmaR	ACTIVE
202187	102187	VenkateswararaoK	ACTIVE
202188	102188	SharmaG	ACTIVE
202189	102189	JainN	ACTIVE
202190	102190	JoshiVM	ACTIVE
202191	102191	GauswamiA	ACTIVE
202192	102192	SinghP	ACTIVE
202193	102193	Singh-P	ACTIVE
202194	102194	RanjithkumarK	ACTIVE
202195	102195	AhirkarM	ACTIVE
202196	102196	VaidyaT	ACTIVE
202197	102197	KumthekarP	ACTIVE
202198	102198	SalveR	ACTIVE
202199	102199	PatilO	ACTIVE
202200	102200	JirangeP	ACTIVE
202201	102201	Kumar-DR	ACTIVE
202202	102202	WatK	ACTIVE
202203	102203	Patil-AG	ACTIVE
202204	102204	SakeN	ACTIVE
202205	102205	ZombadeR	ACTIVE
202206	102206	ShiroleJ	ACTIVE
202207	102207	BoyaneD	ACTIVE
202208	102208	PatilOV	ACTIVE
202209	102209	PatilNS	ACTIVE
202210	102210	MadhusudhanC	ACTIVE
202211	102211	PrabakaranM	ACTIVE
202212	102212	KharaA	ACTIVE
202213	102213	PaulE	ACTIVE
202214	102214	GeorgeA	ACTIVE
202215	102215	ReddyV	ACTIVE
202216	102216	BhaleraoSS	ACTIVE
202217	102217	MoreA	ACTIVE
202218	102218	Patil-S	ACTIVE
202219	102219	BhaleraoHR	ACTIVE
202220	102220	RelekarA	ACTIVE
202221	102221	MondalC	ACTIVE
202222	102222	JenaB	ACTIVE
202223	102223	PrasadR	ACTIVE
202224	102224	MondalP	ACTIVE
202225	102225	JayakumarJM	ACTIVE
202226	102226	PisalA	ACTIVE
202227	102227	VulluriKondalaS	ACTIVE
202228	102228	SenapatiSH	ACTIVE
202229	102229	BiswalG	ACTIVE
202230	102230	Patel-A	ACTIVE
202231	102231	Patel_A	ACTIVE
202232	102232	ShyamS	ACTIVE
202233	102233	SameerK	ACTIVE
202234	102234	KondalaS	ACTIVE
202235	102235	Phalke-A	ACTIVE
202236	102236	PatilSS	ACTIVE
202237	102237	VhankeriR	ACTIVE
202238	102238	PatilPR	ACTIVE
202239	102239	TiwariA	ACTIVE
202240	102240	SrivastavaA	ACTIVE
202241	102241	Singh-R	ACTIVE
202242	102242	MondalA	ACTIVE
202243	102243	Singh-D	ACTIVE
202244	102244	SahuJ	ACTIVE
202245	102245	GoyalP	ACTIVE
202246	102246	PoojaryR	ACTIVE
202247	102247	VijayaS	ACTIVE
202248	102248	Das-A	ACTIVE
202249	102249	RuidasA	ACTIVE
202250	102250	ShelkeB	ACTIVE
202251	102251	ZopeA	ACTIVE
202252	102252	PawarB	ACTIVE
202253	102253	SathishKumarR	ACTIVE
202254	102254	GuruduM	ACTIVE
202255	102255	HarshavardhanaB	ACTIVE
202256	102256	VissapragadaR	ACTIVE
202257	102257	NaraganiV	ACTIVE
202258	102258	SsamiduraiK	ACTIVE
202259	102259	SinghKR	ACTIVE
202260	102260	primustech2	ACTIVE
202261	102261	BhaleraoV	ACTIVE
202262	102262	WaghwalA	ACTIVE
202263	102263	MayavanK	ACTIVE
202264	102264	Pawar-A	ACTIVE
202265	102265	BadgujarAR	ACTIVE
202266	102266	SarodeB	ACTIVE
202267	102267	BhuyanN	ACTIVE
202268	102268	Pawar-AR	ACTIVE
202269	102269	ManjulA	ACTIVE
202270	102270	KumarD	ACTIVE
202271	102271	MohantyR	ACTIVE
202272	102272	ChabriaS	ACTIVE
202273	102273	NarnavreR	ACTIVE
202274	102274	PatilP	ACTIVE
202275	102275	BagwanS	ACTIVE
202276	102276	NarayanB	ACTIVE
202277	102277	PatilGA	ACTIVE
202278	102278	irfan.ahmed	ACTIVE
202279	102279	PawarAU	ACTIVE
202280	102280	PisalAA	ACTIVE
202281	102281	JohnsA	ACTIVE
202282	102282	BeheraP	ACTIVE
202283	102283	PatroP	ACTIVE
202284	102284	MohapatraS	ACTIVE
202285	102285	HarioudhA	ACTIVE
202286	102286	Kumar-M	ACTIVE
202287	102287	IngaleR	ACTIVE
202288	102288	Kumar-A	ACTIVE
202289	102289	Chatterjee-D	ACTIVE
202290	102290	DharammaliP	ACTIVE
202291	102291	VairagiA	ACTIVE
202292	102292	BasantD	ACTIVE
202293	102293	DeshmukhSR	ACTIVE
202294	102294	AnirudhA	ACTIVE
202295	102295	DeshmukhRN	ACTIVE
202296	102296	MayekarS	ACTIVE
202297	102297	TiwariS	ACTIVE
202298	102298	GargateA	ACTIVE
202299	102299	PandyaH	ACTIVE
202300	102300	JenaS	ACTIVE
202301	102301	Kumar-D	ACTIVE
202302	102302	EliyavelS	ACTIVE
202303	102303	GanapathiG	ACTIVE
202304	102304	SinghS	ACTIVE
202305	102305	BanerjeeA	ACTIVE
202306	102306	Pawar-S	ACTIVE
202307	102307	Patil-SR	ACTIVE
202308	102308	BabuL	ACTIVE
202309	102309	SuradkarS	ACTIVE
\.


--
-- Data for Name: usph; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usph (uspw_id, mothername, birthplace, firstschool) FROM stdin;
200001	admin	BNG	School
200002	Mother	Pune1	School1
200003	Mother	Pune2	School2
200004	Mother	Pune3	School3
\.


--
-- Data for Name: uspw; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.uspw (uspw_id, password, algorithm, salt, login_id, createdtime) FROM stdin;
200001	$2a$08$tPH4zrGDVSNBrohY72ebx.DN6BfSan8rpnckLWaSUP19TnaY4qbbm	bcrypt	\\x63736465736b61646d696e	200001	2020-09-13 21:15:30.389015
200002	$2a$08$tPH4zrGDVSNBrohY72ebx.DN6BfSan8rpnckLWaSUP19TnaY4qbbm	bcrypt	\\x63736465736b61646d696e	200002	2020-11-02 21:56:36.57513
200003	$2a$08$tPH4zrGDVSNBrohY72ebx.DN6BfSan8rpnckLWaSUP19TnaY4qbbm	bcrypt	\\x63736465736b61646d696e	200003	2020-11-02 21:56:36.593023
200004	$2a$08$tPH4zrGDVSNBrohY72ebx.DN6BfSan8rpnckLWaSUP19TnaY4qbbm	bcrypt	\\x63736465736b61646d696e	200004	2020-11-02 21:56:37.276099
200005	$2b$08$NoSvhiYOyzWjw2.2Oj5M2OVKsPN1texb2yHGFjwwgtwTgAsUP8ABq	bcrypt	\\x38	200005	2020-12-07 12:53:45.877
\.


--
-- Data for Name: usre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usre (usre_id, user_id, ustp_id, usdg_id, usdt_id, usrt_id, uscn_id) FROM stdin;
100001	100001	1001	4001	2001	5001	3001
100002	100002	1002	4002	2001	5001	3002
100003	100003	1002	4002	2002	5002	3003
100004	100004	1002	4002	2003	5001	3004
\.


--
-- Data for Name: usrl; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usrl (usrl_id, name, description) FROM stdin;
301	Administrator	Administrator
302	ITsupport	ITsupport
303	Helpdesk	Helpdesk
304	enduser	enduser
\.


--
-- Data for Name: usrt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usrt (usrt_id, reportingto_id) FROM stdin;
5001	100001
5002	100002
\.


--
-- Data for Name: ussg; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ussg (ussg_id, sgname, sgowner_id, description) FROM stdin;
6001	Admin	100001	For Admin Only
6002	IT Support	100001	For TKII IT Support
\.


--
-- Data for Name: ustp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ustp (ustp_id, usertype) FROM stdin;
1001	Administrator
1002	Login User
1003	Normal User
\.


--
-- Data for Name: usud; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usud (user_id, first_name, middle_name, last_name, description, createdtime) FROM stdin;
100001	Administrator	\N	\N	Admin User	2020-09-13 09:45:56.728924
100002	AJAY	B.	Dighe	Helpdesk User	2020-11-02 20:51:52.955328
100003	SACHIN	S	GAIKWAD	ITsupport User	2020-11-02 20:51:59.355025
100006	Santosh	\N	Adsul	enduser	2020-12-07 18:23:46
100004	PREM	SHANKAR	SHRIVASTAV	enduser	2020-11-02 20:52:14.750058
100007	Arun	\N	Chadha	enduser	2020-12-07 18:23:46
100008	Sangram	\N	Shitole	enduser	2020-12-07 18:23:46
100009	Oak	\N	Purva	enduser	2020-12-07 18:23:46
100010	Somarajan	\N	Pillai	enduser	2020-12-07 18:23:46
100011	tkii	\N	Desksupport2	enduser	2020-12-07 18:23:46
100012	Anil	\N	Talnikar	enduser	2020-12-07 18:23:46
100013	Shekhar	\N	Gaikwad	enduser	2020-12-07 18:23:46
100014	Abhijit	\N	Khandekar	enduser	2020-12-07 18:23:46
100015	Sachin	\N	Kangarkar	enduser	2020-12-07 18:23:46
100016	Shripati	\N	Rupnawar	enduser	2020-12-07 18:23:46
100017	Rajashree	\N	Joshi	enduser	2020-12-07 18:23:46
100018	Shrinivas	\N	Kamble	enduser	2020-12-07 18:23:46
100019	Mahesh	\N	Gole	enduser	2020-12-07 18:23:46
100020	Avinash	\N	Andore	enduser	2020-12-07 18:23:46
100021	Kini	\N	Arun	enduser	2020-12-07 18:23:46
100022	Anup	\N	Patil	enduser	2020-12-07 18:23:46
100023	Onkar	\N	Gosavi	enduser	2020-12-07 18:23:46
100024	Kumbhar	\N	V	enduser	2020-12-07 18:23:46
100025	Iranappa	\N	Manthale	enduser	2020-12-07 18:23:46
100026	Shrikrishna	\N	Birare	enduser	2020-12-07 18:23:46
100027	Waghmare	\N	A	enduser	2020-12-07 18:23:46
100028	Ramchandra	\N	Gadiwadd	enduser	2020-12-07 18:23:46
100005	RIZWAN	-	ALI	test user creation	2020-12-07 18:23:46.467025
100029	tkii	\N	Desksupport3	enduser	2020-12-07 18:23:46
100030	Smita	\N	Dhanore	enduser	2020-12-07 18:23:46
100031	Vishal	\N	Bhosale	enduser	2020-12-07 18:23:46
100032	Pankaj	\N	Kamble	enduser	2020-12-07 18:23:46
100033	Sagar	\N	Kodilkar	enduser	2020-12-07 18:23:46
100034	Avinash	\N	Nagare	enduser	2020-12-07 18:23:46
100035	Sachin	\N	Potdar	enduser	2020-12-07 18:23:46
100036	Dineshkumar	\N	Wani	enduser	2020-12-07 18:23:46
100037	Shekhar	\N	Choure	enduser	2020-12-07 18:23:46
100038	Neeta	\N	Vispute	enduser	2020-12-07 18:23:46
100039	Amol	\N	Chaudhari	enduser	2020-12-07 18:23:46
100040	Umesh	\N	Kadam	enduser	2020-12-07 18:23:46
100041	Sunil	\N	Kumbhar	enduser	2020-12-07 18:23:46
100042	Shashikumar	\N	Todkar	enduser	2020-12-07 18:23:46
100043	Vinod	\N	Wadile	enduser	2020-12-07 18:23:46
100044	Ali	\N	Asgar	enduser	2020-12-07 18:23:46
100045	Pritam	\N	Kulkarni	enduser	2020-12-07 18:23:46
100046	Shridhar	\N	Kotnis	enduser	2020-12-07 18:23:46
100047	Prakash	\N	Wagh	enduser	2020-12-07 18:23:46
100048	Suraj	\N	Lambe	enduser	2020-12-07 18:23:46
100049	Digvijay	\N	Kharade	enduser	2020-12-07 18:23:46
100050	Ameya	\N	Golwalkar	enduser	2020-12-07 18:23:46
100051	Vinod	\N	Mane	enduser	2020-12-07 18:23:46
100052	Sandhya	\N	Jadhav	enduser	2020-12-07 18:23:46
100053	Mayur	\N	Patil	enduser	2020-12-07 18:23:46
100054	Rajesh	\N	Kulkarni	enduser	2020-12-07 18:23:46
100055	Prashant	\N	Deshpande	enduser	2020-12-07 18:23:46
100056	Kapil	\N	Shirole	enduser	2020-12-07 18:23:46
100057	Dattatray	\N	More	enduser	2020-12-07 18:23:46
100058	Vasudha	\N	Buchake	enduser	2020-12-07 18:23:46
100059	Vaibhav	\N	Borate	enduser	2020-12-07 18:23:46
100060	Dnyanesh	\N	Bute	enduser	2020-12-07 18:23:46
100061	Harshal	\N	Dhande	enduser	2020-12-07 18:23:46
100062	Patil	\N	Shashikant	enduser	2020-12-07 18:23:46
100063	Anil	\N	Godse	enduser	2020-12-07 18:23:46
100064	Santosh	\N	Pujari	enduser	2020-12-07 18:23:46
100065	Dattatraya	\N	Dhole	enduser	2020-12-07 18:23:46
100066	Vinit	\N	Mokashi	enduser	2020-12-07 18:23:46
100067	Ganesh	\N	Deshpande	enduser	2020-12-07 18:23:46
100068	Vilas	\N	Apet	enduser	2020-12-07 18:23:46
100069	Girish	\N	Bansude	enduser	2020-12-07 18:23:46
100070	Ganesh	\N	Jagtap	enduser	2020-12-07 18:23:46
100071	Vikram	\N	Vairat	enduser	2020-12-07 18:23:46
100072	Maran	\N	Vengai	enduser	2020-12-07 18:23:46
100073	Santosh	\N	Pujari	enduser	2020-12-07 18:23:46
100074	Prakash	\N	Sutar	enduser	2020-12-07 18:23:46
100075	Pooja	\N	Bhalerao	enduser	2020-12-07 18:23:46
100076	Ajit	\N	Koshti	enduser	2020-12-07 18:23:46
100077	Yuvraj	\N	Gangawane	enduser	2020-12-07 18:23:46
100078	Natasha	\N	Kulkarni	enduser	2020-12-07 18:23:46
100079	Joshi	\N	A	enduser	2020-12-07 18:23:46
100080	Shinde	\N	A	enduser	2020-12-07 18:23:46
100081	Krishnakant	\N	Kurma	enduser	2020-12-07 18:23:46
100082	Sriharsha	\N	Sandaka	enduser	2020-12-07 18:23:46
100083	Ajit	\N	Chougule	enduser	2020-12-07 18:23:46
100084	Nitin	\N	Marane	enduser	2020-12-07 18:23:46
100085	Navnath	\N	Borawake	enduser	2020-12-07 18:23:46
100086	Kushal	\N	Shinde	enduser	2020-12-07 18:23:46
100087	Harish	\N	Patil	enduser	2020-12-07 18:23:46
100088	Dattamurti	\N	Degaonkar	enduser	2020-12-07 18:23:46
100089	Nishikant	\N	Nanda	enduser	2020-12-07 18:23:46
100090	Amit	\N	Pawar	enduser	2020-12-07 18:23:46
100091	Anil	\N	Bandre	enduser	2020-12-07 18:23:46
100092	Abhinav	\N	Kulkarni	enduser	2020-12-07 18:23:46
100093	Khaja	\N	Ahmed	enduser	2020-12-07 18:23:46
100094	Santosh	\N	Wadghule	enduser	2020-12-07 18:23:46
100095	Ashok	\N	Alur	enduser	2020-12-07 18:23:46
100096	Sudhakar	\N	Zambre	enduser	2020-12-07 18:23:46
100097	Avilkumar	\N	Bekwadkar	enduser	2020-12-07 18:23:46
100098	Dhananjay	\N	Mavadikar	enduser	2020-12-07 18:23:46
100099	Santosh	\N	Gavade	enduser	2020-12-07 18:23:46
100100	Deepak	\N	Gawali	enduser	2020-12-07 18:23:46
100101	Suyog	\N	Kumbhar	enduser	2020-12-07 18:23:46
100102	Ashish	\N	Kamble	enduser	2020-12-07 18:23:46
100103	Amit	\N	Koli	enduser	2020-12-07 18:23:46
100104	CH	\N	Jayaprakash	enduser	2020-12-07 18:23:46
100105	Ketan	\N	Pendse	enduser	2020-12-07 18:23:46
100106	Suraj	\N	Shete	enduser	2020-12-07 18:23:46
100107	Seema	\N	Dere	enduser	2020-12-07 18:23:46
100108	Sunil	\N	Kothale	enduser	2020-12-07 18:23:46
100109	Deshmukh	\N	Sachin	enduser	2020-12-07 18:23:46
100110	Yuvraj	\N	Kashidkar	enduser	2020-12-07 18:23:46
100111	Nilesh	\N	Chaudhari	enduser	2020-12-07 18:23:46
100112	ok	\N	Kulkarni	enduser	2020-12-07 18:23:46
100113	Chopade	\N	Sudhir	enduser	2020-12-07 18:23:46
100114	Laxman	\N	Jadhav	enduser	2020-12-07 18:23:46
100115	Dnyaneshwar	\N	Bhosale	enduser	2020-12-07 18:23:46
100232	Raghaviah	\N	Veera	enduser	2020-12-07 18:23:46
100116	Shivaji	\N	Shirsath	enduser	2020-12-07 18:23:46
100117	Rajiv	\N	Kondawar	enduser	2020-12-07 18:23:46
100118	Sagar	\N	Deshmane	enduser	2020-12-07 18:23:46
100119	Ganesh	\N	Dhanrale	enduser	2020-12-07 18:23:46
100120	Jitesh	\N	Limje	enduser	2020-12-07 18:23:46
100121	Sachin	\N	Kumbhar	enduser	2020-12-07 18:23:46
100122	Amrapali	\N	Waghmare	enduser	2020-12-07 18:23:46
100123	Vijaykumar	\N	Shinde	enduser	2020-12-07 18:23:46
100124	Swapnil	\N	Chavan	enduser	2020-12-07 18:23:46
100125	Ravindra	\N	Kamthe	enduser	2020-12-07 18:23:46
100126	Chetan	\N	Limbikai	enduser	2020-12-07 18:23:46
100127	Yuvraj	\N	Patil	enduser	2020-12-07 18:23:46
100128	Shrinivas	\N	Kamble	enduser	2020-12-07 18:23:46
100129	Uttam	\N	Kulkarni	enduser	2020-12-07 18:23:46
100130	Mayuresh	\N	Kanherikar	enduser	2020-12-07 18:23:46
100131	Ajit	\N	Peshave	enduser	2020-12-07 18:23:46
100132	Nilesh	\N	Bhosale	enduser	2020-12-07 18:23:46
100133	Sudhir	\N	Mishra	enduser	2020-12-07 18:23:46
100134	Makarand	\N	Marathe	enduser	2020-12-07 18:23:46
100135	Yashwant	\N	Sakhardande	enduser	2020-12-07 18:23:46
100136	Suhas	\N	Talathi	enduser	2020-12-07 18:23:46
100137	Sunil	\N	Sagane	enduser	2020-12-07 18:23:46
100138	Sharad	\N	Sankpal	enduser	2020-12-07 18:23:46
100139	Unde	\N	Uday	enduser	2020-12-07 18:23:46
100140	Sanjay	\N	Misal	enduser	2020-12-07 18:23:46
100141	Uday	\N	Pandit	enduser	2020-12-07 18:23:46
100142	Swapnil	\N	Patekar	enduser	2020-12-07 18:23:46
100143	Sunilkumar	\N	Savalgi	enduser	2020-12-07 18:23:46
100144	Azharuddin	\N	Mohd	enduser	2020-12-07 18:23:46
100145	Virendra	\N	Acharya	enduser	2020-12-07 18:23:46
100146	Nandukishore	\N	Singh	enduser	2020-12-07 18:23:46
100147	Priya	\N	Kakade	enduser	2020-12-07 18:23:46
100148	Pranay	\N	Yedewar	enduser	2020-12-07 18:23:46
100149	Sunil	\N	Bhatade	enduser	2020-12-07 18:23:46
100150	Swapnil	\N	Halgekar	enduser	2020-12-07 18:23:46
100151	Manish	\N	Parchure	enduser	2020-12-07 18:23:46
100152	Anagha	\N	Deshpande	enduser	2020-12-07 18:23:46
100153	Swikriti	\N	Bhardwaj	enduser	2020-12-07 18:23:46
100154	Sandeep	\N	Dadhe	enduser	2020-12-07 18:23:46
100155	Tanaji	\N	Gangawane	enduser	2020-12-07 18:23:46
100156	Mandar	\N	Karve	enduser	2020-12-07 18:23:46
100157	Khomane	\N	V	enduser	2020-12-07 18:23:46
100158	Kumbhar	\N	B	enduser	2020-12-07 18:23:46
100159	Jaisinh	\N	Nimbalkar	enduser	2020-12-07 18:23:46
100160	Patil	\N	Y	enduser	2020-12-07 18:23:46
100161	Poovalingam	\N	Palani	enduser	2020-12-07 18:23:46
100162	Ravi	\N	Mullur	enduser	2020-12-07 18:23:46
100163	Mahadev	\N	Rawool	enduser	2020-12-07 18:23:46
100164	Sapkal	\N	S	enduser	2020-12-07 18:23:46
100165	Sasanapuri	\N	R	enduser	2020-12-07 18:23:46
100166	Udapikar	\N	Raj	enduser	2020-12-07 18:23:46
100167	Vishal	\N	Patil	enduser	2020-12-07 18:23:46
100168	Prashant	\N	Sambare	enduser	2020-12-07 18:23:46
100169	Harishkumar	\N	Dhabi	enduser	2020-12-07 18:23:46
100170	Milind	\N	Todkar	enduser	2020-12-07 18:23:46
100171	Sandeep	\N	Gawas	enduser	2020-12-07 18:23:46
100172	Sanjeev	\N	Yelge	enduser	2020-12-07 18:23:46
100173	Somnath	\N	Mane	enduser	2020-12-07 18:23:46
100174	Ganesh	\N	Pawar	enduser	2020-12-07 18:23:46
100175	Ganeshkumar	\N	Thayalan	enduser	2020-12-07 18:23:46
100176	Amol	\N	Shewale	enduser	2020-12-07 18:23:46
100177	Arunkumar	\N	Gobbur	enduser	2020-12-07 18:23:46
100178	Prasad	\N	Patil	enduser	2020-12-07 18:23:46
100179	James	\N	Dcosta	enduser	2020-12-07 18:23:46
100180	Rahul	\N	Shinde	enduser	2020-12-07 18:23:46
100181	Deepak	\N	Mhasudage	enduser	2020-12-07 18:23:46
100182	Xevier	\N	Mendis	enduser	2020-12-07 18:23:46
100183	Girish	\N	Paranjape	enduser	2020-12-07 18:23:46
100184	Rishikesh	\N	Jadhav	enduser	2020-12-07 18:23:46
100185	Dildar	\N	Surve	enduser	2020-12-07 18:23:46
100186	Amol	\N	Ranmode	enduser	2020-12-07 18:23:46
100187	Swapnil	\N	Mohare	enduser	2020-12-07 18:23:46
100188	Akash	\N	Kamble	enduser	2020-12-07 18:23:46
100189	Sushant	\N	Kale	enduser	2020-12-07 18:23:46
100190	Anup	\N	Kshirsagar	enduser	2020-12-07 18:23:46
100191	Ganapati	\N	Jagadale	enduser	2020-12-07 18:23:46
100192	Nilesh	\N	Nanavare	enduser	2020-12-07 18:23:46
100193	Arvind	\N	Rajivan	enduser	2020-12-07 18:23:46
100194	Sachin	\N	Gurav	enduser	2020-12-07 18:23:46
100195	Sanjay	\N	Wakchaure	enduser	2020-12-07 18:23:46
100196	Manoj	\N	Nazirkar	enduser	2020-12-07 18:23:46
100197	Amol	\N	Parkale	enduser	2020-12-07 18:23:46
100198	Subhash	\N	Nanekar	enduser	2020-12-07 18:23:46
100199	Kiran	\N	Kamble	enduser	2020-12-07 18:23:46
100200	Kirtikumar	\N	Deochake	enduser	2020-12-07 18:23:46
100201	Rajendra	\N	Abhyankar	enduser	2020-12-07 18:23:46
100202	Nitin	\N	Dhoke	enduser	2020-12-07 18:23:46
100203	Vikas	\N	Khade	enduser	2020-12-07 18:23:46
100204	Dijeesh	\N	Divakaran	enduser	2020-12-07 18:23:46
100205	Nilesh	\N	Kudte	enduser	2020-12-07 18:23:46
100206	Vinod	\N	Patil	enduser	2020-12-07 18:23:46
100207	Janardhan	\N	Sunkara	enduser	2020-12-07 18:23:46
100208	Paresh	\N	Chaudhari	enduser	2020-12-07 18:23:46
100209	Amit	\N	Bhambure	enduser	2020-12-07 18:23:46
100210	Kumar	\N	Patil	enduser	2020-12-07 18:23:46
100211	Omkar	\N	Kale	enduser	2020-12-07 18:23:46
100212	Kishore	\N	Gedela	enduser	2020-12-07 18:23:46
100213	Tushar	\N	Chaudhari	enduser	2020-12-07 18:23:46
100214	Anirudhh	\N	Ingle	enduser	2020-12-07 18:23:46
100215	Ajit	\N	Pagale	enduser	2020-12-07 18:23:46
100216	R	\N	Raghunath	enduser	2020-12-07 18:23:46
100217	TV	\N	Pradeep	enduser	2020-12-07 18:23:46
100218	Tarun	\N	Kumar	enduser	2020-12-07 18:23:46
100219	Bhaskar	\N	Dutta	enduser	2020-12-07 18:23:46
100220	Ajees	\N	Thajudheen	enduser	2020-12-07 18:23:46
100221	Anirudha	\N	Chakraverty	enduser	2020-12-07 18:23:46
100222	Abhijit	\N	Chakraborti	enduser	2020-12-07 18:23:46
100223	Samiran	\N	Singha	enduser	2020-12-07 18:23:46
100224	Sarfarazul	\N	Hoda	enduser	2020-12-07 18:23:46
100225	Debashis	\N	Das	enduser	2020-12-07 18:23:46
100226	Probir	\N	Modak	enduser	2020-12-07 18:23:46
100227	Venkateshwara	\N	Rao	enduser	2020-12-07 18:23:46
100228	Srinivasa	\N	Rao	enduser	2020-12-07 18:23:46
100229	Giri	\N	Ramu	enduser	2020-12-07 18:23:46
100230	Mathai	\N	Samuel	enduser	2020-12-07 18:23:46
100231	Satyanarayana	\N	Murthy	enduser	2020-12-07 18:23:46
100233	Vikas	\N	Gupta	enduser	2020-12-07 18:23:46
100234	VVV	\N	Kalyan	enduser	2020-12-07 18:23:46
100235	G	\N	Gopal	enduser	2020-12-07 18:23:46
100236	Y	\N	Syamsunder	enduser	2020-12-07 18:23:46
100237	Vrs	\N	Srinivas	enduser	2020-12-07 18:23:46
100238	T	\N	Saratchandra	enduser	2020-12-07 18:23:46
100239	B	\N	Ravindranath	enduser	2020-12-07 18:23:46
100240	T	\N	Muralikrishna	enduser	2020-12-07 18:23:46
100241	Rao	\N	Rajeswara	enduser	2020-12-07 18:23:46
100242	Anupam	\N	Sinha	enduser	2020-12-07 18:23:46
100243	Touchbaseadmin	\N	\N	enduser	2020-12-07 18:23:46
100244	M	\N	Sureshkumar	enduser	2020-12-07 18:23:46
100245	Chiradip	\N	Chandra	enduser	2020-12-07 18:23:46
100246	C	\N	Venkateshwarlu	enduser	2020-12-07 18:23:46
100247	Soumen	\N	Das	enduser	2020-12-07 18:23:46
100248	Ch	\N	Srikanth	enduser	2020-12-07 18:23:46
100249	Vamsi	\N	Krishna	enduser	2020-12-07 18:23:46
100250	D	\N	Srinivas	enduser	2020-12-07 18:23:46
100251	P	\N	Shankarshan	enduser	2020-12-07 18:23:46
100252	A	\N	Srinivasu	enduser	2020-12-07 18:23:46
100253	V	\N	Mohankumar	enduser	2020-12-07 18:23:46
100254	P	\N	Saikrishnamohan	enduser	2020-12-07 18:23:46
100255	Ramu	\N	Allapula	enduser	2020-12-07 18:23:46
100256	A	\N	Rajeev	enduser	2020-12-07 18:23:46
100257	Dastagiri	\N	Reddy	enduser	2020-12-07 18:23:46
100258	Nilanjan	\N	Chakraborty	enduser	2020-12-07 18:23:46
100259	Dhruba	\N	Bhattacharjee	enduser	2020-12-07 18:23:46
100260	S	\N	Shailaja	enduser	2020-12-07 18:23:46
100261	Ramanujam	\N	Rangarajan	enduser	2020-12-07 18:23:46
100262	J	\N	Mohan	enduser	2020-12-07 18:23:46
100263	Rajshekhar	\N	Mittalkod	enduser	2020-12-07 18:23:46
100264	Vasimalla	\N	Bhan	enduser	2020-12-07 18:23:46
100265	Nagindra	\N	Singh	enduser	2020-12-07 18:23:46
100266	Praloy	\N	Sen	enduser	2020-12-07 18:23:46
100267	Farzan	\N	Dalal	enduser	2020-12-07 18:23:46
100268	Nadeem	\N	Patel	enduser	2020-12-07 18:23:46
100269	TV	\N	Sunder	enduser	2020-12-07 18:23:46
100270	Sivabalan	\N	Salai	enduser	2020-12-07 18:23:46
100271	Suresh	\N	Babu	enduser	2020-12-07 18:23:46
100272	N	\N	Srinivas	enduser	2020-12-07 18:23:46
100273	A	\N	Ramavinodh	enduser	2020-12-07 18:23:46
100274	K	\N	Shoba	enduser	2020-12-07 18:23:46
100275	Atul	\N	Kulkarni	enduser	2020-12-07 18:23:46
100276	Vaibhav	\N	Kale	enduser	2020-12-07 18:23:46
100277	Niranjan	\N	Sapkal	enduser	2020-12-07 18:23:46
100278	Sunil	\N	Kobal	enduser	2020-12-07 18:23:46
100279	Mahesh	\N	Patil	enduser	2020-12-07 18:23:46
100280	Hanumanth	\N	Reddy	enduser	2020-12-07 18:23:46
100281	Abhaysinh	\N	Gaikwad	enduser	2020-12-07 18:23:46
100282	Ganesh	\N	Dongre	enduser	2020-12-07 18:23:46
100283	Pradeep	\N	Mishra	enduser	2020-12-07 18:23:46
100284	Kochupurakal	\N	Mathew	enduser	2020-12-07 18:23:46
100285	Amol	\N	Patil	enduser	2020-12-07 18:23:46
100286	Bhide	\N	Sanjay	enduser	2020-12-07 18:23:46
100287	Prashant	\N	Suryawanshi	enduser	2020-12-07 18:23:46
100288	Arvind	\N	Chougule	enduser	2020-12-07 18:23:46
100289	Mansing	\N	Chavan	enduser	2020-12-07 18:23:46
100290	Priyesh	\N	Agrawal	enduser	2020-12-07 18:23:46
100291	Pillai	\N	V	enduser	2020-12-07 18:23:46
100292	Zubbin	\N	Registrar	enduser	2020-12-07 18:23:46
100293	Sanjay	\N	Navayath	enduser	2020-12-07 18:23:46
100294	Uday	\N	Warke	enduser	2020-12-07 18:23:46
100295	Ashutosh	\N	Pandita	enduser	2020-12-07 18:23:46
100296	Susheel	\N	Bhat	enduser	2020-12-07 18:23:46
100297	Kishor	\N	Nevse	enduser	2020-12-07 18:23:46
100298	Bipin	\N	Pinge	enduser	2020-12-07 18:23:46
100299	Arif	\N	Shaikh	enduser	2020-12-07 18:23:46
100300	Santosh	\N	Nagane	enduser	2020-12-07 18:23:46
100301	Abhaysinh	\N	Bhasme	enduser	2020-12-07 18:23:46
100302	Mubin	\N	Kapdi	enduser	2020-12-07 18:23:46
100303	Abdus	\N	Mondal	enduser	2020-12-07 18:23:46
100304	Rohit	\N	Gadekar	enduser	2020-12-07 18:23:46
100305	Santosh	\N	Nilkanth	enduser	2020-12-07 18:23:46
100306	Ashutosh	\N	Solanke	enduser	2020-12-07 18:23:46
100307	Pravin	\N	Nagpure	enduser	2020-12-07 18:23:46
100308	Shripad	\N	Khire	enduser	2020-12-07 18:23:46
100309	Zubin	\N	Gagrat	enduser	2020-12-07 18:23:46
100310	Ashutosh	\N	Abhyankar	enduser	2020-12-07 18:23:46
100311	Anoop	\N	Sharma	enduser	2020-12-07 18:23:46
100312	Kedar	\N	Bahdule	enduser	2020-12-07 18:23:46
100313	Yogesh	\N	Kulkarni	enduser	2020-12-07 18:23:46
100314	Shreyas	\N	Hedgire	enduser	2020-12-07 18:23:46
100315	Anant	\N	Bhide	enduser	2020-12-07 18:23:46
100316	Mohini	\N	Kirane	enduser	2020-12-07 18:23:46
100317	Sachin	\N	Sadavarte	enduser	2020-12-07 18:23:46
100318	Umesh	\N	Shinde	enduser	2020-12-07 18:23:46
100319	Balvant	\N	Patil	enduser	2020-12-07 18:23:46
100320	Virendra	\N	Kulkarni	enduser	2020-12-07 18:23:46
100321	Yashpal	\N	Deshmukh	enduser	2020-12-07 18:23:46
100322	Himmat	\N	More	enduser	2020-12-07 18:23:46
100323	Sameer	\N	Marathe	enduser	2020-12-07 18:23:46
100324	Sincy	\N	John	enduser	2020-12-07 18:23:46
100325	Shashank	\N	Admulwar	enduser	2020-12-07 18:23:46
100326	Kiran	\N	Bobade	enduser	2020-12-07 18:23:46
100327	Sachin	\N	Jain	enduser	2020-12-07 18:23:46
100328	Krishnakant	\N	Musne	enduser	2020-12-07 18:23:46
100329	Sharma	\N	S	enduser	2020-12-07 18:23:46
100330	Vivek	\N	Moharil	enduser	2020-12-07 18:23:46
100331	Mangesh	\N	Salunkhe	enduser	2020-12-07 18:23:46
100332	Sanatkumar	\N	Pattekari	enduser	2020-12-07 18:23:46
100333	Nilesh	\N	Jumale	enduser	2020-12-07 18:23:46
100334	Tella	\N	Rao 	enduser	2020-12-07 18:23:46
100335	Parimal	\N	Shinde	enduser	2020-12-07 18:23:46
100336	Krushal	\N	Patel	enduser	2020-12-07 18:23:46
100337	Shreyas	\N	Mohite	enduser	2020-12-07 18:23:46
100338	Kantilal	\N	Puri	enduser	2020-12-07 18:23:46
100339	Prashant	\N	Jamadar	enduser	2020-12-07 18:23:46
100340	Vidyadhar	\N	Deshpande	enduser	2020-12-07 18:23:46
100341	Srinivas	\N	Mutchintala	enduser	2020-12-07 18:23:46
100342	Harshal	\N	Shinde	enduser	2020-12-07 18:23:46
100343	Rajesh	\N	Santhanam	enduser	2020-12-07 18:23:46
100344	Pradeep	\N	Chitale	enduser	2020-12-07 18:23:46
100345	Vishal	\N	Waghole	enduser	2020-12-07 18:23:46
100346	Raheem	\N	Ieleyas	enduser	2020-12-07 18:23:46
100347	Helpdesk	\N	\N	enduser	2020-12-07 18:23:46
100348	tkii	\N	Desksupport1	enduser	2020-12-07 18:23:46
100349	TVS	\N	Srinivas	enduser	2020-12-07 18:23:46
100350	MK	\N	Subramanian	enduser	2020-12-07 18:23:46
100351	Mohammadelias	\N	Khan	enduser	2020-12-07 18:23:46
100352	Vijay	\N	Patil	enduser	2020-12-07 18:23:46
100353	Prince	\N	Oliver	enduser	2020-12-07 18:23:46
100354	Aniket	\N	Kulkarni	enduser	2020-12-07 18:23:46
100355	Mangesh	\N	Deokar	enduser	2020-12-07 18:23:46
100356	Anku	\N	Adhikary	enduser	2020-12-07 18:23:46
100357	Joydeep	\N	Sarkar	enduser	2020-12-07 18:23:46
100358	Y	\N	Prasanth	enduser	2020-12-07 18:23:46
100359	Afzal	\N	Khan	enduser	2020-12-07 18:23:46
100360	Vinayak	\N	Pimpalkar	enduser	2020-12-07 18:23:46
100361	Rahul	\N	Patil	enduser	2020-12-07 18:23:46
100362	Tapadev	\N	Das	enduser	2020-12-07 18:23:46
100363	Alexander	\N	Joseph	enduser	2020-12-07 18:23:46
100364	Mohasin	\N	Mujawar	enduser	2020-12-07 18:23:46
100365	Pradeep	\N	Jagtap	enduser	2020-12-07 18:23:46
100366	Satyendra	\N	Jha	enduser	2020-12-07 18:23:46
100367	Priyanka	\N	Mishra	enduser	2020-12-07 18:23:46
100368	Aniket	\N	Kadekar	enduser	2020-12-07 18:23:46
100369	Nikhil	\N	Desai	enduser	2020-12-07 18:23:46
100370	Kalpak	\N	Surve	enduser	2020-12-07 18:23:46
100371	Kalim	\N	Shaikh	enduser	2020-12-07 18:23:46
100372	Sumesh	\N	Sawant	enduser	2020-12-07 18:23:46
100373	Pavan	\N	Mahale	enduser	2020-12-07 18:23:46
100374	Yuvvraaj	\N	Marralkar	enduser	2020-12-07 18:23:46
100375	Suntosh	\N	Utekarr	enduser	2020-12-07 18:23:46
100376	Abid	\N	Shahbad	enduser	2020-12-07 18:23:46
100377	Kedareshwar	\N	Kurle	enduser	2020-12-07 18:23:46
100378	Malhar	\N	Inamdar	enduser	2020-12-07 18:23:46
100379	Sudhakar	\N	Pawar	enduser	2020-12-07 18:23:46
100380	Pankaj	\N	Malhotra	enduser	2020-12-07 18:23:46
100381	Shrirang	\N	Shinde	enduser	2020-12-07 18:23:46
100382	Parbate	\N	D	enduser	2020-12-07 18:23:46
100383	Thipse	\N	Mangesh	enduser	2020-12-07 18:23:46
100384	Atonu	\N	Bhattacharya	enduser	2020-12-07 18:23:46
100385	Sekhar	\N	Sasmal	enduser	2020-12-07 18:23:46
100386	Abhijeet	\N	Uppin	enduser	2020-12-07 18:23:46
100387	Vikas	\N	Bharti	enduser	2020-12-07 18:23:46
100388	Indraneel	\N	Dassharma	enduser	2020-12-07 18:23:46
100389	Kunal	\N	Parundekar	enduser	2020-12-07 18:23:46
100390	Parvez	\N	Shaikh	enduser	2020-12-07 18:23:46
100391	Devendra	\N	Kale	enduser	2020-12-07 18:23:46
100392	Sanket	\N	Konnur	enduser	2020-12-07 18:23:46
100393	Milind	\N	Kulkarni	enduser	2020-12-07 18:23:46
100394	Sagar	\N	Vijan	enduser	2020-12-07 18:23:46
100395	Manojkumar	\N	Mali	enduser	2020-12-07 18:23:46
100396	Bharat	\N	Patel	enduser	2020-12-07 18:23:46
100397	Abhinandan	\N	Jadhav	enduser	2020-12-07 18:23:46
100398	Hitesh	\N	Ajmera	enduser	2020-12-07 18:23:46
100399	Sanjeev	\N	Nargund	enduser	2020-12-07 18:23:46
100400	Gangadhar	\N	Kulkarni	enduser	2020-12-07 18:23:46
100401	Sujeet	\N	Jagtap	enduser	2020-12-07 18:23:46
100402	Srinivas	\N	Juthiga	enduser	2020-12-07 18:23:46
100403	Basavaraj	\N	Malipatil	enduser	2020-12-07 18:23:46
100404	Shishir	\N	Bhalerao	enduser	2020-12-07 18:23:46
100405	Vanita	\N	Chandak	enduser	2020-12-07 18:23:46
100406	Shashidhar	\N	Bonagiri	enduser	2020-12-07 18:23:46
100407	Ankit	\N	Patel	enduser	2020-12-07 18:23:46
100408	Shashikant	\N	Khedkar	enduser	2020-12-07 18:23:46
100409	Anand	\N	Kulkarni	enduser	2020-12-07 18:23:46
100410	Banibrata	\N	Mondal	enduser	2020-12-07 18:23:46
100411	Gajendra	\N	Sangle	enduser	2020-12-07 18:23:46
100412	Sunil	\N	Arbatti	enduser	2020-12-07 18:23:46
100413	Sachin	\N	Bhosale	enduser	2020-12-07 18:23:46
100414	Saurabh	\N	Shinde	enduser	2020-12-07 18:23:46
100415	Santosh	\N	Bobade	enduser	2020-12-07 18:23:46
100416	Sandeep	\N	Shinde	enduser	2020-12-07 18:23:46
100417	Gopal	\N	Bhosale	enduser	2020-12-07 18:23:46
100418	Pankaj	\N	Ranadive	enduser	2020-12-07 18:23:46
100419	Neelesh	\N	Shanbhag	enduser	2020-12-07 18:23:46
100420	Ch	\N	Annapurna	enduser	2020-12-07 18:23:46
100421	Jadhav	\N	P	enduser	2020-12-07 18:23:46
100422	Umakant	\N	Katlawar	enduser	2020-12-07 18:23:46
100423	Rahul	\N	Krishnaswamy	enduser	2020-12-07 18:23:46
100424	Prakash	\N	Bhoi	enduser	2020-12-07 18:23:46
100425	Haree	\N	Gend	enduser	2020-12-07 18:23:46
100426	Kantilal	\N	Janrao	enduser	2020-12-07 18:23:46
100427	Murzban	\N	Mogal	enduser	2020-12-07 18:23:46
100428	June	\N	Achar	enduser	2020-12-07 18:23:46
100429	Udaykumar	\N	Arockiam	enduser	2020-12-07 18:23:46
100430	Tarnnum	\N	Inamdar	enduser	2020-12-07 18:23:46
100431	Sameer	\N	Kulkarni	enduser	2020-12-07 18:23:46
100432	Gopal	\N	Prabhu	enduser	2020-12-07 18:23:46
100433	Mangesh	\N	Karmalkar	enduser	2020-12-07 18:23:46
100434	Abhijit	\N	Mohanty	enduser	2020-12-07 18:23:46
100435	Harish	\N	Gaikwad	enduser	2020-12-07 18:23:46
100436	Sumit	\N	Karkamkar	enduser	2020-12-07 18:23:46
100437	Rahul	\N	Pote	enduser	2020-12-07 18:23:46
100438	Jyoti	\N	Gavali	enduser	2020-12-07 18:23:46
100439	Devendra	\N	Kshirsagar	enduser	2020-12-07 18:23:46
100440	Maitre	\N	R	enduser	2020-12-07 18:23:46
100441	Santosh	\N	Killamsetty	enduser	2020-12-07 18:23:46
100442	Chaitanya	\N	Rashinkar	enduser	2020-12-07 18:23:46
100443	Sunanda	\N	Malshikare	enduser	2020-12-07 18:23:46
100444	Kiran	\N	Patil	enduser	2020-12-07 18:23:46
100445	Dipak	\N	Ughade	enduser	2020-12-07 18:23:46
100446	Hemant	\N	Bhalerao	enduser	2020-12-07 18:23:46
100447	Ramesh Mahaling	\N	Swami	enduser	2020-12-07 18:23:46
100448	Manojkumar	\N	Thakre	enduser	2020-12-07 18:23:46
100449	Maruti	\N	Morbale	enduser	2020-12-07 18:23:46
100450	Prashant	\N	Belhekar	enduser	2020-12-07 18:23:46
100451	Amina	\N	Shaikh	enduser	2020-12-07 18:23:46
100452	Makarand	\N	Chavan	enduser	2020-12-07 18:23:46
100453	Mayuresh	\N	Sonawane	enduser	2020-12-07 18:23:46
100454	Tushar	\N	Yannewar	enduser	2020-12-07 18:23:46
100455	Ashok	\N	Gaikwad	enduser	2020-12-07 18:23:46
100456	Udaykumar	\N	Raynade	enduser	2020-12-07 18:23:46
100457	Vijay	\N	Paygude	enduser	2020-12-07 18:23:46
100458	Ganesh	\N	Deshmukh	enduser	2020-12-07 18:23:46
100459	Dharmadhikari	\N	U	enduser	2020-12-07 18:23:46
100460	Nitin	\N	Panchbhai	enduser	2020-12-07 18:23:46
100461	Navnath	\N	Mane	enduser	2020-12-07 18:23:46
100462	Harshal	\N	Wani	enduser	2020-12-07 18:23:46
100463	Betty	\N	Dcruz	enduser	2020-12-07 18:23:46
100464	Cyril	\N	Joseph	enduser	2020-12-07 18:23:46
100465	Mahesh	\N	Ghongade	enduser	2020-12-07 18:23:46
100466	Anil	\N	Kakade	enduser	2020-12-07 18:23:46
100467	Amit	\N	Patil	enduser	2020-12-07 18:23:46
100468	Pradip	\N	Gosavi	enduser	2020-12-07 18:23:46
100469	Venkata	\N	Nandipati	enduser	2020-12-07 18:23:46
100470	Chetan	\N	Jadhav	enduser	2020-12-07 18:23:46
100471	Prasad	\N	Kale	enduser	2020-12-07 18:23:46
100472	Mahesh	\N	Patil	enduser	2020-12-07 18:23:46
100473	Saurabh	\N	Kumar	enduser	2020-12-07 18:23:46
100474	Vinay	\N	Mhaske	enduser	2020-12-07 18:23:46
100475	Bharat	\N	Suryawanshi	enduser	2020-12-07 18:23:46
100476	Sagar	\N	Deshmukh	enduser	2020-12-07 18:23:46
100477	Shreenivas	\N	Kale	enduser	2020-12-07 18:23:46
100478	Nilesh	\N	Akolkar	enduser	2020-12-07 18:23:46
100479	Raviraj	\N	Belvalkar	enduser	2020-12-07 18:23:46
100480	Dilip	\N	Joshi	enduser	2020-12-07 18:23:46
100481	Wadingekar	\N	D	enduser	2020-12-07 18:23:46
100482	Vikas	\N	Salunke	enduser	2020-12-07 18:23:46
100483	Ashwini	\N	Telekone	enduser	2020-12-07 18:23:46
100484	Niranjan	\N	Bhate	enduser	2020-12-07 18:23:46
100485	Nilesh	\N	Godase	enduser	2020-12-07 18:23:46
100486	Ashish	\N	Barthwal	enduser	2020-12-07 18:23:46
100487	Yogesh	\N	Jahagirdar	enduser	2020-12-07 18:23:46
100488	Amit	\N	Bhoomkar	enduser	2020-12-07 18:23:46
100489	Sheetal	\N	Kulkarni	enduser	2020-12-07 18:23:46
100490	Umakant	\N	Godase	enduser	2020-12-07 18:23:46
100491	Amol	\N	Patil	enduser	2020-12-07 18:23:46
100492	Ravi	\N	Vardhannavar	enduser	2020-12-07 18:23:46
100493	MahajanS	\N	V	enduser	2020-12-07 18:23:46
100494	Joel	\N	Chinan	enduser	2020-12-07 18:23:46
100495	Digvijay	\N	Patil	enduser	2020-12-07 18:23:46
100496	Amin	\N	Irani	enduser	2020-12-07 18:23:46
100497	Kaknani	\N	Suresh	enduser	2020-12-07 18:23:46
100498	Abhijit	\N	Bubane	enduser	2020-12-07 18:23:46
100499	Raghvendra	\N	Savant	enduser	2020-12-07 18:23:46
100500	Khedkar	\N	N	enduser	2020-12-07 18:23:46
100501	Vinayak	\N	Belekar	enduser	2020-12-07 18:23:46
100502	Vijay	\N	Vishwasrao	enduser	2020-12-07 18:23:46
100503	Sandesh	\N	Amrutkar	enduser	2020-12-07 18:23:46
100504	Manmohan	\N	Kotibhaskar	enduser	2020-12-07 18:23:46
100505	Hemant	\N	Jadhav	enduser	2020-12-07 18:23:46
100506	Virendra	\N	Bandgar	enduser	2020-12-07 18:23:46
100507	Durgaprasad	\N	Naraharisetty	enduser	2020-12-07 18:23:46
100508	Sandeep	\N	Thorat	enduser	2020-12-07 18:23:46
100509	Vaibhav	\N	Videkar	enduser	2020-12-07 18:23:46
100510	Yashwant	\N	Pawar	enduser	2020-12-07 18:23:46
100511	Shah	\N	R	enduser	2020-12-07 18:23:46
100512	Datta	\N	Nimbalkar	enduser	2020-12-07 18:23:46
100513	Mayur	\N	Palkhe	enduser	2020-12-07 18:23:46
100514	Abhijeet	\N	Patil	enduser	2020-12-07 18:23:46
100515	Jahiruddin	\N	Inamdar	enduser	2020-12-07 18:23:46
100516	Venkataramanan	\N	Iyer	enduser	2020-12-07 18:23:46
100517	Pankaj	\N	Pachghare	enduser	2020-12-07 18:23:46
100518	Ganesh	\N	Chavan	enduser	2020-12-07 18:23:46
100519	Pramod	\N	Kamble	enduser	2020-12-07 18:23:46
100520	Anup	\N	Shintre	enduser	2020-12-07 18:23:46
100521	Abhay	\N	Kulkarni	enduser	2020-12-07 18:23:46
100522	Uttam	\N	Patil	enduser	2020-12-07 18:23:46
100523	Ravindra	\N	Raut	enduser	2020-12-07 18:23:46
100524	Sunil	\N	Ghare	enduser	2020-12-07 18:23:46
100525	Sumedh	\N	Gadgil	enduser	2020-12-07 18:23:46
100526	Patil	\N	Manoj	enduser	2020-12-07 18:23:46
100527	Dilip	\N	Thombare	enduser	2020-12-07 18:23:46
100528	Sandeep	\N	Sagare	enduser	2020-12-07 18:23:46
100529	Amarnath	\N	Deshmukh	enduser	2020-12-07 18:23:46
100530	Digambar	\N	Kadam	enduser	2020-12-07 18:23:46
100531	Albert	\N	Kurian	enduser	2020-12-07 18:23:46
100532	Tushar	\N	Dawange	enduser	2020-12-07 18:23:46
100533	Shreyas	\N	Kulkarni	enduser	2020-12-07 18:23:46
100534	Mukund	\N	Kulkarni	enduser	2020-12-07 18:23:46
100535	Rohit	\N	Chavan	enduser	2020-12-07 18:23:46
100536	Yogesh	\N	Wayase	enduser	2020-12-07 18:23:46
100537	Bijoy	\N	Balram	enduser	2020-12-07 18:23:46
100538	Kolhe	\N	Shirish	enduser	2020-12-07 18:23:46
100539	Randhir	\N	Korhale	enduser	2020-12-07 18:23:46
100540	Sachin	\N	Telake	enduser	2020-12-07 18:23:46
100541	Ravindranath	\N	Patil	enduser	2020-12-07 18:23:46
100542	lakshminath	\N	Dwara	enduser	2020-12-07 18:23:46
100543	Pote	\N	\N	enduser	2020-12-07 18:23:46
100544	Amol	\N	Deshmukh	enduser	2020-12-07 18:23:46
100545	Deepaklal	\N	Lohar	enduser	2020-12-07 18:23:46
100546	Yogesh	\N	Skulkarni	enduser	2020-12-07 18:23:46
100547	Jalindar	\N	Zinjurke	enduser	2020-12-07 18:23:46
100548	Yogesh	\N	Kulkarni	enduser	2020-12-07 18:23:46
100549	Rahulraj	\N	Chavan	enduser	2020-12-07 18:23:46
100550	Manishkumar	\N	Tiwari	enduser	2020-12-07 18:23:46
100551	Deepak	\N	Gawande	enduser	2020-12-07 18:23:46
100552	Arjun	\N	Nalawade	enduser	2020-12-07 18:23:46
100553	Radhakrishna	\N	Gundepally	enduser	2020-12-07 18:23:46
100554	Anup	\N	Udagave	enduser	2020-12-07 18:23:46
100555	Kersy	\N	Chindhy	enduser	2020-12-07 18:23:46
100556	Chandrashekar	\N	Bapat	enduser	2020-12-07 18:23:46
100557	Partha	\N	Biswas	enduser	2020-12-07 18:23:46
100558	Shashikant	\N	Shinde	enduser	2020-12-07 18:23:46
100559	Nikhil	\N	Menon	enduser	2020-12-07 18:23:46
100560	Sunil	\N	Haval	enduser	2020-12-07 18:23:46
100561	Vijay	\N	Kakade	enduser	2020-12-07 18:23:46
100562	Kiran	\N	Mudbidri	enduser	2020-12-07 18:23:46
100563	Gaurang	\N	Parmar	enduser	2020-12-07 18:23:46
100564	Milind	\N	Vaidya	enduser	2020-12-07 18:23:46
100565	Vishwanathan	\N	Balasubramanian	enduser	2020-12-07 18:23:46
100566	Kaustubh	\N	Nadgonde	enduser	2020-12-07 18:23:46
100567	Girish	\N	Ketkar	enduser	2020-12-07 18:23:46
100568	Tejomurtula	\N	Prasad	enduser	2020-12-07 18:23:46
100569	Vaijanath	\N	Sangekar	enduser	2020-12-07 18:23:46
100570	Balkrishna	\N	Bailkeri	enduser	2020-12-07 18:23:46
100571	Rakesh	\N	Mullapully	enduser	2020-12-07 18:23:46
100572	Srinivas	\N	Acharya	enduser	2020-12-07 18:23:46
100573	Rajendra	\N	Dhamal	enduser	2020-12-07 18:23:46
100574	Chandrashekhar	\N	Kulkarni	enduser	2020-12-07 18:23:46
100575	Sunitha	\N	Jaykumar	enduser	2020-12-07 18:23:46
100576	Fernandes	\N	Terrence	enduser	2020-12-07 18:23:46
100577	Sanjay	\N	Shelar	enduser	2020-12-07 18:23:46
100578	Gautam	\N	Singh	enduser	2020-12-07 18:23:46
100579	Bhausaheb	\N	Sangle	enduser	2020-12-07 18:23:46
100580	Sandeep	\N	Sontakke	enduser	2020-12-07 18:23:46
100581	Madan	\N	Jadhav	enduser	2020-12-07 18:23:46
100582	Ravindra	\N	Divekar	enduser	2020-12-07 18:23:46
100583	Vikas	\N	Matane	enduser	2020-12-07 18:23:46
100584	Nitin	\N	Chavan	enduser	2020-12-07 18:23:46
100585	Manoj	\N	Rane	enduser	2020-12-07 18:23:46
100586	Vinod	\N	Singh	enduser	2020-12-07 18:23:46
100587	Sadanand	\N	Awale	enduser	2020-12-07 18:23:46
100588	Naved	\N	Akhtar	enduser	2020-12-07 18:23:46
100589	Chandrasekar	\N	Ramamoorthy	enduser	2020-12-07 18:23:46
100590	Naresh	\N	Thakur	enduser	2020-12-07 18:23:46
100591	Ramakrishna	\N	Somalanka	enduser	2020-12-07 18:23:46
100592	Dilip	\N	Patil	enduser	2020-12-07 18:23:46
100593	Dasharath	\N	Parab	enduser	2020-12-07 18:23:46
100594	Rajendra	\N	Parasnis	enduser	2020-12-07 18:23:46
100595	Ganesh	\N	Doke	enduser	2020-12-07 18:23:46
100596	Tushar	\N	Bhujbal	enduser	2020-12-07 18:23:46
100597	Rajendra	\N	Katule	enduser	2020-12-07 18:23:46
100598	Raju	\N	Kaleeswaran	enduser	2020-12-07 18:23:46
100599	Mahimmay	\N	Paul	enduser	2020-12-07 18:23:46
100600	Swapnil	\N	Saraswat	enduser	2020-12-07 18:23:46
100601	Rajkumar	\N	Navale	enduser	2020-12-07 18:23:46
100602	Vilas	\N	Mahajan	enduser	2020-12-07 18:23:46
100603	Vinod	\N	Kadam	enduser	2020-12-07 18:23:46
100604	Kanchisingh	\N	Kajania	enduser	2020-12-07 18:23:46
100605	Arun	\N	Prasad	enduser	2020-12-07 18:23:46
100606	Arumugam	\N	Kumar	enduser	2020-12-07 18:23:46
100607	Dilip	\N	Yelpale	enduser	2020-12-07 18:23:46
100608	Prashant	\N	Kasar	enduser	2020-12-07 18:23:46
100609	postmaster	\N	\N	enduser	2020-12-07 18:23:46
100610	Dipankar	\N	Saha	enduser	2020-12-07 18:23:46
100611	Piyush	\N	Ghelani	enduser	2020-12-07 18:23:46
100612	Shrinivas	\N	Joshi	enduser	2020-12-07 18:23:46
100613	Deepak	\N	Vernekar	enduser	2020-12-07 18:23:46
100614	Rahul	\N	Niwal	enduser	2020-12-07 18:23:46
100615	Dadasaheb	\N	Sakore	enduser	2020-12-07 18:23:46
100616	Amitabh	\N	Paul	enduser	2020-12-07 18:23:46
100617	Rajesh	\N	Badhe	enduser	2020-12-07 18:23:46
100618	Sridhar	\N	Vaidyanathan	enduser	2020-12-07 18:23:46
100619	Nilesh	\N	Utpat	enduser	2020-12-07 18:23:46
100620	Yogesh	\N	Sharma	enduser	2020-12-07 18:23:46
100621	Adarsh	\N	Sahay	enduser	2020-12-07 18:23:46
100622	Nayak	\N	Vinayak	enduser	2020-12-07 18:23:46
100623	Pravin	\N	Gaidhar	enduser	2020-12-07 18:23:46
100624	Maneesh	\N	Sabharwal	enduser	2020-12-07 18:23:46
100625	Omkar	\N	Durge 	enduser	2020-12-07 18:23:46
100626	Anirban	\N	Chakrabarti 	enduser	2020-12-07 18:23:46
100627	Yogesh	\N	Karmalkar	enduser	2020-12-07 18:23:46
100628	Surya	\N	Bhushan	enduser	2020-12-07 18:23:46
100629	Rajasekhara	\N	Reddy	enduser	2020-12-07 18:23:46
100630	Chandan	\N	Singha	enduser	2020-12-07 18:23:46
100631	Dilip	\N	Das	enduser	2020-12-07 18:23:46
100632	Ritesh	\N	Chakravorty	enduser	2020-12-07 18:23:46
100633	Sunil	\N	Magoo	enduser	2020-12-07 18:23:46
100634	Nagraj	\N	Rao	enduser	2020-12-07 18:23:46
100635	Amol	\N	Takalkar	enduser	2020-12-07 18:23:46
100636	Shivsagar	\N	Patil	enduser	2020-12-07 18:23:46
100637	Amit	\N	Kuber	enduser	2020-12-07 18:23:46
100638	Mandar	\N	Pingale	enduser	2020-12-07 18:23:46
100639	Gund	\N	R	enduser	2020-12-07 18:23:46
100640	Prashant	\N	Punde	enduser	2020-12-07 18:23:46
100641	Dhara	\N	N	enduser	2020-12-07 18:23:46
100642	T	\N	Manikanta	enduser	2020-12-07 18:23:46
100643	Krishna	\N	Babar	enduser	2020-12-07 18:23:46
100644	Deore	\N	Milind	enduser	2020-12-07 18:23:46
100645	Rahul	\N	Lohar	enduser	2020-12-07 18:23:46
100646	Khushrov	\N	Bengali	enduser	2020-12-07 18:23:46
100647	Nandkumar	\N	Pawar	enduser	2020-12-07 18:23:46
100648	Sable	\N	R	enduser	2020-12-07 18:23:46
100649	Sachin	\N	Londhe	enduser	2020-12-07 18:23:46
100650	Nitin	\N	Yadnopavit	enduser	2020-12-07 18:23:46
100651	Ajay	\N	Birari	enduser	2020-12-07 18:23:46
100652	Harihara	\N	Bhogishetty	enduser	2020-12-07 18:23:46
100653	Manish	\N	Laddhad	enduser	2020-12-07 18:23:46
100654	Prem	\N	Nair	enduser	2020-12-07 18:23:46
100655	Jitendra	\N	Patil	enduser	2020-12-07 18:23:46
100656	Arvind	\N	Dusane	enduser	2020-12-07 18:23:46
100657	Deshpande	\N	C	enduser	2020-12-07 18:23:46
100658	Deepak	\N	Gokhale	enduser	2020-12-07 18:23:46
100659	Sachin	\N	Thite	enduser	2020-12-07 18:23:46
100660	Sulekha	\N	Dhamdhere	enduser	2020-12-07 18:23:46
100661	Dhanashri	\N	Parekh	enduser	2020-12-07 18:23:46
100662	Shashikant	\N	Garad	enduser	2020-12-07 18:23:46
100663	Shriniwas	\N	Hingne	enduser	2020-12-07 18:23:46
100664	Mukul	\N	Khare	enduser	2020-12-07 18:23:46
100665	Vaibhav	\N	Mote	enduser	2020-12-07 18:23:46
100666	Dibakar	\N	Mitra	enduser	2020-12-07 18:23:46
100667	Kirve	\N	Manish	enduser	2020-12-07 18:23:46
100668	Satish	\N	Bhosale	enduser	2020-12-07 18:23:46
100669	Anupkumar	\N	Das	enduser	2020-12-07 18:23:46
100670	Anirudha	\N	Panchwagh	enduser	2020-12-07 18:23:46
100671	Mallesh	\N	Mashale	enduser	2020-12-07 18:23:46
100672	Vishal	\N	Durge	enduser	2020-12-07 18:23:46
100673	Shavanna	\N	Salgond	enduser	2020-12-07 18:23:46
100674	Pranab	\N	Chakraborty	enduser	2020-12-07 18:23:46
100675	Rajput	\N	Bhupendra	enduser	2020-12-07 18:23:46
100676	Sandeep	\N	Thite	enduser	2020-12-07 18:23:46
100677	Deoskar	\N	A	enduser	2020-12-07 18:23:46
100678	Jayprakash	\N	Patil	enduser	2020-12-07 18:23:46
100679	Pathan	\N	Rajekhan	enduser	2020-12-07 18:23:46
100680	Rajesh	\N	Mane	enduser	2020-12-07 18:23:46
100681	Shakeel	\N	Ahmad	enduser	2020-12-07 18:23:46
100682	Atul	\N	Patil	enduser	2020-12-07 18:23:46
100683	Sandeep	\N	Doshi	enduser	2020-12-07 18:23:46
100684	Kedar	\N	Agnihotri	enduser	2020-12-07 18:23:46
100685	Methel	\N	Devadasan	enduser	2020-12-07 18:23:46
100686	Digvijay	\N	Jachak	enduser	2020-12-07 18:23:46
100687	Aniket	\N	Anaokar	enduser	2020-12-07 18:23:46
100688	Balamurugan	\N	A	enduser	2020-12-07 18:23:46
100689	Pawan	\N	Goswami	enduser	2020-12-07 18:23:46
100690	Amar	\N	Deshpande	enduser	2020-12-07 18:23:46
100691	Shammi	\N	Shetty	enduser	2020-12-07 18:23:46
100692	Vinay	\N	Jadhav	enduser	2020-12-07 18:23:46
100693	Pratap	\N	Chilhal	enduser	2020-12-07 18:23:46
100694	Dileep	\N	Singh	enduser	2020-12-07 18:23:46
100695	Tarunkumar	\N	Das	enduser	2020-12-07 18:23:46
100696	Ravindra	\N	Kaldate	enduser	2020-12-07 18:23:46
100697	Shesdev	\N	Sahu	enduser	2020-12-07 18:23:46
100698	Viknesh	\N	Rajendran	enduser	2020-12-07 18:23:46
100699	Charuta	\N	Mulay	enduser	2020-12-07 18:23:46
100700	Kishor	\N	Pathak	enduser	2020-12-07 18:23:46
100701	Galagali	\N	Vaman	enduser	2020-12-07 18:23:46
100702	Upendra	\N	U	enduser	2020-12-07 18:23:46
100703	Sunilkumar	\N	Awasthi	enduser	2020-12-07 18:23:46
100704	Vishal	\N	Walunj	enduser	2020-12-07 18:23:46
100705	Adil	\N	Masalawala	enduser	2020-12-07 18:23:46
100706	Rajesh	\N	Bhat	enduser	2020-12-07 18:23:46
100707	Amit	\N	Sahay	enduser	2020-12-07 18:23:46
100708	Srinivas	\N	Udapikar	enduser	2020-12-07 18:23:46
100709	Prabhu	\N	Hiremath	enduser	2020-12-07 18:23:46
100710	Omkar	\N	Kanade	enduser	2020-12-07 18:23:46
100711	Polindia	\N	Infoweb	enduser	2020-12-07 18:23:46
100712	Prasad	\N	Menon	enduser	2020-12-07 18:23:46
100713	Dilip	\N	Sangle	enduser	2020-12-07 18:23:46
100714	Manish	\N	Gawade	enduser	2020-12-07 18:23:46
100715	Venkatesh	\N	Hadapad	enduser	2020-12-07 18:23:46
100716	Ramkrishna	\N	Yerla	enduser	2020-12-07 18:23:46
100717	Surajit	\N	Dasgupta	enduser	2020-12-07 18:23:46
100718	Subodh	\N	Aranke	enduser	2020-12-07 18:23:46
100719	Dhanaji	\N	Pendavale	enduser	2020-12-07 18:23:46
100720	Eustace	\N	Vimal	enduser	2020-12-07 18:23:46
100721	Mandar	\N	Kulkarni	enduser	2020-12-07 18:23:46
100722	Raghav	\N	Ramachandran	enduser	2020-12-07 18:23:46
100723	Shrirang	\N	Gorhe	enduser	2020-12-07 18:23:46
100724	Sreenath	\N	Hegga	enduser	2020-12-07 18:23:46
100725	Sagar	\N	Kalyani	enduser	2020-12-07 18:23:46
100726	Ravishankar	\N	Kaza	enduser	2020-12-07 18:23:46
100727	Sanjay	\N	Panse	enduser	2020-12-07 18:23:46
100728	Shentu	\N	Chacko	enduser	2020-12-07 18:23:46
100729	Sanjoy	\N	Dey	enduser	2020-12-07 18:23:46
100730	Girish	\N	Kulkarni	enduser	2020-12-07 18:23:46
100731	Nitin	\N	Titar	enduser	2020-12-07 18:23:46
100732	Sajith	\N	Das	enduser	2020-12-07 18:23:46
100733	Jayant	\N	Deshpande	enduser	2020-12-07 18:23:46
100734	Shreyas	\N	Nair	enduser	2020-12-07 18:23:46
100735	Abhijit	\N	Thorat	enduser	2020-12-07 18:23:46
100736	Mukund	\N	Tonape	enduser	2020-12-07 18:23:46
100737	Biju	\N	Kumar	enduser	2020-12-07 18:23:46
100738	Anand	\N	Malkunje	enduser	2020-12-07 18:23:46
100739	Shrijay	\N	Tawade	enduser	2020-12-07 18:23:46
100740	Pankaj	\N	Zambare	enduser	2020-12-07 18:23:46
100741	Umesh	\N	Lele	enduser	2020-12-07 18:23:46
100742	Giridhar	\N	Marella	enduser	2020-12-07 18:23:46
100743	Vijai	\N	Joseph	enduser	2020-12-07 18:23:46
100744	Jayashri	\N	Chaudhari	enduser	2020-12-07 18:23:46
100745	Soumyajit	\N	Nandi	enduser	2020-12-07 18:23:46
100746	Rama	\N	Nair	enduser	2020-12-07 18:23:46
100747	Aslam	\N	Sayyed	enduser	2020-12-07 18:23:46
100748	Vivek	\N	Kamat	enduser	2020-12-07 18:23:46
100749	Lalit	\N	Surajiwale	enduser	2020-12-07 18:23:46
100750	Chinmay	\N	Pandit	enduser	2020-12-07 18:23:46
100751	Sridhar	\N	Ramalingam	enduser	2020-12-07 18:23:46
100752	Sudhir	\N	Kulkarni	enduser	2020-12-07 18:23:46
100753	Sona	\N	Biswas	enduser	2020-12-07 18:23:46
100754	Dadasaheb	\N	Kanherkar	enduser	2020-12-07 18:23:46
100755	Kumar	\N	MA	enduser	2020-12-07 18:23:46
100756	Ashish	\N	Uravane	enduser	2020-12-07 18:23:46
100757	Nilesh	\N	Mehta	enduser	2020-12-07 18:23:46
100758	Rajnish	\N	Sinha	enduser	2020-12-07 18:23:46
100759	Rajeev	\N	Handa	enduser	2020-12-07 18:23:46
100760	Vrushali	\N	Sangaonkar	enduser	2020-12-07 18:23:46
100761	Raju	\N	Bellary	enduser	2020-12-07 18:23:46
100762	Dayanand	\N	Kulkarni	enduser	2020-12-07 18:23:46
100763	Kiran	\N	Suroshi	enduser	2020-12-07 18:23:46
100764	Amit	\N	Savekar	enduser	2020-12-07 18:23:46
100765	Onkar	\N	Sakatkar	enduser	2020-12-07 18:23:46
100766	Hemanth	\N	Dodda	enduser	2020-12-07 18:23:46
100767	Santosh	\N	Shirolikar	enduser	2020-12-07 18:23:46
100768	PMS	\N	System	enduser	2020-12-07 18:23:46
100769	Vineet	\N	Limaye	enduser	2020-12-07 18:23:46
100770	Vikas	\N	Gund	enduser	2020-12-07 18:23:46
100771	Sujit	\N	Hande	enduser	2020-12-07 18:23:46
100772	Anilkumar	\N	P	enduser	2020-12-07 18:23:46
100773	Rajesh	\N	Musalunkar	enduser	2020-12-07 18:23:46
100774	Yogiraj	\N	Panse	enduser	2020-12-07 18:23:46
100775	Govind	\N	Soni	enduser	2020-12-07 18:23:46
100776	Sadanand	\N	Rote	enduser	2020-12-07 18:23:46
100777	Manoj	\N	Sharma	enduser	2020-12-07 18:23:46
100778	Sampada	\N	Godse	enduser	2020-12-07 18:23:46
100779	Deepak	\N	Padalkar	enduser	2020-12-07 18:23:46
100780	Vinod	\N	Varma	enduser	2020-12-07 18:23:46
100781	Nitin	\N	Gawhane	enduser	2020-12-07 18:23:46
100782	Satish	\N	Kadam	enduser	2020-12-07 18:23:46
100783	Sandeep	\N	Thite	enduser	2020-12-07 18:23:46
100784	Anand	\N	Vedpathak	enduser	2020-12-07 18:23:46
100785	Saurabh	\N	Rane	enduser	2020-12-07 18:23:46
100786	Vishal	\N	Pawar	enduser	2020-12-07 18:23:46
100787	Ramasamy	\N	Kannan	enduser	2020-12-07 18:23:46
100788	Swapnil	\N	Risbud	enduser	2020-12-07 18:23:46
100789	Somasundaram	\N	Natarajan	enduser	2020-12-07 18:23:46
100790	Suresh	\N	Ramasamy	enduser	2020-12-07 18:23:46
100791	Nilesh	\N	Nandurkar	enduser	2020-12-07 18:23:46
100792	Dinesh	\N	Sakhare	enduser	2020-12-07 18:23:46
100793	Amol	\N	Phalke	enduser	2020-12-07 18:23:46
100794	Veekkas	\N	Sondckar	enduser	2020-12-07 18:23:46
100795	Rajesh	\N	Radhakrishnan	enduser	2020-12-07 18:23:46
100796	Sunil	\N	Pansare	enduser	2020-12-07 18:23:46
100797	Shedge	\N	Narendra	enduser	2020-12-07 18:23:46
100798	Vitthal	\N	Sagare	enduser	2020-12-07 18:23:46
100799	Madhukar	\N	Chawadekar	enduser	2020-12-07 18:23:46
100800	Sachin	\N	Phadke	enduser	2020-12-07 18:23:46
100801	Mahendra	\N	Umbrajkar	enduser	2020-12-07 18:23:46
100802	Suhas	\N	Damle	enduser	2020-12-07 18:23:46
100803	Ashutosh	\N	Tilve	enduser	2020-12-07 18:23:46
100804	Chanchal	\N	Sinha	enduser	2020-12-07 18:23:46
100805	Nazneen	\N	Limboowalla	enduser	2020-12-07 18:23:46
100806	Shahrukh	\N	Manjra	enduser	2020-12-07 18:23:46
100807	Ahmar	\N	Afzal	enduser	2020-12-07 18:23:46
100808	Abhijeet	\N	Shinde	enduser	2020-12-07 18:23:46
100809	Alok	\N	Bhasme	enduser	2020-12-07 18:23:46
100810	Bahubali	\N	Sankannavar	enduser	2020-12-07 18:23:46
100811	Kashiray	\N	Tanvanshi	enduser	2020-12-07 18:23:46
100812	Rahul	\N	Singh	enduser	2020-12-07 18:23:46
100813	Traf	\N	System	enduser	2020-12-07 18:23:46
100814	Rizwan	\N	Ali	enduser	2020-12-07 18:23:46
100815	Shantanu	\N	Saha	enduser	2020-12-07 18:23:46
100816	Ambadas	\N	Mane	enduser	2020-12-07 18:23:46
100817	Vijaykumar	\N	Ghevade	enduser	2020-12-07 18:23:46
100818	Abhijeet	\N	Jadhav	enduser	2020-12-07 18:23:46
100819	Vijay	\N	Mungase	enduser	2020-12-07 18:23:46
100820	Prakash	\N	Kumar	enduser	2020-12-07 18:23:46
100821	Narendra	\N	Khirnar	enduser	2020-12-07 18:23:46
100822	Rahul	\N	Gosavi	enduser	2020-12-07 18:23:46
100823	Vijay	\N	Mali	enduser	2020-12-07 18:23:46
100824	Amol	\N	Bharankar	enduser	2020-12-07 18:23:46
100825	Vidyanand	\N	Rawool	enduser	2020-12-07 18:23:46
100826	Bipin	\N	Kate	enduser	2020-12-07 18:23:46
100827	Paritosh	\N	Wani	enduser	2020-12-07 18:23:46
100828	Sandip	\N	Gagare	enduser	2020-12-07 18:23:46
100829	Krishnan	\N	Ramaraj	enduser	2020-12-07 18:23:46
100830	Vaijnath	\N	Pundkare	enduser	2020-12-07 18:23:46
100831	Pravin	\N	Jadhav	enduser	2020-12-07 18:23:46
100832	Savarimuthu	\N	George	enduser	2020-12-07 18:23:46
100833	Vinay	\N	Nayar	enduser	2020-12-07 18:23:46
100834	Namdeo	\N	Katkar	enduser	2020-12-07 18:23:46
100835	Abhijit	\N	Kadam	enduser	2020-12-07 18:23:46
100836	Vikramshih	\N	Yadav	enduser	2020-12-07 18:23:46
100837	Sanjay	\N	Prajapati	enduser	2020-12-07 18:23:46
100838	Prasanna	\N	Kshirsagar	enduser	2020-12-07 18:23:46
100839	Bapi	\N	Naskar	enduser	2020-12-07 18:23:46
100840	Onkar	\N	Malekar	enduser	2020-12-07 18:23:46
100841	Bharatram	\N	Malkoti	enduser	2020-12-07 18:23:46
100842	Alendra	\N	Rai	enduser	2020-12-07 18:23:46
100843	Vishal	\N	Joshi	enduser	2020-12-07 18:23:46
100844	Edvel	\N	Raja	enduser	2020-12-07 18:23:46
100845	Santosh	\N	Pakhare	enduser	2020-12-07 18:23:46
100846	Manirul	\N	Haque	enduser	2020-12-07 18:23:46
100847	Eknath	\N	Gawas	enduser	2020-12-07 18:23:46
100848	Vivek	\N	Mandekar	enduser	2020-12-07 18:23:46
100849	Sumesh	\N	Chakkingal	enduser	2020-12-07 18:23:46
100850	Navnath	\N	Kagde	enduser	2020-12-07 18:23:46
100851	Santosh	\N	Singh	enduser	2020-12-07 18:23:46
100852	Attendance	\N	System	enduser	2020-12-07 18:23:46
100853	Arvind	\N	Singh	enduser	2020-12-07 18:23:46
100854	Sambhaji	\N	Sangle	enduser	2020-12-07 18:23:46
100855	Nandkishor	\N	Thitame	enduser	2020-12-07 18:23:46
100856	Kaushal	\N	Sharma	enduser	2020-12-07 18:23:46
100857	Bhagyashri	\N	Bhagat	enduser	2020-12-07 18:23:46
100858	Kiran	\N	Narewadikar	enduser	2020-12-07 18:23:46
100859	Subramaniyan	\N	Rajashekar	enduser	2020-12-07 18:23:46
100860	Arabinda	\N	Deb	enduser	2020-12-07 18:23:46
100861	Ramchandra	\N	Pawar	enduser	2020-12-07 18:23:46
100862	Kaliyaperumal	\N	Kirubakaran	enduser	2020-12-07 18:23:46
100863	Ravi	\N	Nitturkar	enduser	2020-12-07 18:23:46
100864	Srikanth	\N	Kommajosyula	enduser	2020-12-07 18:23:46
100865	Jayesh	\N	Chaudhari	enduser	2020-12-07 18:23:46
100866	Ponnusamy	\N	Periyasaamy	enduser	2020-12-07 18:23:46
100867	Prasad	\N	Kanagala	enduser	2020-12-07 18:23:46
100868	Govindasamy	\N	Elumalai	enduser	2020-12-07 18:23:46
100869	Harshad	\N	Lad	enduser	2020-12-07 18:23:46
100870	Gaurav	\N	Makashir	enduser	2020-12-07 18:23:46
100871	Rahul	\N	Pillai	enduser	2020-12-07 18:23:46
100872	Savarinuthu	\N	Charles	enduser	2020-12-07 18:23:46
100873	Mahendra	\N	Kharate	enduser	2020-12-07 18:23:46
100874	Vidyadhar	\N	Mukane	enduser	2020-12-07 18:23:46
100875	Ramasamy	\N	Arumugam	enduser	2020-12-07 18:23:46
100876	Umesh	\N	Gade	enduser	2020-12-07 18:23:46
100877	Somnath	\N	Singh	enduser	2020-12-07 18:23:46
100878	Srikrishna	\N	Boopathy	enduser	2020-12-07 18:23:46
100879	Meghanad	\N	Das	enduser	2020-12-07 18:23:46
100880	Puthiya	\N	Muralidharan	enduser	2020-12-07 18:23:46
100881	Santosh	\N	Poal	enduser	2020-12-07 18:23:46
100882	Ravi	\N	Danawale	enduser	2020-12-07 18:23:46
100883	Prashant	\N	Kamble	enduser	2020-12-07 18:23:46
100884	Kishor	\N	Bhagat	enduser	2020-12-07 18:23:46
100885	Varadarajan	\N	Rajasekhar	enduser	2020-12-07 18:23:46
100886	Nilesh	\N	Jagtap	enduser	2020-12-07 18:23:46
100887	Veeraragavan	\N	Murugan	enduser	2020-12-07 18:23:46
100888	Madhukar	\N	Damame	enduser	2020-12-07 18:23:46
100889	Venkatakrishnan	\N	Pillai	enduser	2020-12-07 18:23:46
100890	Radheshyam	\N	Kumar	enduser	2020-12-07 18:23:46
100891	Satish	\N	Poojari	enduser	2020-12-07 18:23:46
100892	Prem	\N	Shrivastav	enduser	2020-12-07 18:23:46
100893	Aniket	\N	Jagtap	enduser	2020-12-07 18:23:46
100894	Sachin	\N	Nikam	enduser	2020-12-07 18:23:46
100895	Ashok	\N	Jangam	enduser	2020-12-07 18:23:46
100896	PrantikKumar	\N	Ray	enduser	2020-12-07 18:23:46
100897	Sudarshan	\N	Nasery	enduser	2020-12-07 18:23:46
100898	Dadasaheb	\N	Tanpure	enduser	2020-12-07 18:23:46
100899	Sanjeev	\N	Kumar	enduser	2020-12-07 18:23:46
100900	Pandurang	\N	Kadam	enduser	2020-12-07 18:23:46
100901	Venkiteswaran	\N	Sivaramakrishnan	enduser	2020-12-07 18:23:46
100902	Chandrakant	\N	Dhenge	enduser	2020-12-07 18:23:46
100903	Subhashis	\N	Dey	enduser	2020-12-07 18:23:46
100904	Sanjay	\N	Kavathekar	enduser	2020-12-07 18:23:46
100905	Mallinath	\N	Chitali	enduser	2020-12-07 18:23:46
100906	Velayutham	\N	Shanmugam	enduser	2020-12-07 18:23:46
100907	Sagar	\N	Kachi	enduser	2020-12-07 18:23:46
100908	Ravindra	\N	Dake	enduser	2020-12-07 18:23:46
100909	Amit	\N	Singh	enduser	2020-12-07 18:23:46
100910	Dattatray	\N	Bombatkar	enduser	2020-12-07 18:23:46
100911	BBS	\N	Admin	enduser	2020-12-07 18:23:46
100912	Nagesh	\N	Chavan	enduser	2020-12-07 18:23:46
100913	Shripad	\N	Vakil	enduser	2020-12-07 18:23:46
100914	Anmol	\N	Mudholkar	enduser	2020-12-07 18:23:46
100915	Suresh	\N	Taklikar	enduser	2020-12-07 18:23:46
100916	Ganesh	\N	Kulkarni	enduser	2020-12-07 18:23:46
100917	Gopal	\N	Shankar	enduser	2020-12-07 18:23:46
100918	Abhishek	\N	Tripathi	enduser	2020-12-07 18:23:46
100919	Ravindra	\N	Agarkar	enduser	2020-12-07 18:23:46
100920	Prem	\N	Gupta	enduser	2020-12-07 18:23:46
100921	Raju	\N	Nageshkar	enduser	2020-12-07 18:23:46
100922	Umakant	\N	Patil	enduser	2020-12-07 18:23:46
100923	Nishant	\N	Shrivatsava	enduser	2020-12-07 18:23:46
100924	K	\N	Kumaresan	enduser	2020-12-07 18:23:46
100925	Pravin	\N	Mahadik	enduser	2020-12-07 18:23:46
100926	Mallikarjun	\N	Puranik	enduser	2020-12-07 18:23:46
100927	Ranjit	\N	Mohite	enduser	2020-12-07 18:23:46
100928	Sameer	\N	Kulkarni	enduser	2020-12-07 18:23:46
100929	Mahaveer	\N	Kale	enduser	2020-12-07 18:23:46
100930	Kaustav	\N	Mukherjee	enduser	2020-12-07 18:23:46
100931	Sanjay	\N	Extross	enduser	2020-12-07 18:23:46
100932	Prasanth	\N	Radhakrishnan	enduser	2020-12-07 18:23:46
100933	Wilson	\N	K	enduser	2020-12-07 18:23:46
100934	Jeevan	\N	Sutar	enduser	2020-12-07 18:23:46
100935	Deshmukh	\N	Madan	enduser	2020-12-07 18:23:46
100936	Suhas	\N	Mengane	enduser	2020-12-07 18:23:46
100937	Sushant 	\N	Pawar	enduser	2020-12-07 18:23:46
100938	Balakrishnan	\N	Menon	enduser	2020-12-07 18:23:46
100939	Malay	\N	Das	enduser	2020-12-07 18:23:46
100940	Dastoor	\N	K	enduser	2020-12-07 18:23:46
100941	Suryakant	\N	Chindage	enduser	2020-12-07 18:23:46
100942	Aditya	\N	Godse	enduser	2020-12-07 18:23:46
100943	SQLExecutiveCmdExec	\N	\N	enduser	2020-12-07 18:23:46
100944	Laxmikant	\N	Patil	enduser	2020-12-07 18:23:46
100945	Vishvas	\N	Yadav	enduser	2020-12-07 18:23:46
100946	Sharad	\N	Patil	enduser	2020-12-07 18:23:46
100947	Dasharath	\N	Aher	enduser	2020-12-07 18:23:46
100948	Payal	\N	Hoval	enduser	2020-12-07 18:23:46
100950	Krishnakumar	\N	Iyer	enduser	2020-12-07 18:23:46
100951	Amit	\N	Narkhede	enduser	2020-12-07 18:23:46
100952	Vikram	\N	Sable	enduser	2020-12-07 18:23:46
100953	Bala	\N	Balamurugan	enduser	2020-12-07 18:23:46
100954	Sambantham	\N	Karthikeyan	enduser	2020-12-07 18:23:46
100955	Arun	\N	Patil	enduser	2020-12-07 18:23:46
100956	Parasaram	\N	Nirupdrava	enduser	2020-12-07 18:23:46
100957	Tushar	\N	Durgawale	enduser	2020-12-07 18:23:46
100958	Vishwanath	\N	Chikadoli 	enduser	2020-12-07 18:23:46
100959	Chinnadurai	\N	Saravanan	enduser	2020-12-07 18:23:46
100960	Nitesh	\N	Patokar	enduser	2020-12-07 18:23:46
100961	Nitin	\N	Kawade	enduser	2020-12-07 18:23:46
100962	IT	\N	HYD	enduser	2020-12-07 18:23:46
100963	Abdul	\N	Shaik	enduser	2020-12-07 18:23:46
100964	Sudeep	\N	Sar	enduser	2020-12-07 18:23:46
100965	Pramod	\N	Ranjan	enduser	2020-12-07 18:23:46
100966	Kedar	\N	Tanksale	enduser	2020-12-07 18:23:46
100967	Rahul	\N	Bang	enduser	2020-12-07 18:23:46
100968	Nishikant	\N	Potode	enduser	2020-12-07 18:23:46
100969	Gangesh	\N	Mishra	enduser	2020-12-07 18:23:46
100970	Pramod	\N	Jadhav	enduser	2020-12-07 18:23:46
100971	Pravin	\N	Keshari	enduser	2020-12-07 18:23:46
100972	Pratik	\N	Roy	enduser	2020-12-07 18:23:46
100973	Gajanan	\N	Uppe	enduser	2020-12-07 18:23:46
100974	Mahesh	\N	Doifode	enduser	2020-12-07 18:23:46
100975	Ajoy	\N	Saha	enduser	2020-12-07 18:23:46
100976	Aditya	\N	Kathavate	enduser	2020-12-07 18:23:46
100977	Rohan	\N	Kadam	enduser	2020-12-07 18:23:46
100978	Shailesh	\N	Thakare	enduser	2020-12-07 18:23:46
100979	Pandu	\N	Varala	enduser	2020-12-07 18:23:46
100980	Arijit	\N	Mukherjee	enduser	2020-12-07 18:23:46
100981	Jayasundar	\N	Thangasamy	enduser	2020-12-07 18:23:46
100982	Satyabrata	\N	Kumar	enduser	2020-12-07 18:23:46
100983	Nirav	\N	Prajapati	enduser	2020-12-07 18:23:46
100984	Alagesan	\N	Natarajan	enduser	2020-12-07 18:23:46
100985	Rajiv	\N	Saha	enduser	2020-12-07 18:23:46
100986	Rajesh	\N	Khandekar	enduser	2020-12-07 18:23:46
100987	Rohit	\N	Awatade	enduser	2020-12-07 18:23:46
100988	Kaniska	\N	Bhattacharya	enduser	2020-12-07 18:23:46
100989	Subhankar	\N	Chaudhuri	enduser	2020-12-07 18:23:46
100990	Ramulu	\N	Singannagari	enduser	2020-12-07 18:23:46
100991	Rakesh	\N	Kaji	enduser	2020-12-07 18:23:46
100992	Santosh	\N	Pathare	enduser	2020-12-07 18:23:46
100993	Pravin	\N	Wadekar	enduser	2020-12-07 18:23:46
100994	Naushadh	\N	Maideen	enduser	2020-12-07 18:23:46
100995	Swapan	\N	Jati	enduser	2020-12-07 18:23:46
100996	Chandrasekar	\N	Kandhaswamy	enduser	2020-12-07 18:23:46
100997	Santanu	\N	Majumder	enduser	2020-12-07 18:23:46
100998	Ganesh	\N	Dhapte	enduser	2020-12-07 18:23:46
100999	Rahul	\N	Ghulanawar	enduser	2020-12-07 18:23:46
101000	Suraj	\N	Tarlekar	enduser	2020-12-07 18:23:46
101001	Gagandeep	\N	Kaur	enduser	2020-12-07 18:23:46
101002	jayan	\N	Jayanthi	enduser	2020-12-07 18:23:46
101003	Mohan	\N	Giridharan	enduser	2020-12-07 18:23:46
101004	Karthikeyan	\N	Kuppusamy	enduser	2020-12-07 18:23:46
101005	Galla	\N	Rao	enduser	2020-12-07 18:23:46
101006	Lakhan	\N	Kuwar	enduser	2020-12-07 18:23:46
101007	Ashish	\N	Mehendale	enduser	2020-12-07 18:23:46
101008	Ankush	\N	Khot	enduser	2020-12-07 18:23:46
101009	Jaganath	\N	Shinde	enduser	2020-12-07 18:23:46
101010	Ramachandran	\N	Menon	enduser	2020-12-07 18:23:46
101011	Vidyasagar	\N	Girmal	enduser	2020-12-07 18:23:46
101012	Kalicharan	\N	Mahato	enduser	2020-12-07 18:23:46
101013	Sameer	\N	Chalke	enduser	2020-12-07 18:23:46
101014	Dhaval	\N	Jayawant	enduser	2020-12-07 18:23:46
101015	Ratndeep	\N	Ghatge	enduser	2020-12-07 18:23:46
101016	Shrikant	\N	Kanase	enduser	2020-12-07 18:23:46
101017	Bhaskar	\N	Govindasamy	enduser	2020-12-07 18:23:46
101018	Sahil	\N	Salvi	enduser	2020-12-07 18:23:46
101019	Dandu	\N	Varma	enduser	2020-12-07 18:23:46
101020	EUQ_TKIIEXCH	\N	\N	enduser	2020-12-07 18:23:46
101021	Raveendran	\N	Rajeesh	enduser	2020-12-07 18:23:46
101022	tkii	\N	Desksupport4	enduser	2020-12-07 18:23:46
101023	Mokanpally	\N	Reddy	enduser	2020-12-07 18:23:46
101024	Anish	\N	Girme	enduser	2020-12-07 18:23:46
101025	Boddu	\N	Nancharaiah	enduser	2020-12-07 18:23:46
101026	Sagar	\N	Khanekar	enduser	2020-12-07 18:23:46
101028	Venkatesh	\N	Durairaj	enduser	2020-12-07 18:23:46
101029	Prasad	\N	Tele	enduser	2020-12-07 18:23:46
101030	Vijaykumar	\N	Manchare	enduser	2020-12-07 18:23:46
101031	Thatchinamoorthy	\N	Chinnadurai	enduser	2020-12-07 18:23:46
101032	Kavishwar	\N	Pachare	enduser	2020-12-07 18:23:46
101033	Louie	\N	Parakkal	enduser	2020-12-07 18:23:46
101034	Rohan	\N	Sood	enduser	2020-12-07 18:23:46
101035	Sukanta	\N	Bag	enduser	2020-12-07 18:23:46
101036	Venkat	\N	Iyer	enduser	2020-12-07 18:23:46
101037	Rameshwar	\N	Hosnale	enduser	2020-12-07 18:23:46
101038	BES	\N	Admin	enduser	2020-12-07 18:23:46
101039	Akash	\N	Patodi	enduser	2020-12-07 18:23:46
101040	Gottapu	\N	Naidu	enduser	2020-12-07 18:23:46
101041	Sanjay	\N	Rai	enduser	2020-12-07 18:23:46
101042	Munasir	\N	Sayyed	enduser	2020-12-07 18:23:46
101043	Soham	\N	Pawaskar	enduser	2020-12-07 18:23:46
101044	Jagdish	\N	Kulkarni	enduser	2020-12-07 18:23:46
101045	Saravana	\N	Kumar	enduser	2020-12-07 18:23:46
101046	Sunder	\N	Kalyani	enduser	2020-12-07 18:23:46
101047	Dipanjan	\N	Koley	enduser	2020-12-07 18:23:46
101048	Rahul	\N	Nigam	enduser	2020-12-07 18:23:46
101049	Ashish	\N	Singh	enduser	2020-12-07 18:23:46
101050	Kiran	\N	Nambiar	enduser	2020-12-07 18:23:46
101051	Catherine	\N	Tekade	enduser	2020-12-07 18:23:46
101052	Admin$	\N	\N	enduser	2020-12-07 18:23:46
101053	Rahul	\N	Gaikwad	enduser	2020-12-07 18:23:46
101054	Mohini	\N	Kshetramade	enduser	2020-12-07 18:23:46
101055	Prasad	\N	Natekar	enduser	2020-12-07 18:23:46
101056	Avijit	\N	Pramanik	enduser	2020-12-07 18:23:46
101057	Srikanth	\N	Kumar	enduser	2020-12-07 18:23:46
101058	Bhairu	\N	Wagharalkar	enduser	2020-12-07 18:23:46
101059	Manashi	\N	Mitra	enduser	2020-12-07 18:23:46
101060	Uday	\N	Shinde	enduser	2020-12-07 18:23:46
101061	Chetan	\N	Rajebhosale	enduser	2020-12-07 18:23:46
101062	TKtrust	\N	\N	enduser	2020-12-07 18:23:46
101063	Srikanth	\N	Jampala	enduser	2020-12-07 18:23:46
101064	Satyanarayana	\N	Sadanala	enduser	2020-12-07 18:23:46
101065	Prathamesh	\N	Kamble	enduser	2020-12-07 18:23:46
101066	Bheemana	\N	Swami	enduser	2020-12-07 18:23:46
101067	Emmanuel	\N	Joseph	enduser	2020-12-07 18:23:46
101068	Dattatraya	\N	Shinde	enduser	2020-12-07 18:23:46
101069	Saurabh	\N	Renke	enduser	2020-12-07 18:23:46
101070	Sushant	\N	Jagadale	enduser	2020-12-07 18:23:46
101071	Rohan	\N	Parasnis	enduser	2020-12-07 18:23:46
101072	Prashant	\N	Wasnik	enduser	2020-12-07 18:23:46
101073	Pallavi	\N	Purandare	enduser	2020-12-07 18:23:46
101074	Ramdas	\N	Dhanavade	enduser	2020-12-07 18:23:46
101075	Shashikant	\N	Shinde	enduser	2020-12-07 18:23:46
101076	Muthukrishnan	\N	Karuppusamy	enduser	2020-12-07 18:23:46
101077	Vijayalaxmi	\N	Birajdar	enduser	2020-12-07 18:23:46
101078	Chaitanya	\N	Murumkar	enduser	2020-12-07 18:23:46
101079	Shridhar	\N	Giri	enduser	2020-12-07 18:23:46
101080	Supriya	\N	Choudhari	enduser	2020-12-07 18:23:46
101081	Rudra	\N	Som	enduser	2020-12-07 18:23:46
101082	Kamlesh	\N	Mishra	enduser	2020-12-07 18:23:46
101083	Dhanesh	\N	Shivangekar	enduser	2020-12-07 18:23:46
101084	Sachin	\N	Sable	enduser	2020-12-07 18:23:46
101085	Hemant	\N	Boid	enduser	2020-12-07 18:23:46
101086	Parvraj	\N	Pachore	enduser	2020-12-07 18:23:46
101087	Rajkumar	\N	Suryawanshi	enduser	2020-12-07 18:23:46
101088	Srikrishna	\N	Perumal	enduser	2020-12-07 18:23:46
101089	Shyamlal	\N	Nayak	enduser	2020-12-07 18:23:46
101090	Manikanand	\N	Vivekandan	enduser	2020-12-07 18:23:46
101091	Sarish	\N	Chandran	enduser	2020-12-07 18:23:46
101092	Sourabh	\N	Kale	enduser	2020-12-07 18:23:46
101093	Chandrakant	\N	Hiwarale	enduser	2020-12-07 18:23:46
101094	Surajit	\N	Chowdhury	enduser	2020-12-07 18:23:46
101095	Manikant	\N	Siva	enduser	2020-12-07 18:23:46
101096	Akram	\N	Khan	enduser	2020-12-07 18:23:46
101097	Deepak	\N	Reddy	enduser	2020-12-07 18:23:46
101098	Middela	\N	Ramesh	enduser	2020-12-07 18:23:46
101099	Abhay	\N	Krishnanunni	enduser	2020-12-07 18:23:46
101100	Kalvakuntla	\N	Santhosh	enduser	2020-12-07 18:23:46
101101	Upendra	\N	Rout	enduser	2020-12-07 18:23:46
101102	Samadhan	\N	Borse	enduser	2020-12-07 18:23:46
101103	Cluster	\N	\N	enduser	2020-12-07 18:23:46
101104	Gautam	\N	Dutta	enduser	2020-12-07 18:23:46
101105	Ajay	\N	Babhre	enduser	2020-12-07 18:23:46
101106	Shib	\N	Banerjee	enduser	2020-12-07 18:23:46
101108	Suresh	\N	Agasti	enduser	2020-12-07 18:23:46
101109	Judhisthir	\N	Behera	enduser	2020-12-07 18:23:46
101110	VPN_FA04	\N	\N	enduser	2020-12-07 18:23:46
101111	Ravi	\N	Dang	enduser	2020-12-07 18:23:46
101112	Prashant	\N	Junghare	enduser	2020-12-07 18:23:46
101113	Janardhana	\N	Ramalingam	enduser	2020-12-07 18:23:46
101114	Sandeep	\N	Shinde	enduser	2020-12-07 18:23:46
101115	Harshal	\N	Phadtare	enduser	2020-12-07 18:23:46
101116	Somnath	\N	Kakare	enduser	2020-12-07 18:23:46
101117	Vanakkili	\N	Ganeshan	enduser	2020-12-07 18:23:46
101118	Debajyoti	\N	Chatterjee	enduser	2020-12-07 18:23:46
101119	Snigdha	\N	Biswas	enduser	2020-12-07 18:23:46
101120	Pravin	\N	Mane	enduser	2020-12-07 18:23:46
101121	Shailesh	\N	Shinde	enduser	2020-12-07 18:23:46
101122	Tejas	\N	Chopde	enduser	2020-12-07 18:23:46
101123	Santhan	\N	Loganathan	enduser	2020-12-07 18:23:46
101124	Ravikumar	\N	Prajapati	enduser	2020-12-07 18:23:46
101125	Asmita	\N	Shedge	enduser	2020-12-07 18:23:46
101126	IT	\N	KOL	enduser	2020-12-07 18:23:46
101127	Chittaranjan	\N	Sawant	enduser	2020-12-07 18:23:46
101128	Ambar	\N	Todkar	enduser	2020-12-07 18:23:46
101129	Jayvant	\N	Gaikwad	enduser	2020-12-07 18:23:46
101130	Shreenivas	\N	Chennur	enduser	2020-12-07 18:23:46
101131	Arijit	\N	Modak	enduser	2020-12-07 18:23:46
101132	Vaibhav	\N	Patil	enduser	2020-12-07 18:23:46
101133	Mohit	\N	Benadikar	enduser	2020-12-07 18:23:46
101134	Amarendra	\N	Das	enduser	2020-12-07 18:23:46
101135	Adham	\N	Beik	enduser	2020-12-07 18:23:46
101136	Jijaram	\N	Gaikwad	enduser	2020-12-07 18:23:46
101137	Pramod	\N	Barge	enduser	2020-12-07 18:23:46
101138	Sanjaykumar	\N	Behera	enduser	2020-12-07 18:23:46
101139	Pravin	\N	Patil	enduser	2020-12-07 18:23:46
101140	Ashishkumar	\N	Nayak	enduser	2020-12-07 18:23:46
101141	Navnath	\N	Khodave	enduser	2020-12-07 18:23:46
101142	Sheba	\N	George	enduser	2020-12-07 18:23:46
101143	Yogesh	\N	Deoghare	enduser	2020-12-07 18:23:46
101144	Rahul	\N	Shahapurkar	enduser	2020-12-07 18:23:46
101145	Keshav	\N	Nagpurkar	enduser	2020-12-07 18:23:46
101146	Chandan	\N	Mishra	enduser	2020-12-07 18:23:46
101147	Srimanta	\N	Samanta	enduser	2020-12-07 18:23:46
101148	Vishnu	\N	Kandukuri	enduser	2020-12-07 18:23:46
101149	Baswanth	\N	Jyothi	enduser	2020-12-07 18:23:46
101150	Vignesh	\N	Athimoolam	enduser	2020-12-07 18:23:46
101151	Paresh	\N	Shelke	enduser	2020-12-07 18:23:46
101153	ivlcoin2	\N	\N	enduser	2020-12-07 18:23:46
101155	Abhay	\N	Patil	enduser	2020-12-07 18:23:46
101156	Indranil	\N	Roy	enduser	2020-12-07 18:23:46
101157	Akshay	\N	Nanekar	enduser	2020-12-07 18:23:46
101158	Ashish	\N	Tale	enduser	2020-12-07 18:23:46
101159	CemGuest	\N	PDMS01	enduser	2020-12-07 18:23:46
101160	Balkrushana	\N	More	enduser	2020-12-07 18:23:46
101161	Sachin	\N	Kumbhar	enduser	2020-12-07 18:23:46
101162	Rahul	\N	Bartakke	enduser	2020-12-07 18:23:46
101163	Ananth	\N	V.R	enduser	2020-12-07 18:23:46
101164	Harshal	\N	Tilekar	enduser	2020-12-07 18:23:46
101165	Namrata	\N	Bathija	enduser	2020-12-07 18:23:46
101166	Sandip	\N	Mokashi	enduser	2020-12-07 18:23:46
101167	Abhay	\N	Gulavani	enduser	2020-12-07 18:23:46
101168	Amitesh	\N	Verma	enduser	2020-12-07 18:23:46
101169	Pravin	\N	Kumbhar	enduser	2020-12-07 18:23:46
101170	Umed	\N	Dangi	enduser	2020-12-07 18:23:46
101171	Nahush	\N	Kelkar	enduser	2020-12-07 18:23:46
101172	Prashant	\N	Soddagi	enduser	2020-12-07 18:23:46
101173	Vijay	\N	Khairkhar	enduser	2020-12-07 18:23:46
101174	Laxman	\N	Nevge	enduser	2020-12-07 18:23:46
101175	Pooja	\N	Dhawle	enduser	2020-12-07 18:23:46
101176	Anand	\N	Malpedi	enduser	2020-12-07 18:23:46
101177	Sneha	\N	Tamgave	enduser	2020-12-07 18:23:46
101178	Priyanka	\N	Kaldhone	enduser	2020-12-07 18:23:46
101179	Devendra	\N	Pawar	enduser	2020-12-07 18:23:46
101180	Sandeep	\N	Singh	enduser	2020-12-07 18:23:46
101181	CemGuest	\N	PDMS02	enduser	2020-12-07 18:23:46
101182	Shivani	\N	Nikam	enduser	2020-12-07 18:23:46
101183	Ashish	\N	Ranjane	enduser	2020-12-07 18:23:46
101184	Nilesh	\N	Bhor	enduser	2020-12-07 18:23:46
101185	Swapnil	\N	Jagadale	enduser	2020-12-07 18:23:46
101186	Prasad	\N	Vadrevu	enduser	2020-12-07 18:23:46
101187	Mangesh	\N	Jadhav	enduser	2020-12-07 18:23:46
101188	Arun	\N	Munigonda	enduser	2020-12-07 18:23:46
101189	Fakruddin	\N	Fayaz	enduser	2020-12-07 18:23:46
101190	Pooja	\N	Demanna	enduser	2020-12-07 18:23:46
101191	Eshwar	\N	Solanki	enduser	2020-12-07 18:23:46
101192	Pranav	\N	Tanpure	enduser	2020-12-07 18:23:46
101193	Santosh	\N	Shirote	enduser	2020-12-07 18:23:46
101194	Himanshu	\N	Lipare	enduser	2020-12-07 18:23:46
101195	Vivek	\N	Tampi	enduser	2020-12-07 18:23:46
101196	Arun	\N	R	enduser	2020-12-07 18:23:46
101197	Sneha	\N	Mane	enduser	2020-12-07 18:23:46
101198	Sumit	\N	Kalel	enduser	2020-12-07 18:23:46
101199	Vaithiyanathan	\N	Subramanian	enduser	2020-12-07 18:23:46
101200	Shajahan	\N	Sheik	enduser	2020-12-07 18:23:46
101201	Preet	\N	Saroa	enduser	2020-12-07 18:23:46
101202	Zohurul	\N	Sarkar	enduser	2020-12-07 18:23:46
101203	Mrunalini	\N	Raskar	enduser	2020-12-07 18:23:46
101204	Omkar	\N	Shejwal	enduser	2020-12-07 18:23:46
101205	Ayush	\N	Jailkhani	enduser	2020-12-07 18:23:46
101206	Aman	\N	Goyal	enduser	2020-12-07 18:23:46
101207	Prachi	\N	Patade	enduser	2020-12-07 18:23:46
101208	Aniruddh	\N	Sankpal	enduser	2020-12-07 18:23:46
101209	Swapnil	\N	Shah	enduser	2020-12-07 18:23:46
101210	Nilam	\N	Sutar	enduser	2020-12-07 18:23:46
101211	Amit	\N	Karante	enduser	2020-12-07 18:23:46
101212	Rahul	\N	Patil	enduser	2020-12-07 18:23:46
101213	Chaitanya	\N	Gramopadhye	enduser	2020-12-07 18:23:46
101214	Adarsh	\N	Kumar	enduser	2020-12-07 18:23:46
101215	Vikas	\N	Retwade	enduser	2020-12-07 18:23:46
101216	Mahendra	\N	Bechawade	enduser	2020-12-07 18:23:46
101217	Santosh	\N	Asangi	enduser	2020-12-07 18:23:46
101218	Rohit	\N	Pukale	enduser	2020-12-07 18:23:46
101219	Sadakatali	\N	Mulla	enduser	2020-12-07 18:23:46
101220	Nimal	\N	Babu	enduser	2020-12-07 18:23:46
101221	Siddhant	\N	Mohite	enduser	2020-12-07 18:23:46
101222	Mayank	\N	Tiwari	enduser	2020-12-07 18:23:46
101223	Vikas	\N	Kulkarni	enduser	2020-12-07 18:23:46
101224	Avijit	\N	Paul	enduser	2020-12-07 18:23:46
101225	Rohan	\N	Joshi	enduser	2020-12-07 18:23:46
101226	Sunil	\N	Mali	enduser	2020-12-07 18:23:46
101227	Prathmesh	\N	Gandhi	enduser	2020-12-07 18:23:46
101228	Omkar	\N	Kolge	enduser	2020-12-07 18:23:46
101229	Marisamy	\N	Solaiyappan	enduser	2020-12-07 18:23:46
101230	Shyam	\N	Pandey	enduser	2020-12-07 18:23:46
101231	Akshay	\N	Todkar	enduser	2020-12-07 18:23:46
101232	Nandkishor	\N	Dahule	enduser	2020-12-07 18:23:46
101233	Akshay	\N	Jadhav	enduser	2020-12-07 18:23:46
101234	Indrajit	\N	Patil	enduser	2020-12-07 18:23:46
101235	Adarsh	\N	Chandgude	enduser	2020-12-07 18:23:46
101236	Shounak	\N	Bhise	enduser	2020-12-07 18:23:46
101237	Shobha	\N	Devadiga	enduser	2020-12-07 18:23:46
101238	Aditya	\N	Kore	enduser	2020-12-07 18:23:46
101239	Mangal	\N	Pokharkar	enduser	2020-12-07 18:23:46
101240	Sanjay	\N	Ghone	enduser	2020-12-07 18:23:46
101241	Alok	\N	Yadav	enduser	2020-12-07 18:23:46
101242	Vaibhav	\N	Vaidya	enduser	2020-12-07 18:23:46
101243	Aumkar	\N	Pradhan	enduser	2020-12-07 18:23:46
101244	Sandip	\N	Naik	enduser	2020-12-07 18:23:46
101245	Varjavan	\N	Dastoor	enduser	2020-12-07 18:23:46
101246	Vishnuprasad	\N	Varma	enduser	2020-12-07 18:23:46
101247	Nileema	\N	Chaphekar	enduser	2020-12-07 18:23:46
101248	Khemraj	\N	Gadgil	enduser	2020-12-07 18:23:46
101249	Ashutosh	\N	Bejekar	enduser	2020-12-07 18:23:46
101250	Sanjeev	\N	Tata	enduser	2020-12-07 18:23:46
101251	Tarun	\N	Chakraborty	enduser	2020-12-07 18:23:46
101252	Siddharth	\N	Jirage	enduser	2020-12-07 18:23:46
101253	Snehankit	\N	Kharbas	enduser	2020-12-07 18:23:46
101254	Soumik	\N	Paul	enduser	2020-12-07 18:23:46
101255	Ganesh	\N	Lohar	enduser	2020-12-07 18:23:46
101256	Fariyaz	\N	Irani	enduser	2020-12-07 18:23:46
101257	Ashish	\N	Kale	enduser	2020-12-07 18:23:46
101258	Ankita	\N	Pawar	enduser	2020-12-07 18:23:46
101259	Onkar	\N	Dapke	enduser	2020-12-07 18:23:46
101260	Sudhanva	\N	Kadkol	enduser	2020-12-07 18:23:46
101261	Dharamkumar	\N	Maradiya	enduser	2020-12-07 18:23:46
101262	Yash	\N	Ponde	enduser	2020-12-07 18:23:46
101263	Snehal	\N	Ozarkar	enduser	2020-12-07 18:23:46
101264	Vedashri	\N	Telang	enduser	2020-12-07 18:23:46
101265	Sangamesh	\N	Dukandar	enduser	2020-12-07 18:23:46
101266	Mayur	\N	Pawar	enduser	2020-12-07 18:23:46
101267	Korupolu	\N	Srinivas	enduser	2020-12-07 18:23:46
101268	Swarup	\N	Senapati	enduser	2020-12-07 18:23:46
101269	Shubham	\N	Patil	enduser	2020-12-07 18:23:46
101270	Aditya	\N	Athavale	enduser	2020-12-07 18:23:46
101271	Satish	\N	Jagtap	enduser	2020-12-07 18:23:46
101272	Mahesh	\N	Mane	enduser	2020-12-07 18:23:46
101273	Vijesh	\N	Madarapu	enduser	2020-12-07 18:23:46
101274	Devesh	\N	Nigudkar	enduser	2020-12-07 18:23:46
101275	Sheetal	\N	Bhosale	enduser	2020-12-07 18:23:46
101276	Palash	\N	Baheti	enduser	2020-12-07 18:23:46
101277	Mukesh	\N	Murugan	enduser	2020-12-07 18:23:46
101278	Kartik	\N	Bakshi	enduser	2020-12-07 18:23:46
101279	Nisarg	\N	Shah	enduser	2020-12-07 18:23:46
101280	Rohit	\N	Bhurale	enduser	2020-12-07 18:23:46
101281	Vishvajeet	\N	Chavan	enduser	2020-12-07 18:23:46
101282	Seema	\N	Pawar	enduser	2020-12-07 18:23:46
101283	Omkar	\N	Pawar	enduser	2020-12-07 18:23:46
101284	Dinesh	\N	Wagh	enduser	2020-12-07 18:23:46
101285	Shubham	\N	Bhagwat	enduser	2020-12-07 18:23:46
101286	Varun	\N	Joshi	enduser	2020-12-07 18:23:46
101287	Shantaram	\N	Patil	enduser	2020-12-07 18:23:46
101288	Varun	\N	Kulkarni	enduser	2020-12-07 18:23:46
101289	Sudhakar	\N	Reddy	enduser	2020-12-07 18:23:46
101290	Tanmay	\N	Bhave	enduser	2020-12-07 18:23:46
101291	Reshmi	\N	Nair	enduser	2020-12-07 18:23:46
101292	Narsu	\N	Patil	enduser	2020-12-07 18:23:46
101293	Pradeep	\N	Kamble	enduser	2020-12-07 18:23:46
101294	Kishor	\N	Mhetre	enduser	2020-12-07 18:23:46
101295	Rohit	\N	Bharvesh	enduser	2020-12-07 18:23:46
101296	Venkateshwarlu	\N	Dommati	enduser	2020-12-07 18:23:46
101297	Atul	\N	Belgamwar	enduser	2020-12-07 18:23:46
101298	Byraboiena	\N	Nagaraju	enduser	2020-12-07 18:23:46
101299	Vikranth	\N	Pulakala	enduser	2020-12-07 18:23:46
101300	Jagdish	\N	Dhumal	enduser	2020-12-07 18:23:46
101301	Pramodh	\N	Thoudoos	enduser	2020-12-07 18:23:46
101302	Kasireddy	\N	Karthik	enduser	2020-12-07 18:23:46
101303	Shiva	\N	Poosa	enduser	2020-12-07 18:23:46
101304	Bibhuti	\N	Sahu	enduser	2020-12-07 18:23:46
101305	Shaik	\N	Baji	enduser	2020-12-07 18:23:46
101306	Satish	\N	Chandra	enduser	2020-12-07 18:23:46
101307	Srinivasulu	\N	M	enduser	2020-12-07 18:23:46
101308	Lokesh	\N	Kumar	enduser	2020-12-07 18:23:46
101309	Jaiee	\N	Adhe	enduser	2020-12-07 18:23:46
101310	Vaijinath	\N	Rawale	enduser	2020-12-07 18:23:46
101311	Ajay	\N	Guduru	enduser	2020-12-07 18:23:46
101312	Vinayak	\N	Salke	enduser	2020-12-07 18:23:46
101313	Archana	\N	Kadam	enduser	2020-12-07 18:23:46
101314	Manohar	\N	Nayak	enduser	2020-12-07 18:23:46
101315	Nilesh	\N	Swamy	enduser	2020-12-07 18:23:46
101316	Rajeev	\N	Keskar	enduser	2020-12-07 18:23:46
101317	Lava	\N	Adari	enduser	2020-12-07 18:23:46
101318	Rishikesh	\N	Ahire	enduser	2020-12-07 18:23:46
101319	Anil	\N	Aravindan	enduser	2020-12-07 18:23:46
101320	Aditya	\N	Naikwadi	enduser	2020-12-07 18:23:46
101321	Vinit	\N	Dave	enduser	2020-12-07 18:23:46
101322	Mukesh	\N	Ojha	enduser	2020-12-07 18:23:46
101323	Mukesh	\N	Rm	enduser	2020-12-07 18:23:46
101324	Kailas	\N	Nikalje	enduser	2020-12-07 18:23:46
101325	Siddheshwar	\N	Sonwalkar	enduser	2020-12-07 18:23:46
101326	Akshay	\N	Chorage	enduser	2020-12-07 18:23:46
101327	Channabasappa	\N	Sannappanava	enduser	2020-12-07 18:23:46
101328	Subramanya	\N	S	enduser	2020-12-07 18:23:46
101329	Manish	\N	Singh	enduser	2020-12-07 18:23:46
101330	Kailash	\N	Jadhav	enduser	2020-12-07 18:23:46
101331	Sonika	\N	Kulhare	enduser	2020-12-07 18:23:46
101332	Akshay	\N	Chavan	enduser	2020-12-07 18:23:46
101333	Sujeetkumar	\N	Bhagat	enduser	2020-12-07 18:23:46
101334	Sagar	\N	Ghule	enduser	2020-12-07 18:23:46
101335	Bibhuti	\N	Nayak	enduser	2020-12-07 18:23:46
101336	Ajay	\N	Joshi	enduser	2020-12-07 18:23:46
101337	Anandkumar	\N	Bhairappa	enduser	2020-12-07 18:23:46
101338	Sachin	\N	Misal	enduser	2020-12-07 18:23:46
101339	Arun	\N	Chilakala	enduser	2020-12-07 18:23:46
101340	Praveen	\N	Kumar	enduser	2020-12-07 18:23:46
101341	Sandeep	\N	Kumar	enduser	2020-12-07 18:23:46
101342	Sukhjiwan	\N	Biring	enduser	2020-12-07 18:23:46
101343	Pravin	\N	Shirke	enduser	2020-12-07 18:23:46
101344	Harshal	\N	Thakare	enduser	2020-12-07 18:23:46
101345	Rajan	\N	Verma	enduser	2020-12-07 18:23:46
101346	Amita	\N	Shewale	enduser	2020-12-07 18:23:46
101347	Prashant	\N	Mane	enduser	2020-12-07 18:23:46
101348	Dinesh	\N	Humnabadkar	enduser	2020-12-07 18:23:46
101349	Pawar	\N	R	enduser	2020-12-07 18:23:46
101350	tkii	\N	Desksupport5	enduser	2020-12-07 18:23:46
101351	Deepa	\N	D'souza	enduser	2020-12-07 18:23:46
101352	Selambathevar	\N	Krishnaswamy	enduser	2020-12-07 18:23:46
101353	Krushna	\N	Swain	enduser	2020-12-07 18:23:46
101354	Abhijit	\N	Pujari	enduser	2020-12-07 18:23:46
101355	Rishikesh	\N	Kanshetti	enduser	2020-12-07 18:23:46
101356	Avinash	\N	Kshirsagar	enduser	2020-12-07 18:23:46
101357	Printer Test	\N	\N	enduser	2020-12-07 18:23:46
101358	Rahul	\N	Deshmukh	enduser	2020-12-07 18:23:46
101359	Ravi	\N	Choudhary	enduser	2020-12-07 18:23:46
101360	Michael	\N	Schniederkoetter	enduser	2020-12-07 18:23:46
101361	Mahendra	\N	Joshi	enduser	2020-12-07 18:23:46
101362	Virat	\N	Joshii	enduser	2020-12-07 18:23:46
101363	Chaitanya	\N	Akhouri	enduser	2020-12-07 18:23:46
101364	Ruksana	\N	Kapase	enduser	2020-12-07 18:23:46
101365	Dattatray	\N	Chikane	enduser	2020-12-07 18:23:46
101366	ARCHANA	\N	KURHADE	enduser	2020-12-07 18:23:46
101367	Raghunath	\N	Joshi	enduser	2020-12-07 18:23:46
101368	Mandar	\N	Kulkarni	enduser	2020-12-07 18:23:46
101369	Janhavi	\N	Muley	enduser	2020-12-07 18:23:46
101370	Vijayanand	\N	Mishra	enduser	2020-12-07 18:23:46
101371	Anandaroop	\N	Ghosal	enduser	2020-12-07 18:23:46
101372	Satyanarayanaa	\N	Rama	enduser	2020-12-07 18:23:46
101373	Devashree	\N	Shastrakar	enduser	2020-12-07 18:23:46
101374	Bhusan	\N	Nayak	enduser	2020-12-07 18:23:46
101375	Pooja	\N	Sumbad	enduser	2020-12-07 18:23:46
101376	Happy	\N	Verma	enduser	2020-12-07 18:23:46
101377	SURESH BABU	\N	LANKAYAGARI	enduser	2020-12-07 18:23:46
101378	Bommaram	\N	Shiva	enduser	2020-12-07 18:23:46
101379	Purushottam	\N	Yadav	enduser	2020-12-07 18:23:46
101380	Megha	\N	Hanchate	enduser	2020-12-07 18:23:46
101381	Siva	\N	Kundur	enduser	2020-12-07 18:23:46
101382	Umesh	\N	Jangam	enduser	2020-12-07 18:23:46
101383	Anand	\N	Nalawade	enduser	2020-12-07 18:23:46
101384	Suraj	\N	Shinde	enduser	2020-12-07 18:23:46
101385	Prakash	\N	Mane	enduser	2020-12-07 18:23:46
101386	Sunil	\N	Dindegave	enduser	2020-12-07 18:23:46
101387	Gopal	\N	Choudhari	enduser	2020-12-07 18:23:46
101388	Prashant	\N	Dhole	enduser	2020-12-07 18:23:46
101389	Deepak	\N	Patil	enduser	2020-12-07 18:23:46
101390	Digambar	\N	Kamble	enduser	2020-12-07 18:23:46
101391	Sagar	\N	Thombare	enduser	2020-12-07 18:23:46
101392	Priya	\N	Nilakhe	enduser	2020-12-07 18:23:46
101393	Mantosh	\N	Kumar	enduser	2020-12-07 18:23:46
101394	Ameya	\N	Karve	enduser	2020-12-07 18:23:46
101395	Ramkrushna	\N	Chaudhari	enduser	2020-12-07 18:23:46
101396	Suraj	\N	Londhe	enduser	2020-12-07 18:23:46
101397	Mohammad	\N	Ahmad	enduser	2020-12-07 18:23:46
101398	Phanidhar	\N	Annabattula	enduser	2020-12-07 18:23:46
101399	Pralash	\N	Mandal	enduser	2020-12-07 18:23:46
101400	Ganji	\N	Rahul	enduser	2020-12-07 18:23:46
101401	Jetti	\N	Varaprasad	enduser	2020-12-07 18:23:46
101402	Saumitra	\N	Kolhatkar	enduser	2020-12-07 18:23:46
101403	Shashi	\N	Ranjan	enduser	2020-12-07 18:23:46
101404	Akash	\N	Patil	enduser	2020-12-07 18:23:46
101405	Yashpalsinh	\N	Jethwa	enduser	2020-12-07 18:23:46
101406	Rachakonda	\N	Mokshagna	enduser	2020-12-07 18:23:46
101407	Omkar	\N	Mulik	enduser	2020-12-07 18:23:46
101408	Abhijit	\N	Bhasme	enduser	2020-12-07 18:23:46
101409	Pratik	\N	Rakh	enduser	2020-12-07 18:23:46
101410	Tukaram	\N	Maskale	enduser	2020-12-07 18:23:46
101411	Aman	\N	Kathuria	enduser	2020-12-07 18:23:46
101412	Mahesh	\N	Bade	enduser	2020-12-07 18:23:46
101413	VikashKumar	\N	Panda	enduser	2020-12-07 18:23:46
101414	Pratik	\N	Bharsakale	enduser	2020-12-07 18:23:46
101415	Avinash	\N	Kulkarni	enduser	2020-12-07 18:23:46
101416	Mallinath	\N	Wale	enduser	2020-12-07 18:23:46
101417	Samadhan	\N	Gaikwad	enduser	2020-12-07 18:23:46
101418	Avinash	\N	Lohar	enduser	2020-12-07 18:23:46
101419	Venkatamahesh	\N	Punugu	enduser	2020-12-07 18:23:46
101420	Vivek	\N	Bhatia	enduser	2020-12-07 18:23:46
101421	Tarit	\N	Mondal	enduser	2020-12-07 18:23:46
101422	Ashish	\N	Wadkar	enduser	2020-12-07 18:23:46
101423	tyu	\N	ghj	enduser	2020-12-07 18:23:46
101424	Alfred	\N	Kasote	enduser	2020-12-07 18:23:46
101425	Raman	\N	Dey	enduser	2020-12-07 18:23:46
101426	Amit	\N	Roy	enduser	2020-12-07 18:23:46
101427	Balu	\N	Dange	enduser	2020-12-07 18:23:46
101428	Jyothish	\N	Pillai	enduser	2020-12-07 18:23:46
101429	Kesavan	\N	Kaliappan	enduser	2020-12-07 18:23:46
101430	Surya	\N	Pillai	enduser	2020-12-07 18:23:46
101431	Abhijit	\N	Thorat	enduser	2020-12-07 18:23:46
101432	Milind	\N	Navare	enduser	2020-12-07 18:23:46
101433	Sobhan	\N	Gudduri	enduser	2020-12-07 18:23:46
101434	Services	\N	VLJ Mechanical	enduser	2020-12-07 18:23:46
101435	Services	\N	VLJ  EI	enduser	2020-12-07 18:23:46
101436	Services	\N	VLJ  HSE	enduser	2020-12-07 18:23:46
101437	Tamidela	\N	Reddy	enduser	2020-12-07 18:23:46
101438	Pallaviy	\N	Purandarre	enduser	2020-12-07 18:23:46
101439	Shravan	\N	Tripathi	enduser	2020-12-07 18:23:46
101440	Pooja	\N	Ingale	enduser	2020-12-07 18:23:46
101441	Kavita	\N	Choudhary	enduser	2020-12-07 18:23:46
101442	Pradeep	\N	Vadakeveedu	enduser	2020-12-07 18:23:46
101443	Sumedh	\N	Deshpande	enduser	2020-12-07 18:23:46
101444	Rakesh	\N	Gupta	enduser	2020-12-07 18:23:46
101445	Digvijay	\N	Chundawat	enduser	2020-12-07 18:23:46
101446	Services	\N	VLJ Mechanical Rodding	enduser	2020-12-07 18:23:46
101447	Services	\N	VLJ  EI Rodding	enduser	2020-12-07 18:23:46
101448	Services	\N	VLJ Mechanical GAP	enduser	2020-12-07 18:23:46
101449	Services	\N	VLJ  EI GAP	enduser	2020-12-07 18:23:46
101450	Services	\N	VLJ Mechanical BO	enduser	2020-12-07 18:23:46
101451	Services	\N	VLJ  EI BO	enduser	2020-12-07 18:23:46
101452	Services	\N	VLJ  Store	enduser	2020-12-07 18:23:46
101453	Vishal	\N	More	enduser	2020-12-07 18:23:46
101454	Hitesh	\N	Tamore	enduser	2020-12-07 18:23:46
101455	Jayesh	\N	Khune	enduser	2020-12-07 18:23:46
101456	Aditi	\N	Talewar	enduser	2020-12-07 18:23:46
101457	Harshada	\N	Joshi	enduser	2020-12-07 18:23:46
101458	Umesh	\N	Dhapre	enduser	2020-12-07 18:23:46
101459	Rahul	\N	Patil	enduser	2020-12-07 18:23:46
101460	JinnyM	\N	Joseph	enduser	2020-12-07 18:23:46
101461	Shrishail	\N	Hiratot	enduser	2020-12-07 18:23:46
101462	Prashant	\N	Patil	enduser	2020-12-07 18:23:46
101463	Mayuresh	\N	Kumbhar	enduser	2020-12-07 18:23:46
101464	Muthukrishnan	\N	CV	enduser	2020-12-07 18:23:46
101465	Amruta	\N	Deshpande	enduser	2020-12-07 18:23:46
101466	Prateek	\N	Prasoon	enduser	2020-12-07 18:23:46
101467	Pranjul	\N	Tyagi	enduser	2020-12-07 18:23:46
101468	Pavan	\N	Tikate	enduser	2020-12-07 18:23:46
101469	Shubham	\N	Patil	enduser	2020-12-07 18:23:46
101470	Akash	\N	Botre	enduser	2020-12-07 18:23:46
101471	Kapil	\N	Kanunje	enduser	2020-12-07 18:23:46
101472	Ganesh	\N	Bhokare	enduser	2020-12-07 18:23:46
101473	Anil	\N	Kandale	enduser	2020-12-07 18:23:46
101474	Khaladkar	\N	Vilas	enduser	2020-12-07 18:23:46
101475	Bibek	\N	Bhola	enduser	2020-12-07 18:23:46
101476	Pankaj	\N	Jadhav	enduser	2020-12-07 18:23:46
101477	Suraj	\N	Pawar	enduser	2020-12-07 18:23:46
101478	Manas	\N	Das	enduser	2020-12-07 18:23:46
101479	Amey	\N	Dongare	enduser	2020-12-07 18:23:46
101480	Mangesh	\N	Mahamuni	enduser	2020-12-07 18:23:46
101481	Vishal	\N	Naikwade	enduser	2020-12-07 18:23:46
101482	Boiler	\N	Guest	enduser	2020-12-07 18:23:46
101483	Bepsy	\N	Dumasia	enduser	2020-12-07 18:23:46
101484	test	\N	\N	enduser	2020-12-07 18:23:46
101485	Mukul	\N	Sheth	enduser	2020-12-07 18:23:46
101486	Shreyas	\N	Deshpande	enduser	2020-12-07 18:23:46
101487	Kumaresan	\N	Subbiramani	enduser	2020-12-07 18:23:46
101488	Yash	\N	Chavan	enduser	2020-12-07 18:23:46
101489	Rahul	\N	Panicker	enduser	2020-12-07 18:23:46
101490	Paritosh	\N	Kumar	enduser	2020-12-07 18:23:46
101491	Shrishal	\N	Hirthot	enduser	2020-12-07 18:23:46
101492	Omkar	\N	Dhane	enduser	2020-12-07 18:23:46
101493	Rishabh	\N	Bhapkar	enduser	2020-12-07 18:23:46
101494	QA	\N	Trainee	enduser	2020-12-07 18:23:46
101495	Prajyot	\N	Pomannawar	enduser	2020-12-07 18:23:46
101496	Nikhil	\N	Shingade	enduser	2020-12-07 18:23:46
101497	Sumit	\N	Bhosale	enduser	2020-12-07 18:23:46
101498	Pushkaraj	\N	Mahadwar	enduser	2020-12-07 18:23:46
101499	Pankaj	\N	Pawar	enduser	2020-12-07 18:23:46
101500	Arun	\N	Ravindranath	enduser	2020-12-07 18:23:46
101501	Mosuganti	\N	Subhakar	enduser	2020-12-07 18:23:46
101502	Sneha	\N	Mahalle	enduser	2020-12-07 18:23:46
101503	Prachita	\N	Mane	enduser	2020-12-07 18:23:46
101504	Sagar	\N	Nakhate	enduser	2020-12-07 18:23:46
101505	Anilkumar	\N	Jha	enduser	2020-12-07 18:23:46
101506	Abhijit	\N	Latthe	enduser	2020-12-07 18:23:46
101507	Kiran	\N	Barathe	enduser	2020-12-07 18:23:46
101508	Vasudev	\N	Dange	enduser	2020-12-07 18:23:46
101509	Abhijeet	\N	Keskar	enduser	2020-12-07 18:23:46
101510	Tkiiservices	\N	RiljsezHse	enduser	2020-12-07 18:23:46
101511	Tkiiservices	\N	RiljsezEi	enduser	2020-12-07 18:23:46
101512	Sayali	\N	Patil	enduser	2020-12-07 18:23:46
101513	Ganesh	\N	Patil	enduser	2020-12-07 18:23:46
101514	Avinash	\N	Patil	enduser	2020-12-07 18:23:46
101515	Sanagala	\N	Mahesh	enduser	2020-12-07 18:23:46
101516	Abhishek	\N	Ghutukade	enduser	2020-12-07 18:23:46
101517	Bahubali	\N	Narasagond	enduser	2020-12-07 18:23:46
101518	Amol	\N	Khot	enduser	2020-12-07 18:23:46
101519	Amol	\N	Ambhore	enduser	2020-12-07 18:23:46
101520	Oudesh	\N	Didwania	enduser	2020-12-07 18:23:46
101521	Naveen	\N	Gupta	enduser	2020-12-07 18:23:46
101522	Shubham	\N	Jadhav	enduser	2020-12-07 18:23:46
101523	Bappa	\N	Karmakar	enduser	2020-12-07 18:23:46
101524	Vidyadhar	\N	Konkeri	enduser	2020-12-07 18:23:46
101525	Tamal	\N	Das	enduser	2020-12-07 18:23:46
101526	Rabindranath	\N	Basuroy	enduser	2020-12-07 18:23:46
101527	Purnendu	\N	Mohanty	enduser	2020-12-07 18:23:46
101528	Jayashri	\N	Naikawadi	enduser	2020-12-07 18:23:46
101529	Rahul	\N	Parab	enduser	2020-12-07 18:23:46
101530	Nagraj	\N	Kamat	enduser	2020-12-07 18:23:46
101531	Ujjwal	\N	Zamindar	enduser	2020-12-07 18:23:46
101532	Ashish	\N	Kinkar	enduser	2020-12-07 18:23:46
101533	Vinay	\N	Boddu	enduser	2020-12-07 18:23:46
101534	Aniket	\N	Nale	enduser	2020-12-07 18:23:46
101535	Suresh	\N	Agasti	enduser	2020-12-07 18:23:46
101536	Shrikant	\N	Gudda	enduser	2020-12-07 18:23:46
101537	Nilesh	\N	Dhembare	enduser	2020-12-07 18:23:46
101538	Suyash	\N	Sharma 	enduser	2020-12-07 18:23:46
101539	Vijay	\N	Bhave	enduser	2020-12-07 18:23:46
101540	Hariprasanna	\N	B	enduser	2020-12-07 18:23:46
101541	Vinit	\N	Jagnade	enduser	2020-12-07 18:23:46
101542	Gaurav	\N	Sancheti	enduser	2020-12-07 18:23:46
101543	Sagar	\N	Randive	enduser	2020-12-07 18:23:46
101544	Pravakar	\N	Chakraborty	enduser	2020-12-07 18:23:46
101545	Yuvraj	\N	Patil	enduser	2020-12-07 18:23:46
101546	Nilesh	\N	Londhe	enduser	2020-12-07 18:23:46
101547	Jacob	\N	David	enduser	2020-12-07 18:23:46
101548	Digambar	\N	Jadhav	enduser	2020-12-07 18:23:46
101549	Vishwas	\N	Hulle	enduser	2020-12-07 18:23:46
101550	Koushik	\N	Chatterjee	enduser	2020-12-07 18:23:46
101551	Mohammad	\N	Niyaz	enduser	2020-12-07 18:23:46
101552	Keyur	\N	Khole	enduser	2020-12-07 18:23:46
101553	Amar	\N	Fartare	enduser	2020-12-07 18:23:46
101554	Manish	\N	Kumar	enduser	2020-12-07 18:23:46
101555	Sagar	\N	Shrivastav	enduser	2020-12-07 18:23:46
101556	Pravin	\N	Jagtap	enduser	2020-12-07 18:23:46
101557	Om	\N	Prakash	enduser	2020-12-07 18:23:46
101558	Swapnil	\N	Jagtap	enduser	2020-12-07 18:23:46
101559	Gaurav	\N	Badhe	enduser	2020-12-07 18:23:46
101560	Abhay	\N	Thampy	enduser	2020-12-07 18:23:46
101561	Shailesh	\N	Umap	enduser	2020-12-07 18:23:46
101562	Ashwini	\N	Patil	enduser	2020-12-07 18:23:46
101563	Mohammad	\N	Imrankhan	enduser	2020-12-07 18:23:46
101564	Prasad	\N	Asabe	enduser	2020-12-07 18:23:46
101565	Nilesh	\N	Kesarkar	enduser	2020-12-07 18:23:46
101566	Vutla	\N	Prakash	enduser	2020-12-07 18:23:46
101567	Sudhir	\N	Balghare	enduser	2020-12-07 18:23:46
101568	Gaurav	\N	Hasbe	enduser	2020-12-07 18:23:46
101569	Saurabh	\N	Jadhav	enduser	2020-12-07 18:23:46
101570	Mahesh	\N	Pawar	enduser	2020-12-07 18:23:46
101571	Sajal	\N	Akhuli	enduser	2020-12-07 18:23:46
101572	Nusrat	\N	Anzar	enduser	2020-12-07 18:23:46
101573	Pramod	\N	Sawant	enduser	2020-12-07 18:23:46
101574	Payal	\N	Pardeshi	enduser	2020-12-07 18:23:46
101575	PM	\N	PRISM	enduser	2020-12-07 18:23:46
101576	Bodakunta	\N	Kishore	enduser	2020-12-07 18:23:46
101577	Shivam	\N	Sudarshan	enduser	2020-12-07 18:23:46
101578	Dhiresh	\N	Kumar	enduser	2020-12-07 18:23:46
101579	Indrashekhar	\N	Sarkar	enduser	2020-12-07 18:23:46
101580	Pankaj	\N	Mali	enduser	2020-12-07 18:23:46
101581	Moumita	\N	Ghosh	enduser	2020-12-07 18:23:46
101582	Pradnyesh	\N	Bagade	enduser	2020-12-07 18:23:46
101583	Sagar	\N	Omble	enduser	2020-12-07 18:23:46
101584	Sonu	\N	Kanthed	enduser	2020-12-07 18:23:46
101585	Machavarapu	\N	Subhash	enduser	2020-12-07 18:23:46
101586	Nandkishor	\N	Matlabe	enduser	2020-12-07 18:23:46
101587	Garud	\N	Harshal	enduser	2020-12-07 18:23:46
101588	Suchita	\N	Janjire	enduser	2020-12-07 18:23:46
101589	Sangramsinh	\N	Bhosale	enduser	2020-12-07 18:23:46
101590	Vikrant	\N	Luktuke	enduser	2020-12-07 18:23:46
101591	Atharva	\N	Gholap	enduser	2020-12-07 18:23:46
101592	Rushikesh	\N	Pawar	enduser	2020-12-07 18:23:46
101593	Vishal	\N	Pawar	enduser	2020-12-07 18:23:46
101594	Mandar	\N	Pujari	enduser	2020-12-07 18:23:46
101595	Deoyani	\N	Tajane	enduser	2020-12-07 18:23:46
101596	Shubhangi	\N	Vikhe	enduser	2020-12-07 18:23:46
101597	Tanmay	\N	Pharande	enduser	2020-12-07 18:23:46
101598	Tanaji	\N	Sutar	enduser	2020-12-07 18:23:46
101599	Prasad	\N	Deshpande	enduser	2020-12-07 18:23:46
101600	Swapnil	\N	Pilare	enduser	2020-12-07 18:23:46
101601	Sarang	\N	Chaudhari	enduser	2020-12-07 18:23:46
101602	Panchatcharam	\N	Rajaram	enduser	2020-12-07 18:23:46
101603	Bharat	\N	Surase	enduser	2020-12-07 18:23:46
101604	Shivshankar	\N	Patil	enduser	2020-12-07 18:23:46
101605	Subrata	\N	Biswas	enduser	2020-12-07 18:23:46
101606	Rohit	\N	Gupta	enduser	2020-12-07 18:23:46
101607	Kiran	\N	Chaudhary	enduser	2020-12-07 18:23:46
101608	Sumant	\N	Thakur	enduser	2020-12-07 18:23:46
101609	Abhay	\N	Ghiranikar	enduser	2020-12-07 18:23:46
101610	Rahul	\N	Verma	enduser	2020-12-07 18:23:46
101611	Printing	\N	Test	enduser	2020-12-07 18:23:46
101612	Sagar	\N	Talpe	enduser	2020-12-07 18:23:46
101613	Ankush	\N	Badgujar	enduser	2020-12-07 18:23:46
101614	Rahul	\N	Suryawanshi	enduser	2020-12-07 18:23:46
101615	Raghava	\N	Balliparthy	enduser	2020-12-07 18:23:46
101616	Tushanth	\N	Nair	enduser	2020-12-07 18:23:46
101617	Vishal	\N	Chauhan	enduser	2020-12-07 18:23:46
101618	Boddeti	\N	Achuth	enduser	2020-12-07 18:23:46
101619	Gopi	\N	Swamy	enduser	2020-12-07 18:23:46
101620	Bhushan	\N	Modgekar	enduser	2020-12-07 18:23:46
101621	Shanmukh	\N	Joshi	enduser	2020-12-07 18:23:46
101622	Jitendra	\N	Beri	enduser	2020-12-07 18:23:46
101623	Chaitali	\N	Chavan	enduser	2020-12-07 18:23:46
101624	Joydeb	\N	Santra	enduser	2020-12-07 18:23:46
101625	Sameer	\N	Mande	enduser	2020-12-07 18:23:46
101626	Tejas	\N	Sheth	enduser	2020-12-07 18:23:46
101627	Udayan	\N	Chakravorty	enduser	2020-12-07 18:23:46
101628	Mithun	\N	Patil	enduser	2020-12-07 18:23:46
101629	Amol	\N	Chaudhary	enduser	2020-12-07 18:23:46
101630	Sujit	\N	Ghosh	enduser	2020-12-07 18:23:46
101631	Eknath	\N	Kumavat	enduser	2020-12-07 18:23:46
101632	Vinod	\N	Gadkar	enduser	2020-12-07 18:23:46
101633	Nishat	\N	Zaman	enduser	2020-12-07 18:23:46
101634	Kacherlagadda	\N	Raju	enduser	2020-12-07 18:23:46
101635	Rachakonda	\N	Krishna	enduser	2020-12-07 18:23:46
101636	Vijay	\N	Yadav	enduser	2020-12-07 18:23:46
101637	Raghavendar	\N	Pathipati	enduser	2020-12-07 18:23:46
101638	Akash	\N	Biranje	enduser	2020-12-07 18:23:46
101639	Sourbh	\N	Satpute	enduser	2020-12-07 18:23:46
101640	Rajesh	\N	Dhara	enduser	2020-12-07 18:23:46
101641	Subhajit	\N	Paul	enduser	2020-12-07 18:23:46
101642	Dhiman	\N	Naskar	enduser	2020-12-07 18:23:46
101643	Vijay	\N	Soni	enduser	2020-12-07 18:23:46
101644	Omkesh	\N	Pandey	enduser	2020-12-07 18:23:46
101645	Alpesh	\N	Chauhan	enduser	2020-12-07 18:23:46
101646	Pradeep	\N	Prajapati	enduser	2020-12-07 18:23:46
101647	Naresh	\N	Maan	enduser	2020-12-07 18:23:46
101648	Pranav	\N	Ukkadgaonkar	enduser	2020-12-07 18:23:46
101649	Anmol	\N	Sagare	enduser	2020-12-07 18:23:46
101650	Prasad	\N	Kare	enduser	2020-12-07 18:23:46
101651	PM	\N	Lntpower-FGD	enduser	2020-12-07 18:23:46
101652	Apurv	\N	Sahasrabudhe	enduser	2020-12-07 18:23:46
101653	Shahrukh	\N	Sheikh	enduser	2020-12-07 18:23:46
101654	Saffiullah	\N	Kadarbatcha	enduser	2020-12-07 18:23:46
101655	Sivakumar	\N	Velmurugan	enduser	2020-12-07 18:23:46
101656	Sureshkumar	\N	Sasikumar	enduser	2020-12-07 18:23:46
101657	Ulhas	\N	Patil	enduser	2020-12-07 18:23:46
101658	Civil	\N	Maintenace	enduser	2020-12-07 18:23:46
101659	Ashok	\N	Londhe	enduser	2020-12-07 18:23:46
101660	Nikhil	\N	Gupta	enduser	2020-12-07 18:23:46
101661	Sanjay	\N	Nakade	enduser	2020-12-07 18:23:46
101662	Alok	\N	Jagannath	enduser	2020-12-07 18:23:46
101663	Sanchita	\N	Pawar	enduser	2020-12-07 18:23:46
101664	Digamber	\N	Sinha	enduser	2020-12-07 18:23:46
101665	Rupesh	\N	Singh	enduser	2020-12-07 18:23:46
101666	Kishore	\N	Behera	enduser	2020-12-07 18:23:46
101667	Mohammed	\N	Akram	enduser	2020-12-07 18:23:46
101668	Shamsheer	\N	Ansari	enduser	2020-12-07 18:23:46
101669	Dastagir	\N	Alam	enduser	2020-12-07 18:23:46
101670	Tapankumar	\N	Desai	enduser	2020-12-07 18:23:46
101671	Tanujit	\N	Biswas	enduser	2020-12-07 18:23:46
101672	Pankaj	\N	Kanoujiya	enduser	2020-12-07 18:23:46
101673	Mukesh	\N	Dhote	enduser	2020-12-07 18:23:46
101674	Riddhi	\N	Jha	enduser	2020-12-07 18:23:46
101675	Aurobhil	\N	Ghosh	enduser	2020-12-07 18:23:46
101676	Lokendra Singh	\N	Chouhan	enduser	2020-12-07 18:23:46
101677	Deepak	\N	Gautam	enduser	2020-12-07 18:23:46
101678	Manas	\N	Dash	enduser	2020-12-07 18:23:46
101679	Nitesh	\N	Jha	enduser	2020-12-07 18:23:46
101680	Topesh	\N	Bisen	enduser	2020-12-07 18:23:46
101681	Virendra Kumar	\N	Bhargave	enduser	2020-12-07 18:23:46
101682	Vinay	\N	Ganta	enduser	2020-12-07 18:23:46
101683	Chintan	\N	Gajjar	enduser	2020-12-07 18:23:46
101684	Mrutyunjay	\N	Dash	enduser	2020-12-07 18:23:46
101685	Himanshu	\N	Bhatt	enduser	2020-12-07 18:23:46
101686	Toyaj	\N	Jangid	enduser	2020-12-07 18:23:46
101687	Sushil	\N	Kumar	enduser	2020-12-07 18:23:46
101688	Dharmendra	\N	Kumar	enduser	2020-12-07 18:23:46
101689	Nirmal	\N	Lenka	enduser	2020-12-07 18:23:46
101690	Jayapalan	\N	Karuna	enduser	2020-12-07 18:23:46
101691	Sanallal	\N	Kumar	enduser	2020-12-07 18:23:46
101692	Shyam	\N	Kollamparambil	enduser	2020-12-07 18:23:46
101693	Bhavin	\N	Ladva	enduser	2020-12-07 18:23:46
101694	Bikash	\N	Mahana	enduser	2020-12-07 18:23:46
101695	Mohd	\N	Khan	enduser	2020-12-07 18:23:46
101696	Abhay	\N	Mishra	enduser	2020-12-07 18:23:46
101697	Amit	\N	Kulkarni	enduser	2020-12-07 18:23:46
101698	Sudhakar	\N	Mani	enduser	2020-12-07 18:23:46
101699	Pawan	\N	Kumar	enduser	2020-12-07 18:23:46
101700	Komal	\N	Kashyap	enduser	2020-12-07 18:23:46
101701	Sudhir	\N	Kumar	enduser	2020-12-07 18:23:46
101702	Pritam	\N	Naik	enduser	2020-12-07 18:23:46
101703	Amit	\N	Mishra	enduser	2020-12-07 18:23:46
101704	Soumen	\N	Mondal	enduser	2020-12-07 18:23:46
101705	Topesh	\N	Nimsarkar	enduser	2020-12-07 18:23:46
101706	Amit	\N	Pandey	enduser	2020-12-07 18:23:46
101707	Dharamveer	\N	Pandey	enduser	2020-12-07 18:23:46
101708	Deepak	\N	Prajapat	enduser	2020-12-07 18:23:46
101709	Neelesh	\N	Pandey	enduser	2020-12-07 18:23:46
101710	Hansraj	\N	Parmar	enduser	2020-12-07 18:23:46
101711	Mahesh Kumar	\N	Pandey	enduser	2020-12-07 18:23:46
101712	Vikas	\N	Parihar	enduser	2020-12-07 18:23:46
101713	Shibasis	\N	Sahu	enduser	2020-12-07 18:23:46
101714	Subhranshu	\N	Pratihari	enduser	2020-12-07 18:23:46
101715	Mahashakti	\N	Singh	enduser	2020-12-07 18:23:46
101716	Dal Singar	\N	Prajapati	enduser	2020-12-07 18:23:46
101717	Jaydip	\N	Sathvara	enduser	2020-12-07 18:23:46
101718	Md.Noushad	\N	Rashid	enduser	2020-12-07 18:23:46
101719	Surajit	\N	Seal	enduser	2020-12-07 18:23:46
101720	Krushna	\N	Singh	enduser	2020-12-07 18:23:46
101721	Srikant	\N	Rout	enduser	2020-12-07 18:23:46
101722	Navin	\N	Sharma	enduser	2020-12-07 18:23:46
101723	Lokendra	\N	Rawat	enduser	2020-12-07 18:23:46
101724	Manjesh	\N	Rai	enduser	2020-12-07 18:23:46
101725	Satchidananda	\N	Rout	enduser	2020-12-07 18:23:46
101726	Dipankar	\N	Sahu	enduser	2020-12-07 18:23:46
101727	Anupam	\N	Singh	enduser	2020-12-07 18:23:46
101728	Akshaykumar	\N	Sankpal	enduser	2020-12-07 18:23:46
101729	Sujit	\N	Sahu	enduser	2020-12-07 18:23:46
101730	Mohamed	\N	Rasheed	enduser	2020-12-07 18:23:46
101731	Ravindra Singh	\N	Rathore	enduser	2020-12-07 18:23:46
101732	Poshendra	\N	Singh	enduser	2020-12-07 18:23:46
101733	Akhtar	\N	Tauheed	enduser	2020-12-07 18:23:46
101734	Manish	\N	Singh	enduser	2020-12-07 18:23:46
101735	Palendra	\N	Singh	enduser	2020-12-07 18:23:46
101736	Premkumar	\N	Thampi	enduser	2020-12-07 18:23:46
101737	Veerendra	\N	Tripathi	enduser	2020-12-07 18:23:46
101738	Alaguharihara	\N	Subramanian	enduser	2020-12-07 18:23:46
101739	Sumeet	\N	Verma	enduser	2020-12-07 18:23:46
101740	Dhirendra	\N	Singh	enduser	2020-12-07 18:23:46
101741	Kiran	\N	Suryawanshi	enduser	2020-12-07 18:23:46
101742	Bimlesh	\N	Tiwari	enduser	2020-12-07 18:23:46
101743	Pravin	\N	Upadhyay	enduser	2020-12-07 18:23:46
101744	Sudhir	\N	Tripathy	enduser	2020-12-07 18:23:46
101745	Kamalesh	\N	Yadav	enduser	2020-12-07 18:23:46
101746	Randhir	\N	Tiwari	enduser	2020-12-07 18:23:46
101747	Harshvardhan	\N	Sinha	enduser	2020-12-07 18:23:46
101748	Shailendra	\N	Chandra	enduser	2020-12-07 18:23:46
101749	Ashutosh	\N	Singh	enduser	2020-12-07 18:23:46
101750	Vijay	\N	Sodha	enduser	2020-12-07 18:23:46
101751	Rahul	\N	Soni	enduser	2020-12-07 18:23:46
101752	Ajaykumar	\N	Singh	enduser	2020-12-07 18:23:46
101753	Barinder	\N	Singh	enduser	2020-12-07 18:23:46
101754	Shiv	\N	Prajapati	enduser	2020-12-07 18:23:46
101755	Suraj	\N	Naik	enduser	2020-12-07 18:23:46
101756	Bhaveshkumar	\N	Patel	enduser	2020-12-07 18:23:46
101757	Narendra	\N	Rao	enduser	2020-12-07 18:23:46
101758	Shravan	\N	Tripathi	enduser	2020-12-07 18:23:46
101759	Akash	\N	Patel	enduser	2020-12-07 18:23:46
101760	Ashutosh	\N	Verma	enduser	2020-12-07 18:23:46
101761	Anuj	\N	Sharma	enduser	2020-12-07 18:23:46
101762	Raju	\N	Singh	enduser	2020-12-07 18:23:46
101763	Vivekvarma	\N	Manthena	enduser	2020-12-07 18:23:46
101764	Rahul	\N	Kurlikar	enduser	2020-12-07 18:23:46
101765	PMtkII	\N	Grasim.IR	enduser	2020-12-07 18:23:46
101766	Avinash	\N	Sharma	enduser	2020-12-07 18:23:46
101767	Nilesh	\N	Malviya	enduser	2020-12-07 18:23:46
101768	Vijay	\N	Rahangdale	enduser	2020-12-07 18:23:46
101769	Sanjaya	\N	Santi	enduser	2020-12-07 18:23:46
101770	Yogesh	\N	Ingale	enduser	2020-12-07 18:23:46
101771	Nitin	\N	Sharma	enduser	2020-12-07 18:23:46
101772	Malapura	\N	Basappa	enduser	2020-12-07 18:23:46
101773	Easwara	\N	Mandava	enduser	2020-12-07 18:23:46
101774	MdAbdul	\N	Rahim	enduser	2020-12-07 18:23:46
101775	Pravin	\N	Suryawanshi	enduser	2020-12-07 18:23:46
101776	Amaresh	\N	Dhall	enduser	2020-12-07 18:23:46
101777	Abhishaik	\N	Sharma	enduser	2020-12-07 18:23:46
101778	Chaitanya	\N	Shaligram	enduser	2020-12-07 18:23:46
101779	Nidhi	\N	Mohan	enduser	2020-12-07 18:23:46
101780	Isha	\N	Sathaye	enduser	2020-12-07 18:23:46
101781	Suraj	\N	Jangam	enduser	2020-12-07 18:23:46
101782	Nilesh	\N	Matale	enduser	2020-12-07 18:23:46
101783	Harshada	\N	Janorkar	enduser	2020-12-07 18:23:46
101784	Shoheb	\N	Malik	enduser	2020-12-07 18:23:46
101785	Sumit	\N	Jha	enduser	2020-12-07 18:23:46
101786	Thangathirumaran	\N	Viruthagiri	enduser	2020-12-07 18:23:46
101787	Bibin	\N	Kuniyil	enduser	2020-12-07 18:23:46
101788	Sreeraj	\N	Kurup	enduser	2020-12-07 18:23:46
101789	Akhilghosh	\N	Pillai	enduser	2020-12-07 18:23:46
101790	Mritunjay	\N	Singh	enduser	2020-12-07 18:23:46
101791	Prabakaran	\N	Paulsamy	enduser	2020-12-07 18:23:46
101792	Nayan	\N	Bajpaiee	enduser	2020-12-07 18:23:46
101793	Devendra	\N	Kumar	enduser	2020-12-07 18:23:46
101794	Mohsin	\N	Mulla	enduser	2020-12-07 18:23:46
101795	Komal	\N	Pimpale	enduser	2020-12-07 18:23:46
101796	Prajakta	\N	Padwal	enduser	2020-12-07 18:23:46
101797	Arun	\N	Yadav	enduser	2020-12-07 18:23:46
101798	Vivek	\N	Dorke	enduser	2020-12-07 18:23:46
101799	Ritesh	\N	Jamwal	enduser	2020-12-07 18:23:46
101800	Subrata	\N	Dutta	enduser	2020-12-07 18:23:46
101801	Prashant	\N	Vankar	enduser	2020-12-07 18:23:46
101802	Rohit	\N	Maidamwar	enduser	2020-12-07 18:23:46
101803	Sharon	\N	Sheejo	enduser	2020-12-07 18:23:46
101804	Pruthviraj	\N	Nimbalkar	enduser	2020-12-07 18:23:46
101805	Venkat	\N	Rao 	enduser	2020-12-07 18:23:46
101806	Venkat	\N	Rao	enduser	2020-12-07 18:23:46
101807	Mahesh	\N	Mane	enduser	2020-12-07 18:23:46
101808	Satish	\N	Nautiyal	enduser	2020-12-07 18:23:46
101809	Apurva	\N	Zaware	enduser	2020-12-07 18:23:46
101810	Samruddhi	\N	Moze	enduser	2020-12-07 18:23:46
101811	Amit	\N	Sharma	enduser	2020-12-07 18:23:46
101812	Anushri	\N	Deulkar	enduser	2020-12-07 18:23:46
101813	Harshad	\N	Patil	enduser	2020-12-07 18:23:46
101814	Vijendra	\N	Ingle	enduser	2020-12-07 18:23:46
101815	Tirtharaj	\N	Panda	enduser	2020-12-07 18:23:46
101816	Jitendra	\N	Nartam	enduser	2020-12-07 18:23:46
101817	sanjay	\N	maji	enduser	2020-12-07 18:23:46
101818	rafiqul	\N	middya	enduser	2020-12-07 18:23:46
101819	ghanshyam	\N	sahu	enduser	2020-12-07 18:23:46
101820	bhajaram	\N	behera	enduser	2020-12-07 18:23:46
101821	sourabhkumar	\N	thakur	enduser	2020-12-07 18:23:46
101822	shyam	\N	shobhit	enduser	2020-12-07 18:23:46
101823	debraj	\N	bandyopadhyay	enduser	2020-12-07 18:23:46
101824	pinaki	\N	pattnaik	enduser	2020-12-07 18:23:46
101825	dasarathi	\N	gouda	enduser	2020-12-07 18:23:46
101826	niranjan	\N	ping	enduser	2020-12-07 18:23:46
101827	md	\N	nazir	enduser	2020-12-07 18:23:46
101828	vikas	\N	kumar	enduser	2020-12-07 18:23:46
101829	koushik	\N	dasgupta	enduser	2020-12-07 18:23:46
101830	anand	\N	sagar	enduser	2020-12-07 18:23:46
101831	ravi	\N	shankar	enduser	2020-12-07 18:23:46
101832	subrat	\N	pattnaik	enduser	2020-12-07 18:23:46
101833	s	\N	santhanam	enduser	2020-12-07 18:23:46
101834	prateek	\N	singh	enduser	2020-12-07 18:23:46
101835	sukumar	\N	patel	enduser	2020-12-07 18:23:46
101836	abhishek	\N	kumar	enduser	2020-12-07 18:23:46
101837	bhanu	\N	pratap	enduser	2020-12-07 18:23:46
101838	sourabh	\N	dosi	enduser	2020-12-07 18:23:46
101839	karthik	\N	sethuraman,	enduser	2020-12-07 18:23:46
101840	baswajit	\N	sahu	enduser	2020-12-07 18:23:46
101841	k	\N	malaiyarasan	enduser	2020-12-07 18:23:46
101842	vikash	\N	anand	enduser	2020-12-07 18:23:46
101843	sivananthan	\N	dakshinamoorthy	enduser	2020-12-07 18:23:46
101844	suresh	\N	sundaresan	enduser	2020-12-07 18:23:46
101845	sirshendu	\N	kar	enduser	2020-12-07 18:23:46
101846	kishore	\N	ippili	enduser	2020-12-07 18:23:46
101847	victorsaloman	\N	arulraj	enduser	2020-12-07 18:23:46
101848	manoj kumar	\N	muni	enduser	2020-12-07 18:23:46
101849	sukumar	\N	murugaiya	enduser	2020-12-07 18:23:46
101850	dharmpal	\N	kumar	enduser	2020-12-07 18:23:46
101851	laxminarayan	\N	bhargav	enduser	2020-12-07 18:23:46
101852	arunkumar	\N	pillai	enduser	2020-12-07 18:23:46
101853	p	\N	nallaperumal	enduser	2020-12-07 18:23:46
101854	mariappan	\N	murugan	enduser	2020-12-07 18:23:46
101855	vikesh	\N	kumar	enduser	2020-12-07 18:23:46
101856	md	\N	ashfaque	enduser	2020-12-07 18:23:46
101857	ananda	\N	ghosh	enduser	2020-12-07 18:23:46
101858	kundan	\N	kumar	enduser	2020-12-07 18:23:46
101859	dharmadas	\N	jadhav	enduser	2020-12-07 18:23:46
101860	ishtiyaque	\N	ahmad	enduser	2020-12-07 18:23:46
101861	sanket	\N	vishwakarma	enduser	2020-12-07 18:23:46
101862	deepak	\N	kumar	enduser	2020-12-07 18:23:46
101863	vikram	\N	saini	enduser	2020-12-07 18:23:46
101864	muhilan	\N	thennarasu	enduser	2020-12-07 18:23:46
101865	mujeeb	\N	khan	enduser	2020-12-07 18:23:46
101866	siddharth	\N	rao	enduser	2020-12-07 18:23:46
101867	ganesan	\N	gnanaprakasam	enduser	2020-12-07 18:23:46
101868	a	\N	kannan	enduser	2020-12-07 18:23:46
101869	gangadhar	\N	ghag	enduser	2020-12-07 18:23:46
101870	asif	\N	mansuri	enduser	2020-12-07 18:23:46
101871	aman	\N	verma	enduser	2020-12-07 18:23:46
101872	Satyajeet	\N	Deshmukh	enduser	2020-12-07 18:23:46
101873	soumya	\N	venkatesh	enduser	2020-12-07 18:23:46
101874	Rajan	\N	Chaudhary	enduser	2020-12-07 18:23:46
101875	Pratik	\N	Wategave	enduser	2020-12-07 18:23:46
101876	Murtuza	\N	Contractor	enduser	2020-12-07 18:23:46
101877	Tejas	\N	Kondhalkar	enduser	2020-12-07 18:23:46
101878	Swapnil	\N	Sonawane	enduser	2020-12-07 18:23:46
101879	Anand	\N	Mishra	enduser	2020-12-07 18:23:46
101880	Nikhil	\N	Marwaha	enduser	2020-12-07 18:23:46
101881	Amey	\N	Birje	enduser	2020-12-07 18:23:46
101882	Chinmay	\N	Khedkar	enduser	2020-12-07 18:23:46
101883	Neha	\N	Bhosale	enduser	2020-12-07 18:23:46
101884	Vidyadhar	\N	Shinde	enduser	2020-12-07 18:23:46
101885	Anish	\N	Shiralkar	enduser	2020-12-07 18:23:46
101886	Ameya	\N	Jaydeokar	enduser	2020-12-07 18:23:46
101887	Priyanshu	\N	Agarwal	enduser	2020-12-07 18:23:46
101888	Manisha	\N	Karunakaran	enduser	2020-12-07 18:23:46
101889	Anand	\N	Naik	enduser	2020-12-07 18:23:46
101890	Vivek	\N	Jadhav	enduser	2020-12-07 18:23:46
101891	Saurabh	\N	Shrivastav	enduser	2020-12-07 18:23:46
101892	Dipankar	\N	Majumdar	enduser	2020-12-07 18:23:46
101893	Shivalingappa	\N	Anavatter	enduser	2020-12-07 18:23:46
101894	Migration	\N	tkii	enduser	2020-12-07 18:23:46
101895	Manas	\N	Chowdhury	enduser	2020-12-07 18:23:46
101896	Vishnu	\N	Varier	enduser	2020-12-07 18:23:46
101897	Vishal	\N	Somani	enduser	2020-12-07 18:23:46
101898	Rahul	\N	Panicker	enduser	2020-12-07 18:23:46
101899	Nitesh	\N	Kumar	enduser	2020-12-07 18:23:46
101900	Harish	\N	Suthar	enduser	2020-12-07 18:23:46
101901	Manisha	\N	Poojary	enduser	2020-12-07 18:23:46
101902	tkii	\N	system	enduser	2020-12-07 18:23:46
101903	Hrushikesh	\N	Deshmukh	enduser	2020-12-07 18:23:46
101904	Jayant	\N	Varat	enduser	2020-12-07 18:23:46
101905	Anup	\N	Kulkarni	enduser	2020-12-07 18:23:46
101906	Deepak	\N	Kadam	enduser	2020-12-07 18:23:46
101907	Rohit	\N	Raj	enduser	2020-12-07 18:23:46
101908	Rakesh	\N	Barik	enduser	2020-12-07 18:23:46
101909	Sourabh	\N	Selukar	enduser	2020-12-07 18:23:46
101910	Jyoti	\N	Agrawal	enduser	2020-12-07 18:23:46
101911	Dulal	\N	Rakshit	enduser	2020-12-07 18:23:46
101912	Sunil	\N	Acharya	enduser	2020-12-07 18:23:46
101913	Kamlesh	\N	Padiyar	enduser	2020-12-07 18:23:46
101914	Vipin	\N	Bighane	enduser	2020-12-07 18:23:46
101915	Amit	\N	Jadhav	enduser	2020-12-07 18:23:46
101916	Pramatma	\N	Prasad	enduser	2020-12-07 18:23:46
101917	Nandkumar	\N	Shinde	enduser	2020-12-07 18:23:46
101918	Rajshekhar	\N	Titar	enduser	2020-12-07 18:23:46
101919	Udayan	\N	Pawar	enduser	2020-12-07 18:23:46
101920	Vagili	\N	Sagar	enduser	2020-12-07 18:23:46
101921	Abhijeet	\N	Madane	enduser	2020-12-07 18:23:46
101922	Mayuresh	\N	Vaze	enduser	2020-12-07 18:23:46
101923	Guest	\N	tkii	enduser	2020-12-07 18:23:46
101924	Sachin	\N	Kothawade	enduser	2020-12-07 18:23:46
101925	Sanchit	\N	Agrawal	enduser	2020-12-07 18:23:46
101926	Sushant	\N	Pawar	enduser	2020-12-07 18:23:46
101927	Munjuluri	\N	Srinivas	enduser	2020-12-07 18:23:46
101928	Atul	\N	Mane	enduser	2020-12-07 18:23:46
101929	Saurabh	\N	Kulkarni	enduser	2020-12-07 18:23:46
101930	Sarvesh	\N	Saxena	enduser	2020-12-07 18:23:46
101931	Danish	\N	Mulla	enduser	2020-12-07 18:23:46
101932	Suresh	\N	Kumar	enduser	2020-12-07 18:23:46
101933	Busini	\N	Thrilok	enduser	2020-12-07 18:23:46
101934	Anil	\N	Kalal	enduser	2020-12-07 18:23:46
101935	Praveen	\N	Kumar	enduser	2020-12-07 18:23:46
101936	Mohanish	\N	Waghela	enduser	2020-12-07 18:23:46
101937	Sachin	\N	Dange	enduser	2020-12-07 18:23:46
101938	Abhishek	\N	Kumar	enduser	2020-12-07 18:23:46
101939	Santoshkumar	\N	Sanadi	enduser	2020-12-07 18:23:46
101940	Deepak	\N	Patil	enduser	2020-12-07 18:23:46
101941	Amruta	\N	Dongare	enduser	2020-12-07 18:23:46
101942	Abhijeet	\N	Dhavale	enduser	2020-12-07 18:23:46
101943	Nitin	\N	Pawar	enduser	2020-12-07 18:23:46
101944	Manoj	\N	Chasta	enduser	2020-12-07 18:23:46
101945	dinesh	\N	krishnan	enduser	2020-12-07 18:23:46
101946	Narendra	\N	Joshi	enduser	2020-12-07 18:23:46
101947	Prodipto	\N	Ghosh	enduser	2020-12-07 18:23:46
101948	Dev	\N	Pandey	enduser	2020-12-07 18:23:46
101949	Arbind	\N	Prajapati	enduser	2020-12-07 18:23:46
101950	Shivang	\N	Gaur	enduser	2020-12-07 18:23:46
101951	Poonam	\N	Borate	enduser	2020-12-07 18:23:46
101952	Satish	\N	Sawase	enduser	2020-12-07 18:23:46
101953	Dhananjay	\N	Sonawane	enduser	2020-12-07 18:23:46
101954	Suraj	\N	Rane	enduser	2020-12-07 18:23:46
101955	Meher Prakash	\N	Nori	enduser	2020-12-07 18:23:46
101956	Akancha	\N	Sonkar	enduser	2020-12-07 18:23:46
101957	Santosh	\N	Singh	enduser	2020-12-07 18:23:46
101958	Mithileshh	\N	Reddy	enduser	2020-12-07 18:23:46
101959	Pragyan	\N	Pathak	enduser	2020-12-07 18:23:46
101960	Nitish	\N	Bondre	enduser	2020-12-07 18:23:46
101961	Sunil	\N	Singh	enduser	2020-12-07 18:23:46
101962	Riken	\N	Desai	enduser	2020-12-07 18:23:46
101963	Renjith	\N	Rama Varma	enduser	2020-12-07 18:23:46
101964	Amit	\N	Yadav	enduser	2020-12-07 18:23:46
101965	Mahipatsinh	\N	Chauhan	enduser	2020-12-07 18:23:46
101966	Yatendra	\N	Kumar	enduser	2020-12-07 18:23:46
101967	Pradeep	\N	Pathak	enduser	2020-12-07 18:23:46
101968	Darshankumar	\N	Prajapati	enduser	2020-12-07 18:23:46
101969	Yogendra	\N	Pandey	enduser	2020-12-07 18:23:46
101970	Debjyoti	\N	Haldar	enduser	2020-12-07 18:23:46
101971	Vivek	\N	Kumar	enduser	2020-12-07 18:23:46
101972	Arvind	\N	Kumar	enduser	2020-12-07 18:23:46
101973	M	\N	Ananthakrishnan	enduser	2020-12-07 18:23:46
101974	Rajamani	\N	Venkataramani	enduser	2020-12-07 18:23:46
101975	Harsh	\N	Rathod	enduser	2020-12-07 18:23:46
101976	Manish	\N	Tiwari	enduser	2020-12-07 18:23:46
101977	Pankaj	\N	Pandey	enduser	2020-12-07 18:23:46
101978	Sachin	\N	Jain	enduser	2020-12-07 18:23:46
101979	Pratap	\N	Rout	enduser	2020-12-07 18:23:46
101980	Shubham	\N	Tiwari	enduser	2020-12-07 18:23:46
101981	Soumya	\N	Routh	enduser	2020-12-07 18:23:46
101982	Ratnesh	\N	Kaushik	enduser	2020-12-07 18:23:46
101983	Kishore	\N	Mohanty	enduser	2020-12-07 18:23:46
101984	Rishi	\N	Dwivedi	enduser	2020-12-07 18:23:46
101985	Ayush	\N	Shukla	enduser	2020-12-07 18:23:46
101986	Gaurav	\N	Dhanre	enduser	2020-12-07 18:23:46
101987	Praveen	\N	Gupta	enduser	2020-12-07 18:23:46
101988	Rajendra	\N	Harijan	enduser	2020-12-07 18:23:46
101989	Dharmendra	\N	Mewade	enduser	2020-12-07 18:23:46
101990	Gaurav	\N	Tiwari	enduser	2020-12-07 18:23:46
101991	Pradeep	\N	Kumar	enduser	2020-12-07 18:23:46
101992	Chandra	\N	Pandey	enduser	2020-12-07 18:23:46
101993	Nishant	\N	Choudhary	enduser	2020-12-07 18:23:46
101994	Vivek	\N	Singh	enduser	2020-12-07 18:23:46
101995	Mithun	\N	Ghosh	enduser	2020-12-07 18:23:46
101996	Chirag	\N	Jadav	enduser	2020-12-07 18:23:46
101997	Vijay	\N	Sharma	enduser	2020-12-07 18:23:46
101998	Veerendra	\N	Sahu	enduser	2020-12-07 18:23:46
101999	Shubham	\N	Dubey	enduser	2020-12-07 18:23:46
102000	Vinay	\N	Kumar	enduser	2020-12-07 18:23:46
102001	Pradeep	\N	Totadi	enduser	2020-12-07 18:23:46
102002	Arup	\N	Das	enduser	2020-12-07 18:23:46
102003	Sachin	\N	Khobragade	enduser	2020-12-07 18:23:46
102004	SushilKumar	\N	Singh	enduser	2020-12-07 18:23:46
102005	Debasis	\N	Patra	enduser	2020-12-07 18:23:46
102006	Abhishek	\N	Richhariya	enduser	2020-12-07 18:23:46
102007	Yogesh	\N	Pandit	enduser	2020-12-07 18:23:46
102008	Jeeban	\N	Mahanayak	enduser	2020-12-07 18:23:46
102009	VivekSingh	\N	Yadav	enduser	2020-12-07 18:23:46
102010	Reetesh	\N	Singh	enduser	2020-12-07 18:23:46
102011	Neeraj	\N	Shriwas	enduser	2020-12-07 18:23:46
102012	A	\N	Rajesh	enduser	2020-12-07 18:23:46
102013	Alkesh	\N	Upadhyay	enduser	2020-12-07 18:23:46
102014	Ajeet	\N	Singh	enduser	2020-12-07 18:23:46
102015	Shiv	\N	Singh	enduser	2020-12-07 18:23:46
102016	Sultan	\N	Ali	enduser	2020-12-07 18:23:46
102017	Ramdas	\N	Prajapati	enduser	2020-12-07 18:23:46
102018	DevendraSingh	\N	Yadav	enduser	2020-12-07 18:23:46
102019	Ved	\N	Sakwar	enduser	2020-12-07 18:23:46
102020	Santosh	\N	Singh	enduser	2020-12-07 18:23:46
102021	Vrejendra	\N	Kourav	enduser	2020-12-07 18:23:46
102022	Mohan	\N	Natarajan	enduser	2020-12-07 18:23:46
102023	Kalidasu	\N	Saibabu	enduser	2020-12-07 18:23:46
102024	Rajesh	\N	Mohapatra	enduser	2020-12-07 18:23:46
102025	Harish	\N	Suthar	enduser	2020-12-07 18:23:46
102026	Nitesh	\N	Kumar	enduser	2020-12-07 18:23:46
102027	Rangnath	\N	Singh	enduser	2020-12-07 18:23:46
102028	T	\N	Sathiskumar	enduser	2020-12-07 18:23:46
102029	Jugal	\N	Nayak	enduser	2020-12-07 18:23:46
102030	Sushil	\N	Tiwari	enduser	2020-12-07 18:23:46
102031	Rahul	\N	Panicker	enduser	2020-12-07 18:23:46
102032	Mohmmad	\N	Ansari	enduser	2020-12-07 18:23:46
102033	AtulKumar	\N	Shivhare	enduser	2020-12-07 18:23:46
102034	Rohit	\N	Kumar	enduser	2020-12-07 18:23:46
102035	Ashish	\N	Choubey	enduser	2020-12-07 18:23:46
102036	Khushhal	\N	Tomar	enduser	2020-12-07 18:23:46
102037	Srinivasarao	\N	Gedda	enduser	2020-12-07 18:23:46
102038	Vivek	\N	Kumar	enduser	2020-12-07 18:23:46
102039	Pareekshit	\N	Katwal	enduser	2020-12-07 18:23:46
102040	Mrinal	\N	Deyati	enduser	2020-12-07 18:23:46
102041	Abhinav	\N	Singh	enduser	2020-12-07 18:23:46
102042	Navdeep	\N	Chandel	enduser	2020-12-07 18:23:46
102044	tkIIEMCHP	\N	HPL	enduser	2020-12-07 18:23:46
102045	PM	\N	DangoteGhana	enduser	2020-12-07 18:23:46
102046	Prasad	\N	Gumati	enduser	2020-12-07 18:23:46
102047	Vaibhav	\N	More	enduser	2020-12-07 18:23:46
102048	Pankaj	\N	Garg	enduser	2020-12-07 18:23:46
102049	Sanjeev	\N	Tiwari	enduser	2020-12-07 18:23:46
102050	tkII	\N	PrintScan	enduser	2020-12-07 18:23:46
102051	Lakshmita	\N	Lamani	enduser	2020-12-07 18:23:46
102052	Pratik	\N	Tambade	enduser	2020-12-07 18:23:46
102053	Deepak	\N	Reddy	enduser	2020-12-07 18:23:46
102054	Manas	\N	Bala	enduser	2020-12-07 18:23:46
102055	Bhoopendra	\N	Barve	enduser	2020-12-07 18:23:46
102056	Ranjeet	\N	Bhal	enduser	2020-12-07 18:23:46
102057	Keval	\N	Gangawane	enduser	2020-12-07 18:23:46
102058	Akshay	\N	Pawar	enduser	2020-12-07 18:23:46
102059	Pranav	\N	Deshpande	enduser	2020-12-07 18:23:46
102060	Akshay	\N	Dhamangaonkar	enduser	2020-12-07 18:23:46
102061	Mayur	\N	Chaudhari	enduser	2020-12-07 18:23:46
102062	Albert	\N	R	enduser	2020-12-07 18:23:46
102063	Snehashis	\N	Dhali	enduser	2020-12-07 18:23:46
102064	Pujala	\N	Raghuvamsi	enduser	2020-12-07 18:23:46
102065	Saurav	\N	Kumar	enduser	2020-12-07 18:23:46
102066	Jitendra	\N	Shende	enduser	2020-12-07 18:23:46
102067	Mudit	\N	Pandey	enduser	2020-12-07 18:23:46
102068	Vinod	\N	Patil	enduser	2020-12-07 18:23:46
102069	Anand	\N	Deshpande	enduser	2020-12-07 18:23:46
102070	Krishnamohan	\N	DV	enduser	2020-12-07 18:23:46
102071	Naresh	\N	Thakre	enduser	2020-12-07 18:23:46
102072	Sunilkumar	\N	Awasthi	enduser	2020-12-07 18:23:46
102073	Rajesh	\N	Singh	enduser	2020-12-07 18:23:46
102074	Vipul	\N	Biranje	enduser	2020-12-07 18:23:46
102075	Ramchandra	\N	Waingade	enduser	2020-12-07 18:23:46
102076	Kamalakannan	\N	K	enduser	2020-12-07 18:23:46
102077	Rajan	\N	Acharya	enduser	2020-12-07 18:23:46
102078	Sandeep	\N	Solse	enduser	2020-12-07 18:23:46
102079	Vasanthan	\N	KP	enduser	2020-12-07 18:23:46
102080	Dasharatha	\N	Rana	enduser	2020-12-07 18:23:46
102081	Shashikant	\N	Ahire	enduser	2020-12-07 18:23:46
102082	Mohammedwasif	\N	Patel	enduser	2020-12-07 18:23:46
102083	Aritra	\N	Bhaduri	enduser	2020-12-07 18:23:46
102084	Manali	\N	Kadam	enduser	2020-12-07 18:23:46
102085	Nitin	\N	Verma	enduser	2020-12-07 18:23:46
102086	Vinaykumar	\N	Pingali	enduser	2020-12-07 18:23:46
102087	Susan	\N	Daniel	enduser	2020-12-07 18:23:46
102088	Milind	\N	Chaudhari	enduser	2020-12-07 18:23:46
102089	Sourabh	\N	Ghadge	enduser	2020-12-07 18:23:46
102090	Mayuresh	\N	Deo	enduser	2020-12-07 18:23:46
102091	Subin	\N	Baskaran	enduser	2020-12-07 18:23:46
102092	Girish	\N	Joshi	enduser	2020-12-07 18:23:46
102093	Samir	\N	Kitukale	enduser	2020-12-07 18:23:46
102094	Englesh	\N	Saini	enduser	2020-12-07 18:23:46
102095	Ashish	\N	Kathpal	enduser	2020-12-07 18:23:46
102096	Akshay	\N	Patil	enduser	2020-12-07 18:23:46
102097	Vijay	\N	Jadhav	enduser	2020-12-07 18:23:46
102098	Puneet	\N	Minj	enduser	2020-12-07 18:23:46
102099	Devagiri	\N	Gedela	enduser	2020-12-07 18:23:46
102100	Raju	\N	Khade	enduser	2020-12-07 18:23:46
102101	Ankit	\N	Gawande	enduser	2020-12-07 18:23:46
102102	Star	\N	CCM	enduser	2020-12-07 18:23:46
102103	Printer	\N	Admin	enduser	2020-12-07 18:23:46
102104	Ashish	\N	Dubey	enduser	2020-12-07 18:23:46
102105	Vaibhav	\N	Mase	enduser	2020-12-07 18:23:46
102106	Samir	\N	Attar	enduser	2020-12-07 18:23:46
102107	Pramod	\N	Kumar	enduser	2020-12-07 18:23:46
102108	Avishkar	\N	Sorate	enduser	2020-12-07 18:23:46
102109	SPDMS	\N	batch	enduser	2020-12-07 18:23:46
102110	Pooja	\N	Jadhav	enduser	2020-12-07 18:23:46
102111	Aditya	\N	Shrivastava	enduser	2020-12-07 18:23:46
102112	Tushar	\N	Das	enduser	2020-12-07 18:23:46
102113	Nikhil	\N	Phadnis	enduser	2020-12-07 18:23:46
102114	Niraj	\N	Kishore	enduser	2020-12-07 18:23:46
102115	Brijesh	\N	Mishra	enduser	2020-12-07 18:23:46
102116	Mukesh	\N	Kumar	enduser	2020-12-07 18:23:46
102117	E3D	\N	Batch	enduser	2020-12-07 18:23:46
102118	Seshadeb	\N	Dora	enduser	2020-12-07 18:23:46
102119	Sudhanshu	\N	Behera	enduser	2020-12-07 18:23:46
102120	Chandrashekhar	\N	Barwad	enduser	2020-12-07 18:23:46
102121	Pavan	\N	Deshmane	enduser	2020-12-07 18:23:46
102122	Suraj	\N	Botre	enduser	2020-12-07 18:23:46
102123	Venkateswarulu	\N	Gandrotu	enduser	2020-12-07 18:23:46
102124	Aravinth	\N	Murugan	enduser	2020-12-07 18:23:46
102125	Mahadev	\N	Sutar	enduser	2020-12-07 18:23:46
102126	Kalaikovan	\N	Karuppannan	enduser	2020-12-07 18:23:46
102127	Sourabh	\N	Mishra	enduser	2020-12-07 18:23:46
102128	Sachin	\N	Mane	enduser	2020-12-07 18:23:46
102129	Gaurav	\N	Deshpande	enduser	2020-12-07 18:23:46
102130	Nilesh	\N	Unde	enduser	2020-12-07 18:23:46
102131	Sayali	\N	Kshirsagar	enduser	2020-12-07 18:23:46
102132	Divyaa	\N	Nair	enduser	2020-12-07 18:23:46
102133	Raviranjan	\N	Kumar	enduser	2020-12-07 18:23:46
102134	Mameet	\N	Shrivastava	enduser	2020-12-07 18:23:46
102135	Ganta	\N	Srikanth	enduser	2020-12-07 18:23:46
102136	Flywin	\N	I	enduser	2020-12-07 18:23:46
102137	Sandeep	\N	Majumdar	enduser	2020-12-07 18:23:46
102138	Amit	\N	Kumar	enduser	2020-12-07 18:23:46
102139	Umakanta	\N	Patro	enduser	2020-12-07 18:23:46
102140	Sanket	\N	Patil	enduser	2020-12-07 18:23:46
102141	Primus	\N	Tech	enduser	2020-12-07 18:23:46
102142	Abhishek	\N	Sharma	enduser	2020-12-07 18:23:46
102143	Srinivasa	\N	Ravella	enduser	2020-12-07 18:23:46
102144	Somil	\N	Shrivastava	enduser	2020-12-07 18:23:46
102145	Dhananjay	\N	Ghargade	enduser	2020-12-07 18:23:46
102146	Baburao	\N	Madduri	enduser	2020-12-07 18:23:46
102147	Amit	\N	Shinde	enduser	2020-12-07 18:23:46
102148	Vankar	\N	Laljibhai	enduser	2020-12-07 18:23:46
102149	Abhishek	\N	Singh	enduser	2020-12-07 18:23:46
102150	Ajay	\N	Borage	enduser	2020-12-07 18:23:46
102151	Akash	\N	Hajnale	enduser	2020-12-07 18:23:46
102152	Bhupendra	\N	Singh	enduser	2020-12-07 18:23:46
102153	Nilesh	\N	Jadhav	enduser	2020-12-07 18:23:46
102154	Aishwarya	\N	Dantam	enduser	2020-12-07 18:23:46
102155	Mahindra	\N	Godbole	enduser	2020-12-07 18:23:46
102156	Pushkaraj	\N	Dindore	enduser	2020-12-07 18:23:46
102157	Sheetal	\N	Patel	enduser	2020-12-07 18:23:46
102158	Sachin	\N	Dongre	enduser	2020-12-07 18:23:46
102159	Rahul	\N	Bhirud	enduser	2020-12-07 18:23:46
102160	Arunkumar	\N	Manivannan	enduser	2020-12-07 18:23:46
102161	Vanitha	\N	Dweraipudi	enduser	2020-12-07 18:23:46
102162	Nikhil	\N	Virkud	enduser	2020-12-07 18:23:46
102163	Abhishek	\N	Prabhavalkar	enduser	2020-12-07 18:23:46
102164	Aditya	\N	Prakash	enduser	2020-12-07 18:23:46
102165	Rohit	\N	Mhaiskar	enduser	2020-12-07 18:23:46
102166	Divyanshu	\N	Garg	enduser	2020-12-07 18:23:46
102167	Harishankar	\N	L	enduser	2020-12-07 18:23:46
102168	Ajitesh	\N	Sahoo	enduser	2020-12-07 18:23:46
102169	Kushagra	\N	Shah	enduser	2020-12-07 18:23:46
102170	Raghavendra	\N	Patil	enduser	2020-12-07 18:23:46
102171	Sandeep	\N	Jambhale	enduser	2020-12-07 18:23:46
102172	Vishal	\N	Yadav	enduser	2020-12-07 18:23:46
102173	Bhausaheb	\N	Patil	enduser	2020-12-07 18:23:46
102174	tkii	\N	VaultAdmin	enduser	2020-12-07 18:23:46
102175	Amol	\N	Kulkarni	enduser	2020-12-07 18:23:46
102176	Sandip	\N	Pawar	enduser	2020-12-07 18:23:46
102177	Kishor	\N	Mali	enduser	2020-12-07 18:23:46
102178	Abhishekh	\N	Desai	enduser	2020-12-07 18:23:46
102179	Vivek	\N	Soni	enduser	2020-12-07 18:23:46
102180	Rohit	\N	Gautam	enduser	2020-12-07 18:23:46
102181	Santosh	\N	Aglawe	enduser	2020-12-07 18:23:46
102182	Amit	\N	Sen	enduser	2020-12-07 18:23:46
102183	Abhijeet	\N	Kherde	enduser	2020-12-07 18:23:46
102184	Vimal	\N	Kumar	enduser	2020-12-07 18:23:46
102185	Amit	\N	Dewangan	enduser	2020-12-07 18:23:46
102186	Rajneesh	\N	Sharma	enduser	2020-12-07 18:23:46
102187	Kondapalli	\N	Venkateswararao	enduser	2020-12-07 18:23:46
102188	Gaurav	\N	Sharma	enduser	2020-12-07 18:23:46
102189	Neeraj	\N	Jain	enduser	2020-12-07 18:23:46
102190	Viren	\N	Joshi	enduser	2020-12-07 18:23:46
102191	Avindragiri	\N	Gauswami	enduser	2020-12-07 18:23:46
102192	Pramhansh	\N	Singh	enduser	2020-12-07 18:23:46
102193	Pratik	\N	Singh	enduser	2020-12-07 18:23:46
102194	Ranjithkumar	\N	K	enduser	2020-12-07 18:23:46
102195	Mayur	\N	Ahirkar	enduser	2020-12-07 18:23:46
102196	Tushar	\N	Vaidya	enduser	2020-12-07 18:23:46
102197	Prasad	\N	Kumthekar	enduser	2020-12-07 18:23:46
102198	Rajendra	\N	Salve	enduser	2020-12-07 18:23:46
102199	Onkar	\N	Patil	enduser	2020-12-07 18:23:46
102200	Prathamesh	\N	Jirange	enduser	2020-12-07 18:23:46
102201	Dev	\N	Kumar	enduser	2020-12-07 18:23:46
102202	Kshitij	\N	Wat	enduser	2020-12-07 18:23:46
102203	Avinash	\N	Patil	enduser	2020-12-07 18:23:46
102204	Nilesh	\N	Sake	enduser	2020-12-07 18:23:46
102205	Ravindra	\N	Zombade	enduser	2020-12-07 18:23:46
102206	Jaibheem	\N	Shirole	enduser	2020-12-07 18:23:46
102207	Dhanaraj	\N	Boyane	enduser	2020-12-07 18:23:46
102208	Omkar	\N	Patil	enduser	2020-12-07 18:23:46
102209	Nana	\N	Patil	enduser	2020-12-07 18:23:46
102210	Madhusudhan	\N	C	enduser	2020-12-07 18:23:46
102211	Prabakaran	\N	M	enduser	2020-12-07 18:23:46
102212	Amit	\N	Khara	enduser	2020-12-07 18:23:46
102213	Eldho	\N	Paul	enduser	2020-12-07 18:23:46
102214	Akhil	\N	George	enduser	2020-12-07 18:23:46
102215	ObulamPalli	\N	Reddy	enduser	2020-12-07 18:23:46
102216	Sudarshan	\N	Bhalerao	enduser	2020-12-07 18:23:46
102217	Aniket	\N	More	enduser	2020-12-07 18:23:46
102218	Sujeet	\N	Patil	enduser	2020-12-07 18:23:46
102219	Hemant	\N	Bhalerao	enduser	2020-12-07 18:23:46
102220	Anand	\N	Relekar	enduser	2020-12-07 18:23:46
102221	Chandan	\N	Mondal	enduser	2020-12-07 18:23:46
102222	Brajakishore	\N	Jena	enduser	2020-12-07 18:23:46
102223	Raushan	\N	Prasad	enduser	2020-12-07 18:23:46
102224	Promod	\N	Mondal	enduser	2020-12-07 18:23:46
102225	Jayakumar	\N	JM	enduser	2020-12-07 18:23:46
102226	Ajay	\N	Pisal	enduser	2020-12-07 18:23:46
102227	Sarathkumar	\N	VulluriKondala	enduser	2020-12-07 18:23:46
102228	Swarup	\N	Senapati	enduser	2020-12-07 18:23:46
102229	Goutam	\N	Biswal	enduser	2020-12-07 18:23:46
102230	Amit	\N	Patel	enduser	2020-12-07 18:23:46
102231	Akash	\N	Patel	enduser	2020-12-07 18:23:46
102232	Shyam	\N	S	enduser	2020-12-07 18:23:46
102233	Khan	\N	Sameer	enduser	2020-12-07 18:23:46
102234	Sreedhar	\N	Kondala	enduser	2020-12-07 18:23:46
102235	Abhijeet	\N	Phalke	enduser	2020-12-07 18:23:46
102236	Suhas	\N	Patil	enduser	2020-12-07 18:23:46
102237	Raju	\N	Vhankeri	enduser	2020-12-07 18:23:46
102238	Prashant	\N	Patil	enduser	2020-12-07 18:23:46
102239	Awadesh	\N	Tiwari	enduser	2020-12-07 18:23:46
102240	Ankit	\N	Srivastava	enduser	2020-12-07 18:23:46
102241	Rajesh	\N	Singh	enduser	2020-12-07 18:23:46
102242	Aptabuddin	\N	Mondal	enduser	2020-12-07 18:23:46
102243	Devmani	\N	Singh	enduser	2020-12-07 18:23:46
102244	Jogeswar	\N	Sahu	enduser	2020-12-07 18:23:46
102245	Pulkit	\N	Goyal	enduser	2020-12-07 18:23:46
102246	Ranjitha	\N	Poojary	enduser	2020-12-07 18:23:46
102247	Sekhar	\N	Vijaya	enduser	2020-12-07 18:23:46
102248	Aswini	\N	Das	enduser	2020-12-07 18:23:46
102249	Arun	\N	Ruidas	enduser	2020-12-07 18:23:46
102250	Bhushan	\N	Shelke	enduser	2020-12-07 18:23:46
102251	Amol	\N	Zope	enduser	2020-12-07 18:23:46
102252	Bhalchandra	\N	Pawar	enduser	2020-12-07 18:23:46
102253	Sathish Kumar	\N	R	enduser	2020-12-07 18:23:46
102254	Manohar	\N	Gurudu	enduser	2020-12-07 18:23:46
102255	Harshavardhana	\N	B	enduser	2020-12-07 18:23:46
102256	Rajasekhar	\N	Vissapragada	enduser	2020-12-07 18:23:46
102257	Venkata	\N	Naragani	enduser	2020-12-07 18:23:46
102258	Kulothungan	\N	Samidurai	enduser	2020-12-07 18:23:46
102259	Ranjeetkumar	\N	Singh	enduser	2020-12-07 18:23:46
102260	Primus	\N	Tech2	enduser	2020-12-07 18:23:46
102261	Vishakha	\N	Bhalerao	enduser	2020-12-07 18:23:46
102262	Anita	\N	Waghwal	enduser	2020-12-07 18:23:46
102263	Kamalakannan	\N	Mayavan	enduser	2020-12-07 18:23:46
102264	Abhijeet	\N	Pawar	enduser	2020-12-07 18:23:46
102265	Ankush	\N	Badgujar	enduser	2020-12-07 18:23:46
102266	Babasaheb	\N	Sarode	enduser	2020-12-07 18:23:46
102267	Neeraj	\N	Bhuyan	enduser	2020-12-07 18:23:46
102268	Atul	\N	Pawar	enduser	2020-12-07 18:23:46
102269	Aditya	\N	Manjul	enduser	2020-12-07 18:23:46
102270	Dileep	\N	Kumar	enduser	2020-12-07 18:23:46
102271	Rupak	\N	Mohanty	enduser	2020-12-07 18:23:46
102272	Shillpa	\N	Chabria	enduser	2020-12-07 18:23:46
102273	Rahul	\N	Narnavare	enduser	2020-12-07 18:23:46
102274	Pankaj	\N	Patil	enduser	2020-12-07 18:23:46
102275	Suhel	\N	Bagwan	enduser	2020-12-07 18:23:46
102276	Basant	\N	Narayan	enduser	2020-12-07 18:23:46
102277	Ganesh	\N	Patil	enduser	2020-12-07 18:23:46
102278	MD Irfan	\N	Ahmed	enduser	2020-12-07 18:23:46
102279	Abhijeet	\N	Pawar	enduser	2020-12-07 18:23:46
102280	Ajay	\N	Pisal	enduser	2020-12-07 18:23:46
102281	Abi	\N	Johns	enduser	2020-12-07 18:23:46
102282	Pratyush	\N	Behera	enduser	2020-12-07 18:23:46
102283	CH Prabhanjan	\N	Patro	enduser	2020-12-07 18:23:46
102284	Srinibas	\N	Mohapatra	enduser	2020-12-07 18:23:46
102285	Lokesh	\N	Harioudh	enduser	2020-12-07 18:23:46
102286	Manoj	\N	Kumar	enduser	2020-12-07 18:23:46
102287	Ranjeet	\N	Ingale	enduser	2020-12-07 18:23:46
102288	Abhijeet	\N	Kumar	enduser	2020-12-07 18:23:46
102289	Debojyoti	\N	Chatterjee	enduser	2020-12-07 18:23:46
102290	Pravin	\N	Dharammali	enduser	2020-12-07 18:23:46
102291	Aniket	\N	Vairagi	enduser	2020-12-07 18:23:46
102292	Dev	\N	Basant	enduser	2020-12-07 18:23:46
102293	Siddharth	\N	Deshmukh	enduser	2020-12-07 18:23:46
102294	Abburi	\N	Anirudh	enduser	2020-12-07 18:23:46
102295	Renuka	\N	Deshmukh	enduser	2020-12-07 18:23:46
102296	Swapnil	\N	Mayekar	enduser	2020-12-07 18:23:46
102297	Shyamji	\N	Tiwari	enduser	2020-12-07 18:23:46
102298	Amit	\N	Gargate	enduser	2020-12-07 18:23:46
102299	Hardik	\N	Pandya	enduser	2020-12-07 18:23:46
102300	Santosh	\N	Jena	enduser	2020-12-07 18:23:46
102301	Dhirendra	\N	Kumar	enduser	2020-12-07 18:23:46
102302	Saravanan	\N	Eliyavel	enduser	2020-12-07 18:23:46
102303	Ganesh	\N	Ganapathi	enduser	2020-12-07 18:23:46
102304	Shubham	\N	Singh	enduser	2020-12-07 18:23:46
102305	Arnab	\N	Banerjee	enduser	2020-12-07 18:23:46
102306	Sandip	\N	Pawar	enduser	2020-12-07 18:23:46
102307	Shivraj	\N	Patil	enduser	2020-12-07 18:23:46
102308	Lankayagari	\N	Babu	enduser	2020-12-07 18:23:46
102309	Suraj	\N	Suradkar	enduser	2020-12-07 18:23:46
\.


--
-- Data for Name: usug; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usug (usug_id, ugname, ugowner_id, description) FROM stdin;
7001	PRJEXEC	100004	No Description
\.


--
-- Name: asdi asdi_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asdi
    ADD CONSTRAINT asdi_pk PRIMARY KEY (asdi_id);


--
-- Name: astc astc_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astc
    ADD CONSTRAINT astc_pk PRIMARY KEY (astc_id);


--
-- Name: astc astc_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astc
    ADD CONSTRAINT astc_uk UNIQUE (category);


--
-- Name: astd astd_ck; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astd
    ADD CONSTRAINT astd_ck UNIQUE (asset_name);


--
-- Name: astd astd_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astd
    ADD CONSTRAINT astd_pk PRIMARY KEY (astd_id);


--
-- Name: astdes astdes_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astdes
    ADD CONSTRAINT astdes_pk PRIMARY KEY (astdes_id);


--
-- Name: astdesgpu astdesgpu_ck; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astdesgpu
    ADD CONSTRAINT astdesgpu_ck UNIQUE (gpucard, gpusize, gpuuom);


--
-- Name: astdesgpu astdesgpu_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astdesgpu
    ADD CONSTRAINT astdesgpu_pk PRIMARY KEY (astdesgpu_id);


--
-- Name: astdeshdd astdeshdd_ck; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astdeshdd
    ADD CONSTRAINT astdeshdd_ck UNIQUE (hddsize, hddtype, hdduom);


--
-- Name: astdeshdd astdeshdd_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astdeshdd
    ADD CONSTRAINT astdeshdd_pk PRIMARY KEY (astdeshdd_id);


--
-- Name: astdesmod astdesmod_ck; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astdesmod
    ADD CONSTRAINT astdesmod_ck UNIQUE (make, model);


--
-- Name: astdesmod astdesmod_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astdesmod
    ADD CONSTRAINT astdesmod_pk PRIMARY KEY (astdesmod_id);


--
-- Name: astdesopt astdesopt_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astdesopt
    ADD CONSTRAINT astdesopt_pk PRIMARY KEY (astdesopt_id);


--
-- Name: astdesos astdesos_ck; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astdesos
    ADD CONSTRAINT astdesos_ck UNIQUE (os, "bit", sp);


--
-- Name: astdesos astdesos_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astdesos
    ADD CONSTRAINT astdesos_pk PRIMARY KEY (astdesos_id);


--
-- Name: astdespro astdespro_ck; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astdespro
    ADD CONSTRAINT astdespro_ck UNIQUE (processor, speed);


--
-- Name: astdespro astdespro_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astdespro
    ADD CONSTRAINT astdespro_pk PRIMARY KEY (astdespro_id);


--
-- Name: astdesr astdesr_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astdesr
    ADD CONSTRAINT astdesr_pk PRIMARY KEY (astdesr_id);


--
-- Name: astdesram astdesram_ck; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astdesram
    ADD CONSTRAINT astdesram_ck UNIQUE (rsize, rtype, ruom);


--
-- Name: astdesram astdesram_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astdesram
    ADD CONSTRAINT astdesram_pk PRIMARY KEY (astdesram_id);


--
-- Name: astf astf_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astf
    ADD CONSTRAINT astf_pk PRIMARY KEY (astf_id);


--
-- Name: astg astg_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astg
    ADD CONSTRAINT astg_pk PRIMARY KEY (astg_id);


--
-- Name: astg astg_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astg
    ADD CONSTRAINT astg_uk UNIQUE (astg_group);


--
-- Name: asto asto_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asto
    ADD CONSTRAINT asto_pk PRIMARY KEY (asto_id);


--
-- Name: astr astr_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astr
    ADD CONSTRAINT astr_pk PRIMARY KEY (astr_id);


--
-- Name: asts asts_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asts
    ADD CONSTRAINT asts_pk PRIMARY KEY (asts_id);


--
-- Name: asts asts_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asts
    ADD CONSTRAINT asts_uk UNIQUE (status);


--
-- Name: astt astt_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astt
    ADD CONSTRAINT astt_pk PRIMARY KEY (astt_id);


--
-- Name: astt astt_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astt
    ADD CONSTRAINT astt_uk UNIQUE (type);


--
-- Name: astv astv_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astv
    ADD CONSTRAINT astv_pk PRIMARY KEY (astv_id);


--
-- Name: astv astv_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astv
    ADD CONSTRAINT astv_uk UNIQUE (vendor_name, vendor_location);


--
-- Name: usarl usarl_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usarl
    ADD CONSTRAINT usarl_pk PRIMARY KEY (usarl_id);


--
-- Name: usasg usasg_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usasg
    ADD CONSTRAINT usasg_pk PRIMARY KEY (usasg_id);


--
-- Name: usaug usaug_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usaug
    ADD CONSTRAINT usaug_pk PRIMARY KEY (usaug_id);


--
-- Name: usc1 usc1_ck; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usc1
    ADD CONSTRAINT usc1_ck UNIQUE (eightid);


--
-- Name: usc1 usc1_ck2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usc1
    ADD CONSTRAINT usc1_ck2 UNIQUE (empid);


--
-- Name: usc1 usc1_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usc1
    ADD CONSTRAINT usc1_pk PRIMARY KEY (usc1_id);


--
-- Name: uscbld uscbld_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uscbld
    ADD CONSTRAINT uscbld_pk PRIMARY KEY (uscbld_id);


--
-- Name: uscbld uscbld_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uscbld
    ADD CONSTRAINT uscbld_uk UNIQUE (building, floor);


--
-- Name: uscbr uscbr_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uscbr
    ADD CONSTRAINT uscbr_pk PRIMARY KEY (uscbr_id);


--
-- Name: uscbr uscbr_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uscbr
    ADD CONSTRAINT uscbr_uk UNIQUE (branch);


--
-- Name: uscn uscn_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uscn
    ADD CONSTRAINT uscn_pk PRIMARY KEY (uscn_id);


--
-- Name: uscre uscre_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uscre
    ADD CONSTRAINT uscre_pk PRIMARY KEY (uscre_id);


--
-- Name: uscsec uscsec_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uscsec
    ADD CONSTRAINT uscsec_pk PRIMARY KEY (uscsec_id);


--
-- Name: uscsec uscsec_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uscsec
    ADD CONSTRAINT uscsec_uk UNIQUE (scode);


--
-- Name: usctit usctit_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usctit
    ADD CONSTRAINT usctit_pk PRIMARY KEY (usctit_id);


--
-- Name: usdg usdg_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usdg
    ADD CONSTRAINT usdg_pk PRIMARY KEY (usdg_id);


--
-- Name: usdg usdg_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usdg
    ADD CONSTRAINT usdg_uk UNIQUE (designationname);


--
-- Name: usdt usdt_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usdt
    ADD CONSTRAINT usdt_pk PRIMARY KEY (usdt_id);


--
-- Name: usdt usdt_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usdt
    ADD CONSTRAINT usdt_uk UNIQUE (deptname);


--
-- Name: uslg uslg_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uslg
    ADD CONSTRAINT uslg_pk PRIMARY KEY (login_id);


--
-- Name: uscorg usorg_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uscorg
    ADD CONSTRAINT usorg_pk PRIMARY KEY (uscorg_id);


--
-- Name: uscorg usorg_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uscorg
    ADD CONSTRAINT usorg_uk UNIQUE (org);


--
-- Name: usph usph_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usph
    ADD CONSTRAINT usph_pk PRIMARY KEY (uspw_id);


--
-- Name: uspw uspw_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uspw
    ADD CONSTRAINT uspw_pk PRIMARY KEY (uspw_id);


--
-- Name: usre usre_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usre
    ADD CONSTRAINT usre_pk PRIMARY KEY (usre_id);


--
-- Name: usrl usrl_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usrl
    ADD CONSTRAINT usrl_pk PRIMARY KEY (usrl_id);


--
-- Name: usrl usrl_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usrl
    ADD CONSTRAINT usrl_uk UNIQUE (name);


--
-- Name: usrt usrt_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usrt
    ADD CONSTRAINT usrt_pk PRIMARY KEY (usrt_id);


--
-- Name: ussg ussg_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ussg
    ADD CONSTRAINT ussg_pk PRIMARY KEY (ussg_id);


--
-- Name: ussg ussg_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ussg
    ADD CONSTRAINT ussg_uk UNIQUE (sgname);


--
-- Name: ustp ustp_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ustp
    ADD CONSTRAINT ustp_pk PRIMARY KEY (ustp_id);


--
-- Name: ustp ustp_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ustp
    ADD CONSTRAINT ustp_uk UNIQUE (usertype);


--
-- Name: usud usud_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usud
    ADD CONSTRAINT usud_pk PRIMARY KEY (user_id);


--
-- Name: usug usug_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usug
    ADD CONSTRAINT usug_pk PRIMARY KEY (usug_id);


--
-- Name: usug usug_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usug
    ADD CONSTRAINT usug_uk UNIQUE (ugname);


--
-- Name: astr_fk1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX astr_fk1_idx ON public.astr USING btree (astd_id);


--
-- Name: astr_fk2_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX astr_fk2_idx ON public.astr USING btree (astt_id);


--
-- Name: astr_fk3_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX astr_fk3_idx ON public.astr USING btree (astc_id);


--
-- Name: astr_fk4_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX astr_fk4_idx ON public.astr USING btree (astg_id);


--
-- Name: astr_fk5_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX astr_fk5_idx ON public.astr USING btree (asts_id);


--
-- Name: astr_fk6_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX astr_fk6_idx ON public.astr USING btree (astv_id);


--
-- Name: astr_fk7_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX astr_fk7_idx ON public.astr USING btree (astf_id);


--
-- Name: usarl_fk1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usarl_fk1_idx ON public.usarl USING btree (user_id);


--
-- Name: usarl_fk2_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usarl_fk2_idx ON public.usarl USING btree (usrl_id);


--
-- Name: usasg_fk1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usasg_fk1_idx ON public.usasg USING btree (user_id);


--
-- Name: usasg_fk2_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usasg_fk2_idx ON public.usasg USING btree (ussg_id);


--
-- Name: usaug_fk1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usaug_fk1_idx ON public.usaug USING btree (user_id);


--
-- Name: usaug_fk2_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usaug_fk2_idx ON public.usaug USING btree (usug_id);


--
-- Name: usdt_fk1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usdt_fk1_idx ON public.usdt USING btree (deptheadid);


--
-- Name: uslg_fk_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX uslg_fk_idx ON public.uslg USING btree (user_id);


--
-- Name: uspw_fk1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX uspw_fk1_idx ON public.uspw USING btree (login_id);


--
-- Name: uspw_fk_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX uspw_fk_idx ON public.uspw USING btree (password);


--
-- Name: usre_fk1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usre_fk1_idx ON public.usre USING btree (user_id);


--
-- Name: usre_fk2_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usre_fk2_idx ON public.usre USING btree (ustp_id);


--
-- Name: usre_fk3_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usre_fk3_idx ON public.usre USING btree (usdg_id);


--
-- Name: usre_fk4_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usre_fk4_idx ON public.usre USING btree (usdt_id);


--
-- Name: usre_fk5_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usre_fk5_idx ON public.usre USING btree (usrt_id);


--
-- Name: usre_fk6_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usre_fk6_idx ON public.usre USING btree (uscn_id);


--
-- Name: usrt_fk1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usrt_fk1_idx ON public.usrt USING btree (reportingto_id);


--
-- Name: ussg_fk1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ussg_fk1_idx ON public.ussg USING btree (sgowner_id);


--
-- Name: usud_idx1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usud_idx1 ON public.usud USING btree (first_name);


--
-- Name: usug_fk1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usug_fk1_idx ON public.usug USING btree (ugowner_id);


--
-- Name: astdesr astdesr_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astdesr
    ADD CONSTRAINT astdesr_fk1 FOREIGN KEY (astr_id) REFERENCES public.astr(astr_id);


--
-- Name: astdesr astdesr_fk10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astdesr
    ADD CONSTRAINT astdesr_fk10 FOREIGN KEY (astdesram_id) REFERENCES public.astdesram(astdesram_id);


--
-- Name: astdesr astdesr_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astdesr
    ADD CONSTRAINT astdesr_fk2 FOREIGN KEY (astdes_id) REFERENCES public.astdes(astdes_id);


--
-- Name: astdesr astdesr_fk3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astdesr
    ADD CONSTRAINT astdesr_fk3 FOREIGN KEY (astdesgpu_id) REFERENCES public.astdesgpu(astdesgpu_id);


--
-- Name: astdesr astdesr_fk4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astdesr
    ADD CONSTRAINT astdesr_fk4 FOREIGN KEY (astdeshdd_id) REFERENCES public.astdeshdd(astdeshdd_id);


--
-- Name: astdesr astdesr_fk5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astdesr
    ADD CONSTRAINT astdesr_fk5 FOREIGN KEY (astdesmod_id) REFERENCES public.astdesmod(astdesmod_id);


--
-- Name: astdesr astdesr_fk6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astdesr
    ADD CONSTRAINT astdesr_fk6 FOREIGN KEY (astdesopt_id) REFERENCES public.astdesopt(astdesopt_id);


--
-- Name: astdesr astdesr_fk8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astdesr
    ADD CONSTRAINT astdesr_fk8 FOREIGN KEY (astdesos_id) REFERENCES public.astdesos(astdesos_id);


--
-- Name: astdesr astdesr_fk9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astdesr
    ADD CONSTRAINT astdesr_fk9 FOREIGN KEY (astdespro_id) REFERENCES public.astdespro(astdespro_id);


--
-- Name: asto asto_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asto
    ADD CONSTRAINT asto_fk1 FOREIGN KEY (user_id) REFERENCES public.usud(user_id);


--
-- Name: asto asto_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asto
    ADD CONSTRAINT asto_fk2 FOREIGN KEY (astd_id) REFERENCES public.astd(astd_id);


--
-- Name: astr astr_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astr
    ADD CONSTRAINT astr_fk1 FOREIGN KEY (astd_id) REFERENCES public.astd(astd_id);


--
-- Name: astr astr_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astr
    ADD CONSTRAINT astr_fk2 FOREIGN KEY (astt_id) REFERENCES public.astt(astt_id);


--
-- Name: astr astr_fk3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astr
    ADD CONSTRAINT astr_fk3 FOREIGN KEY (astc_id) REFERENCES public.astc(astc_id);


--
-- Name: astr astr_fk4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astr
    ADD CONSTRAINT astr_fk4 FOREIGN KEY (astg_id) REFERENCES public.astg(astg_id);


--
-- Name: astr astr_fk5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astr
    ADD CONSTRAINT astr_fk5 FOREIGN KEY (asts_id) REFERENCES public.asts(asts_id);


--
-- Name: astr astr_fk6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astr
    ADD CONSTRAINT astr_fk6 FOREIGN KEY (astv_id) REFERENCES public.astv(astv_id);


--
-- Name: astr astr_fk8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astr
    ADD CONSTRAINT astr_fk8 FOREIGN KEY (astf_id) REFERENCES public.astf(astf_id);


--
-- Name: astr astr_fk9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.astr
    ADD CONSTRAINT astr_fk9 FOREIGN KEY (asdi_id) REFERENCES public.asdi(asdi_id);


--
-- Name: usarl usarl_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usarl
    ADD CONSTRAINT usarl_fk1 FOREIGN KEY (user_id) REFERENCES public.usud(user_id) ON DELETE CASCADE;


--
-- Name: usarl usarl_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usarl
    ADD CONSTRAINT usarl_fk2 FOREIGN KEY (usrl_id) REFERENCES public.usrl(usrl_id) ON DELETE CASCADE;


--
-- Name: usasg usasg_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usasg
    ADD CONSTRAINT usasg_fk1 FOREIGN KEY (user_id) REFERENCES public.usud(user_id) ON DELETE CASCADE;


--
-- Name: usasg usasg_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usasg
    ADD CONSTRAINT usasg_fk2 FOREIGN KEY (ussg_id) REFERENCES public.ussg(ussg_id) ON DELETE CASCADE;


--
-- Name: usaug usaug_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usaug
    ADD CONSTRAINT usaug_fk1 FOREIGN KEY (user_id) REFERENCES public.usud(user_id) ON DELETE CASCADE;


--
-- Name: usaug usaug_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usaug
    ADD CONSTRAINT usaug_fk2 FOREIGN KEY (usug_id) REFERENCES public.usug(usug_id) ON DELETE CASCADE;


--
-- Name: uscre uscre_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uscre
    ADD CONSTRAINT uscre_fk1 FOREIGN KEY (usre_id) REFERENCES public.usre(usre_id) ON DELETE CASCADE;


--
-- Name: uscre uscre_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uscre
    ADD CONSTRAINT uscre_fk2 FOREIGN KEY (uscorg_id) REFERENCES public.uscorg(uscorg_id) ON DELETE CASCADE;


--
-- Name: uscre uscre_fk3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uscre
    ADD CONSTRAINT uscre_fk3 FOREIGN KEY (uscbr_id) REFERENCES public.uscbr(uscbr_id) ON DELETE CASCADE;


--
-- Name: uscre uscre_fk4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uscre
    ADD CONSTRAINT uscre_fk4 FOREIGN KEY (uscbld_id) REFERENCES public.uscbld(uscbld_id) ON DELETE CASCADE;


--
-- Name: uscre uscre_fk5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uscre
    ADD CONSTRAINT uscre_fk5 FOREIGN KEY (uscsec_id) REFERENCES public.uscsec(uscsec_id) ON DELETE CASCADE;


--
-- Name: uscre uscre_fk6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uscre
    ADD CONSTRAINT uscre_fk6 FOREIGN KEY (usctit_id) REFERENCES public.usctit(usctit_id) ON DELETE CASCADE;


--
-- Name: uscre uscre_fk7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uscre
    ADD CONSTRAINT uscre_fk7 FOREIGN KEY (usc1_id) REFERENCES public.usc1(usc1_id) ON DELETE CASCADE;


--
-- Name: usdt usdt_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usdt
    ADD CONSTRAINT usdt_fk1 FOREIGN KEY (deptheadid) REFERENCES public.usud(user_id) ON DELETE SET NULL;


--
-- Name: uslg uslg_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uslg
    ADD CONSTRAINT uslg_fk FOREIGN KEY (user_id) REFERENCES public.usud(user_id) ON DELETE CASCADE;


--
-- Name: usph usph_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usph
    ADD CONSTRAINT usph_fk FOREIGN KEY (uspw_id) REFERENCES public.uspw(uspw_id) ON DELETE CASCADE;


--
-- Name: uspw uspw_fk3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uspw
    ADD CONSTRAINT uspw_fk3 FOREIGN KEY (login_id) REFERENCES public.uslg(login_id);


--
-- Name: usre usre_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usre
    ADD CONSTRAINT usre_fk1 FOREIGN KEY (user_id) REFERENCES public.usud(user_id) ON DELETE CASCADE;


--
-- Name: usre usre_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usre
    ADD CONSTRAINT usre_fk2 FOREIGN KEY (ustp_id) REFERENCES public.ustp(ustp_id) ON DELETE CASCADE;


--
-- Name: usre usre_fk3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usre
    ADD CONSTRAINT usre_fk3 FOREIGN KEY (usdg_id) REFERENCES public.usdg(usdg_id) ON DELETE CASCADE;


--
-- Name: usre usre_fk4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usre
    ADD CONSTRAINT usre_fk4 FOREIGN KEY (usdt_id) REFERENCES public.usdt(usdt_id) ON DELETE CASCADE;


--
-- Name: usre usre_fk5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usre
    ADD CONSTRAINT usre_fk5 FOREIGN KEY (usrt_id) REFERENCES public.usrt(usrt_id) ON DELETE CASCADE;


--
-- Name: usre usre_fk6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usre
    ADD CONSTRAINT usre_fk6 FOREIGN KEY (uscn_id) REFERENCES public.uscn(uscn_id) ON DELETE CASCADE;


--
-- Name: usrt usrt_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usrt
    ADD CONSTRAINT usrt_fk1 FOREIGN KEY (reportingto_id) REFERENCES public.usud(user_id) ON DELETE CASCADE;


--
-- Name: ussg ussg_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ussg
    ADD CONSTRAINT ussg_fk1 FOREIGN KEY (sgowner_id) REFERENCES public.usud(user_id) ON DELETE CASCADE;


--
-- Name: usug usug_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usug
    ADD CONSTRAINT usug_fk1 FOREIGN KEY (ugowner_id) REFERENCES public.usud(user_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

