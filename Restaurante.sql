CREATE TABLE CLIENTES (
    ID_CLIENTE NUMBER PRIMARY KEY,
    NOME VARCHAR(255) NOT NULL,
    TELEFONE VARCHAR(20) NOT NULL,
    EMAIL VARCHAR(255) NOT NULL
);

-- Tabela de mesas
CREATE TABLE mesas (
  id_mesa NUMBER PRIMARY KEY,
  capacidade INTEGER NOT NULL,
  disponibilidade NUMBER(1) NOT NULL
);

-- Tabela de pedidos
CREATE TABLE pedidos (
  id_pedido NUMBER PRIMARY KEY,
  id_cliente INTEGER REFERENCES clientes(id_cliente) NOT NULL,
  id_mesa INTEGER REFERENCES mesas(id_mesa),
  data_pedido TIMESTAMP NOT NULL,
  status_pedido VARCHAR(20) NOT NULL
);

-- Tabela de itens do menu
CREATE TABLE itens_menu (
  id_item NUMBER PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  descricao CLOB,
  preco NUMBER(10, 2) NOT NULL
);

-- Tabela de pedidos de itens do menu
CREATE TABLE pedidos_itens_menu (
  id_pedido INTEGER REFERENCES pedidos(id_pedido) NOT NULL,
  id_item INTEGER REFERENCES itens_menu(id_item) NOT NULL,
  quantidade INTEGER NOT NULL,
  preco_unitario NUMBER(10, 2) NOT NULL
);

-- Inserir alguns clientes
INSERT INTO clientes (ID_CLIENTE, nome, telefone, email) VALUES (1, 'João Silva', '(11)9999-8888', 'joao.silva@gmail.com');
INSERT INTO clientes (ID_CLIENTE, nome, telefone, email) VALUES (2, 'Maria Santos', '(11)9876-5432', 'maria.santos@hotmail.com');
INSERT INTO clientes (ID_CLIENTE, nome, telefone, email) VALUES (3, 'Pedro Albuquerque', '(11)91234-5678', 'pedro.albuquerque@yahoo.com');


-- Inserir algumas mesas
INSERT INTO mesas (ID_MESA,capacidade, disponibilidade) VALUES (1, 2, 1);
INSERT INTO mesas (ID_MESA,capacidade, disponibilidade) VALUES (2, 4, 1);
INSERT INTO mesas (ID_MESA,capacidade, disponibilidade) VALUES (3, 6, 1);
INSERT INTO mesas (ID_MESA,capacidade, disponibilidade) VALUES (4, 8, 1);

-- Inserir alguns itens do menu
INSERT INTO itens_menu (id_item, nome, descricao, preco) VALUES (2,'Hambúrguer', 'Pão, carne, queijo, alface, tomate e molho especial', 20);
INSERT INTO ITENS_MENU (ID_ITEM, NOME, DESCRICAO, PRECO) VALUES (3,'Pizza', 'Molho de tomate, mussarela, presunto, champignon e azeitona', 35.00);
INSERT INTO ITENS_MENU (ID_ITEM, NOME, DESCRICAO, PRECO) VALUES (4,'Salmão grelhado', 'Salmão grelhado com legumes e arroz', 50.00);

-- Inserir um pedido de cliente
INSERT INTO pedidos (ID_PEDIDO, id_cliente, id_mesa, data_pedido, status_pedido)VALUES(1, 1, 2, SYSDATE, 'Em andamento');

-- Inserir itens do menu em um pedido
INSERT INTO pedidos_itens_menu (id_pedido, id_item, quantidade, preco_unitario) VALUES (1, 1, 2, 20.00);
INSERT INTO pedidos_itens_menu (id_pedido, id_item, quantidade, preco_unitario) VALUES(1, 3, 1, 50.00);