codeunit 50124 SalespersonBonusCalculate
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnAfterSalesInvLineInsert, '', false, false)]
    local procedure OnAfterSalesInvLineInsert(
         var SalesInvLine: Record "Sales Invoice Line";
            SalesInvHeader: Record "Sales Invoice Header";
            SalesLine: Record "Sales Line"
    )
    var
        IncentiveSetup: Record "Incentive Setup";
        Salesperson: Record "Salesperson/Purchaser";
        IncentiveLedger: Record "Incentive Ledger Entry";
        IncentivePercent: Decimal;
        IncentiveAmount: Decimal;
    begin

    end;
}