* filtrar alguns jogos pelo nome;
data teste2;
	set alura.cadastro_produto_v2;
	where nome = "Soccer"
       or nome = "Forgotten Echo"
       or nome = "Fireshock";

data teste2b;
	set alura.cadastro_produto_v2;
	where nome in ("Soccer", "Forgotten Echo", "Fireshock");

proc freq data=teste2b;
	table nome * data
	/ list;

* exibir linhas com valores ausentes;
proc freq data=teste2b;
	table nome * data
	/ list missing;

* executar todos os passos de uma vez;
proc freq data=alura.cadastro_produto_v2
	(where=(nome in ("Soccer" "Forgotten Echo" "Fireshock")));
	table nome * data
	/ list missing nopercent nocum;

run;