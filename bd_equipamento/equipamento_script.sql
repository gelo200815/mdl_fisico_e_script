/*drop database equipamento;*/

create database if not exists equipamento;

use equipamento;

create table if not exists local(
	pk int not null auto_increment, primary key (pk),
    nome varchar(255) not null
);

create table if not exists equipamento(
	pk int not null auto_increment, primary key(pk),
    nome varchar(255) not null,
	marca varchar(255) not null,
    status tinyint,
    numeracao int not null,
    local_fk int, foreign key(local_fk) references local(pk)
); 

create table if not exists manutencao(
	pk int not null auto_increment, primary key (pk),
	local varchar(255) not null,
    telefone varchar(255) not null,
    email varchar(255) not null,
    Data datetime,
    custo decimal(4) not null,
    responsavel varchar(255) not null,
    equipamento_fk int, foreign key(equipamento_fk) references equipamento(pk)
);

/* inserts em local*/
insert into local (nome) value ("laboratorio informatica 1");
insert into local (nome) value ("laboratorio informatica 2");
insert into local (nome) value ("sala 1");
insert into local (nome) value ("sala 3");

update local set nome = "sala 2" where pk = 3;
delete from local where pk = 4;
select * from local;

/* inserts em equipamentos */
insert into equipamento (nome, marca, status, numeracao, local_fk ) value ("mouse", "Fortrek", true, '01', 1 );
insert into equipamento (nome, marca, status, numeracao, local_fk ) value ("monitor", "dell", true, '01', 2 );
insert into equipamento (nome, marca, status, numeracao, local_fk ) value ("teclado", "Redragon", true, '01', 1 );
insert into equipamento (nome, marca, status, numeracao, local_fk ) value ("teclado", "ksfd", false, '01', 3 );

update equipamento set nome = "projetor" where pk = 4;
delete from equipamento where pk = 4;
select * from equipamento;

/* inserts em manutencao*/
insert into manutencao (local, telefone, email, data, custo, responsavel, equipamento_fk) value ("Oficina Técnica XYZ", "(11) 98765-4321", "contato@oficinaxyz.com.br",'2024-08-22 9:40:05', '400.00', "joao da silva", 1); 
insert into manutencao (local, telefone, email, data, custo, responsavel, equipamento_fk) value ("Oficina Técnica oli", "(45) 70765-5521", "contato@oficinaoli.gov.br",'2024-06-19 6:47:05', '900.00', "Maria nacimento", 3); 
insert into manutencao (local, telefone, email, data, custo, responsavel, equipamento_fk) value ("Oficina Técnica mor", "(11) 98765-9999", "contato@oficinamor.com.eua",'2024-09-14 10:40:05', '300.00', "douglas morrimento", 2); 
insert into manutencao (local, telefone, email, data, custo, responsavel, equipamento_fk) value ("Oficina Técnica mysql", "(11) 99999-9999", "contato@oficinamor.com.eua",'2024-10-14 10:10:15', '110.00', "Ana heloisa", 2); 

update manutencao set email = "contato@oficinamysql.com.xampp" where pk = 4;
delete from manutencao where pk = 4;
select * from manutencao;