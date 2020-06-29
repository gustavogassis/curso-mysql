# Exercícios vídeo 12

	select * from gafanhotos;

	# 1 -
	select nome from gafanhotos where sexo = 'F';
    
    # 2 -
    select * from gafanhotos where nascimento between '2000-01-01' and '2015-12-31';
    
    # 3 -
    select nome from gafanhotos where sexo = 'M' and profissao = 'Programador'; 
    
    # 4 -
    select * from gafanhotos where nome like 'J%' and sexo = 'F' and nacionalidade = 'Brasil';
    
    # 5 - 
    select nome, nacionalidade from gafanhotos where sexo = 'M' and nome like '%Silva%'
		and not nacionalidade = 'Brasil' and peso < '100.00';
        
	# 6 -
    select max(altura) from gafanhotos where sexo = 'M' and nacionalidade = 'Brasil';
    
    # 7 -
    select avg(peso) from gafanhotos;
        
	# 8 -
    select min(peso) from gafanhotos where sexo = 'F' and not nacionalidade = 'Brasil'
		and nascimento between '1990-01-01' and '2000-12-31';
	
    # 9 -
	select count(*) from gafanhotos where sexo = 'F' and altura > '1.90';