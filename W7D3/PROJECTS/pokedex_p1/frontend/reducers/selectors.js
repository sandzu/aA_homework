
import values from 'lodash/values';
// export const selectAllPokemon=(state) =>{
//   return values(state.entities.pokemon);
// };

export const selectAllPokemon = state => values(state.entities.pokemon.pokemon);
