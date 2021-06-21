--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

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
-- Name: Agenda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Agenda" (
    id integer NOT NULL,
    "Ref_agenda_date" timestamp without time zone,
    client_id integer,
    "Organisateur" integer,
    "Titre_du_Rdv" character varying,
    "Adresse1_Rdv" character varying,
    "Adresse2_Rdv" character varying,
    "Code_postal_Rdv" character varying,
    "Ville_du_Rdv" character varying,
    "Date_Rdv" character varying,
    "Heure_début_Rdv" character varying,
    "Heure_fin_Rdv" character varying,
    "Date_Rdv_annulé" character varying,
    "Informations_reservees_service_planification" character varying,
    "Informations_generales" character varying,
    "Informations_de_suivi_de_Rdv" character varying,
    "Chemin_de_fichier_joint" character varying,
    visibility boolean
);


ALTER TABLE public."Agenda" OWNER TO postgres;

--
-- Name: Agenda_expert; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Agenda_expert" (
    id integer NOT NULL,
    agenda_taken integer,
    "Participant_invité" integer,
    validation boolean,
    visibility boolean
);


ALTER TABLE public."Agenda_expert" OWNER TO postgres;

--
-- Name: Agenda_expert_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Agenda_expert_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Agenda_expert_id_seq" OWNER TO postgres;

--
-- Name: Agenda_expert_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Agenda_expert_id_seq" OWNED BY public."Agenda_expert".id;


--
-- Name: Agenda_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Agenda_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Agenda_id_seq" OWNER TO postgres;

--
-- Name: Agenda_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Agenda_id_seq" OWNED BY public."Agenda".id;


--
-- Name: Client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Client" (
    id integer NOT NULL,
    reference character varying,
    "TYPE" character varying,
    societe character varying,
    enseigne character varying,
    titre character varying,
    nom character varying,
    email character varying,
    numero character varying,
    siret character varying,
    date_creation timestamp without time zone,
    visibility boolean
);


ALTER TABLE public."Client" OWNER TO postgres;

--
-- Name: Client_History; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Client_History" (
    id integer NOT NULL,
    client_id integer,
    adresse1 character varying,
    adresse2 character varying,
    etat_client character varying,
    cp character varying,
    ville character varying,
    pays character varying,
    login_extranet character varying,
    mpd_extranet character varying,
    abonnement character varying,
    date timestamp without time zone,
    visibility boolean
);


ALTER TABLE public."Client_History" OWNER TO postgres;

--
-- Name: Client_History_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Client_History_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Client_History_id_seq" OWNER TO postgres;

--
-- Name: Client_History_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Client_History_id_seq" OWNED BY public."Client_History".id;


--
-- Name: Client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Client_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Client_id_seq" OWNER TO postgres;

--
-- Name: Client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Client_id_seq" OWNED BY public."Client".id;


--
-- Name: Client_negotiateur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Client_negotiateur" (
    id integer NOT NULL,
    client_id integer,
    sexe character varying,
    nom character varying,
    email character varying,
    numero character varying,
    date_creation timestamp without time zone,
    visibility boolean
);


ALTER TABLE public."Client_negotiateur" OWNER TO postgres;

--
-- Name: Client_negotiateur_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Client_negotiateur_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Client_negotiateur_id_seq" OWNER TO postgres;

--
-- Name: Client_negotiateur_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Client_negotiateur_id_seq" OWNED BY public."Client_negotiateur".id;


--
-- Name: Expert; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Expert" (
    id integer NOT NULL,
    old character varying,
    new character varying,
    genre character varying,
    nom character varying,
    trigramme character varying,
    "TYPE" character varying,
    date_entree timestamp without time zone,
    siret character varying,
    email character varying,
    email_perso character varying,
    numero character varying,
    code_tva character varying,
    taux_tva character varying,
    password character varying(60),
    visibility boolean
);


ALTER TABLE public."Expert" OWNER TO postgres;

--
-- Name: Expert_History; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Expert_History" (
    id integer NOT NULL,
    expert_id integer,
    actif_parti character varying,
    secteur character varying,
    type_certification character varying,
    date_certification_initiale character varying,
    date_renouv_certification character varying,
    adresse1 character varying,
    adresse2 character varying,
    cp character varying,
    login_backof character varying,
    pwd_backof character varying,
    login_extranet character varying,
    pwd_extranet character varying,
    pwd_gsuite character varying,
    login_google character varying,
    pwd_google character varying,
    ville character varying,
    observations_de_suivi character varying,
    date_sortie timestamp without time zone,
    date timestamp without time zone,
    visibility boolean
);


ALTER TABLE public."Expert_History" OWNER TO postgres;

--
-- Name: Expert_History_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Expert_History_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Expert_History_id_seq" OWNER TO postgres;

--
-- Name: Expert_History_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Expert_History_id_seq" OWNED BY public."Expert_History".id;


--
-- Name: Expert_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Expert_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Expert_id_seq" OWNER TO postgres;

--
-- Name: Expert_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Expert_id_seq" OWNED BY public."Expert".id;


--
-- Name: Facturation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Facturation" (
    id integer NOT NULL,
    "Facture_no" integer,
    "Date_" timestamp without time zone NOT NULL,
    "Pays" character varying,
    "Destinataire" integer,
    expediteur integer,
    "Montant" character varying,
    "TVA" character varying,
    "Total" character varying,
    "Type" character varying,
    "Proprietaire" integer,
    "Locataire" integer,
    "Ville" character varying,
    "Surface" character varying,
    "Tarif" character varying,
    "Appt_Pav" character varying,
    "Visibility" boolean
);


ALTER TABLE public."Facturation" OWNER TO postgres;

--
-- Name: Facturation_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Facturation_history" (
    id integer NOT NULL,
    date timestamp without time zone,
    mission integer,
    facture integer,
    done timestamp without time zone,
    visibility boolean
);


ALTER TABLE public."Facturation_history" OWNER TO postgres;

--
-- Name: Facturation_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Facturation_history_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Facturation_history_id_seq" OWNER TO postgres;

--
-- Name: Facturation_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Facturation_history_id_seq" OWNED BY public."Facturation_history".id;


--
-- Name: Facturation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Facturation_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Facturation_id_seq" OWNER TO postgres;

--
-- Name: Facturation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Facturation_id_seq" OWNED BY public."Facturation".id;


--
-- Name: Mission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Mission" (
    id integer NOT NULL,
    "Reference_BAILLEUR" integer,
    old character varying,
    "NRO_FACTURE" character varying,
    "ABONNEMENT" character varying,
    "ID_AS" integer,
    "PRIX_HT_EDL" double precision,
    "DATE_REALISE_EDL" timestamp without time zone,
    "ID_INTERV" integer,
    "Reference_LOCATAIRE" character varying,
    "Adresse1_Bien" character varying,
    "Adresse2_Bien" character varying,
    "CP_Bien" character varying,
    "Ville_Bien" character varying,
    "TVA_EDL" character varying,
    "PRIX_TTC_EDL" character varying,
    "CA_HT_AS" character varying,
    "TVA_AS" character varying,
    "CA_TTC_AS" character varying,
    "CA_HT_AC" character varying,
    "CA_TTC_AC" character varying,
    "CA_HT_TRUST" character varying,
    "TVA_TRUST" character varying,
    "Date_chiffrage_regle" character varying,
    "Prix_ht_chiffrage" character varying,
    "POURCENTAGE_suiveur_chiffrage" character varying,
    "POURCENTAGE_AS_chiffrage" character varying,
    "POURCENTAGE_manager_chiffrage" character varying,
    "ID_manager_chiffrage" integer,
    "POURCENTAGE_agent_chiffrage" character varying,
    "ID_agent_chiffrage" integer,
    "TYPE_EDL" character varying,
    "DATE_FACTURE" timestamp without time zone,
    "TITREPROPRIO" character varying,
    "NOMPROPRIO" character varying,
    "DATE_FACT_REGLEE" character varying,
    "TYPE_LOGEMENT" character varying,
    "CODE_AMEXPERT" character varying,
    "COMMENTAIRE_FACTURE" character varying,
    "LOGEMENT_MEUBLE" character varying,
    "CODE_FACTURATION" character varying,
    "TYPE_DE_BIEN" character varying,
    surface_logement1 character varying,
    "Ref_commande" character varying,
    "POURCENTAGE_COM_AS_DU_CLIENT" character varying,
    "ID_Respon_Cell_Dev" integer,
    "POURCENTAGE_Respon_Cell_Dev" character varying,
    "ID_agent_Cell_Dev" integer,
    "POURCENTAGE_Agent_Cell_Dev" character varying,
    "ID_Agent_CellTech" integer,
    "POURCENTAGE_Agent_Cell_Tech" character varying,
    "ID_Respon_Cell_Tech" integer,
    "POURCENTAGE_Respon_Cell_Tech" character varying,
    "ID_Suiveur_Cell_Tech" integer,
    "POURCENTAGE_Suiveur_Cell_Tech" character varying,
    "ID_Respon_Cell_Planif" integer,
    "POURCENTAGE_Respon_Cell_Planif" character varying,
    "ID_Suiveur_Cell_Planif" integer,
    "POURCENTAGE_Suiveur_Cell_Planif" character varying,
    "ID_Agent_saisie_Cell_Planif" integer,
    "POURCENTAGE_Agent_saisie_CEll_planif" character varying,
    "Anomalie" boolean,
    coherent boolean,
    reason character varying,
    "Visibility" boolean
);


ALTER TABLE public."Mission" OWNER TO postgres;

--
-- Name: Mission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Mission_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Mission_id_seq" OWNER TO postgres;

--
-- Name: Mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Mission_id_seq" OWNED BY public."Mission".id;


--
-- Name: Negotiateur_History; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Negotiateur_History" (
    id integer NOT NULL,
    negotiateur_id integer,
    adresse character varying,
    etat_client boolean,
    cp character varying,
    ville character varying,
    pays character varying,
    abonnement character varying,
    date timestamp without time zone,
    visibility boolean
);


ALTER TABLE public."Negotiateur_History" OWNER TO postgres;

--
-- Name: Negotiateur_History_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Negotiateur_History_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Negotiateur_History_id_seq" OWNER TO postgres;

--
-- Name: Negotiateur_History_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Negotiateur_History_id_seq" OWNED BY public."Negotiateur_History".id;


--
-- Name: Tarif_base; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tarif_base" (
    id integer NOT NULL,
    pav_appartement character varying,
    "Type" character varying,
    surface character varying,
    "Prix_EDL" integer,
    visibility boolean
);


ALTER TABLE public."Tarif_base" OWNER TO postgres;

--
-- Name: Tarif_base_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Tarif_base_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Tarif_base_id_seq" OWNER TO postgres;

--
-- Name: Tarif_base_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Tarif_base_id_seq" OWNED BY public."Tarif_base".id;


--
-- Name: Tarifs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tarifs" (
    id integer NOT NULL,
    reference_client integer,
    edl_prix_std double precision,
    edl_appt_prix_f1 double precision,
    edl_appt_prix_f2 double precision,
    edl_appt_prix_f3 double precision,
    edl_appt_prix_f4 double precision,
    edl_appt_prix_f5 double precision,
    edl_appt_prix_f6 double precision,
    edl_pav_villa_prix_t1 double precision,
    edl_pav_villa_prix_t2 double precision,
    edl_pav_villa_prix_t3 double precision,
    edl_pav_villa_prix_t4 double precision,
    edl_pav_villa_prix_t5 double precision,
    edl_pav_villa_prix_t6 double precision,
    edl_pav_villa_prix_t7 double precision,
    edl_pav_villa_prix_t8 double precision,
    chif_appt_prix_stu double precision,
    chif_appt_prix_f1 double precision,
    chif_appt_prix_f2 double precision,
    chif_appt_prix_f3 double precision,
    chif_appt_prix_f4 double precision,
    chif_appt_prix_f5 double precision,
    chif_appt_prix_f6 double precision,
    chif_pav_villa_prix_t1 double precision,
    chif_pav_villa_prix_t2 double precision,
    chif_pav_villa_prix_t3 double precision,
    chif_pav_villa_prix_t4 double precision,
    chif_pav_villa_prix_t5 double precision,
    chif_pav_villa_prix_t6 double precision,
    chif_pav_villa_prix_t7 double precision,
    chif_pav_villa_prix_t8 double precision,
    code_tva character varying,
    taux_meuble character varying,
    referent_as_client integer,
    com_as_sur_ca_client character varying,
    cell_dev_ref_responsable integer,
    com_cell_dev_ref_responsable character varying,
    cell_dev_ref_agent integer,
    com_cell_dev_ref_agent character varying,
    cell_tech_ref_agent integer,
    "com_cell_tech_Ref_agent" character varying,
    cell_tech_ref_responsable integer,
    com_cell_tech_ref_responsable character varying,
    cell_tech_ref_suiveur integer,
    com_cell_tech_ref_suiveur character varying,
    cell_planif_ref_responsable integer,
    com_cell_planif_ref_responsable character varying,
    cell_planif_ref_suiveur integer,
    com_cell_planif_ref_suiveur character varying,
    cell_planif_ref_agent_saisie integer,
    com_cell_planif_ref_agent_saisie character varying,
    prix_autre character varying,
    commentaire_libre character varying,
    date timestamp without time zone,
    visibility boolean
);


ALTER TABLE public."Tarifs" OWNER TO postgres;

--
-- Name: Tarifs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Tarifs_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Tarifs_id_seq" OWNER TO postgres;

--
-- Name: Tarifs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Tarifs_id_seq" OWNED BY public."Tarifs".id;


--
-- Name: facturation_client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facturation_client (
    id integer NOT NULL,
    n_facture character varying,
    "Montant_HT" character varying,
    client integer,
    "Date_de_creation" timestamp without time zone,
    "Date_mission" timestamp without time zone,
    "Date_reglement_client" character varying,
    missions_s character varying,
    missions_f character varying,
    "Statut" character varying,
    "Observations_suivi_paiement" character varying,
    "Date_première_relance" character varying,
    "Date_seconde_relance" character varying,
    "Date_mise_en_demeure" character varying,
    valide boolean,
    visibility boolean
);


ALTER TABLE public.facturation_client OWNER TO postgres;

--
-- Name: facturation_client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.facturation_client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facturation_client_id_seq OWNER TO postgres;

--
-- Name: facturation_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.facturation_client_id_seq OWNED BY public.facturation_client.id;


--
-- Name: facturation_mission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facturation_mission (
    id integer NOT NULL,
    ref_mission integer,
    fact_mission integer,
    visibility boolean
);


ALTER TABLE public.facturation_mission OWNER TO postgres;

--
-- Name: facturation_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.facturation_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facturation_mission_id_seq OWNER TO postgres;

--
-- Name: facturation_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.facturation_mission_id_seq OWNED BY public.facturation_mission.id;


--
-- Name: prospect; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prospect (
    id integer NOT NULL,
    reference character varying,
    "TYPE" character varying,
    societe character varying,
    enseigne character varying,
    titre character varying,
    nom character varying,
    email character varying,
    numero character varying,
    siret character varying,
    date_creation timestamp without time zone,
    visibility boolean
);


ALTER TABLE public.prospect OWNER TO postgres;

--
-- Name: prospect_History; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."prospect_History" (
    id integer NOT NULL,
    prospect integer,
    adresse character varying,
    cp character varying,
    ville character varying,
    pays character varying,
    etat_client character varying,
    login_extranet character varying,
    mpd_extranet character varying,
    date timestamp without time zone,
    visibility boolean
);


ALTER TABLE public."prospect_History" OWNER TO postgres;

--
-- Name: prospect_History_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."prospect_History_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."prospect_History_id_seq" OWNER TO postgres;

--
-- Name: prospect_History_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."prospect_History_id_seq" OWNED BY public."prospect_History".id;


--
-- Name: prospect_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prospect_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prospect_id_seq OWNER TO postgres;

--
-- Name: prospect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prospect_id_seq OWNED BY public.prospect.id;


--
-- Name: seq_street_segment_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_street_segment_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_street_segment_id OWNER TO postgres;

--
-- Name: suivi_client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suivi_client (
    id integer NOT NULL,
    client integer,
    responsable integer,
    commentaire character varying,
    date_creation timestamp without time zone,
    date_modif timestamp without time zone,
    visibility boolean
);


ALTER TABLE public.suivi_client OWNER TO postgres;

--
-- Name: suivi_client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.suivi_client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.suivi_client_id_seq OWNER TO postgres;

--
-- Name: suivi_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.suivi_client_id_seq OWNED BY public.suivi_client.id;


--
-- Name: suivi_prospect; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suivi_prospect (
    id integer NOT NULL,
    prospect_id integer,
    responsable integer,
    commentaire character varying,
    date_creation timestamp without time zone,
    date_modif timestamp without time zone,
    visibility boolean
);


ALTER TABLE public.suivi_prospect OWNER TO postgres;

--
-- Name: suivi_prospect_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.suivi_prospect_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.suivi_prospect_id_seq OWNER TO postgres;

--
-- Name: suivi_prospect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.suivi_prospect_id_seq OWNED BY public.suivi_prospect.id;


--
-- Name: Agenda id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Agenda" ALTER COLUMN id SET DEFAULT nextval('public."Agenda_id_seq"'::regclass);


--
-- Name: Agenda_expert id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Agenda_expert" ALTER COLUMN id SET DEFAULT nextval('public."Agenda_expert_id_seq"'::regclass);


--
-- Name: Client id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Client" ALTER COLUMN id SET DEFAULT nextval('public."Client_id_seq"'::regclass);


--
-- Name: Client_History id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Client_History" ALTER COLUMN id SET DEFAULT nextval('public."Client_History_id_seq"'::regclass);


--
-- Name: Client_negotiateur id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Client_negotiateur" ALTER COLUMN id SET DEFAULT nextval('public."Client_negotiateur_id_seq"'::regclass);


--
-- Name: Expert id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Expert" ALTER COLUMN id SET DEFAULT nextval('public."Expert_id_seq"'::regclass);


--
-- Name: Expert_History id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Expert_History" ALTER COLUMN id SET DEFAULT nextval('public."Expert_History_id_seq"'::regclass);


--
-- Name: Facturation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Facturation" ALTER COLUMN id SET DEFAULT nextval('public."Facturation_id_seq"'::regclass);


--
-- Name: Facturation_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Facturation_history" ALTER COLUMN id SET DEFAULT nextval('public."Facturation_history_id_seq"'::regclass);


--
-- Name: Mission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission" ALTER COLUMN id SET DEFAULT nextval('public."Mission_id_seq"'::regclass);


--
-- Name: Negotiateur_History id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Negotiateur_History" ALTER COLUMN id SET DEFAULT nextval('public."Negotiateur_History_id_seq"'::regclass);


--
-- Name: Tarif_base id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tarif_base" ALTER COLUMN id SET DEFAULT nextval('public."Tarif_base_id_seq"'::regclass);


--
-- Name: Tarifs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tarifs" ALTER COLUMN id SET DEFAULT nextval('public."Tarifs_id_seq"'::regclass);


--
-- Name: facturation_client id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturation_client ALTER COLUMN id SET DEFAULT nextval('public.facturation_client_id_seq'::regclass);


--
-- Name: facturation_mission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturation_mission ALTER COLUMN id SET DEFAULT nextval('public.facturation_mission_id_seq'::regclass);


--
-- Name: prospect id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prospect ALTER COLUMN id SET DEFAULT nextval('public.prospect_id_seq'::regclass);


--
-- Name: prospect_History id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."prospect_History" ALTER COLUMN id SET DEFAULT nextval('public."prospect_History_id_seq"'::regclass);


--
-- Name: suivi_client id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suivi_client ALTER COLUMN id SET DEFAULT nextval('public.suivi_client_id_seq'::regclass);


--
-- Name: suivi_prospect id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suivi_prospect ALTER COLUMN id SET DEFAULT nextval('public.suivi_prospect_id_seq'::regclass);


--
-- Data for Name: Agenda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Agenda" (id, "Ref_agenda_date", client_id, "Organisateur", "Titre_du_Rdv", "Adresse1_Rdv", "Adresse2_Rdv", "Code_postal_Rdv", "Ville_du_Rdv", "Date_Rdv", "Heure_début_Rdv", "Heure_fin_Rdv", "Date_Rdv_annulé", "Informations_reservees_service_planification", "Informations_generales", "Informations_de_suivi_de_Rdv", "Chemin_de_fichier_joint", visibility) FROM stdin;
\.


--
-- Data for Name: Agenda_expert; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Agenda_expert" (id, agenda_taken, "Participant_invité", validation, visibility) FROM stdin;
\.


--
-- Data for Name: Client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Client" (id, reference, "TYPE", societe, enseigne, titre, nom, email, numero, siret, date_creation, visibility) FROM stdin;
1	107801	CLIENT ACTIF	SARL GIC IMMOBILIER	barbaraimmobiliergic	Madame	barbara	agence@barbaraimmo.fr  / agencebarbara@wanadoo.fr	01 39 16 16 10	379 315 211 00019	2021-06-21 07:58:47.536404	t
2		ARRET COLLABORATION	ADCERTIS v.fouquet@adcertix.fr	\N	pour	jbm luzarches	jacques-bertrand.mery@wanadoo.fr	nan	nan	2021-06-21 07:58:48.454875	t
3		ARRET COLLABORATION	ADCERTIS	\N	pour	jbm beaumont /oise	jbm3beaumont@orange.fr	nan	nan	2021-06-21 07:58:49.268408	t
4		ARRET COLLABORATION	ADCERTIS	\N	pour	jbm ecouen	jbm1.jonvel@wanadoo.fr	nan	nan	2021-06-21 07:58:49.952017	t
5		ARRET COLLABORATION	ADCERTIS	\N	pour	cmp conseil paris 15	cpeltier@lacleimmo.com	nan	nan	2021-06-21 07:58:50.69859	t
19	109256	INACTIF	LAFORET IMMOBILIER FRANCONVILLE	laforet	Monsieur	lucas olivier	franconville@laforet.com	134442111	nan	2021-06-21 07:59:07.171192	t
6		INACTIF	LAFORET TOLBIAC IMMOBILIER	laforet	Monsieur	girault joel	paris13tolbiac@laforet.com	nan	nan	2021-06-21 07:58:51.383197	t
7		INACTIF / ARRET COLLABORATION	KAPITAL PRESTIGE	\N	Mademoiselle	bui véronique	explorimmoparis@gmail.com	nan	nan	2021-06-21 07:58:52.189735	t
8		ARRET COLLABORATION	LAFORET IMMOBILIER	laforet	.	sas milestar	orange@laforet.com	nan	nan	2021-06-21 07:58:53.133196	t
9		ARRET COLLABORATION	ADCERTIS	\N	pour	cabinet ngc	c.rix@arch-ncg.com	nan	nan	2021-06-21 07:58:53.959722	t
10		ARRET COLLABORATION	BOOK A FLAT	\N	Madame	de fouquieres géraldine	géraldine@book-a-flat.com	nan	nan	2021-06-21 07:58:54.952154	t
20	109223	INACTIF	AGENCE LE BAIL	\N	Monsieur	le bail	agence.lebail@wanadoo.fr	nan	nan	2021-06-21 07:59:08.009684	t
11	1075491	CLIENT ACTIF	SARL LES 3 B - L'ADRESSE ANJOU MAINE	l'adresseanjoumainesarlles3b	Monsieur	blanvillain sebastien	blanvilain.ladresse49@ladresse.com	nan	48062859300075	2021-06-21 07:58:55.764691	t
12		INACTIF	CABINET PORTELLI	orpi	Madame	gustave véronique	gerance@cabinetportelli.fr	nan	nan	2021-06-21 07:58:56.684162	t
21	109217	INACTIF / ARRET COLLABORATION	LUXURY HOMES	\N	Monsieur	pires jorges	contact@luxuryhomes.fr	nan	nan	2021-06-21 07:59:08.62133	t
13		INACTIF	NEPTUNE IMMOBILIER LAFORET	laforet	Madame	boche catherine	cboche@laforet.com	nan	nan	2021-06-21 07:58:57.608635	t
14	109215	INACTIF	ORPI AGENCE DU MARCHE	orpiagencedumarche	Madame	vilpellet m.l	vilpelletimmobilier@orpi.om	nan	nan	2021-06-21 07:58:58.606061	t
15		ARRET DE COLLABORATION SUITE VENTE	LAFORET IMMOBILIER ALSEVE IMMO	\N	Monsieur	philippe christian	cphilippe@laforet.com	nan	nan	2021-06-21 07:59:01.21557	t
16	109218	['etude', 'fauquereau', '-', 'simonet']	Etude Fauquereau - Simonet	etudefauquereausimonet	Monsieur	simonet manuel	fauquereau.simonet@notaires.fr	241694725	nan	2021-06-21 07:59:03.927015	t
22	109216	ARRET CLIENT SUR VENTE  COMMERCE	EV'IMMO	\N	Madame	villard evelyne	evimmo-orvault@orange.fr	nan	nan	2021-06-21 07:59:09.38489	t
17	109205	INACTIF-ARRET COLLABORATION	NOUVEL ESPACE	nouvelespace	Mademoiselle	cadoret      leruez linda	cadoretlinda@aol.com	01 49 09 04 17	400 951 307 00034	2021-06-21 07:59:05.209283	t
18	109910	REPRENDRE CONTACT	ORPI AGENCE MARTIN	\N	Madame	monnanteuil valérie	agencemartinissy@orpi.com	nan	nan	2021-06-21 07:59:06.106767	t
29	109322	INACTIF	A.I.V.B	\N	Monsieur	maillard laurent	laurent@aivn.net	164669090	nan	2021-06-21 07:59:14.377034	t
23	109221	ARRET CLIENT SUR VENTE  COMMERCE	CALYPSO IMMO	calysoimmo	Madame	dubreuil	contact@calypso-immo.fr	160201000	nan	2021-06-21 07:59:10.037516	t
24	109220	INACTIF-ARRET COLLABORATION	PROXIMMONET	proximmonet	Madame	morillon sylvie	gerance@proximmonet.fr	177351907	509 928 511 00054	2021-06-21 07:59:10.632177	t
34	109340	ARRET DE COLLABORATION	LEGENDRE IMMOBILIER	legendreimmobilier	Monsieur	legendre	cabinet.legendre@wanadoo.fr	139315200	nan	2021-06-21 07:59:18.142875	t
25	109950	INACTIF	AGENCE COEURET - IMMOBILIER	ccimmobiliergestion	Madame	cochet patricia	vabbou@coeuretimmobilier.com	nan	nan	2021-06-21 07:59:11.474693	t
30	109600	ARRET DE COLLABORATION	BR IMMOBILIER	brimmobilier	Monsieur	gavard pierre\nbeillerot cyril	br-immobilier@wanadoo.fr	556900144	nan	2021-06-21 07:59:15.217552	t
26	109230	ARRET  COLLABORATION	CABINET LUTZ	cabinetlutz	Monsieur	lutz damien	contact@cabinet-lutz.fr	241877050	nan	2021-06-21 07:59:12.135317	t
27	109310	INACTIF	.	\N	Mr et Mme	moreira da silva / dos santos	louislopez77@aol.com	164330865	nan	2021-06-21 07:59:12.887884	t
28	109500	ARRET DE COLLABORATION	LAFORET - AQUI'INVEST 2 SARL	laforet	Monsieur	ridou vincent	villenavedornon@laforet.com\nvridou@laforet.com	556491000	nan	2021-06-21 07:59:13.691424	t
31	109452	ARRET DE COLLABORATION	SARL IMMOASSOCIES GESTION	immoassociesgestion	Madame	barret stéphanie	immoassociesgestion@wanadoo.fr	556984545	nan	2021-06-21 07:59:15.95713	t
35		INACTIF	SEMAGES	\N	Monsieur	maury	adams-scott@bbox.fr	164270424	nan	2021-06-21 07:59:18.982399	t
32	109330	ARRET DE COLLABORATION	IMMO33 ORPI	orpi	Madame	klotz emmanuelle	immo33orpi@yahoo.fr	557267070	nan	2021-06-21 07:59:16.630745	t
33	109550	REPRENDRE CONTACT	LAFORET ASF IMMO ANTONY	laforetantony	Madame	jouas barbara	antony@laforet.com	nan	nan	2021-06-21 07:59:17.470262	t
36	109350	INACTIF	BRILLANT IMMOBILIER	\N	Monsieur	brillant charles	brillant.immobilier@wanadoo.fr	164303050	nan	2021-06-21 07:59:19.610038	t
37	109360	INACTIF	CAP SARL	\N	Madame	castro	cap.sarl@wanadoo.fr	nan	nan	2021-06-21 07:59:20.274657	t
38	109370	INACTIF	SCI CHALAND GIROUST BUSSY	\N	Monsieur	maillard laurent	laurent@aivb.net	660946392	nan	2021-06-21 07:59:21.055209	t
39	109380	INACTIF	SCI PLM	\N	Monsieur	maillard laurent	laurent@aivb.net	660946392	nan	2021-06-21 07:59:21.772797	t
40	109390	INACTIF	SCI PM INVESTISSEMENT	\N	Monsieur	maillard laurent	laurent@aivb.net	660946392	nan	2021-06-21 07:59:22.509379	t
41	109400	INACTIF	ARM - VI	\N	Monsieur	judet de la combe frédéric	frederic@arm-vi.fr	nan	nan	2021-06-21 07:59:23.298927	t
42	109410	ARRET DE COLLABORATION	DB IMMO - LAFORET\nLAFORET - DB IMMO	laforet	Madame	carmona mélanie\nsanteri ségolène	mcarmona@laforet.com\nlormont@laforet.com	557800585	nan	2021-06-21 07:59:23.960546	t
43	109420	INACTIF	CABINET GUILLOUX	cabinetguilloux	Madame	guilloux marie-françoise	cabinetguilloux@free.fr	607512958	nan	2021-06-21 07:59:24.753094	t
44	109430	INACTIF	SOLVIMO	\N	Monsieur	duval eoche	nantes@solvimo.com	662531738	nan	2021-06-21 07:59:25.381732	t
45	109440	INACTIF	AGENCIA	\N	Monsieur	bumba emmanuel	agencia.sarl@wanadoo.fr	164024044	nan	2021-06-21 07:59:26.040358	t
46	110280	ARRET DE COLLABORATION	LAFORET IMMOBILIER SARL RPI	laforetimmobiliersarlrpi	Madame	perrin marianne	mperrin@laforet.com	557874848	nan	2021-06-21 07:59:26.845893	t
268	122010	CLIENT PARTICULIER	.	\N	Monsieur	baduel olivier	baduel@free.fr	nan	nan	2021-06-21 08:03:56.614399	t
47	109470	CLIENT inactif	AMCV - APPARTEMENTS ET MAISONS	amcvappartementsetmaisons	Madame	pannetier aurore    pannetier philippe	chaville@appartementsetmaisons.fr	01 76 43 14 23	509 243 820 00024	2021-06-21 07:59:27.570478	t
48	109630	ARRET DE COLLABORATION	PORTBAIL IMMOBILIER	\N	Monsieur	vignaud olivier	portbail.cb@portbail-immo.fr	556380000	nan	2021-06-21 07:59:28.554914	t
49	109460	ARRET SUITE VENTE DU COMMERCE	A.D.N. immobilier-  GUY HOQUET	\N	Madame	landon ketty	paris9est@ghpatrimoine.com	nan	nan	2021-06-21 07:59:29.145576	t
66	109650	ARRET DE COLLABORATION	LAFORET IBPB	laforetibpb	Madame	de munico estelle	edemunico@laforet.com	556462832	nan	2021-06-21 07:59:42.251072	t
50	109480	INACTIF	CABINET LEFEVRE ET DUCHARME	cabinetlefevreetducharme	Madame	lefevre florence    lafevre  francoise	gerance@lefevreducharme.com	01 46 05 03 84	785 307 620 00019	2021-06-21 07:59:29.825187	t
51	109490	ARRET DE COLLABORATION	LUZARCHES IMMOBILIER	\N	Monsieur	mansoux michel	luzarches@laforet.com	134712000	nan	2021-06-21 07:59:30.6767	t
52	109510	ARRET  COLLABORATION	AGENCITY	agencity	Madame	greux charlotte	charlotte.greux@agencity.com	164773063	nan	2021-06-21 07:59:31.759081	t
53	109520	INACTIF	CENTURY 21 COMBAULT IMMOBILIER	\N	Monsieur	heng guy	combault.immobilier@century21france.fr	160285165	nan	2021-06-21 07:59:32.545631	t
54	109530	INACTIF	PARTNER IMMOBILIER	\N	Madame	chambrin pascaline	Partner-immobilier@wanadoo.fr	134668787	nan	2021-06-21 07:59:33.186263	t
55	109540	INACTIF	JEP BOIS	\N	Madame	rosey evelyne	nan	nan	nan	2021-06-21 07:59:34.300626	t
56	109560	ARRET DE COLLABORATION	J M IMMOBILIER	\N	Monsieur	joubert alain	jmimmojoubert@cegetel.net	139334141	nan	2021-06-21 07:59:35.001224	t
57	109570	INACTIF	ALBERT 1ER IMMOBILIER	\N	Madame	sineux	info@albert1er-immobilier.fr	nan	nan	2021-06-21 07:59:35.748798	t
58	109580	INACTIF / ARRET COLLABORATION	AGENCE HOTEL DE VILLE	\N	Madame	fortin elodie	ef.ahdv@orange.fr	nan	nan	2021-06-21 07:59:36.463387	t
59	109590	INACTIF	CABINET LATY	\N	Madame	guhur céline	gest1ph1.laty@free.fr\ngest1phl.laty@free.fr	nan	nan	2021-06-21 07:59:37.057046	t
60	109620	ARRET DE COLLABORATION	CENTURY 21 A.S.M	\N	Madame	brochard hélène	ag490@century21france.fr	164208877	nan	2021-06-21 07:59:37.850594	t
61	109610	ARRET DE COLLABORATION	SCI 5 BOULES	\N	Monsieur	gavard pierre	sylvaingavard@yhaoo.fr	nan	nan	2021-06-21 07:59:38.496224	t
62	109630	ARRET DE COLLABORATION	LAFORET CBR	\N	Monsieur	broc christophe	cbroc@laforet.com	nan	nan	2021-06-21 07:59:39.142852	t
63	109650	INACTIF	ORPI CP IMMO	orpicpimmo	Monsieur	perrin christophe	cperrin.cpimmo@orpi.com\ngestionlocation@cpimmo.fr	01 46 01 53 90	483525887	2021-06-21 07:59:40.010356	t
64	109640	ARRET DE COLLABORATION	.	\N	Madame	mancel pacome	pacome.mancel@styrolution	nan	nan	2021-06-21 07:59:40.683971	t
67	109670	INACTIF	CABINET LOGEAIS- ORPI	orpi	Monsieur	logeais jean-philippe	cabinetlogeais@orpi.com	546417668	nan	2021-06-21 07:59:42.912699	t
65	110360	CLIENT inactif	SARL AGENCE LE NY	laforetagenceleny	Madame	mr bertin thomas	colombes@laforet.com	01 49 09 99 11  / 01 42 42 25 62	71201020600019	2021-06-21 07:59:41.430543	t
68	109660	INACTIF	.	\N	Madame et Monsieur	sourdois	info@albert1er-immobilier.fr	nan	nan	2021-06-21 07:59:43.699243	t
75	109700	ARRET DE COLLABORATION	AGENCE NICOLAS FONTAINE	massonimmobilier	Monsieur	fontaine nicolas	stgilles.huitcinq@orange.frinfo85@massonimmobilier.fr	nan	nan	2021-06-21 07:59:48.995212	t
69	109661	ARRET DE COLLABORATION	CB CONSEILS	laforetchambly	Madame	bonet catherine	chambly@laforet-chambly-meru.com	nan	nan	2021-06-21 07:59:44.319891	t
70	109662	CLIENT ACTIF	L'ADRESSE LAU DES NAIADES FONTENAY LE COMTE	l'adresselaudesnaiades	Madame	thibaud-guilbaud	immobilier-sud-vendee@wanadoo.fr	nan	52023191100022	2021-06-21 07:59:45.047472	t
71	109663	CLIENT INACTIF	L'ADRESSE LAU DU MARAIS	l'adressechaillelesmaraislaudumarais	Madame	ravon elodie	laudumarais@club-internet.fr	251567257	447696329039	2021-06-21 07:59:46.041904	t
76	109710	ARRET DE COLLABORATION	BUHLER FRANTZ	buhlerfrantz	Monsieur	buhler frantz	bupa@bupa.pro	nan	nan	2021-06-21 07:59:49.711801	t
72	109680	INACTIF	ERA AAA IMMOBILIER	eraimmobilier	Monsieur	denman	aaa@erafrance.com	nan	nan	2021-06-21 07:59:46.765488	t
73	109690	CLIENT INACTIF	VENDIMO	vendimo	Monsieur	barbe olivier	obarbe@vendimo.fr	251059468	nan	2021-06-21 07:59:47.596012	t
80	109745	ARRET  COLLABORATION	MGL - OLONNE SUR MER 85	magestionlocative	Monsieur	houle fabrice	f.houle@ma-gestion-locative.com	nan	nan	2021-06-21 07:59:52.467223	t
74	109840	INACTIF	MARANS IMMOBILIER	maransimmobilier	Monsieur	maitrehut julien	contact@marans-immobilier.com	546678822	nan	2021-06-21 07:59:48.21366	t
77	109730	INACTIF	SARL AGENCE IMMOBILIERE DU LAC	century21adlimmobilier	Madame	gilet micheline	ag2371@century21france.fr	240785512	nan	2021-06-21 07:59:50.302463	t
78	109720	ARRET DE COLLABORATION	LD IMMOBIIER	laforetblanquefort	Monsieur	araujo sandrine	lduvert@laforet.com	nan	nan	2021-06-21 07:59:51.086014	t
79	109746	INACTIF	HUIT CINQ GESTION	huitcinqimmobilier	Monsieur	houle fabrice	f.houle@mon-departement-immobilier.comlocation@huitcinq.com	nan	nan	2021-06-21 07:59:51.750634	t
81	109850	ARRET DE COLLABORATIONS UITE VENTE	GTN CONSEILS ET PATRIMOINE	gtnimmobilier	Madame	landon ketty	paris9est@ghpatrimoine.com	660692544	nan	2021-06-21 07:59:53.252775	t
83	109750	ARRET  COLLABORATION	OFFICE DE LA PROPRIETE	officedelapropriete	Monsieur	canut jacques	office.propriete@wanadoo.fr	nan	nan	2021-06-21 07:59:54.906826	t
82	109740	INACTIF	BLEU MARINE IMMOBILIER	century21bleumarine	Madame	pignon isabelle	i.pignon@century21.fr	251553265	nan	2021-06-21 07:59:54.061311	t
84	190720	ARRET DE COLLABORATION	MGL - IMMO 44	immo44cielimmobilier	Monsieur	houle fabrice	igautier@quatrequatre.com	nan	nan	2021-06-21 07:59:55.663402	t
85	109750	CLIENT ACTIF	ETUDE MAITRE KERAVEC	etudemaitrekeravecnotaire	Madame	legrand sophie	locationgestion.44083@notaires.fr	251740202	nan	2021-06-21 07:59:56.450943	t
86	109760	VEDU A BP IMMOBILIER	HC TRANSACTION	l'adressepontaultcombault	Madame	ludmi isabey	ludmi.isabey@ladresse.comlaetitia.caillebotte@ladresse.com	nan	nan	2021-06-21 07:59:57.198515	t
87	109760	INACTIF	SARL IMMOVINS	abciorpigestion	Madame	deloffre knopfer babara	barbaraknopfer@abci13.fr	nan	nan	2021-06-21 07:59:57.765191	t
88	109770	ARRET DE COLLABORATION	MOINET	moinet	Mr et Mme	moinet	fred.moinet@gmail.com\nlacasamoinet@gmail.com	nan	nan	2021-06-21 07:59:58.505768	t
89	109780	ARRET DE COLLABORATION	BUHLER HUGO	buhlerhugo	Monsieur	buhler hugo	huitresenstock@hotmail.fr	nan	nan	2021-06-21 07:59:59.191373	t
90	109790	INACTIF	PYRAULT LAURENT	pyraultlaurent	Monsieur	pyrault laurent	laurent.pyrault@free.fr	nan	nan	2021-06-21 07:59:59.781041	t
91	109800	ARRET DE COLLABORATION	TIKVA IMMOBILIER	tikvaimmobilier	Monsieur	benaroche sholmi	tikvaimmo@gmail.com	nan	nan	2021-06-21 08:00:00.752483	t
92	109810	REPRENDRE CONTACT	JEROME COMBES IMMOBILIER	guyhoquet	Monsieur	combes jerôme	j.combes@guyhoquet.com	nan	nan	2021-06-21 08:00:01.859185	t
107	109970	ARRET  COLLABORATION	IMMO ONLINE	immoonline	Monsieur	wulwik nathaniel	wulwik@gmail.com	nan	nan	2021-06-21 08:00:19.650705	t
93	109820	REPRENDRE CONTACT	AGENCE ULYS PATELY IMMOBILIER	agenceulyspatelyimmobilier	Madame	lemoine liliane	ulyslemoine@free.fr	nan	nan	2021-06-21 08:00:03.004236	t
94	109860	REPRENDRE CONTACT	SBSI - LES PAVES DU 20E	lespavesdu20e	Monsieur	hennel	hennel@lespavesdu20e.fr	646474077	nan	2021-06-21 08:00:03.935704	t
122	110070	ARRET DE COLLABORATION	HAMON Antoine	hamonantoine	Monsieur	hamon antoine	antoine.hamon.fr@gmail.com	nan	nan	2021-06-21 08:00:38.769759	t
95	109830	ARRETA DE COLLABORATION	MARLERE Jacques	marlerejacques	Monsieur	marlere jacques	jm.marlere@free.fr	nan	nan	2021-06-21 08:00:04.926136	t
108	109761	CLIENT ACTIF	IMMOBILIERE BUSSY GESTION GUY HOQUET SERRIS	guyhoquetserrisimmobilierebussygestion	Madame	chareyre caroline	caroline.chareyre@guyhoquet.com	0160049449	479 270 803 00030	2021-06-21 08:00:20.85202	t
96	109900	REPRENDRE CONTACT	SARL RECHERCHE IMMOBILIERE	rechercheimmobiliere	Monsieur	petrus sylvain	petrus@recherche-immobiliere.com	nan	nan	2021-06-21 08:00:05.797642	t
97	109870	ARRET DE COLLABORATION	LAFORET SAINT MEDARD EN JALLES	laforetsaintmedardenjalles	Madame	branchut stéphanie	st-medard-en-jalles@laforet.com	nan	nan	2021-06-21 08:00:06.886017	t
117	110040	ARRETA DE COLLABORATION	.	sauboy	Mr et Mme	sauboy	martine.sauboy@wanadoo.fr	nan	nan	2021-06-21 08:00:31.105148	t
98	109880	INACTIF	nan	citya	Madame	marty audrey	amarty@citya.com	nan	nan	2021-06-21 08:00:07.753518	t
99	109890	INACTIF-ARRET COLLABORATION	MR & MME SENIUTA	\N	Monsieur	seniuta	pseniuta@yahoo.fr	nan	nan	2021-06-21 08:00:08.760943	t
109	1075492	VEDU A 3B ARDOISIERES	FONCIERE ANJOU	l'adresse	Monsieur	vernier esnault	fonciere.anjou@wanadoo.fr	241875525	nan	2021-06-21 08:00:22.542051	t
100	109910	REPRENDRE CONTACT	AGENCE MARTIN	agencemartincoteseineorpi	Madame	geultont karine	agmartincoteseine@orpi.com	nan	nan	2021-06-21 08:00:10.408003	t
101	109920	REPRENDRE CONTACT	SRJG GESTION - PARIS EST GESTION SARL	parisestgestion	Madame	garin julie - routaboul sabrina	s.routaboul@peg-immo.fr	175774375	nan	2021-06-21 08:00:11.659285	t
102	109930	INACTIF-ARRET COLLABORATION	ANSELYN Philippe	\N	Monsieur	anselyn philippe	philippeanselyn@sfr.fr	nan	nan	2021-06-21 08:00:12.750657	t
103	109940	INACTIF	.	\N	Monsieur	gibaud robert	nan	nan	nan	2021-06-21 08:00:14.055909	t
104	109931	ARRET DE COLLABORATION	RENAULT Florent	renaultflorent	Monsieur	renault florent	flrenault@free.fr	nan	nan	2021-06-21 08:00:15.240231	t
110	109991	ARRET DE COLLABORATION	MAISONS ET COMPAGNIE	maisonsetcompaganie	Monsieur	miltgen françois	maisonsetcompagnie@orange.fr	241182050	nan	2021-06-21 08:00:23.634424	t
105	109960	CLIENT INACTIF	CTII SARL IMMOBILIERE LA TOUR	immobilierelatour	Monsieur	kintgen alexis    m dannay jerome	immolatour@orange.fr     jerome.dannay@wanadoo.fr	01 45 03 30 70	341 681 898 00043	2021-06-21 08:00:17.084177	t
106	109950	ARRET DE COLLABORATION SUITE VENTE	IMMO MAYENNE	immomayenne	Monsieur	bouillier olivier	info@immomayenne.com	nan	nan	2021-06-21 08:00:18.32047	t
111	109985	CLIENT ACTIF	4 IMMO	l'adresse4immo	Monsieur	pennanec'h  thierry	nan	02 40 69 15 60	44762160800051	2021-06-21 08:00:24.664838	t
118	110041	ARRETA DE COLLABORATION	PGI LAFORET	pgilaforet	Madame	de munico estelle	edemunico@laforet.com	nan	nan	2021-06-21 08:00:32.090584	t
112	101000	SUSPENDU	ATARAXIA	ataraxia	Madame	\N	nan	nan	nan	2021-06-21 08:00:25.628283	t
113	110010	ARRET DE COLLABORATION	DOMUS AGENCY	laforetimmobilier	Monsieur	alexandre dominique	paris20avron@laforet.com	144648181	nan	2021-06-21 08:00:26.568745	t
129	110120	CLIENT INACTIF	AGENCE CENTRALE SARL	acbi	Monsieur	bouton alain	acbi-vertou-1@orange.fr	02 51 23 68 88	nan	2021-06-21 08:00:45.893684	t
114	110350	ARRET  COLLABORATION	ADRAST IMMOBILIER	adrastimmobilier	Monsieur	adrast emmanuel	eadrast@adrastimmobilier	608271839	nan	2021-06-21 08:00:27.528196	t
115	110020	CLIENT PARTICULIER	.	\N	Monsieur	fougerouse christian	nan	nan	nan	2021-06-21 08:00:28.469658	t
119	110080	CLIENT INACTIF	SARL AJC IMMOBILIER ROCHEFORT	ajcimmobilier	Monsieur	lacoste jean christophe / \tpalimpseste	gestion@ajc-rochefort.com	546881717	41351986900023	2021-06-21 08:00:33.651693	t
116	110030	CLIENT INACTIF	SARL SHANDRANI	vrignonimmobilier	Monsieur	vrignon michel	michel@vrignon-immobilier.com	nan	nan	2021-06-21 08:00:29.421115	t
123	110072	INACTIF	EURL GADEL IMMOBILIER	gadelimmobilier	Madame	gadel carole	gadelimmobilier@orange.fr	nan	nan	2021-06-21 08:00:39.699231	t
120	110100	INACTIF	SARL CITYA IMMOBILIER COTE DE BEAUTE	cityaimmobiliercotedebeaute	Monsieur	ploermel	m.nicolet@citya.com	546051213	nan	2021-06-21 08:00:35.158828	t
121	110060	CLIENT INACTIF	L'IMMOBILIERE DU SUD	l'adresselachevroliere	Monsieur	chailleux jérôme	jerome.chailleux@hotmail.fr	nan	nan	2021-06-21 08:00:37.836295	t
126	110100	ARRET DE COLLABORATION	PLANETE IMMOBILIER	planeteimmobilier	Madame	jore rachele	gestion@planete-immobilier-toulouse.fr	nan	nan	2021-06-21 08:00:42.453651	t
124	110080	ARRETA DE COLLABORATION	BARANGER Thierry	barangerthierry	Monsieur	baranger thierry	drbaranger@yahoo.fr	nan	nan	2021-06-21 08:00:40.615702	t
128	110120	ARRETA DE COLLABORATION	SARL SIBEM	laforetsaintloubes	Madame	pichot virginie\ncaillet elodie	st-loubes@laforet.com	nan	nan	2021-06-21 08:00:44.658389	t
125	110090	ARRET  DE COLLABORATION	LALOY Philippe	laloyphilippe	Monsieur	laloy philippe	gestion@planete-immobilier-toulouse.frphilaloy@gmail.com	nan	nan	2021-06-21 08:00:41.633122	t
127	110110	CLIENT INACTIF	BOILEAU IMMOBILIER	boileauimmobilier	Madame	boileau jennifer	boileau.immobilier@wanadoo.fr	nan	nan	2021-06-21 08:00:43.453082	t
130	110140	ARRET DE COLLABORATION	IMMOVAC	\N	Monsieur	delage ludivic	ludovic.delage@immovac.fr	557520620	nan	2021-06-21 08:00:47.186942	t
131	110130	ARRET DE COLLABORATION	DELTA IMMOBILIER	deltaimmobilier	Monsieur	delage ludovic	ludovic.delage@immovac.frdeltaimmobilier@wanadoo.fr	603678572	nan	2021-06-21 08:00:48.292308	t
132	110160	REPRENDRE CONTACT	JMELI IMMO	guyhoquetparis11voltaire	Monsieur	landzberg	paris11voltaire@guyhoquet.com	140095460	nan	2021-06-21 08:00:50.116264	t
133	110165	REPRENDRE CONTACT	CABINET SIONNEAU IMMOBILIER	cabinetsionneau	Madame	guignard nadine	cabinet@sionneau-immobilier.fr	251370909	42369341500014	2021-06-21 08:00:51.325571	t
134	110150	ARRET DE COLLABORATION	MAUMY PARADE Brigitte	maumyparadebrigitte	Madame	maumy parade brigitte	brigitte.parade@gmail.com	nan	nan	2021-06-21 08:00:53.175513	t
135	110170	REPRENDRE CONTACT	SARL HORIZON	etoileimmobiliere	Madame	porret joubert stéphanie	contact@etoile-immobiliere.com	02 41 39 90 39	79975707500012	2021-06-21 08:00:54.398812	t
150	110240	ARRET  COLLABORATION	Cabinet gestion ISNER	l'adressebussysaintgeorges	Madame	isner peggy	gestion@cgi-bussy.com	01 64 66 44 44	nan	2021-06-21 08:01:16.113384	t
136	110075	ARRET  COLLABORATION	SERGIC ANGERS	sergic	Monsieur et Madame	dorchie cecile	ivilleroche@sergic.com	nan	nan	2021-06-21 08:00:55.875966	t
137	110080	CLIENT INACTIF	ABC IMMOBILIER	abcimmobilier	Madame	barbier nathalie et equipe .	nathalie@abc-immobilier-angers.fr et contact@abc-immobilier-angers.fr	nan	nan	2021-06-21 08:00:57.489043	t
138	110090	CLIENT PARTICULIER	.	\N	Monsieur et Madame	guivant yannick et cosson elodie	yannickguivant@gmail.com	nan	nan	2021-06-21 08:00:59.254036	t
139	110092	REPRENDRE CONTACT	VIVRE ICI	vivireici	Monsieur	trehard emanuel	nan	241800600	nan	2021-06-21 08:01:00.766166	t
151	110250	CLIENT INACTIF	AGILIMMO VENDEE	huitcinqchallans	Monsieur	horel gilles	challans@huitcinq.com	228120366	nan	2021-06-21 08:01:17.540566	t
140	110180	ARRETA DE COLLABORATION	ACHETER DU NEUF	acheterduneuf	Madame	maumy parade brigitte	contact@acheterduneuf.com	nan	nan	2021-06-21 08:01:02.179357	t
141		REPRENDRE CONTACT	CABINET BERARD	cabinetberard	Monsieur	berard	nan	nan	nan	2021-06-21 08:01:03.886381	t
159	110320	ARRET DE COLLABORATION	HEKIMIAN Nicolas	hekimiannicolas	Monsieur	hekimian nicolas	nicolashekimian@yahoo.fr	nan	nan	2021-06-21 08:01:37.093338	t
142	110091	ARRET DE COLLABORATION	BL AGENT	blagent	Monsieur	minelli	m.minelli@bl-agents.fr	677464965	nan	2021-06-21 08:01:05.224614	t
152	110260	REPRENDRE CONTACT	ACI - AGENCE CONSEILS IMMOBILIER SARL	aciimmobilier	Monsieur	desseaux philippe	aci-immobilier@wanadoo.fr	145462222	nan	2021-06-21 08:01:18.838825	t
143	110190	ARRET DE COLLABORATION	GEORGE V SARL YAPLUKA	georgevsarlyapluka	Madame	bonnetaz marina	georges5@orange.fr	nan	nan	2021-06-21 08:01:07.274445	t
144	110100	INACTIF-ARRET COLLABORATION	SARL LD IMMOBILIER	laforet	Monsieur	da costa laurent	ldacosta@laforet.com	156950900	nan	2021-06-21 08:01:08.540718	t
145	110110	CLIENT INACTIF	SARL ACTIAL	carquefouimmobilier	Monsieur	rihet christophe	carquefou.immobilier@wanadoo.fr	240526690	nan	2021-06-21 08:01:09.693058	t
153	110262	INACTIF-ARRET COLLABORATION	AURA IMMOBILIER SARL	auraimmobilier	Monsieur	balestra laurent	lbalestra@hotmail.fr	0143626870	nan	2021-06-21 08:01:20.356954	t
146	110200	ARRET DE COLLABORATION	SARL LFI	avisimmobiliersaintloubes	Madame	fline puentes sylvie	stloubes@avis-immobilier.com	556202080	nan	2021-06-21 08:01:11.094256	t
147	110210	ARRET DE COLLABORATION	Groupe BIRAN IMMOBILIER	groupebiranimmobilier	Madame	gessey dany	soulac@biran.fr	608256764	nan	2021-06-21 08:01:12.302567	t
165	110350	INACTIF-ARRET COLLABORATION	CABINET TRAGESIM	\N	Madame	gustave véronique	gerance.tragesim@orange.fr	0141100866	nan	2021-06-21 08:01:52.749374	t
148	110220	INACTIF	SAS BP IMMOBILIER	l'adressechatillon	Monsieur	printemps rudy	rudy.printemps@ladresse.com	0147350000	53946287900013	2021-06-21 08:01:13.817699	t
154	110270	CLIENT ACTIF	POOL IMMOBILIER SABLAIS	poolimmobiliersablais	Monsieur	vercelletto antoine	locannuelles@poolimmosablais.com	02 51 95 40 54	48738036200011	2021-06-21 08:01:22.478738	t
149	110230	CLIENT ACTIF	GUY HOQUET AERISSIMO SARL	guyhoquetaerissimo	Monsieur	bobin gilles	antony@guyhoquet.com	0156451616	45249861100014	2021-06-21 08:01:14.889085	t
160	110330	ARRET  COLLABORATION	GIMCOVERMEILLE POISSY - CABINET FISSON	gimcovermeillepoissycabinetfisson	Madame	francois marion	marion.francois@gimcovermeille.com	130650450	nan	2021-06-21 08:01:38.605474	t
155	110290	REPRENDRE CONTACT	LOGIC HOME	logichome	Monsieur	laruelle mickaël	logichome.ml@gmail.com	nan	nan	2021-06-21 08:01:24.886359	t
156	110300	ARRET  COLLABORATION	A&G PAUTOUT IMMOBILIER	l'adressecabinetpautout	Monsieur	pautout guillaume	gpautout@orange.fr	nan	42185010800018	2021-06-21 08:01:27.016141	t
161	110332	REPRENDRE CONTACT	KB IMMOBILIER SARL	kbimmobilier	Monsieur	rousseau gilles	nathalie.sauguet@century21.fr	153141087	nan	2021-06-21 08:01:41.454841	t
157	110310	ARRET DE COLLABORATION	BUHLER BERNARD	buhlerbernard	Monsieur	buhler bernard	contact.buhler@gmail.com	nan	nan	2021-06-21 08:01:29.980443	t
158	110340	ARRET DE COLLABORATION SUITE VENTE	EFFIGEST IMMO	effigestimmo	Madame	norguet carole	gestion@effigest-immo.fr	251950753	nan	2021-06-21 08:01:32.026273	t
162	110360	CLIENT ACTIF	CITYA NANT'IMMO	cityanantes	Madame	vancappel sandra	svancappel@citya.com	02 40 48 75 40	nan	2021-06-21 08:01:44.190275	t
166	110370	CLIENT ACTIF	SAINT AMBROISE IMMOBILIER	laforetsaintambroise	Monsieur	rochon christophe	paris11stambroise@laforet.com	01 47 00 01 00	80207116700018	2021-06-21 08:01:57.698067	t
163	110332	REPRENDRE CONTACT	GIMCOVERMEILLE CONFLANS	gimcovermeilleconfalans	Madame	mendes marie-josé	mj.mendes@gimcovermeille.com	nan	nan	2021-06-21 08:01:47.136588	t
164	110333	REPRENDRE CONTACT	GIMCOVERMEILLE VOISIN	gimcovermeillevoisin	Madame	festor michèle	michele.festor@gimcovermeille.com	nan	nan	2021-06-21 08:01:49.587185	t
167	110390	CLIENT INACTIF	ICY IMMOBILIER COURONNE YONNAISE	icyimmobilier	Monsieur	graindorge didier	icyimmobilier@orange.fr	0251987975	nan	2021-06-21 08:01:58.679506	t
169	110382	INACTIF-ARRET COLLABORATION	SARL MIMAS GESTION	cabinetmimas	Monsieur	hoarau   pierre laurent	info@mimas-gestion.fr	nan	42473973800013	2021-06-21 08:02:02.378386	t
168	110380	REPRENDRE CONTACT	CARVEL ET ASSOCIES	carveletassocies	Madame	tauvel laurence	contact@carvelimmo.com	nan	nan	2021-06-21 08:02:00.703344	t
172	110390	REPRENDRE CONTACT	DUPONT ET POISSANT CONSEILS IMMOBILIER	compromisimmobilier	Monsieur	dupont mathieu	mathieu.dupont@compromis-immoblier.fr	nan	nan	2021-06-21 08:02:07.081692	t
170	110384	INACTIF-ARRET COLLABORATION	CABINET HOARAU MIMAS IMMOBILIER	cabinethoarau	Monsieur	hoarau laurent	gestion@mimas-immobilier.fr	01 53 33 89 40	809763832	2021-06-21 08:02:03.778584	t
171	110385	ARRET  COLLABORATION	MANDAT&MOI	mandat&moi	Monsieur	monin thomas	thomas.monin@mandatetmoi.fr	659929449	nan	2021-06-21 08:02:05.839403	t
173	123490	CLIENT ACTIF	LABEL IMMO 85	l'adresselabelimmo85	Monsieur	teillol gilles	larochesuryon@ladresse.com	251373808	51092080400026	2021-06-21 08:02:08.333974	t
174	110400	REPRENDRE CONTACT	MLY IMMOBILIER	ladhuysimmobilier	Monsieur	diaby	contact@ladhuys.com	nan	nan	2021-06-21 08:02:09.367386	t
175	110405	REPRENDRE CONTACT	SGI 11 S.A.S	eracharonnebastille	Madame	yeung stéphanie	stephanie.yeung@era-charonne.fr	0143707575	79164707600011	2021-06-21 08:02:10.446765	t
176	110450	['mgl', '-', 'laforet', 'immobiliere', 'de', 'royan']	MGL - IMMOBILIERE DE ROYAN	mgllaforetimmobilierederoyan	Madame	asselin aline	royan@laforet.com	0546061443	47772963600019	2021-06-21 08:02:11.582116	t
177	110410	CLIENT PARTICULIER	.	.	Monsieur	fraikin alexis	alexisfraikin@gmail.com	nan	nan	2021-06-21 08:02:12.662498	t
178	110412	CLIENT PARTICULIER	.	.	Madame	journee elisabeth	elisabeth.journee@iadfrance.fr	nan	nan	2021-06-21 08:02:14.288568	t
179	110420	['imonet']	IMONET SASU	imonet	Monsieur	gautheret quentin (gerant) sebaoun vanessa (respsb. ag)	contact@imonet.fr	0164440682	53229059000027	2021-06-21 08:02:15.330971	t
180	110430	REPRENDRE CONTACT	BELIMMO	belimmo	Monsieur	garcia jean	beladmin@belimmo.com	nan	nan	2021-06-21 08:02:16.3224	t
181	110440	CLIENT PARTICULIER	.	.	Madame	raye karine	karinerg68@orange.fr	nan	nan	2021-06-21 08:02:17.358809	t
194	110550	ARRET DE COLLABORATION SUITE VENTE	MGL - PORTES DE L OCEAN	agenceportedelocean	Madame	ronineau pauline	paulinerobineau@agence-portes-ocean.com	0251307323	nan	2021-06-21 08:02:33.675683	t
182	110450	REPRENDRE CONTACT	ADN GESTION TRANSACTION	l'adresseadngestiontransaction	Monsieur	pequito sylvain	adngestion@ladresse.com	nan	nan	2021-06-21 08:02:18.296275	t
183	10510	CLIENT ACTIF	CENTRAL IMMOBILIER	centralimmobilierjeremygarcia	Monsieur	garcia jérémy	central@central-immobilier-85.com	0251236888	34969437200039	2021-06-21 08:02:19.988305	t
184	110460	REPRENDRE CONTACT	JB IMMO SAS	guyhoquetjbimmo	Monsieur	gauthier bruno	locparisbastille@guyhoquet.com	nan	nan	2021-06-21 08:02:21.54841	t
195	110560	REPRENDRE CONTACT	MG APARTE	mgaparte	Madame	giordano maria	mgaparte@laposte.net	nan	nan	2021-06-21 08:02:34.642129	t
185	110470	REPRENDRE CONTACT	VIENOT ASSOCIES SARL	immobilieredeboulogne	Monsieur	sirvent-vienot charles6hugues	agencegestion@gmail.com	nan	nan	2021-06-21 08:02:23.012571	t
186	110480	CLIENT PARTICULIER	.	.	Madame	talon catherine	ktmail@sfr.fr	nan	nan	2021-06-21 08:02:24.540914	t
204	110635	REPRENDRE CONTACT	EURIGEST	eurigest	Madame	bolat olivia	mkermen@european-homes.fr	nan	nan	2021-06-21 08:02:43.662966	t
187	110490	REPRENDRE CONTACT	ACCESSIM GESTION	laforetaccessim	Madame	hassani linda	vanveslocations@laforet.com	nan	nan	2021-06-21 08:02:25.4434	t
196	110570	CLIENT ACTIF	CITYA NANTES	cityanantes	Madame	vancapel sandra	nan	02 40 48 75 40	nan	2021-06-21 08:02:35.497643	t
188	110500	CLIENT PARTICULIER	.	.	Monsieur	amory christian	christian.amory@tremblayhandball.com	nan	nan	2021-06-21 08:02:26.258929	t
189	110510	CLIENT INACTIF	SCI DESSOUS LES BERGES	scidessouslesberges	Madame	atlani natacha	natacha.atlani@gmail.com	nan	nan	2021-06-21 08:02:27.128436	t
190	110520	REPRENDRE CONTACT	CIL ATLANTIQUE	groupecilatlantique	Madame	salle céline	c.salle@cilatlantique.com	nan	nan	2021-06-21 08:02:28.027917	t
197	110580	ARRET  COLLABORATION	ETUDE IMMOBILIERE DE LILLE	etudeimmobilieredelille	Monsieur	neuet didier	contact@etudeimmodelille.com	0320158520	nan	2021-06-21 08:02:36.363145	t
191	110620	ARRET DE COLLABORATION SUITE VENTE	SARL LES HERBIERS GESTION	sarllesherbiersgestion	Monsieur	comont jean-michel	lesherbiersgestion@orange.fr	0251668061	nan	2021-06-21 08:02:29.343165	t
192	110530	ARRET  COLLABORATION	FIMOGEST	guyhoquet	Monsieur	hintermeyer	ghchelleslocation@yahoo.fr	0160089999	nan	2021-06-21 08:02:31.383997	t
210	110670	CLIENT ACTIF	SARL ELSE IMMO	saintmarsimmobiliersarlelseimmo	Madame	colomez christine	stmars.immobilier@wanadoo.fr	02 40 29 66 63	790 341 838 00031	2021-06-21 08:02:50.816877	t
193	110540	CLIENT PARTICULIER	.	.	Monsieur	simon laurent	laurent.simon.immobilier@gmail.com	nan	nan	2021-06-21 08:02:32.199529	t
198	110590	ARRET  COLLABORATION	CC IMMO	etudeimmobilieredelille	Monsieur	clybouw cédric	clbw.immo@gmail.com	0320158520	nan	2021-06-21 08:02:37.086732	t
199	110710	['agence', 'chanot']	CHANOT ROBQUIN MEAUX SAS	agencechanot	Monsieur	robquin thierry	thierryrobquin@chanotrobquin.fr	0160251616	nan	2021-06-21 08:02:38.113144	t
205	110640	CLIENT PARTICULIER	CHELOUCHE Jacques	chelouchejacques	Monsieur	chelouche jacques	emailyou@bezeqint.net	nan	nan	2021-06-21 08:02:44.471502	t
200	110600	CLIENT PARTICULIER	.	.	Monsieur	benzaki charles	charles.bzk94@gmail.com	nan	nan	2021-06-21 08:02:39.181535	t
201	110610	CLIENT INACTIF	LA RESIDENCE COTE LOCATION	laresidencecotelocation	Madame	bugel anne-sophie	gestion2@laresidence.fr	nan	nan	2021-06-21 08:02:40.203947	t
202	110625	ARRET DE COLLABORATION SUITE VENTE	SARL CELINE IMMOBILIER	sarlcelineimmobilier	Madame	tournier céline	herbimmo@orange.fr	nan	nan	2021-06-21 08:02:41.250347	t
206	110642	CLIENT PARTICULIER	.	.	Madame	burkel agnès	abl.moufle@gmail.com	nan	nan	2021-06-21 08:02:45.418963	t
203	110630	REPRENDRE CONTACT	NEXITY	giprichardiere	Madame	amaro isabel	iamaro@nexity.fr	nan	nan	2021-06-21 08:02:42.626559	t
216	110901	ARRET  COLLABORATION	SARL AOO	cabinetivigneuxdebretagne	Madame	diais	nan	09 81 62 61 46	537 642 308 00010	2021-06-21 08:02:57.537026	t
207	110644	CLIENT PARTICULIER	.	.	Monsieur	dinarque jean-denis	jddinarque@gmail.com	nan	nan	2021-06-21 08:02:46.858137	t
211	110680	CLIENT INACTIF	DIARD	diard	Madame	fougeres elodie	e.fougeres@cabinet-diard-immobilier.fr	nan	nan	2021-06-21 08:02:51.839284	t
208	110650	CLIENT INACTIF	SARL CABINET JUAN	cabinetjuan	Monsieur	rabbe olivier	cabinet-juan@wanadoo.fr	nan	nan	2021-06-21 08:02:48.215364	t
209	110660	INACTIF-ARRET COLLABORATION	SARL AGENCE AUTEUIL	guyhoquetauteuil	Madame	atlani. natacha	natacha.atlani@guyhoquet.com	01 86 95 52 62	82059122000018	2021-06-21 08:02:49.405678	t
214	110800	REPRENDRE CONTACT	NEXITY COURCELLES	nexitycourcelles	Madame	baesen nathalie	nbaesen@nexity.fr	nan	nan	2021-06-21 08:02:55.265323	t
212	110690	INACTIF-ARRET COLLABORATION	SCP LECUYER JOUAN PAULET	scplecuyerjouanpaulet	Madame	jezegou aurelie	location@glip-notiares.fr	nan	nan	2021-06-21 08:02:52.94865	t
213	110700	REPRENDRE CONTACT	SAS SABINE DE JARNAC	sabinedejarnacimmobilier	Madame	de jarnac sabine	contact@jarnac-immo.com	0147417401	nan	2021-06-21 08:02:54.037028	t
215	110900	ARRET  COLLABORATION	SARL OMLJ	cabinetiorvault	Madame	diais	nan	nan	811 884 329 00020	2021-06-21 08:02:56.284741	t
218	120110	['lelievre', 'immobilier']	SARL R.LELIEVRE	lelievreimmobilier	Madame	lelievre elisabeth	lelievre.immobilier@wanadoo.fr	0299792939	nan	2021-06-21 08:03:00.228483	t
217	110902	ARRET  COLLABORATION	SARL FMLJ	cabinetifaydebretagne	Madame	diais	nan	09 81 62 61 46	811 627 231 00012	2021-06-21 08:02:59.072145	t
219	110910	REPRENDRE CONTACT	NEXITY LAMY SAS	nexityparistrocadero	Monsieur	scholtes	nbaba@nexity.fr	nan	nan	2021-06-21 08:03:01.234907	t
220	110920	CLIENT ACTIF	FOURNY IMMOBILIER	agenceimmobiliereth.fournythierryfourny	Monsieur	fourny thierry	agence.fourny@wanadoo.fr	0240576118	43390528800042	2021-06-21 08:03:02.349268	t
221	110930	CLIENT PARTICULIER	.	.	Madame	bajard bras	bajard.luce@orange.fr	nan	nan	2021-06-21 08:03:04.414087	t
222	110940	CLIENT PARTICULIER	.	.	Monsieur	de saint perne	yves.desaintpern@gmail.com	nan	nan	2021-06-21 08:03:06.542866	t
223	110941	CLIENT PARTICULIER	.	.	Madame	lamotte	leclosdurondeau@gmail.com	nan	nan	2021-06-21 08:03:07.609256	t
312	122280	CLIENT INACTIF	nan	arthurloydlille	Monsieur	hien maxence	mhien@arthur-loyd.com	0320302218	nan	2021-06-21 08:04:32.126069	t
399	124250	['particulier']	LEGRAND FRANCIS	particulier	Monsieur	legrand francis	valeriedellerie@yahoo.fr	0642653684	nan	2021-06-21 08:05:37.149755	t
224	121045	REPRENDRE CONTACT	SARL IMMO SEBA	orpiimmosebahouilles	Monsieur	seletti philippe	nan	0139687227	32934149900047	2021-06-21 08:03:08.610685	t
239	122080	CLIENT INACTIF	SARL LE MARTRET IMMOBILIER	lemartretimmobilier	Monsieur	le martret erwan	contact@lemartretimmo.com	0298444888	44294105000019	2021-06-21 08:03:23.229511	t
225	110950	REPRENDRE CONTACT	AFR IMMOBILIER SARL	afrimmobilier	Madame	pilatte sandrine	sandrine@afr-immobilier.com	nan	nan	2021-06-21 08:03:09.595122	t
226	110960	CLIENT PARTICULIER	.	.	Madame	meire agnès	meireagnes@yahoo.fr	nan	nan	2021-06-21 08:03:10.573558	t
227	120010	CLIENT INACTIF	L'ATELIER IMMOBILIER	l'adressenantesl'atelierimmobilier	Madame	guineheux nancy	atelierimmobilier@orange.fr	02 40 522 500	49154471400018	2021-06-21 08:03:11.47904	t
240	120080	CLIENT PARTICULIER	.	.	Monsieur	kanoni	hassan.hoballah@arc.sn	nan	nan	2021-06-21 08:03:24.809609	t
228	121047	CLIENT ACTIF	OFFICE NOTARIAL ALEXANDRE MORICEAU	officenotarialalexandremoriceau	Madame	vicet karine / le pin stéphane	karine.vicet.44104@notaires.fr  moriceau.torteau@notaires.fr	0240868004	32335511500029	2021-06-21 08:03:12.410507	t
229	120020	CLIENT ACTIF	MAISON BLANCHE - L'ADRESSE LAVAL	l'adressemaisonblanche	Monsieur	blanvillain sebastien	nan	0253745554	nan	2021-06-21 08:03:13.477896	t
230	120025	ARRET  COLLABORATION	SERGIC ORLEANS	sergic	Madame	levy isabelle	ilevy@sergic.com	AM375	nan	2021-06-21 08:03:14.528294	t
241	109985	Doublon à supprimer	L'ADRESSE 4 IMMO	l'adresse4immo	Monsieur	pennanec'h thierry	gestion1@4immo.fr	0240484799	44762160800044	2021-06-21 08:03:25.691103	t
231	120030	CLIENT PARTICULIER	.	.	Madame	normand vallet christine	ch_normand@orange.fr	nan	nan	2021-06-21 08:03:15.533718	t
232	122230	PROSPECT	IMMOBILIER KEREBEL	\N	Monsieur	pedel jean-luc	jean-luc@finistereimmobilier.com	0298405262	40977820600022	2021-06-21 08:03:16.53435	t
233		CLIENT INACTIF	CHRISTINE DUMAS IMMOBILIER	christinedumasimmobilier	Madame	dumas christine	christine@christine-dumas-immobilier.fr	0298209789	nan	2021-06-21 08:03:17.601735	t
249	120140	CLIENT PARTICULIER	SCI LE LAC	.	Monsieur	raye philippe	praye@biica.fr	nan	nan	2021-06-21 08:03:34.862856	t
234	1270257	CLIENT ACTIF	SARL AGENCE DES TILLEULS	agencedestilleuls	Madame	camberlin nathalie	contact1@agencedestilleuls.fr	0546053997	349 105 288 00022	2021-06-21 08:03:18.457244	t
242	120090	CLIENT INACTIF	SARL L.V IMMOBILIER CONSEIL	cabinetmilivinlaforet	Monsieur	grondin laurent	l.grondin@milivin.fr	nan	nan	2021-06-21 08:03:26.761492	t
235	120040	ARRET  COLLABORATION	PROACTIVE IMMOBILIER 53	arthurimmolaval	Madame	hubert karine & galode thierry	k.hubert@arthurimmo.com	0243569089	518854104	2021-06-21 08:03:19.463667	t
236	120060	CLIENT INACTIF	PROFIGEST PATRIMOINE	profigestimmobilier	Monsieur	raymont eric	accueil@profigestimmobilier	0243095624	nan	2021-06-21 08:03:20.371148	t
237	120070	CLIENT ACTIF	DJC INVEST	craunotdjcinvest	Monsieur	craunot david	info@djcivest.com	0972131871	FR56494310980	2021-06-21 08:03:21.34759	t
243	120100	REPRENDRE CONTACT	CABINET TREHARD	cabinettreardvivreici	Monsieur	trehard emmanuel	e.trehard@vivreici.com	0241800600	nan	2021-06-21 08:03:27.77291	t
238	120155	CLIENT INACTIF	SARL JANIN IMMOBILIER	janinimmobilier	Monsieur	janin jean-michel	janin2@wanadoo.fr	0298804047	30696518700025	2021-06-21 08:03:22.277058	t
255	12255	['blois', 'immo']	BLOIS IMMOBILIER	bloisimmo	Madame	carpentier aurélie	contact@blois-immo.fr	0254740582	nan	2021-06-21 08:03:41.109277	t
244	120091	CLIENT PARTICULIER	COUJANDASSAMY SOUCEMARIANADIN	\N	Monsieur	coujandassamy soucemarianadin	nan	nan	nan	2021-06-21 08:03:28.876282	t
250	120150	CLIENT PARTICULIER	AMBGESTION IMMO	l'adressechavilles	Madame	franceschi marie	ambgestion@gmail.com	0147505092	nan	2021-06-21 08:03:35.796317	t
245	120092	CLIENT PARTICULIER	PICAUD MAURICE	particulier	Monsieur	picaud maurice	nan	nan	nan	2021-06-21 08:03:30.353433	t
246	122015	CLIENT INACTIF	AGENCE GRIFFON GUEGUEN IMMOBILIER	agencegriffongueguenimmobilier	Monsieur	griffon erwan	e.griffon@griffon-gueguen-immobilier.com	0298980500	nan	2021-06-21 08:03:31.292897	t
247	120120	REPRENDRE CONTACT	CABINET TAPISSIER	cabinettapissier	Monsieur	friess richard	friess@cabinettapissier.fr	0241881455	nan	2021-06-21 08:03:32.173392	t
251	120190	REPRENDRE CONTACT	AGENCE IMMOBILIERE DU CENTRE LAFORET	laforetimmobilierducnetre	Monsieur	sarrade loucheur cédric	bloisgestion@laforet.com	0254909090	439 222 654 00055	2021-06-21 08:03:36.788752	t
248	120130	ARRET  COLLABORATION	VALRIM	valrimorpi	Monsieur	marquant sébastien	nan	0238241515	08697101700040	2021-06-21 08:03:33.199806	t
252	120180	['agence', 'ati', 'thomasse', 'immobilier']	SARL HECK IMMOBILIER	agenceatithomasseimmobilier	Madame	thomasse valérie	thomasse.immobilier@gmail.com	0243280606	nan	2021-06-21 08:03:37.592289	t
258	121001	CLIENT ACTIF	SAS AAAAMB GESTION IMMOBILIERE	l'adresse4ambgestionimmo	Madame	franceschi marie	4ambgestion@gmail.com	0147505092	802 248 476 00029	2021-06-21 08:03:44.027605	t
253	120160	CLIENT ACTIF	OFFICE MAITRE DARPHIN	officemaitredarphin	Monsieur	darphin jean-christophe	etude.darphin@notaires.fr	0243537710	nan	2021-06-21 08:03:38.771614	t
254	120170	CLIENT INACTIF	SARL DE BERRANGER	\N	Monsieur	de berranger philippe	cabinet-de-berranger@wanadoo.fr	nan	nan	2021-06-21 08:03:40.082863	t
256	12220	CLIENT INACTIF	SARL MAITE MARTEAU	maitemarteau	Madame	marteau berceron ingrid	f.leroux@maite-marteau.com	0243249266	nan	2021-06-21 08:03:42.194654	t
257	121000	CLIENT ACTIF	PODELIHA	podeliha	Madame	adam patricia	padam@podeliha.fr	0241687754	05720113900029	2021-06-21 08:03:43.073152	t
261	121002	CLIENT PARTICULIER	SCI ROCHER	\N	Monsieur	rocher jean charles	zephz35@gmail.com	nan	nan	2021-06-21 08:03:46.72506	t
259	121050	ARRET  COLLABORATION	SARL OUEST BRETAGNE IMMOBILIER	obi29	Monsieur	kerebel damien	damien.kerebel@obi29.fr	0298217854	nan	2021-06-21 08:03:44.894108	t
260	121020	['avis', 'immobilier', 'loudeac']	SARL LOUDEAC IMMOBILIER	avisimmobilierloudeac	Madame	bertho le dantec brigite	b.bertho@avis-immobilier.com	0296282828	nan	2021-06-21 08:03:45.740626	t
262	121003	CLIENT PARTICULIER	CANNELLE ALEXANDRE	\N	Monsieur	cannelle alexandre	cannellealex@gmail.com	nan	nan	2021-06-21 08:03:47.539596	t
263	121010	REPRENDRE CONTACT	HP CONSEILS IMMOBILIER	laforethpconseils	Monsieur	pelon hervé	garches@laforet.com	nan	nan	2021-06-21 08:03:48.367121	t
264		PROSPECT 1ère propo le 9/6/18	KERHUON IMMOBILIER	cabinetrebours	Monsieur	rebours ronana	kerhuon-immobilier@orange.fr	0298283706	nan	2021-06-21 08:03:49.162666	t
265	121030	CLIENT PARTICULIER	.	.	Monsieur	le bris corentin	nan	nan	nan	2021-06-21 08:03:50.406951	t
266	121040	CLIENT PARTICULIER	.	.	Monsieur	piens arnaud	apiens@gmail.com	nan	nan	2021-06-21 08:03:51.304443	t
267	122000	ARRET  COLLABORATION	BARATTE IMMOBILIER	baratteimmobilier	Madame	richard vanessa	vanessa.baratte@gmail.com	0546993542	752590265	2021-06-21 08:03:53.668088	t
269	122011	CLIENT INACTIF	ZAMBON IMMOBILIER	squarehabitatzambonimmobilier	Madame	bigot isabelle	isabelle.bigot@squarehabitat.fr	0242533299	nan	2021-06-21 08:03:57.439925	t
284	122240	ARRET  COLLABORATION	NEOWI IMMOBILIER	\N	Monsieur	hascoet boris	b.hascoet@neowi.com	0229631715	40977820600022	2021-06-21 08:04:10.11467	t
270	122012	CLIENT PARTICULIER	PARTICULIER	particulier	Madame	blais yvette et mathieu	mathieublais@wanadoo.fr	0663562035	nan	2021-06-21 08:03:58.27445	t
271	123000	CLIENT ACTIF	SAS BUSSAT DUNNE IMMOBILIER	guyhoquetbussatdunneimmobilier	Monsieur	bussat serge	paris15sud@guyhoquet.com	01 45 32 40 40	79841784600028	2021-06-21 08:03:59.135955	t
272	123640	['agence', 'des', 'quatres', 'sergents']	SARL Agence des 4 Sergents	agencedesquatressergents	Monsieur	jeanjean gilles & jeanjean guillaume	4sergents@wanadoo.fr	0546505454	nan	2021-06-21 08:04:00.234324	t
285		DOUBLON DE SAISIE	BENOTEAU IMMOBILIER	\N	Madame	benoteau corine	cbenoteau@benoteau-immobilier.fr	0160607229	nan	2021-06-21 08:04:10.968181	t
273	122030	ARRET  COLLABORATION	SAS BRIO GESTION	briogestion	Madame	brilhaut céline & novais sylvie	celine.syndicexperts@gmail.com\nsylvie.briogestions@gamil.com	01 41 74 37 81	nan	2021-06-21 08:04:01.072846	t
274	122040	CLIENT ACTIF	CITYA BELVIA RENNES	cityabelviarennes	Madame	le doeuff hélène	helene.ledoeuff@citya-belvia.fr	0299787980	nan	2021-06-21 08:04:01.911366	t
275	122050	REPRENDRE CONTACT	BRIENT IMMOBILIER	guyhoquetmontreuilbrientimmobilier	Monsieur	brient laurent	montreuil.mairie@guyhoquet.com	0148374737	nan	2021-06-21 08:04:03.025728	t
286	123520	CLIENT ACTIF	CABINET GUERRY SARL	agirimmobiliercabinetguerry	Monsieur	chenede frédéric	fred-chenede@hotmail.fr	0299670068	341 939 684 00096	2021-06-21 08:04:11.765724	t
276	122060	CLIENT INACTIF	CITYA CAGIL	cityalorient	Madame	waysse alyssa	awaysse@citya.com	nan	316 972 835 00045	2021-06-21 08:04:03.673359	t
277	122070	ARRET  COLLABORATION	SARL COTE VILLEMANDEUR	coteparticuliers	Madame	mounier céline	villemandeur@coteparticuliers.com	0238870717	nan	2021-06-21 08:04:04.514876	t
299	122150	CLIENT ACTIF	VACHERAND IMMOBILIER	vacherandimmobilier	Madame	vacherand charlotte	charlotte@vacherand.fr	0328380038	414270769	2021-06-21 08:04:22.125796	t
278	122120	CLIENT INACTIF	SASU UGS PATRIMOINE	l'adresseetampes	Monsieur	cormon benoit	gestion@ugs-patrimoine.com	0169260404	nan	2021-06-21 08:04:05.202499	t
287	122130	CLIENT INACTIF	SARL TRIO IMMO	l'adressechateaubriant	Madame	lahridi soraya	s.lahridi@ladresse.com	0240287621	nan	2021-06-21 08:04:12.702188	t
279	122080	CLIENT PARTICULIER	.	.	Monsieur	rouillon frédéric	segolenerouillon@yahoo.fr	nan	nan	2021-06-21 08:04:05.928065	t
280	122090	INACTIF	SAS AM IMMOBILIER	amimmobilier	Monsieur	billot michel	amimmob@aol.com	01 39 76 33 61 / 01 39 76 52 52	55980529600022	2021-06-21 08:04:06.779579	t
294	110101	INACTIF-ARRET COLLABORATION	SARL GDL IMMOBILIER	laforetgdlimmobilier	Monsieur	da costa laurent	ldacosta@laforet.com	01 43 40 10 10	nan	2021-06-21 08:04:18.496869	t
281	122100	CLIENT INACTIF	GIEMPE IMMOBILIER	giempeimmobilier	Monsieur	pertus jean marc	giempe-immobilier@wanadoo.fr	0241956399	nan	2021-06-21 08:04:07.42221	t
288	122120	CLIENT PARTICULIER	.	.	Monsieur	froussart jean-marc	jm.froussart@gmail.com	nan	nan	2021-06-21 08:04:13.503728	t
282	122110	CLIENT ACTIF	PARTENAIRES GESTION CONSEIL	l'adressethorilagny	Madame	bonnet muriel	phc-gestion@orange.fr	0164121212	43948954300082	2021-06-21 08:04:08.213758	t
283	122165	PROSPECT	CABINET FRUCHET	\N	Monsieur	fruchet benjamin	benjamin@chantonnay-immobilier.com	0241368729	nan	2021-06-21 08:04:09.195194	t
289	122140	CLIENT PARTICULIER	.	.	Madame	lombard bélinda	beli.lombard@gmail.com	nan	nan	2021-06-21 08:04:14.421204	t
290	122150	CLIENT PARTICULIER	.	.	Madame	gourrier	martinegourrier@orange.fr	nan	nan	2021-06-21 08:04:15.266724	t
295	123350	ARRET DE COLLABORATION SUITE VENTE	SOCIETE CAP JAURES	orpi101jaures	Madame	lamour solène	agencejaures@orpi.com	0298434656	51370591300012	2021-06-21 08:04:19.316401	t
291	122160	ARRET  COLLABORATION	SAS LARVOR	larvor	Monsieur	wispelaere manuel	mw.larvor3@Wanadoo.fr	0298459339	nan	2021-06-21 08:04:16.071262	t
292	110103	INACTIF-ARRET COLLABORATION	SARL NATION IMMOBILIER	laforetnationimmobilier	Monsieur	da costa laurent	ldacosta@laforet.com	0156950900	nan	2021-06-21 08:04:17.099672	t
306	122190	CLIENT PARTICULIER	CALAS JEAN FRANCOIS	particulier	MONSIEUR	calas jean francois	jfcals@orange.fr	nan	nan	2021-06-21 08:04:27.801544	t
293	110102	INACTIF-ARRET COLLABORATION	SARL L-L IMMOBILIER	laforetllimmobilier	Monsieur	da costa laurent	ldacosta@laforet.com	01 55 78 83 10	nan	2021-06-21 08:04:17.893215	t
296	122145	CLIENT ACTIF	ETUDE BONNAVE	bonnavenotaires	Monsieur	bonnave frederic	frederic.bonnave@notaire.fr	0328520720	nan	2021-06-21 08:04:20.035991	t
300	122160	CLIENT ACTIF	CABINET PIGE	cabinetpige	Monsieur	brachet sébestien	sebastien.brachet@pigeimmobilier.fr	0241257575	403090889	2021-06-21 08:04:22.857374	t
297	122146	CLIENT INACTIF	TMC FINANCE	lilleimmo	Madame	denis estelle	estelle@lille-immo.fr	0320152061	487754848	2021-06-21 08:04:20.715604	t
298	122140	CLIENT ACTIF	BENOTEAU IMMOBILIER	l'adressebenoteauimmobilier	Madame	benoteau corinne	cbenoteau@benoteau-immobilier.fr	0160607229	786142935	2021-06-21 08:04:21.500149	t
303	122180	CLIENT PARTICULIER	Djakiodine Shabir	djakiodineshabir	Monsieur	djakiodine shabir	shabacc72@gmail.com	447789862405	nan	2021-06-21 08:04:25.545833	t
301	122170	['agence', 'pascal']	SARL STELA	agencepascal	MADAME	salvator laura	laura.salvatore@mdi77.com	0164306060	48091327600014	2021-06-21 08:04:23.700895	t
302		DOUBLON DE SAISIE	TMC FINANCE	lilleimmo	MADAME	denis estelle	estelle@lille-immo.fr	0320152061	nan	2021-06-21 08:04:24.742299	t
305	122200	CLIENT INACTIF	JLW IMMOBILIER	jlwimmobilier	MONSIEUR	lestienne emeric	emeric.lestienne@jlw.fr	0320577257	48290685600018	2021-06-21 08:04:27.079957	t
304	122195	CLIENT INACTIF	NOTAIRES ETUDE NYZAM GAILLARD	notairesetudenyzamgaillard	Madame	templier angeline	angeline.templier@notaires.fr	0546995347	397 891 086 00027	2021-06-21 08:04:26.222447	t
307	122210	CLIENT PARTICULIER	CORDIER Jean-Noël	particulier	Monsieur	cordier jean-noël	cordier.jeannoel@neuf.fr	nan	nan	2021-06-21 08:04:28.604084	t
308	122220	CLIENT ACTIF	IMMOBILIERE JAURES IMMO	jauresimmoagenceprincipalegagny	MONSIEUR	nardot stepahne	kgk@wanadoo.fr	0141530404	449306620	2021-06-21 08:04:29.285699	t
309	122250	CLIENT PARTICULIER	PETILLAT ROBERT	particulier	MONSIEUR	petillat damien et robert delphine	delphinrobert80@gmail.com	0241699116	nan	2021-06-21 08:04:30.04326	t
310	122260	CLIENT INACTIF	SCI AMETHYSTE	scil'amethyste	MADAME	norguet carole	norguet.carole@gmail.com	nan	524 848 082 00037	2021-06-21 08:04:30.77284	t
311	122270	ARRET  COLLABORATION	FONCIA VENDEE	fonciagrouepgrenon	MONSIEUR	caillaud lauret	laurent.caillaud@foncia.de	nan	452 396 575 00071	2021-06-21 08:04:31.365503	t
313	122290	CLIENT ACTIF	LM-IMMO	lillemetropoleimmobilier	Monsieur	darondel igor	contact@lillemetropoleimmobilier.com	0320152020	538 332 883 00015	2021-06-21 08:04:32.985575	t
314	122300	CLIENT ACTIF	CENTURY RUE NATIONALE	century21lilleruenationale	MONSIEUR	dupont benoit	ruenationale@century21.fr	0328535555	52526891800014	2021-06-21 08:04:33.87007	t
329	123420	ARRET DE COLLABORATION SUITE VENTE	SIGLA GESTION	siglaimmobilier	Madame	voisin isabelle	isabelle.voisin@sigla.fr\naccueilgestion@sigla.fr	03 20 57 09 30	49871124100030	2021-06-21 08:04:44.76683	t
315	122310	nan	DEFIM	defimimmobilier	Madame	delfosse erika	defim.gestion@gmail.com	0328360916	82392388300016	2021-06-21 08:04:34.696594	t
316		nan	AJP IMMOBILIER	ajpimmobilier	Madame	rodolle véronique	saintmarcsurmer@ajp-immobilier.com	0240403757	nan	2021-06-21 08:04:35.266269	t
337	123510	ARRET  COLLABORATION	nan	\N	Madame	quentin marie	marieq2@hotmail.com	nan	nan	2021-06-21 08:04:50.757403	t
317	123320	CLIENT INACTIF	ASD PATRIMOINE	asdimmobilierasdpatrimoine	MONSIEUR	segard arnaud	asegard@asd-patrimoine.fr	0321694509	78945950000045	2021-06-21 08:04:36.043823	t
330	107505	CLIENT ACTIF	SARL CABIENT FREDELION	guyhoquetcabinetfredelion	MONSIEUR	teboul et bismuth	gestion@cabinet-fredelion.com	0153093040	49240893500020	2021-06-21 08:04:45.62734	t
318	123330	CLIENT INACTIF	MENGUY Leslie	officenotarial	Madame	menguy leslie	lesliemenguy@gmail.com	nan	nan	2021-06-21 08:04:36.74942	t
319	123340	CLIENT ACTIF	EURO IMMO	euroimmo	MADAME	barat carole	c.barat@euroimmo.fr	0164170800	42308557000012	2021-06-21 08:04:37.419036	t
320	123610	CLIENT ACTIF	IMMO DE FRANCE LAVAL	immodefrancelaval	MADAME	vaigreville murielle	mvaigreville@procivis-ouest.fr	02 43 59 45 45	44136160700035	2021-06-21 08:04:38.272547	t
331	123430	ARRET  COLLABORATION	SARL BH IMMOBILIER	l'adressecastanettolosanbhimmobilier	MONSIEUR	heracles et bourgoin	bhimmobilier@ladresse.com	0534434203	519654115 00020	2021-06-21 08:04:46.438873	t
321	123350	nan	SOCIETE CAP JAURES	orpi101jaures	MADAME	lamour solene	agencejaures@orpi.com	0298434656	51370591300012	2021-06-21 08:04:38.933172	t
322	123360	ARRET  COLLABORATION	CABINET G.CARDINAL	cabinetg.cardinal	MONSIEUR	duart david	gerance@cabinetgcardinal.com	nan	79501577500013	2021-06-21 08:04:39.708728	t
323	123370	CLIENT	nan	\N	MONSIEUR	\N	nan	nan	nan	2021-06-21 08:04:40.414323	t
343	123550	REPRENDRE CONTACT	AGENCE NOUALLER IMMOBILIER	orpinouallet	Monsieur	nouallet	snouallet@orpi.com	0140250232	452977044	2021-06-21 08:04:55.647599	t
324	123380	CLIENT PARTICULIER	DE BEAUREGARD Arnaud	particulier	Monsieur	de beauregard arnaud	beauregard@free.fr	nan	nan	2021-06-21 08:04:41.025971	t
325	123390	CLIENT PARTICULIER	nan	\N	Monsieur	mailhac christophe	chrismayac@hotmail.com	nan	nan	2021-06-21 08:04:41.818518	t
326	123400	CLIENT PARTICULIER	nan	\N	Monsieur	metivier laurent et madame blouin sonia	sonia.blouin@hotmail.fr	nan	nan	2021-06-21 08:04:42.433166	t
332	123440	ARRET  COLLABORATION	SARL AET IMMOBILIER	l'adressetoulouseaetimmobilier	MONSIEUR	heracles et bourgoin	direction@ladresse.com    ATTENTION ADRESSE MAIL ERRONEE	0562477333	42488111800014	2021-06-21 08:04:47.112489	t
327	123480	CLIENT INACTIF	SARL B.C IMMOBILIER	l'adressestbranchsetl'adressetours	Madame	chevalier brigite	agencedulac@ladresse.com	0247261260	483659983	2021-06-21 08:04:43.324654	t
328	124410	CLIENT INACTIF	SARL- INEDIT IMMOBILIER	ineditimmobilier	Monsieur	leclercq etienne	etienne@inedit-immobilier.com	0366722572	500 944 012 00037	2021-06-21 08:04:44.123198	t
338	123530	nan	OFFCIE NOTARIAL F.CADET	offcienotarialf.cadet	Monsieur	plourdeau arnaud	negociation.53075@notaire.fr	0243041264	300 349 347 00025	2021-06-21 08:04:51.562937	t
333	123450	CLIENT ACTIF	SARL MBM IMMOBILIER	locagestiontoulousembmimmobilier	MADAME	vanhecke nathalie	location@locagestion.com	0561208620	404 821 373 00036	2021-06-21 08:04:47.905032	t
334	123460	CLIENT INACTIF	SARL AERO IMMOBILIER	l'adressecolomiers	MADAME	rondonnet josiane	aero.transactions@wanadoo.fr	0561785173	38125276600047	2021-06-21 08:04:48.559658	t
339		nan	nan	\N	nan	\N	nan	nan	nan	2021-06-21 08:04:52.281532	t
335	123470	CLIENT INACTIF	SARL GI.CI.CA.	l'adressetoulousegicaconseil	MADAME	germa nathalie	nathalie.germa@ladresse.com	0562486120	40320284900036	2021-06-21 08:04:49.311227	t
336	123500	CLIENT ACTIF	CIVM IMMOBILIER	l'adressecivm	MONSIEUR	pouyet laurent	nan	01 49 83 88 11	41090591300019	2021-06-21 08:04:50.096777	t
340	123540	CLIENT ACTIF	S2F IMMOBILIER	guyhoquetparis9ouests2fimmobilier	Monsieur	faure fabian	f.faure@guyhoquet.com	01 81 69 76 69	81975320300028	2021-06-21 08:04:52.902176	t
349	123650	CLIENT INACTIF	ASTIM  SARL - NESTENN ANGERS	nestennangers	Monsieur	bouly laurent	l.bouly@nestenn.com	nan	43336341300017	2021-06-21 08:04:59.91316	t
341	123620	REPRENDRE CONTACT	SAS O'REAL IMMOBILIER TRANSACTIONS	o'realimmobiliertransactions	Monsieur	talban joseph	transaction@o-real.fr	0983980101	824 961 874 00016	2021-06-21 08:04:53.98955	t
344	123560	CLIENT ACTIF	SAS SARPIG	pierres&cosassarpig	Monsieur	sarrazin pierre	p.sarrazin@pierres-co.fr	0241863264	81079156600013	2021-06-21 08:04:56.294231	t
342	123590	ARRET  COLLABORATION	CABINET IROISE IMMOBILIER	iroiseimmobilier	Monsieur	riou christophe	contact@iroiseimmo.fr	0298432900	339311060	2021-06-21 08:04:54.865047	t
347	123600	CLIENT PARTICULIER	BLAIS Gérard	particulier	Monsieur	blais gérard	Yvette.blais@free.fr	nan	nan	2021-06-21 08:04:58.409023	t
345	123570	CLIENT PARTICULIER	nan	\N	Monsieur	lafranceschina lionel	laf.lionel@wanadoo.fr	nan	nan	2021-06-21 08:04:57.025812	t
346	123580	CLIENT PARTICULIER	DELAPIERRE Sylvie et NQUELLAERD	particulier	Madame et Monsieur	delapierre sylvie et nquellaerd	barelnet@yahoo.fr	nan	nan	2021-06-21 08:04:57.798368	t
348	123630	CLIENT ACTIF	SARL LES HERBIERS GESTION	l'adresselesherbiersgestion	Messieux	blanvillain et teillol	nan	nan	nan	2021-06-21 08:04:59.152594	t
350	123660	CLIENT PARTICULIER	LOINARD Antoine	loinardantoine	Monsieur	loinard antoine	antoine.loinard@gmail.com	nan	nan	2021-06-21 08:05:00.524811	t
351	123670	REPRENDRE CONTACT	AVANTAGE GESTION	stephaneplazaimmobilier	Madame	des fontaines fleur	fdesfontaines@stephaneplazaimmobilier.com	0141054554	818622896	2021-06-21 08:05:01.307359	t
352	123680	nan	FRANCE EDL	franceedl	Monsieur	baudin guillaume	contact@france-edl.fr	09 72 47 40 49	52835861700025	2021-06-21 08:05:02.043942	t
353	123690	CLIENT ACTIF	AGENCE CADEAU	orpiagencecadeau	Monsieur	garcia sébastien	sgarcia.agencecadeau@orpi.com	01 49 32 06 06	30638804200054	2021-06-21 08:05:02.696568	t
354	123700	CLIENT ACTIF	SAS PONS & COMPAGNIE	pons&cieimmobilier	Monsieur	beddeleem stéphane	nan	0328365150	455 503 359 00016	2021-06-21 08:05:03.487112	t
355	123710	CLIENT INACTIF	LEGROS IMMOBILIER	legrosimmobilier	Monsieur	guedon stéphane	legros.immobilier@wanadoo.fr	0241880171	39057869800016	2021-06-21 08:05:04.176717	t
356	123720	CLIENT ACTIF	SARL LANTA IMMOBILIER	coeurlauragaisimmoagencedelanta	Monsieur	soual yannick	ys.lanta.immo@orange.fr	0562186330	44328553100010	2021-06-21 08:05:04.903301	t
357	123685	CLIENT PARTICULIER	PICAVEZ PHILIPPE	picavezphilippe	Monsieur	picavez philippe	pivavez@orange.fr	nan	nan	2021-06-21 08:05:05.641877	t
372	124020	CLIENT INACTIF	BRAVOGROUP TECH CO LTD	\N	Monsieur	steven	steven@bravogroup.com	nan	69987483-000-10-18-4	2021-06-21 08:05:16.994378	t
358	124170	CLIENT ACTIF	SARL TERRE D'ARGENCE IMMOBILIER	agenceterred'argenceimmobilier	Madame et Monsieur	poincet philippe et sophie	ppoincet@terre-argence.com	0466811807	451779912000018	2021-06-21 08:05:06.253529	t
359	1270201	CLIENT ACTIF	SARL INDEPIMMO	indepimmo	Monsieur	rambeau christophe	crambeau@indepimmo.fr	0241550332	79061304600016	2021-06-21 08:05:07.050071	t
381	124110	CLIENT ACTIF	SARL IMMO 7	coeurlauragaisimmo7	Monsieur	soual yannick	ys.lanta.immo@orange.fr	0562186330	792 045 189 00018	2021-06-21 08:05:23.647487	t
360	123730	CLIENT ACTIF	BEE IMMO SARL	beeimmolaforet	Monsieur	brochet xavier	xbrochet@laforet.com	0144381012	508626330   502662042	2021-06-21 08:05:07.854612	t
373	124030	CLIENT ACTIF	AGENCE IMMOBILIERE DE LA MAIRIE	orpirosnysousboisagencedelamairie	Monsieur	denis nicolas	agencemairie@orpi.com	0145280059	505057919	2021-06-21 08:05:17.640008	t
361	123750	CLIENT INACTIF	SARL MAUDIN IMMOBILIER	laforetdoldebretagne	Monsieur	maudet & meron jérôme	jmeron@laforet.com	0299807026	44781668700027	2021-06-21 08:05:08.587195	t
362	123800	CLIENT ACTIF	SARL IMMOBILIERE DE LILLE	immobilieredelille	Monsieur	guilloteau charlotte	pierremechineau@immobiliere-de-lille.fr	0320151535	833 531 098 00014	2021-06-21 08:05:09.376743	t
363	123850	REPRENDRE CONTACT	SARL a2jimmo	orpigagnya2jimmo	Monsieur	vasovic slobodan	a2jimmo@orpi.com	0143817979	37807360500024	2021-06-21 08:05:10.012378	t
364	123900	['alain', 'rousseau', 'immobiliere', 'comine']	ALAIN ROUSSEAU IMMOBILIERE COMINE	alainrousseauimmobilierecomine	Monsieur	rousseau guillaume	angers@alain-rousseau.com	02 41 24 13 70	414 709 980 00018	2021-06-21 08:05:11.133733	t
365	123950	CLIENT PARTICULIER	nan	\N	Monsieur	coulay guy	guy.coulay@orange.fr	06 87 43 40 15	nan	2021-06-21 08:05:11.783362	t
374	124040	INACTIF-ARRET COLLABORATION	REPUBLIQUE IMMOBILIER	republiqueimmobilierlaforet	Monsieur	da costa laurent	nan	01 71 18 33 00	84093062200013	2021-06-21 08:05:18.488524	t
366	123960	CLIENT INACTIF	AIL IMMOBILIER - AGENCE IMMOBILIER LILLOISE	agenceimmobilierelilloise	Monsieur & Madame	ponche	a.i.l59000@orange.fr	03 20 22 95 67	414 908 988 00010	2021-06-21 08:05:12.438991	t
367	123970	CLIENT PARTICULIER	SAPAC	\N	Madame	comte	clientsfournisseurs@sapac.fr	nan	nan	2021-06-21 08:05:13.24053	t
368	123980	CLIENT PARTICULIER	nan	\N	Madame & Monsieur	rolland robert	monique.h.rolland@free.fr	nan	nan	2021-06-21 08:05:14.00409	t
369	124165	REPRENDRE CONTACT	SARL IMMOBILIER HELOIN	heloinimmobilier	Monsieur	paul bertrand	immo.heloin@wanadoo.fr	02 41 67 64 25	35299872800054	2021-06-21 08:05:14.780645	t
370	124000	CLIENT INACTIF	SCI CDP PATRIMOINE	cdppatrimoine	Madame	lettelier flo	lettelier.flo@sfr.fr	nan	498 276 963 00044	2021-06-21 08:05:15.59318	t
371	124010	CLIENT PARTICULIER	nan	\N	Monsieur	roland robert et huguette	nan	nan	nan	2021-06-21 08:05:16.195837	t
375	124050	INACTIF-ARRET COLLABORATION	SAS PATRIMONIA - ORPI	orpisasimmo75	Monsieur	hoarau laurent	gerance@immo75.fr	01 43 70 51 51	40308522800035	2021-06-21 08:05:19.275073	t
382	124120	CLIENT ACTIF	SARL CHURCHIL - Agence de l'ancienne Marie	l'adresseagencedel'anciennemairie	Madame	malika bouazoune	nan	01 43 05 60 25	41126140700042	2021-06-21 08:05:24.330098	t
376	124060	ARRET  COLLABORATION	IMMOBILIERE LUTECE	immobilierelutece	Monsieur	latour steve	slatour@immobilierelutece.fr	01 42 68 33 39	304 555 501 00069	2021-06-21 08:05:20.065542	t
377	124070	CLIENT INACTIF	SARL MB IMMOBILIER	mbimmobiliertours	Monsieur	blot  pierre yves	py.blot@mb-immobilier.com	0247701001	39835439900014	2021-06-21 08:05:20.802118	t
378	124080	INACTIF	M3B IMMOBILIER SARL	laforet_m3bimmobilier	Monsieur	célian moullé-berteaux	nan	01 41 10 42 10	83337372300018	2021-06-21 08:05:21.520705	t
379	124090	CLIENT INACTIF	nan	\N	Monsieur	show john	tchkarl@gmail.com	nan	nan	2021-06-21 08:05:22.140353	t
380	124100	nan	LADREAU	\N	Monsieur	landreau	alandreau@free.fr	nan	nan	2021-06-21 08:05:22.998859	t
387	124260	CLIENT ACTIF	SARL AGENCE CORINNE B	agencecorinneb	Madame	bazard corinne	corinneb.pro@gmail.com	0238349609	49866003400014	2021-06-21 08:05:28.147912	t
383	124130	CLIENT ACTIF	ACTIF GESTION IMMOBILIER	agiactifgestionimmobilier	Madame	dufour kathleen	k.dufour@actifgestionimmobilier.com	01064366405	793 442 039 00012	2021-06-21 08:05:25.218589	t
384		nan	MODELE	\N	nan	modele	nan	nan	nan	2021-06-21 08:05:25.818245	t
385	0181	CLIENT INACTIF	SARL A.N.G IMMOBILIER	century21l'oceane	Monsieur	francheteau pascal	locationloceane@century21.fr	0251498888	35357547500036	2021-06-21 08:05:26.553823	t
390	124150	REPRENDRE CONTACT	SAS C2IMM	c2imm	Madame	bryndza catherine	nan	01 43 36 32 84	79340316300025	2021-06-21 08:05:30.409616	t
386	124240	CLIENT INACTIF	SAS AAZ IMMOBILIER YONNAIS	laforetimmobilieryonnais	Madame	guillou charlotte	c.guillou@laforet.com	0251363878	791011869800017	2021-06-21 08:05:27.430321	t
388	124140	CLIENT ACTIF	SARL AFI -  AUBERGENVILLE FLINS IMMOBILIER	guyhoqueteponel'immobilierpatrimoine	Madame	descaves / jouvet	gestion.afi.aubergenville@gmail.com	01.30.91.23.05	525 002 697 00015	2021-06-21 08:05:28.982432	t
389	124180	['immobiliere', 'des', '3', 'rives']	FICHIER HABITAT	immobilieredes3rives	Monsieur	jean louis pecheux	immo3rives@orpi.com	0241481100	84172176400014	2021-06-21 08:05:29.696027	t
392	124190	CLIENT INACTIF	SAS SEIZE IMMOBILIER	seizeimmobilier	Monsieur	lefebvre remi	remi@seizeimmobilier.com	0328360650	80739128900020	2021-06-21 08:05:31.680887	t
391	124160	CLIENT INACTIF	BRAVOFIBER	bravofiberlda	Monsieur	bravofiber	pyves@bravofiber.com	nan	515147001	2021-06-21 08:05:31.116212	t
393	124200	CLIENT ACTIF	SAS AGENCE DE LA MADELEINE	agencedelamadeleine	Madame	valerie hugot	val.hugot@orange.fr	03 20 78 02 02	80467728400015	2021-06-21 08:05:32.458447	t
394	124340	CLIENT ACTIF	SARL DALIN BUSSAT DUNNE IMMOBILIER	guyhoquetsaintcharlessarldalin	Monsieur	dalin bertrand	b.dalin@guyhoquet.com	01.82.83.40.00	82207515600023	2021-06-21 08:05:33.236995	t
395	124210	SUSPENDU	POMMEROL	pommerolaude	Madame	pommerol aude	audehariche@icloud.com	06 80 84 82 15	nan	2021-06-21 08:05:34.206442	t
396	124210	CLIENT INACTIF	DE POMMEROL AUDE	depommerolaude	Madame	de pommerol aude	audehariche@icloud.com	06 80 84 82 15	nan	2021-06-21 08:05:34.997989	t
397	124220	['mme', 'fleury']	MME FLEURY	mmefleury	Société	sci kroaz du	sci.kroazdu@gmail.com	nan	833 608 938 00019	2021-06-21 08:05:35.602642	t
398	124230	['kamet']	KAMET VENTURES	kamet	Monsieur	recoing julien	julien.recoing@kametventures.com	nan	nan	2021-06-21 08:05:36.430169	t
414	124380	CLIENT PARTICULIER	SCI	scikinos	Madame	chailloux marie ,  galon pauline	sci.kinos@gmail.com	0240296786	80744605900014	2021-06-21 08:05:49.540568	t
400	124280	CLIENT ACTIF	SARL CITYA LES REMPARTS	cityalavalsarlcityalesremparts	Monsieur	pecot benoit	XXX	02 43 59 21 70	33438154100036	2021-06-21 08:05:37.817374	t
401	CC0171	CLIENT	SARL DEMARE BEAULIEU IMMOBILIER	demarebeaulieuimmobilier	Madame	demare fabienne	immobilier@demare-beaulieu.fr	0251863480	45214576600047	2021-06-21 08:05:38.612919	t
423	124490	CLIENT ACTIF	AGENCE DE VALLIERE - GESTION	agencedevallieregestion	Madame	fall barbara	b.fall@de-valliere.com  / rueil@de-valliere.com	0141968005	494 116 320 00016	2021-06-21 08:05:56.208749	t
402	124270	CLIENT INACTIF	SARL PHILIPPE MATHIEU	agencedusudest	Madame	stephanie bouffier	s.bouffier@agsudest.com	04 42 26 18 01	48793034900013	2021-06-21 08:05:39.286533	t
415	124390	CLIENT INACTIF	SARL PLACE DE l'IMMOBILIER LAVAL	stephaneplazalaval	Monsieur	cacheux sebastien & sophie herve	laval@stephaneplazaimmobilier.com	0243913238	832 995 427 00016	2021-06-21 08:05:50.296136	t
403	124290	REPRENDRE CONTACT	SAVOIR ET CONSEIL	savoiretconseil	Monsieur	blanchard philippe	conseiletsavoir@orange.fr	.	48198742800036	2021-06-21 08:05:40.900513	t
404		CLIENT PARTICULIER	XXXX	xxx	Madame	haddou	ggledetoc4090@amexpert.biz	06 30 51 35 71	XXXX	2021-06-21 08:05:41.620104	t
405	124295	CLIENT PARTICULIER	XXX	xxx	Madame	martin	ckmartin44@gmail.com	06 68 93 02 48	XXX	2021-06-21 08:05:42.425641	t
416	124400	CLIENT INACTIF	EQUIT IMMOBILIER	equitimmobilier	Madame	brouttier brérengère	nan	03 21 156 136	nan	2021-06-21 08:05:50.913783	t
406	124310	REPRENDRE CONTACT	SARL BOCAGE IMMOBILIER	bocageimmobilier	Madame	bouet elodie	bocage.immobilier@wanadoo.fr	05 49 65 84 34	83331718300014	2021-06-21 08:05:43.070271	t
407	124360	REPRENDRE CONTACT	SARL BRESSUIRE IMMO	letucimmobilier	Madame	vrignault aurelie	bressuire@letuc.com	05 49 80 61 94	48843001800033	2021-06-21 08:05:43.808848	t
428	124540	CLIENT INACTIF	EURL BRIGITTE TESTARD	agencedeslilas	Madame	mme christine testard	agence@agence-immobiliere-des-lilas.com   Brigittetestard@gmail.com	02 38 29 03 20	53172789900027	2021-06-21 08:05:59.855662	t
408	124300	CLIENT PARTICULIER	ZEZAFOUN	zezafoun	nan	zezafoun hussein	nan	nan	XXX	2021-06-21 08:05:44.715329	t
417	124410	CLIENT PARTICULIER	XXX	xxx	Madame	nafissa fellah	nafissafeliah@yahoo.fr	0662188295	XXX	2021-06-21 08:05:51.762296	t
410	124330	CLIENT INACTIF	NOTAIRE FONTAINE ROUSSEL & ASSOCIES	fontaineroussel&associes	Maître	mme deplaet  / etude fontaine roussel&associes	nan	0320125890	XXX	2021-06-21 08:05:46.209479	t
424	124480	CLIENT ACTIF	COOPTALIS - LINK MOBILITE	coptalislinkmobilite	Monsieur	jakubowsky benjamin	isabelle.straub@linkmobilite.com	05 61 59 40 73	49884679900092	2021-06-21 08:05:56.795416	t
411	124350	ARRET  COLLABORATION	SARL LE RELAIS IMMOBILIER	lerelaisimmobilier	Madame	rossignol angelique	service-gerance@orange.fr	01 34 80 90 91	324 804 889 00016	2021-06-21 08:05:46.859102	t
412	122001	CLIENT PARTICULIER	nan	\N	Monsieur	plantagenet patrick	nan	nan	nan	2021-06-21 08:05:47.58169	t
418	124510	CLIENT ACTIF	SAS BSGI	bsgimmecorinnecattiaux	Madame	cattiaux corinne	XXX	01 58 03 58 22	40292514300065	2021-06-21 08:05:52.477886	t
413	124370	CLIENT INACTIF	CADEAU THEVIN SARL	orpiagencethevineguia	Madame	cadeau marianne	mcadeau.cadeaugestion@orpi.com	01 60 94 24 24	33272634800052	2021-06-21 08:05:48.308273	t
419	124450	CLIENT ACTIF	SASU DELF IMMOGEST	l'adressenationsasudelfimmogest	Madame	perrillat delphine	delphine.perrillat@ladresse.com	01 81 69 56 30	81082315300012	2021-06-21 08:05:53.087545	t
425	124500	CLIENT ACTIF	SARL ACTIF IMMO	l'adresseromorantin	Madame	cretier carole	c.cretier@ladresse-romorantin.fr	0254767759	75247734900019	2021-06-21 08:05:57.583966	t
420	124460	CLIENT ACTIF	SARL CSG IMMOBILIER	guyhoquetsceauxsarlcsgimmobilier	Madame	coppola christine      coppola gregory	mc.coppola@guyhoquet.com	01 41 60 87 87	825103831	2021-06-21 08:05:53.887079	t
421	124470	CLIENT ACTIF	SARL	andreimmobiliergestion	Madame	andre- huet honorine  mr andre edouard	h.andre@andreimmo.fr	01 71 52 75 02	53145774500028	2021-06-21 08:05:54.661637	t
434	124610	CLIENT ACTIF	IMMOPLESSIS	l'adresseplessisrobinsson	Monsieur	gandillon ohilippe	p.gandillon@immoplessis.fr	01.46.30.18.48	444 525 976 00015	2021-06-21 08:06:04.166194	t
422	124520	CLIENT PARTICULIER	FATMA TRIKI	fatmatriki	Madame	fatma triki	fatma.triki@muses-hammamet.com	0660241503	XXX	2021-06-21 08:05:55.405214	t
429	124560	CLIENT ACTIF	SARL VESTALIA IMMO	vestaliaimmothierrylescure	Monsieur	thierry lescure	contact@vestaliaimmo.fr	05 56 24 62 47	52323706300020	2021-06-21 08:06:00.519281	t
426	124550	CLIENT INACTIF	VALLOIRE HABITAT LE MANS ET LAVAL	valloirehabiatagencelaval	Madame	perthuis patricia	berengere.chollet@valloire-habitat.com	0243395640	nan	2021-06-21 08:05:58.378512	t
427	124530	CLIENT INACTIF	SARL	shconseilimmobilieretpatrimoine	Madame	sanroma christine	c.sanroma@sh-conseil.fr	02 38 51 34 33	52901831900010	2021-06-21 08:05:59.027136	t
432	124590	CLIENT ACTIF	ADX GROUPE CREDIT AGRICOLE	creditagricoleadxgroupe	ADX GROUPE CREDIT AGRICOLE	adx groupe credit agricole	nan	nan	nan	2021-06-21 08:06:02.606088	t
430	124570	CLIENT ACTIF	EPYCEAIMMO	laforetangersepyceaimmo	Monsieur	pinault pierre yves	ppinault@laforet.com	0241327435	848360509	2021-06-21 08:06:01.232874	t
431	124580	CLIENT ACTIF	SAS SOGIEF	sogiefimmobiliertonysipaseuth	Madame	hong pauline	tony@sogief.com	01.64.17.82.77	832753271	2021-06-21 08:06:02.00643	t
433	124600	CLIENT ACTIF	HAG IMMOBILIER	l'adressepoissyhagimmobilier	Monsieur	tabone et hafner	poissy@ladresse.com	0139112365	501 623 565 00022	2021-06-21 08:06:03.484583	t
435	124620	CLIENT ACTIF	SARL RUE DE LA PAIX;IMMO	ruedelapaix;immom.batardierejacques	Monsieur	batardiere jacques	m.vernerey@rdp.immo	02 52 09 73 52	843 438 680 00020	2021-06-21 08:06:04.970732	t
436	124630	CLIENT INACTIF	SARL EFI	ericfranquesimmobilier	Monsieur	eric franques	nan	0320149474	384 010 286 00043	2021-06-21 08:06:05.728298	t
437	124630	CLIENT INACTIF	nan	vacherandimmobilierlambersart	Madame	grimmelpont stephanie	nan	0320170130	793 585 670 00011	2021-06-21 08:06:06.428897	t
438	124650	CLIENT INACTIF	SARL PRIMEA	primeaimmobilier	Mesdames	d'haussy anne-charlotte & flament déborah	anne-charlotte@primea.info	0320781155	348 730 581 00033	2021-06-21 08:06:07.25043	t
439	12660	CLIENT INACTIF	SARLAU VLADEREN IMMO	vladerenimmo	Madame	roger marine	m.roger@vlanderenimmo.com	0362653690	509 078 887 00049	2021-06-21 08:06:07.924044	t
440	126670	CLIENT PARTICULIER	PARTICULIER	particulier	nan	roche  guillaume	XXX	XXX	XXX	2021-06-21 08:06:08.583664	t
409	124320	Professionnel	IMMOBILIERE DU BOUQUET (SARL)	orpiimmobilieredubouquetm.lamottestephane	Monsieur	mr lamotte stéphane	immobouquet@orpi.com	01 64 40 58 01	immobouquet@orpi.com	2021-06-21 08:05:45.41493	t
441	1270198	CLIENT ACTIF	SOCIETE A RESPONSABILITE LIMITEE	immobilieresaintjames	Monsieur	nardot stephane	kgk@wanadoo.fr	06 89 70 02 93	48378646	2021-06-21 08:06:09.411191	t
442	1270199	CLIENT ACTIF	SAS O THENTIK	laforetimmocholet	Monsieur	duguet gregoire	cholet@laforet.com	02 41 49 42 42	52036234400035	2021-06-21 08:06:10.597513	t
477		CLIENT ACTIF	SARL CABINET FRUCHET	cabinetfruchet	Monsieur	fruchet benjamin	contact@chantonnay-immobilier.com	nan	38221812100012	2021-06-21 08:06:36.263821	t
443	1270200	CLIENT ACTIF	SARL MOUTINHO CONSEIL IMMOBILIER	remaxhomepremiummouthinoconseilimmobilier	Monsieur	moutinho brice	brice.moutinho@remax.fr	01 41 52 22 22	500662374	2021-06-21 08:06:11.39006	t
457	1270216	CLIENT ACTIF	PROCITY GEST	procitygestimmobilierprocitygest	Madame	desnoyers de bieville dixie	location@procityimmobilier.fr	0175579217	799612932	2021-06-21 08:06:21.41732	t
444	1270207	CLIENT PARTICULIER	PARTICULIER	particulier	Monsieur	godefroy alexandre	nan	nan	nan	2021-06-21 08:06:11.991714	t
445	1270205	CLIENT PARTICULIER	PARTICULIER	particulier	Monsieur	perrier  jean-joel	nan	nan	nan	2021-06-21 08:06:12.681319	t
466	1270227	CLIENT ACTIF	ES IMMO	l'adressesaintpierremontlimart	Madame	secher emilie	nan	nan	882 702 244 00014	2021-06-21 08:06:28.2594	t
446	1270203	CLIENT PARTICULIER	PARTICULIER	particulier	Monsieur	messager michel	nan	nan	nan	2021-06-21 08:06:13.422894	t
458	1270214	CLIENT INACTIF	ROUSSEAU IMMOBILIER IMMOBILIERE COMINE	alainrousseauimmobilier	Monsieur	rousseau guillaume	angers@alain-rousseau.com	0241241370	414 709 980 00018	2021-06-21 08:06:22.055954	t
447	1270202	CLIENT ACTIF	SARL A.I.G	guyhoquetexelmansrodetrieu	Madame	rodet rieu valerie	guyhoquetexelmans@gmail.com	01 81 70 71 85	42956739900036	2021-06-21 08:06:14.01456	t
448	1270204	CLIENT ACTIF	SARL TALENTIS IMMO	talentisimmommefonteneaumarianne	Madame	fonteneau marianne	contact@talentis-immo.com	02 51 84 26 22	49435648800010	2021-06-21 08:06:15.066953	t
449	1270207	nan	PARTICULIER	particulier	Madame	blouin sonia	sonia.blouin@hotmail.fr	0644311462	nan	2021-06-21 08:06:15.743566	t
459	1270217	CLIENT PARTICULIER	GOUT JOSEPH	goutjoseph	Monsieur	gout joseph	nicole.gout31@orange.fr	0689738860	XXX	2021-06-21 08:06:22.965433	t
450	1270206	CLIENT ACTIF	SCI F.D.J	scifdjm.azemadavid	Monsieur	azema  david	sci.fdj.net@gmail.com	06 78 96 13 06	81508648300014	2021-06-21 08:06:16.430176	t
451	1270208	CLIENT PARTICULIER	PARTICULIER	particulier	Monsieur	courtin jean marie	nan	nan	nan	2021-06-21 08:06:17.244706	t
460	1270218	['cabient', 'diard']	CABINET DIARD	cabientdiard	Monsieur	gaudiche jean jacques	nan	nan	379 086 085 00014	2021-06-21 08:06:23.746983	t
452	1270209	CLIENT PARTICULIER	PARTICULIER	particulier	Madame	blais yvette	nan	nan	nan	2021-06-21 08:06:17.870347	t
453	1270210	CLIENT ACTIF	SARL L'IMMOBILIER POUR TOUS	century21l'immobilierpourtous	Madame et Monsieur	ribeiro anais // zitouni hacene	century21centralimmo.com	02 40 46 19 58	53825839300015	2021-06-21 08:06:18.58294	t
471	1270234	CLIENT ACTIF	WEST IMMOBILIER - LAFORET	westimmobilierlaforetquimper	Monsieur	le floc'h françois	flefloch@westimmobilier.com	02 98 93 40 63 \net \n02 98 98 77 77	50842406600092	2021-06-21 08:06:31.710424	t
454	1270211	CLIENT PARTICULIER	PARTICULIER	particulier	Monsieur	mr delmas	jean.michel.delmas@orange.fr	nan	nan	2021-06-21 08:06:19.33451	t
461	1270215	CLIENT ACTIF	SARL LOUAME	l'adressecarquefousarllouame	Monsieur	blanvillain sebastien	nan	0240527575	538305830	2021-06-21 08:06:24.452578	t
455	1270222	CLIENT PARTICULIER	PARTICULIER	particulier	Madame	couturier marie-pierre	mp.couturier@orange.fr	nan	nan	2021-06-21 08:06:19.952155	t
456	1270213	CLIENT ACTIF	PRO CITY IMMOBILIER	procityimmobilier	Monsieur	payen franck	agence@procityimmobilier.fr	0175579217	753300169	2021-06-21 08:06:20.728712	t
467	1270228	CLIENT ACTIF	SCI IMMOGROUP	immogroupmtourneuxetmvaygeois	Messieurs	m ludovic tourneux\nm alexis vaugeois	immogroup53@gmail.com	nan	827 837 915 00012	2021-06-21 08:06:29.060941	t
462	1270220	CLIENT ACTIF	SARL BOOSTER ROSERAIE	boosterimmobilier	Madame	reglat berengere	berengere@booster-valorem.com	0562307000	51498311300010	2021-06-21 08:06:25.229133	t
463	1270221	CLIENT	SALERNO MARC	salernomarc	Monsieur	salerno marc	salernomarc@orange.fr	0687933018	XXX	2021-06-21 08:06:25.997695	t
464	1270223	CLIENT ACTIF	SARL MPI	pennimmobilierimmobiliersarlmpi	Monsieur	penn marc	vitre@penn-immobilier.com	0299740000	44520775600013	2021-06-21 08:06:26.825221	t
468	1270229	CLIENT ACTIF	SARL  LOGETTE IMMOBILIER	nestennlogetteimmobilier	Madame	christine logette	merignac@nestenn.com	05 56 35 90 52	78934154200015	2021-06-21 08:06:29.601632	t
465	1270225	CLIENT ACTIF	J&R IMMOBILIER	laforetstorensdegamevilleelodiepech	Monsieur	rezag remy	saintorens@laforet.com	0582958451	838 405 322 00010	2021-06-21 08:06:27.543809	t
474	1270238	CLIENT ACTIF	SAVOUREUX CYRIL	savoureuxcyril	Monsieur	savoureux cyril	cyril.savoureux@gmail.com	06 89 73 88 60	xxx	2021-06-21 08:06:33.93315	t
469		CLIENT ACTIF	PARTICULIER	particulier	Madame et Monsieur	petillat damien et robert delphine	delphinrobert80@gmail.com	0682253010	PARTICULIER	2021-06-21 08:06:30.369191	t
472	1270235	CLIENT ACTIF	THEMEIS IMMOBILIER SGI SARL SOBIM GESTION IMMOBILIER	themeisimmobiliersgisarlsombimgestionimmobilier	Monsieur	morel jean marc	almarie@themeis.fr	01 34 83 31 36	80235796200017	2021-06-21 08:06:32.521959	t
470	1270232 l'Adresse Gambetta\n1270233 l'Adresse Cersoy & Girard	CLIENT ACTIF	SAS HOLDING LAURENT	l'adressegambettal'adressecersoy&girard	Monsieur	laurent eric	eric.laurent@ladresse.com	01 60 08 20 30 / 01 60 08 44 00	41175479900020	2021-06-21 08:06:31.076789	t
473	1270237	CLIENT ACTIF	DEHEUL Vincent	deheul﻿vincent	Monsieur	deheul vincent	Vincent.DEHEUL@albioma.com	06 22 84 23 95	xxx	2021-06-21 08:06:33.192577	t
476	1270240	CLIENT ACTIF	SASU ESPACE HABITAT BCI	espacehabitat	Madame	lagueyt  brigitte	gestion.espace.habitat@gmail.com	05 56 02 30 82	50502065100028	2021-06-21 08:06:35.482265	t
475		CLIENT ACTIF	MR ET MME DARDE	mretmmedarde	Madame et Monsieur	darde	select.product@wanadoo.fr	06 08 77 21 73	xxx	2021-06-21 08:06:34.753687	t
478		CLIENT PARTICULIER	SCI PIPA ACC	xxx	Madame	clavier anne-cecile	ac.clavier@gmail.com	06 75 60 09 81	83434119000017	2021-06-21 08:06:36.963415	t
479		CLIENT PARTICULIER	XXX	xxx	Monsieur	blot patrice	blotpatrice@gmail.com	06 76 50 53 21	XXX	2021-06-21 08:06:37.784951	t
480	1270244	CLIENT ACTIF	IMMO DE FRANCE LA ROCHE SUR YON	immodefrancelarochesuryon	MADAME	vaigreville murielle	mvaigreville@procivis-ouest.fr	0251377778	44136160700035	2021-06-21 08:06:38.576494	t
481	1270248	CLIENT ACTIF	SASU BERNARD KOENIG IMMOBILIER	guyhoquetparis14plaisancepernety	Monsieur	bernard  eric	paris14plaisance@guyhoquet.com       /           e.bernard@guyhoquet.com	01 81 69 77 20	82110015300013	2021-06-21 08:06:39.203134	t
482		CLIENT ACTIF	XXX	xxx	Monsieur	perrier jean joel	jean-joel2@hotmail.fr	06 16 90 40 38	XXX	2021-06-21 08:06:40.132602	t
483	1270252	CLIENT PARTICULIER	XXX	xxx	Madame et Monsieur	detoc olivier et laetitia	factdetoc@gmail.com	0662872212	XXX	2021-06-21 08:06:40.911156	t
484		CLIENT ACTIF	SARL ACTIAL	l'adressecarquefousarlactial	Monsieur	blanvillain sebastien	sebastien.blanvillain@ladresse.com	nan	389 918 137 00040	2021-06-21 08:06:41.601761	t
485		CLIENT ACTIF	XXX	boivinchampeauxbenedicteetalix	Madame et Monsieur	boivin-champeaux benedicte et alix	bboivinchampeaux@wanadoo.fr	01 45 04 11 39	XXX	2021-06-21 08:06:42.442278	t
486	1270255	CLIENT ACTIF	XXX	blanchemariehelene	Madame	blanche marie helene	mariehelene.blanche@laposte.net	06 80 22 72 35	XXX	2021-06-21 08:06:43.07492	t
487	1270256	CLIENT ACTIF	SAS	towerimmobilier	Monsieur	charpentier david	david.charpentier@tower-immobilier.fr	07 62 42 93 52	813492683	2021-06-21 08:06:43.761523	t
488		CLIENT ACTIF	XXX	chavyclaire	Madame	chavy claire	clairechavy@yahoo.fr	06 50 74 36 30	XXX	2021-06-21 08:06:44.570062	t
489		CLIENT ACTIF	SCI DES AMITIERES	morantinagnes	Madame	morantin agnes	agnesmorantin@gmail.com	06 76 56 08 61	878 321 231 00010	2021-06-21 08:06:45.138739	t
490		CLIENT ACTIF	SARL ACM TRANSACTION	acmtransactionmmebroussegeraldine	Madame	brousse geraldine	acm.transactions@gmail.com  / geraldineacm@gmail.com	05 56 59 61 25	49788559000024	2021-06-21 08:06:45.835337	t
491	1270266	CLIENT ACTIF	PARTICULIER	perrinehansen	Madame	perrine hansen	perrine.hansen@gmail.com	0640997915	XXX	2021-06-21 08:06:46.599898	t
492		CLIENT ACTIF	PARTICULIER	epagnouxsebastienludmila	Monsieur Madame	epagnoux sebastien ludmila	sepagnoux@yahoo.fr  /  lepagnoux@yahoo.com	06 86 41 19 89	XXX	2021-06-21 08:06:47.216547	t
493		nan	nan	bougelaurent	nan	\N	nan	nan	nan	2021-06-21 08:06:47.979109	t
494		CLIENT ACTIF	PARTICULIER	lefevrechristine	Monsieur	bouge laurent	laurent.bourge@valeo.com	06 08 76 24 52	XXX	2021-06-21 08:06:48.667715	t
495		CLIENT ACTIF	PARTICULIER	manganijeanmichel	Madame	lefevre christine	christinemarquis@sfr.fr	06.31.77.31.64	XXX	2021-06-21 08:06:49.290358	t
496		CLIENT ACTIF	PARTICULIER	manganijeanmichel	Monsieur	mangani  jean-michel	manganijm@yahoo.fr	: 06 10 27 16 30	XXX	2021-06-21 08:06:50.083905	t
497		Professionnel	PARTICULIER	lestiennethomasparticulier	Monsieur	lestienne thomas	tom.lestienne@gmail.com	06 58 89 11 16	tom.lestienne@gmail.com	2021-06-21 08:06:50.725536	t
\.


--
-- Data for Name: Client_History; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Client_History" (id, client_id, adresse1, adresse2, etat_client, cp, ville, pays, login_extranet, mpd_extranet, abonnement, date, visibility) FROM stdin;
1	1	Centre Commercial des Grandes Terres	nan	['barbara', 'immobilier', 'gic']	78160	MARLY-LE-ROY	FRANCE	AM001	H2Z1FA	\N	2021-06-21 07:58:47.590368	t
2	2	12 rue de l'Orangerie	nan	ARRET COLLABORATION	78000	VERSAILLES	FRANCE	nan	nan	\N	2021-06-21 07:58:48.475863	t
3	3	12 rue de l'Orangerie	nan	ARRET COLLABORATION	78000	VERSAILLES	FRANCE	nan	nan	\N	2021-06-21 07:58:49.287396	t
4	4	12 rue de l'Orangerie	nan	ARRET COLLABORATION	78000	VERSAILLES	FRANCE	nan	nan	\N	2021-06-21 07:58:49.972004	t
5	5	12 rue de l'Orangerie	nan	ARRET COLLABORATION	78000	VERSAILLES	FRANCE	nan	nan	\N	2021-06-21 07:58:50.719576	t
6	6	174 rue de Tolbiac	nan	['laforet']	75013	PARIS	FRANCE	nan	nan	\N	2021-06-21 07:58:51.413178	t
7	7	17 rue Dumont d'Urville	nan	INACTIF / ARRET COLLABORATION	75016	PARIS	FRANCE	nan	nan	\N	2021-06-21 07:58:52.212722	t
8	8	9 rue Pourtoules	nan	['laforet']	84100	ORANGE	FRANCE	nan	nan	\N	2021-06-21 07:58:53.166176	t
9	9	12  rue de l'Orangerie	nan	ARRET COLLABORATION	78000	VERSAILLES	FRANCE	nan	nan	\N	2021-06-21 07:58:53.980709	t
10	10	4 Place Vendôme	nan	ARRET COLLABORATION	75001	PARIS	FRANCE	nan	nan	\N	2021-06-21 07:58:54.97714	t
11	11	8 RUE DE LA CLAIE	nan	["l'adresse", 'anjou', 'maine', 'sarl', 'les', '3b']	49070	BEAUCOUZE	FRANCE	AM1841	H2Z1FA1	\N	2021-06-21 07:58:55.801667	t
12	12	70 bis route de la Reine	nan	['orpi']	92100	BOULOGNE BILLANCOURT	FRANCE	nan	nan	\N	2021-06-21 07:58:56.728138	t
13	13	7 bis rue de la Parroisse	nan	['laforet']	78000	VERSAILLES	FRANCE	nan	nan	\N	2021-06-21 07:58:57.65061	t
14	14	2 Place de la Gare	nan	['orpi', 'agence', 'du', 'marche']	92350	BOURG LA REINE	FRANCE	nan	nan	\N	2021-06-21 07:58:58.792959	t
15	15	1bis rue du Haras	nan	ARRET DE COLLABORATION SUITE VENTE	49100	ANGERS	FRANCE	nan	nan	\N	2021-06-21 07:59:01.341495	t
16	16	1 route de Champigné	nan	['etude', 'fauquereau', '-', 'simonet']	49330	CHATEAUNEUF SUR SARTHE	FRANCE	nan	nan	\N	2021-06-21 07:59:04.021963	t
17	17	117 - 123 rue d'Aguesseau	nan	['nouvel', 'espace']	92100	BOULOGNE BILLANCOURT	FRANCE	AM053	X7QAV4	\N	2021-06-21 07:59:05.250259	t
18	18	36 rue Jean-Pierre Timbaud	nan	REPRENDRE CONTACT	92130	ISSY LES MOULINEAUX	FRANCE	nan	nan	\N	2021-06-21 07:59:06.132756	t
19	19	106 rue de Général Leclerc	nan	['laforet']	95130	FRANCONVILLE	FRANCE	nan	nan	\N	2021-06-21 07:59:07.205142	t
20	20	4 Square des Artistes	nan	INACTIF	95520	OSNY	FRANCE	nan	nan	\N	2021-06-21 07:59:08.036664	t
21	21	17 rue Dumont d'Urville	nan	INACTIF / ARRET COLLABORATION	75016	PARIS	FRANCE	nan	nan	\N	2021-06-21 07:59:08.637321	t
22	22	10 rue Hubert de la Brosse	nan	ARRET CLIENT SUR VENTE  COMMERCE	44700	ORVAULT	FRANCE	nan	nan	\N	2021-06-21 07:59:09.40388	t
23	23	1 avenue Docteur Blanchet	nan	['calyso', 'immo']	77500	CHELLES	FRANCE	nan	nan	\N	2021-06-21 07:59:10.0645	t
24	24	3 rue de la Crèche	nan	['proximmonet']	77100	MEAUX	FRANCE	AM076	T4M7R0	\N	2021-06-21 07:59:10.664158	t
25	25	53 rue du Bournard	nan	['c', 'c', 'immobilier', 'gestion']	92700	COLOMBES	FRANCE	nan	nan	\N	2021-06-21 07:59:11.506678	t
26	26	9 rue Grandet	nan	['cabinet', 'lutz']	49000	ANGERS	FRANCE	AM081	NOGYL3	\N	2021-06-21 07:59:12.181289	t
27	27	8 bis rue Luis Bunuel	nan	INACTIF	77100	MEAUX	FRANCE	nan	nan	\N	2021-06-21 07:59:12.911872	t
28	28	2 rue Jean Bonnardel	nan	['laforet']	33140	VILLENAVE D'ORNON	FRANCE	nan	nan	\N	2021-06-21 07:59:13.720408	t
29	29	57 Bd Antoine Giroust	nan	INACTIF	77600	BUSSY SAINT GEORGES	FRANCE	nan	nan	\N	2021-06-21 07:59:14.410017	t
30	30	14 Cours du Maréchal Galliéni	nan	['br', 'immobilier']	nan	TALENCE\nBORDEAUX	FRANCE	nan	nan	\N	2021-06-21 07:59:15.257528	t
31	31	83 Cours du Maréchal Galliéni	nan	['immoassocies', 'gestion']	33000	BORDEAUX	FRANCE	nan	nan	\N	2021-06-21 07:59:15.98911	t
32	32	55 bis avenue Pasteur	nan	['orpi']	33600	PESSAC	FRANCE	nan	nan	\N	2021-06-21 07:59:16.663724	t
33	33	26/32 avenue de la Division Leclerc	nan	['laforet', 'antony']	92160	ANTONY	FRANCE	AM100	T4L7R0	\N	2021-06-21 07:59:17.514236	t
34	34	2 Bdl Maréchal Joffre	nan	['legendre', 'immobilier']	95240	CORMEILLES EN PARISIS	FRANCE	nan	nan	\N	2021-06-21 07:59:18.177857	t
35	35	3 Place du Marché	nan	INACTIF	77270	VILLEPARISIS	FRANCE	nan	nan	\N	2021-06-21 07:59:19.000388	t
36	36	11 rue du Chemin de Fer	nan	INACTIF	77400	LAGNY SUR MARNE	FRANCE	nan	nan	\N	2021-06-21 07:59:19.628025	t
37	37	7 rue de la Crèche	nan	INACTIF	77100	MEAUX	FRANCE	nan	nan	\N	2021-06-21 07:59:20.296642	t
38	38	57 Bd Antoine Giroust	nan	INACTIF	77600	BUSSY SAINT GEORGES	FRANCE	nan	nan	\N	2021-06-21 07:59:21.077199	t
39	39	57 Bd Antoine Giroust	nan	INACTIF	77600	BUSSY SAINT GEORGES	FRANCE	nan	nan	\N	2021-06-21 07:59:21.792785	t
40	40	57 Bd Antoine Giroust	nan	INACTIF	77600	BUSSY SAINT GEORGES	FRANCE	nan	nan	\N	2021-06-21 07:59:22.529364	t
41	41	8 rue de l'Eglise	nan	INACTIF	77970	BANNOST VILLEGAGNON	FRANCE	nan	nan	\N	2021-06-21 07:59:23.330911	t
42	42	22 avenue de la Libération	nan	['laforet']	33310	LORMONT	FRANCE	nan	nan	\N	2021-06-21 07:59:23.989534	t
43	43	30 rue de Bel Air	nan	['cabinet', 'guilloux']	44000	NANTES	FRANCE	nan	nan	\N	2021-06-21 07:59:24.784077	t
44	44	1 Place Saint Similien	nan	INACTIF	44000	NANTES	FRANCE	nan	nan	\N	2021-06-21 07:59:25.415712	t
45	45	24 rue Charles Rouxel	nan	INACTIF	77340	PONTAULT COMBAULT	FRANCE	nan	nan	\N	2021-06-21 07:59:26.060343	t
46	46	31 Cours saint Louis	nan	['laforet', 'immobilier', 'sarl', 'rpi']	33000	BORDEAUX	FRANCE	nan	nan	\N	2021-06-21 07:59:26.881883	t
47	47	1859 avenue Roger Salengro	nan	['amcv', '-', 'appartements', 'et', 'maisons']	92370	CHAVILLE	FRANCE	AM126	H2ZIF9	\N	2021-06-21 07:59:27.62045	t
48	48	58 avenue Auguste Conte	nan	ARRET DE COLLABORATION	33560	CARDON BLANC	FRANCE	nan	nan	\N	2021-06-21 07:59:28.575903	t
49	49	23 rue Condorcet	nan	ARRET SUITE VENTE DU COMMERCE	75009	PARIS	FRANCE	nan	nan	\N	2021-06-21 07:59:29.159571	t
50	50	105 route de la Reine	nan	['cabinet', 'lefevre', 'et', 'ducharme']	92100	BOULOGNE BILLANCOURT	FRANCE	AM129	K3COHQ	\N	2021-06-21 07:59:29.86617	t
51	51	5 rue du Pontcel	nan	ARRET DE COLLABORATION	95270	LUZARCHES	FRANCE	nan	nan	\N	2021-06-21 07:59:30.699687	t
52	52	8 Place de la Libération	nan	['agencity']	77600	BUSSY SAINT GEORGES	FRANCE	AM136	J3BOGA	\N	2021-06-21 07:59:31.79506	t
53	53	1 rue de l'Est	nan	INACTIF	77340	PONTAULT COMBAULT	FRANCE	nan	nan	\N	2021-06-21 07:59:32.575621	t
54	54	3 rue de la Marèche	nan	INACTIF	95180	MENUCOURT	FRANCE	nan	nan	\N	2021-06-21 07:59:33.20825	t
55	55	22 Bd des Filles du Calvaire	nan	INACTIF	75011	PARIS	FRANCE	nan	nan	\N	2021-06-21 07:59:34.329609	t
56	56	15 rue Paul Lorillon	BP17	ARRET DE COLLABORATION	95440	ECOUEN	FRANCE	nan	nan	\N	2021-06-21 07:59:35.016215	t
57	57	158 avenue Paul Doumer	nan	INACTIF	92500	RUEIL MALMAISON	FRANCE	nan	nan	\N	2021-06-21 07:59:35.769786	t
58	58	11 rue Maréchal Foch	nan	INACTIF / ARRET COLLABORATION	78400	CHATOU	FRANCE	nan	nan	\N	2021-06-21 07:59:36.479379	t
59	59	30 rue de Normandie	nan	INACTIF	92600	ASNIERES SUR SEINE	FRANCE	nan	nan	\N	2021-06-21 07:59:37.079034	t
60	60	46 rue Bertrand Flornoy	nan	ARRET DE COLLABORATION	77120	COULOMMIERS	FRANCE	nan	nan	\N	2021-06-21 07:59:37.876577	t
61	61	5 rue du Commandant Charcot	nan	ARRET DE COLLABORATION	33520	BRUGES	FRANCE	nan	nan	\N	2021-06-21 07:59:38.513214	t
62	62	21 avenue Thiers	nan	ARRET DE COLLABORATION	33100	BORDEAUX	FRANCE	nan	nan	\N	2021-06-21 07:59:39.165841	t
63	63	34 avenue Charles de Gaulle	nan	['orpi', 'cp', 'immo']	92350	LE PLESSIS ROBINSON	FRANCE	AM169	X7QAV4	\N	2021-06-21 07:59:40.044344	t
64	64	7 rue du Parisis	nan	ARRET DE COLLABORATION	95270	LUZARCHES	FRANCE	nan	nan	\N	2021-06-21 07:59:40.70396	t
65	65	6 Place du Général Leclerc	nan	['laforet', 'agence', 'le', 'ny']	92700	COLOMBES	FRANCE	AM171	ABB092	\N	2021-06-21 07:59:41.466523	t
66	66	20 avenue Pasteur	nan	['laforet', 'ibpb']	33600	PESSAC	FRANCE	nan	nan	\N	2021-06-21 07:59:42.299052	t
67	67	9 rue Gargoulleau	nan	['orpi']	17000	LA ROCHELLE	FRANCE	nan	nan	\N	2021-06-21 07:59:42.953672	t
68	68	45 rue des Rosiers	nan	INACTIF	92500	RUEIL MALMAISON	FRANCE	nan	nan	\N	2021-06-21 07:59:43.72423	t
69	69	265 Place de l'Eglise	nan	['laforet', '-', 'chambly']	60230	CHAMBLY	FRANCE	nan	nan	\N	2021-06-21 07:59:44.35087	t
70	70	24 rue des Halles	nan	["l'adresse", '-', 'lau', 'des', 'naiades']	85200	FONTENAY LE COMTE	FRANCE	AM177	W6P9VY	\N	2021-06-21 07:59:45.081454	t
71	71	32 rue de l'An VI	nan	["l'adresse", '-', 'chaille', 'les', 'marais', '-', 'lau', 'du', 'marais']	85450	CHAILLE LES MARAIS	FRANCE	AM178	J3BOGA	\N	2021-06-21 07:59:46.065889	t
72	72	20 rue Béranger	nan	['era', 'immobilier']	92240	MALAKOFF	FRANCE	nan	nan	\N	2021-06-21 07:59:46.800468	t
73	73	24 rue de Verdun	nan	['vendimo']	85000	LA ROCHE SUR YON	FRANCE	AM025	AM025	\N	2021-06-21 07:59:47.625999	t
74	74	45 avenue du Général de Gaulle	nan	['marans', 'immobilier']	17230	MARANS	FRANCE	nan	nan	\N	2021-06-21 07:59:48.249638	t
75	75	74 Quai de la République	nan	['masson', 'immobilier']	85800	SAINT GILLES CROIX DE VIIE	FRANCE	nan	nan	\N	2021-06-21 07:59:49.031194	t
76	76	7 bis rue  Maurice	nan	['buhler', 'frantz']	33300	BORDEAUX	FRANCE	nan	nan	\N	2021-06-21 07:59:49.736789	t
77	77	3 rue Louis Cormerais	nan	['century', '21', 'adl', 'immobilier']	44310	SAINT PHILBERT DES GRAND LIEU	FRANCE	nan	nan	\N	2021-06-21 07:59:50.364429	t
78	78	13 rue Bothiron	nan	['laforet', 'blanquefort']	33290	BLANQUEFORT	FRANCE	nan	nan	\N	2021-06-21 07:59:51.120998	t
79	79	54 Avenue Charles de Gaulle	nan	['huit', 'cinq', 'immobilier']	85340	OLONNE SUR MER	FRANCE	nan	nan	\N	2021-06-21 07:59:51.776619	t
80	80	2 AVENUE GERARD SAINT	nan	['ma', 'gestion', 'locative']	44300	NANTES	FRANCE	nan	nan	\N	2021-06-21 07:59:52.497207	t
81	81	8 Cité Condorcet	nan	['gtn', 'immobilier']	75009	PARIS	FRANCE	nan	nan	\N	2021-06-21 07:59:53.284757	t
82	82	1 avenue de la Plage	nan	['century', '21', 'bleu', 'marine']	85800	SAINT GILLES CROIX DE VIIE	FRANCE	nan	nan	\N	2021-06-21 07:59:54.093292	t
83	83	83 Boulevard de la République	nan	['office', 'de', 'la', 'propriete']	17200	ROYAN	FRANCE	AM201	X7QAV4	\N	2021-06-21 07:59:54.942809	t
84	84	30 rue Jules Vernes	nan	['immo', '44', '-', 'ciel', 'immobilier']	44470	CARQUEFOU	FRANCE	nan	nan	\N	2021-06-21 07:59:55.713366	t
85	85	28 rue de Verdun	nan	['etude', 'maitre', 'keravec', 'notaire']	44210	PORNIC	FRANCE	AM2021	Q0H4NI1	\N	2021-06-21 07:59:56.483924	t
86	86	39 41 rue de la République	nan	["l'adresse-", 'pontault', 'combault']	77340	PONTAULT COMBAULT	FRANCE	nan	nan	\N	2021-06-21 07:59:57.224504	t
87	87	5 rue Claude Bernard	nan	['abci', 'orpi', 'gestion']	75005	PARIS	FRANCE	nan	nan	\N	2021-06-21 07:59:57.793179	t
88	88	Résidence Marina Beach Bat 7 Porte 3	Bd Hassan II	['moinet']	20800	MOHAMMEDIA MAROC	FRANCE	nan	nan	\N	2021-06-21 07:59:58.535749	t
89	89	14 Boulevard de la Plage	nan	['buhler', 'hugo']	33138	TAUSSAT	FRANCE	nan	nan	\N	2021-06-21 07:59:59.213362	t
90	90	55 rue Raymond Berrurier	nan	['pyrault', 'laurent']	78320	LE MESNIL SAINT DENIS	FRANCE	nan	nan	\N	2021-06-21 07:59:59.809019	t
91	91	51 Avenue de la République	nan	['tikva', 'immobilier']	75011	PARIS	FRANCE	nan	nan	\N	2021-06-21 08:00:00.783463	t
92	92	22 rue d'Avron	nan	['guy', 'hoquet']	75020	PARIS	FRANCE	nan	nan	\N	2021-06-21 08:00:01.958458	t
93	93	232 Boulevard Voltaire	nan	['agence', 'ulys', 'pately', 'immobilier']	75011	PARIS	FRANCE	nan	nan	\N	2021-06-21 08:00:03.03422	t
94	94	249 bis rue des Pyrénées	nan	['les', 'paves', 'du', '20e']	75020	PARIS	FRANCE	nan	nan	\N	2021-06-21 08:00:03.972688	t
95	95	12 rue Hyppolyte Minier	nan	['marlere', 'jacques']	33800	BORDEAUX	FRANCE	nan	nan	\N	2021-06-21 08:00:04.976108	t
96	96	11 avenue de Bouvine	nan	['recherche', 'immobiliere']	75011	PARIS	FRANCE	nan	nan	\N	2021-06-21 08:00:05.840617	t
97	97	14 rue Montaigne	nan	['laforet', 'saint', 'medard', 'en', 'jalles']	33160	SAINT MEDARD EN JALLES	FRANCE	nan	nan	\N	2021-06-21 08:00:06.936988	t
98	98	32 boulevard Vincent Gache	nan	['citya']	44200	NANTES	FRANCE	nan	nan	\N	2021-06-21 08:00:07.843466	t
99	99	109 rue David Jonshton	nan	INACTIF-ARRET COLLABORATION	33000	BORDEAUX	FRANCE	nan	nan	\N	2021-06-21 08:00:08.793923	t
100	100	36 rue Jean-Pierre Timbaud	nan	['agence', 'martin', 'cote', 'seine', 'orpi']	92130	ISSY LES MOULINEAUX	FRANCE	nan	nan	\N	2021-06-21 08:00:10.49295	t
101	101	110 rue Orfila	nan	['paris', 'est', 'gestion']	75020	PARIS	FRANCE	nan	nan	\N	2021-06-21 08:00:11.728242	t
102	102	40 rue Héricart de Thury	nan	INACTIF-ARRET COLLABORATION	33120	ARCACHON	FRANCE	nan	nan	\N	2021-06-21 08:00:12.802626	t
103	103	4 bis rue Ravenel	nan	INACTIF	49000	ANGERS	FRANCE	nan	nan	\N	2021-06-21 08:00:14.117874	t
104	104	13 rue Ferdinand Buissou	nan	['renault', 'florent']	33250	PAUILLAC	FRANCE	nan	nan	\N	2021-06-21 08:00:15.33018	t
105	105	108 rue de la Tour	nan	['immobiliere', 'la', 'tour']	75016	PARIS	FRANCE	AM219	ILT16K	\N	2021-06-21 08:00:17.160132	t
106	106	6b Square Alexandre 1er de Yougoslavie	nan	['immo', 'mayenne']	53000	MAYENNE	FRANCE	nan	nan	\N	2021-06-21 08:00:18.417413	t
107	107	64 rue Ampère	nan	['immo', 'online']	75017	PARIS	FRANCE	AM220	W6P9TY	\N	2021-06-21 08:00:19.724666	t
108	108	1 AVENUE DE SARIA	nan	['guy', 'hoquet', 'serris', 'immobiliere', 'bussy', 'gestion']	77700	SERRIS	FRANCE	AM221	B8SQX5	\N	2021-06-21 08:00:20.95496	t
109	109	33 rue des Lices	nan	["l'adresse"]	49100	ANGERS	FRANCE	nan	nan	\N	2021-06-21 08:00:22.592023	t
110	110	rue du Haras	nan	['maisons', 'et', 'compaganie']	49000	ANGERS	FRANCE	nan	nan	\N	2021-06-21 08:00:23.685398	t
111	111	5 rue Jeanne D'arc	nan	["l'adresse", '-', '4', 'immo']	44000	NANTES	FRANCE	AM412	4IMO44	\N	2021-06-21 08:00:24.715806	t
112	112	nan	nan	['ataraxia']	44000	ORVAULT	FRANCE	nan	nan	\N	2021-06-21 08:00:25.681254	t
113	113	46-48 rue d'Avron	nan	['laforet', 'immobilier']	75020	PARIS	FRANCE	nan	nan	\N	2021-06-21 08:00:26.600729	t
114	114	13 rue des Petites Maisons	nan	['adrast', 'immobilier']	85480	SAINT HILAIRE LE VOUHIS	FRANCE	nan	nan	\N	2021-06-21 08:00:27.585164	t
115	115	94 Route de Claye	nan	CLIENT PARTICULIER	77400	THORIGNY sur MARNE	FRANCE	nan	nan	\N	2021-06-21 08:00:28.511639	t
116	116	1243 rue du Rosais	nan	['vrignon', 'immobilier']	85440	TALMONT SAINT HILAIRE	FRANCE	AM230	VRIG85	\N	2021-06-21 08:00:29.483078	t
117	117	3 bis rue Maingeaon	nan	['sauboy']	33720	ILLATS	FRANCE	nan	nan	\N	2021-06-21 08:00:31.20909	t
118	118	20 avenue Pasteur	nan	['pgi', 'laforet']	33200	PESSAC	FRANCE	nan	nan	\N	2021-06-21 08:00:32.134561	t
119	119	9 avenue Marcel Dassault	nan	['ajc', 'immobilier']	17312	ROCHEFORT SUR MER	FRANCE	AMI0138	tfevzK6u	\N	2021-06-21 08:00:33.728646	t
120	120	56 rue Gambetta	BP40523	['citya', 'immobilier', 'cote', 'de', 'beaute']	17200	ROYAN CEDEX	FRANCE	nan	nan	\N	2021-06-21 08:00:35.233785	t
121	121	4 Grande Rue	nan	["l'adresse", '-', 'la', 'chevroliere']	44118	LA CHEVROLIERE	FRANCE	nan	nan	\N	2021-06-21 08:00:37.903255	t
122	122	6 rue Francis de Pressense	nan	['hamon', 'antoine']	44000	NANTES	FRANCE	nan	nan	\N	2021-06-21 08:00:38.810737	t
123	123	29 rue Maurice Daniel	nan	['gadel', 'immobilier']	44230	SAINT SEBASTIEN SUR LOIRE	FRANCE	nan	nan	\N	2021-06-21 08:00:39.744202	t
124	124	29 rue Tourat	nan	['baranger', 'thierry']	33000	BORDEAUX	FRANCE	nan	nan	\N	2021-06-21 08:00:40.65668	t
125	125	135 rue de Ferreyre	nan	['laloy', 'philippe']	33450	IZON	FRANCE	nan	nan	\N	2021-06-21 08:00:41.674098	t
126	126	4 rue Gabriel Péri	nan	['planete', 'immobilier']	31000	TOULOUSE	FRANCE	nan	nan	\N	2021-06-21 08:00:42.545599	t
127	127	4 rue Georges Clémenceau	nan	['boileau', 'immobilier']	85520	JARD SUR MER	FRANCE	nan	nan	\N	2021-06-21 08:00:43.488058	t
128	128	1 rue Saint Aignan	nan	['laforet', 'saint', 'loubes']	33450	SAINT LOUBES	FRANCE	nan	nan	\N	2021-06-21 08:00:44.689371	t
129	129	Centre Commercial boulevard du Manoir Saint Lô	nan	['acbi']	44300	NANTES	FRANCE	nan	nan	\N	2021-06-21 08:00:45.960642	t
130	130	14 Boulevard de la Plage	nan	ARRET DE COLLABORATION	33120	ARCACHON	FRANCE	nan	nan	\N	2021-06-21 08:00:47.219921	t
131	131	9 Allée E Boissière	nan	['delta', 'immobilier']	33980	AUDENGE	FRANCE	nan	nan	\N	2021-06-21 08:00:48.36227	t
132	132	202 Bd Voltaire	nan	['guy', 'hoquet', 'paris', '11', 'voltaire']	75011	PARIS	FRANCE	nan	nan	\N	2021-06-21 08:00:50.181228	t
133	133	1 rue Serpentine BP 52	nan	['cabinet', 'sionneau']	85002	LA ROCHE SUR YON	FRANCE	AM451	SIO85C	\N	2021-06-21 08:00:51.395533	t
134	134	6rue de Nadeau	nan	['maumy', 'parade', 'brigitte']	33200	BORDEAUX	FRANCE	nan	nan	\N	2021-06-21 08:00:53.247474	t
135	135	41 RUE DES LICES	nan	['etoile', 'immobiliere']	49100	ANGERS	FRANCE	AM2591	JOUB491	\N	2021-06-21 08:00:54.487761	t
136	136	5 Place Lorraine	nan	['sergic']	49000	ANGERS	FRANCE	AM610	SER49P	\N	2021-06-21 08:00:55.959919	t
137	137	7 Bd Arnaud	nan	['abc', 'immobilier']	49100	ANGERS	FRANCE	AM261	49ABCI	\N	2021-06-21 08:00:57.592986	t
138	138	226 rue Marcadet	nan	CLIENT PARTICULIER	75018	PARIS	FRANCE	nan	nan	\N	2021-06-21 08:00:59.288015	t
139	139	52 Bis Boulevard foch	nan	['vivire', 'ici']	49100	ANGERS	FRANCE	nan	nan	\N	2021-06-21 08:01:00.819136	t
140	140	36 bis Cours de Verdun	nan	['acheter', 'du', 'neuf']	33000	BORDEAUX	FRANCE	nan	nan	\N	2021-06-21 08:01:02.23233	t
141	141	19 rue du Primptemps	nan	['cabinet', 'berard']	75017	PARIS	FRANCE	nan	nan	\N	2021-06-21 08:01:03.952347	t
142	142	1C avenue Ch. Doppler	nan	['bl', 'agent']	77700	SERRIS	FRANCE	nan	nan	\N	2021-06-21 08:01:05.368532	t
143	143	63/65 Boulevard Georges V	nan	['george', 'v', 'sarl', 'yapluka']	33000	BORDEAUX	FRANCE	nan	nan	\N	2021-06-21 08:01:07.335411	t
144	144	148 Boulevard Voltaire	nan	['laforet']	75011	PARIS	FRANCE	AM2681	LDPAR75	\N	2021-06-21 08:01:08.613684	t
145	145	2 Place Saint Pierre	nan	['carquefou', 'immobilier']	44470	CARQUEFOU	FRANCE	nan	nan	\N	2021-06-21 08:01:09.736033	t
146	146	C.C DE L'OLIVEY 146 avenue de la République	nan	['avis', 'immobilier', 'saint', 'loubes']	33450	SAINT LOUBES	FRANCE	nan	nan	\N	2021-06-21 08:01:11.139233	t
147	147	16 rue de la Plage	nan	['groupe', 'biran', 'immobilier']	33780	SOULAC	FRANCE	nan	nan	\N	2021-06-21 08:01:12.357535	t
148	148	48 BOULEVARD DE VANVES	nan	["l'adresse", '-', 'chatillon']	92320	CHATILLON	FRANCE	AM272	BPR92P	\N	2021-06-21 08:01:13.86767	t
149	149	23 avenue Aristide Briand	nan	['guy', 'hoquet', 'aerissimo']	92160	ANTONY	FRANCE	AM273	AER92G	\N	2021-06-21 08:01:14.95005	t
150	150	12 avenue du Gé,éral de Gaulle	nan	["l'adresse", '-', 'bussy', 'saint', 'georges']	77600	BUSSY SAINT GEORGES	FRANCE	AM274	SYL6QO	\N	2021-06-21 08:01:16.198334	t
151	151	10 bis rue du Général Leclerc	nan	['huit', 'cinq', 'challans']	85300	CHALLANS	FRANCE	nan	nan	\N	2021-06-21 08:01:17.599531	t
152	152	88 avenue Henri Barbusse	nan	['aci', 'immobilier']	94240	L'HAY LES ROSES	FRANCE	nan	nan	\N	2021-06-21 08:01:18.873802	t
153	153	44 rue de Paris	nan	['aura', 'immobilier']	93260	LES LILAS	FRANCE	AM277	AUR93B	\N	2021-06-21 08:01:20.454897	t
154	154	1 rue Amedée Gordini	nan	['pool', 'immobilier', 'sablais']	85109	LES SABLES D'OLONNE	FRANCE	AM2781	J3BOGA1	\N	2021-06-21 08:01:22.700611	t
155	155	11 rue Chanez	nan	['logic', 'home']	75016	PARIS	FRANCE	nan	nan	\N	2021-06-21 08:01:24.987304	t
156	156	8 RUE DENIS PAPIN	nan	["l'adresse", '-', 'cabinet', 'pautout']	41000	BLOIS	FRANCE	AM281	Q0J4NI	\N	2021-06-21 08:01:27.083104	t
157	157	5 Quai de Bacalan	nan	['buhler', 'bernard']	33300	BORDEAUX	FRANCE	nan	nan	\N	2021-06-21 08:01:30.0554	t
158	158	5 BOULEVARD ILE VERTIME	nan	['effigest', 'immo']	85100	LES SABLES D'OLONNE	FRANCE	AM283	K3COHQ	\N	2021-06-21 08:01:32.087238	t
159	159	68 rue de la Rousselle	nan	['hekimian', 'nicolas']	33000	BORDEAUX	FRANCE	nan	nan	\N	2021-06-21 08:01:37.14431	t
160	160	19 rue du Cep	nan	['gimcovermeille', 'poissy', '-', 'cabinet', 'fisson']	78300	POISSY	FRANCE	AM285	FIS078	\N	2021-06-21 08:01:38.741397	t
161	161	38 40 rue de la Convention	nan	['kb', 'immobilier']	94270	LE KREMELIN BICETRE	FRANCE	nan	nan	\N	2021-06-21 08:01:41.645732	t
162	162	13 Boulevard Guisthau	nan	['citya', 'nantes']	44000	NANTES	FRANCE	AM294	CTI44	\N	2021-06-21 08:01:44.613035	t
163	163	15 rue Carnot	nan	['gimcovermeille', 'confalans']	78700	CONFLANS SAINTE HONORINE	FRANCE	nan	nan	\N	2021-06-21 08:01:47.20355	t
164	164	2 Place division Leclrec	nan	['gimcovermeille', 'voisin']	78960	VOISINS LE BRETONNEUX	FRANCE	nan	nan	\N	2021-06-21 08:01:49.724111	t
165	165	123 rue du Chateau	nan	INACTIF-ARRET COLLABORATION	92100	BOULOGNE BILLANCOURT	FRANCE	AM293	TRA92S	\N	2021-06-21 08:01:52.788353	t
166	166	67 Boulevard Voltaire	nan	['laforet', 'saint', 'ambroise']	75011	PARIS	FRANCE	AM295	SAI11P	\N	2021-06-21 08:01:57.749037	t
167	167	59 bis Grande Rue	nan	['icy', 'immobilier']	85430	AUBIGNY	FRANCE	nan	nan	\N	2021-06-21 08:01:58.784443	t
168	168	91 rue de Faubourg Saint Honoré	nan	['carvel', 'et', 'associes']	75008	PARIS	FRANCE	nan	nan	\N	2021-06-21 08:02:01.126101	t
169	169	37 rue Proudhon	nan	['cabinet', 'mimas']	75012	PARIS	FRANCE	AM298	HAU12R	\N	2021-06-21 08:02:02.44135	t
170	170	37 rue Proudhon  //   246 RUE DU FBG ST ANTOINE	nan	['cabinet', 'hoarau']	75012	PARIS	FRANCE	nan	nan	\N	2021-06-21 08:02:03.851541	t
171	171	4 rue Joachin du Bellay	nan	['mandat&moi']	49100	ANGERS	FRANCE	nan	nan	\N	2021-06-21 08:02:05.951343	t
172	172	9 rue du Général Leclerc	nan	['com', 'promis', 'immobilier']	94510	LA QUEUE EN BRIE	FRANCE	nan	nan	\N	2021-06-21 08:02:07.151655	t
173	173	1 rue des Halles	nan	["l'adresse", '-', 'label', 'immo', '85']	85000	LA ROCHE SUR YON	FRANCE	AM3031	LABE0851	\N	2021-06-21 08:02:08.380951	t
174	174	83 rue Sadi Carnot	nan	['la', 'dhuys', 'immobilier']	93170	BAGNOLET	FRANCE	nan	nan	\N	2021-06-21 08:02:09.430349	t
175	175	91 rue de Charonne	nan	['era', 'charonne', 'bastille']	75011	PARIS	FRANCE	AM3070	Er#a11Cha	\N	2021-06-21 08:02:10.504733	t
176	176	92 rue Gambetta	nan	['mgl', '-', 'laforet', 'immobiliere', 'de', 'royan']	17200	ROYAN	FRANCE	AM308	ROY017	\N	2021-06-21 08:02:11.628092	t
177	177	61 rue de Passy	nan	['.']	75016	PARIS	FRANCE	nan	nan	\N	2021-06-21 08:02:12.713469	t
178	178	20 rue du Bac de Ris Bat C8	nan	['.']	91450	SOISY SUR SEINE	FRANCE	nan	nan	\N	2021-06-21 08:02:14.35153	t
179	179	1 avenue Jacques Cartier	nan	['imonet']	77600	BUSSY SAINT GEORGES	FRANCE	nan	nan	\N	2021-06-21 08:02:15.382939	t
180	180	154 avenue de Wagram	nan	['belimmo']	75017	PARIS	FRANCE	AM313	BELI15	\N	2021-06-21 08:02:16.365376	t
181	181	49 rue de Dijon	nan	['.']	21121	DAIX	FRANCE	nan	nan	\N	2021-06-21 08:02:17.424771	t
182	182	11 Boulevard de Strasbourg	nan	["l'adresse", '-', 'adn', 'gestion', 'transaction']	94130	NOGENT SUR MARNE	FRANCE	nan	nan	\N	2021-06-21 08:02:18.340245	t
183	183	21 Cours Dupont	nan	['central', 'immobilier', 'jeremy', 'garcia']	85100	LES SABLES D'OLONNE	FRANCE	AM218	P0H4MI	\N	2021-06-21 08:02:20.220172	t
184	184	95 avenue Ledru Rolin	nan	['guy', 'hoquet', 'jb', 'immo']	75011	PARIS	FRANCE	AM317	JBS11G	\N	2021-06-21 08:02:21.602378	t
185	185	122 rue de Paris	nan	['immobiliere', 'de', 'boulogne']	92100	BOULOGNE BILLANCOURT	FRANCE	nan	nan	\N	2021-06-21 08:02:23.063549	t
186	186	21 bis rue des Sables	nan	['.']	85340	OLONNE SUR MER	FRANCE	nan	nan	\N	2021-06-21 08:02:24.573895	t
187	187	56 rue Jean Bleuzen	nan	['laforet', 'accessim']	92170	VANVES	FRANCE	nan	nan	\N	2021-06-21 08:02:25.475379	t
188	188	8 rue Philippe le Hurepel	nan	['.']	77230	DAMARTIN EN GOELE	FRANCE	nan	nan	\N	2021-06-21 08:02:26.289915	t
189	189	20 rue du Belvédère	nan	['sci', 'dessous', 'les', 'berges']	92100	BOULOGNE BILLANCOURT	FRANCE	AM322	GHAU75	\N	2021-06-21 08:02:27.170412	t
190	190	13 Rue du Maréchal Joffre	nan	['groupe', 'cil', 'atlantique']	85000	LA ROCHE SUR YON	FRANCE	nan	nan	\N	2021-06-21 08:02:28.060901	t
191	191	48 rue du Brandon	nan	['sarl', 'les', 'herbiers', 'gestion']	85500	LES HERBIERS	FRANCE	AM326	CB1H32PE	\N	2021-06-21 08:02:30.55747	t
192	192	15 bis avenue du Maréchal Foch	nan	['guy', 'hoquet']	77500	CHELLES	FRANCE	nan	nan	\N	2021-06-21 08:02:31.413979	t
193	193	21 rue Jeanne Jugan	nan	['.']	35400	SAINT MALO	FRANCE	nan	nan	\N	2021-06-21 08:02:32.24451	t
194	194	1 rue de l'Eglise	nan	['agence', 'porte', 'de', 'l', 'ocean']	85580	SAINT MICHEL EN L HERM	FRANCE	nan	nan	\N	2021-06-21 08:02:33.731655	t
195	195	16 rue de la Fontaine du But	nan	['mg', 'aparte']	75018	PARIS	FRANCE	nan	nan	\N	2021-06-21 08:02:34.678111	t
196	196	21 Bouleard Guist'hau	nan	['citya', 'nantes']	44000	NANTES	FRANCE	AM294	CTI44	\N	2021-06-21 08:02:35.527627	t
197	197	156 rue Nationale	nan	['etude', 'immobiliere', 'de', 'lille']	59000	LILLE	FRANCE	AM334	ETDN59	\N	2021-06-21 08:02:36.392129	t
198	198	156 rue Nationale	nan	['etude', 'immobiliere', 'de', 'lille']	59000	LILLE	FRANCE	AM335	ETLCI1	\N	2021-06-21 08:02:37.119712	t
199	199	31 Boulevard Jean Rose	nan	['agence', 'chanot']	77100	MEAUX	FRANCE	AM336	CHA077	\N	2021-06-21 08:02:38.133132	t
200	200	17 rue du 8 mai 1945	nan	['.']	94240	L'HAY LES ROSES	FRANCE	nan	nan	\N	2021-06-21 08:02:39.248495	t
201	201	18 avenue de la République	nan	['la', 'residence', 'cote', 'location']	78200	MANTES LA JOLIE	FRANCE	nan	nan	\N	2021-06-21 08:02:40.234929	t
202	202	48 rue du Brandon	nan	['sarl', 'celine', 'immobilier']	85500	LES HERBIERS	FRANCE	AM339	CEL85M	\N	2021-06-21 08:02:41.318311	t
203	203	19 rue de Vienne	TSA 90033	['gip', 'richardiere']	75801	PARIS	FRANCE	nan	nan	\N	2021-06-21 08:02:42.66154	t
204	204	10/12 Place Vendôme	nan	['eurigest']	75001	PARIS	FRANCE	AM342	HOME75	\N	2021-06-21 08:02:43.700945	t
205	205	14 Huberman Street	nan	['chelouche', 'jacques']	64075	TEL-AVIV ISRAEL	FRANCE	nan	nan	\N	2021-06-21 08:02:44.502485	t
206	206	4 rue Corvetto	nan	['.']	75008	PARIS	FRANCE	nan	nan	\N	2021-06-21 08:02:45.483925	t
207	207	20 Allée des 4 Vents	nan	['.']	92160	ANTONY	FRANCE	nan	nan	\N	2021-06-21 08:02:46.949084	t
208	208	33 rue de l'Orangerie	nan	['cabinet', 'juan']	78000	VERSAILLES	FRANCE	nan	nan	\N	2021-06-21 08:02:48.305309	t
209	209	70 rue d'Auteuil	nan	['guy', 'hoquet', 'auteuil']	75016	PARIS	FRANCE	AM322	GHAU75	\N	2021-06-21 08:02:49.459648	t
210	210	24 rue du 3 Aout 1944	nan	['saint', 'mars', 'immobilier', '-sarl', 'else', 'immo']	44850	SAINT MARS DU DESERT	FRANCE	AM348	STM044	\N	2021-06-21 08:02:50.863845	t
211	211	23 BIS RUE DE LA BORDERIE	nan	['diard']	35000	VITRE	FRANCE	nan	nan	\N	2021-06-21 08:02:51.890258	t
212	212	4 rue du Champs Dolent	nan	['scp', 'lecuyer', 'jouan', 'paulet']	35000	RENNES	FRANCE	nan	nan	\N	2021-06-21 08:02:53.050592	t
213	213	34 Avenue Foch	nan	['sabine', 'de', 'jarnac', 'immobilier']	92420	VAUCRESSON	FRANCE	nan	nan	\N	2021-06-21 08:02:54.141968	t
214	214	83 BIS RUE DE COURCELLES	nan	['nexity', 'courcelles']	75017	PARIS	FRANCE	nan	nan	\N	2021-06-21 08:02:55.340281	t
215	215	10 rue de la Brosse	nan	['cabinet', 'i', 'orvault']	44700	ORVAULT	FRANCE	AM3531	ORV044	\N	2021-06-21 08:02:56.649531	t
216	216	46 rue du Petit Prince	nan	['cabinet', 'i', 'vigneux', 'de', 'bretagne']	44360	VIGNEUX DE BRETAGNE	FRANCE	AM354	VIG044	\N	2021-06-21 08:02:57.61798	t
217	217	15 rue de la Madeleine	nan	['cabinet', 'i', 'fay', 'de', 'bretagne']	44130	FAY DE BRETAGNE	FRANCE	AM355	FAY044	\N	2021-06-21 08:02:59.130111	t
218	218	15 rue du Pont aux Foulons	nan	['lelievre', 'immobilier']	35000	RENNES	FRANCE	AM356	nan	\N	2021-06-21 08:03:00.297445	t
219	219	4 rue Galilée	nan	['nexity', 'paris', 'trocadero']	75016	PARIS	FRANCE	nan	nan	\N	2021-06-21 08:03:01.326855	t
220	220	20 rue de l'Ocean	nan	['agence', 'immobiliere', 'th.', 'fourny', 'thierry', 'fourny']	44810	HERIC	FRANCE	AM358	HER044	\N	2021-06-21 08:03:02.420227	t
221	221	183 boulevard Voltaire	nan	['.']	75011	PARIS	FRANCE	nan	nan	\N	2021-06-21 08:03:04.47405	t
222	222	Lieu dit la BARTAIE	nan	['.']	49370	SAINT CLEMENT DE LA PLACE	FRANCE	nan	nan	\N	2021-06-21 08:03:06.573852	t
223	223	50 Rue d'Anjou	nan	['.']	49125	TIERCE	FRANCE	nan	nan	\N	2021-06-21 08:03:07.668222	t
224	224	1 AVENUE DU MARECHAL FOCH	nan	['orpi', 'immo', 'seba', 'houilles']	78800	HOUILLES	FRANCE	AM365	SEB78M	\N	2021-06-21 08:03:08.640665	t
225	225	14 avenue du Maréchal Foch	nan	['afr', 'immobilier']	78400	CHATOU	FRANCE	nan	nan	\N	2021-06-21 08:03:09.692064	t
226	226	1 Allée des Magnolias	nan	['.']	94550	CHAVILLY LARUE	FRANCE	nan	nan	\N	2021-06-21 08:03:10.604545	t
227	227	511 Route Saint Joseph	nan	["l'adresse", '-', 'nantes', '-', "l'atelier", 'immobilier']	44745	NANTES	FRANCE	AM3681	GUI0441	\N	2021-06-21 08:03:11.51302	t
228	228	2 Cours d'Armor Route de Savenay	nan	['office', 'notarial', 'alexandre', 'moriceau']	44360	SAINT ETIENNE DE MONTLUC	FRANCE	AMI0250	PfiUjivT	\N	2021-06-21 08:03:12.445486	t
229	229	8 rue des Croix	nan	["l'adresse", 'maison', 'blanche']	53000	LAVAL	FRANCE	AM3701	MAIS531	\N	2021-06-21 08:03:13.510879	t
230	230	19 Boulevard Alexandre Martin	nan	['sergic']	45000	ORLEANS	FRANCE	AM375	SERG45	\N	2021-06-21 08:03:14.582264	t
231	231	65 avenue Suffren	nan	['.']	75007	PARIS	FRANCE	nan	nan	\N	2021-06-21 08:03:15.5649	t
232	232	3 rue de la Mairie	nan	PROSPECT	29470	PLOUGASTEL DAOULAS	FRANCE	AM400	PLO029	\N	2021-06-21 08:03:16.548337	t
233	233	25 rue Traverse	nan	['christine', 'dumas', 'immobilier']	29200	BREST	FRANCE	AM401	DUM029	\N	2021-06-21 08:03:17.64271	t
234	234	34 avenue des Tilleuls	nan	['agence', 'des', 'tilleuls']	17204	ROYAN Cedex	FRANCE	nan	nan	\N	2021-06-21 08:03:18.511214	t
235	235	36 rue de Paris	nan	['arthur', 'immo', '-', 'laval']	53000	LAVAL	FRANCE	AM405	PRO053	\N	2021-06-21 08:03:19.512643	t
236	236	20 Avenue du Maréchal Joffre	nan	['profigest', 'immobilier']	53200	CHATEAU GONTIER	FRANCE	nan	nan	\N	2021-06-21 08:03:20.407133	t
237	237	96 Boulevard des Batignolles	nan	['craunot', 'djc', 'invest']	75017	PARIS	FRANCE	AM4081	DJC7517	\N	2021-06-21 08:03:21.404561	t
238	238	23 rue de Lyon	BP61107	['janin', 'immobilier']	29211	BREST	FRANCE	nan	nan	\N	2021-06-21 08:03:22.311039	t
239	239	44 rue du Château	nan	['le', 'martret', 'immobilier']	29200	BREST	FRANCE	AM410	LEM029	\N	2021-06-21 08:03:23.310468	t
240	240	30 rue Montgolfier	nan	['.']	93500	PANTIN	FRANCE	nan	nan	\N	2021-06-21 08:03:24.85658	t
241	241	4 rue Jeanne d'Arc	nan	["l'adresse", '4', 'immo']	44000	NANTES	FRANCE	AM4121	4IMO441	\N	2021-06-21 08:03:25.723084	t
242	242	36 rue de Versailles	nan	['cabinet', 'milivin', 'laforet']	78150	LE CHESNAY	FRANCE	nan	nan	\N	2021-06-21 08:03:26.821455	t
243	243	52 Bis Boulevard Foch	nan	['cabinet', 'treard', '-', 'vivre', 'ici']	49100	ANGERS	FRANCE	nan	nan	\N	2021-06-21 08:03:27.805893	t
244	244	1 RESIDENCE FONTAINE SAINT MARC	nan	CLIENT PARTICULIER	77000	MELUN	FRANCE	nan	nan	\N	2021-06-21 08:03:28.896267	t
245	245	15 CHEMIN DU RO LA MADELAINE	nan	['particulier']	44350	GUERANDE	FRANCE	nan	nan	\N	2021-06-21 08:03:30.407403	t
246	246	26 rue de Douarnenez	nan	['agence', 'griffon', 'gueguen', 'immobilier']	29000	QUIMPER	FRANCE	AM420	GRI029	\N	2021-06-21 08:03:31.329878	t
247	247	33 rue Delaâge	nan	['cabinet', 'tapissier']	49000	ANGERS	FRANCE	nan	nan	\N	2021-06-21 08:03:32.208374	t
248	248	24 rue Bannier	nan	['valrim', 'orpi']	45000	ORLEANS	FRANCE	AM600	PIC17V	\N	2021-06-21 08:03:33.722505	t
249	249	74  rue de la Boulie	nan	['.']	91370	VERRIERE LE BUISSON	FRANCE	nan	nan	\N	2021-06-21 08:03:34.893835	t
250	250	47 RUE ANATOLE FRANCE	nan	["l'adresse", '-', 'chavilles']	92370	CHAVILLE	FRANCE	nan	nan	\N	2021-06-21 08:03:35.864278	t
251	251	59 rue Denis Papin	nan	['laforet', 'immobilier', 'du', 'cnetre']	41000	BLOIS	FRANCE	AM4280	AgDC#041	\N	2021-06-21 08:03:36.821732	t
252	252	66 Avenus du Général Leclerc	nan	['agence', 'ati', 'thomasse', 'immobilier']	72000	LE MANS	FRANCE	nan	nan	\N	2021-06-21 08:03:37.631266	t
253	253	4 rue Pauline et Daniel Oehlert	BP717	['office', 'maitre', 'darphin']	53007	LAVAL Cedex	FRANCE	AM432	DARP53	\N	2021-06-21 08:03:38.803598	t
254	254	16 rue Daniel Oelhert	nan	CLIENT INACTIF	53001	LAVAL	FRANCE	nan	nan	\N	2021-06-21 08:03:40.105849	t
255	255	3 avenue du Président Wilson	nan	['blois', 'immo']	41000	BLOIS	FRANCE	AM4340	BL41#imo	\N	2021-06-21 08:03:41.149252	t
256	256	14 Place Aristide Briand	nan	['maite', 'marteau']	72000	LE MANS	FRANCE	nan	nan	\N	2021-06-21 08:03:42.226639	t
257	257	7 Rue de Beauval	nan	['podeliha']	49100	ANGERS	FRANCE	AM4361	juGYT76tf	\N	2021-06-21 08:03:43.102134	t
258	258	47 RUE ANATOLE FRANCE	nan	["l'adresse", '-', '4', 'amb', 'gestion', 'immo']	92370	CHAVILLE	FRANCE	AM4371	sziZCkU6	\N	2021-06-21 08:03:44.06059	t
259	259	28 Quai Charles de Gaulle	nan	['obi', '29']	29150	CHATEAULIN	FRANCE	AM438	OBI029	\N	2021-06-21 08:03:44.92609	t
260	260	12 Place de l'Eglise	BP324	['avis', 'immobilier', 'loudeac']	22600	LOUDEAC	FRANCE	nan	nan	\N	2021-06-21 08:03:45.763612	t
261	261	4 Avenue Champagné	nan	CLIENT PARTICULIER	53400	CRAON	FRANCE	nan	nan	\N	2021-06-21 08:03:46.747051	t
262	262	32 Rue Saint Nicolas	nan	CLIENT PARTICULIER	49000	ANGERS	FRANCE	nan	nan	\N	2021-06-21 08:03:47.566579	t
263	263	7 avenue Joffre	nan	['laforet', 'hp', 'conseils']	92380	GARCHES	FRANCE	nan	nan	\N	2021-06-21 08:03:48.401102	t
264	264	7 rue de la Mairie	nan	['cabinet', 'rebours']	29480	LE RELECQ KERHUON	FRANCE	nan	nan	\N	2021-06-21 08:03:49.201647	t
265	265	34 Chemin de Kernoter	nan	['.']	29000	QUIMPER	FRANCE	nan	nan	\N	2021-06-21 08:03:50.437935	t
266	266	32 COLVILLE TERRACE	nan	['.']	nan	LONDON W112BU	FRANCE	nan	nan	\N	2021-06-21 08:03:51.346413	t
267	267	86 avenue La Fayette	nan	['baratte', 'immobilier']	17300	ROCHEFORT	FRANCE	AM253	BAR85T	\N	2021-06-21 08:03:53.873969	t
268	268	17 rue Jules Ferry	nan	CLIENT PARTICULIER	91790	BOISSY SOUS SAINT YON	FRANCE	nan	nan	\N	2021-06-21 08:03:56.636391	t
269	269	PArc tertiaire Technopolis Einstein	nan	['square', 'habitat-', 'zambon', 'immobilier']	53810	CHANGE	FRANCE	nan	nan	\N	2021-06-21 08:03:57.469908	t
270	270	35 RUE DES BONSN VENTS	nan	['particulier']	44850	LIGNE	FRANCE	nan	nan	\N	2021-06-21 08:03:58.308428	t
271	271	234 rue de la Convention	nan	['guy', 'hoquet', 'bussat', 'dunne', 'immobilier']	75015	PARIS	FRANCE	AM4581	BUDU15	\N	2021-06-21 08:03:59.168936	t
272	272	2 rue Verdière	nan	['agence', 'des', 'quatres', 'sergents']	17000	LA ROCHELLE	FRANCE	AM4590	4SER#17	\N	2021-06-21 08:04:00.260312	t
273	273	47 avenue de Paris	nan	['brio', 'gestion']	94300	VINCENNES	FRANCE	AM461	BRI094	\N	2021-06-21 08:04:01.105828	t
274	274	10 rue d'Isly	nan	['citya', 'belvia', 'rennes']	35000	RENNES	FRANCE	AM467	REN035	\N	2021-06-21 08:04:01.944346	t
275	275	28 Boulevard Rouget de Lisle	nan	['guy', 'hoquet', 'montreuil', 'brient', 'immobilier']	93100	MONTREUIL	FRANCE	AM468	BRIE93	\N	2021-06-21 08:04:03.056715	t
276	276	5 Boulevard Marécahl Joffe	nan	['citya', 'lorient']	56100	LORIENT	FRANCE	AM469	LORI56	\N	2021-06-21 08:04:03.697344	t
277	277	6 Bis avenue de la Libération	nan	['cote', 'particuliers']	45700	VILLEMANDEUR	FRANCE	AM4720	45cVIL#Pap	\N	2021-06-21 08:04:04.549855	t
278	278	17 bis rue Aristide Briand	nan	["l'adresse", '-', 'etampes']	91150	ETAMPES	FRANCE	AM474	UGSP91	\N	2021-06-21 08:04:05.237462	t
279	279	115 Promenade des Cours	nan	['.']	86000	POITIERS	FRANCE	nan	nan	\N	2021-06-21 08:04:05.967049	t
280	280	51 Boulevard Carnot	nan	['am', 'immobilier']	78110	LE VESINET	FRANCE	AM4801	AMI0781	\N	2021-06-21 08:04:06.818556	t
281	281	Route de Corzé	nan	['giempe', 'immobilier']	49140	JARZE VILLAGE	FRANCE	nan	nan	\N	2021-06-21 08:04:07.453193	t
282	282	1 RUE DE LA CLAYE	nan	["l'adresse", 'thori', 'lagny']	77400	THORIGNY SUR MARNE	FRANCE	AM4831	PHC0771	\N	2021-06-21 08:04:08.248736	t
283	283	7 rue Nationale	nan	PROSPECT	85110	CHANTONNAY	FRANCE	AM484	FRU085	\N	2021-06-21 08:04:09.211188	t
284	284	33 rue Louis Pasteur	nan	ARRET  COLLABORATION	29000	BREST	FRANCE	AM486	HAS029	\N	2021-06-21 08:04:10.137662	t
285	285	37 avenue de Quincy	nan	DOUBLON DE SAISIE	77380	COMB LA VILLE	FRANCE	nan	nan	\N	2021-06-21 08:04:10.988168	t
286	286	52 Boulevard de la liberté	nan	['agir', 'immobilier-cabinet', 'guerry']	35000	RENNES	FRANCE	AM4881	AGIR3501	\N	2021-06-21 08:04:11.798706	t
287	287	6 rue de la Barre	nan	["l'adresse", '-', 'chateaubriant']	44110	CHATEAUBRIANT	FRANCE	AM490	TRIO44	\N	2021-06-21 08:04:12.76615	t
288	288	29 avenue Carnot	nan	['.']	91370	VERRIERES LE BUISSON	FRANCE	nan	nan	\N	2021-06-21 08:04:13.536709	t
289	289	31 rue Jean Fontaine	nan	['.']	75016	PARIS	FRANCE	nan	nan	\N	2021-06-21 08:04:14.461183	t
290	290	445 Route d'Avignon	nan	['.']	84200	CARPENTRAS	FRANCE	nan	nan	\N	2021-06-21 08:04:15.298701	t
291	291	10 rue Amiral Guépratte	nan	['larvor']	29200	BREST	FRANCE	AM5031	LAR2901	\N	2021-06-21 08:04:16.165206	t
292	292	2 RUE MARSOULAN	nan	['laforet', 'nation', 'immobilier']	75011	PARIS	FRANCE	AM7001	NAT011	\N	2021-06-21 08:04:17.13365	t
293	293	17 BOULEVARD DE REUILLY	nan	['laforet', 'l-l', 'immobilier']	75012	PARIS	FRANCE	AM703	LLI011	\N	2021-06-21 08:04:17.9182	t
294	294	148 Boulevard Voltaire	nan	['laforet', 'gdl', 'immobilier']	75011	PARIS	FRANCE	AM701	GDL011	\N	2021-06-21 08:04:18.523854	t
295	295	101 rue Jean Jaurès	nan	['orpi', '101', 'jaures']	29200	BREST	FRANCE	AM542	ORP030	\N	2021-06-21 08:04:19.353379	t
296	296	67 BOULEVARD DE LA LIBERTE	nan	['bonnave', 'notaires']	59000	LILLE	FRANCE	AM5101	BONA591	\N	2021-06-21 08:04:20.067969	t
297	297	122 RUE SOLFERINO	nan	['lille', 'immo']	59000	LILLE	FRANCE	AM5111	TMC0591	\N	2021-06-21 08:04:20.746585	t
298	298	37 AVENUE DE QUINCY	nan	["l'adresse", 'benoteau', 'immobilier']	77380	COMBS LA VILLE	FRANCE	AM512	BENO77	\N	2021-06-21 08:04:21.532132	t
299	299	255 RUE NATIONALE	nan	['vacherand', 'immobilier']	59000	LILLE	FRANCE	AM5131	VAC0591	\N	2021-06-21 08:04:22.14978	t
300	300	32 RUE DE L'ETANDUERE	nan	['cabinet', 'pige']	49000	ANGERS	FRANCE	AM514	PIG049	\N	2021-06-21 08:04:22.890355	t
301	301	6 RUE DU MARECHAL FOCH	nan	['agence', 'pascal']	77400	THORIGNY SUR MARNE	FRANCE	AM515	SAL077	\N	2021-06-21 08:04:23.727875	t
302	302	122 RUE SOLFERINO	nan	['lille', 'immo']	59000	LILLE	FRANCE	nan	nan	\N	2021-06-21 08:04:24.774281	t
303	303	58 rue Jean Baptiste Baudin	nan	['djakiodine', 'shabir']	94800	VILLEJUIF	FRANCE	AM519	nan	\N	2021-06-21 08:04:25.576815	t
304	304	28 BIS AVENUE CHARLES DE GAULLE	nan	['notaires', 'etude', 'nyzam', 'gaillard']	17300	ROCHEFORT	FRANCE	AM520	NYAZ17	\N	2021-06-21 08:04:26.254429	t
305	305	63 RUE NICOLAS LEBLANC	nan	['jlw', 'immobilier']	59000	LILLE	FRANCE	AM521	nan	\N	2021-06-21 08:04:27.11394	t
306	306	1 PLACE WAGRAM	nan	['particulier']	75017	PARIS	FRANCE	AM522	nan	\N	2021-06-21 08:04:27.833524	t
307	307	2 rue de la Prairie de Plessis	nan	['particulier']	44810	HERIC	FRANCE	nan	nan	\N	2021-06-21 08:04:28.634069	t
308	308	26 BIS RUE JEAN JAURES	nan	['jaures', 'immo', '-', 'agence', 'principale', 'gagny']	93220	GAGNY	FRANCE	AMI0384	nan	\N	2021-06-21 08:04:29.310678	t
309	309	5 RUE JACQUES MARIN	nan	['particulier']	49330	SOEURDRES	FRANCE	AM525	PETI49	\N	2021-06-21 08:04:30.073244	t
310	310	175 RUE DE LA GUILLETERIE	nan	['sci', "l'amethyste"]	85440	TALMONT ST HILAIRE	FRANCE	AM526	NOR085	\N	2021-06-21 08:04:30.795828	t
311	311	4 RUE DU PATIO	nan	['foncia', '-', 'grouep', 'grenon']	85160	SAINT JEN DE MONTS	FRANCE	AM527	FONC85	\N	2021-06-21 08:04:31.393487	t
312	312	251 AVENUE DU BOIS	nan	['arthur', 'loyd', 'lille']	59832	LAMBERSART	FRANCE	AM528	ART059	\N	2021-06-21 08:04:32.158048	t
313	313	61 RUE COLBERT	nan	['lille', 'metropole', 'immobilier']	59000	LILLE	FRANCE	AM5291	MET0591	\N	2021-06-21 08:04:33.011559	t
314	314	189 RUE NATIONALE	nan	['century', '21', '-', 'lille', 'rue', 'nationale']	59000	LILLE	FRANCE	AM5321	CEN0591	\N	2021-06-21 08:04:33.901049	t
315	315	37 AVENUE EMILE ZOLA	nan	['defim', 'immobilier']	59000	LILLE	FRANCE	AM5331	DEF0591	\N	2021-06-21 08:04:34.728581	t
316	316	12 Place Jacques Tati	nan	['ajp', 'immobilier']	44600	SAINT MARC SUR MER	FRANCE	nan	nan	\N	2021-06-21 08:04:35.295251	t
317	317	120 RUE FRANCIS PRESSENSE	nan	['asd', 'immobilier', '-', 'asd', 'patrimoine']	62220	CARVIN	FRANCE	AM535	ASD059	\N	2021-06-21 08:04:36.081806	t
318	318	1 Place de La Hunaudais	nan	['office', 'notarial']	44680	SAINT PAZANE	FRANCE	AM536	MEN044	\N	2021-06-21 08:04:36.778402	t
319	319	37 RUE D'ESBLY	nan	['euro', 'immo']	77700	COUPVRAY	FRANCE	AM538	EUBAR7	\N	2021-06-21 08:04:37.452017	t
320	320	19 ALLEEDU VIEUX SAINT LOUIS	nan	['immo', 'de', 'france', 'laval']	53000	LAVAL	FRANCE	AM541	nan	\N	2021-06-21 08:04:38.303529	t
321	321	101 RUE JEAN JAURES	nan	['orpi', '101', 'jaures']	29200	BREST	FRANCE	AM541	ORP029	\N	2021-06-21 08:04:38.958154	t
322	322	62 RUE DE VOUILLE	nan	['cabinet', 'g.cardinal']	75015	PARIS	FRANCE	AM5431	CARG151	\N	2021-06-21 08:04:39.744705	t
323	323	nan	nan	CLIENT	nan	nan	FRANCE	nan	nan	\N	2021-06-21 08:04:40.434309	t
324	324	10 Allée du Port Maillard	nan	['particulier']	44000	NANTES	FRANCE	nan	nan	\N	2021-06-21 08:04:41.058954	t
325	325	41 rue du Sous Marin Casabianca	nan	CLIENT PARTICULIER	83000	TOULON	FRANCE	nan	nan	\N	2021-06-21 08:04:41.837508	t
326	326	3 rue du Logis des Bois	nan	CLIENT PARTICULIER	49320	SAINT SATURNIN SUR LOIRE	FRANCE	nan	nan	\N	2021-06-21 08:04:42.454153	t
327	327	7 Place du 11 Novembre	nan	["l'adresse", '-', 'st', 'branchs', 'et', "l'adresse", 'tours']	37320	SAINT BRANCHS	FRANCE	AM5551	BRAN0371	\N	2021-06-21 08:04:43.356636	t
328	328	23 PLACE  DU MARECHAL LECLERC	nan	['inedit', 'immobilier']	59000	LILLE	FRANCE	AM55611	IND05911	\N	2021-06-21 08:04:44.152183	t
329	329	177 RUE NATIONALE	nan	['sigla', 'immobilier']	59000	LILLE	FRANCE	AM55711	SIGL05911	\N	2021-06-21 08:04:44.792815	t
330	330	67 RUE CAULIANCOURT	nan	['guy', 'hoquet', '-', 'cabinet', 'fredelion']	75018	PARIS	FRANCE	AM042	FRE75G	\N	2021-06-21 08:04:45.663318	t
331	331	43 RUE DE TOULOUSE	nan	["l'adresse", '-', 'castanet', 'tolosan', '-', 'bh', 'immobilier']	31320	CASTANET-TOLOSAN	FRANCE	AM5611	TOUL0311	\N	2021-06-21 08:04:46.462859	t
332	332	70 AVENUE DE PUJOL	nan	["l'adresse", '-', 'toulouse', '-', 'aet', 'immobilier']	31500	TOULOUSE	FRANCE	AM5621	TOUL0321	\N	2021-06-21 08:04:47.145469	t
333	333	40 ROUTE D'ALBI	nan	['locagestion-', 'toulouse', 'mbm', 'immobilier']	31000	TOULOUSE	FRANCE	AM5631	TOUL0321	\N	2021-06-21 08:04:47.969995	t
334	334	5 ALLEE D'OCCITANIE	nan	["l'adresse", '-', 'colomiers']	31770	COLOMIERS	FRANCE	AM5641	AERO0311	\N	2021-06-21 08:04:48.587645	t
335	335	40 ALLEES CHARLES DE FITTE	nan	["l'adresse", '-', 'toulouse', '-', 'gica', 'conseil']	31300	TOULOUSE	FRANCE	AM5651	GICA0311	\N	2021-06-21 08:04:49.344214	t
336	336	25 GRANDE RUE CHARLES DE GAULLE	nan	["l'adresse", '-', 'civm']	94360	BRY SUR MARNE	FRANCE	AM5681	CIV0771	\N	2021-06-21 08:04:50.119765	t
337	337	20 Place de la Tour d'Auvergne	nan	ARRET  COLLABORATION	29000	QUIMPER	FRANCE	nan	nan	\N	2021-06-21 08:04:50.780386	t
338	338	106 RUE CHAULIN SERVINIERE	nan	['offcie', 'notarial', 'f.cadet']	53100	MAYENNE	FRANCE	AM5721	CAD0531	\N	2021-06-21 08:04:51.594923	t
339	339	nan	nan	nan	nan	nan	FRANCE	nan	nan	\N	2021-06-21 08:04:52.303513	t
340	340	16 RUE NOTRE DAME DE LORETTE	nan	['guy', 'hoquet', 'paris', '9', 'ouest', 's2f', 'immobilier']	75009	PARIS	FRANCE	AMI0499	tStAXI2b	\N	2021-06-21 08:04:52.935155	t
341	341	10 rue Damrémont	nan	["o'real", 'immobilier', 'transactions']	75018	PARIS	FRANCE	AM5770	Ori#18Par	\N	2021-06-21 08:04:54.016533	t
342	342	13 Place de la Liberté	nan	['iroise', 'immobilier']	29200	BREST	FRANCE	nan	nan	\N	2021-06-21 08:04:54.898029	t
343	343	59 avenue de Saint Ouen	nan	['orpi', 'nouallet']	75017	PARIS	FRANCE	nan	nan	\N	2021-06-21 08:04:55.683581	t
344	344	4 RUE DES ARENES	nan	['pierres&co', '-', 'sas', 'sarpig']	49000	ANGERS	FRANCE	AMI0453	nan	\N	2021-06-21 08:04:56.320214	t
345	345	nan	nan	CLIENT PARTICULIER	nan	nan	FRANCE	nan	nan	\N	2021-06-21 08:04:57.047799	t
346	346	1 rue de l'Ecluse Saint Mars de Blain	nan	['particulier']	44130	BLAIN	FRANCE	nan	nan	\N	2021-06-21 08:04:57.827351	t
347	347	602 rue du Haut Plessis	nan	['particulier']	44390	PETIT MARS	FRANCE	nan	nan	\N	2021-06-21 08:04:58.440006	t
348	348	48 RUE RADON	nan	["l'adresse", 'les', 'herbiers', 'gestion']	85000	LES HERBIERS	FRANCE	AM3261	CB1H32PE1	\N	2021-06-21 08:04:59.184576	t
349	349	37 BOULEVARD DU MARECHAL FOCH	nan	['nestenn', 'angers']	49100	ANGERS	FRANCE	AM5860	NEST#49Fch	\N	2021-06-21 08:04:59.935144	t
350	350	1 rue du Dauphin	nan	['loinard', 'antoine']	53000	LAVAL	FRANCE	nan	nan	\N	2021-06-21 08:05:00.548794	t
351	351	12 rue Dagobert	nan	['stephane', 'plaza', 'immobilier']	92100	CLICHY	FRANCE	AM5881	tsNBW4Ic	\N	2021-06-21 08:05:01.338344	t
352	352	169 AVENUE CHARLES DE GAULLE	nan	['france', 'edl']	nan	LYON	FRANCE	nan	nan	\N	2021-06-21 08:05:02.072919	t
353	353	13-15 Avenue Paul Doumer	nan	['orpi', '-', 'agence', 'cadeau']	93460	GOURNAY SUR MARNE	FRANCE	AM5931	CaD93#Pi	\N	2021-06-21 08:05:02.729548	t
354	354	50 RUE DE MOLINEL	nan	['pons', '&', 'cie', 'immobilier']	59000	LILLE	FRANCE	AMI0379	nan	\N	2021-06-21 08:05:03.555078	t
355	355	75 RUE PLANGENET	nan	['legros', 'immobilier']	49000	ANGERS	FRANCE	AM5951	Legro49#Sch	\N	2021-06-21 08:05:04.207698	t
356	356	ZAC PERROTS ROUTE DE TOULOUSE	nan	['coeur', 'lauragais', 'immo', 'agence', 'de', 'lanta']	31570	LANTA	FRANCE	AM5961	CoeLau#31im	\N	2021-06-21 08:05:04.934285	t
357	357	14 B RUE DE PAS	nan	['picavez', 'philippe']	59000	LILLE	FRANCE	AMI03111	CU6GjpSN1	\N	2021-06-21 08:05:05.669869	t
358	358	14 Cours Gambetta	nan	['agence', 'terre', "d'argence", 'immobilier']	30300	BEAUCAIRE	FRANCE	AM5981	nan	\N	2021-06-21 08:05:06.279512	t
359	359	11 avenue Michelet	nan	['indepimmo']	49300	CHOLET	FRANCE	AMI0391	nan	\N	2021-06-21 08:05:07.084052	t
360	360	nan	nan	['bee', 'immo', 'laforet']	75015	PARIS	FRANCE	AM6041	Bee#L15par	\N	2021-06-21 08:05:07.887595	t
361	361	23 rue Lejamptel	nan	['laforet', 'dol', 'de', 'bretagne']	35120	DOL DE BRETAGNE	FRANCE	AM6061	Laf#35Dol	\N	2021-06-21 08:05:08.620172	t
362	362	51 RUE BASSE	nan	['immobiliere', 'de', 'lille']	59000	LILLE	FRANCE	AM60711	Mlille#59mo1	\N	2021-06-21 08:05:09.411719	t
363	363	5/7  Place du Général de Gaulle	nan	['orpi', 'gagny-', 'a2jimmo']	93220	GAGNY	FRANCE	AM6091	Aji#93Gagny	\N	2021-06-21 08:05:10.034363	t
364	364	10 BOULEVARD HENRI ARNAULT	nan	['alain', 'rousseau', 'immobiliere', 'comine']	49100	ANGERS	FRANCE	AM6101	Rou49#Cmin	\N	2021-06-21 08:05:11.154722	t
365	365	76 Route de Fontenay	nan	CLIENT PARTICULIER	85370	LE LANGON	FRANCE	AMI0535	GBxlwb1a	\N	2021-06-21 08:05:11.800355	t
366	366	175 avenue de Dunkerque	nan	['agence', 'immobiliere', 'lilloise']	59000	LILLE	FRANCE	AM61311	Pon#AIL591	\N	2021-06-21 08:05:12.472971	t
367	367	7 Route de Chardonchamp	nan	CLIENT PARTICULIER	86440	MIGNE AUXANCES	FRANCE	nan	nan	\N	2021-06-21 08:05:13.261515	t
368	368	129 rue George Clémenceau	nan	CLIENT PARTICULIER	17320	MARENNES	FRANCE	nan	nan	\N	2021-06-21 08:05:14.024079	t
369	369	48 rue du Portail Louis	nan	['heloin', 'immobilier']	49400	SAUMUR	FRANCE	AM6181	XXXX	\N	2021-06-21 08:05:14.820626	t
370	370	290 B RUE DU GÉNÉRAL LECLERC	nan	['cdp', 'patrimoine']	59380	CYSOING	FRANCE	nan	nan	\N	2021-06-21 08:05:15.621164	t
371	371	129 rue Georges Clemenceau	nan	CLIENT PARTICULIER	17320	MARENNES	FRANCE	nan	nan	\N	2021-06-21 08:05:16.217827	t
372	372	Mong Kok Buiding	No 93-99 Mong Kok,road	CLIENT INACTIF	nan	HONG KONG	FRANCE	nan	nan	\N	2021-06-21 08:05:17.014367	t
373	373	2 rue du Général Leclerc	nan	['orpi', 'rosny', 'sous', 'bois', 'agence', 'de', 'la', 'mairie']	93110	ROSNY SOUS BOIS	FRANCE	AM6241	De#AGM93	\N	2021-06-21 08:05:17.669994	t
374	374	57 rue de Lancry	nan	['republique', 'immobilier', '-', 'laforet']	75010	PARIS	FRANCE	AM6251	Rep#LAF10	\N	2021-06-21 08:05:18.522506	t
375	375	246 Rue du Faubourg Saint Antoine	nan	['orpi', '-', 'sas', 'immo', '75']	75012	PARIS	FRANCE	AMI0155	MaUODlVF	\N	2021-06-21 08:05:19.303057	t
376	376	6 RUE DE PENTHIÈVRE	nan	['immobiliere', 'lutece']	75008	PARIS	FRANCE	AM6281	MFi7aeWu	\N	2021-06-21 08:05:20.091526	t
377	377	1 PLACE CHARDONNET	nan	['mb', 'immobilier', 'tours']	37000	TOURS	FRANCE	AM6301	UhuO3gPl	\N	2021-06-21 08:05:20.833098	t
430	430	1 RUE DU HARAS	nan	['laforet', 'angers', 'epyceaimmo']	49100	ANGERS	FRANCE	AMI0346	nan	\N	2021-06-21 08:06:01.263855	t
378	378	26 AVENUE DU GENERAL LECLERC	nan	['laforet_m3b', 'immobilier']	92100	BOULOGNE - BILLANCOURT	FRANCE	AM6311	bvtV3xJ1	\N	2021-06-21 08:05:21.549689	t
379	379	66 avenue des Champs Eluysées	nan	CLIENT INACTIF	75008	PARIS	FRANCE	nan	nan	\N	2021-06-21 08:05:22.163339	t
380	380	73 BOUCLE DE FONT VERT	nan	nan	83140	SIX FOURS	FRANCE	nan	nan	\N	2021-06-21 08:05:23.018847	t
381	381	COURS GOUDOULI	nan	['coeur', 'lauragais', 'immo', '7']	31130	FONSE GRIVES	FRANCE	AM6361	q5Vg2Nyd	\N	2021-06-21 08:05:23.674471	t
382	382	110 avenue Emile Cossonneau	nan	["l'adresse", 'agence', 'de', "l'ancienne", 'mairie']	93160	NOISY LE GRAND	FRANCE	AM6371	7VrRhWS8	\N	2021-06-21 08:05:24.361077	t
383	383	9 Bis Avenue Clémenceau	nan	['agi', '-', 'actif', 'gestion', 'immobilier']	77100	MEAUX	FRANCE	AM6411	Z2LyseBh	\N	2021-06-21 08:05:25.25457	t
384	384	nan	nan	nan	nan	nan	FRANCE	nan	nan	\N	2021-06-21 08:05:25.842232	t
385	385	10 rue Carnot	nan	['century', '21', "l'oceane"]	85300	CHALLANS	FRANCE	AMI0323	nan	\N	2021-06-21 08:05:26.5918	t
386	386	105 rue Maréchal Joffre	nan	['laforet', 'immobilier', 'yonnais']	85000	LA ROCHE SUR YON	FRANCE	AM6451	nan	\N	2021-06-21 08:05:27.454309	t
387	387	35 RUE DE LA REPUBLIQUE	nan	['agence', 'corinne', 'b']	45330	LE MALESHERBOIS	FRANCE	AM6471	nan	\N	2021-06-21 08:05:28.214871	t
388	388	1 CHEMIN DES ETAMIÈRES LE POTEAU D'EPONE	nan	['guy', 'hoquet', 'epone', "l'", 'immobilier', 'patrimoine']	78680	EPONE	FRANCE	AM6481	uwXFVTCd	\N	2021-06-21 08:05:29.013416	t
389	389	29 boulevard Gaston DUMESNIL	nan	['immobiliere', 'des', '3', 'rives']	49100	ANGERS	FRANCE	nan	nan	\N	2021-06-21 08:05:29.713015	t
390	390	385 RUE DE  VAUGIRAD	nan	['c2imm']	75015	PARIS	FRANCE	nan	nan	\N	2021-06-21 08:05:30.4396	t
391	391	Rua do Oliva 238-1 Dto	nan	['bravofiber', 'lda']	1200-774	LISBON	FRANCE	nan	nan	\N	2021-06-21 08:05:31.142197	t
392	392	64 BOULEVARD DE LA LIBERTÉ	nan	['seize', 'immobilier']	59000	LILLE	FRANCE	AM6531	nan	\N	2021-06-21 08:05:31.708872	t
393	393	16 RUE DU GENERAL DE GAULLE	nan	['agence', 'de', 'la', 'madeleine']	59110	LA MADELEINE	FRANCE	AM6541	nan	\N	2021-06-21 08:05:32.492423	t
394	394	130 RUE SAINT CHARLES	nan	['guy', 'hoquet', 'saint', 'charles', '-', 'sarl', 'dalin']	75015	PARIS	FRANCE	nan	nan	\N	2021-06-21 08:05:33.260984	t
395	395	5 RUE JEAN MARIE RAIMBAULT	nan	['pommerol', 'aude']	49100	ANGERS	FRANCE	nan	nan	\N	2021-06-21 08:05:34.234431	t
396	396	5 RUE JEAN MARIE RAIMBAULT	nan	['de', 'pommerol', 'aude']	49100	ANGERS	FRANCE	nan	nan	\N	2021-06-21 08:05:35.026973	t
397	397	12 RUE DES FRÈRES GUÉRAUD	nan	['mme', 'fleury']	44116	VIEILLEVIGNE	FRANCE	nan	nan	\N	2021-06-21 08:05:35.617634	t
398	398	30 rue Fortuny	nan	['kamet']	75017	PARIS	FRANCE	AM6601	nan	\N	2021-06-21 08:05:36.45216	t
399	399	1390 RUE DE L'EGLISE	nan	['particulier']	62850	SANGHEN	FRANCE	nan	nan	\N	2021-06-21 08:05:37.171744	t
400	400	12 rue Souchu Servinière	XXX	['citya', 'laval', '-', 'sarl', 'citya', 'les', 'remparts']	53000	LAVAL	FRANCE	AM6621	nan	\N	2021-06-21 08:05:37.855354	t
401	401	5 Boulevard Adolphe Billault	nan	['demare', 'beaulieu', 'immobilier']	44200	NANTES	FRANCE	nan	nan	\N	2021-06-21 08:05:38.643904	t
402	402	13 PLACE DES QUATRE DAUPHINS	nan	['agence', 'du', 'sud', 'est']	13100	AIX  EN PROVENCE	FRANCE	AM441	nan	\N	2021-06-21 08:05:39.320518	t
403	403	7 rue Versigny	nan	['savoir', 'et', 'conseil']	75018	PARIS	FRANCE	nan	nan	\N	2021-06-21 08:05:40.926501	t
404	404	3 RUE D'ALEMEBERT	nan	['xxx']	75014	PARIS	FRANCE	nan	nan	\N	2021-06-21 08:05:41.650088	t
405	405	28 BIS RUE DE LA BOURRELIERE	nan	['xxx']	44210	PORNIC	FRANCE	nan	nan	\N	2021-06-21 08:05:42.450631	t
406	406	5 PLACE DE CINQ MAI	nan	['bocage', 'immobilier']	79300	BRESSUIRE	FRANCE	AMI0249	nan	\N	2021-06-21 08:05:43.099255	t
407	407	13 PLACE NOTRE DAME	nan	['le', 'tuc', 'immobilier']	79300	BRESSUIRE	FRANCE	nan	nan	\N	2021-06-21 08:05:43.840834	t
408	408	18 RUE CHAUSSEE WATT	nan	['zezafoun']	59200	TOURCOING	FRANCE	nan	nan	\N	2021-06-21 08:05:44.739318	t
410	410	42 RUE BASSE	BP 199	['fontaine', 'roussel', '&', 'associes']	59029	LILLE	FRANCE	AMI0254	nan	\N	2021-06-21 08:05:46.242456	t
411	411	54 ROUTE DU VESINET	nan	['le', 'relais', 'immobilier']	78400	CHATOU	FRANCE	nan	nan	\N	2021-06-21 08:05:46.920067	t
412	412	21 CHEMIN DES TOUARNIES	nan	CLIENT PARTICULIER	91530	LA VAL  ST GERMAIN	FRANCE	nan	nan	\N	2021-06-21 08:05:47.602676	t
413	413	32 RUE JACQUES LE PAIRE	nan	['orpi', 'agence', 'thevin', 'eguia']	77400	LAGNY SUR MARNE	FRANCE	AMI0277	nan	\N	2021-06-21 08:05:48.369242	t
414	414	49 rue de la Tourmentinerie	nan	['sci', 'kinos']	44850	Saint Mars du Desert	FRANCE	nan	nan	\N	2021-06-21 08:05:49.573551	t
415	415	71 RUE DU GENERAL DE GAULLE	nan	['stephane', 'plaza-laval']	53000	LAVAL	FRANCE	AMI0301	nan	\N	2021-06-21 08:05:50.32212	t
416	416	10 RUE DE CAMBRAI	nan	['equit', 'immobilier']	62000	ARRAS	FRANCE	nan	nan	\N	2021-06-21 08:05:50.943764	t
417	417	74 RUE MARX DORMOY	nan	['xxx']	75018	PARIS	FRANCE	nan	nan	\N	2021-06-21 08:05:51.793278	t
418	418	12 PLACE GEORGES POMPIDOU	nan	['bsgi', 'mme', 'corinne', 'cattiaux']	93160	NOISY LE GRAND	FRANCE	AMI0308	nan	\N	2021-06-21 08:05:52.505868	t
419	419	284 Boulevard Voltaire	nan	["l'adresse", 'nation', '-', 'sasu', 'delf', 'immogest']	75011	PARIS	FRANCE	AMI0312	nan	\N	2021-06-21 08:05:53.119518	t
420	420	3 RUE FLORIAN	nan	['guy', 'hoquet', 'sceaux', '-', 'sarl', 'csg', 'immobilier']	92330	SCEAUX	FRANCE	AMI0313	nan	\N	2021-06-21 08:05:53.918065	t
421	421	30 Rue Du Général de Gaulle	nan	['andre', 'immobilier', '-', 'gestion']	78300	POISSY	FRANCE	AMI0314	nan	\N	2021-06-21 08:05:54.688621	t
422	422	41 RUE DE PASSY	nan	['fatma', 'triki']	75016	PARIS	FRANCE	AMI0317	nan	\N	2021-06-21 08:05:55.437192	t
423	423	85 RUE PAUL DOUMER	nan	['agence', 'de', 'valliere', '-', 'gestion']	92500	RUEIL MALMAISON	FRANCE	AMI0315	nan	\N	2021-06-21 08:05:56.234735	t
424	424	1 AVENUE LACOTERE	nan	['coptalis', '-', 'link', 'mobilite']	31700	CONRNEBARIEU	FRANCE	AMI0318	nan	\N	2021-06-21 08:05:56.823398	t
425	425	10 RUE GEORGES CLEMENCEAU	nan	["l'adresse", 'romorantin']	41200	ROMORANTIN LANTHENAY	FRANCE	AMI0320	nan	\N	2021-06-21 08:05:57.615945	t
426	426	132 RUE DE PARIS	nan	['valloire', 'habiat', 'agence', 'laval']	53000	LAVAL	FRANCE	nan	nan	\N	2021-06-21 08:05:58.404495	t
427	427	48 Rue Geneviève Perrier	nan	['sh', 'conseil', 'immobilier', 'et', 'patrimoine']	45160	OLIVET	FRANCE	AMI0335	nan	\N	2021-06-21 08:05:59.059121	t
428	428	17 Place de La Victoire	nan	['agence', 'des', 'lilas']	45500	GIEN	FRANCE	AMI0337	nan	\N	2021-06-21 08:05:59.887643	t
429	429	346 Avenue d'Arès	nan	['vestalia', 'immo', 'thierry', 'lescure']	33700	MERIGNAC	FRANCE	AMI0338	nan	\N	2021-06-21 08:06:00.547268	t
431	431	4 rue Paul Laguesse	nan	['sogief', 'immobilier', 'tony', 'sipaseuth']	77700	CHESSY	FRANCE	AMI0348	nan	\N	2021-06-21 08:06:02.034417	t
432	432	nan	nan	['credit', 'agricole', 'adx', 'groupe']	nan	nan	FRANCE	AMI0350	nan	\N	2021-06-21 08:06:02.632072	t
433	433	28 RUE GENERAL DE GAULLE	nan	["l'adresse", 'poissy', 'hag', 'immobilier']	78300	POISSY	FRANCE	AMI0356	nan	\N	2021-06-21 08:06:03.549548	t
434	434	11 AVENUE ARISTIDE BRIAND	nan	["l'adresse", 'plessis', 'robinsson']	92350	LE PLESSIS-ROBINSSON	FRANCE	nan	nan	\N	2021-06-21 08:06:04.194178	t
435	435	10 PLACE DE LA LAITERIE	nan	['rue', 'de', 'la', 'paix;immo', 'm.', 'batardierejacques']	49000	ANGERS	FRANCE	nan	nan	\N	2021-06-21 08:06:05.003717	t
436	436	189 AVENUE DE LA REPUBLIQUE	nan	['eric', 'franques', 'immobilier']	59110	LA MADELEINE	FRANCE	nan	nan	\N	2021-06-21 08:06:05.756287	t
437	437	444 AVENUE DE DUNKERQUE	nan	['vacherand', 'immobilier', 'lambersart']	59130	LAMBERSART	FRANCE	nan	nan	\N	2021-06-21 08:06:06.463882	t
438	438	6 RUE SAINT ANNE	nan	['primea', 'immobilier']	59000	LILLE	FRANCE	nan	nan	\N	2021-06-21 08:06:07.287407	t
439	439	8 RUE SAINT ANNE	nan	['vladeren', 'immo']	59000	LILLE	FRANCE	nan	nan	\N	2021-06-21 08:06:07.950028	t
440	440	53 Johnson court, 39 Meadowside	XXX	['particulier']	SE9 6BS	LONDON	FRANCE	nan	nan	\N	2021-06-21 08:06:08.615648	t
441	441	26 BIS AVENUE JEAN JAURES	nan	['immobiliere', 'saint', 'james']	93220	GAGNY	FRANCE	AMI0386	nan	\N	2021-06-21 08:06:09.442173	t
442	442	54 Rue Nationale	nan	['laforet', 'immo-cholet']	49300	CHOLET	FRANCE	nan	nan	\N	2021-06-21 08:06:10.627495	t
443	443	45 Bis Rue Eugene Massé	nan	['remax', 'home', 'premium', 'mouthino', 'conseil', 'immobilier']	93190	LIVRY GARGAN	FRANCE	AMI0387	nan	\N	2021-06-21 08:06:11.42004	t
444	444	nan	nan	['particulier']	nan	nan	FRANCE	nan	nan	\N	2021-06-21 08:06:12.022696	t
445	445	nan	nan	['particulier']	nan	nan	FRANCE	nan	nan	\N	2021-06-21 08:06:12.714299	t
446	446	nan	nan	['particulier']	nan	nan	FRANCE	nan	nan	\N	2021-06-21 08:06:13.454875	t
447	447	201 Avenue de Versailles	nan	['guy', 'hoquet', 'exelmans', 'rodet-rieu']	75016	PARIS	FRANCE	AMI0397	nan	\N	2021-06-21 08:06:14.040543	t
448	448	6-8 Rue Didienne	nan	['talentis', 'immo', 'mme', 'fonteneau', 'marianne']	44000	NANTES	FRANCE	nan	nan	\N	2021-06-21 08:06:15.101933	t
449	449	nan	nan	['particulier']	49320	SAINT SATURNIN SUR LOIRE	FRANCE	nan	nan	\N	2021-06-21 08:06:15.776546	t
450	450	6 Rue d'En Barthas	nan	['sci', 'fdj', 'm.', 'azema', 'david']	81570	SEMALENS	FRANCE	nan	nan	\N	2021-06-21 08:06:16.465155	t
451	451	nan	nan	['particulier']	nan	nan	FRANCE	nan	nan	\N	2021-06-21 08:06:17.277687	t
452	452	nan	nan	['particulier']	nan	nan	FRANCE	nan	nan	\N	2021-06-21 08:06:17.897333	t
453	453	39 Rue d'Aquitaine	nan	['century', '21', "l'immobilier", 'pour', 'tous']	44800	SAINT HERBLAIN	FRANCE	nan	nan	\N	2021-06-21 08:06:18.617921	t
454	454	nan	nan	['particulier']	nan	nan	FRANCE	AMI0417	nan	\N	2021-06-21 08:06:19.356496	t
455	455	nan	nan	['particulier']	nan	nan	FRANCE	nan	nan	\N	2021-06-21 08:06:19.976143	t
456	456	95 RUE ORDERNER	nan	['procity', 'immobilier']	75018	PARIS	FRANCE	AMI0426	nan	\N	2021-06-21 08:06:20.762691	t
457	457	57 RUE CAULAINCOURT	nan	['procity', 'gest', 'immobilier', 'procity', 'gest']	75018	PARIS	FRANCE	AMI0433	nan	\N	2021-06-21 08:06:21.442303	t
458	458	21 PLACE KENNEDY	nan	['alain', 'rousseau', 'immobilier']	49100	ANGERS	FRANCE	nan	nan	\N	2021-06-21 08:06:22.09293	t
459	459	ROUTE DE LARVAUR	nan	['gout', 'joseph']	31460	CARAMAN	FRANCE	AMI0438	nan	\N	2021-06-21 08:06:22.994413	t
460	460	15 BOULEVARD PIERRE LANDAIS	nan	['cabient', 'diard']	35500	VITREE	FRANCE	AMI0439	nan	\N	2021-06-21 08:06:23.768973	t
461	461	2 RUE HARROUYS	nan	["l'adresse", 'carquefou', '-', 'sarl', 'louame']	44470	CRAQUEFOU	FRANCE	AMI0431	nan	\N	2021-06-21 08:06:24.495555	t
462	462	2 RUE DE LA COTE D'OR	nan	['booster', 'immobilier']	31500	TOULOUSE	FRANCE	AMI0444	nan	\N	2021-06-21 08:06:25.263118	t
463	463	36 rue Eugène Ténot	nan	['salerno', 'marc']	33000	BORDEAUX	FRANCE	AMI0446	nan	\N	2021-06-21 08:06:26.034672	t
464	464	2 RUE DE BREST	nan	['penn', 'immobilier', 'immobilier', 'sarl', 'mpi']	35500	VITRE	FRANCE	AM10448	nan	\N	2021-06-21 08:06:26.856203	t
465	465	3 AVENUE DE GAMEVILLE	nan	['laforet', 'st', 'orens', 'de', 'gameville', 'elodie', 'pech']	31650	SAINT ORENS DE GAMEVILLE	FRANCE	AMI0450	nan	\N	2021-06-21 08:06:27.568796	t
466	466	24B AVENUE DE BON AIR SAINT-PIERRE MONTLIMART	nan	["l'adresse", 'saint', 'pierre', 'montlimart']	49110	MONTREVAULT-SUR-ÈVRE	FRANCE	AMI0456	nan	\N	2021-06-21 08:06:28.290382	t
467	467	VAUJUAS	nan	['immo', 'group', 'm', 'tourneux', 'et', 'm', 'vaygeois']	53440	MARCILLÉ-LA-VILLE	FRANCE	nan	nan	\N	2021-06-21 08:06:29.091923	t
468	468	491 Avenue de Verdun	nan	['nestenn', '-', 'logette', 'immobilier']	33700	MERIGNAC	FRANCE	AMI0459	nan	\N	2021-06-21 08:06:29.627615	t
469	469	5 RUE JACQUES MARIN	nan	['particulier']	49330	SOEURDRES	FRANCE	AMI0460	nan	\N	2021-06-21 08:06:30.40717	t
470	470	6 Place Gasnier Guy / 19 Rue Gambetta	nan	["l'adresse", 'gambetta', "l'adresse", 'cersoy', '&', 'girard']	77500	CHELLES	FRANCE	AMI0463	nan	\N	2021-06-21 08:06:31.100781	t
471	471	57 RUE DE BENODET	nan	['west', 'immobilier', 'laforet', 'quimper']	29000	QUIMPER	FRANCE	nan	nan	\N	2021-06-21 08:06:31.743406	t
472	472	20 RUE CHASLES	nan	['themeis', 'immobilier-', 'sgi', 'sarl', 'sombim', 'gestion', 'immobilier']	78120	RAMBOUILLET	FRANCE	nan	nan	\N	2021-06-21 08:06:32.556945	t
473	473	nan	nan	['deheul\\ufeff', 'vincent']	nan	nan	FRANCE	nan	nan	\N	2021-06-21 08:06:33.25654	t
474	474	8 AVENUE RAYMOND NEUVES	nan	['savoureux', 'cyril']	31500	TOULOUSE	FRANCE	nan	nan	\N	2021-06-21 08:06:33.965134	t
475	475	8 RUE DES CERISIERS	nan	['mr', 'et', 'mme', 'darde']	31280	DREMIL LAFAGE	FRANCE	nan	nan	\N	2021-06-21 08:06:34.790661	t
476	476	14 PLACE FREDERIC OZANAM	nan	['espace', 'habitat']	33200	BORDEAUX CAUDERAN	FRANCE	nan	nan	\N	2021-06-21 08:06:35.506255	t
477	477	7 RUE NATIONALE	nan	['cabinet', 'fruchet']	85110	CHANTONNAY	FRANCE	nan	nan	\N	2021-06-21 08:06:36.295801	t
478	478	LE DAVIER	nan	['xxx']	44810	HERIC	FRANCE	nan	nan	\N	2021-06-21 08:06:36.989401	t
479	479	35 RUE DU DOUANIER ROUSSEAU	nan	['xxx']	53000	LAVAL	FRANCE	nan	nan	\N	2021-06-21 08:06:37.816936	t
480	480	8 RUE DU MARECHAL NEY	nan	['immo', 'de', 'france', 'la', 'roche', 'sur', 'yon']	85010	LA ROCHE SUR YON	FRANCE	AMI0488	nan	\N	2021-06-21 08:06:38.609474	t
481	481	164 RUE D'ALESIA	nan	['guy', 'hoquet', 'paris', '14', 'plaisance', 'pernety']	75014	PARIS	FRANCE	nan	nan	\N	2021-06-21 08:06:39.226121	t
482	482	137 ROUTE DE FRONTON	nan	['xxx']	31140	AUCAMVILLE	FRANCE	nan	nan	\N	2021-06-21 08:06:40.164587	t
483	483	6 RUE DES SPORTS	nan	['xxx']	49120	MELAY - CHAMILLE EN ANJOU	FRANCE	nan	nan	\N	2021-06-21 08:06:40.935144	t
484	484	2 PLACE SAINT PIERRE	nan	["l'adresse", 'carquefou', '-', 'sarl', 'actial']	44470	CARQUEFOU	FRANCE	nan	nan	\N	2021-06-21 08:06:41.639738	t
485	485	27 BOULEVARD DE LA CROIX ROUSSE	nan	['boivin-champeaux', 'benedicte', 'et', 'alix']	69004	LYON	FRANCE	nan	nan	\N	2021-06-21 08:06:42.477259	t
486	486	75 BOULEVARD DE CHARONNE	nan	['blanche', 'marie', 'helene']	75011	PARIS	FRANCE	nan	nan	\N	2021-06-21 08:06:43.102901	t
487	487	61 RUE PIERRE CAZENEUVE	nan	['tower', 'immobilier']	31200	TOULOUSE	FRANCE	nan	nan	\N	2021-06-21 08:06:43.795506	t
488	488	LACHAT	nan	['chavy', 'claire']	73160	VIMINES	FRANCE	nan	nan	\N	2021-06-21 08:06:44.595051	t
489	489	12 RUE DES AMITIERES	nan	['morantin', 'agnes']	44210	PORNIC	FRANCE	nan	nan	\N	2021-06-21 08:06:45.16472	t
490	490	1  RUE DU GENERAL DE GAULLE	nan	['acm', 'transaction', 'mme', 'brousse', 'geraldine']	33112	SAINT LAURENT MEDOC	FRANCE	nan	nan	\N	2021-06-21 08:06:45.873316	t
491	491	2 RUE SAINT MARTIN	nan	['perrine', 'hansen']	49770	LONGUENEE EN ANJOU	FRANCE	nan	nan	\N	2021-06-21 08:06:46.625887	t
492	492	21 TER AVENUE DE VERDUN	nan	['epagnoux', 'sebastien', 'ludmila']	33127	MARTIGNAS SUR JALLE	FRANCE	nan	nan	\N	2021-06-21 08:06:47.247528	t
493	493	nan	nan	['bouge', 'laurent']	nan	nan	FRANCE	nan	nan	\N	2021-06-21 08:06:48.011091	t
494	494	35 RUE RENE RABAULT	nan	['lefevre', 'christine']	49100	ANGERS	FRANCE	nan	nan	\N	2021-06-21 08:06:48.694704	t
495	495	7 LA CREANCIERE	nan	['mangani', 'jean-michel']	85170	DOMPIERRE SUR YON	FRANCE	nan	nan	\N	2021-06-21 08:06:49.32934	t
496	496	9, rue Alphonse Munchen	nan	['mangani', 'jean-michel']	L-2172	LUXEMBOURG	FRANCE	nan	nan	\N	2021-06-21 08:06:50.11689	t
498	409	\N	\N	\N	\N	\N	\N	\N	\N	\N	2021-06-21 08:25:18.723716	t
409	409	55 AVENUE DE LA REPUBLIQUE	nan	['orpi', '-', 'immobilier', 'du', 'bouquet', 'm.', 'lamotte', 'stephane']	77340	PONTAULT COMBAULT	France	nan	nan	\N	2021-06-21 08:05:45.448911	t
499	497	\N	\N	\N	\N	\N	\N	\N	\N	\N	2021-06-21 08:44:05.303538	t
497	497	118 RUE DE PREAU	nan	['particulier']	nan	nan	France	nan	nan	\N	2021-06-21 08:06:50.751522	t
\.


--
-- Data for Name: Client_negotiateur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Client_negotiateur" (id, client_id, sexe, nom, email, numero, date_creation, visibility) FROM stdin;
\.


--
-- Data for Name: Expert; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Expert" (id, old, new, genre, nom, trigramme, "TYPE", date_entree, siret, email, email_perso, numero, code_tva, taux_tva, password, visibility) FROM stdin;
3	\N	\N	MME	kamus bernard	BK	Intervenant de constat	2014-01-01 00:00:00	789851425.0	NaN	NaN	NaN	NaN	0.0	\N	t
4	\N	\N	\N	lesne alan	ALS	Agent de secteur	2016-01-01 00:00:00	821942125.0	NaN	NaN	NaN	NaN	0.0	\N	t
5	\N	\N	\N	conraux eric	EC	Agent de secteur	2013-01-01 00:00:00	NaN	NaN	NaN	NaN	NaN	0.0	\N	t
6	\N	\N	\N	detoc xavier	XD	Agent de secteur	2010-01-01 00:00:00	NaN	NaN	NaN	NaN	NaN	0.0	\N	t
7	\N	\N	\N	mandin christophe	CRM	Agent de secteur	2016-07-01 00:00:00	418391694.0	NaN	NaN	NaN	NaN	0.0	\N	t
8	\N	\N	\N	amexpert france	AF	Agent de secteur	2011-01-01 00:00:00	NaN	NaN	NaN	NaN	NaN	0.0	\N	t
9	\N	\N	\N	atmane ludovic	ALU	Intervenant de constat	2017-12-01 00:00:00	NaN	NaN	NaN	NaN	NaN	0.0	\N	t
10	\N	\N	\N	lereste patricia	LEP	Intervenant de constat	2018-04-01 00:00:00	51521854300020.0	NaN	NaN	NaN	NaN	0.0	\N	t
11	\N	\N	\N	simier matthew	SIM	Intervenant de constat	2018-10-21 00:00:00	844889162.0	NaN	NaN	NaN	NaN	0.0	\N	t
12	\N	\N	\N	detoc tristan	TDT	Agent de planning	2015-10-01 00:00:00	81382411700010.0	NaN	NaN	NaN	NaN	0.0	\N	t
13	\N	\N	\N	laude blandine	LBA	Intervenant de constat	2019-08-12 00:00:00	43876287400032.0	NaN	NaN	NaN	NaN	0.0	\N	t
14	\N	\N	\N	de nazelle anne	ADN	Intervenant de constat	2020-04-14 00:00:00	53018623800032.0	NaN	NaN	NaN	NaN	0.0	\N	t
15	\N	\N	\N	denizot rachel	DRZ	Intervenant de constat	2020-07-16 00:00:00	NaN	NaN	NaN	NaN	NaN	0.0	\N	t
16	\N	\N	\N	dupe catherine	DPC	Intervenant de constat	2020-07-06 00:00:00	75352647400022.0	NaN	NaN	NaN	NaN	0.0	\N	t
17	\N	\N	\N	kaki mbeleck faustin	KMF	Intervenant de constat	2020-05-13 00:00:00	82076172400021.0	NaN	NaN	NaN	NaN	0.0	\N	t
18	\N	\N	\N	hanquiez florence	FRH	Intervenant de constat	2020-09-16 00:00:00	NaN	NaN	NaN	NaN	NaN	0.0	\N	t
19	\N	\N	\N	arnaudeau nicolas	NaN	Agent de secteur	2015-04-15 00:00:00	811433523.0	NaN	NaN	NaN	NaN	0.0	\N	t
20	\N	\N	\N	madir lucile	LM	Agent de secteur	2014-04-22 00:00:00	528110026.0	NaN	NaN	NaN	NaN	0.0	\N	t
21	\N	\N	\N	andre aude line	AAL	Intervenant de constat	2016-01-01 00:00:00	NaN	NaN	NaN	NaN	NaN	0.0	\N	t
22	\N	\N	\N	carlier philippe	PC	Intervenant de constat	2016-10-01 00:00:00	433946290.0	NaN	NaN	NaN	NaN	0.0	\N	t
23	\N	\N	\N	chailloux sylvie	SC	Intervenant de constat	2016-05-01 00:00:00	451354187.0	NaN	NaN	NaN	NaN	0.0	\N	t
24	\N	\N	\N	deburghgraeve arnaud	AD	Intervenant de constat	2015-01-01 00:00:00	810291534.0	NaN	NaN	NaN	NaN	0.0	\N	t
25	\N	\N	\N	gonzalez laurence	LG	Intervenant de constat	2015-01-01 00:00:00	813027125.0	NaN	NaN	NaN	NaN	0.0	\N	t
26	\N	\N	\N	hel alain	AHE	Intervenant de constat	2015-01-01 00:00:00	423267012.0	NaN	NaN	NaN	NaN	0.0	\N	t
27	\N	\N	\N	joly virginie	VJ	Audit Planners	2014-01-01 00:00:00	791671126.0	NaN	NaN	NaN	NaN	0.0	\N	t
28	\N	\N	\N	badja sebastien	SB	Intervenant de constat	2014-11-01 00:00:00	808320436.0	NaN	NaN	NaN	NaN	0.0	\N	t
29	\N	\N	\N	batard mickael	MB	Intervenant de constat	2015-08-01 00:00:00	813245040.0	NaN	NaN	NaN	NaN	0.0	\N	t
30	\N	\N	\N	boin habsatou	HB	Intervenant de constat	2016-05-01 00:00:00	820470276.0	NaN	NaN	NaN	NaN	0.0	\N	t
31	\N	\N	\N	culerier lorraine	LC	Intervenant de constat	2017-03-01 00:00:00	829213727.0	NaN	NaN	NaN	NaN	0.0	\N	t
32	\N	\N	\N	drouet genevieve	GDR	Agent de secteur	2017-01-01 00:00:00	827817461.0	NaN	NaN	NaN	FR01827817461	0.0	\N	t
33	\N	\N	\N	gregam julien	JG	Intervenant de constat	2016-06-01 00:00:00	NaN	NaN	NaN	NaN	NaN	0.0	\N	t
34	\N	\N	\N	leroy frederic	FL	Agent de secteur	2017-02-01 00:00:00	824831234.0	NaN	NaN	NaN	NaN	0.0	\N	t
35	\N	\N	\N	lesage jean yves	JYL	Intervenant de constat	2016-03-01 00:00:00	490539046.0	NaN	NaN	NaN	NaN	0.0	\N	t
36	\N	\N	\N	mafat cedric	CM	Agent de secteur	2012-06-01 00:00:00	753756469.0	NaN	NaN	NaN	NaN	0.0	\N	t
37	\N	\N	\N	medina serge	SM	Intervenant de constat	2012-10-01 00:00:00	789626421.0	NaN	NaN	NaN	NaN	0.0	\N	t
38	\N	\N	\N	mitouard jean paul	JPM	Agent de secteur	2014-12-01 00:00:00	817830763.0	NaN	NaN	NaN	NaN	0.0	\N	t
39	\N	\N	\N	pascaud denis	DPS	Intervenant de constat	2017-03-01 00:00:00	800872301.0	NaN	NaN	NaN	NaN	0.0	\N	t
40	\N	\N	\N	pelletier louis antoine	LAP	Intervenant de constat	2016-03-01 00:00:00	820307205.0	NaN	NaN	NaN	NaN	0.0	\N	t
41	\N	\N	\N	pichon christian	CP	Agent de secteur	2017-04-01 00:00:00	830995833.0	NaN	NaN	NaN	NaN	0.0	\N	t
42	\N	\N	\N	renault therese	TR	Intervenant de constat	2013-05-01 00:00:00	793907254.0	NaN	NaN	NaN	NaN	0.0	\N	t
43	\N	\N	\N	richet jean jacques	JJR	Intervenant de constat	2017-04-01 00:00:00	NaN	NaN	NaN	NaN	NaN	0.0	\N	t
44	\N	\N	\N	vivion nathalie	NV	Intervenant de constat	2016-03-01 00:00:00	NaN	NaN	NaN	NaN	NaN	0.0	\N	t
45	\N	\N	\N	beauvallet philippe	PB	Intervenant de constat	2017-03-01 00:00:00	NaN	NaN	NaN	NaN	NaN	0.0	\N	t
46	\N	\N	\N	froger veronique	VF	Intervenant de constat	2017-06-01 00:00:00	NaN	NaN	NaN	NaN	NaN	0.0	\N	t
47	\N	\N	\N	lemaurou pierrette	PLM	Intervenant de constat	2017-08-01 00:00:00	NaN	NaN	NaN	NaN	NaN	0.0	\N	t
48	\N	\N	\N	prudhon jean yves	JYP	Intervenant de constat	2017-06-01 00:00:00	NaN	NaN	NaN	NaN	NaN	0.0	\N	t
49	\N	\N	\N	belorgane mathurine	MB	Intervenant de constat	2017-08-01 00:00:00	NaN	NaN	NaN	NaN	NaN	0.0	\N	t
50	\N	\N	\N	gros christian	GCH	Intervenant de constat	2017-06-01 00:00:00	449879311.0	NaN	NaN	NaN	NaN	0.0	\N	t
51	\N	\N	\N	le dreff quentin	QLD	Intervenant de constat	2017-06-01 00:00:00	NaN	NaN	NaN	NaN	NaN	0.0	\N	t
52	\N	\N	\N	battel aymeric	AYB	Intervenant de constat	2017-12-01 00:00:00	833547482.0	NaN	NaN	NaN	NaN	0.0	\N	t
53	\N	\N	\N	cuadras cathy	CUA	Intervenant de constat	2017-11-01 00:00:00	83322156700013.0	NaN	NaN	NaN	NaN	0.0	\N	t
54	\N	\N	\N	conte alexis	AXC	Intervenant de constat	2018-01-01 00:00:00	NaN	NaN	NaN	NaN	NaN	0.0	\N	t
55	\N	\N	\N	pauleau romain	ROM	Intervenant de constat	2017-11-21 00:00:00	78925043800023.0	NaN	NaN	NaN	NaN	0.0	\N	t
56	\N	\N	\N	guimard herve	GUH	Intervenant de constats	2018-05-01 00:00:00	83436278200015.0	NaN	NaN	NaN	NaN	0.0	\N	t
57	\N	\N	\N	leconte guillaume	LEG	Intervenant de constats	2018-04-01 00:00:00	84178046300011.0	NaN	NaN	NaN	NaN	0.0	\N	t
58	\N	\N	\N	reuillon thomas	RET	Intervenant de constats	2018-04-01 00:00:00	NaN	NaN	NaN	NaN	NaN	0.0	\N	t
59	\N	\N	\N	drouet mathieu	DRM	Intervenant de constat	2018-03-01 00:00:00	NaN	NaN	NaN	NaN	NaN	0.0	\N	t
60	\N	\N	\N	bento richard	BR	Sous-traitant	2018-06-18 00:00:00	821482296.0	NaN	NaN	NaN	07821482296	0.0	\N	t
61	\N	\N	\N	st  - rolland remy	NaN	Sous-traitant	2018-06-04 00:00:00	NaN	NaN	NaN	NaN	NaN	0.0	\N	t
62	\N	\N	\N	st - cabaret emilie	CEM	Sous-traitant	2018-06-11 00:00:00	83776728400016.0	NaN	NaN	NaN	NaN	0.0	\N	t
63	\N	\N	\N	st - calmet isabelle	ICL	Sous-traitant	2018-06-04 00:00:00	831471370.0	NaN	NaN	NaN	NaN	0.0	\N	t
64	\N	\N	\N	st  - care thierry	CAT	Sous-traitant	2018-06-04 00:00:00	511571861.0	NaN	NaN	NaN	NaN	0.0	\N	t
65	\N	\N	\N	cottin emilie	ECI	Agent de secteur	2018-07-23 00:00:00	83373433800019.0	NaN	NaN	NaN	NaN	0.0	\N	t
66	\N	\N	\N	st - deveze guillaume	NaN	Sous-traitant	2018-08-21 00:00:00	NaN	NaN	NaN	NaN	NaN	0.0	\N	t
67	\N	\N	\N	duranton emmanuel	EDR	Intervenant de constat	2018-06-08 00:00:00	829152701.0	NaN	NaN	NaN	NaN	0.0	\N	t
68	\N	\N	\N	s t - lucas dominique	LUD	Sous-traitant	2018-06-04 00:00:00	80021592300031.0	NaN	NaN	NaN	NaN	0.0	\N	t
69	\N	\N	\N	gangnat olivier	OGT	Intervenant de constat	2018-08-13 00:00:00	80034246100012.0	NaN	NaN	NaN	NaN	0.0	\N	t
70	\N	\N	\N	marie-rose miguel	NaN	Intervenant de constat	2018-08-28 00:00:00	NaN	NaN	NaN	NaN	NaN	0.0	\N	t
71	\N	\N	\N	calmet isabelle	CLI	Intervenat de constat	2019-01-01 00:00:00	83147137000013.0	NaN	NaN	NaN	NaN	0.0	\N	t
72	\N	\N	\N	joncheray léa	JOL	Intervenant de constat	2019-01-24 00:00:00	NaN	NaN	NaN	NaN	NaN	0.0	\N	t
73	\N	\N	\N	jullien nadia	JUN	Intervenant de constat	2018-10-02 00:00:00	51448485600028.0	NaN	NaN	NaN	NaN	0.0	\N	t
74	\N	\N	\N	laserre herve	LAH	Intervenant de constat	2018-10-08 00:00:00	NaN	NaN	NaN	NaN	NaN	0.0	\N	t
75	\N	\N	\N	pum dany	PMD	Intervenant de constat	2018-12-23 00:00:00	805293958.0	NaN	NaN	NaN	NaN	0.0	\N	t
76	\N	\N	\N	talon prescillia	TAP	Intervenant de cosntat	2018-10-09 00:00:00	840024491.0	NaN	NaN	NaN	NaN	0.0	\N	t
77	\N	\N	\N	verniest anne	VRA	Intervenant de constat	2018-12-28 00:00:00	NaN	NaN	NaN	NaN	NaN	0.0	\N	t
78	\N	\N	\N	leneindre loic	LEL	Intervenant de constat	2019-01-02 00:00:00	NaN	NaN	NaN	NaN	NaN	0.0	\N	t
79	\N	\N	\N	beladoui majid	NaN	Intervenanr de constat	2019-02-25 00:00:00	39102649900106.0	NaN	NaN	NaN	NaN	NaN	\N	t
80	\N	\N	\N	deyris marie laurence	DRL	Intervenant de constat	2019-02-11 00:00:00	NaN	NaN	NaN	NaN	NaN	NaN	\N	t
81	\N	\N	\N	polat serhat	SPT	Intervenant de constat	2019-05-07 00:00:00	NaN	NaN	NaN	NaN	NaN	0.0	\N	t
82	\N	\N	\N	fouchard odile	FDO	Intervenant de constat	2019-03-19 00:00:00	85144502300019.0	NaN	NaN	NaN	NaN	0.0	\N	t
83	\N	\N	\N	lledo luc	EDU	Intervenant de constat	2019-04-27 00:00:00	85268690600011.0	NaN	NaN	NaN	NaN	0.0	\N	t
84	\N	\N	\N	pierre nicolas jean-marc	PNJ	Intervenant de constat	2019-07-03 00:00:00	82961659400016.0	NaN	NaN	NaN	NaN	0.0	\N	t
85	\N	\N	\N	neufcourt pascal	NFP	Intervenant de constat	2019-09-30 00:00:00	85153500500017.0	NaN	NaN	NaN	NaN	0.0	\N	t
0	\N	\N	0	0	\N	0	2021-06-03 19:39:35.682554	\N	0	\N	0	\N	\N	\N	f
2	\N	\N	Mr.	Admin	\N	Admin	2021-06-03 19:39:35.687548	\N	test0001@gmail.com	\N	12345	\N	\N	$2b$12$zhP0fUTY29v5qy72/gq/3uLnmsPztdxcM3zMcfeg8SfPCSuohYdg6	f
\.


--
-- Data for Name: Expert_History; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Expert_History" (id, expert_id, actif_parti, secteur, type_certification, date_certification_initiale, date_renouv_certification, adresse1, adresse2, cp, login_backof, pwd_backof, login_extranet, pwd_extranet, pwd_gsuite, login_google, pwd_google, ville, observations_de_suivi, date_sortie, date, visibility) FROM stdin;
2	4	actif	Gironde Ouest	NaN	NaN	NaN	3 LA Garenne	NaN	33820.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	BRAUD ET SAINT LOUIS	NaN	\N	2021-06-03 19:40:19.402672	t
3	5	actif	Vendée & Deux Sèvres	NaN	NaN	NaN	16 rue de la Mairie	NaN	85210.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	THIRE	NaN	\N	2021-06-03 19:40:19.431653	t
4	6	actif	Maine et Loire	NaN	NaN	NaN	Chemin de la Réauté	NaN	49330.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	LES HAUTS D'ANJOU	NaN	\N	2021-06-03 19:40:19.455637	t
5	7	actif	Loire Atlantique Nord	NaN	NaN	NaN	30 rue de l'Epeau	NaN	44470.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	CARQUEFOU	NaN	\N	2021-06-03 19:40:19.484621	t
6	8	actif	France	NaN	NaN	NaN	6 rue du Champe de Montigny	NaN	49080.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	BOUCHEMAINE	NaN	\N	2021-06-03 19:40:19.509608	t
7	9	actif	Maine et Loire	NaN	NaN	NaN	11 Place de Verdun	NaN	49700.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	DOUE LA FONTAINE	NaN	\N	2021-06-03 19:40:19.537592	t
8	10	actif	Sarthe Mayenne	NaN	NaN	NaN	24 rue de la Fenaison	NaN	53810.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	CHANGE	NaN	\N	2021-06-03 19:40:19.561577	t
9	11	actif	Ile de France	NaN	NaN	NaN	8 rue de la Poste	NaN	94210.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	SAINT MAURE DES FOSSES	NaN	\N	2021-06-03 19:40:19.587564	t
10	12	actif	France	NaN	NaN	NaN	23 rue de Belfort	NaN	49100.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	ANGERS	NaN	\N	2021-06-03 19:40:19.619545	t
11	13	actif	Pays de la Loire	NaN	NaN	NaN	2 Lieu dit Saint Jean	NaN	85190.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	VENANSAULT	NaN	\N	2021-06-03 19:40:19.64453	t
12	14	actif	Ile de France	NaN	NaN	NaN	20 Boulevard de Verdun	NaN	92400.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	COURBEVOIE	NaN	\N	2021-06-03 19:40:19.669515	t
13	15	actif	Maine et Loire	NaN	NaN	NaN	16 rue de la Traquette	NaN	49100.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	ANGERS	NaN	\N	2021-06-03 19:40:19.693502	t
14	16	actif	Loire Atlantique	NaN	NaN	NaN	22 avenue de Jousselin	NaN	44300.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	NANTES	NaN	\N	2021-06-03 19:40:19.721486	t
15	17	actif	Ile de France	NaN	NaN	NaN	28 Place de l'An 2000	NaN	77380.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	COBS LA VILLE	NaN	\N	2021-06-03 19:40:19.747472	t
16	18	actif	Ile de France	NaN	NaN	NaN	34 rue de l'Echiqier	NaN	75010.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	PARIS	NaN	\N	2021-06-03 19:40:19.772457	t
17	19	Parti	Ille et Vilaine	NaN	NaN	NaN	NaN	NaN	NaN	NaN	NaN	NaN	NaN	NaN	NaN	NaN	NaN	NaN	\N	2021-06-03 19:40:19.797442	t
18	20	Parti	Seine et Marne Nord	NaN	NaN	NaN	25 Chemin des Bas Champs	NaN	77700.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	CHESSY	NaN	\N	2021-06-03 19:40:19.826427	t
19	21	Parti	Loir Atlantique	NaN	NaN	NaN	Le Pont Bouvronnais	NaN	44130.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	BOUVRON	NaN	\N	2021-06-03 19:40:19.852415	t
20	22	Parti	Hauts de Seine Sud	NaN	NaN	NaN	38 rue de Silly	NaN	92100.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	BOULOGNE BILLANCOURT	NaN	\N	2021-06-03 19:40:19.879396	t
21	23	Parti	Maine et Loire	NaN	NaN	NaN	31 rue des Fresnaies	NaN	49800.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	TRELAZE	NaN	\N	2021-06-03 19:40:19.906386	t
22	24	Parti	Gironde	NaN	NaN	NaN	15 rue du Docteur Castanet	NaN	33200.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	BORDEAUX	NaN	\N	2021-06-03 19:40:19.932366	t
23	25	Parti	Seine et Marne Nord	NaN	NaN	NaN	9 rue Petit Huet	NaN	77640.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	JOUARRE	NaN	\N	2021-06-03 19:40:19.958352	t
24	26	Parti	Maine et Loire	NaN	NaN	NaN	9 rue de la Gourmette	NaN	49000.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	ECOUFLANT	NaN	\N	2021-06-03 19:40:19.984335	t
25	27	Parti	Ouest	NaN	NaN	NaN	4 rue des Chênes	NaN	49330.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	CONTIGNE	NaN	\N	2021-06-03 19:40:20.014319	t
26	28	Parti	Maine et Loire	NaN	NaN	NaN	69 rue de Cholet	NaN	49700.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	DOUE LA FONTAINE	NaN	\N	2021-06-03 19:40:20.039304	t
27	29	Parti	Maine et Loire	NaN	NaN	NaN	55 Les Grenettes	NaN	49270.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	OREE D'ANJOU	NaN	\N	2021-06-03 19:40:20.06429	t
28	30	Parti	Seine et Marne	NaN	NaN	NaN	1 rue du Chagnot	NaN	77700.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	MAGNY LE HONGRE	NaN	\N	2021-06-03 19:40:20.091277	t
29	31	Parti	Maine et Loire	NaN	NaN	NaN	11 Square du Houx	NaN	49150.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	BAUGE EN ANJOU	NaN	\N	2021-06-03 19:40:20.119261	t
30	32	Parti	Finistère	NaN	NaN	NaN	320 Route du Douhar Bihan	NaN	29470.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	PLOUGASTEL DAOULAS	NaN	\N	2021-06-03 19:40:20.147248	t
31	33	Parti	Maine et Loire	NaN	NaN	NaN	5 bis rue du Gal Zinner	NaN	44800.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	SAINT HERBLAIN	NaN	\N	2021-06-03 19:40:20.173228	t
32	34	Parti	Sarthe Mayenne	NaN	NaN	NaN	41 avenue du Lac	NaN	72650.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	LA BAZIGE	NaN	\N	2021-06-03 19:40:20.200214	t
33	35	Parti	Vendée & Deux Sèvres	NaN	NaN	NaN	42 rue des Boulignières	NaN	85430.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	AUBIGNY	NaN	\N	2021-06-03 19:40:20.228199	t
34	36	Parti	Paris 11-20 & Hauts de Seine Sud	NaN	NaN	NaN	76 Boulevard de Charonne	NaN	75020.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	PARIS	NaN	\N	2021-06-03 19:40:20.254181	t
35	37	Parti	Maine et Loire	NaN	NaN	NaN	7 rue Brossais	NaN	49170.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	SAINT LEGER DES BOIS	NaN	\N	2021-06-03 19:40:20.284165	t
36	38	Parti	Yvelines Sud	NaN	NaN	NaN	110 rue Karl Marx	NaN	78800.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	HOUILLES	NaN	\N	2021-06-03 19:40:20.30915	t
37	39	Parti	Maine et Loire	NaN	NaN	NaN	1 rue du Petit Sigogne	NaN	49320.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	CHEMELIER	NaN	\N	2021-06-03 19:40:20.335135	t
38	40	Parti	Maine et Loire	NaN	NaN	NaN	La Touche	NaN	49320.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	SAINT JEAN DES MAUVRETS	NaN	\N	2021-06-03 19:40:20.360122	t
39	41	Parti	Loiret & Loir et Cher	NaN	NaN	NaN	68 avenue de Blossac	NaN	79400.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	SAINT MAIXENTL'ECOLE	NaN	\N	2021-06-03 19:40:20.391103	t
40	42	Parti	Montmartre	NaN	NaN	NaN	1 allée des Rabottières	NaN	91450.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	ETIOLLES	NaN	\N	2021-06-03 19:40:20.418088	t
41	43	Parti	Vendée & Deux Sèvres	NaN	NaN	NaN	2 rues des Chailloux	NaN	85570.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	L'HERMENAULT	NaN	\N	2021-06-03 19:40:20.443073	t
42	44	Parti	Maine et Loire	NaN	NaN	NaN	La Bigrie	NaN	49140.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	VILLEVEQUE	NaN	\N	2021-06-03 19:40:20.46706	t
43	45	Parti	Vendée & Deux Sèvres	NaN	NaN	NaN	20 Chemin des Besse	NaN	85300.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	SOULAN	NaN	\N	2021-06-03 19:40:20.492046	t
44	46	Parti	Maine et Loire	NaN	NaN	NaN	20 rue des Ardrières	NaN	49100.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	ANGERS	NaN	\N	2021-06-03 19:40:20.516032	t
45	47	Parti	Loir et Cher - Loiret	NaN	NaN	NaN	13 Grande rue	NaN	45480.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	ERCEVILLE	NaN	\N	2021-06-03 19:40:20.541017	t
46	48	Parti	Loire Atlantique Nord	NaN	NaN	NaN	30 rue du Haut Chemin	NaN	44260.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	PRINQUIAU	NaN	\N	2021-06-03 19:40:20.568002	t
47	49	Parti	Ile de France	NaN	NaN	NaN	32 rue des Buttes Reault	NaN	91659.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	BREUILLET	NaN	\N	2021-06-03 19:40:20.593987	t
48	50	Parti	Seine et Marne	NaN	NaN	NaN	16 Chemin de Lagny	NaN	77410.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	CLAYE SOUILLY	NaN	\N	2021-06-03 19:40:20.619972	t
49	51	Parti	Finistère	NaN	NaN	NaN	5 rue de la Montagne	NaN	29200.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	BREST	NaN	\N	2021-06-03 19:40:20.664945	t
50	52	Parti	Il de France	NaN	NaN	NaN	27 rue Saint Ambroise	NaN	75011.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	PARIS	NaN	\N	2021-06-03 19:40:20.690932	t
51	53	Parti	Les Hauts de France	NaN	NaN	NaN	38 Allée du Château Blanc	NaN	59130.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	LAMBERSAT	NaN	\N	2021-06-03 19:40:20.717917	t
52	54	Parti	Centre Val de Loir	NaN	NaN	NaN	44b rue de la Tonnelle	NaN	41350.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	HUISSEAU SUR COSSON	NaN	\N	2021-06-03 19:40:20.7439	t
53	55	Parti	Maine et Loire	NaN	NaN	NaN	63 Boulevard Henri Dunant	NaN	49100.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	ANGERS	NaN	\N	2021-06-03 19:40:20.769885	t
54	56	Parti	Loir et Cher - Loiret	NaN	NaN	NaN	10 rue Ulysse Fleury	NaN	41350.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	VINEUIL	NaN	\N	2021-06-03 19:40:20.793872	t
55	57	Parti	Ile de France	NaN	NaN	NaN	38 boulevard Maillot	NaN	92200.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	NEUILLY SUR SEINE	NaN	\N	2021-06-03 19:40:20.818858	t
56	58	Parti	Loiret & Loir et Cher	NaN	NaN	NaN	39 rue de la Janverie	NaN	41150.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	MONTEAUX	NaN	\N	2021-06-03 19:40:20.843844	t
57	59	Parti	Charente et Charente Maritime	NaN	NaN	NaN	18 rue de la Treille	NaN	17430.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	TONAY CHARENTE	NaN	\N	2021-06-03 19:40:20.869829	t
58	60	Parti	Haute Garonne	NaN	NaN	NaN	17 avenue Lucien Servanty	NaN	31700.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	BLAGNAC	NaN	\N	2021-06-03 19:40:20.897813	t
59	61	Parti	Haute Garonne	NaN	NaN	NaN	10 B rue de Tournamille	NaN	31670.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	LABEGE	NaN	\N	2021-06-03 19:40:20.924798	t
60	62	Parti	Ile de France	NaN	NaN	NaN	76 boulevard de Charonne	NaN	75020.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	PARIS	NaN	\N	2021-06-03 19:40:20.951783	t
61	63	Parti	Loir Atlantique	NaN	NaN	NaN	5 Allée de la Reine Margot	NaN	44000.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	NANTES	NaN	\N	2021-06-03 19:40:20.976768	t
62	64	Parti	Ile de France	NaN	NaN	NaN	22 rue du Rhin	NaN	78180.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	MONTIGNY LE BRETONNEUX	NaN	\N	2021-06-03 19:40:21.008753	t
63	65	Parti	Loir et Cher - Loiret	NaN	NaN	NaN	20 rue de la Fosse au Lard	NaN	45400.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	CHANTEAU	NaN	\N	2021-06-03 19:40:21.035737	t
64	66	Parti	Ile de France	NaN	NaN	NaN	202 avenue Marx Dormoy	NaN	92120.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	Monrouge	NaN	\N	2021-06-03 19:40:21.065718	t
65	67	Parti	Maine et Loire	NaN	NaN	NaN	7 Mail Claude Debussy	NaN	49125.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	TIERCE	NaN	\N	2021-06-03 19:40:21.093701	t
66	68	Parti	Charente et Charente Maritime	NaN	NaN	NaN	16 rue du Port	NaN	17340.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	YVES	NaN	\N	2021-06-03 19:40:21.118686	t
67	69	Parti	Maine et Loire	NaN	NaN	NaN	41 rue Lucien Béjeau	NaN	49100.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	ANGERS	NaN	\N	2021-06-03 19:40:21.147671	t
68	70	Parti	Ile de France	NaN	NaN	NaN	5 rue Pierre Curie	NaN	94200.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	IVRY SUR SEINE	NaN	\N	2021-06-03 19:40:21.17466	t
69	71	Parti	Loire Atlantique	NaN	NaN	NaN	5 Allée de la Reine Margot	NaN	44000.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	NANTES	NaN	\N	2021-06-03 19:40:21.200639	t
70	72	Parti	Nouvelle Aquitaine	NaN	NaN	NaN	NaN	NaN	NaN	NaN	NaN	NaN	NaN	NaN	NaN	NaN	NaN	NaN	\N	2021-06-03 19:40:21.225625	t
71	73	Parti	Maine et Loire	NaN	NaN	NaN	21 rue Armand Broosse	NaN	49610.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	SAINT MELAINE SUR AUBANCE	NaN	\N	2021-06-03 19:40:21.25261	t
72	74	Parti	Maine et Loire	NaN	NaN	NaN	26 rue Marcel Pajotin	NaN	49000.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	ANGERS	NaN	\N	2021-06-03 19:40:21.278595	t
73	75	Parti	Ile de France	NaN	NaN	NaN	32 avenue de la Brunerie	NaN	77330.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	OZOIR LA FERRIERE	NaN	\N	2021-06-03 19:40:21.307577	t
74	76	Parti	Loiret et Loir et Cher	NaN	NaN	NaN	142 rue du Captaine O'Gilvy	NaN	45270.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	LADON	NaN	\N	2021-06-03 19:40:21.334563	t
75	77	Parti	Nouvelle Aquitaine	NaN	NaN	NaN	572 rue du Moulies	NaN	40160.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	PARENTIS EN BORN	NaN	\N	2021-06-03 19:40:21.363548	t
76	78	Parti	Ile de France	NaN	NaN	NaN	18 rue Yvon Chauveix	NaN	63970.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	ROUILLAS BAS	NaN	\N	2021-06-03 19:40:21.39353	t
77	79	Parti	Ile de France	NaN	NaN	NaN	128 rue de la Boétie	NaN	75008.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	PARIS	NaN	\N	2021-06-03 19:40:21.421513	t
78	80	Parti	Occitanie	NaN	NaN	NaN	98 Clos de Vic	NaN	34110.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	VIC LA GARDIOLE	NaN	\N	2021-06-03 19:40:21.448497	t
79	81	Parti	Loiret et Loir et Cher	NaN	NaN	NaN	2 rue Christophe Colomb	NaN	41000.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	BLOIS	NaN	\N	2021-06-03 19:40:21.473483	t
80	82	Parti	Maine et Loire	NaN	NaN	NaN	38 rue du Vallon	NaN	49000.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	ANGERS	NaN	\N	2021-06-03 19:40:21.500468	t
81	83	Parti	Vendée - Deux Sèvres	NaN	NaN	NaN	149 rue Mazeau	NaN	85440.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	TALMONT SAINT HILAIRE	NaN	\N	2021-06-03 19:40:21.527452	t
82	84	Parti	Ile de France	NaN	NaN	NaN	7 rue Louis Blériot	BP 126	93330.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	NEUILLY SUR MARNE	NaN	\N	2021-06-03 19:40:21.555437	t
83	85	Parti	BRETAGNE	NaN	NaN	NaN	10 rue Alain Gerbault	NaN	35590.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	L'HERMITAGE	NaN	\N	2021-06-03 19:40:21.584422	t
84	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2021-06-21 07:14:21.657647	t
85	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2021-06-21 07:19:40.310487	t
1	3	actif	Charente et Charente Maritime	eooo	2021-06-23	2021-06-03 19:40:19.369687	34 rue des Platanes	NaN	17220.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	SAINT ROGATIEN	NaN	\N	2021-06-03 19:40:19.369687	t
\.


--
-- Data for Name: Facturation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Facturation" (id, "Facture_no", "Date_", "Pays", "Destinataire", expediteur, "Montant", "TVA", "Total", "Type", "Proprietaire", "Locataire", "Ville", "Surface", "Tarif", "Appt_Pav", "Visibility") FROM stdin;
\.


--
-- Data for Name: Facturation_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Facturation_history" (id, date, mission, facture, done, visibility) FROM stdin;
\.


--
-- Data for Name: Mission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Mission" (id, "Reference_BAILLEUR", old, "NRO_FACTURE", "ABONNEMENT", "ID_AS", "PRIX_HT_EDL", "DATE_REALISE_EDL", "ID_INTERV", "Reference_LOCATAIRE", "Adresse1_Bien", "Adresse2_Bien", "CP_Bien", "Ville_Bien", "TVA_EDL", "PRIX_TTC_EDL", "CA_HT_AS", "TVA_AS", "CA_TTC_AS", "CA_HT_AC", "CA_TTC_AC", "CA_HT_TRUST", "TVA_TRUST", "Date_chiffrage_regle", "Prix_ht_chiffrage", "POURCENTAGE_suiveur_chiffrage", "POURCENTAGE_AS_chiffrage", "POURCENTAGE_manager_chiffrage", "ID_manager_chiffrage", "POURCENTAGE_agent_chiffrage", "ID_agent_chiffrage", "TYPE_EDL", "DATE_FACTURE", "TITREPROPRIO", "NOMPROPRIO", "DATE_FACT_REGLEE", "TYPE_LOGEMENT", "CODE_AMEXPERT", "COMMENTAIRE_FACTURE", "LOGEMENT_MEUBLE", "CODE_FACTURATION", "TYPE_DE_BIEN", surface_logement1, "Ref_commande", "POURCENTAGE_COM_AS_DU_CLIENT", "ID_Respon_Cell_Dev", "POURCENTAGE_Respon_Cell_Dev", "ID_agent_Cell_Dev", "POURCENTAGE_Agent_Cell_Dev", "ID_Agent_CellTech", "POURCENTAGE_Agent_Cell_Tech", "ID_Respon_Cell_Tech", "POURCENTAGE_Respon_Cell_Tech", "ID_Suiveur_Cell_Tech", "POURCENTAGE_Suiveur_Cell_Tech", "ID_Respon_Cell_Planif", "POURCENTAGE_Respon_Cell_Planif", "ID_Suiveur_Cell_Planif", "POURCENTAGE_Suiveur_Cell_Planif", "ID_Agent_saisie_Cell_Planif", "POURCENTAGE_Agent_saisie_CEll_planif", "Anomalie", coherent, reason, "Visibility") FROM stdin;
1	271	\N	\N	\N	0	\N	2021-05-26 00:00:00	0	ROSINSKI MATTHIEU	 7 RUE DE VOUILLE	\N	75015	PARIS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	ROS BLANDINE ET SOPHORN	\N	APPT-F2	25864	\N	NON	TN100 APPT F2	APPARTEMENT	33	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
2	330	\N	\N	\N	0	\N	2021-05-26 00:00:00	0	CASTAIGNET GUILLAUME	 117 RUE DAMREMONT	PORTE DROITE 	75018	PARIS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Entrant	\N	\N	LARCIN CAROLINE 	\N	APPT-F1	1128	\N	NON	TN100 APPT F1	APPARTEMENT	25	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
4	11	\N	\N	\N	0	\N	2021-05-26 00:00:00	0	BILLAULT LAUREEN	22 RUE DU DOCTEUR CHAILLOUX	\N	49330	CHAMPIGNE	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	GRAZELIE MAX	\N	APPT-F3	25867	\N	NON	TN100 APPT F3	APPARTEMENT	49.74	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
5	461	\N	\N	\N	0	\N	2021-05-26 00:00:00	0	DUBOST CLEMENT	3 RUE DU HAUT LAUNAY	\N	44300	NANTES	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Entrant	\N	\N	PARE ERIC  ESTELLE	\N	APPT-F2	24928	\N	NON	TN100 APPT F2	APPARTEMENT	49.66	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
6	11	\N	\N	\N	0	\N	2021-05-26 00:00:00	0	DEUTINE BRIGITTE	62 BOULEVARD DU ROI RENE	\N	49100	ANGERS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Entrant	\N	\N	DE LA SAYETTE MICHEL - OLIVIER	\N	APPT-F2	1602	\N	NON	TN100 APPT F2	APPARTEMENT	57.6	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
7	429	\N	\N	\N	0	\N	2021-05-26 00:00:00	0	DELARUE Meghan	31 RUE ANDRE MAGINOT	\N	33700	MERIGNAC	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Entrant	\N	\N	REYNAUD JEAN-MICHEL	\N	APPT-F1	23534	\N	NON	TN100 APPT F1	APPARTEMENT	24	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
8	330	\N	\N	\N	0	\N	2021-05-26 00:00:00	0	THACH GILLES ; RIQUEL CHLOE	 2 ALLEE D'ANDREZIEUX	\N	75018	PARIS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Entrant	\N	\N	CHABANEIX 	\N	APPT-F4	25717	\N	NON	TN100 APPT F4	APPARTEMENT	80.44	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
3	456	\N	\N	\N	0	\N	2021-05-26 00:00:00	0	SEREC PARIS REPRESENTE PAR KHOUN NANCIA	 270 RUE DU FAUBOURG SAINT MARTIN	\N	75010	PARIS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	SOCIETE SNEA 	\N	LOCAL COMMERCIAL	25866	\N	NON	TN100 APPT F4	LOCAL COMMERCIA	105	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t	t	Anomalie non bloquante traite en  AL	t
12	1	\N	\N	\N	0	\N	2021-05-27 00:00:00	0	CANN CHRISTOPHE	 26 ALLEE CLAUDE MONET 	\N	78160	MARLY LE ROI 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	SOLEIHAVOUP JOSETTE	\N	APPT-F2	15993	\N	NON 	TN100 APPT F2	APPARTEMENT	52	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
15	11	\N	\N	\N	0	\N	2021-05-27 00:00:00	0	PARENTEAU  Louis-Pierre et Christine	5  ANTOINE DE JUSSIEU	\N	49240	AVRILLE	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Entrant	\N	\N	 THELLIER et GUENET Florent et Priscilla	\N	PAV-T4	25872	\N	NON	TN100 PAV T4	PAVILLON	103	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
16	111	\N	\N	\N	0	\N	2021-05-27 00:00:00	0	GUILLOIS Nicolas	8 RUE DES CHEVREFEUILLES	\N	44240	LA CHAPELLE SUR ERDRE	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	LAMI Henri & Sylvianne	\N	APPT-F3	25873	\N	NON	TN100 APPT F3	APPARTEMENT	67.96	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
17	471	\N	\N	\N	0	\N	2021-05-27 00:00:00	0	LE MEUR CHRISTELLE	4 RUE DE L'ÎLE BENIGUET	\N	29000	QUIMPER	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	GILARD JOSEPH	\N	APPT-F2	25874	\N	NON	TN100 APPT F2	APPARTEMENT	44	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
22	481	\N	\N	\N	0	\N	2021-05-28 00:00:00	0	PELISSET LUCIE ; GOUDONNET LAURENT	 64 RUE DE WATTIGNIES	\N	75012	PARIS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	JIAR FARID	\N	APPT-F4	24973	\N	OUI	TN150 APPT F4	APPARTEMENT	62.6	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t	t	Anomalie non bloquante traite en  4 	t
19	456	\N	\N	\N	0	\N	2021-05-28 00:00:00	0	ENCELLE LILA ; FENOT ALEXANDRE	 9 TER RUE PAUL FEVAL	\N	75018	PARIS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Entrant	\N	\N	SALONITIS EURL LODGE PLUS MME CORENTIN	\N	APPT-F2	24701	\N	OUI	TN150 APPT F2	APPARTEMENT	39	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t	t	Anomalie non bloquante traite en  2 	t
13	457	\N	\N	\N	0	\N	2021-05-27 00:00:00	0	HIJAZI HALA	 105 RUE DE CLIGNANCOURT	\N	75018	PARIS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Entrant	\N	\N	LABIDI KHALIL ET HATEM	\N	APPT-F2	25816	\N	OUI	TN150 APPT F2	APPARTEMENT	30.81	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t	t	Anomalie non bloquante traite en  2 	t
9	330	\N	\N	\N	0	\N	2021-05-27 00:00:00	0	POCH CAMILLE	 93 RUE DUHESME	\N	75018	PARIS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Entrant	\N	\N	DESSERVILLE CLAIRE	\N	APPT-F2	15636	\N	OUI	TN150 APPT F2	APPARTEMENT	40.04	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t	t	Anomalie non bloquante traite en  2 	t
14	11	\N	\N	\N	0	\N	2021-05-27 00:00:00	0	LEBRUN ALEXIS	116 AVENUE PASTEUR	\N	49100	ANGERS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Entrant	\N	\N	BOURGAT  JORY	\N	APPT-F2	24320	\N	OUI	TN150 APPT F2	APPARTEMENT	25	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t	t	Anomalie non bloquante traite en  2 	t
20	330	\N	\N	\N	0	\N	2021-05-28 00:00:00	0	DE GEUSER BARBARA	 69 RUE MARCADET	\N	75018	PARIS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Entrant	\N	\N	AYUSO 	\N	APPT-F2	25763	\N	OUI	TN150 APPT F2	APPARTEMENT	25.15	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t	t	Anomalie non bloquante traite en  2 	t
10	457	\N	\N	\N	0	\N	2021-05-27 00:00:00	0	DE LARQUIER ALDRIC ; PETIT SABINE	 32 RUE EUGENE SUE	\N	75018	PARIS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Entrant	\N	\N	DUTHEIL BENOIT	\N	APPT-F3	25868	\N	OUI	TN150 APPT F3	APPARTEMENT	42.06	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t	t	Anomalie non bloquante traite en  3 	t
11	457	\N	\N	\N	0	\N	2021-05-27 00:00:00	0	ZODMI ALEXANDRE ; RICO CHARLOTTE	 36 RUE DAMREMONT	\N	75018	PARIS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Entrant	\N	\N	LE CORRE  NADINE	\N	APPT-F3	25670	\N	OUI	TN150 APPT F3	APPARTEMENT	70.91	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t	t	Anomalie non bloquante traite en  3 	t
18	70	\N	\N	\N	0	\N	2021-05-28 00:00:00	0	RIMETZ CHRISTOPHE	 2 RUE DES BERGERONNETTES	\N	85200	FONTENAY LE COMTE	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	BAUR LAURENCE	\N	PAV-T4	20895	\N	NON	TN100 PAV T4	PAVILLON	88	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
21	497	\N	\N	\N	0	\N	2021-05-28 00:00:00	0	ZHAO MIANMIAN	42 RUE WAGRAM	\N	72000	LE MANS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Entrant	\N	\N	LESTIENNE THOMAS	\N	APPT-F4	25836	\N	NON	TN100 APPT F4	APPARTEMENT	80.2	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
27	373	\N	\N	\N	0	\N	2021-05-28 00:00:00	0	LEITE RAJAO JOSE CARLOS ; MARQUES RAMOS ANDREIA SOFIA	 30-32 BIS RUE GUSTAVE NAST	\N	77500	CHELLES	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	JOUANNY LAURENT ET MONIQUE	\N	APPT-F2	25869	\N	NON	TN100 APPT F2	APPARTEMENT	45.37	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
31	183	\N	\N	\N	0	\N	2021-05-28 00:00:00	0	BEDUNEAU STEPHANE	 2 BOULEVARD LAPLACE	VICTORIA	85100	LES SABLES D'OLONNE	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Entrant	\N	\N	NEAU YOLANDE	\N	APPT-F3	25878	\N	NON	TN100 APPT F3	APPARTEMENT	65.47	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
35	11	\N	\N	\N	0	\N	2021-05-28 00:00:00	0	GUERZIDER ET PESLERBE Antoine et Léa	 59 RUE SAINT NICOLAS	\N	49100	ANGERS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	 INDIVISION CONSTANTIN BARGUILLET	\N	APPT-F3	21111	\N	NON	TN100 APPT F3	APPARTEMENT	69	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
39	471	\N	\N	\N	0	\N	2021-05-28 00:00:00	0	CROS et NEDJAR Alice et Ines	 17 RUE JEAN JAURES	2EME ETAGE GAUCHE / lot N° 5	29000	QUIMPER	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	CROCHET Erwan	\N	APPT-F3	24752	\N	NON	TN100 APPT F3	APPARTEMENT	55	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
41	11	\N	\N	\N	0	\N	2021-05-28 00:00:00	0	BINESSE MELISSA	21 RUE DU MAIL	\N	49100	ANGERS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Entrant	\N	\N	SCI MAIL 49 Monsieur BIEULES	\N	APPT-F1	24073	\N	NON	TN100 APPT F1	APPARTEMENT	15.94	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
23	348	\N	\N	\N	0	\N	2021-05-28 00:00:00	0	SINDATRY RUDY	 1 PLACE DU MAIL	ST MICHEL MONT MERCURE	85700	SEVREMONT	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Entrant	\N	\N	BELY MOUILLE JACKIE ET MARTINE	\N	PAV-T3	25858	\N	NON	TN100 PAV T3	PAVILLON	53	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
33	229	\N	\N	\N	0	\N	2021-05-28 00:00:00	0	OFFRET AURELIA	3 RUE DU LAVOIR	\N	53200	AMPOIGNE	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	BOCQUET CEDRIC	\N	PAV-T2	25879	\N	NON	TN100 APPT F2	PAVILLON	76	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t	t	Anomalie non bloquante traite en  T2	t
25	330	\N	\N	\N	0	\N	2021-05-28 00:00:00	0	LE BATARD Mélina	 95 RUE LA JONQUIERE	\N	75017	PARIS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	MME  GOUPIL DE BOUILLE Stéphanie	\N	APPT-STU	22596	\N	OUI	TN150 APPT STU	APPARTEMENT	15.37	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t	t	Anomalie non bloquante traite en  U 	t
29	330	\N	\N	\N	0	\N	2021-05-28 00:00:00	0	CATURANO ALFREDO	 46 RUE SAINT ANDRE DES ARTS	\N	75006	PARIS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Entrant	\N	\N	SADA 26 MR Dan BELLAICHE	\N	APPT-F2	25871	\N	OUI	TN150 APPT F2	APPARTEMENT	58.6	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t	t	Anomalie non bloquante traite en  2 	t
37	461	\N	\N	\N	0	\N	2021-05-28 00:00:00	0	BOUSQUET LUCAS	 8 PLACE SAINT PIERRE	\N	44470	CARQUEFOU	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	MOSSET PAUL	\N	APPT-F1	24329	\N	OUI	TN150 APPT F1	APPARTEMENT	14	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t	t	Anomalie non bloquante traite en  1 	t
28	330	\N	\N	\N	0	\N	2021-05-28 00:00:00	0	ROUSSEAU SOPHIE	 49 RUE EUGENE CARRIERE	\N	75018	PARIS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	COTE PIERRE	\N	APPT-F2	25870	\N	NON	TN100 APPT F2	APPARTEMENT	31	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
34	429	\N	\N	\N	0	\N	2021-05-28 00:00:00	0	NORBIS Marjorie	1 PASSAGE FRONSAC	RESIDENCE DES 7 ETOILES	33000	BORDEAUX	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	ZASPI IZAR MME ITHURBURU	\N	APPT-F2	23180	\N	NON	TN100 APPT F2	APPARTEMENT	51	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
36	461	\N	\N	\N	0	\N	2021-05-28 00:00:00	0	BRASSELET Nicolas et Emilie	 9 IMPASSE HERACLES 	\N	44470	CARQUEFOU	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	GALLERINE CHRISTELLE	\N	PAV-T4	25880	\N	NON	TN100 PAV T4	APPARTEMENT	82	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
38	11	\N	\N	\N	0	\N	2021-05-28 00:00:00	0	OUICE MAELLE	 21 BIS RUE DU MAIL	NUMERO 4 SUR COUR	49100	ANGERS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	MAIL 49 	\N	APPT-F1	23874	\N	NON	TN100 APPT F1	APPARTEMENT	12.22	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
40	11	\N	\N	\N	0	\N	2021-05-28 00:00:00	0	PERCHE LOUISON	21 RUE DU MAIL	\N	49100	ANGERS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	SCI MAIL 49 Monsieur BIEULES	\N	APPT-F1	24073	\N	NON	TN100 APPT F1	APPARTEMENT	15.94	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
24	348	\N	\N	\N	0	\N	2021-05-28 00:00:00	0	DURET VERONIQUE	 39 ALLEE DES EGLANTIERS	\N	85500	LES HERBIERS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	DURAND_ARTARY REMI_BENEDICTE	\N	PAV-T3	25859	\N	NON	TN100 PAV T3	PAVILLON	59	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
42	471	\N	\N	\N	0	\N	2021-05-28 00:00:00	0	DUPONT GRACE - ALLAIN	 4  Allée Couchouren	\N	29000	QUIMPER	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Entrant	\N	\N	DEROUIN PISANI  Antoine et Raffaello	\N	APPT-F2	25881	\N	OUI	TN150 APPT F2	APPARTEMENT	53	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t	t	Anomalie non bloquante traite en  2 	t
43	348	\N	\N	\N	0	\N	2021-05-29 00:00:00	0	BUANNEC CHARLOTTE	 10 C RUE DE VERDUN	\N	85500	LES HERBIERS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Entrant	\N	\N	M ET M DURET MAXIME ET MARIE	\N	PAV-T2	25550	\N	NON	TN100 PAV T2	PAVILLON	48.88	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
45	11	\N	\N	\N	0	\N	2021-05-29 00:00:00	0	OGER ELLA	 76 RUE CHRISTOPHE COLOMB	\N	49800	TRELAZE	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	TRUPIANO  CHRISTOPHE	\N	PAV-T5	22354	\N	NON	TN100 PAV T5	PAVILLON	96	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
47	11	\N	\N	\N	0	\N	2021-05-29 00:00:00	0	LECOMTE CATHERINE	 2 RUE KRUGER	\N	49100	ANGERS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	LEGOT DIDIER	\N	PAV-T4	5737	\N	NON	TN100 PAV T4	PAVILLON	72	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
48	11	\N	\N	\N	0	\N	2021-05-29 00:00:00	0	LEROY SULLIVAN	3 3 PLACE DE L'EGLISE	\N	49640	MORANNES	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	MEZIERE ROLAND	\N	APPT-F3	2001	\N	NON	TN100 APPT F3	PAVILLON	62	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
50	11	\N	\N	\N	0	\N	2021-05-29 00:00:00	0	VIDY - JONCHERAY DAVID - LOUISE	 3 RUE DU CERCLE 	\N	49320	COUTURES	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	CERCEAU MICHEL	\N	PAV-T4	25882	\N	NON	TN100 PAV T4	PAVILLON	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
51	373	\N	\N	\N	0	\N	2021-05-29 00:00:00	0	BEN AISSA SAFA	 16 RUE DE VERDUN	\N	93110	ROSNY SOUS BOIS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Entrant	\N	\N	RUBIO SYLVIE	\N	APPT-F1	25883	\N	NON	TN100 APPT F1	APPARTEMENT	31.93	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
52	409	\N	\N	\N	0	\N	2021-05-29 00:00:00	0	DERACHE SEBASTIEN	41/43 AVENUE JACQUES HEUCLIN	\N	77340	PONTAULT COMBAULT	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	PARADELA FERNANDO	\N	APPT-F2	25040	\N	NON	TN100 APPT F2	APPARTEMENT	30.80	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
56	173	\N	\N	\N	0	\N	2021-05-31 00:00:00	0	COURTIN CLAIRE	26 RUE PAUL BAUDRY	\N	85000	LA ROCHE SUR YON	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	REZEAU REMI	\N	APPT-F1	24110	\N	OUI	TN150 APPT F1	APPARTEMENT	22.02	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t	t	Anomalie non bloquante traite en  1 	t
26	330	\N	\N	\N	0	\N	2021-05-28 00:00:00	0	PERRET JIMMY	 13 RUE DE L'EVANGILE	PORTE GAUCHE FACE	75018	PARIS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	M. DAMBRINES DE RAMECOURT GUILLAUME	\N	APPT-F1	704	\N	OUI	TN150 APPT F1	APPARTEMENT	18.07	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t	t	Anomalie non bloquante traite en  1 	t
30	330	\N	\N	\N	0	\N	2021-05-28 00:00:00	0	HAUTIER VLADIMIR ; MARLAT SALOME	 29 BOULEVARD DE GRENELLE	\N	75015	PARIS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Entrant	\N	\N	CAPLOUN ET CAUET JOSSELINE	\N	APPT-F2	25877	\N	OUI	TN150 APPT F2	APPARTEMENT	40.03	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t	t	Anomalie non bloquante traite en  2 	t
49	471	\N	\N	\N	0	\N	2021-05-29 00:00:00	0	LE DROGO Lucie	5 RUE DU LEON	A DROITE sur descente escalier 	29000	QUIMPER	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	NICOLAS MARIN	\N	APPT-F4	24690	\N	OUI	TN150 APPT F4	APPARTEMENT	65	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t	t	Anomalie non bloquante traite en  4 	t
32	11	\N	\N	\N	0	\N	2021-05-28 00:00:00	0	DUHAMEL LEO	 37 RUE MICHELET	\N	49100	ANGERS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	SAINT MARTIN CHRISTOPHE	\N	APPT-F1	2330	\N	OUI	TN150 APPT F1	APPARTEMENT	19.7	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t	t	Anomalie non bloquante traite en  1 	t
44	457	\N	\N	\N	0	\N	2021-05-29 00:00:00	0	BARBADO MELVIN	 8 RUE DES CLOYS	\N	75018	PARIS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	KENTISH AGNES	\N	APPT-F1	25865	\N	OUI	TN150 APPT F1	APPARTEMENT	20.26	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t	t	Anomalie non bloquante traite en  1 	t
46	11	\N	\N	\N	0	\N	2021-05-29 00:00:00	0	DUMANT -MAITRE COLOMBE-MARIE ET CLOTILDE	34 RUE DE LA BLANCHERAIE	2 EME PORTE DROITE PORTE 5	49100	ANGERS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	GOURDON BENOIT et NATHALIE	\N	APPT-F3	16996	\N	OUI	TN150 APPT F3	APPARTEMENT	45	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t	t	Anomalie non bloquante traite en  3 	t
53	173	\N	\N	\N	0	\N	2021-05-31 00:00:00	0	GUILLOU DELPHINE	26 IMPASSE JOSEPH GUILLEMOT	RESIDENCE LE STADE II	85000	LA ROCHE SUR YON	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	LECOURSONNAIS JOEL DOMINIQUE	\N	APPT-F2	19989	\N	NON	TN100 APPT F2	APPARTEMENT	38.66	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
54	154	\N	\N	\N	0	\N	2021-05-31 00:00:00	0	VETTORI FRANCK ET SANDRA	159 RUE DU DOCTEUR LAENNEC	\N	85100	LES SABLES D'OLONNE	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	GIRARDEAU LOUIS MARIE	\N	PAV-T5	14532	\N	NON	TN100 PAV T5	PAVILLON	122.52	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
55	470	\N	\N	\N	0	\N	2021-05-31 00:00:00	0	NONO MICHEL ; NONO PIERRETTE	 54 BOULEVARD CHILPERIC	\N	77500	CHELLES	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	MARIEY FRANCOISE	\N	APPT-F4	25567	\N	NON	TN100 APPT F4	APPARTEMENT	86.69	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
57	173	\N	\N	\N	0	\N	2021-05-31 00:00:00	0	GRAYO THAO	26 IMPASSE JOSEPH GUILLEMOT	RESIDENCE LE STADE II	85000	LA ROCHE SUR YON	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Entrant	\N	\N	LECOURSONNAIS JOEL DOMINIQUE	\N	APPT-F2	19989	\N	NON	TN100 APPT F2	APPARTEMENT	38.66	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
61	429	\N	\N	\N	0	\N	2021-05-31 00:00:00	0	PUYJALON jean-Philippe	42 Rue laudinat	Villa rive droite	33130	BEGLES	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	BUT Jean-Christophe	\N	APPT-F2	25886	\N	NON	TN100 APPT F2	APPARTEMENT	43	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
63	490	\N	\N	\N	0	\N	2021-05-31 00:00:00	0	CAPLONG AURORE	49 Rue du Général de Gaulle	Résidence le Jardin aux vignes	33112	SAINT LAURENT MEDOC	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Entrant	\N	\N	DJAHANGUIR DJAMEI	\N	APPT-F3	25887	\N	NON	TN100 APPT F3	APPARTEMENT	60.7	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
65	330	\N	\N	\N	0	\N	2021-05-31 00:00:00	0	GENUYT Adélaïde ; MOREAU Benoît	 12 RUE LAFERRIERE	\N	75009	PARIS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	HUMBERT Delphine	\N	APPT-STU	20243	\N	NON	TN100 APPT STU	APPARTEMENT	33.55	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
67	457	\N	\N	\N	0	\N	2021-05-31 00:00:00	0	SITRUK YAEL	 86 RUE LEPIC	PORTE 8	75018	PARIS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Entrant	\N	\N	SCI JANIEL 	\N	APPT-F1	24075	\N	NON	TN100 APPT F1	APPARTEMENT	16.6	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
71	1	\N	\N	\N	0	\N	2021-05-31 00:00:00	0	BIGEX PASCALE	 10 AVENUE DU GENERAL DE GAULLE	RESIDENCE LE PETIT VERGER	78230	LE PECQ	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	MELARAGNI ANGELO	\N	APPT-F4	25888	\N	NON	TN100 APPT F4	APPARTEMENT	90	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
81	471	\N	\N	\N	0	\N	2021-05-31 00:00:00	0	MELOU et CHEVALLIER Simon et Clémentine	6 RUE DU TREGOR	\N	29000	QUIMPER	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	OUDART LAURENT ET SOPHIE	\N	PAV-T4	24115	\N	NON	TN100 PAV T4	PAVILLON	61.46	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
59	490	\N	\N	\N	0	\N	2021-05-31 00:00:00	0	POUYSEGUR JASON	41 Grand Rue	\N	33250	SAINT JULIEN BEYCHEVELLE	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Entrant	\N	\N	BERGEY Florence	\N	PAV-T3	25884	\N	NON	TN100 PAV T3	PAVILLON	60	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
73	330	\N	\N	\N	0	\N	2021-05-31 00:00:00	0	FIOLET ANTOINE	 136 RUE DU FAUBOURG SAINT MARTIN	\N	75010	PARIS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Entrant	\N	\N	COIRAULT DAVID	\N	APPT-STU	25890	\N	OUI	TN150 APPT STU	APPARTEMENT	30.77	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t	t	Anomalie non bloquante traite en  U 	t
75	461	\N	\N	\N	0	\N	2021-05-31 00:00:00	0	CHARPENTIER  FOUCHER CONSTANTIN  SWANN	9 FRUCTIDOR	\N	44300	NANTES	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	SAS DUNE 	\N	APPT-F3	23901	\N	OUI	TN150 APPT F3	APPARTEMENT	50.75	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t	t	Anomalie non bloquante traite en  3 	t
79	471	\N	\N	\N	0	\N	2021-05-31 00:00:00	0	ALLAIN et GUILLEMOT Quentin et Kylian	12 RUE JULES HENRIOT	2 EME ETAGE DROITE	29000	QUIMPER	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	5832 - FIRMIN  Christine	\N	APPT-F3	24602	\N	OUI	TN150 APPT F3	APPARTEMENT	60.96	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t	t	Anomalie non bloquante traite en  3 	t
77	11	\N	\N	\N	0	\N	2021-05-31 00:00:00	0	CHARBONNOT LUCILE	 436 RUE ST LEONARD	\N	49100	ANGERS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	PLARD GERARD	\N	PAV-T3	5437	\N	NON	TN100 PAV T3	PAVILLON	79	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
69	457	\N	\N	\N	0	\N	2021-05-31 00:00:00	0	GUILLERM NOLWENN	 32 RUE DES VINAIGRIERS	\N	75010	PARIS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	Kergoat  Marc	\N	APPT-F1	23506	\N	OUI	TN150 APPT F1	APPARTEMENT	15.05	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t	t	Anomalie non bloquante traite en  1 	t
60	429	\N	\N	\N	0	\N	2021-05-31 00:00:00	0	FERREIRA ET GRANGER Dimitri et Marion	1 Passage hermitte	Le Clos de la Chartreuse	33000	BORDEAUX	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	BOUEILH Michel	\N	APPT-F2	25885	\N	NON	TN100 APPT F2	APPARTEMENT	51	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
62	490	\N	\N	\N	0	\N	2021-05-31 00:00:00	0	FLOC Valériane	49 Rue du Général de Gaulle	Résidence le Jardin aux vignes	33112	SAINT LAURENT MEDOC	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	DJAHANGUIR DJAMEI	\N	APPT-F3	25887	\N	NON	TN100 APPT F3	APPARTEMENT	60.7	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
64	409	\N	\N	\N	0	\N	2021-05-31 00:00:00	0	GARRO PAUL	7 AVENUE JACQUES HEUCLIN	1 ETAGE 2 PORTE FACE DROITE	77340	PONTAULT COMBAULT	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	PEREIRA 	\N	APPT-F2	23903	\N	NON	TN100 APPT F2	APPARTEMENT	35.36	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
66	330	\N	\N	\N	0	\N	2021-05-31 00:00:00	0	Mme TIEN MI TIE et M GRIMAUD AUDREY et STEPHANE	22  RUE DU GENERAL LECLERC	\N	92130	ISSY LES MOULINEAUX	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	MONVALLIER LATOUR HERVE	\N	APPT-F4	23783	\N	NON	TN100 APPT F4	APPARTEMENT	96.87	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
72	456	\N	\N	\N	0	\N	2021-05-31 00:00:00	0	CAILLOL COLINE	 75 RUE DU CHEVALERET	BAT A	75013	PARIS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Entrant	\N	\N	FLETCHER BEATRICE	\N	APPT-F1	25889	\N	NON	TN100 APPT F1	APPARTEMENT	23	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
74	11	\N	\N	\N	0	\N	2021-05-31 00:00:00	0	BARBARIN Gaétane	3 DES CHARMES	\N	49370	LE LOUROUX BECONNAIS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Entrant	\N	\N	DYVRANDE PATRICK ET MARTINE	\N	PAV-T4	5867	\N	NON	TN100 PAV T4	PAVILLON	91.12	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
76	11	\N	\N	\N	0	\N	2021-05-31 00:00:00	0	BARBEAU FLAMENT NATHAN ET BLANCHE	8  RUE VOLTAIRE	porte gauche 	49100	ANGERS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Entrant	\N	\N	MARY BENOIT ET VIOLETTE	\N	\N	3885	\N	NON	TN100	APPT	52	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
78	11	\N	\N	\N	0	\N	2021-05-31 00:00:00	0	COTTON ELODIE	22 PLACE GEORGES CLEMENCEAU	\N	49320	BRISSAC QUINCE	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	CHAROT FREDERIC ET ELODIE	\N	APPT-F3	13259	\N	NON	TN100 APPT F3	APPARTEMENT	76.36	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
82	471	\N	\N	\N	0	\N	2021-05-31 00:00:00	0	DAHIM PENTEL YASMINA  FREDERIC	6 RUE DU TREGOR	\N	29000	QUIMPER	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Entrant	\N	\N	OUDART LAURENT ET SOPHIE	\N	PAV-T4	24115	\N	NON	TN100 PAV T4	PAVILLON	61.46	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
58	490	\N	\N	\N	0	\N	2021-05-31 00:00:00	0	POUYSEGUR JORDAN	41 Grand Rue	\N	33250	SAINT JULIEN BEYCHEVELLE	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	BERGEY Florence	\N	PAV-T3	25884	\N	NON	TN100 PAV T3	PAVILLON	60	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
68	481	\N	\N	\N	0	\N	2021-05-31 00:00:00	0	SERRE YAN ; POUILLARD IMRAN	 48 RUE SARRETE	\N	75014	PARIS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	ARTIN BASSAM 	\N	APPT-F1	24380	\N	OUI	TN150 APPT F1	APPARTEMENT	35	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t	t	Anomalie non bloquante traite en  1 	t
70	330	\N	\N	\N	0	\N	2021-05-31 00:00:00	0	GOULARD TRISTAN	 18 RUE CADET	\N	75009	PARIS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	GILLETTE FAIVRE AUDE	\N	APPT-F2	25212	\N	OUI	TN150 APPT F2	APPARTEMENT	31.84	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t	t	Anomalie non bloquante traite en  2 	t
80	471	\N	\N	\N	0	\N	2021-05-31 00:00:00	0	CASANO Annaelle	3 DE L'ILE AUX MOINES 	\N	29000	QUIMPER	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	Sortant	\N	\N	4444 - LE GUEN Yoann et Catherine	\N	APPT-F2	24600	\N	OUI	TN150 APPT F2	APPARTEMENT	31.52	\N	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t	t	Anomalie non bloquante traite en  2 	t
\.


--
-- Data for Name: Negotiateur_History; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Negotiateur_History" (id, negotiateur_id, adresse, etat_client, cp, ville, pays, abonnement, date, visibility) FROM stdin;
\.


--
-- Data for Name: Tarif_base; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Tarif_base" (id, pav_appartement, "Type", surface, "Prix_EDL", visibility) FROM stdin;
2	APPT	STD	20	0	t
3	PAV	T2	60	0	t
4	APPT	F1	30	15	t
5	PAV	T3	70	25	t
6	APPT	F2	40	20	t
7	PAV	T4	90	25	t
8	APPT	F3	50	20	t
9	PAV	T5	120	25	t
10	APPT	F4	60	25	t
11	PAV	T6	150	35	t
12	APPT	F5	80	25	t
13	PAV	T7	200	35	t
14	APPT	F6	90	30	t
15	PAV	T8	250	35	t
1	PAV	T1	0	0	t
\.


--
-- Data for Name: Tarifs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Tarifs" (id, reference_client, edl_prix_std, edl_appt_prix_f1, edl_appt_prix_f2, edl_appt_prix_f3, edl_appt_prix_f4, edl_appt_prix_f5, edl_appt_prix_f6, edl_pav_villa_prix_t1, edl_pav_villa_prix_t2, edl_pav_villa_prix_t3, edl_pav_villa_prix_t4, edl_pav_villa_prix_t5, edl_pav_villa_prix_t6, edl_pav_villa_prix_t7, edl_pav_villa_prix_t8, chif_appt_prix_stu, chif_appt_prix_f1, chif_appt_prix_f2, chif_appt_prix_f3, chif_appt_prix_f4, chif_appt_prix_f5, chif_appt_prix_f6, chif_pav_villa_prix_t1, chif_pav_villa_prix_t2, chif_pav_villa_prix_t3, chif_pav_villa_prix_t4, chif_pav_villa_prix_t5, chif_pav_villa_prix_t6, chif_pav_villa_prix_t7, chif_pav_villa_prix_t8, code_tva, taux_meuble, referent_as_client, com_as_sur_ca_client, cell_dev_ref_responsable, com_cell_dev_ref_responsable, cell_dev_ref_agent, com_cell_dev_ref_agent, cell_tech_ref_agent, "com_cell_tech_Ref_agent", cell_tech_ref_responsable, com_cell_tech_ref_responsable, cell_tech_ref_suiveur, com_cell_tech_ref_suiveur, cell_planif_ref_responsable, com_cell_planif_ref_responsable, cell_planif_ref_suiveur, com_cell_planif_ref_suiveur, cell_planif_ref_agent_saisie, com_cell_planif_ref_agent_saisie, prix_autre, commentaire_libre, date, visibility) FROM stdin;
11	11	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	6	0.15	6	0.01	9	0.04	3	0.01	5	0.01	9	0.03	4	0.01	12	0.02	12	0.02	nan	\N	2021-06-21 07:58:55.888616	t
10	10	0	112	112	0	112	112	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:58:55.055094	t
1	1	85	85	85	85	85	85	85	150	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	6	0.04	3	0.01	5	0.01	6	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 07:58:47.672322	t
4	4	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:58:50.025975	t
18	18	0	99	99	99	170	170	170	0	180	180	200	200	220	220	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:06.20771	t
2	2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:58:48.543822	t
7	7	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:58:52.283681	t
8	8	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:58:53.244132	t
6	6	0	95	133	133	160	160	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:58:51.478146	t
13	13	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:58:57.733564	t
3	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:58:49.358355	t
12	12	0	95	140	140	160	160	0	0	170	170	190	190	210	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:58:56.820086	t
5	5	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:58:50.786538	t
9	9	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:58:54.05367	t
14	14	0	105	120	145	160	170	195	0	180	197	214	240	257	283	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Pour 1 entrant & 1 sortant en même temps, facturation : 1EDL=TN150+1EDL=TS000	\N	2021-06-21 07:58:58.921879	t
15	15	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:01.470423	t
16	16	0	100	100	100	100	100	100	0	130	130	130	130	130	130	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:04.102915	t
17	17	0	95	140	140	160	160	160	0	170	170	190	190	210	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	36	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	240	\N	2021-06-21 07:59:05.321217	t
23	23	0	80	90	90	100	100	0	0	115	115	130	130	145	145	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:10.112475	t
29	29	0	85	90	0	100	0	0	0	120	120	140	140	160	160	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:14.496968	t
28	28	0	85	85	85	85	85	0	0	0	110	110	110	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:13.769379	t
21	21	0	90	120	120	150	150	150	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	200	\N	2021-06-21 07:59:08.69029	t
26	26	85	85	85	90	90	100	100	0	130	140	150	160	180	190	200	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	0	0.01	6	0.04	3	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Mise à jour sur tarif 2017 prix par typologie logement sur récap facture	\N	2021-06-21 07:59:12.204281	t
33	33	0	125	140	170	190	200	230	0	210	230	250	280	300	330	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:17.590194	t
22	22	0	110	110	110	110	110	0	0	150	150	150	150	150	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.3	0	nan	0	nan	0	nan	0	nan	0	nan	67	nan	0	nan	0	nan	nan	\N	2021-06-21 07:59:09.449852	t
19	19	0	90	90	90	90	90	0	0	110	110	110	110	110	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:07.276098	t
27	27	0	0	0	0	120	120	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:12.984829	t
25	25	0	125	140	170	190	200	230	0	210	230	250	280	300	330	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	0	0.01	6	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:11.579634	t
31	31	0	85	100	100	115	115	0	0	117	117	130	130	145	145	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:16.052075	t
20	20	0	90	90	90	90	90	0	0	110	110	110	110	110	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:08.101627	t
24	24	0	85	85	85	85	85	85	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	30	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	tarif renégocier sur pack à partir 01/01/2015 VOIR XD	\N	2021-06-21 07:59:10.731124	t
30	30	0	85	100	100	115	115	0	0	115	115	130	130	145	145	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:15.326489	t
32	32	0	70	80	80	90	90	0	0	100	100	110	110	120	120	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:16.729685	t
34	34	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:18.259808	t
35	35	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:19.081339	t
36	36	0	85	95	95	105	105	0	0	110	110	130	130	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:19.670002	t
46	46	0	90	90	90	90	90	0	0	115	115	115	115	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:26.961829	t
48	48	0	75	97	97	120	120	0	0	112	112	135	135	157	157	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:28.640867	t
44	44	0	71	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.3	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	nan	\N	2021-06-21 07:59:25.440698	t
39	39	0	85	90	90	100	100	0	0	120	120	140	140	160	160	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:21.862746	t
41	41	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	250	\N	2021-06-21 07:59:23.386873	t
51	51	0	85	85	85	85	85	0	0	130	130	130	130	130	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:30.775643	t
43	43	0	110	110	110	110	110	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.3	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	nan	\N	2021-06-21 07:59:24.81006	t
37	37	0	85	95	95	105	105	0	0	110	110	130	130	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:20.366603	t
40	40	0	85	90	90	100	100	0	0	120	120	140	140	160	160	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:22.597326	t
45	45	0	80	90	90	100	100	0	0	120	120	140	140	160	160	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:26.130304	t
50	50	0	107	120	146	163	171	197	0	180	197	214	240	257	283	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	36	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 07:59:29.940122	t
38	38	0	85	90	90	100	100	0	0	120	120	140	140	160	160	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:21.147156	t
42	42	0	80	80	80	80	80	0	0	80	80	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:24.054491	t
47	47	0	90	125	125	135	135	0	0	170	170	190	190	220	220	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	0	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 07:59:27.695412	t
49	49	0	95	95	95	95	95	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:29.212542	t
52	52	0	90	90	90	90	90	0	0	150	150	150	150	150	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	8	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:31.871015	t
53	53	0	90	90	90	90	90	0	0	150	150	150	150	150	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:32.640576	t
54	54	0	80	95	95	110	110	0	0	160	160	160	160	160	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:33.275212	t
69	69	0	85	85	85	85	85	0	0	130	130	130	130	130	130	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:44.40584	t
64	64	0	0	0	0	0	0	0	0	0	0	150	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:40.764923	t
55	55	0	0	0	0	0	0	0	0	0	270	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:34.407563	t
65	65	90	90	95	100	120	135	145	0	120	140	160	180	230	280	315	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.45	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	4	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-21 07:59:41.536483	t
58	58	0	90	90	0	90	90	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:36.53035	t
56	56	0	90	90	90	90	90	0	0	110	110	110	110	110	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:35.071184	t
61	61	0	85	110	110	136	136	0	0	127	127	153	153	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:38.566183	t
62	62	0	0	80	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:39.237798	t
60	60	0	85	85	85	85	85	0	0	120	120	120	120	120	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:37.948536	t
57	57	0	100	140	140	160	160	0	0	170	170	190	190	210	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:35.841742	t
71	71	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	5	0.15	0	0.01	3	0.04	3	0.01	5	0.01	3	0.03	4	0.01	4	0.02	4	0.02	Passage à la facture récap sur nouveau tarif par typologie à partir du 01/03/2017. MAJ par XD	\N	2021-06-21 07:59:46.117858	t
59	59	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:37.145998	t
63	63	0	99	99	99	150	150	0	0	170	170	190	190	210	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	36	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 07:59:40.093308	t
67	67	0	80	80	80	85	85	0	0	100	100	100	100	100	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Abon	\N	2021-06-21 07:59:43.014638	t
66	66	0	85	85	85	85	85	0	0	110	110	110	110	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:42.348017	t
68	68	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	377	\N	2021-06-21 07:59:43.787194	t
70	70	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	5	0.15	5	0.01	3	0.04	3	0.01	5	0.01	3	0.03	4	0.01	4	0.02	4	0.02	Passage à la facture récap sur nouveau tarif par typologie à partir du 01/03/2017. MAJ par XD	\N	2021-06-21 07:59:45.156409	t
72	72	0	99	99	115	160	160	0	0	170	170	190	190	230	230	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	F2 99,00\nF3 115,00	\N	2021-06-21 07:59:46.866431	t
82	82	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	5	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:54.163253	t
86	86	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Même pack que ADRESSE VAL EUOPE, 200 EDL=12*1500	\N	2021-06-21 07:59:57.27747	t
73	73	0	100	120	120	150	150	0	0	150	150	170	170	190	190	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	5	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	nan	\N	2021-06-21 07:59:47.663975	t
79	79	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	5	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:51.82759	t
76	76	0	0	100	100	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:49.788756	t
78	78	0	85	85	85	85	85	0	0	110	110	110	110	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:51.189954	t
74	74	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:48.302609	t
80	80	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	0	0.01	0	0.04	3	0.01	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:52.545179	t
85	85	0	90	90	90	90	90	90	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	7	0.01	12	0.02	12	0.02	Au 01/05/16 - Pack 70 EDL=9600e/an=800e/mois.Début 01/05/2017	\N	2021-06-21 07:59:56.557881	t
77	77	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.26	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:50.387414	t
75	75	0	120	160	200	240	320	360	0	180	210	225	240	300	400	500	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	5	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:49.100152	t
81	81	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:53.351719	t
88	88	0	0	0	0	0	0	0	0	0	80	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:58.601713	t
87	87	0	99	99	99	160	160	0	0	170	170	190	190	230	230	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:57.840148	t
83	83	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	5	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	nan	\N	2021-06-21 07:59:54.982784	t
84	84	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.26	0	nan	0	nan	0	nan	0	nan	0	nan	67	nan	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:55.758343	t
89	89	0	0	100	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:59.27233	t
90	90	0	0	120	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 07:59:59.875985	t
100	100	0	99	99	99	170	170	0	0	180	180	200	200	220	220	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:00:10.578899	t
102	102	0	0	0	0	115	115	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:00:12.872587	t
91	91	0	110	140	140	160	160	0	0	170	170	190	190	210	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:00:00.861419	t
98	98	0	90	90	90	90	90	0	0	150	150	150	150	150	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.26	0	nan	0	nan	0	nan	0	nan	0	nan	67	nan	0	0.02	0	0.02	nan	\N	2021-06-21 08:00:07.90643	t
94	94	0	100	140	140	160	160	0	0	170	170	190	190	210	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:00:04.045642	t
97	97	0	85	85	85	85	85	0	0	110	110	110	110	110	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:00:06.998949	t
92	92	0	100	130	130	150	150	0	0	170	170	190	190	210	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:00:02.128743	t
96	96	0	100	140	140	160	160	0	0	170	170	190	190	210	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:00:05.923567	t
107	107	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:00:19.802622	t
99	99	0	0	0	0	100	100	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:00:08.86888	t
93	93	0	100	140	140	160	160	0	0	170	170	190	190	210	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:00:03.091187	t
95	95	0	0	130	130	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:00:05.026082	t
108	108	80	80	85	90	100	100	100	0	98	118	150	180	190	220	260	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	30	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	Pack pour 200 EDL 12x1500	\N	2021-06-21 08:00:21.029917	t
104	104	0	0	120	120	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:00:15.422128	t
101	101	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	110	\N	2021-06-21 08:00:11.808199	t
105	105	0	125	140	170	190	200	230	0	210	230	250	280	300	350	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:00:17.248082	t
103	103	0	0	0	0	0	0	0	0	0	0	175	175	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:00:14.189833	t
106	106	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:00:18.498366	t
118	118	0	85	85	85	85	85	0	0	110	110	110	110	110	110	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:00:32.221512	t
115	115	0	110	110	110	110	110	0	0	170	170	190	190	210	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	6	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:00:28.584591	t
114	114	0	90	90	90	90	90	90	0	150	150	150	150	150	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	5	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	nan	\N	2021-06-21 08:00:27.631136	t
112	112	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.26	0	nan	6	nan	0	nan	0	nan	0	nan	0	nan	0	0.02	0	0.02	nan	\N	2021-06-21 08:00:25.719236	t
109	109	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Pack 150 EDL  12*875	\N	2021-06-21 08:00:22.662981	t
113	113	0	90	90	0	90	90	0	0	150	150	150	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Pack 50 unités du 01/02/14 au 01/02/15, Tarif annuel 5500€  en 12 factures de 458,33  en HT\nLes meublés comptent 1,5 unité	\N	2021-06-21 08:00:26.671689	t
110	110	0	90	90	90	110	110	0	0	130	130	170	170	190	190	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:00:23.755356	t
116	116	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	5	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	nan	\N	2021-06-21 08:00:29.545041	t
123	123	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.26	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	0.02	0	0.02	nan	\N	2021-06-21 08:00:39.770188	t
120	120	0	120	160	200	240	320	360	0	180	210	225	240	300	400	500	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	5	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:00:35.325734	t
117	117	0	0	120	120	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:00:31.270056	t
111	111	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	4	0.01	12	0.02	12	0.02	nan	\N	2021-06-21 08:00:24.788764	t
119	119	90	92	92	95	110	130	150	0	120	130	150	170	200	250	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	7	0.01	7	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	Tarif découverte les 3 premiers constats 90€/Appt & 130€/PAv	\N	2021-06-21 08:00:33.807601	t
125	125	0	0	120	120	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:00:41.736066	t
121	121	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	0	0.01	0	0.04	3	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:00:37.969219	t
122	122	0	0	0	0	0	0	0	0	185	185	185	185	185	185	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.26	0	nan	0	nan	0	nan	0	nan	0	nan	67	nan	0	0.02	0	0.02	nan	\N	2021-06-21 08:00:38.852713	t
124	124	0	0	120	120	120	120	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:00:40.723647	t
126	126	0	0	85	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:00:42.617558	t
140	140	0	100	100	100	100	100	0	0	100	100	100	100	100	100	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:01:02.312282	t
135	135	90	95	100	105	110	120	130	120	120	140	150	170	200	250	300	30	30	30	30	40	40	\N	40	40	45	50	55	60	70	80	\N	0.5	6	0.15	7	0.01	67	0.04	3	0.01	5	0.01	5	0.03	67	0.01	67	0.02	0	0.02	Tarif  lis à jour au 09/05/2019	\N	2021-06-21 08:00:54.566716	t
127	127	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	5	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	nan	\N	2021-06-21 08:00:43.531037	t
130	130	0	0	0	0	0	0	0	0	150	150	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:00:47.293879	t
138	138	0	105	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:00:59.45792	t
136	136	80	85	85	85	95	100	110	0	98	118	150	150	170	200	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	0	0.01	6	0.04	3	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Mise à jour tarif le 20/03/2017 par XD suite rdv de validation pour le groupe SERGIC	\N	2021-06-21 08:00:55.995897	t
128	128	0	90	90	90	90	90	0	0	0	0	115	115	115	115	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:00:44.760331	t
133	133	0	114	134	154	169	184	204	0	124	144	194	234	264	294	324	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	5	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	17/03/17 Tarif période de test	\N	2021-06-21 08:00:51.463492	t
132	132	0	110	140	140	160	160	0	0	190	190	210	210	230	230	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Meublés +50%	\N	2021-06-21 08:00:50.255183	t
134	134	0	0	0	0	0	0	0	0	100	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:00:53.315433	t
129	129	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	0	0.01	0	0.04	3	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:00:45.994625	t
131	131	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:00:48.456214	t
143	143	0	130	130	130	130	130	130	0	130	130	130	130	130	130	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:01:07.42036	t
137	137	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	0	0.01	6	0.04	3	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Tarif valable pour 10 constats	\N	2021-06-21 08:00:57.640955	t
139	139	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	0	0.01	6	0.04	3	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	PERIODE TEST	\N	2021-06-21 08:01:00.853119	t
141	141	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:01:04.020303	t
142	142	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	PERIODE TEST	\N	2021-06-21 08:01:05.460481	t
160	160	112	120	140	160	175	190	210	0	175	190	210	240	270	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	8	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:01:38.810357	t
151	151	0	90	90	90	90	90	90	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	5	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	nan	\N	2021-06-21 08:01:17.670493	t
147	147	0	90	90	90	90	90	90	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	A partir de 09/2014 Pack de 30 EDL à 120€ l'unité	\N	2021-06-21 08:01:12.426496	t
153	153	85	85	90	100	110	120	130	0	130	150	200	240	270	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	73	0.04	3	0.01	5	0.01	0	0.03	73	0.01	4	0.02	4	0.02	Pack 3 - 60 constats appt vides et meublés prix annuel=6720€ ht, en 12 mois de 01/17 à 12/17 à 560.00€ ht	\N	2021-06-21 08:01:20.548844	t
144	144	83	83	87	95	110	120	130	130	130	150	200	240	270	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	36	0.15	7	0.01	73	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	XD LE 01/11/2017 passage en facture recapt et mise à jour des tarifs suivant formulaire CM / PAKC 400  constats=44800/an, par mois=(3733.33/12)/4=933.33 par agences sur les 4 entités Période= 06/2016 à 05/2017	\N	2021-06-21 08:01:08.737606	t
146	146	0	90	90	90	90	90	90	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:01:11.201195	t
158	158	0	103	123	143	158	173	193	0	111	131	181	221	251	281	311	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	5	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	Facturation récapitulative à partir du 01/03/2107 sur grille tarifaire	\N	2021-06-21 08:01:32.129214	t
148	148	80	80	85	90	100	100	100	0	98	118	150	180	190	220	260	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	22/12/2016 - New Pack 200-33(dépassement 2016)=167 EDL du 01/01/17 au 31/12/17 total 19.500€ ht soit 1.625€ / MOIS\nFacture récap	\N	2021-06-21 08:01:13.972609	t
150	150	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	8	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	A partir du 15/09/2016 facture récapitulative. Le pack précédant cours jusqu'à 10/2016 inclu. Il y donc aura 2 factures en 10/16	\N	2021-06-21 08:01:16.263297	t
149	149	0	119	133	162	181	190	219	0	210	230	250	280	300	330	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	Offre découverte du 01/08 au 30/09 2014	\N	2021-06-21 08:01:15.017017	t
154	154	90	90	100	110	120	135	145	120	120	140	160	180	230	280	315	20	20	25	25	30	30	\N	30	30	30	40	40	50	50	50	\N	0.45	5	0.15	7	0.01	13	0.04	3	0.01	5	0.01	13	0.03	4	0.01	4	0.02	4	0.02	locaux commerciaux sur devis	\N	2021-06-21 08:01:22.882507	t
145	145	0	90	90	90	90	90	90	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	0	0.01	0	0.04	3	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Essai 2 mois au 10/07/14	\N	2021-06-21 08:01:09.770015	t
156	156	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	65	0.28	65	0.0	65	0	65	0.0	65	0	65	0.0	65	0.0	65	0.0	0	0.02	39600€ ht pour 12 mois	\N	2021-06-21 08:01:27.174051	t
152	152	0	125	125	125	125	125	125	0	210	210	210	210	210	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Tarif découverte du 10/09/14 au 10/11/14	\N	2021-06-21 08:01:18.959756	t
157	157	0	0	0	0	0	0	0	0	0	0	150	150	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:01:30.125361	t
155	155	0	110	110	110	110	110	110	0	210	210	210	210	210	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:01:25.144211	t
159	159	0	0	120	120	120	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:01:37.209273	t
175	175	92	100	120	140	155	170	190	155	155	170	190	217	247	277	307	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:02:10.562701	t
166	166	90	90	100	110	120	135	145	120	120	140	160	180	230	280	315	20	20	25	25	30	30	\N	30	30	30	40	40	50	50	50	\N	0.45	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-21 08:01:57.813997	t
163	163	0	125	140	170	190	200	230	0	210	230	250	280	300	330	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	8	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:01:47.277508	t
161	161	0	120	120	120	120	120	120	0	210	210	210	210	210	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Offre d'essai	\N	2021-06-21 08:01:41.727687	t
165	165	0	95	140	140	160	160	180	0	170	170	190	190	210	210	230	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	36	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:01:52.882299	t
169	169	0	90	101	122	137	144	165	0	151	165	180	201	216	237	252	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:02:02.521303	t
172	172	0	90	101	122	137	144	156	0	151	165	180	201	216	237	252	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:02:07.216616	t
167	167	0	85	85	85	85	85	85	0	150	150	150	150	150	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	5	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	Pack 30 EDL tarif 150 € soit 4500€ en 5 mensualités de 900€ 1ère=15/08/2015 Dernière= 15/12/2015	\N	2021-06-21 08:01:58.834416	t
162	162	0	85	85	85	85	85	85	0	150	150	150	150	150	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	0	0.01	0	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	facture récap sur M n-1 à 85 €ht  le coût constat moyen	\N	2021-06-21 08:01:44.68899	t
164	164	0	125	140	170	190	200	230	0	210	230	250	280	300	330	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	8	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:01:49.862028	t
173	173	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	5	0.15	7	0.01	3	0.04	3	0.01	5	0.01	3	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:02:08.449908	t
171	171	0	90	101	122	137	144	165	0	151	165	180	201	216	237	252	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:02:05.983323	t
168	168	0	125	140	170	190	200	230	0	210	230	250	280	300	330	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	36	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:02:01.20106	t
170	170	0	90	101	122	137	144	165	0	151	165	180	201	216	237	252	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	36	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:02:03.920506	t
177	177	0	0	0	0	250	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	36	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:02:12.765437	t
176	176	0	120	160	200	240	320	360	0	180	210	230	250	300	400	500	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	5	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:02:11.709042	t
174	174	0	125	140	170	190	200	230	0	210	230	250	280	300	330	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:02:09.492311	t
178	178	0	0	0	0	141	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:02:14.425487	t
191	191	85	93	113	133	148	163	183	0	98	118	168	208	238	268	298	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	5	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	Factures récap.          Anciennes infos : EDLE=2.00€ ht / m², EDLS=1,50€ ht / m² avec fact. / mois en récap	\N	2021-06-21 08:02:30.615438	t
187	187	0	90	101	122	137	144	165	0	151	165	180	201	216	237	252	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:02:25.52835	t
183	183	0	85	85	85	85	85	85	0	150	150	150	150	150	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.25	0	0.0	0	0	0	0.0	0	0	0	0.0	4	0.01	4	0.02	4	0.02	Pack 18 constats à 136€= 2448€ en 12 mensualités, soit 204€ HT /mois. 1ère mensualité 03/16 à 02/17	\N	2021-06-21 08:02:20.317115	t
179	179	0	119	133	162	181	190	219	0	200	219	238	266	285	314	333	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	0	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:02:15.456898	t
182	182	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:02:18.400215	t
184	184	0	90	101	122	137	144	165	0	151	165	180	201	216	237	252	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Formule 1 fcature récap mensuelle à par du 1er avril 2017 (1ère facture en Mai)	\N	2021-06-21 08:02:21.692327	t
180	180	0	125	140	170	190	200	230	0	210	230	250	280	300	330	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:02:16.430343	t
185	185	0	90	101	122	137	144	165	0	151	165	180	201	216	237	252	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:02:23.154489	t
193	193	0	0	0	0	0	0	0	0	0	0	0	120	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	0	0.01	19	0.04	3	0.01	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:02:32.294475	t
194	194	0	85	85	85	85	85	85	0	150	150	150	150	150	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	0	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	FACT EDLE 2€ /M² pour EDLS 1,50 € / M²	\N	2021-06-21 08:02:33.761636	t
190	190	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	5	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	Tarif Spécial indiqué sur le constat	\N	2021-06-21 08:02:28.103875	t
186	186	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.16	0	0.01	5	0.04	0	nan	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	3€ /m² prix indiqué en TS sur constat	\N	2021-06-21 08:02:24.609874	t
181	181	0	0	0	210	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:02:17.503725	t
188	188	0	0	110	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	8	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:02:26.359874	t
189	189	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	2,00€ par m²	\N	2021-06-21 08:02:27.233372	t
192	192	0	90	90	90	115	166	186	0	150	150	186	226	256	286	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	20	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Facturation : facture récap.   client en facture récap sur interventions réalisé sur le mois et facturé le mois suivant	\N	2021-06-21 08:02:31.484938	t
195	195	0	125	140	170	190	200	230	0	210	230	250	280	300	330	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:02:34.758065	t
198	198	0	85	85	85	85	85	85	0	150	150	150	150	150	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	0	0.01	0	0.04	3	0.01	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	FACT PROPO MGL	\N	2021-06-21 08:02:37.172683	t
206	206	0	0	0	170	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	36	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:02:45.563878	t
200	200	0	0	0	170	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:02:39.336444	t
196	196	0	85	85	85	85	85	85	0	150	150	150	150	150	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	6	0.04	3	0.01	5	0.01	5	0.03	4	0.01	12	0.02	12	0.02	FACT 2 € le m²	\N	2021-06-21 08:02:35.599582	t
205	205	0	0	0	170	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:02:44.546459	t
202	202	85	93	113	133	148	163	183	0	98	118	168	208	238	268	298	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	5	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	Facture Récap           Ancien : EDLE=2.00€ ht / m², EDLS=1,50€ ht / m² avec fact. / mois en récap	\N	2021-06-21 08:02:41.365283	t
199	199	0	105	105	105	105	105	105	0	150	150	150	150	150	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	8	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:02:38.205091	t
197	197	0	85	85	85	85	85	85	0	150	150	150	150	150	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	0	0.01	0	0.04	3	0.01	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	FACT PROPO MGL	\N	2021-06-21 08:02:36.439104	t
203	203	0	125	140	170	190	200	230	0	210	230	250	280	300	330	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	36	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:02:42.730503	t
211	211	0	90	0	0	0	0	0	0	0	0	150	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	0	0.01	19	0.04	3	0.01	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:02:51.952222	t
209	209	80	85	85	90	95	100	110	0	120	130	150	170	240	280	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	Pack 75 constats à 6.750€ht en 12 fact de 562,50€ émises de 09/2016 à 08/2017  / XD mise en place nouveau tarif en facture récap 85 par interventons et 50% meublé	\N	2021-06-21 08:02:49.557592	t
204	204	0	107	120	146	163	171	197	0	180	197	214	240	257	283	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	6	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:02:43.770904	t
201	201	0	125	140	170	190	200	230	0	210	230	250	280	300	330	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:02:40.30189	t
207	207	0	0	0	170	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:02:47.033038	t
208	208	0	90	101	122	137	144	165	0	151	165	180	201	216	237	252	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:02:48.371271	t
212	212	0	90	90	110	110	150	150	0	150	150	150	200	200	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	0	0.01	19	0.04	3	0.01	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:02:53.127548	t
210	210	85	85	85	90	90	150	150	0	150	150	150	200	200	200	200	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	4	0.01	12	0.02	12	0.02	Tarif applicable au 01/05/2017	\N	2021-06-21 08:02:50.9378	t
213	213	0	95	140	140	160	160	180	0	210	230	250	280	300	330	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:02:54.195937	t
224	224	85	85	90	90	95	110	120	0	150	150	150	200	200	250	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	38	0.15	0	0.01	38	0.04	3	0.01	5	0.01	38	0.03	67	0.01	36	0.02	4	0.02	Facture récap	\N	2021-06-21 08:03:08.707627	t
218	218	90	90	90	110	110	130	130	0	120	140	166	200	230	250	287	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Facturation : facture récap	\N	2021-06-21 08:03:00.374399	t
220	220	0	90	90	110	110	150	150	0	150	150	150	200	200	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	4	0.01	12	0.02	12	0.02	Local commercial 3Ps 100€	\N	2021-06-21 08:03:02.512174	t
214	214	0	125	140	170	190	200	230	0	210	230	250	280	300	330	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:02:55.402247	t
217	217	85	85	85	85	85	85	85	150	150	150	150	150	150	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.25	0	0.0	0	0	0	0.0	0	0	0	0.0	67	0.01	7	0.02	0	0.02	nan	\N	2021-06-21 08:02:59.199074	t
226	226	0	125	125	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Tarif en TSxxx	\N	2021-06-21 08:03:10.674504	t
215	215	85	85	85	85	85	85	85	150	150	150	150	150	150	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.25	0	0.0	0	0	0	0.0	0	0	0	0.0	67	0.01	7	0.02	0	0.02	nan	\N	2021-06-21 08:02:56.734484	t
221	221	0	0	165	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Tarif spécial meublé	\N	2021-06-21 08:03:04.537013	t
228	228	90	95	100	114	120	131	143	120	120	135	155	180	230	275	300	30	30	30	30	40	40	\N	45	40	45	50	55	60	70	80	\N	0.45	7	0.15	7	0.01	7	0.04	3	0.01	0	0.01	5	0.03	4	0.01	12	0.02	12	0.02	Facture  récap / MAJORATION MEUBLE  +45% / LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-21 08:03:12.515446	t
223	223	0	0	0	0	0	0	0	0	0	0	200	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.16	0	0.01	6	0.04	0	nan	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:03:07.711197	t
216	216	85	85	85	85	85	85	85	150	150	150	150	150	150	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.25	0	0.0	0	0	0	0.0	0	0	0	0.0	67	0.01	7	0.02	0	0.02	nan	\N	2021-06-21 08:02:57.998761	t
225	225	112	120	140	160	175	190	210	0	130	150	200	240	270	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	XD le 23/06/2017 mise à jour des tarifs suite envoi bordereau de CM	\N	2021-06-21 08:03:09.745033	t
219	219	0	125	140	170	190	200	230	0	210	230	250	280	300	330	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	36	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:03:01.406808	t
222	222	0	0	0	0	0	0	0	0	0	0	150	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.16	0	0.01	6	0.04	0	nan	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:03:06.599835	t
227	227	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	20	20	25	25	30	30	\N	30	30	30	40	40	50	50	50	\N	0.45	7	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	67	0.01	7	0.02	0	0.02	Tarif par mission à compter du 01/05/2017\nNouvelle proposition au tarif national L'ADRESSE en facture récap locaux commerciaux sur devis.	\N	2021-06-21 08:03:11.570988	t
229	229	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	6	0.15	6	0.01	9	0.04	3	0.01	5	0.01	9	0.03	4	0.01	12	0.02	12	0.02	passage au tarif cadre réseau L'Adresse au 01/01/2018	\N	2021-06-21 08:03:13.590831	t
238	238	92	100	120	140	155	170	190	0	107	127	177	217	247	277	307	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:03:22.354015	t
232	232	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:03:16.628292	t
246	246	106	114	134	154	169	184	204	0	124	144	194	234	264	294	324	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	Facture récap	\N	2021-06-21 08:03:31.378846	t
244	244	0	0	0	166	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	36	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:03:28.972226	t
243	243	85	85	90	90	100	110	120	0	100	110	180	190	200	210	220	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.16	0	0.01	6	0.04	0	nan	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Facture en récap	\N	2021-06-21 08:03:27.829879	t
230	230	80	85	85	85	95	100	110	0	98	118	150	150	170	200	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Mise à jour tarif par XD suite rdv avec groupe SERGIC	\N	2021-06-21 08:03:14.648225	t
235	235	80	85	85	85	90	95	100	100	120	120	150	150	150	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	6	0.04	3	0.01	5	0.01	5	0.03	67	0.01	12	0.02	12	0.02	nan	\N	2021-06-21 08:03:19.599592	t
234	234	90	90	105	120	140	170	180	110	115	135	160	180	200	250	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	5	0.15	7	0.01	0	0.04	3	0.01	5	0.01	3	0.03	0	0.01	0	0.02	0	0.02	client en facture récap sur interventions réalisé sur le mois et facturé le mois suivant	\N	2021-06-21 08:03:18.58517	t
233	233	112	120	140	160	175	190	210	0	130	150	200	240	270	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:03:17.706679	t
237	237	90	90	90	110	130	150	170	120	120	140	190	230	260	290	320	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	7	0.01	0	0.04	3	0.01	5	0.01	0	0.03	73	0.01	4	0.02	4	0.02	client en facture récap sur interventions réalisé sur le mois et facturé le mois suivant	\N	2021-06-21 08:03:21.486509	t
231	231	0	0	375	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	36	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:03:15.630864	t
241	241	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	7	0.01	7	0.02	0	0.02	nan	\N	2021-06-21 08:03:25.795043	t
236	236	0	85	93	113	133	148	163	0	98	118	168	208	238	268	298	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	34	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	client en facture récap sur interventions réalisé sur le mois et facturé le mois suivant	\N	2021-06-21 08:03:20.453102	t
239	239	95	103	123	143	158	173	193	0	111	131	181	221	251	281	311	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:03:23.373431	t
240	240	0	0	130	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Facturé en en TS	\N	2021-06-21 08:03:24.921546	t
242	242	0	111	131	151	166	181	201	0	124	144	194	234	264	294	324	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:03:26.846444	t
245	245	0	0	0	165	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.16	0	0.01	7	0.04	0	nan	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:03:30.43439	t
247	247	85	85	85	90	90	110	120	0	116	136	186	226	256	286	316	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	facture récap	\N	2021-06-21 08:03:32.228363	t
261	261	0	0	0	0	0	0	0	0	0	0	0	0	300	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	PRO PARTICULIER	\N	2021-06-21 08:03:46.789026	t
250	250	85	85	85	95	100	110	130	0	130	150	150	180	200	250	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	38	0.04	3	0.01	5	0.01	36	0.03	73	0.01	4	0.02	0	0.02	facture récap	\N	2021-06-21 08:03:35.93024	t
248	248	80	85	85	90	95	100	110	0	100	110	150	150	160	170	180	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	65	0.15	65	0.01	65	0.04	65	0.01	65	0.01	65	0.03	65	0.01	65	0.02	0	0.02	facture récap	\N	2021-06-21 08:03:33.928386	t
257	257	85	93	113	133	148	163	183	0	98	118	168	208	238	268	298	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	6	0.2	6	0.0	6	0	3	0.01	5	0.01	0	0.03	0	0.01	12	0.02	12	0.02	facture récpa	\N	2021-06-21 08:03:43.197084	t
256	256	90	90	90	90	105	120	150	0	100	120	150	170	200	250	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	Facture récap	\N	2021-06-21 08:03:42.272614	t
253	253	85	85	90	90	90	110	120	0	110	130	150	170	200	200	200	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	0	0.01	0	0.04	3	0.01	5	0.01	5	0.03	0	0.01	12	0.02	12	0.02	nan	\N	2021-06-21 08:03:38.865561	t
252	252	85	85	90	90	110	130	150	0	11	120	150	170	200	250	280	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Tarif exceptionnel à 90 Appt & 150 PAV sur 3 prmeirs EDL	\N	2021-06-21 08:03:37.706227	t
249	249	0	0	0	0	0	0	0	0	0	0	0	250	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	TS250	\N	2021-06-21 08:03:34.962798	t
251	251	95	100	120	140	155	170	190	0	107	127	177	217	247	277	307	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Facture récap	\N	2021-06-21 08:03:36.845716	t
254	254	85	90	90	110	110	130	130	0	150	150	150	200	200	200	200	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:03:40.154822	t
260	260	95	95	95	130	150	170	190	0	110	130	180	220	250	280	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	3 1er EDL APPT=90 ht, PAV=120 ht	\N	2021-06-21 08:03:45.837567	t
259	259	99	108	126	144	162	180	225	120	130	150	200	240	270	300	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	Découverte Appt=112.00 ht, PAV=130.00 ht\nOffre promotionnelle TS000 pour cde 5 maisons groupées\nFacture récap ou pas non précisé	\N	2021-06-21 08:03:44.98006	t
258	258	85	85	85	85	95	110	130	0	130	150	150	180	200	250	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	38	0.04	3	0.01	5	0.01	73	0.03	0	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:03:44.131545	t
255	255	85	90	90	90	90	100	110	0	110	125	150	170	200	250	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	En fcature récap	\N	2021-06-21 08:03:41.222211	t
263	263	112	120	140	160	175	190	210	0	130	150	200	240	270	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:03:48.470061	t
262	262	0	0	0	148	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:03:47.585569	t
264	264	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:03:49.284596	t
272	272	90	90	90	95	110	120	130	0	120	130	150	170	240	280	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	3 premiers constats tarif=85.00 HT/APPT, 130.00 HT/PAV ensuite en facture Récap	\N	2021-06-21 08:04:00.334274	t
270	270	0	0	0	0	0	0	0	0	0	0	240	240	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	7	0.01	0	0.04	3	0.01	0	0.01	7	0.03	7	0.01	12	0.02	12	0.02	nan	\N	2021-06-21 08:03:58.381386	t
278	278	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Factures récap	\N	2021-06-21 08:04:05.29143	t
265	265	0	0	0	0	0	0	0	0	0	0	240	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	Particulier Tarif spécial 240.00€ ht	\N	2021-06-21 08:03:50.486906	t
267	267	88	88	90	95	100	115	130	0	120	130	150	170	240	280	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	Facture Récap. Tarif découverte 3 constats : APPT=90€ ht, PAV=130€ ht.	\N	2021-06-21 08:03:53.971916	t
277	277	90	90	90	90	90	150	150	0	130	130	130	170	190	250	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	65	0.16	0	0.01	7	0.04	0	nan	0	0.01	5	0.03	0	0.01	0	0.02	0	0.02	Factures Récap	\N	2021-06-21 08:04:04.582836	t
269	269	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:03:57.512883	t
271	271	80	85	85	90	95	100	110	0	120	130	150	170	240	280	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	50	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	73	0.03	0	0.01	4	0.02	4	0.02	Facture Récap - Tarif découverte 3 EDL à 85.00€ APPT et 130.00€ PAV	\N	2021-06-21 08:03:59.238895	t
266	266	0	0	140	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Particulier Tarif spécial TS140	\N	2021-06-21 08:03:51.396386	t
276	276	85	85	85	85	85	85	85	0	150	150	150	150	150	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	6	0.04	3	0.01	0	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:03.756311	t
274	274	85	85	85	85	85	85	85	0	150	150	150	150	150	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	67	0.04	3	0.01	5	0.01	5	0.03	0	0.01	12	0.02	12	0.02	Facture récap	\N	2021-06-21 08:04:01.994317	t
268	268	0	125	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	7	0.01	36	0.04	0	nan	0	0.01	36	0.03	67	0.01	0	0.02	0	0.02	Tarif en TS125	\N	2021-06-21 08:03:56.698351	t
273	273	90	95	95	100	130	150	180	0	115	135	150	170	200	250	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	3 1er EDL APPT=90.00 ht, PAV=150.00ht	\N	2021-06-21 08:04:01.174792	t
275	275	112	120	140	160	175	190	210	0	130	150	200	240	270	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	8	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:03.122675	t
280	280	120	120	140	160	175	190	210	0	130	150	200	240	270	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	0	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:04:06.883521	t
281	281	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.16	0	0.01	6	0.04	0	nan	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:07.478178	t
279	279	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	Prix 320.00	\N	2021-06-21 08:04:06.015016	t
460	460	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	nan	\N	2021-06-21 08:06:23.779965	t
294	294	83	83	87	95	110	120	130	130	130	150	200	240	270	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	36	0.15	7	0.01	73	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	XD LE 01/11/2017 passage en facture recapt et mise à jour des tarifs suivant formulaire CM / PAKC 400  constats=44800/an, par mois=(3733.33/12)/4=933.33 par agences sur les 4 entités Période= 06/2016 à 05/2019	\N	2021-06-21 08:04:18.582819	t
282	282	80	80	85	90	100	100	100	0	98	118	150	180	190	220	260	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	0	0.03	4	0.01	4	0.02	4	0.02	Facture récap	\N	2021-06-21 08:04:08.316699	t
295	295	110	120	140	160	175	190	210	130	130	150	200	240	270	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	Offre découverte 3 missions APPT=110.00 & VIL=130.00	\N	2021-06-21 08:04:19.403351	t
285	285	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:11.055134	t
293	293	83	83	87	95	110	120	130	130	130	150	200	240	270	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	36	0.15	7	0.01	73	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	XD LE 01/11/2017 passage en facture recapt et mise à jour des tarifs suivant formulaire CM / PAKC 400  constats=44800/an, par mois=(3733.33/12)/4=933.33 par agences sur les 4 entités Période= 06/2016 à 05/2018	\N	2021-06-21 08:04:17.971171	t
292	292	83	83	87	95	110	120	130	130	130	150	200	240	270	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	36	0.15	7	0.01	73	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	XD LE 01/11/2017 passage en facture recapt et mise à jour des tarifs suivant formulaire CM / PAKC 400  constats=44800/an, par mois=(3733.33/12)/4=933.33 par agences sur les 4 entités Période= 06/2016 à 05/2017	\N	2021-06-21 08:04:17.203609	t
283	283	120	120	140	160	175	190	210	0	130	150	200	240	270	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Facture récap	\N	2021-06-21 08:04:09.275148	t
291	291	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	Tarif spécial 600.00€	\N	2021-06-21 08:04:16.202184	t
288	288	0	125	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	36	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	Tarif spécial TS125	\N	2021-06-21 08:04:13.602671	t
287	287	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Tarif L'adresse - Facture récap	\N	2021-06-21 08:04:12.800131	t
289	289	180	180	230	240	260	285	315	0	130	150	200	240	270	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	38	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:14.527145	t
284	284	105	114	133	152	171	190	238	124	143	190	238	285	380	475	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:10.185629	t
286	286	85	90	90	95	100	130	150	120	120	150	150	170	180	230	280	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	67	0.01	12	0.02	12	0.02	nan	\N	2021-06-21 08:04:11.869664	t
290	290	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	Tarifs spéciaux uniquement F2=TS336	\N	2021-06-21 08:04:15.347672	t
296	296	90	90	90	90	90	90	90	150	150	150	150	150	150	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	7	0.01	6	0.04	3	nan	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:20.122941	t
297	297	85	85	90	95	110	120	130	100	120	130	150	180	200	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	0	0.01	0	0.04	3	0.01	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:20.796555	t
310	310	114	114	134	154	169	184	204	124	124	144	194	234	264	294	324	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.25	0	0.0	0	0	0	0.0	5	0	5	0.0	67	0.01	12	0.02	12	0.02	130 LOCAUX COMMERCIAUX	\N	2021-06-21 08:04:30.853795	t
298	298	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	73	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	Tarif L'adresse - Facture récap	\N	2021-06-21 08:04:21.598093	t
308	308	104	112	118	125	131	144	158	135	135	159	184	220	257	305	342	30	30	30	30	40	40	\N	40	40	45	50	55	60	70	80	\N	0.5	8	0.15	7	0.01	38	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:04:29.365646	t
307	307	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.25	7	0.0	0	0	3	0.0	0	0	0	0.0	67	0.01	0	0.02	0	0.02	Tarif Local+bureaux = 280.00€	\N	2021-06-21 08:04:28.683042	t
301	301	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:23.781843	t
299	299	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	6	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:22.202749	t
304	304	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	7	0.01	0	0.04	3	0.01	5	0.01	5	0.03	67	0.01	12	0.02	12	0.02	nan	\N	2021-06-21 08:04:26.327386	t
305	305	85	85	85	95	100	110	120	110	110	133	170	200	230	270	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	53	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:27.171904	t
303	303	100	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	36	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:25.625788	t
300	300	85	85	85	90	100	110	120	108	108	123	150	170	200	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	6	0.15	6	0.01	67	0.04	0	0.01	5	0.01	67	0.03	6	0.01	12	0.02	12	0.02	nan	\N	2021-06-21 08:04:22.963313	t
309	309	0	0	0	0	0	0	0	0	0	140	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.25	0	0.0	0	0	3	0.0	0	0	0	0.0	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:30.102225	t
302	302	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:24.845234	t
306	306	0	0	210	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:27.90848	t
314	314	85	85	90	95	110	120	130	110	110	130	150	180	200	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	53	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:33.97301	t
315	315	90	90	90	90	90	90	90	150	150	150	150	150	150	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	#INVALID OPERATION	0	nan	0	FRANCE	0	nan	0	nan	0	nan	67	nan	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:34.765556	t
311	311	103	103	123	143	158	173	193	111	111	131	181	221	251	281	311	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.25	0	0.0	0	0	0	0.0	5	0	5	0.0	67	0.01	12	0.02	12	0.02	nan	\N	2021-06-21 08:04:31.443459	t
312	312	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	53	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:32.227009	t
313	313	90	95	95	100	100	130	150	110	130	150	170	190	200	250	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	53	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:33.065529	t
316	316	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	#INVALID OPERATION	0	nan	0	MANDIN	0	nan	0	nan	0	nan	67	nan	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:35.340228	t
330	330	85	85	85	85	85	85	85	150	150	150	150	150	150	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	7	0.01	7	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:04:45.735277	t
319	319	85	85	90	95	110	120	150	110	110	130	150	170	170	250	280	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	30	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:04:37.534973	t
317	317	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	53	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:36.15576	t
322	322	85	85	90	95	110	130	150	150	170	180	200	220	250	280	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	6	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:39.812668	t
321	321	110	120	140	160	175	190	210	130	130	150	200	240	270	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	#INVALID OPERATION	0	nan	0	DROUET	0	nan	0	nan	0	nan	0	nan	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:38.977145	t
323	323	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:40.482281	t
318	318	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.25	0	0.0	0	0	0	0.0	0	0	0	0.0	67	0.01	0	0.02	0	0.02	Local bureau 55 m² au tarif de 160.00€	\N	2021-06-21 08:04:36.812385	t
326	326	0	0	0	0	0	0	0	0	0	160	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	7	0.01	0	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:42.491133	t
320	320	80	85	90	95	110	120	130	100	115	150	150	170	190	250	290	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	6	0.04	3	0.01	5	0.01	5	0.03	4	0.01	12	0.02	12	0.02	nan	\N	2021-06-21 08:04:38.353502	t
325	325	0	0	0	0	0	0	0	0	0	0	130	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:41.898471	t
332	332	80	80	85	90	100	100	100	98	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:47.216426	t
324	324	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	7	0.01	0	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	Facture sur tarif en TSxxx, le 1er à 270.00€	\N	2021-06-21 08:04:41.11292	t
329	329	85	85	90	95	110	120	130	100	100	110	150	180	220	250	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	53	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:44.847782	t
327	327	80	80	90	95	110	120	130	110	124	130	150	180	220	250	290	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:43.433592	t
328	328	80	80	90	95	110	120	130	110	110	130	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	53	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:44.212148	t
331	331	80	80	85	90	100	100	100	98	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:46.512832	t
333	333	85	85	90	95	110	120	130	110	120	130	150	180	220	250	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:04:48.019967	t
349	349	90	90	95	100	130	150	180	110	110	120	150	200	230	250	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	6	0.01	6	0.04	3	0.01	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:59.989113	t
334	334	80	80	85	90	100	100	100	98	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:48.645608	t
341	341	90	90	95	110	140	170	200	125	125	140	160	180	200	280	310	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	0	0.01	36	0.03	67	0.01	0	0.02	0	0.02	Locaux commerciaux sur devis	\N	2021-06-21 08:04:54.187438	t
337	337	0	0	0	160	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:50.847351	t
339	339	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	nan	\N	2021-06-21 08:04:52.315507	t
335	335	80	80	85	90	100	100	100	98	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:49.41317	t
344	344	80	85	85	95	110	120	130	100	120	130	150	180	190	230	280	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	6	0.15	6	0.01	6	0.04	3	0.01	5	0.01	5	0.03	67	0.01	12	0.02	12	0.02	nan	\N	2021-06-21 08:04:56.370185	t
343	343	92	100	120	140	155	170	190	155	155	170	190	217	247	277	307	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	7	0.01	7	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	Locaux commerciaux sur devis	\N	2021-06-21 08:04:55.751541	t
342	342	102	111	129	148	166	185	231	120	139	185	231	277	370	462	500	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Locaux commerciaux sur devis	\N	2021-06-21 08:04:54.965989	t
336	336	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	73	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:04:50.169735	t
338	338	105	114	133	152	171	190	238	124	124	143	190	238	285	380	449	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:51.661886	t
350	350	0	0	160	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:05:00.60976	t
340	340	80	85	85	90	95	100	110	0	120	130	150	170	240	280	300	25	25	25	25	30	30	\N	25	25	25	30	30	30	40	40	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	11	0.03	4	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-21 08:04:53.006112	t
348	348	80	80	85	90	100	100	100	98	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.25	0	0.0	0	0	0	0.0	0	0	0	0.0	4	0.01	12	0.02	12	0.02	nan	\N	2021-06-21 08:04:59.255537	t
345	345	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	0	0.01	0	0.04	3	0.01	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:57.118756	t
346	346	0	0	0	180	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	0	0.01	0	0.04	3	0.01	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:04:57.875325	t
347	347	0	0	0	0	0	0	0	0	0	0	240	250	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	0	0.01	0	0.04	3	0.01	0	0.01	7	0.03	7	0.01	12	0.02	12	0.02	nan	\N	2021-06-21 08:04:58.49397	t
351	351	112	120	140	160	175	190	210	175	175	190	210	240	270	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	36	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:05:01.406306	t
352	352	0	0	0	0	0	0	0	0	0	0	0	180	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:05:02.12689	t
355	355	85	85	90	100	110	120	130	100	100	119	150	180	200	230	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	7	0.01	67	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	67	0.02	nan	\N	2021-06-21 08:05:04.253673	t
358	358	85	85	95	100	110	130	150	107	107	130	150	180	200	250	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:05:06.344476	t
353	353	90	90	110	130	150	170	190	120	120	139	185	215	240	275	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	73	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:05:02.796507	t
362	362	85	85	90	95	120	140	160	100	140	150	180	230	280	350	400	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	53	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:05:09.478683	t
357	357	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:05:05.719835	t
359	359	95	100	120	130	150	170	200	120	120	140	160	180	200	250	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	6	0.15	7	0.01	7	0.04	3	0.01	5	0.01	0	0.03	67	0.01	12	0.02	12	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-21 08:05:07.15701	t
354	354	85	85	90	95	110	120	150	110	110	120	150	180	200	230	280	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:05:03.619035	t
361	361	85	85	90	100	110	120	130	120	120	130	150	180	230	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	Tarif découverte 1APPT=85 ou 1 PAV=140	\N	2021-06-21 08:05:08.688133	t
356	356	90	90	95	100	115	130	150	130	130	140	150	180	230	270	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	6	0.04	3	0.01	5	0.01	5	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:05:05.002243	t
360	360	83	83	87	95	110	120	130	130	130	150	200	240	270	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:05:07.940565	t
366	366	90	90	95	95	110	130	150	100	110	150	150	170	190	200	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	53	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:05:12.548924	t
364	364	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.14	0	0.01	0	0.04	3	0.01	5	0.01	0	0.04	67	0.01	67	0.02	0	0.02	nan	\N	2021-06-21 08:05:11.220684	t
363	363	95	95	120	140	160	180	200	130	130	150	190	215	240	275	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	36	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:05:10.083334	t
365	365	95	95	110	130	140	150	160	120	130	140	150	170	190	210	240	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.14	5	0.01	5	0.04	3	0.01	5	0.01	5	0.04	4	0.01	13	0.02	13	0.02	nan	\N	2021-06-21 08:05:11.851325	t
367	367	0	0	140	160	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	5	0.04	3	0.01	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:05:13.332478	t
368	368	0	0	170	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	7	0.01	36	0.04	3	0.01	5	0.01	5	0.03	67	0.01	12	0.02	12	0.02	nan	\N	2021-06-21 08:05:14.088042	t
369	369	90	95	100	110	140	150	180	110	110	130	140	180	220	250	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	7	0.01	9	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:05:14.916568	t
370	370	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	53	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:05:15.68013	t
383	383	110	120	140	160	180	200	250	130	130	150	200	250	300	400	500	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	0	0.01	30	0.04	3	0.01	5	0.01	0	0.03	0	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:05:25.300542	t
375	375	90	90	101	122	137	144	165	151	151	165	180	201	216	237	252	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	36	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:05:19.354028	t
380	380	0	126	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:05:23.082811	t
371	371	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	7	0.01	0	0.04	3	0.01	0	0.01	0	0.03	67	0.01	12	0.02	12	0.02	nan	\N	2021-06-21 08:05:16.286788	t
378	378	83	83	87	95	110	120	130	130	130	150	200	240	270	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	36	0.16	7	0.01	73	0.04	3	0.0	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	Locaux commerciaux sur devis	\N	2021-06-21 08:05:21.604656	t
374	374	83	83	87	95	110	120	130	130	130	150	200	240	270	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	73	0.04	3	0.01	5	0.01	73	0.03	0	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:05:18.587466	t
372	372	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	1	0	0.0	0	0	0	0.0	0	0	0	0.0	0	0.0	0	0.0	0	0.0	nan	\N	2021-06-21 08:05:17.079329	t
382	382	80	80	85	90	100	100	100	98	98	118	150	180	190	220	260	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.16	7	0.01	73	0.04	3	0.0	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-21 08:05:24.430042	t
379	379	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	1	0	0.0	0	0	0	0.0	0	0	0	0.0	0	0.0	0	0.0	0	0.0	nan	\N	2021-06-21 08:05:22.233297	t
381	381	90	90	95	100	115	130	150	130	130	140	150	180	230	270	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	6	0.04	3	0.01	5	0.01	5	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:05:23.727441	t
377	377	85	90	90	100	110	120	130	115	115	130	150	170	200	250	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	0	0.01	0	0.04	0	0.01	0	0.01	9	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:05:20.914052	t
373	373	95	95	120	140	160	180	200	130	130	150	190	215	240	275	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:05:17.726959	t
376	376	0	0	0	160	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:05:20.119508	t
384	384	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:05:25.886204	t
385	385	0	0	120	150	160	0	0	0	120	130	160	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	7	0.01	73	0.04	3	0.01	5	0.01	5	0.03	67	0.01	12	0.02	12	0.02	50% MAJORATION MEUBLE ,LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-21 08:05:26.660764	t
387	387	90	95	100	105	110	130	150	110	110	130	150	180	210	250	280	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	65	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	MAJORATION MEUBLE +50% , LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-21 08:05:28.285831	t
386	386	85	85	90	110	130	150	200	110	120	130	160	180	230	280	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.35	5	0.15	7	0.01	0	0.04	3	0.01	5	0.01	5	0.03	67	0.01	12	0.02	12	0.02	LOCAUX COMMERCIAUX SUR DEVIS, MAJORATION MEUBLES +35%	\N	2021-06-21 08:05:27.512275	t
390	390	85	90	95	100	120	130	150	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	30	30	30	40	40	50	0	0	\N	0.5	8	#INVALID OPERATION	7	0.01	73	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	PAS DE PAVILLON EN GESTION	\N	2021-06-21 08:05:30.508559	t
400	400	85	85	85	85	85	85	85	150	150	150	150	150	150	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	67	0.04	3	0.01	5	0.01	5	0.03	67	0.01	12	0.02	12	0.02	XXX	\N	2021-06-21 08:05:37.926312	t
395	395	0	80	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	6	0.01	67	0.04	3	0.01	5	0.01	5	0.03	67	0.01	67	0.02	0	0.02	2 APPT / POUR 2 et 3 chambres	\N	2021-06-21 08:05:34.315381	t
388	388	85	85	90	95	100	120	150	100	100	110	150	180	200	230	280	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	38	0.15	7	0.01	6	0.04	3	0.01	5	0.01	0	0.03	67	0.01	38	0.02	0	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-21 08:05:29.07938	t
391	391	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	nan	\N	2021-06-21 08:05:31.153192	t
397	397	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	5	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:05:35.684596	t
389	389	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.17	7	0.0	0	0.04	3	0.0	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:05:29.766984	t
398	398	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	6	0.01	6	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:05:36.525119	t
396	396	0	80	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	6	0.01	67	0.04	3	0.01	5	0.01	5	0.03	67	0.01	67	0.02	0	0.02	2 APPT / POUR 2 et 3 chambres	\N	2021-06-21 08:05:35.079942	t
393	393	85	85	95	100	120	130	150	100	100	140	160	190	200	230	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	LOCAL COMMERCIAL SUR DEVIS	\N	2021-06-21 08:05:32.562382	t
394	394	85	85	85	90	95	100	110	120	120	130	150	170	240	280	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	MAJORATION MEUBLE + 35%, LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-21 08:05:33.312952	t
392	392	85	85	90	95	100	110	120	100	100	130	150	180	190	200	230	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	LOCAL COMMERCIAL SUR DEVIS	\N	2021-06-21 08:05:31.762842	t
402	402	0	0	135	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	73	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	Meublé	\N	2021-06-21 08:05:39.396469	t
401	401	95	100	105	114	120	131	143	136	136	160	185	221	258	307	344	30	30	30	30	40	40	\N	40	40	45	50	55	60	70	80	\N	0.45	7	0.15	7	0.01	0	0.04	3	0.01	5	0.01	5	0.03	67	0.01	67	0.02	0	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-21 08:05:38.714859	t
399	399	0	0	85	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:05:37.234708	t
403	403	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.25	7	nan	0	nan	0	nan	5	nan	0	nan	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:05:40.96248	t
404	404	0	0	0	150	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.25	7	nan	0	nan	0	nan	5	nan	0	nan	0	0.01	12	0.02	12	0.02	nan	\N	2021-06-21 08:05:41.704053	t
405	405	0	0	0	0	0	0	0	0	0	0	330	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.25	7	nan	7	nan	0	nan	5	nan	5	nan	0	0.01	0	0.02	0	0.02	XXX	\N	2021-06-21 08:05:42.492603	t
422	422	109	112	115	122	129	136	149	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	50%%	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:05:55.503153	t
408	408	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	-0.84	7	0.01	53	0.04	3	0.01	5	0.01	0	0.03	67	1.0	0	0.02	0	0.02	nan	\N	2021-06-21 08:05:44.789289	t
419	419	80	80	85	90	100	100	100	98	98	118	150	180	190	220	260	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	73	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:05:53.195477	t
413	413	90	90	95	100	120	130	150	107	107	125	150	180	200	250	280	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	6	0.03	4	0.01	4	0.02	4	0.02	Locaux commerciaux sur devis / Meublés majorés de 50%	\N	2021-06-21 08:05:48.416213	t
406	406	95	100	105	110	120	131	143	120	145	145	165	200	236	281	315	30	30	30	30	40	40	\N	40	40	45	50	55	60	70	80	\N	nan	5	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	67	0.01	12	0.02	12	0.02	+35% MAJORATION MEUBLE, LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-21 08:05:43.150228	t
411	411	85	85	90	95	100	110	120	120	120	140	150	180	200	250	280	30	30	30	30	40	40	\N	40	40	45	50	55	60	70	80	\N	0.5	38	0.15	7	0.01	6	0.04	3	0.01	5	0.01	38	0.03	67	0.01	38	0.02	0	0.02	nan	\N	2021-06-21 08:05:46.971041	t
410	410	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	53	0.04	3	0.01	5	0.01	53	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:05:46.310417	t
417	417	0	175	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	tarif pour 1 F1 Meublé 175€	\N	2021-06-21 08:05:51.868234	t
407	407	95	100	110	130	135	150	160	135	135	150	165	180	250	300	350	30	30	30	30	40	40	\N	40	40	45	50	55	60	70	80	\N	0.5	5	0.15	7	0.01	9	0.04	3	0.01	5	0.01	5	0.03	67	0.01	12	0.02	12	0.02	LOCAUX COMMERCIAUX DUR DEVIS	\N	2021-06-21 08:05:43.906793	t
415	415	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	67	0.04	3	0.01	5	0.01	5	0.03	67	0.01	12	0.02	12	0.02	nan	\N	2021-06-21 08:05:50.371095	t
409	409	80	85	90	95	110	120	130	100	115	150	150	170	190	250	290	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	6	0.04	3	0.01	5	0.01	6	0.03	6	0.01	4	0.02	4	0.02	facturation sur abonnement en récap pour prix unique sur intervention de 85 € ht	\N	2021-06-21 08:05:45.525867	t
416	416	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	53	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:05:51.001731	t
414	414	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.16	7	0.01	7	0.04	3	0.0	5	0.01	7	0.03	7	0.01	7	0.02	7	0.02	Parking 150€ . Local bâtiment commerciale  480€ .	\N	2021-06-21 08:05:49.650504	t
412	412	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.3	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	nan	\N	2021-06-21 08:05:47.614675	t
423	423	85	85	90	95	100	110	115	100	120	120	155	180	195	220	240	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	0	0.03	0	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:05:56.277709	t
418	418	90	90	95	100	120	130	150	135	135	150	165	180	200	250	280	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:05:52.556842	t
421	421	90	90	95	100	110	130	150	130	130	150	170	200	245	280	300	25	25	25	35	35	35	\N	35	35	45	45	65	45	65	65	\N	0.45	38	0.15	7	0.01	73	0.04	0	0.01	5	0.01	38	0.03	67	0.01	38	0.02	0	0.02	EDL POUR BOX 25 €	\N	2021-06-21 08:05:54.75958	t
420	420	80	80	85	90	95	100	110	0	120	130	150	170	240	280	300	30	30	30	30	40	40	\N	40	40	45	50	55	60	70	80	\N	0.5	8	0.15	0	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-21 08:05:53.988021	t
439	439	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	nan	7	0.01	53	0.04	0	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:06:07.998	t
424	424	80	83	85	90	95	100	110	100	100	120	150	170	200	230	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.33	8	0.15	7	0.01	4	0.04	3	0.01	5	0.01	4	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:05:56.887361	t
432	432	90	90	95	110	130	150	170	0	110	110	130	150	170	180	190	20	20	20	20	20	20	\N	20	20	20	20	20	20	20	20	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:06:02.70603	t
428	428	90	90	95	100	120	135	145	120	120	140	160	180	230	280	315	20	20	25	25	30	30	\N	30	30	30	40	40	50	50	50	\N	0.45	65	0.15	7	0.01	0	0.04	3	0.01	0	0.01	5	0.03	67	0.01	65	0.02	0	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-21 08:05:59.951607	t
441	441	104	112	118	125	131	144	158	135	135	159	184	220	257	305	342	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	38	0.04	3	0.01	5	0.01	5	0.03	0	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:06:09.503138	t
427	427	95	95	105	110	120	135	145	120	120	140	150	180	230	280	315	20	20	25	25	30	30	\N	30	30	30	40	40	50	50	50	\N	0.45	65	0.15	7	0.01	0	0.04	3	0.01	0	0.01	5	0.03	67	0.01	65	0.02	0	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-21 08:05:59.136073	t
425	425	80	80	85	90	100	100	100	98	98	118	150	180	190	220	260	30	30	30	30	40	40	\N	40	40	45	50	55	60	70	80	\N	0.5	65	0.15	7	0.01	9	0.04	3	0.01	5	0.01	5	0.03	67	0.01	65	0.02	0	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-21 08:05:57.688902	t
437	437	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	nan	7	0.01	53	0.04	0	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:06:06.535837	t
434	434	80	80	85	90	100	100	100	98	98	118	150	180	190	220	260	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	nan	7	0.01	73	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:06:04.245147	t
433	433	80	80	85	90	100	100	100	98	98	118	150	180	190	220	260	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	38	nan	7	0.01	73	0.04	3	0.01	0	0.01	73	0.03	67	0.01	38	0.02	0	0.02	nan	\N	2021-06-21 08:06:03.616508	t
436	436	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	nan	7	0.01	53	0.04	0	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:06:05.806254	t
426	426	82	84	86	92	97	102	112	102	102	123	153	174	204	235	255	20	20	25	25	30	30	\N	40	30	30	40	40	50	50	50	\N	nan	8	0.15	7	0.01	67	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:05:58.45047	t
430	430	85	85	90	110	130	150	200	110	120	130	160	180	230	280	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.35	6	nan	7	0.01	73	0.04	0	0.01	5	0.01	5	0.03	67	0.01	12	0.02	12	0.02	nan	\N	2021-06-21 08:06:01.336813	t
429	429	90	100	110	120	135	150	130	130	150	165	200	240	290	330	20	20	25	25	30	30	30	\N	30	30	40	40	50	50	50	0	\N	0.45	8	0.15	7	0.01	73	0.04	3	0.01	5	0.01	0	0.03	0	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:06:00.59224	t
431	431	85	85	90	105	115	130	145	135	135	150	165	180	200	250	280	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	73	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:06:02.088383	t
435	435	85	85	85	90	100	110	120	120	120	130	160	180	190	220	280	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	0	nan	7	0.01	73	0.04	0	0.01	5	0.01	5	0.03	67	0.01	67	0.02	0	0.02	nan	\N	2021-06-21 08:06:05.072681	t
438	438	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	nan	7	0.01	53	0.04	0	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:06:07.354368	t
440	440	0	0	140	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	nan	7	0.01	36	0.04	3	0.01	0	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-21 08:06:08.690605	t
445	445	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	nan	\N	2021-06-21 08:06:12.725294	t
457	457	80	80	85	90	100	110	120	120	120	130	150	170	180	190	200	15	15	15	20	20	25	\N	30	30	40	40	5	50	50	50	\N	0.5	6	0.15	7	0.01	7	0.04	3	0.01	5	0.01	11	0.03	6	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:06:21.498271	t
442	442	85	85	90	110	130	150	200	120	120	130	160	180	230	280	350	20	20	25	25	30	30	\N	40	30	30	40	40	50	50	50	\N	0.35	6	0.15	7	0.01	0	0.04	3	0.01	5	0.01	5	0.03	0	0.01	12	0.02	12	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-21 08:06:10.695456	t
454	454	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	4	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:06:19.409468	t
450	450	90	95	100	110	120	135	145	120	120	140	160	180	230	280	315	20	20	25	25	30	30	\N	30	30	30	40	40	50	50	50	\N	0.41	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	4	0.03	4	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-21 08:06:16.537111	t
453	453	90	90	100	100	100	120	130	120	120	140	160	180	230	280	315	20	20	25	25	30	30	\N	30	30	40	40	40	50	50	50	\N	0.45	7	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	7	0.01	12	0.02	0	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-21 08:06:18.695879	t
446	446	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	nan	\N	2021-06-21 08:06:13.468867	t
443	443	85	85	90	95	110	120	150	110	110	130	150	170	170	250	280	20	20	25	25	30	30	\N	30	30	30	40	40	50	50	50	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-21 08:06:11.47901	t
455	455	0	0	0	240	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	7	0.01	12	0.02	12	0.02	nan	\N	2021-06-21 08:06:20.024116	t
452	452	0	0	0	0	0	0	0	0	0	0	240	240	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	7	0.01	12	0.02	12	0.02	nan	\N	2021-06-21 08:06:17.953303	t
451	451	0	0	0	0	0	0	0	0	0	0	0	0	290	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	7	0.01	12	0.02	12	0.02	nan	\N	2021-06-21 08:06:17.346648	t
444	444	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	nan	\N	2021-06-21 08:06:12.035688	t
448	448	85	85	90	95	100	120	130	120	120	140	150	170	200	230	250	20	20	25	25	30	30	\N	30	30	30	40	40	50	50	50	\N	0.4	7	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	7	0.01	12	0.02	12	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-21 08:06:15.170893	t
447	447	80	80	85	90	95	100	110	120	120	130	150	170	240	280	300	20	20	25	25	30	30	\N	30	30	30	40	40	50	50	50	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-21 08:06:14.093509	t
449	449	85	85	85	90	100	110	120	120	120	130	160	180	190	220	280	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	6	0.15	7	0.01	0	0.04	3	0.01	5	0.01	5	0.03	0	0.01	12	0.02	12	0.02	nan	\N	2021-06-21 08:06:15.823519	t
458	458	80	80	85	90	100	110	120	120	120	130	150	170	180	190	200	20	20	25	25	30	30	\N	30	30	40	40	40	50	50	50	\N	0.5	6	0.15	6	0.01	73	0.04	3	0.01	5	0.01	73	0.03	6	0.01	12	0.02	12	0.02	nan	\N	2021-06-21 08:06:22.170886	t
456	456	80	80	85	90	100	110	120	120	120	130	150	170	180	190	200	15	15	15	20	20	25	\N	30	30	40	40	5	50	50	50	\N	nan	6	0.15	7	0.01	7	0.04	3	0.01	5	0.01	11	0.03	6	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:06:20.833652	t
459	459	110	120	140	160	180	200	250	150	150	180	250	280	350	450	480	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	4	0.04	3	0.01	5	0.01	4	0.03	6	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-21 08:06:23.060377	t
461	461	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	6	0.15	6	0.01	9	0.04	3	0.01	5	0.01	9	0.03	4	0.01	12	0.02	12	0.02	nan	\N	2021-06-21 08:06:24.563515	t
471	471	80	80	85	90	110	120	130	120	120	130	150	180	190	220	250	15	15	20	20	25	25	\N	25	25	25	35	35	35	45	45	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	6	0.03	4	0.01	12	0.02	12	0.02	client en lissage de facturation au prix moyen de _80 € APPT et 110 € PAV\nle client à prix et validé l'option de comparatif edle/edls	\N	2021-06-21 08:06:31.815364	t
464	464	80	80	90	95	110	120	130	100	100	130	150	170	180	200	250	25	25	25	25	30	30	\N	20	20	20	25	25	25	35	35	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	85	0.03	6	0.01	12	0.02	12	0.02	nan	\N	2021-06-21 08:06:26.928162	t
469	469	0	0	0	0	0	0	0	0	0	100	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	7	0.01	73	0.04	3	0.01	5	0.01	73	0.03	4	0.01	12	0.02	12	0.02	nan	\N	2021-06-21 08:06:30.473135	t
462	462	85	85	90	95	110	120	130	120	120	140	150	180	230	250	290	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.41	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	4	0.03	6	0.01	4	0.02	12	0.02	nan	\N	2021-06-21 08:06:25.331079	t
466	466	85	85	90	95	110	120	130	100	100	130	150	170	180	200	250	25	25	25	25	30	30	\N	20	20	20	25	25	25	35	35	\N	0.5	6	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	4	0.01	12	0.02	12	0.02	nan	\N	2021-06-21 08:06:28.361341	t
473	473	0	0	90	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	6	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:06:33.317503	t
463	463	110	120	140	160	180	200	250	150	150	180	250	280	350	450	480	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	4	0.04	3	0.01	5	0.01	4	0.03	6	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:06:26.104632	t
475	475	0	0	0	0	0	0	0	0	0	0	220	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	4	0.03	4	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-21 08:06:34.857622	t
465	465	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	4	0.03	6	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:06:27.620765	t
474	474	0	0	180	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	4	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:06:34.035092	t
470	470	80	80	85	90	100	100	100	98	98	118	150	180	190	220	250	25	25	25	25	30	30	\N	30	30	30	30	30	30	40	40	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	4	0.01	4	0.02	12	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-21 08:06:31.152744	t
468	468	80	80	85	90	90	100	100	98	100	120	150	180	190	220	250	20	20	20	20	20	25	\N	20	20	20	20	25	25	35	35	\N	0.45	8	0.15	7	0.01	73	0.04	3	0.01	5	0.01	3	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:06:29.686581	t
472	472	85	85	90	95	110	120	135	120	120	130	150	180	230	280	315	25	25	25	25	30	30	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	14	0.04	3	0.01	5	0.01	14	0.03	4	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-21 08:06:32.626899	t
467	467	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	nan	\N	2021-06-21 08:06:29.10092	t
477	477	90	90	95	100	110	120	135	120	120	130	150	180	230	280	315	25	25	25	25	30	30	\N	25	25	25	30	30	30	40	40	\N	0.5	0	0.15	7	0.01	7	0.04	3	0.01	5	0.01	3	0.03	4	0.01	0	0.02	12	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-21 08:06:36.367764	t
476	476	85	85	90	95	120	130	145	120	120	130	150	180	230	280	315	25	25	25	25	30	30	\N	25	25	25	30	30	30	40	40	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	4	0.03	4	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-21 08:06:35.555225	t
478	478	0	0	0	0	0	0	0	0	0	0	300	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	7	0.01	0	0.02	12	0.02	nan	\N	2021-06-21 08:06:37.041371	t
479	479	0	0	0	0	0	230	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	6	0.03	0	0.01	0	0.02	12	0.02	nan	\N	2021-06-21 08:06:37.888886	t
484	484	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	7	0.15	6	0.01	7	0.04	3	0.01	5	0.01	7	0.03	4	0.01	12	0.02	12	0.02	nan	\N	2021-06-21 08:06:41.720694	t
495	495	0	0	0	0	0	0	0	0	0	0	0	240	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	7	0.01	5	0.04	3	0.01	5	0.01	0	0.03	4	0.01	13	0.02	13	0.02	nan	\N	2021-06-21 08:06:49.396302	t
491	491	0	0	0	90	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	7	0.01	6	0.04	3	0.01	5	0.01	0	0.03	4	0.01	12	0.02	12	0.02	nan	\N	2021-06-21 08:06:46.678856	t
480	480	80	85	90	95	110	120	130	100	115	150	150	170	190	250	290	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	6	0.15	7	0.01	6	0.04	3	0.01	5	0.01	5	0.03	4	0.01	13	0.02	13	0.02	nan	\N	2021-06-21 08:06:38.675439	t
487	487	0	0	0	144	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	4	0.04	3	0.01	5	0.01	4	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:06:43.865464	t
481	481	80	85	85	90	95	100	110	0	120	130	150	170	240	280	300	25	25	25	25	30	30	\N	25	25	25	30	30	30	40	40	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	11	0.03	4	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-21 08:06:39.284089	t
483	483	0	0	0	0	0	0	0	0	0	0	150	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	nan	6	0.01	6	0.04	3	0.01	5	0.01	6	0.03	4	0.01	0	0.02	12	0.02	nan	\N	2021-06-21 08:06:40.986112	t
490	490	90	90	95	100	110	120	135	120	125	140	160	180	230	280	320	25	25	25	25	30	30	\N	25	25	25	30	30	30	40	40	\N	0.5	4	0.15	7	0.01	7	0.04	3	0.01	5	0.01	4	0.03	4	0.01	4	0.02	12	0.02	FDC SUR DEVIS	\N	2021-06-21 08:06:45.944274	t
492	492	0	0	0	0	0	375	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	0	0.03	4	0.01	4	0.02	12	0.02	nan	\N	2021-06-21 08:06:47.2995	t
489	489	125	125	135	145	155	165	175	150	155	180	200	250	280	300	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	7	0.15	7	0.01	7	0.04	3	0.01	5	0.01	0	0.03	4	0.01	4	0.02	12	0.02	nan	\N	2021-06-21 08:06:45.213693	t
482	482	0	0	0	0	0	0	0	0	0	0	0	260	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	4	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:06:40.234545	t
488	488	0	0	140	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	7	0.01	7	0.04	3	0.01	5	0.01	6	0.03	4	0.01	12	0.02	12	0.02	nan	\N	2021-06-21 08:06:44.649016	t
485	485	0	0	0	0	235	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	11	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:06:42.545221	t
486	486	0	0	135	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	11	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-21 08:06:43.153871	t
496	496	0	0	200	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	0	0.03	4	0.01	13	0.02	13	0.02	nan	\N	2021-06-21 08:06:50.183848	t
494	494	0	0	0	0	0	0	0	0	0	0	0	0	250	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	7	0.01	7	0.04	3	0.01	5	0.01	0	0.03	4	0.01	4	0.02	12	0.02	nan	\N	2021-06-21 08:06:48.747668	t
493	493	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	nan	\N	2021-06-21 08:06:48.024083	t
497	497	0	0	0	0	210	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	5	0.04	3	0.01	5	0.01	0	0.03	4	0.01	12	0.02	12	0.02	nan	\N	2021-06-21 08:06:50.80749	t
\.


--
-- Data for Name: facturation_client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.facturation_client (id, n_facture, "Montant_HT", client, "Date_de_creation", "Date_mission", "Date_reglement_client", missions_s, missions_f, "Statut", "Observations_suivi_paiement", "Date_première_relance", "Date_seconde_relance", "Date_mise_en_demeure", valide, visibility) FROM stdin;
\.


--
-- Data for Name: facturation_mission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.facturation_mission (id, ref_mission, fact_mission, visibility) FROM stdin;
\.


--
-- Data for Name: prospect; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prospect (id, reference, "TYPE", societe, enseigne, titre, nom, email, numero, siret, date_creation, visibility) FROM stdin;
1	\N	PROSPECT	AGENCE SOTTET IMMOBILIER	\N	Monsieur	.	nan	nan	nan	2021-06-21 07:58:52.103784	t
2	\N	PROSPECT	ALIZE IMMOBILIER	\N	Monsieur	meglio franck	alizeloft@wanadoo.fr	nan	nan	2021-06-21 07:58:52.973286	t
3	\N	PROSPECT	ORPI LA BRIARDE	\N	Madame	challet monique	labriardegerance@orange.fr	nan	nan	2021-06-21 07:58:52.996272	t
4	\N	PROSPECT	BIEN SUR IMMOBILIER	\N	Monsieur	luu hubert	contact@biensur-immobilier.com	nan	nan	2021-06-21 07:58:53.020261	t
5	\N	PROSPECT	S.G.I.T	\N	Monsieur	gozlan	nan	nan	nan	2021-06-21 07:58:53.043246	t
6	\N	PROSPECT	S.G.I.T	\N	Monsieur	gozlan	nan	nan	nan	2021-06-21 07:58:53.060241	t
7	\N	PROSPECT	AGENTYS	\N	Madame	msika danielle	maisonsalfort@agentys.com	nan	nan	2021-06-21 07:58:53.085222	t
8	\N	PROSPECT	HARTZ IMMO	\N	Madame	hartz magarett	hartz.immo@free.fr	nan	nan	2021-06-21 07:58:53.104213	t
9	\N	PROSPECT	DE VALLIERE	\N	Monsieur	agence de valliere	montvalerien@de-valiere.com	nan	nan	2021-06-21 07:58:53.888762	t
10	\N	PROSPECT	REBY Michel	\N	Monsieur	office locations transactions	oltimmo@aol.com	nan	nan	2021-06-21 07:58:53.904754	t
11	\N	PROSPECT	HULOT	\N	Monsieur	guy hoquet h2immo	suresnes@guyhoquet.com	nan	nan	2021-06-21 07:58:53.926743	t
12	\N	PROSPECT	PARIS BRETAGNE	\N	Monsieur	chauvin philippe	chauvin.contact@wanadoo.fr	nan	nan	2021-06-21 07:58:54.926168	t
13	\N	PROSPECT	AVICA	\N	Monsieur	dries vincent	avica@wanadoo.fr	nan	nan	2021-06-21 07:58:55.724711	t
14	\N	PROSPECT	ELBAZ-BOULAY Malika	\N	Madame	meb gestion	mebgestion@orange.fr	nan	nan	2021-06-21 07:58:55.740704	t
15	\N	PROSPECT	CENTURY 21 ADM GRAND SUD	\N	Madame	cousinard julie	nan	nan	nan	2021-06-21 07:58:56.568232	t
16	\N	PROSPECT	REGARDS IMMOBILIER	\N	Monsieur	touati michael	nan	nan	nan	2021-06-21 07:58:56.585218	t
17	\N	PROSPECT	GERANCE PLUS IMMOBILIER	\N	Monsieur	gorre jean- christophe	nan	nan	nan	2021-06-21 07:58:56.603209	t
18	\N	PROSPECT	GUY HOQUET - REAL IMMOBILIER	\N	Madame	dumon alexandra	nan	nan	nan	2021-06-21 07:58:56.6182	t
19	\N	PROSPECT	CJ IMMOBILIER	\N	Monsieur	andre louis	c.j.immobilier@wanadoo.fr	nan	nan	2021-06-21 07:58:56.63719	t
20	\N	PROSPECT	SOLES IMMO	\N	Monsieur	francoulon henri	soles.immo@wanadoo.fr	nan	nan	2021-06-21 07:58:56.658177	t
21	\N	PROSPECT	AGENCE PRINCIPALE	\N	Mademoiselle	denet	boulogne@agenceprincipale.com	nan	nan	2021-06-21 07:58:57.40175	t
22	\N	PROSPECT	Vieux Versailles Immobilier	\N	Madame	usson sandy	vieuxversailles@wanadoo.fr	nan	nan	2021-06-21 07:58:57.417742	t
23	\N	PROSPECT	LA BOURSE IMMOBILIERE DE L'ILE DE France	\N	Madame	weber marine	bourse.immo78@wanadoo.fr	nan	nan	2021-06-21 07:58:57.432733	t
24	\N	PROSPECT	PARC IMMO 78	\N	Monsieur	le provost nicolas	parcimmo78@gmail.com	nan	nan	2021-06-21 07:58:57.455721	t
25	\N	PROSPECT	ACCORD IMMO	\N	Monsieur	valette	accordimmoboulogne@wanadfoo.fr	nan	nan	2021-06-21 07:58:57.475708	t
26	\N	PROSPECT	AEDES IMMOBILIER	\N	Madame	lannou françoise	flannou@aedes-immo.fr	nan	nan	2021-06-21 07:58:57.498697	t
27	\N	PROSPECT	L'IMMOBILIERE DE BOULOGNE	\N	Monsieur	chaput romain	romainchaput@immobilieredeboulogne.com	nan	nan	2021-06-21 07:58:57.514687	t
28	\N	PROSPECT	AVIS IMMOBILIER	\N	Madame	anger claire	boulogne@avis-immobilier.fr	nan	nan	2021-06-21 07:58:57.535674	t
29	\N	PROSPECT	AVANTAGES IMMOBILIER	\N	Mme & Mr.	boule & fournier sébastien	s.fournier@avantages-immobiler.fr	nan	nan	2021-06-21 07:58:57.557665	t
30	\N	PROSPECT	GUY HOQUET - CABINET FREDELON	\N	Monsieur	bismuth lionel	paris18ouest@guyhoquet.com	153092627	nan	2021-06-21 07:58:57.58065	t
31	\N	PROSPECT	HAP Immobilier	\N	Monsieur	arnaud d'agier de rufosse	contact@hap-immobilier.fr	nan	nan	2021-06-21 07:58:58.560087	t
32	\N	PROSPECT	AGENCE CENTRALE	\N	Monsieur	lemoine j	ag.centrale.blr@orange.fr	nan	nan	2021-06-21 07:58:58.57708	t
33	\N	PROSPECT	LAFORET IMMOBILIER	\N	Monsieur	rolland arnaud	orange@laforet.com	nan	nan	2021-06-21 07:59:01.117626	t
34	109218	PROSPECT	Etude Fauquereau - Simonet	etudefauquereau-simonet	Monsieur	simonet manuel	fauquereau.simonet@notaires.fr	241694725	nan	2021-06-21 07:59:03.6082	t
35	\N	PROSPECT	CENTURY 21	\N	Monsieur	barnier	barnier.orange@century21france.fr	nan	nan	2021-06-21 07:59:05.183298	t
36	\N	PROSPECT	EXECUTIVE RELOCATIONS	\N	Madame	inga le jean	inga.lejan@wanadoo.fr	nan	nan	2021-06-21 07:59:05.989836	t
37	\N	PROSPECT	AGENCE SAINT NICOLAS	\N	Madame	augenie marie-france	amf@fonciere-ac.com	nan	nan	2021-06-21 07:59:06.006826	t
38	\N	PROSPECT	OLIVIER CLEMENT IMMOBILIER	\N	Madame	boutoille blois anny	olivierclement@wanadoo.fr	nan	nan	2021-06-21 07:59:06.035809	t
39	\N	PROSPECT	AGENCE DE L'ILE	\N	Madame	malessard	sabine.immobilier@wanadoo.fr	nan	nan	2021-06-21 07:59:06.062791	t
40	\N	PROSPECT	VAL DE SEINE IMMOBILIER	\N	Madame	morise	vds-immo@orange.fr	nan	nan	2021-06-21 07:59:06.080784	t
41	\N	PROSPECT	CABINET SGP	\N	Monsieur	seraidarian frédéric	cabinetsgp@orange.fr	nan	nan	2021-06-21 07:59:07.025242	t
42	\N	PROSPECT	Agence des Arcades de Buc	\N	Monsieur	blanc stéphane	buc.immobilier@wanadoo.fr	nan	nan	2021-06-21 07:59:07.04523	t
43	\N	PROSPECT	IPS IMMOBILIERE PARIS SUD	\N	Madame	guyomard chantal	immobiliere-paris-sud@wanadoo.fr	nan	nan	2021-06-21 07:59:07.071219	t
44	\N	PROSPECT	GUY HOQUET SARL IMMOFAR	\N	Monsieur	van strate jean-claude	fontenayauxroses@guyhoquet.com	nan	nan	2021-06-21 07:59:07.092203	t
45	\N	PROSPECT	LAFORET CC IMMO	\N	Madame	duval julie	fontenayauxroses@laforet.com	nan	nan	2021-06-21 07:59:07.113191	t
46	\N	PROSPECT	PRIMO	\N	Madame	pan	primovoltaire@agencesprimo.com	nan	nan	2021-06-21 07:59:07.131182	t
47	\N	PROSPECT	ELYSE AVENUE	\N	Monsieur	gasnier marcel	chatenaymalabry@elyseavenue.com	nan	nan	2021-06-21 07:59:07.148171	t
48	\N	PROSPECT	CABINET LATY	\N	Madame	guhur céline	gest1ph1.laty@free.fr	nan	nan	2021-06-21 07:59:07.939717	t
49	\N	PROSPECT	A.M.I.S	\N	Madame	brouat nathalie	nathalie.brouat@mais-gestion.fr	nan	nan	2021-06-21 07:59:07.954709	t
50	\N	PROSPECT	AGENCE DE LA ROSERAIE - ORPI	\N	Madame	barral fabienne	agenceroseraie@orpi.com	nan	nan	2021-06-21 07:59:07.972699	t
51	\N	PROSPECT	LAFORET IMMOBILIER FRANCONVILLE	laforet	Monsieur	lucas olivier	franconville@laforet.com	nan	nan	2021-06-21 07:59:11.430722	t
52	\N	PROSPECT	MONNE DECROIX	\N	Madame	samoros solange	samoros@monne-decroix.fr	nan	nan	2021-06-21 07:59:12.110331	t
53	\N	PROSPECT	INTER CHANGE IMMOBILIER	\N	Monsieur	genest jean-michel	interchangeimmo;@free.fr	557358350	nan	2021-06-21 07:59:12.835915	t
54	\N	PROSPECT	FUTUR TRANSACTIONS	\N	Monsieur	truptil rémy	remy.truptil@futurtransactions.com	556490200	nan	2021-06-21 07:59:12.855906	t
55	\N	PROSPECT	LAFORET IMMOBILIER	\N	Monsieur	olie jérôme	gpi@laforet.com	130327373	nan	2021-06-21 07:59:14.268098	t
56	\N	PROSPECT	CAPPEVILLE IMMOBILIER	\N	Monsieur	ros johann	cappevilleimmo@wanadoo.fr	139314528	nan	2021-06-21 07:59:14.284087	t
57	\N	PROSPECT	STARS IMMOBILIER	\N	Monsieur	cedric	m.f.j@orange.fr	164278282	nan	2021-06-21 07:59:14.300076	t
58	\N	PROSPECT	HABITAT SEVICE	\N	Monsieur	cavalerie	habitat-service@wanadoo.fr	164276767	nan	2021-06-21 07:59:14.322067	t
59	\N	PROSPECT	CLIC IMMOBILIER	\N	Mesdames	benitha et sambourg	clicimmobilier@gmail.com	175898000	nan	2021-06-21 07:59:14.348049	t
60	\N	PROSPECT	ORPI	\N	Madame	labadie maryse	agencei3b@orpi.com	556850403	nan	2021-06-21 07:59:15.191566	t
61	\N	PROSPECT	ERA TREFLE IMMOBILIER	\N	Madame	labarriere caroline	eracarol@orange.fr	556856556	nan	2021-06-21 07:59:17.4003	t
62	\N	PROSPECT	ORPI Cabinet MERI	\N	Monsieur	rinaldi mario	meri@orpi.com	556371212	nan	2021-06-21 07:59:17.41829	t
63	\N	PROSPECT	PRIMO IMMOBILIER	\N	Monsieur	dodille	gestion@agencesprimo.com	nan	nan	2021-06-21 07:59:17.434282	t
64	\N	PROSPECT	GUY HOQUET	\N	Madame	fontaine céline	antony@guyhoquet.com	nan	nan	2021-06-21 07:59:18.095905	t
65	\N	PROSPECT	ORPI	\N	Monsieur	malvaud	antonyimmo@orpi.com	nan	nan	2021-06-21 07:59:18.112896	t
66	\N	PROSPECT	BATIR TRANSACTIONS	\N	Monsieur	pruvot bernard	batir.transactions@orange.fr	160299839	nan	2021-06-21 07:59:18.958409	t
67	\N	PROSPECT	ENVOL GESTION ORPI	\N	Monsieur	de labaca	thierry@envolimmo.fr	556406770	nan	2021-06-21 07:59:20.204696	t
68	\N	PROSPECT	EURO IMMO	\N	Madame	duval	gestion@euroimmo.fr	164170909	nan	2021-06-21 07:59:21.011233	t
69	\N	PROSPECT	LAFORET ALAIN LAMBOUR IMMOBILIER SAS	\N	Monsieur	lambour alain	pontault@laforet.com	160342626	nan	2021-06-21 07:59:23.273938	t
70	\N	PROSPECT	CABINET LATASTE - VION	\N	Madame	glorieux valérie	location@lataste-vion.fr	556914278	nan	2021-06-21 07:59:25.358748	t
71	\N	PROSPECT	Cabinet Chauvel Transaction	\N	Madame	cohade	nan	nan	nan	2021-06-21 07:59:26.782931	t
72	\N	PROSPECT	FUTUR TRANSACTIONS	\N	Madame	bailly sophie	sophie.bailly@futurtransactions.com	556641407	nan	2021-06-21 07:59:26.79892	t
73	\N	PROSPECT	LES TERRAINS D'AQUITAINE	\N	Madame	goichon brigitte	terrainaquitaine@hotmail.com	557873266	nan	2021-06-21 07:59:26.817929	t
74	\N	PROSPECT	FOCH IMMOBILIER	\N	Madame	ballon virginie	chartrons@foch-immobilier.fr	556513120	nan	2021-06-21 07:59:27.508515	t
75	\N	PROSPECT	IMMODIA	\N	Monsieur	peroy franck	immodia@hotmail.fr	556311531	nan	2021-06-21 07:59:27.529505	t
76	\N	PROSPECT	AGENCE SAINT HELENE	\N	Monsieur	dupart denis	dupart.denis@business.fr	556987697	nan	2021-06-21 07:59:29.799203	t
77	\N	PROSPECT	ERA - ELIXIM	\N	Monsieur	auburtin	elixim.patrimoine@orange.fr	556463640	nan	2021-06-21 07:59:30.618732	t
78	\N	PROSPECT	CENTURY21 - TALENT IMMOBILIER	\N	Monsieur	bibes françois	t.i.talence@century21france.fr	557358181	nan	2021-06-21 07:59:30.641723	t
79	\N	PROSPECT	IMMO HUGUERIE	\N	Monsieur	grunel olivier	immo.huguerie@wanadoo.fr	556442539	nan	2021-06-21 07:59:31.692117	t
80	\N	PROSPECT	CARNET DE L'IMMOBILIER	\N	Madame	barbedette	carnetimmo@cegetel.net	556440323	nan	2021-06-21 07:59:31.709109	t
81	\N	PROSPECT	ARGOS IMMOBILIER	\N	Monsieur	sanchez thierry	location-argos@wanadoo.fr	556014545	nan	2021-06-21 07:59:31.729099	t
82	\N	PROSPECT	B2P	\N	Monsieur	plazzi bertrand	bertrand.plazzi@b2pimmobilier.com	557015252	nan	2021-06-21 07:59:32.523642	t
83	\N	PROSPECT	AQUITAINE PROPERTY	\N	Monsieur	duparc	contact@aquitaineproperty.com	556526363	nan	2021-06-21 07:59:33.140289	t
84	\N	PROSPECT	DEGUELT IMMOBILIER	\N	Monsieur	goguel franck	goguel@deguelt.com	130839119	nan	2021-06-21 07:59:33.158279	t
85	\N	PROSPECT	GRISEL IMMOBILIER	\N	Madame	sage corinne	c.sage@grisel.fr	556484821	nan	2021-06-21 07:59:33.951826	t
86	\N	PROSPECT	LAFORET - MARTIN IMMOBILIER	\N	Monsieur	martin florian	boulogne-sud@laforet.com	nan	nan	2021-06-21 07:59:33.966816	t
87	\N	PROSPECT	BSI BOULOGNE SUD	\N	Monsieur	caron	bsi.boulogne@orange.fr	nan	nan	2021-06-21 07:59:34.000799	t
88	\N	PROSPECT	4% MAX	\N	Monsieur	fisnot	quatrepourcentmax@hotmail.fr	nan	nan	2021-06-21 07:59:34.136719	t
89	\N	PROSPECT	COPAC	\N	Monsieur	wilkinson richard	copac-transaction@orange.fr	nan	nan	2021-06-21 07:59:34.160705	t
90	\N	PROSPECT	CENTURY 21 PRESTIMMO CONSEIL	\N	Monsieur	lamballais françois	prestimmo.conseil@century21france.fr	nan	nan	2021-06-21 07:59:34.186691	t
91	\N	PROSPECT	R&B IMMOBILIER	\N	Monsieur	coupe benoît	contact.rbimmobilier@gmail.com	nan	nan	2021-06-21 07:59:34.205681	t
92	\N	PROSPECT	GRECH IMMOBILIER	\N	Monsieur	meutry	mmeutry@ggi-immo.com	nan	nan	2021-06-21 07:59:34.227668	t
93	\N	PROSPECT	CONDOR IMMOBILIER	\N	Monsieur	teboul dan	condorimmobilier@hotmail.fr	nan	nan	2021-06-21 07:59:34.246656	t
94	\N	PROSPECT	AVANTIM AQUITAINE	\N	Monsieur	papelard françois	gsetion@avantim-aquitaine.fr	556330110	nan	2021-06-21 07:59:34.269643	t
95	\N	PROSPECT	BILLON RST	\N	Monsieur	lamani thierry	thlamani@noos.fr	nan	nan	2021-06-21 07:59:37.821614	t
96	\N	PROSPECT	LOGESSIM	\N	Madame	bonis	logessim@gmail.com	248703036	nan	2021-06-21 07:59:40.638	t
97	\N	PROSPECT	SAINT AGNANT IMMOBILIER	\N	Madame	mathieu isabelle	sa12-immobilier@wanadoo.fr	546822976	nan	2021-06-21 07:59:40.651992	t
98	\N	PROSPECT	PONANT IMMOBILIER	\N	Monsieur	buccafurri christel	contact@agence-duponant.fr	546882279	nan	2021-06-21 07:59:42.201103	t
99	\N	PROSPECT	EURO GESTION	\N	Madame	boismorand	euro.gestion@wanadoo.fr	nan	nan	2021-06-21 07:59:42.22309	t
100	\N	PROSPECT	RIVAGE IMMOBILIER	\N	Monsieur	deshayes gilles	rivage-immobilier@orpi.com\nrivages-aytres@orpi.com	546310900	nan	2021-06-21 07:59:42.881711	t
101	\N	PROSPECT	CABINET MADIER	\N	Monsieur	madier jacques	j.madier@cabinetmadier.com	546320059	nan	2021-06-21 07:59:46.668544	t
102	\N	PROSPECT	ERA L.V.I	\N	Messieurs	viale franck & legroux yoan	era.vallet@wanadoo.fr	251717909	nan	2021-06-21 07:59:46.688534	t
103	\N	PROSPECT	CENTURY 21 ACCORT'IMMO	\N	Madame	deregnaucourt evelyne	accortimmo@century21.fr	251377831	nan	2021-06-21 07:59:46.710521	t
104	\N	PROSPECT	LAFONTAINE IMMOBILIER L'ADRESSE	\N	Monsieur	lafontaine mathieu	mathieulafontaine@wanadoo.fr	545354040	nan	2021-06-21 07:59:46.733508	t
105	\N	PROSPECT	MER ET CAMPAGNE	\N	Madame	leleu caroline	caroline@immobilier85.com	251901500	nan	2021-06-21 07:59:48.165688	t
106	\N	PROSPECT	L'ADRESSE IMMOBILIERE OCEANE	\N	Madame	brochard	immobiliere-oceane@wanadoo.fr	251909696	nan	2021-06-21 07:59:48.182677	t
107	\N	PROSPECT	L'EMPIRE IMMOBILIER	\N	Madame	couton géraldine	contact@l'empire-immobilier.fr	228114397	nan	2021-06-21 07:59:48.96423	t
108	\N	PROSPECT	AGENCE DU PHARE	\N	Madame	gauthier françoise	lagenceduphare@gmail.com	228530181	nan	2021-06-21 07:59:54.012342	t
109	\N	PROSPECT	EURLARDOUINIMMOBILIER SUD LOIRE	\N	Monsieur	ardouin michel	loc.agenceardouin@orange.fr	638993984	nan	2021-06-21 07:59:54.031333	t
110	\N	PROSPECT	CABINET PREMUIM CENTRE	\N	Madame	pluvinage marie	gestion@cabinetpremium.fr	546308418	nan	2021-06-21 07:59:54.876844	t
111	\N	PROSPECT	LA COLINIERE IMMOBILIER	\N	Monsieur	viel bertrand	bertrandviel@gmail.com	240689756	nan	2021-06-21 07:59:56.377985	t
112	\N	PROSPECT	THALASSA	sarlthalassaimmobilier	Monsieur	hakoun franck	frannck.thalassa@orange.fr	611302925	nan	2021-06-21 07:59:56.396977	t
113	\N	PROSPECT	BARATTE IMMOBILIER	baratteimmobilier	Madame	richard vanessa	vanessa.baratte@gmail.com	546993542	nan	2021-06-21 08:00:28.417688	t
114	\N	PROSPECT	CABINET IMMOBILIER MERIEAU	cabinetimmobiliermerieau	Monsieur	merieau thierry	tmerieau@wanadoo.fr	251370572	nan	2021-06-21 08:00:40.541747	t
115	\N	PROSPECT	METEO IMMOBILIER	\N	Madame	mourat	latranche@meteoimmo.com	251277548	nan	2021-06-21 08:00:44.567442	t
116	\N	PROSPECT	AGENCE IMMOBILIERE ALIZEO	\N	Monsieur	leguey mathieu	agence@avence-alizeo.com	25243005	nan	2021-06-21 08:00:44.592458	t
117	\N	PROSPECT	CABINET FOUCHE	\N	Monsieur	fouche stéphane	stephane.fouche@cabinet-fouche.fr	nan	nan	2021-06-21 08:00:44.616415	t
118	\N	PROSPECT	CABINET DUBERNAT	cabinetdubernat	Monsieur	dubernat stéphane	cabinet.dubernat@wanadoo.fr	557884426	nan	2021-06-21 08:00:47.124976	t
119	\N	PROSPECT	CABINET BRUN IMMOBILIER	\N	Monsieur	brun françois	fbrun@neuf.fr	546972533	nan	2021-06-21 08:00:50.087282	t
120	\N	PROSPECT	MI MONDESIR IMMOBILIER	\N	Monsieur	beaujouan christophe	mondesir.immo@wanadoo.fr	556020236	nan	2021-06-21 08:00:52.994618	t
121	\N	PROSPECT	TAUSSAT IMMOBILIER	\N	Madame	orell catherine	taussat-immobilier@wanadoo.fr	556825704	nan	2021-06-21 08:00:53.045586	t
122	\N	PROSPECT	AXAL IMMOBILIER	\N	Madame	argenti sandrine	axelimmo.sh@gmail.com	556121515	nan	2021-06-21 08:00:53.107551	t
123	\N	PROSPECT	CABINET BEDIN	\N	Monsieur	michelet	nan	557225040	nan	2021-06-21 08:00:54.328851	t
124	\N	PROSPECT	ERA TOURAINE IMMOBILIER	\N	Monsieur	briand vincent	saintcyrvb@erafrance.com	nan	nan	2021-06-21 08:00:59.19507	t
125	\N	PROSPECT	CLEMENCEAU IMMOBILIER	85immolarochesuryon	Monsieur	algudo thierry	talgodo@huitcinq.com	251478780	nan	2021-06-21 08:01:24.618513	t
126	\N	PROSPECT	MIRAMAR	miramar	Monsieur	billaud	agence@miramar-immobilier.com	nan	nan	2021-06-21 08:01:43.992392	t
127	\N	PROSPECT	L'ADRESSE SAS AGENCE DE L'OCEAN	\N	Monsieur	adrian eric	ladresse.longeville@ladresse.com	0251903592	nan	2021-06-21 08:01:47.074625	t
128	\N	PROSPECT	SQUARE HABITAT ATLANTIQUE VENDEE	squarehabitatatlantiquevendee	Monsieur	louineau tony	tony.luoineau@squarehabitat.fr	0251595187	nan	2021-06-21 08:01:52.681415	t
129	\N	PROSPECT	BELVIA IMMOBILIER	belviaimmobilier	Monsieur	frouin laurent	laurent.frouin@belvia.fr	nan	nan	2021-06-21 08:01:56.832933	t
130	\N	PROSPECT	ATP IMMOBILIER	\N	Madame	recoquillon servane	atpimmobilier@wanadoo.fr	0251464720	nan	2021-06-21 08:02:09.310417	t
131	\N	PROSPECT	AGENCE ALIZES	\N	Madame	baniel marie	contact@agencealizes.com	0251953656	nan	2021-06-21 08:02:09.330406	t
139	110710	PROSPECT	CHANOT ROBQUIN MEAUX SAS	agencechanot	Monsieur	robquin thierry	thierryrobquin@chanotrobquin.fr	0160251616	nan	2021-06-21 08:02:37.997214	t
132	110450	PROSPECT	MGL - IMMOBILIERE DE ROYAN	mgl-laforetimmobilierederoyan	Madame	asselin aline	royan@laforet.com	0546061443	47772963600019	2021-06-21 08:02:11.459187	t
133	\N	PROSPECT	nan	isoinvest	Monsieur	azoulay fabrice	isoinvest@orange.fr	0785170929	nan	2021-06-21 08:02:12.589538	t
134	110420	PROSPECT	IMONET SASU	imonet	Monsieur	gautheret quentin (gerant) sebaoun vanessa (respsb. ag)	contact@imonet.fr	0164440682	53229059000027	2021-06-21 08:02:15.204041	t
135	\N	PROSPECT	CENTURY 21 AGENCE DU MARCHE	century21agencedumarche	Madame	bronnec estelle	ag403@century21france.fr	0546411951	nan	2021-06-21 08:02:29.138281	t
140	\N	PROSPECT	CIL ATLANTIQUE	cilatlantique	Madame	salle céline	c.salle@cilatlantique.com	0251369191	nan	2021-06-21 08:02:42.516623	t
136	110420	PROSPECT	ORPI CABINET GAUDUCHON	orpicabinetgauduchon	Monsieur	gauduchon mickael	cabinetgauduchon@orpi.com	0546412291	nan	2021-06-21 08:02:29.227231	t
137	\N	PROSPECT	AGENCE DE L'ESTACADE	l'adresse-labarredemonts	Monsieur	pelloquin nicolas	npelloquin@ladresse.com	0251685276	nan	2021-06-21 08:02:36.282196	t
138	\N	PROSPECT	AGENCE DURET	agenceduret	Madame	genaudeau nathalie	n.genaudeau@agence-duret.fr	0251987837	nan	2021-06-21 08:02:36.320171	t
148	\N	PROSPECT	LEBEAU CONCEPT IMMO	societebenoitlebeau	Monsieur	lebeau benoit	fougeres@lebeau-conceptimmo.fr	0299993434	nan	2021-06-21 08:03:14.442343	t
149	\N	PROSPECT	OFFICE NOTARIAL DE FONTENAY LE COMTE	\N	Madame	mathonneau nadine	immobilier.85086@notaires.fr	0251692773	nan	2021-06-21 08:03:15.430777	t
141	120110	PROSPECT	SARL R.LELIEVRE	lelievreimmobilier	Madame	lelievre elisabeth	lelievre.immobilier@wanadoo.fr	0299792939	nan	2021-06-21 08:03:00.091562	t
142	\N	PROSPECT	LAFORET - AaZ IMMOBILIER YONNAIS	laforet-aazimmobilieryonnais	Madame	guillou charlotte	cguillou@laforet.com	0251363878	nan	2021-06-21 08:03:04.183217	t
143	\N	PROSPECT	AGENCE IMMOBILIERE DU STADE	era	Madame	pecado	agencedustadedefrance@orange.fr	01 49 21 00 50	nan	2021-06-21 08:03:08.458774	t
144	\N	PROSPECT	nan	casteimmobilier	Monsieur	de cambourg	nan	02 40 81 13 93	nan	2021-06-21 08:03:08.499748	t
145	\N	PROSPECT	AGENCE ACHARD IMMOBILIER	agenceachardimmobilier	Madame	poirier lydie	lydiepoirier@achards-immobilier.fr	0251482723	nan	2021-06-21 08:03:14.346398	t
146	\N	PROSPECT	nan	differenc'immo	Madame	jallais fabienne	differencimmo44	0240295151	nan	2021-06-21 08:03:14.383381	t
147	\N	PROSPECT	AGENCE ALPHA IMMOBILIER	\N	Monsieur	chusseau bernard	alpha-immobilier@wanadoo.fr	0251960204	nan	2021-06-21 08:03:14.423356	t
150	\N	PROSPECT	OFFICE NOTARIAL	selarlcaractereauthentique	Monsieur	me gautier et mathieu	mgm.notaire@wanadoo.fr	0243079016	nan	2021-06-21 08:03:15.451768	t
151	\N	PROSPECT	nan	votreimmo	Monsieur	le plenier stéphane	stephane@votreimmo.com	0298306543	nan	2021-06-21 08:03:16.399426	t
152	\N	PROSPECT	SARL GUEDON IMMOBILIER	\N	Monsieur	guedon stéphane	guedon.steph@wanadoo.fr	0243531117	nan	2021-06-21 08:03:16.438402	t
153	\N	PROSPECT	SARL NANT'IM VIVRE ICI	\N	Monsieur	hanin christophe	christophehanin@vivreici.com	0240719192	nan	2021-06-21 08:03:16.455396	t
154	122230	PROSPECT	IMMOBILIER KEREBEL	\N	Monsieur	pedel jean-luc	jean-luc@finistereimmobilier.com	0298405262	40977820600022	2021-06-21 08:03:16.480377	t
155	\N	PROSPECT	SARL CABINET BROSSEAU MORIN	\N	Madame	brosseau adeline	abrosseau@brosseaumorin.fr	0240485755	nan	2021-06-21 08:03:18.432258	t
156	\N	PROSPECT	GESTION SANDRINE SOULAC	\N	Madame	soulac sandrine	nan	0299675170	nan	2021-06-21 08:03:20.342168	t
157	\N	PROSPECT	SARL PROACTIVE IMMOBILIER 53	\N	Madame	hubert karine	contact@proactive-immo653.fr	0243569090	nan	2021-06-21 08:03:26.581594	t
158	\N	PROSPECT	SCP TANGUY CATHOU	\N	Madame	lasceve-cathou fouche eric	sylvie.moncelier.35010@notaires.fr	0299674848	nan	2021-06-21 08:03:26.63856	t
159	\N	PROSPECT	CENTURY21 BREST	\N	Madame	couveignes audrey	audrey.couveignes@century21.fr	0298202015	nan	2021-06-21 08:03:26.674545	t
160	\N	PROSPECT	CABIENT BARRIERE	fideprom	Monsieur	\N	nan	0139630609	nan	2021-06-21 08:03:31.184958	t
161	\N	PROSPECT	SARL KERIMO	l'immobilierautrement	Madame	kermarec & nedelec	nan	0298304959	nan	2021-06-21 08:03:31.225934	t
162	\N	PROSPECT	SCP RIOU VETILLARD TOMBECK	\N	Madame	riou nadine	riouetassocies.nego@notaires.fr	0243592100	nan	2021-06-21 08:03:31.263913	t
163	\N	PROSPECT	SCP TETU COLLET ORY ROZEL	\N	Monsieur	tetu olivier	negociation.53004@notaires.fr	0243533850	nan	2021-06-21 08:03:32.141411	t
164	\N	PROSPECT	SARL RC IMMOBILIER	teamouestimmo	Monsieur	cocoual florian	contact@team-ouest.com	0298550001	53522966000019	2021-06-21 08:03:33.11885	t
165	\N	PROSPECT	nan	carnotimmobilier	Madame	duroy nicole	immobilier.carnot@wanadoo.fr	0299945929	nan	2021-06-21 08:03:33.155828	t
166	\N	PROSPECT	SARL SOREDIF Agence du Moulin	agenceorpidumoulin	Monsieur	veillet bruno	agencedumoulin@orpi.com	0546411433	nan	2021-06-21 08:03:35.670388	t
167	\N	PROSPECT	SARL CHAILLOUX IMMOBILIER	\N	Monsieur	chailloux thomas	thomas.chailloux-immobilier.com	0298565060	nan	2021-06-21 08:03:35.718361	t
168	\N	PROSPECT	SARL AGENCE DE L'ODET	\N	Monsieur	bourdais cyril	pleuven@agencedelodet.fr	0298547068	nan	2021-06-21 08:03:35.745348	t
169	120180	PROSPECT	SARL HECK IMMOBILIER	agenceatithomasseimmobilier	Madame	thomasse valérie	thomasse.immobilier@gmail.com	0243280606	nan	2021-06-21 08:03:37.533322	t
170	\N	PROSPECT	nan	bianimmobilier	Madame	bian patricia	contact@bian-immo.fr	nan	nan	2021-06-21 08:03:38.684663	t
171	\N	PROSPECT	SAS ELENA	plaza	Monsieur	talec erwan	quimper@stephaneplazammobilier.com	0298987373	nan	2021-06-21 08:03:38.718644	t
185	\N	PROSPECT	IMMOBILIERE DE LA POSTE	l'adresse-limeilbrevannes-immobilieredelaposte	Monsieur	monsonnec cédric	immobilieredelaposte@ladresse.com	0156321111	nan	2021-06-21 08:04:01.797431	t
172	12255	PROSPECT	BLOIS IMMOBILIER	bloisimmo	Madame	carpentier aurélie	contact@blois-immo.fr	0254740582	nan	2021-06-21 08:03:41.01333	t
173	121020	PROSPECT	SARL LOUDEAC IMMOBILIER	avisimmobilierloudeac	Madame	bertho le dantec brigite	b.bertho@avis-immobilier.com	0296282828	nan	2021-06-21 08:03:45.676662	t
174	\N	PROSPECT	nan	notaire	Madame	jegoux passez sabrina	sabrina.jegoux-passez@notaires.fr	0296280042	nan	2021-06-21 08:03:52.353836	t
175	\N	PROSPECT	nan	notaire	Monsieur	caroff gwenole	gwenole.caroff@notaires.fr	0299712022	nan	2021-06-21 08:03:52.508749	t
176	\N	PROSPECT	LA FRANCAISE IMMOBILIERE	lfi	Monsieur	pigeault jean-pierre	vmontaland@francaiseimmo.fr	0223252030	nan	2021-06-21 08:03:52.711634	t
177	\N	PROSPECT	nan	lemarechal	Monsieur	le marechal laurent	bureau@agencelemarechal.fr	0160141440	nan	2021-06-21 08:03:52.917513	t
178	\N	PROSPECT	RIVAGES IMMOBILIER	orpi	Monsieur	deshayes gilles	rivages-aytre@orpi.com	0546341222	nan	2021-06-21 08:03:53.246327	t
179	\N	PROSPECT	IMMOBILIERE DU GRAND PARIS	\N	Monsieur	varnier guillaume	guillaume.varnier@immogp.com	0147183320	nan	2021-06-21 08:03:56.541439	t
180	\N	PROSPECT	CABINET ACCES IMMO	\N	Monsieur	castel julien	accesimmo.olivier@gmail.com	0650432390	nan	2021-06-21 08:03:56.580417	t
181	\N	PROSPECT	SARL VILMORIN IMMOBILIER	l'adresse-palaiseau	Monsieur	clavet denis & binet guillaume	denis.clavel@ladresse.com	0160138870	nan	2021-06-21 08:03:59.088981	t
186	\N	PROSPECT	IMMOBILIERE DU VILLAGE	l'adresse-creteil	Monsieur	bijaoui eric	eric.bijaoui@ladresse.com	0148985979	nan	2021-06-21 08:04:01.824416	t
182	123640	PROSPECT	SARL Agence des 4 Sergents	agencedesquatressergents	Monsieur	jeanjean gilles & jeanjean guillaume	4sergents@wanadoo.fr	0546505454	nan	2021-06-21 08:04:00.165365	t
183	\N	PROSPECT	AGENCE PIERREVAL	agencepierrval	Madame	margot véronique	nan	0298209042	nan	2021-06-21 08:04:01.028871	t
184	\N	PROSPECT	AGENCE ORPI LIBERTE	orpiliberte	nan	ghafoury palatine	liberte@orpi.com	0223443747	nan	2021-06-21 08:04:01.76745	t
187	\N	PROSPECT	E IMMOBILIERE	l'adressee-immobiliere	Madame	bonan florence	florence.bonan@ladresse.com	0153680215	nan	2021-06-21 08:04:01.853397	t
188	\N	PROSPECT	ORPI COLBERT IMMOBILIER	\N	Monsieur	aqqade karim & horte nathalie	colbertimmobilier@orpi.com	0546877041	nan	2021-06-21 08:04:01.884382	t
189	\N	PROSPECT	SASUE LA LICORNE	lalicorneimmobilier	Monsieur	ringuet eric	eric@lalicorne-immobilier.com	0243085009	nan	2021-06-21 08:04:04.432921	t
190	\N	PROSPECT	SAS ESPACIL CONSTRUCTION	adbespacil	Monsieur	geniteau aantoine	antoine.geniteau@espacil.com	0299673030	nan	2021-06-21 08:04:04.470899	t
191	\N	PROSPECT	SAS JLF PROSPECT	\N	Monsieur	fore jonathan	stephanie.bifolchi@agencedonion.com	0164551212	nan	2021-06-21 08:04:05.177496	t
192	\N	PROSPECT	SAS AGENCE IMMOBILIERE DU CENTRE	\N	Madame	al tinawi maryannick	aicpontivy@orange.fr	0297250770	nan	2021-06-21 08:04:05.878094	t
193	\N	PROSPECT	SARL LOGERIS	\N	Monsieur	marie adrien	logeris@ladresse.com	0169064254	nan	2021-06-21 08:04:05.896087	t
194	\N	PROSPECT	SARL VILLE PLAGE	eraimmobilier	Monsieur	letourmy gilles	ville-plage@erafrance.com	0240173627	nan	2021-06-21 08:04:06.70862	t
195	\N	PROSPECT	SARL CABINETOLLIERIC	\N	Monsieur	ollieric rodolphe	rodolphe.ollieric@cabinet-ollieric.fr	0228496433	nan	2021-06-21 08:04:06.750595	t
196	\N	PROSPECT	SARL UNE ADRESSE	l'adresse-saintnazaire	Monsieur	revranche laurent	laurent.revranche@ladresse.com	0240111414	nan	2021-06-21 08:04:08.168782	t
197	122165	PROSPECT	CABINET FRUCHET	\N	Monsieur	fruchet benjamin	benjamin@chantonnay-immobilier.com	0241368729	nan	2021-06-21 08:04:09.136228	t
198	\N	PROSPECT	CABINET GALVAIN	\N	Monsieur	galvain jean-pierre	contact@cabinet-galvaing.fr	0298332721	nan	2021-06-21 08:04:10.079689	t
199	\N	PROSPECT	CABINET OLIIER	\N	Monsieur	olivier arnaud	Arnaud@cabinet-olivier.com	0240664998	nan	2021-06-21 08:04:12.668206	t
200	\N	PROSPECT	SCP NOTAIRES ASSOCIES	\N	Messieurs	mery xavier & perez arnaud	Xavier.mery@notaires.fr	0240456640	nan	2021-06-21 08:04:19.28342	t
201	\N	PROSPECT	DELON IMMOBILIER REAL ESTATE COMPANY	\N	Monsieur	delon nicolas	secretariat@delonimmobilier.com	01457880020	nan	2021-06-21 08:04:20.011006	t
202	\N	PROSPECT	LECUYER IMMOBILIER	lecuyerimmobilier	Monsieur	lecuyer emmanuel	lecuyer.immoilier@Wanadoo.fr	0240756154	nan	2021-06-21 08:04:23.614939	t
203	122170	PROSPECT	SARL STELA	agencepascal	MADAME	salvator laura	laura.salvatore@mdi77.com	0164306060	48091327600014	2021-06-21 08:04:23.651918	t
204	\N	PROSPECT	SARL LOUMAE	l'adresse-carquefou	Monsieur	genest christophe	christophe.genest@ladresse.com	0240527575	538305830	2021-06-21 08:04:25.484872	t
205	\N	PROSPECT	CABINET CHATEAUBRIAND IMMOBILIER	\N	Madame	brossault elodie	elodiebrossault@cabinetchateaubriand.com	0299396860	44457670600030	2021-06-21 08:04:25.516851	t
206	\N	PROSPECT	Cabinet notarial	\N	Monsieur	lalande alexandre	nan	0257520567	nan	2021-06-21 08:04:27.05997	t
207	\N	PROSPECT	nan	metropolitanimmobilierbrest	Monsieur	mevel eric	metropolitan.immobilier.expert@gmail.com	0256293621	nan	2021-06-21 08:04:27.75657	t
208	\N	PROSPECT	nan	metropolitanimmobilier	Monsieur	postec jean-yves	metropolitan.immobilier.expert@gmail.com	0298097963	nan	2021-06-21 08:04:29.966308	t
209	\N	PROSPECT	ETUDE MAITRE PRIGENT MATTHIEU	\N	Monsieur	prigent matthieu	matthieu.prigent@notaire.fr	0298681681	nan	2021-06-21 08:04:30.003284	t
210	\N	PROSPECT	ABC IMMOBILIER	agencebrestcornouaille(abc)immobilier	Monsieur	guermeur paul	abcimmobilier@abc-immo.eu	0298436080	49460758300015	2021-06-21 08:04:33.784117	t
211	\N	PROSPECT	SARL NERIUS	l'adresse-iledenantes	Monsieur	pottier michaël	iledenantes@ladresse.com	0249622440	nan	2021-06-21 08:04:33.825094	t
212	\N	PROSPECT	nan	orpicornouaille	Monsieur	veillon nicolas	nan	0980347647	822401733	2021-06-21 08:04:37.365067	t
213	\N	PROSPECT	nan	officenotarial	Madame	bernaert grohard laétitia	office.tharon@notaires.fr	0252800023	83492095100011	2021-06-21 08:04:38.228574	t
214	\N	PROSPECT	SARL LNA	lanouvelleagence	MADAME	laurent christine	c.laurent@lna-immo.fr	0297849453	82050356300018	2021-06-21 08:04:39.660756	t
215	\N	PROSPECT	SARL GO NORDOUEST IMMO	arthurimmo	Monsieur	marmagne florent	fmarmagne@arthurimmo.com	0238722020	503587867	2021-06-21 08:04:43.074799	t
216	\N	PROSPECT	BENOIT IMMOBILIER	\N	Madame	leray christine	benoitimmo44@ornage.fr	0228236523	505076984	2021-06-21 08:04:43.111781	t
217	\N	PROSPECT	SARL AGENCE IMMOBILIERE NUEVA	\N	Madame	poiraud peggy	p.poiraud@guyhoquet.com	0251421350	495080384	2021-06-21 08:04:43.129769	t
218	\N	PROSPECT	nan	cabinetkerjeanlannilis	Madame	?? fabienne	lannilis@cabinet-kerjean.fr	0298041414	nan	2021-06-21 08:04:43.150754	t
219	\N	PROSPECT	SARL CYGLA	cabinethabasqueimmobilierlandernaeau	Madame	corre christine	christinegestion@habasque.com	0298213186	nan	2021-06-21 08:04:43.194734	t
220	\N	PROSPECT	SARL FRANK BEULE IMMOBIMIER	agencel'entreprise	Monsieur	bridoux jocelin	Bridoux@entreprise-immo.fr	0298370995	48406460500039	2021-06-21 08:04:43.240706	t
221	\N	PROSPECT	SARL GIRATI	agenceeratouraineimmobilier	Monsieur	girati vincent	tourainegestion@erafrance.com	0234741010	494576473	2021-06-21 08:04:43.279681	t
222	\N	PROSPECT	SARL FABIENNE THIERRY IMMOBILIER	agencefabiennethierryimmobilier	Madame	meder mathilde	Mathilde.meder@fti.immo	nan	51371960900010	2021-06-21 08:04:45.545384	t
223	\N	PROSPECT	SARL GA 1 NY	agencenestenn	Madame	deschaseaux marie-annick	m.deschaseaux@nestenn.com	0240323545	818339459	2021-06-21 08:04:45.583363	t
224	\N	PROSPECT	ADJ GESTION	l'adresse-adjgestion-joinvillelepont	MONSIEUR	pastor syvain	pastor@adjgestion.com	0143787570	60203245000010	2021-06-21 08:04:50.034814	t
225	\N	PROSPECT	GTI AURELIEN RIMBAUD	l'adresse-rochefort	MONSIEUR	rimbaud aurelien	rochefort@ladresse.com	0546990909	80784180400014	2021-06-21 08:04:50.065795	t
226	\N	PROSPECT	SAS BARRAINE PROMOTION	agencebarrainepromotion	Monsieur	rimbert steve	steve.rimbert@barraine.com	0623332960	503520058	2021-06-21 08:04:50.683443	t
227	\N	PROSPECT	SARL BV ABRAYSIE CONSEIL	century21	Monsieur	vinauger bertrand	bertrand.vinauger@century21france.fr	0238211121	439925520	2021-06-21 08:04:50.711426	t
228	\N	PROSPECT	SARL NUANCES HABITAT	\N	Monsieur	bothorel dominique	nuances.habitat@orange.fr	0298020429	50427476200013	2021-06-21 08:04:52.220563	t
229	\N	PROSPECT	SARL LVI IMMOBILIER	eralvi	Monsieur	legroux yoann	lvi@erafrance.com	0251717909	450731252	2021-06-21 08:04:52.237552	t
230	\N	PROSPECT	SARL BLEU HORIZON CABINET IMMOBILEIR	cabinetimmobilierbleuhorizon	Monsieur	gaulard michel	stper@bleu-horizon.pro	0249118080	502367204	2021-06-21 08:04:53.945574	t
231	\N	PROSPECT	SASU AGENCE IMM	agenceimm	Madame	combe coralie	coralie.combe@imm-blois.com	0254701694	51464808800045	2021-06-21 08:04:59.878176	t
232	\N	PROSPECT	OFFICE NOTARIAL	\N	Maitre	nicolas	nan	nan	nan	2021-06-21 08:05:01.979975	t
233	\N	PROSPECT	AGENCE CADEAU	agencecadeau	Monsieur	garcia nicolas	sgarcia.gournayimmobilier@orpi.com	01 49 32 06 06	nan	2021-06-21 08:05:01.995967	t
234	\N	PROSPECT	SA NOTAIRE SERVICE	\N	Maître	mathieu & bethouart	negociation.49062@notaires.fr	0241307660	67672021200015	2021-06-21 08:05:07.74967	t
235	\N	PROSPECT	OFFICE NOTARIAL DELOMEAU THOMAS HOUISGIRARD	\N	Madame	you christelle	office.notarial.reze.location@notaire.fr	0240324500	30127528500015	2021-06-21 08:05:07.765663	t
236	\N	PROSPECT	OFFICE NOTARIAL GROUPE MONASSIER CHOLET	\N	Maître	delorme bernard	pouvreau-toro-Delorme@notaires.fr	0241491416	35187702200035	2021-06-21 08:05:07.78665	t
237	\N	PROSPECT	CREDIT AGRICOLE	creditagricoleimmobilier	nan	appel d'offre national	nan	nan	nan	2021-06-21 08:05:07.805641	t
238	\N	PROSPECT	SARL MB IMMOBILIER	\N	Monsieur	blot pierre-yves	py.blot@mb-immobilier.com \ncontact@mb-immobilier.com​p	0247701001	39835439900014	2021-06-21 08:05:08.553213	t
239	\N	PROSPECT	SARL GSM IMMOBILIER	gsmimmobilier	Monsieur	godeau sébastien	nan	0247731473	47939188000040	2021-06-21 08:05:09.980396	t
242	\N	PROSPECT	SARL HERMELIN	\N	Monsieur	hermelin blanchet nicolas	blanchet134@hotmail.fr	02.38.53.29.33	31428173400025	2021-06-21 08:05:14.732674	t
240	123900	PROSPECT	ALAIN ROUSSEAU IMMOBILIERE COMINE	alainrousseauimmobilierecomine	Monsieur	rousseau guillaume	angers@alain-rousseau.com	02 41 24 13 70	414 709 980 00018	2021-06-21 08:05:11.065772	t
241	\N	PROSPECT	SARL MONTREUIL BELLAY IMMOBILIER	agencebrun	Monsieur & Madame	bemelmans frédéric & delphine	frederic@agencebrun.com	0241524276	45104395400028	2021-06-21 08:05:12.389016	t
243	\N	PROSPECT	SARL G1H	\N	Monsieur	dresh gilles	gerancederocquigny@wanadoo.fr	02.38.53.57 42	44795758000015	2021-06-21 08:05:14.750667	t
244	\N	PROSPECT	SARL MOBIXEL	\N	Monsieur	bourreau jean-christophe	jcbourreau.mobixel@gmail.com	02 41 40 27 00	35336010000047	2021-06-21 08:05:15.52722	t
245	\N	PROSPECT	MONSIEUR TONY BARON	agfenceimmodream	Monsieur	baron tony	tony.baron@immodream.fr	02 38 74 11 31	47826100100059	2021-06-21 08:05:15.542211	t
246	\N	PROSPECT	SARL AMBROISE IMMO	ambroiseimmoguyhoquet	Monsieur	ambroise jouslin de pisseloup de noray	ambroise@guyhoquet.com	02 47 23 02 40	49455750700014	2021-06-21 08:05:20.034556	t
247	\N	PROSPECT	SARL LIGERIA IMMOBILIER	ligeriaimmobilier	Madame	hazlewood samantha	avoine@ligeria.fr	02 47 97 42 73	48389307900028	2021-06-21 08:05:22.923902	t
248	\N	PROSPECT	SARL UNIPERSONNELLE ROSA	agencecentury21rosa	Monsieur	negre romain	Maginot@century21.fr	02 47 37 21 21	82499399200018	2021-06-21 08:05:22.956882	t
249	\N	PROSPECT	MB IMMOBILIER	mbimmobilier	Madame	mottin alexandra	contact@mb-immobilier53.com	20 43 70 34 77	49880354100018	2021-06-21 08:05:23.601514	t
250	\N	PROSPECT	SAS A21	sasa21	Messieurs	taudiere christian et virgile	vtaudiere@laforet.com	0549749173	94240142400017	2021-06-21 08:05:25.096658	t
251	\N	PROSPECT	MAINE ET LOIRE HABITAT	maineetloirehabitat	Messieurs	colobert laurent & ratier benoit	b.ratier@mlhabitat.fr	0241816837	27490003400019	2021-06-21 08:05:25.123641	t
252	\N	PROSPECT	SELARL NOTAIRES ASSOCIES	notairesassociesdupont&migot	Maître	dupont nicolas & migot antoine	etude.migotetassocies@notaires.fr	0241958959	79109214100013	2021-06-21 08:05:25.167618	t
253	\N	PROSPECT	SARL BOURNEIX MENUET IMMOBILIER	l'adresseimmobilierchallans	Monsieur	menuet julien	julien.menuet@ladresse.com	0251933670	52338507800010	2021-06-21 08:05:27.397341	t
254	\N	PROSPECT	SARL JICEBE	brigittesauvagerimmobilier	Madame	sauvager	contact@brigitte-sauvager.com	0240484141	34801270900021	2021-06-21 08:05:28.102938	t
255	\N	PROSPECT	SAS BED AND SCHOOL 2G2L	bedandschool	Société	holding  mme zimnoch aurelie	tours@bedandschool.com	0247601992	50502435600063	2021-06-21 08:05:29.613073	t
256	124180	PROSPECT	FICHIER HABITAT	immobilieredes3rives	Monsieur	jean louis pecheux	immo3rives@orpi.com	0241481100	84172176400014	2021-06-21 08:05:29.648052	t
257	\N	PROSPECT	SARL CHEZLANOU IMMOBILIER	elyseavenue	Monsieur	bismuth denis	paris15@elyseavenue.com	01.56.56.80.30	49350360100012	2021-06-21 08:05:34.139481	t
258	124220	PROSPECT	MME FLEURY	mmefleury	Société	sci kroaz du	sci.kroazdu@gmail.com	nan	833 608 938 00019	2021-06-21 08:05:35.551671	t
259	124230	PROSPECT	KAMET VENTURES	kamet	Monsieur	recoing julien	julien.recoing@kametventures.com	nan	nan	2021-06-21 08:05:36.368204	t
260	124250	PROSPECT	LEGRAND FRANCIS	particulier	Monsieur	legrand francis	valeriedellerie@yahoo.fr	0642653684	nan	2021-06-21 08:05:37.098791	t
261	\N	PROSPECT	SARL CLERIMMO	erarivedroite	Monsieur	boudaud laurent	era.rivedroite@erafrance.com	05 40 12 94 40	752736223	2021-06-21 08:05:43.033293	t
262	\N	PROSPECT	EURL GONORD IMMOBILIER	gonordimmobilier	Madame	gonord jacqueline	gonord-immobilier@orange.fr	0549818542	51387211900013	2021-06-21 08:05:46.822126	t
263	1270218	PROSPECT	CABINET DIARD	cabientdiard	Monsieur	gaudiche jean jacques	nan	nan	379 086 085 00014	2021-06-21 08:06:23.702008	t
\.


--
-- Data for Name: prospect_History; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."prospect_History" (id, prospect, adresse, cp, ville, pays, etat_client, login_extranet, mpd_extranet, date, visibility) FROM stdin;
1	1	29 Bld Victor Hugo	84500	BOLLENE	France	PROSPECT	nan	nan	2021-06-21 07:58:52.16775	t
2	2	59 Bd Massena	75013	PARIS	France	PROSPECT	nan	nan	2021-06-21 07:58:52.990276	t
3	3	7 rue Gabetta	77170	BRIE COMTE ROBERT	France	PROSPECT	nan	nan	2021-06-21 07:58:53.007269	t
4	4	9 Place d'Italie	75013	PARIS	France	PROSPECT	nan	nan	2021-06-21 07:58:53.03625	t
5	5	61 Boulevard des Batignoles	75008	PARIS	France	PROSPECT	nan	nan	2021-06-21 07:58:53.055242	t
6	6	61 Boulevard des Batignoles	75008	PARIS	France	PROSPECT	nan	nan	2021-06-21 07:58:53.075227	t
7	7	44 avenue du Général Leclerc	94700	MAISONS ALFORT	France	PROSPECT	nan	nan	2021-06-21 07:58:53.099216	t
8	8	15 avenue du Général de Gaulle	94700	MAISONS ALFORT	France	PROSPECT	nan	nan	2021-06-21 07:58:53.116208	t
9	9	222 rue Paul Vaillant Couturier	92000	NANTERRE	France	PROSPECT	nan	nan	2021-06-21 07:58:53.898757	t
10	10	5 rue de Verdun	92150	SURESNES	France	PROSPECT	nan	nan	2021-06-21 07:58:53.917748	t
11	11	1Place Henri IV	92150	SURESNE	France	PROSPECT	nan	nan	2021-06-21 07:58:53.937735	t
12	12	82 rue Blanche	75009	PARIS	France	PROSPECT	nan	nan	2021-06-21 07:58:54.938162	t
13	13	4 avenue de Bel Air	75012	PARIS	France	PROSPECT	nan	nan	2021-06-21 07:58:55.734706	t
14	14	90 Cours de Vincennes	75012	PARIS	France	PROSPECT	nan	nan	2021-06-21 07:58:55.750696	t
15	15	nan	nan	nan	France	PROSPECT	nan	nan	2021-06-21 07:58:56.579226	t
16	16	nan	nan	nan	France	PROSPECT	nan	nan	2021-06-21 07:58:56.596212	t
17	17	nan	nan	nan	France	PROSPECT	nan	nan	2021-06-21 07:58:56.612206	t
18	18	nan	nan	nan	France	PROSPECT	nan	nan	2021-06-21 07:58:56.631193	t
19	19	55 Av Edouard Vaillant	92100	BOULOGNE BILLANCOURT	France	PROSPECT	nan	nan	2021-06-21 07:58:56.653181	t
20	20	106 route de la Reine	92100	BOULOGNE BILLANCOURT	France	PROSPECT	nan	nan	2021-06-21 07:58:56.670172	t
21	21	71 route de la Reine	92100	BOULOGNE BILLANCOURT	France	PROSPECT	nan	nan	2021-06-21 07:58:57.410747	t
22	22	16 rue de Satory	78000	VERSAILLES	France	PROSPECT	nan	nan	2021-06-21 07:58:57.425738	t
23	23	19 rue de l'Orangerie	78000	VERSAILLES	France	PROSPECT	nan	nan	2021-06-21 07:58:57.449725	t
24	24	14 rue de Satory	78000	VERSAILLES	France	PROSPECT	nan	nan	2021-06-21 07:58:57.471711	t
25	25	209 Bd Jean-Jaurès	92100	BOULOGNE BILLANCOURT	France	PROSPECT	nan	nan	2021-06-21 07:58:57.486704	t
26	26	223 Bd Jean-Jaurès	92100	BOULOGNE BILLANCOURT	France	PROSPECT	nan	nan	2021-06-21 07:58:57.508692	t
27	27	225 Bd Jean-Jaurès	92100	BOULOGNE BILLANCOURT	France	PROSPECT	nan	nan	2021-06-21 07:58:57.528682	t
28	28	55  av. Pierre Grenier	92100	BOULOGNE BILLANCOURT	France	PROSPECT	nan	nan	2021-06-21 07:58:57.544669	t
29	29	91 av. Pierre Grenier	92100	BOULOGNE BILLANCOURT	France	PROSPECT	nan	nan	2021-06-21 07:58:57.574654	t
30	30	67 rue Caulincourt	75018	PARIS	France	PROSPECT	nan	nan	2021-06-21 07:58:57.59364	t
31	31	35 avenue du Général Leclerc	92300	BOURG LA REINE	France	PROSPECT	nan	nan	2021-06-21 07:58:58.571082	t
32	32	70 Bd Maréchal Joffre	92300	BOURG LA REINE	France	PROSPECT	nan	nan	2021-06-21 07:58:58.589071	t
33	33	9 rue Pourtoules	84100	ORANGE	France	PROSPECT	nan	nan	2021-06-21 07:59:01.163599	t
34	34	1 route de Champigné	49330	CHATEAUNEUF SUR SARTHE	France	['etude', 'fauquereau', '-', 'simonet']	nan	nan	2021-06-21 07:59:03.789094	t
35	35	34 Cours Aristide Briand	84100	ORANGE	France	PROSPECT	nan	nan	2021-06-21 07:59:05.196287	t
36	36	9 rue Thomas Edison	92230	GENNEVILLIERS	France	PROSPECT	nan	nan	2021-06-21 07:59:06.000831	t
37	37	52 rue d'Achères	78600	MAISONS LAFFITTE	France	PROSPECT	nan	nan	2021-06-21 07:59:06.025818	t
38	38	37 rue Jean-Pierre Timbaud	92130	ISSY LES MOULINEAUX	France	PROSPECT	nan	nan	2021-06-21 07:59:06.054819	t
39	39	40 rue Jean-Pierre Timbaud	92130	ISSY LES MOULINEAUX	France	PROSPECT	nan	nan	2021-06-21 07:59:06.072787	t
40	40	38 rue Jean-Pierre Timbaud	92130	ISSY LES MOULINEAUX	France	PROSPECT	nan	nan	2021-06-21 07:59:06.089778	t
41	41	60 Place du Marché	78530	BUC	France	PROSPECT	nan	nan	2021-06-21 07:59:07.039234	t
42	42	60 Place du Marché	78530	BUC	France	PROSPECT	nan	nan	2021-06-21 07:59:07.065218	t
43	43	93 rue Boucicaut	92260	FONTENAY AUX ROSES	France	PROSPECT	nan	nan	2021-06-21 07:59:07.087205	t
44	44	47 rue Boucicaut	92260	FONTENAY AUX ROSES	France	PROSPECT	nan	nan	2021-06-21 07:59:07.103197	t
45	45	50 rue Boucicaut	92260	FONTENAY AUX ROSES	France	PROSPECT	nan	nan	2021-06-21 07:59:07.124186	t
46	46	67 rue Jean Longuet	92290	CHATENAY MALABRY	France	PROSPECT	nan	nan	2021-06-21 07:59:07.142176	t
47	47	13 bis Place de L'Eglise	92290	CHATENAY MALABRY	France	PROSPECT	nan	nan	2021-06-21 07:59:07.158166	t
48	48	30 rue de Normandie	92600	ASNIERES SUR SEINE	France	PROSPECT	nan	nan	2021-06-21 07:59:07.949712	t
49	49	1 rue Bapst	92600	ASNIERES SUR SEINE	France	PROSPECT	nan	nan	2021-06-21 07:59:07.965706	t
50	50	3 Avenue Aristide Briand	92249	L'HAY LES ROSES	France	PROSPECT	nan	nan	2021-06-21 07:59:07.995686	t
51	51	106 rue de Général Leclerc	95130	FRANCONVILLE	France	['laforet']	nan	nan	2021-06-21 07:59:11.450708	t
52	52	78 Chemin des Sept Deniers	31204	TOULOUSE	France	PROSPECT	nan	nan	2021-06-21 07:59:12.121325	t
53	53	82 rue de Moulineau	33170	GRADIGNAN	France	PROSPECT	nan	nan	2021-06-21 07:59:12.849907	t
54	54	511 Route de Toulouse	33140	VILLENAVE D'ORNON	France	PROSPECT	nan	nan	2021-06-21 07:59:12.866898	t
55	55	8 Mail des Cerclades	95000	CERGY	France	PROSPECT	nan	nan	2021-06-21 07:59:14.278091	t
56	56	27 rue du Général de Gaulle	95220	HERBLAY	France	PROSPECT	nan	nan	2021-06-21 07:59:14.294079	t
57	57	125 avenue Egéne Varlin	77270	VILLEPARISIS	France	PROSPECT	nan	nan	2021-06-21 07:59:14.316066	t
58	58	9 Place du Marché	77270	VILLEPARISIS	France	PROSPECT	nan	nan	2021-06-21 07:59:14.337056	t
59	59	1Place Pasteur	77120	COULOMMIERS	France	PROSPECT	nan	nan	2021-06-21 07:59:14.360042	t
60	60	5 Court Victor Hugo	33130	BEGLE	France	PROSPECT	nan	nan	2021-06-21 07:59:15.205563	t
61	61	32 Cours Victor Hugo	33130	BEGLES	France	PROSPECT	nan	nan	2021-06-21 07:59:17.412294	t
62	62	479 Route de Toulouse	33140	VILLENAVE D'ORNON	France	PROSPECT	nan	nan	2021-06-21 07:59:17.429287	t
63	63	20 avenue de la Division Leclerc	92160	ANTONY	France	PROSPECT	nan	nan	2021-06-21 07:59:17.453273	t
64	64	23 avenue Aristide Briand	92160	ANTONY	France	PROSPECT	nan	nan	2021-06-21 07:59:18.104898	t
65	65	11bis avenue Division Leclerc	92160	ANTONY	France	PROSPECT	nan	nan	2021-06-21 07:59:18.124886	t
66	66	23/25 avenue de la République	77340	PONTAULT COMBAULT	France	PROSPECT	nan	nan	2021-06-21 07:59:18.971408	t
67	67	127 avenue René Cassagne	33151	CENON	France	PROSPECT	nan	nan	2021-06-21 07:59:20.254671	t
68	68	19 Bd Robert Thiboust	77700	SERRIS	France	PROSPECT	nan	nan	2021-06-21 07:59:21.022231	t
69	69	9 bis avenue de la République	77340	PONTAULT COMBAULT	France	PROSPECT	nan	nan	2021-06-21 07:59:23.282934	t
70	70	9 Place de la Victoire	33000	BORDEAUX	France	PROSPECT	nan	nan	2021-06-21 07:59:25.368739	t
71	71	36 rue Jules Gesde	63100	CLERMONT FERRAND	France	PROSPECT	nan	nan	2021-06-21 07:59:26.793923	t
72	72	28 Cours Gambetta	33850	LEOGNAN	France	PROSPECT	nan	nan	2021-06-21 07:59:26.810915	t
73	73	95 rue Notre Dame	33000	BORDEAUX	France	PROSPECT	nan	nan	2021-06-21 07:59:26.831902	t
74	74	30 Cours Portal	33000	BORDEAUX	France	PROSPECT	nan	nan	2021-06-21 07:59:27.524505	t
75	75	60 Cours de la Somme	33800	BORDEAUX	France	PROSPECT	nan	nan	2021-06-21 07:59:27.553492	t
76	76	221 rue Georges Bonnac	33000	BORDEAUX	France	PROSPECT	nan	nan	2021-06-21 07:59:29.811197	t
77	77	34 avenue Pasteur	33600	PESSAC	France	PROSPECT	nan	nan	2021-06-21 07:59:30.629731	t
78	78	76 Cours Gambetta	33400	TALENCE	France	PROSPECT	nan	nan	2021-06-21 07:59:30.653717	t
79	79	38 rue Huguerie	33000	BORDEAUX	France	PROSPECT	nan	nan	2021-06-21 07:59:31.702114	t
80	80	26 rue Fondaudege	33000	BORDEAUX	France	PROSPECT	nan	nan	2021-06-21 07:59:31.718103	t
81	81	36 rue Fondaudege	33000	BORDEAUX	France	PROSPECT	nan	nan	2021-06-21 07:59:31.745091	t
82	82	31 Allées de Tourny	33000	BORDEAUX	France	PROSPECT	nan	nan	2021-06-21 07:59:32.532637	t
83	83	53 rue Fondaudege	33000	BORDEAUX	France	PROSPECT	nan	nan	2021-06-21 07:59:33.151284	t
84	84	24 rue de Montreuil	78000	VERSAILLES	France	PROSPECT	nan	nan	2021-06-21 07:59:33.168279	t
85	85	19 Cours de L'Intendance	33064	BORDEAUX	France	PROSPECT	nan	nan	2021-06-21 07:59:33.961819	t
86	86	26 avenue du Gal Leclerc	92100	BOULOGNE BILLANCOURT	France	PROSPECT	nan	nan	2021-06-21 07:59:33.983809	t
87	87	46-48 avenue du Gal Leclerc	92100	BOULOGNE BILLANCOURT	France	PROSPECT	nan	nan	2021-06-21 07:59:34.117731	t
88	88	54-56 avenue du Gal Leclerc	92100	BOULOGNE BILLANCOURT	France	PROSPECT	nan	nan	2021-06-21 07:59:34.149712	t
89	89	55 rue de la Saussière	92100	BOULOGNE BILLANCOURT	France	PROSPECT	nan	nan	2021-06-21 07:59:34.169703	t
90	90	5 avenue Gal Leclerc	92100	BOULOGNE BILLANCOURT	France	PROSPECT	nan	nan	2021-06-21 07:59:34.199685	t
91	91	209 Bd Jean-Jaurès	92100	BOULOGNE BILLANCOURT	France	PROSPECT	nan	nan	2021-06-21 07:59:34.219677	t
92	92	46 Bd Jean-Jaurès	92100	BOULOGNE BILLANCOURT	France	PROSPECT	nan	nan	2021-06-21 07:59:34.24066	t
93	93	112 rue de Paris	92100	BOULOGNE BILLANCOURT	France	PROSPECT	nan	nan	2021-06-21 07:59:34.264648	t
94	94	75 77 Allée Jean Giono	33100	BORDEAUX	France	PROSPECT	nan	nan	2021-06-21 07:59:34.283635	t
95	95	120 avenue Charles de Gaule	92200	NEUILLY SUR SEINE	France	PROSPECT	nan	nan	2021-06-21 07:59:37.833603	t
96	96	20 avenue d'Orléans	18000	BOURGES	France	PROSPECT	nan	nan	2021-06-21 07:59:40.646991	t
97	97	70 avenue Charles de Gaulle	17620	SAINT AGANT	France	PROSPECT	nan	nan	2021-06-21 07:59:40.666983	t
98	98	9 Place du Ponant	17260	ECHILLAIS	France	PROSPECT	nan	nan	2021-06-21 07:59:42.215093	t
99	99	5 Quai de la République	17100	SAINTES	France	PROSPECT	nan	nan	2021-06-21 07:59:42.235083	t
100	100	41 rue de la Scierie	17031	LA ROCHELLE CEDEX	France	PROSPECT	nan	nan	2021-06-21 07:59:42.893705	t
101	101	47 rue Gambetta	17412	SAITN JEAN ANGELY	France	PROSPECT	nan	nan	2021-06-21 07:59:46.680541	t
102	102	60 rue des Forges	44330	VALLET	France	PROSPECT	nan	nan	2021-06-21 07:59:46.704525	t
103	103	28 ure Raymond Poincaré	85000	LA ROCHE SUR YON	France	PROSPECT	nan	nan	2021-06-21 07:59:46.726511	t
104	104	4 rue Neuve des Remparts	16100	COGNAC	France	PROSPECT	nan	nan	2021-06-21 07:59:46.751498	t
105	105	1 avenue de la Plage	85470	BRETIGNOLLES SUR MER	France	PROSPECT	nan	nan	2021-06-21 07:59:48.177682	t
106	106	26 boulevard du Nord	85470	BRETIGNOLLES SUR MER	France	PROSPECT	nan	nan	2021-06-21 07:59:48.197669	t
107	107	66 avenue d'Orouët	85160	SAINT JEAN DE MONTS	France	PROSPECT	nan	nan	2021-06-21 07:59:48.978222	t
108	108	11 rue du Général de Gaulle	44560	PAIMBOEUF	France	PROSPECT	nan	nan	2021-06-21 07:59:54.025334	t
109	109	274 route de Clisson	44120	VERTOU	France	PROSPECT	nan	nan	2021-06-21 07:59:54.044321	t
110	110	38 rue Gargoulleau	17000	LA ROCHELLE	France	PROSPECT	nan	nan	2021-06-21 07:59:54.889841	t
111	111	144 Boulevard de Doulon	44300	NANTES	France	PROSPECT	nan	nan	2021-06-21 07:59:56.389982	t
112	112	8 Allée des Embruns	44250	SAINT BREVIN	France	['sarl', 'thalassa', 'immobilier']	nan	nan	2021-06-21 07:59:56.424959	t
113	113	68 avenue La Fayette	17300	ROCHEFORT SUR MER	France	['baratte', 'immobilier']	nan	nan	2021-06-21 08:00:28.445672	t
114	114	27 rue du Maréchal Joffre	85000	LA ROCHE SUR YON	France	['cabinet', 'immobilier', 'merieau']	nan	nan	2021-06-21 08:00:40.559738	t
115	115	2 rue Aristide Briand	85360	LA TRANCHE SUR MER	France	PROSPECT	nan	nan	2021-06-21 08:00:44.57944	t
116	116	1 Place de la Liberté	85520	JARD SUR MER	France	PROSPECT	nan	nan	2021-06-21 08:00:44.606437	t
117	117	3 Quai de la République	17100	SAINTES	France	PROSPECT	nan	nan	2021-06-21 08:00:44.633407	t
118	118	38 rue du 8 Mai 1945	33290	LUDON	France	['cabinet', 'dubernat']	nan	nan	2021-06-21 08:00:47.155958	t
119	119	69 avenue Gambetta	17104	SAINTES	France	PROSPECT	nan	nan	2021-06-21 08:00:50.10527	t
120	120	Place Mondesir	33200	BORDEAUX CAUDERAN	France	PROSPECT	nan	nan	2021-06-21 08:00:53.013611	t
121	121	18 Avenue Guy Celerier	33138	TAUSSAT LANTON	France	PROSPECT	nan	nan	2021-06-21 08:00:53.079572	t
122	122	1 Avenue de la Libération	33700	MERIGNAC	France	PROSPECT	nan	nan	2021-06-21 08:00:53.153526	t
123	123	31 Avenue de la Libération	33110	LE BOUCAT	France	PROSPECT	nan	nan	2021-06-21 08:00:54.363832	t
124	124	5 avenue André Maginot	37100	TOURS	France	PROSPECT	nan	nan	2021-06-21 08:00:59.23105	t
125	125	17 bis rue Georges Clémenceau	85007	LA ROCHE SUR YON	France	['85', 'immo', 'la', 'roche', 'sur', 'yon']	nan	nan	2021-06-21 08:01:24.722454	t
126	126	30 Promenade Amiral Lafargue	85105	LES SABLES D'OLONNE CEDEX	France	['miramar']	nan	nan	2021-06-21 08:01:44.161292	t
127	127	46 bis rue de l'Océan	85560	LONGEVILLE SUR MER	France	PROSPECT	nan	nan	2021-06-21 08:01:47.094612	t
128	128	CC des Pyramides	85270	SAINT HILAIRE DE RIEZ	France	['square', 'habitat', 'atlantique', 'vendee']	nan	nan	2021-06-21 08:01:52.710396	t
129	129	13 Bd Guist'hau	44000	NANTES	France	['belvia', 'immobilier']	nan	nan	2021-06-21 08:01:57.459203	t
130	130	5 rue de Nantes	85600	SAINT HILAIRE DE LOULAY	France	PROSPECT	nan	nan	2021-06-21 08:02:09.320412	t
131	131	45 Promenade Clémenceau	85105	LES SABLES D'OLONNE CEDEX	France	PROSPECT	nan	nan	2021-06-21 08:02:09.352393	t
132	132	92 rue Gambetta	17200	ROYAN	France	['mgl', '-', 'laforet', 'immobiliere', 'de', 'royan']	AM308	ROY017	2021-06-21 08:02:11.528152	t
133	133	7 avenue Pasteur	17640	VAUX SUR MER	France	['iso', 'invest']	nan	nan	2021-06-21 08:02:12.62252	t
134	134	1 avenue Jacques Cartier	77600	BUSSY SAINT GEORGES	France	['imonet']	nan	nan	2021-06-21 08:02:15.260009	t
135	135	40 rue Saint Yon	17000	LA ROCHELLE	France	['century', '21', 'agence', 'du', 'marche']	nan	nan	2021-06-21 08:02:29.203244	t
136	136	4 Quai Duperre	17000	LA ROCHELLE	France	['orpi', 'cabinet', 'gauduchon']	AM325	CCH17N	2021-06-21 08:02:29.271209	t
137	137	51 avenus de L'Estacade	85550	LA BARRE DE MONTS	France	["l'adresse", '-', 'la', 'barre', 'de', 'monts']	nan	nan	2021-06-21 08:02:36.30318	t
138	138	152 Boulevard Aristide Briand	85000	LA ROCHE SUR YON	France	['agence', 'duret']	nan	nan	2021-06-21 08:02:36.341161	t
139	139	31 Boulevard Jean Rose	77100	MEAUX	France	['agence', 'chanot']	AM336	CHA077	2021-06-21 08:02:38.045185	t
140	140	13 rue du Maréchal Joffre	85000	LA ROCHE SUR YON	France	['cil', 'atlantique']	nan	nan	2021-06-21 08:02:42.564596	t
141	141	15 rue du Pont aux Foulons	35000	RENNES	France	['lelievre', 'immobilier']	AM356	nan	2021-06-21 08:03:00.163519	t
142	142	105 rue de Maréchal Joffre	85000	LA ROCHE SUR YON	France	['laforet', '-', 'aaz', 'immobilier', 'yonnais']	nan	nan	2021-06-21 08:03:04.284161	t
143	143	17 RUE PROUDHON	93210	SAINT DENIS	France	['era']	nan	nan	2021-06-21 08:03:08.479759	t
144	144	1 PLACE DE LA MOTTE	44110	CHATEAUBRIANT	France	['caste', 'immobilier']	nan	nan	2021-06-21 08:03:08.574708	t
145	145	42 rue Georges Clémenceau	85150	LA MOTHE ACAHRD	France	['agence', 'achard', 'immobilier']	nan	nan	2021-06-21 08:03:14.367392	t
146	146	37 RUE DE AL PAIX	44390	NORT SU ERDRE	France	["differenc'immo"]	nan	nan	2021-06-21 08:03:14.406364	t
147	147	5 rue du Chateau	85440	TALMONT SAINT HILAIRE	France	PROSPECT	nan	nan	2021-06-21 08:03:14.434351	t
148	148	8 rue de la Foret	35300	FOUGERES	France	['societe', 'benoit', 'lebeau']	nan	nan	2021-06-21 08:03:14.465332	t
149	149	3 rue du Général Malet	85202	FONTENAY LE COMTE	France	PROSPECT	nan	nan	2021-06-21 08:03:15.446769	t
150	150	22 rue Pierre Martinet	53204	CHATEAU GONTIER	France	['selarl', 'caractere', 'authentique']	nan	nan	2021-06-21 08:03:15.510731	t
151	151	11 rue Louis Nicole	29470	PLOUGASTEL DAOULAS	France	['votre', 'immo']	nan	nan	2021-06-21 08:03:16.420411	t
152	152	74 avenue Robert Buron	53009	LAVAL Cedex	France	PROSPECT	nan	nan	2021-06-21 08:03:16.448396	t
153	153	1 rue des Salorges	44100	NANTES	France	PROSPECT	nan	nan	2021-06-21 08:03:16.469382	t
154	154	3 rue de la Mairie	29470	PLOUGASTEL DAOULAS	France	PROSPECT	AM400	PLO029	2021-06-21 08:03:16.506361	t
155	155	2 rue Paré	44010	NANTES	France	PROSPECT	nan	nan	2021-06-21 08:03:18.443257	t
156	156	33 Boulevard Soférino	35000	RENNES	France	PROSPECT	nan	nan	2021-06-21 08:03:20.356161	t
157	157	36 rue de Paris	53000	LAVAL	France	PROSPECT	nan	nan	2021-06-21 08:03:26.628566	t
158	158	6 COurs Raphaël Binet	35043	RENNES Cedex	France	PROSPECT	nan	nan	2021-06-21 08:03:26.66055	t
159	159	40 rue de L'aiguillon	29200	BREST	France	PROSPECT	nan	nan	2021-06-21 08:03:26.726509	t
160	160	33 AVENUE DE SAINT CLOUD	78000	VERSAILLES	France	['fideprom']	nan	nan	2021-06-21 08:03:31.208946	t
161	161	11 Place de la Libération	29480	LE RELECQ KERHUON	France	["l'immobilier", 'autrement']	nan	nan	2021-06-21 08:03:31.245924	t
162	162	1- rue de l'AncienEvêché	53000	LAVAL	France	PROSPECT	nan	nan	2021-06-21 08:03:31.275909	t
163	163	89 avenue Robert Buron	53009	LAVAL Cedex	France	PROSPECT	nan	nan	2021-06-21 08:03:32.153404	t
164	164	22 reu du Chapeau Rouge	29000	QUIMPER	France	['team', 'ouest', 'immo']	nan	nan	2021-06-21 08:03:33.13884	t
165	165	8 bis Place Carnot	35300	FOUGERES	France	['carnot', 'immobilier']	nan	nan	2021-06-21 08:03:33.176818	t
166	166	1 rue Florence Arthaud	17137	NIEUL SUR MER	France	['agence', 'orpi', 'du', 'moulin']	nan	nan	2021-06-21 08:03:35.690378	t
167	167	30 rue de l'Odet	29170	FOUESNANT	France	PROSPECT	nan	nan	2021-06-21 08:03:35.728358	t
168	168	20 Moulin du Pont	29170	PLEUVEN	France	PROSPECT	nan	nan	2021-06-21 08:03:35.772332	t
169	169	66 Avenus du Général Leclerc	72000	LE MANS	France	['agence', 'ati', 'thomasse', 'immobilier']	nan	nan	2021-06-21 08:03:37.565306	t
170	170	200 rue de la Petite Palud	29800	LANDERNEAU	France	['bian', 'immobilier']	nan	nan	2021-06-21 08:03:38.704655	t
171	171	4 Quai de l'Odet	29000	QUIMPER	France	['plaza']	nan	nan	2021-06-21 08:03:38.748629	t
172	172	3 avenue du Président Wilson	41000	BLOIS	France	['blois', 'immo']	AM4340	BL41#imo	2021-06-21 08:03:41.066306	t
173	173	12 Place de l'Eglise	22600	LOUDEAC	France	['avis', 'immobilier', 'loudeac']	nan	nan	2021-06-21 08:03:45.708644	t
174	174	1 Allée de Brntal	22605	LOUDEAC	France	['notaire']	nan	nan	2021-06-21 08:03:52.402808	t
175	175	2 rue de Douves	35601	REDON Cedex	France	['notaire']	nan	nan	2021-06-21 08:03:52.606695	t
176	176	28 Boulevard de la Liberté	35000	RENNES	France	['lfi']	nan	nan	2021-06-21 08:03:52.845558	t
177	177	11 rue de Paris	91120	PALAISEAU	France	['le', 'marechal']	nan	nan	2021-06-21 08:03:52.988474	t
178	178	2 Boulevard du Commandant Charcot	17440	AYTRE	France	['orpi']	nan	nan	2021-06-21 08:03:53.403239	t
179	179	23 avenue Paul Vaillant Coututrier	94400	VITRY SUR SEINE	France	PROSPECT	nan	nan	2021-06-21 08:03:56.554434	t
180	180	7 rue de la Porte	29000	BREST	France	PROSPECT	nan	nan	2021-06-21 08:03:56.595411	t
181	181	280 rue de Paris	91120	PALAISEAU	France	["l'adresse", '-', 'palaiseau']	nan	nan	2021-06-21 08:03:59.110975	t
182	182	2 rue Verdière	17000	LA ROCHELLE	France	['agence', 'des', 'quatres', 'sergents']	AM4590	4SER#17	2021-06-21 08:04:00.204344	t
183	183	10 rue Colbert	29200	BREST	France	['agence', 'pierrval']	nan	nan	2021-06-21 08:04:01.049858	t
184	184	26 Quai Duguay Trouin	35000	RENNES	France	['orpi', 'liberte']	nan	nan	2021-06-21 08:04:01.783438	t
185	185	13 rue Roger Salengro	94450	LIMEIL BREVANNES	France	["l'adresse", '-', 'limeil', 'brevannes', '-', 'immobiliere', 'de', 'la', 'poste']	nan	nan	2021-06-21 08:04:01.813422	t
186	186	33 rue du Général Leclerc	94000	CRETEIL	France	["l'adresse", '-', 'creteil']	nan	nan	2021-06-21 08:04:01.839407	t
187	187	366 Ter rue de Vaugirard	75015	PARIS	France	["l'adresse", 'e-immobiliere']	nan	nan	2021-06-21 08:04:01.870388	t
188	188	37 rue Audry Puyravault	17300	ROCHEFORT	France	PROSPECT	nan	nan	2021-06-21 08:04:01.894376	t
189	189	1 rue Duguesclin	53100	MAYENNE	France	['la', 'licorne', 'immobilier']	nan	nan	2021-06-21 08:04:04.452912	t
190	190	1 rue du Scorff	35700	RENNES	France	['adb', 'espacil']	nan	nan	2021-06-21 08:04:04.49089	t
191	191	19 rue de Chartres	94410	DOURDAN	France	PROSPECT	nan	nan	2021-06-21 08:04:05.188492	t
192	192	10 Place Leperdit	56300	PONTIVY	France	PROSPECT	nan	nan	2021-06-21 08:04:05.889089	t
193	193	26 avenue de la Libération	91130	RIS ORANGIS	France	PROSPECT	nan	nan	2021-06-21 08:04:05.910079	t
194	194	77 bis avenue de la République	44600	SAINT NAZAIRE	France	['era', 'immobilier']	nan	nan	2021-06-21 08:04:06.733605	t
195	195	15 rue Monselet	44000	NANTES	France	PROSPECT	nan	nan	2021-06-21 08:04:06.76259	t
196	196	99 bis avenue de la République	44600	SAINT NAZAIRE	France	["l'adresse", '-', 'saint', 'nazaire']	nan	nan	2021-06-21 08:04:08.188772	t
197	197	7 rue Nationale	85110	CHANTONNAY	France	PROSPECT	AM484	FRU085	2021-06-21 08:04:09.171212	t
198	198	20 rue Amiral Linois	29000	BREST	France	PROSPECT	nan	nan	2021-06-21 08:04:10.096682	t
199	199	71  rue Jean Jaurès	44600	SAINT NAZAIRE	France	PROSPECT	nan	nan	2021-06-21 08:04:12.684199	t
200	200	30 Route de Vannes	44160	PONCHATEAU	France	PROSPECT	nan	nan	2021-06-21 08:04:19.299413	t
201	201	92 rue des Entrepreneurs	75015	PARIS	France	PROSPECT	nan	nan	2021-06-21 08:04:20.02	t
202	202	16 rue Aristide Brillant	44400	REZE	France	['lecuyer', 'immobilier']	nan	nan	2021-06-21 08:04:23.634928	t
203	203	6 RUE DU MARECHAL FOCH	77400	THORIGNY SUR MARNE	France	['agence', 'pascal']	AM515	SAL077	2021-06-21 08:04:23.679904	t
204	204	2 rue HARROUYS	44470	CARQUEFOU	France	["l'adresse", '-', 'carquefou']	nan	nan	2021-06-21 08:04:25.50286	t
205	205	6 Place de la Mairie	35490	SENS DE BRETAGNE	France	PROSPECT	nan	nan	2021-06-21 08:04:25.527847	t
206	206	280 rue Rnest Hemingway	29200	BREST	France	PROSPECT	nan	nan	2021-06-21 08:04:27.069966	t
207	207	12 rue du Bois d'Amour	29200	BREST	France	['metropolitan', 'immobilier', 'brest']	nan	nan	2021-06-21 08:04:27.778555	t
208	208	13 rue Georges Clémenceau	29400	LANDIVISIAU	France	['metropolitan', 'immobilier']	nan	nan	2021-06-21 08:04:29.987291	t
209	209	25 avenue Foch	29401	LANDIVISIAU	France	PROSPECT	nan	nan	2021-06-21 08:04:30.016276	t
210	210	8 rue Danton	29200	BREST	France	['agence', 'brestcornouaille', '(abc)', 'immobilier']	nan	nan	2021-06-21 08:04:33.808104	t
211	211	7 rue Louis Blanc	44200	NANTES	France	["l'adresse-", 'ile', 'de', 'nantes']	nan	nan	2021-06-21 08:04:33.845082	t
212	212	9 rue du Bourgneuf	29300	QUIMPERLE	France	['orpi', 'cornouaille']	nan	nan	2021-06-21 08:04:37.391053	t
213	213	9 avenue Ernest Chevalier	44730	SAINT MICHEL CHEF CHEF	France	['office', 'notarial']	AMI0139	B5Q9mKgW	2021-06-21 08:04:38.247562	t
214	214	4 Place de la Libération	56100	LORIENT	France	['la', 'nouvelle', 'agence']	nan	nan	2021-06-21 08:04:39.681745	t
215	215	71 rue d'Orléans	45380	LA CHAPELLE SAINT MESMIN	France	['arthurimmo']	nan	nan	2021-06-21 08:04:43.095785	t
216	216	69 rue du Landreau	44300	NANTES	France	PROSPECT	nan	nan	2021-06-21 08:04:43.123772	t
217	217	12 rue Paul Doumer	85000	LA ROCHE SUR YON	France	PROSPECT	nan	nan	2021-06-21 08:04:43.143758	t
218	218	2 Place du Général Lecmerc	29870	LANNILIS	France	['cabinet', 'kerjean', 'lannilis']	nan	nan	2021-06-21 08:04:43.17674	t
219	219	40 Quai du Léon	29800	LANDERNEAU	France	['cabinet', 'habasque', 'immobilier', 'landernaeau']	nan	nan	2021-06-21 08:04:43.223712	t
220	220	8 rue du Dourjacq	29200	BREST	France	['agence', "l'entreprise"]	nan	nan	2021-06-21 08:04:43.26369	t
221	221	5 avenue André Maginot	37100	TOURS	France	['agence', 'era', 'touraine', 'immobilier']	nan	nan	2021-06-21 08:04:43.300668	t
222	222	38 rue Amiral Linois	29200	BREST	France	['agence', 'fabienne', 'thierry', 'immobilier']	nan	nan	2021-06-21 08:04:45.567371	t
223	223	11 rue Esnault des Châtelets	44200	NANTES	France	['agence', 'nestenn']	nan	nan	2021-06-21 08:04:45.603352	t
224	224	15 AVENUE DU MARECHAL GALLIENI	94340	JOINVILLE LE PONT	France	["l'adresse", '-', 'adj', 'gestion', '-', 'joinville', 'le', 'pont']	nan	nan	2021-06-21 08:04:50.050807	t
225	225	35 RUE DU COCHON DUVIVIER	17300	ROCHEFORT	France	["l'adresse", '-', 'rochefort']	nan	nan	2021-06-21 08:04:50.079788	t
226	226	278 rue Jean Jaures	29200	BREST	France	['agence', 'barraine', 'promotion']	nan	nan	2021-06-21 08:04:50.698435	t
227	227	84 Avenue Louis Joseph Soulas	45800	SAINT JEAN DE BRAYE	France	['century', '21']	nan	nan	2021-06-21 08:04:50.730419	t
228	228	20 rue Maupertuis	29200	BREST	France	PROSPECT	nan	nan	2021-06-21 08:04:52.232555	t
229	229	60 rue des Forges	44330	VALLET	France	['era', 'lvi']	nan	nan	2021-06-21 08:04:52.258542	t
230	230	2 rue de la Tourelle	44320	SAINT PERE EN REETZ	France	['cabinet', 'immobilier', 'bleu', 'horizon']	nan	nan	2021-06-21 08:04:53.97056	t
231	231	11 rue Porte Coté	41000	BLOIS	France	['agence', 'imm']	nan	nan	2021-06-21 08:04:59.89417	t
232	232	Route de Rennes	44700	ORVAULT	France	PROSPECT	nan	nan	2021-06-21 08:05:01.989968	t
233	233	13 AVENUE PAUL DOUMER	94360	GOURNAY SUR MARNE	France	['agence', 'cadeau']	nan	nan	2021-06-21 08:05:02.02395	t
234	234	99 avenue du Général de Gaulle	49120	CHEMILLE EN ANJOU	France	PROSPECT	nan	nan	2021-06-21 08:05:07.758665	t
235	235	3 rue Victor Hugo	44404	REZE	France	PROSPECT	nan	nan	2021-06-21 08:05:07.780654	t
236	236	67 Place Travot	49319	CHOLET CEDEX	France	PROSPECT	nan	nan	2021-06-21 08:05:07.799645	t
237	237	nan	nan	nan	France	['credit', 'agricole', 'immobilier']	nan	nan	2021-06-21 08:05:07.831626	t
238	238	1 Place du Chardonnet	37000	TOURS	France	PROSPECT	nan	nan	2021-06-21 08:05:08.569204	t
239	239	34 rue Nationale	37250	MONTBAZON	France	['gsm', 'immobilier']	nan	nan	2021-06-21 08:05:09.995386	t
240	240	10 BOULEVARD HENRI ARNAULT	49100	ANGERS	France	['alain', 'rousseau', 'immobiliere', 'comine']	AM6101	Rou49#Cmin	2021-06-21 08:05:11.095756	t
241	241	27 avenue Duret	49260	MONTREUIL BELLAY	France	['agence', 'brun']	nan	nan	2021-06-21 08:05:12.415002	t
242	242	10 rue Bannier	45000	ORLEANS	France	PROSPECT	nan	nan	2021-06-21 08:05:14.743666	t
243	243	22 Place du Vieux Marché	45000	ORLEANS	France	PROSPECT	nan	nan	2021-06-21 08:05:14.764654	t
244	244	4 bis rue de la Grise	49400	SAUMUR	France	PROSPECT	nan	nan	2021-06-21 08:05:15.536214	t
245	245	1 Boulevard du Saumon	45150	JARGEAU	France	['agfence', 'immo', 'dream']	nan	nan	2021-06-21 08:05:15.570194	t
246	246	13 rue de la Chapelle Saint Cosme	37370	BEAUMONT LOUESTAULT	France	['ambroise', 'immo', 'guy', 'hoquet']	nan	nan	2021-06-21 08:05:20.049549	t
247	247	35 rue Marcel Vignaud	37420	AVOINE	France	['ligeria', 'immobilier']	nan	nan	2021-06-21 08:05:22.942894	t
248	248	16 avenue André Maginot	37100	TOURS	France	['agence', 'century', '21', 'rosa']	nan	nan	2021-06-21 08:05:22.977876	t
249	249	4 rue Gambetta	53200	CHATEAU GONTIER	France	['mb', 'immobilier']	nan	nan	2021-06-21 08:05:23.616504	t
250	250	10 Grand'rue	79250	NUEIL LES AUBIERS	France	['sas', 'a21']	nan	nan	2021-06-21 08:05:25.11065	t
251	251	11 rue de Clon	49000	ANGERS	France	['maine', 'et', 'loire', 'habitat']	nan	nan	2021-06-21 08:05:25.152626	t
252	252	44 avenue de l'Europe	49220	LE LION D'ANGERS	France	['notaires', 'associes', 'dupont', '&', 'migot']	nan	nan	2021-06-21 08:05:25.184611	t
253	253	6 Place de Gaulle	85300	CHALLANS	France	["l'adresse", 'immobilier', 'challans']	nan	nan	2021-06-21 08:05:27.41233	t
254	254	24 AVENUE CAMUS	44000	NANTES	France	['brigitte', 'sauvager', 'immobilier']	nan	nan	2021-06-21 08:05:28.123925	t
255	255	37 RUE NERICAULT DESTOUCHES	37000	TOURS	France	['bed', 'and', 'school']	nan	nan	2021-06-21 08:05:29.631061	t
256	256	29 boulevard Gaston DUMESNIL	49100	ANGERS	France	['immobiliere', 'des', '3', 'rives']	nan	nan	2021-06-21 08:05:29.674038	t
257	257	33 RUE DESNOUETTES	75015	PARIS	France	['elyse', 'avenue']	nan	nan	2021-06-21 08:05:34.159469	t
258	258	12 RUE DES FRÈRES GUÉRAUD	44116	VIEILLEVIGNE	France	['mme', 'fleury']	nan	nan	2021-06-21 08:05:35.575662	t
259	259	30 rue Fortuny	75017	PARIS	France	['kamet']	AM6601	nan	2021-06-21 08:05:36.401184	t
260	260	1390 RUE DE L'EGLISE	62850	SANGHEN	France	['particulier']	nan	nan	2021-06-21 08:05:37.12677	t
261	261	49 AVENUE THIERS	33100	BORDEAUX	France	['era', 'rive', 'droite']	nan	nan	2021-06-21 08:05:43.048285	t
262	262	3 RUE DE L'HOTEL DE VILLE	79100	THOUARS	France	['gonord', 'immobilier']	nan	nan	2021-06-21 08:05:46.837117	t
263	263	15 BOULEVARD PIERRE LANDAIS	35500	VITREE	France	['cabient', 'diard']	AMI0439	nan	2021-06-21 08:06:23.727994	t
\.


--
-- Data for Name: suivi_client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suivi_client (id, client, responsable, commentaire, date_creation, date_modif, visibility) FROM stdin;
1	1	8	23/05/2020 XDT mise à jour et contrôle  29/03/2021 CHM Mise à jour adresse mail, MAJ extranet effectuée	2021-06-21 07:58:47.583373	\N	t
2	11	6	08/10/2020 XDT mise à jour nouvelle adresse siège administratif et libellé nom de l'agence\n23/05/2020 XDT mise à jour et contrôle\n09/10/2020 SERVICE COMPTABILITE : Information prise en compte\n12/10/2020 TECH ECN / Modification donneur d'ordre dans Back Office	2021-06-21 07:58:55.803668	\N	t
3	16	0	etudefauquereau-simonet	2021-06-21 07:59:04.023959	\N	t
4	17	36	10/10/19 CHM mise à jour client envoie mail\n23/05/2020 XDT mise à jour INACTIF ARRET DE COLLABORATION suite détournement client MAFAT	2021-06-21 07:59:05.248262	\N	t
5	24	8	23/05/2020 XDT mise à jour client en arrêt de collaboration suite fin 2019	2021-06-21 07:59:10.662164	\N	t
6	33	0	XDT: suite poINT CA dernier edl du 22/07/2017	2021-06-21 07:59:17.516235	\N	t
7	47	8	02/10/2019 CHM / mise à jour du client\n23/05/2020 XDT mise à jour AS	2021-06-21 07:59:27.622448	\N	t
8	50	36	28/04/2019 : XDT mise à jour extranet avec prix et agent rattaché  02/10/2019 CHM mise à jour client\n23/05/2020 XDT mise à jour statut du client / mise en inactif suite fin d'année 2019	2021-06-21 07:59:29.863166	\N	t
9	52	8	XDT : fin de la collaboration suite dépard de la gestionnaire en titre / sa remplaçante a décidé de travailler avec Constaimmo car prix moins chère	2021-06-21 07:59:31.797062	\N	t
10	63	36	02/10/19 CHM/ mise à jour du client\n23/05/2020 XDT mise à jour statut du client / mise en inactif suite fin d'année 2019	2021-06-21 07:59:40.042338	\N	t
11	65	8	CHM/14/10/19 Mise à jour client , nouvelle proposition tarifaire envoyé pour re déclencher client arreté depuis 1 an	2021-06-21 07:59:41.464525	\N	t
12	70	5	23/05/2020 XDT mise à jour et contrôle	2021-06-21 07:59:45.083451	\N	t
13	71	5	23/05/2020 XDT mise à jour et contrôle	2021-06-21 07:59:46.064888	\N	t
14	85	8	25/01/2021 CHM mise à jour MDP	2021-06-21 07:59:56.485927	\N	t
15	105	8	26/09/19 CHM mise à jour client	2021-06-21 08:00:17.16313	\N	t
16	108	8	19/11/2019 XDT msie à jour complète du client suite rachat par M ET MME CHAEREYRE  les nouveaux responsables qui change aussi l'enseigne pour devenir GUY HOQUET / mise à jour de l'extranet et des contacts	2021-06-21 08:00:20.952961	\N	t
17	111	7	23/05/2020 XDT mise à jour et contrôle 28/05/2020 CHM Fichier mis à jour, MAJ extranet également.	2021-06-21 08:00:24.718808	\N	t
18	119	5	03/06/2020 CHM contact pris mise à jour,extranet également.nouvelle resp gestion .23/06/20 Contact et mise à jour , redac nouvelle propos pour relance partenariat	2021-06-21 08:00:33.73065	\N	t
19	135	6	XDT mise à jour du client avec changement d'enseigne et reprise de l'activité	2021-06-21 08:00:54.484763	\N	t
20	144	36	23/02/2020 XDT mise à jour INACTIF ARRET DE COLLABORATION suite détournement client MAFAT	2021-06-21 08:01:08.616677	\N	t
21	148	8	09/04/2019  création accès salarié de l'agence\n23/05/52020 XDT mise à jour du client AS et client inactif suite problème interne in devrait reprendre dans quelques mois	2021-06-21 08:01:13.869667	\N	t
22	149	8	02/10/19 CHM mail envoyer pour mise à jour\n23/05/2020 XDT mise à jour AS	2021-06-21 08:01:14.952047	\N	t
23	150	8	XDT : le cabinet a été vendu il faut voir avec le repreneur	2021-06-21 08:01:16.196336	\N	t
24	153	8	23/05/2020 XDT contrôle et mise à jour client / en arrêt collaboration suite détournement client par MAFAT	2021-06-21 08:01:20.452899	\N	t
25	154	5	23/05/2020 XDT contrôle et mise à jour  changement AP en accord avec AS à partir du 01/05/2020 AP ALS	2021-06-21 08:01:22.697621	\N	t
26	156	65	23/05/2020 XDT mise à jour / arrêt de collaboration suite mauvaise gestion AS COTTIN	2021-06-21 08:01:27.085101	\N	t
27	165	36	23/02/2020 XDT mise à jour INACTIF ARRET DE COLLABORATION suite détournement client MAFAT	2021-06-21 08:01:52.785359	\N	t
28	166	8	20/09/19 CHM/ suite contact,Proposition renvoyée ce jour pour signature et redémarrage fin du mois de septembre avec login et MDP	2021-06-21 08:01:57.747038	\N	t
29	169	8	23/05/2020 XDT mise à jour / arrêt de collaboration suite détournement client MAFAT	2021-06-21 08:02:02.438352	\N	t
30	170	36	23/02/2020 XDT mise à jour INACTIF ARRET DE COLLABORATION suite détournement client MAFAT	2021-06-21 08:02:03.854543	\N	t
31	173	5	23/05/2020 XDT mise à jour et contrôle : changement AP pour ALS à partir du 01/05/2020	2021-06-21 08:02:08.378951	\N	t
32	176	0	mgl-laforetimmobilierederoyan	2021-06-21 08:02:11.62609	\N	t
33	179	8	imonet	2021-06-21 08:02:15.380941	\N	t
34	189	0	XDT / Même client que guy hoquet AUTEUIL	2021-06-21 08:02:27.16841	\N	t
35	199	0	agencechanot	2021-06-21 08:02:38.136136	\N	t
36	202	5	XDT devenu AGENCE L'ADRESSE LES HERBIERS GESTION	2021-06-21 08:02:41.315311	\N	t
37	204	8	XDT nous avons réalisé des rdv edl suite collabotaion de EURIGEST avec L'ADRESSE VAL EUROPE afin de faire des rdv sur le 77	2021-06-21 08:02:43.702945	\N	t
38	209	8	01/05/2019 XDT mise à jour tarif  sur même grille que BUSSAT\n03/10/2019 XDT mise à jour adresse mail de la gestion  site demande de l'agence  04/10/19 CHM mise à jour client mail services Amexpert envoyé\n23/05/2020 XDT arrêt de collaboration suite nombreuse erreurs de gestion des agents suspicion détournement par MAFAT	2021-06-21 08:02:49.46165	\N	t
39	210	7	23/05/2020 XDT contrôle et mise à jour\n02/06/2020 CHM mise à jour client effectuée, MAJ extranet également.	2021-06-21 08:02:50.865848	\N	t
40	218	0	lelievreimmobilier	2021-06-21 08:03:00.295443	\N	t
41	220	7	23/05/2020 XDT cpntrôle et mise à jour\n02/06/2020 CHM mise à jour client effectuée, MAJ extranet également. 23/02/2021 CHM Mise à jour tarif un local commercial	2021-06-21 08:03:02.418227	\N	t
42	227	7	CHM/mise à jour de la fiche client , merci de me communiquer login et MDP. CHM/ Mise à jour nouvelle gestionnaire remplaçant Mme Goron MAJ extranet	2021-06-21 08:03:11.510023	\N	t
43	228	7	23/05/2020 XDT cpntrôle et mise à jour 28/05/2020 CHM mise à jour effectuée. MAJ extranet également	2021-06-21 08:03:12.443489	\N	t
44	232	0	Nouvelle proposition par GD le 22/803/18	2021-06-21 08:03:16.550336	\N	t
45	234	5	14/10/2020 XDT Mise à jour agenr référent suite réception mail ALS ( pdf mail en pièce jointe )\nACR sur la client BKA à partir des réalisation du 01/11/2020 \n03/10/2020 ECN Mise à jour provisoire pour début activité 09/10/2020	2021-06-21 08:03:18.509214	\N	t
46	235	8	23/05/2020 XDT mise à jour sur arrêt de collaboration suite dépôt de bilan	2021-06-21 08:03:19.514647	\N	t
47	238	8	Nouvelle proposition par GD le 22/803/18	2021-06-21 08:03:22.30904	\N	t
48	239	8	Nouvelle proposition par GD le 22/803/19	2021-06-21 08:03:23.308468	\N	t
49	248	65	23/05/2020 XDT mise à jour fiche en arrêt de collaboration suite mauvaise gestion AS COTTIN	2021-06-21 08:03:33.724504	\N	t
50	250	8	23/05/2020 XDT mise à jour AS	2021-06-21 08:03:35.861279	\N	t
51	252	0	agenceatithomasseimmobilier	2021-06-21 08:03:37.628268	\N	t
52	255	0	bloisimmo	2021-06-21 08:03:41.146254	\N	t
53	258	8	23/05/2020 XDT mise à jour AS	2021-06-21 08:03:44.064583	\N	t
54	260	0	avisimmobilierloudeac	2021-06-21 08:03:45.760612	\N	t
55	271	8	26/09/19 CHM mise à jour client\n23/05/2020 XDT mise à jour de la fiche : partie gestion  racheté par Cabinet Fredelion	2021-06-21 08:03:59.166936	\N	t
56	272	0	agencedesquatressergents	2021-06-21 08:04:00.257312	\N	t
57	277	65	23/05/2020 XDT mise à jour fiche en arrêt de collaboration suite mauvaise gestion AS COTTIN	2021-06-21 08:04:04.546859	\N	t
58	280	8	23/05/2020 XDT mise à jour et contrôle de la fiche client / mise à jour AS 03/06/2020 CHM contact pris pour organisation rdv mise à jour effectué	2021-06-21 08:04:06.816557	\N	t
59	282	8	23/05/2020 XDT mise à jour et contrôle de la fiche client  03/06/2020 CHM mise à jour , extranet également et renvoie des accès extranet pour activité ponctuel congés ou saison d'été.	2021-06-21 08:04:08.24574	\N	t
60	292	36	23/02/2020 XDT mise à jour INACTIF ARRET DE COLLABORATION suite détournement client MAFAT	2021-06-21 08:04:17.130661	\N	t
61	293	36	23/02/2020 XDT mise à jour INACTIF ARRET DE COLLABORATION suite détournement client MAFAT	2021-06-21 08:04:17.9192	\N	t
62	294	36	23/02/2020 XDT mise à jour INACTIF ARRET DE COLLABORATION suite détournement client MAFAT	2021-06-21 08:04:18.525854	\N	t
63	298	8	16/07/2019 : XDT Mise à jour extranet avec agent rattaché pour gestion des rdv et AS du client	2021-06-21 08:04:21.534131	\N	t
64	299	8	16/07/2019 : XDT Mise à jour extranet avec agent rattaché pour gestion des rdv et AS du client	2021-06-21 08:04:22.150781	\N	t
65	300	6	16/07/2019 : XDT Mise à jour extranet avec agent rattaché pour gestion des rdv et AS du client	2021-06-21 08:04:22.888359	\N	t
66	301	0	agencepascal	2021-06-21 08:04:23.725876	\N	t
67	304	5	16/07/2019 : XDT Mise à jour extranet avec agent rattaché pour gestion des rdv et AS du client	2021-06-21 08:04:26.251431	\N	t
68	308	8	15/07/2019 XDT : mise à jour id et mpd	2021-06-21 08:04:29.311679	\N	t
69	313	8	16/07/2019 : XDT Mise à jour extranet avec agent rattaché pour gestion des rdv et AS du client	2021-06-21 08:04:33.00956	\N	t
70	314	8	16/07/2019 : XDT Mise à jour extranet avec agent rattaché pour gestion des rdv et AS du client	2021-06-21 08:04:33.904049	\N	t
71	317	8	16/07/2019 : XDT Mise à jour extranet avec agent rattaché pour gestion des rdv et AS du client	2021-06-21 08:04:36.078806	\N	t
72	318	7	16/07/2019 : XDT Mise à jour extranet avec agent  rattaché pour gestion des rdv et AS du client	2021-06-21 08:04:36.776405	\N	t
73	319	8	16/07/2019 : XDT Mise à jour extranet avec agent  rattaché pour gestion des rdv et AS du client	2021-06-21 08:04:37.449027	\N	t
74	320	8	Client sur 4 départements : 49 / 53 / 44 / 85 pour 1600 EDL par an	2021-06-21 08:04:38.299532	\N	t
75	322	8	16/07/2019 : XDT Mise à jour extranet avec agent  rattaché pour gestion des rdv et AS du client	2021-06-21 08:04:39.741708	\N	t
76	330	6	24/05/2020 XDT Suite demande de la responsable service gestion MLLE Bracq, création de 3 accès pour les nouvelles assistantes et 1 accès pour la commerciale Fanny Manokoune	2021-06-21 08:04:45.660317	\N	t
77	340	8	11/10/19 CHM mail service Amexpert envoyé.31/07/2020 CHM/ Nouvelle mise à jour tarification pour relance activité	2021-06-21 08:04:52.937155	\N	t
78	344	6	03/04/2020 XDT création extranet suite de la mise à jour client	2021-06-21 08:04:56.321215	\N	t
79	347	7	CHM/ 7/11/19 mise à jour tarification	2021-06-21 08:04:58.442	\N	t
80	354	8	XDT création des nouveau accés sur new extranet	2021-06-21 08:05:03.552074	\N	t
81	359	6	XDT >> Création client et extranet	2021-06-21 08:05:07.082053	\N	t
82	360	8	30/04/2019 XDT mise à ajour back office / création de l'agence et mise à jour libellé et logo  20/09/19 CHM  mise à jour client  rdv le 07/11/19 pour point activité	2021-06-21 08:05:07.885595	\N	t
83	362	8	Mise à jour contact du client M Méchineau à quitté l'agence et remplacer par MME GUILLOTEAU CHARLOTTE\nXDT le 27/08/2019 Mise en place nouveau tarif  vu avec CUA	2021-06-21 08:05:09.408723	\N	t
84	364	6	alainrousseauimmobilierecomine	2021-06-21 08:05:11.156722	\N	t
85	373	8	16/07/2020 CHM mise à jour client , renvoie login MDP pour activité pendant les congés d'été.	2021-06-21 08:05:17.668992	\N	t
86	374	8	23/05/2020 XDT mise à jour de la fiche / arrêt de collaboration suite détournement client par MAFAT	2021-06-21 08:05:18.525501	\N	t
87	375	36	24/09/2019 CHM mise à jour client\n23/02/2020 XDT mise à jour INACTIF ARRET DE COLLABORATION suite détournement client MAFAT	2021-06-21 08:05:19.302058	\N	t
88	376	8	Contact client fait via demande via site pour réalisation d'un état des lieux à Marseille pour un inter agence\nLe responsable est un ancien de l'équipe AGENCE ORPI MARCHE	2021-06-21 08:05:20.089525	\N	t
89	377	8	RD : Au 15/07/19 3 constats réalisés : 01/02-19/03-21-03	2021-06-21 08:05:20.835098	\N	t
90	378	36	23/02/2020 XDT mise à jour INACTIF	2021-06-21 08:05:21.547688	\N	t
91	382	8	24/09/2019 XDT suite échange avec Nathalie GIUSTO il faut lui envoyé copie de facture et pas à la compta\n\nPremière prise de contact avec le client via mail à XDT demande de suivi à Nadia le jour même et réception de la proposition et demande de création du client par CMF le 07/02/2019 suivi commercial et technique à charge de CMF	2021-06-21 08:05:24.363078	\N	t
92	383	8	22/10/2019 XDT ai eu contact ce jour avec le gérant de l'agence dont je n'ai pas le nom mais voici le tel 0677074836	2021-06-21 08:05:25.256565	\N	t
93	384	0	Merci de faire les insertions de lignes au dessous de cette ligne	2021-06-21 08:05:25.840231	\N	t
94	385	5	CHM merci d'enregistrer ce client et de communiquer login et MDP	2021-06-21 08:05:26.587809	\N	t
95	386	5	XDT mise à jour des tarifs suite mise en place partenariat  avec l'agence Laforet à ANGERS	2021-06-21 08:05:27.457312	\N	t
96	389	0	immobilieredes3rives	2021-06-21 08:05:29.715012	\N	t
97	392	8	Rdv suite prospection terrain	2021-06-21 08:05:31.706874	\N	t
98	393	8	rdv suite prospection terrain	2021-06-21 08:05:32.490423	\N	t
99	394	8	01/05/2019 XDT mise à jour  back office : agence et libellé et logo	2021-06-21 08:05:33.262984	\N	t
100	397	8	mmefleury	2021-06-21 08:05:35.619633	\N	t
101	398	8	kamet	2021-06-21 08:05:36.456159	\N	t
102	399	8	particulier	2021-06-21 08:05:37.174742	\N	t
103	402	8	Suite contact téléphonique et mail envoyé par l'agence	2021-06-21 08:05:39.322512	\N	t
104	404	0	ETAT DES LIEUX D'UN APPARTEMENT F3 VIDE	2021-06-21 08:05:41.653088	\N	t
105	409	8	Demande de création\n09/04/2019 création du client avec compte extranet\n09/04/2019 XDT création du compte\n28/04/2020 XDT entretien pour point et proposition de prise en charge de 100% du volume edl /proposition tarif moyen de 85 € et mise en place à partir du 01/05/2020	2021-06-21 08:05:45.451908	\N	t
106	413	8	Demande création Identifiants et MdP plateforme 25/06/2020 CHM mise à jour et nouvelle proposition pour relance partenarita	2021-06-21 08:05:48.367237	\N	t
107	414	7	Enregistrement client particulier	2021-06-21 08:05:49.575547	\N	t
108	419	8	23/05/2020 XDT mise à jour AS	2021-06-21 08:05:53.121518	\N	t
109	421	38	19/06/2020 CHM point avec Mme Andre nouvelle proposition envoyé pour relance activité en attente	2021-06-21 08:05:54.690619	\N	t
110	423	8	test pour externalisation sur L'agence de  Rueil \nLe groupe possède 9 agences / responsable gestion MME  RUSIACK Dominique\ngestion2@de-valliere.com  01/03/2021 CHM Mise à jour adresse mail pour réalisation EDL	2021-06-21 08:05:56.231738	\N	t
111	431	8	mIse à jour tarif par XDT	2021-06-21 08:06:02.031417	\N	t
112	438	8	Création suite information de CUA suite recherche le dirgieant serait M OLIVIER DOLICQUE	2021-06-21 08:06:07.285408	\N	t
113	439	8	Création suite information de CUA suite recherche il y a é établissements une agence à LILLE et une agence à Paris	2021-06-21 08:06:07.948028	\N	t
114	441	8	Etat des lieux\n26/07/2019 XDT : mise à jour du numéro de tva intracommunautaire suite réception mail JPM	2021-06-21 08:06:09.444172	\N	t
115	444	8	21/10/2019 XDT création du client particulier sur extranet pour génération code client	2021-06-21 08:06:12.024698	\N	t
116	447	8	CHM/ EDL déja réalisé le 13/09 avec OM papier.\nXDT 18/09/2019  création des accès extranet	2021-06-21 08:06:14.042539	\N	t
117	448	7	CHM/ début d'activité fin sept 2019	2021-06-21 08:06:15.098937	\N	t
118	449	6	XDT 23/09/2019 création du client en statut particulier \nattention travail comme agent co chez RUE DE LA PAIX IMMO	2021-06-21 08:06:15.774547	\N	t
119	450	8	CHM / 10/10/19 Création client , début d'activité au 15 octobre 2019	2021-06-21 08:06:16.463156	\N	t
120	451	7	CHM / EDLS Réalisé le 24/09/19	2021-06-21 08:06:17.279685	\N	t
121	452	7	CHM 15/10/19 EDLS à réaliser le 31/10/19	2021-06-21 08:06:17.89933	\N	t
122	453	7	CHM / 18/10/19 Création client,début d'activité novembre 2019	2021-06-21 08:06:18.61592	\N	t
123	455	7	CHM / 23/10/20 Création client,EDLE le 06/02/2020	2021-06-21 08:06:19.974145	\N	t
124	456	6	29/01/2020 XDT validation avec le client de la facture en récap sur coût moyen décidé	2021-06-21 08:06:20.764691	\N	t
125	457	6	29/01/2020 XDT associée de M PAYEN FRANCK  groupe PROCITY elle s'occupe de la gestion à travers cette société\nvalidation avec le client de la facture en récap sur coût moyen décidé	2021-06-21 08:06:21.445303	\N	t
126	458	6	29/01/2020 XDT validation de l'externalisation complète après la période de test du mois de février\n> possibilité de prendre la solution partage \n> facturation récap à a typologie	2021-06-21 08:06:22.089934	\N	t
127	460	8	cabientdiard	2021-06-21 08:06:23.766973	\N	t
128	461	6	29/09/2020 XDT information administrative : siège de l'agence Carquefou sur secteur 44 AS MANDIN mise à jour à compter du 01/10/2020pour commission\n29/09/2020 XDT mise à jour de la nouvelle adresse de l'agence de Carquefou. \n29/09/2020 XDT création des accès de la nouvelle commerciale de l'agence Mlle ARTAUD Stéphanie\n18/08/2020 XDT mise à jour agent ref suite changement d'organisation administrative du client /le contact commercial est XAVIER DETOC avec le directeur des agences M BLANVILLAIN\n04/02/20 XDT création du client et des accès extranet\nce client est en gestion par service gestion LADRESSE LES ARDOISIERES	2021-06-21 08:06:24.49356	\N	t
129	462	8	27/02/2020 CHM création client et des accès extranet pour 1er essai suite signature propos en pièce jointe	2021-06-21 08:06:25.261117	\N	t
130	463	8	10/03/2020 CHM création client et des accès extranet pour Edl le 15/04/2020 suite mail ALS fiche client en pièce jointe	2021-06-21 08:06:26.036672	\N	t
131	464	8	20/03/2020 CHM création client et des accès extranet pour Edls suite mail agence, propos signée en pièce jointe 29/06/2020 CHM creation ID et MDP ag de Cesson sevigne Mme Gauthier Resp Loc	2021-06-21 08:06:26.860203	\N	t
132	465	8	01/04/2020 XDT mise à jour du client	2021-06-21 08:06:27.570794	\N	t
133	467	6	28/04/2020 XDT création du donneur d'ordre back office	2021-06-21 08:06:29.088925	\N	t
134	468	8	07/05/2020 CHM création client et des accès extranet  propos signée en pièce jointe    26/05/2021 CHM mise à jour tarification et tarif comparatif pour relance activité	2021-06-21 08:06:29.629616	\N	t
135	470	8	16/05/2020 CHM création client et des accès extranet  propos signée en pièce jointe 28/07/2020 CHM mise à jour client pour début activité courant Aout 2020	2021-06-21 08:06:31.102775	\N	t
136	471	8	02/12/2020 CHM mise à jour nouvelle salarié gestionnaire  31/12/2020 CHM mise à jour nouvel accès extranet pour Mme GLOAGEN	2021-06-21 08:06:31.746405	\N	t
137	472	8	16/10/2020 XDT suite rdv poitn du 15/10/2020 mise à jour de l'adresse mail de MLLE MARIE. \n16/05/2020 CHM création client et des accès extranet  propos signée en pièce jointe, début d'activité le 11/08/2020	2021-06-21 08:06:32.553941	\N	t
138	473	8	09/06/2020 XDT création de la fiche / propriétaire qui travail aussi avec l'agence Barbara immobilier	2021-06-21 08:06:33.259538	\N	t
139	474	8	17/06/2020 CHM création client et des accès extranet  OM signée en pièce jointe, EDLS prevu le 23/06/2020	2021-06-21 08:06:33.968134	\N	t
140	475	8	18/06/2020 CHM création client et des accès extranet  OM en pièce jointe accompagné du mail de prise de commande .	2021-06-21 08:06:34.786662	\N	t
141	476	8	23/06/2020 CHM création client et des accès extranet Proposition en piéce jointe.	2021-06-21 08:06:35.504254	\N	t
142	477	0	07/07/2020 CHM création client et des accès extranet Proposition en piéce jointe.Début activité fin juillet 2020\n07/07/2020 ECN Création DO dans Back office / Affectation à BKA en responsabilité ACR	2021-06-21 08:06:36.297798	\N	t
143	478	7	16/07/2020 CHM création client et accès extranet Ordre de mission en pièce jointe.	2021-06-21 08:06:36.991401	\N	t
144	479	8	24/07/2020 CHM création client et accès extranet Ordre de mission en pièce jointe.	2021-06-21 08:06:37.818926	\N	t
145	481	8	29/07/2020 CHM création client et des accès extranet Proposition en piéce jointe.Début activité fin juillet 2020	2021-06-21 08:06:39.22812	\N	t
146	482	8	17/08/2020 CHM création client et des accès extranet OM en piéce jointe.\n18/08/2020 ECN création DO 108047	2021-06-21 08:06:40.166583	\N	t
147	483	6	17/08/2020 XDT création des accès extranet et validation du tarif de la prestation pour 150 € / j'ai fais la création du donneur d'ordre	2021-06-21 08:06:40.936142	\N	t
148	484	7	18/08/2020 XDT création des accès extranet / le contact commercial reste Xavier Detoc qui à le contact avec le directeur M BLANVILLAIN	2021-06-21 08:06:41.642738	\N	t
149	485	8	02/09/2020 CHM création client et accès extranet OM en pièce jointe.\n03/09/2020 Tech / Création DO dans Back office 108746	2021-06-21 08:06:42.475263	\N	t
150	486	8	02/10/2020 CHM création client et accès extranet OM en pièce jointe.\n03/10/2020 TECH création DO dans Back office 109790	2021-06-21 08:06:43.100902	\N	t
151	487	8	27/10/2020 CHM creation client  03/11/2020 CHM modification mise à jour adresse mail	2021-06-21 08:06:43.797504	\N	t
152	488	6	09/11/2020 CHM creation client & Extranet particulier OM en pièce jointe\n09/11/2020 TEC Création donneur d'ordre dans back office / Ref 110878	2021-06-21 08:06:44.597049	\N	t
153	489	7	11/12/2020 CHM creation client & Extranet particulier propos  en pièce jointe\n12/12/2020 TEC création donneur d'ordre dans Back Office ref 111578	2021-06-21 08:06:45.165722	\N	t
154	490	4	17/12/2020 CHM cration client et des accès extranet Proposition en pièce jointe. Début activité mi janvier 2021\n18/12/2020 ECN Création Donneur d'ordre ref 111728	2021-06-21 08:06:45.870316	\N	t
155	492	8	12/01/2021 Création client particulier et accès extranet  OM signés en pièce jointe\n12/01/2021 ECN Création donneur d'ordre back office / Ref 112311	2021-06-21 08:06:47.245534	\N	t
156	494	6	18/03/2021 CHM / Création client particulier et acces extranet OM signé en pièce jointe\n23/03/2021 ECN/ Création donneur d'ordre directement dans RDV / Agenda annoté	2021-06-21 08:06:48.695699	\N	t
157	495	5	27/04/2021 ECN / Création client particulier et accès Extranet / OM signé en pièce jointe / Création DO dans Back office ref 115462	2021-06-21 08:06:49.326339	\N	t
158	496	8	08/05/2021 CHM / Création client particulier et acces extranet OM signé en pièce jointe\n10/05/2021 ECN Création DO dans Back office / REF 115858	2021-06-21 08:06:50.114887	\N	t
159	497	8	17/05/2021 ECN / Création client particulier et acces extranet OM signé en pièce jointe / Création DO dans Back office / REF 116030	2021-06-21 08:06:50.749525	\N	t
\.


--
-- Data for Name: suivi_prospect; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suivi_prospect (id, prospect_id, responsable, commentaire, date_creation, date_modif, visibility) FROM stdin;
1	34	0	etudefauquereau-simonet	2021-06-21 07:59:03.837066	2021-06-21 07:59:03.837066	t
2	51	8	laforet	2021-06-21 07:59:11.461701	2021-06-21 07:59:11.461701	t
3	112	8	sarlthalassaimmobilier	2021-06-21 07:59:56.437953	2021-06-21 07:59:56.437953	t
4	113	5	baratteimmobilier	2021-06-21 08:00:28.456666	2021-06-21 08:00:28.456666	t
5	114	7	cabinetimmobiliermerieau	2021-06-21 08:00:40.597714	2021-06-21 08:00:40.597714	t
6	118	7	cabinetdubernat	2021-06-21 08:00:47.164953	2021-06-21 08:00:47.164953	t
7	125	5	85immolarochesuryon	2021-06-21 08:01:24.798411	2021-06-21 08:01:24.798411	t
8	126	0	miramar	2021-06-21 08:01:44.171288	2021-06-21 08:01:44.171288	t
9	128	0	squarehabitatatlantiquevendee	2021-06-21 08:01:52.728389	2021-06-21 08:01:52.728389	t
10	129	36	belviaimmobilier	2021-06-21 08:01:57.661089	2021-06-21 08:01:57.661089	t
11	132	0	mgl-laforetimmobilierederoyan	2021-06-21 08:02:11.550134	2021-06-21 08:02:11.550134	t
12	133	0	isoinvest	2021-06-21 08:02:12.643508	2021-06-21 08:02:12.643508	t
13	134	0	imonet	2021-06-21 08:02:15.291991	2021-06-21 08:02:15.291991	t
14	135	5	century21agencedumarche	2021-06-21 08:02:29.221235	2021-06-21 08:02:29.221235	t
15	136	5	orpicabinetgauduchon	2021-06-21 08:02:29.301195	2021-06-21 08:02:29.301195	t
16	137	8	l'adresse-labarredemonts	2021-06-21 08:02:36.314173	2021-06-21 08:02:36.314173	t
17	138	8	agenceduret	2021-06-21 08:02:36.351152	2021-06-21 08:02:36.351152	t
18	139	8	agencechanot	2021-06-21 08:02:38.073167	2021-06-21 08:02:38.073167	t
19	140	5	cilatlantique	2021-06-21 08:02:42.59058	2021-06-21 08:02:42.59058	t
20	141	7	lelievreimmobilier	2021-06-21 08:03:00.184506	2021-06-21 08:03:00.184506	t
21	142	7	laforet-aazimmobilieryonnais	2021-06-21 08:03:04.295153	2021-06-21 08:03:04.295153	t
22	143	6	era	2021-06-21 08:03:08.493749	2021-06-21 08:03:08.493749	t
23	144	6	casteimmobilier	2021-06-21 08:03:08.596691	2021-06-21 08:03:08.596691	t
24	145	6	agenceachardimmobilier	2021-06-21 08:03:14.37838	2021-06-21 08:03:14.37838	t
25	146	6	differenc'immo	2021-06-21 08:03:14.417357	2021-06-21 08:03:14.417357	t
26	148	6	societebenoitlebeau	2021-06-21 08:03:14.512304	2021-06-21 08:03:14.512304	t
27	150	0	selarlcaractereauthentique	2021-06-21 08:03:15.522724	2021-06-21 08:03:15.522724	t
28	151	8	votreimmo	2021-06-21 08:03:16.431405	2021-06-21 08:03:16.431405	t
29	154	8	Nouvelle proposition par GD le 22/803/18	2021-06-21 08:03:16.516358	2021-06-21 08:03:16.516358	t
30	160	7	fideprom	2021-06-21 08:03:31.219937	2021-06-21 08:03:31.219937	t
31	161	7	l'immobilierautrement	2021-06-21 08:03:31.257919	2021-06-21 08:03:31.257919	t
32	164	6	teamouestimmo	2021-06-21 08:03:33.147835	2021-06-21 08:03:33.147835	t
33	165	6	carnotimmobilier	2021-06-21 08:03:33.186811	2021-06-21 08:03:33.186811	t
34	166	0	agenceorpidumoulin	2021-06-21 08:03:35.700371	2021-06-21 08:03:35.700371	t
35	169	0	agenceatithomasseimmobilier	2021-06-21 08:03:37.5753	2021-06-21 08:03:37.5753	t
36	170	0	bianimmobilier	2021-06-21 08:03:38.713649	2021-06-21 08:03:38.713649	t
37	171	0	plaza	2021-06-21 08:03:38.757624	2021-06-21 08:03:38.757624	t
38	172	8	bloisimmo	2021-06-21 08:03:41.088289	2021-06-21 08:03:41.088289	t
39	173	8	avisimmobilierloudeac	2021-06-21 08:03:45.719636	2021-06-21 08:03:45.719636	t
40	174	0	notaire	2021-06-21 08:03:52.502752	2021-06-21 08:03:52.502752	t
41	175	0	notaire	2021-06-21 08:03:52.701643	2021-06-21 08:03:52.701643	t
42	176	0	lfi	2021-06-21 08:03:52.886532	2021-06-21 08:03:52.886532	t
43	177	0	lemarechal	2021-06-21 08:03:53.066431	2021-06-21 08:03:53.066431	t
44	178	0	orpi	2021-06-21 08:03:53.550152	2021-06-21 08:03:53.550152	t
45	181	7	l'adresse-palaiseau	2021-06-21 08:03:59.120965	2021-06-21 08:03:59.120965	t
46	182	8	agencedesquatressergents	2021-06-21 08:04:00.215336	2021-06-21 08:04:00.215336	t
47	183	0	agencepierrval	2021-06-21 08:04:01.059854	2021-06-21 08:04:01.059854	t
48	184	8	orpiliberte	2021-06-21 08:04:01.791435	2021-06-21 08:04:01.791435	t
49	185	8	l'adresse-limeilbrevannes-immobilieredelaposte	2021-06-21 08:04:01.821416	2021-06-21 08:04:01.821416	t
50	186	8	l'adresse-creteil	2021-06-21 08:04:01.849402	2021-06-21 08:04:01.849402	t
51	187	8	l'adressee-immobiliere	2021-06-21 08:04:01.880384	2021-06-21 08:04:01.880384	t
52	189	8	lalicorneimmobilier	2021-06-21 08:04:04.464903	2021-06-21 08:04:04.464903	t
53	190	8	adbespacil	2021-06-21 08:04:04.500888	2021-06-21 08:04:04.500888	t
54	194	8	eraimmobilier	2021-06-21 08:04:06.7446	2021-06-21 08:04:06.7446	t
55	196	6	l'adresse-saintnazaire	2021-06-21 08:04:08.19977	2021-06-21 08:04:08.19977	t
56	202	6	lecuyerimmobilier	2021-06-21 08:04:23.64792	2021-06-21 08:04:23.64792	t
57	203	6	agencepascal	2021-06-21 08:04:23.688897	2021-06-21 08:04:23.688897	t
58	204	0	l'adresse-carquefou	2021-06-21 08:04:25.511853	2021-06-21 08:04:25.511853	t
59	207	8	metropolitanimmobilierbrest	2021-06-21 08:04:27.790552	2021-06-21 08:04:27.790552	t
60	208	8	metropolitanimmobilier	2021-06-21 08:04:29.997291	2021-06-21 08:04:29.997291	t
61	210	8	agencebrestcornouaille(abc)immobilier	2021-06-21 08:04:33.820096	2021-06-21 08:04:33.820096	t
62	211	8	l'adresse-iledenantes	2021-06-21 08:04:33.856077	2021-06-21 08:04:33.856077	t
63	212	7	orpicornouaille	2021-06-21 08:04:37.403047	2021-06-21 08:04:37.403047	t
64	213	8	officenotarial	2021-06-21 08:04:38.258555	2021-06-21 08:04:38.258555	t
65	214	0	lanouvelleagence	2021-06-21 08:04:39.694733	2021-06-21 08:04:39.694733	t
66	215	6	arthurimmo	2021-06-21 08:04:43.106785	2021-06-21 08:04:43.106785	t
67	218	6	cabinetkerjeanlannilis	2021-06-21 08:04:43.189735	2021-06-21 08:04:43.189735	t
68	219	6	cabinethabasqueimmobilierlandernaeau	2021-06-21 08:04:43.234707	2021-06-21 08:04:43.234707	t
69	220	6	agencel'entreprise	2021-06-21 08:04:43.273689	2021-06-21 08:04:43.273689	t
70	221	6	agenceeratouraineimmobilier	2021-06-21 08:04:43.310663	2021-06-21 08:04:43.310663	t
71	222	8	agencefabiennethierryimmobilier	2021-06-21 08:04:45.577371	2021-06-21 08:04:45.577371	t
72	223	8	agencenestenn	2021-06-21 08:04:45.61435	2021-06-21 08:04:45.61435	t
73	224	8	l'adresse-adjgestion-joinvillelepont	2021-06-21 08:04:50.059799	2021-06-21 08:04:50.059799	t
74	225	8	l'adresse-rochefort	2021-06-21 08:04:50.087784	2021-06-21 08:04:50.087784	t
75	226	8	agencebarrainepromotion	2021-06-21 08:04:50.705431	2021-06-21 08:04:50.705431	t
76	227	8	century21	2021-06-21 08:04:50.740409	2021-06-21 08:04:50.740409	t
77	229	8	eralvi	2021-06-21 08:04:52.273531	2021-06-21 08:04:52.273531	t
78	230	8	cabinetimmobilierbleuhorizon	2021-06-21 08:04:53.980553	2021-06-21 08:04:53.980553	t
79	231	5	agenceimm	2021-06-21 08:04:59.903164	2021-06-21 08:04:59.903164	t
80	233	8	agencecadeau	2021-06-21 08:05:02.033942	2021-06-21 08:05:02.033942	t
81	237	6	creditagricoleimmobilier	2021-06-21 08:05:07.840618	2021-06-21 08:05:07.840618	t
82	239	8	gsmimmobilier	2021-06-21 08:05:10.002381	2021-06-21 08:05:10.002381	t
83	240	8	alainrousseauimmobilierecomine	2021-06-21 08:05:11.114743	2021-06-21 08:05:11.114743	t
84	241	5	agencebrun	2021-06-21 08:05:12.426996	2021-06-21 08:05:12.426996	t
85	245	6	agfenceimmodream	2021-06-21 08:05:15.581187	2021-06-21 08:05:15.581187	t
86	246	36	ambroiseimmoguyhoquet	2021-06-21 08:05:20.055545	2021-06-21 08:05:20.055545	t
87	247	0	ligeriaimmobilier	2021-06-21 08:05:22.951886	2021-06-21 08:05:22.951886	t
88	248	0	agencecentury21rosa	2021-06-21 08:05:22.986867	2021-06-21 08:05:22.986867	t
89	249	8	mbimmobilier	2021-06-21 08:05:23.635493	2021-06-21 08:05:23.635493	t
90	250	8	sasa21	2021-06-21 08:05:25.118646	2021-06-21 08:05:25.118646	t
91	251	8	maineetloirehabitat	2021-06-21 08:05:25.161623	2021-06-21 08:05:25.162619	t
92	252	8	notairesassociesdupont&migot	2021-06-21 08:05:25.192603	2021-06-21 08:05:25.192603	t
93	253	5	l'adresseimmobilierchallans	2021-06-21 08:05:27.419333	2021-06-21 08:05:27.419333	t
94	254	5	brigittesauvagerimmobilier	2021-06-21 08:05:28.134924	2021-06-21 08:05:28.134924	t
95	255	38	bedandschool	2021-06-21 08:05:29.641055	2021-06-21 08:05:29.641055	t
96	256	38	immobilieredes3rives	2021-06-21 08:05:29.681032	2021-06-21 08:05:29.681032	t
97	257	8	elyseavenue	2021-06-21 08:05:34.193451	2021-06-21 08:05:34.193451	t
98	258	6	mmefleury	2021-06-21 08:05:35.585652	2021-06-21 08:05:35.585652	t
99	259	8	kamet	2021-06-21 08:05:36.413177	2021-06-21 08:05:36.413177	t
100	260	8	particulier	2021-06-21 08:05:37.135765	2021-06-21 08:05:37.135765	t
101	261	7	erarivedroite	2021-06-21 08:05:43.058278	2021-06-21 08:05:43.058278	t
102	262	8	gonordimmobilier	2021-06-21 08:05:46.84611	2021-06-21 08:05:46.84611	t
103	263	8	cabientdiard	2021-06-21 08:06:23.736991	2021-06-21 08:06:23.736991	t
\.


--
-- Name: Agenda_expert_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Agenda_expert_id_seq"', 1, false);


--
-- Name: Agenda_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Agenda_id_seq"', 1, false);


--
-- Name: Client_History_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Client_History_id_seq"', 499, true);


--
-- Name: Client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Client_id_seq"', 497, true);


--
-- Name: Client_negotiateur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Client_negotiateur_id_seq"', 1, false);


--
-- Name: Expert_History_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Expert_History_id_seq"', 85, true);


--
-- Name: Expert_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Expert_id_seq"', 85, true);


--
-- Name: Facturation_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Facturation_history_id_seq"', 1, false);


--
-- Name: Facturation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Facturation_id_seq"', 1, false);


--
-- Name: Mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Mission_id_seq"', 82, true);


--
-- Name: Negotiateur_History_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Negotiateur_History_id_seq"', 1, false);


--
-- Name: Tarif_base_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Tarif_base_id_seq"', 15, true);


--
-- Name: Tarifs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Tarifs_id_seq"', 497, true);


--
-- Name: facturation_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.facturation_client_id_seq', 1, false);


--
-- Name: facturation_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.facturation_mission_id_seq', 1, false);


--
-- Name: prospect_History_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."prospect_History_id_seq"', 263, true);


--
-- Name: prospect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prospect_id_seq', 263, true);


--
-- Name: seq_street_segment_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_street_segment_id', 6, true);


--
-- Name: suivi_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suivi_client_id_seq', 159, true);


--
-- Name: suivi_prospect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suivi_prospect_id_seq', 103, true);


--
-- Name: Agenda_expert Agenda_expert_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Agenda_expert"
    ADD CONSTRAINT "Agenda_expert_pkey" PRIMARY KEY (id);


--
-- Name: Agenda Agenda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Agenda"
    ADD CONSTRAINT "Agenda_pkey" PRIMARY KEY (id);


--
-- Name: Client_History Client_History_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Client_History"
    ADD CONSTRAINT "Client_History_pkey" PRIMARY KEY (id);


--
-- Name: Client_negotiateur Client_negotiateur_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Client_negotiateur"
    ADD CONSTRAINT "Client_negotiateur_email_key" UNIQUE (email);


--
-- Name: Client_negotiateur Client_negotiateur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Client_negotiateur"
    ADD CONSTRAINT "Client_negotiateur_pkey" PRIMARY KEY (id);


--
-- Name: Client Client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Client"
    ADD CONSTRAINT "Client_pkey" PRIMARY KEY (id);


--
-- Name: Expert_History Expert_History_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Expert_History"
    ADD CONSTRAINT "Expert_History_pkey" PRIMARY KEY (id);


--
-- Name: Expert Expert_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Expert"
    ADD CONSTRAINT "Expert_pkey" PRIMARY KEY (id);


--
-- Name: Facturation_history Facturation_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Facturation_history"
    ADD CONSTRAINT "Facturation_history_pkey" PRIMARY KEY (id);


--
-- Name: Facturation Facturation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Facturation"
    ADD CONSTRAINT "Facturation_pkey" PRIMARY KEY (id);


--
-- Name: Mission Mission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_pkey" PRIMARY KEY (id);


--
-- Name: Negotiateur_History Negotiateur_History_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Negotiateur_History"
    ADD CONSTRAINT "Negotiateur_History_pkey" PRIMARY KEY (id);


--
-- Name: Tarif_base Tarif_base_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tarif_base"
    ADD CONSTRAINT "Tarif_base_pkey" PRIMARY KEY (id);


--
-- Name: Tarifs Tarifs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tarifs"
    ADD CONSTRAINT "Tarifs_pkey" PRIMARY KEY (id);


--
-- Name: facturation_client facturation_client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturation_client
    ADD CONSTRAINT facturation_client_pkey PRIMARY KEY (id);


--
-- Name: facturation_mission facturation_mission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturation_mission
    ADD CONSTRAINT facturation_mission_pkey PRIMARY KEY (id);


--
-- Name: prospect_History prospect_History_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."prospect_History"
    ADD CONSTRAINT "prospect_History_pkey" PRIMARY KEY (id);


--
-- Name: prospect prospect_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prospect
    ADD CONSTRAINT prospect_pkey PRIMARY KEY (id);


--
-- Name: suivi_client suivi_client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suivi_client
    ADD CONSTRAINT suivi_client_pkey PRIMARY KEY (id);


--
-- Name: suivi_prospect suivi_prospect_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suivi_prospect
    ADD CONSTRAINT suivi_prospect_pkey PRIMARY KEY (id);


--
-- Name: Agenda_expert Agenda_expert_Participant_invité_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Agenda_expert"
    ADD CONSTRAINT "Agenda_expert_Participant_invité_fkey" FOREIGN KEY ("Participant_invité") REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Agenda_expert Agenda_expert_agenda_taken_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Agenda_expert"
    ADD CONSTRAINT "Agenda_expert_agenda_taken_fkey" FOREIGN KEY (agenda_taken) REFERENCES public."Agenda"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Client_History Client_History_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Client_History"
    ADD CONSTRAINT "Client_History_client_id_fkey" FOREIGN KEY (client_id) REFERENCES public."Client"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Expert_History Expert_History_expert_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Expert_History"
    ADD CONSTRAINT "Expert_History_expert_id_fkey" FOREIGN KEY (expert_id) REFERENCES public."Expert"(id);


--
-- Name: Facturation_history Facturation_history_facture_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Facturation_history"
    ADD CONSTRAINT "Facturation_history_facture_fkey" FOREIGN KEY (facture) REFERENCES public.facturation_client(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Mission Mission_ID_AS_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_ID_AS_fkey" FOREIGN KEY ("ID_AS") REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Mission Mission_ID_Agent_CellTech_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_ID_Agent_CellTech_fkey" FOREIGN KEY ("ID_Agent_CellTech") REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Mission Mission_ID_Agent_saisie_Cell_Planif_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_ID_Agent_saisie_Cell_Planif_fkey" FOREIGN KEY ("ID_Agent_saisie_Cell_Planif") REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Mission Mission_ID_INTERV_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_ID_INTERV_fkey" FOREIGN KEY ("ID_INTERV") REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Mission Mission_ID_Respon_Cell_Dev_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_ID_Respon_Cell_Dev_fkey" FOREIGN KEY ("ID_Respon_Cell_Dev") REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Mission Mission_ID_Respon_Cell_Planif_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_ID_Respon_Cell_Planif_fkey" FOREIGN KEY ("ID_Respon_Cell_Planif") REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Mission Mission_ID_Respon_Cell_Tech_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_ID_Respon_Cell_Tech_fkey" FOREIGN KEY ("ID_Respon_Cell_Tech") REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Mission Mission_ID_Suiveur_Cell_Planif_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_ID_Suiveur_Cell_Planif_fkey" FOREIGN KEY ("ID_Suiveur_Cell_Planif") REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Mission Mission_ID_Suiveur_Cell_Tech_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_ID_Suiveur_Cell_Tech_fkey" FOREIGN KEY ("ID_Suiveur_Cell_Tech") REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Mission Mission_ID_agent_Cell_Dev_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_ID_agent_Cell_Dev_fkey" FOREIGN KEY ("ID_agent_Cell_Dev") REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Mission Mission_ID_agent_chiffrage_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_ID_agent_chiffrage_fkey" FOREIGN KEY ("ID_agent_chiffrage") REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Mission Mission_ID_manager_chiffrage_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_ID_manager_chiffrage_fkey" FOREIGN KEY ("ID_manager_chiffrage") REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Mission Mission_Reference_BAILLEUR_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_Reference_BAILLEUR_fkey" FOREIGN KEY ("Reference_BAILLEUR") REFERENCES public."Client"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Tarifs Tarifs_cell_dev_ref_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tarifs"
    ADD CONSTRAINT "Tarifs_cell_dev_ref_agent_fkey" FOREIGN KEY (cell_dev_ref_agent) REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Tarifs Tarifs_cell_dev_ref_responsable_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tarifs"
    ADD CONSTRAINT "Tarifs_cell_dev_ref_responsable_fkey" FOREIGN KEY (cell_dev_ref_responsable) REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Tarifs Tarifs_cell_planif_ref_agent_saisie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tarifs"
    ADD CONSTRAINT "Tarifs_cell_planif_ref_agent_saisie_fkey" FOREIGN KEY (cell_planif_ref_agent_saisie) REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Tarifs Tarifs_cell_planif_ref_responsable_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tarifs"
    ADD CONSTRAINT "Tarifs_cell_planif_ref_responsable_fkey" FOREIGN KEY (cell_planif_ref_responsable) REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Tarifs Tarifs_cell_planif_ref_suiveur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tarifs"
    ADD CONSTRAINT "Tarifs_cell_planif_ref_suiveur_fkey" FOREIGN KEY (cell_planif_ref_suiveur) REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Tarifs Tarifs_cell_tech_ref_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tarifs"
    ADD CONSTRAINT "Tarifs_cell_tech_ref_agent_fkey" FOREIGN KEY (cell_tech_ref_agent) REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Tarifs Tarifs_cell_tech_ref_responsable_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tarifs"
    ADD CONSTRAINT "Tarifs_cell_tech_ref_responsable_fkey" FOREIGN KEY (cell_tech_ref_responsable) REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Tarifs Tarifs_cell_tech_ref_suiveur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tarifs"
    ADD CONSTRAINT "Tarifs_cell_tech_ref_suiveur_fkey" FOREIGN KEY (cell_tech_ref_suiveur) REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Tarifs Tarifs_reference_client_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tarifs"
    ADD CONSTRAINT "Tarifs_reference_client_fkey" FOREIGN KEY (reference_client) REFERENCES public."Client"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Tarifs Tarifs_referent_as_client_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tarifs"
    ADD CONSTRAINT "Tarifs_referent_as_client_fkey" FOREIGN KEY (referent_as_client) REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: facturation_mission facturation_mission_fact_mission_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturation_mission
    ADD CONSTRAINT facturation_mission_fact_mission_fkey FOREIGN KEY (fact_mission) REFERENCES public.facturation_client(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: prospect_History prospect_History_prospect_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."prospect_History"
    ADD CONSTRAINT "prospect_History_prospect_fkey" FOREIGN KEY (prospect) REFERENCES public.prospect(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: suivi_client suivi_client_client_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suivi_client
    ADD CONSTRAINT suivi_client_client_fkey FOREIGN KEY (client) REFERENCES public."Client"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: suivi_client suivi_client_responsable_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suivi_client
    ADD CONSTRAINT suivi_client_responsable_fkey FOREIGN KEY (responsable) REFERENCES public."Expert"(id);


--
-- Name: suivi_prospect suivi_prospect_prospect_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suivi_prospect
    ADD CONSTRAINT suivi_prospect_prospect_id_fkey FOREIGN KEY (prospect_id) REFERENCES public.prospect(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: suivi_prospect suivi_prospect_responsable_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suivi_prospect
    ADD CONSTRAINT suivi_prospect_responsable_fkey FOREIGN KEY (responsable) REFERENCES public."Expert"(id);


--
-- PostgreSQL database dump complete
--

