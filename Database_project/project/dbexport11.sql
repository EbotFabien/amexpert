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
1	107801	CLIENT ACTIF	SARL GIC IMMOBILIER	barbaraimmobiliergic	Madame	barbara	agence@barbaraimmo.fr  / agencebarbara@wanadoo.fr	01 39 16 16 10	379 315 211 00019	2021-06-14 07:02:17.984568	t
2	\N	ARRET COLLABORATION	ADCERTIS v.fouquet@adcertix.fr	\N	pour	jbm luzarches	jacques-bertrand.mery@wanadoo.fr	nan	nan	2021-06-14 07:02:21.122491	t
3	\N	ARRET COLLABORATION	ADCERTIS	\N	pour	jbm beaumont /oise	jbm3beaumont@orange.fr	nan	nan	2021-06-14 07:02:22.106218	t
4	\N	ARRET COLLABORATION	ADCERTIS	\N	pour	jbm ecouen	jbm1.jonvel@wanadoo.fr	nan	nan	2021-06-14 07:02:23.036609	t
5	\N	ARRET COLLABORATION	ADCERTIS	\N	pour	cmp conseil paris 15	cpeltier@lacleimmo.com	nan	nan	2021-06-14 07:02:24.48082	t
6	\N	INACTIF	LAFORET TOLBIAC IMMOBILIER	laforet	Monsieur	girault joel	paris13tolbiac@laforet.com	nan	nan	2021-06-14 07:02:25.283156	t
7	\N	INACTIF / ARRET COLLABORATION	KAPITAL PRESTIGE	\N	Mademoiselle	bui véronique	explorimmoparis@gmail.com	nan	nan	2021-06-14 07:02:26.249396	t
8	\N	ARRET COLLABORATION	LAFORET IMMOBILIER	laforet	.	sas milestar	orange@laforet.com	nan	nan	2021-06-14 07:02:27.143211	t
9	\N	ARRET COLLABORATION	ADCERTIS	\N	pour	cabinet ngc	c.rix@arch-ncg.com	nan	nan	2021-06-14 07:02:27.977254	t
10	\N	ARRET COLLABORATION	BOOK A FLAT	\N	Madame	de fouquieres géraldine	géraldine@book-a-flat.com	nan	nan	2021-06-14 07:02:28.87094	t
31	109330	ARRET DE COLLABORATION	IMMO33 ORPI	orpi	Madame	klotz emmanuelle	immo33orpi@yahoo.fr	557267070	nan	2021-06-14 07:02:53.636417	t
11	1075491	CLIENT ACTIF	SARL LES 3 B - L'ADRESSE ANJOU MAINE	l'adresseanjoumainesarlles3b	Monsieur	blanvillain sebastien	blanvilain.ladresse49@ladresse.com	nan	48062859300075	2021-06-14 07:02:29.671927	t
12	\N	INACTIF	CABINET PORTELLI	orpi	Madame	gustave véronique	gerance@cabinetportelli.fr	nan	nan	2021-06-14 07:02:31.320332	t
13	\N	INACTIF	NEPTUNE IMMOBILIER LAFORET	laforet	Madame	boche catherine	cboche@laforet.com	nan	nan	2021-06-14 07:02:32.486774	t
24	109950	INACTIF	AGENCE COEURET - IMMOBILIER	ccimmobiliergestion	Madame	cochet patricia	vabbou@coeuretimmobilier.com	nan	nan	2021-06-14 07:02:45.527244	t
14	109215	INACTIF	ORPI AGENCE DU MARCHE	orpiagencedumarche	Madame	vilpellet m.l	vilpelletimmobilier@orpi.om	nan	nan	2021-06-14 07:02:33.47697	t
15	\N	ARRET DE COLLABORATION SUITE VENTE	LAFORET IMMOBILIER ALSEVE IMMO	\N	Monsieur	philippe christian	cphilippe@laforet.com	nan	nan	2021-06-14 07:02:34.608093	t
16	109205	INACTIF-ARRET COLLABORATION	NOUVEL ESPACE	nouvelespace	Mademoiselle	cadoret      leruez linda	cadoretlinda@aol.com	01 49 09 04 17	400 951 307 00034	2021-06-14 07:02:35.607384	t
17	109910	REPRENDRE CONTACT	ORPI AGENCE MARTIN	\N	Madame	monnanteuil valérie	agencemartinissy@orpi.com	nan	nan	2021-06-14 07:02:36.654582	t
18	109256	INACTIF	LAFORET IMMOBILIER FRANCONVILLE	laforet	Monsieur	lucas olivier	franconville@laforet.com	134442111	nan	2021-06-14 07:02:38.391226	t
19	109223	INACTIF	AGENCE LE BAIL	\N	Monsieur	le bail	agence.lebail@wanadoo.fr	nan	nan	2021-06-14 07:02:39.258377	t
20	109217	INACTIF / ARRET COLLABORATION	LUXURY HOMES	\N	Monsieur	pires jorges	contact@luxuryhomes.fr	nan	nan	2021-06-14 07:02:40.18984	t
21	109216	ARRET CLIENT SUR VENTE  COMMERCE	EV'IMMO	\N	Madame	villard evelyne	evimmo-orvault@orange.fr	nan	nan	2021-06-14 07:02:41.442897	t
25	109230	ARRET  COLLABORATION	CABINET LUTZ	cabinetlutz	Monsieur	lutz damien	contact@cabinet-lutz.fr	241877050	nan	2021-06-14 07:02:46.622393	t
22	109221	ARRET CLIENT SUR VENTE  COMMERCE	CALYPSO IMMO	calysoimmo	Madame	dubreuil	contact@calypso-immo.fr	160201000	nan	2021-06-14 07:02:43.005724	t
23	109220	INACTIF-ARRET COLLABORATION	PROXIMMONET	proximmonet	Madame	morillon sylvie	gerance@proximmonet.fr	177351907	509 928 511 00054	2021-06-14 07:02:44.435442	t
26	109310	INACTIF	.	\N	Mr et Mme	moreira da silva / dos santos	louislopez77@aol.com	164330865	nan	2021-06-14 07:02:47.617062	t
27	109500	ARRET DE COLLABORATION	LAFORET - AQUI'INVEST 2 SARL	laforet	Monsieur	ridou vincent	villenavedornon@laforet.com\nvridou@laforet.com	556491000	nan	2021-06-14 07:02:48.661838	t
28	109322	INACTIF	A.I.V.B	\N	Monsieur	maillard laurent	laurent@aivn.net	164669090	nan	2021-06-14 07:02:49.755478	t
32	109550	REPRENDRE CONTACT	LAFORET ASF IMMO ANTONY	laforetantony	Madame	jouas barbara	antony@laforet.com	nan	nan	2021-06-14 07:02:55.045502	t
29	109600	ARRET DE COLLABORATION	BR IMMOBILIER	brimmobilier	Monsieur	gavard pierre\nbeillerot cyril	br-immobilier@wanadoo.fr	556900144	nan	2021-06-14 07:02:50.901441	t
30	109452	ARRET DE COLLABORATION	SARL IMMOASSOCIES GESTION	immoassociesgestion	Madame	barret stéphanie	immoassociesgestion@wanadoo.fr	556984545	nan	2021-06-14 07:02:52.239448	t
38	109380	INACTIF	SCI PLM	\N	Monsieur	maillard laurent	laurent@aivb.net	660946392	nan	2021-06-14 07:03:02.542199	t
33	109340	ARRET DE COLLABORATION	LEGENDRE IMMOBILIER	legendreimmobilier	Monsieur	legendre	cabinet.legendre@wanadoo.fr	139315200	nan	2021-06-14 07:02:56.255972	t
34	\N	INACTIF	SEMAGES	\N	Monsieur	maury	adams-scott@bbox.fr	164270424	nan	2021-06-14 07:02:57.653874	t
35	109350	INACTIF	BRILLANT IMMOBILIER	\N	Monsieur	brillant charles	brillant.immobilier@wanadoo.fr	164303050	nan	2021-06-14 07:02:58.921152	t
36	109360	INACTIF	CAP SARL	\N	Madame	castro	cap.sarl@wanadoo.fr	nan	nan	2021-06-14 07:03:00.143677	t
37	109370	INACTIF	SCI CHALAND GIROUST BUSSY	\N	Monsieur	maillard laurent	laurent@aivb.net	660946392	nan	2021-06-14 07:03:01.39543	t
39	109390	INACTIF	SCI PM INVESTISSEMENT	\N	Monsieur	maillard laurent	laurent@aivb.net	660946392	nan	2021-06-14 07:03:04.930256	t
40	109400	INACTIF	ARM - VI	\N	Monsieur	judet de la combe frédéric	frederic@arm-vi.fr	nan	nan	2021-06-14 07:03:06.161648	t
42	109420	INACTIF	CABINET GUILLOUX	cabinetguilloux	Madame	guilloux marie-françoise	cabinetguilloux@free.fr	607512958	nan	2021-06-14 07:03:08.217524	t
41	109410	ARRET DE COLLABORATION	DB IMMO - LAFORET\nLAFORET - DB IMMO	laforet	Madame	carmona mélanie\nsanteri ségolène	mcarmona@laforet.com\nlormont@laforet.com	557800585	nan	2021-06-14 07:03:07.111673	t
43	109430	INACTIF	SOLVIMO	\N	Monsieur	duval eoche	nantes@solvimo.com	662531738	nan	2021-06-14 07:03:09.307762	t
44	109440	INACTIF	AGENCIA	\N	Monsieur	bumba emmanuel	agencia.sarl@wanadoo.fr	164024044	nan	2021-06-14 07:03:10.299569	t
45	110280	ARRET DE COLLABORATION	LAFORET IMMOBILIER SARL RPI	laforetimmobiliersarlrpi	Madame	perrin marianne	mperrin@laforet.com	557874848	nan	2021-06-14 07:03:14.081357	t
46	109470	CLIENT inactif	AMCV - APPARTEMENTS ET MAISONS	amcv-appartementsetmaisons	Madame	pannetier aurore    pannetier philippe	chaville@appartementsetmaisons.fr	01 76 43 14 23	509 243 820 00024	2021-06-14 07:03:17.654396	t
47	109630	ARRET DE COLLABORATION	PORTBAIL IMMOBILIER	\N	Monsieur	vignaud olivier	portbail.cb@portbail-immo.fr	556380000	nan	2021-06-14 07:03:19.734603	t
48	109460	ARRET SUITE VENTE DU COMMERCE	A.D.N. immobilier-  GUY HOQUET	\N	Madame	landon ketty	paris9est@ghpatrimoine.com	nan	nan	2021-06-14 07:03:21.336573	t
76	109730	INACTIF	SARL AGENCE IMMOBILIERE DU LAC	century21adlimmobilier	Madame	gilet micheline	ag2371@century21france.fr	240785512	nan	2021-06-14 07:03:53.938779	t
49	109480	INACTIF	CABINET LEFEVRE ET DUCHARME	cabinetlefevreetducharme	Madame	lefevre florence    lafevre  francoise	gerance@lefevreducharme.com	01 46 05 03 84	785 307 620 00019	2021-06-14 07:03:22.498437	t
50	109490	ARRET DE COLLABORATION	LUZARCHES IMMOBILIER	\N	Monsieur	mansoux michel	luzarches@laforet.com	134712000	nan	2021-06-14 07:03:24.149439	t
51	109510	ARRET  COLLABORATION	AGENCITY	agencity	Madame	greux charlotte	charlotte.greux@agencity.com	164773063	nan	2021-06-14 07:03:25.680694	t
52	109520	INACTIF	CENTURY 21 COMBAULT IMMOBILIER	\N	Monsieur	heng guy	combault.immobilier@century21france.fr	160285165	nan	2021-06-14 07:03:26.914936	t
53	109530	INACTIF	PARTNER IMMOBILIER	\N	Madame	chambrin pascaline	Partner-immobilier@wanadoo.fr	134668787	nan	2021-06-14 07:03:28.118016	t
54	109540	INACTIF	JEP BOIS	\N	Madame	rosey evelyne	nan	nan	nan	2021-06-14 07:03:29.504549	t
55	109560	ARRET DE COLLABORATION	J M IMMOBILIER	\N	Monsieur	joubert alain	jmimmojoubert@cegetel.net	139334141	nan	2021-06-14 07:03:30.711644	t
56	109570	INACTIF	ALBERT 1ER IMMOBILIER	\N	Madame	sineux	info@albert1er-immobilier.fr	nan	nan	2021-06-14 07:03:32.072826	t
57	109580	INACTIF / ARRET COLLABORATION	AGENCE HOTEL DE VILLE	\N	Madame	fortin elodie	ef.ahdv@orange.fr	nan	nan	2021-06-14 07:03:33.601272	t
58	109590	INACTIF	CABINET LATY	\N	Madame	guhur céline	gest1ph1.laty@free.fr\ngest1phl.laty@free.fr	nan	nan	2021-06-14 07:03:34.5955	t
59	109620	ARRET DE COLLABORATION	CENTURY 21 A.S.M	\N	Madame	brochard hélène	ag490@century21france.fr	164208877	nan	2021-06-14 07:03:35.901869	t
60	109610	ARRET DE COLLABORATION	SCI 5 BOULES	\N	Monsieur	gavard pierre	sylvaingavard@yhaoo.fr	nan	nan	2021-06-14 07:03:37.394206	t
61	109630	ARRET DE COLLABORATION	LAFORET CBR	\N	Monsieur	broc christophe	cbroc@laforet.com	nan	nan	2021-06-14 07:03:38.303911	t
69	109662	CLIENT ACTIF	L'ADRESSE LAU DES NAIADES FONTENAY LE COMTE	l'adresse-laudesnaiades	Madame	thibaud-guilbaud	immobilier-sud-vendee@wanadoo.fr	nan	52023191100022	2021-06-14 07:03:46.710548	t
62	109650	INACTIF	ORPI CP IMMO	orpicpimmo	Monsieur	perrin christophe	cperrin.cpimmo@orpi.com\ngestionlocation@cpimmo.fr	01 46 01 53 90	483525887	2021-06-14 07:03:39.210522	t
63	109640	ARRET DE COLLABORATION	.	\N	Madame	mancel pacome	pacome.mancel@styrolution	nan	nan	2021-06-14 07:03:40.255396	t
64	110360	CLIENT inactif	SARL AGENCE LE NY	laforetagenceleny	Madame	mr bertin thomas	colombes@laforet.com	01 49 09 99 11  / 01 42 42 25 62	71201020600019	2021-06-14 07:03:41.216497	t
65	109650	ARRET DE COLLABORATION	LAFORET IBPB	laforetibpb	Madame	de munico estelle	edemunico@laforet.com	556462832	nan	2021-06-14 07:03:42.720616	t
70	109663	CLIENT INACTIF	L'ADRESSE LAU DU MARAIS	l'adresse-chaillelesmarais-laudumarais	Madame	ravon elodie	laudumarais@club-internet.fr	251567257	447696329039	2021-06-14 07:03:47.917006	t
66	109670	INACTIF	CABINET LOGEAIS- ORPI	orpi	Monsieur	logeais jean-philippe	cabinetlogeais@orpi.com	546417668	nan	2021-06-14 07:03:44.105694	t
67	109660	INACTIF	.	\N	Madame et Monsieur	sourdois	info@albert1er-immobilier.fr	nan	nan	2021-06-14 07:03:44.922791	t
68	109661	ARRET DE COLLABORATION	CB CONSEILS	laforet-chambly	Madame	bonet catherine	chambly@laforet-chambly-meru.com	nan	nan	2021-06-14 07:03:45.786434	t
71	109680	INACTIF	ERA AAA IMMOBILIER	eraimmobilier	Monsieur	denman	aaa@erafrance.com	nan	nan	2021-06-14 07:03:48.825201	t
77	109720	ARRET DE COLLABORATION	LD IMMOBIIER	laforetblanquefort	Monsieur	araujo sandrine	lduvert@laforet.com	nan	nan	2021-06-14 07:03:54.745541	t
72	109690	CLIENT INACTIF	VENDIMO	vendimo	Monsieur	barbe olivier	obarbe@vendimo.fr	251059468	nan	2021-06-14 07:03:49.853359	t
73	109840	INACTIF	MARANS IMMOBILIER	maransimmobilier	Monsieur	maitrehut julien	contact@marans-immobilier.com	546678822	nan	2021-06-14 07:03:50.758566	t
81	109740	INACTIF	BLEU MARINE IMMOBILIER	century21bleumarine	Madame	pignon isabelle	i.pignon@century21.fr	251553265	nan	2021-06-14 07:03:58.250289	t
74	109700	ARRET DE COLLABORATION	AGENCE NICOLAS FONTAINE	massonimmobilier	Monsieur	fontaine nicolas	stgilles.huitcinq@orange.frinfo85@massonimmobilier.fr	nan	nan	2021-06-14 07:03:51.723762	t
78	109746	INACTIF	HUIT CINQ GESTION	huitcinqimmobilier	Monsieur	houle fabrice	f.houle@mon-departement-immobilier.comlocation@huitcinq.com	nan	nan	2021-06-14 07:03:55.655062	t
75	109710	ARRET DE COLLABORATION	BUHLER FRANTZ	buhlerfrantz	Monsieur	buhler frantz	bupa@bupa.pro	nan	nan	2021-06-14 07:03:52.742457	t
84	109750	CLIENT ACTIF	ETUDE MAITRE KERAVEC	etudemaitrekeravecnotaire	Madame	legrand sophie	locationgestion.44083@notaires.fr	251740202	nan	2021-06-14 07:04:01.891298	t
79	109745	ARRET  COLLABORATION	MGL - OLONNE SUR MER 85	magestionlocative	Monsieur	houle fabrice	f.houle@ma-gestion-locative.com	nan	nan	2021-06-14 07:03:56.501266	t
82	109750	ARRET  COLLABORATION	OFFICE DE LA PROPRIETE	officedelapropriete	Monsieur	canut jacques	office.propriete@wanadoo.fr	nan	nan	2021-06-14 07:03:59.543435	t
80	109850	ARRET DE COLLABORATIONS UITE VENTE	GTN CONSEILS ET PATRIMOINE	gtnimmobilier	Madame	landon ketty	paris9est@ghpatrimoine.com	660692544	nan	2021-06-14 07:03:57.380118	t
83	190720	ARRET DE COLLABORATION	MGL - IMMO 44	immo44-cielimmobilier	Monsieur	houle fabrice	igautier@quatrequatre.com	nan	nan	2021-06-14 07:04:00.786402	t
85	109760	VEDU A BP IMMOBILIER	HC TRANSACTION	l'adresse-pontaultcombault	Madame	ludmi isabey	ludmi.isabey@ladresse.comlaetitia.caillebotte@ladresse.com	nan	nan	2021-06-14 07:04:02.917079	t
86	109760	INACTIF	SARL IMMOVINS	abciorpigestion	Madame	deloffre knopfer babara	barbaraknopfer@abci13.fr	nan	nan	2021-06-14 07:04:04.961863	t
87	109770	ARRET DE COLLABORATION	MOINET	moinet	Mr et Mme	moinet	fred.moinet@gmail.com\nlacasamoinet@gmail.com	nan	nan	2021-06-14 07:04:06.767467	t
88	109780	ARRET DE COLLABORATION	BUHLER HUGO	buhlerhugo	Monsieur	buhler hugo	huitresenstock@hotmail.fr	nan	nan	2021-06-14 07:04:08.104425	t
89	109790	INACTIF	PYRAULT LAURENT	pyraultlaurent	Monsieur	pyrault laurent	laurent.pyrault@free.fr	nan	nan	2021-06-14 07:04:12.466869	t
90	109800	ARRET DE COLLABORATION	TIKVA IMMOBILIER	tikvaimmobilier	Monsieur	benaroche sholmi	tikvaimmo@gmail.com	nan	nan	2021-06-14 07:04:13.816634	t
91	109810	REPRENDRE CONTACT	JEROME COMBES IMMOBILIER	guyhoquet	Monsieur	combes jerôme	j.combes@guyhoquet.com	nan	nan	2021-06-14 07:04:15.259128	t
92	109820	REPRENDRE CONTACT	AGENCE ULYS PATELY IMMOBILIER	agenceulyspatelyimmobilier	Madame	lemoine liliane	ulyslemoine@free.fr	nan	nan	2021-06-14 07:04:17.663502	t
93	109860	REPRENDRE CONTACT	SBSI - LES PAVES DU 20E	lespavesdu20e	Monsieur	hennel	hennel@lespavesdu20e.fr	646474077	nan	2021-06-14 07:04:18.980454	t
94	109830	ARRETA DE COLLABORATION	MARLERE Jacques	marlerejacques	Monsieur	marlere jacques	jm.marlere@free.fr	nan	nan	2021-06-14 07:04:20.164477	t
95	109900	REPRENDRE CONTACT	SARL RECHERCHE IMMOBILIERE	rechercheimmobiliere	Monsieur	petrus sylvain	petrus@recherche-immobiliere.com	nan	nan	2021-06-14 07:04:21.330602	t
96	109870	ARRET DE COLLABORATION	LAFORET SAINT MEDARD EN JALLES	laforetsaintmedardenjalles	Madame	branchut stéphanie	st-medard-en-jalles@laforet.com	nan	nan	2021-06-14 07:04:22.563498	t
97	109880	INACTIF	nan	citya	Madame	marty audrey	amarty@citya.com	nan	nan	2021-06-14 07:04:23.858391	t
98	109890	INACTIF-ARRET COLLABORATION	MR & MME SENIUTA	\N	Monsieur	seniuta	pseniuta@yahoo.fr	nan	nan	2021-06-14 07:04:25.442617	t
110	109985	CLIENT ACTIF	4 IMMO	l'adresse-4immo	Monsieur	pennanec'h  thierry	nan	02 40 69 15 60	44762160800051	2021-06-14 07:04:39.66093	t
99	109910	REPRENDRE CONTACT	AGENCE MARTIN	agencemartincoteseineorpi	Madame	geultont karine	agmartincoteseine@orpi.com	nan	nan	2021-06-14 07:04:26.323535	t
100	109920	REPRENDRE CONTACT	SRJG GESTION - PARIS EST GESTION SARL	parisestgestion	Madame	garin julie - routaboul sabrina	s.routaboul@peg-immo.fr	175774375	nan	2021-06-14 07:04:27.509505	t
101	109930	INACTIF-ARRET COLLABORATION	ANSELYN Philippe	\N	Monsieur	anselyn philippe	philippeanselyn@sfr.fr	nan	nan	2021-06-14 07:04:29.036684	t
102	109940	INACTIF	.	\N	Monsieur	gibaud robert	nan	nan	nan	2021-06-14 07:04:30.090992	t
103	109931	ARRET DE COLLABORATION	RENAULT Florent	renaultflorent	Monsieur	renault florent	flrenault@free.fr	nan	nan	2021-06-14 07:04:31.37008	t
111	101000	SUSPENDU	ATARAXIA	ataraxia	Madame	\N	nan	nan	nan	2021-06-14 07:04:40.575277	t
104	109960	CLIENT INACTIF	CTII SARL IMMOBILIERE LA TOUR	immobilierelatour	Monsieur	kintgen alexis    m dannay jerome	immolatour@orange.fr     jerome.dannay@wanadoo.fr	01 45 03 30 70	341 681 898 00043	2021-06-14 07:04:32.267303	t
105	109950	ARRET DE COLLABORATION SUITE VENTE	IMMO MAYENNE	immomayenne	Monsieur	bouillier olivier	info@immomayenne.com	nan	nan	2021-06-14 07:04:33.571404	t
130	110130	ARRET DE COLLABORATION	DELTA IMMOBILIER	deltaimmobilier	Monsieur	delage ludovic	ludovic.delage@immovac.frdeltaimmobilier@wanadoo.fr	603678572	nan	2021-06-14 07:04:59.415646	t
106	109970	ARRET  COLLABORATION	IMMO ONLINE	immoonline	Monsieur	wulwik nathaniel	wulwik@gmail.com	nan	nan	2021-06-14 07:04:35.26149	t
112	110010	ARRET DE COLLABORATION	DOMUS AGENCY	laforetimmobilier	Monsieur	alexandre dominique	paris20avron@laforet.com	144648181	nan	2021-06-14 07:04:41.594598	t
107	109761	CLIENT ACTIF	IMMOBILIERE BUSSY GESTION GUY HOQUET SERRIS	guyhoquetserrisimmobilierebussygestion	Madame	chareyre caroline	caroline.chareyre@guyhoquet.com	0160049449	479 270 803 00030	2021-06-14 07:04:36.269465	t
108	1075492	VEDU A 3B ARDOISIERES	FONCIERE ANJOU	l'adresse	Monsieur	vernier esnault	fonciere.anjou@wanadoo.fr	241875525	nan	2021-06-14 07:04:37.185449	t
120	110060	CLIENT INACTIF	L'IMMOBILIERE DU SUD	l'adresse-lachevroliere	Monsieur	chailleux jérôme	jerome.chailleux@hotmail.fr	nan	nan	2021-06-14 07:04:49.312716	t
109	109991	ARRET DE COLLABORATION	MAISONS ET COMPAGNIE	maisonsetcompaganie	Monsieur	miltgen françois	maisonsetcompagnie@orange.fr	241182050	nan	2021-06-14 07:04:38.502479	t
113	110350	ARRET  COLLABORATION	ADRAST IMMOBILIER	adrastimmobilier	Monsieur	adrast emmanuel	eadrast@adrastimmobilier	608271839	nan	2021-06-14 07:04:42.727477	t
114	110020	CLIENT PARTICULIER	.	\N	Monsieur	fougerouse christian	nan	nan	nan	2021-06-14 07:04:43.879562	t
125	110100	ARRET DE COLLABORATION	PLANETE IMMOBILIER	planeteimmobilier	Madame	jore rachele	gestion@planete-immobilier-toulouse.fr	nan	nan	2021-06-14 07:04:54.758411	t
115	110030	CLIENT INACTIF	SARL SHANDRANI	vrignonimmobilier	Monsieur	vrignon michel	michel@vrignon-immobilier.com	nan	nan	2021-06-14 07:04:44.818893	t
121	110070	ARRET DE COLLABORATION	HAMON Antoine	hamonantoine	Monsieur	hamon antoine	antoine.hamon.fr@gmail.com	nan	nan	2021-06-14 07:04:50.155513	t
116	110040	ARRETA DE COLLABORATION	.	sauboy	Mr et Mme	sauboy	martine.sauboy@wanadoo.fr	nan	nan	2021-06-14 07:04:45.913282	t
117	110041	ARRETA DE COLLABORATION	PGI LAFORET	pgilaforet	Madame	de munico estelle	edemunico@laforet.com	nan	nan	2021-06-14 07:04:46.73853	t
118	110080	CLIENT INACTIF	SARL AJC IMMOBILIER ROCHEFORT	ajcimmobilier	Monsieur	lacoste jean christophe / \tpalimpseste	gestion@ajc-rochefort.com	546881717	41351986900023	2021-06-14 07:04:47.618233	t
122	110072	INACTIF	EURL GADEL IMMOBILIER	gadelimmobilier	Madame	gadel carole	gadelimmobilier@orange.fr	nan	nan	2021-06-14 07:04:51.422356	t
119	110100	INACTIF	SARL CITYA IMMOBILIER COTE DE BEAUTE	cityaimmobiliercotedebeaute	Monsieur	ploermel	m.nicolet@citya.com	546051213	nan	2021-06-14 07:04:48.452607	t
128	110120	CLIENT INACTIF	AGENCE CENTRALE SARL	acbi	Monsieur	bouton alain	acbi-vertou-1@orange.fr	02 51 23 68 88	nan	2021-06-14 07:04:57.619288	t
123	110080	ARRETA DE COLLABORATION	BARANGER Thierry	barangerthierry	Monsieur	baranger thierry	drbaranger@yahoo.fr	nan	nan	2021-06-14 07:04:52.558649	t
126	110110	CLIENT INACTIF	BOILEAU IMMOBILIER	boileauimmobilier	Madame	boileau jennifer	boileau.immobilier@wanadoo.fr	nan	nan	2021-06-14 07:04:55.583673	t
124	110090	ARRET  DE COLLABORATION	LALOY Philippe	laloyphilippe	Monsieur	laloy philippe	gestion@planete-immobilier-toulouse.frphilaloy@gmail.com	nan	nan	2021-06-14 07:04:53.554692	t
127	110120	ARRETA DE COLLABORATION	SARL SIBEM	laforetsaintloubes	Madame	pichot virginie\ncaillet elodie	st-loubes@laforet.com	nan	nan	2021-06-14 07:04:56.81626	t
129	110140	ARRET DE COLLABORATION	IMMOVAC	\N	Monsieur	delage ludivic	ludovic.delage@immovac.fr	557520620	nan	2021-06-14 07:04:58.524661	t
131	110160	REPRENDRE CONTACT	JMELI IMMO	guyhoquetparis11voltaire	Monsieur	landzberg	paris11voltaire@guyhoquet.com	140095460	nan	2021-06-14 07:05:00.285127	t
132	110165	REPRENDRE CONTACT	CABINET SIONNEAU IMMOBILIER	cabinetsionneau	Madame	guignard nadine	cabinet@sionneau-immobilier.fr	251370909	42369341500014	2021-06-14 07:05:01.171129	t
133	110150	ARRET DE COLLABORATION	MAUMY PARADE Brigitte	maumyparadebrigitte	Madame	maumy parade brigitte	brigitte.parade@gmail.com	nan	nan	2021-06-14 07:05:02.430629	t
134	110170	REPRENDRE CONTACT	SARL HORIZON	etoileimmobiliere	Madame	porret joubert stéphanie	contact@etoile-immobiliere.com	02 41 39 90 39	79975707500012	2021-06-14 07:05:03.544113	t
135	110075	ARRET  COLLABORATION	SERGIC ANGERS	sergic	Monsieur et Madame	dorchie cecile	ivilleroche@sergic.com	nan	nan	2021-06-14 07:05:04.487901	t
136	110080	CLIENT INACTIF	ABC IMMOBILIER	abcimmobilier	Madame	barbier nathalie et equipe .	nathalie@abc-immobilier-angers.fr et contact@abc-immobilier-angers.fr	nan	nan	2021-06-14 07:05:05.649322	t
137	110090	CLIENT PARTICULIER	.	\N	Monsieur et Madame	guivant yannick et cosson elodie	yannickguivant@gmail.com	nan	nan	2021-06-14 07:05:06.585825	t
158	110320	ARRET DE COLLABORATION	HEKIMIAN Nicolas	hekimiannicolas	Monsieur	hekimian nicolas	nicolashekimian@yahoo.fr	nan	nan	2021-06-14 07:05:26.359347	t
138	110092	REPRENDRE CONTACT	VIVRE ICI	vivireici	Monsieur	trehard emanuel	nan	241800600	nan	2021-06-14 07:05:07.532915	t
139	110180	ARRETA DE COLLABORATION	ACHETER DU NEUF	acheterduneuf	Madame	maumy parade brigitte	contact@acheterduneuf.com	nan	nan	2021-06-14 07:05:08.451951	t
140	\N	REPRENDRE CONTACT	CABINET BERARD	cabinetberard	Monsieur	berard	nan	nan	nan	2021-06-14 07:05:09.391654	t
141	110091	ARRET DE COLLABORATION	BL AGENT	blagent	Monsieur	minelli	m.minelli@bl-agents.fr	677464965	nan	2021-06-14 07:05:10.336464	t
142	110190	ARRET DE COLLABORATION	GEORGE V SARL YAPLUKA	georgevsarlyapluka	Madame	bonnetaz marina	georges5@orange.fr	nan	nan	2021-06-14 07:05:11.289085	t
143	110100	INACTIF-ARRET COLLABORATION	SARL LD IMMOBILIER	laforet	Monsieur	da costa laurent	ldacosta@laforet.com	156950900	nan	2021-06-14 07:05:12.224928	t
144	110110	CLIENT INACTIF	SARL ACTIAL	carquefouimmobilier	Monsieur	rihet christophe	carquefou.immobilier@wanadoo.fr	240526690	nan	2021-06-14 07:05:13.148395	t
145	110200	ARRET DE COLLABORATION	SARL LFI	avisimmobiliersaintloubes	Madame	fline puentes sylvie	stloubes@avis-immobilier.com	556202080	nan	2021-06-14 07:05:14.1395	t
146	110210	ARRET DE COLLABORATION	Groupe BIRAN IMMOBILIER	groupebiranimmobilier	Madame	gessey dany	soulac@biran.fr	608256764	nan	2021-06-14 07:05:14.983234	t
147	110220	INACTIF	SAS BP IMMOBILIER	l'adresse-chatillon	Monsieur	printemps rudy	rudy.printemps@ladresse.com	0147350000	53946287900013	2021-06-14 07:05:16.16506	t
148	110230	CLIENT ACTIF	GUY HOQUET AERISSIMO SARL	guyhoquetaerissimo	Monsieur	bobin gilles	antony@guyhoquet.com	0156451616	45249861100014	2021-06-14 07:05:16.970765	t
149	110240	ARRET  COLLABORATION	Cabinet gestion ISNER	l'adresse-bussysaintgeorges	Madame	isner peggy	gestion@cgi-bussy.com	01 64 66 44 44	nan	2021-06-14 07:05:17.880205	t
150	110250	CLIENT INACTIF	AGILIMMO VENDEE	huitcinqchallans	Monsieur	horel gilles	challans@huitcinq.com	228120366	nan	2021-06-14 07:05:18.698722	t
151	110260	REPRENDRE CONTACT	ACI - AGENCE CONSEILS IMMOBILIER SARL	aciimmobilier	Monsieur	desseaux philippe	aci-immobilier@wanadoo.fr	145462222	nan	2021-06-14 07:05:19.858343	t
152	110262	INACTIF-ARRET COLLABORATION	AURA IMMOBILIER SARL	auraimmobilier	Monsieur	balestra laurent	lbalestra@hotmail.fr	0143626870	nan	2021-06-14 07:05:20.656508	t
153	110270	CLIENT ACTIF	POOL IMMOBILIER SABLAIS	poolimmobiliersablais	Monsieur	vercelletto antoine	locannuelles@poolimmosablais.com	02 51 95 40 54	48738036200011	2021-06-14 07:05:21.629534	t
154	110290	REPRENDRE CONTACT	LOGIC HOME	logichome	Monsieur	laruelle mickaël	logichome.ml@gmail.com	nan	nan	2021-06-14 07:05:22.557624	t
155	110300	ARRET  COLLABORATION	A&G PAUTOUT IMMOBILIER	l'adresse-cabinetpautout	Monsieur	pautout guillaume	gpautout@orange.fr	nan	42185010800018	2021-06-14 07:05:23.390744	t
156	110310	ARRET DE COLLABORATION	BUHLER BERNARD	buhlerbernard	Monsieur	buhler bernard	contact.buhler@gmail.com	nan	nan	2021-06-14 07:05:24.280805	t
157	110340	ARRET DE COLLABORATION SUITE VENTE	EFFIGEST IMMO	effigestimmo	Madame	norguet carole	gestion@effigest-immo.fr	251950753	nan	2021-06-14 07:05:25.463339	t
161	110360	CLIENT ACTIF	CITYA NANT'IMMO	cityanantes	Madame	vancappel sandra	svancappel@citya.com	02 40 48 75 40	nan	2021-06-14 07:05:29.064644	t
162	110332	REPRENDRE CONTACT	GIMCOVERMEILLE CONFLANS	gimcovermeilleconfalans	Madame	mendes marie-josé	mj.mendes@gimcovermeille.com	nan	nan	2021-06-14 07:05:30.043685	t
163	110333	REPRENDRE CONTACT	GIMCOVERMEILLE VOISIN	gimcovermeillevoisin	Madame	festor michèle	michele.festor@gimcovermeille.com	nan	nan	2021-06-14 07:05:31.111185	t
159	110330	ARRET  COLLABORATION	GIMCOVERMEILLE POISSY - CABINET FISSON	gimcovermeillepoissy-cabinetfisson	Madame	francois marion	marion.francois@gimcovermeille.com	130650450	nan	2021-06-14 07:05:27.241135	t
176	110412	CLIENT PARTICULIER	.	.	Madame	journee elisabeth	elisabeth.journee@iadfrance.fr	nan	nan	2021-06-14 07:05:48.692669	t
160	110332	REPRENDRE CONTACT	KB IMMOBILIER SARL	kbimmobilier	Monsieur	rousseau gilles	nathalie.sauguet@century21.fr	153141087	nan	2021-06-14 07:05:28.068424	t
164	110350	INACTIF-ARRET COLLABORATION	CABINET TRAGESIM	\N	Madame	gustave véronique	gerance.tragesim@orange.fr	0141100866	nan	2021-06-14 07:05:32.701295	t
165	110370	CLIENT ACTIF	SAINT AMBROISE IMMOBILIER	laforetsaintambroise	Monsieur	rochon christophe	paris11stambroise@laforet.com	01 47 00 01 00	80207116700018	2021-06-14 07:05:33.646404	t
186	110510	CLIENT INACTIF	SCI DESSOUS LES BERGES	scidessouslesberges	Madame	atlani natacha	natacha.atlani@gmail.com	nan	nan	2021-06-14 07:06:08.820223	t
166	110390	CLIENT INACTIF	ICY IMMOBILIER COURONNE YONNAISE	icyimmobilier	Monsieur	graindorge didier	icyimmobilier@orange.fr	0251987975	nan	2021-06-14 07:05:34.580366	t
177	110430	REPRENDRE CONTACT	BELIMMO	belimmo	Monsieur	garcia jean	beladmin@belimmo.com	nan	nan	2021-06-14 07:05:51.966006	t
167	110380	REPRENDRE CONTACT	CARVEL ET ASSOCIES	carveletassocies	Madame	tauvel laurence	contact@carvelimmo.com	nan	nan	2021-06-14 07:05:36.581878	t
168	110382	INACTIF-ARRET COLLABORATION	SARL MIMAS GESTION	cabinetmimas	Monsieur	hoarau   pierre laurent	info@mimas-gestion.fr	nan	42473973800013	2021-06-14 07:05:37.365507	t
169	110384	INACTIF-ARRET COLLABORATION	CABINET HOARAU MIMAS IMMOBILIER	cabinethoarau	Monsieur	hoarau laurent	gestion@mimas-immobilier.fr	01 53 33 89 40	809763832	2021-06-14 07:05:38.468311	t
178	110440	CLIENT PARTICULIER	.	.	Madame	raye karine	karinerg68@orange.fr	nan	nan	2021-06-14 07:05:53.01638	t
170	110385	ARRET  COLLABORATION	MANDAT&MOI	mandat&moi	Monsieur	monin thomas	thomas.monin@mandatetmoi.fr	659929449	nan	2021-06-14 07:05:39.699373	t
171	110390	REPRENDRE CONTACT	DUPONT ET POISSANT CONSEILS IMMOBILIER	compromisimmobilier	Monsieur	dupont mathieu	mathieu.dupont@compromis-immoblier.fr	nan	nan	2021-06-14 07:05:40.632476	t
172	123490	CLIENT ACTIF	LABEL IMMO 85	l'adresse-labelimmo85	Monsieur	teillol gilles	larochesuryon@ladresse.com	251373808	51092080400026	2021-06-14 07:05:42.342719	t
179	110450	REPRENDRE CONTACT	ADN GESTION TRANSACTION	l'adresse-adngestiontransaction	Monsieur	pequito sylvain	adngestion@ladresse.com	nan	nan	2021-06-14 07:05:55.067648	t
173	110400	REPRENDRE CONTACT	MLY IMMOBILIER	ladhuysimmobilier	Monsieur	diaby	contact@ladhuys.com	nan	nan	2021-06-14 07:05:43.333631	t
174	110405	REPRENDRE CONTACT	SGI 11 S.A.S	eracharonnebastille	Madame	yeung stéphanie	stephanie.yeung@era-charonne.fr	0143707575	79164707600011	2021-06-14 07:05:44.199272	t
187	110520	REPRENDRE CONTACT	CIL ATLANTIQUE	groupecilatlantique	Madame	salle céline	c.salle@cilatlantique.com	nan	nan	2021-06-14 07:06:09.640226	t
175	110410	CLIENT PARTICULIER	.	.	Monsieur	fraikin alexis	alexisfraikin@gmail.com	nan	nan	2021-06-14 07:05:45.391708	t
180	10510	CLIENT ACTIF	CENTRAL IMMOBILIER	centralimmobilierjeremygarcia	Monsieur	garcia jérémy	central@central-immobilier-85.com	0251236888	34969437200039	2021-06-14 07:05:57.540479	t
181	110460	REPRENDRE CONTACT	JB IMMO SAS	guyhoquetjbimmo	Monsieur	gauthier bruno	locparisbastille@guyhoquet.com	nan	nan	2021-06-14 07:05:59.585136	t
192	110560	REPRENDRE CONTACT	MG APARTE	mgaparte	Madame	giordano maria	mgaparte@laposte.net	nan	nan	2021-06-14 07:06:15.286793	t
182	110470	REPRENDRE CONTACT	VIENOT ASSOCIES SARL	immobilieredeboulogne	Monsieur	sirvent-vienot charles6hugues	agencegestion@gmail.com	nan	nan	2021-06-14 07:06:01.763707	t
188	110620	ARRET DE COLLABORATION SUITE VENTE	SARL LES HERBIERS GESTION	sarllesherbiersgestion	Monsieur	comont jean-michel	lesherbiersgestion@orange.fr	0251668061	nan	2021-06-14 07:06:10.991926	t
183	110480	CLIENT PARTICULIER	.	.	Madame	talon catherine	ktmail@sfr.fr	nan	nan	2021-06-14 07:06:02.821108	t
184	110490	REPRENDRE CONTACT	ACCESSIM GESTION	laforetaccessim	Madame	hassani linda	vanveslocations@laforet.com	nan	nan	2021-06-14 07:06:03.759408	t
185	110500	CLIENT PARTICULIER	.	.	Monsieur	amory christian	christian.amory@tremblayhandball.com	nan	nan	2021-06-14 07:06:07.54547	t
189	110530	ARRET  COLLABORATION	FIMOGEST	guyhoquet	Monsieur	hintermeyer	ghchelleslocation@yahoo.fr	0160089999	nan	2021-06-14 07:06:12.084433	t
196	110600	CLIENT PARTICULIER	.	.	Monsieur	benzaki charles	charles.bzk94@gmail.com	nan	nan	2021-06-14 07:06:21.701634	t
190	110540	CLIENT PARTICULIER	.	.	Monsieur	simon laurent	laurent.simon.immobilier@gmail.com	nan	nan	2021-06-14 07:06:13.11068	t
193	110570	CLIENT ACTIF	CITYA NANTES	cityanantes	Madame	vancapel sandra	nan	02 40 48 75 40	nan	2021-06-14 07:06:16.670591	t
191	110550	ARRET DE COLLABORATION SUITE VENTE	MGL - PORTES DE L OCEAN	agenceportedelocean	Madame	ronineau pauline	paulinerobineau@agence-portes-ocean.com	0251307323	nan	2021-06-14 07:06:14.023746	t
194	110580	ARRET  COLLABORATION	ETUDE IMMOBILIERE DE LILLE	etudeimmobilieredelille	Monsieur	neuet didier	contact@etudeimmodelille.com	0320158520	nan	2021-06-14 07:06:19.689631	t
195	110590	ARRET  COLLABORATION	CC IMMO	etudeimmobilieredelille	Monsieur	clybouw cédric	clbw.immo@gmail.com	0320158520	nan	2021-06-14 07:06:20.591701	t
197	110610	CLIENT INACTIF	LA RESIDENCE COTE LOCATION	laresidencecotelocation	Madame	bugel anne-sophie	gestion2@laresidence.fr	nan	nan	2021-06-14 07:06:22.849293	t
199	110630	REPRENDRE CONTACT	NEXITY	giprichardiere	Madame	amaro isabel	iamaro@nexity.fr	nan	nan	2021-06-14 07:06:24.813541	t
198	110625	ARRET DE COLLABORATION SUITE VENTE	SARL CELINE IMMOBILIER	sarlcelineimmobilier	Madame	tournier céline	herbimmo@orange.fr	nan	nan	2021-06-14 07:06:23.890273	t
200	110635	REPRENDRE CONTACT	EURIGEST	eurigest	Madame	bolat olivia	mkermen@european-homes.fr	nan	nan	2021-06-14 07:06:26.927281	t
201	110640	CLIENT PARTICULIER	CHELOUCHE Jacques	chelouchejacques	Monsieur	chelouche jacques	emailyou@bezeqint.net	nan	nan	2021-06-14 07:06:28.120563	t
202	110642	CLIENT PARTICULIER	.	.	Madame	burkel agnès	abl.moufle@gmail.com	nan	nan	2021-06-14 07:06:29.250629	t
203	110644	CLIENT PARTICULIER	.	.	Monsieur	dinarque jean-denis	jddinarque@gmail.com	nan	nan	2021-06-14 07:06:32.1255	t
204	110650	CLIENT INACTIF	SARL CABINET JUAN	cabinetjuan	Monsieur	rabbe olivier	cabinet-juan@wanadoo.fr	nan	nan	2021-06-14 07:06:33.811408	t
205	110660	INACTIF-ARRET COLLABORATION	SARL AGENCE AUTEUIL	guyhoquetauteuil	Madame	atlani. natacha	natacha.atlani@guyhoquet.com	01 86 95 52 62	82059122000018	2021-06-14 07:06:34.73025	t
206	110670	CLIENT ACTIF	SARL ELSE IMMO	saintmarsimmobilier-sarlelseimmo	Madame	colomez christine	stmars.immobilier@wanadoo.fr	02 40 29 66 63	790 341 838 00031	2021-06-14 07:06:36.170745	t
207	110680	CLIENT INACTIF	DIARD	diard	Madame	fougeres elodie	e.fougeres@cabinet-diard-immobilier.fr	nan	nan	2021-06-14 07:06:38.18527	t
230	120060	CLIENT INACTIF	PROFIGEST PATRIMOINE	profigestimmobilier	Monsieur	raymont eric	accueil@profigestimmobilier	0243095624	nan	2021-06-14 07:07:18.555704	t
208	110690	INACTIF-ARRET COLLABORATION	SCP LECUYER JOUAN PAULET	scplecuyerjouanpaulet	Madame	jezegou aurelie	location@glip-notiares.fr	nan	nan	2021-06-14 07:06:40.80269	t
209	110700	REPRENDRE CONTACT	SAS SABINE DE JARNAC	sabinedejarnacimmobilier	Madame	de jarnac sabine	contact@jarnac-immo.com	0147417401	nan	2021-06-14 07:06:41.923716	t
210	110800	REPRENDRE CONTACT	NEXITY COURCELLES	nexitycourcelles	Madame	baesen nathalie	nbaesen@nexity.fr	nan	nan	2021-06-14 07:06:44.262546	t
231	120070	CLIENT ACTIF	DJC INVEST	craunotdjcinvest	Monsieur	craunot david	info@djcivest.com	0972131871	FR56494310980	2021-06-14 07:07:19.406708	t
211	110900	ARRET  COLLABORATION	SARL OMLJ	cabinetiorvault	Madame	diais	nan	nan	811 884 329 00020	2021-06-14 07:06:45.581427	t
212	110901	ARRET  COLLABORATION	SARL AOO	cabinetivigneuxdebretagne	Madame	diais	nan	09 81 62 61 46	537 642 308 00010	2021-06-14 07:06:47.296204	t
213	110902	ARRET  COLLABORATION	SARL FMLJ	cabinetifaydebretagne	Madame	diais	nan	09 81 62 61 46	811 627 231 00012	2021-06-14 07:06:48.301563	t
232	120155	CLIENT INACTIF	SARL JANIN IMMOBILIER	janinimmobilier	Monsieur	janin jean-michel	janin2@wanadoo.fr	0298804047	30696518700025	2021-06-14 07:07:20.530882	t
214	110910	REPRENDRE CONTACT	NEXITY LAMY SAS	nexityparistrocadero	Monsieur	scholtes	nbaba@nexity.fr	nan	nan	2021-06-14 07:06:49.814794	t
215	110920	CLIENT ACTIF	FOURNY IMMOBILIER	agenceimmobiliereth.fournythierryfourny	Monsieur	fourny thierry	agence.fourny@wanadoo.fr	0240576118	43390528800042	2021-06-14 07:06:50.997477	t
216	110930	CLIENT PARTICULIER	.	.	Madame	bajard bras	bajard.luce@orange.fr	nan	nan	2021-06-14 07:06:52.072854	t
217	110940	CLIENT PARTICULIER	.	.	Monsieur	de saint perne	yves.desaintpern@gmail.com	nan	nan	2021-06-14 07:06:53.028424	t
218	110941	CLIENT PARTICULIER	.	.	Madame	lamotte	leclosdurondeau@gmail.com	nan	nan	2021-06-14 07:06:55.147737	t
219	121045	REPRENDRE CONTACT	SARL IMMO SEBA	orpiimmosebahouilles	Monsieur	seletti philippe	nan	0139687227	32934149900047	2021-06-14 07:06:58.855161	t
220	110950	REPRENDRE CONTACT	AFR IMMOBILIER SARL	afrimmobilier	Madame	pilatte sandrine	sandrine@afr-immobilier.com	nan	nan	2021-06-14 07:07:02.153763	t
221	110960	CLIENT PARTICULIER	.	.	Madame	meire agnès	meireagnes@yahoo.fr	nan	nan	2021-06-14 07:07:03.988862	t
225	120025	ARRET  COLLABORATION	SERGIC ORLEANS	sergic	Madame	levy isabelle	ilevy@sergic.com	AM375	nan	2021-06-14 07:07:12.073141	t
233	122080	CLIENT INACTIF	SARL LE MARTRET IMMOBILIER	lemartretimmobilier	Monsieur	le martret erwan	contact@lemartretimmo.com	0298444888	44294105000019	2021-06-14 07:07:21.632412	t
228	1270257	CLIENT ACTIF	SARL AGENCE DES TILLEULS	agencedestilleuls	Madame	camberlin nathalie	contact1@agencedestilleuls.fr	0546053997	349 105 288 00022	2021-06-14 07:07:15.991523	t
229	120040	ARRET  COLLABORATION	PROACTIVE IMMOBILIER 53	arthurimmo-laval	Madame	hubert karine & galode thierry	k.hubert@arthurimmo.com	0243569089	518854104	2021-06-14 07:07:16.786588	t
234	120080	CLIENT PARTICULIER	.	.	Monsieur	kanoni	hassan.hoballah@arc.sn	nan	nan	2021-06-14 07:07:22.764698	t
235	109985	Doublon à supprimer	L'ADRESSE 4 IMMO	l'adresse4immo	Monsieur	pennanec'h thierry	gestion1@4immo.fr	0240484799	44762160800044	2021-06-14 07:07:23.649031	t
236	120090	CLIENT INACTIF	SARL L.V IMMOBILIER CONSEIL	cabinetmilivinlaforet	Monsieur	grondin laurent	l.grondin@milivin.fr	nan	nan	2021-06-14 07:07:24.589983	t
237	120100	REPRENDRE CONTACT	CABINET TREHARD	cabinettreard-vivreici	Monsieur	trehard emmanuel	e.trehard@vivreici.com	0241800600	nan	2021-06-14 07:07:25.426614	t
238	120091	CLIENT PARTICULIER	COUJANDASSAMY SOUCEMARIANADIN	\N	Monsieur	coujandassamy soucemarianadin	nan	nan	nan	2021-06-14 07:07:26.173363	t
244	120150	CLIENT PARTICULIER	AMBGESTION IMMO	l'adresse-chavilles	Madame	franceschi marie	ambgestion@gmail.com	0147505092	nan	2021-06-14 07:07:32.50384	t
249	121000	CLIENT ACTIF	PODELIHA	podeliha	Madame	adam patricia	padam@podeliha.fr	0241687754	05720113900029	2021-06-14 07:07:39.557227	t
222	120010	CLIENT INACTIF	L'ATELIER IMMOBILIER	l'adresse-nantes-l'atelierimmobilier	Madame	guineheux nancy	atelierimmobilier@orange.fr	02 40 522 500	49154471400018	2021-06-14 07:07:05.295036	t
223	121047	CLIENT ACTIF	OFFICE NOTARIAL ALEXANDRE MORICEAU	officenotarialalexandremoriceau	Madame	vicet karine / le pin stéphane	karine.vicet.44104@notaires.fr  moriceau.torteau@notaires.fr	0240868004	32335511500029	2021-06-14 07:07:07.714871	t
260	122011	CLIENT INACTIF	ZAMBON IMMOBILIER	squarehabitat-zambonimmobilier	Madame	bigot isabelle	isabelle.bigot@squarehabitat.fr	0242533299	nan	2021-06-14 07:07:52.871607	t
224	120020	CLIENT ACTIF	MAISON BLANCHE - L'ADRESSE LAVAL	l'adressemaisonblanche	Monsieur	blanvillain sebastien	nan	0253745554	nan	2021-06-14 07:07:09.107817	t
250	121001	CLIENT ACTIF	SAS AAAAMB GESTION IMMOBILIERE	l'adresse-4ambgestionimmo	Madame	franceschi marie	4ambgestion@gmail.com	0147505092	802 248 476 00029	2021-06-14 07:07:41.578989	t
226	120030	CLIENT PARTICULIER	.	.	Madame	normand vallet christine	ch_normand@orange.fr	nan	nan	2021-06-14 07:07:13.453804	t
227	\N	CLIENT INACTIF	CHRISTINE DUMAS IMMOBILIER	christinedumasimmobilier	Madame	dumas christine	christine@christine-dumas-immobilier.fr	0298209789	nan	2021-06-14 07:07:14.729649	t
239	120092	CLIENT PARTICULIER	PICAUD MAURICE	particulier	Monsieur	picaud maurice	nan	nan	nan	2021-06-14 07:07:27.06686	t
240	122015	CLIENT INACTIF	AGENCE GRIFFON GUEGUEN IMMOBILIER	agencegriffongueguenimmobilier	Monsieur	griffon erwan	e.griffon@griffon-gueguen-immobilier.com	0298980500	nan	2021-06-14 07:07:27.937461	t
251	121050	ARRET  COLLABORATION	SARL OUEST BRETAGNE IMMOBILIER	obi29	Monsieur	kerebel damien	damien.kerebel@obi29.fr	0298217854	nan	2021-06-14 07:07:42.615595	t
241	120120	REPRENDRE CONTACT	CABINET TAPISSIER	cabinettapissier	Monsieur	friess richard	friess@cabinettapissier.fr	0241881455	nan	2021-06-14 07:07:29.246734	t
242	120130	ARRET  COLLABORATION	VALRIM	valrimorpi	Monsieur	marquant sébastien	nan	0238241515	08697101700040	2021-06-14 07:07:30.578948	t
252	121002	CLIENT PARTICULIER	SCI ROCHER	\N	Monsieur	rocher jean charles	zephz35@gmail.com	nan	nan	2021-06-14 07:07:44.29185	t
243	120140	CLIENT PARTICULIER	SCI LE LAC	.	Monsieur	raye philippe	praye@biica.fr	nan	nan	2021-06-14 07:07:31.417117	t
245	120190	REPRENDRE CONTACT	AGENCE IMMOBILIERE DU CENTRE LAFORET	laforetimmobilierducnetre	Monsieur	sarrade loucheur cédric	bloisgestion@laforet.com	0254909090	439 222 654 00055	2021-06-14 07:07:34.912492	t
253	121003	CLIENT PARTICULIER	CANNELLE ALEXANDRE	\N	Monsieur	cannelle alexandre	cannellealex@gmail.com	nan	nan	2021-06-14 07:07:45.207075	t
246	120160	CLIENT ACTIF	OFFICE MAITRE DARPHIN	officemaitredarphin	Monsieur	darphin jean-christophe	etude.darphin@notaires.fr	0243537710	nan	2021-06-14 07:07:36.138236	t
247	120170	CLIENT INACTIF	SARL DE BERRANGER	\N	Monsieur	de berranger philippe	cabinet-de-berranger@wanadoo.fr	nan	nan	2021-06-14 07:07:37.032725	t
248	12220	CLIENT INACTIF	SARL MAITE MARTEAU	maitemarteau	Madame	marteau berceron ingrid	f.leroux@maite-marteau.com	0243249266	nan	2021-06-14 07:07:38.154736	t
265	122050	REPRENDRE CONTACT	BRIENT IMMOBILIER	guyhoquetmontreuilbrientimmobilier	Monsieur	brient laurent	montreuil.mairie@guyhoquet.com	0148374737	nan	2021-06-14 07:08:00.168785	t
261	122012	CLIENT PARTICULIER	PARTICULIER	particulier	Madame	blais yvette et mathieu	mathieublais@wanadoo.fr	0663562035	nan	2021-06-14 07:07:53.773042	t
254	121010	REPRENDRE CONTACT	HP CONSEILS IMMOBILIER	laforethpconseils	Monsieur	pelon hervé	garches@laforet.com	nan	nan	2021-06-14 07:07:46.020316	t
255	\N	PROSPECT 1ère propo le 9/6/18	KERHUON IMMOBILIER	cabinetrebours	Monsieur	rebours ronana	kerhuon-immobilier@orange.fr	0298283706	nan	2021-06-14 07:07:46.902462	t
256	121030	CLIENT PARTICULIER	.	.	Monsieur	le bris corentin	nan	nan	nan	2021-06-14 07:07:47.990917	t
257	121040	CLIENT PARTICULIER	.	.	Monsieur	piens arnaud	apiens@gmail.com	nan	nan	2021-06-14 07:07:49.077777	t
262	123000	CLIENT ACTIF	SAS BUSSAT DUNNE IMMOBILIER	guyhoquetbussatdunneimmobilier	Monsieur	bussat serge	paris15sud@guyhoquet.com	01 45 32 40 40	79841784600028	2021-06-14 07:07:55.210692	t
258	122000	ARRET  COLLABORATION	BARATTE IMMOBILIER	baratteimmobilier	Madame	richard vanessa	vanessa.baratte@gmail.com	0546993542	752590265	2021-06-14 07:07:50.361278	t
259	122010	CLIENT PARTICULIER	.	\N	Monsieur	baduel olivier	baduel@free.fr	nan	nan	2021-06-14 07:07:51.751564	t
266	122060	CLIENT INACTIF	CITYA CAGIL	cityalorient	Madame	waysse alyssa	awaysse@citya.com	nan	316 972 835 00045	2021-06-14 07:08:01.067483	t
263	122030	ARRET  COLLABORATION	SAS BRIO GESTION	briogestion	Madame	brilhaut céline & novais sylvie	celine.syndicexperts@gmail.com\nsylvie.briogestions@gamil.com	01 41 74 37 81	nan	2021-06-14 07:07:56.590958	t
264	122040	CLIENT ACTIF	CITYA BELVIA RENNES	cityabelviarennes	Madame	le doeuff hélène	helene.ledoeuff@citya-belvia.fr	0299787980	nan	2021-06-14 07:07:58.897075	t
272	122110	CLIENT ACTIF	PARTENAIRES GESTION CONSEIL	l'adressethorilagny	Madame	bonnet muriel	phc-gestion@orange.fr	0164121212	43948954300082	2021-06-14 07:08:11.111806	t
269	122080	CLIENT PARTICULIER	.	.	Monsieur	rouillon frédéric	segolenerouillon@yahoo.fr	nan	nan	2021-06-14 07:08:06.193514	t
267	122070	ARRET  COLLABORATION	SARL COTE VILLEMANDEUR	coteparticuliers	Madame	mounier céline	villemandeur@coteparticuliers.com	0238870717	nan	2021-06-14 07:08:02.780342	t
268	122120	CLIENT INACTIF	SASU UGS PATRIMOINE	l'adresse-etampes	Monsieur	cormon benoit	gestion@ugs-patrimoine.com	0169260404	nan	2021-06-14 07:08:04.036275	t
271	122100	CLIENT INACTIF	GIEMPE IMMOBILIER	giempeimmobilier	Monsieur	pertus jean marc	giempe-immobilier@wanadoo.fr	0241956399	nan	2021-06-14 07:08:10.086859	t
270	122090	INACTIF	SAS AM IMMOBILIER	amimmobilier	Monsieur	billot michel	amimmob@aol.com	01 39 76 33 61 / 01 39 76 52 52	55980529600022	2021-06-14 07:08:07.582321	t
274	\N	DOUBLON DE SAISIE	BENOTEAU IMMOBILIER	\N	Madame	benoteau corine	cbenoteau@benoteau-immobilier.fr	0160607229	nan	2021-06-14 07:08:14.053238	t
273	122240	ARRET  COLLABORATION	NEOWI IMMOBILIER	\N	Monsieur	hascoet boris	b.hascoet@neowi.com	0229631715	40977820600022	2021-06-14 07:08:12.345013	t
275	123520	CLIENT ACTIF	CABINET GUERRY SARL	agirimmobilier-cabinetguerry	Monsieur	chenede frédéric	fred-chenede@hotmail.fr	0299670068	341 939 684 00096	2021-06-14 07:08:15.315443	t
276	122130	CLIENT INACTIF	SARL TRIO IMMO	l'adresse-chateaubriant	Madame	lahridi soraya	s.lahridi@ladresse.com	0240287621	nan	2021-06-14 07:08:16.593953	t
277	122120	CLIENT PARTICULIER	.	.	Monsieur	froussart jean-marc	jm.froussart@gmail.com	nan	nan	2021-06-14 07:08:17.672157	t
278	122140	CLIENT PARTICULIER	.	.	Madame	lombard bélinda	beli.lombard@gmail.com	nan	nan	2021-06-14 07:08:19.006344	t
279	122150	CLIENT PARTICULIER	.	.	Madame	gourrier	martinegourrier@orange.fr	nan	nan	2021-06-14 07:08:20.072962	t
280	122160	ARRET  COLLABORATION	SAS LARVOR	larvor	Monsieur	wispelaere manuel	mw.larvor3@Wanadoo.fr	0298459339	nan	2021-06-14 07:08:21.224073	t
281	110103	INACTIF-ARRET COLLABORATION	SARL NATION IMMOBILIER	laforetnationimmobilier	Monsieur	da costa laurent	ldacosta@laforet.com	0156950900	nan	2021-06-14 07:08:22.276599	t
282	110102	INACTIF-ARRET COLLABORATION	SARL L-L IMMOBILIER	laforetl-limmobilier	Monsieur	da costa laurent	ldacosta@laforet.com	01 55 78 83 10	nan	2021-06-14 07:08:23.358697	t
283	110101	INACTIF-ARRET COLLABORATION	SARL GDL IMMOBILIER	laforetgdlimmobilier	Monsieur	da costa laurent	ldacosta@laforet.com	01 43 40 10 10	nan	2021-06-14 07:08:24.628817	t
284	123350	ARRET DE COLLABORATION SUITE VENTE	SOCIETE CAP JAURES	orpi101jaures	Madame	lamour solène	agencejaures@orpi.com	0298434656	51370591300012	2021-06-14 07:08:25.753526	t
285	122145	CLIENT ACTIF	ETUDE BONNAVE	bonnavenotaires	Monsieur	bonnave frederic	frederic.bonnave@notaire.fr	0328520720	nan	2021-06-14 07:08:27.024693	t
286	122146	CLIENT INACTIF	TMC FINANCE	lilleimmo	Madame	denis estelle	estelle@lille-immo.fr	0320152061	487754848	2021-06-14 07:08:28.038301	t
287	122140	CLIENT ACTIF	BENOTEAU IMMOBILIER	l'adressebenoteauimmobilier	Madame	benoteau corinne	cbenoteau@benoteau-immobilier.fr	0160607229	786142935	2021-06-14 07:08:29.110537	t
288	122150	CLIENT ACTIF	VACHERAND IMMOBILIER	vacherandimmobilier	Madame	vacherand charlotte	charlotte@vacherand.fr	0328380038	414270769	2021-06-14 07:08:30.667707	t
289	122160	CLIENT ACTIF	CABINET PIGE	cabinetpige	Monsieur	brachet sébestien	sebastien.brachet@pigeimmobilier.fr	0241257575	403090889	2021-06-14 07:08:31.795752	t
290	\N	DOUBLON DE SAISIE	TMC FINANCE	lilleimmo	MADAME	denis estelle	estelle@lille-immo.fr	0320152061	nan	2021-06-14 07:08:32.907702	t
305	123320	CLIENT INACTIF	ASD PATRIMOINE	asdimmobilier-asdpatrimoine	MONSIEUR	segard arnaud	asegard@asd-patrimoine.fr	0321694509	78945950000045	2021-06-14 07:08:54.556002	t
291	122180	CLIENT PARTICULIER	Djakiodine Shabir	djakiodineshabir	Monsieur	djakiodine shabir	shabacc72@gmail.com	447789862405	nan	2021-06-14 07:08:34.289815	t
297	122250	CLIENT PARTICULIER	PETILLAT ROBERT	particulier	MONSIEUR	petillat damien et robert delphine	delphinrobert80@gmail.com	0241699116	nan	2021-06-14 07:08:44.795109	t
292	122195	CLIENT INACTIF	NOTAIRES ETUDE NYZAM GAILLARD	notairesetudenyzamgaillard	Madame	templier angeline	angeline.templier@notaires.fr	0546995347	397 891 086 00027	2021-06-14 07:08:37.227568	t
293	122200	CLIENT INACTIF	JLW IMMOBILIER	jlwimmobilier	MONSIEUR	lestienne emeric	emeric.lestienne@jlw.fr	0320577257	48290685600018	2021-06-14 07:08:38.352735	t
294	122190	CLIENT PARTICULIER	CALAS JEAN FRANCOIS	particulier	MONSIEUR	calas jean francois	jfcals@orange.fr	nan	nan	2021-06-14 07:08:39.82977	t
298	122260	CLIENT INACTIF	SCI AMETHYSTE	scil'amethyste	MADAME	norguet carole	norguet.carole@gmail.com	nan	524 848 082 00037	2021-06-14 07:08:45.872339	t
295	122210	CLIENT PARTICULIER	CORDIER Jean-Noël	particulier	Monsieur	cordier jean-noël	cordier.jeannoel@neuf.fr	nan	nan	2021-06-14 07:08:40.749765	t
296	122220	CLIENT ACTIF	IMMOBILIERE JAURES IMMO	jauresimmo-agenceprincipalegagny	MONSIEUR	nardot stepahne	kgk@wanadoo.fr	0141530404	449306620	2021-06-14 07:08:42.888125	t
310	123360	ARRET  COLLABORATION	CABINET G.CARDINAL	cabinetg.cardinal	MONSIEUR	duart david	gerance@cabinetgcardinal.com	nan	79501577500013	2021-06-14 07:09:00.966977	t
299	122270	ARRET  COLLABORATION	FONCIA VENDEE	foncia-grouepgrenon	MONSIEUR	caillaud lauret	laurent.caillaud@foncia.de	nan	452 396 575 00071	2021-06-14 07:08:47.503973	t
306	123330	CLIENT INACTIF	MENGUY Leslie	officenotarial	Madame	menguy leslie	lesliemenguy@gmail.com	nan	nan	2021-06-14 07:08:55.80297	t
300	122280	CLIENT INACTIF	nan	arthurloydlille	Monsieur	hien maxence	mhien@arthur-loyd.com	0320302218	nan	2021-06-14 07:08:48.771793	t
301	122290	CLIENT ACTIF	LM-IMMO	lillemetropoleimmobilier	Monsieur	darondel igor	contact@lillemetropoleimmobilier.com	0320152020	538 332 883 00015	2021-06-14 07:08:49.823788	t
302	122300	CLIENT ACTIF	CENTURY RUE NATIONALE	century21-lilleruenationale	MONSIEUR	dupont benoit	ruenationale@century21.fr	0328535555	52526891800014	2021-06-14 07:08:50.905591	t
307	123340	CLIENT ACTIF	EURO IMMO	euroimmo	MADAME	barat carole	c.barat@euroimmo.fr	0164170800	42308557000012	2021-06-14 07:08:56.953666	t
303	122310	nan	DEFIM	defimimmobilier	Madame	delfosse erika	defim.gestion@gmail.com	0328360916	82392388300016	2021-06-14 07:08:52.247494	t
304	\N	nan	AJP IMMOBILIER	ajpimmobilier	Madame	rodolle véronique	saintmarcsurmer@ajp-immobilier.com	0240403757	nan	2021-06-14 07:08:53.420006	t
311	123370	CLIENT	nan	\N	MONSIEUR	\N	nan	nan	nan	2021-06-14 07:09:02.033093	t
308	123610	CLIENT ACTIF	IMMO DE FRANCE LAVAL	immodefrancelaval	MADAME	vaigreville murielle	mvaigreville@procivis-ouest.fr	02 43 59 45 45	44136160700035	2021-06-14 07:08:58.908344	t
309	123350	nan	SOCIETE CAP JAURES	orpi101jaures	MADAME	lamour solene	agencejaures@orpi.com	0298434656	51370591300012	2021-06-14 07:08:59.918648	t
315	123480	CLIENT INACTIF	SARL B.C IMMOBILIER	l'adresse-stbranchsetl'adressetours	Madame	chevalier brigite	agencedulac@ladresse.com	0247261260	483659983	2021-06-14 07:09:09.676717	t
312	123380	CLIENT PARTICULIER	DE BEAUREGARD Arnaud	particulier	Monsieur	de beauregard arnaud	beauregard@free.fr	nan	nan	2021-06-14 07:09:03.064183	t
313	123390	CLIENT PARTICULIER	nan	\N	Monsieur	mailhac christophe	chrismayac@hotmail.com	nan	nan	2021-06-14 07:09:06.232764	t
314	123400	CLIENT PARTICULIER	nan	\N	Monsieur	metivier laurent et madame blouin sonia	sonia.blouin@hotmail.fr	nan	nan	2021-06-14 07:09:08.252868	t
316	124410	CLIENT INACTIF	SARL- INEDIT IMMOBILIER	ineditimmobilier	Monsieur	leclercq etienne	etienne@inedit-immobilier.com	0366722572	500 944 012 00037	2021-06-14 07:09:10.67402	t
317	123420	ARRET DE COLLABORATION SUITE VENTE	SIGLA GESTION	siglaimmobilier	Madame	voisin isabelle	isabelle.voisin@sigla.fr\naccueilgestion@sigla.fr	03 20 57 09 30	49871124100030	2021-06-14 07:09:11.957616	t
318	107505	CLIENT ACTIF	SARL CABIENT FREDELION	guyhoquet-cabinetfredelion	MONSIEUR	teboul et bismuth	gestion@cabinet-fredelion.com	0153093040	49240893500020	2021-06-14 07:09:13.30213	t
319	123430	ARRET  COLLABORATION	SARL BH IMMOBILIER	l'adresse-castanettolosan-bhimmobilier	MONSIEUR	heracles et bourgoin	bhimmobilier@ladresse.com	0534434203	519654115 00020	2021-06-14 07:09:15.248715	t
320	123440	ARRET  COLLABORATION	SARL AET IMMOBILIER	l'adresse-toulouse-aetimmobilier	MONSIEUR	heracles et bourgoin	direction@ladresse.com    ATTENTION ADRESSE MAIL ERRONEE	0562477333	42488111800014	2021-06-14 07:09:16.451398	t
321	123450	CLIENT ACTIF	SARL MBM IMMOBILIER	locagestion-toulousembmimmobilier	MADAME	vanhecke nathalie	location@locagestion.com	0561208620	404 821 373 00036	2021-06-14 07:09:17.447421	t
327	\N	nan	nan	\N	nan	\N	nan	nan	nan	2021-06-14 07:09:24.593457	t
322	123460	CLIENT INACTIF	SARL AERO IMMOBILIER	l'adresse-colomiers	MADAME	rondonnet josiane	aero.transactions@wanadoo.fr	0561785173	38125276600047	2021-06-14 07:09:18.459494	t
323	123470	CLIENT INACTIF	SARL GI.CI.CA.	l'adresse-toulouse-gicaconseil	MADAME	germa nathalie	nathalie.germa@ladresse.com	0562486120	40320284900036	2021-06-14 07:09:19.376082	t
324	123500	CLIENT ACTIF	CIVM IMMOBILIER	l'adresse-civm	MONSIEUR	pouyet laurent	nan	01 49 83 88 11	41090591300019	2021-06-14 07:09:20.827419	t
325	123510	ARRET  COLLABORATION	nan	\N	Madame	quentin marie	marieq2@hotmail.com	nan	nan	2021-06-14 07:09:22.116726	t
326	123530	nan	OFFCIE NOTARIAL F.CADET	offcienotarialf.cadet	Monsieur	plourdeau arnaud	negociation.53075@notaire.fr	0243041264	300 349 347 00025	2021-06-14 07:09:23.099974	t
329	123620	REPRENDRE CONTACT	SAS O'REAL IMMOBILIER TRANSACTIONS	o'realimmobiliertransactions	Monsieur	talban joseph	transaction@o-real.fr	0983980101	824 961 874 00016	2021-06-14 07:09:27.002757	t
330	123590	ARRET  COLLABORATION	CABINET IROISE IMMOBILIER	iroiseimmobilier	Monsieur	riou christophe	contact@iroiseimmo.fr	0298432900	339311060	2021-06-14 07:09:28.495026	t
331	123550	REPRENDRE CONTACT	AGENCE NOUALLER IMMOBILIER	orpinouallet	Monsieur	nouallet	snouallet@orpi.com	0140250232	452977044	2021-06-14 07:09:29.802018	t
332	123560	CLIENT ACTIF	SAS SARPIG	pierres&co-sassarpig	Monsieur	sarrazin pierre	p.sarrazin@pierres-co.fr	0241863264	81079156600013	2021-06-14 07:09:31.012356	t
333	123570	CLIENT PARTICULIER	nan	\N	Monsieur	lafranceschina lionel	laf.lionel@wanadoo.fr	nan	nan	2021-06-14 07:09:32.059316	t
328	123540	CLIENT ACTIF	S2F IMMOBILIER	guyhoquetparis9ouests2fimmobilier	Monsieur	faure fabian	f.faure@guyhoquet.com	01 81 69 76 69	81975320300028	2021-06-14 07:09:25.630391	t
347	1270201	CLIENT ACTIF	SARL INDEPIMMO	indepimmo	Monsieur	rambeau christophe	crambeau@indepimmo.fr	0241550332	79061304600016	2021-06-14 07:09:53.638175	t
334	123580	CLIENT PARTICULIER	DELAPIERRE Sylvie et NQUELLAERD	particulier	Madame et Monsieur	delapierre sylvie et nquellaerd	barelnet@yahoo.fr	nan	nan	2021-06-14 07:09:33.310894	t
335	123600	CLIENT PARTICULIER	BLAIS Gérard	particulier	Monsieur	blais gérard	Yvette.blais@free.fr	nan	nan	2021-06-14 07:09:34.827557	t
336	123630	CLIENT ACTIF	SARL LES HERBIERS GESTION	l'adresselesherbiersgestion	Messieux	blanvillain et teillol	nan	nan	nan	2021-06-14 07:09:36.226208	t
348	123730	CLIENT ACTIF	BEE IMMO SARL	beeimmolaforet	Monsieur	brochet xavier	xbrochet@laforet.com	0144381012	508626330   502662042	2021-06-14 07:09:54.942781	t
337	123650	CLIENT INACTIF	ASTIM  SARL - NESTENN ANGERS	nestennangers	Monsieur	bouly laurent	l.bouly@nestenn.com	nan	43336341300017	2021-06-14 07:09:37.737021	t
338	123660	CLIENT PARTICULIER	LOINARD Antoine	loinardantoine	Monsieur	loinard antoine	antoine.loinard@gmail.com	nan	nan	2021-06-14 07:09:39.190486	t
357	124000	CLIENT INACTIF	SCI CDP PATRIMOINE	cdppatrimoine	Madame	lettelier flo	lettelier.flo@sfr.fr	nan	498 276 963 00044	2021-06-14 07:10:08.134551	t
339	123670	REPRENDRE CONTACT	AVANTAGE GESTION	stephaneplazaimmobilier	Madame	des fontaines fleur	fdesfontaines@stephaneplazaimmobilier.com	0141054554	818622896	2021-06-14 07:09:42.088327	t
349	123750	CLIENT INACTIF	SARL MAUDIN IMMOBILIER	laforetdoldebretagne	Monsieur	maudet & meron jérôme	jmeron@laforet.com	0299807026	44781668700027	2021-06-14 07:09:55.998745	t
340	123680	nan	FRANCE EDL	franceedl	Monsieur	baudin guillaume	contact@france-edl.fr	09 72 47 40 49	52835861700025	2021-06-14 07:09:43.957806	t
341	123690	CLIENT ACTIF	AGENCE CADEAU	orpi-agencecadeau	Monsieur	garcia sébastien	sgarcia.agencecadeau@orpi.com	01 49 32 06 06	30638804200054	2021-06-14 07:09:45.324786	t
342	123700	CLIENT ACTIF	SAS PONS & COMPAGNIE	pons&cieimmobilier	Monsieur	beddeleem stéphane	nan	0328365150	455 503 359 00016	2021-06-14 07:09:47.19286	t
350	123800	CLIENT ACTIF	SARL IMMOBILIERE DE LILLE	immobilieredelille	Monsieur	guilloteau charlotte	pierremechineau@immobiliere-de-lille.fr	0320151535	833 531 098 00014	2021-06-14 07:09:57.016583	t
343	123710	CLIENT INACTIF	LEGROS IMMOBILIER	legrosimmobilier	Monsieur	guedon stéphane	legros.immobilier@wanadoo.fr	0241880171	39057869800016	2021-06-14 07:09:48.573164	t
344	123720	CLIENT ACTIF	SARL LANTA IMMOBILIER	coeurlauragaisimmoagencedelanta	Monsieur	soual yannick	ys.lanta.immo@orange.fr	0562186330	44328553100010	2021-06-14 07:09:49.988762	t
358	124010	CLIENT PARTICULIER	nan	\N	Monsieur	roland robert et huguette	nan	nan	nan	2021-06-14 07:10:09.742729	t
345	123685	CLIENT PARTICULIER	PICAVEZ PHILIPPE	picavezphilippe	Monsieur	picavez philippe	pivavez@orange.fr	nan	nan	2021-06-14 07:09:51.159647	t
351	123850	REPRENDRE CONTACT	SARL a2jimmo	orpigagny-a2jimmo	Monsieur	vasovic slobodan	a2jimmo@orpi.com	0143817979	37807360500024	2021-06-14 07:09:58.156092	t
346	124170	CLIENT ACTIF	SARL TERRE D'ARGENCE IMMOBILIER	agenceterred'argenceimmobilier	Madame et Monsieur	poincet philippe et sophie	ppoincet@terre-argence.com	0466811807	451779912000018	2021-06-14 07:09:52.304304	t
352	123950	CLIENT PARTICULIER	nan	\N	Monsieur	coulay guy	guy.coulay@orange.fr	06 87 43 40 15	nan	2021-06-14 07:09:59.415112	t
353	123960	CLIENT INACTIF	AIL IMMOBILIER - AGENCE IMMOBILIER LILLOISE	agenceimmobilierelilloise	Monsieur & Madame	ponche	a.i.l59000@orange.fr	03 20 22 95 67	414 908 988 00010	2021-06-14 07:10:01.486334	t
354	123970	CLIENT PARTICULIER	SAPAC	\N	Madame	comte	clientsfournisseurs@sapac.fr	nan	nan	2021-06-14 07:10:03.435949	t
355	123980	CLIENT PARTICULIER	nan	\N	Madame & Monsieur	rolland robert	monique.h.rolland@free.fr	nan	nan	2021-06-14 07:10:04.755681	t
359	124020	CLIENT INACTIF	BRAVOGROUP TECH CO LTD	\N	Monsieur	steven	steven@bravogroup.com	nan	69987483-000-10-18-4	2021-06-14 07:10:11.513077	t
356	124165	REPRENDRE CONTACT	SARL IMMOBILIER HELOIN	heloinimmobilier	Monsieur	paul bertrand	immo.heloin@wanadoo.fr	02 41 67 64 25	35299872800054	2021-06-14 07:10:06.307308	t
363	124060	ARRET  COLLABORATION	IMMOBILIERE LUTECE	immobilierelutece	Monsieur	latour steve	slatour@immobilierelutece.fr	01 42 68 33 39	304 555 501 00069	2021-06-14 07:10:17.892999	t
360	124030	CLIENT ACTIF	AGENCE IMMOBILIERE DE LA MAIRIE	orpirosnysousboisagencedelamairie	Monsieur	denis nicolas	agencemairie@orpi.com	0145280059	505057919	2021-06-14 07:10:12.853187	t
361	124040	INACTIF-ARRET COLLABORATION	REPUBLIQUE IMMOBILIER	republiqueimmobilier-laforet	Monsieur	da costa laurent	nan	01 71 18 33 00	84093062200013	2021-06-14 07:10:14.198025	t
367	124100	nan	LADREAU	\N	Monsieur	landreau	alandreau@free.fr	nan	nan	2021-06-14 07:10:23.391327	t
362	124050	INACTIF-ARRET COLLABORATION	SAS PATRIMONIA - ORPI	orpi-sasimmo75	Monsieur	hoarau laurent	gerance@immo75.fr	01 43 70 51 51	40308522800035	2021-06-14 07:10:16.284256	t
364	124070	CLIENT INACTIF	SARL MB IMMOBILIER	mbimmobiliertours	Monsieur	blot  pierre yves	py.blot@mb-immobilier.com	0247701001	39835439900014	2021-06-14 07:10:19.151379	t
365	124080	INACTIF	M3B IMMOBILIER SARL	laforet_m3bimmobilier	Monsieur	célian moullé-berteaux	nan	01 41 10 42 10	83337372300018	2021-06-14 07:10:20.409877	t
366	124090	CLIENT INACTIF	nan	\N	Monsieur	show john	tchkarl@gmail.com	nan	nan	2021-06-14 07:10:21.901969	t
369	124120	CLIENT ACTIF	SARL CHURCHIL - Agence de l'ancienne Marie	l'adresseagencedel'anciennemairie	Madame	malika bouazoune	nan	01 43 05 60 25	41126140700042	2021-06-14 07:10:26.3352	t
368	124110	CLIENT ACTIF	SARL IMMO 7	coeurlauragaisimmo7	Monsieur	soual yannick	ys.lanta.immo@orange.fr	0562186330	792 045 189 00018	2021-06-14 07:10:24.859317	t
370	124130	CLIENT ACTIF	ACTIF GESTION IMMOBILIER	agi-actifgestionimmobilier	Madame	dufour kathleen	k.dufour@actifgestionimmobilier.com	01064366405	793 442 039 00012	2021-06-14 07:10:27.905577	t
371	\N	nan	MODELE	\N	nan	modele	nan	nan	nan	2021-06-14 07:10:29.408582	t
372	0181	CLIENT INACTIF	SARL A.N.G IMMOBILIER	century21l'oceane	Monsieur	francheteau pascal	locationloceane@century21.fr	0251498888	35357547500036	2021-06-14 07:10:30.94545	t
373	124240	CLIENT INACTIF	SAS AAZ IMMOBILIER YONNAIS	laforetimmobilieryonnais	Madame	guillou charlotte	c.guillou@laforet.com	0251363878	791011869800017	2021-06-14 07:10:33.063073	t
374	124260	CLIENT ACTIF	SARL AGENCE CORINNE B	agencecorinneb	Madame	bazard corinne	corinneb.pro@gmail.com	0238349609	49866003400014	2021-06-14 07:10:34.61673	t
375	124140	CLIENT ACTIF	SARL AFI -  AUBERGENVILLE FLINS IMMOBILIER	guyhoqueteponel'immobilierpatrimoine	Madame	descaves / jouvet	gestion.afi.aubergenville@gmail.com	01.30.91.23.05	525 002 697 00015	2021-06-14 07:10:35.904835	t
376	124150	REPRENDRE CONTACT	SAS C2IMM	c2imm	Madame	bryndza catherine	nan	01 43 36 32 84	79340316300025	2021-06-14 07:10:37.668535	t
377	124160	CLIENT INACTIF	BRAVOFIBER	bravofiberlda	Monsieur	bravofiber	pyves@bravofiber.com	nan	515147001	2021-06-14 07:10:39.159285	t
378	124190	CLIENT INACTIF	SAS SEIZE IMMOBILIER	seizeimmobilier	Monsieur	lefebvre remi	remi@seizeimmobilier.com	0328360650	80739128900020	2021-06-14 07:10:40.894578	t
379	124200	CLIENT ACTIF	SAS AGENCE DE LA MADELEINE	agencedelamadeleine	Madame	valerie hugot	val.hugot@orange.fr	03 20 78 02 02	80467728400015	2021-06-14 07:10:43.06186	t
380	124340	CLIENT ACTIF	SARL DALIN BUSSAT DUNNE IMMOBILIER	guyhoquetsaintcharles-sarldalin	Monsieur	dalin bertrand	b.dalin@guyhoquet.com	01.82.83.40.00	82207515600023	2021-06-14 07:10:44.426785	t
381	124210	SUSPENDU	POMMEROL	pommerolaude	Madame	pommerol aude	audehariche@icloud.com	06 80 84 82 15	nan	2021-06-14 07:10:46.41084	t
382	124210	CLIENT INACTIF	DE POMMEROL AUDE	depommerolaude	Madame	de pommerol aude	audehariche@icloud.com	06 80 84 82 15	nan	2021-06-14 07:10:47.596112	t
383	124280	CLIENT ACTIF	SARL CITYA LES REMPARTS	cityalaval-sarlcityalesremparts	Monsieur	pecot benoit	XXX	02 43 59 21 70	33438154100036	2021-06-14 07:10:49.038578	t
384	CC0171	CLIENT	SARL DEMARE BEAULIEU IMMOBILIER	demarebeaulieuimmobilier	Madame	demare fabienne	immobilier@demare-beaulieu.fr	0251863480	45214576600047	2021-06-14 07:10:50.391334	t
385	124270	CLIENT INACTIF	SARL PHILIPPE MATHIEU	agencedusudest	Madame	stephanie bouffier	s.bouffier@agsudest.com	04 42 26 18 01	48793034900013	2021-06-14 07:10:51.724931	t
386	124290	REPRENDRE CONTACT	SAVOIR ET CONSEIL	savoiretconseil	Monsieur	blanchard philippe	conseiletsavoir@orange.fr	.	48198742800036	2021-06-14 07:10:53.851098	t
387	\N	CLIENT PARTICULIER	XXXX	xxx	Madame	haddou	ggledetoc4090@amexpert.biz	06 30 51 35 71	XXXX	2021-06-14 07:10:56.105963	t
388	124295	CLIENT PARTICULIER	XXX	xxx	Madame	martin	ckmartin44@gmail.com	06 68 93 02 48	XXX	2021-06-14 07:10:57.853844	t
394	124350	ARRET  COLLABORATION	SARL LE RELAIS IMMOBILIER	lerelaisimmobilier	Madame	rossignol angelique	service-gerance@orange.fr	01 34 80 90 91	324 804 889 00016	2021-06-14 07:11:09.120259	t
395	122001	CLIENT PARTICULIER	nan	\N	Monsieur	plantagenet patrick	nan	nan	nan	2021-06-14 07:11:11.346372	t
408	124500	CLIENT ACTIF	SARL ACTIF IMMO	l'adresseromorantin	Madame	cretier carole	c.cretier@ladresse-romorantin.fr	0254767759	75247734900019	2021-06-14 07:11:27.974614	t
404	124470	CLIENT ACTIF	SARL	andreimmobilier-gestion	Madame	andre- huet honorine  mr andre edouard	h.andre@andreimmo.fr	01 71 52 75 02	53145774500028	2021-06-14 07:11:22.304616	t
405	124520	CLIENT PARTICULIER	FATMA TRIKI	fatmatriki	Madame	fatma triki	fatma.triki@muses-hammamet.com	0660241503	XXX	2021-06-14 07:11:23.812916	t
406	124490	CLIENT ACTIF	AGENCE DE VALLIERE - GESTION	agencedevalliere-gestion	Madame	fall barbara	b.fall@de-valliere.com  / rueil@de-valliere.com	0141968005	494 116 320 00016	2021-06-14 07:11:25.281372	t
409	124550	CLIENT INACTIF	VALLOIRE HABITAT LE MANS ET LAVAL	valloirehabiatagencelaval	Madame	perthuis patricia	berengere.chollet@valloire-habitat.com	0243395640	nan	2021-06-14 07:11:29.507342	t
407	124480	CLIENT ACTIF	COOPTALIS - LINK MOBILITE	coptalis-linkmobilite	Monsieur	jakubowsky benjamin	isabelle.straub@linkmobilite.com	05 61 59 40 73	49884679900092	2021-06-14 07:11:26.66351	t
410	124530	CLIENT INACTIF	SARL	shconseilimmobilieretpatrimoine	Madame	sanroma christine	c.sanroma@sh-conseil.fr	02 38 51 34 33	52901831900010	2021-06-14 07:11:31.814689	t
411	124540	CLIENT INACTIF	EURL BRIGITTE TESTARD	agencedeslilas	Madame	mme christine testard	agence@agence-immobiliere-des-lilas.com   Brigittetestard@gmail.com	02 38 29 03 20	53172789900027	2021-06-14 07:11:33.335645	t
389	124310	REPRENDRE CONTACT	SARL BOCAGE IMMOBILIER	bocageimmobilier	Madame	bouet elodie	bocage.immobilier@wanadoo.fr	05 49 65 84 34	83331718300014	2021-06-14 07:10:58.935751	t
390	124360	REPRENDRE CONTACT	SARL BRESSUIRE IMMO	letucimmobilier	Madame	vrignault aurelie	bressuire@letuc.com	05 49 80 61 94	48843001800033	2021-06-14 07:11:00.342187	t
420	124630	CLIENT INACTIF	nan	vacherandimmobilierlambersart	Madame	grimmelpont stephanie	nan	0320170130	793 585 670 00011	2021-06-14 07:11:48.948719	t
391	124300	CLIENT PARTICULIER	ZEZAFOUN	zezafoun	nan	zezafoun hussein	nan	nan	XXX	2021-06-14 07:11:01.820002	t
412	124560	CLIENT ACTIF	SARL VESTALIA IMMO	vestaliaimmothierrylescure	Monsieur	thierry lescure	contact@vestaliaimmo.fr	05 56 24 62 47	52323706300020	2021-06-14 07:11:35.373366	t
392	124320	CLIENT ACTIF	IMMOBILIERE DU BOUQUET (SARL)	orpi-immobilierdubouquetm.lamottestephane	Monsieur	mr lamotte stéphane	immobouquet@orpi.com	01 64 40 58 01	48917015900011	2021-06-14 07:11:04.746524	t
393	124330	CLIENT INACTIF	NOTAIRE FONTAINE ROUSSEL & ASSOCIES	fontaineroussel&associes	Maître	mme deplaet  / etude fontaine roussel&associes	nan	0320125890	XXX	2021-06-14 07:11:06.860585	t
396	124370	CLIENT INACTIF	CADEAU THEVIN SARL	orpiagencethevineguia	Madame	cadeau marianne	mcadeau.cadeaugestion@orpi.com	01 60 94 24 24	33272634800052	2021-06-14 07:11:12.683897	t
413	124570	CLIENT ACTIF	EPYCEAIMMO	laforetangersepyceaimmo	Monsieur	pinault pierre yves	ppinault@laforet.com	0241327435	848360509	2021-06-14 07:11:36.939361	t
397	124380	CLIENT PARTICULIER	SCI	scikinos	Madame	chailloux marie ,  galon pauline	sci.kinos@gmail.com	0240296786	80744605900014	2021-06-14 07:11:13.8609	t
398	124390	CLIENT INACTIF	SARL PLACE DE l'IMMOBILIER LAVAL	stephaneplaza-laval	Monsieur	cacheux sebastien & sophie herve	laval@stephaneplazaimmobilier.com	0243913238	832 995 427 00016	2021-06-14 07:11:14.929023	t
430	1270202	CLIENT ACTIF	SARL A.I.G	guyhoquetexelmansrodet-rieu	Madame	rodet rieu valerie	guyhoquetexelmans@gmail.com	01 81 70 71 85	42956739900036	2021-06-14 07:12:01.137719	t
399	124400	CLIENT INACTIF	EQUIT IMMOBILIER	equitimmobilier	Madame	brouttier brérengère	nan	03 21 156 136	nan	2021-06-14 07:11:15.769155	t
414	124580	CLIENT ACTIF	SAS SOGIEF	sogiefimmobiliertonysipaseuth	Madame	hong pauline	tony@sogief.com	01.64.17.82.77	832753271	2021-06-14 07:11:39.962767	t
400	124410	CLIENT PARTICULIER	XXX	xxx	Madame	nafissa fellah	nafissafeliah@yahoo.fr	0662188295	XXX	2021-06-14 07:11:17.212352	t
401	124510	CLIENT ACTIF	SAS BSGI	bsgimmecorinnecattiaux	Madame	cattiaux corinne	XXX	01 58 03 58 22	40292514300065	2021-06-14 07:11:18.319236	t
421	124650	CLIENT INACTIF	SARL PRIMEA	primeaimmobilier	Mesdames	d'haussy anne-charlotte & flament déborah	anne-charlotte@primea.info	0320781155	348 730 581 00033	2021-06-14 07:11:50.206115	t
402	124450	CLIENT ACTIF	SASU DELF IMMOGEST	l'adressenation-sasudelfimmogest	Madame	perrillat delphine	delphine.perrillat@ladresse.com	01 81 69 56 30	81082315300012	2021-06-14 07:11:19.368827	t
415	124590	CLIENT ACTIF	ADX GROUPE CREDIT AGRICOLE	creditagricoleadxgroupe	ADX GROUPE CREDIT AGRICOLE	adx groupe credit agricole	nan	nan	nan	2021-06-14 07:11:41.169952	t
403	124460	CLIENT ACTIF	SARL CSG IMMOBILIER	guyhoquetsceaux-sarlcsgimmobilier	Madame	coppola christine      coppola gregory	mc.coppola@guyhoquet.com	01 41 60 87 87	825103831	2021-06-14 07:11:20.817453	t
426	1270200	CLIENT ACTIF	SARL MOUTINHO CONSEIL IMMOBILIER	remaxhomepremiummouthinoconseilimmobilier	Monsieur	moutinho brice	brice.moutinho@remax.fr	01 41 52 22 22	500662374	2021-06-14 07:11:56.63889	t
416	124600	CLIENT ACTIF	HAG IMMOBILIER	l'adressepoissyhagimmobilier	Monsieur	tabone et hafner	poissy@ladresse.com	0139112365	501 623 565 00022	2021-06-14 07:11:42.821246	t
422	12660	CLIENT INACTIF	SARLAU VLADEREN IMMO	vladerenimmo	Madame	roger marine	m.roger@vlanderenimmo.com	0362653690	509 078 887 00049	2021-06-14 07:11:51.876208	t
417	124610	CLIENT ACTIF	IMMOPLESSIS	l'adresseplessisrobinsson	Monsieur	gandillon ohilippe	p.gandillon@immoplessis.fr	01.46.30.18.48	444 525 976 00015	2021-06-14 07:11:44.410929	t
418	124620	CLIENT ACTIF	SARL RUE DE LA PAIX;IMMO	ruedelapaix;immom.batardierejacques	Monsieur	batardiere jacques	m.vernerey@rdp.immo	02 52 09 73 52	843 438 680 00020	2021-06-14 07:11:45.701906	t
419	124630	CLIENT INACTIF	SARL EFI	ericfranquesimmobilier	Monsieur	eric franques	nan	0320149474	384 010 286 00043	2021-06-14 07:11:47.479988	t
423	126670	CLIENT PARTICULIER	PARTICULIER	particulier	nan	roche  guillaume	XXX	XXX	XXX	2021-06-14 07:11:53.040159	t
427	1270207	CLIENT PARTICULIER	PARTICULIER	particulier	Monsieur	godefroy alexandre	nan	nan	nan	2021-06-14 07:11:57.989797	t
424	1270198	CLIENT ACTIF	SOCIETE A RESPONSABILITE LIMITEE	immobilieresaintjames	Monsieur	nardot stephane	kgk@wanadoo.fr	06 89 70 02 93	48378646	2021-06-14 07:11:54.12859	t
425	1270199	CLIENT ACTIF	SAS O THENTIK	laforetimmo-cholet	Monsieur	duguet gregoire	cholet@laforet.com	02 41 49 42 42	52036234400035	2021-06-14 07:11:55.274608	t
428	1270205	CLIENT PARTICULIER	PARTICULIER	particulier	Monsieur	perrier  jean-joel	nan	nan	nan	2021-06-14 07:11:59.008879	t
431	1270204	CLIENT ACTIF	SARL TALENTIS IMMO	talentisimmommefonteneaumarianne	Madame	fonteneau marianne	contact@talentis-immo.com	02 51 84 26 22	49435648800010	2021-06-14 07:12:02.761972	t
429	1270203	CLIENT PARTICULIER	PARTICULIER	particulier	Monsieur	messager michel	nan	nan	nan	2021-06-14 07:11:59.992374	t
434	1270208	CLIENT PARTICULIER	PARTICULIER	particulier	Monsieur	courtin jean marie	nan	nan	nan	2021-06-14 07:12:07.185274	t
433	1270206	CLIENT ACTIF	SCI F.D.J	scifdjm.azemadavid	Monsieur	azema  david	sci.fdj.net@gmail.com	06 78 96 13 06	81508648300014	2021-06-14 07:12:05.944762	t
432	1270207	nan	PARTICULIER	particulier	Madame	blouin sonia	sonia.blouin@hotmail.fr	0644311462	nan	2021-06-14 07:12:04.246861	t
435	1270209	CLIENT PARTICULIER	PARTICULIER	particulier	Madame	blais yvette	nan	nan	nan	2021-06-14 07:12:08.398223	t
436	1270210	CLIENT ACTIF	SARL L'IMMOBILIER POUR TOUS	century21l'immobilierpourtous	Madame et Monsieur	ribeiro anais // zitouni hacene	century21centralimmo.com	02 40 46 19 58	53825839300015	2021-06-14 07:12:09.889257	t
437	1270211	CLIENT PARTICULIER	PARTICULIER	particulier	Monsieur	mr delmas	jean.michel.delmas@orange.fr	nan	nan	2021-06-14 07:12:11.339003	t
438	1270222	CLIENT PARTICULIER	PARTICULIER	particulier	Madame	couturier marie-pierre	mp.couturier@orange.fr	nan	nan	2021-06-14 07:12:13.138826	t
439	1270213	CLIENT ACTIF	PRO CITY IMMOBILIER	procityimmobilier	Monsieur	payen franck	agence@procityimmobilier.fr	0175579217	753300169	2021-06-14 07:12:14.254356	t
440	1270216	CLIENT ACTIF	PROCITY GEST	procitygestimmobilierprocitygest	Madame	desnoyers de bieville dixie	location@procityimmobilier.fr	0175579217	799612932	2021-06-14 07:12:15.447887	t
441	1270214	CLIENT INACTIF	ROUSSEAU IMMOBILIER IMMOBILIERE COMINE	alainrousseauimmobilier	Monsieur	rousseau guillaume	angers@alain-rousseau.com	0241241370	414 709 980 00018	2021-06-14 07:12:17.090087	t
464	\N	CLIENT ACTIF	XXX	xxx	Monsieur	perrier jean joel	jean-joel2@hotmail.fr	06 16 90 40 38	XXX	2021-06-14 07:12:49.551191	t
442	1270217	CLIENT PARTICULIER	GOUT JOSEPH	goutjoseph	Monsieur	gout joseph	nicole.gout31@orange.fr	0689738860	XXX	2021-06-14 07:12:18.202929	t
455	1270237	CLIENT ACTIF	DEHEUL Vincent	deheul﻿vincent	Monsieur	deheul vincent	Vincent.DEHEUL@albioma.com	06 22 84 23 95	xxx	2021-06-14 07:12:37.053285	t
443	1270215	CLIENT ACTIF	SARL LOUAME	l'adressecarquefou-sarllouame	Monsieur	blanvillain sebastien	nan	0240527575	538305830	2021-06-14 07:12:19.400199	t
444	1270220	CLIENT ACTIF	SARL BOOSTER ROSERAIE	boosterimmobilier	Madame	reglat berengere	berengere@booster-valorem.com	0562307000	51498311300010	2021-06-14 07:12:20.645546	t
445	1270221	CLIENT	SALERNO MARC	salernomarc	Monsieur	salerno marc	salernomarc@orange.fr	0687933018	XXX	2021-06-14 07:12:22.948614	t
456	1270238	CLIENT ACTIF	SAVOUREUX CYRIL	savoureuxcyril	Monsieur	savoureux cyril	cyril.savoureux@gmail.com	06 89 73 88 60	xxx	2021-06-14 07:12:38.347329	t
446	1270223	CLIENT ACTIF	SARL MPI	pennimmobilierimmobiliersarlmpi	Monsieur	penn marc	vitre@penn-immobilier.com	0299740000	44520775600013	2021-06-14 07:12:24.834257	t
447	1270225	CLIENT ACTIF	J&R IMMOBILIER	laforetstorensdegamevilleelodiepech	Monsieur	rezag remy	saintorens@laforet.com	0582958451	838 405 322 00010	2021-06-14 07:12:26.110795	t
457	\N	CLIENT ACTIF	MR ET MME DARDE	mretmmedarde	Madame et Monsieur	darde	select.product@wanadoo.fr	06 08 77 21 73	xxx	2021-06-14 07:12:39.553167	t
448	1270227	CLIENT ACTIF	ES IMMO	l'adressesaintpierremontlimart	Madame	secher emilie	nan	nan	882 702 244 00014	2021-06-14 07:12:27.210653	t
449	1270228	CLIENT ACTIF	SCI IMMOGROUP	immogroupmtourneuxetmvaygeois	Messieurs	m ludovic tourneux\nm alexis vaugeois	immogroup53@gmail.com	nan	827 837 915 00012	2021-06-14 07:12:28.514217	t
450	1270229	CLIENT ACTIF	SARL  LOGETTE IMMOBILIER	nestenn-logetteimmobilier	Madame	christine logette	merignac@nestenn.com	05 56 35 90 52	78934154200015	2021-06-14 07:12:29.662921	t
451	\N	CLIENT ACTIF	PARTICULIER	particulier	Madame et Monsieur	petillat damien et robert delphine	delphinrobert80@gmail.com	0682253010	PARTICULIER	2021-06-14 07:12:30.816302	t
452	1270232 l'Adresse Gambetta\n1270233 l'Adresse Cersoy & Girard	CLIENT ACTIF	SAS HOLDING LAURENT	l'adressegambettal'adressecersoy&girard	Monsieur	laurent eric	eric.laurent@ladresse.com	01 60 08 20 30 / 01 60 08 44 00	41175479900020	2021-06-14 07:12:32.71327	t
458	1270240	CLIENT ACTIF	SASU ESPACE HABITAT BCI	espacehabitat	Madame	lagueyt  brigitte	gestion.espace.habitat@gmail.com	05 56 02 30 82	50502065100028	2021-06-14 07:12:40.599501	t
453	1270234	CLIENT ACTIF	WEST IMMOBILIER - LAFORET	westimmobilierlaforetquimper	Monsieur	le floc'h françois	flefloch@westimmobilier.com	02 98 93 40 63 \net \n02 98 98 77 77	50842406600092	2021-06-14 07:12:34.18513	t
454	1270235	CLIENT ACTIF	THEMEIS IMMOBILIER SGI SARL SOBIM GESTION IMMOBILIER	themeisimmobilier-sgisarlsombimgestionimmobilier	Monsieur	morel jean marc	almarie@themeis.fr	01 34 83 31 36	80235796200017	2021-06-14 07:12:35.347971	t
459	\N	CLIENT ACTIF	SARL CABINET FRUCHET	cabinetfruchet	Monsieur	fruchet benjamin	contact@chantonnay-immobilier.com	nan	38221812100012	2021-06-14 07:12:41.841934	t
460	\N	CLIENT PARTICULIER	SCI PIPA ACC	xxx	Madame	clavier anne-cecile	ac.clavier@gmail.com	06 75 60 09 81	83434119000017	2021-06-14 07:12:44.017446	t
461	\N	CLIENT PARTICULIER	XXX	xxx	Monsieur	blot patrice	blotpatrice@gmail.com	06 76 50 53 21	XXX	2021-06-14 07:12:45.049081	t
465	1270252	CLIENT PARTICULIER	XXX	xxx	Madame et Monsieur	detoc olivier et laetitia	factdetoc@gmail.com	0662872212	XXX	2021-06-14 07:12:50.657102	t
462	1270244	CLIENT ACTIF	IMMO DE FRANCE LA ROCHE SUR YON	immodefrancelarochesuryon	MADAME	vaigreville murielle	mvaigreville@procivis-ouest.fr	0251377778	44136160700035	2021-06-14 07:12:46.41204	t
463	1270248	CLIENT ACTIF	SASU BERNARD KOENIG IMMOBILIER	guyhoquetparis14plaisancepernety	Monsieur	bernard  eric	paris14plaisance@guyhoquet.com       /           e.bernard@guyhoquet.com	01 81 69 77 20	82110015300013	2021-06-14 07:12:47.594801	t
466	\N	CLIENT ACTIF	SARL ACTIAL	l'adressecarquefou-sarlactial	Monsieur	blanvillain sebastien	sebastien.blanvillain@ladresse.com	nan	389 918 137 00040	2021-06-14 07:12:52.210148	t
467	\N	CLIENT ACTIF	XXX	boivin-champeauxbenedicteetalix	Madame et Monsieur	boivin-champeaux benedicte et alix	bboivinchampeaux@wanadoo.fr	01 45 04 11 39	XXX	2021-06-14 07:12:55.650411	t
470	\N	CLIENT ACTIF	XXX	chavyclaire	Madame	chavy claire	clairechavy@yahoo.fr	06 50 74 36 30	XXX	2021-06-14 07:12:59.595859	t
468	1270255	CLIENT ACTIF	XXX	blanchemariehelene	Madame	blanche marie helene	mariehelene.blanche@laposte.net	06 80 22 72 35	XXX	2021-06-14 07:12:57.009427	t
469	1270256	CLIENT ACTIF	SAS	towerimmobilier	Monsieur	charpentier david	david.charpentier@tower-immobilier.fr	07 62 42 93 52	813492683	2021-06-14 07:12:58.116906	t
471	\N	CLIENT ACTIF	SCI DES AMITIERES	morantinagnes	Madame	morantin agnes	agnesmorantin@gmail.com	06 76 56 08 61	878 321 231 00010	2021-06-14 07:13:00.872398	t
472	\N	CLIENT ACTIF	SARL ACM TRANSACTION	acmtransactionmmebroussegeraldine	Madame	brousse geraldine	acm.transactions@gmail.com  / geraldineacm@gmail.com	05 56 59 61 25	49788559000024	2021-06-14 07:13:01.88004	t
473	1270266	CLIENT ACTIF	PARTICULIER	perrinehansen	Madame	perrine hansen	perrine.hansen@gmail.com	0640997915	XXX	2021-06-14 07:13:03.111139	t
474	\N	CLIENT ACTIF	PARTICULIER	epagnouxsebastienludmila	Monsieur Madame	epagnoux sebastien ludmila	sepagnoux@yahoo.fr  /  lepagnoux@yahoo.com	06 86 41 19 89	XXX	2021-06-14 07:13:04.169312	t
475	\N	nan	nan	bougelaurent	nan	\N	nan	nan	nan	2021-06-14 07:13:06.975279	t
476	\N	CLIENT ACTIF	PARTICULIER	lefevrechristine	Monsieur	bouge laurent	laurent.bourge@valeo.com	06 08 76 24 52	XXX	2021-06-14 07:13:08.004873	t
477	\N	CLIENT ACTIF	PARTICULIER	manganijean-michel	Madame	lefevre christine	christinemarquis@sfr.fr	06.31.77.31.64	XXX	2021-06-14 07:13:09.082942	t
478	\N	CLIENT ACTIF	PARTICULIER	manganijean-michel	Monsieur	mangani  jean-michel	manganijm@yahoo.fr	: 06 10 27 16 30	XXX	2021-06-14 07:13:11.142203	t
479	\N	CLIENT PARTICULIER	PARTICULIER	particulier	Monsieur	lestienne thomas	tom.lestienne@gmail.com	06 58 89 11 16	XXX	2021-06-14 07:13:13.293812	t
\.


--
-- Data for Name: Client_History; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Client_History" (id, client_id, adresse1, adresse2, etat_client, cp, ville, pays, login_extranet, mpd_extranet, abonnement, date, visibility) FROM stdin;
1	1	Centre Commercial des Grandes Terres	nan	t	78160	MARLY-LE-ROY	FRANCE	AM001	H2Z1FA	\N	2021-06-14 07:02:19.293217	t
2	2	12 rue de l'Orangerie	nan	t	78000	VERSAILLES	FRANCE	nan	nan	\N	2021-06-14 07:02:21.144476	t
3	3	12 rue de l'Orangerie	nan	t	78000	VERSAILLES	FRANCE	nan	nan	\N	2021-06-14 07:02:22.114212	t
4	4	12 rue de l'Orangerie	nan	t	78000	VERSAILLES	FRANCE	nan	nan	\N	2021-06-14 07:02:23.0536	t
5	5	12 rue de l'Orangerie	nan	t	78000	VERSAILLES	FRANCE	nan	nan	\N	2021-06-14 07:02:24.505805	t
6	6	174 rue de Tolbiac	nan	t	75013	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:02:25.303145	t
7	7	17 rue Dumont d'Urville	nan	t	75016	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:02:26.256387	t
8	8	9 rue Pourtoules	nan	t	84100	ORANGE	FRANCE	nan	nan	\N	2021-06-14 07:02:27.173194	t
9	9	12  rue de l'Orangerie	nan	t	78000	VERSAILLES	FRANCE	nan	nan	\N	2021-06-14 07:02:27.992247	t
10	10	4 Place Vendôme	nan	t	75001	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:02:28.891929	t
11	11	8 RUE DE LA CLAIE	nan	t	49070	BEAUCOUZE	FRANCE	AM1841	H2Z1FA1	\N	2021-06-14 07:02:29.723899	t
12	12	70 bis route de la Reine	nan	t	92100	BOULOGNE BILLANCOURT	FRANCE	nan	nan	\N	2021-06-14 07:02:31.358307	t
13	13	7 bis rue de la Parroisse	nan	t	78000	VERSAILLES	FRANCE	nan	nan	\N	2021-06-14 07:02:32.511152	t
14	14	2 Place de la Gare	nan	t	92350	BOURG LA REINE	FRANCE	nan	nan	\N	2021-06-14 07:02:33.51795	t
15	15	1bis rue du Haras	nan	t	49100	ANGERS	FRANCE	nan	nan	\N	2021-06-14 07:02:34.619085	t
16	16	117 - 123 rue d'Aguesseau	nan	t	92100	BOULOGNE BILLANCOURT	FRANCE	AM053	X7QAV4	\N	2021-06-14 07:02:35.658878	t
17	17	36 rue Jean-Pierre Timbaud	nan	t	92130	ISSY LES MOULINEAUX	FRANCE	nan	nan	\N	2021-06-14 07:02:36.69008	t
18	18	106 rue de Général Leclerc	nan	t	95130	FRANCONVILLE	FRANCE	nan	nan	\N	2021-06-14 07:02:38.440199	t
19	19	4 Square des Artistes	nan	t	95520	OSNY	FRANCE	nan	nan	\N	2021-06-14 07:02:39.277367	t
20	20	17 rue Dumont d'Urville	nan	t	75016	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:02:40.230905	t
21	21	10 rue Hubert de la Brosse	nan	t	44700	ORVAULT	FRANCE	nan	nan	\N	2021-06-14 07:02:41.486875	t
22	22	1 avenue Docteur Blanchet	nan	t	77500	CHELLES	FRANCE	nan	nan	\N	2021-06-14 07:02:43.0487	t
23	23	3 rue de la Crèche	nan	t	77100	MEAUX	FRANCE	AM076	T4M7R0	\N	2021-06-14 07:02:44.466426	t
24	24	53 rue du Bournard	nan	t	92700	COLOMBES	FRANCE	nan	nan	\N	2021-06-14 07:02:45.600716	t
25	25	9 rue Grandet	nan	t	49000	ANGERS	FRANCE	AM081	NOGYL3	\N	2021-06-14 07:02:46.658375	t
26	26	8 bis rue Luis Bunuel	nan	t	77100	MEAUX	FRANCE	nan	nan	\N	2021-06-14 07:02:47.784411	t
27	27	2 rue Jean Bonnardel	nan	t	33140	VILLENAVE D'ORNON	FRANCE	nan	nan	\N	2021-06-14 07:02:48.691826	t
28	28	57 Bd Antoine Giroust	nan	t	77600	BUSSY SAINT GEORGES	FRANCE	nan	nan	\N	2021-06-14 07:02:49.784462	t
29	29	14 Cours du Maréchal Galliéni	nan	t	nan	TALENCE\nBORDEAUX	FRANCE	nan	nan	\N	2021-06-14 07:02:50.964922	t
30	30	83 Cours du Maréchal Galliéni	nan	t	33000	BORDEAUX	FRANCE	nan	nan	\N	2021-06-14 07:02:52.283422	t
31	31	55 bis avenue Pasteur	nan	t	33600	PESSAC	FRANCE	nan	nan	\N	2021-06-14 07:02:53.678395	t
32	32	26/32 avenue de la Division Leclerc	nan	t	92160	ANTONY	FRANCE	AM100	T4L7R0	\N	2021-06-14 07:02:55.080481	t
33	33	2 Bdl Maréchal Joffre	nan	t	95240	CORMEILLES EN PARISIS	FRANCE	nan	nan	\N	2021-06-14 07:02:56.302946	t
34	34	3 Place du Marché	nan	t	77270	VILLEPARISIS	FRANCE	nan	nan	\N	2021-06-14 07:02:57.663871	t
35	35	11 rue du Chemin de Fer	nan	t	77400	LAGNY SUR MARNE	FRANCE	nan	nan	\N	2021-06-14 07:02:58.965124	t
36	36	7 rue de la Crèche	nan	t	77100	MEAUX	FRANCE	nan	nan	\N	2021-06-14 07:03:00.21508	t
37	37	57 Bd Antoine Giroust	nan	t	77600	BUSSY SAINT GEORGES	FRANCE	nan	nan	\N	2021-06-14 07:03:01.448396	t
38	38	57 Bd Antoine Giroust	nan	t	77600	BUSSY SAINT GEORGES	FRANCE	nan	nan	\N	2021-06-14 07:03:02.578177	t
39	39	57 Bd Antoine Giroust	nan	t	77600	BUSSY SAINT GEORGES	FRANCE	nan	nan	\N	2021-06-14 07:03:04.951249	t
40	40	8 rue de l'Eglise	nan	t	77970	BANNOST VILLEGAGNON	FRANCE	nan	nan	\N	2021-06-14 07:03:06.191642	t
41	41	22 avenue de la Libération	nan	t	33310	LORMONT	FRANCE	nan	nan	\N	2021-06-14 07:03:07.147647	t
42	42	30 rue de Bel Air	nan	t	44000	NANTES	FRANCE	nan	nan	\N	2021-06-14 07:03:08.286054	t
43	43	1 Place Saint Similien	nan	t	44000	NANTES	FRANCE	nan	nan	\N	2021-06-14 07:03:09.34373	t
44	44	24 rue Charles Rouxel	nan	t	77340	PONTAULT COMBAULT	FRANCE	nan	nan	\N	2021-06-14 07:03:10.334548	t
45	45	31 Cours saint Louis	nan	t	33000	BORDEAUX	FRANCE	nan	nan	\N	2021-06-14 07:03:14.715459	t
46	46	1859 avenue Roger Salengro	nan	t	92370	CHAVILLE	FRANCE	AM126	H2ZIF9	\N	2021-06-14 07:03:17.80531	t
47	47	58 avenue Auguste Conte	nan	t	33560	CARDON BLANC	FRANCE	nan	nan	\N	2021-06-14 07:03:19.847671	t
48	48	23 rue Condorcet	nan	t	75009	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:03:21.390544	t
49	49	105 route de la Reine	nan	t	92100	BOULOGNE BILLANCOURT	FRANCE	AM129	K3COHQ	\N	2021-06-14 07:03:22.5674	t
50	50	5 rue du Pontcel	nan	t	95270	LUZARCHES	FRANCE	nan	nan	\N	2021-06-14 07:03:24.179228	t
51	51	8 Place de la Libération	nan	t	77600	BUSSY SAINT GEORGES	FRANCE	AM136	J3BOGA	\N	2021-06-14 07:03:25.806622	t
52	52	1 rue de l'Est	nan	t	77340	PONTAULT COMBAULT	FRANCE	nan	nan	\N	2021-06-14 07:03:26.94592	t
53	53	3 rue de la Marèche	nan	t	95180	MENUCOURT	FRANCE	nan	nan	\N	2021-06-14 07:03:28.144544	t
54	54	22 Bd des Filles du Calvaire	nan	t	75011	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:03:29.546525	t
55	55	15 rue Paul Lorillon	BP17	t	95440	ECOUEN	FRANCE	nan	nan	\N	2021-06-14 07:03:30.751147	t
56	56	158 avenue Paul Doumer	nan	t	92500	RUEIL MALMAISON	FRANCE	nan	nan	\N	2021-06-14 07:03:32.09681	t
57	57	11 rue Maréchal Foch	nan	t	78400	CHATOU	FRANCE	nan	nan	\N	2021-06-14 07:03:33.649245	t
58	58	30 rue de Normandie	nan	t	92600	ASNIERES SUR SEINE	FRANCE	nan	nan	\N	2021-06-14 07:03:34.755417	t
59	59	46 rue Bertrand Flornoy	nan	t	77120	COULOMMIERS	FRANCE	nan	nan	\N	2021-06-14 07:03:35.927853	t
60	60	5 rue du Commandant Charcot	nan	t	33520	BRUGES	FRANCE	nan	nan	\N	2021-06-14 07:03:37.44318	t
61	61	21 avenue Thiers	nan	t	33100	BORDEAUX	FRANCE	nan	nan	\N	2021-06-14 07:03:38.332894	t
62	62	34 avenue Charles de Gaulle	nan	t	92350	LE PLESSIS ROBINSON	FRANCE	AM169	X7QAV4	\N	2021-06-14 07:03:39.289942	t
63	63	7 rue du Parisis	nan	t	95270	LUZARCHES	FRANCE	nan	nan	\N	2021-06-14 07:03:40.281378	t
64	64	6 Place du Général Leclerc	nan	t	92700	COLOMBES	FRANCE	AM171	ABB092	\N	2021-06-14 07:03:41.308447	t
65	65	20 avenue Pasteur	nan	t	33600	PESSAC	FRANCE	nan	nan	\N	2021-06-14 07:03:42.785577	t
66	66	9 rue Gargoulleau	nan	t	17000	LA ROCHELLE	FRANCE	nan	nan	\N	2021-06-14 07:03:44.132678	t
84	84	28 rue de Verdun	nan	t	44210	PORNIC	FRANCE	AM2021	Q0H4NI1	\N	2021-06-14 07:04:01.928279	t
85	85	39 41 rue de la République	nan	t	77340	PONTAULT COMBAULT	FRANCE	nan	nan	\N	2021-06-14 07:04:02.960062	t
86	86	5 rue Claude Bernard	nan	t	75005	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:04:05.165265	t
87	87	Résidence Marina Beach Bat 7 Porte 3	Bd Hassan II	t	20800	MOHAMMEDIA MAROC	FRANCE	nan	nan	\N	2021-06-14 07:04:06.882404	t
88	88	14 Boulevard de la Plage	nan	t	33138	TAUSSAT	FRANCE	nan	nan	\N	2021-06-14 07:04:08.140408	t
89	89	55 rue Raymond Berrurier	nan	t	78320	LE MESNIL SAINT DENIS	FRANCE	nan	nan	\N	2021-06-14 07:04:12.532832	t
90	90	51 Avenue de la République	nan	t	75011	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:04:13.891591	t
91	91	22 rue d'Avron	nan	t	75020	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:04:15.446021	t
92	92	232 Boulevard Voltaire	nan	t	75011	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:04:17.793427	t
93	93	249 bis rue des Pyrénées	nan	t	75020	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:04:19.044935	t
94	94	12 rue Hyppolyte Minier	nan	t	33800	BORDEAUX	FRANCE	nan	nan	\N	2021-06-14 07:04:20.250602	t
95	95	11 avenue de Bouvine	nan	t	75011	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:04:21.361586	t
96	96	14 rue Montaigne	nan	t	33160	SAINT MEDARD EN JALLES	FRANCE	nan	nan	\N	2021-06-14 07:04:22.620466	t
97	97	32 boulevard Vincent Gache	nan	t	44200	NANTES	FRANCE	nan	nan	\N	2021-06-14 07:04:23.909362	t
101	101	40 rue Héricart de Thury	nan	t	33120	ARCACHON	FRANCE	nan	nan	\N	2021-06-14 07:04:29.071664	t
123	123	29 rue Tourat	nan	t	33000	BORDEAUX	FRANCE	nan	nan	\N	2021-06-14 07:04:52.599628	t
124	124	135 rue de Ferreyre	nan	t	33450	IZON	FRANCE	nan	nan	\N	2021-06-14 07:04:53.590677	t
125	125	4 rue Gabriel Péri	nan	t	31000	TOULOUSE	FRANCE	nan	nan	\N	2021-06-14 07:04:54.786392	t
126	126	4 rue Georges Clémenceau	nan	t	85520	JARD SUR MER	FRANCE	nan	nan	\N	2021-06-14 07:04:55.636639	t
127	127	1 rue Saint Aignan	nan	t	33450	SAINT LOUBES	FRANCE	nan	nan	\N	2021-06-14 07:04:56.860233	t
128	128	Centre Commercial boulevard du Manoir Saint Lô	nan	t	44300	NANTES	FRANCE	nan	nan	\N	2021-06-14 07:04:57.668262	t
129	129	14 Boulevard de la Plage	nan	t	33120	ARCACHON	FRANCE	nan	nan	\N	2021-06-14 07:04:58.541643	t
130	130	9 Allée E Boissière	nan	t	33980	AUDENGE	FRANCE	nan	nan	\N	2021-06-14 07:04:59.44463	t
131	131	202 Bd Voltaire	nan	t	75011	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:05:00.324108	t
132	132	1 rue Serpentine BP 52	nan	t	85002	LA ROCHE SUR YON	FRANCE	AM451	SIO85C	\N	2021-06-14 07:05:01.207108	t
133	133	6rue de Nadeau	nan	t	33200	BORDEAUX	FRANCE	nan	nan	\N	2021-06-14 07:05:02.456615	t
134	134	41 RUE DES LICES	nan	t	49100	ANGERS	FRANCE	AM2591	JOUB491	\N	2021-06-14 07:05:03.602078	t
135	135	5 Place Lorraine	nan	t	49000	ANGERS	FRANCE	AM610	SER49P	\N	2021-06-14 07:05:04.52988	t
136	136	7 Bd Arnaud	nan	t	49100	ANGERS	FRANCE	AM261	49ABCI	\N	2021-06-14 07:05:05.713285	t
140	140	19 rue du Primptemps	nan	t	75017	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:05:09.434102	t
141	141	1C avenue Ch. Doppler	nan	t	77700	SERRIS	FRANCE	nan	nan	\N	2021-06-14 07:05:10.382433	t
142	142	63/65 Boulevard Georges V	nan	t	33000	BORDEAUX	FRANCE	nan	nan	\N	2021-06-14 07:05:11.320066	t
143	143	148 Boulevard Voltaire	nan	t	75011	PARIS	FRANCE	AM2681	LDPAR75	\N	2021-06-14 07:05:12.274896	t
144	144	2 Place Saint Pierre	nan	t	44470	CARQUEFOU	FRANCE	nan	nan	\N	2021-06-14 07:05:13.182378	t
145	145	C.C DE L'OLIVEY 146 avenue de la République	nan	t	33450	SAINT LOUBES	FRANCE	nan	nan	\N	2021-06-14 07:05:14.185473	t
146	146	16 rue de la Plage	nan	t	33780	SOULAC	FRANCE	nan	nan	\N	2021-06-14 07:05:15.032092	t
147	147	48 BOULEVARD DE VANVES	nan	t	92320	CHATILLON	FRANCE	AM272	BPR92P	\N	2021-06-14 07:05:16.215033	t
148	148	23 avenue Aristide Briand	nan	t	92160	ANTONY	FRANCE	AM273	AER92G	\N	2021-06-14 07:05:17.012741	t
149	149	12 avenue du Gé,éral de Gaulle	nan	t	77600	BUSSY SAINT GEORGES	FRANCE	AM274	SYL6QO	\N	2021-06-14 07:05:17.912186	t
150	150	10 bis rue du Général Leclerc	nan	t	85300	CHALLANS	FRANCE	nan	nan	\N	2021-06-14 07:05:18.743695	t
151	151	88 avenue Henri Barbusse	nan	t	94240	L'HAY LES ROSES	FRANCE	nan	nan	\N	2021-06-14 07:05:19.903313	t
152	152	44 rue de Paris	nan	t	93260	LES LILAS	FRANCE	AM277	AUR93B	\N	2021-06-14 07:05:20.71156	t
153	153	1 rue Amedée Gordini	nan	t	85109	LES SABLES D'OLONNE	FRANCE	AM2781	J3BOGA1	\N	2021-06-14 07:05:21.667511	t
154	154	11 rue Chanez	nan	t	75016	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:05:22.586374	t
155	155	8 RUE DENIS PAPIN	nan	t	41000	BLOIS	FRANCE	AM281	Q0J4NI	\N	2021-06-14 07:05:23.454708	t
156	156	5 Quai de Bacalan	nan	t	33300	BORDEAUX	FRANCE	nan	nan	\N	2021-06-14 07:05:24.319779	t
157	157	5 BOULEVARD ILE VERTIME	nan	t	85100	LES SABLES D'OLONNE	FRANCE	AM283	K3COHQ	\N	2021-06-14 07:05:25.553287	t
158	158	68 rue de la Rousselle	nan	t	33000	BORDEAUX	FRANCE	nan	nan	\N	2021-06-14 07:05:26.412314	t
159	159	19 rue du Cep	nan	t	78300	POISSY	FRANCE	AM285	FIS078	\N	2021-06-14 07:05:27.274119	t
160	160	38 40 rue de la Convention	nan	t	94270	LE KREMELIN BICETRE	FRANCE	nan	nan	\N	2021-06-14 07:05:28.09941	t
67	67	45 rue des Rosiers	nan	t	92500	RUEIL MALMAISON	FRANCE	nan	nan	\N	2021-06-14 07:03:44.937781	t
68	68	265 Place de l'Eglise	nan	t	60230	CHAMBLY	FRANCE	nan	nan	\N	2021-06-14 07:03:45.823929	t
69	69	24 rue des Halles	nan	t	85200	FONTENAY LE COMTE	FRANCE	AM177	W6P9VY	\N	2021-06-14 07:03:46.755526	t
70	70	32 rue de l'An VI	nan	t	85450	CHAILLE LES MARAIS	FRANCE	AM178	J3BOGA	\N	2021-06-14 07:03:47.950988	t
71	71	20 rue Béranger	nan	t	92240	MALAKOFF	FRANCE	nan	nan	\N	2021-06-14 07:03:48.871174	t
72	72	24 rue de Verdun	nan	t	85000	LA ROCHE SUR YON	FRANCE	AM025	AM025	\N	2021-06-14 07:03:49.903331	t
73	73	45 avenue du Général de Gaulle	nan	t	17230	MARANS	FRANCE	nan	nan	\N	2021-06-14 07:03:50.791547	t
74	74	74 Quai de la République	nan	t	85800	SAINT GILLES CROIX DE VIIE	FRANCE	nan	nan	\N	2021-06-14 07:03:51.750745	t
75	75	7 bis rue  Maurice	nan	t	33300	BORDEAUX	FRANCE	nan	nan	\N	2021-06-14 07:03:52.80243	t
76	76	3 rue Louis Cormerais	nan	t	44310	SAINT PHILBERT DES GRAND LIEU	FRANCE	nan	nan	\N	2021-06-14 07:03:53.983786	t
77	77	13 rue Bothiron	nan	t	33290	BLANQUEFORT	FRANCE	nan	nan	\N	2021-06-14 07:03:54.784517	t
78	78	54 Avenue Charles de Gaulle	nan	t	85340	OLONNE SUR MER	FRANCE	nan	nan	\N	2021-06-14 07:03:55.694039	t
79	79	2 AVENUE GERARD SAINT	nan	t	44300	NANTES	FRANCE	nan	nan	\N	2021-06-14 07:03:56.534247	t
80	80	8 Cité Condorcet	nan	t	75009	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:03:57.412098	t
81	81	1 avenue de la Plage	nan	t	85800	SAINT GILLES CROIX DE VIIE	FRANCE	nan	nan	\N	2021-06-14 07:03:58.280271	t
82	82	83 Boulevard de la République	nan	t	17200	ROYAN	FRANCE	AM201	X7QAV4	\N	2021-06-14 07:03:59.58641	t
83	83	30 rue Jules Vernes	nan	t	44470	CARQUEFOU	FRANCE	nan	nan	\N	2021-06-14 07:04:00.832377	t
98	98	109 rue David Jonshton	nan	t	33000	BORDEAUX	FRANCE	nan	nan	\N	2021-06-14 07:04:25.483595	t
99	99	36 rue Jean-Pierre Timbaud	nan	t	92130	ISSY LES MOULINEAUX	FRANCE	nan	nan	\N	2021-06-14 07:04:26.359401	t
100	100	110 rue Orfila	nan	t	75020	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:04:27.531495	t
102	102	4 bis rue Ravenel	nan	t	49000	ANGERS	FRANCE	nan	nan	\N	2021-06-14 07:04:30.134964	t
103	103	13 rue Ferdinand Buissou	nan	t	33250	PAUILLAC	FRANCE	nan	nan	\N	2021-06-14 07:04:31.401062	t
104	104	108 rue de la Tour	nan	t	75016	PARIS	FRANCE	AM219	ILT16K	\N	2021-06-14 07:04:32.319277	t
105	105	6b Square Alexandre 1er de Yougoslavie	nan	t	53000	MAYENNE	FRANCE	nan	nan	\N	2021-06-14 07:04:33.629371	t
106	106	64 rue Ampère	nan	t	75017	PARIS	FRANCE	AM220	W6P9TY	\N	2021-06-14 07:04:35.321454	t
107	107	1 AVENUE DE SARIA	nan	t	77700	SERRIS	FRANCE	AM221	B8SQX5	\N	2021-06-14 07:04:36.315435	t
108	108	33 rue des Lices	nan	t	49100	ANGERS	FRANCE	nan	nan	\N	2021-06-14 07:04:37.232421	t
109	109	rue du Haras	nan	t	49000	ANGERS	FRANCE	nan	nan	\N	2021-06-14 07:04:38.54997	t
110	110	5 rue Jeanne D'arc	nan	t	44000	NANTES	FRANCE	AM412	4IMO44	\N	2021-06-14 07:04:39.694439	t
111	111	nan	nan	t	44000	ORVAULT	FRANCE	nan	nan	\N	2021-06-14 07:04:40.658234	t
112	112	46-48 rue d'Avron	nan	t	75020	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:04:41.794	t
113	113	13 rue des Petites Maisons	nan	t	85480	SAINT HILAIRE LE VOUHIS	FRANCE	nan	nan	\N	2021-06-14 07:04:42.791436	t
114	114	94 Route de Claye	nan	t	77400	THORIGNY sur MARNE	FRANCE	nan	nan	\N	2021-06-14 07:04:43.906545	t
115	115	1243 rue du Rosais	nan	t	85440	TALMONT SAINT HILAIRE	FRANCE	AM230	VRIG85	\N	2021-06-14 07:04:44.859317	t
116	116	3 bis rue Maingeaon	nan	t	33720	ILLATS	FRANCE	nan	nan	\N	2021-06-14 07:04:45.937269	t
117	117	20 avenue Pasteur	nan	t	33200	PESSAC	FRANCE	nan	nan	\N	2021-06-14 07:04:46.769512	t
118	118	9 avenue Marcel Dassault	nan	t	17312	ROCHEFORT SUR MER	FRANCE	AMI0138	tfevzK6u	\N	2021-06-14 07:04:47.671204	t
119	119	56 rue Gambetta	BP40523	t	17200	ROYAN CEDEX	FRANCE	nan	nan	\N	2021-06-14 07:04:48.495584	t
120	120	4 Grande Rue	nan	t	44118	LA CHEVROLIERE	FRANCE	nan	nan	\N	2021-06-14 07:04:49.350698	t
121	121	6 rue Francis de Pressense	nan	t	44000	NANTES	FRANCE	nan	nan	\N	2021-06-14 07:04:50.209114	t
122	122	29 rue Maurice Daniel	nan	t	44230	SAINT SEBASTIEN SUR LOIRE	FRANCE	nan	nan	\N	2021-06-14 07:04:51.488318	t
137	137	226 rue Marcadet	nan	t	75018	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:05:06.616329	t
138	138	52 Bis Boulevard foch	nan	t	49100	ANGERS	FRANCE	nan	nan	\N	2021-06-14 07:05:07.572829	t
139	139	36 bis Cours de Verdun	nan	t	33000	BORDEAUX	FRANCE	nan	nan	\N	2021-06-14 07:05:08.48293	t
161	161	13 Boulevard Guisthau	nan	t	44000	NANTES	FRANCE	AM294	CTI44	\N	2021-06-14 07:05:29.103624	t
162	162	15 rue Carnot	nan	t	78700	CONFLANS SAINTE HONORINE	FRANCE	nan	nan	\N	2021-06-14 07:05:30.087657	t
163	163	2 Place division Leclrec	nan	t	78960	VOISINS LE BRETONNEUX	FRANCE	nan	nan	\N	2021-06-14 07:05:31.164571	t
164	164	123 rue du Chateau	nan	t	92100	BOULOGNE BILLANCOURT	FRANCE	AM293	TRA92S	\N	2021-06-14 07:05:32.743495	t
165	165	67 Boulevard Voltaire	nan	t	75011	PARIS	FRANCE	AM295	SAI11P	\N	2021-06-14 07:05:33.716365	t
166	166	59 bis Grande Rue	nan	t	85430	AUBIGNY	FRANCE	nan	nan	\N	2021-06-14 07:05:34.657326	t
167	167	91 rue de Faubourg Saint Honoré	nan	t	75008	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:05:36.62884	t
168	168	37 rue Proudhon	nan	t	75012	PARIS	FRANCE	AM298	HAU12R	\N	2021-06-14 07:05:37.395489	t
169	169	37 rue Proudhon  //   246 RUE DU FBG ST ANTOINE	nan	t	75012	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:05:38.633396	t
170	170	4 rue Joachin du Bellay	nan	t	49100	ANGERS	FRANCE	nan	nan	\N	2021-06-14 07:05:39.754901	t
171	171	9 rue du Général Leclerc	nan	t	94510	LA QUEUE EN BRIE	FRANCE	nan	nan	\N	2021-06-14 07:05:40.697437	t
172	172	1 rue des Halles	nan	t	85000	LA ROCHE SUR YON	FRANCE	AM3031	LABE0851	\N	2021-06-14 07:05:42.384309	t
173	173	83 rue Sadi Carnot	nan	t	93170	BAGNOLET	FRANCE	nan	nan	\N	2021-06-14 07:05:43.371608	t
174	174	91 rue de Charonne	nan	t	75011	PARIS	FRANCE	AM3070	Er#a11Cha	\N	2021-06-14 07:05:44.289219	t
175	175	61 rue de Passy	nan	t	75016	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:05:45.485192	t
176	176	20 rue du Bac de Ris Bat C8	nan	t	91450	SOISY SUR SEINE	FRANCE	nan	nan	\N	2021-06-14 07:05:48.750637	t
177	177	154 avenue de Wagram	nan	t	75017	PARIS	FRANCE	AM313	BELI15	\N	2021-06-14 07:05:52.008984	t
178	178	49 rue de Dijon	nan	t	21121	DAIX	FRANCE	nan	nan	\N	2021-06-14 07:05:53.623693	t
179	179	11 Boulevard de Strasbourg	nan	t	94130	NOGENT SUR MARNE	FRANCE	nan	nan	\N	2021-06-14 07:05:55.183107	t
180	180	21 Cours Dupont	nan	t	85100	LES SABLES D'OLONNE	FRANCE	AM218	P0H4MI	\N	2021-06-14 07:05:57.606965	t
181	181	95 avenue Ledru Rolin	nan	t	75011	PARIS	FRANCE	AM317	JBS11G	\N	2021-06-14 07:05:59.660086	t
182	182	122 rue de Paris	nan	t	92100	BOULOGNE BILLANCOURT	FRANCE	nan	nan	\N	2021-06-14 07:06:01.801683	t
183	183	21 bis rue des Sables	nan	t	85340	OLONNE SUR MER	FRANCE	nan	nan	\N	2021-06-14 07:06:02.875077	t
184	184	56 rue Jean Bleuzen	nan	t	92170	VANVES	FRANCE	nan	nan	\N	2021-06-14 07:06:03.843362	t
185	185	8 rue Philippe le Hurepel	nan	t	77230	DAMARTIN EN GOELE	FRANCE	nan	nan	\N	2021-06-14 07:06:07.61843	t
186	186	20 rue du Belvédère	nan	t	92100	BOULOGNE BILLANCOURT	FRANCE	AM322	GHAU75	\N	2021-06-14 07:06:08.862202	t
187	187	13 Rue du Maréchal Joffre	nan	t	85000	LA ROCHE SUR YON	FRANCE	nan	nan	\N	2021-06-14 07:06:09.687203	t
199	199	19 rue de Vienne	TSA 90033	t	75801	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:06:25.930419	t
200	200	10/12 Place Vendôme	nan	t	75001	PARIS	FRANCE	AM342	HOME75	\N	2021-06-14 07:06:26.993243	t
201	201	14 Huberman Street	nan	t	64075	TEL-AVIV ISRAEL	FRANCE	nan	nan	\N	2021-06-14 07:06:28.216507	t
202	202	4 rue Corvetto	nan	t	75008	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:06:29.321591	t
203	203	20 Allée des 4 Vents	nan	t	92160	ANTONY	FRANCE	nan	nan	\N	2021-06-14 07:06:32.201457	t
204	204	33 rue de l'Orangerie	nan	t	78000	VERSAILLES	FRANCE	nan	nan	\N	2021-06-14 07:06:33.845389	t
205	205	70 rue d'Auteuil	nan	t	75016	PARIS	FRANCE	AM322	GHAU75	\N	2021-06-14 07:06:34.787737	t
216	216	183 boulevard Voltaire	nan	t	75011	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:06:52.123826	t
217	217	Lieu dit la BARTAIE	nan	t	49370	SAINT CLEMENT DE LA PLACE	FRANCE	nan	nan	\N	2021-06-14 07:06:53.091484	t
218	218	50 Rue d'Anjou	nan	t	49125	TIERCE	FRANCE	nan	nan	\N	2021-06-14 07:06:55.267713	t
219	219	1 AVENUE DU MARECHAL FOCH	nan	t	78800	HOUILLES	FRANCE	AM365	SEB78M	\N	2021-06-14 07:06:58.906151	t
220	220	14 avenue du Maréchal Foch	nan	t	78400	CHATOU	FRANCE	nan	nan	\N	2021-06-14 07:07:02.259702	t
221	221	1 Allée des Magnolias	nan	t	94550	CHAVILLY LARUE	FRANCE	nan	nan	\N	2021-06-14 07:07:04.055824	t
222	222	511 Route Saint Joseph	nan	t	44745	NANTES	FRANCE	AM3681	GUI0441	\N	2021-06-14 07:07:05.387982	t
223	223	2 Cours d'Armor Route de Savenay	nan	t	44360	SAINT ETIENNE DE MONTLUC	FRANCE	AMI0250	PfiUjivT	\N	2021-06-14 07:07:07.785346	t
224	224	8 rue des Croix	nan	t	53000	LAVAL	FRANCE	AM3701	MAIS531	\N	2021-06-14 07:07:09.142795	t
226	226	65 avenue Suffren	nan	t	75007	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:07:13.497294	t
238	238	1 RESIDENCE FONTAINE SAINT MARC	nan	t	77000	MELUN	FRANCE	nan	nan	\N	2021-06-14 07:07:26.216335	t
239	239	15 CHEMIN DU RO LA MADELAINE	nan	t	44350	GUERANDE	FRANCE	nan	nan	\N	2021-06-14 07:07:27.095844	t
240	240	26 rue de Douarnenez	nan	t	29000	QUIMPER	FRANCE	AM420	GRI029	\N	2021-06-14 07:07:27.968448	t
241	241	33 rue Delaâge	nan	t	49000	ANGERS	FRANCE	nan	nan	\N	2021-06-14 07:07:29.300703	t
242	242	24 rue Bannier	nan	t	45000	ORLEANS	FRANCE	AM600	PIC17V	\N	2021-06-14 07:07:30.635913	t
243	243	74  rue de la Boulie	nan	t	91370	VERRIERE LE BUISSON	FRANCE	nan	nan	\N	2021-06-14 07:07:31.457097	t
188	188	48 rue du Brandon	nan	t	85500	LES HERBIERS	FRANCE	AM326	CB1H32PE	\N	2021-06-14 07:06:11.105385	t
189	189	15 bis avenue du Maréchal Foch	nan	t	77500	CHELLES	FRANCE	nan	nan	\N	2021-06-14 07:06:12.137402	t
190	190	21 rue Jeanne Jugan	nan	t	35400	SAINT MALO	FRANCE	nan	nan	\N	2021-06-14 07:06:13.139664	t
191	191	1 rue de l'Eglise	nan	t	85580	SAINT MICHEL EN L HERM	FRANCE	nan	nan	\N	2021-06-14 07:06:14.059728	t
192	192	16 rue de la Fontaine du But	nan	t	75018	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:06:15.319776	t
193	193	21 Bouleard Guist'hau	nan	t	44000	NANTES	FRANCE	AM294	CTI44	\N	2021-06-14 07:06:16.70557	t
194	194	156 rue Nationale	nan	t	59000	LILLE	FRANCE	AM334	ETDN59	\N	2021-06-14 07:06:19.740602	t
195	195	156 rue Nationale	nan	t	59000	LILLE	FRANCE	AM335	ETLCI1	\N	2021-06-14 07:06:20.619684	t
196	196	17 rue du 8 mai 1945	nan	t	94240	L'HAY LES ROSES	FRANCE	nan	nan	\N	2021-06-14 07:06:21.781589	t
197	197	18 avenue de la République	nan	t	78200	MANTES LA JOLIE	FRANCE	nan	nan	\N	2021-06-14 07:06:22.891812	t
198	198	48 rue du Brandon	nan	t	85500	LES HERBIERS	FRANCE	AM339	CEL85M	\N	2021-06-14 07:06:23.952281	t
206	206	24 rue du 3 Aout 1944	nan	t	44850	SAINT MARS DU DESERT	FRANCE	AM348	STM044	\N	2021-06-14 07:06:36.234707	t
207	207	23 BIS RUE DE LA BORDERIE	nan	t	35000	VITRE	FRANCE	nan	nan	\N	2021-06-14 07:06:38.267754	t
208	208	4 rue du Champs Dolent	nan	t	35000	RENNES	FRANCE	nan	nan	\N	2021-06-14 07:06:40.851183	t
209	209	34 Avenue Foch	nan	t	92420	VAUCRESSON	FRANCE	nan	nan	\N	2021-06-14 07:06:41.978683	t
210	210	83 BIS RUE DE COURCELLES	nan	t	75017	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:06:44.405002	t
211	211	10 rue de la Brosse	nan	t	44700	ORVAULT	FRANCE	AM3531	ORV044	\N	2021-06-14 07:06:45.645504	t
212	212	46 rue du Petit Prince	nan	t	44360	VIGNEUX DE BRETAGNE	FRANCE	AM354	VIG044	\N	2021-06-14 07:06:47.350172	t
213	213	15 rue de la Madeleine	nan	t	44130	FAY DE BRETAGNE	FRANCE	AM355	FAY044	\N	2021-06-14 07:06:48.359695	t
214	214	4 rue Galilée	nan	t	75016	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:06:49.86433	t
215	215	20 rue de l'Ocean	nan	t	44810	HERIC	FRANCE	AM358	HER044	\N	2021-06-14 07:06:51.075472	t
225	225	19 Boulevard Alexandre Martin	nan	t	45000	ORLEANS	FRANCE	AM375	SERG45	\N	2021-06-14 07:07:12.122111	t
227	227	25 rue Traverse	nan	t	29200	BREST	FRANCE	AM401	DUM029	\N	2021-06-14 07:07:14.751633	t
228	228	34 avenue des Tilleuls	nan	t	17204	ROYAN Cedex	FRANCE	nan	nan	\N	2021-06-14 07:07:16.015511	t
229	229	36 rue de Paris	nan	t	53000	LAVAL	FRANCE	AM405	PRO053	\N	2021-06-14 07:07:16.841562	t
230	230	20 Avenue du Maréchal Joffre	nan	t	53200	CHATEAU GONTIER	FRANCE	nan	nan	\N	2021-06-14 07:07:18.594816	t
231	231	96 Boulevard des Batignolles	nan	t	75017	PARIS	FRANCE	AM4081	DJC7517	\N	2021-06-14 07:07:19.448682	t
232	232	23 rue de Lyon	BP61107	t	29211	BREST	FRANCE	nan	nan	\N	2021-06-14 07:07:20.580857	t
233	233	44 rue du Château	nan	t	29200	BREST	FRANCE	AM410	LEM029	\N	2021-06-14 07:07:21.681385	t
234	234	30 rue Montgolfier	nan	t	93500	PANTIN	FRANCE	nan	nan	\N	2021-06-14 07:07:22.794675	t
235	235	4 rue Jeanne d'Arc	nan	t	44000	NANTES	FRANCE	AM4121	4IMO441	\N	2021-06-14 07:07:23.686147	t
236	236	36 rue de Versailles	nan	t	78150	LE CHESNAY	FRANCE	nan	nan	\N	2021-06-14 07:07:24.616968	t
237	237	52 Bis Boulevard Foch	nan	t	49100	ANGERS	FRANCE	nan	nan	\N	2021-06-14 07:07:25.449601	t
244	244	47 RUE ANATOLE FRANCE	nan	t	92370	CHAVILLE	FRANCE	nan	nan	\N	2021-06-14 07:07:32.544816	t
245	245	59 rue Denis Papin	nan	t	41000	BLOIS	FRANCE	AM4280	AgDC#041	\N	2021-06-14 07:07:34.950467	t
246	246	4 rue Pauline et Daniel Oehlert	BP717	t	53007	LAVAL Cedex	FRANCE	AM432	DARP53	\N	2021-06-14 07:07:36.18321	t
247	247	16 rue Daniel Oelhert	nan	t	53001	LAVAL	FRANCE	nan	nan	\N	2021-06-14 07:07:37.047715	t
248	248	14 Place Aristide Briand	nan	t	72000	LE MANS	FRANCE	nan	nan	\N	2021-06-14 07:07:38.183718	t
249	249	7 Rue de Beauval	nan	t	49100	ANGERS	FRANCE	AM4361	juGYT76tf	\N	2021-06-14 07:07:39.634185	t
250	250	47 RUE ANATOLE FRANCE	nan	t	92370	CHAVILLE	FRANCE	AM4371	sziZCkU6	\N	2021-06-14 07:07:41.649948	t
251	251	28 Quai Charles de Gaulle	nan	t	29150	CHATEAULIN	FRANCE	AM438	OBI029	\N	2021-06-14 07:07:42.68056	t
252	252	4 Avenue Champagné	nan	t	53400	CRAON	FRANCE	nan	nan	\N	2021-06-14 07:07:44.376318	t
253	253	32 Rue Saint Nicolas	nan	t	49000	ANGERS	FRANCE	nan	nan	\N	2021-06-14 07:07:45.230065	t
254	254	7 avenue Joffre	nan	t	92380	GARCHES	FRANCE	nan	nan	\N	2021-06-14 07:07:46.052301	t
255	255	7 rue de la Mairie	nan	t	29480	LE RELECQ KERHUON	FRANCE	nan	nan	\N	2021-06-14 07:07:46.925452	t
256	256	34 Chemin de Kernoter	nan	t	29000	QUIMPER	FRANCE	nan	nan	\N	2021-06-14 07:07:48.03583	t
257	257	32 COLVILLE TERRACE	nan	t	nan	LONDON W112BU	FRANCE	nan	nan	\N	2021-06-14 07:07:49.129748	t
258	258	86 avenue La Fayette	nan	t	17300	ROCHEFORT	FRANCE	AM253	BAR85T	\N	2021-06-14 07:07:50.425977	t
259	259	17 rue Jules Ferry	nan	t	91790	BOISSY SOUS SAINT YON	FRANCE	nan	nan	\N	2021-06-14 07:07:51.787544	t
260	260	PArc tertiaire Technopolis Einstein	nan	t	53810	CHANGE	FRANCE	nan	nan	\N	2021-06-14 07:07:52.928574	t
261	261	35 RUE DES BONSN VENTS	nan	t	44850	LIGNE	FRANCE	nan	nan	\N	2021-06-14 07:07:53.811022	t
262	262	234 rue de la Convention	nan	t	75015	PARIS	FRANCE	AM4581	BUDU15	\N	2021-06-14 07:07:55.277174	t
263	263	47 avenue de Paris	nan	t	94300	VINCENNES	FRANCE	AM461	BRI094	\N	2021-06-14 07:07:57.320094	t
264	264	10 rue d'Isly	nan	t	35000	RENNES	FRANCE	AM467	REN035	\N	2021-06-14 07:07:58.940049	t
265	265	28 Boulevard Rouget de Lisle	nan	t	93100	MONTREUIL	FRANCE	AM468	BRIE93	\N	2021-06-14 07:08:00.215912	t
266	266	5 Boulevard Marécahl Joffe	nan	t	56100	LORIENT	FRANCE	AM469	LORI56	\N	2021-06-14 07:08:01.106462	t
267	267	6 Bis avenue de la Libération	nan	t	45700	VILLEMANDEUR	FRANCE	AM4720	45cVIL#Pap	\N	2021-06-14 07:08:02.84231	t
268	268	17 bis rue Aristide Briand	nan	t	91150	ETAMPES	FRANCE	AM474	UGSP91	\N	2021-06-14 07:08:04.097241	t
269	269	115 Promenade des Cours	nan	t	86000	POITIERS	FRANCE	nan	nan	\N	2021-06-14 07:08:06.23349	t
270	270	51 Boulevard Carnot	nan	t	78110	LE VESINET	FRANCE	AM4801	AMI0781	\N	2021-06-14 07:08:07.707247	t
271	271	Route de Corzé	nan	t	49140	JARZE VILLAGE	FRANCE	nan	nan	\N	2021-06-14 07:08:10.133833	t
272	272	1 RUE DE LA CLAYE	nan	t	77400	THORIGNY SUR MARNE	FRANCE	AM4831	PHC0771	\N	2021-06-14 07:08:11.160298	t
273	273	33 rue Louis Pasteur	nan	t	29000	BREST	FRANCE	AM486	HAS029	\N	2021-06-14 07:08:12.395981	t
274	274	37 avenue de Quincy	nan	t	77380	COMB LA VILLE	FRANCE	nan	nan	\N	2021-06-14 07:08:14.127714	t
275	275	52 Boulevard de la liberté	nan	t	35000	RENNES	FRANCE	AM4881	AGIR3501	\N	2021-06-14 07:08:15.378017	t
276	276	6 rue de la Barre	nan	t	44110	CHATEAUBRIANT	FRANCE	AM490	TRIO44	\N	2021-06-14 07:08:16.62993	t
277	277	29 avenue Carnot	nan	t	91370	VERRIERES LE BUISSON	FRANCE	nan	nan	\N	2021-06-14 07:08:17.708677	t
278	278	31 rue Jean Fontaine	nan	t	75016	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:08:19.059316	t
279	279	445 Route d'Avignon	nan	t	84200	CARPENTRAS	FRANCE	nan	nan	\N	2021-06-14 07:08:20.102941	t
280	280	10 rue Amiral Guépratte	nan	t	29200	BREST	FRANCE	AM5031	LAR2901	\N	2021-06-14 07:08:21.283564	t
281	281	2 RUE MARSOULAN	nan	t	75011	PARIS	FRANCE	AM7001	NAT011	\N	2021-06-14 07:08:22.329568	t
282	282	17 BOULEVARD DE REUILLY	nan	t	75012	PARIS	FRANCE	AM703	LLI011	\N	2021-06-14 07:08:23.392675	t
283	283	148 Boulevard Voltaire	nan	t	75011	PARIS	FRANCE	AM701	GDL011	\N	2021-06-14 07:08:24.686784	t
284	284	101 rue Jean Jaurès	nan	t	29200	BREST	FRANCE	AM542	ORP030	\N	2021-06-14 07:08:25.789507	t
285	285	67 BOULEVARD DE LA LIBERTE	nan	t	59000	LILLE	FRANCE	AM5101	BONA591	\N	2021-06-14 07:08:27.06867	t
286	286	122 RUE SOLFERINO	nan	t	59000	LILLE	FRANCE	AM5111	TMC0591	\N	2021-06-14 07:08:28.094284	t
287	287	37 AVENUE DE QUINCY	nan	t	77380	COMBS LA VILLE	FRANCE	AM512	BENO77	\N	2021-06-14 07:08:29.296814	t
288	288	255 RUE NATIONALE	nan	t	59000	LILLE	FRANCE	AM5131	VAC0591	\N	2021-06-14 07:08:30.701689	t
289	289	32 RUE DE L'ETANDUERE	nan	t	49000	ANGERS	FRANCE	AM514	PIG049	\N	2021-06-14 07:08:31.838729	t
290	290	122 RUE SOLFERINO	nan	t	59000	LILLE	FRANCE	nan	nan	\N	2021-06-14 07:08:32.927691	t
294	294	1 PLACE WAGRAM	nan	t	75017	PARIS	FRANCE	AM522	nan	\N	2021-06-14 07:08:39.887737	t
295	295	2 rue de la Prairie de Plessis	nan	t	44810	HERIC	FRANCE	nan	nan	\N	2021-06-14 07:08:40.821242	t
296	296	26 BIS RUE JEAN JAURES	nan	t	93220	GAGNY	FRANCE	AMI0384	nan	\N	2021-06-14 07:08:43.194652	t
304	304	12 Place Jacques Tati	nan	t	44600	SAINT MARC SUR MER	FRANCE	nan	nan	\N	2021-06-14 07:08:53.471497	t
305	305	120 RUE FRANCIS PRESSENSE	nan	t	62220	CARVIN	FRANCE	AM535	ASD059	\N	2021-06-14 07:08:54.61397	t
306	306	1 Place de La Hunaudais	nan	t	44680	SAINT PAZANE	FRANCE	AM536	MEN044	\N	2021-06-14 07:08:55.854996	t
308	308	19 ALLEEDU VIEUX SAINT LOUIS	nan	t	53000	LAVAL	FRANCE	AM541	nan	\N	2021-06-14 07:08:58.949365	t
309	309	101 RUE JEAN JAURES	nan	t	29200	BREST	FRANCE	AM541	ORP029	\N	2021-06-14 07:08:59.995706	t
311	311	nan	nan	t	nan	nan	FRANCE	nan	nan	\N	2021-06-14 07:09:02.069127	t
312	312	10 Allée du Port Maillard	nan	t	44000	NANTES	FRANCE	nan	nan	\N	2021-06-14 07:09:03.114211	t
314	314	3 rue du Logis des Bois	nan	t	49320	SAINT SATURNIN SUR LOIRE	FRANCE	nan	nan	\N	2021-06-14 07:09:08.293107	t
325	325	20 Place de la Tour d'Auvergne	nan	t	29000	QUIMPER	FRANCE	nan	nan	\N	2021-06-14 07:09:22.140711	t
326	326	106 RUE CHAULIN SERVINIERE	nan	t	53100	MAYENNE	FRANCE	AM5721	CAD0531	\N	2021-06-14 07:09:23.131053	t
329	329	10 rue Damrémont	nan	t	75018	PARIS	FRANCE	AM5770	Ori#18Par	\N	2021-06-14 07:09:27.077707	t
330	330	13 Place de la Liberté	nan	t	29200	BREST	FRANCE	nan	nan	\N	2021-06-14 07:09:28.555369	t
331	331	59 avenue de Saint Ouen	nan	t	75017	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:09:29.848227	t
332	332	4 RUE DES ARENES	nan	t	49000	ANGERS	FRANCE	AMI0453	nan	\N	2021-06-14 07:09:31.072322	t
291	291	58 rue Jean Baptiste Baudin	nan	t	94800	VILLEJUIF	FRANCE	AM519	nan	\N	2021-06-14 07:08:34.33379	t
292	292	28 BIS AVENUE CHARLES DE GAULLE	nan	t	17300	ROCHEFORT	FRANCE	AM520	NYAZ17	\N	2021-06-14 07:08:37.288534	t
293	293	63 RUE NICOLAS LEBLANC	nan	t	59000	LILLE	FRANCE	AM521	nan	\N	2021-06-14 07:08:38.395291	t
297	297	5 RUE JACQUES MARIN	nan	t	49330	SOEURDRES	FRANCE	AM525	PETI49	\N	2021-06-14 07:08:44.865072	t
298	298	175 RUE DE LA GUILLETERIE	nan	t	85440	TALMONT ST HILAIRE	FRANCE	AM526	NOR085	\N	2021-06-14 07:08:45.900326	t
299	299	4 RUE DU PATIO	nan	t	85160	SAINT JEN DE MONTS	FRANCE	AM527	FONC85	\N	2021-06-14 07:08:47.565942	t
300	300	251 AVENUE DU BOIS	nan	t	59832	LAMBERSART	FRANCE	AM528	ART059	\N	2021-06-14 07:08:48.81477	t
301	301	61 RUE COLBERT	nan	t	59000	LILLE	FRANCE	AM5291	MET0591	\N	2021-06-14 07:08:49.863762	t
302	302	189 RUE NATIONALE	nan	t	59000	LILLE	FRANCE	AM5321	CEN0591	\N	2021-06-14 07:08:50.949567	t
303	303	37 AVENUE EMILE ZOLA	nan	t	59000	LILLE	FRANCE	AM5331	DEF0591	\N	2021-06-14 07:08:52.301459	t
307	307	37 RUE D'ESBLY	nan	t	77700	COUPVRAY	FRANCE	AM538	EUBAR7	\N	2021-06-14 07:08:56.99664	t
310	310	62 RUE DE VOUILLE	nan	t	75015	PARIS	FRANCE	AM5431	CARG151	\N	2021-06-14 07:09:01.054983	t
313	313	41 rue du Sous Marin Casabianca	nan	t	83000	TOULON	FRANCE	nan	nan	\N	2021-06-14 07:09:06.552064	t
315	315	7 Place du 11 Novembre	nan	t	37320	SAINT BRANCHS	FRANCE	AM5551	BRAN0371	\N	2021-06-14 07:09:09.709698	t
316	316	23 PLACE  DU MARECHAL LECLERC	nan	t	59000	LILLE	FRANCE	AM55611	IND05911	\N	2021-06-14 07:09:10.710002	t
317	317	177 RUE NATIONALE	nan	t	59000	LILLE	FRANCE	AM55711	SIGL05911	\N	2021-06-14 07:09:12.007588	t
318	318	67 RUE CAULIANCOURT	nan	t	75018	PARIS	FRANCE	AM042	FRE75G	\N	2021-06-14 07:09:13.360106	t
319	319	43 RUE DE TOULOUSE	nan	t	31320	CASTANET-TOLOSAN	FRANCE	AM5611	TOUL0311	\N	2021-06-14 07:09:15.297689	t
320	320	70 AVENUE DE PUJOL	nan	t	31500	TOULOUSE	FRANCE	AM5621	TOUL0321	\N	2021-06-14 07:09:16.512573	t
321	321	40 ROUTE D'ALBI	nan	t	31000	TOULOUSE	FRANCE	AM5631	TOUL0321	\N	2021-06-14 07:09:17.492395	t
322	322	5 ALLEE D'OCCITANIE	nan	t	31770	COLOMIERS	FRANCE	AM5641	AERO0311	\N	2021-06-14 07:09:18.510461	t
323	323	40 ALLEES CHARLES DE FITTE	nan	t	31300	TOULOUSE	FRANCE	AM5651	GICA0311	\N	2021-06-14 07:09:19.439051	t
324	324	25 GRANDE RUE CHARLES DE GAULLE	nan	t	94360	BRY SUR MARNE	FRANCE	AM5681	CIV0771	\N	2021-06-14 07:09:20.886382	t
327	327	nan	nan	t	nan	nan	FRANCE	nan	nan	\N	2021-06-14 07:09:24.617444	t
328	328	16 RUE NOTRE DAME DE LORETTE	nan	t	75009	PARIS	FRANCE	AMI0499	tStAXI2b	\N	2021-06-14 07:09:25.654379	t
333	333	nan	nan	t	nan	nan	FRANCE	nan	nan	\N	2021-06-14 07:09:32.093296	t
334	334	1 rue de l'Ecluse Saint Mars de Blain	nan	t	44130	BLAIN	FRANCE	nan	nan	\N	2021-06-14 07:09:33.592995	t
335	335	602 rue du Haut Plessis	nan	t	44390	PETIT MARS	FRANCE	nan	nan	\N	2021-06-14 07:09:34.883525	t
336	336	48 RUE RADON	nan	t	85000	LES HERBIERS	FRANCE	AM3261	CB1H32PE1	\N	2021-06-14 07:09:36.285174	t
337	337	37 BOULEVARD DU MARECHAL FOCH	nan	t	49100	ANGERS	FRANCE	AM5860	NEST#49Fch	\N	2021-06-14 07:09:37.789505	t
338	338	1 rue du Dauphin	nan	t	53000	LAVAL	FRANCE	nan	nan	\N	2021-06-14 07:09:39.27244	t
339	339	12 rue Dagobert	nan	t	92100	CLICHY	FRANCE	AM5881	tsNBW4Ic	\N	2021-06-14 07:09:42.140301	t
340	340	169 AVENUE CHARLES DE GAULLE	nan	t	nan	LYON	FRANCE	nan	nan	\N	2021-06-14 07:09:44.006777	t
341	341	13-15 Avenue Paul Doumer	nan	t	93460	GOURNAY SUR MARNE	FRANCE	AM5931	CaD93#Pi	\N	2021-06-14 07:09:45.368762	t
342	342	50 RUE DE MOLINEL	nan	t	59000	LILLE	FRANCE	AMI0379	nan	\N	2021-06-14 07:09:47.260821	t
343	343	75 RUE PLANGENET	nan	t	49000	ANGERS	FRANCE	AM5951	Legro49#Sch	\N	2021-06-14 07:09:49.035842	t
344	344	ZAC PERROTS ROUTE DE TOULOUSE	nan	t	31570	LANTA	FRANCE	AM5961	CoeLau#31im	\N	2021-06-14 07:09:50.026996	t
345	345	14 B RUE DE PAS	nan	t	59000	LILLE	FRANCE	AMI03111	CU6GjpSN1	\N	2021-06-14 07:09:51.235604	t
346	346	14 Cours Gambetta	nan	t	30300	BEAUCAIRE	FRANCE	AM5981	nan	\N	2021-06-14 07:09:52.368268	t
347	347	11 avenue Michelet	nan	t	49300	CHOLET	FRANCE	AMI0391	nan	\N	2021-06-14 07:09:53.690144	t
348	348	nan	nan	t	75015	PARIS	FRANCE	AM6041	Bee#L15par	\N	2021-06-14 07:09:54.986753	t
349	349	23 rue Lejamptel	nan	t	35120	DOL DE BRETAGNE	FRANCE	AM6061	Laf#35Dol	\N	2021-06-14 07:09:56.047719	t
350	350	51 RUE BASSE	nan	t	59000	LILLE	FRANCE	AM60711	Mlille#59mo1	\N	2021-06-14 07:09:57.068649	t
351	351	5/7  Place du Général de Gaulle	nan	t	93220	GAGNY	FRANCE	AM6091	Aji#93Gagny	\N	2021-06-14 07:09:58.203065	t
352	352	76 Route de Fontenay	nan	t	85370	LE LANGON	FRANCE	AMI0535	GBxlwb1a	\N	2021-06-14 07:09:59.458716	t
353	353	175 avenue de Dunkerque	nan	t	59000	LILLE	FRANCE	AM61311	Pon#AIL591	\N	2021-06-14 07:10:01.564295	t
354	354	7 Route de Chardonchamp	nan	t	86440	MIGNE AUXANCES	FRANCE	nan	nan	\N	2021-06-14 07:10:03.48192	t
355	355	129 rue George Clémenceau	nan	t	17320	MARENNES	FRANCE	nan	nan	\N	2021-06-14 07:10:04.804652	t
356	356	48 rue du Portail Louis	nan	t	49400	SAUMUR	FRANCE	AM6181	XXXX	\N	2021-06-14 07:10:06.486765	t
357	357	290 B RUE DU GÉNÉRAL LECLERC	nan	t	59380	CYSOING	FRANCE	nan	nan	\N	2021-06-14 07:10:08.175528	t
358	358	129 rue Georges Clemenceau	nan	t	17320	MARENNES	FRANCE	nan	nan	\N	2021-06-14 07:10:09.800697	t
359	359	Mong Kok Buiding	No 93-99 Mong Kok,road	t	nan	HONG KONG	FRANCE	nan	nan	\N	2021-06-14 07:10:11.536586	t
360	360	2 rue du Général Leclerc	nan	t	93110	ROSNY SOUS BOIS	FRANCE	AM6241	De#AGM93	\N	2021-06-14 07:10:12.921148	t
361	361	57 rue de Lancry	nan	t	75010	PARIS	FRANCE	AM6251	Rep#LAF10	\N	2021-06-14 07:10:14.268981	t
362	362	246 Rue du Faubourg Saint Antoine	nan	t	75012	PARIS	FRANCE	AMI0155	MaUODlVF	\N	2021-06-14 07:10:16.347218	t
363	363	6 RUE DE PENTHIÈVRE	nan	t	75008	PARIS	FRANCE	AM6281	MFi7aeWu	\N	2021-06-14 07:10:17.966953	t
364	364	1 PLACE CHARDONNET	nan	t	37000	TOURS	FRANCE	AM6301	UhuO3gPl	\N	2021-06-14 07:10:19.227337	t
365	365	26 AVENUE DU GENERAL LECLERC	nan	t	92100	BOULOGNE - BILLANCOURT	FRANCE	AM6311	bvtV3xJ1	\N	2021-06-14 07:10:20.71692	t
366	366	66 avenue des Champs Eluysées	nan	t	75008	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:10:21.931949	t
367	367	73 BOUCLE DE FONT VERT	nan	t	83140	SIX FOURS	FRANCE	nan	nan	\N	2021-06-14 07:10:23.4303	t
368	368	COURS GOUDOULI	nan	t	31130	FONSE GRIVES	FRANCE	AM6361	q5Vg2Nyd	\N	2021-06-14 07:10:25.024225	t
369	369	110 avenue Emile Cossonneau	nan	t	93160	NOISY LE GRAND	FRANCE	AM6371	7VrRhWS8	\N	2021-06-14 07:10:26.39478	t
370	370	9 Bis Avenue Clémenceau	nan	t	77100	MEAUX	FRANCE	AM6411	Z2LyseBh	\N	2021-06-14 07:10:27.980541	t
371	371	nan	nan	t	nan	nan	FRANCE	nan	nan	\N	2021-06-14 07:10:29.431606	t
372	372	10 rue Carnot	nan	t	85300	CHALLANS	FRANCE	AMI0323	nan	\N	2021-06-14 07:10:31.007416	t
373	373	105 rue Maréchal Joffre	nan	t	85000	LA ROCHE SUR YON	FRANCE	AM6451	nan	\N	2021-06-14 07:10:33.124994	t
376	376	385 RUE DE  VAUGIRAD	nan	t	75015	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:10:37.722023	t
377	377	Rua do Oliva 238-1 Dto	nan	t	1200-774	LISBON	FRANCE	nan	nan	\N	2021-06-14 07:10:39.372232	t
378	378	64 BOULEVARD DE LA LIBERTÉ	nan	t	59000	LILLE	FRANCE	AM6531	nan	\N	2021-06-14 07:10:41.141952	t
379	379	16 RUE DU GENERAL DE GAULLE	nan	t	59110	LA MADELEINE	FRANCE	AM6541	nan	\N	2021-06-14 07:10:43.345099	t
380	380	130 RUE SAINT CHARLES	nan	t	75015	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:10:44.479801	t
381	381	5 RUE JEAN MARIE RAIMBAULT	nan	t	49100	ANGERS	FRANCE	nan	nan	\N	2021-06-14 07:10:46.453819	t
382	382	5 RUE JEAN MARIE RAIMBAULT	nan	t	49100	ANGERS	FRANCE	nan	nan	\N	2021-06-14 07:10:47.862092	t
383	383	12 rue Souchu Servinière	XXX	t	53000	LAVAL	FRANCE	AM6621	nan	\N	2021-06-14 07:10:49.091076	t
384	384	5 Boulevard Adolphe Billault	nan	t	44200	NANTES	FRANCE	nan	nan	\N	2021-06-14 07:10:50.501272	t
385	385	13 PLACE DES QUATRE DAUPHINS	nan	t	13100	AIX  EN PROVENCE	FRANCE	AM441	nan	\N	2021-06-14 07:10:51.823925	t
386	386	7 rue Versigny	nan	t	75018	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:10:53.897072	t
389	389	5 PLACE DE CINQ MAI	nan	t	79300	BRESSUIRE	FRANCE	AMI0249	nan	\N	2021-06-14 07:10:58.989725	t
390	390	13 PLACE NOTRE DAME	nan	t	79300	BRESSUIRE	FRANCE	nan	nan	\N	2021-06-14 07:11:00.407137	t
391	391	18 RUE CHAUSSEE WATT	nan	t	59200	TOURCOING	FRANCE	nan	nan	\N	2021-06-14 07:11:02.020927	t
392	392	55 AVENUE DE LA REPUBLIQUE	nan	t	77340	PONTAULT COMBAULT	FRANCE	nan	nan	\N	2021-06-14 07:11:04.828475	t
393	393	42 RUE BASSE	BP 199	t	59029	LILLE	FRANCE	AMI0254	nan	\N	2021-06-14 07:11:06.935538	t
395	395	21 CHEMIN DES TOUARNIES	nan	t	91530	LA VAL  ST GERMAIN	FRANCE	nan	nan	\N	2021-06-14 07:11:11.770104	t
396	396	32 RUE JACQUES LE PAIRE	nan	t	77400	LAGNY SUR MARNE	FRANCE	AMI0277	nan	\N	2021-06-14 07:11:12.775845	t
397	397	49 rue de la Tourmentinerie	nan	t	44850	Saint Mars du Desert	FRANCE	nan	nan	\N	2021-06-14 07:11:13.902923	t
398	398	71 RUE DU GENERAL DE GAULLE	nan	t	53000	LAVAL	FRANCE	AMI0301	nan	\N	2021-06-14 07:11:14.961	t
399	399	10 RUE DE CAMBRAI	nan	t	62000	ARRAS	FRANCE	nan	nan	\N	2021-06-14 07:11:15.800137	t
400	400	74 RUE MARX DORMOY	nan	t	75018	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:11:17.265324	t
401	401	12 PLACE GEORGES POMPIDOU	nan	t	93160	NOISY LE GRAND	FRANCE	AMI0308	nan	\N	2021-06-14 07:11:18.380206	t
402	402	284 Boulevard Voltaire	nan	t	75011	PARIS	FRANCE	AMI0312	nan	\N	2021-06-14 07:11:19.415798	t
403	403	3 RUE FLORIAN	nan	t	92330	SCEAUX	FRANCE	AMI0313	nan	\N	2021-06-14 07:11:20.850487	t
431	431	6-8 Rue Didienne	nan	t	44000	NANTES	FRANCE	nan	nan	\N	2021-06-14 07:12:02.818943	t
432	432	nan	nan	t	49320	SAINT SATURNIN SUR LOIRE	FRANCE	nan	nan	\N	2021-06-14 07:12:04.413863	t
433	433	6 Rue d'En Barthas	nan	t	81570	SEMALENS	FRANCE	nan	nan	\N	2021-06-14 07:12:05.993733	t
434	434	nan	nan	t	nan	nan	FRANCE	nan	nan	\N	2021-06-14 07:12:07.25223	t
435	435	nan	nan	t	nan	nan	FRANCE	nan	nan	\N	2021-06-14 07:12:08.48368	t
436	436	39 Rue d'Aquitaine	nan	t	44800	SAINT HERBLAIN	FRANCE	nan	nan	\N	2021-06-14 07:12:09.964215	t
437	437	nan	nan	t	nan	nan	FRANCE	AMI0417	nan	\N	2021-06-14 07:12:11.424951	t
438	438	nan	nan	t	nan	nan	FRANCE	nan	nan	\N	2021-06-14 07:12:13.238812	t
439	439	95 RUE ORDERNER	nan	t	75018	PARIS	FRANCE	AMI0426	nan	\N	2021-06-14 07:12:14.297004	t
440	440	57 RUE CAULAINCOURT	nan	t	75018	PARIS	FRANCE	AMI0433	nan	\N	2021-06-14 07:12:15.522846	t
441	441	21 PLACE KENNEDY	nan	t	49100	ANGERS	FRANCE	nan	nan	\N	2021-06-14 07:12:17.138059	t
442	442	ROUTE DE LARVAUR	nan	t	31460	CARAMAN	FRANCE	AMI0438	nan	\N	2021-06-14 07:12:18.251997	t
443	443	2 RUE HARROUYS	nan	t	44470	CRAQUEFOU	FRANCE	AMI0431	nan	\N	2021-06-14 07:12:19.461205	t
444	444	2 RUE DE LA COTE D'OR	nan	t	31500	TOULOUSE	FRANCE	AMI0444	nan	\N	2021-06-14 07:12:20.683569	t
445	445	36 rue Eugène Ténot	nan	t	33000	BORDEAUX	FRANCE	AMI0446	nan	\N	2021-06-14 07:12:23.049556	t
446	446	2 RUE DE BREST	nan	t	35500	VITRE	FRANCE	AM10448	nan	\N	2021-06-14 07:12:24.88423	t
447	447	3 AVENUE DE GAMEVILLE	nan	t	31650	SAINT ORENS DE GAMEVILLE	FRANCE	AMI0450	nan	\N	2021-06-14 07:12:26.154337	t
448	448	24B AVENUE DE BON AIR SAINT-PIERRE MONTLIMART	nan	t	49110	MONTREVAULT-SUR-ÈVRE	FRANCE	AMI0456	nan	\N	2021-06-14 07:12:27.291606	t
449	449	VAUJUAS	nan	t	53440	MARCILLÉ-LA-VILLE	FRANCE	nan	nan	\N	2021-06-14 07:12:28.563191	t
450	450	491 Avenue de Verdun	nan	t	33700	MERIGNAC	FRANCE	AMI0459	nan	\N	2021-06-14 07:12:29.739877	t
374	374	35 RUE DE LA REPUBLIQUE	nan	t	45330	LE MALESHERBOIS	FRANCE	AM6471	nan	\N	2021-06-14 07:10:34.77564	t
375	375	1 CHEMIN DES ETAMIÈRES LE POTEAU D'EPONE	nan	t	78680	EPONE	FRANCE	AM6481	uwXFVTCd	\N	2021-06-14 07:10:35.981523	t
387	387	3 RUE D'ALEMEBERT	nan	t	75014	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:10:56.312072	t
388	388	28 BIS RUE DE LA BOURRELIERE	nan	t	44210	PORNIC	FRANCE	nan	nan	\N	2021-06-14 07:10:57.913814	t
394	394	54 ROUTE DU VESINET	nan	t	78400	CHATOU	FRANCE	nan	nan	\N	2021-06-14 07:11:09.2212	t
404	404	30 Rue Du Général de Gaulle	nan	t	78300	POISSY	FRANCE	AMI0314	nan	\N	2021-06-14 07:11:22.361583	t
405	405	41 RUE DE PASSY	nan	t	75016	PARIS	FRANCE	AMI0317	nan	\N	2021-06-14 07:11:24.032832	t
406	406	85 RUE PAUL DOUMER	nan	t	92500	RUEIL MALMAISON	FRANCE	AMI0315	nan	\N	2021-06-14 07:11:25.334341	t
407	407	1 AVENUE LACOTERE	nan	t	31700	CONRNEBARIEU	FRANCE	AMI0318	nan	\N	2021-06-14 07:11:26.739523	t
408	408	10 RUE GEORGES CLEMENCEAU	nan	t	41200	ROMORANTIN LANTHENAY	FRANCE	AMI0320	nan	\N	2021-06-14 07:11:28.249459	t
409	409	132 RUE DE PARIS	nan	t	53000	LAVAL	FRANCE	nan	nan	\N	2021-06-14 07:11:29.568304	t
410	410	48 Rue Geneviève Perrier	nan	t	45160	OLIVET	FRANCE	AMI0335	nan	\N	2021-06-14 07:11:31.866659	t
411	411	17 Place de La Victoire	nan	t	45500	GIEN	FRANCE	AMI0337	nan	\N	2021-06-14 07:11:33.758453	t
412	412	346 Avenue d'Arès	nan	t	33700	MERIGNAC	FRANCE	AMI0338	nan	\N	2021-06-14 07:11:35.415344	t
413	413	1 RUE DU HARAS	nan	t	49100	ANGERS	FRANCE	AMI0346	nan	\N	2021-06-14 07:11:37.012316	t
414	414	4 rue Paul Laguesse	nan	t	77700	CHESSY	FRANCE	AMI0348	nan	\N	2021-06-14 07:11:40.083265	t
415	415	nan	nan	t	nan	nan	FRANCE	AMI0350	nan	\N	2021-06-14 07:11:41.203984	t
416	416	28 RUE GENERAL DE GAULLE	nan	t	78300	POISSY	FRANCE	AMI0356	nan	\N	2021-06-14 07:11:42.855234	t
417	417	11 AVENUE ARISTIDE BRIAND	nan	t	92350	LE PLESSIS-ROBINSSON	FRANCE	nan	nan	\N	2021-06-14 07:11:44.473895	t
418	418	10 PLACE DE LA LAITERIE	nan	t	49000	ANGERS	FRANCE	nan	nan	\N	2021-06-14 07:11:45.74588	t
419	419	189 AVENUE DE LA REPUBLIQUE	nan	t	59110	LA MADELEINE	FRANCE	nan	nan	\N	2021-06-14 07:11:47.78604	t
420	420	444 AVENUE DE DUNKERQUE	nan	t	59130	LAMBERSART	FRANCE	nan	nan	\N	2021-06-14 07:11:49.020134	t
421	421	6 RUE SAINT ANNE	nan	t	59000	LILLE	FRANCE	nan	nan	\N	2021-06-14 07:11:50.259614	t
422	422	8 RUE SAINT ANNE	nan	t	59000	LILLE	FRANCE	nan	nan	\N	2021-06-14 07:11:51.979152	t
423	423	53 Johnson court, 39 Meadowside	XXX	t	SE9 6BS	LONDON	FRANCE	nan	nan	\N	2021-06-14 07:11:53.086139	t
424	424	26 BIS AVENUE JEAN JAURES	nan	t	93220	GAGNY	FRANCE	AMI0386	nan	\N	2021-06-14 07:11:54.180562	t
425	425	54 Rue Nationale	nan	t	49300	CHOLET	FRANCE	nan	nan	\N	2021-06-14 07:11:55.317693	t
426	426	45 Bis Rue Eugene Massé	nan	t	93190	LIVRY GARGAN	FRANCE	AMI0387	nan	\N	2021-06-14 07:11:56.761819	t
427	427	nan	nan	t	nan	nan	FRANCE	nan	nan	\N	2021-06-14 07:11:58.028775	t
428	428	nan	nan	t	nan	nan	FRANCE	nan	nan	\N	2021-06-14 07:11:59.072843	t
429	429	nan	nan	t	nan	nan	FRANCE	nan	nan	\N	2021-06-14 07:12:00.058338	t
430	430	201 Avenue de Versailles	nan	t	75016	PARIS	FRANCE	AMI0397	nan	\N	2021-06-14 07:12:01.185688	t
451	451	5 RUE JACQUES MARIN	nan	t	49330	SOEURDRES	FRANCE	AMI0460	nan	\N	2021-06-14 07:12:30.844283	t
452	452	6 Place Gasnier Guy / 19 Rue Gambetta	nan	t	77500	CHELLES	FRANCE	AMI0463	nan	\N	2021-06-14 07:12:32.755245	t
453	453	57 RUE DE BENODET	nan	t	29000	QUIMPER	FRANCE	nan	nan	\N	2021-06-14 07:12:34.237102	t
454	454	20 RUE CHASLES	nan	t	78120	RAMBOUILLET	FRANCE	nan	nan	\N	2021-06-14 07:12:35.434976	t
455	455	nan	nan	t	nan	nan	FRANCE	nan	nan	\N	2021-06-14 07:12:37.143235	t
456	456	8 AVENUE RAYMOND NEUVES	nan	t	31500	TOULOUSE	FRANCE	nan	nan	\N	2021-06-14 07:12:38.395304	t
457	457	8 RUE DES CERISIERS	nan	t	31280	DREMIL LAFAGE	FRANCE	nan	nan	\N	2021-06-14 07:12:39.606138	t
458	458	14 PLACE FREDERIC OZANAM	nan	t	33200	BORDEAUX CAUDERAN	FRANCE	nan	nan	\N	2021-06-14 07:12:40.658468	t
459	459	7 RUE NATIONALE	nan	t	85110	CHANTONNAY	FRANCE	nan	nan	\N	2021-06-14 07:12:41.895898	t
460	460	LE DAVIER	nan	t	44810	HERIC	FRANCE	nan	nan	\N	2021-06-14 07:12:44.084928	t
461	461	35 RUE DU DOUANIER ROUSSEAU	nan	t	53000	LAVAL	FRANCE	nan	nan	\N	2021-06-14 07:12:45.112045	t
462	462	8 RUE DU MARECHAL NEY	nan	t	85010	LA ROCHE SUR YON	FRANCE	AMI0488	nan	\N	2021-06-14 07:12:46.459015	t
463	463	164 RUE D'ALESIA	nan	t	75014	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:12:47.648771	t
464	464	137 ROUTE DE FRONTON	nan	t	31140	AUCAMVILLE	FRANCE	nan	nan	\N	2021-06-14 07:12:49.590169	t
465	465	6 RUE DES SPORTS	nan	t	49120	MELAY - CHAMILLE EN ANJOU	FRANCE	nan	nan	\N	2021-06-14 07:12:50.690085	t
466	466	2 PLACE SAINT PIERRE	nan	t	44470	CARQUEFOU	FRANCE	nan	nan	\N	2021-06-14 07:12:52.239133	t
467	467	27 BOULEVARD DE LA CROIX ROUSSE	nan	t	69004	LYON	FRANCE	nan	nan	\N	2021-06-14 07:12:56.012228	t
468	468	75 BOULEVARD DE CHARONNE	nan	t	75011	PARIS	FRANCE	nan	nan	\N	2021-06-14 07:12:57.054401	t
469	469	61 RUE PIERRE CAZENEUVE	nan	t	31200	TOULOUSE	FRANCE	nan	nan	\N	2021-06-14 07:12:58.164878	t
470	470	LACHAT	nan	t	73160	VIMINES	FRANCE	nan	nan	\N	2021-06-14 07:12:59.637931	t
471	471	12 RUE DES AMITIERES	nan	t	44210	PORNIC	FRANCE	nan	nan	\N	2021-06-14 07:13:00.896386	t
472	472	1  RUE DU GENERAL DE GAULLE	nan	t	33112	SAINT LAURENT MEDOC	FRANCE	nan	nan	\N	2021-06-14 07:13:01.934058	t
473	473	2 RUE SAINT MARTIN	nan	t	49770	LONGUENEE EN ANJOU	FRANCE	nan	nan	\N	2021-06-14 07:13:03.146117	t
474	474	21 TER AVENUE DE VERDUN	nan	t	33127	MARTIGNAS SUR JALLE	FRANCE	nan	nan	\N	2021-06-14 07:13:04.232274	t
475	475	nan	nan	t	nan	nan	FRANCE	nan	nan	\N	2021-06-14 07:13:07.011514	t
476	476	35 RUE RENE RABAULT	nan	t	49100	ANGERS	FRANCE	nan	nan	\N	2021-06-14 07:13:08.035852	t
477	477	7 LA CREANCIERE	nan	t	85170	DOMPIERRE SUR YON	FRANCE	nan	nan	\N	2021-06-14 07:13:09.12292	t
478	478	9, rue Alphonse Munchen	nan	t	L-2172	LUXEMBOURG	FRANCE	nan	nan	\N	2021-06-14 07:13:11.238149	t
479	479	118 RUE DE PREAU	nan	t	nan	nan	FRANCE	nan	nan	\N	2021-06-14 07:13:13.325791	t
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
11	11	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	6	0.15	6	0.01	9	0.04	3	0.01	5	0.01	9	0.03	4	0.01	12	0.02	12	0.02	nan	\N	2021-06-14 07:02:29.812369	t
10	10	0	112	112	0	112	112	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:02:28.945898	t
1	1	85	85	85	85	85	85	85	150	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	6	0.04	3	0.01	5	0.01	6	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:02:19.520379	t
4	4	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:02:23.116567	t
18	18	0	90	90	90	90	90	0	0	110	110	110	110	110	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:02:38.505493	t
2	2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:02:21.210436	t
7	7	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:02:26.312355	t
8	8	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:02:27.243675	t
6	6	0	95	133	133	160	160	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:02:25.357115	t
13	13	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:02:32.58611	t
3	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:02:22.17118	t
12	12	0	95	140	140	160	160	0	0	170	170	190	190	210	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:02:31.427268	t
5	5	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:02:24.617392	t
9	9	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:02:28.044216	t
14	14	0	105	120	145	160	170	195	0	180	197	214	240	257	283	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Pour 1 entrant & 1 sortant en même temps, facturation : 1EDL=TN150+1EDL=TS000	\N	2021-06-14 07:02:33.587904	t
15	15	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:02:34.674051	t
16	16	0	95	140	140	160	160	160	0	170	170	190	190	210	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	36	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	240	\N	2021-06-14 07:02:35.723843	t
17	17	0	99	99	99	170	170	170	0	180	180	200	200	220	220	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:02:36.77039	t
22	22	0	80	90	90	100	100	0	0	115	115	130	130	145	145	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:02:43.114662	t
27	27	0	85	85	85	85	85	0	0	0	110	110	110	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:02:48.753307	t
50	50	0	85	85	85	85	85	0	0	130	130	130	130	130	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:03:24.263181	t
26	26	0	0	0	0	120	120	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:02:47.854327	t
39	39	0	85	90	90	100	100	0	0	120	120	140	140	160	160	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:03:05.041296	t
47	47	0	75	97	97	120	120	0	0	112	112	135	135	157	157	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:03:19.909637	t
19	19	0	90	90	90	90	90	0	0	110	110	110	110	110	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:02:39.332336	t
43	43	0	71	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.3	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	nan	\N	2021-06-14 07:03:09.395749	t
23	23	0	85	85	85	85	85	85	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	30	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	tarif renégocier sur pack à partir 01/01/2015 VOIR XD	\N	2021-06-14 07:02:44.546393	t
21	21	0	110	110	110	110	110	0	0	150	150	150	150	150	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.3	0	nan	0	nan	0	nan	0	nan	0	nan	67	nan	0	nan	0	nan	nan	\N	2021-06-14 07:02:41.792931	t
49	49	0	107	120	146	163	171	197	0	180	197	214	240	257	283	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	36	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:03:22.659346	t
35	35	0	85	95	95	105	105	0	0	110	110	130	130	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:02:59.049079	t
37	37	0	85	90	90	100	100	0	0	120	120	140	140	160	160	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:03:01.536349	t
48	48	0	95	95	95	95	95	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:03:21.505477	t
51	51	0	90	90	90	90	90	0	0	150	150	150	150	150	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	8	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:03:25.882578	t
52	52	0	90	90	90	90	90	0	0	150	150	150	150	150	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:03:27.026875	t
53	53	0	80	95	95	110	110	0	0	160	160	160	160	160	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:03:28.212505	t
55	55	0	90	90	90	90	90	0	0	110	110	110	110	110	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:03:30.822577	t
34	34	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:02:57.750476	t
28	28	0	85	90	0	100	0	0	0	120	120	140	140	160	160	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:02:49.87275	t
31	31	0	70	80	80	90	90	0	0	100	100	110	110	120	120	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:02:53.737708	t
30	30	0	85	100	100	115	115	0	0	117	117	130	130	145	145	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:02:52.373375	t
25	25	85	85	85	90	90	100	100	0	130	140	150	160	180	190	200	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	0	0.01	6	0.04	3	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Mise à jour sur tarif 2017 prix par typologie logement sur récap facture	\N	2021-06-14 07:02:46.681364	t
32	32	0	125	140	170	190	200	230	0	210	230	250	280	300	330	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:02:55.154435	t
20	20	0	90	120	120	150	150	150	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	200	\N	2021-06-14 07:02:40.299863	t
29	29	0	85	100	100	115	115	0	0	115	115	130	130	145	145	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:02:51.036399	t
40	40	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	250	\N	2021-06-14 07:03:06.269632	t
33	33	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:02:56.3819	t
24	24	0	125	140	170	190	200	230	0	210	230	250	280	300	330	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	0	0.01	6	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:02:45.706636	t
38	38	0	85	90	90	100	100	0	0	120	120	140	140	160	160	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:03:02.643141	t
41	41	0	80	80	80	80	80	0	0	80	80	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:03:07.214612	t
36	36	0	85	95	95	105	105	0	0	110	110	130	130	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:03:00.296032	t
44	44	0	80	90	90	100	100	0	0	120	120	140	140	160	160	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:03:10.408507	t
45	45	0	90	90	90	90	90	0	0	115	115	115	115	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:03:15.143987	t
42	42	0	110	110	110	110	110	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.3	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	nan	\N	2021-06-14 07:03:08.31304	t
46	46	0	90	125	125	135	135	0	0	170	170	190	190	220	220	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	0	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:03:17.891456	t
63	63	0	0	0	0	0	0	0	0	0	0	150	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:03:40.350337	t
59	59	0	85	85	85	85	85	0	0	120	120	120	120	120	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:03:36.008326	t
57	57	0	90	90	0	90	90	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:03:33.723202	t
66	66	0	80	80	80	85	85	0	0	100	100	100	100	100	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Abon	\N	2021-06-14 07:03:44.203741	t
69	69	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	5	0.15	5	0.01	3	0.04	3	0.01	5	0.01	3	0.03	4	0.01	4	0.02	4	0.02	Passage à la facture récap sur nouveau tarif par typologie à partir du 01/03/2017. MAJ par XD	\N	2021-06-14 07:03:46.819046	t
54	54	0	0	0	0	0	0	0	0	0	270	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:03:29.615717	t
71	71	0	99	99	115	160	160	0	0	170	170	190	190	230	230	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	F2 99,00\nF3 115,00	\N	2021-06-14 07:03:48.938141	t
65	65	0	85	85	85	85	85	0	0	110	110	110	110	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:03:42.828553	t
58	58	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:03:34.804387	t
64	64	90	90	95	100	120	135	145	0	120	140	160	180	230	280	315	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.45	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	4	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-14 07:03:41.389399	t
61	61	0	0	80	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:03:38.404893	t
56	56	0	100	140	140	160	160	0	0	170	170	190	190	210	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:03:32.196341	t
62	62	0	99	99	99	150	150	0	0	170	170	190	190	210	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	36	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:03:39.358906	t
60	60	0	85	110	110	136	136	0	0	127	127	153	153	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:03:37.536125	t
68	68	0	85	85	85	85	85	0	0	130	130	130	130	130	130	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:03:45.896889	t
70	70	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	5	0.15	0	0.01	3	0.04	3	0.01	5	0.01	3	0.03	4	0.01	4	0.02	4	0.02	Passage à la facture récap sur nouveau tarif par typologie à partir du 01/03/2017. MAJ par XD	\N	2021-06-14 07:03:48.004235	t
67	67	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	377	\N	2021-06-14 07:03:44.997748	t
72	72	0	100	120	120	150	150	0	0	150	150	170	170	190	190	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	5	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	nan	\N	2021-06-14 07:03:49.959309	t
81	81	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	5	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:03:58.343234	t
77	77	0	85	85	85	85	85	0	0	110	110	110	110	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:03:54.848479	t
75	75	0	0	100	100	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:03:52.871385	t
83	83	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.26	0	nan	0	nan	0	nan	0	nan	0	nan	67	nan	0	0.02	0	0.02	nan	\N	2021-06-14 07:04:00.898339	t
82	82	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	5	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	nan	\N	2021-06-14 07:03:59.645376	t
73	73	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:03:50.841517	t
76	76	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.26	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	0.02	0	0.02	nan	\N	2021-06-14 07:03:54.022764	t
87	87	0	0	0	0	0	0	0	0	0	80	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:04:06.95536	t
79	79	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	0	0.01	0	0.04	3	0.01	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:03:56.597732	t
80	80	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:03:57.480596	t
74	74	0	120	160	200	240	320	360	0	180	210	225	240	300	400	500	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	5	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:03:51.808651	t
78	78	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	5	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:03:55.770816	t
84	84	0	90	90	90	90	90	90	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	7	0.01	12	0.02	12	0.02	Au 01/05/16 - Pack 70 EDL=9600e/an=800e/mois.Début 01/05/2017	\N	2021-06-14 07:04:02.000236	t
85	85	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Même pack que ADRESSE VAL EUOPE, 200 EDL=12*1500	\N	2021-06-14 07:04:03.04253	t
86	86	0	99	99	99	160	160	0	0	170	170	190	190	230	230	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:04:05.221234	t
98	98	0	0	0	0	100	100	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:04:25.53857	t
88	88	0	0	100	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:04:08.213364	t
99	99	0	99	99	99	170	170	0	0	180	180	200	200	220	220	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:04:26.416607	t
93	93	0	100	140	140	160	160	0	0	170	170	190	190	210	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:04:19.111898	t
91	91	0	100	130	130	150	150	0	0	170	170	190	190	210	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:04:15.526976	t
101	101	0	0	0	0	115	115	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:04:29.12963	t
89	89	0	0	120	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:04:12.614784	t
92	92	0	100	140	140	160	160	0	0	170	170	190	190	210	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:04:17.87538	t
95	95	0	100	140	140	160	160	0	0	170	170	190	190	210	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:04:21.420553	t
90	90	0	110	140	140	160	160	0	0	170	170	190	190	210	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:04:13.959069	t
96	96	0	85	85	85	85	85	0	0	110	110	110	110	110	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:04:22.695423	t
94	94	0	0	130	130	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:04:20.321562	t
97	97	0	90	90	90	90	90	0	0	150	150	150	150	150	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.26	0	nan	0	nan	0	nan	0	nan	0	nan	67	nan	0	0.02	0	0.02	nan	\N	2021-06-14 07:04:23.97269	t
108	108	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Pack 150 EDL  12*875	\N	2021-06-14 07:04:37.299282	t
105	105	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:04:33.709326	t
103	103	0	0	120	120	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:04:31.461027	t
115	115	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	5	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	nan	\N	2021-06-14 07:04:44.896295	t
109	109	0	90	90	90	110	110	0	0	130	130	170	170	190	190	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:04:38.629923	t
100	100	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	110	\N	2021-06-14 07:04:27.586464	t
112	112	0	90	90	0	90	90	0	0	150	150	150	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Pack 50 unités du 01/02/14 au 01/02/15, Tarif annuel 5500€  en 12 factures de 458,33  en HT\nLes meublés comptent 1,5 unité	\N	2021-06-14 07:04:41.874953	t
104	104	0	125	140	170	190	200	230	0	210	230	250	280	300	350	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:04:32.394231	t
111	111	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.26	0	nan	6	nan	0	nan	0	nan	0	nan	0	nan	0	0.02	0	0.02	nan	\N	2021-06-14 07:04:40.692652	t
102	102	0	0	0	0	0	0	0	0	0	0	175	175	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:04:30.220912	t
107	107	80	80	85	90	100	100	100	0	98	118	150	180	190	220	260	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	30	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	Pack pour 200 EDL 12x1500	\N	2021-06-14 07:04:36.392386	t
106	106	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:04:35.39741	t
117	117	0	85	85	85	85	85	0	0	110	110	110	110	110	110	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:04:46.850467	t
110	110	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	4	0.01	12	0.02	12	0.02	nan	\N	2021-06-14 07:04:39.75041	t
113	113	0	90	90	90	90	90	90	0	150	150	150	150	150	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	5	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	nan	\N	2021-06-14 07:04:42.839411	t
114	114	0	110	110	110	110	110	0	0	170	170	190	190	210	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	6	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:04:43.978502	t
116	116	0	0	120	120	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:04:45.991237	t
118	118	90	92	92	95	110	130	150	0	120	130	150	170	200	250	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	7	0.01	7	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	Tarif découverte les 3 premiers constats 90€/Appt & 130€/PAv	\N	2021-06-14 07:04:47.726173	t
130	130	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:04:59.513592	t
124	124	0	0	120	120	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:04:53.640644	t
120	120	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	0	0.01	0	0.04	3	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:04:49.381678	t
127	127	0	90	90	90	90	90	0	0	0	0	115	115	115	115	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:04:56.928242	t
126	126	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	5	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	nan	\N	2021-06-14 07:04:55.695604	t
128	128	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	0	0.01	0	0.04	3	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:04:57.712233	t
119	119	0	120	160	200	240	320	360	0	180	210	225	240	300	400	500	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	5	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:04:48.563543	t
123	123	0	0	120	120	120	120	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:04:52.659595	t
135	135	80	85	85	85	95	100	110	0	98	118	150	150	170	200	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	0	0.01	6	0.04	3	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Mise à jour tarif le 20/03/2017 par XD suite rdv de validation pour le groupe SERGIC	\N	2021-06-14 07:05:04.558862	t
125	125	0	0	85	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:04:54.837457	t
133	133	0	0	0	0	0	0	0	0	100	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:05:02.508586	t
129	129	0	0	0	0	0	0	0	0	150	150	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:04:58.594616	t
132	132	0	114	134	154	169	184	204	0	124	144	194	234	264	294	324	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	5	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	17/03/17 Tarif période de test	\N	2021-06-14 07:05:01.239093	t
134	134	90	95	100	105	110	120	130	120	120	140	150	170	200	250	300	30	30	30	30	40	40	\N	40	40	45	50	55	60	70	80	\N	0.5	6	0.15	7	0.01	67	0.04	3	0.01	5	0.01	5	0.03	67	0.01	67	0.02	0	0.02	Tarif  lis à jour au 09/05/2019	\N	2021-06-14 07:05:03.680037	t
131	131	0	110	140	140	160	160	0	0	190	190	210	210	230	230	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Meublés +50%	\N	2021-06-14 07:05:00.39307	t
136	136	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	0	0.01	6	0.04	3	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Tarif valable pour 10 constats	\N	2021-06-14 07:05:05.745789	t
140	140	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:05:09.540559	t
141	141	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	PERIODE TEST	\N	2021-06-14 07:05:10.440401	t
143	143	83	83	87	95	110	120	130	130	130	150	200	240	270	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	36	0.15	7	0.01	73	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	XD LE 01/11/2017 passage en facture recapt et mise à jour des tarifs suivant formulaire CM / PAKC 400  constats=44800/an, par mois=(3733.33/12)/4=933.33 par agences sur les 4 entités Période= 06/2016 à 05/2017	\N	2021-06-14 07:05:12.329865	t
161	161	0	85	85	85	85	85	85	0	150	150	150	150	150	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	0	0.01	0	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	facture récap sur M n-1 à 85 €ht  le coût constat moyen	\N	2021-06-14 07:05:29.174584	t
138	138	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	0	0.01	6	0.04	3	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	PERIODE TEST	\N	2021-06-14 07:05:07.592812	t
121	121	0	0	0	0	0	0	0	0	185	185	185	185	185	185	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.26	0	nan	0	nan	0	nan	0	nan	0	nan	67	nan	0	0.02	0	0.02	nan	\N	2021-06-14 07:04:50.264083	t
162	162	0	125	140	170	190	200	230	0	210	230	250	280	300	330	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	8	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:05:30.152622	t
144	144	0	90	90	90	90	90	90	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	0	0.01	0	0.04	3	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Essai 2 mois au 10/07/14	\N	2021-06-14 07:05:13.206367	t
122	122	0	90	90	90	90	90	0	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.26	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	0.02	0	0.02	nan	\N	2021-06-14 07:04:51.520304	t
164	164	0	95	140	140	160	160	180	0	170	170	190	190	210	210	230	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	36	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:05:32.853664	t
142	142	0	130	130	130	130	130	130	0	130	130	130	130	130	130	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:05:11.368035	t
137	137	0	105	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:05:06.691288	t
139	139	0	100	100	100	100	100	0	0	100	100	100	100	100	100	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:05:08.540897	t
163	163	0	125	140	170	190	200	230	0	210	230	250	280	300	330	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	8	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:05:31.218537	t
145	145	0	90	90	90	90	90	90	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:05:14.233489	t
158	158	0	0	120	120	120	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:05:26.484274	t
152	152	85	85	90	100	110	120	130	0	130	150	200	240	270	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	73	0.04	3	0.01	5	0.01	0	0.03	73	0.01	4	0.02	4	0.02	Pack 3 - 60 constats appt vides et meublés prix annuel=6720€ ht, en 12 mois de 01/17 à 12/17 à 560.00€ ht	\N	2021-06-14 07:05:20.763094	t
155	155	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	65	0.28	65	0.0	65	0	65	0.0	65	0	65	0.0	65	0.0	65	0.0	0	0.02	39600€ ht pour 12 mois	\N	2021-06-14 07:05:23.548657	t
150	150	0	90	90	90	90	90	90	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	5	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	nan	\N	2021-06-14 07:05:18.779675	t
148	148	0	119	133	162	181	190	219	0	210	230	250	280	300	330	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	Offre découverte du 01/08 au 30/09 2014	\N	2021-06-14 07:05:17.089523	t
151	151	0	125	125	125	125	125	125	0	210	210	210	210	210	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Tarif découverte du 10/09/14 au 10/11/14	\N	2021-06-14 07:05:19.958799	t
149	149	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	8	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	A partir du 15/09/2016 facture récapitulative. Le pack précédant cours jusqu'à 10/2016 inclu. Il y donc aura 2 factures en 10/16	\N	2021-06-14 07:05:17.977151	t
147	147	80	80	85	90	100	100	100	0	98	118	150	180	190	220	260	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	22/12/2016 - New Pack 200-33(dépassement 2016)=167 EDL du 01/01/17 au 31/12/17 total 19.500€ ht soit 1.625€ / MOIS\nFacture récap	\N	2021-06-14 07:05:16.266003	t
154	154	0	110	110	110	110	110	110	0	210	210	210	210	210	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:05:22.654165	t
146	146	0	90	90	90	90	90	90	0	150	150	150	150	150	150	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	A partir de 09/2014 Pack de 30 EDL à 120€ l'unité	\N	2021-06-14 07:05:15.086048	t
153	153	90	90	100	110	120	135	145	120	120	140	160	180	230	280	315	20	20	25	25	30	30	\N	30	30	30	40	40	50	50	50	\N	0.45	5	0.15	7	0.01	13	0.04	3	0.01	5	0.01	13	0.03	4	0.01	4	0.02	4	0.02	locaux commerciaux sur devis	\N	2021-06-14 07:05:21.738468	t
159	159	112	120	140	160	175	190	210	0	175	190	210	240	270	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	8	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:05:27.330083	t
157	157	0	103	123	143	158	173	193	0	111	131	181	221	251	281	311	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	5	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	Facturation récapitulative à partir du 01/03/2107 sur grille tarifaire	\N	2021-06-14 07:05:25.592265	t
156	156	0	0	0	0	0	0	0	0	0	0	150	150	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:05:24.379331	t
160	160	0	120	120	120	120	120	120	0	210	210	210	210	210	210	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Offre d'essai	\N	2021-06-14 07:05:28.159372	t
165	165	90	90	100	110	120	135	145	120	120	140	160	180	230	280	315	20	20	25	25	30	30	\N	30	30	30	40	40	50	50	50	\N	0.45	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-14 07:05:33.772331	t
183	183	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.16	0	0.01	5	0.04	0	nan	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	3€ /m² prix indiqué en TS sur constat	\N	2021-06-14 07:06:02.914575	t
168	168	0	90	101	122	137	144	165	0	151	165	180	201	216	237	252	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:05:37.456455	t
170	170	0	90	101	122	137	144	165	0	151	165	180	201	216	237	252	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:05:39.787886	t
166	166	0	85	85	85	85	85	85	0	150	150	150	150	150	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	5	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	Pack 30 EDL tarif 150 € soit 4500€ en 5 mensualités de 900€ 1ère=15/08/2015 Dernière= 15/12/2015	\N	2021-06-14 07:05:34.700299	t
174	174	92	100	120	140	155	170	190	155	155	170	190	217	247	277	307	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:05:44.347187	t
178	178	0	0	0	210	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:05:53.711186	t
179	179	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:05:55.282043	t
169	169	0	90	101	122	137	144	165	0	151	165	180	201	216	237	252	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	36	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:05:38.684365	t
167	167	0	125	140	170	190	200	230	0	210	230	250	280	300	330	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	36	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:05:36.684807	t
176	176	0	0	0	0	141	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:05:48.8186	t
175	175	0	0	0	0	250	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	36	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:05:45.561126	t
172	172	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	5	0.15	7	0.01	3	0.04	3	0.01	5	0.01	3	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:05:42.452269	t
171	171	0	90	101	122	137	144	156	0	151	165	180	201	216	237	252	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:05:40.767401	t
173	173	0	125	140	170	190	200	230	0	210	230	250	280	300	330	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:05:43.425579	t
180	180	0	85	85	85	85	85	85	0	150	150	150	150	150	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.25	0	0.0	0	0	0	0.0	0	0	0	0.0	4	0.01	4	0.02	4	0.02	Pack 18 constats à 136€= 2448€ en 12 mensualités, soit 204€ HT /mois. 1ère mensualité 03/16 à 02/17	\N	2021-06-14 07:05:57.677791	t
177	177	0	125	140	170	190	200	230	0	210	230	250	280	300	330	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:05:52.070949	t
182	182	0	90	101	122	137	144	165	0	151	165	180	201	216	237	252	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:06:01.870645	t
181	181	0	90	101	122	137	144	165	0	151	165	180	201	216	237	252	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Formule 1 fcature récap mensuelle à par du 1er avril 2017 (1ère facture en Mai)	\N	2021-06-14 07:05:59.734561	t
184	184	0	90	101	122	137	144	165	0	151	165	180	201	216	237	252	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:06:04.43448	t
200	200	0	107	120	146	163	171	197	0	180	197	214	240	257	283	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	6	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:06:27.061815	t
190	190	0	0	0	0	0	0	0	0	0	0	0	120	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	0	0.01	19	0.04	3	0.01	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:06:13.18364	t
188	188	85	93	113	133	148	163	183	0	98	118	168	208	238	268	298	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	5	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	Factures récap.          Anciennes infos : EDLE=2.00€ ht / m², EDLS=1,50€ ht / m² avec fact. / mois en récap	\N	2021-06-14 07:06:11.190336	t
187	187	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	5	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	Tarif Spécial indiqué sur le constat	\N	2021-06-14 07:06:09.729175	t
199	199	0	125	140	170	190	200	230	0	210	230	250	280	300	330	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	36	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:06:26.002031	t
191	191	0	85	85	85	85	85	85	0	150	150	150	150	150	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	0	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	FACT EDLE 2€ /M² pour EDLS 1,50 € / M²	\N	2021-06-14 07:06:14.415028	t
185	185	0	0	110	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	8	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:06:07.705422	t
189	189	0	90	90	90	115	166	186	0	150	150	186	226	256	286	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	20	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Facturation : facture récap.   client en facture récap sur interventions réalisé sur le mois et facturé le mois suivant	\N	2021-06-14 07:06:12.218357	t
195	195	0	85	85	85	85	85	85	0	150	150	150	150	150	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	0	0.01	0	0.04	3	0.01	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	FACT PROPO MGL	\N	2021-06-14 07:06:20.654665	t
192	192	0	125	140	170	190	200	230	0	210	230	250	280	300	330	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:06:15.379742	t
186	186	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	36	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	2,00€ par m²	\N	2021-06-14 07:06:08.917689	t
194	194	0	85	85	85	85	85	85	0	150	150	150	150	150	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	0	0.01	0	0.04	3	0.01	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	FACT PROPO MGL	\N	2021-06-14 07:06:19.796611	t
193	193	0	85	85	85	85	85	85	0	150	150	150	150	150	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	6	0.04	3	0.01	5	0.01	5	0.03	4	0.01	12	0.02	12	0.02	FACT 2 € le m²	\N	2021-06-14 07:06:16.76743	t
202	202	0	0	0	170	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	36	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:06:29.403542	t
201	201	0	0	0	170	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:06:28.271477	t
203	203	0	0	0	170	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:06:32.266421	t
213	213	85	85	85	85	85	85	85	150	150	150	150	150	150	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.25	0	0.0	0	0	0	0.0	0	0	0	0.0	67	0.01	7	0.02	0	0.02	nan	\N	2021-06-14 07:06:48.441651	t
217	217	0	0	0	0	0	0	0	0	0	0	150	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.16	0	0.01	6	0.04	0	nan	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:06:53.124465	t
205	205	80	85	85	90	95	100	110	0	120	130	150	170	240	280	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	Pack 75 constats à 6.750€ht en 12 fact de 562,50€ émises de 09/2016 à 08/2017  / XD mise en place nouveau tarif en facture récap 85 par interventons et 50% meublé	\N	2021-06-14 07:06:34.93069	t
204	204	0	90	101	122	137	144	165	0	151	165	180	201	216	237	252	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:06:33.904353	t
206	206	85	85	85	90	90	150	150	0	150	150	150	200	200	200	200	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	4	0.01	12	0.02	12	0.02	Tarif applicable au 01/05/2017	\N	2021-06-14 07:06:36.308665	t
207	207	0	90	0	0	0	0	0	0	0	0	150	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	0	0.01	19	0.04	3	0.01	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:06:38.374691	t
198	198	85	93	113	133	148	163	183	0	98	118	168	208	238	268	298	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	0	0.01	5	0.04	3	0.01	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	Facture Récap           Ancien : EDLE=2.00€ ht / m², EDLS=1,50€ ht / m² avec fact. / mois en récap	\N	2021-06-14 07:06:24.002254	t
196	196	0	0	0	170	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:06:21.848072	t
211	211	85	85	85	85	85	85	85	150	150	150	150	150	150	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.25	0	0.0	0	0	0	0.0	0	0	0	0.0	67	0.01	7	0.02	0	0.02	nan	\N	2021-06-14 07:06:45.735748	t
208	208	0	90	90	110	110	150	150	0	150	150	150	200	200	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	0	0.01	19	0.04	3	0.01	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:06:40.919669	t
210	210	0	125	140	170	190	200	230	0	210	230	250	280	300	330	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:06:44.466965	t
197	197	0	125	140	170	190	200	230	0	210	230	250	280	300	330	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:06:22.958787	t
218	218	0	0	0	0	0	0	0	0	0	0	200	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.16	0	0.01	6	0.04	0	nan	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:06:55.366654	t
209	209	0	95	140	140	160	160	180	0	210	230	250	280	300	330	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:06:42.063631	t
214	214	0	125	140	170	190	200	230	0	210	230	250	280	300	330	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	36	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:06:49.951279	t
212	212	85	85	85	85	85	85	85	150	150	150	150	150	150	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.25	0	0.0	0	0	0	0.0	0	0	0	0.0	67	0.01	7	0.02	0	0.02	nan	\N	2021-06-14 07:06:47.417135	t
216	216	0	0	165	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Tarif spécial meublé	\N	2021-06-14 07:06:52.19978	t
215	215	0	90	90	110	110	150	150	0	150	150	150	200	200	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	4	0.01	12	0.02	12	0.02	Local commercial 3Ps 100€	\N	2021-06-14 07:06:51.158485	t
240	240	106	114	134	154	169	184	204	0	124	144	194	234	264	294	324	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	Facture récap	\N	2021-06-14 07:07:28.008864	t
220	220	112	120	140	160	175	190	210	0	130	150	200	240	270	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	XD le 23/06/2017 mise à jour des tarifs suite envoi bordereau de CM	\N	2021-06-14 07:07:02.345653	t
238	238	0	0	0	166	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	36	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:07:26.340301	t
225	225	80	85	85	85	95	100	110	0	98	118	150	150	170	200	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	6	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Mise à jour tarif par XD suite rdv avec groupe SERGIC	\N	2021-06-14 07:07:12.241272	t
219	219	85	85	90	90	95	110	120	0	150	150	150	200	200	250	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	38	0.15	0	0.01	38	0.04	3	0.01	5	0.01	38	0.03	67	0.01	36	0.02	4	0.02	Facture récap	\N	2021-06-14 07:06:58.984873	t
221	221	0	125	125	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Tarif en TSxxx	\N	2021-06-14 07:07:04.135781	t
222	222	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	20	20	25	25	30	30	\N	30	30	30	40	40	50	50	50	\N	0.45	7	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	67	0.01	7	0.02	0	0.02	Tarif par mission à compter du 01/05/2017\nNouvelle proposition au tarif national L'ADRESSE en facture récap locaux commerciaux sur devis.	\N	2021-06-14 07:07:05.492927	t
243	243	0	0	0	0	0	0	0	0	0	0	0	250	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	TS250	\N	2021-06-14 07:07:31.534572	t
223	223	90	95	100	114	120	131	143	120	120	135	155	180	230	275	300	30	30	30	30	40	40	\N	45	40	45	50	55	60	70	80	\N	0.45	7	0.15	7	0.01	7	0.04	3	0.01	0	0.01	5	0.03	4	0.01	12	0.02	12	0.02	Facture  récap / MAJORATION MEUBLE  +45% / LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-14 07:07:07.877975	t
226	226	0	0	375	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	36	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:07:13.544268	t
224	224	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	6	0.15	6	0.01	9	0.04	3	0.01	5	0.01	9	0.03	4	0.01	12	0.02	12	0.02	passage au tarif cadre réseau L'Adresse au 01/01/2018	\N	2021-06-14 07:07:09.503689	t
242	242	80	85	85	90	95	100	110	0	100	110	150	150	160	170	180	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	65	0.15	65	0.01	65	0.04	65	0.01	65	0.01	65	0.03	65	0.01	65	0.02	0	0.02	facture récap	\N	2021-06-14 07:07:30.702817	t
239	239	0	0	0	165	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.16	0	0.01	7	0.04	0	nan	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:07:27.113834	t
241	241	85	85	85	90	90	110	120	0	116	136	186	226	256	286	316	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	facture récap	\N	2021-06-14 07:07:29.374664	t
233	233	95	103	123	143	158	173	193	0	111	131	181	221	251	281	311	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:07:21.721361	t
228	228	90	90	105	120	140	170	180	110	115	135	160	180	200	250	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	5	0.15	7	0.01	0	0.04	3	0.01	5	0.01	3	0.03	0	0.01	0	0.02	0	0.02	client en facture récap sur interventions réalisé sur le mois et facturé le mois suivant	\N	2021-06-14 07:07:16.072478	t
232	232	92	100	120	140	155	170	190	0	107	127	177	217	247	277	307	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:07:20.620831	t
249	249	85	93	113	133	148	163	183	0	98	118	168	208	238	268	298	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	6	0.2	6	0.0	6	0	3	0.01	5	0.01	0	0.03	0	0.01	12	0.02	12	0.02	facture récpa	\N	2021-06-14 07:07:39.715137	t
230	230	0	85	93	113	133	148	163	0	98	118	168	208	238	268	298	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	34	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	client en facture récap sur interventions réalisé sur le mois et facturé le mois suivant	\N	2021-06-14 07:07:18.637797	t
231	231	90	90	90	110	130	150	170	120	120	140	190	230	260	290	320	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	7	0.01	0	0.04	3	0.01	5	0.01	0	0.03	73	0.01	4	0.02	4	0.02	client en facture récap sur interventions réalisé sur le mois et facturé le mois suivant	\N	2021-06-14 07:07:19.535838	t
227	227	112	120	140	160	175	190	210	0	130	150	200	240	270	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:07:14.785381	t
229	229	80	85	85	85	90	95	100	100	120	120	150	150	150	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	6	0.04	3	0.01	5	0.01	5	0.03	67	0.01	12	0.02	12	0.02	nan	\N	2021-06-14 07:07:16.909556	t
244	244	85	85	85	95	100	110	130	0	130	150	150	180	200	250	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	38	0.04	3	0.01	5	0.01	36	0.03	73	0.01	4	0.02	0	0.02	facture récap	\N	2021-06-14 07:07:32.617775	t
234	234	0	0	130	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Facturé en en TS	\N	2021-06-14 07:07:22.866746	t
236	236	0	111	131	151	166	181	201	0	124	144	194	234	264	294	324	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:07:24.637956	t
237	237	85	85	90	90	100	110	120	0	100	110	180	190	200	210	220	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.16	0	0.01	6	0.04	0	nan	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Facture en récap	\N	2021-06-14 07:07:25.469285	t
235	235	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	7	0.01	7	0.02	0	0.02	nan	\N	2021-06-14 07:07:23.737117	t
246	246	85	85	90	90	90	110	120	0	110	130	150	170	200	200	200	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	0	0.01	0	0.04	3	0.01	5	0.01	5	0.03	0	0.01	12	0.02	12	0.02	nan	\N	2021-06-14 07:07:36.264164	t
245	245	95	100	120	140	155	170	190	0	107	127	177	217	247	277	307	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Facture récap	\N	2021-06-14 07:07:34.96946	t
250	250	85	85	85	85	95	110	130	0	130	150	150	180	200	250	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	38	0.04	3	0.01	5	0.01	73	0.03	0	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:07:41.724903	t
248	248	90	90	90	90	105	120	150	0	100	120	150	170	200	250	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	Facture récap	\N	2021-06-14 07:07:38.220703	t
247	247	85	90	90	110	110	130	130	0	150	150	150	200	200	200	200	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:07:37.093693	t
281	281	83	83	87	95	110	120	130	130	130	150	200	240	270	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	36	0.15	7	0.01	73	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	XD LE 01/11/2017 passage en facture recapt et mise à jour des tarifs suivant formulaire CM / PAKC 400  constats=44800/an, par mois=(3733.33/12)/4=933.33 par agences sur les 4 entités Période= 06/2016 à 05/2017	\N	2021-06-14 07:08:22.411522	t
256	256	0	0	0	0	0	0	0	0	0	0	240	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	Particulier Tarif spécial 240.00€ ht	\N	2021-06-14 07:07:48.091792	t
253	253	0	0	0	148	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:07:45.251051	t
262	262	80	85	85	90	95	100	110	0	120	130	150	170	240	280	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	50	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	73	0.03	0	0.01	4	0.02	4	0.02	Facture Récap - Tarif découverte 3 EDL à 85.00€ APPT et 130.00€ PAV	\N	2021-06-14 07:07:55.360123	t
258	258	88	88	90	95	100	115	130	0	120	130	150	170	240	280	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	0	0.01	12	0.02	12	0.02	Facture Récap. Tarif découverte 3 constats : APPT=90€ ht, PAV=130€ ht.	\N	2021-06-14 07:07:50.479945	t
251	251	99	108	126	144	162	180	225	120	130	150	200	240	270	300	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	Découverte Appt=112.00 ht, PAV=130.00 ht\nOffre promotionnelle TS000 pour cde 5 maisons groupées\nFacture récap ou pas non précisé	\N	2021-06-14 07:07:42.726529	t
271	271	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.16	0	0.01	6	0.04	0	nan	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:08:10.17251	t
255	255	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:07:47.006405	t
254	254	112	120	140	160	175	190	210	0	130	150	200	240	270	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:07:46.111265	t
282	282	83	83	87	95	110	120	130	130	130	150	200	240	270	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	36	0.15	7	0.01	73	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	XD LE 01/11/2017 passage en facture recapt et mise à jour des tarifs suivant formulaire CM / PAKC 400  constats=44800/an, par mois=(3733.33/12)/4=933.33 par agences sur les 4 entités Période= 06/2016 à 05/2018	\N	2021-06-14 07:08:23.510676	t
252	252	0	0	0	0	0	0	0	0	0	0	0	0	300	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	PRO PARTICULIER	\N	2021-06-14 07:07:44.42181	t
270	270	120	120	140	160	175	190	210	0	130	150	200	240	270	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	0	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:08:07.815189	t
280	280	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	Tarif spécial 600.00€	\N	2021-06-14 07:08:21.336531	t
279	279	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	Tarifs spéciaux uniquement F2=TS336	\N	2021-06-14 07:08:20.137919	t
283	283	83	83	87	95	110	120	130	130	130	150	200	240	270	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	36	0.15	7	0.01	73	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	XD LE 01/11/2017 passage en facture recapt et mise à jour des tarifs suivant formulaire CM / PAKC 400  constats=44800/an, par mois=(3733.33/12)/4=933.33 par agences sur les 4 entités Période= 06/2016 à 05/2019	\N	2021-06-14 07:08:24.774735	t
284	284	110	120	140	160	175	190	210	130	130	150	200	240	270	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	Offre découverte 3 missions APPT=110.00 & VIL=130.00	\N	2021-06-14 07:08:25.829355	t
274	274	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:08:14.186676	t
259	259	0	125	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	7	0.01	36	0.04	0	nan	0	0.01	36	0.03	67	0.01	0	0.02	0	0.02	Tarif en TS125	\N	2021-06-14 07:07:51.828516	t
269	269	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	Prix 320.00	\N	2021-06-14 07:08:06.324438	t
268	268	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Factures récap	\N	2021-06-14 07:08:04.183331	t
265	265	112	120	140	160	175	190	210	0	130	150	200	240	270	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	8	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:08:00.272879	t
264	264	85	85	85	85	85	85	85	0	150	150	150	150	150	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	67	0.04	3	0.01	5	0.01	5	0.03	0	0.01	12	0.02	12	0.02	Facture récap	\N	2021-06-14 07:07:59.004013	t
260	260	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:07:52.970087	t
266	266	85	85	85	85	85	85	85	0	150	150	150	150	150	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	6	0.04	3	0.01	0	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:08:01.19841	t
263	263	90	95	95	100	130	150	180	0	115	135	150	170	200	250	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	3 1er EDL APPT=90.00 ht, PAV=150.00ht	\N	2021-06-14 07:07:57.418098	t
257	257	0	0	140	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Particulier Tarif spécial TS140	\N	2021-06-14 07:07:49.165724	t
276	276	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Tarif L'adresse - Facture récap	\N	2021-06-14 07:08:16.652918	t
261	261	0	0	0	0	0	0	0	0	0	0	240	240	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	7	0.01	0	0.04	3	0.01	0	0.01	7	0.03	7	0.01	12	0.02	12	0.02	nan	\N	2021-06-14 07:07:53.899976	t
267	267	90	90	90	90	90	150	150	0	130	130	130	170	190	250	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	65	0.16	0	0.01	7	0.04	0	nan	0	0.01	5	0.03	0	0.01	0	0.02	0	0.02	Factures Récap	\N	2021-06-14 07:08:02.884283	t
275	275	85	90	90	95	100	130	150	120	120	150	150	170	180	230	280	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	67	0.01	12	0.02	12	0.02	nan	\N	2021-06-14 07:08:15.46597	t
273	273	105	114	133	152	171	190	238	124	143	190	238	285	380	475	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	0	0.01	0	0.04	0	nan	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:08:12.430964	t
272	272	80	80	85	90	100	100	100	0	98	118	150	180	190	220	260	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	0	0.03	4	0.01	4	0.02	4	0.02	Facture récap	\N	2021-06-14 07:08:11.29027	t
277	277	0	125	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	36	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	Tarif spécial TS125	\N	2021-06-14 07:08:17.778132	t
278	278	180	180	230	240	260	285	315	0	130	150	200	240	270	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	38	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:08:19.147784	t
285	285	90	90	90	90	90	90	90	150	150	150	150	150	150	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.16	7	0.01	6	0.04	3	nan	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:08:27.161615	t
287	287	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	73	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	Tarif L'adresse - Facture récap	\N	2021-06-14 07:08:29.393756	t
292	292	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	7	0.01	0	0.04	3	0.01	5	0.01	5	0.03	67	0.01	12	0.02	12	0.02	nan	\N	2021-06-14 07:08:37.356011	t
291	291	100	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	36	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:08:34.429846	t
293	293	85	85	85	95	100	110	120	110	110	133	170	200	230	270	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	53	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:08:38.474687	t
288	288	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	6	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:08:30.807147	t
290	290	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:08:33.010764	t
286	286	85	85	90	95	110	120	130	100	120	130	150	180	200	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	0	0.01	0	0.04	3	0.01	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:08:28.160245	t
299	299	103	103	123	143	158	173	193	111	111	131	181	221	251	281	311	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.25	0	0.0	0	0	0	0.0	5	0	5	0.0	67	0.01	12	0.02	12	0.02	nan	\N	2021-06-14 07:08:47.886795	t
294	294	0	0	210	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:08:39.969695	t
302	302	85	85	90	95	110	120	130	110	110	130	150	180	200	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	53	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:08:51.028612	t
298	298	114	114	134	154	169	184	204	124	124	144	194	234	264	294	324	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.25	0	0.0	0	0	0	0.0	5	0	5	0.0	67	0.01	12	0.02	12	0.02	130 LOCAUX COMMERCIAUX	\N	2021-06-14 07:08:45.962289	t
289	289	85	85	85	90	100	110	120	108	108	123	150	170	200	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	6	0.15	6	0.01	67	0.04	0	0.01	5	0.01	67	0.03	6	0.01	12	0.02	12	0.02	nan	\N	2021-06-14 07:08:31.920277	t
300	300	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	53	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:08:48.892724	t
296	296	104	112	118	125	131	144	158	135	135	159	184	220	257	305	342	30	30	30	30	40	40	\N	40	40	45	50	55	60	70	80	\N	0.5	8	0.15	7	0.01	38	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:08:43.437175	t
295	295	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.25	7	0.0	0	0	3	0.0	0	0	0	0.0	67	0.01	0	0.02	0	0.02	Tarif Local+bureaux = 280.00€	\N	2021-06-14 07:08:40.876731	t
297	297	0	0	0	0	0	0	0	0	0	140	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.25	0	0.0	0	0	3	0.0	0	0	0	0.0	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:08:44.890057	t
301	301	90	95	95	100	100	130	150	110	130	150	170	190	200	250	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	53	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:08:49.948714	t
303	303	90	90	90	90	90	90	90	150	150	150	150	150	150	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	#INVALID OPERATION	0	nan	0	FRANCE	0	nan	0	nan	0	nan	67	nan	0	0.02	0	0.02	nan	\N	2021-06-14 07:08:52.348947	t
325	325	0	0	0	160	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:09:22.224664	t
304	304	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	#INVALID OPERATION	0	nan	0	MANDIN	0	nan	0	nan	0	nan	67	nan	0	0.02	0	0.02	nan	\N	2021-06-14 07:08:53.524989	t
332	332	80	85	85	95	110	120	130	100	120	130	150	180	190	230	280	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	6	0.15	6	0.01	6	0.04	3	0.01	5	0.01	5	0.03	67	0.01	12	0.02	12	0.02	nan	\N	2021-06-14 07:09:31.152275	t
333	333	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	0	0.01	0	0.04	3	0.01	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:09:32.195759	t
330	330	102	111	129	148	166	185	231	120	139	185	231	277	370	462	500	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	Locaux commerciaux sur devis	\N	2021-06-14 07:09:28.622333	t
308	308	80	85	90	95	110	120	130	100	115	150	150	170	190	250	290	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	6	0.04	3	0.01	5	0.01	5	0.03	4	0.01	12	0.02	12	0.02	nan	\N	2021-06-14 07:08:59.026887	t
305	305	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	53	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:08:54.709915	t
326	326	105	114	133	152	171	190	238	124	124	143	190	238	285	380	449	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:09:23.186019	t
311	311	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:09:02.134137	t
312	312	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	7	0.01	0	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	Facture sur tarif en TSxxx, le 1er à 270.00€	\N	2021-06-14 07:09:03.175235	t
306	306	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.25	0	0.0	0	0	0	0.0	0	0	0	0.0	67	0.01	0	0.02	0	0.02	Local bureau 55 m² au tarif de 160.00€	\N	2021-06-14 07:08:55.919962	t
314	314	0	0	0	0	0	0	0	0	0	160	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	7	0.01	0	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:09:08.368802	t
309	309	110	120	140	160	175	190	210	130	130	150	200	240	270	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	#INVALID OPERATION	0	nan	0	DROUET	0	nan	0	nan	0	nan	0	nan	0	0.02	0	0.02	nan	\N	2021-06-14 07:09:00.021691	t
329	329	90	90	95	110	140	170	200	125	125	140	160	180	200	280	310	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	0	0.01	36	0.03	67	0.01	0	0.02	0	0.02	Locaux commerciaux sur devis	\N	2021-06-14 07:09:27.162659	t
331	331	92	100	120	140	155	170	190	155	155	170	190	217	247	277	307	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	7	0.01	7	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	Locaux commerciaux sur devis	\N	2021-06-14 07:09:29.925182	t
322	322	80	80	85	90	100	100	100	98	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:09:18.588417	t
321	321	85	85	90	95	110	120	130	110	120	130	150	180	220	250	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:09:17.558355	t
328	328	80	85	85	90	95	100	110	0	120	130	150	170	240	280	300	25	25	25	25	30	30	\N	25	25	25	30	30	30	40	40	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	11	0.03	4	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-14 07:09:25.727338	t
318	318	85	85	85	85	85	85	85	150	150	150	150	150	150	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	7	0.01	7	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:09:13.44458	t
307	307	85	85	90	95	110	120	150	110	110	130	150	170	170	250	280	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	30	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:08:57.081592	t
315	315	80	80	90	95	110	120	130	110	124	130	150	180	220	250	290	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:09:09.77666	t
319	319	80	80	85	90	100	100	100	98	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:09:15.381699	t
317	317	85	85	90	95	110	120	130	100	100	110	150	180	220	250	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	53	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:09:12.077547	t
310	310	85	85	90	95	110	130	150	150	170	180	200	220	250	280	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	6	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:09:01.137996	t
324	324	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	73	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:09:20.975085	t
323	323	80	80	85	90	100	100	100	98	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:09:19.731065	t
320	320	80	80	85	90	100	100	100	98	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:09:16.582056	t
316	316	80	80	90	95	110	120	130	110	110	130	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	53	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:09:10.810941	t
313	313	0	0	0	0	0	0	0	0	0	0	130	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:09:06.626023	t
327	327	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	nan	\N	2021-06-14 07:09:24.642429	t
335	335	0	0	0	0	0	0	0	0	0	0	240	250	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	0	0.01	0	0.04	3	0.01	0	0.01	7	0.03	7	0.01	12	0.02	12	0.02	nan	\N	2021-06-14 07:09:35.000033	t
336	336	80	80	85	90	100	100	100	98	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.25	0	0.0	0	0	0	0.0	0	0	0	0.0	4	0.01	12	0.02	12	0.02	nan	\N	2021-06-14 07:09:36.369127	t
334	334	0	0	0	180	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	0	0.01	0	0.04	3	0.01	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:09:33.658961	t
340	340	0	0	0	0	0	0	0	0	0	0	0	180	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:09:44.086731	t
342	342	85	85	90	95	110	120	150	110	110	120	150	180	200	230	280	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:09:47.356811	t
337	337	90	90	95	100	130	150	180	110	110	120	150	200	230	250	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	6	0.01	6	0.04	3	0.01	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:09:37.878453	t
358	358	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	7	0.01	0	0.04	3	0.01	0	0.01	0	0.03	67	0.01	12	0.02	12	0.02	nan	\N	2021-06-14 07:10:09.863276	t
351	351	95	95	120	140	160	180	200	130	130	150	190	215	240	275	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	36	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:09:58.292537	t
347	347	95	100	120	130	150	170	200	120	120	140	160	180	200	250	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	6	0.15	7	0.01	7	0.04	3	0.01	5	0.01	0	0.03	67	0.01	12	0.02	12	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-14 07:09:53.777094	t
341	341	90	90	110	130	150	170	190	120	120	139	185	215	240	275	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	73	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:09:45.445237	t
338	338	0	0	160	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:09:39.364432	t
344	344	90	90	95	100	115	130	150	130	130	140	150	180	230	270	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	6	0.04	3	0.01	5	0.01	5	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:09:50.112468	t
345	345	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:09:51.318075	t
343	343	85	85	90	100	110	120	130	100	100	119	150	180	200	230	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	7	0.01	67	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	67	0.02	nan	\N	2021-06-14 07:09:49.090186	t
356	356	90	95	100	110	140	150	180	110	110	130	140	180	220	250	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	7	0.01	9	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:10:06.586276	t
346	346	85	85	95	100	110	130	150	107	107	130	150	180	200	250	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:09:52.440747	t
355	355	0	0	170	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	7	0.01	36	0.04	3	0.01	5	0.01	5	0.03	67	0.01	12	0.02	12	0.02	nan	\N	2021-06-14 07:10:04.881608	t
353	353	90	90	95	95	110	130	150	100	110	150	150	170	190	200	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	53	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:10:01.657762	t
364	364	85	90	90	100	110	120	130	115	115	130	150	170	200	250	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	0	0.01	0	0.04	0	0.01	0	0.01	9	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:10:19.313287	t
363	363	0	0	0	160	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:10:18.014925	t
365	365	83	83	87	95	110	120	130	130	130	150	200	240	270	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	36	0.16	7	0.01	73	0.04	3	0.0	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	Locaux commerciaux sur devis	\N	2021-06-14 07:10:20.800874	t
366	366	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	1	0	0.0	0	0	0	0.0	0	0	0	0.0	0	0.0	0	0.0	0	0.0	nan	\N	2021-06-14 07:10:22.008905	t
349	349	85	85	90	100	110	120	130	120	120	130	150	180	230	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	Tarif découverte 1APPT=85 ou 1 PAV=140	\N	2021-06-14 07:09:56.123673	t
362	362	90	90	101	122	137	144	165	151	151	165	180	201	216	237	252	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	36	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:10:16.418179	t
352	352	95	95	110	130	140	150	160	120	130	140	150	170	190	210	240	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.14	5	0.01	5	0.04	3	0.01	5	0.01	5	0.04	4	0.01	13	0.02	13	0.02	nan	\N	2021-06-14 07:09:59.535129	t
339	339	112	120	140	160	175	190	210	175	175	190	210	240	270	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	36	0.04	3	0.01	5	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:09:42.221256	t
361	361	83	83	87	95	110	120	130	130	130	150	200	240	270	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	73	0.04	3	0.01	5	0.01	73	0.03	0	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:10:14.343983	t
359	359	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	1	0	0.0	0	0	0	0.0	0	0	0	0.0	0	0.0	0	0.0	0	0.0	nan	\N	2021-06-14 07:10:11.596553	t
348	348	83	83	87	95	110	120	130	130	130	150	200	240	270	300	330	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:09:55.054714	t
350	350	85	85	90	95	120	140	160	100	140	150	180	230	280	350	400	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	53	0.04	3	0.01	5	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:09:57.128615	t
357	357	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	53	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:10:08.262481	t
360	360	95	95	120	140	160	180	200	130	130	150	190	215	240	275	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:10:13.000101	t
354	354	0	0	140	160	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	5	0.04	3	0.01	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:10:03.551879	t
369	369	80	80	85	90	100	100	100	98	98	118	150	180	190	220	260	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.16	7	0.01	73	0.04	3	0.0	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-14 07:10:26.467738	t
368	368	90	90	95	100	115	130	150	130	130	140	150	180	230	270	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	6	0.04	3	0.01	5	0.01	5	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:10:25.129686	t
378	378	85	85	90	95	100	110	120	100	100	130	150	180	190	200	230	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	LOCAL COMMERCIAL SUR DEVIS	\N	2021-06-14 07:10:41.295864	t
372	372	0	0	120	150	160	0	0	0	120	130	160	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	7	0.01	73	0.04	3	0.01	5	0.01	5	0.03	67	0.01	12	0.02	12	0.02	50% MAJORATION MEUBLE ,LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-14 07:10:31.122351	t
376	376	85	90	95	100	120	130	150	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	30	30	30	40	40	50	0	0	\N	0.5	8	#INVALID OPERATION	7	0.01	73	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	PAS DE PAVILLON EN GESTION	\N	2021-06-14 07:10:37.794984	t
367	367	0	126	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:10:23.541276	t
377	377	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	nan	\N	2021-06-14 07:10:39.392222	t
381	381	0	80	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	6	0.01	67	0.04	3	0.01	5	0.01	5	0.03	67	0.01	67	0.02	0	0.02	2 APPT / POUR 2 et 3 chambres	\N	2021-06-14 07:10:46.52782	t
380	380	85	85	85	90	95	100	110	120	120	130	150	170	240	280	300	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	MAJORATION MEUBLE + 35%, LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-14 07:10:44.561753	t
379	379	85	85	95	100	120	130	150	100	100	140	160	190	200	230	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	0	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	LOCAL COMMERCIAL SUR DEVIS	\N	2021-06-14 07:10:43.413057	t
370	370	110	120	140	160	180	200	250	130	130	150	200	250	300	400	500	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	0	0.01	30	0.04	3	0.01	5	0.01	0	0.03	0	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:10:28.056494	t
374	374	90	95	100	105	110	130	150	110	110	130	150	180	210	250	280	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	65	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	MAJORATION MEUBLE +50% , LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-14 07:10:34.845601	t
373	373	85	85	90	110	130	150	200	110	120	130	160	180	230	280	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.35	5	0.15	7	0.01	0	0.04	3	0.01	5	0.01	5	0.03	67	0.01	12	0.02	12	0.02	LOCAUX COMMERCIAUX SUR DEVIS, MAJORATION MEUBLES +35%	\N	2021-06-14 07:10:33.205947	t
375	375	85	85	90	95	100	120	150	100	100	110	150	180	200	230	280	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	38	0.15	7	0.01	6	0.04	3	0.01	5	0.01	0	0.03	67	0.01	38	0.02	0	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-14 07:10:36.058523	t
371	371	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	0	0.01	0	0.04	0	0.01	0	0.01	0	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:10:29.502124	t
382	382	0	80	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	6	0.01	67	0.04	3	0.01	5	0.01	5	0.03	67	0.01	67	0.02	0	0.02	2 APPT / POUR 2 et 3 chambres	\N	2021-06-14 07:10:47.967081	t
385	385	0	0	135	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	73	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	Meublé	\N	2021-06-14 07:10:51.907937	t
384	384	95	100	105	114	120	131	143	136	136	160	185	221	258	307	344	30	30	30	30	40	40	\N	40	40	45	50	55	60	70	80	\N	0.45	7	0.15	7	0.01	0	0.04	3	0.01	5	0.01	5	0.03	67	0.01	67	0.02	0	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-14 07:10:50.576228	t
383	383	85	85	85	85	85	85	85	150	150	150	150	150	150	150	150	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	67	0.04	3	0.01	5	0.01	5	0.03	67	0.01	12	0.02	12	0.02	XXX	\N	2021-06-14 07:10:49.199536	t
386	386	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.25	7	nan	0	nan	0	nan	5	nan	0	nan	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:10:53.949044	t
391	391	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	-0.84	7	0.01	53	0.04	3	0.01	5	0.01	0	0.03	67	1.0	0	0.02	0	0.02	nan	\N	2021-06-14 07:11:02.109873	t
393	393	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	53	0.04	3	0.01	5	0.01	53	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:11:07.012495	t
387	387	0	0	0	150	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.25	7	nan	0	nan	0	nan	5	nan	0	nan	0	0.01	12	0.02	12	0.02	nan	\N	2021-06-14 07:10:56.444998	t
392	392	80	85	90	95	110	120	130	100	115	150	150	170	190	250	290	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	6	0.04	3	0.01	5	0.01	6	0.03	6	0.01	4	0.02	4	0.02	facturation sur abonnement en récap pour prix unique sur intervention de 85 € ht	\N	2021-06-14 07:11:04.931413	t
388	388	0	0	0	0	0	0	0	0	0	0	330	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.25	7	nan	7	nan	0	nan	5	nan	5	nan	0	0.01	0	0.02	0	0.02	XXX	\N	2021-06-14 07:10:57.971776	t
399	399	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	53	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:11:15.881186	t
390	390	95	100	110	130	135	150	160	135	135	150	165	180	250	300	350	30	30	30	30	40	40	\N	40	40	45	50	55	60	70	80	\N	0.5	5	0.15	7	0.01	9	0.04	3	0.01	5	0.01	5	0.03	67	0.01	12	0.02	12	0.02	LOCAUX COMMERCIAUX DUR DEVIS	\N	2021-06-14 07:11:00.484089	t
401	401	90	90	95	100	120	130	150	135	135	150	165	180	200	250	280	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:11:18.445169	t
397	397	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.16	7	0.01	7	0.04	3	0.0	5	0.01	7	0.03	7	0.01	7	0.02	7	0.02	Parking 150€ . Local bâtiment commerciale  480€ .	\N	2021-06-14 07:11:13.983876	t
396	396	90	90	95	100	120	130	150	107	107	125	150	180	200	250	280	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	6	0.03	4	0.01	4	0.02	4	0.02	Locaux commerciaux sur devis / Meublés majorés de 50%	\N	2021-06-14 07:11:12.849843	t
389	389	95	100	105	110	120	131	143	120	145	145	165	200	236	281	315	30	30	30	30	40	40	\N	40	40	45	50	55	60	70	80	\N	nan	5	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	67	0.01	12	0.02	12	0.02	+35% MAJORATION MEUBLE, LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-14 07:10:59.07967	t
398	398	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	67	0.04	3	0.01	5	0.01	5	0.03	67	0.01	12	0.02	12	0.02	nan	\N	2021-06-14 07:11:15.040956	t
395	395	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.3	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	nan	\N	2021-06-14 07:11:11.814079	t
400	400	0	175	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	tarif pour 1 F1 Meublé 175€	\N	2021-06-14 07:11:17.371263	t
402	402	80	80	85	90	100	100	100	98	98	118	150	180	190	220	260	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	73	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:11:19.504749	t
403	403	80	80	85	90	95	100	110	0	120	130	150	170	240	280	300	30	30	30	30	40	40	\N	40	40	45	50	55	60	70	80	\N	0.5	8	0.15	0	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-14 07:11:20.930963	t
413	413	85	85	90	110	130	150	200	110	120	130	160	180	230	280	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.35	6	nan	7	0.01	73	0.04	0	0.01	5	0.01	5	0.03	67	0.01	12	0.02	12	0.02	nan	\N	2021-06-14 07:11:37.102272	t
405	405	109	112	115	122	129	136	149	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	50%%	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:11:24.102794	t
407	407	80	83	85	90	95	100	110	100	100	120	150	170	200	230	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.33	8	0.15	7	0.01	4	0.04	3	0.01	5	0.01	4	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:11:26.836462	t
410	410	95	95	105	110	120	135	145	120	120	140	150	180	230	280	315	20	20	25	25	30	30	\N	30	30	30	40	40	50	50	50	\N	0.45	65	0.15	7	0.01	0	0.04	3	0.01	0	0.01	5	0.03	67	0.01	65	0.02	0	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-14 07:11:31.950176	t
394	394	85	85	90	95	100	110	120	120	120	140	150	180	200	250	280	30	30	30	30	40	40	\N	40	40	45	50	55	60	70	80	\N	0.5	38	0.15	7	0.01	6	0.04	3	0.01	5	0.01	38	0.03	67	0.01	38	0.02	0	0.02	nan	\N	2021-06-14 07:11:09.317146	t
412	412	90	100	110	120	135	150	130	130	150	165	200	240	290	330	20	20	25	25	30	30	30	\N	30	30	40	40	50	50	50	0	\N	0.45	8	0.15	7	0.01	73	0.04	3	0.01	5	0.01	0	0.03	0	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:11:35.876595	t
406	406	85	85	90	95	100	110	115	100	120	120	155	180	195	220	240	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	0	0.03	0	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:11:25.412296	t
404	404	90	90	95	100	110	130	150	130	130	150	170	200	245	280	300	25	25	25	35	35	35	\N	35	35	45	45	65	45	65	65	\N	0.45	38	0.15	7	0.01	73	0.04	0	0.01	5	0.01	38	0.03	67	0.01	38	0.02	0	0.02	EDL POUR BOX 25 €	\N	2021-06-14 07:11:22.475564	t
417	417	80	80	85	90	100	100	100	98	98	118	150	180	190	220	260	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	nan	7	0.01	73	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:11:44.551847	t
411	411	90	90	95	100	120	135	145	120	120	140	160	180	230	280	315	20	20	25	25	30	30	\N	30	30	30	40	40	50	50	50	\N	0.45	65	0.15	7	0.01	0	0.04	3	0.01	0	0.01	5	0.03	67	0.01	65	0.02	0	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-14 07:11:33.835409	t
409	409	82	84	86	92	97	102	112	102	102	123	153	174	204	235	255	20	20	25	25	30	30	\N	40	30	30	40	40	50	50	50	\N	nan	8	0.15	7	0.01	67	0.04	3	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:11:29.645263	t
416	416	80	80	85	90	100	100	100	98	98	118	150	180	190	220	260	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	38	nan	7	0.01	73	0.04	3	0.01	0	0.01	73	0.03	67	0.01	38	0.02	0	0.02	nan	\N	2021-06-14 07:11:42.931182	t
408	408	80	80	85	90	100	100	100	98	98	118	150	180	190	220	260	30	30	30	30	40	40	\N	40	40	45	50	55	60	70	80	\N	0.5	65	0.15	7	0.01	9	0.04	3	0.01	5	0.01	5	0.03	67	0.01	65	0.02	0	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-14 07:11:28.346402	t
414	414	85	85	90	105	115	130	145	135	135	150	165	180	200	250	280	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	73	0.04	3	0.01	5	0.01	73	0.03	73	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:11:40.180211	t
415	415	90	90	95	110	130	150	170	0	110	110	130	150	170	180	190	20	20	20	20	20	20	\N	20	20	20	20	20	20	20	20	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	5	0.03	0	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:11:41.273047	t
419	419	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	nan	7	0.01	53	0.04	0	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:11:47.875978	t
418	418	85	85	85	90	100	110	120	120	120	130	160	180	190	220	280	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	0	nan	7	0.01	73	0.04	0	0.01	5	0.01	5	0.03	67	0.01	67	0.02	0	0.02	nan	\N	2021-06-14 07:11:45.836909	t
420	420	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	nan	7	0.01	53	0.04	0	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:11:49.099089	t
432	432	85	85	85	90	100	110	120	120	120	130	160	180	190	220	280	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	6	0.15	7	0.01	0	0.04	3	0.01	5	0.01	5	0.03	0	0.01	12	0.02	12	0.02	nan	\N	2021-06-14 07:12:04.492865	t
444	444	85	85	90	95	110	120	130	120	120	140	150	180	230	250	290	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.41	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	4	0.03	6	0.01	4	0.02	12	0.02	nan	\N	2021-06-14 07:12:20.778562	t
438	438	0	0	0	240	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	7	0.01	12	0.02	12	0.02	nan	\N	2021-06-14 07:12:13.333761	t
434	434	0	0	0	0	0	0	0	0	0	0	0	0	290	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	7	0.01	12	0.02	12	0.02	nan	\N	2021-06-14 07:12:07.357172	t
421	421	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	nan	7	0.01	53	0.04	0	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:11:50.352115	t
442	442	110	120	140	160	180	200	250	150	150	180	250	280	350	450	480	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	4	0.04	3	0.01	5	0.01	4	0.03	6	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-14 07:12:18.333077	t
440	440	80	80	85	90	100	110	120	120	120	130	150	170	180	190	200	15	15	15	20	20	25	\N	30	30	40	40	5	50	50	50	\N	0.5	6	0.15	7	0.01	7	0.04	3	0.01	5	0.01	11	0.03	6	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:12:15.619789	t
433	433	90	95	100	110	120	135	145	120	120	140	160	180	230	280	315	20	20	25	25	30	30	\N	30	30	30	40	40	50	50	50	\N	0.41	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	4	0.03	4	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-14 07:12:06.075687	t
431	431	85	85	90	95	100	120	130	120	120	140	150	170	200	230	250	20	20	25	25	30	30	\N	30	30	30	40	40	50	50	50	\N	0.4	7	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	7	0.01	12	0.02	12	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-14 07:12:02.903943	t
439	439	80	80	85	90	100	110	120	120	120	130	150	170	180	190	200	15	15	15	20	20	25	\N	30	30	40	40	5	50	50	50	\N	nan	6	0.15	7	0.01	7	0.04	3	0.01	5	0.01	11	0.03	6	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:12:14.389947	t
443	443	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	6	0.15	6	0.01	9	0.04	3	0.01	5	0.01	9	0.03	4	0.01	12	0.02	12	0.02	nan	\N	2021-06-14 07:12:19.579705	t
436	436	90	90	100	100	100	120	130	120	120	140	160	180	230	280	315	20	20	25	25	30	30	\N	30	30	40	40	40	50	50	50	\N	0.45	7	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	7	0.01	12	0.02	0	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-14 07:12:10.049167	t
435	435	0	0	0	0	0	0	0	0	0	0	240	240	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	7	0.01	12	0.02	12	0.02	nan	\N	2021-06-14 07:12:08.574735	t
437	437	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	4	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:12:11.56839	t
441	441	80	80	85	90	100	110	120	120	120	130	150	170	180	190	200	20	20	25	25	30	30	\N	30	30	40	40	40	50	50	50	\N	0.5	6	0.15	6	0.01	73	0.04	3	0.01	5	0.01	73	0.03	6	0.01	12	0.02	12	0.02	nan	\N	2021-06-14 07:12:17.230043	t
445	445	110	120	140	160	180	200	250	150	150	180	250	280	350	450	480	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	4	0.04	3	0.01	5	0.01	4	0.03	6	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:12:23.150018	t
446	446	80	80	90	95	110	120	130	100	100	130	150	170	180	200	250	25	25	25	25	30	30	\N	20	20	20	25	25	25	35	35	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	85	0.03	6	0.01	12	0.02	12	0.02	nan	\N	2021-06-14 07:12:24.971179	t
447	447	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	4	0.03	6	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:12:26.230391	t
449	449	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	nan	\N	2021-06-14 07:12:28.604168	t
426	426	85	85	90	95	110	120	150	110	110	130	150	170	170	250	280	20	20	25	25	30	30	\N	30	30	30	40	40	50	50	50	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-14 07:11:56.844775	t
430	430	80	80	85	90	95	100	110	120	120	130	150	170	240	280	300	20	20	25	25	30	30	\N	30	30	30	40	40	50	50	50	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	73	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-14 07:12:01.262644	t
428	428	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	nan	\N	2021-06-14 07:11:59.084837	t
422	422	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	nan	7	0.01	53	0.04	0	0.01	5	0.01	5	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:11:52.095085	t
425	425	85	85	90	110	130	150	200	120	120	130	160	180	230	280	350	20	20	25	25	30	30	\N	40	30	30	40	40	50	50	50	\N	0.35	6	0.15	7	0.01	0	0.04	3	0.01	5	0.01	5	0.03	0	0.01	12	0.02	12	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-14 07:11:55.39365	t
423	423	0	0	140	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	nan	7	0.01	36	0.04	3	0.01	0	0.01	36	0.03	67	0.01	0	0.02	0	0.02	nan	\N	2021-06-14 07:11:53.16809	t
450	450	80	80	85	90	90	100	100	98	100	120	150	180	190	220	250	20	20	20	20	20	25	\N	20	20	20	20	25	25	35	35	\N	0.45	8	0.15	7	0.01	73	0.04	3	0.01	5	0.01	3	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:12:29.825832	t
453	453	80	80	85	90	110	120	130	120	120	130	150	180	190	220	250	15	15	20	20	25	25	\N	25	25	25	35	35	35	45	45	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	6	0.03	4	0.01	12	0.02	12	0.02	client en lissage de facturation au prix moyen de _80 € APPT et 110 € PAV\nle client à prix et validé l'option de comparatif edle/edls	\N	2021-06-14 07:12:34.316091	t
427	427	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	nan	\N	2021-06-14 07:11:58.050765	t
448	448	85	85	90	95	110	120	130	100	100	130	150	170	180	200	250	25	25	25	25	30	30	\N	20	20	20	25	25	25	35	35	\N	0.5	6	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	4	0.01	12	0.02	12	0.02	nan	\N	2021-06-14 07:12:27.375559	t
424	424	104	112	118	125	131	144	158	135	135	159	184	220	257	305	342	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	38	0.04	3	0.01	5	0.01	5	0.03	0	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:11:54.24952	t
455	455	0	0	90	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	6	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:12:37.235183	t
452	452	80	80	85	90	100	100	100	98	98	118	150	180	190	220	250	25	25	25	25	30	30	\N	30	30	30	30	30	30	40	40	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	4	0.01	4	0.02	12	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-14 07:12:32.846726	t
429	429	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	nan	\N	2021-06-14 07:12:00.071332	t
451	451	0	0	0	0	0	0	0	0	0	100	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	7	0.01	73	0.04	3	0.01	5	0.01	73	0.03	4	0.01	12	0.02	12	0.02	nan	\N	2021-06-14 07:12:30.915761	t
454	454	85	85	90	95	110	120	135	120	120	130	150	180	230	280	315	25	25	25	25	30	30	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	14	0.04	3	0.01	5	0.01	14	0.03	4	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-14 07:12:35.511034	t
456	456	0	0	180	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	4	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:12:38.470258	t
463	463	80	85	85	90	95	100	110	0	120	130	150	170	240	280	300	25	25	25	25	30	30	\N	25	25	25	30	30	30	40	40	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	11	0.03	4	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-14 07:12:47.745719	t
462	462	80	85	90	95	110	120	130	100	115	150	150	170	190	250	290	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	6	0.15	7	0.01	6	0.04	3	0.01	5	0.01	5	0.03	4	0.01	13	0.02	13	0.02	nan	\N	2021-06-14 07:12:46.547503	t
464	464	0	0	0	0	0	0	0	0	0	0	0	260	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	4	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:12:49.67712	t
459	459	90	90	95	100	110	120	135	120	120	130	150	180	230	280	315	25	25	25	25	30	30	\N	25	25	25	30	30	30	40	40	\N	0.5	0	0.15	7	0.01	7	0.04	3	0.01	5	0.01	3	0.03	4	0.01	0	0.02	12	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-14 07:12:41.972855	t
472	472	90	90	95	100	110	120	135	120	125	140	160	180	230	280	320	25	25	25	25	30	30	\N	25	25	25	30	30	30	40	40	\N	0.5	4	0.15	7	0.01	7	0.04	3	0.01	5	0.01	4	0.03	4	0.01	4	0.02	12	0.02	FDC SUR DEVIS	\N	2021-06-14 07:13:02.021112	t
461	461	0	0	0	0	0	230	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	6	0.03	0	0.01	0	0.02	12	0.02	nan	\N	2021-06-14 07:12:45.203038	t
457	457	0	0	0	0	0	0	0	0	0	0	220	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	4	0.03	4	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-14 07:12:39.690088	t
471	471	125	125	135	145	155	165	175	150	155	180	200	250	280	300	350	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	7	0.15	7	0.01	7	0.04	3	0.01	5	0.01	0	0.03	4	0.01	4	0.02	12	0.02	nan	\N	2021-06-14 07:13:00.988334	t
465	465	0	0	0	0	0	0	0	0	0	0	150	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	nan	6	0.01	6	0.04	3	0.01	5	0.01	6	0.03	4	0.01	0	0.02	12	0.02	nan	\N	2021-06-14 07:12:50.785029	t
468	468	0	0	135	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	11	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:12:57.136355	t
469	469	0	0	0	144	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	8	0.15	7	0.01	4	0.04	3	0.01	5	0.01	4	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:12:58.248829	t
460	460	0	0	0	0	0	0	0	0	0	0	300	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	7	0.15	7	0.01	7	0.04	3	0.01	5	0.01	7	0.03	7	0.01	0	0.02	12	0.02	nan	\N	2021-06-14 07:12:44.164882	t
458	458	85	85	90	95	120	130	145	120	120	130	150	180	230	280	315	25	25	25	25	30	30	\N	25	25	25	30	30	30	40	40	\N	0.5	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	4	0.03	4	0.01	4	0.02	4	0.02	LOCAUX COMMERCIAUX SUR DEVIS	\N	2021-06-14 07:12:40.749417	t
467	467	0	0	0	0	235	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	11	0.03	4	0.01	4	0.02	4	0.02	nan	\N	2021-06-14 07:12:56.127159	t
466	466	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	0.5	7	0.15	6	0.01	7	0.04	3	0.01	5	0.01	7	0.03	4	0.01	12	0.02	12	0.02	nan	\N	2021-06-14 07:12:52.328083	t
470	470	0	0	140	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	7	0.01	7	0.04	3	0.01	5	0.01	6	0.03	4	0.01	12	0.02	12	0.02	nan	\N	2021-06-14 07:12:59.742398	t
473	473	0	0	0	90	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	7	0.01	6	0.04	3	0.01	5	0.01	0	0.03	4	0.01	12	0.02	12	0.02	nan	\N	2021-06-14 07:13:03.221077	t
474	474	0	0	0	0	0	375	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	0	0.03	4	0.01	4	0.02	12	0.02	nan	\N	2021-06-14 07:13:04.315228	t
479	479	0	0	0	0	210	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	5	0.04	3	0.01	5	0.01	0	0.03	4	0.01	12	0.02	12	0.02	nan	\N	2021-06-14 07:13:13.407746	t
475	475	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	0	nan	nan	\N	2021-06-14 07:13:07.038245	t
478	478	0	0	200	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	8	0.15	7	0.01	7	0.04	3	0.01	5	0.01	0	0.03	4	0.01	13	0.02	13	0.02	nan	\N	2021-06-14 07:13:11.351157	t
476	476	0	0	0	0	0	0	0	0	0	0	0	0	250	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	6	0.15	7	0.01	7	0.04	3	0.01	5	0.01	0	0.03	4	0.01	4	0.02	12	0.02	nan	\N	2021-06-14 07:13:08.11181	t
477	477	0	0	0	0	0	0	0	0	0	0	0	240	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	0	0	0	0	\N	nan	5	0.15	7	0.01	5	0.04	3	0.01	5	0.01	0	0.03	4	0.01	13	0.02	13	0.02	nan	\N	2021-06-14 07:13:09.217863	t
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
1	\N	PROSPECT	AGENCE SOTTET IMMOBILIER	\N	Monsieur	.	\N	\N	nan	2021-06-14 07:02:26.213413	t
2	\N	PROSPECT	ALIZE IMMOBILIER	\N	Monsieur	meglio franck	\N	\N	nan	2021-06-14 07:02:26.960317	t
3	\N	PROSPECT	ORPI LA BRIARDE	\N	Madame	challet monique	\N	\N	nan	2021-06-14 07:02:26.989299	t
4	\N	PROSPECT	BIEN SUR IMMOBILIER	\N	Monsieur	luu hubert	\N	\N	nan	2021-06-14 07:02:27.015284	t
5	\N	PROSPECT	S.G.I.T	\N	Monsieur	gozlan	\N	\N	nan	2021-06-14 07:02:27.037273	t
6	\N	PROSPECT	S.G.I.T	\N	Monsieur	gozlan	\N	\N	nan	2021-06-14 07:02:27.055262	t
7	\N	PROSPECT	AGENTYS	\N	Madame	msika danielle	\N	\N	nan	2021-06-14 07:02:27.082247	t
8	\N	PROSPECT	HARTZ IMMO	\N	Madame	hartz magarett	\N	\N	nan	2021-06-14 07:02:27.107232	t
9	\N	PROSPECT	DE VALLIERE	\N	Monsieur	agence de valliere	\N	\N	nan	2021-06-14 07:02:27.901299	t
10	\N	PROSPECT	REBY Michel	\N	Monsieur	office locations transactions	\N	\N	nan	2021-06-14 07:02:27.923285	t
11	\N	PROSPECT	HULOT	\N	Monsieur	guy hoquet h2immo	\N	\N	nan	2021-06-14 07:02:27.951271	t
12	\N	PROSPECT	PARIS BRETAGNE	\N	Monsieur	chauvin philippe	\N	\N	nan	2021-06-14 07:02:28.837964	t
13	\N	PROSPECT	AVICA	\N	Monsieur	dries vincent	\N	\N	nan	2021-06-14 07:02:29.614962	t
14	\N	PROSPECT	ELBAZ-BOULAY Malika	\N	Madame	meb gestion	\N	\N	nan	2021-06-14 07:02:29.634952	t
15	\N	PROSPECT	CENTURY 21 ADM GRAND SUD	\N	Madame	cousinard julie	\N	\N	nan	2021-06-14 07:02:31.102045	t
16	\N	PROSPECT	REGARDS IMMOBILIER	\N	Monsieur	touati michael	\N	\N	nan	2021-06-14 07:02:31.122034	t
17	\N	PROSPECT	GERANCE PLUS IMMOBILIER	\N	Monsieur	gorre jean- christophe	\N	\N	nan	2021-06-14 07:02:31.156017	t
18	\N	PROSPECT	GUY HOQUET - REAL IMMOBILIER	\N	Madame	dumon alexandra	\N	\N	nan	2021-06-14 07:02:31.200396	t
19	\N	PROSPECT	CJ IMMOBILIER	\N	Monsieur	andre louis	\N	\N	nan	2021-06-14 07:02:31.269358	t
20	\N	PROSPECT	SOLES IMMO	\N	Monsieur	francoulon henri	\N	\N	nan	2021-06-14 07:02:31.288348	t
21	\N	PROSPECT	AGENCE PRINCIPALE	\N	Mademoiselle	denet	\N	\N	nan	2021-06-14 07:02:32.234396	t
22	\N	PROSPECT	Vieux Versailles Immobilier	\N	Madame	usson sandy	\N	\N	nan	2021-06-14 07:02:32.257385	t
23	\N	PROSPECT	LA BOURSE IMMOBILIERE DE L'ILE DE France	\N	Madame	weber marine	\N	\N	nan	2021-06-14 07:02:32.274895	t
24	\N	PROSPECT	PARC IMMO 78	\N	Monsieur	le provost nicolas	\N	\N	nan	2021-06-14 07:02:32.302876	t
25	\N	PROSPECT	ACCORD IMMO	\N	Monsieur	valette	\N	\N	nan	2021-06-14 07:02:32.344857	t
26	\N	PROSPECT	AEDES IMMOBILIER	\N	Madame	lannou françoise	\N	\N	nan	2021-06-14 07:02:32.38683	t
27	\N	PROSPECT	L'IMMOBILIERE DE BOULOGNE	\N	Monsieur	chaput romain	\N	\N	nan	2021-06-14 07:02:32.409815	t
28	\N	PROSPECT	AVIS IMMOBILIER	\N	Madame	anger claire	\N	\N	nan	2021-06-14 07:02:32.426807	t
29	\N	PROSPECT	AVANTAGES IMMOBILIER	\N	Mme & Mr.	boule & fournier sébastien	\N	\N	nan	2021-06-14 07:02:32.443798	t
30	\N	PROSPECT	GUY HOQUET - CABINET FREDELON	\N	Monsieur	bismuth lionel	\N	\N	nan	2021-06-14 07:02:32.463786	t
31	\N	PROSPECT	HAP Immobilier	\N	Monsieur	arnaud d'agier de rufosse	\N	\N	nan	2021-06-14 07:02:33.434395	t
32	\N	PROSPECT	AGENCE CENTRALE	\N	Monsieur	lemoine j	\N	\N	nan	2021-06-14 07:02:33.450392	t
33	\N	PROSPECT	LAFORET IMMOBILIER	\N	Monsieur	rolland arnaud	\N	\N	nan	2021-06-14 07:02:34.583108	t
62	\N	PROSPECT	ORPI Cabinet MERI	\N	Monsieur	rinaldi mario	\N	\N	nan	2021-06-14 07:02:54.994873	t
34	109218	PROSPECT	Etude Fauquereau - Simonet	etudefauquereau-simonet	Monsieur	simonet manuel	\N	\N	nan	2021-06-14 07:02:35.541424	t
35	\N	PROSPECT	CENTURY 21	\N	Monsieur	barnier	\N	\N	nan	2021-06-14 07:02:35.582399	t
36	\N	PROSPECT	EXECUTIVE RELOCATIONS	\N	Madame	inga le jean	\N	\N	nan	2021-06-14 07:02:36.487116	t
37	\N	PROSPECT	AGENCE SAINT NICOLAS	\N	Madame	augenie marie-france	\N	\N	nan	2021-06-14 07:02:36.51962	t
38	\N	PROSPECT	OLIVIER CLEMENT IMMOBILIER	\N	Madame	boutoille blois anny	\N	\N	nan	2021-06-14 07:02:36.544602	t
39	\N	PROSPECT	AGENCE DE L'ILE	\N	Madame	malessard	\N	\N	nan	2021-06-14 07:02:36.5841	t
40	\N	PROSPECT	VAL DE SEINE IMMOBILIER	\N	Madame	morise	\N	\N	nan	2021-06-14 07:02:36.607302	t
41	\N	PROSPECT	CABINET SGP	\N	Monsieur	seraidarian frédéric	\N	\N	nan	2021-06-14 07:02:37.951281	t
42	\N	PROSPECT	Agence des Arcades de Buc	\N	Monsieur	blanc stéphane	\N	\N	nan	2021-06-14 07:02:37.983261	t
43	\N	PROSPECT	IPS IMMOBILIERE PARIS SUD	\N	Madame	guyomard chantal	\N	\N	nan	2021-06-14 07:02:38.066213	t
44	\N	PROSPECT	GUY HOQUET SARL IMMOFAR	\N	Monsieur	van strate jean-claude	\N	\N	nan	2021-06-14 07:02:38.098257	t
45	\N	PROSPECT	LAFORET CC IMMO	\N	Madame	duval julie	\N	\N	nan	2021-06-14 07:02:38.164221	t
46	\N	PROSPECT	PRIMO	\N	Madame	pan	\N	\N	nan	2021-06-14 07:02:38.317712	t
47	\N	PROSPECT	ELYSE AVENUE	\N	Monsieur	gasnier marcel	\N	\N	nan	2021-06-14 07:02:38.35021	t
48	\N	PROSPECT	CABINET LATY	\N	Madame	guhur céline	\N	\N	nan	2021-06-14 07:02:39.18442	t
49	\N	PROSPECT	A.M.I.S	\N	Madame	brouat nathalie	\N	\N	nan	2021-06-14 07:02:39.214405	t
50	\N	PROSPECT	AGENCE DE LA ROSERAIE - ORPI	\N	Madame	barral fabienne	\N	\N	nan	2021-06-14 07:02:39.234392	t
51	\N	PROSPECT	LAFORET IMMOBILIER FRANCONVILLE	laforet	Monsieur	lucas olivier	\N	\N	nan	2021-06-14 07:02:45.400619	t
52	\N	PROSPECT	MONNE DECROIX	\N	Madame	samoros solange	\N	\N	nan	2021-06-14 07:02:46.574422	t
53	\N	PROSPECT	INTER CHANGE IMMOBILIER	\N	Monsieur	genest jean-michel	\N	\N	nan	2021-06-14 07:02:47.526594	t
54	\N	PROSPECT	FUTUR TRANSACTIONS	\N	Monsieur	truptil rémy	\N	\N	nan	2021-06-14 07:02:47.563573	t
55	\N	PROSPECT	LAFORET IMMOBILIER	\N	Monsieur	olie jérôme	\N	\N	nan	2021-06-14 07:02:49.625551	t
56	\N	PROSPECT	CAPPEVILLE IMMOBILIER	\N	Monsieur	ros johann	\N	\N	nan	2021-06-14 07:02:49.644542	t
57	\N	PROSPECT	STARS IMMOBILIER	\N	Monsieur	cedric	\N	\N	nan	2021-06-14 07:02:49.671524	t
58	\N	PROSPECT	HABITAT SEVICE	\N	Monsieur	cavalerie	\N	\N	nan	2021-06-14 07:02:49.692512	t
59	\N	PROSPECT	CLIC IMMOBILIER	\N	Mesdames	benitha et sambourg	\N	\N	nan	2021-06-14 07:02:49.720497	t
60	\N	PROSPECT	ORPI	\N	Madame	labadie maryse	\N	\N	nan	2021-06-14 07:02:50.835477	t
61	\N	PROSPECT	ERA TREFLE IMMOBILIER	\N	Madame	labarriere caroline	\N	\N	nan	2021-06-14 07:02:54.969887	t
63	\N	PROSPECT	PRIMO IMMOBILIER	\N	Monsieur	dodille	\N	\N	nan	2021-06-14 07:02:55.015518	t
64	\N	PROSPECT	GUY HOQUET	\N	Madame	fontaine céline	\N	\N	nan	2021-06-14 07:02:56.180983	t
65	\N	PROSPECT	ORPI	\N	Monsieur	malvaud	\N	\N	nan	2021-06-14 07:02:56.218995	t
66	\N	PROSPECT	BATIR TRANSACTIONS	\N	Monsieur	pruvot bernard	\N	\N	nan	2021-06-14 07:02:57.589393	t
67	\N	PROSPECT	ENVOL GESTION ORPI	\N	Monsieur	de labaca	\N	\N	nan	2021-06-14 07:03:00.073709	t
68	\N	PROSPECT	EURO IMMO	\N	Madame	duval	\N	\N	nan	2021-06-14 07:03:01.350455	t
69	\N	PROSPECT	LAFORET ALAIN LAMBOUR IMMOBILIER SAS	\N	Monsieur	lambour alain	\N	\N	nan	2021-06-14 07:03:06.134663	t
70	\N	PROSPECT	CABINET LATASTE - VION	\N	Madame	glorieux valérie	\N	\N	nan	2021-06-14 07:03:09.272771	t
71	\N	PROSPECT	Cabinet Chauvel Transaction	\N	Madame	cohade	\N	\N	nan	2021-06-14 07:03:13.223584	t
72	\N	PROSPECT	FUTUR TRANSACTIONS	\N	Madame	bailly sophie	\N	\N	nan	2021-06-14 07:03:13.257562	t
73	\N	PROSPECT	LES TERRAINS D'AQUITAINE	\N	Madame	goichon brigitte	\N	\N	nan	2021-06-14 07:03:13.549818	t
74	\N	PROSPECT	FOCH IMMOBILIER	\N	Madame	ballon virginie	\N	\N	nan	2021-06-14 07:03:17.504536	t
75	\N	PROSPECT	IMMODIA	\N	Monsieur	peroy franck	\N	\N	nan	2021-06-14 07:03:17.583437	t
76	\N	PROSPECT	AGENCE SAINT HELENE	\N	Monsieur	dupart denis	\N	\N	nan	2021-06-14 07:03:22.46046	t
77	\N	PROSPECT	ERA - ELIXIM	\N	Monsieur	auburtin	\N	\N	nan	2021-06-14 07:03:24.027344	t
78	\N	PROSPECT	CENTURY21 - TALENT IMMOBILIER	\N	Monsieur	bibes françois	\N	\N	nan	2021-06-14 07:03:24.091472	t
83	\N	PROSPECT	AQUITAINE PROPERTY	\N	Monsieur	duparc	\N	\N	nan	2021-06-14 07:03:28.059052	t
84	\N	PROSPECT	DEGUELT IMMOBILIER	\N	Monsieur	goguel franck	\N	\N	nan	2021-06-14 07:03:28.089033	t
79	\N	PROSPECT	IMMO HUGUERIE	\N	Monsieur	grunel olivier	\N	\N	nan	2021-06-14 07:03:25.197343	t
80	\N	PROSPECT	CARNET DE L'IMMOBILIER	\N	Madame	barbedette	\N	\N	nan	2021-06-14 07:03:25.228324	t
81	\N	PROSPECT	ARGOS IMMOBILIER	\N	Monsieur	sanchez thierry	\N	\N	nan	2021-06-14 07:03:25.337777	t
82	\N	PROSPECT	B2P	\N	Monsieur	plazzi bertrand	\N	\N	nan	2021-06-14 07:03:26.881969	t
85	\N	PROSPECT	GRISEL IMMOBILIER	\N	Madame	sage corinne	\N	\N	nan	2021-06-14 07:03:29.221189	t
86	\N	PROSPECT	LAFORET - MARTIN IMMOBILIER	\N	Monsieur	martin florian	\N	\N	nan	2021-06-14 07:03:29.25517	t
87	\N	PROSPECT	BSI BOULOGNE SUD	\N	Monsieur	caron	\N	\N	nan	2021-06-14 07:03:29.288157	t
88	\N	PROSPECT	4% MAX	\N	Monsieur	fisnot	\N	\N	nan	2021-06-14 07:03:29.328126	t
89	\N	PROSPECT	COPAC	\N	Monsieur	wilkinson richard	\N	\N	nan	2021-06-14 07:03:29.35511	t
90	\N	PROSPECT	CENTURY 21 PRESTIMMO CONSEIL	\N	Monsieur	lamballais françois	\N	\N	nan	2021-06-14 07:03:29.377097	t
91	\N	PROSPECT	R&B IMMOBILIER	\N	Monsieur	coupe benoît	\N	\N	nan	2021-06-14 07:03:29.396091	t
92	\N	PROSPECT	GRECH IMMOBILIER	\N	Monsieur	meutry	\N	\N	nan	2021-06-14 07:03:29.417076	t
93	\N	PROSPECT	CONDOR IMMOBILIER	\N	Monsieur	teboul dan	\N	\N	nan	2021-06-14 07:03:29.445582	t
94	\N	PROSPECT	AVANTIM AQUITAINE	\N	Monsieur	papelard françois	\N	\N	nan	2021-06-14 07:03:29.473568	t
95	\N	PROSPECT	BILLON RST	\N	Monsieur	lamani thierry	\N	\N	nan	2021-06-14 07:03:35.869364	t
96	\N	PROSPECT	LOGESSIM	\N	Madame	bonis	\N	\N	nan	2021-06-14 07:03:40.183432	t
97	\N	PROSPECT	SAINT AGNANT IMMOBILIER	\N	Madame	mathieu isabelle	\N	\N	nan	2021-06-14 07:03:40.213418	t
98	\N	PROSPECT	PONANT IMMOBILIER	\N	Monsieur	buccafurri christel	\N	\N	nan	2021-06-14 07:03:42.676643	t
99	\N	PROSPECT	EURO GESTION	\N	Madame	boismorand	\N	\N	nan	2021-06-14 07:03:42.695629	t
100	\N	PROSPECT	RIVAGE IMMOBILIER	\N	Monsieur	deshayes gilles	\N	\N	nan	2021-06-14 07:03:44.000229	t
101	\N	PROSPECT	CABINET MADIER	\N	Monsieur	madier jacques	\N	\N	nan	2021-06-14 07:03:48.741249	t
102	\N	PROSPECT	ERA L.V.I	\N	Messieurs	viale franck & legroux yoan	\N	\N	nan	2021-06-14 07:03:48.765235	t
103	\N	PROSPECT	CENTURY 21 ACCORT'IMMO	\N	Madame	deregnaucourt evelyne	\N	\N	nan	2021-06-14 07:03:48.779226	t
104	\N	PROSPECT	LAFONTAINE IMMOBILIER L'ADRESSE	\N	Monsieur	lafontaine mathieu	\N	\N	nan	2021-06-14 07:03:48.793219	t
105	\N	PROSPECT	MER ET CAMPAGNE	\N	Madame	leleu caroline	\N	\N	nan	2021-06-14 07:03:50.714589	t
106	\N	PROSPECT	L'ADRESSE IMMOBILIERE OCEANE	\N	Madame	brochard	\N	\N	nan	2021-06-14 07:03:50.737577	t
107	\N	PROSPECT	L'EMPIRE IMMOBILIER	\N	Madame	couton géraldine	\N	\N	nan	2021-06-14 07:03:51.694778	t
108	\N	PROSPECT	AGENCE DU PHARE	\N	Madame	gauthier françoise	\N	\N	nan	2021-06-14 07:03:58.202317	t
109	\N	PROSPECT	EURLARDOUINIMMOBILIER SUD LOIRE	\N	Monsieur	ardouin michel	\N	\N	nan	2021-06-14 07:03:58.224306	t
110	\N	PROSPECT	CABINET PREMUIM CENTRE	\N	Madame	pluvinage marie	\N	\N	nan	2021-06-14 07:03:59.500462	t
111	\N	PROSPECT	LA COLINIERE IMMOBILIER	\N	Monsieur	viel bertrand	\N	\N	nan	2021-06-14 07:04:01.783835	t
112	\N	PROSPECT	THALASSA	sarlthalassaimmobilier	Monsieur	hakoun franck	\N	\N	nan	2021-06-14 07:04:01.834806	t
113	\N	PROSPECT	BARATTE IMMOBILIER	baratteimmobilier	Madame	richard vanessa	\N	\N	nan	2021-06-14 07:04:43.810599	t
114	\N	PROSPECT	CABINET IMMOBILIER MERIEAU	cabinetimmobiliermerieau	Monsieur	merieau thierry	\N	\N	nan	2021-06-14 07:04:52.517673	t
115	\N	PROSPECT	METEO IMMOBILIER	\N	Madame	mourat	\N	\N	nan	2021-06-14 07:04:56.749303	t
116	\N	PROSPECT	AGENCE IMMOBILIERE ALIZEO	\N	Monsieur	leguey mathieu	\N	\N	nan	2021-06-14 07:04:56.768284	t
117	\N	PROSPECT	CABINET FOUCHE	\N	Monsieur	fouche stéphane	\N	\N	nan	2021-06-14 07:04:56.789274	t
118	\N	PROSPECT	CABINET DUBERNAT	cabinetdubernat	Monsieur	dubernat stéphane	\N	\N	nan	2021-06-14 07:04:58.486675	t
119	\N	PROSPECT	CABINET BRUN IMMOBILIER	\N	Monsieur	brun françois	\N	\N	nan	2021-06-14 07:05:00.254146	t
120	\N	PROSPECT	MI MONDESIR IMMOBILIER	\N	Monsieur	beaujouan christophe	\N	\N	nan	2021-06-14 07:05:01.9467	t
121	\N	PROSPECT	TAUSSAT IMMOBILIER	\N	Madame	orell catherine	\N	\N	nan	2021-06-14 07:05:01.967688	t
122	\N	PROSPECT	AXAL IMMOBILIER	\N	Madame	argenti sandrine	\N	\N	nan	2021-06-14 07:05:02.387653	t
123	\N	PROSPECT	CABINET BEDIN	\N	Monsieur	michelet	\N	\N	nan	2021-06-14 07:05:03.505136	t
124	\N	PROSPECT	ERA TOURAINE IMMOBILIER	\N	Monsieur	briand vincent	\N	\N	nan	2021-06-14 07:05:06.554844	t
125	\N	PROSPECT	CLEMENCEAU IMMOBILIER	85immolarochesuryon	Monsieur	algudo thierry	\N	\N	nan	2021-06-14 07:05:22.525641	t
126	\N	PROSPECT	MIRAMAR	miramar	Monsieur	billaud	\N	\N	nan	2021-06-14 07:05:29.018671	t
127	\N	PROSPECT	L'ADRESSE SAS AGENCE DE L'OCEAN	\N	Monsieur	adrian eric	\N	\N	nan	2021-06-14 07:05:29.995712	t
128	\N	PROSPECT	SQUARE HABITAT ATLANTIQUE VENDEE	squarehabitatatlantiquevendee	Monsieur	louineau tony	\N	\N	nan	2021-06-14 07:05:32.610347	t
129	\N	PROSPECT	BELVIA IMMOBILIER	belviaimmobilier	Monsieur	frouin laurent	\N	\N	nan	2021-06-14 07:05:33.619419	t
130	\N	PROSPECT	ATP IMMOBILIER	\N	Madame	recoquillon servane	\N	\N	nan	2021-06-14 07:05:43.278662	t
131	\N	PROSPECT	AGENCE ALIZES	\N	Madame	baniel marie	\N	\N	nan	2021-06-14 07:05:43.308649	t
132	110450	PROSPECT	MGL - IMMOBILIERE DE ROYAN	mgl-laforetimmobilierederoyan	Madame	asselin aline	\N	\N	47772963600019	2021-06-14 07:05:45.275734	t
133	\N	PROSPECT	nan	isoinvest	Monsieur	azoulay fabrice	\N	\N	nan	2021-06-14 07:05:45.334736	t
136	110420	PROSPECT	ORPI CABINET GAUDUCHON	orpicabinetgauduchon	Monsieur	gauduchon mickael	\N	\N	nan	2021-06-14 07:06:10.882989	t
134	110420	PROSPECT	IMONET SASU	imonet	Monsieur	gautheret quentin (gerant) sebaoun vanessa (respsb. ag)	\N	\N	53229059000027	2021-06-14 07:05:51.886301	t
135	\N	PROSPECT	CENTURY 21 AGENCE DU MARCHE	century21agencedumarche	Madame	bronnec estelle	\N	\N	nan	2021-06-14 07:06:10.831387	t
137	\N	PROSPECT	AGENCE DE L'ESTACADE	l'adresse-labarredemonts	Monsieur	pelloquin nicolas	\N	\N	nan	2021-06-14 07:06:19.571699	t
138	\N	PROSPECT	AGENCE DURET	agenceduret	Madame	genaudeau nathalie	\N	\N	nan	2021-06-14 07:06:19.622675	t
139	110710	PROSPECT	CHANOT ROBQUIN MEAUX SAS	agencechanot	Monsieur	robquin thierry	\N	\N	nan	2021-06-14 07:06:21.581719	t
140	\N	PROSPECT	CIL ATLANTIQUE	cilatlantique	Madame	salle céline	\N	\N	nan	2021-06-14 07:06:24.734065	t
141	120110	PROSPECT	SARL R.LELIEVRE	lelievreimmobilier	Madame	lelievre elisabeth	\N	\N	nan	2021-06-14 07:06:49.718662	t
142	\N	PROSPECT	LAFORET - AaZ IMMOBILIER YONNAIS	laforet-aazimmobilieryonnais	Madame	guillou charlotte	\N	\N	nan	2021-06-14 07:06:52.015887	t
143	\N	PROSPECT	AGENCE IMMOBILIERE DU STADE	era	Madame	pecado	\N	\N	nan	2021-06-14 07:06:56.953525	t
144	\N	PROSPECT	nan	casteimmobilier	Monsieur	de cambourg	\N	\N	nan	2021-06-14 07:06:58.193936	t
145	\N	PROSPECT	AGENCE ACHARD IMMOBILIER	agenceachardimmobilier	Madame	poirier lydie	\N	\N	nan	2021-06-14 07:07:11.378613	t
149	\N	PROSPECT	OFFICE NOTARIAL DE FONTENAY LE COMTE	\N	Madame	mathonneau nadine	\N	\N	nan	2021-06-14 07:07:13.384844	t
146	\N	PROSPECT	nan	differenc'immo	Madame	jallais fabienne	\N	\N	nan	2021-06-14 07:07:11.440577	t
147	\N	PROSPECT	AGENCE ALPHA IMMOBILIER	\N	Monsieur	chusseau bernard	\N	\N	nan	2021-06-14 07:07:11.985443	t
148	\N	PROSPECT	LEBEAU CONCEPT IMMO	societebenoitlebeau	Monsieur	lebeau benoit	\N	\N	nan	2021-06-14 07:07:12.015284	t
151	\N	PROSPECT	nan	votreimmo	Monsieur	le plenier stéphane	\N	\N	nan	2021-06-14 07:07:14.619327	t
160	\N	PROSPECT	CABIENT BARRIERE	fideprom	Monsieur	\N	\N	\N	nan	2021-06-14 07:07:27.846512	t
162	\N	PROSPECT	SCP RIOU VETILLARD TOMBECK	\N	Madame	riou nadine	\N	\N	nan	2021-06-14 07:07:27.893486	t
163	\N	PROSPECT	SCP TETU COLLET ORY ROZEL	\N	Monsieur	tetu olivier	\N	\N	nan	2021-06-14 07:07:29.165269	t
164	\N	PROSPECT	SARL RC IMMOBILIER	teamouestimmo	Monsieur	cocoual florian	\N	\N	53522966000019	2021-06-14 07:07:30.531338	t
166	\N	PROSPECT	SARL SOREDIF Agence du Moulin	agenceorpidumoulin	Monsieur	veillet bruno	\N	\N	nan	2021-06-14 07:07:32.391902	t
171	\N	PROSPECT	SAS ELENA	plaza	Monsieur	talec erwan	\N	\N	nan	2021-06-14 07:07:36.079269	t
172	12255	PROSPECT	BLOIS IMMOBILIER	bloisimmo	Madame	carpentier aurélie	\N	\N	nan	2021-06-14 07:07:38.10477	t
173	121020	PROSPECT	SARL LOUDEAC IMMOBILIER	avisimmobilierloudeac	Madame	bertho le dantec brigite	\N	\N	nan	2021-06-14 07:07:44.212893	t
175	\N	PROSPECT	nan	notaire	Monsieur	caroff gwenole	\N	\N	nan	2021-06-14 07:07:50.127832	t
177	\N	PROSPECT	nan	lemarechal	Monsieur	le marechal laurent	\N	\N	nan	2021-06-14 07:07:50.216783	t
179	\N	PROSPECT	IMMOBILIERE DU GRAND PARIS	\N	Monsieur	varnier guillaume	\N	\N	nan	2021-06-14 07:07:51.693887	t
180	\N	PROSPECT	CABINET ACCES IMMO	\N	Monsieur	castel julien	\N	\N	nan	2021-06-14 07:07:51.724577	t
182	123640	PROSPECT	SARL Agence des 4 Sergents	agencedesquatressergents	Monsieur	jeanjean gilles & jeanjean guillaume	\N	\N	nan	2021-06-14 07:07:56.403535	t
183	\N	PROSPECT	AGENCE PIERREVAL	agencepierrval	Madame	margot véronique	\N	\N	nan	2021-06-14 07:07:56.459041	t
185	\N	PROSPECT	IMMOBILIERE DE LA POSTE	l'adresse-limeilbrevannes-immobilieredelaposte	Monsieur	monsonnec cédric	\N	\N	nan	2021-06-14 07:07:58.488786	t
187	\N	PROSPECT	E IMMOBILIERE	l'adressee-immobiliere	Madame	bonan florence	\N	\N	nan	2021-06-14 07:07:58.812124	t
190	\N	PROSPECT	SAS ESPACIL CONSTRUCTION	adbespacil	Monsieur	geniteau aantoine	\N	\N	nan	2021-06-14 07:08:02.683791	t
195	\N	PROSPECT	SARL CABINETOLLIERIC	\N	Monsieur	ollieric rodolphe	\N	\N	nan	2021-06-14 07:08:07.508363	t
196	\N	PROSPECT	SARL UNE ADRESSE	l'adresse-saintnazaire	Monsieur	revranche laurent	\N	\N	nan	2021-06-14 07:08:11.048329	t
198	\N	PROSPECT	CABINET GALVAIN	\N	Monsieur	galvain jean-pierre	\N	\N	nan	2021-06-14 07:08:12.315028	t
203	122170	PROSPECT	SARL STELA	agencepascal	MADAME	salvator laura	\N	\N	48091327600014	2021-06-14 07:08:32.851736	t
150	\N	PROSPECT	OFFICE NOTARIAL	selarlcaractereauthentique	Monsieur	me gautier et mathieu	\N	\N	nan	2021-06-14 07:07:13.40583	t
152	\N	PROSPECT	SARL GUEDON IMMOBILIER	\N	Monsieur	guedon stéphane	\N	\N	nan	2021-06-14 07:07:14.64431	t
153	\N	PROSPECT	SARL NANT'IM VIVRE ICI	\N	Monsieur	hanin christophe	\N	\N	nan	2021-06-14 07:07:14.667321	t
154	122230	PROSPECT	IMMOBILIER KEREBEL	\N	Monsieur	pedel jean-luc	\N	\N	40977820600022	2021-06-14 07:07:14.690667	t
155	\N	PROSPECT	SARL CABINET BROSSEAU MORIN	\N	Madame	brosseau adeline	\N	\N	nan	2021-06-14 07:07:15.947384	t
156	\N	PROSPECT	GESTION SANDRINE SOULAC	\N	Madame	soulac sandrine	\N	\N	nan	2021-06-14 07:07:18.498957	t
157	\N	PROSPECT	SARL PROACTIVE IMMOBILIER 53	\N	Madame	hubert karine	\N	\N	nan	2021-06-14 07:07:24.501599	t
158	\N	PROSPECT	SCP TANGUY CATHOU	\N	Madame	lasceve-cathou fouche eric	\N	\N	nan	2021-06-14 07:07:24.53158	t
159	\N	PROSPECT	CENTURY21 BREST	\N	Madame	couveignes audrey	\N	\N	nan	2021-06-14 07:07:24.548571	t
161	\N	PROSPECT	SARL KERIMO	l'immobilierautrement	Madame	kermarec & nedelec	\N	\N	nan	2021-06-14 07:07:27.8705	t
165	\N	PROSPECT	nan	carnotimmobilier	Madame	duroy nicole	\N	\N	nan	2021-06-14 07:07:30.55096	t
167	\N	PROSPECT	SARL CHAILLOUX IMMOBILIER	\N	Monsieur	chailloux thomas	\N	\N	nan	2021-06-14 07:07:32.438877	t
168	\N	PROSPECT	SARL AGENCE DE L'ODET	\N	Monsieur	bourdais cyril	\N	\N	nan	2021-06-14 07:07:32.471861	t
169	120180	PROSPECT	SARL HECK IMMOBILIER	agenceatithomasseimmobilier	Madame	thomasse valérie	\N	\N	nan	2021-06-14 07:07:36.001316	t
170	\N	PROSPECT	nan	bianimmobilier	Madame	bian patricia	\N	\N	nan	2021-06-14 07:07:36.048292	t
174	\N	PROSPECT	nan	notaire	Madame	jegoux passez sabrina	\N	\N	nan	2021-06-14 07:07:50.096714	t
176	\N	PROSPECT	LA FRANCAISE IMMOBILIERE	lfi	Monsieur	pigeault jean-pierre	\N	\N	nan	2021-06-14 07:07:50.161816	t
178	\N	PROSPECT	RIVAGES IMMOBILIER	orpi	Monsieur	deshayes gilles	\N	\N	nan	2021-06-14 07:07:50.282807	t
181	\N	PROSPECT	SARL VILMORIN IMMOBILIER	l'adresse-palaiseau	Monsieur	clavet denis & binet guillaume	\N	\N	nan	2021-06-14 07:07:55.153727	t
184	\N	PROSPECT	AGENCE ORPI LIBERTE	orpiliberte	nan	ghafoury palatine	\N	\N	nan	2021-06-14 07:07:58.437812	t
186	\N	PROSPECT	IMMOBILIERE DU VILLAGE	l'adresse-creteil	Monsieur	bijaoui eric	\N	\N	nan	2021-06-14 07:07:58.542276	t
188	\N	PROSPECT	ORPI COLBERT IMMOBILIER	\N	Monsieur	aqqade karim & horte nathalie	\N	\N	nan	2021-06-14 07:07:58.844103	t
189	\N	PROSPECT	SASUE LA LICORNE	lalicorneimmobilier	Monsieur	ringuet eric	\N	\N	nan	2021-06-14 07:08:02.598727	t
191	\N	PROSPECT	SAS JLF PROSPECT	\N	Monsieur	fore jonathan	\N	\N	nan	2021-06-14 07:08:03.965316	t
192	\N	PROSPECT	SAS AGENCE IMMOBILIERE DU CENTRE	\N	Madame	al tinawi maryannick	\N	\N	nan	2021-06-14 07:08:05.568002	t
193	\N	PROSPECT	SARL LOGERIS	\N	Monsieur	marie adrien	\N	\N	nan	2021-06-14 07:08:05.899161	t
194	\N	PROSPECT	SARL VILLE PLAGE	eraimmobilier	Monsieur	letourmy gilles	\N	\N	nan	2021-06-14 07:08:07.396426	t
197	122165	PROSPECT	CABINET FRUCHET	\N	Monsieur	fruchet benjamin	\N	\N	nan	2021-06-14 07:08:12.20709	t
199	\N	PROSPECT	CABINET OLIIER	\N	Monsieur	olivier arnaud	\N	\N	nan	2021-06-14 07:08:16.564969	t
200	\N	PROSPECT	SCP NOTAIRES ASSOCIES	\N	Messieurs	mery xavier & perez arnaud	\N	\N	nan	2021-06-14 07:08:25.720923	t
201	\N	PROSPECT	DELON IMMOBILIER REAL ESTATE COMPANY	\N	Monsieur	delon nicolas	\N	\N	nan	2021-06-14 07:08:26.983715	t
202	\N	PROSPECT	LECUYER IMMOBILIER	lecuyerimmobilier	Monsieur	lecuyer emmanuel	\N	\N	nan	2021-06-14 07:08:32.811715	t
204	\N	PROSPECT	SARL LOUMAE	l'adresse-carquefou	Monsieur	genest christophe	\N	\N	538305830	2021-06-14 07:08:34.207862	t
205	\N	PROSPECT	CABINET CHATEAUBRIAND IMMOBILIER	\N	Madame	brossault elodie	\N	\N	44457670600030	2021-06-14 07:08:34.260831	t
206	\N	PROSPECT	Cabinet notarial	\N	Monsieur	lalande alexandre	\N	\N	nan	2021-06-14 07:08:38.311755	t
207	\N	PROSPECT	nan	metropolitanimmobilierbrest	Monsieur	mevel eric	\N	\N	nan	2021-06-14 07:08:39.781801	t
208	\N	PROSPECT	nan	metropolitanimmobilier	Monsieur	postec jean-yves	\N	\N	nan	2021-06-14 07:08:44.683657	t
209	\N	PROSPECT	ETUDE MAITRE PRIGENT MATTHIEU	\N	Monsieur	prigent matthieu	\N	\N	nan	2021-06-14 07:08:44.748138	t
210	\N	PROSPECT	ABC IMMOBILIER	agencebrestcornouaille(abc)immobilier	Monsieur	guermeur paul	\N	\N	49460758300015	2021-06-14 07:08:50.826637	t
211	\N	PROSPECT	SARL NERIUS	l'adresse-iledenantes	Monsieur	pottier michaël	\N	\N	nan	2021-06-14 07:08:50.854623	t
212	\N	PROSPECT	nan	orpicornouaille	Monsieur	veillon nicolas	\N	\N	822401733	2021-06-14 07:08:56.900694	t
213	\N	PROSPECT	nan	officenotarial	Madame	bernaert grohard laétitia	\N	\N	83492095100011	2021-06-14 07:08:58.86636	t
214	\N	PROSPECT	SARL LNA	lanouvelleagence	MADAME	laurent christine	\N	\N	82050356300018	2021-06-14 07:09:00.928006	t
215	\N	PROSPECT	SARL GO NORDOUEST IMMO	arthurimmo	Monsieur	marmagne florent	\N	\N	503587867	2021-06-14 07:09:09.324085	t
216	\N	PROSPECT	BENOIT IMMOBILIER	\N	Madame	leray christine	\N	\N	505076984	2021-06-14 07:09:09.358065	t
217	\N	PROSPECT	SARL AGENCE IMMOBILIERE NUEVA	\N	Madame	poiraud peggy	\N	\N	495080384	2021-06-14 07:09:09.511814	t
218	\N	PROSPECT	nan	cabinetkerjeanlannilis	Madame	?? fabienne	\N	\N	nan	2021-06-14 07:09:09.536797	t
219	\N	PROSPECT	SARL CYGLA	cabinethabasqueimmobilierlandernaeau	Madame	corre christine	\N	\N	nan	2021-06-14 07:09:09.568779	t
220	\N	PROSPECT	SARL FRANK BEULE IMMOBIMIER	agencel'entreprise	Monsieur	bridoux jocelin	\N	\N	48406460500039	2021-06-14 07:09:09.609759	t
221	\N	PROSPECT	SARL GIRATI	agenceeratouraineimmobilier	Monsieur	girati vincent	\N	\N	494576473	2021-06-14 07:09:09.638738	t
222	\N	PROSPECT	SARL FABIENNE THIERRY IMMOBILIER	agencefabiennethierryimmobilier	Madame	meder mathilde	\N	\N	51371960900010	2021-06-14 07:09:13.166681	t
223	\N	PROSPECT	SARL GA 1 NY	agencenestenn	Madame	deschaseaux marie-annick	\N	\N	818339459	2021-06-14 07:09:13.230169	t
224	\N	PROSPECT	ADJ GESTION	l'adresse-adjgestion-joinvillelepont	MONSIEUR	pastor syvain	\N	\N	60203245000010	2021-06-14 07:09:20.720969	t
225	\N	PROSPECT	GTI AURELIEN RIMBAUD	l'adresse-rochefort	MONSIEUR	rimbaud aurelien	\N	\N	80784180400014	2021-06-14 07:09:20.76294	t
226	\N	PROSPECT	SAS BARRAINE PROMOTION	agencebarrainepromotion	Monsieur	rimbert steve	\N	\N	503520058	2021-06-14 07:09:22.022712	t
227	\N	PROSPECT	SARL BV ABRAYSIE CONSEIL	century21	Monsieur	vinauger bertrand	\N	\N	439925520	2021-06-14 07:09:22.07275	t
228	\N	PROSPECT	SARL NUANCES HABITAT	\N	Monsieur	bothorel dominique	\N	\N	50427476200013	2021-06-14 07:09:24.280121	t
229	\N	PROSPECT	SARL LVI IMMOBILIER	eralvi	Monsieur	legroux yoann	\N	\N	450731252	2021-06-14 07:09:24.365074	t
230	\N	PROSPECT	SARL BLEU HORIZON CABINET IMMOBILEIR	cabinetimmobilierbleuhorizon	Monsieur	gaulard michel	\N	\N	502367204	2021-06-14 07:09:26.943787	t
234	\N	PROSPECT	SA NOTAIRE SERVICE	\N	Maître	mathieu & bethouart	\N	\N	67672021200015	2021-06-14 07:09:54.847561	t
231	\N	PROSPECT	SASU AGENCE IMM	agenceimm	Madame	combe coralie	\N	\N	51464808800045	2021-06-14 07:09:37.653964	t
232	\N	PROSPECT	OFFICE NOTARIAL	\N	Maitre	nicolas	\N	\N	nan	2021-06-14 07:09:43.84587	t
233	\N	PROSPECT	AGENCE CADEAU	agencecadeau	Monsieur	garcia nicolas	\N	\N	nan	2021-06-14 07:09:43.881849	t
238	\N	PROSPECT	SARL MB IMMOBILIER	\N	Monsieur	blot pierre-yves	\N	\N	39835439900014	2021-06-14 07:09:55.968764	t
239	\N	PROSPECT	SARL GSM IMMOBILIER	gsmimmobilier	Monsieur	godeau sébastien	\N	\N	47939188000040	2021-06-14 07:09:58.096127	t
241	\N	PROSPECT	SARL MONTREUIL BELLAY IMMOBILIER	agencebrun	Monsieur & Madame	bemelmans frédéric & delphine	\N	\N	45104395400028	2021-06-14 07:10:01.432367	t
246	\N	PROSPECT	SARL AMBROISE IMMO	ambroiseimmoguyhoquet	Monsieur	ambroise jouslin de pisseloup de noray	\N	\N	49455750700014	2021-06-14 07:10:17.828032	t
247	\N	PROSPECT	SARL LIGERIA IMMOBILIER	ligeriaimmobilier	Madame	hazlewood samantha	\N	\N	48389307900028	2021-06-14 07:10:23.282388	t
250	\N	PROSPECT	SAS A21	sasa21	Messieurs	taudiere christian et virgile	\N	\N	94240142400017	2021-06-14 07:10:27.718686	t
252	\N	PROSPECT	SELARL NOTAIRES ASSOCIES	notairesassociesdupont&migot	Maître	dupont nicolas & migot antoine	\N	\N	79109214100013	2021-06-14 07:10:27.827621	t
253	\N	PROSPECT	SARL BOURNEIX MENUET IMMOBILIER	l'adresseimmobilierchallans	Monsieur	menuet julien	\N	\N	52338507800010	2021-06-14 07:10:33.009963	t
235	\N	PROSPECT	OFFICE NOTARIAL DELOMEAU THOMAS HOUISGIRARD	\N	Madame	you christelle	\N	\N	30127528500015	2021-06-14 07:09:54.864551	t
236	\N	PROSPECT	OFFICE NOTARIAL GROUPE MONASSIER CHOLET	\N	Maître	delorme bernard	\N	\N	35187702200035	2021-06-14 07:09:54.884782	t
237	\N	PROSPECT	CREDIT AGRICOLE	creditagricoleimmobilier	nan	appel d'offre national	\N	\N	nan	2021-06-14 07:09:54.907773	t
240	123900	PROSPECT	ALAIN ROUSSEAU IMMOBILIERE COMINE	alainrousseauimmobilierecomine	Monsieur	rousseau guillaume	\N	\N	414 709 980 00018	2021-06-14 07:09:59.362139	t
242	\N	PROSPECT	SARL HERMELIN	\N	Monsieur	hermelin blanchet nicolas	\N	\N	31428173400025	2021-06-14 07:10:06.221326	t
243	\N	PROSPECT	SARL G1H	\N	Monsieur	dresh gilles	\N	\N	44795758000015	2021-06-14 07:10:06.261333	t
244	\N	PROSPECT	SARL MOBIXEL	\N	Monsieur	bourreau jean-christophe	\N	\N	35336010000047	2021-06-14 07:10:08.032605	t
245	\N	PROSPECT	MONSIEUR TONY BARON	agfenceimmodream	Monsieur	baron tony	\N	\N	47826100100059	2021-06-14 07:10:08.088578	t
248	\N	PROSPECT	SARL UNIPERSONNELLE ROSA	agencecentury21rosa	Monsieur	negre romain	\N	\N	82499399200018	2021-06-14 07:10:23.327361	t
249	\N	PROSPECT	MB IMMOBILIER	mbimmobilier	Madame	mottin alexandra	\N	\N	49880354100018	2021-06-14 07:10:24.823339	t
251	\N	PROSPECT	MAINE ET LOIRE HABITAT	maineetloirehabitat	Messieurs	colobert laurent & ratier benoit	\N	\N	27490003400019	2021-06-14 07:10:27.776652	t
254	\N	PROSPECT	SARL JICEBE	brigittesauvagerimmobilier	Madame	sauvager	\N	\N	34801270900021	2021-06-14 07:10:34.571759	t
255	\N	PROSPECT	SAS BED AND SCHOOL 2G2L	bedandschool	Société	holding  mme zimnoch aurelie	\N	\N	50502435600063	2021-06-14 07:10:37.529614	t
256	124180	PROSPECT	FICHIER HABITAT	immobilieredes3rives	Monsieur	jean louis pecheux	\N	\N	84172176400014	2021-06-14 07:10:37.594582	t
257	\N	PROSPECT	SARL CHEZLANOU IMMOBILIER	elyseavenue	Monsieur	bismuth denis	\N	\N	49350360100012	2021-06-14 07:10:46.361866	t
258	124220	PROSPECT	MME FLEURY	mmefleury	Société	sci kroaz du	\N	\N	833 608 938 00019	2021-06-14 07:10:48.903136	t
259	124230	PROSPECT	KAMET VENTURES	kamet	Monsieur	recoing julien	\N	\N	nan	2021-06-14 07:10:48.943117	t
260	124250	PROSPECT	LEGRAND FRANCIS	particulier	Monsieur	legrand francis	\N	\N	nan	2021-06-14 07:10:48.984095	t
261	\N	PROSPECT	SARL CLERIMMO	erarivedroite	Monsieur	boudaud laurent	\N	\N	752736223	2021-06-14 07:10:58.889778	t
262	\N	PROSPECT	EURL GONORD IMMOBILIER	gonordimmobilier	Madame	gonord jacqueline	\N	\N	51387211900013	2021-06-14 07:11:08.49781	t
263	1270218	PROSPECT	CABINET DIARD	cabientdiard	Monsieur	gaudiche jean jacques	\N	\N	379 086 085 00014	2021-06-14 07:12:19.326182	t
\.


--
-- Data for Name: prospect_History; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."prospect_History" (id, prospect, adresse, cp, ville, pays, etat_client, date, visibility) FROM stdin;
1	1	29 Bld Victor Hugo	84500	BOLLENE	\N	true	2021-06-14 07:02:26.228406	t
2	2	59 Bd Massena	75013	PARIS	\N	true	2021-06-14 07:02:26.977307	t
3	3	7 rue Gabetta	77170	BRIE COMTE ROBERT	\N	true	2021-06-14 07:02:27.000293	t
4	4	9 Place d'Italie	75013	PARIS	\N	true	2021-06-14 07:02:27.028279	t
5	5	61 Boulevard des Batignoles	75008	PARIS	\N	true	2021-06-14 07:02:27.048266	t
6	6	61 Boulevard des Batignoles	75008	PARIS	\N	true	2021-06-14 07:02:27.069256	t
7	7	44 avenue du Général Leclerc	94700	MAISONS ALFORT	\N	true	2021-06-14 07:02:27.094239	t
8	8	15 avenue du Général de Gaulle	94700	MAISONS ALFORT	\N	true	2021-06-14 07:02:27.121227	t
9	9	222 rue Paul Vaillant Couturier	92000	NANTERRE	\N	true	2021-06-14 07:02:27.911293	t
10	10	5 rue de Verdun	92150	SURESNES	\N	true	2021-06-14 07:02:27.936279	t
11	11	1Place Henri IV	92150	SURESNE	\N	true	2021-06-14 07:02:27.963263	t
12	12	82 rue Blanche	75009	PARIS	\N	true	2021-06-14 07:02:28.847955	t
13	13	4 avenue de Bel Air	75012	PARIS	\N	true	2021-06-14 07:02:29.627954	t
14	14	90 Cours de Vincennes	75012	PARIS	\N	true	2021-06-14 07:02:29.645943	t
15	15	nan	nan	nan	\N	true	2021-06-14 07:02:31.113039	t
16	16	nan	nan	nan	\N	true	2021-06-14 07:02:31.139027	t
17	17	nan	nan	nan	\N	true	2021-06-14 07:02:31.174006	t
18	18	nan	nan	nan	\N	true	2021-06-14 07:02:31.233379	t
19	19	55 Av Edouard Vaillant	92100	BOULOGNE BILLANCOURT	\N	true	2021-06-14 07:02:31.279351	t
20	20	106 route de la Reine	92100	BOULOGNE BILLANCOURT	\N	true	2021-06-14 07:02:31.306337	t
21	21	71 route de la Reine	92100	BOULOGNE BILLANCOURT	\N	true	2021-06-14 07:02:32.244392	t
22	22	16 rue de Satory	78000	VERSAILLES	\N	true	2021-06-14 07:02:32.26838	t
23	23	19 rue de l'Orangerie	78000	VERSAILLES	\N	true	2021-06-14 07:02:32.290896	t
24	24	14 rue de Satory	78000	VERSAILLES	\N	true	2021-06-14 07:02:32.314873	t
25	25	209 Bd Jean-Jaurès	92100	BOULOGNE BILLANCOURT	\N	true	2021-06-14 07:02:32.370839	t
26	26	223 Bd Jean-Jaurès	92100	BOULOGNE BILLANCOURT	\N	true	2021-06-14 07:02:32.396824	t
27	27	225 Bd Jean-Jaurès	92100	BOULOGNE BILLANCOURT	\N	true	2021-06-14 07:02:32.421812	t
28	28	55  av. Pierre Grenier	92100	BOULOGNE BILLANCOURT	\N	true	2021-06-14 07:02:32.437799	t
29	29	91 av. Pierre Grenier	92100	BOULOGNE BILLANCOURT	\N	true	2021-06-14 07:02:32.454791	t
30	30	67 rue Caulincourt	75018	PARIS	\N	true	2021-06-14 07:02:32.473781	t
31	31	35 avenue du Général Leclerc	92300	BOURG LA REINE	\N	true	2021-06-14 07:02:33.446386	t
32	32	70 Bd Maréchal Joffre	92300	BOURG LA REINE	\N	true	2021-06-14 07:02:33.46138	t
33	33	9 rue Pourtoules	84100	ORANGE	\N	true	2021-06-14 07:02:34.595097	t
34	34	1 route de Champigné	49330	CHATEAUNEUF SUR SARTHE	\N	true	2021-06-14 07:02:35.572406	t
35	35	34 Cours Aristide Briand	84100	ORANGE	\N	true	2021-06-14 07:02:35.596392	t
36	36	9 rue Thomas Edison	92230	GENNEVILLIERS	\N	true	2021-06-14 07:02:36.503629	t
37	37	52 rue d'Achères	78600	MAISONS LAFFITTE	\N	true	2021-06-14 07:02:36.527613	t
38	38	37 rue Jean-Pierre Timbaud	92130	ISSY LES MOULINEAUX	\N	true	2021-06-14 07:02:36.565112	t
39	39	40 rue Jean-Pierre Timbaud	92130	ISSY LES MOULINEAUX	\N	true	2021-06-14 07:02:36.598091	t
40	40	38 rue Jean-Pierre Timbaud	92130	ISSY LES MOULINEAUX	\N	true	2021-06-14 07:02:36.630594	t
41	41	60 Place du Marché	78530	BUC	\N	true	2021-06-14 07:02:37.972267	t
42	42	60 Place du Marché	78530	BUC	\N	true	2021-06-14 07:02:38.043227	t
43	43	93 rue Boucicaut	92260	FONTENAY AUX ROSES	\N	true	2021-06-14 07:02:38.084265	t
44	44	47 rue Boucicaut	92260	FONTENAY AUX ROSES	\N	true	2021-06-14 07:02:38.137232	t
45	45	50 rue Boucicaut	92260	FONTENAY AUX ROSES	\N	true	2021-06-14 07:02:38.296204	t
46	46	67 rue Jean Longuet	92290	CHATENAY MALABRY	\N	true	2021-06-14 07:02:38.334219	t
47	47	13 bis Place de L'Eglise	92290	CHATENAY MALABRY	\N	true	2021-06-14 07:02:38.365279	t
48	48	30 rue de Normandie	92600	ASNIERES SUR SEINE	\N	true	2021-06-14 07:02:39.20041	t
49	49	1 rue Bapst	92600	ASNIERES SUR SEINE	\N	true	2021-06-14 07:02:39.224397	t
50	50	3 Avenue Aristide Briand	92249	L'HAY LES ROSES	\N	true	2021-06-14 07:02:39.246393	t
51	51	106 rue de Général Leclerc	95130	FRANCONVILLE	\N	true	2021-06-14 07:02:45.473463	t
52	52	78 Chemin des Sept Deniers	31204	TOULOUSE	\N	true	2021-06-14 07:02:46.590412	t
53	53	82 rue de Moulineau	33170	GRADIGNAN	\N	true	2021-06-14 07:02:47.544583	t
54	54	511 Route de Toulouse	33140	VILLENAVE D'ORNON	\N	true	2021-06-14 07:02:47.583565	t
55	55	8 Mail des Cerclades	95000	CERGY	\N	true	2021-06-14 07:02:49.638546	t
56	56	27 rue du Général de Gaulle	95220	HERBLAY	\N	true	2021-06-14 07:02:49.656534	t
57	57	125 avenue Egéne Varlin	77270	VILLEPARISIS	\N	true	2021-06-14 07:02:49.685516	t
58	58	9 Place du Marché	77270	VILLEPARISIS	\N	true	2021-06-14 07:02:49.709503	t
59	59	1Place Pasteur	77120	COULOMMIERS	\N	true	2021-06-14 07:02:49.731489	t
60	60	5 Court Victor Hugo	33130	BEGLE	\N	true	2021-06-14 07:02:50.875453	t
61	61	32 Cours Victor Hugo	33130	BEGLES	\N	true	2021-06-14 07:02:54.98288	t
62	62	479 Route de Toulouse	33140	VILLENAVE D'ORNON	\N	true	2021-06-14 07:02:55.00852	t
63	63	20 avenue de la Division Leclerc	92160	ANTONY	\N	true	2021-06-14 07:02:55.023511	t
64	64	23 avenue Aristide Briand	92160	ANTONY	\N	true	2021-06-14 07:02:56.204002	t
65	65	11bis avenue Division Leclerc	92160	ANTONY	\N	true	2021-06-14 07:02:56.235988	t
66	66	23/25 avenue de la République	77340	PONTAULT COMBAULT	\N	true	2021-06-14 07:02:57.628888	t
67	67	127 avenue René Cassagne	33151	CENON	\N	true	2021-06-14 07:03:00.114688	t
68	68	19 Bd Robert Thiboust	77700	SERRIS	\N	true	2021-06-14 07:03:01.371438	t
69	69	9 bis avenue de la République	77340	PONTAULT COMBAULT	\N	true	2021-06-14 07:03:06.150655	t
70	70	9 Place de la Victoire	33000	BORDEAUX	\N	true	2021-06-14 07:03:09.288762	t
71	71	36 rue Jules Gesde	63100	CLERMONT FERRAND	\N	true	2021-06-14 07:03:13.250567	t
72	72	28 Cours Gambetta	33850	LEOGNAN	\N	true	2021-06-14 07:03:13.520835	t
73	73	95 rue Notre Dame	33000	BORDEAUX	\N	true	2021-06-14 07:03:13.83066	t
74	74	30 Cours Portal	33000	BORDEAUX	\N	true	2021-06-14 07:03:17.555455	t
75	75	60 Cours de la Somme	33800	BORDEAUX	\N	true	2021-06-14 07:03:17.621416	t
76	76	221 rue Georges Bonnac	33000	BORDEAUX	\N	true	2021-06-14 07:03:22.477451	t
77	77	34 avenue Pasteur	33600	PESSAC	\N	true	2021-06-14 07:03:24.061328	t
78	78	76 Cours Gambetta	33400	TALENCE	\N	true	2021-06-14 07:03:24.115458	t
83	83	53 rue Fondaudege	33000	BORDEAUX	\N	true	2021-06-14 07:03:28.075041	t
84	84	24 rue de Montreuil	78000	VERSAILLES	\N	true	2021-06-14 07:03:28.105024	t
79	79	38 rue Huguerie	33000	BORDEAUX	\N	true	2021-06-14 07:03:25.210333	t
80	80	26 rue Fondaudege	33000	BORDEAUX	\N	true	2021-06-14 07:03:25.244831	t
81	81	36 rue Fondaudege	33000	BORDEAUX	\N	true	2021-06-14 07:03:25.360767	t
82	82	31 Allées de Tourny	33000	BORDEAUX	\N	true	2021-06-14 07:03:26.89595	t
85	85	19 Cours de L'Intendance	33064	BORDEAUX	\N	true	2021-06-14 07:03:29.243182	t
86	86	26 avenue du Gal Leclerc	92100	BOULOGNE BILLANCOURT	\N	true	2021-06-14 07:03:29.272158	t
87	87	46-48 avenue du Gal Leclerc	92100	BOULOGNE BILLANCOURT	\N	true	2021-06-14 07:03:29.324128	t
88	88	54-56 avenue du Gal Leclerc	92100	BOULOGNE BILLANCOURT	\N	true	2021-06-14 07:03:29.34212	t
89	89	55 rue de la Saussière	92100	BOULOGNE BILLANCOURT	\N	true	2021-06-14 07:03:29.364105	t
90	90	5 avenue Gal Leclerc	92100	BOULOGNE BILLANCOURT	\N	true	2021-06-14 07:03:29.391091	t
91	91	209 Bd Jean-Jaurès	92100	BOULOGNE BILLANCOURT	\N	true	2021-06-14 07:03:29.408081	t
92	92	46 Bd Jean-Jaurès	92100	BOULOGNE BILLANCOURT	\N	true	2021-06-14 07:03:29.42807	t
93	93	112 rue de Paris	92100	BOULOGNE BILLANCOURT	\N	true	2021-06-14 07:03:29.460578	t
94	94	75 77 Allée Jean Giono	33100	BORDEAUX	\N	true	2021-06-14 07:03:29.48556	t
95	95	120 avenue Charles de Gaule	92200	NEUILLY SUR SEINE	\N	true	2021-06-14 07:03:35.882356	t
96	96	20 avenue d'Orléans	18000	BOURGES	\N	true	2021-06-14 07:03:40.201422	t
97	97	70 avenue Charles de Gaulle	17620	SAINT AGANT	\N	true	2021-06-14 07:03:40.231406	t
98	98	9 Place du Ponant	17260	ECHILLAIS	\N	true	2021-06-14 07:03:42.689632	t
99	99	5 Quai de la République	17100	SAINTES	\N	true	2021-06-14 07:03:42.705624	t
100	100	41 rue de la Scierie	17031	LA ROCHELLE CEDEX	\N	true	2021-06-14 07:03:44.049206	t
101	101	47 rue Gambetta	17412	SAITN JEAN ANGELY	\N	true	2021-06-14 07:03:48.756241	t
102	102	60 rue des Forges	44330	VALLET	\N	true	2021-06-14 07:03:48.77323	t
103	103	28 ure Raymond Poincaré	85000	LA ROCHE SUR YON	\N	true	2021-06-14 07:03:48.788222	t
104	104	4 rue Neuve des Remparts	16100	COGNAC	\N	true	2021-06-14 07:03:48.815206	t
105	105	1 avenue de la Plage	85470	BRETIGNOLLES SUR MER	\N	true	2021-06-14 07:03:50.725586	t
106	106	26 boulevard du Nord	85470	BRETIGNOLLES SUR MER	\N	true	2021-06-14 07:03:50.74757	t
107	107	66 avenue d'Orouët	85160	SAINT JEAN DE MONTS	\N	true	2021-06-14 07:03:51.704771	t
108	108	11 rue du Général de Gaulle	44560	PAIMBOEUF	\N	true	2021-06-14 07:03:58.212311	t
109	109	274 route de Clisson	44120	VERTOU	\N	true	2021-06-14 07:03:58.235296	t
110	110	38 rue Gargoulleau	17000	LA ROCHELLE	\N	true	2021-06-14 07:03:59.52045	t
111	111	144 Boulevard de Doulon	44300	NANTES	\N	true	2021-06-14 07:04:01.820818	t
112	112	8 Allée des Embruns	44250	SAINT BREVIN	\N	true	2021-06-14 07:04:01.874312	t
113	113	68 avenue La Fayette	17300	ROCHEFORT SUR MER	\N	true	2021-06-14 07:04:43.854574	t
114	114	27 rue du Maréchal Joffre	85000	LA ROCHE SUR YON	\N	true	2021-06-14 07:04:52.53667	t
115	115	2 rue Aristide Briand	85360	LA TRANCHE SUR MER	\N	true	2021-06-14 07:04:56.75829	t
116	116	1 Place de la Liberté	85520	JARD SUR MER	\N	true	2021-06-14 07:04:56.782279	t
117	117	3 Quai de la République	17100	SAINTES	\N	true	2021-06-14 07:04:56.804264	t
118	118	38 rue du 8 Mai 1945	33290	LUDON	\N	true	2021-06-14 07:04:58.506662	t
119	119	69 avenue Gambetta	17104	SAINTES	\N	true	2021-06-14 07:05:00.26814	t
120	120	Place Mondesir	33200	BORDEAUX CAUDERAN	\N	true	2021-06-14 07:05:01.957694	t
121	121	18 Avenue Guy Celerier	33138	TAUSSAT LANTON	\N	true	2021-06-14 07:05:02.007665	t
122	122	1 Avenue de la Libération	33700	MERIGNAC	\N	true	2021-06-14 07:05:02.41164	t
123	123	31 Avenue de la Libération	33110	LE BOUCAT	\N	true	2021-06-14 07:05:03.51413	t
124	124	5 avenue André Maginot	37100	TOURS	\N	true	2021-06-14 07:05:06.566837	t
125	125	17 bis rue Georges Clémenceau	85007	LA ROCHE SUR YON	\N	true	2021-06-14 07:05:22.542632	t
126	126	30 Promenade Amiral Lafargue	85105	LES SABLES D'OLONNE CEDEX	\N	true	2021-06-14 07:05:29.045656	t
127	127	46 bis rue de l'Océan	85560	LONGEVILLE SUR MER	\N	true	2021-06-14 07:05:30.019699	t
128	128	CC des Pyramides	85270	SAINT HILAIRE DE RIEZ	\N	true	2021-06-14 07:05:32.660321	t
129	129	13 Bd Guist'hau	44000	NANTES	\N	true	2021-06-14 07:05:33.634414	t
130	130	5 rue de Nantes	85600	SAINT HILAIRE DE LOULAY	\N	true	2021-06-14 07:05:43.302652	t
131	131	45 Promenade Clémenceau	85105	LES SABLES D'OLONNE CEDEX	\N	true	2021-06-14 07:05:43.321639	t
132	132	92 rue Gambetta	17200	ROYAN	\N	true	2021-06-14 07:05:45.320746	t
133	133	7 avenue Pasteur	17640	VAUX SUR MER	\N	true	2021-06-14 07:05:45.376711	t
134	134	1 avenue Jacques Cartier	77600	BUSSY SAINT GEORGES	\N	true	2021-06-14 07:05:51.945021	t
135	135	40 rue Saint Yon	17000	LA ROCHELLE	\N	true	2021-06-14 07:06:10.867367	t
136	136	4 Quai Duperre	17000	LA ROCHELLE	\N	true	2021-06-14 07:06:10.975937	t
137	137	51 avenus de L'Estacade	85550	LA BARRE DE MONTS	\N	true	2021-06-14 07:06:19.597682	t
138	138	152 Boulevard Aristide Briand	85000	LA ROCHE SUR YON	\N	true	2021-06-14 07:06:19.66165	t
139	139	31 Boulevard Jean Rose	77100	MEAUX	\N	true	2021-06-14 07:06:21.685646	t
140	140	13 rue du Maréchal Joffre	85000	LA ROCHE SUR YON	\N	true	2021-06-14 07:06:24.796551	t
141	141	15 rue du Pont aux Foulons	35000	RENNES	\N	true	2021-06-14 07:06:49.791808	t
142	142	105 rue de Maréchal Joffre	85000	LA ROCHE SUR YON	\N	true	2021-06-14 07:06:52.057859	t
143	143	17 RUE PROUDHON	93210	SAINT DENIS	\N	true	2021-06-14 07:06:57.555408	t
144	144	1 PLACE DE LA MOTTE	44110	CHATEAUBRIANT	\N	true	2021-06-14 07:06:58.796573	t
145	145	42 rue Georges Clémenceau	85150	LA MOTHE ACAHRD	\N	true	2021-06-14 07:07:11.423587	t
146	146	37 RUE DE AL PAIX	44390	NORT SU ERDRE	\N	true	2021-06-14 07:07:11.977844	t
147	147	5 rue du Chateau	85440	TALMONT SAINT HILAIRE	\N	true	2021-06-14 07:07:12.000887	t
148	148	8 rue de la Foret	35300	FOUGERES	\N	true	2021-06-14 07:07:12.053151	t
149	149	3 rue du Général Malet	85202	FONTENAY LE COMTE	\N	true	2021-06-14 07:07:13.396836	t
150	150	22 rue Pierre Martinet	53204	CHATEAU GONTIER	\N	true	2021-06-14 07:07:13.435816	t
151	151	11 rue Louis Nicole	29470	PLOUGASTEL DAOULAS	\N	true	2021-06-14 07:07:14.636322	t
152	152	74 avenue Robert Buron	53009	LAVAL Cedex	\N	true	2021-06-14 07:07:14.657324	t
153	153	1 rue des Salorges	44100	NANTES	\N	true	2021-06-14 07:07:14.680673	t
154	154	3 rue de la Mairie	29470	PLOUGASTEL DAOULAS	\N	true	2021-06-14 07:07:14.711661	t
161	161	11 Place de la Libération	29480	LE RELECQ KERHUON	\N	true	2021-06-14 07:07:27.884493	t
162	162	1- rue de l'AncienEvêché	53000	LAVAL	\N	true	2021-06-14 07:07:27.908477	t
163	163	89 avenue Robert Buron	53009	LAVAL Cedex	\N	true	2021-06-14 07:07:29.197763	t
165	165	8 bis Place Carnot	35300	FOUGERES	\N	true	2021-06-14 07:07:30.566949	t
155	155	2 rue Paré	44010	NANTES	\N	true	2021-06-14 07:07:15.976536	t
156	156	33 Boulevard Soférino	35000	RENNES	\N	true	2021-06-14 07:07:18.540607	t
157	157	36 rue de Paris	53000	LAVAL	\N	true	2021-06-14 07:07:24.518588	t
158	158	6 COurs Raphaël Binet	35043	RENNES Cedex	\N	true	2021-06-14 07:07:24.540576	t
159	159	40 rue de L'aiguillon	29200	BREST	\N	true	2021-06-14 07:07:24.572995	t
160	160	33 AVENUE DE SAINT CLOUD	78000	VERSAILLES	\N	true	2021-06-14 07:07:27.863506	t
164	164	22 reu du Chapeau Rouge	29000	QUIMPER	\N	true	2021-06-14 07:07:30.546962	t
166	166	1 rue Florence Arthaud	17137	NIEUL SUR MER	\N	true	2021-06-14 07:07:32.420886	t
167	167	30 rue de l'Odet	29170	FOUESNANT	\N	true	2021-06-14 07:07:32.45087	t
168	168	20 Moulin du Pont	29170	PLEUVEN	\N	true	2021-06-14 07:07:32.483851	t
169	169	66 Avenus du Général Leclerc	72000	LE MANS	\N	true	2021-06-14 07:07:36.036295	t
170	170	200 rue de la Petite Palud	29800	LANDERNEAU	\N	true	2021-06-14 07:07:36.072272	t
171	171	4 Quai de l'Odet	29000	QUIMPER	\N	true	2021-06-14 07:07:36.117248	t
172	172	3 avenue du Président Wilson	41000	BLOIS	\N	true	2021-06-14 07:07:38.139745	t
173	173	12 Place de l'Eglise	22600	LOUDEAC	\N	true	2021-06-14 07:07:44.270861	t
174	174	1 Allée de Brntal	22605	LOUDEAC	\N	true	2021-06-14 07:07:50.119837	t
175	175	2 rue de Douves	35601	REDON Cedex	\N	true	2021-06-14 07:07:50.153821	t
176	176	28 Boulevard de la Liberté	35000	RENNES	\N	true	2021-06-14 07:07:50.208786	t
177	177	11 rue de Paris	91120	PALAISEAU	\N	true	2021-06-14 07:07:50.278808	t
178	178	2 Boulevard du Commandant Charcot	17440	AYTRE	\N	true	2021-06-14 07:07:50.341287	t
179	179	23 avenue Paul Vaillant Coututrier	94400	VITRY SUR SEINE	\N	true	2021-06-14 07:07:51.709878	t
180	180	7 rue de la Porte	29000	BREST	\N	true	2021-06-14 07:07:51.736571	t
181	181	280 rue de Paris	91120	PALAISEAU	\N	true	2021-06-14 07:07:55.198704	t
182	182	2 rue Verdière	17000	LA ROCHELLE	\N	true	2021-06-14 07:07:56.447509	t
183	183	10 rue Colbert	29200	BREST	\N	true	2021-06-14 07:07:56.53098	t
184	184	26 Quai Duguay Trouin	35000	RENNES	\N	true	2021-06-14 07:07:58.481785	t
185	185	13 rue Roger Salengro	94450	LIMEIL BREVANNES	\N	true	2021-06-14 07:07:58.516291	t
186	186	33 rue du Général Leclerc	94000	CRETEIL	\N	true	2021-06-14 07:07:58.806133	t
187	187	366 Ter rue de Vaugirard	75015	PARIS	\N	true	2021-06-14 07:07:58.840106	t
188	188	37 rue Audry Puyravault	17300	ROCHEFORT	\N	true	2021-06-14 07:07:58.874087	t
189	189	1 rue Duguesclin	53100	MAYENNE	\N	true	2021-06-14 07:08:02.650752	t
190	190	1 rue du Scorff	35700	RENNES	\N	true	2021-06-14 07:08:02.742366	t
191	191	19 rue de Chartres	94410	DOURDAN	\N	true	2021-06-14 07:08:04.018286	t
192	192	10 Place Leperdit	56300	PONTIVY	\N	true	2021-06-14 07:08:05.72574	t
193	193	26 avenue de la Libération	91130	RIS ORANGIS	\N	true	2021-06-14 07:08:06.178523	t
194	194	77 bis avenue de la République	44600	SAINT NAZAIRE	\N	true	2021-06-14 07:08:07.483378	t
195	195	15 rue Monselet	44000	NANTES	\N	true	2021-06-14 07:08:07.541347	t
196	196	99 bis avenue de la République	44600	SAINT NAZAIRE	\N	true	2021-06-14 07:08:11.097816	t
197	197	7 rue Nationale	85110	CHANTONNAY	\N	true	2021-06-14 07:08:12.249072	t
198	198	20 rue Amiral Linois	29000	BREST	\N	true	2021-06-14 07:08:12.328019	t
199	199	71  rue Jean Jaurès	44600	SAINT NAZAIRE	\N	true	2021-06-14 07:08:16.576961	t
200	200	30 Route de Vannes	44160	PONCHATEAU	\N	true	2021-06-14 07:08:25.731914	t
201	201	92 rue des Entrepreneurs	75015	PARIS	\N	true	2021-06-14 07:08:27.007703	t
202	202	16 rue Aristide Brillant	44400	REZE	\N	true	2021-06-14 07:08:32.837744	t
203	203	6 RUE DU MARECHAL FOCH	77400	THORIGNY SUR MARNE	\N	true	2021-06-14 07:08:32.886739	t
204	204	2 rue HARROUYS	44470	CARQUEFOU	\N	true	2021-06-14 07:08:34.253836	t
205	205	6 Place de la Mairie	35490	SENS DE BRETAGNE	\N	true	2021-06-14 07:08:34.271825	t
206	206	280 rue Rnest Hemingway	29200	BREST	\N	true	2021-06-14 07:08:38.329748	t
207	207	12 rue du Bois d'Amour	29200	BREST	\N	true	2021-06-14 07:08:39.815784	t
208	208	13 rue Georges Clémenceau	29400	LANDIVISIAU	\N	true	2021-06-14 07:08:44.732147	t
209	209	25 avenue Foch	29401	LANDIVISIAU	\N	true	2021-06-14 07:08:44.774123	t
210	210	8 rue Danton	29200	BREST	\N	true	2021-06-14 07:08:50.847627	t
211	211	7 rue Louis Blanc	44200	NANTES	\N	true	2021-06-14 07:08:50.8886	t
212	212	9 rue du Bourgneuf	29300	QUIMPERLE	\N	true	2021-06-14 07:08:56.939681	t
213	213	9 avenue Ernest Chevalier	44730	SAINT MICHEL CHEF CHEF	\N	true	2021-06-14 07:08:58.895343	t
214	214	4 Place de la Libération	56100	LORIENT	\N	true	2021-06-14 07:09:00.951986	t
215	215	71 rue d'Orléans	45380	LA CHAPELLE SAINT MESMIN	\N	true	2021-06-14 07:09:09.344078	t
216	216	69 rue du Landreau	44300	NANTES	\N	true	2021-06-14 07:09:09.475999	t
217	217	12 rue Paul Doumer	85000	LA ROCHE SUR YON	\N	true	2021-06-14 07:09:09.523807	t
218	218	2 Place du Général Lecmerc	29870	LANNILIS	\N	true	2021-06-14 07:09:09.555787	t
219	219	40 Quai du Léon	29800	LANDERNEAU	\N	true	2021-06-14 07:09:09.595764	t
220	220	8 rue du Dourjacq	29200	BREST	\N	true	2021-06-14 07:09:09.630746	t
221	221	5 avenue André Maginot	37100	TOURS	\N	true	2021-06-14 07:09:09.661725	t
222	222	38 rue Amiral Linois	29200	BREST	\N	true	2021-06-14 07:09:13.208181	t
223	223	11 rue Esnault des Châtelets	44200	NANTES	\N	true	2021-06-14 07:09:13.267148	t
224	224	15 AVENUE DU MARECHAL GALLIENI	94340	JOINVILLE LE PONT	\N	true	2021-06-14 07:09:20.753942	t
225	225	35 RUE DU COCHON DUVIVIER	17300	ROCHEFORT	\N	true	2021-06-14 07:09:20.802429	t
226	226	278 rue Jean Jaures	29200	BREST	\N	true	2021-06-14 07:09:22.065755	t
227	227	84 Avenue Louis Joseph Soulas	45800	SAINT JEAN DE BRAYE	\N	true	2021-06-14 07:09:22.089739	t
228	228	20 rue Maupertuis	29200	BREST	\N	true	2021-06-14 07:09:24.3181	t
229	229	60 rue des Forges	44330	VALLET	\N	true	2021-06-14 07:09:24.455021	t
230	230	2 rue de la Tourelle	44320	SAINT PERE EN REETZ	\N	true	2021-06-14 07:09:26.975767	t
231	231	11 rue Porte Coté	41000	BLOIS	\N	true	2021-06-14 07:09:37.709932	t
232	232	Route de Rennes	44700	ORVAULT	\N	true	2021-06-14 07:09:43.870857	t
233	233	13 AVENUE PAUL DOUMER	94360	GOURNAY SUR MARNE	\N	true	2021-06-14 07:09:43.942813	t
234	234	99 avenue du Général de Gaulle	49120	CHEMILLE EN ANJOU	\N	true	2021-06-14 07:09:54.857553	t
235	235	3 rue Victor Hugo	44404	REZE	\N	true	2021-06-14 07:09:54.875788	t
236	236	67 Place Travot	49319	CHOLET CEDEX	\N	true	2021-06-14 07:09:54.901773	t
239	239	34 rue Nationale	37250	MONTBAZON	\N	true	2021-06-14 07:09:58.128108	t
240	240	10 BOULEVARD HENRI ARNAULT	49100	ANGERS	\N	true	2021-06-14 07:09:59.39412	t
241	241	27 avenue Duret	49260	MONTREUIL BELLAY	\N	true	2021-06-14 07:10:01.467346	t
242	242	10 rue Bannier	45000	ORLEANS	\N	true	2021-06-14 07:10:06.232317	t
243	243	22 Place du Vieux Marché	45000	ORLEANS	\N	true	2021-06-14 07:10:06.273326	t
244	244	4 bis rue de la Grise	49400	SAUMUR	\N	true	2021-06-14 07:10:08.052595	t
246	246	13 rue de la Chapelle Saint Cosme	37370	BEAUMONT LOUESTAULT	\N	true	2021-06-14 07:10:17.866099	t
247	247	35 rue Marcel Vignaud	37420	AVOINE	\N	true	2021-06-14 07:10:23.30937	t
250	250	10 Grand'rue	79250	NUEIL LES AUBIERS	\N	true	2021-06-14 07:10:27.770659	t
252	252	44 avenue de l'Europe	49220	LE LION D'ANGERS	\N	true	2021-06-14 07:10:27.873599	t
253	253	6 Place de Gaulle	85300	CHALLANS	\N	true	2021-06-14 07:10:33.050082	t
237	237	nan	nan	nan	\N	true	2021-06-14 07:09:54.929758	t
238	238	1 Place du Chardonnet	37000	TOURS	\N	true	2021-06-14 07:09:55.980754	t
245	245	1 Boulevard du Saumon	45150	JARGEAU	\N	true	2021-06-14 07:10:08.117556	t
248	248	16 avenue André Maginot	37100	TOURS	\N	true	2021-06-14 07:10:23.356344	t
249	249	4 rue Gambetta	53200	CHATEAU GONTIER	\N	true	2021-06-14 07:10:24.843326	t
251	251	11 rue de Clon	49000	ANGERS	\N	true	2021-06-14 07:10:27.811631	t
254	254	24 AVENUE CAMUS	44000	NANTES	\N	true	2021-06-14 07:10:34.596742	t
255	255	37 RUE NERICAULT DESTOUCHES	37000	TOURS	\N	true	2021-06-14 07:10:37.568601	t
256	256	29 boulevard Gaston DUMESNIL	49100	ANGERS	\N	true	2021-06-14 07:10:37.654543	t
257	257	33 RUE DESNOUETTES	75015	PARIS	\N	true	2021-06-14 07:10:46.396847	t
258	258	12 RUE DES FRÈRES GUÉRAUD	44116	VIEILLEVIGNE	\N	true	2021-06-14 07:10:48.938117	t
259	259	30 rue Fortuny	75017	PARIS	\N	true	2021-06-14 07:10:48.976099	t
260	260	1390 RUE DE L'EGLISE	62850	SANGHEN	\N	true	2021-06-14 07:10:49.02507	t
261	261	49 AVENUE THIERS	33100	BORDEAUX	\N	true	2021-06-14 07:10:58.92176	t
262	262	3 RUE DE L'HOTEL DE VILLE	79100	THOUARS	\N	true	2021-06-14 07:11:08.970826	t
263	263	15 BOULEVARD PIERRE LANDAIS	35500	VITREE	\N	true	2021-06-14 07:12:19.358217	t
\.


--
-- Data for Name: suivi_client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suivi_client (id, client, responsable, commentaire, date_creation, date_modif, visibility) FROM stdin;
1	1	8	23/05/2020 XDT mise à jour et contrôle  29/03/2021 CHM Mise à jour adresse mail, MAJ extranet effectuée	2021-06-14 07:02:19.440423	\N	t
2	11	6	08/10/2020 XDT mise à jour nouvelle adresse siège administratif et libellé nom de l'agence\n23/05/2020 XDT mise à jour et contrôle\n09/10/2020 SERVICE COMPTABILITE : Information prise en compte\n12/10/2020 TECH ECN / Modification donneur d'ordre dans Back Office	2021-06-14 07:02:29.726899	\N	t
3	16	36	10/10/19 CHM mise à jour client envoie mail\n23/05/2020 XDT mise à jour INACTIF ARRET DE COLLABORATION suite détournement client MAFAT	2021-06-14 07:02:35.659879	\N	t
4	23	8	23/05/2020 XDT mise à jour client en arrêt de collaboration suite fin 2019	2021-06-14 07:02:44.464427	\N	t
5	32	0	XDT: suite poINT CA dernier edl du 22/07/2017	2021-06-14 07:02:55.08148	\N	t
6	46	8	02/10/2019 CHM / mise à jour du client\n23/05/2020 XDT mise à jour AS	2021-06-14 07:03:17.807309	\N	t
7	49	36	28/04/2019 : XDT mise à jour extranet avec prix et agent rattaché  02/10/2019 CHM mise à jour client\n23/05/2020 XDT mise à jour statut du client / mise en inactif suite fin d'année 2019	2021-06-14 07:03:22.564403	\N	t
8	51	8	XDT : fin de la collaboration suite dépard de la gestionnaire en titre / sa remplaçante a décidé de travailler avec Constaimmo car prix moins chère	2021-06-14 07:03:25.803625	\N	t
9	62	36	02/10/19 CHM/ mise à jour du client\n23/05/2020 XDT mise à jour statut du client / mise en inactif suite fin d'année 2019	2021-06-14 07:03:39.287943	\N	t
10	64	8	CHM/14/10/19 Mise à jour client , nouvelle proposition tarifaire envoyé pour re déclencher client arreté depuis 1 an	2021-06-14 07:03:41.305447	\N	t
11	69	5	23/05/2020 XDT mise à jour et contrôle	2021-06-14 07:03:46.753532	\N	t
12	70	5	23/05/2020 XDT mise à jour et contrôle	2021-06-14 07:03:47.953985	\N	t
13	84	8	25/01/2021 CHM mise à jour MDP	2021-06-14 07:04:01.930279	\N	t
14	104	8	26/09/19 CHM mise à jour client	2021-06-14 07:04:32.322275	\N	t
15	107	8	19/11/2019 XDT msie à jour complète du client suite rachat par M ET MME CHAEREYRE  les nouveaux responsables qui change aussi l'enseigne pour devenir GUY HOQUET / mise à jour de l'extranet et des contacts	2021-06-14 07:04:36.317428	\N	t
16	110	7	23/05/2020 XDT mise à jour et contrôle 28/05/2020 CHM Fichier mis à jour, MAJ extranet également.	2021-06-14 07:04:39.69244	\N	t
17	118	5	03/06/2020 CHM contact pris mise à jour,extranet également.nouvelle resp gestion .23/06/20 Contact et mise à jour , redac nouvelle propos pour relance partenariat	2021-06-14 07:04:47.667207	\N	t
18	134	6	XDT mise à jour du client avec changement d'enseigne et reprise de l'activité	2021-06-14 07:05:03.600089	\N	t
19	143	36	23/02/2020 XDT mise à jour INACTIF ARRET DE COLLABORATION suite détournement client MAFAT	2021-06-14 07:05:12.277893	\N	t
20	147	8	09/04/2019  création accès salarié de l'agence\n23/05/52020 XDT mise à jour du client AS et client inactif suite problème interne in devrait reprendre dans quelques mois	2021-06-14 07:05:16.20704	\N	t
21	148	8	02/10/19 CHM mail envoyer pour mise à jour\n23/05/2020 XDT mise à jour AS	2021-06-14 07:05:17.015978	\N	t
22	149	8	XDT : le cabinet a été vendu il faut voir avec le repreneur	2021-06-14 07:05:17.91419	\N	t
23	152	8	23/05/2020 XDT contrôle et mise à jour client / en arrêt collaboration suite détournement client par MAFAT	2021-06-14 07:05:20.708479	\N	t
24	153	5	23/05/2020 XDT contrôle et mise à jour  changement AP en accord avec AS à partir du 01/05/2020 AP ALS	2021-06-14 07:05:21.668513	\N	t
25	155	65	23/05/2020 XDT mise à jour / arrêt de collaboration suite mauvaise gestion AS COTTIN	2021-06-14 07:05:23.456707	\N	t
26	164	36	23/02/2020 XDT mise à jour INACTIF ARRET DE COLLABORATION suite détournement client MAFAT	2021-06-14 07:05:32.745494	\N	t
27	165	8	20/09/19 CHM/ suite contact,Proposition renvoyée ce jour pour signature et redémarrage fin du mois de septembre avec login et MDP	2021-06-14 07:05:33.714364	\N	t
28	168	8	23/05/2020 XDT mise à jour / arrêt de collaboration suite détournement client MAFAT	2021-06-14 07:05:37.397489	\N	t
29	169	36	23/02/2020 XDT mise à jour INACTIF ARRET DE COLLABORATION suite détournement client MAFAT	2021-06-14 07:05:38.631398	\N	t
30	172	5	23/05/2020 XDT mise à jour et contrôle : changement AP pour ALS à partir du 01/05/2020	2021-06-14 07:05:42.387309	\N	t
31	186	0	XDT / Même client que guy hoquet AUTEUIL	2021-06-14 07:06:08.857202	\N	t
32	198	5	XDT devenu AGENCE L'ADRESSE LES HERBIERS GESTION	2021-06-14 07:06:23.949281	\N	t
33	200	8	XDT nous avons réalisé des rdv edl suite collabotaion de EURIGEST avec L'ADRESSE VAL EUROPE afin de faire des rdv sur le 77	2021-06-14 07:06:26.990245	\N	t
34	205	8	01/05/2019 XDT mise à jour tarif  sur même grille que BUSSAT\n03/10/2019 XDT mise à jour adresse mail de la gestion  site demande de l'agence  04/10/19 CHM mise à jour client mail services Amexpert envoyé\n23/05/2020 XDT arrêt de collaboration suite nombreuse erreurs de gestion des agents suspicion détournement par MAFAT	2021-06-14 07:06:34.783221	\N	t
35	206	7	23/05/2020 XDT contrôle et mise à jour\n02/06/2020 CHM mise à jour client effectuée, MAJ extranet également.	2021-06-14 07:06:36.231708	\N	t
36	215	7	23/05/2020 XDT cpntrôle et mise à jour\n02/06/2020 CHM mise à jour client effectuée, MAJ extranet également. 23/02/2021 CHM Mise à jour tarif un local commercial	2021-06-14 07:06:51.077472	\N	t
37	222	7	CHM/mise à jour de la fiche client , merci de me communiquer login et MDP. CHM/ Mise à jour nouvelle gestionnaire remplaçant Mme Goron MAJ extranet	2021-06-14 07:07:05.390982	\N	t
38	223	7	23/05/2020 XDT cpntrôle et mise à jour 28/05/2020 CHM mise à jour effectuée. MAJ extranet également	2021-06-14 07:07:07.787347	\N	t
39	228	5	14/10/2020 XDT Mise à jour agenr référent suite réception mail ALS ( pdf mail en pièce jointe )\nACR sur la client BKA à partir des réalisation du 01/11/2020 \n03/10/2020 ECN Mise à jour provisoire pour début activité 09/10/2020	2021-06-14 07:07:16.017509	\N	t
40	229	8	23/05/2020 XDT mise à jour sur arrêt de collaboration suite dépôt de bilan	2021-06-14 07:07:16.838564	\N	t
41	232	8	Nouvelle proposition par GD le 22/803/18	2021-06-14 07:07:20.577855	\N	t
42	233	8	Nouvelle proposition par GD le 22/803/19	2021-06-14 07:07:21.678385	\N	t
43	242	65	23/05/2020 XDT mise à jour fiche en arrêt de collaboration suite mauvaise gestion AS COTTIN	2021-06-14 07:07:30.633913	\N	t
44	244	8	23/05/2020 XDT mise à jour AS	2021-06-14 07:07:32.542816	\N	t
45	250	8	23/05/2020 XDT mise à jour AS	2021-06-14 07:07:41.64595	\N	t
46	262	8	26/09/19 CHM mise à jour client\n23/05/2020 XDT mise à jour de la fiche : partie gestion  racheté par Cabinet Fredelion	2021-06-14 07:07:55.280172	\N	t
47	267	65	23/05/2020 XDT mise à jour fiche en arrêt de collaboration suite mauvaise gestion AS COTTIN	2021-06-14 07:08:02.845308	\N	t
48	270	8	23/05/2020 XDT mise à jour et contrôle de la fiche client / mise à jour AS 03/06/2020 CHM contact pris pour organisation rdv mise à jour effectué	2021-06-14 07:08:07.70825	\N	t
49	272	8	23/05/2020 XDT mise à jour et contrôle de la fiche client  03/06/2020 CHM mise à jour , extranet également et renvoie des accès extranet pour activité ponctuel congés ou saison d'été.	2021-06-14 07:08:11.162297	\N	t
50	281	36	23/02/2020 XDT mise à jour INACTIF ARRET DE COLLABORATION suite détournement client MAFAT	2021-06-14 07:08:22.326572	\N	t
51	282	36	23/02/2020 XDT mise à jour INACTIF ARRET DE COLLABORATION suite détournement client MAFAT	2021-06-14 07:08:23.395672	\N	t
52	283	36	23/02/2020 XDT mise à jour INACTIF ARRET DE COLLABORATION suite détournement client MAFAT	2021-06-14 07:08:24.689785	\N	t
53	287	8	16/07/2019 : XDT Mise à jour extranet avec agent rattaché pour gestion des rdv et AS du client	2021-06-14 07:08:29.294813	\N	t
54	288	8	16/07/2019 : XDT Mise à jour extranet avec agent rattaché pour gestion des rdv et AS du client	2021-06-14 07:08:30.699686	\N	t
55	289	6	16/07/2019 : XDT Mise à jour extranet avec agent rattaché pour gestion des rdv et AS du client	2021-06-14 07:08:31.840726	\N	t
56	292	5	16/07/2019 : XDT Mise à jour extranet avec agent rattaché pour gestion des rdv et AS du client	2021-06-14 07:08:37.284536	\N	t
57	296	8	15/07/2019 XDT : mise à jour id et mpd	2021-06-14 07:08:43.190658	\N	t
58	301	8	16/07/2019 : XDT Mise à jour extranet avec agent rattaché pour gestion des rdv et AS du client	2021-06-14 07:08:49.86576	\N	t
59	302	8	16/07/2019 : XDT Mise à jour extranet avec agent rattaché pour gestion des rdv et AS du client	2021-06-14 07:08:50.951568	\N	t
60	305	8	16/07/2019 : XDT Mise à jour extranet avec agent rattaché pour gestion des rdv et AS du client	2021-06-14 07:08:54.611973	\N	t
61	306	7	16/07/2019 : XDT Mise à jour extranet avec agent  rattaché pour gestion des rdv et AS du client	2021-06-14 07:08:55.857996	\N	t
62	307	8	16/07/2019 : XDT Mise à jour extranet avec agent  rattaché pour gestion des rdv et AS du client	2021-06-14 07:08:56.99864	\N	t
63	308	8	Client sur 4 départements : 49 / 53 / 44 / 85 pour 1600 EDL par an	2021-06-14 07:08:58.947366	\N	t
64	310	8	16/07/2019 : XDT Mise à jour extranet avec agent  rattaché pour gestion des rdv et AS du client	2021-06-14 07:09:01.051984	\N	t
65	318	6	24/05/2020 XDT Suite demande de la responsable service gestion MLLE Bracq, création de 3 accès pour les nouvelles assistantes et 1 accès pour la commerciale Fanny Manokoune	2021-06-14 07:09:13.362108	\N	t
66	328	8	11/10/19 CHM mail service Amexpert envoyé.31/07/2020 CHM/ Nouvelle mise à jour tarification pour relance activité	2021-06-14 07:09:25.656379	\N	t
67	332	6	03/04/2020 XDT création extranet suite de la mise à jour client	2021-06-14 07:09:31.074318	\N	t
68	335	7	CHM/ 7/11/19 mise à jour tarification	2021-06-14 07:09:34.880527	\N	t
69	342	8	XDT création des nouveau accés sur new extranet	2021-06-14 07:09:47.264821	\N	t
70	347	6	XDT >> Création client et extranet	2021-06-14 07:09:53.688145	\N	t
71	348	8	30/04/2019 XDT mise à ajour back office / création de l'agence et mise à jour libellé et logo  20/09/19 CHM  mise à jour client  rdv le 07/11/19 pour point activité	2021-06-14 07:09:54.983754	\N	t
72	350	8	Mise à jour contact du client M Méchineau à quitté l'agence et remplacer par MME GUILLOTEAU CHARLOTTE\nXDT le 27/08/2019 Mise en place nouveau tarif  vu avec CUA	2021-06-14 07:09:57.06765	\N	t
73	360	8	16/07/2020 CHM mise à jour client , renvoie login MDP pour activité pendant les congés d'été.	2021-06-14 07:10:12.918147	\N	t
74	361	8	23/05/2020 XDT mise à jour de la fiche / arrêt de collaboration suite détournement client par MAFAT	2021-06-14 07:10:14.265985	\N	t
75	362	36	24/09/2019 CHM mise à jour client\n23/02/2020 XDT mise à jour INACTIF ARRET DE COLLABORATION suite détournement client MAFAT	2021-06-14 07:10:16.349223	\N	t
76	363	8	Contact client fait via demande via site pour réalisation d'un état des lieux à Marseille pour un inter agence\nLe responsable est un ancien de l'équipe AGENCE ORPI MARCHE	2021-06-14 07:10:17.968952	\N	t
77	364	8	RD : Au 15/07/19 3 constats réalisés : 01/02-19/03-21-03	2021-06-14 07:10:19.229337	\N	t
78	365	36	23/02/2020 XDT mise à jour INACTIF	2021-06-14 07:10:20.71392	\N	t
79	369	8	24/09/2019 XDT suite échange avec Nathalie GIUSTO il faut lui envoyé copie de facture et pas à la compta\n\nPremière prise de contact avec le client via mail à XDT demande de suivi à Nadia le jour même et réception de la proposition et demande de création du client par CMF le 07/02/2019 suivi commercial et technique à charge de CMF	2021-06-14 07:10:26.392778	\N	t
80	370	8	22/10/2019 XDT ai eu contact ce jour avec le gérant de l'agence dont je n'ai pas le nom mais voici le tel 0677074836	2021-06-14 07:10:27.983538	\N	t
81	371	0	Merci de faire les insertions de lignes au dessous de cette ligne	2021-06-14 07:10:29.429089	\N	t
82	372	5	CHM merci d'enregistrer ce client et de communiquer login et MDP	2021-06-14 07:10:31.005416	\N	t
83	373	5	XDT mise à jour des tarifs suite mise en place partenariat  avec l'agence Laforet à ANGERS	2021-06-14 07:10:33.126993	\N	t
84	378	8	Rdv suite prospection terrain	2021-06-14 07:10:41.138953	\N	t
85	379	8	rdv suite prospection terrain	2021-06-14 07:10:43.348094	\N	t
86	380	8	01/05/2019 XDT mise à jour  back office : agence et libellé et logo	2021-06-14 07:10:44.486796	\N	t
87	385	8	Suite contact téléphonique et mail envoyé par l'agence	2021-06-14 07:10:51.825926	\N	t
88	387	0	ETAT DES LIEUX D'UN APPARTEMENT F3 VIDE	2021-06-14 07:10:56.315074	\N	t
89	392	8	Demande de création\n09/04/2019 création du client avec compte extranet\n09/04/2019 XDT création du compte\n28/04/2020 XDT entretien pour point et proposition de prise en charge de 100% du volume edl /proposition tarif moyen de 85 € et mise en place à partir du 01/05/2020	2021-06-14 07:11:04.83047	\N	t
90	396	8	Demande création Identifiants et MdP plateforme 25/06/2020 CHM mise à jour et nouvelle proposition pour relance partenarita	2021-06-14 07:11:12.77784	\N	t
91	397	7	Enregistrement client particulier	2021-06-14 07:11:13.90592	\N	t
92	402	8	23/05/2020 XDT mise à jour AS	2021-06-14 07:11:19.413799	\N	t
93	404	38	19/06/2020 CHM point avec Mme Andre nouvelle proposition envoyé pour relance activité en attente	2021-06-14 07:11:22.364582	\N	t
94	406	8	test pour externalisation sur L'agence de  Rueil \nLe groupe possède 9 agences / responsable gestion MME  RUSIACK Dominique\ngestion2@de-valliere.com  01/03/2021 CHM Mise à jour adresse mail pour réalisation EDL	2021-06-14 07:11:25.336342	\N	t
95	414	8	mIse à jour tarif par XDT	2021-06-14 07:11:40.080265	\N	t
96	421	8	Création suite information de CUA suite recherche le dirgieant serait M OLIVIER DOLICQUE	2021-06-14 07:11:50.262129	\N	t
97	422	8	Création suite information de CUA suite recherche il y a é établissements une agence à LILLE et une agence à Paris	2021-06-14 07:11:51.981148	\N	t
98	424	8	Etat des lieux\n26/07/2019 XDT : mise à jour du numéro de tva intracommunautaire suite réception mail JPM	2021-06-14 07:11:54.177566	\N	t
99	427	8	21/10/2019 XDT création du client particulier sur extranet pour génération code client	2021-06-14 07:11:58.032772	\N	t
100	430	8	CHM/ EDL déja réalisé le 13/09 avec OM papier.\nXDT 18/09/2019  création des accès extranet	2021-06-14 07:12:01.182691	\N	t
118	452	8	16/05/2020 CHM création client et des accès extranet  propos signée en pièce jointe 28/07/2020 CHM mise à jour client pour début activité courant Aout 2020	2021-06-14 07:12:32.758242	\N	t
101	431	7	CHM/ début d'activité fin sept 2019	2021-06-14 07:12:02.815942	\N	t
102	432	6	XDT 23/09/2019 création du client en statut particulier \nattention travail comme agent co chez RUE DE LA PAIX IMMO	2021-06-14 07:12:04.416865	\N	t
103	433	8	CHM / 10/10/19 Création client , début d'activité au 15 octobre 2019	2021-06-14 07:12:05.990735	\N	t
104	434	7	CHM / EDLS Réalisé le 24/09/19	2021-06-14 07:12:07.250232	\N	t
105	435	7	CHM 15/10/19 EDLS à réaliser le 31/10/19	2021-06-14 07:12:08.481682	\N	t
106	436	7	CHM / 18/10/19 Création client,début d'activité novembre 2019	2021-06-14 07:12:09.966216	\N	t
107	438	7	CHM / 23/10/20 Création client,EDLE le 06/02/2020	2021-06-14 07:12:13.236814	\N	t
108	439	6	29/01/2020 XDT validation avec le client de la facture en récap sur coût moyen décidé	2021-06-14 07:12:14.299001	\N	t
109	440	6	29/01/2020 XDT associée de M PAYEN FRANCK  groupe PROCITY elle s'occupe de la gestion à travers cette société\nvalidation avec le client de la facture en récap sur coût moyen décidé	2021-06-14 07:12:15.519846	\N	t
110	441	6	29/01/2020 XDT validation de l'externalisation complète après la période de test du mois de février\n> possibilité de prendre la solution partage \n> facturation récap à a typologie	2021-06-14 07:12:17.136063	\N	t
111	443	6	29/09/2020 XDT information administrative : siège de l'agence Carquefou sur secteur 44 AS MANDIN mise à jour à compter du 01/10/2020pour commission\n29/09/2020 XDT mise à jour de la nouvelle adresse de l'agence de Carquefou. \n29/09/2020 XDT création des accès de la nouvelle commerciale de l'agence Mlle ARTAUD Stéphanie\n18/08/2020 XDT mise à jour agent ref suite changement d'organisation administrative du client /le contact commercial est XAVIER DETOC avec le directeur des agences M BLANVILLAIN\n04/02/20 XDT création du client et des accès extranet\nce client est en gestion par service gestion LADRESSE LES ARDOISIERES	2021-06-14 07:12:19.457205	\N	t
112	444	8	27/02/2020 CHM création client et des accès extranet pour 1er essai suite signature propos en pièce jointe	2021-06-14 07:12:20.685567	\N	t
113	445	8	10/03/2020 CHM création client et des accès extranet pour Edl le 15/04/2020 suite mail ALS fiche client en pièce jointe	2021-06-14 07:12:23.04756	\N	t
114	446	8	20/03/2020 CHM création client et des accès extranet pour Edls suite mail agence, propos signée en pièce jointe 29/06/2020 CHM creation ID et MDP ag de Cesson sevigne Mme Gauthier Resp Loc	2021-06-14 07:12:24.88223	\N	t
115	447	8	01/04/2020 XDT mise à jour du client	2021-06-14 07:12:26.152338	\N	t
116	449	6	28/04/2020 XDT création du donneur d'ordre back office	2021-06-14 07:12:28.561192	\N	t
117	450	8	07/05/2020 CHM création client et des accès extranet  propos signée en pièce jointe    26/05/2021 CHM mise à jour tarification et tarif comparatif pour relance activité	2021-06-14 07:12:29.736878	\N	t
119	453	8	02/12/2020 CHM mise à jour nouvelle salarié gestionnaire  31/12/2020 CHM mise à jour nouvel accès extranet pour Mme GLOAGEN	2021-06-14 07:12:34.240098	\N	t
120	454	8	16/10/2020 XDT suite rdv poitn du 15/10/2020 mise à jour de l'adresse mail de MLLE MARIE. \n16/05/2020 CHM création client et des accès extranet  propos signée en pièce jointe, début d'activité le 11/08/2020	2021-06-14 07:12:35.43697	\N	t
121	455	8	09/06/2020 XDT création de la fiche / propriétaire qui travail aussi avec l'agence Barbara immobilier	2021-06-14 07:12:37.139237	\N	t
122	456	8	17/06/2020 CHM création client et des accès extranet  OM signée en pièce jointe, EDLS prevu le 23/06/2020	2021-06-14 07:12:38.392303	\N	t
123	457	8	18/06/2020 CHM création client et des accès extranet  OM en pièce jointe accompagné du mail de prise de commande .	2021-06-14 07:12:39.603142	\N	t
124	458	8	23/06/2020 CHM création client et des accès extranet Proposition en piéce jointe.	2021-06-14 07:12:40.65547	\N	t
125	459	0	07/07/2020 CHM création client et des accès extranet Proposition en piéce jointe.Début activité fin juillet 2020\n07/07/2020 ECN Création DO dans Back office / Affectation à BKA en responsabilité ACR	2021-06-14 07:12:41.897897	\N	t
126	460	7	16/07/2020 CHM création client et accès extranet Ordre de mission en pièce jointe.	2021-06-14 07:12:44.086925	\N	t
127	461	8	24/07/2020 CHM création client et accès extranet Ordre de mission en pièce jointe.	2021-06-14 07:12:45.10905	\N	t
128	463	8	29/07/2020 CHM création client et des accès extranet Proposition en piéce jointe.Début activité fin juillet 2020	2021-06-14 07:12:47.650769	\N	t
129	464	8	17/08/2020 CHM création client et des accès extranet OM en piéce jointe.\n18/08/2020 ECN création DO 108047	2021-06-14 07:12:49.588173	\N	t
130	465	6	17/08/2020 XDT création des accès extranet et validation du tarif de la prestation pour 150 € / j'ai fais la création du donneur d'ordre	2021-06-14 07:12:50.692082	\N	t
131	466	7	18/08/2020 XDT création des accès extranet / le contact commercial reste Xavier Detoc qui à le contact avec le directeur M BLANVILLAIN	2021-06-14 07:12:52.24213	\N	t
132	467	8	02/09/2020 CHM création client et accès extranet OM en pièce jointe.\n03/09/2020 Tech / Création DO dans Back office 108746	2021-06-14 07:12:56.010228	\N	t
133	468	8	02/10/2020 CHM création client et accès extranet OM en pièce jointe.\n03/10/2020 TECH création DO dans Back office 109790	2021-06-14 07:12:57.0564	\N	t
134	469	8	27/10/2020 CHM creation client  03/11/2020 CHM modification mise à jour adresse mail	2021-06-14 07:12:58.161883	\N	t
135	470	6	09/11/2020 CHM creation client & Extranet particulier OM en pièce jointe\n09/11/2020 TEC Création donneur d'ordre dans back office / Ref 110878	2021-06-14 07:12:59.639928	\N	t
136	471	7	11/12/2020 CHM creation client & Extranet particulier propos  en pièce jointe\n12/12/2020 TEC création donneur d'ordre dans Back Office ref 111578	2021-06-14 07:13:00.899381	\N	t
137	472	4	17/12/2020 CHM cration client et des accès extranet Proposition en pièce jointe. Début activité mi janvier 2021\n18/12/2020 ECN Création Donneur d'ordre ref 111728	2021-06-14 07:13:01.93106	\N	t
138	474	8	12/01/2021 Création client particulier et accès extranet  OM signés en pièce jointe\n12/01/2021 ECN Création donneur d'ordre back office / Ref 112311	2021-06-14 07:13:04.229278	\N	t
139	476	6	18/03/2021 CHM / Création client particulier et acces extranet OM signé en pièce jointe\n23/03/2021 ECN/ Création donneur d'ordre directement dans RDV / Agenda annoté	2021-06-14 07:13:08.037852	\N	t
140	477	5	27/04/2021 ECN / Création client particulier et accès Extranet / OM signé en pièce jointe / Création DO dans Back office ref 115462	2021-06-14 07:13:09.124917	\N	t
141	478	8	08/05/2021 CHM / Création client particulier et acces extranet OM signé en pièce jointe\n10/05/2021 ECN Création DO dans Back office / REF 115858	2021-06-14 07:13:11.23915	\N	t
142	479	8	17/05/2021 ECN / Création client particulier et acces extranet OM signé en pièce jointe / Création DO dans Back office / REF 116030	2021-06-14 07:13:13.32779	\N	t
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

