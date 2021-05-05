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
    reference integer,
    "TYPE" character varying,
    societe character varying,
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
    etat_client boolean,
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
    date_certification_initiale timestamp without time zone,
    date_renouv_certification timestamp without time zone,
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
    "DATE_FACTURE" character varying,
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

COPY public."Client" (id, reference, "TYPE", societe, titre, nom, email, numero, siret, date_creation, visibility) FROM stdin;
1	1075491	professionnel	L'ADRESSE ANJOU MAINE SARL LES 3B 	Monsieur	blanvilain sébastien	\N	\N	\N	2019-01-01 00:00:00	t
2	1270215	professionnel	L'ADRESSE CARQUEFOU SARL LOUAME	Monsieur 	blanvilain sébastien	\N	\N	\N	2019-01-02 00:00:00	t
3	123630	professionnel	L'ADRESSE LES HERBIERS - SARL LES HERBIERS GESTION 	Monsieur	blavillain et teillol	\N	\N	\N	2019-01-03 00:00:00	t
4	120020	professionnel	L'ADRESSE MAISON BLANCHE 	Monsieur	blanvillain sebastien	\N	\N	\N	2019-01-04 00:00:00	t
5	1270234	professionnel	WEST IMMOBILIER  LAFORET QUIMPER	Monsieur 	le floc'h françois	\N	\N	\N	2019-01-05 00:00:00	t
\.


--
-- Data for Name: Client_History; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Client_History" (id, client_id, adresse1, adresse2, etat_client, cp, ville, pays, login_extranet, mpd_extranet, abonnement, date, visibility) FROM stdin;
1	1	8  RUE DE LA CLAIE	Zone industrielle	t	49070	BEAUCOUZE	\N	AM1841	H2Z1FA1	\N	2021-05-05 05:38:57.357107	t
2	2	2 RUE HARROUYS	\N	t	44470	CARQUEFOU	\N	AMI0431	\N	\N	2021-05-05 05:38:57.389092	t
3	3	 48 RUE DU BRANDON	\N	t	85500	LES HERBIERS	\N	AM3261	CB1H32PE1	\N	2021-05-05 05:38:57.416073	t
4	4	50 BOULEVARD FELIX GRAT	\N	t	53000	LAVAL	\N	AM3701	MAIS531	\N	2021-05-05 05:38:57.445053	t
5	5	57 RUE DE BENODET	\N	t	29000	QUIMPER	\N	\N	\N	\N	2020-12-31 00:00:00	t
\.


--
-- Data for Name: Client_negotiateur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Client_negotiateur" (id, client_id, sexe, nom, email, numero, date_creation, visibility) FROM stdin;
1	1	Monsieur	Fabien1	fabien25@gmail.com	77650899	2021-05-01 10:52:15.603059	t
\.


--
-- Data for Name: Expert; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Expert" (id, old, new, genre, nom, trigramme, "TYPE", date_entree, siret, email, email_perso, numero, code_tva, taux_tva, password, visibility) FROM stdin;
3	33	\N	M	amexpert france	AF	Agent de secteur	2011-01-01 00:00:00	\N	France@amexpert.biz	\N	\N		0	\N	t
4	4	\N	M	andre aude line	AAL	Intervenant de constat	2016-01-01 00:00:00	\N	\N	\N	\N		0	\N	t
5	1	\N	M	arnaudeau nicolas	NA	Agent de secteur	2015-04-15 00:00:00	811433523	\N	\N	\N		0	\N	t
6	42	\N	M	atmane ludovic	ALU	Intervenant de constat	2017-12-01 00:00:00	\N	atmane2384@amexpert.biz	\N	\N		0	\N	t
7	71	\N	M	audit planers		Planing	2021-04-05 08:08:05.74677	\N	\N	\N	\N		\N	\N	t
8	15	\N	M	conraux eric	EC	Agent de secteur	2013-01-01 00:00:00	\N	conraux6582@amexpert.biz	\N	\N		0	\N	t
9	83	\N	M	denizot rachel	DRZ	Intervenant de constat	2020-07-16 00:00:00	\N	denizot1995@amexpert.biz	\N	\N		0	\N	t
10	77	\N	M	detoc tristan	TDT	Agent de planning	2015-10-01 00:00:00	81382411700010	admin@amexpert.biz	\N	\N		0	\N	t
11	18	\N	M	detoc xavier	XD	Agent de secteur	2010-01-01 00:00:00	\N	detoc4090@amexpert.biz	\N	\N		0	\N	t
12	74	\N	M	deyris marie laurence	DRL	Intervenant de constat	2019-02-11 00:00:00	\N	\N	\N	\N		\N	\N	t
13	19	\N	M	drouet genevieve	GDR	Agent de secteur	2017-01-01 00:00:00	827817461	\N	\N	\N	FR01827817461	0	\N	t
14	50	\N	M	drouet mathieu	DRM	Intervenant de constat	2018-03-01 00:00:00	\N	\N	\N	\N		0	\N	t
15	84	\N	M	dupe catherine	DPC	Intervenant de constat	2020-07-06 00:00:00	75352647400022	dupe851@Amexpert.biz	monail@mmm.fr	1234567890		0	\N	t
16	58	\N	M	duranton emmanuel	EDR	Intervenant de constat	2018-06-08 00:00:00	829152701	\N	\N	\N		0	\N	t
17	76	\N	M	fouchard odile	FDO	Intervenant de constat	2019-03-19 00:00:00	85144502300019	\N	\N	\N		0	\N	t
18	35	\N	M	froger veronique	VF	Intervenant de constat	2017-06-01 00:00:00	\N	\N	\N	\N		0	\N	t
19	60	\N	M	gangnat olivier	OGT	Intervenant de constat	2018-08-13 00:00:00	80034246100012	\N	\N	\N		0	\N	t
20	46	\N	M	guimard herve	GUH	Intervenant de constats	2018-05-01 00:00:00	83436278200015	\N	\N	\N		0	\N	t
21	9	\N	M	hel alain	AHE	Intervenant de constat	2015-01-01 00:00:00	423267012	\N	\N	\N		0	\N	t
22	64	\N	M	jullien nadia	JUN	Intervenant de constat	2018-10-02 00:00:00	51448485600028	\N	\N	\N		0	\N	t
23	85	\N	M	kaki mbeleck faustin	KMF	Intervenant de constat	2020-05-13 00:00:00	82076172400021	kaki258@amexpert.biz	\N	\N		0	\N	t
24	3	\N	M	kamus bernard	BK	Intervenant de constat	2014-01-01 00:00:00	789851425	kamus3281@amexpert.biz	\N	\N		0	\N	t
25	65	\N	M	laserre herve	LAH	Intervenant de constat	2018-10-08 00:00:00	\N	\N	\N	\N		0	\N	t
26	81	\N	M	laude blandine	LBA	Intervenant de constat	2019-08-12 00:00:00	43876287400032	laude4821@amexpert.biz	\N	\N		0	\N	t
27	40	\N	M	le dreff quentin	QLD	Intervenant de constat	2017-06-01 00:00:00	\N	\N	\N	\N		0	\N	t
28	48	\N	M	lereste patricia	LEP	Intervenant de constat	2018-04-01 00:00:00	51521854300020	lereste856@amexpert.biz	\N	\N		0	\N	t
29	11	\N	M	lesne alan	ALS	Agent de secteur	2016-01-01 00:00:00	821942125	lesne6397@amexpert.biz	\N	\N	0	0	\N	t
30	78	\N	M	lledo luc	EDU	Intervenant de constat	2019-04-27 00:00:00	85268690600011	\N	\N	\N	0	0	\N	t
31	24	\N	M	mandin christophe	CRM	Agent de secteur	2016-07-01 00:00:00	418391694	\N	\N	\N	0	0	\N	t
32	80	\N	M	neufcourt pascal	NFP	Intervenant de constat	2019-09-30 00:00:00	85153500500017	\N	\N	\N	0	0	\N	t
33	27	\N	M	pascaud denis	DPS	Intervenant de constat	2017-03-01 00:00:00	800872301	\N	\N	\N	0	0	\N	t
34	45	\N	M	pauleau romain	ROM	Intervenant de constat	2017-11-21 00:00:00	78925043800023	\N	\N	\N	0	0	\N	t
35	59	\N	M	s t - lucas dominique	LUD	Sous-traitant	2018-06-04 00:00:00	80021592300031	\N	\N	\N	0	0	\N	t
36	68	\N	M	simier matthew	SIM	Intervenant de constat	2018-10-21 00:00:00	844889162	\N	\N	\N	0	0	\N	t
37	55	\N	M	st  - care thierry	CAT	Sous-traitant	2018-06-04 00:00:00	511571861	\N	\N	\N	0	0	\N	t
38	54	\N	M	st - calmet isabelle	ICL	Sous-traitant	2018-06-04 00:00:00	831471370	\N	\N	\N	0	0	\N	t
0	\N	\N	0	0	\N	0	2021-04-05 08:06:19.647395	\N	0	\N	0	\N	\N	\N	f
2	\N	\N	Mr.	Admin	\N	Admin	2021-04-05 08:06:19.652388	\N	test0001@gmail.com	\N	12345	\N	\N	$2b$12$opS9LwJLEGiEl5ypQaTBgeWuyM9QHAUM78dAIczlQrUYQ9tgG9SR2	f
\.


--
-- Data for Name: Expert_History; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Expert_History" (id, expert_id, actif_parti, secteur, type_certification, date_certification_initiale, date_renouv_certification, adresse1, adresse2, cp, login_backof, pwd_backof, login_extranet, pwd_extranet, pwd_gsuite, login_google, pwd_google, ville, observations_de_suivi, date_sortie, date, visibility) FROM stdin;
1	3	\N	France	\N	\N	\N	6 rue du Champe de Montigny		49080	\N	\N	\N	\N	\N	\N	\N	BOUCHEMAINE	\N	\N	2021-04-05 08:08:05.615845	t
2	4	\N	Loir Atlantique	\N	\N	\N	Le Pont Bouvronnais		44130	\N	\N	\N	\N	\N	\N	\N	BOUVRON	\N	\N	2021-04-05 08:08:05.653826	t
3	5	\N	Ille et Vilaine	\N	\N	\N			\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	2021-04-05 08:08:05.690801	t
4	6	\N	Maine et Loire	\N	\N	\N	11 Place de Verdun		49700	\N	\N	\N	\N	\N	\N	\N	DOUE LA FONTAINE	\N	\N	2021-04-05 08:08:05.724785	t
5	7	\N	France	\N	\N	\N			\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	2021-04-05 08:08:05.765758	t
6	8	\N	Vendée & Deux Sèvres	\N	\N	\N	16 rue de la Mairie		85210	\N	\N	\N	\N	\N	\N	\N	THIRE	\N	\N	2021-04-05 08:08:05.800738	t
7	9	\N	Maine et Loire	\N	\N	\N	16 rue de la Traquette		49100	\N	\N	\N	\N	\N	\N	\N	ANGERS	\N	\N	2021-04-05 08:08:05.837717	t
8	10	\N	France	\N	\N	\N	23 rue de Belfort		49100	\N	\N	\N	\N	\N	\N	\N	ANGERS	\N	\N	2021-04-05 08:08:05.870703	t
9	11	\N	Maine et Loire	\N	\N	\N	Chemin de la Réauté		49330	\N	\N	\N	\N	\N	\N	\N	LES HAUTS D'ANJOU	\N	\N	2021-04-05 08:08:05.898684	t
10	12	\N	Occitanie	\N	\N	\N	98 Clos de Vic		34110	\N	\N	\N	\N	\N	\N	\N	VIC LA GARDIOLE	\N	\N	2021-04-05 08:08:05.930667	t
11	13	\N	Finistère	\N	\N	\N	320 Route du Douhar Bihan		29470	\N	\N	\N	\N	\N	\N	\N	PLOUGASTEL DAOULAS	\N	\N	2021-04-05 08:08:05.964645	t
12	14	\N	Charente et Charente Maritime	\N	\N	\N	18 rue de la Treille		17430	\N	\N	\N	\N	\N	\N	\N	TONAY CHARENTE	\N	\N	2021-04-05 08:08:05.990629	t
13	15	\N	Loire Atlantique	\N	\N	\N	22 avenue de Jousselin		44300	DUPE CATHERINE	DPC851	AMI0148	hiFaZzAX	\N	dupe851@amexpert.biz	Auc#851&cat	NANTES	\N	\N	2021-04-05 08:08:06.017617	t
14	16	\N	Maine et Loire	\N	\N	\N	7 Mail Claude Debussy		49125	\N	\N	\N	\N	\N	\N	\N	TIERCE	\N	\N	2021-04-05 08:08:06.0446	t
15	17	\N	Maine et Loire	\N	\N	\N	38 rue du Vallon		49000	\N	\N	\N	\N	\N	\N	\N	ANGERS	\N	\N	2021-04-05 08:08:06.071583	t
16	18	\N	Maine et Loire	\N	\N	\N	20 rue des Ardrières		49100	\N	\N	\N	\N	\N	\N	\N	ANGERS	\N	\N	2021-04-05 08:08:06.107562	t
17	19	\N	Maine et Loire	\N	\N	\N	41 rue Lucien Béjeau		49100	\N	\N	\N	\N	\N	\N	\N	ANGERS	\N	\N	2021-04-05 08:08:06.147543	t
18	20	\N	Loir et Cher - Loiret	\N	\N	\N	10 rue Ulysse Fleury		41350	\N	\N	\N	\N	\N	\N	\N	VINEUIL	\N	\N	2021-04-05 08:08:06.18452	t
19	21	\N	Maine et Loire	\N	\N	\N	9 rue de la Gourmette		49000	\N	\N	\N	\N	\N	\N	\N	ECOUFLANT	\N	\N	2021-04-05 08:08:06.255481	t
20	22	\N	Maine et Loire	\N	\N	\N	21 rue Armand Broosse		49610	\N	\N	\N	\N	\N	\N	\N	SAINT MELAINE SUR AUBANCE	\N	\N	2021-04-05 08:08:06.295456	t
21	23	\N	Ile de France	\N	\N	\N	28 Place de l'An 2000		77380	\N	\N	\N	\N	\N	\N	\N	COBS LA VILLE	\N	\N	2021-04-05 08:08:06.333433	t
22	24	\N	Charente et Charente Maritime	\N	\N	\N	34 rue des Platanes		17220	\N	\N	\N	\N	\N	\N	\N	SAINT ROGATIEN	\N	\N	2021-04-05 08:08:06.373411	t
23	25	\N	Maine et Loire	\N	\N	\N	26 rue Marcel Pajotin		49000	\N	\N	\N	\N	\N	\N	\N	ANGERS	\N	\N	2021-04-05 08:08:06.411391	t
24	26	\N	Pays de la Loire	\N	\N	\N	2 Lieu dit Saint Jean		85190	\N	\N	\N	\N	\N	\N	\N	VENANSAULT	\N	\N	2021-04-05 08:08:06.45037	t
25	27	\N	Finistère	\N	\N	\N	5 rue de la Montagne		29200	\N	\N	\N	\N	\N	\N	\N	BREST	\N	\N	2021-04-05 08:08:06.490344	t
26	28	\N	Sarthe Mayenne	\N	\N	\N	24 rue de la Fenaison		53810	\N	\N	\N	\N	\N	\N	\N	CHANGE	\N	\N	2021-04-05 08:08:06.525324	t
27	29	\N	Gironde Ouest	\N	\N	\N	3 LA Garenne		33820	\N	\N	\N	\N	\N	\N	\N	BRAUD ET SAINT LOUIS	\N	\N	2021-04-05 08:08:06.570303	t
28	30	\N	Vendée - Deux Sèvres	\N	\N	\N	149 rue Mazeau		85440	\N	\N	\N	\N	\N	\N	\N	TALMONT SAINT HILAIRE	\N	\N	2021-04-05 08:08:06.611277	t
29	31	\N	Loire Atlantique Nord	\N	\N	\N	30 rue de l'Epeau		44470	\N	\N	\N	\N	\N	\N	\N	CARQUEFOU	\N	\N	2021-04-05 08:08:06.653252	t
30	32	\N	BRETAGNE	\N	\N	\N	10 rue Alain Gerbault		35590	\N	\N	\N	\N	\N	\N	\N	L'HERMITAGE	\N	\N	2021-04-05 08:08:06.695229	t
31	33	\N	Maine et Loire	\N	\N	\N	1 rue du Petit Sigogne		49320	\N	\N	\N	\N	\N	\N	\N	CHEMELIER	Procédure juridique en cours	\N	2021-04-05 08:08:06.721211	t
32	34	\N	Maine et Loire	\N	\N	\N	63 Boulevard Henri Dunant		49100	\N	\N	\N	\N	\N	\N	\N	ANGERS	\N	\N	2021-04-05 08:08:06.750206	t
33	35	\N	Charente et Charente Maritime	\N	\N	\N	16 rue du Port		17340	\N	\N	\N	\N	\N	\N	\N	YVES	\N	\N	2021-04-05 08:08:06.776181	t
34	36	\N	Ile de France	\N	\N	\N	8 rue de la Poste		94210	\N	\N	\N	\N	\N	\N	\N	SAINT MAURE DES FOSSES	\N	\N	2021-04-05 08:08:06.804167	t
35	37	\N	Ile de France	\N	\N	\N	22 rue du Rhin		78180	\N	\N	\N	\N	\N	\N	\N	MONTIGNY LE BRETONNEUX	\N	\N	2021-04-05 08:08:06.831151	t
36	38	\N	Loir Atlantique	\N	\N	\N	5 Allée de la Reine Margot		44000	\N	\N	\N	\N	\N	\N	\N	NANTES	\N	\N	2021-04-05 08:08:06.858132	t
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

COPY public."Mission" (id, "Reference_BAILLEUR", old, "NRO_FACTURE", "ABONNEMENT", "ID_AS", "PRIX_HT_EDL", "DATE_REALISE_EDL", "ID_INTERV", "Reference_LOCATAIRE", "Adresse1_Bien", "Adresse2_Bien", "CP_Bien", "Ville_Bien", "CA_HT_AS", "TVA_AS", "CA_TTC_AS", "CA_HT_AC", "CA_TTC_AC", "CA_HT_TRUST", "TVA_TRUST", "Date_chiffrage_regle", "Prix_ht_chiffrage", "POURCENTAGE_suiveur_chiffrage", "POURCENTAGE_AS_chiffrage", "POURCENTAGE_manager_chiffrage", "ID_manager_chiffrage", "POURCENTAGE_agent_chiffrage", "ID_agent_chiffrage", "TYPE_EDL", "DATE_FACTURE", "TITREPROPRIO", "NOMPROPRIO", "DATE_FACT_REGLEE", "TYPE_LOGEMENT", "CODE_AMEXPERT", "COMMENTAIRE_FACTURE", "LOGEMENT_MEUBLE", "CODE_FACTURATION", "TYPE_DE_BIEN", surface_logement1, "Ref_commande", "POURCENTAGE_COM_AS_DU_CLIENT", "ID_Respon_Cell_Dev", "POURCENTAGE_Respon_Cell_Dev", "ID_agent_Cell_Dev", "POURCENTAGE_Agent_Cell_Dev", "ID_Agent_CellTech", "POURCENTAGE_Agent_Cell_Tech", "ID_Respon_Cell_Tech", "POURCENTAGE_Respon_Cell_Tech", "ID_Suiveur_Cell_Tech", "POURCENTAGE_Suiveur_Cell_Tech", "ID_Respon_Cell_Planif", "POURCENTAGE_Respon_Cell_Planif", "ID_Suiveur_Cell_Planif", "POURCENTAGE_Suiveur_Cell_Planif", "ID_Agent_saisie_Cell_Planif", "POURCENTAGE_Agent_saisie_CEll_planif", "Anomalie", coherent, reason, "Visibility") FROM stdin;
1	4	96	\N	PZEDL120020	11	\N	2020-10-20 00:00:00	28	GUEROULT REINE	76 RUE ANDRE SAGET	RESIDENCE LE PARC SAINT MARTIN	53000	LAVAL	27	\N	\N	36	\N	18	\N	\N	22.5	0	0.25	0.05	24	0.4	31	Sortant	\N	\N	SIMON ROGER/JACQUELINE	\N	APPT-F3	24891	\N	NON	TN100 APPT F3	APPARTEMENT	62.13	19791	0.15	31	0.01	22	0.04	24	0.01	8	0.01	22	0.03	29	0.01	10	0.02	10	0.02	f	t	\N	t
4	4	99	\N	PZEDL120020	11	\N	2020-11-03 00:00:00	28	NEVEU JULIE	66 RUE DE L'ABBE PIERRE	DOMAINE DE LA GENDRIE	53000	LAVAL	29.4	\N	\N	39.2	\N	19.6	\N	\N	24.5	0	0.25	0.05	24	0.4	11	Sortant	\N	\N	ORALIA DESPORTS 	\N	PAV-T2	18518	\N	NON	TN100 PAV T2	PAVILLON	50.65	19917	0.15	31	0.01	22	0.04	24	0.01	8	0.01	22	0.03	29	0.01	10	0.02	10	0.02	f	t	\N	t
5	4	100	\N	PZEDL120020	11	\N	2020-11-05 00:00:00	28	LAMBERT/GAGNOULET JEAN-PHILIPPE/LUCIE	6 RUE DE BOSTON	\N	53000	LAVAL	54	\N	\N	72	\N	36	\N	\N	45	0	0.25	0.05	24	0.4	8	Sortant	\N	\N	COQUELIN SERGE	\N	PAV-T5	24997	\N	NON	TN100 PAV T5	PAVILLON	98	20054	0.15	31	0.01	22	0.04	24	0.01	8	0.01	22	0.03	29	0.01	10	0.02	10	0.02	f	t	\N	t
6	4	101	\N	PZEDL120020	11	\N	2020-11-30 00:00:00	28	FOURET CAMILLE	9 IMPASSE MAGENTA	\N	53000	LAVAL	25.5	\N	\N	34	\N	17	\N	\N	21.25	0	0.25	0.05	24	0.4	6	Sortant	\N	\N	SCI POLE POSITION-MACHON 	\N	APPT-F2	15596	\N	NON	TN100 APPT F2	APPARTEMENT	45.90	19294	0.15	31	0.01	22	0.04	24	0.01	8	0.01	22	0.03	29	0.01	10	0.02	10	0.02	f	t	\N	t
8	3	79	\N	PZEDL123630	8	\N	2020-10-23 00:00:00	24	CAILLAUD GASTON	82 RUE NATIONALE	\N	85500	LES HERBIERS	25.5	\N	\N	34	\N	17	\N	\N	21.25	0	0.25	0.05	24	0.4	8	Sortant	\N	\N	BONNENFANT MARCHAND	\N	APPT-F2	24900	\N	NON	TN100 APPT F2	APPARTEMENT	55	19705	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
11	3	82	\N	PZEDL123630	8	\N	2020-10-27 00:00:00	26	ANDRIAMIFIDY HERISOA ET MARIE-CECILE	16 RUE MARCEL CERDAN	\N	85500	LES HERBIERS	45	\N	\N	60	\N	30	\N	\N	37.5	0	0.25	0.05	24	0.4	8	Sortant	\N	\N	SCI L'HARMONIE Mr FOULONNEAU DIDIER	\N	PAV-T4	14474	\N	NON	TN100 PAV T4	PAVILLON	95	S 18769-E 19234	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
12	3	83	\N	PZEDL123630	8	\N	2020-10-28 00:00:00	26	FAVREAU ANNIE	41 RUE DES MOUETTES	\N	85500	LES HERBIERS	45	\N	\N	60	\N	30	\N	\N	37.5	0	0.25	0.05	24	0.4	8	Sortant	\N	\N	PAQUEREAU DENIS ET BEATRICE	\N	PAV-T4	18937	\N	NON	TN100 PAV T4	PAVILLON	91	18253	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
13	3	84	\N	PZEDL123630	8	\N	2020-11-03 00:00:00	26	SORIN VIRGINIE	12 GRANDE RUE	\N	85500	LES HERBIERS	25.5	\N	\N	34	\N	17	\N	\N	21.25	0	0.25	0.05	24	0.4	8	Sortant	\N	\N	BONNEAU LUC ET KATTY	\N	APPT-F2	19886	\N	NON	TN100 APPT F2	APPARTEMENT	42	19492	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
14	3	85	\N	PZEDL123630	8	\N	2020-11-30 00:00:00	26	LABOUREUX ALEXANDRE ; NORDHAUS MELISSA	 1 RUE DE LA GARENNE	\N	85700	SAINT MICHEL MONT MERCURE	45	\N	\N	60	\N	30	\N	\N	37.5	0	0.25	0.05	24	0.4	26	Sortant	\N	\N	BLANCHARD ANNE-MARIE	\N	PAV-T4	15407	\N	NON	TN100 PAV T4	PAV	89.87	20264	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
7	4	102	\N	PZEDL120020	11	\N	2020-11-30 00:00:00	28	DIJOUX JOSIAN	 LIEU-DIT LE MOULIN	\N	53290	BIERNE	35.4	\N	\N	47.2	\N	23.6	\N	\N	29.5	0	0.25	0.05	24	0.4	6	Sortant	\N	\N	LIBERT PATRICE	\N	PAV-T3	22898	\N	NON	TN100 PAV T3	PAVILLON	57	19574	0.15	31	0.01	22	0.04	24	0.01	8	0.01	22	0.03	29	0.01	10	0.02	10	0.02	f	t	\N	t
3	4	98	\N	PZEDL120020	11	\N	2020-11-02 00:00:00	28	MAIGNAN MATHIEU	11 RUE EDOUARD BRANLY	ENTRÉE DE GAUCHE	53200	CHATEAU GONTIER	25.5	\N	\N	34	\N	17	\N	\N	21.25	0	0.25	0.05	24	0.4	31	Sortant	\N	\N	GUINEHEUX MARIE	\N	APPT-F2	19916	\N	NON	TN100	APPT	44	19688	0.15	31	0.01	22	0.04	24	0.01	8	0.01	22	0.03	29	0.01	10	0.02	10	0.02	f	t	\N	t
9	3	80	\N	PZEDL123630	8	\N	2020-10-24 00:00:00	24	ROUSSEL LAETITIA	18 RUE DU 8 MAI 1945	\N	85500	BEAUREPAIRE	35.4	\N	\N	47.2	\N	23.6	\N	\N	29.5	0	0.25	0.05	24	0.4	24	Sortant	\N	\N	BITEAU MARIE RENEE	\N	PAV-T3	18178	\N	NON	TN100 APPT F3	PAVILLON	90	S19812 - E19919	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t	t	Anomalie non bloquante traite en  T3	t
10	3	81	\N	PZEDL123630	8	\N	2020-10-26 00:00:00	26	PARPAILLON YANN	 6  BIS RUE SAINT BLAISE	\N	85500	LES HERBIERS	35.4	\N	\N	47.2	\N	23.6	\N	\N	29.5	0	0.25	0.05	24	0.4	8	Sortant	\N	\N	PAQUEREAU CHLOE	\N	PAV-T3	24916	\N	NON	TN100 PAV T3	PAVILLON	54.10	S 18706-E 18968	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
19	1	5	1-2105-C	PZEDL1075491	11	118	2020-10-06 00:00:00	6	REMOUE LAURINE	18 RUE DES LAVANDIERES	\N	49320	GREZILLE	35.4	\N	\N	47.2	\N	23.6	\N	\N	29.5	0	0.25	0.05	24	0.4	8	Sortant	2021-05-05 07:14:56.859742	\N	SCI MOREAU LA CHAPELLE 	\N	PAV-T3	8254	\N	NON	TN100 PAV T3	PAV	90	18952	0.15	31	0.01	16	0.04	24	0.01	8	0.04	16	0.03	29	0.01	10	0.02	10	0.02	f	t	\N	t
16	1	2	1-2105-C	PZEDL1075491	11	90	2020-10-02 00:00:00	6	PINIER ANTONIN	22 RUE LOUIS MORON	\N	49320	BRISSAC QUINCE	27	\N	\N	36	\N	18	\N	\N	22.5	0	0.25	0.05	24	0.4	8	Sortant	2021-05-05 07:14:56.859742	\N	MORTIER ROBERT	\N	APPT-F3	18656	\N	NON	TN100	APPT	62	18386	0.15	31	0.01	29	0.04	24	0.01	8	0.01	29	0.03	29	0.01	0	0.02	0	0.02	f	t	\N	t
17	1	3	1-2105-C	PZEDL1075491	11	100	2020-10-02 00:00:00	6	GOUZOU ROMAIN	27 RUE BOUGERE	RESIDENCE BOUGERE AUDUSSON	49000	ANGERS	30	\N	\N	40	\N	20	\N	\N	25	0	0.25	0.05	24	0.4	8	Sortant	2021-05-05 07:14:56.859742	\N	DERRIEN RONAN	\N	APPT-F4	4979	\N	NON	TN100	PAV	75	S18539-E19678	0.15	31	0.01	11	0.04	24	0.01	8	0.01	11	0.03	29	0.01	10	0.02	10	0.02	f	t	\N	t
21	1	7	1-2105-C	PZEDL1075491	11	180	2020-10-08 00:00:00	6	BOILEAU AURELIEN	325 ROUTE DE LA PRIOULERE	\N	49140	BAUNE	54	\N	\N	72	\N	36	\N	\N	45	0	0.25	0.05	24	0.4	11	Sortant	2021-05-05 07:14:56.859742	\N	RICHARD JEAN LOUIS	\N	PAV-T5	2481	\N	NON	TN100	PAV	110	S18531-E19044	0.15	11	0.01	16	0.04	24	0.01	8	0.01	16	0.03	29	0.01	10	0.02	10	0.02	f	t	\N	t
20	1	6	1-2105-C	PZEDL1075491	11	90	2020-10-06 00:00:00	6	STEMPINIAK DIDIER	8  RUE GUSTAVE MAREAU	\N	49000	ANGERS	27	\N	\N	36	\N	18	\N	\N	22.5	0	0.25	0.05	24	0.4	8	Sortant	2021-05-05 07:14:56.859742	\N	DAUDIN GUILLAUME	\N	APPT-F3	13958	\N	NON	TN100 APPT F3	APPARTEMENT	64.82	S18362-E19694	0.15	31	0.01	0	0.04	24	0.01	8	0.01	0	0.03	29	0.01	29	0.02	29	0.02	f	t	\N	t
22	1	8	1-2105-C	PZEDL1075491	11	80	2020-10-09 00:00:00	6	CHAUVEL ARNAUD	28 BOULEVARD DU GENERAL DE GAULLE	\N	49100	ANGERS	24	\N	\N	32	\N	16	\N	\N	20	0	0.25	0.05	24	0.4	31	Sortant	2021-05-05 07:14:56.859742	\N	SA LA CHATELAINE MASSIN LE GOFF GUY	\N	APPT-F1	3620	\N	NON	TN100 APPT F1	APPT	39	19387	0.15	31	0.01	0	0.04	24	0.01	8	0.01	0	0.03	29	0.01	29	0.02	29	0.02	f	t	\N	t
23	1	9	1-2105-C	PZEDL1075491	11	85	2020-10-10 00:00:00	6	BERANGER-YATERA BRUNO-ISMAILA	23 BOULEVARD JEAN MOULIN	\N	49000	ANGERS	25.5	\N	\N	34	\N	17	\N	\N	21.25	0	0.25	0.05	24	0.4	31	Sortant	2021-05-05 07:14:56.859742	\N	CANCELIER BRIAND - EVE MARIE	\N	APPT-F2	3196	\N	NON	TN100 APPT F2	APPARTEMENT	42.34	18794	0.15	31	0.01	31	0.04	24	0.01	8	0.01	8	0.03	29	0.01	29	0.02	29	0.02	f	t	\N	t
38	1	24	\N	PZEDL1075491	11	\N	2020-11-02 00:00:00	6	COSSON - LECLERC ROMAIN - SONIA	25 RUE SAINT NICOLAS	RESIDENCE LE RONCERAY	49100	ANGERS	25.5	\N	\N	34	\N	17	\N	\N	21.25	0	0.25	0.05	24	0.4	6	Sortant	\N	\N	 62897 - DU FONTENIOUX Marie Dominique	\N	APPT-F2	24982	\N	NON	TN100 APPT F2	APPARTEMENT	52;64	18985	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
40	1	26	\N	PZEDL1075491	11	\N	2020-11-03 00:00:00	6	GUICHARD JUSTINE	31 RUE DU HAUT CHEMIN	\N	49800	LA BOHALLE	45	\N	\N	60	\N	30	\N	\N	37.5	0	0.25	0.05	24	0.4	6	Sortant	\N	\N	GERMAIN MARIE FRANCE	\N	PAV-T4	24986	\N	NON	TN100 PAV T4	PAVILLON	70	19983	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
43	1	29	\N	PZEDL1075491	11	\N	2020-11-06 00:00:00	6	SIMON - HOUSSAIS JOEL et MARIE BERNADETTE	2 SQUARE DES HAUTS DE FOLIETE	\N	49610	MURS ERIGNE	54	\N	\N	72	\N	36	\N	\N	45	0	0.25	0.05	24	0.4	6	Sortant	\N	\N	THIBAULT Marc et Anne-Marie	\N	PAV-T5	17625	\N	NON	TN100 PAV T5	PAVILLON	121	19222	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
45	1	31	\N	PZEDL1075491	11	\N	2020-11-09 00:00:00	6	GENEST CLOVIS - CLAIRE	2 PLACE DU PRIEURE	\N	49320	SAINT SATURNIN SUR LOIRE	45	\N	\N	60	\N	30	\N	\N	37.5	0	0.25	0.05	24	0.4	6	Sortant	\N	\N	PEDRON ET STICH NOËL ET MICHELLE	\N	PAV-T4	3169	\N	NON	TN100 PAV T4	PAV	84	18987	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
47	1	33	\N	PZEDL1075491	11	\N	2020-11-12 00:00:00	6	BELLAYER PATRICIA-PATRICK	14 ALLEE DES SOURCES	LIEU DIT PORAGE	49640	DAUMERAY	54	\N	\N	72	\N	36	\N	\N	45	0	0.25	0.05	24	0.4	6	Sortant	\N	\N	BONNAVENTURE MICHAEL	\N	PAV-T5	6922	\N	NON	TN100 PAV T5	PAVILLON	104	19979	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
48	1	34	\N	PZEDL1075491	11	\N	2020-11-13 00:00:00	6	RENAUDIN HERVE	 5 RUE DU DOLMEN	\N	49320	SAULGE L'HOPITAL	0	\N	\N	0	\N	0	\N	\N	45	0	0.25	0.05	24	0.4	6	Sortant	\N	\N	DIARD LILIANE	\N	PAV-T5	10720	\N	NON	TN100 PAV T5	PAV	91	19972	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
49	1	35	\N	PZEDL1075491	11	\N	2020-11-19 00:00:00	6	ABELARD BROUARD MARIE-CLAUDE	1 RUE ALPHONSE COCHARD	\N	49220	LE LION D'ANGERS	45	\N	\N	60	\N	30	\N	\N	37.5	0	0.25	0.05	24	0.4	6	Sortant	\N	\N	BERNARD MICHEL et PAULETTE	\N	PAV-T4	1367	\N	NON	TN100 PAV T4	PAVILLON	114	19157	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
33	1	19	1-2105-C	PZEDL1075491	11	118	2020-10-30 00:00:00	6	NOBIRON CORINNE	2 IMPASSE DU BILLOUARD	\N	49250	BEAUFORT EN VALLEE	35.4	\N	\N	47.2	\N	23.6	\N	\N	29.5	0	0.25	0.05	24	0.4	6	Sortant	2021-05-05 07:14:56.859742	\N	GAUTREAU 	\N	PAV-T3	15969	\N	NON	TN100 PAV T3	APPARTEMENT	61	19746	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
25	1	11	1-2105-C	PZEDL1075491	11	150	2020-10-15 00:00:00	6	TREMBLAY ELIE	23 DU ROCHER	\N	49500	LOUVAINES	45	\N	\N	60	\N	30	\N	\N	37.5	0	0.25	0.05	24	0.4	31	Sortant	2021-05-05 07:14:56.859742	\N	FAMILY MME/MR MAUBOUSIN	\N	PAV-T4	7863	\N	NON	TN100 PAV T4	PAVILLON	83	S18545-E19607	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
36	1	22	\N	PZEDL1075491	11	\N	2020-11-02 00:00:00	6	LE BIHAN REGIS	18 VILLAGE DE L'AUNAY	\N	49370	LE LOUROUX BECONNAIS	35.4	\N	\N	47.2	\N	23.6	\N	\N	29.5	0	0.25	0.05	24	0.4	6	Sortant	\N	\N	TRAVADON 	\N	PAV-T3	5882	\N	NON	TN100 PAV T3	PAVILLON	88	18866	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
37	1	23	\N	PZEDL1075491	11	\N	2020-11-02 00:00:00	6	MULLER et MARTINS-BALTAR QUENTIN - ANOUCK	46 RUE JEAN JAURES	\N	49000	ANGERS	35.4	\N	\N	47.2	\N	23.6	\N	\N	29.5	0	0.25	0.05	24	0.4	6	Sortant	\N	\N	LAMBRUN GERARD	\N	PAV-T3	24964	\N	NON	TN100 PAV T3	PAVILLON	63	S19217-E19792	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
39	1	25	\N	PZEDL1075491	11	\N	2020-11-03 00:00:00	6	PICARA ARANDA	3 ALLEE DE VIENNE	\N	49460	MONTREUIL JUIGNE	45	\N	\N	60	\N	30	\N	\N	37.5	0	0.25	0.05	24	0.4	6	Sortant	\N	\N	DEMAS BERNARD - CLAUDE	\N	PAV-T4	6442	\N	NON	TN100 PAV T5	PAV	104	20055	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t	t	Anomalie non bloquante traite en  T4	t
41	1	27	\N	PZEDL1075491	11	\N	2020-11-04 00:00:00	6	CHASSAIGNE - ROUMESTANT LUCIE - EDOUARD	 LA BOUGRIE	\N	49380	CHAMP SUR LAYON	35.4	\N	\N	47.2	\N	23.6	\N	\N	29.5	0	0.25	0.05	24	0.4	6	Sortant	\N	\N	DERUSSE LUCIE	\N	PAV-T3	11359	\N	NON	TN100 PAV T3	PAV	60	S18897-E19539	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
46	1	32	\N	PZEDL1075491	11	\N	2020-11-09 00:00:00	6	DEHON RENAUD	58 ROUTE D'ANGERS	\N	49370	BECON LES GRANITS	35.4	\N	\N	47.2	\N	23.6	\N	\N	29.5	0	0.25	0.05	24	0.4	6	Sortant	\N	\N	TOUCHET 81681 PIERRETTE	\N	PAV-T3	25006	\N	NON	TN100 PAV T3	PAVILLON	65	20164	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
42	1	28	\N	PZEDL1075491	11	\N	2020-11-05 00:00:00	6	HUMEAU Audrey	17  RUE NOTRE DAME	\N	49260	LE PUY NOTRE DAME	27	\N	\N	36	\N	18	\N	\N	0	0	0.25	0.05	24	0.4	6	Sortant	\N	\N	GC FONCIER INVESTISSEMENT CASSIN AMBROISE	\N	APPT-F3	6331	\N	NON	TN100	APPT	79	S18665	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
44	1	30	\N	PZEDL1075491	11	\N	2020-11-09 00:00:00	6	DESBORDES et WAFLART ELODIE et SIMON	170 DE LA POIRIERE	LE MAUNIT	49320	CHEMELIER	35.4	\N	\N	47.2	\N	23.6	\N	\N	29.5	0	0.25	0.05	24	0.4	6	Sortant	\N	\N	LEBRETON ROLAND	\N	PAV-T3	6430	\N	NON	TN100	PAV	72	18988	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
28	1	14	1-2105-C	PZEDL1075491	11	150	2020-10-22 00:00:00	6	EL BCHIRI AZIZ 	3 DES CHARMES	\N	49370	LE LOUROUX BECONNAIS	45	\N	\N	60	\N	30	\N	\N	37.5	0	0.25	0.05	24	0.4	31	Sortant	2021-05-05 07:14:56.859742	\N	DYVRANDE PATRICK ET MARTINE	\N	PAV-T4	5867	\N	NON	TN100 PAV T4	PAVILLON	91.12	S18550-E19771	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
29	1	15	1-2105-C	PZEDL1075491	11	150	2020-10-27 00:00:00	6	SOUQUET LAURA	131 AVENUE RENE GASNIER	\N	49100	ANGERS	45	\N	\N	60	\N	30	\N	\N	37.5	0	0.25	0.05	24	0.4	8	Sortant	2021-05-05 07:14:56.859742	\N	AUGER STEPHANE	\N	PAV-T4	24920	\N	NON	TN100 PAV T4	PAVILLON	70	19727	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
30	1	16	1-2105-C	PZEDL1075491	11	90	2020-10-29 00:00:00	6	CALLOCH EMMA BEUCHARD CORENTIN	47 RUE DES ARENES	\N	49700	DOUE LA FONTAINE	27	\N	\N	36	\N	18	\N	\N	22.5	0	0.25	0.05	24	0.4	6	Sortant	2021-05-05 07:14:56.859742	\N	ZOE IMMO SCI BERNARD ANTHONY	\N	APPT-F3	24936	\N	NON	TN100 APPT F3	APPARTEMENT	59.50	18838	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
31	1	17	1-2105-C	PZEDL1075491	11	190	2020-10-29 00:00:00	6	PELTIER AMELIE	12 RUE DE LA CROIX VERTE	\N	49620	CORNE	57	\N	\N	76	\N	38	\N	\N	47.5	0	0.25	0.05	24	0.4	6	Sortant	2021-05-05 07:14:56.859742	\N	DUREAU GILLES	\N	PAV-T6	9283	\N	NON	TN100 PAV T6	PAVILLON	138	S18819-E19204	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
32	1	18	1-2105-C	PZEDL1075491	11	80	2020-10-30 00:00:00	6	VEYRUNES SONIA	34 AVENUE DE LA BLANCHERAIE	LE CLAIR LOGIS	49100	ANGERS	24	\N	\N	32	\N	16	\N	\N	20	0	0.25	0.05	24	0.4	6	Sortant	2021-05-05 07:14:56.859742	\N	LE VRAUX  DENIS	\N	APPT-F1	3344	\N	NON	TN100 APPT F1	APPARTEMENT	30	S19864-E19994	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
34	1	20	1-2105-C	PZEDL1075491	11	90	2020-10-31 00:00:00	6	DUTHE JEREMY	 IMPASSE DE LA BOULAYE	\N	49320	BRISSAC	27	\N	\N	36	\N	18	\N	\N	22.5	0	0.25	0.05	24	0.4	6	Sortant	2021-05-05 07:14:56.859742	\N	LA BOULAYE 	\N	APPT-F3	23540	\N	NON	TN100 APPT F3	APPARTEMENT	48	S18795-E19013	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
35	1	21	1-2105-C	PZEDL1075491	11	180	2020-10-31 00:00:00	6	DOUASS MOHAMED - SOUFiANE	5 ALLEE DES BARRIERES	\N	49750	BEAULIEU SUR LAYON	54	\N	\N	72	\N	36	\N	\N	45	0	0.25	0.05	24	0.4	6	Sortant	2021-05-05 07:14:56.859742	\N	TESNIER 	\N	PAV-T5	3768	\N	NON	TN100 PAV T5	PAV	130	S19356-E19478	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
50	1	36	\N	PZEDL1075491	11	\N	2020-11-19 00:00:00	6	PALAYER MAEVA	14 RUE JACQUES IBER	\N	49000	ANGERS	27	\N	\N	36	\N	18	\N	\N	22.5	0	0.25	0.05	24	0.4	6	Sortant	\N	\N	HANSEN PERRINE	\N	APPT-F3	18380	\N	NON	TN100 APPT F3	APPARTEMENT	68	19159	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
51	1	37	\N	PZEDL1075491	11	\N	2020-11-25 00:00:00	6	DONNEZ JEAN VINCENT	 Lieu dit L'HERMITAGE	En sortant de Bécon les Granit à gauche	49370	BECON LES GRANITS	29.4	\N	\N	39.2	\N	19.6	\N	\N	24.5	0	0.25	0.05	24	0.4	6	Sortant	\N	\N	MARION MADELEINE	\N	PAV-T2	2930	\N	NON	TN100 PAV T2	PAVILLON	37	20174	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
52	1	38	\N	PZEDL1075491	11	\N	2020-11-30 00:00:00	6	BOUSSEAU - BOURLET NICOLAS - CELINE	20 BEAUDRU DE VAUBRUN	\N	49170	ST  GEORGES SUR LOIRE	54	\N	\N	72	\N	36	\N	\N	45	0	0.25	0.05	24	0.4	6	Sortant	\N	\N	BOUGET Joseph et Marie-Thérèse	\N	PAV-T5	4921	\N	NON	TN100 PAV T5	PAVILLON	110	S18940-E20196	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
54	1	40	\N	PZEDL1075491	11	\N	2020-11-30 00:00:00	6	LAMBERT EMILIE	83 BOULEVARD ALBERT CAMUS	RESIDENCE LA GARENNE	49000	ANGERS	25.5	\N	\N	34	\N	17	\N	\N	21.25	0	0.25	0.05	24	0.4	6	Sortant	\N	\N	SACKSTEDER FABIEN	\N	APPT-F2	5302	\N	NON	TN100 APPT F2	APPARTEMENT	61	S29575-E20034	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
55	1	41	\N	PZEDL1075491	11	\N	2020-11-30 00:00:00	6	GENETEAU JACQUES ET ALICIA	47 RUE DES ARENES	\N	49700	DOUE LA FONTAINE	25.5	\N	\N	34	\N	17	\N	\N	21.25	0	0.25	0.05	24	0.4	6	Sortant	\N	\N	ZOE IMMOBILIER 	\N	APPT-F2	1438	\N	NON	TN100 APPT F2	APPARTEMENT	23	20350	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
69	1	55	\N	PZEDL1075491	11	\N	2020-11-14 00:00:00	9	ANGEVIN JEANNINE	12 RUE BOTANIQUE	2 ème étage porte de droite	49100	ANGERS	25.5	\N	\N	34	\N	17	\N	\N	21.25	0	0.25	0.05	24	0.4	6	Sortant	\N	\N	SCI VIAXAR M. ET MME MASSIN LE GOFF	\N	APPT TYPE F2	2690	\N	NON	TN100 APPT F2	APPARTEMENT	40	S20176-E20224	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
73	1	61	\N	PZEDL1075491	11	\N	2020-11-03 00:00:00	11	AUPIAIS DAVID	2 RUE DU PETIT ANJOU	\N	49290	CHALONNES	25.5	\N	\N	34	\N	17	\N	\N	21.25	0	0.25	0.05	24	0.4	11	Sortant	\N	\N	FOUCAULT ANTOINE	\N	APPT-F2	22848	\N	NON	TN100 APPT F2	APPARTEMENT	37	20155	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
74	1	62	\N	PZEDL1075491	11	\N	2020-11-07 00:00:00	11	FUSEAU AMANDINE	8  RUE BASILE GABORY	\N	49125	TIERCE	25.5	\N	\N	34	\N	17	\N	\N	21.25	0	0.25	0.05	24	0.4	11	Sortant	\N	\N	HOMAT-CHAVY 	\N	APPT-F2	8233	\N	NON	TN100 APPT F2	APPT	42.16	19855	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
75	1	63	\N	PZEDL1075491	11	\N	2020-11-09 00:00:00	11	ROBERT JOSEPH	52 RUE JULES GUITTON	DROITE	49100	ANGERS	25.5	\N	\N	34	\N	17	\N	\N	21.25	0	0.25	0.05	24	0.4	11	Sortant	\N	\N	ARNOLD JEAN FRANCOIS	\N	APPT-F2	2463	\N	NON	TN100 APPT F2	APPARTEMENT	36	S19869 E20029	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
58	1	44	1-2105-C	PZEDL1075491	11	98	2020-10-14 00:00:00	9	BLOUIN NICOLAS	3 IMPASSE DES HIRONDELLES	\N	49140	BAUNE	29.4	\N	\N	39.2	\N	19.6	\N	\N	0	0	0.25	0.05	24	0.4	31	Sortant	2021-05-05 07:14:56.859742	\N	FORGET LUDOVIC	\N	PAV-T2	10206	\N	NON	TN100 PAV T2	PAV	33.44	19726	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
64	1	50	1-2105-C	PZEDL1075491	11	118	2020-10-30 00:00:00	9	COUTAULT CHRISTOPHE - GAELLE	71  GRANDE RUE	\N	49440	CHALLAIN LA POTHERIE	35.4	\N	\N	47.2	\N	23.6	\N	\N	29.5	0	0.25	0.05	24	0.4	6	Sortant	2021-05-05 07:14:56.859742	\N	HELLEISEN 	\N	PAV-T3	9937	\N	NON	TN100 PAV T3	PAVILLON	71	18849	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
59	1	45	1-2105-C	PZEDL1075491	11	85	2020-10-21 00:00:00	9	POULET JONATHAN	175 DE LA REPUBLIQUE	Rés.Pablo Picasso bat K	49800	TRELAZE	25.5	\N	\N	34	\N	17	\N	\N	21.25	0	0.25	0.05	24	0.4	11	Sortant	2021-05-05 07:14:56.859742	\N	LEOCAT MORGAN	\N	APPT-F2	1484	\N	NON	TN100	APPT	38.49	19310	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
60	1	46	1-2105-C	PZEDL1075491	11	90	2020-10-22 00:00:00	9	GARNIER Benjamin et Adeline	20 RUE THIERS	RESIDENCE COTE MAINE	49100	ANGERS	27	\N	\N	36	\N	18	\N	\N	22.5	0	0.25	0.05	24	0.4	31	Sortant	2021-05-05 07:14:56.859742	\N	MARTORELL GERARD	\N	APPT TYPE F3	10519	\N	NON	TN100	APPT	71.45	19706	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
61	1	47	1-2105-C	PZEDL1075491	11	90	2020-10-23 00:00:00	9	KOCHARYAN SONA	 12 ALLEE GEORGES POMPIDOU	LES TERRASSES DE L'ABBAYE	49100	ANGERS	27	\N	\N	36	\N	18	\N	\N	22.5	0	0.25	0.05	24	0.4	8	Sortant	2021-05-05 07:14:56.859742	\N	LA CALANDRE 	\N	APPT TYPE F3	2692	\N	NON	TN100	APPARTEMENT	18	18718	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
63	1	49	1-2105-C	PZEDL1075491	11	85	2020-10-28 00:00:00	9	CHAUVEAUX VIVIAN	31  RUE ERNEST RENAN	RESIDENCE LES TERRASSES DE L'OUDON	49500	SEGRE	25.5	\N	\N	34	\N	17	\N	\N	21.25	0	0.25	0.05	24	0.4	8	Sortant	2021-05-05 07:14:56.859742	\N	BJCSF BOYER SEBASTIEN	\N	APPT TYPE F2	2050	\N	NON	TN100	APPT	\N	S18904-E19904	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
72	1	60	1-2105-C	PZEDL1075491	11	85	2020-10-30 00:00:00	11	LE GURUDEC LAETITIA	33 33 RUE SAINT EXUPERY	\N	49100	ANGERS	25.5	\N	\N	34	\N	17	\N	\N	21.25	0	0.25	0.05	24	0.4	8	Sortant	2021-05-05 07:14:56.859742	\N	 FOURREAU James et Odile	\N	APPT TYPE F2	6716	\N	NON	TN100 APPT F1	APPARTEMENT	24	18887	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t	t	Anomalie non bloquante traite en  F2	t
66	1	52	1-2105-C	PZEDL1075491	11	127.5	2020-10-31 00:00:00	9	MOUNIRI HASSAN	2 bis RUE DU LION D'OR	\N	49290	CHALONNES SUR LOIRE	38.25	\N	\N	51	\N	25.5	\N	\N	31.875	0	0.25	0.05	24	0.4	8	Sortant	2021-05-05 07:14:56.859742	\N	VERRON MAURICE	\N	APPT-F2	23124	\N	OUI	TN150 APPT F3	APPARTEMENT	81.66	19731	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t	t	Anomalie non bloquante traite en  F2	t
70	1	56	\N	PZEDL1075491	11	\N	2020-11-25 00:00:00	9	FEILLU ANDREA	5  RUE NATIONALE	\N	49170	SAINT GEORGES SUR LOIRE	25.5	\N	\N	34	\N	17	\N	\N	21.25	0	0.25	0.05	24	0.4	6	Sortant	\N	\N	THOUIN ALAIN ET NATHALIE	\N	APPT TYPE F2	6299	\N	NON	TN100	APPT	NON	20092	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
71	1	57	\N	PZEDL1075491	11	\N	2020-11-26 00:00:00	9	CHAUVIN LAUREEN	8  LOT LES VALONS DU LOIR	\N	49430	BARACE	35.4	\N	\N	47.2	\N	23.6	\N	\N	29.5	0	0.25	0.05	24	0.4	6	Sortant	\N	\N	FOUQUERON DELALANDE JACKY-ISABELLE	\N	PAV-T3	9654	\N	NON	TN100	PAV	75	19371	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
57	1	43	1-2105-C	PZEDL1075491	11	85	2020-10-10 00:00:00	9	BARANGER THIBAUD	2 DE LA FONTAINE	\N	49220	GREZ NEUVILLE	25.5	\N	\N	34	\N	17	\N	\N	21.25	0	0.25	0.05	24	0.4	11	Sortant	2021-05-05 07:14:56.859742	\N	GILARD THIERRY	\N	APPT-F2	1436	\N	NON	TN100 APPT F2	APPT	30.4	19489	0.15	31	0.01	11	0.04	24	0.01	8	0.01	8	0.03	29	0.01	10	0.02	10	0.02	f	t	\N	t
62	1	48	1-2105-C	PZEDL1075491	11	150	2020-10-28 00:00:00	9	MOREAU KARINE	8 RUE DES FORGES	\N	49500	SEGRE EN ANJOU	45	\N	\N	60	\N	30	\N	\N	37.5	0	0.25	0.05	24	0.4	8	Sortant	2021-05-05 07:14:56.859742	\N	GRAVELEAU CEDRIC	\N	PAV-T4	24926	\N	NON	TN100 PAV T4	PAVILLON	89.65	19859	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
65	1	51	1-2105-C	PZEDL1075491	11	150	2020-10-30 00:00:00	9	DIERIEX HERICKSON	49 ALLEE DE BEAU SOLEIL	\N	49460	FENEU	45	\N	\N	60	\N	30	\N	\N	37.5	0	0.25	0.05	24	0.4	6	Sortant	2021-05-05 07:14:56.859742	\N	RABOUIN MARYSE	\N	PAV-T4	8922	\N	NON	TN100 PAV T4	PAVILLON	76	S19549-E19551	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
76	1	64	\N	PZEDL1075491	11	\N	2020-11-10 00:00:00	11	PERRAUDEAU CYRIL	16 RUE CAMILLE PERDRIAU	\N	49130	LES PONTS DE CE	24	\N	\N	32	\N	16	\N	\N	20	0	0.25	0.05	24	0.4	11	Sortant	\N	\N	SCI BERTAY BLANVILLAIN 	\N	APPT-F1	2772	\N	NON	TN100 APPT F1	APPARTEMENT	25	19740	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
77	1	65	\N	PZEDL1075491	11	\N	2020-11-13 00:00:00	11	TRIBALLIER - BOIZARD MARIA - THIBAULT	55 RUE LAMARTINE	\N	49500	SEGRE	27	\N	\N	36	\N	18	\N	\N	22.5	0	0.25	0.05	24	0.4	11	Sortant	\N	\N	JOB GUILLAUME	\N	APPT-F3	5372	\N	NON	TN100 APPT F3	APPARTEMENT	58.4	E20154 S19126	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
79	1	88	\N	PZEDL1075491	11	\N	2020-11-16 00:00:00	9	MADIOT ANTHONY	21 RUE DU MAIL	\N	49100	ANGERS	24	\N	\N	32	\N	16	\N	\N	20	0	0.25	0.05	24	0.4	6	Sortant	\N	\N	SCI MAIL 49 Monsieur BIEULES	\N	APPT-F1	25028	\N	NON	TN100 APPT F1	APPARTEMENT	22	20111	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
84	1	93	\N	PZEDL1075491	11	\N	2020-11-30 00:00:00	9	GUEFFIER & PRAT RACHEL & ETIENNE	 22 RUE DES LICES	\N	49100	ANGERS	0	\N	\N	0	\N	0	\N	\N	21.25	0	0.25	0.05	24	0.4	6	Sortant	\N	\N	MORIN JEREMY	\N	APPT TYPE F2	2455	\N	NON	TN100 APPT F2	APPARTEMENT	69.88	19408	0.15	31	0.01	22	0.04	24	0.01	8	0.01	22	0.03	29	0.01	10	0.02	10	0.02	f	t	\N	t
87	2	66	\N	PZEDL1270215	11	\N	2020-09-15 00:00:00	15	GESLIN  CASSARD JOHNNY  CECILE	1 DE L'ARMORIAL	\N	44300	NANTES	25.5	\N	\N	34	\N	17	\N	\N	21.25	0	0.25	0.05	24	0.4	31	Sortant	\N	\N	CARDIN ANDRE	\N	APPT-F2	24699	\N	NON	TN100 APPT F2	APPARTEMENT	50.50	19085	0.15	31	0.01	36	0.04	24	0.01	8	0.01	36	0.03	29	0.01	29	0.02	29	0.02	f	t	\N	t
88	2	67	\N	PZEDL1270215	11	\N	2020-09-17 00:00:00	15	FAVREAU GWENDOLINE	8 DE LA HALTINIERE	RESIDENCE LES OCEANIDES 2	44300	NANTES	24	\N	\N	32	\N	16	\N	\N	20	0	0.25	0.05	24	0.4	31	Sortant	\N	\N	JOUENNE DIDIER	\N	APPT-F1	24706	\N	NON	TN100 APPT F1	APPARTEMENT	27	19477	0.15	31	0.01	36	0.04	24	0.01	8	0.01	36	0.03	29	0.01	29	0.02	29	0.02	f	t	\N	t
89	2	68	\N	PZEDL1270215	11	\N	2020-09-17 00:00:00	15	LOHIER ERWAN	356 DE SAINT JOSEPH	\N	44300	NANTES	25.5	\N	\N	34	\N	17	\N	\N	21.25	0	0.25	0.05	24	0.4	31	Sortant	\N	\N	GUILLEMAND PASCAL	\N	APPT-F2	24708	\N	NON	TN100 APPT F2	APPARTEMENT	26.20	19116	0.15	31	0.01	6	0.04	24	0.01	8	0.01	6	0.03	29	0.01	10	0.02	10	0.02	f	t	\N	t
90	2	69	\N	PZEDL1270215	11	\N	2020-09-21 00:00:00	15	MARTEL / NGUYEN / ORTIZ LEMUS LUNA/PHUONG TRINH/ ANA LAURA	3 VELASQUEZ	\N	44300	NANTES	30	\N	\N	40	\N	20	\N	\N	25	0	0.25	0.05	24	0.4	31	Sortant	\N	\N	BRETIN GAEL	\N	APPT-F4	24726	\N	NON	TN100 APPT F4	APPARTEMENT	77.56	19123	0.15	11	0.01	6	0.04	24	0.01	8	0.01	6	0.03	29	0.01	10	0.02	10	0.02	f	t	\N	t
91	2	70	\N	PZEDL1270215	11	\N	2020-09-21 00:00:00	15	LE PESQUER – SORDOT ALAN  MARGUERITE	14 DU MARQUIS DE MAUBREIL	\N	44470	CARQUEFOU	27	\N	\N	36	\N	18	\N	\N	22.5	0	0.25	0.05	24	0.4	31	Sortant	\N	\N	ROCHEFORT YANN	\N	APPT-F3	24727	\N	NON	TN100 APPT F3	APPARTEMENT	66.17	19161	0.15	31	0.01	8	0.04	8	0.01	8	0.01	8	0.03	29	0.01	10	0.02	10	0.02	f	t	\N	t
92	2	71	\N	PZEDL1270215	11	\N	2020-09-24 00:00:00	15	GERARDIN MARIE	46 DE LA DUCHESSE	\N	44100	NANTES	27	\N	\N	36	\N	18	\N	\N	22.5	0	0.25	0.05	24	0.4	31	Sortant	\N	\N	HERVOUET NATHALIE	\N	APPT-F3	24735	\N	NON	TN100 APPT F3	APPARTEMENT	65	19231	0.15	31	0.01	6	0.04	24	0.01	8	0.01	6	0.03	29	0.01	10	0.02	10	0.02	f	t	\N	t
94	2	73	\N	PZEDL1270215	11	\N	2020-10-09 00:00:00	15	PIAU DAVID	9 DU CHAMP DE MANOEUVRE	LA CLAVERIERE II	44470	CARQUEFOU	24	\N	\N	32	\N	16	\N	\N	20	0	0.25	0.05	24	0.4	31	Sortant	\N	\N	CREAC'H DOMINIQUE MARTINE	\N	APPT-F1	24772	\N	NON	TN100 APPT F1	APPARTEMENT	21.96	19846	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
95	2	74	\N	PZEDL1270215	11	\N	2020-10-12 00:00:00	15	COUILLON-ARNAUD SYLVIE	56 DE LA MAINGUAIS	LES VILLAS DU HOUSSEAU	44470	CARQUEFOU	54	\N	\N	72	\N	36	\N	\N	45	0	0.25	0.05	24	0.4	31	Sortant	\N	\N	CHARRIE PATRICK	\N	PAV-T5	24840	\N	NON	TN100 PAV T5	PAVILLON	95.58	19335	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
96	2	75	\N	PZEDL1270215	11	\N	2020-10-14 00:00:00	15	HIZEMBERT ROMUALD	15 DES CEPS DE VIGNES	LA SAVARIAIS	44850	LE CELLIER	45	\N	\N	60	\N	30	\N	\N	37.5	0	0.25	0.05	24	0.4	31	Sortant	\N	\N	PERRAY PATRICK  PAULETTE	\N	PAV-T4	24855	\N	NON	TN100 PAV T4	PAVILLON	105.60	19113	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
97	2	76	\N	PZEDL1270215	11	\N	2020-10-28 00:00:00	15	BOURGINE JUANNICK	 3 RUE DU HAUT LAUNAY	\N	44300	NANTES	25.5	\N	\N	34	\N	17	\N	\N	21.25	0	0.25	0.05	24	0.4	31	Sortant	\N	\N	PARE ERIC  ESTELLE	\N	APPT-F2	24928	\N	NON	TN100 APPT F2	APPARTEMENT	49.66	19842	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
98	2	77	\N	PZEDL1270215	31	\N	2020-11-03 00:00:00	15	PERRIN STEPHANE  KARINE	1 DU HAUT LAUNAY	\N	44300	NANTES	25.5	\N	\N	34	\N	17	\N	\N	21.25	0	0.25	0.05	24	0.4	31	Sortant	\N	\N	ROSSIGNOL ALINE	\N	APPT-F2	24963	\N	NON	TN100 APPT F2	APPARTEMENT	34	19845	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
99	2	86	\N	PZEDL1270215	31	\N	2020-11-24 00:00:00	26	BLANCHARD PHILIPPE  DOMINIQUE	10 COPERNIC	\N	44470	CARQUEFOU	27	\N	\N	36	\N	18	\N	\N	22.5	0	0.25	0.05	24	0.4	26	Sortant	\N	\N	ESLAN MARCEL	\N	APPT-F3	23868	\N	NON	TN100 APPT F3	APPARTEMENT	68	17502	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
83	1	92	\N	PZEDL1075491	11	\N	2020-11-30 00:00:00	9	DESLANDES MORGAN	15 G DE LETENDUERE	\N	49000	ANGERS	0	\N	\N	0	\N	0	\N	\N	30	0	0.25	0.05	24	0.4	6	Sortant	\N	\N	SCI RICO FLO ERIC	\N	APPT-F1	4192	\N	OUI	TN150 APPT F1	APPARTEMENT	32.07	20024	0.15	31	0.01	22	0.04	24	0.01	8	0.01	22	0.03	29	0.01	10	0.02	10	0.02	t	t	Anomalie non bloquante traite en  1 	t
82	1	91	\N	PZEDL1075491	11	\N	2020-11-27 00:00:00	9	GAUVIN - LEMAIRE JULIAN - LUCIE	165 FERDINAND VEST	MAISON DE GAUCHE	49800	TRELAZE	0	\N	\N	0	\N	0	\N	\N	29.5	0	0.25	0.05	24	0.4	6	Sortant	\N	\N	BERTAY VEILLON 	\N	PAV-T3	21460	\N	NON	TN100	PAV	73.25	19613	0.15	31	0.01	22	0.04	24	0.01	8	0.01	22	0.03	29	0.01	10	0.02	10	0.02	f	t	\N	t
85	1	94	\N	PZEDL1075491	11	\N	2020-11-30 00:00:00	9	BOCHEREAU CATHERINE	49  AVENUE PATTON	RESIDENCE PATTON BAT B	49000	ANGERS	0	\N	\N	0	\N	0	\N	\N	22.5	0	0.25	0.05	24	0.4	6	Sortant	\N	\N	GRISON 	\N	APPT TYPE F3	4883	\N	NON	TN100 APPT F2	APPARTEMENT	30	20011	0.15	31	0.01	22	0.04	24	0.01	8	0.01	22	0.03	29	0.01	10	0.02	10	0.02	t	t	Anomalie non bloquante traite en  F3	t
93	2	72	\N	PZEDL1270215	11	\N	2020-09-30 00:00:00	15	DUPAS JOSEPHINE	12 BOUCHER D'ARGIS	\N	44470	CARQUEFOU	36	\N	\N	48	\N	24	\N	\N	30	0	0.25	0.05	24	0.4	31	Sortant	\N	\N	DONVAL BERTRAND  AMINA	\N	APPT-F1	24770	\N	OUI	TN150 APPT F1	APPARTEMENT	20.56	19325	0.15	31	0.01	24	0.04	24	0.01	8	0.01	24	0.03	29	0.01	10	0.02	10	0.02	t	t	Anomalie non bloquante traite en  1 	t
86	1	95	1-2105-C	PZEDL1075491	11	85	2020-10-08 00:00:00	28	CHAN CHRISTOPHE	17 GRANDE RUE	\N	53200	CHATEAU GONTIER	25.5	\N	\N	34	\N	17	\N	\N	21.25	0	0.25	0.05	24	0.4	11	Sortant	2021-05-05 07:14:56.859742	\N	CONSIDERE ADELE	\N	APPT-F2	11591	\N	NON	TN100	APPT	37	19700	0.15	31	0.01	22	0.04	24	0.01	8	0.01	22	0.03	29	0.01	10	0.02	10	0.02	f	t	\N	t
78	1	78	1-2105-C	PZEDL1075491	11	150	2020-10-01 00:00:00	16	MADIOT ANTHONY	2 DE LA MAIRIE	\N	49770	LA MEIGNANNE	45	\N	\N	60	\N	30	\N	\N	37.5	0	0.25	0.05	24	0.4	8	Sortant	2021-05-05 07:14:56.859742	\N	ARNOLD JEAN FRANCOIS 	\N	PAV-T4	2748	\N	NON	TN100 PAV T4	PAVILLON	92.94	19542	0.15	31	0.01	24	0.04	24	0.01	8	0.01	24	0.03	29	0.01	29	0.02	29	0.02	f	t	\N	t
100	2	87	\N	PZEDL1270215	31	\N	2020-11-24 00:00:00	26	HERSANT SERREAU NELLY 	 114 RUE DES VIGNERONS	\N	44150	ANCENIS	45	\N	\N	60	\N	30	\N	\N	37.5	0	0.25	0.05	24	0.4	26	Sortant	\N	\N	SERBE JOSEPH	\N	PAV-T4	25050	\N	NON	TN100 PAV T4	PAVILLON	85	19233	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
102	5	58	\N	PZEDL127034	11	\N	2020-11-04 00:00:00	11	MAYARD THIBAULT	 KERHUELLA	\N	29790	MAHALON	45	\N	\N	60	\N	30	\N	\N	35	0	0.25	0.05	24	0.4	11	Sortant	\N	\N	QUERE Georgette	\N	PAV-T4	24988	\N	NON	TN100 PAV T4	PAVILLON	80	19826	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
105	5	104	\N	PZEDL127034	3	\N	2020-10-03 00:00:00	31	GUILLAMET ARION ALAN ANAIS	14 AMIRAL RONARCH	\N	29000	QUIMPER	27	\N	\N	36	\N	18	\N	\N	20	0	0.25	0.05	24	0.4	11	Sortant	\N	\N	JACQ RAOUL 	\N	APPT-F3	24805	\N	NON	TN100 APPT F3	APPARTEMENT	82.73	19255	0.15	31	0.01	31	0.04	24	0.01	8	0.01	31	0.03	29	0.01	10	0.02	10	0.02	f	t	\N	t
106	5	105	\N	PZEDL127034	3	\N	2020-10-08 00:00:00	31	LOZACH THOMAS	4 BIENVENUE	\N	29000	QUIMPER	57	\N	\N	76	\N	38	\N	\N	35	0	0.25	0.05	24	0.4	31	Sortant	\N	\N	DROUET SEBASTIEN	\N	PAV-T6	24826	\N	NON	TN100 PAV T6	PAVILLON	163.43	19264	0.15	31	0.01	0	0.04	24	0.01	8	0.01	0	0.03	29	0.01	29	0.02	29	0.02	f	t	\N	t
108	5	107	\N	PZEDL127034	3	\N	2020-11-13 00:00:00	31	LE GARDIEN PIERRE YVES	2 JULES HENRIOT	\N	29000	QUIMPER	25.5	\N	\N	34	\N	17	\N	\N	20	0	0.25	0.05	24	0.4	31	Sortant	\N	\N	JACQ EMMANUEL	\N	APPT-F2	25015	\N	NON	TN100 APPT F2	APPARTEMENT	43	19922	0.15	31	0.01	22	0.04	24	0.01	8	0.01	22	0.03	29	0.01	10	0.02	10	0.02	f	t	\N	t
109	5	108	\N	PZEDL127034	3	\N	2020-11-30 00:00:00	31	RASETA Rabbin et Cécile	62 A QUAI DE L'ODET	\N	29000	QUIMPER	25.5	\N	\N	34	\N	17	\N	\N	20	0	0.25	0.05	24	0.4	31	Sortant	\N	\N	ABALAIN MYRIAM	\N	APPT-F2	25066	\N	NON	TN100 APPT F2	APPARTEMENT	50	20205	0.15	31	0.01	22	0.04	24	0.01	8	0.01	22	0.03	29	0.01	10	0.02	10	0.02	f	t	\N	t
110	5	109	\N	PZEDL127034	3	\N	2020-11-30 00:00:00	31	TREBAOL MARYLINE	55 DE LA FRENCE LIBRE	\N	29000	QUIMPER	45	\N	\N	60	\N	30	\N	\N	35	0	0.25	0.05	24	0.4	31	Sortant	\N	\N	GOYAT MICHEL	\N	PAV-T4	25067	\N	NON	TN100 PAV T4	PAVILLON	110	19716	0.15	31	0.01	22	0.04	24	0.01	8	0.01	22	0.03	29	0.01	10	0.02	10	0.02	f	t	\N	t
111	5	110	\N	PZEDL127034	3	\N	2020-10-16 00:00:00	11	RAYSSIGUIER CECILE	9 SAINTE THERESE	\N	29000	QUIMPER	25.5	\N	\N	34	\N	17	\N	\N	20	0	0.25	0.05	24	0.4	31	Sortant	\N	\N	SCI VANATUR IIMMO 	\N	APPT-F2	24860	\N	NON	TN100 APPT F2	APPARTEMENT	36.40	19570	0.15	31	0.01	11	0.04	24	0.01	8	0.01	0	0.03	29	0.01	29	0.02	29	0.02	f	t	\N	t
112	5	111	\N	PZEDL127034	3	\N	2020-10-17 00:00:00	11	SCHAEFFER et GILLAIZEAU Charles et Stefy	3 HENT AR GLUJAR	\N	29000	QUIMPER	25.5	\N	\N	34	\N	17	\N	\N	20	0	0.25	0.05	24	0.4	11	Sortant	\N	\N	FILEUX et MULET ALEXANDRA  JULIEN	\N	APPT-F2	24861	\N	NON	TN100 APPT F2	APPARTEMENT	46.60	19687	0.15	31	0.01	31	0.04	24	0.01	8	0.01	31	0.03	29	0.01	10	0.02	10	0.02	f	t	\N	t
113	5	112	\N	PZEDL127034	3	\N	2020-10-31 00:00:00	11	JONCOUR MARIE LOUISE	4 EMILE LEMOINE	\N	29000	QUIMPER	27	\N	\N	36	\N	18	\N	\N	20	0	0.25	0.05	24	0.4	31	Sortant	\N	\N	DESSARTRE MARC  NICOLE	\N	APPT-F3	24943	\N	NON	TN100 APPT F3	APPARTEMENT	63.88	19733	0.15	31	0.01	24	0.04	24	0.01	8	0.01	24	0.03	29	0.01	29	0.02	29	0.02	f	t	\N	t
114	5	113	\N	PZEDL127034	3	\N	2020-11-10 00:00:00	11	ROSARIA PEDRO SOUSA OLIVEIRA	27 DE L'EGLANTINE	\N	29000	QUIMPER	27	\N	\N	36	\N	18	\N	\N	20	0	0.25	0.05	24	0.4	31	Sortant	\N	\N	QUEINNEC MICHELINE	\N	APPT-F3	25005	\N	NON	TN100 APPT F3	APPARTEMENT	55	19677	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
2	4	97	\N	PZEDL120020	11	\N	2020-10-29 00:00:00	28	KAVADACOGLOU KIMBERLY	1 RUE DU BOURGNEUF	\N	53240	LA BACONNIERE	35.4	\N	\N	47.2	\N	23.6	\N	\N	29.5	0	0.25	0.05	24	0.4	11	Sortant	\N	\N	DELALONDE SEBASTIEN	\N	PAV-T3	17507	\N	NON	TN100 PAV T3	PAVILLON	83.51	19775	0.15	31	0.01	22	0.04	24	0.01	8	0.01	22	0.03	29	0.01	10	0.02	10	0.02	f	t	\N	t
104	5	103	\N	PZEDL127034	3	\N	2020-10-03 00:00:00	31	FORTIN  DELATTRE MATHILDE ANTOINE	2 RUE ELIE FRERON	\N	29000	QUIMPER	38.25	\N	\N	51	\N	25.5	\N	\N	20	0	0.25	0.05	24	0.4	11	Sortant	\N	\N	VANATUR IMMO 	\N	APPT-F2	24756	\N	OUI	TN150 APPT F2	APPARTEMENT	36.60	19379	0.15	31	0.01	0	0.04	24	0.01	8	0.01	0	0.03	29	0.01	29	0.02	29	0.02	t	t	Anomalie non bloquante traite en  2 	t
26	1	12	1-2105-C	PZEDL1075491	11	80	2020-10-16 00:00:00	6	ANDORIN - HUMBERT THOMAS - HELENE	33 RUE BOISNET	A GAUCHE 1 PORTE DROITE	49100	ANGERS	24	\N	\N	32	\N	16	\N	\N	20	0	0.25	0.05	24	0.4	11	Sortant	2021-05-05 07:14:56.859742	\N	LEMARCHAND LUC	\N	APPT-F1	17584	\N	NON	TN100	APPT	22	S19402-E19945	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
53	1	39	\N	PZEDL1075491	11	\N	2020-11-30 00:00:00	6	CORTINOVIS et THEZE LOUISE et AXEL	33BIS RUE DU MARAIS	\N	49290	CHALONNES SUR LOIRE	27	\N	\N	36	\N	18	\N	\N	22.5	0	0.25	0.05	24	0.4	6	Sortant	\N	\N	KINEDIET- CALONNA BLANC	\N	APPT-F3	18671	\N	NON	TN100	APPT	58.75	20194	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
68	1	54	\N	PZEDL1075491	11	\N	2020-11-02 00:00:00	9	ROUILLERE Cathy	2 CHEMIN DE LA CIGALE	\N	49330	CHATEAUNEUF SUR SARTHE	25.5	\N	\N	34	\N	17	\N	\N	21.25	0	0.25	0.05	24	0.4	6	Sortant	\N	\N	PREAUBERT PHILIPPE et FRANCETTE	\N	APPT TYPE F2	8257	\N	NON	TN100	APPARTEMENT	45.54	18873	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
80	1	89	\N	PZEDL1075491	11	\N	2020-11-21 00:00:00	9	RENOU BRUNO & THERESE	19 ARMAND BROUSSE	\N	49610	ST MELAINE SUR AUBANCE	35.4	\N	\N	47.2	\N	23.6	\N	\N	29.5	0	0.25	0.05	24	0.4	6	Sortant	\N	\N	DU COQ MOLLET DAGUET	\N	PAV-T3	18835	\N	NON	TN100	PAV	85	20044	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
81	1	90	\N	PZEDL1075491	11	\N	2020-11-27 00:00:00	9	MAHDJOUB MOHAMMED MEHDI	165 FERDINAND VEST	MAISON DE GAUCHE	49800	TRELAZE	35.4	\N	\N	47.2	\N	23.6	\N	\N	29.5	0	0.25	0.05	24	0.4	6	Sortant	\N	\N	BERTAY VEILLON 	\N	PAV-T3	21460	\N	NON	TN100	PAV	73.25	19613	0.15	31	0.01	22	0.04	24	0.01	8	0.01	22	0.03	29	0.01	10	0.02	10	0.02	f	t	\N	t
101	2	114	\N	PZEDL1270215	31	\N	2020-11-30 00:00:00	11	DE BONFILS LAVERNELLE GUILLEMETTE	7 CHEVERT	\N	44100	NANTES	36	\N	\N	48	\N	24	\N	\N	30	0	0.25	0.05	24	0.4	31	Sortant	\N	\N	SAS DUNE 	\N	APPT-F1	24550	\N	OUI	TN150 APPT F1	APPARTEMENT	22.03	20314	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t	t	Anomalie non bloquante traite en  1 	t
103	5	59	\N	PZEDL127034	11	\N	2020-11-20 00:00:00	11	GEORGES JOSETTE	21 RESIDENCE LES JARDINS DE KERYON	\N	29170	FOUESNANT	39	\N	\N	52	\N	26	\N	\N	35	0	0.25	0.05	24	0.4	11	Sortant	\N	\N	FABBRIZIOLI Roland et Christine	\N	PAV-T3	25045	\N	NON	TN100 PAV T3	PAVILLON	69.25	S20162 E20163	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
107	5	106	\N	PZEDL127034	3	\N	2020-10-24 00:00:00	31	LE NABAT MARINE	9 DE LA FONTAINE	\N	29000	QUIMPER	36	\N	\N	48	\N	24	\N	\N	15	0	0.25	0.05	24	0.4	31	Sortant	\N	\N	HUON DE PENANSTER MAUDE JEROME	\N	APPT-F1	24893	\N	OUI	TN150 APPT F1	APPARTEMENT	22.89	19803	0.15	31	0.01	31	0.04	24	0.01	8	0.01	31	0.03	29	0.01	10	0.02	10	0.02	t	t	Anomalie non bloquante traite en  1 	t
67	1	53	1-2105-C	PZEDL1075491	11	90	2020-10-31 00:00:00	9	MOEGEN ET TOUCHET SARAH	1 PASSAGE DES POELIERS	\N	49100	ANGERS	27	\N	\N	36	\N	18	\N	\N	22.5	0	0.25	0.05	24	0.4	8	Sortant	2021-05-05 07:14:56.859742	\N	HAZARD AUDE	\N	APPT-F3	5154	\N	NON	TN100	APPT	53.38	S18719-E19564	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
56	1	42	1-2105-C	PZEDL1075491	11	90	2020-10-02 00:00:00	9	GUINHUT Ludivine	2 CHARLES DE GAULLE	RESIDENCE LES TILLEULS	49330	CONTIGNE	27	\N	\N	36	\N	18	\N	\N	22.5	0	0.25	0.05	24	0.4	8	Sortant	2021-05-05 07:14:56.859742	\N	M3S49 	\N	APPT TYPE F3	3876	\N	NON	TN100 APPT F3	APPT	64.92	19544	0.15	31	0.01	8	0.04	24	0.01	8	0.01	8	0.03	29	0.01	10	0.02	10	0.02	f	t	\N	t
27	1	13	1-2105-C	PZEDL1075491	11	85	2020-10-22 00:00:00	6	BIGNON MARILYN	4 AVENUE VAUBAN	RESIDENCE LE PRESTRE	49000	ANGERS	25.5	\N	\N	34	\N	17	\N	\N	21.25	0	0.25	0.05	24	0.4	11	Sortant	2021-05-05 07:14:56.859742	\N	GLANDAIS - 81400 JEAN PHILIPPE ; 4493 - GLANDAIS 	\N	APPT-F2	4493	\N	NON	TN100	APPT	46	19849	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	f	t	\N	t
24	1	10	1-2105-C	PZEDL1075491	11	90	2020-10-14 00:00:00	6	UCLER FURKAN	1  RUE DE LA BELLE ANGEVINE	\N	49750	SAINT LAMBERT DU LATTAY	27	\N	\N	36	\N	18	\N	\N	22.5	0	0.25	0.05	24	0.4	11	Sortant	2021-05-05 07:14:56.859742	\N	FLORES PATRICK	\N	APPT-F3	2220	\N	NON	TN100 APPT F3	APPARTEMENT	70	19376	0.15	31	0.01	24	0.04	8	0.01	8	0.01	24	0.03	29	0.01	10	0.02	10	0.02	f	t	\N	t
18	1	4	1-2105-C	PZEDL1075491	11	127.5	2020-10-05 00:00:00	6	TAXIL BERANGERE	2 GRANDE RUE	 	49330	CHATEAUNEUF SUR SARTHE	38.25	\N	\N	51	\N	25.5	\N	\N	31.875	0	0.25	0.05	24	0.4	8	Sortant	2021-05-05 07:14:56.859742	\N	DAINVAUX DENISE DAINVAUX CLAUDE	\N	APPT-F2	10456	\N	OUI	TN150	APPT	37	S19263-E19494	0.15	31	0.01	16	0.04	24	0.01	8	0.01	16	0.03	29	0.01	10	0.02	10	0.02	f	t	\N	t
15	1	1	1-2105-C	PZEDL1075491	11	85	2020-10-01 00:00:00	6	SHIGETOMI et FLORENT AURELIA  ET MATTHIEU 	44 PIERRE MENDES FRANCE	RESIDENCE PICASSO - BATIMENT F	49800	TRELAZE	25.5	\N	\N	34	\N	17	\N	\N	21.25	0	0.25	0.05	24	0.4	8	Sortant	2021-05-05 07:14:56.859742	\N	GALINIER LAURENT et MURIEL	\N	APPT-F2	2926	\N	NON	TN100 APPT F2	APPT	43.82	18040	0.15	31	0.01	31	0.04	24	0.01	8	0.01	29	0.03	29	0.01	29	0.02	29	0.02	f	t	\N	t
\.


--
-- Data for Name: Negotiateur_History; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Negotiateur_History" (id, negotiateur_id, adresse, etat_client, cp, ville, pays, abonnement, date, visibility) FROM stdin;
1	1	SImbock	t	87500.0	Yaounde	France	\N	2021-05-01 10:52:15.657027	t
2	1	\N	t	\N	\N	\N	\N	2021-05-01 10:58:36.946564	t
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
1	1	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	0.5	11	0.14999999999999997	11	0.01	6	0.04	24	0.01	8	0.01	6	0.03	29	0.01	10	0.02	10	0.02	\N	\N	2021-05-05 07:27:49.628294	t
2	3	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	0.5	8	0.24999999999999997	0		0		0		0		0		29	0.01	10	0.02	10	0.02	\N	\N	2021-05-05 07:27:49.704248	t
3	4	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	0.5	11	0.14999999999999997	11	0.01	6	0.04	24	0.01	8	0.01	6	0.03	29	0.01	10	0.02	10	0.02	\N	\N	2021-05-05 07:27:49.777209	t
4	5	80	80	85	90	110	120	130	120	120	130	150	180	190	220	250	15	15	20	20	25	25	\N	25	25	25	35	35	35	45	45	0	0.5	3	0.14999999999999997	31	0.01	31	0.04	24	0.01	8	0.01	11	0.03	29	0.01	10	0.02	10	0.02	\N	\N	2021-05-05 07:27:49.904138	t
5	2	80	80	85	90	110	120	130	120	120	130	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	0.5	31	0.3	0		0		0		0		0		0		0		0		\N	\N	2021-05-05 07:27:49.995084	t
\.


--
-- Data for Name: facturation_client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.facturation_client (id, n_facture, "Montant_HT", client, "Date_de_creation", "Date_mission", "Date_reglement_client", missions_s, missions_f, "Statut", "Observations_suivi_paiement", "Date_première_relance", "Date_seconde_relance", "Date_mise_en_demeure", valide, visibility) FROM stdin;
1	1-2105-C	3987.0	1	2021-05-05 07:14:56.859742	2020-10-01 00:00:00	\N	\N	\N	paye	\N	\N	\N	\N	f	t
\.


--
-- Data for Name: facturation_mission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.facturation_mission (id, ref_mission, fact_mission, visibility) FROM stdin;
1	86	1	t
2	78	1	t
3	72	1	t
4	67	1	t
5	66	1	t
6	65	1	t
7	64	1	t
8	63	1	t
9	62	1	t
10	61	1	t
11	60	1	t
12	59	1	t
13	58	1	t
14	57	1	t
15	56	1	t
16	35	1	t
17	34	1	t
18	33	1	t
19	32	1	t
20	31	1	t
21	30	1	t
22	29	1	t
23	28	1	t
24	27	1	t
25	26	1	t
26	25	1	t
27	24	1	t
28	23	1	t
29	22	1	t
30	21	1	t
31	20	1	t
32	19	1	t
33	18	1	t
34	17	1	t
35	16	1	t
36	15	1	t
\.


--
-- Data for Name: prospect; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prospect (id, reference, "TYPE", societe, titre, nom, email, numero, siret, date_creation, visibility) FROM stdin;
\.


--
-- Data for Name: prospect_History; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."prospect_History" (id, prospect, adresse, cp, ville, pays, etat_client, date, visibility) FROM stdin;
\.


--
-- Data for Name: suivi_client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suivi_client (id, client, responsable, commentaire, date_creation, date_modif, visibility) FROM stdin;
\.


--
-- Data for Name: suivi_prospect; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suivi_prospect (id, prospect_id, responsable, commentaire, date_creation, date_modif, visibility) FROM stdin;
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

SELECT pg_catalog.setval('public."Client_History_id_seq"', 5, true);


--
-- Name: Client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Client_id_seq"', 5, true);


--
-- Name: Client_negotiateur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Client_negotiateur_id_seq"', 1, true);


--
-- Name: Expert_History_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Expert_History_id_seq"', 36, true);


--
-- Name: Expert_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Expert_id_seq"', 38, true);


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

SELECT pg_catalog.setval('public."Mission_id_seq"', 114, true);


--
-- Name: Negotiateur_History_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Negotiateur_History_id_seq"', 2, true);


--
-- Name: Tarif_base_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Tarif_base_id_seq"', 15, true);


--
-- Name: Tarifs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Tarifs_id_seq"', 5, true);


--
-- Name: facturation_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.facturation_client_id_seq', 1, true);


--
-- Name: facturation_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.facturation_mission_id_seq', 36, true);


--
-- Name: prospect_History_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."prospect_History_id_seq"', 1, false);


--
-- Name: prospect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prospect_id_seq', 1, false);


--
-- Name: seq_street_segment_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_street_segment_id', 6, true);


--
-- Name: suivi_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suivi_client_id_seq', 1, false);


--
-- Name: suivi_prospect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suivi_prospect_id_seq', 1, false);


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
-- Name: Facturation Facturation_expediteur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Facturation"
    ADD CONSTRAINT "Facturation_expediteur_fkey" FOREIGN KEY (expediteur) REFERENCES public."Expert"(id);


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
-- Name: Negotiateur_History Negotiateur_History_negotiateur_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Negotiateur_History"
    ADD CONSTRAINT "Negotiateur_History_negotiateur_id_fkey" FOREIGN KEY (negotiateur_id) REFERENCES public."Client_negotiateur"(id) ON UPDATE CASCADE ON DELETE CASCADE;


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
-- Name: suivi_prospect suivi_prospect_prospect_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suivi_prospect
    ADD CONSTRAINT suivi_prospect_prospect_id_fkey FOREIGN KEY (prospect_id) REFERENCES public.prospect(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

