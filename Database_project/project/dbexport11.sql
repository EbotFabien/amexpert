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
1	107801	CLIENT ACTIF	SARL GIC IMMOBILIER	barbaraimmobiliergic	Madame	barbara	\N	\N	379 315 211 00019	2021-06-10 18:17:51.270677	t
2	\N	ARRET COLLABORATION	ADCERTIS v.fouquet@adcertix.fr	\N	pour	jbm luzarches	\N	\N	nan	2021-06-10 18:17:52.668876	t
3	\N	ARRET COLLABORATION	ADCERTIS	\N	pour	jbm beaumont /oise	\N	\N	nan	2021-06-10 18:17:53.551371	t
4	\N	ARRET COLLABORATION	ADCERTIS	\N	pour	jbm ecouen	\N	\N	nan	2021-06-10 18:17:54.344921	t
5	\N	ARRET COLLABORATION	ADCERTIS	\N	pour	cmp conseil paris 15	\N	\N	nan	2021-06-10 18:17:55.194434	t
6	\N	INACTIF	LAFORET TOLBIAC IMMOBILIER	laforet	Monsieur	girault joel	\N	\N	nan	2021-06-10 18:17:56.04195	t
7	\N	INACTIF / ARRET COLLABORATION	KAPITAL PRESTIGE	\N	Mademoiselle	bui véronique	\N	\N	nan	2021-06-10 18:17:57.051372	t
8	\N	ARRET COLLABORATION	LAFORET IMMOBILIER	laforet	.	sas milestar	\N	\N	nan	2021-06-10 18:17:58.01982	t
9	\N	ARRET COLLABORATION	ADCERTIS	\N	pour	cabinet ngc	\N	\N	nan	2021-06-10 18:17:59.073217	t
10	\N	ARRET COLLABORATION	BOOK A FLAT	\N	Madame	de fouquieres géraldine	\N	\N	nan	2021-06-10 18:18:00.520397	t
28	109322	INACTIF	A.I.V.B	\N	Monsieur	maillard laurent	\N	\N	nan	2021-06-10 18:18:18.596072	t
11	1075491	CLIENT ACTIF	SARL LES 3 B - L'ADRESSE ANJOU MAINE	l'adresseanjoumainesarlles3b	Monsieur	blanvillain sebastien	\N	\N	48062859300075	2021-06-10 18:18:01.301951	t
12	\N	INACTIF	CABINET PORTELLI	orpi	Madame	gustave véronique	\N	\N	nan	2021-06-10 18:18:02.312373	t
13	\N	INACTIF	NEPTUNE IMMOBILIER LAFORET	laforet	Madame	boche catherine	\N	\N	nan	2021-06-10 18:18:03.71857	t
14	109215	INACTIF	ORPI AGENCE DU MARCHE	orpiagencedumarche	Madame	vilpellet m.l	\N	\N	nan	2021-06-10 18:18:04.688021	t
15	\N	ARRET DE COLLABORATION SUITE VENTE	LAFORET IMMOBILIER ALSEVE IMMO	\N	Monsieur	philippe christian	\N	\N	nan	2021-06-10 18:18:05.702437	t
40	109400	INACTIF	ARM - VI	\N	Monsieur	judet de la combe frédéric	\N	\N	nan	2021-06-10 18:18:30.008552	t
16	109205	INACTIF-ARRET COLLABORATION	NOUVEL ESPACE	nouvelespace	Mademoiselle	cadoret      leruez linda	\N	\N	400 951 307 00034	2021-06-10 18:18:06.72885	t
17	109910	REPRENDRE CONTACT	ORPI AGENCE MARTIN	\N	Madame	monnanteuil valérie	\N	\N	nan	2021-06-10 18:18:07.8752	t
29	109600	ARRET DE COLLABORATION	BR IMMOBILIER	brimmobilier	Monsieur	gavard pierre\nbeillerot cyril	\N	\N	nan	2021-06-10 18:18:19.687448	t
18	109256	INACTIF	LAFORET IMMOBILIER FRANCONVILLE	laforet	Monsieur	lucas olivier	\N	\N	nan	2021-06-10 18:18:08.906607	t
19	109223	INACTIF	AGENCE LE BAIL	\N	Monsieur	le bail	\N	\N	nan	2021-06-10 18:18:09.880051	t
20	109217	INACTIF / ARRET COLLABORATION	LUXURY HOMES	\N	Monsieur	pires jorges	\N	\N	nan	2021-06-10 18:18:10.787532	t
21	109216	ARRET CLIENT SUR VENTE  COMMERCE	EV'IMMO	\N	Madame	villard evelyne	\N	\N	nan	2021-06-10 18:18:11.873912	t
22	109221	ARRET CLIENT SUR VENTE  COMMERCE	CALYPSO IMMO	calysoimmo	Madame	dubreuil	\N	\N	nan	2021-06-10 18:18:12.679454	t
23	109220	INACTIF-ARRET COLLABORATION	PROXIMMONET	proximmonet	Madame	morillon sylvie	\N	\N	509 928 511 00054	2021-06-10 18:18:13.599925	t
30	109452	ARRET DE COLLABORATION	SARL IMMOASSOCIES GESTION	immoassociesgestion	Madame	barret stéphanie	\N	\N	nan	2021-06-10 18:18:20.535967	t
24	109950	INACTIF	AGENCE COEURET - IMMOBILIER	ccimmobiliergestion	Madame	cochet patricia	\N	\N	nan	2021-06-10 18:18:14.59336	t
25	109230	ARRET  COLLABORATION	CABINET LUTZ	cabinetlutz	Monsieur	lutz damien	\N	\N	nan	2021-06-10 18:18:15.5708	t
26	109310	INACTIF	.	\N	Mr et Mme	moreira da silva / dos santos	\N	\N	nan	2021-06-10 18:18:16.716145	t
27	109500	ARRET DE COLLABORATION	LAFORET - AQUI'INVEST 2 SARL	laforet	Monsieur	ridou vincent	\N	\N	nan	2021-06-10 18:18:17.569658	t
31	109330	ARRET DE COLLABORATION	IMMO33 ORPI	orpi	Madame	klotz emmanuelle	\N	\N	nan	2021-06-10 18:18:21.416462	t
41	109410	ARRET DE COLLABORATION	DB IMMO - LAFORET\nLAFORET - DB IMMO	laforet	Madame	carmona mélanie\nsanteri ségolène	\N	\N	nan	2021-06-10 18:18:30.830119	t
32	109550	REPRENDRE CONTACT	LAFORET ASF IMMO ANTONY	laforetantony	Madame	jouas barbara	\N	\N	nan	2021-06-10 18:18:22.389904	t
33	109340	ARRET DE COLLABORATION	LEGENDRE IMMOBILIER	legendreimmobilier	Monsieur	legendre	\N	\N	nan	2021-06-10 18:18:23.244422	t
34	\N	INACTIF	SEMAGES	\N	Monsieur	maury	\N	\N	nan	2021-06-10 18:18:24.113921	t
35	109350	INACTIF	BRILLANT IMMOBILIER	\N	Monsieur	brillant charles	\N	\N	nan	2021-06-10 18:18:25.076372	t
36	109360	INACTIF	CAP SARL	\N	Madame	castro	\N	\N	nan	2021-06-10 18:18:25.999845	t
37	109370	INACTIF	SCI CHALAND GIROUST BUSSY	\N	Monsieur	maillard laurent	\N	\N	nan	2021-06-10 18:18:26.881341	t
38	109380	INACTIF	SCI PLM	\N	Monsieur	maillard laurent	\N	\N	nan	2021-06-10 18:18:27.753841	t
39	109390	INACTIF	SCI PM INVESTISSEMENT	\N	Monsieur	maillard laurent	\N	\N	nan	2021-06-10 18:18:28.821232	t
50	109490	ARRET DE COLLABORATION	LUZARCHES IMMOBILIER	\N	Monsieur	mansoux michel	\N	\N	nan	2021-06-10 18:18:38.90251	t
42	109420	INACTIF	CABINET GUILLOUX	cabinetguilloux	Madame	guilloux marie-françoise	\N	\N	nan	2021-06-10 18:18:31.65365	t
43	109430	INACTIF	SOLVIMO	\N	Monsieur	duval eoche	\N	\N	nan	2021-06-10 18:18:32.658075	t
44	109440	INACTIF	AGENCIA	\N	Monsieur	bumba emmanuel	\N	\N	nan	2021-06-10 18:18:33.457618	t
46	109470	CLIENT inactif	AMCV - APPARTEMENTS ET MAISONS	amcv-appartementsetmaisons	Madame	pannetier aurore    pannetier philippe	\N	\N	509 243 820 00024	2021-06-10 18:18:35.190631	t
45	110280	ARRET DE COLLABORATION	LAFORET IMMOBILIER SARL RPI	laforetimmobiliersarlrpi	Madame	perrin marianne	\N	\N	nan	2021-06-10 18:18:34.292141	t
47	109630	ARRET DE COLLABORATION	PORTBAIL IMMOBILIER	\N	Monsieur	vignaud olivier	\N	\N	nan	2021-06-10 18:18:36.042142	t
48	109460	ARRET SUITE VENTE DU COMMERCE	A.D.N. immobilier-  GUY HOQUET	\N	Madame	landon ketty	\N	\N	nan	2021-06-10 18:18:37.048568	t
49	109480	INACTIF	CABINET LEFEVRE ET DUCHARME	cabinetlefevreetducharme	Madame	lefevre florence    lafevre  francoise	\N	\N	785 307 620 00019	2021-06-10 18:18:37.98703	t
52	109520	INACTIF	CENTURY 21 COMBAULT IMMOBILIER	\N	Monsieur	heng guy	\N	\N	nan	2021-06-10 18:18:40.651513	t
51	109510	ARRET  COLLABORATION	AGENCITY	agencity	Madame	greux charlotte	\N	\N	nan	2021-06-10 18:18:39.76002	t
53	109530	INACTIF	PARTNER IMMOBILIER	\N	Madame	chambrin pascaline	\N	\N	nan	2021-06-10 18:18:41.548001	t
54	109540	INACTIF	JEP BOIS	\N	Madame	rosey evelyne	\N	\N	nan	2021-06-10 18:18:42.7673	t
55	109560	ARRET DE COLLABORATION	J M IMMOBILIER	\N	Monsieur	joubert alain	\N	\N	nan	2021-06-10 18:18:43.614816	t
56	109570	INACTIF	ALBERT 1ER IMMOBILIER	\N	Madame	sineux	\N	\N	nan	2021-06-10 18:18:44.419356	t
57	109580	INACTIF / ARRET COLLABORATION	AGENCE HOTEL DE VILLE	\N	Madame	fortin elodie	\N	\N	nan	2021-06-10 18:18:45.35682	t
274	\N	DOUBLON DE SAISIE	BENOTEAU IMMOBILIER	\N	Madame	benoteau corine	\N	\N	nan	2021-06-10 18:22:17.681591	t
58	109590	INACTIF	CABINET LATY	\N	Madame	guhur céline	\N	\N	nan	2021-06-10 18:18:46.265879	t
59	109620	ARRET DE COLLABORATION	CENTURY 21 A.S.M	\N	Madame	brochard hélène	\N	\N	nan	2021-06-10 18:18:47.174361	t
60	109610	ARRET DE COLLABORATION	SCI 5 BOULES	\N	Monsieur	gavard pierre	\N	\N	nan	2021-06-10 18:18:48.010882	t
61	109630	ARRET DE COLLABORATION	LAFORET CBR	\N	Monsieur	broc christophe	\N	\N	nan	2021-06-10 18:18:49.130242	t
62	109650	INACTIF	ORPI CP IMMO	orpicpimmo	Monsieur	perrin christophe	\N	\N	483525887	2021-06-10 18:18:50.078701	t
63	109640	ARRET DE COLLABORATION	.	\N	Madame	mancel pacome	\N	\N	nan	2021-06-10 18:18:50.968195	t
81	109740	INACTIF	BLEU MARINE IMMOBILIER	century21bleumarine	Madame	pignon isabelle	\N	\N	nan	2021-06-10 18:19:09.24076	t
64	110360	CLIENT inactif	SARL AGENCE LE NY	laforetagenceleny	Madame	mr bertin thomas	\N	\N	71201020600019	2021-06-10 18:18:51.786725	t
65	109650	ARRET DE COLLABORATION	LAFORET IBPB	laforetibpb	Madame	de munico estelle	\N	\N	nan	2021-06-10 18:18:52.655228	t
91	109810	REPRENDRE CONTACT	JEROME COMBES IMMOBILIER	guyhoquet	Monsieur	combes jerôme	\N	\N	nan	2021-06-10 18:19:20.593573	t
66	109670	INACTIF	CABINET LOGEAIS- ORPI	orpi	Monsieur	logeais jean-philippe	\N	\N	nan	2021-06-10 18:18:53.71363	t
67	109660	INACTIF	.	\N	Madame et Monsieur	sourdois	\N	\N	nan	2021-06-10 18:18:54.571136	t
68	109661	ARRET DE COLLABORATION	CB CONSEILS	laforet-chambly	Madame	bonet catherine	\N	\N	nan	2021-06-10 18:18:55.373677	t
69	109662	CLIENT ACTIF	L'ADRESSE LAU DES NAIADES FONTENAY LE COMTE	l'adresse-laudesnaiades	Madame	thibaud-guilbaud	\N	\N	52023191100022	2021-06-10 18:18:56.284156	t
70	109663	CLIENT INACTIF	L'ADRESSE LAU DU MARAIS	l'adresse-chaillelesmarais-laudumarais	Madame	ravon elodie	\N	\N	447696329039	2021-06-10 18:18:57.353548	t
71	109680	INACTIF	ERA AAA IMMOBILIER	eraimmobilier	Monsieur	denman	\N	\N	nan	2021-06-10 18:18:58.212054	t
72	109690	CLIENT INACTIF	VENDIMO	vendimo	Monsieur	barbe olivier	\N	\N	nan	2021-06-10 18:18:59.025594	t
73	109840	INACTIF	MARANS IMMOBILIER	maransimmobilier	Monsieur	maitrehut julien	\N	\N	nan	2021-06-10 18:18:59.818138	t
82	109750	ARRET  COLLABORATION	OFFICE DE LA PROPRIETE	officedelapropriete	Monsieur	canut jacques	\N	\N	nan	2021-06-10 18:19:10.573995	t
74	109700	ARRET DE COLLABORATION	AGENCE NICOLAS FONTAINE	massonimmobilier	Monsieur	fontaine nicolas	\N	\N	nan	2021-06-10 18:19:01.146379	t
75	109710	ARRET DE COLLABORATION	BUHLER FRANTZ	buhlerfrantz	Monsieur	buhler frantz	\N	\N	nan	2021-06-10 18:19:02.188785	t
76	109730	INACTIF	SARL AGENCE IMMOBILIERE DU LAC	century21adlimmobilier	Madame	gilet micheline	\N	\N	nan	2021-06-10 18:19:03.346122	t
83	190720	ARRET DE COLLABORATION	MGL - IMMO 44	immo44-cielimmobilier	Monsieur	houle fabrice	\N	\N	nan	2021-06-10 18:19:11.782605	t
77	109720	ARRET DE COLLABORATION	LD IMMOBIIER	laforetblanquefort	Monsieur	araujo sandrine	\N	\N	nan	2021-06-10 18:19:04.324564	t
78	109746	INACTIF	HUIT CINQ GESTION	huitcinqimmobilier	Monsieur	houle fabrice	\N	\N	nan	2021-06-10 18:19:05.577848	t
101	109930	INACTIF-ARRET COLLABORATION	ANSELYN Philippe	\N	Monsieur	anselyn philippe	\N	\N	nan	2021-06-10 18:19:32.078016	t
79	109745	ARRET  COLLABORATION	MGL - OLONNE SUR MER 85	magestionlocative	Monsieur	houle fabrice	\N	\N	nan	2021-06-10 18:19:06.83513	t
84	109750	CLIENT ACTIF	ETUDE MAITRE KERAVEC	etudemaitrekeravecnotaire	Madame	legrand sophie	\N	\N	nan	2021-06-10 18:19:12.975929	t
80	109850	ARRET DE COLLABORATIONS UITE VENTE	GTN CONSEILS ET PATRIMOINE	gtnimmobilier	Madame	landon ketty	\N	\N	nan	2021-06-10 18:19:08.144383	t
92	109820	REPRENDRE CONTACT	AGENCE ULYS PATELY IMMOBILIER	agenceulyspatelyimmobilier	Madame	lemoine liliane	\N	\N	nan	2021-06-10 18:19:22.844286	t
85	109760	VEDU A BP IMMOBILIER	HC TRANSACTION	l'adresse-pontaultcombault	Madame	ludmi isabey	\N	\N	nan	2021-06-10 18:19:14.288175	t
97	109880	INACTIF	nan	citya	Madame	marty audrey	\N	\N	nan	2021-06-10 18:19:27.965362	t
86	109760	INACTIF	SARL IMMOVINS	abciorpigestion	Madame	deloffre knopfer babara	\N	\N	nan	2021-06-10 18:19:15.440517	t
93	109860	REPRENDRE CONTACT	SBSI - LES PAVES DU 20E	lespavesdu20e	Monsieur	hennel	\N	\N	nan	2021-06-10 18:19:23.874698	t
87	109770	ARRET DE COLLABORATION	MOINET	moinet	Mr et Mme	moinet	\N	\N	nan	2021-06-10 18:19:16.544887	t
88	109780	ARRET DE COLLABORATION	BUHLER HUGO	buhlerhugo	Monsieur	buhler hugo	\N	\N	nan	2021-06-10 18:19:17.606278	t
89	109790	INACTIF	PYRAULT LAURENT	pyraultlaurent	Monsieur	pyrault laurent	\N	\N	nan	2021-06-10 18:19:18.554737	t
94	109830	ARRETA DE COLLABORATION	MARLERE Jacques	marlerejacques	Monsieur	marlere jacques	\N	\N	nan	2021-06-10 18:19:24.713218	t
90	109800	ARRET DE COLLABORATION	TIKVA IMMOBILIER	tikvaimmobilier	Monsieur	benaroche sholmi	\N	\N	nan	2021-06-10 18:19:19.627123	t
98	109890	INACTIF-ARRET COLLABORATION	MR & MME SENIUTA	\N	Monsieur	seniuta	\N	\N	nan	2021-06-10 18:19:28.91182	t
95	109900	REPRENDRE CONTACT	SARL RECHERCHE IMMOBILIERE	rechercheimmobiliere	Monsieur	petrus sylvain	\N	\N	nan	2021-06-10 18:19:25.714646	t
96	109870	ARRET DE COLLABORATION	LAFORET SAINT MEDARD EN JALLES	laforetsaintmedardenjalles	Madame	branchut stéphanie	\N	\N	nan	2021-06-10 18:19:26.675104	t
99	109910	REPRENDRE CONTACT	AGENCE MARTIN	agencemartincoteseineorpi	Madame	geultont karine	\N	\N	nan	2021-06-10 18:19:29.784321	t
102	109940	INACTIF	.	\N	Monsieur	gibaud robert	\N	\N	nan	2021-06-10 18:19:33.084441	t
100	109920	REPRENDRE CONTACT	SRJG GESTION - PARIS EST GESTION SARL	parisestgestion	Madame	garin julie - routaboul sabrina	\N	\N	nan	2021-06-10 18:19:30.769759	t
103	109931	ARRET DE COLLABORATION	RENAULT Florent	renaultflorent	Monsieur	renault florent	\N	\N	nan	2021-06-10 18:19:34.078869	t
104	109960	CLIENT INACTIF	CTII SARL IMMOBILIERE LA TOUR	immobilierelatour	Monsieur	kintgen alexis    m dannay jerome	\N	\N	341 681 898 00043	2021-06-10 18:19:35.128272	t
105	109950	ARRET DE COLLABORATION SUITE VENTE	IMMO MAYENNE	immomayenne	Monsieur	bouillier olivier	\N	\N	nan	2021-06-10 18:19:35.934812	t
106	109970	ARRET  COLLABORATION	IMMO ONLINE	immoonline	Monsieur	wulwik nathaniel	\N	\N	nan	2021-06-10 18:19:36.996204	t
107	109761	CLIENT ACTIF	IMMOBILIERE BUSSY GESTION GUY HOQUET SERRIS	guyhoquetserrisimmobilierebussygestion	Madame	chareyre caroline	\N	\N	479 270 803 00030	2021-06-10 18:19:37.988635	t
108	1075492	VEDU A 3B ARDOISIERES	FONCIERE ANJOU	l'adresse	Monsieur	vernier esnault	\N	\N	nan	2021-06-10 18:19:38.950086	t
109	109991	ARRET DE COLLABORATION	MAISONS ET COMPAGNIE	maisonsetcompaganie	Monsieur	miltgen françois	\N	\N	nan	2021-06-10 18:19:39.977499	t
110	109985	CLIENT ACTIF	4 IMMO	l'adresse-4immo	Monsieur	pennanec'h  thierry	\N	\N	44762160800051	2021-06-10 18:19:40.850004	t
111	101000	SUSPENDU	ATARAXIA	ataraxia	Madame	\N	\N	\N	nan	2021-06-10 18:19:41.93838	t
112	110010	ARRET DE COLLABORATION	DOMUS AGENCY	laforetimmobilier	Monsieur	alexandre dominique	\N	\N	nan	2021-06-10 18:19:43.104713	t
113	110350	ARRET  COLLABORATION	ADRAST IMMOBILIER	adrastimmobilier	Monsieur	adrast emmanuel	\N	\N	nan	2021-06-10 18:19:44.039184	t
114	110020	CLIENT PARTICULIER	.	\N	Monsieur	fougerouse christian	\N	\N	nan	2021-06-10 18:19:45.17353	t
115	110030	CLIENT INACTIF	SARL SHANDRANI	vrignonimmobilier	Monsieur	vrignon michel	\N	\N	nan	2021-06-10 18:19:46.224932	t
116	110040	ARRETA DE COLLABORATION	.	sauboy	Mr et Mme	sauboy	\N	\N	nan	2021-06-10 18:19:47.217363	t
117	110041	ARRETA DE COLLABORATION	PGI LAFORET	pgilaforet	Madame	de munico estelle	\N	\N	nan	2021-06-10 18:19:48.36471	t
123	110080	ARRETA DE COLLABORATION	BARANGER Thierry	barangerthierry	Monsieur	baranger thierry	\N	\N	nan	2021-06-10 18:19:54.142408	t
258	122000	ARRET  COLLABORATION	BARATTE IMMOBILIER	baratteimmobilier	Madame	richard vanessa	\N	\N	752590265	2021-06-10 18:22:00.89671	t
124	110090	ARRET  DE COLLABORATION	LALOY Philippe	laloyphilippe	Monsieur	laloy philippe	\N	\N	nan	2021-06-10 18:19:55.157828	t
259	122010	CLIENT PARTICULIER	.	\N	Monsieur	baduel olivier	\N	\N	nan	2021-06-10 18:22:01.825181	t
125	110100	ARRET DE COLLABORATION	PLANETE IMMOBILIER	planeteimmobilier	Madame	jore rachele	\N	\N	nan	2021-06-10 18:19:56.110286	t
126	110110	CLIENT INACTIF	BOILEAU IMMOBILIER	boileauimmobilier	Madame	boileau jennifer	\N	\N	nan	2021-06-10 18:19:57.096723	t
127	110120	ARRETA DE COLLABORATION	SARL SIBEM	laforetsaintloubes	Madame	pichot virginie\ncaillet elodie	\N	\N	nan	2021-06-10 18:19:58.292095	t
260	122011	CLIENT INACTIF	ZAMBON IMMOBILIER	squarehabitat-zambonimmobilier	Madame	bigot isabelle	\N	\N	nan	2021-06-10 18:22:02.63372	t
128	110120	CLIENT INACTIF	AGENCE CENTRALE SARL	acbi	Monsieur	bouton alain	\N	\N	nan	2021-06-10 18:19:59.664326	t
301	122290	CLIENT ACTIF	LM-IMMO	lillemetropoleimmobilier	Monsieur	darondel igor	\N	\N	538 332 883 00015	2021-06-10 18:22:48.390044	t
261	122012	CLIENT PARTICULIER	PARTICULIER	particulier	Madame	blais yvette et mathieu	\N	\N	nan	2021-06-10 18:22:03.948149	t
262	123000	CLIENT ACTIF	SAS BUSSAT DUNNE IMMOBILIER	guyhoquetbussatdunneimmobilier	Monsieur	bussat serge	\N	\N	79841784600028	2021-06-10 18:22:04.892609	t
263	122030	ARRET  COLLABORATION	SAS BRIO GESTION	briogestion	Madame	brilhaut céline & novais sylvie	\N	\N	nan	2021-06-10 18:22:06.394036	t
264	122040	CLIENT ACTIF	CITYA BELVIA RENNES	cityabelviarennes	Madame	le doeuff hélène	\N	\N	nan	2021-06-10 18:22:07.692295	t
265	122050	REPRENDRE CONTACT	BRIENT IMMOBILIER	guyhoquetmontreuilbrientimmobilier	Monsieur	brient laurent	\N	\N	nan	2021-06-10 18:22:08.709716	t
266	122060	CLIENT INACTIF	CITYA CAGIL	cityalorient	Madame	waysse alyssa	\N	\N	316 972 835 00045	2021-06-10 18:22:09.891045	t
267	122070	ARRET  COLLABORATION	SARL COTE VILLEMANDEUR	coteparticuliers	Madame	mounier céline	\N	\N	nan	2021-06-10 18:22:10.948441	t
268	122120	CLIENT INACTIF	SASU UGS PATRIMOINE	l'adresse-etampes	Monsieur	cormon benoit	\N	\N	nan	2021-06-10 18:22:11.914883	t
269	122080	CLIENT PARTICULIER	.	.	Monsieur	rouillon frédéric	\N	\N	nan	2021-06-10 18:22:12.870338	t
292	122195	CLIENT INACTIF	NOTAIRES ETUDE NYZAM GAILLARD	notairesetudenyzamgaillard	Madame	templier angeline	\N	\N	397 891 086 00027	2021-06-10 18:22:37.825951	t
270	122090	INACTIF	SAS AM IMMOBILIER	amimmobilier	Monsieur	billot michel	\N	\N	55980529600022	2021-06-10 18:22:13.912743	t
271	122100	CLIENT INACTIF	GIEMPE IMMOBILIER	giempeimmobilier	Monsieur	pertus jean marc	\N	\N	nan	2021-06-10 18:22:14.926165	t
272	122110	CLIENT ACTIF	PARTENAIRES GESTION CONSEIL	l'adressethorilagny	Madame	bonnet muriel	\N	\N	43948954300082	2021-06-10 18:22:15.796665	t
273	122240	ARRET  COLLABORATION	NEOWI IMMOBILIER	\N	Monsieur	hascoet boris	\N	\N	40977820600022	2021-06-10 18:22:16.784103	t
290	\N	DOUBLON DE SAISIE	TMC FINANCE	lilleimmo	MADAME	denis estelle	\N	\N	nan	2021-06-10 18:22:36.010985	t
291	122180	CLIENT PARTICULIER	Djakiodine Shabir	djakiodineshabir	Monsieur	djakiodine shabir	\N	\N	nan	2021-06-10 18:22:36.945451	t
293	122200	CLIENT INACTIF	JLW IMMOBILIER	jlwimmobilier	MONSIEUR	lestienne emeric	\N	\N	48290685600018	2021-06-10 18:22:38.798394	t
365	124080	INACTIF	M3B IMMOBILIER SARL	laforet_m3bimmobilier	Monsieur	célian moullé-berteaux	\N	\N	83337372300018	2021-06-10 18:24:05.097172	t
297	122250	CLIENT PARTICULIER	PETILLAT ROBERT	particulier	MONSIEUR	petillat damien et robert delphine	\N	\N	nan	2021-06-10 18:22:43.023597	t
302	122300	CLIENT ACTIF	CENTURY RUE NATIONALE	century21-lilleruenationale	MONSIEUR	dupont benoit	\N	\N	52526891800014	2021-06-10 18:22:51.434306	t
298	122260	CLIENT INACTIF	SCI AMETHYSTE	scil'amethyste	MADAME	norguet carole	\N	\N	524 848 082 00037	2021-06-10 18:22:44.270881	t
299	122270	ARRET  COLLABORATION	FONCIA VENDEE	foncia-grouepgrenon	MONSIEUR	caillaud lauret	\N	\N	452 396 575 00071	2021-06-10 18:22:45.400236	t
363	124060	ARRET  COLLABORATION	IMMOBILIERE LUTECE	immobilierelutece	Monsieur	latour steve	\N	\N	304 555 501 00069	2021-06-10 18:24:02.762504	t
300	122280	CLIENT INACTIF	nan	arthurloydlille	Monsieur	hien maxence	\N	\N	nan	2021-06-10 18:22:46.587072	t
303	122310	nan	DEFIM	defimimmobilier	Madame	delfosse erika	\N	\N	82392388300016	2021-06-10 18:22:53.970125	t
304	\N	nan	AJP IMMOBILIER	ajpimmobilier	Madame	rodolle véronique	\N	\N	nan	2021-06-10 18:22:55.314353	t
307	123340	CLIENT ACTIF	EURO IMMO	euroimmo	MADAME	barat carole	\N	\N	42308557000012	2021-06-10 18:22:58.188713	t
364	124070	CLIENT INACTIF	SARL MB IMMOBILIER	mbimmobiliertours	Monsieur	blot  pierre yves	\N	\N	39835439900014	2021-06-10 18:24:03.899855	t
370	124130	CLIENT ACTIF	ACTIF GESTION IMMOBILIER	agi-actifgestionimmobilier	Madame	dufour kathleen	\N	\N	793 442 039 00012	2021-06-10 18:24:11.031781	t
366	124090	CLIENT INACTIF	nan	\N	Monsieur	show john	\N	\N	nan	2021-06-10 18:24:06.283492	t
371	\N	nan	MODELE	\N	nan	modele	\N	\N	nan	2021-06-10 18:24:12.070186	t
372	0181	CLIENT INACTIF	SARL A.N.G IMMOBILIER	century21l'oceane	Monsieur	francheteau pascal	\N	\N	35357547500036	2021-06-10 18:24:13.076613	t
374	124260	CLIENT ACTIF	SARL AGENCE CORINNE B	agencecorinneb	Madame	bazard corinne	\N	\N	49866003400014	2021-06-10 18:24:15.684124	t
375	124140	CLIENT ACTIF	SARL AFI -  AUBERGENVILLE FLINS IMMOBILIER	guyhoqueteponel'immobilierpatrimoine	Madame	descaves / jouvet	\N	\N	525 002 697 00015	2021-06-10 18:24:16.784495	t
381	124210	SUSPENDU	POMMEROL	pommerolaude	Madame	pommerol aude	\N	\N	nan	2021-06-10 18:24:24.389152	t
382	124210	CLIENT INACTIF	DE POMMEROL AUDE	depommerolaude	Madame	de pommerol aude	\N	\N	nan	2021-06-10 18:24:25.682415	t
118	110080	CLIENT INACTIF	SARL AJC IMMOBILIER ROCHEFORT	ajcimmobilier	Monsieur	lacoste jean christophe / \tpalimpseste	\N	\N	41351986900023	2021-06-10 18:19:49.331159	t
153	110270	CLIENT ACTIF	POOL IMMOBILIER SABLAIS	poolimmobiliersablais	Monsieur	vercelletto antoine	\N	\N	48738036200011	2021-06-10 18:20:23.749526	t
119	110100	INACTIF	SARL CITYA IMMOBILIER COTE DE BEAUTE	cityaimmobiliercotedebeaute	Monsieur	ploermel	\N	\N	nan	2021-06-10 18:19:50.286613	t
143	110100	INACTIF-ARRET COLLABORATION	SARL LD IMMOBILIER	laforet	Monsieur	da costa laurent	\N	\N	nan	2021-06-10 18:20:14.97454	t
120	110060	CLIENT INACTIF	L'IMMOBILIERE DU SUD	l'adresse-lachevroliere	Monsieur	chailleux jérôme	\N	\N	nan	2021-06-10 18:19:51.277045	t
121	110070	ARRET DE COLLABORATION	HAMON Antoine	hamonantoine	Monsieur	hamon antoine	\N	\N	nan	2021-06-10 18:19:52.165537	t
122	110072	INACTIF	EURL GADEL IMMOBILIER	gadelimmobilier	Madame	gadel carole	\N	\N	nan	2021-06-10 18:19:53.013052	t
129	110140	ARRET DE COLLABORATION	IMMOVAC	\N	Monsieur	delage ludivic	\N	\N	nan	2021-06-10 18:20:01.356554	t
144	110110	CLIENT INACTIF	SARL ACTIAL	carquefouimmobilier	Monsieur	rihet christophe	\N	\N	nan	2021-06-10 18:20:16.018944	t
130	110130	ARRET DE COLLABORATION	DELTA IMMOBILIER	deltaimmobilier	Monsieur	delage ludovic	\N	\N	nan	2021-06-10 18:20:02.257036	t
131	110160	REPRENDRE CONTACT	JMELI IMMO	guyhoquetparis11voltaire	Monsieur	landzberg	\N	\N	nan	2021-06-10 18:20:03.330426	t
132	110165	REPRENDRE CONTACT	CABINET SIONNEAU IMMOBILIER	cabinetsionneau	Madame	guignard nadine	\N	\N	42369341500014	2021-06-10 18:20:04.224913	t
145	110200	ARRET DE COLLABORATION	SARL LFI	avisimmobiliersaintloubes	Madame	fline puentes sylvie	\N	\N	nan	2021-06-10 18:20:16.797499	t
133	110150	ARRET DE COLLABORATION	MAUMY PARADE Brigitte	maumyparadebrigitte	Madame	maumy parade brigitte	\N	\N	nan	2021-06-10 18:20:05.966918	t
134	110170	REPRENDRE CONTACT	SARL HORIZON	etoileimmobiliere	Madame	porret joubert stéphanie	\N	\N	79975707500012	2021-06-10 18:20:06.946357	t
154	110290	REPRENDRE CONTACT	LOGIC HOME	logichome	Monsieur	laruelle mickaël	\N	\N	nan	2021-06-10 18:20:24.808922	t
135	110075	ARRET  COLLABORATION	SERGIC ANGERS	sergic	Monsieur et Madame	dorchie cecile	\N	\N	nan	2021-06-10 18:20:07.914806	t
146	110210	ARRET DE COLLABORATION	Groupe BIRAN IMMOBILIER	groupebiranimmobilier	Madame	gessey dany	\N	\N	nan	2021-06-10 18:20:17.684991	t
136	110080	CLIENT INACTIF	ABC IMMOBILIER	abcimmobilier	Madame	barbier nathalie et equipe .	\N	\N	nan	2021-06-10 18:20:09.285023	t
137	110090	CLIENT PARTICULIER	.	\N	Monsieur et Madame	guivant yannick et cosson elodie	\N	\N	nan	2021-06-10 18:20:10.18151	t
138	110092	REPRENDRE CONTACT	VIVRE ICI	vivireici	Monsieur	trehard emanuel	\N	\N	nan	2021-06-10 18:20:11.014801	t
139	110180	ARRETA DE COLLABORATION	ACHETER DU NEUF	acheterduneuf	Madame	maumy parade brigitte	\N	\N	nan	2021-06-10 18:20:11.793358	t
140	\N	REPRENDRE CONTACT	CABINET BERARD	cabinetberard	Monsieur	berard	\N	\N	nan	2021-06-10 18:20:12.580911	t
147	110220	INACTIF	SAS BP IMMOBILIER	l'adresse-chatillon	Monsieur	printemps rudy	\N	\N	53946287900013	2021-06-10 18:20:18.575483	t
141	110091	ARRET DE COLLABORATION	BL AGENT	blagent	Monsieur	minelli	\N	\N	nan	2021-06-10 18:20:13.368459	t
142	110190	ARRET DE COLLABORATION	GEORGE V SARL YAPLUKA	georgevsarlyapluka	Madame	bonnetaz marina	\N	\N	nan	2021-06-10 18:20:14.130024	t
164	110350	INACTIF-ARRET COLLABORATION	CABINET TRAGESIM	\N	Madame	gustave véronique	\N	\N	nan	2021-06-10 18:20:34.203487	t
148	110230	CLIENT ACTIF	GUY HOQUET AERISSIMO SARL	guyhoquetaerissimo	Monsieur	bobin gilles	\N	\N	45249861100014	2021-06-10 18:20:19.367032	t
155	110300	ARRET  COLLABORATION	A&G PAUTOUT IMMOBILIER	l'adresse-cabinetpautout	Monsieur	pautout guillaume	\N	\N	42185010800018	2021-06-10 18:20:26.04273	t
149	110240	ARRET  COLLABORATION	Cabinet gestion ISNER	l'adresse-bussysaintgeorges	Madame	isner peggy	\N	\N	nan	2021-06-10 18:20:20.256524	t
150	110250	CLIENT INACTIF	AGILIMMO VENDEE	huitcinqchallans	Monsieur	horel gilles	\N	\N	nan	2021-06-10 18:20:21.080051	t
160	110332	REPRENDRE CONTACT	KB IMMOBILIER SARL	kbimmobilier	Monsieur	rousseau gilles	\N	\N	nan	2021-06-10 18:20:30.587552	t
151	110260	REPRENDRE CONTACT	ACI - AGENCE CONSEILS IMMOBILIER SARL	aciimmobilier	Monsieur	desseaux philippe	\N	\N	nan	2021-06-10 18:20:22.051497	t
156	110310	ARRET DE COLLABORATION	BUHLER BERNARD	buhlerbernard	Monsieur	buhler bernard	\N	\N	nan	2021-06-10 18:20:26.87825	t
152	110262	INACTIF-ARRET COLLABORATION	AURA IMMOBILIER SARL	auraimmobilier	Monsieur	balestra laurent	\N	\N	nan	2021-06-10 18:20:22.879026	t
157	110340	ARRET DE COLLABORATION SUITE VENTE	EFFIGEST IMMO	effigestimmo	Madame	norguet carole	\N	\N	nan	2021-06-10 18:20:27.855693	t
161	110360	CLIENT ACTIF	CITYA NANT'IMMO	cityanantes	Madame	vancappel sandra	\N	\N	nan	2021-06-10 18:20:31.599975	t
158	110320	ARRET DE COLLABORATION	HEKIMIAN Nicolas	hekimiannicolas	Monsieur	hekimian nicolas	\N	\N	nan	2021-06-10 18:20:28.677646	t
159	110330	ARRET  COLLABORATION	GIMCOVERMEILLE POISSY - CABINET FISSON	gimcovermeillepoissy-cabinetfisson	Madame	francois marion	\N	\N	nan	2021-06-10 18:20:29.747033	t
162	110332	REPRENDRE CONTACT	GIMCOVERMEILLE CONFLANS	gimcovermeilleconfalans	Madame	mendes marie-josé	\N	\N	nan	2021-06-10 18:20:32.416512	t
165	110370	CLIENT ACTIF	SAINT AMBROISE IMMOBILIER	laforetsaintambroise	Monsieur	rochon christophe	\N	\N	80207116700018	2021-06-10 18:20:35.203917	t
163	110333	REPRENDRE CONTACT	GIMCOVERMEILLE VOISIN	gimcovermeillevoisin	Madame	festor michèle	\N	\N	nan	2021-06-10 18:20:33.238039	t
168	110382	INACTIF-ARRET COLLABORATION	SARL MIMAS GESTION	cabinetmimas	Monsieur	hoarau   pierre laurent	\N	\N	42473973800013	2021-06-10 18:20:38.152235	t
166	110390	CLIENT INACTIF	ICY IMMOBILIER COURONNE YONNAISE	icyimmobilier	Monsieur	graindorge didier	\N	\N	nan	2021-06-10 18:20:36.455204	t
167	110380	REPRENDRE CONTACT	CARVEL ET ASSOCIES	carveletassocies	Madame	tauvel laurence	\N	\N	nan	2021-06-10 18:20:37.271736	t
169	110384	INACTIF-ARRET COLLABORATION	CABINET HOARAU MIMAS IMMOBILIER	cabinethoarau	Monsieur	hoarau laurent	\N	\N	809763832	2021-06-10 18:20:39.003745	t
170	110385	ARRET  COLLABORATION	MANDAT&MOI	mandat&moi	Monsieur	monin thomas	\N	\N	nan	2021-06-10 18:20:39.875249	t
171	110390	REPRENDRE CONTACT	DUPONT ET POISSANT CONSEILS IMMOBILIER	compromisimmobilier	Monsieur	dupont mathieu	\N	\N	nan	2021-06-10 18:20:40.72976	t
172	123490	CLIENT ACTIF	LABEL IMMO 85	l'adresse-labelimmo85	Monsieur	teillol gilles	\N	\N	51092080400026	2021-06-10 18:20:41.536299	t
173	110400	REPRENDRE CONTACT	MLY IMMOBILIER	ladhuysimmobilier	Monsieur	diaby	\N	\N	nan	2021-06-10 18:20:42.61378	t
174	110405	REPRENDRE CONTACT	SGI 11 S.A.S	eracharonnebastille	Madame	yeung stéphanie	\N	\N	79164707600011	2021-06-10 18:20:43.438307	t
175	110410	CLIENT PARTICULIER	.	.	Monsieur	fraikin alexis	\N	\N	nan	2021-06-10 18:20:44.314806	t
176	110412	CLIENT PARTICULIER	.	.	Madame	journee elisabeth	\N	\N	nan	2021-06-10 18:20:45.10436	t
177	110430	REPRENDRE CONTACT	BELIMMO	belimmo	Monsieur	garcia jean	\N	\N	nan	2021-06-10 18:20:45.963864	t
178	110440	CLIENT PARTICULIER	.	.	Madame	raye karine	\N	\N	nan	2021-06-10 18:20:46.737422	t
179	110450	REPRENDRE CONTACT	ADN GESTION TRANSACTION	l'adresse-adngestiontransaction	Monsieur	pequito sylvain	\N	\N	nan	2021-06-10 18:20:47.594935	t
180	10510	CLIENT ACTIF	CENTRAL IMMOBILIER	centralimmobilierjeremygarcia	Monsieur	garcia jérémy	\N	\N	34969437200039	2021-06-10 18:20:48.42446	t
181	110460	REPRENDRE CONTACT	JB IMMO SAS	guyhoquetjbimmo	Monsieur	gauthier bruno	\N	\N	nan	2021-06-10 18:20:49.218005	t
188	110620	ARRET DE COLLABORATION SUITE VENTE	SARL LES HERBIERS GESTION	sarllesherbiersgestion	Monsieur	comont jean-michel	\N	\N	nan	2021-06-10 18:20:55.214611	t
189	110530	ARRET  COLLABORATION	FIMOGEST	guyhoquet	Monsieur	hintermeyer	\N	\N	nan	2021-06-10 18:20:55.987173	t
275	123520	CLIENT ACTIF	CABINET GUERRY SARL	agirimmobilier-cabinetguerry	Monsieur	chenede frédéric	\N	\N	341 939 684 00096	2021-06-10 18:22:18.727995	t
190	110540	CLIENT PARTICULIER	.	.	Monsieur	simon laurent	\N	\N	nan	2021-06-10 18:20:56.916639	t
191	110550	ARRET DE COLLABORATION SUITE VENTE	MGL - PORTES DE L OCEAN	agenceportedelocean	Madame	ronineau pauline	\N	\N	nan	2021-06-10 18:20:57.693196	t
192	110560	REPRENDRE CONTACT	MG APARTE	mgaparte	Madame	giordano maria	\N	\N	nan	2021-06-10 18:20:58.653647	t
276	122130	CLIENT INACTIF	SARL TRIO IMMO	l'adresse-chateaubriant	Madame	lahridi soraya	\N	\N	nan	2021-06-10 18:22:20.127062	t
193	110570	CLIENT ACTIF	CITYA NANTES	cityanantes	Madame	vancapel sandra	\N	\N	nan	2021-06-10 18:20:59.485175	t
289	122160	CLIENT ACTIF	CABINET PIGE	cabinetpige	Monsieur	brachet sébestien	\N	\N	403090889	2021-06-10 18:22:35.022549	t
277	122120	CLIENT PARTICULIER	.	.	Monsieur	froussart jean-marc	\N	\N	nan	2021-06-10 18:22:21.489285	t
278	122140	CLIENT PARTICULIER	.	.	Madame	lombard bélinda	\N	\N	nan	2021-06-10 18:22:22.718581	t
279	122150	CLIENT PARTICULIER	.	.	Madame	gourrier	\N	\N	nan	2021-06-10 18:22:24.623495	t
294	122190	CLIENT PARTICULIER	CALAS JEAN FRANCOIS	particulier	MONSIEUR	calas jean francois	\N	\N	nan	2021-06-10 18:22:39.688886	t
280	122160	ARRET  COLLABORATION	SAS LARVOR	larvor	Monsieur	wispelaere manuel	\N	\N	nan	2021-06-10 18:22:25.891774	t
281	110103	INACTIF-ARRET COLLABORATION	SARL NATION IMMOBILIER	laforetnationimmobilier	Monsieur	da costa laurent	\N	\N	nan	2021-06-10 18:22:27.037114	t
369	124120	CLIENT ACTIF	SARL CHURCHIL - Agence de l'ancienne Marie	l'adresseagencedel'anciennemairie	Madame	malika bouazoune	\N	\N	41126140700042	2021-06-10 18:24:09.723529	t
282	110102	INACTIF-ARRET COLLABORATION	SARL L-L IMMOBILIER	laforetl-limmobilier	Monsieur	da costa laurent	\N	\N	nan	2021-06-10 18:22:28.039539	t
295	122210	CLIENT PARTICULIER	CORDIER Jean-Noël	particulier	Monsieur	cordier jean-noël	\N	\N	nan	2021-06-10 18:22:40.612971	t
283	110101	INACTIF-ARRET COLLABORATION	SARL GDL IMMOBILIER	laforetgdlimmobilier	Monsieur	da costa laurent	\N	\N	nan	2021-06-10 18:22:28.930033	t
284	123350	ARRET DE COLLABORATION SUITE VENTE	SOCIETE CAP JAURES	orpi101jaures	Madame	lamour solène	\N	\N	51370591300012	2021-06-10 18:22:30.337227	t
285	122145	CLIENT ACTIF	ETUDE BONNAVE	bonnavenotaires	Monsieur	bonnave frederic	\N	\N	nan	2021-06-10 18:22:31.282688	t
296	122220	CLIENT ACTIF	IMMOBILIERE JAURES IMMO	jauresimmo-agenceprincipalegagny	MONSIEUR	nardot stepahne	\N	\N	449306620	2021-06-10 18:22:41.87525	t
286	122146	CLIENT INACTIF	TMC FINANCE	lilleimmo	Madame	denis estelle	\N	\N	487754848	2021-06-10 18:22:32.189172	t
287	122140	CLIENT ACTIF	BENOTEAU IMMOBILIER	l'adressebenoteauimmobilier	Madame	benoteau corinne	\N	\N	786142935	2021-06-10 18:22:33.094653	t
384	CC0171	CLIENT	SARL DEMARE BEAULIEU IMMOBILIER	demarebeaulieuimmobilier	Madame	demare fabienne	\N	\N	45214576600047	2021-06-10 18:24:28.697691	t
288	122150	CLIENT ACTIF	VACHERAND IMMOBILIER	vacherandimmobilier	Madame	vacherand charlotte	\N	\N	414270769	2021-06-10 18:22:34.070098	t
305	123320	CLIENT INACTIF	ASD PATRIMOINE	asdimmobilier-asdpatrimoine	MONSIEUR	segard arnaud	\N	\N	78945950000045	2021-06-10 18:22:56.311784	t
373	124240	CLIENT INACTIF	SAS AAZ IMMOBILIER YONNAIS	laforetimmobilieryonnais	Madame	guillou charlotte	\N	\N	791011869800017	2021-06-10 18:24:14.361878	t
306	123330	CLIENT INACTIF	MENGUY Leslie	officenotarial	Madame	menguy leslie	\N	\N	nan	2021-06-10 18:22:57.28423	t
308	123610	CLIENT ACTIF	IMMO DE FRANCE LAVAL	immodefrancelaval	MADAME	vaigreville murielle	\N	\N	44136160700035	2021-06-10 18:22:59.292083	t
367	124100	nan	LADREAU	\N	Monsieur	landreau	\N	\N	nan	2021-06-10 18:24:07.420843	t
379	124200	CLIENT ACTIF	SAS AGENCE DE LA MADELEINE	agencedelamadeleine	Madame	valerie hugot	\N	\N	80467728400015	2021-06-10 18:24:21.309914	t
368	124110	CLIENT ACTIF	SARL IMMO 7	coeurlauragaisimmo7	Monsieur	soual yannick	\N	\N	792 045 189 00018	2021-06-10 18:24:08.619158	t
376	124150	REPRENDRE CONTACT	SAS C2IMM	c2imm	Madame	bryndza catherine	\N	\N	79340316300025	2021-06-10 18:24:17.870873	t
377	124160	CLIENT INACTIF	BRAVOFIBER	bravofiberlda	Monsieur	bravofiber	\N	\N	515147001	2021-06-10 18:24:19.074186	t
378	124190	CLIENT INACTIF	SAS SEIZE IMMOBILIER	seizeimmobilier	Monsieur	lefebvre remi	\N	\N	80739128900020	2021-06-10 18:24:20.126586	t
380	124340	CLIENT ACTIF	SARL DALIN BUSSAT DUNNE IMMOBILIER	guyhoquetsaintcharles-sarldalin	Monsieur	dalin bertrand	\N	\N	82207515600023	2021-06-10 18:24:22.508225	t
383	124280	CLIENT ACTIF	SARL CITYA LES REMPARTS	cityalaval-sarlcityalesremparts	Monsieur	pecot benoit	\N	\N	33438154100036	2021-06-10 18:24:27.192553	t
385	124270	CLIENT INACTIF	SARL PHILIPPE MATHIEU	agencedusudest	Madame	stephanie bouffier	\N	\N	48793034900013	2021-06-10 18:24:30.133563	t
386	124290	REPRENDRE CONTACT	SAVOIR ET CONSEIL	savoiretconseil	Monsieur	blanchard philippe	\N	\N	48198742800036	2021-06-10 18:24:31.428826	t
387	\N	CLIENT PARTICULIER	XXXX	xxx	Madame	haddou	\N	\N	XXXX	2021-06-10 18:24:32.548187	t
388	124295	CLIENT PARTICULIER	XXX	xxx	Madame	martin	\N	\N	XXX	2021-06-10 18:24:33.643563	t
389	124310	REPRENDRE CONTACT	SARL BOCAGE IMMOBILIER	bocageimmobilier	Madame	bouet elodie	\N	\N	83331718300014	2021-06-10 18:24:34.81389	t
390	124360	REPRENDRE CONTACT	SARL BRESSUIRE IMMO	letucimmobilier	Madame	vrignault aurelie	\N	\N	48843001800033	2021-06-10 18:24:35.913265	t
391	124300	CLIENT PARTICULIER	ZEZAFOUN	zezafoun	nan	zezafoun hussein	\N	\N	XXX	2021-06-10 18:24:37.092588	t
392	124320	CLIENT ACTIF	IMMOBILIERE DU BOUQUET (SARL)	orpi-immobilierdubouquetm.lamottestephane	Monsieur	mr lamotte stéphane	\N	\N	48917015900011	2021-06-10 18:24:38.615723	t
182	110470	REPRENDRE CONTACT	VIENOT ASSOCIES SARL	immobilieredeboulogne	Monsieur	sirvent-vienot charles6hugues	\N	\N	nan	2021-06-10 18:20:50.08651	t
218	110941	CLIENT PARTICULIER	.	.	Madame	lamotte	\N	\N	nan	2021-06-10 18:21:22.204321	t
183	110480	CLIENT PARTICULIER	.	.	Madame	talon catherine	\N	\N	nan	2021-06-10 18:20:50.887054	t
207	110680	CLIENT INACTIF	DIARD	diard	Madame	fougeres elodie	\N	\N	nan	2021-06-10 18:21:12.356822	t
184	110490	REPRENDRE CONTACT	ACCESSIM GESTION	laforetaccessim	Madame	hassani linda	\N	\N	nan	2021-06-10 18:20:51.666607	t
185	110500	CLIENT PARTICULIER	.	.	Monsieur	amory christian	\N	\N	nan	2021-06-10 18:20:52.498133	t
186	110510	CLIENT INACTIF	SCI DESSOUS LES BERGES	scidessouslesberges	Madame	atlani natacha	\N	\N	nan	2021-06-10 18:20:53.527576	t
208	110690	INACTIF-ARRET COLLABORATION	SCP LECUYER JOUAN PAULET	scplecuyerjouanpaulet	Madame	jezegou aurelie	\N	\N	nan	2021-06-10 18:21:13.147368	t
187	110520	REPRENDRE CONTACT	CIL ATLANTIQUE	groupecilatlantique	Madame	salle céline	\N	\N	nan	2021-06-10 18:20:54.324126	t
194	110580	ARRET  COLLABORATION	ETUDE IMMOBILIERE DE LILLE	etudeimmobilieredelille	Monsieur	neuet didier	\N	\N	nan	2021-06-10 18:21:00.57755	t
229	120040	ARRET  COLLABORATION	PROACTIVE IMMOBILIER 53	arthurimmo-laval	Madame	hubert karine & galode thierry	\N	\N	518854104	2021-06-10 18:21:32.461519	t
195	110590	ARRET  COLLABORATION	CC IMMO	etudeimmobilieredelille	Monsieur	clybouw cédric	\N	\N	nan	2021-06-10 18:21:01.307134	t
209	110700	REPRENDRE CONTACT	SAS SABINE DE JARNAC	sabinedejarnacimmobilier	Madame	de jarnac sabine	\N	\N	nan	2021-06-10 18:21:13.929923	t
196	110600	CLIENT PARTICULIER	.	.	Monsieur	benzaki charles	\N	\N	nan	2021-06-10 18:21:02.512443	t
197	110610	CLIENT INACTIF	LA RESIDENCE COTE LOCATION	laresidencecotelocation	Madame	bugel anne-sophie	\N	\N	nan	2021-06-10 18:21:03.805704	t
219	121045	REPRENDRE CONTACT	SARL IMMO SEBA	orpiimmosebahouilles	Monsieur	seletti philippe	\N	\N	32934149900047	2021-06-10 18:21:23.181764	t
198	110625	ARRET DE COLLABORATION SUITE VENTE	SARL CELINE IMMOBILIER	sarlcelineimmobilier	Madame	tournier céline	\N	\N	nan	2021-06-10 18:21:04.672211	t
210	110800	REPRENDRE CONTACT	NEXITY COURCELLES	nexitycourcelles	Madame	baesen nathalie	\N	\N	nan	2021-06-10 18:21:15.120242	t
199	110630	REPRENDRE CONTACT	NEXITY	giprichardiere	Madame	amaro isabel	\N	\N	nan	2021-06-10 18:21:05.568701	t
200	110635	REPRENDRE CONTACT	EURIGEST	eurigest	Madame	bolat olivia	\N	\N	nan	2021-06-10 18:21:06.349252	t
201	110640	CLIENT PARTICULIER	CHELOUCHE Jacques	chelouchejacques	Monsieur	chelouche jacques	\N	\N	nan	2021-06-10 18:21:07.213759	t
211	110900	ARRET  COLLABORATION	SARL OMLJ	cabinetiorvault	Madame	diais	\N	\N	811 884 329 00020	2021-06-10 18:21:15.999739	t
202	110642	CLIENT PARTICULIER	.	.	Madame	burkel agnès	\N	\N	nan	2021-06-10 18:21:07.948338	t
203	110644	CLIENT PARTICULIER	.	.	Monsieur	dinarque jean-denis	\N	\N	nan	2021-06-10 18:21:08.998738	t
225	120025	ARRET  COLLABORATION	SERGIC ORLEANS	sergic	Madame	levy isabelle	\N	\N	nan	2021-06-10 18:21:28.933801	t
204	110650	CLIENT INACTIF	SARL CABINET JUAN	cabinetjuan	Monsieur	rabbe olivier	\N	\N	nan	2021-06-10 18:21:09.791286	t
212	110901	ARRET  COLLABORATION	SARL AOO	cabinetivigneuxdebretagne	Madame	diais	\N	\N	537 642 308 00010	2021-06-10 18:21:16.888231	t
205	110660	INACTIF-ARRET COLLABORATION	SARL AGENCE AUTEUIL	guyhoquetauteuil	Madame	atlani. natacha	\N	\N	82059122000018	2021-06-10 18:21:10.607822	t
206	110670	CLIENT ACTIF	SARL ELSE IMMO	saintmarsimmobilier-sarlelseimmo	Madame	colomez christine	\N	\N	790 341 838 00031	2021-06-10 18:21:11.528293	t
220	110950	REPRENDRE CONTACT	AFR IMMOBILIER SARL	afrimmobilier	Madame	pilatte sandrine	\N	\N	nan	2021-06-10 18:21:24.047272	t
213	110902	ARRET  COLLABORATION	SARL FMLJ	cabinetifaydebretagne	Madame	diais	\N	\N	811 627 231 00012	2021-06-10 18:21:17.673914	t
214	110910	REPRENDRE CONTACT	NEXITY LAMY SAS	nexityparistrocadero	Monsieur	scholtes	\N	\N	nan	2021-06-10 18:21:18.666342	t
215	110920	CLIENT ACTIF	FOURNY IMMOBILIER	agenceimmobiliereth.fournythierryfourny	Monsieur	fourny thierry	\N	\N	43390528800042	2021-06-10 18:21:19.496868	t
221	110960	CLIENT PARTICULIER	.	.	Madame	meire agnès	\N	\N	nan	2021-06-10 18:21:25.106988	t
216	110930	CLIENT PARTICULIER	.	.	Madame	bajard bras	\N	\N	nan	2021-06-10 18:21:20.516286	t
217	110940	CLIENT PARTICULIER	.	.	Monsieur	de saint perne	\N	\N	nan	2021-06-10 18:21:21.464743	t
226	120030	CLIENT PARTICULIER	.	.	Madame	normand vallet christine	\N	\N	nan	2021-06-10 18:21:29.835286	t
222	120010	CLIENT INACTIF	L'ATELIER IMMOBILIER	l'adresse-nantes-l'atelierimmobilier	Madame	guineheux nancy	\N	\N	49154471400018	2021-06-10 18:21:25.904533	t
223	121047	CLIENT ACTIF	OFFICE NOTARIAL ALEXANDRE MORICEAU	officenotarialalexandremoriceau	Madame	vicet karine / le pin stéphane	\N	\N	32335511500029	2021-06-10 18:21:26.876982	t
227	\N	CLIENT INACTIF	CHRISTINE DUMAS IMMOBILIER	christinedumasimmobilier	Madame	dumas christine	\N	\N	nan	2021-06-10 18:21:30.728775	t
224	120020	CLIENT ACTIF	MAISON BLANCHE - L'ADRESSE LAVAL	l'adressemaisonblanche	Monsieur	blanvillain sebastien	\N	\N	nan	2021-06-10 18:21:27.769467	t
233	122080	CLIENT INACTIF	SARL LE MARTRET IMMOBILIER	lemartretimmobilier	Monsieur	le martret erwan	\N	\N	44294105000019	2021-06-10 18:21:35.945963	t
228	1270257	CLIENT ACTIF	SARL AGENCE DES TILLEULS	agencedestilleuls	Madame	camberlin nathalie	\N	\N	349 105 288 00022	2021-06-10 18:21:31.674968	t
232	120155	CLIENT INACTIF	SARL JANIN IMMOBILIER	janinimmobilier	Monsieur	janin jean-michel	\N	\N	30696518700025	2021-06-10 18:21:35.121435	t
230	120060	CLIENT INACTIF	PROFIGEST PATRIMOINE	profigestimmobilier	Monsieur	raymont eric	\N	\N	nan	2021-06-10 18:21:33.435962	t
231	120070	CLIENT ACTIF	DJC INVEST	craunotdjcinvest	Monsieur	craunot david	\N	\N	FR56494310980	2021-06-10 18:21:34.267488	t
234	120080	CLIENT PARTICULIER	.	.	Monsieur	kanoni	\N	\N	nan	2021-06-10 18:21:36.773491	t
235	109985	Doublon à supprimer	L'ADRESSE 4 IMMO	l'adresse4immo	Monsieur	pennanec'h thierry	\N	\N	44762160800044	2021-06-10 18:21:37.683971	t
236	120090	CLIENT INACTIF	SARL L.V IMMOBILIER CONSEIL	cabinetmilivinlaforet	Monsieur	grondin laurent	\N	\N	nan	2021-06-10 18:21:38.591451	t
237	120100	REPRENDRE CONTACT	CABINET TREHARD	cabinettreard-vivreici	Monsieur	trehard emmanuel	\N	\N	nan	2021-06-10 18:21:39.382	t
238	120091	CLIENT PARTICULIER	COUJANDASSAMY SOUCEMARIANADIN	\N	Monsieur	coujandassamy soucemarianadin	\N	\N	nan	2021-06-10 18:21:40.152561	t
239	120092	CLIENT PARTICULIER	PICAUD MAURICE	particulier	Monsieur	picaud maurice	\N	\N	nan	2021-06-10 18:21:41.114011	t
240	122015	CLIENT INACTIF	AGENCE GRIFFON GUEGUEN IMMOBILIER	agencegriffongueguenimmobilier	Monsieur	griffon erwan	\N	\N	nan	2021-06-10 18:21:42.102447	t
241	120120	REPRENDRE CONTACT	CABINET TAPISSIER	cabinettapissier	Monsieur	friess richard	\N	\N	nan	2021-06-10 18:21:42.907991	t
242	120130	ARRET  COLLABORATION	VALRIM	valrimorpi	Monsieur	marquant sébastien	\N	\N	08697101700040	2021-06-10 18:21:43.905417	t
309	123350	nan	SOCIETE CAP JAURES	orpi101jaures	MADAME	lamour solene	\N	\N	51370591300012	2021-06-10 18:23:01.117039	t
244	120150	CLIENT PARTICULIER	AMBGESTION IMMO	l'adresse-chavilles	Madame	franceschi marie	\N	\N	nan	2021-06-10 18:21:45.732377	t
245	120190	REPRENDRE CONTACT	AGENCE IMMOBILIERE DU CENTRE LAFORET	laforetimmobilierducnetre	Monsieur	sarrade loucheur cédric	\N	\N	439 222 654 00055	2021-06-10 18:21:46.531916	t
347	1270201	CLIENT ACTIF	SARL INDEPIMMO	indepimmo	Monsieur	rambeau christophe	\N	\N	79061304600016	2021-06-10 18:23:44.742797	t
246	120160	CLIENT ACTIF	OFFICE MAITRE DARPHIN	officemaitredarphin	Monsieur	darphin jean-christophe	\N	\N	nan	2021-06-10 18:21:47.583315	t
247	120170	CLIENT INACTIF	SARL DE BERRANGER	\N	Monsieur	de berranger philippe	\N	\N	nan	2021-06-10 18:21:48.45282	t
253	121003	CLIENT PARTICULIER	CANNELLE ALEXANDRE	\N	Monsieur	cannelle alexandre	\N	\N	nan	2021-06-10 18:21:56.035488	t
312	123380	CLIENT PARTICULIER	DE BEAUREGARD Arnaud	particulier	Monsieur	de beauregard arnaud	\N	\N	nan	2021-06-10 18:23:04.392169	t
256	121030	CLIENT PARTICULIER	.	.	Monsieur	le bris corentin	\N	\N	nan	2021-06-10 18:21:58.658988	t
257	121040	CLIENT PARTICULIER	.	.	Monsieur	piens arnaud	\N	\N	nan	2021-06-10 18:21:59.529493	t
313	123390	CLIENT PARTICULIER	nan	\N	Monsieur	mailhac christophe	\N	\N	nan	2021-06-10 18:23:05.530518	t
326	123530	nan	OFFCIE NOTARIAL F.CADET	offcienotarialf.cadet	Monsieur	plourdeau arnaud	\N	\N	300 349 347 00025	2021-06-10 18:23:18.578223	t
396	124370	CLIENT INACTIF	CADEAU THEVIN SARL	orpiagencethevineguia	Madame	cadeau marianne	\N	\N	33272634800052	2021-06-10 18:24:46.751071	t
334	123580	CLIENT PARTICULIER	DELAPIERRE Sylvie et NQUELLAERD	particulier	Madame et Monsieur	delapierre sylvie et nquellaerd	\N	\N	nan	2021-06-10 18:23:27.763496	t
351	123850	REPRENDRE CONTACT	SARL a2jimmo	orpigagny-a2jimmo	Monsieur	vasovic slobodan	\N	\N	37807360500024	2021-06-10 18:23:49.332176	t
335	123600	CLIENT PARTICULIER	BLAIS Gérard	particulier	Monsieur	blais gérard	\N	\N	nan	2021-06-10 18:23:28.669979	t
336	123630	CLIENT ACTIF	SARL LES HERBIERS GESTION	l'adresselesherbiersgestion	Messieux	blanvillain et teillol	\N	\N	nan	2021-06-10 18:23:29.776351	t
352	123950	CLIENT PARTICULIER	nan	\N	Monsieur	coulay guy	\N	\N	nan	2021-06-10 18:23:50.620444	t
340	123680	nan	FRANCE EDL	franceedl	Monsieur	baudin guillaume	\N	\N	52835861700025	2021-06-10 18:23:36.243652	t
341	123690	CLIENT ACTIF	AGENCE CADEAU	orpi-agencecadeau	Monsieur	garcia sébastien	\N	\N	30638804200054	2021-06-10 18:23:37.442966	t
342	123700	CLIENT ACTIF	SAS PONS & COMPAGNIE	pons&cieimmobilier	Monsieur	beddeleem stéphane	\N	\N	455 503 359 00016	2021-06-10 18:23:39.527778	t
353	123960	CLIENT INACTIF	AIL IMMOBILIER - AGENCE IMMOBILIER LILLOISE	agenceimmobilierelilloise	Monsieur & Madame	ponche	\N	\N	414 908 988 00010	2021-06-10 18:23:51.578892	t
343	123710	CLIENT INACTIF	LEGROS IMMOBILIER	legrosimmobilier	Monsieur	guedon stéphane	\N	\N	39057869800016	2021-06-10 18:23:40.599163	t
344	123720	CLIENT ACTIF	SARL LANTA IMMOBILIER	coeurlauragaisimmoagencedelanta	Monsieur	soual yannick	\N	\N	44328553100010	2021-06-10 18:23:41.573608	t
354	123970	CLIENT PARTICULIER	SAPAC	\N	Madame	comte	\N	\N	nan	2021-06-10 18:23:52.456391	t
345	123685	CLIENT PARTICULIER	PICAVEZ PHILIPPE	picavezphilippe	Monsieur	picavez philippe	\N	\N	nan	2021-06-10 18:23:42.732949	t
346	124170	CLIENT ACTIF	SARL TERRE D'ARGENCE IMMOBILIER	agenceterred'argenceimmobilier	Madame et Monsieur	poincet philippe et sophie	\N	\N	451779912000018	2021-06-10 18:23:43.679405	t
397	124380	CLIENT PARTICULIER	SCI	scikinos	Madame	chailloux marie ,  galon pauline	\N	\N	80744605900014	2021-06-10 18:24:47.920407	t
356	124165	REPRENDRE CONTACT	SARL IMMOBILIER HELOIN	heloinimmobilier	Monsieur	paul bertrand	\N	\N	35299872800054	2021-06-10 18:23:54.327323	t
359	124020	CLIENT INACTIF	BRAVOGROUP TECH CO LTD	\N	Monsieur	steven	\N	\N	69987483-000-10-18-4	2021-06-10 18:23:57.742371	t
393	124330	CLIENT INACTIF	NOTAIRE FONTAINE ROUSSEL & ASSOCIES	fontaineroussel&associes	Maître	mme deplaet  / etude fontaine roussel&associes	\N	\N	XXX	2021-06-10 18:24:41.797901	t
394	124350	ARRET  COLLABORATION	SARL LE RELAIS IMMOBILIER	lerelaisimmobilier	Madame	rossignol angelique	\N	\N	324 804 889 00016	2021-06-10 18:24:44.101587	t
395	122001	CLIENT PARTICULIER	nan	\N	Monsieur	plantagenet patrick	\N	\N	nan	2021-06-10 18:24:45.655699	t
401	124510	CLIENT ACTIF	SAS BSGI	bsgimmecorinnecattiaux	Madame	cattiaux corinne	\N	\N	40292514300065	2021-06-10 18:24:53.65613	t
398	124390	CLIENT INACTIF	SARL PLACE DE l'IMMOBILIER LAVAL	stephaneplaza-laval	Monsieur	cacheux sebastien & sophie herve	\N	\N	832 995 427 00016	2021-06-10 18:24:49.107725	t
399	124400	CLIENT INACTIF	EQUIT IMMOBILIER	equitimmobilier	Madame	brouttier brérengère	\N	\N	nan	2021-06-10 18:24:50.15113	t
404	124470	CLIENT ACTIF	SARL	andreimmobilier-gestion	Madame	andre- huet honorine  mr andre edouard	\N	\N	53145774500028	2021-06-10 18:24:57.243078	t
400	124410	CLIENT PARTICULIER	XXX	xxx	Madame	nafissa fellah	\N	\N	XXX	2021-06-10 18:24:52.551759	t
402	124450	CLIENT ACTIF	SASU DELF IMMOGEST	l'adressenation-sasudelfimmogest	Madame	perrillat delphine	\N	\N	81082315300012	2021-06-10 18:24:54.757498	t
403	124460	CLIENT ACTIF	SARL CSG IMMOBILIER	guyhoquetsceaux-sarlcsgimmobilier	Madame	coppola christine      coppola gregory	\N	\N	825103831	2021-06-10 18:24:55.952817	t
405	124520	CLIENT PARTICULIER	FATMA TRIKI	fatmatriki	Madame	fatma triki	\N	\N	XXX	2021-06-10 18:24:58.68226	t
406	124490	CLIENT ACTIF	AGENCE DE VALLIERE - GESTION	agencedevalliere-gestion	Madame	fall barbara	\N	\N	494 116 320 00016	2021-06-10 18:25:02.257216	t
407	124480	CLIENT ACTIF	COOPTALIS - LINK MOBILITE	coptalis-linkmobilite	Monsieur	jakubowsky benjamin	\N	\N	49884679900092	2021-06-10 18:25:03.733371	t
417	124610	CLIENT ACTIF	IMMOPLESSIS	l'adresseplessisrobinsson	Monsieur	gandillon ohilippe	\N	\N	444 525 976 00015	2021-06-10 18:25:14.486715	t
418	124620	CLIENT ACTIF	SARL RUE DE LA PAIX;IMMO	ruedelapaix;immom.batardierejacques	Monsieur	batardiere jacques	\N	\N	843 438 680 00020	2021-06-10 18:25:15.564103	t
419	124630	CLIENT INACTIF	SARL EFI	ericfranquesimmobilier	Monsieur	eric franques	\N	\N	384 010 286 00043	2021-06-10 18:25:16.487573	t
420	124630	CLIENT INACTIF	nan	vacherandimmobilierlambersart	Madame	grimmelpont stephanie	\N	\N	793 585 670 00011	2021-06-10 18:25:17.532976	t
243	120140	CLIENT PARTICULIER	SCI LE LAC	.	Monsieur	raye philippe	\N	\N	nan	2021-06-10 18:21:44.720951	t
248	12220	CLIENT INACTIF	SARL MAITE MARTEAU	maitemarteau	Madame	marteau berceron ingrid	\N	\N	nan	2021-06-10 18:21:50.868444	t
249	121000	CLIENT ACTIF	PODELIHA	podeliha	Madame	adam patricia	\N	\N	05720113900029	2021-06-10 18:21:52.322611	t
310	123360	ARRET  COLLABORATION	CABINET G.CARDINAL	cabinetg.cardinal	MONSIEUR	duart david	\N	\N	79501577500013	2021-06-10 18:23:02.269383	t
250	121001	CLIENT ACTIF	SAS AAAAMB GESTION IMMOBILIERE	l'adresse-4ambgestionimmo	Madame	franceschi marie	\N	\N	802 248 476 00029	2021-06-10 18:21:53.271069	t
251	121050	ARRET  COLLABORATION	SARL OUEST BRETAGNE IMMOBILIER	obi29	Monsieur	kerebel damien	\N	\N	nan	2021-06-10 18:21:54.167557	t
252	121002	CLIENT PARTICULIER	SCI ROCHER	\N	Monsieur	rocher jean charles	\N	\N	nan	2021-06-10 18:21:55.14	t
311	123370	CLIENT	nan	\N	MONSIEUR	\N	\N	\N	nan	2021-06-10 18:23:03.534658	t
254	121010	REPRENDRE CONTACT	HP CONSEILS IMMOBILIER	laforethpconseils	Monsieur	pelon hervé	\N	\N	nan	2021-06-10 18:21:56.819039	t
255	\N	PROSPECT 1ère propo le 9/6/18	KERHUON IMMOBILIER	cabinetrebours	Monsieur	rebours ronana	\N	\N	nan	2021-06-10 18:21:57.755506	t
314	123400	CLIENT PARTICULIER	nan	\N	Monsieur	metivier laurent et madame blouin sonia	\N	\N	nan	2021-06-10 18:23:06.423009	t
329	123620	REPRENDRE CONTACT	SAS O'REAL IMMOBILIER TRANSACTIONS	o'realimmobiliertransactions	Monsieur	talban joseph	\N	\N	824 961 874 00016	2021-06-10 18:23:21.602495	t
315	123480	CLIENT INACTIF	SARL B.C IMMOBILIER	l'adresse-stbranchsetl'adressetours	Madame	chevalier brigite	\N	\N	483659983	2021-06-10 18:23:07.620325	t
316	124410	CLIENT INACTIF	SARL- INEDIT IMMOBILIER	ineditimmobilier	Monsieur	leclercq etienne	\N	\N	500 944 012 00037	2021-06-10 18:23:08.562786	t
317	123420	ARRET DE COLLABORATION SUITE VENTE	SIGLA GESTION	siglaimmobilier	Madame	voisin isabelle	\N	\N	49871124100030	2021-06-10 18:23:09.503248	t
330	123590	ARRET  COLLABORATION	CABINET IROISE IMMOBILIER	iroiseimmobilier	Monsieur	riou christophe	\N	\N	339311060	2021-06-10 18:23:23.662839	t
318	107505	CLIENT ACTIF	SARL CABIENT FREDELION	guyhoquet-cabinetfredelion	MONSIEUR	teboul et bismuth	\N	\N	49240893500020	2021-06-10 18:23:10.648642	t
319	123430	ARRET  COLLABORATION	SARL BH IMMOBILIER	l'adresse-castanettolosan-bhimmobilier	MONSIEUR	heracles et bourgoin	\N	\N	519654115 00020	2021-06-10 18:23:11.483169	t
349	123750	CLIENT INACTIF	SARL MAUDIN IMMOBILIER	laforetdoldebretagne	Monsieur	maudet & meron jérôme	\N	\N	44781668700027	2021-06-10 18:23:47.270354	t
320	123440	ARRET  COLLABORATION	SARL AET IMMOBILIER	l'adresse-toulouse-aetimmobilier	MONSIEUR	heracles et bourgoin	\N	\N	42488111800014	2021-06-10 18:23:12.397644	t
331	123550	REPRENDRE CONTACT	AGENCE NOUALLER IMMOBILIER	orpinouallet	Monsieur	nouallet	\N	\N	452977044	2021-06-10 18:23:24.861155	t
321	123450	CLIENT ACTIF	SARL MBM IMMOBILIER	locagestion-toulousembmimmobilier	MADAME	vanhecke nathalie	\N	\N	404 821 373 00036	2021-06-10 18:23:13.3491	t
322	123460	CLIENT INACTIF	SARL AERO IMMOBILIER	l'adresse-colomiers	MADAME	rondonnet josiane	\N	\N	38125276600047	2021-06-10 18:23:14.594502	t
323	123470	CLIENT INACTIF	SARL GI.CI.CA.	l'adresse-toulouse-gicaconseil	MADAME	germa nathalie	\N	\N	40320284900036	2021-06-10 18:23:15.482991	t
332	123560	CLIENT ACTIF	SAS SARPIG	pierres&co-sassarpig	Monsieur	sarrazin pierre	\N	\N	81079156600013	2021-06-10 18:23:25.840597	t
324	123500	CLIENT ACTIF	CIVM IMMOBILIER	l'adresse-civm	MONSIEUR	pouyet laurent	\N	\N	41090591300019	2021-06-10 18:23:16.679315	t
325	123510	ARRET  COLLABORATION	nan	\N	Madame	quentin marie	\N	\N	nan	2021-06-10 18:23:17.700726	t
327	\N	nan	nan	\N	nan	\N	\N	\N	nan	2021-06-10 18:23:19.542673	t
328	123540	CLIENT ACTIF	S2F IMMOBILIER	guyhoquetparis9ouests2fimmobilier	Monsieur	faure fabian	\N	\N	81975320300028	2021-06-10 18:23:20.262261	t
333	123570	CLIENT PARTICULIER	nan	\N	Monsieur	lafranceschina lionel	\N	\N	nan	2021-06-10 18:23:26.868009	t
408	124500	CLIENT ACTIF	SARL ACTIF IMMO	l'adresseromorantin	Madame	cretier carole	\N	\N	75247734900019	2021-06-10 18:25:05.145566	t
337	123650	CLIENT INACTIF	ASTIM  SARL - NESTENN ANGERS	nestennangers	Monsieur	bouly laurent	\N	\N	43336341300017	2021-06-10 18:23:31.157559	t
350	123800	CLIENT ACTIF	SARL IMMOBILIERE DE LILLE	immobilieredelille	Monsieur	guilloteau charlotte	\N	\N	833 531 098 00014	2021-06-10 18:23:48.241798	t
338	123660	CLIENT PARTICULIER	LOINARD Antoine	loinardantoine	Monsieur	loinard antoine	\N	\N	nan	2021-06-10 18:23:32.318895	t
339	123670	REPRENDRE CONTACT	AVANTAGE GESTION	stephaneplazaimmobilier	Madame	des fontaines fleur	\N	\N	818622896	2021-06-10 18:23:34.420695	t
355	123980	CLIENT PARTICULIER	nan	\N	Madame & Monsieur	rolland robert	\N	\N	nan	2021-06-10 18:23:53.33489	t
348	123730	CLIENT ACTIF	BEE IMMO SARL	beeimmolaforet	Monsieur	brochet xavier	\N	\N	508626330   502662042	2021-06-10 18:23:46.010073	t
361	124040	INACTIF-ARRET COLLABORATION	REPUBLIQUE IMMOBILIER	republiqueimmobilier-laforet	Monsieur	da costa laurent	\N	\N	84093062200013	2021-06-10 18:24:00.301912	t
357	124000	CLIENT INACTIF	SCI CDP PATRIMOINE	cdppatrimoine	Madame	lettelier flo	\N	\N	498 276 963 00044	2021-06-10 18:23:55.443687	t
358	124010	CLIENT PARTICULIER	nan	\N	Monsieur	roland robert et huguette	\N	\N	nan	2021-06-10 18:23:56.50308	t
360	124030	CLIENT ACTIF	AGENCE IMMOBILIERE DE LA MAIRIE	orpirosnysousboisagencedelamairie	Monsieur	denis nicolas	\N	\N	505057919	2021-06-10 18:23:58.924696	t
362	124050	INACTIF-ARRET COLLABORATION	SAS PATRIMONIA - ORPI	orpi-sasimmo75	Monsieur	hoarau laurent	\N	\N	40308522800035	2021-06-10 18:24:01.429266	t
410	124530	CLIENT INACTIF	SARL	shconseilimmobilieretpatrimoine	Madame	sanroma christine	\N	\N	52901831900010	2021-06-10 18:25:07.034486	t
409	124550	CLIENT INACTIF	VALLOIRE HABITAT LE MANS ET LAVAL	valloirehabiatagencelaval	Madame	perthuis patricia	\N	\N	nan	2021-06-10 18:25:06.015071	t
411	124540	CLIENT INACTIF	EURL BRIGITTE TESTARD	agencedeslilas	Madame	mme christine testard	\N	\N	53172789900027	2021-06-10 18:25:08.038911	t
412	124560	CLIENT ACTIF	SARL VESTALIA IMMO	vestaliaimmothierrylescure	Monsieur	thierry lescure	\N	\N	52323706300020	2021-06-10 18:25:08.954389	t
413	124570	CLIENT ACTIF	EPYCEAIMMO	laforetangersepyceaimmo	Monsieur	pinault pierre yves	\N	\N	848360509	2021-06-10 18:25:09.939826	t
414	124580	CLIENT ACTIF	SAS SOGIEF	sogiefimmobiliertonysipaseuth	Madame	hong pauline	\N	\N	832753271	2021-06-10 18:25:11.52441	t
415	124590	CLIENT ACTIF	ADX GROUPE CREDIT AGRICOLE	creditagricoleadxgroupe	ADX GROUPE CREDIT AGRICOLE	adx groupe credit agricole	\N	\N	nan	2021-06-10 18:25:12.637773	t
416	124600	CLIENT ACTIF	HAG IMMOBILIER	l'adressepoissyhagimmobilier	Monsieur	tabone et hafner	\N	\N	501 623 565 00022	2021-06-10 18:25:13.629207	t
455	1270237	CLIENT ACTIF	DEHEUL Vincent	deheul﻿vincent	Monsieur	deheul vincent	\N	\N	xxx	2021-06-10 18:26:01.088697	t
421	124650	CLIENT INACTIF	SARL PRIMEA	primeaimmobilier	Mesdames	d'haussy anne-charlotte & flament déborah	\N	\N	348 730 581 00033	2021-06-10 18:25:18.633352	t
422	12660	CLIENT INACTIF	SARLAU VLADEREN IMMO	vladerenimmo	Madame	roger marine	\N	\N	509 078 887 00049	2021-06-10 18:25:19.747711	t
423	126670	CLIENT PARTICULIER	PARTICULIER	particulier	nan	roche  guillaume	\N	\N	XXX	2021-06-10 18:25:20.839091	t
424	1270198	CLIENT ACTIF	SOCIETE A RESPONSABILITE LIMITEE	immobilieresaintjames	Monsieur	nardot stephane	\N	\N	48378646	2021-06-10 18:25:21.82153	t
425	1270199	CLIENT ACTIF	SAS O THENTIK	laforetimmo-cholet	Monsieur	duguet gregoire	\N	\N	52036234400035	2021-06-10 18:25:22.723012	t
426	1270200	CLIENT ACTIF	SARL MOUTINHO CONSEIL IMMOBILIER	remaxhomepremiummouthinoconseilimmobilier	Monsieur	moutinho brice	\N	\N	500662374	2021-06-10 18:25:23.772412	t
427	1270207	CLIENT PARTICULIER	PARTICULIER	particulier	Monsieur	godefroy alexandre	\N	\N	nan	2021-06-10 18:25:24.863789	t
428	1270205	CLIENT PARTICULIER	PARTICULIER	particulier	Monsieur	perrier  jean-joel	\N	\N	nan	2021-06-10 18:25:25.902196	t
429	1270203	CLIENT PARTICULIER	PARTICULIER	particulier	Monsieur	messager michel	\N	\N	nan	2021-06-10 18:25:26.930611	t
430	1270202	CLIENT ACTIF	SARL A.I.G	guyhoquetexelmansrodet-rieu	Madame	rodet rieu valerie	\N	\N	42956739900036	2021-06-10 18:25:28.378781	t
431	1270204	CLIENT ACTIF	SARL TALENTIS IMMO	talentisimmommefonteneaumarianne	Madame	fonteneau marianne	\N	\N	49435648800010	2021-06-10 18:25:29.805967	t
432	1270207	nan	PARTICULIER	particulier	Madame	blouin sonia	\N	\N	nan	2021-06-10 18:25:30.938318	t
433	1270206	CLIENT ACTIF	SCI F.D.J	scifdjm.azemadavid	Monsieur	azema  david	\N	\N	81508648300014	2021-06-10 18:25:31.951739	t
434	1270208	CLIENT PARTICULIER	PARTICULIER	particulier	Monsieur	courtin jean marie	\N	\N	nan	2021-06-10 18:25:33.207022	t
435	1270209	CLIENT PARTICULIER	PARTICULIER	particulier	Madame	blais yvette	\N	\N	nan	2021-06-10 18:25:34.438319	t
452	1270232 l'Adresse Gambetta\n1270233 l'Adresse Cersoy & Girard	CLIENT ACTIF	SAS HOLDING LAURENT	l'adressegambettal'adressecersoy&girard	Monsieur	laurent eric	\N	\N	41175479900020	2021-06-10 18:25:56.61425	t
453	1270234	CLIENT ACTIF	WEST IMMOBILIER - LAFORET	westimmobilierlaforetquimper	Monsieur	le floc'h françois	\N	\N	50842406600092	2021-06-10 18:25:58.548145	t
454	1270235	CLIENT ACTIF	THEMEIS IMMOBILIER SGI SARL SOBIM GESTION IMMOBILIER	themeisimmobilier-sgisarlsombimgestionimmobilier	Monsieur	morel jean marc	\N	\N	80235796200017	2021-06-10 18:25:59.633524	t
436	1270210	CLIENT ACTIF	SARL L'IMMOBILIER POUR TOUS	century21l'immobilierpourtous	Madame et Monsieur	ribeiro anais // zitouni hacene	\N	\N	53825839300015	2021-06-10 18:25:35.512706	t
437	1270211	CLIENT PARTICULIER	PARTICULIER	particulier	Monsieur	mr delmas	\N	\N	nan	2021-06-10 18:25:36.460166	t
438	1270222	CLIENT PARTICULIER	PARTICULIER	particulier	Madame	couturier marie-pierre	\N	\N	nan	2021-06-10 18:25:37.451598	t
439	1270213	CLIENT ACTIF	PRO CITY IMMOBILIER	procityimmobilier	Monsieur	payen franck	\N	\N	753300169	2021-06-10 18:25:38.399059	t
440	1270216	CLIENT ACTIF	PROCITY GEST	procitygestimmobilierprocitygest	Madame	desnoyers de bieville dixie	\N	\N	799612932	2021-06-10 18:25:39.406481	t
441	1270214	CLIENT INACTIF	ROUSSEAU IMMOBILIER IMMOBILIERE COMINE	alainrousseauimmobilier	Monsieur	rousseau guillaume	\N	\N	414 709 980 00018	2021-06-10 18:25:40.55283	t
442	1270217	CLIENT PARTICULIER	GOUT JOSEPH	goutjoseph	Monsieur	gout joseph	\N	\N	XXX	2021-06-10 18:25:41.793118	t
443	1270215	CLIENT ACTIF	SARL LOUAME	l'adressecarquefou-sarllouame	Monsieur	blanvillain sebastien	\N	\N	538305830	2021-06-10 18:25:42.905485	t
444	1270220	CLIENT ACTIF	SARL BOOSTER ROSERAIE	boosterimmobilier	Madame	reglat berengere	\N	\N	51498311300010	2021-06-10 18:25:44.061823	t
445	1270221	CLIENT	SALERNO MARC	salernomarc	Monsieur	salerno marc	\N	\N	XXX	2021-06-10 18:25:45.079241	t
446	1270223	CLIENT ACTIF	SARL MPI	pennimmobilierimmobiliersarlmpi	Monsieur	penn marc	\N	\N	44520775600013	2021-06-10 18:25:46.181211	t
447	1270225	CLIENT ACTIF	J&R IMMOBILIER	laforetstorensdegamevilleelodiepech	Monsieur	rezag remy	\N	\N	838 405 322 00010	2021-06-10 18:25:48.259022	t
448	1270227	CLIENT ACTIF	ES IMMO	l'adressesaintpierremontlimart	Madame	secher emilie	\N	\N	882 702 244 00014	2021-06-10 18:25:50.188919	t
449	1270228	CLIENT ACTIF	SCI IMMOGROUP	immogroupmtourneuxetmvaygeois	Messieurs	m ludovic tourneux\nm alexis vaugeois	\N	\N	827 837 915 00012	2021-06-10 18:25:53.579988	t
450	1270229	CLIENT ACTIF	SARL  LOGETTE IMMOBILIER	nestenn-logetteimmobilier	Madame	christine logette	\N	\N	78934154200015	2021-06-10 18:25:54.61739	t
451	\N	CLIENT ACTIF	PARTICULIER	particulier	Madame et Monsieur	petillat damien et robert delphine	\N	\N	PARTICULIER	2021-06-10 18:25:55.672787	t
456	1270238	CLIENT ACTIF	SAVOUREUX CYRIL	savoureuxcyril	Monsieur	savoureux cyril	\N	\N	xxx	2021-06-10 18:26:02.017163	t
457	\N	CLIENT ACTIF	MR ET MME DARDE	mretmmedarde	Madame et Monsieur	darde	\N	\N	xxx	2021-06-10 18:26:02.973616	t
458	1270240	CLIENT ACTIF	SASU ESPACE HABITAT BCI	espacehabitat	Madame	lagueyt  brigitte	\N	\N	50502065100028	2021-06-10 18:26:03.89609	t
459	\N	CLIENT ACTIF	SARL CABINET FRUCHET	cabinetfruchet	Monsieur	fruchet benjamin	\N	\N	38221812100012	2021-06-10 18:26:04.942494	t
460	\N	CLIENT PARTICULIER	SCI PIPA ACC	xxx	Madame	clavier anne-cecile	\N	\N	83434119000017	2021-06-10 18:26:06.523592	t
461	\N	CLIENT PARTICULIER	XXX	xxx	Monsieur	blot patrice	\N	\N	XXX	2021-06-10 18:26:07.849833	t
462	1270244	CLIENT ACTIF	IMMO DE FRANCE LA ROCHE SUR YON	immodefrancelarochesuryon	MADAME	vaigreville murielle	\N	\N	44136160700035	2021-06-10 18:26:08.992549	t
463	1270248	CLIENT ACTIF	SASU BERNARD KOENIG IMMOBILIER	guyhoquetparis14plaisancepernety	Monsieur	bernard  eric	\N	\N	82110015300013	2021-06-10 18:26:10.306224	t
464	\N	CLIENT ACTIF	XXX	xxx	Monsieur	perrier jean joel	\N	\N	XXX	2021-06-10 18:26:11.890318	t
465	1270252	CLIENT PARTICULIER	XXX	xxx	Madame et Monsieur	detoc olivier et laetitia	\N	\N	XXX	2021-06-10 18:26:12.888753	t
466	\N	CLIENT ACTIF	SARL ACTIAL	l'adressecarquefou-sarlactial	Monsieur	blanvillain sebastien	\N	\N	389 918 137 00040	2021-06-10 18:26:14.537025	t
468	1270255	CLIENT ACTIF	XXX	blanchemariehelene	Madame	blanche marie helene	\N	\N	XXX	2021-06-10 18:26:16.727765	t
469	1270256	CLIENT ACTIF	SAS	towerimmobilier	Monsieur	charpentier david	\N	\N	813492683	2021-06-10 18:26:17.741187	t
471	\N	CLIENT ACTIF	SCI DES AMITIERES	morantinagnes	Madame	morantin agnes	\N	\N	878 321 231 00010	2021-06-10 18:26:20.182885	t
473	1270266	CLIENT ACTIF	PARTICULIER	perrinehansen	Madame	perrine hansen	\N	\N	XXX	2021-06-10 18:26:21.741406	t
474	\N	CLIENT ACTIF	PARTICULIER	epagnouxsebastienludmila	Monsieur Madame	epagnoux sebastien ludmila	\N	\N	XXX	2021-06-10 18:26:23.320502	t
475	\N	nan	nan	bougelaurent	nan	\N	\N	\N	nan	2021-06-10 18:26:24.348915	t
477	\N	CLIENT ACTIF	PARTICULIER	manganijean-michel	Madame	lefevre christine	\N	\N	XXX	2021-06-10 18:26:27.33221	t
479	\N	CLIENT PARTICULIER	PARTICULIER	particulier	Monsieur	lestienne thomas	\N	\N	XXX	2021-06-10 18:26:29.574933	t
467	\N	CLIENT ACTIF	XXX	boivin-champeauxbenedicteetalix	Madame et Monsieur	boivin-champeaux benedicte et alix	\N	\N	XXX	2021-06-10 18:26:15.742329	t
470	\N	CLIENT ACTIF	XXX	chavyclaire	Madame	chavy claire	\N	\N	XXX	2021-06-10 18:26:19.062298	t
472	\N	CLIENT ACTIF	SARL ACM TRANSACTION	acmtransactionmmebroussegeraldine	Madame	brousse geraldine	\N	\N	49788559000024	2021-06-10 18:26:21.068038	t
476	\N	CLIENT ACTIF	PARTICULIER	lefevrechristine	Monsieur	bouge laurent	\N	\N	XXX	2021-06-10 18:26:25.294375	t
478	\N	CLIENT ACTIF	PARTICULIER	manganijean-michel	Monsieur	mangani  jean-michel	\N	\N	XXX	2021-06-10 18:26:28.4026	t
\.


--
-- Data for Name: Client_History; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Client_History" (id, client_id, adresse1, adresse2, etat_client, cp, ville, pays, login_extranet, mpd_extranet, abonnement, date, visibility) FROM stdin;
1	1	Centre Commercial des Grandes Terres	nan	t	78160	MARLY-LE-ROY	FRANCE	AM001	H2Z1FA	\N	2021-06-10 18:17:51.379611	t
2	2	12 rue de l'Orangerie	nan	t	78000	VERSAILLES	FRANCE	nan	nan	\N	2021-06-10 18:17:52.681869	t
3	3	12 rue de l'Orangerie	nan	t	78000	VERSAILLES	FRANCE	nan	nan	\N	2021-06-10 18:17:53.571362	t
4	4	12 rue de l'Orangerie	nan	t	78000	VERSAILLES	FRANCE	nan	nan	\N	2021-06-10 18:17:54.356912	t
5	5	12 rue de l'Orangerie	nan	t	78000	VERSAILLES	FRANCE	nan	nan	\N	2021-06-10 18:17:55.204429	t
6	6	174 rue de Tolbiac	nan	t	75013	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:17:56.062939	t
7	7	17 rue Dumont d'Urville	nan	t	75016	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:17:57.060369	t
8	8	9 rue Pourtoules	nan	t	84100	ORANGE	FRANCE	nan	nan	\N	2021-06-10 18:17:58.039809	t
9	9	12  rue de l'Orangerie	nan	t	78000	VERSAILLES	FRANCE	nan	nan	\N	2021-06-10 18:17:59.117191	t
10	10	4 Place Vendôme	nan	t	75001	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:18:00.529397	t
11	11	8 RUE DE LA CLAIE	nan	t	49070	BEAUCOUZE	FRANCE	AM1841	H2Z1FA1	\N	2021-06-10 18:18:01.386903	t
12	12	70 bis route de la Reine	nan	t	92100	BOULOGNE BILLANCOURT	FRANCE	nan	nan	\N	2021-06-10 18:18:02.399327	t
13	13	7 bis rue de la Parroisse	nan	t	78000	VERSAILLES	FRANCE	nan	nan	\N	2021-06-10 18:18:03.741558	t
14	14	2 Place de la Gare	nan	t	92350	BOURG LA REINE	FRANCE	nan	nan	\N	2021-06-10 18:18:04.742986	t
15	15	1bis rue du Haras	nan	t	49100	ANGERS	FRANCE	nan	nan	\N	2021-06-10 18:18:05.712432	t
16	16	117 - 123 rue d'Aguesseau	nan	t	92100	BOULOGNE BILLANCOURT	FRANCE	AM053	X7QAV4	\N	2021-06-10 18:18:06.770826	t
17	17	36 rue Jean-Pierre Timbaud	nan	t	92130	ISSY LES MOULINEAUX	FRANCE	nan	nan	\N	2021-06-10 18:18:07.894185	t
18	18	106 rue de Général Leclerc	nan	t	95130	FRANCONVILLE	FRANCE	nan	nan	\N	2021-06-10 18:18:08.941587	t
19	19	4 Square des Artistes	nan	t	95520	OSNY	FRANCE	nan	nan	\N	2021-06-10 18:18:09.91803	t
20	20	17 rue Dumont d'Urville	nan	t	75016	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:18:10.849497	t
21	21	10 rue Hubert de la Brosse	nan	t	44700	ORVAULT	FRANCE	nan	nan	\N	2021-06-10 18:18:11.892903	t
22	22	1 avenue Docteur Blanchet	nan	t	77500	CHELLES	FRANCE	nan	nan	\N	2021-06-10 18:18:12.712434	t
23	23	3 rue de la Crèche	nan	t	77100	MEAUX	FRANCE	AM076	T4M7R0	\N	2021-06-10 18:18:13.631908	t
24	24	53 rue du Bournard	nan	t	92700	COLOMBES	FRANCE	nan	nan	\N	2021-06-10 18:18:14.629342	t
25	25	9 rue Grandet	nan	t	49000	ANGERS	FRANCE	AM081	NOGYL3	\N	2021-06-10 18:18:15.614778	t
26	26	8 bis rue Luis Bunuel	nan	t	77100	MEAUX	FRANCE	nan	nan	\N	2021-06-10 18:18:16.737134	t
27	27	2 rue Jean Bonnardel	nan	t	33140	VILLENAVE D'ORNON	FRANCE	nan	nan	\N	2021-06-10 18:18:17.60164	t
28	28	57 Bd Antoine Giroust	nan	t	77600	BUSSY SAINT GEORGES	FRANCE	nan	nan	\N	2021-06-10 18:18:18.627054	t
29	29	14 Cours du Maréchal Galliéni	nan	t	nan	TALENCE\nBORDEAUX	FRANCE	nan	nan	\N	2021-06-10 18:18:19.721433	t
30	30	83 Cours du Maréchal Galliéni	nan	t	33000	BORDEAUX	FRANCE	nan	nan	\N	2021-06-10 18:18:20.565948	t
31	31	55 bis avenue Pasteur	nan	t	33600	PESSAC	FRANCE	nan	nan	\N	2021-06-10 18:18:21.445447	t
32	32	26/32 avenue de la Division Leclerc	nan	t	92160	ANTONY	FRANCE	AM100	T4L7R0	\N	2021-06-10 18:18:22.432881	t
33	33	2 Bdl Maréchal Joffre	nan	t	95240	CORMEILLES EN PARISIS	FRANCE	nan	nan	\N	2021-06-10 18:18:23.278399	t
34	34	3 Place du Marché	nan	t	77270	VILLEPARISIS	FRANCE	nan	nan	\N	2021-06-10 18:18:24.122915	t
35	35	11 rue du Chemin de Fer	nan	t	77400	LAGNY SUR MARNE	FRANCE	nan	nan	\N	2021-06-10 18:18:25.18331	t
36	36	7 rue de la Crèche	nan	t	77100	MEAUX	FRANCE	nan	nan	\N	2021-06-10 18:18:26.038823	t
37	37	57 Bd Antoine Giroust	nan	t	77600	BUSSY SAINT GEORGES	FRANCE	nan	nan	\N	2021-06-10 18:18:26.900329	t
38	38	57 Bd Antoine Giroust	nan	t	77600	BUSSY SAINT GEORGES	FRANCE	nan	nan	\N	2021-06-10 18:18:27.775829	t
39	39	57 Bd Antoine Giroust	nan	t	77600	BUSSY SAINT GEORGES	FRANCE	nan	nan	\N	2021-06-10 18:18:28.865206	t
40	40	8 rue de l'Eglise	nan	t	77970	BANNOST VILLEGAGNON	FRANCE	nan	nan	\N	2021-06-10 18:18:30.028541	t
41	41	22 avenue de la Libération	nan	t	33310	LORMONT	FRANCE	nan	nan	\N	2021-06-10 18:18:30.860104	t
42	42	30 rue de Bel Air	nan	t	44000	NANTES	FRANCE	nan	nan	\N	2021-06-10 18:18:31.687631	t
43	43	1 Place Saint Similien	nan	t	44000	NANTES	FRANCE	nan	nan	\N	2021-06-10 18:18:32.682065	t
44	44	24 rue Charles Rouxel	nan	t	77340	PONTAULT COMBAULT	FRANCE	nan	nan	\N	2021-06-10 18:18:33.488601	t
45	45	31 Cours saint Louis	nan	t	33000	BORDEAUX	FRANCE	nan	nan	\N	2021-06-10 18:18:34.331119	t
46	46	1859 avenue Roger Salengro	nan	t	92370	CHAVILLE	FRANCE	AM126	H2ZIF9	\N	2021-06-10 18:18:35.240605	t
47	47	58 avenue Auguste Conte	nan	t	33560	CARDON BLANC	FRANCE	nan	nan	\N	2021-06-10 18:18:36.101109	t
48	48	23 rue Condorcet	nan	t	75009	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:18:37.070554	t
49	49	105 route de la Reine	nan	t	92100	BOULOGNE BILLANCOURT	FRANCE	AM129	K3COHQ	\N	2021-06-10 18:18:38.077979	t
50	50	5 rue du Pontcel	nan	t	95270	LUZARCHES	FRANCE	nan	nan	\N	2021-06-10 18:18:38.924496	t
51	51	8 Place de la Libération	nan	t	77600	BUSSY SAINT GEORGES	FRANCE	AM136	J3BOGA	\N	2021-06-10 18:18:39.804	t
52	52	1 rue de l'Est	nan	t	77340	PONTAULT COMBAULT	FRANCE	nan	nan	\N	2021-06-10 18:18:40.68649	t
53	53	3 rue de la Marèche	nan	t	95180	MENUCOURT	FRANCE	nan	nan	\N	2021-06-10 18:18:41.587976	t
54	54	22 Bd des Filles du Calvaire	nan	t	75011	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:18:42.810276	t
55	55	15 rue Paul Lorillon	BP17	t	95440	ECOUEN	FRANCE	nan	nan	\N	2021-06-10 18:18:43.638801	t
56	56	158 avenue Paul Doumer	nan	t	92500	RUEIL MALMAISON	FRANCE	nan	nan	\N	2021-06-10 18:18:44.439348	t
57	57	11 rue Maréchal Foch	nan	t	78400	CHATOU	FRANCE	nan	nan	\N	2021-06-10 18:18:45.376811	t
58	58	30 rue de Normandie	nan	t	92600	ASNIERES SUR SEINE	FRANCE	nan	nan	\N	2021-06-10 18:18:46.289865	t
59	59	46 rue Bertrand Flornoy	nan	t	77120	COULOMMIERS	FRANCE	nan	nan	\N	2021-06-10 18:18:47.193349	t
60	60	5 rue du Commandant Charcot	nan	t	33520	BRUGES	FRANCE	nan	nan	\N	2021-06-10 18:18:48.032869	t
61	61	21 avenue Thiers	nan	t	33100	BORDEAUX	FRANCE	nan	nan	\N	2021-06-10 18:18:49.149231	t
62	62	34 avenue Charles de Gaulle	nan	t	92350	LE PLESSIS ROBINSON	FRANCE	AM169	X7QAV4	\N	2021-06-10 18:18:50.127672	t
63	63	7 rue du Parisis	nan	t	95270	LUZARCHES	FRANCE	nan	nan	\N	2021-06-10 18:18:50.990181	t
64	64	6 Place du Général Leclerc	nan	t	92700	COLOMBES	FRANCE	AM171	ABB092	\N	2021-06-10 18:18:51.822705	t
65	65	20 avenue Pasteur	nan	t	33600	PESSAC	FRANCE	nan	nan	\N	2021-06-10 18:18:52.688211	t
66	66	9 rue Gargoulleau	nan	t	17000	LA ROCHELLE	FRANCE	nan	nan	\N	2021-06-10 18:18:53.749605	t
67	67	45 rue des Rosiers	nan	t	92500	RUEIL MALMAISON	FRANCE	nan	nan	\N	2021-06-10 18:18:54.592123	t
68	68	265 Place de l'Eglise	nan	t	60230	CHAMBLY	FRANCE	nan	nan	\N	2021-06-10 18:18:55.405662	t
69	69	24 rue des Halles	nan	t	85200	FONTENAY LE COMTE	FRANCE	AM177	W6P9VY	\N	2021-06-10 18:18:56.319138	t
70	70	32 rue de l'An VI	nan	t	85450	CHAILLE LES MARAIS	FRANCE	AM178	J3BOGA	\N	2021-06-10 18:18:57.38653	t
71	71	20 rue Béranger	nan	t	92240	MALAKOFF	FRANCE	nan	nan	\N	2021-06-10 18:18:58.253033	t
72	72	24 rue de Verdun	nan	t	85000	LA ROCHE SUR YON	FRANCE	AM025	AM025	\N	2021-06-10 18:18:59.06157	t
73	73	45 avenue du Général de Gaulle	nan	t	17230	MARANS	FRANCE	nan	nan	\N	2021-06-10 18:18:59.847122	t
74	74	74 Quai de la République	nan	t	85800	SAINT GILLES CROIX DE VIIE	FRANCE	nan	nan	\N	2021-06-10 18:19:01.176365	t
75	75	7 bis rue  Maurice	nan	t	33300	BORDEAUX	FRANCE	nan	nan	\N	2021-06-10 18:19:02.247751	t
76	76	3 rue Louis Cormerais	nan	t	44310	SAINT PHILBERT DES GRAND LIEU	FRANCE	nan	nan	\N	2021-06-10 18:19:03.447066	t
77	77	13 rue Bothiron	nan	t	33290	BLANQUEFORT	FRANCE	nan	nan	\N	2021-06-10 18:19:04.366544	t
78	78	54 Avenue Charles de Gaulle	nan	t	85340	OLONNE SUR MER	FRANCE	nan	nan	\N	2021-06-10 18:19:05.654804	t
79	79	2 AVENUE GERARD SAINT	nan	t	44300	NANTES	FRANCE	nan	nan	\N	2021-06-10 18:19:06.87211	t
80	80	8 Cité Condorcet	nan	t	75009	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:19:08.184358	t
81	81	1 avenue de la Plage	nan	t	85800	SAINT GILLES CROIX DE VIIE	FRANCE	nan	nan	\N	2021-06-10 18:19:09.295723	t
82	82	83 Boulevard de la République	nan	t	17200	ROYAN	FRANCE	AM201	X7QAV4	\N	2021-06-10 18:19:10.636957	t
83	83	30 rue Jules Vernes	nan	t	44470	CARQUEFOU	FRANCE	nan	nan	\N	2021-06-10 18:19:11.837578	t
84	84	28 rue de Verdun	nan	t	44210	PORNIC	FRANCE	AM2021	Q0H4NI1	\N	2021-06-10 18:19:13.042885	t
85	85	39 41 rue de la République	nan	t	77340	PONTAULT COMBAULT	FRANCE	nan	nan	\N	2021-06-10 18:19:14.341149	t
86	86	5 rue Claude Bernard	nan	t	75005	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:19:15.492486	t
87	87	Résidence Marina Beach Bat 7 Porte 3	Bd Hassan II	t	20800	MOHAMMEDIA MAROC	FRANCE	nan	nan	\N	2021-06-10 18:19:16.608851	t
88	88	14 Boulevard de la Plage	nan	t	33138	TAUSSAT	FRANCE	nan	nan	\N	2021-06-10 18:19:17.718215	t
89	89	55 rue Raymond Berrurier	nan	t	78320	LE MESNIL SAINT DENIS	FRANCE	nan	nan	\N	2021-06-10 18:19:18.586718	t
90	90	51 Avenue de la République	nan	t	75011	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:19:19.661109	t
91	91	22 rue d'Avron	nan	t	75020	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:19:20.664533	t
92	92	232 Boulevard Voltaire	nan	t	75011	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:19:22.908249	t
93	93	249 bis rue des Pyrénées	nan	t	75020	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:19:23.913675	t
94	94	12 rue Hyppolyte Minier	nan	t	33800	BORDEAUX	FRANCE	nan	nan	\N	2021-06-10 18:19:24.749198	t
95	95	11 avenue de Bouvine	nan	t	75011	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:19:25.749626	t
96	96	14 rue Montaigne	nan	t	33160	SAINT MEDARD EN JALLES	FRANCE	nan	nan	\N	2021-06-10 18:19:26.750055	t
97	97	32 boulevard Vincent Gache	nan	t	44200	NANTES	FRANCE	nan	nan	\N	2021-06-10 18:19:28.040319	t
98	98	109 rue David Jonshton	nan	t	33000	BORDEAUX	FRANCE	nan	nan	\N	2021-06-10 18:19:28.934808	t
99	99	36 rue Jean-Pierre Timbaud	nan	t	92130	ISSY LES MOULINEAUX	FRANCE	nan	nan	\N	2021-06-10 18:19:29.837293	t
100	100	110 rue Orfila	nan	t	75020	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:19:30.806738	t
101	101	40 rue Héricart de Thury	nan	t	33120	ARCACHON	FRANCE	nan	nan	\N	2021-06-10 18:19:32.104998	t
102	102	4 bis rue Ravenel	nan	t	49000	ANGERS	FRANCE	nan	nan	\N	2021-06-10 18:19:33.111427	t
103	103	13 rue Ferdinand Buissou	nan	t	33250	PAUILLAC	FRANCE	nan	nan	\N	2021-06-10 18:19:34.117847	t
104	104	108 rue de la Tour	nan	t	75016	PARIS	FRANCE	AM219	ILT16K	\N	2021-06-10 18:19:35.177243	t
105	105	6b Square Alexandre 1er de Yougoslavie	nan	t	53000	MAYENNE	FRANCE	nan	nan	\N	2021-06-10 18:19:35.986779	t
106	106	64 rue Ampère	nan	t	75017	PARIS	FRANCE	AM220	W6P9TY	\N	2021-06-10 18:19:37.028185	t
107	107	1 AVENUE DE SARIA	nan	t	77700	SERRIS	FRANCE	AM221	B8SQX5	\N	2021-06-10 18:19:38.03361	t
108	108	33 rue des Lices	nan	t	49100	ANGERS	FRANCE	nan	nan	\N	2021-06-10 18:19:39.021046	t
109	109	rue du Haras	nan	t	49000	ANGERS	FRANCE	nan	nan	\N	2021-06-10 18:19:40.006482	t
110	110	5 rue Jeanne D'arc	nan	t	44000	NANTES	FRANCE	AM412	4IMO44	\N	2021-06-10 18:19:40.96494	t
111	111	nan	nan	t	44000	ORVAULT	FRANCE	nan	nan	\N	2021-06-10 18:19:42.013337	t
112	112	46-48 rue d'Avron	nan	t	75020	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:19:43.140694	t
113	113	13 rue des Petites Maisons	nan	t	85480	SAINT HILAIRE LE VOUHIS	FRANCE	nan	nan	\N	2021-06-10 18:19:44.095148	t
114	114	94 Route de Claye	nan	t	77400	THORIGNY sur MARNE	FRANCE	nan	nan	\N	2021-06-10 18:19:45.204516	t
115	115	1243 rue du Rosais	nan	t	85440	TALMONT SAINT HILAIRE	FRANCE	AM230	VRIG85	\N	2021-06-10 18:19:46.258912	t
116	116	3 bis rue Maingeaon	nan	t	33720	ILLATS	FRANCE	nan	nan	\N	2021-06-10 18:19:47.249345	t
117	117	20 avenue Pasteur	nan	t	33200	PESSAC	FRANCE	nan	nan	\N	2021-06-10 18:19:48.395691	t
118	118	9 avenue Marcel Dassault	nan	t	17312	ROCHEFORT SUR MER	FRANCE	AMI0138	tfevzK6u	\N	2021-06-10 18:19:49.399118	t
119	119	56 rue Gambetta	BP40523	t	17200	ROYAN CEDEX	FRANCE	nan	nan	\N	2021-06-10 18:19:50.342579	t
120	120	4 Grande Rue	nan	t	44118	LA CHEVROLIERE	FRANCE	nan	nan	\N	2021-06-10 18:19:51.32902	t
121	121	6 rue Francis de Pressense	nan	t	44000	NANTES	FRANCE	nan	nan	\N	2021-06-10 18:19:52.205515	t
122	122	29 rue Maurice Daniel	nan	t	44230	SAINT SEBASTIEN SUR LOIRE	FRANCE	nan	nan	\N	2021-06-10 18:19:53.044037	t
123	123	29 rue Tourat	nan	t	33000	BORDEAUX	FRANCE	nan	nan	\N	2021-06-10 18:19:54.17439	t
124	124	135 rue de Ferreyre	nan	t	33450	IZON	FRANCE	nan	nan	\N	2021-06-10 18:19:55.209797	t
125	125	4 rue Gabriel Péri	nan	t	31000	TOULOUSE	FRANCE	nan	nan	\N	2021-06-10 18:19:56.146263	t
126	126	4 rue Georges Clémenceau	nan	t	85520	JARD SUR MER	FRANCE	nan	nan	\N	2021-06-10 18:19:57.142696	t
127	127	1 rue Saint Aignan	nan	t	33450	SAINT LOUBES	FRANCE	nan	nan	\N	2021-06-10 18:19:58.338072	t
128	128	Centre Commercial boulevard du Manoir Saint Lô	nan	t	44300	NANTES	FRANCE	nan	nan	\N	2021-06-10 18:19:59.707304	t
129	129	14 Boulevard de la Plage	nan	t	33120	ARCACHON	FRANCE	nan	nan	\N	2021-06-10 18:20:01.386534	t
130	130	9 Allée E Boissière	nan	t	33980	AUDENGE	FRANCE	nan	nan	\N	2021-06-10 18:20:02.325001	t
131	131	202 Bd Voltaire	nan	t	75011	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:20:03.380394	t
132	132	1 rue Serpentine BP 52	nan	t	85002	LA ROCHE SUR YON	FRANCE	AM451	SIO85C	\N	2021-06-10 18:20:04.287875	t
133	133	6rue de Nadeau	nan	t	33200	BORDEAUX	FRANCE	nan	nan	\N	2021-06-10 18:20:06.031881	t
134	134	41 RUE DES LICES	nan	t	49100	ANGERS	FRANCE	AM2591	JOUB491	\N	2021-06-10 18:20:06.993333	t
135	135	5 Place Lorraine	nan	t	49000	ANGERS	FRANCE	AM610	SER49P	\N	2021-06-10 18:20:07.978769	t
136	136	7 Bd Arnaud	nan	t	49100	ANGERS	FRANCE	AM261	49ABCI	\N	2021-06-10 18:20:09.326997	t
140	140	19 rue du Primptemps	nan	t	75017	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:20:12.599895	t
141	141	1C avenue Ch. Doppler	nan	t	77700	SERRIS	FRANCE	nan	nan	\N	2021-06-10 18:20:13.41443	t
142	142	63/65 Boulevard Georges V	nan	t	33000	BORDEAUX	FRANCE	nan	nan	\N	2021-06-10 18:20:14.162003	t
143	143	148 Boulevard Voltaire	nan	t	75011	PARIS	FRANCE	AM2681	LDPAR75	\N	2021-06-10 18:20:15.014516	t
144	144	2 Place Saint Pierre	nan	t	44470	CARQUEFOU	FRANCE	nan	nan	\N	2021-06-10 18:20:16.05093	t
145	145	C.C DE L'OLIVEY 146 avenue de la République	nan	t	33450	SAINT LOUBES	FRANCE	nan	nan	\N	2021-06-10 18:20:16.830479	t
146	146	16 rue de la Plage	nan	t	33780	SOULAC	FRANCE	nan	nan	\N	2021-06-10 18:20:17.717973	t
147	147	48 BOULEVARD DE VANVES	nan	t	92320	CHATILLON	FRANCE	AM272	BPR92P	\N	2021-06-10 18:20:18.609463	t
148	148	23 avenue Aristide Briand	nan	t	92160	ANTONY	FRANCE	AM273	AER92G	\N	2021-06-10 18:20:19.401012	t
149	149	12 avenue du Gé,éral de Gaulle	nan	t	77600	BUSSY SAINT GEORGES	FRANCE	AM274	SYL6QO	\N	2021-06-10 18:20:20.288503	t
150	150	10 bis rue du Général Leclerc	nan	t	85300	CHALLANS	FRANCE	nan	nan	\N	2021-06-10 18:20:21.110034	t
151	151	88 avenue Henri Barbusse	nan	t	94240	L'HAY LES ROSES	FRANCE	nan	nan	\N	2021-06-10 18:20:22.088476	t
152	152	44 rue de Paris	nan	t	93260	LES LILAS	FRANCE	AM277	AUR93B	\N	2021-06-10 18:20:22.909009	t
153	153	1 rue Amedée Gordini	nan	t	85109	LES SABLES D'OLONNE	FRANCE	AM2781	J3BOGA1	\N	2021-06-10 18:20:23.808496	t
154	154	11 rue Chanez	nan	t	75016	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:20:24.837906	t
155	155	8 RUE DENIS PAPIN	nan	t	41000	BLOIS	FRANCE	AM281	Q0J4NI	\N	2021-06-10 18:20:26.073713	t
156	156	5 Quai de Bacalan	nan	t	33300	BORDEAUX	FRANCE	nan	nan	\N	2021-06-10 18:20:26.90724	t
157	157	5 BOULEVARD ILE VERTIME	nan	t	85100	LES SABLES D'OLONNE	FRANCE	AM283	K3COHQ	\N	2021-06-10 18:20:27.892674	t
158	158	68 rue de la Rousselle	nan	t	33000	BORDEAUX	FRANCE	nan	nan	\N	2021-06-10 18:20:28.710626	t
159	159	19 rue du Cep	nan	t	78300	POISSY	FRANCE	AM285	FIS078	\N	2021-06-10 18:20:29.778018	t
160	160	38 40 rue de la Convention	nan	t	94270	LE KREMELIN BICETRE	FRANCE	nan	nan	\N	2021-06-10 18:20:30.653514	t
165	165	67 Boulevard Voltaire	nan	t	75011	PARIS	FRANCE	AM295	SAI11P	\N	2021-06-10 18:20:35.273876	t
166	166	59 bis Grande Rue	nan	t	85430	AUBIGNY	FRANCE	nan	nan	\N	2021-06-10 18:20:36.489186	t
167	167	91 rue de Faubourg Saint Honoré	nan	t	75008	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:20:37.339699	t
168	168	37 rue Proudhon	nan	t	75012	PARIS	FRANCE	AM298	HAU12R	\N	2021-06-10 18:20:38.189213	t
169	169	37 rue Proudhon  //   246 RUE DU FBG ST ANTOINE	nan	t	75012	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:20:39.087697	t
170	170	4 rue Joachin du Bellay	nan	t	49100	ANGERS	FRANCE	nan	nan	\N	2021-06-10 18:20:39.90523	t
171	171	9 rue du Général Leclerc	nan	t	94510	LA QUEUE EN BRIE	FRANCE	nan	nan	\N	2021-06-10 18:20:40.777733	t
172	172	1 rue des Halles	nan	t	85000	LA ROCHE SUR YON	FRANCE	AM3031	LABE0851	\N	2021-06-10 18:20:41.573278	t
173	173	83 rue Sadi Carnot	nan	t	93170	BAGNOLET	FRANCE	nan	nan	\N	2021-06-10 18:20:42.663751	t
174	174	91 rue de Charonne	nan	t	75011	PARIS	FRANCE	AM3070	Er#a11Cha	\N	2021-06-10 18:20:43.482285	t
188	188	48 rue du Brandon	nan	t	85500	LES HERBIERS	FRANCE	AM326	CB1H32PE	\N	2021-06-10 18:20:55.245597	t
189	189	15 bis avenue du Maréchal Foch	nan	t	77500	CHELLES	FRANCE	nan	nan	\N	2021-06-10 18:20:56.076122	t
190	190	21 rue Jeanne Jugan	nan	t	35400	SAINT MALO	FRANCE	nan	nan	\N	2021-06-10 18:20:56.953618	t
191	191	1 rue de l'Eglise	nan	t	85580	SAINT MICHEL EN L HERM	FRANCE	nan	nan	\N	2021-06-10 18:20:57.724178	t
192	192	16 rue de la Fontaine du But	nan	t	75018	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:20:58.710615	t
193	193	21 Bouleard Guist'hau	nan	t	44000	NANTES	FRANCE	AM294	CTI44	\N	2021-06-10 18:20:59.516158	t
137	137	226 rue Marcadet	nan	t	75018	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:20:10.264721	t
138	138	52 Bis Boulevard foch	nan	t	49100	ANGERS	FRANCE	nan	nan	\N	2021-06-10 18:20:11.046782	t
139	139	36 bis Cours de Verdun	nan	t	33000	BORDEAUX	FRANCE	nan	nan	\N	2021-06-10 18:20:11.837336	t
161	161	13 Boulevard Guisthau	nan	t	44000	NANTES	FRANCE	AM294	CTI44	\N	2021-06-10 18:20:31.631956	t
162	162	15 rue Carnot	nan	t	78700	CONFLANS SAINTE HONORINE	FRANCE	nan	nan	\N	2021-06-10 18:20:32.443495	t
163	163	2 Place division Leclrec	nan	t	78960	VOISINS LE BRETONNEUX	FRANCE	nan	nan	\N	2021-06-10 18:20:33.267028	t
164	164	123 rue du Chateau	nan	t	92100	BOULOGNE BILLANCOURT	FRANCE	AM293	TRA92S	\N	2021-06-10 18:20:34.253461	t
175	175	61 rue de Passy	nan	t	75016	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:20:44.348787	t
176	176	20 rue du Bac de Ris Bat C8	nan	t	91450	SOISY SUR SEINE	FRANCE	nan	nan	\N	2021-06-10 18:20:45.137342	t
177	177	154 avenue de Wagram	nan	t	75017	PARIS	FRANCE	AM313	BELI15	\N	2021-06-10 18:20:45.993847	t
178	178	49 rue de Dijon	nan	t	21121	DAIX	FRANCE	nan	nan	\N	2021-06-10 18:20:46.770405	t
179	179	11 Boulevard de Strasbourg	nan	t	94130	NOGENT SUR MARNE	FRANCE	nan	nan	\N	2021-06-10 18:20:47.623915	t
180	180	21 Cours Dupont	nan	t	85100	LES SABLES D'OLONNE	FRANCE	AM218	P0H4MI	\N	2021-06-10 18:20:48.456441	t
181	181	95 avenue Ledru Rolin	nan	t	75011	PARIS	FRANCE	AM317	JBS11G	\N	2021-06-10 18:20:49.261982	t
182	182	122 rue de Paris	nan	t	92100	BOULOGNE BILLANCOURT	FRANCE	nan	nan	\N	2021-06-10 18:20:50.119492	t
183	183	21 bis rue des Sables	nan	t	85340	OLONNE SUR MER	FRANCE	nan	nan	\N	2021-06-10 18:20:50.918034	t
184	184	56 rue Jean Bleuzen	nan	t	92170	VANVES	FRANCE	nan	nan	\N	2021-06-10 18:20:51.69759	t
185	185	8 rue Philippe le Hurepel	nan	t	77230	DAMARTIN EN GOELE	FRANCE	nan	nan	\N	2021-06-10 18:20:52.685028	t
186	186	20 rue du Belvédère	nan	t	92100	BOULOGNE BILLANCOURT	FRANCE	AM322	GHAU75	\N	2021-06-10 18:20:53.561561	t
187	187	13 Rue du Maréchal Joffre	nan	t	85000	LA ROCHE SUR YON	FRANCE	nan	nan	\N	2021-06-10 18:20:54.351105	t
194	194	156 rue Nationale	nan	t	59000	LILLE	FRANCE	AM334	ETDN59	\N	2021-06-10 18:21:00.61053	t
195	195	156 rue Nationale	nan	t	59000	LILLE	FRANCE	AM335	ETLCI1	\N	2021-06-10 18:21:01.337115	t
196	196	17 rue du 8 mai 1945	nan	t	94240	L'HAY LES ROSES	FRANCE	nan	nan	\N	2021-06-10 18:21:02.555423	t
197	197	18 avenue de la République	nan	t	78200	MANTES LA JOLIE	FRANCE	nan	nan	\N	2021-06-10 18:21:03.858673	t
198	198	48 rue du Brandon	nan	t	85500	LES HERBIERS	FRANCE	AM339	CEL85M	\N	2021-06-10 18:21:04.717185	t
199	199	19 rue de Vienne	TSA 90033	t	75801	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:21:05.602679	t
200	200	10/12 Place Vendôme	nan	t	75001	PARIS	FRANCE	AM342	HOME75	\N	2021-06-10 18:21:06.383238	t
201	201	14 Huberman Street	nan	t	64075	TEL-AVIV ISRAEL	FRANCE	nan	nan	\N	2021-06-10 18:21:07.241742	t
202	202	4 rue Corvetto	nan	t	75008	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:21:07.981319	t
203	203	20 Allée des 4 Vents	nan	t	92160	ANTONY	FRANCE	nan	nan	\N	2021-06-10 18:21:09.029721	t
204	204	33 rue de l'Orangerie	nan	t	78000	VERSAILLES	FRANCE	nan	nan	\N	2021-06-10 18:21:09.823267	t
205	205	70 rue d'Auteuil	nan	t	75016	PARIS	FRANCE	AM322	GHAU75	\N	2021-06-10 18:21:10.639801	t
206	206	24 rue du 3 Aout 1944	nan	t	44850	SAINT MARS DU DESERT	FRANCE	AM348	STM044	\N	2021-06-10 18:21:11.566273	t
207	207	23 BIS RUE DE LA BORDERIE	nan	t	35000	VITRE	FRANCE	nan	nan	\N	2021-06-10 18:21:12.384806	t
208	208	4 rue du Champs Dolent	nan	t	35000	RENNES	FRANCE	nan	nan	\N	2021-06-10 18:21:13.18135	t
209	209	34 Avenue Foch	nan	t	92420	VAUCRESSON	FRANCE	nan	nan	\N	2021-06-10 18:21:14.009879	t
210	210	83 BIS RUE DE COURCELLES	nan	t	75017	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:21:15.182207	t
211	211	10 rue de la Brosse	nan	t	44700	ORVAULT	FRANCE	AM3531	ORV044	\N	2021-06-10 18:21:16.028722	t
212	212	46 rue du Petit Prince	nan	t	44360	VIGNEUX DE BRETAGNE	FRANCE	AM354	VIG044	\N	2021-06-10 18:21:16.923212	t
213	213	15 rue de la Madeleine	nan	t	44130	FAY DE BRETAGNE	FRANCE	AM355	FAY044	\N	2021-06-10 18:21:17.700895	t
214	214	4 rue Galilée	nan	t	75016	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:21:18.703325	t
215	215	20 rue de l'Ocean	nan	t	44810	HERIC	FRANCE	AM358	HER044	\N	2021-06-10 18:21:19.547842	t
216	216	183 boulevard Voltaire	nan	t	75011	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:21:20.547269	t
217	217	Lieu dit la BARTAIE	nan	t	49370	SAINT CLEMENT DE LA PLACE	FRANCE	nan	nan	\N	2021-06-10 18:21:21.490734	t
218	218	50 Rue d'Anjou	nan	t	49125	TIERCE	FRANCE	nan	nan	\N	2021-06-10 18:21:22.235304	t
219	219	1 AVENUE DU MARECHAL FOCH	nan	t	78800	HOUILLES	FRANCE	AM365	SEB78M	\N	2021-06-10 18:21:23.238732	t
220	220	14 avenue du Maréchal Foch	nan	t	78400	CHATOU	FRANCE	nan	nan	\N	2021-06-10 18:21:24.079251	t
221	221	1 Allée des Magnolias	nan	t	94550	CHAVILLY LARUE	FRANCE	nan	nan	\N	2021-06-10 18:21:25.137972	t
222	222	511 Route Saint Joseph	nan	t	44745	NANTES	FRANCE	AM3681	GUI0441	\N	2021-06-10 18:21:25.954508	t
223	223	2 Cours d'Armor Route de Savenay	nan	t	44360	SAINT ETIENNE DE MONTLUC	FRANCE	AMI0250	PfiUjivT	\N	2021-06-10 18:21:26.911961	t
224	224	8 rue des Croix	nan	t	53000	LAVAL	FRANCE	AM3701	MAIS531	\N	2021-06-10 18:21:27.845424	t
225	225	19 Boulevard Alexandre Martin	nan	t	45000	ORLEANS	FRANCE	AM375	SERG45	\N	2021-06-10 18:21:28.963784	t
226	226	65 avenue Suffren	nan	t	75007	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:21:29.861271	t
227	227	25 rue Traverse	nan	t	29200	BREST	FRANCE	AM401	DUM029	\N	2021-06-10 18:21:30.751765	t
228	228	34 avenue des Tilleuls	nan	t	17204	ROYAN Cedex	FRANCE	nan	nan	\N	2021-06-10 18:21:31.723942	t
229	229	36 rue de Paris	nan	t	53000	LAVAL	FRANCE	AM405	PRO053	\N	2021-06-10 18:21:32.494502	t
230	230	20 Avenue du Maréchal Joffre	nan	t	53200	CHATEAU GONTIER	FRANCE	nan	nan	\N	2021-06-10 18:21:33.473943	t
231	231	96 Boulevard des Batignolles	nan	t	75017	PARIS	FRANCE	AM4081	DJC7517	\N	2021-06-10 18:21:34.29947	t
232	232	23 rue de Lyon	BP61107	t	29211	BREST	FRANCE	nan	nan	\N	2021-06-10 18:21:35.151417	t
233	233	44 rue du Château	nan	t	29200	BREST	FRANCE	AM410	LEM029	\N	2021-06-10 18:21:35.980943	t
234	234	30 rue Montgolfier	nan	t	93500	PANTIN	FRANCE	nan	nan	\N	2021-06-10 18:21:36.838452	t
235	235	4 rue Jeanne d'Arc	nan	t	44000	NANTES	FRANCE	AM4121	4IMO441	\N	2021-06-10 18:21:37.715954	t
236	236	36 rue de Versailles	nan	t	78150	LE CHESNAY	FRANCE	nan	nan	\N	2021-06-10 18:21:38.653419	t
237	237	52 Bis Boulevard Foch	nan	t	49100	ANGERS	FRANCE	nan	nan	\N	2021-06-10 18:21:39.413983	t
238	238	1 RESIDENCE FONTAINE SAINT MARC	nan	t	77000	MELUN	FRANCE	nan	nan	\N	2021-06-10 18:21:40.224519	t
239	239	15 CHEMIN DU RO LA MADELAINE	nan	t	44350	GUERANDE	FRANCE	nan	nan	\N	2021-06-10 18:21:41.153993	t
240	240	26 rue de Douarnenez	nan	t	29000	QUIMPER	FRANCE	AM420	GRI029	\N	2021-06-10 18:21:42.159414	t
241	241	33 rue Delaâge	nan	t	49000	ANGERS	FRANCE	nan	nan	\N	2021-06-10 18:21:42.938971	t
242	242	24 rue Bannier	nan	t	45000	ORLEANS	FRANCE	AM600	PIC17V	\N	2021-06-10 18:21:43.949391	t
243	243	74  rue de la Boulie	nan	t	91370	VERRIERE LE BUISSON	FRANCE	nan	nan	\N	2021-06-10 18:21:44.795908	t
247	247	16 rue Daniel Oelhert	nan	t	53001	LAVAL	FRANCE	nan	nan	\N	2021-06-10 18:21:48.496794	t
248	248	14 Place Aristide Briand	nan	t	72000	LE MANS	FRANCE	nan	nan	\N	2021-06-10 18:21:51.018355	t
249	249	7 Rue de Beauval	nan	t	49100	ANGERS	FRANCE	AM4361	juGYT76tf	\N	2021-06-10 18:21:52.383575	t
250	250	47 RUE ANATOLE FRANCE	nan	t	92370	CHAVILLE	FRANCE	AM4371	sziZCkU6	\N	2021-06-10 18:21:53.336029	t
251	251	28 Quai Charles de Gaulle	nan	t	29150	CHATEAULIN	FRANCE	AM438	OBI029	\N	2021-06-10 18:21:54.200536	t
253	253	32 Rue Saint Nicolas	nan	t	49000	ANGERS	FRANCE	nan	nan	\N	2021-06-10 18:21:56.058475	t
254	254	7 avenue Joffre	nan	t	92380	GARCHES	FRANCE	nan	nan	\N	2021-06-10 18:21:56.899998	t
258	258	86 avenue La Fayette	nan	t	17300	ROCHEFORT	FRANCE	AM253	BAR85T	\N	2021-06-10 18:22:00.932691	t
262	262	234 rue de la Convention	nan	t	75015	PARIS	FRANCE	AM4581	BUDU15	\N	2021-06-10 18:22:04.926589	t
263	263	47 avenue de Paris	nan	t	94300	VINCENNES	FRANCE	AM461	BRI094	\N	2021-06-10 18:22:06.425019	t
264	264	10 rue d'Isly	nan	t	35000	RENNES	FRANCE	AM467	REN035	\N	2021-06-10 18:22:07.739269	t
265	265	28 Boulevard Rouget de Lisle	nan	t	93100	MONTREUIL	FRANCE	AM468	BRIE93	\N	2021-06-10 18:22:08.761684	t
266	266	5 Boulevard Marécahl Joffe	nan	t	56100	LORIENT	FRANCE	AM469	LORI56	\N	2021-06-10 18:22:09.919023	t
267	267	6 Bis avenue de la Libération	nan	t	45700	VILLEMANDEUR	FRANCE	AM4720	45cVIL#Pap	\N	2021-06-10 18:22:10.987414	t
268	268	17 bis rue Aristide Briand	nan	t	91150	ETAMPES	FRANCE	AM474	UGSP91	\N	2021-06-10 18:22:11.943866	t
269	269	115 Promenade des Cours	nan	t	86000	POITIERS	FRANCE	nan	nan	\N	2021-06-10 18:22:12.91831	t
272	272	1 RUE DE LA CLAYE	nan	t	77400	THORIGNY SUR MARNE	FRANCE	AM4831	PHC0771	\N	2021-06-10 18:22:15.850635	t
273	273	33 rue Louis Pasteur	nan	t	29000	BREST	FRANCE	AM486	HAS029	\N	2021-06-10 18:22:16.835073	t
274	274	37 avenue de Quincy	nan	t	77380	COMB LA VILLE	FRANCE	nan	nan	\N	2021-06-10 18:22:17.698581	t
275	275	52 Boulevard de la liberté	nan	t	35000	RENNES	FRANCE	AM4881	AGIR3501	\N	2021-06-10 18:22:18.784959	t
276	276	6 rue de la Barre	nan	t	44110	CHATEAUBRIANT	FRANCE	AM490	TRIO44	\N	2021-06-10 18:22:20.212012	t
277	277	29 avenue Carnot	nan	t	91370	VERRIERES LE BUISSON	FRANCE	nan	nan	\N	2021-06-10 18:22:21.540252	t
278	278	31 rue Jean Fontaine	nan	t	75016	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:22:22.75456	t
279	279	445 Route d'Avignon	nan	t	84200	CARPENTRAS	FRANCE	nan	nan	\N	2021-06-10 18:22:24.664469	t
280	280	10 rue Amiral Guépratte	nan	t	29200	BREST	FRANCE	AM5031	LAR2901	\N	2021-06-10 18:22:26.089655	t
281	281	2 RUE MARSOULAN	nan	t	75011	PARIS	FRANCE	AM7001	NAT011	\N	2021-06-10 18:22:27.074093	t
282	282	17 BOULEVARD DE REUILLY	nan	t	75012	PARIS	FRANCE	AM703	LLI011	\N	2021-06-10 18:22:28.076518	t
283	283	148 Boulevard Voltaire	nan	t	75011	PARIS	FRANCE	AM701	GDL011	\N	2021-06-10 18:22:28.982002	t
284	284	101 rue Jean Jaurès	nan	t	29200	BREST	FRANCE	AM542	ORP030	\N	2021-06-10 18:22:30.383206	t
285	285	67 BOULEVARD DE LA LIBERTE	nan	t	59000	LILLE	FRANCE	AM5101	BONA591	\N	2021-06-10 18:22:31.325664	t
286	286	122 RUE SOLFERINO	nan	t	59000	LILLE	FRANCE	AM5111	TMC0591	\N	2021-06-10 18:22:32.251136	t
287	287	37 AVENUE DE QUINCY	nan	t	77380	COMBS LA VILLE	FRANCE	AM512	BENO77	\N	2021-06-10 18:22:33.155619	t
288	288	255 RUE NATIONALE	nan	t	59000	LILLE	FRANCE	AM5131	VAC0591	\N	2021-06-10 18:22:34.128064	t
289	289	32 RUE DE L'ETANDUERE	nan	t	49000	ANGERS	FRANCE	AM514	PIG049	\N	2021-06-10 18:22:35.061529	t
290	290	122 RUE SOLFERINO	nan	t	59000	LILLE	FRANCE	nan	nan	\N	2021-06-10 18:22:36.029976	t
294	294	1 PLACE WAGRAM	nan	t	75017	PARIS	FRANCE	AM522	nan	\N	2021-06-10 18:22:39.71987	t
295	295	2 rue de la Prairie de Plessis	nan	t	44810	HERIC	FRANCE	nan	nan	\N	2021-06-10 18:22:40.658945	t
296	296	26 BIS RUE JEAN JAURES	nan	t	93220	GAGNY	FRANCE	AMI0384	nan	\N	2021-06-10 18:22:41.97719	t
304	304	12 Place Jacques Tati	nan	t	44600	SAINT MARC SUR MER	FRANCE	nan	nan	\N	2021-06-10 18:22:55.366325	t
305	305	120 RUE FRANCIS PRESSENSE	nan	t	62220	CARVIN	FRANCE	AM535	ASD059	\N	2021-06-10 18:22:56.35576	t
306	306	1 Place de La Hunaudais	nan	t	44680	SAINT PAZANE	FRANCE	AM536	MEN044	\N	2021-06-10 18:22:57.320207	t
308	308	19 ALLEEDU VIEUX SAINT LOUIS	nan	t	53000	LAVAL	FRANCE	AM541	nan	\N	2021-06-10 18:22:59.358043	t
244	244	47 RUE ANATOLE FRANCE	nan	t	92370	CHAVILLE	FRANCE	nan	nan	\N	2021-06-10 18:21:45.767353	t
245	245	59 rue Denis Papin	nan	t	41000	BLOIS	FRANCE	AM4280	AgDC#041	\N	2021-06-10 18:21:46.585885	t
246	246	4 rue Pauline et Daniel Oehlert	BP717	t	53007	LAVAL Cedex	FRANCE	AM432	DARP53	\N	2021-06-10 18:21:47.616299	t
252	252	4 Avenue Champagné	nan	t	53400	CRAON	FRANCE	nan	nan	\N	2021-06-10 18:21:55.17298	t
255	255	7 rue de la Mairie	nan	t	29480	LE RELECQ KERHUON	FRANCE	nan	nan	\N	2021-06-10 18:21:57.776494	t
256	256	34 Chemin de Kernoter	nan	t	29000	QUIMPER	FRANCE	nan	nan	\N	2021-06-10 18:21:58.700966	t
257	257	32 COLVILLE TERRACE	nan	t	nan	LONDON W112BU	FRANCE	nan	nan	\N	2021-06-10 18:21:59.56947	t
259	259	17 rue Jules Ferry	nan	t	91790	BOISSY SOUS SAINT YON	FRANCE	nan	nan	\N	2021-06-10 18:22:01.869156	t
260	260	PArc tertiaire Technopolis Einstein	nan	t	53810	CHANGE	FRANCE	nan	nan	\N	2021-06-10 18:22:02.682691	t
261	261	35 RUE DES BONSN VENTS	nan	t	44850	LIGNE	FRANCE	nan	nan	\N	2021-06-10 18:22:03.995121	t
270	270	51 Boulevard Carnot	nan	t	78110	LE VESINET	FRANCE	AM4801	AMI0781	\N	2021-06-10 18:22:13.95372	t
271	271	Route de Corzé	nan	t	49140	JARZE VILLAGE	FRANCE	nan	nan	\N	2021-06-10 18:22:14.96814	t
291	291	58 rue Jean Baptiste Baudin	nan	t	94800	VILLEJUIF	FRANCE	AM519	nan	\N	2021-06-10 18:22:36.993426	t
292	292	28 BIS AVENUE CHARLES DE GAULLE	nan	t	17300	ROCHEFORT	FRANCE	AM520	NYAZ17	\N	2021-06-10 18:22:37.881917	t
293	293	63 RUE NICOLAS LEBLANC	nan	t	59000	LILLE	FRANCE	AM521	nan	\N	2021-06-10 18:22:38.855361	t
297	297	5 RUE JACQUES MARIN	nan	t	49330	SOEURDRES	FRANCE	AM525	PETI49	\N	2021-06-10 18:22:43.053576	t
298	298	175 RUE DE LA GUILLETERIE	nan	t	85440	TALMONT ST HILAIRE	FRANCE	AM526	NOR085	\N	2021-06-10 18:22:44.408802	t
299	299	4 RUE DU PATIO	nan	t	85160	SAINT JEN DE MONTS	FRANCE	AM527	FONC85	\N	2021-06-10 18:22:45.428226	t
300	300	251 AVENUE DU BOIS	nan	t	59832	LAMBERSART	FRANCE	AM528	ART059	\N	2021-06-10 18:22:46.637046	t
301	301	61 RUE COLBERT	nan	t	59000	LILLE	FRANCE	AM5291	MET0591	\N	2021-06-10 18:22:48.636904	t
302	302	189 RUE NATIONALE	nan	t	59000	LILLE	FRANCE	AM5321	CEN0591	\N	2021-06-10 18:22:51.572226	t
303	303	37 AVENUE EMILE ZOLA	nan	t	59000	LILLE	FRANCE	AM5331	DEF0591	\N	2021-06-10 18:22:54.231973	t
307	307	37 RUE D'ESBLY	nan	t	77700	COUPVRAY	FRANCE	AM538	EUBAR7	\N	2021-06-10 18:22:58.254676	t
309	309	101 RUE JEAN JAURES	nan	t	29200	BREST	FRANCE	AM541	ORP029	\N	2021-06-10 18:23:01.188999	t
310	310	62 RUE DE VOUILLE	nan	t	75015	PARIS	FRANCE	AM5431	CARG151	\N	2021-06-10 18:23:02.309359	t
311	311	nan	nan	t	nan	nan	FRANCE	nan	nan	\N	2021-06-10 18:23:03.557646	t
312	312	10 Allée du Port Maillard	nan	t	44000	NANTES	FRANCE	nan	nan	\N	2021-06-10 18:23:04.443142	t
313	313	41 rue du Sous Marin Casabianca	nan	t	83000	TOULON	FRANCE	nan	nan	\N	2021-06-10 18:23:05.568501	t
314	314	3 rue du Logis des Bois	nan	t	49320	SAINT SATURNIN SUR LOIRE	FRANCE	nan	nan	\N	2021-06-10 18:23:06.444997	t
315	315	7 Place du 11 Novembre	nan	t	37320	SAINT BRANCHS	FRANCE	AM5551	BRAN0371	\N	2021-06-10 18:23:07.662301	t
316	316	23 PLACE  DU MARECHAL LECLERC	nan	t	59000	LILLE	FRANCE	AM55611	IND05911	\N	2021-06-10 18:23:08.607762	t
317	317	177 RUE NATIONALE	nan	t	59000	LILLE	FRANCE	AM55711	SIGL05911	\N	2021-06-10 18:23:09.53823	t
318	318	67 RUE CAULIANCOURT	nan	t	75018	PARIS	FRANCE	AM042	FRE75G	\N	2021-06-10 18:23:10.681623	t
319	319	43 RUE DE TOULOUSE	nan	t	31320	CASTANET-TOLOSAN	FRANCE	AM5611	TOUL0311	\N	2021-06-10 18:23:11.516148	t
320	320	70 AVENUE DE PUJOL	nan	t	31500	TOULOUSE	FRANCE	AM5621	TOUL0321	\N	2021-06-10 18:23:12.450614	t
321	321	40 ROUTE D'ALBI	nan	t	31000	TOULOUSE	FRANCE	AM5631	TOUL0321	\N	2021-06-10 18:23:13.380081	t
322	322	5 ALLEE D'OCCITANIE	nan	t	31770	COLOMIERS	FRANCE	AM5641	AERO0311	\N	2021-06-10 18:23:14.626481	t
323	323	40 ALLEES CHARLES DE FITTE	nan	t	31300	TOULOUSE	FRANCE	AM5651	GICA0311	\N	2021-06-10 18:23:15.531964	t
324	324	25 GRANDE RUE CHARLES DE GAULLE	nan	t	94360	BRY SUR MARNE	FRANCE	AM5681	CIV0771	\N	2021-06-10 18:23:16.72928	t
325	325	20 Place de la Tour d'Auvergne	nan	t	29000	QUIMPER	FRANCE	nan	nan	\N	2021-06-10 18:23:17.731711	t
326	326	106 RUE CHAULIN SERVINIERE	nan	t	53100	MAYENNE	FRANCE	AM5721	CAD0531	\N	2021-06-10 18:23:18.652181	t
327	327	nan	nan	t	nan	nan	FRANCE	nan	nan	\N	2021-06-10 18:23:19.552668	t
328	328	16 RUE NOTRE DAME DE LORETTE	nan	t	75009	PARIS	FRANCE	AMI0499	tStAXI2b	\N	2021-06-10 18:23:20.327225	t
329	329	10 rue Damrémont	nan	t	75018	PARIS	FRANCE	AM5770	Ori#18Par	\N	2021-06-10 18:23:21.777397	t
330	330	13 Place de la Liberté	nan	t	29200	BREST	FRANCE	nan	nan	\N	2021-06-10 18:23:23.847734	t
331	331	59 avenue de Saint Ouen	nan	t	75017	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:23:24.894139	t
332	332	4 RUE DES ARENES	nan	t	49000	ANGERS	FRANCE	AMI0453	nan	\N	2021-06-10 18:23:25.911558	t
333	333	nan	nan	t	nan	nan	FRANCE	nan	nan	\N	2021-06-10 18:23:26.886999	t
334	334	1 rue de l'Ecluse Saint Mars de Blain	nan	t	44130	BLAIN	FRANCE	nan	nan	\N	2021-06-10 18:23:27.813474	t
335	335	602 rue du Haut Plessis	nan	t	44390	PETIT MARS	FRANCE	nan	nan	\N	2021-06-10 18:23:28.721949	t
336	336	48 RUE RADON	nan	t	85000	LES HERBIERS	FRANCE	AM3261	CB1H32PE1	\N	2021-06-10 18:23:29.809329	t
337	337	37 BOULEVARD DU MARECHAL FOCH	nan	t	49100	ANGERS	FRANCE	AM5860	NEST#49Fch	\N	2021-06-10 18:23:31.221521	t
338	338	1 rue du Dauphin	nan	t	53000	LAVAL	FRANCE	nan	nan	\N	2021-06-10 18:23:32.356874	t
339	339	12 rue Dagobert	nan	t	92100	CLICHY	FRANCE	AM5881	tsNBW4Ic	\N	2021-06-10 18:23:34.487657	t
340	340	169 AVENUE CHARLES DE GAULLE	nan	t	nan	LYON	FRANCE	nan	nan	\N	2021-06-10 18:23:36.280632	t
341	341	13-15 Avenue Paul Doumer	nan	t	93460	GOURNAY SUR MARNE	FRANCE	AM5931	CaD93#Pi	\N	2021-06-10 18:23:37.489941	t
342	342	50 RUE DE MOLINEL	nan	t	59000	LILLE	FRANCE	AMI0379	nan	\N	2021-06-10 18:23:39.596739	t
343	343	75 RUE PLANGENET	nan	t	49000	ANGERS	FRANCE	AM5951	Legro49#Sch	\N	2021-06-10 18:23:40.648136	t
344	344	ZAC PERROTS ROUTE DE TOULOUSE	nan	t	31570	LANTA	FRANCE	AM5961	CoeLau#31im	\N	2021-06-10 18:23:41.632575	t
345	345	14 B RUE DE PAS	nan	t	59000	LILLE	FRANCE	AMI03111	CU6GjpSN1	\N	2021-06-10 18:23:42.795908	t
346	346	14 Cours Gambetta	nan	t	30300	BEAUCAIRE	FRANCE	AM5981	nan	\N	2021-06-10 18:23:43.805334	t
347	347	11 avenue Michelet	nan	t	49300	CHOLET	FRANCE	AMI0391	nan	\N	2021-06-10 18:23:44.78278	t
348	348	nan	nan	t	75015	PARIS	FRANCE	AM6041	Bee#L15par	\N	2021-06-10 18:23:46.062043	t
349	349	23 rue Lejamptel	nan	t	35120	DOL DE BRETAGNE	FRANCE	AM6061	Laf#35Dol	\N	2021-06-10 18:23:47.338315	t
350	350	51 RUE BASSE	nan	t	59000	LILLE	FRANCE	AM60711	Mlille#59mo1	\N	2021-06-10 18:23:48.27378	t
351	351	5/7  Place du Général de Gaulle	nan	t	93220	GAGNY	FRANCE	AM6091	Aji#93Gagny	\N	2021-06-10 18:23:49.380149	t
353	353	175 avenue de Dunkerque	nan	t	59000	LILLE	FRANCE	AM61311	Pon#AIL591	\N	2021-06-10 18:23:51.604877	t
355	355	129 rue George Clémenceau	nan	t	17320	MARENNES	FRANCE	nan	nan	\N	2021-06-10 18:23:53.353885	t
356	356	48 rue du Portail Louis	nan	t	49400	SAUMUR	FRANCE	AM6181	XXXX	\N	2021-06-10 18:23:54.417272	t
358	358	129 rue Georges Clemenceau	nan	t	17320	MARENNES	FRANCE	nan	nan	\N	2021-06-10 18:23:56.577038	t
363	363	6 RUE DE PENTHIÈVRE	nan	t	75008	PARIS	FRANCE	AM6281	MFi7aeWu	\N	2021-06-10 18:24:02.834466	t
364	364	1 PLACE CHARDONNET	nan	t	37000	TOURS	FRANCE	AM6301	UhuO3gPl	\N	2021-06-10 18:24:03.970815	t
365	365	26 AVENUE DU GENERAL LECLERC	nan	t	92100	BOULOGNE - BILLANCOURT	FRANCE	AM6311	bvtV3xJ1	\N	2021-06-10 18:24:05.153138	t
367	367	73 BOUCLE DE FONT VERT	nan	t	83140	SIX FOURS	FRANCE	nan	nan	\N	2021-06-10 18:24:07.452825	t
370	370	9 Bis Avenue Clémenceau	nan	t	77100	MEAUX	FRANCE	AM6411	Z2LyseBh	\N	2021-06-10 18:24:11.074758	t
371	371	nan	nan	t	nan	nan	FRANCE	nan	nan	\N	2021-06-10 18:24:12.083185	t
372	372	10 rue Carnot	nan	t	85300	CHALLANS	FRANCE	AMI0323	nan	\N	2021-06-10 18:24:13.123585	t
374	374	35 RUE DE LA REPUBLIQUE	nan	t	45330	LE MALESHERBOIS	FRANCE	AM6471	nan	\N	2021-06-10 18:24:15.750087	t
375	375	1 CHEMIN DES ETAMIÈRES LE POTEAU D'EPONE	nan	t	78680	EPONE	FRANCE	AM6481	uwXFVTCd	\N	2021-06-10 18:24:16.818477	t
381	381	5 RUE JEAN MARIE RAIMBAULT	nan	t	49100	ANGERS	FRANCE	nan	nan	\N	2021-06-10 18:24:24.482099	t
382	382	5 RUE JEAN MARIE RAIMBAULT	nan	t	49100	ANGERS	FRANCE	nan	nan	\N	2021-06-10 18:24:25.732383	t
383	383	12 rue Souchu Servinière	XXX	t	53000	LAVAL	FRANCE	AM6621	nan	\N	2021-06-10 18:24:27.237525	t
384	384	5 Boulevard Adolphe Billault	nan	t	44200	NANTES	FRANCE	nan	nan	\N	2021-06-10 18:24:28.765651	t
385	385	13 PLACE DES QUATRE DAUPHINS	nan	t	13100	AIX  EN PROVENCE	FRANCE	AM441	nan	\N	2021-06-10 18:24:30.226512	t
386	386	7 rue Versigny	nan	t	75018	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:24:31.495786	t
389	389	5 PLACE DE CINQ MAI	nan	t	79300	BRESSUIRE	FRANCE	AMI0249	nan	\N	2021-06-10 18:24:34.877858	t
390	390	13 PLACE NOTRE DAME	nan	t	79300	BRESSUIRE	FRANCE	nan	nan	\N	2021-06-10 18:24:35.963233	t
391	391	18 RUE CHAUSSEE WATT	nan	t	59200	TOURCOING	FRANCE	nan	nan	\N	2021-06-10 18:24:37.159552	t
392	392	55 AVENUE DE LA REPUBLIQUE	nan	t	77340	PONTAULT COMBAULT	FRANCE	nan	nan	\N	2021-06-10 18:24:38.668697	t
393	393	42 RUE BASSE	BP 199	t	59029	LILLE	FRANCE	AMI0254	nan	\N	2021-06-10 18:24:41.844874	t
395	395	21 CHEMIN DES TOUARNIES	nan	t	91530	LA VAL  ST GERMAIN	FRANCE	nan	nan	\N	2021-06-10 18:24:45.692675	t
396	396	32 RUE JACQUES LE PAIRE	nan	t	77400	LAGNY SUR MARNE	FRANCE	AMI0277	nan	\N	2021-06-10 18:24:46.791048	t
397	397	49 rue de la Tourmentinerie	nan	t	44850	Saint Mars du Desert	FRANCE	nan	nan	\N	2021-06-10 18:24:47.986367	t
398	398	71 RUE DU GENERAL DE GAULLE	nan	t	53000	LAVAL	FRANCE	AMI0301	nan	\N	2021-06-10 18:24:49.149705	t
399	399	10 RUE DE CAMBRAI	nan	t	62000	ARRAS	FRANCE	nan	nan	\N	2021-06-10 18:24:50.226086	t
400	400	74 RUE MARX DORMOY	nan	t	75018	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:24:52.59973	t
401	401	12 PLACE GEORGES POMPIDOU	nan	t	93160	NOISY LE GRAND	FRANCE	AMI0308	nan	\N	2021-06-10 18:24:53.701106	t
402	402	284 Boulevard Voltaire	nan	t	75011	PARIS	FRANCE	AMI0312	nan	\N	2021-06-10 18:24:54.817463	t
403	403	3 RUE FLORIAN	nan	t	92330	SCEAUX	FRANCE	AMI0313	nan	\N	2021-06-10 18:24:55.998791	t
352	352	76 Route de Fontenay	nan	t	85370	LE LANGON	FRANCE	AMI0535	GBxlwb1a	\N	2021-06-10 18:23:50.658418	t
354	354	7 Route de Chardonchamp	nan	t	86440	MIGNE AUXANCES	FRANCE	nan	nan	\N	2021-06-10 18:23:52.496368	t
357	357	290 B RUE DU GÉNÉRAL LECLERC	nan	t	59380	CYSOING	FRANCE	nan	nan	\N	2021-06-10 18:23:55.506649	t
359	359	Mong Kok Buiding	No 93-99 Mong Kok,road	t	nan	HONG KONG	FRANCE	nan	nan	\N	2021-06-10 18:23:57.795346	t
360	360	2 rue du Général Leclerc	nan	t	93110	ROSNY SOUS BOIS	FRANCE	AM6241	De#AGM93	\N	2021-06-10 18:23:58.983664	t
361	361	57 rue de Lancry	nan	t	75010	PARIS	FRANCE	AM6251	Rep#LAF10	\N	2021-06-10 18:24:00.462817	t
362	362	246 Rue du Faubourg Saint Antoine	nan	t	75012	PARIS	FRANCE	AMI0155	MaUODlVF	\N	2021-06-10 18:24:01.481238	t
366	366	66 avenue des Champs Eluysées	nan	t	75008	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:24:06.334464	t
368	368	COURS GOUDOULI	nan	t	31130	FONSE GRIVES	FRANCE	AM6361	q5Vg2Nyd	\N	2021-06-10 18:24:08.671129	t
369	369	110 avenue Emile Cossonneau	nan	t	93160	NOISY LE GRAND	FRANCE	AM6371	7VrRhWS8	\N	2021-06-10 18:24:09.786495	t
373	373	105 rue Maréchal Joffre	nan	t	85000	LA ROCHE SUR YON	FRANCE	AM6451	nan	\N	2021-06-10 18:24:14.413852	t
376	376	385 RUE DE  VAUGIRAD	nan	t	75015	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:24:17.956828	t
377	377	Rua do Oliva 238-1 Dto	nan	t	1200-774	LISBON	FRANCE	nan	nan	\N	2021-06-10 18:24:19.115163	t
378	378	64 BOULEVARD DE LA LIBERTÉ	nan	t	59000	LILLE	FRANCE	AM6531	nan	\N	2021-06-10 18:24:20.196545	t
379	379	16 RUE DU GENERAL DE GAULLE	nan	t	59110	LA MADELEINE	FRANCE	AM6541	nan	\N	2021-06-10 18:24:21.396863	t
380	380	130 RUE SAINT CHARLES	nan	t	75015	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:24:22.561196	t
387	387	3 RUE D'ALEMEBERT	nan	t	75014	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:24:32.572171	t
388	388	28 BIS RUE DE LA BOURRELIERE	nan	t	44210	PORNIC	FRANCE	nan	nan	\N	2021-06-10 18:24:33.700529	t
394	394	54 ROUTE DU VESINET	nan	t	78400	CHATOU	FRANCE	nan	nan	\N	2021-06-10 18:24:44.211525	t
404	404	30 Rue Du Général de Gaulle	nan	t	78300	POISSY	FRANCE	AMI0314	nan	\N	2021-06-10 18:24:57.292051	t
405	405	41 RUE DE PASSY	nan	t	75016	PARIS	FRANCE	AMI0317	nan	\N	2021-06-10 18:24:58.917123	t
406	406	85 RUE PAUL DOUMER	nan	t	92500	RUEIL MALMAISON	FRANCE	AMI0315	nan	\N	2021-06-10 18:25:02.317182	t
407	407	1 AVENUE LACOTERE	nan	t	31700	CONRNEBARIEU	FRANCE	AMI0318	nan	\N	2021-06-10 18:25:03.779345	t
408	408	10 RUE GEORGES CLEMENCEAU	nan	t	41200	ROMORANTIN LANTHENAY	FRANCE	AMI0320	nan	\N	2021-06-10 18:25:05.182545	t
409	409	132 RUE DE PARIS	nan	t	53000	LAVAL	FRANCE	nan	nan	\N	2021-06-10 18:25:06.058044	t
410	410	48 Rue Geneviève Perrier	nan	t	45160	OLIVET	FRANCE	AMI0335	nan	\N	2021-06-10 18:25:07.073465	t
411	411	17 Place de La Victoire	nan	t	45500	GIEN	FRANCE	AMI0337	nan	\N	2021-06-10 18:25:08.088884	t
412	412	346 Avenue d'Arès	nan	t	33700	MERIGNAC	FRANCE	AMI0338	nan	\N	2021-06-10 18:25:08.983372	t
413	413	1 RUE DU HARAS	nan	t	49100	ANGERS	FRANCE	AMI0346	nan	\N	2021-06-10 18:25:10.001791	t
414	414	4 rue Paul Laguesse	nan	t	77700	CHESSY	FRANCE	AMI0348	nan	\N	2021-06-10 18:25:11.587373	t
415	415	nan	nan	t	nan	nan	FRANCE	AMI0350	nan	\N	2021-06-10 18:25:12.669755	t
416	416	28 RUE GENERAL DE GAULLE	nan	t	78300	POISSY	FRANCE	AMI0356	nan	\N	2021-06-10 18:25:13.671182	t
417	417	11 AVENUE ARISTIDE BRIAND	nan	t	92350	LE PLESSIS-ROBINSSON	FRANCE	nan	nan	\N	2021-06-10 18:25:14.523696	t
418	418	10 PLACE DE LA LAITERIE	nan	t	49000	ANGERS	FRANCE	nan	nan	\N	2021-06-10 18:25:15.596085	t
419	419	189 AVENUE DE LA REPUBLIQUE	nan	t	59110	LA MADELEINE	FRANCE	nan	nan	\N	2021-06-10 18:25:16.576524	t
420	420	444 AVENUE DE DUNKERQUE	nan	t	59130	LAMBERSART	FRANCE	nan	nan	\N	2021-06-10 18:25:17.584946	t
421	421	6 RUE SAINT ANNE	nan	t	59000	LILLE	FRANCE	nan	nan	\N	2021-06-10 18:25:18.68132	t
422	422	8 RUE SAINT ANNE	nan	t	59000	LILLE	FRANCE	nan	nan	\N	2021-06-10 18:25:19.805678	t
423	423	53 Johnson court, 39 Meadowside	XXX	t	SE9 6BS	LONDON	FRANCE	nan	nan	\N	2021-06-10 18:25:20.88906	t
424	424	26 BIS AVENUE JEAN JAURES	nan	t	93220	GAGNY	FRANCE	AMI0386	nan	\N	2021-06-10 18:25:21.880493	t
425	425	54 Rue Nationale	nan	t	49300	CHOLET	FRANCE	nan	nan	\N	2021-06-10 18:25:22.758991	t
426	426	45 Bis Rue Eugene Massé	nan	t	93190	LIVRY GARGAN	FRANCE	AMI0387	nan	\N	2021-06-10 18:25:23.803396	t
427	427	nan	nan	t	nan	nan	FRANCE	nan	nan	\N	2021-06-10 18:25:24.911765	t
428	428	nan	nan	t	nan	nan	FRANCE	nan	nan	\N	2021-06-10 18:25:25.970159	t
429	429	nan	nan	t	nan	nan	FRANCE	nan	nan	\N	2021-06-10 18:25:26.979584	t
430	430	201 Avenue de Versailles	nan	t	75016	PARIS	FRANCE	AMI0397	nan	\N	2021-06-10 18:25:28.412762	t
431	431	6-8 Rue Didienne	nan	t	44000	NANTES	FRANCE	nan	nan	\N	2021-06-10 18:25:29.870931	t
432	432	nan	nan	t	49320	SAINT SATURNIN SUR LOIRE	FRANCE	nan	nan	\N	2021-06-10 18:25:30.979298	t
433	433	6 Rue d'En Barthas	nan	t	81570	SEMALENS	FRANCE	nan	nan	\N	2021-06-10 18:25:31.985723	t
434	434	nan	nan	t	nan	nan	FRANCE	nan	nan	\N	2021-06-10 18:25:33.248001	t
435	435	nan	nan	t	nan	nan	FRANCE	nan	nan	\N	2021-06-10 18:25:34.480297	t
436	436	39 Rue d'Aquitaine	nan	t	44800	SAINT HERBLAIN	FRANCE	nan	nan	\N	2021-06-10 18:25:35.57967	t
437	437	nan	nan	t	nan	nan	FRANCE	AMI0417	nan	\N	2021-06-10 18:25:36.503141	t
438	438	nan	nan	t	nan	nan	FRANCE	nan	nan	\N	2021-06-10 18:25:37.497573	t
439	439	95 RUE ORDERNER	nan	t	75018	PARIS	FRANCE	AMI0426	nan	\N	2021-06-10 18:25:38.454028	t
440	440	57 RUE CAULAINCOURT	nan	t	75018	PARIS	FRANCE	AMI0433	nan	\N	2021-06-10 18:25:39.484438	t
441	441	21 PLACE KENNEDY	nan	t	49100	ANGERS	FRANCE	nan	nan	\N	2021-06-10 18:25:40.610793	t
442	442	ROUTE DE LARVAUR	nan	t	31460	CARAMAN	FRANCE	AMI0438	nan	\N	2021-06-10 18:25:41.872077	t
443	443	2 RUE HARROUYS	nan	t	44470	CRAQUEFOU	FRANCE	AMI0431	nan	\N	2021-06-10 18:25:42.938465	t
444	444	2 RUE DE LA COTE D'OR	nan	t	31500	TOULOUSE	FRANCE	AMI0444	nan	\N	2021-06-10 18:25:44.13678	t
445	445	36 rue Eugène Ténot	nan	t	33000	BORDEAUX	FRANCE	AMI0446	nan	\N	2021-06-10 18:25:45.12022	t
446	446	2 RUE DE BREST	nan	t	35500	VITRE	FRANCE	AM10448	nan	\N	2021-06-10 18:25:46.21419	t
447	447	3 AVENUE DE GAMEVILLE	nan	t	31650	SAINT ORENS DE GAMEVILLE	FRANCE	AMI0450	nan	\N	2021-06-10 18:25:48.448914	t
448	448	24B AVENUE DE BON AIR SAINT-PIERRE MONTLIMART	nan	t	49110	MONTREVAULT-SUR-ÈVRE	FRANCE	AMI0456	nan	\N	2021-06-10 18:25:50.232896	t
449	449	VAUJUAS	nan	t	53440	MARCILLÉ-LA-VILLE	FRANCE	nan	nan	\N	2021-06-10 18:25:53.642946	t
450	450	491 Avenue de Verdun	nan	t	33700	MERIGNAC	FRANCE	AMI0459	nan	\N	2021-06-10 18:25:54.712337	t
451	451	5 RUE JACQUES MARIN	nan	t	49330	SOEURDRES	FRANCE	AMI0460	nan	\N	2021-06-10 18:25:55.700771	t
452	452	6 Place Gasnier Guy / 19 Rue Gambetta	nan	t	77500	CHELLES	FRANCE	AMI0463	nan	\N	2021-06-10 18:25:56.664222	t
453	453	57 RUE DE BENODET	nan	t	29000	QUIMPER	FRANCE	nan	nan	\N	2021-06-10 18:25:58.582127	t
454	454	20 RUE CHASLES	nan	t	78120	RAMBOUILLET	FRANCE	nan	nan	\N	2021-06-10 18:25:59.677499	t
455	455	nan	nan	t	nan	nan	FRANCE	nan	nan	\N	2021-06-10 18:26:01.167652	t
456	456	8 AVENUE RAYMOND NEUVES	nan	t	31500	TOULOUSE	FRANCE	nan	nan	\N	2021-06-10 18:26:02.050145	t
457	457	8 RUE DES CERISIERS	nan	t	31280	DREMIL LAFAGE	FRANCE	nan	nan	\N	2021-06-10 18:26:03.002601	t
458	458	14 PLACE FREDERIC OZANAM	nan	t	33200	BORDEAUX CAUDERAN	FRANCE	nan	nan	\N	2021-06-10 18:26:03.93307	t
460	460	LE DAVIER	nan	t	44810	HERIC	FRANCE	nan	nan	\N	2021-06-10 18:26:06.55757	t
466	466	2 PLACE SAINT PIERRE	nan	t	44470	CARQUEFOU	FRANCE	nan	nan	\N	2021-06-10 18:26:14.580001	t
471	471	12 RUE DES AMITIERES	nan	t	44210	PORNIC	FRANCE	nan	nan	\N	2021-06-10 18:26:20.195875	t
474	474	21 TER AVENUE DE VERDUN	nan	t	33127	MARTIGNAS SUR JALLE	FRANCE	nan	nan	\N	2021-06-10 18:26:23.363477	t
475	475	nan	nan	t	nan	nan	FRANCE	nan	nan	\N	2021-06-10 18:26:24.381896	t
477	477	7 LA CREANCIERE	nan	t	85170	DOMPIERRE SUR YON	FRANCE	nan	nan	\N	2021-06-10 18:26:27.423159	t
479	479	118 RUE DE PREAU	nan	t	nan	nan	FRANCE	nan	nan	\N	2021-06-10 18:26:29.6289	t
459	459	7 RUE NATIONALE	nan	t	85110	CHANTONNAY	FRANCE	nan	nan	\N	2021-06-10 18:26:04.989466	t
461	461	35 RUE DU DOUANIER ROUSSEAU	nan	t	53000	LAVAL	FRANCE	nan	nan	\N	2021-06-10 18:26:07.866825	t
462	462	8 RUE DU MARECHAL NEY	nan	t	85010	LA ROCHE SUR YON	FRANCE	AMI0488	nan	\N	2021-06-10 18:26:09.087493	t
463	463	164 RUE D'ALESIA	nan	t	75014	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:26:10.340204	t
464	464	137 ROUTE DE FRONTON	nan	t	31140	AUCAMVILLE	FRANCE	nan	nan	\N	2021-06-10 18:26:11.908308	t
465	465	6 RUE DES SPORTS	nan	t	49120	MELAY - CHAMILLE EN ANJOU	FRANCE	nan	nan	\N	2021-06-10 18:26:12.945715	t
467	467	27 BOULEVARD DE LA CROIX ROUSSE	nan	t	69004	LYON	FRANCE	nan	nan	\N	2021-06-10 18:26:15.768314	t
468	468	75 BOULEVARD DE CHARONNE	nan	t	75011	PARIS	FRANCE	nan	nan	\N	2021-06-10 18:26:16.768741	t
469	469	61 RUE PIERRE CAZENEUVE	nan	t	31200	TOULOUSE	FRANCE	nan	nan	\N	2021-06-10 18:26:17.814144	t
470	470	LACHAT	nan	t	73160	VIMINES	FRANCE	nan	nan	\N	2021-06-10 18:26:19.09627	t
472	472	1  RUE DU GENERAL DE GAULLE	nan	t	33112	SAINT LAURENT MEDOC	FRANCE	nan	nan	\N	2021-06-10 18:26:21.086009	t
473	473	2 RUE SAINT MARTIN	nan	t	49770	LONGUENEE EN ANJOU	FRANCE	nan	nan	\N	2021-06-10 18:26:21.840347	t
476	476	35 RUE RENE RABAULT	nan	t	49100	ANGERS	FRANCE	nan	nan	\N	2021-06-10 18:26:25.324357	t
478	478	9, rue Alphonse Munchen	nan	t	L-2172	LUXEMBOURG	FRANCE	nan	nan	\N	2021-06-10 18:26:28.441577	t
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
3	\N	\N	\N	kamus bernard	BK	Intervenant de constat	2014-01-01 00:00:00	789851425.0	NaN	NaN	NaN	NaN	0.0	\N	t
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
1	3	actif	Charente et Charente Maritime	NaN	NaN	NaN	34 rue des Platanes	NaN	17220.0	NaN	NaN	NaN	NaN	NaN	NaN	NaN	SAINT ROGATIEN	NaN	\N	2021-06-03 19:40:19.369687	t
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
6	6	0	95	133	133	160	160	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:17:56.136894	t
1	1	85	85	85	85	85	85	85	150	150	150	150	150	\N	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	6	0.04	3	0.01	5	0.01	6	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:17:51.589495	t
14	14	0	105	120	145	160	170	195	0	180	197	214	240	\N	257	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Pour 1 entrant & 1 sortant en même temps, facturation : 1EDL=TN150+1EDL=TS000	\N	2021-06-10 18:18:04.802952	t
10	10	0	112	112	0	112	112	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:00.598357	t
2	2	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:17:52.750831	t
5	5	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:17:55.28938	t
13	13	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:03.81452	t
3	3	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:17:53.632324	t
16	16	0	95	140	140	160	160	160	0	170	170	190	190	\N	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	36	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	240	\N	2021-06-10 18:18:06.862777	t
8	8	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:17:58.101773	t
7	7	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:17:57.127331	t
9	9	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:17:59.292092	t
4	4	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:17:54.421875	t
11	11	80	80	85	90	100	100	100	0	98	118	150	180	\N	190	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	6	0.15	6	0.01	9	0.04	3	0.01	5	0.01	9	0.03	4	0.01	12	0.02	12	0.02	nan	\N	2021-06-10 18:18:01.453864	t
12	12	0	95	140	140	160	160	0	0	170	170	190	190	\N	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:02.533248	t
15	15	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:05.775395	t
17	17	0	99	99	99	170	170	170	0	180	180	200	200	\N	220	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:07.964146	t
18	18	0	90	90	90	90	90	0	0	110	110	110	110	\N	110	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:09.02454	t
23	23	0	85	85	85	85	85	85	0	150	150	150	150	\N	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	30	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	tarif renégocier sur pack à partir 01/01/2015 VOIR XD	\N	2021-06-10 18:18:13.703869	t
19	19	0	90	90	90	90	90	0	0	110	110	110	110	\N	110	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:09.997988	t
21	21	0	110	110	110	110	110	0	0	150	150	150	150	\N	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.3	0	nan	0	nan	0	nan	0	nan	0	nan	67	nan	0	nan	0	nan	nan	\N	2021-06-10 18:18:11.936875	t
27	27	0	85	85	85	85	85	0	0	0	110	110	110	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:17.669603	t
50	50	0	85	85	85	85	85	0	0	130	130	130	130	\N	130	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:38.991457	t
22	22	0	80	90	90	100	100	0	0	115	115	130	130	\N	145	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:12.796386	t
53	53	0	80	95	95	110	110	0	0	160	160	160	160	\N	160	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:41.651938	t
26	26	0	0	0	0	120	120	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:16.807093	t
47	47	0	75	97	97	120	120	0	0	112	112	135	135	\N	157	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:36.170069	t
48	48	0	95	95	95	95	95	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:37.137516	t
49	49	0	107	120	146	163	171	197	0	180	197	214	240	\N	257	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	36	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:18:38.159933	t
37	37	0	85	90	90	100	100	0	0	120	120	140	140	\N	160	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:26.968289	t
35	35	0	85	95	95	105	105	0	0	110	110	130	130	\N	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:25.25027	t
39	39	0	85	90	90	100	100	0	0	120	120	140	140	\N	160	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:28.932167	t
51	51	0	90	90	90	90	90	0	0	150	150	150	150	\N	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	8	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:39.875956	t
43	43	0	71	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.3	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	nan	\N	2021-06-10 18:18:32.705048	t
52	52	0	90	90	90	90	90	0	0	150	150	150	150	\N	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:40.761447	t
55	55	0	90	90	90	90	90	0	0	110	110	110	110	\N	110	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:43.706764	t
57	57	0	90	90	0	90	90	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:45.445771	t
42	42	0	110	110	110	110	110	0	0	150	150	150	150	\N	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.3	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	nan	\N	2021-06-10 18:18:31.712616	t
20	20	0	90	120	120	150	150	150	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	200	\N	2021-06-10 18:18:10.913463	t
32	32	0	125	140	170	190	200	230	0	210	230	250	280	\N	300	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:22.507842	t
31	31	0	70	80	80	90	90	0	0	100	100	110	110	\N	120	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:21.514406	t
24	24	0	125	140	170	190	200	230	0	210	230	250	280	\N	300	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	0	0.01	6	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:14.698298	t
28	28	0	85	90	0	100	0	0	0	120	120	140	140	\N	160	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:18.715005	t
41	41	0	80	80	80	80	80	0	0	80	80	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:30.924066	t
30	30	0	85	100	100	115	115	0	0	117	117	130	130	\N	145	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:20.635908	t
33	33	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:23.34436	t
36	36	0	85	95	95	105	105	0	0	110	110	130	130	\N	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:26.106782	t
25	25	85	85	85	90	90	100	100	0	130	140	150	160	\N	180	200	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	0	0.01	6	0.04	3	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Mise à jour sur tarif 2017 prix par typologie logement sur récap facture	\N	2021-06-10 18:18:15.666746	t
38	38	0	85	90	90	100	100	0	0	120	120	140	140	\N	160	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:27.847788	t
29	29	0	85	100	100	115	115	0	0	115	115	130	130	\N	145	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:19.792388	t
34	34	0	90	90	90	90	90	0	0	150	150	150	150	\N	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:24.194874	t
40	40	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	250	\N	2021-06-10 18:18:30.108496	t
44	44	0	80	90	90	100	100	0	0	120	120	140	140	\N	160	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:33.547567	t
45	45	0	90	90	90	90	90	0	0	115	115	115	115	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:34.398084	t
46	46	0	90	125	125	135	135	0	0	170	170	190	190	\N	220	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	0	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:18:35.308564	t
54	54	0	0	0	0	0	0	0	0	0	270	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:42.880236	t
60	60	0	85	110	110	136	136	0	0	127	127	153	153	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:48.099831	t
56	56	0	100	140	140	160	160	0	0	170	170	190	190	\N	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:44.509305	t
63	63	0	0	0	0	0	0	0	0	0	0	150	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:51.06114	t
64	64	90	90	95	100	120	135	145	0	120	140	160	180	\N	230	315	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.45	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	4	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-10 18:18:51.891667	t
61	61	0	0	80	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:49.216194	t
58	58	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:46.366822	t
456	456	0	0	180	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	4	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:26:02.142092	t
59	59	0	85	85	85	85	85	0	0	120	120	120	120	\N	120	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:47.263314	t
65	65	0	85	85	85	85	85	0	0	110	110	110	110	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:52.764168	t
455	455	0	0	90	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	6	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:26:01.23461	t
66	66	0	80	80	80	85	85	0	0	100	100	100	100	\N	100	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Abon	\N	2021-06-10 18:18:53.822562	t
458	458	85	85	90	95	120	130	145	120	120	130	150	180	\N	230	315	25	25	25	25	30	30	\N	25	25	25	30	30	30	40	40	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	4	0.03	4	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-10 18:26:04.020019	t
461	461	0	0	0	0	0	230	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	6	0.03	0	0.01	0	0.02	12	0.02	nan	\N	2021-06-10 18:26:07.92679	t
457	457	0	0	0	0	0	0	0	0	0	0	220	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	4	0.03	4	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-10 18:26:03.079556	t
460	460	0	0	0	0	0	0	0	0	0	0	300	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	7	0.01	0	0.02	12	0.02	nan	\N	2021-06-10 18:26:06.612541	t
459	459	90	90	95	100	110	120	135	120	120	130	150	180	\N	230	315	25	25	25	25	30	30	\N	25	25	25	30	30	30	40	40	\N	0.5	0	0.15	7	0.01	7	0.04	3	0.01	5	0.01	3	0.03	4	0.01	0	0.02	12	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-10 18:26:05.064422	t
462	462	80	85	90	95	110	120	130	100	115	150	150	170	\N	190	290	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	6	0.15	7	0.01	6	0.04	3	0.01	5	0.01	5	0.03	4	0.01	13	0.02	13	0.02	nan	\N	2021-06-10 18:26:09.166448	t
463	463	80	85	85	90	95	100	110	0	120	130	150	170	\N	240	300	25	25	25	25	30	30	\N	25	25	25	30	30	30	40	40	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	11	0.03	4	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-10 18:26:10.389176	t
62	62	0	99	99	99	150	150	0	0	170	170	190	190	\N	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	36	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:18:50.199631	t
71	71	0	99	99	115	160	160	0	0	170	170	190	190	\N	230	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	F2 99,00\nF3 115,00	\N	2021-06-10 18:18:58.327988	t
74	74	0	120	160	200	240	320	360	0	180	210	225	240	\N	300	500	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	5	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:01.245327	t
67	67	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	377	\N	2021-06-10 18:18:54.659087	t
69	69	80	80	85	90	100	100	100	0	98	118	150	180	\N	190	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	5	0.15	5	0.01	3	0.04	3	0.01	5	0.01	3	0.03	4	0.01	4	0.02	4	0.02	Passage à la facture récap sur nouveau tarif par typologie à partir du 01/03/2017. MAJ par XD	\N	2021-06-10 18:18:56.385099	t
70	70	80	80	85	90	100	100	100	0	98	118	150	180	\N	190	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	5	0.15	0	0.01	3	0.04	3	0.01	5	0.01	3	0.03	4	0.01	4	0.02	4	0.02	Passage à la facture récap sur nouveau tarif par typologie à partir du 01/03/2017. MAJ par XD	\N	2021-06-10 18:18:57.456489	t
68	68	0	85	85	85	85	85	0	0	130	130	130	130	\N	130	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:55.474618	t
76	76	0	90	90	90	90	90	0	0	150	150	150	150	\N	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.26	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:03.474051	t
77	77	0	85	85	85	85	85	0	0	110	110	110	110	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:04.445495	t
75	75	0	0	100	100	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:02.327706	t
73	73	0	90	90	90	90	90	0	0	150	150	150	150	\N	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:18:59.917082	t
72	72	0	100	120	120	150	150	0	0	150	150	170	170	\N	190	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	5	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	nan	\N	2021-06-10 18:18:59.108544	t
81	81	0	90	90	90	90	90	0	0	150	150	150	150	\N	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	5	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:09.363684	t
80	80	0	90	90	90	90	90	0	0	150	150	150	150	\N	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:08.248323	t
79	79	0	90	90	90	90	90	0	0	150	150	150	150	\N	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	0	0.01	0	0.04	3	0.01	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:06.951063	t
78	78	0	90	90	90	90	90	0	0	150	150	150	150	\N	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	5	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:05.749751	t
82	82	0	90	90	90	90	90	0	0	150	150	150	150	\N	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	5	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	nan	\N	2021-06-10 18:19:10.675936	t
83	83	0	90	90	90	90	90	0	0	150	150	150	150	\N	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.26	0	nan	0	nan	0	nan	0	nan	0	nan	67	nan	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:11.901538	t
88	88	0	0	100	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:17.801168	t
86	86	0	99	99	99	160	160	0	0	170	170	190	190	\N	230	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:15.550454	t
101	101	0	0	0	0	115	115	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:32.18495	t
84	84	0	90	90	90	90	90	90	0	150	150	150	150	\N	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	7	0.01	12	0.02	12	0.02	Au 01/05/16 - Pack 70 EDL=9600e/an=800e/mois.Début 01/05/2017	\N	2021-06-10 18:19:13.108848	t
91	91	0	100	130	130	150	150	0	0	170	170	190	190	\N	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:20.75648	t
90	90	0	110	140	140	160	160	0	0	170	170	190	190	\N	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:19.738062	t
87	87	0	0	0	0	0	0	0	0	0	80	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:16.700798	t
85	85	80	80	85	90	100	100	100	0	98	118	150	180	\N	190	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Même pack que ADRESSE VAL EUOPE, 200 EDL=12*1500	\N	2021-06-10 18:19:14.417099	t
96	96	0	85	85	85	85	85	0	0	110	110	110	110	\N	110	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:26.819015	t
89	89	0	0	120	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:18.65468	t
92	92	0	100	140	140	160	160	0	0	170	170	190	190	\N	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:22.985207	t
94	94	0	0	130	130	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:24.818158	t
93	93	0	100	140	140	160	160	0	0	170	170	190	190	\N	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:24.001625	t
95	95	0	100	140	140	160	160	0	0	170	170	190	190	\N	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:25.817588	t
97	97	0	90	90	90	90	90	0	0	150	150	150	150	\N	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.26	0	nan	0	nan	0	nan	0	nan	0	nan	67	nan	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:28.10628	t
98	98	0	0	0	0	100	100	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:29.002773	t
118	118	90	92	92	95	110	130	150	0	120	130	150	170	\N	200	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	7	0.01	7	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	Tarif découverte les 3 premiers constats 90€/Appt & 130€/PAv	\N	2021-06-10 18:19:49.460084	t
123	123	0	0	120	120	120	120	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:54.242351	t
99	99	0	99	99	99	170	170	0	0	180	180	200	200	\N	220	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:29.904254	t
115	115	0	90	90	90	90	90	0	0	150	150	150	150	\N	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	5	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	nan	\N	2021-06-10 18:19:46.302886	t
109	109	0	90	90	90	110	110	0	0	130	130	170	170	\N	190	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:40.080441	t
100	100	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	110	\N	2021-06-10 18:19:30.873699	t
113	113	0	90	90	90	90	90	90	0	150	150	150	150	\N	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	5	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	nan	\N	2021-06-10 18:19:44.138122	t
104	104	0	125	140	170	190	200	230	0	210	230	250	280	\N	300	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:19:35.247203	t
112	112	0	90	90	0	90	90	0	0	150	150	150	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Pack 50 unités du 01/02/14 au 01/02/15, Tarif annuel 5500€  en 12 factures de 458,33  en HT\nLes meublés comptent 1,5 unité	\N	2021-06-10 18:19:43.218648	t
102	102	0	0	0	0	0	0	0	0	0	0	175	175	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:33.178387	t
107	107	80	80	85	90	100	100	100	0	98	118	150	180	\N	190	260	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	30	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	Pack pour 200 EDL 12x1500	\N	2021-06-10 18:19:38.110568	t
106	106	0	90	90	90	90	90	0	0	150	150	150	150	\N	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:37.102142	t
111	111	0	90	90	90	90	90	0	0	150	150	150	150	\N	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.26	0	nan	6	nan	0	nan	0	nan	0	nan	0	nan	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:42.038323	t
103	103	0	0	120	120	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:34.197806	t
108	108	0	90	90	90	90	90	0	0	150	150	150	150	\N	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Pack 150 EDL  12*875	\N	2021-06-10 18:19:39.094004	t
105	105	0	90	90	90	90	90	0	0	150	150	150	150	\N	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:36.073729	t
110	110	80	80	85	90	100	100	100	0	98	118	150	180	\N	190	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	4	0.01	12	0.02	12	0.02	nan	\N	2021-06-10 18:19:41.04289	t
114	114	0	110	110	110	110	110	0	0	170	170	190	190	\N	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	6	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:45.291464	t
116	116	0	0	120	120	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:47.331301	t
117	117	0	85	85	85	85	85	0	0	110	110	110	110	\N	110	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:48.464652	t
127	127	0	90	90	90	90	90	0	0	0	0	115	115	\N	115	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:58.412029	t
133	133	0	0	0	0	0	0	0	0	100	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:20:06.115832	t
130	130	0	90	90	90	90	90	0	0	150	150	150	150	\N	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:20:02.390964	t
119	119	0	120	160	200	240	320	360	0	180	210	225	240	\N	300	500	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	5	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:50.42953	t
128	128	0	90	90	90	90	90	0	0	150	150	150	150	\N	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	0	0.01	0	0.04	3	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:59.739284	t
124	124	0	0	120	120	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:55.286755	t
120	120	80	80	85	90	100	100	100	0	98	118	150	180	\N	190	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	0	0.01	0	0.04	3	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:51.365994	t
125	125	0	0	85	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:56.217225	t
126	126	0	90	90	90	90	90	0	0	150	150	150	150	\N	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	5	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	nan	\N	2021-06-10 18:19:57.181674	t
121	121	0	0	0	0	0	0	0	0	185	185	185	185	\N	185	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.26	0	nan	0	nan	0	nan	0	nan	0	nan	67	nan	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:52.257485	t
131	131	0	110	140	140	160	160	0	0	190	190	210	210	\N	230	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Meublés +50%	\N	2021-06-10 18:20:03.460351	t
129	129	0	0	0	0	0	0	0	0	150	150	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:20:01.468487	t
122	122	0	90	90	90	90	90	0	0	150	150	150	150	\N	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.26	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	0.02	0	0.02	nan	\N	2021-06-10 18:19:53.069022	t
135	135	80	85	85	85	95	100	110	0	98	118	150	150	\N	170	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	0	0.01	6	0.04	3	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Mise à jour tarif le 20/03/2017 par XD suite rdv de validation pour le groupe SERGIC	\N	2021-06-10 18:20:08.323573	t
132	132	0	114	134	154	169	184	204	0	124	144	194	234	\N	264	324	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	5	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	17/03/17 Tarif période de test	\N	2021-06-10 18:20:04.325856	t
134	134	90	95	100	105	110	120	130	120	120	140	150	170	\N	200	300	30	30	30	30	40	40	\N	40	40	45	50	55	60	70	80	\N	0.5	6	0.15	7	0.01	67	0.04	3	0.01	5	0.01	5	0.03	67	0.01	67	0.02	0	0.02	Tarif  lis à jour au 09/05/2019	\N	2021-06-10 18:20:07.068288	t
136	136	0	90	90	90	90	90	0	0	150	150	150	150	\N	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	0	0.01	6	0.04	3	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Tarif valable pour 10 constats	\N	2021-06-10 18:20:09.356982	t
137	137	0	105	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:20:10.302714	t
149	149	80	80	85	90	100	100	100	0	98	118	150	180	\N	190	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	8	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	A partir du 15/09/2016 facture récapitulative. Le pack précédant cours jusqu'à 10/2016 inclu. Il y donc aura 2 factures en 10/16	\N	2021-06-10 18:20:20.346475	t
147	147	80	80	85	90	100	100	100	0	98	118	150	180	\N	190	260	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	22/12/2016 - New Pack 200-33(dépassement 2016)=167 EDL du 01/01/17 au 31/12/17 total 19.500€ ht soit 1.625€ / MOIS\nFacture récap	\N	2021-06-10 18:20:18.689418	t
146	146	0	90	90	90	90	90	90	0	150	150	150	150	\N	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	A partir de 09/2014 Pack de 30 EDL à 120€ l'unité	\N	2021-06-10 18:20:17.786935	t
138	138	0	90	90	90	90	90	0	0	150	150	150	150	\N	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	0	0.01	6	0.04	3	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	PERIODE TEST	\N	2021-06-10 18:20:11.076766	t
141	141	0	90	90	90	90	90	0	0	150	150	150	150	\N	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	PERIODE TEST	\N	2021-06-10 18:20:13.480393	t
143	143	83	83	87	95	110	120	130	130	130	150	200	240	\N	270	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	36	0.15	7	0.01	73	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	XD LE 01/11/2017 passage en facture recapt et mise à jour des tarifs suivant formulaire CM / PAKC 400  constats=44800/an, par mois=(3733.33/12)/4=933.33 par agences sur les 4 entités Période= 06/2016 à 05/2017	\N	2021-06-10 18:20:15.071484	t
139	139	0	100	100	100	100	100	0	0	100	100	100	100	\N	100	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:20:11.902294	t
153	153	90	90	100	110	120	135	145	120	120	140	160	180	\N	230	315	20	20	25	25	30	30	\N	30	30	30	40	40	50	50	50	\N	0.45	5	0.15	7	0.01	13	0.04	3	0.01	5	0.01	13	0.03	4	0.01	4	0.02	4	0.02	locaux commerciaux sur devis	\N	2021-06-10 18:20:23.881454	t
152	152	85	85	90	100	110	120	130	0	130	150	200	240	\N	270	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	73	0.04	3	0.01	5	0.01	0	0.03	73	0.01	4	0.02	4	0.02	Pack 3 - 60 constats appt vides et meublés prix annuel=6720€ ht, en 12 mois de 01/17 à 12/17 à 560.00€ ht	\N	2021-06-10 18:20:22.981966	t
151	151	0	125	125	125	125	125	125	0	210	210	210	210	\N	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Tarif découverte du 10/09/14 au 10/11/14	\N	2021-06-10 18:20:22.139448	t
144	144	0	90	90	90	90	90	90	0	150	150	150	150	\N	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	0	0.01	0	0.04	3	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Essai 2 mois au 10/07/14	\N	2021-06-10 18:20:16.081909	t
142	142	0	130	130	130	130	130	130	0	130	130	130	130	\N	130	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:20:14.228965	t
145	145	0	90	90	90	90	90	90	0	150	150	150	150	\N	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:20:16.895441	t
140	140	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:20:12.669857	t
148	148	0	119	133	162	181	190	219	0	210	230	250	280	\N	300	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	Offre découverte du 01/08 au 30/09 2014	\N	2021-06-10 18:20:19.469972	t
150	150	0	90	90	90	90	90	90	0	150	150	150	150	\N	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	5	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	nan	\N	2021-06-10 18:20:21.15501	t
154	154	0	110	110	110	110	110	110	0	210	210	210	210	\N	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:20:24.900869	t
185	185	0	0	110	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	8	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:20:52.742993	t
163	163	0	125	140	170	190	200	230	0	210	230	250	280	\N	300	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	8	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:20:33.336983	t
161	161	0	85	85	85	85	85	85	0	150	150	150	150	\N	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	0	0.01	0	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	facture récap sur M n-1 à 85 €ht  le coût constat moyen	\N	2021-06-10 18:20:31.699917	t
155	155	80	80	85	90	100	100	100	0	98	118	150	180	\N	190	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	65	0.28	65	0.0	65	0	65	0.0	65	0	65	0.0	65	0.0	65	0.0	0	0.02	39600€ ht pour 12 mois	\N	2021-06-10 18:20:26.143672	t
182	182	0	90	101	122	137	144	165	0	151	165	180	201	\N	216	252	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:20:50.188452	t
181	181	0	90	101	122	137	144	165	0	151	165	180	201	\N	216	252	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Formule 1 fcature récap mensuelle à par du 1er avril 2017 (1ère facture en Mai)	\N	2021-06-10 18:20:49.322946	t
176	176	0	0	0	0	141	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:20:45.206298	t
175	175	0	0	0	0	250	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	36	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:20:44.404757	t
156	156	0	0	0	0	0	0	0	0	0	0	150	150	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:20:27.165089	t
162	162	0	125	140	170	190	200	230	0	210	230	250	280	\N	300	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	8	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:20:32.505456	t
180	180	0	85	85	85	85	85	85	0	150	150	150	150	\N	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.25	0	0.0	0	0	0	0.0	0	0	0	0.0	4	0.01	4	0.02	4	0.02	Pack 18 constats à 136€= 2448€ en 12 mensualités, soit 204€ HT /mois. 1ère mensualité 03/16 à 02/17	\N	2021-06-10 18:20:48.525401	t
177	177	0	125	140	170	190	200	230	0	210	230	250	280	\N	300	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:20:46.041821	t
164	164	0	95	140	140	160	160	180	0	170	170	190	190	\N	210	230	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	36	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:20:34.333417	t
179	179	80	80	85	90	100	100	100	0	98	118	150	180	\N	190	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:20:47.676887	t
178	178	0	0	0	210	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:20:46.841363	t
183	183	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.16	0	0.01	5	0.04	0	nan	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	3€ /m² prix indiqué en TS sur constat	\N	2021-06-10 18:20:50.950016	t
184	184	0	90	101	122	137	144	165	0	151	165	180	201	\N	216	252	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:20:51.767549	t
186	186	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	2,00€ par m²	\N	2021-06-10 18:20:53.638514	t
170	170	0	90	101	122	137	144	165	0	151	165	180	201	\N	216	252	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:20:39.930216	t
173	173	0	125	140	170	190	200	230	0	210	230	250	280	\N	300	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:20:42.724714	t
172	172	80	80	85	90	100	100	100	0	98	118	150	180	\N	190	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	5	0.15	7	0.01	3	0.04	3	0.01	5	0.01	3	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:20:41.665226	t
159	159	112	120	140	160	175	190	210	0	175	190	210	240	\N	270	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	8	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:20:29.842981	t
165	165	90	90	100	110	120	135	145	120	120	140	160	180	\N	230	315	20	20	25	25	30	30	\N	30	30	30	40	40	50	50	50	\N	0.45	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-10 18:20:35.541725	t
167	167	0	125	140	170	190	200	230	0	210	230	250	280	\N	300	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	36	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:20:37.421648	t
166	166	0	85	85	85	85	85	85	0	150	150	150	150	\N	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	5	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	Pack 30 EDL tarif 150 € soit 4500€ en 5 mensualités de 900€ 1ère=15/08/2015 Dernière= 15/12/2015	\N	2021-06-10 18:20:36.534156	t
157	157	0	103	123	143	158	173	193	0	111	131	181	221	\N	251	311	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	5	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	Facturation récapitulative à partir du 01/03/2107 sur grille tarifaire	\N	2021-06-10 18:20:27.934652	t
168	168	0	90	101	122	137	144	165	0	151	165	180	201	\N	216	252	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:20:38.262168	t
160	160	0	120	120	120	120	120	120	0	210	210	210	210	\N	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Offre d'essai	\N	2021-06-10 18:20:30.709482	t
169	169	0	90	101	122	137	144	165	0	151	165	180	201	\N	216	252	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	36	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:20:39.159656	t
158	158	0	0	120	120	120	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:20:28.784582	t
188	188	85	93	113	133	148	163	183	0	98	118	168	208	\N	238	298	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	5	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	Factures récap.          Anciennes infos : EDLE=2.00€ ht / m², EDLS=1,50€ ht / m² avec fact. / mois en récap	\N	2021-06-10 18:20:55.288571	t
171	171	0	90	101	122	137	144	156	0	151	165	180	201	\N	216	252	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:20:40.841696	t
174	174	92	100	120	140	155	170	190	155	155	170	190	217	\N	247	307	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:20:43.565235	t
189	189	0	90	90	90	115	166	186	0	150	150	186	226	\N	256	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	20	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Facturation : facture récap.   client en facture récap sur interventions réalisé sur le mois et facturé le mois suivant	\N	2021-06-10 18:20:56.146081	t
190	190	0	0	0	0	0	0	0	0	0	0	0	120	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	0	0.01	19	0.04	3	0.01	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:20:56.998593	t
192	192	0	125	140	170	190	200	230	0	210	230	250	280	\N	300	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:20:58.774579	t
199	199	0	125	140	170	190	200	230	0	210	230	250	280	\N	300	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	36	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:21:05.665642	t
205	205	80	85	85	90	95	100	110	0	120	130	150	170	\N	240	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	Pack 75 constats à 6.750€ht en 12 fact de 562,50€ émises de 09/2016 à 08/2017  / XD mise en place nouveau tarif en facture récap 85 par interventons et 50% meublé	\N	2021-06-10 18:21:10.694771	t
197	197	0	125	140	170	190	200	230	0	210	230	250	280	\N	300	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:21:03.911644	t
194	194	0	85	85	85	85	85	85	0	150	150	150	150	\N	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	0	0.01	0	0.04	3	0.01	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	FACT PROPO MGL	\N	2021-06-10 18:21:00.664501	t
187	187	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	5	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	Tarif Spécial indiqué sur le constat	\N	2021-06-10 18:20:54.397079	t
201	201	0	0	0	170	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:21:07.272726	t
191	191	0	85	85	85	85	85	85	0	150	150	150	150	\N	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	0	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	FACT EDLE 2€ /M² pour EDLS 1,50 € / M²	\N	2021-06-10 18:20:57.764156	t
196	196	0	0	0	170	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:21:02.622382	t
193	193	0	85	85	85	85	85	85	0	150	150	150	150	\N	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	6	0.04	3	0.01	5	0.01	5	0.03	4	0.01	12	0.02	12	0.02	FACT 2 € le m²	\N	2021-06-10 18:20:59.586114	t
200	200	0	107	120	146	163	171	197	0	180	197	214	240	\N	257	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	6	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:21:06.452194	t
198	198	85	93	113	133	148	163	183	0	98	118	168	208	\N	238	298	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	5	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	Facture Récap           Ancien : EDLE=2.00€ ht / m², EDLS=1,50€ ht / m² avec fact. / mois en récap	\N	2021-06-10 18:21:04.761163	t
195	195	0	85	85	85	85	85	85	0	150	150	150	150	\N	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	0	0.01	0	0.04	3	0.01	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	FACT PROPO MGL	\N	2021-06-10 18:21:01.394083	t
204	204	0	90	101	122	137	144	165	0	151	165	180	201	\N	216	252	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:21:09.895227	t
203	203	0	0	0	170	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:21:09.088687	t
202	202	0	0	0	170	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	36	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:21:08.05328	t
206	206	85	85	85	90	90	150	150	0	150	150	150	200	\N	200	200	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	4	0.01	12	0.02	12	0.02	Tarif applicable au 01/05/2017	\N	2021-06-10 18:21:11.636232	t
207	207	0	90	0	0	0	0	0	0	0	0	150	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	0	0.01	19	0.04	3	0.01	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:21:12.427782	t
208	208	0	90	90	110	110	150	150	0	150	150	150	200	\N	200	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	0	0.01	19	0.04	3	0.01	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:21:13.231326	t
231	231	90	90	90	110	130	150	170	120	120	140	190	230	\N	260	320	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	7	0.01	0	0.04	3	0.01	5	0.01	0	0.03	73	0.01	4	0.02	4	0.02	client en facture récap sur interventions réalisé sur le mois et facturé le mois suivant	\N	2021-06-10 18:21:34.37043	t
209	209	0	95	140	140	160	160	180	0	210	230	250	280	\N	300	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:21:14.069841	t
213	213	85	85	85	85	85	85	85	150	150	150	150	150	\N	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.25	0	0.0	0	0	0	0.0	0	0	0	0.0	67	0.01	7	0.02	0	0.02	nan	\N	2021-06-10 18:21:17.764858	t
233	233	95	103	123	143	158	173	193	0	111	131	181	221	\N	251	311	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:21:36.027916	t
210	210	0	125	140	170	190	200	230	0	210	230	250	280	\N	300	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:21:15.254167	t
230	230	0	85	93	113	133	148	163	0	98	118	168	208	\N	238	298	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	34	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	client en facture récap sur interventions réalisé sur le mois et facturé le mois suivant	\N	2021-06-10 18:21:33.519914	t
229	229	80	85	85	85	90	95	100	100	120	120	150	150	\N	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	6	0.04	3	0.01	5	0.01	5	0.03	67	0.01	12	0.02	12	0.02	nan	\N	2021-06-10 18:21:32.56846	t
215	215	0	90	90	110	110	150	150	0	150	150	150	200	\N	200	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	4	0.01	12	0.02	12	0.02	Local commercial 3Ps 100€	\N	2021-06-10 18:21:19.630792	t
211	211	85	85	85	85	85	85	85	150	150	150	150	150	\N	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.25	0	0.0	0	0	0	0.0	0	0	0	0.0	67	0.01	7	0.02	0	0.02	nan	\N	2021-06-10 18:21:16.093686	t
228	228	90	90	105	120	140	170	180	110	115	135	160	180	\N	200	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	5	0.15	7	0.01	0	0.04	3	0.01	5	0.01	3	0.03	0	0.01	0	0.02	0	0.02	client en facture récap sur interventions réalisé sur le mois et facturé le mois suivant	\N	2021-06-10 18:21:31.786905	t
214	214	0	125	140	170	190	200	230	0	210	230	250	280	\N	300	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	36	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:21:18.771284	t
225	225	80	85	85	85	95	100	110	0	98	118	150	150	\N	170	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Mise à jour tarif par XD suite rdv avec groupe SERGIC	\N	2021-06-10 18:21:29.027747	t
212	212	85	85	85	85	85	85	85	150	150	150	150	150	\N	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.25	0	0.0	0	0	0	0.0	0	0	0	0.0	67	0.01	7	0.02	0	0.02	nan	\N	2021-06-10 18:21:16.988178	t
234	234	0	0	130	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Facturé en en TS	\N	2021-06-10 18:21:36.904415	t
227	227	112	120	140	160	175	190	210	0	130	150	200	240	\N	270	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:21:30.795737	t
232	232	92	100	120	140	155	170	190	0	107	127	177	217	\N	247	307	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:21:35.19739	t
235	235	80	80	85	90	100	100	100	0	98	118	150	180	\N	190	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	7	0.01	7	0.02	0	0.02	nan	\N	2021-06-10 18:21:37.786913	t
236	236	0	111	131	151	166	181	201	0	124	144	194	234	\N	264	324	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:21:38.675403	t
237	237	85	85	90	90	100	110	120	0	100	110	180	190	\N	200	220	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.16	0	0.01	6	0.04	0	nan	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Facture en récap	\N	2021-06-10 18:21:39.438967	t
226	226	0	0	375	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	36	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:21:29.918241	t
219	219	85	85	90	90	95	110	120	0	150	150	150	200	\N	200	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	38	0.15	0	0.01	38	0.04	3	0.01	5	0.01	38	0.03	67	0.01	36	0.02	4	0.02	Facture récap	\N	2021-06-10 18:21:23.307691	t
216	216	0	0	165	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Tarif spécial meublé	\N	2021-06-10 18:21:20.61523	t
222	222	80	80	85	90	100	100	100	0	98	118	150	180	\N	190	250	20	20	25	25	30	30	\N	30	30	30	40	40	50	50	50	\N	0.45	7	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	67	0.01	7	0.02	0	0.02	Tarif par mission à compter du 01/05/2017\nNouvelle proposition au tarif national L'ADRESSE en facture récap locaux commerciaux sur devis.	\N	2021-06-10 18:21:26.021467	t
217	217	0	0	0	0	0	0	0	0	0	0	150	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.16	0	0.01	6	0.04	0	nan	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:21:21.511717	t
224	224	80	80	85	90	100	100	100	0	98	118	150	180	\N	190	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	6	0.15	6	0.01	9	0.04	3	0.01	5	0.01	9	0.03	4	0.01	12	0.02	12	0.02	passage au tarif cadre réseau L'Adresse au 01/01/2018	\N	2021-06-10 18:21:27.918382	t
221	221	0	125	125	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Tarif en TSxxx	\N	2021-06-10 18:21:25.211931	t
242	242	80	85	85	90	95	100	110	0	100	110	150	150	\N	160	180	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	65	0.15	65	0.01	65	0.04	65	0.01	65	0.01	65	0.03	65	0.01	65	0.02	0	0.02	facture récap	\N	2021-06-10 18:21:44.020358	t
218	218	0	0	0	0	0	0	0	0	0	0	200	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.16	0	0.01	6	0.04	0	nan	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:21:22.261291	t
220	220	112	120	140	160	175	190	210	0	130	150	200	240	\N	270	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	XD le 23/06/2017 mise à jour des tarifs suite envoi bordereau de CM	\N	2021-06-10 18:21:24.15021	t
223	223	90	95	100	114	120	131	143	120	120	135	155	180	\N	230	300	30	30	30	30	40	40	\N	45	40	45	50	55	60	70	80	\N	0.45	7	0.15	7	0.01	7	0.04	3	0.01	0	0.01	5	0.03	4	0.01	12	0.02	12	0.02	Facture  récap / MAJORATION MEUBLE  +45% / LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-10 18:21:26.988914	t
239	239	0	0	0	165	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.16	0	0.01	7	0.04	0	nan	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:21:41.177976	t
238	238	0	0	0	166	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	36	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:21:40.294478	t
241	241	85	85	85	90	90	110	120	0	116	136	186	226	\N	256	316	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	facture récap	\N	2021-06-10 18:21:42.95696	t
240	240	106	114	134	154	169	184	204	0	124	144	194	234	\N	264	324	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	Facture récap	\N	2021-06-10 18:21:42.205392	t
243	243	0	0	0	0	0	0	0	0	0	0	0	250	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	TS250	\N	2021-06-10 18:21:44.940827	t
244	244	85	85	85	95	100	110	130	0	130	150	150	180	\N	200	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	38	0.04	3	0.01	5	0.01	36	0.03	73	0.01	4	0.02	0	0.02	facture récap	\N	2021-06-10 18:21:45.836317	t
248	248	90	90	90	90	105	120	150	0	100	120	150	170	\N	200	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	Facture récap	\N	2021-06-10 18:21:51.090313	t
250	250	85	85	85	85	95	110	130	0	130	150	150	180	\N	200	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	38	0.04	3	0.01	5	0.01	73	0.03	0	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:21:53.392001	t
245	245	95	100	120	140	155	170	190	0	107	127	177	217	\N	247	307	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Facture récap	\N	2021-06-10 18:21:46.60987	t
470	470	0	0	140	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	7	0.01	7	0.04	3	0.01	5	0.01	6	0.03	4	0.01	12	0.02	12	0.02	nan	\N	2021-06-10 18:26:19.194215	t
246	246	85	85	90	90	90	110	120	0	110	130	150	170	\N	200	200	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	0	0.01	0	0.04	3	0.01	5	0.01	5	0.03	0	0.01	12	0.02	12	0.02	nan	\N	2021-06-10 18:21:47.679261	t
465	465	0	0	0	0	0	0	0	0	0	0	150	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	nan	6	0.01	6	0.04	3	0.01	5	0.01	6	0.03	4	0.01	0	0.02	12	0.02	nan	\N	2021-06-10 18:26:13.040662	t
249	249	85	93	113	133	148	163	183	0	98	118	168	208	\N	238	298	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	6	0.2	6	0.0	6	0	3	0.01	5	0.01	0	0.03	0	0.01	12	0.02	12	0.02	facture récpa	\N	2021-06-10 18:21:52.453537	t
466	466	80	80	85	90	100	100	100	0	98	118	150	180	\N	190	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	7	0.15	6	0.01	7	0.04	3	0.01	5	0.01	7	0.03	4	0.01	12	0.02	12	0.02	nan	\N	2021-06-10 18:26:14.659957	t
251	251	99	108	126	144	162	180	225	120	130	150	200	240	\N	270	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	Découverte Appt=112.00 ht, PAV=130.00 ht\nOffre promotionnelle TS000 pour cde 5 maisons groupées\nFacture récap ou pas non précisé	\N	2021-06-10 18:21:54.241513	t
247	247	85	90	90	110	110	130	130	0	150	150	150	200	\N	200	200	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:21:48.526775	t
464	464	0	0	0	0	0	0	0	0	0	0	0	260	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	4	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:26:11.965278	t
253	253	0	0	0	148	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:21:56.084459	t
254	254	112	120	140	160	175	190	210	0	130	150	200	240	\N	270	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:21:56.973952	t
468	468	0	0	135	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	11	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:26:16.825708	t
469	469	0	0	0	144	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	4	0.04	3	0.01	5	0.01	4	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:26:17.894099	t
467	467	0	0	0	0	235	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	11	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:26:15.853264	t
471	471	125	125	135	145	155	165	175	150	155	180	200	250	\N	280	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	7	0.15	7	0.01	7	0.04	3	0.01	5	0.01	0	0.03	4	0.01	4	0.02	12	0.02	nan	\N	2021-06-10 18:26:20.233874	t
472	472	90	90	95	100	110	120	135	120	125	140	160	180	\N	230	320	25	25	25	25	30	30	\N	25	25	25	30	30	30	40	40	\N	0.5	4	0.15	7	0.01	7	0.04	3	0.01	5	0.01	4	0.03	4	0.01	4	0.02	12	0.02	FDC SUR DEVIS	\N	2021-06-10 18:26:21.123982	t
264	264	85	85	85	85	85	85	85	0	150	150	150	150	\N	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	67	0.04	3	0.01	5	0.01	5	0.03	0	0.01	12	0.02	12	0.02	Facture récap	\N	2021-06-10 18:22:07.802232	t
263	263	90	95	95	100	130	150	180	0	115	135	150	170	\N	200	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	3 1er EDL APPT=90.00 ht, PAV=150.00ht	\N	2021-06-10 18:22:06.49598	t
258	258	88	88	90	95	100	115	130	0	120	130	150	170	\N	240	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	Facture Récap. Tarif découverte 3 constats : APPT=90€ ht, PAV=130€ ht.	\N	2021-06-10 18:22:00.968672	t
252	252	0	0	0	0	0	0	0	0	0	0	0	0	\N	300	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	PRO PARTICULIER	\N	2021-06-10 18:21:55.228949	t
262	262	80	85	85	90	95	100	110	0	120	130	150	170	\N	240	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	50	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	73	0.03	0	0.01	4	0.02	4	0.02	Facture Récap - Tarif découverte 3 EDL à 85.00€ APPT et 130.00€ PAV	\N	2021-06-10 18:22:04.988554	t
257	257	0	0	140	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Particulier Tarif spécial TS140	\N	2021-06-10 18:21:59.598454	t
255	255	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:21:57.841455	t
270	270	120	120	140	160	175	190	210	0	130	150	200	240	\N	270	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	0	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:22:14.054661	t
261	261	0	0	0	0	0	0	0	0	0	0	240	240	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	7	0.01	0	0.04	3	0.01	0	0.01	7	0.03	7	0.01	12	0.02	12	0.02	nan	\N	2021-06-10 18:22:04.050089	t
260	260	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:22:02.730663	t
256	256	0	0	0	0	0	0	0	0	0	0	240	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	Particulier Tarif spécial 240.00€ ht	\N	2021-06-10 18:21:58.747938	t
266	266	85	85	85	85	85	85	85	0	150	150	150	150	\N	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	6	0.04	3	0.01	0	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:22:09.988988	t
265	265	112	120	140	160	175	190	210	0	130	150	200	240	\N	270	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	8	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:22:08.820651	t
259	259	0	125	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	7	0.01	36	0.04	0	nan	0	0.01	36	0.03	67	0.01	0	0.02	0	0.02	Tarif en TS125	\N	2021-06-10 18:22:01.915132	t
267	267	90	90	90	90	90	150	150	0	130	130	130	170	\N	190	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	65	0.16	0	0.01	7	0.04	0	nan	0	0.01	5	0.03	0	0.01	0	0.02	0	0.02	Factures Récap	\N	2021-06-10 18:22:11.016396	t
269	269	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	Prix 320.00	\N	2021-06-10 18:22:12.960286	t
268	268	80	80	85	90	100	100	100	0	98	118	150	180	\N	190	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Factures récap	\N	2021-06-10 18:22:12.018825	t
271	271	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.16	0	0.01	6	0.04	0	nan	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:22:15.00212	t
279	279	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	Tarifs spéciaux uniquement F2=TS336	\N	2021-06-10 18:22:24.696453	t
272	272	80	80	85	90	100	100	100	0	98	118	150	180	\N	190	260	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	0	0.03	4	0.01	4	0.02	4	0.02	Facture récap	\N	2021-06-10 18:22:15.911601	t
277	277	0	125	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	36	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	Tarif spécial TS125	\N	2021-06-10 18:22:21.606216	t
282	282	83	83	87	95	110	120	130	130	130	150	200	240	\N	270	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	36	0.15	7	0.01	73	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	XD LE 01/11/2017 passage en facture recapt et mise à jour des tarifs suivant formulaire CM / PAKC 400  constats=44800/an, par mois=(3733.33/12)/4=933.33 par agences sur les 4 entités Période= 06/2016 à 05/2018	\N	2021-06-10 18:22:28.121493	t
273	273	105	114	133	152	171	190	238	124	143	190	238	285	\N	380	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:22:16.880049	t
280	280	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	Tarif spécial 600.00€	\N	2021-06-10 18:22:26.124633	t
276	276	80	80	85	90	100	100	100	0	98	118	150	180	\N	190	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Tarif L'adresse - Facture récap	\N	2021-06-10 18:22:20.251991	t
274	274	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:22:17.748551	t
286	286	85	85	90	95	110	120	130	100	120	130	150	180	\N	200	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	0	0.01	0	0.04	3	0.01	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:22:32.301106	t
281	281	83	83	87	95	110	120	130	130	130	150	200	240	\N	270	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	36	0.15	7	0.01	73	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	XD LE 01/11/2017 passage en facture recapt et mise à jour des tarifs suivant formulaire CM / PAKC 400  constats=44800/an, par mois=(3733.33/12)/4=933.33 par agences sur les 4 entités Période= 06/2016 à 05/2017	\N	2021-06-10 18:22:27.145051	t
283	283	83	83	87	95	110	120	130	130	130	150	200	240	\N	270	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	36	0.15	7	0.01	73	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	XD LE 01/11/2017 passage en facture recapt et mise à jour des tarifs suivant formulaire CM / PAKC 400  constats=44800/an, par mois=(3733.33/12)/4=933.33 par agences sur les 4 entités Période= 06/2016 à 05/2019	\N	2021-06-10 18:22:29.070952	t
278	278	180	180	230	240	260	285	315	0	130	150	200	240	\N	270	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	38	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:22:22.809528	t
275	275	85	90	90	95	100	130	150	120	120	150	150	170	\N	180	280	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	67	0.01	12	0.02	12	0.02	nan	\N	2021-06-10 18:22:18.860916	t
284	284	110	120	140	160	175	190	210	130	130	150	200	240	\N	270	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	Offre découverte 3 missions APPT=110.00 & VIL=130.00	\N	2021-06-10 18:22:30.426181	t
285	285	90	90	90	90	90	90	90	150	150	150	150	150	\N	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	7	0.01	6	0.04	3	nan	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:22:31.395624	t
287	287	80	80	85	90	100	100	100	0	98	118	150	180	\N	190	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	73	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	Tarif L'adresse - Facture récap	\N	2021-06-10 18:22:33.22258	t
288	288	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	6	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:22:34.202021	t
308	308	80	85	90	95	110	120	130	100	115	150	150	170	\N	190	290	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	6	0.04	3	0.01	5	0.01	5	0.03	4	0.01	12	0.02	12	0.02	nan	\N	2021-06-10 18:22:59.424007	t
295	295	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.25	7	0.0	0	0	3	0.0	0	0	0	0.0	67	0.01	0	0.02	0	0.02	Tarif Local+bureaux = 280.00€	\N	2021-06-10 18:22:40.710916	t
289	289	85	85	85	90	100	110	120	108	108	123	150	170	\N	200	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	6	0.15	6	0.01	67	0.04	0	0.01	5	0.01	67	0.03	6	0.01	12	0.02	12	0.02	nan	\N	2021-06-10 18:22:35.130491	t
304	304	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	#INVALID OPERATION	0	nan	0	MANDIN	0	nan	0	nan	0	nan	67	nan	0	0.02	0	0.02	nan	\N	2021-06-10 18:22:55.422292	t
473	473	0	0	0	90	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	7	0.01	6	0.04	3	0.01	5	0.01	0	0.03	4	0.01	12	0.02	12	0.02	nan	\N	2021-06-10 18:26:21.917304	t
290	290	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:22:36.096938	t
475	475	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	nan	\N	2021-06-10 18:26:24.431867	t
296	296	104	112	118	125	131	144	158	135	135	159	184	220	\N	257	342	30	30	30	30	40	40	\N	40	40	45	50	55	60	70	80	\N	0.5	8	0.15	7	0.01	38	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:22:42.03816	t
294	294	0	0	210	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:22:39.79083	t
479	479	0	0	0	0	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	5	0.04	3	0.01	5	0.01	0	0.03	4	0.01	12	0.02	12	0.02	nan	\N	2021-06-10 18:26:29.921731	t
477	477	0	0	0	0	0	0	0	0	0	0	0	240	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	7	0.01	5	0.04	3	0.01	5	0.01	0	0.03	4	0.01	13	0.02	13	0.02	nan	\N	2021-06-10 18:26:27.491124	t
306	306	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.25	0	0.0	0	0	0	0.0	0	0	0	0.0	67	0.01	0	0.02	0	0.02	Local bureau 55 m² au tarif de 160.00€	\N	2021-06-10 18:22:57.378176	t
305	305	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	53	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:22:56.428717	t
474	474	0	0	0	0	0	375	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	0	0.03	4	0.01	4	0.02	12	0.02	nan	\N	2021-06-10 18:26:23.419449	t
476	476	0	0	0	0	0	0	0	0	0	0	0	0	\N	250	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	7	0.01	7	0.04	3	0.01	5	0.01	0	0.03	4	0.01	4	0.02	12	0.02	nan	\N	2021-06-10 18:26:25.420305	t
478	478	0	0	200	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	0	0.03	4	0.01	13	0.02	13	0.02	nan	\N	2021-06-10 18:26:28.529534	t
297	297	0	0	0	0	0	0	0	0	0	140	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.25	0	0.0	0	0	3	0.0	0	0	0	0.0	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:22:43.108547	t
311	311	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:23:03.607616	t
291	291	100	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	36	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:22:37.060386	t
309	309	110	120	140	160	175	190	210	130	130	150	200	240	\N	270	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	#INVALID OPERATION	0	nan	0	DROUET	0	nan	0	nan	0	nan	0	nan	0	0.02	0	0.02	nan	\N	2021-06-10 18:23:01.227977	t
307	307	85	85	90	95	110	120	150	110	110	130	150	170	\N	170	280	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	30	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:22:58.324637	t
301	301	90	95	95	100	100	130	150	110	130	150	170	190	\N	200	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	53	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:22:48.783817	t
292	292	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	7	0.01	0	0.04	3	0.01	5	0.01	5	0.03	67	0.01	12	0.02	12	0.02	nan	\N	2021-06-10 18:22:37.954875	t
298	298	114	114	134	154	169	184	204	124	124	144	194	234	\N	264	324	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.25	0	0.0	0	0	0	0.0	5	0	5	0.0	67	0.01	12	0.02	12	0.02	130 LOCAUX COMMERCIAUX	\N	2021-06-10 18:22:44.484758	t
300	300	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	53	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:22:46.695011	t
293	293	85	85	85	95	100	110	120	110	110	133	170	200	\N	230	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	53	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:22:38.921324	t
302	302	85	85	90	95	110	120	130	110	110	130	150	180	\N	200	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	53	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:22:51.707331	t
312	312	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	7	0.01	0	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	Facture sur tarif en TSxxx, le 1er à 270.00€	\N	2021-06-10 18:23:04.496111	t
299	299	103	103	123	143	158	173	193	111	111	131	181	221	\N	251	311	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.25	0	0.0	0	0	0	0.0	5	0	5	0.0	67	0.01	12	0.02	12	0.02	nan	\N	2021-06-10 18:22:45.488186	t
303	303	90	90	90	90	90	90	90	150	150	150	150	150	\N	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	#INVALID OPERATION	0	nan	0	FRANCE	0	nan	0	nan	0	nan	67	nan	0	0.02	0	0.02	nan	\N	2021-06-10 18:22:54.293936	t
314	314	0	0	0	0	0	0	0	0	0	160	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	7	0.01	0	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:23:06.506962	t
310	310	85	85	90	95	110	130	150	150	170	180	200	220	\N	250	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	6	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:23:02.379319	t
313	313	0	0	0	0	0	0	0	0	0	0	130	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:23:05.621467	t
315	315	80	80	90	95	110	120	130	110	124	130	150	180	\N	220	290	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:23:07.731263	t
316	316	80	80	90	95	110	120	130	110	110	130	150	180	\N	190	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	53	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:23:08.677723	t
346	346	85	85	95	100	110	130	150	107	107	130	150	180	\N	200	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:23:43.874297	t
343	343	85	85	90	100	110	120	130	100	100	119	150	180	\N	200	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	7	0.01	67	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	67	0.02	nan	\N	2021-06-10 18:23:40.716098	t
326	326	105	114	133	152	171	190	238	124	124	143	190	238	\N	285	449	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:23:18.712146	t
317	317	85	85	90	95	110	120	130	100	100	110	150	180	\N	220	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	53	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:23:09.613189	t
341	341	90	90	110	130	150	170	190	120	120	139	185	215	\N	240	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	73	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:23:37.566899	t
319	319	80	80	85	90	100	100	100	98	98	118	150	180	\N	190	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:23:11.590103	t
336	336	80	80	85	90	100	100	100	98	98	118	150	180	\N	190	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.25	0	0.0	0	0	0	0.0	0	0	0	0.0	4	0.01	12	0.02	12	0.02	nan	\N	2021-06-10 18:23:29.890283	t
335	335	0	0	0	0	0	0	0	0	0	0	240	250	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	0	0.01	0	0.04	3	0.01	0	0.01	7	0.03	7	0.01	12	0.02	12	0.02	nan	\N	2021-06-10 18:23:28.792908	t
334	334	0	0	0	180	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	0	0.01	0	0.04	3	0.01	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:23:27.873435	t
318	318	85	85	85	85	85	85	85	150	150	150	150	150	\N	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	7	0.01	7	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:23:10.744591	t
325	325	0	0	0	160	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:23:17.806669	t
342	342	85	85	90	95	110	120	150	110	110	120	150	180	\N	200	280	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:23:39.665697	t
333	333	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	0	0.01	0	0.04	3	0.01	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:23:26.955961	t
340	340	0	0	0	0	0	0	0	0	0	0	0	180	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:23:36.3416	t
344	344	90	90	95	100	115	130	150	130	130	140	150	180	\N	230	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	6	0.04	3	0.01	5	0.01	5	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:23:41.699536	t
347	347	95	100	120	130	150	170	200	120	120	140	160	180	\N	200	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	6	0.15	7	0.01	7	0.04	3	0.01	5	0.01	0	0.03	67	0.01	12	0.02	12	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-10 18:23:44.851739	t
345	345	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:23:42.871866	t
351	351	95	95	120	140	160	180	200	130	130	150	190	215	\N	240	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	36	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:23:49.44811	t
353	353	90	90	95	95	110	130	150	100	110	150	150	170	\N	190	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	53	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:23:51.668841	t
349	349	85	85	90	100	110	120	130	120	120	130	150	180	\N	230	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	Tarif découverte 1APPT=85 ou 1 PAV=140	\N	2021-06-10 18:23:47.422266	t
330	330	102	111	129	148	166	185	231	120	139	185	231	277	\N	370	500	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Locaux commerciaux sur devis	\N	2021-06-10 18:23:23.924694	t
327	327	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	nan	\N	2021-06-10 18:23:19.566663	t
323	323	80	80	85	90	100	100	100	98	98	118	150	180	\N	190	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:23:15.59093	t
320	320	80	80	85	90	100	100	100	98	98	118	150	180	\N	190	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:23:12.510578	t
338	338	0	0	160	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:23:32.43783	t
332	332	80	85	85	95	110	120	130	100	120	130	150	180	\N	190	280	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	6	0.15	6	0.01	6	0.04	3	0.01	5	0.01	5	0.03	67	0.01	12	0.02	12	0.02	nan	\N	2021-06-10 18:23:25.982513	t
321	321	85	85	90	95	110	120	130	110	120	130	150	180	\N	220	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:23:13.448043	t
337	337	90	90	95	100	130	150	180	110	110	120	150	200	\N	230	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	6	0.01	6	0.04	3	0.01	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:23:31.303478	t
328	328	80	85	85	90	95	100	110	0	120	130	150	170	\N	240	300	25	25	25	25	30	30	\N	25	25	25	30	30	30	40	40	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	11	0.03	4	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-10 18:23:20.408178	t
324	324	80	80	85	90	100	100	100	0	98	118	150	180	\N	190	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	73	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:23:16.798243	t
322	322	80	80	85	90	100	100	100	98	98	118	150	180	\N	190	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:23:14.696441	t
329	329	90	90	95	110	140	170	200	125	125	140	160	180	\N	200	310	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	0	0.01	36	0.03	67	0.01	0	0.02	0	0.02	Locaux commerciaux sur devis	\N	2021-06-10 18:23:21.898327	t
331	331	92	100	120	140	155	170	190	155	155	170	190	217	\N	247	307	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	7	0.01	7	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	Locaux commerciaux sur devis	\N	2021-06-10 18:23:24.958099	t
348	348	83	83	87	95	110	120	130	130	130	150	200	240	\N	270	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:23:46.147994	t
350	350	85	85	90	95	120	140	160	100	140	150	180	230	\N	280	400	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	53	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:23:48.339746	t
339	339	112	120	140	160	175	190	210	175	175	190	210	240	\N	270	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	36	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:23:34.575608	t
352	352	95	95	110	130	140	150	160	120	130	140	150	170	\N	190	240	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.14	5	0.01	5	0.04	3	0.01	5	0.01	5	0.04	4	0.01	13	0.02	13	0.02	nan	\N	2021-06-10 18:23:50.739373	t
368	368	90	90	95	100	115	130	150	130	130	140	150	180	\N	230	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	6	0.04	3	0.01	5	0.01	5	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:24:08.735094	t
354	354	0	0	140	160	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	5	0.04	3	0.01	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:23:52.566328	t
370	370	110	120	140	160	180	200	250	130	130	150	200	250	\N	300	500	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	0	0.01	30	0.04	3	0.01	5	0.01	0	0.03	0	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:24:11.15371	t
364	364	85	90	90	100	110	120	130	115	115	130	150	170	\N	200	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	0	0.01	0	0.04	0	0.01	0	0.01	9	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:24:04.058763	t
357	357	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	53	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:23:55.583606	t
355	355	0	0	170	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	7	0.01	36	0.04	3	0.01	5	0.01	5	0.03	67	0.01	12	0.02	12	0.02	nan	\N	2021-06-10 18:23:53.420842	t
365	365	83	83	87	95	110	120	130	130	130	150	200	240	\N	270	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	36	0.16	7	0.01	73	0.04	3	0.0	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	Locaux commerciaux sur devis	\N	2021-06-10 18:24:05.225101	t
361	361	83	83	87	95	110	120	130	130	130	150	200	240	\N	270	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	73	0.04	3	0.01	5	0.01	73	0.03	0	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:24:00.580751	t
358	358	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	7	0.01	0	0.04	3	0.01	0	0.01	0	0.03	67	0.01	12	0.02	12	0.02	nan	\N	2021-06-10 18:23:56.652994	t
356	356	90	95	100	110	140	150	180	110	110	130	140	180	\N	220	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	7	0.01	9	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:23:54.507225	t
360	360	95	95	120	140	160	180	200	130	130	150	190	215	\N	240	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:23:59.058619	t
362	362	90	90	101	122	137	144	165	151	151	165	180	201	\N	216	252	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	36	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:24:01.562189	t
366	366	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	1	0	0.0	0	0	0	0.0	0	0	0	0.0	0	0.0	0	0.0	0	0.0	nan	\N	2021-06-10 18:24:06.409425	t
363	363	0	0	0	160	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:24:02.888432	t
367	367	0	126	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:24:07.560767	t
359	359	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	1	0	0.0	0	0	0	0.0	0	0	0	0.0	0	0.0	0	0.0	0	0.0	nan	\N	2021-06-10 18:23:57.865304	t
369	369	80	80	85	90	100	100	100	98	98	118	150	180	\N	190	260	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.16	7	0.01	73	0.04	3	0.0	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-10 18:24:09.856453	t
371	371	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:24:12.152144	t
378	378	85	85	90	95	100	110	120	100	100	130	150	180	\N	190	230	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	LOCAL COMMERCIAL SUR DEVIS	\N	2021-06-10 18:24:20.277499	t
372	372	0	0	120	150	160	0	0	0	120	130	160	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	7	0.01	73	0.04	3	0.01	5	0.01	5	0.03	67	0.01	12	0.02	12	0.02	50% MAJORATION MEUBLE ,LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-10 18:24:13.190547	t
383	383	85	85	85	85	85	85	85	150	150	150	150	150	\N	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	67	0.04	3	0.01	5	0.01	5	0.03	67	0.01	12	0.02	12	0.02	XXX	\N	2021-06-10 18:24:27.321476	t
373	373	85	85	90	110	130	150	200	110	120	130	160	180	\N	230	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.35	5	0.15	7	0.01	0	0.04	3	0.01	5	0.01	5	0.03	67	0.01	12	0.02	12	0.02	LOCAUX COMMERCIAUX SUR DEVIS, MAJORATION MEUBLES +35%	\N	2021-06-10 18:24:14.481811	t
392	392	80	85	90	95	110	120	130	100	115	150	150	170	\N	190	290	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	6	0.04	3	0.01	5	0.01	6	0.03	6	0.01	4	0.02	4	0.02	facturation sur abonnement en récap pour prix unique sur intervention de 85 € ht	\N	2021-06-10 18:24:38.751642	t
375	375	85	85	90	95	100	120	150	100	100	110	150	180	\N	200	280	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	38	0.15	7	0.01	6	0.04	3	0.01	5	0.01	0	0.03	67	0.01	38	0.02	0	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-10 18:24:16.88144	t
376	376	85	90	95	100	120	130	150	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	30	30	30	40	40	50	0	0	\N	0.5	8	#INVALID OPERATION	7	0.01	73	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	PAS DE PAVILLON EN GESTION	\N	2021-06-10 18:24:18.041776	t
389	389	95	100	105	110	120	131	143	120	145	145	165	200	\N	236	315	30	30	30	30	40	40	\N	40	40	45	50	55	60	70	80	\N	nan	5	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	67	0.01	12	0.02	12	0.02	+35% MAJORATION MEUBLE, LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-10 18:24:34.95281	t
385	385	0	0	135	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	73	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	Meublé	\N	2021-06-10 18:24:30.322456	t
374	374	90	95	100	105	110	130	150	110	110	130	150	180	\N	210	280	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	65	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	MAJORATION MEUBLE +50% , LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-10 18:24:15.834041	t
381	381	0	80	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	6	0.01	67	0.04	3	0.01	5	0.01	5	0.03	67	0.01	67	0.02	0	0.02	2 APPT / POUR 2 et 3 chambres	\N	2021-06-10 18:24:24.589036	t
377	377	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	nan	\N	2021-06-10 18:24:19.145146	t
384	384	95	100	105	114	120	131	143	136	136	160	185	221	\N	258	344	30	30	30	30	40	40	\N	40	40	45	50	55	60	70	80	\N	0.45	7	0.15	7	0.01	0	0.04	3	0.01	5	0.01	5	0.03	67	0.01	67	0.02	0	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-10 18:24:28.841612	t
382	382	0	80	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	6	0.01	67	0.04	3	0.01	5	0.01	5	0.03	67	0.01	67	0.02	0	0.02	2 APPT / POUR 2 et 3 chambres	\N	2021-06-10 18:24:25.797347	t
386	386	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.25	7	nan	0	nan	0	nan	5	nan	0	nan	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:24:31.551756	t
391	391	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	-0.84	7	0.01	53	0.04	3	0.01	5	0.01	0	0.03	67	1.0	0	0.02	0	0.02	nan	\N	2021-06-10 18:24:37.250498	t
390	390	95	100	110	130	135	150	160	135	135	150	165	180	\N	250	350	30	30	30	30	40	40	\N	40	40	45	50	55	60	70	80	\N	0.5	5	0.15	7	0.01	9	0.04	3	0.01	5	0.01	5	0.03	67	0.01	12	0.02	12	0.02	LOCAUX COMMERCIAUX DUR DEVIS	\N	2021-06-10 18:24:36.054185	t
393	393	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	53	0.04	3	0.01	5	0.01	53	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:24:41.917835	t
395	395	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.3	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	nan	\N	2021-06-10 18:24:45.70467	t
404	404	90	90	95	100	110	130	150	130	130	150	170	200	\N	245	300	25	25	25	35	35	35	\N	35	35	45	45	65	45	65	65	\N	0.45	38	0.15	7	0.01	73	0.04	0	0.01	5	0.01	38	0.03	67	0.01	38	0.02	0	0.02	EDL POUR BOX 25 €	\N	2021-06-10 18:24:57.360011	t
394	394	85	85	90	95	100	110	120	120	120	140	150	180	\N	200	280	30	30	30	30	40	40	\N	40	40	45	50	55	60	70	80	\N	0.5	38	0.15	7	0.01	6	0.04	3	0.01	5	0.01	38	0.03	67	0.01	38	0.02	0	0.02	nan	\N	2021-06-10 18:24:44.437393	t
380	380	85	85	85	90	95	100	110	120	120	130	150	170	\N	240	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	MAJORATION MEUBLE + 35%, LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-10 18:24:22.654145	t
379	379	85	85	95	100	120	130	150	100	100	140	160	190	\N	200	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	LOCAL COMMERCIAL SUR DEVIS	\N	2021-06-10 18:24:21.498802	t
387	387	0	0	0	150	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.25	7	nan	0	nan	0	nan	5	nan	0	nan	0	0.01	12	0.02	12	0.02	nan	\N	2021-06-10 18:24:32.621143	t
406	406	85	85	90	95	100	110	115	100	120	120	155	180	\N	195	240	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	0	0.03	0	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:25:02.372148	t
405	405	109	112	115	122	129	136	149	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	50%%	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:24:58.990085	t
388	388	0	0	0	0	0	0	0	0	0	0	330	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.25	7	nan	7	nan	0	nan	5	nan	5	nan	0	0.01	0	0.02	0	0.02	XXX	\N	2021-06-10 18:24:33.775484	t
407	407	80	83	85	90	95	100	110	100	100	120	150	170	\N	200	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.33	8	0.15	7	0.01	4	0.04	3	0.01	5	0.01	4	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:25:03.841309	t
397	397	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.16	7	0.01	7	0.04	3	0.0	5	0.01	7	0.03	7	0.01	7	0.02	7	0.02	Parking 150€ . Local bâtiment commerciale  480€ .	\N	2021-06-10 18:24:48.06632	t
401	401	90	90	95	100	120	130	150	135	135	150	165	180	\N	200	280	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:24:53.781056	t
415	415	90	90	95	110	130	150	170	0	110	110	130	150	\N	170	190	20	20	20	20	20	20	\N	20	20	20	20	20	20	20	20	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:25:12.722726	t
409	409	82	84	86	92	97	102	112	102	102	123	153	174	\N	204	255	20	20	25	25	30	30	\N	40	30	30	40	40	50	50	50	\N	nan	8	0.15	7	0.01	67	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:25:06.172977	t
398	398	80	80	85	90	100	100	100	0	98	118	150	180	\N	190	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	67	0.04	3	0.01	5	0.01	5	0.03	67	0.01	12	0.02	12	0.02	nan	\N	2021-06-10 18:24:49.22166	t
400	400	0	175	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	tarif pour 1 F1 Meublé 175€	\N	2021-06-10 18:24:52.688682	t
396	396	90	90	95	100	120	130	150	107	107	125	150	180	\N	200	280	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	6	0.03	4	0.01	4	0.02	4	0.02	Locaux commerciaux sur devis / Meublés majorés de 50%	\N	2021-06-10 18:24:46.888993	t
403	403	80	80	85	90	95	100	110	0	120	130	150	170	\N	240	300	30	30	30	30	40	40	\N	40	40	45	50	55	60	70	80	\N	0.5	8	0.15	0	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-10 18:24:56.065752	t
410	410	95	95	105	110	120	135	145	120	120	140	150	180	\N	230	315	20	20	25	25	30	30	\N	30	30	30	40	40	50	50	50	\N	0.45	65	0.15	7	0.01	0	0.04	3	0.01	0	0.01	5	0.03	67	0.01	65	0.02	0	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-10 18:25:07.128431	t
414	414	85	85	90	105	115	130	145	135	135	150	165	180	\N	200	280	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	73	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:25:11.678321	t
399	399	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	53	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:24:50.306041	t
408	408	80	80	85	90	100	100	100	98	98	118	150	180	\N	190	260	30	30	30	30	40	40	\N	40	40	45	50	55	60	70	80	\N	0.5	65	0.15	7	0.01	9	0.04	3	0.01	5	0.01	5	0.03	67	0.01	65	0.02	0	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-10 18:25:05.237513	t
402	402	80	80	85	90	100	100	100	98	98	118	150	180	\N	190	260	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	73	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:24:54.905417	t
413	413	85	85	90	110	130	150	200	110	120	130	160	180	\N	230	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.35	6	nan	7	0.01	73	0.04	0	0.01	5	0.01	5	0.03	67	0.01	12	0.02	12	0.02	nan	\N	2021-06-10 18:25:10.074749	t
411	411	90	90	95	100	120	135	145	120	120	140	160	180	\N	230	315	20	20	25	25	30	30	\N	30	30	30	40	40	50	50	50	\N	0.45	65	0.15	7	0.01	0	0.04	3	0.01	0	0.01	5	0.03	67	0.01	65	0.02	0	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-10 18:25:08.157844	t
412	412	90	100	110	120	135	150	130	130	150	165	200	240	\N	290	20	20	25	25	30	30	30	\N	30	30	40	40	50	50	50	0	\N	0.45	8	0.15	7	0.01	73	0.04	3	0.01	5	0.01	0	0.03	0	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:25:09.032344	t
416	416	80	80	85	90	100	100	100	98	98	118	150	180	\N	190	260	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	38	nan	7	0.01	73	0.04	3	0.01	0	0.01	73	0.03	67	0.01	38	0.02	0	0.02	nan	\N	2021-06-10 18:25:13.725151	t
417	417	80	80	85	90	100	100	100	98	98	118	150	180	\N	190	260	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	nan	7	0.01	73	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:25:14.596653	t
452	452	80	80	85	90	100	100	100	98	98	118	150	180	\N	190	250	25	25	25	25	30	30	\N	30	30	30	30	30	30	40	40	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	4	0.01	4	0.02	12	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-10 18:25:56.730185	t
418	418	85	85	85	90	100	110	120	120	120	130	160	180	\N	190	280	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	0	nan	7	0.01	73	0.04	0	0.01	5	0.01	5	0.03	67	0.01	67	0.02	0	0.02	nan	\N	2021-06-10 18:25:15.648053	t
454	454	85	85	90	95	110	120	135	120	120	130	150	180	\N	230	315	25	25	25	25	30	30	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	14	0.04	3	0.01	5	0.01	14	0.03	4	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-10 18:25:59.728471	t
440	440	80	80	85	90	100	110	120	120	120	130	150	170	\N	180	200	15	15	15	20	20	25	\N	30	30	40	40	5	50	50	50	\N	0.5	6	0.15	7	0.01	7	0.04	3	0.01	5	0.01	11	0.03	6	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:25:39.560397	t
438	438	0	0	0	240	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	7	0.01	12	0.02	12	0.02	nan	\N	2021-06-10 18:25:37.579525	t
442	442	110	120	140	160	180	200	250	150	150	180	250	280	\N	350	480	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	4	0.04	3	0.01	5	0.01	4	0.03	6	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-10 18:25:41.959024	t
453	453	80	80	85	90	110	120	130	120	120	130	150	180	\N	190	250	15	15	20	20	25	25	\N	25	25	25	35	35	35	45	45	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	6	0.03	4	0.01	12	0.02	12	0.02	client en lissage de facturation au prix moyen de _80 € APPT et 110 € PAV\nle client à prix et validé l'option de comparatif edle/edls	\N	2021-06-10 18:25:58.645093	t
441	441	80	80	85	90	100	110	120	120	120	130	150	170	\N	180	200	20	20	25	25	30	30	\N	30	30	40	40	40	50	50	50	\N	0.5	6	0.15	6	0.01	73	0.04	3	0.01	5	0.01	73	0.03	6	0.01	12	0.02	12	0.02	nan	\N	2021-06-10 18:25:40.686754	t
439	439	80	80	85	90	100	110	120	120	120	130	150	170	\N	180	200	15	15	15	20	20	25	\N	30	30	40	40	5	50	50	50	\N	nan	6	0.15	7	0.01	7	0.04	3	0.01	5	0.01	11	0.03	6	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:25:38.535979	t
451	451	0	0	0	0	0	0	0	0	0	100	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	7	0.01	73	0.04	3	0.01	5	0.01	73	0.03	4	0.01	12	0.02	12	0.02	nan	\N	2021-06-10 18:25:55.77173	t
443	443	80	80	85	90	100	100	100	0	98	118	150	180	\N	190	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	6	0.15	6	0.01	9	0.04	3	0.01	5	0.01	9	0.03	4	0.01	12	0.02	12	0.02	nan	\N	2021-06-10 18:25:43.00043	t
429	429	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	nan	\N	2021-06-10 18:25:26.995575	t
419	419	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	nan	7	0.01	53	0.04	0	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:25:16.64848	t
435	435	0	0	0	0	0	0	0	0	0	0	240	240	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	7	0.01	12	0.02	12	0.02	nan	\N	2021-06-10 18:25:34.542261	t
431	431	85	85	90	95	100	120	130	120	120	140	150	170	\N	200	250	20	20	25	25	30	30	\N	30	30	30	40	40	50	50	50	\N	0.4	7	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	7	0.01	12	0.02	12	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-10 18:25:29.949888	t
423	423	0	0	140	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	nan	7	0.01	36	0.04	3	0.01	0	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:25:20.952024	t
420	420	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	nan	7	0.01	53	0.04	0	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:25:17.657904	t
430	430	80	80	85	90	95	100	110	120	120	130	150	170	\N	240	300	20	20	25	25	30	30	\N	30	30	30	40	40	50	50	50	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-10 18:25:28.498711	t
421	421	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	nan	7	0.01	53	0.04	0	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:25:18.75328	t
433	433	90	95	100	110	120	135	145	120	120	140	160	180	\N	230	315	20	20	25	25	30	30	\N	30	30	30	40	40	50	50	50	\N	0.41	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	4	0.03	4	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-10 18:25:32.05568	t
427	427	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	nan	\N	2021-06-10 18:25:24.954739	t
425	425	85	85	90	110	130	150	200	120	120	130	160	180	\N	230	350	20	20	25	25	30	30	\N	40	30	30	40	40	50	50	50	\N	0.35	6	0.15	7	0.01	0	0.04	3	0.01	5	0.01	5	0.03	0	0.01	12	0.02	12	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-10 18:25:22.841943	t
426	426	85	85	90	95	110	120	150	110	110	130	150	170	\N	170	280	20	20	25	25	30	30	\N	30	30	30	40	40	50	50	50	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-10 18:25:23.908336	t
422	422	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	nan	7	0.01	53	0.04	0	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-10 18:25:19.903622	t
424	424	104	112	118	125	131	144	158	135	135	159	184	220	\N	257	342	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	38	0.04	3	0.01	5	0.01	5	0.03	0	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:25:21.945459	t
428	428	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	nan	\N	2021-06-10 18:25:25.982149	t
432	432	85	85	85	90	100	110	120	120	120	130	160	180	\N	190	280	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	6	0.15	7	0.01	0	0.04	3	0.01	5	0.01	5	0.03	0	0.01	12	0.02	12	0.02	nan	\N	2021-06-10 18:25:31.055254	t
434	434	0	0	0	0	0	0	0	0	0	0	0	0	\N	290	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	7	0.01	12	0.02	12	0.02	nan	\N	2021-06-10 18:25:33.338949	t
436	436	90	90	100	100	100	120	130	120	120	140	160	180	\N	230	315	20	20	25	25	30	30	\N	30	30	40	40	40	50	50	50	\N	0.45	7	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	7	0.01	12	0.02	0	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-10 18:25:35.65363	t
437	437	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	4	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:25:36.560108	t
447	447	80	80	85	90	100	100	100	0	98	118	150	180	\N	190	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	4	0.03	6	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:25:48.560851	t
444	444	85	85	90	95	110	120	130	120	120	140	150	180	\N	230	290	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.41	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	4	0.03	6	0.01	4	0.02	12	0.02	nan	\N	2021-06-10 18:25:44.236725	t
445	445	110	120	140	160	180	200	250	150	150	180	250	280	\N	350	480	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	4	0.04	3	0.01	5	0.01	4	0.03	6	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:25:45.182182	t
448	448	85	85	90	95	110	120	130	100	100	130	150	170	\N	180	250	25	25	25	25	30	30	\N	20	20	20	25	25	25	35	35	\N	0.5	6	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	4	0.01	12	0.02	12	0.02	nan	\N	2021-06-10 18:25:50.310855	t
450	450	80	80	85	90	90	100	100	98	100	120	150	180	\N	190	250	20	20	20	20	20	25	\N	20	20	20	20	25	25	35	35	\N	0.45	8	0.15	7	0.01	73	0.04	3	0.01	5	0.01	3	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-10 18:25:54.79229	t
446	446	80	80	90	95	110	120	130	100	100	130	150	170	\N	180	250	25	25	25	25	30	30	\N	20	20	20	25	25	25	35	35	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	85	0.03	6	0.01	12	0.02	12	0.02	nan	\N	2021-06-10 18:25:46.28615	t
449	449	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	nan	\N	2021-06-10 18:25:53.659937	t
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
1	\N	PROSPECT	AGENCE SOTTET IMMOBILIER	\N	Monsieur	.	\N	\N	nan	2021-06-10 18:17:57.016391	t
2	\N	PROSPECT	ALIZE IMMOBILIER	\N	Monsieur	meglio franck	\N	\N	nan	2021-06-10 18:17:57.885898	t
3	\N	PROSPECT	ORPI LA BRIARDE	\N	Madame	challet monique	\N	\N	nan	2021-06-10 18:17:57.91188	t
4	\N	PROSPECT	BIEN SUR IMMOBILIER	\N	Monsieur	luu hubert	\N	\N	nan	2021-06-10 18:17:57.928875	t
5	\N	PROSPECT	S.G.I.T	\N	Monsieur	gozlan	\N	\N	nan	2021-06-10 18:17:57.945862	t
6	\N	PROSPECT	S.G.I.T	\N	Monsieur	gozlan	\N	\N	nan	2021-06-10 18:17:57.961851	t
7	\N	PROSPECT	AGENTYS	\N	Madame	msika danielle	\N	\N	nan	2021-06-10 18:17:57.977846	t
8	\N	PROSPECT	HARTZ IMMO	\N	Madame	hartz magarett	\N	\N	nan	2021-06-10 18:17:57.993833	t
9	\N	PROSPECT	DE VALLIERE	\N	Monsieur	agence de valliere	\N	\N	nan	2021-06-10 18:17:58.98327	t
10	\N	PROSPECT	REBY Michel	\N	Monsieur	office locations transactions	\N	\N	nan	2021-06-10 18:17:59.007258	t
11	\N	PROSPECT	HULOT	\N	Monsieur	guy hoquet h2immo	\N	\N	nan	2021-06-10 18:17:59.048233	t
12	\N	PROSPECT	PARIS BRETAGNE	\N	Monsieur	chauvin philippe	\N	\N	nan	2021-06-10 18:18:00.492413	t
13	\N	PROSPECT	AVICA	\N	Monsieur	dries vincent	\N	\N	nan	2021-06-10 18:18:01.261973	t
14	\N	PROSPECT	ELBAZ-BOULAY Malika	\N	Madame	meb gestion	\N	\N	nan	2021-06-10 18:18:01.27797	t
15	\N	PROSPECT	CENTURY 21 ADM GRAND SUD	\N	Madame	cousinard julie	\N	\N	nan	2021-06-10 18:18:02.205434	t
16	\N	PROSPECT	REGARDS IMMOBILIER	\N	Monsieur	touati michael	\N	\N	nan	2021-06-10 18:18:02.222425	t
17	\N	PROSPECT	GERANCE PLUS IMMOBILIER	\N	Monsieur	gorre jean- christophe	\N	\N	nan	2021-06-10 18:18:02.239416	t
18	\N	PROSPECT	GUY HOQUET - REAL IMMOBILIER	\N	Madame	dumon alexandra	\N	\N	nan	2021-06-10 18:18:02.256405	t
19	\N	PROSPECT	CJ IMMOBILIER	\N	Monsieur	andre louis	\N	\N	nan	2021-06-10 18:18:02.2724	t
20	\N	PROSPECT	SOLES IMMO	\N	Monsieur	francoulon henri	\N	\N	nan	2021-06-10 18:18:02.289389	t
21	\N	PROSPECT	AGENCE PRINCIPALE	\N	Mademoiselle	denet	\N	\N	nan	2021-06-10 18:18:03.433734	t
22	\N	PROSPECT	Vieux Versailles Immobilier	\N	Madame	usson sandy	\N	\N	nan	2021-06-10 18:18:03.458722	t
23	\N	PROSPECT	LA BOURSE IMMOBILIERE DE L'ILE DE France	\N	Madame	weber marine	\N	\N	nan	2021-06-10 18:18:03.490701	t
24	\N	PROSPECT	PARC IMMO 78	\N	Monsieur	le provost nicolas	\N	\N	nan	2021-06-10 18:18:03.52668	t
25	\N	PROSPECT	ACCORD IMMO	\N	Monsieur	valette	\N	\N	nan	2021-06-10 18:18:03.595644	t
26	\N	PROSPECT	AEDES IMMOBILIER	\N	Madame	lannou françoise	\N	\N	nan	2021-06-10 18:18:03.616629	t
27	\N	PROSPECT	L'IMMOBILIERE DE BOULOGNE	\N	Monsieur	chaput romain	\N	\N	nan	2021-06-10 18:18:03.640616	t
28	\N	PROSPECT	AVIS IMMOBILIER	\N	Madame	anger claire	\N	\N	nan	2021-06-10 18:18:03.656609	t
29	\N	PROSPECT	AVANTAGES IMMOBILIER	\N	Mme & Mr.	boule & fournier sébastien	\N	\N	nan	2021-06-10 18:18:03.675594	t
30	\N	PROSPECT	GUY HOQUET - CABINET FREDELON	\N	Monsieur	bismuth lionel	\N	\N	nan	2021-06-10 18:18:03.693585	t
31	\N	PROSPECT	HAP Immobilier	\N	Monsieur	arnaud d'agier de rufosse	\N	\N	nan	2021-06-10 18:18:04.593071	t
32	\N	PROSPECT	AGENCE CENTRALE	\N	Monsieur	lemoine j	\N	\N	nan	2021-06-10 18:18:04.611062	t
33	\N	PROSPECT	LAFORET IMMOBILIER	\N	Monsieur	rolland arnaud	\N	\N	nan	2021-06-10 18:18:05.67945	t
62	\N	PROSPECT	ORPI Cabinet MERI	\N	Monsieur	rinaldi mario	\N	\N	nan	2021-06-10 18:18:22.34893	t
34	109218	PROSPECT	Etude Fauquereau - Simonet	etudefauquereau-simonet	Monsieur	simonet manuel	\N	\N	nan	2021-06-10 18:18:06.633906	t
35	\N	PROSPECT	CENTURY 21	\N	Monsieur	barnier	\N	\N	nan	2021-06-10 18:18:06.700869	t
36	\N	PROSPECT	EXECUTIVE RELOCATIONS	\N	Madame	inga le jean	\N	\N	nan	2021-06-10 18:18:07.699296	t
37	\N	PROSPECT	AGENCE SAINT NICOLAS	\N	Madame	augenie marie-france	\N	\N	nan	2021-06-10 18:18:07.732277	t
38	\N	PROSPECT	OLIVIER CLEMENT IMMOBILIER	\N	Madame	boutoille blois anny	\N	\N	nan	2021-06-10 18:18:07.757263	t
39	\N	PROSPECT	AGENCE DE L'ILE	\N	Madame	malessard	\N	\N	nan	2021-06-10 18:18:07.807235	t
40	\N	PROSPECT	VAL DE SEINE IMMOBILIER	\N	Madame	morise	\N	\N	nan	2021-06-10 18:18:07.824226	t
41	\N	PROSPECT	CABINET SGP	\N	Monsieur	seraidarian frédéric	\N	\N	nan	2021-06-10 18:18:08.772689	t
42	\N	PROSPECT	Agence des Arcades de Buc	\N	Monsieur	blanc stéphane	\N	\N	nan	2021-06-10 18:18:08.792672	t
43	\N	PROSPECT	IPS IMMOBILIERE PARIS SUD	\N	Madame	guyomard chantal	\N	\N	nan	2021-06-10 18:18:08.809664	t
44	\N	PROSPECT	GUY HOQUET SARL IMMOFAR	\N	Monsieur	van strate jean-claude	\N	\N	nan	2021-06-10 18:18:08.826654	t
45	\N	PROSPECT	LAFORET CC IMMO	\N	Madame	duval julie	\N	\N	nan	2021-06-10 18:18:08.842643	t
46	\N	PROSPECT	PRIMO	\N	Madame	pan	\N	\N	nan	2021-06-10 18:18:08.864631	t
47	\N	PROSPECT	ELYSE AVENUE	\N	Monsieur	gasnier marcel	\N	\N	nan	2021-06-10 18:18:08.88262	t
48	\N	PROSPECT	CABINET LATY	\N	Madame	guhur céline	\N	\N	nan	2021-06-10 18:18:09.822084	t
49	\N	PROSPECT	A.M.I.S	\N	Madame	brouat nathalie	\N	\N	nan	2021-06-10 18:18:09.838075	t
50	\N	PROSPECT	AGENCE DE LA ROSERAIE - ORPI	\N	Madame	barral fabienne	\N	\N	nan	2021-06-10 18:18:09.856067	t
51	\N	PROSPECT	LAFORET IMMOBILIER FRANCONVILLE	laforet	Monsieur	lucas olivier	\N	\N	nan	2021-06-10 18:18:14.55838	t
52	\N	PROSPECT	MONNE DECROIX	\N	Madame	samoros solange	\N	\N	nan	2021-06-10 18:18:15.539817	t
53	\N	PROSPECT	INTER CHANGE IMMOBILIER	\N	Monsieur	genest jean-michel	\N	\N	nan	2021-06-10 18:18:16.671173	t
54	\N	PROSPECT	FUTUR TRANSACTIONS	\N	Monsieur	truptil rémy	\N	\N	nan	2021-06-10 18:18:16.690166	t
55	\N	PROSPECT	LAFORET IMMOBILIER	\N	Monsieur	olie jérôme	\N	\N	nan	2021-06-10 18:18:18.384193	t
56	\N	PROSPECT	CAPPEVILLE IMMOBILIER	\N	Monsieur	ros johann	\N	\N	nan	2021-06-10 18:18:18.416176	t
57	\N	PROSPECT	STARS IMMOBILIER	\N	Monsieur	cedric	\N	\N	nan	2021-06-10 18:18:18.434164	t
58	\N	PROSPECT	HABITAT SEVICE	\N	Monsieur	cavalerie	\N	\N	nan	2021-06-10 18:18:18.450156	t
59	\N	PROSPECT	CLIC IMMOBILIER	\N	Mesdames	benitha et sambourg	\N	\N	nan	2021-06-10 18:18:18.471146	t
60	\N	PROSPECT	ORPI	\N	Madame	labadie maryse	\N	\N	nan	2021-06-10 18:18:19.666461	t
61	\N	PROSPECT	ERA TREFLE IMMOBILIER	\N	Madame	labarriere caroline	\N	\N	nan	2021-06-10 18:18:22.332937	t
63	\N	PROSPECT	PRIMO IMMOBILIER	\N	Monsieur	dodille	\N	\N	nan	2021-06-10 18:18:22.36692	t
64	\N	PROSPECT	GUY HOQUET	\N	Madame	fontaine céline	\N	\N	nan	2021-06-10 18:18:23.203442	t
65	\N	PROSPECT	ORPI	\N	Monsieur	malvaud	\N	\N	nan	2021-06-10 18:18:23.220431	t
66	\N	PROSPECT	BATIR TRANSACTIONS	\N	Monsieur	pruvot bernard	\N	\N	nan	2021-06-10 18:18:24.053954	t
67	\N	PROSPECT	ENVOL GESTION ORPI	\N	Monsieur	de labaca	\N	\N	nan	2021-06-10 18:18:25.975857	t
68	\N	PROSPECT	EURO IMMO	\N	Madame	duval	\N	\N	nan	2021-06-10 18:18:26.855355	t
69	\N	PROSPECT	LAFORET ALAIN LAMBOUR IMMOBILIER SAS	\N	Monsieur	lambour alain	\N	\N	nan	2021-06-10 18:18:29.981569	t
70	\N	PROSPECT	CABINET LATASTE - VION	\N	Madame	glorieux valérie	\N	\N	nan	2021-06-10 18:18:32.631091	t
71	\N	PROSPECT	Cabinet Chauvel Transaction	\N	Madame	cohade	\N	\N	nan	2021-06-10 18:18:34.216185	t
72	\N	PROSPECT	FUTUR TRANSACTIONS	\N	Madame	bailly sophie	\N	\N	nan	2021-06-10 18:18:34.235175	t
73	\N	PROSPECT	LES TERRAINS D'AQUITAINE	\N	Madame	goichon brigitte	\N	\N	nan	2021-06-10 18:18:34.268158	t
74	\N	PROSPECT	FOCH IMMOBILIER	\N	Madame	ballon virginie	\N	\N	nan	2021-06-10 18:18:35.147653	t
75	\N	PROSPECT	IMMODIA	\N	Monsieur	peroy franck	\N	\N	nan	2021-06-10 18:18:35.164644	t
76	\N	PROSPECT	AGENCE SAINT HELENE	\N	Monsieur	dupart denis	\N	\N	nan	2021-06-10 18:18:37.945055	t
77	\N	PROSPECT	ERA - ELIXIM	\N	Monsieur	auburtin	\N	\N	nan	2021-06-10 18:18:38.861532	t
78	\N	PROSPECT	CENTURY21 - TALENT IMMOBILIER	\N	Monsieur	bibes françois	\N	\N	nan	2021-06-10 18:18:38.878522	t
83	\N	PROSPECT	AQUITAINE PROPERTY	\N	Monsieur	duparc	\N	\N	nan	2021-06-10 18:18:41.506022	t
84	\N	PROSPECT	DEGUELT IMMOBILIER	\N	Monsieur	goguel franck	\N	\N	nan	2021-06-10 18:18:41.523012	t
95	\N	PROSPECT	BILLON RST	\N	Monsieur	lamani thierry	\N	\N	nan	2021-06-10 18:18:47.152374	t
98	\N	PROSPECT	PONANT IMMOBILIER	\N	Monsieur	buccafurri christel	\N	\N	nan	2021-06-10 18:18:52.612255	t
99	\N	PROSPECT	EURO GESTION	\N	Madame	boismorand	\N	\N	nan	2021-06-10 18:18:52.631244	t
100	\N	PROSPECT	RIVAGE IMMOBILIER	\N	Monsieur	deshayes gilles	\N	\N	nan	2021-06-10 18:18:53.68764	t
79	\N	PROSPECT	IMMO HUGUERIE	\N	Monsieur	grunel olivier	\N	\N	nan	2021-06-10 18:18:39.702052	t
80	\N	PROSPECT	CARNET DE L'IMMOBILIER	\N	Madame	barbedette	\N	\N	nan	2021-06-10 18:18:39.722041	t
81	\N	PROSPECT	ARGOS IMMOBILIER	\N	Monsieur	sanchez thierry	\N	\N	nan	2021-06-10 18:18:39.737031	t
82	\N	PROSPECT	B2P	\N	Monsieur	plazzi bertrand	\N	\N	nan	2021-06-10 18:18:40.627523	t
85	\N	PROSPECT	GRISEL IMMOBILIER	\N	Madame	sage corinne	\N	\N	nan	2021-06-10 18:18:42.5944	t
86	\N	PROSPECT	LAFORET - MARTIN IMMOBILIER	\N	Monsieur	martin florian	\N	\N	nan	2021-06-10 18:18:42.611391	t
87	\N	PROSPECT	BSI BOULOGNE SUD	\N	Monsieur	caron	\N	\N	nan	2021-06-10 18:18:42.62738	t
88	\N	PROSPECT	4% MAX	\N	Monsieur	fisnot	\N	\N	nan	2021-06-10 18:18:42.644372	t
89	\N	PROSPECT	COPAC	\N	Monsieur	wilkinson richard	\N	\N	nan	2021-06-10 18:18:42.661362	t
90	\N	PROSPECT	CENTURY 21 PRESTIMMO CONSEIL	\N	Monsieur	lamballais françois	\N	\N	nan	2021-06-10 18:18:42.679351	t
91	\N	PROSPECT	R&B IMMOBILIER	\N	Monsieur	coupe benoît	\N	\N	nan	2021-06-10 18:18:42.694342	t
92	\N	PROSPECT	GRECH IMMOBILIER	\N	Monsieur	meutry	\N	\N	nan	2021-06-10 18:18:42.712334	t
93	\N	PROSPECT	CONDOR IMMOBILIER	\N	Monsieur	teboul dan	\N	\N	nan	2021-06-10 18:18:42.728324	t
94	\N	PROSPECT	AVANTIM AQUITAINE	\N	Monsieur	papelard françois	\N	\N	nan	2021-06-10 18:18:42.745313	t
96	\N	PROSPECT	LOGESSIM	\N	Madame	bonis	\N	\N	nan	2021-06-10 18:18:50.930214	t
97	\N	PROSPECT	SAINT AGNANT IMMOBILIER	\N	Madame	mathieu isabelle	\N	\N	nan	2021-06-10 18:18:50.946208	t
101	\N	PROSPECT	CABINET MADIER	\N	Monsieur	madier jacques	\N	\N	nan	2021-06-10 18:18:58.1351	t
102	\N	PROSPECT	ERA L.V.I	\N	Messieurs	viale franck & legroux yoan	\N	\N	nan	2021-06-10 18:18:58.152089	t
103	\N	PROSPECT	CENTURY 21 ACCORT'IMMO	\N	Madame	deregnaucourt evelyne	\N	\N	nan	2021-06-10 18:18:58.170079	t
104	\N	PROSPECT	LAFONTAINE IMMOBILIER L'ADRESSE	\N	Monsieur	lafontaine mathieu	\N	\N	nan	2021-06-10 18:18:58.18807	t
105	\N	PROSPECT	MER ET CAMPAGNE	\N	Madame	leleu caroline	\N	\N	nan	2021-06-10 18:18:59.777161	t
106	\N	PROSPECT	L'ADRESSE IMMOBILIERE OCEANE	\N	Madame	brochard	\N	\N	nan	2021-06-10 18:18:59.795151	t
107	\N	PROSPECT	L'EMPIRE IMMOBILIER	\N	Madame	couton géraldine	\N	\N	nan	2021-06-10 18:19:01.115399	t
108	\N	PROSPECT	AGENCE DU PHARE	\N	Madame	gauthier françoise	\N	\N	nan	2021-06-10 18:19:09.159803	t
109	\N	PROSPECT	EURLARDOUINIMMOBILIER SUD LOIRE	\N	Monsieur	ardouin michel	\N	\N	nan	2021-06-10 18:19:09.183787	t
110	\N	PROSPECT	CABINET PREMUIM CENTRE	\N	Madame	pluvinage marie	\N	\N	nan	2021-06-10 18:19:10.542014	t
111	\N	PROSPECT	LA COLINIERE IMMOBILIER	\N	Monsieur	viel bertrand	\N	\N	nan	2021-06-10 18:19:12.891972	t
112	\N	PROSPECT	THALASSA	sarlthalassaimmobilier	Monsieur	hakoun franck	\N	\N	nan	2021-06-10 18:19:12.91796	t
113	\N	PROSPECT	BARATTE IMMOBILIER	baratteimmobilier	Madame	richard vanessa	\N	\N	nan	2021-06-10 18:19:45.124559	t
114	\N	PROSPECT	CABINET IMMOBILIER MERIEAU	cabinetimmobiliermerieau	Monsieur	merieau thierry	\N	\N	nan	2021-06-10 18:19:54.094438	t
115	\N	PROSPECT	METEO IMMOBILIER	\N	Madame	mourat	\N	\N	nan	2021-06-10 18:19:58.212141	t
116	\N	PROSPECT	AGENCE IMMOBILIERE ALIZEO	\N	Monsieur	leguey mathieu	\N	\N	nan	2021-06-10 18:19:58.241124	t
117	\N	PROSPECT	CABINET FOUCHE	\N	Monsieur	fouche stéphane	\N	\N	nan	2021-06-10 18:19:58.257118	t
118	\N	PROSPECT	CABINET DUBERNAT	cabinetdubernat	Monsieur	dubernat stéphane	\N	\N	nan	2021-06-10 18:20:01.307583	t
119	\N	PROSPECT	CABINET BRUN IMMOBILIER	\N	Monsieur	brun françois	\N	\N	nan	2021-06-10 18:20:03.260466	t
120	\N	PROSPECT	MI MONDESIR IMMOBILIER	\N	Monsieur	beaujouan christophe	\N	\N	nan	2021-06-10 18:20:05.821	t
121	\N	PROSPECT	TAUSSAT IMMOBILIER	\N	Madame	orell catherine	\N	\N	nan	2021-06-10 18:20:05.839995	t
122	\N	PROSPECT	AXAL IMMOBILIER	\N	Madame	argenti sandrine	\N	\N	nan	2021-06-10 18:20:05.89196	t
123	\N	PROSPECT	CABINET BEDIN	\N	Monsieur	michelet	\N	\N	nan	2021-06-10 18:20:06.917375	t
124	\N	PROSPECT	ERA TOURAINE IMMOBILIER	\N	Monsieur	briand vincent	\N	\N	nan	2021-06-10 18:20:10.073572	t
125	\N	PROSPECT	CLEMENCEAU IMMOBILIER	85immolarochesuryon	Monsieur	algudo thierry	\N	\N	nan	2021-06-10 18:20:24.735965	t
126	\N	PROSPECT	MIRAMAR	miramar	Monsieur	billaud	\N	\N	nan	2021-06-10 18:20:31.567996	t
127	\N	PROSPECT	L'ADRESSE SAS AGENCE DE L'OCEAN	\N	Monsieur	adrian eric	\N	\N	nan	2021-06-10 18:20:32.391525	t
128	\N	PROSPECT	SQUARE HABITAT ATLANTIQUE VENDEE	squarehabitatatlantiquevendee	Monsieur	louineau tony	\N	\N	nan	2021-06-10 18:20:34.148519	t
129	\N	PROSPECT	BELVIA IMMOBILIER	belviaimmobilier	Monsieur	frouin laurent	\N	\N	nan	2021-06-10 18:20:35.163938	t
130	\N	PROSPECT	ATP IMMOBILIER	\N	Madame	recoquillon servane	\N	\N	nan	2021-06-10 18:20:42.395903	t
131	\N	PROSPECT	AGENCE ALIZES	\N	Madame	baniel marie	\N	\N	nan	2021-06-10 18:20:42.432883	t
134	110420	PROSPECT	IMONET SASU	imonet	Monsieur	gautheret quentin (gerant) sebaoun vanessa (respsb. ag)	\N	\N	53229059000027	2021-06-10 18:20:45.926885	t
132	110450	PROSPECT	MGL - IMMOBILIERE DE ROYAN	mgl-laforetimmobilierederoyan	Madame	asselin aline	\N	\N	47772963600019	2021-06-10 18:20:44.233856	t
133	\N	PROSPECT	nan	isoinvest	Monsieur	azoulay fabrice	\N	\N	nan	2021-06-10 18:20:44.281826	t
135	\N	PROSPECT	CENTURY 21 AGENCE DU MARCHE	century21agencedumarche	Madame	bronnec estelle	\N	\N	nan	2021-06-10 18:20:55.112675	t
142	\N	PROSPECT	LAFORET - AaZ IMMOBILIER YONNAIS	laforet-aazimmobilieryonnais	Madame	guillou charlotte	\N	\N	nan	2021-06-10 18:21:20.482306	t
136	110420	PROSPECT	ORPI CABINET GAUDUCHON	orpicabinetgauduchon	Monsieur	gauduchon mickael	\N	\N	nan	2021-06-10 18:20:55.168642	t
137	\N	PROSPECT	AGENCE DE L'ESTACADE	l'adresse-labarredemonts	Monsieur	pelloquin nicolas	\N	\N	nan	2021-06-10 18:21:00.50759	t
138	\N	PROSPECT	AGENCE DURET	agenceduret	Madame	genaudeau nathalie	\N	\N	nan	2021-06-10 18:21:00.544567	t
139	110710	PROSPECT	CHANOT ROBQUIN MEAUX SAS	agencechanot	Monsieur	robquin thierry	\N	\N	nan	2021-06-10 18:21:02.46747	t
140	\N	PROSPECT	CIL ATLANTIQUE	cilatlantique	Madame	salle céline	\N	\N	nan	2021-06-10 18:21:05.477749	t
141	120110	PROSPECT	SARL R.LELIEVRE	lelievreimmobilier	Madame	lelievre elisabeth	\N	\N	nan	2021-06-10 18:21:18.624368	t
143	\N	PROSPECT	AGENCE IMMOBILIERE DU STADE	era	Madame	pecado	\N	\N	nan	2021-06-10 18:21:23.126796	t
144	\N	PROSPECT	nan	casteimmobilier	Monsieur	de cambourg	\N	\N	nan	2021-06-10 18:21:23.152781	t
145	\N	PROSPECT	AGENCE ACHARD IMMOBILIER	agenceachardimmobilier	Madame	poirier lydie	\N	\N	nan	2021-06-10 18:21:28.830862	t
146	\N	PROSPECT	nan	differenc'immo	Madame	jallais fabienne	\N	\N	nan	2021-06-10 18:21:28.855848	t
147	\N	PROSPECT	AGENCE ALPHA IMMOBILIER	\N	Monsieur	chusseau bernard	\N	\N	nan	2021-06-10 18:21:28.881831	t
148	\N	PROSPECT	LEBEAU CONCEPT IMMO	societebenoitlebeau	Monsieur	lebeau benoit	\N	\N	nan	2021-06-10 18:21:28.898821	t
149	\N	PROSPECT	OFFICE NOTARIAL DE FONTENAY LE COMTE	\N	Madame	mathonneau nadine	\N	\N	nan	2021-06-10 18:21:29.745338	t
150	\N	PROSPECT	OFFICE NOTARIAL	selarlcaractereauthentique	Monsieur	me gautier et mathieu	\N	\N	nan	2021-06-10 18:21:29.76333	t
152	\N	PROSPECT	SARL GUEDON IMMOBILIER	\N	Monsieur	guedon stéphane	\N	\N	nan	2021-06-10 18:21:30.652818	t
153	\N	PROSPECT	SARL NANT'IM VIVRE ICI	\N	Monsieur	hanin christophe	\N	\N	nan	2021-06-10 18:21:30.673808	t
154	122230	PROSPECT	IMMOBILIER KEREBEL	\N	Monsieur	pedel jean-luc	\N	\N	40977820600022	2021-06-10 18:21:30.695797	t
155	\N	PROSPECT	SARL CABINET BROSSEAU MORIN	\N	Madame	brosseau adeline	\N	\N	nan	2021-06-10 18:21:31.651985	t
156	\N	PROSPECT	GESTION SANDRINE SOULAC	\N	Madame	soulac sandrine	\N	\N	nan	2021-06-10 18:21:33.409977	t
157	\N	PROSPECT	SARL PROACTIVE IMMOBILIER 53	\N	Madame	hubert karine	\N	\N	nan	2021-06-10 18:21:38.533488	t
158	\N	PROSPECT	SCP TANGUY CATHOU	\N	Madame	lasceve-cathou fouche eric	\N	\N	nan	2021-06-10 18:21:38.549476	t
159	\N	PROSPECT	CENTURY21 BREST	\N	Madame	couveignes audrey	\N	\N	nan	2021-06-10 18:21:38.570465	t
161	\N	PROSPECT	SARL KERIMO	l'immobilierautrement	Madame	kermarec & nedelec	\N	\N	nan	2021-06-10 18:21:42.054474	t
165	\N	PROSPECT	nan	carnotimmobilier	Madame	duroy nicole	\N	\N	nan	2021-06-10 18:21:43.838455	t
167	\N	PROSPECT	SARL CHAILLOUX IMMOBILIER	\N	Monsieur	chailloux thomas	\N	\N	nan	2021-06-10 18:21:45.676405	t
168	\N	PROSPECT	SARL AGENCE DE L'ODET	\N	Monsieur	bourdais cyril	\N	\N	nan	2021-06-10 18:21:45.696396	t
169	120180	PROSPECT	SARL HECK IMMOBILIER	agenceatithomasseimmobilier	Madame	thomasse valérie	\N	\N	nan	2021-06-10 18:21:47.447393	t
170	\N	PROSPECT	nan	bianimmobilier	Madame	bian patricia	\N	\N	nan	2021-06-10 18:21:47.503363	t
151	\N	PROSPECT	nan	votreimmo	Monsieur	le plenier stéphane	\N	\N	nan	2021-06-10 18:21:30.624835	t
160	\N	PROSPECT	CABIENT BARRIERE	fideprom	Monsieur	\N	\N	\N	nan	2021-06-10 18:21:42.029489	t
162	\N	PROSPECT	SCP RIOU VETILLARD TOMBECK	\N	Madame	riou nadine	\N	\N	nan	2021-06-10 18:21:42.077461	t
163	\N	PROSPECT	SCP TETU COLLET ORY ROZEL	\N	Monsieur	tetu olivier	\N	\N	nan	2021-06-10 18:21:42.885	t
164	\N	PROSPECT	SARL RC IMMOBILIER	teamouestimmo	Monsieur	cocoual florian	\N	\N	53522966000019	2021-06-10 18:21:43.810476	t
166	\N	PROSPECT	SARL SOREDIF Agence du Moulin	agenceorpidumoulin	Monsieur	veillet bruno	\N	\N	nan	2021-06-10 18:21:45.649421	t
171	\N	PROSPECT	SAS ELENA	plaza	Monsieur	talec erwan	\N	\N	nan	2021-06-10 18:21:47.539341	t
197	122165	PROSPECT	CABINET FRUCHET	\N	Monsieur	fruchet benjamin	\N	\N	nan	2021-06-10 18:22:16.709145	t
172	12255	PROSPECT	BLOIS IMMOBILIER	bloisimmo	Madame	carpentier aurélie	\N	\N	nan	2021-06-10 18:21:50.757503	t
198	\N	PROSPECT	CABINET GALVAIN	\N	Monsieur	galvain jean-pierre	\N	\N	nan	2021-06-10 18:22:16.755119	t
173	121020	PROSPECT	SARL LOUDEAC IMMOBILIER	avisimmobilierloudeac	Madame	bertho le dantec brigite	\N	\N	nan	2021-06-10 18:21:55.097024	t
174	\N	PROSPECT	nan	notaire	Madame	jegoux passez sabrina	\N	\N	nan	2021-06-10 18:22:00.711822	t
175	\N	PROSPECT	nan	notaire	Monsieur	caroff gwenole	\N	\N	nan	2021-06-10 18:22:00.762789	t
176	\N	PROSPECT	LA FRANCAISE IMMOBILIERE	lfi	Monsieur	pigeault jean-pierre	\N	\N	nan	2021-06-10 18:22:00.799767	t
177	\N	PROSPECT	nan	lemarechal	Monsieur	le marechal laurent	\N	\N	nan	2021-06-10 18:22:00.830748	t
178	\N	PROSPECT	RIVAGES IMMOBILIER	orpi	Monsieur	deshayes gilles	\N	\N	nan	2021-06-10 18:22:00.86373	t
179	\N	PROSPECT	IMMOBILIERE DU GRAND PARIS	\N	Monsieur	varnier guillaume	\N	\N	nan	2021-06-10 18:22:01.765216	t
180	\N	PROSPECT	CABINET ACCES IMMO	\N	Monsieur	castel julien	\N	\N	nan	2021-06-10 18:22:01.7902	t
181	\N	PROSPECT	SARL VILMORIN IMMOBILIER	l'adresse-palaiseau	Monsieur	clavet denis & binet guillaume	\N	\N	nan	2021-06-10 18:22:04.858634	t
199	\N	PROSPECT	CABINET OLIIER	\N	Monsieur	olivier arnaud	\N	\N	nan	2021-06-10 18:22:20.059099	t
182	123640	PROSPECT	SARL Agence des 4 Sergents	agencedesquatressergents	Monsieur	jeanjean gilles & jeanjean guillaume	\N	\N	nan	2021-06-10 18:22:06.291097	t
183	\N	PROSPECT	AGENCE PIERREVAL	agencepierrval	Madame	margot véronique	\N	\N	nan	2021-06-10 18:22:06.331073	t
184	\N	PROSPECT	AGENCE ORPI LIBERTE	orpiliberte	nan	ghafoury palatine	\N	\N	nan	2021-06-10 18:22:07.524394	t
185	\N	PROSPECT	IMMOBILIERE DE LA POSTE	l'adresse-limeilbrevannes-immobilieredelaposte	Monsieur	monsonnec cédric	\N	\N	nan	2021-06-10 18:22:07.551378	t
186	\N	PROSPECT	IMMOBILIERE DU VILLAGE	l'adresse-creteil	Monsieur	bijaoui eric	\N	\N	nan	2021-06-10 18:22:07.578362	t
187	\N	PROSPECT	E IMMOBILIERE	l'adressee-immobiliere	Madame	bonan florence	\N	\N	nan	2021-06-10 18:22:07.624334	t
188	\N	PROSPECT	ORPI COLBERT IMMOBILIER	\N	Monsieur	aqqade karim & horte nathalie	\N	\N	nan	2021-06-10 18:22:07.673309	t
189	\N	PROSPECT	SASUE LA LICORNE	lalicorneimmobilier	Monsieur	ringuet eric	\N	\N	nan	2021-06-10 18:22:10.811513	t
190	\N	PROSPECT	SAS ESPACIL CONSTRUCTION	adbespacil	Monsieur	geniteau aantoine	\N	\N	nan	2021-06-10 18:22:10.859487	t
191	\N	PROSPECT	SAS JLF PROSPECT	\N	Monsieur	fore jonathan	\N	\N	nan	2021-06-10 18:22:11.891896	t
192	\N	PROSPECT	SAS AGENCE IMMOBILIERE DU CENTRE	\N	Madame	al tinawi maryannick	\N	\N	nan	2021-06-10 18:22:12.826364	t
193	\N	PROSPECT	SARL LOGERIS	\N	Monsieur	marie adrien	\N	\N	nan	2021-06-10 18:22:12.85035	t
194	\N	PROSPECT	SARL VILLE PLAGE	eraimmobilier	Monsieur	letourmy gilles	\N	\N	nan	2021-06-10 18:22:13.819797	t
195	\N	PROSPECT	SARL CABINETOLLIERIC	\N	Monsieur	ollieric rodolphe	\N	\N	nan	2021-06-10 18:22:13.86577	t
196	\N	PROSPECT	SARL UNE ADRESSE	l'adresse-saintnazaire	Monsieur	revranche laurent	\N	\N	nan	2021-06-10 18:22:15.761687	t
200	\N	PROSPECT	SCP NOTAIRES ASSOCIES	\N	Messieurs	mery xavier & perez arnaud	\N	\N	nan	2021-06-10 18:22:30.297252	t
201	\N	PROSPECT	DELON IMMOBILIER REAL ESTATE COMPANY	\N	Monsieur	delon nicolas	\N	\N	nan	2021-06-10 18:22:31.24371	t
202	\N	PROSPECT	LECUYER IMMOBILIER	lecuyerimmobilier	Monsieur	lecuyer emmanuel	\N	\N	nan	2021-06-10 18:22:35.945023	t
203	122170	PROSPECT	SARL STELA	agencepascal	MADAME	salvator laura	\N	\N	48091327600014	2021-06-10 18:22:35.970016	t
204	\N	PROSPECT	SARL LOUMAE	l'adresse-carquefou	Monsieur	genest christophe	\N	\N	538305830	2021-06-10 18:22:36.886486	t
205	\N	PROSPECT	CABINET CHATEAUBRIAND IMMOBILIER	\N	Madame	brossault elodie	\N	\N	44457670600030	2021-06-10 18:22:36.918467	t
206	\N	PROSPECT	Cabinet notarial	\N	Monsieur	lalande alexandre	\N	\N	nan	2021-06-10 18:22:38.75642	t
207	\N	PROSPECT	nan	metropolitanimmobilierbrest	Monsieur	mevel eric	\N	\N	nan	2021-06-10 18:22:39.655904	t
208	\N	PROSPECT	nan	metropolitanimmobilier	Monsieur	postec jean-yves	\N	\N	nan	2021-06-10 18:22:42.954632	t
209	\N	PROSPECT	ETUDE MAITRE PRIGENT MATTHIEU	\N	Monsieur	prigent matthieu	\N	\N	nan	2021-06-10 18:22:42.994612	t
210	\N	PROSPECT	ABC IMMOBILIER	agencebrestcornouaille(abc)immobilier	Monsieur	guermeur paul	\N	\N	49460758300015	2021-06-10 18:22:50.909605	t
211	\N	PROSPECT	SARL NERIUS	l'adresse-iledenantes	Monsieur	pottier michaël	\N	\N	nan	2021-06-10 18:22:51.150466	t
212	\N	PROSPECT	nan	orpicornouaille	Monsieur	veillon nicolas	\N	\N	822401733	2021-06-10 18:22:58.137746	t
213	\N	PROSPECT	nan	officenotarial	Madame	bernaert grohard laétitia	\N	\N	83492095100011	2021-06-10 18:22:59.234115	t
214	\N	PROSPECT	SARL LNA	lanouvelleagence	MADAME	laurent christine	\N	\N	82050356300018	2021-06-10 18:23:02.213416	t
215	\N	PROSPECT	SARL GO NORDOUEST IMMO	arthurimmo	Monsieur	marmagne florent	\N	\N	503587867	2021-06-10 18:23:07.364471	t
216	\N	PROSPECT	BENOIT IMMOBILIER	\N	Madame	leray christine	\N	\N	505076984	2021-06-10 18:23:07.414443	t
217	\N	PROSPECT	SARL AGENCE IMMOBILIERE NUEVA	\N	Madame	poiraud peggy	\N	\N	495080384	2021-06-10 18:23:07.446424	t
218	\N	PROSPECT	nan	cabinetkerjeanlannilis	Madame	?? fabienne	\N	\N	nan	2021-06-10 18:23:07.469411	t
219	\N	PROSPECT	SARL CYGLA	cabinethabasqueimmobilierlandernaeau	Madame	corre christine	\N	\N	nan	2021-06-10 18:23:07.501392	t
220	\N	PROSPECT	SARL FRANK BEULE IMMOBIMIER	agencel'entreprise	Monsieur	bridoux jocelin	\N	\N	48406460500039	2021-06-10 18:23:07.534374	t
221	\N	PROSPECT	SARL GIRATI	agenceeratouraineimmobilier	Monsieur	girati vincent	\N	\N	494576473	2021-06-10 18:23:07.581345	t
222	\N	PROSPECT	SARL FABIENNE THIERRY IMMOBILIER	agencefabiennethierryimmobilier	Madame	meder mathilde	\N	\N	51371960900010	2021-06-10 18:23:10.502727	t
223	\N	PROSPECT	SARL GA 1 NY	agencenestenn	Madame	deschaseaux marie-annick	\N	\N	818339459	2021-06-10 18:23:10.579684	t
232	\N	PROSPECT	OFFICE NOTARIAL	\N	Maitre	nicolas	\N	\N	nan	2021-06-10 18:23:36.103733	t
238	\N	PROSPECT	SARL MB IMMOBILIER	\N	Monsieur	blot pierre-yves	\N	\N	39835439900014	2021-06-10 18:23:47.207389	t
224	\N	PROSPECT	ADJ GESTION	l'adresse-adjgestion-joinvillelepont	MONSIEUR	pastor syvain	\N	\N	60203245000010	2021-06-10 18:23:16.593358	t
225	\N	PROSPECT	GTI AURELIEN RIMBAUD	l'adresse-rochefort	MONSIEUR	rimbaud aurelien	\N	\N	80784180400014	2021-06-10 18:23:16.634335	t
226	\N	PROSPECT	SAS BARRAINE PROMOTION	agencebarrainepromotion	Monsieur	rimbert steve	\N	\N	503520058	2021-06-10 18:23:17.611775	t
227	\N	PROSPECT	SARL BV ABRAYSIE CONSEIL	century21	Monsieur	vinauger bertrand	\N	\N	439925520	2021-06-10 18:23:17.644757	t
228	\N	PROSPECT	SARL NUANCES HABITAT	\N	Monsieur	bothorel dominique	\N	\N	50427476200013	2021-06-10 18:23:19.481708	t
229	\N	PROSPECT	SARL LVI IMMOBILIER	eralvi	Monsieur	legroux yoann	\N	\N	450731252	2021-06-10 18:23:19.514688	t
230	\N	PROSPECT	SARL BLEU HORIZON CABINET IMMOBILEIR	cabinetimmobilierbleuhorizon	Monsieur	gaulard michel	\N	\N	502367204	2021-06-10 18:23:21.520545	t
231	\N	PROSPECT	SASU AGENCE IMM	agenceimm	Madame	combe coralie	\N	\N	51464808800045	2021-06-10 18:23:31.11758	t
233	\N	PROSPECT	AGENCE CADEAU	agencecadeau	Monsieur	garcia nicolas	\N	\N	nan	2021-06-10 18:23:36.139713	t
234	\N	PROSPECT	SA NOTAIRE SERVICE	\N	Maître	mathieu & bethouart	\N	\N	67672021200015	2021-06-10 18:23:45.84017	t
235	\N	PROSPECT	OFFICE NOTARIAL DELOMEAU THOMAS HOUISGIRARD	\N	Madame	you christelle	\N	\N	30127528500015	2021-06-10 18:23:45.880148	t
236	\N	PROSPECT	OFFICE NOTARIAL GROUPE MONASSIER CHOLET	\N	Maître	delorme bernard	\N	\N	35187702200035	2021-06-10 18:23:45.918129	t
237	\N	PROSPECT	CREDIT AGRICOLE	creditagricoleimmobilier	nan	appel d'offre national	\N	\N	nan	2021-06-10 18:23:45.944111	t
240	123900	PROSPECT	ALAIN ROUSSEAU IMMOBILIERE COMINE	alainrousseauimmobilierecomine	Monsieur	rousseau guillaume	\N	\N	414 709 980 00018	2021-06-10 18:23:50.569471	t
242	\N	PROSPECT	SARL HERMELIN	\N	Monsieur	hermelin blanchet nicolas	\N	\N	31428173400025	2021-06-10 18:23:54.24737	t
243	\N	PROSPECT	SARL G1H	\N	Monsieur	dresh gilles	\N	\N	44795758000015	2021-06-10 18:23:54.280352	t
244	\N	PROSPECT	SARL MOBIXEL	\N	Monsieur	bourreau jean-christophe	\N	\N	35336010000047	2021-06-10 18:23:55.356739	t
245	\N	PROSPECT	MONSIEUR TONY BARON	agfenceimmodream	Monsieur	baron tony	\N	\N	47826100100059	2021-06-10 18:23:55.375724	t
248	\N	PROSPECT	SARL UNIPERSONNELLE ROSA	agencecentury21rosa	Monsieur	negre romain	\N	\N	82499399200018	2021-06-10 18:24:07.379867	t
249	\N	PROSPECT	MB IMMOBILIER	mbimmobilier	Madame	mottin alexandra	\N	\N	49880354100018	2021-06-10 18:24:08.549199	t
251	\N	PROSPECT	MAINE ET LOIRE HABITAT	maineetloirehabitat	Messieurs	colobert laurent & ratier benoit	\N	\N	27490003400019	2021-06-10 18:24:10.928841	t
253	\N	PROSPECT	SARL BOURNEIX MENUET IMMOBILIER	l'adresseimmobilierchallans	Monsieur	menuet julien	\N	\N	52338507800010	2021-06-10 18:24:14.319903	t
255	\N	PROSPECT	SAS BED AND SCHOOL 2G2L	bedandschool	Société	holding  mme zimnoch aurelie	\N	\N	50502435600063	2021-06-10 18:24:17.759938	t
258	124220	PROSPECT	MME FLEURY	mmefleury	Société	sci kroaz du	\N	\N	833 608 938 00019	2021-06-10 18:24:26.994663	t
259	124230	PROSPECT	KAMET VENTURES	kamet	Monsieur	recoing julien	\N	\N	nan	2021-06-10 18:24:27.047632	t
260	124250	PROSPECT	LEGRAND FRANCIS	particulier	Monsieur	legrand francis	\N	\N	nan	2021-06-10 18:24:27.122592	t
262	\N	PROSPECT	EURL GONORD IMMOBILIER	gonordimmobilier	Madame	gonord jacqueline	\N	\N	51387211900013	2021-06-10 18:24:43.943675	t
239	\N	PROSPECT	SARL GSM IMMOBILIER	gsmimmobilier	Monsieur	godeau sébastien	\N	\N	47939188000040	2021-06-10 18:23:49.235231	t
241	\N	PROSPECT	SARL MONTREUIL BELLAY IMMOBILIER	agencebrun	Monsieur & Madame	bemelmans frédéric & delphine	\N	\N	45104395400028	2021-06-10 18:23:51.54691	t
246	\N	PROSPECT	SARL AMBROISE IMMO	ambroiseimmoguyhoquet	Monsieur	ambroise jouslin de pisseloup de noray	\N	\N	49455750700014	2021-06-10 18:24:02.719537	t
247	\N	PROSPECT	SARL LIGERIA IMMOBILIER	ligeriaimmobilier	Madame	hazlewood samantha	\N	\N	48389307900028	2021-06-10 18:24:07.331897	t
250	\N	PROSPECT	SAS A21	sasa21	Messieurs	taudiere christian et virgile	\N	\N	94240142400017	2021-06-10 18:24:10.891862	t
252	\N	PROSPECT	SELARL NOTAIRES ASSOCIES	notairesassociesdupont&migot	Maître	dupont nicolas & migot antoine	\N	\N	79109214100013	2021-06-10 18:24:10.975811	t
254	\N	PROSPECT	SARL JICEBE	brigittesauvagerimmobilier	Madame	sauvager	\N	\N	34801270900021	2021-06-10 18:24:15.647144	t
256	124180	PROSPECT	FICHIER HABITAT	immobilieredes3rives	Monsieur	jean louis pecheux	\N	\N	84172176400014	2021-06-10 18:24:17.793918	t
257	\N	PROSPECT	SARL CHEZLANOU IMMOBILIER	elyseavenue	Monsieur	bismuth denis	\N	\N	49350360100012	2021-06-10 18:24:24.32019	t
261	\N	PROSPECT	SARL CLERIMMO	erarivedroite	Monsieur	boudaud laurent	\N	\N	752736223	2021-06-10 18:24:34.754924	t
263	1270218	PROSPECT	CABINET DIARD	cabientdiard	Monsieur	gaudiche jean jacques	\N	\N	379 086 085 00014	2021-06-10 18:25:42.862508	t
\.


--
-- Data for Name: prospect_History; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."prospect_History" (id, prospect, adresse, cp, ville, pays, etat_client, date, visibility) FROM stdin;
1	1	29 Bld Victor Hugo	84500	BOLLENE	\N	true	2021-06-10 18:17:57.035381	t
2	2	59 Bd Massena	75013	PARIS	\N	true	2021-06-10 18:17:57.906883	t
3	3	7 rue Gabetta	77170	BRIE COMTE ROBERT	\N	true	2021-06-10 18:17:57.923876	t
4	4	9 Place d'Italie	75013	PARIS	\N	true	2021-06-10 18:17:57.940866	t
5	5	61 Boulevard des Batignoles	75008	PARIS	\N	true	2021-06-10 18:17:57.956855	t
6	6	61 Boulevard des Batignoles	75008	PARIS	\N	true	2021-06-10 18:17:57.972846	t
7	7	44 avenue du Général Leclerc	94700	MAISONS ALFORT	\N	true	2021-06-10 18:17:57.988837	t
8	8	15 avenue du Général de Gaulle	94700	MAISONS ALFORT	\N	true	2021-06-10 18:17:58.005829	t
9	9	222 rue Paul Vaillant Couturier	92000	NANTERRE	\N	true	2021-06-10 18:17:59.000262	t
10	10	5 rue de Verdun	92150	SURESNES	\N	true	2021-06-10 18:17:59.04224	t
11	11	1Place Henri IV	92150	SURESNE	\N	true	2021-06-10 18:17:59.059227	t
12	12	82 rue Blanche	75009	PARIS	\N	true	2021-06-10 18:18:00.504412	t
13	13	4 avenue de Bel Air	75012	PARIS	\N	true	2021-06-10 18:18:01.272968	t
14	14	90 Cours de Vincennes	75012	PARIS	\N	true	2021-06-10 18:18:01.289957	t
15	15	nan	nan	nan	\N	true	2021-06-10 18:18:02.217431	t
16	16	nan	nan	nan	\N	true	2021-06-10 18:18:02.234418	t
17	17	nan	nan	nan	\N	true	2021-06-10 18:18:02.25041	t
18	18	nan	nan	nan	\N	true	2021-06-10 18:18:02.2674	t
19	19	55 Av Edouard Vaillant	92100	BOULOGNE BILLANCOURT	\N	true	2021-06-10 18:18:02.28339	t
20	20	106 route de la Reine	92100	BOULOGNE BILLANCOURT	\N	true	2021-06-10 18:18:02.301384	t
21	21	71 route de la Reine	92100	BOULOGNE BILLANCOURT	\N	true	2021-06-10 18:18:03.443731	t
22	22	16 rue de Satory	78000	VERSAILLES	\N	true	2021-06-10 18:18:03.486704	t
23	23	19 rue de l'Orangerie	78000	VERSAILLES	\N	true	2021-06-10 18:18:03.515687	t
24	24	14 rue de Satory	78000	VERSAILLES	\N	true	2021-06-10 18:18:03.541677	t
25	25	209 Bd Jean-Jaurès	92100	BOULOGNE BILLANCOURT	\N	true	2021-06-10 18:18:03.607635	t
26	26	223 Bd Jean-Jaurès	92100	BOULOGNE BILLANCOURT	\N	true	2021-06-10 18:18:03.634619	t
27	27	225 Bd Jean-Jaurès	92100	BOULOGNE BILLANCOURT	\N	true	2021-06-10 18:18:03.651611	t
28	28	55  av. Pierre Grenier	92100	BOULOGNE BILLANCOURT	\N	true	2021-06-10 18:18:03.670599	t
29	29	91 av. Pierre Grenier	92100	BOULOGNE BILLANCOURT	\N	true	2021-06-10 18:18:03.688587	t
30	30	67 rue Caulincourt	75018	PARIS	\N	true	2021-06-10 18:18:03.705581	t
31	31	35 avenue du Général Leclerc	92300	BOURG LA REINE	\N	true	2021-06-10 18:18:04.605068	t
32	32	70 Bd Maréchal Joffre	92300	BOURG LA REINE	\N	true	2021-06-10 18:18:04.672031	t
33	33	9 rue Pourtoules	84100	ORANGE	\N	true	2021-06-10 18:18:05.690444	t
34	34	1 route de Champigné	49330	CHATEAUNEUF SUR SARTHE	\N	true	2021-06-10 18:18:06.683879	t
35	35	34 Cours Aristide Briand	84100	ORANGE	\N	true	2021-06-10 18:18:06.709862	t
36	36	9 rue Thomas Edison	92230	GENNEVILLIERS	\N	true	2021-06-10 18:18:07.725282	t
37	37	52 rue d'Achères	78600	MAISONS LAFFITTE	\N	true	2021-06-10 18:18:07.743277	t
38	38	37 rue Jean-Pierre Timbaud	92130	ISSY LES MOULINEAUX	\N	true	2021-06-10 18:18:07.785249	t
39	39	40 rue Jean-Pierre Timbaud	92130	ISSY LES MOULINEAUX	\N	true	2021-06-10 18:18:07.818229	t
40	40	38 rue Jean-Pierre Timbaud	92130	ISSY LES MOULINEAUX	\N	true	2021-06-10 18:18:07.839217	t
41	41	60 Place du Marché	78530	BUC	\N	true	2021-06-10 18:18:08.784678	t
42	42	60 Place du Marché	78530	BUC	\N	true	2021-06-10 18:18:08.804665	t
43	43	93 rue Boucicaut	92260	FONTENAY AUX ROSES	\N	true	2021-06-10 18:18:08.821655	t
44	44	47 rue Boucicaut	92260	FONTENAY AUX ROSES	\N	true	2021-06-10 18:18:08.837647	t
45	45	50 rue Boucicaut	92260	FONTENAY AUX ROSES	\N	true	2021-06-10 18:18:08.858639	t
46	46	67 rue Jean Longuet	92290	CHATENAY MALABRY	\N	true	2021-06-10 18:18:08.875626	t
47	47	13 bis Place de L'Eglise	92290	CHATENAY MALABRY	\N	true	2021-06-10 18:18:08.893619	t
48	48	30 rue de Normandie	92600	ASNIERES SUR SEINE	\N	true	2021-06-10 18:18:09.833079	t
49	49	1 rue Bapst	92600	ASNIERES SUR SEINE	\N	true	2021-06-10 18:18:09.851069	t
50	50	3 Avenue Aristide Briand	92249	L'HAY LES ROSES	\N	true	2021-06-10 18:18:09.86706	t
51	51	106 rue de Général Leclerc	95130	FRANCONVILLE	\N	true	2021-06-10 18:18:14.581368	t
52	52	78 Chemin des Sept Deniers	31204	TOULOUSE	\N	true	2021-06-10 18:18:15.555808	t
53	53	82 rue de Moulineau	33170	GRADIGNAN	\N	true	2021-06-10 18:18:16.682166	t
54	54	511 Route de Toulouse	33140	VILLENAVE D'ORNON	\N	true	2021-06-10 18:18:16.701155	t
55	55	8 Mail des Cerclades	95000	CERGY	\N	true	2021-06-10 18:18:18.396186	t
56	56	27 rue du Général de Gaulle	95220	HERBLAY	\N	true	2021-06-10 18:18:18.426169	t
57	57	125 avenue Egéne Varlin	77270	VILLEPARISIS	\N	true	2021-06-10 18:18:18.445158	t
58	58	9 Place du Marché	77270	VILLEPARISIS	\N	true	2021-06-10 18:18:18.464147	t
59	59	1Place Pasteur	77120	COULOMMIERS	\N	true	2021-06-10 18:18:18.504127	t
60	60	5 Court Victor Hugo	33130	BEGLE	\N	true	2021-06-10 18:18:19.676456	t
61	61	32 Cours Victor Hugo	33130	BEGLES	\N	true	2021-06-10 18:18:22.343934	t
62	62	479 Route de Toulouse	33140	VILLENAVE D'ORNON	\N	true	2021-06-10 18:18:22.361925	t
63	63	20 avenue de la Division Leclerc	92160	ANTONY	\N	true	2021-06-10 18:18:22.377912	t
64	64	23 avenue Aristide Briand	92160	ANTONY	\N	true	2021-06-10 18:18:23.216433	t
65	65	11bis avenue Division Leclerc	92160	ANTONY	\N	true	2021-06-10 18:18:23.232424	t
66	66	23/25 avenue de la République	77340	PONTAULT COMBAULT	\N	true	2021-06-10 18:18:24.082941	t
67	67	127 avenue René Cassagne	33151	CENON	\N	true	2021-06-10 18:18:25.986853	t
68	68	19 Bd Robert Thiboust	77700	SERRIS	\N	true	2021-06-10 18:18:26.869347	t
69	69	9 bis avenue de la République	77340	PONTAULT COMBAULT	\N	true	2021-06-10 18:18:29.995561	t
70	70	9 Place de la Victoire	33000	BORDEAUX	\N	true	2021-06-10 18:18:32.642085	t
71	71	36 rue Jules Gesde	63100	CLERMONT FERRAND	\N	true	2021-06-10 18:18:34.229178	t
72	72	28 Cours Gambetta	33850	LEOGNAN	\N	true	2021-06-10 18:18:34.248166	t
73	73	95 rue Notre Dame	33000	BORDEAUX	\N	true	2021-06-10 18:18:34.280148	t
74	74	30 Cours Portal	33000	BORDEAUX	\N	true	2021-06-10 18:18:35.159647	t
75	75	60 Cours de la Somme	33800	BORDEAUX	\N	true	2021-06-10 18:18:35.175638	t
76	76	221 rue Georges Bonnac	33000	BORDEAUX	\N	true	2021-06-10 18:18:37.970044	t
77	77	34 avenue Pasteur	33600	PESSAC	\N	true	2021-06-10 18:18:38.872528	t
78	78	76 Cours Gambetta	33400	TALENCE	\N	true	2021-06-10 18:18:38.890517	t
83	83	53 rue Fondaudege	33000	BORDEAUX	\N	true	2021-06-10 18:18:41.517015	t
84	84	24 rue de Montreuil	78000	VERSAILLES	\N	true	2021-06-10 18:18:41.534005	t
95	95	120 avenue Charles de Gaule	92200	NEUILLY SUR SEINE	\N	true	2021-06-10 18:18:47.162368	t
98	98	9 Place du Ponant	17260	ECHILLAIS	\N	true	2021-06-10 18:18:52.624249	t
99	99	5 Quai de la République	17100	SAINTES	\N	true	2021-06-10 18:18:52.641236	t
100	100	41 rue de la Scierie	17031	LA ROCHELLE CEDEX	\N	true	2021-06-10 18:18:53.698635	t
79	79	38 rue Huguerie	33000	BORDEAUX	\N	true	2021-06-10 18:18:39.716045	t
80	80	26 rue Fondaudege	33000	BORDEAUX	\N	true	2021-06-10 18:18:39.732034	t
81	81	36 rue Fondaudege	33000	BORDEAUX	\N	true	2021-06-10 18:18:39.748027	t
82	82	31 Allées de Tourny	33000	BORDEAUX	\N	true	2021-06-10 18:18:40.639516	t
85	85	19 Cours de L'Intendance	33064	BORDEAUX	\N	true	2021-06-10 18:18:42.605394	t
86	86	26 avenue du Gal Leclerc	92100	BOULOGNE BILLANCOURT	\N	true	2021-06-10 18:18:42.622383	t
87	87	46-48 avenue du Gal Leclerc	92100	BOULOGNE BILLANCOURT	\N	true	2021-06-10 18:18:42.638374	t
88	88	54-56 avenue du Gal Leclerc	92100	BOULOGNE BILLANCOURT	\N	true	2021-06-10 18:18:42.655366	t
89	89	55 rue de la Saussière	92100	BOULOGNE BILLANCOURT	\N	true	2021-06-10 18:18:42.673354	t
90	90	5 avenue Gal Leclerc	92100	BOULOGNE BILLANCOURT	\N	true	2021-06-10 18:18:42.689347	t
91	91	209 Bd Jean-Jaurès	92100	BOULOGNE BILLANCOURT	\N	true	2021-06-10 18:18:42.706335	t
92	92	46 Bd Jean-Jaurès	92100	BOULOGNE BILLANCOURT	\N	true	2021-06-10 18:18:42.723326	t
93	93	112 rue de Paris	92100	BOULOGNE BILLANCOURT	\N	true	2021-06-10 18:18:42.740315	t
94	94	75 77 Allée Jean Giono	33100	BORDEAUX	\N	true	2021-06-10 18:18:42.756306	t
96	96	20 avenue d'Orléans	18000	BOURGES	\N	true	2021-06-10 18:18:50.941208	t
97	97	70 avenue Charles de Gaulle	17620	SAINT AGANT	\N	true	2021-06-10 18:18:50.957198	t
101	101	47 rue Gambetta	17412	SAITN JEAN ANGELY	\N	true	2021-06-10 18:18:58.146097	t
102	102	60 rue des Forges	44330	VALLET	\N	true	2021-06-10 18:18:58.164082	t
103	103	28 ure Raymond Poincaré	85000	LA ROCHE SUR YON	\N	true	2021-06-10 18:18:58.183073	t
104	104	4 rue Neuve des Remparts	16100	COGNAC	\N	true	2021-06-10 18:18:58.199064	t
105	105	1 avenue de la Plage	85470	BRETIGNOLLES SUR MER	\N	true	2021-06-10 18:18:59.789155	t
106	106	26 boulevard du Nord	85470	BRETIGNOLLES SUR MER	\N	true	2021-06-10 18:18:59.806144	t
107	107	66 avenue d'Orouët	85160	SAINT JEAN DE MONTS	\N	true	2021-06-10 18:19:01.129391	t
108	108	11 rue du Général de Gaulle	44560	PAIMBOEUF	\N	true	2021-06-10 18:19:09.177793	t
109	109	274 route de Clisson	44120	VERTOU	\N	true	2021-06-10 18:19:09.199779	t
110	110	38 rue Gargoulleau	17000	LA ROCHELLE	\N	true	2021-06-10 18:19:10.559004	t
111	111	144 Boulevard de Doulon	44300	NANTES	\N	true	2021-06-10 18:19:12.909962	t
112	112	8 Allée des Embruns	44250	SAINT BREVIN	\N	true	2021-06-10 18:19:12.955937	t
113	113	68 avenue La Fayette	17300	ROCHEFORT SUR MER	\N	true	2021-06-10 18:19:45.148546	t
114	114	27 rue du Maréchal Joffre	85000	LA ROCHE SUR YON	\N	true	2021-06-10 18:19:54.128416	t
115	115	2 rue Aristide Briand	85360	LA TRANCHE SUR MER	\N	true	2021-06-10 18:19:58.223135	t
116	116	1 Place de la Liberté	85520	JARD SUR MER	\N	true	2021-06-10 18:19:58.250119	t
117	117	3 Quai de la République	17100	SAINTES	\N	true	2021-06-10 18:19:58.277103	t
118	118	38 rue du 8 Mai 1945	33290	LUDON	\N	true	2021-06-10 18:20:01.326567	t
119	119	69 avenue Gambetta	17104	SAINTES	\N	true	2021-06-10 18:20:03.290448	t
120	120	Place Mondesir	33200	BORDEAUX CAUDERAN	\N	true	2021-06-10 18:20:05.830995	t
121	121	18 Avenue Guy Celerier	33138	TAUSSAT LANTON	\N	true	2021-06-10 18:20:05.867973	t
122	122	1 Avenue de la Libération	33700	MERIGNAC	\N	true	2021-06-10 18:20:05.930939	t
123	123	31 Avenue de la Libération	33110	LE BOUCAT	\N	true	2021-06-10 18:20:06.929371	t
124	124	5 avenue André Maginot	37100	TOURS	\N	true	2021-06-10 18:20:10.087565	t
125	125	17 bis rue Georges Clémenceau	85007	LA ROCHE SUR YON	\N	true	2021-06-10 18:20:24.786936	t
126	126	30 Promenade Amiral Lafargue	85105	LES SABLES D'OLONNE CEDEX	\N	true	2021-06-10 18:20:31.586982	t
127	127	46 bis rue de l'Océan	85560	LONGEVILLE SUR MER	\N	true	2021-06-10 18:20:32.403515	t
128	128	CC des Pyramides	85270	SAINT HILAIRE DE RIEZ	\N	true	2021-06-10 18:20:34.191498	t
129	129	13 Bd Guist'hau	44000	NANTES	\N	true	2021-06-10 18:20:35.193922	t
130	130	5 rue de Nantes	85600	SAINT HILAIRE DE LOULAY	\N	true	2021-06-10 18:20:42.406897	t
131	131	45 Promenade Clémenceau	85105	LES SABLES D'OLONNE CEDEX	\N	true	2021-06-10 18:20:42.444876	t
132	132	92 rue Gambetta	17200	ROYAN	\N	true	2021-06-10 18:20:44.275828	t
133	133	7 avenue Pasteur	17640	VAUX SUR MER	\N	true	2021-06-10 18:20:44.299817	t
134	134	1 avenue Jacques Cartier	77600	BUSSY SAINT GEORGES	\N	true	2021-06-10 18:20:45.95287	t
135	135	40 rue Saint Yon	17000	LA ROCHELLE	\N	true	2021-06-10 18:20:55.163642	t
136	136	4 Quai Duperre	17000	LA ROCHELLE	\N	true	2021-06-10 18:20:55.197622	t
137	137	51 avenus de L'Estacade	85550	LA BARRE DE MONTS	\N	true	2021-06-10 18:21:00.525578	t
138	138	152 Boulevard Aristide Briand	85000	LA ROCHE SUR YON	\N	true	2021-06-10 18:21:00.563559	t
139	139	31 Boulevard Jean Rose	77100	MEAUX	\N	true	2021-06-10 18:21:02.499451	t
140	140	13 rue du Maréchal Joffre	85000	LA ROCHE SUR YON	\N	true	2021-06-10 18:21:05.547708	t
141	141	15 rue du Pont aux Foulons	35000	RENNES	\N	true	2021-06-10 18:21:18.65335	t
142	142	105 rue de Maréchal Joffre	85000	LA ROCHE SUR YON	\N	true	2021-06-10 18:21:20.503299	t
143	143	17 RUE PROUDHON	93210	SAINT DENIS	\N	true	2021-06-10 18:21:23.146784	t
144	144	1 PLACE DE LA MOTTE	44110	CHATEAUBRIANT	\N	true	2021-06-10 18:21:23.170771	t
145	145	42 rue Georges Clémenceau	85150	LA MOTHE ACAHRD	\N	true	2021-06-10 18:21:28.85085	t
146	146	37 RUE DE AL PAIX	44390	NORT SU ERDRE	\N	true	2021-06-10 18:21:28.876833	t
147	147	5 rue du Chateau	85440	TALMONT SAINT HILAIRE	\N	true	2021-06-10 18:21:28.892826	t
148	148	8 rue de la Foret	35300	FOUGERES	\N	true	2021-06-10 18:21:28.92081	t
149	149	3 rue du Général Malet	85202	FONTENAY LE COMTE	\N	true	2021-06-10 18:21:29.756331	t
150	150	22 rue Pierre Martinet	53204	CHATEAU GONTIER	\N	true	2021-06-10 18:21:29.820296	t
151	151	11 rue Louis Nicole	29470	PLOUGASTEL DAOULAS	\N	true	2021-06-10 18:21:30.646822	t
152	152	74 avenue Robert Buron	53009	LAVAL Cedex	\N	true	2021-06-10 18:21:30.668812	t
153	153	1 rue des Salorges	44100	NANTES	\N	true	2021-06-10 18:21:30.690798	t
154	154	3 rue de la Mairie	29470	PLOUGASTEL DAOULAS	\N	true	2021-06-10 18:21:30.715788	t
155	155	2 rue Paré	44010	NANTES	\N	true	2021-06-10 18:21:31.660981	t
156	156	33 Boulevard Soférino	35000	RENNES	\N	true	2021-06-10 18:21:33.42297	t
157	157	36 rue de Paris	53000	LAVAL	\N	true	2021-06-10 18:21:38.543481	t
158	158	6 COurs Raphaël Binet	35043	RENNES Cedex	\N	true	2021-06-10 18:21:38.558472	t
159	159	40 rue de L'aiguillon	29200	BREST	\N	true	2021-06-10 18:21:38.580459	t
160	160	33 AVENUE DE SAINT CLOUD	78000	VERSAILLES	\N	true	2021-06-10 18:21:42.049476	t
164	164	22 reu du Chapeau Rouge	29000	QUIMPER	\N	true	2021-06-10 18:21:43.833458	t
166	166	1 rue Florence Arthaud	17137	NIEUL SUR MER	\N	true	2021-06-10 18:21:45.670411	t
167	167	30 rue de l'Odet	29170	FOUESNANT	\N	true	2021-06-10 18:21:45.690401	t
168	168	20 Moulin du Pont	29170	PLEUVEN	\N	true	2021-06-10 18:21:45.719382	t
169	169	66 Avenus du Général Leclerc	72000	LE MANS	\N	true	2021-06-10 18:21:47.49137	t
171	171	4 Quai de l'Odet	29000	QUIMPER	\N	true	2021-06-10 18:21:47.570323	t
161	161	11 Place de la Libération	29480	LE RELECQ KERHUON	\N	true	2021-06-10 18:21:42.072465	t
162	162	1- rue de l'AncienEvêché	53000	LAVAL	\N	true	2021-06-10 18:21:42.089453	t
163	163	89 avenue Robert Buron	53009	LAVAL Cedex	\N	true	2021-06-10 18:21:42.895996	t
165	165	8 bis Place Carnot	35300	FOUGERES	\N	true	2021-06-10 18:21:43.878434	t
170	170	200 rue de la Petite Palud	29800	LANDERNEAU	\N	true	2021-06-10 18:21:47.52535	t
172	172	3 avenue du Président Wilson	41000	BLOIS	\N	true	2021-06-10 18:21:50.850456	t
173	173	12 Place de l'Eglise	22600	LOUDEAC	\N	true	2021-06-10 18:21:55.120014	t
174	174	1 Allée de Brntal	22605	LOUDEAC	\N	true	2021-06-10 18:22:00.7428	t
175	175	2 rue de Douves	35601	REDON Cedex	\N	true	2021-06-10 18:22:00.788776	t
176	176	28 Boulevard de la Liberté	35000	RENNES	\N	true	2021-06-10 18:22:00.819755	t
177	177	11 rue de Paris	91120	PALAISEAU	\N	true	2021-06-10 18:22:00.848738	t
178	178	2 Boulevard du Commandant Charcot	17440	AYTRE	\N	true	2021-06-10 18:22:00.883719	t
179	179	23 avenue Paul Vaillant Coututrier	94400	VITRY SUR SEINE	\N	true	2021-06-10 18:22:01.776209	t
180	180	7 rue de la Porte	29000	BREST	\N	true	2021-06-10 18:22:01.812191	t
181	181	280 rue de Paris	91120	PALAISEAU	\N	true	2021-06-10 18:22:04.880621	t
182	182	2 rue Verdière	17000	LA ROCHELLE	\N	true	2021-06-10 18:22:06.320079	t
183	183	10 rue Colbert	29200	BREST	\N	true	2021-06-10 18:22:06.371054	t
184	184	26 Quai Duguay Trouin	35000	RENNES	\N	true	2021-06-10 18:22:07.538384	t
185	185	13 rue Roger Salengro	94450	LIMEIL BREVANNES	\N	true	2021-06-10 18:22:07.568371	t
186	186	33 rue du Général Leclerc	94000	CRETEIL	\N	true	2021-06-10 18:22:07.619339	t
187	187	366 Ter rue de Vaugirard	75015	PARIS	\N	true	2021-06-10 18:22:07.655316	t
188	188	37 rue Audry Puyravault	17300	ROCHEFORT	\N	true	2021-06-10 18:22:07.6833	t
189	189	1 rue Duguesclin	53100	MAYENNE	\N	true	2021-06-10 18:22:10.846496	t
190	190	1 rue du Scorff	35700	RENNES	\N	true	2021-06-10 18:22:10.92145	t
191	191	19 rue de Chartres	94410	DOURDAN	\N	true	2021-06-10 18:22:11.900892	t
192	192	10 Place Leperdit	56300	PONTIVY	\N	true	2021-06-10 18:22:12.835358	t
193	193	26 avenue de la Libération	91130	RIS ORANGIS	\N	true	2021-06-10 18:22:12.859344	t
194	194	77 bis avenue de la République	44600	SAINT NAZAIRE	\N	true	2021-06-10 18:22:13.859775	t
195	195	15 rue Monselet	44000	NANTES	\N	true	2021-06-10 18:22:13.89975	t
196	196	99 bis avenue de la République	44600	SAINT NAZAIRE	\N	true	2021-06-10 18:22:15.779678	t
197	197	7 rue Nationale	85110	CHANTONNAY	\N	true	2021-06-10 18:22:16.735135	t
198	198	20 rue Amiral Linois	29000	BREST	\N	true	2021-06-10 18:22:16.769112	t
199	199	71  rue Jean Jaurès	44600	SAINT NAZAIRE	\N	true	2021-06-10 18:22:20.077089	t
200	200	30 Route de Vannes	44160	PONCHATEAU	\N	true	2021-06-10 18:22:30.32424	t
201	201	92 rue des Entrepreneurs	75015	PARIS	\N	true	2021-06-10 18:22:31.264698	t
202	202	16 rue Aristide Brillant	44400	REZE	\N	true	2021-06-10 18:22:35.964012	t
203	203	6 RUE DU MARECHAL FOCH	77400	THORIGNY SUR MARNE	\N	true	2021-06-10 18:22:35.998992	t
204	204	2 rue HARROUYS	44470	CARQUEFOU	\N	true	2021-06-10 18:22:36.907478	t
205	205	6 Place de la Mairie	35490	SENS DE BRETAGNE	\N	true	2021-06-10 18:22:36.937458	t
206	206	280 rue Rnest Hemingway	29200	BREST	\N	true	2021-06-10 18:22:38.7864	t
207	207	12 rue du Bois d'Amour	29200	BREST	\N	true	2021-06-10 18:22:39.675895	t
208	208	13 rue Georges Clémenceau	29400	LANDIVISIAU	\N	true	2021-06-10 18:22:42.989614	t
209	209	25 avenue Foch	29401	LANDIVISIAU	\N	true	2021-06-10 18:22:43.0106	t
210	210	8 rue Danton	29200	BREST	\N	true	2021-06-10 18:22:51.082507	t
211	211	7 rue Louis Blanc	44200	NANTES	\N	true	2021-06-10 18:22:51.209436	t
212	212	9 rue du Bourgneuf	29300	QUIMPERLE	\N	true	2021-06-10 18:22:58.164725	t
213	213	9 avenue Ernest Chevalier	44730	SAINT MICHEL CHEF CHEF	\N	true	2021-06-10 18:22:59.272095	t
214	214	4 Place de la Libération	56100	LORIENT	\N	true	2021-06-10 18:23:02.247397	t
215	215	71 rue d'Orléans	45380	LA CHAPELLE SAINT MESMIN	\N	true	2021-06-10 18:23:07.390458	t
216	216	69 rue du Landreau	44300	NANTES	\N	true	2021-06-10 18:23:07.426435	t
217	217	12 rue Paul Doumer	85000	LA ROCHE SUR YON	\N	true	2021-06-10 18:23:07.459417	t
218	218	2 Place du Général Lecmerc	29870	LANNILIS	\N	true	2021-06-10 18:23:07.487401	t
219	219	40 Quai du Léon	29800	LANDERNEAU	\N	true	2021-06-10 18:23:07.529377	t
220	220	8 rue du Dourjacq	29200	BREST	\N	true	2021-06-10 18:23:07.562358	t
221	221	5 avenue André Maginot	37100	TOURS	\N	true	2021-06-10 18:23:07.597343	t
222	222	38 rue Amiral Linois	29200	BREST	\N	true	2021-06-10 18:23:10.551699	t
223	223	11 rue Esnault des Châtelets	44200	NANTES	\N	true	2021-06-10 18:23:10.611666	t
224	224	15 AVENUE DU MARECHAL GALLIENI	94340	JOINVILLE LE PONT	\N	true	2021-06-10 18:23:16.622347	t
225	225	35 RUE DU COCHON DUVIVIER	17300	ROCHEFORT	\N	true	2021-06-10 18:23:16.654324	t
226	226	278 rue Jean Jaures	29200	BREST	\N	true	2021-06-10 18:23:17.635761	t
227	227	84 Avenue Louis Joseph Soulas	45800	SAINT JEAN DE BRAYE	\N	true	2021-06-10 18:23:17.682736	t
228	228	20 rue Maupertuis	29200	BREST	\N	true	2021-06-10 18:23:19.509692	t
229	229	60 rue des Forges	44330	VALLET	\N	true	2021-06-10 18:23:19.535677	t
230	230	2 rue de la Tourelle	44320	SAINT PERE EN REETZ	\N	true	2021-06-10 18:23:21.544529	t
231	231	11 rue Porte Coté	41000	BLOIS	\N	true	2021-06-10 18:23:31.13757	t
232	232	Route de Rennes	44700	ORVAULT	\N	true	2021-06-10 18:23:36.122722	t
233	233	13 AVENUE PAUL DOUMER	94360	GOURNAY SUR MARNE	\N	true	2021-06-10 18:23:36.228662	t
234	234	99 avenue du Général de Gaulle	49120	CHEMILLE EN ANJOU	\N	true	2021-06-10 18:23:45.868155	t
235	235	3 rue Victor Hugo	44404	REZE	\N	true	2021-06-10 18:23:45.904135	t
236	236	67 Place Travot	49319	CHOLET CEDEX	\N	true	2021-06-10 18:23:45.940119	t
237	237	nan	nan	nan	\N	true	2021-06-10 18:23:45.972095	t
238	238	1 Place du Chardonnet	37000	TOURS	\N	true	2021-06-10 18:23:47.241371	t
239	239	34 rue Nationale	37250	MONTBAZON	\N	true	2021-06-10 18:23:49.308189	t
240	240	10 BOULEVARD HENRI ARNAULT	49100	ANGERS	\N	true	2021-06-10 18:23:50.603449	t
241	241	27 avenue Duret	49260	MONTREUIL BELLAY	\N	true	2021-06-10 18:23:51.566902	t
242	242	10 rue Bannier	45000	ORLEANS	\N	true	2021-06-10 18:23:54.275352	t
243	243	22 Place du Vieux Marché	45000	ORLEANS	\N	true	2021-06-10 18:23:54.308342	t
244	244	4 bis rue de la Grise	49400	SAUMUR	\N	true	2021-06-10 18:23:55.370729	t
245	245	1 Boulevard du Saumon	45150	JARGEAU	\N	true	2021-06-10 18:23:55.422697	t
246	246	13 rue de la Chapelle Saint Cosme	37370	BEAUMONT LOUESTAULT	\N	true	2021-06-10 18:24:02.73852	t
247	247	35 rue Marcel Vignaud	37420	AVOINE	\N	true	2021-06-10 18:24:07.37287	t
248	248	16 avenue André Maginot	37100	TOURS	\N	true	2021-06-10 18:24:07.407855	t
249	249	4 rue Gambetta	53200	CHATEAU GONTIER	\N	true	2021-06-10 18:24:08.585177	t
250	250	10 Grand'rue	79250	NUEIL LES AUBIERS	\N	true	2021-06-10 18:24:10.923842	t
251	251	11 rue de Clon	49000	ANGERS	\N	true	2021-06-10 18:24:10.970818	t
252	252	44 avenue de l'Europe	49220	LE LION D'ANGERS	\N	true	2021-06-10 18:24:11.011793	t
253	253	6 Place de Gaulle	85300	CHALLANS	\N	true	2021-06-10 18:24:14.348887	t
254	254	24 AVENUE CAMUS	44000	NANTES	\N	true	2021-06-10 18:24:15.671131	t
255	255	37 RUE NERICAULT DESTOUCHES	37000	TOURS	\N	true	2021-06-10 18:24:17.77793	t
256	256	29 boulevard Gaston DUMESNIL	49100	ANGERS	\N	true	2021-06-10 18:24:17.857881	t
257	257	33 RUE DESNOUETTES	75015	PARIS	\N	true	2021-06-10 18:24:24.356169	t
258	258	12 RUE DES FRÈRES GUÉRAUD	44116	VIEILLEVIGNE	\N	true	2021-06-10 18:24:27.031646	t
259	259	30 rue Fortuny	75017	PARIS	\N	true	2021-06-10 18:24:27.118593	t
260	260	1390 RUE DE L'EGLISE	62850	SANGHEN	\N	true	2021-06-10 18:24:27.178559	t
261	261	49 AVENUE THIERS	33100	BORDEAUX	\N	true	2021-06-10 18:24:34.779912	t
262	262	3 RUE DE L'HOTEL DE VILLE	79100	THOUARS	\N	true	2021-06-10 18:24:44.040619	t
263	263	15 BOULEVARD PIERRE LANDAIS	35500	VITREE	\N	true	2021-06-10 18:25:42.896489	t
\.


--
-- Data for Name: suivi_client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suivi_client (id, client, responsable, commentaire, date_creation, date_modif, visibility) FROM stdin;
1	1	8	23/05/2020 XDT mise à jour et contrôle  29/03/2021 CHM Mise à jour adresse mail, MAJ extranet effectuée	2021-06-10 18:17:51.372617	\N	t
2	11	6	08/10/2020 XDT mise à jour nouvelle adresse siège administratif et libellé nom de l'agence\n23/05/2020 XDT mise à jour et contrôle\n09/10/2020 SERVICE COMPTABILITE : Information prise en compte\n12/10/2020 TECH ECN / Modification donneur d'ordre dans Back Office	2021-06-10 18:18:01.383907	\N	t
3	16	36	10/10/19 CHM mise à jour client envoie mail\n23/05/2020 XDT mise à jour INACTIF ARRET DE COLLABORATION suite détournement client MAFAT	2021-06-10 18:18:06.771827	\N	t
4	23	8	23/05/2020 XDT mise à jour client en arrêt de collaboration suite fin 2019	2021-06-10 18:18:13.634907	\N	t
5	32	0	XDT: suite poINT CA dernier edl du 22/07/2017	2021-06-10 18:18:22.429885	\N	t
6	46	8	02/10/2019 CHM / mise à jour du client\n23/05/2020 XDT mise à jour AS	2021-06-10 18:18:35.237603	\N	t
7	49	36	28/04/2019 : XDT mise à jour extranet avec prix et agent rattaché  02/10/2019 CHM mise à jour client\n23/05/2020 XDT mise à jour statut du client / mise en inactif suite fin d'année 2019	2021-06-10 18:18:38.079979	\N	t
8	51	8	XDT : fin de la collaboration suite dépard de la gestionnaire en titre / sa remplaçante a décidé de travailler avec Constaimmo car prix moins chère	2021-06-10 18:18:39.800995	\N	t
9	62	36	02/10/19 CHM/ mise à jour du client\n23/05/2020 XDT mise à jour statut du client / mise en inactif suite fin d'année 2019	2021-06-10 18:18:50.129674	\N	t
10	64	8	CHM/14/10/19 Mise à jour client , nouvelle proposition tarifaire envoyé pour re déclencher client arreté depuis 1 an	2021-06-10 18:18:51.819708	\N	t
11	69	5	23/05/2020 XDT mise à jour et contrôle	2021-06-10 18:18:56.31614	\N	t
12	70	5	23/05/2020 XDT mise à jour et contrôle	2021-06-10 18:18:57.388527	\N	t
13	84	8	25/01/2021 CHM mise à jour MDP	2021-06-10 18:19:13.04089	\N	t
14	104	8	26/09/19 CHM mise à jour client	2021-06-10 18:19:35.174242	\N	t
15	107	8	19/11/2019 XDT msie à jour complète du client suite rachat par M ET MME CHAEREYRE  les nouveaux responsables qui change aussi l'enseigne pour devenir GUY HOQUET / mise à jour de l'extranet et des contacts	2021-06-10 18:19:38.036609	\N	t
16	110	7	23/05/2020 XDT mise à jour et contrôle 28/05/2020 CHM Fichier mis à jour, MAJ extranet également.	2021-06-10 18:19:40.967937	\N	t
17	118	5	03/06/2020 CHM contact pris mise à jour,extranet également.nouvelle resp gestion .23/06/20 Contact et mise à jour , redac nouvelle propos pour relance partenariat	2021-06-10 18:19:49.401116	\N	t
18	134	6	XDT mise à jour du client avec changement d'enseigne et reprise de l'activité	2021-06-10 18:20:06.996331	\N	t
19	143	36	23/02/2020 XDT mise à jour INACTIF ARRET DE COLLABORATION suite détournement client MAFAT	2021-06-10 18:20:15.012516	\N	t
20	147	8	09/04/2019  création accès salarié de l'agence\n23/05/52020 XDT mise à jour du client AS et client inactif suite problème interne in devrait reprendre dans quelques mois	2021-06-10 18:20:18.606466	\N	t
21	148	8	02/10/19 CHM mail envoyer pour mise à jour\n23/05/2020 XDT mise à jour AS	2021-06-10 18:20:19.399014	\N	t
22	149	8	XDT : le cabinet a été vendu il faut voir avec le repreneur	2021-06-10 18:20:20.290502	\N	t
23	152	8	23/05/2020 XDT contrôle et mise à jour client / en arrêt collaboration suite détournement client par MAFAT	2021-06-10 18:20:22.912006	\N	t
24	153	5	23/05/2020 XDT contrôle et mise à jour  changement AP en accord avec AS à partir du 01/05/2020 AP ALS	2021-06-10 18:20:23.806496	\N	t
25	155	65	23/05/2020 XDT mise à jour / arrêt de collaboration suite mauvaise gestion AS COTTIN	2021-06-10 18:20:26.075711	\N	t
26	164	36	23/02/2020 XDT mise à jour INACTIF ARRET DE COLLABORATION suite détournement client MAFAT	2021-06-10 18:20:34.255459	\N	t
27	165	8	20/09/19 CHM/ suite contact,Proposition renvoyée ce jour pour signature et redémarrage fin du mois de septembre avec login et MDP	2021-06-10 18:20:35.275878	\N	t
28	168	8	23/05/2020 XDT mise à jour / arrêt de collaboration suite détournement client MAFAT	2021-06-10 18:20:38.186212	\N	t
29	169	36	23/02/2020 XDT mise à jour INACTIF ARRET DE COLLABORATION suite détournement client MAFAT	2021-06-10 18:20:39.089696	\N	t
30	172	5	23/05/2020 XDT mise à jour et contrôle : changement AP pour ALS à partir du 01/05/2020	2021-06-10 18:20:41.57128	\N	t
31	186	0	XDT / Même client que guy hoquet AUTEUIL	2021-06-10 18:20:53.564555	\N	t
32	198	5	XDT devenu AGENCE L'ADRESSE LES HERBIERS GESTION	2021-06-10 18:21:04.714186	\N	t
33	200	8	XDT nous avons réalisé des rdv edl suite collabotaion de EURIGEST avec L'ADRESSE VAL EUROPE afin de faire des rdv sur le 77	2021-06-10 18:21:06.381233	\N	t
34	205	8	01/05/2019 XDT mise à jour tarif  sur même grille que BUSSAT\n03/10/2019 XDT mise à jour adresse mail de la gestion  site demande de l'agence  04/10/19 CHM mise à jour client mail services Amexpert envoyé\n23/05/2020 XDT arrêt de collaboration suite nombreuse erreurs de gestion des agents suspicion détournement par MAFAT	2021-06-10 18:21:10.635804	\N	t
35	206	7	23/05/2020 XDT contrôle et mise à jour\n02/06/2020 CHM mise à jour client effectuée, MAJ extranet également.	2021-06-10 18:21:11.564274	\N	t
36	215	7	23/05/2020 XDT cpntrôle et mise à jour\n02/06/2020 CHM mise à jour client effectuée, MAJ extranet également. 23/02/2021 CHM Mise à jour tarif un local commercial	2021-06-10 18:21:19.54584	\N	t
37	222	7	CHM/mise à jour de la fiche client , merci de me communiquer login et MDP. CHM/ Mise à jour nouvelle gestionnaire remplaçant Mme Goron MAJ extranet	2021-06-10 18:21:25.952512	\N	t
38	223	7	23/05/2020 XDT cpntrôle et mise à jour 28/05/2020 CHM mise à jour effectuée. MAJ extranet également	2021-06-10 18:21:26.91396	\N	t
39	228	5	14/10/2020 XDT Mise à jour agenr référent suite réception mail ALS ( pdf mail en pièce jointe )\nACR sur la client BKA à partir des réalisation du 01/11/2020 \n03/10/2020 ECN Mise à jour provisoire pour début activité 09/10/2020	2021-06-10 18:21:31.721942	\N	t
40	229	8	23/05/2020 XDT mise à jour sur arrêt de collaboration suite dépôt de bilan	2021-06-10 18:21:32.496499	\N	t
41	232	8	Nouvelle proposition par GD le 22/803/18	2021-06-10 18:21:35.149418	\N	t
42	233	8	Nouvelle proposition par GD le 22/803/19	2021-06-10 18:21:35.977945	\N	t
43	242	65	23/05/2020 XDT mise à jour fiche en arrêt de collaboration suite mauvaise gestion AS COTTIN	2021-06-10 18:21:43.951393	\N	t
44	244	8	23/05/2020 XDT mise à jour AS	2021-06-10 18:21:45.764355	\N	t
45	250	8	23/05/2020 XDT mise à jour AS	2021-06-10 18:21:53.338028	\N	t
46	262	8	26/09/19 CHM mise à jour client\n23/05/2020 XDT mise à jour de la fiche : partie gestion  racheté par Cabinet Fredelion	2021-06-10 18:22:04.923591	\N	t
47	267	65	23/05/2020 XDT mise à jour fiche en arrêt de collaboration suite mauvaise gestion AS COTTIN	2021-06-10 18:22:10.990411	\N	t
48	270	8	23/05/2020 XDT mise à jour et contrôle de la fiche client / mise à jour AS 03/06/2020 CHM contact pris pour organisation rdv mise à jour effectué	2021-06-10 18:22:13.957717	\N	t
49	272	8	23/05/2020 XDT mise à jour et contrôle de la fiche client  03/06/2020 CHM mise à jour , extranet également et renvoie des accès extranet pour activité ponctuel congés ou saison d'été.	2021-06-10 18:22:15.846637	\N	t
50	281	36	23/02/2020 XDT mise à jour INACTIF ARRET DE COLLABORATION suite détournement client MAFAT	2021-06-10 18:22:27.076095	\N	t
51	282	36	23/02/2020 XDT mise à jour INACTIF ARRET DE COLLABORATION suite détournement client MAFAT	2021-06-10 18:22:28.078518	\N	t
52	283	36	23/02/2020 XDT mise à jour INACTIF ARRET DE COLLABORATION suite détournement client MAFAT	2021-06-10 18:22:28.980004	\N	t
53	287	8	16/07/2019 : XDT Mise à jour extranet avec agent rattaché pour gestion des rdv et AS du client	2021-06-10 18:22:33.157616	\N	t
54	288	8	16/07/2019 : XDT Mise à jour extranet avec agent rattaché pour gestion des rdv et AS du client	2021-06-10 18:22:34.126065	\N	t
55	289	6	16/07/2019 : XDT Mise à jour extranet avec agent rattaché pour gestion des rdv et AS du client	2021-06-10 18:22:35.059532	\N	t
57	296	8	15/07/2019 XDT : mise à jour id et mpd	2021-06-10 18:22:41.976192	\N	t
60	305	8	16/07/2019 : XDT Mise à jour extranet avec agent rattaché pour gestion des rdv et AS du client	2021-06-10 18:22:56.353761	\N	t
61	306	7	16/07/2019 : XDT Mise à jour extranet avec agent  rattaché pour gestion des rdv et AS du client	2021-06-10 18:22:57.322209	\N	t
63	308	8	Client sur 4 départements : 49 / 53 / 44 / 85 pour 1600 EDL par an	2021-06-10 18:22:59.360044	\N	t
56	292	5	16/07/2019 : XDT Mise à jour extranet avec agent rattaché pour gestion des rdv et AS du client	2021-06-10 18:22:37.884916	\N	t
58	301	8	16/07/2019 : XDT Mise à jour extranet avec agent rattaché pour gestion des rdv et AS du client	2021-06-10 18:22:48.634903	\N	t
59	302	8	16/07/2019 : XDT Mise à jour extranet avec agent rattaché pour gestion des rdv et AS du client	2021-06-10 18:22:51.574225	\N	t
62	307	8	16/07/2019 : XDT Mise à jour extranet avec agent  rattaché pour gestion des rdv et AS du client	2021-06-10 18:22:58.256675	\N	t
64	310	8	16/07/2019 : XDT Mise à jour extranet avec agent  rattaché pour gestion des rdv et AS du client	2021-06-10 18:23:02.314358	\N	t
65	318	6	24/05/2020 XDT Suite demande de la responsable service gestion MLLE Bracq, création de 3 accès pour les nouvelles assistantes et 1 accès pour la commerciale Fanny Manokoune	2021-06-10 18:23:10.683625	\N	t
66	328	8	11/10/19 CHM mail service Amexpert envoyé.31/07/2020 CHM/ Nouvelle mise à jour tarification pour relance activité	2021-06-10 18:23:20.325226	\N	t
67	332	6	03/04/2020 XDT création extranet suite de la mise à jour client	2021-06-10 18:23:25.908555	\N	t
68	335	7	CHM/ 7/11/19 mise à jour tarification	2021-06-10 18:23:28.717951	\N	t
69	342	8	XDT création des nouveau accés sur new extranet	2021-06-10 18:23:39.598741	\N	t
70	347	6	XDT >> Création client et extranet	2021-06-10 18:23:44.780776	\N	t
71	348	8	30/04/2019 XDT mise à ajour back office / création de l'agence et mise à jour libellé et logo  20/09/19 CHM  mise à jour client  rdv le 07/11/19 pour point activité	2021-06-10 18:23:46.064044	\N	t
72	350	8	Mise à jour contact du client M Méchineau à quitté l'agence et remplacer par MME GUILLOTEAU CHARLOTTE\nXDT le 27/08/2019 Mise en place nouveau tarif  vu avec CUA	2021-06-10 18:23:48.271781	\N	t
73	360	8	16/07/2020 CHM mise à jour client , renvoie login MDP pour activité pendant les congés d'été.	2021-06-10 18:23:58.985663	\N	t
74	361	8	23/05/2020 XDT mise à jour de la fiche / arrêt de collaboration suite détournement client par MAFAT	2021-06-10 18:24:00.464817	\N	t
75	362	36	24/09/2019 CHM mise à jour client\n23/02/2020 XDT mise à jour INACTIF ARRET DE COLLABORATION suite détournement client MAFAT	2021-06-10 18:24:01.483237	\N	t
76	363	8	Contact client fait via demande via site pour réalisation d'un état des lieux à Marseille pour un inter agence\nLe responsable est un ancien de l'équipe AGENCE ORPI MARCHE	2021-06-10 18:24:02.832466	\N	t
77	364	8	RD : Au 15/07/19 3 constats réalisés : 01/02-19/03-21-03	2021-06-10 18:24:03.973812	\N	t
78	365	36	23/02/2020 XDT mise à jour INACTIF	2021-06-10 18:24:05.156139	\N	t
79	369	8	24/09/2019 XDT suite échange avec Nathalie GIUSTO il faut lui envoyé copie de facture et pas à la compta\n\nPremière prise de contact avec le client via mail à XDT demande de suivi à Nadia le jour même et réception de la proposition et demande de création du client par CMF le 07/02/2019 suivi commercial et technique à charge de CMF	2021-06-10 18:24:09.788492	\N	t
80	370	8	22/10/2019 XDT ai eu contact ce jour avec le gérant de l'agence dont je n'ai pas le nom mais voici le tel 0677074836	2021-06-10 18:24:11.076754	\N	t
81	371	0	Merci de faire les insertions de lignes au dessous de cette ligne	2021-06-10 18:24:12.085179	\N	t
82	372	5	CHM merci d'enregistrer ce client et de communiquer login et MDP	2021-06-10 18:24:13.121587	\N	t
83	373	5	XDT mise à jour des tarifs suite mise en place partenariat  avec l'agence Laforet à ANGERS	2021-06-10 18:24:14.415851	\N	t
84	378	8	Rdv suite prospection terrain	2021-06-10 18:24:20.198545	\N	t
85	379	8	rdv suite prospection terrain	2021-06-10 18:24:21.394862	\N	t
86	380	8	01/05/2019 XDT mise à jour  back office : agence et libellé et logo	2021-06-10 18:24:22.563194	\N	t
87	385	8	Suite contact téléphonique et mail envoyé par l'agence	2021-06-10 18:24:30.223513	\N	t
88	387	0	ETAT DES LIEUX D'UN APPARTEMENT F3 VIDE	2021-06-10 18:24:32.570172	\N	t
89	392	8	Demande de création\n09/04/2019 création du client avec compte extranet\n09/04/2019 XDT création du compte\n28/04/2020 XDT entretien pour point et proposition de prise en charge de 100% du volume edl /proposition tarif moyen de 85 € et mise en place à partir du 01/05/2020	2021-06-10 18:24:38.671691	\N	t
90	396	8	Demande création Identifiants et MdP plateforme 25/06/2020 CHM mise à jour et nouvelle proposition pour relance partenarita	2021-06-10 18:24:46.793048	\N	t
91	397	7	Enregistrement client particulier	2021-06-10 18:24:47.984368	\N	t
92	402	8	23/05/2020 XDT mise à jour AS	2021-06-10 18:24:54.820463	\N	t
93	404	38	19/06/2020 CHM point avec Mme Andre nouvelle proposition envoyé pour relance activité en attente	2021-06-10 18:24:57.290059	\N	t
94	406	8	test pour externalisation sur L'agence de  Rueil \nLe groupe possède 9 agences / responsable gestion MME  RUSIACK Dominique\ngestion2@de-valliere.com  01/03/2021 CHM Mise à jour adresse mail pour réalisation EDL	2021-06-10 18:25:02.314183	\N	t
95	414	8	mIse à jour tarif par XDT	2021-06-10 18:25:11.585374	\N	t
96	421	8	Création suite information de CUA suite recherche le dirgieant serait M OLIVIER DOLICQUE	2021-06-10 18:25:18.683319	\N	t
97	422	8	Création suite information de CUA suite recherche il y a é établissements une agence à LILLE et une agence à Paris	2021-06-10 18:25:19.803679	\N	t
98	424	8	Etat des lieux\n26/07/2019 XDT : mise à jour du numéro de tva intracommunautaire suite réception mail JPM	2021-06-10 18:25:21.882495	\N	t
99	427	8	21/10/2019 XDT création du client particulier sur extranet pour génération code client	2021-06-10 18:25:24.913764	\N	t
100	430	8	CHM/ EDL déja réalisé le 13/09 avec OM papier.\nXDT 18/09/2019  création des accès extranet	2021-06-10 18:25:28.409763	\N	t
101	431	7	CHM/ début d'activité fin sept 2019	2021-06-10 18:25:29.867933	\N	t
102	432	6	XDT 23/09/2019 création du client en statut particulier \nattention travail comme agent co chez RUE DE LA PAIX IMMO	2021-06-10 18:25:30.977299	\N	t
103	433	8	CHM / 10/10/19 Création client , début d'activité au 15 octobre 2019	2021-06-10 18:25:31.983723	\N	t
104	434	7	CHM / EDLS Réalisé le 24/09/19	2021-06-10 18:25:33.249999	\N	t
105	435	7	CHM 15/10/19 EDLS à réaliser le 31/10/19	2021-06-10 18:25:34.481295	\N	t
106	436	7	CHM / 18/10/19 Création client,début d'activité novembre 2019	2021-06-10 18:25:35.581667	\N	t
107	438	7	CHM / 23/10/20 Création client,EDLE le 06/02/2020	2021-06-10 18:25:37.500573	\N	t
108	439	6	29/01/2020 XDT validation avec le client de la facture en récap sur coût moyen décidé	2021-06-10 18:25:38.451031	\N	t
109	440	6	29/01/2020 XDT associée de M PAYEN FRANCK  groupe PROCITY elle s'occupe de la gestion à travers cette société\nvalidation avec le client de la facture en récap sur coût moyen décidé	2021-06-10 18:25:39.481439	\N	t
110	441	6	29/01/2020 XDT validation de l'externalisation complète après la période de test du mois de février\n> possibilité de prendre la solution partage \n> facturation récap à a typologie	2021-06-10 18:25:40.612797	\N	t
111	443	6	29/09/2020 XDT information administrative : siège de l'agence Carquefou sur secteur 44 AS MANDIN mise à jour à compter du 01/10/2020pour commission\n29/09/2020 XDT mise à jour de la nouvelle adresse de l'agence de Carquefou. \n29/09/2020 XDT création des accès de la nouvelle commerciale de l'agence Mlle ARTAUD Stéphanie\n18/08/2020 XDT mise à jour agent ref suite changement d'organisation administrative du client /le contact commercial est XAVIER DETOC avec le directeur des agences M BLANVILLAIN\n04/02/20 XDT création du client et des accès extranet\nce client est en gestion par service gestion LADRESSE LES ARDOISIERES	2021-06-10 18:25:42.936466	\N	t
112	444	8	27/02/2020 CHM création client et des accès extranet pour 1er essai suite signature propos en pièce jointe	2021-06-10 18:25:44.133789	\N	t
113	445	8	10/03/2020 CHM création client et des accès extranet pour Edl le 15/04/2020 suite mail ALS fiche client en pièce jointe	2021-06-10 18:25:45.122221	\N	t
114	446	8	20/03/2020 CHM création client et des accès extranet pour Edls suite mail agence, propos signée en pièce jointe 29/06/2020 CHM creation ID et MDP ag de Cesson sevigne Mme Gauthier Resp Loc	2021-06-10 18:25:46.216189	\N	t
115	447	8	01/04/2020 XDT mise à jour du client	2021-06-10 18:25:48.446914	\N	t
116	449	6	28/04/2020 XDT création du donneur d'ordre back office	2021-06-10 18:25:53.640948	\N	t
117	450	8	07/05/2020 CHM création client et des accès extranet  propos signée en pièce jointe    26/05/2021 CHM mise à jour tarification et tarif comparatif pour relance activité	2021-06-10 18:25:54.714338	\N	t
125	459	0	07/07/2020 CHM création client et des accès extranet Proposition en piéce jointe.Début activité fin juillet 2020\n07/07/2020 ECN Création DO dans Back office / Affectation à BKA en responsabilité ACR	2021-06-10 18:26:04.986466	\N	t
127	461	8	24/07/2020 CHM création client et accès extranet Ordre de mission en pièce jointe.	2021-06-10 18:26:07.868822	\N	t
128	463	8	29/07/2020 CHM création client et des accès extranet Proposition en piéce jointe.Début activité fin juillet 2020	2021-06-10 18:26:10.338205	\N	t
129	464	8	17/08/2020 CHM création client et des accès extranet OM en piéce jointe.\n18/08/2020 ECN création DO 108047	2021-06-10 18:26:11.907309	\N	t
130	465	6	17/08/2020 XDT création des accès extranet et validation du tarif de la prestation pour 150 € / j'ai fais la création du donneur d'ordre	2021-06-10 18:26:12.947714	\N	t
132	467	8	02/09/2020 CHM création client et accès extranet OM en pièce jointe.\n03/09/2020 Tech / Création DO dans Back office 108746	2021-06-10 18:26:15.770317	\N	t
133	468	8	02/10/2020 CHM création client et accès extranet OM en pièce jointe.\n03/10/2020 TECH création DO dans Back office 109790	2021-06-10 18:26:16.77074	\N	t
134	469	8	27/10/2020 CHM creation client  03/11/2020 CHM modification mise à jour adresse mail	2021-06-10 18:26:17.817142	\N	t
135	470	6	09/11/2020 CHM creation client & Extranet particulier OM en pièce jointe\n09/11/2020 TEC Création donneur d'ordre dans back office / Ref 110878	2021-06-10 18:26:19.100271	\N	t
137	472	4	17/12/2020 CHM cration client et des accès extranet Proposition en pièce jointe. Début activité mi janvier 2021\n18/12/2020 ECN Création Donneur d'ordre ref 111728	2021-06-10 18:26:21.084013	\N	t
139	476	6	18/03/2021 CHM / Création client particulier et acces extranet OM signé en pièce jointe\n23/03/2021 ECN/ Création donneur d'ordre directement dans RDV / Agenda annoté	2021-06-10 18:26:25.322358	\N	t
141	478	8	08/05/2021 CHM / Création client particulier et acces extranet OM signé en pièce jointe\n10/05/2021 ECN Création DO dans Back office / REF 115858	2021-06-10 18:26:28.439582	\N	t
118	452	8	16/05/2020 CHM création client et des accès extranet  propos signée en pièce jointe 28/07/2020 CHM mise à jour client pour début activité courant Aout 2020	2021-06-10 18:25:56.666225	\N	t
119	453	8	02/12/2020 CHM mise à jour nouvelle salarié gestionnaire  31/12/2020 CHM mise à jour nouvel accès extranet pour Mme GLOAGEN	2021-06-10 18:25:58.584125	\N	t
120	454	8	16/10/2020 XDT suite rdv poitn du 15/10/2020 mise à jour de l'adresse mail de MLLE MARIE. \n16/05/2020 CHM création client et des accès extranet  propos signée en pièce jointe, début d'activité le 11/08/2020	2021-06-10 18:25:59.678502	\N	t
121	455	8	09/06/2020 XDT création de la fiche / propriétaire qui travail aussi avec l'agence Barbara immobilier	2021-06-10 18:26:01.170647	\N	t
122	456	8	17/06/2020 CHM création client et des accès extranet  OM signée en pièce jointe, EDLS prevu le 23/06/2020	2021-06-10 18:26:02.053144	\N	t
123	457	8	18/06/2020 CHM création client et des accès extranet  OM en pièce jointe accompagné du mail de prise de commande .	2021-06-10 18:26:02.999605	\N	t
124	458	8	23/06/2020 CHM création client et des accès extranet Proposition en piéce jointe.	2021-06-10 18:26:03.93707	\N	t
126	460	7	16/07/2020 CHM création client et accès extranet Ordre de mission en pièce jointe.	2021-06-10 18:26:06.55557	\N	t
131	466	7	18/08/2020 XDT création des accès extranet / le contact commercial reste Xavier Detoc qui à le contact avec le directeur M BLANVILLAIN	2021-06-10 18:26:14.577003	\N	t
136	471	7	11/12/2020 CHM creation client & Extranet particulier propos  en pièce jointe\n12/12/2020 TEC création donneur d'ordre dans Back Office ref 111578	2021-06-10 18:26:20.196875	\N	t
138	474	8	12/01/2021 Création client particulier et accès extranet  OM signés en pièce jointe\n12/01/2021 ECN Création donneur d'ordre back office / Ref 112311	2021-06-10 18:26:23.36548	\N	t
140	477	5	27/04/2021 ECN / Création client particulier et accès Extranet / OM signé en pièce jointe / Création DO dans Back office ref 115462	2021-06-10 18:26:27.421161	\N	t
142	479	8	17/05/2021 ECN / Création client particulier et acces extranet OM signé en pièce jointe / Création DO dans Back office / REF 116030	2021-06-10 18:26:29.630897	\N	t
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

SELECT pg_catalog.setval('public."Client_History_id_seq"', 479, true);


--
-- Name: Client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Client_id_seq"', 479, true);


--
-- Name: Client_negotiateur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Client_negotiateur_id_seq"', 1, false);


--
-- Name: Expert_History_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Expert_History_id_seq"', 83, true);


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

SELECT pg_catalog.setval('public."Mission_id_seq"', 1, false);


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

SELECT pg_catalog.setval('public."Tarifs_id_seq"', 479, true);


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

SELECT pg_catalog.setval('public.suivi_client_id_seq', 142, true);


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

