create database if not exists hospital;
use hospital;

create table if not exists especialidade(
	id_especialidade int(11) auto_increment primary key,
  nome_especialidade varchar(255)
);

create table if not exists endereco(
  id_endereco int(11) auto_increment primary key, 
  logradouro varchar(255) not null,
  cep varchar(255) not null, 
  bairro varchar(255) not null,
  cidade varchar(255) not null,
  estado varchar(2) not null,
  medico_id int() default null
  paciente_id int(11) default null,
  foreign key(paciente_id) references paciente (id_paciente) on delete cascade on update cascade,
  foreign key(medico_id) references medico (id_medico) on delete cascade on update cascade
);

create table if not exists medico(
  id_medico int(11) auto_increment primary key,
  nome_medico varchar(255) not null,
  cpf_medico int(255) unique not null,
  crm varchar(13)unique not null,
  email_medico varchar(100),
  cargo varchar(255) not null,
  numero_telefone varchar(255) not null,
  especialidade_id INT not null,
  foreign key(especialidade_id) references especialidade (id_especialidade) on delete cascade on update cascade 
);

create table if not exists consulta(
  id_consulta int(11) auto_increment primary key,
  data_consulta date not null,
  hora_consulta time not null,
  valor_consulta decimal,
  convenio_id int(11) default null,
  medico_id int(11) not null,
  paciente_id int(11) not null,
  especialidade_id int(11) not null,
  foreign key(convenio_id) references convenio (id_convenio) on delete cascade on update cascade,
  foreign key(medico_id) references medico (id_medico) on delete cascade on update cascade,
  foreign key(paciente_id) references paciente (id_paciente) on delete cascade on update cascade,
  foreign key(especialidade_id) references especialidade (id_especialidade) on delete cascade on update cascade
);

create table if not exists paciente(
  id_paciente int(11) auto_increment primary key,
  nome_paciente varchar(255) not null,
  data_nascimento date,
  numero_telefone varchar(255) not null,
  cpf_paciente int(255) unique not null,
  rg_paciente varchar(255) not null,
  email_paciente varchar(100) not null,
  convenio_id int(11) default null,
  foreign key(convenio_id) references convenio (id_convenio) on delete cascade on update cascade
);

create table if not exists receita(
  id_receita int(11) auto_increment primary key,
  medicamento varchar(255),
  qld_medicamento int(255),
  instrucao_uso text(255),
  consulta_id int(11) not null,
  foreigh key(consulta_id) references consulta (id_consulta) on delete cascade on update cascade
);

create table if not exists telefone(
  id_telefone int(11) auto_increment primary key,
  ddd int(3) not null,
  numero int(9) not null,
  medico_id int(11) default null,
  paciente_id int(11) default null,
  foreign key(medico_id) references medico (id_medico) on delete cascade on update cascade,
  foreign key(paciente_id) references paciente (id_paciente) on delete cascade on update cascade
);

create table if not exists plantao(
  id_plantao int(11) auto_increment primary key,
  data_plantao date,
  hora_plantao time,
  internacao_id int(11) not null,
  enfermeiro_id int(11) not null,
  foreign key(internacao_id) references internacao (id_internacao) on delete cascade on update cascade,
  foreign key(enfermeiro_id) references enfermeiro (id_enfermeiro) on delete cascade on update cascade
);

create table if not exists enfermeiro(
  id_enfermeiro int(11) auto_increment primary key,
  nome_enfermeiro varchar(255) not null,
  cpf_enfermeiro int(11) unique not null,
  cre varchar(13) unique not null
);

create table if not exists convenio(
  id_convenio int(11) auto_increment primary key,
  nome_convenio varchar(255) not null,
  cnpj_convenio varchar(11) unique not null,
  tempo_carencia date
);

create table if not exists internacao(
  id_internacao int(11) auto_increment primary key,
  data_entrada date not null,
  data_prev_alta date not null,
  data_efet_alta date not null,
  desc_procedimentos text,
  medico_id int(11) not null,
  paciente_id int(11) not null,
  quarto_id int(11) not null,
  foreign key(medico_id) references medico (id_medico) on delete cascade on update cascade,
  foreign key(paciente_id) references paciente (id_paciente) on delete cascade on update cascade,
  foreign key(quarto_id) references quarto (id_quarto) on delete cascade on update cascade
);

create table if not exists quarto(
  id_quarto int(11) auto_increment primary key,
  numero int(11) not null,
  tipo_id int(11) not null,
  foreign key(tipo_id) references tipo_quarto (id_tipo) on delete cascade on update cascade
);

create table if not exists tipo_quarto(
  id_tipo int(11) auto_increment primary key,
  valor_diario decimal(8, 2) not null,
  desc_quarto varchar(100) default null
);


-- Inserindo dados na tabela Convenio
--
insert into convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) values(1, 'Alice', '9852143614751', '30 dias');
insert into convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) values(2, 'Unimed', '47810596327845', '24 horas');
insert into convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) values(3, 'Cuidar', '36149520784195', '24 dias');
insert into convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) values(4, 'MaisSaude', '29814536710254', '180 dias');
insert into convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) values(5, 'SUS', '2981453675587231', '30 dias');
insert into convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) values(6, 'MaisSaude', '298145367459854', '20 dias');
insert into convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) values(7, 'MaisSaude', '2981453111020254', '40 dias');
insert into convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) values(8, 'MaisSaude', '29814533020120254', '15 dias');
insert into convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) values(9, 'MaisSaude', '29814536710254', '60 dias');
insert into convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) values(10, 'MaisSaude', '29814536710254', '25 dias');


-- Inserindo dados na tabela Endereco
--
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '1');
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(2, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '2');
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(3, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '3');
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(4, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '4');
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(5, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '5');
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(6, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '6');
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(7, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '7');
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(8, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '8');
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(9, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '9');
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(10, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '10');


-- Inserindo dados na tabela Especialidade
--
insert into especialidade(id_especialidade, nome_especialidade) values(1, 'Pediatria');
insert into especialidade(id_especialidade, nome_especialidade) values(2, 'Pediatria');
insert into especialidade(id_especialidade, nome_especialidade) values(3, 'Pediatria');
insert into especialidade(id_especialidade, nome_especialidade) values(4, 'Pediatria');
insert into especialidade(id_especialidade, nome_especialidade) values(5, 'Pediatria');
insert into especialidade(id_especialidade, nome_especialidade) values(6, 'Pediatria');
insert into especialidade(id_especialidade, nome_especialidade) values(7, 'Pediatria');
insert into especialidade(id_especialidade, nome_especialidade) values(8, 'Pediatria');
insert into especialidade(id_especialidade, nome_especialidade) values(9, 'Pediatria');
insert into especialidade(id_especialidade, nome_especialidade) values(10, 'Pediatria');


-- Inserindo dados na tabela Tipo de quarto
--
insert into tipo_quarto(id_tipo, valor_diario, desc_quarto) values(1, '600.00', 'Apartamento');
insert into tipo_quarto(id_tipo, valor_diario, desc_quarto) values(2, '600.00', 'Apartamento');
insert into tipo_quarto(id_tipo, valor_diario, desc_quarto) values(3, '600.00', 'Apartamento');
insert into tipo_quarto(id_tipo, valor_diario, desc_quarto) values(4, '600.00', 'Apartamento');
insert into tipo_quarto(id_tipo, valor_diario, desc_quarto) values(5, '600.00', 'Apartamento');
insert into tipo_quarto(id_tipo, valor_diario, desc_quarto) values(6, '600.00', 'Apartamento');
insert into tipo_quarto(id_tipo, valor_diario, desc_quarto) values(7, '600.00', 'Apartamento');
insert into tipo_quarto(id_tipo, valor_diario, desc_quarto) values(8, '600.00', 'Apartamento');
insert into tipo_quarto(id_tipo, valor_diario, desc_quarto) values(9, '600.00', 'Apartamento');
insert into tipo_quarto(id_tipo, valor_diario, desc_quarto) values(10, '600.00', 'Apartamento');


-- Inserindo dados na tabela Medico
--
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id, numero_telefone) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '1');
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id, numero_telefone) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '1');
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id, numero_telefone) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '1');
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id, numero_telefone) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '1');
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id, numero_telefone) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '1');
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id, numero_telefone) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '1');
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id, numero_telefone) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '1');
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id, numero_telefone) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '1');
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id, numero_telefone) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '1');
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id, numero_telefone) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '1');


-- Inserindo dados na tabela Paciente
--
insert into paciente(id_paciente, nome_paciente, data_nascimento, numero_telefone, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '1');
insert into paciente(id_paciente, nome_paciente, data_nascimento, numero_telefone, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '1');
insert into paciente(id_paciente, nome_paciente, data_nascimento, numero_telefone, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '1');
insert into paciente(id_paciente, nome_paciente, data_nascimento, numero_telefone, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '1');
insert into paciente(id_paciente, nome_paciente, data_nascimento, numero_telefone, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '1');
insert into paciente(id_paciente, nome_paciente, data_nascimento, numero_telefone, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '1');
insert into paciente(id_paciente, nome_paciente, data_nascimento, numero_telefone, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '1');
insert into paciente(id_paciente, nome_paciente, data_nascimento, numero_telefone, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '1');
insert into paciente(id_paciente, nome_paciente, data_nascimento, numero_telefone, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '1');
insert into paciente(id_paciente, nome_paciente, data_nascimento, numero_telefone, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '1');


-- Inserindo dados na tabela Telefone
--
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo');
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo');
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo');
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo');
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo');
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo');
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo');
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo');
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo');
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo');


-- Inserindo dados na tabela Enfermeiro
--
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce');
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce');
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce');
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce');
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce');
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce');
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce');
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce');
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce');
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce');


-- Inserindo dados na tabela Consulta
--
insert into consulta(id_consulta, data_consulta, hora_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null);
insert into consulta(id_consulta, data_consulta, hora_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null);
insert into consulta(id_consulta, data_consulta, hora_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null);
insert into consulta(id_consulta, data_consulta, hora_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null);
insert into consulta(id_consulta, data_consulta, hora_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null);
insert into consulta(id_consulta, data_consulta, hora_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null);
insert into consulta(id_consulta, data_consulta, hora_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null);
insert into consulta(id_consulta, data_consulta, hora_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null);
insert into consulta(id_consulta, data_consulta, hora_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null);
insert into consulta(id_consulta, data_consulta, hora_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null);


-- Inserindo dados na tabela Receita
--
insert into receita(id_receita, medicamento, qld_medicamento, instrucao_uso, consulta_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo');
insert into receita(id_receita, medicamento, qld_medicamento, instrucao_uso, consulta_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo');
insert into receita(id_receita, medicamento, qld_medicamento, instrucao_uso, consulta_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo');
insert into receita(id_receita, medicamento, qld_medicamento, instrucao_uso, consulta_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo');
insert into receita(id_receita, medicamento, qld_medicamento, instrucao_uso, consulta_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo');
insert into receita(id_receita, medicamento, qld_medicamento, instrucao_uso, consulta_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo');
insert into receita(id_receita, medicamento, qld_medicamento, instrucao_uso, consulta_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo');
insert into receita(id_receita, medicamento, qld_medicamento, instrucao_uso, consulta_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo');
insert into receita(id_receita, medicamento, qld_medicamento, instrucao_uso, consulta_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo');
insert into receita(id_receita, medicamento, qld_medicamento, instrucao_uso, consulta_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo');


-- Inserindo dados na tabela Quarto
--
insert into quarto(id_quarto, numero, tipo_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000');
insert into quarto(id_quarto, numero, tipo_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000');
insert into quarto(id_quarto, numero, tipo_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000');
insert into quarto(id_quarto, numero, tipo_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000');
insert into quarto(id_quarto, numero, tipo_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000');
insert into quarto(id_quarto, numero, tipo_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000');
insert into quarto(id_quarto, numero, tipo_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000');
insert into quarto(id_quarto, numero, tipo_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000');
insert into quarto(id_quarto, numero, tipo_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000');
insert into quarto(id_quarto, numero, tipo_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000');


-- Inserindo dados na tabela Internacao
--
insert into internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, medico_id, paciente_id, quarto_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '1');
insert into internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, medico_id, paciente_id, quarto_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '1');
insert into internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, medico_id, paciente_id, quarto_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '1');
insert into internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, medico_id, paciente_id, quarto_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '1');
insert into internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, medico_id, paciente_id, quarto_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '1');
insert into internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, medico_id, paciente_id, quarto_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '1');
insert into internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, medico_id, paciente_id, quarto_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '1');
insert into internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, medico_id, paciente_id, quarto_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '1');
insert into internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, medico_id, paciente_id, quarto_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '1');
insert into internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, medico_id, paciente_id, quarto_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '1');


-- Inserindo dados na tabela Plantão
--
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo');
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo');
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo');
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo');
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo');
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo');
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo');
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo');
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo');
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo');
