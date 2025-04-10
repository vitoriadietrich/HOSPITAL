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


-- Inserindo dados na tabela Convênio
--
insert into convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) values(1, 'Alice', '9852143614751', '30 dias');
insert into convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) values(2, 'Unimed', '47810596327845', '24 horas');
insert into convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) values(3, 'Cuidar', '36149520784195', '24 dias');
insert into convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) values(4, 'MaisSaude', '29814536710254', '180 dias');
insert into convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) values(5, 'SUS', '2981453675587231', '30 dias');
insert into convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) values(6, 'MaisSaude', '298145367459854', '180 dias');
insert into convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) values(7, 'MaisSaude', '2981453111020254', '180 dias');
insert into convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) values(8, 'SUS', '29814533020120254', '30 dias');
insert into convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) values(9, 'MaisSaude', '29814536710254', '180 dias');
insert into convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) values(10, 'MaisSaude', '29814536756319', '180 dias');
insert into convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) values(11, 'Unimed', '29814536755782', '24 dias');
insert into convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) values(12, 'MaisSaude', '29814536769596', '180 dias');
insert into convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) values(13, 'SUS', '29814536773287', '30 dias');
insert into convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) values(14, 'MaisSaude', '29814536754572', '180 dias');
insert into convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) values(15, 'Cuidar', '29814536711382', '24 dias');
insert into convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) values(16, 'MaisSaude', '29814536793237', '180 dias');
insert into convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) values(17, 'SUS', '29814536778731', '30 dias');
insert into convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) values(18, 'MaisSaude', '29814536772151', '180 dias');
insert into convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) values(19, 'MaisSaude', '29814536791283', '180 dias');
insert into convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) values(20, 'SUS', '29814536736462', '30 dias');


-- Inserindo dados na tabela Endereço
--
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(1, 'Rua Luiza Aparecida de Húngaro', '05267-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '1');
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(2, 'Rua Marinha Penha', '05280-000', 'Sol Nascente' 'São Paulo', 'São Paulo', null, '2');
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(3, 'Rua Julio Mandaqui', '05779-000', 'Mandaqui' 'São Paulo', 'São Paulo', null, '3');
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(4, 'Rua Alberto Machado', '05342-000', 'Vila Sulina' 'São Paulo', 'São Paulo', null, '4');
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(5, 'Rua Clementina de Almeida Bronze', '05214-000', 'Canaã' 'São Paulo', 'São Paulo', null, '5');
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(6, 'Rua Ilha do Francês', '05268-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '6');
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(7, 'Rua Aparecida do Norte Bonvina', '05496-000', 'Vila Piauí' 'São Paulo', 'São Paulo', null, '7');
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(8, 'Rua Coronel José Gladiador', '05217-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '8');
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(9, 'Rua Fernando Ponte Bazar', '05532-000', 'Rosinha' 'São Paulo', 'São Paulo', null, '9');
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(10, 'Rua Gaúcho Botazar de Franco', '05114-000', 'Jardim Britânia' 'São Paulo', 'São Paulo', null, '10');
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(11, 'Rua Pedro Mello', '05575-000', 'Jardim Britânia' 'São Paulo', 'São Paulo', null, '11');
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(12, 'Rua Lorena Pinheiro', '05431-000', 'Morro Doce' 'São Paulo', 'São Paulo', null, '12');
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(13, 'Rua Fernandes Branca', '05635-000', 'Rosinha' 'São Paulo', 'São Paulo', null, '13');
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(14, 'Rua Alexandre Quinto', '05972-000', 'Sulina' 'São Paulo', 'São Paulo', null, '14');
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(15, 'Rua Vieira Moraes', '05367-000', 'Jardim Esperança' 'São Paulo', 'São Paulo', null, '15');
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(16, 'Rua Baltazar Morales', '05371-000', 'Jardim Esperança' 'São Paulo', 'São Paulo', null, '16');
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(17, 'Rua Luiz Coronel Punho', '05843-000', 'Sulina' 'São Paulo', 'São Paulo', null, '17');
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(18, 'Rua Gonzaga Sagrado', '05937-000', 'Jardim Britânia' 'São Paulo', 'São Paulo', null, '18');
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(19, 'Rua Eliote Azevedo', '05234-000', 'Mandaqui' 'São Paulo', 'São Paulo', null, '19');
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(20, 'Rua Machado de Almeida', '05356-000', 'Sol Nascente' 'São Paulo', 'São Paulo', null, '20');



-- Inserindo dados na tabela Especialidade
--
insert into especialidade(id_especialidade, nome_especialidade) values(1, 'Pediatria');
insert into especialidade(id_especialidade, nome_especialidade) values(2, 'Neurologia');
insert into especialidade(id_especialidade, nome_especialidade) values(3, 'Cardiologia');
insert into especialidade(id_especialidade, nome_especialidade) values(4, 'Pneumologia');
insert into especialidade(id_especialidade, nome_especialidade) values(5, 'Hematologia');
insert into especialidade(id_especialidade, nome_especialidade) values(6, 'Imunologia');
insert into especialidade(id_especialidade, nome_especialidade) values(7, 'Endocrinologia');
insert into especialidade(id_especialidade, nome_especialidade) values(8, 'Ortopedia');
insert into especialidade(id_especialidade, nome_especialidade) values(9, 'Reumatologia');
insert into especialidade(id_especialidade, nome_especialidade) values(10, 'Ginecologia');
insert into especialidade(id_especialidade, nome_especialidade) values(11, 'Oncologista');
insert into especialidade(id_especialidade, nome_especialidade) values(12, 'Nefrologista');
insert into especialidade(id_especialidade, nome_especialidade) values(13, 'Angiologista');
insert into especialidade(id_especialidade, nome_especialidade) values(14, 'Dermatologista');
insert into especialidade(id_especialidade, nome_especialidade) values(15, 'Geriatra');
insert into especialidade(id_especialidade, nome_especialidade) values(16, 'Toxicologista');
insert into especialidade(id_especialidade, nome_especialidade) values(17, 'Andrologista');
insert into especialidade(id_especialidade, nome_especialidade) values(18, 'Sexólogo');
insert into especialidade(id_especialidade, nome_especialidade) values(19, 'Paliativista');
insert into especialidade(id_especialidade, nome_especialidade) values(20, 'Emergencista');



-- Inserindo dados na tabela Tipo de Quarto
--
insert into tipo_quarto(id_tipo, valor_diario, desc_quarto) values(1, '600.00', 'Apartamento');
insert into tipo_quarto(id_tipo, valor_diario, desc_quarto) values(2, '700.00', 'Enfermaria');
insert into tipo_quarto(id_tipo, valor_diario, desc_quarto) values(3, '650.00', 'Quarto de Isolamento');
insert into tipo_quarto(id_tipo, valor_diario, desc_quarto) values(4, '800.00', 'Unidade de Terapia Intensiva (UTI)');
insert into tipo_quarto(id_tipo, valor_diario, desc_quarto) values(5, '500.00', 'Unidade Semi-Intensiva / Intermediária');
insert into tipo_quarto(id_tipo, valor_diario, desc_quarto) values(6, '1000.00', 'Quarto Privativo / Individual');
insert into tipo_quarto(id_tipo, valor_diario, desc_quarto) values(7, '820.00', 'Quarto Semi-Privativo');
insert into tipo_quarto(id_tipo, valor_diario, desc_quarto) values(8, '750.00', 'Quarto de Pré-parto / PPP (Pré-parto, Parto e Pós-parto)');
insert into tipo_quarto(id_tipo, valor_diario, desc_quarto) values(9, '900.00', 'Quarto Psiquiátrico');
insert into tipo_quarto(id_tipo, valor_diario, desc_quarto) values(10, '950.00', 'Quarto de Cuidados Paliativos');
insert into tipo_quarto(id_tipo, valor_diario, desc_quarto) values(11, '970.00', 'UTI Neonatal (UTIN)');
insert into tipo_quarto(id_tipo, valor_diario, desc_quarto) values(12, '630.00', 'Quarto Pediátrico');
insert into tipo_quarto(id_tipo, valor_diario, desc_quarto) values(13, '400.00', 'Unidade de AVC (AVC Unit / Stroke Unit)');
insert into tipo_quarto(id_tipo, valor_diario, desc_quarto) values(14, '860.00', 'Unidade Coronariana (UCO / UCI)');
insert into tipo_quarto(id_tipo, valor_diario, desc_quarto) values(15, '730.00', 'Unidade de Internação Geriátrica');
insert into tipo_quarto(id_tipo, valor_diario, desc_quarto) values(16, '780.00', 'Unidade de Internação Pediátrica');
insert into tipo_quarto(id_tipo, valor_diario, desc_quarto) values(17, '720.00', 'Unidade de Transplante');
insert into tipo_quarto(id_tipo, valor_diario, desc_quarto) values(18, '680.00', 'Unidade de Quimioterapia (ou Hospital-Dia)');
insert into tipo_quarto(id_tipo, valor_diario, desc_quarto) values(19, '640.00', 'Sala de Recuperação Pós-Anestésica (RPA)');
insert into tipo_quarto(id_tipo, valor_diario, desc_quarto) values(20, '690.00', 'Unidade de Reabilitação');


-- Inserindo dados na tabela Médico
--
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id, numero_telefone) values(1, 'Letícia de Oliveira', '486422876913', 'CRM-SP 123456' 'leticiaoliveira@gmail.com', 'Médico', Pediatria, '944039887');
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id, numero_telefone) values(2, 'Albert Ribeiro', '486422877943', 'CRM-SP 123983' 'albertribeiro@gmail.com', 'Médico', Neurologia, '944039254');
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id, numero_telefone) values(3, 'Maria Camargo', '486422878213', 'CRM-SP 123772' 'mariacamargo@gmail.com', 'Médico', Cardiologia, '944039336');
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id, numero_telefone) values(4, 'Bruna Branca', '486422879936', 'CRM-SP 123119' 'brunabranca@gmail.com', 'Médico', Pneumologia, '944039978');
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id, numero_telefone) values(5, 'Vitoria Dietrich', '486422878824', 'CRM-SP 123664' 'vitoriadietrich@gmail.com', 'Médico', Hematologia, '944039125');
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id, numero_telefone) values(6, 'Carolina Viana', '486422871164', 'CRM-SP 123873' 'carolinaviana@gmail.com', 'Médico', Imunologia, '944039446');
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id, numero_telefone) values(7, 'Andressa Barbosa', '486422879964', 'CRM-SP 123887' 'andressabarbosa@gmail.com', 'Médico', Endocrinologia, '944039557');
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id, numero_telefone) values(8, 'Tereza Vieira', '486422872378', 'CRM-SP 123124' 'terezavieira@gmail.com', 'Médico', Ortopedia, '944039891');
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id, numero_telefone) values(9, 'Augusto Santos', '486422879433', 'CRM-SP 1233324' 'augustosantos@gmail.com', 'Médico', Reumatologia, '944039332');
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id, numero_telefone) values(10, 'Roberto Silveira Monte', '486422877144', 'CRM-SP 123991' 'robertosilmonte@gmail.com', 'Médico', Ginecologia, '944039247');
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id, numero_telefone) values(11, 'Eloiza Albert Santos', '486422878837', 'CRM-SP 123929' 'eloizaalbert@gmail.com', 'Médico', Oncologista, '944039696');
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id, numero_telefone) values(12, 'Luana Rocha', '486422875345', 'CRM-SP 123367' 'luanarocha@gmail.com', 'Médico', Nefrologista, '944039782');
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id, numero_telefone) values(13, 'Rochelle Pascal', '486422879246', 'CRM-SP 123357' 'rochellepascal@gmail.com', 'Médico', Angiologista, '944039347');
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id, numero_telefone) values(14, 'Eliana Silveira', '486422877369', 'CRM-SP 123971' 'elianasilveira@gmail.com', 'Médico', Dermatologista, '944039367');
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id, numero_telefone) values(15, 'Carlos Henrique', '486422871437', 'CRM-SP 123256' 'carloshenrique@gmail.com', 'Médico', Geriatra, '944039921');
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id, numero_telefone) values(16, 'Joaquim Fernandes', '486422878835', 'CRM-SP 123545' 'joaquimfernandes@gmail.com', 'Médico', Toxicologista, '944039254');
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id, numero_telefone) values(17, 'William Gonçalves', '486422877282', 'CRM-SP 123782' 'williamgoncalves@gmail.com', 'Médico', Andrologista, '944039127');
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id, numero_telefone) values(18, 'Rodrigo Morales', '486422875321', 'CRM-SP 123141' 'rodrigomorales@gmail.com', 'Médico', Sexólogo, '944039334');
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id, numero_telefone) values(19, 'Carlito de Jesus', '486422872237', 'CRM-SP 123518' 'carlitojesus@gmail.com', 'Médico', Paliativista, '944039667');
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id, numero_telefone) values(20, 'Sara Viena', '486422875218', 'CRM-SP 123357' 'saraviena@gmail.com', 'Médico', Emergencista, '944039112');



-- Inserindo dados na tabela Paciente
--
insert into paciente(id_paciente, nome_paciente, data_nascimento, numero_telefone, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(1, 'Renata Rodrigues', '08/02/1988', '97821365' '436612878863', '396327278', renatarodrigues@gmail.com, 'Alice');
insert into paciente(id_paciente, nome_paciente, data_nascimento, numero_telefone, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(2, 'Lívia Silva', '05/09/1966', '97821881' '436612877971', '396327558', liviasilva@gmail.com, 'Unimed');
insert into paciente(id_paciente, nome_paciente, data_nascimento, numero_telefone, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(3, 'Marta Oliveira', '12/05/2000', '97821992' '436612872236', '396327141', martaoliveira@gmail.com, 'Cuidar');
insert into paciente(id_paciente, nome_paciente, data_nascimento, numero_telefone, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(4, 'Lucas Santos', '10/02/1980', '97821438' '436612877992', '396327336', lucassantos@gmail.com, 'MaisSaude');
insert into paciente(id_paciente, nome_paciente, data_nascimento, numero_telefone, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(5, 'Henrique Ferraz', '30/01/1974', '97821112' '436612871456', '396327971', henriqueferraz@gmail.com, 'SUS');
insert into paciente(id_paciente, nome_paciente, data_nascimento, numero_telefone, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(6, 'Gabriel Souza', '28/08/1963', '97821736' '436612877732', '396327087', gabrielsouza@gmail.com, 'MaisSaude');
insert into paciente(id_paciente, nome_paciente, data_nascimento, numero_telefone, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(7, 'Fabiana Monte', '04/07/1890', '97821225' '436612871138', '396327659', fabianamonte@gmail.com, 'MaisSaude');
insert into paciente(id_paciente, nome_paciente, data_nascimento, numero_telefone, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(8, 'Luíza Cardoso', '09/06/1976', '97821447' '436612879951', '396327559', luizacardoso@gmail.com, 'Cuidar');
insert into paciente(id_paciente, nome_paciente, data_nascimento, numero_telefone, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(9, 'Juliana Cristina', '20/09/2001', '97821336' '436612871191', '396327114', julianacristina@gmail.com, 'MaisSaude');
insert into paciente(id_paciente, nome_paciente, data_nascimento, numero_telefone, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(10, 'Mateus Moraes', '25/03/1990', '97821149' '436612879920', '396327834', mateusmoraes@gmail.com, 'MaisSaude');
insert into paciente(id_paciente, nome_paciente, data_nascimento, numero_telefone, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(11, 'Carla Nogueira', '29/06/1940', '97821668' '436612877621', '396327834', carlanogueira@gmail.com, 'Cuidar');
insert into paciente(id_paciente, nome_paciente, data_nascimento, numero_telefone, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(12, 'Tomé Henrique', '19/04/1970', '97821347' '436612879723', '396327667', tomehenrique@gmail.com, 'MaisSaude');
insert into paciente(id_paciente, nome_paciente, data_nascimento, numero_telefone, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(13, 'Gabriel Barbosa', '18/02/1910', '97821554' '436612871458', '396327120', gabrielbarbosa@gmail.com, 'SUS');
insert into paciente(id_paciente, nome_paciente, data_nascimento, numero_telefone, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(14, 'Beatriz Silva', '06/03/1890', '97821778' '436612873671', '396327347', beatrizsilva@gmail.com, 'MaisSaude');
insert into paciente(id_paciente, nome_paciente, data_nascimento, numero_telefone, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(15, 'Júlio Clementino', '01/10/1899', '97821882' '436612873947', '396327167', julioclementino@gmail.com, 'MaisSaude');
insert into paciente(id_paciente, nome_paciente, data_nascimento, numero_telefone, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(16, 'Mara Andrade', '02/08/1940', '97821332' '436612872578', '396327228', maraandrade@gmail.com, 'Unimed');
insert into paciente(id_paciente, nome_paciente, data_nascimento, numero_telefone, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(17, 'Linda Moraes', '14/12/1870', '97821112' '436612871250', '396327994', lindamoraes@gmail.com, 'SUS');
insert into paciente(id_paciente, nome_paciente, data_nascimento, numero_telefone, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(18, 'Rute Santos', '16/07/2000', '97821782' '436612870849', '396327337', rutesantos@gmail.com, 'MaisSaude');
insert into paciente(id_paciente, nome_paciente, data_nascimento, numero_telefone, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(19, 'Michele Pereira', '18/11/2001', '97821314' '436612871370', '396327679', michelepereira@gmail.com, 'MaisSaude');
insert into paciente(id_paciente, nome_paciente, data_nascimento, numero_telefone, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(20, 'Maycon Franco', '24/09/2002', '97821654' '436612878215', '396327998', mayconfranco@gmail.com, 'Unimed');



-- Inserindo dados na tabela Telefone
--
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(1, '11', '933894273', '1' null);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(2, '11', '933894551', '2' null);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(3, '11', '933894782', '3' null);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(4, '11', '933894336', '4' null);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(5, '11', '933894724', '5' null);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(6, '11', '933894992', '6' null);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(7, '11', '933894189', '7' null);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(8, '11', '933894554', '8' null);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(9, '11', '933894154', '9' null);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(10, '11', '933894363', '10' null);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(11, '11', '933894762', '11' null);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(12, '11', '933894554', '12' null);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(13, '11', '933894661', '13' null);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(14, '11', '933894224', '14' null);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(15, '11', '933894552', '15' null);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(16, '11', '933894882', '16' null);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(17, '11', '933894141', '17' null);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(18, '11', '933894551', '18' null);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(19, '11', '933894547', '19' null);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(20, '11', '933894934', '20' null);



-- Inserindo dados na tabela Enfermeiro
--
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(1, 'Cristiane Nogueira', '12345678900', 'SP-123456');
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(2, 'Roberta Cavalcante', '12345678900', 'SP-123698');
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(3, 'Inácio Paulino', '12345674465', 'SP-123145');
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(4, 'Anderson Vieira', '12345677832', 'SP-123334');
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(5, 'Zete Jesus', '12345675697', 'SP-123443');
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(6, 'Jéssica Paulina', '12345673547', 'SP-123272');
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(7, 'Pedro Carvalho', '12345672058', 'SP-123151');
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(8, 'José Orlando', '12345676347', 'SP-123725');
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(9, 'Deuza Cruz', '12345672567', 'SP-123991');
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(10, 'Karolina Machado', '12345676264', 'SP-123678');
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(11, 'Marcos Purcino', '12345678921', 'SP-123247');
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(12, 'Brayan Oliveira', '12345673587', 'SP-123356');
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(13, 'Arthur Silveira', '12345671276', 'SP-123482');
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(14, 'Vânia Andrade', '12345673674', 'SP-123167');
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(15, 'Cilene Brito', '12345679697', 'SP-123647');
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(16, 'Ruan Carvalho', '12345672635', 'SP-123138');
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(17, 'Luíza Aparecida', '12345677821', 'SP-123943');
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(18, 'Guilherme Macedo', '12345676542', 'SP-123257');
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(19, 'Raphael Silva', '12345677821', 'SP-123112');
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(20, 'Otávio Vincente', '12345675950', 'SP-123325');



-- Inserindo dados na tabela Consulta
--
insert into consulta(id_consulta, data_consulta, hora_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) values(1, '1', '25/03/2025', '14:30:00' '1', '200.00', null);
insert into consulta(id_consulta, data_consulta, hora_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) values(2, '2', '20/02/2020', '15:00:00' '2', '400.00', null);
insert into consulta(id_consulta, data_consulta, hora_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) values(3, '3', '18/04/2020', '10:20:00' '3', '800.00', null);
insert into consulta(id_consulta, data_consulta, hora_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) values(4, '4', '10/05/2021', '18:00:00' '4', '900.00', null);
insert into consulta(id_consulta, data_consulta, hora_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) values(5, '5', '11/08/2021', '20:30:00' '5', '120.00', null);
insert into consulta(id_consulta, data_consulta, hora_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) values(6, '6', '17/02/2022', '19:10:00' '6', '300.00', null);
insert into consulta(id_consulta, data_consulta, hora_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) values(7, '7', '19/05/2021', '12:30:00' '7', '520.00', null);
insert into consulta(id_consulta, data_consulta, hora_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) values(8, '8', '09/05/2022', '16:30:00' '8', '630.00', null);
insert into consulta(id_consulta, data_consulta, hora_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) values(9, '9', '08/03/2022', '17:20:00' '9', '700.00', null);
insert into consulta(id_consulta, data_consulta, hora_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) values(10, '10', '22/12/2022', '11:30:00' '10', '1000.00', null);
insert into consulta(id_consulta, data_consulta, hora_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) values(11, '11', '29/07/2023', '09:40:00' '11', '150.00', null);
insert into consulta(id_consulta, data_consulta, hora_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) values(12, '12', '30/11/2023', '08:20:00' '12', '250.00', null);
insert into consulta(id_consulta, data_consulta, hora_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) values(13, '13', '04/08/2021', '22:00:00' '13', '450.00', null);
insert into consulta(id_consulta, data_consulta, hora_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) values(14, '14', '26/09/2024', '06:30:00' '14', '780.00', null);
insert into consulta(id_consulta, data_consulta, hora_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) values(15, '15', '22/07/2024', '07:00:00' '15', '960.00', null);
insert into consulta(id_consulta, data_consulta, hora_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) values(16, '16', '01/06/2024', '04:30:00' '16', '580.00', null);
insert into consulta(id_consulta, data_consulta, hora_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) values(17, '17', '11/03/2024', '05:40:00' '17', '280.00', null);
insert into consulta(id_consulta, data_consulta, hora_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) values(18, '18', '19/09/2024', '21:00:00' '18', '340.00', null);
insert into consulta(id_consulta, data_consulta, hora_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) values(19, '19', '20/03/2025', '21:30:00' '19', '380.00', null);
insert into consulta(id_consulta, data_consulta, hora_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) values(20, '20', '09/07/2025', '20:50:00' '20', '1500.00', null);



-- Inserindo dados na tabela Receita
--
insert into receita(id_receita, medicamento, qld_medicamento, instrucao_uso, consulta_id) values(1, 'Dipirona', '20 comprimidos', 'Tomar 1 comprimido a cada 8h por 5 dias' '1');
insert into receita(id_receita, medicamento, qld_medicamento, instrucao_uso, consulta_id) values(2, 'Paracetamol', '10 comprimidos', 'Tomar 2 comprimido a cada 8h por 5 dias' '2');
insert into receita(id_receita, medicamento, qld_medicamento, instrucao_uso, consulta_id) values(3, 'Ibuprofeno', '20 gotas', 'Tomar 20 gotas comprimido a cada 8h por 5 dias' '3');
insert into receita(id_receita, medicamento, qld_medicamento, instrucao_uso, consulta_id) values(4, 'Dorflex', '20 comprimidos', 'Tomar 1 comprimido a cada 8h por 5 dias' '4');
insert into receita(id_receita, medicamento, qld_medicamento, instrucao_uso, consulta_id) values(5, 'Novalgina', '10 gotas', 'Tomar 10 gotas a cada 8h por 5 dias' '5');
insert into receita(id_receita, medicamento, qld_medicamento, instrucao_uso, consulta_id) values(6, 'Loratadina', '30 gotas', 'Tomar 30 gotas a cada 8h por 5 dias' '6');
insert into receita(id_receita, medicamento, qld_medicamento, instrucao_uso, consulta_id) values(7, 'Desloratadina', '10 comprimidos', 'Tomar 2 comprimido a cada 8h por 5 dias' '7');
insert into receita(id_receita, medicamento, qld_medicamento, instrucao_uso, consulta_id) values(8, 'Allegra', '7 gotas', 'Tomar 7 gotas a cada 8h por 5 dias' '8');
insert into receita(id_receita, medicamento, qld_medicamento, instrucao_uso, consulta_id) values(9, 'Polaramine', '20 gotas', 'Tomar 20 gotas a cada 8h por 5 dias' '9');
insert into receita(id_receita, medicamento, qld_medicamento, instrucao_uso, consulta_id) values(10, 'Cetirizina', '6 comprimidos', 'Tomar 3 comprimido a cada 8h por 5 dias' '10');
insert into receita(id_receita, medicamento, qld_medicamento, instrucao_uso, consulta_id) values(11, 'Amoxicilina', '10 comprimidos', 'Tomar 5 comprimido a cada 8h por 5 dias' '11');
insert into receita(id_receita, medicamento, qld_medicamento, instrucao_uso, consulta_id) values(12, 'Azitromicina', '20 gotas', 'Tomar 20 gotas a cada 8h por 5 dias' '12');
insert into receita(id_receita, medicamento, qld_medicamento, instrucao_uso, consulta_id) values(13, 'Cefalexina', '40 gotas', 'Tomar 40 gotas a cada 8h por 5 dias' '13');
insert into receita(id_receita, medicamento, qld_medicamento, instrucao_uso, consulta_id) values(14, 'Clavulin', '15 gotas', 'Tomar 15 gotas a cada 8h por 5 dias' '14');
insert into receita(id_receita, medicamento, qld_medicamento, instrucao_uso, consulta_id) values(15, 'Ciprofloxacino', '15 comprimidos', 'Tomar 3 comprimido a cada 8h por 5 dias' '15');
insert into receita(id_receita, medicamento, qld_medicamento, instrucao_uso, consulta_id) values(16, 'Diclofenaco', '12 gotas', 'Tomar 12 gotas a cada 8h por 5 dias' '16');
insert into receita(id_receita, medicamento, qld_medicamento, instrucao_uso, consulta_id) values(17, 'Nimesulida', '60 comprimidos', 'Tomar 4 comprimido a cada 8h por 5 dias' '17');
insert into receita(id_receita, medicamento, qld_medicamento, instrucao_uso, consulta_id) values(18, 'Prednisona', '50 comprimidos', 'Tomar 8 comprimido a cada 8h por 5 dias' '18');
insert into receita(id_receita, medicamento, qld_medicamento, instrucao_uso, consulta_id) values(19, 'Meloxicam', '20 gotas', 'Tomar 20 gotas a cada 8h por 5 dias' '19');
insert into receita(id_receita, medicamento, qld_medicamento, instrucao_uso, consulta_id) values(20, 'Cetoprofeno', '14 comprimidos', 'Tomar 4 comprimido a cada 8h por 5 dias' '20');



-- Inserindo dados na tabela Quarto
--
insert into quarto(id_quarto, numero, tipo_id) values(1, '16', '1');
insert into quarto(id_quarto, numero, tipo_id) values(2, '54', '2');
insert into quarto(id_quarto, numero, tipo_id) values(3, '20', '3');
insert into quarto(id_quarto, numero, tipo_id) values(4, '30', '4');
insert into quarto(id_quarto, numero, tipo_id) values(5, '12', '5');
insert into quarto(id_quarto, numero, tipo_id) values(6, '70', '6');
insert into quarto(id_quarto, numero, tipo_id) values(7, '40', '7');
insert into quarto(id_quarto, numero, tipo_id) values(8, '15', '8');
insert into quarto(id_quarto, numero, tipo_id) values(9, '13', '9');
insert into quarto(id_quarto, numero, tipo_id) values(10, '22', '10');
insert into quarto(id_quarto, numero, tipo_id) values(11, '32', '11');
insert into quarto(id_quarto, numero, tipo_id) values(12, '36', '12');
insert into quarto(id_quarto, numero, tipo_id) values(13, '45', '13');
insert into quarto(id_quarto, numero, tipo_id) values(14, '27', '14');
insert into quarto(id_quarto, numero, tipo_id) values(15, '28', '15');
insert into quarto(id_quarto, numero, tipo_id) values(16, '39', '16');
insert into quarto(id_quarto, numero, tipo_id) values(17, '18', '17');
insert into quarto(id_quarto, numero, tipo_id) values(18, '06', '18');
insert into quarto(id_quarto, numero, tipo_id) values(19, '01', '19');
insert into quarto(id_quarto, numero, tipo_id) values(20, '07', '20');



-- Inserindo dados na tabela Internação
--
insert into internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, medico_id, paciente_id, quarto_id) values(1, '19/05/2020', '28/05/2020' '29/05/2020', null, '1', '1' '1');
insert into internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, medico_id, paciente_id, quarto_id) values(2, '20/05/2020', '29/05/2020', '30/05/2020' null, '2', '2' '2');
insert into internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, medico_id, paciente_id, quarto_id) values(3, '14/06/2020', '20/06/2020', '21/06/2020' null, '3', '3' '3');
insert into internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, medico_id, paciente_id, quarto_id) values(4, '14/03/2020', '19/03/2020', '20/03/2020' null, '4', '4' '4');
insert into internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, medico_id, paciente_id, quarto_id) values(5, '10/09/2020', '20/09/2020', '21/09/2020' null, '5', '5' '5');
insert into internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, medico_id, paciente_id, quarto_id) values(6, '08/04/2020', '14/04/2020', '15/04/2020' null, '6', '6' '6');
insert into internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, medico_id, paciente_id, quarto_id) values(7, '09/09/2020', '18/09/2020', '19/09/2020' null, '7', '7' '7');
insert into internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, medico_id, paciente_id, quarto_id) values(8, '17/07/2020', '26/07/2020', '27/07/2020' null, '8', '8' '8');
insert into internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, medico_id, paciente_id, quarto_id) values(9, '13/05/2021', '20/05/2021', '21/05/2021' null, '9', '9' '9');
insert into internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, medico_id, paciente_id, quarto_id) values(10, '29/07/2021', '10/08/2021', '11/08/2021' null, '10', '10' '10');
insert into internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, medico_id, paciente_id, quarto_id) values(11, '30/02/2021', '13/03/2021', '14/03/2021' null, '11', '11' '11');
insert into internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, medico_id, paciente_id, quarto_id) values(12, '31/05/2021', '15/06/2021', '16/06/2021' null, '12', '12' '12');
insert into internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, medico_id, paciente_id, quarto_id) values(13, '05/02/2022', '15/02/2022', '16/02/2022' null, '13', '13' '13');
insert into internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, medico_id, paciente_id, quarto_id) values(14, '29/04/2022', '10/05/2022', '11/05/2022' null, '14', '14' '14');
insert into internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, medico_id, paciente_id, quarto_id) values(15, '28/04/2022', '14/05/2022', '15/05/2022' null, '15', '15' '15');
insert into internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, medico_id, paciente_id, quarto_id) values(16, '06/08/2022', '16/08/2022', '17/08/2022' null, '16', '16' '16');
insert into internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, medico_id, paciente_id, quarto_id) values(17, '03/01/2023', '10/02/2023', '11/02/2023' null, '17', '17' '17');
insert into internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, medico_id, paciente_id, quarto_id) values(18, '09/07/2023', '20/07/2023', '21/07/2023' null, '18', '18' '18');
insert into internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, medico_id, paciente_id, quarto_id) values(19, '20/03/2023', '29/03/2023', '30/03/2023' null, '19', '19' '19');
insert into internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, medico_id, paciente_id, quarto_id) values(20, '25/08/2023', '30/08/2023', '31/08/2023' null, '20', '20' '20');



-- Inserindo dados na tabela Plantão
--
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values(1, '19/05/2020', '21:00:00', '1' '1');
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values(2, '20/05/2020', '18:00:00', '2' '2');
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values(3, '14/06/2020', '05:00:00', '3' '3');
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values(4, '14/03/2020', '10:00:00', '4' '4');
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values(5, '10/09/2020', '12:00:00', '5' '5');
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values(6, '08/04/2020', '13:00:', '6' '6');
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values(7, '09/09/2020', '14:30:00', '7' '7');
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values(8, '17/07/2020', '15:30:00', '8' '8');
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values(9, '13/05/2021', '16:20:00', '9' '9');
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values(10, '29/07/2021', '17:00:00', '10' '10');
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values(11, '30/02/2021', '19:20:00', '11' '11');
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values(12, '31/05/2021', '21:20:00', '12' '12');
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values(13, '05/02/2022', '18:40:00', '13' '13');
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values(14, '29/04/2022', '13:30:00', '14' '14');
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values(15, '28/04/2022', '18:20:00', '15' '15');
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values(16, '06/08/2022', '19:20:00', '16' '16');
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values(17, '03/01/2023', '17:20:00', '17' '17');
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values(18, '09/07/2023', '19:20:00', '18' '18');
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values(19, '20/03/2023', '21:40:00', '19' '19');
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values(20, '25/08/2023', '06:30:00', '20' '20');

