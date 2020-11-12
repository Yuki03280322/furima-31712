function salesProfit() {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const itemTax = Math.floor(inputValue / 10);
    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = Math.floor(inputValue - itemTax);
  })
}

window.addEventListener("load", salesProfit);