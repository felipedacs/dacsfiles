var btnLubuntu = document.getElementById("btn-lubuntu");

btnLubuntu.addEventListener("click", function(){
    btnLubuntu.classList.add('btn-active');
    btnLubuntu.value = "copied";
    let code = document.getElementById("code-lubuntu").innerHTML;
    document.getElementById("tacopy").innerHTML = code;
    let textarea = document.getElementById("tacopy");
    clipBoard(textarea)
});

function clipBoard(textarea) {
    textarea.select();
    document.execCommand("copy");
}
