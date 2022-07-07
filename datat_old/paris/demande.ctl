load data
   infile 	'c:\load\demande.txt'
   badfile 	'c:\load\demande.bad'
   discardfile 	'c:\load\demande.dsc'
INSERT 
into table DEMANDE
fields terminated by ';' 
trailing nullcols ( NODEMANDE  "seq_demande.nextval",
		    DATEDEMANDE,
		    DATEENLEVEMENT,
		    WEB_O_N,
		    SIRET,
		    NOTOURNEE )
