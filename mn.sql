--tabla carrera 
create table carrera
(
clave_c int,
nom_c varchar(50),
durac_c float,
constraint pk_cc primary key(clave_c)
)
insert into carrera values (1,'derecho',3)
insert into carrera values (2,'ingenieria en sistemas',4)
insert into carrera values (3,'diceño',3)

--tabla marteria 
create table materia 
(
clave_m int,
nom_m varchar(50),	
cred_m float,
constraint pk_cm primary key(clave_m)	
)
insert into materia values (3,'matematicas',15)
insert into materia values (4,'programación',20)


--tabla profesor 
create table profesor (
clave_p int,
nom_p varchar(150),
dir_p varchar(200),
tel_p bigint,
hor_p time,
constraint pk_cp primary key(clave_p)
insert into profesor values (1,'Laura rosas','calle azul',5214526,'7:00')
insert into profesor values (2,'Roberto diaz','calle verde',256456,'9:00')

)
/*tabla alumno
(con una clave foranea )*/
create table alumno(
mat_alu int,
nom_alu varchar(150),
edad_alu int,
sem_alu int,
gen_alu varchar(10),
clave_c1 int,
constraint pk_calu primary key (mat_alu),
constraint fk_fc1 foreign key (clave_c1)references carrera (clave_c)
)
insert into alumno values (1,'ana',18,6,'mujer',1)
insert into alumno values (2,'sergio',19,7,'hombre',2)
insert into alumno values (3,'julieta',20,6,'mujer',3)
--alumno_pofesor
create table alu_pro(
mat_alu1 int,
clave_p1 int,
constraint fk_falu1 foreign key(mat_alu1)references alumno (mat_alu),
constraint fk_fp1 foreign key (clave_p1)references profesor(clave_p) 
)
insert into alu_pro values(1,2)
insert into alu_pro values(2,2)
insert into alu_pro values(3,2)
--materia-alumno
create table mat_alu(
clave_m1 int,
mat_alu2 int,
constraint fk_fm1 foreign key (clave_m1) references materia (clave_m),
constraint fk_falu2 foreign key (mat_alu2) references alumno (mat_alu)	
)
insert into mat_alu values(1,1)
insert into mat_alu values(4,2)
insert into mat_alu values(3,3)
insert into mat_alu values(4,1)			

--materia profesor 
create table mat_pro(
clave_m2 int,
clave_p2 int,
constraint fk_fm2 foreign key (clave_m2) references materia(clave_m),
constraint fk_fp2 foreign key (clave_p2) references  profesor(clave_p)
)
insert into mat_pro values (2,2)

select * from alumno 
select nom_alu,edad_alu,sem_alu,nom_c,nom_p
from alumno inner join carrera on alumno.clave_c1=carrera.clave_c inner join alu_pro on alu_pro.mat_alu1=alumno.mat_alu inner join profesor on profesor.clave_p=alu_pro.clave_p1
inner join mat_alu on mat_alu.mat_alu2=alumno.mat_alu
inner join materia on materia.clave_m=mat_alu.clave_m1

where edad_alu=18