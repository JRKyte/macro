// This may die if used anywhere other than latest chrome. Works for now.

window.onload = function(){

  var modal = document.getElementById('modalWindow');
  var modalTrigger = document.getElementById('modalTrigger');
  var closeModal = document.getElementsByClassName('closeModal')[0];

  modalTrigger.onclick = function() {
    modal.style.display = "flex";
  }

  closeModal.onclick = function() {
    modal.style.display = "none";
  }

  window.onclick = function(event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  }

};
