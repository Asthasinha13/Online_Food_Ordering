export function cartTotal (state) {
  if (state.cartItems.length === 0) {
    return 0
  } else {
    return state.cartItems.reduce((total, item) => {
      return total + (item.price * item.quantity)
    }, 0)
  }
}
