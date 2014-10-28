[33mcommit eb7aff81969bc86dc4566cc6ead9d47125fef442[m
Author: Maruen Mehana <maruen@gmail.com>
Date:   Tue Oct 21 17:46:38 2014 -0200

    Mudanças no Model, Auditoria e Refactorings de código, mudando Date para Calendar

[1mdiff --git a/golive-import-service/src/main/java/br/com/golive/filter/FilterManager.java b/golive-import-service/src/main/java/br/com/golive/filter/FilterManager.java[m
[1mindex 5c15319..ea43e5b 100644[m
[1m--- a/golive-import-service/src/main/java/br/com/golive/filter/FilterManager.java[m
[1m+++ b/golive-import-service/src/main/java/br/com/golive/filter/FilterManager.java[m
[36m@@ -157,25 +157,26 @@[m [mpublic class FilterManager<T> {[m
 		for (final T index : lista) {[m
 			switch (filtro.getTipo()) {[m
 			case IGUAL:[m
[31m-				if (filtro.getInicio().getTime() != ((Date) getAtributoPorFieldEntity(index, field)).getTime()) {[m
[32m+[m				[32mif (filtro.getInicio().getTime() != ( (Calendar)getAtributoPorFieldEntity(index, field)).getTime()) {[m
 					temp.remove(index);[m
 				}[m
 				break;[m
 [m
 			case MENOR:[m
[31m-				if (filtro.getInicio().getTime() <= ((Date) getAtributoPorFieldEntity(index, field)).getTime()) {[m
[32m+[m				[32mif (filtro.getInicio().before(getAtributoPorFieldEntity(index, field))) {[m
 					temp.remove(index);[m
 				}[m
 				break;[m
 [m
 			case MAIOR:[m
[31m-				if (filtro.getInicio().getTime() >= ((Date) getAtributoPorFieldEntity(index, field)).getTime()) {[m
[32m+[m				[32mif (filtro.getInicio().after(getAtributoPorFieldEntity(index, field))) {[m
 					temp.remove(index);[m
 				}[m
 				break;[m
 [m
 			case PERIODO:[m
[31m-				if (!(filtro.getInicio().getTime() <= ((Date) getAtributoPorFieldEntity(index, field)).getTime()) || !(((Date) getAtributoPorFieldEntity(index, field)).getTime() <= filtro.getFim().getTime())) {[m
[32m+[m				[32mif (!(filtro.getInicio().before(getAtributoPorFieldEntity(index, field))) ||[m
[32m+[m				[32m   !( (Calendar) getAtributoPorFieldEntity(index, field)).before(filtro.getFim())) {[m
 					temp.remove(index);[m
 				}[m
 				break;[m

[33mcommit b1ad83bc6479329359a58cd4ecf12e3d14eb19a3[m
Author: Guilherme Giusti <guilherme.giusti04@gmail.com>
Date:   Thu Oct 16 19:48:04 2014 -0300

    Configuração perfil usuario

[1mdiff --git a/golive-import-service/src/main/java/br/com/golive/filter/FilterManager.java b/golive-import-service/src/main/java/br/com/golive/filter/FilterManager.java[m
[1mindex ac1e469..5c15319 100644[m
[1m--- a/golive-import-service/src/main/java/br/com/golive/filter/FilterManager.java[m
[1m+++ b/golive-import-service/src/main/java/br/com/golive/filter/FilterManager.java[m
[36m@@ -10,6 +10,8 @@[m [mimport java.util.HashMap;[m
 import java.util.List;[m
 import java.util.Map;[m
 [m
[32m+[m[32mimport javax.inject.Inject;[m
[32m+[m
 import org.apache.commons.lang.WordUtils;[m
 import org.slf4j.Logger;[m
 [m
[36m@@ -20,36 +22,25 @@[m [mimport br.com.golive.exception.GoLiveException;[m
 [m
 public class FilterManager<T> {[m
 [m
[31m-	private final Logger logger;[m
[32m+[m	[32m@Inject[m
[32m+[m	[32mprivate Logger logger;[m
 [m
 	private Object instance;[m
 [m
 	private final List<T> temp;[m
 [m
[31m-	// private final List<String> getterManagedBean;[m
[31m-[m
[31m-	public FilterManager(final Logger logger) {[m
[31m-		this.logger = logger;[m
[32m+[m	[32mpublic FilterManager() {[m
[32m+[m		[32msuper();[m
 		this.temp = new ArrayList<T>();[m
[31m-		// this.getterManagedBean = new ArrayList<String>();[m
 	}[m
 [m
[31m-	// public void putGetter(final String... fields) {[m
[31m-	// for (final String definicoes : fields) {[m
[31m-	// if (!getterManagedBean.contains(definicoes)) {[m
[31m-	// getterManagedBean.add(definicoes);[m
[31m-	// }[m
[31m-	// }[m
[31m-	// }[m
[31m-[m
 	@SuppressWarnings({ "rawtypes" })[m
 	public void filtrar(final List<T> conteudo, final List<T> filtrados, final GoliveFilter filtro, final String field) {[m
 		try {[m
[31m-			// if (!getterManagedBean.isEmpty()) {[m
 			temp.addAll(conteudo);[m
 			if (filtro != null) {[m
[31m-				logger.info("filtrado lista por data, campo = {}", field);[m
 				setFilterOnBean(filtro, field);[m
[32m+[m
 				if (verificarFiltro(filtro)) {[m
 					if (filtro.getGenericType().getSimpleName().equals("Long")) {[m
 						retirarNumerosForaDoParametro(conteudo, temp, filtro, field);[m
[36m@@ -60,27 +51,19 @@[m [mpublic class FilterManager<T> {[m
 					}[m
 				}[m
 			} else {[m
[31m-				logger.info("limpando lista por data, campo = {}", field);[m
 				setFilterOnBean(null, field);[m
 			}[m
 			atualizarListaDeFiltrados(conteudo, temp, filtrados);[m
 			filtrarPorPelosCamposRestantes(field, temp, filtrados);[m
 			atualizarListaDeFiltrados(conteudo, temp, filtrados);[m
 			temp.removeAll(conteudo);[m
[31m-			// } else {[m
[31m-			// throw new GoLiveException("Nenhum filtro foi definido.");[m
[31m-			// }[m
 		} catch (final Exception e) {[m
 			temp.removeAll(conteudo);[m
 			filtrados.removeAll(conteudo);[m
 			filtrados.addAll(conteudo);[m
 			logger.error("Houve um ao realizar o filtro");[m
 			e.printStackTrace();[m
[31m-		} finally {[m
[31m-			// ServiceUtils.ordenarTabela(primeFacesDataTable, colunas,[m
[31m-			// primeFacesDataTable.getId(), getForm());[m
 		}[m
[31m-[m
 	}[m
 [m
 	public void setTipoFiltroMB(final String field, final TipoFiltro filter) {[m
[36m@@ -94,8 +77,10 @@[m [mpublic class FilterManager<T> {[m
 				}[m
 			}[m
 		} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException | NoSuchMethodException | SecurityException e) {[m
[32m+[m			[32mlogger.error("Erro ao acessar o setter do filtro no managedBean");[m
 			throw new GoLiveException("Não existe o campo anotado com " + Filter.class.getName() + " no managedBean");[m
 		}[m
[32m+[m		[32mlogger.error("Erro ao acessar o setter do filtro no managedBean");[m
 		throw new GoLiveException("Não existe o campo anotado com " + Filter.class.getName() + " no managedBean");[m
 [m
 	}[m
[36m@@ -109,6 +94,7 @@[m [mpublic class FilterManager<T> {[m
 				}[m
 			}[m
 		} catch (final Exception e) {[m
[32m+[m			[32mlogger.error("Erro selecionar Tipo Filtro");[m
 			e.printStackTrace();[m
 		}[m
 [m
[36m@@ -156,6 +142,9 @@[m [mpublic class FilterManager<T> {[m
 			}[m
 		}[m
 		if (!inseriu) {[m
[32m+[m			[32m/**[m
[32m+[m			[32m * Utilizado para testes[m
[32m+[m			[32m */[m
 			if (!getInstance().getClass().isAnnotationPresent(Fake.class)) {[m
 				throw new GoLiveException("Não existe o campo anotado com " + Filter.class.getName() + " no managedBean");[m
 			}[m
[36m@@ -263,38 +252,21 @@[m [mpublic class FilterManager<T> {[m
 	private Object getAtributoPorFieldEntity(final T index, final String field) throws NoSuchFieldException, SecurityException, NoSuchMethodException {[m
 		try {[m
 [m
[31m-			Object retorno = null;[m
[31m-[m
[31m-			// for (final String key : getterManagedBean) {[m
[31m-			// if (key.contains(field)) {[m
[31m-			// for (final String string : key.replace(".", " ").split(" ")) {[m
[31m-[m
[31m-			// if (retorno == null) {[m
 			if (index.getClass().getDeclaredField(field) != null) {[m
[31m-				retorno = index.getClass().getDeclaredMethod("get" + WordUtils.capitalize(field)).invoke(index);[m
[31m-			}[m
[31m-			// } else {[m
[31m-			// if (retorno.getClass().getDeclaredField(string) != null) {[m
[31m-			// retorno = retorno.getClass().getDeclaredMethod("get" +[m
[31m-			// WordUtils.capitalize(string)).invoke(retorno);[m
[31m-			// }[m
[31m-			// }[m
[31m-			// }[m
[31m-			// }[m
[31m-			// }[m
[31m-[m
[31m-			switch (retorno.getClass().getSimpleName()) {[m
[31m-			case "Long":[m
[31m-				return Long.parseLong(retorno.toString());[m
[31m-			case "GregorianCalendar":[m
[31m-				return returnDate(retorno);[m
[31m-			case "String":[m
[31m-				return retorno.toString();[m
[31m-			default:[m
[31m-				break;[m
[32m+[m				[32mfinal Object retorno = index.getClass().getDeclaredMethod("get" + WordUtils.capitalize(field)).invoke(index);[m
[32m+[m				[32mswitch (retorno.getClass().getSimpleName()) {[m
[32m+[m				[32mcase "Long":[m
[32m+[m					[32mreturn Long.parseLong(retorno.toString());[m
[32m+[m				[32mcase "GregorianCalendar":[m
[32m+[m					[32mreturn returnDate(retorno);[m
[32m+[m				[32mcase "String":[m
[32m+[m					[32mreturn retorno.toString();[m
[32m+[m				[32mdefault:[m
[32m+[m					[32mbreak;[m
[32m+[m				[32m}[m
 			}[m
[31m-[m
 		} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {[m
[32m+[m			[32mlogger.error("Erro ao obterCampo da entidade no indice da lista");[m
 			e.printStackTrace();[m
 		}[m
 		return null;[m
[36m@@ -357,6 +329,7 @@[m [mpublic class FilterManager<T> {[m
 					}[m
 				}[m
 			} catch (NoSuchFieldException | SecurityException | NoSuchMethodException e) {[m
[32m+[m				[32mlogger.error("Erro ao filtrar por parametros restantes");[m
 				e.printStackTrace();[m
 			}[m
 		}[m

[33mcommit e090b09f9e458fc9906770eaf08c74bcf5082c66[m
Author: Guilherme Giusti <guilherme.giusti04@gmail.com>
Date:   Wed Oct 15 20:32:31 2014 -0300

    Template perfil

[1mdiff --git a/golive-import-service/src/main/java/br/com/golive/filter/FilterManager.java b/golive-import-service/src/main/java/br/com/golive/filter/FilterManager.java[m
[1mindex f53b4a4..ac1e469 100644[m
[1m--- a/golive-import-service/src/main/java/br/com/golive/filter/FilterManager.java[m
[1m+++ b/golive-import-service/src/main/java/br/com/golive/filter/FilterManager.java[m
[36m@@ -26,49 +26,50 @@[m [mpublic class FilterManager<T> {[m
 [m
 	private final List<T> temp;[m
 [m
[31m-	private final List<String> getterManagedBean;[m
[32m+[m	[32m// private final List<String> getterManagedBean;[m
 [m
 	public FilterManager(final Logger logger) {[m
 		this.logger = logger;[m
 		this.temp = new ArrayList<T>();[m
[31m-		this.getterManagedBean = new ArrayList<String>();[m
[32m+[m		[32m// this.getterManagedBean = new ArrayList<String>();[m
 	}[m
 [m
[31m-	public void putGetter(final String... fields) {[m
[31m-		for (final String definicoes : fields) {[m
[31m-			if (!getterManagedBean.contains(definicoes)) {[m
[31m-				getterManagedBean.add(definicoes);[m
[31m-			}[m
[31m-		}[m
[31m-	}[m
[32m+[m	[32m// public void putGetter(final String... fields) {[m
[32m+[m	[32m// for (final String definicoes : fields) {[m
[32m+[m	[32m// if (!getterManagedBean.contains(definicoes)) {[m
[32m+[m	[32m// getterManagedBean.add(definicoes);[m
[32m+[m	[32m// }[m
[32m+[m	[32m// }[m
[32m+[m	[32m// }[m
 [m
 	@SuppressWarnings({ "rawtypes" })[m
 	public void filtrar(final List<T> conteudo, final List<T> filtrados, final GoliveFilter filtro, final String field) {[m
 		try {[m
[31m-			if (!getterManagedBean.isEmpty()) {[m
[31m-				temp.addAll(conteudo);[m
[31m-				logger.info("Filtrando lista por data, campo = {}", field);[m
[31m-				if (filtro != null) {[m
[31m-					setFilterOnBean(filtro, field);[m
[31m-					if (verificarFiltro(filtro)) {[m
[31m-						if (filtro.getGenericType().getSimpleName().equals("Long")) {[m
[31m-							retirarNumerosForaDoParametro(conteudo, temp, filtro, field);[m
[31m-						} else if (filtro.getGenericType().getSimpleName().equals("String")) {[m
[31m-							retirarStringForaDoParametro(conteudo, temp, filtro, field);[m
[31m-						} else if (filtro.getGenericType().getSimpleName().equals("Date")) {[m
[31m-							retirarDatasForaDoParametro(conteudo, temp, filtro, field);[m
[31m-						}[m
[32m+[m			[32m// if (!getterManagedBean.isEmpty()) {[m
[32m+[m			[32mtemp.addAll(conteudo);[m
[32m+[m			[32mif (filtro != null) {[m
[32m+[m				[32mlogger.info("filtrado lista por data, campo = {}", field);[m
[32m+[m				[32msetFilterOnBean(filtro, field);[m
[32m+[m				[32mif (verificarFiltro(filtro)) {[m
[32m+[m					[32mif (filtro.getGenericType().getSimpleName().equals("Long")) {[m
[32m+[m						[32mretirarNumerosForaDoParametro(conteudo, temp, filtro, field);[m
[32m+[m					[32m} else if (filtro.getGenericType().getSimpleName().equals("String")) {[m
[32m+[m						[32mretirarStringForaDoParametro(conteudo, temp, filtro, field);[m
[32m+[m					[32m} else if (filtro.getGenericType().getSimpleName().equals("Date")) {[m
[32m+[m						[32mretirarDatasForaDoParametro(conteudo, temp, filtro, field);[m
 					}[m
[31m-				} else {[m
[31m-					setFilterOnBean(null, field);[m
 				}[m
[31m-				atualizarListaDeFiltrados(conteudo, temp, filtrados);[m
[31m-				filtrarPorPelosCamposRestantes(field, temp, filtrados);[m
[31m-				atualizarListaDeFiltrados(conteudo, temp, filtrados);[m
[31m-				temp.removeAll(conteudo);[m
 			} else {[m
[31m-				throw new GoLiveException("Nenhum filtro foi definido.");[m
[32m+[m				[32mlogger.info("limpando lista por data, campo = {}", field);[m
[32m+[m				[32msetFilterOnBean(null, field);[m
 			}[m
[32m+[m			[32matualizarListaDeFiltrados(conteudo, temp, filtrados);[m
[32m+[m			[32mfiltrarPorPelosCamposRestantes(field, temp, filtrados);[m
[32m+[m			[32matualizarListaDeFiltrados(conteudo, temp, filtrados);[m
[32m+[m			[32mtemp.removeAll(conteudo);[m
[32m+[m			[32m// } else {[m
[32m+[m			[32m// throw new GoLiveException("Nenhum filtro foi definido.");[m
[32m+[m			[32m// }[m
 		} catch (final Exception e) {[m
 			temp.removeAll(conteudo);[m
 			filtrados.removeAll(conteudo);[m
[36m@@ -264,22 +265,23 @@[m [mpublic class FilterManager<T> {[m
 [m
 			Object retorno = null;[m
 [m
[31m-			for (final String key : getterManagedBean) {[m
[31m-				if (key.contains(field)) {[m
[31m-					for (final String string : key.replace(".", " ").split(" ")) {[m
[31m-[m
[31m-						if (retorno == null) {[m
[31m-							if (index.getClass().getDeclaredField(string) != null) {[m
[31m-								retorno = index.getClass().getDeclaredMethod("get" + WordUtils.capitalize(string)).invoke(index);[m
[31m-							}[m
[31m-						} else {[m
[31m-							if (retorno.getClass().getDeclaredField(string) != null) {[m
[31m-								retorno = retorno.getClass().getDeclaredMethod("get" + WordUtils.capitalize(string)).invoke(retorno);[m
[31m-							}[m
[31m-						}[m
[31m-					}[m
[31m-				}[m
[32m+[m			[32m// for (final String key : getterManagedBean) {[m
[32m+[m			[32m// if (key.contains(field)) {[m
[32m+[m			[32m// for (final String string : key.replace(".", " ").split(" ")) {[m
[32m+[m
[32m+[m			[32m// if (retorno == null) {[m
[32m+[m			[32mif (index.getClass().getDeclaredField(field) != null) {[m
[32m+[m				[32mretorno = index.getClass().getDeclaredMethod("get" + WordUtils.capitalize(field)).invoke(index);[m
 			}[m
[32m+[m			[32m// } else {[m
[32m+[m			[32m// if (retorno.getClass().getDeclaredField(string) != null) {[m
[32m+[m			[32m// retorno = retorno.getClass().getDeclaredMethod("get" +[m
[32m+[m			[32m// WordUtils.capitalize(string)).invoke(retorno);[m
[32m+[m			[32m// }[m
[32m+[m			[32m// }[m
[32m+[m			[32m// }[m
[32m+[m			[32m// }[m
[32m+[m			[32m// }[m
 [m
 			switch (retorno.getClass().getSimpleName()) {[m
 			case "Long":[m
