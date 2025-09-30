tableextension 50122 SalesPersonExt extends "Salesperson/Purchaser"
{
    fields
    {
        field(50100; "Salary Amount"; Decimal)
        {
            Caption = 'Salary Amount';
            DataClassification = CustomerContent;
        }
        field(50102; "Incentive Amount"; Decimal)
        {
            Caption = 'Incentive Amount';
            FieldClass = FlowField;
            CalcFormula = sum("Incentive Ledger Entry".Amount where("Salesperson Code" = field(Code)));
            Editable = false;
        }
    }
}