# VoidLib

**VoidLib** é uma biblioteca de interface gráfica (UI) para Roblox, desenvolvida para ser rápida, leve e fácil de usar. Possui interface moderna, animações suaves e diversos componentes prontos para facilitar o desenvolvimento dos seus scripts.

---

# ✨ Recursos

- 🖥️ Janela moderna
- 📂 Sistema de abas
- 🔘 Botões
- ✅ Toggles
- 🎚️ Sliders
- 📋 Dropdowns
- ⌨️ Textbox
- 📝 Labels
- ➖ Separadores
- 📏 Linhas
- 🔔 Alertas
- ✨ Alertas com borda
- 🎨 Sistema de temas
- 🖱️ Interface arrastável
- 👁️ Botão flutuante para ocultar/exibir
- ⌨️ Atalho pela tecla **Insert**

---

# 📥 Instalação

Carregue a biblioteca utilizando:

```lua
local VoidLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/VoidGrok/VoidLib/main/VoidLib.lua"))()
```

---

# 🎨 Temas

Defina o tema antes de carregar a biblioteca.

```lua
_G.Theme = "Blue"

local VoidLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/VoidGrok/VoidLib/main/VoidLib.lua"))()
```

## Temas disponíveis

```text
Red
Blue
DarkBlue
Cyan
Green
LightGreen
Purple
Zinc
Default
```

---

# 🪟 Criando uma Janela

```lua
local Janela = VoidLib.Window("Meu Script")
```

---

# 📂 Criando uma Aba

```lua
local Principal = Janela.Tab(
    "Principal",
    "rbxassetid://10734950309"
)
```

| Parâmetro | Tipo | Descrição |
|-----------|------|-----------|
| Nome | string | Nome da aba |
| Ícone | string | AssetId do Roblox |

---

# 🔘 Botão

```lua
Principal:Button("Executar", function()

    print("Botão clicado!")

end)
```

---

# ✅ Toggle

```lua
Principal:Toggle(
    "Auto Farm",
    "Liga ou desliga o Auto Farm.",
    false,
    function(valor)

        print(valor)

    end
)
```

### Parâmetros

| Parâmetro |
|------------|
| Nome |
| Descrição |
| Valor padrão |
| Callback |

---

# 🎚️ Slider

```lua
Principal:Slider(
    "Velocidade",
    16,
    100,
    16,
    function(valor)

        print(valor)

    end
)
```

### Parâmetros

| Parâmetro |
|------------|
| Nome |
| Valor mínimo |
| Valor máximo |
| Valor inicial |
| Callback |

---

# 📋 Dropdown

```lua
local Lista = Principal:Dropdown(
    "Selecionar Arma",
    {
        "Espada",
        "Arco",
        "Pistola"
    },
    "Espada",
    function(valor)

        print(valor)

    end
)
```

## Adicionar item

```lua
Lista:Add("Martelo")
```

## Limpar itens

```lua
Lista:Clear()
```

---

# ⌨️ Textbox

```lua
Principal:Textbox(
    "Nickname",
    "Digite aqui...",
    function(texto)

        print(texto)

    end
)
```

---

# 📝 Label

```lua
local Texto = Principal:Label("Olá Mundo!")
```

## Atualizar Label

```lua
Texto:Set("Novo Texto")
```

---

# ➖ Separador

```lua
Principal:Seperator("Configurações")
```

Cria um título para separar grupos de elementos.

---

# 📏 Linha

```lua
Principal:Line()
```

Cria uma linha horizontal para organizar a interface.

---

# 🔔 Alerta

```lua
Janela.Alert("Configuração salva com sucesso!")
```

---

# ✨ Alerta com Borda

```lua
Janela.AlertOutline("Script iniciado!")
```

---

# 👁️ Ocultar Interface

A interface pode ser ocultada de duas formas:

- Clicando no botão flutuante da VoidLib.
- Pressionando a tecla **Insert**.

---

# 📄 Exemplo Completo

```lua
_G.Theme = "Blue"

local VoidLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/VoidGrok/VoidLib/main/VoidLib.lua"))()

local Janela = VoidLib.Window("VoidLib Demo")

local Principal = Janela.Tab(
    "Principal",
    "rbxassetid://10734950309"
)

Principal:Label("Bem-vindo à VoidLib!")

Principal:Button("Executar", function()

    Janela.Alert("Botão pressionado!")

end)

Principal:Toggle(
    "Auto Farm",
    "Liga ou desliga.",
    false,
    function(valor)

        print(valor)

    end
)

Principal:Slider(
    "Velocidade",
    16,
    100,
    16,
    function(valor)

        print(valor)

    end
)

Principal:Textbox(
    "Nickname",
    "",
    function(texto)

        print(texto)

    end
)
```

---

# 📌 Estrutura da Biblioteca

```
VoidLib/
├── VoidLib.lua
├── README.md
└── EXAMPLE.lua
```

---

# 📜 Licença

Este projeto é de código aberto. Você pode utilizá-lo e modificá-lo livremente, mantendo os devidos créditos ao autor original.

---

# ❤️ Créditos

Desenvolvido por **VoidGrok**.

A VoidLib foi criada com foco em desempenho, simplicidade, aparência moderna e facilidade de integração para scripts Roblox.
