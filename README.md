# Biblioteca 74xx em VHDL



Implementação comportamental de circuitos integrados clássicos da série TTL 74xx usando VHDL.



## 🛠 Tecnologias Utilizadas

- **Linguagem:** VHDL (IEEE 1076)

- **Compilador/Simulador:** GHDL

- **Visualização de Ondas:** GTKWave



## 📦 Componentes Implementados

### Portas Lógicas

- [x] **7400:** Quad 2-input NAND

- [x] **7402:** Quad 2-input NOR

- [x] **7404:** Hex Inverter

...



### Combinacionais

- [x] **74138:** Decoder 3-to-8 (Active Low)

- [x] **74283:** 4-bit Full Adder (com Carry Lookahead logic)

...



### Sequenciais

- [x] **7474:** Dual D Flip-Flop (Preset/Clear Assíncronos)

- [x] **7476:** Dual JK Flip-Flop (Borda de descida)



## 🚀 Como rodar

Exemplo para o somador 74283:

\`\`\`bash

ghdl -a src/74283.vhd tb/tb_74283.vhd

ghdl -e tb_74283

ghdl -r tb_74283 --vcd=onda.vcd

gtkwave onda.vcd

\`\`\`



## 📸 Screenshots

(Aqui você coloca um print do GTKWave mostrando o contador contando ou o flip-flop funcionando. Isso vale ouro no portfólio!)