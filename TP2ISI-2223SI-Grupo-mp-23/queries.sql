--2
--(a)
--Raciocínio: Para obter a informação do "António Silva" devemos
--ir a tabela PESSOA, pois é onde se encontra a informação de cada utente,
--para saber as viagens que realizou temos de ir à tabela CLIENTEVIAGEM,
--onde está associado a cada cliente as suas viagens, e para 
--obter a informação das viagens temos de ir à tabela VIAGEM, fazemos
--uma seleção (where) do cliente que queremos e por fim fazemos uma
--projeção (select) para apenas mostrar a informação que pretendemos.
select noident,nif,v.dtviagem,v.hinicio,v.hfim,v.valfim
from pessoa p 
	inner join clienteviagem c on id = idpessoa
	inner join viagem v on viagem = idSistema
where nproprio = 'Antonio' and apelido = 'Silva' and atrdisc = 'CL';


--(b)
--Raciocínio: Para obter a informação dos condutores aptos a conduzir 
--os veiculos do "Bruno Ferreira" mas que não estão aptos a conduzir os 
--veiculos do "Carlos Brito", basta obter os condutores que estão aptos 
--a conduzir os veiculos de "Bruno Ferreira" e retirar desses condutores 
--os que estão aptos a conduzir os veiculos de "Carlos Brito",fazemos 
--isso atravéz da operação diferença(except) entre a tabela com os condutores,
--aptos a conduzir os veiculos de "Bruno Ferreia" e os condutores aptos a
--conduzir os veiculos de "Carlos Brito".
(select (p3.nproprio || ' ' ||  p3.apelido) as nome_condutor, p3.noident  
from pessoa p1 
	inner join proprietario p2 on p1.id = p2.idpessoa
	inner join veiculo v on v.proprietario = p2.idpessoa
	inner join condhabilitado c on c.veiculo = v.id 
	inner join pessoa p3 on p3.id = c.condutor
where p1.nproprio = 'Bruno' and p1.apelido = 'Ferreira'
)except(
select (p6.nproprio || ' ' ||  p6.apelido) as nome_condutor, p6.noident  
from pessoa p4
	inner join proprietario p5 on p4.id = p5.idpessoa
	inner join veiculo v on v.proprietario = p5.idpessoa
	inner join condhabilitado c on c.veiculo = v.id 
	inner join pessoa p6 on p6.id = c.condutor
where p4.nproprio = 'Carlos' and p4.apelido = 'Brito');


--(c)
--Raciocínio: Para obter a lista de todos os clientes com mais 
--viagens em 2021, temos que recorrer a tabela "CLIENTEVIAGEM",
--e obter a informação de todas as viagens de todos os clientes 
--do ano 2021 e organizar a informação por cliente para obter o
--Nº de viagens por cliente, fazemos isso atravéz da função de agregação 
--SUM(count), em que contamos o nº de id's por cliente e fazemos uma seleção
--para obter o valor máximo de todos os obtidos através da função de agregação
--maximo(max). 
select max(N_viagens) as Mais_viagens 
from(
select id,(nproprio || ' ' || apelido) as nome_cliente,nif, count(c.idpessoa) as N_viagens
from clienteviagem c 
	inner join viagem v on viagem = idSistema
	inner join pessoa p on id = idpessoa 
where extract(year from v.dtviagem) = '2021'
group by p.id) as A;


--(d)
--Raciocínio: Para obter os condutores que nunca efetuaram viages,
--pode-mos fazer uma junção externa á esquerda com as tabelas CONDUTOR e
--PERIODOATIVO, assim sempre que um condutor não tiver nenhum periodo em 
--que esteve ativo, nunca terá efetuado uma viagem, logo podemos,
--fazer uma seleção(where) quando na tabela resultante aparecer o
--condutor( da tabela PERIODOATIVO) a NULL e fazer uma junção com a
--tabela PESSOA para obtermos a informação desse condutor. 
select id,(nproprio || ' ' || apelido) as nome_condutor,nif 
from pessoa p1
	inner join condutor C on id = idpessoa
	left outer join periodoativo p2 on idpessoa = condutor
where condutor isnull;


--(e)
--Raciocínio:Para obter os pares( nome de condutor, número de viagens) relativos ao
--ano de 2021. podemos obter ao fazer uma junção equivalente entre as tabelas
--VIAGEM (para fazer uma seleção das as viagens de um ano),PERIODOATIVO ( para saber
--quais dos condutores realizaram viagens nesse ano),CONDUTOR(para poder obter o id
--desses condutores) e PESSOA( visto que tenho os id's posso ir buscar a esta tabela,
--o resto da informação pedida no enunciado desta alínea. Depois aplico uma função de 
--agregação para contar(count) o nº de viagens para cada condutor. 
select (nproprio || ' ' || apelido ) as nome_condutor, count(v.condutor) as N_viagens
from viagem v 
	inner join periodoativo p on v.condutor = p.condutor and v.dtinicio = p.dtinicio  
	inner join condutor c on p.condutor = c.idpessoa  
	inner join pessoa p2 on p2.id = c.idpessoa 
where extract(year from v.dtviagem) = '2021'
group by p2.nproprio , p2.apelido;


--3
--(b) 
--Raciocínio: Para obter uma tabela com o Nº de viagens por ano dos veiculos de 
--cada propetário, podemos fazer uma junção entre as tabelas PROPRIETARIO( para saber
--de todos os individuos quem são os propritarios e os respetivos veiculos),PERIODOATIVO(
--para obter as viagens de cada veiculo),VEICULO(para saber a qual proprietário corresponde
--o veiculo) e PESSOA( para obtermos a informação do proprietario).
--Depois usamos a função de agregação count para sumarmos o as viagens que correspondem
--a cada veiculo de um proprietario.
select p1.nif,extract(year from p3.dtinicio) as ano,count(v1.id) as N_viagens
from pessoa p1
	inner join proprietario p2 on p2.idpessoa = p1.id
	inner join veiculo v1 on v1.proprietario = p2.idpessoa
	inner join periodoativo p3 on p3.veiculo = v1.id 
group by p1.nif,extract(year from p3.dtinicio);


--(c)
--Raciocínio:Para obtermos o custo final acumulado das viagens de cada condutor por ano,
--podemos fazer uma junção equivalente com as tabelas VIAGEM(para obtermos as viagems e podermos,
--destingui-las por ano),PERIODOATIVO(para sabermos a que condutor pertencem cada viagem),
--CONDUTOR(para podermos ir a tabela PESSOA obter a informação desse condutor) e PESSOA(para obter a
--informação de cada condutor), depois só preciamos agrupar por cada condutor e ano e obter o preço
--apartir da função de agregação suma(sum) que soma todos os valores finais de cada ano, por fim
--fazemos uma função de agregação para obtermos o maximo desse valor(max).
select max(custofinalacumulado)
from(
select (p2.nproprio || ' ' || p2.apelido ) as nome_condutor ,p2.noident ,p2.morada,
extract(year from p1.dtinicio) as ano ,sum(v.valfim) as CustoFinalAcumulado
from viagem v 
	inner join periodoativo p1 on p1.condutor = v.condutor and v.dtinicio = p1.dtinicio
	inner join condutor c on c.idpessoa = p1.condutor 
	inner join pessoa p2 on p2.id = c.idpessoa 
group by v.idsistema, p1.veiculo,p1.condutor,p1.dtinicio,c.idpessoa,p2.id) as A;  


--(d)
--Raciocínio:Para obter os pares (nome do condutor,total de viagens) que efetuaram no ano 2021
--um total de viagens inferior a 3, podemos recorrer a uma junção com as tabelas,
--PERIODOATIVO(para termos escolher as viagens de 2021),CONDUTOR(visto que temos todas as viagens de
--2021 podemos obter todos os condutores que realizaram essas viagens) e PESSOA(para obter a
--informação pedida pela alínea),para fazer a contagem de viagens usamos a função de agregação
--count para contar todas as viagens por condutor e fazemos uma seleção(having) dos cujo o 
--total é inferior a 3.
select (p.nproprio || ' ' || p.apelido) as nome_condutor , count(p2.dtinicio) as Total_viagens 
from pessoa p 
	inner join condutor c on c.idpessoa = p.id 
	inner join periodoativo p2 on p2.condutor = c.idpessoa
where extract(year from p2.dtinicio ) = '2021' 
group by p2.condutor,p.id,p.nproprio,p.apelido
having count(p2.dtinicio) < 3; 


--(e) 100%
--Raciocínio: Para criar uma vista com a informação para cada condutor em cada ano, total de
--viagens e a soma dos preços finais dessas viagens, podemos recorrer a funções de junção
--com as tabelas CONDUTOR(para obtermos todos os condutores),VIAGEM(para obtermos todas as viagens dos
--respetivos condutores) e PESSOA(para obtermos a informação pedida pela alínea), para obtermos a 
--soma dos preços finais e o Nº de viagens usamos funções de agregação como count(para somar todas
-- as viagens de cada condutor) e sum(para somar os valores finais das viagens), por fim fazemos uma
--agregação group by para organizar o resultado por Ano e condutor.
create view CONDUTORVIAGENSPORANO
as select extract(year from v.dtviagem) as ano, (p.nproprio || ' ' || p.apelido) as nome_condutor,
count(v.dtinicio) as N_viagens,sum(v.valfim) as precos_finais
from condutor c 
	inner join viagem v on v.condutor = c.idpessoa 
	inner join pessoa p on p.id = c.idpessoa
group by extract(year from v.dtviagem),v.condutor,p.nproprio,p.apelido;
select * from CONDUTORVIAGENSPORANO;

--(f)
--Raciocínio: Para obter a informação de cada cliente e o seu número de viagens,
--podemos fazer uma junção equivalente com as tabelas PESSOA(para obter a informação dos
--dos clientes),CLIENTEVIAGEM(para obtermos as viagens de cada cliente),VIAGEM(para podermos
--obter as viagens por ano, neste caso 2021), depois fazemos uma função de agregação
--sum(count) para somarmos cada viagem que pertence ao mesmo cliente do ano dado(where) e 
--agrupamos esta informação por id de cada cliente.
create table statistic
as select id, (nproprio || ' ' || apelido) as nome_cliente, count(v.idsistema) as N_viagens 
from pessoa p 
	inner join clienteviagem c on c.idpessoa = p.id 
	inner join viagem v on v.idsistema = c.viagem
where extract(year from v.dtinicio) = '2021'
group by id;

--(4)
--(a)
insert into tipoveiculo values(4,4,4,'Premium');

--(b)
update veiculo 
set tipo = 4 
where modelo = 'RangeRover';






