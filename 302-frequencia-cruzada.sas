proc print data=teste
	noobs;

proc freq data=teste;
	table lancamento;

proc freq data=teste nlevels;
	table genero * lancamento;

proc freq data=teste;
	table genero * lancamento
	/ nocol norow nopercent;

proc freq data=teste;
	table genero * lancamento
	/ nocol norow nofreq;

run;
