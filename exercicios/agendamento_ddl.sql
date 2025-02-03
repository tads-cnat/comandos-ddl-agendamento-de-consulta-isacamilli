-- Exercicio realizado pelos alunos Isabella Camilli, Flavio Matias e Clara Lima.

 CREATE TABLE Pessoa(
   cpf char(11) PRIMARY key,
   email  varchar(50) not null UNIQUE,
   nome varchar(150) NOT null,
   data_nasc date not null,
   endereco varchar(300) not null,
   telefone varchar(15) null
);

CREATE TABLE Paciente (
  cpf_pessoa char(11) PRIMARY KEY,
  senha VARCHAR(225) not NULL,
  plano_saude VARCHAR(100),
  FOREIGN KEY (cpf_pessoa) REFERENCES Pessoa(cpf)
  );
  
  CREATE TABLE Medico (
    cpf_pessoa CHAR(11) PRIMARY KEY,
    crm VARCHAR(10) UNIQUE not NULL,
    FOREIGN KEY (cpf_pessoa) REFERENCES Pessoa(cpf)
  );
    
 CREATE TABLE Especialidade (
   id serial PRIMARY KEY,
   descricao VARCHAR(300) NOT NULL
   );
   
 CREATE TABLE Medico_especialidade (
   cpf_medico VARCHAR(10),
   id_especialidade INT,
   PRIMARY KEY (crm_medico, id_especialidade),
   FOREIGN KEY (cpf_medico) REFERENCES Medico(cpf_pessoa),
   FOREIGN KEY (id_especialidade) REFERENCES Especialidade(id)
  );
  
  CREATE TABLE Agendamento (
    cpf_paciente CHAR(11),
    dh_consulta TIMESTAMP,
    cpf_medico CHAR(11),
    dh_agendamento TIMESTAMP not NULL,
    valor_consulta DECIMAL(10,2),
    PRIMARY key (cpf_paciente, dh_consulta, cpf_medico),
    FOREIGN KEY (cpf_paciente) REFERENCES Paciente(cpf_pessoa),
    FOREIGN key (cpf_medico) REFERENCES medico(cpf_pessoa)
  );
