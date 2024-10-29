<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pokemon.aspx.cs" Inherits="Examane_Roger_A.Vista_Pokemon.Pokemon" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Pokémon</title>
    <style>
        body {
            font-family: 'Times New Roman', Times, serif;
            margin: 0;
            padding: 40px;
            background-color: #00ffff;
        }

        .contenedor-pokemon {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }

        .carta-pokemon {
            width: 250px;
            height: 250px;
            background-color: #00ffff;
            border: 2px solid #ddd;
            border-radius: 50%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            margin: 20px;
            position: relative;
            transition: transform 0.5s;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 10px;
        }

            .carta-pokemon:hover {
                transform: translateY(-7px);
            }

        .imagen-pokemon {
            width: 100%;
            height: 60%;
            object-fit: cover;
        }

        .nombre-pokemon {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
            text-align: center;
            color: #333;
        }
    </style>
</head>
<body>
    <h1 style="text-align: center;">Pokemones</h1>
    <div class="buscador-container">
        <input type="text" class="buscador-input" placeholder="Buscar Pokémon..." id="buscador">
    </div>
    <div class="contenedor-pokemon" id="contenedor-pokemon"></div>

    <script>
        document.addEventListener("DOMContentLoaded", () => {
            const contenedorPokemon = document.getElementById('contenedor-pokemon');
            const buscadorInput = document.getElementById('buscador');

            fetchPokemonData('https://pokeapi.co/api/v2/pokemon/?limit=20')
                .then(data => {
                    data.forEach((pokemon, index) => {
                        crearCartaPokemon(pokemon, contenedorPokemon, index + 1);
                    });


                    buscadorInput.addEventListener('input', () => {
                        const busqueda = buscadorInput.value.toLowerCase();
                        const cartasPokemon = contenedorPokemon.querySelectorAll('.carta-pokemon');

                        cartasPokemon.forEach(carta => {
                            const nombrePokemon = carta.querySelector('.nombre-pokemon').textContent.toLowerCase();
                            if (nombrePokemon.includes(busqueda)) {
                                carta.style.display = 'block';
                            } else {
                                carta.style.display = 'none';
                            }
                        });
                    });
                })
                .catch(error => {
                    console.error('Error al obtener datos de Pokémon:', error);
                });
        });

        async function fetchPokemonData(url) {
            try {
                const response = await fetch(url);
                const data = await response.json();
                const pokemonData = await Promise.all(
                    data.results.map(async pokemon => {
                        const response = await fetch(pokemon.url);
                        return response.json();
                    })
                );
                return pokemonData;
            } catch (error) {
                throw new Error('Error al obtener datos de Pokémon');
            }
        }

        function crearCartaPokemon(pokemonData, contenedorPokemon, indiceColor) {
            const cartaPokemon = document.createElement('div');
            cartaPokemon.classList.add('carta-pokemon');


            const color = getColorByIndex(indiceColor);
            cartaPokemon.style.backgroundColor = color;

            const nombrePokemon = document.createElement('div');
            nombrePokemon.classList.add('nombre-pokemon');
            nombrePokemon.textContent = pokemonData.name.toUpperCase();
            cartaPokemon.appendChild(nombrePokemon);

            const imagenPokemon = document.createElement('img');
            imagenPokemon.classList.add('imagen-pokemon');
            imagenPokemon.src = pokemonData.sprites.front_default;
            imagenPokemon.alt = pokemonData.name;

            cartaPokemon.appendChild(imagenPokemon);

            contenedorPokemon.appendChild(cartaPokemon);
        }

        function getColorByIndex(indice) {
            const colores = ['#FFB6C1', '#87CEEB', '#FFD700', '#98FB98', '#FFA07A'];
            return colores[indice % colores.length];
        }
    </script>
</body>
</html>
