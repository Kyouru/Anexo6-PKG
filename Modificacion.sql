DECLARE
	ejecutar_pkg VARCHAR2(77);
	
	CURSOR buscar_pkg IS
    SELECT PKGREPORTE
    FROM REPORTE r
    WHERE r.codreporte = P_CODREPORTE;
BEGIN
	OPEN buscar_pkg;
	LOOP
	    FETCH buscar_pkg INTO ejecutar_pkg;
	    EXIT WHEN buscar_pkg%NOTFOUND;

	    IF ejecutar_pkg <> '' THEN
	    	DBMS_OUTPUT.PUT_LINE(ejecutar_pkg);
	    	EXECUTE IMMEDIATE ejecutar_pkg;
	    END IF;

	END LOOP;
END;