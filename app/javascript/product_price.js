window.addEventListener('load', () => {

//金額を入力した数値をpriceInputという変数に格納する
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

  const addTaxDom = document.getElementById("add-tax-price");
  const taxPrice = Math.floor(inputValue*(0.1));
  addTaxDom.innerHTML = taxPrice.toLocaleString();
  
  const ProfitDom = document.getElementById("profit");
  const profit = Math.floor(inputValue*(0.9));
  ProfitDom.innerHTML = profit.toLocaleString();

  })
})