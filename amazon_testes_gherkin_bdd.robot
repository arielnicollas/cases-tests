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
    Dado que estou na home page do site Amazon.com.br

    Quando acessar o menu "Eletronicos"

    Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br" 

    E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    
    E a categoria "Computadores e Informática" deve ser exibida na página


Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]         Esse teste vrifica a busca de um produto 
    [Tags]                  busca_produtos  lista_busca
    Dado que estou na home page do site Amazon.com.br

    Quando pesquisar pelo produto "Xbox Series S"

    E clicar no botão de pesquisa

    Então verifique o resultado da pesquisa se está listando o produto "Console Xbox Series S"

    