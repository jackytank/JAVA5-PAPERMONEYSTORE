if ("${message}" != "") alert("${message}");
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