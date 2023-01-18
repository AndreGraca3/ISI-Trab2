create table if not exists PESSOA(
    id integer primary key,
    noident char(12) unique,
    nif char(12) unique,
    nproprio varchar(10),
    apelido varchar(15),
    morada varchar(150),
    ntelefone numeric(9),-- só deve ter 9 digitos
    localidade varchar(150),
    atrdisc char(2) check( atrdisc = 'P' or atrdisc = 'C' or atrdisc = 'CL'), -- p => proprietário, c => condutor , CL => clientes
	constraint pessoa_noident unique(noident),
	constraint pessoa_nif unique(nif)
);

create table if not exists CONDUTOR(
    idpessoa integer primary key,
    nconducao varchar(20) unique,
    dtnascimento date check (dtnascimento + 6570 < current_date),--18 anos * 365 dias = 6570 dias 
    foreign key (idpessoa) references PESSOA(id)
);

create table if not exists PROPRIETARIO(
    idPessoa integer primary key,
    dtnascimento date check (dtnascimento + 6570 < current_date),--18 anos * 365 dias = 6570 dias 
    foreign key (idpessoa) references PESSOA(id)
);

create table if not exists TIPOVEICULO(
    tipo integer primary key,
    nlugares integer check (nlugares < 8 and nlugares > 0),
    multiplicador numeric(1),
    designacao char(10)
);

create table if not exists VEICULO(
	id integer primary key,
	matricula varchar(10),
	modelo varchar(10),
	marca varchar(10),
	ano integer check ((extract(year from now()) - ano ) <= 5),
	tipo integer,
	proprietario integer,--cada proprietário tem no máximo 20 veículos
	foreign key (tipo) references TIPOVEICULO(tipo),
	foreign key (proprietario) references PROPRIETARIO(idpessoa)
);

create table if not exists CONDHABILITADO(
	condutor integer not null,
	veiculo integer not null,
	primary key (condutor,veiculo),
	foreign key (condutor) references CONDUTOR(idpessoa),
	foreign key (veiculo) references VEICULO(id)
);

create table if not exists CORVEICULO(
	veiculo integer unique,
	cor varchar(10) not null,
	primary key (veiculo,cor),
	foreign key (veiculo) references VEICULO(id)
);

create table if not exists PERIODOATIVO(
	veiculo integer not null,
	condutor integer not null,
	dtinicio timestamp not null check (dtinicio < now()),
	dtfim timestamp check (dtfim > dtinicio),
	lat decimal(6,2),
	long decimal(6,2),
	primary key (veiculo,condutor,dtinicio),
	foreign key (veiculo) references VEICULO(id),
	foreign key (condutor) references CONDUTOR(idpessoa)
);

create table if not exists VIAGEM(
	idsistema integer primary key,
	hinicio time,
	hfim time check(hfim > hinicio),
	dtviagem date,
	valestimado decimal(5,2),
	valfim decimal(5,2),
	latinicio decimal(6,2),
	longinicio decimal(6,2),
	latfim decimal(6,2) check(latfim != latinicio),
	longfim decimal(6,2) check(longfim != longinicio),
	classificacao integer check(classificacao > 0 and classificacao <= 5),
	veiculo integer not null,
	condutor integer not null,
	dtinicio timestamp not null,
	foreign key (veiculo,condutor,dtinicio) references PERIODOATIVO(veiculo,condutor,dtinicio)
); 

create table if not exists CLIENTEVIAGEM(
	idpessoa integer not null,
	viagem integer not null,
	primary key (idpessoa,viagem),
	foreign key (idpessoa) references PESSOA(id),
	foreign key (viagem) references VIAGEM(idsistema)
);

create table if not exists CONTACTO(
	idpessoa integer not null,
	ntelefone varchar(10) not null,
	primary key (idpessoa,ntelefone),
	foreign key (idpessoa) references PESSOA(id)
);

select * from pessoa;
select * from condutor;
select * from proprietario;
select * from tipoveiculo;
select * from veiculo;
select * from condhabilitado;
select * from corveiculo;
select * from periodoativo;
select * from viagem;
select * from clienteviagem;