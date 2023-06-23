-- Comando para criação da tabela "cargos" e suas colunas.
CREATE TABLE cargos (
                id_cargo   NUMERIC(9)   NOT NULL,
                nome_cargo VARCHAR(255) NOT NULL,
                descricao  VARCHAR(255) NOT NULL,
                CONSTRAINT id_cargo PRIMARY KEY (id_cargo)
);

-- Comandos para criação dos comentários da tabela "cargos".
COMMENT ON TABLE  cargos            IS 'Esta é a tabela com os dados dos cargos.';
COMMENT ON COLUMN cargos.id_cargo   IS 'Esta é a coluna que possui a PK da tabela "cargos".';
COMMENT ON COLUMN cargos.nome_cargo IS 'Esta é a coluna que possui o nome do cargo.';
COMMENT ON COLUMN cargos.descricao  IS 'Esta coluna possui a descricao dos cargos.';

-- Comando para criação da tabela "usuarios" e suas colunas.
CREATE TABLE usuarios (
                id_usuario     NUMERIC(9)   NOT NULL,
                email          VARCHAR(255) NOT NULL,
                senha          VARCHAR(20)  NOT NULL,
                nome           VARCHAR(255) NOT NULL,
                sexo           VARCHAR(1)   NOT NULL,
                pontos         NUMERIC      NOT NULL,
                profissao      VARCHAR(255) NOT NULL,
                foto_de_perfil BYTEA,
                id_cargo       NUMERIC(9)   NOT NULL,
                CONSTRAINT id_usuario PRIMARY KEY (id_usuario)
);

-- Comandos para criação dos comentários da tabela "usuarios".
COMMENT ON TABLE  usuarios                IS 'Esta é a tabela com os dados dos usuarios.';
COMMENT ON COLUMN usuarios.id_usuario     IS 'Esta é a PK da tabela "usuarios".';
COMMENT ON COLUMN usuarios.email          IS 'Esta é a coluna que possui o email dos usuarios.';
COMMENT ON COLUMN usuarios.senha          IS 'Esta é a coluna que possui a senha dos usuarios.';
COMMENT ON COLUMN usuarios.nome           IS 'Esta é a coluna que possui o nome dos usuarios.';
COMMENT ON COLUMN usuarios.sexo           IS 'Esta é a coluna que possui o sexo dos usuarios.';
COMMENT ON COLUMN usuarios.pontos         IS 'Esta é a coluna que possui o numero de pontos que os usuarios possuem.';
COMMENT ON COLUMN usuarios.profissao      IS 'Esta é a coluna que possui a profissão dos usuarios.';
COMMENT ON COLUMN usuarios.foto_de_perfil IS 'Esta é a coluna que possui a foto de perfil dos usuarios.';
COMMENT ON COLUMN usuarios.id_cargo       IS 'Esta é a FK provinda da tabela "cargos" para a tabela "usuarios".';

-- Comando para criação da tabela "chat" e suas colunas.
CREATE TABLE chat (
                id_chat         NUMERIC(9) NOT NULL,
                id_destinatario NUMERIC(9) NOT NULL,
                id_usuario      NUMERIC(9) NOT NULL,
                CONSTRAINT id_chat PRIMARY KEY (id_chat)
);

-- Comandos para criação dos comentários da tabela "chat".
COMMENT ON TABLE  chat                 IS 'Esta é a tabela que possui os dados dos chats.';
COMMENT ON COLUMN chat.id_chat         IS 'Esta é a coluna que possui a PK da tabela "chat".';
COMMENT ON COLUMN chat.id_destinatario IS 'Esta é a coluna que possui o ID dos destinatarios dos chats.';
COMMENT ON COLUMN chat.id_usuario      IS 'Esta é a FK provinda da tabela "usuarios" para a tabela "chat".';

-- Comando para criação da tabela "chat_conversas" e suas colunas.
CREATE TABLE chat_conversas (
                id_conversa       VARCHAR      NOT NULL,
                conteudo_mensagem VARCHAR(512) NOT NULL,
                data_hora         TIMESTAMP    NOT NULL,
                id_chat           NUMERIC(9)   NOT NULL,
                CONSTRAINT id_conversa PRIMARY KEY (id_conversa)
);

-- Comandos para criação dos comentários da tabela "chat_conversas".
COMMENT ON TABLE  chat_conversas                   IS 'Esta é a tabela com os dados das conversas do chat.';
COMMENT ON COLUMN chat_conversas.id_conversa       IS 'Esta é a coluna que possui a PK da tabela "chat_conversas".';
COMMENT ON COLUMN chat_conversas.conteudo_mensagem IS 'Esta é a coluna que possui o conteudo da mensagem.';
COMMENT ON COLUMN chat_conversas.data_hora         IS 'Esta é a coluna que possui a data e hora das mensagens.';
COMMENT ON COLUMN chat_conversas.id_chat           IS 'Esta é a FK provinda da tabela "chat" para a tabela "chat_conversas".';

-- Comando para criação da tabela "ajuda" e suas colunas.
CREATE TABLE ajuda (
                id_ajuda   NUMERIC(9)   NOT NULL,
                pergunta   VARCHAR(512) NOT NULL,
                id_usuario NUMERIC(9)   NOT NULL,
                CONSTRAINT id_ajuda PRIMARY KEY (id_ajuda)
);

-- Comandos para criação dos comentários da tabela "ajuda".
COMMENT ON TABLE  ajuda            IS 'Esta é a tabela que possui os dados da ajuda.';
COMMENT ON COLUMN ajuda.id_ajuda   IS 'Esta é a PK da tabela "ajuda".';
COMMENT ON COLUMN ajuda.pergunta   IS 'Esta é a coluna que possui a pergunta da ajuda que necessita.';
COMMENT ON COLUMN ajuda.id_usuario IS 'Esta é a FK provinda da tabela "usuarios" para a tabela "ajuda".';

-- Comando para criação da tabela "usuarios_enderecos" e suas colunas.
CREATE TABLE usuarios_enderecos (
                id_endereco NUMERIC(9)   NOT NULL,
                logradouro  VARCHAR(255) NOT NULL,
                numero      NUMERIC      NOT NULL,
                complemento VARCHAR(255),
                bairro      VARCHAR(255) NOT NULL,
                cidade      VARCHAR(255) NOT NULL,
                uf          NUMERIC(2)   NOT NULL,
                cep         NUMERIC(8)   NOT NULL,
                id_usuario  NUMERIC(9)   NOT NULL,
                CONSTRAINT id_endereco PRIMARY KEY (id_endereco)
);

-- Comandos para criação dos comentários da tabela "usuarios_enderecos".
COMMENT ON TABLE  usuarios_enderecos             IS 'Esta é a tabela com os dados dos enderecos dos usuarios.';
COMMENT ON COLUMN usuarios_enderecos.id_endereco IS 'Esta é a PK da tabela "usuarios_enderecos".';
COMMENT ON COLUMN usuarios_enderecos.logradouro  IS 'Esta é a coluna que possui o logradouro dos enderecos.';
COMMENT ON COLUMN usuarios_enderecos.numero      IS 'Esta é a coluna que possui o numero dos enderecos.';
COMMENT ON COLUMN usuarios_enderecos.complemento IS 'Esta é a coluna que possui o complemento dos enderecos.';
COMMENT ON COLUMN usuarios_enderecos.bairro      IS 'Esta é a coluna que possui o bairro dos enderecos.';
COMMENT ON COLUMN usuarios_enderecos.uf          IS 'Esta é a coluna que possui o UF dos enderecos.';
COMMENT ON COLUMN usuarios_enderecos.cep         IS 'Esta é a coluna que possui o CEP dos enderecos.';
COMMENT ON COLUMN usuarios_enderecos.id_usuario  IS 'Esta é a FK provinda da tabela "usuarios" para a tabela "usuarios_enderecos".';

-- Comandos para criação das "constraints" de cada tabela.
ALTER TABLE usuarios ADD CONSTRAINT cargos_usuarios_fk
FOREIGN KEY (id_cargo)
REFERENCES cargos (id_cargo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE usuarios_enderecos ADD CONSTRAINT usuarios_usuarios_enderecos_fk
FOREIGN KEY (id_usuario)
REFERENCES usuarios (id_usuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ajuda ADD CONSTRAINT usuarios_ajuda_fk
FOREIGN KEY (id_usuario)
REFERENCES usuarios (id_usuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE chat ADD CONSTRAINT usuarios_chat_fk
FOREIGN KEY (id_usuario)
REFERENCES usuarios (id_usuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE chat_conversas ADD CONSTRAINT chat_chat_conversas_fk
FOREIGN KEY (id_chat)
REFERENCES chat (id_chat)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;