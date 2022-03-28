controladdin "MW StartScanner"
{
    RequestedHeight = 600;
    MinimumHeight = 1;
    MaximumHeight = 600;
    RequestedWidth = 600;
    MinimumWidth = 1;
    MaximumWidth = 600;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;
    Scripts =
        'src/javascript/start.js',
        'https://unpkg.com/html5-qrcode';

    event ScannerReady()
    event ScanComplete(Result: Text)

    procedure StartScanner();
}