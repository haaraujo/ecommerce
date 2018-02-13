*** Settings ***
Library     Selenium2Library

*** Variable ***
${BROWSER}                   chrome
${URL}                       https://cliente.submarino.com.br/simple-login/?next=https%3A%2F%2Fwww.submarino.com.br%2F
${BOTAO_LUPA}                //*[@id="h_search-btn"]
${CAMPO_PESQUISAR}           //*[@id="h_search-input"]
${LINK_POST}                 //*[@id='Blog1']/div[1]/article/div/div/h3/a
${TITULO}                    //*[@id='Blog1']/div/article/div[1]/div/h3
${USUARIO}                   //*[@id='email-input']
${SENHA}                     //*[@id='password-input']
${MINHA_CONTA}               //span[@class="usr-act-text" and text()="Minha conta"]
${ENTRAR}                    //*[@id='h_usr-signin']
${BOTAO_LOGIN}               css=#login-button
${PRODUTO}                   //h1[@data-reactid="86"]
${TITULO_PRODUTO}            //div[@class='product-name' and contains(text(), "$")]
${BOTAO_COMPRAR}             xpath=//*[@id='btn-buy']
${BOTAO_CONTINUAR_COMPRA}    //*[@id="btn-continue"]
${QUANTIDADE}                //select[@class="form-control select__quantity"]
${MODO_PAGAMENTO}            //*[@id="payment-option-menu-'$'"]/a/span[2]
${BOTAO_COMPRAR_2}           //*[@id="buy-button"]
${TABLE_PAGAMENTOS}          //ul[@class="list-unstyled tabs-payment-options col-sm-12 active"]
${CREDIT_CARD_NUMBER}        //*[@id="creditCard-cardNumber"]
${CREDIT_CARD_NAME}          //*[@id="creditCard-nameOnCard"]
${HOME}                      https://www.submarino.com.br
${CART}                      //span[@class="crt-quantity" and text()='$']
${RETIRAR_PRODUTO}           css=.hidden-xs .button--link
${USR_SIGNOUT}               //a[@class="usr-signout"]
${CART_QTD_ICON}             //span[@class="crt-quantity"]
${VER_CARRINHO}              //a[@innerstringmarker="Ver meu carrinho"]
${CART_VAZIO}                //div[#'crt-box']/span[@innertext='Seu carrinho está vazio']
${BOTAO_PAGAR_CARTAO}        //button[@id="payment-credit-card"]
${CESTA_VAZIA_MSG}           //div[@id='app']/section[@class='container page-content']//h2[.='Sua cesta está vazia']
${MSG_LOGIN}                 css=.usr-nick

*** Keywords ***
Fazer Login No Submarino
    Open Browser    ${URL}    ${BROWSER}
    Wait Until Keyword Succeeds      5x    2s    Wait Until Element Is Visible   ${USUARIO}
    Wait Until Keyword Succeeds      5x    2s    Wait Until Element Is Visible   ${SENHA}
    Wait Until Keyword Succeeds      5x    2s    Wait Until Element Is Visible   ${BOTAO_LOGIN}
    Wait Until Keyword Succeeds      5x    2s    Input Text    ${USUARIO}    robotframework18@gmail.com
    Wait Until Keyword Succeeds      5x    2s    Input Text    ${SENHA}    Robot2018
    Wait Until Keyword Succeeds      5x    2s    Click Element    ${BOTAO_LOGIN}
    Wait Until Keyword Succeeds      5x    2s    Wait Until Element Is Visible    ${MSG_LOGIN}


Pesquisar Pelo Produto
    [Arguments]     ${BUSCA}
    Wait Until Keyword Succeeds      5x    2s    Wait Until Element Is Visible  ${CAMPO_PESQUISAR}
    Wait Until Keyword Succeeds      5x    2s    Input Text    ${CAMPO_PESQUISAR}    ${BUSCA}
    Wait Until Keyword Succeeds      5x    2s    Wait Until Element Is Visible    ${BOTAO_LUPA}
    Wait Until Keyword Succeeds      5x    2s    Click Element    ${BOTAO_LUPA}


Adicionar ${QUANTIDADE_VALUE} Produto No Carrinho

    Wait Until Keyword Succeeds      5x    2s    Wait Until Element Is Visible    ${PRODUTO}
    Wait Until Keyword Succeeds      5x    2s    Click Element    ${PRODUTO}
    Wait Until Keyword Succeeds      5x    2s    Wait Until Element Is Visible    ${BOTAO_COMPRAR}
    Wait Until Keyword Succeeds      5x    2s    Click Element    ${BOTAO_COMPRAR}
    Wait Until Keyword Succeeds      5x    2s    Select From List    ${QUANTIDADE}    ${QUANTIDADE_VALUE}
    #Wait Until Keyword Succeeds    3x   1s      ELEMENT SHOULD BE VISIBLE   ${BOTAO_CONTINUAR_COMPRA}
    #Run Keyword If  ${status} == True    Click Element    ${BOTAO_CONTINUAR_COMPRA}

Selecionar ${TIPO_PAGAMENTO} Forma De Pagamento
    Wait Until Keyword Succeeds      5x    2s    Click Element    ${BOTAO_COMPRAR_2}
    Wait Until Keyword Succeeds      5x    2s    Wait Until Element Is Visible    ${TABLE_PAGAMENTOS}
    Run Keyword If    '${TIPO_PAGAMENTO}' == 'Cartao De Credito'     Click Element    ${MODO_PAGAMENTO}    CREDIT_CARD
    Wait Until Keyword Succeeds      5x    2s    Wait Until Element Is Visible    ${CREDIT_CARD_NUMBER}
    Wait Until Keyword Succeeds      5x    2s    Input Text    ${CREDIT_CARD_NUMBER}    1234567489878979
    Wait Until Keyword Succeeds      5x    2s    Wait Until Element Is Visible    ${BOTAO_PAGAR_CARTAO}
    Wait Until Keyword Succeeds      5x    2s    Click Element    ${BOTAO_PAGAR_CARTAO}
    Wait Until Keyword Succeeds      5x    2s    Wait Until Element Is Visible    //*[@class='form-group ng-scope']//p[.=' Número de cartão inválido ']

Remover Produto Do Carrinho
    Wait Until Keyword Succeeds      5x    2s    Wait Until Element Is Visible    ${PRODUTO}
    Wait Until Keyword Succeeds      5x    2s    Click Element    ${PRODUTO}
    Wait Until Keyword Succeeds      5x    2s    Wait Until Element Is Visible    ${BOTAO_COMPRAR}
    Wait Until Keyword Succeeds      5x    2s    Click Element    ${BOTAO_COMPRAR}
    Wait Until Keyword Succeeds      5x    2s    Select From List    ${QUANTIDADE}    1
    Wait Until Keyword Succeeds      5x    2s    Click Element    ${RETIRAR_PRODUTO}
    Wait Until Keyword Succeeds      10x   2s    Wait Until Element Is Visible   ${CESTA_VAZIA_MSG}

Limpar Carrinho
    Go To    ${HOME}
    Wait Until Keyword Succeeds      3x    2s    Wait Until Element Is Visible    ${CART_QTD_ICON}
    Wait Until Keyword Succeeds      3x    2s    Click Element    ${CART_QTD_ICON}
    Wait Until Keyword Succeeds      5x    2s    Click Element     //*[@id="crt-box"]/div/a[1]
    Wait Until Keyword Succeeds      5x    2s    Click Element    ${RETIRAR_PRODUTO}
    Wait Until Keyword Succeeds      5x    2s    Click Element    ${RETIRAR_PRODUTO}
    Wait Until Keyword Succeeds      5x    2s    Click Element    ${RETIRAR_PRODUTO}


Signout Submarino

    Go To    ${HOME}
    Sleep    5s
    Run Keywords     Wait Until Keyword Succeeds      10x    2s    Click Element    ${MINHA_CONTA}
              ...    AND     Wait Until Keyword Succeeds      3x    1s    Click Element    ${USR_SIGNOUT}
    Go To    ${HOME}
