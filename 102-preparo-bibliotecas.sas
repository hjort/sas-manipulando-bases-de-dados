libname _all_ list;

proc datasets lib=sashelp;
proc datasets lib=work;

proc datasets lib=temp;
proc datasets lib=alura;

run;

*libname sasintro '/Users/03323620941/My Folder/AluraPlay/dados';
*libname dados "/Users/03323620941/My Folder/Alura Play/dados";
*libname dados "/folders/myfolder/";

/*
https://sasnrd.com/sas-copy-move-data-library/
https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.5/proc/p1juxu16zautpxn1dikxecc3kn7w.htm
*/
proc copy in=temp out=alura memtype=data;
run;
