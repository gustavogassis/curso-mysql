# MySQL

## Tipos Primitivos
  * Numérico
    * Interios
      * TinyInt
      * SmallInt
      * Int
      * MediumInt
      * BigInt <br>
      * `A diferença deles é a qntd de bytes que ele vai utilizar para armazenar esses dados. Influencia diretamente no tamanho do número que vc vai guardar.`
      * `TinyInt é por padrão 3 bytes, logo 3 casas. O Int é por padrão 11 bytes.`
    * Reais
      * Decimal
        * Exemplo: `peso decimal(5,2)` onde 5 é a qntd de casas e 2 é a qntd de casas dps da virgula
      * Float
      * Double
      * Real
    * Lógicos
      * Bit
      * Boolean
  * Data/Tempo
    * Date
    * DateTime
    * TimeStamp
    * Time
    * Year
  * Literal
    * Caractere
      * Char
      * VarChar
      * `A diferença é que um é fixo e outro é variante. Por exemplo: ao definir o nome como até 30 caracteres, caso seja Char e o nome cadastrado tiver somente 10 caracteres os 20 restantes serão espaços na memória, pq é fixo 30 caracteres. Já no VarChar caso sobre caracteres, eles nn serão ocupados.`
    * Texto
      * TinyText
      * Text
      * MediumText
      * LongText
    * `Utiliza-se o tipo Texto precisa-se guardar grandes textos, como decrição de pessoas/produtos e etc. Já o tipo Caractere qnd é algo curto como nome de pessoa/produto,endereço e etc.`
    * Binário
      * TinyBlob
      * Blob
      * MediumBlob
      * LongBlob
    * Coleção
      * Enum
      * Set
      * `Enum e Set são tipos em que vc pode configurar quais são os valores permitidos e na hr do cadastro ele só vai aceitar esses valore.`
  * Espacial
    * Geometry
    * Point
    * Polygon
    * MultiPolygon

## Comandos Workbench
  * `describe nomeTable` ou `desc nomeTable`: Mostra nome dos campos, os tipos, chaves, etc.

## Parâmetro (Constraints)
  * `default character set utf8` : utf8 é exemplo.
  * `defaul collate utf8_general-ci`
  * `not null`
  * `default` -> Ex: `nacionalidade varchar(20) default 'Brasil', caso nn seja especificado, será brasil. Caso algum parâmetro da tabela esteja como auto_increment, na hr de inserir pode colocar default, que ai ele pega conforme o auto_increment.`
  * `limit` : Limita a qntd de linha que será afetada cm o comando
  * `unique` : única, mas nn uma chave primária
  * `unsigned` (sem sinal): nn aceita valores negativos

## Comandos Terminal (Tbm tem que colocar o `;`)(São os msm comandos q é usado no workbench)
  * `show databases;` : Mostra todos os bancos criados.
  * `use nomeBanco;` : Começa a usar o banco indicado.
  * `status;` : Mostra algumas infos atuais, como o banco que esta sendo utilizado.
  * `show tables;` : Mostra as tabelas do banco que vc está utilizando.
  * `describe nomeTable;` : Mostra nome dos campos, os tipos, chaves, etc.
  * `show create table nomeTable` : Mostra qual foi o comando utilizado para criar esta tabela. Utilizar com uma tabela já existente.
  * `show create database nomeDatabase` : Mostra o comando utilizado para criar o banco indicado.





## Aula 4
  ## Campo chave primária: é o campo que nn se repete.
  ## Query: é uma pergunta, uma solicitação.
  * `create database cadastro default character set utf8 default collate utf8_general_ci;`
  * ` create table pessoas (
	id int NOT NULL AUTO_INCREMENT,
	nome varchar(30) NOT NULL,
    nascimento date,
    sexo enum('M','F'),
    peso decimal(5,2),
    altura decimal(3,2),
    nacionalidade varchar(20) default 'Brasil',
    primary key(id)
) default charset = utf8 ;
`
## Aula 5
É possivel inserir varios dados em um só `insert into`:
insert into pessoas (ex,ex,ex,ex...),(outroex, outroex, outroex, ...)...

## Aula 6
  * Sempre que ver **Column** de uma tabela, está se referindo aos campos dela.
  * ## Alter Table
    * Altera uma tabela
    * `Add Column`: Acrescenta uma nova coluna na tabela
      * `alter table nomeTable add column nomeColumn tipoColumn;  `
      * `alter table pessoas add column profissao varchar(10);`
      * Sempre que add uma nova coluna ela vai para o final da tabela. É possivel escolher a posição que ela vai ficar:
        * `alter table pessoas add column profissao varchar(10) after nome;`
        * Nn existe o before, sempre usa o **after**.
        * Para add como primeira coluna da tabela, usa o **first**
          * `alter table pessoas add column codigo int FIRST;`
    * `Drop Column`
      * Remove uma coluna da tabela
      * `alter table pessoas drop column profissao`
    * Para alterar a estrutura de definição de uma coluna, tipo de `varchar(10)` para `varchar(30)` usa o `modify`
      * `alter table pessoas modify column profissao varchar(30) default '';`
    * Para renomear uma coluna e os tipos primitivos, utiliza-se o `change`
      * `alter table pessoas change column profissao prof varchar(20) default ''`
      * Tem q colocar o nome antigo e o novo. No caso antigo = profissao e novo = prof
      * NN pode usar só para renomear, tem q renomear e colocar todas as suas **constraints**
    * Para renomear a tabela inteira, usa a **constraint** `rename to`
      * `alter table pessoas rename to gafanhotos`
    * Para colocar uma coluna já existente como chave primária:
      * `alter table cursos add primary key(idcursos)`

## Aula 7 (Manipulando linha)
  * É recomendável manipular somente uma linha por vez
  * ### Update
    * Ex Padrão: `update cursos set nome = 'PHP', ano = '2016' where idcurso = '1';`
    * `limit`: Caso for alterar mais de uma linha, é possivel utilizar o `limit` para determinar a qntd de linhas que vc quer q seja afetada.
  * ### Delete (Apagar linhas)
    * Ex Padrão: `delete from cursos where idcurso = '8';`
  * ### Truncate (Apagar todos os registros de uma tabela)
    *  `truncate curso;`

## Aula 7 - Gerando Cópias de Segurança MySQL
  * Backup de um banco de dados = **Dump**

##  Aula 11
  * ## Select
    * O padãro ordena pela chave primária
    * `Order by colunaTable` : ordena em ordem alfabética pela coluna indicada.
      * Caso acrescente o `desc`, ele ordena de baixo pra cima(ordem alfabética inversa)
      * Pode colocar para ordenar por mais de uma coluna. Ex : `select ano, carga, nome from cursos order by ano, nome;`. Deste modo, ordena primeiro por curso e dps por nome.
    * `where condição`: Filtra as linhas conforme a condição passada.
      * `between`: Determina um intervalo para a condição. Ex: `select nome, ano from cursos where ano between 2014 and 2016;`
      * `in`: Determina valores para a coluna em evidência. Ex: `select nome, ano, descricao from cursos where ano in (2014, 2016, 2019)`
      * Operador `like`: Seleciona coisas parecidas. Ex na query `select * from cursos where nome like 'P%'` ele seleciona os cursos onde o nome começa com 'P'. O `%` é o "coringa". Ele representa **nenhum** ou **vários** caracteres.
        * Na query `select * from cursos where nome like '%a'`, ela pega os que o nome termina com 'a'. E assim varia conforme a posição do '%'.
        * Outro exemplo: `select * from cursos where nome like 'PH%P'`. Pega tudo q começa cm 'PH' **e** termina com 'P'.
    * WildCards: São Substitudos de Caracteres.
      * `%` - Já explicado no de cima.
      * `_` - Exige que tenha um caractere onde tiver `_`. Ex: `select * from cursos where nome like 'ph%p_'`
    * `Distinct` (Parâmetro): Filtra os elementos repetidos. Por exemplo: em uma coluna que guarda a nacionalidade terá vários registros 'Brasil'. Se vc quer saber a nacionalidade dos alunos, virá repetidamente o valor 'Brasil'. Para filtrar usa o `distinct`. Exemplo: `select distinct nacionalidade from gafanhotos;`
    * `count()`: Conta alguma coisa. Quero Saber qntd curso tem carga hr maior que 40. Entt `select count(*)from cursos where carga > '40';`
    * `max()`: pega o mac de alguma coisa. A query `select max(altura) from gafanhotos;` pega a altura máxima dos cadastrados na tabela, mas nn traz qm tem essa altura.
    * `min()`: pega o menor de alguma coisa.
    * `sum()`: soma alguma coisa. Ex: `select sum(totaulas) from cursos where ano = '2016'`. Soma o total de aulas dos cursos de 2016
    * `avg()`: Tira a média de algo. Ex: `select avg(totaulas) from cursos where ano = '2016'"`. Tira a média do total de aulas dos cursos de 2016.

## Aula 13
  ### Agrupamento
  * Agrupa em alguma coluna os valores iguais.
  * Ex: `select carga from curso group by carga;`
    * Agrupou todas as cargas iguais.
    * O resultado é o msm de um distinct.
  * Caso use um `count()`, é possível saber qntds registros tem em cada agrupamento(Diferenciando assim do distinct)
    * Ex cm o `count()`: `select carga, count(*) from cursos group by carga;`
  * Junto cm o **Where**: `select carga, count(nome) from cursos where totaulas = '30' group by carga;`
  * Selecionando quem eu quero agrupar: `select carga, count(*) from cursos group by carga having count(*) > 3;`. Mostra os grupos de carga que contenham mais de 3 registros.
    * Dentro do **Having** só pode trabalhar com o campo que foi agrupado.

  *  #### Select dentro de outro select
     *  `select carga, count(*) from cursos where ano > 2015 group by carga`: Se eu quiser mostrar os cursos que tenham a carga acima da média de carga horária, entt faz:
        *  `select carga, count(*) from cursos where ano > 2015 group by carga having carga > (select avg(carga) from cursos);`

## Aula 14 - Modelo Relacional
  * Entidade = Tabela
  * A **chave estrangeira** *nn precisa ter o msm nome da* **chave primária** *que ela foi herdada*. Mas é **obrigatório** ter o msm tipo de dado.
  * Qnd a cardinalidade do **relação é (1,1)**, a chave primária da tabela dominada vira chave estrangeira na tabela dominante.
  * Qnd a cardinalidade da **relação é (1,n)**, a chave primária da **tabela que tem o lado 1** da cardinalidade vira chave estrangeira na **tabela que tem o lado n**
  * Qnd a cardinalidade da **relação é (n,n)** `Cliente(n) --- Compra --- (n)Produtos`, o relacionamento(*losango que fica no meio*) vira tbm uma entidade e ganha atributos. Ficando, assim, duas relações (1,n): `Cliente(1) --- (n)Compra(n) --- (1)Produtos`. E igual falado anteriormente a **chave primária do lado (1)** *vira* **estrangeira no lado (n)**. Assim a entidade **Compra** fica com duas chaves estrangeiras.

## Aula 15 - Chaves Estrangeira e Join
  * Add uma chave estrangeira com **Alter Table**
    * `alter table gafanhotos add foreign key(cursopreferido) references cursos(idcursos)`. Sabendo que o *cursopreferido* é **obrigado** a ter o msm tipo de *idcursos*.
      * Isso significa que *cursopreferido* da tabela gafanhotos está ligado ao *idcurso* da tabela cursos.
  * ### Join
    * Se eu der um select na tabela *gafanhotos* no atributo *cursopreferido*, ele me mostrará somento o valor que equivale na tabela curso, mas nn o nome do curso preferido. Entt para mostrar o nome, é necessário fazer um **join**, que pode mostrar os dados das duas tabelas nos registros que tem uma relação.
      * Ex: `select gafanhotos.nome, cursos.nome, cursos.nome from gafanhotos inner join cursos on cursos.idcurso = gafanhotos.cursopreferido order by gafanhotos.nome;`.  Após o **on** precisa identificar qual chave primária se identifica com qual chave estrangeira.
      * Para encurtar o código é possível usar a constraint **as** que utiliza de um apelido que vc escolhe, ficando:
        *  `select g.nome, c.nome, c.nome from gafanhotos as g inner join cursos as c on c.idcurso = g.cursopreferido order by g.nome;`
    * Nesses exemplos foi utilizado o **inner join** que mostra os dados quem **tem** correspondente na outra tabela. Mas caso precise mostrar os dados que nn tem correspondente se utiliza o **outer join**. No entanto, ele precisa de um referencial. Neste exemplo: `select g.nome, c.nome, c.nome from gafanhotos as g  join cursos as c on c.idcurso = g.cursopreferido` a tabela *gafanhotos* está a esquerda do *join* e a tabela *cursos* está a direita.
      * Sabendo isso, se precisar tbm  saber os dados sem  correspondente da tabela gafanhotos ficaria: `select g.nome, c.nome, c.nome from gafanhotos as g  left outer join cursos as c on c.idcurso = g.cursopreferido`.
      * Já os da tabela cursos ficaria: `select g.nome, c.nome, c.nome from gafanhotos as g right outer join cursos as c on c.idcurso = g.cursopreferido`