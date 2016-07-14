--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: award; Type: TABLE; Schema: public; Owner: tester; Tablespace: 
--

CREATE TABLE award (
    id integer NOT NULL,
    contractingprocess_id integer,
    awardid text,
    title text,
    description text,
    status text,
    award_date timestamp without time zone,
    value_amount numeric,
    value_currency text,
    contractperiod_startdate timestamp without time zone,
    contractperiod_enddate timestamp without time zone,
    amendment_date timestamp without time zone,
    amendment_rationale text
);


ALTER TABLE public.award OWNER TO tester;

--
-- Name: award_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE award_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.award_id_seq OWNER TO tester;

--
-- Name: award_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE award_id_seq OWNED BY award.id;


--
-- Name: awardamendmentchanges; Type: TABLE; Schema: public; Owner: tester; Tablespace: 
--

CREATE TABLE awardamendmentchanges (
    id integer NOT NULL,
    contractingprocess_id integer,
    award_id integer,
    property text,
    former_value text
);


ALTER TABLE public.awardamendmentchanges OWNER TO tester;

--
-- Name: awardamendmentchanges_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE awardamendmentchanges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.awardamendmentchanges_id_seq OWNER TO tester;

--
-- Name: awardamendmentchanges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE awardamendmentchanges_id_seq OWNED BY awardamendmentchanges.id;


--
-- Name: awarddocuments; Type: TABLE; Schema: public; Owner: tester; Tablespace: 
--

CREATE TABLE awarddocuments (
    id integer NOT NULL,
    contractingprocess_id integer,
    award_id integer,
    document_type text,
    documentid text,
    title text,
    description text,
    url text,
    date_published timestamp without time zone,
    date_modified timestamp without time zone,
    format text,
    language text
);


ALTER TABLE public.awarddocuments OWNER TO tester;

--
-- Name: awarddocuments_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE awarddocuments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.awarddocuments_id_seq OWNER TO tester;

--
-- Name: awarddocuments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE awarddocuments_id_seq OWNED BY awarddocuments.id;


--
-- Name: awarditem; Type: TABLE; Schema: public; Owner: tester; Tablespace: 
--

CREATE TABLE awarditem (
    id integer NOT NULL,
    contractingprocess_id integer,
    award_id integer,
    itemid text,
    description text,
    classification_scheme text,
    classification_id text,
    classification_description text,
    classification_uri text,
    quantity integer,
    unit_name text,
    unit_value_amount numeric,
    unit_value_currency text
);


ALTER TABLE public.awarditem OWNER TO tester;

--
-- Name: awarditem_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE awarditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.awarditem_id_seq OWNER TO tester;

--
-- Name: awarditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE awarditem_id_seq OWNED BY awarditem.id;


--
-- Name: awarditemadditionalclassifications; Type: TABLE; Schema: public; Owner: tester; Tablespace: 
--

CREATE TABLE awarditemadditionalclassifications (
    id integer NOT NULL,
    award_id integer,
    awarditem_id integer,
    scheme text,
    description text,
    uri text
);


ALTER TABLE public.awarditemadditionalclassifications OWNER TO tester;

--
-- Name: awarditemadditionalclassifications_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE awarditemadditionalclassifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.awarditemadditionalclassifications_id_seq OWNER TO tester;

--
-- Name: awarditemadditionalclassifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE awarditemadditionalclassifications_id_seq OWNED BY awarditemadditionalclassifications.id;


--
-- Name: budget; Type: TABLE; Schema: public; Owner: tester; Tablespace: 
--

CREATE TABLE budget (
    id integer NOT NULL,
    contractingprocess_id integer,
    planning_id integer,
    budget_source text,
    budget_budgetid text,
    budget_description text,
    budget_amount numeric,
    budget_currency text,
    budget_project text,
    budget_projectid text,
    budget_uri text
);


ALTER TABLE public.budget OWNER TO tester;

--
-- Name: budget_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE budget_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.budget_id_seq OWNER TO tester;

--
-- Name: budget_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE budget_id_seq OWNED BY budget.id;


--
-- Name: buyer; Type: TABLE; Schema: public; Owner: tester; Tablespace: 
--

CREATE TABLE buyer (
    id integer NOT NULL,
    contractingprocess_id integer,
    name text,
    identifier_scheme text,
    identifier_id text,
    identifier_legalname text,
    identifier_uri text,
    address_streetaddress text,
    address_locality text,
    address_region text,
    address_postalcode text,
    address_countryname text,
    contactpoint_name text,
    contactpoint_email text,
    contactpoint_telephone text,
    contactpoint_faxnumber text,
    contactpoint_url text
);


ALTER TABLE public.buyer OWNER TO tester;

--
-- Name: buyer_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE buyer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.buyer_id_seq OWNER TO tester;

--
-- Name: buyer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE buyer_id_seq OWNED BY buyer.id;


--
-- Name: buyeradditionalidentifiers; Type: TABLE; Schema: public; Owner: tester; Tablespace: 
--

CREATE TABLE buyeradditionalidentifiers (
    id integer NOT NULL,
    contractingprocess_id integer,
    buyer_id integer,
    scheme text,
    legalname text,
    uri text
);


ALTER TABLE public.buyeradditionalidentifiers OWNER TO tester;

--
-- Name: buyeradditionalidentifiers_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE buyeradditionalidentifiers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.buyeradditionalidentifiers_id_seq OWNER TO tester;

--
-- Name: buyeradditionalidentifiers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE buyeradditionalidentifiers_id_seq OWNED BY buyeradditionalidentifiers.id;


--
-- Name: contract; Type: TABLE; Schema: public; Owner: tester; Tablespace: 
--

CREATE TABLE contract (
    id integer NOT NULL,
    contractingprocess_id integer,
    awardid text,
    contractid text,
    title text,
    description text,
    status text,
    period_startdate timestamp without time zone,
    period_enddate timestamp without time zone,
    value_amount numeric,
    value_currency text,
    datesigned timestamp without time zone,
    amendment_date timestamp without time zone,
    amendment_rationale text
);


ALTER TABLE public.contract OWNER TO tester;

--
-- Name: contract_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE contract_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contract_id_seq OWNER TO tester;

--
-- Name: contract_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE contract_id_seq OWNED BY contract.id;


--
-- Name: contractamendmentchanges; Type: TABLE; Schema: public; Owner: tester; Tablespace: 
--

CREATE TABLE contractamendmentchanges (
    id integer NOT NULL,
    contractingprocess_id integer,
    contract_id integer,
    property text,
    former_value text
);


ALTER TABLE public.contractamendmentchanges OWNER TO tester;

--
-- Name: contractamendmentchanges_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE contractamendmentchanges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contractamendmentchanges_id_seq OWNER TO tester;

--
-- Name: contractamendmentchanges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE contractamendmentchanges_id_seq OWNED BY contractamendmentchanges.id;


--
-- Name: contractdocuments; Type: TABLE; Schema: public; Owner: tester; Tablespace: 
--

CREATE TABLE contractdocuments (
    id integer NOT NULL,
    contractingprocess_id integer,
    contract_id integer,
    document_type text,
    documentid text,
    title text,
    description text,
    url text,
    date_published timestamp without time zone,
    date_modified timestamp without time zone,
    format text,
    language text
);


ALTER TABLE public.contractdocuments OWNER TO tester;

--
-- Name: contractdocuments_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE contractdocuments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contractdocuments_id_seq OWNER TO tester;

--
-- Name: contractdocuments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE contractdocuments_id_seq OWNED BY contractdocuments.id;


--
-- Name: contractingprocess; Type: TABLE; Schema: public; Owner: tester; Tablespace: 
--

CREATE TABLE contractingprocess (
    id integer NOT NULL,
    ocid text,
    fecha_creacion date,
    hora_creacion time without time zone,
    etapa text
);


ALTER TABLE public.contractingprocess OWNER TO tester;

--
-- Name: contractingprocess_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE contractingprocess_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contractingprocess_id_seq OWNER TO tester;

--
-- Name: contractingprocess_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE contractingprocess_id_seq OWNED BY contractingprocess.id;


--
-- Name: contractitem; Type: TABLE; Schema: public; Owner: tester; Tablespace: 
--

CREATE TABLE contractitem (
    id integer NOT NULL,
    contractingprocess_id integer,
    contract_id integer,
    itemid text,
    description text,
    classification_scheme text,
    classification_id text,
    classification_description text,
    classification_uri text,
    quantity integer,
    unit_name text,
    unit_value_amount numeric,
    unit_value_currency text
);


ALTER TABLE public.contractitem OWNER TO tester;

--
-- Name: contractitem_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE contractitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contractitem_id_seq OWNER TO tester;

--
-- Name: contractitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE contractitem_id_seq OWNED BY contractitem.id;


--
-- Name: contractitemadditionalclasifications; Type: TABLE; Schema: public; Owner: tester; Tablespace: 
--

CREATE TABLE contractitemadditionalclasifications (
    id integer NOT NULL,
    contractingprocess_id integer,
    contract_id integer,
    contractitem_id integer,
    scheme text,
    description text,
    uri text
);


ALTER TABLE public.contractitemadditionalclasifications OWNER TO tester;

--
-- Name: contractitemadditionalclasifications_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE contractitemadditionalclasifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contractitemadditionalclasifications_id_seq OWNER TO tester;

--
-- Name: contractitemadditionalclasifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE contractitemadditionalclasifications_id_seq OWNED BY contractitemadditionalclasifications.id;


--
-- Name: implementation; Type: TABLE; Schema: public; Owner: tester; Tablespace: 
--

CREATE TABLE implementation (
    id integer NOT NULL,
    contractingprocess_id integer,
    contract_id integer
);


ALTER TABLE public.implementation OWNER TO tester;

--
-- Name: implementation_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE implementation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.implementation_id_seq OWNER TO tester;

--
-- Name: implementation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE implementation_id_seq OWNED BY implementation.id;


--
-- Name: implementationdocuments; Type: TABLE; Schema: public; Owner: tester; Tablespace: 
--

CREATE TABLE implementationdocuments (
    id integer NOT NULL,
    contractingprocess_id integer,
    contract_id integer,
    implementation_id integer,
    document_type text,
    documentid text,
    title text,
    description text,
    url text,
    date_published timestamp without time zone,
    date_modified timestamp without time zone,
    format text,
    language text
);


ALTER TABLE public.implementationdocuments OWNER TO tester;

--
-- Name: implementationdocuments_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE implementationdocuments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.implementationdocuments_id_seq OWNER TO tester;

--
-- Name: implementationdocuments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE implementationdocuments_id_seq OWNED BY implementationdocuments.id;


--
-- Name: implementationmilestone; Type: TABLE; Schema: public; Owner: tester; Tablespace: 
--

CREATE TABLE implementationmilestone (
    id integer NOT NULL,
    contractingprocess_id integer,
    contract_id integer,
    implementation_id integer,
    milestoneid text,
    title text,
    description text,
    duedate timestamp without time zone,
    date_modified timestamp without time zone,
    status text
);


ALTER TABLE public.implementationmilestone OWNER TO tester;

--
-- Name: implementationmilestone_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE implementationmilestone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.implementationmilestone_id_seq OWNER TO tester;

--
-- Name: implementationmilestone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE implementationmilestone_id_seq OWNED BY implementationmilestone.id;


--
-- Name: implementationmilestonedocuments; Type: TABLE; Schema: public; Owner: tester; Tablespace: 
--

CREATE TABLE implementationmilestonedocuments (
    id integer NOT NULL,
    contractingprocess_id integer,
    contract_id integer,
    implementation_id integer,
    document_type text,
    documentid text,
    title text,
    description text,
    url text,
    date_published timestamp without time zone,
    date_modified timestamp without time zone,
    format text,
    language text
);


ALTER TABLE public.implementationmilestonedocuments OWNER TO tester;

--
-- Name: implementationmilestonedocuments_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE implementationmilestonedocuments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.implementationmilestonedocuments_id_seq OWNER TO tester;

--
-- Name: implementationmilestonedocuments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE implementationmilestonedocuments_id_seq OWNED BY implementationmilestonedocuments.id;


--
-- Name: implementationtransactions; Type: TABLE; Schema: public; Owner: tester; Tablespace: 
--

CREATE TABLE implementationtransactions (
    id integer NOT NULL,
    contractingprocess_id integer,
    contract_id integer,
    implementation_id integer,
    source text,
    implementation_date timestamp without time zone,
    value_amount numeric,
    value_currency text,
    providerorganization_scheme text,
    providerorganization_id text,
    providerorganization_legalname text,
    providerorganization_uri text,
    receiverorganization_scheme text,
    receiverorganization_id text,
    receiverorganization_legalname text,
    receiverorganization_uri text,
    uri text,
    transactionid text
);


ALTER TABLE public.implementationtransactions OWNER TO tester;

--
-- Name: implementationtransactions_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE implementationtransactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.implementationtransactions_id_seq OWNER TO tester;

--
-- Name: implementationtransactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE implementationtransactions_id_seq OWNED BY implementationtransactions.id;


--
-- Name: planning; Type: TABLE; Schema: public; Owner: tester; Tablespace: 
--

CREATE TABLE planning (
    id integer NOT NULL,
    contractingprocess_id integer,
    rationale text
);


ALTER TABLE public.planning OWNER TO tester;

--
-- Name: planning_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE planning_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planning_id_seq OWNER TO tester;

--
-- Name: planning_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE planning_id_seq OWNED BY planning.id;


--
-- Name: planningdocuments; Type: TABLE; Schema: public; Owner: tester; Tablespace: 
--

CREATE TABLE planningdocuments (
    id integer NOT NULL,
    contractingprocess_id integer,
    planning_id integer,
    documentid text,
    document_type text,
    title text,
    description text,
    url text,
    date_published timestamp without time zone,
    date_modified timestamp without time zone,
    format text,
    language text
);


ALTER TABLE public.planningdocuments OWNER TO tester;

--
-- Name: planningdocuments_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE planningdocuments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planningdocuments_id_seq OWNER TO tester;

--
-- Name: planningdocuments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE planningdocuments_id_seq OWNED BY planningdocuments.id;


--
-- Name: procuringentity; Type: TABLE; Schema: public; Owner: tester; Tablespace: 
--

CREATE TABLE procuringentity (
    id integer NOT NULL,
    contractingprocess_id integer,
    tender_id integer,
    identifier_scheme text,
    identifier_id text,
    identifier_legalname text,
    identifier_uri text,
    name text,
    address_streetaddress text,
    address_locality text,
    address_region text,
    address_postalcode text,
    address_countryname text,
    contactpoint_name text,
    contactpoint_email text,
    contactpoint_telephone text,
    contactpoint_faxnumber text,
    contactpoint_url text
);


ALTER TABLE public.procuringentity OWNER TO tester;

--
-- Name: procuringentity_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE procuringentity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.procuringentity_id_seq OWNER TO tester;

--
-- Name: procuringentity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE procuringentity_id_seq OWNED BY procuringentity.id;


--
-- Name: procuringentityadditionalidentifiers; Type: TABLE; Schema: public; Owner: tester; Tablespace: 
--

CREATE TABLE procuringentityadditionalidentifiers (
    id integer NOT NULL,
    contractingprocess_id integer,
    tender_id integer,
    procuringentity_id integer,
    scheme text,
    legalname text,
    uri text
);


ALTER TABLE public.procuringentityadditionalidentifiers OWNER TO tester;

--
-- Name: procuringentityadditionalidentifiers_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE procuringentityadditionalidentifiers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.procuringentityadditionalidentifiers_id_seq OWNER TO tester;

--
-- Name: procuringentityadditionalidentifiers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE procuringentityadditionalidentifiers_id_seq OWNED BY procuringentityadditionalidentifiers.id;


--
-- Name: publisher; Type: TABLE; Schema: public; Owner: tester; Tablespace: 
--

CREATE TABLE publisher (
    id integer NOT NULL,
    contractingprocess_id integer,
    name text,
    scheme text,
    uid text,
    uri text
);


ALTER TABLE public.publisher OWNER TO tester;

--
-- Name: publisher_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE publisher_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publisher_id_seq OWNER TO tester;

--
-- Name: publisher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE publisher_id_seq OWNED BY publisher.id;


--
-- Name: supplier; Type: TABLE; Schema: public; Owner: tester; Tablespace: 
--

CREATE TABLE supplier (
    id integer NOT NULL,
    contractingprocess_id integer,
    award_id integer,
    name text,
    identifier_scheme text,
    identifier_id text,
    identifier_legalname text,
    identifier_uri text,
    address_streetaddress text,
    address_locality text,
    address_region text,
    address_postalcode text,
    address_countryname text,
    contactpoint_name text,
    contactpoint_email text,
    contactpoint_telephone text,
    contactpoint_faxnumber text,
    contactpoint_url text
);


ALTER TABLE public.supplier OWNER TO tester;

--
-- Name: supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE supplier_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supplier_id_seq OWNER TO tester;

--
-- Name: supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE supplier_id_seq OWNED BY supplier.id;


--
-- Name: supplieradditionalidentifiers; Type: TABLE; Schema: public; Owner: tester; Tablespace: 
--

CREATE TABLE supplieradditionalidentifiers (
    id integer NOT NULL,
    contractingprocess integer,
    award_id integer,
    supplier_id integer,
    scheme text,
    legalname text,
    uri text
);


ALTER TABLE public.supplieradditionalidentifiers OWNER TO tester;

--
-- Name: supplieradditionalidentifiers_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE supplieradditionalidentifiers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supplieradditionalidentifiers_id_seq OWNER TO tester;

--
-- Name: supplieradditionalidentifiers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE supplieradditionalidentifiers_id_seq OWNED BY supplieradditionalidentifiers.id;


--
-- Name: tender; Type: TABLE; Schema: public; Owner: tester; Tablespace: 
--

CREATE TABLE tender (
    id integer NOT NULL,
    contractingprocess_id integer,
    tenderid text,
    title text,
    description text,
    status text,
    minvalue_amount numeric,
    minvalue_currency text,
    value_amount numeric,
    value_currency text,
    procurementmethod text,
    procurementmethod_rationale text,
    awardcriteria text,
    awardcriteria_details text,
    submissionmethod text,
    submissionmethod_details text,
    tenderperiod_startdate timestamp without time zone,
    tenderperiod_enddate timestamp without time zone,
    enquiryperiod_startdate timestamp without time zone,
    enquiryperiod_enddate timestamp without time zone,
    hasenquiries integer,
    eligibilitycriteria text,
    awardperiod_startdate timestamp without time zone,
    awardperiod_enddate timestamp without time zone,
    numberoftenderers integer,
    amendment_date timestamp without time zone,
    amendment_rationale text
);


ALTER TABLE public.tender OWNER TO tester;

--
-- Name: tender_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE tender_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tender_id_seq OWNER TO tester;

--
-- Name: tender_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE tender_id_seq OWNED BY tender.id;


--
-- Name: tenderamendmentchanges; Type: TABLE; Schema: public; Owner: tester; Tablespace: 
--

CREATE TABLE tenderamendmentchanges (
    id integer NOT NULL,
    contractingprocess_id integer,
    tender_id integer,
    property text,
    former_value text
);


ALTER TABLE public.tenderamendmentchanges OWNER TO tester;

--
-- Name: tenderamendmentchanges_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE tenderamendmentchanges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenderamendmentchanges_id_seq OWNER TO tester;

--
-- Name: tenderamendmentchanges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE tenderamendmentchanges_id_seq OWNED BY tenderamendmentchanges.id;


--
-- Name: tenderdocuments; Type: TABLE; Schema: public; Owner: tester; Tablespace: 
--

CREATE TABLE tenderdocuments (
    id integer NOT NULL,
    contractingprocess_id integer,
    tender_id integer,
    document_type text,
    documentid text,
    title text,
    description text,
    url text,
    date_published timestamp without time zone,
    date_modified timestamp without time zone,
    format text,
    language text
);


ALTER TABLE public.tenderdocuments OWNER TO tester;

--
-- Name: tenderdocuments_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE tenderdocuments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenderdocuments_id_seq OWNER TO tester;

--
-- Name: tenderdocuments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE tenderdocuments_id_seq OWNED BY tenderdocuments.id;


--
-- Name: tenderer; Type: TABLE; Schema: public; Owner: tester; Tablespace: 
--

CREATE TABLE tenderer (
    id integer NOT NULL,
    contractingprocess_id integer,
    tender_id integer,
    name text,
    identifier_scheme text,
    identifier_id text,
    identifier_legalname text,
    identifier_uri text,
    address_streetaddress text,
    address_locality text,
    address_region text,
    address_postalcode text,
    address_countryname text,
    contactpoint_name text,
    contactpoint_email text,
    contactpoint_telephone text,
    contactpoint_faxnumber text,
    contactpoint_url text
);


ALTER TABLE public.tenderer OWNER TO tester;

--
-- Name: tenderer_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE tenderer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenderer_id_seq OWNER TO tester;

--
-- Name: tenderer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE tenderer_id_seq OWNED BY tenderer.id;


--
-- Name: tendereradditionalidentifiers; Type: TABLE; Schema: public; Owner: tester; Tablespace: 
--

CREATE TABLE tendereradditionalidentifiers (
    id integer NOT NULL,
    contractingprocess_id integer,
    tenderer_id integer,
    scheme text,
    legalname text,
    uri text
);


ALTER TABLE public.tendereradditionalidentifiers OWNER TO tester;

--
-- Name: tendereradditionalidentifiers_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE tendereradditionalidentifiers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tendereradditionalidentifiers_id_seq OWNER TO tester;

--
-- Name: tendereradditionalidentifiers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE tendereradditionalidentifiers_id_seq OWNED BY tendereradditionalidentifiers.id;


--
-- Name: tenderitem; Type: TABLE; Schema: public; Owner: tester; Tablespace: 
--

CREATE TABLE tenderitem (
    id integer NOT NULL,
    contractingprocess_id integer,
    tender_id integer,
    itemid text,
    description text,
    classification_scheme text,
    classification_id text,
    classification_description text,
    classification_uri text,
    quantity integer,
    unit_name text,
    unit_value_amount numeric,
    unit_value_currency text
);


ALTER TABLE public.tenderitem OWNER TO tester;

--
-- Name: tenderitem_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE tenderitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenderitem_id_seq OWNER TO tester;

--
-- Name: tenderitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE tenderitem_id_seq OWNED BY tenderitem.id;


--
-- Name: tenderitemadditionalclassifications; Type: TABLE; Schema: public; Owner: tester; Tablespace: 
--

CREATE TABLE tenderitemadditionalclassifications (
    id integer NOT NULL,
    contractingprocess_id integer,
    tenderitem_id integer,
    scheme text,
    description text,
    uri text
);


ALTER TABLE public.tenderitemadditionalclassifications OWNER TO tester;

--
-- Name: tenderitemadditionalclassifications_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE tenderitemadditionalclassifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenderitemadditionalclassifications_id_seq OWNER TO tester;

--
-- Name: tenderitemadditionalclassifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE tenderitemadditionalclassifications_id_seq OWNED BY tenderitemadditionalclassifications.id;


--
-- Name: tendermilestone; Type: TABLE; Schema: public; Owner: tester; Tablespace: 
--

CREATE TABLE tendermilestone (
    id integer NOT NULL,
    contractingprocess_id integer,
    tender_id integer,
    milestoneid text,
    title text,
    description text,
    duedate timestamp without time zone,
    date_modified timestamp without time zone,
    status text
);


ALTER TABLE public.tendermilestone OWNER TO tester;

--
-- Name: tendermilestone_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE tendermilestone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tendermilestone_id_seq OWNER TO tester;

--
-- Name: tendermilestone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE tendermilestone_id_seq OWNED BY tendermilestone.id;


--
-- Name: tendermilestonedocuments; Type: TABLE; Schema: public; Owner: tester; Tablespace: 
--

CREATE TABLE tendermilestonedocuments (
    id integer NOT NULL,
    contractingprocess_id integer,
    tender_id integer,
    milestone_id integer,
    document_type text,
    documentid text,
    title text,
    description text,
    url text,
    date_published timestamp without time zone,
    date_modified timestamp without time zone,
    format text,
    language text
);


ALTER TABLE public.tendermilestonedocuments OWNER TO tester;

--
-- Name: tendermilestonedocuments_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE tendermilestonedocuments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tendermilestonedocuments_id_seq OWNER TO tester;

--
-- Name: tendermilestonedocuments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE tendermilestonedocuments_id_seq OWNED BY tendermilestonedocuments.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tester
--

ALTER TABLE ONLY award ALTER COLUMN id SET DEFAULT nextval('award_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tester
--

ALTER TABLE ONLY awardamendmentchanges ALTER COLUMN id SET DEFAULT nextval('awardamendmentchanges_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tester
--

ALTER TABLE ONLY awarddocuments ALTER COLUMN id SET DEFAULT nextval('awarddocuments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tester
--

ALTER TABLE ONLY awarditem ALTER COLUMN id SET DEFAULT nextval('awarditem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tester
--

ALTER TABLE ONLY awarditemadditionalclassifications ALTER COLUMN id SET DEFAULT nextval('awarditemadditionalclassifications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tester
--

ALTER TABLE ONLY budget ALTER COLUMN id SET DEFAULT nextval('budget_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tester
--

ALTER TABLE ONLY buyer ALTER COLUMN id SET DEFAULT nextval('buyer_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tester
--

ALTER TABLE ONLY buyeradditionalidentifiers ALTER COLUMN id SET DEFAULT nextval('buyeradditionalidentifiers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tester
--

ALTER TABLE ONLY contract ALTER COLUMN id SET DEFAULT nextval('contract_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tester
--

ALTER TABLE ONLY contractamendmentchanges ALTER COLUMN id SET DEFAULT nextval('contractamendmentchanges_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tester
--

ALTER TABLE ONLY contractdocuments ALTER COLUMN id SET DEFAULT nextval('contractdocuments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tester
--

ALTER TABLE ONLY contractingprocess ALTER COLUMN id SET DEFAULT nextval('contractingprocess_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tester
--

ALTER TABLE ONLY contractitem ALTER COLUMN id SET DEFAULT nextval('contractitem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tester
--

ALTER TABLE ONLY contractitemadditionalclasifications ALTER COLUMN id SET DEFAULT nextval('contractitemadditionalclasifications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tester
--

ALTER TABLE ONLY implementation ALTER COLUMN id SET DEFAULT nextval('implementation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tester
--

ALTER TABLE ONLY implementationdocuments ALTER COLUMN id SET DEFAULT nextval('implementationdocuments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tester
--

ALTER TABLE ONLY implementationmilestone ALTER COLUMN id SET DEFAULT nextval('implementationmilestone_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tester
--

ALTER TABLE ONLY implementationmilestonedocuments ALTER COLUMN id SET DEFAULT nextval('implementationmilestonedocuments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tester
--

ALTER TABLE ONLY implementationtransactions ALTER COLUMN id SET DEFAULT nextval('implementationtransactions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tester
--

ALTER TABLE ONLY planning ALTER COLUMN id SET DEFAULT nextval('planning_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tester
--

ALTER TABLE ONLY planningdocuments ALTER COLUMN id SET DEFAULT nextval('planningdocuments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tester
--

ALTER TABLE ONLY procuringentity ALTER COLUMN id SET DEFAULT nextval('procuringentity_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tester
--

ALTER TABLE ONLY procuringentityadditionalidentifiers ALTER COLUMN id SET DEFAULT nextval('procuringentityadditionalidentifiers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tester
--

ALTER TABLE ONLY publisher ALTER COLUMN id SET DEFAULT nextval('publisher_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tester
--

ALTER TABLE ONLY supplier ALTER COLUMN id SET DEFAULT nextval('supplier_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tester
--

ALTER TABLE ONLY supplieradditionalidentifiers ALTER COLUMN id SET DEFAULT nextval('supplieradditionalidentifiers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tester
--

ALTER TABLE ONLY tender ALTER COLUMN id SET DEFAULT nextval('tender_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tester
--

ALTER TABLE ONLY tenderamendmentchanges ALTER COLUMN id SET DEFAULT nextval('tenderamendmentchanges_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tester
--

ALTER TABLE ONLY tenderdocuments ALTER COLUMN id SET DEFAULT nextval('tenderdocuments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tester
--

ALTER TABLE ONLY tenderer ALTER COLUMN id SET DEFAULT nextval('tenderer_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tester
--

ALTER TABLE ONLY tendereradditionalidentifiers ALTER COLUMN id SET DEFAULT nextval('tendereradditionalidentifiers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tester
--

ALTER TABLE ONLY tenderitem ALTER COLUMN id SET DEFAULT nextval('tenderitem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tester
--

ALTER TABLE ONLY tenderitemadditionalclassifications ALTER COLUMN id SET DEFAULT nextval('tenderitemadditionalclassifications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tester
--

ALTER TABLE ONLY tendermilestone ALTER COLUMN id SET DEFAULT nextval('tendermilestone_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tester
--

ALTER TABLE ONLY tendermilestonedocuments ALTER COLUMN id SET DEFAULT nextval('tendermilestonedocuments_id_seq'::regclass);


--
-- Data for Name: award; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY award (id, contractingprocess_id, awardid, title, description, status, award_date, value_amount, value_currency, contractperiod_startdate, contractperiod_enddate, amendment_date, amendment_rationale) FROM stdin;
2	2	\N	\N	\N	none	\N	\N	\N	\N	\N	\N	\N
17	18	\N	\N	\N	none	\N	\N	\N	\N	\N	\N	\N
18	20	\N	\N	\N	none	\N	\N	\N	\N	\N	\N	\N
14	14	IO-009KDH999-N54-2015	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato a la empresa Sifra y Asociados, S. A. de C. V., por un importe de $3'286,659.95, monto mas IVA, por resultar ser la propuesta que al ser evaluada técnica y ecómicamente, asegura las mejores condiciones disponibles en cuanto a precio, calidad, financiamiento, oportunidad; toda vez que es la empresa que presenta los costos unitarios mas bajos.	active	2015-08-14 00:00:00	3286659.95	MXN	\N	\N	\N	
13	13	LO-009KDH999-T52-2015	Acta de emisión de fallo	Con fundamento en lo dispuesto en el art. 39, fracción III de la LOPSRM, se adjudica el contrato a la empresa AUTODESK, INC., por un impote de $136´749,542.27, monto sin considerar el IVA, por resultar la propuesta que al ser evaluada técnica y económicamente, obtuvo el puntaje más alto acorde al mecanismo de evalución previsto en la convocatoria.	active	2015-10-09 00:00:00	136749542.27	MXN	\N	\N	\N	
16	16	LO-009KDH999-N87-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato a Consultoría, Supervisión Técnica y Operación en Sistemas, S. A. de C. V., por un importe de $12'043,340.90, monto sin considerar el IVA, por resultar ser la propuesta que al ser evaluada técnica y ecómicamente, cumplió con los requisitos previstos en la convocatoria. 	active	2015-12-23 00:00:00	12043340.90	MXN	\N	\N	\N	
1	1	LO-009KDH999-N5-2014	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 39 o fracción III de la LOPSRM se adjudica el contrato a la empresa GEXIC, S. A. de C. V., por un importe de $34´245,066.00 sin IVA, por resultar ser la propuesta que al ser evaluada técnica y económicamente, obtuvo el untaje mas alto acorde al mecanismo de evaluaciones previstos en la convocatoria.	active	2014-12-18 00:00:00	34245066	MXN	\N	\N	\N	
15	15	LO-009KDH999-N86-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato a la empresa Consultoría, Supervisión Técnica y Operación en Sistemas, S. A. de C. V., por un importe de $9'720,916.92, monto sin considerar el IVA, por resultar ser la propuesta que al ser evaluada técnica y ecómicamente, cumplió con los requisitos previstos en la convocatoria. 	active	2015-12-23 00:00:00	9720916.92	MXN	\N	\N	\N	
10	9	LO-009KDH999-N45-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato a la empresa Manejo Integral de Cuencas, S.A. de C.V., por un importe de $18'934,197.76, monto sin considerar el IVA, por resultar ser la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria.	active	2015-07-06 00:00:00	18934197.76	MXN	\N	\N	\N	
8	10	LO-009KDH999-N46-2015	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato la empresa Supervisión y Control de Fauna, S.A. de C.V. , por un importe de $14,382,969.27, monto sin considerar el IVA, por resultar se la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2015-07-06 00:00:00	14382969.27	MXN	\N	\N	\N	
5	5	SO-09KDH999-N26-2015	Oficio DCAGI/SC/GC/037/2015 del 04 d efebrero de 2015	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 27 fracción III y 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, 28, 29 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3. del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., y a solicitud expresa de la Dirección Corporativa de Infraestructura, se le adjudica de manera directa la prestación del servicio relacionado con la obra pública a Sistemas Integrales de Gestión Ambiental, S.C.	active	2015-02-04 00:00:00	465000.00	MXN	\N	\N	\N	
11	11	LO-009KDH999-N42-2015	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato la empresa RAGAMEX, S.A. de C.V. y Oliverio González Alafita , por un importe de $11,924,906.62, monto sin considerar el IVA, por resultar se la propuesta que al ser evaluada técnica y económicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2015-07-06 00:00:00	11924906.62	MXN	\N	\N	\N	
7	6	IO-009KDH999-N10-2015	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato la empresa Avalúos, Evaluaciones y Proyectos , S.A. de C.V., por un importe de $2,156,884.20, monto sin considerar el IVA, por resultar se la propuesta que al ser evaluada técnica y económicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2015-03-09 00:00:00	2156884.2	MXN	\N	\N	\N	
20	17	IO-009KDH999-E96-2015	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato la empresa BCG The Boston Consulting Group, S. C., BDG The Boston Consulting Group I y GMBH & CO. KG , por un importe de $79,000,000.00, monto sin considerar el IVA, por resultar se la propuesta que al ser evaluada técnica y económicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2016-03-11 00:00:00	79000000	MXN	\N	\N	\N	
6	7	IO-009KDH999-N41-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato a la empresa Consorcio IUYET, S.A. de C.V.  , por un importe de $33,577,144.97, monto sin considerar el IVA, por resultar se la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2015-07-14 00:00:00	33577144.97	MXN	\N	\N	\N	
9	8	LO-009KDH999-N47-2015	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato al consorcio integrado por Acciones Grupo Oro, S.A. de C.V. y Constructora Grupo de Oro, S.A. de C.V. , por un importe de $112,046,320.57, monto sin considerar el IVA, por resultar se la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria.	active	2015-08-28 00:00:00	112046320.57	MXN	2015-09-10 00:00:00	2016-06-04 00:00:00	\N	
23	21	LO-009KDH999-N78-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato al consorcio integrado por Omega Construcciones Industriales, S. A. de C. V., Calzada Construcciones, S. A. de C. V. y Construcciones y Dragados del Sureste, S. A. de C. V., por un importe de $493'916,475.00, monto sin considerar el IVA, por resultar ser la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2015-12-16 00:00:00	493916475	MXN	\N	\N	\N	
39	39	1			active	\N	1627500.00		\N	\N	\N	
22	22	LO-009KDH999-N79-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato a la empresa Coconal S. A. P. I. de C. V., por un importe de $1,762'803,241.34, monto sin considerar el IVA, por  ser la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2015-12-11 00:00:00	1762803241.34	MXN	\N	\N	\N	
21	23	LO-009KDH999-N80-2015	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato al consorcio integrado por Transportaciones y Construcciones Tamaulipecos, S. A. de C. V. e Inmobiliarios Mexicanos, S. A. de C. V., por un importe de $608'275,577.50, monto sin considerar el IVA, por resultar ser la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2015-12-16 00:00:00	608275577.50	MXN	\N	\N	\N	
19	19	IO-009KDH999-E15-2016	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato la empresa Construcciones Aldesem, S. A. de C. V., por un importe de $10,961,673.55, monto sin considerar el IVA, por resultar se la propuesta que al ser evaluada técnica y económicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2016-03-07 00:00:00	10961673.55	MXN	\N	\N	\N	
25	24	 LO-009KDH999-N20-2015	Construcción de accesos y plataformas para exploración geotécnica para la pista número 2 del Nuevo Aeropuerto Internacional de la Ciudad de México.	Construcción de accesos y plataformas para exploración geotécnica para la pista número 2 del Nuevo Aeropuerto Internacional de la Ciudad de México.	active	\N	5038656.00	MXN	\N	\N	\N	
24	25	LO-009KDH999-T15-2015	Acta de emisión de fallo	Con fundamento en lo dispuesto en el art. 39, fracción III de la LOPSRM se adjudica el contrato al consorcio integrado por Advanced Ligistic Group, S. A. U. e Indra Business Consulting México, S. A. de C. V., por un importe de $11´650,000.00, por resultar ser la propuesra que al ser evaluada técnica y económicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria.	active	2015-05-14 00:00:00	11650000	MXN	\N	\N	\N	
4	4	SO-009KDH999-N24-2015	Oficio de notificación de Adjudicación Directa DCAGI/SC/GC/029/2015 del 04-02-2015	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 27 fracción III y 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, 28, 29 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3. del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., y a solicitud expresa de la Dirección Corporativa de Infraestructura, se le adjudica de manera directa la prestación del servicio relacionado con la obra pública al Instituto de Investigaciones y Capacitación para las Ciencias Biológicas, A.C. 	active	2015-02-04 00:00:00	449999.86	MXN	\N	\N	\N	
12	12	LO-009KDH999-N50-2015	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 39, fracción III de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, se adjudica el contrato al consorcio integrado por las empresas Calzada Construcciones, S. A. de C. V. y Construcciones y Dragados del Sureste, S. A. de C. V., por un importe de $192,522,597.09 (ciento noventa y dos millones quinientos veinticinco mil quinientos noventa y siete Pesos 09/100 M.N.), monto sin considerar el IVA, por resultar ser la propuesta que al ser evaluada técnica y economicamente, obtuvo el puntaje más alto acorde al mecanismo de evalación previsto en la convocatoria 	active	2015-09-28 00:00:00	192522597.09	MXN	\N	\N	\N	
3	3	SO-009KDH999-N18-2015	Oficio de notificación de Adjudicación Directa	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 27 fracción III y 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, 28, 29 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3. del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., y a solicitud expresa de la Dirección Corporativa de Infraestructura, se le adjudica de manera directa la prestación del servicio relacionado con la obra pública a Especialistas Ambientales S.A. de C.V.	active	2015-02-10 00:00:00	550000	MXN	\N	\N	\N	
37	37	AA-009KDH999-E53-2016	Oficio número DCAGI/SC/GC/210.1/2015 del 30/11/2015	Con fundamento en el artículo 134 de la CPEUM, 42 de la LAASSP, 28, 29, 30, 31 y 33 de la LFEP, numeral 1.4.3.1 del Manual de Organización de GACM, se adjudica el contrato al ciudadano Alan Mauricio Ramírez Graniel	active	\N	320361.43	MXN	\N	\N	\N	
44	44	\N	\N	\N	none	\N	\N	\N	\N	\N	\N	\N
38	38	AO-009KDH999-E38-2016	Oficio número DCAGI/SC/GC/0168/2015 del 08/09/2015	Con fundamento en el artículo 134 de la CPEUM, 42, fracción X de la LOPSRM, 28, 29, 30, 31 y 33 de la LFEP, numeral 1.4.3.1 del Manual de Organización de GACM, se adjudica el contrato al ciudadano Enrique Álvaro Tamez González.	active	2015-08-09 15:00:00	2104525.86	MXN	\N	\N	\N	
27	27	SA-009KDH999-N13-2015	Oficio UNCP/309/BMACP/0796/2014 de fecha 26 de septiembre de 2014	Con fundamento en lo dispuesto en los artículos 27 Bis, primer párrafo de la Ley de Obras Públicas y Servicios Relacionados con las Mismas; 52, primer párrafo y 53, quinto párrafo de su reglamento; y 34, fracción XVII del Reglamento Interior de la Secretaría de la Función Pública. 	active	2014-09-26 00:00:00	455149.56	MXN	\N	\N	\N	
63	63	\N	\N	\N	none	\N	\N	\N	\N	\N	\N	\N
64	64	\N	\N	\N	none	\N	\N	\N	\N	\N	\N	\N
41	41	1			active	\N	189000.00	DLLS	\N	\N	\N	
40	40	AO-009KDH999-E39-2016			active	\N	1465517.24		\N	\N	\N	
42	42	1			active	\N	1403017.24	MNX	\N	\N	\N	
43	43	AO-009KDH999-E34-2016			active	\N	1898750.00	MNX	\N	\N	\N	
45	45	AO-009KDH999-E31-2016			active	\N	1683620.69	MNX	\N	\N	\N	
46	46	AO-009KDH999-E40-2016			active	\N	2104525.86	MXN	\N	\N	\N	
65	65	-			none	\N	2697000.00	MXN	\N	\N	\N	
62	62	-			active	\N	67996	MXN	\N	\N	\N	
47	47	AO-009KDH999-E46-2016			active	\N	176400.00	USD	\N	\N	\N	
48	48	AO-009KDH999-E14-2016			active	\N	18726530.31	MXN	\N	\N	\N	
49	49	AO-009KDH999-E55-2016			active	\N	620689.66	MXN	\N	\N	\N	
66	66	-			none	\N	8991688.20	MXN	\N	\N	\N	
57	57	AD-SRO-DCAGI-SC-010/16	Acta de emisión de fallo	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 27 fracción III y 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, 28, 29 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3. del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., y a solicitud expresa de la Dirección Corporativa de Infraestructura, se le adjudica de manera directa la prestación del servicio relacionado con la obra pública a Sistemas Integrales de Gestión Ambiental, S.C.	active	\N	1627500	MXN	\N	\N	\N	
28	28	SA-009KDH999-N12-2015	Oficio UNCP/309/BMACP/0796/2014 de fecha 26 de septiembre de 2014	Con fundamento en lo dispuesto en los artículos 27 Bis, primer párrado de la Ley de Obras Públicas y Servicios Relacionados con las Mismas; 52, primer párrafo y 53, quinto párrafo de su reglamento; y 34, fracción XVII del Reglamento Interior de la Secretaría de la Función Pública. 	active	2014-09-26 00:00:00	539531.22	MXN	\N	\N	\N	
29	29	SO-009KDH999-N74-2015	Oficio DCAGI/SC/GC/16B/2015 del 28 de enero de 2015	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 42 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, 28, 29 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3.1 del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., y a solicitud expresa de la Dirección Corporativa de Infraestructura, se le adjudica de manera directa la prestación del servicio relacionado con la obra pública a Grupo de Ingenieía en Consultoría en obras, S. A. de C. V. 	active	2015-01-28 00:00:00	16708712.52	MXN	\N	\N	\N	
58	58	SO-09KDH999-N26-2015	Oficio DCAGI/SC/GC/038/2016 del 12 d e febrero de 2016	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 42 de la Ley de Adquisiciones, Arrendamiento y Servicios del Sector Público, 28, 29 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3.1 del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.,  expresa de la Dirección Corporativa de Infraestructura, se le adjudica de manera directa la prestación del Servicio de Ambulancia para el Traslado de Personas, para el Programa de Empleo Temporal (PET) 	active	2015-02-04 00:00:00	259000	MXN	\N	\N	\N	
30	30	LO-009KDH999-N16-2015	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato a la empresa Currie & Brown México S. A. de C. V., por un importe de $7,582,404.32 monto sin considerar el IVA, por ser la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria.	active	2015-04-30 00:00:00	7582404.32	MXN	\N	\N	\N	
59	59	1		Oficio de designación de la SFP No. UNCP/309/BMACP/0262/2015 de fecha 30 de abril de 2015	active	2015-04-30 00:00:00	463501.20	MXN	\N	\N	\N	
31	31	IO-009KDH999-N51-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudicó el contrato a la empresa F GLEZ CONSULTORES Y ASOCIADOS, S.A. DE C.V., por un importe de $8´150,489.03, monto sin considerar el IVA, por resultar se la propuesta que al ser evaluada técnica y ecómicamente, asegura las mejores condiciones disponibles en cuanto a precio, calidad, financiamiento, oportunidad; toda vez que es la empresa que presenta los costos mas bajos.	active	2015-07-16 00:00:00	8150489.03	MXN	\N	\N	\N	
32	32	SA009KDH99-N73-2015	Oficio DCAGI/SC/GC/055/2015 de fecha 30 de junio de 2015	Con fundamento en el art. 134 de la Constitución, art. 26 fracción II de la LAASSP se le adjudica de manera directa el contrato.	active	2015-06-30 00:00:00	247200.64	MXN	\N	\N	\N	
67	67	1			none	\N	157168157.92	MNX	\N	\N	\N	
60	60	DCAGI/SC/GC/035/2015	Notificación de Adjudicación No. oficio DCAGI/SC/GC/035/2015 de fecha 15 de julio de 2015	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 27 fracción III y 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, 28, 29 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3. del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., y a solicitud expresa de la Dirección Corporativa de Infraestructura, se le adjudica de manera directa la prestación del servicio relacionado con la obra pública a la empresa PORTA BAÑOS 2000, S.A. DE C.V.	active	2015-07-15 00:00:00	558618.50	MXN	\N	\N	\N	
68	68	1			active	\N	6610000.00	 MNX 	\N	\N	\N	
69	69	1			active	\N	55525000000.00	MNX	\N	\N	\N	
70	70	1			active	\N	152849934	MNX	\N	\N	\N	
71	71	1			active	\N	0	MNX	\N	\N	\N	
72	72	1			active	\N	30100000.00	MNX	\N	\N	\N	
73	73	1			active	\N	22440896.40	MNX	\N	\N	\N	
53	53	IA-009KDH999-E95-2015	Acta de Fallo del 28 de enero de 2016	Con fundamento en el artículo 36 BIS de la Ley de Adquisisciones, Arrendamientos y Servicios del Sector Público se Adjudica el contrato a la persona Moral Muños Manzo y Ocampo, S.C. por un importe de $ 20,880,000.00 (Veinte Millones Ochocientos Ochenta Mil Pesos 00/100 M.N.) monto que incluye IVA.  Por resultar ser la propuesta que al ser evaludada Técnica y Ecónomicamente, asegura las mejores condiciones disponibles en cuanto a precio, calidad, financiamiento, oportunidad y que obtuvo el puntaje mas alto.	active	2016-01-28 00:00:00	18000000.00	MXN	\N	\N	\N	
74	74	1			active	\N	1206165	MNX	\N	\N	\N	
75	75	1			active	\N	8761818.10	MNX	\N	\N	\N	
80	80	IA-009KDH999-N31-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 36 BIS, de la LAASSP, se adjudicó el contrato a la empresa VÁZQUEZ NAVA Y CONSULTORES, S.C., por un importe de $19´952,000.00, incluyendo el IVA, por resultar ser la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria.	active	2015-05-18 00:00:00	17200000	MXN	\N	\N	\N	
107	107	SO-009KDH999-N3-2015	Oficio DCAGI/SC/GC/030/2015 del 04 de febrero de 2015	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 27 fracción III y 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, 28, 29 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3. del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., y a solicitud expresa de la Dirección Corporativa de Infraestructura, se le adjudica de manera directa la prestación del servicio relacionado con la obra pública a Sistemas Integrales de Gestión Ambiental, S.C.	active	2015-02-04 00:00:00	374999.10	MXN	\N	\N	\N	
33	33	AA-009KDH999-E4-2016	Oficio de notificación de Adjudicación Directa DCAGI/SC/GC/0056/2015 del 31-07-2015	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 41 fracción I de la Ley de Adquisiciones, Arrendamientos y Servicios del sector público, 71 y 72 fracción II de su Reglamento, 28, 29, 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3.1 del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., por instrucciones del Subdirector de Contrataciones y de la solicitud efectuada por la misma, que efectuó la Subdirección de Contrataciones, en la que solicitó se pusiera a consideración del Comité de Adquisiciones, Arrendamientos y Servicios de GACM, a fin de que se dictaminara la excepción de licitación para la contratación Vía Adjudicación Directa, del "TESTIGO SOCIAL ING. JORGE CRUZ MÉNDEZ, PARA ATESTIGUAR EL PROCEDIMIENTO DE LICITACIÓN PÚBLICA INTERNACIONAL BAJO LA COBERTURA DE LOS TRATADOS DE LIBRE COMERCIO, CONSISTENTE EN "DISEÑAR E INSTRUMENTAR EL MODELO VIRTUAL DE INFORMACIÓN PARA LA CONSTRUCCIÓN DEL BIM DEL NAICM"; por lo que, en la Séptima Sesión Ordinaria del Comité de Adquisiciones, de GACM de fecha 30 de julio de 2015, fue dictaminada procedente la excepción, de la que se adjudicó al Ing. Jorge Jiménez Méndez	active	2015-07-31 00:00:00	432601.12	MXN	\N	\N	\N	
51	51	AO-009KDH999-E18-2016	Oficio DCAGI/SC/GC/0210/2015 del 30 de noviembre de 2015	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 27 fracción III y 41, 42 fracción X de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, 28, 29 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3.1 del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., y a solicitud expresa de la Dirección Corporativa de Infraestructura, se le adjudica de manera directa la prestación del servicio relacionado con la obra pública a Constructo Mexicana de Infraestructura, S. A.	active	2015-11-30 00:00:00	690000.00	MXN	\N	\N	\N	
34	34	IO-009KDH999-N43-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato a la empresa IMPULSORA DE ENLACE EMPRESARIAL CATENA, S.A. DE C.V. , por un importe de $7´062,852.40, monto sin considerar el IVA, por resultar seR la propuesta que al ser evaluada técnica y ecómicamente, asegura las mejores condiciones disponibles en cuanto a precio, calidad, financiamiento, oportunida; toda vez que es la empresa que presenta los costos unitarios mas bajos.	active	2015-06-16 00:00:00	7062852.40	MXN	\N	\N	\N	
61	61	-	Obras de Excavación de prueba, Losa experimental y prueba de Pilotes para el El Edificio Terminal y Torre de Control del NAICM	Obras de Excavación de prueba, Losa experimental y prueba de Pilotes para el El Edificio Terminal y Torre de Control del NAICM	active	\N	0	MXN	\N	\N	\N	
35	35	IO-009KDH999-N30-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 46 de la LAASSP se adjudicó el contrato a la empresa CESC CONSULTORÍA,S.C., por un importe de $14'964,000.00, monto incluye el IVA. 	active	2015-06-10 00:00:00	14964000.00	MXN	\N	\N	\N	
36	36	IO-009KDH999-N75-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III, 44 fracción III segundo párrafo de la LOPSRM,se adjudica el contrato a la empresa SERVICIOS FORESTALES DE HIDALGO, SERFORH, S.C., por un importe de $1'495,559.05, sin incluir el IVA, por resultar ser la propuesta que al ser evaluada técnica y ecómicamente, asugura las mejores condiciones disponibles en cuanto a precio calidad y financiamiento. 	active	2015-09-28 00:00:00	1495559.05	MXN	\N	\N	\N	
50	50	IO-009KDH999-N82-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM,se adjudicó el contrato a la empresa Servicios de Ingeniería, Edificación y Construcción Pesada, S.A. de C.V., por un importe de $8'385,420.04, monto sin considerar el IVA, por resultar ser la propuesta que al ser evaluada técnica y ecómicamente, asegura las mejores condiciones disponibles en cuanto a precio, calidad, financiamiento. 	active	2015-11-25 00:00:00	8385420.04	MXN	\N	\N	\N	
52	52	AA-009KDH999-E58-2016	Oficio no. DCAGI/SC/166.1/2015 de fecha del 24 de Septiembre de 2015	Con Fundamento en el Artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 41 fracción I de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público, 71 y 72 fracción III de su Reglamento, 28, 29, 30, 31 y 33 de la Ley Federal de Entidades Paraestatales, numero 1.4.3.1 del Manual de Organización de la Empresa de participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S. A. de C. V.   con el fin de que se contrate via Adjudicación Directa "El Servicio de Testigo Social para que Atestigüe la Etapas del Procedimiento de la Licitación Pública Nacional de Obra Pública de Carga, Acarreo y Descarga Dentro y Fuera del Polígono del Material Existente, Producto de Depósitos de Demoliciones y Desazolve, Incluye Conformación del Terreno donde se Construirá el Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM) para el NAICM", se Adjudica a el Instituto Mexicano de Auditoría Técnica, A. C.	active	2015-07-31 00:00:00	332975.00	MXN	\N	\N	\N	
96	96	1			active	\N	0		\N	\N	\N	
86	86	-			active	\N	7512904.17	MXN	\N	\N	\N	
87	87	-			active	\N	163184.04	MXN	\N	\N	\N	
88	88	-			active	\N	8761818.10	MXN	\N	\N	\N	
97	97	|			active	\N	0		\N	\N	\N	
89	89	-			active	\N	0	MXN	\N	\N	\N	
98	98	1			active	\N	0		\N	\N	\N	
105	105	1			active	\N	34800000.00	MNX	\N	\N	\N	
100	100	1			active	\N	858330000.00	MNX	\N	\N	\N	
101	101	1			active	\N	227520000.00	MNX	\N	\N	\N	
104	104	DCAGI/SC/GC/052/2015	Oficio de Adjudicación del 6-07-2015	En la Tercera Sesión Extraordinaria del Comité de Adquisiciones de GACM de fecha 29 de junio de 2015, fue dictaminada procedente la excepción de Licitación Pública para la contratación vía Adjudicación Directa.	active	2015-07-06 00:00:00	5840518.00	MNX	\N	\N	\N	
93	93	-			active	\N	0		\N	\N	\N	
94	94	-			active	\N	14925328.00	MXN	\N	\N	\N	
106	106	SO-009KDH999-N32-2015			active	\N	29233731	MXN	\N	\N	\N	
85	85	-			none	\N	27582750		\N	\N	\N	
77	77	AA-009KDH999-E2-2016	Oficio de notificación de la adjudicación	No aplica	none	\N	800000	MXN	\N	\N	\N	
54	54	AA-009KDH999-E80-2016	Oficio  número DCAGI/SC/GC/039/2016 DEL 12 DE FEBRERO DE 2016.	Con fundamento en lo dispuesto en el ARTICULO 134 DE LA Constitución Politica de los estados Unidos Mexicanos, 42 de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público, 28, 29, 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, numeral 1.4.3.1 del Manual de Organización de la Empresa de Paricipación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de Mexico, S. A. de C. V., asi como de la solicitud que con número DCAGI/SA/GAR/014/2016, efectuara la Gerencia de Administración de Recursos, para la contratación del "Servicisio para la Construcción, Desarrollo y Diseño de la Pagina WEB de GACM" y de conformidad con su cotización de fecha 28 de enero de 2016, por medio de la cual oferta el servicio solicitado, siendo esta la oferta solvente mas baja, por lo anterior la contratación vía Adjudicación Directa se notifica en los siguientes términos........	active	2016-08-12 00:00:00	207000.00	MXN	\N	\N	\N	
55	55	-	Oficio número DCAGI/SC/GC/023/2016 de fecha 3 de febrero de 2016	Con fundamento en el Articulo 134 de la Cosntitucion Poltica de los estados Unidos Mexicanos, 42 de la Ley de Adquisisciones, Arrendamientos y Servicios del Sector Público, Numeral 1.4.3.1 del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S. A. de C. V. , se le adjudica en forma directa  al Instituto Mexicano de Auditoria S. C:, el servicio para llevar a cabo el testimonio del procedimiento de Licitación Pública Nacional, del proyecto denominado "Excavación de Prueba, Losa Exprimental y Prueba de Pilotes para el Edificio terminal y Torre de Control".	active	2016-02-03 00:00:00	269225.44	MXN	\N	\N	\N	
56	56	LO-009KDH999-E94-2015	Acta de emisión de fallo 10 de Febrero de 2016	Con fundamento en lo dispuesto en el artículo 39 o fracción III de la LOPSRM se adjudica el contrato a la empresa Consorcio IUYET, S.A. de C.V., por un importe de $41´324,450.46 sin IVA, por resultar ser la propuesta que al ser evaluada técnica y económicamente, cumplio con todos los requisitos en la convocatoria.	active	2016-02-10 00:00:00	41324450.46	MXN	\N	\N	\N	
99	99	1	Oficio de notificación de Adjudicación Directa DGAE/212/941/2014 de 30 de septiembre de 2014, la Dirección General de Auditorías Externas designa como auditor externo para dictaminar los estados financieros 2014 de la entidad al prestador de servicios. 	Con fundamento en los artículos 37, fracción IV, VII, X y XXVII, de la Ley Organica de la Administración Pública Federal, en relación con el artículo Segundo Transitorio del Decreto por el que se reforma, adicionan y derogan diversas disposiciones de la Ley Organica de la Administración Pública Federal, publicado en el DOF el 2 de enero de 2013; 6 de la Ley Federal de Presupeusto y Responsabilidad Hacendaria; 306 y 307 del Reglamento de la Ley Federal de Presupeusto y Responsabilidad Hacendaria; 50 fracción I del Reglamento Interior de la Secretaría de la Función Público y 5, 6 y 23 de los lineamientos para al designación, control y evaluación del desempeño de las firmas de auditores externos publicados en el DOF el 22 de octubre de 2010 y modificados mediante acuerdo publicado en el citado organo oficial de difusión de fecha 8 de noviembre 2011.  	active	\N	46371.00		\N	\N	\N	
90	90	-	Oficio DCAGI/SC/GC/0208/2015 de fecha 30 de noviembre de 2015	En la Séptima Sesión Extraordinaria del Cómite de Adquisiciones  de GACM de fecha 27 de noviembre  mediante acuerdo CAAS/GACM-038/15 fue dictaminada procedente la excepcion de Licitacion Publica para la contratacion Via Adjudicación directa  con su representada...	active	2015-11-30 00:00:00	625917655.58	MXN	\N	\N	\N	
91	91	IO009KDH99-N83-2015	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 39, fracción III y 44 fracción III de la LOPSRM,se adjudicó el contrato a la empresa INE, S.A. de C.V., por un importe de $8´090,576.52, monto sin considerar el IVA, por resultar se la propuesta que al ser evaluada técnica y ecómicamente, asegura las mejores condiciones disponibles en cuanto a precio calidad y financiamiento.	active	2015-11-24 00:00:00	8090576.25	MXN	\N	\N	\N	
79	79	IA-009KDH999-E23-2016	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 36 BIS, fracción III de la LAASSP,se adjudicó el contrato a la empresa VAZQUEZ NAVA CONSULTORES, por un importe de mínimo de $18,800,000.00 y máximo de $35,000,000.00 para el ejercicio 2016 y un monto mínimo de $20,500,000.00 y máximo $38,500,000.00 para el ejercicio 2017, monto sin considerar el IVA, por resultar se la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria	active	2016-03-18 00:00:00	35000000	MXN	\N	\N	\N	
92	92	-	Acta de Emision de Fallo, del 12 de marzo del 2015.	Con fundamento en lo dispuesto en el artículo 36 bis de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público, se adjudica el contrato a la empresa  IDT EN SISTEMAS DE INFORMACION S.A. DE C.V.POR UN IMPORTE DE $ 1,295.000.00 SIN CONSIDERAR EL IVA POR RESULTAR SER LA PROPUESTA MAS BAJA...	active	2015-03-12 00:00:00	1295000.00	MXN	\N	\N	\N	
102	102	ITP-SRO-DCAGI-SC-027/15	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM,se adjudicó el contrato a la empresa JACE INTERNACIONAL S.A. DE C.V., por un importe de $12,642,390.01, monto sin considerar el IVA, por resultar ser la propuesta que al ser evaluada técnica y ecómicamente, asegura las mejores condiciones disponibles en cuanto ap precio, calidad, financiamiento, oportunidad; toda vez que es la empresa que presenta los costos unitarios más bajos.	active	2015-05-12 00:00:00	12642390	MNX	\N	\N	\N	
103	103	SA-009KDH999-N2-2015 		Del analisis de las propuestas presentadas, se determina que la propuesta presentada por la empresa ARGU Asesores en Capital Humano S.C., es la qie ofrece las mejores condiciones para el Grupo Aeroportuarioo de la Ciudad de México S.A. de C.V.	active	2014-11-24 00:00:00	37181503.72	MNX	\N	\N	\N	
95	95	LA-009KDH999-E29-2016	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 36, Bis de la LAASSP, se adjudica el contrato a la empresa Global Touristic Agency, S. A. de C.V., por resultar ser la propuesta que al ser evaluada  técnica y ecómicamente, asegura las mnlores condiciones diposbiles en cuanto a precio, calidad, financiamiento y oportunidad.	active	2016-04-25 00:00:00	26427200	MXN	\N	\N	\N	
78	78	IA-009KDH999-N31-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 36 BIS, de la LAASSP, se adjudicó el contrato a la empresa VÁZQUEZ NAVA Y CONSULTORES, S.C., por un importe de $19´952,000.00, incluyendo el IVA, por resultar ser la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria	active	2015-05-18 00:00:00	17200000	MXN	\N	\N	\N	
109	109	ITP-OP-DCAGI-SC-014/15	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39 de la LOPSRM,se adjudicó el contrato a la empresa  INGENIEROS CIVILES ASOCIADOS, S.A. DE C.V., por un importe de $8,129,259.88, monto sin considerar el IVA, por resultar la propuesta solvente que cumple técnicamente con todos los requisitos legales y técnica propone el costo más bajo.	active	2015-03-04 00:00:00	8129259.88	MXN	\N	\N	\N	
81	81	IO009KDH999-T3-2014	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudicó el contrato al consorcio conformado por NACO NETHERLANDS AIRPORT CONSULTANTS, B.V., SACMAG DE MÉXICO, S. A. DE C. V. y TADCO CONSTRUCTORA, S. A. DE C. V., cuyo importe de su proposición es de: $1,079,335,930.23, más el 16% del impuesto al valor agregado de $172,693,748.84, lo que arroja un total de $1,252,029,679.07, por resultar ser la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria.	active	2015-01-14 00:00:00	1079335930.23	MXN	\N	\N	\N	
82	82	IO-009KDH999-E45-2016	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato a la empresa CENTRO DE ESTUDIOS DE URBANISMO Y ARQUITECTURA, S.A. DE C.V., por un importe de $8´380,018.06, monto sin considerar el IVA, por resultar se la propuesta que al haber sido evaluada técnicamente,H90 fue la solvente mas baja	active	2016-05-03 00:00:00	8380018.06	MXN	\N	\N	\N	
83	83	IO009KDH99-N53-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción de la LOPSRM,se adjudicó el contrato a la empresa OMNIBUS y TRANSPORTES TERRESTRES EJECUTIVOS, S.A. de C.V., por un importe de $4´880,00.00, monto sin considerar el IVA, por resultar se la propuesta que al ser evaluada técnica y ecómicamente, asegura las mejores condiciones disponibles en cuanto a precio calidad y financiamiento	active	2015-07-09 00:00:00	4880000.00	MXN	\N	\N	\N	
84	84	IO-009KDH999-N81-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III Y 44 fracción de la LOPSRM,se adjudica el contrato a la empresa OMNIBUS Y TRANSPORTES TERRESTRES EJECUTIVOS, S.A. DE C.V., por un importe de $ 1'176,000.00, monto sin considerar el IVA, por ser la mepresa que cumplió con todos los requisitos solicitados en la convocatoria en el acto de aclaraciones	active	2015-10-21 00:00:00	1176000.00	MXN	\N	\N	\N	
110	110	ITP-SRO-DCAGI-SC-027/15	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM,se adjudicó el contrato a la empresa JACE INTERNACIONAL S.A. DE C.V., por un importe de $12,642,390.01, monto sin considerar el IVA, por resultar ser la propuesta que al ser evaluada técnica y ecómicamente, asegura las mejores condiciones disponibles en cuanto ap precio, calidad, financiamiento, oportunidad; toda vez que es la empresa que presenta los costos unitarios más bajos.	active	2015-05-12 00:00:00	12642390.01	MXN	\N	\N	\N	
111	111	IO-009-KDH999-N49-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el art. 39, fracción III de la LOPSRM se adjudica el contrato a Omnibus y transportes Terrestres Ejecutivos, S.A. de C.V. por un importe de $4,880,000.00 ya que resultó solvente y porque reúne los criterios de evaluación establecidos en la convocatoria, así como las condiciones legales, técnicas, económicas y administrativas requeridas por la convocante.	active	2015-07-09 00:00:00	4880000.00	MXN	\N	\N	\N	
76	76	Oficio DCAGI/SC/041/2014	Notificación de Adjudicación No. oficio DCAGI/SC/041/2014 de fecha 01 de diciembre de 2014	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 27 fracción III y 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, 28, 29 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3. del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., y a solicitud expresa de la Dirección Corporativa de Infraestructura, se le adjudica de manera directa la prestación del servicio relacionado con la obra pública a la empresa SERVICIOS SMART FREE A TU NIVEL, S.A. DE C.V. Y FOSTER + PARTNERS LIMITED	active	2014-12-01 00:00:00	1841753116	MXN	\N	\N	\N	
112	112	IA-009KDH999-N56-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 36 BIS, fracción III de la LAASSP,se adjudicó el contrato a la empresa AGENCIA DE DESARROLLO RURAL MARTELLI, S.C. DE R.L, por un importe de $5´997,988.52, monto sin considerar el IVA, por resultar se la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria.	active	2015-08-13 00:00:00	6318719.99	MXN	\N	\N	\N	
113	113	SA-009KDH999-N2-2015	Oficio de notificación	Del analisis de las propuestas presentadas, se determina que la propuesta presentada por la empresa ARGU Asesores en Capital Humano S.C., es la qie ofrece las mejores condiciones para el Grupo Aeroportuarioo de la Ciudad de México S.A. de C.V.	active	2014-11-24 00:00:00	37181503.72	MXN	\N	\N	\N	
108	108	SO-009KDH999-N21-2015	Oficio DCAGI/SC/GC/031/2015 del 04 de febrero de 2015	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 27 fracción III y 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, 28, 29 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3. del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., y a solicitud expresa de la Dirección Corporativa de Infraestructura, se le adjudica de manera directa la prestación del servicio relacionado con la obra pública a Sistemas Integrales de Gestión Ambiental, S.C.	active	2015-02-04 00:00:00	394999	MXN	\N	\N	\N	
\.


--
-- Name: award_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('award_id_seq', 113, true);


--
-- Data for Name: awardamendmentchanges; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY awardamendmentchanges (id, contractingprocess_id, award_id, property, former_value) FROM stdin;
1	30	\N	La emisión de fallo se difiere, para llevarse a cabo el 30 de abril de 2015	No especificado
\.


--
-- Name: awardamendmentchanges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('awardamendmentchanges_id_seq', 1, true);


--
-- Data for Name: awarddocuments; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY awarddocuments (id, contractingprocess_id, award_id, document_type, documentid, title, description, url, date_published, date_modified, format, language) FROM stdin;
1	1	\N	Acta de emisión de fallo	Propuesta técnica-económica de GEXIC, S. A. de C. V.	Propuesta técnica-económica de GEXIC, S. A. de C. V.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
2	3	\N	Oficio de notificación de Adjudicación Directa	Oficio de notificación de Adjudicación Directa	Propuesta para la realización del Elaboración del Plan de  Manejo Ambiental para el nuevo Aeropuerto Internacional de la Ciudad de México de fecha 19 de enero de 2015 por Especialistas  Ambientales, S.A. de C.V.	Propuesta para la realización del Elaboración del Plan de  Manejo Ambiental para el nuevo Aeropuerto Internacional de la Ciudad de México de fecha 19 de enero de 2015 por Especialistas  Ambientales, S.A. de C.V.		\N	\N		es
3	4	\N	Oficio de notificación de Adjudicación Directa 	Oficio de notificación de Adjudicación Directa	Oficio de notificación de Adjudicación Directa DCAGI/SC/GC/029/2015 del 04-02-2015	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
4	5	\N	Oficio	DCAGI/SC/GC/037/2015	Oficio DCAGI/SC/GC/037/2015 del 04 d efebrero de 2015	Propuesta para la realización del Plan de monitoreo, registro y verificación de emisiones de gases de efecto invernadero para el NAICM de fecha 16 de enero de 2015 por Sistemas Integrales de Gestión Ambiental, S. C.		2015-02-04 00:00:00	\N		es
5	6	\N	Acta de emisión de fallo	Documento íntegro de la propuesta que resultó ganadora	Propuesta técnica y económica de la empresa Avalúos Evaluaciones y Proyectos S.A. de C.V.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		
6	7	\N	Acta de emición de fallo	1	Propuesta técnica y económica de Consorcio IUYET, S.A. de C.V.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
7	9	\N	Acta de emisión de fallo 	1	Propuesta técnica y económica de la empresa Manejo Integral de Cuencas, S.A. de C.V.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
8	10	\N	Acta de emisión de fallo	1	Propuesta técnica y económica de la empresa  Supervisión y Control de Fauna, S.A. de C. V.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		
9	11	\N	Acta de emisión de fallo	1	Propuesta técnica y económica de la empresa  RAGAMEX Constructores SA de CV	Documento íntegro de la propuesta que resultó ganadora		\N	\N		
10	13	\N	Acta de emisión de fallo	1	Propuestas técnica, legal y económica presentada por AUTODESK, INC. 	Documento íntegro de la propuesta que resultó ganadora		\N	\N		
11	14	\N	Acta de emisión de fallo	1	Propuesta Técnica y Económica de la empresa Sifra y Asociados, S. A. de C. V.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		
12	15	\N	Acta de emisión de fallo 	1	Propuesta técnica y económica de la empresa Consultoría, Supervisión Técnica y Operación en Sistemas, S. A. de C. V. 	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
13	16	\N	Acta de emisión de fallo 	1	Propuesta técnica y económica de la empresa Consultoría, Supervisión Técnica y Operación en Sistemas, S. A. de C. V.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		
14	38	\N		1	Oficio número DCAGI/SC/GC/0168/2015 del 08/09/2015	Anexo Técnico, Propuesta Técnica y Económica de los Servicios relativos a "Asistencia Técnica Especializada en Materia de Diseño Sísmico Estructural aplicada a la Infraestructura Aeroportuaria		\N	\N		
15	27	\N	Fallo	UNCP/309/BMACP/0796/2014	Propuesta para el Servicio de un Testigo Social para que atestigüe en las etapas de la licitación pública nacional presencial relativa a la contratación del servicio de extracción de ademes y restitución del terreno que ocupan dichos elementos, ubicados en el polígono para el Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	Propuesta para el Servicio de un Testigo Social para que atestigüe en las etapas de la licitación pública nacional presencial relativa a la contratación del servicio de extracción de ademes y restitución del terreno que ocupan dichos elementos, ubicados en el polígono para el Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).		2014-09-26 00:00:00	\N		es
16	39	\N		1	Anexo Técnico, Propuesta Técnica y Económica de los Servicios relativos a la "Servicios de Asistencia Técnica Especializada en materia de Hidráulica aplicada a la Infraestructura Aeroportuaria"	Anexo Técnico, Propuesta Técnica y Económica de los Servicios relativos a la "Servicios de Asistencia Técnica Especializada en materia de Hidráulica aplicada a la Infraestructura Aeroportuaria"		\N	\N		
17	57	\N	Propuesta	1	Propuesta para la realización del Servicio de Experto Revisor para el Panel de Hidráulica Aplicada a la Infraestructura Aeroportuaria. DR. Rafael Bernardo Carmona Paredes	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
18	28	\N	Fallo	UNCP/309/BMACP/0796/2014	Propuesta para el Servicio de un Testigo Social para que atestigüe en las etapas de la licitación pública nacional presencial relativa a la contratación del servicio de extracción de ademes y restitución del terreno que ocupan dichos elementos, ubicados en el polígono para el Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	Propuesta para el Servicio de un Testigo Social para que atestigüe en las etapas de la licitación pública nacional presencial relativa a la contratación del servicio de extracción de ademes y restitución del terreno que ocupan dichos elementos, ubicados en el polígono para el Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).		2014-09-26 00:00:00	\N		
19	41	\N		1	Propuesta para la realización de los Servicios de asistencia técnica especializada en diseño de de experto revisor para la asistencia técnica especializada en diseño sismico estructural, elaborada por el DR JONATHAN BRAY.	Propuesta para la realización de los Servicios de asistencia técnica especializada en diseño de de experto revisor para la asistencia técnica especializada en diseño sismico estructural, elaborada por el DR JONATHAN BRAY.		\N	\N		
65	84	\N	Acta de emisión de fallo	IO-009KDH999-N81-2015	Propuesta técnica y económica de la empresa OMNIBUS Y TRANSPORTES Y TRANSPORTES TERRESTRES EJECUTIVOS, S.A. DE C.V	Propuesta técnica y económica de la empresa OMNIBUS Y TRANSPORTES Y TRANSPORTES TERRESTRES EJECUTIVOS, S.A. DE C.V		\N	\N		
67	111	\N	Acta de emisión de fallo	Propuesta técnica y económica de la empresa OMNIBUS Y TRANSPORTES TERRESTRES EJECUTIVOS, S.A. DE C.V.	Propuesta técnica y económica de la empresa OMNIBUS Y TRANSPORTES TERRESTRES EJECUTIVOS, S.A. DE C.V.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		
68	85	\N		No aplica	propuesta para la realización del Plan Maestro del Nuevo Aeropuerto Internacional de la Ciudad de México, de 06 de febrero de 2015 presentado por Arup Latin America, S.A	propuesta para la realización del Plan Maestro del Nuevo Aeropuerto Internacional de la Ciudad de México, de 06 de febrero de 2015 presentado por Arup Latin America, S.A		\N	\N		
70	113	\N	Fallo	Propuesta de Servicios/Propuesta económica.	Propuesta de Servicios/Propuesta económica.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
21	29	\N	Fallo	DCAGI/SC/GC/16B/2015	Propuesta para la realización del Proyecto ejecutivo del drenaje pluvial temporal para la protección de la zona contra inundaciones provenientes de precipitaciones dentro del perímetro del Aeropuerto en el lago de Texcoco, durante la construcción de la primera fase del Nuevo Aeropuerto Internacional de la Ciudad de México por Grupo de Ingenieía en Consultoría en obras, S. A. de C. V. 	Propuesta para la realización del Proyecto ejecutivo del drenaje pluvial temporal para la protección de la zona contra inundaciones provenientes de precipitaciones dentro del perímetro del Aeropuerto en el lago de Texcoco, durante la construcción de la primera fase del Nuevo Aeropuerto Internacional de la Ciudad de México por Grupo de Ingenieía en Consultoría en obras, S. A. de C. V. 		2015-01-28 00:00:00	\N		es
22	42	\N		1	Propuesta para los Servicios de experto revisor para el panel de hidráiulica aplicada a la infraestructura aeroportuaria, elaborada por el Dr. Fernando González Villareal. 	Propuesta para los Servicios de experto revisor para el panel de hidráiulica aplicada a la infraestructura aeroportuaria, elaborada por el Dr. Fernando González Villareal. 		\N	\N		
23	43	\N		1	Propuesta para los Servicios de experto revisor para la asistencia técnica especializada en materia de protección contra incendios, aplicada a la infraestructura aeroportuaria, elaborada por el Ing. Ramón Dominguez B. 	Propuesta para los Servicios de experto revisor para la asistencia técnica especializada en materia de protección contra incendios, aplicada a la infraestructura aeroportuaria, elaborada por el Ing. Ramón Dominguez B. 		\N	\N		
24	44	\N		1	Propuesta técnica y económica de Oscar José Vega y Roldan	Propuesta técnica y económica de Oscar José Vega y Roldan		\N	\N		
25	58	\N	Fallo	DCAGI/SC/GC/038/2016	Oficio DCAGI/SC/GC/038/2016 del 12 d e febrero de 2016	Propuesta para la realización del Servicio de Ambulancia para el Traslado de Personal, para el Programa de Empleo Temporal (PET).		2016-02-12 00:00:00	\N		es
26	30	\N	Fallo	1	Propuesta técnica y económica de la Currie & Brown México S. A. de C. V.	Propuesta técnica y económica de la Currie & Brown México S. A. de C. V.		\N	\N		es
27	59	\N	Fallo	1	INSTITUTO MEXICANO DE AUDITORÍA TÉCNICA, A.C.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		
28	46	\N		1	Propuesta Técnico Economica para los Servicios de Asistencia Técnica Especializada en Diseño Sismico Estructural.	No se presentaron inconformidades durante el procedimiento de contratación.		\N	\N		
29	31	\N	Acta de emisión de fallo	Cotización de la empresa Fglez Consultores y Asociados, S. A. de C.V.	Cotización de la empresa Fglez Consultores y Asociados, S. A. de C.V.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
30	60	\N	Cotización	1	Cotización de PORTA BAÑOS 2000, S.A. de C.V.	Cotización de PORTA BAÑOS 2000, S.A. de C.V.		\N	\N		es
31	32	\N	Oficio de notificaicón de la adjudicación	Propuesta técnica y económica de Oscar Alvares de la  Cuadra Sánchez	Propuesta técnica y económica de Oscar Alvares de la  Cuadra Sánchez	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
32	33	\N	Oficio de notificación de Adjudicación Directa 	DCAGI/SC/GC/0056/2015	Propuesta Técnica y Económica para la prestación del “Servicio de un Testigo Social para que Atestigüe las Etapas del Procedimiento de la Licitación Pública Internacional Bajo la Cobertura de Tratados de Libre Comercio, Consistente en Diseñar e Instrumentar el Modelo Virtual de Información para la Construcción del BIM del NAICM”, elaborada por el Ing. Jorge Jiménez Méndez	Documento íntegro de la propuesta que resultó ganadora		2015-07-31 00:00:00	\N		es
33	61	\N	Propuesta	1	Propuesta Técnica de las Obras de Excavación de prueba, Losa experimental y prueba de Pilotes para el El Edificio Terminal y Torre de Control del NAICM.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
34	34	\N	Acta de emisión de fallo 	Propuesta técnica y económica de la empresa IMPULSORA DE ENLACE EMPRESARIAL CATENA, S.A. DE C.V.	Propuesta técnica y económica de la empresa IMPULSORA DE ENLACE EMPRESARIAL CATENA, S.A. DE C.V.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
35	35	\N	Acta de emisión de fallo	 Propuesta  de la empresa CESC CONSULTORÍA, S.C.	 Propuesta  de la empresa CESC CONSULTORÍA, S.C.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
36	36	\N	Acta de emisión de fallo 	Propuesta técnica y económica de la empresa SERVICIOS FORESTALES DE HIDALGO, SERFORH, S.C.	Propuesta técnica y económica de la empresa SERVICIOS FORESTALES DE HIDALGO, SERFORH, S.C.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
37	47	\N	Fallo	Propuesta Técnico economica para los servicios de asistencia técnica especializada en diseño sismico estrcutural.	Propuesta Técnico economica para los servicios de asistencia técnica especializada en diseño sismico estrcutural.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
38	48	\N	Fallo	Relación de Conceptos y Cantidades de Obra para Expresión de Precios Unitarios y Monto Total de la Proposición (formato C-1)	Relación de Conceptos y Cantidades de Obra para Expresión de Precios Unitarios y Monto Total de la Proposición (formato C-1)	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
39	49	\N	Fallo	Carta de Presentación de fecha de 12 de Noviembre de 2015.	Carta de Presentación de fecha de 12 de Noviembre de 2015.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
40	50	\N	Acta de emisión de fallo	Propuesta técnica y económica de la empresa Servicios de Ingeniería, Edificación y Construcción Pesada, S.A. de C.V.	Propuesta técnica y económica de la empresa Servicios de Ingeniería, Edificación y Construcción Pesada, S.A. de C.V.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
42	51	\N	Fallo	DCAGI/SC/GC/0210/2015	Propuesta para la realización del Proyecto ejecutivo para la construcción de carriles de desaceleración, plataformas de almacenamiento y carriles de aceleración en las puertas 7, y 9 de acceso al polígono del NAICM.	Documento íntegro de la propuesta que resultó ganadora		2015-11-30 00:00:00	\N		es
43	67	\N		1	Oficio 842.01 de fecha 19 de diciembre de 2014 mediante el cual se integra la propuesta técnica económica COT-GEIC/419/2014.	Oficio 842.01 de fecha 19 de diciembre de 2014 mediante el cual se integra la propuesta técnica económica COT-GEIC/419/2014		\N	\N		
66	110	\N	Acta de emisión de fallo	Propuesta técnica y económica de la empresa JACE INTERNACIONAL S.A. DE C.V.	Propuesta técnica y económica de la empresa JACE INTERNACIONAL S.A. DE C.V.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
69	112	\N	Acta de emisión de fallo	Propuesta técnica y económica de la empresa Agencia de Desarrollo Rural Martelli, S. C. de R. L. M.I.	Propuesta técnica y económica de la empresa Agencia de Desarrollo Rural Martelli, S. C. de R. L. M.I.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
44	68	\N	Servicio de elaboración de programas y propuestas de acciones, ambientales para el proyecto Nuevo Aeropuerto de la Ciudad de México (NAICM)	1	Servicio de elaboración de programas y propuestas de acciones, ambientales para el proyecto Nuevo Aeropuerto de la Ciudad de México (NAICM)	Servicio de elaboración de programas y propuestas de acciones, ambientales para el proyecto Nuevo Aeropuerto de la Ciudad de México (NAICM)		\N	\N		
45	69	\N		1	Llevar a cabo el Servicio de Investigaciones y Estudios Especiales, Relacionados con Aspectos Estructurales del Nuevo Aeropuerto de la Ciudad de México (NAICM) en el Vaso del Ex-Lago de Texcoco, Zona Federal	Llevar a cabo el Servicio de Investigaciones y Estudios Especiales, Relacionados con Aspectos Estructurales del Nuevo Aeropuerto de la Ciudad de México (NAICM) en el Vaso del Ex-Lago de Texcoco, Zona Federal		\N	\N		
46	70	\N		1	Llevar a cabo el Servicio de Investigaciones y Estudios Especiales Relacionados con Aspectos Geotécnicos del Nuevo Aeropuerto de la Ciudad de México (NAICM) en el Vaso del Ex-Lago de Texcoco, Zona Federal	Llevar a cabo el Servicio de Investigaciones y Estudios Especiales Relacionados con Aspectos Geotécnicos del Nuevo Aeropuerto de la Ciudad de México (NAICM) en el Vaso del Ex-Lago de Texcoco, Zona Federal		\N	\N		
47	52	\N	Fallo	DCAGI/SC/166.1/2015	Cotización TS-IMAT-0261-002-2014	Documento íntegro de la propuesta que resultó ganadora		2015-09-24 00:00:00	\N		es
48	53	\N	Fallo	Acta de Fallo del 28 de enero de 2016	Propuesta para la realización del Servicios de Asesoria en Materia Fiscal para la Recuperacion de Saldos a favor de IVA e ISR, así mismo Asesoria Respecto al Cumplimiento de Tratados Internacionales para evitar la Doble Tributación, de fecha 16 de febrero de 2016 por Muños Manzo y Ocampo, S. C.	Documento íntegro de la propuesta que resultó ganadora		2016-01-28 00:00:00	\N		es
49	54	\N	Fallo	DCAGI/SC/039/2016	Propuesta tecnica y economica del  "Servicio para diseñar la pagina WEB del Grupo Aeroportuario de la Ciudad de México (GACM) para el Proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México" asiganado a la empresas Elements Studios, S. C., por un monto sin IVA $207,000.00.	Documento íntegro de la propuesta que resultó ganadora		2016-02-12 00:00:00	\N		es
50	55	\N	Fallo	 DCAGI/SC/GC/023/2016	Propuesta tecnica y economica de los seervicios de un   "Testigo Social para que atestigue las etapas del Procedimiento de Licitación Publica Nacional para el Proyecto denominado "Excavación de Prueba, Losa Experimental y Prueba de Pilotes para el Edificio Terminal y Torre de Control""	Documento íntegro de la propuesta que resultó ganadora		2016-02-03 00:00:00	\N		es
51	56	\N	Acta de emisión de fallo	Acta de emisión de fallo 10 de Febrero de 2016	Propuesta técnica-económica de Consorcio IUYET, S.A. de C.V	Documento íntegro de la propuesta que resultó ganadora		2016-02-10 00:00:00	\N		es
52	86	\N	Fallo	DCAGI/SC/GC/129/20	Propuesta para la realización de la Supervisión Técnica Administrativa y de Control de Calidad para los Trabajos de Carga, Acarreo y Descarga fuera del Polígono del material existente, producto de depósitos de Demolición, Desperdicio y Desazolve por Supervisión, Coordinación y Construcción  de Obras, S.A. de C.V.	Documento íntegro de la propuesta que resultó ganadora		2016-03-31 00:00:00	\N		es
53	87	\N	Fallo	GACM/DG/DCl/1107/15	Propuesta para la realización de las Pruebas de Laboratorio Geotécnicas complementarias para el Proyecto Ejecutivo de Sistema de Drenaje Temporal del Nuevo Aeropuerto Internacional de la Ciudad de México por Rocher Ingeniería, S.A. de C.V.	Documento íntegro de la propuesta que resultó ganadora		2015-12-07 00:00:00	\N		es
54	88	\N	Fallo	Propuesta para Proyecto de Salvamento Arqueológico en el interior del Lago de Taxcoco en su zona oriente, Estado de México. (Supervisión, Vigilancia y Excavaciones 2016), en Adelante los SERVICIOS, mismos que serán realizados totalmente a satisfacción del GACM	Propuesta para Proyecto de Salvamento Arqueológico en el interior del Lago de Taxcoco en su zona oriente, Estado de México. (Supervisión, Vigilancia y Excavaciones 2016), en Adelante los SERVICIOS, mismos que serán realizados totalmente a satisfacción del GACM	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
55	90	\N	Fallo	DCAGI/SC/GC/0208/2015	Propuesta de Servicios/Propuesta económica.	Documento íntegro de la propuesta que resultó ganadora		2015-11-30 00:00:00	\N		es
56	99	\N		1	Oficio de notificación de Adjudicación Directa DGAE/212/941/2014 de 30 de septiembre de 2014, la Dirección General de Auditorías Externas designa como auditor externo para dictaminar los estados financieros 2014 de la entidad al prestador de servicios. 	Oficio de notificación de Adjudicación Directa DGAE/212/941/2014 de 30 de septiembre de 2014, la Dirección General de Auditorías Externas designa como auditor externo para dictaminar los estados financieros 2014 de la entidad al prestador de servicios. 		\N	\N		
57	91	\N	Acta de emisión de fallo 	Propuesta técnica y económica de la empresa INE S.A. de C.V.	Propuesta técnica y económica de la empresa INE S.A. de C.V.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
58	92	\N	Acta de emisión de fallo	Acta de Emisión de Fallo, del 12 de marzo del 2015.	Propuesta de Servicios/Propuesta económica.	Documento íntegro de la propuesta que resultó ganadora		2015-03-12 00:00:00	\N		es
59	102	\N	Acta de emisión de fallo	1	Propuesta técnica y económica de la empresa JACE INTERNACIONAL S.A. DE C.V.	Propuesta técnica y económica de la empresa JACE INTERNACIONAL S.A. DE C.V.		\N	\N		
60	104	\N		DCAGI/SC/GC/052/2015	Propuesta Económica de fecha  13-03-2015	Propuesta Económica de fecha  13-03-2015		\N	\N		
61	95	\N	Acta de emisión de fallo	Propuesta técnica y económica 	Propuesta técnica y económica 	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
62	107	\N	Oficio DCAGI/SC/GC/030/2015 del 04 de febrero de 2015	DCAGI/SC/GC/030/2015	Programa de Rescate de Fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México. de fecha enero de 2015 por Instituto de Investigación y Capacitación para las Ciencias Biológicas, A.C.	Programa de Rescate de Fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México. de fecha enero de 2015 por Instituto de Investigación y Capacitación para las Ciencias Biológicas, A.C.		2015-02-04 00:00:00	\N		
63	108	\N	Oficio DCAGI/SC/GC/031/2015 del 04 de febrero de 2015	DCAGI/SC/GC/031/2015 	Propuesta para la realización del ¨Programa de rescate y reubicación de flora para el Nuevo Aeropuerto Internacional de la Ciudad de México.” de fecha enero  2015 por el  Instituto de Investigación y Capacitación para las Ciencias Biológicas, A.C 	Propuesta para la realización del ¨Programa de rescate y reubicación de flora para el Nuevo Aeropuerto Internacional de la Ciudad de México.” de fecha enero  2015 por el  Instituto de Investigación y Capacitación para las Ciencias Biológicas, A.C 		2015-02-04 00:00:00	\N		
64	82	\N	Acta de emisión de fallo	62501008	Acta de emisión de fallo	Propuesta técnica y económica de la empresa CENTRO DE ESTUDIOS DE URBANISMO Y ARQUITECTURA, S.A. DE C.V.		\N	\N		
71	76	\N	Notificación de Adjudicación No. oficio DCAGI/SC/041/2014 de fecha 01 de diciembre de 2014	DCAGI/SC/041/2014 	Cotización de la empresa FP - FREE S. DE R.L. DE C.V.	Cotización de la empresa FP - FREE S. DE R.L. DE C.V.		\N	\N		
72	77	\N	Propuesta del Servicio	-	Propuesta para la realización del Servicio relacionado con el programa de empleo temporal (PET) correspondiente a las acciones preparatorias para la construcción del Nuevo Aeropuerto Internacional de la Ciudad de México (servicio de traslado de personas), elaborada en Mayo de 2015 por el C. Lino Márquez Vite	Propuesta para la realización del Servicio relacionado con el programa de empleo temporal (PET) correspondiente a las acciones preparatorias para la construcción del Nuevo Aeropuerto Internacional de la Ciudad de México (servicio de traslado de personas), elaborada en Mayo de 2015 por el C. Lino Márquez Vite		\N	\N		
73	78	\N	Acta de emisión de fallo	IA-009KDH999-N31-2015	Propuesta técnica y económica de la empresa VÁZQUEZ NAVA Y CONSULTORES, S.C	Propuesta técnica y económica de la empresa VÁZQUEZ NAVA Y CONSULTORES, S.C		\N	\N		
74	79	\N	Acta de emisión de fallo	IA-009KDH999-E23-2016	Propuesta técnica y económica de la empresa Vázquez Nava y Consultores, S. C.	Propuesta técnica y económica de la empresa Vázquez Nava y Consultores, S. C.		\N	\N		
\.


--
-- Name: awarddocuments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('awarddocuments_id_seq', 74, true);


--
-- Data for Name: awarditem; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY awarditem (id, contractingprocess_id, award_id, itemid, description, classification_scheme, classification_id, classification_description, classification_uri, quantity, unit_name, unit_value_amount, unit_value_currency) FROM stdin;
1	1	\N	62501001	Construcción de Aeropistas			Obra pública		\N	Obra	0	
2	3	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
3	5	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
4	6	\N	62903001	Supervisión de Obras			Servicios relacionados con Obra Pública		\N	Supervisión	0	
5	7	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
6	9	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
7	10	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
8	11	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
9	13	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
10	14	\N	62903001	Supervisión de Obras			Servicios relacionados con Obra Pública		\N	Supervisión	0	
11	15	\N	62903001	Supervisión de Obras			Servicios relacionados con Obra Pública		\N	Supervisión	0	
12	16	\N	62903001	Supervisión de Obras			Servicios relacionados con Obra Pública		\N	Supervisión	0	
13	38	\N	62501001	Construcción de Aeropistas			Servicios relacionados con Obra Pública		\N	Servicios	0	
14	39	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública		Servicios relacionados con Obra Pública		\N	Servicios	0	
15	40	\N	1	Propuesta para la realización de los Servicios de asistencia técnica especializada en materia de diseño sismico estructural aplicada a la infraestructura aeroportuaria, elaborada por el Dr. Luis Esteva Maraboto.					\N		0	
16	57	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Servicio	0	
17	41	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
18	29	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio  	0	
19	43	\N	1	Construcción de Aeropistas	Servicios relacionados con Obra Pública	62501001			\N	Servicio	0	
20	44	\N	1	Construcción de aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
21	45	\N	1	Construcción de aeropistas	Servicios relacionados con Obra Pública	62501001			\N	Servicio	0	
22	46	\N	1	Construcción de Aeropistas.	Servicios relacionados con Obra Pública	62501001			\N	Servicio	0	
23	31	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
24	60	\N	62501001	Construccion de Aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
25	61	\N	62501001	Construcción de Aeropistas			Obra Publica		\N	Obra	0	
26	34	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Proyecto Ejecutivo	0	
27	62	\N	62903001	Construcción de Aereopistas			Obras Publicas		\N	Obra	0	
28	36	\N	62501001	Construcción de aeropistas 			Servicios relacionados con Obra Pública		\N	Servicios relacionados con obra pública	0	
29	47	\N	62501001	Construcción de Aeropistas.			Servicios relacionados con Obra Pública		\N	Experto	0	
30	48	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropistas.			Servicios relacionados con Obra Pública		\N	Estudio	0	
31	49	\N	62501008	Estudios de Preinversión y/o Preparación del Proyecto para Aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
32	50	\N	72501001	Construcción de aeropistas			Obra Pública		\N	Obra	0	
33	51	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
34	67	\N	1	Estudios de preinersión y/o preparación del proyecto para aeropista	Obra pública	62501008			\N	Obra	0	
35	68	\N	1	Obra pública	Obra pública				\N	Servicio	0	
36	69	\N	1	Obra pública					\N	Estudio	0	
37	70	\N	1	Obra pública					\N	Estudio	0	
38	52	\N	62501001	Construcción de Aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
39	72	\N	1	Obra pública					\N	Estudio	0	
40	73	\N	1	Obra pública					\N	Servicio	0	
41	53	\N	62501001	Construcción de Aeropistas			Servicios relacionados con Obra Pública		\N	Servicio  	0	
42	54	\N	62501001	Construccion de Aeropistas			Obra Pública		\N	Servicio	0	
43	74	\N	1	Obra pública					\N	Estudio	0	
44	75	\N	1	Obra pública					\N	Obra	0	
45	55	\N	62501001	Construccion de Aeropistas			Obra Publica		\N	Servicio	0	
46	56	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Obra pública		\N	Estudio	0	
47	86	\N	62903001	Supervisón de Obras			Servicios relacionados con Obra Pública		\N	Supervisión	0	
48	87	\N	62501001	Construcción de Aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
49	88	\N	62501001	Construcción de aeropistas			Servicios relacionados con obra pública		\N	Serivicio	0	
50	99	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
51	91	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Proyecto Ejecutivo 	0	
52	92	\N	33301	Servicio integral de administración de personal y proceso de nomina, mediante un sistema especializado para recursos humanos y de nómina de gobierno			Servicio integral de administración de personal y proceso de nomina, mediante un sistema especializado para recursos humanos y de nómina de gobierno		\N	mes	0	
53	102	\N	62501001	Construcción de aeropistas	Servicios relacionados con  Obra Pública				\N	Servicio	0	
54	103	\N	33901	Contratación de servicios especializados en el suministro de "terceros".					\N	Servicio	0	
55	104	\N	1	 					\N		5840518.00	
56	95	\N	6220	Edificación no habitacional			Edificación no habitacional		\N	No se localiza. 	0	
57	105	\N	62501001	Construcción de aeropistas	Servicios relacionados con obra				\N	Obra	0	
58	107	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista	Servicios relacionados con Obra Pública				\N	Estudio	0	
59	109	\N	62501001	Construccion de Aeropistas	Obra Pública				\N	Obra Pública	0	
60	81	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Proyecto Ejecutivo	0	
61	82	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Estudios de preinversión y/o preparación del proyecto para aeropista		\N	Servicios relacionados con Obra Pública	0	MXN
62	83	\N	62501001	Construcción de aeropistas		62501001	Construcción de aeropistas		\N	Servicio	4880000.00	MXN
63	84	\N	62501001	Construcción de aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	1176000.00	MXN
64	85	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	27582750	MXN
65	113	\N	33901	Contratación de servicios especializados en el suministro de "terceros".			Contratación de servicios especializados en el suministro de "terceros".		\N	Servicio	0	
66	76	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Proyecto Ejecutivo	1841753116	MXN
\.


--
-- Name: awarditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('awarditem_id_seq', 66, true);


--
-- Data for Name: awarditemadditionalclassifications; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY awarditemadditionalclassifications (id, award_id, awarditem_id, scheme, description, uri) FROM stdin;
\.


--
-- Name: awarditemadditionalclassifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('awarditemadditionalclassifications_id_seq', 1, false);


--
-- Data for Name: budget; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY budget (id, contractingprocess_id, planning_id, budget_source, budget_budgetid, budget_description, budget_amount, budget_currency, budget_project, budget_projectid, budget_uri) FROM stdin;
2	2	2	\N	\N	\N	\N	\N	\N	\N	\N
17	18	17	\N	\N	\N	\N	\N	\N	\N	\N
19	20	20	\N	\N	\N	\N	\N	\N	\N	\N
15	15	15	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	17000000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
16	16	16	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	20000000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
18	17	18	Presupuesto de Egresos de la Federación 2016	46101	Transferencias a fideicomisos públicos	122000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2016/docs/09/r09_kdh_pie.pdf
5	5	5	Presupuesto de Egresos de la Fedración 2015 	46101	Transferencias a fideicomisos públicos	539400.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
20	19	19	Presupuesto de Egresos de la Federación 2015 y 2016	46101	Transferencias a fideicomisos públicos	1276500	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2016/docs/09/r09_kdh_pie.pdf
8	8	8	Presupuesto de Egresos de la Federación 2015 y 2016	46101	Transferencias a fideicomisos públicos.	150000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	
21	21	21	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	770000000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
4	4	4	Presupuesto de Egresos de la Fedración 2015 	46101	Transferencias a fideicomisos públicos	522000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
23	22	23	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	3950000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
3	3	3	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	638000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
7	7	7	Presupuesto de Egresos de la Federación 2015 	46101	Transferencias a fideicomisos públicos	39000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
6	6	6	Presupuesto de Egresos de la Federación 2015 y 2016	46101	Transferencias a fideicomisos públicos	2680000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
11	11	11	Presupuesto de Egresos de la Federación 2015 y 2016	46101	Programa anual de obras públicas y servicios relacionados con las mismas de GACM correspondiente al ejercicio fiscal 2015	18500000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
10	9	9	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	26000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
9	10	10	Presupuesto de Egresos de la Federación 2015 y 2016	46101	Transferencias a fideicomisos públicos	29000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
13	13	13	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	121700000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
22	23	22	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	1203803000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
14	14	14	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	4000000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
12	12	12	Presupuesto de Egresos de la Federación 2015 y 2016	46101	Transferencias a fideicomisos públicos	490000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_pief.pdf
24	24	24	Presupuesto de Egresos de la Fedración 2015 	46101	Transferencias a fideicomisos públicos	10400000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
25	25	25	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	16000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
37	37	37	Presupuesto de Egresos de la Fedración 2015	46101	Transferencias a fideicomisos públicos	400000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
30	30	30	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	3950000000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
36	36	36	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	1750000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
27	27	27	Presupuesto de Egresos de la Fedración 2014	46101	Transferencias a fideicomisos públicos	527973	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
38	38	38	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	26000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
39	39	39	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	15650000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
40	40	40	Presupuesto de Egresos de la Fedración 2015 a 2016	46101	Transferencias a fideicomisos públicos	17000000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
28	28	28	Presupuesto de Egresos de la Federación 2014	46101	Transferencias a fideicomisos públicos	625856	MNX	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
57	57	57	Presupuesto de Egresos de la Federación 2015	46101	Transferencias a fideicomisos públicos	15650000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
58	58	58	Presupuesto de Egresos de la Fedración 2015 	46101	Transferencias a fideicomisos públicos	450000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
29	29	29	Presupuesto de Egresos de la Fedración 2015	46101	Transferencias a fideicomisos públicos	19500000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
31	31	31	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	9500000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
41	41	41	Presupuesto de Egresos de la Fedración 2015 a 2016	46101	Transferencias a fideicomisos públicos	26000000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
42	42	42	Presupuesto de Egresos de la Fedración 2015 a 2016	46101	Transferencias a fideicomisos públicos	15650000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
43	43	43	Presupuesto de Egresos de la Fedración 2015 a 2016	46101	Transferencias a fideicomisos públicos	26000000.00	MNX	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
44	44	44	Presupuesto de Egresos de la Fedración 2015	46101	Transferencias a fideicomisos públicos	15650000.00	MNX	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
45	45	45	Presupuesto de Egresos de la Fedración 2015	46101	Transferencias a fideicomisos públicos	15650000.00	MNX	Nuevo Aeropuerto Internacional de la Ciudad de México		http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
46	46	46	Presupuesto de Egresos de la Fedración 2015 	46101	Transferencias a fideicomisos públicos	26000000	MNX	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
59	59	59	Presupuesto de Egresos de la Fedración 2015	46101	Transferencias a fideicomisos públicos	580000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
32	32	32	Presupuesto de Egresos de la Fedración 2015	46101	Transferencias a fideicomisos públicos	215000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
60	60	60	Presupuesto de Egresos de la Federación 2016	46101	Transferencias a fideicomisos públicos	750000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
34	34	34	Presupuesto de Egresos de la Fedración 2015	46101	Transferencias a fideicomisos públicos	8200000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
61	61	61	Presupuesto de Egresos de la Federación 2015 y 2016	46101	Transferencias a fideicomisos públicos	0		Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
33	33	33	Presupuesto de Egresos de la Fedración 2015 			432601	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
35	35	35	Presupuesto de Egresos de la Fedración 2015 	46101	Transferencias a fideicomisos públicos	15000000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
67	67	67	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	182500000.00	MNX	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
65	65	65	Presupuesto de Egresos de la Federación 2014	46101	Transferencias a fideicomisos públicos	2697000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
52	52	52	Presupuesto de Egresos de la Fedración 2015 	46101	Transferencias a fideicomisos públicos	390000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
74	74	74	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	1400000.00	MNX	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
62	62	62	Presupuesto de Egresos de la Federación 2015 y 2016		Transferencias a fideicomisos públicos	67996	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
63	63	63	Presupuesto de Egresos de la Federación 2014	46101	Transferencias a fideicomisos públicos	13051740.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
1	1	1	Presupuesto de Egresos de la Federación 2015 y 2016	46101	Términos de referencia "Extracción de ademes y restitución del terreno que ocupan dichos elementos ubicados en la poligonal para el Nuevo Aeropuerto Internacional de la Cuidad de México".  Públicados en CompraNet el 24 de noviembre de 2014	54520000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
47	47	47	Presupuesto de Egresos de la Fedración 2015 	46101	Transferencias a fideicomisos públicos	26000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
64	64	64	Presupuesto de Egresos de la Fedración 2014	46101	Transferencias a fideicomisos públicos	10954142.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
48	48	48	Presupuesto de Egresos de la Fedración 2015 	46101	Transferencias a fideicomisos públicos	21750000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
50	50	50	Presupuesto de Egresos de la Fedración 2015	46101	Transferencias a fideicomisos públicos	9750000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
49	49	49	Presupuesto de Egresos de la Fedración 2015	46101	Transferencias a fideicomisos públicos	720001.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
51	51	51	Presupuesto de Egresos de la Fedración 2015 	46101	Transferencias a fideicomisos públicos	690000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
66	66	66	Presupuesto de Egresos de la Federación 2014	46101	Transferencias a fideicomisos públicos	9000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
68	68	68	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	7667600.00	MNX	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
69	69	69	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	64409000.00	MNX	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
76	76	76	Presupuesto de Egresos de la Federación 2014	46101	Transferencias a fideicomisos públicos	2136433615	MXN	 Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
71	71	71	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	0	MNX	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
72	72	72	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	34800000.00	MNX	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
53	53	53	Presupuesto de Egresos de la Fedración 2015 	46101	Transferencias a fideicomisos públicos	21848600.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
73	73	73	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	28800000.00	MNX	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
77	77	77	Presupuesto de Egresos de la Fedración 2015 	46101	Transferencias a fideicomisos públicos	2355000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
54	54	54	Presupuesto de Egresos de la Fedración 2015	46101	Transferencias a fideicomisos públicos	240120.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
97	97	97	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	182500000.00	MNX	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
100	100	100				182500000.00	MNX	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
93	93	93				182500000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
106	106	106	Presupuesto de Egresos de la Federación 2015	46101	Transferencias a fideicomisos públicos	70000000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
110	110	110	Presupuesto de Egresos de la Federación 2015	62201	Transferencias a fideicomisos públicos	14655172	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
111	111	111	Presupuesto de Egresos de la Federación 2015	62201	Obras de construccion para edificios no habitables	9170000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
113	113	113	Presupuesto de Egresos de la Federación 2014	33901	Subcontratación de Servicios con terceros.	129391633.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México		
75	75	75	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	10163709.00	MNX	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
55	55	55	Presupuesto de Egresos de la Federación 2015	46101	Transferencias a fideicomisos públicos	290000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
78	78	78	Presupuesto de Egresos de la Fedración 2015 	46101	Factibilidad técnica, legal y ambiental del proyecto de desarrollo del Nuevo Aeropuerto Internacional de la Ciudad de México	20360000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
56	56	56	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	50000000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
86	86	86	Presupuesto de Egresos de la Fedración 2015	46101	Transferencias a fideicomisos públicos	7519121	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
87	87	87	Presupuesto de Egresos de la Federación 2015	46101	Transferencias a fideicomisos públicos	163793	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
88	88	88	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	10163709.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
96	96	96				182500000.00	MNX	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
89	89	89	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	0	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
90	90	90	Presupuesto de Egresos de la Federación  2015, 2016, 2017 y 2018.	62905	Otros servicios relacionados con la Obra Pública	726064480	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México		http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
98	98	98				182500000.00	MNX	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
99	99	99	Presupuesto de Egresos de la Fedración 2015	46101	Transferencias a fideicomisos públicos	46371.00	MNX	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
91	91	91	Presupuesto de Egresos de la Fedración 2015	46101	Transferencias a fideicomisos públicos	9500000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
92	92	92	Presupuesto de Egresos de la Federación  2015.	33301	Servicio integral de administración de personal y proceso de nomina, mediante un sistema especializado para recursos humanos y de nómina de gobierno	1802640.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México		http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
101	101	101	Presupuesto de Egresos de la Fedración 2016 al 2018	46101	Transferencias a fideicomisos públicos	227520000.00	MNX	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
102	102	102	Presupuesto de Egresos de la Federación 2015	62201	Transferencias a fideicomisos públicos	14655172	MNX	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
94	94	94				182500000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
103	103	103	Presupuesto de Egresos de la Federación 2014	33901	Subcontratación de Servicios con terceros.	129391633.00	MNX	Nuevo Aeropuerto Internacional de la Ciudad de México		
95	95	95	Presupuesto de Egresos de la Fedración 2016	62201	Obras de construcción para edificios no habitacionales	12500000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	
104	104	104	Presupuesto de Egresos de la Fedración  2015 y 2016 	37104, 37106 y 38301	"Servicios de pasajes aéreos nacionales para servidores públicos de mando en el desempeño de comisiones y funciones oficiales Servicios de pasajes aéreos internacionales para servidores públicos de mando en el desempeño de comisiones y funciones oficiales Congresos y Convenciones"	6583333	MNX	Nuevo Aeropuerto Internacional de la Ciudad de México		http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
105	105	105	Presupuesto de Egresos de la Federación 2015 y 2016	46101	Transferencias a fideicomisos públicos	134800000.00	MNX	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
80	80	80	Presupuesto de Egresos de la Fedración 2016	46101	Factibilidad técnica, legal y ambiental del proyecto de desarrollo del Nuevo Aeropuerto Internacional de la Ciudad de México	20360000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
81	81	81	Presupuesto de Egresos de la Fedración 2015 al 2018	46101	Investigación de mercado para llevara  cabo la contratación de Elaboración del proyecto ejecutivo (ingenierías) para el diseño de la parte "Aeronáutica" (área de movimiento) de pistas, calles de rodaje, plataformas, áreas para el mantenimiento de aeronaves, servicio de combustibles de aviación, restricción y eliminación de obstáculos, servicio de salvamento y extinción de incendios (SSEI), 	1800000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
107	107	107	Presupuesto de Egresos de la Federación 2015	46101	Transferencias a fideicomisos públicos	8530640.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
108	108	108	Presupuesto de Egresos de la Fedración 2015	46101	Transferencias a fideicomisos públicos	458200	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
109	109	109	Presupuesto de Egresos de la Fedración 2015	62501	Transferencias a fideicomisos públicos	9500000.00	MXN	Construcción de Vías de Comunicación	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
82	82	82	Presupuesto de Egresos de la Fedración 2016	46101	Investigación de mercado para llevar a cabo la contartación de Servicios de apoyo técnico a la residencia del proyecto ejecutivo de diseño arquitectónico e ingeniería de detalle del edificio terminal de pasajeros	8362000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2016/docs/09/r09_kdh_pie.pdf
83	83	83	Presupuesto de Egresos de la Fedración 2015	1409JZL0005	Investigación de Mercado para llevar a cabo la contratación de los Servicios relacionados con el programa de empleo temporal (pet) correspondiente a las acciones preparatorias para la construcción del nuevo aeropuerto internacional de la Ciudad de México	8500000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
84	84	84	Presupuesto de Egresos de la Fedración 2015 	46101	Transferencias a fideicomisos públicos	9170000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
70	70	70	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	177305923	MNX	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
85	85	85	Presupuesto de Egresos de la Fedración 2015 	46101	Transferencias a fideicomisos públicos	1495000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
112	112	112	Presupuesto de Egresos de la Federación 2015	46101	Transferencias a fideicomisos públicos	7400000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
79	79	79	Presupuesto de Egresos de la Fedración 2016	46101	Transferencias a fideicomisos públicos	7400000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2016/docs/09/r09_kdh_pie.pdf
\.


--
-- Name: budget_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('budget_id_seq', 113, true);


--
-- Data for Name: buyer; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY buyer (id, contractingprocess_id, name, identifier_scheme, identifier_id, identifier_legalname, identifier_uri, address_streetaddress, address_locality, address_region, address_postalcode, address_countryname, contactpoint_name, contactpoint_email, contactpoint_telephone, contactpoint_faxnumber, contactpoint_url) FROM stdin;
17	18	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
18	20	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
19	19	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
20	17	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
21	21	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
22	23	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
23	22	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
24	24	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
4	4	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
5	5	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
6	7	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
7	6	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
8	10	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
9	8	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
25	25	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
28	28	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
29	29	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
30	30	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
31	31	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
32	32	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
33	33	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
34	34	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
35	35	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
36	36	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
66	66	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
67	67	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
68	68	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
69	69	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
70	70	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
76	76	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
77	77	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
56	56	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
57	57	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
58	58	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
59	59	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
60	60	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
61	61	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	1	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
2	2	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
62	62	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
78	78	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
79	79	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
80	80	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
81	81	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
82	82	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
83	83	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
84	84	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
85	85	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
86	86	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
87	87	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
88	88	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
89	89	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
90	90	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
91	91	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
92	92	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
93	93	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
94	94	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
95	95	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
96	96	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
97	97	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
98	98	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
99	99	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
100	100	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
101	101	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
102	102	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
103	103	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
104	104	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
105	105	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
106	106	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
107	107	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
108	108	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
109	109	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
110	110	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
111	111	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
112	112	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
37	37	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
38	38	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
39	39	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
40	40	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
41	41	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
42	42	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
43	43	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
44	44	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
45	45	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
46	46	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
47	47	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
48	48	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
49	49	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
50	50	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
51	51	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
52	52	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
53	53	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
54	54	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
55	55	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
113	113	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	3	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
10	9	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
27	27	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
71	71	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
72	72	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
73	73	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
74	74	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
75	75	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11	11	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
12	12	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
13	13	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
14	14	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
15	15	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
16	16	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
63	63	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
64	64	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
65	65	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Name: buyer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('buyer_id_seq', 113, true);


--
-- Data for Name: buyeradditionalidentifiers; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY buyeradditionalidentifiers (id, contractingprocess_id, buyer_id, scheme, legalname, uri) FROM stdin;
\.


--
-- Name: buyeradditionalidentifiers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('buyeradditionalidentifiers_id_seq', 1, false);


--
-- Data for Name: contract; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY contract (id, contractingprocess_id, awardid, contractid, title, description, status, period_startdate, period_enddate, value_amount, value_currency, datesigned, amendment_date, amendment_rationale) FROM stdin;
88	88	-	GACM/DCI/SJ/CM/18-2015	Proyecto de Salvamento Arqueológico en el interior del Lago de Taxcoco en su zona oriente, Estado de México. (Supervisión, Vigilancia y Excavaciones 2016), en Adelante los SERVICIOS, mismos que serán realizados totalmente a satisfacción del GACM	Proyecto de Salvamento Arqueológico en el interior del Lago de Taxcoco en su zona oriente, Estado de México. (Supervisión, Vigilancia y Excavaciones 2016), en Adelante los SERVICIOS, mismos que serán realizados totalmente a satisfacción del GACM	active	2016-02-16 00:00:00	2016-12-31 00:00:00	8761818.10	MXN	2016-02-15 00:00:00	\N	
113	113	-	ITP-S-DCAGI-SC-004/2014	Contrato abierto plurianual de prestación de servicios especializados en el suministro de "terceros".	Obtención de la prestacion de servicios especializados en el suministro de "terceros".	terminated	2014-12-01 00:00:00	2015-11-30 00:00:00	37181503.72	MXN	2014-12-01 00:00:00	\N	
79	79	IA-009KDH999-E23-2016	ITP-AS-DCAGI-SC-020/16	Servicios profesionales de consultoría, para el acompañamiento jurídico normativo y administrativo en la realización de las actividades para el desarrollo del Nuevo Aeropuerto Internacional de la Ciudad de México, así como para la elaboración del expediente concentrador integral	Servicios profesionales de consultoría, para el acompañamiento jurídico normativo y administrativo en la realización de las actividades para el desarrollo del Nuevo Aeropuerto Internacional de la Ciudad de México, así como para la elaboración del expediente concentrador integral	active	2016-04-01 00:00:00	2017-12-31 00:00:00	38500000	MXN	2016-04-01 00:00:00	\N	
80	80	IA-009KDH999-N31-2015	ITP-AS-DCAGI-SC-036/15	Servicios profesionales de consultoría, legales y/o normativos y acompañamiento en los procedimientos de contratación pública y elaboración de la memoria documental integral del desarrollo del  Nuevo Aeropuerto Internacional de la Ciudad de México	Servicios profesionales de consultoría, legales y/o normativos y acompañamiento en los procedimientos de contratación pública y elaboración de la memoria documental integral del desarrollo del  Nuevo Aeropuerto Internacional de la Ciudad de México	terminated	2015-06-02 00:00:00	2015-12-31 00:00:00	17200000	MXN	2015-06-02 00:00:00	\N	
51	51	AO-009KDH999-E18-2016	AD-OP-DCAGI-SC-108/15	Proyecto ejecutivo para la construcción de carriles de desaceleración, plataformas de almacenamiento y carriles de aceleración en las puertas 7, y 9 de acceso al polígono del NAICM.	Proyecto ejecutivo para la construcción de carriles de desaceleración, plataformas de almacenamiento y carriles de aceleración en las puertas 7, y 9 de acceso al polígono del NAICM.	terminated	2015-11-30 00:00:00	2015-12-29 00:00:00	690000.00	MXN	2015-11-30 00:00:00	\N	
111	111	IO-009KDH999-N53-2015	ITP-SRO-DCAGI-SC-044/15	Servicios relacionados con el programa de empleo temporal (PET) correspondiente a las acciones preparatorias para la contrucción del nuevo aeropuerto Internacional de la Ciudad de México (Servicio de traslado de personas en vehículos ligeros).	Servicios relacionados con el programa de empleo temporal (PET) correspondiente a las acciones preparatorias para la contrucción del nuevo aeropuerto Internacional de la Ciudad de México (Servicio de traslado de personas en vehículos ligeros).	terminated	2015-07-13 00:00:00	2015-12-31 00:00:00	4880000.00	MXN	2015-07-13 00:00:00	\N	
45	45	AO-009KDH999-E31-2016	AD-SRO-DCAGI-SC-098/15	Servicio de asistencia técnica especializada en materia de Geotecnia y Cimentación aplicada a la infraestructura aeroportuaria.	Servicio de asistencia técnica especializada en materia de Geotecnia y Cimentación aplicada a la infraestructura aeroportuaria.	terminated	2015-12-01 00:00:00	2016-05-01 00:00:00	1683620.69	MXN	2015-12-01 00:00:00	\N	
106	106	AD-SRO-DCAGI-SC-002/2015	AD-SRO-DCAGI-SC-002/2015	Plan de Monitoreo, registro y verificación de emisión de gases de efecto invernadero para el Nuevo Aeropuerto Internacional de la Ciudad de México.	  Prestación de los servicos consistentes en la elaboración de estudios de geotécnia, topografia,  gedésia  y levantamiento de información geografica através de un vuelo con tecnología Lidar.	terminated	2015-02-24 00:00:00	2015-05-24 00:00:00	29233731	MXN	2015-02-23 00:00:00	\N	
52	52	AA-009KDH999-E58-2016	AD-AS-DCAGI-SC-110/15	Servicio de Testigo Social para que Atestigüe la Etapas del Procedimiento de la Licitación Pública Nacional de Obra Pública de Carga, Acarreo y Descarga Dentro y Fuera del Polígono del Material Existente, Producto de Depósitos de Demoliciones y Desazolve, Incluye Conformación del Terreno donde se Construirá el Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM) para el NAICM	Servicio de Testigo Social para que Atestigüe la Etapas del Procedimiento de la Licitación Pública Nacional de Obra Pública de Carga, Acarreo y Descarga Dentro y Fuera del Polígono del Material Existente, Producto de Depósitos de Demoliciones y Desazolve, Incluye Conformación del Terreno donde se Construirá el Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM) para el NAICM	terminated	2015-12-01 00:00:00	\N	332975.00	MXN	2015-12-01 00:00:00	\N	
53	53	IA-009KDH999-E95-2015	ITP-AS-DCAGI-SC-004/16	Servicios de Asesoria en Materia Fiscal para la Recuperacion de Saldos a favor de IVA e ISR, así mismo Asesoria Respecto al Cumplimiento de Tratados Internacionales para evitar la Doble Tributación.	Servicios de Asesoria en Materia Fiscal para la Recuperacion de Saldos a favor de IVA e ISR, así mismo Asesoria Respecto al Cumplimiento de Tratados Internacionales para evitar la Doble Tributación.	terminated	2016-02-11 00:00:00	2019-02-18 00:00:00	18000000.00	MXN	2016-02-11 00:00:00	\N	
74	74	1	GACM/DCI/SJ/CI/008/2015	Estudio de rehabilitacion y adaptacion de los canales existentes para que funcionen como infraestructura de drenaje temporal, y remocion de material de desecho, en el terreno del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	Estudio de rehabilitacion y adaptacion de los canales existentes para que funcionen como infraestructura de drenaje temporal, y remocion de material de desecho, en el terreno del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	terminated	2015-05-01 00:00:00	2015-06-30 00:00:00	1206165.79	MXN	2015-05-01 00:00:00	\N	
112	112	IA-009KDH999-N56-2015	ITP-AS-DCAGI-SC-058/15	Servicio de asesoría técnica y capacitación a 800 trabajadores del programa empleo temporal de mano de obra campesina o urbana marginada para los 7 ejidos colindantes al predio del NAICM.	Servicio de asesoría técnica y capacitación a 800 trabajadores del programa empleo temporal de mano de obra campesina o urbana marginada para los 7 ejidos colindantes al predio del NAICM.	pending	2015-08-19 00:00:00	2015-12-31 00:00:00	6318719.99	MXN	2015-08-19 00:00:00	\N	
4	4	SO-009KDH999-N24-2015	AD-SRO-DCAGI-SC-005/15	Plan de Acciones de Monitoreo y Conservación de Aves para el Nuevo Aeropuerto Internacional de la Ciudad de México.	Plan de acciones de monitoreo y conservación de aves para el Nuevo Aeropuerto Internacional de la Ciudad de México	terminated	2015-02-20 00:00:00	2015-03-20 00:00:00	521999.84	MXN	2015-02-19 00:00:00	\N	
55	55	-	AD-AS-DCAGI-SC-008/16	Testigo Social para que atestigue las etapas del Procedimiento de Licitación Publica Nacional para el Proyecto denominado "Excavación de Prueba, Losa Experimental y Prueba de Pilotes para el Edificio Terminal y Torre de Control	Testigo Social para que atestigue las etapas del Procedimiento de Licitación Publica Nacional para el Proyecto denominado "Excavación de Prueba, Losa Experimental y Prueba de Pilotes para el Edificio Terminal y Torre de Control	active	2016-02-10 00:00:00	\N	269225.44	MXN	2016-02-10 00:00:00	\N	
90	90	-	AD-AS-DCAGI-SC--102/15	Contrato abierto plurianual de prestación de servicios especializados en el suministro de "terceros".	Obtención de la prestacion de servicios especializados en el suministro de "terceros".	active	2015-12-01 00:00:00	2018-12-31 00:00:00	625917655.58	MXN	2014-12-01 00:00:00	\N	
54	54	AA-009KDH999-E80-2016	AD-AS-DCAGI-SC-006/16	Servicios de Asesoría, Relacionados con la Implementación de la Estructura de Gobierno Corporativo para la Administración del Grupo Aeroportuario de La Ciudad de México, S. A. de C. V	Servicios de Asesoría, Relacionados con la Implementación de la Estructura de Gobierno Corporativo para la Administración del Grupo Aeroportuario de La Ciudad de México, S. A. de C. V	terminated	2016-02-15 00:00:00	2016-02-22 00:00:00	207000.00	MXN	2016-02-15 00:00:00	\N	
108	108	SO-009KDH999-N21-2015	AD-SRO-DCAGI-SC-007/15	Programa de rescate y reubicación de flora para el Nuevo Aeropuerto Internacional de la Ciudad de México.	Programa de rescate y reubicación de flora para el Nuevo Aeropuerto Internacional de la Ciudad de México.	terminated	2015-02-19 00:00:00	2015-03-20 00:00:00	394999.95	MXN	2015-02-19 00:00:00	\N	
85	85	-	AD-SRO-DCAGI-SC-003/15	Plan de Maestro  para  el  Proyecto	Plan de Maestro  para  el  Proyecto	terminated	\N	\N	1495000	MXN	2015-03-02 00:00:00	\N	
78	78	IA-009KDH999-N31-2015	ITP-AS-DCAGI-SC-036/15	Servicios profesionales de consultoría, legales y/o normativos y acompañamiento en los procedimientos de contratación pública y elaboración de la memoria documental integral del desarrollo del  Nuevo Aeropuerto Internacional de la Ciudad de México	Servicios profesionales de consultoría, legales y/o normativos y acompañamiento en los procedimientos de contratación pública y elaboración de la memoria documental integral del desarrollo del  Nuevo Aeropuerto Internacional de la Ciudad de México	terminated	2015-06-02 00:00:00	2015-12-31 00:00:00	17200000	MXN	\N	\N	
56	56	LO-009KDH999-E94-2015	LPN-SRO-DCAGI-SC-009/2016	Estudio de Ingeniería Geomática para el Proyecto Pistas, Plataformas, Calles de Rodaje y Edificios del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM), para Generar un modelo Digital de Terreno (MDT) a Través de la Tecnología HIGH Definition Surveying (HDS), Empleando Equipos GNSS, Escáner Láser y Ecosonda.	Estudio de Ingeniería Geomática para el Proyecto Pistas, Plataformas, Calles de Rodaje y Edificios del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM), para Generar un modelo Digital de Terreno (MDT) a Través de la Tecnología HIGH Definition Surveying (HDS), Empleando Equipos GNSS, Escáner Láser y Ecosonda.	terminated	2016-02-22 00:00:00	2016-05-06 00:00:00	41324450.46	MXN	2016-02-22 00:00:00	\N	
68	68	1	GACM/DCI/SJ/CI/001-2015	Llevar a cabo el servicio de elaboración de programas y propuestas de acciones, ambientales para el proyecto Nuevo Aeropuerto de la Ciudad de México (NAICM)	Llevar a cabo el servicio de elaboración de programas y propuestas de acciones, ambientales para el proyecto Nuevo Aeropuerto de la Ciudad de México (NAICM)	terminated	2015-01-01 00:00:00	2015-03-31 00:00:00	6610000.00	MXN	2015-01-01 00:00:00	\N	
89	89	-	GACM/DCI/SJ/CM-018-2015	Estalecer las bases generales a que se sujetaran GACM y la UANL así como, pactos comunes y el objeto genperico de futuros servicios de acaácter científico y tecnologico u otro tipo que acuerden las mismas	Estalecer las bases generales a que se sujetaran GACM y la UANL así como, pactos comunes y el objeto genperico de futuros servicios de acaácter científico y tecnologico u otro tipo que acuerden las mismas	active	2015-09-09 00:00:00	\N	0	MXN	2015-09-09 00:00:00	\N	
77	77	AA-009KDH999-E2-2016	AD-AS-DCAGI-SC-031/15	Prestación de los Servicios consistentes en la elaboración del Plan de Acciones de Monitoreo y Conservación de Aves para el Nuevo Aeropuerto Internacional de la Ciudad de México	Servicio relacionado con el programa de empleo temporal (PET) correspondiente a las acciones preparatorias para la construcción del Nuevo Aeropuerto Internacional de la Ciudad de México (servicio de traslado de personas)	terminated	2015-05-18 00:00:00	2015-06-26 00:00:00	800000	MXN	\N	\N	
107	107	SO-009KDH999-N3-2015	AD-SRO-DCAGI-SC-006/15	Programa de Rescate de Fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México. de fecha enero de 2015 por Instituto de Investigación y Capacitación para las Ciencias Biológicas, A.C.	Programa de Rescate de Fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México. de fecha enero de 2015 por Instituto de Investigación y Capacitación para las Ciencias Biológicas, A.C.	terminated	2015-02-20 00:00:00	2015-03-20 00:00:00	374999.10	MXN	2015-02-19 00:00:00	\N	
1	1	LO-009KDH999-N5-2014	LPN-O-DCAGI-SC-014/14	Extracción de ademes y restitución del terreno que ocupan dichos elementos ubicados en la poligonal para el Nuevo Aeropuerto Internacional de la Ciudad de México	Extracción de ademes y restitución del terreno que ocupan dichos elementos ubicados en la poligonal para el Nuevo Aeropuerto Internacional de la Ciudad de México	terminated	2015-01-05 00:00:00	2015-07-03 00:00:00	39724276.56	MXN	2015-01-02 00:00:00	\N	ART. 27 FRACCIÓN I DE LA  LOPSRM
23	22	LO-009KDH999-N79-2015	LPN-OP-DCAGI-SC-112/15	Trabajos relativos a la nivelación y limpieza del terreno  del NAICM	Trabajos relativos a la nivelación y limpieza del terreno  del NAICM	active	2015-12-14 00:00:00	2017-01-13 00:00:00	2044851759.9543998	MXN	2015-12-14 00:00:00	\N	ART. 27 FRACCION I DE LOPSRM
9	10	LO-009KDH999-N46-2015	LPN-SRO-DCAGI-SC-041/15	Plan de monitoreo y conservación de aves del proyecto Nuevo Aeropuerto Internacional de la Ciudad de México	Plan de monitoreo y conservación de aves del proyecto Nuevo Aeropuerto Internacional de la Ciudad de México	active	2015-07-21 00:00:00	2016-12-31 00:00:00	16684244.27	MXN	2015-07-21 00:00:00	\N	
5	5	SO-09KDH999-N26-2015	AD-SRO-DCAGI-SC-013/15	Plan de monitoreo, registro y verificación de emisión de gases de efecto invernadero para el Nuevo Aeropuerto Intenacional de la Ciudad de México	Plan de monitoreo, registro y verificación de emisión de gases de efecto invernadero para el Nuevo Aeropuerto Intenacional de la Ciudad de México	terminated	2015-02-20 00:00:00	2015-03-19 00:00:00	539400	MXN	2015-02-19 00:00:00	\N	
7	7	IO-009KDH999-N41-2015	ITP-SRO-DCAGI-SC-048/15	Estudio de las características topográficas del terreno del Nuevo Aeropuerto Internacional de la Ciudad de México	Estudio de las características topográficas del terreno del Nuevo Aeropuerto Internacional de la Ciudad de México	terminated	2015-07-29 00:00:00	2015-09-26 00:00:00	38949488.17	MXN	2015-07-29 00:00:00	\N	ART. 42 FRACCIÓN XI DE LA LOPSRM
81	81	IO009KDH999-T3-2014	ITP-SR-DCAGI-SC-015/2015	Elaboración del proyecto ejecutivo (ingenierías) para el diseño de la parte "Aeronáutica" (área de movimiento) de pistas, calles de rodaje, plataformas, áreas para el mantenimiento de aeronaves, servicio de combustibles de aviación, restricción y eliminación de obstáculos, servicio de salvamento y extinción de incendios (SSEI), ayudas visuales para la navegación, ayudas visuales indicadoras de obstáculos, ayudas visuales indicadoras de zonas de uso restringido, sistemas eléctricos de ayudas visuales para la navegación, mantenimiento de aeródromo, huella de ruido, agua potable y drenaje, programa de mantenimiento, sistemas de transporte de la información, acompañamiento en el proceso de obra, que contemple las características y elementos físicos para el "NAICM", con base en las flotas de aeronaves que operan y operarán en el Nuevo Aeropuerto en el futuro inmediato y con base en las normas nacionales e internacionales en materia de aeronáutica y de aviación civil	Elaboración del proyecto ejecutivo (ingenierías) para el diseño de la parte "Aeronáutica" (área de movimiento) de pistas, calles de rodaje, plataformas, áreas para el mantenimiento de aeronaves, servicio de combustibles de aviación, restricción y eliminación de obstáculos, servicio de salvamento y extinción de incendios (SSEI), ayudas visuales para la navegación, ayudas visuales indicadoras de obstáculos, ayudas visuales indicadoras de zonas de uso restringido, sistemas eléctricos de ayudas visuales para la navegación, mantenimiento de aeródromo, huella de ruido, agua potable y drenaje, programa de mantenimiento, sistemas de transporte de la información, acompañamiento en el proceso de obra, que contemple las características y elementos físicos para el "NAICM", con base en las flotas de aeronaves que operan y operarán en el Nuevo Aeropuerto en el futuro inmediato y con base en las normas nacionales e internacionales en materia de aeronáutica y de aviación civil	active	2015-02-09 00:00:00	2019-02-07 00:00:00	1079335930.23	MXN	2015-02-05 00:00:00	\N	
3	3	SO-009KDH999-N18-2015	AD-SRO-DCAGI-SC-011/15	Prestación de los Servicios consistentes en la elaboración del Plan de manejo  ambiental para el Nuevo Aeropuerto  Internacional de la Ciudad de México.	Prestación de los Servicios consistentes en la elaboración del Plan de manejo  ambiental para el Nuevo Aeropuerto  Internacional de la Ciudad de México.	terminated	2015-02-23 00:00:00	2015-03-20 00:00:00	550000	MXN	2015-02-20 00:00:00	\N	ART. 43 DE LA LOPSRM
40	40	AO-009KDH999-E39-2016	AD-SRO-DCAGI-SC-088/15	Servicios de asistencia técnica especializada en materia de diseño sismico estructural aplicada a la infraestructura aeroportuaria.	Servicios de asistencia técnica especializada en materia de diseño sismico estructural aplicada a la infraestructura aeroportuaria.	terminated	2015-12-01 00:00:00	2016-05-23 00:00:00	1465517.24	MXN	2015-12-01 00:00:00	\N	
21	21	LO-009KDH999-N78-2015	LPN-OP-DCAGI-SC-115/15	Carga, Acarreo y Descarga fuera del polígono del material existente producto de depósitos de demoliciones, desperdicios y desazolve.	Carga, Acarreo y Descarga fuera del polígono del material existente producto de depósitos de demoliciones, desperdicios y desazolve.	active	2015-12-31 00:00:00	2016-08-26 00:00:00	572943111	MXN	2015-12-31 00:00:00	\N	ART. 27 FRACCION I DE LOPSRM
109	109	IO-009KDH999-N11-2015	ITP-OP-DCAGI-SC-014/15	Construcción de Caminos de Acceso a la Zona del Edificio Terminal de la Primera Etapa, necesarios para la caracterización Geotécnica Inicial	Construcción de Caminos de Acceso a la Zona del Edificio Terminal de la Primera Etapa, necesarios para la caracterización Geotécnica Inicial	terminated	2015-03-19 00:00:00	2015-05-17 00:00:00	8129259.88	MXN	2015-03-19 00:00:00	\N	
24	24	LO-099KDH999-N20-2015	LPN-O-DCAGI-SC-024/15	Construcción de accesos y plataformas para exploración geotécnica para la pista número 2 del Nuevo Aeropuerto Internacional de la Ciudad de México.	Construcción de accesos y plataformas para exploración geotécnica para la pista número 2 del Nuevo Aeropuerto Internacional de la Ciudad de México.	active	2015-05-14 00:00:00	2016-06-27 00:00:00	5844840.96	MXN	2015-05-14 00:00:00	\N	ART. 27 FRACCION I DE LOPSRM
6	6	IO-009KDH999-N10-2015	ITP-SRO-DCAGI-SC-016/15	Supervisión para la obra: extracción de ademes y restitución del terreno que ocupan dichos elementos ubicados en la poligonal para el Nuevo Aeropuerto Internacional de la Ciudad de México	Supervisión para la obra: extracción de ademes y restitución del terreno que ocupan dichos elementos ubicados en la poligonal para el Nuevo Aeropuerto Internacional de la Ciudad de México	terminated	2015-03-21 00:00:00	2015-09-16 00:00:00	2501985.67	MXN	2015-03-20 00:00:00	\N	
10	9	LO-009KDH999-N45-2015	LPN-SRO-DCAGI-SC-043/15	Implementación del plan de restauración ecológica para el Nuevo Aeropuerto Internacional de la Ciudad de México	Implementación del plan de restauración ecológica para el Nuevo Aeropuerto Internacional de la Ciudad de México	active	2015-07-21 00:00:00	2016-12-31 00:00:00	21963669.40	MXN	2015-07-21 00:00:00	\N	ART. 27 FRACCION I DE LOPSRM
19	20	AO-009KDH999-E20-2016	AD-SRO-DCAGI-SC-003/16	Supervisión de la construcción del drenaje pluvial temporal del Nuevo Aeropuerto Internacional de la Ciudad de México.	Supervisión de la construcción del drenaje pluvial temporal del Nuevo Aeropuerto Internacional de la Ciudad de México.	active	2016-02-01 00:00:00	2016-06-29 00:00:00	8909803.13	MXN	2016-01-21 00:00:00	\N	ART. 44 ULTIMO PARRAFO DE LA LOPSRM
22	23	LO-009KDH999-N80-2015	LPN-OP-DCAGI-SC-114/15	Construcción de los caminos provisionales de acceso al NAICM, ejecutando trabajos de terracería, estructuras y obras de drenaje, pavimentación y señalamiento.	Construcción de los caminos provisionales de acceso al NAICM, ejecutando trabajos de terracería, estructuras y obras de drenaje, pavimentación y señalamiento.	active	2015-12-31 00:00:00	2017-02-13 00:00:00	705599669.9	MXN	2015-12-31 00:00:00	\N	ART. 27 FRACCION I DE LOPSRM
18	17	IO-009KDH999-E96-2015	ITP-SRO-DCAGI-SC-018/16	Integración de la estratégia global y modelo de negocios para el Nuevo Aeropuerto Internacional de la Ciudad de México	Integración de la estratégia global y modelo de negocios para el Nuevo Aeropuerto Internacional de la Ciudad de México	active	2016-04-01 00:00:00	2016-11-26 00:00:00	91640000	MXN	2016-03-23 00:00:00	\N	ART. 42 FRACCIÓN XI DE LA LOPSRM
15	15	LO-009KDH999-N86-2015	LPN-SRO-DCAGI-SC-117/15	Supervisión técnica, administrativa y de control de calidad para los trabajos de nivelación y limpieza del terreno del Nuevo Aeropuerto Internacional de la Ciudad de México	Supervisión técnica, administrativa y de control de calidad para los trabajos de nivelación y limpieza del terreno del Nuevo Aeropuerto Internacional de la Ciudad de México	active	2015-12-31 00:00:00	2016-12-16 00:00:00	11276263.62	MXN	2015-12-31 00:00:00	\N	
16	16	LO-009KDH999-N87-2015	LPN-SRO-DCAGI-SC-118/15	Supervisión técnica, administrativa y de control de calidad para los trabajos de construcción de los caminos provisionales de acceso al Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	Supervisión técnica, administrativa y de control de calidad para los trabajos de construcción de los caminos provisionales de acceso al Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	active	2015-12-31 00:00:00	2017-01-03 00:00:00	13970275.44	MXN	2015-12-31 00:00:00	\N	
37	37	AA-009KDH999-E53-2016	AD-AS-DCAGI-SC-84/15	Materiales para la Construcción	Materiales para la Construcción	terminated	2015-12-07 00:00:00	2015-12-17 00:00:00	320361.43	MXN	2015-12-07 00:00:00	\N	
38	38	AO-009KDH999-E38-2016	AD-SRO-DCAGI-SC-85/15	Asistencia Técnica Especializada en Materia de Diseño Sísmico Estructural aplicada a la Infraestructura Aeroportuaria	Prestar los servicios de obra consistentes en: Asistencia Técnica Especializada en Materia de Diseño Sísmico Estructural aplicada a la Infraestructura Aeroportuaria"	terminated	2015-12-01 00:00:00	2016-05-23 00:00:00	2104525.86	MXN	2015-12-01 00:00:00	\N	
39	39	1	AD-SRO-DCAGI-SC-087/15	Prestar los servicios de obra consistentes en: Servicios de Experto revisor para el Panel de Hidráulica aplicada a la Infraestructura Aeroportuaria	Prestar los servicios de obra consistentes en: Servicios de Experto revisor para el Panel de Hidráulica aplicada a la Infraestructura Aeroportuaria	terminated	2015-12-01 00:00:00	2016-03-29 00:00:00	1627500.00	MXN	2015-12-01 00:00:00	\N	
27	27	SA-009KDH999-N13-2015	AD-S-DCAGI-SC-016/2014	Servicio de un Testigo Social para que atestigüe en las etapas de la licitación pública nacional presencial relativa a la contratación del servicio de extracción de ademes y restitución del terreno que ocupan dichos elementos, ubicados en el polígono para el Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	Servicio de un Testigo Social para que atestigüe en las etapas de la licitación pública nacional presencial relativa a la contratación del servicio de extracción de ademes y restitución del terreno que ocupan dichos elementos, ubicados en el polígono para el Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	terminated	\N	\N	455149.56	MXN	2014-10-29 00:00:00	\N	
60	60	AO-009KDH999-E52-2016	AD-SRO-DCAGI-SC-039/15	Servicios consistentes en Baños portátiles	Baños portátiles	terminated	2015-07-15 00:00:00	2015-12-31 00:00:00	558618.50	MXN	2015-07-15 00:00:00	\N	
61	61	-	AD-OP-DCAGI-SC-024/16	Obras de Excavación de prueba, Losa experimental y prueba de Pilotes para el El Edificio Terminal y Torre de Control del NAICM	Obras de Excavación de prueba, Losa experimental y prueba de Pilotes para el El Edificio Terminal y Torre de Control del NAICM	none	2016-05-12 00:00:00	2016-10-08 00:00:00	57742619.43	MXN	2016-05-12 00:00:00	\N	
66	66	-	GACM/DCI/SJ/CI/05-2014	"Desarrollo del Proyecto Ejecutivo del Sistema de Video Vigilancia del Nuevo Aeropuerto Internacional de la Ciudad de México".	"Desarrollo del Proyecto Ejecutivo del Sistema de Video Vigilancia del Nuevo Aeropuerto Internacional de la Ciudad de México".	terminated	2014-10-30 00:00:00	2015-01-29 00:00:00	8991688.20	MXN	2014-10-30 00:00:00	\N	
42	42	AD-SRO-DCAGI-SC-095/16	AD-SRO-DCAGI-SC-095/15	Servicios de experto revisor para el panel de hidráiulica aplicada a la infraestructura aeroportuaria.	Servicios de experto revisor para el panel de hidráiulica aplicada a la infraestructura aeroportuaria.	terminated	2015-12-01 00:00:00	2016-03-29 00:00:00	1403017.24	MXN	2015-12-01 00:00:00	\N	
13	13	LO-009KDH999-T52-2015	LPI-SRO-DCAGI-SC-079/15	Diseñar e instrumentar el modelo virtual de información para la construcción (BIM) del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	Diseñar e instrumentar el modelo virtual de información para la construcción (BIM) del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	active	2015-10-23 00:00:00	2019-10-21 00:00:00	158629469.03	MXN	2015-10-23 00:00:00	\N	
14	14	IO-009KDH999-N54-2015	ITP-SRO-DCAGI-SC-063/15	Supervisión para: construcción del proyecto integral consistente en barda y camino perimetral, alumbrado, servicios inducidos y casetas de acceso para el Nuevo Aeropuerto Internacional de la Ciudad de México (primera etapa)	Supervisión para: construcción del proyecto integral consistente en barda y camino perimetral, alumbrado, servicios inducidos y casetas de acceso para el Nuevo Aeropuerto Internacional de la Ciudad de México (primera etapa)	terminated	2015-08-15 00:00:00	2015-12-31 00:00:00	3812525.54	MXN	2015-08-15 00:00:00	\N	
12	12	LO-009KDH999-N50-2015	LPN-OP-DCAGI-SC-076/15	Para los trabajos relativos a la construcción del drenaje pluvial temporal del Nuevo Aeropuerto de la Ciudad de México	Para los trabajos relativos a la construcción del drenaje pluvial temporal del Nuevo Aeropuerto de la Ciudad de México	terminated	2015-10-09 00:00:00	2016-03-07 00:00:00	223329692.62	MXN	2015-10-09 00:00:00	\N	ART. 27 FRACCION I DE LOPSRM
25	25	LO-099KDH999-T15-2015	LPI-SRO-DCAGI-SC-030/15	Estudio mediante el cual se definan las características técnicas de infraestructura y diseño esquemático de la terminal de carga del Nuevo Aeropuerto Internacional de la Ciudad de México.	Estudio mediante el cual se definan las características técnicas de infraestructura y diseño esquemático de la terminal de carga del Nuevo Aeropuerto Internacional de la Ciudad de México.	active	2015-05-29 00:00:00	2016-09-03 00:00:00	13514000	MXN	2015-05-29 00:00:00	\N	ART. 27 FRACCION I DE LOPSRM
82	82	IO-009KDH999-E45-2016	ITP-SRO-DCAGI-SC-034/16	Servicios de apoyo técnico a la residencia del proyecto ejecutivo de diseño arquitectónico e ingeniería de detalle del edificio terminal de pasajeros, torre de control y centro de operaciones, edificio de estacionamiento, estacionamientos en superficie, estación multimodal y vialidades de acceso del NAICM	Servicios de apoyo técnico a la residencia del proyecto ejecutivo de diseño arquitectónico e ingeniería de detalle del edificio terminal de pasajeros, torre de control y centro de operaciones, edificio de estacionamiento, estacionamientos en superficie, estación multimodal y vialidades de acceso del NAICM	terminated	\N	\N	8380018.06	MXN	\N	\N	
57	57	AD-SRO-DCAGI-SC-010/16	AD-SRO-DCAGI-SC-010/16	Servicio de Experto Revisor para el Panel de Hidráulica Aplicada a la Infraestructura Aeroportuaria.	Servicio de Experto Revisor para el Panel de Hidráulica Aplicada a la Infraestructura Aeroportuaria.	terminated	2016-01-29 00:00:00	2015-05-29 00:00:00	1627500	MXN	2016-01-29 00:00:00	\N	
28	28	SA-009KDH999-N12-2015	AD-S-DCAGI-SC-017/2014	Servicio de un Testigo Social para que atestigüe en las etapas de la invitación a cuando menos tres personas, presencial, internacional bajo la cobertura de trarados de libre comercio, relativa a la contratación de los servicios relacionados con obra pública, consistentes en el desarrollo del proyecto ejecutivo de pistas, rodajes y plataformas y ayudas a la navegación y otras instalaciones del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	Servicio de un Testigo Social para que atestigüe en las etapas de la invitación a cuando menos tres personas, presencial, internacional bajo la cobertura de trarados de libre comercio, relativa a la contratación de los servicios relacionados con obra pública, consistentes en el desarrollo del proyecto ejecutivo de pistas, rodajes y plataformas y ayudas a la navegación y otras instalaciones del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	terminated	\N	\N	539531.22	MXN	2014-10-29 00:00:00	\N	
41	41	AD-SRO-DCAGI-SC-094/16	AD-SRO-DCAGI-SC-094/15	Servicios de experto revisor para la asistencia técnica especializada en materia de diseño sismico estructural, aplicada a la infraestructura aeroportuaria	Servicios de experto revisor para la asistencia técnica especializada en materia de diseño sismico estructural, aplicada a la infraestructura aeroportuaria	terminated	2015-12-01 00:00:00	2016-05-23 00:00:00	189000	DLLS	2015-12-01 00:00:00	\N	
63	63	-	GACM/DCI/SJ/CI/02-2014	"Estudio para definir los bancos de préstamo, bancos de depósito y laboratorio de materiales, para el Proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México"	"Estudio para definir los bancos de préstamo, bancos de depósito y laboratorio de materiales, para el Proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México"	none	2014-10-30 00:00:00	2014-12-15 00:00:00	13051740.00	MXN	2015-10-30 00:00:00	\N	
8	8	LO-009KDH999-N47-2015	LPN-OP-DCAGI-SC-066/15	Desarrollo del proyecto ejecutivo, construcción, equipamiento de, mobiliario e instalaciones complementarias para el campamento del Grupo Aeroportuario de la Ciudad de México (GACM) en el sitio del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	Desarrollo del proyecto ejecutivo, construcción, equipamiento de, mobiliario e instalaciones complementarias para el campamento del Grupo Aeroportuario de la Ciudad de México (GACM) en el sitio del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	terminated	2015-09-10 00:00:00	2016-04-06 00:00:00	129973731.2	MXN	2015-09-10 00:00:00	\N	ART. 27 FRACCION I DE LOPSRM
83	83	IO009KDH99-N53-2015	ITP-SRO-DCAGI-SC-044/15	Servicios relacionados con el programa de empleo temporal (pet) correspondiente a las acciones preparatorias para la construcción del nuevo aeropuerto internacional de la Ciudad de México (servicio de traslado de personas, en vehìculos ligeros) 	Servicios relacionados con el programa de empleo temporal (pet) correspondiente a las acciones preparatorias para la construcción del nuevo aeropuerto internacional de la Ciudad de México (servicio de traslado de personas, en vehìculos ligeros) 	terminated	2015-07-13 00:00:00	2015-12-31 00:00:00	4880000.00	MXN	2015-07-13 00:00:00	\N	
11	11	LO-009KDH999-N42-2015	LPN-SRO-DCAGI-SC-042/15	Implementación del programa de rescate de flora y fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México	Implementación del programa de rescate de flora y fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México	active	2015-07-21 00:00:00	2016-12-31 00:00:00	13832891.67	MXN	2015-07-21 00:00:00	\N	
17	18	AO-009KDH999-E26-2016	AD-SRO-DCAGI-SC-002/16	Supervisión del proyecto ejecutivo, construcción, equipamiento, mobiliario e instalaciones complementarias para el campamento del Grupo Aeroportuario de la Ciudad de México (GACM) en el sitio del Nuevo Aeropuerto Internacional de la Ciudad de México.	Supervisión del proyecto ejecutivo, construcción, equipamiento, mobiliario e instalaciones complementarias para el campamento del Grupo Aeroportuario de la Ciudad de México (GACM) en el sitio del Nuevo Aeropuerto Internacional de la Ciudad de México.	active	2016-01-14 00:00:00	2016-07-11 00:00:00	4286458.44	MXN	2016-01-14 00:00:00	\N	ART. 44 ULTIMO PARRAFO DE LA LOPSRM
20	19	IO-009KDH999-E15-2016	ITP-OP-DCAGI-SC-012/16	Construcción de accesos y plataformas para exploración geotécnica, rehabilitación de tramos de prueba y bacheo somero de caminos existentes dentro del terreno para el Nuevo Aeropuerto Internacional de la Ciudad de México	Construcción de accesos y plataformas para exploración geotécnica, rehabilitación de tramos de prueba y bacheo somero de caminos existentes dentro del terreno para el Nuevo Aeropuerto Internacional de la Ciudad de México	terminated	2016-03-10 00:00:00	2016-06-07 00:00:00	12715541.31	MXN	2016-03-10 00:00:00	\N	ART. 27 FRACCIÓN II DE LA LOPSRM
29	29	SO-009KDH999-N74-2015	AD-SRO-DCAGI-SC-001/15	Proyecto ejecutivo del drenaje pluvial temporal para la protección de la zona contra inundaciones provenientes de precipitaciones dentro del perímetro del Aeropuerto en el lago de Texcoco, durante la construcción de la primera fase del Nuevo Aeropuerto Internacional de la Ciudad de México 	Proyecto ejecutivo del drenaje pluvial temporal para la protección de la zona contra inundaciones provenientes de precipitaciones dentro del perímetro del Aeropuerto en el lago de Texcoco, durante la construcción de la primera fase del Nuevo Aeropuerto Internacional de la Ciudad de México 	terminated	2015-05-26 00:00:00	2015-03-19 00:00:00	16708712.52	MXN	2015-02-19 00:00:00	\N	
58	58	SO-09KDH999-N26-2015	AD-AS-DCAGI-SC-011/16	Propuesta para la realización del Servicio de Ambulancia para el Traslado de Personal, para el Programa de Empleo Temporal (PET).	Propuesta para la realización del Servicio de Ambulancia para el Traslado de Personal, para el Programa de Empleo Temporal (PET).	active	2016-02-15 00:00:00	2016-08-12 00:00:00	259000.00	MXN	2016-02-15 00:00:00	\N	
84	84	IO-009KDH999-N81-2015	ITP-SRO-DCAGI-SC-082/15	Servicio de transporte con camionetas de redilas para los trabajos que conforman el programa de empleo temporal (PET), en el predio del Nuevo Aeropuerto Internacional de la Ciudad de México	Servicio de transporte con camionetas de redilas para los trabajos que conforman el programa de empleo temporal (PET), en el predio del Nuevo Aeropuerto Internacional de la Ciudad de México	active	2015-10-22 00:00:00	\N	1176000	MXN	2015-10-02 00:00:00	\N	
2	2	IO-009KDH999-N11-2015	ITP-OP-DCAGI-SC-014/15	Construcción de caminos de acceso a la zona del edificio terminal de la primera etapa, necesarios para la caracterización geotécnica inicial	Construcción de caminos de acceso a la zona del edificio terminal de la primera etapa, necesarios para la caracterización geotécnica inicial	terminated	2015-03-05 00:00:00	2015-05-18 00:00:00	9429941.46	MXN	2015-03-19 00:00:00	\N	ART. 43 DE LA LOPSRM
30	30	LO-009KDH999-N16-2015	LPN-SRO-DCAGI-SC-025/15	Estudio de Suministro Electrico para el Nuevo Aeropuerto Internacional de la Ciudad de México	Servicios relativos al Estudio de Suministro Electrico para el Nuevo Aeropuerto Internacional de la Ciudad de México	terminated	2015-05-15 00:00:00	2015-08-27 00:00:00	7582404.32	MXN	2015-05-15 00:00:00	\N	
46	46	AO-009KDH999-E40-2016	AD-SRO-DCAGI-SC-099/15	Servicios de Asistencia Técnica Especializada en Materia de Diseño Sismico Estructural Aplicada a la Infraestructura Aeroportuaria.	Servicios de Asistencia Técnica Especializada en Materia de Diseño Sismico Estructural Aplicada a la Infraestructura Aeroportuaria.	terminated	2015-12-01 00:00:00	2015-05-23 00:00:00	2104525.86	MXN	2015-12-01 00:00:00	\N	
59	59	AA-009KDH999-E3-2016	AD-AS-DCAGI-SC-056/16	Servicio de un Testigo Social para que atestigüe las etapas del procedimiento de la Licitación Pública Nacional, relativa a la contratación de la obra pública, para la construcción del proyecto ejecutivo de drenaje pluvial temporal para la protección de la zona durante la construcción de la primera fase del NAICM	Servicio de un Testigo Social para que atestigüe las etapas del procedimiento de la Licitación Pública Nacional, relativa a la contratación de la obra pública, para la construcción del proyecto ejecutivo de drenaje pluvial temporal para la protección de la zona durante la construcción de la primera fase del NAICM	terminated	2015-08-15 00:00:00	2015-12-15 00:00:00	463501.20	MXN	2015-08-15 00:00:00	\N	
31	31	 IO-009KDH999-N51-2015	ITP-SRO-DCAGI-SC-049/2015	Programa general de abastecimiento, uso y disposición de agua del nuevo Aeropuerto Internacional de la Ciudad de México (PROAGUA), Etapa I	Programa general de abastecimiento, uso y disposición de agua del nuevo Aeropuerto Internacional de la Ciudad de México (PROAGUA), Etapa I	terminated	2015-07-31 00:00:00	2015-12-31 00:00:00	8150489.03	MXN	2015-07-31 00:00:00	\N	
72	72	1	GACM/DCI/CJ/SJ/014-2015	Instrumentación de Planes y Programas Ambientales para el Proyecto del NAICM	Instrumentación de Planes y Programas Ambientales para el Proyecto del NAICM	terminated	2015-06-01 00:00:00	2015-12-03 00:00:00	30100000.00	MXN	2015-06-01 00:00:00	\N	
32	32	SA009KDH99-N73-2015	AD-AS-DCAGI-SC-050/2015	Servicio de testigo social para que atestigue las etapas del procedimiento de licitación pública nacional presencial, relativa a la contratación de la obra pública, consistente en el proyecto ejecutivo, construcción equipamiento mobiliario e instalaciones complementarias, para el campamento del grupo aeroportuario de la Ciudad de México en el sitio del Nuevo Aeropuerto Internacional de la Ciudad de México 	Servicio de testigo social para que atestigue las etapas del procedimiento de licitación pública nacional presencial, relativa a la contratación de la obra pública, consistente en el proyecto ejecutivo, construcción equipamiento mobiliario e instalaciones complementarias, para el campamento del grupo aeroportuario de la Ciudad de México en el sitio del Nuevo Aeropuerto Internacional de la Ciudad de México 	terminated	2015-06-30 00:00:00	2015-12-31 00:00:00	247200.64	MXN	2015-06-30 00:00:00	\N	
33	33	AA-009KDH999-E4-2016	AD-AS-DCAGI-SC-62/15	Servicio de un testigo social para que atestigüe las etapas del procedimiento de la licitación pública internacional bajo la cobertura de tratados de libre comercio, consistente en diseñar e instrumentar el modelo virtual de información para la construcción del BIM del NAICM	Servicio de un testigo social para que atestigüe las etapas del procedimiento de la licitación pública internacional bajo la cobertura de tratados de libre comercio, consistente en diseñar e instrumentar el modelo virtual de información para la construcción del BIM del NAICM	active	2015-08-14 00:00:00	2015-12-31 00:00:00	432601.12	MXN	2015-08-14 00:00:00	\N	
34	34	IO-009KDH999-N43-2015	ITP-SRO-DCAGI-SC-040/15	Elaboración del proyecto de terracerías de los caminos provisionales para la construcción del Nuevo Aeropuerto Internacional de la Ciudad de México	Elaboración del proyecto de terracerías de los caminos provisionales para la construcción del Nuevo Aeropuerto Internacional de la Ciudad de México	terminated	2015-07-01 00:00:00	2015-08-29 00:00:00	7062852.40	MXN	2015-07-01 00:00:00	\N	
35	35	IO-009KDH999-N30-2015	ITP-SRO-DCAGI-SC-045/15	Servicio de: Asesoria Legal en materia de Derecho de la Aviación, Derecho Aeropuertario, Derecho Internacional y Especializado en Asesoría en Negociación con Empresas Nacionales e Internacionales, en general acompañamiento respecto de todo aquel Procedimiento Jurídico de las distintas materias que reconoce nuestro Sistema Jurídico Mexicano.	Asesoria Legal en materia de Derecho de la Aviación, Derecho Aeropuertario, Derecho Internacional y Especializado en Asesoría en Negociación con Empresas Nacionales e Internacionales, en general acompañamiento respecto de todo aquel Procedimiento Jurídico de las distintas materias que reconoce nuestro Sistema Jurídico Mexicano.	terminated	2015-06-24 00:00:00	2015-12-31 00:00:00	14964000.00	MXN	2015-06-24 00:00:00	\N	
76	76	AD/01CTO.MTO./2015	AD/01CTO.MTO./2014	Servicios de diseño y arquitectura consistentes en forma enunciativa mas no limitativa, en la elaboración de los proyectos ejecutivos (diseño arquitectónico e ingeniería de detalle), que permitan la construcción del "edificio terminal de pasajeros, vialidades de acceso y estacionamientos" y "torre de control y centros de control de operaciones" del "NAICM" así como el acompañamiento arquitectónico	Servicios de diseño y arquitectura consistentes en forma enunciativa mas no limitativa, en la elaboración de los proyectos ejecutivos (diseño arquitectónico e ingeniería de detalle), que permitan la construcción del "edificio terminal de pasajeros, vialidades de acceso y estacionamientos" y "torre de control y centros de control de operaciones" del "NAICM" así como el acompañamiento arquitectónico	active	2014-12-01 00:00:00	2018-11-29 00:00:00	1841753116	MXN	2014-12-01 00:00:00	\N	
48	48	AO-009KDH999-E14-2016	AD-SRO-DCAGI-SC-103/15	Estudios del Sistema de Drenaje Pluvial del Nuevo Aeropuerto Internacional de la Ciudad de México.	Estudios del Sistema de Drenaje Pluvial del Nuevo Aeropuerto Internacional de la Ciudad de México.	terminated	2015-12-01 00:00:00	2016-01-29 00:00:00	18726530.31	MXN	2015-11-30 00:00:00	\N	
99	99	1	AD-AS-DCAGI-SC-012/2014	Servicios de Auditoría Externa que se realizarán sobre los estados financieros de la entidad con cifras al 31 de diciembre de 2014. 	Servicios de Auditoría Externa que se realizarán sobre los estados financieros de la entidad con cifras al 31 de diciembre de 2014. 	terminated	2014-11-01 00:00:00	2015-11-01 00:00:00	46371.00	MXN	2014-11-01 00:00:00	\N	
87	87	SO-09KDH999-N26-2015	AD-SRO-DCAGI-SC-030/16	Pruebas de Laboratorio Geotécnicas complementarias para el Proyecto Ejecutivo de Sistema de Drenaje Temporal del Nuevo Aeropuerto Internacional de la Ciudad de México	Pruebas de Laboratorio Geotécnicas complementarias para el Proyecto Ejecutivo de Sistema de Drenaje Temporal del Nuevo Aeropuerto Internacional de la Ciudad de México	terminated	2016-04-15 00:00:00	2016-04-29 00:00:00	163184.04	MXN	2016-04-22 00:00:00	\N	
96	96	1	AD-SRO-CONV-DCAGI-SC-03/16	Establecer las bases a las que se sujetarán Grupo Aeroportuario de la Ciudad de México S.A. de C.V: y el Instituto Mexicano del Transporte para que en forma reciproca se proporcionen los apoyos necesarios en materia de recursos humanos, materiales, tecnológicos, de inormación y capacitación en haras de lograr la efectiva colaboración para la realización del Proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México.	Establecer las bases a las que se sujetarán Grupo Aeroportuario de la Ciudad de México S.A. de C.V: y el Instituto Mexicano del Transporte para que en forma reciproca se proporcionen los apoyos necesarios en materia de recursos humanos, materiales, tecnológicos, de inormación y capacitación en haras de lograr la efectiva colaboración para la realización del Proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México.	active	2016-06-10 00:00:00	2020-12-31 00:00:00	0		2016-06-10 00:00:00	\N	
97	97	1	AD-SRO-CONV-DCAGI-SC-04/16	Brindar la asistencia técnica, asesoramiento, colaboración, coadyuvancia, consultoría, orientación y dé propuestas de soluciones a las distintas situaciones que se presenten, en lo referente a la logística de operación para la realización de las obras al exterior del polígono, en donde se alojará la construcción del NAICM, e incluye el seguimiento y la aprobación de los estudios y proyectos que se necesiten en materia de infraestructura carretera y demás actividades afines.	Brindar la asistencia técnica, asesoramiento, colaboración, coadyuvancia, consultoría, orientación y dé propuestas de soluciones a las distintas situaciones que se presenten, en lo referente a la logística de operación para la realización de las obras al exterior del polígono, en donde se alojará la construcción del NAICM, e incluye el seguimiento y la aprobación de los estudios y proyectos que se necesiten en materia de infraestructura carretera y demás actividades afines.	active	2016-04-01 00:00:00	2020-12-31 00:00:00	0		2016-04-01 00:00:00	\N	
98	98	1	GACM/DCPEV/SJ/CG/02-2015	Establecer los mecanismos de colaboración entre Grupo Aeroportuario de la Ciudad de México y el Instituto Mexicano de Administarción Pública A.C. para llevar a cabo, mediante la suscripción del instrumento correspondiente el desarrollo y ejecución de las actividades de los programas y proyectos que el GACM requeira a traves de la prestación de servicios relativos a als especialidades y disciplinas especificas, el INAP este en posibilidades de aportar.	"Establecer los mecanismos de colaboración entre Grupo Aeroportuario de la Ciudad de México y el Instituto Mexicano de Administarción Pública A.C. para llevar a cabo, mediante la suscripción del instrumento correspondiente el desarrollo y ejecución de las actividades de los programas y proyectos que el GACM requeira a traves de la prestación de servicios relativos a als especialidades y disciplinas especificas, el INAP este en posibilidades de aportar."	active	2015-01-08 00:00:00	2020-10-20 00:00:00	0		2015-01-08 00:00:00	\N	
91	91	IO009KDH99-N83-2015	ITP-SRO-DCAGI-SC-107/15	Desarrollo del Proyecto ejecutivo para el entronque de acceso de carga en la zona Norte del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	Desarrollo del Proyecto ejecutivo para el entronque de acceso de carga en la zona Norte del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	pending	2015-11-24 00:00:00	2015-12-31 00:00:00	8090576.25	MXN	2015-11-08 00:00:00	\N	
92	92	-	ITP-AS-DCAGI-SC-017/15	Contrato de prestación de servicios para la contratación del "Servicio integral de administración de personal y proceso de nomina, mediante un sistema especializado para recursos humanos y de nómina de gobierno"	Obtención de la prestacion del servicio integral de administración de personal y proceso de nomina, mediante un sistema especializado para recursos humanos y de nómina de gobierno.	terminated	2015-03-12 00:00:00	2015-12-31 00:00:00	1295000.00	MXN	2015-03-12 00:00:00	\N	
93	93	-	GACM/DCI/SJ/CM/01-2014	Establecer Las bases generales a que se sujetarán GACM y la COMISION así como, pactos comunes y el objeto - generico de futuros servicios de cracter cientifico y tecnologico u otro tipo que acuerden las mismas, mediante la celebración de los respectivos contratos especificos de prestación de servicios.	Establecer Las bases generales a que se sujetarán GACM y la COMISION así como, pactos comunes y el objeto - generico de futuros servicios de cracter cientifico y tecnologico u otro tipo que acuerden las mismas, mediante la celebración de los respectivos contratos especificos de prestación de servicios.	active	2014-10-30 00:00:00	\N	0		2014-10-30 00:00:00	\N	
94	94	-	GACM-SPF/01/2014-2017	Los servicios de protección, custodia, vigilancia y seguridad en los bienes e intalaciones de GACM.	Los servicios de protección, custodia, vigilancia y seguridad en los bienes e intalaciones de GACM.	active	2014-10-16 00:00:00	2017-10-15 00:00:00	0	MXN	2014-10-15 00:00:00	\N	
95	95	LA-009KDH999-E29-2016	LPN-AS-DACGI-SC-033/16	Servicio de Transporte de personas en autobuses y de traslado de maquinaria y equipo en camionetas de redilas para el programa de empleo temporal.	Servicio de Transporte de personas en autobuses y de traslado de maquinaria y equipo en camionetas de redilas para el programa de empleo temporal.	active	2016-04-27 00:00:00	2016-12-16 00:00:00	15856320	MXN	2016-05-02 00:00:00	\N	
43	43	AO-009KDH999-E34-2016	AD-SRO-DCAGI-SC-096/15	Servicios de experto revisor para la asistencia técnica especializada en materia de protección contra incendios, aplicada a la infraestructura aeroportuaria.	Servicios de experto revisor para la asistencia técnica especializada en materia de protección contra incendios, aplicada a la infraestructura aeroportuaria.	terminated	2015-12-01 00:00:00	2016-03-25 00:00:00	1898750.00	MXN	2015-12-01 00:00:00	\N	
105	105	GACM/DCI/SJ/CI/011-2015	GACM/DCI/SJ/CI/011-2015	Elaboración y puesta en marcha del Sistema Integeal e Gestión de Cumplimiento Ambiental (SIGCA) para el Proyecto Nuevo Aeropuerto Internacional de la Ciudad de México	Elaboración y puesta en marcha del Sistema Integeal e Gestión de Cumplimiento Ambiental (SIGCA) para el Proyecto Nuevo Aeropuerto Internacional de la Ciudad de México	terminated	2015-06-01 00:00:00	2015-12-03 00:00:00	34800000.00	MXN	2015-06-01 00:00:00	\N	
44	44	AO-009KDH999-E41-2016	AD-SRO-DCAGI-SC-097/15	Servicio de asistencia técnica especializada en materia de hidráulica aplicada a la infraestructura aeroportuaria.	Servicio de asistencia técnica especializada en materia de hidráulica aplicada a la infraestructura aeroportuaria.	terminated	2015-12-02 00:00:00	2016-04-02 00:00:00	1403017.24	MXN	2015-12-01 00:00:00	\N	
69	69	1	GACM/DCI/SJ/CI/012-2015	Llevar a cabo el Servicio de Investigaciones y Estudios Especiales, Relacionados con Aspectos Estructurales del Nuevo Aeropuerto de la Ciudad de México (NAICM) en el Vaso del Ex-Lago de Texcoco, Zona Federal	Llevar a cabo el Servicio de Investigaciones y Estudios Especiales, Relacionados con Aspectos Estructurales del Nuevo Aeropuerto de la Ciudad de México (NAICM) en el Vaso del Ex-Lago de Texcoco, Zona Federal	active	2015-06-01 00:00:00	2016-12-31 00:00:00	55525000.00	MXN	2015-06-01 00:00:00	\N	
70	70	1	GACM/DCI/SJ/CI/013-2015	Llevar a cabo el Servicio de Investigaciones y Estudios Especiales Relacionados con Aspectos Geotécnicos del Nuevo Aeropuerto de la Ciudad de México (NAICM) en el Vaso del Ex-Lago de Texcoco, Zona Federal	Llevar a cabo el Servicio de Investigaciones y Estudios Especiales Relacionados con Aspectos Geotécnicos del Nuevo Aeropuerto de la Ciudad de México (NAICM) en el Vaso del Ex-Lago de Texcoco, Zona Federal	active	2015-06-01 00:00:00	2016-12-31 00:00:00	152849934.00	MXN	2015-06-01 00:00:00	\N	
71	71	1	GACM/DCA/SJ/CI/016-2015	Establecer un mecanismo de coordinación corresponsable entre las partes. Para el mantenimiento y la operación de las obras de infraestructura para llevar a cabo la regulación hidraulica en las zonas aledañas al proyecto que permitan favorecer y mejorar el hábitat para las aves acuáticas migratorias que arrivan a la zona, así como las aves residentes y realizar en forma coordinada la operación y mantenimiento de las obras hidráulicas de regulación y conducción de los escurimientos pluviales provenientes del interior del perímetro del proyecto, durante su etapa de construcción, a través de un sistema de drenaje que operará temporalmente, los cuáles serán regulados en dos lagunas a cargo del GACM y cuyas descargas al Dren General del Valle. Quedarán bajo el control de la CONAGUA	Establecer un mecanismo de coordinación corresponsable entre las partes. Para el mantenimiento y la operación de las obras de infraestructura para llevar a cabo la regulación hidraulica en las zonas aledañas al proyecto que permitan favorecer y mejorar el hábitat para las aves acuáticas migratorias que arrivan a la zona, así como las aves residentes y realizar en forma coordinada la operación y mantenimiento de las obras hidráulicas de regulación y conducción de los escurimientos pluviales provenientes del interior del perímetro del proyecto, durante su etapa de construcción, a través de un sistema de drenaje que operará temporalmente, los cuáles serán regulados en dos lagunas a cargo del GACM y cuyas descargas al Dren General del Valle. Quedarán bajo el control de la CONAGUA	active	2015-05-12 00:00:00	\N	0	MXN	2015-05-12 00:00:00	\N	
73	73	1	GACM/DCI/SJ/CI/007-2015	Servicio de Seguridad para Salvaguardar la vida e integridad física de los trabajadores, la protección de la infraestructura, inmuebles y zonas federales concesionados a la entidad	Servicio de Seguridad para Salvaguardar la vida e integridad física de los trabajadores, la protección de la infraestructura, inmuebles y zonas federales concesionados a la entidad	terminated	2015-04-16 00:00:00	2015-12-31 00:00:00	22440896.40	MXN	2015-04-15 00:00:00	\N	
75	75	1	GACM/DCI/SJ/CM/18-2015	Proyecto de Salvamento Arqueológico en el interior del Lago de Taxcoco en su zona oriente, Estado de México. (Supervisión, Vigilancia y Excavaciones 2016), en Adelante los SERVICIOS, mismos que serán realizados totalmente a satisfacción del GACM	Proyecto de Salvamento Arqueológico en el interior del Lago de Taxcoco en su zona oriente, Estado de México. (Supervisión, Vigilancia y Excavaciones 2016), en Adelante los SERVICIOS, mismos que serán realizados totalmente a satisfacción del GACM	active	2016-02-16 00:00:00	2016-12-31 00:00:00	8761818.10	MXN	2016-02-15 00:00:00	\N	
100	100	AD-CONV-DCAGI-SC-001/16	AD-CONV-DCAGI-SC-001/16	Los servicios de protección, custodia, vigilancia y seguridad de sus bienes e intalaciones, así como el diseño e implementación de sistemas de seguridad y su supervisión permanente .	Los servicios de protección, custodia, vigilancia y seguridad de sus bienes e intalaciones, así como el diseño e implementación de sistemas de seguridad y su supervisión permanente .	active	2016-03-01 00:00:00	2018-11-30 00:00:00	0	MXN	2016-03-01 00:00:00	\N	
101	101	AD-SRO-CONV-DCAGI-SC-002/16	AD-SRO-CONV-DCAGI-SC-002/16	Etapa 2; seguimiento para el cumplimiento ambiental del proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM) a través de la entidad de supervisión ambiental (Condicionante 10, resolutivo MIA-R	Etapa 2; seguimiento para el cumplimiento ambiental del proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM) a través de la entidad de supervisión ambiental (Condicionante 10, resolutivo MIA-R	active	2016-03-01 00:00:00	2018-10-26 00:00:00	227520000.00	MXN	2016-03-01 00:00:00	\N	
104	104	SA-009KDH-N62/2015	AD-AS-DCAGI-SC-047/15	Servicio Integral de Reservación, Expedición y Entrega de Pasajes Aéreos para el personal GACM	Servicios integrales de reservación, expedición de boletos de avión con cobertura en el territorio Nacional e Internacional y otros servicios del ramo para el GACM	active	2015-07-06 00:00:00	2016-12-31 00:00:00	5840518.00	MXN	2015-07-20 00:00:00	\N	
67	67	GACM/DCI/SJ/CM-E/05-2015	GACM/DCI/SJ/CM-E/05-2015	Campaña de exploración Geotécnica de campo 2015. Muestreo y sistemas de Medición en el Subsuelo en las Zonas de Aeropistas, Calles de Rodaje y Caminos Internos del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	Campaña de exploración Geotécnica de campo 2015. Muestreo y sistemas de Medición en el Subsuelo en las Zonas de Aeropistas, Calles de Rodaje y Caminos Internos del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	active	2015-03-02 00:00:00	2015-12-31 00:00:00	157168157.92	MXN	2015-03-02 00:00:00	\N	
64	64	-	GACM/DCI/SJ/CI/03-2014	Estudio para la Detección y Levantamiento de Anomalías, Obstáculos e Instlaciones (Extracción de Ademes), en el Terreno del Nuevo Aeropuerto Internacional de la Ciudad de México.	Estudio para la Detección y Levantamiento de Anomalías, Obstáculos e Instlaciones (Extracción de Ademes), en el Terreno del Nuevo Aeropuerto Internacional de la Ciudad de México.	terminated	2014-10-30 00:00:00	2014-12-30 00:00:00	10954142.71	MXN	2014-10-30 00:00:00	\N	
62	62	Instalación de equipo de Medición de Energía  Eléctrica en las Puertas 7 y 8 del Nuevo aeropuerto Internacional de la Ciudad de México (NAICM)	AD-OP-DCAGI-SC-025/16	Instalación de equipo de Medición de Energía  Eléctrica en las Puertas 7 y 8 del Nuevo aeropuerto Internacional de la Ciudad de México (NAICM)	Instalación de equipo de Medición de Energía  Eléctrica en las Puertas 7 y 8 del Nuevo aeropuerto Internacional de la Ciudad de México (NAICM	terminated	2016-04-11 00:00:00	2016-04-29 00:00:00	67996	MXN	2016-04-11 00:00:00	\N	
36	36	IO-009KDH999-N75-2015	ITP-SRO-DCAGI-SC-080/15	Control, Prevención e Identificación de plagas en el Polígono del NAICM	Control, Prevención e identificación de plagas en el Polígono del Nuevo Aeropuerto Internacional de la Ciudad de México (Primera Etapa)	terminated	2015-10-13 00:00:00	2015-04-12 00:00:00	1495559.05	MXN	2015-10-13 00:00:00	\N	
47	47	AO-009KDH999-E46-2016	AD-SRO-DCAGI-SC-100/15	Servicios de experto revisor para la asistencia técnica especializada en materia de diseño estructural, aplicada  a la infraestructura aeroportuaria.	Servicios de experto revisor para la asistencia técnica especializada en materia de diseño estructural, aplicada  a la infraestructura aeroportuaria.	terminated	2015-12-01 00:00:00	2015-05-23 00:00:00	176400.00	USD	2015-12-01 00:00:00	\N	
49	49	AO-009KDH999-E55-2016	AD-SRO-DCAGI-SC-104/15	Proyecto Ejecutivo para el Alumbrado Público de la Barda Perimetral del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	Proyecto Ejecutivo para el Alumbrado Público de la Barda Perimetral del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	terminated	2015-12-02 00:00:00	2015-12-31 00:00:00	620689.66	MXN	2015-11-30 00:00:00	\N	
50	50	IO-009KDH999-N82-2015	ITP-OP-DCAGl-SC-105/15	Adecuación de espacios para las oficinas del Grupo Aeroportuario de la Ciudad de México (GACM) en el CEMCAS	Adecuación de espacios para las oficinas del Grupo Aeroportuario de la Ciudad de México (GACM) en el CEMCAS	terminated	2015-11-25 00:00:00	2015-12-31 00:00:00	8385420.04	MXN	2015-12-07 00:00:00	\N	
65	65	-	GACM/DCI/SJ/CI/04-2014	Elaboración del Estudio Dictamen del Proyecyo de Inversión (Factibilidad Técnica, Económica, Legal y Estudios Relacionados) del Nuevo Aeropuerto Internacional de la Ciudad de México"	Elaboración del Estudio Dictamen del Proyecyo de Inversión (Factibilidad Técnica, Económica, Legal y Estudios Relacionados) del Nuevo Aeropuerto Internacional de la Ciudad de México"	terminated	2014-10-30 00:00:00	2014-12-15 00:00:00	10954142.71		2014-10-30 00:00:00	\N	
102	102	IO-009KDH999-N29-2015	ITP-SRO-DCAGI-SC-027/15	Servicios de Consultoría Técnica Especializada en Revisión e Integración de Términos de Referencia y Especificaciones Técnicas, de Proyectos de Licitación de Obras Públicas	Servicios de Consultoría Técnica Especializada en Revisión e Integración de Términos de Referencia y Especificaciones Técnicas, de Proyectos de Licitación de Obras Públicas	terminated	2015-05-22 00:00:00	2015-12-31 00:00:00	12642390.01	MXN	2015-05-22 00:00:00	\N	
86	86	L0-009KDH999-N85-2015	AD-SRO-DCAGI-SC-026/16	Supervisión Técnica Administrativa y de Control de Calidad para los Trabajos de Carga, Acarreo y Descarga fuera del Polígono del material existente, producto de depósitos de Demolición, Desperdicio y Desazolve	Supervisión Técnica Administrativa y de Control de Calidad para los Trabajos de Carga, Acarreo y Descarga fuera del Polígono del material existente, producto de depósitos de Demolición, Desperdicio y Desazolve	active	2016-04-01 00:00:00	2016-12-16 00:00:00	7512904.17	MXN	2016-04-08 00:00:00	\N	
103	103	1	ITP-S-DCAGI-SC-004/2014	Contrato abierto plurianual de prestación de servicios especializados en el suministro de "terceros".	Obtención de la prestacion de servicios especializados en el suministro de "terceros".	terminated	2014-12-01 00:00:00	2015-11-30 00:00:00	37181503.72	MXN	2014-12-01 00:00:00	\N	
110	110	IO-009KDH999-N29-2015	ITP-SRO-DCAGI-SC-027/15	Servicios de Consultoría Técnica Especializada en Revisión e Integración de Términos de Referencia y Especificaciones Técnicas, de Proyectos de Licitación de Obras Públicas	Servicios de Consultoría Técnica Especializada en Revisión e Integración de Términos de Referencia y Especificaciones Técnicas, de Proyectos de Licitación de Obras Públicas	terminated	2015-05-22 00:00:00	2015-12-31 00:00:00	12642390.01	MXN	2015-05-22 00:00:00	\N	
\.


--
-- Name: contract_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('contract_id_seq', 113, true);


--
-- Data for Name: contractamendmentchanges; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY contractamendmentchanges (id, contractingprocess_id, contract_id, property, former_value) FROM stdin;
1	1	\N	monto total de $42,798,015.58, más $6´847,682.49 por concepto de IVA., haciendo un total de $43´645´698.07	39724276.56
2	1	\N	Se amplía el tiempo de ejecución de los trabajo de 180 días naturales a 223 días naturales, que iniciaron el 13 de febrero de 2015.	180 días naturales
3	6	\N	 2a. cláusula (monto): se modifica el monto del contrato, de $2,501,985.67 a $2,849,089.98.	 2501985.67 
4	6	\N	 3a. cláusula (plazo de ejecución): Se amplía el plazo de 180 días a 214 días . La fecha de término del contrato incluyendo convenio se fija 2015-10-20	180 días
6	14	\N	Primer convenio de reconocimento de plazo de la suspensión y fechas de reinicio y terminación de los servicios.	La justificación del primer Convenio se sustenta en que el contrato objeto de la supervisión tambien fue suspendido temporalmente.
7	14	\N	Segundo Convenio Adicional en monto y Plazo de ejecución de los servicios	La justificación del segundo Convenio se sustenta en virtud de que los alcances del contrato objeto de supervisión fueron modificados originando con ello la necesidad de ampliar el monto y plazo
10	67	\N	El monto final se acuerda en $230´538,969.12	$157,168,157.92
11	67	\N	La ampliación a 183 días, por lo que la fecha de terminación del trabajo será el 30 de junio de 2016	2015-12-31
\.


--
-- Name: contractamendmentchanges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('contractamendmentchanges_id_seq', 11, true);


--
-- Data for Name: contractdocuments; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY contractdocuments (id, contractingprocess_id, contract_id, document_type, documentid, title, description, url, date_published, date_modified, format, language) FROM stdin;
1	63	\N	Convenio de colaboración	GACM/DCI/SJ/CI/02-2014	Elaboración de un Estudio para definir los bancos de prestamo, bancos de depósito, y laboratorio de materiales.	Convenio de Colaboración para realizar el Servicio Técnico de "Elaboración de un Estudio para definir los bancos de prestamo, bancos de depósito, y laboratorio de materiales." GACM/DCI/SJ/CI/02-2014		\N	\N		es
2	64	\N	Convenio de colaboración	1	Estudio para la Detección y Levantamiento de Anomalías, Obstáculos e Instlaciones (Extracción de Ademes), en el Terreno del Nuevo Aeropuerto Internacional de la Ciudad de México. 	Convenio de Colaboración para realizar el Servicio Técnico de "Estudio para la Detección y Levantamiento de Anomalías, Obstáculos e Instlaciones (Extracción de Ademes), en el Terreno del Nuevo Aeropuerto Internacional de la Ciudad de México".  GACM/DCI/SJ/CI/03-2014		\N	\N		es
3	66	\N	Convenio de colaboración	1	Desarrollo del Proyecto Ejecutivo del sistema de Video Vigilancia de la Barda Perimtral, Del Nuevo Aeropuerto Internacional de la Ciudad de México	Convenio de Colaboración para llevar a cabo los Servicios en el "Desarrollo del Proyecto Ejecutivo del sistema de Video Vigilancia de la Barda Perimtral, Del Nuevo Aeropuerto Internacional de la Ciudad de México"		\N	\N		es
4	85	\N	Contrato de Prestación de Servicios Relacionados con la Obra Pública por Precios Unitarios y a Tiempo Determinado AD-SRO-DCAGI-SC-003/15	AD-SRO-DCAGI-SC-003/15	Décimo Quinta.- Entrega, verificación y finiquito de "Los Servicios”	Carta de Credito SDNLD1824183 emitida el 2015-10-22 por HSBC MÉXICO S.A		\N	\N		
5	76	\N	Contrato plurianual de servicios AD/01CTO.MTO./2014	AD/01CTO.MTO./2015	Contrato plurianual de servicios AD/01CTO.MTO./2014	Cláusula Décimo Quinta.- Entrega, Verificaión y Finiquito de "Los Servicio"		\N	\N		
6	77	\N	Contrato de prestación de servicios AD-AS-DCAGI-SC-031/15	AD-AS-DCAGI-SC-031/15	Contrato de prestación de servicios	Décimo Sexta.- Administración y Cumplimiento.		\N	\N		
\.


--
-- Name: contractdocuments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('contractdocuments_id_seq', 6, true);


--
-- Data for Name: contractingprocess; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY contractingprocess (id, ocid, fecha_creacion, hora_creacion, etapa) FROM stdin;
81	\N	2016-07-12	12:18:52.609011	\N
82	GACM-IO-009KDH999-E45-2016	2016-07-12	12:18:56.659273	\N
98	GACM/DCPEV/SJ/CG/02-2015	2016-07-12	12:36:16.449042	\N
91	GACM-ITP-SRO-DCAGI-SC-107/15	2016-07-12	12:35:22.810504	\N
56	GACM-LPN-SRO-DCAGI-SC-009/2016	2016-07-11	12:33:06.691694	\N
109	GACM-ITP-OP-DCAGI-SC-014/15	2016-07-12	12:37:34.562634	\N
106	GACM-AD-SRO-DCAGI-SC-002/2015	2016-07-12	12:37:28.721812	\N
83	GACM-IO009KDH99-N53-2015	2016-07-12	12:18:57.970764	\N
1	GACM-LPN-O-DCAGI-SC-014/14	2016-06-10	14:44:17.139362	Contrato
2	GACM-ITP-OP-DCAGI-SC-014/15	2016-06-10	14:44:17.140325	Contrato
4	GACM-AD-SRO-DCAGI-SC-005/15	2016-06-10	14:44:17.140889	Contrato
5	GACM-AD-SRO-DCAGI-SC-013/15	2016-06-10	14:44:17.141102	Contrato
6	GACM-ITP-SRO-DCAGI-SC-016/15	2016-06-10	14:44:17.14139	Contrato
7	GACM-ITP-SRO-DCAGI-SC-048/15	2016-06-10	14:44:17.141589	Contrato
8	GACM-LPN-OP-DCAGI-SC-066/15	2016-06-10	14:44:17.141767	Contrato
9	GACM-LPN-SRO-DCAGI-SC-043/15	2016-06-10	14:44:17.156157	Contrato
10	GACM-LPN-SRO-DCAGI-SC-041/15	2016-06-10	14:44:17.15627	Contrato
11	GACM-LPN-SRO-DCAGI-SC-042/15	2016-06-10	14:44:17.197427	Contrato
12	GACM-LPN-OP-DCAGI-SC-076/15	2016-06-10	14:44:17.197835	Contrato
13	GACM-LPI-SRO-DCAGI-SC-079/15	2016-06-10	14:44:17.19801	Contrato
14	GACM-ITP-SRO-DCAGI-SC-063/15	2016-06-10	14:44:17.198166	Contrato
15	GACM-LPN-SRO-DCAGI-SC-117/15	2016-06-10	14:44:17.198481	Contrato
16	GACM-LPN-SRO-DCAGI-SC-118/15	2016-06-10	14:44:17.223294	Contrato
17	GACM-ITP-SRO-DCAGI-SC-018/16	2016-06-10	14:44:17.231138	Contrato
18	GACM-AD-SRO-DCAGI-SC-002/16	2016-06-10	14:44:17.232253	Contrato
19	GACM-ITP-OP-DCAGI-SC-012/16	2016-06-10	14:44:17.235242	Contrato
20	GACM-AD-SRO-DCAGI-SC-003/16	2016-06-10	14:44:17.237216	Contrato
21	GACM-LPN-OP-DCAGI-SC-115/15	2016-06-10	14:44:51.460974	Contrato
22	GACM-LPN-OP-DCAGI-SC-112/15	2016-06-10	14:44:51.465493	Contrato
24	GACM-LPN-O-DCAGI-SC-024/15	2016-06-10	14:44:51.466147	Contrato
25	GACM-LPI-SRO-DCAGI-SC-030/15	2016-06-10	14:44:51.466353	Contrato
23	GACM-LPN-OP-DCAGI-SC-114/15	2016-06-10	14:44:51.465944	Contrato
3	GACM-AD-SRO-DCAGI-SC-011/15	2016-06-10	14:44:17.14059	Contrato
37	GACM-AD-AS-DCAGI-SC-84/15	2016-07-11	10:23:32.499628	\N
27	GACM-AD-S-DCAGI-SC-016/2014	2016-07-10	17:40:36.700388	\N
57	GACM-AD-SRO-DCAGI-SC-010/16	2016-07-11	12:40:44.110692	\N
28	GACM-AD-S-DCAGI-SC-017/2014	2016-07-10	17:43:06.764736	\N
40	GACM-AD-SRO-DCAGI-SC-088/15	2016-07-11	10:55:42.751402	\N
39	GACM-AD-SRO-DCAGI-SC-087/15	2016-07-11	10:55:40.068248	\N
38	GACM-AD-SRO-DCAGI-SC-85/15	2016-07-11	10:23:36.310357	\N
58	GACM-AD-AS-DCAGI-SC-011/16	2016-07-11	12:40:45.827255	\N
29	GACM-AD-SRO-DCAGI-SC-001/15	2016-07-10	17:43:13.72782	\N
30	LPN-SRO-DCAGI-SC-025/15	2016-07-11	10:22:47.669968	\N
31	GACM-ITP-SRO-DCAGI-SC-049/2015	2016-07-11	10:22:49.968112	\N
43	GACM-AD-SRO-DCAGI-SC-096/15	2016-07-11	10:56:05.075635	\N
59	GACM-AD-AS-DCAGI-SC-056/16	2016-07-11	12:40:48.571564	\N
32	GACM-AD-AS-DCAGI-SC-050-2015	2016-07-11	10:22:52.009101	\N
60	GACM-AD-SRO-DCAGI-SC-039/15	2016-07-11	12:40:51.233292	\N
33	GACM-AD-AS-DCAGI-SC-62/15	2016-07-11	10:23:11.255474	\N
34	GACM-ITP-SRO-DCAGI-SC-040/15	2016-07-11	10:23:13.824243	\N
61	GACM-AD-OP-DCAGI-SC-024/16	2016-07-11	12:40:53.330964	\N
35	GACM-ITP-SRO-DCAGI-SC-045/15	2016-07-11	10:23:15.175056	\N
36	GACM-ITP-SRO-DCAGI-SC-080/15	2016-07-11	10:23:16.550808	\N
62	GACM-AD-OP-DCAGI-SC-025/16	2016-07-11	12:40:54.946245	\N
47	GACM-AD-SRO-DCAGI-SC-100/15	2016-07-11	11:33:43.906239	\N
63	GACM/DCI/SJ/CI/02-2014	2016-07-11	12:40:56.827288	\N
48	GACM-AD-SRO-DCAGI-SC-103/15	2016-07-11	12:32:19.77576	\N
65	GACM/DCI/SJ/CI/04-2014	2016-07-11	12:41:04.074808	\N
49	GACM-AD-SRO-DCAGI-SC-104/15	2016-07-11	12:32:23.297884	\N
50	GACM-ITP-OP-DCAGl-SC-105/15	2016-07-11	12:32:25.337247	\N
64	GACM/DCI/SJ/CI/03-2014	2016-07-11	12:40:58.395283	\N
51	GACM-AD-OP-DCAGI-SC-108/15	2016-07-11	12:32:27.377438	\N
66	GACM/DCI/SJ/CI/05-2014	2016-07-11	12:41:05.385557	\N
52	GACM-AD-AS-DCAGI-SC-110/15	2016-07-11	12:32:28.762543	\N
53	GACM-ITP-AS-DCAGI-SC-004/16	2016-07-11	12:32:30.449359	\N
54	GACM-AD-AS-DCAGI-SC-006/16	2016-07-11	12:32:32.36985	\N
55	GACM-AD-AS-DCAGI-SC-008/16	2016-07-11	12:32:34.442156	\N
77	GACM-AD-AS-DCAGI-SC-031/15	2016-07-12	12:18:45.753357	\N
97	GACM-AD-SRO-CONV-DCAGI-SC-04/16	2016-07-12	12:36:14.514954	\N
86	GACM-AD-SRO-DCAGI-SC-026/16	2016-07-12	12:35:13.344549	\N
67	GACM/DCI/SJ/CM-E/05-2015	2016-07-11	17:10:33.729308	\N
69	GACM/DCI/SJ/CI/012-2015	2016-07-11	17:10:51.157066	\N
70	GACM/DCI/SJ/CI/013-2015	2016-07-11	17:10:52.717855	\N
71	GACM/DCA/SJ/CI/016-2015	2016-07-11	17:10:54.09351	\N
72	GACM/DCI/CJ/SJ/014-2015	2016-07-11	17:10:55.277624	\N
73	GACM/DCI/SJ/CI/007-2015	2016-07-11	17:10:56.557033	\N
74	GACM/DCI/SJ/CI/008/2015	2016-07-11	17:10:57.788659	\N
75	GACM/DCI/SJ/CM/18-2015	2016-07-11	17:10:59.062939	\N
41	GACM-AD-SRO-DCAGI-SC-094/15	2016-07-11	10:55:44.883443	\N
42	GACM-AD-SRO-DCAGI-SC-095/15	2016-07-11	10:55:46.552989	\N
44	GACM-AD-SRO-DCAGI-SC-097/15	2016-07-11	10:56:09.464616	\N
45	GACM-AD-SRO-DCAGI-SC-098/15	2016-07-11	10:56:12.54916	\N
68	GACM/DCI/SJ/CI/001-2015	2016-07-11	17:10:49.517467	\N
88	GACM/DCI/SJ/CM/18/2015	2016-07-12	12:35:17.442182	\N
87	GACM-AD-SRO-DCAGI-SC-030/16	2016-07-12	12:35:15.58597	\N
89	GACM/DCI/SJ/CM-018-2015	2016-07-12	12:35:19.194092	\N
78	GACM-IA-009KDH999-N31-2015	2016-07-12	12:18:47.361208	\N
96	GACM-AD-SRO-CONV-DCAGI-SC-03/16	2016-07-12	12:36:12.403855	\N
90	GACM-AD-AS-DCAGI-SC--102/15	2016-07-12	12:35:20.891357	\N
99	GACM-AD-AS-DCAGI-SC-012/2014	2016-07-12	12:36:20.978264	\N
79	GACM-A-009KDH999-E23-2016	2016-07-12	12:18:49.408705	\N
92	GACM-ITP-AS-DCAGI-SC-017/15	2016-07-12	12:35:24.579249	\N
100	GACM-AD-CONV-DCAGI-SC-001/16	2016-07-12	12:36:22.345603	\N
107	GACM-AD-SRO-DCAGI-SC-006/15	2016-07-12	12:37:30.706134	\N
108	GACM-AD-SRO-DCAGI-SC-007/15	2016-07-12	12:37:32.370022	\N
110	GACM-ITP-SRO-DCAGI-SC-027/15	2016-07-12	12:37:36.675548	\N
84	GACM-IO-009KDH999-N81-2015	2016-07-12	12:18:59.506376	\N
111	GACM-ITP-SRO-DCAGI-SC-044/15	2016-07-12	12:37:39.161358	\N
112	GACM-ITP-AS-DCAGI-SC-058/15	2016-07-12	12:37:41.449404	\N
113	GACM-ITP-S-DCAGI-SC-004/2014	2016-07-12	12:37:43.649897	\N
85	GACM-AD-SRO-DCAGI-SC-003/15	2016-07-12	12:19:01.521479	\N
76	GACM-AD/01CTO.MTO./2014	2016-07-12	12:18:41.961606	\N
46	GACM-AD-SRO-DCAGI-SC-099/15	2016-07-11	10:56:15.884391	\N
94	GACM-SPF/01/2014-2017	2016-07-12	12:35:28.138169	\N
101	GACM-AD-SRO-CONV-DCAGI-SC-002/16	2016-07-12	12:36:23.953288	\N
104	GACM-AD-AS-DCAGI-SC-047/15	2016-07-12	12:36:29.634261	\N
93	GACM/DCI/SJ/CM/01-2014	2016-07-12	12:35:26.530309	\N
103	GACM-ITP-S-DCAGI-SC-004/2014	2016-07-12	12:36:28.242326	\N
95	GACM-LPN-AS-DACGI-SC-033/16	2016-07-12	12:35:43.537848	\N
105	GACM/DCI/SJ/CI/011-2015	2016-07-12	12:36:32.459089	\N
102	GACM-ITP-SRO-DCAGI-SC-027/15	2016-07-12	12:36:26.410551	\N
80	GACM-ITP-AS-DCAGI-SC-036/15	2016-07-12	12:18:50.896471	\N
\.


--
-- Name: contractingprocess_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('contractingprocess_id_seq', 113, true);


--
-- Data for Name: contractitem; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY contractitem (id, contractingprocess_id, contract_id, itemid, description, classification_scheme, classification_id, classification_description, classification_uri, quantity, unit_name, unit_value_amount, unit_value_currency) FROM stdin;
1	1	\N	62501001	Construcción de Aeropistas			Obra pública		\N	Obra	0	
2	3	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
3	4	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
4	6	\N	62903001	Supervisión de Obras			Servicios relacionados con Obra Pública		\N	Supervisión	0	
5	7	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
6	9	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
7	10	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
8	11	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
9	13	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
10	14	\N	62903001	Supervisión de Obras			Servicios relacionados con Obra Pública		\N	Supervisión	0	
11	15	\N	62903001	Supervisión de Obras			Servicios relacionados con Obra Pública		\N	Supervisión	0	
12	16	\N	62903001	Supervisión de Obras			Servicios relacionados con Obra Pública		\N	Supervisión	0	
14	37	\N	1	Obra pública			Servicios relacionados con Obra Pública		\N	Obra	0	
15	38	\N	62501001	Construcción de Aeropistas			Servicios relacionados con Obra Pública		\N	Servicios	0	
16	39	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicios	0	
17	40	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
18	57	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Servicio	0	
19	41	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N		0	
20	29	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio  	0	
22	42	\N	1	Construcción de Aeropistas	Servicios relacionados con Obra Pública	62501001			\N	Servicio	0	
24	43	\N	1	Construcción de Aeropistas	Servicios relacionados con Obra Pública	62501001			\N	Servicio	0	
25	44	\N	1	Construcción de aeropistas	Servicios relacionados con Obra Pública	62501001			\N	Servicio	0	
26	58	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Obra	0	
27	45	\N	1	Construcción de aeropistas	Servicios relacionados con Obra Pública	62501001			\N		0	
28	46	\N	1	Construcción de Aeropistas.	Servicios relacionados con Obra Pública	62501001			\N	Servicio	0	
29	31	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio  	0	
30	60	\N	62501001	Construccion de Aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
31	34	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Proyecto Ejecutivo	0	
32	61	\N	62501001	Construcción de Aeropistas			Obra pública		\N	Obra	0	
33	62	\N	62903001	Construcción de Aereopistas			Obras Publicas		\N	Obra	0	
34	36	\N	62501001	Construcción de aeropistas 			Servicios relacionados con Obra Pública		\N	Servicios relacionados con obra pública	0	
35	47	\N	62501001	Construcción de Aeropistas.			Servicios relacionados con Obra Pública		\N	Servicio	0	
36	48	\N	62501008	Estudios de Preinversión y/o Preparación del Proyecto para Aeropistas.			Servicios relacionados con Obra Pública		\N	Estudio	0	
37	49	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropistas.			Servicios relacionados con Obra Pública		\N	Servicio	0	
38	50	\N	72501001	Construcción de aeropistas			Obra Pública		\N	Obra	0	
39	51	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio  	0	
40	67	\N	1	Estudios de preinersión y/o preparación del proyecto para aeropista	Obra pública	62501008			\N	Obra	0	
41	68	\N	1	Obra pública					\N	Servicio	0	
42	69	\N	1	Obra pública					\N	Estudio	0	
43	70	\N	1	Obra pública					\N	Estudio	0	
44	71	\N	1	Obra pública					\N	Estudio	0	
45	52	\N	62501001	Construcción de Aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
46	72	\N	1	Obra pública					\N	Estudio	0	
47	73	\N	1	Obra pública					\N	Servicio	0	
48	53	\N	62501001	Construcción de Aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
49	74	\N	1	Obra pública					\N	Estudio	0	
50	54	\N	62501001	Construccion de Aeropistas			Obra Pública		\N	Servicio	0	
51	75	\N	1	Obra pública					\N	Obra	0	
52	55	\N	62501001	Construccion de Aeropistas			Obra Publica		\N	Servicio	0	
53	56	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Obra pública		\N	Estudio  	0	
54	68	\N	1	Obra pública					\N	Servicio	0	
55	86	\N	62903001	Supervisón de Obras			Servicios relacionados con Obra Pública		\N	Supervisión	0	
56	87	\N	62501001	Construcción de Aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
57	88	\N	62501001	Construcción de aeropistas			Servicios relacionados con obra pública		\N	Serivicio	0	
58	90	\N	33901	Contratación de servicios especializados en el suministro de "terceros".			Contratación de servicios especializados en el suministro de "terceros".		\N	Servicio	0	
59	99	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
60	91	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Proyecto Ejecutivo 	0	
61	92	\N	33301	Servicio integral de administración de personal y proceso de nomina, mediante un sistema especializado para recursos humanos y de nómina de gobierno			Servicio integral de administración de personal y proceso de nomina, mediante un sistema especializado para recursos humanos y de nómina de gobierno		\N	Servicio	0	
63	102	\N	62501001	Construcción de aeropistas			Servicios relacionados con  Obra Pública		\N	Servicio	0	
64	103	\N	33901	Contratación de servicios especializados en el suministro de "terceros".					\N	Servicio	0	
65	104	\N	1	 					\N		0	
66	95	\N	6220	Edificación no habitacional			Edificación no habitacional		\N		0	
67	105	\N	62501001	Construcción de aeropistas	Servicios relacionados con obra				\N	Obra	0	
68	106	\N	1	Estudios de preinversión y/o preparación del proyecto para aeropista	Servicios relacionados con Obra Pública				\N	Estudio	0	
69	107	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista	Servicios relacionados con Obra Pública				\N	Estudio	0	
70	108	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista	Servicios relacionados con Obra Pública				\N	Estudio	0	
71	109	\N	62501001	Construccion de Aeropistas	Obra Pública				\N	Obra Pública	0	
72	82	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista					\N	Sevicios relacionados con Obra Pública	8380018.06	MXN
73	83	\N	62501001	Construcción de aeropistas		62501001	Construcción de aeropistas		\N	Servicios	4880000.00	MXN
74	83	\N	62501001	Construcción de aeropistas		62501001	Construcción de aeropistas		\N	Servicios	4880000.00	MXN
75	85	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N		1495000	MXN
76	113	\N	33901	Contratación de servicios especializados en el suministro de "terceros".			Contratación de servicios especializados en el suministro de "terceros".		\N	Servicio	0	
77	76	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Proyecto Ejecutivo	1841753116	
\.


--
-- Name: contractitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('contractitem_id_seq', 77, true);


--
-- Data for Name: contractitemadditionalclasifications; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY contractitemadditionalclasifications (id, contractingprocess_id, contract_id, contractitem_id, scheme, description, uri) FROM stdin;
\.


--
-- Name: contractitemadditionalclasifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('contractitemadditionalclasifications_id_seq', 1, false);


--
-- Data for Name: implementation; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY implementation (id, contractingprocess_id, contract_id) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	4
5	5	5
6	7	7
7	6	6
8	10	9
9	8	8
10	9	10
11	11	11
12	12	12
13	13	13
14	14	14
15	15	15
16	16	16
17	20	19
18	18	17
19	19	20
20	17	18
21	23	22
22	22	23
23	21	21
24	24	24
25	25	25
27	27	27
28	28	28
29	29	29
30	30	30
31	31	31
32	32	32
33	33	33
34	34	34
35	35	35
36	36	36
37	37	37
38	38	38
39	39	39
40	40	40
41	41	41
42	42	42
43	43	43
44	44	44
45	45	45
46	46	46
47	47	47
48	48	48
49	49	49
50	50	50
51	51	51
52	52	52
53	53	53
54	54	54
55	55	55
56	56	56
57	57	57
58	58	58
59	59	59
60	60	60
61	61	61
62	62	62
63	63	63
64	64	64
65	65	65
66	66	66
67	67	67
68	68	68
69	69	69
70	70	70
71	71	71
72	72	72
73	73	73
74	74	74
75	75	75
76	76	76
77	77	77
78	78	78
79	79	79
80	80	80
81	81	81
82	82	82
83	83	83
84	84	84
85	85	85
86	86	86
87	87	87
88	88	88
89	89	89
90	90	90
91	91	91
92	92	92
93	93	93
94	94	94
95	95	95
96	96	96
97	97	97
98	98	98
99	99	99
100	100	100
101	101	101
102	102	102
103	103	103
104	104	104
105	105	105
106	106	106
107	107	107
108	108	108
109	109	109
110	110	110
111	111	111
112	112	112
113	113	113
\.


--
-- Name: implementation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('implementation_id_seq', 113, true);


--
-- Data for Name: implementationdocuments; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY implementationdocuments (id, contractingprocess_id, contract_id, implementation_id, document_type, documentid, title, description, url, date_published, date_modified, format, language) FROM stdin;
\.


--
-- Name: implementationdocuments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('implementationdocuments_id_seq', 1, false);


--
-- Data for Name: implementationmilestone; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY implementationmilestone (id, contractingprocess_id, contract_id, implementation_id, milestoneid, title, description, duedate, date_modified, status) FROM stdin;
\.


--
-- Name: implementationmilestone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('implementationmilestone_id_seq', 1, false);


--
-- Data for Name: implementationmilestonedocuments; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY implementationmilestonedocuments (id, contractingprocess_id, contract_id, implementation_id, document_type, documentid, title, description, url, date_published, date_modified, format, language) FROM stdin;
\.


--
-- Name: implementationmilestonedocuments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('implementationmilestonedocuments_id_seq', 1, false);


--
-- Data for Name: implementationtransactions; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY implementationtransactions (id, contractingprocess_id, contract_id, implementation_id, source, implementation_date, value_amount, value_currency, providerorganization_scheme, providerorganization_id, providerorganization_legalname, providerorganization_uri, receiverorganization_scheme, receiverorganization_id, receiverorganization_legalname, receiverorganization_uri, uri, transactionid) FROM stdin;
1	8	\N	\N	Fideicomiso para el desarrollo del Nuevo Aeropuerto Internacional de la Ciudad de México	2015-10-22 00:00:00	10000000.01	MXN									/datos_abiertos/pdf/Campamento/LO-009KDH999-N47-2015_Comprobante_pago_campamento.pdf	\N
2	12	\N	\N	Fideicomiso para el desarrollo del Nuevo Aeropuerto Internacional de la Ciudad de México	2015-11-27 00:00:00	15786533.19								Consorcio integrado por las empresas Calzada Construcciones, S. A. de C. V. y Construcciones y Dragados del Sureste, S. A. de C. V. 		/datos_abiertos/pdf/Drenaje/LO-009KDH999-N50-2015_Comprobante_pago_Drenaje.pdf	1219377
\.


--
-- Name: implementationtransactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('implementationtransactions_id_seq', 2, true);


--
-- Data for Name: planning; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY planning (id, contractingprocess_id, rationale) FROM stdin;
2	2	\N
17	18	\N
20	20	\N
6	6	
9	9	
10	10	
13	13	
14	14	
15	15	
16	16	Supervisar efectivamente que se lleve a cabo la construcción de los caminos provisionales de acceso al Nuevo Aeropuerto de la Ciudad de México, ejecutando trabajos de terracerías, estructuras y obras de drenaje, pavimentación y señalamiento. El objetivo general de la supervisión es el cumplimiento de la Ley de Obras Públicas y Servicios Relacionados con las Mismas y su Reglamento en los procesos que participe de la ejecución de la mencionada obra. 
18	17	
19	19	
21	21	Limpiar la zona donde se alojarán las pistas y edificios principales del Nuevo Aeropuerto Internacional de la Ciudad de México, para ello, se deberán retirar fuera del poligono los materiales producto de depósitos, de demoliciones, desperdicios y desazolve, realizando su carga y acarreo correspondiente, así como su deposito en bancos autorizados por la autoridad competente. 
23	22	El objetivo principal es proporcionar una plataforma de trabajo en el sitio en que se llevarán acabo las futuras actividadesde construcción, esta plataforma de trabajo se realizará para el alcance de la construcción completa del contrato del ingeniero civil marstro e incluye todos los pavimentos de lado aire para pista2 y pista 3con las calles de rodaje y plataformas en el medio, ademas incluye los edificios para las plantas centrales de servicios, la zona de combustibles, las áreas de mantenimiento  y las estaciones de bomberos y rescate y la calle de rodaje transversal para la pista 6.
22	23	Construir la infraestructura de caminos provisionales en la etapa de construcción, para el equipo y maquinaria de construcción de todos los contratistasque participen en la construcción del Nuevo Aeropuerto Internacional de la Ciudad de México, que consiste en terracerías, estructuras, obras de drenaje, pavimentaciób y señalamiento. 
24	24	
25	25	
12	12	
3	3	
4	4	
5	5	
7	7	
11	11	 Implementación del Programa de Rescate de Flora y Fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México
8	8	
37	37	
27	27	
35	35	
38	38	
39	39	
65	65	
40	40	
28	28	
57	57	
58	58	
29	29	
30	30	
31	31	El programa de suministro de agua (SSAGUA) permitirá identficar las alternativas de fuentes de abastecimiento para los distintos usos de agua, con el fin de satisfacer las demandas del proyecto. En este Plan se establecerán las medidas para dar confiabilidad al suministro de agua, así como identificar los aspecto técnicos involucrados, las implicaciones ambientales y el análisis costo benefiio de cada alterntiva de suministro. 
41	41	
42	42	
43	43	
44	44	
45	45	
62	62	
46	46	
59	59	
67	67	
36	36	A fechas recientes, se ha percibido que en el último ciclo reproductivo la población se incrementó ocasionando infestaciones en diversas áreas del polígono, razón por la cual es necesario la implementación de programa de control y prevención de plaga del chapulin. 
32	32	Derivado de la necesidad de transparentar los servicios y obras de la LOPSRM, se solicita a la SFP la designación de un Testigo Social para el procedimiento. 
60	60	
63	63	
1	1	
61	61	
33	33	
47	47	Justificación de las Razones para Ejercer la Opción de Excepción a la Licitación Pública para Aplicar el Procedimiento por Adjudicación Directa por el Artículo 42 Fracción X de la L.O.P.S.R.M. para la Realización de los Servicios Relacionados con la Obra Pública Relativos a "Servicio de Asistencia Técnica Especializada en Materia de Diseño Sísmico Estructural Aplicada a la Infraestructura Aeroportuaria".
34	34	Elaborar el proyecto de terracerías de lso caminos provisionales para la construcción del NAICM, que permimta el libre tránsit de los vehículos en las etapas de la construcción del Nuevo Aeropuerto Internacional de la Ciudad de México. 
50	50	Realizar las adecuación en las oficinas de GACM en el CEMCAS, con la finalidad de contar con los espacios adecuados para la operación diaria. 
49	49	
64	64	
48	48	Dictamen Justificativo de la Contratación por Adjudicación Directa de los Servicios Relacionados con la Obra Pública, con Fundamento en lo que señalan los Artículos 41 y 42 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas y el Artículo 73 del Reglamento.
51	51	
66	66	
68	68	
69	69	
85	85	0
71	71	
76	76	
72	72	
53	53	
73	73	
77	77	
54	54	GACM requiere una reestructura de la arquitectura de información del sitio actual, con el objetivo de unificar en la pagina institucional del GACM. Todos los contendos de los sitios que actualmente existen "GACM" y "NAICM", para así poder brindarle al usuario una experiencia positiva y amigable de navegación en el sitio
74	74	
75	75	
78	78	0
56	56	
83	83	0
80	80	0
81	81	0
82	82	0
84	84	0
70	70	
79	79	0
52	52	Justificación para llevar a cabo la Contratación a través del Procedimiento de Adjudicación Directa, por caso de Excepción, del servicio de Testigo Social, Instituto Mexicano de Auditoría Técnica, A. C. (PM0AC003), Desisgnado por la Secretaría de la Función Pública, con la Finalidad de que Atestigüe las Etapas del Procedimiento de LIcitación Pública Nacional para la Contratación de Obra Pública denominada "Carga , Acarreo y Descarga Dentro y Fuera del Polígono del Material Existente, Producto de Demoliciones  y Desazolve, Incluye Conformación del Terreno donde se Construirá el Nuevo Aeropuerto Internacional de la Ciudad de México".
55	55	Testigo Social para que atestigue las etapas del Procedimiento de Licitación Publica Nacional para el Proyecto denominado "Excavación de Prueba, Losa Experimental y Prueba de Pilotes para el Edificio Terminal y Torre de Control"
86	86	Con la finalidad de Supervisar efectivamente que se lleve a cabo la limpieza extracción, carga, acarreo de material de demoliciones, desperdicios y desazolve a los bancos de tiro, donde se construirá el Nuevo Aeropuerto de la Ciudad de México, en la Zona Federal del antiguo Lago de Texcoco, se requieren los servicios de Supervisión especializada.
87	87	Realizar las pruebas de laboratorio geotécnicas complementarias para determinar las propiedades y características de los materiales existentes, mediante la exploración, muestreo y ensayes de laboratorio
88	88	Se plantea la necesidad de mantener una supervisión arqueológica de los distintos trabajos relacionados con dicha obra, esto con la finalidad de evitar por la acción de las maquinarias y trabajos estructurales, poner en peligro de afectación diversos contextos prehispánicos que pudieran estar cercanos a las áreas de altares y productivas registradas en las temporadas anteriores. En esta nueva etapa de investigación se retomaran algunas áreas para realizar exploraciones arqueológicas (Zonas de amarre) que permitan continuar entendiendo el desarrollo religioso y productivo de los grupos que habitaron los alrededores del lago de Texcoco en tiempos prehispánicos.
96	96	
89	89	Estalecer las bases generales a que se sujetaran GACM y la UANL así como, pactos comunes y el objeto genérico de futuros servicios de carácter científico y tecnológico u otro tipo que acuerden las mismas​
90	90	Documento de Justificación para la autorización de la contratación abierta plurianual para los "Servicios Especializados en el suministro de personal tecnico y administrativo para proyectos de infraestructira aeroportuaria", para Grupo Aeroportuario de la Ciudad de México S.A. de C.V., para los ejercicios fiscales 2015,2016,2017 y 2018.
97	97	
98	98	
99	99	
91	91	Elaborar el poryecto ehecutivo para el entrinque de acceso de carga en la zona norte del NAiCM, que perminta el acceso de vehículos a la nueva terminal.
100	100	
92	92	Documento de Justificación firmado por el Ing. Sergio De Miguel Agüero, Subdirector de Administración.
101	101	
102	102	
93	93	
94	94	
103	103	
95	95	Prestación del servicio de transporte de personas en autobueses y traslado de maquinaria y equipo en camionetas de redilas para el programa de empleo temporal.
104	104	
105	105	
106	106	
107	107	
108	108	
109	109	
110	110	
111	111	
112	112	
113	113	Las actividades que desarrolla GACM requieren de personal capacitado en diferentes ámbitos
\.


--
-- Name: planning_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('planning_id_seq', 113, true);


--
-- Data for Name: planningdocuments; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY planningdocuments (id, contractingprocess_id, planning_id, documentid, document_type, title, description, url, date_published, date_modified, format, language) FROM stdin;
1	78	\N	1409JZL0005	Estudio de factibilidad	Factibilidad técnica, legal y ambiental del proyecto de desarrollo del Nuevo Aeropuerto Internacional de la Ciudad de México	Programa anual de obras públicas y servicios relacionados con las mismas de GACM correspondiente al ejercicio fiscal 2015	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf	\N	\N		
2	79	\N	1409JZL0005	Estudio de factibilidad	Factibilidad técnica, legal y ambiental del proyecto de desarrollo del Nuevo Aeropuerto Internacional de la Ciudad de México	Programa anual de adquisiciones, arrendamiento y servicios del sector público de GACM correspondiente al ejercicio fiscal 2016	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2016/docs/09/r09_kdh_pie.pdf	\N	\N		
\.


--
-- Name: planningdocuments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('planningdocuments_id_seq', 2, true);


--
-- Data for Name: procuringentity; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY procuringentity (id, contractingprocess_id, tender_id, identifier_scheme, identifier_id, identifier_legalname, identifier_uri, name, address_streetaddress, address_locality, address_region, address_postalcode, address_countryname, contactpoint_name, contactpoint_email, contactpoint_telephone, contactpoint_faxnumber, contactpoint_url) FROM stdin;
2	2	\N	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	3	\N	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	4	\N	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	5	\N	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	7	\N	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	6	\N	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	10	\N	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	8	\N	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	9	\N	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11	11	\N	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12	12	\N	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13	13	\N	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14	14	\N	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15	15	\N	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16	16	\N	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17	18	\N	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18	20	\N	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19	19	\N	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20	17	\N	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21	21	\N	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22	23	\N	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23	22	\N	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
24	25	\N	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
25	24	\N	\N	\N	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	1	\N	APF	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N									
27	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
28	28	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
29	29	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
30	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
31	31	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
32	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
33	33	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
34	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
35	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
36	36	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
37	37	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
38	38	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
39	39	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
40	40	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
41	41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
42	42	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
43	43	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
44	44	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
45	45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
46	46	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
47	47	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
48	48	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
49	49	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
50	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
51	51	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
52	52	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
53	53	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
54	54	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
55	55	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
56	56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
57	57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
58	58	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
59	59	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
60	60	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
61	61	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
62	62	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
63	63	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
64	64	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
65	65	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
66	66	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
67	67	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
68	68	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
69	69	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
70	70	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
71	71	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
72	72	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
73	73	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
74	74	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
75	75	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
76	76	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
77	77	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
78	78	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
79	79	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
80	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
81	81	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
82	82	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
83	83	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
84	84	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
85	85	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
86	86	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
87	87	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
88	88	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
89	89	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
90	90	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
91	91	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
92	92	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
93	93	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
94	94	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
95	95	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
96	96	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
97	97	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
98	98	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
99	99	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
100	100	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
101	101	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
102	102	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
103	103	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
104	104	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
105	105	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
106	106	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
107	107	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
108	108	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
109	109	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
110	110	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
111	111	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
112	112	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
113	113	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Name: procuringentity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('procuringentity_id_seq', 113, true);


--
-- Data for Name: procuringentityadditionalidentifiers; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY procuringentityadditionalidentifiers (id, contractingprocess_id, tender_id, procuringentity_id, scheme, legalname, uri) FROM stdin;
\.


--
-- Name: procuringentityadditionalidentifiers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('procuringentityadditionalidentifiers_id_seq', 1, false);


--
-- Data for Name: publisher; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY publisher (id, contractingprocess_id, name, scheme, uid, uri) FROM stdin;
1	1	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
2	2	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
3	3	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
4	4	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
5	5	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
6	7	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
7	6	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
8	10	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
9	8	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
10	9	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
11	11	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
12	12	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
13	13	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
14	14	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
15	15	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
16	16	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
17	20	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
18	18	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
19	19	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
20	17	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
21	22	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
22	23	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
23	21	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
24	24	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
25	25	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
27	27	\N	\N	\N	\N
28	28	\N	\N	\N	\N
29	29	\N	\N	\N	\N
30	30	\N	\N	\N	\N
31	31	\N	\N	\N	\N
32	32	\N	\N	\N	\N
33	33	\N	\N	\N	\N
34	34	\N	\N	\N	\N
35	35	\N	\N	\N	\N
36	36	\N	\N	\N	\N
37	37	\N	\N	\N	\N
38	38	\N	\N	\N	\N
39	39	\N	\N	\N	\N
40	40	\N	\N	\N	\N
41	41	\N	\N	\N	\N
42	42	\N	\N	\N	\N
43	43	\N	\N	\N	\N
44	44	\N	\N	\N	\N
45	45	\N	\N	\N	\N
46	46	\N	\N	\N	\N
47	47	\N	\N	\N	\N
48	48	\N	\N	\N	\N
49	49	\N	\N	\N	\N
50	50	\N	\N	\N	\N
51	51	\N	\N	\N	\N
52	52	\N	\N	\N	\N
53	53	\N	\N	\N	\N
54	54	\N	\N	\N	\N
55	55	\N	\N	\N	\N
56	56	\N	\N	\N	\N
57	57	\N	\N	\N	\N
58	58	\N	\N	\N	\N
59	59	\N	\N	\N	\N
60	60	\N	\N	\N	\N
61	61	\N	\N	\N	\N
62	62	\N	\N	\N	\N
63	63	\N	\N	\N	\N
64	64	\N	\N	\N	\N
65	65	\N	\N	\N	\N
66	66	\N	\N	\N	\N
67	67	\N	\N	\N	\N
68	68	\N	\N	\N	\N
69	69	\N	\N	\N	\N
70	70	\N	\N	\N	\N
71	71	\N	\N	\N	\N
72	72	\N	\N	\N	\N
73	73	\N	\N	\N	\N
74	74	\N	\N	\N	\N
75	75	\N	\N	\N	\N
76	76	\N	\N	\N	\N
77	77	\N	\N	\N	\N
78	78	\N	\N	\N	\N
79	79	\N	\N	\N	\N
80	80	\N	\N	\N	\N
81	81	\N	\N	\N	\N
82	82	\N	\N	\N	\N
83	83	\N	\N	\N	\N
84	84	\N	\N	\N	\N
85	85	\N	\N	\N	\N
86	86	\N	\N	\N	\N
87	87	\N	\N	\N	\N
88	88	\N	\N	\N	\N
89	89	\N	\N	\N	\N
90	90	\N	\N	\N	\N
91	91	\N	\N	\N	\N
92	92	\N	\N	\N	\N
93	93	\N	\N	\N	\N
94	94	\N	\N	\N	\N
95	95	\N	\N	\N	\N
96	96	\N	\N	\N	\N
97	97	\N	\N	\N	\N
98	98	\N	\N	\N	\N
99	99	\N	\N	\N	\N
100	100	\N	\N	\N	\N
101	101	\N	\N	\N	\N
102	102	\N	\N	\N	\N
103	103	\N	\N	\N	\N
104	104	\N	\N	\N	\N
105	105	\N	\N	\N	\N
106	106	\N	\N	\N	\N
107	107	\N	\N	\N	\N
108	108	\N	\N	\N	\N
109	109	\N	\N	\N	\N
110	110	\N	\N	\N	\N
111	111	\N	\N	\N	\N
112	112	\N	\N	\N	\N
113	113	\N	\N	\N	\N
\.


--
-- Name: publisher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('publisher_id_seq', 113, true);


--
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY supplier (id, contractingprocess_id, award_id, name, identifier_scheme, identifier_id, identifier_legalname, identifier_uri, address_streetaddress, address_locality, address_region, address_postalcode, address_countryname, contactpoint_name, contactpoint_email, contactpoint_telephone, contactpoint_faxnumber, contactpoint_url) FROM stdin;
40	39	\N	ADRIÁN PEDROZO ACUÑA		PEAA751126	ADRIÁN PEDROZO ACUÑA		Calle Cerro Coporo número 12	Coyoacán	Ciudad de México	4200	México					
41	40	\N	Luis Esteva Maraboto		EEML3501314D3	Luis Esteva Maraboto		Cerro Prieto, número 5	Coyoacan	Ciudad de México	4320	México					
2	2	\N	INGENIEROS CIVILES ASOCIADOS, S.A. DE C.V.	Obra Pública	ICA850812MV0	INGENIEROS CIVILES ASOCIADOS, S.A. DE C.V.	https://www.ica.com.mx/es_ES/web/ica/		\N	\N	\N	México	\N	\N	\N	\N	\N
45	42	\N	Óscar José Vega y Roldán		ERO381205AA9	Óscar José Vega y Roldán		Cerro del Horno #54	Coyoacán	Ciudad de México	04320	México					
46	43	\N	Ramón Edgardo Domínguez Betancourt		DOBR4110225Z8	Ramón Edgardo Domínguez Betancourt		 Francia número131, casa 5	Alvaro Obregón	Ciudad de México	1030	México					
47	44	\N	Oscar José Vega y Roldan		VERO381205AA9	Oscar José Vega y Roldan		Calle Cerro del Horno 	Coyoacan	México Distrito Federal	4320	México					
48	58	\N	Martín Salvador Sánchez Robles		SARM760718RK3	Martín Salvador Sánchez Robles		Popocatépetl 13, colonia Arenal Tenayuca	Tlanepantla	Estado de México	54150	México					
76	71	\N	COMISIÓN NACIONAL DEL AGUA		CONAGUA	COMISIÓN NACIONAL DEL AGUA		Avenida Insurgentes Sur No. 2616	Coyoacán	Ciudad de México	04340	México					
102	93	\N	Comisión Federal de Electridad		CFE370814Q10	Comisión Federal de Electridad		Reforma número 164, Piso 14, Juarez	Cuauthemoc	Distrito Federal	06000	México					
121	112	\N	Agencia de Desarrollo Rural Martelli, S. C. de R. L. M.I.		ADR120111NV2	Agencia de Desarrollo Rural Martelli, S. C. de R. L. M.I.		Insurgentes 46, Col. Irolo	Tepeapulco	Hidalgo	43991	México					
9	8	\N	ACCIONES GRUPO DE ORO, S.A. DE C.V.	Obra Pública	AGO090512QT4	ACCIONES GRUPO DE ORO, S.A. DE C.V.	http://www.grupodeoro.com.mx/	Lope de Vega 117, piso 6, Colonia Polanco	Miguel Hidalgo	Ciudad de México	11560	México	\N	\N	\N	\N	\N
37	37	\N	ALAN MAURICIO RAMÍREZ GRANIEL		RAGA8807022R4	ALAN MAURICIO RAMÍREZ GRANIEL		Real del Rosario Lote 401, colonia Real del Valle	Pachuca de Soto	Hidalgo	42086	México					
38	38	\N	ENRIQUE ÁLVARO TAMEZ GONZÁLEZ		TAGE250811PC2	ENRIQUE ÁLVARO TAMEZ GONZÁLEZ		Avenida Explanada número 1615	Lomas de Chapultepec		11000	México					
39	27	\N	Academia de Ingeniería, S. A.		AIN0203116A1	Academia de Ingeniería, S. A.		Tacuba 5, Centro Histórico	Cuauhtémoc	Distrito Federal	06000	México					
56	61	\N	Cimentaciones Mexicanas, S. A. de C. V.		CME841114A61	Cimentaciones Mexicanas, S. A. de C. V.		Avenida Paseo de la reforma número 300, piso 13, colonia Juárez	Cuauhtemoc	Ciudad de México	06600	México					
122	113	\N	ARGU ASESORES EN CAPITAL HUMANO S.C.		AAC030703TC0	ARGU ASESORES EN CAPITAL HUMANO S.C.		Calle Pico de Verapaz 435, Torre Cima PH2, Jardines en la Montaña	Tlalpan	Mexico D.F.	14210	México					
77	72	\N	Fondo de Investigación Científica y Desarrollo Tecnológico del Instituto Politécnico Nacional		FIC000330LK9	Fondo de Investigación Científica y Desarrollo Tecnológico del Instituto Politécnico Nacional		Avenida Universidad No. 1200	Benito Juárez 	Ciudad de México	03339	México					
78	73	\N	Jefatura de Policia Industrial del Estado de México y/o Cuerpo de Guardias de Seguridad Industrial Bancaria Y Comercial del Valle de Cuautitlán Texcoco		JPI480202UU7	Jefatura de Policia Industrial del Estado de México y/o Cuerpo de Guardias de Seguridad Industrial Bancaria Y Comercial del Valle de Cuautitlán Texcoco		Prolongación Galeana No. 28	Cuautitlán Izcalli	Estado de México	54060	México					
108	106	\N	Consorcio IUYT, S.A. de C.V.		CIU99050721G7	Consorcio IUYT, S.A. de C.V.		San Borja 1358	Benito Juárez	Ciudad de México	3600	México					
123	76	\N	FP - FREE S. DE R.L. DE C.V.		FPF1411048H7	FPF1411048H7		Paseo de la Reforma 412	Cuauhtémoc	Cuauhtémoc	6500	México					
69	51	\N	Constructo Mexicana de Infraestructura, S. A.		CCM100601NEA	Constructo Mexicana de Infraestructura, S. A.		Pensilvania 26, int. 501, Nápoles	Benito Juárez	Ciudad de México	09810	México					
119	111	\N	OMNIBUS Y TRANSPORTES TERRESTRES EJECUTIVOS, S.A. DE C.V.		OTT9504062X7	OMNIBUS Y TRANSPORTES TERRESTRES EJECUTIVOS, S.A. DE C.V.		Calzada Vallejo 705, Nueva Vallejo	Gustavo A. Madero	Distrito Federal	07750	México					
99	92	\N	IDT EN SISTEMAS DE INFORMACION S.A. DE C.V.		ISI02115AFA	IDT EN SISTEMAS DE INFORMACION S.A. DE C.V.		Avenida Hidalgo 1 10, Santiago Tepalcapa	Cuautitlan Izcalli	Estado de México	54743	México					
103	103	\N	ARGU ASESORES EN CAPITAL HUMANO S.C.		AAC030703TC0	ARGU ASESORES EN CAPITAL HUMANO S.C.		Calle Pico de Verapaz 435, Torre Cima PH2	Tlalpan	Mexico D.F.	14210	México					
11	11	\N	RAGAMEX CONSTRUCTORES, S.A. DE C.V.	Servicios Relacionados con la OP	RCO010901MP3	RAGAMEX CONSTRUCTORES, S.A. DE C.V.	\N	Perú 218A, colonia America Sur	Oaxaca de Juárez	Oaxaca	68020	México	\N	\N	\N	\N	\N
8	10	\N	SUPERVISION Y CONTROL DE FAUNA S.A. DE C.V.	Servicios Relacionados con la OP	SCF0401286B1	SUPERVISION Y CONTROL DE FAUNA S.A. DE C.V.	\N	Cda. De Arroyo #50 Int 4, colonia Santiago Occipaco	Naucalpan de Juárez	Estado de México	53237	México	\N	\N	\N	\N	\N
18	19	\N	CONSTRUCCIONES ALDESEM, S.A. DE C.V.	Obra Pública	CAL070605NA9	CONSTRUCCIONES ALDESEM, S.A. DE C.V.	\N	Mississippi Número 49 piso 7, colonia Cuauhtémoc	Cuauhtémoc	Ciudad de México	06500	México	\N	\N	\N	\N	\N
5	5	\N	Sistemas Integrales de Gestión Ambiental, S.C.	Servicios Relacionados con la OP	SIG9806044B1	Sistemas Integrales de Gestión Ambiental, S.C.	http://www.sigea.com.mx/	Poseidón número 40, colonia Crédito Constructor	Benito Juárez	Ciudad de México	03940	México	\N	\N	\N	\N	\N
7	6	\N	Avalúos Evaluaciones y Proyectos S.A. de C.V.	Servicios Relacionados con la OP	AEP960314CW2	Avalúos Evaluaciones y Proyectos S.A. de C.V.	http://aep.com.mx/	Avenida Rio Mixcoac No. 88 Interior 101, colonia Actopan del Valle	Benito Juárez	Ciudad de México	3100	México	\N	\N	\N	\N	\N
19	18	\N	GLM, Comunicaciones, S. A. de C. V.	Servicios Relacionados con la OP	GCO950523JCD	GLM, Comunicaciones, S. A. de C. V.	http://www.glm.com.mx/	Sombrerete número 522, piso 1, colonia Hipódromo Condesa	Cuauhtémoc	Ciudad de México	06170	México	\N	\N	\N	\N	\N
49	30	\N	Currie & Brown México S. A. de C. V.		C&B050317SU4	Currie & Brown México S. A. de C. V.		Newton número 16, piso 6, Aristoteles Polanco Chapultepec	Miguel Hidalgo 	México, D. F.	11560	México					
34	25	\N	Indra Business Consulting ALG México, S. A. de C. V.		EAC080925767	Indra Business Consulting ALG México, S. A. de C. V.	http://www.indracompany.com/	Av. Ejercito Nacional #843-B, Piso 14, colonia Granada	Miguel Hidalgo	Ciudad de México	11520						
3	3	\N	Especialistas  Ambientales, S.A. de C.V.	Servicios Relacionados con la OP	EAM9803104KO	Especialistas  Ambientales, S.A. de C.V.	\N	Camino al Olivo Número15 Interior 301, colonia Lomas de Vista Hermosa	Cuajimalpa	Ciudad de México	05100	México	\N	\N	\N	\N	\N
20	17	\N	BCG- The Boston Conslting Group S. C.	Servicios Relacionados con la OP	BBC970130F3	BCG- The Boston Conslting Group S. C.	http://www.bcg.com.mx/	Calle Real San Agustín número 304, Edificio B, colonia Residencia San Agustín	San Pedro Garza Garcia	Nuevo León	66260	\N	\N	\N	\N	\N	\N
17	20	\N	Ingeniería y Procesamiento Electrónico, S. A. de C. V.	Servicios Relacionados con la OP	IPE850318NZA	Ingeniería y Procesamiento Electrónico, S. A. de C. V.	\N	San Lorenzo número 153-402, colonia Del Valle	Benito Juárez	Ciudad de México	03100	México	\N	\N	\N	\N	\N
12	12	\N	CALZADA CONSTRUCCIONES, S.A. DE C.V.	Obra Pública	CCO980814BU4	CALZADA CONSTRUCCIONES, S.A. DE C.V.	http://www.grupoventer.com.mx/calco/v2/main-frame.php	Lope de Vega 117, piso 6, colonia Polanco	Miguel Hidalgo	Ciudad de México	11560	México	\N	\N	\N	\N	\N
26	21	\N	OMEGA CONSTRUCCIONES INDUSTRIALES, S.A. DE C.V.	Servicios	OCI820920II7	OMEGA CONSTRUCCIONES INDUSTRIALES, S.A. DE C.V.	http://grupo-omega.com/	Cordillera de los Andes número 310, colonia Chapultepec	Miguel Hidalgo	Ciudad de México	11000	México					
30	25	\N	Advanced Logistic Group, S. A. U.	Servicios	A58623141	Advanced Logistic Group, S. A. U.		Av. Ejercito Nacional #843-B, Piso 14, colonia Granada	Miguel Hidalgo	Ciudad de México	11520						
6	7	\N	Consorcio IUYET S.A. de C.V.	Servicios Relacionados con la OP	CIU9905071G7	Consorcio IUYET S.A. de C.V.	http://www.iuyet.mx/	San Borja 1358, Vértiz Narvarte	Benito Juárez	Ciudad de México	03600	México	\N	\N	\N	\N	\N
36	12	\N	CONSTRUCCIONES Y DRAGADOS DEL SURESTE, S.A. DE C.V.		CDS970212MV3	CONSTRUCCIONES Y DRAGADOS DEL SURESTE, S.A. DE C.V.		Lope de Vega 117, piso 6, colonia Polanco	Miguel Hidalgo	Ciudad de México	11560	México	Ricardo Ramos Acosta				
31	21	\N	CALZADA CONSTRUCCIONES, S.A. DE C.V.	Servicios	CCO980814BU4	CALZADA CONSTRUCCIONES, S.A. DE C.V.		Cordillera de los Andes número 310, colonia Chapultepec	Miguel Hidalgo	Ciudad de México	11000	México					http://www.grupoventer.com.mx/calco/v2/main-frame.php
32	21	\N	CONSTRUCCIONES Y DRAGADOS DEL SURESTE, S.A. DE C.V.	Servicios	CDS970212MV3	CONSTRUCCIONES Y DRAGADOS DEL SURESTE, S.A. DE C.V.	http://www.grupohycsa.mx/cydssa/	Cordillera de los Andes número 310, colonia Chapultepec 	Miguel Hidalgo	Ciudad de México	11000	México					
16	16	\N	CONSULTORIA, SUPERVISION TECNICA Y OPERACION EN SISTEMAS, S.A. DE C.V.	Servicios Relacionados con la OP	CST890605C72	CONSULTORIA, SUPERVISION TECNICA Y OPERACION EN SISTEMAS, S.A. DE C.V.	\N	Emperadores número 46, colonia Portales Oriente	Benito Juárez	Ciudad de México	03570	México	\N	\N	\N	\N	\N
82	75	\N	Universidad Nacional Autónoma de México		UNA2907227Y5	Universidad Nacional Autónoma de México		Avenida Universidad S/N	San Nicolás de los Garza	Nuevo León	66455	México					
10	9	\N	Manejo Integral de Cuencas, S.A. de C.V.	Servicios Relacionados con la OP	MIC020410UGA	Manejo Integral de Cuencas, S.A. de C.V.	http://www.micas-cuencas.com/website/	José María Pino Suárez Manzana 15, Lote 19, colonia Nezahualcoyotl	Texcoco	Estado de México	56234	México	\N	\N	\N	\N	\N
33	23	\N	Inmobiliarios Mexicanos, S. A. de C. V.		IME0304236T5	Inmobiliarios Mexicanos, S. A. de C. V.		Carretera libre Matamoros a Monterrey KM 5.2 sin número, colonia Renacimiento	Reynosa	Tamaulipas	88740	México					
27	22	\N	COCONAL S.A.P.I. DE C.V.	Servicios	COC000315HY4	COCONAL S.A.P.I. DE C.V.	http://www.coconal.com/	Periferico sur número 4249, piso 3, colonia Jardines de la Montaña	Tlalpan	Ciudad de México	04210	México					
28	23	\N	Transportaciones y Construcciones Tamaulipecos, S. A. de C. V.	Servicios	TCT931025713	Transportaciones y Construcciones Tamaulipecos, S. A. de C. V.		Carretera libre Matamoros a Monterrey KM 5.2 sin número, colonia Renacimiento	Reynosa	Tamaulipas	88740	México					
15	15	\N	CONSULTORIA, SUPERVISION TECNICA Y OPERACION EN SISTEMAS, S.A. DE C.V.	Servicios Relacionados con la OP	CST890605C72	CONSULTORIA, SUPERVISION TECNICA Y OPERACION EN SISTEMAS, S.A. DE C.V.	\N	Emperadores número 46, colonia Portales Oriente	Benito Juárez	Ciudad de México	03570	México	\N	\N	\N	\N	\N
1	1	\N	GEXIQ, S.A. DE C.V.	Servicios	GEX020215T93	GEXIQ, S.A. DE C.V.	http://gexiq.com/	Av. Paseo Triunfo de la República #3304- Local 404, colonia Partido Escobedo	Juárez	Chihuahua	32330	México	\N	\N	\N	\N	\N
29	24	\N	CONSTRUCCIONES ALDESEM, S.A. DE C.V.		CAL070605NA9	CONSTRUCCIONES ALDESEM, S.A. DE C.V.		Plaza Melchor Ocampo #38, interior, piso 9, colonia Cuauhtémoc	Cuauhtémoc	Ciudad de México	06500	México					
14	14	\N	Sifra y Asociados, S. A. de C. V.	Servicios Relacionados con la OP	SAS8710124M8	Sifra y Asociados, S. A. de C. V.	http://www.sifra.com.mx/	Blvd. Adolfo López Mateos No. 1630, colonia Mixcoac	Benito Juárez	Ciudad de México	03910	México	\N	\N	\N	\N	\N
13	13	\N	AUTODESK, INC.	Servicios Relacionados con la OP	94-2819853	AUTODESK, INC.	http://www.autodesk.com/	Mcinnis Parkway #111	San Rafael	California	94903	USA	\N	\N	\N	\N	\N
4	4	\N	Instituto de Investigaciones y Capacitación para las Ciencias Biológicas, A.C.	Servicios Relacionados con la OP	IIC140227RA0	Instituto de Investigaciones y Capacitación para las Ciencias Biológicas, A.C.	http://www.iiccbiologicas.org/	Cecilio Robelo 381, colonia Jardín Balbuena	Venustiano Carranza	Ciudad de México	15900	México	\N	\N	\N	\N	\N
100	101	\N	Instituto Politécnico Nacional		FIC000330LK9	Instituto Politécnico Nacional		Edificio de la Dirección General, Avenida Luis Enrique Erro sin número, Unidad Profesional Adolfo López Mateos 	Gustavo A. Madero 	Ciudad de México	7738	México					
35	8	\N	Constructora Grupo de Oro, S.A. de C.V.		CGO060731P72	Constructora Grupo de Oro, S.A. de C.V.		Lope de Vega 117, piso 6, Colonia Polanco	Miguel Hidalgo	Ciudad de México	11560	México	Ricardo Ramos Acosta				
120	85	\N	Arup Latin America, S.A		ESA-86216827	Arup Latin America, S.A		Alcala n° 54	Madrid			España					
57	33	\N	Ing. Jorge Jiménez Méndez		CUMJ500320CB9	Ing. Jorge Jiménez Méndez		Castillo de Edinburgh Número 72, Fraccionamiento Condado de Sayavedra	Atizapán de Zaragoza	Estado de México	52938	México					
124	77	\N	Ingeniero Lino Marquez Vite		MAVL480712ID7	MAVL480712ID7		Bravo, número 49	Venustiano Carranza	Venustiano Carranza	15100						
58	34	\N	IMPULSORA DE ENLACE EMPRESARIAL CATENA, S.A. DE C.V.		IEE100309KLA	IMPULSORA DE ENLACE EMPRESARIAL CATENA, S.A. DE C.V.		Insurgentes Sur 1722 - 1003, Florida	Alvaro Obregón	Distrito Federal 	01030	México					
59	35	\N	CESC CONSULTORÍA, S.C.		CCO140703L79	CESC CONSULTORÍA, S.C.		Avenida Viaducto Miguel Aleman número 7, Colonia del Valle	Benito Juárez	Distrito Federal	03100	México					
60	62	\N	RIGOBERTO GARCÍA HERNÁNDEZ		GAHR8404021M1	RIGOBERTO GARCÍA HERNÁNDEZ		Prolongación Allende S/N, Santa Maria Nativitas	Texcoco	México	56200	México					
126	78	\N	VÁZQUEZ NAVA Y CONSULTORES, S.C.		VNC9501168D8	VNC9501168D8		Paseo de las Palmas, número 1005	Miguel Hidalgo	Miguel Hidalgo	11000	México					
127	79	\N	Vázquez Nava y Consultores, S.C.		VNC9501168D8	VNC9501168D8		Paseo de las Palmas 1005	Miguel Hidalgo 	Miguel Hidalgo 	11000						
42	57	\N	DR. Rafael Bernardo Carmona Paredes		CAPR560416LQ6	DR. Rafael Bernardo Carmona Paredes		San Lorenzo 4 casa 2, San Juan Tepepan	Xochimilco	Ciudad de México	16020	México					
113	81	\N	SACMAG DE MÉXICO, S. A. DE C. V		SME850212FD0	SACMAG DE MÉXICO, S. A. DE C. V											
87	88	\N	UNIVERSIDAD AUTÓNOMA DE NUEVO LEÓN		UAN691126MK2	UNIVERSIDAD AUTÓNOMA DE NUEVO LEÓN		Avenida Universidad S/N, Ciudad Universitaria	San Nicolás de los Garza	Nuevo León	66455	México					
104	94	\N	Servicio de Protección Federal		SPF130103BF7	Servicio de Protección Federal		Miguel Angel de Quevedo número 915, El Rosedal	Coyoacan	Distrito Federal	04330	México					
105	104	\N	El Mundo es Tuyo, S.A. de C.V.		MET8908305M9	El Mundo es Tuyo, S.A. de C.V.		Av. Diagonal San Antonio número 1218	Benito Juárez	Distrito Federal	3020	México					
106	95	\N	Global Tourist Agency, S. A. de C.V.		GAC9806011J4	Global Tourist Agency, S. A. de C.V.		11A Privada de Orquídeas, número 105 D, Colonia las Flores Norte, Jardines en la Montaña	Oaxaca	Oaxaca	06800	México					
107	105	\N	Instituto Politecnico Nacional		FIC000330LK9	Instituto Politecnico Nacional		Avenida Luis Enrique Erro SN	Gustavo A. Madero	Ciudad de México	07738	México					
109	107	\N	Instituto de Investigación y Capacitación para las Ciencias Biológicas, A.C.		IIC140227RA0	Instituto de Investigación y Capacitación para las Ciencias Biológicas, A.C.		Cecilio Robelo número 381	Venustiano Carranza	Ciudad de México	15900	México					
110	108	\N	Instituto de Investigación y Capacitación para las Ciencias Biológicas, A.C		IIC140227RA0	Instituto de Investigación y Capacitación para las Ciencias Biológicas, A.C		Cecilio Robelo	Venustiano Carranza	Ciudad de México	15900	México					
111	109	\N	INGENIEROS CIVILES ASOCIADOS, S.A. DE C.V.		ICA850812MV0	INGENIEROS CIVILES ASOCIADOS, S.A. DE C.V.		Avenida Manuel Ávila Camacho número 36, Piso 5	Miguel Hidalgo	Distrito Federal	11000	México					
63	47	\N	Stephen Alan Mahin		482532989	Stephen Alan Mahin		6363 Christie Ave Apt 1926, Emeryville	Emeryville	CA	94608	USA					
118	110	\N	JACE INTERNACIONAL S.A. DE C.V.		JIN960911BY9	JACE INTERNACIONAL S.A. DE C.V.		López Cotilla 1605, Despacho 102, Colonia Del Valle	Benito Juárez	Distrito Federal	03100	México					
61	36	\N	SERVICIOS FORESTALES DE HIDALGO, SERFORH, S.C.		SFH080118R25	SERVICIOS FORESTALES DE HIDALGO, SERFORH, S.C.		Ciruelos 135, Fraccionamiento Las Peras	Mineral de la Reforma	Hidalgo	42183	México					
68	65	\N	Unidad de Desarrollo Tecnológico (TECHNOPOLI), del Instituto Politécnico Nacional.		TECHNOPOLI	Unidad de Desarrollo Tecnológico (TECHNOPOLI), del Instituto Politécnico Nacional.		Av. Wilfrido Massieu, S/N, Unidad Profesional Adolfo López Mateos, colonia San Pedro Zacatenco	Gustavo A. Madero	Ciudad de México	07738	México					
62	63	\N	Unidad Profesional Interdisciplinaria en Ingeniería y Tecnologías Avanzadas (UPIITA), del Instituto Politécnico Nacional.		UPIITA	Unidad Profesional Interdisciplinaria en Ingeniería y Tecnologías Avanzadas (UPIITA), del Instituto Politécnico Nacional.		Av. Luis Enrique Erro S/N, Unidad Profesional "Adolfo López Mateos", colonia San Pedro Zacaténco	Gustavo A. Madero	Ciudad de México	07738	México					
43	28	\N	Academia de Ingeniería, S. A.		AIN0203116A1	Academia de Ingeniería, S. A.		Tacuba 5, Centro Histórico	Cuauhtémoc	Distrito Federal	06000	México					
44	29	\N	Grupo de Ingenieía en Consultoría en obras, S. A. de C. V.		GIC900813219	Grupo de Ingenieía en Consultoría en obras, S. A. de C. V.		Calzada de Tlalpan 4911 BIS, Tlalpan	Tlalpan	Ciudad de México	14000	México					
50	45	\N	Guillermo Springall Caram		SICG341213JLA	Guillermo Springall Caram		Rafael Checa número 60	Alvaro Obregón	México Distrito Federal	1070	México					
51	59	\N	INSTITUTO MEXICANO DE AUDITORÍA TÉCNICA, A.C.		IMA941216HE8	INSTITUTO MEXICANO DE AUDITORÍA TÉCNICA, A.C.		San Lorenzo 153 interior 602, colonia Del Valle	Benito Juarez	Ciudad de México	México	03100					
53	31	\N	F GLEZ CONSULTORES Y ASOCIADOS, S.A. DE C.V.		FGC980820G37	F GLEZ CONSULTORES Y ASOCIADOS, S.A. DE C.V.		Alfonso Esparza Oteo, número 144, Guadalupe Inn	Álavro Obregón	Distrito Federal	01020	México					
54	60	\N	PORTA BAÑOS 2000, S.A. DE C.V.		PBD000118DD3	PORTA BAÑOS 2000, S.A. DE C.V.		Benito Juárez 276, colonia San Antonio Culhuacán	Iztapalapa	Ciudad de México	09890	México					
55	32	\N	Oscar Alvares de la  Cuadra Sánchez		AASO390420HDFLNS07	Oscar Alvares de la  Cuadra Sánchez		Insurgentes Sur 559, Nápoles	Benito Júarez	México Distrito Federal	03810	México					
65	48	\N	Grupo de Ingeniería en Consultoría y Obras S. A. de C. V.		GIC9008132I9	Grupo de Ingeniería en Consultoría y Obras S. A. de C. V.		Calzada de Tlalpan no. 4911 bis, Tlalpan, Centro.	Tlalpan	Ciudad de México	14000	México					
66	49	\N	Itenergy de México S. A. de C. V.		IME150515FY0	Itenergy de México S. A. de C. V.		Montesino no. 38, Piso 28, Oficina 12, Nápoles	Benito Juárez	Ciudad de México	03810	México					
67	50	\N	Servicios de Ingeniería, Edificación y Construcción Pesada, S.A. de C.V.		SSI9906288E6	Servicios de Ingeniería, Edificación y Construcción Pesada, S.A. de C.V.		Peten 292, Narvarte Oriente	Benito Juárez	Distrito Federal	03023	México					
101	102	\N	JACE INTERNACIONAL S.A. DE C.V.		JIN960911BY9	JACE INTERNACIONAL S.A. DE C.V.		López Cotilla 1605, Despacho 102	Benito Juárez	Distrito Federal	3100	México					
71	67	\N	Comisión Federal de Electricidad a través de la Gerncia de Estudios de Ingeniería Civil		CFE370814Q10	Comisión Federal de Electricidad a través de la Gerncia de Estudios de Ingeniería Civil		Calle Augusto Rodín No. 265	Benito Juárez 	Ciudad de México	3720	México					
72	68	\N	Fondo de Investigación Científica y Desarrollo Tecnológico del Instituto Politécnico Nacional.		FIC000330LK9	Fondo de Investigación Científica y Desarrollo Tecnológico del Instituto Politécnico Nacional.		Avenida Universidad No 1200	Benito Juárez	Ciudad de México	03339	México					
73	69	\N	Universidad Nacional Autónoma de México		UNA2907227Y5	Universidad Nacional Autónoma de México		Avenida Universidad N0. 3000	Coyoacán	Ciudad de México	04510	México					
74	70	\N	Universidad Nacional Autónoma de México		UNA2907227Y5	Universidad Nacional Autónoma de México		Avenida Universidad N0. 3000	Coyoacán	Ciudad de México	04510	México					
75	52	\N	Instituto Mexicano de Auditoría Técnica, A. C.		IMA941216HE8	Instituto Mexicano de Auditoría Técnica, A. C.		San Lorenzo no. 153 - 602, Colonia Del Valle	Benito Juárez	Ciudad de México	03100	México					
70	66	\N	Centro de Innovación y Desarrollo Tecnológico en Cómputo (CIDETEC), del Instituto Politécnico Nacional.		CIDETEC	Centro de Innovación y Desarrollo Tecnológico en Cómputo (CIDETEC), del Instituto Politécnico Nacional.		Luis Enrique Erro S/N, Unidad Proofesional Adolfo López Mateos, colonia San Pedro Zacatenco	Gustavo A. Madero	Ciudad de México	07738	México					
64	64	\N	Unidad Profesional Interdisciplinaria en Ingeniería y Tecnologías Avanzadas (UPIITA), del Instituto Politécnico Nacional.		UPIITA	Unidad Profesional Interdisciplinaria en Ingeniería y Tecnologías Avanzadas (UPIITA), del Instituto Politécnico Nacional.		Av. Luis Enrique Erro S/N, Unidad Profesional "Adolfo López Mateos", colonia San Pedro Zacatenco	Gustavo A. Madero	Ciudad de México	07738	México					
79	53	\N	Muñoz Manzo y Ocampo, s.c.		MMO060307LY5	Muñoz Manzo y Ocampo, s.c.		Av Sta Fe No. 495 Int 603, Cruz Manca	Cuajimalpa de Morelos	Ciudad de México	05349	México					
80	54	\N	Elements Studios, S. C.		EST040414KP6	Elements Studios, S. C.		Calle Sacramento número 305, Insurgentes San Borja	Benito Juarez	Ciudad de México	03220	México					
81	74	\N	FONDO DE INVESTIGACIÓN CIENTÍFICA Y DESARROLLO TECNOLOGICO DEL INSTITUTO POLITECNICO NACIONAL		FIC000330LK9	FONDO DE INVESTIGACIÓN CIENTÍFICA Y DESARROLLO TECNOLOGICO DEL INSTITUTO POLITECNICO NACIONAL		Avenida Universidad No 1200	Benito Juárez 	Ciudad de México	03339	México					
83	55	\N	Instituto Mexicano de Auditoría Tecnica, A. C.		IMA941216HE8	Instituto Mexicano de Auditoría Tecnica, A. C.		Avenida San Lorenzo número 153, despacho 602, Colonia Del Valle	Benito Juarez	Ciudad de México	03100	México					
84	56	\N	Consorcio IUYET, S.A. de C.V.		CIU9905071G7	Consorcio IUYET, S.A. de C.V.		Valentín Gómez Farías No.307, Col. 5 de Mayo	Toluca	Estado de México	50090	México					
85	86	\N	Supervisión, Coordinación y Construcción  de Obras, S.A. de C.V.		SCC8602079E2	Supervisión, Coordinación y Construcción  de Obras, S.A. de C.V.		Camelia Número 233, Florida	Alvaro Obregón	Ciudad de México	01030	México					
86	87	\N	Rocher Ingeniería, S.A. de C.V.		RIN040823510	Rocher Ingeniería, S.A. de C.V.		Vía Láctea No 51, Prado Churubusco	Coyoacán	Ciudad de México	04230	México					
52	46	\N	Gerardo Suárez  Reynoso		SURG520703IF3	Gerardo Suárez  Reynoso		calle Planicie no. 16	Tlalpan	Ciudad de México	14010	México					
88	96	\N	Instituto Mexicano del Transporte		SCT8501018I9	Instituto Mexicano del Transporte		km 12 de la carretera estatal número 431 "El Colorado, Galindo"	Pedro Escobedo 	Queretaro 	76703	México					
89	89	\N	Universidad Autónoma de Nuevo León		UAN691126MK2	Universidad Autónoma de Nuevo León		Av. Universidad S/N, Cd. Universitaria	San Nicolás de los Garza	Nuevo León	66455	México					
90	97	\N	Secretaría de Comunicaciones y Transportes a través de la Dirección General de Servicios Técnicos		SCT8501018I9	Secretaría de Comunicaciones y Transportes a través de la Dirección General de Servicios Técnicos		Avenida Coyoacán número 1895, Primer Piso 	Benito Juárez 	Ciudad de México	3240	México					
93	90	\N	CONSORCIO EMPRESARIAL ADPER S.A. DE C.V.		CEA140128UI3	CONSORCIO EMPRESARIAL ADPER S.A. DE C.V.		Manuel Ávila Camacho 1903 int 600 A, Satélite	Naucalpan de Jaurez	Estado de México	53100	México					
94	98	\N	Instituto Mexicano de Administarción Pública A.C.		INA-770420-DW1	Instituto Mexicano de Administarción Pública A.C.		KM 14.5 de la carretera libre "Mexico - Toluca" número 2151	Cuajimalpa	Distrito Federal	5110	México					
95	99	\N	Bejar Galindo Lozano y Cía; S.C.		BGL860218J58	Bejar Galindo Lozano y Cía; S.C.		San Francisco número 25, Int. 202 y 302	Benito Juárez 	Distrito Federal 	3100	México					
96	91	\N	INE S.A. de C.V.		INE9509226VA	INE S.A. de C.V.		Coscomate número 89, Toriello Guerra 	Tlalpan	México Distrito Federal	14050	México					
98	100	\N	Servicio de Protección Federal		SPF130103BF7	Servicio de Protección Federal		Miguel Angel de Quevedo número 915	Coyoacán	Distrito Federal 	4330	México					
112	81	\N	NACO, NETHERLANDS AIRPORT CONSULTANTS, B. V.		27246015	NACO, NETHERLANDS AIRPORT CONSULTANTS, B. V.											
115	83	\N	OMNIBUS y TRANSPORTES TERRESTRES EJECUTIVOS, S.A. de C.V		OTT9504062X7	OMNIBUS y TRANSPORTES TERRESTRES EJECUTIVOS, S.A. de C.V		Calzada Vallejo 705	Gustavo A. Madero	México Distrito Federal	7750						
116	83	\N	OMNIBUS y TRANSPORTES TERRESTRES EJECUTIVOS, S.A. de C.V		OTT9504062X7	OMNIBUS y TRANSPORTES TERRESTRES EJECUTIVOS, S.A. de C.V		Calzada Vallejo 705	Gustavo A. Madero	México Distrito Federal	7750	MÉXICO					
114	81	\N	TADCO CONSTRUCTORA, S. A. DE C. V.		TCO970614ML4	TADCO CONSTRUCTORA, S. A. DE C. V.											
117	84	\N	OMNIBUS y TRANSPORTES TERRESTRES EJECUTIVOS, S.A. de C.V		OTT9504062X7	OMNIBUS y TRANSPORTES TERRESTRES EJECUTIVOS, S.A. de C.V		Calzada Vallejo 705	Gustavo A. Madero	Ciudad de México	7750	México					
\.


--
-- Name: supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('supplier_id_seq', 128, true);


--
-- Data for Name: supplieradditionalidentifiers; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY supplieradditionalidentifiers (id, contractingprocess, award_id, supplier_id, scheme, legalname, uri) FROM stdin;
\.


--
-- Name: supplieradditionalidentifiers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('supplieradditionalidentifiers_id_seq', 1, false);


--
-- Data for Name: tender; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY tender (id, contractingprocess_id, tenderid, title, description, status, minvalue_amount, minvalue_currency, value_amount, value_currency, procurementmethod, procurementmethod_rationale, awardcriteria, awardcriteria_details, submissionmethod, submissionmethod_details, tenderperiod_startdate, tenderperiod_enddate, enquiryperiod_startdate, enquiryperiod_enddate, hasenquiries, eligibilitycriteria, awardperiod_startdate, awardperiod_enddate, numberoftenderers, amendment_date, amendment_rationale) FROM stdin;
3	3	789794	Prestación de los Servicios consistentes en la elaboración del Plan de manejo  ambiental para el Nuevo Aeropuerto  Internacional de la Ciudad de México.	Prestación de los Servicios consistentes en la elaboración del Plan de manejo  ambiental para el Nuevo Aeropuerto  Internacional de la Ciudad de México.	complete	0		638000	MXN	Adjudicación Directa	Artículo 43 de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.					\N	\N	\N	\N	0		\N	\N	0	\N	
112	112	867226	Servicio de asesoría técnica y capacitación a 800 trabajadores del programa empleo temporal de mano de obra campesina o urbana marginada para los 7 ejidos colindantes al predio del NAICM.	Servicio de asesoría técnica y capacitación a 800 trabajadores del programa empleo temporal de mano de obra campesina o urbana marginada para los 7 ejidos colindantes al predio del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	complete	0	MXN	7400000.00	MXN	Invitación a cuando menos tres personas	Artículo 42 de la Ley de Adquisiciones, Arrendamiento y Servicios del Sector Público	Apartado 6 de la invitación Nacional a cuando Menos Tres Personas identificado con el número IA-009KDH999-N56-2015 del Servicio de asesoría técnica y capacitación a 800 trabajadores del programa empleo temporal de mano de obra campesina o urbana marginada para los 7 ejidos colindantes al predio del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)", es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 31 de agosto de 2015.	Apartado 2 de la lnvitación Nacional a cuando Menos Tres Personas identificado con el número IA-009KDH999-N56-2015 del Servicio de asesoría técnica y capacitación a 800 trabajadores del programa empleo temporal de mano de obra campesina o urbana marginada para los 7 ejidos colindantes al predio del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)", es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 31 de agosto de 2015.	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 10:00 horas del 10 de agosto de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Gerente de concursos de la Subdirección de Contrataciones de GACM	2015-08-10 00:00:00	\N	2015-08-06 00:00:00	2015-08-06 00:00:00	1	Apartado 6 de la Ilnvitación Nacional a cuando Menos Tres Personas identificado con el número IA-009KDH999-N56-2015 del 9 de julio de 2015 (ver anexo)	\N	\N	3	\N	
5	5	798985	Plan de Monitoreo, registro y verificación de emisión de gases de efecto invernadero para el Nuevo Aeropuerto Internacional de la Ciudad de México.	Plan de Monitoreo, registro y verificación de emisión de gases de efecto invernadero para el Nuevo Aeropuerto Internacional de la Ciudad de México.	complete	0		539400.00	MXN	Adjudicación Directa	Artículo 43 de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.			Presencial		\N	\N	\N	\N	0		\N	\N	1	\N	
4	4	798885	Prestación de los Servicios consistentes en la elaboración del: “Plan de Acciones de monitoreo y conservación de aves para el Nuevo Aeropuerto Internacional de la Ciudad de México”.	Prestación de los Servicios consistentes en la elaboración del: “Plan de Acciones de monitoreo y conservación de aves para el Nuevo Aeropuerto Internacional de la Ciudad de México”.	complete	0		522000.00	MXN	Adjudicación Directa	Artículo 43 de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.			Presencial		\N	\N	\N	\N	0		\N	\N	0	\N	
12	12	838749	Para los trabajos relativos a la construcci&#x00f3;n del drenaje pluvial temporal	Licitación Pública Nacional que tuvo por objeto la adjudicación del contrato para los trabajos relativos a la construcción del drenaje pluvial temporal del Nuevo Aeropuerto de la Ciudad de México.	complete	0		490000000	MXN	Licitación Pública		Puntos y Porcentajes	1. EVALUACIÓN DE LA PROPUESTA TÉCNICA: I. CALIDAD DE LA OBRA.- (a) Que los materiales propuestos para la ejecución de los trabajos cumplan con los estándares de calidad y medidas ambientales. (3.0); (b) Mano de Obra. Que la mano de obra propuesta para la ejecución de los trabajos, cumpla con los requisitos administrativos y con las aptitudes establecidos (3.0); (c) Maquinaria y equipo. Que la maquinaria y vehículos propuestos para la ejecución de los trabajos cumplan con los estándares de calidad y medidas ambientales exigidas (5.0); (d) Esquema estructural de la organización de los profesionales técnicos que se encargarán de la dirección y coordinación de los trabajos. Que el esquema estructural de profesionales técnicos (organigrama) propuesto, es el adecuado, suficiente y necesario (0.5); (e) Procedimiento constructivo. Que las técnicas propuestas a utilizar para la ejecución de los trabajos, sean congruentes con las características, complejidad y magnitud de trabajos a ejecutar en el proyecto (5.0); (f) Programas. Que exista una congruencia entre los programas generales y específicos de la obra (1.5), y (g) Descripción de la planeación integral para la ejecución de los trabajos. Explicación detallada de los procesos que se utilizaran en la ejecución, desarrollo y organización de los trabajos (2.0). II. CAPACIDAD LICITANTE.- (a) Capacidad de los recursos humanos. Que el personal profesional técnico ha participado en por lo menos 5 proyectos similares al que se licita (5.0); (b) Capacidad de los recursos económicos. Serán los recursos económicos que se consideren necesarios para que el licitante cumpla con el contrato (4.0); (c) Participación de discapacitados o empresas que cuenten con trabajadores con discapacidad (0.5), y (d) Subcontratación de MIPYMES. Se otorgará al licitante el puntaje indicado; se verificará que la proposición que contenga la documentación con la cual demuestre que subcontratará MIPYMES (0.5). III. EXPERIENCIA Y ESPECIALIDAD.- (a) Experiencia. Se verificará que el licitante durante los últimos 10 años ha ejecutado obras similares a los que se licitan (7.0), y (b) Especialidad. Se verificará que dentro de los últimos 10 años, el licitante ha ejecutado por lo menos 5 obras con las características, complejidad y magnitud específicas y a los volúmenes y condiciones similares a las requeridas por la convocante (8.0). IV. CUMPLIMIENTO DE CONTRATOS.- (a) Cumplimiento de contratos. Se verificará que por lo menos 5 obras ejecutadas por el licitante en los últimos 10 años, se hayan terminado en tiempo y forma (5.0). 2. EVALUACIÓN DE LA PROPUESTA ECONÓMICA: El total de puntuación de la proposición económica, tendrá un valor numérico máximo de 50. Para llevar a cabo la evaluación de la propuesta económica, la convocante verificará que el análisis, cálculo e integración de los precios cumplan con la condición de pago establecida en la convocatoria o Licitación en términos del artículo 45 de la Ley y los artículos 45 y del 185 al 220	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 12:00 horas del 6 de agosto de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapan San Angel, Delegación Alvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Subdirector de Contrataciones de GACM. Los documentos técnicos T.2 y T.3, así; como la documentación económica E-10, correspondiente a las 32 proposiciones presentadas, fueron rubricados por los representantes de tres licitantes y un consorcio.	2015-08-06 00:00:00	\N	2015-07-03 00:00:00	2015-07-22 00:00:00	1	Numeral 2.10 de la Convocatoria	2015-07-21 00:00:00	\N	32	\N	
7	7	799484	Estudio e instalaciones complementarias para el de las características topográficas del terreno del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	Estudio e instalaciones complementarias para el de las características topográficas del terreno del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	complete	0		39000000	MXN	Invitación a cuando menos tres personas	Artículo 42 fracción XI de la Ley de Obras Públicas y servicios Relacionados con las Mismas	Ponderación de puntos (Puntos y porcentajes)	Apartado 5.4 de la Convocatoria (ver anexo)	Presencial		2015-06-30 00:00:00	\N	2015-06-08 00:00:00	2015-06-23 00:00:00	1		\N	\N	7	\N	
19	19	996706	Construcción de accesos y plataformas para exploración geotécnica, rehabilitación de tramos de prueba y bacheo somero de caminos existentes dentro del terreno par el Nuevo Aeropuerto Internacional de la Ciudad de México	Construcción de accesos y plataformas para exploración geotécnica, rehabilitación de tramos de prueba y bacheo somero de caminos existentes dentro del terreno par el Nuevo Aeropuerto Internacional de la Ciudad de México	complete	0		1276500	MXN	Invitación a cuando menos tres personas	Artículo 27 fracción II y artículo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas			Presencial		2016-02-25 00:00:00	\N	2016-02-16 00:00:00	2016-02-16 00:00:00	1		\N	\N	4	\N	
2	2	0			none	0		9429941.46	MXN	Invitación a cuando menos tres personas						\N	\N	\N	\N	0		\N	\N	0	\N	
20	20	0			none	0		0	MXN	Adjudicación Directa						\N	\N	\N	\N	0		\N	\N	0	\N	
113	113	-	Servicios especializados en el suministro de personal tercerizados.	Contratacion de Personal tercerizado	complete	0	MXN	129391633.00	MXN	Adjudicación Directa	Artículos 41 Fracción III, 43 último párrafo y 47 de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público					\N	\N	\N	\N	0		\N	\N	1	\N	
22	22	911933	Nivelación y limpieza del terreno del Nuevo Aeropuerto Internacional de la Ciudad de México	Nivelación y limpieza del terreno del Nuevo Aeropuerto Internacional de la Ciudad de México	complete	0		3950000000	MXN	Licitación Pública	Articulos 27, fracción I, 30, fracción I, y 45, fracción I, de la Ley de Obras Públicas y Servcios Relacionados con las Mismas.  	Puntos y porcentajes	Capitulo 2 -De la Licitación de la Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N79-2015.	Presencial		2015-11-12 00:00:00	\N	2015-10-14 00:00:00	2015-10-29 00:00:00	1	Capitulo 2 -De la Licitación de la Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N79-2015.	\N	\N	31	\N	
79	79	1018414 	Servicios profesionales de consultoría, para el acompañamiento jurídico normativo y administrativo en la realización de las actividades para el desarrollo del Nuevo Aeropuerto Internacional de la Ciudad de México, así como para la elaboración del expediente concentrador integral	Servicios profesionales de consultoría, para el acompañamiento jurídico normativo y administrativo en la realización de las actividades para el desarrollo del Nuevo Aeropuerto Internacional de la Ciudad de México, así como para la elaboración del expediente concentrador integral	complete	40600000	MXN	85260000.00	MXN	Invitación a cuando menos tres personas	Artículo 41 fracción X de la Ley de Adquisiciones, Arrendamiento y Servicios del Sector Público	Invitación Nacional a cuando Menos Tres Personas identificado con el número IA-009KDH999-E23-2016 del Servicios profesionales de consultoría, para el acompañamiento jurídico normativo y administrativo en la realización de las actividades para el desarrollo del Nuevo Aeropuerto Internacional de la Ciudad de México, así como para la elaboración del expediente concentrador integral, es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 10 de marzo de 2016	Apartados 2.10 y 2.11 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IA-009KDH999-E23-2016 del Servicios profesionales de consultoría, para el acompañamiento jurídico normativo y administrativo en la realización de las actividades para el desarrollo del Nuevo Aeropuerto Internacional de la Ciudad de México, así como para la elaboración del expediente concentrador integral, es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 10 de marzo de 2016	transferencia		\N	\N	2016-03-11 00:00:00	2016-03-11 00:00:00	0	Apartado 2.10 y 2.11 de la Ilnvitación Nacional a cuando Menos Tres Personas identificado con el númeronúmero IA-009KDH999-E23-2016 de 9 de marzo de 2016 (ver anexo)	\N	\N	3	\N	
6	6	761895	Servicios de supervisión para la obra: extracción de ademes y restitución del terreno que ocupan dichos elementos ubicados en la poligonal para el Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	Servicios de supervisión para la obra: extracción de ademes y restitución del terreno que ocupan dichos elementos ubicados en la poligonal para el Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	complete	0		2680000	MXN	Invitación a cuando menos tres personas	Artículo 27 fracción II y artículo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas	Mecanismo binario	Capítulo 2.13 de la  Invitación Nacional a Cuando Menos Tres Personas No. IO-009KDH99-N10-2015 relativa a la supervisión para la obra: Extracción de ademes y restitución del terreno que ocupan dichos elementos ubicados en la poligonal para el Nuevo Aeropuerto Internacional de la Ciudad de México  (ver anexo)	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 10:00 horas del 04 de marzo de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Ángel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Subdirector de Contrataciones de GACM.  Se rubricaron los documentos técnicos T.2 y T.3, así como la documentación económica E-10 correspondiente a las 3 proposiciones presentadas.	2015-06-26 00:00:00	\N	2015-02-18 00:00:00	2015-02-25 00:00:00	0		\N	\N	4	\N	
14	14	865741	Invitación a cuando menos tres personas No. IO-009KDH999-N54-2015, para el servicio: "Supervisión para: Construcción del proyecto integral consistente en barda y camino perimetral, alumbrado, servicios inducidos y casetas de acceso para el NAICM (PRIMERA ETAPA)."	Supervisión para: Construcción del proyecto integral consistente en barda y camino perimetral, alumbrado, servicios inducidos y casetas de acceso para el NAICM (PRIMERA ETAPA)	complete	0		4000000	MXN	Invitación a cuando menos tres personas	Artículos 27, fracción II, 30, fracción I, 36, 37, 38, 39 y 45, fracción I, de la Ley de Obras Públicas y Servicios Relacionados con las Misma.	Binario	Capitulo 2-De la invitación a cuando menos tres personas (numerales 2.13 y 2.14) de la invitación a cuando menos tres personas No. IO-009KDH999-N54-2015, aplicando el mecanismo de evaluación binario, carácter nacional, publicada en compranet el 3 de agosto de 2015.	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 18:00 horas del 11 de agosto de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Subdirector de Contrataciones de GACM. 	2015-08-11 00:00:00	\N	2015-08-07 00:00:00	2015-08-07 00:00:00	1	Convocatoria de la Invitación a cuando menos tres personas No. IO-009KDH999-N54-2015, aplicando el mecanismo de evaluación binario, carácter nacional, publicada en compranet el 3 de agosto de 2015.	2015-08-14 00:00:00	\N	5	\N	
84	84	914874	Servicio de transporte con camionetas de redilas para los trabajos que conforman el programa de empleo temporal (PET), en el predio del Nuevo Aeropuerto Internacional de la Ciudad de México	Servicio de transporte con camionetas de redilas para los trabajos que conforman el programa de empleo temporal (PET), en el predio del Nuevo Aeropuerto Internacional de la Ciudad de México	complete	0		9170000	MXN	Invitación a cuando menos tres personas	Artículo 43 de la LOPSRM	Apartado 4.1 y 4.2 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N81-2015 del 7 de mayo de 2015, relacionado con el “Servicio de transporte con camionetas de redilas para los trabajos que conforman el programa de empleo temporal (PET), en el predio del Nuevo Aeropuerto Internacional de la Ciudad de México", es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 5 de octubre de 2015	Apartado 1.1 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N81-2015 del 7 de mayo de 2015, relacionado con el “Servicio de transporte con camionetas de redilas para los trabajos que conforman el programa de empleo temporal (PET), en el predio del Nuevo Aeropuerto Internacional de la Ciudad de México", es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 5 de octubre de 2015	transferencia		\N	\N	2015-10-08 00:00:00	2015-10-08 00:00:00	1	Apartado 4.3 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N81-2015 del 5 de octubre de 2015 (ver anexo)	\N	\N	3	\N	
75	75	1	Proyecto de Salvamento Arqueológico en el interior del Lago de Taxcoco en su zona oriente, Estado de México. (Supervisión, Vigilancia y Excavaciones 2016), en Adelante los SERVICIOS, mismos que serán realizados totalmente a satisfacción del GACM	Proyecto de Salvamento Arqueológico en el interior del Lago de Taxcoco en su zona oriente, Estado de México. (Supervisión, Vigilancia y Excavaciones 2016), en Adelante los SERVICIOS, mismos que serán realizados totalmente a satisfacción del GACM	active	0		10163709.00	MNX	Adjudicación Directa	Artículo 1 de la LOPSRM	Artículo 1 de la LOPSRM		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
71	71	1	Establecer un mecanismo de coordinación corresponsable entre las partes. Para el mantenimiento y la operación de las obras de infraestructura para llevar a cabo la regulación hidraulica en las zonas aledañas al proyecto que permitan favorecer y mejorar el hábitat para las aves acuáticas migratorias que arrivan a la zona, así como las aves residentes y realizar en forma coordinada la operación y mantenimiento de las obras hidráulicas de regulación y conducción de los escurimientos pluviales provenientes del interior del perímetro del proyecto, durante su etapa de construcción, a través de un sistema de drenaje que operará temporalmente, los cuáles serán regulados en dos lagunas a cargo del GACM y cuyas descargas al Dren General del Valle. Quedarán bajo el control de la CONAGUA	Establecer un mecanismo de coordinación corresponsable entre las partes. Para el mantenimiento y la operación de las obras de infraestructura para llevar a cabo la regulación hidraulica en las zonas aledañas al proyecto que permitan favorecer y mejorar el hábitat para las aves acuáticas migratorias que arrivan a la zona, así como las aves residentes y realizar en forma coordinada la operación y mantenimiento de las obras hidráulicas de regulación y conducción de los escurimientos pluviales provenientes del interior del perímetro del proyecto, durante su etapa de construcción, a través de un sistema de drenaje que operará temporalmente, los cuáles serán regulados en dos lagunas a cargo del GACM y cuyas descargas al Dren General del Valle. Quedarán bajo el control de la CONAGUA	active	0		0	MNX	Adjudicación Directa	Artículo 1 de la LOPSRM	Artículo 1 de la LOPSRM				\N	\N	\N	\N	0		\N	\N	1	\N	
93	93	-			complete	0		0		Adjudicación Directa	Artículo 1 de la LOPSRM			Presencial		\N	\N	\N	\N	0		\N	\N	1	\N	
105	105	1	Elaboración y puesta en marcha del Sistema Integeal e Gestión de Cumplimiento Ambiental (SIGCA) para el Proyecto Nuevo Aeropuerto Internacional de la Ciudad de México	Elaboración y puesta en marcha del Sistema Integeal e Gestión de Cumplimiento Ambiental (SIGCA) para el Proyecto Nuevo Aeropuerto Internacional de la Ciudad de México	active	0		134800000.00	MNX	Adjudicación Directa	Artículo 1 de la LOPSRM	Artículo 1 de la LOPSRM		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
86	86	1099156	Supervisión Técnica Administrativa y de Control de Calidad para los Trabajos de Carga, Acarreo y Descarga fuera del Polígono del material existente, producto de depósitos de Demolición, Desperdicio y Desazolve	Supervisión Técnica Administrativa y de Control de Calidad para los Trabajos de Carga, Acarreo y Descarga fuera del Polígono del material existente, producto de depósitos de Demolición, Desperdicio y Desazolve	complete	0	MXN	7519121.39	MXN	Adjudicación Directa	Artículo 43 de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.					\N	\N	\N	\N	0		\N	\N	1	\N	
77	77	982035	Servicio relacionado con el programa de empleo temporal (PET) correspondiente a las acciones preparatorias para la construcción del Nuevo Aeropuerto Internacional de la Ciudad de México (servicio de traslado de personas)	Servicio relacionado con el programa de empleo temporal (PET) correspondiente a las acciones preparatorias para la construcción del Nuevo Aeropuerto Internacional de la Ciudad de México (servicio de traslado de personas)	complete	0	No aplica	2355000	MXN	Adjudicación Directa	Artículo 42, párrafo segundo y tercero de la Ley  de Adquisiciones, Arrendamientos y Servicios del Sector Público	Presencial	Presencial	transferencia	No aplica	\N	\N	\N	\N	0		\N	\N	1	\N	
108	108	798633	Programa de rescate y reubicación de flora para el Nuevo Aeropuerto Internacional de la Ciudad de México.	Programa de rescate y reubicación de flora para el Nuevo Aeropuerto Internacional de la Ciudad de México.	unsuccessful	0	MXN	458200	MXN	Adjudicación Directa	Artículo 43 de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.	Artículo 43 de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
17	18	0			none	0		4286458.44	MXN	Adjudicación Directa						\N	\N	\N	\N	0		\N	\N	0	\N	
39	39	1	Servicios de Asistencia Técnica Especializada en materia de Hidráulica aplicada a la Infraestructura Aeroportuaria	Servicios de Asistencia Técnica Especializada en materia de Hidráulica aplicada a la Infraestructura Aeroportuaria	active	0	MXN	15650000	MXN	Adjudicación Directa	Artículos 27, fracción III, 41 y 42, fracción X de la LOPSRM	Anexo Técnico, Propuesta Técnica y Económica de los Servicios relativos a la "Servicios de Asistencia Técnica Especializada en materia de Hidráulica aplicada a la Infraestructura Aeroportuaria"	Anexo Técnico, Propuesta Técnica y Económica de los Servicios relativos a la "Servicios de Asistencia Técnica Especializada en materia de Hidráulica aplicada a la Infraestructura Aeroportuaria"			\N	\N	\N	\N	0		\N	\N	1	\N	
40	40	1036664	Servicios de asistencia técnica especializada en materia de diseño sismico estructural aplicada a la infraestructura aeroportuaria	Servicios de asistencia técnica especializada en materia de diseño sismico estructural aplicada a la infraestructura aeroportuaria	active	0		17000000.00	MXN	Adjudicación Directa	Artículo 42, fracción X de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.	Artículo 42, fracción X de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.				\N	\N	\N	\N	0		\N	\N	1	\N	
57	57	62501001	Servicio de Experto Revisor para el Panel de Hidráulica Aplicada a la Infraestructura Aeroportuaria.	Servicio de Experto Revisor para el Panel de Hidráulica Aplicada a la Infraestructura Aeroportuaria.	none	0		15650000	MXN	Adjudicación Directa	Artículo 42 fracción X de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.			Presencial		\N	\N	\N	\N	0		\N	\N	1	\N	
41	41	1	Servicios de experto revisor para la asistencia técnica especializada en materia de diseño sismico estructural, aplicada a la infraestructura aeroportuaria	Servicios de experto revisor para la asistencia técnica especializada en materia de diseño sismico estructural, aplicada a la infraestructura aeroportuaria	active	0		260000000.00		Adjudicación Directa	Artículo 42, fracción X de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.	Artículo 42, fracción X de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.				\N	\N	\N	\N	0		\N	\N	1	\N	
43	43	1033446	Servicios de experto revisor para la asistencia técnica especializada en materia de protección contra incendios, aplicada a la infraestructura aeroportuaria	Servicios de experto revisor para la asistencia técnica especializada en materia de protección contra incendios, aplicada a la infraestructura aeroportuaria	active	0		26000000.00	MNX	Adjudicación Directa	Artículo 42, fracción X de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.	Artículo 42, fracción X de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.				\N	\N	\N	\N	0		\N	\N	1	\N	
42	42	1	Servicios de asistencia técnica especializada en materia de diseño sismico estructural aplicada a la infraestructura aeroportuaria	Servicios de asistencia técnica especializada en materia de diseño sismico estructural aplicada a la infraestructura aeroportuaria	active	0		15650000.00		Adjudicación Directa	Artículo 42, fracción X de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.	Artículo 42, fracción X de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.				\N	\N	\N	\N	0		\N	\N	1	\N	
58	58	798985	Servicio de Ambulancia para el Traslado de Personal, para el Programa de Empleo Temporal (PET).	Servicio de Ambulancia para el Traslado de Personal, para el Programa de Empleo Temporal (PET).	complete	0		450000	MXN	Adjudicación Directa	Artículo 26, fracción III, 42 .LAASSP.			Presencial		\N	\N	\N	\N	0		\N	\N	1	\N	
87	87	798985	Pruebas de Laboratorio Geotécnicas complementarias para el Proyecto Ejecutivo de Sistema de Drenaje Temporal del Nuevo Aeropuerto Internacional de la Ciudad de México	Pruebas de Laboratorio Geotécnicas complementarias para el Proyecto Ejecutivo de Sistema de Drenaje Temporal del Nuevo Aeropuerto Internacional de la Ciudad de México	complete	0	MXN	163793.10	MXN	Adjudicación Directa	Artículo 43 de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.					\N	\N	\N	\N	0		\N	\N	1	\N	
60	60	1043372	Servicios consistentes en Baños portátiles	Servicios consistentes en Baños portátiles	none	0		750000	MXN	Adjudicación Directa	Artículo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas			Presencial		\N	\N	\N	\N	0		\N	\N	1	\N	
37	37	1043484	Materiales para la Construcción	Materiales para la Construcción	complete	0		400000	MXN	Adjudicación Directa	Artículos 26, fracción III y 42 de la LAASSP	Anexo Técnico y Cotización de los "Materiales para la Construcción	Anexo Técnico y Cotización de los "Materiales para la Construcción			\N	\N	\N	\N	0		\N	\N	1	\N	
38	38	1043484	Materiales para la Construcción	Materiales para la Construcción	active	0		400000	MXN	Adjudicación Directa	Artículos 26, fracción III y 42 de la LAASSP	Anexo Técnico y Cotización de los "Materiales para la Construcción"	Anexo Técnico y Cotización de los "Materiales para la Construcción"			\N	\N	\N	\N	0		\N	\N	1	\N	
18	17	971461	Servicio de integración de la estrategia global y modelo de negocios para el Nuevo Aeropuerto Internacional de la Ciudad de México	Servicio de integración de la estrategia global y modelo de negocios para el Nuevo Aeropuerto Internacional de la Ciudad de México	complete	0		122000000	MXN	Invitación a cuando menos tres personas	Artículo 27 fracción II y artículo 42 fracción XI de la Ley de Obras Públicas y Servicios Relacionados con las Mismas	Mecanismo de puntos y porcentajes	Capítulo 2.12 de la Invitación Internacional a Cuando Menos Tres Personas No. IO-009KDH999-E96-2015 relativa a la integración de la estrategia global y  modelo de negocios para el Nuevo Aeropuerto Internacional de la Ciudad de México (ver anexo)	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 11:00 horas del 22 de enero de 2016, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Ángel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Subdirector de Contrataciones de GACM.  Se rubricaron los documentos técnicos T.2 y T.3, así como la documentación económica E-10 correspondiente a las 3 proposiciones presentadas.	2016-02-22 00:00:00	\N	2016-01-19 00:00:00	2016-01-19 00:00:00	1	Capítulo 2.9 y 2.10 de la Convocatoria  Invitación Internacional a Cuando Menos Tres Personas No. IO-009KDH999-E96-2015 relativa a la integración de la estrategia global y  modelo de negocios para el Nuevo Aeropuerto Internacional de la Ciudad de México (ver anexo)	2016-02-26 00:00:00	\N	2	\N	
63	63	1			none	0		13051740	MXN	Convenio de colaboración						\N	\N	\N	\N	0		\N	\N	1	\N	
64	64	1			none	0		10954142.71	MXN	Convenio de colaboración						\N	\N	\N	\N	0		\N	\N	1	\N	
65	65	1			none	0		2697000	MXN	Convenio de colaboración						\N	\N	\N	\N	0		\N	\N	1	\N	
66	66	1			none	0		8991688.20	MXN	Convenio de colaboración						\N	\N	\N	\N	0		\N	\N	1	\N	
44	44	1037341	Servicio de asistencia técnica especializada en materia de hidráulica aplicada a la infraestructura aeroportuaria.	Servicio de asistencia técnica especializada en materia de hidráulica aplicada a la infraestructura aeroportuaria.	active	0		15650000.00	MNX	Adjudicación Directa	Artículo 42 Fracción X de la Ley de Obras Públicas y Servicios Relacionados con las Mismas 	Artículo 42 Fracción X de la Ley de Obras Públicas y Servicios Relacionados con las Mismas 				\N	\N	\N	\N	0		\N	\N	1	\N	
28	28	762798	Servicio de un Testigo Social para que atestigüe en las etapas de la invitación a cuando menos tres personas, presencial, internacional bajo la cobertura de trarados de libre comercio, relativa a la contratación de los servicios relacionados con obra pública, consistentes en el desarrollo del proyecto ejecutivo de pistas, rodajes y plataformas y ayudas a la navegación y otras instalaciones del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	Servicio de un Testigo Social para que atestigüe en las etapas de la invitación a cuando menos tres personas, presencial, internacional bajo la cobertura de trarados de libre comercio, relativa a la contratación de los servicios relacionados con obra pública, consistentes en el desarrollo del proyecto ejecutivo de pistas, rodajes y plataformas y ayudas a la navegación y otras instalaciones del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	complete	0	MXN	0	MXN	Adjudicación Directa	Artículos 54 del Reglamento de la Ley de Obras, Públicas y Servicios Relacionados con las Mismas; así como 26 Fracción III, y 42 de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público.					\N	\N	\N	\N	0		\N	\N	1	\N	
30	30	787229	Estudio de Suministro Electrico para el Nuevo Aeropuerto Internacional de la Ciudad de México	Estudio de Suministro Electrico para el Nuevo Aeropuerto Internacional de la Ciudad de México	complete	0	MXN	11000000.00	MXN	Licitación Pública	Articulos 27, fracción II, 30, fracción II, 36, 37, 38, 39, 41, 43, 44  y 45, fracción I, de la Ley de Obras Públicas y Servcios Relacionados con las Mismas.  	Capitulo 2 -De la Licitación de la Convocatoria de la Licitación Pública Nacional No. LO-009KDH999-N16-2015, de fecha 24 de marzo de 2015 y que se público en CompraNet el día 26 de marzo del 2015.	Capitulo 6 -Anexos a esta Convocatoria, Numeral 6.5 Términos de Referencia, de la Convocatoria de la Licitación Pública Nacional No. LO-009KDH999-N16-2015, de fecha 24 de marzo de 2015 y que se público en CompraNet el día 26 de marzo del 2015.	Presencial	El día 16 de abril del 2015 y de conformidad con los artículos 36 y 37 de la LOPSRM y 59 y 60 del RLOPSRM, el Subdirector de Contrataciones del GACM, preside el acto de presentación y apertura de propuestas económicas, de las cuales, 1 es consorcio. De acuerdo con el artículo 37 de la LOPSRM, se reciben las proposiciones para su evaluación cualitativa y de acuerdo a ello se convoca para el día 24 de abril de 2015, para conocer el fallo correspondiente.	2015-04-16 00:00:00	\N	2015-04-08 00:00:00	2015-04-08 00:00:00	1	Capitulo 2 -De la Licitación de la Convocatoria de la Licitación Pública Nacional No. LO-009KDH999-N16-2015.	2015-04-24 00:00:00	\N	2	\N	
27	27	762905	Servicio de un Testigo Social para que atestigüe en las etapas de la licitación pública nacional presencial relativa a la contratación del servicio de extracción de ademes y restitución del terreno que ocupan dichos elementos, ubicados en el polígono para el Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	Servicio de un Testigo Social para que atestigüe en las etapas de la licitación pública nacional presencial relativa a la contratación del servicio de extracción de ademes y restitución del terreno que ocupan dichos elementos, ubicados en el polígono para el Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	complete	0	MXN	527973.49	MXN	Adjudicación Directa	Artículos 54 del Reglamento de la Ley de Obras, Públicas y Servicios Relacionados con las Mismas; así como 26 Fracción III, y 42 de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público.					\N	\N	\N	\N	0		\N	\N	1	\N	
29	29	905681	Proyecto ejecutivo del drenaje pluvial temporal para la protección de la zona contra inundaciones provenientes de precipitaciones dentro del perímetro del Aeropuerto en el lago de Texcoco, durante la construcción de la primera fase del Nuevo Aeropuerto Internacional de la Ciudad de México	Proyecto ejecutivo del drenaje pluvial temporal para la protección de la zona contra inundaciones provenientes de precipitaciones dentro del perímetro del Aeropuerto en el lago de Texcoco, durante la construcción de la primera fase del Nuevo Aeropuerto Internacional de la Ciudad de México	complete	0	MXN	19500000	MXN	Adjudicación Directa	Artículo 42 fracción XIV de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.					\N	\N	\N	\N	0		\N	\N	1	\N	
70	70	1	Llevar a cabo el Servicio de Investigaciones y Estudios Especiales Relacionados con Aspectos Geotécnicos del Nuevo Aeropuerto de la Ciudad de México (NAICM) en el Vaso del Ex-Lago de Texcoco, Zona Federal	Llevar a cabo el Servicio de Investigaciones y Estudios Especiales Relacionados con Aspectos Geotécnicos del Nuevo Aeropuerto de la Ciudad de México (NAICM) en el Vaso del Ex-Lago de Texcoco, Zona Federal	none	0		177305923.44	MNX	Adjudicación Directa	Artículo 1 de la LOPSRM	Artículo 1 de la LOPSRM				\N	\N	\N	\N	0		\N	\N	1	\N	
31	31	839816	Programa general de abastecimiento, uso y disposición de agua del nuevo Aeropuerto Internacional de la Ciudad de México (PROAGUA), Etapa I	Programa general de abastecimiento, uso y disposición de agua del nuevo Aeropuerto Internacional de la Ciudad de México (PROAGUA), Etapa I	complete	0	MXN	9500000.00	MXN	Invitación a cuando menos tres personas	Artículo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas	Apartado 2.10 y 211 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N51-2015 del 10 de junio de 2015, relacionado con el  “Programa general de abastecimiento, uso y disposición de agua del nuevo Aeropuerto Internacional de la Ciudad de México (PROAGUA), Etapa I", es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 23 de marzo de 2015.	Apartado 6.5 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N51-2015 del 10 de junio de 2015, relacionado con el  “Programa general de abastecimiento, uso y disposición de agua del nuevo Aeropuerto Internacional de la Ciudad de México (PROAGUA), Etapa I", es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 23 de marzo de 2015, y Términos de referencia	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 10:00 horas del 1 de julio de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Gerente de Concursos de la Subdirección de Contrataciones de GACM	2015-07-07 00:00:00	\N	2015-07-01 00:00:00	2015-07-01 00:00:00	1	Apartado 2.1, 2.2 y 2.10 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N51-2015 del 23 de marzo de 2015 (ver anexo) 	2015-07-10 00:00:00	\N	4	\N	
67	67	1	Campaña de exploración geotécnica de campo 2015. Muestreo y sistemas de Medición en el subsuelo en las zonas de aeropistas, calles de redaje y caminos internos del NAICM, en Texcoco, Estado de México	Campaña de exploración geotécnica de campo 2015. Muestreo y sistemas de Medición en el subsuelo en las zonas de aeropistas, calles de redaje y caminos internos del NAICM, en Texcoco, Estado de México	none	0		182500000.00	MXN	Adjudicación Directa	Artículo 1 de la LOPSRM	Artículo 1 de la LOPSRM				\N	\N	\N	\N	0		\N	\N	1	\N	
68	68	1	Llevar a cabo el servicio de elaboración de programas y propuestas de acciones, ambientales para el proyecto Nuevo Aeropuerto de la Ciudad de México (NAICM)	Llevar a cabo el servicio de elaboración de programas y propuestas de acciones, ambientales para el proyecto Nuevo Aeropuerto de la Ciudad de México (NAICM)	active	0		7667600.00	MNX	Adjudicación Directa	Artículo 1 de la LOPSRM	Artículo 1 de la LOPSRM				\N	\N	\N	\N	0		\N	\N	1	\N	
69	69	1	Llevar a cabo el Servicio de Investigaciones y Estudios Especiales, Relacionados con Aspectos Estructurales del Nuevo Aeropuerto de la Ciudad de México (NAICM) en el Vaso del Ex-Lago de Texcoco, Zona Federal	Llevar a cabo el Servicio de Investigaciones y Estudios Especiales, Relacionados con Aspectos Estructurales del Nuevo Aeropuerto de la Ciudad de México (NAICM) en el Vaso del Ex-Lago de Texcoco, Zona Federal	active	0		5525000000.00	MNX	Adjudicación Directa	Artículo 1 de la LOPSRM	Artículo 1 de la LOPSRM				\N	\N	\N	\N	0		\N	\N	1	\N	
72	72	1	Instrumentación de Planes y Programas Ambientales para el Proyecto del NAICM	Instrumentación de Planes y Programas Ambientales para el Proyecto del NAICM	cancelled	0		34800000.00	MNX	Adjudicación Directa	Artículo 1 de la LOPSRM	Artículo 1 de la LOPSRM				\N	\N	\N	\N	0		\N	\N	1	\N	
73	73	1	Servicio de Seguridad para Salvaguardar la vida e integridad física de los trabajadores, la protección de la infraestructura, inmuebles y zonas federales concesionados a la entidad	Servicio de Seguridad para Salvaguardar la vida e integridad física de los trabajadores, la protección de la infraestructura, inmuebles y zonas federales concesionados a la entidad	active	0		28800000.00	MNX	Adjudicación Directa	Artículo 1 de la LOPSRM	Artículo 1 de la LOPSRM		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
74	74	1	"Estudio de rehabilitacion y adaptacion de los canales existentes para que funcionen como infraestructura de drenaje temporal, y remocion de material de desecho, en el terreno del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)"	"Estudio de rehabilitacion y adaptacion de los canales existentes para que funcionen como infraestructura de drenaje temporal, y remocion de material de desecho, en el terreno del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)"	active	0		1400000.00	MNX	Adjudicación Directa	Artículo 1 de la LOPSRM	Artículo 1 de la LOPSRM		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
45	45	1032142	Servicio de asistencia técnica especializada en materia de Geotecnia y Cimentación aplicada a la infraestructura aeroportuaria.	Servicio de asistencia técnica especializada en materia de Geotecnia y Cimentación aplicada a la infraestructura aeroportuaria.	active	0		15650000.00	MNX	Adjudicación Directa	Artículo 42 Fracción X de la Ley de Obras Públicas y Servicios Relacionados con las Mismas 	Artículo 42 Fracción X de la Ley de Obras Públicas y Servicios Relacionados con las Mismas 		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
46	46	1037233	Servicios de Asistencia Técnica Especializada en Materia de Diseño Sismico Estructural Aplicada a la Infraestructura Aeroportuaria.	Servicios de Asistencia Técnica Especializada en Materia de Diseño Sismico Estructural Aplicada a la Infraestructura Aeroportuaria.	active	0		26000000	MNX	Adjudicación Directa	Artículos 27 fracción III, 41, 42 fracción X de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.	Artículos 27 fracción III, 41, 42 fracción X de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.				\N	\N	\N	\N	0		\N	\N	1	\N	
59	59	982694	Servicio de un Testigo Social para que atestigüe las etapas del procedimiento de la Licitación Pública Nacional, relativa a la contratación de la obra pública, para la construcción del proyecto ejecutivo de drenaje pluvial temporal para la protección de la zona durante la construcción de la primera fase del NAICM	Servicio de un Testigo Social para que atestigüe las etapas del procedimiento de la Licitación Pública Nacional, relativa a la contratación de la obra pública, para la construcción del proyecto ejecutivo de drenaje pluvial temporal para la protección de la zona durante la construcción de la primera fase del NAICM	none	0		580000	MXN	Adjudicación Directa	Artículos 54 de la LOPSRM, 26 fracción III, 41 fracción I y 47 de la Ley de Adquisiciones Arrendamientos y Servicios del Sector Público					\N	\N	\N	\N	0		\N	\N	1	\N	
55	55	-	Testigo Social para que atestigue las etapas del Procedimiento de Licitación Publica Nacional para el Proyecto denominado "Excavación de Prueba, Losa Experimental y Prueba de Pilotes para el Edificio Terminal y Torre de Control	Testigo Social para que atestigue las etapas del Procedimiento de Licitación Publica Nacional para el Proyecto denominado "Excavación de Prueba, Losa Experimental y Prueba de Pilotes para el Edificio Terminal y Torre de Control	complete	0	MXN	289999.99	MXN	Adjudicación Directa	Artículo 42 de la Ley  de Adquisisciones, Arrendamientos y Servicios del Sector Público.	Documento que describe los criterios que deben cumplir los licitantes				\N	\N	\N	\N	0	Requisitos y criterios de elegibilidad para los participantes	\N	\N	1	\N	
35	35	799522	Asesoria Legal en materia de Derecho de la Aviación, Derecho Aeropuertario, Derecho Internacional y Especializado en Asesoría en Negociación con Empresas Nacionales e Internacionales, en general acompañamiento respecto de todo aquel Procedimiento Jurídico de las distintas materias que reconoce nuestro Sistema Jurídico Mexicano.	Asesoria Legal en materia de Derecho de la Aviación, Derecho Aeropuertario, Derecho Internacional y Especializado en Asesoría en Negociación con Empresas Nacionales e Internacionales, en general acompañamiento respecto de todo aquel Procedimiento Jurídico de las distintas materias que reconoce nuestro Sistema Jurídico Mexicano.	complete	0	MXN	15000000.00	MXN	Invitación a cuando menos tres personas	Artículo 40, 41, fracción X, 43 y 46, segundo párrafo de la LAASSP. 	Apartados 4, 4.1, 6, 6.1 y 6.2 de la Invitación Nacional a cuando Menos Tres Personas Presencial identificado con el número IO-009KDH999-N30-2015 del 10 de abril de 2015, relacionado con el “Servicio de: Asesoria Legal en materia de Derecho de la Aviación, Derecho Aeropuertario, Derecho Internacional y Especializado en Asesoría en Negociación con Empresas Nacionales e Internacionales, en general acompañamiento respecto de todo aquel Procedimiento Jurídico de las distintas materias que reconoce nuestro Sistema Jurídico Mexicano".	Apartados 2, 2.1 y Anexo 1 de la Invitación Nacional a cuando Menos Tres Personas Presencial identificado con el número IO-009KDH999-N30-2015 del 10 de abril de 2015, relacionado con el “Servicio de: Asesoria Legal en materia de Derecho de la Aviación, Derecho Aeropuertario, Derecho Internacional y Especializado en Asesoría en Negociación con Empresas Nacionales e Internacionales, en general acompañamiento respecto de todo aquel Procedimiento Jurídico de las distintas materias que reconoce nuestro Sistema Jurídico Mexicano".	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 10:00 horas del 05 de mayo de 2015, en la sala de juntas ubicada en la Subdirección de Contrataciones ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Gerente de Concursos de la Subdirección de Contrataciones de GACM	2015-05-05 00:00:00	\N	2015-04-28 00:00:00	2015-04-28 00:00:00	1	Apartados 4, 4.1, 6, 6.1 y 6.2 de la Invitación Nacional a cuando Menos Tres Personas Presencial identificado con el número IO-009KDH999-N30-2015 del 10 de abril de 2015, relacionado con el “Servicio de: Asesoria Legal en materia de Derecho de la Aviación, Derecho Aeropuertario, Derecho Internacional y Especializado en Asesoría en Negociación con Empresas Nacionales e Internacionales, en general acompañamiento respecto de todo aquel Procedimiento Jurídico de las distintas materias que reconoce nuestro Sistema Jurídico Mexicano".	2015-05-13 00:00:00	\N	3	\N	
32	32	903614	Servicio de testigo social para que atestigue las etapas del procedimiento de licitación pública nacional presencial, relativa a la contratación de la obra pública, consistente en el proyecto ejecutivo, construcción equipamiento mobiliario e instalaciones complementarias, para el campamento del grupo aeroportuario de la Ciudad de México en el sitio del Nuevo Aeropuerto Internacional de la Ciudad de México 	Servicio de testigo social para que atestigue las etapas del procedimiento de licitación pública nacional presencial, relativa a la contratación de la obra pública, consistente en el proyecto ejecutivo, construcción equipamiento mobiliario e instalaciones complementarias, para el campamento del grupo aeroportuario de la Ciudad de México en el sitio del Nuevo Aeropuerto Internacional de la Ciudad de México 	complete	133190.00	MXN	213104.00	MXN	Adjudicación Directa	Artículo 42 Parrafo Segundo de la  Ley de Adquisiciones Arrendamientos y Servicios del Sector Público. 					\N	\N	\N	\N	0		\N	\N	1	\N	
33	33	983798	Servicio de un testigo social para que atestigüe las etapas del procedimiento de la licitación pública internacional bajo la cobertura de tratados de libre comercio, consistente en diseñar e instrumentar el modelo virtual de información para la construcción del BIM del NAICM	Servicio de un testigo social para que atestigüe las etapas del procedimiento de la licitación pública internacional bajo la cobertura de tratados de libre comercio, consistente en diseñar e instrumentar el modelo virtual de información para la construcción del BIM del NAICM	complete	293550.76	MXN	432601.10	MXN	Adjudicación Directa	Artículo 41 fracción XIV de la Ley  de Adquisiciones, Arrendamientos y Servicios del Sector Público.					\N	\N	\N	\N	0		\N	\N	1	\N	
47	47	1041842	Servicios de Experto Revisor para la Asistencia Técnica Especializada en Materia de Diseño Estructural, Aplicada  a la Infraestructura Aeroportuaria.	Servicios de Experto Revisor para la Asistencia Técnica Especializada en Materia de Diseño Estructural, Aplicada  a la Infraestructura Aeroportuaria.	complete	0	MXN	26000000	MXN	Adjudicación Directa	Artículos 27 fracción III, 41, 42 fracción X de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.					\N	\N	\N	\N	0		\N	\N	1	\N	
111	111	843692	Servicios relacionados con el programa de empleo temporal (PET) correspondiente a a las acciones preparatorias para la contrucción del nuevo aeropuerto Internacional de la Ciudad de México (Servicio de traslado de personas en vehículos ligeros)	Servicios relacionados con el programa de empleo temporal (PET) correspondiente a a las acciones preparatorias para la contrucción del nuevo aeropuerto Internacional de la Ciudad de México (Servicio de traslado de personas en vehículos ligeros)	complete	0	MXN	9170000.00	MXN	Invitación a cuando menos tres personas	Artículo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas	Apartado 4.1 y 4.2 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N53-2015 del 30 de junio de 2015, relacionado con el Servicios relacionados con el programa de empleo temporal (PET) correspondiente a las acciones preparatorias para la contrucción del nuevo aeropuerto Internacional de la Ciudad de México (Servicio de traslado de personas en vehículos ligeros), es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 30 de junio de 2015.	Apartado 2.1 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N53-2015 del 30 de junio de 2015, relacionado con el Servicios relacionados con el programa de empleo temporal (PET) correspondiente a las acciones preparatorias para la contrucción del nuevo aeropuerto Internacional de la Ciudad de México (Servicio de traslado de personas en vehículos ligeros), es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 30 de junio de 2015.	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 12:00 horas del 09 de julio de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Gerente de concursos de la Subdirección de Contrataciones de GACM	2015-07-09 00:00:00	\N	2015-07-02 00:00:00	2015-07-02 00:00:00	1	Apartado 4.1 y 4.2 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N53-2015 del 30 de junio de 2015, relacionado con el Servicios relacionados con el programa de empleo temporal (PET) correspondiente a las acciones preparatorias para la contrucción del nuevo aeropuerto Internacional de la Ciudad de México (Servicio de traslado de personas en vehículos ligeros).	2015-07-09 00:00:00	\N	3	\N	
96	96	1			active	0		0		Adjudicación Directa	Artículo 1 de la LOPSRM	Artículo 1 de la LOPSRM		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
97	97	1			active	0		0		Adjudicación Directa	Artículo 1 de la LOPSRM	Artículo 1 de la LOPSRM				\N	\N	\N	\N	0		\N	\N	1	\N	
50	50	938432	Adecuación de espacios para las oficinas del Grupo Aeroportuario de la Ciudad de México (GACM) en el CEMCAS	Adecuación de espacios para las oficinas del Grupo Aeroportuario de la Ciudad de México (GACM) en el CEMCAS	complete	0	MXN	9750000.00	MXN	Invitación a cuando menos tres personas	Artículo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas	Apartado 2.10 y 2.11 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N82-2015 del 3 de noviembre de 2015, relacionado con la “Adecuación de espacios para oficinas, del Grupo Aeroportuario de la Ciudad de México (GACM), en el CEMCAS, es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 6 de noviembre de 2015.	Apartado 6.4 y6.5 de la Invitación Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N82-2015 del 3 de noviembre de 2015, relacionado con la “Adecuación de espacios para oficinas, del Grupo Aeroportuario de la Ciudad de México (GACM), en el CEMCAS, es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 6 de noviembre de 2015.	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 14:00 horas del 17 de noviembre de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Gerente de concursos de la Subdirección de Contrataciones de GACM	2015-11-17 00:00:00	\N	2015-11-10 00:00:00	2015-11-10 00:00:00	1	Apartado 2.10 y 2.11 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N82-2015 del 3 de noviembre de 2015, (ver anexo)	2015-11-19 00:00:00	\N	3	\N	
110	110	799505	Servicios de Consultoría Técnica Especializada en Revisión e Integración de Términos de Referencia y Especificaciones Técnicas, de Proyectos de Licitación de Obras Públicas	Servicios de Consultoría Técnica Especializada en Revisión e Integración de Términos de Referencia y Especificaciones Técnicas, de Proyectos de Licitación de Obras Públicas	complete	0	MXN	14655172.41	MXN	Invitación a cuando menos tres personas	Artículo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas	Apartado 2.1, 2.2 y 2.10 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N29-2015 del 20 de abril de 2015, relacionado con los Servicios de Consultoría Técnica Especializada en Revisión e Integración de Términos de Referencia y Especificaciones Técnicas, de Proyectos de Licitación de Obras Públicas, es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 20 de abril de 2015.	Apartado 2.11 Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N29-2015 del 20 de abril de 2015, relacionado con los Servicios de Consultoría Técnica Especializada en Revisión e Integración de Términos de Referencia y Especificaciones Técnicas, de Proyectos de Licitación de Obras Públicas, es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 20 de abril de 2015.	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 18:00 horas del 04 de mayo de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Gerente de concursos de la Subdirección de Contrataciones de GACM	2015-05-04 00:00:00	\N	2015-04-23 00:00:00	2015-04-23 00:00:00	1	Apartado 2.1, 2.2 y 2.10 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N29-2015 del 20 de abril de 2015 (ver anexo)	2015-05-12 00:00:00	\N	2	\N	
85	85	0	Plan de Maestro  para  el  Proyecto	Plan de Maestro  para  el  Proyecto	complete	0		27582750	MXN	Adjudicación Directa	Artículo 41, 42, FRACCIÓN III Y IV de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.			transferencia		\N	\N	\N	\N	0		\N	\N	0	\N	
78	78	799531	Servicios profesionales de consultoría, legales y/o normativos y acompañamiento en los procedimientos de contratación pública y elaboración del expediente concentrador integral del (NAICM)	Servicios profesionales de consultoría, legales y/o normativos y acompañamiento en los procedimientos de contratación pública y elaboración de la memoria documental integral del desarrollo del  Nuevo Aeropuerto Internacional de la Ciudad de México	complete	0	MXN	20360000	MXN	Adjudicación Directa	Artículo 41, fracción X de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público.	Invitación Nacional a cuando Menos Tres Personas identificado con el número IA-009KDH999-N31-2015 del 15 de abril de 2015, relacionado con los “Servicios profesionales de consultoría, legales y/o normativos y acompañamiento en los procedimientos de contratación pública y elaboración de la memoria historica del desarrollo del NAICM, es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 6 de mayo de 2015	Apartado 2.1, 2.2 y 2.10 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N34-2015 del 7 de mayo de 2015, relacionado con el “Proyecto Ejecutivo para la Construcción del Camino Perimetral y sus Instalaciones Complementarias en el lado Norte del Polígono de NAICM, es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 8 de mayo de 2015	transferencia		\N	\N	2016-07-12 00:00:00	\N	0	Apartado 6. de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IA-009KDH999-N31-2015 del 15 de abril de 2015 (ver anexo)	2015-04-28 00:00:00	2015-04-28 00:00:00	2	\N	
56	56	970678	Estudio de Ingeniería Geomática para el Proyecto Pistas, Plataformas, Calles de Rodaje y Edificios del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM), para Generar un modelo Digital de Terreno (MDT) a Través de la Tecnología HIGH Definition Surveying (HDS), Empleando Equipos GNSS, Escáner Láser y Ecosonda.	Estudio de Ingeniería Geomática para el Proyecto Pistas, Plataformas, Calles de Rodaje y Edificios del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM), para Generar un modelo Digital de Terreno (MDT) a Través de la Tecnología HIGH Definition Surveying (HDS), Empleando Equipos GNSS, Escáner Láser y Ecosonda.	complete	0	MXN	50000000.00	MXN	Licitación Pública	Artículos 27, fracción I, 30 fracción I, y 45 fracción I de la LOPSRM	Convocatoria para la Licitación Pública Nacional Presencial No. LO-009KDH999-E94-2015,para los trabajos relativos al Estudio de Ingeniería Geomática para el Proyecto Pistas, Plataformas, Calles de Rodaje y Edificios del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM), para Generar un modelo Digital de Terreno (MDT) a Través de la Tecnología HIGH Definition Surveying (HDS), Empleando Equipos GNSS, Escáner Láser y Ecosonda ., publicada en compranet el 17 de Diciembre de 2015.	Capítulo 2.13 y 2.14 de la convocatoria para la Licitación Pública Nacional Presencial No. LO-009KDH999-E94-2015, para los trabajos relativos al Estudio de Ingeniería Geomática para el Proyecto Pistas, Plataformas, Calles de Rodaje y Edificios del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM), para Generar un modelo Digital de Terreno (MDT) a Través de la Tecnología HIGH Definition Surveying (HDS), Empleando Equipos GNSS, Escáner Láser y Ecosonda ., publicada en compranet el 17 de Diciembre de 2015.	Presencial	El acto de presentación y apetura de proposiciones se llevó a cabo el 02 de Febrero de 2016, en la sala de juntas de la Gerencia de Concursos de la Subdirección de Contrataciones, ubicada en: Av. Insurgentes Sur 2453, segundo piso, Torre Murano, Col. Tizapán San Ánge, del. Álvaro Obregón, México, D. F., c. p. 01090.	2016-01-02 00:00:00	\N	2016-01-12 00:00:00	2016-01-22 00:00:00	1	Capítulo 2.10 y 2.11 de la Convocatoria para la Licitación Pública Nacional Presencial No. LO-009KDH999-E94-2015, para los trabajos relativos al Estudio de Ingeniería Geomática para el Proyecto Pistas, Plataformas, Calles de Rodaje y Edificios del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM), para Generar un modelo Digital de Terreno (MDT) a Través de la Tecnología HIGH Definition Surveying (HDS), Empleando Equipos GNSS, Escáner Láser y Ecosonda ., publicada en compranet el 17 de Diciembre de 2015.	2016-02-10 00:00:00	\N	7	\N	
61	61	-	Obras de Excavación de prueba, Losa experimental y prueba de Pilotes para el El Edificio Terminal y Torre de Control del NAICM	Obras de Excavación de prueba, Losa experimental y prueba de Pilotes para el El Edificio Terminal y Torre de Control del NAICM	none	0		0		Adjudicación Directa	En terminos de lo dispuesto en el articulo 134 de la constitucion Politica de los Estados Unidos Mexicanos, en relación a lo establecido por los articulos 27 fraccion III, 30 Fraccion I, 42 fracción VII, 45 fraccion I de la LOPSRM.			Presencial		\N	\N	\N	\N	0		\N	\N	1	\N	
91	91	938439	Desarrollo del Proyecto ejecutivo para el entronque de acceso de carga en la zona Norte del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	Desarrollo del Proyecto ejecutivo para el entronque de acceso de carga en la zona Norte del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	complete	0	MXN	9500000.00	MXN	Invitación a cuando menos tres personas	Artículo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas 	Apartado 2.1, 2.2 y 2.10 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N83-2015 del 3 de noviembre de 2015, relacionado con el “royecto ejecutivo para el entronque de acceso de carga en la zona Norte del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM) publicada en la página de CompraNet el 6 de noviembre de 2015.	Apartado 6.5 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N83-2015 del 3 de noviembre de 2015, relacionado con el “royecto ejecutivo para el entronque de acceso de carga en la zona Norte del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM) publicada en la página de CompraNet el 6 de noviembre de 2015.	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 18:00 horas del 17 de noviembre de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Gerente de concursos de la Subdirección de Contrataciones de GACM	2015-11-17 00:00:00	\N	2015-11-10 00:00:00	2015-11-11 00:00:00	1	Apartado 2.1, 2.2 y 2.10 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N34-2015 del 6 de noviembre de 2015 (ver anexo)	2015-11-19 00:00:00	\N	4	\N	
80	80	799531	Servicios profesionales de consultoría, legales y/o normativos y acompañamiento en los procedimientos de contratación pública y elaboración del expediente concentrador integral del (NAICM)	Servicios profesionales de consultoría, legales y/o normativos y acompañamiento en los procedimientos de contratación pública y elaboración de la memoria documental integral del desarrollo del  Nuevo Aeropuerto Internacional de la Ciudad de México	complete	0		20360000	MXN	Invitación a cuando menos tres personas	Artículo 41, fracción X de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público.	Apartado 2.1, 2.2 y 2.10 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N34-2015 del 7 de mayo de 2015, relacionado con el “Proyecto Ejecutivo para la Construcción del Camino Perimetral y sus Instalaciones Complementarias en el lado Norte del Polígono de NAICM, es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 8 de mayo de 2015	Apartado 2.1 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número  IA-009KDH999-N31-2015 del 15 de abril de 2015, relacionado con los “Servicios profesionales de consultoría, legales y/o normativos y acompañamiento en los procedimientos de contratación pública y elaboración de la memoria documental integral del desarrollo del  Nuevo Aeropuerto Internacional de la Ciudad de México", es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 6 de mayo de 2015, y anexo 1	transferencia		\N	\N	2015-04-28 00:00:00	2015-04-28 00:00:00	1	Apartado 6. de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IA-009KDH999-N31-2015 del 15 de abril de 2015 (ver anexo)	\N	\N	3	\N	
62	62	-	Instalación de equipo de Medición de Energía  Eléctrica en las Puertas 7 y 8 del Nuevo aeropuerto Internacional de la Ciudad de México (NAICM)	Instalación de equipo de Medición de Energía  Eléctrica en las Puertas 7 y 8 del Nuevo aeropuerto Internacional de la Ciudad de México (NAICM)	active	0		67996.00	MXN	Adjudicación Directa	Lo dispuesto a los articulos 134 de la Constitución Politica de Los estados Unidos Mexicanos, asi como en los dispuesto en el articulo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas.			Presencial		\N	\N	\N	\N	0		\N	\N	1	\N	
48	48	993709	Estudios del Sistema de Drenaje Pluvial del Nuevo Aeropuerto Internacional de la Ciudad de México.	Estudios del Sistema de Drenaje Pluvial del Nuevo Aeropuerto Internacional de la Ciudad de México.	complete	0	MXN	21750000	MXN	Adjudicación Directa	Artículos 27 fracción III, 41, 42 fracción X de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.					\N	\N	\N	\N	0		\N	\N	1	\N	
49	49	1043951	Proyecto Ejecutivo para el Alumbrado Público de la Barda Perimetral del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	Proyecto Ejecutivo para el Alumbrado Público de la Barda Perimetral del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	complete	0	MXN	720001.00	MXN	Adjudicación Directa	Artículos 27 fracción III, 30 fracción I, 43 y 45 fracción I de la LOPSRM.					\N	\N	\N	\N	0		\N	\N	1	\N	
95	95	1029560	Servicio de Transporte de personas en autobuses y de traslado de maquinaria y equipo en camionetas de redilas para el programa de empleo temporal.	Servicio de Transporte de personas en autobuses y de traslado de maquinaria y equipo en camionetas de redilas para el programa de empleo temporal.	complete	0	MXN	12500000.00	MXN	Licitación Pública	Articulos 25, 26, fracciión I, 26 Bis, fraección I, 28, fracción I,29, 36, 36 bis, 37, 46 y 47 de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público, y 35 y 39 de su Reglamento.	Capitulo 2 -De la Licitación Pública Nacional No. LA-009KDH999-E29-2016, de fecha 07 de Abril de 2016, aplicando el mecanismo de evaluación binario. Las bases se publicaron en CompraNet el día 07 de abril de 2016.	Capitulo 6 -Anexos a esta Convocatoria, Numeral 6.4 Términos de referencia, de la Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-E29-2015, de fecha 07 de abril de  2016 y que se publicó en CompraNet el día 07 de abril de 2016.	Presencial	El día 22 de abril de 2016 y de conformidad con el numeral 1.4.3.1 del Manual de Organización de la empresa de participación estatal mayoritaria,, yel numeral 5.1 de sus Pobalines, el Gerente de Concursos de GACM, presidió el acto de presentación y apertura de proposiciones, de las cuales, sólo 1 es consorcio. De acuerdo con el artículo 35, fracción II de la LAASSP , se reciben las proposiciones para su evaluación cualitativa y de acuerdo a ello se convoca para el día 25 de abril de 2016, para conocer el fallo correspondiente.	2016-04-22 00:00:00	\N	2016-04-15 00:00:00	2016-04-15 00:00:00	1	Capitulo 4.-De la Licitación Pública Nacional No. LA-009KDH999-E29-2016,	2016-04-25 00:00:00	\N	3	\N	
76	76	-	Servicios de diseño y arquitectura consistentes en forma enunciativa mas no limitativa, en la elaboración de los proyectos ejecutivos (diseño arquitectónico e ingeniería de detalle), que permitan la construcción del "edificio terminal de pasajeros, vialidades de acceso y estacionamientos" y "torre de control y centros de control de operaciones" del "NAICM" así como el acompañamiento arquitectónico.	Servicios de diseño y arquitectura consistentes en forma enunciativa mas no limitativa, en la elaboración de los proyectos ejecutivos (diseño arquitectónico e ingeniería de detalle), que permitan la construcción del "edificio terminal de pasajeros, vialidades de acceso y estacionamientos" y "torre de control y centros de control de operaciones" del "NAICM" así como el acompañamiento arquitectónico.	complete	0		2136433615	MXN	Adjudicación Directa	Artículo 42 fracción IV de la LOPSRM	Nacional	Presencial	transferencia		\N	\N	\N	\N	0		\N	\N	1	\N	
54	54	1081482	Servicio para diseñar la pagina WEB del Grupo Aeroportuario de la Ciudad de México (GACM) para el Proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México	Servicio para diseñar la pagina WEB del Grupo Aeroportuario de la Ciudad de México (GACM) para el Proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México	complete	0	MXN	240120.00	MXN	Adjudicación Directa	Artículo 42 de la Ley  de Adquisisciones, Arrendamientos y Servicios del Sector Público.					\N	\N	\N	\N	0		\N	\N	1	\N	
51	51	1008381	Proyecto ejecutivo para la construcción de carriles de desaceleración, plataformas de almacenamiento y carriles de aceleración en las puertas 7, y 9 de acceso al polígono del NAICM.	Proyecto ejecutivo para la construcción de carriles de desaceleración, plataformas de almacenamiento y carriles de aceleración en las puertas 7, y 9 de acceso al polígono del NAICM.	complete	0	MXN	690000.00	MXN	Adjudicación Directa	Artículo 41 y 42, fracción X de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.					\N	\N	\N	\N	0		\N	\N	1	\N	
52	52	1044509	Servicio de Testigo Social para que Atestigüe la Etapas del Procedimiento de la Licitación Pública Nacional de Obra Pública de Carga, Acarreo y Descarga Dentro y Fuera del Polígono del Material Existente, Producto de Depósitos de Demoliciones y Desazolve, Incluye Conformación del Terreno donde se Construirá el Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM) para el NAICM	Servicio de Testigo Social para que Atestigüe la Etapas del Procedimiento de la Licitación Pública Nacional de Obra Pública de Carga, Acarreo y Descarga Dentro y Fuera del Polígono del Material Existente, Producto de Depósitos de Demoliciones y Desazolve, Incluye Conformación del Terreno donde se Construirá el Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM) para el NAICM	complete	0	MXN	390000.00	MXN	Adjudicación Directa	Artículo 47 fracción I, de la LAASSP.					\N	\N	\N	\N	0		\N	\N	1	\N	
88	88	-	Proyecto de Salvamento Arqueológico en el interior del Lago de Taxcoco en su zona oriente, Estado de México. (Supervisión, Vigilancia y Excavaciones 2016), en Adelante los SERVICIOS, mismos que serán realizados totalmente a satisfacción del GACM	Proyecto de Salvamento Arqueológico en el interior del Lago de Taxcoco en su zona oriente, Estado de México. (Supervisión, Vigilancia y Excavaciones 2016), en Adelante los SERVICIOS, mismos que serán realizados totalmente a satisfacción del GACM	complete	0	MXN	10163709.00	MXN	Adjudicación Directa	Artículo 1 de la LOPSRM					\N	\N	\N	\N	0		\N	\N	1	\N	
89	89	-	Estalecer las bases generales a que se sujetaran GACM y la UANL así como, pactos comunes y el objeto genperico de futuros servicios de acaácter científico y tecnologico u otro tipo que acuerden las mismas	Estalecer las bases generales a que se sujetaran GACM y la UANL así como, pactos comunes y el objeto genperico de futuros servicios de acaácter científico y tecnologico u otro tipo que acuerden las mismas	complete	0	MXN	0	MXN	Adjudicación Directa	Artículo 1 de la LOPSRM					\N	\N	\N	\N	0		\N	\N	1	\N	
98	98	1	Establecer los mecanismos de colaboración entre Grupo Aeroportuario de la Ciudad de México y el Instituto Mexicano de Administarción Pública A.C. para llevar a cabo, mediante la suscripción del instrumento correspondiente el desarrollo y ejecución de las actividades de los programas y proyectos que el GACM requeira a traves de la prestación de servicios relativos a als especialidades y disciplinas especificas, el INAP este en posibilidades de aportar.	Establecer los mecanismos de colaboración entre Grupo Aeroportuario de la Ciudad de México y el Instituto Mexicano de Administarción Pública A.C. para llevar a cabo, mediante la suscripción del instrumento correspondiente el desarrollo y ejecución de las actividades de los programas y proyectos que el GACM requeira a traves de la prestación de servicios relativos a als especialidades y disciplinas especificas, el INAP este en posibilidades de aportar.	active	0		0		Adjudicación Directa	Artículo 1 de la LAASSP	Artículo 1 de la LAASSP		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
99	99	749472	Prestación de los Servicios de Auditoría Externa que se realizarán sobre los estados financieros de la entidad con cifras al 31 de diciembre de 2014. 	Prestación de los Servicios de Auditoría Externa que se realizarán sobre los estados financieros de la entidad con cifras al 31 de diciembre de 2014. 	active	0		46371.00	MNX	Adjudicación Directa	Artículo 41 fracción I de la Ley  de Adquisicioens, Arrendamientos y Servicios del sector Público.	Artículo 41 fracción I de la Ley  de Adquisicioens, Arrendamientos y Servicios del sector Público.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
90	90	AA-009KDH999-E19-2016	Servicios Especializados en el suministro de personal técnico y administrativo para proyectos de infraestructura aeroportuaria	Contratacion de Personal tercerizado	complete	0	MXN	726064480.49	MXN	Adjudicación Directa	Artículos 41 Fracción III, de la LAASSP y 72 fracción III de su reglamento.					\N	\N	\N	\N	0		\N	\N	1	\N	
100	100	1	Los servicios de protección, custodia, vigilancia y seguridad de sus bienes e intalaciones, así como el diseño e implementación de sistemas de seguridad y su supervisión permanente 	Los servicios de protección, custodia, vigilancia y seguridad de sus bienes e intalaciones, así como el diseño e implementación de sistemas de seguridad y su supervisión permanente 	active	110505537.00	MNX	0	MNX	Adjudicación Directa	Artículo 1 de la LAASSP y LOPSRM	Artículo 1 de la LAASSP y LOPSRM		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
101	101	1	Etapa 2; seguimiento para el cumplimiento ambiental del proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM) a través de la entidad de supervisión ambiental (Condicionante 10, resolutivo MIA-R	Etapa 2; seguimiento para el cumplimiento ambiental del proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM) a través de la entidad de supervisión ambiental (Condicionante 10, resolutivo MIA-R	active	0		227520000.00	MNX	Adjudicación Directa	Artículo 1 de la LAASSP	Artículo 1 de la LAASSP		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
94	94	-	Los servicios de protección, custodia, vigilancia y seguridad en los bienes e intalaciones de GACM.	Los servicios de protección, custodia, vigilancia y seguridad en los bienes e intalaciones de GACM.	complete	1048586.00	MXN	14925328.00	MXN	Adjudicación Directa	Artículo 1 de la LAASSP 			Presencial		\N	\N	\N	\N	0		\N	\N	1	\N	
103	103	1	Servicios especializados en el suministro de personal tercerizados.	Servicios especializados en el suministro de personal tercerizados.	active	0		129391633.00	MNX	Adjudicación Directa	Artículos 41 Fracción III, 43 último párrafo y 47 de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público	Artículos 41 Fracción III, 43 último párrafo y 47 de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
104	104	SA-009KDH-N62/2015	Servicio Integral de Reservación, Expedición y Entrega de Pasajes Aéreos para el personal GACM	Servicios integrales de reservación, expedición de boletos de avión con cobertura en el territorio Nacional e Internacional y otros servicios del ramo para el GACM	active	3050000.00	MNX	6583333.33	MNX	Adjudicación Directa	Artículo 41, fracción III, de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público	Artículo 41, fracción III, de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
106	106	798985	Prestacion de los servicos consistentes en la elaboración de estudios de geotécnia, topografia,  gedésia  y levantamiento de información geografica através de un vuelo con tecnología Lidar.	Prestacion de los servicos consistentes en la elaboración de estudios de geotécnia, topografia,  gedésia  y levantamiento de información geografica através de un vuelo con tecnología Lidar.	active	0		70000000	MXN	Adjudicación Directa	Artículo 134 de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.	Artículo 134 de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
107	107	798942	Programa de Rescate de Fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México.	Programa de Rescate de Fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México.	active	0		8530640.00	MXN	Adjudicación Directa	Artículo 43 de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.	Artículo 43 de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
10	9	830617	Implementación del plan de restauración ecológica para el Nuevo Aeropuerto Internacional de la Ciudad de México.	Implementación del plan de restauración ecológica para el Nuevo Aeropuerto Internacional de la Ciudad de México.	complete	0		26000000	MXN	Licitación Pública	Artículos 27, fracción I, 30, fracción I, 36, 37, 38, 39 y 45, fracción I, de la Ley de Obras Públicas y Servicios Relaciondos con las Mismas	Capitulo 2-Licitación Pública Nacional (numerales 2.13 y 2.14) de la Convocatoria a la Licitación Pública Nacional No. LO-009KDH999-N45-2015, para llevar a cabo los trabajos de “Implementación del plan de restauración ecológica para el Nuevo Aeropuerto Internacional de la Ciudad de México”, aplicando el mecanismo de evaluación de puntos y porcentajes, publicada en compraNet el día 12 de junio del 2015.		Presencial		2015-06-26 00:00:00	\N	2015-06-19 00:00:00	2015-06-19 00:00:00	1	Capitulo 2-Licitación Pública Nacional de la Convocatoria a la Licitación Pública Nacional No. LO-009KDH999-N45-2015, para llevar a cabo los trabajos de “Implementación del plan de restauración ecológica para el Nuevo Aeropuerto Internacional de la Ciudad de México”, aplicando el mecanismo de evaluación de puntos y porcentajes, publicada en compraNet el día 12 de junio del 2015.	\N	\N	4	\N	
21	21	910393	Carga, acarreo y descarga fuera del polígono del material existente producto de depósitos de demoliciones, desperdicios y desazolve.	Carga, acarreo y descarga fuera del polígono del material existente producto de depósitos de demoliciones, desperdicios y desazolve.	complete	0		770000000	MXN	Licitación Pública	Articulos 27, fracción I, 30, fracción I, y 45, fracción I, de la Ley de Obras Públicas y Servcios Relacionados con las Mismas.  	Capitulo 2-De la licitación (numeral 2.14) de la Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N78-2015, de fecha 24 de septiembre de 2015. Las bases se publicaron en CompraNet el día 29 de septiembre del 2015.		Presencial		2015-11-09 00:00:00	\N	2015-10-07 00:00:00	2015-10-27 00:00:00	1	Capitulo 2-De la licitación de la Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N78-2015, de fecha 24 de septiembre de 2015. Las bases se publicaron en CompraNet el día 29 de septiembre del 2015.	\N	\N	40	\N	
9	10	830152	Plan de Monitoreo y Conservación de Aves del Proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México	Plan de Monitoreo y Conservación de Aves del Proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México	complete	0		29000000.00	MXN	Licitación Pública	Artículo 27, segundo párrafo de la Ley de Obras Públicas y Servicios Relacionados con las Mismas	Puntos y porcentajes	Capítulo 2.13 de la Convocatoria a la Licitación Pública Nacional No. LO-009KDH999-N46-2015 para los trabajos de Plan de monitoreo y conservación de aves del Nuevo Aeropuerto Internacional de la Ciudad de México publicada en CompraNet el 12 de junio de 2015	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 12:00 horas del 29 de junio de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Ángel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Gerente de Concursos de GACM.  Se rubricaron los documentos técnicos T.2, T.3 y T.4 así como la documentación económica E-10 correspondiente a las 3 proposiciones presentadas.	2015-06-09 00:00:00	\N	2015-06-19 00:00:00	2015-06-19 00:00:00	1		\N	\N	3	\N	
13	13	842194	Diseñar e instrumentar el modelo virtual de información para la construcción (BIM) del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	Diseñar e instrumentar el modelo virtual de información para la construcción (BIM) del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	complete	0		121700000	MXN	Licitación Pública	Articulos 27 fracción I, 30 fracción II y 45 fracción I de la LOPSRM.			Presencial	El acta de presentación y apertura de las propuestas se llevó a cabo el 14 de agosto de 2015 a las 12:00, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Subdirector de Contrataciones de GACM. 	2015-08-14 00:00:00	\N	2015-07-23 00:00:00	2015-07-28 00:00:00	1		2015-07-01 00:00:00	\N	5	\N	
23	23	911935	Construcción de los caminos provisionales de acceso al Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM) ejecutando trabajos de terracería, estructuras y obrad de drenaje, pavimentación y señalamiento.	Construcción de los caminos provisionales de acceso al Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM) ejecutando trabajos de terracería, estructuras y obrad de drenaje, pavimentación y señalamiento.	complete	0		1203803000.00	MXN	Licitación Pública	Articulos 27, fracción I, 30, fracción I, y 45, fracción I, de la Ley de Obras Públicas y Servcios Relacionados con las Mismas. 	Puntos y porcentajes	Capitulo 2-De la Licitación (numeral 2.14) de la Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N80-2015 de fecha 29 de septiembre de 2015.	Presencial		2015-11-13 00:00:00	\N	2015-10-09 00:00:00	2015-11-05 00:00:00	1	Capitulo 2-De la Licitación de la Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N80-2015 de fecha 29 de septiembre de 2015.	\N	\N	48	\N	
25	25	781926	Estudio mediante el cual se definan las características técnicas de infraestructura y diseño esquemático de la terminal de carga del Nuevo Aeropuerto Internacional de la Ciudad de México.	Estudio mediante el cual se definan las características técnicas de infraestructura y diseño esquemático de la terminal de carga del Nuevo Aeropuerto Internacional de la Ciudad de México.	complete	0		16000000	MXN	Licitación Pública	Artículos 27 fracción I, 30 fracción II, y 45 fracción II de la LOPSRM.	Ponderación de puntos (Puntos y porcentajes)	Capítulos 2.13 y 2.14 de la Convocatoria de licitación pública internacional presencial, bajo la cobertura de tratados identificada con el número LO-009KDH999-T15-2015, para llevar a cabo el “Estudio mediante el cual se definan las características técnicas de infraestructura y diseño esquemático de la terminal de carga del Nuevo Aeropuerto Internacional de la Ciudad de México”, publicada en compraNet el día 25 de marzo del 2015.	Presencial		2015-04-30 00:00:00	\N	2015-04-08 00:00:00	2015-04-08 00:00:00	1	Capítulos 2.10 y 2.11 de la Convocatoria de licitación pública internacional presencial, bajo la cobertura de tratados identificada con el número LO-009KDH999-T15-2015, para llevar a cabo el “Estudio mediante el cual se definan las características técnicas de infraestructura y diseño esquemático de la terminal de carga del Nuevo Aeropuerto Internacional de la Ciudad de México”, publicada en compraNet el día 25 de marzo del 2015.	\N	\N	3	\N	
24	24	790388	Construcción de accesos y plataformas para exploración geotécnica para la pista número 2 del Nuevo Aeropuerto Internacional de la Ciudad de México.	Construcción de accesos y plataformas para exploración geotécnica para la pista número 2 del Nuevo Aeropuerto Internacional de la Ciudad de México.	complete	0		10400000.00	MXN	Licitación Pública	Artículos 27, fracción I, 30 fracción I, 38 y 45 fracción I de la LOPSRM y 63 fracción I del RLOPSRM.	Binario	Capítulos 2.13 y 2.14 de la Convocatoria para la Licitación Pública Nacional Presencial No. No.  LO-009KDH999-N20-2015, aplicando el mecanismo binario para la Construcción de accesos y plataformas para exploración geotécnica para la pista No. 2 del Nuevo Aeropuerto Internacional de la Ciudad de México	Presencial		\N	\N	\N	\N	1	Capítulos 2.10 y 2.11 de la Convocatoria para la Licitación Pública Nacional Presencial No. No.  LO-009KDH999-N20-2015, aplicando el mecanismo binario para la Construcción de accesos y plataformas para exploración geotécnica para la pista No. 2 del Nuevo Aeropuerto Internacional de la Ciudad de México	\N	\N	12	\N	
1	1	717913	Extracción de ademes y restitución del terreno que ocupan dichos elementos ubicados en la poligonal para el Nuevo Aeropuerto Internacional de la Cuidad de México.	Extracción de ademes y restitución del terreno que ocupan dichos elementos ubicados en la poligonal para el Nuevo Aeropuerto Internacional de la Cuidad de México.	complete	0		54520000.00	MXN	Licitación Pública	Artículos 27, fracción I, 30 fracción I, 38 y 45 fracción I de la LOPSRM; y 63 fracción I, del ROPSRM	Capítulo 2.13 y 2.14 de la Convocatoria para la Licitación Pública Nacional Presencial No. LO-009KDH999-N5-2014, para los trabajos relativos a la Extracción de ademes y restitución del terreno que ocupan dichos elementos ubicados en la poligonal para el Nuevo Aeropuerto Internacional de la Cuidad de México	Capítulo 2.10 y 2.11 de la Convocatoria para la Licitación Pública Nacional Presencial No. LO-009KDH999-N5-2014, para los trabajos relativos a la Extracción de ademes y restitución del terreno que ocupan dichos elementos ubicados en la poligonal para el Nuevo Aeropuerto Internacional de la Cuidad de México	Presencial	El acto de presentación y apetura de proposiciones se llevó a cabo el 15 de diciembre de 2014, en la sala de juntas de la Gerencia de Concursos de la Subdirección de Contrataciones, ubicada en: Av. Insurgentes Sur 2453, segundo piso, Torre Murano, Col. Tizapán San Ángel, del. Álvaro Obregón, México, D. F., c. p. 01090.	2014-12-15 00:00:00	\N	2014-12-03 00:00:00	2014-12-05 00:00:00	1	Capítulo 2.10 y 2.11 de la Convocatoria para la Licitación Pública Nacional Presencial No. LO-009KDH999-N5-2014, para los trabajos relativos a la Extracción de ademes y restitución del terreno que ocupan dichos elementos ubicados en la poligonal para el Nuevo Aeropuerto Internacional de la Cuidad de México	\N	\N	8	\N	
8	8	830658	Desarrollo del proyecto ejecutivo, construcción, equipamiento de mobiliario en instalaciones complementarias para el campamento del Grupo Aeroportuario   de la Ciudad de México en el sitio del Nuevo Aeropuerto Internacional de la Ciudad de México.	Desarrollo del proyecto ejecutivo, construcción, equipamiento de mobiliario en instalaciones complementarias para el campamento del Grupo Aeroportuario   de la Ciudad de México en el sitio del Nuevo Aeropuerto Internacional de la   Ciudad de México.	active	0		150000000	MXN	Licitación Pública	Artículo 27, segundo párrafo de la Ley de Obras Públicas y Servicios Relaciondos con las Mismas	bestProposal	Capítulo VII de la Convocatoria (ver anexo)	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 11:00 horas del 27 de julio de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Subdirector de Contrataciones de GACM.  Los documentos técnicos T.3, así como la documentación económica E-4, E-5, E-6, E-7, E-8, E-9, E-10, E-11, E-12, E-13, E-14 y E-15, correspondiente a las 17 proposiciones presentadas.	2015-07-27 00:00:00	\N	2015-07-10 00:00:00	2015-07-27 00:00:00	1	Capítulo VI de la Convocatoria (ver anexo)	\N	\N	17	\N	
11	11	824118	Implementación del Programa de Rescate de Flora y Fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México	Implementación del Programa de Rescate de Flora y Fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México	complete	0		12300000.00	MXN	Licitación Pública	Artículo 27, segundo párrafo de la Ley de Obras Públicas y Servicios Relacionados con las Mismas	Mecanismo binario	Capítulo 2.13 de la Convocatoria a la Licitación Pública Nacional No. LO-009KDH999-N42-2015 para la Implementación del Programa de Rescate de Flora y Fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México(ver anexo)	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 14:00 horas del 29 de junio de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Gerente de Concursos de GACM.  Se rubricaron los documentos técnicos T.2, T.3 y T.4 así como la documentación económica E-10 correspondiente a las 4 proposiciones presentadas.	2015-06-29 00:00:00	\N	2015-06-18 00:00:00	2015-06-18 00:00:00	1	Convocatoria a la Licitación Pública Nacional No. LO-009KDH999-N42-2015 para la Implementación del Programa de Rescate de Flora y Fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México publicada en CompraNet el 12 de junio de 2015	2015-07-03 00:00:00	\N	4	\N	
15	15	943228	Supervisión Técnica, Administrativa y de Control de calidad para los trabajos de nivelación y limpieza del terreno del Nuevo aeropuerto internacional de la Ciudad de México.	Supervisión Técnica, Administrativa y de Control de calidad para los trabajos de nivelación y limpieza del terreno del Nuevo aeropuerto internacional de la Ciudad de México.	complete	0		17000000	MXN	Licitación Pública	Articulos 27, fracción I, 30, fracción I, y 45, fracción I, de la Ley de Obras Públicas y Servcios Relacionados con las Mismas.  	Binario	Capitulo 2-De la licitación pública (numeral 2.14) de la Convocatoria de la Licitación Pública de carácter nacional No. LO-009KDH999-N86-2015. Fecha de publicación de convocatoria en CompraNet  y envio al DOf el 13 de noviembre de 2015. 	Presencial	Acta de presentación y apertura de proposiciones del 7 de diciembre de 2015, en el presente acto 25 licitantes presentaron sus proposiciones de las cuales se dio lectura al importe total de cada una de las mismas, indicandose que el fallo correspondiente se emitira el 15 de diciembre de 2015. 	\N	2016-06-18 00:00:00	2015-11-26 00:00:00	2015-11-27 00:00:00	1	Capitulo 2-De la licitación pública de la Convocatoria de la Licitación Pública de carácter nacional No. LO-009KDH999-N86-2015. Fecha de publicación de convocatoria en CompraNet  y envio al DOf el 13 de noviembre de 2015. 	2015-12-11 00:00:00	\N	25	\N	
16	16	943233	Supervisión Técnica, Administrativa y de Control de calidad para los Trabajos de Construcción de los Caminos Provisionales de Acceso al Nuevo Aeropuerto Internacional de la Ciudad de México.	Supervisión Técnica, Administrativa y de Control de calidad para los Trabajos de Construcción de los Caminos Provisionales de Acceso al Nuevo Aeropuerto Internacional de la Ciudad de México.	complete	0		20000000	MXN	Licitación Pública	Articulos 27, fracción I, 30, fracción I, y 45, fracción I, de la Ley de Obras Públicas y Servcios Relacionados con las Mismas. 	Binario	Capitulo 2- De la licitación pública (numeral 2.14) de la Convocatoria de la Licitación Pública de Carácter Nacional No. LO-009KDH999-N87-2015, la fecha de publicación de la convocatoria en compranet y envio al DOF es el 12 de noviembre de 2015. 	Presencial	Acta de presentación y apertura de proposiciones del 10 de diciembre de 2015, los licitantes que presentaron sus proposiciones en este acto son un total de 24 empresas y/o consorcios, se dio lectura al importe total de las proposiciones. El fallo correspondiente será dado a conocer el 18 de diciembre de 2015. 	2015-12-10 00:00:00	\N	2015-11-27 00:00:00	2015-12-02 00:00:00	1	Capitulo 2- De la licitación pública de la Convocatoria de la Licitación Pública de Carácter Nacional No. LO-009KDH999-N87-2015, la fecha de publicación de la convocatoria en compranet y envio al DOF es el 12 de noviembre de 2015. 	2015-12-16 00:00:00	\N	24	\N	
83	83	843692	Servicios relacionados con el programa de empleo temporal (pet) correspondiente a las acciones preparatorias para la construcción del nuevo aeropuerto internacional de la Ciudad de México (servicio de traslado de personas, en vehìculos ligeros) 	Servicios relacionados con el programa de empleo temporal (pet) correspondiente a las acciones preparatorias para la construcción del nuevo aeropuerto internacional de la Ciudad de México (servicio de traslado de personas, en vehìculos ligeros) 	complete	0		8500000	MXN	Invitación a cuando menos tres personas	Artículo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas 	Apartado 4.1 y 4.2 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N53-2015 del 01 de julioi de 2015, Servicios relacionados con el programa de empleo temporal (pet) correspondiente a las acciones preparatorias para la construcción del nuevo aeropuerto internacional de la Ciudad de México (servicio de traslado de personas, en vehìculos ligeros) publicada en la página de CompraNet el 01 julio 2015	Apartado 2.1 (Anexo 1) de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N53-2015 del 01 de julioi de 2015, Servicios relacionados con el programa de empleo temporal (pet) correspondiente a las acciones preparatorias para la construcción del nuevo aeropuerto internacional de la Ciudad de México (servicio de traslado de personas, en vehìculos ligeros) publicada en la página de CompraNet el 01 julio 2015	transferencia		\N	\N	2015-07-02 00:00:00	2015-07-02 00:00:00	1	Apartado 4.1 y 4.2  de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N53-2015 del 01 de julio de 2015 (ver anexo) 	\N	\N	3	\N	
34	34	824149 	Elaboración del proyecto de terracerías de los caminos provisionales para la construcción del Nuevo Aeropuerto Internacional de la Ciudad de México	Elaboración del proyecto de terracerías de los caminos provisionales para la construcción del Nuevo Aeropuerto Internacional de la Ciudad de México	complete	0	MXN	8200000.00	MXN	Invitación a cuando menos tres personas	Artículos 42 fracción XI y 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas.	Apartado 2.10 y 2.11 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N43-2015 del 6 de mayo de 2015, relacionado con el “Elaboración del pryecto de terracerías de los caminos provisionales para la construcción del Nuevo Aeropuerto Internacional de la Ciudad de México, es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 28 de mayo de 2015.	Apartado 2.11 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N43-2015 del 6 de mayo de 2015, relacionado con el “Elaboración del pryecto de terracerías de los caminos provisionales para la construcción del Nuevo Aeropuerto Internacional de la Ciudad de México, es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 28 de mayo de 2015. 	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 10:00 horas del 08 de junio de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Gerente de concursos de la Subdirección de Contrataciones de GACM	2015-06-08 00:00:00	\N	2015-06-04 00:00:00	2015-06-04 00:00:00	1	Apartado 2.10 y 2.11 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N43-2015 del 6 de mayo de 2015, relacionado con el “Elaboración del pryecto de terracerías de los caminos provisionales para la construcción del Nuevo Aeropuerto Internacional de la Ciudad de México, es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 28 de mayo de 2015. 	2015-06-16 00:00:00	\N	5	\N	
53	53	971447	Servicios de Asesoria en Materia Fiscal para la Recuperacion de Saldos a favor de IVA e ISR, así mismo Asesoria Respecto al Cumplimiento de Tratados Internacionales para evitar la Doble Tributación	Servicios de Asesoria en Materia Fiscal para la Recuperacion de Saldos a favor de IVA e ISR, así mismo Asesoria Respecto al Cumplimiento de Tratados Internacionales para evitar la Doble Tributación	complete	0	MXN	21848600.00	MXN	Invitación a cuando menos tres personas	Artículo 43 de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.	Invitación Nacional a Cuando Menos Tres Personas No. IA-009KDH99-E95-2015 relativa al servicio: Servicios de Asesoria en Materia Fiscal; para la recuperación de Saldos a Favor de IVA e ISR, así mismo Asesoria respecto al Cumplimiento de Tratados Internacionales para evitar Doble Tributación. publicada en CompraNet el 11 de enero de 2016	Invitación Nacional a Cuando Menos Tres Personas No. IA-009KDH99-E95-2015 relativa al servicio: Servicios de Asesoria en Materia Fiscal; para la recuperación de Saldos a Favor de IVA e ISR, así mismo Asesoria respecto al Cumplimiento de Tratados Internacionales para evitar Doble Tributación. publicada en CompraNet el 11 de enero de 2016	Presencial	"El acto de presentación y apertura de proposiciones se llevó a cabo a las 17:00 horas del 21 de enero de 2016, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Ángel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Gerente de Concursos de GACM.  "	2016-01-28 00:00:00	\N	2016-01-14 00:00:00	2016-01-14 00:00:00	1	Capítulo 2.10 y 2.11 de la  Invitación Nacional a Cuando Menos Tres Personas No. IA-009KDH999-E95-2015 relativa a los Servicios de Asesoria en Materia Fiscal para la Recuperacion de Saldos a favor de IVA e ISR, así mismo Asesoria Respecto al Cumplimiento de Tratados Internacionales para evitar la Doble Tributación.  (ver anexo)	2016-01-21 00:00:00	\N	3	\N	
36	36	900950	Control, Prevención e identificación de plagas en el Polígono del NAICM	Control, Prevención e identificación de plagas en el Polígono del NAICM	complete	0	MXN	1750000.00	MXN	Invitación a cuando menos tres personas	Artículo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas 	Apartado 2.10, 2.11 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N75-2015 del 15 de septiembre de 2015, relacionado con el “Control, Prevención e Identificación de plagas en el Polígono de NAICM, es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 17 de septiembre de 2015.	Apartado 6.5 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N75-2015 del 15 de septiembre de 2015, relacionado con el “Control, Prevención e Identificación de plagas en el Polígono de NAICM, es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 17 de septiembre de 2015, y Términos de referencia	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 18:00 horas del 21 de septiembre de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Gerente de concursos de la Subdirección de Contrataciones de GACM	2015-09-24 00:00:00	\N	2015-09-21 00:00:00	2015-09-21 00:00:00	1	Apartado 2.13 y 2.14 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N75-2015 del 15 de septiembre de 2015 (ver anexo) 	2015-09-25 00:00:00	\N	2	\N	
92	92	IO-009KDH999-N14-2015	Servicio integral de administración de personal y proceso de nomina, mediante un sistema especializado para recursos humanos y de nómina de gobierno	Obtener un Servicio integral de administración de personal y proceso de nomina, mediante un sistema especializado para recursos humanos y de nómina de gobierno	complete	0	MXN	1802640.00	MXN	Invitación a cuando menos tres personas	En cumplimiento a lo dispuesto en por los artículos 126 y 134  de la Constitución Política de los Estados Unidos Mexicanos, asi como por los artículos 25 primer párrafo, 26 fracción II, , 26 bis fracción II, 27, 28 fracción I, 29 y 43 y demas disposiciones aplicables a las que establece la ley (LAASSP), asi como lo establecido en el Reglamento de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público.					\N	\N	\N	\N	0		\N	\N	3	\N	
102	102	799505	Servicios de Consultoría Técnica Especializada en Revisión e Integración de Términos de Referencia y Especificaciones Técnicas, de Proyectos de Licitación de Obras Públicas	Servicios de Consultoría Técnica Especializada en Revisión e Integración de Términos de Referencia y Especificaciones Técnicas, de Proyectos de Licitación de Obras Públicas	active	0		14655172	MNX	Invitación a cuando menos tres personas	Artículo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas 	Artículo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas 	"Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N29-2015 del 20 de abril de 2015, relacionado con los Servicios de Consultoría Técnica Especializada en Revisión e Integración de Términos de Referencia y Especificaciones Técnicas, de Proyectos de Licitación de Obras Públicas, es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 20 de abril de 2015. "	Nacional	El acto de presentación y apertura de proposiciones se llevó a cabo a las 18:00 horas del 04 de mayo de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Gerente de concursos de la Subdirección de Contrataciones de GACM	\N	\N	2015-04-23 00:00:00	2015-04-23 00:00:00	0	Apartado 2.1, 2.2 y 2.10 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N29-2015 del 20 de abril de 2015 (ver anexo) 	\N	\N	2	\N	
109	109	762007	Construcción de Caminos de Acceso a la Zona del Edificio Terminal de la Primera Etapa, necesarios para la caracterización Geotécnica Inicial	Construcción de Caminos de Acceso a la Zona del Edificio Terminal de la Primera Etapa, necesarios para la caracterización Geotécnica Inicial	active	0		9500000.00	MXN	Invitación a cuando menos tres personas	Artículo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas 	Artículo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas 		Nacional		\N	\N	2015-02-18 00:00:00	2015-02-18 00:00:00	0	Apartado 2.13 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número  IO-009KDH999-N11-2015 del 12 de febrero de 2015, relacionado con el “Construcción de Caminos de Acceso a la Zona del Edificio Terminal de la Primera Etapa, necesarios para la caracterización Geotécnica Inicial", es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 12 de febrero de 2015.	2015-03-04 00:00:00	\N	3	\N	
81	81	703275	Desarrollo del proyecto ejecutivo de pistas, rodajes y plataformas y ayudas a la navegación y otras instalaciones del NAICM	Elaboración del proyecto ejecutivo (ingenierías) para el diseño de la parte "Aeronáutica" (área de movimiento) de pistas, calles de rodaje, plataformas, áreas para el mantenimiento de aeronaves, servicio de combustibles de aviación, restricción y eliminación de obstáculos, servicio de salvamento y extinción de incendios (SSEI), ayudas visuales para la navegación, ayudas visuales indicadoras de obstáculos, ayudas visuales indicadoras de zonas de uso restringido, sistemas eléctricos de ayudas visuales para la navegación, mantenimiento de aeródromo, huella de ruido, agua potable y drenaje, programa de mantenimiento, sistemas de transporte de la información, acompañamiento en el proceso de obra, que contemple las características y elementos físicos para el "NAICM", con base en las flotas de aeronaves que operan y operarán en el Nuevo Aeropuerto en el futuro inmediato y con base en las normas nacionales e internacionales en materia de aeronáutica y de aviación civil	complete	0		1800000000	MXN	Invitación a cuando menos tres personas	Artículo 42, fracción IV de la Ley de Obras Públicas y Servicios Relacionados con las Mismas	nvitación a cuando menos 3 personas internacional bajo los tratados de libre comercio, presencial identificada con el número IO009KDH999-T3-2014 del 30 de octubre de 2014, relacionada con el “Proyecto Ejecutivo de pistas, rodajes y plataformas y ayudas a la navegación y otras instalaciones del NAICM", es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 6 de noviembre de 2014	Apartados 2.10 y 2.11 de la Invitación a cuando menos 3 personas internacional bajo los tratados de libre comercio, presencial identificada con el número IO009KDH999-T3-2014 del 30 de octubre de 2014, relacionada con el “Proyecto Ejecutivo de pistas, rodajes y plataformas y ayudas a la navegación y otras instalaciones del NAICM", es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 6 de noviembre de 2014	transferencia		\N	\N	2014-11-06 00:00:00	2014-11-24 00:00:00	1	Apartados 2.10 y 2.11 de la Invitación a cuando menos 3 personas internacional bajo los tratados de libre comercio, presencial identificada con el número IO009KDH999-T3-2014 del 30 de octubre de 2014, relacionada con el “Proyecto Ejecutivo de pistas, rodajes y plataformas y ayudas a la navegación y otras instalaciones del NAICM" (ver anexo)	\N	\N	3	\N	
82	82	1039131	Servicios de apoyo técnico a la residencia del proyecto ejecutivo de diseño arquitectónico e ingeniería de detalle del edificio terminal de pasajeros, torre de control y centro de operaciones, edificio de estacionamiento, estacionamientos en superficie, estación multimodal y vialidades de acceso del NAICM	Servicios de apoyo técnico a la residencia del proyecto ejecutivo de diseño arquitectónico e ingeniería de detalle del edificio terminal de pasajeros, torre de control y centro de operaciones, edificio de estacionamiento, estacionamientos en superficie, estación multimodal y vialidades de acceso del NAICM	complete	0		8362000	MXN	Invitación a cuando menos tres personas	Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-E45-2016 del 11 de abril 2016, relacionado con el “Servicios de apoyo técnico a la residencia del proyecto ejecutivo de diseño arquitectónico e ingeniería de detalle del edificio terminal de pasajeros, torre de control y centro de operaciones, edificio de estacionamiento, estacionamientos en superficie, estación multimodal y vialidades de acceso del NAICM", es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 11 de abril 2016	Apartado 2.10 y 2.11 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-E45-2016 del 11 de abril de 2016, relacionado con el “Servicios de apoyo técnico a la residencia del proyecto ejecutivo de diseño arquitectónico e ingeniería de detalle del edificio terminal de pasajeros, torre de control y centro de operaciones, edificio de estacionamiento, estacionamientos en superficie, estación multimodal y vialidades de acceso del NAICM", es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 11 de abril de 2016	Apartado 2.11 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-E45-2016 del 11 de abril de 2016, relacionado con el “Servicios de apoyo técnico a la residencia del proyecto ejecutivo de diseño arquitectónico e ingeniería de detalle del edificio terminal de pasajeros, torre de control y centro de operaciones, edificio de estacionamiento, estacionamientos en superficie, estación multimodal y vialidades de acceso del NAICM", es preciso señalar que la convocatoria fue publicada en la página de H62CompraNet el 11 de abril de 2016	transferencia		\N	\N	2016-04-19 00:00:00	2016-04-19 00:00:00	0	Apartado 2.11 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-E45-2016 del 11 de abril de 2016 (ver anexo)	\N	\N	3	\N	
\.


--
-- Name: tender_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('tender_id_seq', 113, true);


--
-- Data for Name: tenderamendmentchanges; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY tenderamendmentchanges (id, contractingprocess_id, tender_id, property, former_value) FROM stdin;
1	35	\N	Nombre correcto del procedimiento de contratación  y se entregó un nuevo modelo de contrato.	Modificación de contrato
\.


--
-- Name: tenderamendmentchanges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('tenderamendmentchanges_id_seq', 1, true);


--
-- Data for Name: tenderdocuments; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY tenderdocuments (id, contractingprocess_id, tender_id, document_type, documentid, title, description, url, date_published, date_modified, format, language) FROM stdin;
\.


--
-- Name: tenderdocuments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('tenderdocuments_id_seq', 1, false);


--
-- Data for Name: tenderer; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY tenderer (id, contractingprocess_id, tender_id, name, identifier_scheme, identifier_id, identifier_legalname, identifier_uri, address_streetaddress, address_locality, address_region, address_postalcode, address_countryname, contactpoint_name, contactpoint_email, contactpoint_telephone, contactpoint_faxnumber, contactpoint_url) FROM stdin;
\.


--
-- Name: tenderer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('tenderer_id_seq', 1, false);


--
-- Data for Name: tendereradditionalidentifiers; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY tendereradditionalidentifiers (id, contractingprocess_id, tenderer_id, scheme, legalname, uri) FROM stdin;
\.


--
-- Name: tendereradditionalidentifiers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('tendereradditionalidentifiers_id_seq', 1, false);


--
-- Data for Name: tenderitem; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY tenderitem (id, contractingprocess_id, tender_id, itemid, description, classification_scheme, classification_id, classification_description, classification_uri, quantity, unit_name, unit_value_amount, unit_value_currency) FROM stdin;
1	1	\N	62501001	Construcción de Aeropistas					\N	Obra	0	
2	3	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
3	4	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
4	5	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista					\N	Estudio	0	
5	6	\N	62903001	Supervisión de Obras			Servicios relacionados con Obra Pública		\N	Supervisión	0	
6	7	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
7	9	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
8	10	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
9	11	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
10	13	\N	62501001	Construcción de Aeropistas			Servicios relacionados con Obra Pública		\N	Estudio	0	
11	14	\N	62903001	Supervisión de Obras			Servicios relacionados con Obra Pública		\N	Supervisión	0	
12	15	\N	62903001	Supervisión de Obras			Servicios relacionados con Obra Pública		\N	Supervisión	0	
13	16	\N	62903001	Supervisión de Obras			Servicios relacionados con Obra Pública		\N	Supervisión	0	
14	17	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
15	37	\N	1	Obra pública			Servicios relacionados con Obra Pública		\N	Obra	0	
16	38	\N	62501001	Construcción de Aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
17	39	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública		Servicios relacionados con Obra Pública		\N		0	
18	57	\N	62501001	Construcción de Aeropistas 			Servicios Relacionados con Obra Pública		\N	Obra	0	
19	40	\N	1	Construcción de Aeropistas	Servicios relacionados con Obra Pública	62501001			\N	Servicio	0	
20	29	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio  	0	
21	41	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
22	42	\N	1	Construcción de Aeropistas	Servicios relacionados con Obra Pública	62501001			\N	Servicio	0	
23	43	\N	625010011	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
24	44	\N	1	Construcción de aeropistas	Servicios relacionados con Obra Pública	62501001			\N	Servicio	0	
25	58	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Obra	0	
27	45	\N	1	Construcción de aeropistas	Servicios relacionados con Obra Pública	62501001			\N	Servicio	0	
28	46	\N	1	Construcción de Aeropistas	Servicios relacionados con Obra Pública	62501001			\N	Servicio	0	
29	31	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio  	0	
30	60	\N	62501001	Construccion de Aeropistas			Servicios relacionados con Obra Pública		\N	Obra	0	
31	32	\N	1	Construcción de aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
32	61	\N	62501001	Construcción de Aeropistas			Obra Publica		\N	Obra	0	
33	34	\N	6251008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Proyecto Ejecutivo 	0	
34	62	\N	62903001	Construcción de Aeropistas			Obras Publicas		\N	Obra	0	
35	36	\N	62501001	Construcción de aeropistas 			Servicios relacionados con Obra Pública		\N	Servicios relacionados con obra pública	0	
36	47	\N	62501001	Construcción de Aeropistas.			Servicios relacionados con Obra Pública		\N	Experto	0	
37	48	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropistas.			Servicios relacionados con Obra Pública		\N	Estudio	0	
38	49	\N	62501008	Estudios de Preinversión y/o Preparación del Proyecto para Aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
39	50	\N	72501001	Construcción de Aeropistas.			Obra Pública		\N	Obra	0	
40	51	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio  	0	
41	67	\N	1	Estudios de preinersión y/o preparación del proyecto para aeropista	Obra pública	62501008			\N	Servicio	0	
42	68	\N	1	Obra pública					\N	Servicio	0	
43	69	\N	1	Obra pública					\N	Estudio	0	
44	70	\N	1	Obra pública					\N	Estudio	0	
45	52	\N	62501001	Construcción de Aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
46	76	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Proyecto ejecutivo	0	
47	71	\N	1	Obra pública					\N	Estudio	0	
48	72	\N	1	Obra pública					\N	Estudio	0	
49	73	\N	1	Obra pública					\N	Servicio	0	
50	53	\N	62501001	Construcción de Aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
51	54	\N	62501001	Construccion de Aeropistas			Obra Pública		\N	Servicio	0	
52	74	\N	1	Obra pública					\N	Estudio	0	
53	75	\N	1	Obra pública					\N	Obra	0	
54	55	\N	62501001	Construccion de Aeropistas			Obra Publica		\N	Servicio	0	
55	56	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Obra pública		\N	Estudio 	0	
56	86	\N	62903001	Supervisón de Obras			Servicios relacionados con Obra Pública		\N	Supervisión	0	
57	87	\N	62501001	Construcción de Aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
59	88	\N	62501001	Construcción de aeropistas			Servicios relacionados con obra pública		\N	Serivicio	0	
61	99	\N	1	Estudios de preinversión y/o preparación del proyecto para aeropista	Servicios relacionados con Obra Pública	62501008			\N	Estudio	0	
62	90	\N	62905	Servicios Especializados en el suministro de personal técnico y administrativo para proyectos de infraestructura aeroportuaria			Servicios Especializados en el suministro de personal técnico y administrativo para proyectos de infraestructura aeroportuaria		\N	mes	0	
63	91	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Proyecto Ejecutivo 	0	
64	92	\N	33301	Servicio integral de administración de personal y proceso de nomina, mediante un sistema especializado para recursos humanos y de nómina de gobierno			Servicio integral de administración de personal y proceso de nomina, mediante un sistema especializado para recursos humanos y de nómina de gobierno		\N	Servicio	0	
65	102	\N	62501001	Construcción de aeropistas	Servicios relacionados con  Obra Pública				\N	Servicio	0	
66	103	\N	33901	Contratacion de servicios especializados en el suministro de "terceros"					\N	Servicio	0	
67	104	\N	1	 					\N		0	
68	95	\N	6220	No se localiza. 	No se localiza	No aplica	No se localiza		\N	Obra	0	
69	105	\N	62501001	Construcción de aeropistas	Servicios relacionados con obra				\N	Obra	0	
70	106	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista	Servicios relacionados con Obra Pública				\N	Estudio	0	
71	107	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista	Servicios relacionados con Obra Pública				\N	Estudio	0	
72	108	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista	Servicios relacionados con Obra Pública				\N	Estudio	0	
73	109	\N	62501001	Construccion de Aeropistas	Obra Pública				\N	Obra Pública	0	
74	84	\N	62501001	Construcción de aeropistas		Servicios relacionados con Obra Pública	Servicios		\N	Servicio	0	MXN
75	85	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	27582750	mxn
77	113	\N	33901	Contratación de servicios especializados en el suministro de "terceros".			Contratación de servicios especializados en el suministro de "terceros".		\N	Servicio	0	
78	76	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N		2136433615	MXN
\.


--
-- Name: tenderitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('tenderitem_id_seq', 78, true);


--
-- Data for Name: tenderitemadditionalclassifications; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY tenderitemadditionalclassifications (id, contractingprocess_id, tenderitem_id, scheme, description, uri) FROM stdin;
\.


--
-- Name: tenderitemadditionalclassifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('tenderitemadditionalclassifications_id_seq', 1, false);


--
-- Data for Name: tendermilestone; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY tendermilestone (id, contractingprocess_id, tender_id, milestoneid, title, description, duedate, date_modified, status) FROM stdin;
1	1	\N	1	Visita al sitio de realización de los trabajos para el Servicio de Extracción de ademes y restitución de terreno que ocupan dichos elementos, ubicados en la poliginal para el NAICM.	La primera visita al sitio de realización de los trabajos para el Servicio de Extracción de ademes y restitución de terreno que ocupan dichos elementos, ubicados en la poliginal para el NAICM dio inicio a las 10:00 horas el 28 de noviembre de 2014., concluyendo a las 12:45 del mismo día La visita terminó a las 12:45 .  La segunda visita al sitio de realización de los trabajos para el Servicio de Extracción de ademes y restitución de terreno que ocupan dichos elementos, ubicados en la poliginal para el NAICM dio inicio a las 10:00 horas el 09 de diciembre de 2014., concluyendo a las 12:00 del mismo día.	2014-11-28 00:00:00	2014-11-29 00:00:00	complete
2	7	\N	1	Visita al sitio de realización de los trabajos para el Estudio e instalaciones complementarias para el de las características topográficas del terreno del Nuevo Aeropuerto Internacional de la Ciudad de México 	La visita al sitio de realización de los trabajos para el Estudio e instalaciones complementarias para el de las características topográficas del terreno del Nuevo Aeropuerto Internacional de la Ciudad de México   dio inicio a las 10:00 horas del 03 de junio de 2015 en el Km. 7.5 de la Autopista de Cuota Peñon - Texcoco en el Centro Mexicano de Capacitación en Agua y Saneamiento y se dio por concluida a las 12:00 horas del mismo día sin que existiera observación alguna por parte de los asistentes.	2015-06-03 00:00:00	2015-06-03 00:00:00	Complete
3	9	\N	1	Visita al sitio del lugar de los trabajos para llevar a cabo la Implementación del plan de restauración ecológica para el Nuevo Aeropuerto Internacional de la Ciudad de México.	La visita al sitio de realización de los trabajospara llevar a cabo la Implementación del plan de restauración ecológica para el Nuevo Aeropuerto Internacional de la Ciudad de México.  dio inicio a las 10:00 horas del 16 de junio de 2015 en el Km. 7.5 de la Autopista de Cuota Peñon - Texcoco en el Centro Mexicano de Capacitación en Agua y Saneamiento y se dio por concluida a las 12:00 horas del mismo día sin que existiera observación alguna por parte de los asistentes.	2015-06-16 00:00:00	2015-06-16 00:00:00	Complete
4	10	\N	1	 Acto de visita al sitio de realización de los trabajos	La visita al sitio de realización de los trabajos para el plan de monitoreo y conservación de aves del proyecto del NAICM en el sitio del NACM  dio inicio a las 10:00 horas del 16 de junio de 2015 en el Km. 7.5 de la Autopista de Cuota Peñón - Texcoco en el Centro Mexicano de Capacitación en Agua y Saneamiento y se dio por concluida a las 12:00 horas del mismo día sin que existiera observación alguna por parte de los asistentes.	2015-06-16 00:00:00	2015-06-16 00:00:00	Complete
5	11	\N	1	Acto de visita al sitio de realización de los trabajos para el plan de monitoreo y conservación de aves del proyecto del NAICM	La visita al sitio de realización de los trabajos para el plan de monitoreo y conservación de aves del proyecto del NAICM en el sitio del NACM  dio inicio a las 10:00 horas del 16 de junio de 2015 en el Km. 7.5 de la Autopista de Cuota Peñón - Texcoco en el Centro Mexicano de Capacitación en Agua y Saneamiento y se dio por concluida a las 12:00 horas del mismo día sin que existiera observación alguna por parte de los asistentes.	2015-06-16 00:00:00	2015-06-16 00:00:00	Complete
6	14	\N	1	Visita al sitio de realización de los trabajos para  los servicios de supervisión para: “Construcción del proyecto integral consistente en barda y camino perimetral, alumbrado, servicios inducidos y casetas de acceso para el Nuevo Aeropuerto Internacional de la Ciudad de México 	La visita al sitio de realización de los trabajos para  los servicios de supervisión para: “Construcción del proyecto integral consistente en barda y camino perimetral, alumbrado, servicios inducidos y casetas de acceso para el Nuevo Aeropuerto Internacional de la Ciudad de México   dio inicio a las 10:00 horas del 05 de agosto de 2015 en el Km. 7.5 de la Autopista de Cuota Peñon - Texcoco en el Centro Mexicano de Capacitación en Agua y Saneamiento y se dio por concluida a las 12:00 horas del mismo día sin que existiera observación alguna por parte de los asistentes.	2015-08-05 00:00:00	2015-08-05 00:00:00	Complete
7	15	\N	1	Visita al sitio de realización de los trabajos de Supervisión Técnica, Administrativa y de Control de calidad para los trabajos de nivelación y limpieza del terreno del Nuevo aeropuerto internacional de la Ciudad de México.	La visita al sitio de realización de los trabajos deSupervisión Técnica, Administrativa y de Control de calidad para los trabajos de nivelación y limpieza del terreno del Nuevo aeropuerto internacional de la Ciudad de México dio inicio a las 11:00 horas del 23 de noviembre de 2015 en el Km. 7.5 de la Autopista de Cuota Peñon - Texcoco en el Centro Mexicano de Capacitación en Agua y Saneamiento y se dio por concluida a las 13:00 horas del mismo día sin que existiera observación alguna por parte de los asistentes.	2015-11-23 00:00:00	2015-11-23 00:00:00	Complete
8	16	\N	1	Visita al sitio de realización de los trabajos para la Supervisión Técnica, Administrativa y de Control de calidad para los Trabajos de Construcción de los Caminos Provisionales de Acceso al Nuevo Aeropuerto Internacional de la Ciudad de México.	La visita al sitio de realización de los trabajos para la Supervisión Técnica, Administrativa y de Control de calidad para los Trabajos de Construcción de los Caminos Provisionales de Acceso al Nuevo Aeropuerto Internacional de la Ciudad de México dio inicio a las 11:00 horas del 25 de noviembre de 2015 en el Km. 7.5 de la Autopista de Cuota Peñon - Texcoco en el Centro Mexicano de Capacitación en Agua y Saneamiento y se dio por concluida a las 13:00 horas del mismo día sin que existiera observación alguna por parte de los asistentes.	2015-11-25 00:00:00	2015-11-25 00:00:00	Complete
11	30	\N	1	Visita al sitio de realización de los trabajos para el Estudio de Suministro Electrico para el Nuevo Aeropuerto Internacional de la Ciudad de México	La visita al sitio de realización de los trabajos para el Estudio de Suministro Electrico para el Nuevo Aeropuerto Internacional de la Ciudad de México en el sitio del NACM  dio inicio a las 10:00 horas del 10 de abril de 2015 en el Km. 7.5 de la Autopista de Cuota Peñon - Texcoco y se dio por concluida a las 12:00 horas del mismo día sin que existiera observación alguna por parte de los asistentes.	2015-04-10 00:00:00	\N	complete
12	34	\N	1	Visita al sitio de realización de los trabajos, relacionado con la invitación Restringida a Cuando Menos Tres Personas, identificada con el número IO-009KDH999-N43-2015 respecto de la Elaboracion del proyecto de terracerías de los caminos provisionales para la construcción del Nuevo Aeropuerto Internacional de la Ciudad de México.	La Visita al sitio de realización de los trabajos, relacionado con la invitación Restringida a Cuando Menos Tres Personas, identificada con el número IO-009KDH999-N43-2015 respecto de la Elaboracion del proyecto de terracerías de los caminos provisionales para la construcción del Nuevo Aeropuerto Internacional de la Ciudad de México, dio inicio a las 10:00  en el Km. 7.5 de la Autopista de Cuota Peñon - Texcoco en el Centro Mexicano de Capacitación en Agua y Saneamiento y se dio por concluida a las 12:00 horas del mismo día sin que existiera observación alguna por parte de los asistentes.	2015-06-02 00:00:00	\N	complete
13	50	\N	1	Visita al sitio de realización de los trabajos, relacionado con la invitación Restringida a Cuando Menos Tres Personas, identificada con el número IO-009KDH999-N82-2015 respecto a la “Adecuación de espacios para oficinas, del Grupo Aeroportuario de la Ciudad de México (GACM), en el CEMCAS.	Visita al sitio de realización de los trabajos, relacionado con la invitación Restringida a Cuando Menos Tres Personas, identificada con el número IO-009KDH999-N82-2015 respecto a la “Adecuación de espacios para oficinas, del Grupo Aeroportuario de la Ciudad de México (GACM), en el CEMCAS, dio inicio a las 10:00  en el Km. 7.5 de la Autopista Peñon - Texcoco (cuota) en el CEMCAS y se dio por concluida a las 12:00 horas del mismo día sin que existiera observación alguna por parte de los asistentes.	2015-11-06 00:00:00	\N	complete
14	56	\N	1	Visita al sitio de realización de los trabajos de Estudio de Ingeniería Geomática para el Proyecto Pistas, Plataformas, Calles de Rodaje y Edificios del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM), para Generar un modelo Digital de Terreno (MDT) a Través de la Tecnología HIGH Definition Surveying (HDS), Empleando Equipos GNSS, Escáner Láser y Ecosonda	Visita al sitio de realización de los trabajos Estudio de Ingeniería Geomática para el Proyecto Pistas, Plataformas, Calles de Rodaje y Edificios del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM), para Generar un modelo Digital de Terreno (MDT) a Través de la Tecnología HIGH Definition Surveying (HDS), Empleando Equipos GNSS, Escáner Láser y Ecosonda dio inicio a las 11:00 horas el 07 de Enero de 2016., concluyendo a las 13:00 del mismo día 	2016-01-07 00:00:00	\N	complete
15	91	\N	1	Visita al sitio de la realización de los trabajos, relacionado conde la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N83-2015, relacionado con el “Desarrollo del Proyecto ejecutivo para el entronque de acceso de carga en la zona Norte del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	La Visita al sitio de realización de los trabajos, relacionado con la invitación Restringida a Cuando Menos Tres Personas IO-009KDH999-N83-2015, relacionado con el “Desarrollo del Proyecto ejecutivo para el entronque de acceso de carga en la zona Norte del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM) , identificada con el número , dio inicio a las 10:00  en el Km. 7.5 de la Autopista de Cuota Peñon - Texcoco en el Centro Mexicano de Capacitación en Agua y Saneamiento y se dio por concluida a las 12:00 horas del mismo día sin que existiera observación alguna por parte de los asistentes.	2015-11-06 00:00:00	\N	complete
16	79	\N	1018414 	Servicios profesionales de consultoría, para el acompañamiento jurídico normativo y administrativo en la realización de las actividades para el desarrollo del Nuevo Aeropuerto Internacional de la Ciudad de México, así como para la elaboración del expediente concentrador integral	Servicios profesionales de consultoría, para el acompañamiento jurídico normativo y administrativo en la realización de las actividades para el desarrollo del Nuevo Aeropuerto Internacional de la Ciudad de México, así como para la elaboración del expediente concentrador integral	\N	\N	adjudicado
17	95	\N	1	Visita al sitio de realización de los trabajos	Visita al sitio de realización de los trabajos	2016-04-13 00:00:00	\N	
18	81	\N	703275	Visita al sitio de realización de los trabajos, relacionado con la invitación internacional a cuando menos tres personas, identificada con el número IO009KDH999-T3-2014 respecto al Desarrollo del proyecto ejecutivo de pistas, rodajes y plataformas y ayudas a la navegación y otras instalaciones del NAICM.	La visita al sitio de realización de los trabajos relacionados con la invitación internacional a cuando menos 3 personas, identificada con el número IO009KDH999-T3-2014 respecto al Desarrollo del proyecto ejecutivo de pistas, rodajes y plataformas y ayudas a la navegación y otras instalaciones del NAICM, dio inicio a las 12:00 del   en el Km. 7.5 de la Autopista de Cuota Peñon - Texcoco en el Centro Mexicano de Capacitación en Agua y Saneamiento y se dio por concluida a las 12:40 horas del mismo día sin que existiera observación alguna por parte de los asistentes.	\N	\N	
19	82	\N	1039131	Visita al sitio de realización de los trabajos, relacionado con la invitación Restringida a Cuando Menos Tres Personas, identificada con el número IO-009KDH999-E45-2016 respecto del H99	La Visita al sitio de realización de los trabajos, relacionado con la invitación Restringida a Cuando Menos Tres Personas, identificada con el número IO-009KDH999-E45-2016 respecto del “Servicios de apoyo técnico a la residencia del proyecto ejecutivo de diseño arquitectónico e ingeniería de detalle del edificio terminal de pasajeros, torre de control y centro de operaciones, edificio de estacionamiento, estacionamientos en superficie, estación multimodal y vialidades de acceso del NAICM", dio inicio a las 11:00  en el Km. 7.5 de la Autopista de Cuota Peñon - Texcoco en el Centro Mexicano de Capacitación en Agua y Saneamiento y se dio por concluida a las 13:00 horas del mismo día sin que existiera observación alguna por parte de los asistentes	2016-04-01 00:00:00	2016-07-15 00:00:00	CONCLUIDO
20	84	\N	62501001	Visita al sitio de realización de los trabajos, relacionado con la invitación Restringida a Cuando Menos Tres Personas, identificada con el número IO-009KDH999-N81-2015 respecto de los “Servicio de transporte con camionetas de redilas para los trabajos que conforman el programa de empleo temporal (PET), en el predio del Nuevo Aeropuerto Internacional de la Ciudad de México	La Visita al sitio de realización de los trabajos, relacionado con la invitación Restringida a Cuando Menos Tres Personas, identificada con el número IO-009KDH999-N81-2015 respecto del H76, dio inicio a las 10:00  en el Km. 7.5 de la Autopista de Cuota Peñon - Texcoco en el Centro Mexicano de Capacitación en Agua y Saneamiento y se dio por concluida a las 14:00 horas del mismo día sin que existiera observación alguna por parte de los asistentes	2015-10-06 00:00:00	2015-10-06 00:00:00	CONCLUIDO
\.


--
-- Name: tendermilestone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('tendermilestone_id_seq', 20, true);


--
-- Data for Name: tendermilestonedocuments; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY tendermilestonedocuments (id, contractingprocess_id, tender_id, milestone_id, document_type, documentid, title, description, url, date_published, date_modified, format, language) FROM stdin;
\.


--
-- Name: tendermilestonedocuments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('tendermilestonedocuments_id_seq', 1, false);


--
-- Name: award_pkey; Type: CONSTRAINT; Schema: public; Owner: tester; Tablespace: 
--

ALTER TABLE ONLY award
    ADD CONSTRAINT award_pkey PRIMARY KEY (id);


--
-- Name: awardamendmentchanges_pkey; Type: CONSTRAINT; Schema: public; Owner: tester; Tablespace: 
--

ALTER TABLE ONLY awardamendmentchanges
    ADD CONSTRAINT awardamendmentchanges_pkey PRIMARY KEY (id);


--
-- Name: awarddocuments_pkey; Type: CONSTRAINT; Schema: public; Owner: tester; Tablespace: 
--

ALTER TABLE ONLY awarddocuments
    ADD CONSTRAINT awarddocuments_pkey PRIMARY KEY (id);


--
-- Name: awarditem_pkey; Type: CONSTRAINT; Schema: public; Owner: tester; Tablespace: 
--

ALTER TABLE ONLY awarditem
    ADD CONSTRAINT awarditem_pkey PRIMARY KEY (id);


--
-- Name: awarditemadditionalclassifications_pkey; Type: CONSTRAINT; Schema: public; Owner: tester; Tablespace: 
--

ALTER TABLE ONLY awarditemadditionalclassifications
    ADD CONSTRAINT awarditemadditionalclassifications_pkey PRIMARY KEY (id);


--
-- Name: budget_pkey; Type: CONSTRAINT; Schema: public; Owner: tester; Tablespace: 
--

ALTER TABLE ONLY budget
    ADD CONSTRAINT budget_pkey PRIMARY KEY (id);


--
-- Name: buyer_pkey; Type: CONSTRAINT; Schema: public; Owner: tester; Tablespace: 
--

ALTER TABLE ONLY buyer
    ADD CONSTRAINT buyer_pkey PRIMARY KEY (id);


--
-- Name: buyeradditionalidentifiers_pkey; Type: CONSTRAINT; Schema: public; Owner: tester; Tablespace: 
--

ALTER TABLE ONLY buyeradditionalidentifiers
    ADD CONSTRAINT buyeradditionalidentifiers_pkey PRIMARY KEY (id);


--
-- Name: contract_pkey; Type: CONSTRAINT; Schema: public; Owner: tester; Tablespace: 
--

ALTER TABLE ONLY contract
    ADD CONSTRAINT contract_pkey PRIMARY KEY (id);


--
-- Name: contractamendmentchanges_pkey; Type: CONSTRAINT; Schema: public; Owner: tester; Tablespace: 
--

ALTER TABLE ONLY contractamendmentchanges
    ADD CONSTRAINT contractamendmentchanges_pkey PRIMARY KEY (id);


--
-- Name: contractdocuments_pkey; Type: CONSTRAINT; Schema: public; Owner: tester; Tablespace: 
--

ALTER TABLE ONLY contractdocuments
    ADD CONSTRAINT contractdocuments_pkey PRIMARY KEY (id);


--
-- Name: contractingprocess_pkey; Type: CONSTRAINT; Schema: public; Owner: tester; Tablespace: 
--

ALTER TABLE ONLY contractingprocess
    ADD CONSTRAINT contractingprocess_pkey PRIMARY KEY (id);


--
-- Name: contractitem_pkey; Type: CONSTRAINT; Schema: public; Owner: tester; Tablespace: 
--

ALTER TABLE ONLY contractitem
    ADD CONSTRAINT contractitem_pkey PRIMARY KEY (id);


--
-- Name: contractitemadditionalclasifications_pkey; Type: CONSTRAINT; Schema: public; Owner: tester; Tablespace: 
--

ALTER TABLE ONLY contractitemadditionalclasifications
    ADD CONSTRAINT contractitemadditionalclasifications_pkey PRIMARY KEY (id);


--
-- Name: implementation_pkey; Type: CONSTRAINT; Schema: public; Owner: tester; Tablespace: 
--

ALTER TABLE ONLY implementation
    ADD CONSTRAINT implementation_pkey PRIMARY KEY (id);


--
-- Name: implementationdocuments_pkey; Type: CONSTRAINT; Schema: public; Owner: tester; Tablespace: 
--

ALTER TABLE ONLY implementationdocuments
    ADD CONSTRAINT implementationdocuments_pkey PRIMARY KEY (id);


--
-- Name: implementationmilestone_pkey; Type: CONSTRAINT; Schema: public; Owner: tester; Tablespace: 
--

ALTER TABLE ONLY implementationmilestone
    ADD CONSTRAINT implementationmilestone_pkey PRIMARY KEY (id);


--
-- Name: implementationmilestonedocuments_pkey; Type: CONSTRAINT; Schema: public; Owner: tester; Tablespace: 
--

ALTER TABLE ONLY implementationmilestonedocuments
    ADD CONSTRAINT implementationmilestonedocuments_pkey PRIMARY KEY (id);


--
-- Name: implementationtransactions_pkey; Type: CONSTRAINT; Schema: public; Owner: tester; Tablespace: 
--

ALTER TABLE ONLY implementationtransactions
    ADD CONSTRAINT implementationtransactions_pkey PRIMARY KEY (id);


--
-- Name: planning_pkey; Type: CONSTRAINT; Schema: public; Owner: tester; Tablespace: 
--

ALTER TABLE ONLY planning
    ADD CONSTRAINT planning_pkey PRIMARY KEY (id);


--
-- Name: planningdocuments_pkey; Type: CONSTRAINT; Schema: public; Owner: tester; Tablespace: 
--

ALTER TABLE ONLY planningdocuments
    ADD CONSTRAINT planningdocuments_pkey PRIMARY KEY (id);


--
-- Name: procuringentity_pkey; Type: CONSTRAINT; Schema: public; Owner: tester; Tablespace: 
--

ALTER TABLE ONLY procuringentity
    ADD CONSTRAINT procuringentity_pkey PRIMARY KEY (id);


--
-- Name: procuringentityadditionalidentifiers_pkey; Type: CONSTRAINT; Schema: public; Owner: tester; Tablespace: 
--

ALTER TABLE ONLY procuringentityadditionalidentifiers
    ADD CONSTRAINT procuringentityadditionalidentifiers_pkey PRIMARY KEY (id);


--
-- Name: publisher_pkey; Type: CONSTRAINT; Schema: public; Owner: tester; Tablespace: 
--

ALTER TABLE ONLY publisher
    ADD CONSTRAINT publisher_pkey PRIMARY KEY (id);


--
-- Name: supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: tester; Tablespace: 
--

ALTER TABLE ONLY supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (id);


--
-- Name: supplieradditionalidentifiers_pkey; Type: CONSTRAINT; Schema: public; Owner: tester; Tablespace: 
--

ALTER TABLE ONLY supplieradditionalidentifiers
    ADD CONSTRAINT supplieradditionalidentifiers_pkey PRIMARY KEY (id);


--
-- Name: tender_pkey; Type: CONSTRAINT; Schema: public; Owner: tester; Tablespace: 
--

ALTER TABLE ONLY tender
    ADD CONSTRAINT tender_pkey PRIMARY KEY (id);


--
-- Name: tenderamendmentchanges_pkey; Type: CONSTRAINT; Schema: public; Owner: tester; Tablespace: 
--

ALTER TABLE ONLY tenderamendmentchanges
    ADD CONSTRAINT tenderamendmentchanges_pkey PRIMARY KEY (id);


--
-- Name: tenderdocuments_pkey; Type: CONSTRAINT; Schema: public; Owner: tester; Tablespace: 
--

ALTER TABLE ONLY tenderdocuments
    ADD CONSTRAINT tenderdocuments_pkey PRIMARY KEY (id);


--
-- Name: tenderer_pkey; Type: CONSTRAINT; Schema: public; Owner: tester; Tablespace: 
--

ALTER TABLE ONLY tenderer
    ADD CONSTRAINT tenderer_pkey PRIMARY KEY (id);


--
-- Name: tendereradditionalidentifiers_pkey; Type: CONSTRAINT; Schema: public; Owner: tester; Tablespace: 
--

ALTER TABLE ONLY tendereradditionalidentifiers
    ADD CONSTRAINT tendereradditionalidentifiers_pkey PRIMARY KEY (id);


--
-- Name: tenderitem_pkey; Type: CONSTRAINT; Schema: public; Owner: tester; Tablespace: 
--

ALTER TABLE ONLY tenderitem
    ADD CONSTRAINT tenderitem_pkey PRIMARY KEY (id);


--
-- Name: tenderitemadditionalclassifications_pkey; Type: CONSTRAINT; Schema: public; Owner: tester; Tablespace: 
--

ALTER TABLE ONLY tenderitemadditionalclassifications
    ADD CONSTRAINT tenderitemadditionalclassifications_pkey PRIMARY KEY (id);


--
-- Name: tendermilestone_pkey; Type: CONSTRAINT; Schema: public; Owner: tester; Tablespace: 
--

ALTER TABLE ONLY tendermilestone
    ADD CONSTRAINT tendermilestone_pkey PRIMARY KEY (id);


--
-- Name: tendermilestonedocuments_pkey; Type: CONSTRAINT; Schema: public; Owner: tester; Tablespace: 
--

ALTER TABLE ONLY tendermilestonedocuments
    ADD CONSTRAINT tendermilestonedocuments_pkey PRIMARY KEY (id);


--
-- Name: award_contractingprocess_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY award
    ADD CONSTRAINT award_contractingprocess_id_fkey FOREIGN KEY (contractingprocess_id) REFERENCES contractingprocess(id) ON DELETE CASCADE;


--
-- Name: awardamendmentchanges_award_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY awardamendmentchanges
    ADD CONSTRAINT awardamendmentchanges_award_id_fkey FOREIGN KEY (award_id) REFERENCES award(id) ON DELETE CASCADE;


--
-- Name: awardamendmentchanges_contractingprocess_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY awardamendmentchanges
    ADD CONSTRAINT awardamendmentchanges_contractingprocess_id_fkey FOREIGN KEY (contractingprocess_id) REFERENCES contractingprocess(id) ON DELETE CASCADE;


--
-- Name: awarddocuments_award_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY awarddocuments
    ADD CONSTRAINT awarddocuments_award_id_fkey FOREIGN KEY (award_id) REFERENCES award(id);


--
-- Name: awarddocuments_contractingprocess_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY awarddocuments
    ADD CONSTRAINT awarddocuments_contractingprocess_id_fkey FOREIGN KEY (contractingprocess_id) REFERENCES contractingprocess(id) ON DELETE CASCADE;


--
-- Name: awarditem_award_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY awarditem
    ADD CONSTRAINT awarditem_award_id_fkey FOREIGN KEY (award_id) REFERENCES award(id) ON DELETE CASCADE;


--
-- Name: awarditem_contractingprocess_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY awarditem
    ADD CONSTRAINT awarditem_contractingprocess_id_fkey FOREIGN KEY (contractingprocess_id) REFERENCES contractingprocess(id);


--
-- Name: awarditemadditionalclassifications_award_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY awarditemadditionalclassifications
    ADD CONSTRAINT awarditemadditionalclassifications_award_id_fkey FOREIGN KEY (award_id) REFERENCES award(id) ON DELETE CASCADE;


--
-- Name: awarditemadditionalclassifications_awarditem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY awarditemadditionalclassifications
    ADD CONSTRAINT awarditemadditionalclassifications_awarditem_id_fkey FOREIGN KEY (awarditem_id) REFERENCES awarditem(id) ON DELETE CASCADE;


--
-- Name: budget_contractingprocess_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY budget
    ADD CONSTRAINT budget_contractingprocess_id_fkey FOREIGN KEY (contractingprocess_id) REFERENCES contractingprocess(id) ON DELETE CASCADE;


--
-- Name: budget_planning_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY budget
    ADD CONSTRAINT budget_planning_id_fkey FOREIGN KEY (planning_id) REFERENCES planning(id) ON DELETE CASCADE;


--
-- Name: buyer_contractingprocess_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY buyer
    ADD CONSTRAINT buyer_contractingprocess_id_fkey FOREIGN KEY (contractingprocess_id) REFERENCES contractingprocess(id) ON DELETE CASCADE;


--
-- Name: buyeradditionalidentifiers_buyer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY buyeradditionalidentifiers
    ADD CONSTRAINT buyeradditionalidentifiers_buyer_id_fkey FOREIGN KEY (buyer_id) REFERENCES buyer(id) ON DELETE CASCADE;


--
-- Name: buyeradditionalidentifiers_contractingprocess_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY buyeradditionalidentifiers
    ADD CONSTRAINT buyeradditionalidentifiers_contractingprocess_id_fkey FOREIGN KEY (contractingprocess_id) REFERENCES contractingprocess(id) ON DELETE CASCADE;


--
-- Name: contract_contractingprocess_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY contract
    ADD CONSTRAINT contract_contractingprocess_id_fkey FOREIGN KEY (contractingprocess_id) REFERENCES contractingprocess(id) ON DELETE CASCADE;


--
-- Name: contractamendmentchanges_contract_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY contractamendmentchanges
    ADD CONSTRAINT contractamendmentchanges_contract_id_fkey FOREIGN KEY (contract_id) REFERENCES contract(id) ON DELETE CASCADE;


--
-- Name: contractamendmentchanges_contractingprocess_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY contractamendmentchanges
    ADD CONSTRAINT contractamendmentchanges_contractingprocess_id_fkey FOREIGN KEY (contractingprocess_id) REFERENCES contractingprocess(id) ON DELETE CASCADE;


--
-- Name: contractdocuments_contract_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY contractdocuments
    ADD CONSTRAINT contractdocuments_contract_id_fkey FOREIGN KEY (contract_id) REFERENCES contract(id) ON DELETE CASCADE;


--
-- Name: contractdocuments_contractingprocess_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY contractdocuments
    ADD CONSTRAINT contractdocuments_contractingprocess_id_fkey FOREIGN KEY (contractingprocess_id) REFERENCES contractingprocess(id) ON DELETE CASCADE;


--
-- Name: contractitem_contract_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY contractitem
    ADD CONSTRAINT contractitem_contract_id_fkey FOREIGN KEY (contract_id) REFERENCES contract(id) ON DELETE CASCADE;


--
-- Name: contractitem_contractingprocess_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY contractitem
    ADD CONSTRAINT contractitem_contractingprocess_id_fkey FOREIGN KEY (contractingprocess_id) REFERENCES contractingprocess(id) ON DELETE CASCADE;


--
-- Name: contractitemadditionalclasifications_contract_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY contractitemadditionalclasifications
    ADD CONSTRAINT contractitemadditionalclasifications_contract_id_fkey FOREIGN KEY (contract_id) REFERENCES contract(id) ON DELETE CASCADE;


--
-- Name: contractitemadditionalclasifications_contractingprocess_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY contractitemadditionalclasifications
    ADD CONSTRAINT contractitemadditionalclasifications_contractingprocess_id_fkey FOREIGN KEY (contractingprocess_id) REFERENCES contractingprocess(id) ON DELETE CASCADE;


--
-- Name: contractitemadditionalclasifications_contractitem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY contractitemadditionalclasifications
    ADD CONSTRAINT contractitemadditionalclasifications_contractitem_id_fkey FOREIGN KEY (contractitem_id) REFERENCES contractitem(id) ON DELETE CASCADE;


--
-- Name: implementation_contract_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY implementation
    ADD CONSTRAINT implementation_contract_id_fkey FOREIGN KEY (contract_id) REFERENCES contract(id) ON DELETE CASCADE;


--
-- Name: implementation_contractingprocess_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY implementation
    ADD CONSTRAINT implementation_contractingprocess_id_fkey FOREIGN KEY (contractingprocess_id) REFERENCES contractingprocess(id) ON DELETE CASCADE;


--
-- Name: implementationdocuments_contract_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY implementationdocuments
    ADD CONSTRAINT implementationdocuments_contract_id_fkey FOREIGN KEY (contract_id) REFERENCES contract(id) ON DELETE CASCADE;


--
-- Name: implementationdocuments_contractingprocess_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY implementationdocuments
    ADD CONSTRAINT implementationdocuments_contractingprocess_id_fkey FOREIGN KEY (contractingprocess_id) REFERENCES contractingprocess(id) ON DELETE CASCADE;


--
-- Name: implementationdocuments_implementation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY implementationdocuments
    ADD CONSTRAINT implementationdocuments_implementation_id_fkey FOREIGN KEY (implementation_id) REFERENCES implementation(id) ON DELETE CASCADE;


--
-- Name: implementationmilestone_contract_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY implementationmilestone
    ADD CONSTRAINT implementationmilestone_contract_id_fkey FOREIGN KEY (contract_id) REFERENCES contract(id) ON DELETE CASCADE;


--
-- Name: implementationmilestone_contractingprocess_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY implementationmilestone
    ADD CONSTRAINT implementationmilestone_contractingprocess_id_fkey FOREIGN KEY (contractingprocess_id) REFERENCES contractingprocess(id) ON DELETE CASCADE;


--
-- Name: implementationmilestone_implementation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY implementationmilestone
    ADD CONSTRAINT implementationmilestone_implementation_id_fkey FOREIGN KEY (implementation_id) REFERENCES implementation(id) ON DELETE CASCADE;


--
-- Name: implementationmilestonedocuments_contract_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY implementationmilestonedocuments
    ADD CONSTRAINT implementationmilestonedocuments_contract_id_fkey FOREIGN KEY (contract_id) REFERENCES contract(id) ON DELETE CASCADE;


--
-- Name: implementationmilestonedocuments_contractingprocess_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY implementationmilestonedocuments
    ADD CONSTRAINT implementationmilestonedocuments_contractingprocess_id_fkey FOREIGN KEY (contractingprocess_id) REFERENCES contractingprocess(id) ON DELETE CASCADE;


--
-- Name: implementationmilestonedocuments_implementation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY implementationmilestonedocuments
    ADD CONSTRAINT implementationmilestonedocuments_implementation_id_fkey FOREIGN KEY (implementation_id) REFERENCES implementation(id) ON DELETE CASCADE;


--
-- Name: implementationtransactions_contract_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY implementationtransactions
    ADD CONSTRAINT implementationtransactions_contract_id_fkey FOREIGN KEY (contract_id) REFERENCES contract(id) ON DELETE CASCADE;


--
-- Name: implementationtransactions_contractingprocess_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY implementationtransactions
    ADD CONSTRAINT implementationtransactions_contractingprocess_id_fkey FOREIGN KEY (contractingprocess_id) REFERENCES contractingprocess(id) ON DELETE CASCADE;


--
-- Name: implementationtransactions_implementation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY implementationtransactions
    ADD CONSTRAINT implementationtransactions_implementation_id_fkey FOREIGN KEY (implementation_id) REFERENCES implementation(id) ON DELETE CASCADE;


--
-- Name: planning_contractingprocess_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY planning
    ADD CONSTRAINT planning_contractingprocess_id_fkey FOREIGN KEY (contractingprocess_id) REFERENCES contractingprocess(id) ON DELETE CASCADE;


--
-- Name: planningdocuments_contractingprocess_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY planningdocuments
    ADD CONSTRAINT planningdocuments_contractingprocess_id_fkey FOREIGN KEY (contractingprocess_id) REFERENCES contractingprocess(id) ON DELETE CASCADE;


--
-- Name: planningdocuments_planning_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY planningdocuments
    ADD CONSTRAINT planningdocuments_planning_id_fkey FOREIGN KEY (planning_id) REFERENCES planning(id) ON DELETE CASCADE;


--
-- Name: procuringentity_contractingprocess_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY procuringentity
    ADD CONSTRAINT procuringentity_contractingprocess_id_fkey FOREIGN KEY (contractingprocess_id) REFERENCES contractingprocess(id) ON DELETE CASCADE;


--
-- Name: procuringentity_tender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY procuringentity
    ADD CONSTRAINT procuringentity_tender_id_fkey FOREIGN KEY (tender_id) REFERENCES tender(id) ON DELETE CASCADE;


--
-- Name: procuringentityadditionalidentifiers_contractingprocess_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY procuringentityadditionalidentifiers
    ADD CONSTRAINT procuringentityadditionalidentifiers_contractingprocess_id_fkey FOREIGN KEY (contractingprocess_id) REFERENCES contractingprocess(id) ON DELETE CASCADE;


--
-- Name: procuringentityadditionalidentifiers_procuringentity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY procuringentityadditionalidentifiers
    ADD CONSTRAINT procuringentityadditionalidentifiers_procuringentity_id_fkey FOREIGN KEY (procuringentity_id) REFERENCES procuringentity(id) ON DELETE CASCADE;


--
-- Name: procuringentityadditionalidentifiers_tender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY procuringentityadditionalidentifiers
    ADD CONSTRAINT procuringentityadditionalidentifiers_tender_id_fkey FOREIGN KEY (tender_id) REFERENCES tender(id) ON DELETE CASCADE;


--
-- Name: publisher_contractingprocess_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY publisher
    ADD CONSTRAINT publisher_contractingprocess_id_fkey FOREIGN KEY (contractingprocess_id) REFERENCES contractingprocess(id) ON DELETE CASCADE;


--
-- Name: supplier_award_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY supplier
    ADD CONSTRAINT supplier_award_id_fkey FOREIGN KEY (award_id) REFERENCES award(id);


--
-- Name: supplier_contractingprocess_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY supplier
    ADD CONSTRAINT supplier_contractingprocess_id_fkey FOREIGN KEY (contractingprocess_id) REFERENCES contractingprocess(id) ON DELETE CASCADE;


--
-- Name: supplieradditionalidentifiers_award_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY supplieradditionalidentifiers
    ADD CONSTRAINT supplieradditionalidentifiers_award_id_fkey FOREIGN KEY (award_id) REFERENCES award(id) ON DELETE CASCADE;


--
-- Name: supplieradditionalidentifiers_contractingprocess_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY supplieradditionalidentifiers
    ADD CONSTRAINT supplieradditionalidentifiers_contractingprocess_fkey FOREIGN KEY (contractingprocess) REFERENCES contractingprocess(id) ON DELETE CASCADE;


--
-- Name: supplieradditionalidentifiers_supplier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY supplieradditionalidentifiers
    ADD CONSTRAINT supplieradditionalidentifiers_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES supplier(id) ON DELETE CASCADE;


--
-- Name: tender_contractingprocess_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY tender
    ADD CONSTRAINT tender_contractingprocess_id_fkey FOREIGN KEY (contractingprocess_id) REFERENCES contractingprocess(id) ON DELETE CASCADE;


--
-- Name: tenderamendmentchanges_contractingprocess_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY tenderamendmentchanges
    ADD CONSTRAINT tenderamendmentchanges_contractingprocess_id_fkey FOREIGN KEY (contractingprocess_id) REFERENCES contractingprocess(id) ON DELETE CASCADE;


--
-- Name: tenderamendmentchanges_tender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY tenderamendmentchanges
    ADD CONSTRAINT tenderamendmentchanges_tender_id_fkey FOREIGN KEY (tender_id) REFERENCES tender(id) ON DELETE CASCADE;


--
-- Name: tenderdocuments_contractingprocess_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY tenderdocuments
    ADD CONSTRAINT tenderdocuments_contractingprocess_id_fkey FOREIGN KEY (contractingprocess_id) REFERENCES contractingprocess(id) ON DELETE CASCADE;


--
-- Name: tenderdocuments_tender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY tenderdocuments
    ADD CONSTRAINT tenderdocuments_tender_id_fkey FOREIGN KEY (tender_id) REFERENCES tender(id) ON DELETE CASCADE;


--
-- Name: tenderer_contractingprocess_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY tenderer
    ADD CONSTRAINT tenderer_contractingprocess_id_fkey FOREIGN KEY (contractingprocess_id) REFERENCES contractingprocess(id) ON DELETE CASCADE;


--
-- Name: tenderer_tender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY tenderer
    ADD CONSTRAINT tenderer_tender_id_fkey FOREIGN KEY (tender_id) REFERENCES tender(id) ON DELETE CASCADE;


--
-- Name: tendereradditionalidentifiers_contractingprocess_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY tendereradditionalidentifiers
    ADD CONSTRAINT tendereradditionalidentifiers_contractingprocess_id_fkey FOREIGN KEY (contractingprocess_id) REFERENCES contractingprocess(id) ON DELETE CASCADE;


--
-- Name: tendereradditionalidentifiers_tenderer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY tendereradditionalidentifiers
    ADD CONSTRAINT tendereradditionalidentifiers_tenderer_id_fkey FOREIGN KEY (tenderer_id) REFERENCES tenderer(id) ON DELETE CASCADE;


--
-- Name: tenderitem_contractingprocess_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY tenderitem
    ADD CONSTRAINT tenderitem_contractingprocess_id_fkey FOREIGN KEY (contractingprocess_id) REFERENCES contractingprocess(id) ON DELETE CASCADE;


--
-- Name: tenderitem_tender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY tenderitem
    ADD CONSTRAINT tenderitem_tender_id_fkey FOREIGN KEY (tender_id) REFERENCES tender(id) ON DELETE CASCADE;


--
-- Name: tenderitemadditionalclassifications_contractingprocess_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY tenderitemadditionalclassifications
    ADD CONSTRAINT tenderitemadditionalclassifications_contractingprocess_id_fkey FOREIGN KEY (contractingprocess_id) REFERENCES contractingprocess(id) ON DELETE CASCADE;


--
-- Name: tenderitemadditionalclassifications_tenderitem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY tenderitemadditionalclassifications
    ADD CONSTRAINT tenderitemadditionalclassifications_tenderitem_id_fkey FOREIGN KEY (tenderitem_id) REFERENCES tenderitem(id) ON DELETE CASCADE;


--
-- Name: tendermilestone_contractingprocess_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY tendermilestone
    ADD CONSTRAINT tendermilestone_contractingprocess_id_fkey FOREIGN KEY (contractingprocess_id) REFERENCES contractingprocess(id) ON DELETE CASCADE;


--
-- Name: tendermilestone_tender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY tendermilestone
    ADD CONSTRAINT tendermilestone_tender_id_fkey FOREIGN KEY (tender_id) REFERENCES tender(id) ON DELETE CASCADE;


--
-- Name: tendermilestonedocuments_contractingprocess_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY tendermilestonedocuments
    ADD CONSTRAINT tendermilestonedocuments_contractingprocess_id_fkey FOREIGN KEY (contractingprocess_id) REFERENCES contractingprocess(id) ON DELETE CASCADE;


--
-- Name: tendermilestonedocuments_milestone_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY tendermilestonedocuments
    ADD CONSTRAINT tendermilestonedocuments_milestone_id_fkey FOREIGN KEY (milestone_id) REFERENCES tendermilestone(id) ON DELETE CASCADE;


--
-- Name: tendermilestonedocuments_tender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY tendermilestonedocuments
    ADD CONSTRAINT tendermilestonedocuments_tender_id_fkey FOREIGN KEY (tender_id) REFERENCES tender(id) ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

