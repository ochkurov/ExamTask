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
                field("No."; Rec."No.") { ApplicationArea = All; }
                field("Posting Date"; Rec."Posting Date") { ApplicationArea = All; }
                field("Period Begin"; Rec."Period Begin") { ApplicationArea = All; }
                field("Period End"; Rec."Period End") { ApplicationArea = All; }
                field(Status; Rec.Status) { ApplicationArea = All; }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(OpenDocument)
            {
                Caption = 'Open Document';
                ApplicationArea = All;
                Image = EditLines;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    PAGE.Run(PAGE::"Incentive Payment", Rec);
                end;
            }
        }
    }
}
