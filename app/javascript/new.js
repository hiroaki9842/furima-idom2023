window.addEventListener("turbo:load", () => {
  if ( document.getElementById('item-price')!= null) {
    // 読み込まれたページに'item-price'というid名の要素があれば発火
    const priceInput = document.getElementById("item-price");
    const feeDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

// priceに値が入力されたらイベント発火
    priceInput.addEventListener("input", () => {
      const inputValue = document.getElementById("item-price").value;
        let tax = Math.floor(inputValue * 0.1).toLocaleString(); 
        feeDom.innerHTML = tax ;
        profitDom.innerHTML = Math.ceil(inputValue - tax).toLocaleString();
    })
  }
});