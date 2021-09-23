*** Settings ***
Documentation       teste case web
Resource            resource_web.robot
Suite Setup         Abrir o navegador
Suite Teardown      Fechar o navegador
Test Teardown       Capturar evidência

*** Test Cases ***
Cenario 1: Pesquisar artigo existente
    Dado que acesso a página home do site HypeFlame
    Quando insiro o nome do artigo "Introdução ao clean code" no campo de pesquisa
    Então o artigo deve ser listado no site

Cenario 2: Pesquisar artigo inexistente
    Dado que acesso a página home do site HypeFlame 
    Quando insiro o nome "artigo inexistente" no campo de pesquisa
    Então a página deve apresentar a mensagem "Nenhum resultado"