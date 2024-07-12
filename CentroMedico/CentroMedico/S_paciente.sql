--Store Procedure: seleccionara solo el id de la tabla paciente

Alter proc S_paciente(
		@idPaciente int
)
AS

	select idPaciente, apellido, nombre, idPais, observacion from Paciente where idPaciente = @idPaciente

GO