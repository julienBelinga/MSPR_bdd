create or replace FUNCTION get_normalize_username_fonction(idFonction Number, firstname CHAR, lastname CHAR)
RETURN CHAR
IS
    trim_lastname VARCHAR2(50);
    normalize_name VARCHAR2(50);
BEGIN
    trim_lastname := REGEXP_REPLACE(lastname, '\s');
    SELECT CONCAT(CONCAT(UPPER(SUBSTR(F.NOMFONCTION, 1,1)),'_'), CONCAT(UPPER(SUBSTR(firstname, 1,1)), (UPPER(SUBSTR(trim_lastname,1,3))))) as name
    INTO normalize_name
    FROM FONCTION F
    WHERE F.NOFONCTION = idFonction;

    RETURN normalize_name;
end;

select rnatio.GET_NORMALIZE_USERNAME_FONCTION(3, 'Hugo', 'De Almeida') from DUAL;
