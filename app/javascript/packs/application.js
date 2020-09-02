// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

require("bootstrap")
import "../stylesheets/application"
document.addEventListener("turbolinks:load", ()=>{
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
        $('[data-toggle="popover"]').popover()
    })
})


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

require("trix")
require("@rails/actiontext")
document.addEventListener("trix-file-accept", (e)=>{
    e.preventDefault();
});

document.addEventListener("ajax:success", (e)=>{
    var detail = e.detail;
    var data = detail[0], status = detail[1], xhr = detail[2];
    let shoeFormModal = document.querySelector("#shoeFormModal");

    if(shoeFormModal && status === "OK") {
        $('#shoeFormModal').modal('hide');
    }
});