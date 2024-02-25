import requests
import random

def get_random_pokemon():
    # Get the total number of Pokemon
    response = requests.get('https://pokeapi.co/api/v2/pokemon')
    if response.status_code == 200:
        count = response.json()['count']
        
        # Generate a random number within the range
        random_id = random.randint(1, count)
        
        # Fetch details about the randomly selected Pokemon
        pokemon_response = requests.get(f'https://pokeapi.co/api/v2/pokemon/{random_id}')
        if pokemon_response.status_code == 200:
            pokemon_name = pokemon_response.json()['name']
            return pokemon_name
        else:
            return "Error fetching Pokémon details."
    else:
        return "Error accessing PokéAPI."

# Example usage
random_pokemon_name = get_random_pokemon()
print(random_pokemon_name)
