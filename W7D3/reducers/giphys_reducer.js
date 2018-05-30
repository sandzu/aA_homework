import { fetchSearchGiphys, REQUEST_SEARCH_GIPHYS, RECEIVE_SEARCH_GIPHYS, recieveSearchGiphys} from '../actions/giphy_actions';

export const giphysReducer = (state=[], action)=>{
  if(action.type === RECEIVE_SEARCH_GIPHYS){
    return action.giphys;
  }
  else{
    return state;
  }

};
