function price_calculation() {
  const price = document.getElementById("item-price");
  const add_tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  price.addEventListener('input', function () {
    const inputPrice = price.value;
    const Fee = inputPrice / 10
    parseInt(Fee, 10)
    const value = parseInt(Fee, 10)
    add_tax.innerHTML = ("parseInt", value);
    profit.innerHTML = inputPrice - add_tax.innerHTML;
  })
}

window.addEventListener('load', price_calculation);
