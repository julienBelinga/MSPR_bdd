CREATE OR REPLACE FUNCTION get_total_quantity_for_one_waste_type(waste_type CHAR, site_siret_number NUMBER, start_date CHAR, end_date CHAR)
RETURN NUMBER
IS
    w_total_quantity NUMBER :=0;
BEGIN
    SELECT SUM(DD.QUANTITEENLEVEE) INTO w_total_quantity
    FROM DETAILDEMANDE DD
    INNER JOIN DEMANDE D on DD.NODEMANDE = D.NODEMANDE
    INNER JOIN TYPEDECHET T on T.NOTYPEDECHET = DD.NOTYPEDECHET AND T.NOMTYPEDECHET = waste_type
    INNER JOIN ENTREPRISE E on D.SIRET = E.SIRET AND E.SIRET = site_siret_number
    WHERE D.DATEENLEVEMENT BETWEEN to_date(start_date, 'DD/MM/YYYY') AND TO_DATE(end_date, 'DD/MM/YYYY');

    RETURN w_total_quantity;
end;

    --For testing
select rnatio.GET_TOTAL_QUANTITY_FOR_ONE_TYPE_WASTE('Aérosols',38238166300014, '11/08/2017', '11/08/2022') as quantite_relevee from dual;