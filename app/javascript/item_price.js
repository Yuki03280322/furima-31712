if(location.pathname === "/items/new" || location.pathname === "/items" || document.URL.match(/edit/)){
  function itemPrice() {
    const priceInput = document.getElementById("item-price");
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      const addTaxDom = document.getElementById("add-tax-price");
      addTaxDom.innerHTML = Math.floor(inputValue / 10);
      const addProfitDom = document.getElementById("profit");
      addProfitDom.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML);
    })
  }
  window.addEventListener("load", itemPrice);
}
