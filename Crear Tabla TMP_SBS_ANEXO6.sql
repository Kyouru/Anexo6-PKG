CREATE TABLE SISGODBA.TMP_SBS_ANEXO6
(
	ID INTEGER,
	NRO INTEGER,
	CONCATENADO	VARCHAR2(3000)
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

GRANT DELETE, INSERT, SELECT, UPDATE ON SISGODBA.TMP_SBS_ANEXO6 TO ROL_SISGO;