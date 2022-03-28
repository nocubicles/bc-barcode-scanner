Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('ScannerReady','');

function docReady(fn) {
    if (document.readyState === "complete"
        || document.readyState === "interactive") {
        setTimeout(fn, 1);
    } else {
        document.addEventListener("DOMContentLoaded", fn);
    }
}

function StartScanner() {
    docReady(function() {
        var controlAddIn = document.getElementById('controlAddIn');
        var placeholderdiv = document.createElement('div');
        placeholderdiv.setAttribute('id','reader');
        controlAddIn.appendChild(placeholderdiv);
    
        const html5QrCode = new Html5Qrcode("reader");
        const qrCodeSuccessCallback = (decodedText, decodedResult) => {
            Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('ScanComplete',[decodedText]);
            html5QrCode.stop().then((ignore) => {
              }).catch((err) => {
                console.log(err);
              });
        };
        const config = { fps: 10, rememberLastUsedCamera: false };

        html5QrCode.start({ facingMode: "environment" }, config, qrCodeSuccessCallback);
    })
}