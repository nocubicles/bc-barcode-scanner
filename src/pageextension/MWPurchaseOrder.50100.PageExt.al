pageextension 50100 "MW Purchase Order" extends "Purchase Order"
{
    actions
    {
        addlast(processing)
        {
            action("MW ScanItem")
            {
                ApplicationArea = All;
                Caption = 'Scan Item';
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    PurchHeader: Record "Purchase Header";
                    ScannerPage: page "MW Scanner";
                begin
                    PurchHeader.SetRange("No.", Rec."No.");
                    PurchHeader.SetRange("Document Type", Rec."Document Type");
                    ScannerPage.SetTableView(PurchHeader);
                    if ScannerPage.RunModal() = Action::None then
                        ScannerPage.Close();
                end;
            }
        }
    }
}