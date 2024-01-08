CREATE TABLE "Condominio" (
	"IdCond" INT NOT NULL,
	"Nome" VARCHAR2(255) NOT NULL,
	"IdUnidCond" INT NOT NULL,
	constraint CONDOMINIO_PK PRIMARY KEY ("IdCond"));

CREATE sequence "CONDOMINIO_IDCOND_SEQ";

CREATE trigger "BI_CONDOMINIO_IDCOND"
  before insert on "Condominio"
  for each row
begin
  select "CONDOMINIO_IDCOND_SEQ".nextval into :NEW."IdCond" from dual;
end;

/
CREATE TABLE "UnidadeCondominal" (
	"IdUnidCond" INT NOT NULL,
	"Numero" INT NOT NULL,
	"IdProprietario" INT NOT NULL,
	constraint UNIDADECONDOMINAL_PK PRIMARY KEY ("IdUnidCond"));

CREATE sequence "UNIDADECONDOMINAL_IDUNIDCOND_SEQ";

CREATE trigger "BI_UNIDADECONDOMINAL_IDUNIDCOND"
  before insert on "UnidadeCondominal"
  for each row
begin
  select "UNIDADECONDOMINAL_IDUNIDCOND_SEQ".nextval into :NEW."IdUnidCond" from dual;
end;

/
CREATE TABLE "Proprietario" (
	"IdProprietario" INT NOT NULL,
	"Nome" VARCHAR2(255) NOT NULL,
	"IdUnidCond" INT NOT NULL,
	constraint PROPRIETARIO_PK PRIMARY KEY ("IdProprietario"));

CREATE sequence "PROPRIETARIO_IDPROPRIETARIO_SEQ";

CREATE trigger "BI_PROPRIETARIO_IDPROPRIETARIO"
  before insert on "Proprietario"
  for each row
begin
  select "PROPRIETARIO_IDPROPRIETARIO_SEQ".nextval into :NEW."IdProprietario" from dual;
end;

/
CREATE TABLE "Inquilino" (
	"IdInquilino" INT NOT NULL,
	"Nome" VARCHAR2(255) NOT NULL,
	"IdUnidCond" INT NOT NULL,
	constraint INQUILINO_PK PRIMARY KEY ("IdInquilino"));

CREATE sequence "INQUILINO_IDINQUILINO_SEQ";

CREATE trigger "BI_INQUILINO_IDINQUILINO"
  before insert on "Inquilino"
  for each row
begin
  select "INQUILINO_IDINQUILINO_SEQ".nextval into :NEW."IdInquilino" from dual;
end;

/
ALTER TABLE "Condominio" ADD CONSTRAINT "Condominio_fk0" FOREIGN KEY ("IdUnidCond") REFERENCES "UnidadeCondominal"("undefined");

ALTER TABLE "UnidadeCondominal" ADD CONSTRAINT "UnidadeCondominal_fk0" FOREIGN KEY ("IdProprietario") REFERENCES "Proprietario"("undefined");

ALTER TABLE "Proprietario" ADD CONSTRAINT "Proprietario_fk0" FOREIGN KEY ("IdUnidCond") REFERENCES "UnidadeCondominal"("id");

ALTER TABLE "Inquilino" ADD CONSTRAINT "Inquilino_fk0" FOREIGN KEY ("IdUnidCond") REFERENCES "UnidadeCondominal"("id");

