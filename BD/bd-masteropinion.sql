##### Master Opinion #####


#Tabla restaurantes 

create table restaurantes
(
id varchar(10),
nombre varchar(35) NOT NULL,
anioApertura numeric(4) NOT NULL,
direccion varchar(60),
telefono numeric(9),
horaApertura time,
horaCierre time,
ciudad varchar(39),
descripcion varchar(400),
constraint pk_restaurantes primary key (id),
constraint telefrest check(substr(telefono,1,1) in ('6','9')),
constraint unicDirec unique (direccion)
);

insert into restaurantes
	values('1','Bistro Los Tulipanes',1980,'Calle del Almirante Ulloa 8, 41001 Sevilla España',607698707,'08:00','20:00','Sevilla','Sabores distintos, lugar agradable y trato exquisito.El local es pequeñito y no cuenta con muchas mesas, pero se encuentra en una calle estrecha no muy transitada del centro por lo que no está saturado de público como otros.');

insert into restaurantes
	values('2','Vitamina',1990,'Santa Barbara - Higuera de la Sierra 21220',612698707,'08:00','23:00','Huelva','Un buen sitio para comer migas, carne de caza o setas, muy buenos precios, y el personal es muy competente.');






#Tabla miembros

create table miembros
(
id varchar(10),
usuario varchar(20) NOT NULL,
email varchar(35) NOT NULL,
nombre varchar(20) NOT NULL,
primerApellido varchar(20) NOT NULL,
segundoApellido varchar(20),
password varchar(60) NOT NULL,
telefono numeric(9),
ciudad varchar(39),
constraint pk_miembros primary key (id),
constraint dominios check(email like '%@%.com' or email like '%@%.org' or email like '%@%.net' or email like '%@%.es'),
constraint telefono check(substr(telefono,1,1) in ('6','9')),
constraint unicEmail unique (usuario,email)
);

insert into miembros
	values('1','pepegs','pepegs@gmail.com','Pepe','Gomez','Sanchez','pepegs',987765123,'Sevilla');
insert into miembros
	values('2','mariahr','mariahr@gmail.com','Maria','Helios','Ramiro','mariahr',617745123,'Huelva');
insert into miembros
	values('3','saulfb','saulfb@gmail.com','Saul','Felix','Berrido','saulfb',610745133,'Ronda');
insert into miembros
	values('4','leticiapt','leticiapt@gmail.com','Leticia','Parrado','Torres','leticiapt',910745133,'Nerja');



#Tabla opiniones

create table opiniones
(
id varchar(30),
titulo varchar(45) NOT NULL,
descripcion varchar(300),
fechaOpinion date NOT NULL,
idMiembro varchar(10),
idRestaurante varchar(10),
constraint pk_opi primary key (id,idMiembro,idRestaurante),
constraint fk_opi1 foreign key (idMiembro) references miembros(id),
constraint fk_opi2 foreign key (idRestaurante) references restaurantes(id)
);

insert into opiniones
	values('1','Muy acogedor','Local muy acogedor y economico con buena comida y camareras muy sexis','2018/12/20','1','1');
insert into opiniones
	values('2','Feo y antiguo','Tiene humedades y vi una rata corriendo','2018/10/02','1','2');
insert into opiniones
	values('3','Buena comida','Se come fenomenal ya un precio economico','2019/01/12','2','1');
insert into opiniones
	values('4','Las mejores vistas','Buenas vistas y gente muy acogedora','2019/05/12','2','1');
insert into opiniones
	values('5','Se come bien','Muy buen precio y te dejan llevarte las sobras','2019/03/23','3','1');
insert into opiniones
	values('6','Buen ambiente','Tematica moderna y buena iluminacion','2019/04/02','3','2');
insert into opiniones
	values('7','No voy mas','Encontre bello pubico en mi sopa...','2019/03/23','4','1');
insert into opiniones
	values('8','Mejor no hablar...','El chef es un estupido que solo sabe dar la comida del microondas','2019/03/23','4','2');
