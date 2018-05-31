// import React from 'react';
// import ReactDOM from 'react-dom';
//
// document.addEventListener("DOMContentLoaded",()=>{
//   const rootEl = document.getElementById('root');
//   ReactDOM.render(<h1>I AM POKEDEX</h1>, rootEl);
// });

import React from 'react';
import ReactDOM from 'react-dom';
import { fetchAllPokemon } from './util/api_util';
import { RECEIVE_ALL_POKEMON, receiveAllPokemon, REQUEST_ALL_POKEMON, requestAllPokemon} from './actions/pokemon_actions';
import {selectAllPokemon} from './reducers/selectors';
import {configureStore} from './store/store';

import Root from './root';


document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  const rootEl = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, rootEl);
});
