# Clinickr App

## Configurando o projeto

### Antes de rodar o projeto pela primeira vez, precisamos configurar os containers docker 

Configuração rede e Container do banco de dados:

```
$ make db.setup
```
Configuração Container do ambiente de desenvolvimento:
```
$ make app.setup
```

Para configurar o banco de dados rode dentro do ambiente de desenvolvimento:
```
# rake db:create
# rake db:migrate
# rake db:tests:prepare
```
Para rodar os testes rode dentro do ambiente de desenvolvimento:
```
# rspec
```
Caso o Container se encontre desativado:
```
$ make db.upp
$ make app.upp
```
Para entrar no ambiente de desenvolvimento:
```
$ make app.exec
```


## API

Requisição:
```
GET /tests/IQCZ17
```

Resposta:
```
{
  "result_token": "IQCZ17",
  "result_date": "2021-08-05",
  "cpf": "048.973.170-88",
  "name": "Emilly Batista Neto",
  "email": "gerald.crona@ebert-quigley.com",
  "birthday": "2001-03-11",
  "doctor": {
    "crm": "B000BJ20J4",
    "crm_state": "PI",
    "name": "Maria Luiza Pires"
  },
  "tests": [
    {
      "test_type": "hemácias",
      "test_limits": "45-52",
      "result": 97
    },
    {
      "test_type": "leucócitos",
      "test_limits": "9-61",
      "result": 89
    },
    {
      "test_type": "plaquetas",
      "test_limits": "11-93",
      "result": 97
    },
    {
      "test_type": "hdl",
      "test_limits": "19-75",
      "result": 0
    },
    {
      "test_type": "ldl",
      "test_limits": "45-54",
      "result": 80
    },
    {
      "test_type": "vldl",
      "test_limits": "48-72",
      "result": 82
    },
    {
      "test_type": "glicemia",
      "test_limits": "25-83",
      "result": 98
    }
  ]
}
```




