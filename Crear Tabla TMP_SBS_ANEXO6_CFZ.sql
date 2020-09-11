
-->> Se Usa para Importar los datos de las cartas fianzas que envia la sra. Coty

CREATE TABLE SISGODBA.TMP_SBS_ANEXO6_CFZ
(
  NRO                    NUMBER,
  CODIGOCIP              VARCHAR2(7 BYTE),
  SOCIO                  VARCHAR2(300 BYTE),
  BENEFICIARIO           VARCHAR2(300 BYTE),
  GARANTIZA              VARCHAR2(500 BYTE),
  CLA_S                  VARCHAR2(50 BYTE),
  CLA_D                  VARCHAR2(50 BYTE),
  CLA_SBS                VARCHAR2(3 BYTE),
  CAL_S                  VARCHAR2(50 BYTE),
  CAL_D                  VARCHAR2(50 BYTE),
  CAL_SBS                VARCHAR2(3 BYTE),
  FCC                    NUMBER,
  IMPORTE                NUMBER(12,2),
  IMPORTE_SOLES          NUMBER(12,2),
  KEY_SBS                VARCHAR2(6 BYTE),
  PROP_PROV              NUMBER(4,2),
  PROVISION              NUMBER(12,2),
  PROVISION_SOLES        NUMBER(12,2),
  COD_CFZ                VARCHAR2(50 BYTE),
  MONEDA                 NUMBER,
  MONTO                  NUMBER(12,2),
  FECHA_INICIO           DATE,
  VENC_ORIGINAL          DATE,
  FECHA_VENC             DATE,
  FECHA_DEV              DATE
)

TABLESPACE SISGO_DATOS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING;

GRANT DELETE, INSERT, SELECT, UPDATE ON SISGODBA.TMP_SBS_ANEXO6_CFZ TO ROL_SISGO;