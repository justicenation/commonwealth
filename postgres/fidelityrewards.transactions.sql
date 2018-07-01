-- Table: fidelityrewards.transactions

-- DROP TABLE fidelityrewards.transactions;

CREATE TABLE fidelityrewards.transactions
(
    id bigint NOT NULL DEFAULT nextval('fidelityrewards.transactions_id_seq'::regclass),
    transaction_date date NOT NULL,
    type character varying COLLATE pg_catalog."default" NOT NULL,
    name character varying(80) COLLATE pg_catalog."default" NOT NULL,
    memo character varying(80) COLLATE pg_catalog."default" NOT NULL,
    amount numeric(10,2) NOT NULL,
    entity_id bigint,
    created_by_id bigint,
    CONSTRAINT transactions_pkey PRIMARY KEY (id),
    CONSTRAINT created_by_id FOREIGN KEY (created_by_id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT entity_id FOREIGN KEY (entity_id)
        REFERENCES public.entities (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE fidelityrewards.transactions
    OWNER to postgres;
