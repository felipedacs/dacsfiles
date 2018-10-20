var btnLubuntu = document.getElementById("btn-lubuntu");

btnLubuntu.addEventListener("click", function(){
    // estilização do btn
    btnLubuntu.classList.add('btn-active');
    btnLubuntu.value = "copied";

    // pega texto e transfere para textarea
    let code = document.getElementById("code-lubuntu").innerHTML;
    let textarea = document.getElementById("tacopy");
    textarea.innerHTML = code;
    //let textarea = document.getElementById("tacopy");

    // envia objeto para ser copiado
    clipBoard(textarea)

    // desfaz estilização
    setTimeout(function(){ 
        btnLubuntu.classList.remove('btn-active');
        btnLubuntu.value = "again?";
    }, 3000);

});

function clipBoard(textarea) {
    console.log(textarea) ;
    textarea.select();
    document.execCommand("copy");
}
