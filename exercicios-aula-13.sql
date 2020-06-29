# Exercícios aula 13

# Ex 1 -
select profissao, count(*) from gafanhotos group by profissao;

# Ex 2 - 
select sexo, count(*) from gafanhotos where nascimento > '2005-01-01' group by sexo;

# Ex 3 -
select nacionalidade, count(*) from gafanhotos where nacionalidade != 'Brasil'
	group by nacionalidade having count(*) > 3;
    
# Ex 4 - 
select altura, count(*) from gafanhotos where peso > '100.00' group by altura
	having altura > (select avg(altura) from gafanhotos);
