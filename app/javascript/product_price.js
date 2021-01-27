window.addEventListener('load', () => {
  console.log("OK");
})

const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  console.log("イベント発火");
})