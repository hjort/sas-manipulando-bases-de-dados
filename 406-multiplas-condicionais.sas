* realizar tratamento de datas nulas para os jogos;
data teste2c;
	set alura.cadastro_produto_v2;

	* se data for nula, para cada jogo setar uma data específica;
	if data = . and nome = "Soccer"         then data = 201709; else
	if data = . and nome = "Forgotten Echo" then data = 201411; else
	if data = . and nome = "Fireshock"      then data = 201706;

run;

* realizar tratamento de datas nulas para os jogos - forma otimizada;
data teste2d;
	set alura.cadastro_produto_v2;

	* se data for nula, para cada jogo setar uma data específica;
	if data = . then do;
		if nome = "Soccer"         then data = 201709; else
		if nome = "Forgotten Echo" then data = 201411; else
		if nome = "Fireshock"      then data = 201706;
	end;

run;

* realizar tratamento de datas nulas para os jogos - outra forma;
data teste2e;
	set alura.cadastro_produto_v2;

	* se data for nula, para cada jogo setar uma data específica;
	if data = . then do;
		select (nome);
			when ("Soccer")         data = 201709;
			when ("Forgotten Echo") data = 201411;
			when ("Fireshock")      data = 201706;
			otherwise;
		end;
	end;

proc freq data=teste2e
	(where=(nome in ("Soccer" "Forgotten Echo" "Fireshock")));
	table nome * data
	/ list missing nopercent nocum;

run;

* efetuar a correção dos valores ausentes - sobrescrever tabela atual;
data alura.cadastro_produto_v3;
	set teste2e;

	if data > 201606 then
		flag_lancamento = 1;
	else
		flag_lancamento = 0;

	label flag_lancamento = "Marca 1 para jogos que são lançamento e 0 caso contrário";

proc freq data=alura.cadastro_produto_v3
	(where=(nome in ("Soccer" "Forgotten Echo" "Fireshock")));
	table nome * data
	/ list missing nopercent nocum;

proc freq data=alura.cadastro_produto_v2;
	table flag_lancamento;
	*/ missing;

proc freq data=alura.cadastro_produto_v3;
	table flag_lancamento;
	*/ missing;

run;
 