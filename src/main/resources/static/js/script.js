// if ("${param.message}" != "") {
//     alert("Message: ${param.message}");
//     return
// }
// if ("${param.error}" != "") {
//     alert("${param.error}");
//     return
// }
// if ("${message}" != "") {
//     alert("Message: ${message}");
//     return
// }

// Example starter JavaScript for disabling form submissions if there are invalid fields
(function () {
    'use strict'

    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.querySelectorAll('.needs-validation')

    // Loop over them and prevent submission
    Array.prototype.slice.call(forms)
        .forEach(function (form) {
            form.addEventListener('submit', function (event) {
                if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                }

                form.classList.add('was-validated')
            }, false)
        })
})()

// function addProduct(id) {
//     fetch('/cart/add/' + id)
//         .then(function (res) {
//             return res.text()
//         }).then(function (html) {
//             let parser = new DOMParser()
//             let doc = parser.parseFromString(html, 'text/html')
//             document.querySelector('#listProd').innerHTML = doc.documentElement.querySelector('#listProd').innerHTML
//             document.querySelector('#tag-cart').innerHTML = doc.documentElement.querySelector('#tag-cart').innerHTML
//         }).catch(error => {
//             console.error('There has been a problem with your fetch operation:', error);
//         });
// }

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#imageResult').attr('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
    }
}

$(function () {
    $('#upload').on('change', function () {
        readURL(input);
    });
});
var input = document.getElementById('upload');
var infoArea = document.getElementById('upload-label');

input.addEventListener('change', showFileName);
function showFileName(event) {
    var input = event.srcElement;
    var fileName = input.files[0].name;
    infoArea.textContent = 'File name: ' + fileName;
}