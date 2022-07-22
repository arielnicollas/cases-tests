*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${url}    https://www.amazon.com.br/
${Vendas_Amazon}      //a[@href='/gp/browse.html?node=17877554011&ref_=nav_cs_sell'][contains(.,'Venda na Amazon')]   
${TEXTO_HEADER_VENDAS}     Comece a vender na Amazon 
${VISIBLE_VENDAS_AMAZON}    //a[@href='/gp/browse.html?node=17877554011&ref_=nav_cs_sell'][contains(.,'Venda na Amazon')]    


*** Keywords ***

Abrir o navegador
    Open Browser     browser=chrome
    Maximize Browser Window
 
Fechar o navegador
    Close Browser

Acessar a home page do site Amazon.com.br 
    Go To    url=${url}
    
Entrar no menu "Vendas Amazon"
    Click Element    locator=${Vendas_Amazon}

Verificar se aparece a frase "Vendas Amazon"
    Wait Until Page Contains    text=${TEXTO_HEADER_VENDAS}
    Wait Until Element Is Visible    locator=${VISIBLE_VENDAS_AMAZON}

    