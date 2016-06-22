--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: award; Type: TABLE; Schema: public; Owner: tester
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


ALTER TABLE award OWNER TO tester;

--
-- Name: award_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE award_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE award_id_seq OWNER TO tester;

--
-- Name: award_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE award_id_seq OWNED BY award.id;


--
-- Name: awardamendmentchanges; Type: TABLE; Schema: public; Owner: tester
--

CREATE TABLE awardamendmentchanges (
    id integer NOT NULL,
    contractingprocess_id integer,
    award_id integer,
    property text,
    former_value text
);


ALTER TABLE awardamendmentchanges OWNER TO tester;

--
-- Name: awardamendmentchanges_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE awardamendmentchanges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE awardamendmentchanges_id_seq OWNER TO tester;

--
-- Name: awardamendmentchanges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE awardamendmentchanges_id_seq OWNED BY awardamendmentchanges.id;


--
-- Name: awarddocuments; Type: TABLE; Schema: public; Owner: tester
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


ALTER TABLE awarddocuments OWNER TO tester;

--
-- Name: awarddocuments_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE awarddocuments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE awarddocuments_id_seq OWNER TO tester;

--
-- Name: awarddocuments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE awarddocuments_id_seq OWNED BY awarddocuments.id;


--
-- Name: awarditem; Type: TABLE; Schema: public; Owner: tester
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


ALTER TABLE awarditem OWNER TO tester;

--
-- Name: awarditem_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE awarditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE awarditem_id_seq OWNER TO tester;

--
-- Name: awarditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE awarditem_id_seq OWNED BY awarditem.id;


--
-- Name: awarditemadditionalclassifications; Type: TABLE; Schema: public; Owner: tester
--

CREATE TABLE awarditemadditionalclassifications (
    id integer NOT NULL,
    award_id integer,
    awarditem_id integer,
    scheme text,
    description text,
    uri text
);


ALTER TABLE awarditemadditionalclassifications OWNER TO tester;

--
-- Name: awarditemadditionalclassifications_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE awarditemadditionalclassifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE awarditemadditionalclassifications_id_seq OWNER TO tester;

--
-- Name: awarditemadditionalclassifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE awarditemadditionalclassifications_id_seq OWNED BY awarditemadditionalclassifications.id;


--
-- Name: budget; Type: TABLE; Schema: public; Owner: tester
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


ALTER TABLE budget OWNER TO tester;

--
-- Name: budget_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE budget_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE budget_id_seq OWNER TO tester;

--
-- Name: budget_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE budget_id_seq OWNED BY budget.id;


--
-- Name: buyer; Type: TABLE; Schema: public; Owner: tester
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


ALTER TABLE buyer OWNER TO tester;

--
-- Name: buyer_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE buyer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE buyer_id_seq OWNER TO tester;

--
-- Name: buyer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE buyer_id_seq OWNED BY buyer.id;


--
-- Name: buyeradditionalidentifiers; Type: TABLE; Schema: public; Owner: tester
--

CREATE TABLE buyeradditionalidentifiers (
    id integer NOT NULL,
    contractingprocess_id integer,
    buyer_id integer,
    scheme text,
    legalname text,
    uri text
);


ALTER TABLE buyeradditionalidentifiers OWNER TO tester;

--
-- Name: buyeradditionalidentifiers_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE buyeradditionalidentifiers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE buyeradditionalidentifiers_id_seq OWNER TO tester;

--
-- Name: buyeradditionalidentifiers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE buyeradditionalidentifiers_id_seq OWNED BY buyeradditionalidentifiers.id;


--
-- Name: contract; Type: TABLE; Schema: public; Owner: tester
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


ALTER TABLE contract OWNER TO tester;

--
-- Name: contract_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE contract_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contract_id_seq OWNER TO tester;

--
-- Name: contract_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE contract_id_seq OWNED BY contract.id;


--
-- Name: contractamendmentchanges; Type: TABLE; Schema: public; Owner: tester
--

CREATE TABLE contractamendmentchanges (
    id integer NOT NULL,
    contractingprocess_id integer,
    contract_id integer,
    property text,
    former_value text
);


ALTER TABLE contractamendmentchanges OWNER TO tester;

--
-- Name: contractamendmentchanges_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE contractamendmentchanges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contractamendmentchanges_id_seq OWNER TO tester;

--
-- Name: contractamendmentchanges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE contractamendmentchanges_id_seq OWNED BY contractamendmentchanges.id;


--
-- Name: contractdocuments; Type: TABLE; Schema: public; Owner: tester
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


ALTER TABLE contractdocuments OWNER TO tester;

--
-- Name: contractdocuments_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE contractdocuments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contractdocuments_id_seq OWNER TO tester;

--
-- Name: contractdocuments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE contractdocuments_id_seq OWNED BY contractdocuments.id;


--
-- Name: contractingprocess; Type: TABLE; Schema: public; Owner: tester
--

CREATE TABLE contractingprocess (
    id integer NOT NULL,
    ocid text,
    fecha_creacion date,
    hora_creacion time without time zone
);


ALTER TABLE contractingprocess OWNER TO tester;

--
-- Name: contractingprocess_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE contractingprocess_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contractingprocess_id_seq OWNER TO tester;

--
-- Name: contractingprocess_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE contractingprocess_id_seq OWNED BY contractingprocess.id;


--
-- Name: contractitem; Type: TABLE; Schema: public; Owner: tester
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


ALTER TABLE contractitem OWNER TO tester;

--
-- Name: contractitem_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE contractitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contractitem_id_seq OWNER TO tester;

--
-- Name: contractitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE contractitem_id_seq OWNED BY contractitem.id;


--
-- Name: contractitemadditionalclasifications; Type: TABLE; Schema: public; Owner: tester
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


ALTER TABLE contractitemadditionalclasifications OWNER TO tester;

--
-- Name: contractitemadditionalclasifications_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE contractitemadditionalclasifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contractitemadditionalclasifications_id_seq OWNER TO tester;

--
-- Name: contractitemadditionalclasifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE contractitemadditionalclasifications_id_seq OWNED BY contractitemadditionalclasifications.id;


--
-- Name: implementation; Type: TABLE; Schema: public; Owner: tester
--

CREATE TABLE implementation (
    id integer NOT NULL,
    contractingprocess_id integer,
    contract_id integer
);


ALTER TABLE implementation OWNER TO tester;

--
-- Name: implementation_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE implementation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE implementation_id_seq OWNER TO tester;

--
-- Name: implementation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE implementation_id_seq OWNED BY implementation.id;


--
-- Name: implementationdocuments; Type: TABLE; Schema: public; Owner: tester
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


ALTER TABLE implementationdocuments OWNER TO tester;

--
-- Name: implementationdocuments_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE implementationdocuments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE implementationdocuments_id_seq OWNER TO tester;

--
-- Name: implementationdocuments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE implementationdocuments_id_seq OWNED BY implementationdocuments.id;


--
-- Name: implementationmilestone; Type: TABLE; Schema: public; Owner: tester
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


ALTER TABLE implementationmilestone OWNER TO tester;

--
-- Name: implementationmilestone_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE implementationmilestone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE implementationmilestone_id_seq OWNER TO tester;

--
-- Name: implementationmilestone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE implementationmilestone_id_seq OWNED BY implementationmilestone.id;


--
-- Name: implementationmilestonedocuments; Type: TABLE; Schema: public; Owner: tester
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


ALTER TABLE implementationmilestonedocuments OWNER TO tester;

--
-- Name: implementationmilestonedocuments_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE implementationmilestonedocuments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE implementationmilestonedocuments_id_seq OWNER TO tester;

--
-- Name: implementationmilestonedocuments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE implementationmilestonedocuments_id_seq OWNED BY implementationmilestonedocuments.id;


--
-- Name: implementationtransactions; Type: TABLE; Schema: public; Owner: tester
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
    uri text
);


ALTER TABLE implementationtransactions OWNER TO tester;

--
-- Name: implementationtransactions_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE implementationtransactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE implementationtransactions_id_seq OWNER TO tester;

--
-- Name: implementationtransactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE implementationtransactions_id_seq OWNED BY implementationtransactions.id;


--
-- Name: planning; Type: TABLE; Schema: public; Owner: tester
--

CREATE TABLE planning (
    id integer NOT NULL,
    contractingprocess_id integer,
    rationale text
);


ALTER TABLE planning OWNER TO tester;

--
-- Name: planning_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE planning_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE planning_id_seq OWNER TO tester;

--
-- Name: planning_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE planning_id_seq OWNED BY planning.id;


--
-- Name: planningdocuments; Type: TABLE; Schema: public; Owner: tester
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


ALTER TABLE planningdocuments OWNER TO tester;

--
-- Name: planningdocuments_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE planningdocuments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE planningdocuments_id_seq OWNER TO tester;

--
-- Name: planningdocuments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE planningdocuments_id_seq OWNED BY planningdocuments.id;


--
-- Name: procuringentity; Type: TABLE; Schema: public; Owner: tester
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


ALTER TABLE procuringentity OWNER TO tester;

--
-- Name: procuringentity_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE procuringentity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE procuringentity_id_seq OWNER TO tester;

--
-- Name: procuringentity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE procuringentity_id_seq OWNED BY procuringentity.id;


--
-- Name: procuringentityadditionalidentifiers; Type: TABLE; Schema: public; Owner: tester
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


ALTER TABLE procuringentityadditionalidentifiers OWNER TO tester;

--
-- Name: procuringentityadditionalidentifiers_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE procuringentityadditionalidentifiers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE procuringentityadditionalidentifiers_id_seq OWNER TO tester;

--
-- Name: procuringentityadditionalidentifiers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE procuringentityadditionalidentifiers_id_seq OWNED BY procuringentityadditionalidentifiers.id;


--
-- Name: publisher; Type: TABLE; Schema: public; Owner: tester
--

CREATE TABLE publisher (
    id integer NOT NULL,
    contractingprocess_id integer,
    name text,
    scheme text,
    uid text,
    uri text
);


ALTER TABLE publisher OWNER TO tester;

--
-- Name: publisher_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE publisher_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE publisher_id_seq OWNER TO tester;

--
-- Name: publisher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE publisher_id_seq OWNED BY publisher.id;


--
-- Name: supplier; Type: TABLE; Schema: public; Owner: tester
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


ALTER TABLE supplier OWNER TO tester;

--
-- Name: supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE supplier_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supplier_id_seq OWNER TO tester;

--
-- Name: supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE supplier_id_seq OWNED BY supplier.id;


--
-- Name: supplieradditionalidentifiers; Type: TABLE; Schema: public; Owner: tester
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


ALTER TABLE supplieradditionalidentifiers OWNER TO tester;

--
-- Name: supplieradditionalidentifiers_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE supplieradditionalidentifiers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supplieradditionalidentifiers_id_seq OWNER TO tester;

--
-- Name: supplieradditionalidentifiers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE supplieradditionalidentifiers_id_seq OWNED BY supplieradditionalidentifiers.id;


--
-- Name: tender; Type: TABLE; Schema: public; Owner: tester
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


ALTER TABLE tender OWNER TO tester;

--
-- Name: tender_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE tender_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tender_id_seq OWNER TO tester;

--
-- Name: tender_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE tender_id_seq OWNED BY tender.id;


--
-- Name: tenderamendmentchanges; Type: TABLE; Schema: public; Owner: tester
--

CREATE TABLE tenderamendmentchanges (
    id integer NOT NULL,
    contractingprocess_id integer,
    tender_id integer,
    property text,
    former_value text
);


ALTER TABLE tenderamendmentchanges OWNER TO tester;

--
-- Name: tenderamendmentchanges_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE tenderamendmentchanges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tenderamendmentchanges_id_seq OWNER TO tester;

--
-- Name: tenderamendmentchanges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE tenderamendmentchanges_id_seq OWNED BY tenderamendmentchanges.id;


--
-- Name: tenderdocuments; Type: TABLE; Schema: public; Owner: tester
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


ALTER TABLE tenderdocuments OWNER TO tester;

--
-- Name: tenderdocuments_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE tenderdocuments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tenderdocuments_id_seq OWNER TO tester;

--
-- Name: tenderdocuments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE tenderdocuments_id_seq OWNED BY tenderdocuments.id;


--
-- Name: tenderer; Type: TABLE; Schema: public; Owner: tester
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


ALTER TABLE tenderer OWNER TO tester;

--
-- Name: tenderer_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE tenderer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tenderer_id_seq OWNER TO tester;

--
-- Name: tenderer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE tenderer_id_seq OWNED BY tenderer.id;


--
-- Name: tendereradditionalidentifiers; Type: TABLE; Schema: public; Owner: tester
--

CREATE TABLE tendereradditionalidentifiers (
    id integer NOT NULL,
    contractingprocess_id integer,
    tenderer_id integer,
    scheme text,
    legalname text,
    uri text
);


ALTER TABLE tendereradditionalidentifiers OWNER TO tester;

--
-- Name: tendereradditionalidentifiers_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE tendereradditionalidentifiers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tendereradditionalidentifiers_id_seq OWNER TO tester;

--
-- Name: tendereradditionalidentifiers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE tendereradditionalidentifiers_id_seq OWNED BY tendereradditionalidentifiers.id;


--
-- Name: tenderitem; Type: TABLE; Schema: public; Owner: tester
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


ALTER TABLE tenderitem OWNER TO tester;

--
-- Name: tenderitem_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE tenderitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tenderitem_id_seq OWNER TO tester;

--
-- Name: tenderitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE tenderitem_id_seq OWNED BY tenderitem.id;


--
-- Name: tenderitemadditionalclassifications; Type: TABLE; Schema: public; Owner: tester
--

CREATE TABLE tenderitemadditionalclassifications (
    id integer NOT NULL,
    contractingprocess_id integer,
    tenderitem_id integer,
    scheme text,
    description text,
    uri text
);


ALTER TABLE tenderitemadditionalclassifications OWNER TO tester;

--
-- Name: tenderitemadditionalclassifications_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE tenderitemadditionalclassifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tenderitemadditionalclassifications_id_seq OWNER TO tester;

--
-- Name: tenderitemadditionalclassifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE tenderitemadditionalclassifications_id_seq OWNED BY tenderitemadditionalclassifications.id;


--
-- Name: tendermilestone; Type: TABLE; Schema: public; Owner: tester
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


ALTER TABLE tendermilestone OWNER TO tester;

--
-- Name: tendermilestone_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE tendermilestone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tendermilestone_id_seq OWNER TO tester;

--
-- Name: tendermilestone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE tendermilestone_id_seq OWNED BY tendermilestone.id;


--
-- Name: tendermilestonedocuments; Type: TABLE; Schema: public; Owner: tester
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


ALTER TABLE tendermilestonedocuments OWNER TO tester;

--
-- Name: tendermilestonedocuments_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE tendermilestonedocuments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tendermilestonedocuments_id_seq OWNER TO tester;

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
3	3	\N	\N	\N	none	\N	\N	\N	\N	\N	\N	\N
9	8	\N	\N	\N	none	\N	\N	\N	\N	\N	\N	\N
12	12	\N	\N	\N	none	\N	\N	\N	\N	\N	\N	\N
17	18	\N	\N	\N	none	\N	\N	\N	\N	\N	\N	\N
18	20	\N	\N	\N	none	\N	\N	\N	\N	\N	\N	\N
14	14	IO-009KDH999-N54-2015	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato a la empresa Sifra y Asociados, S. A. de C. V., por un importe de $3'286,659.95, monto mas IVA, por resultar ser la propuesta que al ser evaluada técnica y ecómicamente, asegura las mejores condiciones disponibles en cuanto a precio, calidad, financiamiento, oportunidad; toda vez que es la empresa que presenta los costos unitarios mas bajos.	active	2015-08-14 00:00:00	3286659.95	MXN	\N	\N	\N	
6	7	IO-009KDH999-N41-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato a la empresa Consorcio IUYET, S.A. de C.V.  , por un importe de $33,577,144.97, monto sin considerar el IVA, por resultar se la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2015-07-14 00:00:00	33577144.97	MXN	\N	\N	\N	
13	13	LO-009KDH999-T52-2015	Acta de emisión de fallo	Con fundamento en lo dispuesto en el art. 39, fracción III de la LOPSRM, se adjudica el contrato a la empresa AUTODESK, INC., por un impote de $136´749,542.27, monto sin considerar el IVA, por resultar la propuesta que al ser evaluada técnica y económicamente, obtuvo el puntaje más alto acorde al mecanismo de evalución previsto en la convocatoria.	active	2015-10-09 00:00:00	136749542.27	MXN	\N	\N	\N	
16	16	LO-009KDH999-N87-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato a Consultoría, Supervisión Técnica y Operación en Sistemas, S. A. de C. V., por un importe de $12'043,340.90, monto sin considerar el IVA, por resultar ser la propuesta que al ser evaluada técnica y ecómicamente, cumplió con los requisitos previstos en la convocatoria. 	active	2015-12-23 00:00:00	12043340.90	MXN	\N	\N	\N	
1	1	LO-009KDH999-N5-2014	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 39 o fracción III de la LOPSRM se adjudica el contrato a la empresa GEXIC, S. A. de C. V., por un importe de $34´245,066.00 sin IVA, por resultar ser la propuesta que al ser evaluada técnica y económicamente, obtuvo el untaje mas alto acorde al mecanismo de evaluaciones previstos en la convocatoria.	active	2014-12-18 00:00:00	34245066	MXN	\N	\N	\N	
15	15	LO-009KDH999-N86-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato a la empresa Consultoría, Supervisión Técnica y Operación en Sistemas, S. A. de C. V., por un importe de $9'720,916.92, monto sin considerar el IVA, por resultar ser la propuesta que al ser evaluada técnica y ecómicamente, cumplió con los requisitos previstos en la convocatoria. 	active	2015-12-23 00:00:00	9720916.92	MXN	\N	\N	\N	
4	4	SO-009KDH999-N24-2015	Oficio de notificación de Adjudicación Directa DCAGI/SC/GC/029/2015 del 04-02-2015	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 27 fracción III y 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, 28, 29 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3. del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., y a solicitud expresa de la Dirección Corporativa de Infraestructura, se le adjudica de manera directa la prestación del servicio relacionado con la obra pública al Instituto de Investigaciones y Capacitación para las Ciencias Biológicas, A.C. 	active	\N	449999.86	MXN	\N	\N	\N	
10	9	LO-009KDH999-N45-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato a la empresa Manejo Integral de Cuencas, S.A. de C.V., por un importe de $18'934,197.76, monto sin considerar el IVA, por resultar ser la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria.	active	2015-07-06 00:00:00	18934197.76	MXN	\N	\N	\N	
8	10	LO-009KDH999-N46-2015	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato la empresa Supervisión y Control de Fauna, S.A. de C.V. , por un importe de $14,382,969.27, monto sin considerar el IVA, por resultar se la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2015-07-06 00:00:00	14382969.27	MXN	\N	\N	\N	
5	5	SO-09KDH999-N26-2015	Oficio DCAGI/SC/GC/037/2015 del 04 d efebrero de 2015	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 27 fracción III y 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, 28, 29 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3. del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., y a solicitud expresa de la Dirección Corporativa de Infraestructura, se le adjudica de manera directa la prestación del servicio relacionado con la obra pública a Sistemas Integrales de Gestión Ambiental, S.C.	active	2015-02-04 00:00:00	465000.00	MXN	\N	\N	\N	
11	11	LO-009KDH999-N42-2015	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato la empresa RAGAMEX, S.A. de C.V. y Oliverio González Alafita , por un importe de $11,924,906.62, monto sin considerar el IVA, por resultar se la propuesta que al ser evaluada técnica y económicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2015-07-06 00:00:00	11924906.62	MXN	\N	\N	\N	
7	6	IO-009KDH999-N10-2015	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato la empresa Avalúos, Evaluaciones y Proyectos , S.A. de C.V., por un importe de $2,156,884.20, monto sin considerar el IVA, por resultar se la propuesta que al ser evaluada técnica y económicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2015-03-09 00:00:00	2156884.2	MXN	\N	\N	\N	
20	17	IO-009KDH999-E96-2015	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato la empresa BCG The Boston Consulting Group, S. C., BDG The Boston Consulting Group I y GMBH & CO. KG , por un importe de $79,000,000.00, monto sin considerar el IVA, por resultar se la propuesta que al ser evaluada técnica y económicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2016-03-11 00:00:00	79000000	MXN	\N	\N	\N	
23	21	LO-009KDH999-N78-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato al consorcio integrado por Omega Construcciones Industriales, S. A. de C. V., Calzada Construcciones, S. A. de C. V. y Construcciones y Dragados del Sureste, S. A. de C. V., por un importe de $493'916,475.00, monto sin considerar el IVA, por resultar ser la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2015-12-16 00:00:00	493916475	MXN	\N	\N	\N	
22	22	LO-009KDH999-N79-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato a la empresa Coconal S. A. P. I. de C. V., por un importe de $1,762'803,241.34, monto sin considerar el IVA, por  ser la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2015-12-11 00:00:00	1762803241.34	MXN	\N	\N	\N	
21	23	LO-009KDH999-N80-2015	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato al consorcio integrado por Transportaciones y Construcciones Tamaulipecos, S. A. de C. V. e Inmobiliarios Mexicanos, S. A. de C. V., por un importe de $608'275,577.50, monto sin considerar el IVA, por resultar ser la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2015-12-16 00:00:00	608275577.50	MXN	\N	\N	\N	
19	19	IO-009KDH999-E15-2016	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato la empresa Construcciones Aldesem, S. A. de C. V., por un importe de $10,961,673.55, monto sin considerar el IVA, por resultar se la propuesta que al ser evaluada técnica y económicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2016-03-07 00:00:00	10961673.55	MXN	\N	\N	\N	
25	24	 LO-009KDH999-N20-2015	Construcción de accesos y plataformas para exploración geotécnica para la pista número 2 del Nuevo Aeropuerto Internacional de la Ciudad de México.	Construcción de accesos y plataformas para exploración geotécnica para la pista número 2 del Nuevo Aeropuerto Internacional de la Ciudad de México.	active	\N	5038656.00	MXN	\N	\N	\N	
24	25	LO-009KDH999-T15-2015	Acta de emisión de fallo	Con fundamento en lo dispuesto en el art. 39, fracción III de la LOPSRM se adjudica el contrato al consorcio integrado por Advanced Ligistic Group, S. A. U. e Indra Business Consulting México, S. A. de C. V., por un importe de $11´650,000.00, por resultar ser la propuesra que al ser evaluada técnica y económicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria.	active	2015-05-14 00:00:00	11650000	MXN	\N	\N	\N	
\.


--
-- Name: award_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('award_id_seq', 25, true);


--
-- Data for Name: awardamendmentchanges; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY awardamendmentchanges (id, contractingprocess_id, award_id, property, former_value) FROM stdin;
\.


--
-- Name: awardamendmentchanges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('awardamendmentchanges_id_seq', 1, false);


--
-- Data for Name: awarddocuments; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY awarddocuments (id, contractingprocess_id, award_id, document_type, documentid, title, description, url, date_published, date_modified, format, language) FROM stdin;
\.


--
-- Name: awarddocuments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('awarddocuments_id_seq', 1, false);


--
-- Data for Name: awarditem; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY awarditem (id, contractingprocess_id, award_id, itemid, description, classification_scheme, classification_id, classification_description, classification_uri, quantity, unit_name, unit_value_amount, unit_value_currency) FROM stdin;
\.


--
-- Name: awarditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('awarditem_id_seq', 1, false);


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
3	3	3	\N	\N	\N	\N	\N	\N	\N	\N
8	8	8	\N	\N	\N	\N	\N	\N	\N	\N
12	12	12	\N	\N	\N	\N	\N	\N	\N	\N
17	18	17	\N	\N	\N	\N	\N	\N	\N	\N
19	20	20	\N	\N	\N	\N	\N	\N	\N	\N
15	15	15	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	17000000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
16	16	16	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	20000000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
18	17	18	Presupuesto de Egresos de la Federación 2016	46101	Transferencias a fideicomisos públicos	122000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2016/docs/09/r09_kdh_pie.pdf
1	1	1	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Términos de referencia "Extracción de ademes y restitución del terreno que ocupan dichos elementos ubicados en la poligonal para el Nuevo Aeropuerto Internacional de la Cuidad de México".  Públicados en CompraNet el 24 de noviembre de 2014	54520000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
20	19	19	Presupuesto de Egresos de la Federación 2015 y 2016	46101	Transferencias a fideicomisos públicos	1276500	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2016/docs/09/r09_kdh_pie.pdf
11	11	11	Presupuesto de Egresos de la Federación 2015 y 2016	1409JZL0005	Programa anual de obras públicas y servicios relacionados con las mismas de GACM correspondiente al ejercicio fiscal 2015	18500000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México		http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
21	21	21	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	770000000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
4	4	4	Presupuesto de Egresos de la Fedración 2015 	46101		522000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
23	22	23	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	3950000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
5	5	5	Presupuesto de Egresos de la Fedración 2015 	46101		539400.00		Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
6	6	6	Presupuesto de Egresos de la Federación 2015 y 2016	46101	Transferencias a fideicomisos públicos	2680000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
7	7	7	Presupuesto de Egresos de la Federación 2015 	46101	Transferencias a fideicomisos públicos	39000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
10	9	9	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	26000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
9	10	10	Presupuesto de Egresos de la Federación 2015 y 2016	46101	Transferencias a fideicomisos públicos	29000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
13	13	13	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	121700000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
22	23	22	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	1203803000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
14	14	14	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	4000000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
24	24	24	Presupuesto de Egresos de la Fedración 2015 	46101	Transferencias a fideicomisos públicos	10400000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
25	25	25	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	16000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
\.


--
-- Name: budget_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('budget_id_seq', 25, true);


--
-- Data for Name: buyer; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY buyer (id, contractingprocess_id, name, identifier_scheme, identifier_id, identifier_legalname, identifier_uri, address_streetaddress, address_locality, address_region, address_postalcode, address_countryname, contactpoint_name, contactpoint_email, contactpoint_telephone, contactpoint_faxnumber, contactpoint_url) FROM stdin;
1	1	GACM-Dirección Corporativa de Administración y Gestión Imobiliaria	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
2	2	GACM-Dirección Corporativa de Administración y Gestión Imobiliaria	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
3	3	GACM-Dirección Corporativa de Administración y Gestión Imobiliaria	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
10	9	GACM-Dirección Corporativa de Administración y Gestión Imobiliaria	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
11	11	GACM-Dirección Corporativa de Administración y Gestión Imobiliaria	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
12	12	GACM-Dirección Corporativa de Administración y Gestión Imobiliaria	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
13	13	GACM-Dirección Corporativa de Administración y Gestión Imobiliaria	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
14	14	GACM-Dirección Corporativa de Administración y Gestión Imobiliaria	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
15	15	GACM-Dirección Corporativa de Administración y Gestión Imobiliaria	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
16	16	GACM-Dirección Corporativa de Administración y Gestión Imobiliaria	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
17	18	GACM-Dirección Corporativa de Administración y Gestión Imobiliaria	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
18	20	GACM-Dirección Corporativa de Administración y Gestión Imobiliaria	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
19	19	GACM-Dirección Corporativa de Administración y Gestión Imobiliaria	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
20	17	GACM-Dirección Corporativa de Administración y Gestión Imobiliaria	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
21	21	GACM-Dirección Corporativa de Administración y Gestión Imobiliaria	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
22	23	GACM-Dirección Corporativa de Administración y Gestión Imobiliaria	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
23	22	GACM-Dirección Corporativa de Administración y Gestión Imobiliaria	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
24	24	GACM-Dirección Corporativa de Administración y Gestión Imobiliaria	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
4	4	GACM-Dirección Corporativa de Administración y Gestión Imobiliaria	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
5	5	GACM-Dirección Corporativa de Administración y Gestión Imobiliaria	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
6	7	GACM-Dirección Corporativa de Administración y Gestión Imobiliaria	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
7	6	GACM-Dirección Corporativa de Administración y Gestión Imobiliaria	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
8	10	GACM-Dirección Corporativa de Administración y Gestión Imobiliaria	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
9	8	GACM-Dirección Corporativa de Administración y Gestión Imobiliaria	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
25	25	GACM-Dirección Corporativa de Administración y Gestión Imobiliaria	GACM	009KDH999	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	\N	\N	\N	\N	\N	Gerardo Francisco Hernández Romero	\N	\N	\N	\N
\.


--
-- Name: buyer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('buyer_id_seq', 25, true);


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
23	22	LO-009KDH999-N79-2015	LPN-OP-DCAGI-SC-112/15	CONVOCATORIA DE NIVELACIÓN Y LIMPIEZA DEL TERRENO DEL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO	CONVOCATORIA DE NIVELACIÓN Y LIMPIEZA DEL TERRENO DEL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO	active	2015-12-14 00:00:00	2017-01-13 00:00:00	2044851759.9543998	MXN	2015-12-14 00:00:00	\N	ART. 27 FRACCION I DE LOPSRM
1	1	LO-009KDH999-N5-2014	LPN-O-DCAGI-SC-014/14	EXTRACCION DE ADEMES Y RESTITUCION DEL TERRENO QUE OCUPAN DICHOS ELEMENTOS UBICADOS EN LA POLIGONAL PARA EL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MEXCIO	EXTRACCION DE ADEMES Y RESTITUCION DEL TERRENO QUE OCUPAN DICHOS ELEMENTOS UBICADOS EN LA POLIGONAL PARA EL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MEXCIO	terminated	2015-01-05 00:00:00	2015-07-03 00:00:00	39724276.56	MXN	2015-01-02 00:00:00	\N	ART. 27 FRACCIÓN I DE LA  LOPSRM
4	4	SO-009KDH999-N24-2015	AD-SRO-DCAGI-SC-005/15	PLAN DE ACCIONES DE MONITOREO Y CONSERVACIÓN DE AVES PARA EL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO	PLAN DE ACCIONES DE MONITOREO Y CONSERVACIÓN DE AVES PARA EL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO	terminated	2015-02-20 00:00:00	2015-03-20 00:00:00	521999.84	MXN	2015-02-19 00:00:00	\N	ART. 43 DE LA LOPSRM
5	5	SO-09KDH999-N26-2015	AD-SRO-DCAGI-SC-013/15	PLAN DE MONITOREO, REGISTRO Y VERIFICACIÓN DE EMISIÓN DE GASES DE EFECTO INVERNADERO PARA EL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO	PLAN DE MONITOREO, REGISTRO Y VERIFICACIÓN DE EMISIÓN DE GASES DE EFECTO INVERNADERO PARA EL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO	terminated	2015-02-20 00:00:00	2015-03-19 00:00:00	539400	MXN	2015-02-19 00:00:00	\N	ART. 43 DE LA LOPSRM
3	3	SO-009KDH999-N23-2015	AD-SRO-DCAGI-SC-009/15	ELABORACIÓN DEL PROGRAMA DE MONITOREO DE RUIDO PERIMETRAL PARA LAS ETAPAS DE PREPARACIÓN DEL SITIO, CONSTRUCCIÓN, OPERACIÓN Y MANTENIMIENTO DEL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO	ELABORACIÓN DEL PROGRAMA DE MONITOREO DE RUIDO PERIMETRAL PARA LAS ETAPAS DE PREPARACIÓN DEL SITIO, CONSTRUCCIÓN, OPERACIÓN Y MANTENIMIENTO DEL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO	terminated	2015-02-23 00:00:00	2015-03-22 00:00:00	638000	MXN	2015-02-20 00:00:00	\N	ART. 43 DE LA LOPSRM
6	6	IO-009KDH999-N10-2015	ITP-SRO-DCAGI-SC-016/15	SUPERVISIÓN PARA LA OBRA: EXTRACCIÓN DE ADEMES Y RESTITUCIÓN DEL TERRENO QUE OCUPAN DICHOS ELEMENTOS UBICADOS EN LA POLIGONAL PARA EL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO	SUPERVISIÓN PARA LA OBRA: EXTRACCIÓN DE ADEMES Y RESTITUCIÓN DEL TERRENO QUE OCUPAN DICHOS ELEMENTOS UBICADOS EN LA POLIGONAL PARA EL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO	terminated	2015-03-21 00:00:00	2015-09-16 00:00:00	2501985.67	MXN	2015-03-20 00:00:00	\N	ART. 43 DE LA LOPSRM
13	13	LO-009KDH999-T52-2015	LPI-SRO-DCAGI-SC-079/15	DISEÑAR E INSTRUMENTAR EL MODELO VIRTUAL DE INFORMACIÓN PARA LA CONSTRUCCIÓN (BIM) DEL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO (NAICM)	DISEÑAR E INSTRUMENTAR EL MODELO VIRTUAL DE INFORMACIÓN PARA LA CONSTRUCCIÓN (BIM) DEL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO (NAICM)	active	2015-10-23 00:00:00	2019-10-21 00:00:00	158629469.03	MXN	2015-10-23 00:00:00	\N	ART. 27 FRACCION I DE LOPSRM
10	9	LO-009KDH999-N45-2015	LPN-SRO-DCAGI-SC-043/15	IMPLEMENTACIÓN DEL PLAN DE RESTAURACIÓN ECOLÓGICA PARA EL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO	IMPLEMENTACIÓN DEL PLAN DE RESTAURACIÓN ECOLÓGICA PARA EL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO	active	2015-07-21 00:00:00	2016-12-31 00:00:00	21963669.40	MXN	2015-07-21 00:00:00	\N	ART. 27 FRACCION I DE LOPSRM
11	11	LO-009KDH999-N42-2015	LPN-SRO-DCAGI-SC-042/15	IMPLEMENTACIÓN DEL PROGRAMA DE RESCATE DE FLORA Y FAUNA PARA EL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO	IMPLEMENTACIÓN DEL PROGRAMA DE RESCATE DE FLORA Y FAUNA PARA EL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO	active	2015-07-21 00:00:00	2016-12-31 00:00:00	13832891.67	MXN	2015-07-21 00:00:00	\N	ART. 27 FRACCION I DE LOPSRM
7	7	IO-009KDH999-N41-2015	ITP-SRO-DCAGI-SC-048/15	ESTUDIO DE LAS CARACTERÍSTICAS TOPOGRÁFICAS DEL TERRENO DEL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO	ESTUDIO DE LAS CARACTERÍSTICAS TOPOGRÁFICAS DEL TERRENO DEL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO	terminated	2015-07-29 00:00:00	2015-09-26 00:00:00	38949488.17	MXN	2015-07-29 00:00:00	\N	ART. 42 FRACCIÓN XI DE LA LOPSRM
9	10	LO-009KDH999-N46-2015	LPN-SRO-DCAGI-SC-041/15	PLAN DE MONITOREO Y CONSERVACIÓN DE AVES DEL PROYECTO NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO	PLAN DE MONITOREO Y CONSERVACIÓN DE AVES DEL PROYECTO NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO	active	2015-07-21 00:00:00	2016-12-31 00:00:00	16684244.27	MXN	2015-07-21 00:00:00	\N	ART. 27 FRACCION I DE LOPSRM
14	14	IO-009KDH999-N54-2015	ITP-SRO-DCAGI-SC-063/15	SUPERVISIÓN PARA: CONSTRUCCIÓN DEL PROYECTO INTEGRAL CONSISTENTE EN BARDA Y CAMINO PERIMETRAL, ALUMBRADO, SERVICIOS INDUCIDOS Y CASETAS DE ACCESO PARA EL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO (PRIMERA ETAPA)	SUPERVISIÓN PARA: CONSTRUCCIÓN DEL PROYECTO INTEGRAL CONSISTENTE EN BARDA Y CAMINO PERIMETRAL, ALUMBRADO, SERVICIOS INDUCIDOS Y CASETAS DE ACCESO PARA EL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO (PRIMERA ETAPA)	terminated	2015-08-15 00:00:00	2015-12-31 00:00:00	3812525.54	MXN	2015-08-15 00:00:00	\N	ART. 44 DE LA LOPSRM
21	21	LO-009KDH999-N78-2015	LPN-OP-DCAGI-SC-115/15	CONVOCATORIA DE CARGA, ACARREO Y DESCARGA FUERA DEL POLIGONO DEL MATERIAL EXISTENTE PRODUCTO DE DEPOSITOS DE DEMOLICIONES, DESPERDICIOS Y DESAZOLVE	CONVOCATORIA DE CARGA, ACARREO Y DESCARGA FUERA DEL POLIGONO DEL MATERIAL EXISTENTE PRODUCTO DE DEPOSITOS DE DEMOLICIONES, DESPERDICIOS Y DESAZOLVE	active	2015-12-31 00:00:00	2016-08-26 00:00:00	572943111	MXN	2015-12-31 00:00:00	\N	ART. 27 FRACCION I DE LOPSRM
8	8	LO-009KDH999-N47-2015	LPN-OP-DCAGI-SC-066/15	DESARROLLO DEL PROYECTO EJECUTIVO, CONSTRUCCIÓN, EQUIPAMIENTO DE, MOBILIARIO E INSTALACIONES COMPLEMENTARIAS PARA EL CAMPAMENTO DEL GRUPO AEROPORTUARIO DE LA CIUDAD DE MÉXICO (GACM) EN EL SITIO DEL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO (NAI	DESARROLLO DEL PROYECTO EJECUTIVO, CONSTRUCCIÓN, EQUIPAMIENTO DE, MOBILIARIO E INSTALACIONES COMPLEMENTARIAS PARA EL CAMPAMENTO DEL GRUPO AEROPORTUARIO DE LA CIUDAD DE MÉXICO (GACM) EN EL SITIO DEL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO (NAI	terminated	2015-09-10 00:00:00	2016-04-06 00:00:00	129973731.2	MXN	2015-09-10 00:00:00	\N	ART. 27 FRACCION I DE LOPSRM
24	24	LO-099KDH999-N20-2015	LPN-O-DCAGI-SC-024/15	CONSTRUCCION DE CAMINOS DE ACCESOS Y PLATAFORMAS PARA EXPLORACIÓN GEOTÉCNICA PARA LA PISTA NO 2 DEL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO	CONSTRUCCION DE CAMINOS DE ACCESOS Y PLATAFORMAS PARA EXPLORACIÓN GEOTÉCNICA PARA LA PISTA NO 2 DEL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO	active	2015-05-14 00:00:00	2016-06-27 00:00:00	5844840.96	MXN	2015-05-14 00:00:00	\N	ART. 27 FRACCION I DE LOPSRM
25	25	LO-099KDH999-T15-2015	LPI-SRO-DCAGI-SC-030/15	ESTUDIO DE LAS CARACTERISTICAS TÉCNICAS DE INFRAESTRUCTURA Y DISEÑO ESQUEMATICO DE LA TERMINAL DE CARGA DEL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO.	ESTUDIO DE LAS CARACTERISTICAS TÉCNICAS DE INFRAESTRUCTURA Y DISEÑO ESQUEMATICO DE LA TERMINAL DE CARGA DEL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO.	active	2015-05-29 00:00:00	2016-09-03 00:00:00	13514000	MXN	2015-05-29 00:00:00	\N	ART. 27 FRACCION I DE LOPSRM
12	12	LO-009KDH999-N50-2015	LPN-OP-DCAGI-SC-076/15	PARA LOS TRABAJOS RELATIVOS A LA CONSTRUCCIÓN DEL DRENAJE PLUVIAL TEMPORAL DEL NUEVO AEROPUERTO DE LA CIUDAD DE MÉXICO.	PARA LOS TRABAJOS RELATIVOS A LA CONSTRUCCIÓN DEL DRENAJE PLUVIAL TEMPORAL DEL NUEVO AEROPUERTO DE LA CIUDAD DE MÉXICO.	terminated	2015-10-09 00:00:00	2016-03-07 00:00:00	223329692.62	MXN	2015-10-09 00:00:00	\N	ART. 27 FRACCION I DE LOPSRM
2	2	IO-009KDH999-N11-2015	ITP-OP-DCAGI-SC-014/15	CONSTRUCCIÓN DE CAMINOS DE ACCESO A LA ZONA DEL EDIFICIO TERMINAL DE LA PRIMERA ETAPA,  NECESARIOS PARA LA CARACTERIZACIÓN GEOTÉCNICA INICIAL	CONSTRUCCIÓN DE CAMINOS DE ACCESO A LA ZONA DEL EDIFICIO TERMINAL DE LA PRIMERA ETAPA,  NECESARIOS PARA LA CARACTERIZACIÓN GEOTÉCNICA INICIAL	terminated	2015-03-05 00:00:00	2015-05-18 00:00:00	9429941.46	MXN	2015-03-19 00:00:00	\N	ART. 43 DE LA LOPSRM
17	18	AO-009KDH999-E26-2016	AD-SRO-DCAGI-SC-002/16	SUPERVISION DEL PROYECTO EJECUTIVO, CONSTRUCCION, EQUIPAMIENTO, MOBILIARIO E INSTALACIONES COMPLEMENTARIAS PARA EL CAMPAMENTO DEL GRUPO AEROPORTUARIO DE LA CIUDAD DE MÉXICO (GACM) EN EL SITIO DEL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO.	SUPERVISION DEL PROYECTO EJECUTIVO, CONSTRUCCION, EQUIPAMIENTO, MOBILIARIO E INSTALACIONES COMPLEMENTARIAS PARA EL CAMPAMENTO DEL GRUPO AEROPORTUARIO DE LA CIUDAD DE MÉXICO (GACM) EN EL SITIO DEL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO.	active	2016-01-14 00:00:00	2016-07-11 00:00:00	4286458.44	MXN	2016-01-14 00:00:00	\N	ART. 44 ULTIMO PARRAFO DE LA LOPSRM
19	20	AO-009KDH999-E20-2016	AD-SRO-DCAGI-SC-003/16	SUPERVISION DE LA CONSTRUCCIÓN DEL DRENAJE PLUVIAL TEMPORAL DEL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO.	SUPERVISION DE LA CONSTRUCCIÓN DEL DRENAJE PLUVIAL TEMPORAL DEL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO.	active	2016-02-01 00:00:00	2016-06-29 00:00:00	8909803.13	MXN	2016-01-21 00:00:00	\N	ART. 44 ULTIMO PARRAFO DE LA LOPSRM
22	23	LO-009KDH999-N80-2015	LPN-OP-DCAGI-SC-114/15	CONVOCATORIA DE CONSTRUCCIÓN DE LOS CAMINOS PROVISIONALES DE ACCESO AL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO (NAICM) EJECUTANDO TRABAJOS DE TERRACERIA, ESTRUCTURAS Y OBRAS DE DRENAJE, PAVIMENTACIÓN Y SEÑALAMIENTO.	CONVOCATORIA DE CONSTRUCCIÓN DE LOS CAMINOS PROVISIONALES DE ACCESO AL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO (NAICM) EJECUTANDO TRABAJOS DE TERRACERIA, ESTRUCTURAS Y OBRAS DE DRENAJE, PAVIMENTACIÓN Y SEÑALAMIENTO.	active	2015-12-31 00:00:00	2017-02-13 00:00:00	705599669.9	MXN	2015-12-31 00:00:00	\N	ART. 27 FRACCION I DE LOPSRM
15	15	LO-009KDH999-N86-2015	LPN-SRO-DCAGI-SC-117/15	SUPERVISIÓN TÉCNICA, ADMINISTRATIVA Y DE CONTROL DE CALIDAD PARA LOS TRABAJOS DE NIVELACIÓN Y LIMPIEZA DEL TERRENO DEL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO	SUPERVISIÓN TÉCNICA, ADMINISTRATIVA Y DE CONTROL DE CALIDAD PARA LOS TRABAJOS DE NIVELACIÓN Y LIMPIEZA DEL TERRENO DEL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO	active	2015-12-31 00:00:00	2016-12-16 00:00:00	11276263.62	MXN	\N	\N	ART. 27 FRACCION I DE LOPSRM
16	16	LO-009KDH999-N87-2015	LPN-SRO-DCAGI-SC-118/15	SUPERVISIÓN TÉCNICA, ADMINISTRATIVA Y DE CONTROL DE CALIDAD PARA LOS TRABAJOS DE CONSTRUCCIÓN DE LOS CAMINOS PROVISIONALES DE ACCESO AL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO (NAICM), EJECUTANDO TRABAJOS DE TERRACERÍA, ESTRUCTURAS Y OBRAS DE	SUPERVISIÓN TÉCNICA, ADMINISTRATIVA Y DE CONTROL DE CALIDAD PARA LOS TRABAJOS DE CONSTRUCCIÓN DE LOS CAMINOS PROVISIONALES DE ACCESO AL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO (NAICM), EJECUTANDO TRABAJOS DE TERRACERÍA, ESTRUCTURAS Y OBRAS DE	active	2015-12-31 00:00:00	2017-01-03 00:00:00	13970275.44	MXN	2015-12-31 00:00:00	\N	ART. 27 FRACCION I DE LOPSRM
20	19	IO-009KDH999-E15-2016	ITP-OP-DCAGI-SC-012/16	CONSTRUCCIÓN DE ACCESOS Y PLATAFORMAS PARA EXPLORACIÓN GEOTÉCNICA, REHABILITACIÓN DE TRAMOS DE PRUEBA Y BACHEO SOMERO DE CAMINOS EXISTENTES DENTRO DEL TERRENO PARA EL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO	CONSTRUCCIÓN DE ACCESOS Y PLATAFORMAS PARA EXPLORACIÓN GEOTÉCNICA, REHABILITACIÓN DE TRAMOS DE PRUEBA Y BACHEO SOMERO DE CAMINOS EXISTENTES DENTRO DEL TERRENO PARA EL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO	terminated	2016-03-10 00:00:00	2016-06-07 00:00:00	12715541.31	MXN	\N	\N	ART. 27 FRACCIÓN II DE LA LOPSRM
18	17	IO-009KDH999-E96-2015	ITP-SRO-DCAGI-SC-018/16	INTEGRACIÓN DE LA ESTRATEGIA GLOBAL Y MODELO DE NEGOCIOS PARA EL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO	INTEGRACIÓN DE LA ESTRATEGIA GLOBAL Y MODELO DE NEGOCIOS PARA EL NUEVO AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO	active	2016-04-01 00:00:00	2016-11-26 00:00:00	91640000	MXN	2016-03-23 00:00:00	\N	ART. 42 FRACCIÓN XI DE LA LOPSRM
\.


--
-- Name: contract_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('contract_id_seq', 25, true);


--
-- Data for Name: contractamendmentchanges; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY contractamendmentchanges (id, contractingprocess_id, contract_id, property, former_value) FROM stdin;
\.


--
-- Name: contractamendmentchanges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('contractamendmentchanges_id_seq', 1, false);


--
-- Data for Name: contractdocuments; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY contractdocuments (id, contractingprocess_id, contract_id, document_type, documentid, title, description, url, date_published, date_modified, format, language) FROM stdin;
\.


--
-- Name: contractdocuments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('contractdocuments_id_seq', 1, false);


--
-- Data for Name: contractingprocess; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY contractingprocess (id, ocid, fecha_creacion, hora_creacion) FROM stdin;
23	GACM-LO-009KDH999-N80-2015	2016-06-10	14:44:51.465944
1	GACM-LPN-O-DCAGI-SC-014/14	2016-06-10	14:44:17.139362
2	GACM-ITP-OP-DCAGI-SC-014/15	2016-06-10	14:44:17.140325
3	GACM-AD-SRO-DCAGI-SC-009/15	2016-06-10	14:44:17.14059
4	GACM-AD-SRO-DCAGI-SC-005/15	2016-06-10	14:44:17.140889
5	GACM-AD-SRO-DCAGI-SC-013/15	2016-06-10	14:44:17.141102
6	GACM-ITP-SRO-DCAGI-SC-016/15	2016-06-10	14:44:17.14139
7	GACM-ITP-SRO-DCAGI-SC-048/15	2016-06-10	14:44:17.141589
8	GACM-LPN-OP-DCAGI-SC-066/15	2016-06-10	14:44:17.141767
9	GACM-LPN-SRO-DCAGI-SC-043/15	2016-06-10	14:44:17.156157
10	GACM-LPN-SRO-DCAGI-SC-041/15	2016-06-10	14:44:17.15627
11	GACM-LPN-SRO-DCAGI-SC-042/15	2016-06-10	14:44:17.197427
12	GACM-LPN-OP-DCAGI-SC-076/15	2016-06-10	14:44:17.197835
13	GACM-LPI-SRO-DCAGI-SC-079/15	2016-06-10	14:44:17.19801
14	GACM-ITP-SRO-DCAGI-SC-063/15	2016-06-10	14:44:17.198166
15	GACM-LPN-SRO-DCAGI-SC-117/15	2016-06-10	14:44:17.198481
16	GACM-LPN-SRO-DCAGI-SC-118/15	2016-06-10	14:44:17.223294
17	GACM-ITP-SRO-DCAGI-SC-018/16	2016-06-10	14:44:17.231138
18	GACM-AD-SRO-DCAGI-SC-002/16	2016-06-10	14:44:17.232253
19	GACM-ITP-OP-DCAGI-SC-012/16	2016-06-10	14:44:17.235242
20	GACM-AD-SRO-DCAGI-SC-003/16	2016-06-10	14:44:17.237216
21	GACM-LPN-OP-DCAGI-SC-115/15	2016-06-10	14:44:51.460974
22	GACM-LPN-OP-DCAGI-SC-112/15	2016-06-10	14:44:51.465493
24	GACM-LPN-O-DCAGI-SC-024/15	2016-06-10	14:44:51.466147
25	GACM-LPI-SRO-DCAGI-SC-030/15	2016-06-10	14:44:51.466353
\.


--
-- Name: contractingprocess_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('contractingprocess_id_seq', 25, true);


--
-- Data for Name: contractitem; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY contractitem (id, contractingprocess_id, contract_id, itemid, description, classification_scheme, classification_id, classification_description, classification_uri, quantity, unit_name, unit_value_amount, unit_value_currency) FROM stdin;
\.


--
-- Name: contractitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('contractitem_id_seq', 1, false);


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
\.


--
-- Name: implementation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('implementation_id_seq', 25, true);


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

COPY implementationtransactions (id, contractingprocess_id, contract_id, implementation_id, source, implementation_date, value_amount, value_currency, providerorganization_scheme, providerorganization_id, providerorganization_legalname, providerorganization_uri, receiverorganization_scheme, receiverorganization_id, receiverorganization_legalname, receiverorganization_uri, uri) FROM stdin;
\.


--
-- Name: implementationtransactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('implementationtransactions_id_seq', 1, false);


--
-- Data for Name: planning; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY planning (id, contractingprocess_id, rationale) FROM stdin;
2	2	\N
3	3	\N
8	8	\N
12	12	\N
17	18	\N
20	20	\N
11	11	 Implementación del Programa de Rescate de Flora y Fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México
4	4	
5	5	
6	6	
7	7	
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
1	1	
24	24	
25	25	
\.


--
-- Name: planning_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('planning_id_seq', 25, true);


--
-- Data for Name: planningdocuments; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY planningdocuments (id, contractingprocess_id, planning_id, documentid, document_type, title, description, url, date_published, date_modified, format, language) FROM stdin;
\.


--
-- Name: planningdocuments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('planningdocuments_id_seq', 1, false);


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
\.


--
-- Name: procuringentity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('procuringentity_id_seq', 25, true);


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
\.


--
-- Name: publisher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('publisher_id_seq', 25, true);


--
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY supplier (id, contractingprocess_id, award_id, name, identifier_scheme, identifier_id, identifier_legalname, identifier_uri, address_streetaddress, address_locality, address_region, address_postalcode, address_countryname, contactpoint_name, contactpoint_email, contactpoint_telephone, contactpoint_faxnumber, contactpoint_url) FROM stdin;
3	3	\N	ESPECIALISTAS AMBIENTALES	Servicios Relacionados con la OP	\N	ESPECIALISTAS AMBIENTALES	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	10	\N	SUPERVISION Y CONTROL DE FAUNA S.A. DE C.V.	Servicios Relacionados con la OP	\N	SUPERVISION Y CONTROL DE FAUNA S.A. DE C.V.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11	11	\N	RAGAMEX CONSTRUCTORES, S.A. DE C.V.	Servicios Relacionados con la OP	\N	RAGAMEX CONSTRUCTORES, S.A. DE C.V.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15	15	\N	CONSULTORIA, SUPERVISION TECNICA Y OPERACION EN SISTEMAS, S.A. DE C.V.	Servicios Relacionados con la OP	\N	CONSULTORIA, SUPERVISION TECNICA Y OPERACION EN SISTEMAS, S.A. DE C.V.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16	16	\N	CONSULTORIA, SUPERVISION TECNICA Y OPERACION EN SISTEMAS, S.A. DE C.V.	Servicios Relacionados con la OP	\N	CONSULTORIA, SUPERVISION TECNICA Y OPERACION EN SISTEMAS, S.A. DE C.V.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17	20	\N	INGENIERIA Y PROCESAMIENTO ELECTRONICO SA DE CV	Servicios Relacionados con la OP	\N	INGENIERIA Y PROCESAMIENTO ELECTRONICO SA DE CV	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18	19	\N	CONSTRUCCIONES ALDESEM, S.A. DE C.V.	Obra Pública	\N	CONSTRUCCIONES ALDESEM, S.A. DE C.V.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
29	24	\N	CONSTRUCCIONES ALDESEM, S.A. DE C.V.			CONSTRUCCIONES ALDESEM, S.A. DE C.V.						México					
2	2	\N	INGENIEROS CIVILES ASOCIADOS, S.A. DE C.V.	Obra Pública	\N	INGENIEROS CIVILES ASOCIADOS, S.A. DE C.V.	https://www.ica.com.mx/es_ES/web/ica/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	4	\N	INSTITUTO DE INVESTIGACION Y CAPACITACION PARA LAS CIENCIAS BIOLOGICAS, A.C.	Servicios Relacionados con la OP	\N	INSTITUTO DE INVESTIGACION Y CAPACITACION PARA LAS CIENCIAS BIOLOGICAS, A.C.	http://www.iiccbiologicas.org/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	5	\N	SISTEMAS INTEGRALES DE GESTION AMBIENTAL SC	Servicios Relacionados con la OP	\N	SISTEMAS INTEGRALES DE GESTION AMBIENTAL SC	http://www.sigea.com.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	7	\N	IUYET, S.A. DE C.V.	Servicios Relacionados con la OP	\N	IUYET, S.A. DE C.V.	http://www.iuyet.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	6	\N	AVALUOS, EVALUACIONES Y PROYECTOS, S.A. DE C.V.	Servicios Relacionados con la OP	\N	AVALUOS, EVALUACIONES Y PROYECTOS, S.A. DE C.V.	http://aep.com.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	8	\N	ACCIONES GRUPO DE ORO, S.A. DE C.V.	Obra Pública	\N	ACCIONES GRUPO DE ORO, S.A. DE C.V.	http://www.grupodeoro.com.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	9	\N	MANEJO INTEGRAL DE CUENCA S.A. DE C.V.	Servicios Relacionados con la OP	\N	MANEJO INTEGRAL DE CUENCA S.A. DE C.V.	http://www.micas-cuencas.com/website/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12	12	\N	CALZADA CONSTRUCCIONES, S.A. DE C.V.	Obra Pública	\N	CALZADA CONSTRUCCIONES, S.A. DE C.V.	http://www.grupoventer.com.mx/calco/v2/main-frame.php	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13	13	\N	AUTODESK, INC.,	Servicios Relacionados con la OP	\N	AUTODESK, INC.,	http://www.autodesk.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14	14	\N	SIFRA Y ASOCIADOS, S.A. DE C.V.	Servicios Relacionados con la OP	\N	SIFRA Y ASOCIADOS, S.A. DE C.V.	http://www.sifra.com.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19	18	\N	GLM COMUNICACIONES SA DE CV	Servicios Relacionados con la OP	\N	GLM COMUNICACIONES SA DE CV	http://www.glm.com.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20	17	\N	BCG-THE BOSTON CONSULTING GROUP, S.C.	Servicios Relacionados con la OP	\N	BCG-THE BOSTON CONSULTING GROUP, S.C.	http://www.bcg.com.mx/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
27	22	\N	COCONAL S.A.P.I. DE C.V.	Servicios		COCONAL S.A.P.I. DE C.V.	http://www.coconal.com/					México					
30	25	\N	ADVANCED LOGISTICS GROUP	Servicios		ADVANCED LOGISTICS GROUP											
1	1	\N	GEXIQ, S.A. DE C.V.	Servicios	\N	GEXIQ, S.A. DE C.V.	http://gexiq.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
26	21	\N	OMEGA CONSTRUCCIONES INDUSTRIALES, S.A. DE C.V.	Servicios		OMEGA CONSTRUCCIONES INDUSTRIALES, S.A. DE C.V.	http://grupo-omega.com/					México					
32	21	\N	CONSTRUCCIONES Y DRAGADOS DEL SURESTE, S.A. DE C.V.	Servicios		CONSTRUCCIONES Y DRAGADOS DEL SURESTE, S.A. DE C.V.	http://www.grupohycsa.mx/cydssa/					México					
31	21	\N	CALZADA CONSTRUCCIONES, S.A. DE C.V.	Servicios		CALZADA CONSTRUCCIONES, S.A. DE C.V.						México					http://www.grupoventer.com.mx/calco/v2/main-frame.php
34	25	\N	INDRA BUSINESS CONSULTING MÉXICO, S.A. DE C.V.			INDRA BUSINESS CONSULTING MÉXICO, S.A. DE C.V.	http://www.indracompany.com/										
33	23	\N	INMOBILIARIOS MEXICANOS, S.A. DE C.V.			INMOBILIARIOS MEXICANOS, S.A. DE C.V.						México					
28	23	\N	TRANPORTES CONTRUCCIONES TAMAULIPECOS, S.A. DE C.V.	Servicios		TRANPORTES CONTRUCCIONES TAMAULIPECOS, S.A. DE C.V.						México					
\.


--
-- Name: supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('supplier_id_seq', 34, true);


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
4	4	798885	Prestación de los Servicios consistentes en la elaboración del: “Plan de Acciones de monitoreo y conservación de aves para el Nuevo Aeropuerto Internacional de la Ciudad de México”.	Prestación de los Servicios consistentes en la elaboración del: “Plan de Acciones de monitoreo y conservación de aves para el Nuevo Aeropuerto Internacional de la Ciudad de México”.	complete	0		522000.00	MXN	Adjudicación Directa.	Artículo 43 de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.			Presencial		\N	\N	\N	\N	0		\N	\N	0	\N	
11	11	824118	Implementación del Programa de Rescate de Flora y Fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México	Implementación del Programa de Rescate de Flora y Fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México	complete	0		12300000.00	MXN	Licitación Pública	Artículo 27, segundo párrafo de la Ley de Obras Públicas y Servicios Relacionados con las Mismas	Nacional 		Presencial		\N	\N	2015-06-18 00:00:00	2015-06-18 00:00:00	1		\N	\N	4	\N	
15	15	943228	Supervisión Técnica, Administrativa y de Control de calidad para los trabajos de nivelación y limpieza del terreno del Nuevo aeropuerto internacional de la Ciudad de México.	Supervisión Técnica, Administrativa y de Control de calidad para los trabajos de nivelación y limpieza del terreno del Nuevo aeropuerto internacional de la Ciudad de México.	complete	0		17000000	MXN	Licitación Pública Nacional 	Articulos 27, fracción I, 30, fracción I, y 45, fracción I, de la Ley de Obras Públicas y Servcios Relacionados con las Mismas.  			Presencial		\N	2016-06-18 00:00:00	2015-11-26 00:00:00	2015-11-27 00:00:00	1		\N	\N	25	\N	
5	5	798985	Plan de Monitoreo, registro y verificación de emisión de gases de efecto invernadero para el Nuevo Aeropuerto Internacional de la Ciudad de México.	Plan de Monitoreo, registro y verificación de emisión de gases de efecto invernadero para el Nuevo Aeropuerto Internacional de la Ciudad de México.	complete	0		539400.00	MXN	Adjudicación Directa	Artículo 43 de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.					\N	\N	\N	\N	0		\N	\N	1	\N	
6	6	761895	Servicios de supervisión para la obra: extracción de ademes y restitución del terreno que ocupan dichos elementos ubicados en la poligonal para el Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	Servicios de supervisión para la obra: extracción de ademes y restitución del terreno que ocupan dichos elementos ubicados en la poligonal para el Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	complete	0		2680000	MXN	Invitación a cuando menos tres personas	Artículo 27 fracción II y artículo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas	Invitación Nacional a Cuando Menos Tres Personas No. IO-009KDH99-N10-2015 relativa a la supervisión para la obra: Extracción de ademes y restitución del terreno que ocupan dichos elementos ubicados en la poligonal para el Nuevo Aeropuerto Internacional de la Ciudad de México publicada en CompraNet el 12 de febrero de 2015	Invitación Nacional a Cuando Menos Tres Personas No. IO-009KDH99-N10-2015 relativa a la supervisión para la obra: Extracción de ademes y restitución del terreno que ocupan dichos elementos ubicados en la poligonal para el Nuevo Aeropuerto Internacional de la Ciudad de México publicada en CompraNet el 12 de febrero de 2015	Presencial		\N	\N	\N	\N	0		\N	\N	4	\N	
9	10	830152	Plan de Monitoreo y Conservación de Aves del Proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México	Plan de Monitoreo y Conservación de Aves del Proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México	complete	0		29000000.00	MXN	Licitación Pública	Artículo 27, segundo párrafo de la Ley de Obras Públicas y Servicios Relacionados con las Mismas					\N	\N	2015-06-19 00:00:00	2015-06-19 00:00:00	1		\N	\N	3	\N	
14	14	865741	Invitación a cuando menos tres personas No. IO-009KDH999-N54-2015, para el servicio: "Supervisión para: Construcción del proyecto integral consistente en barda y camino perimetral, alumbrado, servicios inducidos y casetas de acceso para el NAICM (PRIMERA ETAPA)."	Supervisión para: Construcción del proyecto integral consistente en barda y camino perimetral, alumbrado, servicios inducidos y casetas de acceso para el NAICM (PRIMERA ETAPA)	complete	0		4000000	MXN	Invitación a cuando menos tres personas No. IO-009KDH999-N54-2015	Artículos 27, fracción II, 30, fracción I, 36, 37, 38, 39 y 45, fracción I, de la Ley de Obras Públicas y Servicios Relacionados con las Misma.			Presencial		\N	\N	2015-08-07 00:00:00	2015-08-07 00:00:00	1		\N	\N	5	\N	
7	7	799484	Estudio e instalaciones complementarias para el de las características topográficas del terreno del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	Estudio e instalaciones complementarias para el de las características topográficas del terreno del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	complete	0		39000000	MXN	Invitación a cuando menos tres personas	Artículo 42 fracción XI de la Ley de Obras Públicas y servicios Relacionados con las Mismas			Presencial		\N	\N	2015-06-08 00:00:00	2015-06-23 00:00:00	1		\N	\N	7	\N	
13	13	842194	Diseñar e instrumentar el modelo virtual de información para la construcción (BIM) del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	Diseñar e instrumentar el modelo virtual de información para la construcción (BIM) del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	complete	0		121700000	MXN	Licitación Pública Internacional Bajo TLC LOPSRM	Articulos 27 fracción I, 30 fracción II y 45 fracción I de la LOPSRM.			Presencial		\N	\N	2015-07-23 00:00:00	2015-07-28 00:00:00	1		\N	\N	5	\N	
19	19	996706	Construcción de accesos y plataformas para exploración geotécnica, rehabilitación de tramos de prueba y bacheo somero de caminos existentes dentro del terreno par el Nuevo Aeropuerto Internacional de la Ciudad de México	Construcción de accesos y plataformas para exploración geotécnica, rehabilitación de tramos de prueba y bacheo somero de caminos existentes dentro del terreno par el Nuevo Aeropuerto Internacional de la Ciudad de México	complete	0		1276500	MXN	Invitación a cuando menos tres personas	Artículo 27 fracción II y artículo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas			Presencial		2016-02-25 00:00:00	\N	2016-02-16 00:00:00	2016-02-16 00:00:00	1		\N	\N	4	\N	
18	17	971461	Servicio de integración de la estrategia global y modelo de negocios para el Nuevo Aeropuerto Internacional de la Ciudad de México	Servicio de integración de la estrategia global y modelo de negocios para el Nuevo Aeropuerto Internacional de la Ciudad de México	complete	0		122000000	MXN	Invitación a cuando menos tres personas	Artículo 27 fracción II y artículo 42 fracción XI de la Ley de Obras Públicas y Servicios Relacionados con las Mismas			Presencial		2016-02-22 00:00:00	\N	2016-01-19 00:00:00	2016-01-19 00:00:00	1		\N	\N	2	\N	
2	2	0			none	0		9429941.46	MXN	Invitación a cuando menos tres personas						\N	\N	\N	\N	0		\N	\N	0	\N	
3	3	0			none	0		638000	MXN	Adjudicación Directa						\N	\N	\N	\N	0		\N	\N	0	\N	
8	8	0			none	0		129973731.2	MXN	Licitación Pública						\N	\N	\N	\N	0		\N	\N	0	\N	
17	18	0			none	0		4286458.44	MXN	Adjudicación Directa						\N	\N	\N	\N	0		\N	\N	0	\N	
12	12	0			none	0		223329692.62	MXN	Licitación Pública						\N	\N	\N	\N	0		\N	\N	0	\N	
10	9	830617	Implementación del plan de restauración ecológica para el Nuevo Aeropuerto Internacional de la Ciudad de México.	Implementación del plan de restauración ecológica para el Nuevo Aeropuerto Internacional de la Ciudad de México.	complete	0		26000000	MXN	Licitación Pública	Artículos 27, fracción I, 30, fracción I, 36, 37, 38, 39 y 45, fracción I, de la Ley de Obras Públicas y Servicios Relaciondos con las Mismas	Capitulo 2-Licitación Pública Nacional (numerales 2.13 y 2.14) de la Convocatoria a la Licitación Pública Nacional No. LO-009KDH999-N45-2015, para llevar a cabo los trabajos de “Implementación del plan de restauración ecológica para el Nuevo Aeropuerto Internacional de la Ciudad de México”, aplicando el mecanismo de evaluación de puntos y porcentajes, publicada en compraNet el día 12 de junio del 2015.		Presencial		2015-06-26 00:00:00	\N	2015-06-19 00:00:00	2015-06-19 00:00:00	1	Capitulo 2-Licitación Pública Nacional de la Convocatoria a la Licitación Pública Nacional No. LO-009KDH999-N45-2015, para llevar a cabo los trabajos de “Implementación del plan de restauración ecológica para el Nuevo Aeropuerto Internacional de la Ciudad de México”, aplicando el mecanismo de evaluación de puntos y porcentajes, publicada en compraNet el día 12 de junio del 2015.	\N	\N	4	\N	
16	16	943233	Supervisión Técnica, Administrativa y de Control de calidad para los Trabajos de Construcción de los Caminos Provisionales de Acceso al Nuevo Aeropuerto Internacional de la Ciudad de México.	Supervisión Técnica, Administrativa y de Control de calidad para los Trabajos de Construcción de los Caminos Provisionales de Acceso al Nuevo Aeropuerto Internacional de la Ciudad de México.	complete	0		20000000	MXN	Licitación Pública Nacional 	Articulos 27, fracción I, 30, fracción I, y 45, fracción I, de la Ley de Obras Públicas y Servcios Relacionados con las Mismas. 			Presencial		2015-12-10 00:00:00	\N	2015-11-27 00:00:00	2015-12-02 00:00:00	1		\N	\N	24	\N	
22	22	911933	Nivelación y limpieza del terreno del Nuevo Aeropuerto Internacional de la Ciudad de México	Nivelación y limpieza del terreno del Nuevo Aeropuerto Internacional de la Ciudad de México	complete	0		3950000000	MXN	Licitación Pública Nacional 	Articulos 27, fracción I, 30, fracción I, y 45, fracción I, de la Ley de Obras Públicas y Servcios Relacionados con las Mismas.  	Puntos y porcentajes	Capitulo 2 -De la Licitación de la Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N79-2015.	Presencial		2015-11-12 00:00:00	\N	2015-10-14 00:00:00	2015-10-29 00:00:00	1	Capitulo 2 -De la Licitación de la Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N79-2015.	\N	\N	31	\N	
21	21	910393	Carga, acarreo y descarga fuera del polígono del material existente producto de depósitos de demoliciones, desperdicios y desazolve.	Carga, acarreo y descarga fuera del polígono del material existente producto de depósitos de demoliciones, desperdicios y desazolve.	complete	0		770000000	MXN	Licitación Pública Nacional 	Articulos 27, fracción I, 30, fracción I, y 45, fracción I, de la Ley de Obras Públicas y Servcios Relacionados con las Mismas.  	Capitulo 2-De la licitación (numeral 2.14) de la Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N78-2015, de fecha 24 de septiembre de 2015. Las bases se publicaron en CompraNet el día 29 de septiembre del 2015.		Presencial		2015-11-09 00:00:00	\N	2015-10-07 00:00:00	2015-10-27 00:00:00	1	Capitulo 2-De la licitación de la Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N78-2015, de fecha 24 de septiembre de 2015. Las bases se publicaron en CompraNet el día 29 de septiembre del 2015.	\N	\N	40	\N	
23	23	911935	Construcción de los caminos provisionales de acceso al Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM) ejecutando trabajos de terracería, estructuras y obrad de drenaje, pavimentación y señalamiento.	Construcción de los caminos provisionales de acceso al Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM) ejecutando trabajos de terracería, estructuras y obrad de drenaje, pavimentación y señalamiento.	complete	0		1203803000.00	MXN	Licitación Pública Nacional 	Articulos 27, fracción I, 30, fracción I, y 45, fracción I, de la Ley de Obras Públicas y Servcios Relacionados con las Mismas. 	Puntos y porcentajes	Capitulo 2-De la Licitación (numeral 2.14) de la Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N80-2015 de fecha 29 de septiembre de 2015.	Presencial		2015-11-13 00:00:00	\N	2015-10-09 00:00:00	2015-11-05 00:00:00	1	Capitulo 2-De la Licitación de la Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N80-2015 de fecha 29 de septiembre de 2015.	\N	\N	48	\N	
25	25	781926	Estudio mediante el cual se definan las características técnicas de infraestructura y diseño esquemático de la terminal de carga del Nuevo Aeropuerto Internacional de la Ciudad de México.	Estudio mediante el cual se definan las características técnicas de infraestructura y diseño esquemático de la terminal de carga del Nuevo Aeropuerto Internacional de la Ciudad de México.	complete	0		16000000	MXN	Licitación Pública Internacional Bajo TLC LOPSRM	Artículos 27 fracción I, 30 fracción II, y 45 fracción II de la LOPSRM.	Ponderación de puntos (Puntos y porcentajes)	Capítulos 2.13 y 2.14 de la Convocatoria de licitación pública internacional presencial, bajo la cobertura de tratados identificada con el número LO-009KDH999-T15-2015, para llevar a cabo el “Estudio mediante el cual se definan las características técnicas de infraestructura y diseño esquemático de la terminal de carga del Nuevo Aeropuerto Internacional de la Ciudad de México”, publicada en compraNet el día 25 de marzo del 2015.	Presencial		2015-04-30 00:00:00	\N	2015-04-08 00:00:00	2015-04-08 00:00:00	1	Capítulos 2.10 y 2.11 de la Convocatoria de licitación pública internacional presencial, bajo la cobertura de tratados identificada con el número LO-009KDH999-T15-2015, para llevar a cabo el “Estudio mediante el cual se definan las características técnicas de infraestructura y diseño esquemático de la terminal de carga del Nuevo Aeropuerto Internacional de la Ciudad de México”, publicada en compraNet el día 25 de marzo del 2015.	\N	\N	3	\N	
1	1	717913	Extracción de ademes y restitución del terreno que ocupan dichos elementos ubicados en la poligonal para el Nuevo Aeropuerto Internacional de la Cuidad de México.	Extracción de ademes y restitución del terreno que ocupan dichos elementos ubicados en la poligonal para el Nuevo Aeropuerto Internacional de la Cuidad de México.	complete	0		54520000.00	MXN	Licitación Pública Nacional 	Artículos 27, fracción I, 30 fracción I, 38 y 45 fracción I de la LOPSRM; y 63 fracción I, del ROPSRM	Capítulo 2.13 y 2.14 de la Convocatoria para la Licitación Pública Nacional Presencial No. LO-009KDH999-N5-2014, para los trabajos relativos a la Extracción de ademes y restitución del terreno que ocupan dichos elementos ubicados en la poligonal para el Nuevo Aeropuerto Internacional de la Cuidad de México	Capítulo 2.10 y 2.11 de la Convocatoria para la Licitación Pública Nacional Presencial No. LO-009KDH999-N5-2014, para los trabajos relativos a la Extracción de ademes y restitución del terreno que ocupan dichos elementos ubicados en la poligonal para el Nuevo Aeropuerto Internacional de la Cuidad de México	Presencial		2014-12-15 00:00:00	\N	2014-12-03 00:00:00	2014-12-05 00:00:00	1	Capítulo 2.10 y 2.11 de la Convocatoria para la Licitación Pública Nacional Presencial No. LO-009KDH999-N5-2014, para los trabajos relativos a la Extracción de ademes y restitución del terreno que ocupan dichos elementos ubicados en la poligonal para el Nuevo Aeropuerto Internacional de la Cuidad de México	\N	\N	8	\N	
24	24	790388	Construcción de accesos y plataformas para exploración geotécnica para la pista número 2 del Nuevo Aeropuerto Internacional de la Ciudad de México.	Construcción de accesos y plataformas para exploración geotécnica para la pista número 2 del Nuevo Aeropuerto Internacional de la Ciudad de México.	complete	0		10400000.00	MXN	Licitación Pública Nacional 	Artículos 27, fracción I, 30 fracción I, 38 y 45 fracción I de la LOPSRM y 63 fracción I del RLOPSRM.	Binario	Capítulos 2.13 y 2.14 de la Convocatoria para la Licitación Pública Nacional Presencial No. No.  LO-009KDH999-N20-2015, aplicando el mecanismo binario para la Construcción de accesos y plataformas para exploración geotécnica para la pista No. 2 del Nuevo Aeropuerto Internacional de la Ciudad de México	Presencial		\N	\N	\N	\N	1	Capítulos 2.10 y 2.11 de la Convocatoria para la Licitación Pública Nacional Presencial No. No.  LO-009KDH999-N20-2015, aplicando el mecanismo binario para la Construcción de accesos y plataformas para exploración geotécnica para la pista No. 2 del Nuevo Aeropuerto Internacional de la Ciudad de México	\N	\N	12	\N	
20	20	0			none	0		0	MXN	Adjudicación Directa						\N	\N	\N	\N	0		\N	\N	0	\N	
\.


--
-- Name: tender_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('tender_id_seq', 25, true);


--
-- Data for Name: tenderamendmentchanges; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY tenderamendmentchanges (id, contractingprocess_id, tender_id, property, former_value) FROM stdin;
\.


--
-- Name: tenderamendmentchanges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('tenderamendmentchanges_id_seq', 1, false);


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
\.


--
-- Name: tenderitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('tenderitem_id_seq', 1, true);


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
\.


--
-- Name: tendermilestone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('tendermilestone_id_seq', 1, true);


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
-- Name: award_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY award
    ADD CONSTRAINT award_pkey PRIMARY KEY (id);


--
-- Name: awardamendmentchanges_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY awardamendmentchanges
    ADD CONSTRAINT awardamendmentchanges_pkey PRIMARY KEY (id);


--
-- Name: awarddocuments_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY awarddocuments
    ADD CONSTRAINT awarddocuments_pkey PRIMARY KEY (id);


--
-- Name: awarditem_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY awarditem
    ADD CONSTRAINT awarditem_pkey PRIMARY KEY (id);


--
-- Name: awarditemadditionalclassifications_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY awarditemadditionalclassifications
    ADD CONSTRAINT awarditemadditionalclassifications_pkey PRIMARY KEY (id);


--
-- Name: budget_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY budget
    ADD CONSTRAINT budget_pkey PRIMARY KEY (id);


--
-- Name: buyer_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY buyer
    ADD CONSTRAINT buyer_pkey PRIMARY KEY (id);


--
-- Name: buyeradditionalidentifiers_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY buyeradditionalidentifiers
    ADD CONSTRAINT buyeradditionalidentifiers_pkey PRIMARY KEY (id);


--
-- Name: contract_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY contract
    ADD CONSTRAINT contract_pkey PRIMARY KEY (id);


--
-- Name: contractamendmentchanges_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY contractamendmentchanges
    ADD CONSTRAINT contractamendmentchanges_pkey PRIMARY KEY (id);


--
-- Name: contractdocuments_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY contractdocuments
    ADD CONSTRAINT contractdocuments_pkey PRIMARY KEY (id);


--
-- Name: contractingprocess_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY contractingprocess
    ADD CONSTRAINT contractingprocess_pkey PRIMARY KEY (id);


--
-- Name: contractitem_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY contractitem
    ADD CONSTRAINT contractitem_pkey PRIMARY KEY (id);


--
-- Name: contractitemadditionalclasifications_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY contractitemadditionalclasifications
    ADD CONSTRAINT contractitemadditionalclasifications_pkey PRIMARY KEY (id);


--
-- Name: implementation_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY implementation
    ADD CONSTRAINT implementation_pkey PRIMARY KEY (id);


--
-- Name: implementationdocuments_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY implementationdocuments
    ADD CONSTRAINT implementationdocuments_pkey PRIMARY KEY (id);


--
-- Name: implementationmilestone_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY implementationmilestone
    ADD CONSTRAINT implementationmilestone_pkey PRIMARY KEY (id);


--
-- Name: implementationmilestonedocuments_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY implementationmilestonedocuments
    ADD CONSTRAINT implementationmilestonedocuments_pkey PRIMARY KEY (id);


--
-- Name: implementationtransactions_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY implementationtransactions
    ADD CONSTRAINT implementationtransactions_pkey PRIMARY KEY (id);


--
-- Name: planning_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY planning
    ADD CONSTRAINT planning_pkey PRIMARY KEY (id);


--
-- Name: planningdocuments_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY planningdocuments
    ADD CONSTRAINT planningdocuments_pkey PRIMARY KEY (id);


--
-- Name: procuringentity_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY procuringentity
    ADD CONSTRAINT procuringentity_pkey PRIMARY KEY (id);


--
-- Name: procuringentityadditionalidentifiers_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY procuringentityadditionalidentifiers
    ADD CONSTRAINT procuringentityadditionalidentifiers_pkey PRIMARY KEY (id);


--
-- Name: publisher_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY publisher
    ADD CONSTRAINT publisher_pkey PRIMARY KEY (id);


--
-- Name: supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (id);


--
-- Name: supplieradditionalidentifiers_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY supplieradditionalidentifiers
    ADD CONSTRAINT supplieradditionalidentifiers_pkey PRIMARY KEY (id);


--
-- Name: tender_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY tender
    ADD CONSTRAINT tender_pkey PRIMARY KEY (id);


--
-- Name: tenderamendmentchanges_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY tenderamendmentchanges
    ADD CONSTRAINT tenderamendmentchanges_pkey PRIMARY KEY (id);


--
-- Name: tenderdocuments_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY tenderdocuments
    ADD CONSTRAINT tenderdocuments_pkey PRIMARY KEY (id);


--
-- Name: tenderer_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY tenderer
    ADD CONSTRAINT tenderer_pkey PRIMARY KEY (id);


--
-- Name: tendereradditionalidentifiers_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY tendereradditionalidentifiers
    ADD CONSTRAINT tendereradditionalidentifiers_pkey PRIMARY KEY (id);


--
-- Name: tenderitem_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY tenderitem
    ADD CONSTRAINT tenderitem_pkey PRIMARY KEY (id);


--
-- Name: tenderitemadditionalclassifications_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY tenderitemadditionalclassifications
    ADD CONSTRAINT tenderitemadditionalclassifications_pkey PRIMARY KEY (id);


--
-- Name: tendermilestone_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY tendermilestone
    ADD CONSTRAINT tendermilestone_pkey PRIMARY KEY (id);


--
-- Name: tendermilestonedocuments_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
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

