*** Settings ***
Documentation    Arquivo responsavel pelas importacoes, variaveis e KeyWords
Library          SeleniumLibrary

*** Variables ***
${URL}    https://hypeflame.blog/

*** Keywords ***
Abrir o navegador
    Open Browser    browser=Chrome

Fechar o navegador
    Close Browser

Capturar evidência
    Capture Page Screenshot

Dado que acesso a página home do site HypeFlame
    Go To    ${URL}

Quando insiro o nome do artigo "${artigo}" no campo de pesquisa
    Wait Until Element Is Visible       //*[@id="header-search"]
    Click Element                       //*[@id="header-search"]    
    Input Text                          //*[@type="search"]    ${artigo}
    Click Element                       //*[@id="search-container"]/form/button

Então o artigo deve ser listado no site
    Wait Until Element Is Visible       //*[@id="post-689"]/a/img
    Element Should Be Visible           //*[@id="post-689"]/a/img

Quando insiro o nome "${artigo_i}" no campo de pesquisa
    Wait Until Element Is Visible       //*[@id="header-search"]
    Click Element                       //*[@id="header-search"]    
    Input Text                          //*[@type="search"]    ${artigo_i}
    Click Element                       //*[@id="search-container"]/form/button

Então a página deve apresentar a mensagem "${mensagem}"
    Wait Until Element Is Visible       //*[@id="main"]/section/header/h1
    Element Text Should Be              //*[@id="main"]/section/header/h1    ${mensagem}