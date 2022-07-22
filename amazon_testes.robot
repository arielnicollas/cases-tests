*** Settings ***

Documentation        Esse suite testa o site da Amazon.com.r
Resource             amazon_resourses.robot           
Test Setup           Abrir o navegador
# Test Teardown        Fechar o navegador 

*** Test Cases ***

Caso de Teste 01 - Acesso ao menu "Vendas_Amazon"
    [Documentation]        Esse teste verificaa o menu eletrônicos do site da Amazon.com.br
    ...                    e verifica a categoria Computadores e Informática
    [Tags]                 menus categorias
    Acessar a home page do site Amazon.com.br 
    Entrar no menu "Vendas Amazon"
    Verificar se aparece a frase "Vendas Amazon"
    # Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"

#     Verificar se aparece a categoria "Computadores e Informática"


# Caso de Teste 02 - Pesquisa de um Produto
#     [Documentation]         Esse teste vrifica a busca de um produto 
#     [Tags]                  busca_produtos  lista_busca
#     Acessar a home page do site Amazon.com.br
#     Digitar o nome de produto "Xbox Series S" no campo de pesquisa
#     Clicar no botão de pesquisa
#     Verificar o resultad da pesquisa se está listando o produto pesquisando

    