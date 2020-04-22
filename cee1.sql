/* Roda no postgres*/
/* este o float é double precision  */

/* criar o Banco de dados */
create database cee 

/* usar o banco de dados */ 
use cee

-- criar a tabela usuario
CREATE TABLE usuario
( id INT not null primary key,
cpf CHAR (11),
nome VARCHAR (50),
telefone VARCHAR(20),
email VARCHAR(50),
hash_senha VARCHAR(70),
recebe_produto boolean,
tipo CHAR(1),
id_perfil INT,
id_endereco INT)

-- criar a tabela endereco
CREATE TABLE endereco
(id INT not null primary key,
cep CHAR(8),
logradouro VARCHAR(30),
complemento VARCHAR(50),
bairro VARCHAR(50),
localidade VARCHAR(50),
uf CHAR (2)
)

-- criar a tabela perfil
CREATE TABLE perfil
(id INT not null primary key,
perfil VARCHAR(13)
)

--adicionando id endereco em usuario
ALTER TABLE usuario
add CONSTRAINT fk_id_endereco FOREIGN KEY (id_endereco)
REFERENCES endereco (id)

--adicionando id perfil em usuario
ALTER TABLE usuario
ADD CONSTRAINT fk_id_perfil FOREIGN KEY (id_perfil)
REFERENCES perfil (id)

-- criar tabela produto
CREATE TABLE produto
(id INT NOT NULL PRIMARY KEY,
descricao VARCHAR(50),
valor money,
peso double precision,
marca VARCHAR(30),
qtd_estoque INT,
garantia_anos INT,
id_fornecedor INT,
id_tipo_produto INT
)

--adicionar id_fornecedor de usuario
ALTER TABLE produto
ADD CONSTRAINT fk_id_fornecedor FOREIGN KEY (id_fornecedor)
REFERENCES usuario (id)

--criar tabela tipo_produto
CREATE TABLE tipo_produto
(id INT not null primary key,
tipo VARCHAR(20))

--adicionar id_tipo_produto em produto
ALTER TABLE produto
ADD CONSTRAINT fk_tipo_produto FOREIGN KEY (id_tipo_produto)
REFERENCES tipo_produto (id)

-- criar tabela orcamento
CREATE TABLE orcamento
(id INT NOT NULL PRIMARY KEY,
id_cliente INT,
data_pedido date,
previsao_entrega date,
valor_instacao money,
valor_total money
)

ALTER TABLE orcamento
ADD CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente)
REFERENCES usuario (id)

CREATE TABLE itens_orcamento
(id INT NOT NULL primary key,
id_orcamento INT,
id_produto INT,
qtd INT,
frete money,
valor money)

--adicionar id_orcamento e itens orcamento
ALTER TABLE itens_orcamento
ADD CONSTRAINT fk_id_orcamento FOREIGN KEY (id_orcamento)
REFERENCES orcamento (id)

--adicionar id_produto em itens_orcamento
ALTER TABLE itens_orcamento
ADD CONSTRAINT fk_id_produto FOREIGN KEY (id_produto)
REFERENCES produto (id)

--criar tabela instalacao
CREATE TABLE instalacao
(id INT not null primary key,
id_cliente int,
id_tecnico int,
id_orcamento int,
dia date)

--adicionar id_cliente em instalacao
ALTER TABLE instalacao 
ADD CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente)
REFERENCES usuario (id)

--adicionar id_tecnico em instalacao
ALTER TABLE instalacao 
ADD CONSTRAINT fk_id_tecnico FOREIGN KEY (id_tecnico)
REFERENCES usuario (id)

--adicionar id_orcamento em instalacao
ALTER TABLE instalacao 
ADD CONSTRAINT fk_id_orcamento FOREIGN KEY (id_orcamento)
REFERENCES orcamento (id)

--criar tabela inversor
CREATE TABLE inversor
(id_produto int NOT null primary key,
protecao boolean,
num_entradas INT,
num_saidas INT,
potencia INT,
tensao_min_por_entrada double precision,
tensao_max_por_entrada double precision,
corrente_min_por_entrada double precision,
corrente_max_por_entrada double precision,
tensao_min_saida double precision,
tensao_max_saida double precision,
corrente_min_saida double precision,
corrente_max_saida double precision,
potencia_por_saida INT,
frequencia_min INT,
frequencia_max INT,
largura double precision,
comprimento double precision,
profundidade double precision
)

--adicionar id_produto em inversor
ALTER TABLE inversor
ADD CONSTRAINT fk_id_produto FOREIGN KEY (id_produto)
REFERENCES produto (id)

--criar tabela painel_solar
CREATE TABLE painel_solar
(id_produto int NOT null primary key,
potencia double precision,
tensao_pico double precision,
corrente_pico double precision,
eficiencia double precision,
producao_mensal double precision,
material VARCHAR(50),
largura double precision,
comprimento double precision,
profundidade double precision
)

--adicionar id_produto em painel_solar
ALTER TABLE painel_solar
ADD CONSTRAINT fk_id_produto FOREIGN KEY (id_produto)
REFERENCES produto (id)

--criar tabela suporte_trilho
CREATE TABLE suporte_trilho
(id_produto int NOT null primary key,
id_tipo INT
)

CREATE TABLE tipo_suporte_trilho
(id INT NOT null primary key,
tipo VARCHAR(30))

--adicionar id_produto em suporte_trilho
ALTER TABLE suporte_trilho
ADD CONSTRAINT fk_id_produto FOREIGN KEY (id_produto)
REFERENCES produto (id)

--adicionar id_tipo em suporte_trilho
ALTER TABLE suporte_trilho
ADD CONSTRAINT fk_id_tipo FOREIGN KEY (id_tipo)
REFERENCES tipo_suporte_trilho (id)

--criar tabela trilho
CREATE TABLE trilho
(id_produto int NOT null primary key,
tamanho double precision
)

--adicionar id_produto em trilho
ALTER TABLE trilho
ADD CONSTRAINT fk_id_produto FOREIGN KEY (id_produto)
REFERENCES produto (id)

--criar tabela string_box
CREATE TABLE string_box
(id_produto int NOT null primary key,
num_entradas INT,
num_saidas INT,
tensao_min_por_entrada double precision,
tensao_max_por_entrada double precision,
corrente_min_por_entrada double precision,
corrente_max_por_entrada double precision,
protecao boolean,
largura double precision,
comprimento double precision,
profundidade double precision
)

--adicionar id_produto em string_box
ALTER TABLE string_box
ADD CONSTRAINT fk_id_produto FOREIGN KEY (id_produto)
REFERENCES produto (id)

--criar tabela fusivel
CREATE TABLE fusivel
(id_produto int NOT null primary key,
a INT
)

--adicionar id_produto em fusivel
ALTER TABLE fusivel
ADD CONSTRAINT fk_id_produto FOREIGN KEY (id_produto)
REFERENCES produto (id)

--criar tabela desjuntor
CREATE TABLE desjuntor
(id_produto int NOT null primary key,
a INT
)

--adicionar id_produto em desjuntor
ALTER TABLE desjuntor
ADD CONSTRAINT fk_id_produto FOREIGN KEY (id_produto)
REFERENCES produto (id)

--criar tabela bateria
CREATE TABLE bateria
(id_produto int NOT null primary key,
selada boolean,
tensao_min double precision,
tensao_max double precision,
capacidade_ah INT,
num_ciclos INT,
largura double precision,
comprimento double precision,
profundidade double precision
)

--adicionar id_produto em bateria
ALTER TABLE bateria
ADD CONSTRAINT fk_id_produto FOREIGN KEY (id_produto)
REFERENCES produto (id)

--criar tabela controlador_carga
CREATE TABLE controlador_carga
(id_produto int NOT null primary key,
tensao_max_entrada INT,
tensao_min_entrada INT,
tensao_max_saida INT,
tensao_min_saida INT,
tensao_max_sistema INT,
corrente_carga INT,
protecao boolean,
largura double precision,
comprimento double precision,
profundidade double precision
)

--adicionar id_produto em controlador_carga
ALTER TABLE controlador_carga
ADD CONSTRAINT fk_id_produto FOREIGN KEY (id_produto)
REFERENCES produto (id)

--criar tabela cabo
CREATE TABLE cabo
(id_produto int NOT null primary key,
bitola double precision,
tensao_max INT,
tamanho INT
)

--adicionar id_produto em cabo
ALTER TABLE cabo
ADD CONSTRAINT fk_id_produto FOREIGN KEY (id_produto)
REFERENCES produto (id)

--criar tabela parafuso
CREATE TABLE parafuso
(id_produto int NOT null primary key,
tipo VARCHAR(20),
tamanho INT
)

--adicionar id_produto em parafuso
ALTER TABLE parafuso
ADD CONSTRAINT fk_id_produto FOREIGN KEY (id_produto)
REFERENCES produto (id)