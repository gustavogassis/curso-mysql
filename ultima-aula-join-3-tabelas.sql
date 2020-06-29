create table gafanhoto_assiste_curso (
	id int not null auto_increment,
    data date,
    idgafanhoto int,
	idcurso int,
    primary key(id),
    foreign key(idgafanhoto) references gafanhotos(id),
    foreign key(idcurso) references curso(idcurso)
) default charset = utf8;

select * from gafanhoto_assiste_curso;


select g.nome, c.nome from gafanhotos as g 
join gafanhoto_assiste_curso as a
on g.id = a.idgafanhoto
join cursos as c
on a.idcurso = c.idcurso
order by g.nome;







