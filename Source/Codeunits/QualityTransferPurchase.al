codeunit 50117 "Quality Transfer Purchase"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", OnBeforePurchRcptLineInsert, '', true, true)]
    local procedure OnBeforePurchRcptLineInsert(
        var PurchRcptLine: Record "Purch. Rcpt. Line";
        PurchLine: Record "Purchase Line"
    )
    begin
        PurchRcptLine.Validate("Quality", PurchLine.Quality);
    end;
}