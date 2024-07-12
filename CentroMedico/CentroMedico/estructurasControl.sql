--if else begin end
/*
declare @idpaciente int
declare @turno int

set @idpaciente = 7

if @idpaciente = 7

BEGIN
	set @turno = 20
	select * from Paciente where idPaciente = @idpaciente
	print @turno

	if EXISTS(select * from Paciente where idPaciente = 2)
		print ('existe')
END
*/


-- ******************************************************************************************
--ESTRUCTURA WHILE

declare @contador int = 1

while @contador <= 10
BEGIN
	print @contador
	set @contador = @contador + 1
	BREAK
END
--BREAK rompe el loop y continua con sentencias que esten posteriores al loop
--RETURN rompe el loop y ya No continua con sentencias que esten posteriores al loop
BEGIN TRY
	set @contador = 'texto'
END TRY

BEGIN CATCH
	print 'No es posible asignar una cadena de caracteres a la variable @contador'
END CATCH


-- ******************************************************************************************
--ESTRUCTURA CASE

declare @valor int
declare @resultado char(10) = ''
set @valor = 20

set @resultado = (CASE WHEN @valor = 1 THEN 'ROJO'
						WHEN @valor = 2 THEN 'AZUL'
						WHEN @valor = 3 THEN 'VERDE'
					ELSE 'GRIS'
					END)
print @resultado

select *, (CASE WHEN estado = 0 THEN 'AZUL'
				WHEN estado = 1 THEN 'ROJO'
				WHEN estado = 2 THEN 'VERDE'
			ELSE 'GRIS'
			END) from Turno