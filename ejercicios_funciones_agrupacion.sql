#Ejercicio 1: Contar el total de pedidos registrados
SELECT COUNT(*) AS total_pedidos
   FROM pedido;

#Ejercicio 2: Contar cuántos pedidos ha hecho cada cliente
SELECT dui_cliente, COUNT(*) AS cantidad_pedidos
FROM pedido
GROUP BY dui_cliente
ORDER BY cantidad_pedidos DESC;

#Ejercicio 3: Contar cuántos productos distintos se han vendido (sin repetir)
SELECT COUNT(DISTINCT id_producto) AS productos_distintos_vendidos
FROM detalle_pedido;

Ejercicio 4: Contar cuántos repartidores hay por tipo de vehículo
SELECT tipo_vehiculo, COUNT(*) AS cantidad_repartidores
FROM repartidor
GROUP BY tipo_vehiculo;

#SUM() — Sumar valores

Ejercicio 1: Sumar el total de ingresos por costo de envío
SELECT SUM(costo_envio) AS total_ingresos_envio
FROM pedido;

#Ejercicio 2: Sumar la cantidad total vendida de cada producto
SELECT id_producto, SUM(cantidad) AS unidades_vendidas
FROM detalle_pedido
GROUP BY id_producto
ORDER BY unidades_vendidas DESC;

#Ejercicio 3: Calcular el monto total (cantidad × precio histórico) de cada pedido
SELECT id_pedido,
       SUM(cantidad * precio_unitario_historico) AS monto_total
FROM detalle_pedido
GROUP BY id_pedido
ORDER BY monto_total DESC;

#Ejercicio 4: Sumar el total facturado por método de pago
SELECT metodo_pago, SUM(costo_envio) AS total_por_metodo
FROM pedido
GROUP BY metodo_pago;

#AVG() — Calcular promedios

Ejercicio 1: Promedio del costo de envío de todos los pedidos
SELECT AVG(costo_envio) AS promedio_costo_envio
FROM pedido;

#Ejercicio 2: Promedio de productos distintos por pedido
SELECT id_pedido, COUNT(*) AS productos_en_pedido
FROM detalle_pedido
GROUP BY id_pedido;

-- Luego, el promedio general:
SELECT AVG(cantidad_productos) AS promedio_productos_por_pedido
FROM (
    SELECT id_pedido, COUNT(*) AS cantidad_productos
    FROM detalle_pedido
    GROUP BY id_pedido
) AS sub;

#Ejercicio 3: Precio promedio de los productos del catálogo
SELECT AVG(precio_actual) AS precio_promedio_catalogo
FROM producto;

#Ejercicio 4: Promedio de cantidad vendida por producto
SELECT id_producto, AVG(cantidad) AS promedio_cantidad_por_venta
FROM detalle_pedido
GROUP BY id_producto;

#MAX() y MIN() — Valores extremos

Ejercicio 1: Producto más caro y más barato del catálogo
SELECT MAX(precio_actual) AS precio_mas_alto,
       MIN(precio_actual) AS precio_mas_bajo
FROM producto;

#Ejercicio 2: Pedido con el costo de envío más alto y más bajo
SELECT MAX(costo_envio) AS envio_mas_caro,
       MIN(costo_envio) AS envio_mas_barato
FROM pedido;

#Ejercicio 3: Fecha del pedido más reciente y del más antiguo
SELECT MAX(fecha_hora) AS pedido_mas_reciente,
       MIN(fecha_hora) AS pedido_mas_antiguo
FROM pedido;

#Ejercicio 4: Cantidad máxima y mínima vendida en una sola línea de detalle, por producto
SELECT id_producto,
       MAX(cantidad) AS max_cantidad_vendida,
       MIN(cantidad) AS min_cantidad_vendida
FROM detalle_pedido
GROUP BY id_producto;

##funciones con HAVING

SELECT dui_cliente, COUNT(*) AS cantidad_pedidos
FROM pedido
GROUP BY dui_cliente
HAVING COUNT(*) > 1;

#Productos cuyo total vendido supera las 5 unidades
SELECT id_producto, SUM(cantidad) AS total_vendido
FROM detalle_pedido
GROUP BY id_producto
HAVING SUM(cantidad) > 5;