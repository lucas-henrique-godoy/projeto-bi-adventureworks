# projeto-bi-adventureworks
# 📊 Projeto de BI Ponta a Ponta: SQL Server + Power BI

## 🔗 Links Úteis
* https://app.powerbi.com/groups/me/reports/57fbb68a-6399-4374-ad21-4a001e6bb559/4a9dd94c240da31c065b?ctid=e0a1f149-96f6-4039-98aa-6e2c7abf6495&pbi_source=shareVisual&visual=53f2ec5ebbaa3ce062d1&height=827.42&width=1180.65&bookmarkGuid=bfbaf1eb-f028-40ee-9d7e-46431a49b636&portalSessionId=bfe696e5-e07b-4eb1-843c-1e2017789d98&fromEntryPoint=sharevisual

## 🛠️ O Projeto
📊 Da Query ao Dashboard: Projeto de Business Intelligence Ponta a Ponta com SQL Server e Power BI
Um dos maiores desafios de um Analista de Dados é garantir que a inteligência aplicada no banco de dados se transforme em uma experiência visual clara e estratégica para os tomadores de decisão. Para consolidar meus estudos práticos, desenvolvi o meu primeiro projeto integrado conectando o SQL Server e o Power BI, simulando um cenário real de e-commerce utilizando a base pública AdventureWorksLT2019 da Microsoft.
Minha missão foi estruturar uma camada de dados performática no SQL Server e criar um dashboard focado em faturamento no Power BI.
🛠️ Fase 1: Engenharia e Modelagem de Dados (SQL Server)
Diretamente no banco de dados, desenvolvi uma consulta estruturada para cruzar dados de produtos, categorias e detalhes de pedidos. Para otimizar a conexão e garantir a governança dos dados, evitei o uso de subconsultas complexas ou queries diretas na ferramenta visual, salvando toda a lógica em uma View permanente no servidor:

🎨 Fase 2: Visualização de Dados e Design Executivo (Power BI)
Conectei o Power BI à View criada no banco utilizando o modo Import para garantir máxima performance. No desenvolvimento do painel, apliquei conceitos práticos de UX (User Experience) e Storytelling:
1️⃣ Hierarquia Visual: Desenvolvi uma barra de cabeçalho corporativa para contextualizar o relatório e posicionei o KPI principal (Faturamento Total) no topo esquerdo para leitura imediata.
2️⃣ Otimização de Gráficos (Data Cleaning): Diante do grande volume de categorias no banco, apliquei um filtro de Top 5 Categorias por Faturamento no gráfico de pizza, eliminando a poluição visual e destacando o que realmente move o ponteiro do negócio.
3️⃣ Análise de Portfólio: Estruturei um gráfico de barras horizontais listando de forma limpa e decrescente a receita gerada por cada produto.
Esse ecossistema demonstra como a união de uma base sólida em SQL e uma formatação limpa e minimalista no Power BI pode transformar dados brutos em decisões de negócios eficientes.
Sigo em preparação constante e focado em conquistar minha primeira oportunidade como Analista de Dados Júnior! Vamos nos conectar?
#SQL #PowerBI #SQLServer #BusinessIntelligence #Analytics #DataJunior #Portfolio #DataVisualization

## 🗄️ Código SQL
```sql
-- O GitHub vai colorir seu código automaticamente se você colar aqui dentro
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



