*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${Url}    https://www.amazon.com.br/
${Menu_Eletronicos}             //a[contains(@data-csa-c-content-id,'nav_cs_electronics')]   
${Checar_Frase}                 //h1[contains(.,'Eletrônicos e Tecnologia')]
${Checar_Categoria}             //img[@src='https://images-na.ssl-images-amazon.com/images/G/32/BR-hq/2021/img/Consumer_Electronics/Storefronts/Electronics/956.Storefront_categoria_computadores_icons_240x270.jpg']
${Digitar_Nome}                 id=twotabsearchtextbox
${Botão_De_Pesquisa}            id=nav-search-submit-button
${Botão_Adicionar_Carrinho}     id=add-to-cart-button 
${Botão_IrParaCarrinho}         //a[contains(.,'Ir para o carrinho')]
${Produto_}
 
 
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


Adicionar o produto "Xbox Series X|S" no carrinho
    Click Element    locator=(//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'Seagate Storage Expansion Card for Xbox Series X|S 1TB Solid State Drive - NVMe Expansion SSD for Xbox Series X|S (STJR1000400)')])[1]
    Click Element    locator=${Botão_Adicionar_Carrinho}
    Click Element    locator=${Botão_IrParaCarrinho}

Verificar se o produto "Xbox Series X|S" foi adicionado com sucesso
    Wait Until Element Contains    locator=//span[@class='a-truncate-cut']    text=Seagate Storage Expansion Card for Xbox Series X|S 1TB Solid State Drive - NVMe Expansion SSD for Xbox Series X|S (STJR1000400)

Remover o produto "Xbox Series X|S" do carrinho
    Click Element    locator=//input[contains(@value,'Excluir')]

Verificar se o carrinho fica vazio
    Wait Until Element Contains     locator=//h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'Seu carrinho de compras da Amazon está vazio.')]        text=Seu carrinho de compras da Amazon está vazio.

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

#GHERKIN STEPS CASE 03

E adicionar o produto "Xbox Series X|S" no carrinho
    Adicionar o produto "Xbox Series X|S" no carrinho
Então o produto "Xbox Series X|S" deve ser mostrado no carrinho
    Verificar se o produto "Xbox Series X|S" foi adicionado com sucesso

#GHERKIN STEPS CASE 04

E existe o produto "Xbox Series X|S" no carrinho
    Verificar se o produto "Xbox Series X|S" foi adicionado com sucesso
Quando remover o produto "Xbox Series X|S" do carrinho
    Remover o produto "Xbox Series X|S" do carrinho
Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio