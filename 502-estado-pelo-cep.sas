proc contents data=alura.cadastro_cliente;

run;

/* https://thiagorodrigo.com.br/artigo/cep-brasil-lista-de-cep-por-estados-capitais-e-interior/ */

/*
 * Relação Estado para CEP
 * -Grande SP: 01000-000 a 09999-999
 * -Interior de SP: 10000-000 a 19999-999
 * -Rio de Janeiro: 20000-000 a 28999-999
 * -Minas Gerais: 30000-000 a 39999-999
 * -Paraná: 80000-000 a 87999-999
 */

data teste1;
	set alura.cadastro_cliente;
	format Estado $14.;

	if "01000-000" <= cep <="09000-000" then
		Estado="Grande SP";
	else if "10000-000" <= cep <="19999-999" then
		Estado="Interior SP";
	else if "20000-000" <= cep <="28999-999" then
		Estado="Rio de Janeiro";
	else if "30000-000" <= cep <="39999-999" then
		Estado="Minas Gerais";
	else if "80000-000" <= cep <="87999-999" then
		Estado="Paraná";
	else
		Estado="Demais estados";

run;

PROC FREQ
	data=teste1;
	tables estado
	/missing;
RUN;

PROC CONTENTS data=teste1 varnum;
RUN;

data teste2;
	set alura.cadastro_cliente;
	precep1 = substr(cep, 1, 2);
	precep2 = substr(cep, 1, 2) * 1; *forçar ser numérica;
	precep = input(substr(cep, 1, 2), best.);
	length precep 3; *ocupar menos espaço na memória;

proc freq data=teste2;
	tables precep /missing;

proc contents data=teste2 varnum;

run;

/* Fone: (00) 00000-0000 */
data teste3;
	set alura.cadastro_cliente;
	DDD = substr(telefone, 2, 2);
	Fone = substr(telefone, 6);
	Mes = input(substr(Nascimento, 6, 2), best.);

run;
