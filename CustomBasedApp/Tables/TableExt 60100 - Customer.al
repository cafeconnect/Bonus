tableextension 60100 "MNB Customer" extends Customer
{
    fields
    {
        field(60100; "MNB Bonuses"; Integer)
        {
            Caption = 'Bonuses';
            FieldClass = FlowField;
            CalcFormula = count("MNB BonusHeader" where("Customer No." = field("No.")));
            Editable = false;
        }
        field(60101; "Customer County"; Enum Counties)
        {
            DataClassification = CustomerContent;
        }
    }
    var
        BonusExistsErr: Label 'You can not delete Customer %1 because there is at least one Bonus assigned.';

    trigger OnBeforeDelete()
    var
        MNBBonusHeader: Record "MNB BonusHeader";
    begin
        MNBBonusHeader.SetRange("Customer No.", "No.");
        if not MNBBonusHeader.IsEmpty() then
            Error(BonusExistsErr, "No.");
    end;
}


