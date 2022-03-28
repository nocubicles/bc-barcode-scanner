page 50100 "MW Scanner"
{
    PageType = CardPart;
    SourceTable = "Purchase Header";
    layout
    {
        area(Content)
        {
            usercontrol(StartScanner; "MW StartScanner")
            {
                ApplicationArea = All;
                trigger ScannerReady()

                begin
                    CurrPage.StartScanner.StartScanner();
                end;

                trigger ScanComplete(Result: Text)
                var
                    PurchLine: Record "Purchase Line";
                    Item: Record Item;
                    ItemFoundMessage: Label 'Item with GTIN %1 found from PO. Ordered Quantity is: %2.';
                    ItemNotFoundMessage: Label 'Sorry, item with GTIN %1 not found on this PO.';
                begin
                    Item.SetRange(GTIN, Result);

                    if Item.FindFirst() then begin
                        PurchLine.SetRange("Document No.", Rec."No.");
                        PurchLine.SetRange("Document Type", Rec."Document Type");
                        PurchLine.SetRange("No.", Item."No.");
                        if PurchLine.FindFirst() then
                            Message(ItemFoundMessage, Result, Format(PurchLine.Quantity));
                    end else
                        Message(ItemNotFoundMessage, Result);

                    CurrPage.Close();
                end;
            }
        }
    }
}