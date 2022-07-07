load data
   infile 	'c:\load\employe.txt'
   badfile 	'c:\load\employe.bad'
   discardfile 	'c:\load\employe.dsc'
INSERT 
into table EMPLOYE
fields terminated by ';' 
trailing nullcols ( NOEMPLOYE   "seq_employe.nextval",
		    NOM,
		    PRENOM,
		    DATENAISS,
		    DATEEMBAUCHE,
		    SALAIRE,
		    FONCTION )
