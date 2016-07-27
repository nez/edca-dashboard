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
    transactionid text,
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
90	90	 LO-009KDH999-N20-2015	Construcción de accesos y plataformas para exploración geotécnica para la pista número 2 del Nuevo Aeropuerto Internacional de la Ciudad de México.	Construcción de accesos y plataformas para exploración geotécnica para la pista número 2 del Nuevo Aeropuerto Internacional de la Ciudad de México.	active	2015-04-24 00:00:00	5038656	MXN	2015-04-24 00:00:00	\N	\N	
37	37	-			active	\N	14925328.00	MXN	\N	\N	\N	
54	54	SA-009KDH999-N48-2015			active	\N	22440896.4		\N	\N	\N	
24	24	-			active	\N	236900000.00	MXN	\N	\N	\N	
21	21	SA-009KDH999-N12-2015	Oficio UNCP/309/BMACP/0796/2014 de fecha 26 de septiembre de 2014	Con fundamento en lo dispuesto en los artículos 27 Bis, primer párrado de la Ley de Obras Públicas y Servicios Relacionados con las Mismas; 52, primer párrafo y 53, quinto párrafo de su reglamento; y 34, fracción XVII del Reglamento Interior de la Secretaría de la Función Pública.	active	2014-09-26 00:00:00	539531.22	MXN	\N	\N	\N	
25	25	SO-009KDH999-N74-2015	Oficio DCAGI/SC/GC/16B/2015 del 28 de enero de 2015	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 42 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, 28, 29 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3.1 del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., y a solicitud expresa de la Dirección Corporativa de Infraestructura, se le adjudica de manera directa la prestación del servicio relacionado con la obra pública a Grupo de Ingenieía en Consultoría en obras, S. A. de C. V.	active	2015-01-28 00:00:00	16708712.52	MXN	\N	\N	\N	
62	62	ITP-SRO-DCAGI-SC-037/15	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM,se adjudicó el contrato a la empresa CAL Y MAYOR Y ASOCIADOS, S.C., por un importe de $5´997,988.52, monto sin considerar el IVA, por resultar se la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2015-05-29 00:00:00	5997988.52	MXN	\N	\N	\N	
71	71	-			active	\N	6610000	MXN	\N	\N	\N	
22	22	-			active	\N	227520000.00	MXN	\N	\N	\N	
61	61	IO-009KDH999-N51-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudicó el contrato a la empresa F GLEZ CONSULTORES Y ASOCIADOS, S.A. DE C.V., por un importe de $8´150,489.03, monto sin considerar el IVA, por resultar se la propuesta que al ser evaluada técnica y ecómicamente, asegura las mejores condiciones disponibles en cuanto a precio, calidad, financiamiento, oportunidad; toda vez que es la empresa que presenta los costos mas bajos.	active	2015-07-16 00:00:00	8150489	MXN	\N	\N	\N	
1	1	AA-009KDH999-E2-2016			active	\N	800000.00	MXN	\N	\N	\N	
3	3	1	Oficio número DCAGI/SC/GC/023/2016 de fecha 3 de febrero de 2016.	Con fundamento en el Articulo 134 de la Cosntitucion Poltica de los estados Unidos Mexicanos, 42 de la Ley de Adquisisciones, Arrendamientos y Servicios del Sector Público, Numeral 1.4.3.1 del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S. A. de C. V. , se le adjudica en forma directa  al Instituto Mexicano de Auditoria S. C:, el servicio para llevar a cabo el testimonio del procedimiento de Licitación Pública Nacional, del proyecto denominado "Excavación de Prueba, Losa Exprimental y Prueba de Pilotes para el Edificio terminal y Torre de Control".	active	2016-02-03 00:00:00	269225.44	MXN	\N	\N	\N	
73	73	-			none	\N	13051740.00	MXN	\N	\N	\N	
26	26	No. IO-009KDH999-N76-2015	Acta de emisión de fallo	Con fundamento en lo dispuesto en los artículos 40 de la LOPSRM y 71, de su Reglamento, se declara desierta la presente invitación a cuando menos tres personas No. IO-009KDH999-N76-2015 para los trabajos relativos a Supervisión del Proyecto Ejecutivo, Construcción, Equipamiento, Mobiliario e Instalaciones Complementarias para el Campamento del Grupo Aeropuertario de la Ciudad de México (GACM) en el sitio del Nuevo Aeropuerto Internacional de la Ciudad de México, ya que la totalidad de las proposiciones presentadas no reunen los requisitos solicitados en la convocatoria.	active	2015-11-05 00:00:00	3695222.82	MXN	\N	\N	\N	
23	23	-			active	\N	0		\N	\N	\N	
27	27	SO-009KDH999-N32-2015			active	\N	29233731.65	MXN	\N	\N	\N	
2	2	SA009KDH99-N73-2015	Oficio DCAGI/SC/GC/055/2015 de fecha 30 de junio de 2015	Con fundamento en el art. 134 de la Constitución, art. 26 fracción II de la LAASSP se le adjudica de manera directa el contrato.	active	2015-06-30 00:00:00	247200.64	MXN	\N	\N	\N	
8	8	AO-009KDH999-E39-2016			active	\N	1465517.24	MXN	\N	\N	\N	
74	74	-			none	\N	10954142.71	MXN	\N	\N	\N	
7	7	1			active	\N	1627500.00	MXN	\N	\N	\N	
75	75	-			none	\N	2697000.00	MXN	\N	\N	\N	
72	72	-			active	\N	55525000000		\N	\N	\N	
12	12	1			active	\N	189000.00	USD	\N	\N	\N	
28	28	-			active	\N	1495000.00	USD	\N	\N	\N	
14	14	AO-009KDH999-E34-2016			active	\N	1898750.00	MXN	\N	\N	\N	
13	13	1			active	\N	1403017.24	MXN	\N	\N	\N	
15	15	AO-009KDH999-E41-2016	Oficio de la notificación de la adjudicación 		active	\N	1403017.24	MXN	\N	\N	\N	
18	18	AO-009KDH999-E46-2016			active	\N	176400.00	USD	\N	\N	\N	
16	16	AO-009KDH999-E31-2016			active	\N	1683620.69	MXN	\N	\N	\N	
17	17	AO-009KDH999-E40-2016			active	\N	2104525.86	MXN	\N	\N	\N	
33	33	SO-009KDH999-N17-2015			active	\N	550000.00	MXN	\N	\N	\N	
66	66	LO-009KDH999-N16-2015	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato a la empresa Currie & Brown México S. A. de C. V., por un importe de $7,582,404.32 monto sin considerar el IVA, por ser la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2015-04-30 00:00:00	7582404.32	MXN	\N	\N	\N	
42	42	-			active	\N	0	MXN	\N	\N	\N	
44	44	-	-	-	none	\N	3246873.25	mxn	\N	\N	\N	
45	45	-	-	-	active	2016-07-15 00:00:00	0		\N	\N	\N	
46	46	-	-	-	none	\N	0	MXN	\N	\N	\N	
47	47	-	-	-	active	\N	0		\N	\N	\N	
51	51	AA-009KDH999-E70-2016	Oficio de Adjudicación		active	\N	262931	MXN	\N	\N	\N	
57	57	AA-009KDH999-E63-2016	Oficio de notificación de Adjudicación Directa 		active	\N	0		\N	\N	\N	
38	38	-			active	\N	34800000.00	MXN	\N	\N	\N	
39	39	-			active	\N	8991688.20	MXN	\N	\N	\N	
40	40	-			active	\N	0.00	MXN	\N	\N	\N	
4	4	1		Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 27 fracción III y 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, 28, 29 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3. del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., y a solicitud expresa de la Dirección Corporativa de Infraestructura, se le adjudica de manera directa la prestación del servicio relacionado con la obra pública a Sistemas Integrales de Gestión Ambiental, S.C.	active	\N	1627500.00	MXN	\N	\N	\N	
5	5	AA-009KDH999-E10-2016	Oficio de notificación de Adjudicación Directa DCAGI/SC/GC/0137/2015 del 09-09-2015	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 41 fracción XIV de la Ley de Adquisiciones, Arrendamientos y Servidos del Sector Público, 28, 29, 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3.1 del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., por instrucciones del Subdirector de Contrataciones y de la solicitud que se efectuó mediante el oficio No. GACM/DG/DCPVE/0121/2015, por el Director Corporativo de Planeación, Vinculación y Evaluación, con el fin de que se contrate Vía Adjudicación Directa, la "Contratación de servicios de un profesionista especializado en temas de desarrollo urbano, territorial y regional para el proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México"; en la Quinta Sesión Extraordinaria del Comité de Adquisiciones, Arrendamientos y Servicios de GACM de fecha 08 de septiembre de.2015, fue dictaminada procedente la excepción de Licitación Pública para la contratación vía Adjudicación Directa, de la que se adjudicó a Ing. Gabriel Cuadri de la Torre.	active	2015-09-09 00:00:00	405000.00	MXN	\N	\N	\N	
6	6	AO-009KDH999-E38-2016	Oficio número DCAGI/SC/GC/0168/2015 del 08/09/2015	Con fundamento en el artículo 134 de la CPEUM, 42, fracción X de la LOPSRM, 28, 29, 30, 31 y 33 de la LFEP, numeral 1.4.3.1 del Manual de Organización de GACM, se adjudica el contrato al ciudadano Enrique Álvaro Tamez González.	active	2015-09-08 00:00:00	2104525.86	MXN	\N	\N	\N	
89	89	LO-009KDH999- N47-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato al consorcio integrado por Acciones Grupo Oro, S.A. de C.V. y Constructora Grupo de Oro, S.A. de C.V. , por un importe de $112,046,320.57, monto sin considerar el IVA, por resultar se la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2015-08-28 00:00:00	112046320.57	MXN	2015-09-10 00:00:00	2016-04-06 00:00:00	\N	
97	97	IO-009KDH999-N30-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 46 de la LAASSP se adjudicó el contrato a la empresa CESC CONSULTORÍA,S.C., por un importe de $14'964,000.00, monto incluye el IVA. 	active	\N	14964000	MXN	\N	\N	\N	
104	104	IA-009KDH999-N8-2014	Servicio de arrendamiento de bienes muebles para las instalaciones de Torre Murano	La contratacion de este servicio la realiza bajo procedimiento de invitacion a cuando menos tres personas en terminos de lo establecido en los articulos 42 y 43 de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Publico	active	2014-12-05 00:00:00	1595304	MXN	\N	\N	\N	
199	199	 SA-009KDH999-N68-2015	-	-	none	\N	243070.24	MXN	\N	\N	\N	
202	202	-	-	-	none	\N	0		\N	\N	\N	
9	9	1	Cuarta Sesión Extraordinaria del Comité de Obras del 08-09-2015 se dictaminó procedente la adjudicación directa (NO SE CUENTA, NI EN LOS ARCHIVOS PDF NI EN LOS FÍSICOS DEL EXPEDIENTE DEL CONTRATO, CON LA NOTIFICACIÓN AL PROVEEDOR)	Cuarta Sesión Extraordinaria del Comité de Obras del 08-09-2015 se dictaminó procedente la adjudicación directa (NO SE CUENTA, NI EN LOS ARCHIVOS PDF NI EN LOS FÍSICOS DEL EXPEDIENTE DEL CONTRATO, CON LA NOTIFICACIÓN AL PROVEEDOR)	active	2015-09-08 00:00:00	1679580.00	MXN	\N	\N	\N	
10	10	DCAGI/SC/GC/0169/2015	Oficio de notificación de Adjudicación Directa DCAGI/SC/GC/0169/2015 del 08-09-2015	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 42 fracción X de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, 28, 29 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3.1., del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., y a solicitud expresa de la Dirección Corporativa de Infraestructura, se le adjudica de manera directa la prestación del servicio relacionado con la obra pública a la persona física Ismael Herrera Revilla. 	active	2015-09-08 00:00:00	2104525.86	MXN	\N	\N	\N	
11	11	1	Cuarta Sesión Extraordinaria del Comité de Obras del 08-09-2015 se dictaminó procedente la adjudicación directa (NO SE CUENTA, NI EN LOS ARCHIVOS PDF NI EN LOS FÍSICOS DEL EXPEDIENTE DEL CONTRATO, CON LA NOTIFICACIÓN AL PROVEEDOR)	Cuarta Sesión Extraordinaria del Comité de Obras del 08-09-2015 se dictaminó procedente la adjudicación directa (NO SE CUENTA, NI EN LOS ARCHIVOS PDF NI EN LOS FÍSICOS DEL EXPEDIENTE DEL CONTRATO, CON LA NOTIFICACIÓN AL PROVEEDOR)	active	2015-09-08 00:00:00	1953000.00	MXN	\N	\N	\N	
63	63	IO-009KDH999-N41-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato a la empresa Consorcio IUYET, S.A. de C.V.  , por un importe de $33,577,144.97, monto sin considerar el IVA, por resultar se la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria.	active	2015-07-14 00:00:00	33577144.97	MXN	\N	\N	\N	
76	76	-			none	\N	152849934	MXN	\N	\N	\N	
69	69	LO-009KDH999-N46-2015	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato la empresa Supervisión y Control de Fauna, S.A. de C.V. , por un importe de $14,382,969.27, monto sin considerar el IVA, por resultar se la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2015-07-06 00:00:00	14382969.27	MXN	\N	\N	\N	
48	48	ITP-OP-DCAGI-SC-014/15	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39 de la LOPSRM,se adjudicó el contrato a la empresa  INGENIEROS CIVILES ASOCIADOS, S.A. DE C.V., por un importe de $8,129,259.88, monto sin considerar el IVA, por resultar la propuesta solvente que cumple técnicamente con todos los requisitos legales y técnica propone el costo más bajo	active	2015-03-04 00:00:00	8129259.88	MXN	\N	\N	\N	
77	77	-			none	\N	30100000	MXN	\N	\N	\N	
78	78	-			none	\N	0		\N	\N	\N	
79	79	-	-	-	active	\N	8761818.1	MXN	\N	\N	\N	
80	80	-	-	-	active	\N	0		\N	\N	\N	
29	29	SO-009KDH999-N22-2015	Oficio de notificación de Adjudicación Directa DCAGI/SC/GC/028/2015 del 04-02-2015	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 27 fracción III y 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, 28, 29 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3. del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., y a solicitud expresa de la Dirección Corporativa de Infraestructura, se le adjudica de manera directa la prestación del servicio relacionado con la obra pública al Instituto de Investigaciones y Capacitación para las Ciencias Biológicas, A.C.	active	2015-02-04 00:00:00	449999.61	MXN	\N	\N	\N	
64	64	LO-009KDH999-T15-2015	Acta de emisión de fallo	Con fundamento en lo dispuesto en el art. 39, fracción III de la LOPSRM se adjudica el contrato al consorcio integrado por Advanced Ligistic Group, S. A. U. e Indra Business Consulting México, S. A. de C. V., por un importe de $11´650,000.00, por resultar ser la propuesra que al ser evaluada técnica y económicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria.	active	2015-05-14 00:00:00	11650000	MXN	\N	\N	\N	
30	30	SO-009KDH999-N24-2015	Oficio de notificación de Adjudicación Directa DCAGI/SC/GC/029/2015 del 04-02-2015	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 27 fracción III y 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, 28, 29 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3. del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., y a solicitud expresa de la Dirección Corporativa de Infraestructura, se le adjudica de manera directa la prestación del servicio relacionado con la obra pública al Instituto de Investigaciones y Capacitación para las Ciencias Biológicas, A.C.	active	2015-02-04 00:00:00	449999.86	MXN	\N	\N	\N	
19	19	1	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 27 fracción III y 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, 28, 29 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3. del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., y a solicitud expresa de la Dirección Corporativa de Infraestructura, se le adjudica de manera directa la prestación del servicio relacionado con la obra pública al Instituto de Investigaciones y Capacitación para las Ciencias Biológicas, A.C. 	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 27 fracción III y 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, 28, 29 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3. del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., y a solicitud expresa de la Dirección Corporativa de Infraestructura, se le adjudica de manera directa la prestación del servicio relacionado con la obra pública al Instituto de Investigaciones y Capacitación para las Ciencias Biológicas, A.C. 	active	\N	117820.00	MXN	\N	\N	\N	
20	20	SA-009KDH999-N13-2015	Oficio UNCP/309/BMACP/0796/2014 de fecha 26 de septiembre de 2014	Con fundamento en lo dispuesto en los artículos 27 Bis, primer párrado de la Ley de Obras Públicas y Servicios Relacionados con las Mismas; 52, primer párrafo y 53, quinto párrafo de su reglamento; y 34, fracción XVII del Reglamento Interior de la Secretaría de la Función Pública. 	active	2014-09-26 00:00:00	455149.56	MXN	\N	\N	\N	
91	91	No. LA-009KDH999-E29-2016	Acta de emisión de fallo de fecha 26 de abril de 2016	Con fundamento en lo dispuesto en el artículo 36, Bis de la LAASSP, se adjudica el contrato a la empresa Global Touristic Agency, S. A. de C.V., por resultar ser la propuesta que al ser evaluada  técnica y ecómicamente, asegura las mnlores condiciones diposbiles en cuanto a precio, calidad, financiamiento y oportunidad. 	active	2016-04-25 00:00:00	26427200	MXN	\N	\N	\N	
204	204	\N	\N	\N	none	\N	\N	\N	\N	\N	\N	\N
218	218	\N	\N	\N	none	\N	\N	\N	\N	\N	\N	\N
221	221	1			none	\N	0		\N	\N	\N	
31	31	SO-009KDH999-N25-2015	Oficio de notificación de Adjudicación Directa DCAGI/SC/GC/030/2015 del 04-02-2015	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 27 fracción III y 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, 28, 29 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3. del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., y a solicitud expresa de la Dirección Corporativa de Infraestructura, se le adjudica de manera directa la prestación del servicio relacionado con la obra pública al Instituto de Investigaciones y Capacitación para las Ciencias Biológicas, A.C.	active	2015-02-04 00:00:00	374999.10	MXN	\N	\N	\N	
111	111	1			active	\N	7082877.52	MXN	\N	\N	\N	
112	112	SA-009KDH999-N1-2014	Contrato Especifico Abierto y Plurianual, para el Arrendamiento de Vehículos Terrestres. 		active	\N	43011360.00	MXN	\N	\N	\N	
113	113	DCAGI/SC/GC/052/2015	Oficio de Adjudicación del 6-07-2015	En la Tercera Sesión Extraordinaria del Comité de Adquisiciones de GACM de fecha 29 de junio de 2015, fue dictaminada procedente la excepción de Licitación Pública para la contratación vía Adjudicación Directa.	active	2015-07-06 00:00:00	5840518.00	MXN	\N	\N	\N	
114	114	1			active	\N	15800287.50	MXN	\N	\N	\N	
115	115	DCAGI/SC/GC/038/2015	Oficio de Adjudicación del 27-07-2015 	Se adjudica en forma directa el suministro de equipo de seguridad (botiquines) 	active	\N	78500	MXN	\N	\N	\N	
116	116	Oficio de notificación de la adjudicación DCAGI/SA/GAR/174/2015	Oficio de notificación de la adjudicación DCAGI/SA/GAR/174/2015	Por instrucciones del subdirector de contrataciones y de la solicitud que se efectuo mediante el oficio numero NO. DCAGI/SA/GAR/174/2015 por la Gerencia de Administración de Recursos, con el fin de que se contrate via Adjudicación Directa la contratación de los servicios administrados de infraestructura de comunicaciones de voz, datos y video para los ejercicios fiscales 2015 al 2018; aprobado en la quinta sesion extraordinaria del CAAS de fecha 8 de septiembre del 2015, fue dictaminada procedente la excepción de licitación publica para la contratación via adjudicación directa.	active	2015-09-08 00:00:00	35399080.00	MXN	\N	\N	\N	
123	123	AA-009KDH999-E44-2016			none	2015-12-08 00:00:00	145713.00	MXN	\N	\N	\N	
124	124	1			active	\N	0	MXN	\N	\N	\N	
125	125	1			active	\N	389000.00	MXN	\N	\N	\N	
129	129	SO-009KDH999-N72-2015			active	2015-02-04 00:00:00	1704713.22	MXN	\N	\N	\N	
132	132	LO-009KDH999-E22-2016			active	\N	163184.04	MXN	\N	\N	\N	
134	134	-			active	\N	18090000.00	MXN	\N	\N	\N	
135	135	-			active	\N	251360	MXN	\N	\N	\N	
32	32	SO-009KDH999-N21-2015	Oficio de notificación de Adjudicación Directa DCAGI/SC/GC/031/2015 del 04-02-2015	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 27 fracción III y 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, 28, 29 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3. del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., y a solicitud expresa de la Dirección Corporativa de Infraestructura, se le adjudica de manera directa la prestación del servicio relacionado con la obra pública al Instituto de Investigaciones y Capacitación para las Ciencias Biológicas, A.C.	active	2015-02-04 00:00:00	394999.95	MXN	\N	\N	\N	
34	34	SO-009KDH999-N23-2015	Notificación de Adjudicación No. oficio DCAGI/SC/GC/033/2015 de fecha 4 de febrero de 2015	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 27 fracción III y 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, 28, 29 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3. del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., y a solicitud expresa de la Dirección Corporativa de Infraestructura, se le adjudica de manera directa la prestación del servicio relacionado con la obra pública a la empresa ESPECIALISTAS AMBIENTALES, S.A. DE C.V.	active	2015-02-04 00:00:00	550000.00	MXN	\N	\N	\N	
65	65	LO-009KDH999-E94-2015	Acta de emisión de fallo 10 de Febrero de 2016	Con fundamento en lo dispuesto en el artículo 39 o fracción III de la LOPSRM se adjudica el contrato a la empresa Consorcio IUYET, S.A. de C.V., por un importe de $41´324,450.46 sin IVA, por resultar ser la propuesta que al ser evaluada técnica y económicamente, cumplio con todos los requisitos en la convocatoria.	none	2016-02-10 00:00:00	41324450.46	MXN	\N	\N	\N	
117	117	DCAGI/SC/162/2016	Oficio de Adjudicación	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 42 de la Ley de Adquisiciones Arrendamientos y Servicios del Sector Público, 30 de su Regalamento, 28, 29, 30, 31 y 33 de la Ley Federal de las Entidades Mayoritaria, Numeral 1.4.3.1 del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., por instrucciones del Subdirector de Contrataciones y de la solicitud que efectuó la Gerencia de Administración y Recursos, en la que slocitó la Adjudicación Directa con su representada, lo cual se le notifica en los siguientes términos.	active	2015-09-17 00:00:00	60344.83	MXN	\N	\N	\N	
118	118	AA-009KDH999-E60-2016	Oficio número DCAGI/SC/GC/22A/2015 del 06/05/2015	Con fundamento en el artículo 134 de la CPEUM, 42 y 47 de la LAASSP, 28, 29, 30, 31 y 33 de la LFEP, numeral 1.4.3.1 del Manual de Organización de GACM, se adjudica el contrato a la empresa ELVYCK, S. DE R.L. DE C.V.	active	2006-05-20 15:00:00	249237.56	MXN	\N	\N	\N	
43	43	-			active	\N	157168157.92		\N	\N	\N	
67	67	LO-009KDH999-N19-2015.	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39 de la LOPSRM, y 68 del RLOPSRM se adjudica el contrato a la empresa Rocher Ingeniería S.A. de C.V. ., por un importe de $1,402,474.19 monto sin considerar el IVA, por  ser la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2015-04-24 00:00:00	1402474.19	MXN	\N	\N	\N	
119	119	AD-SC-GC-0189-2015	Oficio de Adjudicación	Con fundamento en el artículo 134 de la Constitución Política de los Estados Únicos Mexicanos, 41 fracción XIV de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público y 28,29,30,31 y 33 de la Ley Federal de Entidades Paraestatales, Numeral 1.4.3.1, del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V. por instrucciones del Subdirector de Contrataciones y de la solicitud que se efectuó mediante el oficio No. GACM/DG/DCPEV/229/2015, suscrito por el Director Corporativo de Planeación, Evaluación y Vinculación  con el fin de que se contrate Vía Adjudicación Directa, "Los Servicios Profesionales en Materia de Comunicación Social para el proyecto del NAICM"; en la Sexta Sesión Extraordinaria de Comité de Adquisiciones, Arrendamientos y Servicios de GACM de fecha 5 de noviembre de 2015, fue dictaminada procedente la excepción de Licitación Pública para la contratación Vía Adjudicación Directa con su representada. 	active	2015-11-06 00:00:00	1573425.00	MXN	\N	\N	\N	
120	120	1	Oficio DCAGI/SC/GC/0208/2015 de fecha 30 de noviembre de 2015	"en la Séptima Sesión Extraordinaria del Cómite de Adquisiciones  de GACM de fecha 27 de noviembre  mediante acuerdo CAAS/GACM-038/15 fue dictaminada procedente la excepcion de Licitacion Publica para la contratacion Via Adjudicación directa  con su representada..."	active	2015-11-30 00:00:00	625917655.58	MXN	\N	\N	\N	
68	68	LO-009KDH999- N45-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato a la empresa Manejo Integral de Cuencas, S.A. de C.V., por un importe de $18'934,197.76, monto sin considerar el IVA, por resultar ser la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2015-07-06 00:00:00	18934197.76	MXN	\N	\N	\N	
93	93	LO-009KDH999-T52-2015	Acta de emisión de fallo	Con fundamento en lo dispuesto en el art. 39, fracción III de la LOPSRM, se adjudica el contrato a la empresa AUTODESK, INC., por un impote de $136´749,542.27, monto sin considerar el IVA, por resultar la propuesta que al ser evaluada técnica y económicamente, obtuvo el puntaje más alto acorde al mecanismo de evalución previsto en la convocatoria.	active	2015-10-09 00:00:00	136749542.27	MX	2015-10-09 00:00:00	\N	\N	
147	147	1			active	\N	224817.12	MXN	\N	\N	\N	
148	148	1			active	2015-05-29 00:00:00	122100.00	MXN	\N	\N	\N	
149	149	AA-009KDH999-E56-2016			active	\N	299960.00	MXN	\N	\N	\N	
151	151	1	Oficio de designación de la SFP No. UNCP/309/BMACP/0262/2015 de fecha 30 de abril de 2015		active	2015-04-30 00:00:00	463501.20	MXN	\N	\N	\N	
167	167	-	-	-	none	\N	0		\N	\N	\N	
168	168	-	-	-	active	\N	7512904	MXN	\N	2016-07-16 00:00:00	\N	
159	159	-			active	\N	0	MXN	\N	\N	\N	
169	169	-	-		none	\N	687931.00	MXN	\N	\N	\N	
155	155	-			active	\N	858330000.00	MXN	\N	\N	\N	
171	171	AO-009KDH999-E14-2016	-	-	active	\N	18726530.31	MXN	\N	\N	\N	
173	173	-	-	-	active	\N	1206165.79		\N	\N	\N	
172	172	AO-009KDH999-E55-2016	-	-	active	\N	620689.66	MXN	\N	\N	\N	
160	160	-	Oficio de la notificación		active	\N	67996.00	MXN	\N	\N	\N	
174	174	-	-	-	active	\N	14925328.00	MXN	\N	\N	\N	
163	163	-			active	\N	646211.80	MXN	\N	\N	\N	
164	164	-			active	\N	0	MXN	\N	\N	\N	
70	70	LO-009KDH999-N42-2015	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato la empresa RAGAMEX, S.A. de C.V. y Oliverio González Alafita , por un importe de $11,924,906.62, monto sin considerar el IVA, por resultar se la propuesta que al ser evaluada técnica y económicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2015-07-06 00:00:00	11924906.62	MXN	\N	\N	\N	
49	49	IO009KDH999-T3-2014	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudicó el contrato al consorcio conformado por NACO NETHERLANDS AIRPORT CONSULTANTS, B.V., SACMAG DE MÉXICO, S. A. DE C. V. y TADCO CONSTRUCTORA, S. A. DE C. V., cuyo importe de su proposición es de: $1,079,335,930.23, más el 16% del impuesto al valor agregado de $172,693,748.84, lo que arroja un total de $1,252,029,679.07, por resultar ser la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria.	active	2015-01-14 00:00:00	1079335930.23	MXN	\N	\N	\N	
121	121	1	Servicio de Limpieza Integral para los Inmuebles de Santa Catarina-Altavista y Torre Murano del Grupo Aeroportuario de la Ciudad de México S.A. de C.V.  	La contratación de este servicio se realiza mediante el procedimiento de adjudicación directa, de acuerdo a lo establecido en el articulo 26 fracción III, 42 y 47 de la Ley de Adquisisiones, Arrendamientos y Servicios del Sector Público. 	active	\N	258612.50	MXN	\N	\N	\N	
81	81	No. LO-009KDH999-N78-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato al consorcio integrado por Omega Construcciones Industriales, S. A. de C. V., Calzada Construcciones, S. A. de C. V. y Construcciones y Dragados del Sureste, S. A. de C. V., por un importe de $493'916,475.00, monto sin considerar el IVA, por resultar ser la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2015-12-16 00:00:00	493916475	MXN	\N	\N	\N	
82	82	LO-009KDH999- N45-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato a la empresa Manejo Integral de Cuencas, S.A. de C.V., por un importe de $18'934,197.76, monto sin considerar el IVA, por resultar ser la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2015-07-06 00:00:00	18934197.76	MXN	\N	\N	\N	
52	52	AA-009KDH999-E80-2016	Oficio  número DCAGI/SC/GC/039/2016 DEL 12 DE FEBRERO DE 2016.	Con fundamento en lo dispuesto en el ARTICULO 134 DE LA Constitución Politica de los estados Unidos Mexicanos, 42 de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público, 28, 29, 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, numeral 1.4.3.1 del Manual de Organización de la Empresa de Paricipación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de Mexico, S. A. de C. V., asi como de la solicitud que con número DCAGI/SA/GAR/014/2016, efectuara la Gerencia de Administración de Recursos, para la contratación del "Servicisio para la Construcción, Desarrollo y Diseño de la Pagina WEB de GACM" y de conformidad con su cotización de fecha 28 de enero de 2016, por medio de la cual oferta el servicio solicitado, siendo esta la oferta solvente mas baja, por lo anterior la contratación vía Adjudicación Directa se notifica.	active	2016-08-12 00:00:00	207000	MXN	\N	\N	\N	
83	83	LO-009KDH999-N42-2015	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato la empresa RAGAMEX, S.A. de C.V. y Oliverio González Alafita , por un importe de $11,924,906.62, monto sin considerar el IVA, por resultar se la propuesta que al ser evaluada técnica y económicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	cancelled	2015-07-06 00:00:00	11924906.62	MXN	2016-07-16 00:00:00	\N	\N	
53	53	DCAGI/SC/68/2015	Notificación de Adjudicación No. oficio DCAGI/SC/68/2015 de fecha 23 de abril de 2015	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 27 fracción III y 42 de la LAASSP, y a solicitud expresa de la Subdirección Jurídica, se le adjudica de manera directa la prestación del servicio al Consorcio de Servicios Jurídicos Monsalvo. S. C. 	active	2015-04-23 00:00:00	309310.34	MXN	\N	\N	\N	
122	122	1	Adjudicación directa. Oficio GACM/DCAGI/DCF/0212/2015  de fecha 28 de octubre de 2015 y firmado por el Lic. Ricardo Dueñas Espriu.	"…con fundamento en el artículo 50   de la Ley Federal de Presupuesto y Responsabilidad Hacendaria y 148 de su reglamento, así como del oficio GACM//DG/129/2015 se autoriza celebrar   el contrato plurianual...."	active	2015-10-28 00:00:00	1510488.00	MXN	\N	\N	\N	
126	126	DCAGI/SC/010/2014	Oficio de Adjudicación	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 42 de la Ley de Adquisiciones Arrendamientos y Servicios del Sector Público y del Numeral 1.4.3 del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., se le adjudica en forma directa el Servicio Integral de Limpieza de las Oficinas del Grupo, por un monto de $150,057.60(ciento cincuenta mil cincuenta y siete pesos 60/100 M.N.)	active	2014-09-25 00:00:00	129360.00	MXN	\N	\N	\N	
127	127	1	Oficio de notificación de Adjudicación Directa DGAE/212/941/2014 de 30 de septiembre de 2014, la Dirección General de Auditorías Externas designa como auditor externo para dictaminar los estados financieros 2014 de la entidad al prestador de servicios. 	Con fundamento en los artículos 37, fracción IV, VII, X y XXVII, de la Ley Organica de la Administración Pública Federal, en relación con el artículo Segundo Transitorio del Decreto por el que se reforma, adicionan y derogan diversas disposiciones de la Ley Organica de la Administración Pública Federal, publicado en el DOF el 2 de enero de 2013; 6 de la Ley Federal de Presupeusto y Responsabilidad Hacendaria; 306 y 307 del Reglamento de la Ley Federal de Presupeusto y Responsabilidad Hacendaria; 50 fracción I del Reglamento Interior de la Secretaría de la Función Público y 5, 6 y 23 de los lineamientos para al designación, control y evaluación del desempeño de las firmas de auditores externos publicados en el DOF el 22 de octubre de 2010 y modificados mediante acuerdo publicado en el citado organo oficial de difusión de fecha 8 de noviembre 2011.  	active	\N	46371	MXN	\N	\N	\N	
84	84	LO-009KDH999-N46-2015	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato la empresa Supervisión y Control de Fauna, S.A. de C.V. , por un importe de $14,382,969.27, monto sin considerar el IVA, por resultar se la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2015-07-06 00:00:00	14382969.27	MXN	2015-07-21 00:00:00	2015-12-31 00:00:00	\N	
209	209	 AO-009KDH999-E42-2016			active	\N	1880043.10	MXN	\N	\N	\N	
210	210	1			active	\N	500498	MXN	\N	\N	\N	
212	212	1			active	\N	0	MXN	\N	\N	\N	
219	219	\N	\N	\N	none	\N	\N	\N	\N	\N	\N	\N
128	128	No. IO-009KDH999-N77-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en los artículos 40 de la LOPSRM y 71, de su Reglamento, se declara desierta la presente invitación a cuando menos tres personas No. IO-009KDH999-N77-2015 para los trabajos relativos a Supervisión de la Construcción del Drenaje Pluvial Temporal del Nuevo Aeropuerto Internacional de la Ciudad de México, ya que la totalidad de las proposiciones presentadas no reunen los requisitos solicitados en la convocatoria. 	active	2015-11-05 00:00:00	7680864.77	MXN	\N	\N	\N	
130	130	Oficio DCAGI/SC/GC/010/2016	Notificación de Adjudicación No. oficio DCAGI/SC/GC/010/2016 de fecha 22 de enero de 2016	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 27 fracción III y 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, 28, 29 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3. del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., y a solicitud expresa de la Dirección Corporativa de Infraestructura, se le adjudica de manera directa la prestación del servicio relacionado con la obra pública a la empresa OMNIBUS Y TRANSPORTES TERRESTRES EJECUTIVOS, S.A. DE C.V.	active	2016-01-22 00:00:00	640000.00	MXN	\N	\N	\N	
85	85	No. LO-009KDH999-N19-2015.	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39 de la LOPSRM, y 68 del RLOPSRM se adjudica el contrato a la empresa Rocher Ingeniería S.A. de C.V. ., por un importe de $1,402,474.19 monto sin considerar el IVA, por  ser la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2015-04-24 00:00:00	1402474.19	MXN	2015-04-24 00:00:00	\N	\N	
145	145	Oficio DCAGI/SC/041/2014	Notificación de Adjudicación No. oficio DCAGI/SC/041/2014 de fecha 01 de diciembre de 2014	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 27 fracción III y 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, 28, 29 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3. del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., y a solicitud expresa de la Dirección Corporativa de Infraestructura, se le adjudica de manera directa la prestación del servicio relacionado con la obra pública a la empresa SERVICIOS SMART FREE A TU NIVEL, S.A. DE C.V. Y FOSTER + PARTNERS LIMITED	active	2014-12-01 00:00:00	1841753116.00	MXN	\N	\N	\N	
55	55	DCAGI/SC/GC/039/2015	Acta de emisión de fallo 	Con fundamento en el articulos 134 tercer párrafo de la Constitución Política de los Estados Unidos Mexicanos, Articulo 42 de la Ley de Adquisisiones, Arrendamientos y Servicios del Sector Público y de las atribuciones conferidas mediante oficio número DCAGI/107/2014 de fecha 19 de diciembre de 2014 se notifica que se le adjudica en forma directa el suministro de "Herramientas". 	active	\N	89094.69	MXN	\N	\N	\N	
146	146	DG/DCAGI/SC/GC/021/2016	Oficio de Adjudicación	Con fundamento en el artículo 134 de la Constitución de los Estados Unidos Mexicanos, 41 fracción III de la Ley de Adquisiciones, Arrendamientos y Servicios del sector Público y 28, 29,30,31,32 y 33 de la Ley de Entidades Para estatales, Numeral 1.4.3.1 del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México S.A. de C.V. y de la solicitud que se efectuó mediante el oficio DCAGI/SA-020/2016 Suscrito por el Subdirector de Contratación para que se contrate vía adjudicación directa a la empresa "Servicios de Suministro de Combustible Vehicular". 	active	2015-09-07 00:00:00	17267047.50	MXN	\N	\N	\N	
56	56	DCAGI/SC/GC/046/2014	Suministro de Vestuario	Con fundamento en el artículo 134 tercer párrafo de la Constitución Política de los Estados Unidos Mexicanos, del artículo 42 de la ley de Adquisiciones, Arrendamientos y Servicios del Sector Público y de las atribuciones conferidas mediante el oficio número GACM/DG/DCAGI/107/2014, de fecha 19 de diciembre de 2014, se le notifica que se le adjudica en forma directa el suministro de "VESTUARIO", por un monto de $32,851.20.	active	2016-06-25 00:00:00	28320	MXN	\N	\N	\N	
86	86	No. LO-009KDH999-N80-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato al consorcio integrado por Transportaciones y Construcciones Tamaulipecos, S. A. de C. V. e Inmobiliarios Mexicanos, S. A. de C. V., por un importe de $608'275,577.50, monto sin considerar el IVA, por resultar ser la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2015-12-16 00:00:00	608275577.5	MXN	2016-07-16 00:00:00	\N	\N	
203	203	No aplica			none	\N	309200069.2	MXN	\N	\N	\N	
220	220	\N	\N	\N	none	\N	\N	\N	\N	\N	\N	\N
150	150	Oficio de notificación de la adjudicación DCAGI/SC/2060/2015	Oficio de notificación de la adjudicación DCAGI/SC/2060/2015	Con fecha 06 de julio de 2015 mediante el oficio DCAGI/SC/2060/2015 se notifica a la empresa Integradores de Tecnologia, S.A. de C.V. que en la tercera sesión extraordinaria del comité de adquisiciones, de GACM de fecha 29 de junio del 2015 fue dictaminada procedente la excepción de licitación publica para la contratación vía adjudicación directa.	active	2015-07-06 00:00:00	31779878.00	MXN	\N	\N	\N	
176	176	1			active	\N	244176.00	MXN	\N	\N	\N	
177	177	1			active	\N	257569.44	MXN	\N	\N	\N	
178	178	1			active	\N	50008	MXN	\N	\N	\N	
179	179	1			active	\N	14480	MXN	\N	\N	\N	
180	180	1			active	\N	0	MXN	\N	\N	\N	
181	181	1	Oficio DCAGI/SC/GC/064/2015 con fecha de 22 de julio de 2015	Con fundamento en lo dispuesto en el artículo 39, fracción III, 44 fracción III segundo párrafo de la LOPSRM,se adjudica el contrato a la empresa Calapa construcciones S. A. de C. V., por un importe de $1,224,137.93, sin incluir el IVA, por resultar ser la propuesta que al ser evaluada técnica y ecómicamente, asugura las mejores condiciones disponibles en cuanto a precio calidad y financiamiento. 	active	2015-07-22 00:00:00	1224137.93	MXN	\N	\N	\N	
182	182	1			active	\N	0		\N	\N	\N	
191	191	No aplica			none	\N	157168157.92	MXN	\N	\N	\N	
195	195	-			active	\N	224176	MXN	\N	\N	\N	
196	196	99-989-GAC9806011J4-05-03-2015			none	\N	4669201.38	MXN	\N	\N	\N	
137	137	IO-009KDH999-N14-2015	Acta de Emision de Fallo, del 12 de marzo del 2015.	Con fundamento en lo dispuesto en el artículo 36 bis de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público, se adjudica el contrato a la empresa  IDT EN SISTEMAS DE INFORMACION S.A. DE C.V.POR UN IMPORTE DE $ 1,295.000.00 SIN CONSIDERAR EL IVA POR RESULTAR SER LA PROPUESTA MAS BAJA...	active	2015-03-12 00:00:00	1295000.00	MXN	\N	\N	\N	
184	184	-			active	\N	2450000.00	MXN	\N	\N	\N	
187	187	-			active	\N	361637.93	MXN	\N	\N	\N	
152	152	AA-009KDH999-E4-2016	Oficio de notificación de Adjudicación Directa DCAGI/SC/GC/0056/2015 del 31-07-2015	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 41 fracción I de la Ley de Adquisiciones, Arrendamientos y Servicios del sector público, 71 y 72 fracción II de su Reglamento, 28, 29, 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3.1 del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., por instrucciones del Subdirector de Contrataciones y de la solicitud efectuada por la misma, que efectuó la Subdirección de Contrataciones, en la que solicitó se pusiera a consideración del Comité de Adquisiciones, Arrendamientos y Servicios de GACM, a fin de que se dictaminara la excepción de licitación para la contratación Vía Adjudicación Directa, del "TESTIGO SOCIAL ING. JORGE CRUZ MÉNDEZ, PARA ATESTIGUAR EL PROCEDIMIENTO DE LICITACIÓN PÚBLICA INTERNACIONAL BAJO LA COBERTURA DE LOS TRATADOS DE LIBRE COMERCIO, CONSISTENTE EN "DISEÑAR E INSTRUMENTAR EL MODELO VIRTUAL DE INFORMACIÓN PARA LA CONSTRUCCIÓN DEL BIM DEL NAICM"; por lo que, en la Séptima Sesión Ordinaria del Comité de Adquisiciones, de GACM de fecha 30 de julio de 2015, fue dictaminada procedente la excepción, de la que se adjudicó al Ing. Jorge Jiménez Méndez	active	2015-07-31 00:00:00	432601.12	MXN	\N	\N	\N	
153	153	Oficio de notificación de la adjudicación DCAGI/SC/GC/0130/2015	Oficio de notificación de la adjudicación DCAGI/SC/GC/0130/2015	Con fecha 08 de septiembre de 2015 mediante el oficio DCAGI/SC/GC/0130/2015 se notifica a la empresa AXTEL, S.A.B. de C:V.  que, en la quinta sesión extraordinaria del comité de adquisiciones, arrendamientos y servicios de GACM,  fue dictaminada precedente la excepción de licitación pública para la contratación vía adjudicación directa con su representada.	active	2015-09-08 00:00:00	39479421.54	MXN	\N	\N	\N	
154	154	AA-009KDH999-E53-2016	Oficio número DCAGI/SC/GC/210.1/2015 del 30/11/2015	Con fundamento en el artículo 134 de la CPEUM, 42 de la LAASSP, 28, 29, 30, 31 y 33 de la LFEP, numeral 1.4.3.1 del Manual de Organización de GACM, se adjudica el contrato al ciudadano Alan Mauricio Ramírez Graniel	active	2015-11-30 00:00:00	320361.43	MXN	\N	\N	\N	
175	175	Oficio de notificación de la adjudicación DCAGI/SA/GAR/174/2015	Oficio de notificación de la adjudicación DCAGI/SA/GAR/174/2015	Con fundamento en el articulo 134 de la Constitucion Politica de los Estados Unidos Mexicanos, 41 fraccion III de la ley de Adquisiciones, Arrendamientos y Servicios del Sector Publico, 28, 29, 30, 31 y 33 de la ley federal de las entidades paraestatales, numeral 1.4.3.1 del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México S.A. de C.V. por instrucciones del subdirector de contrataciones y de la solicitud que se efectuo mediante el oficio numero NO. DCAGI/SA/GAR/174/2015, suscrito por Samuel Ruiz Zarco, gerente de administración de recursos, con el fin de que se contrate via Adjudicación Directa la contratación de los servicios administrados de infraestructura de comunicaciones de voz, datos y video para el Grupo Aeroportuario de la Ciudad de México, S.A. de C.V. para los ejercicios fiscales 2015 al 2018; por lo que, en la quinta sesion extraordinaria del comite de adquisiciones, arrendamientos y servicios GACM de fecha 8 de septiembre del 2015, fue dictaminada procedente la excepción de licitación publica para la contratación via adjudicación directa.	active	2015-09-08 00:00:00	35399080.00	MXN	\N	\N	\N	
58	58	DCAGI/0174/2015	Adjudicación directa. Oficio DCAGI/0174/2015	…con fundamento en el arítculo 33  de la Ley Federal de Entidades Paraestatales, segundo parráfo del artículo 42  de la Ley de Adquisiciones , Arrendamientos y Servicios del Sector Público, punto 1.4.  del Manual de Organización del Grupo Aeroportuario de  la Ciudad de México y en ejercicio de las atribuciones  conferidas a traves de la escritura pública  número 71,456 de fecha 5 de septiembre de 2014...se autoriza la Adjudicación Directa  en los términos solicitados" 	active	2015-05-15 00:00:00	874173.69	MXN	\N	\N	\N	
59	59	IA-009KDH999-N56-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 36 BIS, fracción III de la LAASSP,se adjudicó el contrato a la empresa AGENCIA DE DESARROLLO RURAL MARTELLI, S.C. DE R.L, por un importe de $5´997,988.52, monto sin considerar el IVA, por resultar se la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2015-08-13 00:00:00	6318719.99	MXN	\N	\N	\N	
60	60	IA-009KDH999-N7-2014	Acta de Emisión de Fallo 	Con lo dispuesto en el 36 BIS de la Ley de Adquisiciones, Arrendamientos y Servicios del sector público se adjudica el contrato a la persona moral Luxmart Futura S.A. de C.V. por un importe de 13,080,028.00 mas IVA 	active	2015-08-13 00:00:00	13080028	MXN	\N	\N	\N	
35	35	SO-009KDH999-N27-2015	Notificación de Adjudicación No. oficio DCAGI/SC/GC/034/2015 de fecha 4 de febrero de 2015	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 27 fracción III y 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, 28, 29 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3. del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., y a solicitud expresa de la Dirección Corporativa de Infraestructura, se le adjudica de manera directa la prestación del servicio relacionado con la obra pública a la empresa ESPECIALISTAS AMBIENTALES, S.A. DE C.V.	active	2015-02-04 00:00:00	519000.00	MXN	\N	\N	\N	
136	136	IA-009KDH999-E95-2015	Acta de Fallo del 28 de enero de 2016	Con fundamento en el artículo 36 BIS de la Ley de Adquisisciones, Arrendamientos y Servicios del Sector Público se Adjudica el contrato a la persona Moral Muños Manzo y Ocampo, S.C. por un importe de $ 20,880,000.00 (Veinte Millones Ochocientos Ochenta Mil Pesos 00/100 M.N.) monto que incluye IVA.  Por resultar ser la propuesta que al ser evaludada Técnica y Ecónomicamente, asegura las mejores condiciones disponibles en cuanto a precio, calidad, financiamiento, oportunidad y que obtuvo el puntaje mas alto.	active	2016-01-28 00:00:00	18000000.00	MXN	\N	\N	\N	
138	138	IA-009KDH999-E23-2016	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 36 BIS, fracción III de la LAASSP,se adjudicó el contrato a la empresa VAZQUEZ NAVA CONSULTORES, por un importe de mínimo de $18,800,000.00 y máximo de $35,000,000.00 para el ejercicio 2016 y un monto mínimo de $20,500,000.00 y máximo $38,500,000.00 para el ejercicio 2017, monto sin considerar el IVA, por resultar se la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria.	active	2016-03-18 00:00:00	73500000	MXN	\N	\N	\N	
190	190	DCAGI/SC/GC/0131/2015	Oficio de Adjudicación DCAGI/SC/GC/0131/2015	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 41 fracción III de la Ley de Adquisiciones, Arrendamientos y Servicios del sector público, 28, 29, 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3.1 del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., por instrucciones	active	2015-09-08 00:00:00	81153576.80	MXN	\N	\N	\N	
50	50	IO-009KDH999-N43-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato a la empresa IMPULSORA DE ENLACE EMPRESARIAL CATENA, S.A. DE C.V. , por un importe de $7´062,852.40, monto sin considerar el IVA, por resultar seR la propuesta que al ser evaluada técnica y ecómicamente, asegura las mejores condiciones disponibles en cuanto a precio, calidad, financiamiento, oportunida; toda vez que es la empresa que presenta los costos unitarios mas bajos.	active	2015-06-16 00:00:00	7062852.40	MXN	\N	\N	\N	
36	36	SO-009KDH999-N18-2015	Oficio de notificación de Adjudicación Directa	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 27 fracción III y 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, 28, 29 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3. del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., y a solicitud expresa de la Dirección Corporativa de Infraestructura, se le adjudica de manera directa la prestación del servicio relacionado con la obra pública a Especialistas Ambientales S.A. de C.V.	active	2015-02-10 00:00:00	550000.00	MXN	\N	\N	\N	
193	193	-		Por lo expuesto, fundado y motivado, se determina procedente la contratación del servicio especializado para la instrumentación del manual de integración y funcionamiento del subcomité de revisión de convocatorias del Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.; en términos de lo señalado anteriormente, mediante el procedimiento de Adjudicación Directa con fundamento en los artículos 134 de la constitución política de los Estados Unidos Mexicanos., 26, fracción III y 42 de la Ley de Adquisición, Arrendamientos y Servicios del Sector Publico.	active	\N	103448.28	MXN	\N	\N	\N	
197	197	LO-009KDH999-N79-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato a la empresa Coconal S. A. P. I. de C. V., por un importe de $1,762'803,241.34, monto sin considerar el IVA, por  ser la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2015-12-11 00:00:00	176280324.34	MXN	\N	\N	\N	
133	133	DCAGI/SC/GC/083/2015	Oficio número  DCAGI/SC/GC/083/2015 del 31/07/2015	Con fundamento en el artículo 134 de la CPEUM, 43 de la LOPSRM, 28, 29, 31 y 33 de la LFEP, numeral 1.4.3.1 del Manual de Organización de GACM, se adjudica el contrato a la empresa Ominibus y Transportes Terrestres Ejecutivos.	active	2015-07-31 00:00:00	300000.00	MXN	\N	\N	\N	
165	165	SO-009KDH999-N28-2015	Notificación de Adjudicación No. oficio DCAGI/SC/GC/036/2015 de fecha 4 de febrero de 2015	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 27 fracción III y 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, 28, 29 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3. del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., y a solicitud expresa de la Dirección Corporativa de Infraestructura, se le adjudica de manera directa la prestación del servicio relacionado con la obra pública a la empresa ESPECIALISTAS AMBIENTALES, S.A. DE C.V.	active	2015-02-04 00:00:00	550000	MXN	\N	\N	\N	
166	166	SO-09KDH999-N26-2015	DCAGI/SC/GC/037/2015	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 27 fracción III y 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, 28, 29 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3. del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., y a solicitud expresa de la Dirección Corporativa de Infraestructura, se le adjudica de manera directa la prestación del servicio relacionado con la obra pública a Sistemas Integrales de Gestión Ambiental, S.C.	active	2015-02-04 00:00:00	465000	MXN	\N	2016-07-16 00:00:00	\N	
131	131	DCAGI/SC/GC/009/2016	Notificación de Adjudicación No. oficio DCAGI/SC/GC/009/2016 de fecha 22 de enero de 2016	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 27 fracción III y 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, 28, 29 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3. del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., y a solicitud expresa de la Dirección Corporativa de Infraestructura, se le adjudica de manera directa la prestación del servicio relacionado con la obra pública a la empresa OMNIBUS Y TRANSPORTES TERRESTRES EJECUTIVOS, S.A. DE C.V.	active	2016-01-22 00:00:00	384000.00	MXN	\N	\N	\N	
141	141	IO-009KDH999-N82-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM,se adjudicó el contrato a la empresa Servicios de Ingeniería, Edificación y Construcción Pesada, S.A. de C.V., por un importe de $8'385,420.04, monto sin considerar el IVA, por resultar ser la propuesta que al ser evaluada técnica y ecómicamente, asegura las mejores condiciones disponibles en cuanto a precio, calidad, financiamiento. 	active	2015-11-25 00:00:00	8385420.04	MXN	\N	\N	\N	
142	142	IO-009KDH999-N75-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III, 44 fracción III segundo párrafo de la LOPSRM,se adjudica el contrato a la empresa SERVICIOS FORESTALES DE HIDALGO, SERFORH, S.C., por un importe de $1'495,559.05, sin incluir el IVA, por resultar ser la propuesta que al ser evaluada técnica y ecómicamente, asugura las mejores condiciones disponibles en cuanto a precio calidad y financiamiento. 	active	2015-09-28 00:00:00	1495559.05	MXN	\N	\N	\N	
214	214	1			active	\N	2450000.00	MXN	\N	\N	\N	
215	215	1			active	\N	257569.44	MXN	\N	\N	\N	
216	216	1			active	\N	389000.00	MXN	\N	\N	\N	
217	217	1			active	\N	8761818.10	MXN	\N	2016-07-17 00:00:00	\N	
41	41	-	-	-	none	\N	22440846.40	MXN	\N	\N	\N	
186	186	-	Notificación de Adjudicación No. oficio DCAGI/SC/GC/040/2016 de fecha 12 de febrero de 2016	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 27 fracción III y 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, 28, 29 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3. del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., y a solicitud expresa de la Dirección Corporativa de Infraestructura, se le adjudica de manera directa la prestación del servicio relacionado con la obra pública a la empresa PORTA BAÑOS 2000, S.A. DE C.V.	active	2016-02-12 00:00:00	203100.00	MXN	\N	\N	\N	
170	170	AO-009KDH999-E52-2016	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 27 fracción III y 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, 28, 29 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3. del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., y a solicitud expresa de la Dirección Corporativa de Infraestructura, se le adjudica de manera directa la prestación del servicio relacionado con la obra pública a la empresa PORTA BAÑOS 2000, S.A. DE C.V.	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 27 fracción III y 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, 28, 29 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3. del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., y a solicitud expresa de la Dirección Corporativa de Infraestructura, se le adjudica de manera directa la prestación del servicio relacionado con la obra pública a la empresa PORTA BAÑOS 2000, S.A. DE C.V.	active	2015-07-15 00:00:00	558618.50	MXN	\N	\N	\N	
139	139	IA-009KDH999-N31-2015	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 36 BIS, de la LAASSP, se adjudicó el contrato a la empresa VÁZQUEZ NAVA Y CONSULTORES, S.C., por un importe de $19´952,000.00, incluyendo el IVA, por resultar ser la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria.	active	2015-05-18 00:00:00	17200000.00	MXN	\N	\N	\N	
140	140	IO-009KDH999-E45-2016	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato a la empresa CENTRO DE ESTUDIOS DE URBANISMO Y ARQUITECTURA, S.A. DE C.V., por un importe de $8´380,018.06, monto sin considerar el IVA, por resultar se la propuesta que al haber sido evaluada técnicamente,H90 fue la solvente mas baja.	active	2016-05-03 00:00:00	8380018.06	MXN	\N	\N	\N	
158	158	 AA-009KDH999-E27-2016	Oficio número UNCP/309/BMACP/0568/2015, con fecha de 28 de septiembre de 2015.	Con fundamento en lo dispuesto en los artículos 27 bis, primer párrafo de la LOPSRM; 52, primer párrafo y 53, quinto párrafo de su reglamento y 34 fracción XVII del Reglamento Interior de la Secretaria de la Función Pública se designó al Instituto Mexicano de Auditoría Técnica, A. C. como testigo social para que participe en el procedimiento de contratación "Nivelación y limpieza del terreno del NAICM".	active	2015-09-28 00:00:00	355962.10	MXN	\N	\N	\N	
143	143	IO009KDH99-N83-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III y 44 fracción III de la LOPSRM,se adjudicó el contrato a la empresa INE, S.A. de C.V., por un importe de $8´090,576.52, monto sin considerar el IVA, por resultar se la propuesta que al ser evaluada técnica y ecómicamente, asegura las mejores condiciones disponibles en cuanto a precio calidad y financiamiento. 	active	2015-11-24 00:00:00	8090576.25	MXN	\N	\N	\N	
156	156	AA-009KDH999-E58-2016	Oficio no. DCAGI/SC/166.1/2015 de fecha del 24 de Septiembre de 2015	Con Fundamento en el Artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 41 fracción I de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público, 71 y 72 fracción III de su Reglamento, 28, 29, 30, 31 y 33 de la Ley Federal de Entidades Paraestatales, numero 1.4.3.1 del Manual de Organización de la Empresa de participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S. A. de C. V.   con el fin de que se contrate via Adjudicación Directa "El Servicio de Testigo Social para que Atestigüe la Etapas del Procedimiento de la Licitación Pública Nacional de Obra Pública de Carga, Acarreo y Descarga Dentro y Fuera del Polígono del Material Existente, Producto de Depósitos de Demoliciones y Desazolve, Incluye Conformación del Terreno donde se Construirá el Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM) para el NAICM", se Adjudica a el Instituto Mexicano de Auditoría Técnica, A. C.	active	2015-07-31 00:00:00	332975.00	MXN	\N	\N	\N	
157	157	AA-009KDH999-E59-2016	Oficio UNCP/309/BMACP/0567/2015, con fecha de 28 de septiembre de 2015.	Con fundamento en lo dispuesto en los artículos 27 Bis, primer párrafo de la Ley de Obras Públicas y Servicios Relacionados con las mismas; 52, primer párrafo y 53, quinto párrafo de su Reglamento y 34, fracción XVII del reglamento interior de la Secretaria de Función Pública, se designa al Arq. José Genaro Ruiz Gómez como Testigo social para atestigüar la "Construcción de los Caminos provisionsles de Acceso al (NAICM), ejecutando Trabajos de Terraceria, Estructura, Obras de Drenaje, Pavimentación y Señalamiento". 	active	2015-12-17 00:00:00	479484.00	MXN	\N	\N	\N	
161	161	AO-009KDH999-E18-2016	Oficio DCAGI/SC/GC/0210/2015 del 30 de noviembre de 2015	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 27 fracción III y 41, 42 fracción X de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, 28, 29 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3.1 del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., y a solicitud expresa de la Dirección Corporativa de Infraestructura, se le adjudica de manera directa la prestación del servicio relacionado con la obra pública a Constructo Mexicana de Infraestructura, S. A.	active	2015-11-30 00:00:00	690000.00	MXN	\N	\N	\N	
162	162	DCAGI/SC/040/2014	Oficio de Adjudicación del 15-12-2014	Se adjudica de manera directa el servicio consistente en, Licenciamientos Oracle y Servicios Profesionales de implementación para crear un sistema de Planificación de Recursos Gubernamentales (GRP).	active	2014-12-15 00:00:00	450446	MXN	\N	\N	\N	
144	144	LO-009KDH999-E22-2016	Acta de fallo LO-009KDH999-E22-2016 con fecha 12 de abril de 2016	Con fundamento en lo dispuesto en el Artículo 39 Fracción III de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, se adjudica el Contrato a la Empresa Sifra y Asociados, S.A. de C.V. 	active	2016-04-12 00:00:00	12999262.50	MXN	\N	\N	\N	
183	183	-	Oficio DCAGI/SC/GC/038/2016 del 12 d e febrero de 2016		active	\N	259000.00	MXN	\N	\N	\N	
185	185	-			active	\N	224817.12	MXN	\N	\N	\N	
87	87	LO-009KDH999-N50-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, se adjudica el contrato al consorcio integrado por las empresas Calzada Construcciones, S. A. de C. V. y Construcciones y Dragados del Sureste, S. A. de C. V., por un importe de $192,522,597.09 (ciento noventa y dos millones quinientos veinticinco mil quinientos noventa y siete Pesos 09/100 M.N.), monto sin considerar el IVA, por resultar ser la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evalación previsto en la convocatoria 	active	2015-09-25 00:00:00	192522597.09	MXN	\N	\N	\N	
192	192	-	Oficio de Adjudicación		active	\N	84000	MXN	\N	\N	\N	
188	188	-	Adjudicación directa. Oficio DCAGI/SC/021.1/2015  de fecha 30 de abril de 2015 y firmado por el Lic. Gerardo Fco. Hernández Romero.	"…con fundamento en el arítculo 134  de la la Constitución Politíca de los Estados Unidos Mexicanos, 41 fraccion III de la Ley de Adquisiciones , Arrendamientos y Servicios del Sector Público, y 71 de su Reglamento, 28, 29, 30, 31 y 33 de Ley Federal de Entidades Paraestatales, numeral 1.4.3 del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México.....fue dictaminada procedente la excepción de Licitación Pública  para la contratación vía Adjudicación  Directa con su representada..."	active	2015-04-30 00:00:00	1469580.17	MXN	\N	\N	\N	
88	88	LO-009KDH999-N5-2014	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 39 o fracción III de la LOPSRM se adjudica el contrato a la empresa GEXIC, S. A. de C. V., por un importe de $34´245,066.00 sin IVA, por resultar ser la propuesta que al ser evaluada técnica y económicamente, obtuvo el untaje mas alto acorde al mecanismo de evaluaciones previstos en la convocatoria.	active	2014-12-18 00:00:00	34245066	MXN	\N	\N	\N	
189	189	AD-AS-DCAGI-SC-065/15	SERVICIOS PROFESIONALES DE ASISTENCIA EN SEGUROS Y FIANZAS RELACIONADOS CON EL PROYECTO DEL NUEVO AEROPUERTO DE LA CIUDAD DE MEXICO (NAICM)	Mediante Septima Sesion Ordinaria 2015, celebrada el 31 de julio de 2015, el comité de Adquisiciones, Arrendamientos y Servicios de GACM "aprobo y dictaminó procedente de la contratacion de los "SERVICIOS PROFESIONALES DE ASISTENCIA EN SEGUROS Y FIANZAS RELACIONADOS CON EL PROYECTO DEL NUEVO AEROPUERTO DE LA CIUDAD DE MEXICO (NAICM), a traves del procedimiento de ADJUDICACION DIRECTA, de conformidad con lo dispuesto por el articulo 41, fraccion XIV, de la LAASSP	active	2015-07-31 00:00:00	853332.00	MXN	\N	\N	\N	
92	92	LO-009KDH999-T15-2015	Acta de emisión de fallo	Con fundamento en lo dispuesto en el art. 39, fracción III de la LOPSRM se adjudica el contrato al consorcio integrado por Advanced Ligistic Group, S. A. U. e Indra Business Consulting México, S. A. de C. V., por un importe de $11´650,000.00, por resultar ser la propuesra que al ser evaluada técnica y económicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria.	active	2015-05-14 00:00:00	11650000	MXN	\N	\N	\N	
94	94	IO-009KDH999-N81-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III Y 44 fracción de la LOPSRM,se adjudica el contrato a la empresa OMNIBUS Y TRANSPORTES TERRESTRES EJECUTIVOS, S.A. DE C.V., por un importe de $ 1'176,000.00, monto sin considerar el IVA, por ser la mepresa que cumplió con todos los requisitos solicitados en la convocatoria en el acto de aclaraciones	active	2015-10-21 00:00:00	1176000	MXN	\N	\N	\N	
95	95	No. IO-009KDH999-N54-2015	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato a la empresa Sifra y Asociados, S. A. de C. V., por un importe de $3'286,659.95, monto mas IVA, por resultar ser la propuesta que al ser evaluada técnica y ecómicamente, asegura las mejores condiciones disponibles en cuanto a precio, calidad, financiamiento, oportunidad; toda vez que es la empresa que presenta los costos unitarios mas bajos.	none	2015-08-14 00:00:00	3286659.95	MXN	\N	\N	\N	
96	96	IO-009KDH999-N41-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato a la empresa Consorcio IUYET, S.A. de C.V.  , por un importe de $33,577,144.97, monto sin considerar el IVA, por resultar se la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2015-07-14 00:00:00	33577144.97	MXN	2016-07-17 00:00:00	\N	\N	
98	98	IO009KDH99-N53-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción de la LOPSRM,se adjudicó el contrato a la empresa OMNIBUS y TRANSPORTES TERRESTRES EJECUTIVOS, S.A. de C.V., por un importe de $4´880,00.00, monto sin considerar el IVA, por resultar se la propuesta que al ser evaluada técnica y ecómicamente, asegura las mejores condiciones disponibles en cuanto a precio calidad y financiamiento. 	active	2015-07-09 00:00:00	4880000	MXN	2015-07-09 00:00:00	\N	\N	
99	99	ITP-SRO-DCAGI-SC-037/15	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM,se adjudicó el contrato a la empresa CAL Y MAYOR Y ASOCIADOS, S.C., por un importe de $5´997,988.52, monto sin considerar el IVA, por resultar se la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2015-05-29 00:00:00	5997988.52	MXN	\N	\N	\N	
100	100	ITP-SRO-DCAGI-SC-027/15	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM,se adjudicó el contrato a la empresa JACE INTERNACIONAL S.A. DE C.V., por un importe de $12,642,390.01, monto sin considerar el IVA, por resultar ser la propuesta que al ser evaluada técnica y ecómicamente, asegura las mejores condiciones disponibles en cuanto ap precio, calidad, financiamiento, oportunidad; toda vez que es la empresa que presenta los costos unitarios más bajos.	active	2015-05-12 00:00:00	12642390.01	MXN	\N	\N	\N	
101	101	IO-009KDH999-E96-2015	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato la empresa BCG The Boston Consulting Group, S. C., BDG The Boston Consulting Group I y GMBH & CO. KG , por un importe de $79,000,000.00, monto sin considerar el IVA, por resultar se la propuesta que al ser evaluada técnica y económicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2016-03-11 00:00:00	79000000	MXN	\N	\N	\N	
102	102	IO-009KDH999-N10-2015	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato la empresa Avalúos, Evaluaciones y Proyectos , S.A. de C.V., por un importe de $2,156,884.20, monto sin considerar el IVA, por resultar se la propuesta que al ser evaluada técnica y económicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2015-03-09 00:00:00	2156884.2	MXN	\N	\N	\N	
106	106	SA-009KDH999-N2-2015 		Del analisis de las propuestas presentadas, se determina que la propuesta presentada por la empresa ARGU Asesores en Capital Humano S.C., es la qie ofrece las mejores condiciones para el Grupo Aeroportuarioo de la Ciudad de México S.A. de C.V.	active	2014-11-24 00:00:00	37181503.72		\N	\N	\N	
103	103	IO-009KDH999-E17-2016	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM,se adjudica el contrato a la empresa 888 REVITALIZA S.A. DE C.V., por un importe de $ 90'190,682.54, monto sin considerar el IVA, por resultar seR la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	unsuccessful	2016-09-03 00:00:00	90190682.54	MXN	\N	\N	\N	
105	105	IA-009KDH999-N7-2014	Servicios de Adaptación y Adecuaciones en Instalaciones de Torre Murano 	La evaluación de la propuesta técnica presentada por el licitante Liberty Desarrollos S.A. de C.V. se analizó detalladamente en estricto apego a lo dispuesto en los articulos 36, 36 BIS de la Ley de Adquisisiones y Arrendamientos y efectuadas en el acto de aclaraciones por lo que derivado de los actos obtenidos en la evaluación de la propuesta técnica, el area requiriente dictamina que la propuesta presentada por el solicitante Liberty Desarrollos S.A. de C.V. cumple con todos los requisitos y especificaciones. 	active	2014-05-12 00:00:00	1852058.2	MXN	\N	\N	\N	
109	109	LO-009KDH999-N86-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato a la empresa Consultoría, Supervisión Técnica y Operación en Sistemas, S. A. de C. V., por un importe de $9'720,916.92, monto sin considerar el IVA, por resultar ser la propuesta que al ser evaluada técnica y ecómicamente, cumplió con los requisitos previstos en la convocatoria. 	active	2015-12-23 00:00:00	9720916.92	MXN	\N	\N	\N	
110	110	LO-009KDH999-N87-2015	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato a Consultoría, Supervisión Técnica y Operación en Sistemas, S. A. de C. V., por un importe de $12'043,340.90, monto sin considerar el IVA, por resultar ser la propuesta que al ser evaluada técnica y ecómicamente, cumplió con los requisitos previstos en la convocatoria. 	active	2015-12-23 00:00:00	12043340.90	MXN	\N	\N	\N	
107	107	SA-0009KDH999-N1-2015	DCAGI/SC/019B/2014	Con funfdamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 43 último párrafo de la ley de Adquisiciones, Arrendameintos y Servicio del Sector Público, artíiculo 78 de su Reglamento, Nyumeral 1.4.3 del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.El presente procedimiento de adjudicación directa deriva de la Invitación Nacional a cuando menos tres personas No. IA-009KDH999-N2-201, que fue declarada desierta, por lo cual se le adjudica de manera directa a la empresa IF CULTURA, S.A. DE C.V.  el contrato para la prestación del servicio, por un monto de $1,786,617.50 I.V.A Incluido	active	\N	1540187.50		\N	\N	\N	
108	108	IO-009KDH999-E15-2016	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato la empresa Construcciones Aldesem, S. A. de C. V., por un importe de $10,961,673.55, monto sin considerar el IVA, por resultar se la propuesta que al ser evaluada técnica y económicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2016-03-07 00:00:00	10961673.55	MXN	\N	\N	\N	
208	208	1	Servicio de Estacionamiento para Vehículos 	La contratación de este servicio se realiza mediante el procedimiento de adjudicación directa, de acuerdo a lo establecido en los articulos 134 de la Constitución Política de los Estados Unidos Mexicanos, 26 fracción III, 42 y 47 de la Ley de Adquisisiones, Arrendamientos y Servicios del Sector Público. 	active	\N	300258.62	MXN	\N	\N	\N	
211	211	1	El Comité de Adquisiciones, Arrendamientos y Servicios en su sétima sesión extraordinaria, emitió el acuerdo CA-036/13 con el que se autoriza la excepción al procedimiento de licitación pública para la adjudicación directa a la empresa LCA Prestadora de servicios SRL de CV en participación con Jones Day.	El Comité de Adquisiciones, Arrendamientos y Servicios en su sétima sesión extraordinaria, emitió el acuerdo CA-036/13 con el que se autoriza la excepción al procedimiento de licitación pública para la adjudicación directa a la empresa LCA Prestadora de servicios SRL de CV en participación con Jones Day.	active	2013-09-11 00:00:00	64100000.00	MXN	\N	\N	\N	
205	205	DCAGI/SC/GC/083/2016	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 41 fracción III de la Ley de  de Adquisiciones , Arrendamientos y Servicios del Sector Público y 28, 29, 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3.1 del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., y de la solicitud que se efectuó mediante el oficio No. GACM/DG/DCAGI/SA/75/2016, suscrito por el Subdirector de Administración, con el fin de que se contrate Vía Adjudicación Directa, el "SERVICIO DE TELEFONÍA CELULAR, PARA GRUPO AEROPORTUARIO DE LA CIUDAD DE MÉXICO, S.A. DE C.V."; en la Tercera Sesión Extraordinaria del Comité de Adquisiciones, Arrendamientos y Servicios de GACM de fecha 29 de Abril de 2016, fue dictaminada procedente la excepción de Licitación Pública para la contratación cía Adjudicación Directa con su representada, lo cual se le notifica en los siguientes términos.	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 41 fracción III de la Ley de  de Adquisiciones , Arrendamientos y Servicios del Sector Público y 28, 29, 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3.1 del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., y de la solicitud que se efectuó mediante el oficio No. GACM/DG/DCAGI/SA/75/2016, suscrito por el Subdirector de Administración, con el fin de que se contrate Vía Adjudicación Directa, el "SERVICIO DE TELEFONÍA CELULAR, PARA GRUPO AEROPORTUARIO DE LA CIUDAD DE MÉXICO, S.A. DE C.V."; en la Tercera Sesión Extraordinaria del Comité de Adquisiciones, Arrendamientos y Servicios de GACM de fecha 29 de Abril de 2016, fue dictaminada procedente la excepción de Licitación Pública para la contratación cía Adjudicación Directa con su representada, lo cual se le notifica en los siguientes términos.	active	2016-04-29 00:00:00	724550	MXN	\N	\N	\N	
198	198	-	-	El Comité de Obras Públicas en su sesión extraordinaria III/14 emitió el acuerdo 10/2014 con el que se autoriza la excepción al procedimiento de licitación pública para la adjudicación directa a la empresa Parsons International Limited.	active	2014-05-20 00:00:00	2361994326.38	MXN	\N	\N	\N	
206	206	 IO-009KDH999-E15-2016	Acta de emisión de fallo	Con fundamento en lo dispuesto en el artículo 39, fracción III de la LOPSRM, se adjudica el contrato la empresa Construcciones Aldesem, S. A. de C. V., por un importe de $10,961,673.55, monto sin considerar el IVA, por resultar se la propuesta que al ser evaluada técnica y económicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2016-03-07 00:00:00	10961673	MXN	\N	\N	\N	
200	200	-	Oficio DCAGI/SC/GC/072/2015 con fecha de 30 de julio de 2015	Con fundamento en el artículo 134 de la Constitución Política de los Estados Unidos Mexicanos, 27 fracción III y 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, 28, 29 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales, Numeral 1.4.3. del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., y a solicitud expresa de la Dirección Corporativa de Infraestructura, se le adjudica de manera directa la prestación del servicio relacionado con la obra pública al Ing. Victor Baez.	active	2015-07-30 00:00:00	1102185.31	MXN	\N	\N	\N	
207	207	SA-009KDH999-N2-2015 	0	Del analisis de las propuestas presentadas, se determina que la propuesta presentada por la empresa ARGU Asesores en Capital Humano S.C., es la qie ofrece las mejores condiciones para el Grupo Aeroportuarioo de la Ciudad de México S.A. de C.V.	active	2014-11-24 00:00:00	37181503.72	MXN	\N	\N	\N	
201	201	-	Adjudicación directa. Oficio DCAGI/SC/021.1/2015  de fecha 30 de abril de 2015 y firmado por el Lic. Gerardo Fco. Hernández Romero.	"…con fundamento en el arítculo 134  de la la Constitución Politíca de los Estados Unidos Mexicanos, 41 fraccion III de la Ley de Adquisiciones , Arrendamientos y Servicios del Sector Público, y 71 de su Reglamento, 28, 29, 30, 31 y 33 de Ley Federal de Entidades Paraestatales, numeral 1.4.3 del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México.....fue dictaminada procedente la excepción de Licitación Pública  para la contratación vía Adjudicación  Directa con su representada..."	active	2015-04-30 00:00:00	1469580.17	MXN	\N	\N	\N	
213	213	Oficio de notificación de la adjudicación DCAGI/SC/2060/2015	Oficio de notificación de la adjudicación DCAGI/SC/2060/2015	Con fecha 06 de julio de 2015 mediante el oficio DCAGI/SC/2060/2015 se notifica a la empresa Integradores de Tecnologia, S.A. de C.V. que en la tercera sesión extraordinaria del comité de adquisiciones, de GACM de fecha 29 de junio del 2015 fue dictaminada procedente la excepción de licitación publica para la contratación vía adjudicación directa.	active	2015-07-06 00:00:00	31779878.00	MXN	\N	\N	\N	
194	194	IA-009KDH999-E97-2015	Acta de emisión de fallo 	Con fundamento en el artículo 36 BIS de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público y a solicitud expresa de la Dirección Corporativa de Infraestructura, se le adjudica de manera directa la prestación del servicio relacionado con la obra pública a Galaz, Yamazaki, Ruiz Urquiza S.C.	active	2016-02-04 00:00:00	4930328.89	MXN	\N	\N	\N	
222	222	IA-009KDH999-N6-2014	Acta de emisión de fallo 	Con fundamento en lo dispuesto en el artículo 36 Bis de la LAASSP, se adjudicó el contrato a la empresa Ribus Tech S. A. de C. V. , por un importe de $2,481,886.09, monto sin considerar el IVA, por resultar se la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evaluación previsto en la convocatoria. 	active	2014-12-05 00:00:00	2481886.09	MXN	\N	\N	\N	
\.


--
-- Name: award_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('award_id_seq', 222, true);


--
-- Data for Name: awardamendmentchanges; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY awardamendmentchanges (id, contractingprocess_id, award_id, property, former_value) FROM stdin;
1	26	\N	En el fallo se declaro desierto el procedimiento de invitación a cuando menos tres personas No. IO-009KDH999-N76-2015, por lo cual la Entidad adjudico directamente el Servicio Relacionado con la Obra Pública a la empresa GLM, Comunicaciones, S. A. de C. V.	No especificado
2	66	\N	Acto Seguido y con fundamento en lo dispuesto por los artículos 37, fracción III, de la LOPSRM, 61 de RLOPSRM y el numeral 2.15 de la Convocatoria de la Licitación que nos ocupa, se hace del conocimiento de los presentes, que a petición del area técnica y con el propósito de concluir con el análisis cualitativos de las propuestas técnicas recepcionadas, la emisión de fallo se difiere, para llevarse a cabo el 30 de abril de 2015, a las 18:00 horas en esta sala de juntas. 	Acto Seguido y con fundamento en lo dispuesto por los artículos 37, fracción III, de la LOPSRM, 61 de RLOPSRM y el numeral 2.15 de la Convocatoria de la Licitación que nos ocupa, se hace del conocimiento de los presentes, que a petición del area técnica y con el propósito de concluir con el análisis cualitativos de las propuestas técnicas recepcionadas, la emisión de fallo se difiere, para llevarse a cabo el 30 de abril de 2015, a las 18:00 horas en esta sala de juntas. 
3	128	\N	En el fallo se declaro desierto el procedimiento de invitación a cuando menos tres personas No. IO-009KDH999-N77-2015, por lo cual la Entidad adjudico directamente el Servicio Relacionado con la Obra Pública a la empresa Ingeniería y Procesamiento Electrónico, S. A. de C. V.	0
\.


--
-- Name: awardamendmentchanges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('awardamendmentchanges_id_seq', 3, true);


--
-- Data for Name: awarddocuments; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY awarddocuments (id, contractingprocess_id, award_id, document_type, documentid, title, description, url, date_published, date_modified, format, language) FROM stdin;
1	54	\N	Términos de Referencia	-	Términos de Referencia	Anexo de los Términos de Referencia presentado por Jefatura de Policia Industrial del Estado de México y/o Cuerpo de Guardias de Seguridad Industrial Bancaria Y Comercial del Valle de Cuautitlán Texcoco		\N	\N		
2	21	\N	Fallo	UNCP/309/BMACP/0796/2014	Propuesta para el Servicio de un Testigo Social para que atestigüe en las etapas de la licitación pública nacional presencial relativa a la contratación del servicio de extracción de ademes y restitución del terreno que ocupan dichos elementos, ubicados en el polígono para el Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	Documento íntegro de la propuesta que resultó ganadora		2014-09-26 00:00:00	\N		es
3	71	\N		-	-	Llevar a cabo el servicio de elaboración de programas y propuestas de acciones, ambientales para el proyecto Nuevo Aeropuerto de la Ciudad de México (NAICM)		\N	\N		
4	61	\N	Acta de emisión de fallo	1	Cotización de la empresa Fglez Consultores y Asociados, S. A. de C.V.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
5	1	\N		1	Propuesta para la realización del Servicio relacionado con el programa de empleo temporal (PET) correspondiente a las acciones preparatorias para la construcción del Nuevo Aeropuerto Internacional de la Ciudad de México (servicio de traslado de personas), elaborada en Mayo de 2015 por el C. Lino Márquez Vite. 	Propuesta para la realización del Servicio relacionado con el programa de empleo temporal (PET) correspondiente a las acciones preparatorias para la construcción del Nuevo Aeropuerto Internacional de la Ciudad de México (servicio de traslado de personas), elaborada en Mayo de 2015 por el C. Lino Márquez Vite. 		\N	\N		
6	2	\N	Oficio de notificaicón de la adjudicación	1	Propuesta técnica y económica de Oscar Alvares de la  Cuadra Sánchez	Propuesta técnica y económica de Oscar Alvares de la  Cuadra Sánchez		\N	\N		
7	62	\N	Acta de emisión de fallo	1	Propuesta técnica y económica de la empresa CAL Y MAYOR S.C.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
8	3	\N		1	Oficio número DCAGI/SC/GC/023/2016 de fecha 3 de febrero de 2016.	Propuesta tecnica y economica de los seervicios de un   "Testigo Social para que atestigue las etapas del Procedimiento de Licitación Publica Nacional para el Proyecto denominado "Excavación de Prueba, Losa Experimental y Prueba de Pilotes para el Edificio Terminal y Torre de Control""		\N	\N		
9	3	\N		1	Oficio número DCAGI/SC/GC/023/2016 de fecha 3 de febrero de 2016.	Propuesta tecnica y economica de los seervicios de un   "Testigo Social para que atestigue las etapas del Procedimiento de Licitación Publica Nacional para el Proyecto denominado "Excavación de Prueba, Losa Experimental y Prueba de Pilotes para el Edificio Terminal y Torre de Control""		\N	\N		
10	25	\N	Fallo	 DCAGI/SC/GC/16B/2015	Propuesta para la realización del Proyecto ejecutivo del drenaje pluvial temporal para la protección de la zona contra inundaciones provenientes de precipitaciones dentro del perímetro del Aeropuerto en el lago de Texcoco, durante la construcción de la primera fase del Nuevo Aeropuerto Internacional de la Ciudad de México por Grupo de Ingenieía en Consultoría en obras, S. A. de C. V.	Documento íntegro de la propuesta que resultó ganadora		2015-01-28 00:00:00	\N		es
12	26	\N	Acta de emisión de fallo	Propuesta técnica y económica de la empresa GLM, Comunicaciones, S. A. de C. V.	Propuesta técnica y económica de la empresa GLM, Comunicaciones, S. A. de C. V.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
14	5	\N	Fallo	1	Oficio de notificación de Adjudicación Directa DCAGI/SC/GC/0137/2015 del 09-09-2015	Propuesta para la Asesoría y Acompañamiento en Temas de Desarrollo Urbano, Territorial y Regional para el Proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México, elaborada por el Ing. Gabriel Cuadri de la Torre		\N	\N		
15	27	\N	Fallo	Propuesta para la realización de la  Prestacion de los servicos consistentes en la elaboración de estudios de geotécnia, topografia,  gedésia  y levantamiento de información geografica através de un vuelo con tecnología Lidar,  por Consorcio IUYT, S.A. de C.V	Propuesta para la realización de la  Prestacion de los servicos consistentes en la elaboración de estudios de geotécnia, topografia,  gedésia  y levantamiento de información geografica através de un vuelo con tecnología Lidar,  por Consorcio IUYT, S.A. de C.V	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
16	7	\N	Fallo	1	Anexo Técnico, Propuesta Técnica y Económica de los Servicios relativos a la "Servicios de Asistencia Técnica Especializada en materia de Hidráulica aplicada a la Infraestructura Aeroportuaria"	No se presentaron inconformidades durante el procedimiento de contratación		\N	\N		
17	9	\N	Fallo	1	Cuarta Sesión Extraordinaria del Comité de Obras del 08-09-2015 se dictaminó procedente la adjudicación directa (NO SE CUENTA, NI EN LOS ARCHIVOS PDF NI EN LOS FÍSICOS DEL EXPEDIENTE DEL CONTRATO, CON LA NOTIFICACIÓN AL PROVEEDOR)	Propuesta para la realización del "Servicio para la Asistencia Técnica Especializada en Materia de  Geotecnia y Cimentación Aplicada a la Infraestructura Aeroportuaria"		\N	\N		
18	72	\N		-	Llevar a cabo el Servicio de Investigaciones y Estudios Especiales, Relacionados con Aspectos Estructurales del Nuevo Aeropuerto de la Ciudad de México (NAICM) en el Vaso del Ex-Lago de Texcoco, Zona Federal	Llevar a cabo el Servicio de Investigaciones y Estudios Especiales, Relacionados con Aspectos Estructurales del Nuevo Aeropuerto de la Ciudad de México (NAICM) en el Vaso del Ex-Lago de Texcoco, Zona Federal		\N	\N		
19	11	\N	Fallo	1	Cuarta Sesión Extraordinaria del Comité de Obras del 08-09-2015 se dictaminó procedente la adjudicación directa (NO SE CUENTA, NI EN LOS ARCHIVOS PDF NI EN LOS FÍSICOS DEL EXPEDIENTE DEL CONTRATO, CON LA NOTIFICACIÓN AL PROVEEDOR)	Propuesta para la realización del "Servicio para la Asistencia Técnica Especializada en Materia de  Geotecnia y Cimentación Aplicada a la Infraestructura Aeroportuaria"		\N	\N		
20	28	\N	Fallo	propuesta para la realización del Plan Maestro del Nuevo Aeropuerto Internacional de la Ciudad de México, de 06 de febrero de 2015 presentado por Arup Latin America, S.A.	propuesta para la realización del Plan Maestro del Nuevo Aeropuerto Internacional de la Ciudad de México, de 06 de febrero de 2015 presentado por Arup Latin America, S.A.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		
105	181	\N	Fallo	1	Oficio DCAGI/SC/GC/064/2015 con fecha de 22 de julio de 2015	Propuesta técnica y económica de la empresa Calapa Construcciones, S. A.		\N	\N		
106	60	\N	Acta de Emisión de Fallo 	1	Propuesta presentada por Luxmart Futura S.A. de C.V. para el servicio de elaboración del  Plan de Integración Ejidal para el NAICM 	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
108	191	\N	Fallo	1	Oficio 842.01 de fecha 19 de diciembre de 2014 mediante el cual se integra la propuesta técnica económica COT-GEIC/419/2014.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
21	12	\N	Fallo	1	Propuesta para la realización de los Servicios de asistencia técnica especializada en diseño de de experto revisor para la asistencia técnica especializada en diseño sismico estructural, elaborada por el DR JONATHAN BRAY.	Propuesta para la realización de los Servicios de asistencia técnica especializada en diseño de de experto revisor para la asistencia técnica especializada en diseño sismico estructural, elaborada por el DR JONATHAN BRAY.		\N	\N		
22	63	\N	Acta de emición de fallo	1	Propuesta técnica y económica de Consorcio IUYET, S.A. de C.V.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
23	13	\N	Fallo	1	Propuesta para los Servicios de experto revisor para el panel de hidráiulica aplicada a la infraestructura aeroportuaria, elaborada por el Dr. Fernando González Villareal. 	Propuesta para los Servicios de experto revisor para el panel de hidráiulica aplicada a la infraestructura aeroportuaria, elaborada por el Dr. Fernando González Villareal. 		\N	\N		
24	29	\N	Oficio de notificación de Adjudicación Directa	DCAGI/SC/GC/028/2015 del 04-02-2015	Propuesta para la realización del Plan de restauración ecológica para el Nuevo Aeropuerto Internacional de la Ciudad de México, elaborada en Enero de 2015 por el Instituto de Investigación y Capacitación para las Ciencias Biológicas, A. C.	Documento íntegro de la propuesta que resultó ganadora		2015-02-04 00:00:00	\N		es
25	14	\N	Fallo	1	Propuesta para los Servicios de experto revisor para la asistencia técnica especializada en materia de protección contra incendios, aplicada a la infraestructura aeroportuaria, elaborada por el Ing. Ramón Dominguez B. 	Propuesta para los Servicios de experto revisor para la asistencia técnica especializada en materia de protección contra incendios, aplicada a la infraestructura aeroportuaria, elaborada por el Ing. Ramón Dominguez B. 		\N	\N		
26	15	\N	Fallo	1	Propuesta técnica y económica de Oscar José Vega y Roldan	Propuesta técnica y económica de Oscar José Vega y Roldan		\N	\N		
27	76	\N		-	-	Llevar a cabo el Servicio de Investigaciones y Estudios Especiales Relacionados con Aspectos Geotécnicos del Nuevo Aeropuerto de la Ciudad de México (NAICM) en el Vaso del Ex-Lago de Texcoco, Zona Federal		\N	\N		
28	76	\N		-	-	Llevar a cabo el Servicio de Investigaciones y Estudios Especiales Relacionados con Aspectos Geotécnicos del Nuevo Aeropuerto de la Ciudad de México (NAICM) en el Vaso del Ex-Lago de Texcoco, Zona Federal		\N	\N		
29	16	\N	Fallo	1	Propuesta técnica y económica de Guillermo Springall Caram	No se presentaron inconformidades durante el procedimiento de contratación		\N	\N		
30	17	\N	Fallo	1	Propuesta Técnico Economica para los Servicios de Asistencia Técnica Especializada en Diseño Sismico Estructural.	No se presentaron inconformidades durante el procedimiento de contratación.		\N	\N		
31	30	\N	Oficio de notificación de Adjudicación Directa	DCAGI/SC/GC/029/2015	Propuesta para la realización del Plan de acciones de monitoreo y conservación de aves para el NAICM, elaborada en Enero de 2015 por el Instituto de Investigación y Capacitación para las Ciencias Biológicas, A. C.	Documento íntegro de la propuesta que resultó ganadora		2015-02-04 00:00:00	\N		es
32	64	\N	Acta de emisión de fallo	1	Propuestas técnica, económica y legal del consorcio integrado por Advanced Logistic Group, S. A. U. e Indra Business Consulting ALG México, S. A. de C. V. 	Documento íntegro de la propuesta que resultó ganadora		\N	\N		
33	19	\N	Fallo	1	Oficio de notificación de Adjudicación Directa DCAGI/SC/GC/029/2015 del 04-02-2015	Propuesta para la realización del Servicio Tecnico Especializado para la captura en video y transmisión via internet mediante la producción y streaming de 4 eventos de licitación pública mediante equipos de cctv en circuito cerrado. 		\N	\N		
34	20	\N	Fallo	1	Oficio UNCP/309/BMACP/0796/2014 de fecha 26 de septiembre de 2014	Propuesta para el Servicio de un Testigo Social para que atestigüe en las etapas de la licitación pública nacional presencial relativa a la contratación del servicio de extracción de ademes y restitución del terreno que ocupan dichos elementos, ubicados en el polígono para el Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).		\N	\N		
35	31	\N	Oficio de notificación de Adjudicación Directa	DCAGI/SC/GC/030/2015	Propuesta para la realización del Programa de rescate de fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México, elaborada en Enero de 2015 por el Instituto de Investigación y Capacitación para las Ciencias Biológicas, A. C.	Documento íntegro de la propuesta que resultó ganadora		2015-02-04 00:00:00	\N		es
36	32	\N	Oficio de notificación de Adjudicación Directa	DCAGI/SC/GC/031/2015	Propuesta para la realización del Programa de rescate y reubicación de flora para el Nuevo Aeropuerto Internacional de la Ciudad de México, elaborada en Enero de 2015 por el Instituto de Investigación y Capacitación para las Ciencias Biológicas, A. C.	Documento íntegro de la propuesta que resultó ganadora		2015-02-04 00:00:00	\N		es
37	111	\N	Fallo	1	Cotización de fecha 16 de Febrero de 2015	No se presentaron inconformidades durante el procedimiento de contratación.		\N	\N		
38	112	\N	Fallo	1	Propuesta Económica 	No se presentaron inconformidades durante el procedimiento de contratación.		\N	\N		
39	33	\N	Fallo	Propuesta para la realización del Elaboración del Estudio Técnico-Económico de la Ejecución de las medidas de mitigación restauración y compensación y otras acciones ambientales del proyecto Nuevo Aeropuerto Internacional de la Ciudad de México de fecha 23 de enero de 2015 por Especialistas  Ambientales, S.A. de C.V.	Propuesta para la realización del Elaboración del Estudio Técnico-Económico de la Ejecución de las medidas de mitigación restauración y compensación y otras acciones ambientales del proyecto Nuevo Aeropuerto Internacional de la Ciudad de México de fecha 23 de enero de 2015 por Especialistas  Ambientales, S.A. de C.V.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
40	113	\N	Fallo	1	DCAGI/SC/GC/052/2015	Propuesta Económica de fecha  13-03-2015		\N	\N		
41	34	\N	Fallo	Propuesta técnica y económica de la empresa ESPECIALISTAS AMBIENTALES, S.A. DE C.V.	Propuesta técnica y económica de la empresa ESPECIALISTAS AMBIENTALES, S.A. DE C.V.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
42	65	\N	Fallo	1	Propuesta técnica-económica de Consorcio IUYET, S.A. de C.V	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
72	127	\N	Fallo	1	Oficio de notificación de Adjudicación Directa DGAE/212/941/2014 de 30 de septiembre de 2014, la Dirección General de Auditorías Externas designa como auditor externo para dictaminar los estados financieros 2014 de la entidad al prestador de servicios. 	Términos de referencia para auditorias externas de los estados y la información financiera contable y presupuestaria.		\N	\N		
107	191	\N	Fallo	1	Oficio 842.01 de fecha 19 de diciembre de 2014 mediante el cual se integra la propuesta técnica económica COT-GEIC/419/2014.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
43	79	\N	Propuesta para Proyecto de Salvamento Arqueológico en el interior del Lago de Taxcoco en su zona oriente, Estado de México. (Supervisión, Vigilancia y Excavaciones 2016), en Adelante los SERVICIOS, mismos que serán realizados totalmente a satisfacción del GACM	-	Propuesta para Proyecto de Salvamento Arqueológico en el interior del Lago de Taxcoco en su zona oriente, Estado de México. (Supervisión, Vigilancia y Excavaciones 2016), en Adelante los SERVICIOS, mismos que serán realizados totalmente a satisfacción del GACM	Propuesta para Proyecto de Salvamento Arqueológico en el interior del Lago de Taxcoco en su zona oriente, Estado de México. (Supervisión, Vigilancia y Excavaciones 2016), en Adelante los SERVICIOS, mismos que serán realizados totalmente a satisfacción del GACM		\N	\N		
44	115	\N	Fallo	1	DCAGI/SC/GC/038/2015	Cotización de fecha 17 de Julio de 2015 presentada por Actividades Sustentables Administrativos, S.A. de C.V.		\N	\N		
45	116	\N	Fallo	1	Oficio de notificación de la adjudicación DCAGI/SA/GAR/174/2015	Anexo 18: Propuesta Tecnica y Economica.		\N	\N		
46	66	\N	Acta de emisión de fallo	1	Propuesta técnica y económica de la Currie & Brown México S. A. de C. V.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
47	117	\N	Fallo	1	DCAGI/SC/162/2016	Curriculum Vitae, Cotización		\N	\N		
48	118	\N	Fallo	1	Oficio número DCAGI/SC/GC/22A/2015 del 06/05/2015	Anexo Técnico y Cotización de las "Mesas de trabajo y sillas secretariales"		\N	\N		
49	43	\N	Oficio 842.01 de fecha 19 de diciembre de 2014 mediante el cual se integra la propuesta técnica económica COT-GEIC/419/2014.	-	Oficio 842.01 de fecha 19 de diciembre de 2014 mediante el cual se integra la propuesta técnica económica COT-GEIC/419/2014.	Oficio 842.01 de fecha 19 de diciembre de 2014 mediante el cual se integra la propuesta técnica económica COT-GEIC/419/2014.		\N	\N		
50	67	\N	Acta de emisión de fallo 	1	Propuesta técnica y económica de la empresa Rocher Ingeniería S.A. de C.V.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
51	119	\N	Fallo	1	DCAGI/SC/GC/0189/2015 	Propuesta de servicios		\N	\N		
52	120	\N	Fallo	1	Oficio DCAGI/SC/GC/0208/2015 de fecha 30 de noviembre de 2015	Propuesta de Servicios/Propuesta económica.		\N	\N		
53	68	\N	Acta de emisión de fallo 	1	Propuesta técnica y económica de la empresa Manejo Integral de Cuencas, S.A. de C.V.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
54	69	\N	Acta de emisión de fallo	1	Propuesta técnica y económica de la empresa  Supervisión y Control de Fauna, S.A. de C. V.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
55	48	\N	Acta de emisión de fallo	-	Propuesta técnica y económica de la empresa  INGENIEROS CIVILES ASOCIADOS, S.A. DE C.V.	Propuesta técnica y económica de la empresa  INGENIEROS CIVILES ASOCIADOS, S.A. DE C.V.		\N	\N		
56	49	\N	Acta de emisión de fallo	-	Propuesta técnica y económica del consorcio conformado por NACO NETHERLANDS AIRPORT CONSULTANTS, B.V., SACMAG DE MÉXICO, S. A. DE C. V. y TADCO CONSTRUCTORA, S. A. DE C. V.	Propuesta técnica y económica del consorcio conformado por NACO NETHERLANDS AIRPORT CONSULTANTS, B.V., SACMAG DE MÉXICO, S. A. DE C. V. y TADCO CONSTRUCTORA, S. A. DE C. V.		\N	\N		
57	81	\N	Fallo	1	Acta de emisión de fallo 	Se refiere a un documento en el que se informe de los resultados de la evaluación de las propuestas conforme el criterio definido en la licitación. También puede incluir una justificación de la adjudicación que se realizará.		\N	\N		
58	81	\N	Documento íntegro de la propuesta que resultó ganadora	2	Propuesta técnica y económica del consorcio integrado por Omega Construcciones Industriales, S. A. de C. V., Calzada Construcciones, S. A. de C. V. y Construcciones y Dragados del Sureste, S. A. de C. V.	Documento que incluye la información sobre la propuesta ganadora en la licitación.		\N	\N		
59	81	\N	Documento que contiene las inconformidades recibidas sobre el procedimiento de contratación	3	No se presentaron inconformidades durante el procedimiento de contratación	Documento que concentra información sobre inconformidades recibidas sobre el proceso de licitación y la decisión tomada sobre cada una de ellas.		\N	\N		
60	51	\N	Fallo	AA-009KDH999-E70-2016	Cotización de los servicios	No se presentaron inconformidades durante el procedimiento de contratación.		\N	\N		es
61	82	\N	Fallo	1	Acta de emisión de fallo 	Propuesta técnica y económica de la empresa Manejo Integral de Cuencas, S.A. de C.V.		\N	\N		
62	52	\N	Fallo	DCAGI/SC/039/2016	Oficio número DCAGI/SC/039/2016 de fecha 12 de Febrero de 2016.	Propuesta tecnica y economica del  "Servicio para diseñar la pagina WEB del Grupo Aeroportuario de la Ciudad de México (GACM) para el Proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México" asiganado a la empresas Elements Studios, S. C., por un monto sin IVA $207,000.00.		2016-02-12 00:00:00	\N		es
63	83	\N	Se refiere a un documento en el que se informe de los resultados de la evaluación de las propuestas conforme el criterio definido en la licitación. También puede incluir una justificación de la adjudicación que se realizará.	1	Fallo	Acta de emisión de fallo		\N	\N		
64	83	\N	Documento que incluye la información sobre la propuesta ganadora en la licitación.	2	Propuesta técnica y económica de la empresa  RAGAMEX Constructores SA de CV	Documento íntegro de la propuesta que resultó ganadora		\N	\N		
65	83	\N	Documento que concentra información sobre inconformidades recibidas sobre el proceso de licitación y la decisión tomada sobre cada una de ellas.	3	Documento que contiene las inconformidades recibidas sobre el procedimiento de contratación	No se presentaron inconformidades durante el procedimiento de contratación		\N	\N		
66	122	\N	Fallo	1	Adjudicación directa. Oficio GACM/DCAGI/DCF/0212/2015  de fecha 28 de octubre de 2015 y firmado por el Lic. Ricardo Dueñas Espriu.	Existe propuesta económica firmada por el Lic. Enrique Berruga con fecha de 27 de Octubre de 2015.		\N	\N		
67	53	\N	Fallo	Notificación de Adjudicación No. oficio DCAGI/SC/68/2015 de fecha 23 de abril de 2015	Propuesta de servicios legales laborales de Monsalvo Abogados.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
68	123	\N	Fallo	1	Propuesta para la realización del Servicio de Auditoria Externa para Dictaminar los estados financieros y Presupuestales del Ejercicio Fiscal 2015	No se presentaron inconformidades durante el procedimiento de contratación.		\N	\N		
69	124	\N	Fallo	1	Cotización del proveedor de fecha 19-12-2014	No se presentaron inconformidades durante el procedimiento de contratación.		\N	\N		
70	125	\N	Fallo	1	Oficio de notificación de Adjudicación Directa DCAGI/SC/GC/029/2015 del 04-02-2015	Propuesta económica para los Sevicios de Regularización de la Información Relativa a la Auditoria Corporativa de Grupo Aeroportuario de la Ciudad de México, S.A. De C.V.  		\N	\N		
71	126	\N	Fallo	1	DCAGI/SC/001/2014	Cotización		\N	\N		
73	84	\N	Se refiere a un documento en el que se informe de los resultados de la evaluación de las propuestas conforme el criterio definido en la licitación. También puede incluir una justificación de la adjudicación que se realizará.	1	Fallo	Acta de emisión de fallo		\N	\N		
74	84	\N	Documento que incluye la información sobre la propuesta ganadora en la licitación.	2	Documento íntegro de la propuesta que resultó ganadora	Propuesta técnica y económica de la empresa  Supervisión y Control de Fauna, S.A. de C. V.		\N	\N		
75	84	\N	Documento que concentra información sobre inconformidades recibidas sobre el proceso de licitación y la decisión tomada sobre cada una de ellas.	3	Documento que contiene las inconformidades recibidas sobre el procedimiento de contratación	No se presentaron inconformidades durante el procedimiento de contratación		\N	\N		
76	128	\N	Fallo	1	Acta de emisión de fallo (Se declaro desierto) 	Propuesta técnica y económica de la empresa Ingeniería y Procesamiento Electrónico, S. A. de C. V. 		\N	\N		
77	129	\N	Fallo	1	Oficio de notificación de Adjudicación Directa DCAGI/SC/GC/029/2015 del 04-02-2015	Propuesta para la  "Asesoría técnica especializada para la debia consecución de los onjeticos encomendados a esta empresa de participación estatal mayoritaria y de esta forma asegurar la adecuada operación de la Infraestructura Aeroportuaria del Valle de México (IAVM)".		\N	\N		
78	130	\N	Fallo	1	Propuesta técnica-económica de OMNIBUS Y TRANSPORTES TERRESTRES EJECUTIVOS, S.A. DE C.V.	Propuesta técnica-económica de OMNIBUS Y TRANSPORTES TERRESTRES EJECUTIVOS, S.A. DE C.V.		\N	\N		
79	85	\N	Se refiere a un documento en el que se informe de los resultados de la evaluación de las propuestas conforme el criterio definido en la licitación. También puede incluir una justificación de la adjudicación que se realizará.	1	Fallo	Acta de emisión de fallo 		\N	\N		
80	85	\N	Documento que incluye la información sobre la propuesta ganadora en la licitación.	2	Documento íntegro de la propuesta que resultó ganadora	Propuesta técnica y económica de la empresa Rocher Ingeniería S.A. de C.V.		\N	\N		
81	85	\N	Documento que concentra información sobre inconformidades recibidas sobre el proceso de licitación y la decisión tomada sobre cada una de ellas.	3	Documento que contiene las inconformidades recibidas sobre el procedimiento de contratación	No se presentaron inconformidades durante el procedimiento de contratación		\N	\N		
82	145	\N	Fallo	1	Notificación de Adjudicación No. oficio DCAGI/SC/041/2014 de fecha 01 de diciembre de 2014	Cotización de la empresa FP - FREE S. DE R.L. DE C.V.		\N	\N		
83	146	\N	Fallo	1	DG/DCAGI/SC/GC/021/2016	Modelo de Propuesta Económica de la empresa Sodexo		\N	\N		
84	56	\N	Fallo	1	Notificación de Adjudicación No. oficio DCAGI/SC/68/2015 de fecha 23 de abril de 2015	Propuesta de servicios legales laborales de Monsalvo Abogados.		\N	\N		es
85	86	\N	Se refiere a un documento en el que se informe de los resultados de la evaluación de las propuestas conforme el criterio definido en la licitación. También puede incluir una justificación de la adjudicación que se realizará.	1	Fallo	Acta de emisión de fallo 		\N	\N		
86	86	\N	Documento que incluye la información sobre la propuesta ganadora en la licitación.	2	Documento íntegro de la propuesta que resultó ganadora	Propuesta técnica y económica del consorcio integrado por Transportaciones y Construcciones Tamaulipecos, S. A. de C. V. e Inmobiliarios Mexicanos, S. A. de C. V. 		\N	\N		
87	86	\N	Documento que concentra información sobre inconformidades recibidas sobre el proceso de licitación y la decisión tomada sobre cada una de ellas.	3	Documento que contiene las inconformidades recibidas sobre el procedimiento de contratación	No se presentaron inconformidades durante el procedimiento de contratación		\N	\N		
88	148	\N	Fallo	1	Propuesta técnica y económica de la empresa SOLUCIONES AMBIENTALES FORTUNA, S.A. DE C.V.	Propuesta técnica y económica de la empresa SOLUCIONES AMBIENTALES FORTUNA, S.A. DE C.V.		\N	\N		
89	149	\N	Fallo	1	Propuesta técnica y económica de la empresa C&L CAPITAL PARTNERS, S.A. DE C.V.	Propuesta técnica y económica de la empresa C&L CAPITAL PARTNERS, S.A. DE C.V.		\N	\N		
90	150	\N	Fallo	1	Oficio de notificación de la adjudicación DCAGI/SC/2060/2015	Oficio de notificación de la adjudicación DCAGI/SC/2060/2015		\N	\N		
91	150	\N	Fallo	1	Oficio de notificación de la adjudicación DCAGI/SC/2060/2015	Propuesta Económica		\N	\N		
92	151	\N	Fallo	1	INSTITUTO MEXICANO DE AUDITORÍA TÉCNICA, A.C.	INSTITUTO MEXICANO DE AUDITORÍA TÉCNICA, A.C.		\N	\N		
93	152	\N	Fallo	1	Oficio de notificación de Adjudicación Directa DCAGI/SC/GC/0056/2015 del 31-07-2015	Propuesta Técnica y Económica para la prestación del “Servicio de un Testigo Social para que Atestigüe las Etapas del Procedimiento de la Licitación Pública Internacional Bajo la Cobertura de Tratados de Libre Comercio, Consistente en Diseñar e Instrumentar el Modelo Virtual de Información para la Construcción del BIM del NAICM”, elaborada por el Ing. Jorge Jiménez Méndez		\N	\N		
94	153	\N	Fallo	1	Oficio de notificación de la adjudicación DCAGI/SC/GC/0130/2015	Propuesta técnica y económica de la empresa AXTEL 		\N	\N		
95	154	\N	Fallo	1	Oficio número DCAGI/SC/GC/210.1/2015 del 30/11/2015	Anexo Técnico y Cotización de los "Materiales para la Construcción"		\N	\N		
96	175	\N	Fallo	1	Servicios de conducciones de señales analogicas y digitales.	Anexo 18: Propuesta Tecnica y Economica.		\N	\N		
97	176	\N	Fallo	1	Propuesta Técnica y Económica	No se presentaron inconformidades durante el procedimiento de contratación.		\N	\N		
98	177	\N	Fallo	1	Se anexa la propuesta del proveedor	No se presentaron inconformidades durante el procedimiento de contratación.		\N	\N		
99	57	\N	Fallo	1	Propuesta para la Servicios Integrales De Consultoría Y Asesoría Preventiva Laboral	Documento que contiene las inconformidades recibidas sobre el procedimiento de contratación		\N	\N		es
100	178	\N	Fallo	1	Se anexa la propuesta del proveedor	No se presentaron inconformidades durante el procedimiento de contratación.		\N	\N		
101	58	\N	Acta de Emision de Fallo, del 27 de mayo de 2015.	1	Propuesta de Servicios/Propuesta económica.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
102	179	\N	Fallo	1	Se anexa la propuesta del proveedor	No se presentaron inconformidades durante el procedimiento de contratación.		\N	\N		
103	59	\N	Acta de emisión de fallo	1	Propuesta técnica y económica de la empresa Agencia de Desarrollo Rural Martelli, S. C. de R. L. M.I.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
104	180	\N	Fallo	1	Se anexa la propuesta del proveedor	No se presentaron inconformidades durante el procedimiento de contratación.		\N	\N		
109	35	\N	Fallo	Propuesta técnica y económica de la empresa ESPECIALISTAS AMBIENTALES, S.A. DE C.V.	Propuesta técnica y económica de la empresa ESPECIALISTAS AMBIENTALES, S.A. DE C.V.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
110	192	\N	Fallo	DCAGI/SC/GC/083/2016	Propuesta de servicios	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
111	50	\N	Acta de emisión de fallo 	-	Propuesta técnica y económica de la empresa IMPULSORA DE ENLACE EMPRESARIAL CATENA, S.A. DE C.V.	Propuesta técnica y económica de la empresa IMPULSORA DE ENLACE EMPRESARIAL CATENA, S.A. DE C.V.		\N	\N		
112	36	\N	Oficio de notificación de Adjudicación Directa	Propuesta para la realización del Elaboración del Plan de  Manejo Ambiental para el nuevo Aeropuerto Internacional de la Ciudad de México de fecha 19 de enero de 2015 por Especialistas  Ambientales, S.A. de C.V.	Propuesta para la realización del Elaboración del Plan de  Manejo Ambiental para el nuevo Aeropuerto Internacional de la Ciudad de México de fecha 19 de enero de 2015 por Especialistas  Ambientales, S.A. de C.V.	Documento íntegro de la propuesta que resultó ganadora		2015-01-19 00:00:00	\N		es
113	193	\N	Fallo	1	Propuesta Economica, Anexo Tecnico	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
114	195	\N	Fallo	1	Propuesta Técnica y Económica	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
115	197	\N	Acta de emisión de fallo 	1	Propuesta técnica y económica de la  Coconal S. A. P. I. de C. V.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		
116	166	\N	Oficio DCAGI/SC/GC/037/2015 del 04 d efebrero de 2015	-	Propuesta para la realización del Plan de monitoreo, registro y verificación de emisiones de gases de efecto invernadero para el NAICM de fecha 16 de enero de 2015 por Sistemas Integrales de Gestión Ambiental, S. C.	Propuesta para la realización del Plan de monitoreo, registro y verificación de emisiones de gases de efecto invernadero para el NAICM de fecha 16 de enero de 2015 por Sistemas Integrales de Gestión Ambiental, S. C.		\N	\N		
117	38	\N	Fallo	Anexo técnico- económico para la elaboración y puesta en marcha del sistema integral de gestión para el cumplimiento ambiental (SIGCA) del proyecto NAICM.	Anexo técnico- económico para la elaboración y puesta en marcha del sistema integral de gestión para el cumplimiento ambiental (SIGCA) del proyecto NAICM.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
118	131	\N	Fallo	Propuesta técnica-económica de OMNIBUS Y TRANSPORTES TERRESTRES EJECUTIVOS, S.A. DE C.V.	Propuesta técnica-económica de OMNIBUS Y TRANSPORTES TERRESTRES EJECUTIVOS, S.A. DE C.V.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
119	168	\N	Oficio DCAGI/SC/GC/129/2016 del 31 marzo de 2016	-	Propuesta para la realización de la Supervisión Técnica Administrativa y de Control de Calidad para los Trabajos de Carga, Acarreo y Descarga fuera del Polígono del material existente, producto de depósitos de Demolición, Desperdicio y Desazolve por Supervisión, Coordinación y Construcción  de Obras, S.A. de C.V.	Propuesta para la realización de la Supervisión Técnica Administrativa y de Control de Calidad para los Trabajos de Carga, Acarreo y Descarga fuera del Polígono del material existente, producto de depósitos de Demolición, Desperdicio y Desazolve por Supervisión, Coordinación y Construcción  de Obras, S.A. de C.V.		\N	\N		
120	132	\N	Fallo	GACM/DG/DCl/1107/15	Propuesta para la realización de las Pruebas de Laboratorio Geotécnicas complementarias para el Proyecto Ejecutivo de Sistema de Drenaje Temporal del Nuevo Aeropuerto Internacional de la Ciudad de México por Rocher Ingeniería, S.A. de C.V.	Documento íntegro de la propuesta que resultó ganadora		2015-12-07 00:00:00	\N		es
121	133	\N	Fallo	DCAGI/SC/GC/083/2015	Propuesta Técnica y Económica de la empresa OMNIBUS Y TRANSPORTES TERRESTRES EJECUTIVOS, S.A. DE C.V.	Documento íntegro de la propuesta que resultó ganadora		2015-07-31 00:00:00	\N		es
122	141	\N	Acta de emisión de fallo	1	Propuesta técnica y económica de la empresa Servicios de Ingeniería, Edificación y Construcción Pesada, S.A. de C.V.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
123	136	\N	Acta de Fallo	Propuesta para la realización del Servicios de Asesoria en Materia Fiscal para la Recuperacion de Saldos a favor de IVA e ISR, así mismo Asesoria Respecto al Cumplimiento de Tratados Internacionales para evitar la Doble Tributación, de fecha 16 de febrero de 2016 por Muños Manzo y Ocampo, S. C.	Propuesta para la realización del Servicios de Asesoria en Materia Fiscal para la Recuperacion de Saldos a favor de IVA e ISR, así mismo Asesoria Respecto al Cumplimiento de Tratados Internacionales para evitar la Doble Tributación, de fecha 16 de febrero de 2016 por Muños Manzo y Ocampo, S. C.	Documento íntegro de la propuesta que resultó ganadora		2016-01-28 00:00:00	\N		es
124	137	\N	Acta de Emision de Fallo	Acta de Emision de Fallo, del 12 de marzo del 2015.	Propuesta de Servicios/Propuesta económica.	Documento íntegro de la propuesta que resultó ganadora		2015-03-12 00:00:00	\N		es
125	142	\N	Acta de emisión de fallo 	1	Propuesta técnica y económica de la empresa SERVICIOS FORESTALES DE HIDALGO, SERFORH, S.C.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
126	169	\N	Nº de Oficio GACM/DG/DCI/1340/2016 del 24 de febrero de 2016	-	-	Propuesta para la Residencia General  de Obra del Nuevo Aeropuerto Internacional de la Ciudad de México presentada por Ing. Carlos Enrique Ortega Mora.		\N	\N		
127	138	\N	Acta de emisión de fallo	Propuesta técnica y económica de la empresa Vázquez Nava y Consultores, S. C.	Propuesta técnica y económica de la empresa Vázquez Nava y Consultores, S. C.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
128	139	\N	Acta de emisión de fallo	Propuesta técnica y económica de la empresa VÁZQUEZ NAVA Y CONSULTORES, S.C.	Propuesta técnica y económica de la empresa VÁZQUEZ NAVA Y CONSULTORES, S.C.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
129	170	\N	Notificación de Adjudicación No. oficio DCAGI/SC/68/2015 de fecha 23 de abril de 2015	-	Propuesta para el servicio de baños portátiles presentada por Portabaños 2000, S. A. de C. V.	-		\N	\N		
130	140	\N	Acta de emisión de fallo	Propuesta técnica y económica de la empresa CENTRO DE ESTUDIOS DE URBANISMO Y ARQUITECTURA, S.A. DE C.V.	Propuesta técnica y económica de la empresa CENTRO DE ESTUDIOS DE URBANISMO Y ARQUITECTURA, S.A. DE C.V.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
131	143	\N	Acta de emisión de fallo	1	Propuesta técnica y económica de la empresa INE S.A. de C.V.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
132	171	\N	Relación de Conceptos y Cantidades de Obra para Expresión de Precios Unitarios y Monto Total de la Proposición (formato C-1)	-	Relación de Conceptos y Cantidades de Obra para Expresión de Precios Unitarios y Monto Total de la Proposición (formato C-1)	-		\N	\N		
133	156	\N	Fallo	DCAGI/SC/166.1/2015	Cotización TS-IMAT-0261-002-2014	Documento íntegro de la propuesta que resultó ganadora		2015-09-24 00:00:00	\N		es
134	157	\N	Fallo	UNCP/309/BMACP/0567/2015	Propuesta para la realización del Servicio de un Testigo Social para que atestigue la Etapas del procedimiento de Licitación Pública de Obra Pública de "Construcción de los Caminos provisionsles de Acceso al (NAICM), ejecutando Trabajos de Terraceria, Estructura, Obras de Drenaje, Pavimentación y Señalamiento". 	Documento íntegro de la propuesta que resultó ganadora		2015-09-28 00:00:00	\N		es
135	158	\N	Fallo	UNCP/309/BMACP/0568/2015	Propuesta para la realización del Servicio de Testigo Social, para que atestigue las Etapas del Procedimiento de la Licitación Pública Nacional de Obra Pública de Nivelación y Limpieza del Terreno del Nuevo Aeropuerto Internacional de la Ciudad de México, presentada por el Instituto Mexicano de Auditoría Técnica, A. C.	Documento íntegro de la propuesta que resultó ganadora		2015-09-28 00:00:00	\N		es
136	172	\N	Carta de Presentación de fecha de 12 de Noviembre de 2015.	-	Carta de Presentación de fecha de 12 de Noviembre de 2015.	Carta de Presentación de fecha de 12 de Noviembre de 2015.		\N	\N		
137	159	\N	Fallo	Propuesta Técnica de las Obras de Excavación de prueba, Losa experimental y prueba de Pilotes para el El Edificio Terminal y Torre de Control del NAICM.	Propuesta Técnica de las Obras de Excavación de prueba, Losa experimental y prueba de Pilotes para el El Edificio Terminal y Torre de Control del NAICM.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
138	161	\N	Fallo	DCAGI/SC/GC/0210/2015	Propuesta para la realización del Proyecto ejecutivo para la construcción de carriles de desaceleración, plataformas de almacenamiento y carriles de aceleración en las puertas 7, y 9 de acceso al polígono del NAICM.	Documento íntegro de la propuesta que resultó ganadora		2015-11-30 00:00:00	\N		es
141	162	\N	Fallo	DCAGI/SC/040/2014	Propuesta de Servicios Profesionales de fecha  26-11-2014	Documento íntegro de la propuesta que resultó ganadora		2014-11-26 00:00:00	\N		es
142	144	\N	Fallo	1	Acta de fallo LO-009KDH999-E22-2016 con fecha 12 de abril de 2016	Propuesta para la supervisión  de la construcción de la barda y camino perimetral, alumbrado, servicios inducidos y casetas de acceso  para el Nuevo Aeropuerto Internacional de la Ciudad de México presentaa por SIFRA y Asociados, S.A. de C.V.		\N	\N		es
143	163	\N	Fallo	Propuesta de servicios (Curriculum)	Propuesta de servicios (Curriculum)	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
144	183	\N	Fallo	DCAGI/SC/GC/038/2016	Propuesta para la realización del Servicio de Ambulancia para el Traslado de Personal, para el Programa de Empleo Temporal (PET).	Documento íntegro de la propuesta que resultó ganadora		2016-02-12 00:00:00	\N		es
145	184	\N	Fallo	Propuesta para la realización de los Servicios Profecionales de Levantamiento de Imagen y Video de Nuevo Aeropuerto Internacional de la Ciudad de México, de fecha 25 de enero de 2016 por Sistema Público de Radiodifusión del Estado de México	Propuesta para la realización de los Servicios Profecionales de Levantamiento de Imagen y Video de Nuevo Aeropuerto Internacional de la Ciudad de México, de fecha 25 de enero de 2016 por Sistema Público de Radiodifusión del Estado de México	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
146	186	\N	Fallo	Cotización de Porta Baños 2000, S.A. de C.V.	Cotización de Porta Baños 2000, S.A. de C.V.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
147	188	\N	Fallo	Oficio de Adjudicación (30 de abril,2015)	Oficio de Adjudicación (30 de abril,2015)	Documento íntegro de la propuesta que resultó ganadora		2015-04-30 00:00:00	\N		es
148	189	\N	Fallo	GACM/DG/DCAGI/SJ-101087/2015	GACM/DG/DCAGI/SJ-101087/2015	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
149	190	\N	Oficio de Adjudicación	DCAGI/SC/GC/0131/2015	Propuesta Económica	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
150	109	\N	Fallo	1	Acta de emisión de fallo 	Propuesta técnica y económica de la empresa Consultoría, Supervisión Técnica y Operación en Sistemas, S. A. de C. V. .		\N	\N		
151	110	\N	Fallo	1	Acta de emisión de fallo 	Propuesta técnica y económica de la empresa Consultoría, Supervisión Técnica y Operación en Sistemas, S. A. de C. V. .		\N	\N		
152	104	\N	Fallo	1	IA-009KDH999-N8-2014	Propuesta técnica y económica de la empresa Lanz Import S. A. de C. V.		\N	\N		
153	105	\N	Fallo	1	Acta de Emisión de Fallo 	Propuesta Técnica y Economica de la empresa Liberty Desarrollos S.A. de C.V. 		\N	\N		
154	108	\N	Fallo	1	Acta de emisión de fallo	Propuesta técnica y económica de la empresa Construcciones Aldesem S. A. de C. V.		\N	\N		
155	209	\N	Fallo	1	Propuesta técnica y económica de M. C. Enrique Álvari Tamez	No se presentaron inconformidades durante el procedimiento de contratación		\N	\N		
156	211	\N	Fallo	1	Cotización de la empresa LCA Prestadora de servicios SRL de CV en participación con Jones Day.	Cotización de la empresa LCA Prestadora de servicios SRL de CV en participación con Jones Day.		\N	\N		
157	205	\N	Fallo	DCAGI/SC/GC/083/2016	DCAGI/SC/GC/083/2016	Propuesta de servicios		\N	\N		es
158	198	\N	Cotización de la empresa Parsons International Limited.	-	-	Cotización de la empresa Parsons International Limited.		\N	\N		
159	206	\N	Acta de emisión de fallo	1	Propuesta técnica y económica de la empresa Construcciones Aldesem S. A. de C. V.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
160	199	\N	Propuesta de servicios presentada por el C. Arturo García Celio	-	-	Propuesta de servicios presentada por el C. Arturo García Celio		\N	\N		
161	200	\N	Oficio DCAGI/SC/GC/072/2015 con fecha de 30 de julio de 2015	-	Propuesta técnica y económica del Ing. Víctor Baez	Propuesta técnica y económica del Ing. Víctor Baez		\N	\N		
162	202	\N	Propuesta para los Servicios de experto revisor para la asistencia técnica especializada en materia de protección contra incendios, aplicada a la infraestructura aeroportuaria, elaborada por el Ing. Ramón Dominguez B. 	-	-	-		\N	\N		
163	213	\N	Fallo	1	Oficio de notificación de la adjudicación DCAGI/SC/2060/2015	Propuesta Económica		\N	\N		
164	214	\N	Fallo	1	Propuesta para la realización de los Servicios Profecionales de Levantamiento de Imagen y Video de Nuevo Aeropuerto Internacional de la Ciudad de México, de fecha 25 de enero de 2016 por Sistema Público de Radiodifusión del Estado de México	No se presentaron inconformidades durante el procedimiento de contratación.		\N	\N		
165	215	\N	Fallo	1	Se anexa la propuesta del proveedor	No se presentaron inconformidades durante el procedimiento de contratación.		\N	\N		
166	216	\N	Fallo	1	Oficio de notificación de Adjudicación Directa DCAGI/SC/GC/029/2015 del 04-02-2015	Propuesta económica para los Sevicios de Regularización de la Información Relativa a la Auditoria Corporativa de Grupo Aeroportuario de la Ciudad de México, S.A. De C.V.  		\N	\N		
167	41	\N	Fallo	1	Anexo de los Términos de Referencia presentado por Jefatura de Policia Industrial del Estado de México y/o Cuerpo de Guardias de Seguridad Industrial Bancaria Y Comercial del Valle de Cuautitlán Texcoco	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
168	194	\N	Acta de emisión de fallo	1	Propuesta para la realización de los servicios.	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
169	192	\N	Fallo	1	Propuesta de servicios	Documento íntegro de la propuesta que resultó ganadora		\N	\N		es
\.


--
-- Name: awarddocuments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('awarddocuments_id_seq', 169, true);


--
-- Data for Name: awarditem; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY awarditem (id, contractingprocess_id, award_id, itemid, description, classification_scheme, classification_id, classification_description, classification_uri, quantity, unit_name, unit_value_amount, unit_value_currency) FROM stdin;
1	21	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con la obra		\N	Servicio	0	
2	61	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista		62501008	Servicios relacionados con Obra Pública		\N	Estudio	0	
3	1	\N	1	Servicio					\N	Servicio	0	
4	2	\N	1	Servicio					\N	Servicio	0	
5	62	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Proyecto ejecutivo	0	
6	3	\N	62501001	Construccion de Aeropistas					\N	Servicio	0	
7	25	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Proyecto	0	
8	26	\N	62903001	Supervisión de Obras			Servicios relacionados con Obra Pública		\N	Supervisión	0	
9	4	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista	Servicios relacionados con Obra Pública				\N	Servicio	0	
10	27	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
11	6	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
12	7	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
13	8	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
14	9	\N	1	NO SE LOCALIZA EN LISTADO PROPORCIONADO 	Servicios relacionados con Obra Pública				\N	Servicio	0	
15	10	\N	1	NO SE LOCALIZA EN LISTADO PROPORCIONADO 	Servicios relacionados con Obra Pública				\N	Servicio	0	
16	11	\N	1	NO SE LOCALIZA EN LISTADO PROPORCIONADO	Servicios relacionados con Obra Pública				\N	Servicio	0	
17	28	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
18	12	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
19	13	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
20	29	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
21	14	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
22	15	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
23	16	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
24	30	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
25	17	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
26	64	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
27	18	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Experto	0	
28	19	\N	62501001	Estudios de preinversión y/o preparación del proyecto para aeropista	Servicios relacionados con Obra Pública				\N	Estudio	0	
29	20	\N	62501001	Estudios de preinversión y/o preparación del proyecto para aeropista	Servicios relacionados con Obra Pública				\N	Servicio	0	
30	31	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
31	32	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
32	112	\N	32503	Servicios de Arrendamiento de Vehiculos terrestres para servicios administrativos	Arrendamiento de equipo de transporte				\N	Servicio	0	
33	33	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
34	113	\N	37104 y 37106	Servicios de pasajes aéreos nacionales y Servicios de pasajes aéreos internacionales		37101			\N	Servicio	0	
35	34	\N	62501001	Construcción de aeropistas			Servicios relacionados con Obra Pública		\N	Servicios relacionados con Obra Pública	0	
36	114	\N	32301	Servicios de Arrendamiento de Equipos y Bienes Informaticos		32301			\N	Servicio	0	
37	65	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista					\N	Obra Pública	0	
38	115	\N	1	 					\N		0	
39	116	\N	31701	Servicios de conducciones de señales analogicas y digitales.		31701			\N	Servicio	0	
40	66	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con la obra pública		\N	Estudio	0	
41	117	\N	1	 					\N	Servicio	0	
42	118	\N	1	 					\N		0	
44	43	\N	62501008	Estudios de preinersión y/o preparación del proyecto para aeropista			Estudios de preinersión y/o preparación del proyecto para aeropista		\N	obra	157168157.92	MXN
45	67	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
46	119	\N	1	 					\N	Servicio	0	
47	120	\N	62905	Servicios Especializados en el suministro de personal técnico y administrativo para proyectos de infraestructura aeroportuaria	6290 "Otros servicios relacionados con la Obra Pública"				\N	Mes	0	
48	68	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
49	69	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
50	48	\N	62501001	Construccion de Aeropistas					\N	Obra Pública	8129259.88	MXN
51	70	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
52	49	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Proyecto Ejecutivo	1079335930.23	MXN
53	121	\N	35801	Servicio de Lavanderia, Limpieza e Higiene 					\N	Servicio	0	
54	81	\N	1	Clave que identifica cada item en la adjudicación.	Clave CUCOP del bien o servicio adjudicado	62501001	Clave que identifica cada item en la adjudicación.		\N		0	
55	81	\N	2	Texto que describe las características de cada item de la adjudicación	Construcción de Aeropistas	2	Descripción específica de la clave CUCOP del bien o servicio adjudicado		\N		0	
56	81	\N	3	Identificador del item dentro de una clasificación determinada que permite incluirlo en un grupo determinado dentro de en un universo de items.	Obra pública	3	Tipo de la clave CUCOP del bien o servicio adjudicado		\N		0	
57	81	\N	4	Otras formas utilizadas para clasificar el item en caso de ser aplicable).	No aplica	4	Clave en el Catálogo de Bienes Muebles (CABM) – Opcional		\N		0	
58	81	\N	5	Dígitos que señalan el número de items que serán adquiridos en la licitación.	1	5	Cantidad del bien o servicio adjudicado		\N		0	
59	81	\N	6	Unidad de medida en la que se especifica la cantidad de items a adquirir.	Obra	6	Unidad del bien o servicio adjudicado		\N		0	
60	82	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista	Servicios relacionados con Obra Pública	No aplica			\N	Estudio	0	
61	52	\N	62501001	Construccion de Aeropistas			Obra Pública		\N	Servicio	0	
62	83	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista	Servicios relacionados con Obra Pública				\N	Estudio	0	
63	122	\N	3300	 Contratación de  Servicios Profesionales  para fungir como enlace  y vocería en el ámbito  nacional e internacional y con actores claves que aseguren la ejecución del  proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México					\N	Servicio	0	
64	123	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
65	124	\N	1	 					\N		259000.00	
66	125	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista	Servicios relacionados con Obra Pública				\N	Estudio	0	
67	127	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista	Servicios relacionados con Obra Pública				\N	Estudio	0	
68	128	\N	62903001	Supervisión de Obras	Servicios relacionados con Obra Pública				\N	Supervisión  	0	
69	129	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
70	130	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
71	85	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista	Servicios relacionados con Obra Pública				\N	Estudio	0	
72	85	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista	Servicios relacionados con Obra Pública				\N	Estudio	0	
73	54	\N	62501001	Construcción de Aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
74	145	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista	Servicios relacionados con Obra Pública				\N	Proyecto Ejecutivo 	0	
75	86	\N	62501001	Construcción de Aeropistas	Obra pública				\N	Obra	0	
76	147	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista	Servicios relacionados con Obra Pública				\N	Estudio	0	
77	150	\N	32301	Servicio de Arrendamiento de Equipos y Bienes Informáticos		32301			\N	Equipo de Computo Personal de Escritorio Pieza.	0	
78	150	\N	32301	Servicio de Arrendamiento de Equipos y Bienes Informáticos		32301			\N	Equipo de Computo Personal de Diseño Portátil o de Escritorio para Estación de Trabajo Pieza.	0	
79	150	\N	32301	Servicio de Arrendamiento de Equipos y Bienes Informáticos		32301			\N	Equipo de Computo Portátil (Tableta) Pieza.	0	
80	150	\N	32301	Servicio de Arrendamiento de Equipos y Bienes Informáticos		32301			\N	Servicio de Software de Antivirus Servicio.	0	
81	150	\N	32301	Servicio de Arrendamiento de Equipos y Bienes Informáticos		32301			\N	Servicio Administrador de Unidad de Energía (UPS) Servicio.	0	
82	153	\N	31701	Servicios de conducciones de señales analógicas y digitales.		31701			\N	Servicio	0	
83	154	\N	1	Obra pública	1				\N	Obra pública	0	
84	175	\N	31701	Servicios de conducciones de señales analogicas y digitales.		31701			\N		0	
85	176	\N	31701	Configuración inicial de los equipos instalados en el inmueble de Altavista que dan servicio de Red Local, Seguridad de Datos y Telefonía.		31701			\N	Servicio	0	
86	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Switch core	0	
87	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Switch ACC1	0	
88	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Switch ACC2	0	
89	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Switch ACC3	0	
90	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Access Point PA	0	
91	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Access Point PB	0	
92	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Access Point SJ	0	
93	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Access Point VIP	0	
94	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	CUCM	0	
95	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Unity Conecction	0	
96	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Voice Gateway	0	
97	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Internet Gateway	0	
98	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	GACMAD	0	
99	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Juniper FW	0	
100	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Telefono IP Cisco Modelo 7021	0	
101	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Telefono IP Cisco Modelo 7031 	0	
102	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Telefono IP Cisco Modelo 7038	0	
103	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Telefono IP Cisco Modelo 7911 	0	
104	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Telefono IP Cisco Modelo 7937	0	
106	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Telefono IP Cisco Modelo 7941	0	
107	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Telefono IP Cisco Modelo 7965	0	
108	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Telefono IP Cisco Modelo 7975	0	
109	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Telefono IP Cisco Modelo 7942	0	
110	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Telefono IP Cisco Modelo 7962	0	
111	57	\N	33104	Asesorias para la operacion de programas					\N	Servicio	0	
112	178	\N	32301	Servicio de Arrendamiento de equipos de Bienes Informáticos 	Arrendamiento - Servicios Generales				\N	Desk Top  	0	
113	178	\N	32301	Servicio de Arrendamiento de equipos de Bienes Informáticos 	Arrendamiento - Servicios Generales				\N	Laptops	0	
114	179	\N	32301	Servicio de Arrendamiento de equipos de Bienes Informáticos 	Arrendamiento - Servicios Generales	32301			\N	Impresión personal a color	0	
115	179	\N	32301	Servicio de Arrendamiento de equipos de Bienes Informáticos 	Arrendamiento - Servicios Generales	32301			\N	Multifuncional monocromático  	0	
116	179	\N	32301	Servicio de Arrendamiento de equipos de Bienes Informáticos 	Arrendamiento - Servicios Generales	32301			\N	Aparatos Telefónicos Digitales IP	0	
117	179	\N	32301	Servicio de Arrendamiento de equipos de Bienes Informáticos 	Arrendamiento - Servicios Generales	32301			\N	Equipos de Red (Switches)	0	
118	180	\N	31701	Servicio de contratación de servicios de conducción de señales analógicas y digitales 	contratación de señales - Servicios Generales				\N	enlace Secundario de 10MB 	0	
119	180	\N	31701	Servicio de contratación de servicios de conducción de señales analógicas y digitales 	contratación de señales - Servicios Generales				\N	Toncales Digitales con 100 DID's	0	
120	181	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
121	191	\N	62501008	Estudios de preinersión y/o preparación del proyecto para aeropista			Obra pública		\N	Obra	0	
122	35	\N	62501001	Construcción de aeropistas			Servicios relacionados con Obra Pública		\N	Servicios relacionados con Obra Pública	0	
123	36	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
125	193	\N	33104	Instrumentación del Manual de Integración y Funcionamiento del Subcomité de Revisión de Convocatorias Del Grupo Aeroportuario de La Ciudad de México, S.A. de C.V. en Materia de Adquisiciones Arrendamientos y Servicios					\N	Servicio	0	
126	195	\N	31701	Configuración inicial de los equipos instalados en el inmueble de Altavista que dan servicio de Red Local, Seguridad de Datos y Telefonía.			Configuración inicial de los equipos instalados en el inmueble de Altavista que dan servicio de Red Local, Seguridad de Datos y Telefonía.		\N	Servicio	0	
127	197	\N	62501001	Construcción de Aeropistas	Obra pública		Obra pública		\N	Obra	0	
130	165	\N	62501001	Construcción de aeropistas			Servicios relacionados con Obra Pública		\N		550000	
134	166	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista					\N	Estudio	465000	MXN
135	38	\N	62501001	Construcción de aeropistas			Servicios relacionados con obra		\N	Obra	0	
136	131	\N	62501001	Construcción de Aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
137	132	\N	62501001	Construcción de Aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
138	133	\N	62501001	Construcción de Aeropistas			Servicios relacionados con Obra Pública		\N	Servicios	0	
139	141	\N	72501001	Construcción de aeropistas			Obra Pública		\N	Obra	0	
140	136	\N	62501001	Construcción de Aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
141	137	\N	33301	Servicio integral de administración de personal y proceso de nomina, mediante un sistema especializado para recursos humanos y de nómina de gobierno			Servicio integral de administración de personal y proceso de nomina, mediante un sistema especializado para recursos humanos y de nómina de gobierno		\N	mes	0	
142	142	\N	62501001	Construcción de aeropistas 			Servicios relacionados con Obra Pública		\N	Servicios relacionados con Obra Pública	0	
143	140	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Servicios relacionados con Obra Pública	0	
144	143	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Proyecto ejecutivo	0	
145	171	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropistas.			Servicios relacionados con Obra Pública		\N	Estudio	18726530.31	MXN
146	156	\N	62501001	Construcción de Aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
147	157	\N	62501001	Construcción de Aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
148	158	\N	62501001	Construcción de Aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
149	159	\N	62501001	Construcción de Aeropistas			Obra Publica		\N	Obra	0	
150	160	\N	62903001	Construcción de Aereopistas			Obras Publicas		\N	Obra	0	
151	173	\N	-	-			Obra pública		\N	Estudio	0	
152	161	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
153	162	\N	33301	Servicios de Informática			Servicios de Informática		\N	Servicio	0	
154	144	\N	62903001	Supervisión de Obras			Servicios relacionados con Obra Pública		\N	Supervisión	0	
155	183	\N	62501001	Construcción de aeropistas			Servicios relacionados con Obra Pública		\N	Servicios	0	
156	188	\N	1	Asesoría técnica especializada en materia de vinculación con organismos internacionales y adopción de las mejores prácticas internacionales			Asesoría técnica especializada en materia de vinculación con organismos internacionales y adopción de las mejores prácticas internacionales		\N	Servicio	0	
157	189	\N	33101	Otras Asesorias para la Operación de Programas			Otras Asesorias para la Operación de Programas		\N	Servicio	0	
158	190	\N	35801	Servicios Integrales de Infraestructura de Computo.			Servicios Integrales de Infraestructura de Computo.		\N	Servicio	0	
159	109	\N	62903001	Supervisión de Obras	Servicios relacionados con Obra Pública				\N	Supervisión  	0	
160	110	\N	62903001	Supervisión de Obras	Servicios relacionados con Obra Pública				\N	Supervisión  	0	
161	106	\N	33901	Contratación de servicios especializados en el suministro de "terceros".					\N	Servicio	0	
162	107	\N	1	 					\N	Edición	0	
163	108	\N	62501001	Construcción de Aeropistas	Obra pública				\N	Obra	0	
164	209	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
165	212	\N	1	Sociedad de EX Alumnos de la Facultad de Ingeniería de la Universidad Nacional Autónoma de México A.C.					\N		0	
166	206	\N	62501001	Construcción de Aeropistas			Obra pública		\N	Obra Pública	0	
167	200	\N	62501001	Construcción de aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
168	207	\N	33901	Contratación de servicios especializados en el suministro de "terceros".		1			\N	Servicio	0	
169	213	\N	32301	Servicio de Arrendamiento de Equipos y Bienes Informáticos		32301			\N	Equipo de Computo Personal de Escritorio Pieza	0	
170	213	\N	32301	Servicio de Arrendamiento de Equipos y Bienes Informáticos		32301			\N	Equipo de Computo Personal de Diseño Portátil o de Escritorio para Estación de Trabajo Pieza	0	
171	213	\N	32301	Servicio de Arrendamiento de Equipos y Bienes Informáticos		32301			\N	Equipo de Computo Portátil (Tableta) Pieza. 	0	
172	213	\N	32301	Servicio de Arrendamiento de Equipos y Bienes Informáticos		32301			\N	Servicio de Software de Antivirus Servicio.	0	
173	213	\N	32301	Servicio de Arrendamiento de Equipos y Bienes Informáticos		32301			\N	Servicio Administrador de Unidad de Energía (UPS) Servicio	0	
174	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Switch core	0	
175	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Switch ACC1	0	
176	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Switch ACC2	0	
177	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Switch ACC3	0	
178	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Access Point PA	0	
179	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Access Point PB	0	
180	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Access Point SJ	0	
181	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Access Point VIP	0	
182	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	CUCM	0	
183	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Unity Conecction	0	
184	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Voice Gateway	0	
185	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Internet Gateway	0	
186	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	GACMAD	0	
187	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Juniper FW	0	
188	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Telefono IP Cisco Modelo 7021	0	
189	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Telefono IP Cisco Modelo 7031	0	
190	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Telefono IP Cisco Modelo 7038	0	
191	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Telefono IP Cisco Modelo 7911	0	
192	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Telefono IP Cisco Modelo 7937	0	
193	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Telefono IP Cisco Modelo 7941	0	
194	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Telefono IP Cisco Modelo 7965	0	
195	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Telefono IP Cisco Modelo 7975	0	
196	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Telefono IP Cisco Modelo 7942	0	
197	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Telefono IP Cisco Modelo 7962	0	
198	216	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista	Servicios relacionados con Obra Pública				\N	Estudio	0	
199	217	\N	1	 					\N	Obra Pública	0	
200	221	\N	1	 					\N	Servicio	0	
201	222	\N	35101	Conservación y mantenimiento menor de inmuebles					\N	Servicio	0	
\.


--
-- Name: awarditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('awarditem_id_seq', 201, true);


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
18	18	18	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	26000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
111	111	111	Presupuesto de Egresos de la Federación 2015	46101	Construcción en Vías de Comunicación 	8410000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
116	116	116	Presupuesto de Egresos de la Fedración 2015,2016, 2017 y 2018	31701	Servicios de conducciones de señales analógicas y digitales.	35399080	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
24	24	24	Presupuesto de Egresos de la Fedración 2016 al 2018	46101	Transferencias a fideicomisos públicos	182500000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
26	26	26	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	5100000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
4	4	4	Presupuesto de Egresos de la Federación 2015	46101	Transferencias a fideicomisos públicos	15650000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
103	103	103	Presupuesto de Egresos de la Fedración 2016	46101	Transferencias a fideicomisos públicos	199984000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
3	3	3	Presupuesto de Egresos de la Federación 2015	46101	Transferencias a fideicomisos públicos	290000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
25	25	25	Presupuesto de Egresos de la Fedración 2015	46101	Transferencias a fideicomisos públicos	19500000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
76	76	76	Presupuesto de Egresos de la Federación 2015 y 2016	46101	Transferencias a fideicomisos públicos	177305923	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
13	13	13	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	15650000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
14	14	14	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	26000000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
15	15	15	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	15650000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
16	16	16	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	15650000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
17	17	17	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	26000000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
77	77	77	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	34800000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
19	19	19	Presupuesto de Egresos de la Federación 2015	46101	Transferencias a fideicomisos públicos	117820.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
216	216	216	Presupuesto de Egresos de la Federación 2014	46101	Transferencias a fideicomisos públicos	389000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
222	222	222	Presupuesto de Egresos de la Federación 2014	35101	Conservación y mantenimiento menor de inmuebles	1200000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México		http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
78	78	78	-	46101	Transferencias a fideicomisos públicos	182500000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
112	112	112	Presupuesto de Egresos de la Federación 2014	32503	Transferencias a fideicomisos públicos	49042510.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
113	113	113	Presupuesto de Egresos de la Federación 2015 y 2016	37104, 37106 y 38301	Servicios de pasajes aéreos nacionales para servidores públicos de mando en el desempeño de comisiones y funciones oficiales Servicios de pasajes aéreos internacionales para servidores públicos de mando en el desempeño de comisiones y funciones oficiales Congresos y Convenciones	6583333	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
46	46	46	-	46101	Transferencias a fideicomisos públicos	182500000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
121	121	121	Presupuesto de Egresos de la Federación 2015	46101		0	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México		http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
127	127	127	Presupuesto de Egresos de la Federación 2015	46101	Transferencias a fideicomisos públicos	46371	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
51	51	51	Disponibilidad Presupuestal para el ejercicio 2016	46101	Transferencias a fideicomisos públicos	400000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
123	123	123	Presupuesto de Egresos de la Federación 2015	46101	Transferencias a fideicomisos públicos	169027	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
6	6	6	Presupuesto de Egresos de la Federación 2015 y 2016	46101	Transferencias a fideicomisos públicos	26000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
7	7	7	Presupuesto de Egresos de la Federación 2015 y 2016	46101	Transferencias a fideicomisos públicos	15650000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
28	28	28	Presupuesto de Egresos de la Fedración 2015	46101	Transferencias a fideicomisos públicos	1495000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
131	131	131	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	688000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
50	50	50	Presupuesto de Egresos de la Fedración 2015	46101	Transferencias a fideicomisos públicos	8200000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
213	213	213	Presupuesto de Egresos de la Federación 2015,2016, 2017 y 2018	32301	Servicio de Arrendamiento de Equipos y Bienes Informáticos	47660000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México		http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
9	9	9	Presupuesto de Egresos de la Federación 2015 (contrato plurianual 2015-2016)	46101	Transferencias a fideicomisos públicos	1953000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
74	74	74	Presupuesto de Egresos de la Fedración 2014	46101	Transferencias a fideicomisos públicos	10954142	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
22	22	22	Presupuesto de Egresos de la Fedración 2016 al 2018	46101	Transferencias a fideicomisos públicos	227520000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
73	73	73	Presupuesto de Egresos de la Fedración 2014	46101	Transferencias a fideicomisos públicos	13051740.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
11	11	11	Presupuesto de Egresos de la Federación 2015 y 2016	46101	Transferencias a fideicomisos públicos	1953000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
12	12	12	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	26000000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
29	29	29	Presupuesto de Egresos de la Fedración 2015	46101	Transferencias a fideicomisos públicos	522000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
48	48	48	Presupuesto de Egresos de la Fedración 2015 	46101	Transferencias a fideicomisos públicos	9500000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
44	44	44	Presupuesto de Egresos de la Federación 2015 y 2016	46101	Transferencias a fideicomisos públicos	3800000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
49	49	49	Presupuesto de Egresos de la Fedración 2015 al 2018	46101	Transferencias a fideicomisos públicos	1800000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
59	59	59	Presupuesto de Egresos de la Fedración 2015 	46101	Transferencias a fideicomisos públicos	7400000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
132	132	132	Presupuesto de Egresos de la Federación 2015	46101	Transferencias a fideicomisos públicos	163793	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
136	136	136	Presupuesto de Egresos de la Fedración 2015	46101	Transferencias a fideicomisos públicos	21848600.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
155	155	155				182500000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
108	108	108		46101	Transferencias a fideicomisos públicos	1276500.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
110	110	110	Presupuesto de Egresos de la Federación 2015 y 2016	46101	Transferencias a fideicomisos públicos	20000000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
106	106	106	Presupuesto de Egresos de la Federación 2014	33901	Subcontratación de Servicios con terceros.	129391633.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México		http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
109	109	109	Presupuesto de Egresos de la Federación 2015 y 2016	46101	Transferencias a fideicomisos públicos	17000000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
27	27	27	Presupuesto de Egresos de la Federación 2015	46101	Transferencias a fideicomisos públicos	70000000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
75	75	75	Presupuesto de Egresos de la Fedración 2014	46101	Transferencias a fideicomisos públicos	2697000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
8	8	8	Presupuesto de Egresos de la Federación 2015 y 2016	46101	Transferencias a fideicomisos públicos	17000000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
23	23	23	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	182500000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
61	61	61	Presupuesto de Egresos de la Federación 2015 y 2016	46101	Transferencias a fideicomisos públicos	9500000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
21	21	21	Presupuesto de Egresos de la Federación 2014	46101	Transferencias a fideicomisos públicos	625856	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
71	71	71	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	7667600	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
133	133	133	Presupuesto de Egresos de la Fedración 2015	46101	Transferencias a fideicomisos públicos	8500000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
30	30	30	Presupuesto de Egresos de la Fedración 2015	46101	Transferencias a fideicomisos públicos	522000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
31	31	31	Presupuesto de Egresos de la Fedración 2015	46101	Transferencias a fideicomisos públicos	435000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
114	114	114	Presupuesto de Egresos de la Federación 2015,2016, 2017 y 2018	32301	Servicios de Arrendamiento de Equipos y Bienes Informaticos	15800287	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
47	47	47	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	0	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
163	163	163	Presupuesto de Egresos de la Federación 2016	35801	Servicios de lavandería, limpieza e higienes.	750000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México		http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
81	81	81	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	770000000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
124	124	124	Presupuesto de Egresos de la Federación 2015	33301	Transferencias a fideicomisos públicos	305000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México		http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
144	144	144	Presupuesto de Egresos de la Federación 2015	46101	Transferencias a fideicomisos públicos	15600000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
54	54	54	Presupuesto de Egresos de la Fedración 2015	46101	Transferencias a fideicomisos públicos	7667600	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
100	100	100	Presupuesto de Egresos de la Federación 2015 	46101	Transferencias a fideicomisos públicos	14655172	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
101	101	101	Presupuesto de Egresos de la Federación 2016	46101	Transferencias a fideicomisos públicos	122000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
102	102	102	Presupuesto de Egresos de la Federación 2015 y 2016	46101	Transferencias a fideicomisos públicos	2680000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
199	199	199	Presupuesto de Egresos de la Fedración 2015 	46101	Transferencias a fideicomisos públicos	0		Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
72	72	72	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	64409000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
214	214	214	Presupuesto de Egresos de la Federación 2015	46101	Transferencias a fideicomisos públicos	2450000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
115	115	115	Presupuesto de Egresos de la Federación 2015	46101	Obras de Construcción para Edificios no Habitacionales	100000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
45	45	45	-	46101	Transferencias a fideicomisos públicos	182500000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
52	52	52	Presupuesto de Egresos de la Federación 2015 	46101	Transferencias a fideicomisos públicos	240120	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
53	53	53	Presupuesto de Egresos de la Fedración 2015	46101	Transferencias a fideicomisos públicos	420000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
125	125	125	Presupuesto de Egresos de la Federación 2014		Investigación de mercado para los Sevicios de Regularización de la Información Relativa a la Auditoria Corporativa de Grupo Aeroportuario de la Ciudad de México, S.A. De C.V.  	389000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
55	55	55	Presupuesto de Egresos de la Federación, 2015	46101	Transferencias a fideicomisos públicos	0	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
134	134	134	Presupuesto de Egresos de la Federación 2014, 2015,2016 y 2017	32201	Servicios de Arrendamiento de Edificios y Locales	18090000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México		http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
156	156	156	Presupuesto de Egresos de la Fedración 2015	46101	Transferencias a fideicomisos públicos	390000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
164	164	164				182500000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
104	104	104	Presupuesto de Egresos de la Federacion para el presente ejercicio fiscal en Gasto Corriente	32302	Arrendamiento de mobiliario	2735071	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México		http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
105	105	105	Presupuesto de Egresos de la Fedración 2014	35101	Mantenimiento y Conservación de Inmuebles	1852058	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México		http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
135	135	135	Presupuesto de Egresos de la Fedración 2015, 2016 y 2017	32201 y 35101	Servicios de Arrendamiento de Edificios y Locales y Mantenimiento y conservación de inmuebles para la prestación de servicios administrativos.	7417574	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México		http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
157	157	157	Presupuesto de Egresos de la Fedración 2015	46101	Transferencias a fideicomisos públicos	479484.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
183	183	183	Presupuesto de Egresos de la Fedración 2015	46101	Transferencias a fideicomisos públicos	450000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
88	88	88	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	54520000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
89	89	89	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	150000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
93	93	93	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	121700000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
91	91	91	Presupuesto de Egresos de la Federación 2015 y 2016	46101	Transferencias a fideicomisos públicos	12500000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
92	92	92	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	16000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
94	94	94	Presupuesto de Egresos de la Fedración 2015 	46101	Transferencias a fideicomisos públicos	9170000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
95	95	95	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	4000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
107	107	107	Presupuesto de Egresos de la Federación 2014	33604	Impresión y elaboración de material informativo derivado de la operación y administración de las dependencias y entidades, cuenta con suficiencia presupuestal	1800000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL000	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
215	215	215	Presupuesto de Egresos de la Federación 2015	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista	257569	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México		http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
79	79	79	Presupuesto de Egresos de la Federación 2015 y 2016	46101	Transferencias a fideicomisos públicos	10163709	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
90	90	90	Presupuesto de Egresos de la Fedración 2015 	46101	Transferencias a fideicomisos públicos	10400000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
82	82	82	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	26000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
83	83	83	Presupuesto de Egresos de la Federación 2015 y 2016	46101	Transferencias a fideicomisos públicos	18500000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
87	87	87	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	490000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
84	84	84	Presupuesto de Egresos de la Federación 2015 y 2016	46101	Transferencias a fideicomisos públicos	29000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
126	126	126	Presupuesto de Egresos de la Federación 2014	35801	Servicios de lavandería, limpieza e higiene.	65000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México		http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
85	85	85	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	2550000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
86	86	86	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	1203803000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
20	20	20	Presupuesto de Egresos de la Federación 2014	46101	Transferencias a fideicomisos públicos	527973	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
200	200	200	Presupuesto de Egresos de la Fedración 2015 	46101	Transferencias a fideicomisos públicos	1280000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
201	201	201	Presupuesto de Egresos de la Fedración 2015 	33104	Otras asesorias para la operación de programas	1704113.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	-	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
202	202	202	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	26000000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
217	217	217	Presupuesto de Egresos de la Federación 2015 y 2016	46101	Transferencias a fideicomisos públicos	10163709.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
41	41	41	Presupuesto de Egresos de la Federación 2015 y 2016	46101	Transferencias a fideicomisos públicos	28800000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
42	42	42	-	46101	Transferencias a fideicomisos públicos	1547417835	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
117	117	117	Presupuesto de Egresos de la Federación 2015	31101	Análisis costo beneficio	70000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
43	43	43	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	182500000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
128	128	128	Presupuesto de Egresos de la Federación 2015 y 2016	46101	Transferencias a fideicomisos públicos	9300000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
36	36	36	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	638000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
38	38	38	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	134800000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
39	39	39	Presupuesto de Egresos de la Fedración 2014	46101	Transferencias a fideicomisos públicos	9000000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
40	40	40	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	0.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
137	137	137	Presupuesto de Egresos de la Federación  2015	33301	Servicio integral de administración de personal y proceso de nomina, mediante un sistema especializado para recursos humanos y de nómina de gobierno	1802640.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México		http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
158	158	158	Presupuesto de Egresos de la Federación 2015	46101	Transferencias a fideicomisos públicos	400156	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
184	184	184	Presupuesto de Egresos de la Fedración 2015	46101	Transferencias a fideicomisos públicos	2450000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
37	37	37	Presupuesto de Egresos de la Fedración 2014 al 2024	46101	Transferencias a fideicomisos públicos	182500000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
1	1	1	Presupuesto de Egresos de la Fedración 2015 	46101	Transferencias a fideicomisos públicos	2355000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
118	118	118	Presupuesto de Egresos de la Federación 2015	46101	Transferencias a fideicomisos públicos	250000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
129	129	129	Presupuesto de Egresos de la Federación 2015	46101	Transferencias a fideicomisos públicos	1705000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
204	204	204	Presupuesto de Egresos de la Federación 2015 y 2016	46101	Transferencias a fideicomisos públicos	0	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
138	138	138	Presupuesto de Egresos de la Fedración 2016	46101	Transferencias a fideicomisos públicos	7400000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
159	159	159	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	57742619	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
185	185	185	Presupuesto de Egresos de la Fedración 2015	46101	Transferencias a fideicomisos públicos	294205	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
205	205	205	Presupuesto de Egresos de la Fedración 2016	31501	Servicio de Telefonía Celular	862560	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	No aplica	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
203	203	203			Programa anual de obras públicas y servicios relacionados con las mismas de GACM correspondiente al ejercicio fiscal 2015	310000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	
206	206	206	Presupuesto de Egresos de la Federación 2015 y 2016	46101	Transferencias a fideicomisos públicos	1276500	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2016/docs/09/r09_kdh_pie.pdf
207	207	207	Presupuesto de Egresos de la Federación 2014	33901	Subcontratación de Servicios con terceros.	129391633	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	No aplica	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
218	218	218	Presupuesto de Egresos de la Federación	46101	Aportaciones a Fideicomisos Publicos	11000000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.pef.hacienda.gob.mx/work/models/PEF/2016/docs/09/r09_kdh_feie.pdf
210	210	210	Presupuesto de Egresos de la Federación 2014	32201 y 35101	Servicios de Arrendamiento de Edificios y Locales y Mantenimiento y conservación de inmuebles para la prestación de servicios administrativos.	500498	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
119	119	119	Presupuesto de Egresos de la Federación 2015 y 2016	3300	Servicios Profesionales, científicos y técnicos y otros servicios 	1573425	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
130	130	130	Presupuesto de Egresos de la Federación 2016	46101	Transferencias a fideicomisos públicos	513600.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
211	211	211	Acuerdo CT/1AORD/24-ABRIL-2013/8-A Fondo Nacional de Infraestructura	Convenio de apoyo financiero (CAF) del 10 de junio de 2013	Convenio de apoyo financiero (CAF) del 10 de junio de 2014	64100000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México		http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
58	58	58	Programa anual de adquisiciones de GACM correspondiente al ejercicio fiscal 2015	62201	Transferencias a fideicomisos públicos	1802640	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	No aplica	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
170	170	170	Presupuesto de Egresos de la Fedración 2015 	46101	Transferencias a fideicomisos públicos	750000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
173	173	173	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	1400000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
187	187	187	Presupuesto de Egresos de la Fedración 2015	35801	Servicio de lavandería-Servicio de Limpieza para oficinas administrativas	361638	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México		http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
212	212	212				0	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
208	208	208	Presupuesto de Egresos de la Federación 2015			0	MXN			http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
209	209	209	Presupuesto de Egresos de la Federación 2015	46101	Transferencias a fideicomisos públicos	15650000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
219	219	219	Presupuesto de Egresos de la Federación	46101	Aportaciones a fideicomisos públicos	300000000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
220	220	220	Presupuesto de Egresos de la Federación	46101	Aportaciones a fideicomisos públicos	258775000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
98	98	98	Presupuesto de Egresos de la Federación 2015	46101	Transferencias a fideicomisos públicos	8500000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
35	35	35	Presupuesto de Egresos de la Fedración 2015	46101	Transferencias a fideicomisos públicos	602040.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
143	143	143	Presupuesto de Egresos de la Federación 2015	46101	Transferencias a fideicomisos públicos	9500000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
80	80	80	Presupuesto de Egresos de la Federación 2015 y 2016	46101	Transferencias a fideicomisos públicos	0	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
10	10	10	Presupuesto de Egresos de la Federación 2015 y 2016	46101	Transferencias a fideicomisos públicos	2441250.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
160	160	160	Presupuesto de Egresos de la Fedración 2015 y 2016		Transferencias a fideicomisos públicos	67996.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
188	188	188	Presupuesto de Egresos de la Federación  2015	33104	Otras asesorias para la operación de programas	1704113.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México		http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
32	32	32	Presupuesto de Egresos de la Fedración 2015	46101	Transferencias a fideicomisos públicos	458200.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
33	33	33	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	638000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
34	34	34	Presupuesto de Egresos de la Fedración 2015	46101	Transferencias a fideicomisos públicos	638000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
120	120	120	Presupuesto de Egresos de la Federación  2015, 2016, 2017 y 2018	62905	Otros servicios relacionados con la Obra Pública	726064480	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México		http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
56	56	56	Presupuesto de Egresos de la Federación 2015	46101	Transferencias a fideicomisos públicos	2355000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
176	176	176	Presupuesto de Egresos de la Federación 2014	31701	Configuración inicial de los equipos instalados en el inmueble de Altavista que dan servicio de Red Local, Seguridad de Datos y Telefonía.	224176.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México		http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
177	177	177	Presupuesto de Egresos de la Federación 2015	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista	257569	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México		http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
96	96	96	Presupuesto de Egresos de la Federación 2015 	46101	Transferencias a fideicomisos públicos	39000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
178	178	178	Presupuesto de Egresos de la Federación 2015	32301	Servicios de Arrendamiento de Equipos de Bienes Informáticos 	600000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México		http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
57	57	57	Presupuesto de Egresos de la Federación 2015	46101	Transferencias a fideicomisos públicos	424560	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
97	97	97	Presupuesto de Egresos de la Fedración 2015 	46101	Transferencias a fideicomisos públicos	15000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
179	179	179	Presupuesto de Egresos de la Federación 2015	32301	Servicios de Arrendamiento de Equipos de Bienes Informáticos 	600000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México		http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
180	180	180	Presupuesto de Egresos de la Federación 2015	31701	Servicio de conducción de señales Analogicas y digitales	490000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México		http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
181	181	181	Presupuesto de Egresos de la Federación 2015 y 2016	46101	Transferencias a fideicomisos públicos	1420000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
192	192	192	Presupuesto de Egresos de la Federación 		Servicio de Telefonía Celular	100000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	No aplica	
141	141	141	Presupuesto de Egresos de la Fedración 2015	46101	Transferencias a fideicomisos públicos	9750000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
145	145	145	Presupuesto de Egresos de la Federación 2015	46101	Transferencias a fideicomisos públicos	2136433615	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
146	146	146	Presupuesto de Egresos de la Federación 2016, 2017 y 2018	26104 y 26103	Combustibles, Lubricantes y Aditivos para vehículos terrestres asignados a servidores públicos y Combustibles, Lubricantes y Aditivos para vehículos terrestres asignados a servicios administrativos	17267047	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México		http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
147	147	147	Presupuesto de Egresos de la Federación 2015	46101	Transferencias a fideicomisos públicos	294205	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México		http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
148	148	148	Presupuesto de Egresos de la Federación 2016	46101	Transferencias a fideicomisos públicos	130000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
149	149	149	Presupuesto de Egresos de la Federación 2015	46101	Transferencias a fideicomisos públicos	490000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
150	150	150	Presupuesto de Egresos de la Federación 2015, 2016, 2017 y 2018	32301	Servicio de Arrendamiento de Equipos y Bienes Informáticos	47660000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
151	151	151	Presupuesto de Egresos de la Federación 2015	46101	Transferencias a fideicomisos públicos	580000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
152	152	152	Presupuesto de Egresos de la Federación 2015	46101	Transferencias a fideicomisos públicos	432601	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
153	153	153	Presupuesto de Egresos de la Federación 2015,2016, 2017 y 2018.	31701	Servicios de conducciones de señales analógicas y digitales.	39479421	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México		http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
154	154	154	Presupuesto de Egresos de la Federación 2015	46101	Transferencias a fideicomisos públicos	400000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
182	182	182	Presupuesto de Egresos de la Federación 2015			100000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
165	165	165	Presupuesto de Egresos de la Fedración 2015 	46101	Transferencias a fideicomisos públicos	638000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
191	191	191	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	182500000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
193	193	193	Presupuesto de Egresos de la Federación 2014	33104	Programa anual de adquisiciones de GACM correspondiente al ejercicio fiscal 2015	103448	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	No aplica	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
166	166	166	Presupuesto de Egresos de la Fedración 2015 	46101	Transferencias a fideicomisos públicos	539400.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
168	168	168		46101	Transferencias a fideicomisos públicos	7519121	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
167	167	167	Presupuesto de Egresos de la Fedración 2016, 2017, 2018 y 2019	46101	Transferencias a fideicomisos públicos	12925000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
169	169	169	Presupuesto de Egresos de la Fedración 2015 	46101	Transferencias a fideicomisos públicos	687931.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
142	142	142	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	1750000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
171	171	171	Presupuesto de Egresos de la Fedración 2015 	46101	Transferencias a fideicomisos públicos	6999000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
172	172	172	Presupuesto de Egresos de la Fedración 2015 	46101	Transferencias a fideicomisos públicos	720001.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
174	174	174	-	-	-	182500000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
186	186	186	Presupuesto de Egresos de la Fedración 2016	46101	Transferencias a fideicomisos públicos	0	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
175	175	175	Presupuesto de Egresos de la Federación 2015,2016, 2017 y 2018	31701	Servicios de conducciones de señales analógicas y digitales.	35399080	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México		http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
194	194	194	Presupuesto de Egresos de la Federación 2015	46101	Transferencias a fideicomisos públicos	0	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	No aplica	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
195	195	195	Presupuesto de Egresos de la Federación 2014.	31701	Configuración inicial de los equipos instalados en el inmueble de Altavista que dan servicio de Red Local, Seguridad de Datos y Telefonía.	224176	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	No aplica	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
196	196	196	Presupuesto de Egresos de la Federación 2015	62501	Construcción en Vías de Comunicación 	8410000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	No aplica	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
197	197	197	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	3950000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
139	139	139	Presupuesto de Egresos de la Federación 2015	46101	Transferencias a fideicomisos públicos	20360000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
161	161	161	Presupuesto de Egresos de la Fedración 2015	46101	Transferencias a fideicomisos públicos	690000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
189	189	189	Presupuesto de Egresos de la Fedración 2014, 2015,2016 y 2017	33101	Otras Asesorias para la Operación de Programas	1066665.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México		http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
63	63	63	Presupuesto de Egresos de la Federación 2015 	46101	Transferencias a fideicomisos públicos	39000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
64	64	64	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	16000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
65	65	65	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	50000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
66	66	66	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	3950000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
62	62	62	Presupuesto de Egresos de la Fedración 2015 	46101	Transferencias a fideicomisos públicos	7000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
2	2	2	Presupuesto de Egresos de la Federación 2015	46101	Transferencias a fideicomisos públicos	215000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
5	5	5	Presupuesto de Egresos de la Federación 2015	46101	Transferencias a fideicomisos públicos	522000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
190	190	190	Presupuesto de Egresos de la Federación  2015, 2016, 2017 y 2018	35801	Servicios Integrales de Infraestructura de Computo.	94138149	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México		http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
99	99	99	Presupuesto de Egresos de la Fedración 2015 	46101	Transferencias a fideicomisos públicos	7000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
198	198	198	Acuerdo CT/1AORD/24-ABRIL-2013/8-A Fondo Nacional de Infraestructura	Convenio de apoyo financiero (CAF) del 10 de junio de 2013	-	3415030000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	Acuerdo CT/1AORD/24-ABRIL-2013/8-A Fondo Nacional de Infraestructura	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
221	221	221	Presupuesto de Egresos de la Federación 2015 y 2016	46101		0		Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL000	
67	67	67	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	2550000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
68	68	68	Presupuesto de Egresos de la Fedración 2015 y 2016	46101	Transferencias a fideicomisos públicos	26000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
69	69	69	Presupuesto de Egresos de la Federación 2015 y 2016	46101	Transferencias a fideicomisos públicos	29000000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
70	70	70	Presupuesto de Egresos de la Federación 2015 y 2016	46101	Transferencias a fideicomisos públicos	18500000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
122	122	122	Presupuesto de Egresos de la Federación 2015 y 2016	33104	Otras asesorías para la operación de programas	1752166	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
60	60	60	Presupuesto de Egresos de la Federación 2015	4000	Transferencias a fideicomisos públicos	15200000	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
140	140	140	Presupuesto de Egresos de la Federación 2016	46101	Transferencias a fideicomisos públicos	8362000.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México	1409JZL0005	http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
162	162	162	Presupuesto de Egresos de la Fedración 2014, 2015,2016 y 2017	33301	Servicios de Informática	63798178.00	MXN	Nuevo Aeropuerto Internacional de la Ciudad de México		http://www.apartados.hacienda.gob.mx/presupuesto/temas/pef/2015/docs/09/r09_kdh_pie.pdf
\.


--
-- Name: budget_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('budget_id_seq', 222, true);


--
-- Data for Name: buyer; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY buyer (id, contractingprocess_id, name, identifier_scheme, identifier_id, identifier_legalname, identifier_uri, address_streetaddress, address_locality, address_region, address_postalcode, address_countryname, contactpoint_name, contactpoint_email, contactpoint_telephone, contactpoint_faxnumber, contactpoint_url) FROM stdin;
218	218	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
198	198	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
175	175	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
71	71	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
111	111	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
112	112	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
113	113	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
114	114	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
115	115	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
116	116	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
41	41	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
90	90	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
144	144	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
117	117	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
118	118	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
16	16	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
219	219	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
220	220	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
119	119	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
199	199	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
120	120	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
176	176	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
177	177	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
178	178	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
179	179	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
180	180	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
181	181	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
122	122	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
15	15	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
124	124	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
221	221	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
174	174	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
19	19	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
121	121	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
52	52	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
145	145	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
191	191	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
30	30	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
183	183	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
72	72	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
45	45	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
200	200	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
201	201	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
202	202	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
182	182	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
23	23	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
194	194	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
184	184	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
185	185	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
186	186	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
57	57	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
8	8	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
222	222	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
187	187	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
188	188	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
66	66	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
129	129	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
161	161	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
162	162	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
152	152	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
125	125	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
5	5	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
78	78	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
79	79	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
49	49	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
50	50	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
51	51	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
93	93	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
143	143	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
39	39	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
12	12	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
83	83	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
58	58	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
59	59	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
60	60	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
70	70	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
61	61	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
37	37	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
81	81	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
169	169	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
170	170	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
94	94	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
32	32	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
65	65	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
3	3	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
147	147	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
148	148	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
22	22	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
132	132	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
138	138	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
31	31	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
130	130	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
215	215	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
146	146	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
47	47	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
48	48	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
14	14	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
126	126	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
63	63	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
33	33	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
42	42	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
106	106	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
43	43	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
46	46	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
109	109	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
55	55	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
56	56	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
135	135	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
136	136	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
137	137	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
62	62	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
195	195	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
196	196	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
123	123	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
133	133	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
6	6	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
96	96	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
97	97	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
64	64	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
10	10	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
67	67	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
139	139	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
87	87	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
82	82	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
163	163	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
164	164	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
100	100	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
101	101	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
91	91	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
18	18	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
92	92	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
102	102	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
13	13	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
208	208	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
20	20	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
44	44	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
53	53	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
189	189	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
190	190	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
203	203	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
204	204	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
205	205	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
165	165	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
166	166	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
11	11	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
73	73	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
36	36	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
26	26	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
89	89	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
167	167	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
168	168	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
157	157	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
158	158	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
160	160	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
27	27	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
172	172	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
173	173	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
159	159	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
88	88	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
206	206	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
207	207	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
192	192	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
193	193	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
75	75	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
103	103	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
104	104	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
105	105	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
76	76	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
77	77	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
4	4	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
80	80	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
9	9	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
24	24	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
25	25	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
171	171	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
134	134	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
211	211	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
212	212	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
107	107	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
21	21	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
17	17	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
85	85	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
213	213	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
214	214	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
29	29	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
209	209	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
210	210	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
69	69	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
40	40	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
110	110	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
153	153	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
154	154	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
155	155	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
156	156	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
38	38	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
108	108	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
216	216	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
217	217	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
74	74	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
141	141	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
140	140	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
54	54	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
142	142	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
86	86	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
197	197	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
131	131	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
150	150	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
151	151	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
28	28	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
68	68	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
1	1	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
2	2	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
7	7	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
34	34	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
35	35	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
127	127	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
128	128	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
149	149	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
84	84	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
95	95	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
98	98	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
99	99	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	\N	GACM	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	http://www.aeropuerto.gob.mx/	Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel	Alvaro Obregón	Ciudad de México	01090	México	\N	\N	\N	\N	\N
\.


--
-- Name: buyer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('buyer_id_seq', 222, true);


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
79	79	-	GACM/DCI/SJ/CM/18-2015	Proyecto de Salvamento Arqueológico en el interior del Lago de Taxcoco en su zona oriente, Estado de México. (Supervisión, Vigilancia y Excavaciones 2016), en Adelante los SERVICIOS, mismos que serán realizados totalmente a satisfacción del GACM	Proyecto de Salvamento Arqueológico en el interior del Lago de Taxcoco en su zona oriente, Estado de México. (Supervisión, Vigilancia y Excavaciones 2016), en Adelante los SERVICIOS, mismos que serán realizados totalmente a satisfacción del GACM	active	2016-02-16 00:00:00	2016-12-31 00:00:00	8761818.1	MXN	2016-02-15 00:00:00	\N	
208	208	1	AD-AS-DCAGI-SC-022/15 	Servicio de Estacionamiento para Vehículos		terminated	2015-04-01 00:00:00	2015-12-31 00:00:00	300258.62	MXN	2015-04-01 00:00:00	\N	
56	56	No aplica	AD-AS-DCAGI-SC-54/15	Adquisición de Uniformes	El objeto del presente contrato es la adquisición de bienes muebles, en adelante "LOS BIENES" por parte de GACM, consistentes en: "VESTUARIO"	active	2015-07-11 00:00:00	2015-07-31 00:00:00	28320	MXN	2015-07-10 00:00:00	\N	
194	194	IA-009KDH999-E97-2015	ITP-AS-DCAGI-SC-005-16	Servicios de asesoría, relacionados con la implemntación de la estructura de gobierno coporativo para la administración del GACM.	Servicios de asesoría, relacionados con la implemntación de la estructura de gobierno coporativo para la administración del GACM.	terminated	2016-02-04 00:00:00	2017-08-03 00:00:00	4930328.89	MXN	2016-02-04 00:00:00	\N	
80	80	-	GACM/DCI/SJ/CM-018-2015	Estalecer las bases generales a que se sujetaran GACM y la UANL así como, pactos comunes y el objeto genérico de futuros servicios de carácter científico y tecnológico u otro tipo que acuerden las mismas​	Estalecer las bases generales a que se sujetaran GACM y la UANL así como, pactos comunes y el objeto genérico de futuros servicios de carácter científico y tecnológico u otro tipo que acuerden las mismas​	none	2015-09-09 00:00:00	\N	0	MXN	\N	\N	
192	192	No aplica	GACM-SEC/01/2014	Servicio de Telefonía Celular	Prestación del  "SERVICIOS DE TELEFONÍA CELULAR, PARA GRUPO AEROPORTUARIO DE LA CIUDAD DE MÉXICO, S.A. DE C.V.", los cuales serán prestados totalmente a satisfacción de GACM, de conformidad con las especificaciones y características establecidas 	active	2014-11-01 00:00:00	2014-12-31 00:00:00	724550	MXN	2014-11-01 00:00:00	\N	
221	221	1	GACM/DG/DCAGI/SJ/CI/01-2014	Convenio de Cooperación para el uso y goce temporal a Título gratuito de los inmuebles identificados como Edificio R1 Planta Baja 381. 73 m2 lado derecho, Edificio R1 Planta Baja 192.98 m2 lado izquierdo y edificio R1 Planta Alta 203.75 m2, situadas en el edificio Ex tienda. 	Convenio de Cooperación para el uso y goce temporal a Título gratuito de los inmuebles identificados como Edificio R1 Planta Baja 381. 73 m2 lado derecho, Edificio R1 Planta Baja 192.98 m2 lado izquierdo y edificio R1 Planta Alta 203.75 m2, situadas en el edificio Ex tienda. 	active	2014-06-07 00:00:00	\N	0		\N	\N	
112	112	1	AD-A-DCAGI-SC-001/2014	Arrendamientos de vehículos terrestres		active	2014-11-24 00:00:00	2017-11-24 00:00:00	43011360.00	MXN	2014-11-24 00:00:00	\N	
222	222	IA-009KDH999-N6-2014	ITP-AS-DCAGI-SC-007/14	Mantenimiento, suministro, instalación y puesta en operación de la instalaciones de voz y datos y electricidad en las oficinas de Grupo Aeroportuario de la Ciudad de México, S. A. de C. V. 	Mantenimiento, suministro, instalación y puesta en operación de la instalaciones de voz y datos y electricidad en las oficinas de Grupo Aeroportuario de la Ciudad de México, S. A. de C. V. 	terminated	2014-12-05 00:00:00	2014-12-31 00:00:00	2481886.09	MXN	2014-12-05 00:00:00	\N	
121	121	1	AD-AS-DCAGI-SC-106-15 	Servicio de Limpieza Integralpara los Inmuebles de Santa Catarina-Altavista y Torre Murano del Grupo Aeroportuario de la Ciudad de México S.A. de C.V.		terminated	2015-09-15 00:00:00	2015-12-31 00:00:00	258612.50	MXN	2015-09-15 00:00:00	\N	
58	58	No aplica	AD-AS-DCAGI-SC-072-15	" Contrato de adquisicion de bienes a precio fijo consistentes en adquisición de prendas de vestir para el programa de empleo temporal (PET)"	Adquisicion de bienes a precio fijo consistentes en adquisición de prendas de vestir para el programa de empleo temporal (PET)"	terminated	2015-05-27 00:00:00	2015-10-23 00:00:00	1040682.96	MXN	2015-06-11 00:00:00	\N	
148	148	1	AD-AS-DCAGI-SC-029-16	Servicio de recolección de residuos urbanos	Servicio de recolección de residuos urbanos	terminated	2016-04-05 00:00:00	2016-06-17 00:00:00	122100.00	MXN	2016-04-19 00:00:00	\N	
18	18	AO-009KDH999-E46-2016	AD-SRO-DCAGI-SC-100/15	Servicios de experto revisor para la asistencia técnica especializada en materia de diseño estructural, aplicada  a la infraestructura aeroportuaria.	Servicios de experto revisor para la asistencia técnica especializada en materia de diseño estructural, aplicada  a la infraestructura aeroportuaria.	terminated	2015-12-01 00:00:00	2015-05-23 00:00:00	176400.00	USD	2015-12-01 00:00:00	\N	
21	21	SA-009KDH999-N12-2015	AD-S-DCAGI-SC-017/2014	Servicio de un Testigo Social para que atestigüe en las etapas de la invitación a cuando menos tres personas, presencial, internacional bajo la cobertura de trarados de libre comercio, relativa a la contratación de los servicios relacionados con obra pública, consistentes en el desarrollo del proyecto ejecutivo de pistas, rodajes y plataformas y ayudas a la navegación y otras instalaciones del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	Servicio de un Testigo Social para que atestigüe en las etapas de la invitación a cuando menos tres personas, presencial, internacional bajo la cobertura de trarados de libre comercio, relativa a la contratación de los servicios relacionados con obra pública, consistentes en el desarrollo del proyecto ejecutivo de pistas, rodajes y plataformas y ayudas a la navegación y otras instalaciones del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	terminated	2014-10-29 00:00:00	\N	539531.22	MXN	2014-10-29 00:00:00	\N	
1	1	AA-009KDH999-E2-2016	AD-AS-DCAGI-SC-031/15	Prestación de los Servicios consistentes en la elaboración del: “Plan de Acciones de Monitoreo y Conservación de Aves para el Nuevo Aeropuerto Internacional de la Ciudad de México”.	Servicio relacionado con el programa de empleo temporal (PET) correspondiente a las acciones preparatorias para la construcción del Nuevo Aeropuerto Internacional de la Ciudad de México (servicio de traslado de personas).	terminated	2015-05-18 00:00:00	2015-06-26 00:00:00	800000.00	MXN	2015-06-02 00:00:00	\N	
71	71	-	GACM/DCI/SJ/CI/001-2015                                                                    	Llevar a cabo el servicio de elaboración de programas y propuestas de acciones, ambientales para el proyecto Nuevo Aeropuerto de la Ciudad de México (NAICM)	Llevar a cabo el servicio de elaboración de programas y propuestas de acciones, ambientales para el proyecto Nuevo Aeropuerto de la Ciudad de México (NAICM)	terminated	2015-01-01 00:00:00	2015-03-31 00:00:00	6610000	MXN	2015-01-01 00:00:00	\N	
39	39	-	GACM/DCI/SJ/CI/05-2014	Desarrollo del Proyecto Ejecutivo del Sistema de Video Vigilancia del Nuevo Aeropuerto Internacional de la Ciudad de México.	Desarrollo del Proyecto Ejecutivo del Sistema de Video Vigilancia del Nuevo Aeropuerto Internacional de la Ciudad de México.	terminated	2014-10-30 00:00:00	2015-01-29 00:00:00	8991688.20	MXN	2014-10-30 00:00:00	\N	
170	170	AO-009KDH999-E52-2016	AD-SRO-DCAGI-SC-039/15	Servicios consistentes en Baños portátiles	Servicios consistentes en Baños portátiles	terminated	2015-07-15 00:00:00	2015-12-31 00:00:00	558618.50	MXN	2015-07-15 00:00:00	\N	
125	125	1	AD.DIR/01/SJ/2014	Sevicios de Regularización de la Información Relativa a la Auditoria Corporativa de Grupo Aeroportuario de la Ciudad de México, S.A. De C.V.	Prestación de los Servicios de Regularización de la Información Relativa a la Auditoria Corporativa de Grupo Aeroportuario de la Ciudad de México, S.A. De C.V.  	terminated	2014-11-25 00:00:00	2014-12-31 00:00:00	389000.00	MXN	2014-11-25 00:00:00	\N	
73	73	-	GACM/DCI/SJ/CI/02-2014	"Estudio para definir los bancos de préstamo, bancos de depósito y laboratorio de materiales, para el Proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México"	"Estudio para definir los bancos de préstamo, bancos de depósito y laboratorio de materiales, para el Proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México"	terminated	2014-10-30 00:00:00	2014-12-15 00:00:00	13051740.00	MXN	2015-10-30 00:00:00	\N	
61	61	ITP-SRO-DCAGI-SC-049/2015	ITP-SRO-DCAGI-SC-049/2015	Programa general de abastecimiento, uso y disposición de agua del nuevo Aeropuerto Internacional de la Ciudad de México (PROAGUA), Etapa I	Programa general de abastecimiento, uso y disposición de agua del nuevo Aeropuerto Internacional de la Ciudad de México (PROAGUA), Etapa I	none	2015-07-31 00:00:00	2015-12-31 00:00:00	8150489.03	MXN	2015-07-31 00:00:00	\N	
22	22	AD-SRO-CONV-DCAGI-SC-002/16	AD-SRO-CONV-DCAGI-SC-002/16	Etapa 2; seguimiento para el cumplimiento ambiental del proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM) a través de la entidad de supervisión ambiental (Condicionante 10, resolutivo MIA-R.	Etapa 2; seguimiento para el cumplimiento ambiental del proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM) a través de la entidad de supervisión ambiental (Condicionante 10, resolutivo MIA-R.	active	2016-03-01 00:00:00	2018-10-26 00:00:00	227520000.00	MXN	2016-03-01 00:00:00	\N	
62	62	IO-009KDH999-N34-2015	ITP-SRO-DCAGI-SC-037/15	Proyecto Ejecutivo para la Construcción del Camino perimetral y sus instalaciones complementarias en el lado Norte del Polígono del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	Proyecto Ejecutivo para la Construcción del Camino perimetral y sus instalaciones complementarias en el lado Norte del Polígono del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	terminated	2015-06-13 00:00:00	2015-07-27 00:00:00	5997988.52	MXN	2015-06-13 00:00:00	\N	
7	7	1	AD-SRO-DCAGI-SC-087/15	Servicios de Asistencia Técnica Especializada en materia de Hidráulica aplicada a la Infraestructura Aeroportuaria	Prestar los servicios de obra consistentes en: Servicios de Experto revisor para el Panel de Hidráulica aplicada a la Infraestructura Aeroportuaria	terminated	2015-12-01 00:00:00	2016-03-29 00:00:00	1627500.00	MXN	2015-12-01 00:00:00	\N	
13	13	AD-SRO-DCAGI-SC-095/16	AD-SRO-DCAGI-SC-095/15	Servicios de experto revisor para el panel de hidráiulica aplicada a la infraestructura aeroportuaria.	Servicios de experto revisor para el panel de hidráiulica aplicada a la infraestructura aeroportuaria.	terminated	2015-12-01 00:00:00	2016-03-29 00:00:00	1403017.24	MXN	2015-12-01 00:00:00	\N	
66	66	LO-009KDH999-N16-2015	LPN-SRO-DCAGI-SC-025/15	Estudio de Suministro Electrico para el Nuevo Aeropuerto Internacional de la Ciudad de México	Servicios relativos al Estudio de Suministro Electrico para el Nuevo Aeropuerto Internacional de la Ciudad de México	terminated	2015-05-15 00:00:00	2015-08-27 00:00:00	7582404.32	MXN	2015-05-15 00:00:00	\N	
46	46	-	GACM/DCPEV/SJ/CG-E/06-2015	"Estudio sobre las estrategias públicas de diversas administraciones federales para el desarrollo del NAICM y otras herramientas de analisis histórico documental."	"Estudio sobre las estrategias públicas de diversas administraciones federales para el desarrollo del NAICM y otras herramientas de analisis histórico documental."	terminated	2015-03-02 00:00:00	2015-06-16 00:00:00	0	MXN	\N	\N	
70	70	LO-009KDH999-N42-2015	LPN-SRO-DCAGI-SC-042/15	Implementación del Programa de Rescate de Flora y Fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México	Implementación del Programa de Rescate de Flora y Fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México	active	2015-07-21 00:00:00	2016-12-31 00:00:00	11924906.62	MXN	2015-07-21 00:00:00	\N	
55	55	-	AD-AS-DCAGI-SC-053/15 	Adquisición de Bienes Consistentes en Herramientas	La adquisición de bienes muebles consistentes como Herramientas 	active	2015-07-10 00:00:00	2015-07-25 00:00:00	87094.69	MXN	\N	\N	
205	205	No aplica	AD-AS-DCAGI-SC-035-16	Servicio de Telefonía Celular	Prestación del  "SERVICIOS DE TELEFONÍA CELULAR, PARA GRUPO AEROPORTUARIO DE LA CIUDAD DE MÉXICO, S.A. DE C.V.", los cuales serán prestados totalmente a satisfacción de GACM, de conformidad con las especificaciones y características establecidas 	none	\N	\N	724550	MXN	2016-05-01 00:00:00	\N	
23	23	-	AD-SRO-CONV-DCAGI-SC-04/16	Brindar la asistencia técnica, asesoramiento, colaboración, coadyuvancia, consultoría, orientación y dé propuestas de soluciones a las distintas situaciones que se presenten, en lo referente a la logística de operación para la realización de las obras al exterior del polígono, en donde se alojará la construcción del NAICM, e incluye el seguimiento y la aprobación de los estudios y proyectos que se necesiten en materia de infraestructura carretera y demás actividades afines.	Brindar la asistencia técnica, asesoramiento, colaboración, coadyuvancia, consultoría, orientación y dé propuestas de soluciones a las distintas situaciones que se presenten, en lo referente a la logística de operación para la realización de las obras al exterior del polígono, en donde se alojará la construcción del NAICM, e incluye el seguimiento y la aprobación de los estudios y proyectos que se necesiten en materia de infraestructura carretera y demás actividades afines.	active	2016-04-01 00:00:00	2020-12-31 00:00:00	0		2016-04-01 00:00:00	\N	
2	2	SA009KDH99-N73-2015	AD-AS-DCAGI-SC-050-2015	Servicio de testigo social para que atestigue las etapas del procedimiento de licitación pública nacional presencial, relativa a la contratación de la obra pública, consistente en el proyecto ejecutivo, construcción equipamiento mobiliario e instalaciones complementarias, para el campamento del grupo aeroportuario de la Ciudad de México en el sitio del Nuevo Aeropuerto Internacional de la Ciudad de México 	Servicio de testigo social para que atestigue las etapas del procedimiento de licitación pública nacional presencial, relativa a la contratación de la obra pública, consistente en el proyecto ejecutivo, construcción equipamiento mobiliario e instalaciones complementarias, para el campamento del grupo aeroportuario de la Ciudad de México en el sitio del Nuevo Aeropuerto Internacional de la Ciudad de México 	terminated	2015-06-30 00:00:00	2015-12-31 00:00:00	247200.64	 MXN	2015-06-30 00:00:00	\N	
24	24	AD-SRO-CONV-DCAGI-SC-006/16	AD-SRO-CONV-DCAGI-SC-006/16	Servicio de instrumentación y operación de planes y programas ambientales para el Nuevo Aeropuerto Internacional de la ciudad de México (NAICM), Etapa 2016-2018.	Servicio de instrumentación y operación de planes y programas ambientales para el Nuevo Aeropuerto Internacional de la ciudad de México (NAICM), Etapa 2016-2018.	active	2016-04-01 00:00:00	2018-10-26 00:00:00	236900000.00	MXN	2016-04-01 00:00:00	\N	
189	189	-	AD-AS-DCAGI-SC-065/15	Arrendamiento de oficina Torre Murano	Uso y goce temporal del Bien arrendado y los cajones de estacionamiento	terminated	2015-09-01 00:00:00	2015-12-31 00:00:00	853332.00	MXN	2015-09-09 00:00:00	\N	
26	26	Adjudicación Directa	AD-SRO-DCAGI-SC-002/16	Supervisión del Proyecto Ejecutivo, Construcción, Equipamiento, Mobiliario e Instalaciones Complementarias para el Campamento del Grupo Aeropuertario de la Ciudad de México (GACM) en el sitio del Nuevo Aeropuerto Internacional de la Ciudad de México	Supervisión del Proyecto Ejecutivo, Construcción, Equipamiento, Mobiliario e Instalaciones Complementarias para el Campamento del Grupo Aeropuertario de la Ciudad de México (GACM) en el sitio del Nuevo Aeropuerto Internacional de la Ciudad de México	active	2016-01-14 00:00:00	2016-07-11 00:00:00	3695222.82	MXN	2016-01-14 00:00:00	\N	
74	74	GACM/DCI/SJ/CI/03-2014	-	Estudio para la Detección y Levantamiento de Anomalías, Obstáculos e Instlaciones (Extracción de Ademes), en el Terreno del Nuevo Aeropuerto Internacional de la Ciudad de México	Estudio para la Detección y Levantamiento de Anomalías, Obstáculos e Instlaciones (Extracción de Ademes), en el Terreno del Nuevo Aeropuerto Internacional de la Ciudad de México	terminated	2014-10-30 00:00:00	2014-12-30 00:00:00	10954142.71	MXN	2014-10-30 00:00:00	\N	
3	3	1	AD-AS-DCAGI-SC-008/16	Testigo Social para que atestigue las etapas del Procedimiento de Licitación Publica Nacional para el Proyecto denominado "Excavación de Prueba, Losa Experimental y Prueba de Pilotes para el Edificio Terminal y Torre de Control"	Testigo Social para que atestigue las etapas del Procedimiento de Licitación Publica Nacional para el Proyecto denominado "Excavación de Prueba, Losa Experimental y Prueba de Pilotes para el Edificio Terminal y Torre de Control"	active	\N	\N	269225.44	MXN	2016-02-10 00:00:00	\N	
25	25	SO-009KDH999-N74-2015	AD-SRO-DCAGI-SC-001/15	Proyecto ejecutivo del drenaje pluvial temporal para la protección de la zona contra inundaciones provenientes de precipitaciones dentro del perímetro del Aeropuerto en el lago de Texcoco, durante la construcción de la primera fase del Nuevo Aeropuerto Internacionale de la Ciudad de México	Proyecto ejecutivo del drenaje pluvial temporal para la protección de la zona contra inundaciones provenientes de precipitaciones dentro del perímetro del Aeropuerto en el lago de Texcoco, durante la construcción de la primera fase del Nuevo Aeropuerto Internacionale de la Ciudad de México	terminated	2015-01-30 00:00:00	2015-04-02 00:00:00	16708712.52	MXN	2015-02-19 00:00:00	\N	
4	4	1	AD-SRO-DCAGI-SC-010/16	Servicio de Experto Revisor para el Panel de Hidráulica Aplicada a la Infraestructura Aeroportuaria.	Servicio de Experto Revisor para el Panel de Hidráulica Aplicada a la Infraestructura Aeroportuaria.	terminated	2016-01-29 00:00:00	2016-05-29 00:00:00	1627500.00	 MXN	2016-01-29 00:00:00	\N	
5	5	AA-009KDH999-E10-2016	AD-AS-DCAGI-SC-073/15	Servicios de un Profesionista Especializado en Temas de Desarrollo Urbano, Territorial y Regional para el Proyecto del Nuevo Aeropuerto de la Ciudad de México.	Servicios de un Profesionista Especializado en Temas de Desarrollo Urbano, Territorial y Regional para el Proyecto del Nuevo Aeropuerto de la Ciudad de México.	active	2015-09-18 00:00:00	\N	406000.00	MXN	2015-09-18 00:00:00	\N	
6	6	AO-009KDH999-E38-2016	AD-SRO-DCAGI-SC-85/15	Asistencia Técnica Especializada en Materia de Diseño Sísmico Estructural aplicada a la Infraestructura Aeroportuaria	Prestar los servicios de obra consistentes en: Asistencia Técnica Especializada en Materia de Diseño Sísmico Estructural aplicada a la Infraestructura Aeroportuaria"	terminated	2015-12-01 00:00:00	2016-05-23 00:00:00	2104525.86	MXN	2015-12-01 00:00:00	\N	
27	27	SO-009KDH999-N32-2015	AD-SRO-DCAGI-SC-002/2015	Plan de Monitoreo, registro y verificación de emisión de gases de efecto invernadero para el Nuevo Aeropuerto Internacional de la Ciudad de México.	Prestación de los servicos consistentes en la elaboración de estudios de geotécnia, topografia,  gedésia  y levantamiento de información geografica através de un vuelo con tecnología Lidar.	terminated	2015-02-24 00:00:00	2015-05-24 00:00:00	29233731.65	MXN	2015-02-23 00:00:00	\N	
75	75	GACM/DCI/SJ/CI/04-2014	-	Elaboración del Estudio Dictamen del Proyecyo de Inversión (Factibilidad Técnica, Económica, Legal y Estudios Relacionados) del Nuevo Aeropuerto Internacional de la Ciudad de México	Elaboración del Estudio Dictamen del Proyecyo de Inversión (Factibilidad Técnica, Económica, Legal y Estudios Relacionados) del Nuevo Aeropuerto Internacional de la Ciudad de México	terminated	2014-10-30 00:00:00	2014-12-15 00:00:00	10954142.71	MXN	2014-10-30 00:00:00	\N	
8	8	AO-009KDH999-E39-2016	AD-SRO-DCAGI-SC-088/15	Servicios de asistencia técnica especializada en materia de diseño sismico estructural aplicada a la infraestructura aeroportuaria.	Servicios de asistencia técnica especializada en materia de diseño sismico estructural aplicada a la infraestructura aeroportuaria.	terminated	2015-12-01 00:00:00	2016-05-23 00:00:00	1465517.24	MXN	2015-12-01 00:00:00	\N	
53	53	AA-009KDH999-E66-2016	AD-AS-DCAGI-SC-019-BIS/2015	Servicios en el seguimiento, representación y defensa en juicio, presentes en materia laboral.	Servicios en el seguimiento, representación y defensa en juicio, presentes en materia laboral. 	terminated	2015-04-24 00:00:00	2015-08-23 00:00:00	309310.34	MXN	2015-04-24 00:00:00	\N	
87	87	LO-009KDH999-N50-2015	LPN-OP-DCAGI-SC-076/15	Para los trabajos relativos a la construcción del drenaje pluvial temporal	Construcción de tres drenes principales, tres canales existentes (parcialmente), tres plantas de bombeo, dos lagunas de regulación, veintidós alcantarilla y dos salidas al Dren General del Valle, al poniente del predio. Rehabilitación de caminos de acceso y puentes alcantarilla para permitir el paso de vehículos de una margen del dren a la margen opuesta.	active	2015-10-09 00:00:00	2016-03-07 00:00:00	192525597.09	MXN	2015-10-09 00:00:00	\N	
100	100	IO-009KDH999-N29-2015	ITP-SRO-DCAGI-SC-027/15	Servicios de Consultoría Técnica Especializada en Revisión e Integración de Términos de Referencia y Especificaciones Técnicas, de Proyectos de Licitación de Obras Públicas	Servicios de Consultoría Técnica Especializada en Revisión e Integración de Términos de Referencia y Especificaciones Técnicas, de Proyectos de Licitación de Obras Públicas	terminated	2015-05-22 00:00:00	2015-12-31 00:00:00	12642390.01	MXN	2015-05-22 00:00:00	\N	
104	104	IA-009KDH999-N8-2014	ITP-S-DCAGI-SC-009/2014	Arrendamiento de Mobiliario Para Las Instalaciones De Torre Murano	Arrendamiento de Mobiliario Para Las Instalaciones De Torre Murano	active	2014-12-05 00:00:00	2017-12-05 00:00:00	1595304	MXN	2014-12-05 00:00:00	\N	
9	9	1	AD-SRO-DCAGI-SC-090/15	Prestación del "Servicio para la Asistencia Técnica Especializada en Materia de  Geotecnia y Cimentación Aplicada a la Infraestructura Aeroportuaria"	Prestación del "Servicio para la Asistencia Técnica Especializada en Materia de  Geotecnia y Cimentación Aplicada a la Infraestructura Aeroportuaria"	terminated	2015-12-01 00:00:00	2016-05-31 00:00:00	1953000.00	MXN	2015-12-01 00:00:00	\N	
10	10	1	AD-SRO-DCAGI-SC-091/15	Prestación del "Servicio para la Asistencia Técnica Especializada en Materia de Diseño Sísmico Estructural Aplicada a la Infraestructura Aeroportuaria"	Prestación del "Servicio para la Asistencia Técnica Especializada en Materia de Diseño Sísmico Estructural Aplicada a la Infraestructura Aeroportuaria"	terminated	2015-12-01 00:00:00	2016-05-20 00:00:00	2441250.00	MXN	2015-12-01 00:00:00	\N	
72	72	-	GACM/DCI/SJ/CI/012-2015                                                                    	Llevar a cabo el Servicio de Investigaciones y Estudios Especiales, Relacionados con Aspectos Estructurales del Nuevo Aeropuerto de la Ciudad de México (NAICM) en el Vaso del Ex-Lago de Texcoco, Zona Federal	Llevar a cabo el Servicio de Investigaciones y Estudios Especiales, Relacionados con Aspectos Estructurales del Nuevo Aeropuerto de la Ciudad de México (NAICM) en el Vaso del Ex-Lago de Texcoco, Zona Federal	active	2015-06-01 00:00:00	2016-12-31 00:00:00	55525000	MXN	2015-06-01 00:00:00	\N	
11	11	1	AD-SRO-DCAGI-SC-093/15	Prestación del "Servicio para la Asistencia Técnica Especializada en Materia de  Geotecnia y Cimentación Aplicada a la Infraestructura Aeroportuaria"	Prestación del "Servicio para la Asistencia Técnica Especializada en Materia de  Geotecnia y Cimentación Aplicada a la Infraestructura Aeroportuaria"	terminated	2015-12-01 00:00:00	2016-05-31 00:00:00	1953000.00	MXN	2015-12-01 00:00:00	\N	
28	28	SO-09KDH999-N26-2015	AD-SRO-DCAGI-SC-003/15	Plan de Maestro  para  el  Proyecto	Plan de Maestro  para  el  Proyecto	terminated	2015-03-02 00:00:00	2015-08-03 00:00:00	1495000.00	USD	2015-03-02 00:00:00	\N	
12	12	AD-SRO-DCAGI-SC-094/16	AD-SRO-DCAGI-SC-094/15	Servicios de experto revisor para la asistencia técnica especializada en materia de diseño sismico estructural, aplicada a la infraestructura aeroportuaria	Servicios de experto revisor para la asistencia técnica especializada en materia de diseño sismico estructural, aplicada a la infraestructura aeroportuaria	terminated	2015-12-01 00:00:00	2016-05-23 00:00:00	189000.00	USD	2015-12-01 00:00:00	\N	
63	63	IO-009KDH999-N41-2015	ITP-SRO-DCAGI-SC-048/15	Elaboración del estudio de las características topográficas del terreno del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	Elaboración del estudio de las características topográficas del terreno del Nuevo Aeropuerto Internacional de la Ciudad de México, que deberan realizarse de conformidad con los Términos de referencia	terminated	2015-07-29 00:00:00	2015-09-26 00:00:00	33577144.97	MXN	2015-07-29 00:00:00	\N	
29	29	SO-009KDH999-N22-2015	AD-SRO-DCAGI-SC-004/15	Prestación de los Servicios consistentes en la elaboración del: Plan de restauración ecológica para el Nuevo Aeropuerto Internacional de la Ciudad de México	Prestación de los Servicios consistentes en la elaboración del: Plan de restauración ecológica para el Nuevo Aeropuerto Internacional de la Ciudad de México	terminated	2015-02-23 00:00:00	2015-03-23 00:00:00	449999.61	MXN	2015-02-20 00:00:00	\N	
14	14	AO-009KDH999-E34-2016	AD-SRO-DCAGI-SC-096/15	Servicios de experto revisor para la asistencia técnica especializada en materia de protección contra incendios, aplicada a la infraestructura aeroportuaria.	Servicios de experto revisor para la asistencia técnica especializada en materia de protección contra incendios, aplicada a la infraestructura aeroportuaria.	terminated	2015-12-01 00:00:00	2016-03-25 00:00:00	1898750.00	MXN	2015-12-01 00:00:00	\N	
76	76	-	GACM/DCI/SJ/CI/013-2015                                                                    	Llevar a cabo el Servicio de Investigaciones y Estudios Especiales Relacionados con Aspectos Geotécnicos del Nuevo Aeropuerto de la Ciudad de México (NAICM) en el Vaso del Ex-Lago de Texcoco, Zona Federal	Llevar a cabo el Servicio de Investigaciones y Estudios Especiales Relacionados con Aspectos Geotécnicos del Nuevo Aeropuerto de la Ciudad de México (NAICM) en el Vaso del Ex-Lago de Texcoco, Zona Federal	none	2015-06-01 00:00:00	2016-12-31 00:00:00	152849934	MXN	2015-06-01 00:00:00	\N	
16	16	AO-009KDH999-E31-2016	AD-SRO-DCAGI-SC-098/15	Servicio de asistencia técnica especializada en materia de Geotecnia y Cimentación aplicada a la infraestructura aeroportuaria.	Servicio de asistencia técnica especializada en materia de Geotecnia y Cimentación aplicada a la infraestructura aeroportuaria.	terminated	2015-12-01 00:00:00	2016-05-01 00:00:00	1683620.69	MXN	2015-12-01 00:00:00	\N	
15	15	AO-009KDH999-E41-2016	AD-SRO-DCAGI-SC-097/15	Servicio de asistencia técnica especializada en materia de hidráulica aplicada a la infraestructura aeroportuaria.	Servicio de asistencia técnica especializada en materia de hidráulica aplicada a la infraestructura aeroportuaria.	terminated	2015-12-02 00:00:00	2016-04-02 00:00:00	1403017.24	MXN	2015-12-01 00:00:00	\N	
17	17	AO-009KDH999-E40-2016	AD-SRO-DCAGI-SC-099/15	Servicios de Asistencia Técnica Especializada en Materia de Diseño Sismico Estructural Aplicada a la Infraestructura Aeroportuaria.	Servicios de Asistencia Técnica Especializada en Materia de Diseño Sismico Estructural Aplicada a la Infraestructura Aeroportuaria.	terminated	2015-12-01 00:00:00	2015-05-23 00:00:00	2104525.86	MXN	2015-12-01 00:00:00	\N	
154	154	AA-009KDH999-E53-2016	AD-AS-DCAGI-SC-84/15	Materiales para la Construcción	Adquisición de Materiales para la Construcción	terminated	2015-12-07 00:00:00	2015-12-17 00:00:00	320361.43	MXN	2015-12-07 00:00:00	\N	
198	198	-	104-014-CUNA01-3S	Gerencia del proyecto para atender la demanda de servicios aeroportuarios en el centro del país	Gerencia del proyecto para atender la demanda de servicios aeroportuarios en el centro del país	active	2016-07-17 00:00:00	2020-10-08 00:00:00	2361994326.38	MXN	2014-10-09 00:00:00	\N	
64	64	LO-009KDH999-T15-2015	LPI-SRO-DCAGI-SC-030-15	Estudio mediante el cual se definan las características técnicas de infraestructura y diseño esquemático de la terminal de carga del Nuevo Aeropuerto Internacional de la Ciudad de México.	Estudio mediante el cual se definan las características técnicas de infraestructura y diseño esquemático de la terminal de carga del Nuevo Aeropuerto Internacional de la Ciudad de México.	terminated	2015-05-29 00:00:00	2015-09-03 00:00:00	11650000.00	MXN	2015-05-29 00:00:00	\N	
19	19	AA-009KDH999-E65-2016	AD-AS-DCAGI-SC-121/15	Prestación de los Servicios Tecnico Especializado para la captura en video y transmisión via internet mediante la producción y streaming de 4 eventos de licitación pública mediante equipos de cctv en circuito cerrado.	Prestación de los Servicios Tecnico Especializado para la captura en video y transmisión via internet mediante la producción y streaming de 4 eventos de licitación pública mediante equipos de cctv en circuito cerrado.	terminated	2015-12-09 00:00:00	\N	117820.00	MXN	2015-12-09 00:00:00	\N	
20	20	SA-009KDH999-N13-2015	AD-S-DCAGI-SC-016/2014	Servicio de un Testigo Social para que atestigüe en las etapas de la licitación pública nacional presencial relativa a la contratación del servicio de extracción de ademes y restitución del terreno que ocupan dichos elementos, ubicados en el polígono para el Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	Servicio de un Testigo Social para que atestigüe en las etapas de la licitación pública nacional presencial relativa a la contratación del servicio de extracción de ademes y restitución del terreno que ocupan dichos elementos, ubicados en el polígono para el Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	terminated	\N	\N	455149.56	MXN	2014-10-29 00:00:00	\N	
30	30	SO-009KDH999-N24-2015	AD-SRO-DCAGI-SC-005/15	Prestación de los Servicios consistentes en la elaboración del: “Plan de Acciones de Monitoreo y Conservación de Aves para el Nuevo Aeropuerto Internacional de la Ciudad de México”.	Prestación de los Servicios consistentes en la elaboración del: “Plan de Acciones de Monitoreo y Conservación de Aves para el Nuevo Aeropuerto Internacional de la Ciudad de México”.	terminated	2015-02-20 00:00:00	2015-03-20 00:00:00	449999.86	MXN	2015-02-19 00:00:00	\N	
165	165	SO-009KDH999-N28-2015	AD-SRO-DCAGI-SC-012/15	Elaboración de programa de acciones para mitigar el impacto de la modificación de la hidrodinámica de los humedales presentes en la zona del Nuevo Aeropuerto Internacional de la Ciudad de México	Elaboración de programa de acciones para mitigar el impacto de la modificación de la hidrodinámica de los humedales presentes en la zona del Nuevo Aeropuerto Internacional de la Ciudad de México	terminated	2015-02-23 00:00:00	2015-02-23 00:00:00	550000	MXN	2015-02-20 00:00:00	\N	
214	214	1	AD-AS-DCAGI-SC-013/16	Servicios Profesionales de Levantamiento de Imagen y Video de Nuevo Aeropuerto Internacional de la Ciudad de México.	Servicios Profesionales de Levantamiento de Imagen y Video de Nuevo Aeropuerto Internacional de la Ciudad de México.	terminated	2016-02-02 00:00:00	2016-02-29 00:00:00	2450000.00	MXN	2016-02-11 00:00:00	\N	
133	133	-	AD-SRO-DCAGI-SC-081/15	Servicios de Transporte en Camionetas de Redilas	Servicios de Transporte en Camionetas de Redilas	terminated	2015-08-03 00:00:00	2015-08-28 00:00:00	300000.00	MXN	2015-08-03 00:00:00	\N	
31	31	SO-009KDH999-N25-2015	AD-SRO-DCAGI-SC-006/15	Programa de rescate de fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México	Prestación de los Servicios consistentes en la elaboración del:Programa de rescate de fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México	terminated	2015-02-20 00:00:00	2015-03-20 00:00:00	374999.10	MXN	2015-02-19 00:00:00	\N	
77	77	-	GACM/DCI/CJ/SJ/014-2015	Instrumentación de Planes y Programas Ambientales para el Proyecto del NAICM	Instrumentación de Planes y Programas Ambientales para el Proyecto del NAICM	terminated	2015-06-01 00:00:00	2015-12-03 00:00:00	30100000	MXN	2016-07-15 00:00:00	\N	
32	32	SO-009KDH999-N21-2015	AD-SRO-DCAGI-SC-007/15	Programa de rescate y reubicación de flora para el Nuevo Aeropuerto Internacional de la Ciudad de México	Prestación de los Servicios consistentes en la elaboración del: Programa de rescate y reubicación de flora para el Nuevo Aeropuerto Internacional de la Ciudad de México	terminated	2015-02-20 00:00:00	2015-03-20 00:00:00	39999.95	MXN	2015-02-19 00:00:00	\N	
33	33	SO-009KDH999-N17-2015	 AD-SRO-DCAGI-SC-008/15	Prestación de los Servicios consistentes en la elaboración del Estudio Técnico-Económico de la Ejecución de las medidas de mitigación restauración y compensación y otras acciones ambientales del proyecto Nuevo Aeropuerto Internacional de la Ciudad de México	Prestación de los Servicios consistentes en la elaboración del Estudio Técnico-Económico de la Ejecución de las medidas de mitigación restauración y compensación y otras acciones ambientales del proyecto Nuevo Aeropuerto Internacional de la Ciudad de México	terminated	2015-02-23 00:00:00	2015-03-30 00:00:00	550000.00	MXN	2015-02-20 00:00:00	\N	
111	111	1	9-989-GAC9806011J4-05-03-2015	Fianza de Garantía para el Cumplimiento del Impacto Ambiental	Instrumento de Garantía para el  Cumplimiento de las Medidas Ambientales para NAICM establecidas en el Manifiesto de Impacto Ambiental	terminated	2015-03-05 00:00:00	2016-03-04 00:00:00	7082877.52	MXN	2015-03-05 00:00:00	\N	
113	113	SA-009KDH-N62/2015	AD-AS-DCAGI-SC-047/15	Servicio Integral de Reservación, Expedición y Entrega de Pasajes Aéreos para el personal GACM	Servicios integrales de reservación, expedición de boletos de avión con cobertura en el territorio Nacional e Internacional y otros servicios del ramo para el GACM	active	2015-07-06 00:00:00	2016-12-31 00:00:00	5840518.00	MXN	2015-07-20 00:00:00	\N	
115	115	SA-009KDH999-N67-2015	AD-AS-DCAGI-SC-052/15	Equipo de Seguridad (Botiquines para la DCI)	Adquisición de equipo de seguridad (botiquines) 	terminated	2015-07-28 00:00:00	2015-08-03 00:00:00	78500.00	MXN	2015-07-28 00:00:00	\N	
118	118	AA-009KDH999-E60-2016	AD-AS-DCAGI-SC-78/15	Arrendamiento de Mobiliario consistente en Mesas de Trabajo y Sillas Secretariales	Arrendamiento de Mobiliario consistente en Mesas de Trabajo y Sillas Secretariales	terminated	2015-05-07 00:00:00	2015-12-31 00:00:00	249237.56	MXN	2015-05-21 00:00:00	\N	
130	130	AD-SRO-DCAGI-SC-021/16	AD-SRO-DCAGI-SC-021/16	Servicio de traslado de personal en camiones turísticos con capacidad para 45 pasajeros como mínimo en dos turnos	Servicio de traslado de personal en camiones turísticos con capacidad para 45 pasajeros como mínimo en dos turnos	terminated	2016-05-25 00:00:00	2016-02-15 00:00:00	640000.00	MXN	2016-02-03 00:00:00	\N	
114	114	1	AD-AS-DSAGI-SC-51/2015	Contratación del servicio integral de impresión y digitalización en blanco y negro y a color para el grupo Areoportuario de la Ciudad de México, S.A. de C.V., para los ejercicios fiscales 2015 a 2018	Contratar el servicio integral de impresión y digitalización en blanco y negro y a color para el grupo Areoportuario de la Ciudad de México, S.A. de C.V., para los ejercicios fiscales 2015 a 2018, con el objetivo de dotar a su personal de los medios y her	active	2015-04-27 00:00:00	2018-12-31 00:00:00	15800287.50	MXN	2015-07-20 00:00:00	\N	
78	78	-	GACM/DCI/SJ/CM/01-2014	Establecer Las bases generales a que se sujetarán GACM y la COMISION así como, pactos comunes y el objeto - generico de futuros servicios de cracter cientifico y tecnologico u otro tipo que acuerden las mismas, mediante la celebración de los respectivos contratos especificos de prestación de servicios	Establecer Las bases generales a que se sujetarán GACM y la COMISION así como, pactos comunes y el objeto - generico de futuros servicios de cracter cientifico y tecnologico u otro tipo que acuerden las mismas, mediante la celebración de los respectivos contratos especificos de prestación de servicios	active	\N	\N	0		\N	\N	
65	65	LO-009KDH999-E94-2015	 LPN-SRO-DCAGI-SC-009/2016	Estudio de Ingeniería Geomática para el Proyecto Pistas, Plataformas, Calles de Rodaje y Edificios del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM), para Generar un modelo Digital de Terreno (MDT) a Través de la Tecnología HIGH Definition Surveying (HDS), Empleando Equipos GNSS, Escáner Láser y Ecosonda .	Estudio de Ingeniería Geomática para el Proyecto Pistas, Plataformas, Calles de Rodaje y Edificios del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM), para Generar un modelo Digital de Terreno (MDT) a Través de la Tecnología HIGH Definition Surveying (HDS), Empleando Equipos GNSS, Escáner Láser y Ecosonda . 	terminated	2016-02-22 00:00:00	2016-05-22 00:00:00	41324450.46	MXN	2016-02-22 00:00:00	\N	
116	116	1	AD-AS-DCAGI-SC-074/15	Servicios de infraestructura de comunicación de voz, datos y video para el Grupo Aeroportuario de la Ciudad de México S.A. de C.V.	Contratar los servicios de infraestructura de comunicación de voz, datos y video para el Grupo Aeroportuario durante los ejercicios 2015 al 2018, para contar con la implementación de la infraestructura necesaria asi como el soporte tecnico y atención de incidentes correspondientes para dotar a su personal de los medios y herramientas para el debido cumplimiento de las actividades sustantivas de la entidad.	active	2015-09-08 00:00:00	2018-12-31 00:00:00	30516448.28	MXN	2015-09-23 00:00:00	\N	
117	117	1	AD-AS-DCAGI-SC-075/15	Servicio de Dictámen y Certificado de UVIE	Servicio de Dictámen y Certificado de UVIE para el Grupo Aeroportuario de la Ciudad de México, S.A. de C.V., los cuales serán prestados totalmente a satisfacción de GACM de conformidad con las especificaciones y características establecidas	terminated	2015-09-23 00:00:00	2015-10-22 00:00:00	60344.83	MXN	2015-09-23 00:00:00	\N	
42	42	-	-	Construcción de Proyecto Integral de Barda y Camino Perimetral, Alumbrado, Servicios Inducidos y Casetas de Acceso para el Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)"	Construcción de Proyecto Integral de Barda y Camino Perimetral, Alumbrado, Servicios Inducidos y Casetas de Acceso para el Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM	none	\N	\N	0		\N	\N	
43	43	GACM/DCI/SJ/CM-E/05-2015	-	Campaña de exploración Geotécnica de campo 2015. Muestreo y sistemas de Medición en el Subsuelo en las Zonas de Aeropistas, Calles de Rodaje y Caminos Internos del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	Campaña de exploración Geotécnica de campo 2015. Muestreo y sistemas de Medición en el Subsuelo en las Zonas de Aeropistas, Calles de Rodaje y Caminos Internos del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	active	2015-03-02 00:00:00	2015-12-31 00:00:00	157168157.92	MXN	2015-03-02 00:00:00	\N	
67	67	LO-009KDH999-N19-2015	LPN-SRO-DCAGI-SC-026/15	Exploración geotécnica complementaria para el proyecto ejecutivo del sistema de drenaje temporal del Nuevo aeropuerto Internacional de la Ciudad de México, en el Ex Lago de Texcoco, Estado de México.	Exploración geotécnica complementaria para el proyecto ejecutivo del sistema de drenaje temporal del Nuevo aeropuerto Internacional de la Ciudad de México, en el Ex Lago de Texcoco, Estado de México.	terminated	2015-05-09 00:00:00	2015-07-07 00:00:00	1402474	MXN	2015-05-09 00:00:00	\N	
119	119	1	AD-AS-DCAGI-SC-83/15	Servicios para dar cumplimiento en lo dispuesto a las atribuciones de Grupo Aeroportuario de la Ciudad de México S.A. de C.V., relacionados con participaren el diseño e implementación de la política de información, difusión y comunicación social	"Servicios para dar cumplimiento en lo dispuesto a las atribuciones de Grupo Aeroportuario de la Ciudad de México S.A. de C.V., relacionados con participaren el diseño e implementación de la política de información, difusión y comunicación social"	active	2015-11-06 00:00:00	2016-11-01 00:00:00	1573425.00	MXN	2015-11-06 00:00:00	\N	
120	120	1	AD-AS-DCAGI-SC--102/15	Contrato abierto plurianual de prestación de servicios especializados en el suministro de "terceros".	Obtención de la prestacion de servicios especializados en el suministro de "terceros".	active	2015-12-01 00:00:00	2018-12-31 00:00:00	625917655.58	MXN	2014-12-01 00:00:00	\N	
44	44	-	GACM/DCI/SJ/CM-E/017-2015      	Realización de los Servicios Consistentes en la Mecánica de Suelos, Levantamiento Topográfico y Elaboración de Ingenieria Básica de: S.E. Maniobras Aeropuerto SF6 NAICM (5 ALIMENT-230 KV); S.E. Aeropuerto SF6 (NAICM) (3T-3F-60/80 MVA 230/23/0 KV-2/16/0 A) y L.T. Maniobras Aeropuerto NAICM (230 KV-13-CU-XLP A)	Realización de los Servicios Consistentes en la Mecánica de Suelos, Levantamiento Topográfico y Elaboración de Ingenieria Básica de: S.E. Maniobras Aeropuerto SF6 NAICM (5 ALIMENT-230 KV); S.E. Aeropuerto SF6 (NAICM) (3T-3F-60/80 MVA 230/23/0 KV-2/16/0 A) y L.T. Maniobras Aeropuerto NAICM (230 KV-13-CU-XLP A)	terminated	2015-11-19 00:00:00	2015-12-20 00:00:00	3246873.25	MXN	2015-03-02 00:00:00	\N	
68	68	LO-009KDH999- N45-2015	LPN-SRO-DCAGI-SC-043/15	Implementación del plan de restauración ecológica para el nuevo Aeropuerto Internacional de la Ciudad de México	Implementación del plan de restauración ecológica para el nuevo Aeropuerto Internacional de la Ciudad de México	active	2015-07-21 00:00:00	2016-12-31 00:00:00	18934197.76	MXN	2015-07-21 00:00:00	\N	
215	215	1	AD-DCAGI-SA-GAR-02/15	Servicio de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia	Servicio de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia	terminated	2015-01-02 00:00:00	2015-07-01 00:00:00	298780.56	MXN	2015-01-02 00:00:00	\N	
126	126	SA-009KDH999-N5-2015	AD-S-DCAGI-SC-010/2014	Servicio Integral de Limpieza en las Oficinas de GACM	Prestación a GACM del "Servicio Integral de Limpieza en las Oficinas del Grupo de Aeroportuario de la Ciudad de México, S.A. de C.V." ubicadas en: Avenida Insurgentes Sur Núm. 2453, piso 2, Colonia Tizapán, Delegación Álvaro Obregón, C.P. 01109, México, D	terminated	2014-10-01 00:00:00	2014-12-31 00:00:00	129360.00	MXN	2014-10-01 00:00:00	\N	
45	45	-	GACM/DCPEV/SJ/CG/02-2015	"Establecer los mecanismos de colaboración entre Grupo Aeroportuario de la Ciudad de México y el Instituto Mexicano de Administarción Pública A.C. para llevar a cabo, mediante la suscripción del instrumento correspondiente el desarrollo y ejecución de las actividades de los programas y proyectos que el GACM requeira a traves de la prestación de servicios relativos a als especialidades y disciplinas especificas, el INAP este en posibilidades de aportar."	"Establecer los mecanismos de colaboración entre Grupo Aeroportuario de la Ciudad de México y el Instituto Mexicano de Administarción Pública A.C. para llevar a cabo, mediante la suscripción del instrumento correspondiente el desarrollo y ejecución de las actividades de los programas y proyectos que el GACM requeira a traves de la prestación de servicios relativos a als especialidades y disciplinas especificas, el INAP este en posibilidades de aportar."	active	2015-01-08 00:00:00	2020-10-20 00:00:00	0	MXN	2015-01-08 00:00:00	\N	
47	47	-	GACM/DG/DCAGI/SJ-1044/2015	Conveio de Cooperación para el uso y goce temporal a Título gratuito de los inmuebles identificados como Edificio R1 Planta Baja 381. 73 m2 lado derecho, Edificio R1 Planta Baja 192.98 m2 lado izquierdo y edificio R1 Planta Alta 203.75 m2, situadas en el edificio Ex tienda.	Conveio de Cooperación para el uso y goce temporal a Título gratuito de los inmuebles identificados como Edificio R1 Planta Baja 381. 73 m2 lado derecho, Edificio R1 Planta Baja 192.98 m2 lado izquierdo y edificio R1 Planta Alta 203.75 m2, situadas en el edificio Ex tienda. 	none	2014-06-07 00:00:00	2016-07-15 00:00:00	0	MXN	2016-06-07 00:00:00	\N	
69	69	LO-009KDH999-N46-2015	LPN-SRO-DCAGI-SC-041/15	Plan de monitoreo y conservación de aves del proyecto del Nuevo Aeropuerto Internacional de la Ciudad de MéxicoPlan de monitoreo y conservación de aves del proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México	Plan de monitoreo y conservación de aves del proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México	active	2015-07-21 00:00:00	2016-12-31 00:00:00	14382969.20	MXN	2015-07-21 00:00:00	\N	
48	48	IO-009KDH999-N11-2015	ITP-OP-DCAGI-SC-014/15	Construcción de Caminos de Acceso a la Zona del Edificio Terminal de la Primera Etapa, necesarios para la caracterización Geotécnica Inicial	Construcción de Caminos de Acceso a la Zona del Edificio Terminal de la Primera Etapa, necesarios para la caracterización Geotécnica Inicial	terminated	2015-03-19 00:00:00	2015-05-17 00:00:00	8129259.88	MXN	2015-03-19 00:00:00	\N	
54	54	SA-009KDH999-N48-2015	AD-AS-DCAGI-SC-029/2015	Servicio de Seguridad para Salvaguardar la vida e integridad física de los trabajadores, la protección de la infraestructura, inmuebles y zonas federales concesionados a la entidad	Servicio de Seguridad para Salvaguardar la vida e integridad física de los trabajadores, la protección de la infraestructura, inmuebles y zonas federales concesionados a la entidad	terminated	2015-05-01 00:00:00	2015-12-31 00:00:00	800000	MXN	2015-05-01 00:00:00	\N	
49	49	IO009KDH999-T3-2014	ITP-SR-DCAGI-SC-015-2015	Elaboración del proyecto ejecutivo (ingenierías) para el diseño de la parte "Aeronáutica" (área de movimiento) de pistas, calles de rodaje, plataformas, áreas para el mantenimiento de aeronaves, servicio de combustibles de aviación, restricción y eliminación de obstáculos, servicio de salvamento y extinción de incendios (SSEI), ayudas visuales para la navegación, ayudas visuales indicadoras de obstáculos, ayudas visuales indicadoras de zonas de uso restringido, sistemas eléctricos de ayudas visuales para la navegación, mantenimiento de aeródromo, huella de ruido, agua potable y drenaje, programa de mantenimiento, sistemas de transporte de la información, acompañamiento en el proceso de obra, que contemple las características y elementos físicos para el "NAICM", con base en las flotas de aeronaves que operan y operarán en el Nuevo Aeropuerto en el futuro inmediato y con base en las normas nacionales e internacionales en materia de aeronáutica y de aviación civil.	Elaboración del proyecto ejecutivo (ingenierías) para el diseño de la parte "Aeronáutica" (área de movimiento) de pistas, calles de rodaje, plataformas, áreas para el mantenimiento de aeronaves, servicio de combustibles de aviación, restricción y eliminación de obstáculos, servicio de salvamento y extinción de incendios (SSEI), ayudas visuales para la navegación, ayudas visuales indicadoras de obstáculos, ayudas visuales indicadoras de zonas de uso restringido, sistemas eléctricos de ayudas visuales para la navegación, mantenimiento de aeródromo, huella de ruido, agua potable y drenaje, programa de mantenimiento, sistemas de transporte de la información, acompañamiento en el proceso de obra, que contemple las características y elementos físicos para el "NAICM", con base en las flotas de aeronaves que operan y operarán en el Nuevo Aeropuerto en el futuro inmediato y con base en las normas nacionales e internacionales en materia de aeronáutica y de aviación civil.	active	2015-02-09 00:00:00	2019-02-07 00:00:00	1079335930.23	MXN	2015-02-05 00:00:00	\N	
81	81	LO-009KDH999-N78-2015	LPN-OP-DCAGI-SC-115/15	Carga, Acarreo y Descarga fuera del poligono del material existente producto de depositos de demoliciones, desperdicios y desazolve.	Carga, Acarreo y Descarga fuera del poligono del material existente producto de depositos de demoliciones, desperdicios y desazolve.	active	2015-12-31 00:00:00	2016-08-26 00:00:00	493916475	MXN	2015-12-31 00:00:00	\N	
51	51	-	AD-AS-DCAGI-SC-001/16	Contrato abierto de prestación de servicios para "ESTACIONAMIENTO DE VEHICULOS"	El motivo determinante de la voluntad es la contratación del servicio de "ESTACIONAMIENTO PARA VEHÍCULOS".	active	2016-01-01 00:00:00	2016-06-30 00:00:00	262931.03	MXN	\N	\N	
82	82	LO-009KDH999- N45-2015	LPN-SRO-DCAGI-SC-043/15	Implementación del plan de restauración ecológica para el nuevo Aeropuerto Internacional de la Ciudad de México	Implementación del plan de restauración ecológica para el nuevo Aeropuerto Internacional de la Ciudad de México	active	2015-07-21 00:00:00	2015-12-31 00:00:00	18934197.76	MXN	2015-07-21 00:00:00	\N	
52	52	AA-009KDH999-E80-2016	AD-AS-DCAGI-SC-006/16	"Servicios de Asesoría, Relacionados con la Implementación de la Estructura de Gobierno Corporativo para la Administración del Grupo Aeroportuario de La Ciudad de México, S. A. de C. V"	 "Servicios de Asesoría, Relacionados con la Implementación de la Estructura de Gobierno Corporativo para la Administración del Grupo Aeroportuario de La Ciudad de México, S. A. de C. V"	terminated	2016-02-15 00:00:00	2016-02-22 00:00:00	207000	MXN	2016-02-15 00:00:00	\N	
122	122	1	AD-AS-DCAGI-SC-109/15	" Prestación de Servicios Profesionales  para fungir como enlace  y vocería en el ámbito  nacional e internacional y con actores claves que aseguren la ejecución del  proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México"	Asesoría técnica especializada en materia de vinculación con organismos internacionales y adopción de las mejores prácticas internacionales"	terminated	2015-11-07 00:00:00	\N	1510488.00	MXN	2015-11-07 00:00:00	\N	
83	83	 LO-009KDH999-N42-2015	LPN-SRO-DCAGI-SC-042/15	Implementación del Programa de Rescate de Flora y Fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México	 Implementación del Programa de Rescate de Flora y Fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México	active	2015-07-21 00:00:00	2015-12-31 00:00:00	11924906.62	MXN	2015-07-21 00:00:00	\N	
123	123	AA-009KDH999-E44-2016	AD-AS-DCAGI-SC-113/15	Servicios de Auditoria Externa para Dictaminar los Estados Financieros y Presupuestales del Ejercicio Fiscal 2015.	Servicios de Auditoria Externa para Dictaminar los Estados Financieros y Presupuestales del Ejercicio Fiscal 2015.	active	2015-12-08 00:00:00	2016-12-02 00:00:00	145713.00	MXN	2016-12-08 00:00:00	\N	
124	124	1	AD-DCAGI-SA-GAR-007/15	Servicio y Proceso de Nómina mediante un Sistema Especializado para Recursos Humanos y Nómina de Gobierno	Implantar un servicio especializado para cumplir con la obligación del pago de nómina dentro de la normatividad de las leyes laborales para lograr la mejora contínua de los procedimientos administrativos.	terminated	2015-01-02 00:00:00	2015-02-28 00:00:00	259000.00	MXN	2015-01-02 00:00:00	\N	
127	127	1	AD-AS-DCAGI-SC-012/2014	Prestación de los Servicios de Auditoría Externa que se realizarán sobre los estados financieros de la entidad con cifras al 31 de diciembre de 2014.	Servicios de Auditoría Externa que se realizarán sobre los estados financieros de la entidad con cifras al 31 de diciembre de 2014. 	terminated	2014-11-01 00:00:00	2015-11-01 00:00:00	46371.00	MXN	2014-11-01 00:00:00	\N	
84	84	 LO-009KDH999-N46-2015	LPN-SRO-DCAGI-SC-041/15	Plan de monitoreo y conservación de aves del proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México	Plan de monitoreo y conservación de aves del proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México	active	2015-07-21 00:00:00	2015-12-31 00:00:00	14382969.2	MXN	2015-07-21 00:00:00	\N	
128	128	Adjudicación Directa	AD-SRO-DCAGI-SC-003/16	Supervisión de la Construcción del Drenaje Pluvial Temporal del Nuevo Aeropuerto Internacional de la Ciudad de México	Supervisión de la Construcción del Drenaje Pluvial Temporal del Nuevo Aeropuerto Internacional de la Ciudad de México	active	2016-02-01 00:00:00	2016-06-29 00:00:00	7680864.77	MXN	2016-01-21 00:00:00	\N	
129	129	SO-009KDH999-N72-2015	AD-SRO-DCAGI-SC-019/15	Prestación de los Servicios consistentes en la "Asesoría técnica especializada para la debia consecución de los onjeticos encomendados a esta empresa de participación estatal mayoritaria y de esta forma asegurar la adecuada operación de la Infraestructura Aeroportuaria del Valle de México (IAVM)".	Prestación de los Servicios consistentes en la "Asesoría técnica especializada para la debia consecución de los onjeticos encomendados a esta empresa de participación estatal mayoritaria y de esta forma asegurar la adecuada operación de la Infraestructura Aeroportuaria del Valle de México (IAVM)".	terminated	2015-04-01 00:00:00	2015-12-31 00:00:00	1704713.22	MXN	2015-04-04 00:00:00	\N	
145	145	AD/01CTO.MTO./2015	AD/01CTO.MTO./2014	Servicios de diseño y arquitectura consistentes en forma enunciativa mas no limitativa, en la elaboración de los proyectos ejecutivos (diseño arquitectónico e ingeniería de detalle), que permitan la construcción del "edificio terminal de pasajeros, vialidades de acceso y estacionamientos" y "torre de control y centros de control de operaciones" del "NAICM" así como el acompañamiento arquitectónico.	Servicios de diseño y arquitectura consistentes en forma enunciativa mas no limitativa, en la elaboración de los proyectos ejecutivos (diseño arquitectónico e ingeniería de detalle), que permitan la construcción del "edificio terminal de pasajeros, vialidades de acceso y estacionamientos" y "torre de control y centros de control de operaciones" del "NAICM" así como el acompañamiento arquitectónico.	active	2014-12-01 00:00:00	2018-11-29 00:00:00	1841753116.00	MXN	2014-12-01 00:00:00	\N	
85	85	LO-009KDH999-N19-2015	LPN-SRO-DCAGI-SC-026/15	Exploración geotécnica complementaria para el proyecto ejecutivo del sistema de drenaje temporal del Nuevo aeropuerto Internacional de la Ciudad de México, en el Ex Lago de Texcoco, Estado de México.	Exploración geotécnica complementaria para el proyecto ejecutivo del sistema de drenaje temporal del Nuevo aeropuerto Internacional de la Ciudad de México, en el Ex Lago de Texcoco, Estado de México.	terminated	2015-05-09 00:00:00	2015-07-07 00:00:00	1402474.19	MXN	2015-05-09 00:00:00	\N	
146	146	1	AD-AS-DCAGI-SC-007/16 	Servicios de suministro de combustible, lubricantes y aditivos para vehículos automotores terrestres.		active	2016-02-02 00:00:00	2016-02-02 00:00:00	17267047.50	MXN	2016-02-02 00:00:00	\N	
86	86	LO-009KDH999-N80-2015	LPN-OP-DCAGI-SC-114/15	Construcción de los caminos provisionales de acceso al NAICM, ejecutando trabajos de terracería, estructuras y obras de drenaje, pavimentación y señalamiento.	Construcción de los caminos provisionales de acceso al NAICM, ejecutando trabajos de terracería, estructuras y obras de drenaje, pavimentación y señalamiento.	active	2015-12-31 00:00:00	2017-02-13 00:00:00	608275577.5	MXN	2015-12-31 00:00:00	\N	
196	196	99-989-GAC9806011J4-05-03-2015	LPN-AD-DCAGI-SC-027/16	Contrato sistemático 99-989-GAC9806011J4-05-03-2015 y adendum elaborado por GACM		none	2016-04-05 00:00:00	2016-12-31 00:00:00	4669201.38	MXN	2016-04-07 00:00:00	\N	
197	197	LO-009KDH999-N79-2015	LPN-OP-DCAGI-SC-112/15	Trabajos relativos a la nivelación y limpieza del terreno  del NAICM	Trabajos relativos a la nivelación y limpieza del terreno  del NAICM	active	2015-12-14 00:00:00	2017-01-13 00:00:00	1762803241.34	MXN	2015-12-14 00:00:00	\N	
177	177	1	AD-DCAGI-SA-GAR-02/15	Servicio de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia	Cubrir las necesidades primarias de soporte de red y a la telefonia e internet e implementar el servicio en comento, por un periodo de seis meses a partir del 2° de enero y hasta 01 de julio de 2015 a traves de una adjudicacion directa.	terminated	2015-01-02 00:00:00	2015-07-01 00:00:00	298780.56	MXN	2015-01-02 00:00:00	\N	
147	147	1	AD-AS-DCAGI-SC-014-16	Servico de Testigo Social para que Atestigüe las Etapas del Procedimiento del la Licitación Pública Internacional del Proyecto Denominado "Desarrollo de Ingeniería de Detalle y Contrucción de Subestaciones y Acometida Eléctrica del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	Servico de Testigo Social para que Atestigüe las Etapas del Procedimiento del la Licitación Pública Internacional del Proyecto Denominado "Desarrollo de Ingeniería de Detalle y Contrucción de Subestaciones y Acometida Eléctrica del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	terminated	\N	\N	269225.44	MXN	2016-03-01 00:00:00	\N	
149	149	AA-009KDH999-E56-2016	AD-AS-DCAGI-SC-038/15	Servicio integral de correo electrónico y directorio activo	Servicio integral de correo electrónico y directorio activo	terminated	2015-01-02 00:00:00	2015-01-02 00:00:00	299960.00	MXN	2015-01-02 00:00:00	\N	
150	150	1	AD-AS-DCAGI-SC-046/15	Servicios Administrados de Arrendamiento de Equipo y Bienes Informáticos para el Grupo Aeroportuario de la Ciudad de México.	Dotar al personal del Grupo Aeroportuario de la Ciudad de México, S.A. de C.V. de la infraestructura tecnológica adecuada que se requiere para cumplir exitosamente sus metas de planeación, ejecución, construcción y operación del Nuevo Aeropuerto de la Ciudad de México.	active	2015-07-06 00:00:00	2018-12-31 00:00:00	31779878.00	MXN	2015-07-20 00:00:00	\N	
191	191	No aplica	GACM-DCI-SJ-CM-E-02-14	Campaña de exploración Geotécnica de campo 2015. Muestreo y sistemas de Medición en el Subsuelo en las Zonas de Aeropistas, Calles de Rodaje y Caminos Internos del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	Campaña de exploración Geotécnica de campo 2015. Muestreo y sistemas de Medición en el Subsuelo en las Zonas de Aeropistas, Calles de Rodaje y Caminos Internos del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	active	2015-03-02 00:00:00	2016-12-31 00:00:00	157168157.92	MXN	2015-03-02 00:00:00	\N	
151	151	AA-009KDH999-E3-2016	AD-AS-DCAGI-SC-056/16	Servicio de un Testigo Social para que atestigüe las etapas del procedimiento de la Licitación Pública Nacional, relativa a la contratación de la obra pública, para la construcción del proyecto ejecutivo de drenaje pluvial temporal para la protección de la zona durante la construcción de la primera fase del NAICM	Servicio de un Testigo Social para que atestigüe las etapas del procedimiento de la Licitación Pública Nacional, relativa a la contratación de la obra pública, para la construcción del proyecto ejecutivo de drenaje pluvial temporal para la protección de la zona durante la construcción de la primera fase del NAICM	terminated	2015-08-15 00:00:00	2015-12-15 00:00:00	463501.20	MXN	2015-08-15 00:00:00	\N	
152	152	AA-009KDH999-E4-2016	AD-AS-DCAGI-SC-62/15	Servicio de un testigo social para que atestigüe las etapas del procedimiento de la licitación pública internacional bajo la cobertura de tratados de libre comercio, consistente en diseñar e instrumentar el modelo virtual de información para la construcción del BIM del NAICM	Servicio de un testigo social para que atestigüe las etapas del procedimiento de la licitación pública internacional bajo la cobertura de tratados de libre comercio, consistente en diseñar e instrumentar el modelo virtual de información para la construcción del BIM del NAICM	active	2015-08-14 00:00:00	2015-12-31 00:00:00	432601.12	MXN	2015-08-14 00:00:00	\N	
153	153	1	AD-AS-DCAGI-SC-068/15	Contratación del Servicio de Comunicaciones para el Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	Prestación del servicio de comunicaciones para el Grupo Aeroportuario de la Ciudad de México, S.A. de C.V. para los ejercicios fiscales 2015 al 2018, en adelante los servicios serán prestados totalmente a satisfacción de GACM de conformidad con las especificaciones y características establecidas en el anexo técnico y la propuesta técnica y económica.	active	2015-09-08 00:00:00	2018-12-31 00:00:00	39479421.55	MXN	2015-09-23 00:00:00	\N	
175	175	1	AD-AS-DCAGI-SC-074/15	Servicios de infraestructura de comunicación de voz, datos y video para el Grupo Aeroportuario de la Ciudad de México S.A. de C.V.	Contratar los servicios de infraestructura de comunicación de voz, datos y video para el Grupo Aeroportuario de la Ciudad de México S.A. de C.V. durante los ejercicios fiscales 2015 al 2018, con el objetivo de contar con la implementación de la infraestructura necesaria asi como el soporte tecnico y atención de incidentes correspondientes para dotar a su personal de los medios y herramientas para el debido cumplimiento de las actividades sustantivas que tienen encomendadas para la consecución de los dines de la entidad.	active	2015-09-08 00:00:00	2018-12-31 00:00:00	30516448.28	MXN	2015-09-23 00:00:00	\N	
176	176	1	AD-DCAGI-SA-GAR-01/14	Configuración Inicial de Equipos Instalados en el Inmueble de Altavista Para Servicio de Red Local, Seguridad de Datos y Telefonía.	Contar con el servicio de configuración inicial personalizada para los equipos instalados en el inmueble de Altavista, con el propósito de iniciar operaciones de manera inmediata y proveer a los usuarios del Grupo Aeroportuario de la Ciudad de México (GACM) de conexión a la red de datos, seguridad física y lógica en el acceso a internet, configuración de los teléfonos y del conmutador.	terminated	2014-12-01 00:00:00	2014-12-15 00:00:00	28324416	MXN	2014-12-01 00:00:00	\N	
57	57	AA-009KDH999-E63-2016	AD-AS-DCAGI-SC-070/2015	Contrato de Prestación de Servicios Profesionales Consistentes en la Consultoría y Asesoría Preventiva en Materia Labora	Contrato de Prestación de Servicios Profesionales Consistentes en la Consultoría y Asesoría Preventiva en Materia Laboral	terminated	2015-09-02 00:00:00	2016-12-31 00:00:00	353800	MXN	2015-09-02 00:00:00	\N	
178	178	1	AD-DCAGI-SA-GAR-0005/15	Servicio de renta de Bienes Informáticos	Uso y goce temporal de renta de bienes informáticos	terminated	2015-01-02 00:00:00	2015-07-01 00:00:00	300048.00	MXN	2015-01-02 00:00:00	\N	
179	179	1	AD-DCAGI-SA-GAR-0006/15	Servicio de renta de Bienes Informáticos	Uso y goce temporal de renta de bienes informáticos. Equipos de impresión, aparatos telefónicos digitales IP y Switches de telecomunicaciones 	terminated	2015-01-02 00:00:00	2015-07-01 00:00:00	183480.00	MXN	2015-01-02 00:00:00	\N	
59	59	IA-009KDH999-N56-2015	ITP-AS-DCAGI-SC-058/15	Servicio de asesoría técnica y capacitación a 800 trabajadores del programa empleo temporal de mano de obra campesina o urbana marginada para los 7 ejidos colindantes al predio del NAICM.	Servicio de asesoría técnica y capacitación a 800 trabajadores del programa empleo temporal de mano de obra campesina o urbana marginada para los 7 ejidos colindantes al predio del NAICM.	active	2015-10-19 00:00:00	2015-12-31 00:00:00	6318719.99	MXN	2015-08-19 00:00:00	\N	
180	180	1	AD-DCAGI-SA-GAR-01/15	Servicio de Enlaces de Telefonía e Internet en el inmueble de AltaVista	Uso y goce temporal de señales de enlaces de telefonía e internet para el inmueble de AltaVista 	terminated	2015-01-02 00:00:00	2015-07-01 00:00:00	163999.98	MXN	2015-01-02 00:00:00	\N	
181	181	1	AD-OP-DCAGI-SC-064/15	Adecuación de espacios en el campamento existente en la puerta 8 del polígono del NAICM	Adecuación de espacios en el campamento existente en la puerta 8 del polígono del NAICM	active	2015-10-01 00:00:00	2015-12-23 00:00:00	1221008.37	MXN	2015-10-01 00:00:00	\N	
182	182	1	E0A1VWO	Servicio de Telecomunicaciones	Establecer términos y condiciones conforme a los cuales TELMEX prestará a GACM los servicios de telecomunicaciones que esté contrate mediante las solicitudes de servicios que al efecto se celebren.	active	2014-10-18 00:00:00	\N	0	MXN	2014-10-18 00:00:00	\N	
60	60	IA-009KDH-N57-2015	ITP-AS-DCAGI-SC-060/15	Plan de Integración Ejidal para el Nuevo Aeropuerto Internacional de la Ciudad de México	Lograr una compatibilidad sustentable de: bordes, usos de suelo, infraestructuras; entorno a la poligonal definitiva del Proyecto "Nuevo Aeropuerto Internacional de la Ciudad de México S.A. de C.V. y manejar los impactos locales de las obras asociadas al mismo, con acciones locales de mitigación. 	terminated	2015-08-19 00:00:00	2015-12-31 00:00:00	13080028	MXN	2015-08-19 00:00:00	\N	
34	34	SO-009KDH999-N23-2015	AD-SRO-DCAGI-SC-009/15	Elaboración de programa de monitoreo de ruido perimetral para las etapas de preparación del sitio, construcción, operación y mantenimiento del Nuevo Aeropuerto Internacional de la Ciudad de México	Elaboración de programa de monitoreo de ruido perimetral para las etapas de preparación del sitio, construcción, operación y mantenimiento del Nuevo Aeropuerto Internacional de la Ciudad de México	terminated	2015-02-23 00:00:00	2015-03-23 00:00:00	550000.00	MXN	2015-02-20 00:00:00	\N	
193	193	-	GACM-SEC-/03/2014	Servicio Especializado Para la Instrumentación del Manual de Integración y Funcionamiento del Subcomité de Revisión de Convocatorias Del Grupo Aeroportuario de La Ciudad de México, S.A. de C.V.	Facilitar la gestión institucional, como un elemento que se añadirá a los manuales de procedimientos, criterios y demás mecanismos que resulten indispensables para la adecuada administración de los recursos humanos y materiales que requiera un proyecto de la magnitud del nuevo aeropuerto del Valle de México.	active	2014-12-01 00:00:00	2014-12-31 00:00:00	103448.28	MXN	2014-12-10 00:00:00	\N	
35	35	SO-009KDH999-N27-2015	AD-SRO-DCAGI-SC-010/15	Elaboración de programa de capacitación en aspectos ambientales y de seguridad para las etapas de preparación del sitio y construcción del Nuevo Aeropuerto Internacional de la Ciudad de México	Elaboración de programa de capacitación en aspectos ambientales y de seguridad para las etapas de preparación del sitio y construcción del Nuevo Aeropuerto Internacional de la Ciudad de México	terminated	2015-02-23 00:00:00	2015-03-23 00:00:00	519000.00	MXN	2015-02-20 00:00:00	\N	
50	50	IO-009KDH999-N43-2015	ITP-SRO-DCAGI-SC-040/15	Elaboración del proyecto de terracerías de los caminos provisionales para la construcción del Nuevo Aeropuerto Internacional de la Ciudad de México	Elaboración del proyecto de terracerías de los caminos provisionales para la construcción del Nuevo Aeropuerto Internacional de la Ciudad de México	terminated	2015-07-01 00:00:00	2015-08-29 00:00:00	7062852.40	MXN	2015-07-01 00:00:00	\N	
36	36	SO-009KDH999-N18-2015	 AD-SRO-DCAGI-SC-011/15	Prestación de los Servicios consistentes en la elaboración del Plan de manejo  ambiental para el Nuevo Aeropuerto  Internacional de la Ciudad de México.	Prestación de los Servicios consistentes en la elaboración del Plan de manejo  ambiental para el Nuevo Aeropuerto  Internacional de la Ciudad de México.	terminated	2015-02-23 00:00:00	2015-03-20 00:00:00	550000.00	MXN	2015-02-20 00:00:00	\N	
195	195	No aplica	AD-DCAGI-SA-GAR-01/14	Configuración Inicial de Equipos Instalados en el Inmueble de Altavista Para Servicio de Red Local, Seguridad de Datos y Telefonía.	Contar con el servicio de configuración inicial personalizada para los equipos instalados en el inmueble de Altavista, con el propósito de iniciar operaciones de manera inmediata y proveer a los usuarios del Grupo Aeroportuario de la Ciudad de México (GACM) de conexión a la red de datos, seguridad física y lógica en el acceso a internet, configuración de los teléfonos y del conmutador	none	2014-12-01 00:00:00	2014-12-15 00:00:00	283244.16	MXN	2014-12-01 00:00:00	\N	
166	166	SO-09KDH999-N26-2015	AD-SRO-DCAGI-SC-013/15	Plan de Monitoreo, registro y verificación de emisión de gases de efecto invernadero para el Nuevo Aeropuerto Internacional de la Ciudad de México.	Plan de Monitoreo, registro y verificación de emisión de gases de efecto invernadero para el Nuevo Aeropuerto Internacional de la Ciudad de México.	terminated	\N	\N	465000	MXN	2015-02-19 00:00:00	\N	
38	38	GACM/DCI/SJ/CI/011-2015	GACM/DCI/SJ/CI/011-2015	Elaboración y puesta en marcha del Sistema Integeal e Gestión de Cumplimiento Ambiental (SIGCA) para el Proyecto Nuevo Aeropuerto Internacional de la Ciudad de México	Elaboración y puesta en marcha del Sistema Integeal e Gestión de Cumplimiento Ambiental (SIGCA) para el Proyecto Nuevo Aeropuerto Internacional de la Ciudad de México	terminated	2015-06-01 00:00:00	2015-12-03 00:00:00	34800000.00	MXN	2015-06-01 00:00:00	\N	
167	167	-	AD-SRO-DCAGI-SC-019/16	Supervisión, monitoreo, verificación y evaluación sistemática de los productos derivados del diseño e instrumentación del modelo virtual de información para la construcción del BIM del Nuevo Aeropuerto Internacional de la Ciudad de México	Supervisión, monitoreo, verificación y evaluación sistemática de los productos derivados del diseño e instrumentación del modelo virtual de información para la construcción del BIM del Nuevo Aeropuerto Internacional de la Ciudad de México	none	2016-04-01 00:00:00	2019-12-06 00:00:00	32925000.00	MXN	2016-03-31 00:00:00	\N	
206	206	 IO-009KDH999-E15-2016	 ITP-OP-DCAGI-SC-012/16	Construcción de accesos y plataformas para exploración geotécnica, rehabilitación de tramos de prueba y bacheo somero de caminos existentes dentro del terreno par el Nuevo Aeropuerto Internacional de la Ciudad de México.	Construcción de accesos y plataformas para exploración geotécnica, rehabilitación de tramos de prueba y bacheo somero de caminos existentes dentro del terreno par el Nuevo Aeropuerto Internacional de la Ciudad de México.	active	2016-03-10 00:00:00	2016-06-10 00:00:00	10961673.55	MXN	2016-03-10 00:00:00	\N	
216	216	AA-009KDH999-E65-2016	AD.DIR/01/SJ/2014	Sevicios de Regularización de la Información Relativa a la Auditoria Corporativa de Grupo Aeroportuario de la Ciudad de México, S.A. De C.V.	Prestación de los Servicios de Regularización de la Información Relativa a la Auditoria Corporativa de Grupo Aeroportuario de la Ciudad de México, S.A. De C.V.  	terminated	2014-11-25 00:00:00	2014-12-31 00:00:00	389000.00	MXN	2014-11-25 00:00:00	\N	
40	40	-	GACM/DCA/SJ/CI/016-2015	Establecer un mecanismo de coordinación corresponsable entre las partes. Para el mantenimiento y la operación de las obras de infraestructura para llevar a cabo la regulación hidraulica en las zonas aledañas al proyecto que permitan favorecer y mejorar el hábitat para las aves acuáticas migratorias que arrivan a la zona, así como las aves residentes y realizar en forma coordinada la operación y mantenimiento de las obras hidráulicas de regulación y conducción de los escurimientos pluviales provenientes del interior del perímetro del proyecto, durante su etapa de construcción, a través de un sistema de drenaje que operará temporalmente, los cuáles serán regulados en dos lagunas a cargo del GACM y cuyas descargas al Dren General del Valle. Quedarán bajo el control de la CONAGUA	Establecer un mecanismo de coordinación corresponsable entre las partes. Para el mantenimiento y la operación de las obras de infraestructura para llevar a cabo la regulación hidraulica en las zonas aledañas al proyecto que permitan favorecer y mejorar el hábitat para las aves acuáticas migratorias que arrivan a la zona, así como las aves residentes y realizar en forma coordinada la operación y mantenimiento de las obras hidráulicas de regulación y conducción de los escurimientos pluviales provenientes del interior del perímetro del proyecto, durante su etapa de construcción, a través de un sistema de drenaje que operará temporalmente, los cuáles serán regulados en dos lagunas a cargo del GACM y cuyas descargas al Dren General del Valle. Quedarán bajo el control de la CONAGUA	active	2015-05-12 00:00:00	\N	0.00	MXN	2015-05-12 00:00:00	\N	
134	134	-	CTO.ARRENDAMIENTO.ALTAVISTA02/14	Arrendamiento de Altavista	Arrendamiento de los inmuebles ubicados en: Calle de Santa Catarina Núm.. 267, Colonia San Ángel Inn, Delegación Alvaro Obregón, Código Postal 01060, Distrito Federal; Boulevar Adolfo López Mateos Núm. 2390, Colonia San Angel Inn, Delegación Alvaro Obregón, Distrito Federal; y casa marcada con Núm. 420 Boulevar Adolfo López Mateos, en esta Ciudad.	active	2014-09-06 00:00:00	2017-08-31 00:00:00	18090000.00	MXN	2014-09-06 00:00:00	\N	
131	131	AD-SRO-DCAGI-SC-022/16	AD-SRO-DCAGI-SC-022/16	Servicios de transporte en camionetas de redilas, con capacidad de carga de 3.5 toneladas, doble rodada, para movilidad de materiales y equipo	Servicios de transporte en camionetas de redilas, con capacidad de carga de 3.5 toneladas, doble rodada, para movilidad de materiales y equipo	terminated	2016-01-25 00:00:00	2016-02-15 00:00:00	384000	MXN	2016-02-03 00:00:00	\N	
168	168	-	AD-SRO-DCAGI-SC-026-16	Supervisión Técnica Administrativa y de Control de Calidad para los Trabajos de Carga, Acarreo y Descarga fuera del Polígono del material existente, producto de depósitos de Demolición, Desperdicio y Desazolve	Supervisión Técnica Administrativa y de Control de Calidad para los Trabajos de Carga, Acarreo y Descarga fuera del Polígono del material existente, producto de depósitos de Demolición, Desperdicio y Desazolve	active	2016-04-01 00:00:00	2016-04-01 00:00:00	7512904.17	MXN	2016-04-08 00:00:00	\N	
132	132	SO-09KDH999-N26-2015	AD-SRO-DCAGI-SC-030-16	Pruebas de Laboratorio Geotécnicas complementarias para el Proyecto Ejecutivo de Sistema de Drenaje Temporal del Nuevo Aeropuerto Internacional de la Ciudad de México	Pruebas de Laboratorio Geotécnicas complementarias para el Proyecto Ejecutivo de Sistema de Drenaje Temporal del Nuevo Aeropuerto Internacional de la Ciudad de México	terminated	2016-04-15 00:00:00	2016-04-29 00:00:00	163184.04	MXN	2016-04-22 00:00:00	\N	
141	141	IO-009KDH999-N82-2015	ITP-OP-DCAGl-SC-105/15 	Adecuación de espacios para las oficinas del Grupo Aeroportuario de la Ciudad de México (GACM) en el CEMCAS	Adecuación de espacios para las oficinas del Grupo Aeroportuario de la Ciudad de México (GACM) en el CEMCAS	terminated	2015-11-25 00:00:00	2015-12-31 00:00:00	8385420.04	MXN	2015-12-17 00:00:00	\N	
199	199	 SA-009KDH999-N68-2015	AS-AS-DCAGI-SC-55/15	Adquisión de bienes muebles por parte de GACM, consistentes en "materiales de construcción"	Adquisión de bienes muebles por parte de GACM, consistentes en "materiales de construcción"	none	2015-07-14 00:00:00	2015-08-04 00:00:00	243070.24	MXN	2015-06-14 00:00:00	\N	
217	217	1	GACM/DCI/SJ/CM/18-2015	Proyecto de Salvamento Arqueológico en el interior del Lago de Taxcoco en su zona oriente, Estado de México. (Supervisión, Vigilancia y Excavaciones 2016), en Adelante los SERVICIOS, mismos que serán realizados totalmente a satisfacción del GACM	Proyecto de Salvamento Arqueológico en el interior del Lago de Taxcoco en su zona oriente, Estado de México. (Supervisión, Vigilancia y Excavaciones 2016), en Adelante los SERVICIOS, mismos que serán realizados totalmente a satisfacción del GACM	active	2016-02-16 00:00:00	2016-12-31 00:00:00	8761818.10	MXN	2016-02-15 00:00:00	\N	
135	135	-	CTO.ARRENDAMIENTO.T.MURANO.01/15	Arrendamiento de Torre Murano Piso 1	Uso y goce temporal del Bien arrendado y los cajones de estacionamiento	active	2015-10-19 00:00:00	2017-09-14 00:00:00	251360	MXN	2015-10-19 00:00:00	\N	
136	136	IA-009KDH999-E95-2015	ITP-AS-DCAGI-SC-004/16	Servicios de Asesoria en Materia Fiscal para la Recuperacion de Saldos a favor de IVA e ISR, así mismo Asesoria Respecto al Cumplimiento de Tratados Internacionales para evitar la Doble Tributación.	Servicios de Asesoria en Materia Fiscal para la Recuperacion de Saldos a favor de IVA e ISR, así mismo Asesoria Respecto al Cumplimiento de Tratados Internacionales para evitar la Doble Tributación.	terminated	2016-02-11 00:00:00	2019-02-18 00:00:00	18000000.00	MXN	2016-02-11 00:00:00	\N	
137	137	-	ITP-AS-DCAGI-SC-017-15	Servicio integral de administración de personal y proceso de nomina, mediante un sistema especializado para recursos humanos y de nómina de gobierno	Obtención de la prestacion del servicio integral de administración de personal y proceso de nomina, mediante un sistema especializado para recursos humanos y de nómina de gobierno.	terminated	2015-03-12 00:00:00	2015-12-31 00:00:00	1295000.00	MXN	2015-03-12 00:00:00	\N	
142	142	IO-009KDH999-N75-2015	ITP-SRO-DCAGI-SC-080/15	Control, Prevención e Identificación de plagas en el Polígono del NAICM	Control, Prevención e identificación de plagas en el Polígono del Nuevo Aeropuerto Internacional de la Ciudad de México (Primera Etapa)	terminated	2015-10-13 00:00:00	2016-04-12 00:00:00	1495559.05	MXN	2015-10-13 00:00:00	\N	
169	169	-	AD-SRO-DCAGI-SC-031-16	Residencia General  de Obra del Nuevo Aeropuerto Internacional de la Ciudad de México	Residencia General  de Obra del Nuevo Aeropuerto Internacional de la Ciudad de México	active	2016-04-16 00:00:00	2016-08-31 00:00:00	687931.00	MXN	\N	2016-04-22 00:00:00	
138	138	IA-009KDH999-E23-2016	ITP-AS-DCAGI-SC-020/16	Servicios profesionales de consultoría, para el acompañamiento jurídico normativo y administrativo en la realización de las actividades para el desarrollo del Nuevo Aeropuerto Internacional de la Ciudad de México, así como para la elaboración del expediente concentrador integral	Servicios profesionales de consultoría, para el acompañamiento jurídico normativo y administrativo en la realización de las actividades para el desarrollo del Nuevo Aeropuerto Internacional de la Ciudad de México, así como para la elaboración del expediente concentrador integral	active	2016-04-01 00:00:00	2017-12-31 00:00:00	73500000	MXN	2016-04-01 00:00:00	\N	
139	139	IA-009KDH999-N31-2015	ITP-AS-DCAGI-SC-036/15	Servicios profesionales de consultoría, legales y/o normativos y acompañamiento en los procedimientos de contratación pública y elaboración de la memoria documental integral del desarrollo del  Nuevo Aeropuerto Internacional de la Ciudad de México	Servicios profesionales de consultoría, legales y/o normativos y acompañamiento en los procedimientos de contratación pública y elaboración de la memoria documental integral del desarrollo del  Nuevo Aeropuerto Internacional de la Ciudad de México	terminated	2015-06-02 00:00:00	2015-12-31 00:00:00	17200000.00	MXN	2015-06-02 00:00:00	\N	
155	155	AD-CONV-DCAGI-SC-001/16	AD-CONV-DCAGI-SC-001/16	Los servicios de protección, custodia, vigilancia y seguridad de sus bienes e intalaciones, así como el diseño e implementación de sistemas de seguridad y su supervisión permanente.	Los servicios de protección, custodia, vigilancia y seguridad de sus bienes e intalaciones, así como el diseño e implementación de sistemas de seguridad y su supervisión permanente.	active	2016-03-01 00:00:00	2018-11-30 00:00:00	0	MXN	2016-03-01 00:00:00	\N	
140	140	IO-009KDH999-E45-2016	ITP-SRO-DCAGI-SC-034/16	Servicios de apoyo técnico a la residencia del proyecto ejecutivo de diseño arquitectónico e ingeniería de detalle del edificio terminal de pasajeros, torre de control y centro de operaciones, edificio de estacionamiento, estacionamientos en superficie, estación multimodal y vialidades de acceso del NAICM	Servicios de apoyo técnico a la residencia del proyecto ejecutivo de diseño arquitectónico e ingeniería de detalle del edificio terminal de pasajeros, torre de control y centro de operaciones, edificio de estacionamiento, estacionamientos en superficie, estación multimodal y vialidades de acceso del NAICM	active	2016-05-04 00:00:00	\N	8380018.06	MXN	2016-05-04 00:00:00	\N	
143	143	IO009KDH99-N83-2015	 ITP-SRO-DCAGI-SC-107/15	Desarrollo del Proyecto ejecutivo para el entronque de acceso de carga en la zona Norte del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	Desarrollo del Proyecto ejecutivo para el entronque de acceso de carga en la zona Norte del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	active	2015-11-24 00:00:00	2016-12-31 00:00:00	8090576.25	MXN	2015-11-08 00:00:00	\N	
156	156	AA-009KDH999-E58-2016	AD-AS-DCAGI-SC-110/15	Servicio de Testigo Social para que Atestigüe la Etapas del Procedimiento de la Licitación Pública Nacional de Obra Pública de Carga, Acarreo y Descarga Dentro y Fuera del Polígono del Material Existente, Producto de Depósitos de Demoliciones y Desazolve, Incluye Conformación del Terreno donde se Construirá el Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM) para el NAICM	Servicio de Testigo Social para que Atestigüe la Etapas del Procedimiento de la Licitación Pública Nacional de Obra Pública de Carga, Acarreo y Descarga Dentro y Fuera del Polígono del Material Existente, Producto de Depósitos de Demoliciones y Desazolve, Incluye Conformación del Terreno donde se Construirá el Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM) para el NAICM	terminated	2015-12-01 00:00:00	\N	332975.00	MXN	2015-12-01 00:00:00	\N	
171	171	AO-009KDH999-E14-2016	AD-SRO-DCAGI-SC-103/15	Estudios del Sistema de Drenaje Pluvial del Nuevo Aeropuerto Internacional de la Ciudad de México.	Estudios del Sistema de Drenaje Pluvial del Nuevo Aeropuerto Internacional de la Ciudad de México.	active	2015-12-01 00:00:00	2016-01-29 00:00:00	18726530.31	MXN	2015-11-30 00:00:00	\N	
96	96	IO-009KDH999-N41-2015	ITP-SRO-DCAGI-SC-048/15	Elaboración del estudio de las características topográficas del terreno del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	Elaboración del estudio de las características topográficas del terreno del Nuevo Aeropuerto Internacional de la Ciudad de México, que deberan realizarse de conformidad con los Términos de referencia	terminated	2015-07-29 00:00:00	2015-09-26 00:00:00	33577144.97	MXN	2017-07-29 00:00:00	\N	
202	202	-	AD-SRO-DCAGI-SC-089/15	Servicios de experto revisor para la asistencia técnica especializada en materia de protección contra incendios, aplicada a la infraestructura aeroportuaria.	Servicios de experto revisor para la asistencia técnica especializada en materia de protección contra incendios, aplicada a la infraestructura aeroportuaria.	active	2015-12-01 00:00:00	2016-12-01 00:00:00	1636853.45	MXN	2015-12-01 00:00:00	\N	
157	157	AA-009KDH999-E59-2016	AD-AS-DCAGI-SC-116/15	Servicio de un Testigo Social para que atestigue la Etapas del procedimiento de Licitación Pública de Obra Pública de "Construcción de los Caminos provisionsles de Acceso al (NAICM), ejecutando Trabajos de Terraceria, Estructura, Obras de Drenaje, Pavimentación y Señalamiento".	Servicio de un Testigo Social para que atestigue la Etapas del procedimiento de Licitación Pública de Obra Pública de "Construcción de los Caminos provisionsles de Acceso al (NAICM), ejecutando Trabajos de Terraceria, Estructura, Obras de Drenaje, Pavimentación y Señalamiento".	active	2015-12-17 00:00:00	\N	479484.00	MXN	2015-12-17 00:00:00	\N	
158	158	 AA-009KDH999-E27-2016	AD-AS-DCAGI-SC-119/15	Servicio de Testigo Social, para que atestigue las Etapas del Procedimiento de la Licitación Pública Nacional de Obra Pública de Nivelación y Limpieza del Terreno del Nuevo Aeropuerto Internacional de la Ciudad de México.	Servicio de Testigo Social, para que atestigue las Etapas del Procedimiento de la Licitación Pública Nacional de Obra Pública de Nivelación y Limpieza del Terreno del Nuevo Aeropuerto Internacional de la Ciudad de México.	terminated	2016-12-01 00:00:00	\N	355962.10	MXN	2016-12-01 00:00:00	\N	
172	172	AO-009KDH999-E55-2016	AD-SRO-DCAGI-SC-104/15	Proyecto Ejecutivo para el Alumbrado Público de la Barda Perimetral del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)		terminated	2015-12-02 00:00:00	2016-07-16 00:00:00	620689.66	MXN	2015-11-30 00:00:00	\N	
163	163	AA-009KDH999-E74-2016	AD-S-DCAGI-SC-017/16	Servicio Integral de Limpieza en los inmuebles de GACM	Prestación del "Servicio integral de limpieza en los inmuebles del Grupo Aeroportuario de la Ciudad de México", los cuales serán prestados totalmente a satisfacción de GACM, de conformidad con las especificaciones y características establecidas.	active	2016-01-01 00:00:00	2016-11-30 00:00:00	646211.80	MXN	2015-12-29 00:00:00	\N	
159	159	-	AD-OP-DCAGI-SC-024/16	Obras de Excavación de prueba, Losa experimental y prueba de Pilotes para el El Edificio Terminal y Torre de Control del NAICM	Obras de Excavación de prueba, Losa experimental y prueba de Pilotes para el El Edificio Terminal y Torre de Control del NAICM	active	2016-05-12 00:00:00	2016-10-08 00:00:00	57742619.43	MXN	2016-05-12 00:00:00	\N	
218	218	-	-	Construcción del Edificio Terminal del Nuevo Aeropuerto Internacional de la Ciudad de México		none	\N	\N	0		\N	\N	
173	173	-	GACM/DCI/SJ/CI/008/2015	Estudio de rehabilitacion y adaptacion de los canales existentes para que funcionen como infraestructura de drenaje temporal, y remocion de material de desecho, en el terreno del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	Estudio de rehabilitacion y adaptacion de los canales existentes para que funcionen como infraestructura de drenaje temporal, y remocion de material de desecho, en el terreno del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	terminated	2015-05-01 00:00:00	2015-06-01 00:00:00	1206165.79	MXN	2015-05-01 00:00:00	\N	
160	160	-	AD-OP-DCAGI-SC-025/16	Instalación de equipo de Medición de Energía  Eléctrica en las Puertas 7 y 8 del Nuevo aeropuerto Internacional de la Ciudad de México (NAICM)	Instalación de equipo de Medición de Energía  Eléctrica en las Puertas 7 y 8 del Nuevo aeropuerto Internacional de la Ciudad de México (NAICM)	terminated	2016-04-11 00:00:00	2016-04-29 00:00:00	67996.00	MXN	2016-04-11 00:00:00	\N	
161	161	AO-009KDH999-E18-2016	AD-OP-DCAGI-SC-108/15	Proyecto ejecutivo para la construcción de carriles de desaceleración, plataformas de almacenamiento y carriles de aceleración en las puertas 7, y 9 de acceso al polígono del NAICM.	Proyecto ejecutivo para la construcción de carriles de desaceleración, plataformas de almacenamiento y carriles de aceleración en las puertas 7, y 9 de acceso al polígono del NAICM.	terminated	2015-11-30 00:00:00	2015-12-29 00:00:00	690000.00	MXN	2015-11-30 00:00:00	\N	
174	174	-	GACM-SPF/01/2014-2017	Los servicios de protección, custodia, vigilancia y seguridad en los bienes e intalaciones de GACM.	Los servicios de protección, custodia, vigilancia y seguridad en los bienes e intalaciones de GACM	none	2014-10-16 00:00:00	2017-10-15 00:00:00	0		2014-10-15 00:00:00	\N	
162	162	SA-009KDH999-N10-2014	AD-S-DCAGI-SC-013/14	Implementación y Soporte Técnico Relacionados con Licencias de Software	Licenciamiento Oracle y servicios profesionales de implementación para crear un sistema de planificación de recursos gubernamentales "GRP", (por sus siglas en inglés, Goverment Resource Planning)	active	2014-12-19 00:00:00	2017-12-31 00:00:00	54998429.37	MXN	2014-12-19 00:00:00	\N	
144	144	LO-009KDH999-E22-2016	LPN-SRO-DCAGI-SC-028-2016	Supervisión  de la Construcción de la Barda y Camino Perimetral, Alumbrado, Servicios Inducidos y Casetas de Acceso  para el Nuevo Aeropuerto Internacional de la Ciudad de México	Supervisión  de la Construcción de la Barda y Camino Perimetral, Alumbrado, Servicios Inducidos y Casetas de Acceso  para el Nuevo Aeropuerto Internacional de la Ciudad de México	active	2016-04-13 00:00:00	2017-01-12 00:00:00	12999262.50	MXN	2016-04-13 00:00:00	\N	
90	90	 LO-009KDH999-N20-2015	LPN-O-DCAGI-SC-024/15	Construcción de accesos y plataformas para exploración geotécnica para la pista número 2 del Nuevo Aeropuerto Internacional de la Ciudad de México.	Construcción de accesos y plataformas para exploración geotécnica para la pista número 2 del Nuevo Aeropuerto Internacional de la Ciudad de México.	terminated	2015-05-14 00:00:00	2015-06-27 00:00:00	5038656	MXN	2015-05-14 00:00:00	\N	
164	164	-	AD-SRO-CONV-DCAGI-SC-03/16	Establecer las bases a las que se sujetarán Grupo Aeroportuario de la Ciudad de México S.A. de C.V: y el Instituto Mexicano del Transporte para que en forma reciproca se proporcionen los apoyos necesarios en materia de recursos humanos, materiales, tecnológicos, de inormación y capacitación en haras de lograr la efectiva colaboración para la realización del Proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México.	Establecer las bases a las que se sujetarán Grupo Aeroportuario de la Ciudad de México S.A. de C.V: y el Instituto Mexicano del Transporte para que en forma reciproca se proporcionen los apoyos necesarios en materia de recursos humanos, materiales, tecnológicos, de inormación y capacitación en haras de lograr la efectiva colaboración para la realización del Proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México.	active	2016-06-10 00:00:00	2020-12-31 00:00:00	0	MXN	2016-06-10 00:00:00	\N	
183	183	-	AD-AS-DCAGI-SC-011/16	Propuesta para la realización del Servicio de Ambulancia para el Traslado de Personal, para el Programa de Empleo Temporal (PET).	Propuesta para la realización del Servicio de Ambulancia para el Traslado de Personal, para el Programa de Empleo Temporal (PET).	active	2016-02-15 00:00:00	2016-08-12 00:00:00	259000.00	MXN	2016-02-15 00:00:00	\N	
184	184	-	AD-AS-DCAGI-SC-013/16	Servicios Profesionales de Levantamiento de Imagen y Video de Nuevo Aeropuerto Internacional de la Ciudad de México.	Servicios Profecionales de Levantamiento de Imagen y Video de Nuevo Aeropuerto Internacional de la Ciudad de México.	terminated	2016-02-02 00:00:00	2016-02-29 00:00:00	2450000.00	MXN	2016-02-11 00:00:00	\N	
200	200	-	AD-AS-DCAGI-SC-057/15	Servicio Profesionales de asistencia técnica relacionados con el proyecto del NAICM	Servicio Profesionales de asistencia técnica relacionados con el proyecto del NAICM	terminated	2015-07-31 00:00:00	2015-12-31 00:00:00	1102185.31	MXN	2015-07-31 00:00:00	\N	
201	201	-	AD-SRO-DCAGI-SC-021-15	Contrato de Servicios Profesionales en materia de vinculación con organismos internacionales y adopción de las mejores prácticas internacionales para la consecución de sus objetivos y asegurar una adecuada infraestructira aeroportuaria  para la operación del AIVM "	Asesoría técnica especializada en materia de vinculación con organismos internacionales y adopción de las mejores prácticas internacionales"	terminated	2015-05-04 00:00:00	\N	1469580.45	MXN	2015-05-04 00:00:00	\N	
185	185	-	AD-AS-DCAGI-SC-014-16	Servico de Testigo Social para que Atestigüe las Etapas del Procedimiento del la Licitación Pública Internacional del Proyecto Denominado "Desarrollo de Ingeniería de Detalle y Contrucción de Subestaciones y Acometida Eléctrica del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	Servico de Testigo Social para que Atestigüe las Etapas del Procedimiento del la Licitación Pública Internacional del Proyecto Denominado "Desarrollo de Ingeniería de Detalle y Contrucción de Subestaciones y Acometida Eléctrica del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	terminated	2016-03-01 00:00:00	\N	269225.44	MXN	2016-03-01 00:00:00	\N	
187	187	-	AD-AS-DCAGI-SC-018/15	Servicio Integral de Limpieza en las Oficinas de Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	Servicio Integral de Limpieza en las Oficinas de Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	terminated	2015-01-02 00:00:00	2015-06-30 00:00:00	361637.93	MXN	2015-01-02 00:00:00	\N	
92	92	LO-009KDH999-T15-2015	 LPI-SRO-DCAGI-SC-030/15	Estudio mediante el cual se definan las características técnicas de infraestructura y diseño esquemático de la terminal de carga del Nuevo Aeropuerto Internacional de la Ciudad de México.	Estudio mediante el cual se definan las características técnicas de infraestructura y diseño esquemático de la terminal de carga del Nuevo Aeropuerto Internacional de la Ciudad de México.	terminated	2015-05-29 00:00:00	2015-09-03 00:00:00	11650000	MXN	2015-05-29 00:00:00	\N	
188	188	-	SA-009KDH999-N39-2015	Contrato de Servicios Profesionales en materia de vinculación con organismos internacionales y adopción de las mejores prácticas internacionales para la consecución de sus objetivos y asegurar una adecuada infraestructira aeroportuaria  para la operación del AIVM	Asesoría técnica especializada en materia de vinculación con organismos internacionales y adopción de las mejores prácticas internacionales	terminated	2015-05-04 00:00:00	\N	1469580.45	MXN	2015-05-04 00:00:00	\N	
190	190	-	AD-AS-DCAGI-SC-069/15	Servicios Administrados de Infraestructura de Operación Crítica (Data Center) Para el GACM Para los Ejercicios Fiscales 2015 a 2018.	Proveer una plataforma tecnológica mediante ambientes físicos y virtualizados (Computo, Red y Almacenamiento), que garanticen la compatibilidad y soporte de los sistemas operativos y aplicaciones para atender de manera integral los servicios que demanden las unidades administrativas del GACM.	active	2015-09-08 00:00:00	2018-12-31 00:00:00	81153576.80	MXN	2015-09-23 00:00:00	\N	
88	88	LO-009KDH999-N5-2014	 LPN-O-DCAGI-SC-014/2014	Extracción de ademes y restitución del terreno que ocupan dichos elementos ubicados en la poligonal para el Nuevo Aeropuerto Internacional de la Cuidad de México.	Extracción de ademes y restitución del terreno que ocupan dichos elementos ubicados en la poligonal para el Nuevo Aeropuerto Internacional de la Cuidad de México.	terminated	2015-01-05 00:00:00	2015-07-03 00:00:00	39724276.56	MXN	2015-01-02 00:00:00	\N	
89	89	LO-009KDH999- N47-2015	LPN-OP-DCAGI-SC-066/15	Desarrollo del Proyecto Ejecutivo, construcción, equipamiento de mobiliario en instalaciones complementarias para el campamento del Grupo Aeroportuario de la Ciudad de México en el sitio del Nuevo Aeropuerto Internacional de la Ciudad de México.	Desarrollo y ejecución del proyecto integral consistente en: desarrollo del P.E. tomando como base el proyecto que entrega el GACM, el cual deberá sembrarse en el terreno específico y adecuarse, así como la construcción y el equipamiento de instalación permanente que incluye suministro, montaje, instalación, pruebas, puesta en operación, entrega de garantías, instructivos y manuales de operación y  mantenimiento de los equipos e instalaciones, así como la capacitación del personal asignado para el manejo de los equipos del proyecto integral del campamento s para el personal directivo del GACM, que se entregara terminada y en condiciones de funcionamiento.	active	2015-09-10 00:00:00	2016-04-06 00:00:00	112046320.57	MXN	2015-09-10 00:00:00	\N	
186	186	-	AD-AS-DCAGI-SC-016-16	Servicio de sanitarios portátiles para el programa de empleo temporal (PET)	Servicio de sanitarios portátiles para el programa de empleo temporal (PET)	terminated	2016-02-15 00:00:00	2016-04-14 00:00:00	203100.00	MXN	2016-02-15 00:00:00	\N	
91	91	No. LA-009KDH999-E29-2016	LPN-AS-DACGI-SC-033/16	Servicio de Transporte de personas en autobuses y de traslado de maquinaria y equipo en camionetas de redilas para el programa de empleo temporal.	Servicio de Transporte de personas en autobuses y de traslado de maquinaria y equipo en camionetas de redilas para el programa de empleo temporal.	active	2016-04-27 00:00:00	2016-12-16 00:00:00	26427200	MXN	2016-05-02 00:00:00	\N	
93	93	LO-009KDH999-T52-2015	LPI-OP-DCAGI-CS-079-15	Diseñar e instrumentar el modelo virtual de información para la construcción (BIM) del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	Diseñar e instrumentar el modelo virtual de información para la construcción (BIM) del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	active	2015-10-23 00:00:00	2019-10-21 00:00:00	158629469.03	MXN	2015-10-23 00:00:00	\N	
94	94	IO-009KDH999-N81-2015	ITP-SRO-DCAGI-SC-082/15	“Servicio de transporte con camionetas de redilas para los trabajos que conforman el programa de empleo temporal (PET), en el predio del Nuevo Aeropuerto Internacional de la Ciudad de México"	“Servicio de transporte con camionetas de redilas para los trabajos que conforman el programa de empleo temporal (PET), en el predio del Nuevo Aeropuerto Internacional de la Ciudad de México"	active	2015-10-22 00:00:00	2015-12-31 00:00:00	1176000	MXN	2015-10-02 00:00:00	\N	
95	95	No. IO-009KDH999-N54-2015	ITP-SRO.DCAGI-SC-63/15	Supervisión para: la construcción del proyecto integral consistente en barda y camino perimetral, alumbrado, servicios inducidos y casetas de acceso para el Nuevo Aeropuerto Internacional de la Ciudad de México (primera etapa)	Supervisión para: la construcción del proyecto integral consistente en barda y camino perimetral, alumbrado, servicios inducidos y casetas de acceso para el Nuevo Aeropuerto Internacional de la Ciudad de México (primera etapa)	active	2015-08-15 00:00:00	2015-12-31 00:00:00	3286659.95	MXN	2015-08-15 00:00:00	\N	
207	207	No aplica	ITP-S-DCAGI-SC-004/2014	Servicios especializados en el suministro de personal tercerizados.	Obtención de la prestacion de servicios especializados en el suministro de "terceros".	terminated	2014-12-01 00:00:00	2015-11-30 00:00:00	37181503.72	MXN	2014-12-01 00:00:00	\N	
97	97	IO-009KDH999-N30-2015	ITP-SRO-DCAGI-SC-045/15	Asesoria Legal en materia de Derecho de la Aviación, Derecho Aeropuertario, Derecho Internacional y Especializado en Asesoría en Negociación con Empresas Nacionales e Internacionales, en general acompañamiento respecto de todo aquel Procedimiento Jurídico de las distintas materias que reconoce nuestro Sistema Jurídico Mexicano.	Asesoria Legal en materia de Derecho de la Aviación, Derecho Aeropuertario, Derecho Internacional y Especializado en Asesoría en Negociación con Empresas Nacionales e Internacionales, en general acompañamiento respecto de todo aquel Procedimiento Jurídico de las distintas materias que reconoce nuestro Sistema Jurídico Mexicano.	terminated	\N	\N	14964000	MXN	\N	\N	
98	98	IO009KDH99-N53-2015	 ITP-SRO-DCAGI-SC-044/15	Servicios relacionados con el programa de empleo temporal (pet) correspondiente a las acciones preparatorias para la construcción del nuevo aeropuerto internacional de la Ciudad de México (servicio de traslado de personas, en vehìculos ligeros)	Servicios relacionados con el programa de empleo temporal (pet) correspondiente a las acciones preparatorias para la construcción del nuevo aeropuerto internacional de la Ciudad de México (servicio de traslado de personas, en vehìculos ligeros) 	terminated	2015-07-13 00:00:00	2015-12-31 00:00:00	4880000	MXN	2015-07-13 00:00:00	\N	
99	99	IO-009KDH999-N34-2015	ITP-SRO-DCAGI-SC-037/15	Proyecto Ejecutivo para la Construcción del Camino perimetral y sus instalaciones complementarias en el lado Norte del Polígono del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	Proyecto Ejecutivo para la Construcción del Camino perimetral y sus instalaciones complementarias en el lado Norte del Polígono del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	terminated	2015-06-13 00:00:00	2015-07-27 00:00:00	5997988.52	MXN	2015-06-13 00:00:00	\N	
101	101	IO-009KDH999-E96-2015	 ITP-SRO-DCAGI-SC-018/16	Servicio de integración de la estrategia global y modelo de negocios para el Nuevo Aeropuerto Internacional de la Ciudad de México	Servicio de integración de la estrategia global y modelo de negocios para el Nuevo Aeropuerto Internacional de la Ciudad de México	active	2016-04-01 00:00:00	2016-11-26 00:00:00	79000000	MXN	2016-03-23 00:00:00	\N	
41	41	No aplica	GACM/DCI/SJ/CI/007-2015	Servicio de Seguridad para Salvaguardar la vida e integridad física de los trabajadores, la protección de la infraestructura, inmuebles y zonas federales concesionados a la entidad	Servicio de Seguridad para Salvaguardar la vida e integridad física de los trabajadores, la protección de la infraestructura, inmuebles y zonas federales concesionados a la entidad	active	2015-04-16 00:00:00	2015-12-31 00:00:00	22440896.40	MXN	2015-04-15 00:00:00	\N	
102	102	IO-009KDH999-N10-2015	 ITP-SRO-DCAGI-SC-016/15	Servicios de supervisión para la obra: extracción de ademes y restitución del terreno que ocupan dichos elementos ubicados en la poligonal para el Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	 Servicios de supervisión para la obra: extracción de ademes y restitución del terreno que ocupan dichos elementos ubicados en la poligonal para el Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	terminated	2015-03-21 00:00:00	2015-09-16 00:00:00	2156884.2	MXN	2015-07-20 00:00:00	\N	
103	103	IO-009KDH999-E17-2016	ITP-SRO-DCAGI-SC-015-16	Servicios de consultoría de la autoridad verificadora del comisionamiento avanzado de LEED para el proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	Servicios de consultoría de la autoridad verificadora del comisionamiento avanzado de LEED para el proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	terminated	2016-03-15 00:00:00	2021-08-18 00:00:00	90190682.54	MXN	2016-03-15 00:00:00	\N	
105	105	IA-009KDH999-N7-2014	ITP-S-DCAGI-SC-008/2014	Servicios de Adaptación y Adecuaciones en Instalaciones de Torre Murano	Prestar los Servicios de Adaptación y Adecuaciones de Instalaciones en Torre Murano 	terminated	2014-12-05 00:00:00	2014-12-31 00:00:00	1852058.2	MXN	2014-05-12 00:00:00	\N	
109	109	LO-009KDH999-N86-2015	LPN-SRO-DCAGI-SC-117/15	Supervisión Técnica, Administrativa y de Control de Calidad para los trabajos de nivelación  y limpieza del terreno del NAICM.	Supervisión Técnica, Administrativa y de Control de Calidad para los trabajos de nivelación  y limpieza del terreno del NAICM.	terminated	2015-12-31 00:00:00	2016-12-16 00:00:00	9720916.92	MXN	2015-12-31 00:00:00	\N	
110	110	LO-009KDH999-N87-2015	LPN-SRO-DCAGI-SC-118/15	Supervisión Técnica, Administrativa y de Control de Calidad para los trabajos de construcción de los caminos provisionales de acceso al NAICM	Supervisión Técnica, Administrativa y de Control de Calidad para los trabajos de construcción de los caminos provisionales de acceso al NAICM	active	2015-12-31 00:00:00	2017-01-03 00:00:00	12043340.90	MXN	2015-12-31 00:00:00	\N	
106	106	1	ITP-S-DCAGI-SC-004/2014	Servicios especializados en el suministro de personal tercerizados.	Obtención de la prestacion de servicios especializados en el suministro de "terceros".	terminated	2014-12-01 00:00:00	2015-11-30 00:00:00	37181503.72	MXN	2014-12-01 00:00:00	\N	
107	107	1	ITP-S-DCAGI-SC-002/2014	Servicios para la edición y distribución del libro	Servicios para la edición y distribución del libro denominado "Proyectos para el Nuevo Aeropuerto Internacional de la Ciudad de México"	terminated	2014-11-24 00:00:00	2014-12-15 00:00:00	1540187.5	MXN	\N	\N	
108	108	 IO-009KDH999-E15-2016	 ITP-OP-DCAGI-SC-012/16	Construcción de accesos y plataformas para exploración geotécnica, rehabilitación de tramos de prueba y bacheo somero de caminos existentes dentro del terreno par el Nuevo Aeropuerto Internacional de la Ciudad de México.	Construcción de accesos y plataformas para exploración geotécnica, rehabilitación de tramos de prueba y bacheo somero de caminos existentes dentro del terreno par el Nuevo Aeropuerto Internacional de la Ciudad de México.	active	2016-03-10 00:00:00	2016-06-07 00:00:00	10961673.55	MXN	2016-03-10 00:00:00	\N	
209	209	 AO-009KDH999-E42-2016	AD-SRO-DCAGI-SC-086/15	Servicio de asistencia técnica especializada en materia de Geotecnia y Cimentación aplicada a la infraestructura aeroportuaria.	Servicio de asistencia técnica especializada en materia de Geotecnia y Cimentación aplicada a la infraestructura aeroportuaria.	terminated	2015-11-01 00:00:00	2016-04-28 00:00:00	1880043.10	MXN	2015-11-01 00:00:00	\N	
210	210	1	CTO.ARRENDAMIENTO.T.MURANO.01/14	Arrendamiento de Torre Murano	Uso y goce temporal del Bien arrendado y los cajones de estacionamiento	active	2015-09-15 00:00:00	2017-09-14 00:00:00	500498	MXN	2015-10-19 00:00:00	\N	
203	203	No aplica	GACM/DCI/SJ/CM-E/001-2016	Convenio de colaboración para llevar a cabo los Servicios consistentes en el apoyo técnico y tecnológico para la implementación y ejecución de planes y programas de logística de construcción del NAICM	Llevar a cabo los Servicios consistentes en el apoyo técnico y tecnológico para la implementación y ejecución de planes y programas de logística de construcción del NAICM	active	2016-03-01 00:00:00	\N	309200069.2	MXN	2016-03-01 00:00:00	\N	
211	211	1	DTC-026/2013	Servicio de asesoría financiera y legal para la obtención del financiamiento, desarrollo de estructura jurídica, concesionamiento y demás actividades relacionadas con la financiación para la construcción del NAICM	Servicio de asesoría financiera y legal para la obtención del financiamiento, desarrollo de estructura jurídica, concesionamiento y demás actividades relacionadas con la financiación para la construcción del NAICM	active	2013-11-27 00:00:00	2016-11-27 00:00:00	64100000.00	MXN	2013-11-27 00:00:00	\N	
212	212	1	GACM/DCI/SJ/CC-015-15	Instrumentar un esquema de colaboración que permita establecer las bases generales para desarrollar la especialidad de Ingeniería Aeroportuaria	Instrumentar un esquema de colaboración que permita establecer las bases generales para desarrollar la especialidad de Ingeniería Aeroportuaria 	active	2015-05-12 00:00:00	\N	0	MXN	2015-05-12 00:00:00	\N	
204	204	No aplica	GACM/DG/DCAGI/SJ/CI/010/15	Establecer un mecanismo correspondiente entre GACM y CONAGUA para el mantenimiento y operación de las obras de infraestructira para llevar a cabo la regulación hidráulica en las zonas aledañas al NAICM, que permitan favorecer y mejorar el hábitat para las aves acuáticas migratorias que arriban a la zona, asi como las aves residentes y realizar en forma coordinada la operación y mantenimiento de las obras hidráulicas de regulación y conducción de los escurrimientos pluviales provenientes del interior del perímetro del NAICM, durante su etapa de construcción, a través de un sistema de drenaje que operará temporalmente, los cuales serán regulados en dos lagunas a cargo de GACM y cuyas descargas al Dren General del Valle quedarán bajo el control de CONAGUA.	Establecer un mecanismo correspondiente entre GACM y CONAGUA para el mantenimiento y operación de las obras de infraestructira para llevar a cabo la regulación hidráulica en las zonas aledañas al NAICM, que permitan favorecer y mejorar el hábitat para las aves acuáticas migratorias que arriban a la zona, asi como las aves residentes y realizar en forma coordinada la operación y mantenimiento de las obras hidráulicas de regulación y conducción de los escurrimientos pluviales provenientes del interior del perímetro del NAICM, durante su etapa de construcción, a través de un sistema de drenaje que operará temporalmente, los cuales serán regulados en dos lagunas a cargo de GACM y cuyas descargas al Dren General del Valle quedarán bajo el control de CONAGUA.	none	2015-05-12 00:00:00	\N	0	No aplica	2015-05-12 00:00:00	\N	
213	213	1	AD-AS-DCAGI-SC-046/15	Servicios Administrados de Arrendamiento de Equipo y Bienes Informáticos para el Grupo Aeroportuario de la Ciudad de México.	Dotar al personal del Grupo Aeroportuario de la Ciudad de México, S.A. de C.V. de la infraestructura tecnológica adecuada que se requiere para cumplir exitosamente sus metas de planeación, ejecución, construcción y operación del Nuevo Aeropuerto de la Ciudad de México.	active	2015-07-06 00:00:00	2018-12-31 00:00:00	31779878.00	MXN	2015-07-20 00:00:00	\N	
219	219	-	-	Sistema de Precarga e instrumentación geotécnica, infraestructura, estructura de pavimentos y obra civil de ayudas visuales y para la navegación de la pista 2 y área de túneles del Nuevo Aeropuerto Internacional de la Ciudad de México. (NAICM)	Sistema de Precarga e instrumentación geotécnica, infraestructura, estructura de pavimentos y obra civil de ayudas visuales y para la navegación de la pista 2 y área de túneles del Nuevo Aeropuerto Internacional de la Ciudad de México. (NAICM)	none	\N	\N	0		\N	\N	
220	220	-	-	Sistema de Precarga e instrumentación geotécnica, infraestructura, estructura de pavimentos y obra civil de ayudas visuales y para la navegación de la pista 3 y área de túneles del Nuevo Aeropuerto Internacional de la Ciudad de México. (NAICM)	Sistema de Precarga e instrumentación geotécnica, infraestructura, estructura de pavimentos y obra civil de ayudas visuales y para la navegación de la pista 3 y área de túneles del Nuevo Aeropuerto Internacional de la Ciudad de México. (NAICM)	none	\N	\N	0		\N	\N	
37	37	-	"Sin número"	Contrato de Fideicomiso de Administarción y Pago para la Adquisición de Bienes y Contratación de Servicios, y Obre Pública.	La Constitución de Fideicomiso de Administración y Pago para la Adquisicion de bienes y contratación de servicios, y obra pública.	active	2014-10-29 00:00:00	2024-10-29 00:00:00	10000000	MXN	2014-10-29 00:00:00	\N	
\.


--
-- Name: contract_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('contract_id_seq', 222, true);


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
1	71	\N	Contrato de Prestación de Servicios GACM/DCI/SJ/CI/001-2015	-	Contrato de Prestación de Servicios GACM/DCI/SJ/CI/001-2015	Cláusula Cuarta: Lugar y Forma de la Prestación del Servicio.		\N	\N		
2	71	\N	Contrato de Prestación de Servicios GACM/DCI/SJ/CI/001-2015	-	Contrato de Prestación de Servicios GACM/DCI/SJ/CI/001-2015	Cláusula Cuarta: Lugar y Forma de la Prestación del Servicio.		\N	\N		
3	22	\N	Convenio de Colaboración	AD-SRO-CONV-DCAGI-SC-002/16	Convenio de Colaboración número AD-SRO-CONV-DCAGI-SC-002/16	Convenio firmado		\N	\N		es
4	61	\N	Contrato	ITP-SRO-DCAGI-SC-049/2015	Contrato de servicios relacionados a la Obra Pública ITP-SRO-DCAGI-SC-049/2015	Anexo 1. Suficiencia presupuestaria. Anexo 2. Acta constitutiva de "el contratista" F GLEZ CONSULTORES Y ASOCIADOS, S.A. DE C.V. Anexo 3. Instrumento notarial mediante el cual acredita la personalidad del representante legal de "el contratista" y copia de la identificación oficial. Anexo 4. RFC de "el contratista" F GLEZ CONSULTORES Y ASOCIADOS, S.A. DE C.V. Anexo 5. Comprobante domicilio del "contratista". Anexo 6. Constancia de cumplimiento de obligaciones fiscales de "el contratista" F GLEZ CONSULTORES Y ASOCIADOS, S.A. DE C.V. Anexo 7. Escrito de manifestación bajo protesta de decir verdad, de no encontrarse en los supuestos de los artículos 51 y 78 de la LOPSRM "el contratista" F GLEZ CONSULTORES Y ASOCIADOS, S.A. DE C.V. Anexo 8. Escrito de manifestación bajo protesta de decir verdad sobre la estratificación de la empresa F GLEZ CONSULTORES Y ASOCIADOS, S.A. DE C.V. Anexo 9. Manifestación bajo protesta de decir verdad, que "el contratista", se encuentra al corriente en el cumplimiento de sus obligaciones en materia de seguridad social, y constancia. Anexo 10. Términos de referencia. Anexo 11. Propuesta económica integral. Anexo 12. Acta de emisión de fallo de adjudicación. Anexo 13. Programa general de ejecución y de erogaciones. Anexo 14. Programa de amortización del anticipo.		\N	\N	PDF	es
5	21	\N	Contrato firmado	AD-S-DCAGI-SC-017/2014	Contrato Abierto de Prestación de Servicios Relacionados con la Obra Pública por Precios Unitarios AD-S-DCAGI-SC-017/2014	Contrato firmado		\N	\N		es
6	73	\N	Convenio firmado	-	Convenio de Colaboración para realizar el Servicio Técnico de "Elaboración de un Estudio para definir los bancos de prestamo, bancos de depósito, y laboratorio de materiales." GACM/DCI/SJ/CI/02-2014	Cláusula Cuarta del Contrato.- Entregables.		\N	\N		
7	23	\N	Convenio firmado	AD-SRO-CONV-DCAGI-SC-04/16	AD-SRO-CONV-DCAGI-SC-04/16	Convenio firmado		\N	\N		es
8	24	\N	Convenio de Colaboración	AD-SRO-CONV-DCAGI-SC-006/16	Convenio de Colaboración número AD-SRO-CONV-DCAGI-SC-006/16	Convenio firmado		\N	\N		es
9	25	\N	Contrato firmado	AD-SRO-DCAGI-SC-001/15	Contrato de Prestación de Servicios Relacionados con la Obra Pública por Precios Unitarios y a Tiempo Determinado AD-SRO-DCAGI-SC-001/15	Contrato firmado		\N	\N		es
10	26	\N	Contrato firmado	AD-SRO-DCAGI-SC-002/16	Contrato de Servicios Relacionados con Obra Pública a Precios Unitarios y Tiempo Determinado No. AD-SRO-DCAGI-SC-002/16	Contrato firmado		\N	\N		es
11	27	\N	Contrato firmado	AD-SRO-DCAGI-SC-002/2015	 Prestación de los servicos consistentes en la elaboración de estudios de geotécnia, topografia,  gedésia  y levantamiento de información geografica através de un vuelo con tecnología Lidar. AD-SRO-DCAGI-SC-002/2015	Contrato firmado		\N	\N		es
12	75	\N	Convenio firmado	-	Convenio de Colaboración para llevar a cabo la Elaboración del Estudio Dictamen del Proyecto de Inversión (Factibilidad Técnica, Económica, Legal y Estudios Relacionados) del Nuevo Aeropuerto Internacional de la Ciudad de México	Cláusula Sexta del Contrato.- Formas de la Aportación 		\N	\N		
13	72	\N	Contrato de Estudio de Investigación GACM/DCI/SJ/CI/012-2015	-	-	-		\N	\N		
14	28	\N	Contrato firmado	AD-SRO-DCAGI-SC-003/15	Contrato de Prestación de Servicios Relacionados con la Obra Pública por Precios Unitarios y a Tiempo Determinado AD-SRO-DCAGI-SC-003/15	Contrato firmado		\N	\N		es
15	29	\N	Contrato firmado	AD-SRO-DCAGI-SC-004/15	Contrato de Servicios relacionados con Ia Obra Pública por Precios Unitarios y a Tiempo Determinado AD-SRO-DCAGI-SC-004/15	Contrato firmado		\N	\N		es
16	30	\N	Contrato firmado	AD-SRO-DCAGI-SC-005/15	Contrato de Servicios relacionados con Ia Obra Pública por Precios Unitarios y a Tiempo Determinado AD-SRO-DCAGI-SC-005/15	Contrato firmado		\N	\N		es
17	31	\N	Contrato firmado	AD-SRO-DCAGI-SC-006/15	Contrato de Servicios relacionados con Ia Obra Pública por Precios Unitarios y a Tiempo Determinado AD-SRO-DCAGI-SC-006/15	Contrato firmado		\N	\N		es
18	32	\N	Contrato firmado	AD-SRO-DCAGI-SC-007/15	Contrato de Servicios relacionados con Ia Obra Pública por Precios Unitarios y a Tiempo Determinado AD-SRO-DCAGI-SC-007/15	Contrato firmado		\N	\N		es
19	33	\N	Contrato firmado	AD-SRO-DCAGI-SC-008/15	Contrato de Prestación de Servicios Relacionados con la Obra Pública por Precios Unitarios y a Tiempo Determinado AD-SRO-DCAGI-SC-008/15	Contrato firmado		\N	\N		es
20	34	\N	Contrato firmado	AD-SRO-DCAGI-SC-009/15	Contrato de prestación de servicios relacionados a la Obra Pública AD-SRO-DCAGI-SC-009/15	Contrato firmado		\N	\N		es
21	80	\N	Contrato de Prestación de Servicios GACM/DCI/SJ/CM-018-2015 	-	Contrato de Prestación de Servicios GACM/DCI/SJ/CM-018-2015 	Cláusula Décimo primera: metodologia operativa		\N	\N		
22	80	\N	Contrato de Prestación de Servicios GACM/DCI/SJ/CM-018-2015 	-	Contrato de Prestación de Servicios GACM/DCI/SJ/CM-018-2015 	Cláusula Décimo primera: metodologia operativa		\N	\N		
23	43	\N	Contrato específico de prestaciónde servicios número GACM/DCI/SJ/CM-E/05-2015	-	Contrato específico de prestaciónde servicios número GACM/DCI/SJ/CM-E/05-2015	Contrato específico de prestaciónde servicios número GACM/DCI/SJ/CM-E/05-2015		\N	\N		
24	48	\N	Contrato de servicios relacionados a la Obra Pública ITP-OP-DCAGI-SC-014/15	-	Contrato de servicios relacionados a la Obra Pública ITP-OP-DCAGI-SC-014/15	Contrato de servicios relacionados a la Obra Pública ITP-OP-DCAGI-SC-014/15		\N	\N		
25	83	\N	Contrato con la firma de las partes involucradas	1	Contrato firmado	Contacto plurianual de servicios relacionados a la obra pública no. LP-SRO-DCAGI-SC-042/15		\N	\N		
26	83	\N	Cláusulas del contrato sobre las condiciones de terminación del mismo.	2	Cláusula sobre las condiciones de entrega de la obra	Cláusula Décimo Quinta del Contrato.- Entrega, Verificación y Finiquito de "La Obra"		\N	\N		
75	185	\N	Contrato firmado	AD-AS-DCAGI-SC-014/16	Contrato de Prestación de Servicios Relacionados con la Obra Pública por Precios Unitarios y a Tiempo Determinado AD-AS-DCAGI-SC-014/16	Contrato firmado		\N	\N		es
77	187	\N	Contrato firmado	AD-AS-DCAGI-SC-018/15	Contrato de Adjudicación Directa N° AD-AS-DCAGI-SC-018/15	Contrato firmado		\N	\N		es
27	83	\N	Anexos del contrato	3	Anexos del contrato	ANEXO 1. SUFICIENCIA PRESUPUESTARIA. ANEXO 2. ACTA CONSTITUTIVA DE "EL CONTRATISTA" RAGAMEX CONSTRUCTORES, S.A. DE C.V., ASÍ COMO FACULTADES DE SU REPRESENTANTE LEGAL. ANEXO 3. RFC DE "EL CONTRATISTA" RAGAMEX CONSTRUCTORES, S.A. DEC.V. ANEXO 4. CUMPLIMIENTO DE OBLIGACIONES FISCALES DE "EL CONTRATISTA" RAGAMEX CONSTRUCTORES, S.A. DE C.V ANEXO 5. ESCRITO DE MANIFESTACIÓN BAJO PROTESTA DE DECIR VERDAD, DE NO ENCONTRARSE EN LOS SUPUESTOS 51 Y 78  DE LA LOPSRM DE "EL CONTRATISTA" RAGAMEX CONSTRUCTORES, S.A. DE C.V. ANEXO 6. ESCRITO DE MANIFESTACIÓN BAJO PROTESTA DE DECIR VERDAD DE ESTAR CLASIFICADA COMO PEQUEÑA EMPRESA, DE "EL CONTRATISTA" RAGAMEX CONSTRUCTORES, S.A. DE C.V. ANEXO 7. ESCRITO DE MANIFESTACIÓN BAJO PROTESTA DE DECIR VERDAD, DE ESTAR AL CORRIENTE EN EL CUMPLIMIENTO DE SUS OBLIGACIONES EN MATERIA DE SEGURIDAD SOCIAL, DE "EL CONTRATISTA" RAGAMEX CONSTRUCTORES, S.A. DE C.V. ANEXO 8. CURP DEL C. OLIVERIO GONZÁLEZ ALAFITA. ANEXO 9. RFC DEL C. OLIVERIO GONZÁLEZ ALAFITA. ANEXO 10. CUMPLIMIENTO DE OBLIGACIONES FISCALES DEL C. OLIVERIO GONZÁLEZ ALAFITA. ANEXO 11 . ESCRITO DE MANIFESTACIÓN BAJO PROTESTA DE DECIR VERDAD, DE NO ENCONTRARSE EN LOS SUPUESTOS 51 Y 78 DE LA LOPSRM DEL C. OLIVERIO GONZÁLEZ ALAFIT A. ANEXO 12. ESCRITO DE MANIFESTACIÓN BAJO PROTESTA DE DECIR VERDAD, DE ESTAR AL CORRIENTE EN EL CUMPLIMIENTO DE SUS OBLIGACIONES EN MATERIA DE SEGURIDAD SOCIAL, DEL C. OLIVERIO GONZÁLEZ ALAFITA. ANEXO 13. CONVENIO DE PROPOSICIÓN CONJUNTA. ANEXO 14. TERMINOS DE REFERENCIA. ANEXO 15. PROPUESTA ECONÓMICA INTEGRAL. ANEXO 16. ACTA DE EMISIÓN DE FALLO DE ADJUDICACIÓN. ANEXO 17. PROGRAMA GENERAL DE EJECU		\N	\N		
28	83	\N	Garantías sobre el recibimiento de anticipo	4	Fianza de anticipo	Fianza número 1647636 emitida el 2015-07-21 por ACE Fianzas Monterrey, S.A. de C.V.		\N	\N		
29	83	\N	Garantías para el cumplimiento del contrato	5	Fianza de cumplimiento	Fianza número 1639092, emitida el 2015-07-21 por ACE Fianzas Monterrey, S.A. de C.V.		\N	\N		
30	83	\N	Subcontratos relacionados con el contrato	7	Subcontrataciones	GACM no ha sido notificado sobre ninguna contratación		\N	\N		
31	84	\N	Contrato con la firma de las partes involucradas	1	Contrato firmado	Contrato plurianual de servicios relacionados a la obra pública no, LP-SRO-DCAGI-SC-041/15		\N	\N		
32	84	\N	Cláusulas del contrato sobre las condiciones de terminación del mismo.	2	Cláusula sobre las condiciones de entrega de la obra	Cláusula Décimo Quinta del Contrato.- Entrega, Verificación y Finiquito de "La Obra"		\N	\N		
33	84	\N	Anexos del contrato	3	Anexos del contrato	ANEXO 1. SUFICIENCIA PRESUPUESTARIA. ANEXO 2. ACTA CONSTITUTIVA DE "EL CONTRATISTA" SUPERVISIÓN Y CONTROL DE FAUNA, S.A. DE C.V. , ASÍ COMO FACULTADES DE SU REPRESENTANTE LEGAL E IDENTIFICACIÓN OFICIAL. ANEXO 3. RFC DE "EL CONTRATISTA" SUPERVISIÓN Y CONTROL DE FAUNA, S.A. DE C.V. ANEXO 4. CONSTANCIA DE CUMPLIMIENTO DE OBLIGACIONES FISCALES DE "EL CONTRATISTA" SUPERVISIÓN Y CONTROL DE FAUNA, S.A. DE C.V. ANEXO 5. ESCRITO DE MANIFESTACIÓN BAJO PROTESTA DE DECIR VERDAD, DE NO ENCONTRARSE EN LOS SUPUESTOS DE LOS ARTICULOS 51 Y 78 DE LA LOPSRM "EL CONTRATISTA" SUPERVISIÓN Y CONTROL DE FAUNA, S.A. DE  C.V. ANEXO 6. ESCRITO DE MANIFESTACIÓN BAJO PROTESTA DE DECIR VERDAD SOBRE LA ESTRATIFICACIÓN DE LA EMPRESA SUPERVISIÓN Y CONTROL DE FAUNA, S.A. DE C.V. ANEXO 7. ESCRITO DE MANIFESTACIÓN BAJO PROTESTA DE DECIR VERDAD, DE ESTAR AL CORRIENTE EN EL CUMPLIMIENTO DE SUS OBLIGACIONES EN MATERIA DE SEGURIDAD SOCIAL, DE "EL CONTRATISTA" SUPERVISIÓN Y CONTROL DE FAUNA, S.A. DE C.V., Y CONSTANCIA. ANEXO 8. TÉRMINOS DE REFERENCIA. ANEXO 9. PROPUESTA ECONÓMICA INTEGRAL. ANEXO 10. ACTA DE EMISIÓN DE FALLO DE ADJUDICACIÓN. ANEXO 11. PROGRAMA GENERAL DE EJECUCIÓN Y DE EROGACIONES. ANEXO 12. PROGRAMA DE AMORTIZACIÓN DEL ANTICIPO		\N	\N		
34	84	\N	Garantías sobre el recibimiento de anticipo	4	Fianza de anticipo	Fianza número 88256809 00000 0000, emitida el 2015-07-21 por CHUBB de México Compañía Afianzadora, S. A. de C. V., 		\N	\N		
35	84	\N	Garantías para el cumplimiento del contrato	5	Fianza de cumplimiento	Fianza número. 88256810 00000 0000, emitida el 2015-07-21 por CHUBB de México Compañía Afianzadora, S. A. de C. V.		\N	\N		
36	84	\N	Subcontratos relacionados con el contrato	6	Subcontrataciones	GACM no ha sido notificado sobre ninguna contratación		\N	\N		
37	85	\N	Contrato con la firma de las partes involucradas	1	Contrato firmado	Contrato de Servicios Relacionados a la Obra Pública a Precios Unitarios y Tiempo Determinado No. LPN-SRO-DCAGI-SC-026/15		\N	\N		
38	85	\N	Cláusulas del contrato sobre las condiciones de terminación del mismo.	2	Cláusula sobre las condiciones de entrega de la obra	Cláusula Décima Quinta del Contrato.- Entrega, Verificación y Finiquito de los servicios.		\N	\N		
39	85	\N	Anexos del contrato	3	Anexos del contrato	Anexo 1:  Suficiencia presupuestaria Anexo 2: Acta Constitutiva , representación legal e identificación oficial Anexo 3: RFC Anexo 4:Opinión de cumplimiento de oblifgaciones fiscales  Anexo 5: Manifestación bajo protesta de decir verdad de no encontrarse en los supuestos de los artículos 51 y 78 de la LOPSRM  Anexo 6:  Manifestación sobre estratificación de empresa  Anexo 7: Opinión de cumplimiento de obligaciones fiscales en materia de seguridad social Anexo 8:Términos de referencia Anexo 9: Propuesta Económica Integral Anexo 10: Programa general de ejecució y programa  de erogaciones  Anexo 11: Programa de amortización de anticipo		\N	\N		
40	85	\N	Garantías sobre el recibimiento de anticipo	4	Fianza de anticipo	Fianza número 1902639 emitida el 2015-05-09 por Afianzadora SOFIMEX, S.A. 		\N	\N		
41	85	\N	Garantías para el cumplimiento del contrato	5	Fianza de cumplimiento	Fianza número 1902652 emitida el 2015-05-09 por Afianzadora SOFIMEX, S.A. 		\N	\N		
42	85	\N	Subcontratos relacionados con el contrato	6	Subcontrataciones	GACM no ha sido notificado sobre ninguna subcontratación		\N	\N		
43	86	\N	Contrato con la firma de las partes involucradas	1	Contrato firmado	Contrato Plurianual de Obra Pública a Precios Unitarios y Tiempo Determinado número LPN-OP-DCAGI-SC-114/15		\N	\N		
44	86	\N	Cláusulas del contrato sobre las condiciones de terminación del mismo.	2	Cláusula sobre las condiciones de entrega de la obra	Cláusula Décima Séptima del Contrato.- Recepción de las obras.		\N	\N		
76	186	\N	Contrato firmado	AD-AS-DCAGI-SC-016/16	Contrato de prestación de servicios AD-AS-DCAGI-SC-016/16	Contrato firmado		\N	\N		es
78	189	\N	Contrato firmado	AD-AS-DCAGI-SC-065/15	AD-AS-DCAGI-SC-065/15	Contrato firmado		\N	\N		es
80	190	\N	Contrato firmado	AD-AS-DCAGI-SC-069/15	AD-AS-DCAGI-SC-069/15	Contrato firmado		2015-09-23 00:00:00	\N		es
45	86	\N	Anexos del contrato	3	Anexos del contrato	Anexo 1: Oficio de Suficiencia presupuestaria Anexo 2: Acta Constitutiva de Transportaciones y Construcciones Tamaulipecos, S. A. de C. V. Anexo 3: Facultades del representante legal  e identificación oficial Anexo 4: Cédula de Registro Federal de Contribuyentes  Anexo 5: Curriculum Vitae  Anexo 6: Escrito de conocimiento del sitio de los trabajos Anexo 7:  Manifestación bajo protesta de decir verdad de no encontrarse en los supuestos de los artículos 51 y 78 de la LOPSRM Anexo 8:  Opinión positiva de cumplimiento de obligaciones fiscales  Anexo 9: Opinión de cumplimiento de obligaciones fiscales en materia de seguridad social Anexo 10: Manifestación sobre estratificación de empresa Anexo 11: Acta Constitutiva de Inmobiliarios Mexicanos, S. A. de C. V.  Anexo 12: Facultades del representante legal  e identificación oficial Anexo 13:  Cédula de Registro Federal de Contribuyentes  Anexo 14: Curriculum Vitae Anexo 15:  Manifestación bajo protesta de decir verdad de no encontrarse en los supuestos de los artículos 51 y 78 de la LOPSRM Anexo 16: Opinión positiva de cumplimiento de obligaciones fiscales Anexo 17: Opinión de cumplimiento de obligaciones fiscales en materia de seguridad social Anexo 18: Manifestación sobre estratificación de empresa  Anexo 19: Convenio de participación conjunta para la ejecución de la obra Anexo 20: Propuesta Técnica Anexo 21: Especificaciones generales y particulares Anexo 22: Programa general de ejecución conforme al catálogo de conceptos Anexo 23: Catálogo de conceptos Anexo 24: Propuesta Económica Anexo 25: Datos bancarios Anexo 26: Programa de amortización de anticipo		\N	\N		
46	86	\N	Garantías sobre el recibimiento de anticipo	4	Fianza de anticipo	Fianza número 1682966, emitida el 2015-12-31 por por ACE Fianzas Monterrey, S. A., 		\N	\N		
47	86	\N	Garantías para el cumplimiento del contrato	5	Fianza de cumplimiento	Fianza número 1681227, emitida emitida el 2015-12-31 por ACE Fianzas Monterrey, S. A.		\N	\N		
48	86	\N	Subcontratos relacionados con el contrato	6	Subcontrataciones	GACM no ha sido notificado sobre ninguna subcontratación		\N	\N		
49	35	\N	Contrato firmado	AD-SRO-DCAGI-SC-010/15	Contrato de prestación de servicios relacionados a la Obra Pública AD-SRO-DCAGI-SC-010/15	Contrato firmado		\N	\N		es
50	36	\N	Contrato firmado	AD-SRO-DCAGI-SC-011/15	Contrato de Prestación de Servicios Relacionados con la Obra Pública por Precios Unitarios y a Tiempo Determinado AD-SRO-DCAGI-SC-011/15	Contrato firmado		\N	\N		es
51	38	\N	Convenio firmado	GACM/DCI/SJ/CI/011-2015	Convenio de colaboración GACM/DCI/SJ/CI/011-2015	Convenio firmado		\N	\N		es
52	39	\N	Convenio firmado	Convenio de Colaboración para llevar a cabo los Servicios en el "Desarrollo del Proyecto Ejecutivo del sistema de Video Vigilancia de la Barda Perimtral, Del Nuevo Aeropuerto Internacional de la Ciudad de México"	Convenio de Colaboración para llevar a cabo los Servicios en el "Desarrollo del Proyecto Ejecutivo del sistema de Video Vigilancia de la Barda Perimtral, Del Nuevo Aeropuerto Internacional de la Ciudad de México"	Convenio firmado		\N	\N		es
53	40	\N	Convenio firmado	GACM/DCA/SJ/CI/016-2015	Convenio Número: GACM/DCA/SJ/CI/016-2015	Convenio firmado		\N	\N		es
54	131	\N	Contrato firmado	AD-SRO-DCAGI-SC-022/16	Contrato de servicios relacionados con obra pública AD-SRO-DCAGI-SC-022/16	Contrato firmado		\N	\N		es
55	132	\N	Contrato firmado	AD-SRO-DCAGl-SC-030/16	Contrato de Servicios Relacionados con la Obra Pública a Precios Unitarios y Tiempo Determinado AD-SRO-DCAGl-SC-030/16	Contrato firmado		\N	\N		es
56	133	\N	Contrato firmado	AD-SRO-DCAGI-SC-081/15	Contrato de Servicios Relacionados a la Obra Pública número AD-SRO-DCAGI-SC-081/15 específico de prestaciónde servicios número GACM/DCI/SJ/CM-E/05-2015	Contrato firmado		\N	\N		es
57	134	\N	Contrato firmado	CTO.ARRENDAMIENDO.ALTAVISTA02/14	Contrato de Arrendamiento No CTO.ARRENDAMIENDO.ALTAVISTA02/14	Contrato firmado		\N	\N		es
58	135	\N	Contrato firmado	CTO.ARRENDAMIENTO.T.MURANO.01/15	Contrato de Arrendamiento No CTO.ARRENDAMIENTO.T.MURANO.01/15	Contrato firmado		\N	\N		es
59	136	\N	Contrato firmado	ITP-AS-DCAGI-SC-004/16	Contrato de Prestación de Servicios Relacionados con la Obra Pública por Precios Unitarios y a Tiempo Determinado ITP-AS-DCAGI-SC-004/16	Contrato firmado		\N	\N		es
60	137	\N	Contrato firmado	ITP-AS-DCAGI-SC-017-15	Contrato No. ITP-AS-DCAGI-SC-017-15	Contrato firmado		\N	\N		es
61	138	\N	Contrato firmado	ITP-AS-DCAGI-SC-036/16	Contrato de prestación de servicios ITP-AS-DCAGI-SC-036/16	Contrato firmado		\N	\N		es
62	139	\N	Contrato firmado	ITP-AS-DCAGI-SC-036/15	Contrato abierto de prestación de servicios ITP-AS-DCAGI-SC-036/15	Contrato firmado		\N	\N		es
63	140	\N	Contrato firmado	ITP-SRO-DCAGI-SC-034/16	Contrato de servicios relacionados a la Obra Pública ITP-SRO-DCAGI-SC-034/16	Contrato firmado		\N	\N		es
64	155	\N	Contrato firmado	AD-CONV-DCAGI-SC-001/16	AD-CONV-DCAGI-SC-001/16	Contrato firmado		\N	\N		es
65	156	\N	Contrato firmado	AD-AS-DCAGI-SC-110/15	Contrato Abierto de Prestación del "Servicio de Testigo Social para que Atestigüe la Etapas del Procedimiento de la Licitación Pública Nacional de Obra Pública de Carga, Acarreo y Descarga Dentro y Fuera del Polígono del Material Existente, Producto de Depósitos de Demoliciones y Desazolve, Incluye Conformación del Terreno donde se Construirá el Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM) para el NAICM". AD-AS-DCAGI-SC-110/15	Contrato firmado		\N	\N		
66	157	\N	Contrato firmado	AD-AS-DCAGI-SC-116/15	Contrato de Prestación de Servicios Relacionados con la Obra Pública por Precios Unitarios y a Tiempo Determinado AD-AS-DCAGI-SC-116/15	Contrato firmado		\N	\N		es
67	158	\N	Contrato firmado	AD-AS-DCAGI-SC-119/15	Contrato de Prestación de Servicios Relacionados con la Obra Pública por Precios Unitarios y a Tiempo Determinado AD-AS-DCAGI-SC-119/15	Contrato firmado		\N	\N		es
68	159	\N	Contrato firmado	AD-OP-DCAGI-SC-024/16	AD-OP-DCAGI-SC-024/16	Contrato firmado		\N	\N		es
69	161	\N	Contrato firmado	AD-OP-DCAGI-SC-008/15	Contrato de Prestación de Servicios Relacionados con la Obra Pública por Precios Unitarios y a Tiempo Determinado AD-OP-DCAGI-SC-008/15	Contrato firmado		\N	\N		es
70	162	\N	Contrato firmado	AD-S-DCAGI-SC-013/2014	Contrato Específico No. AD-S-DCAGI-SC-013/2014	Contrato firmado		\N	\N		es
71	163	\N	Contrato firmado	AD-S-DCAGI-SC-017/16	Contrato No AD-S-DCAGI-SC-017/16	Contrato firmado		\N	\N		es
72	164	\N	Contrato firmado	AD-SRO-CONV-DCAGI-SC-04/16	AD-SRO-CONV-DCAGI-SC-04/16	Contrato firmado		\N	\N		es
73	183	\N	Contrato firmado	AD-AS-DCAGI-SC-011/15	Contrato de Prestación de Servicios Relacionados con la Obra Pública por Precios Unitarios y a Tiempo Determinado AD-AS-DCAGI-SC-011/15	Contrato firmado		\N	\N		es
74	184	\N	Contrato firmado	AD-AS-DCAGI-SC-013/16	Contrato de Prestación Servicios Reglamento Ley Adquisiciones Arrendamiento y Servicios del Sector Público AD-AS-DCAGI-SC-013/16	Contrato firmado		\N	\N		es
\.


--
-- Name: contractdocuments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('contractdocuments_id_seq', 80, true);


--
-- Data for Name: contractingprocess; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY contractingprocess (id, ocid, fecha_creacion, hora_creacion) FROM stdin;
220	GACM_PISTA3	2016-07-18	10:21:07.965627
219	GACM_PISTA2	2016-07-18	10:21:02.852422
218	GACM_Edificio_Terminal	2016-07-18	10:20:10.880473
200	AD-AS-DCAGI-SC-057/15	2016-07-17	20:11:35.387287
201	AD-SRO-DCAGI-SC-021-15	2016-07-17	20:11:37.300454
202	AD-SRO-DCAGI-SC-089/15	2016-07-17	20:11:38.986317
19	AD-AS-DCAGI-SC-121/15	2016-07-15	12:45:30.917792
22	AD-SRO-CONV-DCAGI-SC-002/16	2016-07-15	12:45:49.845957
23	AD-SRO-CONV-DCAGI-SC-04/16	2016-07-15	12:45:51.141064
71	GACM/DCI/SJ/CI/001-2015	2016-07-15	13:23:19.353123
61	ITP-SRO-DCAGI-SC-049/2015	2016-07-15	12:47:04.935183
2	AD-AS-DCAGI-SC-050-2015	2016-07-15	12:45:02.461858
73	GACM/DCI/SJ/CI/02-2014	2016-07-15	13:38:08.813878
24	AD-SRO-CONV-DCAGI-SC-006/16	2016-07-15	12:45:53.29262
182	E0A1VWO	2016-07-16	09:42:02.508596
25	AD-SRO-DCAGI-SC-001/15	2016-07-15	12:45:55.4532
20	AD-S-DCAGI-SC-016/2014	2016-07-15	12:45:32.940518
16	AD-SRO-DCAGI-SC-098/15	2016-07-15	12:45:25.661747
74	GACM/DCI/SJ/CI/03-2014	2016-07-15	13:50:46.531092
26	AD-SRO-DCAGI-SC-002/16	2016-07-15	12:45:56.860718
27	AD-SRO-DCAGI-SC-002/2015	2016-07-15	12:45:59.124896
55	AD-AS-DCAGI-SC-053/15	2016-07-15	12:46:50.710612
75	GACM/DCI/SJ/CI/04-2014	2016-07-15	14:01:20.091646
81	LPN-OP-DCAGI-SC-115/15	2016-07-15	15:46:35.560295
82	LPN-SRO-DCAGI-SC-043/15	2016-07-15	15:56:45.356319
83	LPN-SRO-DCAGI-SC-042/15	2016-07-15	15:56:47.16826
84	LPN-SRO-DCAGI-SC-041/15	2016-07-15	15:56:50.163156
85	LPN-SRO-DCAGI-SC-026/15	2016-07-15	15:56:52.075169
86	LPN-OP-DCAGI-SC-114/15	2016-07-15	15:56:54.123315
87	LPN-OP-DCAGI-SC-076/15	2016-07-15	15:56:55.787421
88	LPN-O-DCAGI-SC-014/2014	2016-07-15	15:56:57.603277
89	LPN-OP-DCAGI-SC-066/15	2016-07-15	15:57:36.866808
90	LPN-O-DCAGI-SC-024/15	2016-07-15	15:57:38.178831
91	LPN-AS-DACGI-SC-033/16	2016-07-15	15:57:39.546721
92	LPI-SRO-DCAGI-SC-030/15	2016-07-15	15:57:40.810214
93	LPI-OP-DCAGI-CS-079-15	2016-07-15	15:57:42.05138
94	ITP-SRO-DCAGI-SC-082/15	2016-07-15	15:57:43.962494
95	ITP-SRO.DCAGI-SC-63/15	2016-07-15	15:57:45.643211
96	ITP-SRO-DCAGI-SC-048/15	2016-07-15	15:57:47.146616
97	ITP-SRO-DCAGI-SC-045/15	2016-07-15	15:57:48.763256
98	ITP-SRO-DCAGI-SC-044/15	2016-07-15	15:57:50.468335
99	ITP-SRO-DCAGI-SC-037/15	2016-07-15	15:57:53.524031
100	ITP-SRO-DCAGI-SC-027/15	2016-07-15	15:57:55.083309
48	ITP-OP-DCAGI-SC-014/15	2016-07-15	12:46:37.645967
203	GACM/DCI/SJ/CM-E/001-2016	2016-07-17	20:18:02.66401
204	GACM/DG/DCAGI/SJ/CI/010/15	2016-07-17	20:18:03.892373
205	AD-AS-DCAGI-SC-035-16	2016-07-17	20:18:04.87475
198	104-014-CUNA01-3S	2016-07-16	14:08:45.558056
199	AS-AS-DCAGI-SC-55/15	2016-07-16	20:08:26.648476
207	ITP-S-DCAGI-SC-004/2014	2016-07-17	20:18:06.610328
206	ITP-OP-DCAGI-SC-012/16	2016-07-17	20:18:05.645915
49	ITP-SR-DCAGI-SC-015-2015	2016-07-15	12:46:39.221696
54	AD-AS-DCAGI-SC-029/2015	2016-07-15	12:46:48.974974
50	ITP-SRO-DCAGI-SC-040/15	2016-07-15	12:46:41.516907
41	GACM/DCI/SJ/CI/007-2015	2016-07-15	12:46:25.240137
42	GACM/DCI/SJ/CM-E/03-2015	2016-07-15	12:46:26.900669
43	GACM/DCI/SJ/CM-E/05-2015	2016-07-15	12:46:29.028766
47	GACM/DG/DCAGI/SJ-1044/2015	2016-07-15	12:46:36.284647
59	ITP-AS-DCAGI-SC-058/15	2016-07-15	12:47:00.309419
115	AD-AS-DCAGI-SC-052/15	2016-07-15	16:59:31.503627
116	AD-AS-DCAGI-SC-074/15	2016-07-15	16:59:33.288226
121	AD-AS-DCAGI-SC-106-15	2016-07-15	16:59:48.672632
4	AD-SRO-DCAGI-SC-010/16	2016-07-15	12:45:05.094307
5	AD-AS-DCAGI-SC-073/15	2016-07-15	12:45:07.196849
7	AD-SRO-DCAGI-SC-087/15	2016-07-15	12:45:10.341997
9	AD-SRO-DCAGI-SC-090/15	2016-07-15	12:45:14.302237
10	AD-SRO-DCAGI-SC-091/15	2016-07-15	12:45:16.253018
12	AD-SRO-DCAGI-SC-094/15	2016-07-15	12:45:19.516921
14	AD-SRO-DCAGI-SC-096/15	2016-07-15	12:45:22.694056
1	AD-AS-DCAGI-SC-031/15	2016-07-15	12:45:00.121702
64	LPI-SRO-DCAGI-SC-030-15	2016-07-15	12:47:10.525202
62	ITP-SRO-DCAGI-SC-037/15	2016-07-15	12:47:06.383237
46	GACM/DCPEV/SJ/CG-E/06-2015	2016-07-15	12:46:34.389018
173	GACM/DCI/SJ/CI/008/2015	2016-07-15	19:42:42.479772
44	GACM/DCI/SJ/CM-E/017-2015	2016-07-15	12:46:30.893993
72	GACM/DCI/SJ/CI/012-2015	2016-07-15	13:34:37.50145
45	GACM/DCPEV/SJ/CG/02-2015	2016-07-15	12:46:32.686266
165	AD-SRO-DCAGI-SC-012/15	2016-07-15	19:42:26.31763
166	AD-SRO-DCAGI-SC-013/15	2016-07-15	19:42:27.478479
167	AD-SRO-DCAGI-SC-019/16	2016-07-15	19:42:29.295844
168	AD-SRO-DCAGI-SC-026-16	2016-07-15	19:42:31.037829
169	AD-SRO-DCAGI-SC-031-16	2016-07-15	19:42:33.669493
171	AD-SRO-DCAGI-SC-103/15	2016-07-15	19:42:38.622103
172	AD-SRO-DCAGI-SC-104/15	2016-07-15	19:42:40.215031
144	LPN-SRO-DCAGI-SC-028-2016	2016-07-15	19:41:48.894074
111	9-989-GAC9806011J4-05-03-2015	2016-07-15	16:59:24.574017
128	AD-SRO-DCAGI-SC-003/16	2016-07-15	17:00:01.921494
153	AD-AS-DCAGI-SC-068/15	2016-07-15	19:42:04.82317
170	AD-SRO-DCAGI-SC-039/15	2016-07-15	19:42:36.574439
175	AD-AS-DCAGI-SC-074/15	2016-07-15	22:17:11.133575
3	AD-AS-DCAGI-SC-008/16	2016-07-15	12:45:03.869167
6	AD-SRO-DCAGI-SC-85/15	2016-07-15	12:45:08.532721
8	AD-SRO-DCAGI-SC-088/15	2016-07-15	12:45:11.80601
11	AD-SRO-DCAGI-SC-093/15	2016-07-15	12:45:18.005016
13	AD-SRO-DCAGI-SC-095/15	2016-07-15	12:45:21.32555
15	AD-SRO-DCAGI-SC-097/15	2016-07-15	12:45:24.084765
208	AD-AS-DCAGI-SC-022/15	2016-07-17	20:43:25.766891
209	AD-SRO-DCAGI-SC-086/15	2016-07-17	20:43:31.818663
210	CTO.ARRENDAMIENTO.T.MURANO.01/14	2016-07-17	20:43:33.069173
211	DTC-026/2013	2016-07-17	20:43:34.438488
212	GACM/DCI/SJ/CC-015-15	2016-07-17	20:43:37.188889
221	GACM/DG/DCAGI/SJ/CI/01-2014	2016-07-22	17:45:31.275277
51	AD-AS-DCAGI-SC-001/16	2016-07-15	12:46:42.716691
122	AD-AS-DCAGI-SC-109/15	2016-07-15	16:59:49.55885
124	AD-DCAGI-SA-GAR-007/15	2016-07-15	16:59:54.324795
125	AD.DIR/01/SJ/2014	2016-07-15	16:59:56.912087
127	AD-AS-DCAGI-SC-012/2014	2016-07-15	17:00:00.343948
129	AD-SRO-DCAGI-SC-019/15	2016-07-15	17:00:03.825002
56	AD-AS-DCAGI-SC-54/15	2016-07-15	12:46:52.053252
58	AD-AS-DCAGI-SC-072-15	2016-07-15	12:46:58.693611
35	AD-SRO-DCAGI-SC-010/15	2016-07-15	12:46:13.638554
39	GACM/DCI/SJ/CI/05-2014	2016-07-15	12:46:21.886456
131	AD-SRO-DCAGI-SC-022/16	2016-07-15	17:02:05.169137
132	AD-SRO-DCAGI-SC-030-16	2016-07-15	17:02:06.49846
135	CTO.ARRENDAMIENTO.T.MURANO.01/15	2016-07-15	17:02:10.767469
136	ITP-AS-DCAGI-SC-004/16	2016-07-15	17:02:11.913044
142	ITP-SRO-DCAGI-SC-080/15	2016-07-15	19:41:42.462057
140	ITP-SRO-DCAGI-SC-034/16	2016-07-15	17:02:18.78431
143	ITP-SRO-DCAGI-SC-107/15	2016-07-15	19:41:43.918434
70	LPN-SRO-DCAGI-SC-042/15	2016-07-15	12:47:26.205045
141	ITP-OP-DCAGl-SC-105-15	2016-07-15	19:41:36.87771
52	AD-AS-DCAGI-SC-006/16	2016-07-15	12:46:45.446712
123	AD-AS-DCAGI-SC-113/15	2016-07-15	16:59:52.096254
126	AD-S-DCAGI-SC-010/2014	2016-07-15	16:59:58.791804
53	AD-AS-DCAGI-SC-019-BIS/2015	2016-07-15	12:46:47.701866
130	AD-SRO-DCAGI-SC-021/16	2016-07-15	17:00:05.578665
146	AD-AS-DCAGI-SC-007/16	2016-07-15	19:41:56.072566
147	AD-AS-DCAGI-SC-014-16	2016-07-15	19:41:57.040217
148	AD-AS-DCAGI-SC-029-16	2016-07-15	19:41:58.03794
149	AD-AS-DCAGI-SC-038/15	2016-07-15	19:41:59.943435
150	AD-AS-DCAGI-SC-046/15	2016-07-15	19:42:01.056081
151	AD-AS-DCAGI-SC-056/16	2016-07-15	19:42:02.391629
152	AD-AS-DCAGI-SC-62/15	2016-07-15	19:42:03.684614
154	AD-AS-DCAGI-SC-84/15	2016-07-15	19:42:06.021975
176	AD-DCAGI-SA-GAR-01/14	2016-07-16	09:40:11.62071
177	AD-DCAGI-SA-GAR-02/15	2016-07-16	09:40:17.572015
57	AD-AS-DCAGI-SC-070/2015	2016-07-15	12:46:53.76587
178	AD-DCAGI-SA-GAR-0005/15	2016-07-16	09:40:20.691252
179	AD-DCAGI-SA-GAR-0006/15	2016-07-16	09:40:22.345535
180	AD-DCAGI-SA-GAR-01/15	2016-07-16	09:40:24.825323
181	AD-OP-DCAGI-SC-064/15	2016-07-16	09:40:26.57557
60	ITP-AS-DCAGI-SC-060/15	2016-07-15	12:47:01.969182
191	GACM-DCI-SJ-CM-E-02-14	2016-07-16	09:42:23.953995
36	AD-SRO-DCAGI-SC-011/15	2016-07-15	12:46:15.013398
101	ITP-SRO-DCAGI-SC-018/16	2016-07-15	15:57:57.019827
21	AD-S-DCAGI-SC-017/2014	2016-07-15	12:45:47.213846
77	GACM/DCI/CJ/SJ/014-2015	2016-07-15	15:34:23.265841
76	GACM/DCI/SJ/CI/013-2015	2016-07-15	15:34:21.455478
17	AD-SRO-DCAGI-SC-099/15	2016-07-15	12:45:27.301242
18	AD-SRO-DCAGI-SC-100/15	2016-07-15	12:45:29.294093
78	GACM/DCI/SJ/CM/01-2014	2016-07-15	15:34:24.681449
102	ITP-SRO-DCAGI-SC-016/15	2016-07-15	15:57:58.291692
103	ITP-SRO-DCAGI-SC-015-16	2016-07-15	15:57:59.41174
104	ITP-S-DCAGI-SC-009/2014	2016-07-15	15:58:00.699547
105	ITP-S-DCAGI-SC-008/2014	2016-07-15	15:58:01.902314
145	AD/01CTO.MTO./2014	2016-07-15	19:41:55.04548
106	ITP-S-DCAGI-SC-004-2014	2016-07-15	15:58:05.100304
107	ITP-S-DCAGI-SC-002-2014	2016-07-15	15:58:06.772029
108	ITP-OP-DCAGI-SC-012-16	2016-07-15	15:58:08.323147
28	AD-SRO-DCAGI-SC-003/15	2016-07-15	12:46:00.719071
69	LPN-SRO-DCAGI-SC-041/15	2016-07-15	12:47:23.725051
29	AD-SRO-DCAGI-SC-004/15	2016-07-15	12:46:03.638289
63	ITP-SRO-DCAGI-SC-048/15	2016-07-15	12:47:08.135482
30	AD-SRO-DCAGI-SC-005/15	2016-07-15	12:46:05.271177
31	AD-SRO-DCAGI-SC-006/15	2016-07-15	12:46:06.581081
32	AD-SRO-DCAGI-SC-007/15	2016-07-15	12:46:07.996628
33	AD-SRO-DCAGI-SC-008/15	2016-07-15	12:46:09.7811
112	AD-A-DCAGI-SC-001/2014	2016-07-15	16:59:26.173783
34	AD-SRO-DCAGI-SC-009/15	2016-07-15	12:46:11.671288
113	AD-AS-DCAGI-SC-047/15	2016-07-15	16:59:27.983232
114	AD-AS-DSAGI-SC-51/2015	2016-07-15	16:59:29.879503
65	LPN-SRO-DCAGI-SC-009/2016	2016-07-15	12:47:12.652952
66	LPN-SRO-DCAGI-SC-025/15	2016-07-15	12:47:14.566125
117	AD-AS-DCAGI-SC-075/15	2016-07-15	16:59:34.615854
118	AD-AS-DCAGI-SC-78/15	2016-07-15	16:59:36.088779
67	LPN-SRO-DCAGI-SC-026/15	2016-07-15	12:47:19.172941
119	AD-AS-DCAGI-SC-83/15	2016-07-15	16:59:37.328086
120	AD-AS-DCAGI-SC--102/15	2016-07-15	16:59:47.447801
68	LPN-SRO-DCAGI-SC-043/15	2016-07-15	12:47:21.237841
161	AD-OP-DCAGI-SC-108/15	2016-07-15	19:42:20.069529
193	SEC-/03/2014	2016-07-16	09:42:28.960228
162	AD-S-DCAGI-SC-013/14	2016-07-15	19:42:21.86241
195	AD-DCAGI-SA-GAR-01/14	2016-07-16	09:53:42.894832
190	AD-AS-DCAGI-SC-069/15	2016-07-16	09:42:21.069277
196	LPN-AD-DCAGI-SC-027/16	2016-07-16	09:53:45.564108
197	LPN-OP-DCAGI-SC-112/15	2016-07-16	09:53:47.856196
163	AD-S-DCAGI-SC-017/16	2016-07-15	19:42:23.359418
38	GACM/DCI/SJ/CI/011-2015	2016-07-15	12:46:19.413166
40	GACM/DCA/SJ/CI/016-2015	2016-07-15	12:46:23.4376
133	AD-SRO-DCAGI-SC-081/15	2016-07-15	17:02:07.768755
134	CTO.ARRENDAMIENTO.ALTAVISTA02/14	2016-07-15	17:02:09.231447
137	ITP-AS-DCAGI-SC-017-15	2016-07-15	17:02:13.361505
138	ITP-AS-DCAGI-SC-020/16	2016-07-15	17:02:14.751818
139	ITP-AS-DCAGI-SC-036/15	2016-07-15	17:02:16.416251
174	SPF/01/2014-2017	2016-07-15	19:42:45.327419
155	AD-CONV-DCAGI-SC-001/16	2016-07-15	19:42:07.911436
156	AD-AS-DCAGI-SC-110/15	2016-07-15	19:42:09.510492
157	AD-AS-DCAGI-SC-116/15	2016-07-15	19:42:11.480205
158	AD-AS-DCAGI-SC-119/15	2016-07-15	19:42:14.192358
159	AD-OP-DCAGI-SC-024/16	2016-07-15	19:42:16.732664
160	AD-OP-DCAGI-SC-025/16	2016-07-15	19:42:18.564953
164	AD-SRO-CONV-DCAGI-SC-03/16	2016-07-15	19:42:24.96045
183	AD-AS-DCAGI-SC-011/16	2016-07-16	09:42:04.559219
184	AD-AS-DCAGI-SC-013/16	2016-07-16	09:42:06.711578
185	AD-AS-DCAGI-SC-014-16	2016-07-16	09:42:09.724664
186	AD-AS-DCAGI-SC-016-16	2016-07-16	09:42:12.333491
187	AD-AS-DCAGI-SC-018/15	2016-07-16	09:42:14.378665
188	SA-009KDH999-N39-2015	2016-07-16	09:42:16.757863
189	AD-AS-DCAGI-SC-065/15	2016-07-16	09:42:18.814725
109	LPN-SRO-DCAGI-SC-117/15	2016-07-15	15:58:10.411057
110	LPN-SRO-DCAGI-SC-118/15	2016-07-15	15:58:12.674694
213	AD-AS-DCAGI-SC-046/15	2016-07-17	21:22:07.689417
215	AD-DCAGI-SA-GAR-02/15	2016-07-17	21:22:11.456149
216	AD.DIR/01/SJ/2014	2016-07-17	21:22:14.058161
217	GACM/DCI/SJ/CM/18-2015	2016-07-17	21:22:16.941821
214	AD-AS-DCAGI-SC-013/16	2016-07-17	21:22:10.265649
79	GACM/DCI/SJ/CM/18-2015	2016-07-15	15:34:26.305683
80	GACM/DCI/SJ/CM-018-2015	2016-07-15	15:34:30.5687
194	ITP-AS-DCAGI-SC-005-16	2016-07-16	09:42:31.283073
192	GACM-SEC/01/2014	2016-07-16	09:42:26.851841
222	ITP-AS-DCAGI-SC-007/14	2016-07-22	18:30:58.800274
37	CTO.FIDEICOMISO-01-14	2016-07-15	12:46:17.54207
\.


--
-- Name: contractingprocess_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('contractingprocess_id_seq', 222, true);


--
-- Data for Name: contractitem; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY contractitem (id, contractingprocess_id, contract_id, itemid, description, classification_scheme, classification_id, classification_description, classification_uri, quantity, unit_name, unit_value_amount, unit_value_currency) FROM stdin;
2	21	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con la obra		\N	Servicio	0	
3	61	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
4	1	\N	1	Servicio					\N	Servicio	0	
5	2	\N	1	Servicio					\N	Servicio	0	
6	62	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Proyecto ejecutivo	0	
7	3	\N	62501001	Construccion de Aeropistas					\N	Obra Pública	0	
8	25	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
9	4	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista	Servicios relacionados con Obra Pública				\N	Servicio	0	
10	26	\N	62903001	Supervisión de Obras			Servicios relacionados con Obra Pública		\N	Supervisión	0	
11	5	\N	33104	Asesorias para la operacion de programas					\N	Servicio	0	
12	6	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
13	27	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
14	7	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
15	8	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
16	9	\N	1	NO SE LOCALIZA EN EL LISTADO PROPORCIONADO	Servicios relacionados con Obra Pública				\N	Servicio	0	
17	10	\N	1	NO SE LOCALIZA EN EL LISTADO PROPORCIONADO 	Servicios relacionados con Obra Pública				\N	Servicio	0	
18	11	\N	1	NO SE LOCALIZA EN EL LISTADO PROPORCIONADO 	Servicios relacionados con Obra Pública				\N	Servicio	0	
19	28	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio  	0	
20	12	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
21	13	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
22	29	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
23	63	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
24	14	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
25	15	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
26	16	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
27	17	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
28	18	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
29	64	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Obra	0	
30	30	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
31	19	\N	62501001	Estudios de preinversión y/o preparación del proyecto para aeropista	Servicios relacionados con Obra Pública				\N	Estudio	0	
32	20	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
33	31	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
34	32	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
35	112	\N	32503	Servicios de Arrendamiento de Vehiculos terrestres para servicios administrativos		3200			\N	Servicio	0	
36	33	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
37	113	\N	37104 y 37106	Servicios de pasajes aéreos nacionales y Servicios de pasajes aéreos internacionales		37101			\N	Servicio	0	
38	34	\N	62501001	Construcción de aeropistas			Servicios relacionados con Obra Pública		\N	Servicios relacionados con Obra Pública	0	
39	114	\N	32301	Servicios de Arrendamiento de Equipos y Bienes Informaticos		32301			\N	Servicio	0	
40	65	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Obra Pública		\N	Estudio	0	
41	115	\N	1	 					\N		0	
42	116	\N	31701	Servicios de conducciones de señales analogicas y digitales.		31701			\N	Servicio	0	
43	66	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con la obra pública		\N	Estudio	0	
44	117	\N	625010011	 	Servicios relacionados con Obra Pública				\N	Servicio	0	
45	118	\N	1	 					\N		0	
46	43	\N	62501008	Estudios de preinersión y/o preparación del proyecto para aeropista			Estudios de preinersión y/o preparación del proyecto para aeropista		\N	Obra pública	157168157.92	MXN
47	67	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
49	119	\N	1	 					\N	Servicio	0	
50	120	\N	62905	Servicios Especializados en el suministro de personal técnico y administrativo para proyectos de infraestructura aeroportuaria	6290 "Otros servicios relacionados con la Obra Pública"				\N	Servicio	0	
51	68	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
52	69	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
53	70	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
54	121	\N	35801	 					\N	Servicio	0	
55	49	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Proyecto Ejecutivo	1079335930.23	MXN
56	81	\N	1	Clave que identifica el item en el contrato.	Clave CUCOP del bien o servicio adjudicado	62501001			\N		0	
57	81	\N	2	Descripción de las características de cada item en el contrato.	Descripción específica de la clave CUCOP del bien o servicio adjudicado	2	Construcción de Aeropistas		\N		0	
58	81	\N	3	Hace referencia a una categoría a la que pertenece el item y que permite identificarlo o agruparlo dentro de en un universo de items.	Obra pública	3	Tipo de la clave CUCOP del bien o servicio adjudicado		\N		0	
59	81	\N	4	Otras formas utilizadas para clasificar el item.	Clave en el Catálogo de Bienes Muebles (CABM) – Opcional	4	No aplica		\N		0	
60	81	\N	5	Otras formas utilizadas para clasificar el item.	Clave en el Catálogo de Bienes Muebles (CABM) – Opcional	5	No aplica		\N		0	
61	81	\N	6	Unidad de medida en la que se especifica la cantidad de items a adquirir.	Obra	6	Unidad del bien o servicio adjudicado		\N		0	
62	52	\N	62501001	Construccion de Aeropistas			Obra pública		\N	Servicio	0	
63	122	\N	1	 Contratación de  Servicios Profesionales  para fungir como enlace  y vocería en el ámbito  nacional e internacional y con actores claves que aseguren la ejecución del  proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México					\N	Servicio	0	
64	83	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista	Servicios relacionados con Obra Pública				\N	Estudio	0	
65	123	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
66	124	\N	1	 					\N		0	
67	125	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista	Servicios relacionados con Obra Pública				\N	Estudio	0	
68	54	\N	62501001	Construcción de Aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
69	127	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista	Servicios relacionados con Obra Pública				\N	Estudio	0	
70	84	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista	Servicios relacionados con Obra Pública				\N	Estudio	0	
71	128	\N	62903001	Supervisión de Obras	Servicios relacionados con Obra Pública				\N	Supervisión  	0	
72	129	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
73	130	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
74	85	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista	Servicios relacionados con Obra Pública				\N	Estudio	0	
75	145	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista	Servicios relacionados con Obra Pública				\N	Proyecto Ejecutivo 	0	
76	86	\N	62501001	Construcción de Aeropistas	Obra pública				\N	Obra	0	
77	147	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista	Servicios relacionados con Obra Pública				\N	Estudio	0	
78	150	\N	32301	Servicio de Arrendamiento de Equipos y Bienes Informáticos		32301			\N	Equipo de Computo Personal de Escritorio Pieza	0	
79	150	\N	32301	Servicio de Arrendamiento de Equipos y Bienes Informáticos		32301			\N	Equipo de Computo Personal de Diseño Portátil o de Escritorio para Estación de Trabajo Pieza.	0	
80	150	\N	32301	Servicio de Arrendamiento de Equipos y Bienes Informáticos		32301			\N	Equipo de Computo Portátil (Tableta) Pieza.	0	
81	150	\N	32301	Servicio de Arrendamiento de Equipos y Bienes Informáticos		32301			\N	Servicio de Software de Antivirus Servicio.	0	
82	153	\N	31701	Servicios de conducciones de señales analógicas y digitales.		31701			\N	Servicio	0	
83	154	\N	1	Obra pública					\N	Obra Pública	0	
84	176	\N	31701	Configuración inicial de los equipos instalados en el inmueble de Altavista que dan servicio de Red Local, Seguridad de Datos y Telefonía.		31701			\N	Servicio	0	
85	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Switch core	0	
86	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Switch ACC1	0	
87	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Switch ACC2	0	
88	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Switch ACC3	0	
89	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Access Point PA	0	
90	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Access Point PB	0	
91	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Access Point SJ	0	
92	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Access Point VIP	0	
93	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	CUCM	0	
94	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Unity Conecction	0	
95	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Voice Gateway	0	
96	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Internet Gateway	0	
97	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	GACMAD	0	
98	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Juniper FW	0	
99	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Telefono IP Cisco Modelo 7021	0	
143	159	\N	62501001	Construcción de Aeropistas			Obra Publica		\N	Obra	0	
100	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Telefono IP Cisco Modelo 7031	0	
101	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Telefono IP Cisco Modelo 7038	0	
102	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Telefono IP Cisco Modelo 7911	0	
103	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Telefono IP Cisco Modelo 7937	0	
104	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Telefono IP Cisco Modelo 7941	0	
105	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Telefono IP Cisco Modelo 7965	0	
106	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Telefono IP Cisco Modelo 7975	0	
107	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Telefono IP Cisco Modelo 7942	0	
108	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Telefono IP Cisco Modelo 7962	0	
109	57	\N	33104	Asesorias para la operacion de programas			Servicios		\N	Servicio	0	
110	178	\N	32201	Servicio de Arrendamiento de equipos de Bienes Informáticos 	Arrendamiento - Servicios Generales				\N	Desk Top  	0	
111	178	\N	32201	Servicio de Arrendamiento de equipos de Bienes Informáticos 	Arrendamiento - Servicios Generales				\N	Laptops	0	
112	179	\N	32201	Servicio de Arrendamiento de equipos de Bienes Informáticos 	Arrendamiento - Servicios Generales				\N	Impresión personal a color	0	
113	179	\N	32201	Servicio de Arrendamiento de equipos de Bienes Informáticos 	Arrendamiento - Servicios Generales				\N	Multifuncional monocromático  	0	
114	179	\N	32201	Servicio de Arrendamiento de equipos de Bienes Informáticos 	Arrendamiento - Servicios Generales				\N	Aparatos Telefónicos Digitales IP 	0	
115	179	\N	32201	Servicio de Arrendamiento de equipos de Bienes Informáticos 	Arrendamiento - Servicios Generales				\N	Equipos de Red (Switches) 	0	
116	180	\N	31701	Servicio de contratación de servicios de conducción de señales analógicas y digitales 	Servicios - Servicios Generales				\N	enlace principal de internet con un ancho de banda de 100MB	0	
117	180	\N	31701	Servicio de contratación de servicios de conducción de señales analógicas y digitales 	Servicios - Servicios Generales				\N	enlace Secundario de 10MB 	0	
118	180	\N	31701	Servicio de contratación de servicios de conducción de señales analógicas y digitales 	Servicios - Servicios Generales				\N	Toncales Digitales con 100 DID's	0	
119	181	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
120	191	\N	62501008	Estudios de preinersión y/o preparación del proyecto para aeropista			Obra pública		\N	Obra	0	
121	35	\N	62501001	Construcción de aeropistas			Servicios relacionados con Obra Pública		\N	Servicios relacionados con Obra Pública	0	
122	36	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
123	193	\N	33104	Instrumentación del Manual de Integración y Funcionamiento del Subcomité de Revisión de Convocatorias Del Grupo Aeroportuario de La Ciudad de México, S.A. de C.V. en Materia de Adquisiciones Arrendamientos y Servicios					\N	Servicio	0	
124	195	\N	31701	Configuración inicial de los equipos instalados en el inmueble de Altavista que dan servicio de Red Local, Seguridad de Datos y Telefonía.			Configuración inicial de los equipos instalados en el inmueble de Altavista que dan servicio de Red Local, Seguridad de Datos y Telefonía.		\N	Servicio	0	
125	197	\N	62501001	Construcción de Aeropistas			Obra pública		\N	Obra	0	
126	165	\N	62501001	Construcción de aeropistas			Servicios relacionados con Obra Pública		\N		550000	
127	166	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	465000	MXN
128	38	\N	62501001	Construcción de aeropistas			Servicios relacionados con obra		\N	Obra	0	
129	131	\N	62501001	Construcción de Aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
130	168	\N	62903001	Supervisón de Obras			Supervisón de Obras		\N	Servicio	7512904.17	
131	132	\N	62501001	Construcción de Aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
132	133	\N	62501001	Construcción de Aeropistas			Servicios relacionados con Obra Pública		\N	Servicios	0	
133	141	\N	72501001	Construcción de aeropistas			Obra Pública		\N	Obra	0	
134	136	\N	62501001	Construcción de Aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
135	137	\N	33301	Servicio integral de administración de personal y proceso de nomina, mediante un sistema especializado para recursos humanos y de nómina de gobierno			Servicio integral de administración de personal y proceso de nomina, mediante un sistema especializado para recursos humanos y de nómina de gobierno		\N	Servicio	0	
136	142	\N	62501001	Construcción de aeropistas 			Servicios relacionados con Obra Pública		\N	Servicios relacionados con Obra Pública	0	
137	140	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Sevicios relacionados con Obra Pública	0	
138	143	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista	Servicios relacionados con Obra Pública				\N	Proyecto ejecutivo	0	
139	156	\N	62501001	Construcción de Aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
140	171	\N	6251008	Estudios de Preinversión y/o Preparación del Proyecto para Aeropistas.			Servicios relacionados con Obra Pública		\N	Estudio	18726530.31	MXN
141	157	\N	62501001	Construcción de Aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
142	158	\N	62501001	Construcción de Aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
144	160	\N	62903001	Construcción de Aereopistas			Obras Publicas		\N	Obra	0	
146	161	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
147	162	\N	33301	Servicios de Informática			Servicios de Informática		\N	Servicio	0	
148	144	\N	62903001	Supervisión de Obras			Servicios relacionados con Obra Pública		\N	Supervisión	0	
149	183	\N	62501001	Construcción de aeropistas			Servicios relacionados con Obra Pública		\N	Servicios	0	
150	185	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
151	188	\N	1	Asesoría técnica especializada en materia de vinculación con organismos internacionales y adopción de las mejores prácticas internacionales			Asesoría técnica especializada en materia de vinculación con organismos internacionales y adopción de las mejores prácticas internacionales		\N	Servicio	0	
153	189	\N	33101	Otras Asesorias para la Operación de Programas			Otras Asesorias para la Operación de Programas		\N	Servicio	0	
154	190	\N	35801	Servicios Integrales de Infraestructura de Computo.			Servicios Integrales de Infraestructura de Computo.		\N	Servicio	0	
155	109	\N	62903001	Supervisión de Obras	Servicios relacionados con Obra Pública				\N	Supervisión  	0	
156	110	\N	62903001	Supervisión de Obras	Servicios relacionados con Obra Pública				\N	Supervisión  	0	
157	106	\N	33901	Contratación de servicios especializados en el suministro de "terceros".					\N	Servicio	0	
158	107	\N	1	 					\N	Edición	0	
159	108	\N	62501001	Construcción de Aeropistas	Obra pública				\N	Obra	0	
160	209	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
161	206	\N	62501001	Construcción de Aeropistas			Obra pública		\N	Obra	0	
162	207	\N	33901	Contratación de servicios especializados en el suministro de "terceros".					\N	Servicio	0	
163	213	\N	32301	Servicio de Arrendamiento de Equipos y Bienes Informáticos		32301			\N	Equipo de Computo Personal de Escritorio Pieza.	0	
165	213	\N	32301	Servicio de Arrendamiento de Equipos y Bienes Informáticos		32301			\N	Equipo de Computo Personal de Diseño Portátil o de Escritorio para Estación de Trabajo Pieza.	0	
166	213	\N	32301	Servicio de Arrendamiento de Equipos y Bienes Informáticos		32301			\N	Equipo de Computo Portátil (Tableta) Pieza. 	0	
167	213	\N	32301	Servicio de Arrendamiento de Equipos y Bienes Informáticos		32301			\N	Servicio de Software de Antivirus Servicio.	0	
168	213	\N	32301	Servicio de Arrendamiento de Equipos y Bienes Informáticos		32301			\N	Servicio Administrador de Unidad de Energía (UPS) Servicio. 	0	
169	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Switch core	0	
170	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Switch ACC1	0	
171	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Switch ACC2	0	
172	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Switch ACC3	0	
173	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Access Point PA	0	
174	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Access Point PB	0	
175	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Access Point SJ	0	
176	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Access Point VIP	0	
177	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	CUCM	0	
178	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Unity Conecction	0	
179	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Voice Gateway	0	
180	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Internet Gateway	0	
181	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	GACMAD	0	
182	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Juniper FW	0	
183	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Telefono IP Cisco Modelo 7021	0	
184	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Telefono IP Cisco Modelo 7031	0	
185	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Telefono IP Cisco Modelo 7038	0	
186	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Telefono IP Cisco Modelo 7911	0	
187	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Telefono IP Cisco Modelo 7937	0	
188	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Telefono IP Cisco Modelo 7941	0	
189	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Telefono IP Cisco Modelo 7965	0	
190	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Telefono IP Cisco Modelo 7975	0	
191	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Telefono IP Cisco Modelo 7942	0	
192	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia		31701			\N	Telefono IP Cisco Modelo 7962	0	
193	216	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista	Servicios relacionados con Obra Pública				\N	Estudio	0	
194	217	\N	1	 					\N	Obra Pública	0	
195	221	\N	1	 					\N	Obra Pública	0	
196	222	\N	35101	Conservación y mantenimiento menor de inmuebles					\N	Servicio	0	
\.


--
-- Name: contractitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('contractitem_id_seq', 196, true);


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
6	6	6
7	7	7
8	8	8
9	9	9
10	10	10
11	11	11
12	12	12
13	13	13
14	14	14
15	15	15
16	16	16
17	17	17
18	18	18
19	19	19
20	20	20
21	21	21
22	22	22
23	23	23
24	24	24
25	25	25
26	26	26
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
114	114	114
115	115	115
116	116	116
117	117	117
118	118	118
119	119	119
120	120	120
121	121	121
122	122	122
123	123	123
124	124	124
125	125	125
126	126	126
127	127	127
128	128	128
129	129	129
130	130	130
131	131	131
132	132	132
133	133	133
134	134	134
135	135	135
136	136	136
137	137	137
138	138	138
139	139	139
140	140	140
141	141	141
142	142	142
143	143	143
144	144	144
145	145	145
146	146	146
147	147	147
148	148	148
149	149	149
150	150	150
151	151	151
152	152	152
153	153	153
154	154	154
155	155	155
156	156	156
157	157	157
158	158	158
159	159	159
160	160	160
161	161	161
162	162	162
163	163	163
164	164	164
165	165	165
166	166	166
167	167	167
168	168	168
169	169	169
170	170	170
171	171	171
172	172	172
173	173	173
174	174	174
175	175	175
176	176	176
177	177	177
178	178	178
179	179	179
180	180	180
181	181	181
182	182	182
183	183	183
184	184	184
185	185	185
186	186	186
187	187	187
188	188	188
189	189	189
190	190	190
191	191	191
192	192	192
193	193	193
194	194	194
195	195	195
196	196	196
197	197	197
198	198	198
199	199	199
200	200	200
201	201	201
202	202	202
203	203	203
204	204	204
205	205	205
206	206	206
207	207	207
208	208	208
209	209	209
210	210	210
211	211	211
212	212	212
213	213	213
214	214	214
215	215	215
216	216	216
217	217	217
218	218	218
219	219	219
220	220	220
221	221	221
222	222	222
\.


--
-- Name: implementation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('implementation_id_seq', 222, true);


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

COPY implementationtransactions (id, contractingprocess_id, contract_id, implementation_id, transactionid, source, implementation_date, value_amount, value_currency, providerorganization_scheme, providerorganization_id, providerorganization_legalname, providerorganization_uri, receiverorganization_scheme, receiverorganization_id, receiverorganization_legalname, receiverorganization_uri, uri) FROM stdin;
1	107	\N	\N	1		2014-12-15 00:00:00	1540187.50				Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.				I.F. Cultura S.A. DE C.V.		
\.


--
-- Name: implementationtransactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('implementationtransactions_id_seq', 1, true);


--
-- Data for Name: planning; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY planning (id, contractingprocess_id, rationale) FROM stdin;
61	61	El programa de suministro de agua (SSAGUA) permitirá identficar las alternativas de fuentes de abastecimiento para los distintos usos de agua, con el fin de satisfacer las demandas del proyecto. En este Plan se establecerán las medidas para dar confiabilidad al suministro de agua, así como identificar los aspecto técnicos involucrados, las implicaciones ambientales y el análisis costo benefiio de cada alterntiva de suministro. 
56	56	
21	21	Servicio de un Testigo Social para que atestigüe en las etapas de la invitación a cuando menos tres personas, presencial, internacional bajo la cobertura de trarados de libre comercio, relativa a la contratación de los servicios relacionados con obra pública, consistentes en el desarrollo del proyecto ejecutivo de pistas, rodajes y plataformas y ayudas a la navegación y otras instalaciones del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).
71	71	
1	1	
22	22	
73	73	Justificación para la Contratación por Adjudicación Directa para la Prestación del Servicio Relativo al "Estudio para definir los Bancos de Préstamo, Bancos de Depósito y Laboratorio de Materiales, con la Unidad Profesional Interdisciplinaria en Ingeniería y Tecnologías Avanzdas del Instituto Politécnico Nacional. 
23	23	
62	62	Elaborar el Proyecto ejecutivo para la Construcción del camino perimetral y sus instalaciones complementaias en el lado norte del polígono del NAICM, que permita el aseguramiento de las instalaciones durante y después de la construcción del NAICM
2	2	
24	24	
74	74	
3	3	
25	25	Proyecto ejecutivo del drenaje pluvial temporal para la protección de la zona contra inundaciones provenientes de precipitaciones dentro del perímetro del Aeropuerto en el lago de Texcoco, durante la construcción de la primera fase del Nuevo Aeropuerto Internacional de la Ciudad de México
26	26	El objetivo es realizar el servicio de "la Supervisión" del desarrollo y ejecución del proyecto integral del campamento, consistente en: Desarrollo del Proyecto Ejecutivo tomando como base el Proyecto que entrega el GACM, el cual deberá sembrarse en el terreno específico y adecuarse, así como la construcción y el equipamiento de instalación permanente que incluye, suministro, montaje, instalación, pruebas, puesta en operación, entrega de garantías, instructivos y manuales de operación y mantenimiento de los equipos e instalaciones, así como la capacitación del personal asignado para el manejo de ls equipos del proyecto integral del campamento para el personal directivo del GACM que se entregará totalmente terminado.
4	4	
5	5	
27	27	Prestación de los servicos consistentes en la elaboración de estudios de geotécnia, topografía,  gedésia  y levantamiento de información geografica através de un vuelo con tecnología Lidar.
6	6	
75	75	
7	7	
28	28	Plan de Maestro  para  el  Proyecto
8	8	
9	9	
72	72	
10	10	
11	11	
63	63	
76	76	
12	12	
29	29	Cumplir con los términos y condicionantes planteados en el Resolutivo de Impacto Ambiental que el GACM deberá observar drante todas las etapas del Proyecto: Preparación del sitios, Consrucción y, Operación y mantenimiento. En específico, el numeral 4: Presentar a esta DGIRA, en un plazo que no deberá exceder de tres (03) meses previos al inicio de cualquier obra o actividad, el Plan de Restauración Ecológica propuesto por el promovente".
13	13	
14	14	
15	15	
16	16	
64	64	
17	17	
18	18	
77	77	
19	19	
20	20	
31	31	Cumplir con los términos y condicionantes planteados en el Resolutivo de Impacto Ambiental que el GACM deberá observar drante todas las etapas del Proyecto: Preparación del sitios, Consrucción y, Operación y mantenimiento. En específico, el numeral 7: Programa de rescate de fauna
78	78	
65	65	
79	79	
66	66	
80	80	Estalecer las bases generales a que se sujetaran GACM y la UANL así como, pactos comunes y el objeto genérico de futuros servicios de carácter científico y tecnológico u otro tipo que acuerden las mismas​
42	42	
68	68	Justificacion para la implementacion del plan de restauración ecológica para el Nuevo Aeropuerto Internacional de la Ciudad de México.
45	45	
44	44	
46	46	
70	70	
51	51	
52	52	
83	83	
53	53	
38	38	Elaborar el sistema integral de gestión para el cumplimiento ambiental bajo un enfoque ecosistemático, así como hacer opertivo el sistema, mediante la puesta en marcha de la Entidad de Supervisión ambiental para el proyecto del NAICM.
84	84	
85	85	
57	57	
58	58	Presupuesto de Egresos de la Federación  2015.
40	40	
37	37	
92	92	
93	93	
94	94	Contar con un servicio de transporte para los trabajos que conforman el programa de empleo temporal (PET), en el predio del NAICM.
96	96	
101	101	
102	102	
108	108	
110	110	
106	106	
109	109	
107	107	
30	30	El Resolutivo de Impacto Ambiental plantea una serie de términos y condicionantes que el Grupo Aeroportuario de la Ciudad de México deberá observar durante todas las etapas del Proyecto: Preparación del sitio, Construcción y, Operación y mantenimiento. En específico se planea cumplir con el numeral 8 "el promovente deberá elaborar una propuesta de Acciones de Monitoreo y Conservación de A ves durante las diferentes etapas que incluye el desarrollo del proyecto para lo cual, deberá presentar ante esta DGIRA en un plazo de tres (3) meses.
32	32	Cumplir con los términos y condicionantes planteados en el Resolutivo de Impacto Ambiental que el GACM deberá observar drante todas las etapas del Proyecto: Preparación del sitios, Consrucción y, Operación y mantenimiento. En específico, el numeral 7: Programa de rescate de flora
33	33	Grupo Aeroportuario de la Ciudad de México requiere presupuestar el costo de las acciones ambientales y la implementación de las medidas de mitigación, compensación y restauración propuestas en la MIA-R NAICM así como de cualesquiera condicionantes adicionales que le sean impuestas por las autoridades ambientales en los oficios resolutivos.
141	141	
111	111	
112	112	
113	113	
34	34	El Resolutivo de Impacto Ambiental plantea una serie de términos y condicionantes que el Grupo Aeroportuario de la Ciudad de México deberá observar durante todas las etapas del Proyecto: Preparación del sitio, Construcción y, Operación y mantenimiento.Derivado de lo anterior, el Grupo Aeroportuario de la Ciudad de México requiere presupuestar el costo de la elaboración de un Programa de monitoreo de ruido perimetral ele la poligonal del Proyecto durante sus diferentes etapas de desarrollo.
114	114	
115	115	
116	116	
117	117	
118	118	
67	67	 Exploración geotécnica complementaria para el proyecto ejecutivo del sistema de drenaje temporal del Nuevo aeropuerto Internacional de la Ciudad de México, en el Ex Lago de Texcoco, Estado de México.
43	43	Realizar los servicios consistentes en la etapa inicial de la exploración geotécnica del sitio donde se construirá la terminal del NAICM. Presentar los estudios profesionales y especializados de la acataerización dinámica dek suelo del estudio. 
119	119	
120	120	
69	69	
47	47	Para la prestación del servicio de alimentación a personal del GACM en las instalaciones indicadas. 
48	48	Construcción de Caminos de Acceso a la Zona del Edificio Terminal de la Primera Etapa, necesarios para la caracterización Geotécnica Inicial
49	49	Elaborar el proyecto ejecutivo (ingenierías) para el diseño de la parte aeronáutica (área de movimiento); pistas, calles, rodaje, plataformas, áreas para el mantenimiento de aeronaves, servico de combustibles, etc. Acompañamiento en el proceso de obra, que contenmple las caractítcas y elementos físicos para el NAICM, con base en las flotas de aeronaves.
121	121	
82	82	Realizar la restauración ecologíca para dar cumplimientoa la condicionante número 4establecida por DGIRA en el resolutivo de impacto ambiental oficio No. SGPA/DGIRA/DG/09965 "Nuevo Aeropuerto Internacional de la Ciudad de México", para compensar el daño ambiental por la construcción y operación del proyecto.
81	81	Limpiar la zona donde se alojarán las pistas y edificios principales del Nuevo Aeropuerto Internacional de la Ciudad de México, para ello, se deberán retirar fuera del poligono los materiales producto de depósitos, de demoliciones, desperdicios y desazolve, realizando su carga y acarreo correspondiente, así como su deposito en bancos autorizados por la autoridad competente. 
127	127	
122	122	
123	123	
124	124	
125	125	
126	126	
128	128	
129	129	
130	130	
54	54	Proyectos como el que se propone llevar a cabo GACM, requieren transparencia, que la información relativa a la obra esté al alcance de quienes se interesen en la misma  y, de un cumplimiento efectivo y estricto del marco legal que le es aplicable, así como de las condicionantes ya impuestas por parte de las autoridades ambientales federales como parte del procedimiento de evaluación de impacto ambiental al que el proyecto se sometió en el año 2014 y que en sí mismas tienen un grado de dificultad y complejidad en su cumplimiento y ejecución. Tomando en cuenta esto último, es importante llevar a cabo en tiempo y forma las condicionantes ambientalesde tal forma que se asegure la preservación del medio ambiente en el área de influencia del Proyecto. En función de lo anterior, una de las condicionantes del resolutivo de la MIA-R fue la integración de un Comité de Vigilancia Ambiental que vigile el cumplimiento de dichos compromisos. De ahí, la necesidad por parte de GACM de contratar un asesor que cubra los requisitos necesarios para guiar las actividades de dicho Comité. 
145	145	
55	55	Beneficiar al programa de empleo temporal con la herramienta necesaria para realizar los trabajos correspondientes. 
146	146	
148	148	
149	149	
150	150	
152	152	
153	153	
175	175	
166	166	
165	165	
136	136	
135	135	Dictamen Valuatorio para la justiprestación de rentas del inmueble
137	137	Documento de Justificación firmado por el Ing. Sergio De Miguel Agüero, Subdirector de Administración.
171	171	Elaboración del Estudio para llevar a cabo el Drenaje Pluvial.
143	143	
155	155	
172	172	Elaboración del Proyecto para el Alumbrado Público de la Barda Perimetral del NAICM
174	174	
173	173	
163	163	Conservar los inmuebles de GACM en el mejor Estado y brindar al personal de GACM las condiciones necesarias para el correcto desempeño de las funciones encomendadas
164	164	
86	86	Construir la infraestructura de caminos provisionales en la etapa de construcción, para el equipo y maquinaria de construcción de todos los contratistasque participen en la construcción del Nuevo Aeropuerto Internacional de la Ciudad de México, que consiste en terracerías, estructuras, obras de drenaje, pavimentaciób y señalamiento. 
147	147	
151	151	
154	154	
176	176	
177	177	
178	178	
169	169	Debido a la necesidad de contar con un residente general de obra, especializado en materia de Infraestructura aeroportuaria, el Grupo Aeroportuario de la Ciudad de México S.A. de C.V., requiere de una Residencia General de Obra, especializada para la consecución de sus objetivos y asegurar una adecuada construcción del Nuevo Aeropuerto Internacional de la Ciudad de México
179	179	
180	180	
59	59	Para cumplir con la correcta ejecución del NAICM es necesario contratar el Servicio de asesoría técnica y capacitación a 800 trabajadores del programa empleo temporal de mano de obra campesina o urbana marginada para los 7 ejidos colindantes al predio del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).
181	181	
60	60	Asesorar y Coadyuvar con los grupos de trabajo designados, para la planeación e implementación participativa de las acciones del Plan de Integración Ejidal. 
182	182	
196	196	Contar con un instrumento de garantía para el cumplimiento de las medidas ambientales para el NAICM, de acuerdo con los lineamientos de la SEMARNAT 
191	191	Realizar los servicios consistentes en la etapa inicial de la exploración geotécnica del sitio donde se construirá la terminal del NAICM. Presentar los estudios profesionales y especializados de la acataerización dinámica dek suelo del estudio. 
35	35	El Resolutivo de Impacto Ambiental plantea una serie de términos y condicionantes que el Grupo Aerortuario de la Ciudad de México deberá observar durante todas las etapas del Proyecto: Preparación del sitio, Construcción y, Operación y mantenimiento. Derivado de lo anterior, el Grupo Aeroportuario de la Ciudad de México requiere contratar una empresa para elaborar el Programa de Capacitación en Aspectos Ambientales y de Seguridad para las Etapas de Preparación del Sitio y Construcción del Nuevo Aeropuerto Internacional de la Ciudad de México
197	197	El objetivo principal es proporcionar una plataforma de trabajo en el sitio en que se llevarán acabo las futuras actividadesde construcción, esta plataforma de trabajo se realizará para el alcance de la construcción completa del contrato del ingeniero civil marstro e incluye todos los pavimentos de lado aire para pista2 y pista 3con las calles de rodaje y plataformas en el medio, ademas incluye los edificios para las plantas centrales de servicios, la zona de combustibles, las áreas de mantenimiento  y las estaciones de bomberos y rescate y la calle de rodaje transversal para la pista 6
36	36	El 12 de septiembre de 2014, el Grupo Aeroportuario de la Ciudad de México ingresó para su evaluación, a la Dirección General de Impacto y Riesgo Ambiental (DGIRA) de la SEMARNAT, junto con el Estudio de Riesgo Ambiental, la MIA-R NAICM. El 28 de noviembre del mismo año, la DGIRA resolvió autorizar el Proyecto de manera condicionada mediante el Oficio Resolutivo No. SGPA/DGIRA/DG/09965 (el Resolutivo de Impacto Ambiental). El Re~solutivo de Impacto Ambiental plantea una serie de términos y condicionantes que el Grupo Aeroportuario de la Ciudad de México deberá observar durante todas las etapas de Proyecto: Preparación del sitio, Construcción y, Operación y  antenimiento. Dentro de estos términos y condicionantes la condicionante número 1 O dice a la letra: ""Considerando la importancia de las acciones y programas que se realicen para mitigar, prevenir y compensar los impactos ambientales que generará el proyecto dentro el SAR.
50	50	Elaborar el proyecto de terracerías de lso caminos provisionales para la construcción del NAICM, que permimta el libre tránsit de los vehículos en las etapas de la construcción del Nuevo Aeropuerto Internacional de la Ciudad de México. 
195	195	Contar con el servicio de configuración inicial personalizada para los equipos instalados en el inmueble de Altavista, con el propósito de iniciar operaciones de manera inmediata y proveer a los usuarios del Grupo Aeroportuario de la Ciudad de México (GACM) de conexión a la red de datos, seguridad física y lógica en el acceso a internet, configuración de los teléfonos y del conmutador.
193	193	Como medida para para facilitar la gestión institucional, como un elemento que se añadirá a los manuales de procedimientos, criterios y demás mecanismos que resulten indispensables para la adecuada administración de los recursos humanos y materiales que requiera un proyecto de la magnitud del nuevo aeropuerto del Valle de México.
167	167	
39	39	
168	168	Con la finalidad de Supervisar efectivamente que se lleve a cabo la limpieza extracción, carga, acarreo de material de demoliciones, desperdicios y desazolve a los bancos de tiro, donde se construirá el Nuevo Aeropuerto de la Ciudad de México, en la Zona Federal del antiguo Lago de Texcoco, se requieren los servicios de Supervisión especializada.
131	131	Contar con un servicio de transporte para los trabajos que conforman el programa de empleo temporal (PET), en el predio del NAICM.
132	132	Realizar las pruebas de laboratorio geotécnicas complementarias para determinar las propiedades y características de los materiales existentes, mediante la exploración, muestreo y ensayes de laboratorio
133	133	Para la correcta ejecución de los trabajos a llevarse a cabo para la construcción del NAICM es necesari contratar los servicios de Transporte en Camionetas de Redila
134	134	El GACM, tiene la necesidad de contar con instalaciones para albergar al personal para desarrollar las funciones que tiene encomendadas y estar en posibilidades de alcanzar los objetivos y metas que tiene establecido el proyecto antes mencionado.
186	186	
185	185	
187	187	
188	188	Documento de Justificación firmado por el Lic. José Luis Romo Cruz de fecha 30 de Marzo de 2015
142	142	A fechas recientes, se ha peribido que en el último ciclo reproductivo la población se incrmentó ocasionando infestaciones en diversas áreas del polígono, razón por la cual es necesaio la implementación de programa de control y prevención de plaga del chapulin. 
160	160	Derivado de las necesidades de control de acceso y salida del poligono es necesario contar con iluminacion es estas areas,motivo por lo cual es necesaria su contratación.
138	138	Obtener los servicios profesionales de una empresa consultora para disponer de su acompañamiento jurídico-normativo y administrativo, durante los ejercicios 2016 y 2017, a fin de que las actividades vinculadas con el desarrollo del Nuevo Aeropuerto Internacional de la Ciudad de México ""NAICM"", se efectúen con estricto apego al marco regulatorio aplicable, haciendo énfasis en los siguientes aspectos: > Contratación de obra pública y servicios relacionados con la misma.  > Contrataciones de adquisiciones, arrendamientos y servicios. > Así como cualquier otro esquema de contratación que determine el  GACM, incluyendo pero sin limitar la Ley de Asociaciones Público  Privadas. > Transparencia, Rendición de Cuentas y Gobierno Abierto. > Revisión, análisis y, en su caso, elaboración de la documentación requerida para las Sesiones del Consejo de Administración de GACM. > Revisión de la documentación elaborada para cada una de las H1Sesiones del Comité Técnico del Fideicomiso de Administración y Pago Número F-80726 denominado Fideicomiso para el Desarrollo del NAICM. > Elaboración e integración del Expediente Concentrador Integral del "NAICM".
170	170	Es necesaria la contratación de los servicios consistentes en baños portátiles durante la ejecución de los trabajos para la construcción del NAICM.
139	139	Por la magnitud del proyecto es necesario, contar con mecanismos que arrojen una mayor eficiencia y transparencia en el desarrollo de las contrataciones públicas, además resulta indispensable y necesaria la existencia de un soporte documental, por lo que resulta necesaria una empresa especializada en consultoria legal y normativa y acompañamiento en los procedimientos de contratación pública, así como en la elaboración del libro de historia documental integral del desarrollo del NAICM.
140	140	Brindar apoyo técnico a la residencia en materia de arquitectura encomendadas a la empresa responsable de la elaboración del Proyecto ejecutivo del edificio terminal de pasajeros, vialidades de acceso, estacionamiento y torre de control y centros de operaciones del NAICM, para apoyar a la residencia del proyecto de la DCI y orientar la toma de decisiones del GACM en términos contenidos de arquitectura, calidad y avance del desarrollo de los mismos.
156	156	Justificación para llevar a cabo la Contratación a través del Procedimiento de Adjudicación Directa, por caso de Excepción, del Servicio deTestigo Social para que Atestigüe la Etapas del Procedimiento de la Licitación Pública Nacional de Obra Pública de Carga, Acarreo y Descarga Dentro y Fuera del Polígono del Material Existente, Producto de Depósitos de Demoliciones y Desazolve, Incluye Conformación del Terreno donde se Construirá el Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM) para el NAICM
157	157	Dada la importancia de la Licitación Pública Nacional para la "Construcción de los caminos provisionales de acceso al NAICM, ejecutando trabajos de terraceria, estructura, obras de drenaje, pavimentación y saneamiento" se solicitó a la Secretaría de la Función Pública la designación de un testigo socual que participe en dicho proceso de contratación.
158	158	Dada la importancia de la Licitación Pública Nacional para la "Licitación Pública Nacional de Obra Pública de Nivelación y Limpieza del Terreno del Nuevo Aeropuerto Internacional de la Ciudad de México" se solicitó a la Secretaría de la Función Pública la designación de un testigo social que participe en dicho proceso de contratación.
159	159	Debido a que el edificio terminal para el Nuevo Aeropuerto Internacional de la Ciudad de México, requiere una cimentación compensada que se logra mediante la creación de sotanos cuya losa de piso corresponde a la losa de cimentación, es necesario contar con un metodo constructivo para garantizar una excavacion exitosa por las dimenciones requeridas para el edificio terminal asi como el incado de pilotes que se han proyectado
161	161	Elaboración de proyecto ejecutivo para la construcción de carriles de desaceleración, plataformas de almacenamiento y carriles de aceleración en las puertas 7, y 9 de acceso al polígono del NAICM.
162	162	Implantar un sistema de planificación de recursos gubernamentales que apoye a los funcionarios del GACM a ser capaces de gestionar en primera instancia las operaciones de construcción del aeropuerto y posteriormente, administrar su operación bajo los requerimientos del Consejo Nacional de Armonización Contable (CONAC)
144	144	Supervisar efectivamente que se lleve a cabo La Construcción de Barda y Camino Perimetral, Alumbrado, Servicios Inducidos y Casetas de Acceso para el Nuevo Aeropuerto Internacional de la Ciudad de México, Conforme a las siguientes Etapas: Primera Etapa Norte, Sección "B" 2,822.00 mts.:Segunda Etapa Poniente, Sección "E" 9,955.41 mts.: Tercera Etapa Sur, Sección "D" 7,230.18 mts.: Cuarta Etapa Oriente, Sección "C" 3, 158.00 mts. donde se construirá el Nuevo Aeropuerto de la Ciudad de México, en la Zona Federal del Antiguo Lago de Texcoco.
183	183	Es necesario contar con el servicio de Ambulancia para el Traslado de Personal, para el Programa de Empleo Temporal (PET) y que se puedan atender emergencias que se puedan presentar.
184	184	Es imperativo contar con la prestación de los servicios, debido a que la actividad de comunicación del proceso de inicio y avance de obra de la primera etapa de construcción de NAICM, impacta en la difusion y transparencia que GACM esta obligado a proporcionar al público en general, por tratarse de un proyecto a largo plazo y que contempla un impacto en el desarrollo de la economía del país, el objeto primordial perseguido por esta contratación, es llevar a cabo la ejecución y materialización campañas de comunicación social del NAICM.
189	189	Contar con los servicios profesionales de asistencia tecnica en materia de Seguros y Fianzas, en funcion de las necesidades de proteccion de riesgos, que se requieran y el aseguramiento de los diversos activos y componentes del Grupo Aeroportuario de la Ciudad de Mexico, S.A. de C.V. (GACM) para el cumplimiento de sus funciones asi como de los distintos proyectos que se esten llevando a cabo asi como los que requeriran en el futuro
190	190	 El GACM de acuerdo con sus necesidades y a efecto de estar en posibilidad de cumplir exitosamente con la planeación ejecución construcción y operación del nuevo aeropuerto internacional de la Ciudad de México que tiene a su cargo, en termino de sus estatutos sociales, requiere contar de manera impostergable los servicios de Gestión de Servicios de Infraestructura Tecnológica de Información y Comunicaciones.
88	88	La Extracción de ademes y restitución del terreno son actividades preparatorias imprescindibles para el inicio de los trabajos de construcción.
87	87	
89	89	Las instalaciones del campamento se requieren a fin de dar cumplimiento con lo establecido en el artículo 53, primer párrafo de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, el cual establece que "la residencia de obra deberá estar ubicada en el sitio de ejecución de los trabajos". Las instalaciones del campamento darán cabida a la residencia general, los residentes de cada una de las obras a ejecutar, así como las superviciones correspondientes. 
90	90	Es imprescindible la construcción de caminos de accesos y plataformas para llevar acabo los trabajos relativos a la construcción del Nuevo Aeropuerto de la Ciudad de México.
91	91	Es necesaria la prestación del servicio de transporte de personas en autobueses y traslado de maquinaria y equipo en camionetas de redilas para el programa de empleo temporal y que puedan ejecutarse los trabajos programados en tiempo y forma según lo establecido.
95	95	Realizar el servicio de la Supervisión de la construcción del proyecto integral de barda y camino perimetral, alumbrado, servicios inducidos y casetas de acceso para el NAICM (primera etapa), la obra resulta del Convenio Específico de Colaboración, derivado del Convenio Marco de Colaboración Interinstitucional suscrito entre la Secretaría de Comunicaciones y Transportes y la Secretaría de la Defensa Nacional.
97	97	Es necesaria la contratación del servicio de asesoria Legal en materia de Derecho de la Aviación, Derecho Aeropuertario, Derecho Internacional y Especializado en Asesoría en Negociación con Empresas Nacionales e Internacionales, en general acompañamiento respecto de todo aquel Procedimiento Jurídico de las distintas materias que reconoce nuestro Sistema Jurídico Mexicano.
98	98	Con el fin de trasladar al personal beneficiarios del programa de empleo temporal al lugar donde realizarán su labor, se requiere dotar de transporte especializado para la movilidad al interior del polígono donde se desarrollara el proyecto del NAICM. No obstante que los lineamientos del PET-SCT, señala que la secretaría será la encargada de facilitar el transporte, por medio de la ayuda económica, es importante señalar que la ubicación del polígono así como su acceso se encuentran sobre la autopista federal peñón -Texcoco, por lo que no hay transporte público, así mismo, los puntos de donde saldrán los brigadistas son tan variados que la ayuda de transporte sería inequitativa para cada caso, por último, es importante considerar la situación financiera de la dirección general adjunta de empleo temporal, de la SCT. 
99	99	Elaborar el Proyecto ejecutivo para la Construcción del camino perimetral y sus instalaciones complementaias en el lado norte del polígono del NAICM, que permita el aseguramiento de las instalaciones durante y después de la construcción del NAICM
100	100	Se requieren los servisioc ara revisar técnicamente todos los docuemntos requeridos par eel desarrollo adecuado de los múltiples procesos licitatorios que se requerirán para el desarrollo del proyecto del NACIM asegurando en tiempo y fomra ue cumplan con los requisitos técnicos.
103	103	El objetivo del proyecto es obtener la certificación bajo la versió LEED v4 BD + C para Nuevas construcciones que están ubicadas dentro del campus LEED que conformará el NAICM, dicho campus, ha sido registrados ante el USGBC. Cuatro edificios van a obtener la certificaicón y cada uno obtendrá un nivel de certificación diferente. 
104	104	El objetivo fundamental del arrendamiento de mobiliario es el de contar con las instalaciones adecuadas para el desarrollo de las actividades del personal de GACM, asi como para las reuniones de trabajo internas y externas
105	105	Permitir al Grupo Aeroportuario de la Ciudad de México S.A. de C.V. cumplir las metas y programas institucionales propios al ejercicio de sus funciones, resulta indispensable efectuar  la adaptación y adecuación de las instalaciones. 
212	212	
208	208	Llevar a cabo la contratación de la pensión para los vehículos del personal de Grupo Aeroportuario de la Ciudad de México S.A. de C.V.  Que no cuentan con un lugar de estacionamiento en Torre Murano.
205	205	El personal de GACM necesita contar con las herramientas necesarias para contribuir a mantener la comunicación constante con todas las áreas directivas y de operación de forma eficaz y eficiente y con ello mantener la factibilidad de dar cumplimiento a los objetivos, ya que podrá mantener la continuidad en la comunicación tanto en voz como datos en la operación diaria y verificar vía remota el avance de los proyectos, planes y programas de trabajo
203	203	La logística del proyecto resulta imprescindible toda vez la magnitud de los trabajos a realizar.
209	209	El GACM tiene prevista la conformación de un consejo conslultivo de NACIM (CNN), confrmafopor varios grupos de especialidades temáticas, incluyendo hidráulica, geotecnia, estrucura-sismos y protección contra incendio. El manual de procedimietos propuesto del CNN, prevé la función expresa de articipación de los pánles de expertos para apoyar al GACM en el análisis de temas técnicos especializado con miras a una toma de decisiones sustentada por parte de la autoridad. 
210	210	Dictamen Valuatorio para la justiprestación de rentas del inmueble
211	211	
204	204	Debido a la importancia que tienen las aves migratorias y residentes es necesario aplicar un mecanismo mediante el cual se asegure su supervivencia y su hábitat. Además es necesaria la conduccón de los escurrimientos de agua  y el control de los mismos.
213	213	Se considera que la naturaleza del servicio de arrendamiento de equipo y bienes informáticos es fundamental para dotar al personal del Grupo Aeroportuario de la Ciudad de México, S.A. de C.V. de la infraestructura tecnológica adecuada que se requiere para cumplir exitosamente sus metas de planeación, ejecución, construcción y operación del Nuevo Aeropuerto de la Ciudad de México.
206	206	Para llevar a cabo la construcción del Nuevo Aeropuerto Internacional de México resulta imprescindible la construcción de acceso y plataformas para la exploración geotécnica, asi como la rehabilitación de tramos de prueba y bacheo somero de cambios xistentes dentro del terreno del proyecto.
198	198	Debido a la magnitud e importancia del proyecto del NAICM establecer la logistica de los trabajos resulta fundamental para realizar efectivamente su ejecución.
199	199	Se requiere la dquisión de bienes muebles por parte de GACM, consistentes en "materiales de construcción" para llevar a cabo los trabajos necesarios para la construcción del NAICM.
201	201	Documento de Justificación firmado por el Lic. José Luis Romo Cruz de fecha 30 de Marzo de 2015
215	215	Cubrir las necesidades primarias de soporte de red y a la telefonia e internet e implementar el servicio en comento, por un periodo de seis meses a partir del 2° de enero y hasta 01 de julio de 2015 a traves de una adjudicacion directa.
216	216	
217	217	
207	207	Para la operaciones de GACM es necesaria la contratación del los Servicios Especializados en el suministro de terceros, en materia administrativa y servicios generales considerados en régimen de subcontratación.
200	200	El GACM tiene prevista la conformación de un consejo conslultivo de NACIM (CNN), conformado por varios grupos de especialidades temáticas, incluyendo hidráulica, geotecnia, estrucura-sismos y protección contra incendio. El manual de procedimietos propuesto del CNN, prevé la función expresa de articipación de los pánles de expertos para apoyar al GACM en el análisis de temas técnicos especializado con miras a una toma de decisiones sustentada por parte de la autoridad. 
202	202	Contar con un asesor especialista en materia de protección contra incendios, para aistencia en los requerimientos de revisión de las directrices del proceso de diseño de protección contra incendios (2009) y que sea congruente con las mejores practicas internacionales de los proyectos de este tipo y complejidad, conformandose un consejo consultivo de NAICM (CCN), conformado por varios grupos de especialidades.
214	214	Es imperativo contar con la prestación de los servicios, debido a que la actividad de comunicación del proceso de inicio y avance de obra de la primera etapa de construcción de NAICM, impacta en la difusion y transparencia que GACM esta obligado a proporcionar al público en general, por tratarse de un proyecto a largo plazo y que contempla un impacto en el desarrollo de la economía del país, el objeto primordial perseguido por esta contratación, es llevar a cabo la ejecución y materialización campañas de comunicación social del NAICM.
218	218	Para poder operar, el Nuevo Aeropuerto Internacional de la Ciudad de México requiere de un edificio terminal de pasajeros, que alcance un equilibrio entre las necesidades de los pasajeros que utilizarán las instalaciones, las aerolíneas, equipajes y aeronaves; las agencias del gobierno que regulan el flujo de pasajeros y mercancías; los minoristas que ofrecen productos y servicios dentro del edificio y el operador del mismo. El edificio terminal ocupará 743,000 mts2 de área de desplante y contará con el equivalente a 95 puertas de contacto, teniendo una capacidad anual de 50 millones de pasajero.
219	219	Realizar los trabajos relativos al Sistema de Precarga e Instrumentación Geotécnica, Infraestructura, Estructura de Pavimentos y Obra Civil de Ayudas visuales y para la Navegación de la Pista 2 y área de túneles del Nuevo Aeropuerto Internacional de la Ciudad de México
220	220	Realizar los trabajos relativos al Sistema de Precarga e instrumentación geotécnica, infraestructura, estructura de pavimentos y obra civil de ayudas visuales y para la navegación de la pista 3 y área de túneles del Nuevo Aeropuerto Internacional de la Ciudad de México. (NAICM)
41	41	Se requiere de los servicios de Seguridad mediante realización de acciones de protección fisica tanto intramuros, en zona Federal como de patrulla, para la protección de la integridad y vida de los trabajadores, Propiedad Federal a cargo del GACM. y en los inmuebles e instalaciònes a su cargo.
194	194	Contar con un espacialista asesorar en temas realcionados con la implementación de la estructura de gobierno corporativo.
192	192	El personal de GACM necesita contar con las herramientas necesarias para contribuir a mantener la comunicación constante con todas las áreas directivas y de operación de forma eficaz y eficiente y con ello mantener la factibilidad de dar cumplimiento a los objetivos, ya que podrá mantener la continuidad en la comunicación tanto en voz como datos en la operación diaria y verificar vía remota el avance de los proyectos, planes y programas de trabajo
221	221	Para la prestación del servicio de alimentación a personal del GACM en las instalaciones indicadas. 
222	222	Contar con una empresa profesional y especializada en el suministro, instalación, puesta en operación y mantenimiento de las instalaciones de vos y datos, así como electricidad en las oficinas de Grupo Aeroportuario de la Ciudad de México. 
\.


--
-- Name: planning_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('planning_id_seq', 222, true);


--
-- Data for Name: planningdocuments; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY planningdocuments (id, contractingprocess_id, planning_id, documentid, document_type, title, description, url, date_published, date_modified, format, language) FROM stdin;
1	81	\N	01	Estudio de factibilidad	Estudio de factibilidad	Factibilidad técnica, legal y ambiental del proyecto de desarrollo del Nuevo Aeropuerto Internacional de la Ciudad de México		\N	\N		
2	82	\N	1	Estudio de factibilidad	Documento que describe las condiciones necesarias para realizar un proyecto.	Factibilidad técnica, legal y ambiental del proyecto de desarrollo del Nuevo Aeropuerto Internacional de la Ciudad de México		\N	\N		
3	82	\N	2	Programa anual de obras públicas y servicios relacionados con las mismas de GACM	Documento que describe el proceso de contratación del proyecto que se planea llevar a cabo. Este plan puede referirse a un conjunto de procesos de contratación dentro del mismo proyecto o dentro de la misma entidad.	Programa anual de obras públicas y servicios relacionados con las mismas de GACM correspondiente al ejercicio fiscal 2015		\N	\N		
4	82	\N	2	Programa anual de obras públicas y servicios relacionados con las mismas de GACM	Documento que describe el proceso de contratación del proyecto que se planea llevar a cabo. Este plan puede referirse a un conjunto de procesos de contratación dentro del mismo proyecto o dentro de la misma entidad.	Programa anual de obras públicas y servicios relacionados con las mismas de GACM correspondiente al ejercicio fiscal 2015		\N	\N		
5	82	\N	3	 Proyecto ejecutivo de la obra	Documento que describe el plan del proyecto que se atiende con la contratación.	No aplica (se trata de un servicio)		\N	\N		
6	82	\N	4	Términos de referencia 	Documento que evalúa la justificación de las necesidades por las cuáles se realizará el o los procesos de contratación, y que detalla los bienes, obras o servicios a contratar que atienden dichas necesidades.	Términos de referencia  para la implementación del plan de restauración ecológica para el nuevo aeropuerto internacional de la ciudad de México, publicados en CompraNet el  11 de junio del 2015		\N	\N		
7	83	\N	1	Documento que describe las condiciones necesarias para realizar un proyecto.	Estudio de factibilidad	Factibilidad técnica, legal y ambiental del proyecto de desarrollo del Nuevo Aeropuerto Internacional de la Ciudad de México		\N	\N		
8	83	\N	2	Documento que describe el proceso de contratación del proyecto que se planea llevar a cabo. Este plan puede referirse a un conjunto de procesos de contratación dentro del mismo proyecto o dentro de la misma entidad.	Programa anual de obras públicas y servicios relacionados con las mismas de GACM	Programa anual de obras públicas y servicios relacionados con las mismas de GACM correspondiente al ejercicio fiscal 2015		\N	\N		
9	83	\N	3	Documento que describe el plan del proyecto que se atiende con la contratación.	 Proyecto ejecutivo de la obra	No aplica por tratarse de servicios relacionados con obra		\N	\N		
10	83	\N	4	Documento que evalúa la justificación de las necesidades por las cuáles se realizará el o los procesos de contratación, y que detalla los bienes, obras o servicios a contratar que atienden dichas necesidades.	Términos de referencia 	Términos de Referencia para la Implementación del Programa de Rescate de Flora y Fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México, publicados el 28 de mayo de 2015		\N	\N		
11	84	\N	1	Documento que describe las condiciones necesarias para realizar un proyecto.	Estudio de factibilidad	Factibilidad técnica, legal y ambiental del proyecto de desarrollo del Nuevo Aeropuerto Internacional de la Ciudad de México		\N	\N		
12	84	\N	2	Documento que describe el proceso de contratación del proyecto que se planea llevar a cabo. Este plan puede referirse a un conjunto de procesos de contratación dentro del mismo proyecto o dentro de la misma entidad.	Programa anual de obras públicas y servicios relacionados con las mismas de GACM	Programa anual de obras públicas y servicios relacionados con las mismas de GACM correspondiente al ejercicio fiscal 2015		\N	\N		
13	84	\N	3	Documento que describe el plan del proyecto que se atiende con la contratación.	 Proyecto ejecutivo de la obra	No aplica por tratarse de servicios relacionados con obra		\N	\N		
14	84	\N	4	Documento que evalúa la justificación de las necesidades por las cuáles se realizará el o los procesos de contratación, y que detalla los bienes, obras o servicios a contratar que atienden dichas necesidades.	Términos de referencia 	Términos de referencia para el Plan de acciones de monitoreo y conservación de aves del proyecto NAICM		\N	\N		
15	85	\N	1	Documento que describe las condiciones necesarias para realizar un proyecto.	Estudio de factibilidad	Factibilidad técnica, legal y ambiental del proyecto de desarrollo del Nuevo Aeropuerto Internacional de la Ciudad de México		\N	\N		
16	85	\N	2	Documento que describe el proceso de contratación del proyecto que se planea llevar a cabo. Este plan puede referirse a un conjunto de procesos de contratación dentro del mismo proyecto o dentro de la misma entidad.	Programa anual de obras públicas y servicios relacionados con las mismas de GACM	Programa anual de obras públicas y servicios relacionados con las mismas de GACM correspondiente al ejercicio fiscal 2015		\N	\N		
17	85	\N	3	Documento que describe el plan del proyecto que se atiende con la contratación.	 Proyecto ejecutivo de la obra	NA		\N	\N		
18	85	\N	4	Documento que evalúa la justificación de las necesidades por las cuáles se realizará el o los procesos de contratación, y que detalla los bienes, obras o servicios a contratar que atienden dichas necesidades.	Términos de referencia 	Términos de referencia para  los servicios de Exploración geotécnica complementaria para el proyecto ejecutivo del sistema de drenaje temporal del Nuevo aeropuerto Internacional de la Ciudad de México, en el Ex Lago de Texcoco, Estado de México. Publicados el 30 de marzo de 2015		\N	\N		
19	86	\N	1	Documento que describe las condiciones necesarias para realizar un proyecto.	Estudio de factibilidad	Factibilidad técnica, legal y ambiental del proyecto de desarrollo del Nuevo Aeropuerto Internacional de la Ciudad de México		\N	\N		
20	86	\N	2	Documento que describe el proceso de contratación del proyecto que se planea llevar a cabo. Este plan puede referirse a un conjunto de procesos de contratación dentro del mismo proyecto o dentro de la misma entidad.	Programa anual de obras públicas y servicios relacionados con las mismas de GACM	Programa anual de obras públicas y servicios relacionados con las mismas de GACM correspondiente al ejercicio fiscal 2015		\N	\N		
21	86	\N	3	Documento que describe el plan del proyecto que se atiende con la contratación.	 Proyecto ejecutivo de la obra	El Proyecto para la ejecución de la obra se entrego como parte de la Convocatoria.		\N	\N		
22	86	\N	4	Documento que evalúa la justificación de las necesidades por las cuáles se realizará el o los procesos de contratación, y que detalla los bienes, obras o servicios a contratar que atienden dichas necesidades.	Términos de referencia 	Especificaciones generales y particulares para la Construcción de los caminos provisionales de acceso al Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM) ejecutando trabajos de terracería, estructuras y obrad de drenaje, pavimentación y señalamiento 		\N	\N		
23	218	\N	1	Proyecto ejecutivo de la obra	Proyecto ejecutivo de la obra	Especificaciones generales y particulares	ftp://189.204.79.236/GACM/Paquete Terminal 15-07-16	\N	\N		
\.


--
-- Name: planningdocuments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('planningdocuments_id_seq', 23, true);


--
-- Data for Name: procuringentity; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY procuringentity (id, contractingprocess_id, tender_id, identifier_scheme, identifier_id, identifier_legalname, identifier_uri, name, address_streetaddress, address_locality, address_region, address_postalcode, address_countryname, contactpoint_name, contactpoint_email, contactpoint_telephone, contactpoint_faxnumber, contactpoint_url) FROM stdin;
1	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11	11	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13	13	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14	14	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15	15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18	18	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19	19	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20	20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21	21	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23	23	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
24	24	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
25	25	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
26	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
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
114	114	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
115	115	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
116	116	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
117	117	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
118	118	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
119	119	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
120	120	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
121	121	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
122	122	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
123	123	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
124	124	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
125	125	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
126	126	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
127	127	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
128	128	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
129	129	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
130	130	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
131	131	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
132	132	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
133	133	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
134	134	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
135	135	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
136	136	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
137	137	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
138	138	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
139	139	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
140	140	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
141	141	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
142	142	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
143	143	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
144	144	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
145	145	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
146	146	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
147	147	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
148	148	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
149	149	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
150	150	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
151	151	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
152	152	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
153	153	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
154	154	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
155	155	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
156	156	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
157	157	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
158	158	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
159	159	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
160	160	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
161	161	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
162	162	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
163	163	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
164	164	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
165	165	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
166	166	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
167	167	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
168	168	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
169	169	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
170	170	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
171	171	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
172	172	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
173	173	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
174	174	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
175	175	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
176	176	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
177	177	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
178	178	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
179	179	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
180	180	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
181	181	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
182	182	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
183	183	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
184	184	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
185	185	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
186	186	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
187	187	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
188	188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
189	189	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
190	190	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
191	191	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
192	192	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
193	193	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
194	194	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
195	195	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
196	196	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
197	197	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
198	198	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
199	199	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
200	200	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
201	201	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
202	202	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
203	203	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
204	204	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
205	205	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
206	206	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
207	207	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
208	208	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
209	209	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
210	210	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
211	211	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
212	212	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
213	213	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
214	214	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
215	215	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
216	216	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
217	217	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
218	218	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
219	219	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
220	220	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
221	221	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
222	222	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Name: procuringentity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('procuringentity_id_seq', 222, true);


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
6	6	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
73	73	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
218	218	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
23	23	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
47	47	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
84	84	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
85	85	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
86	86	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
87	87	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
88	88	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
89	89	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
90	90	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
91	91	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
74	74	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
81	81	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
213	213	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
202	202	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
18	18	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
19	19	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
130	130	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
198	198	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
200	200	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
201	201	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
17	17	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
45	45	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
46	46	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
175	175	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
13	13	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
14	14	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
15	15	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
16	16	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
41	41	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
65	65	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
100	100	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
101	101	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
102	102	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
103	103	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
219	219	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
220	220	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
199	199	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
104	104	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
105	105	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
106	106	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
107	107	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
108	108	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
109	109	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
110	110	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
131	131	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
132	132	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
133	133	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
134	134	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
135	135	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
136	136	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
147	147	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
183	183	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
184	184	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
185	185	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
186	186	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
187	187	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
188	188	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
189	189	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
190	190	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
191	191	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
192	192	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
193	193	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
194	194	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
148	148	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
149	149	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
150	150	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
151	151	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
152	152	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
153	153	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
7	7	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
8	8	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
9	9	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
203	203	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
204	204	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
205	205	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
222	222	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
27	27	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
28	28	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
29	29	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
66	66	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
67	67	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
68	68	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
69	69	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
70	70	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
44	44	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
97	97	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
98	98	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
181	181	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
196	196	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
197	197	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
30	30	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
31	31	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
32	32	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
33	33	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
34	34	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
35	35	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
99	99	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
214	214	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
215	215	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
216	216	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
217	217	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
177	177	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
138	138	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
139	139	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
75	75	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
79	79	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
221	221	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
24	24	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
25	25	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
26	26	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
82	82	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
83	83	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
93	93	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
94	94	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
95	95	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
96	96	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
62	62	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
63	63	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
64	64	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
206	206	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
207	207	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
72	72	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
43	43	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
140	140	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
178	178	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
179	179	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
180	180	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
10	10	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
11	11	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
36	36	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
37	37	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
38	38	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
159	159	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
137	137	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
39	39	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
40	40	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
48	48	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
49	49	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
50	50	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
51	51	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
52	52	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
20	20	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
21	21	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
22	22	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
71	71	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
144	144	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
145	145	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
146	146	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
176	176	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
42	42	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
154	154	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
155	155	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
156	156	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
157	157	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
158	158	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
211	211	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
212	212	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
55	55	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
56	56	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
57	57	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
58	58	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
114	114	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
115	115	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
116	116	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
117	117	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
118	118	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
119	119	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
120	120	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
121	121	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
122	122	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
123	123	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
124	124	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
125	125	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
126	126	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
127	127	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
168	168	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
169	169	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
160	160	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
161	161	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
162	162	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
170	170	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
171	171	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
172	172	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
173	173	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
174	174	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
59	59	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
76	76	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
77	77	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
78	78	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
163	163	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
164	164	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
165	165	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
166	166	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
167	167	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
12	12	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
60	60	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
61	61	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
182	182	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
80	80	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
111	111	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
112	112	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
113	113	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
53	53	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
54	54	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
128	128	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
129	129	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
141	141	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
142	142	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
143	143	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
195	195	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
208	208	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
209	209	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
210	210	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
92	92	Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	APF	GACM	http://www.aeropuerto.gob.mx/
\.


--
-- Name: publisher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('publisher_id_seq', 222, true);


--
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY supplier (id, contractingprocess_id, award_id, name, identifier_scheme, identifier_id, identifier_legalname, identifier_uri, address_streetaddress, address_locality, address_region, address_postalcode, address_countryname, contactpoint_name, contactpoint_email, contactpoint_telephone, contactpoint_faxnumber, contactpoint_url) FROM stdin;
59	80	\N	UNIVERSIDAD AUTÓNOMA DE NUEVO LEÓN		UAN691126MK2	UNIVERSIDAD AUTÓNOMA DE NUEVO LEÓN		Av. Universidad S/N	Ciudad Universitaria	San Nicolás de los Garza	66455	México					
67	42	\N	Secretaría de la Defensa Nacional		SDN8501014D2	Secretaría de la Defensa Nacional		Campo Militari Número 1-K, Avenida Industria Militar número 261	Lomas de San Isidro	Naucalpan de Juarez	53960	México					
69	43	\N	Comisión Federal de Electricidad a través de la Gerncia de Estudios de Ingeniería Civil		CFE370814Q10	Comisión Federal de Electricidad a través de la Gerncia de Estudios de Ingeniería Civil		Calle Augusto Rodín No. 265	Nohebuena	Benito Juárez 	3720	México					
7	73	\N	Unidad Profesional Interdisciplinaria en Ingeniería y Tecnologías Avanzadas (UPIITA), del Instituto Politécnico Nacional.		UPIITA	Unidad Profesional Interdisciplinaria en Ingeniería y Tecnologías Avanzadas (UPIITA), del Instituto Politécnico Nacional.		Av. Luis Enrique Erro S/N, Unidad Profesional "Adolfo López Mateos"	Gustavo A. Madero	Gustavo A. Madero	7738	México					
132	50	\N	Impulsora de enlace empresarial Catena S.A de C.V		IEE100309KLA	Impulsora de enlace empresarial Catena S.A de C.V		Insurgentes Sur 1722 - 1003									
176	144	\N	SIFRA y Asociados, S.A. de C.V.		SAS8710124M8	SIFRA y Asociados, S.A. de C.V.		Boulevar Adolfo López Mateos Número 1630, Mixcoac	Benito Juárez	Ciudad de México	03810	México					
86	82	\N	Manejo Integral de Cuencas, S.A. de C.V.		MIC020410UGA	Manejo Integral de Cuencas, S.A. de C.V.		José María Pino Suárez Manzana 15, Lote 19	Nezahualcoyotl	Municipio de Texcoco, Edo de México	56234	México					
101	85	\N	Rocher Ingeniería S.A. de C.V.		RIN040823510	Rocher Ingeniería S.A. de C.V.		Vía Láctea 51, Prados Churubusco	Coyoacán	D.F.	04230	México					
145	167	\N	INSTITUTO POLITÉCNICO NACIONAL CENTRO DE INNOVACIÓN Y DESARROLLO TECNOLÓGICO EN CÓMPUTO (CIDETEC)"		FIC000330LK9	INSTITUTO POLITÉCNICO NACIONAL CENTRO DE INNOVACIÓN Y DESARROLLO TECNOLÓGICO EN CÓMPUTO (CIDETEC)"		Avenida Paseo de la Reforma 510	Coyoacán	Ciudad de México	6600	México					
106	86	\N	Transportaciones y Construcciones Tamaulipecos, S. A. de C. V.		TCT931025713	Transportaciones y Construcciones Tamaulipecos, S. A. de C. V.		Carretera libre Matamoros a Monterrey KM 5.2 sin número, Renacimiento	Reynosa	Tamaulipas	88740	México					
2	21	\N	Academia de Ingeniería, S. A.		AIN0203116A1	Academia de Ingeniería, S. A.		Tacuba 5, Centro Histórico	Cuauhtémoc	Distrito Federal	06000	México					
3	61	\N	F GLEZ CONSULTORES Y ASOCIADOS, S.A. DE C.V.		FGC980820G37	F GLEZ CONSULTORES Y ASOCIADOS, S.A. DE C.V.		Alfonso Esparza Oteo, número 144, Guadalupe Inn	Álvaro Obregón	Ciudad de México	01020	México					
6	1	\N	Ingeniero Lino Marquez Vite		MAVL480712ID7	Ingeniero Lino Marquez Vite		Bravo, número 49	Venustiano Carranza	Ciudad de México	15100	México					
169	172	\N	Itenergy de México S. A. de C. V.		IME150515FY0	Itenergy de México S. A. de C. V.		Montesino no. 38, Piso 28, Oficina 12.	Benito Juárez	Ciudad de México	03810	México					
36	30	\N	Instituto de Investigaciones y Capacitación para las Ciencias Biológicas, A.C.		IIC140227RA0	Instituto de Investigaciones y Capacitación para las Ciencias Biológicas, A.C.		Cecilio Robelo 381, Jardín Balbuena	Venustiano Carranza	Ciudad de México	15900	México					
37	17	\N	Gerardo Suárez  Reynoso		SURG520703IF3	Gerardo Suárez  Reynoso		calle Planicie no. 16	Tlalpan	Ciudad de México	14010	México					
107	86	\N	Inmobiliarios Mexicanos, S. A. de C. V.		IME0304236T5	Inmobiliarios Mexicanos, S. A. de C. V.											
146	39	\N	Centro de Innovación y Desarrollo Tecnológico en Cómputo (CIDETEC), del Instituto Politécnico Nacional.		CIDETEC	Centro de Innovación y Desarrollo Tecnológico en Cómputo (CIDETEC), del Instituto Politécnico Nacional.		Luis Enrique Erro S/N, Unidad Proofesional Adolfo López Mateos, Zacatenco	Gustavo A. Madero	Ciudad de México	07738	México					
79	70	\N	RAGAMEX Constructores SA de CV		RCO010901MP3	RAGAMEX Constructores SA de CV		Peru 218A, América Sur	Oaxaca de Juárez	Oaxaca	68020	México					
214	194	\N	Galaz, Yamazaki, Ruiz Urquiza S.C.		GYR880101TL1	Galaz, Yamazaki, Ruiz Urquiza S.C.		Paseo de la Reforma 489, Cuahutémoc	Cuahutémoc	Ciudad de México	06500	México					
113	152	\N	Ing. Jorge Jiménez Méndez		CUMJ500320CB9	Ing. Jorge Jiménez Méndez		Castillo de Edinburgh Número 72	Atizapán de Zaragoza	Estado de México	52938	México					
11	74	\N	Unidad Profesional Interdisciplinaria en Ingeniería y Tecnologías Avanzadas (UPIITA), del Instituto Politécnico Nacional		UPIITA	Unidad Profesional Interdisciplinaria en Ingeniería y Tecnologías Avanzadas (UPIITA), del Instituto Politécnico Nacional		Av. Luis Enrique Erro S/N, Unidad Profesional "Adolfo López Mateos	Gustavo A. Madero	Gustavo A. Madero	7738	México					
16	26	\N	GLM, Comunicaciones, S. A. de C. V.		GCO950523JCD	GLM, Comunicaciones, S. A. de C. V.		Sombrerete número 522, piso 1, Hipodrómo Condesa	Delegación Cuauhtémoc	México, D. F.	06170	México					
5	22	\N	Instituto Politecnico Nacional		FIC000330LK9	Instituto Politecnico Nacional		Edificio de la Dirección General, Avenida Luis Enrique Erro sin número, Unidad Profesional Adolfo López Mateos, Zacatenco	Gustavo A. Madero	Ciudad de México	07738	México					
8	23	\N	Secretaría de Comunicaciones y Transportes a través de la Dirección General de Servicios Técnicos		SCT8501018I9	Secretaría de Comunicaciones y Transportes		Avenida Coyoacán número 1895, Primer Piso, Acacias	Benito Juárez	Ciudad de México	03240	México					
10	24	\N	Instituto Politecnico Nacional		FIC000330LK9	Instituto Politecnico Nacional		Edificio de la Dirección General, Avenida Luis Enrique Erro sin número, Unidad Profesional Adolfo López Mateos, Zacatenco	Gustavo A. Madero	Ciudad de México	07738	México					
12	62	\N	CAL Y MAYOR Y ASOCIADOS, S.C.		CMA820324D65	CAL Y MAYOR Y ASOCIADOS, S.C.		Pallares y Portillo 174-2, colonia Parque San Andrés	Coyoacán	Ciudad de México	04040	México					
13	3	\N	Instituto Mexicano de Auditoría Tecnica, A. C.		IMA941216HE8	Instituto Mexicano de Auditoría Tecnica, A. C.		Avenida San Lorenzo número 153, despacho 602	Benito Juarez	Ciudad de México	03100						
83	81	\N	Calzada Construcciones, S. A. de C. V.		CCO980814BU4	Calzada Construcciones, S. A. de C. V.											
215	192	\N	SOPORTE Y CAPACITACIÓN S.A. DE C.V.		SCA000222H7A	SOPORTE Y CAPACITACIÓN S.A. DE C.V.											
9	2	\N	Oscar Alvares de la  Cuadra Sánchez	AASO390420HDFLNS07	Oscar_Alvares_de_la_Cuadra_Sanchez	Oscar Alvares de la  Cuadra Sánchez		Insurgentes Sur 559	Benito Júarez	Ciudad de México	3810	México					
15	25	\N	Grupo de Ingenieía en Consultoría en obras, S. A. de C. V.		GIC900813219	Grupo de Ingenieía en Consultoría en obras, S. A. de C. V.		Calzada de Tlalpan 4911 BIS, Tlalpan	Tlalpan	Ciudad de México	14000	México					
191	110	\N	Consultoría, Supervisión Técnica y Operación en Sistemas, S. A. de C. V.		CST890605C72	Consultoría, Supervisión Técnica y Operación en Sistemas, S. A. de C. V.		Emperadores número 46	Benito Juárez	Ciudad de México	3570	México					
192	104	\N	Lanz Import S. A. de C. V.		LIM000928AC8	Lanz Import S. A. de C. V.		Av. Paseo de la Reforma No. 725	Miguel Hidalgo	Ciudad de México	11000	México					
217	222	\N	Ribus Tech S. A. de C. V. 		RTE110519GA9	Ribus Tech S. A. de C. V. 		Avenida Cuauhtémoc 789	Benito Juárez	Ciudad de México	15520	México					
177	163	\N	TRIPALLIUM ENTERPRISES MICMAR		TEN080207SR2 MIC030120GM4	TRIPALLIUM ENTERPRISES MICMAR		Córdoba Núm. 64, Roma Norte	Cuauhtémoc	Distrito Federal	06700	México					
181	183	\N	Martín Salvador Sánchez Robles		SARM760718RK3	Martín Salvador Sánchez Robles		Popocatépetl 13, Arenal Tenayuca	Tlanepantla	Estado de México	54150	México					
20	6	\N	ENRIQUE ÁLVARO TAMEZ GONZÁLEZ		TAGE250811PC2	ENRIQUE ÁLVARO TAMEZ GONZÁLEZ		Avenida Explanada número 1615	Miguel Hidalgo	Ciudad de México	11000	México					
22	7	\N	ADRIÁN PEDROZO ACUÑA		PEAA751126	ADRIÁN PEDROZO ACUÑA		Calle Cerro Coporo número 12	Coyoacán	Ciudad de México	4200	México					
23	8	\N	Luis Esteva Maraboto		EEML3501314D3	Luis Esteva Maraboto		Cerro Prieto, número 5	Coyoacán	Ciudad de México	4320	México					
24	9	\N	Manuel Zarate Aquino		ZAAM370507CW5NY5	Manuel Zarate Aquino		Calle Hacienda de Peñuelas 46	Tlalpan	Ciudad de México	14310	México					
26	10	\N	Ismael Herrera Revilla		HERI3110154P4	Ismael Herrera Revilla		Calle Calvario 85 casa 4	Tlalpan 	Ciudad de México	14000	México					
27	28	\N	Arup Latin America, S.A		ESA-86216827	Arup Latin America, S.A		Alcala n° 54		Madrid 	28014	España					
28	11	\N	Gholamreza Mesri		Contratista Persona Física de Nacionalidad Estadounidense. Presenta Forma Migratoria Múltiple (FMM)	Gholamreza Mesri		401 Yankee Ridge Ln Urbana 	NO APLICA	NO APLICA	61802	Estados Unidos de Norteamérica 					
30	63	\N	Consorcio IUYET S.A. de C.V.		CIU9905071G7	Consorcio IUYET S.A. de C.V.		San Borja 1358, Vértiz Narvarte	Benito Juárez	Ciudad de México	58080	México					
31	13	\N	Óscar José Vega y Roldán		ERO381205AA9	Óscar José Vega y Roldán		Cerro del Horno #54	Coyoacán	Ciudad de México	04320	México					
32	29	\N	Instituto de Investigaciones y Capacitación para las Ciencias Biológicas, A.C.		IIC140227RA0	Instituto de Investigaciones y Capacitación para las Ciencias Biológicas, A.C.		Cecilio Robelo 381, Jardín Balbuena	Venustiano Carranza	Ciudad de México	15900	México					
33	14	\N	Ramón Edgardo Domínguez Betancourt		DOBR4110225Z8	Ramón Edgardo Domínguez Betancourt		Francia número131, casa 5	Alvaro Obregón	Ciudad de México	1030	México					
34	15	\N	Oscar José Vega y Roldan		VERO381205AA9	Oscar José Vega y Roldan		Calle Cerro del Horno 	Coyoacán	Ciudad de México	4320	México					
35	16	\N	Guillermo Springall Caram		SICG341213JLA	Guillermo Springall Caram		Rafael Checa número 60	Alvaro Obregón	Ciudad de México	1070	México					
21	75	\N	Unidad de Desarrollo Tecnológico (TECHNOPOLI), del Instituto Politécnico Nacional		TECHNOPOLI	Unidad de Desarrollo Tecnológico (TECHNOPOLI), del Instituto Politécnico Nacional		Av. Wilfrido Massieu, S/N, Unidad Profesional Adolfo López Mateos	Zacatenco	Gustavo A. Madero	7738	México					
25	72	\N	Universidad Nacional Autónoma de México.		UNA2907227Y5	Universidad Nacional Autónoma de México.		Avenida Universidad N0. 3000	Universidad Nacional Autónoma de México C.U.	Coyoacán	04510	México					
38	64	\N	Advanced Logistic Group, S. A. U.		A58623141	Advanced Logistic Group, S. A. U.		Av. Ejercito Nacional #843-B, Piso 14, Granada	Miguel Hidalgo	Ciudad de México	11520	México					
39	64	\N	Indra Business Consulting ALG México, S. A. de C. V.		EAC080925767	Indra Business Consulting ALG México, S. A. de C. V.											
41	19	\N	Norma Delia López Gómez		LOGN6608229DA	Norma Delia López Gómez		Av. Acueducto número 822, edif. 1, depto., 202	Gustavo A. Madero 	Ciudad de México	7369	México					
43	20	\N	Academia de Ingeniería, S. A.		AIN0203116A1	Academia de Ingeniería, S. A.		Tacuba 5	Cuauhtémoc	Ciudad de México	6000	México					
45	31	\N	Instituto de Investigaciones y Capacitación para las Ciencias Biológicas, A.C.		IIC140227RA0	Instituto de Investigaciones y Capacitación para las Ciencias Biológicas, A.C.		Cecilio Robelo 381, Jardín Balbuena	Venustiano Carranza	Ciudad de México	15900	México					
46	32	\N	Instituto de Investigaciones y Capacitación para las Ciencias Biológicas, A.C.		IIC140227RA0	Instituto de Investigaciones y Capacitación para las Ciencias Biológicas, A.C.		Cecilio Robelo 381, Jardín Balbuena	Venustiano Carranza	Ciudad de México	15900	México					
48	111	\N	Afianzadora Sofimex S.A.		ASG950531ID1	Afianzadora Sofimex S.A.		Blvd. Adolfo López Mateos No.1941	Álvaro Obregón	Ciudad de México	1010	México					
50	112	\N	Arrendomovil de Mexico S.A. de C.V		AME012206NS8	Arrendomovil de Mexico S.A. de C.V		Insurgentes Sur 1235	Benito Juárez 	Ciudad de México	3740	México					
51	33	\N	Especialistas  Ambientales, S.A. de C.V.		EAM9803104KO	Especialistas  Ambientales, S.A. de C.V.		Camino al Olivo Número15 Interior 301, Lomas de Vista Hermosa	Cuajimalpa	Ciudad de México	05100	México					
52	113	\N	El Mundo es Tuyo, S.A. de C.V.		MET8908305M9	El Mundo es Tuyo, S.A. de C.V.		Av. Diagonal San Antonio número 1218	Benito Juárez 	Ciudad de México	3020	México					
53	34	\N	ESPECIALISTAS AMBIENTALES, S.A. DE C.V.		EAM9803104K0	ESPECIALISTAS AMBIENTALES, S.A. DE C.V.		Camino al Olivo 15 interior 301, Lomas de Vista Hermosa	Cuajimalpa de Morelos	Distrito Federal	05100	México					
55	114	\N	ESTRATEC S.A. DE C.V		EST850718Q51	ESTRATEC S.A. DE C.V		Calle Bahía del Espiritu Santo # 125	Miguel Hidalgo	Ciudad de México	11300	México					
58	115	\N	Actividades Sustentables Administrativos, S.A. de C.V.		ASA131016MT6	Actividades Sustentables Administrativos, S.A. de C.V.		Tlacotalpan número 13 despacho 02	Cuauhtémoc	Ciudad de México	6760	México					
17	4	\N	DR. Rafael Bernardo Carmona Paredes	CAPR560416LQ6	Rafael_Bernardo_Carmona_Paredes	DR. Rafael Bernardo Carmona Paredes		San Lorenzo 4 casa 2	Xochimilco	Ciudad de México	16020	México					
61	116	\N	DESINGS AND INTELIGENT MATERIALS, S.A. DE R.L. DE C.V.		DIM051128A83	DESINGS AND INTELIGENT MATERIALS, S.A. DE R.L. DE C.V.		Adolfo Prieto 1653, int.2-6	Del Valle	Ciudad de México	03100	México					
29	12	\N	Jonathan Donald Bray		494534466	Jonathan Donald Bray		285 Pickering PLCA	Walnut Creek	CA	94598-3203	EU					
19	27	\N	Consorcio IUYET S.A. de C.V.		CIU99050721G7	Consorcio IUYET S.A. de C.V.		San Borja 1358, Vertiz Narvarte	Benito Juárez	Ciudad de México	03600	México					
54	78	\N	Comisión Federal de Electricidad		CFE370814Q10	Comisión Federal de Electricidad		Reforma número 164, Piso 14	Juarez	Cuauthemoc	6000	México					
56	65	\N	Consorcio IUYET, S.A. de C.V.		CIU99050721G7	Consorcio IUYET, S.A. de C.V.		Valentín Gómez Farías No.307, colonia 5 de mayo	Toluca	Estado de México	50090	México					
62	116	\N	GLOBAL TELECOMUNICATION GROUP, S.A. DE R.L. DE C.V.		GTG020819JS3	GLOBAL TELECOMUNICATION GROUP, S.A. DE R.L. DE C.V.		Calle 17 sur 4526	Puebla	Puebla	72430	México					
63	116	\N	GLOBAL TELECOMUNICATION GROUP, S.A. DE R.L. DE C.V.		GTG020819JS3	GLOBAL TELECOMUNICATION GROUP, S.A. DE R.L. DE C.V.		Calle 17 sur 4526	Puebla	Puebla	72430	México					
64	66	\N	Currie & Brown México S. A. de C. V.		C&B050317SU4	Currie & Brown México S. A. de C. V.		Newton número 16, piso 6, Aristoteles Polanco Chapultepec	Delegación Miguel Hidalgo 	Ciudad de México	11560	México					
66	117	\N	E AND T SOLUTIONS S.A. DE C.V.		TSO011121V26	E AND T SOLUTIONS S.A. DE C.V.		Pajares Núm. 82	Iztapalapa	Ciudad de México	9810	México					
68	118	\N	ESPACIOS ELVYCK, S. DE R.L. DE C.V.		EEL030217T72	ESPACIOS ELVYCK, S. DE R.L. DE C.V.		Calle Privada de Trabajadores Sociales número 43 accesoria	Iztapalapa	Ciudad de México	9410	México					
70	67	\N	Rocher Ingeniería S.A. de C.V.		RIN040823510	Rocher Ingeniería S.A. de C.V.		Vía Láctea 51, Prados Churubusco	Coyoacán	Ciudad de México	4230	México					
71	119	\N	Octavio Mayen Mena		MAMX570204KI8	Octavio Mayen Mena		Porfirio Díaz No. 23 	Magdalena Contreras 	Ciudad de México	10200	México					
72	120	\N	CONSORCIO EMPRESARIAL ADPER S.A. DE C.V.		CEA140128UI3	CONSORCIO EMPRESARIAL ADPER S.A. DE C.V.		Manuel Ávila Camacho 1903 int 600 A	Naucalpan de Jaurez	Estado de México	53100	México					
74	68	\N	Manejo Integral de Cuencas, S.A. de C.V.		MIC020410UGA	Manejo Integral de Cuencas, S.A. de C.V.		José María Pino Suárez Manzana 15, Lote 19, Nezahualcoyotl	Texcoco	Estado de México	56234	México					
152	134	\N	LAUMAN, S.A. DE C.V.		LAU0002028R1	LAUMAN, S.A. DE C.V.		Santa Bárbara Núm. 15, Del Valle	Benito Juárez	Distrito Federal	03100	México					
40	18	\N	Stephen Alan Mahin		482532989	Stephen Alan Mahin		6363 Christie Ave Apt 1926	Emeryville	CA	94608	USA					
57	79	\N	UNIVERSIDAD AUTÓNOMA DE NUEVO LEÓN		UAN691126MK2	UNIVERSIDAD AUTÓNOMA DE NUEVO LEÓN		Avenida Universidad S/N	Ciudad Universitaria	San Nicolás de los Garza	66455	México					
77	69	\N	Supervisión y Control de Fauna, S.A. de C. V.		SCF0401286B1	Supervisión y Control de Fauna, S.A. de C. V.		Cda. De Arroyo #50 Int 4, Santiago Occipaco	Naucalpan de Juárez	Estado de México	53237	México					
81	121	\N	H&L Consultoras Asociadas S.A. de C.V.		H&L001219R14	H&L Consultoras Asociadas S.A. de C.V.		Montecito 38 Piso 1 	Benito Juárez	Ciudad de México	3810	México					
85	51	\N	Delfino Navarrete Jimenez		NAJD700208ET1	Delfino Navarrete Jimenez		Av Insurgentes Numero 3274, colonia San Angel	Alvaro Obregón	Ciudad de México	01000	México					
89	122	\N	ENRIQUE BERRUGA FILOY		BEFE590915R81	ENRIQUE BERRUGA FILOY		Privada de las Pérgolas 37	Huixquilucan de Degollado	Estado de México	52760	México					
90	53	\N	Consorcio de Servicios Juridicos Monsalvo, S. C.		CSJ130426GT9	Consorcio de Servicios Juridicos Monsalvo, S. C.		Pitágoras 903, Col. Del Valle	Benito Juárez	Ciudad de México	03100	México					
91	123	\N	Price Water House Coopers, S.C.		PR1981101785	Price Water House Coopers, S.C.		Mariano Escobedo No. 573	Miguel Hidalgo	Ciudad de México	11580	México					
92	124	\N	IDT en Sistemas de Información, S.A. de C.V.		ISI021115AFA	IDT en Sistemas de Información, S.A. de C.V.		Avenida Hidalgo número 1 interior 10	Cuatitlán Izcalli	Estado de México	54743	México					
93	125	\N	CUESTA Y LLACA, S.C.		CLA980911IYA	CUESTA Y LLACA, S.C.		Avenida san Jerónimo número 369, Torre 1, Piso 2-C	Álvaro Obregon	Ciudad de México	1090	México					
94	126	\N	H&L CONSULTORIAS ASOCIADAS, S.A. DE C.V.		H&L001219R14	H&L CONSULTORIAS ASOCIADAS, S.A. DE C.V.		Montecito Núm. 38, piso 1, local 10	Benito Juárez	Ciudad de México	3810	México					
95	127	\N	Bejar Galindo Lozano y Cía; S.C.		BGL860218J58	Bejar Galindo Lozano y Cía; S.C.		San Francisco número 25, Int. 202 y 302	Benito Juárez 	Ciudad de México	3100	México					
97	128	\N	Ingeniería y Procesamiento Electrónico, S. A. de C. V.		IPE850318NZA	Ingeniería y Procesamiento Electrónico, S. A. de C. V.		San Lorenzo número 153-402	Benito Juárez	Ciudad de México	3100	México					
98	129	\N	Ing. Jorge De la Madrid Virgen		MAVJ411101JXA	Ing. Jorge De la Madrid Virgen		Canal de Miramonetes 30	Tlalpan	Ciudad de México	14370	México					
75	46	\N	Instituto Nacional de Administración Pública, A.C.		INA-770420-DW1	Instituto Nacional de Administración Pública, A.C.		Kilometro 14.5 de la Carretera Libre México Toluca núemro 2151	Cuajimalpa 	Ciudad de México	5110	México					
73	44	\N	Comisión Federal de Electricidad		CFE370814Q10	Comisión Federal de Electricidad		Insurgentes Sur No 1971, Torre IV, Piso 6	Guadalupe Inn	Álvaro Obregón	1020	México					
87	52	\N	Elements Studios, S. C.		EST040414KP6	Elements Studios, S. C.		Calle Sacramento número 305, Insurgentes San Borja	Ciudad de México	Benito Juarez	03220	México					
78	48	\N	INGENIEROS CIVILES ASOCIADOS, S.A. DE C.V.		ICA850812MV0	INGENIEROS CIVILES ASOCIADOS, S.A. DE C.V.		Avenida Manuel Ávila Camacho número 36, Piso 5	Miguel Hidalgo	Ciudad de México	11000	México					
82	81	\N	Omega Construcciones Industriales, S. A. de C. V.,		OCI820920II7	Omega Construcciones Industriales, S. A. de C. V.,		Cordillera de los Andes número 310	Lomas de Chapultepec	México D.F., Miguel Hidalgo	11000	México					
84	81	\N	Construcciones y Dragados del Sureste, S. A. de C. V.		CDS970212MV3	Construcciones y Dragados del Sureste, S. A. de C. V.											
80	49	\N	NACO, NETHERLANDS AIRPORT CONSULTANTS, B. V.		NACO	SME850212FD0 TCO970614ML4		Boulevard Adolfo López Mateos 154	San Ángel	Álvaro Obregón	1000	México					
88	83	\N	RAGAMEX Constructores SA de CV		RCO010901MP3	RAGAMEX Constructores SA de CV		Peru 218A, América SUR	Oaxaca de Juárez	Oaxaca	68020	México					
96	84	\N	Supervisión y Control de Fauna, S.A. de C. V.		SCF0401286B1	Supervisión y Control de Fauna, S.A. de C. V.		Cda. De Arroyo #50 Int 4, Santiago Occipaco	Naucalpan de Juárez	México, México	53237	México					
99	130	\N	OMNIBUS Y TRANSPORTES TERRESTRES EJECUTIVOS, S.A. DE C.V.		OTT9504062X7	OMNIBUS Y TRANSPORTES TERRESTRES EJECUTIVOS, S.A. DE C.V.		Calzada Vallejo 705	Gustavo A. Madero	Ciudad de México	7750	México					
100	54	\N	Gustavo Adolfo Alanis Ortega		AAOG631022D68	Gustavo Adolfo Alanis Ortega		Av. Cap. Carlos León S/N interior 71, Peñón de los Baños	Venustiano Carranza	Ciudad de México	15520	México					
102	145	\N	FP - FREE S. DE R.L. DE C.V.		FPF1411048H7	FP - FREE S. DE R.L. DE C.V.		Paseo de la Reforma 412	Cuauhtémoc	Ciudad de México	6500	México					
103	55	\N	Alternativas Ejecutivas S.A. de C.V.		AEJ120403NI0	Alternativas Ejecutivas S.A. de C.V.		Yucatan 11 Depto. 9, colonia Roma	Cuahutemoc	Ciudad de México	06700	México					
104	146	\N	SODEXO MOTIVATION SOLUTIONS MEXICO, S.A.DE C.V.		PME811211B20	SODEXO MOTIVATION SOLUTIONS MEXICO, S.A.DE C.V.		Paseo de los Tamarindos 150 Edificio Arcos Norte D Piso 5 	Cuajimalpa	Ciudad de México	5120	México					
105	56	\N	José Luis Macazaga Lara		MALL590222RI8	José Luis Macazaga Lara		Medellín #194, Roma Norte	Cuauhtémoc	Ciudad de México	06700	México					
108	147	\N	Enrique Alcántara Gómez		AAGE3805205Q4	Enrique Alcántara Gómez		Agave 80	Coyoacán	Ciudad de México	4890	México					
109	148	\N	SOLUCIONES AMBIENTALES FORTUNA, S.A DE C.V.		SAF10081736A	SOLUCIONES AMBIENTALES FORTUNA, S.A DE C.V.		Heliotropo 161	Cuauhtémoc	Ciudad de México	6450	México					
110	149	\N	C&L CAPITAL PARTNERS, S.A. DE C.V.		CAL091214CJ2	C&L CAPITAL PARTNERS, S.A. DE C.V.		Bosque de Ciruelos 160 piso 6 B	Miguel Hidalgo	Ciudad de México	11700	México					
111	150	\N	Integradores de Tecnologia, S.A. de C.V.		ITE9701222Q9	Integradores de Tecnologia, S.A. de C.V.		Camino al Desierto de los Leones #35 	Alvaro Obregón	Ciudad de México	1000	México					
112	151	\N	INSTITUTO MEXICANO DE AUDITORÍA TÉCNICA, A.C.		IMA941216HE8	INSTITUTO MEXICANO DE AUDITORÍA TÉCNICA, A.C.		San Lorenzo 153 interior 602	Benito Juárez	Ciudad de México	3100	México					
114	153	\N	Axtel, S.A.B. de C.V.		AXT940727FP8	Axtel, S.A.B. de C.V.		Paseo de la reforma 265 piso 6.	Cuauhtémoc	Ciudad de México	06500	México					
115	154	\N	ALAN MAURICIO RAMÍREZ GRANIEL		RAGA8807022R4	ALAN MAURICIO RAMÍREZ GRANIEL		Real del Rosario Lote 401	Pachuca de Soto	Hidalgo	42086	México					
116	175	\N	GLOBAL TELECOMUNICATION GROUP, S.A. DE R.L. DE C.V.		GTG020819JS3	GLOBAL TELECOMUNICATION GROUP, S.A. DE R.L. DE C.V.		Calle 17 sur 4526	Puebla	Puebla	72430	México					
117	175	\N	DESINGS AND INTELIGENT MATERIALS, S.A. DE R.L. DE C.V.		DIM051128A83	DESINGS AND INTELIGENT MATERIALS, S.A. DE R.L. DE C.V.		Adolfo Prieto 1653, int.2-6	Benito Juárez	Ciudad de México	03100	México					
118	176	\N	Lauman S.A. de C.V.		LAU0002028R1	Lauman S.A. de C.V.		Santa Bárbara 15	Benito Juárez	Ciudad de México	3100	México					
119	177	\N	LAUMAN SA DE CV		LAU0002028R1	LAUMAN SA DE CV		Santa Barbara 15	Benito Juárez	Ciudad de México	3100	México					
120	57	\N	Consorcio de Servicios Jurídicos Monsalvo, S.C.		CSJ130426GT9	Consorcio de Servicios Jurídicos Monsalvo, S.C.		Pitágoras 903, Col. Del Valle	Benito Juárez	Ciudad de México	03100	México					
121	178	\N	Soluciones Integrales VDV y Telecomunicaciones, S.A. de C.V.		SIV010329E53	Soluciones Integrales VDV y Telecomunicaciones, S.A. de C.V.		Calle Alvaro Obregon no. 188	Cuauhtémoc	Ciudad de México	6700	México					
122	58	\N	RAFAEL MARTINEZ RAMIREZ		MARR890304IA9	RAFAEL MARTINEZ RAMIREZ		Santa Inés # 12, Santa Inés	Azcapotzalco	Ciudad de México	02140	México					
123	179	\N	Servidesca México, S.A. de C.V.		SME040527947	Servidesca México, S.A. de C.V.		Calle Paseo de Tamarindos 90 Edificio Torre II 8	Cuajimalpa	Ciudad de México	5120	México					
124	59	\N	Agencia de Desarrollo Rural Martelli, S. C. de R. L. M.I.		ADR120111NV2	Agencia de Desarrollo Rural Martelli, S. C. de R. L. M.I.		Insurgentes 46, Col. Irolo	Tepeapulco	Hidalgo	43991	México					
125	180	\N	COMTE, S.A. de C.V.		COM0100313SU8	COMTE, S.A. de C.V.		Guillermo Gonzalez Camarena no. 600	Cuajimalpa	Ciudad de México	1210	México					
126	181	\N	Calapa Construcciones, S. A.		CCO1200211E18	Calapa Construcciones, S. A.		Izquitecatl #125	Coyoacán	Ciudad de México	04630	México					
127	182	\N	TELEFONOS DE MEXICO SAB DE CV		TME840315-KT6	TELEFONOS DE MEXICO SAB DE CV		Parque Vía 198	Cuauhtémoc	Ciudad de México	6500	México					
129	191	\N	Comisión Federal de Electricidad a través de la Gerncia de Estudios de Ingeniería Civil		CFE370814Q10	Comisión Federal de Electricidad		Calle Augusto Rodín No. 265, colonia nochebuena	Benito Juárez	Ciudad de México	03720	México					
130	35	\N	ESPECIALISTAS AMBIENTALES, S.A. DE C.V.		EAM9803104K0	ESPECIALISTAS AMBIENTALES, S.A. DE C.V.		Camino al Olivo 15 interior 301, Lomas de Vista Hermosa	Cuajimalpa de Morelos	Distrito Federal	05100	México					
134	36	\N	Especialistas  Ambientales, S.A. de C.V.		EAM9803104KO	Especialistas  Ambientales, S.A. de C.V.		Camino al Olivo Número15 Interior 301, Lomas de Vista Hermosa	Cuajimalpa	Ciudad de México	05100	México					
135	193	\N	Paola Olivares Montes		OIMP801127IZ6	Paola Olivares Montes		Joya 15, colonia tepepan	Xochimilco	Ciudad de México	16020	México					
136	195	\N	Lauman S.A. de C.V.		LAU0002028R1	Lauman S.A. de C.V.		Santa Bárbara 15, colonia Del Valle	Benito Juarez	Ciudad de México	03100	México					
138	196	\N	ZURICH FINANZAS MÉXICO, S.A. DE C.V.		ZAM131014HV0	ZURICH FINANZAS MÉXICO, S.A. DE C.V.											
139	197	\N	Coconal S. A. P. I. de C. V.		COC000315HY4	Coconal S. A. P. I. de C. V.		Periferico sur número 4249, piso 3, Jardines en la Montaña	Tlalpan	Ciudad de México	14210	México					
140	45	\N	Instituto Mexicano de Administarción Pública A.C.		INA-770420-DW1	Instituto Mexicano de Administarción Pública A.C.											
144	38	\N	Instituto Politecnico Nacional		FIC000330LK9	Instituto Politecnico Nacional		Avenida Luis Enrique Erro SN, Unidad Profesional Adolfo López Mateos, Col, Zacatenco	Gustavo A. Madero	Ciudad de México	07738	México					
148	131	\N	OMNIBUS Y TRANSPORTES TERRESTRES EJECUTIVOS, S.A. DE C.V.		OTT9504062X7	OMNIBUS Y TRANSPORTES TERRESTRES EJECUTIVOS, S.A. DE C.V.		Calzada Vallejo 705, Nueva Vallejo	Gustavo A. Madero	Distrito Federal	07750	México					
150	132	\N	Rocher Ingeniería, S.A. de C.V.		RIN040823510	Rocher Ingeniería, S.A. de C.V.		Vía Láctea No 51, Prado Churubusco	Coyoacán	Ciudad de México	04230	México					
151	133	\N	OMNIBUS Y TRANSPORTES TERRESTRES EJECUTIVOS, S.A. DE C.V.		OTT9504062X7	OMNIBUS Y TRANSPORTES TERRESTRES EJECUTIVOS, S.A. DE C.V.		Calzada Vallejo número 705, Nueva Vallejo	Gustavo A. Madero	Ciudad de México	07750	México					
153	141	\N	Servicios de Ingeniería, Edificación y Construcción Pesada, S.A. de C.V.		SSI9906288E6	Servicios de Ingeniería, Edificación y Construcción Pesada, S.A. de C.V.		Peten 292, Narvarte Oriente	Benito Juárez	Ciudad de México	3023	México					
154	135	\N	Banca MIFEL, S.A.		BMF020529L22	Banca MIFEL, S.A.		Av. Periférico Sur No. 4118, Jardines del Pedregal	Álvaro Obregón	Ciudad de México	01900	México					
155	136	\N	Muñoz Manzo y Ocampo, s.c.		MMO060307LY5	Muñoz Manzo y Ocampo, s.c.		Av Sta Fe No. 495 Int 603, Cruz Manca	Cuajimalpa de Morelos	Ciudad de México	05349	México					
156	142	\N	SERVICIOS FORESTALES DE HIDALGO, SERFORH, S.C.		SFH080118R25	SERVICIOS FORESTALES DE HIDALGO, SERFORH, S.C.		Fraccionamiento Las Peras, Mineral de la Reforma	Hidalgo	México	42183	México					
157	137	\N	IDT EN SISTEMAS DE INFORMACION S.A. DE C.V.		ISI02115AFA	IDT EN SISTEMAS DE INFORMACION S.A. DE C.V.		Avenida Hidalgo 1 10, Santiago Tepalcapa	Cuautitlan Izcalli	Estado de México	54743	México					
160	138	\N	Vázquez Nava y Consultores, S.C.		VNC9501168D8	Vázquez Nava y Consultores, S.C.		Paseo de las Palmas 1005, Lomas de Chapultepec sección 1	Miguel Hidalgo	Ciudad de México	11000	México					
161	139	\N	VÁZQUEZ NAVA Y CONSULTORES, S.C.		VNC9501168D8	VÁZQUEZ NAVA Y CONSULTORES, S.C.		Paseo de las Palmas, número 1005, Lomas de Chapultepec, Sección I	Miguel Hidalgo	Distrito Federal	11000	México					
163	143	\N	INE S.A. de C.V.		INE9509226VA	INE S.A. de C.V.		Coscomate número 89, Toriello Guerra 	Tlalpan	Ciudad de México	14050	México					
164	155	\N	Servicio de Protección Federal		SPF130103BF7	Servicio de Protección Federal		Miguel Angel de Quevedo número 915, El Rosedal	Coyoacan	Distrito Federal	04330	México					
166	156	\N	Instituto Mexicano de Auditoría Técnica, A. C.		IMA941216HE8	Instituto Mexicano de Auditoría Técnica, A. C.		San Lorenzo no. 153 - 602, Colonia Del Valle	Benito Juárez	Ciudad de México	03100	México					
167	157	\N	Jose Genaro Ruiz Gómez		RUGG460126GF2	Jose Genaro Ruiz Gómez		Rinconada Colonial ED Lima 003, Pedregal de Carrasco	Coyoacan	Ciudad de México	04700	México					
168	158	\N	Instituto Mexicano de Auditoría Técnica, A. C.		IMA941216HE8	Instituto Mexicano de Auditoría Técnica, A. C.		Av. San Lázaro #153, despacho 602, Colonia Del Valle	Benito Juárez	Ciudad de México	03100	México					
170	159	\N	Cimentaciones Mexicanas, S. A. de C. V.		CME841114A61	Cimentaciones Mexicanas, S. A. de C. V.		Avenida Paseo de la refoerma número 300, piso 13, Juarez	Cuauhtemoc	Ciudad de México	06600	México					
172	160	\N	C. RIGOBERTO GARCÍA HERNÁNDEZ		GAHR8404021M1	C. RIGOBERTO GARCÍA HERNÁNDEZ		Prolongación Allende S/N, Santa Maria Nativitas	Texcoco	Mexico	56200	México					
173	161	\N	Constructo Mexicana de Infraestructura, S. A.		CCM100601NEA	Constructo Mexicana de Infraestructura, S. A.		Pensilvania 26, int. 501, Nápoles	Benito Juárez	Ciudad de México	09810	México					
175	162	\N	Servicios, Tecnología y Organización S.A. de C.V.		STO-020301-G28	Servicios, Tecnología y Organización S.A. de C.V.		Sierra Mojada 620 Oficina 402, Lomas de Chapultepec	Miguel Hidalgo	Distrito Federal	11000	México					
180	164	\N	Instituto Mexicano del Transporte		SCT8501018I9	Instituto Mexicano del Transporte		km 12 de la carretera estatal número 431 "El Colorado, Galindo"	Pedro Escobedo	Queretaro	76703	México					
143	166	\N	Sistemas Integrales de Gestión Ambiental, S.C.		SIG9806044B1	Sistemas Integrales de Gestión Ambiental, S.C.		Poseidón 40	Benito Juárez	Ciudad de México	3940	México					
147	40	\N	COMISIÓN NACIONAL DEL AGUA		CONAGUA	COMISIÓN NACIONAL DEL AGUA		Avenida Insurgentes Sur No. 2616, Copilco El Bajo	Coyoacán	Ciudad de México	04340	México					
141	165	\N	ESPECIALISTAS AMBIENTALES, S.A. DE C.V.		EAM9803104K0	ESPECIALISTAS AMBIENTALES, S.A. DE C.V.		Camino al Olivo 15 interior 301	Cuajimalpa de Morelos	Ciudad de México	5100	México					
149	168	\N	Supervisión, Coordinación y Construcción  de Obras, S.A. de C.V.		SCC8602079E2	Supervisión, Coordinación y Construcción  de Obras, S.A. de C.V.		Camelia Número 233	Alvaro Obregón	Ciudad de México	1030	México					
159	169	\N	Ing. Carlos Enrique Ortega Mora		OEMC500117HDFRRR03	Ing. Carlos Enrique Ortega Mora		Maximino Ávil Camacho No. 77-B, 605	Benito Juárez	Ciudad de México	03710	México					
162	170	\N	Portabaños 2000, S. A. de C. V.		PBD000118DD3	Portabaños 2000, S. A. de C. V.		Benito Juárez 276	Iztapalapa	Ciudad de México	9890	México					
158	169	\N	Ing. Carlos Enrique Ortega Mora		OEMC500117HDFRRR03	Ing. Carlos Enrique Ortega Mora		Maximino Ávil Camacho No. 77-B, 605	Benito Juárez	Ciudad de México	03710						
165	171	\N	Grupo de Ingeniería en Consultoría y Obras S. A. de C. V.		GIC9008132I9	Grupo de Ingeniería en Consultoría y Obras S. A. de C. V.		Calzada de Tlalpan no. 4911 bis	Tlalpan	Ciudad de México	14000	México					
174	174	\N	Servicio de Protección Federal		SPF130103BF7 	Servicio de Protección Federal		Miguel Angel de Quevedo número 915	Coyoacán	Ciudad de México	4330	México					
171	173	\N	FONDO DE INVESTIGACIÓN CIENTÍFICA Y DESARROLLO TECNOLOGICO DEL INSTITUTO POLITECNICO NACIONAL		FIC000330LK9	FONDO DE INVESTIGACIÓN CIENTÍFICA Y DESARROLLO TECNOLOGICO DEL INSTITUTO POLITECNICO NACIONAL		Avenida Universidad No 1200	Benito Juárez	Ciudad de México	03339						
182	184	\N	Sistema Público de Radiodifusión del Estado de México		OPM100331UG5	Sistema Público de Radiodifusión del Estado de México		Hamburgo 182-A, Juárez	Cuauhtémoc	Ciudad de México	06600	México					
183	185	\N	Enrique Alcántara Gómez		AAGE3805205Q4	Enrique Alcántara Gómez		Agave 80, Jardines de Coyoacán	Coyoacán	Ciudad de México	04890	México					
184	186	\N	PORTA BAÑOS 2000, S.A. DE C.V.		PBD000118DD3	PORTA BAÑOS 2000, S.A. DE C.V.		Benito Juárez 276, San Antonio Culhuacán	Iztapalapa	Distrito Federal	09800	México					
185	187	\N	H&L Consultoras Asociadas S.A. de C.V.		H&L001219R14	H&L Consultoras Asociadas S.A. de C.V.		Montecito No. 38 piso 1 Local 10, Nápoles	Benito Juárez	México D.F.	03810	México					
186	188	\N	GONZÁLEZ NAVARRO SANDRA		GON800826AVA	GONZÁLEZ NAVARRO SANDRA		Nueva Suiza 10, Jardines de Reforma	Cuernavaca	Morelos 	62260	México					
187	189	\N	ARMANDO EMILIO MERLO BLAKE		MEBA380605PQ3	ARMANDO EMILIO MERLO BLAKE		AV. CONSTITUYENTES 1076 CASA 1, Lomas Altas	Miguel Hidalgo	Cuidad de Mexico	11950	México					
188	190	\N	Metro NET S.A.P.I. de C.V.		MNE960503876	Metro NET S.A.P.I. de C.V.		Michoacán 22B, Hipódromo	Distrito Federal	México D.F.	06100	México					
189	37	\N	Nacional Fiananciera Sociedad Nacional de Credito, Institución de Banca de Desarrollo		NFI340630-5T0	Nacional Fiananciera Sociedad Nacional de Credito, Institución de Banca de Desarrollo		Avenida Insurgentes Sur número 1971, Torre IV, Piso 6, Guadalupe Inn	Álvaro Obregón	Distrito Federal 	01020	México					
190	109	\N	Consultoría, Supervisión Técnica y Operación en Sistemas, S. A. de C. V.		CST890605C72	Consultoría, Supervisión Técnica y Operación en Sistemas, S. A. de C. V.		Emperadores número 46	Benito Juárez	Ciudad de México	3570	México					
193	105	\N	Liberty Desarrollos S.A. de C.V.		LDE040324GC2	Liberty Desarrollos S.A. de C.V.		2a Angel Rico smz-7 mz-14 It-57 U.H.	Iztapalapa	Ciudad de México	9200	México					
194	106	\N	ARGU ASESORES EN CAPITAL HUMANO S.C.		AAC030703TC0	ARGU ASESORES EN CAPITAL HUMANO S.C.		Calle Pico de Verapaz 435, Torre Cima PH2	Tlalpan	Ciudad de México	14210	México					
195	107	\N	IF CULTURA, S.A. DE C.V.		ICU130220KMO	IF CULTURA, S.A. DE C.V.		Real de los Reyes 1666	Coyoacán	Ciudad de México	94330	México					
196	108	\N	Construcciones Aldesem S. A. de C. V.		CAL070605NA9	Construcciones Aldesem S. A. de C. V.		Calle Mississippi no. 49 piso 7	Cuauhtémoc	Ciudad de México	06500	México					
197	208	\N	Parkauto S.A. de C.V.		PAU070322DGA	Parkauto S.A. de C.V.		Rey Cuahutemoc 31	Alvaro Obregón	Ciudad de México	31902	México					
199	203	\N	Comisión Federal de Electricidad		CFE370814Q10	Comisión Federal de Electricidad											
200	210	\N	Banca MIFEL, S.A.		BMF020529L22	Banca MIFEL, S.A.		Av. Periférico Sur No. 4118	Álvaro Obregón	Ciudad de México	1900	México					
201	204	\N	Comisión Nacional del Agua		CONAGUA	Comisión Nacional del Agua		Av. Insurgentes Sur 2416, Copilco el Bajo	Coyoacán	Ciudad de México	04340	México					
202	205	\N	RADIOMOVIL DIPSA SA DE CV		RDI841003QJ4	RADIOMOVIL DIPSA SA DE CV		Lago Zurich 245, Ampliación Granada	Miguel Hidalgo	Ciudad de México	11529	México					
205	207	\N	ARGU ASESORES EN CAPITAL HUMANO S.C.		AAC030703TC0	ARGU ASESORES EN CAPITAL HUMANO S.C.		Calle Pico de Verapaz 435, Torre Cima PH2, Jardines en la Montaña	Tlalpan	Ciudad de México	14210	México					
208	213	\N	Integradores de Tecnologia, S.A. de C.V.		ITE9701222Q9	Integradores de Tecnologia, S.A. de C.V.		Camino al Desierto de los Leones #35 	Álvaro Obregón	Ciudad de México	1000	México					
209	214	\N	Sistema Público de Radiodifusión del Estado de México		OPM100331UG5	Sistema Público de Radiodifusión del Estado de México		Hamburgo 182-A	Cuauhtémoc	Ciudad de México	6600	México					
210	215	\N	LAUMAN SA DE CV		LAU0002028R1	LAUMAN SA DE CV		Santa Barbara 15	Benito Juárez	Ciudad de México	3100	México					
211	216	\N	CUESTA Y LLACA, S.C.		CLA980911IYA	CUESTA Y LLACA, S.C.		Avenida san Jerónimo número 369, Torre 1, Piso 2-C	Alvaro Obregón	Ciudad de México	1090	México					
212	217	\N	UNIVERSIDAD AUTÓNOMA DE NUEVO LEÓN		UAN691126MK2	UNIVERSIDAD AUTÓNOMA DE NUEVO LEÓN		Avenida Universidad S/N	San Nicolás de los Garza	Nuevo León	66455	México					
213	41	\N	Jefatura de Policia Industrial del Estado de México y/o Cuerpo de Guardias de Seguridad Industrial Bancaria Y Comercial del Valle de Cuautitlán Texcoco		JPI480202UU7	Jefatura de Policia Industrial del Estado de México y/o Cuerpo de Guardias de Seguridad Industrial Bancaria Y Comercial del Valle de Cuautitlán Texcoco		Prolongación Galeana No. 28, La Loma México,	Cuautitlán Izcalli	Estado de México	54060	México					
42	77	\N	Fondo de Investigación Científica y Desarrollo Tecnológico del Instituto Politécnico Nacional		FIC000330LK9	Fondo de Investigación Científica y Desarrollo Tecnológico del Instituto Politécnico Nacional		Avenida Universidad No. 1200	Xoco	Benito Juárez 	03339	México					
44	77	\N	Fondo de Investigación Científica y Desarrollo Tecnológico del Instituto Politécnico Nacional		FIC000330LK9	Fondo de Investigación Científica y Desarrollo Tecnológico del Instituto Politécnico Nacional		Avenida Universidad No. 1200	Xoco	Benito Juárez 	03339	México					
207	202	\N	Salvador Gómez		GOMS630930NY5	Salvador Gómez		 Francia número131, casa 5	Alvaro Obregón	Ciudad de México	1030	México					
206	201	\N	GONZÁLEZ NAVARRO SANDRA		GON800826AVA	GONZÁLEZ NAVARRO SANDRA		Nueva Suiza 10	Jardines de Reforma	Morelos	62260	México					
204	200	\N	Ing. Víctor Baez		BAPV591211H53	Ing. Víctor Baez											
216	221	\N	Aeropuertos y Servicios Auxiliares		ASA6506102U9	Aeropuertos y Servicios Auxiliares		Avenida 602 número 161 	Venustiano Carranza	Ciudad de México	15620	México					
76	47	\N	Aeropuertos y Servicios Auxiliares		ASA6506102U9	Aeropuertos y Servicios Auxiliares		Avenida 602 número 161 	Zona Federal Aeropuerto Internacional de la Ciudad de México. 	Ciudad de México	15620	México					
203	199	\N	C. Arturo García Celio		Arturo_Garcia_Celio	C. Arturo García Celio		Privanza Niza, #308 26	San Pedro Garza	Nuevo León	66278	México					
198	209	\N	M. C. Enrique Álvari Tamez		Enrique_Alvari_Tamez	M. C. Enrique Álvari Tamez		Av. Explanada 1615	Miguel Hidalgo	Ciudad de México	11000	México					
128	60	\N	Luxmart Futura S.A. de C.V.		Luxmart	Luxmart Futura S.A. de C.V.		Avenida Constituyentes No. 41, San Miguel Chapultepec	Miguel Hidalgo	Ciudad de México	01090	México					
18	5	\N	Ing. Gabriel Cuadri de la Torre	QUTG540804EP4	Gabriel_Cuadri_de_la_Torre	Ing. Gabriel Cuadri de la Torre		Cerro Dios de Hacha número 42	Coyoacán	Ciudad de México	4350	México					
\.


--
-- Name: supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('supplier_id_seq', 217, true);


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
84	84	830152	Plan de Monitoreo y Conservación de Aves del Proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México	Plan de Monitoreo y Conservación de Aves del Proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México	active	0		29000000	MXN	Licitación pública	Artículo 27, segundo párrafo de la Ley de Obras Públicas y Servicios Relacionados con las Mismas	Puntos y porcentajes	Capítulo 2.13 de la Convocatoria a la Licitación Pública Nacional No. LO-009KDH999-N46-2015 para los trabajos de Plan de monitoreo y conservación de aves del Nuevo Aeropuerto Internacional de la Ciudad de México  (ver anexo)	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 12:00 horas del 29 de junio de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Ángel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Gerente de Concursos de GACM. 	2015-06-29 00:00:00	\N	\N	\N	0	Capítulo 2.10 y 2.11 de la  Convocatoria a la Licitación Pública Nacional No. LO-009KDH999-N46-2015 para los trabajos de Plan de monitoreo y conservación de aves del Nuevo Aeropuerto Internacional de la Ciudad de México   (ver anexo)	2015-07-03 00:00:00	\N	3	\N	
83	83	824118	Implementación del Programa de Rescate de Flora y Fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México	Implementación del Programa de Rescate de Flora y Fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México	active	0	0	18500000	MXN	Licitación pública	Artículo 27, segundo párrafo de la Ley de Obras Públicas y Servicios Relacionados con las Mismas	Mecaninsmo binario	Capítulo 2.13 de la Convocatoria a la Licitación Pública Nacional No. LO-009KDH999-N42-2015 para la Implementación del Programa de Rescate de Flora y Fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México(ver anexo)	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 14:00 horas del 29 de junio de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Gerente de Concursos de GACM. 	2015-06-29 00:00:00	2015-06-29 00:00:00	\N	\N	0	Capítulo 2.10 y 2.11 de la Convocatoria a la Licitación Pública Nacional No. LO-009KDH999-N42-2015 para la Implementación del Programa de Rescate de Flora y Fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México (ver anexo)	2016-07-16 00:00:00	\N	4	\N	
88	88	717913	Extracción de ademes y restitución del terreno que ocupan dichos elementos ubicados en la poligonal para el Nuevo Aeropuerto Internacional de la Cuidad de México.	Extracción de ademes y restitución del terreno que ocupan dichos elementos ubicados en la poligonal para el Nuevo Aeropuerto Internacional de la Cuidad de México.	active	0		54520000	MXN	Licitación pública	Artículos 27, fracción I, 30 fracción I, 38 y 45 fracción I de la LOPSRM; y 63 fracción I, del ROPSRM	Ponderación de puntos (Puntos y porcentajes)	Capítulo 2.13 y 2.14 de la Convocatoria para la Licitación Pública Nacional Presencial No. LO-009KDH999-N5-2014, para los trabajos relativos a la Extracción de ademes y restitución del terreno que ocupan dichos elementos ubicados en la poligonal para el Nuevo Aeropuerto Internacional de la Cuidad de México	Presencial	El acto de presentación y apetura de proposiciones se llevó a cabo el 15 de diciembre de 2014, en la sala de juntas de la Gerencia de Concursos de la Subdirección de Contrataciones, ubicada en: Av. Insurgentes Sur 2453, segundo piso, Torre Murano, Col. Tizapán San Ánge, del. Álvaro Obregón, México, D. F., c. p. 01090.	2015-12-15 00:00:00	\N	2015-12-03 00:00:00	2015-12-05 00:00:00	1	Capítulo 2.10 y 2.11 de la Convocatoria para la Licitación Pública Nacional Presencial No. LO-009KDH999-N5-2014, para los trabajos relativos a la Extracción de ademes y restitución del terreno que ocupan dichos elementos ubicados en la poligonal para el Nuevo Aeropuerto Internacional de la Cuidad de México	2015-12-12 00:00:00	\N	8	\N	
61	61	839816	Programa general de abastecimiento, uso y disposición de agua del nuevo Aeropuerto Internacional de la Ciudad de México (PROAGUA), Etapa I	Programa general de abastecimiento, uso y disposición de agua del nuevo Aeropuerto Internacional de la Ciudad de México (PROAGUA), Etapa I	complete	0		9500000.00	MXN	Invitación a cuando menos tres personas	Artículo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas 	Mecanismo Binario	Apartado 2.14 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N34-2015 del 7 de mayo de 2015 (ver anexo)	Presencial		2015-07-10 00:00:00	\N	2015-07-01 00:00:00	2015-07-01 00:00:00	0		\N	\N	4	\N	
41	41	No aplica	Servicio de Seguridad para Salvaguardar la vida e integridad física de los trabajadores, la protección de la infraestructura, inmuebles y zonas federales concesionados a la entidad	Servicio de Seguridad para Salvaguardar la vida e integridad física de los trabajadores, la protección de la infraestructura, inmuebles y zonas federales concesionados a la entidad	complete	0		28800000	MXN	Adjudicación directa	Artículo 1 de la LOPSRM			Presencial		\N	\N	\N	\N	0		\N	\N	1	\N	
46	46	-	-	-	none	0	MXN	0		Adjudicación directa	Artículo 1 de la LAASSP	Nacional		transferencia		\N	\N	\N	\N	0		\N	\N	1	\N	
142	142	900950	Control, Prevención e identificación de plagas en el Polígono del NAICM	Control, Prevención e identificación de plagas en el Polígono del NAICM	active	0		1750000	MXN	Invitación a cuando menos tres personas	Artículo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas 	Mecanismo Binario	Apartado 2.13 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N75-2015 del 15 de septiembre de 2015 (ver anexo)	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 18:00 horas del 21 de septiembre de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Gerente de concursos de la Subdirección de Contrataciones de GACM	\N	\N	2015-09-21 00:00:00	2015-09-21 00:00:00	0		\N	\N	2	\N	
39	39	-			complete	0		0		Convenio de colaboración	Artículo 1 de la LOPSRM					\N	\N	\N	\N	0		\N	\N	1	\N	
49	49	-			none	0		0		Invitación a cuando menos tres personas						\N	\N	\N	\N	0		\N	\N	1	\N	
90	90	790388	Construcción de accesos y plataformas para exploración geotécnica para la pista número 2 del Nuevo Aeropuerto Internacional de la Ciudad de México.	Construcción de accesos y plataformas para exploración geotécnica para la pista número 2 del Nuevo Aeropuerto Internacional de la Ciudad de México.	active	0		10400000	MXN	Licitación pública	Artículos 27, fracción I, 30 fracción I, 38 y 45 fracción I de la LOPSRM y 63 fracción I del RLOPSRM.	Mecanismo binario	Capítulos 2.13 y 2.14 de la Convocatoria para la Licitación Pública Nacional Presencial No. No.  LO-009KDH999-N20-2015, aplicando el mecanismo binario para la Construcción de accesos y plataformas para exploración geotécnica para la pista No. 2 del Nuevo Aeropuerto Internacional de la Ciudad de México	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 18:00 horas del 20 de abril de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Subdirector de Contrataciones de GACM. 	2015-04-20 00:00:00	\N	2015-04-08 00:00:00	2015-04-10 00:00:00	1	Capítulos 2.10 y 2.11 de la Convocatoria para la Licitación Pública Nacional Presencial No. No.  LO-009KDH999-N20-2015, aplicando el mecanismo binario para la Construcción de accesos y plataformas para exploración geotécnica para la pista No. 2 del Nuevo Aeropuerto Internacional de la Ciudad de México	2015-04-23 00:00:00	\N	12	\N	
91	91	1029560	Servicio de Transporte de personas en autobuses y de traslado de maquinaria y equipo en camionetas de redilas para el programa de empleo temporal.	Servicio de Transporte de personas en autobuses y de traslado de maquinaria y equipo en camionetas de redilas para el programa de empleo temporal.	active	0		12500000	MXN	Licitación pública	Articulos 25, 26, fracciión I, 26 Bis, fraección I, 28, fracción I,29, 36, 36 bis, 37, 46 y 47 de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público, y 35 y 39 de su Reglamento.	Mecanismo binario	Capitulo 9.- De la Licitación Pública Nacional No. LA-009KDH999-E29-2016, 	Presencial	El día 22 de abril de 2016 y de conformidad con el numeral 1.4.3.1 del Manual de Organización de la empresa de participación estatal mayoritaria,, yel numeral 5.1 de sus Pobalines, el Gerente de Concursos de GACM, presidió el acto de presentación y apertura de proposiciones, de las cuales, sólo 1 es consorcio.	2016-04-22 00:00:00	\N	2016-04-15 00:00:00	2016-04-15 00:00:00	1	Capitulo 4.-De la Licitación Pública Nacional No. LA-009KDH999-E29-2016,  	2016-04-25 00:00:00	\N	3	\N	
92	92	781926	Estudio mediante el cual se definan las características técnicas de infraestructura y diseño esquemático de la terminal de carga del Nuevo Aeropuerto Internacional de la Ciudad de México.	Estudio mediante el cual se definan las características técnicas de infraestructura y diseño esquemático de la terminal de carga del Nuevo Aeropuerto Internacional de la Ciudad de México.	active	0		16000000	MXN	Licitación pública	Artículos 27 fracción I, 30 fracción II, y 45 fracción II de la LOPSRM.	Ponderación de puntos (Puntos y porcentajes)	Capítulos 2.13 y 2.14 de la Convocatoria de licitación pública internacional presencial, bajo la cobertura de tratados identificada con el número LO-009KDH999-T15-2015, para llevar a cabo el “Estudio mediante el cual se definan las características técnicas de infraestructura y diseño esquemático de la terminal de carga del Nuevo Aeropuerto Internacional de la Ciudad de México”, publicada en compraNet el día 25 de marzo del 2015.	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 10:00 horas del 30 de abril de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Subdirector de Contrataciones de GACM. 	2015-04-30 00:00:00	\N	2015-04-08 00:00:00	2015-04-08 00:00:00	1	Capítulos 2.10 y 2.11 de la Convocatoria de licitación pública internacional presencial, bajo la cobertura de tratados identificada con el número LO-009KDH999-T15-2015, para llevar a cabo el “Estudio mediante el cual se definan las características técnicas de infraestructura y diseño esquemático de la terminal de carga del Nuevo Aeropuerto Internacional de la Ciudad de México”, publicada en compraNet el día 25 de marzo del 2015.	2015-04-22 00:00:00	\N	3	\N	
93	93	842194	Diseñar e instrumentar el modelo virtual de información para la construcción (BIM) del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	Diseñar e instrumentar el modelo virtual de información para la construcción (BIM) del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	active	0		121700000	MXN	Licitación pública	Articulos 27 fracción I, 30 fracción II y 45 fracción I de la LOPSRM.	Ponderación de puntos (Puntos y porcentajes)	Capítulo 2.9 y 2.10 de la Convocatoria a la Licitación Pública Internacional, Bajo los tratados de Libre Comercio, Presencial, N° IO-009KDH999-T52-2015, para: Diseñar e Instrumentar el modelo virtual de Información para la Construcción (BIM) del Nuevo Aeropuerto Internacional, con fecha de 28 de mayo de 2015. Publicada en compraNet el 29 de junio de 2016.	Presencial	El acta de presentación y apertura de las propuestas se llevó a cabo el 14 de agosto de 2015 a las 12:00, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Subdirector de Contrataciones de GACM. 	2016-07-17 00:00:00	2015-08-14 00:00:00	2015-07-23 00:00:00	2015-07-28 00:00:00	1	Capítulo 2.12 y 2.13 de la Convocatoria a la Licitación Pública Internacional, Bajo los tratados de Libre Comercio, Presencial, N° IO-009KDH999-T52-2015, para: Diseñar e Instrumentar el modelo virtual de Información para la Construcción (BIM) del Nuevo Aeropuerto Internacional, con fecha de 28 de mayo de 2015. Publicada en compraNet el 29 de junio de 2016.	2015-07-01 00:00:00	\N	5	\N	
207	207	-	Servicios especializados en el suministro de personal tercerizados.	Contratacion de Personal tercerizado	complete	0		129391633	MXN	Adjudicación directa	Artículos 41 Fracción III, 43 último párrafo y 47 de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público					\N	\N	\N	\N	0		\N	\N	1	\N	
110	110	943233	Supervisión Técnica, Administrativa y de Control de calidad para los Trabajos de Construcción de los Caminos Provisionales de Acceso al Nuevo Aeropuerto Internacional de la Ciudad de México.	Supervisión Técnica, Administrativa y de Control de calidad para los Trabajos de Construcción de los Caminos Provisionales de Acceso al Nuevo Aeropuerto Internacional de la Ciudad de México.	active	0		20000000.00	MXN	Licitación pública	Articulos 27, fracción I, 30, fracción I, y 45, fracción I, de la Ley de Obras Públicas y Servcios Relacionados con las Mismas.  	Articulos 27, fracción I, 30, fracción I, y 45, fracción I, de la Ley de Obras Públicas y Servcios Relacionados con las Mismas.  		Nacional		\N	\N	2015-11-27 00:00:00	2015-12-02 00:00:00	0		2015-12-16 00:00:00	\N	24	\N	
75	75	-	-	-	none	0	-	0	-	Convenio de colaboración	Artículo 1 de la LOPSRM					\N	\N	\N	\N	0		\N	\N	1	\N	
74	74	-			complete	0		0		Convenio de colaboración	Artículo 1 de la LOPSRM					\N	\N	\N	\N	0		\N	\N	1	\N	
78	78	-	-	-	none	0	MXN	0		Adjudicación directa	Artículo 1 de la LOPSRM	Nacional				\N	\N	\N	\N	0		\N	\N	1	\N	
62	62	811716	Proyecto Ejecutivo para la Construcción del Camino perimetral y sus instalaciones complementarias en el lado Norte del Polígono del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	Proyecto Ejecutivo para la Construcción del Camino perimetral y sus instalaciones complementarias en el lado Norte del Polígono del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	complete	0		7000000	MXN	Invitación a cuando menos tres personas	Artículo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas 	Mecanismo Binario	Apartado 2.13 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N34-2015 del 7 de mayo de 2015 (ver anexo)	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 12:00 horas del 22 de mayo de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Gerente de concursos de la Subdirección de Contrataciones de GACM	2015-05-22 00:00:00	\N	2015-05-15 00:00:00	2015-05-15 00:00:00	1	Apartado 2.13 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N34-2015 del 7 de mayo de 2015, relacionado con el “Proyecto Ejecutivo para la Construcción del Camino Perimetral y sus Instalaciones Complementarias en el lado Norte del Polígono de NAICM, es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 8 de mayo de 2015.	2015-05-29 00:00:00	\N	5	\N	
98	98	843692	Servicios relacionados con el programa de empleo temporal (pet) correspondiente a las acciones preparatorias para la construcción del nuevo aeropuerto internacional de la Ciudad de México (servicio de traslado de personas, en vehìculos ligeros) 	Servicios relacionados con el programa de empleo temporal (pet) correspondiente a las acciones preparatorias para la construcción del nuevo aeropuerto internacional de la Ciudad de México (servicio de traslado de personas, en vehìculos ligeros) 	active	0		8500000	MXN	Invitación a cuando menos tres personas	Artículo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas 	No aplica	No aplica	No aplica	No aplica	\N	\N	\N	\N	0	No aplica	\N	\N	0	\N	
63	63	799484	Estudio e instalaciones complementarias para el de las características topográficas del terreno del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	Estudio e instalaciones complementarias para el de las características topográficas del terreno del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	active	0		39000000	MXN	Invitación a cuando menos tres personas	Artículo 42 fracción XI de la Ley de Obras Públicas y servicios Relacionados con las Mismas	Ponderación de puntos (Puntos y porcentajes)	Convocatoria por invitación Nacional a cuando menos tres personas No. IO-009KDH999-N41-2015 para los trabajos relativos a  "Estudio e instalaciones complementarias para el de las características topográficas del terreno del Nuevo Aeropuerto Internacional de la Ciudad de México" emitida el 29 de mayo de 2015	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 18:00 horas del 30 de junio de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Subdirector de Contrataciones de GACM.   Se presentaron las siguientes propuestas: 1. Grupo Metropolitano en Ingeniería, S.A. de C.V.: $36,069,282.43 2. Consorcio IUYET, S.A. de C.V.: $33,577,144.97 3. Consultoría Integral en Ingeniería, S.A. de C.V.: $34,839,194.00 4. Torral, S.A. de C.V.: $15,080,350.61 5. INESPROC, S.A. de C.V.: $39,194,614.00 6. Participación Conjunta: $35,470,530.70 - Visión Construcciones de México, S.A. de C.V. - Servicios Integrales de Calidad en la construcción civil, S.A. de C.V.  7. Construcciones, Mantenimiento y Proyectos Romaco, S.A. de C.V.: $25,520,534.66	2015-06-30 00:00:00	\N	2015-06-08 00:00:00	2015-06-08 00:00:00	0		\N	\N	7	\N	
64	64	781926	Estudio mediante el cual se definan las características técnicas de infraestructura y diseño esquemático de la terminal de carga del Nuevo Aeropuerto Internacional de la Ciudad de México.	Estudio mediante el cual se definan las características técnicas de infraestructura y diseño esquemático de la terminal de carga del Nuevo Aeropuerto Internacional de la Ciudad de México.	complete	0		16000000	MXN	Licitación pública	Artículos 27 fracción I, 30 fracción II, y 45 fracción II de la LOPSRM.	Ponderación de puntos (Puntos y porcentajes)	Capítulos 2.13 y 2.14 de la Convocatoria de licitación pública internacional presencial, bajo la cobertura de tratados identificada con el número LO-009KDH999-T15-2015, para llevar a cabo el “Estudio mediante el cual se definan las características técnicas de infraestructura y diseño esquemático de la terminal de carga del Nuevo Aeropuerto Internacional de la Ciudad de México”, publicada en compraNet el día 25 de marzo del 2015.	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 10:00 horas del 30 de abril de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Subdirector de Contrataciones de GACM. 	2015-04-30 00:00:00	\N	2015-04-08 00:00:00	2015-04-08 00:00:00	1	Convocatoria de licitación pública internacional presencial, bajo la cobertura de tratados identificada con el número LO-009KDH999-T15-2015, para llevar a cabo el “Estudio mediante el cual se definan las características técnicas de infraestructura y diseño esquemático de la terminal de carga del Nuevo Aeropuerto Internacional de la Ciudad de México”, publicada en compraNet el día 25 de marzo del 2015.	\N	\N	3	\N	
123	123	1038888	Servicios de Auditoria Externa para Dictaminar los Estados Financieros y Presupuestales del Ejercicio Fiscal 2015.	Servicios de Auditoria Externa para Dictaminar los Estados Financieros y Presupuestales del Ejercicio Fiscal 2015.	active	0		169027.08	MXN	Invitación a cuando menos tres personas	Artículo 42 y 47 de la LAASSP.	Artículo 42 y 47 de la LAASSP.		Nacional		\N	\N	\N	\N	0		\N	\N	0	\N	
210	210	No aplica			none	0		500498	MXN	Adjudicación directa	Numeral 152 del acuerdo por el que se establecen las disposiciones en Materia de recursos Materiales y servicios Generales					\N	\N	\N	\N	0		\N	\N	1	\N	
86	86	911935	Construcción de los caminos provisionales de acceso al Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM) ejecutando trabajos de terracería, estructuras y obrad de drenaje, pavimentación y señalamiento.	Construcción de los caminos provisionales de acceso al Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM) ejecutando trabajos de terracería, estructuras y obrad de drenaje, pavimentación y señalamiento.	active	0		1203803000	MXN	Licitación pública	Articulos 27, fracción I, 30, fracción I, y 45, fracción I, de la Ley de Obras Públicas y Servcios Relacionados con las Mismas.  	Puntos y porcentajes	Capitulo 2-De la Licitación (numeral 2.14) de la Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N80-2015 de fecha 29 de septiembre de 2015.	Presencial	El día 13 de noviembre del 2015 y de conformidad con los artículos 33, 36 y 37 de la LOPSRM y 59, 60 y 61 del RLOPSRM, el Subdirector de Contrataciones del GACM, preside el acto de presentación y apertura de propuestas económicas, de las cuales, 47 son consorcios.	2015-11-13 00:00:00	\N	2015-10-09 00:00:00	2016-11-05 00:00:00	1	Capitulo 2-De la Licitación de la Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N80-2015 de fecha 29 de septiembre de 2015.	2015-10-30 00:00:00	\N	48	\N	
128	128	1008580	Supervisión de la Construcción del Drenaje Pluvial Temporal del Nuevo Aeropuerto Internacional de la Ciudad de México	Supervisión de la Construcción del Drenaje Pluvial Temporal del Nuevo Aeropuerto Internacional de la Ciudad de México	active	0		9300000.00	MXN	Invitación a cuando menos tres personas	Articulos 27, fracción II, 30, fracción I, 36, 37, 38, 39 y 45, fracción I, de la Ley de Obras Públicas y Servcios Relacionados con las Mismas.  	Articulos 27, fracción II, 30, fracción I, 36, 37, 38, 39 y 45, fracción I, de la Ley de Obras Públicas y Servcios Relacionados con las Mismas.  		Nacional		\N	\N	2015-09-29 00:00:00	2015-09-29 00:00:00	0		\N	\N	2	\N	
60	60	867412	el  Plan de Integración Ejidal para el Nuevo Aeropuerto Internacional de la Ciudad de México 	el  Plan de Integración Ejidal para el Nuevo Aeropuerto Internacional de la Ciudad de México 	complete	0		15200000	MXN	Invitación a cuando menos tres personas		Binario		Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 14:00 horas del 06 de agosto de 2015, en la sala de juntas de la Subdirección de Contrataciones  ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Gerente de concursos de la Subdirección de Contrataciones de GACM	\N	\N	2015-08-06 00:00:00	2015-08-06 00:00:00	1	4  de la Convocatoria N° IA-009KDH999-N57-2015 el  Plan de Integración Ejidal para el Nuevo Aeropuerto Internacional de la Ciudad de México 	\N	\N	2	\N	
96	96	799484	Estudio e instalaciones complementarias para el de las características topográficas del terreno del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	Estudio e instalaciones complementarias para el de las características topográficas del terreno del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	active	0		39000000	MXN	Invitación a cuando menos tres personas	Artículo 42 fracción XI de la Ley de Obras Públicas y servicios Relacionados con las Mismas	Mecaninsmo binario	Apartado 5.4 de la Convocatoria (ver anexo)	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 18:00 horas del 30 de junio de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Subdirector de Contrataciones de GACM.   Se presentaron las siguientes propuestas: 1. Grupo Metropolitano en Ingeniería, S.A. de C.V.: $36,069,282.43 2. Consorcio IUYET, S.A. de C.V.: $33,577,144.97 3. Consultoría Integral en Ingeniería, S.A. de C.V.: $34,839,194.00 4. Torral, S.A. de C.V.: $15,080,350.61 5. INESPROC, S.A. de C.V.: $39,194,614.00 6. Participación Conjunta: $35,470,530.70 - Visión Construcciones de México, S.A. de C.V. - Servicios Integrales de Calidad en la construcción civil, S.A. de C.V.  7. Construcciones, Mantenimiento y Proyectos Romaco, S.A. de C.V.: $25,520,534.66	2015-06-30 00:00:00	\N	2015-06-08 00:00:00	2015-06-23 00:00:00	1	Apartado 5.1 de la Convocatoria (ver anexo)	2015-06-17 00:00:00	\N	7	\N	
65	65	970678	Estudio de Ingeniería Geomática para el Proyecto Pistas, Plataformas, Calles de Rodaje y Edificios del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM), para Generar un modelo Digital de Terreno (MDT) a Través de la Tecnología HIGH Definition Surveying (HDS), Empleando Equipos GNSS, Escáner Láser y Ecosonda 	Estudio de Ingeniería Geomática para el Proyecto Pistas, Plataformas, Calles de Rodaje y Edificios del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM), para Generar un modelo Digital de Terreno (MDT) a Través de la Tecnología HIGH Definition Surveying (HDS), Empleando Equipos GNSS, Escáner Láser y Ecosonda 	complete	0		50000000	MXN	Licitación pública	Artículos 27, fracción I, 30 fracción I, y 45 fracción I de la LOPSRM	Ponderación de puntos (Puntos y porcentajes)	Capítulo 2.13 y 2.14 de la convocatoria para la Licitación Pública Nacional Presencial No. LO-009KDH999-E94-2015, para los trabajos relativos al Estudio de Ingeniería Geomática para el Proyecto Pistas, Plataformas, Calles de Rodaje y Edificios del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM), para Generar un modelo Digital de Terreno (MDT) a Través de la Tecnología HIGH Definition Surveying (HDS), Empleando Equipos GNSS, Escáner Láser y Ecosonda ., publicada en compranet el 17 de Diciembre de 2015.	Presencial	Convocatoria para la Licitación Pública Nacional Presencial No. LO-009KDH999-E94-2015,para los trabajos relativos al Estudio de Ingeniería Geomática para el Proyecto Pistas, Plataformas, Calles de Rodaje y Edificios del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM), para Generar un modelo Digital de Terreno (MDT) a Través de la Tecnología HIGH Definition Surveying (HDS), Empleando Equipos GNSS, Escáner Láser y Ecosonda ., publicada en compranet el 17 de Diciembre de 2015.	\N	\N	2016-01-12 00:00:00	2016-01-22 00:00:00	1		\N	\N	7	\N	
137	137	IO-009KDH999-N14-2015	Servicio integral de administración de personal y proceso de nomina, mediante un sistema especializado para recursos humanos y de nómina de gobierno	Obtener un Servicio integral de administración de personal y proceso de nomina, mediante un sistema especializado para recursos humanos y de nómina de gobierno	complete	0	MXN	1802640.00	MXN	Invitación a cuando menos tres personas	En cumplimiento a lo dispuesto en por los artículos 126 y 134  de la Constitución Política de los Estados Unidos Mexicanos, asi como por los artículos 25 primer párrafo, 26 fracción II, , 26 bis fracción II, 27, 28 fracción I, 29 y 43 y demas disposiciones aplicables a las que establece la ley (LAASSP), asi como lo establecido en el Reglamento de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público.					\N	\N	\N	\N	0		\N	\N	3	\N	
120	120	AA-009KDH999-E19-2016	Servicios Especializados en el suministro de personal técnico y administrativo para proyectos de infraestructura aeroportuaria	Contratacion de Personal tercerizado	active	0		726064480.49	MXN	Adjudicación directa	Artículos 41 Fracción III, de la LAASSP y 72 fracción III de su reglamento.	Artículos 41 Fracción III, de la LAASSP y 72 fracción III de su reglamento.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
97	97	799522	Asesoria Legal en materia de Derecho de la Aviación, Derecho Aeropuertario, Derecho Internacional y Especializado en Asesoría en Negociación con Empresas Nacionales e Internacionales, en general acompañamiento respecto de todo aquel Procedimiento Jurídico de las distintas materias que reconoce nuestro Sistema Jurídico Mexicano.	Asesoria Legal en materia de Derecho de la Aviación, Derecho Aeropuertario, Derecho Internacional y Especializado en Asesoría en Negociación con Empresas Nacionales e Internacionales, en general acompañamiento respecto de todo aquel Procedimiento Jurídico de las distintas materias que reconoce nuestro Sistema Jurídico Mexicano.	active	0		15000000	MXN	Invitación a cuando menos tres personas	Artículo 40, 41, fracción X, 43 y 46, segundo párrafo de la LAASSP. 	Mecaninsmo binario	Apartados 5, 5.1, 5.2, 5.3, 5.3.1 y 5.4 de la Invitación Nacional a cuando Menos Tres Personas Presencial identificado con el número IO-009KDH999-N30-2015 del 10 de abril de 2015, relacionado con el “Servicio de: Asesoria Legal en materia de Derecho de la Aviación, Derecho Aeropuertario, Derecho Internacional y Especializado en Asesoría en Negociación con Empresas Nacionales e Internacionales, en general acompañamiento respecto de todo aquel Procedimiento Jurídico de las distintas materias que reconoce nuestro Sistema Jurídico Mexicano".	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 10:00 horas del 05 de mayo de 2015, en la sala de juntas ubicada en la Subdirección de Contrataciones ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Gerente de Concursos de la Subdirección de Contrataciones de GACM	2016-07-17 00:00:00	\N	\N	\N	1	Apartados 4, 4.1, 6, 6.1 y 6.2 de la Invitación Nacional a cuando Menos Tres Personas Presencial identificado con el número IO-009KDH999-N30-2015 del 10 de abril de 2015, relacionado con el “Servicio de: Asesoria Legal en materia de Derecho de la Aviación, Derecho Aeropuertario, Derecho Internacional y Especializado en Asesoría en Negociación con Empresas Nacionales e Internacionales, en general acompañamiento respecto de todo aquel Procedimiento Jurídico de las distintas materias que reconoce nuestro Sistema Jurídico Mexicano".	\N	\N	3	\N	
66	66	787229	Estudio de Suministro Electrico para el Nuevo Aeropuerto Internacional de la Ciudad de México	Estudio de Suministro Electrico para el Nuevo Aeropuerto Internacional de la Ciudad de México	complete	0		11000000	MXN	Licitación pública	Articulos 27, fracción II, 30, fracción II, 36, 37, 38, 39, 41, 43, 44  y 45, fracción I, de la Ley de Obras Públicas y Servcios Relacionados con las Mismas.  	Puntos y porcentajes	Capitulo 2 -De la Licitación de la Convocatoria de la Licitación Pública Nacional No. LO-009KDH999-N16-2015.	Presencial	El día 16 de abril del 2015 y de conformidad con los artículos 36 y 37 de la LOPSRM y 59 y 60 del RLOPSRM, el Subdirector de Contrataciones del GACM, preside el acto de presentación y apertura de propuestas económicas, de las cuales, 1 es consorcio. De acuerdo con el artículo 37 de la LOPSRM, se reciben las proposiciones para su evaluación cualitativa y de acuerdo a ello se convoca para el día 24 de abril de 2015, para conocer el fallo correspondiente.	\N	\N	2015-04-08 00:00:00	2015-04-08 00:00:00	1	Capitulo 2 -De la Licitación de la Convocatoria de la Licitación Pública Nacional No. LO-009KDH999-N16-2015, de fecha 24 de marzo de 2015 y que se público en CompraNet el día 26 de marzo del 2015.	\N	\N	2	\N	
100	100	799505	Servicios de Consultoría Técnica Especializada en Revisión e Integración de Términos de Referencia y Especificaciones Técnicas, de Proyectos de Licitación de Obras Públicas	Servicios de Consultoría Técnica Especializada en Revisión e Integración de Términos de Referencia y Especificaciones Técnicas, de Proyectos de Licitación de Obras Públicas	active	0		14655172.41	MXN	Invitación a cuando menos tres personas	Artículo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas 	Mecanismo binario	Apartado 2.13 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N29-2015 del 20 de abril de 2015 (ver anexo)	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 18:00 horas del 04 de mayo de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Gerente de concursos de la Subdirección de Contrataciones de GACM	2015-05-04 00:00:00	\N	2015-04-23 00:00:00	2015-04-23 00:00:00	1	Apartado 2.1, 2.2 y 2.10 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N29-2015 del 20 de abril de 2015 (ver anexo) 	2015-05-12 00:00:00	\N	2	\N	
53	53	DCAGI/SC/68/2015	Servicios en el seguimiento, representación y defensa en juicio, presentes en materia laboral. 	Servicios en el seguimiento, representación y defensa en juicio, presentes en materia laboral. 	complete	420000	MXN	420000	MXN	Adjudicación directa	Artículo 42 de la LAASSP			Presencial		\N	\N	\N	\N	0		\N	\N	1	\N	
194	194	971462	Servicios de asesoría, relacionados con la implemntación de la estructura de gobierno coporativo para la administración del GACM.	Servicios de asesoría, relacionados con la implemntación de la estructura de gobierno coporativo para la administración del GACM.	complete	0		0		Adjudicación directa	Artículo 42 de la Ley  de Adquisiciones, Arrendamientos y Servicios del Sector Público.	Puntos y porcentajes	Numeral 2.13 y 2.14 de la convocatoria para la invitación a cuando menos tres personas.	Presencial	Acta de presentación y apertura de proposiciones del 20 de enero de 2016 realizada en la sala de juntas del GACM en Avenida Insurgentes sur 2453, segundo piso, torre Murano, Colonia Tizapán San Ángel, Del. Álvaro Obregón, México, C.P. 01090	2016-01-22 00:00:00	\N	2016-01-14 00:00:00	2016-01-14 00:00:00	1	Numeral 2.10 y 2.11 de la convocatoria para la invitación a cuando menos tres personas.	\N	\N	3	\N	
95	95	865741	Invitación a cuando menos tres personas No. IO-009KDH999-N54-2015, para el servicio: "Supervisión para: Construcción del proyecto integral consistente en barda y camino perimetral, alumbrado, servicios inducidos y casetas de acceso para el NAICM (PRIMERA ETAPA)."	Supervisión para: Construcción del proyecto integral consistente en barda y camino perimetral, alumbrado, servicios inducidos y casetas de acceso para el NAICM (PRIMERA ETAPA)	active	0		4000000	MXN	Invitación a cuando menos tres personas	Artículos 27, fracción II, 30, fracción I, 36, 37, 38, 39 y 45, fracción I, de la Ley de Obras Públicas y Servicios Relacionados con las Misma.	Mecaninsmo binario	Capitulo 2-De la invitación a cuando menos tres personas (numerales 2.13 y 2.14) de la invitación a cuando menos tres personas No. IO-009KDH999-N54-2015, aplicando el mecanismo de evaluación binario, carácter nacional, publicada en compranet el 3 de agosto de 2015.	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 18:00 horas del 11 de agosto de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Subdirector de Contrataciones de GACM. 	2015-08-11 00:00:00	\N	2015-08-07 00:00:00	2015-08-07 00:00:00	1	Convocatoria de la Invitación a cuando menos tres personas No. IO-009KDH999-N54-2015, aplicando el mecanismo de evaluación binario, carácter nacional, publicada en compranet el 3 de agosto de 2015.	2015-08-14 00:00:00	\N	5	\N	
67	67	790372	Exploración geotécnica complementaria para el proyecto ejecutivo del sistema de drenaje temporal del Nuevo aeropuerto Internacional de la Ciudad de México, en el Ex Lago de Texcoco, Estado de México	Exploración geotécnica complementaria para el proyecto ejecutivo del sistema de drenaje temporal del Nuevo aeropuerto Internacional de la Ciudad de México, en el Ex Lago de Texcoco, Estado de México	none	0		2550000	MXN	Licitación pública	Articulos 27, fracción I, 30, fracción I,  36, 37, 38 39 y 45, fracción I, de la Ley de Obras Públicas y Servcios Relacionados con las Mismas.  	Mecanismo Binario	Apartado 2.10 y 2.11 de la Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N19-2015, de fecha 27 de marzo de 2015, aplicando el mecanismo binario. Publicada en CompraNet el día 30 de septiembre del 2015.	Presencial	El día 15 de abril  del 2015 y de conformidad con los artículos 33, 36 y 37 de la LOPSRM y 59, 60 y 61 del RLOPSRM, el Subdirector de Contrataciones del GACM, preside el acto de presentación y apertura de propuestas económicas. De acuerdo con el artículo 37 de la LOPSRM, se reciben las proposiciones para su evaluación cualitativa y de acuerdo a ello se convoca para el día 22 de abril de 2015, para conocer el fallo correspondiente.	2015-04-22 00:00:00	\N	2015-04-04 00:00:00	2015-04-04 00:00:00	1	Apartado 2.13 y 2.14 de la Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N19-2015, de fecha 27 de marzo de 2015, aplicando el mecanismo binario. Las bases se publicaron en CompraNet el día 30 de septiembre del 2015.	\N	\N	6	\N	
164	164	-			complete	0	MXN	0	MXN	Adjudicación directa	Artículo 1 de la LOPSRM					\N	\N	\N	\N	0		\N	\N	1	\N	
68	68	830617	Implementación del plan de restauración ecológica para el Nuevo Aeropuerto Internacional de la Ciudad de México.	Implementación del plan de restauración ecológica para el Nuevo Aeropuerto Internacional de la Ciudad de México.	active	0		26000000	MXN	Licitación pública	Artículos 27, fracción I, 30, fracción I, 36, 37, 38, 39 y 45, fracción I, de la Ley de Obras Públicas y Servicios Relaciondos con las Mismas	Ponderación de puntos (Puntos y porcentajes)	Capitulo 2-Licitación Pública Nacional (numerales 2.13 y 2.14) de la Convocatoria a la Licitación Pública Nacional No. LO-009KDH999-N45-2015, para llevar a cabo los trabajos de “Implementación del plan de restauración ecológica para el Nuevo Aeropuerto Internacional de la Ciudad de México”, aplicando el mecanismo de evaluación de puntos y porcentajes, publicada en compraNet el día 12 de junio del 2015.	Presencial	 El acto de presentación y apertura de proposiciones se llevó a cabo a las 18:00 horas del 29 de junio de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Gerente de Concursos de la Subdirección de  Contrataciones de GACM. 	2015-06-19 00:00:00	\N	2015-06-19 00:00:00	2015-06-19 00:00:00	0		2015-07-03 00:00:00	\N	4	\N	
69	69	830152	Plan de Monitoreo y Conservación de Aves del Proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México	Plan de Monitoreo y Conservación de Aves del Proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México	complete	0		29000000	MXN	Licitación pública	Artículo 27, segundo párrafo de la Ley de Obras Públicas y Servicios Relacionados con las Mismas	Puntos y porcentajes	Capítulo 2.13 de la Convocatoria a la Licitación Pública Nacional No. LO-009KDH999-N46-2015 para los trabajos de Plan de monitoreo y conservación de aves del Nuevo Aeropuerto Internacional de la Ciudad de México  (ver anexo)	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 12:00 horas del 29 de junio de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Ángel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Gerente de Concursos de GACM.  Se rubricaron los documentos técnicos T.2, T.3 y T.4 así como la documentación económica E-10 correspondiente a las 3 proposiciones presentadas.	2015-07-03 00:00:00	\N	2016-06-19 00:00:00	2015-06-19 00:00:00	1	Capítulo 2.10 y 2.11 de la  Convocatoria a la Licitación Pública Nacional No. LO-009KDH999-N46-2015 para los trabajos de Plan de monitoreo y conservación de aves del Nuevo Aeropuerto Internacional de la Ciudad de México   (ver anexo)	\N	\N	3	\N	
26	26	1024183	Supervisión del Proyecto Ejecutivo, Construcción, Equipamiento, Mobiliario e Instalaciones Complementarias para el Campamento del Grupo Aeropuertario de la Ciudad de México (GACM) en el sitio del Nuevo Aeropuerto Internacional de la Ciudad de México	Supervisión del Proyecto Ejecutivo, Construcción, Equipamiento, Mobiliario e Instalaciones Complementarias para el Campamento del Grupo Aeropuertario de la Ciudad de México (GACM) en el sitio del Nuevo Aeropuerto Internacional de la Ciudad de México	complete	0	MXN	5100000.00	MXN	Invitación a cuando menos tres personas	Articulos 27, fracción II, 30, fracción I, 36, 37, 38, 39 y 45, fracción I, de la Ley de Obras Públicas y Servcios Relacionados con las Mismas.	Capitulo 2 de la Convocatoria de la Invitación a cuando menos tres personas No. IO-009KDH999-N76-2015, de fecha 18 de septiembre de 2015 y que se publicó en CompraNet el día 24 de septiembre del 2015.	Capitulo 6, numeral 6.5, de la Convocatoria de la Invitación a cuando menos tres personas No. IO-009KDH999-N76-2015, de fecha 18 de septiembre de 2015 y que se publicó en CompraNet el día 24 de septiembre del 2015.	Presencial	El día 7 de octubre del 2015 y de conformidad con los artículos 36 y 37 de la LOPSRM y 59 y 60 del RLOPSRM, el Gerente de Concursos del GACM, preside el acto de presentación y apertura de propuestas económicas, de 6 licitantes que presentaron sus proposiciones. De acuerdo con el artículo 37 de la LOPSRM, se reciben las proposiciones para su evaluación cualitativa y de acuerdo a ello se convoca para el día 13 de octubre de 2015, para conocer el fallo correspondiente.	2015-10-07 00:00:00	\N	2015-09-29 00:00:00	2015-09-30 00:00:00	1	Capitulo 2 de la Convocatoria de la Invitación a cuando menos tres personas No. IO-009KDH999-N76-2015, de fecha 18 de septiembre de 2015 y que se publicó en CompraNet el día 24 de septiembre del 2015.	2015-10-09 00:00:00	\N	6	\N	
197	197	911933	Nivelación y limpieza del terreno del Nuevo Aeropuerto Internacional de la Ciudad de México	Nivelación y limpieza del terreno del Nuevo Aeropuerto Internacional de la Ciudad de México	complete	0		3950000000	MXN	Licitación pública	Articulos 27, fracción I, 30, fracción I, y 45, fracción I, de la Ley de Obras Públicas y Servcios Relacionados con las Mismas. 	Puntos y porcentajes		Presencial		\N	\N	2015-10-14 00:00:00	2015-10-29 00:00:00	0	Capitulo 2 -De la Licitación de la Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N79-2015.	\N	\N	31	\N	
27	27	801897	Prestacion de los servicos consistentes en la elaboración de estudios de geotécnia, topografia,  gedésia  y levantamiento de información geografica através de un vuelo con tecnología Lidar.	Prestación de los servicos consistentes en la elaboración de estudios de geotécnia, topografia,  gedésia  y levantamiento de información geografica através de un vuelo con tecnología Lidar.	complete	0	MXN	70000000.00	MXN	Adjudicación directa	Artículo 134 de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.					\N	\N	\N	\N	0		\N	\N	1	\N	
169	169	-	-		none	0		687931	MXN	Adjudicación directa						\N	\N	\N	\N	0		\N	\N	1	\N	
48	48	762007	Construcción de Caminos de Acceso a la Zona del Edificio Terminal de la Primera Etapa, necesarios para la caracterización Geotécnica Inicial	Construcción de Caminos de Acceso a la Zona del Edificio Terminal de la Primera Etapa, necesarios para la caracterización Geotécnica Inicial	complete	0		9500000	MXN	Invitación a cuando menos tres personas	Artículo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas 	Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N11-2015 del 12 de febrero de 2015, relacionado con la “Construcción de Caminos de Acceso a la Zona del Edificio Terminal de la Primera Etapa, necesarios para la caracterización Geotécnica Inicial", es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 12 de febrero de 2015.	Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N11-2015 del 12 de febrero de 2015, relacionado con la “Construcción de Caminos de Acceso a la Zona del Edificio Terminal de la Primera Etapa, necesarios para la caracterización Geotécnica Inicial", es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 12 de febrero de 2015.	transferencia		\N	\N	2015-02-18 00:00:00	2015-02-18 00:00:00	0	Apartado 2.1, 2.2 y 2.10 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número  IO-009KDH999-N11-2015 del 12 de febrero de 2015, relacionado con el “Construcción de Caminos de Acceso a la Zona del Edificio Terminal de la Primera Etapa, necesarios para la caracterización Geotécnica Inicial", es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 12 de febrero de 2015.	\N	\N	3	\N	
59	59	867226	Servicio de asesoría técnica y capacitación a 800 trabajadores del programa empleo temporal de mano de obra campesina o urbana marginada para los 7 ejidos colindantes al predio del NAICM.	Servicio de asesoría técnica y capacitación a 800 trabajadores del programa empleo temporal de mano de obra campesina o urbana marginada para los 7 ejidos colindantes al predio del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	complete	0		7400000	MXN	Invitación a cuando menos tres personas	Artículo 42 de la Ley de Adquisiciones, Arrendamiento y Servicios del Sector Público	Mecanismo Binario	Apartado 5 de la Ilnvitación Nacional a cuando Menos Tres Personas identificado con el número IA-009KDH999-N56-2015 del 9 de julio de 2015 (ver anexo)	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 10:00 horas del 10 de agosto de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Gerente de concursos de la Subdirección de Contrataciones de GACM	2015-08-10 00:00:00	\N	2015-08-06 00:00:00	2015-08-06 00:00:00	1	Apartado 6 de la Ilnvitación Nacional a cuando Menos Tres Personas identificado con el número IA-009KDH999-N56-2015 del 9 de julio de 2015 (ver anexo)	\N	\N	3	\N	
136	136	971447	Servicios de Asesoria en Materia Fiscal para la Recuperacion de Saldos a favor de IVA e ISR, así mismo Asesoria Respecto al Cumplimiento de Tratados Internacionales para evitar la Doble Tributación	Servicios de Asesoria en Materia Fiscal para la Recuperacion de Saldos a favor de IVA e ISR, así mismo Asesoria Respecto al Cumplimiento de Tratados Internacionales para evitar la Doble Tributación	complete	0	MXN	21848600.00	MXN	Invitación a cuando menos tres personas	Artículo 43 de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.	Invitación Nacional a Cuando Menos Tres Personas No. IA-009KDH99-E95-2015 relativa al servicio: Servicios de Asesoria en Materia Fiscal; para la recuperación de Saldos a Favor de IVA e ISR, así mismo Asesoria respecto al Cumplimiento de Tratados Internacionales para evitar Doble Tributación. publicada en CompraNet el 11 de enero de 2016	Invitación Nacional a Cuando Menos Tres Personas No. IA-009KDH99-E95-2015 relativa al servicio: Servicios de Asesoria en Materia Fiscal; para la recuperación de Saldos a Favor de IVA e ISR, así mismo Asesoria respecto al Cumplimiento de Tratados Internacionales para evitar Doble Tributación. publicada en CompraNet el 11 de enero de 2016	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 17:00 horas del 21 de enero de 2016, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Ángel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Gerente de Concursos de GACM.	2016-01-28 00:00:00	\N	2016-01-14 00:00:00	2016-01-14 00:00:00	1	Capítulo 2.10 y 2.11 de la  Invitación Nacional a Cuando Menos Tres Personas No. IA-009KDH999-E95-2015 relativa a los Servicios de Asesoria en Materia Fiscal para la Recuperacion de Saldos a favor de IVA e ISR, así mismo Asesoria Respecto al Cumplimiento de Tratados Internacionales para evitar la Doble Tributación.  (ver anexo)	2016-01-21 00:00:00	\N	3	\N	
70	70	824118	Implementación del Programa de Rescate de Flora y Fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México	Implementación del Programa de Rescate de Flora y Fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México	complete	0		18500000	MXN	Licitación pública	Artículo 27, segundo párrafo de la Ley de Obras Públicas y Servicios Relacionados con las Mismas	Mecanismo Binario	Capítulo 2.13 de la Convocatoria a la Licitación Pública Nacional No. LO-009KDH999-N42-2015 para la Implementación del Programa de Rescate de Flora y Fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México(ver anexo)	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 14:00 horas del 29 de junio de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Gerente de Concursos de GACM.  Se rubricaron los documentos técnicos T.2, T.3 y T.4 así como la documentación económica E-10 correspondiente a las 4 proposiciones presentadas.	2015-06-26 00:00:00	\N	2015-06-18 00:00:00	2015-06-18 00:00:00	0	Capítulo 2.10 y 2.11 de la Convocatoria a la Licitación Pública Nacional No. LO-009KDH999-N42-2015 para la Implementación del Programa de Rescate de Flora y Fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México (ver anexo)	2015-07-03 00:00:00	\N	4	\N	
85	85	790372	Exploración geotécnica complementaria para el proyecto ejecutivo del sistema de drenaje temporal del Nuevo aeropuerto Internacional de la Ciudad de México, en el Ex Lago de Texcoco, Estado de México	Exploración geotécnica complementaria para el proyecto ejecutivo del sistema de drenaje temporal del Nuevo aeropuerto Internacional de la Ciudad de México, en el Ex Lago de Texcoco, Estado de México	active	0		2550000	MXN	Licitación pública	Articulos 27, fracción I, 30, fracción I,  36, 37, 38 39 y 45, fracción I, de la Ley de Obras Públicas y Servcios Relacionados con las Mismas.  	Puntos y porcentajes	El día 15 de abril  del 2015 y de conformidad con los artículos 33, 36 y 37 de la LOPSRM y 59, 60 y 61 del RLOPSRM, el Subdirector de Contrataciones del GACM, preside el acto de presentación y apertura de propuestas económicas.	Presencial	El día 15 de abril  del 2015 y de conformidad con los artículos 33, 36 y 37 de la LOPSRM y 59, 60 y 61 del RLOPSRM, el Subdirector de Contrataciones del GACM, preside el acto de presentación y apertura de propuestas económicas.	2015-04-22 00:00:00	\N	2015-04-07 00:00:00	2015-04-07 00:00:00	1	Apartado 2.14  de la Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N19-2015.	2016-07-16 00:00:00	2015-04-22 00:00:00	6	\N	
138	138	1018414	Servicios profesionales de consultoría, para el acompañamiento jurídico normativo y administrativo en la realización de las actividades para el desarrollo del Nuevo Aeropuerto Internacional de la Ciudad de México, así como para la elaboración del expediente concentrador integral	Servicios profesionales de consultoría, para el acompañamiento jurídico normativo y administrativo en la realización de las actividades para el desarrollo del Nuevo Aeropuerto Internacional de la Ciudad de México, así como para la elaboración del expediente concentrador integral	complete	0	MXN	85260000.00	MXN	Invitación a cuando menos tres personas	Artículo 41 fracción X de la Ley de Adquisiciones, Arrendamiento y Servicios del Sector Público	Apartados 2.10 y 2.11 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IA-009KDH999-E23-2016 del Servicios profesionales de consultoría, para el acompañamiento jurídico normativo y administrativo en la realización de las actividades para el desarrollo del Nuevo Aeropuerto Internacional de la Ciudad de México, así como para la elaboración del expediente concentrador integral, es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 10 de marzo de 2016.	Apartado 6.4 de la  Invitación Nacional a cuando Menos Tres Personas identificado con el número IA-009KDH999-E23-2016 del Servicios profesionales de consultoría, para el acompañamiento jurídico normativo y administrativo en la realización de las actividades para el desarrollo del Nuevo Aeropuerto Internacional de la Ciudad de México, así como para la elaboración del expediente concentrador integral, es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 10 de marzo de 2016.	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 18:00 horas del 16 de marzo de 2016, en la sala de juntas ubicada en Calzada Santa Catarina No. 267 Altavista, C.P. 01060, Ciudad de México. El acto fue presidido por el Gerente de Concursos de la Subdirección de Contrataciones de GACM	2016-03-16 00:00:00	\N	2016-03-11 00:00:00	2016-03-11 00:00:00	1	Apartado 2.10 y 2.11 de la Ilnvitación Nacional a cuando Menos Tres Personas identificado con el númeronúmero IA-009KDH999-E23-2016 de 9 de marzo de 2016 (ver anexo)	\N	\N	2	\N	
99	99	811716	Proyecto Ejecutivo para la Construcción del Camino perimetral y sus instalaciones complementarias en el lado Norte del Polígono del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	Proyecto Ejecutivo para la Construcción del Camino perimetral y sus instalaciones complementarias en el lado Norte del Polígono del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	active	0		7000000	MXN	Invitación a cuando menos tres personas	Artículo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas 	Mecanismo binario	Apartado 2.13 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N34-2015 del 7 de mayo de 2015 (ver anexo)	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 12:00 horas del 22 de mayo de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Gerente de concursos de la Subdirección de Contrataciones de GACM	2015-05-22 00:00:00	\N	2015-05-15 00:00:00	2015-05-15 00:00:00	1	Apartado 2.1, 2.2 y 2.10 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N34-2015 del 7 de mayo de 2015 (ver anexo) 	2015-05-29 00:00:00	\N	5	\N	
81	81	910393	Carga, acarreo y descarga fuera del polígono del material existente producto de depósitos de demoliciones, desperdicios y desazolve.	Carga, acarreo y descarga fuera del polígono del material existente producto de depósitos de demoliciones, desperdicios y desazolve.	active	0	0	770000000	MXN	Licitación pública	Articulos 27, fracción I, 30, fracción I, y 45, fracción I, de la Ley de Obras Públicas y Servcios Relacionados con las Mismas.  	Puntos y porcentajes	Capitulo 2-De la licitación (numeral 2.14) de la Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N78-2015, de fecha 24 de septiembre de 2015. Las bases se publicaron en CompraNet el día 29 de septiembre del 2015.	Presencial	El día 09 de noviembre del 2015 y de conformidad con los artículos 33, 36 y 37 de la LOPSRM y 59, 60 y 61 del RLOPSRM, el Subdirector de Contrataciones del GACM, preside el acto de presentación y apertura de propuestas económicas, de las cuales, 37 son consorcios. De acuerdo con el artículo 37 de la LOPSRM, se reciben las proposiciones para su evaluación cualitativa y de acuerdo a ello se convoca para el día 04 de diciembre de 2015, para conocer el fallo correspondiente.	\N	\N	\N	\N	0	Capitulo 2-De la licitación de la Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N78-2015, de fecha 24 de septiembre de 2015. Las bases se publicaron en CompraNet el día 29 de septiembre del 2015.	2015-10-22 00:00:00	2015-10-22 00:00:00	40	\N	
101	101	971461	Servicio de integración de la estrategia global y modelo de negocios para el Nuevo Aeropuerto Internacional de la Ciudad de México	Servicio de integración de la estrategia global y modelo de negocios para el Nuevo Aeropuerto Internacional de la Ciudad de México	active	0		122000000	MXN	Invitación a cuando menos tres personas	Artículo 27 fracción II y artículo 42 fracción XI de la Ley de Obras Públicas y Servicios Relacionados con las Mismas	Mecanismo de puntos y porcentajes	Capítulo 2.12 de la Invitación Internacional a Cuando Menos Tres Personas No. IO-009KDH999-E96-2015 relativa a la integración de la estrategia global y  modelo de negocios para el Nuevo Aeropuerto Internacional de la Ciudad de México (ver anexo)	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 11:00 horas del 22 de enero de 2016, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Ángel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Subdirector de Contrataciones de GACM.  Se rubricaron los documentos técnicos T.2 y T.3, así como la documentación económica E-10 correspondiente a las 3 proposiciones presentadas.	2016-02-22 00:00:00	\N	2016-01-19 00:00:00	2016-01-19 00:00:00	1	Capítulo 2.9 y 2.10 de la Convocatoria  Invitación Internacional a Cuando Menos Tres Personas No. IO-009KDH999-E96-2015 relativa a la integración de la estrategia global y  modelo de negocios para el Nuevo Aeropuerto Internacional de la Ciudad de México (ver anexo)	2016-02-26 00:00:00	\N	2	\N	
4	4	1	Servicio de Experto Revisor para el Panel de Hidráulica Aplicada a la Infraestructura Aeroportuaria	Servicio de Experto Revisor para el Panel de Hidráulica Aplicada a la Infraestructura Aeroportuaria	active	0		15650000	MXN	Adjudicación directa	Artículo 42, párrafo segundo y tercero de la Ley  de Adquisiciones, Arrendamientos y Servicios del Sector Público.	Artículo 42, párrafo segundo y tercero de la Ley  de Adquisiciones, Arrendamientos y Servicios del Sector Público.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
130	130	1	Servicio de traslado de personal en camiones turísticos con capacidad para 45 pasajeros como mínimo en dos turnos	Servicio de traslado de personal en camiones turísticos con capacidad para 45 pasajeros como mínimo en dos turnos	active	0		513600.00	MXN	Adjudicación directa	Art. 43 de la Ley de Obra Pública y Servicios Relacionados con las Mismas 	Art. 43 de la Ley de Obra Pública y Servicios Relacionados con las Mismas 		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
125	125	1	Sevicios de Regularización de la Información Relativa a la Auditoria Corporativa de Grupo Aeroportuario de la Ciudad de México, S.A. De C.V.	Prestación del Sevicios de Regularización de la Información Relativa a la Auditoria Corporativa de Grupo Aeroportuario de la Ciudad de México, S.A. De C.V.	active	0		389000.00	MXN	Adjudicación directa	Artículo 42 de la Ley  de Adquisiciones, Arrendamientos y Servicios Relacionados con las Mismas.	Artículo 42 de la Ley  de Adquisiciones, Arrendamientos y Servicios Relacionados con las Mismas.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
103	103	1005958	Servicios de consultoría de la autoridad verificadora del comisionamiento avanzado de LEED para el proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	Servicios de consultoría de la autoridad verificadora del comisionamiento avanzado de LEED para el proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	active	0		199984000	MXN	Invitación a cuando menos tres personas	Artículo 42 fraccion XI y 45 fracción II de la Ley de Obras Públicas y Servicios Relacionados con las Mismas	Mecanismo de puntos y porcentajes	Apartado 2.12 de la Invitación a cuando Menos Tres Personas Internacional bajo cobertura de tratados de libre comercio identificado con el número IO-009KDH999-E17-2016 del 22 de febrero de 2016, relacionado con los Servicios de consultoría de la autoridad verificadora del comisionamiento avanzado de LEED para el proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM), es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 22 de febrero de 2016	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 18:00 horas del 4 de marzo de 2016, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Encargado del Despacho de la Subdirección de Contrataciones de GACM	2016-04-03 00:00:00	\N	2016-02-25 00:00:00	2016-02-25 00:00:00	1	Apartado 2.9 y 2.10 de la Invitación a cuando Menos Tres Personas Internacional bajo cobertura de tratados de libre comercio identificado con el número IO-009KDH999-E17-2016 del 22 de febrero de 2016, (ver anexo)	2016-09-03 00:00:00	\N	4	\N	
82	82	830617	Implementación del plan de restauración ecológica para el Nuevo Aeropuerto Internacional de la Ciudad de México.	Implementación del plan de restauración ecológica para el Nuevo Aeropuerto Internacional de la Ciudad de México.	active	0	0	26000000	MSN	Licitación pública	Artículos 27, fracción I, 30, fracción I, 36, 37, 38, 39 y 45, fracción I, de la Ley de Obras Públicas y Servicios Relaciondos con las Mismas	Ponderación de puntos (Puntos y porcentajes)	Capitulo 2-Licitación Pública Nacional (numerales 2.13 y 2.14) de la Convocatoria a la Licitación Pública Nacional No. LO-009KDH999-N45-2015, para llevar a cabo los trabajos de “Implementación del plan de restauración ecológica para el Nuevo Aeropuerto Internacional de la Ciudad de México”, aplicando el mecanismo de evaluación de puntos y porcentajes, publicada en compraNet el día 12 de junio del 2015.	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 18:00 horas del 29 de junio de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Gerente de Concursos de la Subdirección de  Contrataciones de GACM. 	\N	\N	2015-06-19 00:00:00	2015-06-19 00:00:00	1	Capitulo 2-Licitación Pública Nacional de la Convocatoria a la Licitación Pública Nacional No. LO-009KDH999-N45-2015, para llevar a cabo los trabajos de “Implementación del plan de restauración ecológica para el Nuevo Aeropuerto Internacional de la Ciudad de México”, aplicando el mecanismo de evaluación de puntos y porcentajes, publicada en compraNet el día 12 de junio del 2015.	2015-07-03 00:00:00	2015-07-03 00:00:00	4	\N	
50	50	824149 	Elaboración del proyecto de terracerías de los caminos provisionales para la construcción del Nuevo Aeropuerto Internacional de la Ciudad de México	Elaboración del proyecto de terracerías de los caminos provisionales para la construcción del Nuevo Aeropuerto Internacional de la Ciudad de México	none	0		8200000	MXN	Invitación a cuando menos tres personas	Artículos 42 fracción XI y 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas.	Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N43-2015 del 6 de mayo de 2015, relacionado con el “Elaboración del pryecto de terracerías de los caminos provisionales para la construcción del Nuevo Aeropuerto Internacional de la Ciudad de México, es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 28 de mayo de 2015.	Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N43-2015 del 6 de mayo de 2015, relacionado con el “Elaboración del pryecto de terracerías de los caminos provisionales para la construcción del Nuevo Aeropuerto Internacional de la Ciudad de México, es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 28 de mayo de 2015.	transferencia		\N	\N	2015-06-04 00:00:00	2015-06-04 00:00:00	1	Apartado 2.10 y 2.11 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N43-2015 del 6 de mayo de 2015, relacionado con el “Elaboración del pryecto de terracerías de los caminos provisionales para la construcción del Nuevo Aeropuerto Internacional de la Ciudad de México, es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 28 de mayo de 2015.	\N	\N	5	\N	
10	10	1038638	Servicio para la Asistencia Técnica Especializada en Materia de Diseño Sísmico Estructural Aplicada a la Infraestructura Aeroportuaria	Servicio para la Asistencia Técnica Especializada en Materia de Diseño Sísmico Estructural Aplicada a la Infraestructura Aeroportuaria	active	0		0	MXN	Adjudicación directa	Artículo 42 fracción X de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.	Artículo 42 fracción X de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
11	11	1042111	Servicio para la Asistencia Técnica Especializada en Materia de Geotecnia y Cimentación Aplicada a la Infraestructura Aeroportuaria	Servicio para la Asistencia Técnica Especializada en Materia de Geotecnia y Cimentación Aplicada a la Infraestructura Aeroportuaria	active	0		15650000.00	MXN	Adjudicación directa	Artículo 42 fracción X de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.	Artículo 42 fracción X de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
56	56	SA-009KDH999-N65-2015	Adquisición de bienes consistentes en vestuario	El objeto del presente contrato es la adquisición de bienes muebles, en adelante "LOS BIENES" por parte de GACM, consistentes en: "VESTUARIO"	none	0		2355000	MXN	Adjudicación directa	El artículo 134, tercer párrafo de la Constitución Política de los Estados Unidos Méxicanos y del artículo 42 de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público					\N	\N	\N	\N	0		\N	\N	1	\N	
104	104	722742	Arrendamiento de Mobiliario Para Las Instalaciones De Torre Murano	Contar con las instalaciones adecuadas para el desarrollo de las actividades del personal de GACM, asi como para las reuniones de trabajo internas y externas	active	0		2735071.2	MXN	Invitación a cuando menos tres personas	Art. 42 y 43 de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público.	Invitación Nacional a cuando Menos Tres Personas identificado con el número IA-009KDH999-N8-2014 del 26 de noviembre de 2014, relacionado con la contratación del "Servicio de arrendamiento de bienes muebles para las instalaciones de Torre Murano", es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 26 de noviembre de 2014.	Invitación Nacional a cuando Menos Tres Personas identificado con el número IA-009KDH999-N8-2014 del 26 de noviembre de 2014, relacionado con la contratación del "Servicio de arrendamiento de bienes muebles para las instalaciones de Torre Murano", es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 26 de noviembre de 2014.	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 14:00 horas del 04 de diciembre de 2014, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Gerente de concursos de la Subdirección de Contrataciones de GACM	2015-04-12 00:00:00	\N	2014-12-05 00:00:00	\N	1	Invitación Nacional a cuando Menos Tres Personas identificado con el número IA-009KDH999-N8-2014 del 26 de noviembre de 2014, relacionado con la contratación del "Servicio de arrendamiento de bienes muebles para las instalaciones de Torre Murano", es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 26 de noviembre de 2014.	2014-12-05 00:00:00	\N	3	\N	
105	105	IA-009KDH999-N7-2014	Servicios de Adaptación y Adecuaciones en Instalaciones de Torre Murano 	Prestar a GACM los servicios para la Adaptación y adecuaciones en las Instalaciones de Torre Murano. 	active	0		1852058.2	MXN	Invitación a cuando menos tres personas	Artículo 42 y 43 de la Ley de Adquisiciones, Arrendamientos  y Servicios del Sector Público	Mecanismo binario	No aplica	No aplica	No aplica	\N	\N	2014-12-02 00:00:00	2014-12-02 00:00:00	1	No aplica	\N	\N	3	\N	
206	206	996706	Construcción de accesos y plataformas para exploración geotécnica, rehabilitación de tramos de prueba y bacheo somero de caminos existentes dentro del terreno par el Nuevo Aeropuerto Internacional de la Ciudad de México	Construcción de accesos y plataformas para exploración geotécnica, rehabilitación de tramos de prueba y bacheo somero de caminos existentes dentro del terreno par el Nuevo Aeropuerto Internacional de la Ciudad de México	none	0		1276500	MXN	Invitación a cuando menos tres personas	Artículo 27 fracción II y artículo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas	Mecanismo Binario	Capítulo 2.13 y 2.14 de la    Invitación Nacional a Cuando Menos Tres Personas No. IO-009KDH999-E15-2016 relativa a la Construcción de accesos y plataformas para exploración geotécnica, rehabilitación de tramos de prueba y bacheo somero de caminos existentes dentro del terreno para el Nuevo Aeropuerto Internacional de la Ciudad de México  (ver anexo)	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 18:00 horas del 25 de febrero de 2016, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Ángel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Subdirector de Contrataciones de GACM.  Se rubricaron los documentos técnicos T.2 y T.3, así como la documentación económica E-10 correspondiente a las 4 proposiciones presentadas.	\N	\N	2016-02-16 00:00:00	2016-02-16 00:00:00	1	Capítulo 2.10 y 2.11 de la  Invitación Nacional a Cuando Menos Tres Personas No. IO-009KDH999-E15-2016 relativa a la Construcción de accesos y plataformas para exploración geotécnica, rehabilitación de tramos de prueba y bacheo somero de caminos existentes dentro del terreno para el Nuevo Aeropuerto Internacional de la Ciudad de México   (ver anexo)	2016-02-24 00:00:00	\N	4	\N	
133	133	1043530	Servicios de Transporte en Camionetas de Redilas	Servicios de Transporte en Camionetas de Redilas	complete	0	MXN	8500000.00	MXN	Adjudicación directa	Artículos 27, fracción III, 43, 45, fracción I y 46 de la LOPSRM		Especificaciones Generales del Servicio y Propuesta Técnica de los Servicios de Transporte en Camionetas de Redilas	Presencial		\N	\N	\N	\N	0		\N	\N	1	\N	
109	109	943228	Supervisión Técnica, Administrativa y de Control de calidad para los trabajos de nivelación y limpieza del terreno del Nuevo aeropuerto internacional de la Ciudad de México.	Supervisión Técnica, Administrativa y de Control de calidad para los trabajos de nivelación y limpieza del terreno del Nuevo aeropuerto internacional de la Ciudad de México.	active	0		17000000.00	MXN	Licitación pública	Articulos 27, fracción I, 30, fracción I, y 45, fracción I, de la Ley de Obras Públicas y Servcios Relacionados con las Mismas.  	Articulos 27, fracción I, 30, fracción I, y 45, fracción I, de la Ley de Obras Públicas y Servcios Relacionados con las Mismas.  		Nacional		\N	\N	2015-11-26 00:00:00	2015-11-27 00:00:00	0		\N	\N	25	\N	
220	220	1042465	Sistema de Precarga e instrumentación geotécnica, infraestructura, estructura de pavimentos y obra civil de ayudas visuales y para la navegación de la pista 3 y área de túneles del Nuevo Aeropuerto Internacional de la Ciudad de México. (NAICM)	Sistema de Precarga e instrumentación geotécnica, infraestructura, estructura de pavimentos y obra civil de ayudas visuales y para la navegación de la pista 3 y área de túneles del Nuevo Aeropuerto Internacional de la Ciudad de México. (NAICM)	active	0		258775000.00	MXN	Licitación pública	Articulos 27, fracción I, 30, fracción I, y 45, fracción I, de la Ley de Obras Públicas y Servcios Relacionados con las Mismas.  	Articulos 27, fracción I, 30, fracción I, y 45, fracción I, de la Ley de Obras Públicas y Servcios Relacionados con las Mismas.  		Internacional		\N	\N	\N	\N	0		\N	\N	0	\N	
141	141	938432	Adecuación de espacios para las oficinas del Grupo Aeroportuario de la Ciudad de México (GACM) en el CEMCAS	Adecuación de espacios para las oficinas del Grupo Aeroportuario de la Ciudad de México (GACM) en el CEMCAS	complete	0		9750000	MXN	Invitación a cuando menos tres personas	Artículo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas		Apartado 2.13 y 2.14 de la Invitación Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N82-2015 del 3 de noviembre de 2015, relacionado con la “Adecuación de espacios para oficinas, del Grupo Aeroportuario de la Ciudad de México (GACM), en el CEMCAS, es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 6 de noviembre de 2015.	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 14:00 horas del 17 de noviembre de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Gerente de concursos de la Subdirección de Contrataciones de GACM	2015-11-19 00:00:00	\N	2015-11-10 00:00:00	2015-11-10 00:00:00	1		\N	\N	3	\N	
139	139	799531	Servicios profesionales de consultoría, legales y/o normativos y acompañamiento en los procedimientos de contratación pública y elaboración del expediente concentrador integral del (NAICM)	Servicios profesionales de consultoría, legales y/o normativos y acompañamiento en los procedimientos de contratación pública y elaboración de la memoria documental integral del desarrollo del  Nuevo Aeropuerto Internacional de la Ciudad de México	complete	0	MXN	20360000.00	MXN	Invitación a cuando menos tres personas	Artículo 41, fracción X de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público.					\N	\N	\N	\N	0		\N	\N	3	\N	
140	140	1039131	Servicios de apoyo técnico a la residencia del proyecto ejecutivo de diseño arquitectónico e ingeniería de detalle del edificio terminal de pasajeros, torre de control y centro de operaciones, edificio de estacionamiento, estacionamientos en superficie, estación multimodal y vialidades de acceso del NAICM	Servicios de apoyo técnico a la residencia del proyecto ejecutivo de diseño arquitectónico e ingeniería de detalle del edificio terminal de pasajeros, torre de control y centro de operaciones, edificio de estacionamiento, estacionamientos en superficie, estación multimodal y vialidades de acceso del NAICM	complete	0	MXN	8362000.00	MXN	Invitación a cuando menos tres personas	Art. 45 de la LOPSRM	Apartado 2.10 y 2.11 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-E45-2016 del 11 de abril de 2016, relacionado con el “Servicios de apoyo técnico a la residencia del proyecto ejecutivo de diseño arquitectónico e ingeniería de detalle del edificio terminal de pasajeros, torre de control y centro de operaciones, edificio de estacionamiento, estacionamientos en superficie, estación multimodal y vialidades de acceso del NAICM", es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 11 de abril de 2016.	Apartado 2.11 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-E45-2016 del 11 de abril de 2016, relacionado con el “Servicios de apoyo técnico a la residencia del proyecto ejecutivo de diseño arquitectónico e ingeniería de detalle del edificio terminal de pasajeros, torre de control y centro de operaciones, edificio de estacionamiento, estacionamientos en superficie, estación multimodal y vialidades de acceso del NAICM", es preciso señalar que la convocatoria fue publicada en la página de H62CompraNet el 11 de abril de 2016.	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 11:00 horas del 25 de abril de 2016, en la sala de juntas de la Subdirección de Contrataciones ubicada en: Calle de Santa Catarina Altavista 267, Colonia San Angel Inn, Delegación Álvaro Obregón, México, D.F., C.P. 01060. El acto fue presidido por el Gerente de concursos de la Subdirección de Contrataciones de GACM	2016-04-25 00:00:00	\N	2016-04-19 00:00:00	2016-04-19 00:00:00	1	Apartado 2.11 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-E45-2016 del 11 de abril de 2016 (ver anexo)	2016-04-29 00:00:00	\N	3	\N	
222	222	722715	Mantenimiento, suministro, instalación y puesta en operación de la instalaciones de voz y datos y electricidad en las oficinas de Grupo Aeroportuario de la Ciudad de México, S. A. de C. V. 	Mantenimiento, suministro, instalación y puesta en operación de la instalaciones de voz y datos y electricidad en las oficinas de Grupo Aeroportuario de la Ciudad de México, S. A. de C. V. 	active	0		1200000.00	MXN	Invitación a cuando menos tres personas	Art. 42 segundo párrafo del la Ley de Adquisiciones, Arrendamientos y Serivicios del Sector Público.	Art. 42 segundo párrafo del la Ley de Adquisiciones, Arrendamientos y Serivicios del Sector Público.	Apartado IV. Requisitos que los "licitantes" deben cumplir y causas de desechamiento" Invitación Nacional a cuando Menos Tres Personas identificado con el número IA-009KDH999-N6-2014, relacionado con el “Mantenimiento, suministro, instalación y puesta en operación de la instalaciones de voz y datos y electricidad en las oficinas de Grupo Aeroportuario de la Ciudad de México, S. A. de C. V.", es preciso señalar que la convocatoria fue publicada en la página de CompraNet el 26 de noviembre de 2014.	Nacional		\N	\N	2014-12-02 00:00:00	2014-12-02 00:00:00	0		2014-12-05 00:00:00	\N	3	\N	
143	143	938439	Desarrollo del Proyecto ejecutivo para el entronque de acceso de carga en la zona Norte del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	Desarrollo del Proyecto ejecutivo para el entronque de acceso de carga en la zona Norte del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	complete	0		9500000	MXN	Invitación a cuando menos tres personas	Artículo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas 	Mecanismo Binario		Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 18:00 horas del 17 de noviembre de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Gerente de concursos de la Subdirección de Contrataciones de GACM	\N	\N	2015-11-10 00:00:00	2015-11-11 00:00:00	1	Apartado 2.1, 2.2 y 2.10 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N34-2015 del 6 de noviembre de 2015 (ver anexo) 	2015-11-19 00:00:00	\N	4	\N	
144	144	-	Supervisión  de la Construcción de la Barda y Camino Perimetral, Alumbrado, Servicios Inducidos y Casetas de Acceso  para el Nuevo Aeropuerto Internacional de la Ciudad de México.”	Supervisión  de la Construcción de la Barda y Camino Perimetral, Alumbrado, Servicios Inducidos y Casetas de Acceso  para el Nuevo Aeropuerto Internacional de la Ciudad de México.”	complete	0		15600000	0	Licitación pública	Artículo 43 de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.	Evaluación mediante el Mecanismo Binario	Capítulos 2.13 y 2.14 de la convocatoria para la Licitación Pública Nacional Presencial No. LO-009KDH999-E22-2016, para los trabajos relativos a la "Supervisión  de la Construcción de la Barda y Camino Perimetral, Alumbrado, Servicios Inducidos y Casetas de Acceso  para el Nuevo Aeropuerto Internacional de la Ciudad de México.”, publicada en compranet el 29 de febrero de 2016	Presencial		2016-03-29 00:00:00	\N	2016-03-09 00:00:00	2016-03-15 00:00:00	0		2016-04-08 00:00:00	\N	15	\N	
54	54	832038	Servicio para apoyar la ejecución del Comité Vigilancia Ambiental	Servicio para apoyar la ejecución del Comité Vigilancia Ambiental	complete	0		7667600	MXN	Adjudicación directa	Artículo 41 fracción XIV de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.			Presencial		\N	\N	\N	\N	0		\N	\N	1	\N	
55	55	SA-009KDH999-N66-2015	Adquisición de Bienes Consistentes en Herramientas	La adquisición de bienes muebles como Herramientas 	complete	0		0	MXN	Adjudicación directa	Artículo 134 de la Constitución Polítoca de los Estados Unidos Mexicanos, y el 42 de la Ley de Adquisiciones, Arrendameintos y Servicios					\N	\N	\N	\N	0		\N	\N	1	\N	
87	87	838749	Para los trabajos relativos a la construcción del drenaje pluvial temporal	Licitación Pública Nacional que tuvo por objeto la adjudicación del contrato para los trabajos relativos a la construcción del drenaje pluvial temporal del Nuevo Aeropuerto de la Ciudad de México.	active	0		490000000	MXN	Licitación pública	Artículo 27, segundo párrafo de la Ley de Obras Públicas y Servicios Relacionados con las Mismas	Puntos y porcentajes	1. EVALUACIÓN DE LA PROPUESTA TÉCNICA: I. CALIDAD DE LA OBRA.- (a) Que los materiales propuestos para la ejecución de los trabajos cumplan con los estándares de calidad y medidas ambientales. (3.0); (b) Mano de Obra. Que la mano de obra propuesta para la ejecución de los trabajos, cumpla con los requisitos administrativos y con las aptitudes establecidos (3.0); (c) Maquinaria y equipo. Que la maquinaria y vehículos propuestos para la ejecución de los trabajos cumplan con los estándares de calidad y medidas ambientales exigidas (5.0); (d) Esquema estructural de la organización de los profesionales técnicos que se encargarán de la dirección y coordinación de los trabajos. Que el esquema estructural de profesionales técnicos (organigrama) propuesto, es el adecuado, suficiente y necesario (0.5); (e) Procedimiento constructivo. Que las técnicas propuestas a utilizar para la ejecución de los trabajos, sean congruentes con las características, complejidad y magnitud de trabajos a ejecutar en el proyecto (5.0); (f) Programas. Que exista una congruencia entre los programas generales y específicos de la obra (1.5), y (g) Descripción de la planeación integral para la ejecución de los trabajos. Explicación detallada de los procesos que se utilizaran en la ejecución, desarrollo y organización de los trabajos (2.0). II. CAPACIDAD LICITANTE.- (a) Capacidad de los recursos humanos. Que el personal profesional técnico ha participado en por lo menos 5 proyectos similares al que se licita (5.0); (b) Capacidad de los recursos económicos. Serán los recursos económicos que se consideren necesarios para que el licitante cumpla con el contrato (4.0); (c) Participación de discapacitados o empresas que cuenten con trabajadores con discapacidad (0.5), y (d) Subcontratación de MIPYMES. Se otorgará al licitante el puntaje indicado; se verificará que la proposición que contenga la documentación con la cual demuestre que subcontratará MIPYMES (0.5). III. EXPERIENCIA Y ESPECIALIDAD.- (a) Experiencia. Se verificará que el licitante durante los últimos 10 años ha ejecutado obras similares a los que se licitan (7.0), y (b) Especialidad. Se verificará que dentro de los últimos 10 años, el licitante ha ejecutado por lo menos 5 obras con las características, complejidad y magnitud específicas y a los volúmenes y condiciones similares a las requeridas por la convocante (8.0). IV. CUMPLIMIENTO DE CONTRATOS.- (a) Cumplimiento de contratos. Se verificará que por lo menos 5 obras ejecutadas por el licitante en los últimos 10 años, se hayan terminado en tiempo y forma (5.0). 2. EVALUACIÓN DE LA PROPUESTA ECONÓMICA: El total de puntuación de la proposición económica, tendrá un valor numérico máximo de 50. Para llevar a cabo la evaluación de la propuesta económica, la convocante verificará que el análisis, cálculo e integración de los precios cumplan con la condición de pago establecida en la convocatoria o Licitación en términos del artículo 45 de la Ley y los artículos 45 y del 185 al 220 del Reglamento. En caso de incumplimiento en la integración de los precios, que no pueda subsanarse mediante requerimiento de aclaraciones, documentación o información al licitante en términos del artículo 38 cuarto párrafo de la Ley y que no impliquen una causal de desechamiento prevista en esta convocatoria el GACM se abstendrá de otorgar puntuación en este rubro, por no contar con los elementos suficientes para verificar el precio ofertado. Para efectos de proceder a la evaluación de la propuesta económica, se excluirá del precio ofertado por el licitante el impuesto al valor agregado y sólo se considerará el precio neto propuesto. A la propuesta económica que resulte ser la más baja de las técnicamente aceptadas y que haya cumplido satisfactoriamente en la integración de su presupuesto, dando cumplimiento cabal a lo dispuesto por los artículos 185 al 220 del Reglamento, se le asignará la máxima puntuación. Para determinar la puntuación o unidades porcentuales que correspondan al precio ofertado por cada licitante, se aplicará la siguiente fórmula: PPE = MPemb x 50 / MPi. Donde: PPE = Puntuación o unidades porcentuales que corresponden a la Propuesta Económica; MPemb = Monto de la Propuesta económica más baja, y MPi = Monto de la i-ésima Propuesta económica.	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 12:00 horas del 6 de agosto de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapan San Angel, Delegación Alvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Subdirector de Contrataciones de GACM.  Los documentos técnicos T.2 y T.3, así como la documentación económica E-10, correspondiente a las 32 proposiciones presentadas, fueron rubricados por los representantes de tres licitantes y un consorcio.	2015-08-06 00:00:00	2015-07-03 00:00:00	2015-07-03 00:00:00	2015-07-22 00:00:00	0	Numeral 2.10 de la Convocatoria	2015-07-21 00:00:00	\N	32	\N	
89	89	830658	Desarrollo del proyecto ejecutivo, construcción, equipamiento de mobiliario en instalaciones complementarias para el campamento del Grupo Aeroportuario de la Ciudad de México en el sitio del Nuevo Aeropuerto Internacional de la Ciudad de México.	Desarrollo del Proyecto Ejecutivo, construcción, equipamiento de mobiliario en instalaciones complementarias para el campamento del Grupo Aeroportuario de la Ciudad de México en el sitio del Nuevo Aeropuerto Internacional de la Ciudad de México.	active	0		150000000	MXN	Licitación pública	Artículo 27, segundo párrafo de la Ley de Obras Públicas y Servicios Relaciondos con las Mismas	Ponderación de puntos (Puntos y porcentajes)	Capítulo VII de la Convocatoria (ver anexo) 	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 11:00 horas del 27 de julio de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Subdirector de Contrataciones de GACM. 	2015-07-27 00:00:00	\N	2015-07-02 00:00:00	2015-07-10 00:00:00	1	Capítulo VI de la Convocatoria (ver anexo)	2015-07-20 00:00:00	\N	17	\N	
94	94	914874	Servicio de transporte con camionetas de redilas para los trabajos que conforman el programa de empleo temporal (PET), en el predio del Nuevo Aeropuerto Internacional de la Ciudad de México	Servicio de transporte con camionetas de redilas para los trabajos que conforman el programa de empleo temporal (PET), en el predio del Nuevo Aeropuerto Internacional de la Ciudad de México	active	0		9170000	MXN	Invitación a cuando menos tres personas	Artículo 43 de la LOPSRM	Mecaninsmo binario	Apartado 4.3 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N81-2015 del 5 de octubre de 2015 (ver anexo)	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 18:00 horas del 13 de octure de 2015, en la sala de juntas de la Subdirección de Contrataciones ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Angel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Gerente de concursos de la Subdirección de Contrataciones de GACM	2015-10-13 00:00:00	\N	2015-10-08 00:00:00	2015-10-08 00:00:00	1	Apartado 7.2 y 7.3 de la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N81-2015 del 5 de octubre de 2015 (ver anexo) 	2015-10-15 00:00:00	\N	3	\N	
102	102	761895	Servicios de supervisión para la obra: extracción de ademes y restitución del terreno que ocupan dichos elementos ubicados en la poligonal para el Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	Servicios de supervisión para la obra: extracción de ademes y restitución del terreno que ocupan dichos elementos ubicados en la poligonal para el Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	active	0		2680000	MXN	Invitación a cuando menos tres personas	Artículo 27 fracción II y artículo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas	Mecaninsmo binario	Capítulo 2.13 de la  Invitación Nacional a Cuando Menos Tres Personas No. IO-009KDH99-N10-2015 relativa a la supervisión para la obra: Extracción de ademes y restitución del terreno que ocupan dichos elementos ubicados en la poligonal para el Nuevo Aeropuerto Internacional de la Ciudad de México  (ver anexo)	Presencial	El acto de presentación y apertura de proposiciones se llevó a cabo a las 10:00 horas del 04 de marzo de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapán San Ángel, Delegación Álvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Subdirector de Contrataciones de GACM.  Se rubricaron los documentos técnicos T.2 y T.3, así como la documentación económica E-10 correspondiente a las 3 proposiciones presentadas.	2015-06-29 00:00:00	\N	2015-02-18 00:00:00	2015-02-25 00:00:00	1	Capítulo 2.10 y 2.11 de la  Invitación Nacional a Cuando Menos Tres Personas No. IO-009KDH99-N10-2015 relativa a la supervisión para la obra: Extracción de ademes y restitución del terreno que ocupan dichos elementos ubicados en la poligonal para el Nuevo Aeropuerto Internacional de la Ciudad de México (ver anexo)	2015-03-04 00:00:00	\N	4	\N	
108	108	996706	Construcción de accesos y plataformas para exploración geotécnica, rehabilitación de tramos de prueba y bacheo somero de caminos existentes dentro del terreno par el Nuevo Aeropuerto Internacional de la Ciudad de México	Construcción de accesos y plataformas para exploración geotécnica, rehabilitación de tramos de prueba y bacheo somero de caminos existentes dentro del terreno par el Nuevo Aeropuerto Internacional de la Ciudad de México	active	0		1276500.00	MXN	Invitación a cuando menos tres personas	Artículo 27 fracción II y artículo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas	Artículo 27 fracción II y artículo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas		Nacional		\N	\N	2016-02-16 00:00:00	2016-02-16 00:00:00	0		\N	\N	4	\N	
219	219	1042465	Sistema de Precarga e instrumentación geotécnica, infraestructura, estructura de pavimentos y obra civil de ayudas visuales y para la navegación de la pista 2 y área de túneles del Nuevo Aeropuerto Internacional de la Ciudad de México. (NAICM)	Trabajos relativos al sistema de Precarga e instrumentación geotécnica, infraestructura, estructura de pavimentos y obra civil de ayudas visuales y para la navegación de la pista 2 y área de túneles del Nuevo Aeropuerto Internacional de la Ciudad de México. (NAICM)	active	0	MXN	300000000.00	MXN	Licitación pública	Articulos 27, fracción I, 30, fracción I, y 45, fracción I, de la Ley de Obras Públicas y Servcios Relacionados con las Mismas.	Apartado 2.10 y 2.11 de la Convocatoria de la Licitación Pública Internanacional bajo la cobertura de tratados  para Sistema de Precarga e instrumentación geotécnica, infraestructura, estructura de pavimentos y obra civil de ayudas visuales y para la navegación de la pista 2 y área de túneles del Nuevo Aeropuerto Internacional de la Ciudad de México. (NAICM) públicada en compranet publicadas el 21 de abril de 2016	Anexco 6.3 de la Convocatoria de la Licitación Pública Internanacional bajo la cobertura de tratados  para Sistema de Precarga e instrumentación geotécnica, infraestructura, estructura de pavimentos y obra civil de ayudas visuales y para la navegación de la pista 2 y área de túneles del Nuevo Aeropuerto Internacional de la Ciudad de México. (NAICM) públicada en compranet publicadas el 21 de abril de 2016	Presencial		\N	\N	2016-06-15 00:00:00	\N	1	Apartado 2.10 y 2.11 de la Convocatoria de la Licitación Pública Internanacional bajo la cobertura de tratados  para Sistema de Precarga e instrumentación geotécnica, infraestructura, estructura de pavimentos y obra civil de ayudas visuales y para la navegación de la pista 2 y área de túneles del Nuevo Aeropuerto Internacional de la Ciudad de México. (NAICM) públicada en compranet publicadas el 21 de abril de 2016	2016-06-28 00:00:00	\N	1	\N	
3	3	1	Testigo Social para que atestigue las etapas del Procedimiento de Licitación Publica Nacional para el Proyecto denominado "Excavación de Prueba, Losa Experimental y Prueba de Pilotes para el Edificio Terminal y Torre de Control	Testigo Social para que atestigue las etapas del Procedimiento de Licitación Publica Nacional para el Proyecto denominado "Excavación de Prueba, Losa Experimental y Prueba de Pilotes para el Edificio Terminal y Torre de Control	active	0		0	MXN	Adjudicación directa	Artículo 42, párrafo segundo y tercero de la Ley  de Adquisiciones, Arrendamientos y Servicios del Sector Público.	Artículo 42, párrafo segundo y tercero de la Ley  de Adquisiciones, Arrendamientos y Servicios del Sector Público.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
28	28	1008580	Plan de Maestro  para  el  Proyecto	Plan de Maestro  para  el  Proyecto	complete	0	USD	1495000.00	USD	Adjudicación directa	Artículo 41, 42, FRACCIÓN III Y IV de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.					\N	\N	\N	\N	0		\N	\N	1	\N	
218	218	1110560	Construcción del Edificio Terminal del Nuevo Aeropuerto Internacional de la Ciudad de México	Licitación Pública Internacional que tiene por objeto la adjudicación del contrato para los trabajos relativos a la construcción del Edificio Terminal del Nuevo Aeropuerto Internacional de la Ciudad de México	active	0		11000000000	MXN	Licitación pública	Artículo 27, fracción I y 30 fracción II de la Ley de Obras Públicas y Servicios Relacionados con las Mismas	Puntos y porcentajes	Sección 2.13 de la Convocatoria a la Licitación Pública Internacional Bajo la Cobertura de Tratados Utilizando el Mecanismo de Puntos y Porcentajes para la Evaluación de las Proposiciones LO-009KDH999-E101-2016 para la construcción del edificio terminal del Nuevo Aeropuerto Internacional de la Ciudad de México publicada en CompraNet el 15 de julio de 2016	Presencial		\N	\N	\N	\N	0	Sección 2.10 de la Convocatoria a la Licitación Pública Internacional Bajo la Cobertura de Tratados Utilizando el Mecanismo de Puntos y Porcentajes para la Evaluación de las Proposiciones LO-009KDH999-E101-2016 para la construcción del edificio terminal del Nuevo Aeropuerto Internacional de la Ciudad de México publicada en CompraNet el 15 de julio de 2016	2016-12-15 00:00:00	\N	1	\N	
21	21	762798	Servicio de un Testigo Social para que atestigüe en las etapas de la invitación a cuando menos tres personas, presencial, internacional bajo la cobertura de trarados de libre comercio, relativa a la contratación de los servicios relacionados con obra pública, consistentes en el desarrollo del proyecto ejecutivo de pistas, rodajes y plataformas y ayudas a la navegación y otras instalaciones del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	Servicio de un Testigo Social para que atestigüe en las etapas de la invitación a cuando menos tres personas, presencial, internacional bajo la cobertura de trarados de libre comercio, relativa a la contratación de los servicios relacionados con obra pública, consistentes en el desarrollo del proyecto ejecutivo de pistas, rodajes y plataformas y ayudas a la navegación y otras instalaciones del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	complete	0	MXN	625856.22	MXN	Adjudicación directa	Artículos 54 del Reglamento de la Ley de Obras, Públicas y Servicios Relacionados con las Mismas; así como 26 Fracción III, y 42 de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público.					\N	\N	\N	\N	0		\N	\N	1	\N	
22	22	-	Etapa 2; seguimiento para el cumplimiento ambiental del proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM) a través de la entidad de supervisión ambiental (Condicionante 10, resolutivo MIA-R	Etapa 2; seguimiento para el cumplimiento ambiental del proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM) a través de la entidad de supervisión ambiental (Condicionante 10, resolutivo MIA-R	complete	0	MXN	227520000.00	MXN	Adjudicación directa	Artículo 1 de la LAASSP		Anexo técnico - económico para los servicios consistentes en  "Etapa 2; seguimiento para el cumplimiento ambiental del proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM) a través de la entidad de supervisión ambiental (Condicionante 10, resolutivo MIA-R".	Presencial		\N	\N	\N	\N	0		\N	\N	1	\N	
1	1	982035	Servicio relacionado con el programa de empleo temporal (PET) correspondiente a las acciones preparatorias para la construcción del Nuevo Aeropuerto Internacional de la Ciudad de México (servicio de traslado de personas)	Servicio relacionado con el programa de empleo temporal (PET) correspondiente a las acciones preparatorias para la construcción del Nuevo Aeropuerto Internacional de la Ciudad de México (servicio de traslado de personas)	active	0		2355000.00	MXN	Adjudicación directa	Artículo 42, párrafo segundo y tercero de la Ley  de Adquisiciones, Arrendamientos y Servicios del Sector Público.	Artículo 42, párrafo segundo y tercero de la Ley  de Adquisiciones, Arrendamientos y Servicios del Sector Público.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
7	7	1	Servicios de Asistencia Técnica Especializada en materia de Hidráulica aplicada a la Infraestructura Aeroportuaria	Servicios de Asistencia Técnica Especializada en materia de Hidráulica aplicada a la Infraestructura Aeroportuaria	active	0		15650000	MXN	Adjudicación directa	Artículos 27, fracción III, 41 y 42, fracción X de la LOPSRM	Artículos 27, fracción III, 41 y 42, fracción X de la LOPSRM		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
15	15	1037341	Servicio de asistencia técnica especializada en materia de hidráulica aplicada a la infraestructura aeroportuaria.	Servicio de asistencia técnica especializada en materia de hidráulica aplicada a la infraestructura aeroportuaria.	active	0		15650000.00	MXN	Adjudicación directa	Artículo 42 Fracción X de la Ley de Obras Públicas y Servicios Relacionados con las Mismas 	Artículo 42 Fracción X de la Ley de Obras Públicas y Servicios Relacionados con las Mismas 		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
47	47	-	-	-	complete	0		0		Adjudicación directa						\N	\N	\N	\N	0		\N	\N	1	\N	
23	23	-			complete	0		0		Adjudicación directa	Artículo 1 de la LOPSRM			Presencial		\N	\N	\N	\N	0		\N	\N	1	\N	
2	2	903614	Servicio de testigo social para que atestigue las etapas del procedimiento de licitación pública nacional presencial, relativa a la contratación de la obra pública, consistente en el proyecto ejecutivo, construcción equipamiento mobiliario e instalaciones complementarias, para el campamento del grupo aeroportuario de la Ciudad de México en el sitio del Nuevo Aeropuerto Internacional de la Ciudad de México 	Servicio de testigo social para que atestigue las etapas del procedimiento de licitación pública nacional presencial, relativa a la contratación de la obra pública, consistente en el proyecto ejecutivo, construcción equipamiento mobiliario e instalaciones complementarias, para el campamento del grupo aeroportuario de la Ciudad de México en el sitio del Nuevo Aeropuerto Internacional de la Ciudad de México 	active	133190.00	MXN	213104.00	MXN	Adjudicación directa	Artículo 42, párrafo segundo y tercero de la Ley  de Adquisiciones, Arrendamientos y Servicios del Sector Público.	Artículo 42, párrafo segundo y tercero de la Ley  de Adquisiciones, Arrendamientos y Servicios del Sector Público.		Nacional 		\N	\N	\N	\N	0		\N	\N	1	\N	
24	24	-	Servicio de instrumentación y operación de planes y programas ambientales para el Nuevo Aeropuerto Internacional de la ciudad de México (NAICM), Etapa 2016-2018.	Servicio de instrumentación y operación de planes y programas ambientales para el Nuevo Aeropuerto Internacional de la ciudad de México (NAICM), Etapa 2016-2018.	complete	0	MXN	236900000.00	MXN	Adjudicación directa	Artículo 1 de la LAASSP 		Anexo técnico para la "instrumentación y operación de planes y programas ambientales para el proyecto Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM), Etapa 2016-2018". 	Presencial		\N	\N	\N	\N	0		\N	\N	1	\N	
34	34	798870	Elaboración de programa de monitoreo de ruido perimetral para las etapas de preparación del sitio, construcción, operación y mantenimiento del Nuevo Aeropuerto Internacional de la Ciudad de México	Elaboración de programa de monitoreo de ruido perimetral para las etapas de preparación del sitio, construcción, operación y mantenimiento del Nuevo Aeropuerto Internacional de la Ciudad de México	complete	0	MXN	638000.00	MXN	Adjudicación directa	Artículo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas					\N	\N	\N	\N	0		\N	\N	1	\N	
25	25	905681	Proyecto ejecutivo del drenaje pluvial temporal para la protección de la zona contra inundaciones provenientes de precipitaciones dentro del perímetro del Aeropuerto en el lago de Texcoco, durante la construcción de la primera fase del Nuevo Aeropuerto Internacional de la Ciudad de México	Proyecto ejecutivo del drenaje pluvial temporal para la protección de la zona contra inundaciones provenientes de precipitaciones dentro del perímetro del Aeropuerto en el lago de Texcoco, durante la construcción de la primera fase del Nuevo Aeropuerto Internacional de la Ciudad de México	complete	0	MXN	19500000.00	MXN	Adjudicación directa	Artículo 42 fracción XIV de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.					\N	\N	\N	\N	0		\N	\N	1	\N	
5	5	985141	Servicios de un Profesionista Especializado en Temas de Desarrollo Urbano, Territorial y Regional para el Proyecto del Nuevo Aeropuerto de la Ciudad de México.	Servicios de un Profesionista Especializado en Temas de Desarrollo Urbano, Territorial y Regional para el Proyecto del Nuevo Aeropuerto de la Ciudad de México.	active	0		522000.00	MXN	Adjudicación directa	Artículo 41 fracción XIV de la Ley  de Adquisiciones, Arrendamientos y Servicios del Sector Público.	Artículo 41 fracción XIV de la Ley  de Adquisiciones, Arrendamientos y Servicios del Sector Público.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
6	6	1036573	Asistencia Técnica Especializada en Materia de Diseño Sísmico Estructural aplicada a la Infraestructura Aeroportuaria	Asistencia Técnica Especializada en Materia de Diseño Sísmico Estructural aplicada a la Infraestructura Aeroportuaria	active	0		26000000	MXN	Adjudicación directa	Artículo 42 Fracción X de la Ley de Obras Públicas y Servicios Relacionados con las Mismas 	Artículo 42 Fracción X de la Ley de Obras Públicas y Servicios Relacionados con las Mismas 		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
106	106	1	Servicios especializados en el suministro de personal tercerizados.	Contratacion de Personal tercerizado	active	0		129391633.00	MXN	Adjudicación directa	Artículos 41 Fracción III, 43 último párrafo y 47 de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público	Artículos 41 Fracción III, 43 último párrafo y 47 de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
8	8	1036664	Servicios de asistencia técnica especializada en materia de diseño sismico estructural aplicada a la infraestructura aeroportuaria	Servicios de asistencia técnica especializada en materia de diseño sismico estructural aplicada a la infraestructura aeroportuaria	active	0		17000000.00	MXN	Adjudicación directa	Artículo 42, fracción X de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.	Artículo 42, fracción X de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
9	9	1032198	Servicio para la Asistencia Técnica Especializada en Materia de Geotecnia y Cimentación Aplicada a la Infraestructura Aeroportuaria	Servicio para la Asistencia Técnica Especializada en Materia de Geotecnia y Cimentación Aplicada a la Infraestructura Aeroportuaria	active	0		15650000.00	MXN	Adjudicación directa	Artículo 42 fracción X de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.	Artículo 42 fracción X de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
12	12	1	Servicios de experto revisor para la asistencia técnica especializada en materia de diseño sismico estructural, aplicada a la infraestructura aeroportuaria	Servicios de experto revisor para la asistencia técnica especializada en materia de diseño sismico estructural, aplicada a la infraestructura aeroportuaria	active	0		260000000.00	MXN	Adjudicación directa	Artículo 42, fracción X de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.	Artículo 42, fracción X de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
13	13	1	Servicios de asistencia técnica especializada en materia de diseño sismico estructural aplicada a la infraestructura aeroportuaria	Servicios de asistencia técnica especializada en materia de diseño sismico estructural aplicada a la infraestructura aeroportuaria	active	0		15650000.00	MXN	Adjudicación directa	Artículo 42, fracción X de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.	Artículo 42, fracción X de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
29	29	798849	Elaboración del Plan de restauración ecológica para el Nuevo Aeropuerto Internacional de la Ciudad de México	Elaboración del Plan de restauración ecológica para el Nuevo Aeropuerto Internacional de la Ciudad de México	complete	0	MXN	522000.00	MXN	Adjudicación directa	Artículo 43 de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas					\N	\N	\N	\N	0		\N	\N	1	\N	
14	14	1033446	Servicios de experto revisor para la asistencia técnica especializada en materia de protección contra incendios, aplicada a la infraestructura aeroportuaria	Servicios de experto revisor para la asistencia técnica especializada en materia de protección contra incendios, aplicada a la infraestructura aeroportuaria	active	0		26000000.00	MXN	Adjudicación directa	Artículo 42, fracción X de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.	Artículo 42, fracción X de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
58	58	1052471	Servicios en el seguimiento, representación y defensa en juicio, presentes en materia laboral. 	Servicios en el seguimiento, representación y defensa en juicio, presentes en materia laboral. 	complete	0		1040682.96	MXN	Adjudicación directa	"…con fundamento en el arítculo 33  de la Ley Federal de Entidades Paraestatales, segundo parráfo del artículo 42  de la Ley de Adquisiciones , Arrendamientos y Servicios del Sector Público, punto 1.4.  del Manual de Organización del Grupo Aeroportuario de  la Ciudad de México y en ejercicio de las atribuciones  conferidas a traves de la escritura pública  número 71,456 de fecha 5 de septiembre de 2014..."					\N	\N	\N	\N	0		\N	\N	1	\N	
30	30	798885	Prestación de los Servicios consistentes en la elaboración del: “Plan de Acciones de monitoreo y conservación de aves para el Nuevo Aeropuerto Internacional de la Ciudad de México”.	Prestación de los Servicios consistentes en la elaboración del: “Plan de Acciones de monitoreo y conservación de aves para el Nuevo Aeropuerto Internacional de la Ciudad de México”.	complete	0	MXN	522000.00	MXN	Adjudicación directa	Artículo 43 de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.					\N	\N	\N	\N	0		\N	\N	1	\N	
16	16	1032142	Servicio de asistencia técnica especializada en materia de Geotecnia y Cimentación aplicada a la infraestructura aeroportuaria.	Servicio de asistencia técnica especializada en materia de Geotecnia y Cimentación aplicada a la infraestructura aeroportuaria.	active	0		15650000.00	MXN	Adjudicación directa	Artículo 42 Fracción X de la Ley de Obras Públicas y Servicios Relacionados con las Mismas 	Artículo 42 Fracción X de la Ley de Obras Públicas y Servicios Relacionados con las Mismas 		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
111	111	1	Instrumento de Garantía para el  Cumplimiento de las Medidas Ambientales para NAICM establecidas en el Manifiesto de Impacto Ambiental	Instrumento de Garantía para el  Cumplimiento de las Medidas Ambientales para NAICM establecidas en el Manifiesto de Impacto Ambiental	active	0		8410000.00	MXN	Adjudicación directa	"Artículos 40 y 41 fracción III, de la Ley de Adquisiciones, Arrendamientos y Servicios. Artículos 71 y 72 fracción III, del Reglamento de la Ley de Adquisiciones, Arrendamientos y Servicios."	"Artículos 40 y 41 fracción III, de la Ley de Adquisiciones, Arrendamientos y Servicios. Artículos 71 y 72 fracción III, del Reglamento de la Ley de Adquisiciones, Arrendamientos y Servicios."		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
18	18	1041842	Servicios de Experto Revisor para la Asistencia Técnica Especializada en Materia de Diseño Estructural, Aplicada  a la Infraestructura Aeroportuaria.	Servicios de Experto Revisor para la Asistencia Técnica Especializada en Materia de Diseño Estructural, Aplicada  a la Infraestructura Aeroportuaria.	active	0		26000000	MXN	Adjudicación directa	Artículos 27 fracción III, 41, 42 fracción X de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.	Artículos 27 fracción III, 41, 42 fracción X de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
19	19	1052469	" Prestación del Servicio Tecnico Especializado para la captura en video y transmisión via internet mediante la producción y streaming de 4 eventos de licitación pública mediante equipos de cctv en circuito cerrado. "	" Prestación del Servicio Tecnico Especializado para la captura en video y transmisión via internet mediante la producción y streaming de 4 eventos de licitación pública mediante equipos de cctv en circuito cerrado. "	active	0		117820.00	MXN	Adjudicación directa	Artículo 42 de la Ley  de Adquisiciones, Arrendamientos y Servicios Relacionados con las Mismas.	Artículo 42 de la Ley  de Adquisiciones, Arrendamientos y Servicios Relacionados con las Mismas.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
17	17	1037233	Servicios de Asistencia Técnica Especializada en Materia de Diseño Sismico Estructural Aplicada a la Infraestructura Aeroportuaria.	Servicios de Asistencia Técnica Especializada en Materia de Diseño Sismico Estructural Aplicada a la Infraestructura Aeroportuaria.	active	0		26000000	MXN	Adjudicación directa	Artículos 27 fracción III, 41, 42 fracción X de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.	Artículos 27 fracción III, 41, 42 fracción X de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
20	20	762905	Servicio de un Testigo Social para que atestigüe en las etapas de la licitación pública nacional presencial relativa a la contratación del servicio de extracción de ademes y restitución del terreno que ocupan dichos elementos, ubicados en el polígono para el Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	Servicio de un Testigo Social para que atestigüe en las etapas de la licitación pública nacional presencial relativa a la contratación del servicio de extracción de ademes y restitución del terreno que ocupan dichos elementos, ubicados en el polígono para el Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	active	0		527973.49	MXN	Adjudicación directa	Artículos 54 del Reglamento de la Ley de Obras, Públicas y Servicios Relacionados con las Mismas; así como 26 Fracción III, y 42 de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público.	Artículos 54 del Reglamento de la Ley de Obras, Públicas y Servicios Relacionados con las Mismas; así como 26 Fracción III, y 42 de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
134	134	-	Arrendamiento de Altavista	Arrendamiento de los inmuebles ubicados en: Calle de Santa Catarina Núm.. 267, Colonia San Ángel Inn, Delegación Álvaro Obregón, Código Postal 01060, Distrito Federal; Boulevard Adolfo López Mateos Núm. 2390, Colonia San Ángel Inn, Delegación Álvaro Obregón, Distrito Federal; y casa marcada con Núm. 420 Boulevard Adolfo López Mateos, en esta Ciudad.	complete	0	MXN	18090000.00	MXN	Adjudicación directa	Artículo 50 de la Ley Federal de Presupuesto y Responsabilidad Hacendaria y 147 y 148 de su Reglamente					\N	\N	\N	\N	0		\N	\N	1	\N	
31	31	798942	Elaboración del Programa de rescate de fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México	Elaboración del Programa de rescate de fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México	complete	0	MXN	435000.00	MXN	Adjudicación directa	Artículo 43 de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.					\N	\N	\N	\N	0		\N	\N	1	\N	
32	32	798633	Elaboración del Programa de rescate y reubicación de flora para el Nuevo Aeropuerto Internacional de la Ciudad de México	Elaboración del Programa de rescate y reubicación de flora para el Nuevo Aeropuerto Internacional de la Ciudad de México	complete	0	MXN	458200.00	MXN	Adjudicación directa	Artículo 43 de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.					\N	\N	\N	\N	0		\N	\N	1	\N	
115	115	SA-009KDH999-N67-2015	Equipo de Seguridad (Botiquines para la DCI)	Adquisición de equipo de seguridad (botiquines) 	active	0		100000	MXN	Adjudicación directa	Artículo 42 de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público 	Artículo 42 de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público 		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
33	33	789535	Prestación de los Servicios consistentes en la elaboración del Estudio Técnico-Económico de la Ejecución de las medidas de mitigación restauración y compensación y otras acciones ambientales del proyecto Nuevo Aeropuerto Internacional de la Ciudad de México	Prestación de los Servicios consistentes en la elaboración del Estudio Técnico-Económico de la Ejecución de las medidas de mitigación restauración y compensación y otras acciones ambientales del proyecto Nuevo Aeropuerto Internacional de la Ciudad de México	complete	0	MXN	638000.00	MXN	Adjudicación directa	Artículo 43 de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.					\N	\N	\N	\N	0		\N	\N	1	\N	
112	112	SA-009KDH999-N1-2014	Arrendamiento de Vehículos Terrestres	Prestar a GACM los servicios de Arrendamiento de Vehículos Terrestres. 	active	0		49042510.00	MXN	Adjudicación directa	Lo dispuesto en los articulos 3, Fracción I, 23 Fracción III, 41 fracción XX, 45 y demás relativos y aplicables a la LAASSP en relación a lo dispuesto por el artículo 14 del RLAASSP	Lo dispuesto en los articulos 3, Fracción I, 23 Fracción III, 41 fracción XX, 45 y demás relativos y aplicables a la LAASSP en relación a lo dispuesto por el artículo 14 del RLAASSP		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
113	113	SA-009KDH-N62/2015	Servicio Integral de Reservación, Expedición y Entrega de Pasajes Aéreos para el personal GACM	Servicio Integral de Reservación, Expedición y Entrega de Pasajes Aéreos para el personal GACM	active	3050000.00		6583333.33	MXN	Adjudicación directa	Artículos 26 fracción III, 40, 41, fracción III, 45,47 y demás relativos y aplicables de la LAASSP	Artículos 26 fracción III, 40, 41, fracción III, 45,47 y demás relativos y aplicables de la LAASSP		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
150	150	N6/2012	Servicios Administrados de Arrendamiento de Equipo y Bienes Informáticos para el Grupo Aeroportuario de la Ciudad de México.	Prestación a GACM por parte del prestador de servicios de los servicios administrados de equipo y bienes informáticos sin opción a compra, en adelante los servicios los cuales serán prestados totalmente a satisfacción de GACM, de conformidad con las especificaciones y características establecidas en el anexo técnico el cual al ser firmado por las partes forma parte integrante del contrato como anexo 11.	active	0		47660000.00	MXN	Adjudicación directa	La celebración del presente contrato la lleva a cabo por adjudicación directa, en términos de lo establecidos en los artículos 3° fracción I, 26, fracción III, 28 fracción I, en relación con lo dispuesto en el articulo 40, ultimo párrafo, 41, fracción III, 45, 47 y demás relativos y aplicables de la LAASSP, así como los artículos 71 y 72 fracción III del RLAASSP.	La celebración del presente contrato la lleva a cabo por adjudicación directa, en términos de lo establecidos en los artículos 3° fracción I, 26, fracción III, 28 fracción I, en relación con lo dispuesto en el articulo 40, ultimo párrafo, 41, fracción III, 45, 47 y demás relativos y aplicables de la LAASSP, así como los artículos 71 y 72 fracción III del RLAASSP.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
36	36	789794	Prestación de los Servicios consistentes en la elaboración del Plan de manejo  ambiental para el Nuevo Aeropuerto  Internacional de la Ciudad de México.	Prestación de los Servicios consistentes en la elaboración del Plan de manejo  ambiental para el Nuevo Aeropuerto  Internacional de la Ciudad de México.	complete	0	MXN	638000.00	MXN	Adjudicación directa	Artículo 43 de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.					\N	\N	\N	\N	0		\N	\N	1	\N	
196	196	No aplica	Instrumento de Garantía para el  Cumplimiento de las Medidas Ambientales para NAICM establecidas en el Manifiesto de Impacto Ambiental	Instrumento de Garantía para el  Cumplimiento de las Medidas Ambientales para NAICM establecidas en el Manifiesto de Impacto Ambiental	none	0	MXN	0	MXN	Adjudicación directa	Artículos 40 y 41 fracción III, de la Ley de Adquisiciones, Arrendamientos y Servicios. Artículos 71 y 72 fracción III, del Reglamento de la Ley de Adquisiciones, Arrendamientos y Servicios.					\N	\N	\N	\N	0		\N	\N	1	\N	
114	114	900416			active	0		15800287.50	MXN	Adjudicación directa	Articulo 72 fracción III del RLAASSP, en realción al 41 de la LAASSP se adhiere al contrato Plurianual abierto número ATN-LPN-003-003-13	Articulo 72 fracción III del RLAASSP, en realción al 41 de la LAASSP se adhiere al contrato Plurianual abierto número ATN-LPN-003-003-13		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
151	151	982694	Servicio de un Testigo Social para que atestigüe las etapas del procedimiento de la Licitación Pública Nacional, relativa a la contratación de la obra pública, para la construcción del proyecto ejecutivo de drenaje pluvial temporal para la protección de la zona durante la construcción de la primera fase del NAICM	Servicio de un Testigo Social para que atestigüe las etapas del procedimiento de la Licitación Pública Nacional, relativa a la contratación de la obra pública, para la construcción del proyecto ejecutivo de drenaje pluvial temporal para la protección de la zona durante la construcción de la primera fase del NAICM	active	0		580000.00	MXN	Adjudicación directa	Artículos 54 de la LOPSRM, 26 fracción III, 41 fracción I y 47 de la Ley de Adquisiciones Arrendamientos y Servicios del Sector Público	Artículos 54 de la LOPSRM, 26 fracción III, 41 fracción I y 47 de la Ley de Adquisiciones Arrendamientos y Servicios del Sector Público		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
176	176	1	Configuración Inicial de Equipos Instalados en el Inmueble de Altavista Para Servicio de Red Local, Seguridad de Datos y Telefonía.	Contar con el servicio de configuración inicial personalizada para los equipos instalados en el inmueble de Altavista, con el propósito de iniciar operaciones de manera inmediata y proveer a los usuarios del Grupo Aeroportuario de la Ciudad de México (GACM) de conexión a la red de datos, seguridad física y lógica en el acceso a internet, configuración de los teléfonos y del conmutador.	active	0		224176.00	MXN	Adjudicación directa	La contratación de este servicio la realiza bajo el procedimiento de adjudicación directa, en términos de lo establecido en los artículos 26 fracción III y 42 de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público.	La contratación de este servicio la realiza bajo el procedimiento de adjudicación directa, en términos de lo establecido en los artículos 26 fracción III y 42 de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
180	180	1	Servicio de conducción de señales analógicas y digitales telecomunicaciones	Uso y goce temporal de enlaces de internet y lineas troncales de telefonía publica para las oficinas de la Dirección Corporativa de Administación y Gestión inmobiloaria de GACM	active	0		490000.00	MXN	Adjudicación directa	Articulo 42 de la LAASSP por un monto que no exede los montos máximos que al efecto se esteblecieron en el PEF.	Articulo 42 de la LAASSP por un monto que no exede los montos máximos que al efecto se esteblecieron en el PEF.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
177	177	1	Servicio de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia	Cubrir las necesidades primarias de soporte de red y a la telefonia e internet e implementar el servicio en comento, por un periodo de seis meses a partir del 2° de enero y hasta 01 de julio de 2015 a traves de una adjudicacion directa.	active	0		298780.56	MXN	Adjudicación directa	Articulo 26 fraccion III y articulo 42 de la LAASSP.	Articulo 26 fraccion III y articulo 42 de la LAASSP.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
178	178	1	Servicio de renta de Bienes Informáticos 	Uso y goce temporal del equipos de cómuto personal	active	0		600000.00	MXN	Adjudicación directa	Articulo 42 de la LAASSP por un monto que no exede los montos máximos que al efecto se esteblecieron en el PEF.	Articulo 42 de la LAASSP por un monto que no exede los montos máximos que al efecto se esteblecieron en el PEF.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
179	179	1	Servicio de renta de Bienes Informáticos Equipo de impresión y Telecomunicaciones	Uso y goce temporal del equipos de impresión y Telecomunicaciones para las oficinas principales del GACM	active	0		600000.00	MXN	Adjudicación directa	Articulo 42 de la LAASSP por un monto que no exede los montos máximos que al efecto se esteblecieron en el PEF.	Articulo 42 de la LAASSP por un monto que no exede los montos máximos que al efecto se esteblecieron en el PEF.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
181	181	1	Adecuación de espacios en el campamento existente en la puerta 8 del polígono del NAICM	Adecuación de espacios en el campamento existente en la puerta 8 del polígono del NAICM	active	0		1420000.00	MXN	Adjudicación directa	Artículo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas 	Artículo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas 		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
116	116	AA-009KDH99-E13-2016	Servicios de infraestructura de comunicación de voz, datos y video para el Grupo Aeroportuario de la Ciudad de México S.A. de C.V.	Contratar los servicios de infraestructura de comunicación de voz, datos y video para el Grupo Aeroportuario de la Ciudad de México S.A. de C.V. durante los ejercicios fiscales 2015 al 2018, con el objetivo de contar con la implementación de la infraestructura necesaria asi como el soporte tecnico y atención de incidentes correspondientes para dotar a su personal de los medios y herramientas para el debido cumplimiento de las actividades sustantivas que tienen encomendadas para la consecución de los dines de la entidad.	active	0		35399080.95	MXN	Adjudicación directa	Articulo 72 fracción III del RLAASSP, en realción al 41 de la LAASSP se adhiere al contrato número P/S/104/14/2014 , en terminos de lo dispuesto en los artiulos 26, fracción III, 40,41, fracción III, 45, 47 y demás relativos y aplicables de la LAASSP.	Articulo 72 fracción III del RLAASSP, en realción al 41 de la LAASSP se adhiere al contrato número P/S/104/14/2014 , en terminos de lo dispuesto en los artiulos 26, fracción III, 40,41, fracción III, 45, 47 y demás relativos y aplicables de la LAASSP.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
117	117	985627	Servicio de Dictámen y Certificado de UVIE	Realizar la verificación de las instalaciones eléctricas de Altavista 	active	0		70000.00	MXN	Adjudicación directa	42 de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público, 30 de su Reglamento, 28, 29, 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales	42 de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público, 30 de su Reglamento, 28, 29, 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
118	118	1045668	Arrendamiento de Mobiliario consistente en Mesas de Trabajo y Sillas Secretariales	Arrendamiento de Mobiliario consistente en Mesas de Trabajo y Sillas Secretariales	active	0		250000.00	MXN	Adjudicación directa	Artículos 3, fracción I, 26, fracción III, 28, fracción I, 40 último párrafo, 42, 45 y 47 de la LAASSP	Artículos 3, fracción I, 26, fracción III, 28, fracción I, 40 último párrafo, 42, 45 y 47 de la LAASSP		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
122	122	AD-AS-DCAGI-SC-109/15	Prestación de Servicios Profesionales  para fungir como enlace  y vocería en el ámbito  nacional e internacional y con actores claves que aseguren la ejecución del  proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México	Prestación de Servicios Profesionales  para fungir como enlace  y vocería en el ámbito  nacional e internacional y con actores claves que aseguren la ejecución del  proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México	active	0		1752166.08	MXN	Adjudicación directa	Adjudicación directa. Oficio GACM/DCAGI/DCF/0212/2015  de fecha 28 de octubre de 2015 y firmado por el Lic. Ricardo Dueñas Espriu.	"…con fundamento en el artículo 50   de la Ley Federal de Presupuesto y Responsabilidad Hacendaria y 148 de su reglamento, así como del oficio GACM//DG/129/2015 se autoriza celebrar   el contrato plurianual...."		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
152	152	983798	Servicio de un testigo social para que atestigüe las etapas del procedimiento de la licitación pública internacional bajo la cobertura de tratados de libre comercio, consistente en diseñar e instrumentar el modelo virtual de información para la construcción del BIM del NAICM	Servicio de un testigo social para que atestigüe las etapas del procedimiento de la licitación pública internacional bajo la cobertura de tratados de libre comercio, consistente en diseñar e instrumentar el modelo virtual de información para la construcción del BIM del NAICM	active	293550.76	MXN	432601.10	MXN	Adjudicación directa	Artículo 41 fracción XIV de la Ley  de Adquisiciones, Arrendamientos y Servicios del Sector Público.	Artículo 41 fracción XIV de la Ley  de Adquisiciones, Arrendamientos y Servicios del Sector Público.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
182	182	1			active	0		0	MXN	Adjudicación directa				Nacional		\N	\N	\N	\N	0		\N	\N	0	\N	
191	191	No aplica	Campaña de exploración geotécnica de campo 2015. Muestreo y sistemas de Medición en el subsuelo en las zonas de aeropistas, calles de redaje y caminos internos del NAICM, en Texcoco, Estado de México	Campaña de exploración geotécnica de campo 2015. Muestreo y sistemas de Medición en el subsuelo en las zonas de aeropistas, calles de redaje y caminos internos del NAICM, en Texcoco, Estado de México	none	0		182500000	MXN	Adjudicación directa	Artículo 1 de la LOPSRM			Presencial		\N	\N	\N	\N	0		\N	\N	1	\N	
166	166	798985	Plan de Monitoreo, registro y verificación de emisión de gases de efecto invernadero para el Nuevo Aeropuerto Internacional de la Ciudad de México.	Plan de Monitoreo, registro y verificación de emisión de gases de efecto invernadero para el Nuevo Aeropuerto Internacional de la Ciudad de México.	active	0	MXN	539400.00	MXN	Adjudicación directa	Artículo 43 de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.	Nacional		transferencia		\N	\N	\N	\N	0		\N	\N	1	\N	
186	186	-	Servicio de sanitarios portátiles para el programa de empleo temporal (PET)	Servicio de sanitarios portátiles para el programa de empleo temporal (PET)	complete	0	MXN	0	MXN	Adjudicación directa	Artículo 42 de la LAASSP					\N	\N	\N	\N	0		\N	\N	1	\N	
119	119	AA-009KDH999-E11-2016	Servicios para dar cumplimiento en lo dispuesto a las atribuciones de Grupo Aeroportuario de la Ciudad de México S.A. de C.V., relacionados con participaren el diseño e implementación de la política de información, difusión y comunicación social	Servicios para dar cumplimiento en lo dispuesto a las atribuciones de Grupo Aeroportuario de la Ciudad de México S.A. de C.V., relacionados con participaren el diseño e implementación de la política de información, difusión y comunicación social	active	0		1573425	MXN	Adjudicación directa	Artículo 134 de la Constitución Política de los Estados Únicos Mexicanos, 41 fracción XIV de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público y 28,29,30,31 y 33 de la Ley Federal de Entidades Paraestatales, Numeral 1.4.3.1, del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V. 	Artículo 134 de la Constitución Política de los Estados Únicos Mexicanos, 41 fracción XIV de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público y 28,29,30,31 y 33 de la Ley Federal de Entidades Paraestatales, Numeral 1.4.3.1, del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México, S.A. de C.V. 		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
44	44	-	Realización de los Servicios Consistentes en la Mecánica de Suelos, Levantamiento Topográfico y Elaboración de Ingenieria Básica de: S.E. Maniobras Aeropuerto SF6 NAICM (5 ALIMENT-230 KV); S.E. Aeropuerto SF6 (NAICM) (3T-3F-60/80 MVA 230/23/0 KV-2/16/0 A) y L.T. Maniobras Aeropuerto NAICM (230 KV-13-CU-XLP A)	Realización de los Servicios Consistentes en la Mecánica de Suelos, Levantamiento Topográfico y Elaboración de Ingenieria Básica de: S.E. Maniobras Aeropuerto SF6 NAICM (5 ALIMENT-230 KV); S.E. Aeropuerto SF6 (NAICM) (3T-3F-60/80 MVA 230/23/0 KV-2/16/0 A) y L.T. Maniobras Aeropuerto NAICM (230 KV-13-CU-XLP A)	none	0		3800000	MXN	Adjudicación directa	Artículo 1 de la LOPSRM					\N	\N	\N	\N	0		\N	\N	1	\N	
153	153	1	Contratación del Servicio de Comunicaciones para el Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	Prestación del servicio de comunicaciones para el Grupo Aeroportuario de la Ciudad de México, S.A. de C.V. para los ejercicios fiscales 2015 al 2018, en adelante los servicios serán prestados totalmente a satisfacción de GACM de conformidad con las especificaciones y características establecidas en el anexo técnico y la propuesta técnica y económica.	active	0		39479421.55	MXN	Adjudicación directa	La celebración del presente contrato la lleva a cabo bajo el procedimiento de adjudicación directa, en términos de lo dispuesto en los artículos 26 fracción III, 40, 41, fracción III, 45, 47 y demás relativos y aplicables de la LAASSP.	La celebración del presente contrato la lleva a cabo bajo el procedimiento de adjudicación directa, en términos de lo dispuesto en los artículos 26 fracción III, 40, 41, fracción III, 45, 47 y demás relativos y aplicables de la LAASSP.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
35	35	799042	Elaboración de programa de capacitación en aspectos ambientales y de seguridad para las etapas de preparación del sitio y construcción del Nuevo Aeropuerto Internacional de la Ciudad de México	Elaboración de programa de capacitación en aspectos ambientales y de seguridad para las etapas de preparación del sitio y construcción del Nuevo Aeropuerto Internacional de la Ciudad de México	complete	0	MXN	602040.00	MXN	Adjudicación directa	Artículo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas					\N	\N	\N	\N	0		\N	\N	1	\N	
45	45	-	"Establecer los mecanismos de colaboración entre Grupo Aeroportuario de la Ciudad de México y el Instituto Mexicano de Administarción Pública A.C. para llevar a cabo, mediante la suscripción del instrumento correspondiente el desarrollo y ejecución de las actividades de los programas y proyectos que el GACM requeira a traves de la prestación de servicios relativos a als especialidades y disciplinas especificas, el INAP este en posibilidades de aportar."	"Establecer los mecanismos de colaboración entre Grupo Aeroportuario de la Ciudad de México y el Instituto Mexicano de Administarción Pública A.C. para llevar a cabo, mediante la suscripción del instrumento correspondiente el desarrollo y ejecución de las actividades de los programas y proyectos que el GACM requeira a traves de la prestación de servicios relativos a als especialidades y disciplinas especificas, el INAP este en posibilidades de aportar."	active	0		0	MXN	Adjudicación directa	Artículo 1 de la LAASSP					\N	\N	\N	\N	0		\N	\N	1	\N	
145	145	1	Servicios de diseño y arquitectura consistentes en forma enunciativa mas no limitativa, en la elaboración de los proyectos ejecutivos (diseño arquitectónico e ingeniería de detalle), que permitan la construcción del "edificio terminal de pasajeros, vialidades de acceso y estacionamientos" y "torre de control y centros de control de operaciones" del "NAICM" así como el acompañamiento arquitectónico. Servicios de diseño y arquitectura consistentes en forma enunciativa mas no limitativa, en la elaboración de los proyectos ejecutivos (diseño arquitectónico e ingeniería de detalle), que permitan la construcción del "edificio terminal de pasajeros, vialidades de acceso y estacionamientos" y "torre de control y centros de control de operaciones" del "NAICM" así como el acompañamiento arquitectónico.	Servicios de diseño y arquitectura consistentes en forma enunciativa mas no limitativa, en la elaboración de los proyectos ejecutivos (diseño arquitectónico e ingeniería de detalle), que permitan la construcción del "edificio terminal de pasajeros, vialidades de acceso y estacionamientos" y "torre de control y centros de control de operaciones" del "NAICM" así como el acompañamiento arquitectónico.	active	0		2136433615	MXN	Adjudicación directa	Artículo 42 fracción IV de la LOPSRM	Artículo 42 fracción IV de la LOPSRM		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
146	146	AA-009KDH999-E81-2016	Servicios de suministro de combustible, lubricantes y aditivos para vehículos automotores terrestres.	Servicios de suministro de combustible vehicular	active	0		17267047.50	MXN	Adjudicación directa	Numeral 152 del acuerdo por el que se establecen las disposiciones en Materia de recursos Materiales y servicios Generales	Numeral 152 del acuerdo por el que se establecen las disposiciones en Materia de recursos Materiales y servicios Generales		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
148	148	1	Servicio de recolección de residuos urbanos	Servicio de recolección de residuos urbanos	active	0		130000.00	MXN	Adjudicación directa	Artículo 42 y 45 de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público 	Artículo 42 y 45 de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público 		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
154	154	1043484	Materiales para la Construcción	Materiales para la Construcción	active	0		400000.00	MXN	Adjudicación directa	Artículos 26, fracción III y 42 de la LAASSP	Artículos 26, fracción III y 42 de la LAASSP		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
173	173	-	"Estudio de rehabilitacion y adaptacion de los canales existentes para que funcionen como infraestructura de drenaje temporal, y remocion de material de desecho, en el terreno del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)"	"Estudio de rehabilitacion y adaptacion de los canales existentes para que funcionen como infraestructura de drenaje temporal, y remocion de material de desecho, en el terreno del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)"	complete	0		1400000.00	mxn	Adjudicación directa	Artículo 1 de la LOPSRM					\N	\N	\N	\N	0		\N	\N	1	\N	
170	170	1043372 	Servicios consistentes en Baños portátiles	Servicios consistentes en Baños portátiles	complete	0		750000.00	MXN	Adjudicación directa	Artículo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas 	Nacional		transferencia		\N	\N	\N	\N	0		\N	\N	1	\N	
147	147	1	Servico de Testigo Social para que Atestigüe las Etapas del Procedimiento del la Licitación Pública Internacional del Proyecto Denominado "Desarrollo de Ingeniería de Detalle y Contrucción de Subestaciones y Acometida Eléctrica del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	Servico de Testigo Social para que Atestigüe las Etapas del Procedimiento del la Licitación Pública Internacional del Proyecto Denominado "Desarrollo de Ingeniería de Detalle y Contrucción de Subestaciones y Acometida Eléctrica del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	active	0		294205.12	MXN	Adjudicación directa	Artículo 42 Y 47 de la Ley  de Adquisiciones, Arrendamiento y Servicios del Sector Público.	Artículo 42 Y 47 de la Ley  de Adquisiciones, Arrendamiento y Servicios del Sector Público.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
57	57	1051687	Servicios Profesionales consistentes en la Consultoría y Asesoría preventiva en Materia Laboral	Servicios Profesionales consistentes en la Consultoría y Asesoría preventiva en Materia Laboral	complete	0		424560	MXN	Adjudicación directa	Artículo 42 de la Ley  de Adquisiciones, Arrendamientos y Servicios del Sector Público.			Presencial		\N	\N	\N	\N	0		\N	\N	1	\N	
193	193	-	Servicio Especializado Para la Instrumentación del Manual de Integración y Funcionamiento del Subcomité de Revisión de Convocatorias Del Grupo Aeroportuario de La Ciudad de México, S.A. de C.V.	Facilitar la gestión institucional, como un elemento que se añadirá a los manuales de procedimientos, criterios y demás mecanismos que resulten indispensables para la adecuada administración de los recursos humanos y materiales que requiera un proyecto de la magnitud del nuevo aeropuerto del Valle de México.	complete	0		103448.28	MXN	Adjudicación directa	La contratación de este servicio la realiza mediante adjudicación directa con fundamento en lo dispuesto en los artículos 26, fracción III y 42 de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Publico.					\N	\N	\N	\N	0		\N	\N	1	\N	
195	195	-	nfiguración Inicial de Equipos Instalados en el Inmueble de Altavista Para Servicio de Red Local, Seguridad de Datos y Telefonía.	Contar con el servicio de configuración inicial personalizada para los equipos instalados en el inmueble de Altavista, con el propósito de iniciar operaciones de manera inmediata y proveer a los usuarios del Grupo Aeroportuario de la Ciudad de México (GACM) de conexión a la red de datos, seguridad física y lógica en el acceso a internet, configuración de los teléfonos y del conmutador.	complete	0	MXN	224176	MXN	Adjudicación directa	La contratación de este servicio la realiza bajo el procedimiento de adjudicación directa, en términos de lo establecido en los artículos 26 fracción III y 42 de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público.					\N	\N	\N	\N	0		\N	\N	1	\N	
38	38	-	Elaboración y puesta en marcha del Sistema Integeal e Gestión de Cumplimiento Ambiental (SIGCA) para el Proyecto Nuevo Aeropuerto Internacional de la Ciudad de México	Elaboración y puesta en marcha del Sistema Integeal e Gestión de Cumplimiento Ambiental (SIGCA) para el Proyecto Nuevo Aeropuerto Internacional de la Ciudad de México	complete	0	MXN	134800000.00	MXN	Adjudicación directa	Artículo 1 de la LOPSRM			Presencial		\N	\N	\N	\N	0		\N	\N	1	\N	
121	121	1	Servicio de Limpieza Integral para los Inmuebles de Santa Catarina-Altavista y Torre Murano del Grupo Aeroportuario de la Ciudad de México S.A. de C.V.  	Llevar a cabo la contratación del "Servicio de Limpieza Integral para Inmuebles de Santa Catarina - Altavista y Torre Murano, Grupo Aeroportuario de la Ciudad de México S.A. de C.V" 	active	0		35801	MXN	Adjudicación directa	Articulos  26 fracción III, 42 y 47 de la Ley de Adquisisiones, Arrendamientos y Servicios del Sector Público.	Articulos  26 fracción III, 42 y 47 de la Ley de Adquisisiones, Arrendamientos y Servicios del Sector Público.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
129	129	902535	Prestación de los Servicios consistentes en la "Asesoría técnica especializada para la debia consecución de los onjeticos encomendados a esta empresa de participación estatal mayoritaria y de esta forma asegurar la adecuada operación de la Infraestructura Aeroportuaria del Valle de México (IAVM)	Prestación de los Servicios consistentes en la "Asesoría técnica especializada para la debia consecución de los onjeticos encomendados a esta empresa de participación estatal mayoritaria y de esta forma asegurar la adecuada operación de la Infraestructura Aeroportuaria del Valle de México (IAVM)	active	0		1705000.00	MXN	Adjudicación directa	Artículo 42, párrafo segundo y tercero de la Ley  de Adquisiciones, Arrendamientos y Servicios del Sector Público.	Artículo 42, párrafo segundo y tercero de la Ley  de Adquisiciones, Arrendamientos y Servicios del Sector Público.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
149	149	1044199	Servicio integral de correo electrónico y directorio activo	Servicio integral de correo electrónico y directorio activo	active	0		490000.00	MXN	Adjudicación directa	Artículo 42 de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público	Artículo 42 de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
175	175	1	Servicios de infraestructura de comunicación de voz, datos y video para el Grupo Aeroportuario de la Ciudad de México S.A. de C.V.	Contratar los servicios de infraestructura de comunicación de voz, datos y video para el Grupo Aeroportuario de la Ciudad de México S.A. de C.V. durante los ejercicios fiscales 2015 al 2018, con el objetivo de contar con la implementación de la infraestructura necesaria asi como el soporte tecnico y atención de incidentes correspondientes para dotar a su personal de los medios y herramientas para el debido cumplimiento de las actividades sustantivas que tienen encomendadas para la consecución de los dines de la entidad.	active	0		35399080.95	MXN	Adjudicación directa	Se lleva a cabo bajo el procedimiento de Adjudicación Directa, en terminos de lo dispuesto en los artiulos 26, fracción III, 40,41, fracción III, 45, 47 y demás relativos y aplicables de la LAASSP.	Se lleva a cabo bajo el procedimiento de Adjudicación Directa, en terminos de lo dispuesto en los artiulos 26, fracción III, 40,41, fracción III, 45, 47 y demás relativos y aplicables de la LAASSP.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
165	165	799089	Elaboración de programa de acciones para mitigar el impacto ambiental de la modificación de la hidrodinámica de los humedales presentes en la zona del Nuevo Aeropuerto Internacional de la Ciudad de México	Elaboración de programa de acciones para mitigar el impacto ambiental de la modificación de la hidrodinámica de los humedales presentes en la zona del Nuevo Aeropuerto Internacional de la Ciudad de México	active	0		638000	MXN	Adjudicación directa	Artículo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas 	Nacional		transferencia		\N	\N	\N	\N	0		\N	\N	1	\N	
51	51	1060623	Estacionamiento de Vehículos 	Estacionamiento de Vehículos 	complete	0		400000	MXN	Adjudicación directa	La contratación de este servicio la realiza mediante el procedimiento de Adjudicación Directa, de acuerdo a lo establecido en los artículos 134 de la Constitución Política de lo Estados Unidos Mexicanos, 26, fracción III, 42 y 47 de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público.					\N	\N	\N	\N	0		\N	\N	1	\N	
192	192	-	Arrendamiento de equipo de cómputo de impresión, de telefonía IP y equipos de red al GACM	El arrendamiento de equipo de cómputo, de impresión, de telefonía IP y equipos de red al "GACM" 	complete	0	MXN	0	MXN	Adjudicación directa	42 de la Ley de Adquisiciones, arrendamientos y Servicios del Sector Público					\N	\N	\N	\N	0		\N	\N	1	\N	
52	52	1081482	Servicio para diseñar la pagina WEB del Grupo Aeroportuario de la Ciudad de México (GACM) para el Proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México	Servicio para diseñar la pagina WEB del Grupo Aeroportuario de la Ciudad de México (GACM) para el Proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México	complete	0		240120	MXN	Adjudicación directa	Artículo 42 de la Ley  de Adquisisciones, Arrendamientos y Servicios del Sector Público.			Presencial		\N	\N	\N	\N	0		\N	\N	1	\N	
124	124	1	Servicio y Proceso de Nómina mediante un Sistema Especializado para Recursos Humanos y Nómina de Gobierno	Implantar un servicio especializado para cumplir con la obligación del pago de nómina dentro de la normatividad de las leyes laborales para lograr la mejora contínua de los procedimientos administrativos.	complete	0		305000.00	MXN	Adjudicación directa				Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
126	126	SA-009KDH999-N5-2015	Servicio Integral de Limpieza en las Oficinas de GACM	Servicio Integral de Limpieza en las Oficinas de Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	active	0		65000.00	MXN	Adjudicación directa	Artículo 42 de la Ley de Adquisiciones Arrendamientos y Servicios del Sector Público	Artículo 42 de la Ley de Adquisiciones Arrendamientos y Servicios del Sector Público		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
127	127	749472	Prestación de los Servicios de Auditoría Externa que se realizarán sobre los estados financieros de la entidad con cifras al 31 de diciembre de 2014. 	Prestación de los Servicios de Auditoría Externa que se realizarán sobre los estados financieros de la entidad con cifras al 31 de diciembre de 2014. 	active	0		46371.00	MXN	Adjudicación directa	Artículo 41 fracción I de la Ley  de Adquisicioens, Arrendamientos y Servicios del sector Público.	Artículo 41 fracción I de la Ley  de Adquisicioens, Arrendamientos y Servicios del sector Público.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
40	40	-	Establecer un mecanismo de coordinación corresponsable entre las partes. Para el mantenimiento y la operación de las obras de infraestructura para llevar a cabo la regulación hidraulica en las zonas aledañas al proyecto que permitan favorecer y mejorar el hábitat para las aves acuáticas migratorias que arrivan a la zona, así como las aves residentes y realizar en forma coordinada la operación y mantenimiento de las obras hidráulicas de regulación y conducción de los escurimientos pluviales provenientes del interior del perímetro del proyecto, durante su etapa de construcción, a través de un sistema de drenaje que operará temporalmente, los cuáles serán regulados en dos lagunas a cargo del GACM y cuyas descargas al Dren General del Valle. Quedarán bajo el control de la CONAGUA	Establecer un mecanismo de coordinación corresponsable entre las partes. Para el mantenimiento y la operación de las obras de infraestructura para llevar a cabo la regulación hidraulica en las zonas aledañas al proyecto que permitan favorecer y mejorar el hábitat para las aves acuáticas migratorias que arrivan a la zona, así como las aves residentes y realizar en forma coordinada la operación y mantenimiento de las obras hidráulicas de regulación y conducción de los escurimientos pluviales provenientes del interior del perímetro del proyecto, durante su etapa de construcción, a través de un sistema de drenaje que operará temporalmente, los cuáles serán regulados en dos lagunas a cargo del GACM y cuyas descargas al Dren General del Valle. Quedarán bajo el control de la CONAGUA	complete	0	MXN	0	MXN	Adjudicación directa	Artículo 1 de la LOPSRM		Términos de referencia para  la "Establecer un mecanismo de coordinación corresponsable entre las partes. Para el mantenimiento y la operación de las obras de infraestructura para llevar a cabo la regulación hidraulica en las zonas aledañas al proyecto que permitan favorecer y mejorar el hábitat para las aves acuáticas migratorias que arrivan a la zona, así como las aves residentes y realizar en forma coordinada la operación y mantenimiento de las obras hidráulicas de regulación y conducción de los escurimientos pluviales provenientes del interior del perímetro del proyecto, durante su etapa de construcción, a través de un sistema de drenaje que operará temporalmente, los cuáles serán regulados en dos lagunas a cargo del GACM y cuyas descargas al Dren General del Valle. Quedarán bajo el control de la CONAGUA". 	Presencial		\N	\N	\N	\N	0		\N	\N	1	\N	
208	208	AA-009KDH999-E1-2016	Servicio de Estacionamiento para Vehículos 	Llevar a cabo la contratación de la pensión para los vehículos del personal de Grupo Aeroportuario de la Ciudad de México S.A. de C.V.  Que no cuentan con un lugar de estacionamiento en Torre Murano.	active	0		0	MXN	Adjudicación directa	Articulos 134 de la Constitución Política de los Estados Unidos Mexicanos, 26 fracción III, 42 y 47 de la Ley de Adquisisiones, Arrendamientos y Servicios del Sector Públic	Articulos 134 de la Constitución Política de los Estados Unidos Mexicanos, 26 fracción III, 42 y 47 de la Ley de Adquisisiones, Arrendamientos y Servicios del Sector Públic		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
212	212	1	Instrumentar un esquema de colaboración que permita establecer las bases generales para desarrollar la especialidad de Ingeniería Aeroportuaria 	Instrumentar un esquema de colaboración que permita establecer las bases generales para desarrollar la especialidad de Ingeniería Aeroportuaria 	active	0		0	MXN	Adjudicación directa	Artículo 1 de la LOPSRM	Artículo 1 de la LOPSRM		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
216	216	1	Sevicios de Regularización de la Información Relativa a la Auditoria Corporativa de Grupo Aeroportuario de la Ciudad de México, S.A. De C.V.	Sevicios de Regularización de la Información Relativa a la Auditoria Corporativa de Grupo Aeroportuario de la Ciudad de México, S.A. De C.V.	active	0		389000.00	MXN	Adjudicación directa	Artículo 42 de la Ley  de Adquisiciones, Arrendamientos y Servicios Relacionados con las Mismas.	Artículo 42 de la Ley  de Adquisiciones, Arrendamientos y Servicios Relacionados con las Mismas.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
131	131	-	Servicios de transporte en camionetas de redilas, con capacidad de carga de 3.5 toneladas, doble rodada, para movilidad de materiales y equipo	Servicios de transporte en camionetas de redilas, con capacidad de carga de 3.5 toneladas, doble rodada, para movilidad de materiales y equipo	complete	0	MXN	688000.00	MXN	Adjudicación directa	Artículo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas					\N	\N	\N	\N	0		\N	\N	1	\N	
168	168	1099156	Supervisión Técnica Administrativa y de Control de Calidad para los Trabajos de Carga, Acarreo y Descarga fuera del Polígono del material existente, producto de depósitos de Demolición, Desperdicio y Desazolve	Supervisión Técnica Administrativa y de Control de Calidad para los Trabajos de Carga, Acarreo y Descarga fuera del Polígono del material existente, producto de depósitos de Demolición, Desperdicio y Desazolve	complete	0		7519121	MXN	Adjudicación directa	Artículo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas 					\N	\N	\N	\N	0		\N	\N	1	\N	
132	132	798985	Pruebas de Laboratorio Geotécnicas complementarias para el Proyecto Ejecutivo de Sistema de Drenaje Temporal del Nuevo Aeropuerto Internacional de la Ciudad de México	Pruebas de Laboratorio Geotécnicas complementarias para el Proyecto Ejecutivo de Sistema de Drenaje Temporal del Nuevo Aeropuerto Internacional de la Ciudad de México	complete	0	MXN	163793.10	MXN	Adjudicación directa	Artículo 43 de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.					\N	\N	\N	\N	0		\N	\N	1	\N	
209	209	1038567	Servicio de asistencia técnica especializada en materia de Geotecnia y Cimentación aplicada a la infraestructura aeroportuaria.	Servicio de asistencia técnica especializada en materia de Geotecnia y Cimentación aplicada a la infraestructura aeroportuaria.	active	0		15650000.00	MXN	Adjudicación directa	Artículo 42 Fracción X de la Ley de Obras Públicas y Servicios Relacionados con las Mismas 	Artículo 42 Fracción X de la Ley de Obras Públicas y Servicios Relacionados con las Mismas 		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
203	203	No aplica	Servicios consistentes en el apoyo técnico y tecnológico para la implementación y ejecución de planes y programas de logística de construcción del NAICM	Servicios consistentes en el apoyo técnico y tecnológico para la implementación y ejecución de planes y programas de logística de construcción del NAICM	complete	0		310000000	MXN	Adjudicación directa	Artículo 1 de la LOPSRM			Presencial		\N	\N	\N	\N	0		\N	\N	1	\N	
171	171	993709	Estudios del Sistema de Drenaje Pluvial del Nuevo Aeropuerto Internacional de la Ciudad de México.	Estudios del Sistema de Drenaje Pluvial del Nuevo Aeropuerto Internacional de la Ciudad de México.	complete	0		6999000.00	MXN	Adjudicación directa	Artículos 27 fracción III, 41, 42 fracción X de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.	Nacional 				\N	\N	\N	\N	0		\N	\N	1	\N	
201	201	-	Contrato de Servicios Profesionales en materia de vinculación con organismos internacionales y adopción de las mejores prácticas internacionales para la consecución de sus objetivos y asegurar una adecuada infraestructira aeroportuaria  para la operación del AIVM "	Permitira obtener los  Servicios Profesionales en materia de vinculación con organismos internacionales y adopción de las mejores prácticas internacionales para la consecución de sus objetivos y asegurar una adecuada infraestructira aeroportuaria  para la operación del AIVM 	none	0		1704113.00	MXN	Adjudicación directa	arítculo 134  de la la Constitución Politíca de los Estados Unidos Mexicanos, 41 fraccion III de la Ley de Adquisiciones , Arrendamientos y Servicios del Sector Público, y 71 de su Reglamento, 28, 29, 30, 31 y 33 de Ley Federal de Entidades Paraestatales, numeral 1.4.3 del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México.....fue dictaminada procedente la excepción de Licitación Pública  para la contratación vía Adjudicación  Directa con su representada.	Nacional				\N	\N	\N	\N	0		\N	\N	1	\N	
214	214	1	Servicios Profesionales de Levantamiento de Imagen y Video de Nuevo Aeropuerto Internacional de la Ciudad de México.	Servicios Profesionales de Levantamiento de Imagen y Video de Nuevo Aeropuerto Internacional de la Ciudad de México.	active	0		30554700.00	MXN	Adjudicación directa	Artículo 42 de la Ley Adquisiciones Arrendamiento y Servicios del Sector Público	Artículo 42 de la Ley Adquisiciones Arrendamiento y Servicios del Sector Público		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
215	215	1	Servicio de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia	Servicio de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia	active	0		298780.56	MXN	Adjudicación directa	Articulo 26 fraccion III y articulo 42 de la LAASSP.	Articulo 26 fraccion III y articulo 42 de la LAASSP.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
211	211	1	Servicio de asesoría financiera y legal para la obtención del financiamiento, desarrollo de estructura jurídica, concesionamiento y demás actividades relacionadas con la financiación para la construcción del NAICM	Servicio de asesoría financiera y legal para la obtención del financiamiento, desarrollo de estructura jurídica, concesionamiento y demás actividades relacionadas con la financiación para la construcción del NAICM	active	0		64100000.00	MXN	Adjudicación directa	Artículo 3 fracción VII, 19, 26 fracción III, 40 y 41 fracción X, segundo párrafo de la LAASSP, 71 y 72 fracción VII, inciso B, numerales 1 a 3 y 14 fracción VI de la LFTAIP.	Artículo 3 fracción VII, 19, 26 fracción III, 40 y 41 fracción X, segundo párrafo de la LAASSP, 71 y 72 fracción VII, inciso B, numerales 1 a 3 y 14 fracción VI de la LFTAIP.		Nacional		\N	\N	\N	\N	0		\N	\N	3	\N	
205	205	-	Servicio de Telefonía Celular	Dotar al personal del GACM de la infraestructura en comunicaciones que permita realizar diversas actividades asociadas a la operación y supervisión de las acciones encomendadas.	complete	0		862560	MXN	Adjudicación directa	41 Fracción III de la Ley de Adquisiciones , Arrendamientos y Servicios del Sector Público y 28, 29, 30, 31 y 33 de la Ley Federal de las Entidades Paraestatales					\N	\N	\N	\N	0		\N	\N	1	\N	
198	198	-	Gerencia del proyecto para atender la demanda de servicios aeroportuarios en el centro del país	Gerencia del proyecto para atender la demanda de servicios aeroportuarios en el centro del país	complete	0		3415030000.00	MXN	Adjudicación directa	Artículo 4, 27 fracción III, 30 fracción II, 41  y 42 fracción IV de la LOPSRM y 3 fracción I y V, fracciones I, III, V, VII y XII de la Ley de Seguridad Nacional					\N	\N	\N	\N	0		\N	\N	1	\N	
202	202	1033446	Servicios de experto revisor para la asistencia técnica especializada en materia de protección contra incendios, aplicada a la infraestructura aeroportuaria	Servicios de experto revisor para la asistencia técnica especializada en materia de protección contra incendios, aplicada a la infraestructura aeroportuaria	complete	0		26000000.00	MXN	Adjudicación directa	Artículo 42, fracción X de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.	Nacional		transferencia		\N	\N	\N	\N	0		\N	\N	1	\N	
217	217	1	Proyecto de Salvamento Arqueológico en el interior del Lago de Taxcoco en su zona oriente, Estado de México. (Supervisión, Vigilancia y Excavaciones 2016), en Adelante los SERVICIOS, mismos que serán realizados totalmente a satisfacción del GACM	Proyecto de Salvamento Arqueológico en el interior del Lago de Taxcoco en su zona oriente, Estado de México. (Supervisión, Vigilancia y Excavaciones 2016), en Adelante los SERVICIOS, mismos que serán realizados totalmente a satisfacción del GACM	active	0		10163709.00	MXN	Adjudicación directa	Artículo 42, párrafo segundo y tercero de la Ley  de Adquisiciones, Arrendamientos y Servicios del Sector Público.	Artículo 42, párrafo segundo y tercero de la Ley  de Adquisiciones, Arrendamientos y Servicios del Sector Público.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
135	135	-	Arrendamiento de  Torre Murano Piso 1	Uso y goce temporal del Bien arrendado y los cajones de estacionamiento	complete	0	MXN	7417573.60	MXN	Adjudicación directa	Numeral 152 del acuerdo por el que se establecen las disposiciones en Materia de recursos Materiales y servicios Generales					\N	\N	\N	\N	0		\N	\N	1	\N	
158	158	1024662	Servicio de Testigo Social, para que atestigue las Etapas del Procedimiento de la Licitación Pública Nacional de Obra Pública de Nivelación y Limpieza del Terreno del Nuevo Aeropuerto Internacional de la Ciudad de México.	Servicio de Testigo Social, para que atestigue las Etapas del Procedimiento de la Licitación Pública Nacional de Obra Pública de Nivelación y Limpieza del Terreno del Nuevo Aeropuerto Internacional de la Ciudad de México.	complete	0	MXN	400156.03	MXN	Adjudicación directa	Art. 54 del RLOSRM, 26 fracción III, 41, fracción I y 47, de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público, y los artículos 71 y 72 fracción II, segundo párrafo de su reglamento.					\N	\N	\N	\N	0		\N	\N	1	\N	
160	160	-	Instalación de equipo de Medición de Energía  Eléctrica en las Puertas 7 y 8 del Nuevo aeropuerto Internacional de la Ciudad de México (NAICM)	Instalación de equipo de Medición de Energía  Eléctrica en las Puertas 7 y 8 del Nuevo aeropuerto Internacional de la Ciudad de México (NAICM)	active	0	MXN	67996.00	MXN	Adjudicación directa	Lo dispuesto a los articulos 134 de la Constitución Politica de Los estados Unidos Mexicanos, asi como en los dispuesto en el articulo 43 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas.			Presencial		\N	\N	\N	\N	0		\N	\N	1	\N	
155	155	-	Los servicios de protección, custodia, vigilancia y seguridad de sus bienes e intalaciones, así como el diseño e implementación de sistemas de seguridad y su supervisión permanente	Los servicios de protección, custodia, vigilancia y seguridad de sus bienes e intalaciones, así como el diseño e implementación de sistemas de seguridad y su supervisión permanente	complete	110505537.00	MXN	858330000.00	MXN	Adjudicación directa	Artículo 1 de la LAASSP y LOPSRM			Presencial		\N	\N	\N	\N	0		\N	\N	1	\N	
73	73	-			none	0		0		Convenio de colaboración						\N	\N	\N	\N	0		\N	\N	1	\N	
221	221	1			active	0		0	MXN	Convenio de colaboración				Nacional		\N	\N	\N	\N	0		\N	\N	0	\N	
157	157	1044735	Servicio de un Testigo Social para que atestigue la Etapas del procedimiento de Licitación Pública de Obra Pública de "Construcción de los Caminos provisionsles de Acceso al (NAICM), ejecutando Trabajos de Terraceria, Estructura, Obras de Drenaje, Pavimentación y Señalamiento".	Servicio de un Testigo Social para que atestigue la Etapas del procedimiento de Licitación Pública de Obra Pública de "Construcción de los Caminos provisionsles de Acceso al (NAICM), ejecutando Trabajos de Terraceria, Estructura, Obras de Drenaje, Pavimentación y Señalamiento".	active	191793.60	MXN	479484.00	MXN	Adjudicación directa	Artículo 41 y 47 de la LAASSP.					\N	\N	\N	\N	0		\N	\N	1	\N	
156	156	1044509	Servicio de Testigo Social para que Atestigüe la Etapas del Procedimiento de la Licitación Pública Nacional de Obra Pública de Carga, Acarreo y Descarga Dentro y Fuera del Polígono del Material Existente, Producto de Depósitos de Demoliciones y Desazolve, Incluye Conformación del Terreno donde se Construirá el Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM) para el NAICM	Servicio de Testigo Social para que Atestigüe la Etapas del Procedimiento de la Licitación Pública Nacional de Obra Pública de Carga, Acarreo y Descarga Dentro y Fuera del Polígono del Material Existente, Producto de Depósitos de Demoliciones y Desazolve, Incluye Conformación del Terreno donde se Construirá el Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM) para el NAICM	complete	0	MXN	390000.00	MXN	Adjudicación directa	Artículo 47 fracción I, de la LAASSP.					\N	\N	\N	\N	0		\N	\N	1	\N	
172	172	1043951	Proyecto Ejecutivo para el Alumbrado Público de la Barda Perimetral del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	Proyecto Ejecutivo para el Alumbrado Público de la Barda Perimetral del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	complete	0		720001.00	MXN	Adjudicación directa	Artículos 27 fracción III, 30 fracción I, 43 y 45 fracción I de la LOPSRM.	Nacional 		transferencia		\N	\N	\N	\N	0		\N	\N	1	\N	
159	159	-	Obras de Excavación de prueba, Losa experimental y prueba de Pilotes para el El Edificio Terminal y Torre de Control del NAICM	Obras de Excavación de prueba, Losa experimental y prueba de Pilotes para el El Edificio Terminal y Torre de Control del NAICM	complete	0	MXN	0	MXN	Adjudicación directa	En terminos de lo dispuesto en el articulo 134 de la constitucion Politica de los Estados Unidos Mexicanos, en relación a lo establecido por los articulos 27 fraccion III, 30 Fraccion I, 42 fracción VII, 45 fraccion I de la LOPSRM.		Especificaciones Tecnicas de las Obras de Excavación de prueba, Losa experimental y prueba de Pilotes para el El Edificio Terminal y Torre de Control del NAICM	Presencial		\N	\N	\N	\N	0		\N	\N	1	\N	
161	161	1008381	Proyecto ejecutivo para la construcción de carriles de desaceleración, plataformas de almacenamiento y carriles de aceleración en las puertas 7, y 9 de acceso al polígono del NAICM.	Proyecto ejecutivo para la construcción de carriles de desaceleración, plataformas de almacenamiento y carriles de aceleración en las puertas 7, y 9 de acceso al polígono del NAICM.	complete	0	MXN	690000.00	MXN	Adjudicación directa	Artículo 41 y 42, fracción X de la Ley  de Obras Públicas y Servicios Relacionados con las Mismas.					\N	\N	\N	\N	0		\N	\N	1	\N	
162	162	SA-009KDH999-N10-2014	Implementación y Soporte Técnico Relacionados con Licencias de Software	Licenciamiento Oracle y servicios profesionales de implementación para crear un sistema de planificación de recursos gubernamentales "GRP", (por sus siglas en inglés, Goverment Resource Planning)	complete	0	MXN	63798178.00	MXN	Adjudicación directa	Artículo 3, fracción I, 26, fracción III, 41, fracción XX, 45 y demás relativos y aplicables a la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público y del procedimiento de Adjudicación Simplificada derivado del Contrato Marco.					\N	\N	\N	\N	0		\N	\N	1	\N	
187	187	AA-009KDH999-E67-2016	Servicio Integral de Limpieza en las Oficinas de Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	Servicio Integral de Limpieza en las Oficinas de Grupo Aeroportuario de la Ciudad de México, S.A. de C.V.	complete	0	MXN	361637.93	MXN	Adjudicación directa						\N	\N	\N	\N	0		\N	\N	1	\N	
163	163	AA-009KDH999-E74-2016	Servicio Integral de Limpieza en los inmuebles de GACM	Prestación del "Servicio integral de limpieza en los inmuebles del Grupo Aeroportuario de la Ciudad de México", los cuales serán prestados totalmente a satisfacción de GACM, de conformidad con las especificaciones y características establecidas.	complete	0	MXN	750000.00	MXN	Adjudicación directa	Artículo 40 de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Público, así como el 71 de su Reglamento					\N	\N	\N	\N	0		\N	\N	1	\N	
174	174	-	"Los servicios de protección, custodia, vigilancia y seguridad en los bienes e intalaciones de GACM."	"Los servicios de protección, custodia, vigilancia y seguridad en los bienes e intalaciones de GACM."	none	0		14925328.00	MXN	Adjudicación directa	Artículo 1 de la LAASSP			transferencia		\N	\N	\N	\N	0		\N	\N	1	\N	
183	183	798985	Servicio de Ambulancia para el Traslado de Personal, para el Programa de Empleo Temporal (PET).	Servicio de Ambulancia para el Traslado de Personal, para el Programa de Empleo Temporal (PET).	complete	0	MXN	450000.00	MXN	Adjudicación directa	Artículo 26, fracción III, 42 .LAASSP.					\N	\N	\N	\N	0		\N	\N	1	\N	
184	184	-	Servicios Profecionales de Levantamiento de Imagen y Video de Nuevo Aeropuerto Internacional de la Ciudad de México.	Servicios Profecionales de Levantamiento de Imagen y Video de Nuevo Aeropuerto Internacional de la Ciudad de México.	complete	0	MXN	30554700.00	MXN	Adjudicación directa	Artículo 42 de la Ley Adquisiciones Arrendamiento y Servicios del Sector Público					\N	\N	\N	\N	0		\N	\N	1	\N	
185	185	-	Servico de Testigo Social para que Atestigüe las Etapas del Procedimiento del la Licitación Pública Internacional del Proyecto Denominado "Desarrollo de Ingeniería de Detalle y Contrucción de Subestaciones y Acometida Eléctrica del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	Servico de Testigo Social para que Atestigüe las Etapas del Procedimiento del la Licitación Pública Internacional del Proyecto Denominado "Desarrollo de Ingeniería de Detalle y Contrucción de Subestaciones y Acometida Eléctrica del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).	complete	0	MXN	294205.12	MXN	Adjudicación directa	Artículo 42 Y 47 de la Ley  de Adquisiciones, Arrendamiento y Servicios del Sector Público.					\N	\N	\N	\N	0		\N	\N	1	\N	
71	71	-	Llevar a cabo el servicio de elaboración de programas y propuestas de acciones, ambientales para el proyecto Nuevo Aeropuerto de la Ciudad de México (NAICM)	Llevar a cabo el servicio de elaboración de programas y propuestas de acciones, ambientales para el proyecto Nuevo Aeropuerto de la Ciudad de México (NAICM)	none	0		7667600	MXN	Adjudicación directa	Artículo 1 de la LOPSRM	No aplica	No aplica	transferencia		\N	\N	\N	\N	0		\N	\N	1	\N	
188	188	SA-009KDH999-N39-2015	Contrato de Servicios Profesionales en materia de vinculación con organismos internacionales y adopción de las mejores prácticas internacionales para la consecución de sus objetivos y asegurar una adecuada infraestructira aeroportuaria  para la operación del AIVM	Permitira obtener los  Servicios Profesionales en materia de vinculación con organismos internacionales y adopción de las mejores prácticas internacionales para la consecución de sus objetivos y asegurar una adecuada infraestructira aeroportuaria  para la operación del AIVM	complete	0	MXN	1704113.00	MXN	Adjudicación directa	"…con fundamento en el arítculo 134  de la la Constitución Politíca de los Estados Unidos Mexicanos, 41 fraccion III de la Ley de Adquisiciones , Arrendamientos y Servicios del Sector Público, y 71 de su Reglamento, 28, 29, 30, 31 y 33 de Ley Federal de Entidades Paraestatales, numeral 1.4.3 del Manual de Organización de la Empresa de Participación Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de México.....fue dictaminada procedente la excepción de Licitación Pública  para la contratación vía Adjudicación  Directa con su representada..."					\N	\N	\N	\N	0		\N	\N	1	\N	
107	107	1	Servicios para la edición y distribución del libro	Servicios para la edición y distribución del libro denominado "Proyectos para el Nuevo Aeropuerto Internacional de la Ciudad de México"	active	0		1540187.50	MXN	Adjudicación directa	Art. 43 de la LAASSP	Art. 43 de la LAASSP		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
199	199	901711	Adquisión de bienes muebles por parte de GACM, consistentes en "materiales de construcción"	Adquisión de bienes muebles por parte de GACM, consistentes en "materiales de construcción"	complete	0		0		Adjudicación directa	Art. 3 fracción I, 26, fracción III, 28, fracción I, en relación con lo dispuesto por el art. 40, último párrafo, 42, 45 y demás relativos y aplicables de la LAASSP.	Nacional				\N	\N	\N	\N	0		\N	\N	1	\N	
189	189	-	Seguros Profesionales de Asistencia en seguros y Fianzas	Que la Direccion Coorporativa de Administracion y Gestion Inmobiliaria, cuente con los servicios profesionales en materia de Seguros y fianzas para el cumplimiento de sus funciones sustantivas, consistentes en: Apoyar en vigilar los intereses del GACM, Auxiliar en la DCAGI en cuanto a las negociaciones para convenir con las compañias aseguradoras, recomendar las redacciones de textos, apoyar a GACM en procesos para los casos de siniestros.	complete	0	MXN	853332.00	MXN	Adjudicación directa	Con fundamento en el articulo 134 de la Constitucion Politica de los Estados Unidos Mexicanos, 41 fraccion XIV de la LAASSP, 71 de su reglamento, 28, 29, 30, 31, y 33 de la Ley Federal de las Entidades Paraestatales , Numeral 1.4.3.1 del Manual de Organizacion de la Empresa de Participacion Estatal Mayoritaria denominada Grupo Aeroportuario de la Ciudad de Mexico, S.A. de C.V.					\N	\N	\N	\N	0		\N	\N	1	\N	
190	190	-	Servicios Administrados de Infraestructura de Operación Crítica (Data Center) Para el GACM Para los Ejercicios Fiscales 2015 a 2018.	Proveer una plataforma tecnológica mediante ambientes físicos y virtualizados (Computo, Red y Almacenamiento), que garanticen la compatibilidad y soporte de los sistemas operativos y aplicaciones para atender de manera integral los servicios que demanden las unidades administrativas del GACM.	complete	0	MXN	94138149.10	MXN	Adjudicación directa	Con Base en el articulo 72, fracción III del Reglamento de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Publico, en relación con el 41, fracción III, de la Ley de Adquisiciones, Arrendamientos y Servicios del Sector Publico, se adhiere al Contrato de Presentación de Servicios número RF-136-2013, cuya vigencia es del 17 de diciembre de 2013, y hasta 48 meses,(16 de diciembre de 2017) derivado del procedimiento de Licitación Publica Nacional numero LA-014000999-N136-2013, entre la Secretaría del Trabajo y Prevención Social y la empresa denominada METRO NET., S.A.P.I. DE C.V. Y METRO NET HOSTING, S. DE R.L. DE C.V., mismos que se agregan al contrato.					\N	\N	\N	\N	0		\N	\N	1	\N	
204	204	No aplica	Establecer un mecanismo correspondiente entre GACM y CONAGUA para el mantenimiento y operación de las obras de infraestructira para llevar a cabo la regulación hidráulica en las zonas aledañas al NAICM, que permitan favorecer y mejorar el hábitat para las aves acuáticas migratorias que arriban a la zona, asi como las aves residentes y realizar en forma coordinada la operación y mantenimiento de las obras hidráulicas de regulación y conducción de los escurrimientos pluviales provenientes del interior del perímetro del NAICM, durante su etapa de construcción, a través de un sistema de drenaje que operará temporalmente, los cuales serán regulados en dos lagunas a cargo de GACM y cuyas descargas al Dren General del Valle quedarán bajo el control de CONAGUA.	Establecer un mecanismo correspondiente entre GACM y CONAGUA para el mantenimiento y operación de las obras de infraestructira para llevar a cabo la regulación hidráulica en las zonas aledañas al NAICM, que permitan favorecer y mejorar el hábitat para las aves acuáticas migratorias que arriban a la zona, asi como las aves residentes y realizar en forma coordinada la operación y mantenimiento de las obras hidráulicas de regulación y conducción de los escurrimientos pluviales provenientes del interior del perímetro del NAICM, durante su etapa de construcción, a través de un sistema de drenaje que operará temporalmente, los cuales serán regulados en dos lagunas a cargo de GACM y cuyas descargas al Dren General del Valle quedarán bajo el control de CONAGUA.	none	0		0	MXN	Adjudicación directa	Artículo 1 de la LOPSRM					\N	\N	\N	\N	0		\N	\N	1	\N	
200	200	-	Servicio Profesionales de asistencia técnica relacionados con el proyecto del NAICM	Servicio Profesionales de asistencia técnica relacionados con el proyecto del NAICM	complete	0		1280000.00	MXN	Adjudicación directa	Artículo 42 Fracción X de la Ley de Obras Públicas y Servicios Relacionados con las Mismas 	Nacional		transferencia		\N	\N	\N	\N	0		\N	\N	1	\N	
213	213	N6/2012	Servicios Administrados de Arrendamiento de Equipo y Bienes Informáticos para el Grupo Aeroportuario de la Ciudad de México.	Prestación a GACM por parte del prestador de servicios de los servicios administrados de equipo y bienes informáticos sin opción a compra, en adelante los servicios los cuales serán prestados totalmente a satisfacción de GACM, de conformidad con las especificaciones y características establecidas en el anexo técnico el cual al ser firmado por las partes forma parte integrante del contrato como anexo 11.	active	0		47660000.00	MXN	Adjudicación directa	La celebración del presente contrato la lleva a cabo por adjudicación directa, en términos de lo establecidos en los artículos 3° fracción I, 26, fracción III, 28 fracción I, en relación con lo dispuesto en el articulo 40, ultimo párrafo, 41, fracción III, 45, 47 y demás relativos y aplicables de la LAASSP, así como los artículos 71 y 72 fracción III del RLAASSP.	La celebración del presente contrato la lleva a cabo por adjudicación directa, en términos de lo establecidos en los artículos 3° fracción I, 26, fracción III, 28 fracción I, en relación con lo dispuesto en el articulo 40, ultimo párrafo, 41, fracción III, 45, 47 y demás relativos y aplicables de la LAASSP, así como los artículos 71 y 72 fracción III del RLAASSP.		Nacional		\N	\N	\N	\N	0		\N	\N	1	\N	
37	37	-			complete	0		0		Fideicomiso				Presencial		\N	\N	\N	\N	0		\N	\N	1	\N	
42	42	-	-	-	complete	0		0	MXN	Convenio de colaboración						\N	\N	\N	\N	0		\N	\N	1	\N	
43	43	-	Campaña de exploración geotécnica de campo 2015. Muestreo y sistemas de Medición en el subsuelo en las zonas de aeropistas, calles de redaje y caminos internos del NAICM, en Texcoco, Estado de México	Campaña de exploración geotécnica de campo 2015. Muestreo y sistemas de Medición en el subsuelo en las zonas de aeropistas, calles de redaje y caminos internos del NAICM, en Texcoco, Estado de México	complete	0		182500000	MXN	Adjudicación directa	Artículo 1 de la LOPSRM					\N	\N	\N	\N	0		\N	\N	1	\N	
72	72	-	Llevar a cabo el Servicio de Investigaciones y Estudios Especiales, Relacionados con Aspectos Estructurales del Nuevo Aeropuerto de la Ciudad de México (NAICM) en el Vaso del Ex-Lago de Texcoco, Zona Federal	Llevar a cabo el Servicio de Investigaciones y Estudios Especiales, Relacionados con Aspectos Estructurales del Nuevo Aeropuerto de la Ciudad de México (NAICM) en el Vaso del Ex-Lago de Texcoco, Zona Federal	complete	0		0		Adjudicación directa	Artículo 1 de la LOPSRM					\N	\N	\N	\N	0		\N	\N	1	\N	
77	77	-	Instrumentación de Planes y Programas Ambientales para el Proyecto del NAICM	Instrumentación de Planes y Programas Ambientales para el Proyecto del NAICM	complete	0		34800000	MXN	Adjudicación directa	Artículo 1 de la LOPSRM					\N	\N	\N	\N	0		\N	\N	1	\N	
80	80	No aplica			complete	0	MXN	0	MXN	Adjudicación directa	Artículo 1 de la LOPSRM					\N	\N	\N	\N	0		\N	\N	1	\N	
76	76	-	Llevar a cabo el Servicio de Investigaciones y Estudios Especiales Relacionados con Aspectos Geotécnicos del Nuevo Aeropuerto de la Ciudad de México (NAICM) en el Vaso del Ex-Lago de Texcoco, Zona Federal	Llevar a cabo el Servicio de Investigaciones y Estudios Especiales Relacionados con Aspectos Geotécnicos del Nuevo Aeropuerto de la Ciudad de México (NAICM) en el Vaso del Ex-Lago de Texcoco, Zona Federal	complete	0		177305923.44	MXN	Adjudicación directa	Artículo 1 de la LOPSRM					\N	\N	\N	\N	0		\N	\N	1	\N	
79	79	-	Proyecto de Salvamento Arqueológico en el interior del Lago de Taxcoco en su zona oriente, Estado de México. (Supervisión, Vigilancia y Excavaciones 2016), en Adelante los SERVICIOS, mismos que serán realizados totalmente a satisfacción del GACM	Proyecto de Salvamento Arqueológico en el interior del Lago de Taxcoco en su zona oriente, Estado de México. (Supervisión, Vigilancia y Excavaciones 2016), en Adelante los SERVICIOS, mismos que serán realizados totalmente a satisfacción del GACM	complete	0		10163709	MXN	Adjudicación directa	Artículo 1 de la LOPSRM					\N	\N	\N	\N	0		\N	\N	1	\N	
167	167	-	Supervisión, monitoreo, verificación y evaluación sistemática de los productos derivados del diseño e instrumentación del modelo virtual de información para la construcción del BIM del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	Supervisión, monitoreo, verificación y evaluación sistemática de los productos derivados del diseño e instrumentación del modelo virtual de información para la construcción del BIM del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)	complete	0		12925000.00	MXN	Adjudicación directa	Artículo 1° de la Ley de Obras Públicas y Servicios Relacionados con las Mismas 					\N	\N	\N	\N	0		\N	\N	1	\N	
\.


--
-- Name: tender_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('tender_id_seq', 222, true);


--
-- Data for Name: tenderamendmentchanges; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY tenderamendmentchanges (id, contractingprocess_id, tender_id, property, former_value) FROM stdin;
1	26	\N	Fecha de Presentación y Apertura de Proposicones al 07/10/2015 y Fallo al 13/10/2015.	2015-10-13
2	66	\N	Se incluye visita al sitio del NAICM para el día 08 de abril de 2015.	Se incluye visita al sitio del NAICM para el día 08 de abril de 2015.
3	128	\N	Diferimiento del fallo al 05/11/2015	0
\.


--
-- Name: tenderamendmentchanges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('tenderamendmentchanges_id_seq', 3, true);


--
-- Data for Name: tenderdocuments; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY tenderdocuments (id, contractingprocess_id, tender_id, document_type, documentid, title, description, url, date_published, date_modified, format, language) FROM stdin;
1	81	\N	Publicación de proyecto de convocatoria en CompraNet	1	Documento en el que se publica la liciación y se provee la información sobre el proceso y sus características. Este documento puede encontrarse en una página web o en una gaceta oficial.	Proyecto de convocatoria para la licitación pública nacional presencial por puntos y porcentajes para la obra "Carga, acarreoy descarga fuera del poligonodel material existente producto de depositos de demoliciones, desperdicios y desazolve" publicada al público en CompraNet con el número de procedimiento  PO-009KDH999-N70-2015 publicada en CompraNet el 10 de septiembre de 2015		\N	\N		
2	81	\N	Convocatoria al procedimiento de contratación	2	Documento que contiene información sobre el proceso en el que la licitación se encuentra abierta a comentarios de cualquier interesado.	Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N78-2015, de fecha 24 de septiembre de 2015, aplicando el mecanismo de evaluación de puntos y porcentajes. Las bases se publicaron en CompraNet el día 29 de septiembre del 2015.		\N	\N		
3	81	\N	Documento que contiene los objetivos y características del contrato y proceso de licitación	3	Documento que contiene información para los interesados en la licitación describiendo los objetvos y características del contrato y el proceso de licitación.	Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N78-2015, de fecha 24 de septiembre de 2015, aplicando el mecanismo de evaluación de puntos y porcentajes. Las bases se publicaron en CompraNet el día 29 de septiembre del 2015.		\N	\N		
4	81	\N	Documento que describe los criterios que deben cumplir los licitantes	4	Documento que incluye y describe los criterios que debe cumplir un interesado para participar en la licitación.	Capitulo 2-De la licitación de la Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N78-2015, de fecha 24 de septiembre de 2015. Las bases se publicaron en CompraNet el día 29 de septiembre del 2015.		\N	\N		
5	81	\N	Documento que contiene las especificaicones técnicas de la obra	5	Documento que describe las especificaciones técnicas del bien o servicio a ser licitado.	Capitulo 6-Anexos a esta convocatoria (numeral 6.5) de la Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N78-2015, de fecha 24 de septiembre de 2015. Las bases se publicaron en CompraNet el día 29 de septiembre del 2015.		\N	\N		
6	81	\N	Documento que describe los criterios de evaluación	6	Documento que describe los criterios que serán utilizados para la evaluación de las propuestas de la licitación.	Capitulo 2-De la licitación (numerales 2.13 y 2.14) de la Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N78-2015, de fecha 24 de septiembre de 2015. Las bases se publicaron en CompraNet el día 29 de septiembre del 2015.		\N	\N		
7	82	\N	Publicación de proyecto de convocatoria en CompraNet	1	Documento en el que se publica la liciación y se provee la información sobre el proceso y sus características. Este documento puede encontrarse en una página web o en una gaceta oficial.	Proyecto de Convocatoria a la Licitación Pública Nacional Presencial para realizar Implementación del plan de restauración ecológica para el Nuevo Aeropuerto Internacional de la Ciudad de México. Publicado en CompraNet el 19 de mayo de 2015		\N	\N		
8	82	\N	Documento que contiene información sobre el proceso en el que la licitación se encuentra abierta a comentarios de cualquier interesado.	2	Convocatoria al procedimiento de contratación	Convocatoria a la Licitación Pública Nacional No. LO-009KDH999-N45-2015, para llevar a cabo los trabajos de “Implementación del plan de restauración ecológica para el Nuevo Aeropuerto Internacional de la Ciudad de México”, aplicando el mecanismo de evaluación de puntos y porcentajes, publicada en compraNet el día 12 de junio del 2015.		\N	\N		
9	82	\N	Documento que contiene información para los interesados en la licitación describiendo los objetvos y características del contrato y el proceso de licitación.	3	Documento que contiene los objetivos y características del contrato y proceso de licitación	Convocatoria a la Licitación Pública Nacional No. LO-009KDH999-N45-2015, para llevar a cabo los trabajos de “Implementación del plan de restauración ecológica para el Nuevo Aeropuerto Internacional de la Ciudad de México”, aplicando el mecanismo de evaluación de puntos y porcentajes, publicada en compraNet el día 12 de junio del 2015.		\N	\N		
10	82	\N	Documento que incluye y describe los criterios que debe cumplir un interesado para participar en la licitación.	4	Documento que describe los criterios que deben cumplir los licitantes	Capitulo 2-Licitación Pública Nacional de la Convocatoria a la Licitación Pública Nacional No. LO-009KDH999-N45-2015, para llevar a cabo los trabajos de “Implementación del plan de restauración ecológica para el Nuevo Aeropuerto Internacional de la Ciudad de México”, aplicando el mecanismo de evaluación de puntos y porcentajes, publicada en compraNet el día 12 de junio del 2015.		\N	\N		
11	82	\N	Documento que describe las especificaciones técnicas del bien o servicio a ser licitado.	5	Documento que contiene las especificaicones técnicas de la obra	Capitulo 6-Anexos a esta convocatoria (numeral 6.5 Términos de Referencia) de la Convocatoria a la Licitación Pública Nacional No. LO-009KDH999-N45-2015, para llevar a cabo los trabajos de “Implementación del plan de restauración ecológica para el Nuevo Aeropuerto Internacional de la Ciudad de México”, aplicando el mecanismo de evaluación de puntos y porcentajes, publicada en compraNet el día 12 de junio del 2015.		\N	\N		
12	82	\N	Documento que describe los criterios que serán utilizados para la evaluación de las propuestas de la licitación.	7	Documento que describe los criterios de evaluación	Capitulo 2-Licitación Pública Nacional (numerales 2.13 y 2.14) de la Convocatoria a la Licitación Pública Nacional No. LO-009KDH999-N45-2015, para llevar a cabo los trabajos de “Implementación del plan de restauración ecológica para el Nuevo Aeropuerto Internacional de la Ciudad de México”, aplicando el mecanismo de evaluación de puntos y porcentajes, publicada en compraNet el día 12 de junio del 2015.		\N	\N		
13	83	\N	Documento en el que se publica la licitación y se provee la información sobre el proceso y sus características. Este documento puede encontrarse en una página web o en una gaceta oficial.	1	Publicación de proyecto de convocatoria en CompraNet	Proyecto de Convocatoria a la Licitación Pública Nacional Presencial para la Implementación del plan de restauración ecológica para el Nuevo Aeropuerto Internacional de la Ciudad de México publicado en CompraNet el 19 de mayo de 2015		\N	\N		
14	83	\N	Documento que contiene información sobre el proceso en el que la licitación se encuentra abierta a comentarios de cualquier interesado.	2	Convocatoria al procedimiento de contratación	Convocatoria a la Licitación Pública Nacional No. LO-009KDH999-N42-2015 para la Implementación del Programa de Rescate de Flora y Fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México publicada en CompraNet el 12 de junio de 2015		\N	\N		
15	83	\N	Documento que contiene información para los interesados en la licitación describiendo los objetos y características del contrato y el proceso de licitación.	3	Documento que contiene los objetivos y características del contrato y proceso de licitación	Convocatoria a la Licitación Pública Nacional No. LO-009KDH999-N42-2015 para la Implementación del Programa de Rescate de Flora y Fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México publicada en CompraNet el 12 de junio de 2015		\N	\N		
16	83	\N	Documento que incluye y describe los criterios que debe cumplir un interesado para participar en la licitación.	4	Documento que describe los criterios que deben cumplir los licitantes	Convocatoria a la Licitación Pública Nacional No. LO-009KDH999-N42-2015 para la Implementación del Programa de Rescate de Flora y Fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México publicada en CompraNet el 12 de junio de 2015		\N	\N		
17	83	\N	Documento que describe las especificaciones técnicas del bien o servicio a ser licitado.	5	Documento que contiene las especificaciones técnicas de la obra	Convocatoria a la Licitación Pública Nacional No. LO-009KDH999-N42-2015 para la Implementación del Programa de Rescate de Flora y Fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México publicada en CompraNet el 12 de junio de 2015		\N	\N		
18	83	\N	Documento que describe los criterios que serán utilizados para la evaluación de las propuestas de la licitación.	6	Documento que describe los criterios de evaluación	Capítulo 2.13 de la Convocatoria a la Licitación Pública Nacional No. LO-009KDH999-N46-2015 para la Implementación del Programa de Rescate de Flora y Fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México publicada en CompraNet el 12 de junio de 2015		\N	\N		
19	84	\N	Documento en el que se publica la liciación y se provee la información sobre el proceso y sus características. Este documento puede encontrarse en una página web o en una gaceta oficial.	1	Publicación de proyecto de convocatoria en CompraNet	Proyecto de Convocatoria a la Licitación Pública Nacional Presencial para realizar Plan de monitoreo y conservación de aves del proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México publicado en CompraNet el 19 de mayo de 2015		\N	\N		
20	84	\N	Documento que contiene información sobre el proceso en el que la licitación se encuentra abierta a comentarios de cualquier interesado.	2	Convocatoria al procedimiento de contratación	Convocatoria a la Licitación Pública Nacional No. LO-009KDH999-N46-2015 para los trabajos de Plan de monitoreo y conservación de aves del Nuevo Aeropuerto Internacional de la Ciudad de México publicada en CompraNet el 12 de junio de 2015		\N	\N		
21	84	\N	Documento que contiene información para los interesados en la licitación describiendo los objetvos y características del contrato y el proceso de licitación.	3	Documento que contiene los objetivos y características del contrato y proceso de licitación	Convocatoria a la Licitación Pública Nacional No. LO-009KDH999-N46-2015 para los trabajos de Plan de monitoreo y conservación de aves del Nuevo Aeropuerto Internacional de la Ciudad de México publicada en CompraNet el 12 de junio de 2015		\N	\N		
22	84	\N	Documento que incluye y describe los criterios que debe cumplir un interesado para participar en la licitación.	4	Documento que describe los criterios que deben cumplir los licitantes	Convocatoria a la Licitación Pública Nacional No. LO-009KDH999-N46-2015 para los trabajos de Plan de monitoreo y conservación de aves del Nuevo Aeropuerto Internacional de la Ciudad de México publicada en CompraNet el 12 de junio de 2015		\N	\N		
23	84	\N	Documento que describe las especificaciones técnicas del bien o servicio a ser licitado.	5	Documento que contiene las especificaciones técnicas de la obra	Convocatoria a la Licitación Pública Nacional No. LO-009KDH999-N46-2015 para los trabajos de Plan de monitoreo y conservación de aves del Nuevo Aeropuerto Internacional de la Ciudad de México publicada en CompraNet el 12 de junio de 2015		\N	\N		
24	84	\N	Documento que describe los criterios que serán utilizados para la evaluación de las propuestas de la licitación.	6	Documento que describe los criterios de evaluación	Capítulo 2.13 de la Convocatoria a la Licitación Pública Nacional No. LO-009KDH999-N46-2015 para los trabajos de Plan de monitoreo y conservación de aves del Nuevo Aeropuerto Internacional de la Ciudad de México publicada en CompraNet el 12 de junio de 2015		\N	\N		
28	85	\N	Documento en el que se publica la liciación y se provee la información sobre el proceso y sus características. Este documento puede encontrarse en una página web o en una gaceta oficial.	1	Publicación de proyecto de convocatoria en CompraNet	NA		\N	\N		
29	85	\N	Documento que contiene información sobre el proceso en el que la licitación se encuentra abierta a comentarios de cualquier interesado.	2	Convocatoria al procedimiento de contratación	Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N19-2015, de fecha 27 de marzo de 2015, aplicando el mecanismo binario. Publicada en CompraNet el día 30 de septiembre del 2015.		\N	\N		
30	85	\N	Documento que contiene información para los interesados en la licitación describiendo los objetvos y características del contrato y el proceso de licitación.	3	Documento que contiene los objetivos y características del contrato y proceso de licitación	Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N19-2015, de fecha 27 de marzo de 2015, aplicando el mecanismo binario. Publicada en CompraNet el día 30 de septiembre del 2015.		\N	\N		
31	85	\N	Documento que incluye y describe los criterios que debe cumplir un interesado para participar en la licitación.	4	Documento que describe los criterios que deben cumplir los licitantes	Apartado 2.10 y 2.11 de la Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N19-2015, de fecha 27 de marzo de 2015, aplicando el mecanismo binario. Publicada en CompraNet el día 30 de septiembre del 2015.		\N	\N		
32	85	\N	Documento que incluye y describe los criterios que debe cumplir un interesado para participar en la licitación.	4	Documento que describe los criterios que deben cumplir los licitantes	Apartado 2.10 y 2.11 de la Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N19-2015, de fecha 27 de marzo de 2015, aplicando el mecanismo binario. Publicada en CompraNet el día 30 de septiembre del 2015.		\N	\N		
33	85	\N	Documento que describe las especificaciones técnicas del bien o servicio a ser licitado.	5	Documento que contiene las especificaciones técnicas de la obra	Anexo 6.5 de la  Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N19-2015, de fecha 27 de marzo de 2015, aplicando el mecanismo binario. Las bases se publicaron en CompraNet el día 30 de septiembre del 2015.		\N	\N		
34	85	\N	Documento que describe los criterios que serán utilizados para la evaluación de las propuestas de la licitación.	6	Documento que describe los criterios de evaluación	Apartado 2.13 y 2.14 de la Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N19-2015, de fecha 27 de marzo de 2015, aplicando el mecanismo binario. Las bases se publicaron en CompraNet el día 30 de septiembre del 2015.		\N	\N		
35	86	\N	Documento en el que se publica la liciación y se provee la información sobre el proceso y sus características. Este documento puede encontrarse en una página web o en una gaceta oficial.	1	Publicación de proyecto de convocatoria en CompraNet	Proyecto de convocatoria para la licitación pública nacional presencial por puntos y porcentajes para la obra "Construcción de los caminos provisionales de acceso al NAICM, ejecutando trabajos de terracerías, estructuras y obras de drenaje, pavimentación y señalamiento" publicada al público en CompraNet con el número de procedimiento  PO-009KDH999-N69-2015 públicada en Compra Net el 10 de septiembre de 2015		\N	\N		
36	86	\N	Documento que contiene información sobre el proceso en el que la licitación se encuentra abierta a comentarios de cualquier interesado.	2	Convocatoria al procedimiento de contratación	Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N80-2015, de fecha 29 de septiembre de 2015, aplicando el mecanismo de evaluación de puntos y porcentajes. Las bases se publicaron en CompraNet el día 29 de septiembre del 2015.		\N	\N		
37	86	\N	Documento que contiene información sobre el proceso en el que la licitación se encuentra abierta a comentarios de cualquier interesado.	2	Convocatoria al procedimiento de contratación	Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N80-2015, de fecha 29 de septiembre de 2015, aplicando el mecanismo de evaluación de puntos y porcentajes. Las bases se publicaron en CompraNet el día 29 de septiembre del 2015.		\N	\N		
38	86	\N	Documento que contiene información para los interesados en la licitación describiendo los objetvos y características del contrato y el proceso de licitación.	3	Documento que contiene los objetivos y características del contrato y proceso de licitación	Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N80-2015, de fecha 29 de septiembre de 2015, aplicando el mecanismo de evaluación de puntos y porcentajes. Las bases se publicaron en CompraNet el día 29 de septiembre del 2015.		\N	\N		
39	86	\N	Documento que incluye y describe los criterios que debe cumplir un interesado para participar en la licitación.	4	Documento que describe los criterios que deben cumplir los licitantes	Capitulo 2-De la Licitación de la Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N80-2015, de fecha 29 de septiembre de 2015, aplicando el mecanismo de evaluación de puntos y porcentajes. Las bases se publicaron en CompraNet el día 29 de septiembre del 2015.		\N	\N		
40	86	\N	Documento que describe las especificaciones técnicas del bien o servicio a ser licitado.	5	Documento que contiene las especificaicones técnicas de la obra	Capitulo 6-Anexos a esta convocatoria (numeral 6.5) de la Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N80-2015, de fecha 29 de septiembre de 2015, aplicando el mecanismo de evaluación de puntos y porcentajes. Las bases se publicaron en CompraNet el día 29 de septiembre del 2015.		\N	\N		
41	86	\N	Documento que describe los criterios que serán utilizados para la evaluación de las propuestas de la licitación.	6	Documento que describe los criterios de evaluación	Capitulo 2-De la Licitación (numerales 2.13 y 2.14) de la Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N80-2015, de fecha 29 de septiembre de 2015, aplicando el mecanismo de evaluación de puntos y porcentajes. Las bases se publicaron en CompraNet el día 29 de septiembre del 2015.		\N	\N		
42	218	\N	Documento que contiene las especificaciones técnicas de la obra	1	Documento que contiene las especificaciones técnicas de la obra	Documento que contiene las especificaciones técnicas de la obra	ftp://189.204.79.236/GACM/Paquete Terminal 15-07-16	\N	\N	PDF	es
\.


--
-- Name: tenderdocuments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('tenderdocuments_id_seq', 42, true);


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
1	54	\N	0	Obra pública			Servicio		\N		0	
2	61	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
3	71	\N	-	Obra pública			Servicio.		\N		0	
4	1	\N	1	Servicio					\N	Servicio	0	
5	2	\N	1	Servicio					\N	Servicio	0	
6	62	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Proyecto ejecutivo	0	
7	3	\N	62501001	Construccion de Aeropistas					\N	Servicio	0	
8	25	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Proyecto	0	
9	26	\N	62903001	Supervisión de Obras			Servicios relacionados con Obra Pública		\N	Supervisión	0	
10	4	\N	62501001	Construcción de Aeropistas 	Servicios Relacionados con Obra Pública				\N	Servicio	0	
11	5	\N	33104	Asesorias para la operacion de programas	Cerro Dios de Hacha número 42				\N	Servicio	0	
12	27	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
13	6	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
14	7	\N	62501001	Construcción de aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
15	28	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
16	8	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
18	9	\N	1	Servicios relacionados con Obra Pública	Servicios relacionados con Obra Pública				\N	Servicio	0	
19	10	\N	625010011	Servicios relacionados con Obra Pública	Servicios relacionados con Obra Pública				\N	Servicio	0	
21	11	\N	1	NO SE LOCALIZA EN EL LISTADO PROPORCIONADO	Servicios relacionados con Obra Pública				\N	Servicio	0	
22	12	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
23	13	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
24	29	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
25	14	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
26	15	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
27	16	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
28	30	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
29	64	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista					\N	Estudio	0	
30	17	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
33	18	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Experto	0	
34	19	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Estudio	0	
35	31	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
36	32	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
37	33	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
38	112	\N	32503	Servicios de Arrendamiento de Vehiculos terrestres para servicios administrativos	Arrendamiento de equipo de transporte	3200			\N	Servicio	0	
39	113	\N	37104 y 37106	Servicios de pasajes aéreos nacionales y Servicios de pasajes aéreos internacionales		37101			\N	Servicio	0	
40	34	\N	62501001	Construcción de aeropistas			Servicios relacionados con Obra Pública		\N	Servicios relacionados con Obra Pública	0	
41	114	\N	32301	Servicio Integral de Impresión y digitalización en blanco y nego y color					\N	Servicio	0	
42	116	\N	31701	Servicios de conducciones de señales analogicas y digitales.		31701			\N	Servicio	0	
43	66	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con la obra pública		\N	Estudio	0	
44	117	\N	1	 					\N	Servicio	0	
45	118	\N	1	 					\N	Servicio	0	
46	43	\N	62501008	Estudios de preinersión y/o preparación del proyecto para aeropista			Estudios de preinersión y/o preparación del proyecto para aeropista		\N	Obra pública	182500000	
47	119	\N	1	 					\N	Servicio	0	
49	68	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista					\N	Estudio	0	
50	120	\N	62905	Servicios Especializados en el suministro de personal técnico y administrativo para proyectos de infraestructura aeroportuaria	Otros servicios relacionados con obras publicas				\N	Mes	0	
51	69	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
52	70	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
53	49	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Servicios relacionados con Obra Pública	0	
54	121	\N	1	Servicio de Lavanderia, Limpieza e Higiene 		35801			\N		0	
55	82	\N	1	Clave que identifica cada item en la licitación.	Clave CUCOP del bien o servicio	1	62501008		\N		0	
56	82	\N	2	Texto que describe las características de cada item de la licitación.	Descripción específica de la clave CUCOP del bien o servicio	2	Estudios de preinversión y/o preparación del proyecto para aeropista		\N		0	
57	82	\N	3	Identificador del item dentro de una clasificación determinada que permite incluirlo en un grupo determinado dentro de en un universo de items.	Tipo de la clave CUCOP del bien o servicio	3	Servicios relacionados con Obra Pública		\N		0	
58	82	\N	4	Otras formas utilizadas para clasificar el item en caso de ser aplicable).	Clave en el Catálogo de Bienes Muebles (CABM) – Opcional	4	No aplica		\N		0	
59	82	\N	5	Dígitos que señalan el número de items que serán adquiridos en la licitación.	Cantidad del bien o servicio	5	1		\N		0	
60	82	\N	6	Unidad de medida en la que se especifica la cantidad de items a adquirir.	Unidad del bien o servicio	6	Estudio		\N		0	
61	52	\N	62501001	Construccion de Aeropistas			Obra pública		\N	Servicio	0	
62	83	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista	Servicios relacionados con Obra Pública				\N	Estudio	0	0
64	122	\N	3300	Contratación de  Servicios Profesionales  para fungir como enlace  y vocería en el ámbito  nacional e internacional y con actores claves que aseguren la ejecución del  proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México					\N	Servicio	0	
65	123	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
66	124	\N	1	 					\N		0	
67	125	\N	62501008	Prestación de Servicios Profesionales					\N	Prestación Servicios 	0	
68	126	\N	1	 					\N		0	
69	127	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista	Servicios relacionados con Obra Pública				\N	Estudio	0	
70	84	\N	1	Visita al sitio de realización de los trabajos		1	La visita al sitio de realización de los trabajos para el plan de monitoreo y conservación de aves del proyecto del NAICM en el sitio del NACM  dio inicio a las 10:00 horas del 16 de junio de 2015 en el Km. 7.5 de la Autopista de Cuota Peñón - Texcoco en el Centro Mexicano de Capacitación en Agua y Saneamiento y se dio por concluida a las 12:00 horas del mismo día sin que existiera observación alguna por parte de los asistentes.		\N	Visita	0	
71	128	\N	62903001	Supervisión de Obras	Servicios relacionados con Obra Pública				\N	Supervisión  	0	
72	129	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
73	85	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista					\N	Estudio	0	
74	130	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
75	145	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista	Servicios relacionados con Obra Pública				\N	Proyecto Ejecutivo 	0	
76	146	\N	1	 					\N		0	
77	86	\N	1	Visita al sitio de realización de los trabajos para el Construcción de los caminos provisionales de acceso al Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM) ejecutando trabajos de terracería, estructuras y obrad de drenaje, pavimentación y señalamiento.		1			\N	Visita	0	
78	150	\N	32301	Servicio de Arrendamiento de Equipos y Bienes Informáticos		32301			\N	Equipo de Computo Personal de Escritorio Pieza.	0	
79	150	\N	32301	Servicio de Arrendamiento de Equipos y Bienes Informáticos		32301			\N	Equipo de Computo Personal de Diseño Portátil o de Escritorio para Estación de Trabajo Pieza.	0	
80	150	\N	32301	Servicio de Arrendamiento de Equipos y Bienes Informáticos		32301			\N	Equipo de Computo Portátil (Tableta) Pieza.	0	
81	150	\N	32301	Servicio de Arrendamiento de Equipos y Bienes Informáticos		32301			\N	Servicio de Software de Antivirus Servicio.	0	
82	150	\N	32301	Servicio de Arrendamiento de Equipos y Bienes Informáticos		32301			\N	Servicio Administrador de Unidad de Energía (UPS) Servicio.	0	
83	153	\N	31701	Servicios de conducciones de señales analógicas y digitales.		31701			\N	Servicio	0	
84	154	\N	1	 					\N	Obra pública	0	
85	175	\N	31701	Servicios de conducciones de señales analogicas y digitales.		31701			\N		0	
86	176	\N	31701	Configuración inicial de los equipos instalados en el inmueble de Altavista que dan servicio de Red Local, Seguridad de Datos y Telefonía.		31701			\N	Servicio	0	
87	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Switch core	0	
88	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Switch ACC1	0	
89	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Switch ACC2	0	
90	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Switch ACC3	0	
91	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Access Point PA	0	
92	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Access Point PB	0	
93	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Access Point SJ	0	
94	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Access Point VIP	0	
95	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	CUCM	0	
96	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Unity Conecction	0	
97	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Voice Gateway	0	
98	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Internet Gateway	0	
99	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	GACMAD	0	
100	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Juniper FW	0	
101	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Telefono IP Cisco Modelo 7021	0	
102	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Telefono IP Cisco Modelo 7031 	0	
103	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Telefono IP Cisco Modelo 7038 	0	
104	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Telefono IP Cisco Modelo 7911 	0	
105	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Telefono IP Cisco Modelo 7937	0	
106	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Telefono IP Cisco Modelo 7941 	0	
107	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Telefono IP Cisco Modelo 7941 	0	
109	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Telefono IP Cisco Modelo 7975	0	
110	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Telefono IP Cisco Modelo 7942	0	
111	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Telefono IP Cisco Modelo 7942	0	
113	177	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Telefono IP Cisco Modelo 7962	0	
114	57	\N	33104	Asesorias para la operacion de programas					\N	Servicio	0	
115	178	\N	32301	Servicio de Arrendamiento de equipos de Bienes Informáticos 	Arrendamiento - Servicios Generales				\N	Desk Top  	0	
116	178	\N	32301	Servicio de Arrendamiento de equipos de Bienes Informáticos 	Arrendamiento - Servicios Generales				\N	Laptops	0	
117	179	\N	32301	Servicio de Arrendamiento de equipos de Bienes Informáticos 	Arrendamiento - Servicios Generales - 				\N	Impresión personal a color	0	
118	179	\N	32301	Servicio de Arrendamiento de equipos de Bienes Informáticos 	Arrendamiento - Servicios Generales - 				\N	Multifuncional monocromático 	0	
119	179	\N	32301	Servicio de Arrendamiento de equipos de Bienes Informáticos 	Arrendamiento - Servicios Generales - 				\N	Aparatos Telefónicos Digitales IP 	0	
120	179	\N	32301	Servicio de Arrendamiento de equipos de Bienes Informáticos 	Arrendamiento - Servicios Generales - 				\N	Equipos de Red (Switches)     	0	
121	180	\N	31701	Servicio de contratación de servicios de conducción de señales analógicas y digitales 	contratación de señales - Servicios Generales - 				\N	Un enlace principal de internet con un ancho de banda de 100MB	0	
122	180	\N	31701	Servicio de contratación de servicios de conducción de señales analógicas y digitales 	contratación de señales - Servicios Generales - 				\N	Un enlace Secundario de 10MB 	0	
124	180	\N	31701	Servicio de contratación de servicios de conducción de señales analógicas y digitales 	contratación de señales - Servicios Generales - 				\N	Toncales Digitales con 100 DID's	0	
125	181	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
126	191	\N	62501008	Estudios de preinersión y/o preparación del proyecto para 			Obra pública		\N	Obra	0	
127	35	\N	62501001	Construcción de aeropistas			Servicios relacionados con Obra Pública		\N	Servicios relacionados con Obra Pública	0	
128	36	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
129	50	\N	6251008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Proyecto Ejecutivo	8200000	MXN
130	193	\N	33104	Instrumentación del Manual de Integración y Funcionamiento del Subcomité de Revisión de Convocatorias Del Grupo Aeroportuario de La Ciudad de México, S.A. de C.V. en Materia de Adquisiciones Arrendamientos y Servicios					\N	Servicio	0	
131	195	\N	31701	Configuración inicial de los equipos instalados en el inmueble de Altavista que dan servicio de Red Local, Seguridad de Datos y Telefonía.			Configuración inicial de los equipos instalados en el inmueble de Altavista que dan servicio de Red Local, Seguridad de Datos y Telefonía.		\N	Servicio	0	
132	165	\N	62501001	Construcción de aeropistas			Construcción de aeropistas		\N	Servicios relacionados con Obra Pública	638000	
133	166	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N		539400.00	
134	38	\N	62501001	Construcción de aeropistas			Servicios relacionados con obra		\N	Obra	0	
135	131	\N	62501001	Construcción de Aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
137	168	\N	62903001	Supervisón de Obras			Servicios relacionados con Obra Pública		\N		7519121	
138	132	\N	62501001	Construcción de Aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
139	133	\N	62501001	Construcción de Aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
140	141	\N	72501001	Construcción de aeropistas			Obra pública		\N	Obra	0	
141	136	\N	62501001	Construcción de Aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
142	142	\N	62501001	Construcción de aeropistas 			Servicios relacionados con Obra Pública		\N	Servicios relacionados con Obra Pública	0	
189	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Unity Conecction	0	
143	137	\N	33301	Servicio integral de administración de personal y proceso de nomina, mediante un sistema especializado para recursos humanos y de nómina de gobierno			Servicio integral de administración de personal y proceso de nomina, mediante un sistema especializado para recursos humanos y de nómina de gobierno		\N	Servicio	0	
144	169	\N	62501001	Construcción de Aeropistas					\N	Servicio	687931.00	MXN
145	170	\N	62501001	Construccion de Aeropistas					\N	Servicios relacionados con Obra Pública	750000.00	
146	143	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Proyecto ejecutivo	0	
147	140	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Servicio relaconado con obra 	0	
148	171	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropistas.			Servicios relacionados con Obra Pública		\N	Estudio	6999000.00	
149	156	\N	62501001	Construcción de Aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
150	157	\N	62501001	Construcción de Aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
151	158	\N	62501001	Construcción de Aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
152	172	\N	62501008	Estudios de Preinversión y/o Preparación del Proyecto para Aeropistas			Servicios relacionados con Obra Pública		\N		0	
153	159	\N	62501001	Construcción de Aeropistas			Obra Publica		\N	Obra	0	
154	160	\N	62903001	Construcción de Aereopistas			Obras Publicas		\N	Obra	0	
155	161	\N	62501008	Estudios de preinversión y/o preparación del proyecto para aeropista			Servicios relacionados con Obra Pública		\N	Estudio	0	
156	144	\N	62903001	Supervisión de Obras			Servicios relacionados con Obra Pública		\N	Supervisión	0	
157	162	\N	33301	Servicios de Informática			Servicios de Informática		\N	Servicio	0	
158	183	\N	62501001	Construcción de aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
159	188	\N	1	Asesoría técnica especializada en materia de vinculación con organismos internacionales y adopción de las mejores prácticas internacionales			Asesoría técnica especializada en materia de vinculación con organismos internacionales y adopción de las mejores prácticas internacionales		\N	Servicio	0	
160	189	\N	33101	Otras Asesorias para la Operación de Programas			Otras Asesorias para la Operación de Programas		\N	Servicio	0	
161	190	\N	35801	Servicios Integrales de Infraestructura de Computo.			Servicios Integrales de Infraestructura de Computo.		\N	Servicio	0	
162	109	\N	62903001	Supervisión de Obras	Servicios relacionados con Obra Pública				\N	Supervisión  	0	
163	110	\N	62903001	Supervisión de Obras	Servicios relacionados con Obra Pública				\N	Supervisión  	0	
164	106	\N	33901	Contratación de servicios especializados en el suministro de "terceros".					\N	Servicio	9	
165	107	\N	1	 					\N	Edición	0	
166	108	\N	62501001	Construcción de Aeropistas	Obra pública				\N	Obra	0	
167	208	\N	31902	Contratación de otros Servicios	Servicios relacionados con Obra Pública				\N		0	
168	209	\N	62501001	Construcción de Aeropistas	Servicios relacionados con Obra Pública				\N	Servicio	0	
169	210	\N	1	 					\N	Arrendamiento	0	
170	206	\N	62501001	Construcción de Aeropistas			Obra pública		\N	Obra	0	
171	200	\N	62501001	Construcción de aeropistas			Servicios relacionados con Obra Pública		\N	Servicio	0	
172	207	\N	33901	Contratación de servicios especializados en el suministro de "terceros".					\N	Servicio	0	
173	201	\N	-	Asesoría técnica especializada en materia de vinculación con organismos internacionales y adopción de las mejores prácticas internacionales"			Asesoría técnica especializada en materia de vinculación con organismos internacionales y adopción de las mejores prácticas internacionales"		\N	Servicio	0	
174	202	\N	62501001	Construcción de Aeropistas			Construcción de Aeropistas		\N	Servicio	0	
175	213	\N	32301	Servicio de Arrendamiento de Equipos y Bienes Informáticos	32301				\N	Equipo de Computo Personal de Escritorio Pieza	0	
176	213	\N	32301	Servicio de Arrendamiento de Equipos y Bienes Informáticos	32301				\N	Equipo de Computo Personal de Diseño Portátil o de Escritorio para Estación de Trabajo	0	
177	213	\N	32301	Servicio de Arrendamiento de Equipos y Bienes Informáticos	32301				\N	Equipo de Computo Portátil (Tableta) 	0	
178	213	\N	32301	Servicio de Arrendamiento de Equipos y Bienes Informáticos	32301				\N	Servicio de Software de Antivirus Servicio	0	
179	213	\N	32301	Servicio de Arrendamiento de Equipos y Bienes Informáticos	32301				\N	Servicio Administrador de Unidad de Energía (UPS) Servicio	0	
180	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Switch core	0	
181	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Switch ACC1	0	
182	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Switch ACC2	0	
183	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Switch ACC3	0	
184	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Access Point PA	0	
185	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Access Point PB	0	
186	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Access Point SJ	0	
187	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Access Point VIP	0	
188	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	CUCM	0	
190	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Voice Gateway	0	
191	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Internet Gateway	0	
192	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	GACMAD	0	
193	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Juniper FW	0	
194	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Telefono IP Cisco Modelo 7021	0	
195	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Telefono IP Cisco Modelo 7031	0	
196	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Telefono IP Cisco Modelo 7038	0	
197	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Telefono IP Cisco Modelo 7911	0	
198	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Telefono IP Cisco Modelo 7911	0	
200	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Telefono IP Cisco Modelo 7941	0	
201	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Telefono IP Cisco Modelo 7965	0	
202	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Telefono IP Cisco Modelo 7975	0	
203	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Telefono IP Cisco Modelo 7975	0	
204	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Telefono IP Cisco Modelo 7942	0	
205	215	\N	31701	Servicios de Soporte Tecnico y Mantenimiento Para Los Equipos Del Servicio De Red Local, Seguridad de Datos y Telefonia en el Inmueble de Altavista		31701			\N	Telefono IP Cisco Modelo 7962	0	
206	216	\N	62501008	Prestación de Servicios Profesionales					\N	Prestación Servicios 	0	
207	217	\N	1	 					\N	Obra Pública	0	
208	219	\N	62501001	Construcción de Aeropistas			Obra pública		\N	Obra	0	
209	220	\N	62501001	Construcción de Aeropistas					\N	Obra pública	0	
210	221	\N	1	 					\N		0	
211	222	\N	35101	Conservación y mantenimiento menor de inmuebles					\N	Servicio	0	
\.


--
-- Name: tenderitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('tenderitem_id_seq', 211, true);


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
1	62	\N	1	Visita al sitio de realización de los trabajos, relacionado con la invitación Restringida a Cuando Menos Tres Personas, identificada con el número IO-009KDH999-N34-2015 respecto del Proyecto Ejecutivo para la Construcción del Camino Perimetral y sus instalaciones Complementarias en el Lado Norte del Polígono del NAICM.	La Visita al sitio de realización de los trabajos, relacionado con la invitación Restringida a Cuando Menos Tres Personas, identificada con el número IO-009KDH999-N34-2015 respecto del Proyecto Ejecutivo para la Construcción del Camino Perimetral y sus instalaciones Complementarias en el Lado Norte del Polígono del NAICM, dio inicio a las 10:00  en el Km. 7.5 de la Autopista de Cuota Peñon - Texcoco en el Centro Mexicano de Capacitación en Agua y Saneamiento y se dio por concluida a las 12:00 horas del mismo día sin que existiera observación alguna por parte de los asistentes.	2015-05-12 00:00:00	2015-05-12 00:00:00	Complete
2	26	\N	1	Visita al sitio de los trabajos para Supervisión del Proyecto Ejecutivo, Construcción, Equipamiento, Mobiliario e Instalaciones Complementarias para el Campamento del Grupo Aeropuertario de la Ciudad de México (GACM) en el sitio del Nuevo Aeropuerto Internacional de la Ciudad de México	La visita al sitio de los trabajos para laSupervisión del Proyecto Ejecutivo, Construcción, Equipamiento, Mobiliario e Instalaciones Complementarias para el Campamento del Grupo Aeropuertario de la Ciudad de México (GACM) en el sitio del Nuevo Aeropuerto Internacional de la Ciudad de Méxicodio inicio a las 10:00 horas del 25 de septiembre de 2015 en el Km. 7.5 Autopista Peñon - Texcoco en el Centro Mexicano de Capacitación en Agua y Saneamiento y se dio por concluida a las 12:00 horas del mismo día sin que existiera observación alguna por parte de los asistentes.	2015-09-25 00:00:00	\N	complete
3	65	\N	1	Visita al sitio de realización de los trabajos de Estudio de Ingeniería Geomática para el Proyecto Pistas, Plataformas, Calles de Rodaje y Edificios del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM), para Generar un modelo Digital de Terreno (MDT) a Través de la Tecnología HIGH Definition Surveying (HDS), Empleando Equipos GNSS, Escáner Láser y Ecosonda	Visita al sitio de realización de los trabajos de Estudio de Ingeniería Geomática para el Proyecto Pistas, Plataformas, Calles de Rodaje y Edificios del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM), para Generar un modelo Digital de Terreno (MDT) a Través de la Tecnología HIGH Definition Surveying (HDS), Empleando Equipos GNSS, Escáner Láser y Ecosonda	2016-01-07 00:00:00	2016-01-07 00:00:00	Complete
4	66	\N	1	Visita al sitio de realización de los trabajos para el Estudio de Suministro Electrico para el Nuevo Aeropuerto Internacional de la Ciudad de México	 La visita al sitio de realización de los trabajos para el Estudio de Suministro Electrico para el Nuevo Aeropuerto Internacional de la Ciudad de México en el sitio del NACM  dio inicio a las 10:00 horas del 10 de abril de 2015 en el Km. 7.5 de la Autopista de Cuota Peñon - Texcoco y se dio por concluida a las 12:00 horas del mismo día sin que existiera observación alguna por parte de los asistentes.	2015-04-10 00:00:00	2015-04-10 00:00:00	Complete
5	67	\N	1	Visita al sitio de realización de los servicios de Exploración geotécnica complementaria para el proyecto ejecutivo del sistema de drenaje temporal del Nuevo aeropuerto Internacional de la Ciudad de México, en el Ex Lago de Texcoco, Estado de México. 	 La visita al sitio de realización de los para  los servicios de Exploración geotécnica complementaria para el proyecto ejecutivo del sistema de drenaje temporal del Nuevo aeropuerto Internacional de la Ciudad de México, en el Ex Lago de Texcoco, Estado de México,  dio inicio a las 10:00 horas del 01 de abril de 2015 en el Km. 7.5 de la Autopista de Cuota Peñon - Texcoco en el Centro Mexicano de Capacitación en Agua y Saneamiento y se dio por concluida a las 12:00 horas del mismo día sin que existiera observación alguna por parte de los asistentes.	2015-04-01 00:00:00	2015-04-01 00:00:00	Complete
6	68	\N	1	Visita al sitio del lugar de los trabajos para llevar a cabo la Implementación del plan de restauración ecológica para el Nuevo Aeropuerto Internacional de la Ciudad de México.	La visita al sitio de realización de los trabajospara llevar a cabo la Implementación del plan de restauración ecológica para el Nuevo Aeropuerto Internacional de la Ciudad de México.  dio inicio a las 10:00 horas del 16 de junio de 2015 en el Km. 7.5 de la Autopista de Cuota Peñon - Texcoco en el Centro Mexicano de Capacitación en Agua y Saneamiento y se dio por concluida a las 12:00 horas del mismo día sin que existiera observación alguna por parte de los asistentes.	2016-06-16 00:00:00	2015-06-16 00:00:00	Complete
7	69	\N	1	La visita al sitio de realización de los trabajos para el plan de monitoreo y conservación de aves del proyecto del NAICM en el sitio del NACM  dio inicio a las 10:00 horas del 16 de junio de 2015 en el Km. 7.5 de la Autopista de Cuota Peñón - Texcoco en el Centro Mexicano de Capacitación en Agua y Saneamiento y se dio por concluida a las 12:00 horas del mismo día sin que existiera observación alguna por parte de los asistentes.	Descripción de la visita al sitio de realización de los trabajos	2015-06-16 00:00:00	2015-06-16 00:00:00	Complete
8	70	\N	1	Acto de visita al sitio de realización de los trabajos para el plan de monitoreo y conservación de aves del proyecto del NAICM	La visita al sitio de realización de los trabajos para el plan de monitoreo y conservación de aves del proyecto del NAICM en el sitio del NACM  dio inicio a las 10:00 horas del 16 de junio de 2015 en el Km. 7.5 de la Autopista de Cuota Peñón - Texcoco en el Centro Mexicano de Capacitación en Agua y Saneamiento y se dio por concluida a las 12:00 horas del mismo día sin que existiera observación alguna por parte de los asistentes.	2015-06-16 00:00:00	2015-06-16 00:00:00	Complete
9	49	\N	-	Visita al sitio de realización de los trabajos, relacionado con la invitación internacional a cuando menos tres personas, identificada con el número IO009KDH999-T3-2014 respecto al Desarrollo del proyecto ejecutivo de pistas, rodajes y plataformas y ayudas a la navegación y otras instalaciones del NAICM.	La visita al sitio de realización de los trabajos relacionados con la invitación internacional a cuando menos 3 personas, identificada con el número IO009KDH999-T3-2014 respecto al Desarrollo del proyecto ejecutivo de pistas, rodajes y plataformas y ayudas a la navegación y otras instalaciones del NAICM, dio inicio a las 12:00 del   en el Km. 7.5 de la Autopista de Cuota Peñon - Texcoco en el Centro Mexicano de Capacitación en Agua y Saneamiento y se dio por concluida a las 12:40 horas del mismo día sin que existiera observación alguna por parte de los asistentes.	2014-11-04 00:00:00	2014-11-04 00:00:00	CONCLUIDO
21	144	\N	1	Visita al sitio de realización de la Supervisión  de la Construcción de la Barda y Camino Perimetral, Alumbrado, Servicios Inducidos y Casetas de Acceso  para el Nuevo Aeropuerto Internacional de la Ciudad de México, ubicados en la poliginal para el NAICM.	La visita al sitio de realización de los trabajos de Supervisión  de la Construcción de la Barda y Camino Perimetral, Alumbrado, Servicios Inducidos y Casetas de Acceso  para el Nuevo Aeropuerto Internacional de la Ciudad de México, dio inicio a las 11:00 hrs. del 3 de marzo de 2016, concluyendo a las 13:00 hrs del mismo día de la visita.	2016-03-03 00:00:00	2016-03-03 00:00:00	Complete
10	81	\N	1	Capitulo 2-De la licitación de la Convocatoria de la Licitación Pública Nacional Presencial No. LO-009KDH999-N78-2015, de fecha 24 de septiembre de 2015. Las bases se publicaron en CompraNet el día 29 de septiembre del 2015.	La visita al sitio de realización de los trabajosde Carga, acarreo y descarga fuera del polígono del material existente producto de depósitos de demoliciones, desperdicios y desazolve, dio inicio a las 11:00 horas del 05 de octubre de junio de 2015 en el Km. 7.5 de la Autopista de Cuota Peñon - Texcoco en el Centro Mexicano de Capacitación en Agua y Saneamiento y se dio por concluida a las 14:00 horas del mismo día sin que existiera observación alguna por parte de los asistentes.	2015-10-05 00:00:00	2015-10-05 00:00:00	Condluido
11	82	\N	1	Descripción de la visita al sitio de realización de los trabajos	La visita al sitio de realización de los trabajospara llevar a cabo la Implementación del plan de restauración ecológica para el Nuevo Aeropuerto Internacional de la Ciudad de México.  dio inicio a las 10:00 horas del 16 de junio de 2015 en el Km. 7.5 de la Autopista de Cuota Peñon - Texcoco en el Centro Mexicano de Capacitación en Agua y Saneamiento y se dio por concluida a las 12:00 horas del mismo día sin que existiera observación alguna por parte de los asistentes.	2015-06-16 00:00:00	\N	Concluido
12	83	\N	1	Visita al sitio de realización de los trabajos	Acto de visita al sitio de realización de los trabajos para el plan de monitoreo y conservación de aves del proyecto del NAICM	2015-06-16 00:00:00	2015-06-16 00:00:00	Concluido
13	84	\N	1	Visita al sitio de realización de los trabajos	 Acto de visita al sitio de realización de los trabajos	2015-06-16 00:00:00	2015-06-16 00:00:00	Concluido
14	128	\N	1	Visita al sitio de los trabajos para la Supervisión de la Construcción del Drenaje Pluvial Temporal del NAICM	" La visita al sitio de los trabajos para la Supervisión de la Construcción del Drenaje Pluvial Temporal del NAICM dio inicio a las 10:00 horas del 25 de septiembre de 2015 en el Km. 7.5 Autopista Peñon - Texcoco en el Centro Mexicano de Capacitación en Agua y Saneamiento y se dio por concluida a las 12:00 horas del mismo día sin que existiera observación alguna por parte de los asistentes."	2015-09-25 00:00:00	2015-09-25 00:00:00	Concluido 
15	85	\N	1	Visita al sitio de realización de los servicios de Exploración geotécnica complementaria para el proyecto ejecutivo del sistema de drenaje temporal del Nuevo aeropuerto Internacional de la Ciudad de México, en el Ex Lago de Texcoco, Estado de México. 	La visita al sitio de realización de los para  los servicios de Exploración geotécnica complementaria para el proyecto ejecutivo del sistema de drenaje temporal del Nuevo aeropuerto Internacional de la Ciudad de México, en el Ex Lago de Texcoco, Estado de México,  dio inicio a las 10:00 horas del 01 de abril de 2015 en el Km. 7.5 de la Autopista de Cuota Peñon - Texcoco en el Centro Mexicano de Capacitación en Agua y Saneamiento y se dio por concluida a las 12:00 horas del mismo día sin que existiera observación alguna por parte de los asistentes.	2014-04-01 00:00:00	2015-04-01 00:00:00	Concluido
16	50	\N	-	Visita al sitio de realización de los trabajos, relacionado con la invitación Restringida a Cuando Menos Tres Personas, identificada con el número IO-009KDH999-N43-2015 respecto de la Elaboracion del proyecto de terracerías de los caminos provisionales para la construcción del Nuevo Aeropuerto Internacional de la Ciudad de México. 	La Visita al sitio de realización de los trabajos, relacionado con la invitación Restringida a Cuando Menos Tres Personas, identificada con el número IO-009KDH999-N43-2015 respecto de la Elaboracion del proyecto de terracerías de los caminos provisionales para la construcción del Nuevo Aeropuerto Internacional de la Ciudad de México, dio inicio a las 10:00  en el Km. 7.5 de la Autopista de Cuota Peñon - Texcoco en el Centro Mexicano de Capacitación en Agua y Saneamiento y se dio por concluida a las 12:00 horas del mismo día sin que existiera observación alguna por parte de los asistentes.	2015-06-02 00:00:00	2015-06-02 00:00:00	CONCLUIDO
17	197	\N	1	Visita al sitio de realización de los trabajos para Nivelación y limpieza del terreno del Nuevo Aeropuerto Internacional de la Ciudad de México	 La visita al sitio de realización de los trabajos para  Nivelación y limpieza del terreno del Nuevo Aeropuerto Internacional de la Ciudad de México en el sitio del NACM  dio inicio a las 11:00 horas del 08 de octubre de 2015 en el Km. 7.5 de la Autopista de Cuota Peñon - Texcoco en el Centro Mexicano de Capacitación en Agua y Saneamiento y se dio por concluida a las 15:00 horas del mismo día sin que existiera observación alguna por parte de los asistentes.	2015-10-08 00:00:00	2015-10-08 00:00:00	Complete
18	141	\N	1	Visita al sitio de realización de los trabajos, relacionado con la invitación Restringida a Cuando Menos Tres Personas, identificada con el número IO-009KDH999-N82-2015 respecto a la “Adecuación de espacios para oficinas, del Grupo Aeroportuario de la Ciudad de México (GACM), en el CEMCAS.	Visita al sitio de realización de los trabajos, relacionado con la invitación Restringida a Cuando Menos Tres Personas, identificada con el número IO-009KDH999-N82-2015 respecto a la “Adecuación de espacios para oficinas, del Grupo Aeroportuario de la Ciudad de México (GACM), en el CEMCAS, dio inicio a las 10:00  en el Km. 7.5 de la Autopista Peñon - Texcoco (cuota) en el CEMCAS y se dio por concluida a las 12:00 horas del mismo día sin que existiera observación alguna por parte de los asistentes.	2015-11-06 00:00:00	2015-11-06 00:00:00	Complete
19	143	\N	1	Visita al sitio de la realización de los trabajos, relacionado conde la Invitación Nacional a cuando Menos Tres Personas identificado con el número IO-009KDH999-N83-2015, relacionado con el “Desarrollo del Proyecto ejecutivo para el entronque de acceso de carga en la zona Norte del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM) 	La Visita al sitio de realización de los trabajos, relacionado con la invitación Restringida a Cuando Menos Tres Personas IO-009KDH999-N83-2015, relacionado con el “Desarrollo del Proyecto ejecutivo para el entronque de acceso de carga en la zona Norte del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM) , identificada con el número , dio inicio a las 10:00  en el Km. 7.5 de la Autopista de Cuota Peñon - Texcoco en el Centro Mexicano de Capacitación en Agua y Saneamiento y se dio por concluida a las 12:00 horas del mismo día sin que existiera observación alguna por parte de los asistentes.	2015-11-06 00:00:00	2015-11-06 00:00:00	Complete
20	140	\N	1	Visita al sitio de realización de los trabajos, relacionado con la invitación Restringida a Cuando Menos Tres Personas, identificada con el número IO-009KDH999-E45-2016 respecto del H99	La Visita al sitio de realización de los trabajos, relacionado con la invitación Restringida a Cuando Menos Tres Personas, identificada con el número IO-009KDH999-E45-2016 respecto del “Servicios de apoyo técnico a la residencia del proyecto ejecutivo de diseño arquitectónico e ingeniería de detalle del edificio terminal de pasajeros, torre de control y centro de operaciones, edificio de estacionamiento, estacionamientos en superficie, estación multimodal y vialidades de acceso del NAICM", dio inicio a las 11:00  en el Km. 7.5 de la Autopista de Cuota Peñon - Texcoco en el Centro Mexicano de Capacitación en Agua y Saneamiento y se dio por concluida a las 13:00 horas del mismo día sin que existiera observación alguna por parte de los asistentes.	2016-04-01 00:00:00	2016-04-15 00:00:00	complete
22	109	\N	1	Visita al sitio de realización de los trabajos de Supervisión Técnica, Administrativa y de Control de calidad para los trabajos de nivelación y limpieza del terreno del Nuevo aeropuerto internacional de la Ciudad de México.	La visita al sitio de realización de los trabajos deSupervisión Técnica, Administrativa y de Control de calidad para los trabajos de nivelación y limpieza del terreno del Nuevo aeropuerto internacional de la Ciudad de México dio inicio a las 11:00 horas del 23 de noviembre de 2015 en el Km. 7.5 de la Autopista de Cuota Peñon - Texcoco en el Centro Mexicano de Capacitación en Agua y Saneamiento y se dio por concluida a las 13:00 horas del mismo día sin que existiera observación alguna por parte de los asistentes.	2015-11-23 00:00:00	2015-11-23 00:00:00	Concluido 
23	110	\N	1	"Visita al sitio de realización de los trabajos para la Supervisión Técnica, Administrativa y de Control de calidad para los Trabajos de Construcción de los Caminos Provisionales de Acceso al Nuevo Aeropuerto Internacional de la Ciudad de México. "	"La visita al sitio de realización de los trabajos para la Supervisión Técnica, Administrativa y de Control de calidad para los Trabajos de Construcción de los Caminos Provisionales de Acceso al Nuevo Aeropuerto Internacional de la Ciudad de México dio inicio a las 11:00 horas del 25 de noviembre de 2015 en el Km. 7.5 de la Autopista de Cuota Peñon - Texcoco en el Centro Mexicano de Capacitación en Agua y Saneamiento y se dio por concluida a las 13:00 horas del mismo día sin que existiera observación alguna por parte de los asistentes. "	2015-11-25 00:00:00	2015-11-25 00:00:00	Concluido 
24	108	\N	1	Visita al sitio de realización de los trabajos para la Construcción de accesos y plataformas para exploración geotécnica, rehabilitación de tramos de prueba y bacheo somero de caminos existentes dentro del terreno par el Nuevo Aeropuerto Internacional de la Ciudad de México.	La visita al sitio de realización de los trabajos para la Construcción de accesos y plataformas para exploración geotécnica, rehabilitación de tramos de prueba y bacheo somero de caminos existentes dentro del terreno par el Nuevo Aeropuerto Internacional de la Ciudad de México. en el sitio del NACM  dio inicio a las 11:00 horas del 10 de febrero de 2016 en el Km. 75 de la Autopista de Cuota Peñon - Texcoco en el Centro Mexicano de Capacitación en Agua y Saneamiento y se dio por concluida a las 13:00 horas del mismo día sin que existiera observación alguna por parte de los asistentes.	2016-02-10 00:00:00	2016-02-10 00:00:00	Concluido 
25	206	\N	1	Visita al sitio de realización de los trabajos para la Construcción de accesos y plataformas para exploración geotécnica, rehabilitación de tramos de prueba y bacheo somero de caminos existentes dentro del terreno par el Nuevo Aeropuerto Internacional de la Ciudad de México.	La visita al sitio de realización de los trabajos para la Construcción de accesos y plataformas para exploración geotécnica, rehabilitación de tramos de prueba y bacheo somero de caminos existentes dentro del terreno par el Nuevo Aeropuerto Internacional de la Ciudad de México. en el sitio del NACM  dio inicio a las 11:00 horas del 10 de febrero de 2016 en el Km. 75 de la Autopista de Cuota Peñon - Texcoco en el Centro Mexicano de Capacitación en Agua y Saneamiento y se dio por concluida a las 13:00 horas del mismo día sin que existiera observación alguna por parte de los asistentes.	2016-02-10 00:00:00	2016-02-10 00:00:00	Complete
26	219	\N	1	Visita al sitio de realización de los trabajos  para el Sistema de Precarga e instrumentación geotécnica, infraestructura, estructura de pavimentos y obra civil de ayudas visuales y para la navegación de la pista 2 y área de túneles del Nuevo Aeropuerto Internacional de la Ciudad de México	La Visita al sitio de realización de los trabajos para para el Sistema de Precarga e instrumentación geotécnica, infraestructura, estructura de pavimentos y obra civil de ayudas visuales y para la navegación de la pista 2 y área de túneles del Nuevo Aeropuerto Internacional de la Ciudad de Méxicodio inicio a las 11:00 horas del 06 de octubre de 2015 en el Km. 75 de la Autopista de Cuota Peñon - Texcoco en el Centro Mexicano de Capacitación en Agua y Saneamiento y se dio por concluida a las 14:00 horas del mismo día sin que existiera observación alguna por parte de los asistentes. 	2016-04-28 00:00:00	\N	complete
27	220	\N	1	Visita al sitio de realización de los trabajos  para el Sistema de Precarga e instrumentación geotécnica, infraestructura, estructura de pavimentos y obra civil de ayudas visuales y para la navegación de la pista 2 y área de túneles del Nuevo Aeropuerto Internacional de la Ciudad de México	"La Visita al sitio de realización de los trabajos para para el Sistema de Precarga e instrumentación geotécnica, infraestructura, estructura de pavimentos y obra civil de ayudas visuales y para la navegación de la pista 3 y área de túneles del Nuevo Aeropuerto Internacional de la Ciudad de México. (NAICM) dio inicio a las 11:00 horas del 06 de octubre de 2015 en el Km. 75 de la Autopista de Cuota Peñon - Texcoco en el Centro Mexicano de Capacitación en Agua y Saneamiento y se dio por concluida a las 14:00 horas del mismo día sin que existiera observación alguna por parte de los asistentes. "	2016-04-28 00:00:00	2016-04-28 00:00:00	Concluido 
\.


--
-- Name: tendermilestone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('tendermilestone_id_seq', 27, true);


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

