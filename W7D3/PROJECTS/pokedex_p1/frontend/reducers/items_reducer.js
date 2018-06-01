import { RECEIVE_SINGLE_POKEMON, RECEIVE_ALL_POKEMON} from '../actions/pokemon_actions';
//BUT THIS^ DOESNT WORK

// import { RECEIVE_SINGLE_POKEMON} from '../actions/pokemon_actions';
export const itemsReducer = (state = {}, action) => {
  // debugger
  switch(action.type){
    case RECEIVE_ALL_POKEMON:
      return state;
    case RECEIVE_SINGLE_POKEMON:
      return({
        items: 'replace me with action.pokemon'
      }); //not sure if this is right, wouldn't we just put the recieved pokemon in a special place in the state?
    default:
      return state;
  }
};
