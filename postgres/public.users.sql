-- Table: public.users

-- DROP TABLE public.users;

CREATE TABLE public.users
(
    first_name character varying(40) COLLATE pg_catalog."default",
    last_name character varying(40) COLLATE pg_catalog."default" NOT NULL,
    username character varying(255) COLLATE pg_catalog."default" NOT NULL,
    id bigint NOT NULL DEFAULT nextval('users_id_seq'::regclass),
    CONSTRAINT users_pkey PRIMARY KEY (id),
    CONSTRAINT username UNIQUE (username)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.users
    OWNER to postgres;
