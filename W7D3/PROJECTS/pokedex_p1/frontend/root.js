import React from 'react';
import { Provider } from 'react-redux';
import PokemonIndexContainer from './components/pokemon/pokemon_index_container'
import { HashRouter, Route } from 'react-router-dom';

const Root = ({ store }) => (
  <Provider store={store}>
    <HashRouter>

       <Route path="/" component={PokemonIndexContainer} />
    </HashRouter>
  </Provider>
);

// const Root = ({ store }) => (
//   <Provider store={store}>
//     <h1>rooot</h1>
//   </Provider>
// );

export default Root;
