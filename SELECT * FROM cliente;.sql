SELECT * FROM cliente;

SELECT
    pe.id_pedido,
    c.nombre AS cliente,
    c.direccion_linea1,
    r.nombre AS repartidor,
    dp.cantidad,
    pr.nombre AS producto,
    dp.precio_unitario_historico,
    pe.costo_envio,
    (dp.cantidad * dp.precio_unitario_historico) AS subtotal,
    (dp.cantidad * dp.precio_unitario_historico + pe.costo_envio) AS total_cobrado
FROM pedido pe
JOIN cliente c
    ON pe.dui_cliente = c.dui_cliente
JOIN repartidor r
    ON pe.id_repartidor = r.id_repartidor
JOIN detalle_pedido dp
    ON pe.id_pedido = dp.id_pedido
JOIN producto pr
    ON dp.id_producto = pr.id_producto;