%{
    title: "Adotando Ubuntu e Zed para desenvolvimento em Godot",
    author: "Fabricio Damazio",
    tags: ~w(linux programming),
    description: "Hora de ser pragmático."
}
---

Poucos meses atrás escrevi um post entusiasmado sobre Linux Ricing. Desde então
aprendi muito sobre o Linux e seu funcionamento e posso dizer sem medo que foi
a melhor experiência que tive em 2025. Me adaptei rapidamente ao meu novo fluxo
de trabalho focado em uso do teclado pra navegação usando o Hyprland. Mas então
porque um post sobre adotar Ubuntu?

## Arch Linux e Hyprland - os prós e os contras

O Arch Linux é uma distro sem comentários. Todos deveriam usar pelo menos uma 
vez nada vida. Ela te permite ter profundidade em diversos conhecimentos sobre
seu sistema operacional. É algo realmente apaixonante. O que funcinou e o que 
não funcinou pra mim?

### O que funcionou? 
Com toda certeza o fluxo de trabalho focado no teclado do Hyprland e a 
facilidade para personalizar cada detalhe necessário. Para programar eu não
tive nenhuma experiência minimamente parecida ainda.
  
### O que não funcionou?
A Godot Engine. Veja bem, ela funcionou 99% do tempo bem mas principalmente o
fato do Arch Linux utilizar rolling release me levou algumas vezes a alguns
bugs desnecessários (por exemplo relacionados a Wayland e a libdecor). 
Não é nada grave mas me levou a perder tempo para entender do que se tratava o
bug e procurar soluções de contorno. Obviamente esse incomodo tem origem na 
minha skill issue em lidar pela primeira vez com uma distro que utiliza 
rolling release. Mas foram esses problemas que me levaram a ter alguns
pensamentos sobre ser pragmático na minha escolha.
  
### Pragmatismo de escolha

Desenvolvendo na Godot, eu precisei tomar uma decisão: lidar com os eventuais
problemas que podem surgir quando esta usando o estado da arte em termos de 
sistema operacioanal ou fazer uma escolha mais conservadora que prioriza a
estabilidade do ambiente de desenvolvimento e testes.

Quando se esta desenvolvendo um jogo na Godot um jogo para PC, existem duas 
plataformas principais em que você precisa assegurar que seu jogo funciona
bem: Windows e Linux. 

Para testar minhas builds Windows eu reinstalei o Windows 11 (sad) e para as
ser meu ambiente de desenvolvimente e testes do Linux eu preferi por adotar
o Ubuntu. Sim, existem diversas opções de distros que se encaixariam aqui como
Fedora, Debian, etc, mas escolhi o Ubuntu pela familiaridade com ele e porque
eu realmente gosto do GNOME do Ubuntu (me julguem).

Obviamente que personalizei um pouco o Ubuntu para atender minhas necessidades
mas tentei deixar tudo o mais vanilla possível para ter um ambiente bem neutro
e estável para meus testes.

Outra decisão que tomei foi dar mais uma vez uma chance para o editor ZED.
Eu uso a versão não stable do Neovim e por algumas vezes tenho que dar algumas
manutenções nos plugins. Deixei o Neovim como um editor secundário e 
o ZED para programar e trabalhar com Godot.

Na minha cabeça essas decisões fazem sentido mas preciso ver se isso vai se
traduzir em mais simplificidade no dia a dia.

Continuo adorando meu Neovim e Arch Linux, mas esse ano eu preciso ser pragmático
para que meus planos funcionem.
  
---
