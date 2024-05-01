const priceInput = document.getElementById("item-price");
const salesFeeElement = document.getElementById("add-tax-price");
const profitElement = document.getElementById("profit");

priceInput.addEventListener("input", () => {
  const price = parseInt(priceInput.value, 10) || 0;
  const salesFee = Math.floor(price * 0.1); // 販売手数料（10%）
  const profit = price - salesFee; // 販売利益
  salesFeeElement.textContent = salesFee.toLocaleString()  ;
  profitElement.textContent = profit.toLocaleString()  ;
});