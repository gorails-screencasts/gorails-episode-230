document.addEventListener("turbolinks:load", function() {
  setTimeout(function() {
    document.querySelector("[data-behavior='undo-link']").remove()
  }, 20000);
});
