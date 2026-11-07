CREATE VIEW SalesLT.vw_FaturamentoPorProduto AS
SELECT
    p.Name AS Nome_Produto,
    pc.Name AS Nome_Categoria, 
    SUM(sd.OrderQty * sd.UnitPrice) AS Faturamento_Bruto        
FROM SalesLT.Product p
INNER JOIN SalesLT.SalesOrderDetail sd
             ON p.ProductID = sd.ProductID
INNER JOIN SalesLT.ProductCategory pc
            ON p.ProductCategoryID = pc.ProductCategoryID
GROUP BY p.Name, pc.Name;