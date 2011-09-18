--
-- SQL script created for Sqlite
--
	

-- Class Benutzer of type FORM found.
				
-- Class Formulare of type FORM found.
				
-- Class Formular_Parameter of type FORM found.
				
-- Class AnwendungenBenutzer of type FORM found.
				
-- Class FormulareAnwendung of type FORM found.
				
-- Class Anwendungen of type FORM found.
				
-- Class Aktionen of type FORM found.
				
-- Class Uebersetzungen of type FORM found.
				
-- Class Formularaktionenzuordnen of type FORM found.
				
-- Class Anwendungsparameter of type FORM found.
				
-- Class Aktionsschrittezuordnen of type FORM found.
				
-- Class Reportdefinitionen of type FORM found.
				
-- Class Reportparameter of type FORM found.
				
-- Class action_parameters of type ENTITY found.
-- Create table model with template 'importApplicationTable'.

-- Generate application table action_parameters for lbDMFManager_Entities. Tagtet database: 'Sqlite'


CREATE TABLE "report"
(
  "report_id" INTEGER PRIMARY KEY,
  "report_name" BPCHAR,
  "report_sys" BOOLEAN,
  "report_source" BPCHAR,
  "report_descrip" BPCHAR,
  "report_grade" INTEGER NOT NULL,
  "report_loaddate" TIMESTAMP
);

-- CREATE Sqlite TABLE action_parameters
CREATE TABLE "action_parameters" (
	"id" INTEGER PRIMARY KEY,
	"name" BPCHAR,
	"value" BPCHAR,
	"interface" BPCHAR,
	"description" BPCHAR,
	"actionid" INTEGER
);

-- Class action_step_parameter of type ENTITY found.
-- Create table model with template 'importApplicationTable'.

-- Generate application table action_step_parameter for lbDMFManager_Entities. Tagtet database: 'Sqlite'


-- CREATE Sqlite TABLE action_step_parameter
CREATE TABLE "action_step_parameter" (
	"id" INTEGER PRIMARY KEY,
	"name" BPCHAR,
	"value" BPCHAR,
	"interface" BPCHAR,
	"description" BPCHAR,
	"action_step_id" INTEGER
);

-- Class action_step_transitions of type ENTITY found.
-- Create table model with template 'importApplicationTable'.

-- Generate application table action_step_transitions for lbDMFManager_Entities. Tagtet database: 'Sqlite'


-- CREATE Sqlite TABLE action_step_transitions
CREATE TABLE "action_step_transitions" (
	"id" INTEGER PRIMARY KEY,
	"expression" BPCHAR,
	"description" BPCHAR,
	"dst_actionid" INTEGER,
	"src_actionid" INTEGER
);

-- Class action_steps of type ENTITY found.
-- Create table model with template 'importApplicationTable'.

-- Generate application table action_steps for lbDMFManager_Entities. Tagtet database: 'Sqlite'


-- CREATE Sqlite TABLE action_steps
CREATE TABLE "action_steps" (
	"id" INTEGER PRIMARY KEY,
	"bezeichnung" BPCHAR,
	"a_order_nr" INTEGER,
	"what" BPCHAR,
	"type" INTEGER,
	"actionid" INTEGER
);

-- Class action_types of type ENTITY found.
-- Create table model with template 'importApplicationTable'.

-- Generate application table action_types for lbDMFManager_Entities. Tagtet database: 'Sqlite'


-- CREATE Sqlite TABLE action_types
CREATE TABLE "action_types" (
	"id" INTEGER PRIMARY KEY,
	"bezeichnung" BPCHAR,
	"action_handler" BPCHAR,
	"module" BPCHAR
);

-- Class actions of type ENTITY found.
-- Create table model with template 'importApplicationTable'.

-- Generate application table actions for lbDMFManager_Entities. Tagtet database: 'Sqlite'


-- CREATE Sqlite TABLE actions
CREATE TABLE "actions" (
	"id" INTEGER PRIMARY KEY,
	"name" BPCHAR,
	"source" BPCHAR,
	"target" BPCHAR,
	"typ" INTEGER
);

-- Class anwendungen of type ENTITY found.
-- Create table model with template 'importApplicationTable'.

-- Generate application table anwendungen for lbDMFManager_Entities. Tagtet database: 'Sqlite'


-- CREATE Sqlite TABLE anwendungen
CREATE TABLE "anwendungen" (
	"id" INTEGER PRIMARY KEY,
	"name" BPCHAR,
	"titel" BPCHAR,
	"modulename" BPCHAR,
	"functor" BPCHAR,
	"interface" BPCHAR
);

-- Class anwendungen_formulare of type ENTITY found.
-- Create table model with template 'importApplicationTable'.

-- Generate application table anwendungen_formulare for lbDMFManager_Entities. Tagtet database: 'Sqlite'


-- CREATE Sqlite TABLE anwendungen_formulare
CREATE TABLE "anwendungen_formulare" (
	"id" INTEGER PRIMARY KEY,
	"anwendungid" INTEGER,
	"formularid" INTEGER
);

-- Class anwendungs_parameter of type ENTITY found.
-- Create table model with template 'importApplicationTable'.

-- Generate application table anwendungs_parameter for lbDMFManager_Entities. Tagtet database: 'Sqlite'


-- CREATE Sqlite TABLE anwendungs_parameter
CREATE TABLE "anwendungs_parameter" (
	"id" INTEGER PRIMARY KEY,
	"parametername" BPCHAR,
	"parametervalue" BPCHAR,
	"anwendungid" INTEGER
);

-- Class anwendungsberechtigungen of type ENTITY found.
-- Create table model with template 'importApplicationTable'.

-- Generate application table anwendungsberechtigungen for lbDMFManager_Entities. Tagtet database: 'Sqlite'


-- CREATE Sqlite TABLE anwendungsberechtigungen
CREATE TABLE "anwendungsberechtigungen" (
	"id" INTEGER PRIMARY KEY,
	"idformular" INTEGER,
	"iduser" INTEGER
);

-- Class applevel_plugin_registry of type ENTITY found.
-- Create table model with template 'importApplicationTable'.

-- Generate application table applevel_plugin_registry for lbDMFManager_Entities. Tagtet database: 'Sqlite'


-- CREATE Sqlite TABLE applevel_plugin_registry
CREATE TABLE "applevel_plugin_registry" (
	"id" INTEGER PRIMARY KEY,
	"anwendungid" INTEGER
);

-- Class codegentarget of type ENTITY found.
-- Create table model with template 'importApplicationTable'.

-- Generate application table codegentarget for lbDMFManager_Entities. Tagtet database: 'Sqlite'


-- CREATE Sqlite TABLE codegentarget
CREATE TABLE "codegentarget" (
	"id" INTEGER PRIMARY KEY,
	"name" BPCHAR,
	"titel" BPCHAR,
	"modulename" BPCHAR,
	"functor" BPCHAR,
	"interface" BPCHAR
);

-- Class column_types of type ENTITY found.
-- Create table model with template 'importApplicationTable'.

-- Generate application table column_types for lbDMFManager_Entities. Tagtet database: 'Sqlite'


-- CREATE Sqlite TABLE column_types
CREATE TABLE "column_types" (
	"id" INTEGER PRIMARY KEY,
	"name" BPCHAR,
	"tablename" BPCHAR,
	"ro" BOOLEAN,
	"specialcolumn" BOOLEAN,
	"controltype" BPCHAR
);

-- Class foreignkey_visibledata_mapping of type ENTITY found.
-- Create table model with template 'importApplicationTable'.

-- Generate application table foreignkey_visibledata_mapping for lbDMFManager_Entities. Tagtet database: 'Sqlite'


-- CREATE Sqlite TABLE foreignkey_visibledata_mapping
CREATE TABLE "foreignkey_visibledata_mapping" (
	"id" INTEGER PRIMARY KEY,
	"fkname" BPCHAR,
	"fktable" BPCHAR,
	"pkname" BPCHAR,
	"pktable" BPCHAR
);

-- Class formular_actions of type ENTITY found.
-- Create table model with template 'importApplicationTable'.

-- Generate application table formular_actions for lbDMFManager_Entities. Tagtet database: 'Sqlite'


-- CREATE Sqlite TABLE formular_actions
CREATE TABLE "formular_actions" (
	"id" INTEGER PRIMARY KEY,
	"event" BPCHAR,
	"action" INTEGER,
	"formular" INTEGER
);

-- Class formular_parameters of type ENTITY found.
-- Create table model with template 'importApplicationTable'.

-- Generate application table formular_parameters for lbDMFManager_Entities. Tagtet database: 'Sqlite'


-- CREATE Sqlite TABLE formular_parameters
CREATE TABLE "formular_parameters" (
	"id" INTEGER PRIMARY KEY,
	"parametername" BPCHAR,
	"parametervalue" BPCHAR,
	"formularid" INTEGER
);

-- Class formulare of type ENTITY found.
-- Create table model with template 'importApplicationTable'.

-- Generate application table formulare for lbDMFManager_Entities. Tagtet database: 'Sqlite'


-- CREATE Sqlite TABLE formulare
CREATE TABLE "formulare" (
	"id" INTEGER PRIMARY KEY,
	"name" BPCHAR,
	"menuname" BPCHAR,
	"menuorder" INTEGER,
	"eventname" BPCHAR,
	"menuhilfe" BPCHAR,
	"toolbarimage" BPCHAR,
	"anwendungid" INTEGER,
	"typ" INTEGER
);

-- Class formulartypen of type ENTITY found.
-- Create table model with template 'importApplicationTable'.

-- Generate application table formulartypen for lbDMFManager_Entities. Tagtet database: 'Sqlite'


-- CREATE Sqlite TABLE formulartypen
CREATE TABLE "formulartypen" (
	"id" INTEGER PRIMARY KEY,
	"handlermodule" BPCHAR,
	"handlerfunctor" BPCHAR,
	"handlerinterface" BPCHAR,
	"namespace" BPCHAR,
	"beschreibung" BPCHAR
);

-- Class regressiontest of type ENTITY found.
-- Create table model with template 'importApplicationTable'.

-- Generate application table regressiontest for lbDMFManager_Entities. Tagtet database: 'Sqlite'


-- CREATE Sqlite TABLE regressiontest
CREATE TABLE "regressiontest" (
	"id" INTEGER PRIMARY KEY,
	"test" BPCHAR,
	"btest" BOOLEAN,
	"btest1" BOOLEAN
);

-- Class report_element_types of type ENTITY found.
-- Create table model with template 'importApplicationTable'.

-- Generate application table report_element_types for lbDMFManager_Entities. Tagtet database: 'Sqlite'


-- CREATE Sqlite TABLE report_element_types
CREATE TABLE "report_element_types" (
	"id" INTEGER PRIMARY KEY,
	"name" BPCHAR,
	"description" BPCHAR
);

-- Class report_elements of type ENTITY found.
-- Create table model with template 'importApplicationTable'.

-- Generate application table report_elements for lbDMFManager_Entities. Tagtet database: 'Sqlite'


-- CREATE Sqlite TABLE report_elements
CREATE TABLE "report_elements" (
	"id" INTEGER PRIMARY KEY,
	"name" BPCHAR,
	"x" INTEGER,
	"y" INTEGER,
	"w" INTEGER,
	"h" INTEGER,
	"description" BPCHAR,
	"typ" INTEGER,
	"reportid" INTEGER
);

-- Class report_parameters of type ENTITY found.
-- Create table model with template 'importApplicationTable'.

-- Generate application table report_parameters for lbDMFManager_Entities. Tagtet database: 'Sqlite'


-- CREATE Sqlite TABLE report_parameters
CREATE TABLE "report_parameters" (
	"id" INTEGER PRIMARY KEY,
	"name" BPCHAR,
	"value" INTEGER,
	"reportid" INTEGER
);

-- Class report_texts of type ENTITY found.
-- Create table model with template 'importApplicationTable'.

-- Generate application table report_texts for lbDMFManager_Entities. Tagtet database: 'Sqlite'


-- CREATE Sqlite TABLE report_texts
CREATE TABLE "report_texts" (
	"id" INTEGER PRIMARY KEY,
	"line" INTEGER,
	"text" BPCHAR,
	"elementid" INTEGER
);

-- Class reports of type ENTITY found.
-- Create table model with template 'importApplicationTable'.

-- Generate application table reports for lbDMFManager_Entities. Tagtet database: 'Sqlite'


-- CREATE Sqlite TABLE reports
CREATE TABLE "reports" (
	"id" INTEGER PRIMARY KEY,
	"name" BPCHAR,
	"description" BPCHAR
);

-- Class translations of type ENTITY found.
-- Create table model with template 'importApplicationTable'.

-- Generate application table translations for lbDMFManager_Entities. Tagtet database: 'Sqlite'


-- CREATE Sqlite TABLE translations
CREATE TABLE "translations" (
	"id" INTEGER PRIMARY KEY,
	"text" BPCHAR,
	"translated" BPCHAR,
	"language" BPCHAR
);

-- Class user_anwendungen of type ENTITY found.
-- Create table model with template 'importApplicationTable'.

-- Generate application table user_anwendungen for lbDMFManager_Entities. Tagtet database: 'Sqlite'


-- CREATE Sqlite TABLE user_anwendungen
CREATE TABLE "user_anwendungen" (
	"id" INTEGER PRIMARY KEY,
	"anwendungenid" INTEGER,
	"userid" INTEGER
);

-- Class users of type ENTITY found.
-- Create table model with template 'importApplicationTable'.

-- Generate application table users for lbDMFManager_Entities. Tagtet database: 'Sqlite'


-- CREATE Sqlite TABLE users
CREATE TABLE "users" (
	"id" INTEGER PRIMARY KEY,
	"name" BPCHAR,
	"vorname" BPCHAR,
	"userid" BPCHAR,
	"passwort" BPCHAR,
	"lastapp" INTEGER
);

-- Class Benutzer of type FORM found.
				
-- Class Formulare of type FORM found.
				
-- Class Formular_Parameter of type FORM found.
				
-- Class AnwendungenBenutzer of type FORM found.
				
-- Class FormulareAnwendung of type FORM found.
				
-- Class Anwendungen of type FORM found.
				
-- Class Aktionen of type FORM found.
				
-- Class Uebersetzungen of type FORM found.
				
-- Class Formularaktionenzuordnen of type FORM found.
				
-- Class Anwendungsparameter of type FORM found.
				
-- Class Aktionsschrittezuordnen of type FORM found.
				
-- Class Reportdefinitionen of type FORM found.
				
-- Class Reportparameter of type FORM found.
				
-- Class action_parameters of type ENTITY found.

-- Generate application tables action_parameters for lbDMFManager_Entities primary keys. Tagtet database: 'Sqlite'


-- Skipped, due to creation in template 'importApplicationTable'

-- Class action_step_parameter of type ENTITY found.

-- Generate application tables action_step_parameter for lbDMFManager_Entities primary keys. Tagtet database: 'Sqlite'


-- Skipped, due to creation in template 'importApplicationTable'

-- Class action_step_transitions of type ENTITY found.

-- Generate application tables action_step_transitions for lbDMFManager_Entities primary keys. Tagtet database: 'Sqlite'


-- Skipped, due to creation in template 'importApplicationTable'

-- Class action_steps of type ENTITY found.

-- Generate application tables action_steps for lbDMFManager_Entities primary keys. Tagtet database: 'Sqlite'


-- Skipped, due to creation in template 'importApplicationTable'

-- Class action_types of type ENTITY found.

-- Generate application tables action_types for lbDMFManager_Entities primary keys. Tagtet database: 'Sqlite'


-- Skipped, due to creation in template 'importApplicationTable'

-- Class actions of type ENTITY found.

-- Generate application tables actions for lbDMFManager_Entities primary keys. Tagtet database: 'Sqlite'


-- Skipped, due to creation in template 'importApplicationTable'

-- Class anwendungen of type ENTITY found.

-- Generate application tables anwendungen for lbDMFManager_Entities primary keys. Tagtet database: 'Sqlite'


-- Skipped, due to creation in template 'importApplicationTable'

-- Class anwendungen_formulare of type ENTITY found.

-- Generate application tables anwendungen_formulare for lbDMFManager_Entities primary keys. Tagtet database: 'Sqlite'


-- Skipped, due to creation in template 'importApplicationTable'

-- Class anwendungs_parameter of type ENTITY found.

-- Generate application tables anwendungs_parameter for lbDMFManager_Entities primary keys. Tagtet database: 'Sqlite'


-- Skipped, due to creation in template 'importApplicationTable'

-- Class anwendungsberechtigungen of type ENTITY found.

-- Generate application tables anwendungsberechtigungen for lbDMFManager_Entities primary keys. Tagtet database: 'Sqlite'


-- Skipped, due to creation in template 'importApplicationTable'

-- Class applevel_plugin_registry of type ENTITY found.

-- Generate application tables applevel_plugin_registry for lbDMFManager_Entities primary keys. Tagtet database: 'Sqlite'


-- Skipped, due to creation in template 'importApplicationTable'

-- Class codegentarget of type ENTITY found.

-- Generate application tables codegentarget for lbDMFManager_Entities primary keys. Tagtet database: 'Sqlite'


-- Skipped, due to creation in template 'importApplicationTable'

-- Class column_types of type ENTITY found.

-- Generate application tables column_types for lbDMFManager_Entities primary keys. Tagtet database: 'Sqlite'


-- Skipped, due to creation in template 'importApplicationTable'

-- Class foreignkey_visibledata_mapping of type ENTITY found.

-- Generate application tables foreignkey_visibledata_mapping for lbDMFManager_Entities primary keys. Tagtet database: 'Sqlite'


-- Skipped, due to creation in template 'importApplicationTable'

-- Class formular_actions of type ENTITY found.

-- Generate application tables formular_actions for lbDMFManager_Entities primary keys. Tagtet database: 'Sqlite'


-- Skipped, due to creation in template 'importApplicationTable'

-- Class formular_parameters of type ENTITY found.

-- Generate application tables formular_parameters for lbDMFManager_Entities primary keys. Tagtet database: 'Sqlite'


-- Skipped, due to creation in template 'importApplicationTable'

-- Class formulare of type ENTITY found.

-- Generate application tables formulare for lbDMFManager_Entities primary keys. Tagtet database: 'Sqlite'


-- Skipped, due to creation in template 'importApplicationTable'

-- Class formulartypen of type ENTITY found.

-- Generate application tables formulartypen for lbDMFManager_Entities primary keys. Tagtet database: 'Sqlite'


-- Skipped, due to creation in template 'importApplicationTable'

-- Class regressiontest of type ENTITY found.

-- Generate application tables regressiontest for lbDMFManager_Entities primary keys. Tagtet database: 'Sqlite'


-- Skipped, due to creation in template 'importApplicationTable'

-- Class report_element_types of type ENTITY found.

-- Generate application tables report_element_types for lbDMFManager_Entities primary keys. Tagtet database: 'Sqlite'


-- Skipped, due to creation in template 'importApplicationTable'

-- Class report_elements of type ENTITY found.

-- Generate application tables report_elements for lbDMFManager_Entities primary keys. Tagtet database: 'Sqlite'


-- Skipped, due to creation in template 'importApplicationTable'

-- Class report_parameters of type ENTITY found.

-- Generate application tables report_parameters for lbDMFManager_Entities primary keys. Tagtet database: 'Sqlite'


-- Skipped, due to creation in template 'importApplicationTable'

-- Class report_texts of type ENTITY found.

-- Generate application tables report_texts for lbDMFManager_Entities primary keys. Tagtet database: 'Sqlite'


-- Skipped, due to creation in template 'importApplicationTable'

-- Class reports of type ENTITY found.

-- Generate application tables reports for lbDMFManager_Entities primary keys. Tagtet database: 'Sqlite'


-- Skipped, due to creation in template 'importApplicationTable'

-- Class translations of type ENTITY found.

-- Generate application tables translations for lbDMFManager_Entities primary keys. Tagtet database: 'Sqlite'


-- Skipped, due to creation in template 'importApplicationTable'

-- Class user_anwendungen of type ENTITY found.

-- Generate application tables user_anwendungen for lbDMFManager_Entities primary keys. Tagtet database: 'Sqlite'


-- Skipped, due to creation in template 'importApplicationTable'

-- Class users of type ENTITY found.

-- Generate application tables users for lbDMFManager_Entities primary keys. Tagtet database: 'Sqlite'


-- Skipped, due to creation in template 'importApplicationTable'

-- Generate Sqlite application relations for table action_parameters for lbDMFManager_Entities	

-- Build trigger manually. (Todo: add support for nullable and not nullable)

CREATE TRIGGER "fk_action_parameters_actionid_ins" BEFORE INSERT ON action_parameters FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.actionid IS NOT NULL) AND ((SELECT id FROM actions WHERE id = new.actionid) IS NULL))
                 THEN RAISE(ABORT, 'actionid violates foreign key actions(id)')
    END;
END;
CREATE TRIGGER "fk_action_parameters_actionid_upd" BEFORE UPDATE ON action_parameters FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.actionid IS NOT NULL) AND ((SELECT id FROM actions WHERE id = new.actionid) IS NULL))
                 THEN RAISE(ABORT, 'actionid violates foreign key actions(id)')
    END;
END;
CREATE TRIGGER "fk_action_parameters_actionid_del" BEFORE DELETE ON actions FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((SELECT actionid FROM action_parameters WHERE actionid = old.id) IS NOT NULL)
                 THEN RAISE(ABORT, 'id violates foreign key action_parameters(actionid)')
    END;
END;
INSERT INTO "lbDMF_ForeignKeys" ("PKTable", "PKColumn", "FKTable", "FKColumn") VALUES ('actions', 'id', 'action_parameters', 'actionid');


-- Generate Sqlite application relations for table action_step_parameter for lbDMFManager_Entities	

-- Build trigger manually. (Todo: add support for nullable and not nullable)

CREATE TRIGGER "fk_action_step_parameter_action_step_id_ins" BEFORE INSERT ON action_step_parameter FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.action_step_id IS NOT NULL) AND ((SELECT id FROM action_steps WHERE id = new.action_step_id) IS NULL))
                 THEN RAISE(ABORT, 'action_step_id violates foreign key action_steps(id)')
    END;
END;
CREATE TRIGGER "fk_action_step_parameter_action_step_id_upd" BEFORE UPDATE ON action_step_parameter FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.action_step_id IS NOT NULL) AND ((SELECT id FROM action_steps WHERE id = new.action_step_id) IS NULL))
                 THEN RAISE(ABORT, 'action_step_id violates foreign key action_steps(id)')
    END;
END;
CREATE TRIGGER "fk_action_step_parameter_action_step_id_del" BEFORE DELETE ON action_steps FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((SELECT action_step_id FROM action_step_parameter WHERE action_step_id = old.id) IS NOT NULL)
                 THEN RAISE(ABORT, 'id violates foreign key action_step_parameter(action_step_id)')
    END;
END;
INSERT INTO "lbDMF_ForeignKeys" ("PKTable", "PKColumn", "FKTable", "FKColumn") VALUES ('action_steps', 'id', 'action_step_parameter', 'action_step_id');


-- Generate Sqlite application relations for table action_step_transitions for lbDMFManager_Entities	

-- Build trigger manually. (Todo: add support for nullable and not nullable)

CREATE TRIGGER "fk_action_step_transitions_dst_actionid_ins" BEFORE INSERT ON action_step_transitions FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.dst_actionid IS NOT NULL) AND ((SELECT id FROM action_steps WHERE id = new.dst_actionid) IS NULL))
                 THEN RAISE(ABORT, 'dst_actionid violates foreign key action_steps(id)')
    END;
END;
CREATE TRIGGER "fk_action_step_transitions_dst_actionid_upd" BEFORE UPDATE ON action_step_transitions FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.dst_actionid IS NOT NULL) AND ((SELECT id FROM action_steps WHERE id = new.dst_actionid) IS NULL))
                 THEN RAISE(ABORT, 'dst_actionid violates foreign key action_steps(id)')
    END;
END;
CREATE TRIGGER "fk_action_step_transitions_dst_actionid_del" BEFORE DELETE ON action_steps FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((SELECT dst_actionid FROM action_step_transitions WHERE dst_actionid = old.id) IS NOT NULL)
                 THEN RAISE(ABORT, 'id violates foreign key action_step_transitions(dst_actionid)')
    END;
END;
INSERT INTO "lbDMF_ForeignKeys" ("PKTable", "PKColumn", "FKTable", "FKColumn") VALUES ('action_steps', 'id', 'action_step_transitions', 'dst_actionid');

	

-- Build trigger manually. (Todo: add support for nullable and not nullable)

CREATE TRIGGER "fk_action_step_transitions_src_actionid_ins" BEFORE INSERT ON action_step_transitions FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.src_actionid IS NOT NULL) AND ((SELECT id FROM action_steps WHERE id = new.src_actionid) IS NULL))
                 THEN RAISE(ABORT, 'src_actionid violates foreign key action_steps(id)')
    END;
END;
CREATE TRIGGER "fk_action_step_transitions_src_actionid_upd" BEFORE UPDATE ON action_step_transitions FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.src_actionid IS NOT NULL) AND ((SELECT id FROM action_steps WHERE id = new.src_actionid) IS NULL))
                 THEN RAISE(ABORT, 'src_actionid violates foreign key action_steps(id)')
    END;
END;
CREATE TRIGGER "fk_action_step_transitions_src_actionid_del" BEFORE DELETE ON action_steps FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((SELECT src_actionid FROM action_step_transitions WHERE src_actionid = old.id) IS NOT NULL)
                 THEN RAISE(ABORT, 'id violates foreign key action_step_transitions(src_actionid)')
    END;
END;
INSERT INTO "lbDMF_ForeignKeys" ("PKTable", "PKColumn", "FKTable", "FKColumn") VALUES ('action_steps', 'id', 'action_step_transitions', 'src_actionid');


-- Generate Sqlite application relations for table action_steps for lbDMFManager_Entities	

-- Build trigger manually. (Todo: add support for nullable and not nullable)

CREATE TRIGGER "fk_action_steps_type_ins" BEFORE INSERT ON action_steps FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.type IS NOT NULL) AND ((SELECT id FROM action_types WHERE id = new.type) IS NULL))
                 THEN RAISE(ABORT, 'type violates foreign key action_types(id)')
    END;
END;
CREATE TRIGGER "fk_action_steps_type_upd" BEFORE UPDATE ON action_steps FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.type IS NOT NULL) AND ((SELECT id FROM action_types WHERE id = new.type) IS NULL))
                 THEN RAISE(ABORT, 'type violates foreign key action_types(id)')
    END;
END;
CREATE TRIGGER "fk_action_steps_type_del" BEFORE DELETE ON action_types FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((SELECT type FROM action_steps WHERE type = old.id) IS NOT NULL)
                 THEN RAISE(ABORT, 'id violates foreign key action_steps(type)')
    END;
END;
INSERT INTO "lbDMF_ForeignKeys" ("PKTable", "PKColumn", "FKTable", "FKColumn") VALUES ('action_types', 'id', 'action_steps', 'type');

	

-- Build trigger manually. (Todo: add support for nullable and not nullable)

CREATE TRIGGER "fk_action_steps_actionid_ins" BEFORE INSERT ON action_steps FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.actionid IS NOT NULL) AND ((SELECT id FROM actions WHERE id = new.actionid) IS NULL))
                 THEN RAISE(ABORT, 'actionid violates foreign key actions(id)')
    END;
END;
CREATE TRIGGER "fk_action_steps_actionid_upd" BEFORE UPDATE ON action_steps FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.actionid IS NOT NULL) AND ((SELECT id FROM actions WHERE id = new.actionid) IS NULL))
                 THEN RAISE(ABORT, 'actionid violates foreign key actions(id)')
    END;
END;
CREATE TRIGGER "fk_action_steps_actionid_del" BEFORE DELETE ON actions FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((SELECT actionid FROM action_steps WHERE actionid = old.id) IS NOT NULL)
                 THEN RAISE(ABORT, 'id violates foreign key action_steps(actionid)')
    END;
END;
INSERT INTO "lbDMF_ForeignKeys" ("PKTable", "PKColumn", "FKTable", "FKColumn") VALUES ('actions', 'id', 'action_steps', 'actionid');


-- Generate Sqlite application relations for table action_types for lbDMFManager_Entities
-- Generate Sqlite application relations for table actions for lbDMFManager_Entities	

-- Build trigger manually. (Todo: add support for nullable and not nullable)

CREATE TRIGGER "fk_actions_typ_ins" BEFORE INSERT ON actions FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.typ IS NOT NULL) AND ((SELECT id FROM action_types WHERE id = new.typ) IS NULL))
                 THEN RAISE(ABORT, 'typ violates foreign key action_types(id)')
    END;
END;
CREATE TRIGGER "fk_actions_typ_upd" BEFORE UPDATE ON actions FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.typ IS NOT NULL) AND ((SELECT id FROM action_types WHERE id = new.typ) IS NULL))
                 THEN RAISE(ABORT, 'typ violates foreign key action_types(id)')
    END;
END;
CREATE TRIGGER "fk_actions_typ_del" BEFORE DELETE ON action_types FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((SELECT typ FROM actions WHERE typ = old.id) IS NOT NULL)
                 THEN RAISE(ABORT, 'id violates foreign key actions(typ)')
    END;
END;
INSERT INTO "lbDMF_ForeignKeys" ("PKTable", "PKColumn", "FKTable", "FKColumn") VALUES ('action_types', 'id', 'actions', 'typ');


-- Generate Sqlite application relations for table anwendungen for lbDMFManager_Entities
-- Generate Sqlite application relations for table anwendungen_formulare for lbDMFManager_Entities	

-- Build trigger manually. (Todo: add support for nullable and not nullable)

CREATE TRIGGER "fk_anwendungen_formulare_anwendungid_ins" BEFORE INSERT ON anwendungen_formulare FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.anwendungid IS NOT NULL) AND ((SELECT id FROM anwendungen WHERE id = new.anwendungid) IS NULL))
                 THEN RAISE(ABORT, 'anwendungid violates foreign key anwendungen(id)')
    END;
END;
CREATE TRIGGER "fk_anwendungen_formulare_anwendungid_upd" BEFORE UPDATE ON anwendungen_formulare FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.anwendungid IS NOT NULL) AND ((SELECT id FROM anwendungen WHERE id = new.anwendungid) IS NULL))
                 THEN RAISE(ABORT, 'anwendungid violates foreign key anwendungen(id)')
    END;
END;
CREATE TRIGGER "fk_anwendungen_formulare_anwendungid_del" BEFORE DELETE ON anwendungen FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((SELECT anwendungid FROM anwendungen_formulare WHERE anwendungid = old.id) IS NOT NULL)
                 THEN RAISE(ABORT, 'id violates foreign key anwendungen_formulare(anwendungid)')
    END;
END;
INSERT INTO "lbDMF_ForeignKeys" ("PKTable", "PKColumn", "FKTable", "FKColumn") VALUES ('anwendungen', 'id', 'anwendungen_formulare', 'anwendungid');

	

-- Build trigger manually. (Todo: add support for nullable and not nullable)

CREATE TRIGGER "fk_anwendungen_formulare_formularid_ins" BEFORE INSERT ON anwendungen_formulare FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.formularid IS NOT NULL) AND ((SELECT id FROM formulare WHERE id = new.formularid) IS NULL))
                 THEN RAISE(ABORT, 'formularid violates foreign key formulare(id)')
    END;
END;
CREATE TRIGGER "fk_anwendungen_formulare_formularid_upd" BEFORE UPDATE ON anwendungen_formulare FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.formularid IS NOT NULL) AND ((SELECT id FROM formulare WHERE id = new.formularid) IS NULL))
                 THEN RAISE(ABORT, 'formularid violates foreign key formulare(id)')
    END;
END;
CREATE TRIGGER "fk_anwendungen_formulare_formularid_del" BEFORE DELETE ON formulare FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((SELECT formularid FROM anwendungen_formulare WHERE formularid = old.id) IS NOT NULL)
                 THEN RAISE(ABORT, 'id violates foreign key anwendungen_formulare(formularid)')
    END;
END;
INSERT INTO "lbDMF_ForeignKeys" ("PKTable", "PKColumn", "FKTable", "FKColumn") VALUES ('formulare', 'id', 'anwendungen_formulare', 'formularid');


-- Generate Sqlite application relations for table anwendungs_parameter for lbDMFManager_Entities	

-- Build trigger manually. (Todo: add support for nullable and not nullable)

CREATE TRIGGER "fk_anwendungs_parameter_anwendungid_ins" BEFORE INSERT ON anwendungs_parameter FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.anwendungid IS NOT NULL) AND ((SELECT id FROM anwendungen WHERE id = new.anwendungid) IS NULL))
                 THEN RAISE(ABORT, 'anwendungid violates foreign key anwendungen(id)')
    END;
END;
CREATE TRIGGER "fk_anwendungs_parameter_anwendungid_upd" BEFORE UPDATE ON anwendungs_parameter FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.anwendungid IS NOT NULL) AND ((SELECT id FROM anwendungen WHERE id = new.anwendungid) IS NULL))
                 THEN RAISE(ABORT, 'anwendungid violates foreign key anwendungen(id)')
    END;
END;
CREATE TRIGGER "fk_anwendungs_parameter_anwendungid_del" BEFORE DELETE ON anwendungen FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((SELECT anwendungid FROM anwendungs_parameter WHERE anwendungid = old.id) IS NOT NULL)
                 THEN RAISE(ABORT, 'id violates foreign key anwendungs_parameter(anwendungid)')
    END;
END;
INSERT INTO "lbDMF_ForeignKeys" ("PKTable", "PKColumn", "FKTable", "FKColumn") VALUES ('anwendungen', 'id', 'anwendungs_parameter', 'anwendungid');


-- Generate Sqlite application relations for table anwendungsberechtigungen for lbDMFManager_Entities	

-- Build trigger manually. (Todo: add support for nullable and not nullable)

CREATE TRIGGER "fk_anwendungsberechtigungen_idformular_ins" BEFORE INSERT ON anwendungsberechtigungen FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.idformular IS NOT NULL) AND ((SELECT id FROM formulare WHERE id = new.idformular) IS NULL))
                 THEN RAISE(ABORT, 'idformular violates foreign key formulare(id)')
    END;
END;
CREATE TRIGGER "fk_anwendungsberechtigungen_idformular_upd" BEFORE UPDATE ON anwendungsberechtigungen FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.idformular IS NOT NULL) AND ((SELECT id FROM formulare WHERE id = new.idformular) IS NULL))
                 THEN RAISE(ABORT, 'idformular violates foreign key formulare(id)')
    END;
END;
CREATE TRIGGER "fk_anwendungsberechtigungen_idformular_del" BEFORE DELETE ON formulare FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((SELECT idformular FROM anwendungsberechtigungen WHERE idformular = old.id) IS NOT NULL)
                 THEN RAISE(ABORT, 'id violates foreign key anwendungsberechtigungen(idformular)')
    END;
END;
INSERT INTO "lbDMF_ForeignKeys" ("PKTable", "PKColumn", "FKTable", "FKColumn") VALUES ('formulare', 'id', 'anwendungsberechtigungen', 'idformular');

	

-- Build trigger manually. (Todo: add support for nullable and not nullable)

CREATE TRIGGER "fk_anwendungsberechtigungen_iduser_ins" BEFORE INSERT ON anwendungsberechtigungen FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.iduser IS NOT NULL) AND ((SELECT id FROM users WHERE id = new.iduser) IS NULL))
                 THEN RAISE(ABORT, 'iduser violates foreign key users(id)')
    END;
END;
CREATE TRIGGER "fk_anwendungsberechtigungen_iduser_upd" BEFORE UPDATE ON anwendungsberechtigungen FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.iduser IS NOT NULL) AND ((SELECT id FROM users WHERE id = new.iduser) IS NULL))
                 THEN RAISE(ABORT, 'iduser violates foreign key users(id)')
    END;
END;
CREATE TRIGGER "fk_anwendungsberechtigungen_iduser_del" BEFORE DELETE ON users FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((SELECT iduser FROM anwendungsberechtigungen WHERE iduser = old.id) IS NOT NULL)
                 THEN RAISE(ABORT, 'id violates foreign key anwendungsberechtigungen(iduser)')
    END;
END;
INSERT INTO "lbDMF_ForeignKeys" ("PKTable", "PKColumn", "FKTable", "FKColumn") VALUES ('users', 'id', 'anwendungsberechtigungen', 'iduser');


-- Generate Sqlite application relations for table applevel_plugin_registry for lbDMFManager_Entities
-- Generate Sqlite application relations for table codegentarget for lbDMFManager_Entities
-- Generate Sqlite application relations for table column_types for lbDMFManager_Entities
-- Generate Sqlite application relations for table foreignkey_visibledata_mapping for lbDMFManager_Entities
-- Generate Sqlite application relations for table formular_actions for lbDMFManager_Entities	

-- Build trigger manually. (Todo: add support for nullable and not nullable)

CREATE TRIGGER "fk_formular_actions_action_ins" BEFORE INSERT ON formular_actions FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.action IS NOT NULL) AND ((SELECT id FROM actions WHERE id = new.action) IS NULL))
                 THEN RAISE(ABORT, 'action violates foreign key actions(id)')
    END;
END;
CREATE TRIGGER "fk_formular_actions_action_upd" BEFORE UPDATE ON formular_actions FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.action IS NOT NULL) AND ((SELECT id FROM actions WHERE id = new.action) IS NULL))
                 THEN RAISE(ABORT, 'action violates foreign key actions(id)')
    END;
END;
CREATE TRIGGER "fk_formular_actions_action_del" BEFORE DELETE ON actions FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((SELECT action FROM formular_actions WHERE action = old.id) IS NOT NULL)
                 THEN RAISE(ABORT, 'id violates foreign key formular_actions(action)')
    END;
END;
INSERT INTO "lbDMF_ForeignKeys" ("PKTable", "PKColumn", "FKTable", "FKColumn") VALUES ('actions', 'id', 'formular_actions', 'action');

	

-- Build trigger manually. (Todo: add support for nullable and not nullable)

CREATE TRIGGER "fk_formular_actions_formular_ins" BEFORE INSERT ON formular_actions FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.formular IS NOT NULL) AND ((SELECT id FROM formulare WHERE id = new.formular) IS NULL))
                 THEN RAISE(ABORT, 'formular violates foreign key formulare(id)')
    END;
END;
CREATE TRIGGER "fk_formular_actions_formular_upd" BEFORE UPDATE ON formular_actions FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.formular IS NOT NULL) AND ((SELECT id FROM formulare WHERE id = new.formular) IS NULL))
                 THEN RAISE(ABORT, 'formular violates foreign key formulare(id)')
    END;
END;
CREATE TRIGGER "fk_formular_actions_formular_del" BEFORE DELETE ON formulare FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((SELECT formular FROM formular_actions WHERE formular = old.id) IS NOT NULL)
                 THEN RAISE(ABORT, 'id violates foreign key formular_actions(formular)')
    END;
END;
INSERT INTO "lbDMF_ForeignKeys" ("PKTable", "PKColumn", "FKTable", "FKColumn") VALUES ('formulare', 'id', 'formular_actions', 'formular');


-- Generate Sqlite application relations for table formular_parameters for lbDMFManager_Entities	

-- Build trigger manually. (Todo: add support for nullable and not nullable)

CREATE TRIGGER "fk_formular_parameters_formularid_ins" BEFORE INSERT ON formular_parameters FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.formularid IS NOT NULL) AND ((SELECT id FROM formulare WHERE id = new.formularid) IS NULL))
                 THEN RAISE(ABORT, 'formularid violates foreign key formulare(id)')
    END;
END;
CREATE TRIGGER "fk_formular_parameters_formularid_upd" BEFORE UPDATE ON formular_parameters FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.formularid IS NOT NULL) AND ((SELECT id FROM formulare WHERE id = new.formularid) IS NULL))
                 THEN RAISE(ABORT, 'formularid violates foreign key formulare(id)')
    END;
END;
CREATE TRIGGER "fk_formular_parameters_formularid_del" BEFORE DELETE ON formulare FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((SELECT formularid FROM formular_parameters WHERE formularid = old.id) IS NOT NULL)
                 THEN RAISE(ABORT, 'id violates foreign key formular_parameters(formularid)')
    END;
END;
INSERT INTO "lbDMF_ForeignKeys" ("PKTable", "PKColumn", "FKTable", "FKColumn") VALUES ('formulare', 'id', 'formular_parameters', 'formularid');


-- Generate Sqlite application relations for table formulare for lbDMFManager_Entities	

-- Build trigger manually. (Todo: add support for nullable and not nullable)

CREATE TRIGGER "fk_formulare_anwendungid_ins" BEFORE INSERT ON formulare FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.anwendungid IS NOT NULL) AND ((SELECT id FROM anwendungen WHERE id = new.anwendungid) IS NULL))
                 THEN RAISE(ABORT, 'anwendungid violates foreign key anwendungen(id)')
    END;
END;
CREATE TRIGGER "fk_formulare_anwendungid_upd" BEFORE UPDATE ON formulare FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.anwendungid IS NOT NULL) AND ((SELECT id FROM anwendungen WHERE id = new.anwendungid) IS NULL))
                 THEN RAISE(ABORT, 'anwendungid violates foreign key anwendungen(id)')
    END;
END;
CREATE TRIGGER "fk_formulare_anwendungid_del" BEFORE DELETE ON anwendungen FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((SELECT anwendungid FROM formulare WHERE anwendungid = old.id) IS NOT NULL)
                 THEN RAISE(ABORT, 'id violates foreign key formulare(anwendungid)')
    END;
END;
INSERT INTO "lbDMF_ForeignKeys" ("PKTable", "PKColumn", "FKTable", "FKColumn") VALUES ('anwendungen', 'id', 'formulare', 'anwendungid');

	

-- Build trigger manually. (Todo: add support for nullable and not nullable)

CREATE TRIGGER "fk_formulare_typ_ins" BEFORE INSERT ON formulare FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.typ IS NOT NULL) AND ((SELECT id FROM formulartypen WHERE id = new.typ) IS NULL))
                 THEN RAISE(ABORT, 'typ violates foreign key formulartypen(id)')
    END;
END;
CREATE TRIGGER "fk_formulare_typ_upd" BEFORE UPDATE ON formulare FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.typ IS NOT NULL) AND ((SELECT id FROM formulartypen WHERE id = new.typ) IS NULL))
                 THEN RAISE(ABORT, 'typ violates foreign key formulartypen(id)')
    END;
END;
CREATE TRIGGER "fk_formulare_typ_del" BEFORE DELETE ON formulartypen FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((SELECT typ FROM formulare WHERE typ = old.id) IS NOT NULL)
                 THEN RAISE(ABORT, 'id violates foreign key formulare(typ)')
    END;
END;
INSERT INTO "lbDMF_ForeignKeys" ("PKTable", "PKColumn", "FKTable", "FKColumn") VALUES ('formulartypen', 'id', 'formulare', 'typ');


-- Generate Sqlite application relations for table formulartypen for lbDMFManager_Entities
-- Generate Sqlite application relations for table regressiontest for lbDMFManager_Entities
-- Generate Sqlite application relations for table report_element_types for lbDMFManager_Entities
-- Generate Sqlite application relations for table report_elements for lbDMFManager_Entities	

-- Build trigger manually. (Todo: add support for nullable and not nullable)

CREATE TRIGGER "fk_report_elements_typ_ins" BEFORE INSERT ON report_elements FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.typ IS NOT NULL) AND ((SELECT id FROM report_element_types WHERE id = new.typ) IS NULL))
                 THEN RAISE(ABORT, 'typ violates foreign key report_element_types(id)')
    END;
END;
CREATE TRIGGER "fk_report_elements_typ_upd" BEFORE UPDATE ON report_elements FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.typ IS NOT NULL) AND ((SELECT id FROM report_element_types WHERE id = new.typ) IS NULL))
                 THEN RAISE(ABORT, 'typ violates foreign key report_element_types(id)')
    END;
END;
CREATE TRIGGER "fk_report_elements_typ_del" BEFORE DELETE ON report_element_types FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((SELECT typ FROM report_elements WHERE typ = old.id) IS NOT NULL)
                 THEN RAISE(ABORT, 'id violates foreign key report_elements(typ)')
    END;
END;
INSERT INTO "lbDMF_ForeignKeys" ("PKTable", "PKColumn", "FKTable", "FKColumn") VALUES ('report_element_types', 'id', 'report_elements', 'typ');

	

-- Build trigger manually. (Todo: add support for nullable and not nullable)

CREATE TRIGGER "fk_report_elements_reportid_ins" BEFORE INSERT ON report_elements FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.reportid IS NOT NULL) AND ((SELECT id FROM reports WHERE id = new.reportid) IS NULL))
                 THEN RAISE(ABORT, 'reportid violates foreign key reports(id)')
    END;
END;
CREATE TRIGGER "fk_report_elements_reportid_upd" BEFORE UPDATE ON report_elements FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.reportid IS NOT NULL) AND ((SELECT id FROM reports WHERE id = new.reportid) IS NULL))
                 THEN RAISE(ABORT, 'reportid violates foreign key reports(id)')
    END;
END;
CREATE TRIGGER "fk_report_elements_reportid_del" BEFORE DELETE ON reports FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((SELECT reportid FROM report_elements WHERE reportid = old.id) IS NOT NULL)
                 THEN RAISE(ABORT, 'id violates foreign key report_elements(reportid)')
    END;
END;
INSERT INTO "lbDMF_ForeignKeys" ("PKTable", "PKColumn", "FKTable", "FKColumn") VALUES ('reports', 'id', 'report_elements', 'reportid');


-- Generate Sqlite application relations for table report_parameters for lbDMFManager_Entities	

-- Build trigger manually. (Todo: add support for nullable and not nullable)

CREATE TRIGGER "fk_report_parameters_reportid_ins" BEFORE INSERT ON report_parameters FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.reportid IS NOT NULL) AND ((SELECT id FROM reports WHERE id = new.reportid) IS NULL))
                 THEN RAISE(ABORT, 'reportid violates foreign key reports(id)')
    END;
END;
CREATE TRIGGER "fk_report_parameters_reportid_upd" BEFORE UPDATE ON report_parameters FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.reportid IS NOT NULL) AND ((SELECT id FROM reports WHERE id = new.reportid) IS NULL))
                 THEN RAISE(ABORT, 'reportid violates foreign key reports(id)')
    END;
END;
CREATE TRIGGER "fk_report_parameters_reportid_del" BEFORE DELETE ON reports FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((SELECT reportid FROM report_parameters WHERE reportid = old.id) IS NOT NULL)
                 THEN RAISE(ABORT, 'id violates foreign key report_parameters(reportid)')
    END;
END;
INSERT INTO "lbDMF_ForeignKeys" ("PKTable", "PKColumn", "FKTable", "FKColumn") VALUES ('reports', 'id', 'report_parameters', 'reportid');


-- Generate Sqlite application relations for table report_texts for lbDMFManager_Entities	

-- Build trigger manually. (Todo: add support for nullable and not nullable)

CREATE TRIGGER "fk_report_texts_elementid_ins" BEFORE INSERT ON report_texts FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.elementid IS NOT NULL) AND ((SELECT id FROM report_elements WHERE id = new.elementid) IS NULL))
                 THEN RAISE(ABORT, 'elementid violates foreign key report_elements(id)')
    END;
END;
CREATE TRIGGER "fk_report_texts_elementid_upd" BEFORE UPDATE ON report_texts FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.elementid IS NOT NULL) AND ((SELECT id FROM report_elements WHERE id = new.elementid) IS NULL))
                 THEN RAISE(ABORT, 'elementid violates foreign key report_elements(id)')
    END;
END;
CREATE TRIGGER "fk_report_texts_elementid_del" BEFORE DELETE ON report_elements FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((SELECT elementid FROM report_texts WHERE elementid = old.id) IS NOT NULL)
                 THEN RAISE(ABORT, 'id violates foreign key report_texts(elementid)')
    END;
END;
INSERT INTO "lbDMF_ForeignKeys" ("PKTable", "PKColumn", "FKTable", "FKColumn") VALUES ('report_elements', 'id', 'report_texts', 'elementid');


-- Generate Sqlite application relations for table reports for lbDMFManager_Entities
-- Generate Sqlite application relations for table translations for lbDMFManager_Entities
-- Generate Sqlite application relations for table user_anwendungen for lbDMFManager_Entities	

-- Build trigger manually. (Todo: add support for nullable and not nullable)

CREATE TRIGGER "fk_user_anwendungen_anwendungenid_ins" BEFORE INSERT ON user_anwendungen FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.anwendungenid IS NOT NULL) AND ((SELECT id FROM anwendungen WHERE id = new.anwendungenid) IS NULL))
                 THEN RAISE(ABORT, 'anwendungenid violates foreign key anwendungen(id)')
    END;
END;
CREATE TRIGGER "fk_user_anwendungen_anwendungenid_upd" BEFORE UPDATE ON user_anwendungen FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.anwendungenid IS NOT NULL) AND ((SELECT id FROM anwendungen WHERE id = new.anwendungenid) IS NULL))
                 THEN RAISE(ABORT, 'anwendungenid violates foreign key anwendungen(id)')
    END;
END;
CREATE TRIGGER "fk_user_anwendungen_anwendungenid_del" BEFORE DELETE ON anwendungen FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((SELECT anwendungenid FROM user_anwendungen WHERE anwendungenid = old.id) IS NOT NULL)
                 THEN RAISE(ABORT, 'id violates foreign key user_anwendungen(anwendungenid)')
    END;
END;
INSERT INTO "lbDMF_ForeignKeys" ("PKTable", "PKColumn", "FKTable", "FKColumn") VALUES ('anwendungen', 'id', 'user_anwendungen', 'anwendungenid');

	

-- Build trigger manually. (Todo: add support for nullable and not nullable)

CREATE TRIGGER "fk_user_anwendungen_userid_ins" BEFORE INSERT ON user_anwendungen FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.userid IS NOT NULL) AND ((SELECT id FROM users WHERE id = new.userid) IS NULL))
                 THEN RAISE(ABORT, 'userid violates foreign key users(id)')
    END;
END;
CREATE TRIGGER "fk_user_anwendungen_userid_upd" BEFORE UPDATE ON user_anwendungen FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.userid IS NOT NULL) AND ((SELECT id FROM users WHERE id = new.userid) IS NULL))
                 THEN RAISE(ABORT, 'userid violates foreign key users(id)')
    END;
END;
CREATE TRIGGER "fk_user_anwendungen_userid_del" BEFORE DELETE ON users FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((SELECT userid FROM user_anwendungen WHERE userid = old.id) IS NOT NULL)
                 THEN RAISE(ABORT, 'id violates foreign key user_anwendungen(userid)')
    END;
END;
INSERT INTO "lbDMF_ForeignKeys" ("PKTable", "PKColumn", "FKTable", "FKColumn") VALUES ('users', 'id', 'user_anwendungen', 'userid');


-- Generate Sqlite application relations for table users for lbDMFManager_Entities	

-- Build trigger manually. (Todo: add support for nullable and not nullable)

CREATE TRIGGER "fk_users_lastapp_ins" BEFORE INSERT ON users FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.lastapp IS NOT NULL) AND ((SELECT id FROM anwendungen WHERE id = new.lastapp) IS NULL))
                 THEN RAISE(ABORT, 'lastapp violates foreign key anwendungen(id)')
    END;
END;
CREATE TRIGGER "fk_users_lastapp_upd" BEFORE UPDATE ON users FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((new.lastapp IS NOT NULL) AND ((SELECT id FROM anwendungen WHERE id = new.lastapp) IS NULL))
                 THEN RAISE(ABORT, 'lastapp violates foreign key anwendungen(id)')
    END;
END;
CREATE TRIGGER "fk_users_lastapp_del" BEFORE DELETE ON anwendungen FOR EACH ROW
BEGIN
    SELECT CASE WHEN ((SELECT lastapp FROM users WHERE lastapp = old.id) IS NOT NULL)
                 THEN RAISE(ABORT, 'id violates foreign key users(lastapp)')
    END;
END;
INSERT INTO "lbDMF_ForeignKeys" ("PKTable", "PKColumn", "FKTable", "FKColumn") VALUES ('anwendungen', 'id', 'users', 'lastapp');

