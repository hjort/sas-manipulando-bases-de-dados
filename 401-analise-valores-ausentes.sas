/*
 * Análise sobre a variável de data da base
 */

proc freq data=alura.cadastro_produto_v2;
	table data;

* filtrar apenas observações com valores faltantes;
data teste2;
	set alura.cadastro_produto_v2;
	where data is missing;

run;