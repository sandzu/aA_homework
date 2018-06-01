import React from 'react';

import {Link} from 'react-router-dom'

export const PokemonIndexItem = ({ pokemon }) => {
  let linkurl = "/pokemon/" + pokemon.id;
  return(
  <li>
    <Link to={linkurl}>

      {pokemon.name}
      <img src = {pokemon.image_url}></img>
    </Link>

  </li>);
}



//
// export const PokemonIndexItem = ({pokemon}) => {
//   return(
//
//     <li>
//       {pokemon.name}
//       <img src = {pokemon.image_url}></img>
//     </li>
//   );
// }
