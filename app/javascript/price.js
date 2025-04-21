function bindPriceEvent() {
  const priceInput = document.getElementById("item-price");
  if (!priceInput) return;

  priceInput.addEventListener("input", () => {
    const inputValue = parseInt(priceInput.value);

    if (!isNaN(inputValue)) {
      const tax = Math.floor(inputValue * 0.1);
      const profit = inputValue - tax;
      document.getElementById("add-tax-price").textContent = tax;
      document.getElementById("profit").textContent = profit;
    } else {
      document.getElementById("add-tax-price").textContent = 0;
      document.getElementById("profit").textContent = 0;
    }
  });
}

document.addEventListener("turbo:load", bindPriceEvent);
document.addEventListener("turbo:render", bindPriceEvent); 
