object registroAbatidosCOD {
	const registro = []
	
	method agregarAbatidosDia(cantidad, dia){
		if(self.yaEstaElDia(dia)){
		self.error("Ya existe el día")
		}
		registro.add([cantidad, dia])
	}
	
	method agregarAbatidosVariosDias(registrosAbatidos){
		registrosAbatidos.forEach{e => self.agregarAbatidosDia(e)}
	}
	
	method dia(reg) = reg.get(1)
	
	method cant(reg) = reg.first()
	
	method yaEstaElDia(dia) = registro.any({x => self.dia(x) == dia})
	
	method registroDia(dia) = registro.find({x => self.dia(x) == dia})
	
	method eliminarElRegistroDelDiaR(dia){
		if(!self.yaEstaElDia(dia)){
			self.error("El día no está en la lista")
		}
		registro.remove(self.registroDia(dia))
	}
	
	method eliminarVariosRegistrosDeDias(listaDeDias){
		if(!listaDeDias.all{e => self.yaEstaElDia(e)}){
			self.error("Algún día la lista no está incluido en el registro")
			}
		listaDeDias.forEach{e => self.eliminarElRegistroDelDiaR(e)}
	}
	
	method cantidadDeDiasRegistrados() = registro.size()
	method estaVacioElRegistro() = registro.isEmpty()
	method algunDiaAbatio(cantidad) = registro.any({r => self.cant(r) == cantidad})
	method primerValorDeAbatidos() = self.cant(registro.first())
	method ultimoValorDeAbatidos() = self.cant(registro.last())
	method maximoValorDeAbatidos() = self.cant(registro.max({e => self.cant(e)}))
	method totalAbatidos() = registro.sum({r => self.cant(r)})
	method cantidadDeAbatidosElDia(dia) = self.registroDia(dia)
	method ultimoValorDeAbatidosConSize() = self.cant(registro.get(registro.size()-1))
	method esCrack() = (1..registro.size()-1).all({i => self.cant(registro.get(i)) > self.cant(registro.get(i-1))})
}





