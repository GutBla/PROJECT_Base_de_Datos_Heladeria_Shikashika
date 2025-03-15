SELECT * FROM Clientes;


SELECT * FROM Pedidos;

SELECT * FROM Pagos;

SELECT * FROM DetallePedidos;

SELECT * FROM Vasos;

SELECT * FROM Helados;

SELECT * FROM Ingredientes;

 SELECT * FROM Saborizantes;

SELECT * FROM Leches;


SELECT * FROM Toppings;

SELECT * FROM Edulcorantes;

SELECT * FROM HeladosPersonalizados;

SELECT * FROM BolasHelado;

SELECT * FROM HeladosBolasHelado;

SELECT * FROM HeladosPredefinidos;

SELECT * FROM HeladosToppings;

-- Visualizar los helados predefinidos ---------------------------------
SELECT 
    hp.nombre_helado AS helado,
    hp.direccion_imagen,
    hp.descripcion,
    CASE
        WHEN MIN(ing.cantidad_disponible) > 0 THEN 'Disponible'
        ELSE 'No disponible'
    END AS disponibilidad
FROM HeladosPredefinidos hp
JOIN Helados h ON hp.id_helado = h.id_helado
JOIN HeladosBolasHelado hb ON h.id_helado = hb.id_helado
JOIN BolasHelado bh ON hb.id_bola_helado = bh.id_bola_helado
JOIN Leches l ON bh.id_leche = l.id_leche
JOIN Saborizantes s ON bh.id_saborizante = s.id_saborizante
JOIN Edulcorantes e ON bh.id_edulcorante = e.id_edulcorante
LEFT JOIN HeladosToppings ht ON h.id_helado = ht.id_helado
LEFT JOIN Toppings t ON ht.id_topping = t.id_topping
LEFT JOIN Ingredientes ing ON ing.id_ingrediente = t.id_ingrediente 
    OR ing.id_ingrediente = l.id_ingrediente 
    OR ing.id_ingrediente = s.id_ingrediente 
    OR ing.id_ingrediente = e.id_ingrediente
GROUP BY hp.nombre_helado, hp.direccion_imagen, hp.descripcion;

-- Total de ventas por dia (de Fecha a Fecha)-----------------------
SELECT DATE(p.fecha_hora_pedido) AS fecha, SUM(pa.total_pedido) AS total_ventas
FROM Pedidos p
JOIN Pagos pa ON p.id_pedido = pa.id_pedido
WHERE p.estado_pedido = 'ENTREGADO'
AND p.fecha_hora_pedido BETWEEN '2024-09-15' AND '2024-09-24'
GROUP BY DATE(p.fecha_hora_pedido);

-- Visualizar el total de venta con respecto a los vasos --------------------
SELECT Vasos.tamaño, COUNT(Vasos.tamaño) AS cantidad_vendidos, SUM(Helados.precio) AS total_ventas
FROM Helados
JOIN Vasos ON Helados.id_vaso = Vasos.id_vaso
JOIN DetallePedidos ON Helados.id_detalle_pedido = DetallePedidos.id_detalle_pedido
JOIN Pedidos ON DetallePedidos.id_pedido = Pedidos.id_pedido
GROUP BY Vasos.tamaño;
GROUP BY DATE(p.fecha_hora_pedido);

-- Visualizar los 3 helados mas vendidos ---------------------------------
SELECT nombre_helado, COUNT(Helados.id_helado) AS cantidad_vendidos
FROM Helados
JOIN HeladosPredefinidos ON Helados.id_helado = HeladosPredefinidos.id_helado
GROUP BY nombre_helado
ORDER BY cantidad_vendidos DESC
LIMIT 3;
-- ---------------------------------------------------------------
SELECT 
    hp.nombre_helado AS nombre,
    hp.direccion_imagen AS direccion_imagen,
    hp.descripcion AS descripcion,
    COUNT(h.id_helado) AS cantidad_vendidos
FROM Helados h
JOIN HeladosPredefinidos hp ON h.id_helado = hp.id_helado
JOIN DetallePedidos dp ON h.id_detalle_pedido = dp.id_detalle_pedido
JOIN Pedidos p ON dp.id_pedido = p.id_pedido
WHERE p.estado_pedido = 'ENTREGADO'
GROUP BY hp.nombre_helado, hp.direccion_imagen, hp.descripcion
ORDER BY cantidad_vendidos DESC
LIMIT 3;

-- Mostrar que pedidos se cancelaron --------------------------
SELECT id_pedido, fecha_hora_pedido, id_cliente 
FROM Pedidos 
WHERE estado_pedido = 'CANCELADO';
-- ---------------------------------------------------------------
SELECT 
    p.id_pedido AS id_pedido,
    p.fecha_hora_pedido AS fecha_hora_pedido,
    CONCAT(c.nombre, ' ', c.apellido_paterno, ' ', c.apellido_materno) AS nombre_cliente,
    p.estado_pedido AS estado_pedido
FROM Pedidos p
JOIN Clientes c ON p.id_cliente = c.carnet_identidad
WHERE p.estado_pedido = 'CANCELADO'
ORDER BY p.fecha_hora_pedido DESC;

-- Mostrar los saborizantes disponibles y no disponibles ----------
SELECT 
    s.nombre_saborizante AS nombre,
    ing.direccion_imagen,
    CASE
        WHEN ing.cantidad_disponible > 0 THEN 'Disponible'
        ELSE 'No disponible'
    END AS disponibilidad
FROM Saborizantes s
JOIN Ingredientes ing ON s.id_ingrediente = ing.id_ingrediente;

-- Mostrar los toppings disponibles y no disponibles-----------
SELECT 
    t.nombre_topping AS nombre,
    ing.direccion_imagen,
    CASE
        WHEN ing.cantidad_disponible > 0 THEN 'Disponible'
        ELSE 'No disponible'
    END AS disponibilidad
FROM Toppings t
JOIN Ingredientes ing ON t.id_ingrediente = ing.id_ingrediente;

-- Mostrar los edulcorantes disponibles y no disponibles-------------
SELECT 
    e.nombre_edulcorante AS nombre,
    ing.direccion_imagen,
    CASE
        WHEN ing.cantidad_disponible > 0 THEN 'Disponible'
        ELSE 'No disponible'
    END AS disponibilidad
FROM Edulcorantes e
JOIN Ingredientes ing ON e.id_ingrediente = ing.id_ingrediente;

-- Mostrar las leches disponibles y no disponibles---------------
SELECT 
    l.tipo_leche AS nombre,
    ing.direccion_imagen,
    CASE
        WHEN ing.cantidad_disponible > 0 THEN 'Disponible'
        ELSE 'No disponible'
    END AS disponibilidad
FROM Leches l
JOIN Ingredientes ing ON l.id_ingrediente = ing.id_ingrediente;
