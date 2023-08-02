window.addEventListener("turbo:load", () => {
  if ( document.getElementById('item-price')!= null) {
    // 読み込まれたページに'item-price'というid名の要素があれば発火
    const priceInput = document.getElementById("item-price");
    const feeDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

// priceが入力されたらイベント発火
    priceInput.addEventListener("input", () => {
      const inputValue = document.getElementById("item-price").value;
      //販売手数料の計算（表示の為カンマ有り）
        let tax = Math.floor(inputValue * 0.1).toLocaleString(); 
        feeDom.innerHTML = tax ;
      //販売手数料の計算（利益計算の為カンマ無し）
        let tax1 =  Math.floor(inputValue * 0.1)
        profitDom.innerHTML =  Math.ceil(inputValue - tax1 ).toLocaleString();
    })
  }
});