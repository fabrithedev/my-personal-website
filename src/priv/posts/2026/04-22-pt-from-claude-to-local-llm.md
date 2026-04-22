
%{
    title: "Do Claude para uma LLM local",
    author: "Fabricio Damazio",
    tags: ~w(programming),
    description: "Testei Claude Pro por um mês e acabei escolhendo uma LLM local com OpenCode."
}
---

<p align="center">
    <img src="/images/posts/2026/04-22-opencode.png" alt="Tela inicial do OpenCode aberta no terminal" width="384" height="544">
</p>

Após a minha ótima experiência com Tidewave e Copilot que relatei no post anterior, este mês aproveitei alguns dias de férias para me aprofundar um pouco mais nos meus experimentos. Dessa vez o objetivo foi testar dois extremos opostos quando falamos em programar com auxílio de IA: Claude Code e um modelo local com OpenCode. O primeiro tem um custo elevado e é considerado por muitos o estado da arte da IA para programação. Já os modelos locais significam liberdade, privacidade e economia.  

# Claude Code Pro

A assinatura mais barata do Claude é a Pro. Paguei $20 dólares por um mês de acesso e comecei os testes. Baixei a versão desktop, terminal e também utilizei integração com o Zed e Tidewave. A experiência no terminal achei bem divertida e fluida. Passei os primeiros dias criando projetos aleatórios e os limites pareceram bem razoáveis. O desempenho do Opus 4.6 impressiona para quem está acostumado a usar apenas modelos free ou de entrada. Essa primeira experiência foi, no mínimo, empolgante.

Mostrei para alguns amigos os resultados e realmente achei que, por $20 dólares/mês, o Claude entregava bastante, mas essa percepção durou apenas uma semana. Os limites por sessão (que duram cerca de 5 horas) e semanais foram diminuídos de maneira agressiva e isso me fez atingir os limites rapidamente. Essa diminuição veio sem aviso e afetou inclusive quem já tinha assinatura assim como eu. Minha alegria durou pouco, bem pouco. A sensação agora é de que $20 dólares por mês não vale a pena.

Pontos positivos no teste do Claude:
- Os modelos realmente são bons. Opus e Sonnet estão entre os melhores que usei.
- A experiência do terminal é realmente muito boa.
- Os preços eram justos ANTES dos limites caírem.
- Skills funcionaram muito bem.
- Criador de skills me ajudou a criar skills muito úteis.

Pontos negativos:
- A aplicação desktop é uma pilha de lixo.
- A aplicação mobile é pior ainda.
- Os limites foram cortados mesmo para quem tinha acabado de assinar. Zero respeito com os assinantes.
- Os limites atuais tornam a assinatura Pro apenas uma assinatura de demonstração. Não vale a pena.

# A RTX 4090 que se tornou útil por acaso

Comprei minha RTX 4090 em outubro de 2023. Sempre foi um sonho de adolescente ter uma GPU topo de linha, mas nunca tive condições financeiras quando mais novo. Na época, era pra jogar mesmo. Modelos de IA local ainda eram bem primitivos, rodavam devagar e a qualidade era longe do que vemos hoje. Ninguém comprava uma placa topo de linha pensando em rodar LLMs. Agora em 2026 o cenário mudou e esta placa de vídeo é considerada um dos melhores hardwares de nível de consumidor para rodar modelos locais. Uma feliz coincidência.

# LM Studio + Qwen3.6 + OpenCode

Fui viajar uns dias e aproveitar a vida fora do computador. Durante a viagem, li sobre o novo modelo da Qwen e que seus resultados (rodando localmente) impressionaram muita gente. O modelo é o Qwen3.6-35b-a3b, e os benchmarks estavam na faixa de modelos muito superiores em qualidade. Variantes deste modelo podem rodar inteiramente na minha GPU a uma taxa próxima de 100 tokens por segundo. Fantástico!

Quando voltei, não pensei duas vezes. Instalei o LM Studio, baixei o modelo e comecei a testar.

O LM Studio é basicamente um servidor local que roda modelos de IA. A interface é simples: você baixa o modelo, roda o servidor, e ele fica disponível numa URL local. O OpenCode é o cliente, um agente de IA que se conecta ao servidor e executa as tarefas.

A configuração foi simples. Instalei o LM Studio, procurei o modelo Qwen3.6-35b-a3b e fiz o download. Configurei o OpenCode para apontar pro LM Studio e pronto.

A primeira vez que rodei o OpenCode com o Qwen local, a experiência foi... familiar. O fluxo é basicamente o mesmo do Claude Code: você dá um prompt, o agente trabalha no terminal, faz alterações nos arquivos, roda testes, e vai iterando até resolver o problema. A diferença é que tudo roda na minha máquina.

Fiz alguns testes rápidos como implementar pequenas features num projeto existente, refatorar umas funções, escrever testes. Para o meu tipo de uso, que é bem básico (IA como assistente pontual, sem múltiplos agentes ou automações complexas), o resultado foi impressionante. O modelo entendeu o contexto do código, fez as mudanças corretamente sem muito esforço. Um erro aqui e outro ali, mas nada que uma revisão manual não resolva. A qualidade do código gerado foi surpreendentemente boa.

A RTX 4090 com 24GB de VRAM aguenta o modelo sem problemas. As respostas são rápidas o suficiente pra manter o fluxo de trabalho (muitas vezes mais rápidas que o Claude Code), e o custo por token é muito baixo, basicamente a energia elétrica. Sem limites e sem ansiedade de queimar tokens.

# Comparando os dois mundos

Pra ser honesto, pro meu uso não consigo ver grandes diferenças entre o Qwen local e o Claude com Opus. Ambos entendem o contexto, ambos fazem o que pedimos, ambos exigem revisão humana no final. A diferença definitivamente não está na qualidade do resultado.

Com Claude, você paga por isso, mas depende de limites, de internet, de uma empresa decidindo que vai mudar as regras do jogo no meio do mês. Com o modelo local, você paga uma vez no hardware e roda o que quiser, sem limite de sessões e com liberdade de escolha de modelos. A privacidade é outra vantagem óbvia.

A desvantagem? Precisa de hardware bom. Uma RTX 4090 não é barata e não é pequena.  
Vale lembrar que para outros fluxos de trabalho diferentes do meu, por exemplo com múltiplos agentes rodando de forma autônoma, talvez o resultado não seja tão legal assim.

# Conclusão

Cancelei a assinatura do Claude por enquanto. Vou seguir com o modelo local por um tempo pra ver como as coisas se desenrolam. Até agora, a experiência tem sido sólida. O setup local parece resolver o que preciso.

Não vou dizer que um modelo local é melhor. Cada um tem seu lugar. Mas pra quem tem hardware adequado e quer fugir de limites arbitrários e assinaturas que mudam todo mês, é uma alternativa que vale a pena considerar.

---
