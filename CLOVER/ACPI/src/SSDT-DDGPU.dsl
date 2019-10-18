// Credit: RehabMan
// Taken from: https://github.com/RehabMan/OS-X-Clover-Laptop-Config/blob/75a574b66585339f720edca2710a1267908ba489/hotpatch/SSDT-DDGPU.dsl
// Changelog:
//   - move EC related _OFF functionality to EC._REG via override
// ====

// For disabling the discrete GPU

#ifndef NO_DEFINITIONBLOCK
DefinitionBlock("", "SSDT", 2, "hack", "_DDGPU", 0)
{
#endif
    External(_SB.PCI0.LPCB.EC, DeviceObj)
    External(H8DR, IntObj)
    External(_SB.PCI0.HGOF, MethodObj)
    External(_SB.PCI0.RP01.PEGP, DeviceObj)
    // Note: The _OFF path should be customized to correspond to your native ACPI
    // the two paths provided here should be considered examples only
    // it is best to edit the code such that only the single _OFF path that your ACPI
    // uses is included.
    External(_SB.PCI0.PEG0.PEGP._OFF, MethodObj)
    External(_SB.PCI0.PEGP.DGFX._OFF, MethodObj)

    Scope (\_SB.PCI0.LPCB.EC)
    {
        Method (_REG, 2, NotSerialized)  // _REG: Region Availability
        {
            If (LEqual (Arg0, 0x03))
            {
                Store (Arg1, \H8DR)
            }
            
            If (LAnd (LEqual (Arg0, 3), LEqual (Arg1, 1)))
            {
                \_SB.PCI0.HGOF (0x01)
            }
        }
    }
    
    Scope (\_SB.PCI0.RP01.PEGP)
    {
        Method(_OFF, 0, Serialized)
        {
            Notify (\_SB.PCI0.RP01, 0x00)
            Return (Zero)
        }
    }

    Device(RMD1)
    {
        Name(_HID, "RMD10000")
        Method(_INI)
        {
            // disable discrete graphics (Nvidia/Radeon) if it is present
            \_SB.PCI0.RP01.PEGP._OFF()
        }
    }
#ifndef NO_DEFINITIONBLOCK
}
#endif
//EOF
