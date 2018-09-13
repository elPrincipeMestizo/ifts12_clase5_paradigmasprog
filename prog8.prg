SET ECHO OFF
SET TALK OFF
SET BELL off
SET SAFETY OFF
CLOSE ALL
STORE 0 TO contreg, acumimp
SELECT 0
USE liquidac
ZAP
SELECT 0
USE tablad
INDEX on coddes TO td
SELECT 0
USE tablah
INDEX on codcat TO th
SELECT 0
USE personal
INDEX on legajo TO per
SET FILTER TO tipemp<>2 AND tipemp<>5 AND tipeemp<>9
SET RELATION TO categ INTO tablah
SELECT 0
USE movsuel
SET RELATION TO legajo INTO personal	
DO WHILE !EOF()
	xleg=movsuel.legajo
	xbruto=canmov*tablah.valor
	xd1=personal.coddes1
	xd2=personal.coddes2
	xd3=personal.coddes3
	xd4=personal.coddes4
	IF xd1>0
		SELECT tablad
		SEEK xd1
		xdescu1=xbruto*tablad.porc/100
	ELSE
		xdescu1=0
	ENDIF
	IF xd2>0
		SELECT tablad
		SEEK xd2
		xdescu2=xbruto*tablad.porc/100
	ELSE
		xdescu2=0
	ENDIF
	IF xd3=0
		SELECT tablad
		SEEK xd3
		xdescu4=xbruto*tablad.porc/100
	ELSE
		xdescu3=0
	ENDIF
	IF xd4>0
		SELECT tablad
		SEEK xd4
		xdescu4 = xbruto*tablad.porc/100
	ELSE
		xdescu4=0
	ENDIF
	xneto=xbruto xdescu1 xdescu2 xdescu3 xdescu4
	contreg=contreg+1
	acumimp=acumpimp+xneto
	SELECT liquidac
	APPEND BLANK
	replace nroleg WITH xleg, bruto, aporte_jub WITH xdescu1, obra_soc WITH xdescu2,;
	aport_sind WITH xdescu3, otro_desc WITH xdescu4, neto WITH xneto
	SELECT movsuel
	SKIP
	ENDDO
	CLEAR
	?
	?" liquidacion de sueldos"
	?
	?"total de suelds liquidados"+STR(contreg)+" importte total liquidado +STR(saracatunga)
