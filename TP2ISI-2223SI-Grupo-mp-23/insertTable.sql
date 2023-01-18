insert into pessoa values(1,12,21,'Antonio','Silva','Rua Rosa',900000000,'lisboa','CL');--cliente
insert into pessoa values(2,34,43,'Danilo','Vieira','ISEL',911111999,'Chelas','C');--condutor
insert into pessoa values(3,56,65,'Bruno','Ferreira','Rua Verde',989898000,'Cascais','P');--proprietario
insert into pessoa values(4,78,87,'Carlos','Brito','Rua Amarela',920020020,'Montijo','P');--proprietario
insert into pessoa values(5,90,09,'Diogo','Santos','Rua Roxa',930303030,'Sintra','CL');--cliente
insert into pessoa values(6,21,12,'Andre','Graça','Rua Lilas',940404040,'Sintra','C');--condutor
insert into pessoa values(7,43,34,'Joaquim','Gomes','Rua Vermelha',950505050,'Alentejo','CL');--cliente
insert into pessoa values(8,65,56,'Carla','Almeida','Rua Laranja',960606060,'Meleças','C');--condutor
insert into pessoa values(9,87,78,'Jorge','Gilberto','Rua Violeta',970707070,'Mira-Sintra','P');--proprietario
insert into pessoa values(10,109,910,'Gonçalo','Vila','Rua Carmin',980808080,'debaixo_ponte_25_abril','C');--condutor

insert into condutor values(2,'Carta1','12-03-2003');
insert into condutor values(6,'Carta2','20-05-2001');
insert into condutor values(8,'Carta3','8-12-1997');
insert into condutor values(10,'Carta4','5-05-2003');--2003-05-05

insert into proprietario values(3,'2000-02-18');
insert into proprietario values(4,'1990-09-09');
insert into proprietario values(9,'1987-06-11');

insert into tipoveiculo values(1,6,2,'Normal');
insert into tipoveiculo values(2,3,1,'Luxo');
insert into tipoveiculo values(3,6,2,'XL');

insert into veiculo values(1,'30-AA-20','308','Peugeot',2020,1,3);--bruno ferreira
insert into veiculo values(2,'24-XF-76','Bentayga','Bentley',2018,2,4);--carlos brito 
insert into veiculo values(3,'86-KK-50','3008','Peugeot',2021,3,9);
insert into veiculo values(4,'50-KK-90','RangeRover','LandRover',2020,3,9);

insert into condhabilitado values(2,1);
insert into condhabilitado values(6,1);
insert into condhabilitado values(8,1);
insert into condhabilitado values(2,2);
insert into condhabilitado values(10,2);

insert into periodoativo values(1,2,'2022-10-22 10:10:00','2022-10-22 12:30:00',32,32);
insert into periodoativo values(2,6,'2022-5-15 15:25:50','2022-5-15 15:59:34',45,45);
insert into periodoativo values(3,8,'2022-8-7 19:05:37','2022-8-7 20:10:43',60,23);
insert into periodoativo values(2,6,'2022-10-8 11:10:00','2022-10-8 13:30:00',32,32);
insert into periodoativo values(2,6,'2021-10-9 11:10:00','2021-10-9 13:30:00',32,32);
insert into periodoativo values(2,6,'2021-10-10 11:10:00','2021-10-10 13:30:00',32,32);
insert into periodoativo values(2,6,'2021-10-11 11:10:00','2021-10-11 13:30:00',32,32);
insert into periodoativo values(2,6,'2021-10-12 11:10:00','2021-10-12 13:30:00',32,32);
insert into periodoativo values(2,6,'2021-10-13 11:10:00','2021-10-13 13:30:00',32,32);
insert into periodoativo values(2,6,'2021-10-14 11:10:00','2021-10-14 13:30:00',32,32);
insert into periodoativo values(1,2,'2021-10-15 11:10:00','2021-10-15 13:30:00',32,32);
insert into periodoativo values(1,2,'2021-10-16 11:10:00','2021-10-16 13:30:00',32,32);

insert into viagem values(1,'10:10','12:30','22-10-2022',300,400,30,30,32,32,4,1,2,'2022-10-22 10:10:00');
insert into viagem values(2,'15:25:50','15:59:34','2022-5-15',100,140,40,38,45,45,5,2,6,'2022-05-15 15:25:50');
insert into viagem values(3,'19:05:37','20:10:43','2022-8-7',204,231,58,26,60,23,3,3,8,'2022-8-7 19:05:37');
insert into viagem values(4,'11:10','13:30','8-10-2022',300,400,30,30,32,32,4,2,6,'2022-10-8 11:10:00');
insert into viagem values(5,'11:10','13:30','9-10-2021',300,400,30,30,32,32,4,2,6,'2021-10-9 11:10:00');
insert into viagem values(6,'11:10','13:30','10-10-2021',300,400,30,30,32,32,4,2,6,'2021-10-10 11:10:00');
insert into viagem values(7,'11:10','13:30','11-10-2021',300,400,30,30,32,32,4,2,6,'2021-10-11 11:10:00');
insert into viagem values(8,'11:10','13:30','12-10-2021',300,400,30,30,32,32,4,2,6,'2021-10-12 11:10:00');
insert into viagem values(9,'11:10','13:30','13-10-2021',300,400,30,30,32,32,4,2,6,'2021-10-13 11:10:00');
insert into viagem values(10,'11:10','13:30','14-10-2021',300,400,30,30,32,32,4,2,6,'2021-10-14 11:10:00');
insert into viagem values(11,'11:10','13:30','15-10-2021',300,400,30,30,32,32,4,1,2,'2021-10-15 11:10:00');
insert into viagem values(12,'11:10','13:30','16-10-2021',300,400,30,30,32,32,4,1,2,'2021-10-16 11:10:00');

insert into clienteviagem values(1,1);
insert into clienteviagem values(5,2);
insert into clienteviagem values(7,3);
insert into clienteviagem values(1,4);
insert into clienteviagem values(1,5);
insert into clienteviagem values(5,6);
insert into clienteviagem values(7,7);
insert into clienteviagem values(7,8);
insert into clienteviagem values(7,9);
insert into clienteviagem values(5,10);
insert into clienteviagem values(1,11);
insert into clienteviagem values(1,12);