/*2) Criar o banco de dados LBD_202001 */
create database lbd_202001;

/*3) Definir o banco de dados acima como Default */
use lbd_202001;

/*4) Criar as seguintes tabelas abaixo - com chaves primárias e estrangeiras. 
SEX_Sexo (sex_cod, sex_descricao) */
create table SEX_Sexo 
(sex_cod integer not null auto_increment, 
 sex_descricao varchar(20) not null,
  primary key (sex_cod)
  );
 
/*CLI_Cliente (cli_cod, cli_nome, cli_endereço, cli_dt_nasc, cli_cpf, sex_cod)  sex_cod referencia SEX_Sexo */
create table CLI_Cliente 
(cli_cod integer not null auto_increment, 
 cli_nome varchar(50) not null, 
 cli_endereço varchar(100), 
 cli_dt_nasc date not null, 
 cli_cpf char(11) not null, 
 sex_cod integer,
 primary key(cli_cod),
 foreign key (sex_cod) references SEX_Sexo(sex_cod) on delete set null on update cascade,
 unique key (cli_cpf)
 );
 
/*CAT_Categoria (cat_cod, cat_descricao, cat_valor_diaria) */
create table CAT_Categoria 
(cat_cod integer not null auto_increment, 
 cat_descricao varchar(40) not null, 
 cat_valor_diaria decimal(6,2) not null,
 primary key(cat_cod)
 );
 
/*MVC_Modelo_Veiculo (mvc_cod, cat_cod, mvc_descricao, mvc_nr_passag)  cat_cod referencia CAT_Categoria */
create table MVC_Modelo_Veiculo 
(mvc_cod integer not null auto_increment, 
 cat_cod integer, 
 mvc_descricao varchar(50) not null, 
 mvc_nr_passag smallint,
 primary key(mvc_cod),
 foreign key (cat_cod) references CAT_Categoria(cat_cod) on delete set null on update cascade
 );
 
/*VEI_Veiculo (vei_cod, vei_chassis, vei_placa, vei_ano_fab, vei_ano_mod, vei_dt_aquisicao, mvc_cod)  mvc_cod referencia MVC_Modelo_Veiculo */
 create table VEI_Veiculo 
 (vei_cod integer not null auto_increment, 
  vei_chassis varchar(50) not null, 
  vei_placa varchar(14) not null, 
  vei_ano_fab year not null, 
  vei_ano_mod year not null, 
  vei_dt_aquisicao date, 
  mvc_cod integer,
  primary key(vei_cod),
  foreign key (mvc_cod) references MVC_Modelo_Veiculo(mvc_cod) on delete set null on update cascade
 );
/*LOC_Locacao (loc_cod, cli_cod, vei_cod, dt_hr_locacao, dt_hr_devolucao, vl_bruto, vl_desconto, vl_pagar, vl_pago)  cli_cod referencia CLI_Cliente vei_cod referencia VEI_Veiculo */
create table LOC_Locacao 
(loc_cod integer not null auto_increment, 
 cli_cod integer, 
 vei_cod integer, 
 dt_hr_locacao datetime not null, 
 dt_hr_devolucao datetime, 
 vl_bruto decimal(8,2) not null, 
 vl_desconto decimal(8,2), 
 vl_pagar decimal(8,2), 
 vl_pago decimal(8,2),
 primary key(loc_cod),
 foreign key (cli_cod) references CLI_Cliente(cli_cod) on delete set null on update cascade,
 foreign key (vei_cod) references VEI_Veiculo(vei_cod) on delete set null on update cascade
 );


