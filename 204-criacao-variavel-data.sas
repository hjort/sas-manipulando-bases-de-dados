/*
https://support.sas.com/documentation/cdl/en/lrcon/62955/HTML/default/viewer.htm#a000780367.htm
*/

data teste;
	set alura.cadastro_produto;

	if data > 201606 then
		lancamento = 1;
	else
		lancamento = 0;

proc print data=teste;

proc freq data=teste;
	table lancamento;

run;