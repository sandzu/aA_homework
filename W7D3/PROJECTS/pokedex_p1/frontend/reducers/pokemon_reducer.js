import {RECEIVE_ALL_POKEMON} from '../actions/pokemon_actions';

export const pokemonReducer = (state = {}, action) => {
  switch(action.type){
    case RECEIVE_ALL_POKEMON:
      return ({
        pokemon: action.pokemon
      });
    // case RECEIVE_SINGLE_POKEMON:
    //   return({
    //     pokemon: action.pokemon
    //   }); //not sure if this is right, wouldn't we just put the recieved pokemon in a special place in the state?
    default:
      return state;
  }
};
