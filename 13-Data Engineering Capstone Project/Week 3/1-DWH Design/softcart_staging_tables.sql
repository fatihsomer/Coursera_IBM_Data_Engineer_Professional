-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE staging."softcartDimDate"
(
    dateid integer NOT NULL,
    month smallint,
    monthname character varying,
    quarter smallint,
    quartername character varying,
    year smallint,
    day smallint,
    weekday smallint,
    weekdayname character varying,
    PRIMARY KEY (dateid)
);

CREATE TABLE staging."softcartDimCategory"
(
    categoryid integer NOT NULL,
    category character varying,
    PRIMARY KEY (categoryid)
);

CREATE TABLE staging."softcartDimItem"
(
    itemid integer NOT NULL,
    item character varying,
    PRIMARY KEY (itemid)
);

CREATE TABLE staging."softcartDimCountry"
(
    countryid integer NOT NULL,
    country character varying,
    PRIMARY KEY (countryid)
);

CREATE TABLE staging."softcartFactSales"
(
    orderid integer NOT NULL,
    itemid integer,
    categoryid integer,
    price double precision,
    countryid integer,
    dateid integer,
    PRIMARY KEY (orderid)
);

ALTER TABLE staging."softcartFactSales"
    ADD FOREIGN KEY (itemid)
    REFERENCES staging."softcartDimItem" (itemid)
    NOT VALID;


ALTER TABLE staging."softcartFactSales"
    ADD FOREIGN KEY (categoryid)
    REFERENCES staging."softcartDimCategory" (categoryid)
    NOT VALID;


ALTER TABLE staging."softcartFactSales"
    ADD FOREIGN KEY (countryid)
    REFERENCES staging."softcartDimCountry" (countryid)
    NOT VALID;


ALTER TABLE staging."softcartFactSales"
    ADD FOREIGN KEY (dateid)
    REFERENCES staging."softcartDimDate" (dateid)
    NOT VALID;

END;