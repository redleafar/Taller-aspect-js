import java.util.List;

import ejemplo.cajero.control.Comando;
import ejemplo.cajero.control.ComandoTransferir;

public aspect HacerTransferencia {
	pointcut cargarComandos() : call (* ejemplo.cajero.Cajero.cargaComandos(..) );
	
	Object around(): cargarComandos() {
		List<Comando> resultado = (List<Comando>) proceed();
		resultado.add(new ComandoTransferir());
		return resultado;
  	}
}