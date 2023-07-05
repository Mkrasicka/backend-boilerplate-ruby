CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "accounts" ("id" uuid NOT NULL PRIMARY KEY, "balance" integer, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "transactions" ("id" uuid NOT NULL PRIMARY KEY, "account_id" uuid NOT NULL, "amount" integer, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_01f020e267"
FOREIGN KEY ("account_id")
  REFERENCES "accounts" ("id")
);
CREATE INDEX "index_transactions_on_account_id" ON "transactions" ("account_id");
CREATE TABLE IF NOT EXISTS "transaction_requests" ("id" uuid NOT NULL PRIMARY KEY, "account_id" uuid NOT NULL, "amount" integer, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_6d25e47c45"
FOREIGN KEY ("account_id")
  REFERENCES "accounts" ("id")
);
CREATE INDEX "index_transaction_requests_on_account_id" ON "transaction_requests" ("account_id");
INSERT INTO "schema_migrations" (version) VALUES
('20230705153328'),
('20230705153441'),
('20230705153738'),
('20230705153956'),
('20230705154050');


