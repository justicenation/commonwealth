-- Table: public.entities

-- DROP TABLE public.entities;

CREATE TABLE public.entities
(
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    id bigint NOT NULL DEFAULT nextval('entities_id_seq'::regclass),
    owner_id bigint NOT NULL,
    CONSTRAINT entities_pkey PRIMARY KEY (id),
    CONSTRAINT owner_id FOREIGN KEY (owner_id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE RESTRICT
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.entities
    OWNER to postgres;
