proc freq data=alura.cadastro_produto nlevels;
	table nome;

proc freq data=alura.cadastro_produto nlevels;
	table nome;
	table nome * genero;

proc freq data=alura.cadastro_produto;
	table nome * genero
	/ list nocum nopercent;

proc freq data=alura.cadastro_produto;
	table nome * preco
	/ list nopercent;

run;
