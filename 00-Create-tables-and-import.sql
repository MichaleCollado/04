/* ============================================================
   🔥 ELIMINAR TABLAS SI EXISTEN (ORDEN CORRECTO POR FK)
   ============================================================ */
IF OBJECT_ID('ventas') IS NOT NULL DROP TABLE ventas;
IF OBJECT_ID('clientes') IS NOT NULL DROP TABLE clientes;
IF OBJECT_ID('productos') IS NOT NULL DROP TABLE productos;
IF OBJECT_ID('empleados') IS NOT NULL DROP TABLE empleados;
IF OBJECT_ID('departamentos') IS NOT NULL DROP TABLE departamentos;


/* ============================================================
   🟦 TABLA CLIENTES
   ============================================================ */
CREATE TABLE clientes (
    id_cliente       SMALLINT       NOT NULL PRIMARY KEY,
    nombre           NVARCHAR(100)  NULL,
    fecha_registro   DATE           NULL,
    pais             NVARCHAR(100)  NULL,
    ciudad           NVARCHAR(100)  NULL,
    edad             TINYINT        NULL,
    genero           NVARCHAR(100)  NULL
);


/* ============================================================
   🟩 TABLA PRODUCTOS
   ============================================================ */
CREATE TABLE productos (
    id_producto        TINYINT        NOT NULL PRIMARY KEY,
    nombre_producto    NVARCHAR(100)  NULL,
    categoria          NVARCHAR(100)  NULL,
    precio_lista       FLOAT          NULL,
    costo              FLOAT          NULL,
    fecha_lanzamiento  DATE           NULL
);


/* ============================================================
   🟨 TABLA DEPARTAMENTOS
   ============================================================ */
CREATE TABLE departamentos (
    id_departamento     TINYINT        NOT NULL PRIMARY KEY,
    nombre_departamento NVARCHAR(100)  NULL,
    ubicacion           NVARCHAR(100)  NULL
);


/* ============================================================
   🟧 TABLA EMPLEADOS (VENDEDORES)
   ============================================================ */
CREATE TABLE empleados (
    id_vendedor        TINYINT        NOT NULL PRIMARY KEY,
    nombre             NVARCHAR(100)  NULL,
    cargo              NVARCHAR(100)  NULL,
    id_jefe            NVARCHAR(2)    NULL,
    id_departamento    TINYINT        NULL,
    fecha_contratacion DATE           NULL,
    salario            FLOAT          NULL
);


/* ============================================================
   🟥 TABLA VENTAS
   ============================================================ */
CREATE TABLE ventas (
    id_venta        SMALLINT      NOT NULL PRIMARY KEY,
    id_cliente      SMALLINT      NULL,
    id_producto     TINYINT       NULL,
    id_vendedor     TINYINT       NULL,
    fecha_venta     DATE          NULL,
    cantidad        TINYINT       NULL,
    precio_unitario FLOAT         NULL,
    canal           NVARCHAR(100) NULL,
    region          NVARCHAR(100) NULL,
    estado_entrega  NVARCHAR(100) NULL
);



/* ============================================================
   📥 IMPORTAR ARCHIVOS CSV (BULK INSERT)
   ============================================================ */

BULK INSERT clientes
FROM '/workspaces/01-SQL-Portafolio/00-Dataset/clientes.csv'
WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n', FIRSTROW = 2);

BULK INSERT productos
FROM '/workspaces/01-SQL-Portafolio/00-Dataset/productos.csv'
WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n', FIRSTROW = 2);

BULK INSERT empleados
FROM '/workspaces/01-SQL-Portafolio/00-Dataset/empleados.csv'
WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n', FIRSTROW = 2);

BULK INSERT departamentos
FROM '/workspaces/01-SQL-Portafolio/00-Dataset/departamentos.csv'
WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n', FIRSTROW = 2);

BULK INSERT ventas
FROM '/workspaces/01-SQL-Portafolio/00-Dataset/ventas.csv'
WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n', FIRSTROW = 2);
