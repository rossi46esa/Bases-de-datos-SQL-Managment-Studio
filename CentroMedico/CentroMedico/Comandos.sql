select * from Paciente

insert into Paciente (dui, nombre, apellido, fNacimiento, domicilio, idPais, telefono, email, observacion)
values ('85964788-9','Leandro','Carballo','1979-01-05','La Unión','ESA',null,'leandro@gmail.com','Sin observación'),
('05089648-1','José','Gil','1981-05-03','Calle circunbalación','ESP',null,'joseGil@gmail.com','')


select * from TurnoEstado

insert into TurnoEstado values (1,'Realizado'), (2,'Cancelado'),
(3,'Rechazado'), (4,'Postergado'), (5,'Anulado'), (6,'Derivado')

select * from Turno
select * from TurnoPaciente

insert into Turno (fechaTurno, estado, observacion) 
values ('2023-08-04', 1, 'Paciente dado de alta'),
		('2022-05-25', 5, 'Sin observación')
		--comprobando la FK, ingresando un estado inexistente.
--insert into Turno (fechaTurno, estado, observacion) 
--values ('2023-12-04', 8, 'Paciente crítico')

	--insert en la tabla turnoPaciente
insert into TurnoPaciente values (1,4,1)

	--insert con un paciente inexistente, comprobando la FK paciente
--insert into TurnoPaciente values (2,2,2)

select * from Concepto

insert into Concepto values ('Laboratorio'), ('Radiografía')

select * from Pago

insert into Pago (concepto, fecha, monto, estado, observacion)
values (1, '2019-02-15',4500,0,'Pago pendiente'),
		(2, '2019-05-20',6800,0,'Pago pendiente'),
		(1, '2019-09-27',5600,0,'Pago pendiente')

select *from PagoPaciente
insert into PagoPaciente values (1,1,2), (2,3,3), (3,4,3)

--DML
--Update
select * from Paciente

update Paciente set observacion = 'Paciente dado de alta.' where idPaciente = 3
--actualizar más de un campo
update Paciente set idPais = 'ESA', telefono = '76185110' where idPaciente = 3

--Delete
delete from Paciente where idPaciente = 8

--Agregar un nuevo turno
select * from Turno
insert into Turno (fechaTurno, estado, observacion)
values ('2019-01-22 10:00', 0, 'Turno pendiente de aprobación')

select * from TurnoPaciente
insert into TurnoPaciente values (5,9,2)

--DELETE cuando hay una relacion uno a muchos
--Para eliminar un registro cuando exite una relacion uno a muchos, primero hay que eliminar
--el registro de la FK y luego el registro de la PK. Si se hace al reves, no funcionará y 
--SQL nos enviará un mensaje diciendo que no se puede eliminar pues existe una relación uno a muchos.

--eliminar el registro primero que recién se acabá de generar en la tabla TurnoPaciente y luego el del Paciente
delete from TurnoPaciente where idPaciente = 9
select * from TurnoPaciente
select * from Paciente
delete from Paciente where idPaciente = 9

select * from TurnoEstado
insert into TurnoEstado values(7,'Realizando ejercicio')

--Realizar consulta que devuelva los registros de la tabla Pago ordenados
--por fecha de pago de manera ascendente
select * from Pago

select * from Pago ORDER BY fecha

--Realizar consulta que devuelva el paciente más joven utilizando las cláusulas TOP y ORDER BY
select * from Paciente

select TOP (1) * from Paciente ORDER BY fNacimiento DESC


--FUNCIONES DE AGREGADO
--FUNCIONES MAX Y MIN: obtener el valor maximo y mínimo de un campo. Creo que es similar
--a TOP junto con el GROUP BY
select * from Pago

select MAX(fecha) AS UltimaFecha from Pago

select MIN(monto) as montoMIINIMO from Pago


--función SUM: suma el total. Solo se puede aplicar a tipos de datos numericos

select * from Pago

select SUM(MONTO) as montoTotal from Pago

select SUM(MONTO) + 10 as montoTotal from Pago

--funcion AVG: promedio

select * from Pago

select AVG(MONTO) AS montoPromedio FROM Pago

select AVG(MONTO + 20) AS montoPromedio FROM Pago

select AVG(MONTO) + 20 AS montoPromedio FROM Pago

--funcion COUNT: cuenta las filas

select COUNT(*) from Paciente

select COUNT(idPaciente) from Paciente where apellido = 'Perez'

--funcion HAVING: trabaja en conjunto con COUNT y GROUP BY
select * from Turno

select estado from Turno GROUP BY estado HAVING COUNT(estado) > 2


--OPERADORES LOGICOS

--AND
select * from Paciente where apellido = 'Herrera' AND nombre = 'Rosa'
select * from Paciente where apellido = 'Herrera' AND nombre = 'Rosa' AND idPaciente = 1

--or
select * from Paciente where apellido = 'Herrera' OR nombre = 'Jose' OR idPaciente = 5

--IN: filtra por un grupo de valores
select * from Turno where estado IN (2,1,5)

select * from Paciente where apellido IN('Herrera','Ramírez','Gonzalez')

--LIKE
select * from Paciente where nombre LIKE '%r%'

select * from Paciente where nombre LIKE '%Ca%'

--NOT
select * from Paciente where nombre NOT LIKE '%r%'

select * from Paciente where apellido NOT IN('Herrera','Ramírez','Gonzalez')

--BETWEEN
select * from Turno where fechaTurno BETWEEN '20190106' AND '20230101 13:00:00'

select * from Turno where estado BETWEEN 3 AND 7

--COMBINANDO OPERADORES


--Ejecutando un STORE PROCEDURE

	EXEC S_paciente 4


--Declarando variables
	declare @entero int
	set @entero = null
	select ISNULL(@entero, 0) as Valor

	declare @decimal decimal(10,2)
	set @decimal = null
	select ISNULL(@decimal, 0.00) as Valor

	declare @variable varchar(50)
	set @variable = null
	select ISNULL(@variable,'Texto puesto porque sí') as Variable

	declare @fecha DATETIME
	set @fecha = null
	select ISNULL(@fecha, GETDATE()) AS ValorFecha

	declare @boolean BIT
	set @boolean = null
	select ISNULL(@boolean, 1) as ValorBool

	declare @moneda MONEY
	set @moneda = null
	select ISNULL(@moneda, 5.65) as ValorMoneda


--GENERANDO SUBCONSULTAS
--UNA SUBCONSULTA es poner una consulta dentro de otra consulta

SELECT idPaciente, apellido, nombre, idPais, observacion,
	(SELECT ps.pais from Pais ps where ps.idPais = pa.idPais) AS NombrePais
from Paciente pa where idPaciente = 5

