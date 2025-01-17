DROP DATABASE IF EXISTS CABOTAJE_SUPPLIER;
CREATE DATABASE CABOTAJE_SUPPLIER CHARSET = UTF8 COLLATE = UTF8_UNICODE_CI;
USE CABOTAJE_SUPPLIER;

CREATE TABLE IF NOT EXISTS ROLE(
COD_ROLE BIGINT PRIMARY KEY AUTO_INCREMENT			COMMENT 'PRIMARY KEY DE LA TABLA ROL',
NAM_ROLE VARCHAR(255) NOT NULL						COMMENT 'NOMBRE DEL ROL',
DES_ROLE TEXT NOT NULL								COMMENT 'DESCRIPCION DEL ROL'
)ENGINE=INNODB
CHARACTER SET UTF8
COLLATE=UTF8_UNICODE_CI;

CREATE TABLE IF NOT EXISTS PERMISSIONS(
COD_PERMISSION BIGINT PRIMARY KEY AUTO_INCREMENT	COMMENT 'PK',
COD_ROLE BIGINT										COMMENT 'FK DE LA TABLA ROL',
INS BOOLEAN NOT NULL								COMMENT 'INSERTAR 1:TRUE, 0:FALSE',
DEL BOOLEAN NOT NULL								COMMENT 'ELIMINAR',
UPD BOOLEAN NOT NULL								COMMENT 'ACTUALIZAR',
QUE BOOLEAN NOT NULL								COMMENT 'CONSULTAR',
CONSTRAINT FK_ROLE_PERMISSIONS FOREIGN KEY(COD_ROLE) REFERENCES ROLE(COD_ROLE) ON DELETE CASCADE
)ENGINE=INNODB
CHARACTER SET UTF8
COLLATE=UTF8_UNICODE_CI;

CREATE TABLE IF NOT EXISTS STATUS(
COD_STATUS BIGINT PRIMARY KEY AUTO_INCREMENT        COMMENT'COD DE LA TABLA ESTADO', 
NAM_STATUS TEXT NOT NULL                            COMMENT'ESTADO (EN PROCESO, ENTREGADO, CANCELADO, REVISADO, SIN REVISAR)',
DES_STATUS TEXT NOT NULL                            COMMENT'DESCRIPCION DEL ESTADO ACTUAL'
)ENGINE=INNODB
CHARACTER SET UTF8
COLLATE=UTF8_UNICODE_CI;

CREATE TABLE IF NOT EXISTS TYPE_TO_PAY(
COD_TYP_PAY BIGINT PRIMARY KEY AUTO_INCREMENT 		COMMENT 'PK DE LA TABLA FORMA DE PAGO',
NAM_TYPE_PAY VARCHAR(255) NOT NULL					COMMENT 'NOMBRE DEL TIPO DE PAGO (TRANSFERENCIA, EFECTIVO O TARJETA)'
)ENGINE=INNODB
CHARACTER SET UTF8
COLLATE=UTF8_UNICODE_CI;

CREATE TABLE IF NOT EXISTS USER(
COD_USER BIGINT PRIMARY KEY AUTO_INCREMENT			COMMENT 'PK DE LA TABLA USUARIO',
IDENTITY BIGINT NOT NULL UNIQUE                     COMMENT 'IDENTIDAD DEL USUARIO',
FIRST_NAME VARCHAR(255) NOT NULL					COMMENT 'PRIMER NOMBRE DEL USUARIO',
MIDDLE_NAME VARCHAR(255) NOT NULL					COMMENT 'SEGUNDO NOMBRE DEL USUARIO',
LAST_NAME VARCHAR(255) NOT NULL						COMMENT 'APELLIDO DEL USUARIO',
GENDER ENUM('M', 'F', 'O') NOT NULL					COMMENT 'GENERO M:MASCULINO, F:FEMENINO, O:OTRO',
NUM_PHONE_ONE INT NOT NULL							COMMENT 'NUMERO DE CELULAR UNO',
NUM_PHONE_TWO INT									COMMENT 'NUMERO DE CELULAR 2 (OPCIONAL)',
NUM_REFERENCE INT NOT NULL							COMMENT 'NUMERO DE REFERENCIA',
DAT_BIRTHDAY DATE NOT NULL							COMMENT 'FECHA DE NACIMIENTO',
NAM_CITY VARCHAR(255) NOT NULL						COMMENT 'NOMBRE DE CIUDAD ACTUAL DEL USUARIO',
ADDRESS TEXT NOT NULL								COMMENT 'LA DIRECCION DE DOMILICIO',
IMG_USER MEDIUMBLOB									COMMENT 'FOTO DE PERFIL DEL USUARIO'
)ENGINE=INNODB
CHARACTER SET UTF8
COLLATE=UTF8_UNICODE_CI;

CREATE TABLE IF NOT EXISTS LOGIN(
COD_LOGIN BIGINT PRIMARY KEY AUTO_INCREMENT			COMMENT 'PK DE LA TABLA LOGIN',
COD_USER BIGINT										COMMENT 'FK DE LA TABLA USUARIO',
COD_ROLE BIGINT										COMMENT 'FK DE LA TABLA ROL',
USER_EMAIL VARCHAR(255) NOT NULL UNIQUE				COMMENT 'CORREO ELECTRONICO DEL USUARIO',
USER_PASSWORD VARCHAR(255) NOT NULL					COMMENT 'CONTRASEÑA DEL USUARIO',
CONSTRAINT FK_USER_LOGIN FOREIGN KEY(COD_USER) REFERENCES USER(COD_USER) ON DELETE CASCADE,
CONSTRAINT FK_ROLE_LOGIN FOREIGN KEY(COD_ROLE) REFERENCES ROLE(COD_ROLE) ON DELETE CASCADE
)ENGINE=INNODB
CHARACTER SET UTF8
COLLATE=UTF8_UNICODE_CI;

CREATE TABLE IF NOT EXISTS CLIENT(
COD_CLIENT BIGINT PRIMARY KEY AUTO_INCREMENT 		COMMENT 'PK DE LA TABLA CLIENTE',
IDENTITY BIGINT NOT NULL UNIQUE                     COMMENT 'IDENTIDAD DEL USUARIO',
FIRST_NAME VARCHAR(255) NOT NULL					COMMENT 'PRIMER NOMBRE DEL CLIENTE',
LAST_NAME VARCHAR(255) NOT NULL						COMMENT 'APELLIDO DEL CLIENTE',
ADDRESS TEXT NOT NULL								COMMENT 'LA DIRECCION',
NUM_PHONE_ONE INT(11) NOT NULL						COMMENT 'NUMERO DE CELULAR UNO',
NUM_PHONE_TWO INT(11)								COMMENT 'NUMERO DE CELULAR 2 (OPCIONAL)',
RTN BIGINT NOT NULL UNIQUE							COMMENT 'RTN DEL CLIENTE'
)ENGINE=INNODB
CHARACTER SET UTF8
COLLATE=UTF8_UNICODE_CI;

CREATE TABLE IF NOT EXISTS SUPPLIER(
COD_SUPPLIER BIGINT PRIMARY KEY AUTO_INCREMENT      COMMENT'PRIMARY KEY DE LA TABLA PROVEEDORES',
NAM_SUPPLIER VARCHAR(255) NOT NULL                  COMMENT'NOMBRE DEL PROVEEDOR',
NAM_CONTACT VARCHAR(255) NOT NULL                   COMMENT'NOMBRE DEL CONTACTO DEL PROVEEDOR',
LAST_NAM_CONTACT VARCHAR(255) NOT NULL              COMMENT'APELLIDO DEL CONTACTO DEL PROVEEDOR',
ADDRESS TEXT NOT NULL                               COMMENT'DIRECCION DEL NEGOCIO PROVEEDOR',
NUM_PHONE_ONE INT NOT NULL                          COMMENT'PRIMER NUMERO DE TELEFONO DEL CONTACTO',
NUM_PHONE_TWO INT                   				COMMENT'SEGUNDO NUMERO DE TELEFONO DEL CONTACTO',
EMAIL VARCHAR(255) NOT NULL                         COMMENT'EMAIL DEL PROVEEDOR',
NAM_CITY VARCHAR(255) NOT NULL                      COMMENT'NOMBRE DE LA CIUDAD DEL PROVEEDOR',
ZIP_CODE INT NOT NULL                               COMMENT'CODIGO POSTAL'   
)ENGINE=INNODB
CHARACTER SET UTF8
COLLATE=UTF8_UNICODE_CI;

CREATE TABLE IF NOT EXISTS TYPE_PRODUCT(
COD_TYP_PRODUCT BIGINT PRIMARY KEY AUTO_INCREMENT   		COMMENT'PK DE LA TABLA TIPO DE PRODUCTO',
NAM_TYPE_PRODUCT VARCHAR(255) NOT NULL        				COMMENT'TIPO DE PRODUCTO (UNIDADES, LIBRAS, LITROS)'
)ENGINE=INNODB
CHARACTER SET UTF8
COLLATE=UTF8_UNICODE_CI;

CREATE TABLE IF NOT EXISTS INVENTORY(
COD_PRODUCT BIGINT PRIMARY KEY AUTO_INCREMENT				COMMENT 'PK DE LA TABLA INVENTARIO',
COD_SUPPLIER BIGINT											COMMENT 'FK A LA TABLA PROVEEDOR',
NAM_PRODUCT VARCHAR(255) NOT NULL							COMMENT 'NOMBRE DE LA TABLA',
DES_PRODUCT TEXT NOT NULL									COMMENT 'DESCRIPCION DEL PRODUCTO',
CANT_TOTAL DECIMAL(5,2) NOT NULL							COMMENT 'CANTIDAD TOTAL DEL PRODUCTO',
ISV DECIMAL(3,2) NOT NULL									COMMENT 'IMPUESTO DEL PRODUCTO',
NORMAL_UNIT_PRICE_1 DECIMAL(10,2) NOT NULL					COMMENT 'PRECIO UNITARIO DE VENTA 1',
NORMAL_UNIT_PRICE_2 DECIMAL(10,2)							COMMENT 'PRECIO UNITARIO DE VENTA 2',
NORMAL_UNIT_PRICE_3 DECIMAL(10,2)							COMMENT 'PRECIO UNITARIO DE VENTA 3',
WHOLESALE_CANT_1 DECIMAL(10,2)								COMMENT 'CANTIDAD AL POR MAYOR 1',
WHOLESALE_CANT_2 DECIMAL(10,2)								COMMENT 'CANTIDAD AL POR MAYOR 2',
WHOLESALE_PRICE_1 DECIMAL(10,2)								COMMENT 'PRECIO AL POR MAYOR 1',
WHOLESALE_PRICE_2 DECIMAL(10,2)								COMMENT 'PRECIO AL POR MAYOR 2',
PRICE_UNIT_PURCHASE DECIMAL(10,2) NOT NULL					COMMENT 'PRECIO UNITARIO DE COMPRA',
COD_TYP_PRODUCT BIGINT										COMMENT 'FK DE LA TABLA TIPO PRODUCTO',
CONSTRAINT FK_SUPPLIER_INVENTORY FOREIGN KEY(COD_SUPPLIER) REFERENCES SUPPLIER(COD_SUPPLIER) ON DELETE CASCADE,
CONSTRAINT FK_TYPEPRODUC_INVENTORY FOREIGN KEY(COD_TYP_PRODUCT) REFERENCES TYPE_PRODUCT(COD_TYP_PRODUCT) ON DELETE CASCADE
)ENGINE=INNODB
CHARACTER SET UTF8
COLLATE=UTF8_UNICODE_CI;

CREATE TABLE IF NOT EXISTS ORDERS(
COD_ORDER BIGINT PRIMARY KEY AUTO_INCREMENT         COMMENT'COD DE LA TABLA DEL PEDIDO',
COD_SUPPLIER BIGINT                                 COMMENT'FK DE LA TABLA DEL PROVEEDOR',
DAT_ORDER DATE NOT NULL                             COMMENT'FECHA DEL PEDIDO',
DAT_REQUIRED DATE NOT NULL                          COMMENT'FECHA REQUERIDA DEL PEDIDO',
COD_USER BIGINT                                     COMMENT'FK DE LA TABLA USUARIOS',
COD_STATUS BIGINT                                   COMMENT'FK DE LA TABLA ESTADO',
CONSTRAINT FK_SUPPLIER_ORDERS FOREIGN KEY (COD_SUPPLIER) REFERENCES SUPPLIER (COD_SUPPLIER) ON DELETE CASCADE,
CONSTRAINT FK_USER_ORDERS FOREIGN KEY (COD_USER) REFERENCES USER (COD_USER) ON DELETE CASCADE,
CONSTRAINT FK_STATUS_ORDERS FOREIGN KEY (COD_STATUS) REFERENCES STATUS (COD_STATUS) ON DELETE CASCADE
)ENGINE=INNODB
CHARACTER SET UTF8
COLLATE=UTF8_UNICODE_CI;

CREATE TABLE IF NOT EXISTS ORDER_DETAIL(
COD_DETAIL_ORDER BIGINT PRIMARY KEY AUTO_INCREMENT			COMMENT 'PK',
COD_ORDER BIGINT											COMMENT 'FK A LA ORDEN DEL PEDIDO',
COD_PRODUCT BIGINT											COMMENT 'FK DE LA TABLA INVENTARIO',
DES_ORDER TEXT NOT NULL										COMMENT 'DESCRIPCION DEL PEDIDO',
CANT_PRODUCTS INT NOT NULL									COMMENT 'CANTIDAD DE PRODUCTOS',
CONSTRAINT FK_INVENTORY_ORDER_DETAIL FOREIGN KEY(COD_PRODUCT) REFERENCES INVENTORY(COD_PRODUCT) ON DELETE CASCADE,
CONSTRAINT FK_ORDERS_ORDER_DETAILL FOREIGN KEY(COD_ORDER) REFERENCES ORDERS(COD_ORDER) ON DELETE CASCADE
)ENGINE=INNODB
CHARACTER SET UTF8
COLLATE=UTF8_UNICODE_CI;

CREATE TABLE IF NOT EXISTS INVENTORY_DETAIL(
COD_DETAIL BIGINT PRIMARY KEY AUTO_INCREMENT				COMMENT 'PK',
COD_PRODUCT BIGINT											COMMENT 'FK DE LA TABLA INVENTARIO',
DAT_PURCHASE DATE NOT NULL									COMMENT 'FECHA DE COMPRA',
DAT_EXP DATE NOT NULL										COMMENT 'FECHA DE CADUCIDAD',
CANT_PRODUCTS DECIMAL(5,2) NOT NULL							COMMENT 'CANTIDAD DE PRODUCTOS',
NUM_LOT BIGINT NOT NULL										COMMENT 'NUMERO DE LOTE',
COD_ORDER BIGINT											COMMENT 'FK A LA TABLA DE PEDIDOS',
COD_STATUS BIGINT											COMMENT 'FK A TABLA ESTADOS',
CONSTRAINT FK_INVENTORY_INV_DETAIL FOREIGN KEY(COD_PRODUCT) REFERENCES INVENTORY(COD_PRODUCT) ON DELETE CASCADE,
CONSTRAINT FK_ORDERS_INV_DETAIL FOREIGN KEY(COD_ORDER) REFERENCES ORDERS(COD_ORDER) ON DELETE CASCADE,
CONSTRAINT FK_STATUS_INV_DETAIL FOREIGN KEY(COD_STATUS) REFERENCES STATUS(COD_STATUS) ON DELETE CASCADE
)ENGINE=INNODB
CHARACTER SET UTF8
COLLATE=UTF8_UNICODE_CI;

CREATE TABLE IF NOT EXISTS INVENTORY_TRANSACTIONS(
COD_TRANSACTIONS BIGINT PRIMARY KEY AUTO_INCREMENT 			COMMENT 'PK DE LA TABLA TRANSACCIONES DE INVENTARIO',
COD_PRODUCT BIGINT 											COMMENT 'FK A LA TABLA DE PRODUCTOS',
TYP_TRANSACTION VARCHAR(255) NOT NULL						COMMENT 'TIPO DE TRANSACCION (ENTRADA, SALIDA)',
CANT INT NOT NULL											COMMENT 'CANTIDAD',
NUM_LOT BIGINT NOT NULL										COMMENT 'NUMERO DE LOTE',
DAT_TRANSACTION DATE NOT NULL								COMMENT 'FECHA DE LA TRANSACCION',
CONSTRAINT FK_INVENTORY_INVTRANSACTIONS FOREIGN KEY(COD_PRODUCT) REFERENCES INVENTORY(COD_PRODUCT) ON DELETE CASCADE
)ENGINE=INNODB
CHARACTER SET UTF8
COLLATE=UTF8_UNICODE_CI;

CREATE TABLE IF NOT EXISTS SALES_INVOICE(
COD_INVOICE BIGINT PRIMARY KEY AUTO_INCREMENT		COMMENT 'PK DE LA TABLA FACTURA',
COD_CLIENT BIGINT									COMMENT 'FK DE LA TABLA CLIENTE',
COD_USER BIGINT										COMMENT 'FK DE LA TABLA USUARIO',
SUBTOTAL DECIMAL(10,2) NOT NULL						COMMENT 'SUBTOTAL DE LA FACTURA',
TOT_DISCOUNT DECIMAL(10,2) NOT NULL					COMMENT 'DESCUENTO TOTAL',
TOT_ISV DECIMAL(10,2) NOT NULL						COMMENT 'ISV DE VENTA',
TOT_SALE DECIMAL(10,2) NOT NULL						COMMENT 'TOTAL DE LA VENTA',
TYP_TO_SALE ENUM('Crédito', 'Contado') NOT NULL		COMMENT 'TIPO DE VENTA',
COD_TYP_PAY BIGINT									COMMENT 'FK DE LA TABLA TIPO DE PAGO',
DAT_INVOICE DATE NOT NULL							COMMENT 'FECHA FACTURA',
CONSTRAINT FK_CLIENTE_SALES_INVOICE FOREIGN KEY(COD_CLIENT) REFERENCES CLIENT(COD_CLIENT) ON DELETE CASCADE,
CONSTRAINT FK_USER_SALES_INVOICE FOREIGN KEY(COD_USER) REFERENCES USER (COD_USER) ON DELETE CASCADE,
CONSTRAINT FK_TYPE_PAY_SALES_INVOICE FOREIGN KEY(COD_TYP_PAY) REFERENCES TYPE_TO_PAY(COD_TYP_PAY) ON DELETE CASCADE
)ENGINE=INNODB
CHARACTER SET UTF8
COLLATE=UTF8_UNICODE_CI;

CREATE TABLE IF NOT EXISTS SALE_DETAIL(
COD_DETAIL BIGINT PRIMARY KEY AUTO_INCREMENT				COMMENT 'PK DE LA TABLA DETALLE DE VENTA',
COD_INVOICE BIGINT											COMMENT 'FK A LA TABLA FACTURA VENTA',
COD_PRODUCT BIGINT											COMMENT 'FK DE LA TABLA INVENTARIO',
PRICE DECIMAL(10,2) NOT NULL								COMMENT 'PRECIO DEL PRODUCTO',
CANT_PRODUCTS DECIMAL(5,2) NOT NULL							COMMENT 'CANTIDAD DE PRODUCTOS',
DISCOUNT DECIMAL(10,2) NOT NULL								COMMENT 'DESCUENTO DEL PRODUCTO',
TOTAL DECIMAL(10,2) NOT NULL								COMMENT 'PRECIO TOTAL DE PRODUCTO',
CONSTRAINT FK_INVENTORY_SALEDETAIL FOREIGN KEY(COD_PRODUCT) REFERENCES INVENTORY(COD_PRODUCT) ON DELETE CASCADE,
CONSTRAINT FK_SALESINVOICE_SALEDETAIL FOREIGN KEY(COD_INVOICE) REFERENCES SALES_INVOICE(COD_INVOICE) ON DELETE CASCADE
)ENGINE=INNODB
CHARACTER SET UTF8
COLLATE=UTF8_UNICODE_CI;

CREATE TABLE IF NOT EXISTS ACCOUNTS_RECEIVABLE(
COD_ACC_RECEIVABLE BIGINT PRIMARY KEY AUTO_INCREMENT 	COMMENT 'PK DE LAS CUENTA POR COBRAR',
COD_INVOICE BIGINT 										COMMENT 'FK DE LA TABLA FACTURA VENTA',
DESCRIPTION TEXT NOT NULL								COMMENT 'DESCRIPCION',
TOT_BALANCE DECIMAL(10, 2) NOT NULL						COMMENT 'SALDO TOTAL DE LA CUENTA POR COBRAR',
DAT_LIMIT DATE NOT NULL									COMMENT 'PLAZO',
CONSTRAINT FK_INVSALES_ACCRECEIVABLE FOREIGN KEY (COD_INVOICE) REFERENCES SALES_INVOICE (COD_INVOICE) ON DELETE CASCADE
)ENGINE=INNODB
CHARACTER SET UTF8
COLLATE=UTF8_UNICODE_CI;

CREATE TABLE IF NOT EXISTS FEES_RECEIVABLE(
COD_FEES BIGINT PRIMARY KEY AUTO_INCREMENT 				COMMENT 'PK DE LAS CUOTAS POR COBRAR',
COD_ACC_RECEIVABLE BIGINT 								COMMENT 'FK DE LAS CUENTA POR COBRAR',
AMOUNT DECIMAL(10, 2) NOT NULL							COMMENT 'MONTO DE LA TRANSACCION',
DAT_PAY DATE NOT NULL 									COMMENT 'FECHA',
COD_TYP_PAY BIGINT 										COMMENT 'FK DE LA FORMA DE PAGO',
CONSTRAINT FK_ACCRECEIVABLE_FEES FOREIGN KEY (COD_ACC_RECEIVABLE) REFERENCES  ACCOUNTS_RECEIVABLE (COD_ACC_RECEIVABLE) ON DELETE CASCADE,
CONSTRAINT FK_TYPEPAY_FEES FOREIGN KEY (COD_TYP_PAY) REFERENCES  TYPE_TO_PAY (COD_TYP_PAY) ON DELETE CASCADE
)ENGINE=INNODB
CHARACTER SET UTF8
COLLATE=UTF8_UNICODE_CI;

CREATE TABLE IF NOT EXISTS PURCHASE_INVOICE(
COD_INVOICE BIGINT PRIMARY KEY AUTO_INCREMENT				COMMENT'PK DE LA TABLA FACTURA COMPRA ',
SUBTOTAL DECIMAL(10,2) NOT NULL								COMMENT 'SUBTOTAL DE LA FACTURA',
TOT_DISCOUNT DECIMAL(10,2) NOT NULL							COMMENT'TOTAL DESCUENTO DE LA TABLA FACTURA COMPRA',
TOT_ISV DECIMAL(10,2) NOT NULL								COMMENT'ISV TOTAL DE LA COMPRA',
TOT_PURCHASE DECIMAL(10,2) NOT NULL 						COMMENT'TOTAL DE LA COMPRA',
TYP_TO_PURCHASE ENUM('Crédito', 'Contado')                  COMMENT'TIPO DE COMPRA',
COD_TYP_PAY BIGINT 											COMMENT 'FK DE LA TABLA TIPO DE PAGO',
DAT_INVOICE DATE NOT NULL									COMMENT 'FECHA FACTURA',
COD_ORDER BIGINT 											COMMENT'FK DEL PEDIDO',
COD_USER BIGINT 											COMMENT 'FK DE LA TABLA USUARIO',
CONSTRAINT FK_TYPEPAY_PURCHASE FOREIGN KEY (COD_TYP_PAY) REFERENCES TYPE_TO_PAY (COD_TYP_PAY) ON DELETE CASCADE,
CONSTRAINT FK_ORDER_PURCHASE FOREIGN KEY (COD_ORDER) REFERENCES ORDERS (COD_ORDER) ON DELETE CASCADE,
CONSTRAINT FK_USER_PURCHASE FOREIGN KEY (COD_USER) REFERENCES USER (COD_USER) ON DELETE CASCADE
)
ENGINE=INNODB
CHARACTER SET UTF8
COLLATE=UTF8_UNICODE_CI;

CREATE TABLE IF NOT EXISTS PURCHASE_DETAIL(
COD_DETAIL BIGINT PRIMARY KEY AUTO_INCREMENT				COMMENT 'PK',
COD_INVOICE BIGINT											COMMENT 'FK DE LA TABLA FACTURA COMPRA',
COD_PRODUCT BIGINT											COMMENT 'FK DE LA TABLA INVENTARIO',
PRICE DECIMAL(10,2) NOT NULL								COMMENT 'PRECIO DEL PRODUCTO',
CANT_PRODUCTS INT NOT NULL									COMMENT 'CANTIDAD DE PRODUCTOS',
DISCOUNT DECIMAL(5,2) NOT NULL								COMMENT 'DESCUENTO DEL PRODUCTO',
TOTAL DECIMAL(10,2) NOT NULL								COMMENT 'PRECIO TOTAL DE PRODUCTO',
CONSTRAINT FK_INVENTORY_PURCH_DETAIL FOREIGN KEY(COD_PRODUCT) REFERENCES INVENTORY(COD_PRODUCT) ON DELETE CASCADE,
CONSTRAINT FK_SALESINVOICE_PURCH_DETAIL FOREIGN KEY(COD_INVOICE) REFERENCES PURCHASE_INVOICE(COD_INVOICE) ON DELETE CASCADE
)ENGINE=INNODB
CHARACTER SET UTF8
COLLATE=UTF8_UNICODE_CI;

CREATE TABLE IF NOT EXISTS ACCOUNTS_TO_PAY (
COD_ACC_PAY BIGINT PRIMARY KEY AUTO_INCREMENT				COMMENT'PK DE LA TABLA FACTURA COMPRA',
COD_INVOICE BIGINT											COMMENT'COD DE LA FACTURA DE COMPRA',
DESCRIPTION TEXT NOT NULL									COMMENT'COD DE LA DESCRIPCION',
TOT_BALANCE DECIMAL(10,2)NOT NULL							COMMENT'BALANCE TOTAL',
DATE_LIMIT DATE NOT NULL                                    COMMENT'FECHA LIMITE',
CONSTRAINT FK_IVCPURCHASE_ACCTOPAY FOREIGN KEY (COD_INVOICE) REFERENCES PURCHASE_INVOICE(COD_INVOICE) ON DELETE CASCADE
)
ENGINE=INNODB
CHARACTER SET UTF8
COLLATE=UTF8_UNICODE_CI;

CREATE TABLE IF NOT EXISTS FEES_TO_PAY (
COD_FEES BIGINT PRIMARY KEY AUTO_INCREMENT 					COMMENT'PK DE LA TABLA CUOTAS POR PAGAR',
COD_ACC_PAY BIGINT 											COMMENT'PK CUENTAS POR PAGAR',
AMOUNT DECIMAL(10,2) NOT NULL      							COMMENT'MONTO DE LAS CUOTAS POR PAGAR',
DATE_PAY DATE NOT NULL         								COMMENT'FECHA DE PAGO',
COD_TYP_PAY BIGINT 											COMMENT'FK DE LA TABLA TIPO DE PAGO',
CONSTRAINT FK_ACCTOPAY_FEESTOPAY FOREIGN KEY (COD_ACC_PAY) REFERENCES ACCOUNTS_TO_PAY(COD_ACC_PAY)ON DELETE CASCADE,
CONSTRAINT FK_TYPTOPAY_FEES_TO_PAY FOREIGN KEY (COD_TYP_PAY) REFERENCES TYPE_TO_PAY (COD_TYP_PAY) ON DELETE CASCADE
)
ENGINE=INNODB
CHARACTER SET UTF8
COLLATE=UTF8_UNICODE_CI;

CREATE TABLE IF NOT EXISTS DECREASE(
COD_DECREASE BIGINT PRIMARY KEY AUTO_INCREMENT				COMMENT 'PK',
COD_PRODUCT BIGINT											COMMENT 'FK DE LA TABLA INVENTARIO',
CONCEPT TEXT NOT NULL										COMMENT 'CONCEPTO DE LA MERMA',
CANT_PRODUCTS INT NOT NULL									COMMENT 'CANTIDAD DE PRODUCTOS',
NUM_LOT BIGINT NOT NULL										COMMENT 'NUMERO DE LOTE',
COD_USER BIGINT 											COMMENT 'FK DE LA TABLA USUARIO',
DAT_DECREASE DATE NOT NULL									COMMENT 'FECHA DE LA MERMA',
CONSTRAINT FK_INVENTORY_DECREASE FOREIGN KEY(COD_PRODUCT) REFERENCES INVENTORY(COD_PRODUCT) ON DELETE CASCADE,
CONSTRAINT FK_USER_DECREASE FOREIGN KEY(COD_USER) REFERENCES USER(COD_USER) ON DELETE CASCADE
)ENGINE=INNODB
CHARACTER SET UTF8
COLLATE=UTF8_UNICODE_CI;

CREATE TABLE IF NOT EXISTS RETURN_PRODUCT(
COD_RETURN BIGINT PRIMARY KEY AUTO_INCREMENT				COMMENT 'PK',
COD_PRODUCT BIGINT											COMMENT 'FK DE LA TABLA INVENTARIO',
CONCEPT TEXT NOT NULL										COMMENT 'CONCEPTO DE LA DEVOLUCION',
CANT_PRODUCT INT NOT NULL									COMMENT 'CANTIDAD DE PRODUCTOS',
NUM_LOT INT NOT NULL										COMMENT 'NUMERO DE LOTE',
COD_USER BIGINT 											COMMENT 'FK A LA TABLA USUARIO',
MOVEMENT VARCHAR(255) NOT NULL								COMMENT 'TIPO DE MOVIMIENTO',
DES_RETURN TEXT	NOT NULL									COMMENT 'DESCRIPCION DEL MOVIMIENTO',
DAT_RETURN DATE NOT NULL									COMMENT 'FECHA DEL MOVIMIENTO',
CONSTRAINT FK_INVENTORY_RETURNPRODUCT FOREIGN KEY(COD_PRODUCT) REFERENCES INVENTORY(COD_PRODUCT) ON DELETE CASCADE,
CONSTRAINT FK_USER_RETURNPRODUCT FOREIGN KEY(COD_USER) REFERENCES USER(COD_USER) ON DELETE CASCADE
)ENGINE=INNODB
CHARACTER SET UTF8
COLLATE=UTF8_UNICODE_CI;

CREATE TABLE IF NOT EXISTS PAY_FORM(
COD_PAY_FORM BIGINT PRIMARY KEY AUTO_INCREMENT			COMMENT 'PK DE LA PLANILLA DE PAGO',
COD_USER BIGINT											COMMENT 'FK DE LA TABLA USUARIO',
HOURS_WORKED INT NOT NULL								COMMENT 'HORAS TRABAJADAS DEL USUARIO',
AMO_GROSS DECIMAL(10,2) NOT NULL						COMMENT 'SUELDO BRUTO',
BONUS DECIMAL(10,2) NOT NULL							COMMENT 'BONIFICAIONES',
TOT_DEDUCTIONS DECIMAL(10,2) NOT NULL					COMMENT 'DEDUCCIONES',
NET_SALARY DECIMAL(10, 2) NOT NULL 						COMMENT 'SALARIO NETO',
DAT_PAYMENT DATE NOT NULL								COMMENT 'FECHA DE PAGO',
CONSTRAINT FK_USER_PAYFORM FOREIGN KEY (COD_USER) REFERENCES USER (COD_USER) ON DELETE CASCADE
)ENGINE=INNODB
CHARACTER SET UTF8
COLLATE=UTF8_UNICODE_CI;

CREATE TABLE IF NOT EXISTS NOTIFICATIONS(
COD_NOTIFICATION BIGINT PRIMARY KEY AUTO_INCREMENT		COMMENT 'PK',
COD_ROLE BIGINT											COMMENT 'FK DE LA TABLA ROL',
MESSAGE TEXT NOT NULL									COMMENT 'MENSAJE DE LA NOTIFICACION',
TYP_NOTIFICATION VARCHAR(255) NOT NULL					COMMENT 'TIPO DE NOTIFICACION (VENTAS, INVENTARIO, PEDIDOS)',
DAT_NOTIFICATION DATE NOT NULL							COMMENT 'FECHA DE LA NOTIFICACION',
CONSTRAINT FK_ROLE_NOTIFICATIONS FOREIGN KEY(COD_ROLE) REFERENCES ROLE(COD_ROLE) ON DELETE CASCADE
)ENGINE=INNODB
CHARACTER SET UTF8
COLLATE=UTF8_UNICODE_CI;

CREATE TABLE IF NOT EXISTS USER_NOTIFICATIONS(
COD_USER_NOTIFICATION BIGINT							COMMENT 'PK',
COD_USER BIGINT											COMMENT 'FK DE LA TABLA USER',
COD_NOTIFICATION BIGINT									COMMENT 'FK DE LA TABLA NOTIFICATIONS',
IS_VIEW ENUM('1', '0')	NOT NULL						COMMENT 'ESPECIFICA SI LA NOTIFACION FUE VISTA POR EL USUARIO  1:Vista, 0:No vista',
CONSTRAINT FK_USER_USNOTIFICATIONS FOREIGN KEY(COD_USER) REFERENCES USER(COD_USER) ON DELETE CASCADE,
CONSTRAINT FK_NOTIFI_USNOTIFICATIONS FOREIGN KEY(COD_NOTIFICATION) REFERENCES NOTIFICATIONS(COD_NOTIFICATION) ON DELETE CASCADE
)ENGINE=INNODB
CHARACTER SET UTF8
COLLATE=UTF8_UNICODE_CI;

CREATE TABLE IF NOT EXISTS SALES_RETURNS(
COD_RETURN BIGINT PRIMARY KEY AUTO_INCREMENT            COMMENT 'PK',
COD_PRODUCT BIGINT                                      COMMENT 'FK DE LA TABLA DE INVENTARIO',
DESCRIPTION TEXT NOT NULL                               COMMENT 'DESCRIPCION DE LA DEVOLUCION',
CANT INT NOT NULL                                       COMMENT 'CANTIDAD DE UNIDADES A DEVOLVER',
AMOUNT DECIMAL(10,2) NOT NULL                           COMMENT 'EL MONTO DEVUELTO O POR DEVOLVER',
COD_USER BIGINT                                         COMMENT 'FK DE LA TABLA DE USUARIOS',
DAT_RETURN DATE NOT NULL                                COMMENT 'FECHA DE LA DEVOLUCION',
CONSTRAINT FK_INVENTORY_RETURNS FOREIGN KEY(COD_PRODUCT) REFERENCES INVENTORY(COD_PRODUCT) ON DELETE CASCADE,
CONSTRAINT FK_USER_RETURN FOREIGN KEY(COD_USER) REFERENCES USER(COD_USER) ON DELETE CASCADE   
)ENGINE=INNODB
CHARACTER SET UTF8
COLLATE=UTF8_UNICODE_CI;

CREATE TABLE IF NOT EXISTS SALES_DISCOUNTS(
COD_DISCOUNT  BIGINT PRIMARY KEY AUTO_INCREMENT         COMMENT 'PK',
COD_INVOICE BIGINT                                      COMMENT 'FK DE LA TABLA DE INVENTARIO',
DESCRIPTION TEXT NOT NULL                               COMMENT 'DESCRIPCION DE LA REBAJA',
AMOUNT DECIMAL(10,2) NOT NULL                           COMMENT 'EL MONTO DE DESCUENTO APLICADO',
CONSTRAINT FK_SALES_INVOICE_DISCOUNTS FOREIGN KEY(COD_INVOICE) REFERENCES SALES_INVOICE(COD_INVOICE) ON DELETE CASCADE
)ENGINE=INNODB
CHARACTER SET UTF8
COLLATE=UTF8_UNICODE_CI;