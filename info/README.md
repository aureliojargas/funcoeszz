## Informações das Funções ZZ

Aqui estão scripts que fornecem informações sobre alguns detalhes da funções.

Esses scripts são ferramentas auxiliares na confecção, correção, melhoria ou exclusão de uma ou mais funcionalidades.

Seu uso não é obrigatório, e nem influi em nenhuma das funcionalidades das demais funções.

```
autores.sh      Listar e datar as funcoeszz e seus autores.
                Passando um argumento, filtra a listagem de saída.
                Ex.: ./autores.sh           # Todas as funções com data de criação e autor
                Ex.: ./autores.sh Aurelio   # Apenas as funções de autoria do Aurelio

quantidade.sh:  Listar e quantificar as funcoeszz por autor ou ano.
                Pode-se usar ano ou autor/autores como argumento, para definir qual o tipo de listagem.
                Se não for usado, assume-se por padrão 'ano'.
                Ex.: ./quantidade.sh        # Quantificar as funções feitas em cada ano
                Ex.: ./quantidade.sh autor  # Quantificar as funções feitas por cada autor

linhas.sh:      Exibe a quantidade de linhas das funcoeszz.
```
Obs.:
 Os 3 scripts acima podem ter a opção do primeiro argumento ser "off", "todas/todos".
  - Com a opção "off" as buscas são feitas nas funções desativadas
  - Com a opção "todas" ou "todos", as buscas são feitas tanto nas funções ativas como nas desativadas
  - Sem opção, as buscas são feitas nas funções ativas



```
requisitos.sh:  Listar dependências e dependentes de cada função.
                Lista as funções com suas dependẽncias e também as funções que são dependentes dela.
                Possibilita avaliar o impacto que mudanças, rastreando aquelas funções que dependem
                da função alterada.
                Se usar o argumento zztool/tool, faz-se o rastreamento das funções que dependam das
                ferramentas da zztool.
                Com um segundo argumento, filtra-se apenas pela ferramenta da zztool selecionada.
                Ex.: ./requisitos.sh                # Todas as funções com seus requisitos
                                                    # e as funções que tem dependência da mesma

                     ./requisitos.sh zzutf8         # Requisitos da zzutf8
                                                    # e funções que dependem da zzutf8

                     ./requisitos.sh zztool         # Funções que dependem de alguma zztool
                     ./requisitos.sh zztool nl_eof  # Funções que dependem de zztool nl_eof
                                                    # Obs.: eco e erro não são pesquisados
```
Obs.: Apenas faz análise das funções ativas.



```
desativadas.sh  Listar e datar funçoes desativadas.
                Lista as funções desativadas, com a data do evento e o motivo.
```

