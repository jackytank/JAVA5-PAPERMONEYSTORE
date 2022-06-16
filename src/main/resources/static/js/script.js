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



function addProduct(id) {
    fetch('/cart/add/' + id)
        .then(function (res) {
            return res.text()
        }).then(function (html) {
            let parser = new DOMParser()
            let doc = parser.parseFromString(html, 'text/html')
            document.querySelector('#listProd').innerHTML = doc.documentElement.querySelector('#listProd').innerHTML
            document.querySelector('#tag-cart').innerHTML = doc.documentElement.querySelector('#tag-cart').innerHTML
        }).catch(error => {
            console.error('There has been a problem with your fetch operation:', error);
        });
}

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