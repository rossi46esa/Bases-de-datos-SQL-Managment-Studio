CREATE TABLE PagoPaciente(
	idPago int not null,
	idPaciente int not null,
	idTurno int not null

	PRIMARY KEY (idPago, idPaciente, idTurno)
)

CREATE TABLE Medico(
	idMedico int not null IDENTITY(1,1) PRIMARY KEY,
	nombre varchar(50) not null,
	apellido varchar(50) not null
)

create table MedicoEspecialidad(
	idMedico int not null,
	idEspecialidad int not null,
	descripcion varchar(50)

	primary key(idMedico, idEspecialidad)
)

create table Concepto (
	idConcepto tinyint identity (1,1) not null primary key,
	descripcion varchar(100)
)

--creando tipos de datos 
	--con esto evitamos que un desarrollador manipule datos y puedan perderse datos.
create type medico from int not null

create type turno from int not null

create type historia from int not null

create type observacion from varchar(1000) not null