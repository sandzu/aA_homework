import React, {Component} from 'react';


class pokemonIndex extends Component{
  // constructor(props){
  //   super(props);
  //   this.state = {
  //     pokemon: []
  //   };
  // }

  componentDidMount(){
    this.props.requestAllPokemon();
  }

  render(){
    const { pokemon } = this.props;

    return(
      <ul>
        {pokemon.map((poke) =>(
          <li>
            {poke.name}
            <img src = {poke.image_url} width="50" height="50"></img>
          </li>
        ))}

      </ul>
    );
  }
}


export default pokemonIndex;
