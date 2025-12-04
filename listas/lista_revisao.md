# 🧱 Tópico 1: Autorreferência e Árvores (Parte 2)

**Foco:** Dados com tamanho arbitrário e estruturas hierárquicas.

## 🧠 Check-Teórico (Responda mentalmente)

1. Por que definimos Números Naturais como um dado recursivo em PF, se o computador já tem inteiros?
2. Qual a diferença entre o caso base e o caso recursivo na definição de uma Árvore Binária?
3. O que acontece se tentarmos resolver o problema de verificar se um número é primo usando apenas recursão estrutural pura (o modelo padrão)? Funciona? Por que?

## 💻 Exercícios Práticos

- **Nível 1 (Aquecimento):** Crie um tipo `Arvore(Int)`. Implemente uma função que some todos os valores dos nós.

- **Nível 2 (Padrão de Prova):** Implemente a função altura de uma árvore. Lembre-se: árvore vazia tem altura -1 ou 0 dependendo da definição (nos slides é -1 para vazia e 0 para folha única).

- **Nível 3 (Desafio/Sistema de Arquivos):** Defina um tipo para Sistema de Arquivos (Diretórios e Arquivos). Crie uma função que receba essa árvore e retorne uma lista com o caminho completo de todos os arquivos com extensão ".txt" (ex: "pasta/subpasta/nota.txt").

---

# 🔄 Tópico 2: Processamento Simultâneo

**Foco:** Lidar com dois ou mais inputs complexos (listas) ao mesmo tempo.

## 🧠 Check-Teórico

1. Quais são as 3 estratégias para processar dois argumentos complexos?
2. Quando devo tratar um argumento como atômico e o outro como recursivo? (Dica: pense na complexidade ou se um deles é apenas "leitura").
3. No caso de processamento sincronizado (ex: somar duas listas elemento a elemento), o que você deve fazer se as listas tiverem tamanhos diferentes?

## 💻 Exercícios Práticos

- **Nível 1 (Aquecimento):** Implemente `zip(lista_a, lista_b)` que cria uma lista de tuplas. Pare quando a menor lista acabar.

- **Nível 2 (Padrão de Prova - Prefixo):** Implemente `is_prefix(lsta, lstb)` que retorna `True` se `lsta` é o início de `lstb`.
  - Pegadinha: O que acontece se `lsta` for vazia? E se `lstb` for vazia?

- **Nível 3 (Desafio - Interseção de Conjuntos):** Implemente uma função que receba duas listas de números ordenados e retorne uma nova lista apenas com os números que aparecem em ambas. Você deve fazer isso percorrendo as duas listas simultaneamente (sem usar `contains` aninhado), aproveitando que elas estão ordenadas.

---

# 🧩 Tópico 3: Funções como Valores (HOF)

**Foco:** `map`, `filter`, `fold`, lambdas e `use`.

## 🧠 Check-Teórico

1. O que é um "Fechamento" (Closure) e por que ele é necessário quando uma função interna acessa uma variável que não é parâmetro?
2. Explique a diferença entre `fold` (esquerda) e `fold_right`. Quando o resultado é diferente?
3. O que o açúcar sintático `use` faz em Gleam?

## 💻 Exercícios Práticos

- **Nível 1 (Aquecimento):** Reescreva uma função que soma uma lista de inteiros usando `list.fold`.

- **Nível 2 (Reimplementação):** Implemente a sua própria versão de `map` e `filter` utilizando apenas `fold` (ou `reduz`). Isso prova que você entende a universalidade do `fold`.

- **Nível 3 (Desafio com use):** Crie uma função `soma_arquivos(a: String, b: String) -> Result(Int, Nil)` que tenta converter duas strings para `Int` e somá-las. Use a sintaxe `use` (ou `result.try`) para lidar com os possíveis erros de conversão sem fazer um "pyramid of doom" de `case`.

---

# 📈 Tópico 4: Acumuladores e Recursão em Cauda

**Foco:** Otimização e contexto.

## 🧠 Check-Teórico

1. Por que a recursão estrutural normal "perde contexto"? Dê um exemplo (ex: distâncias relativas vs absolutas).
2. O que é Recursão em Cauda (Tail Recursion) e por que ela é equivalente a um loop `while` em C/Java?
3. Qual a complexidade de tempo de inverter uma lista usando recursão normal vs. usando acumulador? ($O(n^2)$ vs $O(n)$)

## 💻 Exercícios Práticos

- **Nível 1 (Aquecimento):** Implemente fatorial usando acumulador.

- **Nível 2 (Conversão de Contexto):** Resolva o problema das "Distâncias Relativas para Absolutas".
  - Entrada: `[10, 5, 5]` (distâncias entre pontos).
  - Saída: `[10, 15, 20]` (distância da origem).
  - Dica: Use um acumulador para guardar a soma atual.

- **Nível 3 (Otimização):** Implemente `inverte_lista` usando acumulador para garantir que seja $O(n)$ e Tail Recursive.

---

# ✂️ Tópico 5: Recursão Generativa

**Foco:** Algoritmos de divisão e conquista, ordenação.

## 🧠 Check-Teórico

1. Qual a diferença fundamental entre Recursão Estrutural e Generativa?
2. Por que em recursão generativa você é obrigado a provar/argumentar que a função termina, enquanto na estrutural não?
3. Qual é o caso base do QuickSort?

## 💻 Exercícios Práticos

- **Nível 1 (Aquecimento):** Implemente o `range(start, end)` que gera uma lista de números. Isso é generativo (você gera a lista, não consome uma estrutura).

- **Nível 2 (Agrupamento):** Implemente a função `agrupa(lista, n)` que quebra uma lista em sub-listas de tamanho `n`.
  - Estratégia: Pegue os primeiros `n` (gere um grupo), e chame recursivamente para o resto.

- **Nível 3 (O Algoritmo Real - QuickSort):** Implemente o QuickSort em Gleam.
  - Escolha o pivô (primeiro elemento).
  - Use `filter` para criar a lista de menores e maiores.
  - Recursão: `quicksort(menores) + [pivo] + quicksort(maiores)`.

---

# 💀 O Desafio Final (Simulador de Prova Difícil)

Se você conseguir resolver este exercício, você está pronto para qualquer coisa na prova:

**Problema:** "O Processador de Logs"

Você tem uma lista de logs de servidor. gCada lo é uam String no formato `"INFO: User1 logou"`, `"ERROR: Falha DB"`, etc.

**Tarefas (em uma única pipeline funcional):**

1. Filtrar apenas os logs que são "ERROR".
2. Limpar a string para pegar apenas a mensagem (remova o "ERROR: ").
3. Contar quantas vezes cada mensagem de erro específica apareceu.
4. Retornar um `Dict(String, Int)` com essa contagem.

**Requisitos:**

- Use `list.filter`, `list.map` e `list.fold` (ou equivalentes).
- Use pipe `|>` para encadear.
- Não use recursão manual explícita (use as HOFs).