-- Esse Script e responsavel por criar as tabelas do Banco de dados Relacional e estabelecer suas restricoes.
-- Disponivel em https://github.com/ClubeProgramacaoSSA/Programing-Club-Relational-Database
    -- Made by:
        --Adrian WIDmer | GitHub: https://github.com/Awi-24
        --Antonio Horácio Magalhaes | GitHub: https://github.com/antoniohoracio77
        --Fernando Antonio Marques Schettini | GitHub: https://github.com/FernandoSchett
        --João Pedro Moreira de Almeida Santos | GitHub: https://github.com/joao7878
        --Orlando Mota Pires | GitHub: https://github.com/orlandomotapires



-- 1
CREATE TABLE TB_assunto(
    ID_assunto INT NOT NULL,
    assunto VARCHAR(100)
);

-- 2 
CREATE TABLE TB_assunto_encontro(
    ID_assunto_encontro INT NOT NULL,
    ID_assunto INT NOT NULL,
    ID_encontro INT NOT NULL
);

-- 3 
CREATE TABLE TB_assunto_projeto(
    ID_assunto_projeto INT NOT NULL,
    ID_assunto INT NOT NULL,
    ID_projeto INT NOT NULL
);

-- 4
CREATE TABLE TB_assunto_questao(
    ID_assunto_questao INT NOT NULL,
    ID_assunto INT NOT NULL,
    ID_questao INT NOT NULL,
    pontos_jpq_maximo INT
);

-- 5
CREATE TABLE TB_categoria_imagem(
    ID_categoria_imagem INT NOT NULL,
    nome VARCHAR(50) UNIQUE
); 

-- 6
CREATE TABLE TB_capitao(
    ID_capitao INT NOT NULL,
    ID_membro INT NOT NULL,
    nome_capitao VARCHAR(50) NOT NULL
);

-- 7
CREATE TABLE TB_cargo_membro(
    ID_cargo_membro INT NOT NULL,
    ID_cargo INT NOT NULL,
    ID_membro INT NOT NULL, 
    DT_entrada_cargo DATE NOT NULL,
    DT_saida_cargo DATE,
    pontos_jpq_maximo INT
);

-- 8
CREATE TABLE TB_cidade(
    ID_cidade INT NOT NULL,
    ID_estado INT NOT NULL,
    nome VARCHAR(50) NOT NULL
);

-- 9
CREATE TABLE TB_comite_organizador(
    ID_comite_organizador INT NOT NULL,
    ID_evento INT NOT NULL,
    ID_membro INT NOT NULL
);

CREATE TABLE TB_conta_clube(
    ID_conta_clube INT NOT NULL,
    ID_membro INT NOT NULL,
    login VARCHAR(100) NOT NULL,
    pontos_jpq INT NOT NULL,
    senha VARCHAR(500) NOT NULL
);

-- 10
CREATE TABLE TB_curso(
    ID_curso INT NOT NULL,
    nome VARCHAR(50) NOT NULL UNIQUE
);

-- 11
CREATE TABLE TB_curso_instituicao(
    ID_curso_instituicao INT NOT NULL,
    ID_curso INT NOT NULL,
    ID_instituicao INT NOT NULL
);

-- 12
CREATE TABLE TB_encontro(
    ID_encontro INT NOT NULL,
    ID_organizador INT NOT NULL,
    ID_projeto INT NOT NULL,
    DT_inicio DATE,
    DT_termino DATE
);

-- 13
CREATE TABLE TB_encontro_online(
    ID_encontro_online INT NOT NULL,
    ID_plataforma INT NOT NULL,
    ID_encontro INT NOT NULL
);

-- 14
CREATE TABLE TB_encontro_presencial(
    ID_encontro_presencial INT NOT NULL,
    ID_encontro INT NOT NULL,
    ID_local INT NOT NULL
);

-- 15
CREATE TABLE TB_equipe(
    ID_equipe INT NOT NULL,
    ID_capitao INT NOT NULL,
    DT_criacao DATE NOT NULL,
    nome VARCHAR(50) NOT NULL
);

-- 16
CREATE TABLE TB_equipe_torneio(
    ID_equipe_torneio INT NOT NULL,
    ID_equipe INT NOT NULL,
    ID_torneio INT NOT NULL,
    colocacao INT NOT NULL UNIQUE
);

-- 17
CREATE TABLE TB_equipe_torneio_fase(
    ID_equipe_torneio_fase INT NOT NULL,
    ID_equipe_torneio INT NOT NULL,
    ID_fase INT NOT NULL,
    colocacao_fase INT NOT NULL UNIQUE,
    pontos_jpq_maximo INT
);

-- 18
CREATE TABLE TB_estado(
    ID_estado INT NOT NULL,
    ID_pais INT NOT NULL,
    nome VARCHAR(50) NOT NULL
);

-- 19
CREATE TABLE TB_evento(
    ID_evento INT NOT NULL,
    ID_local INT NOT NULL,
    descricao VARCHAR(100),
    DT_inicio DATE,
    DT_fim DATE,
    nome VARCHAR(50) NOT NULL
);

-- 20
CREATE TABLE TB_fase(
    ID_fase INT NOT NULL,
    ID_torneio INT NOT NULL,
    numero INT NOT NULL,
    DT_inicio DATE NOT NULL,
    DT_fim DATE NOT NULL
);

-- 21
CREATE TABLE TB_fase_online(
    ID_fase_online INT NOT NULL,
    ID_fase INT NOT NULL,
    ID_plataforma INT NOT NULL
);

-- 22
CREATE TABLE TB_fase_presencial(
    ID_fase_presencial INT NOT NULL,
    ID_fase INT NOT NULL,
    ID_local INT NOT NULL
);

-- 23
CREATE TABLE TB_fase_questao_equipe(
    ID_fase_questao_equipe INT NOT NULL,
    ID_equipe_torneio_fase INT NOT NULL,
    ID_questao INT NOT NULL,
    ID_status INT NOT NULL, 
    numero_tentativas INT NOT NULL
);

-- 24
CREATE TABLE TB_funcao(
    ID_funcao INT NOT NULL,
    nome_funcao VARCHAR(50) NOT NULL,
    descricao_funcao VARCHAR(100) NOT NULL
);

-- 25
CREATE TABLE TB_grau_dificuldade(
    ID_grau_dificuldade INT NOT NULL,
    dificuldade VARCHAR(50) NOT NULL
);

-- 26
CREATE TABLE TB_imagem(
    ID_imagem INT NOT NULL,
    ID_categoria_imagem INT NOT NULL,
    descricao VARCHAR(100),
    imagem blob NOT NULL,
    nome VARCHAR(200),
    DT_imagem DATE
);

-- 27
CREATE TABLE TB_imagem_encontro(
    ID_imagem_encontro INT NOT NULL,
    ID_encontro INT NOT NULL,
    ID_imagem INT NOT NULL
);

-- 28
CREATE TABLE TB_imagem_projeto(
    ID_imagem_projeto INT NOT NULL,
    ID_imagem INT NOT NULL,
    ID_projeto INT NOT NULL
);

-- 29
CREATE TABLE TB_imagem_evento(
    ID_imagem_evento INT NOT NULL,
    ID_evento INT NOT NULL,
    ID_imagem INT NOT NULL  
);

-- 30
CREATE TABLE TB_instituicao_ensino(
    ID_instituicao_ensino INT NOT NULL,
    ID_logradouro INT NOT NULL,
    nome VARCHAR(50) NOT NULL
);

-- 31
CREATE TABLE TB_lider(
    ID_lider INT NOT NULL,
    ID_membro INT NOT NULL,
    nome_lider VARCHAR(50) NOT NULL
);

-- 32
CREATE TABLE TB_local(
    ID_local INT NOT NULL,
    ID_logradouro INT NOT NULL,
    descricao VARCHAR(50) NOT NULL,
    nome VARCHAR(50) NOT NULL
);    

-- 33
CREATE TABLE TB_logradouro(
    ID_logradouro INT NOT NULL,
    ID_cidade INT NOT NULL,
    nome VARCHAR(50)
);

-- 34
CREATE TABLE TB_membro(
    ID_membro INT NOT NULL,
    ID_curso_instituicao INT NOT NULL,
    ID_foto_membro INT NOT NULL,
    DT_nascimento DATE,
    DT_ingresso_clube DATE NOT NULL,
    DT_ingresso_faculdade DATE NOT NULL,
    genero CHAR(1) NOT NULL,
    login VARCHAR(50) NOT NULL,
    nome_membro VARCHAR(50) NOT NULL,
    oficio VARCHAR(50)
);

-- 35
CREATE TABLE TB_membro_equipe(
    ID_membro_equipe INT NOT NULL,
    ID_equipe INT NOT NULL,
    ID_membro INT NOT NULL
);

-- 36
CREATE TABLE TB_membro_projeto(
    ID_membro_projeto int NOT NULL,
    ID_membro INT NOT NULL,
    ID_projeto INT NOT NULL,
    ID_funcao INT NOT NULL,
    DT_entrada_projeto DATE NOT NULL,
    DT_saida_projeto DATE
);

-- 37
CREATE TABLE TB_movimentacao_ponto(
    ID_movimentacao_ponto INT NOT NULL,
    ID_conta_clube INT NOT NULL,
    ID_tipo_movimentacao_ponto INT NOT NULL,
    quantidade_pontos_jpq INT
);

-- 38
CREATE TABLE TB_movimentacao_ponto_cargo(
    ID_movimentacao_ponto_cargo INT NOT NULL,
    ID_cargo_membro INT NOT NULL,
    ID_movimentacao_ponto INT NOT NULL
);

-- 39
CREATE TABLE TB_movimentacao_ponto_evento(
    ID_movimentacao_ponto_evento INT NOT NULL,
    ID_movimentacao_ponto INT NOT NULL,
    ID_presenca_evento INT NOT NULL
);

-- 40
CREATE TABLE TB_movimentacao_ponto_projeto(
    ID_movimentacao_ponto_projeto INT NOT NULL,
    ID_movimentacao_ponto INT NOT NULL,
    ID_projeto INT NOT NULL,
    avaliacao_projeto VARCHAR(500)
);

-- 41
CREATE TABLE TB_movimentacao_ponto_questao(
    ID_movimentacao_ponto_questao INT NOT NULL,
    ID_movimentacao_ponto INT NOT NULL,
    ID_questao INT NOT NULL,
    avaliacao_questao VARCHAR(500) 
);

-- 42
CREATE TABLE TB_movimentacao_ponto_torneio(
    ID_movimentacao_ponto_torneio INT NOT NULL,
    ID_equipe_torneio_fase INT NOT NULL,
    ID_movimentacao_ponto INT NOT NULL
);

-- 43
CREATE TABLE TB_organizador(
    ID_organizador INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(50)
);

-- 44
CREATE TABLE TB_pais(
    ID_pais INT NOT NULL,
    nome VARCHAR(50)
);

-- 45
CREATE TABLE TB_presenca_encontro(
    ID_presenca_encontro INT NOT NULL,
    ID_encontro INT NOT NULL,
    ID_membro INT NOT NULL
);

-- 46
CREATE TABLE TB_presenca_evento(
    ID_presenca_evento INT NOT NULL,
    ID_membro INT NOT NULL,
    ID_evento INT NOT NULL,
    pontos_jpq_maximo INT 
);

-- 47
CREATE TABLE TB_procedencia_questao(
    ID_procedencia_questao INT NOT NULL,
    procedencia_questao VARCHAR (100) NOT NULL
);

-- 48
CREATE TABLE TB_projeto(
    ID_projeto INT NOT NULL,
    ID_tipo_projeto INT NOT NULL,
    ID_lider INT NOT NULL,
    descricao VARCHAR(100),
    DT_inicio DATE,
    DT_fim_previsto DATE,
    nome VARCHAR(50),
    pontos_jpq_maximo INT,
    URL_gitHub VARCHAR(100)
);

-- 49
CREATE TABLE TB_plataforma(
    ID_plataforma INT NOT NULL,
    URL_plataforma VARCHAR(100) NOT NULL UNIQUE,
    nome_plataforma VARCHAR(50) NOT NULL UNIQUE
);

-- 50
CREATE TABLE TB_questao( 
    ID_questao INT NOT NULL,
    ID_grau_dificuldade INT NOT NULL,
    enunciado VARCHAR(200) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    resposta_certa VARCHAR(500),
    pontos_jpq_maximo INT
);

-- 51
CREATE TABLE TB_status(
    ID_status INT NOT NULL,
    descricao VARCHAR(100) NOT NULL
);

-- 52
CREATE TABLE TB_tipo_movimentacao_ponto(
    ID_tipo_movimentacao_ponto INT NOT NULL,
    tipo_movimentacao_ponto VARCHAR (100) NOT NULL
);

-- 53
CREATE TABLE TB_tipo_projeto(
    ID_tipo_projeto INT NOT NULL,
    titulo VARCHAR(50) NOT NULL
);

-- 54
CREATE TABLE TB_torneio(
    ID_torneio INT NOT NULL,
    ID_organizador INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    DT_inicio DATE,
    DT_termino DATE
);


-- Criando as Sequencias necessarias para a construcao das chaves primarias das tabelas.
CREATE SEQUENCE SQ_assunto;
CREATE SEQUENCE SQ_assunto_encontro;
CREATE SEQUENCE SQ_assunto_projeto;
CREATE SEQUENCE SQ_assunto_questao;
CREATE SEQUENCE SQ_cargo_membro;
CREATE SEQUENCE SQ_categoria_imagem;
CREATE SEQUENCE SQ_capitao;
CREATE SEQUENCE SQ_cidade;
CREATE SEQUENCE SQ_conta_clube;
CREATE SEQUENCE SQ_comite_organizador;
CREATE SEQUENCE SQ_curso;
CREATE SEQUENCE SQ_curso_instituicao;
CREATE SEQUENCE SQ_encontro;
CREATE SEQUENCE SQ_encontro_online;
CREATE SEQUENCE SQ_encontro_presencial;
CREATE SEQUENCE SQ_equipe;
CREATE SEQUENCE SQ_equipe_torneio;
CREATE SEQUENCE SQ_equipe_torneio_fase;
CREATE SEQUENCE SQ_estado;
CREATE SEQUENCE SQ_evento;
CREATE SEQUENCE SQ_fase;
CREATE SEQUENCE SQ_fase_online;
CREATE SEQUENCE SQ_fase_presencial;
CREATE SEQUENCE SQ_fase_questao_equipe;
CREATE SEQUENCE SQ_funcao;
CREATE SEQUENCE SQ_grau_dificuldade;
CREATE SEQUENCE SQ_imagem;
CREATE SEQUENCE SQ_imagem_encontro;
CREATE SEQUENCE SQ_imagem_projeto;
CREATE SEQUENCE SQ_imagem_evento;
CREATE SEQUENCE SQ_instituicao_ensino;
CREATE SEQUENCE SQ_lider;
CREATE SEQUENCE SQ_local;
CREATE SEQUENCE SQ_logradouro;
CREATE SEQUENCE SQ_membro;
CREATE SEQUENCE SQ_membro_equipe;
CREATE SEQUENCE SQ_membro_projeto;
CREATE SEQUENCE SQ_movimentacao_ponto;
CREATE SEQUENCE SQ_movimentacao_ponto_cargo;
CREATE SEQUENCE SQ_movimentacao_ponto_evento;
CREATE SEQUENCE SQ_movimentacao_ponto_projeto;
CREATE SEQUENCE SQ_movimentacao_ponto_questao;
CREATE SEQUENCE SQ_movimentacao_ponto_torneio;
CREATE SEQUENCE SQ_organizador;
CREATE SEQUENCE SQ_pais;
CREATE SEQUENCE SQ_presenca_evento;
CREATE SEQUENCE SQ_procedencia_questao;
CREATE SEQUENCE SQ_presenca_encontro;
CREATE SEQUENCE SQ_projeto;
CREATE SEQUENCE SQ_plataforma;
CREATE SEQUENCE SQ_questao;
CREATE SEQUENCE SQ_status;
CREATE SEQUENCE SQ_tipo_movimentacao_ponto;
CREATE SEQUENCE SQ_tipo_projeto;
CREATE SEQUENCE SQ_torneio;

-- Restricao de genero.
ALTER TABLE TB_membro ADD CONSTRAINT CK_GENERO_membro CHECK(genero in('F','M'));

-- Restricoes de chave primaria.
ALTER TABLE TB_assunto ADD CONSTRAINT PK_assunto PRIMARY KEY (ID_assunto); 
ALTER TABLE TB_assunto_encontro ADD CONSTRAINT PK_assunto_encontro PRIMARY KEY (ID_assunto_encontro); 
ALTER TABLE TB_assunto_projeto ADD CONSTRAINT PK_assunto_projeto PRIMARY KEY (ID_assunto_projeto); 
ALTER TABLE TB_assunto_questao ADD CONSTRAINT PK_assunto_questao PRIMARY KEY(ID_assunto_questao); 
ALTER TABLE TB_categoria_imagem ADD CONSTRAINT PK_categoria_imagem PRIMARY KEY (ID_categoria_imagem); 
ALTER TABLE TB_capitao ADD CONSTRAINT PK_capitao PRIMARY KEY (ID_capitao); 
ALTER TABLE TB_cargo_membro ADD CONSTRAINT PK_cargo_membro PRIMARY KEY (ID_cargo_membro);
ALTER TABLE TB_cidade ADD CONSTRAINT PK_cidade PRIMARY KEY (ID_cidade); 
ALTER TABLE TB_comite_organizador ADD CONSTRAINT PK_comite_organizador PRIMARY KEY (ID_comite_organizador); 
ALTER TABLE TB_conta_clube ADD CONSTRAINT PK_conta_clube PRIMARY KEY (ID_conta_clube);
ALTER TABLE TB_curso ADD CONSTRAINT PK_curso PRIMARY KEY (ID_curso); 
ALTER TABLE TB_curso_instituicao ADD CONSTRAINT PK_curso_instituicao PRIMARY KEY (ID_curso_instituicao); 
ALTER TABLE TB_encontro ADD CONSTRAINT PK_encontro PRIMARY KEY (ID_encontro); 
ALTER TABLE TB_encontro_online ADD CONSTRAINT PK_encontro_online PRIMARY KEY (ID_encontro_online); 
ALTER TABLE TB_encontro_presencial ADD CONSTRAINT PK_encontro_presencial PRIMARY KEY (ID_encontro_presencial);
ALTER TABLE TB_equipe ADD CONSTRAINT PK_equipe PRIMARY KEY (ID_equipe); 
ALTER TABLE TB_equipe_torneio ADD CONSTRAINT PK_equipe_torneio PRIMARY KEY (ID_equipe_torneio); 
ALTER TABLE TB_equipe_torneio_fase ADD CONSTRAINT PK_equipe_torneio_fase PRIMARY KEY (ID_equipe_torneio_fase); 
ALTER TABLE TB_estado ADD CONSTRAINT PK_estado PRIMARY KEY (ID_estado); 
ALTER TABLE TB_evento ADD CONSTRAINT PK_evento PRIMARY KEY (ID_evento); 
ALTER TABLE TB_fase ADD CONSTRAINT PK_fase PRIMARY KEY (ID_fase); 
ALTER TABLE TB_fase_online ADD CONSTRAINT PK_fase_online PRIMARY KEY (ID_fase_online); 
ALTER TABLE TB_fase_presencial ADD CONSTRAINT PK_fase_presencial PRIMARY KEY (ID_fase_presencial); 
ALTER TABLE TB_fase_questao_equipe ADD CONSTRAINT PK_fase_questao_equipe PRIMARY KEY (ID_fase_questao_equipe); 
ALTER TABLE TB_funcao ADD CONSTRAINT PK_funcao PRIMARY KEY (ID_funcao); 
ALTER TABLE TB_grau_dificuldade ADD CONSTRAINT PK_grau_dificuldade PRIMARY KEY (ID_grau_dificuldade); 
ALTER TABLE TB_imagem ADD CONSTRAINT PK_imagem PRIMARY KEY (ID_imagem); 
ALTER TABLE TB_imagem_encontro ADD CONSTRAINT PK_imagem_encontro PRIMARY KEY (ID_imagem_encontro); 
ALTER TABLE TB_imagem_projeto ADD CONSTRAINT PK_imagem_projeto PRIMARY KEY (ID_imagem_projeto); 
ALTER TABLE TB_imagem_evento ADD CONSTRAINT PK_imagem_evento PRIMARY KEY (ID_imagem_evento); 
ALTER TABLE TB_instituicao_ensino ADD CONSTRAINT PK_instituicao_ensino PRIMARY KEY (ID_instituicao_ensino); 
ALTER TABLE TB_lider ADD CONSTRAINT PK_lider PRIMARY KEY (ID_lider); 
ALTER TABLE TB_local ADD CONSTRAINT PK_local PRIMARY KEY (ID_local); 
ALTER TABLE TB_logradouro ADD CONSTRAINT PK_logradouro PRIMARY KEY (ID_logradouro); 
ALTER TABLE TB_membro ADD CONSTRAINT PK_membro PRIMARY KEY (ID_membro); 
ALTER TABLE TB_membro_equipe ADD CONSTRAINT PK_membro_equipe PRIMARY KEY (ID_membro_equipe); 
ALTER TABLE TB_membro_projeto ADD CONSTRAINT PK_membro_projeto PRIMARY KEY (ID_membro_projeto); 
ALTER TABLE TB_movimentacao_ponto ADD CONSTRAINT PK_movimentacao_ponto PRIMARY KEY (ID_movimentacao_ponto); 
ALTER TABLE TB_movimentacao_ponto_cargo ADD CONSTRAINT PK_movimentacao_ponto_cargo PRIMARY KEY (ID_movimentacao_ponto_cargo); 
ALTER TABLE TB_movimentacao_ponto_evento ADD CONSTRAINT PK_movimentacao_ponto_evento PRIMARY KEY (ID_movimentacao_ponto_evento); 
ALTER TABLE TB_movimentacao_ponto_projeto ADD CONSTRAINT PK_movimentacao_ponto_projeto PRIMARY KEY (ID_movimentacao_ponto_projeto); 
ALTER TABLE TB_movimentacao_ponto_questao ADD CONSTRAINT PK_movimentacao_ponto_questao PRIMARY KEY (ID_movimentacao_ponto_questao); 
ALTER TABLE TB_movimentacao_ponto_torneio ADD CONSTRAINT PK_movimentacao_ponto_torneio PRIMARY KEY (ID_movimentacao_ponto_torneio); 
ALTER TABLE TB_organizador ADD CONSTRAINT PK_organizador PRIMARY KEY(ID_organizador);
ALTER TABLE TB_pais ADD CONSTRAINT PK_pais PRIMARY KEY (ID_pais); 
ALTER TABLE TB_presenca_encontro ADD CONSTRAINT PK_preseca_encontro PRIMARY KEY (ID_presenca_encontro); 
ALTER TABLE TB_presenca_evento ADD CONSTRAINT PK_presenca_evento PRIMARY KEY (ID_presenca_evento); 
ALTER TABLE TB_procedencia_questao ADD CONSTRAINT PK_procedencia_questao PRIMARY KEY (ID_procedencia_questao); 
ALTER TABLE TB_projeto ADD CONSTRAINT PK_projeto PRIMARY KEY (ID_projeto); 
ALTER TABLE TB_plataforma ADD CONSTRAINT PK_platafomra PRIMARY KEY (ID_plataforma); 
ALTER TABLE TB_questao ADD CONSTRAINT PK_questao PRIMARY KEY (ID_questao); 
ALTER TABLE TB_status ADD CONSTRAINT PK_status PRIMARY KEY (ID_status); 
ALTER TABLE TB_tipo_movimentacao_ponto ADD CONSTRAINT PK_tipo_movimentacao_ponto PRIMARY KEY (ID_tipo_movimentacao_ponto);
ALTER TABLE TB_tipo_projeto ADD CONSTRAINT PK_tipo_projeto PRIMARY KEY (ID_tipo_projeto);
ALTER TABLE TB_torneio ADD CONSTRAINT PK_torneio PRIMARY KEY (ID_torneio); 

-- Restricoes de chave estrangeira. 

-- TB_assunto_encontro
ALTER TABLE TB_assunto_encontro ADD CONSTRAINT FK_assunto_encontro_assunto FOREIGN KEY (ID_assunto) REFERENCES TB_assunto(ID_assunto);
ALTER TABLE TB_assunto_encontro ADD CONSTRAINT FK_assunto_encontro_encontro FOREIGN KEY (ID_encontro) REFERENCES TB_encontro(ID_encontro);

-- TB_assunto_projeto
ALTER TABLE TB_assunto_projeto ADD CONSTRAINT FK_assunto_projeto_assunto FOREIGN KEY (ID_assunto) REFERENCES TB_assunto(ID_assunto);
ALTER TABLE TB_assunto_projeto ADD CONSTRAINT FK_assunto_projeto_projeto FOREIGN KEY (ID_projeto) REFERENCES TB_projeto(ID_projeto);

-- TB_assunto_questao
ALTER TABLE TB_assunto_questao ADD CONSTRAINT FK_assunto_questao_assunto FOREIGN KEY (ID_assunto) REFERENCES TB_assunto (ID_assunto);
ALTER TABLE TB_assunto_questao ADD CONSTRAINT FK_assunto_questao_questao FOREIGN KEY (ID_questao) REFERENCES TB_questao (ID_questao);

-- TB_capitao
ALTER TABLE TB_capitao ADD CONSTRAINT FK_capitao_membro FOREIGN KEY (ID_membro) REFERENCES TB_membro(ID_membro);

--TB_cargo_membro
ALTER TABLE TB_cargo_membro ADD CONSTRAINT FK_cargo_membro_funcao FOREIGN KEY (ID_cargo) REFERENCES TB_funcao(ID_funcao);
ALTER TABLE TB_cargo_membro ADD CONSTRAINT FK_cargo_membro_membro FOREIGN KEY (ID_membro) REFERENCES TB_membro(ID_membro);

-- TB_cidade
ALTER TABLE TB_cidade ADD CONSTRAINT FK_cidade_estado FOREIGN KEY (ID_estado) REFERENCES TB_estado(ID_estado);

-- TB_comite_organizador
ALTER TABLE TB_comite_organizador ADD CONSTRAINT FK_comite_organizador_evento FOREIGN KEY (ID_evento) REFERENCES  TB_evento(ID_evento);
ALTER TABLE TB_comite_organizador ADD CONSTRAINT FK_comite_organizador_membro FOREIGN KEY (ID_membro) REFERENCES  TB_membro(ID_membro);

-- TB_conta_clube
ALTER TABLE TB_conta_clube ADD CONSTRAINT FK_conta_clube_membro FOREIGN KEY (ID_membro) REFERENCES TB_membro(ID_membro);

-- TB_curso_instituicao
ALTER TABLE TB_curso_instituicao ADD CONSTRAINT FK_curso_instituicao_curso FOREIGN KEY (ID_curso) REFERENCES  TB_curso(ID_curso);
ALTER TABLE TB_curso_instituicao ADD CONSTRAINT FK_curso_instituicao_instituicao_ensino FOREIGN KEY (ID_instituicao) REFERENCES  TB_instituicao_ensino(ID_instituicao_ensino);

-- TB_encontro
ALTER TABLE TB_encontro ADD CONSTRAINT FK_encontro_organizador FOREIGN KEY (ID_organizador) REFERENCES TB_membro(ID_membro);
ALTER TABLE TB_encontro ADD CONSTRAINT FK_encontro_projeto FOREIGN KEY (ID_projeto) REFERENCES TB_projeto(ID_projeto);

-- TB_encontro_online 
ALTER TABLE TB_encontro_online ADD CONSTRAINT FK_encontro_online_plataforma FOREIGN KEY (ID_plataforma) REFERENCES TB_plataforma(ID_plataforma);
ALTER TABLE TB_encontro_online ADD CONSTRAINT FK_encontro_online_encontro FOREIGN KEY (ID_encontro) REFERENCES TB_encontro(ID_encontro);

-- TB_encontro_presencial
ALTER TABLE TB_encontro_presencial ADD CONSTRAINT FK_encontro_presencial_encontro FOREIGN KEY (ID_encontro) REFERENCES TB_encontro(ID_encontro);
ALTER TABLE TB_encontro_presencial ADD CONSTRAINT FK_encontro_presencial_local FOREIGN KEY (ID_local) REFERENCES  TB_local(ID_local);

-- TB_equipe
ALTER TABLE TB_equipe ADD CONSTRAINT FK_equipe_capitao FOREIGN KEY (ID_capitao) REFERENCES  TB_capitao(ID_capitao);

-- TB_equipe_torneio
ALTER TABLE TB_equipe_torneio ADD CONSTRAINT FK_equipe_torneio_equipe FOREIGN KEY (ID_equipe) REFERENCES  TB_equipe(ID_equipe);
ALTER TABLE TB_equipe_torneio ADD CONSTRAINT FK_equipe_torneio_torneio FOREIGN KEY (ID_torneio) REFERENCES  TB_torneio(ID_torneio);

-- TB_equipe_torneio_fase
ALTER TABLE TB_equipe_torneio_fase ADD CONSTRAINT FK_equipe_torneio_fase_equipe_torneio FOREIGN KEY (ID_equipe_torneio) REFERENCES  TB_equipe_torneio(ID_equipe_torneio);
ALTER TABLE TB_equipe_torneio_fase ADD CONSTRAINT FK_equipe_torneio_fase_fase FOREIGN KEY (ID_fase) REFERENCES  TB_fase(ID_fase);

-- TB_estado
ALTER TABLE TB_estado ADD CONSTRAINT FK_estado_pais FOREIGN KEY (ID_pais) REFERENCES  TB_pais(ID_pais);

-- TB_evento
ALTER TABLE TB_evento ADD CONSTRAINT FK_evento_local FOREIGN KEY (ID_local) REFERENCES TB_local(ID_local);

-- TB_fase
ALTER TABLE TB_fase ADD CONSTRAINT FK_fase_torneio FOREIGN KEY (ID_torneio) REFERENCES  TB_torneio (ID_torneio);

-- TB_fase_online
ALTER TABLE TB_fase_online ADD CONSTRAINT FK_fase_online_fase FOREIGN KEY (ID_fase) REFERENCES  TB_fase(ID_fase);
ALTER TABLE TB_fase_online ADD CONSTRAINT FK_fase_online_plataforma FOREIGN KEY (ID_plataforma) REFERENCES  TB_plataforma(ID_plataforma);

-- TB_fase_presencial
ALTER TABLE TB_fase_presencial ADD CONSTRAINT FK_fase_presencial_fase FOREIGN KEY (ID_fase) REFERENCES  TB_fase(ID_fase);
ALTER TABLE TB_fase_presencial ADD CONSTRAINT FK_fase_presencial_local FOREIGN KEY (ID_local) REFERENCES  TB_local(ID_local);

-- TB_fase_questao_equipe
ALTER TABLE TB_fase_questao_equipe ADD CONSTRAINT FK_fase_questao_equipe_equipe_torneio_fase FOREIGN KEY (ID_equipe_torneio_fase) REFERENCES  TB_equipe_torneio_fase (ID_equipe_torneio_fase);
ALTER TABLE TB_fase_questao_equipe ADD CONSTRAINT FK_fase_questao_equipe_questao FOREIGN KEY (ID_questao) REFERENCES  TB_questao(ID_questao);
ALTER TABLE TB_fase_questao_equipe ADD CONSTRAINT FK_fase_questao_equipe_status FOREIGN KEY (ID_status) REFERENCES  TB_status(ID_status);

-- TB_imagem
ALTER TABLE TB_imagem ADD CONSTRAINT FK_imagem_categoria_imagem FOREIGN KEY (ID_categoria_imagem) REFERENCES TB_categoria_imagem(ID_categoria_imagem);

-- TB_imagem_encontro
ALTER TABLE TB_imagem_encontro ADD CONSTRAINT FK_imagem_encontro_encontro FOREIGN KEY (ID_encontro) REFERENCES  TB_encontro (ID_encontro);
ALTER TABLE TB_imagem_encontro ADD CONSTRAINT FK_imagem_encontro_imagem FOREIGN KEY (ID_imagem) REFERENCES  TB_imagem(ID_imagem);

-- TB_imagem_projeto
ALTER TABLE TB_imagem_projeto ADD CONSTRAINT FK_imagem_projeto_imagem FOREIGN KEY (ID_imagem) REFERENCES  TB_imagem(ID_imagem);
ALTER TABLE TB_imagem_projeto ADD CONSTRAINT FK_imagem_projeto_projeto FOREIGN KEY (ID_projeto) REFERENCES  TB_projeto (ID_projeto);

-- TB_imagem_evento
ALTER TABLE TB_imagem_evento ADD CONSTRAINT FK_imagem_evento_evento FOREIGN KEY (ID_evento) REFERENCES  TB_evento(ID_evento);
ALTER TABLE TB_imagem_evento ADD CONSTRAINT FK_imagem_evento_imagem FOREIGN KEY (ID_imagem) REFERENCES  TB_imagem(ID_imagem);

-- TB_instituicao_ensino
ALTER TABLE TB_instituicao_ensino ADD CONSTRAINT FK_instituicao_ensino_logradouro FOREIGN KEY (ID_logradouro) REFERENCES  TB_logradouro (ID_logradouro);

-- TB_lider
ALTER TABLE TB_lider ADD CONSTRAINT FK_lider_membro FOREIGN KEY (ID_membro) REFERENCES  TB_membro (ID_membro);

-- TB_local
ALTER TABLE TB_local ADD CONSTRAINT FK_local_logradouro FOREIGN KEY (ID_logradouro) REFERENCES  TB_logradouro (ID_logradouro);

-- TB_logradouro
ALTER TABLE TB_logradouro ADD CONSTRAINT FK_logradouro_cidade FOREIGN KEY (ID_cidade) REFERENCES  TB_cidade(ID_cidade);

-- TB_membro
ALTER TABLE TB_membro ADD CONSTRAINT FK_membro_curso_instituicao FOREIGN KEY (ID_curso_instituicao) REFERENCES  TB_curso_instituicao(ID_curso_instituicao);
ALTER TABLE TB_membro ADD CONSTRAINT FK_membro_imagem FOREIGN KEY (ID_foto_membro) REFERENCES  TB_imagem(ID_imagem);

-- TB_membro_equipe
ALTER TABLE TB_membro_equipe ADD CONSTRAINT FK_membro_equipe_equipe FOREIGN KEY(ID_equipe) REFERENCES  TB_equipe(ID_equipe);
ALTER TABLE TB_membro_equipe ADD CONSTRAINT FK_membro_equipe_membro FOREIGN KEY (ID_membro) REFERENCES  TB_membro(ID_membro);

-- TB_membro_projeto 
ALTER TABLE TB_membro_projeto ADD CONSTRAINT FK_membro_projeto_membro FOREIGN KEY (ID_membro) REFERENCES  TB_membro(ID_membro);
ALTER TABLE TB_membro_projeto ADD CONSTRAINT FK_membro_projeto_projeto FOREIGN KEY (ID_projeto) REFERENCES  TB_projeto(ID_projeto);
ALTER TABLE TB_membro_projeto ADD CONSTRAINT FK_membro_projeto_funcao FOREIGN KEY (ID_funcao) REFERENCES  TB_funcao(ID_funcao);

--TB_movimentacao_ponto
ALTER TABLE TB_movimentacao_ponto ADD CONSTRAINT FK_movimentacao_ponto_conta_clube FOREIGN KEY (ID_conta_clube) REFERENCES  TB_conta_clube(ID_conta_clube);
ALTER TABLE TB_movimentacao_ponto ADD CONSTRAINT FK_movimentacao_ponto_tipo_movimentacao_ponto FOREIGN KEY (ID_tipo_movimentacao_ponto) REFERENCES  TB_tipo_movimentacao_ponto(ID_tipo_movimentacao_ponto);

--TB_movimentacao_ponto_cargo
ALTER TABLE TB_movimentacao_ponto_cargo ADD CONSTRAINT FK_movimentacao_ponto_cargo_cargo_membro FOREIGN KEY (ID_cargo_membro) REFERENCES  TB_cargo_membro(ID_cargo_membro);
ALTER TABLE TB_movimentacao_ponto_cargo ADD CONSTRAINT FK_movimentacao_ponto_cargo_movimentacao_ponto FOREIGN KEY (ID_movimentacao_ponto) REFERENCES  TB_movimentacao_ponto(ID_movimentacao_ponto);

--TB_movimentacao_ponto_evento
ALTER TABLE TB_movimentacao_ponto_evento ADD CONSTRAINT FK_movimentacao_ponto_evento_movimentacao_ponto FOREIGN KEY (ID_movimentacao_ponto) REFERENCES  TB_movimentacao_ponto(ID_movimentacao_ponto);
ALTER TABLE TB_movimentacao_ponto_evento ADD CONSTRAINT FK_movimentacao_ponto_presenca_evento FOREIGN KEY (ID_presenca_evento) REFERENCES  TB_presenca_evento(ID_presenca_evento);

-- TB_movimentacao_ponto_projeto
ALTER TABLE TB_movimentacao_ponto_projeto ADD CONSTRAINT FK_movimentacao_ponto_projeto_movimentacao_ponto FOREIGN KEY (ID_movimentacao_ponto) REFERENCES TB_movimentacao_ponto(ID_movimentacao_ponto);
ALTER TABLE TB_movimentacao_ponto_projeto ADD CONSTRAINT FK_movimentacao_ponto_projeto_projeto FOREIGN KEY (ID_projeto) REFERENCES TB_projeto(ID_projeto);

-- TB_movimentacao_ponto_questao
ALTER TABLE TB_movimentacao_ponto_questao ADD CONSTRAINT FK_movimentacao_ponto_questao_movimentacao_ponto FOREIGN KEY (ID_movimentacao_ponto) REFERENCES TB_movimentacao_ponto(ID_movimentacao_ponto);
ALTER TABLE TB_movimentacao_ponto_questao ADD CONSTRAINT FK_movimentacao_ponto_questao_questao FOREIGN KEY (ID_questao) REFERENCES TB_questao(ID_questao);

-- TB_movimentacao_ponto_torneio
ALTER TABLE TB_movimentacao_ponto_torneio ADD CONSTRAINT FK_movimentacao_ponto_torneio_equipe_torneio_fase FOREIGN KEY (ID_equipe_torneio_fase) REFERENCES TB_equipe_torneio_fase(ID_equipe_torneio_fase);
ALTER TABLE TB_movimentacao_ponto_torneio ADD CONSTRAINT FK_movimentacao_ponto_torneio_movimentacao_ponto FOREIGN KEY (ID_movimentacao_ponto) REFERENCES TB_movimentacao_ponto(ID_movimentacao_ponto);

-- TB_presenca_evento
ALTER TABLE TB_presenca_evento ADD CONSTRAINT FK_presenca_evento_evento FOREIGN KEY (ID_evento) REFERENCES  TB_evento(ID_evento);
ALTER TABLE TB_presenca_evento ADD CONSTRAINT FK_presenca_evento_membro FOREIGN KEY (ID_membro) REFERENCES  TB_membro(ID_membro);

-- TB_presenca_encontro
ALTER TABLE TB_presenca_encontro ADD CONSTRAINT FK_presenca_encontro_encontro FOREIGN KEY (ID_encontro) REFERENCES  TB_encontro(ID_encontro);
ALTER TABLE TB_presenca_encontro ADD CONSTRAINT FK_presenca_encontro_membro FOREIGN KEY (ID_membro) REFERENCES  TB_membro(ID_membro);

-- TB_projeto
ALTER TABLE TB_projeto ADD CONSTRAINT FK_projeto_lider FOREIGN KEY (ID_lider) REFERENCES  TB_lider(ID_lider);
ALTER TABLE TB_projeto ADD CONSTRAINT FK_projeto_tipo_projeto FOREIGN KEY (ID_tipo_projeto) REFERENCES TB_tipo_projeto (ID_tipo_projeto);

-- TB_questao
ALTER TABLE TB_questao ADD CONSTRAINT FK_questao_grau_dificuldade FOREIGN KEY (ID_grau_dificuldade) REFERENCES  TB_grau_dificuldade(ID_grau_dificuldade);

-- TB_torneio
ALTER TABLE TB_torneio ADD CONSTRAINT FK_torneio_organizador FOREIGN KEY (ID_organizador) REFERENCES  TB_organizador(ID_organizador);