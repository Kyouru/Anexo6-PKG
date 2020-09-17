

## Exportar Anexo6 Concatenado
***Insert para Reporteador Excel***

*Modificar campo CODREPORTE*

INSERT INTO REPORTE (CODREPORTE, NOMREPORTE, SENTSELECT, NOMARCHIVO, ESTADO, USUCREA, FECCREA, PKGREPORTE) VALUES (200, 'REPORTE ANEXO6', 'SELECT CONCATENADO FROM TMP_SBS_ANEXO6 ORDER BY ID, NRO', 'RPTANEXO6', 1, 'SISGODBA', SYSDATE, 'PKG_REPORTE_SBS_ANEXO6.CONCATENADO_SBS_ANEXO6(TO_DATE(P_FEC_EXACTA, ''DD/MM/RR''))');

insert into columna_reporte (codreporte, seccolumna, nomcolumna, tipdato, ancho, titulo, usucrea, feccrea) VALUES (200, 1, 'CONCATENADO', 1, 300, 'CONCATENADO', 'SISGODBA', SYSDATE);

***Llamada al Pkg***

*Modificar Fecha Cierre del reporte*

    BEGIN
    	PKG_REPORTE_SBS_ANEXO6.CONCATENADO_SBS_ANEXO6(TO_DATE('29/02/2020', 'DD/MM/RR'));
    END;
