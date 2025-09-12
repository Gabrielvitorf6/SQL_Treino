use db_clinica;

create table paciente(
CPF varchar(11),
 nome varchar(50) ,
 telefone varchar(14) , 
 sexo enum ('F','M'),
 PRIMARY KEY(CPF ))
 DEFAULT CHARSET = utf8mb4
 collate = utf8mb4_general_ci;

insert into paciente values ('12345678901','Gabriel Vitor Ferreira dos Santos', '11988106972', 'M'),
('09876543212','Creuza','1196255-3638','F'),('25472580156','Rodolfo', '11963816391','M'),
('71829452749','Manuella','11925496284672','F'),('82738194572','Pablo','11963810461955','M');

 
 create table if not exists MEDICO(
 CRM bigint(6) NOT NULL, 
 CPF bigint(11) not null,
 nome varchar(50) NOT NULL,
 telefone varchar(14),
 sexo enum ('M','F'),
 PRIMARY KEY(CPF , CRM))
 DEFAULT CHARSET = utf8mb4
 collate = utf8mb4_general_ci;
 
 insert into medico values ('617256','61728394015','Jubisleu','(11)98263-7182','M'),('728394','49283746501','Marinalva','(21)99384-2719','F'),
('839175','85739264028','Claudionor','(31)98817-6354','M'),
('927461','37482915673','Gertrudes','(41)99125-4820','F'),
('516283','60592837412','Osvaldo','(51)98462-7139','M');

CREATE TABLE IF NOT EXISTS MEDICAMENTOS(
idMedicamento INT(10) NOT NULL auto_increment,
NomeMedicamento varchar(50) NOT NULL,
precomedicamento decimal(7,2),
PRIMARY KEY(idMedicamento))
default charset utf8mb3
collate = utf8mb3_general_ci;

CREATE TABLE IF NOT EXISTS EXAME(
idExame integer(9) NOT NULL auto_increment,
Nome_Exame varchar(50) not null,
PRIMARY KEY(idExame));


insert into exame values (default, 'Radiologia'),(default,'Teste de pressão');

alter table paciente
drop primary key ;

ALTER TABLE paciente
add column idPaciente int(9) NOT NULL auto_increment primary key first;

alter table medico
add column idMedico int(9) not null auto_increment Unique primary key first;

insert into medicamentos values(DEFAULT, 'Omeprazol','78.54'),(DEFAULT,'Loratadina','9.90'),(DEFAULT,'Dipirona','5.00');

CREATE TABLE IF NOT EXISTS CONSULTA(
idPaciente int not null ,
idMedico int not null,
idExame int not null,
idConsulta int(9) not null auto_increment unique,
data_consulta DATETIME DEFAULT Current_timestamp,
desc_consulta varchar(100),
CONSTRAINT fk_consulta_medico FOREIGN key (idmedico) references medico(idmedico) on delete restrict,
constraint fk_consulta_paciente foreign key (idpaciente) references paciente(idpaciente) on delete restrict,
constraint fk_consulta_exame foreign key (idexame) references exame(idexame) on delete restrict
);

insert into consulta values ('2','1','3',default,default,'Exame de radiologia');

select sexo ='M', COUNT(*)
from medico
group by sexo;

select precomedicamento  , COUNT(*)
from medicamentos
group by precomedicamento
having precomedicamento > '50.00';

select nome from paciente
order by nome asc;

select * from medico where nome like '%o%';


select * from paciente;
select * from medico;
select * from medicamentos;
select * from consulta;