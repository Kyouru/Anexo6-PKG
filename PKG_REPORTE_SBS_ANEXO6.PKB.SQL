CREATE OR REPLACE PACKAGE BODY SISGODBA.PKG_REPORTE_SBS_ANEXO6 IS

PROCEDURE CONCATENADO_SBS_ANEXO6 (P_FECHA IN DATE) IS
strSQL VARCHAR2(20000);
BEGIN
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE TMP_SBS_ANEXO6';
    EXCEPTION
        WHEN OTHERS
        THEN
            NULL;
    END;

    strSQL := 'CREATE TABLE TMP_SBS_ANEXO6 AS 
    SELECT ID, NRO, CADENA_TXT FROM (
            SELECT 1 AS NRO, ''11060101116'' || TO_CHAR(TO_DATE(P_FECHA,''DD/MM/RR''), ''yyyymmdd'') || ''0120'' AS CADENA_TXT, 1 as id FROM TMP_SBS_ANEXO6_CFZ
        UNION
        SELECT NRO, CADENA_TXT, 2 as id from (
            SELECT
                NRO,
                LPAD(NRO, 6, '' '')  ||
                LPAD(REPLACE(REPLACE(COALESCE(APELLIDORAZONSOCIAL, '' ''),CHR(10),''''),CHR(13),''''), 150, '' '') ||
                LPAD(COALESCE(FECHANACIMIENTO, '' ''), 8, '' '') ||
                REPLACE(GENERO,''0'',''O'') ||
                REPLACE(ESTADOCIVIL,''0'',''O'') ||
                LPAD(COALESCE(SIGLAEMPRESA, '' ''), 30, '' '') ||
                LPAD(COALESCE(CODIGOSOCIO, '' ''), 20, '' '') ||
                LPAD(COALESCE(PARTIDAREGISTRAL, '' ''), 15, '' '') ||
                TIPODOCUMENTO ||
                LPAD(NRODOCUMENTO, 12, '' '') ||
                TIPOPERSONA ||
                LPAD(DOMICILIO, 150, '' '') ||
                LPAD(RELACLABORAL, 1, '' '') ||
                LPAD(CLASIFICACIONDEUDOR, 1, '' '') ||
                LPAD(CLASIFICACIONALINEADA, 1, '' '') ||
                LPAD(CODIGOAGENCIA, 3, '' '') ||
                LPAD(MONEDA, 2, ''0'') ||
                LPAD(NROCREDITO, 15, '' '') ||
                LPAD(COALESCE(TIPOCREDITO, '' ''), 2, '' '') ||
                LPAD(COALESCE(SUBCREDITO, '' ''), 2, '' '') ||
                LPAD(FECHADESEMBOLSO, 8, '' '') ||
                LPAD(ROUND(MONTODESEMBOLSADO * 100,0) , 18, '' '') ||
                LPAD(ROUND(TASAINTERESANUAL * 10000, 0), 6) ||
                LPAD(ROUND(SALDOCOLOCACION * 100,0), 18, '' '') ||
                LPAD(CUENTACONTABLE, 10, '' '') ||
                LPAD(ROUND(CAPITALVIGENTE * 100, 0), 18, '' '') ||
                LPAD(ROUND(CAPITALREESTRUCTURADO * 100, 0), 18, '' '') ||
                LPAD(ROUND(CAPITALREFINANCIADO * 100, 0), 18, '' '') ||
                LPAD(ROUND(CAPITALVENCIDO * 100, 0), 18, '' '') ||
                LPAD(ROUND(CAPITALJUDICIAL * 100, 0), 18, '' '') ||
                LPAD(ROUND(CAPITALCONTINGENTE * 100, 0), 18, '' '') ||
                LPAD(CUENTACONTINGENTE, 10, '' '') ||
                LPAD(DIASMORA, 8, '' '') ||
                LPAD(ROUND(SALDOGTIAPREFERIDA * 100, 0), 18, '' '') ||
                LPAD(ROUND(SALDOGTIAAUTOLIQUIDABLE * 100, 0), 18, '' '') ||
                LPAD(ROUND(PROVISIONREQUERIDA * 100, 0), 18, '' '') ||
                LPAD(ROUND(PROVISIONCONSTITUIDA * 100, 0), 18, '' '') ||
                LPAD(ROUND(SALDOSCASTIGADOS * 100, 0), 18, '' '') ||
                LPAD(CUENTACASTIGADO, 10, '' '') ||
                LPAD(ROUND(RENDIMIENTODEVENGADO * 100, 0), 18, '' '') ||
                LPAD(ROUND(INTERESSUSPENSO * 100, 0), 18, '' '') ||
                LPAD(ROUND(INGRESOSDIFERIDOS * 100, 0), 18, '' '') ||
                LPAD(TIPOPRODUCTO, 50, '' '') ||
                LPAD(NROCUOTASPROGRAMADAS, 6, '' '') ||
                LPAD(NROCUOTASPAGADAS, 6, '' '') ||
                LPAD(PERIODICIDADCUOTA, 6, '' '') ||
                LPAD(COALESCE(TO_CHAR(PERIODOGRACIA), '' ''), 6, '' '') ||
                LPAD(FECHAVCTOORIGINAL, 8 , '' '') ||
                LPAD(FECHAVCTOACTUAL, 8, '' '') CADENA_TXT
     FROM
    (

    SELECT
                NRO ,
                REPLACE(REPLACE(COALESCE(APELLIDORAZONSOCIAL, '' ''),CHR(10),''''),CHR(13),'''') AS APELLIDORAZONSOCIAL,
                COALESCE(FECHANACIMIENTO, '' '') AS FECHANACIMIENTO,
                REPLACE(GENERO,''0'',''O'') AS GENERO,
                REPLACE(ESTADOCIVIL,''0'',''O'') AS ESTADOCIVIL,
                COALESCE(SIGLAEMPRESA, '' '') AS SIGLAEMPRESA,
                COALESCE(CODIGOSOCIO, '' '') AS CODIGOSOCIO,
                COALESCE(PARTIDAREGISTRAL, '' '') AS PARTIDAREGISTRAL,
                TIPODOCUMENTO,
                NRODOCUMENTO AS NRODOCUMENTO,
                TIPOPERSONA,
                DOMICILIO AS DOMICILIO,
                RELACLABORAL AS RELACLABORAL,
                CLASIFICACIONDEUDOR AS CLASIFICACIONDEUDOR,
                CLASIFICACIONALINEADA AS CLASIFICACIONALINEADA,
                CODIGOAGENCIA AS CODIGOAGENCIA,
                MONEDA AS MONEDA,
                NROCREDITO AS NROCREDITO,
                COALESCE(TIPOCREDITO, '' '') AS TIPOCREDITO,
                COALESCE(SUBCREDITO, '' '') AS SUBCREDITO,
                FECHADESEMBOLSO AS FECHADESEMBOLSO,
                MONTODESEMBOLSADO AS MONTODESEMBOLSADO,
                TASAINTERESANUAL AS TASAINTERESANUAL,
                SALDOCOLOCACION AS SALDOCOLOCACION,
                CUENTACONTABLE AS CUENTACONTABLE,
                CAPITALVIGENTE AS CAPITALVIGENTE,
                CAPITALREESTRUCTURADO AS CAPITALREESTRUCTURADO,
                CAPITALREFINANCIADO AS CAPITALREFINANCIADO,
                CAPITALVENCIDO AS CAPITALVENCIDO,
                CAPITALJUDICIAL AS CAPITALJUDICIAL,
                CAPITALCONTINGENTE AS CAPITALCONTINGENTE,
                CUENTACONTINGENTE AS CUENTACONTINGENTE,
                DIASMORA AS DIASMORA,
                SALDOGTIAPREFERIDA AS SALDOGTIAPREFERIDA,
                SALDOGTIAAUTOLIQUIDABLE AS SALDOGTIAAUTOLIQUIDABLE,
                PROVISIONREQUERIDA AS PROVISIONREQUERIDA,
                PROVISIONCONSTITUIDA AS PROVISIONCONSTITUIDA,
                SALDOSCASTIGADOS AS SALDOSCASTIGADOS,
                CUENTACASTIGADO AS CUENTACASTIGADO,
                RENDIMIENTODEVENGADO AS RENDIMIENTODEVENGADO,
                INTERESSUSPENSO AS INTERESSUSPENSO,
                INGRESOSDIFERIDOS AS INGRESOSDIFERIDOS,
                TIPOPRODUCTO AS TIPOPRODUCTO,
                NROCUOTASPROGRAMADAS AS NROCUOTASPROGRAMADAS,
                NROCUOTASPAGADAS AS NROCUOTASPAGADAS,
                PERIODICIDADCUOTA AS PERIODICIDADCUOTA,
                COALESCE(TO_CHAR(PERIODOGRACIA), '' '') AS PERIODOGRACIA,
                FECHAVCTOORIGINAL AS FECHAVCTOORIGINAL,
                FECHAVCTOACTUAL AS FECHAVCTOACTUAL
     FROM
    (
    SELECT 
        NRO,
        TO_CHAR(NRO) AS NRO_C,
        APELLIDOPATERNO AS APELLIDORAZONSOCIAL,
        TO_CHAR(FECHANACIMIENTO, ''yyyymmdd'') AS FECHANACIMIENTO,
        SEXO AS GENERO,
        ESTADOCIVIL AS ESTADOCIVIL,
        SIGLAEMPRESA AS SIGLAEMPRESA,
        CODIGOSOCIO AS CODIGOSOCIO,
        PARTREGISTRAL AS PARTIDAREGISTRAL,
        TIPODOCIDENTIDAD AS TIPODOCUMENTO,
        DOCIDENTIDAD AS NRODOCUMENTO,
        TIPOPERSONA,
        DOMICILIO AS DOMICILIO,
        RELACLABORAL ,
        CALIFICACION AS CLASIFICACIONDEUDOR,
        CALIFALINEADA AS CLASIFICACIONALINEADA,
        CODIGOAGENCIA AS CODIGOAGENCIA,
        MONEDA AS MONEDA,
        TO_CHAR(PERNROSOLICITUD) AS NROCREDITO, 
        TIPCREDITO AS TIPOCREDITO,
        SUBTIPCREDITO AS SUBCREDITO,
        TO_CHAR(FECDESEMBOLSO, ''yyyymmdd'') AS FECHADESEMBOLSO,
        MONTODESEMBOLSO AS MONTODESEMBOLSADO,
        TASAINTANUAL AS TASAINTERESANUAL,
        SALDO AS SALDOCOLOCACION,
        TO_CHAR(CUENTACONTABLE) AS CUENTACONTABLE,
        CAPITALVIGENTE AS CAPITALVIGENTE,
        CAPITALREESTRUCTURADO AS CAPITALREESTRUCTURADO,
        CAPITALREFINANCIADO AS CAPITALREFINANCIADO,
        CAPITALVENCIDO AS CAPITALVENCIDO,
        CAPITALJUDICIAL AS CAPITALJUDICIAL,
        CAPITALCONTINGENTE AS CAPITALCONTINGENTE,
        TO_CHAR(CTACONCONTINGENTE) AS CUENTACONTINGENTE,
        DIASATRASO AS DIASMORA,
        GARANTIAPREF AS SALDOGTIAPREFERIDA,
        GARAUT AS SALDOGTIAAUTOLIQUIDABLE,
        PROVISION AS PROVISIONREQUERIDA,
        PROVCONST AS PROVISIONCONSTITUIDA,
        SALDOCASTIGADOS AS SALDOSCASTIGADOS,
        TO_CHAR(CTACONCASTIGADO) AS CUENTACASTIGADO,
        INTXCOBRAR AS RENDIMIENTODEVENGADO,
        INTSUSPENSO AS INTERESSUSPENSO,
        INGRESOSDIFERIDOS AS INGRESOSDIFERIDOS,
        NOMPRODUCTO AS TIPOPRODUCTO,
        NUMCUOTAS AS NROCUOTASPROGRAMADAS,
        NROCUOPAGADAS AS NROCUOTASPAGADAS,
        PERIODICIADAD AS PERIODICIDADCUOTA,
        PERIODOGRACIA AS PERIODOGRACIA,
        TO_CHAR(FECVENCIMIENTO, ''yyyymmdd'') AS FECHAVCTOORIGINAL,
        TO_CHAR(FECVENCIACTUAL, ''yyyymmdd'') AS FECHAVCTOACTUAL,
        TO_CHAR(CTACONREPROCOVID),
        CASE TIPCREDITO WHEN ''20'' THEN ''9'' ELSE COALESCE(TIPCREDITO, '' '') END AS TCA5,
        CASE TIPCREDITO -- TCA5_Desc
            WHEN ''06''
                THEN ''1 - Corporativo (06)''
            WHEN ''07''
                THEN ''2 - Grandes Empresas (07)''
            WHEN ''08''
                THEN ''3 - Medianas Empresas (08)''
            WHEN ''09''
                THEN ''4 - Pequenas Empresas (09)''
            WHEN ''10''
                THEN ''5 - Microempresas (10)''
            WHEN ''11''
                THEN ''6 - Consumo Revolvente (11)''
            WHEN ''12''
                THEN ''7 - Consumo No Revolvente (12)''
            WHEN ''13''
                THEN ''8 - Hipotecario para Vivienda (13)''
            WHEN ''20''
                THEN ''4 - Pequenas Empresas (09)''
        END AS TCA5_Desc,
        '''' AS ContarSocio,
        CONCAT(CONCAT(CODIGOSOCIO,''-''), CASE TIPCREDITO WHEN ''20'' THEN ''09'' ELSE TIPCREDITO END) AS KEY
    FROM SBS_ANEXO6
    WHERE FECHA=TO_DATE(P_FECHA,''DD/MM/RR'')
    UNION
    SELECT 
        A6C.NRO + (SELECT COUNT(*) FROM SBS_ANEXO6 WHERE FECHA=TO_DATE(P_FECHA,''DD/MM/RR'')) AS NRO,
        TO_CHAR(A6C.NRO + (SELECT COUNT(*) FROM SBS_ANEXO6 WHERE FECHA=TO_DATE(P_FECHA,''DD/MM/RR''))) AS NRO_C,
        REPLACE(REPLACE(COALESCE(per.NOMBRECOMPLETO, ''''),CHR(10),''''),CHR(13),'''') AS APELLIDORAZONSOCIAL,
        CASE
                    WHEN per.tipopersona = 1
                    THEN
                       (SELECT TO_CHAR(PN.FECHACUMPLEANOS, ''yyyymmdd'')
                          FROM PERSONANATURAL PN
                         WHERE PN.CODIGOPERSONA = PER.CODIGOPERSONA)
                    WHEN per.tipopersona = 2
                    THEN
                       (SELECT TO_CHAR(MIN(FECHAINICIOACTIVIDADES), ''yyyymmdd'')
                            FROM PERSONAJURIDICA A, PERSONA B
                            WHERE A.CODIGOPERSONA = B.CODIGOPERSONA
                            AND B.CODIGOPERSONA = PER.CODIGOPERSONA )
                    ELSE
                       NULL
                 END
            FECHA_NACIMIENTO,
            CASE
                    WHEN per.tipopersona = 1
                    THEN
                       (SELECT pn.sexo
                          FROM PERSONANATURAL PN
                         WHERE PN.CODIGOPERSONA = PER.CODIGOPERSONA)
                    WHEN per.tipopersona = 2
                    THEN
                       ''O''
                    ELSE
                       NULL
                 END
            SEXO,
        CASE
                    WHEN per.tipopersona = 1
                    THEN
                       (SELECT DECODE(PN.ESTADOCIVIL, 5, ''C'', 7, '' '', substr( PKG_SYST900.F_OBT_TBLDESCRI(5,PN.ESTADOCIVIL),1,1))
                          FROM PERSONANATURAL PN
                         WHERE PN.CODIGOPERSONA = PER.CODIGOPERSONA)
                    WHEN per.tipopersona = 2
                    THEN 
                       ''O''
                    ELSE
                       NULL
                 END
            EST_CIVIL,
        CASE --SIGLAEMPRESA
                         WHEN per.tipopersona = 2
                          THEN
                           RTRIM (LTRIM (PER.NOMBRECOMPLETO))
                            ELSE
                            NULL
                         END             
            SIGLAEMPRESA,
        COALESCE(CODIGOCIP, '' '') AS CODIGOSOCIO,
        CASE
                    WHEN per.tipopersona = 1
                    THEN
                       NULL
                    WHEN per.tipopersona = 2
                    THEN
                       (SELECT PJ.PARTIDAECONOMICA
                          FROM PERSONAJURIDICA PJ
                         WHERE PJ.CODIGOPERSONA = PER.CODIGOPERSONA)
                    ELSE
                       NULL
                 END
            PARTIDA_REGISTRAL,
        CASE 
            WHEN PER.TIPOPERSONA = 1 THEN
                  (SELECT  
            CASE WHEN PN.TIPODOCUMENTOID = 1 THEN
                 ''1''
               WHEN PN.TIPODOCUMENTOID = 4 THEN
                ''2''
               WHEN PN.TIPODOCUMENTOID = 7 THEN
                ''5''
            END TIPODOC 
             FROM PERSONANATURAL PN
             WHERE PN.CODIGOPERSONA=PER.CODIGOPERSONA )
         WHEN  PER.TIPOPERSONA=2 THEN -- PERSONA JURIDICA 
             ''6''
        END
            TIPODOCUMENTO,
        CASE WHEN PER.TIPOPERSONA = 1 THEN
                  (SELECT PN.NUMERODOCUMENTOID
                    FROM PERSONANATURAL PN
                    WHERE PN.CODIGOPERSONA = PER.CODIGOPERSONA)
                  WHEN  PER.TIPOPERSONA = 2 THEN
                   TO_CHAR(PER.NUMERORUC)
                  END NUMERODOCUMENTO,
        TO_CHAR(PER.TIPOPERSONA),
        REGEXP_REPLACE (
                    LTRIM (
                       LTRIM (
                          PKG_DIRECCION.F_OBT_DIRECCION_PERSONA (
                             per.CodigoPersona))),
                    ''[^-a-zA-Z0-9.|,| ]'')
                    AS DOMICILIO,
        PKG_SBS_REPORTE.F_OBT_SITUACION_LABORAL(PER.CODIGOPERSONA) RELACLABORAL,
        CASE A6C.CAL_SBS 
            WHEN ''NOR''
                THEN 0
            WHEN ''CPP''
                THEN 1
            WHEN ''DEF''
                THEN 2
            WHEN ''DUD''
                THEN 3
            WHEN ''PER''
                THEN 4
        END CLASIFICACIONDEUDOR,
        CASE A6C.CAL_SBS 
            WHEN ''NOR''
                THEN 0
            WHEN ''CPP''
                THEN 1
            WHEN ''DEF''
                THEN 2
            WHEN ''DUD''
                THEN 3
            WHEN ''PER''
                THEN 4
        END CLASIFICACIONALINEADA,
        ''1'' AS CODIGOAGENCIA,
        TO_CHAR(A6C.MONEDA) AS MONEDA,
        A6C.COD_CFZ AS NROCREDITO,
        CASE A6C.CLA_SBS
            WHEN ''CMC''
                THEN ''6''
            WHEN ''CMG''
                THEN ''7''
            WHEN ''CMM''
                THEN ''8''
            WHEN ''MEP''
                THEN ''9''
            WHEN ''MEM''
                THEN ''10''
            WHEN ''CNR''
                THEN ''11''
            WHEN ''CNN''
                THEN ''12''
            WHEN ''HIP''
                THEN ''13''
            WHEN ''Cred a COOPAC''
                THEN ''20''
        END TIPOCREDITO,
        ''15'' AS SUBCREDITO,
        TO_CHAR(FECHA_INICIO, ''yyyymmdd'') AS FECHADESEMBOLSO,
        IMPORTE_SOLES AS MONTODESEMBOLSADO,
        0 AS TASAINTERESANUAL,
        0 AS SALDOCOLOCACION,
        ''0'' AS CUENTACONTABLE,
        0 AS CAPITALVIGENTE,
        0 AS CAPITALREESTRUCTURADO,
        0 AS CAPITALREFINANCIADO,
        0 AS CAPITALVENCIDO,
        0 AS CAPITALJUDICIAL,
        IMPORTE_SOLES AS CAPITALCONTINGENTE,
        CASE MONEDA
            WHEN 1
             THEN ''7211020101''
            WHEN 2
                THEN ''7221020101''
        END CUENTACONTINGENTE,
        0 AS DIASMORA,
        0 AS SALDOGTIAPREFERIDA,
        0 AS SALDOGTIAAUTOLIQUIDABLE,
        PROVISION_SOLES AS PROVISIONREQUERIDA,
        PROVISION_SOLES AS PROVISIONCONSTITUIDA,
        0 AS SALDOSCASTIGADOS,
        ''0'' AS CUENTACASTIGADO,
        0 AS RENDIMIENTODEVENGADO,
        0 AS INTERESSUSPENSO,
        0 AS INGRESOSDIFERIDOS,
        ''AVL'' AS TIPOPRODUCTO,
        0 AS NROCUOTASPROGRAMADAS,
        0 AS NROCUOTASPAGADAS,
        0 AS PERIODICIDADCUOTA,
        0 AS PERIODOGRACIA,
        TO_CHAR(VENC_ORIGINAL, ''yyyymmdd'') AS FECHAVCTOORIGINAL,
        TO_CHAR(FECHA_VENC, ''yyyymmdd'') AS FECHAVCTOACTUAL,
        ''0'' CTACONREPROCOVID,
        CASE A6C.CLA_SBS
            WHEN ''CMC''
                THEN ''6''
            WHEN ''CMG''
                THEN ''7''
            WHEN ''CMM''
                THEN ''8''
            WHEN ''MEP''
                THEN ''9''
            WHEN ''MEM''
                THEN ''10''
            WHEN ''CNR''
                THEN ''11''
            WHEN ''CNN''
                THEN ''12''
            WHEN ''HIP''
                THEN ''13''
            WHEN ''Cred a COOPAC''
                THEN ''9''
        END TCA5,
        CASE A6C.CLA_SBS -- TCA5_Desc
            WHEN ''CMC''
                THEN ''1 - Corporativo (06)''
            WHEN ''CMG''
                THEN ''2 - Grandes Empresas (07)''
            WHEN ''CMM''
                THEN ''3 - Medianas Empresas (08)''
            WHEN ''MEP''
                THEN ''4 - Pequenas Empresas (09)''
            WHEN ''MEM''
                THEN ''5 - Microempresas (10)''
            WHEN ''CNR''
                THEN ''6 - Consumo Revolvente (11)''
            WHEN ''CNN''
                THEN ''7 - Consumo No Revolvente (12)''
            WHEN ''HIP''
                THEN ''8 - Hipotecario para Vivienda (13)''
            WHEN ''Cred a COOPAC''
                THEN ''4 - Pequenas Empresas (09)''
        END AS TCA5_Desc,
        '''' AS ContarSocio,
        CONCAT(CONCAT(CODIGOCIP,''-''), CASE A6C.CLA_SBS
            WHEN ''CMC''
                THEN ''06''
            WHEN ''CMG''
                THEN ''07''
            WHEN ''CMM''
                THEN ''08''
            WHEN ''MEP''
                THEN ''09''
            WHEN ''MEM''
                THEN ''10''
            WHEN ''CNR''
                THEN ''11''
            WHEN ''CNN''
                THEN ''12''
            WHEN ''HIP''
                THEN ''13''
            WHEN ''Cred a COOPAC''
                THEN ''09''
        END) AS KEY
        FROM TMP_SBS_ANEXO6_CFZ A6C LEFT JOIN
         PERSONA per
         ON per.CODIGOPERSONA = PKG_PERSONA.F_OBT_CODIGOPERSONA(A6C.CODIGOCIP)
         ) order by nro)

    )
        UNION
            SELECT      1 AS NRO,
                        RPAD(''999999'', 430) ||
                        LPAD(ROUND(SUM(MONTODESEMBOLSO) * 100, 0), 18) ||
                        LPAD('' '', 6) ||
                        LPAD(ROUND(SUM(SALDO), 18) * 100, 0) ||
                        LPAD('' '', 10) ||
                        LPAD(ROUND(SUM(CAPITALVIGENTE) * 100, 0), 18) ||
                        LPAD(ROUND(SUM(CAPITALREESTRUCTURADO) * 100, 0), 18) ||
                        LPAD(ROUND(SUM(CAPITALREFINANCIADO) * 100, 0), 18) ||
                        LPAD(ROUND(SUM(CAPITALVENCIDO) * 100, 0), 18) ||
                        LPAD(ROUND(SUM(CAPITALJUDICIAL) * 100, 0), 18) ||
                        LPAD(ROUND(SUM(CAPITALCONTINGENTE) * 100, 0), 18) ||
                        LPAD('' '', 10) ||
                        LPAD('' '', 8) ||
                        LPAD(ROUND(SUM(GARANTIAPREF) * 100, 0), 18) ||
                        LPAD(ROUND(SUM(GARAUT) * 100, 0), 18) ||
                        LPAD(ROUND(SUM(PROVISION) * 100, 0), 18) ||
                        LPAD(ROUND(SUM(PROVCONST) * 100, 0), 18) ||
                        LPAD(ROUND(SUM(SALDOCASTIGADOS) * 100, 0), 18) ||
                        LPAD('' '', 10) ||
                        LPAD(ROUND(SUM(INTXCOBRAR) * 100, 0), 18) ||
                        LPAD(ROUND(SUM(INTSUSPENSO) * 100, 0), 18) ||
                        LPAD('' '', 108) AS CADENA_TXT, 3 AS id
            FROM
                (
                SELECT IMPORTE_SOLES AS MONTODESEMBOLSO, 0 AS SALDO, 0 AS CAPITALVIGENTE, 0 AS CAPITALREESTRUCTURADO, 0 AS CAPITALREFINANCIADO, 0 AS CAPITALVENCIDO, 0 AS CAPITALJUDICIAL, IMPORTE_SOLES AS CAPITALCONTINGENTE, 0 AS GARANTIAPREF, 0 AS GARAUT, PROVISION_SOLES AS PROVISION, PROVISION_SOLES AS PROVCONST, 0 AS SALDOCASTIGADOS, 0 AS INTXCOBRAR, 0 AS INTSUSPENSO FROM TMP_SBS_ANEXO6_CFZ
                UNION ALL
                SELECT MONTODESEMBOLSO, SALDO, CAPITALVIGENTE, CAPITALREESTRUCTURADO, CAPITALREFINANCIADO, CAPITALVENCIDO, CAPITALJUDICIAL, CAPITALCONTINGENTE, GARANTIAPREF, GARAUT, PROVISION, PROVCONST, SALDOCASTIGADOS, INTXCOBRAR, INTSUSPENSO FROM SBS_ANEXO6
                WHERE FECHA=TO_DATE(P_FECHA,''DD/MM/RR'')
                )
        )
    ORDER BY id, nro;';
    strSQL := REPLACE(REPLACE(strSQL,CHR(10),''),CHR(13),'');
    DBMS_OUTPUT.PUT_LINE(strSQL);
    EXECUTE IMMEDIATE strSQL;
END;
END PKG_REPORTE_SBS_ANEXO6;
/