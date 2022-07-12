CREATE OR REPLACE FUNCTION get_normalize_username_fonction(idFonction Number, firstname CHAR, lastname CHAR)
RETURN CHAR
IS
    normalize_name VARCHAR2(50);
BEGIN
    SELECT CONCAT(CONCAT(UPPER(SUBSTR(F.NOMFONCTION, 1,1)),'_'), CONCAT(SUBSTR(firstname, 1,1), SUBSTR(lastname,1,3))) as name
    INTO normalize_name
    FROM FONCTION F
    WHERE F.NOFONCTION = idFonction;

    RETURN normalize_name;
end;

select rnatio.GET_NORMALIZE_USERNAME_FONCTION(3, 'Hugo', 'TARTINE') from DUAL;