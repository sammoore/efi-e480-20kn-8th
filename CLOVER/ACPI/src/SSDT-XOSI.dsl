// This SSDT can be used instead of an "OS Check Fix" patch to
// simulate a version of Windows for Darwin
//
// To use this SSDT, you must compile it as AML, place in ACPI/patched, add
// to config.plist/ACPI/SortedOrder, and use the "change _OSI to XOSI"
// patch in config.plist/ACPI/DSDT/Patches (see config_patches.plist)
//

DefinitionBlock ("", "SSDT", 2, "hack", "_XOSI", 0)
{
    External (RMDT, DeviceObj)
    External (RMDT.PUSH, MethodObj)
    External (RMDT.P1, MethodObj)
    External (RMDT.P2, MethodObj)
    External (RMDT.P3, MethodObj)
    External (RMDT.P4, MethodObj)
    External (RMDT.P5, MethodObj)
    External (RMDT.P6, MethodObj)
    External (RMDT.P7, MethodObj)

    // Take a simpler approach to OSI patch than the original, more closely resembling
    // the direct DSDT patches that replace checks for _OSI ("Windows VER")
    Method(XOSI, 1)
    {
        \RMDT.P2 ("XOSI call", Arg0)

        If (Arg0 == "Windows 2012")
        {
               Local0 = \_OSI("Darwin")
        }
        Else
        {
            Local0 = \_OSI(Arg0)
        }
        
        \RMDT.P2 ("XOSI returns", Local0)
        Return (Local0)
    }


}

