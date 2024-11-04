import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="products"
export default class extends Controller {
  static values = { size: String, product: Object }

  addToCart() {
    console.log("product: ", this.productValue)
    const cart = localStorage.getItem("cart")
    let cartArray = cart ? JSON.parse(cart) : []

    // Find if the item with the same id and size is already in the cart
    const foundIndex = cartArray.findIndex(
      (item) => item.id === this.productValue.id && item.size === this.sizeValue
    )

    if (foundIndex >= 0) {
      // If item is found in cart, increment quantity
      cartArray[foundIndex].quantity += 1
    } else {
      // Otherwise, add new item to cart array
      cartArray.push({
        id: this.productValue.id,
        name: this.productValue.name,
        price: this.productValue.price,
        size: this.sizeValue,
        quantity: 1
      })
    }

    // Save updated cart array to localStorage
    localStorage.setItem("cart", JSON.stringify(cartArray))
  }

  selectSize(e) {
    this.sizeValue = e.target.value
    const selectedSizeEl = document.getElementById("selected-size")
    selectedSizeEl.innerText = `Selected Size: ${this.sizeValue}`
  }
}
