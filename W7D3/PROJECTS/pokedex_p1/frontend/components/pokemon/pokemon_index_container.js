import { connect } from 'react-redux';
import {requestAllPokemon} from '../../actions/pokemon_actions';
import {selectAllPokemon} from '../../reducers/selectors';
import pokemonIndex from './pokemon_index';
// debugger
console.log(pokemonIndex);

const mapStateToProps = state => ({
  pokemon: selectAllPokemon(state)

});

const mapDispatchToProps = () => ({
  requestAllPokemon: () => dispatch(requestAllPokemon())
});


export default connect(
  mapStateToProps,
  mapDispatchToProps
)(pokemonIndex);
