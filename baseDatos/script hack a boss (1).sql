drop database if exists proyectoFinalHACKABOSS;
create schema proyectoFinalHACKABOSS;

Use proyectoFinalHACKABOSS;


create table usuario (
  idusuario tinyint(6) not null primary key,
  admin boolean not null default false,
  nombreusuario varchar(20) not null,
  apel1 varchar (40) not null,
  apel2 varchar (40) not null,
  codFoto varchar (10) not null
)
;


create table tarjeta (
  idtarjeta tinyint(6) not null primary key,
  numerotarjeta varchar(19)  not null,
  idusuario tinyint (6) not null,
  fechaExpiracion varchar(5) not null,
  csv int(3) not null,
  constraint `fk_UsuarioTarjeta` FOREIGN KEY (`idusuario` ) REFERENCES `proyectoFinalHACKABOSS`.`usuario` (`idusuario` )
);

create table categoria (
  idcategoria tinyint(6) not null primary key,
  nombrecategoria varchar(20),
  descripcioncategoria varchar (60)
);



create table libro (
  idlibro tinyint(6) not null primary key,
  idcategoria tinyint(6) not null,
  idusuario tinyint(6) not null,
  titulo varchar(40) not null unique,
  stock int not null default 0,
  precio float(8,2),
  constraint `fk_Categoria` FOREIGN KEY (`idcategoria` ) REFERENCES `proyectoFinalHACKABOSS`.`categoria` (`idcategoria` ) on delete restrict,
  constraint `fk_Usuario` FOREIGN KEY (`idusuario` ) REFERENCES `proyectoFinalHACKABOSS`.`usuario` (`idusuario` )
);


Create table reserva (
    idusuario tinyint(6) not null,
    idlibro tinyint(6) not null,
    fechareserva datetime,
    fechadevolucion datetime,
    primary key (idusuario,idlibro,fechareserva),
	constraint `fk_UsuarioReserva` FOREIGN KEY (`idusuario` ) REFERENCES `proyectoFinalHACKABOSS`.`usuario` (`idusuario` ),
    constraint `fk_LibroReserva` FOREIGN KEY (`idlibro` ) REFERENCES `proyectoFinalHACKABOSS`.`libro` (`idlibro`) on delete restrict
);


create table autor (
  idautor tinyint(6)  not null primary key,
  idlibro tinyint (6) not null,
  nombreautor varchar(40) not null,
  apel1 varchar(20) not null,
  apel2 varchar (20) null,
   constraint `fk_LibroAutor` FOREIGN KEY (`idlibro` ) REFERENCES `proyectoFinalHACKABOSS`.`libro` (`idlibro`) on delete restrict
);


create table factura (
  idfactura tinyint(6)  not null primary key,
  idusuario tinyint(6) not null references usuario (idusuario),
  fecha datetime,
  iva float(4,2),
  precioenvio float (4,2),
  total float (4,2),
constraint `fk_UsuarioFactura` FOREIGN KEY (`idusuario` ) REFERENCES `proyectoFinalHACKABOSS`.`usuario` (`idusuario` )
);


create table detalle ( 
  idfactura tinyint(6) not null references factura(idfactura),
  iddetalle tinyint(6) unsigned not null, 
  idlibro tinyint(6) references libro(idlibro),
  precio float (8,2), 
  primary key (idfactura,iddetalle),
  constraint `fk_LibroDetalle` FOREIGN KEY (`idlibro` ) REFERENCES `proyectoFinalHACKABOSS`.`libro` (`idlibro`),
  constraint `fk_idFactura` FOREIGN KEY (`idfactura` ) REFERENCES `proyectoFinalHACKABOSS`.`factura` (`idfactura` ) on delete restrict
);

INSERT INTO proyectoFinalHACKABOSS.usuario values (1,true,"Jose","Lopez","Fernandez","cod1");
INSERT INTO proyectoFinalHACKABOSS.usuario values (2,true,"Barbara","Imbernon","loquesea","cod2");
INSERT INTO proyectoFinalHACKABOSS.usuario values (3,true,"Jose","Santos","Iglesias","cod3");
INSERT INTO proyectoFinalHACKABOSS.categoria values (1,"Terror","Categoria destinada a los libros de terror");
INSERT INTO proyectoFinalHACKABOSS.categoria values (2,"Fantasia","Categoria destinada a los libros de fantasia");
INSERT INTO proyectoFinalHACKABOSS.categoria values (3,"Aventura","Categoria destinada a los libros de aventura");
INSERT INTO proyectoFinalHACKABOSS.libro values (1,1,1,"Don Quijote de la Mancha",3,20);
INSERT INTO proyectoFinalHACKABOSS.libro values (2,1,1,"Harry Potter",2,20);
INSERT INTO proyectoFinalHACKABOSS.autor values (1,1,"Miguel","Cervantes","Saavedra");
INSERT INTO proyectoFinalHACKABOSS.autor values (2,2,"Joanne","Rowling","Rowling");
INSERT INTO proyectoFinalHACKABOSS.tarjeta values (1,"4000 1234 5673 9875",1,"04/21",343);

INSERT INTO proyectoFinalHACKABOSS.reserva values (1,1,"1996-07-10",null);

INSERT INTO `proyectofinalhackaboss`.`factura` (`idfactura`, `idusuario`, `fecha`, `iva`) VALUES ('1', '1', '2021-01-04', '20.00');

INSERT INTO `proyectofinalhackaboss`.`detalle` (`idfactura`, `iddetalle`, `idlibro`, `precio`) VALUES ('1', '1', '1', '20.0');
INSERT INTO `proyectofinalhackaboss`.`detalle` (`idfactura`, `iddetalle`, `idlibro`, `precio`) VALUES ('1', '2', '1', '30.0');
INSERT INTO `proyectofinalhackaboss`.`detalle` (`idfactura`, `iddetalle`, `idlibro`, `precio`) VALUES ('1', '3', '1', '50.0');

