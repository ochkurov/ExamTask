report 50130 "Incentive Payment Report"
{
    Caption = 'Incentive Payment Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem(Ledger; "Incentive Ledger Entry")
        {
            DataItemTableView = sorting("Entry No.") where("Document Type" = const("Document Type Enum"::"Sales Invoice"));
            RequestFilterFields = "Posting Date", "Salesperson Code";

            column(SalespersonCode; "Salesperson Code")
            {

            }
            column(DocumentNo; "Document No.")
            {

            }
            column(PostingDate; "Posting Date")
            {

            }
            column(Amount; Amount)
            {

            }
            trigger OnPreDataItem()
            begin
                if (PeriodStart <> 0D) and (PeriodEnd <> 0D) then begin
                    if (PeriodEnd < PeriodStart) then
                        Error('End date %1 cannot be earlier than start date %2.', PeriodEnd, PeriodStart);
                    SetRange("Posting Date", PeriodStart, PeriodEnd);
                end
                else
                    Message('Dates are not selected — the report will show all records without a date filter.');
            end;

            trigger OnAfterGetRecord()
            begin
                TotalBonus += Amount;
            end;

            trigger OnPostDataItem()
            var
                Salesperson: Record "Salesperson/Purchaser";
            begin
                if Salesperson.Get("Salesperson Code") then
                    SalaryAmount := Salesperson."Salary Amount";
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Filters)
                {
                    field(PeriodStart; PeriodStart)
                    {
                        ApplicationArea = All;
                        Caption = 'Period Start';
                    }
                    field(PeriodEnd; PeriodEnd)
                    {
                        ApplicationArea = All;
                        Caption = 'Period End';
                    }
                }
            }
        }
    }


    trigger OnPostReport()
    begin
        Message('Total Bonus : %1 Salary: %2 TotalSalary: %3', TotalBonus, SalaryAmount, TotalBonus + SalaryAmount);
    end;

    var
        PeriodStart: Date;
        PeriodEnd: Date;
        TotalBonus: Decimal;
        SalaryAmount: Decimal;
}