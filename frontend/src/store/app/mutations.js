import { LocalStorage } from 'quasar'


export function init (state) {
  state.frontendLogin = LocalStorage.getItem('frontendLogin')
  state.frontendUser = LocalStorage.getItem('frontendUser')
  const cartItems = LocalStorage.getItem('cartItems')
  state.cartItems = cartItems === null ? [] : cartItems
  console.log(state.frontendLogin, state.frontendUser, state.cartItems)
}
export function setFrontendLogin (state, payload) {
  state.frontendLogin = payload.login;
  state.frontendUser = payload.user;
  LocalStorage.set('frontendLogin', payload.login)
  LocalStorage.set('frontendUser', payload.user)
}

export function setFrontendLogout (state, payload) {
  state.frontendLogin = false;
  state.frontendUser = null;
  LocalStorage.remove('frontendLogin')
  LocalStorage.remove('frontendUser')
}

export function setBackendLogin (state, payload) {
  state.backendLogin = payload.login;
  state.backendUser = payload.user;
  LocalStorage.set('backendLogin', payload.login)
  LocalStorage.set('backendUser', payload.user)
}

export function addCartItem (state, payload) {
  state.cartItems.push(payload.item)
  LocalStorage.set('cartItems', state.cartItems)
}


export function emptyCart (state, payload) {
  state.cartItems.splice(0, state.cartItems.length)
  LocalStorage.remove('cartItems')
}


export function increaseQuantity (state, payload) {
  const item = state.cartItems.find(item => item.id === payload.id)
  item.quantity = item.quantity + 1
}


export function decreaseQuantity (state, payload) {
  const cartItem = state.cartItems.find(item => item.id === payload.id)
  if (cartItem.quantity === 1) {
    const index = state.cartItems.findIndex(item => item.id === payload.id)
    console.log(index)
    state.cartItems.splice(index, 1)
    return
  }
  cartItem.quantity = cartItem.quantity - 1

}
