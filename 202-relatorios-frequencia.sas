/*
https://documentation.sas.com/doc/en/statug/15.2/statug_freq_syntax01.htm
*/

proc freq data=alura.cadastro_produto;
	table genero;

proc freq data=alura.cadastro_produto nlevels;
	table genero plataforma nome;

run;
