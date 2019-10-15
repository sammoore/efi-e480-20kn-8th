DefinitionBlock ("", "SSDT", 2, "hack", "_MEDIA", 0x0)
{
    External (_SB_.PCI0.LPCB.EC, DeviceObj)
    External (_SB_.PCI0.LPCB.KBD, DeviceObj)

    Scope (\_SB.PCI0.LPCB.EC)
    {
        Method (_Q14, 0, NotSerialized)  // _Qxx: EC Query
        {
            // Brightness Up
            Notify(\_SB.PCI0.LPCB.KBD, 0x0206)
            Notify(\_SB.PCI0.LPCB.KBD, 0x0286)
        }

        Method (_Q15, 0, NotSerialized)  // _Qxx: EC Query
        {
            // Brightness Down
            Notify(\_SB.PCI0.LPCB.KBD, 0x0205)
            Notify(\_SB.PCI0.LPCB.KBD, 0x0285)
        }
    }
}