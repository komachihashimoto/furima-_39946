const priceInput = document.getElementById("item-price");
if (priceInput) {
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor( priceInput.value * 0.1 );
    const salesProfit = document.getElementById("profit");
    salesProfit.innerHTML = Math.floor( priceInput.value - (priceInput.value * 0.1));
  })
}