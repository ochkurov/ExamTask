page 50125 "Incentive Payment List"
{
    PageType = List;
    SourceTable = "Incentive Payment Header";
    Caption = 'Incentive Payments';
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.") { }
                field("SalesPerson"; Rec.SalesPerson) { }
                field("Posting Date"; Rec."Posting Date") { }
                field("Period Begin"; Rec."Period Begin") { }
                field("Period End"; Rec."Period End") { }
                field(Status; Rec.Status) { }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(CreateDocument)
            {
                Caption = 'Create Document';
                Image = EditLines;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    NewPayment: Record "Incentive Payment Header";
                begin
                    NewPayment.Init();
                    PAGE.Run(PAGE::"Incentive Payment", NewPayment);
                end;
            }
        }
    }
}
