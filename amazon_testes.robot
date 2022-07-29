*** Settings ***

Documentation        Esse suite testa o site da Amazon.com.br
Resource             amazon_resourses.robot           
Test Setup           Abrir o navegador
# Test Teardown      Fechar o navegador 

*** Test Cases ***

Caso de Teste 01 - Acesso ao menu "Eletronicos"
    [Documentation]        Esse teste verifica o menu eletrônicos do site da Amazon.com.br
    ...                    e verifica a categoria Computadores e Informática
    [Tags]                 menus categorias
    Acessar a home page do site Amazon.com.br 

    Verificar o título da home page "Amazon.com.br | Tudo pra você, de A a Z." 

    Entrar no menu "Eletronicos"

    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br" 

    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    
    Verificar se aparece a categoria "Computadores e Informática"


Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]         Esse teste vrifica a busca de um produto 
    [Tags]                  busca_produtos  lista_busca
     Acessar a home page do site Amazon.com.br

     Digitar o nome de produto "Xbox Series S" no campo de pesquisa

     Clicar no botão de pesquisa

     Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Acessar a home page do site Amazon.com.br

    Digitar o nome de produto "Xbox Series X|S" no campo de pesquisa

    Clicar no botão de pesquisa

    Verificar o resultado da pesquisa se está listando o produto "Xbox Series X|S"

    Adicionar o produto "Xbox Series X|S" no carrinho

    Verificar se o produto "Xbox Series X|S" foi adicionado com sucesso

Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Acessar a home page do site Amazon.com.br

    Digitar o nome de produto "Xbox Series S" no campo de pesquisa

    Clicar no botão de pesquisa

    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"

    Adicionar o produto "Xbox Series X|S" no carrinho

    Verificar se o produto "Xbox Series X|S" foi adicionado com sucesso

    Remover o produto "Console Xbox Series S" do carrinho

    Verificar se o carrinho fica vazio    