*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${Url}    https://www.amazon.com.br/
${Menu_Eletronicos}         //a[contains(@data-csa-c-content-id,'nav_cs_electronics')]   
${Checar_Frase}            //h1[contains(.,'Eletrônicos e Tecnologia')]
${Checar_Categoria}        //img[@src='https://images-na.ssl-images-amazon.com/images/G/32/BR-hq/2021/img/Consumer_Electronics/Storefronts/Electronics/956.Storefront_categoria_computadores_icons_240x270.jpg']
${Digitar_Nome}            id=twotabsearchtextbox
${Botão_De_Pesquisa}       id=nav-search-submit-button 
 
        
*** Keywords ***

Abrir o navegador
    Open Browser     browser=chrome
    Maximize Browser Window
 
Fechar o navegador
    Close Browser

Acessar a home page do site Amazon.com.br 
    Go To    url=${Url}

Verificar o título da home page "${TITULO}"  
    Title Should Be    title=${TITULO}
    
Entrar no menu "Eletronicos"
    Click Element    locator=${Menu_Eletronicos}

Verificar se o título da página fica "${Titulo}"
    Title Should Be    title=${Titulo}

Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Element Should Be Visible     locator=${Checar_Frase}  

Verificar se aparece a categoria "Computadores e Informática"
   Wait Until Element Is Visible    locator=${Checar_Categoria}   

Digitar o nome de produto "${Produto}" no campo de pesquisa
    Input Text    locator=${Digitar_Nome}    text=${Produto}

Clicar no botão de pesquisa
    Click Element    locator=${Botão_De_Pesquisa} 

Verificar o resultado da pesquisa se está listando o produto "${Produto}"
    Wait Until Element Is Visible     locator=(//span[contains(.,'${Produto}')])[2]


# GHERKIN STEPS

Dado que estou na home page do site Amazon.com.br 
    Acessar a home page do site Amazon.com.br 

Quando acessar o menu "Eletronicos"
    Entrar no menu "Eletronicos"

Então o título da página deve ficar "${Titulo}"
    Verificar se o título da página fica "${Titulo}"    

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"


#GHERKIN STEPS CASE 02

Quando pesquisar pelo produto "${Produto}"
    Digitar o nome de produto "${Produto}" no campo de pesquisa

E clicar no botão de pesquisa
    Clicar no botão de pesquisa
    
Então verifique o resultado da pesquisa se está listando o produto "${Produto}"
    Verificar o resultado da pesquisa se está listando o produto "${Produto}"