DROP DATABASE IF EXISTS supermercado;
CREATE DATABASE IF NOT EXISTS supermercado;
USE supermercado;

CREATE TABLE sucursales (
	cod_sucursal INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	barrio VARCHAR(50),
	direccion VARCHAR(80) NOT NULL
);

CREATE TABLE ventas (
	num_ticket INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	cod_sucursal INT NOT NULL,
	fecha DATE NOT NULL,
	monto_total DECIMAL(15,2) NOT NULL,
	medio_de_pago VARCHAR(30),
	CONSTRAINT FK_cod_sucursal FOREIGN KEY (cod_sucursal) REFERENCES sucursales(cod_sucursal)
);
	
INSERT INTO sucursales (barrio, direccion)
VALUES ('Moron', 'Avenida Rivadavia 18880'),
		 ('Haedo', 'Marcos Sastre 145'),
		 ('Ituzaingo', 'Avenida Ratti 13458'),
		 ('Ituzaingo', 'Blas Parera 455'),
		 ('Moreno', 'Buen viaje 1003'),
		 ('Merlo', 'Junin 1503'),
		 ('San Antonio de Padua', 'Sarmiento 1233'),
		 ('Castelar', 'Avenida Santa Rosa 3214'),
		 ('Ciudadela', 'Presidente Perón 555'),
		 ('Liniers', 'Avenida Rivadavia 14302');
		 
INSERT INTO ventas (cod_sucursal, fecha, monto_total, medio_de_pago)
VALUES (1, '2019-09-01', 1550.50, 'debito'),
		 (1, '2019-09-02', 2034.00, 'credito'),
		 (1, '2019-09-03', 5129.67, 'efectivo'),
		 (1, '2019-09-04', 10351.20, 'debito'),
		 (1, '2019-10-05', 200.32, 'efectivo'),
		 (2, '2019-10-01', 3200.23, 'debito'),
		 (2, '2019-10-02', 2500.00, 'debito'),
		 (2, '2019-11-03', 6532.25, 'credito'),
		 (2, '2019-11-04', 1001.20, 'efectivo'),
		 (2, '2019-11-05', 4367.66, 'debito'),
		 (3, '2019-11-01', 1100.50, 'credito'),
		 (3, '2019-11-02', 3010.00, 'debito'),
		 (3, '2019-11-03', 125.25, 'efectivo'),
		 (3, '2019-09-04', 4500.00, 'credito'),
		 (3, '2019-11-05', 2000.50, 'debito'),
		 (4, '2019-11-01', 10320.22, 'credito'),
		 (4, '2019-11-02', 500.00, 'efectivo'),
		 (5, '2019-11-03', 2030.25, 'efectivo'),
		 (5, '2019-11-04', 199.99, 'efectivo'),
		 (6, '2019-11-05', 9999.99, 'credito'),
		 (6, '2019-11-06', 5010.10, 'credito'),
		 (7, '2019-11-07', 4030.00, 'debito'),
		 (8, '2019-11-08', 2000.13, 'debito'),
		 (9, '2019-11-09', 8004.65, 'credito'),
		 (10, '2019-11-10', 1316.66, 'debito');

-- Redacte una consulta que seleccione las sucursales de un barrio determinado.		 
SELECT cod_sucursal, direccion
FROM sucursales 
WHERE barrio = 'Ituzaingo';

-- Redacte una consulta que seleccione todas las ventas del mes de octubre.
SELECT ventas.num_ticket, ventas.cod_sucursal, ventas.monto_total, ventas.medio_de_pago
FROM ventas
WHERE MONTH(ventas.fecha) = 10;

-- Redacte una consulta que seleccione todas las ventas que sean mayores a la venta promedio, ordenadas de forma descendente.
SELECT V.monto_total, V.num_ticket, V.cod_sucursal
FROM ventas AS V
WHERE V.monto_total > (SELECT AVG(ventas.monto_total) FROM ventas)
ORDER BY V.monto_total DESC;

-- Redacte una consulta que muestre las ventas de las sucursales de un barrio determinado, correspondientes al mes de octubre.
SELECT V.num_ticket, V.monto_total, V.medio_de_pago
FROM ventas AS V
INNER JOIN sucursales AS S
ON S.cod_sucursal = V.cod_sucursal
WHERE S.barrio = 'Moron' AND MONTH(V.fecha) = 10;

-- Redacte una consulta que cuente cuantas sucursales tuvieron ingresos mayores a un monto determinado durante el mes de Septiembre.

SELECT COUNT(*)
FROM sucursales AS S
INNER JOIN ventas AS V
ON S.cod_sucursal = V.cod_sucursal
WHERE V.monto_total > 2000 AND MONTH(V.fecha) = 9;

-- Redacte una consulta que obtenga los ingresos de todas las sucursales durante la primera quincena de noviembre, y las ordene de menor a mayor.

SELECT V.monto_total, V.fecha
FROM ventas AS V
INNER JOIN sucursales AS S
ON V.cod_sucursal = S.cod_sucursal
WHERE V.fecha >= '2019-11-01' AND V.fecha <= '2019-11-15'
ORDER BY V.monto_total;



