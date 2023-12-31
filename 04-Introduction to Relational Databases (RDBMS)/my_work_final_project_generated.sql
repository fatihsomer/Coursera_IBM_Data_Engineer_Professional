-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE public.sales_transaction
(
    transaction_id integer NOT NULL,
    date date NOT NULL,
    "time" time without time zone NOT NULL,
    sales_outlet_id integer NOT NULL,
    staff_id integer NOT NULL,
    customer_id integer NOT NULL,
    sales_detail_id integer NOT NULL,
    PRIMARY KEY (transaction_id)
);

CREATE TABLE public.product
(
    product_id integer NOT NULL,
    product_category_id integer NOT NULL,
    product_type_id integer NOT NULL,
    product_name character varying NOT NULL,
    description character varying,
    price numeric(8, 2),
    PRIMARY KEY (product_id)
);

CREATE TABLE public.sales_detail
(
    sales_detail_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer,
    price numeric(8, 2),
    PRIMARY KEY (sales_detail_id)
);

CREATE TABLE public.product_type
(
    product_type_id integer NOT NULL,
    product_type character varying,
    PRIMARY KEY (product_type_id)
);

CREATE TABLE public.product_category
(
    product_category_id integer NOT NULL,
    product_category character varying NOT NULL,
    PRIMARY KEY (product_category_id)
);

ALTER TABLE public.sales_transaction
    ADD FOREIGN KEY (sales_detail_id)
    REFERENCES public.sales_detail (sales_detail_id)
    NOT VALID;


ALTER TABLE public.product
    ADD FOREIGN KEY (product_type_id)
    REFERENCES public.product_type (product_type_id)
    NOT VALID;


ALTER TABLE public.product
    ADD FOREIGN KEY (product_category_id)
    REFERENCES public.product_category (product_category_id)
    NOT VALID;


ALTER TABLE public.sales_detail
    ADD FOREIGN KEY (product_id)
    REFERENCES public.product (product_id)
    NOT VALID;

END;
