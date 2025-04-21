// ページが読み込まれた後に実行されるようにする
document.addEventListener('DOMContentLoaded', () => {
  // 価格の入力欄を取得
  const priceInput = document.getElementById("item-price");
  
  // 手数料と利益を表示する場所を取得
  const feeOutput = document.getElementById("add-tax-price");
  const profitOutput = document.getElementById("profit");

  // 価格入力欄がある場合にのみ実行
  if (priceInput) {
    priceInput.addEventListener("input", () => {
      // 入力された価格を取得
      const price = parseInt(priceInput.value);

      // 入力が数値の場合のみ計算を実行
      if (!isNaN(price)) {
        const fee = Math.floor(price * 0.1);       // 手数料（10%）
        const profit = price - fee;                // 利益

        // 計算結果を表示
        feeOutput.textContent = fee;
        profitOutput.textContent = profit;
      } else {
        // 数値以外が入力された場合は0を表示
        feeOutput.textContent = 0;
        profitOutput.textContent = 0;
      }
    });
  }
});
