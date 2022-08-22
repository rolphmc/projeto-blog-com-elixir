# Tech Challenge

Bem vindo(a)! Esse é o Tech Challenge da Tradesquash!

O desenvolvimento desse projeto não requer experiência prévia com Elixir e por isso vamos disponibilizar um material de estudo ao final. Embora alguma experiência técnica mínima seja importante, estamos mais preocupados em saber se você aprende rápido e gosta de estudar novas tecnologias.

Quando a solução estiver pronta, você deve enviar o link do repositório no GitHub para o recrutador. Na sequência, te enviaremos as instruções para os próximos passos!

## O projeto

Nesse projeto vamos desenvolver um blog onde é possível criar publicações e comentários usando [Markdown](https://en.wikipedia.org/wiki/Markdown). As publicações precisam conter pelo menos: título, um autor e duas categorias distintas. Além disso, publicações e comentários podem ser feitos de maneira anônima.

### Diretrizes

- O projeto precisa ser feito utilizando [Elixir](http://elixir-lang.org/) e [Phoenix](https://www.phoenixframework.org/)
- Você precisa utilizar algum framework CSS como [Bootstrap](https://getbootstrap.com/) e [TailwindCSS](https://tailwindcss.com/) no frontend
- Os testes presentes na pasta `/test` precisam passar corretamente
- Todo o código adicional que for incluído precisa ser testado
- O código Elixir deve seguir as [convenções de nomenclatura](https://hexdocs.pm/elixir/1.12/naming-conventions.html) da linguagem
- As mensagens de commit presisam seguir o padrão [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)

### O que vamos avaliar?

Falando de código, sabemos que existe muita subjetividade no que diz respeito a "boas práticas". Sendo assim, preferimos ser pragmáticos e utilizar apenas critérios objetivos na hora da avaliação. O que realmente importa pra nós é: 

1. **A entrega foi realizada dentro do prazo combinado?**
2. **O candidato seguiu todas as diretrizes corretamente?**

Além da avaliação do código, levaremos em consideração se o candidato usou o tempo disponível pra entregar um projeto funcional e usável (pontos bônus para soluções criativas).

#### Bônus

Se você for mais experiente e quiser nos impressionar, vamos deixar alguns tópicos de sugestão que achamos interessante e chamariam a nossa atenção:

- Melhorar as interações da página usando [Animações](https://auto-animate.formkit.com/)
- Criar alguma coisa utilizando [LiveView](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.html)
- Adicionar alguma interação usando [AlpineJs](https://alpinejs.dev/)
- Rodar o projeto usando [Docker](https://www.docker.com/)
- Acrescentar imagens de capa e miniaturas na visualização das publicações
- Usar links legíveis para as publicações ([slugs](https://en.wikipedia.org/wiki/Clean_URL#Slug))

### Comandos básicos

* Instalar as dependencias com `mix deps.get`
* Criar e migrar no seu banco de dados local `mix ecto.setup`
* Iniciar o servidor `mix phx.server`
* Rodar os testes implementados `mix test`

## Referências

- [Elixir School](https://elixirschool.com/en)
- [Elixir Language](https://elixir-lang.org/getting-started/introduction.html)
- [Phoenix Framework](https://hexdocs.pm/phoenix/overview.html)