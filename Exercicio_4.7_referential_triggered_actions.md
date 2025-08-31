1. Tabela BOOK e BOOK_AUTHORS

    Restrição: *BOOK_AUTHORS* referencia a chave primária Book_id da tabela *BOOK*.

    Cenário (ON DELETE): O que acontece se um livro for excluído da tabela BOOK?

        Ação: ON DELETE CASCADE.

        Justificativa: Se um livro deixa de existir, suas informações de autoria na tabela BOOK_AUTHORS se tornam irrelevantes. A exclusão em cascata garante que esses dados órfãos sejam removidos automaticamente, mantendo o banco de dados limpo e consistente.

    Cenário (ON UPDATE): O que acontece se o Book_id de um livro for alterado na tabela BOOK?

        Ação: ON UPDATE CASCADE.

        Justificativa: A alteração do Book_id na tabela BOOK deve ser refletida automaticamente na tabela BOOK_AUTHORS. A ação CASCADE atualiza o valor da chave estrangeira, garantindo que o relacionamento entre as tabelas não seja quebrado.

2. Tabela BOOK e BOOK_COPIES

    Restrição: BOOK_COPIES referencia a chave primária Book_id da tabela BOOK.

    Cenário (ON DELETE): O que acontece se um livro for excluído da tabela BOOK?

        Ação: ON DELETE RESTRICT (ou REJECT).

        Justificativa: Não faz sentido excluir um livro se ainda existem cópias dele registradas. A ação RESTRICT impede essa operação, forçando o usuário a remover primeiro as cópias do livro. Isso é vital para a integridade do inventário.

    Cenário (ON UPDATE): O que acontece se o Book_id de um livro for alterado na tabela BOOK?

        Ação: ON UPDATE CASCADE.

        Justificativa: A modificação do Book_id na tabela BOOK deve ser refletida na tabela BOOK_COPIES para manter a integridade referencial. CASCADE garante que todas as cópias de um livro "mudem de identificador" junto com o livro original.

3. Tabela BOOK e BOOK_LOANS

    Restrição: BOOK_LOANS referencia a chave primária Book_id da tabela BOOK.

    Cenário (ON DELETE): O que acontece se um livro for excluído da tabela BOOK?

        Ação: ON DELETE RESTRICT.

        Justificativa: A exclusão de um livro que está atualmente emprestado (com registros em BOOK_LOANS) pode causar a perda do histórico de empréstimos e gerar inconsistência nos dados. RESTRICT impede essa operação, assegurando que o registro de empréstimo permaneça intacto.

    Cenário (ON UPDATE): O que acontece se o Book_id de um livro for alterado na tabela BOOK?

        Ação: ON UPDATE CASCADE.

        Justificativa: A alteração do Book_id deve ser propagada para a tabela BOOK_LOANS para que o registro de empréstimo continue associado ao livro correto. A ação CASCADE é a mais apropriada para manter essa coerência.

4. Tabela PUBLISHER e BOOK

    Restrição: BOOK referencia a chave primária Name da tabela PUBLISHER.

    Cenário (ON DELETE): O que acontece se um editor for excluído da tabela PUBLISHER?

        Ação: ON DELETE SET NULL.

        Justificativa: Se um editor for excluído, os livros publicados por ele não devem ser removidos do sistema. A ação SET NULL define o campo Publisher_name dos livros associados como nulo, preservando os registros dos livros e indicando que a editora não está mais disponível.

    Cenário (ON UPDATE): O que acontece se o nome de um editor for alterado na tabela PUBLISHER?

        Ação: ON UPDATE CASCADE.

        Justificativa: A alteração do nome de uma editora (que é a chave primária) deve ser refletida em todos os registros de livros que a referenciam. CASCADE garante que o novo nome do editor seja propagado para a coluna Publisher_name da tabela BOOK, evitando referências quebradas.

5. Tabela BORROWER e BOOK_LOANS

    Restrição: BOOK_LOANS referencia a chave primária Card_no da tabela BORROWER.

    Cenário (ON DELETE): O que acontece se um leitor for excluído da tabela BORROWER?

        Ação: ON DELETE RESTRICT.

        Justificativa: A exclusão de um leitor que tem livros emprestados (registros em BOOK_LOANS) é inaceitável, pois perderíamos informações importantes sobre quem está com os livros e quando devem ser devolvidos. RESTRICT impede essa exclusão.

    Cenário (ON UPDATE): O que acontece se o Card_no de um leitor for alterado na tabela BORROWER?

        Ação: ON UPDATE CASCADE.

        Justificativa: Para manter a integridade, a alteração do número do cartão de um leitor deve ser propagada para todos os registros de empréstimos associados a ele. CASCADE realiza essa atualização automaticamente.

6. Tabela LIBRARY_BRANCH e BOOK_COPIES

    Restrição: BOOK_COPIES referencia a chave primária Branch_id da tabela LIBRARY_BRANCH.

    Cenário (ON DELETE): O que acontece se uma filial da biblioteca for excluída da tabela LIBRARY_BRANCH?

        Ação: ON DELETE RESTRICT.

        Justificativa: A exclusão de uma filial enquanto ela ainda tem cópias de livros registradas pode ser problemática. RESTRICT é a ação mais segura, pois exige que o usuário remova as cópias de livros da filial antes de excluí-la, garantindo que nenhum dado de inventário seja perdido.

    Cenário (ON UPDATE): O que acontece se o Branch_id de uma filial for alterado na tabela LIBRARY_BRANCH?

        Ação: ON UPDATE CASCADE.

        Justificativa: A mudança do identificador de uma filial deve ser refletida nas informações de cópias de livros para que o inventário continue associado à filial correta. A ação CASCADE é ideal aqui.

7. Tabela LIBRARY_BRANCH e BOOK_LOANS

    Restrição: BOOK_LOANS referencia a chave primária Branch_id da tabela LIBRARY_BRANCH.

    Cenário (ON DELETE): O que acontece se uma filial for excluída da tabela LIBRARY_BRANCH?

        Ação: ON DELETE RESTRICT.

        Justificativa: Excluir uma filial com empréstimos pendentes causaria uma séria perda de informações. RESTRICT impede essa operação, garantindo que o histórico de empréstimos e os dados de devolução sejam mantidos intactos.

    Cenário (ON UPDATE): O que acontece se o Branch_id de uma filial for alterado na tabela LIBRARY_BRANCH?

        Ação: ON UPDATE CASCADE.

        Justificativa: A atualização do Branch_id deve ser propagada para a tabela BOOK_LOANS para que os registros de empréstimos continuem associados à filial correta. CASCADE é a escolha lógica para manter a consistência.
