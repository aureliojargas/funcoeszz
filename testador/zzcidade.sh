# Sem argumentos, mostra uma cidade alatória

$ zzcidade			#→ --regex ^[A-ZÁÂÉÓ].* \([A-Z][A-Z]\)$

# Com argumento, procura pelo texto

$ zzcidade curitiba
Curitiba (PR)
Curitibanos (SC)
$

# Exemplos do texto de ajuda

$ zzcidade campos		# mostra as cidades com "Campos" no nome
Américo de Campos (SP)
Bernardino de Campos (SP)
Campos Altos (MG)
Campos Belos (GO)
Campos Borges (RS)
Campos Gerais (MG)
Campos Lindos (TO)
Campos Novos (SC)
Campos Novos Paulista (SP)
Campos Sales (CE)
Campos Verdes (GO)
Campos de Júlio (MT)
Campos do Jordão (SP)
Campos dos Goytacazes (RJ)
Capitão de Campos (PI)
Dores de Campos (MG)
Humberto de Campos (MA)
Lima Campos (MA)
Martinho Campos (MG)
Mojuí dos Campos (PA)
Monte Alegre dos Campos (RS)
Mário Campos (MG)
Siqueira Campos (PR)
São Gonçalo dos Campos (BA)
São José dos Campos (SP)
São Miguel dos Campos (AL)
$ zzcidade '(SE)'		# mostra todas as cidades de Sergipe
Amparo de São Francisco (SE)
Aquidabã (SE)
Aracaju (SE)
Arauá (SE)
Areia Branca (SE)
Barra dos Coqueiros (SE)
Boquim (SE)
Brejo Grande (SE)
Campo do Brito (SE)
Canhoba (SE)
Canindé de São Francisco (SE)
Capela (SE)
Carira (SE)
Carmópolis (SE)
Cedro de São João (SE)
Cristinápolis (SE)
Cumbe (SE)
Divina Pastora (SE)
Estância (SE)
Feira Nova (SE)
Frei Paulo (SE)
Gararu (SE)
General Maynard (SE)
Graccho Cardoso (SE)
Ilha das Flores (SE)
Indiaroba (SE)
Itabaiana (SE)
Itabaianinha (SE)
Itabi (SE)
Itaporanga d'Ajuda (SE)
Japaratuba (SE)
Japoatã (SE)
Lagarto (SE)
Laranjeiras (SE)
Macambira (SE)
Malhada dos Bois (SE)
Malhador (SE)
Maruim (SE)
Moita Bonita (SE)
Monte Alegre de Sergipe (SE)
Muribeca (SE)
Neópolis (SE)
Nossa Senhora Aparecida (SE)
Nossa Senhora da Glória (SE)
Nossa Senhora das Dores (SE)
Nossa Senhora de Lourdes (SE)
Nossa Senhora do Socorro (SE)
Pacatuba (SE)
Pedra Mole (SE)
Pedrinhas (SE)
Pinhão (SE)
Pirambu (SE)
Porto da Folha (SE)
Poço Redondo (SE)
Poço Verde (SE)
Propriá (SE)
Riachuelo (SE)
Riachão do Dantas (SE)
Ribeirópolis (SE)
Rosário do Catete (SE)
Salgado (SE)
Santa Luzia do Itanhy (SE)
Santa Rosa de Lima (SE)
Santana do São Francisco (SE)
Santo Amaro das Brotas (SE)
Simão Dias (SE)
Siriri (SE)
São Cristóvão (SE)
São Domingos (SE)
São Francisco (SE)
São Miguel do Aleixo (SE)
Telha (SE)
Tobias Barreto (SE)
Tomar do Geru (SE)
Umbaúba (SE)
$ zzcidade ^X			# mostra as cidades que começam com X
Xambioá (TO)
Xambrê (PR)
Xangri-lá (RS)
Xanxerê (SC)
Xapuri (AC)
Xavantina (SC)
Xaxim (SC)
Xexéu (PE)
Xinguara (PA)
Xique-Xique (BA)
$

# A lista completa de cidades tem exatamente...

$ zzcidade . | head -n 5550		#→ --lines 5550
