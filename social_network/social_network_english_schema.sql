CREATE OR REPLACE DATABASE social_network;

USE social_network;
/**
    -- This has already been decided:
    * Don't abbreviate
    * Table names should be in singular and PascalCase
    * Column names should be in snake_case and use the appropriate prefix
    
    -- Im fairly confident about these ones:
    pk_* Primary Key
    fk_* Foreign Key
    uq_* Unique
    usp_* Stored Procedure
    fn_* Stored Function
    tg_* Trigger
    vw_* View
    ev_* Event

    -- Not so sure about these ones:
    sk_* Surrogate Key
    nk_* Natural Key

    -- And even less sure about the possible combinations:
    cuq_* Composite Unique (This one is really funny)
    pfk_* Primary and Foreign Key (Identifying relationship)
    nfk_* Natural and Foreign Key
    cpk_* Composite Primary Key
    cfk_* Composite Foreign Key
    cnk_* Composite Natural Key
    cpfk_* Composite Primary and Foreign Key
    cfpk_* Composite Foreign and Primary Key
    cnfk_* Composite Natural and Foreign Key
    cfnk_* Composite Foreign and Natural Key

    -- 5 letter prefix is crazy
    cpcfk_* Composite Primary and Composite Foreign Key
    cncfk_* Composite Natural and Composite Foreign Key


    Things I've yet to decide on a convention:
    * Constraint names
    * Junction Table names
    * Prefixes vs. Suffixes
    * Should fk columns have a prefix/suffix indicating the foreign table? (Personally I'd like that information in the name itself)
**/
CREATE TABLE User(
    sk
);