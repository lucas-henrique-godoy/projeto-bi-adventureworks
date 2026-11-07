# 📊 Projeto de BI Ponta a Ponta: SQL Server + Power BI

## 🔗 Links Úteis
* 🚀 [Acesse o Dashboard Interativo Aqui](https://tinyurl.com/3rtmdzwr)

---

## 🛠️ O Projeto
Um dos maiores desafios de um Analista de Dados é garantir que a inteligência aplicada no banco de dados se transforme em uma experiência visual clara e estratégica para os tomadores de decisão. 

Para consolidar meus estudos práticos, desenvolvi o meu primeiro projeto integrado conectando o SQL Server e o Power BI, simulando um cenário real de e-commerce utilizando a base pública **AdventureWorksLT2019** da Microsoft.

Minha missão foi estruturar uma camada de dados performática no SQL Server e criar um dashboard focado em faturamento no Power BI.

---

## 🔄 Histórico de Evolução & Melhorias (Code Review)
Projetos de dados reais evoluem constantemente com o negócio. Após a publicação da primeira versão do painel, recebi feedbacks técnicos valiosos da comunidade de dados no LinkedIn sobre a regra de negócio do faturamento. 

Diante disso, implementei uma melhoria contínua no projeto:
* **Versão 1.0 (Inicial):** Faturamento calculado apenas sob a visão Bruta (`Quantidade * Preço`).
* **Versão 1.1 (Atualizada):** Modificação da View no SQL Server para incluir a coluna `LineTotal`. Isso permitiu trazer ao Power BI o **Faturamento Líquido** real (já com descontos aplicados) e, através de cálculos em DAX, consolidar também o **Total de Descontos** concedidos pela empresa.

---

## 🗄️ Fase 1: Engenharia e Modelagem de Dados (SQL Server)
Diretamente no banco de dados, desenvolvi uma consulta estruturada para cruzar dados de produtos, categorias e detalhes de pedidos. Para otimizar a conexão e garantir a governança dos dados, salvei a lógica criando e atualizando uma **View** permanente no servidor:

```sql
ALTER VIEW SalesLT.vw_FaturamentoPorProduto AS
SELECT
    p.Name AS Nome_Produto,
    pc.Name AS Nome_Categoria,
    SUM(sd.OrderQty * sd.UnitPrice) AS Faturamento_Bruto,
    SUM(sd.LineTotal) AS Faturamento_Liquido
FROM SalesLT.Product p
INNER JOIN SalesLT.SalesOrderDetail sd
     ON p.ProductID = sd.ProductID
INNER JOIN SalesLT.ProductCategory pc 
     ON p.ProductCategoryID = pc.ProductCategoryID
GROUP BY p.Name, pc.Name;
```

---

## 🎨 Fase 2: Visualização de Dados e Design Executivo (Power BI)
Conectei o Power BI à View criada no banco utilizando o modo Import para garantir máxima performance. No desenvolvimento do painel, apliquei conceitos práticos de UX (User Experience) e Storytelling:

1. **Hierarquia Visual e KPIs:** Desenvolvi uma barra de cabeçalho corporativa para contextualizar o relatório e posicionei três cartões de KPIs principais alinhados (Faturamento Bruto, Total de Desconto e Faturamento Líquido) no topo esquerdo para leitura imediata do fluxo financeiro.
2. **Cálculos em DAX:** Criei uma medida dinâmica para calcular a margem de desconto total concedida: `Total_Desconto = SUM(Faturamento_Bruto) - SUM(Faturamento_Liquido)`.
3. **Otimização de Gráficos (Data Cleaning):** Diante do grande volume de categorias no banco, apliquei um filtro de **Top 5 Categorias por Faturamento** no gráfico de rosca, eliminando a poluição visual e destacando o que realmente move o ponteiro do negócio.
4. **Análise de Portfólio:** Estruturei um gráfico de barras horizontais listando de forma limpa, decrescente e com nomes completos a receita gerada por cada produto.

Este ecossistema demonstra como a união de uma base sólida em SQL e uma formatação limpa e minimalista no Power BI pode transformar dados brutos em decisões de negócios eficientes.

---

## 👨‍💻 Sobre Mim
Sigo em preparação constante e focado em conquistar minha primeira oportunidade como Analista de Dados Júnior! 

📬 **Vamos nos conectar?** [Meu Perfil no LinkedIn](http://linkedin.com/in/lucas-henrique-godoy)
