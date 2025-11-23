-- Criar uma query utilizando as tabelas:  payments e customers sumarizando por  por pais(country) exibindo a quantidade de clientes(customerNumber),
-- Quantidade de pagamento(CheckNumber) e valor de pagamentos(amount)

select country as Country, count(*) as 'Customers Quantity', sum(amount) as 'Amount Quantity' from customers inner join payments 
group by Country order by sum(amount) desc;

-- Faça uma consulta utilizando as tabelas:  payments e customers. Realizar a soma dos pagamentos realizado por cada cliente clientes que consta na tabela payments,
-- exibindo os campos : Código do cliente, nome do cliente e limite do cliente.

select customers.customerNumber as 'Customer Number',customers.customerName as 'Customer name',customers.creditLimit as 'Credit limit',sum(payments.amount) as 'Amount Quantity' 
from customers inner join payments
on(customers.customerNumber = payments.customerNumber)
group by customers.customerNumber,customers.customerName order by sum(amount) desc;

-- Fazer uma consulta onde retorne os pedidos que foram gerados para os clientes do país França
-- select CustomerNumber, customerName, Country from  customers
-- select CustomerNumber, OrderNumber, status from orders
-- select ProductCode, ProductName from products

select customers.customerNumber, customers.customerName, customers.country, orders.orderNumber, orders.status, products.productCode, products.productName
from customers inner join orders on (customers.customerNumber = orders.customerNumber) inner join orderdetails inner join products on(orderdetails.productCode = products.productCode)
where customers.country = 'France';
