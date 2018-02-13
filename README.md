# Por que escolhi o Robot Framework?

* Por ser um framework genérico, é possível automatizar as soluções WEB junto com as de API.

* Fácil de Instalar. 

* Está sendo fácil aprender a usá-lo, pois é muito intuitivo. Você escreve e implementa seus testes por keyword-driven (mais alto nível), o que facilita e muito quem não está acostumado com linguagens de programação.
 
* A documentação é acessível e fácil de compreender. Tanto o Robot, quanto as libraries, vêm junto com uma boa documentação de keywords.
 
* É possivel implantar BDD sem nenhum esforço extra, basta seguir o modelo de escrita das keywords em Gherkin.
 
* É possível gerar documentação a partir dos casos de teste escritos nele através do testdoc e publicar em documentações com o uso do Sphinx, por exemplo.
 
* Os LOGs e REPORTS que ele gera são suficientemente detalhados e organizados. São criados em .html a parte e com opções de customização.
 
* Fácil de rodar por linha de comando e a documentação sobre isso é bem disponível também.
 
* Você usa o editor ou uma IDE de preferência, desde que tenha plug-in, para escrever seus testes.
 
* É multiplataforma, roda no windows, linux, MAC. Inclusive em containers docker.
 
* É possivel criar recursos em Python e vincular como library no Robot.
 
* Comunidade ativa.


# Instalação Linux (Ubuntu)
**Install Python 2.7**
* sudo apt-get install python2.7

**Install pip**
* sudo apt-get install python-pip

**Install Robot Framework**
* sudo pip install robotframework

**Install Selenium2Library**
* sudo pip install robotframework-selenium2library

**Geckodriver**
* wget https://github.com/mozilla/geckodriver/releases/download/v0.11.1/geckodriver-v0.11.1-linux64.tar.gz
* tar -xvzf geckodriver-v0.11.1-linux64.tar.gz
* rm geckodriver-v0.11.1-linux64.tar.gz
* chmod +x geckodriver
* cp geckodriver /usr/local/bin/


# Passo a Passo para executar os testes
* Acessar diretorio "~/ecommerce/Compra_Submarino.robot" via terminal e executar o comando "robot Compra_Submarino.robot"


