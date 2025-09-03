
-- Exercicio_4.10_a: Retrieve the names of all employess in department 5 who work more than 10 hours per week on the ProductX project
-- Retorne os nomes de todos empregados do departamento 5 que trabalham mais de 10 horas por semana no projeto ProductX

-- A imagem da consulta retirada do MySQL pode ser vista no arquivo "exercicio_4.10_a"
-- A minha ideia é tornar a saída mais limpa usando o CONCAT para deixar os nomes mais visíveis.
-- Também adicionei as tabelas com o nome e número do projeto, bem como as horas trabalhas por semana.

	SELECT CONCAT(Fname," ", Minit," ", Lname) AS Name, Pname, Dnum, Hours
	FROM employee as e, works_on as w, project as p
	WHERE Dnum='5' AND w.Essn=e.ssn AND (Pname='ProductX' AND Hours > 10);

-- Exercicio_4.10_c: Find the names of all employees who are directly supervised by 'Franklin Wong'
-- Encontre o nome de todos os empregados que são diretamente supervisionados por 'Franklin Wong'


	SELECT CONCAT(Fname, " ", Minit, " ", Lname) as Name, Super_ssn
	FROM employee as e, department as d
    WHERE e.Super_ssn=d.Mgr_ssn AND e.Super_ssn='333445555';

-- A imagem da consulta encontra-se no "exercicio_4.10_c"
