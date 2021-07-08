data alura.cadastro_produto_v2;
	set teste;
	rename lancamento = flag_lancamento;
	label genero = "Gênero"
		lancamento = "Marca 1 para jogos que são lançamento e 0 caso contrário";

proc contents data=alura.cadastro_produto_v2;

run;
