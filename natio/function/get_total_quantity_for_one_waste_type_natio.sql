CREATE OR REPLACE FUNCTION get_total_quantity_for_one_waste_type_natio(waste_type CHAR, start_date CHAR, end_date CHAR)
RETURN NUMBER
IS
    w_total_quantity NUMBER :=0;
BEGIN
    SELECT SUM(DD.QUANTITEENLEVEE) INTO w_total_quantity
    FROM DETAILDEMANDE DD
    INNER JOIN DEMANDE D on DD.NODEMANDE = D.NODEMANDE
    INNER JOIN TYPEDECHET T on T.NOTYPEDECHET = DD.NOTYPEDECHET AND T.NOMTYPEDECHET = INITCAP(waste_type)
    WHERE D.DATEENLEVEMENT BETWEEN to_date(start_date, 'DD/MM/YYYY') AND TO_DATE(end_date, 'DD/MM/YYYY');

    RETURN w_total_quantity;
end;

select rnatio.GET_TOTAL_QUANTITY_FOR_ONE_WASTE_TYPE_NATIO('papier', '11/08/2017', '11/08/2022') as quantite_relevee from dual;
