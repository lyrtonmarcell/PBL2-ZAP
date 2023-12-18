# PBL2-ZAP

# 1. Introdução.

No cenário atual, onde a comunicação instantânea é essencial para a eficiência e colaboração nas empresas, a relevância dos aplicativos de mensagens é inquestionável. Estes aplicativos não apenas facilitam a troca de informações, mas também redefinem os padrões de comunicação, proporcionando recursos avançados como chamadas de vídeo, compartilhamento de arquivos e integração com diversas plataformas. A segurança, através da criptografia de ponta a ponta, é um componente crucial para proteger a privacidade das comunicações.

Neste contexto, uma startup contratou a equipe de desenvolvimento para criar um software de mensagens instantâneas focado no ambiente corporativo, baseado no modelo peer-to-peer (P2P). O desafio é implementar uma solução descentralizada, sem a dependência de um servidor central, permitindo a troca segura de mensagens de texto entre grupos de usuários dentro de uma empresa.

O protótipo deve operar utilizando sockets UDP, considerando o modelo de falhas da Internet, onde tanto mensagens quanto processos podem sofrer falhas de omissão. O serviço deve oferecer confiabilidade, garantindo que uma mensagem seja recebida apenas uma vez e exibida na mesma ordem em todas as interfaces dos usuários. Além disso, mensagens não visualizadas durante a desconexão do usuário devem ser apresentadas quando ele se reconectar ao sistema.

# 2. Fundamentação Teórica

Para a construção desse sistema conceitos deveriam ser bem consolidados, tornando-os base para esse trabalho.

# 2.1 Modelo Peer-to-Peer (P2P):

As redes P2P surgiram em 1999, inicialmente associadas a controvérsias, como o caso do Napster, mas evoluíram para desempenhar papéis valiosos e legais. Essas redes são formadas por computadores domésticos, chamados peers. A característica fundamental é a capacidade de compartilhar recursos, onde cada computador atua alternadamente como cliente, buscando conteúdo, e como servidor, fornecendo conteúdo para outros peers. O grande atrativo das redes P2P é a ausência de uma infraestrutura centralizada, permitindo que qualquer pessoa contribua para a distribuição de conteúdo.

O protocolo P2P mais proeminente hoje é o BitTorrent, amplamente utilizado para compartilhar vídeos licenciados e de domínio público, além de outros conteúdos volumosos. Ao contrário das CDNs, que exigem uma grande empresa para operação, as redes P2P capacitam qualquer indivíduo com um computador a participar ativamente na distribuição de conteúdo, proporcionando uma notável capacidade de competir com os maiores sites da web. Esse aspecto descentralizado e democratizado das redes P2P é o que as torna atrativas, permitindo que até mesmo indivíduos e pequenas comunidades exerçam influência significativa na distribuição de conteúdo online.

# 2.2 Sockets UDP:

O UDP é um protocolo de transporte não orientado a conexões, integrante do conjunto de protocolos da Internet. Diferentemente do TCP, que oferece uma comunicação confiável e orientada a conexões, o UDP é projetado para simplicidade e eficiência em aplicações que não requerem garantia de entrega.

Principais Características do UDP:

1. Simplicidade:

O UDP é um protocolo simples, oferecendo uma camada básica para envio de datagramas IP encapsulados.

2. Ausência de Conexão:

Não é necessário estabelecer uma conexão antes da transmissão de dados. Isso o torna ideal para aplicações que necessitam de baixa sobrecarga de comunicação.

3. Demultiplexação via Portas:

Utiliza portas para identificar pontos extremos nas máquinas de origem e destino, permitindo a demultiplexação de dados para os processos corretos.

4. Cabeçalho Simples:

O cabeçalho UDP consiste em 8 bytes, contendo informações como portas de origem e destino, comprimento do segmento e um campo de checksum opcional.

5. Checksum para Confiança:

Oferece um campo de checksum opcional para detecção de erros, somando-se ao cabeçalho, dados e um pseudocabeçalho conceitual do IP.

6. Sem Controle de Fluxo ou Retransmissão:

Ao contrário do TCP, o UDP não realiza controle de fluxo, controle de congestionamento ou retransmissão após a chegada de segmentos incorretos. Essas responsabilidades são delegadas aos processos de usuário.

7. Aplicações Cliente-Servidor:

Adequado para aplicações onde o cliente envia solicitações curtas e espera respostas curtas do servidor, como no caso do DNS (Domain Name System).

8. Eficiência em Comunicações Simples:

Enquanto aplicações que exigem controle preciso sobre o fluxo, erros ou sincronização podem optar por TCP, o UDP é eficiente em situações onde menos mensagens e preparação inicial são necessárias.

# 2.3 Relógio Lógico - Relógio de Lamport

Em sistemas distribuídos, onde múltiplos processos operam independentemente, a coordenação temporal é crucial para garantir a consistência e a ordem das operações. O Relógio Lógico de Lamport, proposto por Leslie Lamport em 1978, é uma abordagem para estabelecer uma noção parcial de ordem entre eventos em sistemas distribuídos, sem depender de relógios físicos precisos.

O relógio de Lamport se aplica em ambientes distribuídos permitindo que cada evento em um processo seja marcado com um carimbo de tempo lógico. Essa marcação é uma tupla de dois elementos: o tempo local do processo e o identificador único do processo, desse modo estabelece-se uma relação de ordem parcial entre eventos, caso o evento A precede o evento B, então o carimbo de tempo lógico de A é menor que o de B, fazendo com que sempre que se ocorre um evento, o carimbo de tempo do processo é incrementado. No entanto, embora eficaz para estabelecer uma ordem parcial entre eventos, o Relógio Lógico de Lamport não lida com as variações nos atrasos de comunicação nem com os desvios nos relógios físicos dos processos.

# 2.4 Criptografia

