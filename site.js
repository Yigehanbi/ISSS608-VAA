(() => {
  if ("ontouchstart" in window) return;
  if (window.matchMedia("(prefers-reduced-motion)").matches) return;

  let lastTime = 0;

  function attachSparkles() {
    document.addEventListener("mousemove", (e) => {
      const now = performance.now();
      if (now - lastTime < 18) return;
      lastTime = now;

      const sparkle = document.createElement("div");
      sparkle.className = "sparkle";
      sparkle.style.left = e.pageX + "px";
      sparkle.style.top = e.pageY + "px";
      
      const size = Math.random() * 48 + 36;
      sparkle.style.width = size + "px";
      sparkle.style.height = size + "px";

      document.body.appendChild(sparkle);

      setTimeout(() => sparkle.remove(), 300);
    });
  }

  window.addEventListener("DOMContentLoaded", attachSparkles);
  document.addEventListener("quarto:page-changed", attachSparkles);
})();
