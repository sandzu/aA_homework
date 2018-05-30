import React from 'react';
import ReactDOM from 'react-dom';
// import configureStore from './store/store';
import Root from './components/root';
import {configureStore} from "./store/store";
// import { fetchSearchGiphys  } from './util/api_util';
import { fetchSearchGiphys, REQUEST_SEARCH_GIPHYS, recieveSearchGiphys, RECEIVE_SEARCH_GIPHYS} from './actions/giphy_actions';

document.addEventListener('DOMContentLoaded', ()=>{
  const root = document.getElementById('root');
  const store = configureStore();
  window.fetchSearchGiphys = fetchSearchGiphys;
  window.receiveSearchGiphys = recieveSearchGiphys;
  window.store = store;
  // window.fetchSearchGiphys = fetchSearchGiphys ;
  ReactDOM.render(<h1>root</h1>, root);
});
