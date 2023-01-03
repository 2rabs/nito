ALTER TABLE "public"."participation"
    ADD user_id uuid;

ALTER TABLE "public"."participation"
    ADD FOREIGN KEY (user_id)
        REFERENCES auth.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE SET NULL;

COMMENT ON COLUMN "public"."participation"."user_id" IS 'ユーザーID';