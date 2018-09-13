*programa 1
*

*
*
SET SAFETY OFF             && hace cuando crea el ordenamiento no pregunte si sobreescribe el archivo idx
CLOSE ALL
SELECT 0
USE nuevop
ZAP 
SELECT 0
USE planes
SELECT 0
USE asociados
DO WHILE !EOF()
	xasoc=nroaso
	xcateg = categ
	xedad = edad
	SELECT planes
	GO top
	DO WHILE .t.
		IF xedad >=edad_des AND xedad<=esdad_has
			xnp=codplan
			EXIT
		ELSE
			SKIP
		ENDIF
	ENDDO
	SELECT nuevop
	APPEND BLANK
	replace categ WITH xcateg, plan_act WITH xplan, plan_nue WITH xnp,;
	nro_asoc WITH xasoc
	SELECT asociados
	SKIP
ENDDO


SELECT nuevop
INDEX on categ TO cat
GO top
DO WHILE !EOF()
	xcat=categ
	STORE 0 TO contcat, contcamb
	DO WHILE xcat = categ
		contcat=contcat+1
		IF plan_act<>plan_nue
			contcamb = contcamb+1
		ENDIF
		SKIP
	ENDDO
	?"Categoria"+STR(xcat)+SPACE(10)+STR(contcamb)+SPACE(10)+STR(contcat)
	?
ENDDO
INDEX ON plan_nue TO p
GO top
STORE 0 TO p1,p2,p3,p4,p5,p6
DO WHILE !EOF()
	DO case
	CASE plan_nue=1
		p1=p1+1
	CASE plan_nue=2
		p2=p2+1
	CASE plan_nue=3
		p3=p3+1
	CASE plan_nue=4
		p4=p4+1
	CASE plan_nue=5
		p5=p5+1
	CASE plan_nue=6
		p6=p6+1
	ENDCASE
	SKIP
ENDDO
	
	
	
DO case
	CASE p1<p2 AND p1<p3 AND p1<p4 AND p1<p5 AND p1<p6
		xmenor='1'
	CASE p2<p1 AND p2<p3 AND p2<p4 AND p2<p5 AND p2<p6
		xmenor='2'
	CASE p3<p2 AND p3<p1 AND p3<p4 AND p3<p5 AND p3<p6
		xmenor='3'
	CASE p4<p2 AND p4<p3 AND p4<p1 AND p4<p6 AND p4<p6
		xmenor='4'
	CASE p5<p2 AND p5<p3 AND p5<p4 AND p5<p1 AND p5<p6
		xmenor='5'
	CASE p6<p2 AND p6<p3 AND p6<p4 AND p6<p5 AND p6<p1
		xmenor='6'
ENDCASE
?"El plan con menor cantidad de asociados es:"+xmenor
	
