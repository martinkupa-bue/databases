CREATE OR REPLACE DATABASE social_network;

USE social_network;
/**
    Conventions:
    * Don't abbreviate
    * Table names should be in singular and PascalCase
    * Stored Procedure, Stored Function, Trigger, Event and Column names should be in snake_case and use the appropriate prefix/suffix
    * Views might skip the vw prefix if the intention is for the view to hide/shadow the original table
    * Indexes, Pk, Fk, Unique and Check constraints should be named according to the following guidelines:
        - All constaint names must start with the cstr prefix and have the following basic structure
            cstr__[TableName]__[column_names]__[constraint_type]
        Where constraint_type is one of the following: uq, pk, fk, chk, dft
        - Foreign key constaints should also specify the Table if not obvious, and the column being referenced if its not the foreign table's pk. If dealing with a composite contraint, use __ to separate columns and state them in the order they appear in the constraint definition
            cstr__[TableName]__[column_names]__fk__[ForeignTableName]__[foreign_table_columns]
            e.g cstr__User__country__fk (Skip both table and column, assume references Country.pk_*)
            e.g cstr__Assignment__state__Grading (Skip column name, assume references Grading.pk_*)
            e.g cstr__Takeoff__country__fk__Schedule__origin_country (country references Schedule.origin_country)
        
            -- Is 'cstr' a good abbreviation for constraint? Is there a better alternative?
            -- Should constraint names have Table -> Column -> Type? Would Table -> Type -> Column be better?
            -- How do I deal with constraints that include multiple tables/columns (Composite Keys/Indexes) or arent associated to a specific column (CHECKs)

    * Prefixes vs. Suffixes:
        Prefixes to help autocomplete on common use cases, such as pk/fk
        Suffixes to give additional information at a glance, such as uq/id
    
    * Prefixes:
        pk_* Primary Key
        fk_* Foreign Key
        usp_* Stored Procedure
        fn_* Stored Function
        tg_* Trigger
        vw_* View (At the programmer's discretion)
        ev_* Event

    * Suffixes:
        *_id for Surrogate/Synthetic Keys
        *_uq for Unique

    Things I've yet to decide on a convention:
        * Junction Table names
        * Would a suffix for DEFAULT fields be helpful? What about NULL?
**/

CREATE TABLE Country(
    pk_country_id INT PRIMARY KEY,
    name_uq UNIQUE NOT NULL VARCHAR(65535)
);

CREATE TABLE User(
    pk_user_id INT PRIMARY KEY 
        AUTO_INCREMENT,
    handle_uq VARCHAR(15) NOT NULL,
    display_name VARCHAR(50) NOT NULL,
    email_uq VARCHAR(255) NOT NULL,
    fk_country_id INT NOT NULL,
    password_hash BINARY(32) NOT NULL,
    profile_picture_path VARCHAR(65535) NOT NULL
        DEFAULT "public/images/defualt_profile.jpeg",
    phone_number VARCHAR(18) NULL,
    created_at DATETIME NOT NULL
        DEFAULT CURRENT_DATETIME,
    CONSTRAINT cstr_User_email_uq UNIQUE (email_uq),
    CONSTRAINT cstr_User_handle_uq UNIQUE (handle_uq),
    CONSTRAINT cstr_User_country_fk /* Ambigous when country is on multiple fk constraints */
        FOREIGN KEY (fk_country_id) REFERENCES Country(pk_country_id)
);
