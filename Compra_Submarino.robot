*** Settings ***
Resource        Resource.robot
#Suite Teardown  Run Keywords    Signout Submarino    AND    Close Browser
*** Test Cases ***



Remover Produto Do Carrinho
    [Setup]  Fazer Login No Submarino
    [Teardown]  close browser
    Pesquisar Pelo Produto    Motor 4 Tempos Diesel Refrigerado Á Água 402cc Tdw
    Remover Produto Do Carrinho
    Signout Submarino
    capture page screenshot



Simular Pagamento Com Cartao De Credito Com 1 Produto No Carrinho
    [Setup]     Fazer Login No Submarino
    [Teardown]  close browser

    Pesquisar Pelo Produto    Motor 4 Tempos Diesel Refrigerado Á Água 402cc Tdw
    Adicionar 1 Produto No Carrinho
    Selecionar Cartao De Credito Como Forma de Pagamento
    Signout Submarino

Simular Pagamento Com Cartao De Credito Com 2 Produtos No Carrinho
    [Setup]     Fazer Login No Submarino
    [Teardown]  close browser

    Pesquisar Pelo Produto    Motor 4 Tempos Diesel Refrigerado Á Água 402cc Tdw
    Adicionar 2 Produto No Carrinho
    Selecionar Cartao De Credito Como Forma de Pagamento
    Limpar Carrinho
    Signout Submarino


