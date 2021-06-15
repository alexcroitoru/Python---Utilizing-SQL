-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Credit_Card" (
    "Card" int   NOT NULL,
    "Cardholder_ID" int   NOT NULL,
    CONSTRAINT "pk_Credit_Card" PRIMARY KEY (
        "Card"
     )
);

CREATE TABLE "Merchant" (
    "ID" int   NOT NULL,
    "Name" varchar(200)   NOT NULL,
    "ID_merchant_category" int   NOT NULL,
    CONSTRAINT "pk_Merchant" PRIMARY KEY (
        "ID"
     ),
    CONSTRAINT "uc_Merchant_Name" UNIQUE (
        "Name"
    )
);

CREATE TABLE "Merchant_Category" (
    "ID" int   NOT NULL,
    "Name" varchar(200)   NOT NULL,
    CONSTRAINT "pk_Merchant_Category" PRIMARY KEY (
        "ID"
     ),
    CONSTRAINT "uc_Merchant_Category_Name" UNIQUE (
        "Name"
    )
);

-- Table documentation comment 1 (try the PDF/RTF export)
-- Table documentation comment 2
CREATE TABLE "Card_Holder" (
    "ID" int   NOT NULL,
    -- Field documentation comment 1
    -- Field documentation comment 2
    -- Field documentation comment 3
    "Name" varchar(200)   NOT NULL,
    CONSTRAINT "pk_Card_Holder" PRIMARY KEY (
        "ID"
     ),
    CONSTRAINT "uc_Card_Holder_Name" UNIQUE (
        "Name"
    )
);

CREATE TABLE "Transaction" (
    "ID" int   NOT NULL,
    "Date" date   NOT NULL,
    "Amount" float   NOT NULL,
    "Card" int   NOT NULL,
    "ID_Merchant" int   NOT NULL,
    CONSTRAINT "pk_Transaction" PRIMARY KEY (
        "ID"
     )
);

ALTER TABLE "Credit_Card" ADD CONSTRAINT "fk_Credit_Card_Cardholder_ID" FOREIGN KEY("Cardholder_ID")
REFERENCES "Card_Holder" ("ID");

ALTER TABLE "Merchant" ADD CONSTRAINT "fk_Merchant_ID_merchant_category" FOREIGN KEY("ID_merchant_category")
REFERENCES "Merchant_Category" ("ID");

ALTER TABLE "Transaction" ADD CONSTRAINT "fk_Transaction_Card" FOREIGN KEY("Card")
REFERENCES "Credit_Card" ("Card");

ALTER TABLE "Transaction" ADD CONSTRAINT "fk_Transaction_ID_Merchant" FOREIGN KEY("ID_Merchant")
REFERENCES "Merchant" ("ID");

