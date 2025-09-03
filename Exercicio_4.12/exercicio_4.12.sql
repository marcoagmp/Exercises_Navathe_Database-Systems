-- Exercício_4.12_a: Retrieve the names of all senior students majoring in 'CS' (computer science).
-- Retorne o nome dos estudantes do Instituto 'CS' (ciência da computação).

	SELECT Nome 
	from Estudante 
	WHERE Instituto = 'CS';
	
-- Exercício_4.12_b: Retrieve the names of all courses taught by Professor King in 2007 and 2008.
-- Retorne o nome dos cursos lecionados pelo Professor King em 2007 e 2008

	SELECT c.Nome_Curso, s.Professor, s.Ano 
	FROM Curso as c, Seção as s 
	WHERE c.id_Curso=s.id_Curso AND s.Professor='King';
	
-- Exercício_4.12_c: For each section taugh by Professor King, retrieve the course number, semester, year, and number of students who took the section.
-- Para cada seção lecionada pelo Professor King, retorne o número do curso, semestre, ano e número de estudantes que estão na sessão. 

-- Sozinho eu consegui retornar apenas o valor da id_Seção, não estava conseguindo agregar o valor do atributo s.id_Seção numa COUNT. O que eu fiz foi pode ser visto na figura exercicio_4.12_c1 e abaixo:


	select s.id_Seção, s.id_Curso, s.Semestre, s.Ano, s.id_Seção as Num_Alunos 
	from Seção as s, Grade as g 
	where s.Professor='King' AND s.id_Seção=g.id_Seção;
	
-- Pedi ajuda ao Gemini e ele retornou a seguinte solução para o problema da função de agregação COUNT, que pode ser visto na figura exercicio_4.12_c2.
		
-- gemini:"O erro que você está recebendo ndica que você está usando uma função de agregação (COUNT()) sem agrupar os resultados por todas as outras colunas que não estão agregadas no SELECT.
-- gemini:"O banco de dados não sabe como exibir um valor único para id_Seção, id_Curso, Semestre e Ano enquanto conta vários alunos para a mesma seção."
-- gemini:"Para corrigir sua consulta, você deve adicionar uma cláusula GROUP BY para agrupar os resultados por todas as colunas que você deseja exibir. A forma correta de sua consulta seria:"

	SELECT 
		s.id_Seção, 
		s.id_Curso, 
		s.Semestre, 
		s.Ano, 
		COUNT(g.id_Seção) AS Num_Alunos 
	FROM 
		Seção AS s, 
		Grade AS g 
	WHERE 
		s.Professor = 'King' 
		AND s.id_Seção = g.id_Seção
	GROUP BY 
		s.id_Seção, 
		s.id_Curso, 
		s.Semestre, 
		s.Ano;

-- Perguntei se havia outra solução e ele retornou uma resposta bem interessante que já é um problema que venho pensando: como utilizar sub-consultas. 
-- gemini:"Você poderia usar uma subconsulta para primeiro contar os alunos e depois juntar esses resultados com as informações da tabela Seção."

	SELECT
		s.id_Seção,
		s.id_Curso,
		s.Semestre,
		s.Ano,
		alunos_por_secao.Num_Alunos
	FROM
		Seção AS s
	INNER JOIN
		(
		    SELECT
		        id_Seção,
		        COUNT(id_Seção) AS Num_Alunos
		    FROM
		        Grade
		    GROUP BY
		        id_Seção
		) AS alunos_por_secao
		ON s.id_Seção = alunos_por_secao.id_Seção
	WHERE
		s.Professor = 'King';
