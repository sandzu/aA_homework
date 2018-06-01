import React, {Component} from 'react';
import {PokemonIndexItem} from './pokemon_index_item';

class pokemonIndex extends Component{
  // constructor(props){
  //   super(props);
  //   this.state = {
  //     pokemon: []
  //   };
  // }

  componentDidMount(){
    // debugger
    this.props.requestAllPokemon();
  }

  render(){
    var { pokemon } = this.props;
    function shuffle(a) {
        var j, x, i;
        for (i = a.length - 1; i > 0; i--) {
            j = Math.floor(Math.random() * (i + 1));
            x = a[i];
            a[i] = a[j];
            a[j] = x;
        }
        return a;
    }
    pokemon = shuffle(pokemon);
    return(
      <ul>
        {pokemon.map( poke => <PokemonIndexItem pokemon={poke} />  )}
      </ul>
    );
    // return(
    //   <ul>
    //     {pokemon.map((poke) =>(
    //       <li>
    //         {poke.name}
    //         <img src = {poke.image_url} width="50" height="50"></img>
    //       </li>
    //     ))}
    //
    //   </ul>
    // );
  }
}


export default pokemonIndex;
