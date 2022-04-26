pageextension 60101 CustomerPageExt extends "Customer Card"
{
    layout
    {
        addafter(City)
        {
            field("Customer County"; Rec."Customer County")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies bonus ending date.';
            }

        }
    }
}