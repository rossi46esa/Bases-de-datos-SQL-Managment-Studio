--clausula TOP

select * from Paciente
select TOP 1 * from Paciente
select TOP 2 idPaciente, nombre, apellido from Paciente
select TOP 1 * from Paciente ORDER BY idPaciente DESC

--clausula ORDER BY	
select * from Paciente
select * from Paciente ORDER BY fNacimiento 
select * from Paciente ORDER BY fNacimiento DESC

--clausula DISTINCT: Agrupa un campo en específico sin repeticiones
select * from Paciente
select DISTINCT idPais from Paciente
select DISTINCT apellido from Paciente

--clausula GROUP BY: es similar a la DISTINCT sin embargo, con la clausula GROUP BY podemos agregar funciones
--de agregado, podemos sumar, calcular promedios, entre otras funciones más.
select * from Paciente
SELECT idPais FROM Paciente GROUP BY idPais