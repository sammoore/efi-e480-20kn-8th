// Merge of 2 DSLs which both defined _SB.PCI0.LPCB.KBD.RMCF
// ====
// Credit: RehabMan
// taken from: https://raw.githubusercontent.com/RehabMan/OS-X-Voodoo-PS2-Controller/e5a4fbfa3aab5a352fe6cfe2dc7d9c48a5f1c323/SSDT-Thinkpad_Clickpad.dsl
//
// Changelog:
//   - modified to match E480/20KN LPCB.KBD
// ====
// Credit: RehabMan
// taken from: https://raw.githubusercontent.com/RehabMan/OS-X-Voodoo-PS2-Controller/8a4bbfad6f4e374eb04ef9727b737b7940a81ec5/SSDT-Swap-LeftControlCapsLock.dsl
//
// Changelog:
//   - modified to match ThinkPad LPCB.KBD path
//   - removed left control -> caps lock mapping
// ====
DefinitionBlock ("", "SSDT", 2, "hack", "_KBD", 0)
{
    // Change _SB.PCI0.LPC.KBD if your PS2 keyboard is at a different ACPI path
    External(_SB.PCI0.LPCB.KBD, DeviceObj)
    Scope(_SB.PCI0.LPCB.KBD)
    {
        // Select specific configuration in VoodooPS2Trackpad.kext
        Method(_DSM, 4)
        {
            If (!Arg2) { Return (Buffer() { 0x03 } ) }
            Return (Package()
            {
                "RM,oem-id", "LENOVO",
                "RM,oem-table-id", "Thinkpad_ClickPad",
            })
        }
        // Overrides (the example data here is default in the Info.plist)
        Name(RMCF, Package()
        {
            "Synaptics TouchPad", Package()
            {
                "BogusDeltaThreshX", 800,
                "BogusDeltaThreshY", 800,
                "Clicking", ">y",
                "DragLockTempMask", 0x40004,
                "DynamicEWMode", ">n",
                "FakeMiddleButton", ">n",
                "HWResetOnStart", ">y",
                //"ForcePassThrough", ">y",
                //"SkipPassThrough", ">y",
                "PalmNoAction When Typing", ">y",
                "ScrollResolution", 800,
                "SmoothInput", ">y",
                "UnsmoothInput", ">y",
                "Thinkpad", ">y",
                "EdgeBottom", 0,
                "FingerZ", 30,
                "MaxTapTime", 100000000,
                "MouseMultiplierX", 2,
                "MouseMultiplierY", 2,
                "MouseScrollMultiplierX", 2,
                "MouseScrollMultiplierY", 2,
                //"TrackpointScrollYMultiplier", 1, //Change this value to 0xFFFF in order to inverse the vertical scroll direction of the Trackpoint when holding the middle mouse button.
                //"TrackpointScrollXMultiplier", 1, //Change this value to 0xFFFF in order to inverse the horizontal scroll direction of the Trackpoint when holding the middle mouse button.
            },
            "Keyboard", Package()
            {
                "Custom ADB Map", Package()
                {
                    Package(){},
                    "3a=3b",    // 3a is PS2 for capslock, 3b is ADB for left control (normal map is 3a=39)
//                  "1d=39",    // 1d is PS2 for left control, 39 is ADB for caps lock (normal map is 1d=3b)
                },
            },
        })
    }
}
//EOF
