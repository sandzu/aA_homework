import React from 'react';
import { Provider } from 'react-redux';
import PokemonIndexContainer from './components/pokemon/pokemon_index_container'

const Root = ({ store }) => (
  <Provider store={store}>
    < PokemonIndexContainer />
  </Provider>
);

// const Root = ({ store }) => (
//   <Provider store={store}>
//     <h1>rooot</h1>
//   </Provider>
// );

export default Root;
